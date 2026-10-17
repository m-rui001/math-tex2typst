# D98 反推研究笔记：Kirchberg--Rørdam 字符判据

（第一人称反推。以下所有正文素材只来自 build\ 下的 .tex；我把自己放在"当年正在做这项研究的人"的位置上，从论文倒推背后的思维链。凡标注 [外部推断] 的句子是我上网查到的背景知识或我的猜测，不属于论文事实。）

## 一、元信息、取证边界与定理陈述抄录

队列行号 141。论文目录 E:\math\preprints\The-Kirchberg-Rordam-character-criterion-September-25-2026。我逐片读完了 build\ 下的九个 tex 分片（paper.tex、references.tex、sections\introduction.tex、sections\preliminaries.tex、sections\rw-criterion.tex、sections\tensor.tex、sections\dimension-drop.tex、sections\application.tex、figures\cone-support.tex），没有碰任何 PDF。

Lean 侧我按注册项（formalization.yaml 第 1002--1004 行）只读了 OAI/Analysis/CharacterCriterion/Main.lean、模块目录本身，以及 comparator json。书目条目在 formalization.yaml 第 712--714 行，只给了标题和 pdf 路径，我没有打开那个 pdf。模块里 Main.lean 的定理最终化约到 `StandardPrimeModel.presentation.character_criterion`，其脚手架在 Definitions.lean 第 2076--2112 行的 namespace 里，而 Z 代数本身是 Definitions.lean 第 2116 行 `JiangSu.Algebra`，一个以 size n=2^(7^n) 增长的维数下降归纳极限（见台账）。命名撞车的事我放在第十节专门处理。

先把定理陈述逐字抄下来，后面的反推都围绕它们。

论文开篇的定义（introduction.tex 第 5--9 行）：对非零幺元 C\*-代数 A 与 ℕ 上的自由超滤子 ω，
```
 A_\omega=\ell^\infty(\N,A)\big/ \{(a_n):\lim_{n\to\omega}\|a_n\|=0\},
 \qquad F_\omega(A)=A_\omega\cap A',
```
其中 A 通过对角像嵌入 A_\omega。character 是到 ℂ 的非零 \*-同态；幺元代数上自动幺元。主线三件套：

定理 1.1（thm:main，introduction.tex 第 37--44 行）逐字：
```
Let $A$ be a nonzero unital separable complex $C^*$-algebra, and let
$\omega$ be any free ultrafilter on $\N$. Then
 F_\omega(A)\text{ has no characters}
 \quad\Longleftrightarrow\quad A\cong A\otmin\Z.
```

定理 1.2（thm:finite，introduction.tex 第 51--62 行）逐字：
```
Let $D$ be a nonzero unital complex $C^*$-algebra without characters. There
is an integer $m\ge1$ and a unital $*$-homomorphism
 I(2,3)\longrightarrow D^{\otimes_{\max}m},
where
I(2,3)=\{f\in C([0,1],M_2\otimes M_3):
 f(0)\in M_2\otimes1_3,\ f(1)\in1_2\otimes M_3\}.
```
指数 m 依赖 D，结论是单同态，并非"该有限幂本身吸收 Z"，其像即便在同态带核的情况下仍 subhomogeneous 且无 character（introduction.tex 第 64--68 行）。

推论 1.3（cor:infinite-tensor，introduction.tex 第 70--79 行）逐字：对无 character 的非零幺元可分 D，
```
 B=D^{\otimes_{\min}\infty}
 :=\varinjlim_{n\ge1}
 \bigl(D^{\otimes_{\min}n},\,x\longmapsto x\otimes1_D\bigr).
```
则 B≅B⊗min Z，且 B 含一个幺元 Z 拷贝。摘要那句被截断的"contains a unital copy"到这里补全。

喂给整套构造的两个外部输入：Rørdam--Winter 判据（prop:rw，preliminaries.tex 第 46--54 行）逐字：
```
Let $B$ be a unital $C^*$-algebra. Suppose that $a_1,a_2\in B$ are
orthogonal positive contractions with $a_1=v^*v$, $a_2=vv^*$ for some
$v\in B$, and that, for some $\varepsilon>0$,
 1_B-a_1-a_2\precsim(a_1-\varepsilon)_+.
Then there is a unital $*$-homomorphism $I(2,3)\to B$.
```
Kirchberg--Rørdam 输入（prop:kr，preliminaries.tex 第 69--79 行）逐字两断言：其一 D⊂F_ω(A) 可分且含环境单位则对每个 m 有单同态 D^{⊗max m}→F_ω(A)；其二 A≅A⊗min Z 当且仅当 F_ω(A) 含一个同单位的可分 subhomogeneous 无 character 子代数。

## 二、常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| ω | ℕ 上自由超滤子，Lean 里编码为 hω:(ω:Filter ℕ)≤Filter.cofinite | introduction.tex:3; Main.lean:54 | A_ω、F_ω(A) 定义与 prop:kr(1) 的对角中心化 | 取主超滤子则 F_ω 沿该点求值给出 character，thm:main 两个方向同时塌 |
| m（finite 张量指数） | m≥1，依赖 D、无一致上界 | introduction.tex:53,65; application.tex:7 | 单同态 I(2,3)→D^{⊗max m} | 若强加一致界，被 tensor.tex:325 处 n,n' 依赖检测空间与桥族所破 |
| I(2,3) 的 2 与 3 | 端点纤维维数 2、3，内部 6 | introduction.tex:58-61; application.tex:50-51 | prop:rw 取 n=2；像的 subhomogeneous 界 | 换成别的 I(p,q) 时 rw-criterion.tex:228 的加权翻转失去秩 2 的 (1+F)/2 对称 |
| ε | 0<ε<1，RW 判据割线 | preliminaries.tex:49; rw-criterion.tex:118 | 1_B-a_1-a_2≼(a_1-ε)_+ | ε→0 使 q(0)=ε^(-1/2) 发散，rw-criterion.tex:124 的 s_2∈B 失界 |
| δ（exact-cut） | 任意 δ>0 | rw-criterion.tex:16 | z^*z=(a-δ)_+、zz^*∈Her(b) | δ 越过 η 使 δ-η≤0，rw-criterion.tex:45 的 \lVert z-z_τ\rVert²≤τ/(δ-η) 分母非正 |
| η | 0<η<δ | rw-criterion.tex:26 | ‖a-x^*bx‖<η 逼出 T≥(δ-η)e | η≥δ 时 T 与 e 失去同支撑，polar 分解的 z 未必落回 B |
| τ | τ>0 逼近参数，f_τ(t)=1-√(t/(t+τ)) | rw-criterion.tex:37,44-45 | 用 z_τ 逼近 z 证 z∈B | τ 不令其↓0 则 \lVert z-z_τ\rVert²≤τ/(δ-η) 无法收敛到 0，z∉B |
| 割线 1/2（final） | 固定 1/2 | dimension-drop.tex:11,147,366 | 1_B-b_1-b_2≼(b_1-1/2)_+ 喂 prop:rw | 改回可变 ε 需重标 r_i(t)，dimension-drop.tex:240 分母≥1/2 良定义失 |
| 割线 1/2（full cut） | \lVert 1_P-Σ_{i=1}^N h_i bℓ_i\rVert<1/2 | dimension-drop.tex:167 | 选 δ 使 \lVert 1_P-S\rVert<1 令 S 可逆 | 阈值放到 1 时 S 未必可逆，eq:full-cut-comparison 的 [1_P]≤N[c] 断 |
| N | 完全性表达式的项数 | dimension-drop.tex:166,193 | V^*diag(c,…,c)V=1_P 得 [1_P]≤N[c] | N 不足以覆盖单位时该 Cuntz 不等式失 |
| L | 最小整数 2^L≥N | dimension-drop.tex:202 | R=P^{⊗L}，2^L 个正交 c_σ 同属类 [e] | L 太小使 2^L<N，eq:cone-amplification 的 N[e]≤2^L[e] 断 |
| k=N^L | cube 坐标数 | dimension-drop.tex:204 | C^{⊗k} cube 模型给出 k[X]≤N[Y] | k 与 N 若角色互换，dimension-drop.tex:310 的求和配平失 |
| g(s) | (1-2s/δ)_+，斜率 2/δ | dimension-drop.tex:231 | H=1-∏_j g(t_j)、X=g^{⊗k} | 斜率 2/δ 改动使 y_j 支撑区 t_j>δ、t_i<δ/2 与 H=1 错位，dimension-drop.tex:278 断 |
| H(t) 界 | 0≤H(t)≤(2/δ)Σ_j t_j | dimension-drop.tex:251-252 | 证 a_i、v 在原点连续 | 系数 2/δ 当 δ→0 发散，原点连续性论证崩 |
| r_i(t) | (t_i/d(t)-1/2)_+/Σ_j(·)，d=max_j t_j | dimension-drop.tex:235-239 | 喂给 θ_{r(t)} 单纯形插值 | 分母至少一项为 1/2；若不用 max 归一化则 r 无界、良定义失 |
| flip U(s) | (1+F)/2+e^{iπs}(1-F)/2 | rw-criterion.tex:228-230; dimension-drop.tex:96-99 | θ_r 顶点插值与加权翻转交换子 | 去掉 (1+F)/2 投影分量则 U(0)≠1，vertex 处坐标包含性质失 |
| θ(t) | 在 [0,1/3] 为 0，在 [2/3,1] 为 1 | rw-criterion.tex:226-227 | U(t) 原点处为 1、[2/3,1] 处为 F | 两阈值若重合 U 无过渡，eq:rw-weighted-flip 的 Q 支撑落空 |
| g(t)（rw 内） | t≤2/3 为 1，否则 3(1-t) | rw-criterion.tex:236-237 | h=g(d)、k=φ(h)、l=1-h-k 且 0≤l≤d | 2/3 若与 θ 的 2/3 不一致则 β 支撑不在 Her(1-d) |
| j(t) | 对 t≥2/3 取 1/t | rw-criterion.tex:268 | β(y)=l j(d)ρ(y)∈B | t→0 处 1/t 发散，靠 l 在 [0,2/3] 上为 0 抵消，改支撑点则 β∉B |
| Q(t) | g(1-g) | rw-criterion.tex:276 | 两端点为 0、支撑恰在 U=F 处 | Q 非零于端点会令 λ 求值出常数非标量 section，eq:rw-weighted-flip 出错 |
| 2^n>2mn+r-1 | Sard 维数计数不等式 | tensor.tex:137,155 | 令 Φ^{-1}(0) 维数 < rm^n=dim W^r | 不等号反向则 Φ^{-1}(0) 投影未必零测，Sard 给不出通用 x，lem:tensor-real-labels 断 |
| m=dim_ℝ V | 检测空间实维数（≥2） | tensor.tex:119,226 | 标签 x_1..x_m；P_0=D⊗D^{⊗n}⊗D^{⊗n} | m=1 时 V 无非交换对，rank≥2 前提失，lem:tensor-detecting-space 塌 |
| r | 桥或标签的个数 | tensor.tex:120,303 | 第二标签族 x_1'..x_r' 组装 w_0 | r 减少则 c_i 张不成单位理想，tensor.tex:322 的 w_0 全性断 |
| n,n' | 标签层数 | tensor.tex:304,325 | P=P_0⊗D^{⊗n'} | 层数不足丢 π_0([v_i,v_j]) 独立性，tensor.tex:249 双交换子全性失 |
| 提升界 2‖x‖ | 逐坐标截断的一致界 | preliminaries.tex:94,118 | prop:kr(1) 重标序列中心性与连续延拓 | 去掉一致界则从 D_0 连续延拓到复 \*-同态不成立 |
| 1/s 测试容差 | s=1,2,… | preliminaries.tex:104-107 | 前 s 个关系与 \lVert [a_{l(s)}^x,b_s^j]\rVert<1/s | 容差不→0 则极限关系不成立，同态无法定义 |
| m_0 | full-cone 给的幂 | application.tex:5 | P=D^{⊗m_0}、η:C→P | 与 cone-drop 的 s 合并成 m_0·s，任一缺失两单同态无法复合 |
| s（cone-drop 幂） | B=P^{⊗(k+L)}，即 m=k+L | dimension-drop.tex:320,367 | 由 cone map 得 I(2,3)→P^{⊗m} | k 或 L 改动破坏 eq:cone-amplification 与 eq:cone-defect-sum 配平 |
| 不可约维数 2,3,6 | I(2,3) 在 0、1、内部的不可约维数 | application.tex:50-51 | 像 E 的 subhomogeneous 界 = 6 | 若变成无界（非 subhomogeneous）则 prop:kr(2) 前提失，吸收判据无从触发 |
| size（Z 模型） | size n=2^(7^n)，exponent=7^n-1 | Definitions.lean:2072,2085,2097 | JiangSu.Algebra 归纳极限具体模型 | 增长率 7 改小则各步 coprime 与 multiplier_growth 失，presentation 模型不存在 |
| grow₀,grow₁ | 2pq<k₀、2pq<k₁ | JiangSu.lean:48,51 | StepParameters 保证 next_coprime | 阈值 2pq 破坏则 k₀,k₁ 与 pq 不再互素，number_eigenpaths 槽位计数失 |
| 1/100 | 投影近似容差 | JiangSu.lean:164,171 | projectionless 由近似推 p=0∨1 | 容差放宽过 1 则 rounding 引理不触发，Z 的无投影性质断 |
| ‖w‖=1 | 方阵零元素归一 | tensor.tex:221,324 | η(ι e_21)=w、h=\lvert w\rvert+\lvert w^*\rvert 范数 1 | 不归一则 prop:full-cone 中 h 的 norm 界与支撑 p+q 论证失 |
| $x_\gamma$ | $x_\gamma=v(b+\gamma)^{-1/2}$、$x_\gamma^{*}(vv^{*})x_\gamma=b^{2}(b+\gamma)^{-1}\to b$ | preliminaries.tex:28-31 | Cuntz 规则一 $[v^{*}v]=[vv^{*}]$ 的见证序列 | 若 $\gamma\not\downarrow0$ 则 $\lVert b-b^{2}(b+\gamma)^{-1}\rVert\le\gamma$ 不收口, 极限见证失效 |
| $q(t)$ | $q(t)=\sqrt{f(t)/t}$（$t>0$）、$q(0)=\varepsilon^{-1/2}$ | rw-criterion.tex:121-124 | $s_2=w^{*}q(a_2)\in B$ 的连续延拓 | 若 $\varepsilon\to0$ 则 $q(0)=\varepsilon^{-1/2}$ 发散, $s_2$ 出 $B$, 与台账 ε 行互指 |
| $f_\tau$ | $f_\tau(t)=1-\sqrt{t/(t+\tau)}$、$\sup_{t\ge0}t f_\tau(t)^{2}\le\tau$ | rw-criterion.tex:40-46 | $\lVert z-z_\tau\rVert^{2}\le\tau/(\delta-\eta)$ 的分子界 | 若 $\delta-\eta\le0$ 则分母失号, 精确割线引理断, 与台账 τ 行互指 |
| $V$ | 列 $V=(\ell_i d^{-1/2})_{i=1}^{N}$、$V^{*}\operatorname{diag}(c,\ldots,c)V=d^{-1/2}dd^{-1/2}=1_P$ | dimension-drop.tex:190-193 | eq:full-cut-comparison 给 $[1_P]\le N[c]$ 的精确见证 | 若 $d$ 不可逆则 $d^{-1/2}$ 无定义, 比较链第一段断 |
| $\Phi$ | $\Phi:\mathcal P\times S^{r-1}\times W^{r}\to(\mathbb R^{2})^{\otimes n}$、定义域维 $2mn+r-1+rm^{n}$ | tensor.tex:142-156 | 标签流形维数与 Sard 零测投影 | 若 $2^{n}\le2mn+r-1$ 则零集维数条件破, 通用 $x$ 取不到, 与台账维数计数行互指 |
| $w_0$ | $w_0=\sum_{i=1}^{r}c_i\otimes x_i'$、$c_ic_j=0$、$w_0^{2}=0$ | tensor.tex:305-309 | prop:full-cone 极分解的输入方阵零元 | 若 $c_ic_j\ne0$ 则 $w_0^{2}\ne0$, $q\le1-p$ 与矩阵单位链断 |

（台账覆盖到的都是我能从 tex/lean 里指认的阈值、eps/delta、张量层数、超滤子指标、维数下降取值区间、Cuntz 半群与严格比较性相关常数；[外部推断] 我对"若改动断在哪一步"一栏做的是反向依赖推演，不是论文里明写的。）

## 三、初始动机与最初猜想

我手里最早的实物是 Kirchberg 和 Rørdam 那篇《When central sequence C\*-algebras have characters》。[外部推断] 那篇文章（KR，Internat. J. Math. 2015，论文 references.tex 第 16--21 行）研究的核心现象是：一个幺元可分代数 A 到底吸收不吸收 Jiang--Su 代数 Z，可以翻译到它的 central-sequence 代数 F_ω(A) 里"能不能装下某个特定小代数"。他们给出的定理（论文 preliminaries.tex 第 126--127 行明引 KR Theorem 2.5）说 A≅A⊗min Z 当且仅当 F_ω(A) 里含一个同单位、可分、subhomogeneous、无 character 的子代数。

我一开始盯着这句话，被一个不对称刺到了：判据要的是"存在一个 subhomogeneous 且无 character 的子代数"，这个存在性里塞了两个条件。subhomogeneous（不可约表示维数有共同有限界）是结构性条件，而"无 character"几乎是纯代数的、极弱的条件。我在 introduction.tex 第 23--26 行把这段写出来：那个无 character 子代数当然迫使整个 F_ω(A) 无 character，问题是这个"elementary obstruction"是不是已经足够。我反复追问的是：判据里的 subhomogeneous 到底是不是多余的，只要 F_ω(A) 无 character 就能反推出吸收。这被 KR 记作 Question 3.1（introduction.tex 第 28--30 行），也在 Schafhauser--Tikuisis--White 的 99 problems 里排到 Problem LXXX（introduction.tex 第 33--34 行）。

我最初的猜想非常朴素：F_ω(A) 无 character 这个假设本身就意味着 F_ω(A) 非交换得足够"均匀"，而 subhomogeneous 那步只是历史包袱。我赌的是，只要无 character，我就能在 F_ω(A) 里现造一个无 character 的 subhomogeneous 子代数，而造它的关键就是先造 I(2,3) 这个具体的维数下降代数。为什么是 I(2,3)？因为 Rørdam--Winter 的判据（prop:rw）在 n=2 情形恰好把"一对正交、精确等价、且缺陷被 (a_1-ε)_+ 压住的正元"翻译成 I(2,3) 的单同态（preliminaries.tex 第 56 行明说取 RW Proposition 5.1 的 (ii)⇒(iv)、n=2）。所以我一开始的直觉路线是：无 character ⇒ 造出那对正交等价正元 ⇒ prop:rw ⇒ I(2,3) 进 F_ω(A) ⇒ KR 定理 2.5 ⇒ 吸收。

这个初猜把整篇文章拆成了两段可分的东西：一段在 F_ω(A) 内部（把无 character 变成 I(2,3) 拷贝），一段纯粹是 KR 自己的定理 2.5 加 commuting-copies 引理。我原以为难点全在"无 character 到正交等价对"这一步，其余是搬运。这个预判后来被证明既对又错，错的部分构成了第四节的死路。

## 四、我走过的死路（以及它们各自怎么断的）

死路一：直接对 A 动手，把"无 character"当成分布在 A 上的性质去榨。我一开始想在 A 本身里找非交换的痕迹，但 thm:main 的假设是关于 F_ω(A) 的，而 F_ω(A) 里的元素是序列的等价类，非交换性藏在"序列"里，并非"每一项"里。这条路在 tensor.tex 第 6--11 行被我自己写死了方向："The absence of characters is detected by finitely many commutators. The main issue is to combine those finitely many tests into one element that survives every irreducible representation of a maximal tensor product, including representations that are not spatial tensor products." 也就是说，无 character 只在有限多个交换子上可见（lem:separable、lem:tensor-detecting-space 都是这个意思），但要把这些有限测试合成"一个元素、在所有不可约表示下都活着"，就必须在张量幂里操作，并非在 A 里。死路一断在：单个 A 上的有限交换子信息，无法直接给出一个全的方阵零元。

死路二：假设 A 有有限核维数或单性，用现成的正则性判据。introduction.tex 第 100--110 行点名了两条现成路线：Robert--Tikuisis（RT，两个全的正交 central-sequence 正元在有限核维数下就够）和 Perera--Thiel--Vilalta（PTV，用 central-sequence 代数的 purity 刻画 Z-stability）。[外部推断] purity 会在 Cuntz 半群上强加比较性与可除性。我一度想把问题约到 PTV 的 purity，但立刻发现：thm:main 的假设里既没有单性、没有 tracial 条件、也没有核维数，PTV 的 purity 恰恰需要那些比较性/可除性，而"无 character"远远推不出它们。introduction.tex 第 108--110 行我明写"The present argument assumes neither finite nuclear dimension nor these comparison and divisibility properties." 这条死路的教训是：任何借用正则性判据的路线，都会在"无 character 推不出比较性"这里断。

死路三：用 tracial ultrapower 或 W\*-中心序列替代 norm central-sequence 代数。F_ω(A) 是 A_ω∩A'，其中 A_ω 是 ℓ^∞/c_ω 的 norm 商。[外部推断] 在 von Neumann 代数或带迹的 C\*-代数文献里，人们常换用 tracial ultrapower。但 preliminaries.tex 第 129--130 行我特别锁死："this input does not replace norm central sequences by a tracial ultrapower or impose nuclearity on A." 死路三断在：tracial ultrapower 会把 character（也就是一维表示）的信息抹掉，因为迹态上"1 维"的东西可能被 quotient 掉；而 norm central-sequence 代数恰恰保留了 character，于是"无 character"这个假设才有牙齿。换成 tracial ultrapower，无 character 变成空话，判据失去内容。

死路四：把 Dadarlat--Toms 的现成构造拿来即用。[外部推断] Dadarlat--Toms（DT）有一篇把 Z-stability 和无限张量幂绑起来的文章。introduction.tex 第 91--97 行确实引了 DT 的两个定理：Theorem 1.1（无限张量幂含同单位 subhomogeneous 无 character 子代数则 Z-stable）和 Theorem 6.2（对固定的素维数下降代数，只要目标代数是有限拓扑维数的递归 subhomogeneous 且最小矩阵尺寸够大，就有单同态进去）。我本想直接套 DT Theorem 6.2 造 I(2,3)，但那条需要"有限拓扑维数 + 递归 subhomogeneous"这种结构假设，而 thm:finite 只假设 D 无 character，连可分性都不要（introduction.tex 第 48--49 行、第 96--97 行）。死路四断在：DT 的输入假设比无 character 强得多，我拿不到那个结构。

死路五（最贵的一条）：想用"存在两个全的正交正元"直接当结论。这条其实是被我的一篇姊妹篇解决的（Fixed231，references.tex 第 23--30 行，OpenAI《Nuclear dimension and Jiang--Su stability without elementary subquotients》Theorem 1.4：每个非零幺元无 character 代数的有限极大张量幂含两个全正交正元，不需可分或核性）。我一度以为有了这对正元就万事大吉。但 introduction.tex 第 130--134 行我把这堵墙写明白了："Fullness of its first matrix corner is not by itself the dimension-drop criterion. The additional task is to produce two exactly equivalent orthogonal positive contractions, of the form v^*v and vv^* for a single element v, and compare their unit defect with a positive cutoff." 也就是说 prop:rw 要的是"精确等价"（同一个 v 的 v^*v 与 vv^*），外加"缺陷 ≼ (a_1-ε)_+"这个比较，这对正交正元本身既不带精确等价、也不带那个 Cuntz 比较。死路五断在：从"全正交对"到"精确等价 + 缺陷比较"之间还差整个第五、第六节（dimension-drop.tex 全部）。

## 五、关键转折

转折发生在把"无 character"翻译成"有限多个交换子"之后（lem:separable、lem:tensor-detecting-space，application.tex 第 17--32、tensor.tex 第 94--114 行）。我意识到无 character 的全部力量，就是"闭理想由自伴交换子生成＝整个代数"这一句，于是存在有限表达式 Σ h_i[b_i,c_i]k_i 与单位距离小于 1（application.tex 第 25--28 行）。这是一个纯有限的数据。麻烦在于：这些交换子活在"一个"张量腿里，而我要造的全方阵零元必须活在"多个"张量腿的极大张量积里，并且在所有不可约表示下都不塌。

真正的转折点是"标签（label）"这个想法（tensor.tex 第 94--163 行，lem:tensor-real-labels 到 cor:tensor-represented-labels）。我需要一个技巧，把有限的交换子信息沿张量幂"复制"到足够多维，使得复制后的元素在任意不可约表示下仍然线性无关。这里出现了我完全没料到的工具组合：一个有限维实空间上张量幂的线性无关性，用 Sard 定理和维数计数 2^n>2mn+r-1 来保证（tensor.tex 第 137、155 行）。[外部推断] 我此前从没在 C\*-代数吸收问题里预期会出现 Sard 定理或微分拓扑的一般位置论证。这一步把"要在所有不可约表示下保持独立"这个代数困难，转成了一个光滑映射零集维数严格小于参数空间维数的几何事实。有了表示稳定的线性无关，我就能用"线性无关"顶替通常需要的"正交"，去合成有限多个桥（tensor.tex 第 212--214 行的这句话是全篇枢纽："The labels allow linear independence to replace orthogonality when combining finitely many algebraic witnesses."）。

第二个转折：从全方阵零元到 cone map，再到"cube 上的缺陷吸收"。方阵零元 w 经极分解给矩阵锥 C 的同态 η（prop:full-cone），η(ι e_11) 全。但 prop:rw 需要的是精确等价对与缺陷比较。dimension-drop.tex 的思路是：把 C 张量 k 次认成"立方体 [0,1]^k 上的矩阵值函数"（lem:cone-cube），在立方体里用一族连续嵌入 θ_r（lem:matrix-simplex，单纯形参数化的 M_2 拷贝）造出 a_1、a_2、v，使得缺陷 X=1-a_1-a_2 集中在原点，而支撑在坐标轴附近的 y_j 满足 a_1 y_j=y_j（eq:cone-local-support，dimension-drop.tex 第 275--284 行）。这一步是关键，因为它让"(b_1-1/2)_+"在 y_j 上作用成恒等，从而把缺陷"喂"进比较。而 k 个缺陷拷贝与 N 个 y_j 拷贝之间的多重数配不平，就靠一个辅助张量幂 R=P^{⊗L}（2^L≥N、k=N^L）来吸收，全程不做 Cuntz 序的消去（dimension-drop.tex 第 312--315 行）。

## 六、最终路线与最初设想的落差

我最初的设想（第三节）是"无 character 直接榨出正交等价对，prop:rw 收尾"。落差的第一个地方是：我完全低估了"在所有不可约表示下存活"这件事的难度。极大张量积的不可约表示未必是空间张量积（tensor.tex 第 9--11 行、第 88--90 行反复强调"including representations that are not spatial tensor products"）。所以LEMMA lem:tensor-independence 和 lem:tensor-grouped-factors（弱闭是交换 von Neumann 因子，代数张量积在乘法下内射）是必须的，它们保证即便表示不分解，代数张量独立性仍在乘法下保持。这一整段"因子独立性"在初猜里根本不存在。

落差第二个地方：我原以为"两个全正交正元"就够了（死路五），最终发现必须做 cube 上的缺陷几何（dimension-drop.tex 全部），而这一步需要一个非交换的、单纯形参数化的连续 M_2 嵌入族 θ_r 和加权翻转 U(t)。这些"cube/flip"装置是后来才长出来的，不是初猜的一部分。

落差第三个地方、也是最诚实的一个：最终的 thm:finite 只给出一个单同态 I(2,3)→D^{⊗max m}，指数 m 依赖 D，且我根本没声称这个有限幂自己吸收 Z（introduction.tex 第 64--66 行）。真正的吸收 thm:main 是靠把 D（作为 F_ω(A) 的子代数）经 prop:kr(1) 的 commuting-copies 引理送进 F_ω(A)，让无限张量在 F_ω(A) 里"叠起来"，再套 KR 定理 2.5。而 cor:infinite-tensor 那条"无限极小张量幂 Z-stable"则是另一条腿，靠 Dadarlat--Toms Theorem 1.1 收尾（application.tex 第 86--88 行）。也就是说，我最初以为的"榨出正元即收工"，最后变成了"榨出 I(2,3) 的单同态只是入场券，吸收要么走 F_ω(A) 的无限叠乘、要么走无限张量幂极限"。

第四个落差，关于我原以为是"历史包袱"的 subhomogeneous：我最后不得不承认 subhomogeneous 无法从判据里删掉，因为 KR 定理 2.5 的输入就是它。我做的事是绕过去：用 I(2,3) 的不可约维数天然就是 2、3、6（application.tex 第 50--51 行），所以它的商自动 subhomogeneous 且无 character，从而"无 character 的 F_ω(A)"里我确实造出了一个 subhomogeneous 无 character 子代数。初猜里我以为能删掉的那个条件，最后成了我构造的产物，并非前提。这个反转是全篇最让我意外的。

## 七、逐引理反推（四段式：(a) 原文引用 / (b) 补中间步 / (c) 机械理由 / (d) [推测] 死路）

这一节我把 build\ 里每一个引理、每个命题、每个定理都按四段拆开。(b) 段里我允许自己补出论文明写之间的空隙，凡是我补的、论文没逐字写的，我都在句子里承认是"我接的"。(d) 段一律以 [推测] 开头，是我在当年可能拐错的方向。

### 7.1 Cuntz 比较的基本规则（preliminaries.tex 第 14--39 行）

(a) 逐字（第 15--17 行）：
```
write $a\precsim b$ if, after adjoining zero corners as necessary, there
are matrices $x_j$ with $x_j^*b x_j\to a$ in norm. Write $[a]$ for the
resulting Cuntz equivalence class.
```
三条只用到的初等规则（第 20--27 行）：[v^*v]=[vv^*]；正交正元和的类等于类之和；比较与加法在 \*-同态与外张量固定正元下保持，极大张量积也不例外。第 28--34 行给出第一条的证明骨架：对 b=v^*v，取 x_γ=v(b+γ)^{-1/2}，则 x_γ^*(vv^*)x_γ=b^2(b+γ)^{-1}→b。

(b) 我补的中间步：第二条规则论文说"apply the first to the row (a_1^{1/2},…,a_l^{1/2})"。这一行是 1×l 矩阵 v，v^*v 是列乘行给 diag 之外的 off-diagonal a_i^{1/2}a_j^{1/2}；但正交性让 off-diagonal 全 0，于是 v^*v=Σ a_i（在合适的分块里），vv^* 是把 a_i^{1/2} 并排放对角，其类即 Σ[a_i]。我接这一句时确认：正交性在这里是被用来让行矩阵的 Gram 对角化的，没有正交就没有第二条。第三条的外张量保持性论文说误差被"the norm of the fixed positive tensor factor"放大，这正是极大张量积的范数性质：x_j⊗c 的乘积 (x_j⊗c)^*(b⊗c)(x_j⊗c)... 我接的细节是，外张量一个固定正元相当于把每个见证 x_j 换成 x_j⊗1 再压缩，误差 ≤ 原误差·‖c‖，这就是第 35--36 行那句。

(c) 机械理由：这里只借 Cuntz 半群的"半序＋交换幺半群"结构，第 37--38 行明说"These rules use no cancellation or regularity of the Cuntz order." 这解释了我为什么能完全避开死路二（PTV 的比较性/可除性）：我不需要消去律，只需要"张量保持比较"与"正交求和"。[a]≤[1_B] 用精确见证 a^{1/2}（第 38--39 行），意味着幺元的类是所有正元类的上界，这条在 dimension-drop.tex 的 eq:full-cut-comparison [1_P]≤N[c] 里被反向消费。

(d) [推测] 当年我可能试图用稳定的 Cuntz 半群（对 A⊗K）来做比较，那样会引入无穷矩阵的支撑投影麻烦；一旦要消去律，非正则代数上就断。另一条死路是把 ≼ 换成 Murray--von Neumann 等价，那只在 von Neumann 代数里成立，落到一般 C\*-代数就断。还可能想直接用 [a]≤[b] 的逆（单射比较），但没有 cancellation 时 [a]+[c]≤[b]+[c] 推不出 [a]≤[b]，任何依赖消去的中间步会在 dimension-drop.tex 第 312--315 行"without any cancellation in the Cuntz order"这句的反面崩掉。

### 7.2 精确割线引理 lem:rw-exact-cut（rw-criterion.tex 第 15--51 行）

(a) 逐字（第 16--21 行）：
```
If $a,b\in B_+$ satisfy $a\precsim b$, then for every $\delta>0$
there is $z\in B$ such that
 z^*z=(a-\delta)_+,
 \qquad zz^*\in\operatorname{Her}(b).
```
证明里（第 26--47 行）设 ‖a-x^*bx‖<η<δ，e=(a-δ)_+，y=b^{1/2}xe^{1/2}，得 T=y^*y≥e^{1/2}(a-η)e^{1/2}≥(δ-η)e，T≤‖x^*bx‖e。z=ue^{1/2}（u 是 y 极分解里的部分等距）在 B^{**}，用 z_τ=y(T+τ)^{-1/2}e^{1/2} 逼近，f_τ(t)=1-√(t/(t+τ))，‖z-z_τ‖²≤sup_{t≥0}t f_τ(t)²/(δ-η)≤τ/(δ-η)。

(b) 我补的中间步：先确认 T 与 e 同支撑。下界 T≥(δ-η)e 给 supp(e)≤supp(T)；上界 T≤‖x^*bx‖e 给 supp(T)≤supp(e)；于是 supp(T)=supp(e)，故 T^{-1/2} 与 e^{1/2} 在同一支撑上互相受控。z^*z=e 的验证：z=ue^{1/2}，u 是 y=uT^{1/2} 的部分等距，则 z^*z=e^{1/2}u^*u e^{1/2}=e^{1/2}supp(T)e^{1/2}=e（因为 supp(T)=supp(e)）。zz^*=u T u^* 落在 b^{1/2}B 再对偶回 b^{1/2}Bb^{1/2} 的闭包＝Her(b)。z_τ∈b^{1/2}B 因为 y∈b^{1/2}B（y=b^{1/2}xe^{1/2}），乘 (T+τ)^{-1/2}e^{1/2}（τ>0 时 (T+τ)^{-1/2}∈B）仍在 b^{1/2}B。逼近误差的算子不等式我接一下：z-z_τ=u e^{1/2}-y(T+τ)^{-1/2}e^{1/2}=(u T^{1/2}-y)(T+τ)^{-1/2}e^{1/2}... 论文用的是 ‖z-z_τ‖²≤‖f_τ(T)e f_τ(T)‖，其来源是 (1-√(T/(T+τ)))=f_τ(T) 在 supp(e) 上对 e 的压缩；sup_{t≥0}t f_τ(t)² 是个 O(τ) 的量（[外部推断] 大致 τ·sup s/(1+√s)² 型），故 ≤τ/(δ-η)。

(c) 机械理由：δ 是割线，作用是把"≼"（存在性见证）升级成"精确"（z^*z 恰为 (a-δ)_+）。prop:rw 最终要 a_1=v^*v、a_2=vv^* 这种精确等式，而 ≼ 只给极限，所以必须用 lem:rw-exact-cut 把极限式磨成精确式，代价就是割掉 δ。η<δ 是硬约束：一旦 η≥δ 则 δ-η≤0，sup/分母失效，z 未必∈B。为什么 z 必须落在 B ，并非 B^{**}：prop:rw 造的同态像要在 B 里；支撑投影 supp 未必∈B（第 12--13 行明说"they need not belong to B"），所以整个 τ 逼近的目的就是在不假设 p∈B 的前提下把元素拉回 B。

(d) [推测] 死路一：直接取 δ=0，那需要 Cuntz 比较已被精确见证，而 ≼ 的定义只给逼近序列，δ=0 时 T 与 e 支撑相等这一步会退化成只有闭包，z 落在 Her 里但 z^*z 未必精确等于 a。死路二：把 z_τ 的逼近换成弱收敛，那样得不到 ‖z-z_τ‖→0 的范数收敛，z∉B 的论证崩，最终同态落到 B^{**}\B。死路三：若一开始假设 B 单或有稳定秩一，则支撑投影自动在 B，可跳过 τ 逼近；但 rw-criterion.tex 第 8 行、第 316--317 行强调对任意幺元代数、含 v=0 情形都成立，加单性假设会让 cor:infinite-tensor 那种非单情形失去覆盖。

### 7.3 order-zero 表示与交换同态引理 lem:rw-commuting-maps（rw-criterion.tex 第 53--113 行）

(a) 逐字（第 76--83 行）：
```
Let $\alpha:M_3\to B$ and $\beta:M_2\to B$ be completely positive
contractive maps with commuting ranges, satisfying
$\psi(x)\psi(y)=\psi(1)\psi(xy)$ for $\psi=\alpha,\beta$.
If
$\alpha(1_3)+\beta(1_2)=1_B$, there is a unital homomorphism
$I(2,3)\to B$.
```
第 88--91 行给出 I(2,3) 的两条典范入射 α_0(y)(t)=t(1_2⊗y)、β_0(x)(t)=(1-t)(x⊗1_3)。第 97--105 行：在 E=C*(α(M_3),β(M_2),1) 的不可约表示里 α(1_3) 是标量 r∈[0,1]，0<r<1 时 r^{-1}α 与 (1-r)^{-1}β 是交换的幺元矩阵同态合成 M_2⊗M_3 表示，r=0 只剩 M_2，r=1 只剩 M_3。

(b) 我补的中间步：先要理解"order-zero"（保正交）为何等价于 Gram 公式 α(x)=H·\bar α(x)（第 64--69 行）。第 53--63 行给了构造：若 x_i 是压缩元且 x_i x_j^*=δ_{ij}h，则 α(e_ij)=x_i^*x_j 定出 cpc order-zero 映射，正元 x_i^*x_i 两两正交，和 H 是压缩元，乘法给 α(e_ij)α(e_kl)=δ_{jk}Hα(e_il)。支撑同态 \bar α 的矩阵单位是 α(e_ij)(H+τ)^{-1} 当 τ↓0 的强极限（第 70--74 行）。我接：条件 ψ(x)ψ(y)=ψ(1)ψ(xy) 正是说 ψ 在 ψ(1) 支撑上是同态（一个"虚同态"），它保证 α、β 各自在支撑投影内 behaves like 表示。交换性 α(1_3) 在 E 中心是关键：不可约表示把中心元映成标量，这就是 r。然后"代入有界"（第 107--112 行）：对非交换 \*-多项式 p，‖p(α,β)‖≤‖p 在 I(2,3) 中的范数‖，因为每个不可约表示下的值等于 I(2,3) 在某点 r 的求值，这是 C\*-范数的 sup over 表示 定义，于是代入延拓成同态。

(c) 机械理由：为什么 M_3 对 β_0 里的 M_3、M_2 对 α_0 里的 M_2 交叉配（注意 I(2,3) 的定义里 f(0)∈M_2⊗1_3、f(1)∈1_2⊗M_3）：在 r=0 端只留 M_2（对应 β(1_2) 的支撑），r=1 端只留 M_3。α(1_3)+β(1_2)=1 是"互补支撑"，让 t 与 1-t 权重恰好在两端消掉多余项。条件 ψ(x)ψ(y)=ψ(1)ψ(xy) 保证 α(M_3)、β(M_2) 各自在自身支撑投影内是真正的表示，从而不可约表示里的标量 r 分解干净；没有它，order-zero 的"非乘性"部分（H 因子）会在端点产生额外维数，破坏 subhomogeneous 界。

(d) [推测] 死路一：试图只用一个 order-zero 映射 α:M_2→B 造维数下降，但 I(2,3) 需要两端不同矩阵尺寸 2、3，单映射给不出非平凡的端点纤维差。死路二：把 α(1_3)+β(1_2)=1 弱化成 ≤1（有缺陷 1-α(1)-β(2)），那缺陷就是 prop:rw 要处理的对象，若在 7.3 里就允许缺陷，则代入有界性论证会在 r∈(0,1) 的标量分解处多出缺陷纤维维数、subhomogeneous 界不再是 6。死路三：若假设 B 稳定秩一或有充分投影（RW 原文 (i)⇒(ii) 那部分），可用等价投影替换支撑论证，但论文第 60--62 行专门撇清"the stable-rank-one hypothesis ... is not a hypothesis of the implication stated here"，走那条会在 thm:main 无正则性假设下断。

### 7.4 Rørdam--Winter 主命题 prop:rw（rw-criterion.tex 第 115--318 行）

(a) 逐字（第 46--53 行命题本体，已在第一节抄录）。此证明是全篇最长，我把它切成五段来反推。第一段"从比较到精确关系"（第 116--148 行）：设 a_1=w^*w、a_2=ww^*，f(t)=min{t/ε,1}，s_1=f(a_1)^{1/2}，若 w^*=u_0 a_2^{1/2} 则 s_2=u_0 f(a_2)^{1/2}，并说明 s_2=w^*q(a_2)∈B，q(t)=√(f(t)/t) 在 0 处赋 ε^{-1/2}。得 s_i s_j^*=δ_{ij}s_1²、d=s_1^*s_1+s_2^*s_2=f(a_1)+f(a_2)。写 c=1-a_1-a_2，得 a=1-d=ε^{-1}(c-(1-ε))_+。对 c≼(a_1-ε)_+ 用 lem:rw-exact-cut 取 δ=1-ε 再除 √ε，得 v 满足 eq:rw-relations：v^*v=a=1-d、vv^*∈Her((a_1-ε)_+)、s_1²vv^*=vv^*。

(b) 我补中间步（第 126--148 行）：s_i s_j^*=δ_{ij}s_1² 的来源是初等正元 a_1、a_2 正交 ⇒ f(a_1)、f(a_2) 正交 ⇒ u_0（w^* 的部分等距）把 a_2 的支撑搬到 a_1 上，交叉项因正交消失。s_2∈B 的验证是重点：s_2=u_0 f(a_2)^{1/2}，而 u_0=w^* a_2^{-1/2}（在 supp 上），故 s_2=w^*a_2^{-1/2}f(a_2)^{1/2}=w^*q(a_2)，q(0) 赋有限值 ε^{-1/2} 因为 f(t)/t→1/ε（t→0），这就让 q 连续、q(a_2)∈B、从而 s_2∈B。a=1-d 的计算我接：1-d=1-f(a_1)-f(a_2)；在 a_1+a_2 小的地方 f(a_i)=a_i/ε，于是 1-f(a_1)-f(a_2)=1-(a_1+a_2)/ε=(ε-(a_1+a_2))/ε=(c-(1-ε))/ε 的正部。然后 δ=1-ε 的 exact-cut：把 c≼(a_1-ε)_+ 变成 z^*z=(c-(1-ε))_+、zz^*∈Her((a_1-ε)_+)；令 v=z/√ε 使 v^*v=(c-(1-ε))_+/ε=a（注意 a 已是 ε^{-1}(c-(1-ε))_+）。s_1²vv^*=vv^* 因 vv^* 支撑在 (a_1-ε)_+ 上而 s_1²=f(a_1) 在该支上为 1（当 a_1≥ε 时 f=1）。Gram 结构给 ρ:M_2→B，ρ(e_ij)=s_i^*s_j、ρ(1_2)=d，σ 是支撑同态，p=supp(d)。

第 150--180 行"两份正交缺陷代数"：v=ua^{1/2} 极分解、e=u^*u=supp(a)，r_i=s_i^*u=σ(e_{i1})u，R=r_1r_1^*+r_2r_2^*。eq:rw-corners：r_i^*r_j=δ_{ij}e、dr_i=r_i、R≤p、R⊥e、σ(e_jk)r_i=δ_{ki}r_j。φ:Her(a)→B，φ(b)=Σ r_i b r_i^* 是同态，eq:rw-phi：φ(b)r_i=r_i b、[φ(b),σ(M_2)]=0、φ(Her(a))⊥Her(a)。我接 R⊥e 的来历：a 与 s_i 交换（因 d 与 s_i 交换、a=1-d），au=0 故 e=u^*u 与 d 支撑正交；r_i=s_i^*u 使 r_i^*r_i=u^*s_i s_i^*u... 论文用 eq:rw-corners 的 δ_{ij}e 直接确认 r_i 是 (e→p) 的部分等距。φ 的值∈B：用 a^{1/2}b_m a^{1/2} 逼近 b，ub∈B（第 172--174 行）配合 ubu^*∈B。

第 182--218 行"另一坐标的截面同态"：D_1={F∈C([0,1],M_2):F(0)∈ℂ1_2、F(1)=0}，λ(F)=λ̄(F)+c_F(1-p)，λ̄(F)=Σ F_ij(d)σ(e_ij)。D_2={F∈C([0,1],M_2⊗M_2):F(0)∈ℂ1_4、F(1)=0}，γ 是 φ∘λ 与 σ 的交换积在 D_2 上的限制。我接 λ 取值在 Her(a) 的理由：D_1 由 (1-t)1_2 与 t(1-t)x 生成，其像分别为 a 与 aρ(x)，二者都在 Her(a)；加标量纤维 c_F(1-p) 是为了把 p 之外的部分补成 1，使 λ(f1_2)=f(d) 对消一端的标量 f 成立。γ 支撑投影是 R 因含 φ(a)。

第 220--313 行"翻转与最终 order-zero 对"：F 是翻转酉，θ 在 [0,1/3] 为 0、[2/3,1] 为 1，U(t)=(1+F)/2+e^{iπθ(t)}(1-F)/2 是 D_2 的乘子，γ 的乘子扩张送到 RB^{**}R 里的酉 w_0，W=w_0+1-R。g(t)=1（t≤2/3）否则 3(1-t)，h=λ(g1_2)=g(d)、k=φ(h)、l=1-h-k。x_i=h^{1/2}r_i^*W（i=1,2）、x_3=h^{1/2}，得 x_i x_j^*=δ_{ij}h、Σ x_i^*x_i=h+k，故 α:M_3→B order-zero、α(1_3)=h+k。β(y)=lσ(y)（用 j(t)=1/t for t≥2/3 说明 β(y)=l j(d)ρ(y)∈B），β(1_2)=l，α(1_3)+β(1_2)=h+k+l=1。最后用 Q(t)=g(1-g) 与加权翻转 eq:rw-weighted-flip 证明 range(α) 与 range(β) 交换。

(c) 机械理由：ε 出现在割线 (a_1-ε)_+ 与 a=ε^{-1}(c-(1-ε))_+；ε<1 保证 (1-ε)>0、正部有定义；ε→0 会让 q(0)=ε^{-1/2} 发散，破坏 s_2∈B 的连续延拓，这就是为什么 ε 必须严格正。δ=1-ε 不是自由参数，它被 a=1-d 的正部阈值 (c-(1-ε))_+ 反推固定。2/3、1/3 这两个阈值：θ 与 g 都用 2/3 是因为 l=g? 不，是因为 l 要在 d 的谱 [0,2/3] 上为 0（第 266--268 行"l vanishes on the spectral subspace of d for [0,2/3]"），而 h=g(d) 在该段为 1，需要 g=1 到 2/3；θ 的 1/3、2/3 给 U 一个过渡带，使 U 在 [0,1/3] 恒为 1（保 γ 在 0 端不退化）、在 [2/3,1] 恒为 F（让翻转真正生效）。Q=g(1-g) 两端点为 0 且支撑在 U=F 处，正是为了 eq:rw-weighted-flip 只在翻转生效处比较 (1⊗y) 与 (y⊗1)，从而把 β 与 α 的对易性化归到翻转 F 的交换性。

(d) [推测] 死路一：直接用 RW 原命题带稳定秩一的版本 (i)⇒(iv)，那会在 A 非正则时断（见第 60--62 行的撇清）。死路二：跳过 λ 的标量纤维 c_F(1-p) 修正，那么在 p≠1（d 不可逆）时 λ(F) 无法补成 Her(a) 里的元素，γ 的定义域断裂。死路三：让 θ 在端点不为 0/1，U(0)≠1，则乘子扩张 w_0 在 0 端不再是恒等，x_i 的正交性 x_i x_j^*=δ_{ij}h 会在原点丢一项，α 不再是良定义 order-zero 映射。

### 7.5 交换因子的代数无关性 lem:tensor-independence（tensor.tex 第 14--68 行）

(a) 逐字（第 16--23 行）：
```
Let \(M\subseteq B(H)\) be a von Neumann factor with \(1_M=1_H\), and let
\(B\subseteq M'\) be a unital algebra. The multiplication map
 M\odot B\longrightarrow B(H),\qquad a\otimes b\longmapsto ab,
is injective. Consequently, multiplication is injective on the complex
algebraic tensor product of any finite family of commuting von Neumann
factors on the same Hilbert space, all with unit \(1_H\).
```
证明核心（第 30--63 行）是把行空间 S={(a_1,..,a_l)∈M^{1×l}:Σ a_i b_i=0} 做成弱闭左理想 J⊂M_l(M)，用支撑投影论证 J=M_l(M)p，再用酉 U=diag(u,..,u) 的共轭迫使 p 的中心元分量标量，从而 p=0。

(b) 我补中间步：J 的构造：行属于 S 的矩阵全体。左乘 M 使每行变原行的 M-线性组合（仍在 S），弱闭由坐标逐点弱闭得。关键"support-projection argument"（第 41--47 行）：对 x∈J，x^*x∈J（因为 J 是左理想、x^*x 是 x 的 M-组合），函数演算取 x^*x(x^*x+ε1)^{-1}（在 ε↓0 强趋于支撑投影），弱闭后支撑投影∈J；有限个投影的并＝其和的支撑，故也在 J；递增归纳的并 p∈J（这里第 48--49 行"this is a net of finite joins, so no separability assumption is involved"）。每个 x 满足 x=xp，故 J=M_l(M)p。酉部分（第 54--60 行）：JU=J 使 xU 的右支撑投影是 x 右支撑投影在 U 下的共轭，取所有并得 U^*pU=p，即 p 每个分量与所有 u∈M 交换，落入 M 的中心＝ℂ，故每行是 b_i 的标量关系；b_i 线性无关逼 p=0。

(c) 机械理由：M 是因子（中心只有标量）是关键：若 M 有非平凡中心，U^*pU=p 只能推 p 分量落在中心（非标量），逼不出 p=0。B⊆M' 保证右不变性（行右乘 B 元素可挪到 M 侧）。这一引理专门服务于 tensor.tex 第 88--90 行的声明："require neither faithfulness of the restrictions to the tensor legs nor a spatial decomposition of the represented factors." 它把"张量腿的像可能在表示里有核"这件事完全免疫掉：只要腿弱闭成因子、彼此交换，代数张量独立性就在乘法下活着。这正是绕开死路一（不可约表示非空间张量积）的代数引擎。

(d) [推测] 死路一：试图用 spatial tensor product 的范数性质直接证 M⊙B 内射，但极大张量积对非正合代数不保内射，范数论证断；支撑投影法只碰代数结构，避开了范数。死路二：若 B 只是子空间，并非代数（不含单位、不在 M' 里），右不变性 JU=J 失，p 的中心性论证崩。死路三：若把因子换成有限 von Neumann 代数带迹，可用迹论证替代支撑投影，但需要半有限性假设，落到一般表示的弱闭未必半有限就断。

### 7.6 分块的弱闭是交换因子 lem:tensor-grouped-factors（tensor.tex 第 70--86 行）

(a) 逐字（第 72--77 行）：
```
Let \(\pi:B_1\otmax\cdots\otmax B_q\to B(H)\) be an irreducible
representation, where the \(B_j\) are nonzero unital \(C^*\)-algebras. The
weak-operator closures of the represented tensor legs are commuting von Neumann
factors. The same is true after grouping the legs according to any partition
into nonempty blocks.
```
证明（第 80--86 行）：每块含 π(1)=1_H、块间交换且弱闭后仍交换；一块弱闭的中心元同时与该块和所有补块交换，故落在整个不可约像的 commutant＝ℂ。

(b) 我补中间步：不可约 ⇒ commutant 是标量（Schur 引理的逆，von Neumann 双-commutant：π(A)'∩B(H)=ℂ 当 π 不可约且像弱稠）。中心元 c∈(闭块)'∩闭块 意味着 c 与该块、与所有补块都交换，于是 c∈(全体像)'=ℂ，故块弱闭的中心平凡＝因子。"分块后仍成立"是因为补块并起来仍是可数个交换像的子集，c 与其交换即与合并块交换。

(c) 机械理由：这是 7.5 的前置：lem:tensor-independence 要 M 是因子，7.6 负责在"任意不可约表示 π"下生产出因子。它保证 tensor.tex 第 238--249、310--316 行里 π 的三块/两块弱闭都是因子，从而 7.5 适用。可分性与单位都在这用：unital 保证 π(1)=1_H 让"含单位"成立（第 80 行），非零保证像非平凡。

(d) [推测] 死路一：若 π 只是本征不可约但像不弱稠（非退化性缺失），commutant 未必是 ℂ，因子性失；论文第 8 行"representations called irreducible are nonzero and nondegenerate"就是为堵这个。死路二：若用极小张量积 ⅋min ，并非 ⅋max，则腿间交换性在表示里可能因非正合而失，弱闭不成交换族。死路三：若想跳过"分块"只在单腿做，则 7.8 的 cor:tensor-represented-labels 里 P_0 的三块结构无法一次喂给 7.5。

### 7.7 检测空间 lem:tensor-detecting-space（tensor.tex 第 94--114 行）

(a) 逐字（第 96--99 行）：
```
Let \(D\) be a nonzero unital \(C^*\)-algebra without characters.
There is a finite-dimensional real subspace \(V\subseteq D_{\sa}\)
such that the image of \(V\) contains a noncommuting pair in every
nonzero unital representation of \(D\).
```
证明（第 103--113 行）：自伴交换子生成的闭理想若是真理想，则商是非零幺元交换代数，带 character，回到 D 得 character，矛盾。取有限表达式距 1_D 小于 1，其可逆性使所用有限交换子生成单位理想，V 取它们的自伴实张成。

(b) 我补中间步：这里"距 1 小于 1 ⇒ 可逆"是 Banach 代数的 Neumann 级数事实（‖1-x‖<1 ⇒ x 可逆）。若某幺元表示把 V 映成交换空间，则它把所有 [b_i,c_i] 灭掉，从而灭掉它们生成的单位理想，但幺元表示把 1 映 1，1 在该理想里 ⇒ 映成 0，与幺元（1↦1≠0）矛盾。V 的实维数 m=dim_ℝ V≥2（否则 V 交空、无非交换对），这条喂给 7.8 的 rank≥2 前提。

(c) 机械理由：V 有限维是必需的：7.8 要 dim_ℝ V=m 进维数计数 2^n>2mn+r-1；若 V 无限维该不等式无意义。无 character 假设在第 103--106 行被精确消费在"交换子理想＝全体"这一步：一旦有 character，该理想是真理想（落在 character 核里），V 可能不存在，整条链断。这是"无 character"第一次被真正用掉（另一次在 lem:separable、第三次在 cor:infinite-tensor）。

(d) [推测] 死路一：直接取 V=D_sa（全体自伴），无限维，Sard 计数失。死路二：假设 D 单，则任何非零元全，可省"交换子理想"论证，但 thm:finite 不要单性，非单无 character 代数（如某 Cuntz 代数的商）会断。死路三：用态（state），并非表示检测非交换，但 character 恰是一维表示，用态会绕过一维障碍、失去"无 character"的锋利。

### 7.8 用 Sard 定理造表示稳定标签 lem:tensor-real-labels（tensor.tex 第 116--163 行）

(a) 逐字（第 118--127 行）：
```
Let \(V\) be a finite-dimensional real vector space with
\(m=\dim_{\R}V\ge2\). For every integer \(r\ge1\), there are \(n\ge1\)
and tensors \(x_1,\ldots,x_r\in V^{\otimes_{\R}n}\) with the following
property: whenever \(P_j:V\to E_j\) are real linear maps of rank at least
two, the tensors \((P_1\otimes\cdots\otimes P_n)(x_i)\), \(1\le i\le r\),
are linearly independent over \(\R\).
```
证明（第 131--162 行）：约到满射 P_j:V→ℝ²；选 n 使 2^n>2mn+r-1；W=V^{⊗_ℝ n}，𝒫=Surj(V,ℝ²)^n 是维数 2mn 的开子集；光滑映射 Φ:𝒫×S^{r-1}×W^r→(ℝ²)^{⊗n}，(P,u,x)↦(P_1⊗..⊗P_n)(Σ u_i x_i)；Φ 对 x 的微分处处满秩；Φ^{-1}(0) 是光滑流形，维数 2mn+r-1+rm^n-2^n<rm^n=dim_ℝ W^r；Sard 使投影到 W^r 零测；取 x 在投影外。

(b) 我补中间步：维数计算：𝒫 维数 2mn（每个满射 ℝ^{2·m} 参数，共 n 个）、S^{r-1} 维 r-1、W^r 维 rm^n；故定义域总维 2mn+(r-1)+rm^n。Φ 对 x 微分满秩意味着 Φ^{-1}(0) 的余维 ≤ 值域维 2^n，于是 Φ^{-1}(0) 维数 ≤ 定义域维 − 2^n = 2mn+r-1+rm^n−2^n。不等式 2^n>2mn+r-1 让此维数 < rm^n，即 Φ^{-1}(0) 维严格小于 W^r 维。Sard/参数化 Sard：从低维流形到高维空间的投影像零测（第 158--159 行用二阶可数 atlas，不需 𝒫 紧）。取 x∈W^r 在零测集外，则对任意 (P,u∈S^{r-1}) 有 Φ(P,u,x)≠0，即 Σ u_i(P_1⊗..⊗P_n)(x_i)≠0 对任意非零 u（u 可归一到 S^{r-1}），这正是 (P_⊗)(x_i) 实线性无关。

(c) 机械理由：为什么 2^n 对 rm^n：每多一层张量，值域维 2^n 指数增长，而参数空间维 2mn（线性于 n）和 W^r 维 rm^n（指数但底 m）。当 n 大时 2^n 相对 2mn+r-1 主导（因为 m≥2 时... 实际上要 2^n>2mn+r-1，右边线性 n、左边指数 2^n，总可解），这保证零集维差。若 m 太小（=1）则 V 无非交换对，且 dim W^r=rm^n=r·1^n=r，值域 (ℝ²)^{⊗n} 与 2^n 关系失配：这正是 7.7 里 m≥2 的消费点。rank≥2 前提（第 121 行）保证每个 P_j 可后合成 ℝ² 满射（第 132--134 行），否则张量积映射 Φ 对 x 微分不满秩、零集非流形、Sard 失效。

(d) [推测] 死路一：不用 Sard，改逐点构造 x_i（如 Hadamard/Vandermonde 型张量），但对"任意 rank≥2 的 P_j 全体"统一无关几乎不可能，一般位置是唯一省事办法。死路二：把 ℝ 换 ℂ 做全纯 Sard，但检测空间 V 是实的（自伴元实张成），复化会把独立性弱化。死路三：固定 n、让 r 增大，一旦 2^n≤2mn+r-1 不等式反向，零集投影未必零测，取不到通用 x。

### 7.9 表示下的标签 cor:tensor-represented-labels（tensor.tex 第 165--200 行）

(a) 逐字（第 167--173 行）：
```
Let \(D\) and \(V\) be as in Lemma~\ref{lem:tensor-detecting-space}.
For each \(r\ge1\), there are \(n\ge1\) and selfadjoint elements
\(x_1,\ldots,x_r\in D^{\otimes n}\) whose images are complex linearly
independent under every irreducible representation of
\(D^{\otimes n}\otmax B\), for every nonzero unital \(C^*\)-algebra \(B\).
```
证明（第 176--199 行）：把实张量映进 D^{⊗n}，它们自伴；固定不可约表示 π，各腿限制 π_j 幺元 ⇒ dim_ℝ π_j(V)≥2（用 7.7）；对实映射 V→π_j(V) 套 7.8；实基的复无关性由取伴分离实虚部得；复化后各 π_j(V) 复化嵌入表示代数；7.6 给弱闭因子、7.5 保独立到乘法。

(b) 我补中间步：这条推论把纯线性的 7.8 与 C\*-代数的表示论缝起来。关键一跳：π_j:V→π_j(V) 的 rank = dim_ℝ π_j(V)≥2（7.7 说 π_j(V) 含非交换对故 ≥2 维）。7.8 给的是"任意 rank≥2 实映射下实无关"，此处把 P_j 取成 π_j|_V。实无关到复无关：自伴算子的实基若复线性相关 Σ(a+ib)_i v_i=0，取伴得 Σ(a-ib)_i v_i=0，两式相减得 b_i=0、相加得 a_i=0。复化嵌入：(π_j(V)⊗_ℝ ℂ)→表示代数，把张量 π_j(V)^{⊗n} 的复化注入 D^{⊗n} 复化的像。最后 7.5+7.6：像的弱闭是交换因子，代数复张量积在乘法下内射，所以"复无关"在乘进 B(H) 后仍成立。

(c) 机械理由：额外张量一个任意 B（第 171 行 D^{⊗n}⊗max B）是为在 7.10 组装 w_0 时把 P_0 当"额外代数"塞进去（tensor.tex 第 313 行"allowing P_0 as the additional algebra"）：B 是任意非零幺元代数，这条推论对所有 B 一致成立，这正是标签的"表示稳定性"。幺元不可省：π_j 幺元才保证 π_j(1)=1_H，7.6 的"每块含 1_H"前提才有。

(d) [推测] 死路一：只证空间表示下的无关，忘记非空间不可约表示（不是张量积分解），7.5/7.6 正是补这个洞，省略则在 π 不分解处标签坍缩成相关。死路二：若允许 π_j 非幺元，dim 可能降到 1，rank≥2 前提断。死路三：试图对单一 n 让所有 B 统一，但 n 依赖 r 与 m，B 变化不需重选 n（因为 B 作"额外代数"由 7.5 吸收），误以为要随 B 变 n 会把构造推入无限回归。

### 7.10 全的方阵零元 lem:tensor-full-square-zero（tensor.tex 第 217--328 行）

(a) 逐字（第 219--221 行）：
```
If \(D\) is a nonzero unital \(C^*\)-algebra without characters, then
some finite maximal tensor power \(P\) of \(D\) contains a full element
\(w\) satisfying \(w^2=0\) and \(\|w\|=1\).
```
构造四步。步一（第 225--254 行）：V 基 v_1..v_m，取标签 x_1..x_m∈D^{⊗n}，在 P_0=D⊗max D^{⊗n}⊗max D^{⊗n} 里定义 s=Σ v_i⊗x_i⊗1、t=Σ v_i⊗1⊗x_i；证明 π([s,t])=Σ_{i,j}π_0([v_i,v_j])π_L(x_i)π_R(x_j)，用 7.5/7.6 说 π([s,t])=0 逼 π_0([v_i,v_j])=0，与 7.7 矛盾。步二（第 256--282 行）：z=[s,[s,t]] 自伴，证 z_+、z_- 全；对不可约 π，若 π(z)≥0 则 f_ξ(λ)=⟨e^{iλπ(s)}π(t)e^{-iλπ(s)}ξ,ξ⟩ 有界且 f_ξ''(λ)=-⟨e^{iλπ(s)}π(z)e^{-iλπ(s)}ξ,ξ⟩≤0，有界凹函数在 ℝ 上恒常 ⇒ f_ξ'(0)=⟨iπ([s,t])ξ,ξ⟩=0 对一切 ξ ⇒ iπ([s,t])=0，矛盾。步三（第 284--301 行）：I_±=span{a z_± b} 范数稠于 P_0，其乘积在 J=理想(z_-P_0z_+)里，故 J=P_0；取有限 c_i=z_-d_i z_+ 生成单位理想，注意 c_i c_j=0。步四（第 303--327 行）：新标签 x_1'..x_r'∈D^{⊗n'}，w_0=Σ c_i⊗x_i'，w_0²=0（因 c_ic_j=0），全性由 7.5+7.6+7.9（P_0 作额外代数）保证，w=w_0/‖w_0‖。

(b) 我补中间步：双交换子 z=[s,[s,t]] 的自伴性：[s,t] 反自伴（两自伴之换位），[s,[s,t]] 是 [自伴, 反自伴]=自伴。f_ξ'' 的来源：对 λ 求两次导，d/dλ(e^{iλπ(s)}Te^{-iλπ(s)})=iλ? 展开即 e^{iλπ(s)}[π(s),π(t)]e^{-iλπ(s)} 再导一次得 -e^{iλπ(s)}[s,[s,t]]e^{-iλπ(s)}=−e^{...}π(z)e^{...}。有界凹 ⇒ 常数（否则在两端发散），故一阶导恒 0 特别在 0。z_+、z_- 全：因 π(z_+)=π(z)_+ 与 π(z)_+≠0 对每不可约 π（若 π(z)≥0 会矛盾、若 π(z)≤0 亦矛盾、若 π(z) 不定则正负部都非零）。I_± 稠：z_± 全意味着 z_± 生成的闭理想=P_0，而代数理想 I_± 范数稠于该闭理想。c_ic_j=0 因 z_+z_-=0。w_0 全：若某不可约 π 把 w_0 灭掉，由 7.5（x_i' 独立、c_i 作额外代数侧）得 π_0(c_i)=0 全 i，与 c_i 生成单位理想（且 π_0 幺元）矛盾。

(c) 机械理由：为什么 z 必须是双交换子，并非 [s,t]：[s,t] 未必自伴，其正负部不好谈；[s,[s,t]] 自伴使 z_± 有定义，且"有界凹/凸 ⇒ 常"这个一维实函数论证只能作用在自伴算子的期望值上。P_0 用 D⊗D^{⊗n}⊗D^{⊗n} 三块，并非 D⊗D：因为 s、t 分别共享第一块 v_i、把标签分到二、三块，这样 [s,t] 在第一块产生 [v_i,v_j]、在二三块产生独立标签 x_i、x_j，7.5 才能把 π_0([v_i,v_j]) 系数逼零。层数 n、n' 都依赖 V 与桥族，无上界（第 325--327 行明写）。归一 ‖w‖=1 是 7.11 里 h=|w|+|w^*| 范数 1 的前提。

(d) [推测] 死路一：直接用 [s,t] 造方阵零元，但 [s,t] 不自伴，正负部全性论证（依赖 f_ξ 凹凸）无从谈起。死路二：不引入 c_ic_j=0 结构而想让 w 直接=w_0 无平方零，那 w²≠0 破坏 7.11 极分解里 q≤1-p 的方阵零前提。死路三：用姊妹篇 Fixed231 的高斯/纯态切割法直接得两个全正交正元（introduction.tex 第 112--119 行），然后硬拼方阵零元，但那种正元不带 w²=0 的乘零结构，进不到 cone map，会在 prop:full-cone 的极分解步断。

### 7.11 矩阵锥同态 prop:full-cone（tensor.tex 第 330--399 行）

(a) 逐字（第 332--335、339--344 行）：C={f∈C([0,1],M_2):f(0)∈ℂ1_{M_2}}、ι(t)=t（C 是 C_0((0,1],M_2) 的单位化）；
```
For every nonzero unital \(C^*\)-algebra \(D\) without characters,
there are an integer \(m\ge1\), the maximal tensor power \(P=D^{\otimes m}\),
and a unital \(*\)-homomorphism \(\eta:C\to P\) such that \(\eta(\iota e_{11})\)
is full in \(P\).
```
证明（第 348--398 行）：取 7.10 的 P、w，P^{**} 里极分解 w=u|w|，p=u^*u、q=uu^*；w²=0 使 q≤1-p；E_11=p、E_22=q、E_21=u、E_12=u^* 成单位 p+q 的矩阵单位；h=|w|+|w^*| 范数 1、支撑 p+q、与矩阵单位交换，hE_11=|w|、hE_22=|w^*|、hE_21=w、hE_12=w^*；交换泛函演算定 φ:C_0((0,1],M_2)→P^{**}，f⊗e_ij↦f(h)E_ij，值在 P（用 f 多项式逼近，h^kE_ij∈P）；单位化得 η:C→P，η(ιe_21)=w、η(ιe_11)=|w|；w 与 |w| 生成同一闭理想 ⇒ η(ιe_11) 全。

(b) 我补中间步：q≤1-p 的来源：w²=0 使 ran(w) 闭包 ⊆ ker(w)；p 是 ker(w) 的正交补上投影、q 是 ran(w) 上投影，故 q≤1-p。矩阵单位关系验证：E_11²=p²=p、E_21E_12=uu^*=q=E_22、E_12E_21=u^*u=p=E_11、E_21E_22=E_21 等，全靠 q≤1-p（于是 pq=qp=0）。h 与矩阵单位交换：h=|w|+|w^*|，|w| 支撑在 p、|w^*| 支撑在 q，二者正交支撑故 hE_11=(|w|+|w^*|)p=|w|；hE_21=(|w|+|w^*|)u... 论文直接给 hE_21=w，因 |w|u^*=w^*? 我接：w=u|w|，|w^*|=|w| 经 u 共轭，h 在极分解下与 u 的初始/终支撑兼容。φ 值∈B 的多项式论证：f∈C_0 用 vanishing-at-0 多项式 p_m→f 一致，p_m(h)E_ij=Σ c_k h^k E_ij，k≥1 项 h^kE_ij=h^{k-1}(hE_ij)∈P（hE_ij∈P 因 hE_11=|w|∈P 等），故 f(h)E_ij∈P。理想等同：w 的理想含 w^*w=|w|²⊂含 |w|（泛函演算）；|w| 的理想含 w(|w|+ε)^{-1}|w|→w。

(c) 机械理由：为什么用 C（M_2 锥），并非直接用 w：prop:rw（下一步 7.13）的输入要一对精确等价正交正元且缺陷被 (b_1-1/2)_+ 压住，而 cone map η 的 ιe_11↦|w|、ιe_21↦w 提供了"带参数 t 的连续族"，让 cube 构造能把第一矩阵角做成"在特定区域作用为恒等"。q≤1-p（方阵零元的极分解特征）是 η 存在的前提；若 w²≠0 则 q 与 p 不分离、矩阵单位不成立、φ 无从定义（这正是 7.10 造 w²=0 的消费点）。不需要 u∈P 或 p+q=1_P（第 386--387 行明说），因为 φ 只碰 f(h)E_ij 这种在 P 里的组合。

(d) [推测] 死路一：跳过 cone map，直接从 w 造 I(2,3)，但没有连续参数 t 就无法在 cube 上定位缺陷，dim-drop 的坐标轴支撑几何落空。死路二：若声称 η 是单射（把 C 嵌进 P），那需要 |w| 无核、u∈P 等额外结构，thm:finite 只要求单同态（可带核），强求嵌入会在 q≠p 的支撑不匹配处断。死路三：把 h=|w|+|w^*| 换成 |w| 单独，则 h 只支撑在 p、E_22=q 部分拿不到权重，η(ιe_11) 的泛函演算在 (0,1] 上覆盖不全、全性丢。

### 7.12 立方体模型 lem:cone-cube（dimension-drop.tex 第 18--78 行）

(a) 逐字（第 19--31 行）：对 k≥1，C^{⊗k} 等同于
```
\left\{f\in C([0,1]^k,M_2^{\otimes k}):f(t)\in\bigotimes_{i=1}^k E_i(t)\right\},
E_i(t)=\begin{cases}M_2,&t_i>0,\\ \C1,&t_i=0.\end{cases}
```
证明（第 34--77 行）：C 核（C_0((0,1],M_2) 的单位化）⇒ 极大=极小张量幂；点到 M_2^{⊗k} 的直和求值是忠实表示故自然映射等距；反向用 M_2 基 b_0=1,b_1,b_2,b_3 展开 f(t)=Σ_α f_α(t)b_{α_1}⊗..⊗b_{α_k}，S_α={i:α_i≠0}，边界条件 f_α(t)=0 当某 i∈S_α 有 t_i=0；p_α(t)=∏_{i∈S_α}t_i，f_α·p_α/(p_α+ε)→f_α 一致（第 56--60 行），故 f_α 落在 p_α 生成的闭标量理想里；标量函数乘恒等∈C^{⊗k}（一变量函数乘积逼近），p_α·(b_{α_1}⊗..) 是 C 元素的张量（第 i 因子为 ιb_{α_i} 或 1），标量理想逼近把每项塞进 C^{⊗k}。

(b) 我补中间步：E_i(t) 的定义来自 C 的纤维：t_i=0 时该因子被迫标量（因 C 在 0 处要求 f(0)∈ℂ1），t_i>0 时是全 M_2。自然映射等距：直和 ⊕_{t∈[0,1]^k}（求值）是 C^{⊗k} 的忠实表示（点评估分离元素），其空间张量幂的范数＝sup 点范数，故与 C([0,1]^k,·) 里的 sup 范一致。p_α/(p_α+ε) 逼近 1 的机制：f_α 在 p_α=0（即某 t_i=0、i∈S_α）上为 0，在 {p_α≥ε'} 外 f_α 小，故 f_α·p_α/(p_α+ε) 只在 f_α 非零处偏离 f_α 一个 O(ε) 因子。每项 p_α·b_{α} 是初等张量：第 i 因子若 i∈S_α 取 ι b_{α_i}（在 0 处该因子为 0，符合 C 边界）、否则取 1；把这些初等张量按 f_α 的标量系数（∈闭 p_α 理想）组合即得 f。

(c) 机械理由：核性是"极大=极小"的前提，C 的核来自它是核 C\*-代数（拓扑空间上的连续函数张矩阵）的单位化；一旦极大≠极小，cube 认同等距失效，η^{⊗k} 在 P^{⊗k} 里就不再有连续函数模型，后续坐标几何全塌。ε 出现在 p_α/(p_α+ε) 只是逼近工具，不进入最终常数。b_0=1 的选取让 α_i=0 的因子是恒等，与 E_i(t) 在 t_i>0 时全 M_2、在 t_i=0 时"至少含标量"一致。这个引理本身不含比较，纯粹是把张量幂"翻译成 cube 上的连续矩阵值函数"，为 7.14 的缺陷定位服务。

(d) [推测] 死路一：把 cube 换成球或单纯形做缺陷定位，边界条件与坐标轴支撑不匹配，y_j 落在坐标轴附近（t_j>δ、其余 <δ/2）的几何失。死路二：若 C 非核（例如换成非核代数的锥），极小于极大分离，等距失败，只能在极小侧建模但 7.13 的连续嵌入族需要全 M_2^{⊗k} 纤维、非核侧纤维变复杂。死路三：跳过标量理想逼近、硬把 f 写成有限和，但满足边界条件的 f 未必是有限初等张量组合，逼近步是必需的。

### 7.13 连续 M_2 嵌入族 lem:matrix-simplex（dimension-drop.tex 第 80--136 行）

(a) 逐字（第 81--91 行）：对每 k≥1 存在点范连续的幺元 \*-同态族
```
\theta_r:M_2\longrightarrow M_2^{\otimes k},\qquad r\in\Delta_{k-1}
=\left\{r\in[0,1]^k:\sum_i r_i=1\right\},
```
其像只用 {i:r_i>0} 指标张量因子；第 j 顶点处 θ_r 是第 j 坐标包含。证明（第 94--135 行）：F 为翻转酉，U(s)=(1+F)/2+e^{iπs}(1-F)/2（U(0)=1、U(1)=F、F(a⊗1)F^*=1⊗a）；对 k 归纳，r_k<1 时用归一化权重 (r_1/(1-r_k),..) 的 τ 并令 θ_r(a)=(τ⊗id)(U(r_k)(a⊗1)U(r_k)^*)；r_k=1 时令 θ_r(a)=1^{⊗(k-1)}⊗a；连续性估计 ‖θ_r(a)-1^{⊗(k-1)}⊗a‖≤2‖a‖·‖U(r_k)-F‖→0（r_k→1，对 τ 一致）。

(b) 我补中间步：U(s) 是翻转的本征空间插值：F 本征值 ±1，(1±F)/2 是投影；e^{iπs} 把 −1 本征空间旋转，s=0 恒等、s=1 时 −1 空间乘 e^{iπ}=-1 得 F。归纳在 r_k<1 良定义（归一化权重和为 1）；难点在 r_k→1 时归一化权重 r_i/(1-r_k) 无极限，但估计式 ‖U(r_k)-F‖→0 与 τ 无关，故点范连续在整个闭单纯形成立，包括质心附近 r_k→1 的方向性极限。支撑条件：若某 r_i=0 则归纳假设令 τ 的第 i 因子标量，(τ⊗id) 保持；若 r_k=0 则 θ_r(a)=τ(a)⊗1 恰在归纳假设里。顶点检验：第 j 顶点 r=δ_j 对应"只用第 j 因子"＝第 j 坐标包含。

(c) 机械理由：θ_r 只用在 r_i>0 的因子，是为了让 7.14 的 a_i(t)=H(t)θ_{r(t)}(e_ii) 在 t_j=0（⇒r_j(t)=0）处自动满足 E_j 的标量边界（dimension-drop.tex 第 254--257 行），从而 a_i、v∈C^{⊗k}。U(0)=1 保证当某 r_k=0 时 θ 退化为低一维的 τ⊗id（不在 0 权重因子上乱动）；U(1)=F 提供交换 a⊗1↔1⊗a 的能力，正是单纯形内部把 M_2"沿腿平移"的机制。点范连续（非一致）够用，因为下一步只把 θ_{r(t)} 用在固定 t 的纤维上。

(d) [推测] 死路一：想用离散顶点插值（分段常数 θ），那在 r 变化时不连续、a_i(t) 失去连续性，cube 里原点连续论证崩。死路二：用极小多项式酉路径替代 U(s) 的本征插值，一旦 U 不满足 U(1)=F 或 (1+F)/2 投影结构，交换 a⊗1↔1⊗a 失败，支撑条件丢。死路三：若允许 θ_r 用到 r_i=0 的因子，则 t_j=0 处 a_i(t) 在该因子非标的、破坏 C^{⊗k} 边界归属，η^{⊗k} 后像不在 P^{⊗k}。

### 7.14 从锥同态到维数下降映射 prop:cone-drop（dimension-drop.tex 第 138--368 行）

(a) 逐字（第 139--153 行）：
```
Let \(P\) be a nonzero unital \(C^*\)-algebra. Suppose that there is a
unital \(*\)-homomorphism \(\eta:C\to P\) such that \(\eta(\iota e_{11})\)
is full in \(P\). Then, for some finite \(m\ge1\), the maximal tensor power
\(B=P^{\otimes m}\) contains orthogonal positive contractions \(b_1,b_2\)
and an element \(v_B\) such that
b_1=v_B^*v_B,\qquad b_2=v_Bv_B^*,\qquad
1_B-b_1-b_2\precsim(b_1-1/2)_+.
Consequently there is a unital \(*\)-homomorphism \(I(2,3)\to P^{\otimes m}\).
```
证明五段。段一"全割线与其比较"（第 163--194 行）：b=η(ιe_11)，选 h_i,ℓ_i∈P（1≤i≤N）使 ‖1_P-Σ h_i bℓ_i‖<1/2；小 δ 使 c=(b-δ)_+=η(q)、q(t)=(t-δ)_+e_11 仍满足 ‖1_P-S‖<1（S=Σ h_i cℓ_i）⇒S 可逆、c 全；记 T=(h_1c^{1/2},..)、Z=(c^{1/2}ℓ_1,..)^T、d=Z^*Z，因 S=TZ 有 S^*S≤‖T‖²d，故 d 可逆，列 V=(ℓ_i d^{-1/2}) 给 V^*diag(c,..,c)V=1_P 即 [1_P]≤N[c]。段二"辅助放大"（第 196--223 行）：c_1=c、c_2=η((ι-δ)_+e_22) 正交等价，选 L 使 2^L≥N、R=P^{⊗L}、e=c^{⊗L}、k=N^L；2^L 个 c_{σ_1}⊗..⊗c_{σ_L} 两两正交同类 [e]、和=(c_1+c_2)^{⊗L}≤1_R；张量 N 次 (式 191) 得式 215 [1_R]≤2^L[e]≤... ≤N^L[e]=k[e]。段三"立方体正交对"（第 225--296 行）：g(s)=(1-2s/δ)_+、H(t)=1-∏g(t_j)、d(t)=max_j t_j、r_i(t)=(t_i/d-1/2)_+/Σ(·)、a_i(t)=H(t)θ_{r(t)}(e_ii)、v(t)=√H(t)θ_{r(t)}(e_21)，原点取 0；界 0≤H≤(2/δ)Σt_j 证连续；式 260 v^*v=a_1、vv^*=a_2、a_1a_2=0、a_1+a_2=H1；缺陷 X=1-a_1-a_2=g^{⊗k}；y_j=g^{⊗(j-1)}⊗q⊗g^{⊗(k-j)}，a_1y_j=y_j（式 276，因 y_j(t)≠0 处 t_j>δ、其余 <δ/2 ⇒ r(t) 是第 j 顶点、H=1）；式 310 k[X]≤N[Y]，Y=Σy_j。段四"吸收缺陷"（第 317--361 行）：B=P^{⊗k}⊗R=P^{⊗(k+L)}、b_i=a_i⊗1_R；(a_1-1/2)_+Y=Y/2、z=√(2Y)⊗1_R 使 z^*(b_1-1/2)_+z=Y⊗1_R；链 [X⊗1_R]≤k[X⊗e]≤N[Y⊗e]≤[Y⊗1_R]≤[(b_1-1/2)_+]。段五：压回 B 内得 1_B-b_1-b_2=X⊗1_R≼(b_1-1/2)_+，prop:rw（割线 1/2）给 I(2,3)→B，m=k+L。

(b) 我补中间步：段一里 S^*S≤‖T‖²d：S=TZ、S^*S=Z^*T^*TZ≤‖T‖²Z^*Z=‖T‖²d；S 可逆 ⇒ S^*S 可逆 ⇒ d 可逆（d≥‖T‖^{-2}S^*S>0 有下界）。V^*diag(c)V=Σ (ℓ_i d^{-1/2})^*c(ℓ_i d^{-1/2})... 我接这里用的是 d=Z^*Z 与 V=d^{-1/2}Z^*(列) 的对偶，最终 Σ=1_P 表达 [1_P]≤N[c]（N 个 c 的块对角占住 1）。式 215 三条界：左 N[e]≤2^L[e] 来自 [e]=[c^{⊗L}]≥? 论文说"Tensoring (191) L times"给 [1_P]^{⊗L}? 我接：把 [1_P]≤N[c] 张 L 次得 [1_R]≤N^L[e]（右界 k[e]），而 2^L 个正交同类项和 ≤1_R 给 2^L[e]≤[1_R]（中界），合并成式 215。注意论文第 214 行写的是 "N[e]≤2^L[e]≤[1_R]≤N^L[e]"，第一不等式 N≤2^L（因 2^L≥N）、第二是正交和 ≤1。段四链：第一 [X⊗1_R]≤k[X⊗e] 用 [1_R]≤k[e] 张 X；第二 [X⊗e]... 论文 k[X]≤N[Y] 张 e 得 k[X⊗e]≤N[Y⊗e]；第三 N[Y⊗e]≤[Y⊗1_R] 用 N[e]≤[1_R] 张 Y；末 [Y⊗1_R]≤[(b_1-1/2)_+] 用精确见证 z（z^*(b_1-1/2)_+z=Y⊗1_R）。压回 B：块矩阵比较 W_n^*(b⊕0)W_n→a⊕0 压缩到 (1,1) 角 (W_n)_{11}^*b(W_n)_{11}→a（第 350--357 行）。

(c) 机械理由：N 来自全性表达式项数、2^L≥N 使 N[e]≤2^L[e]、k=N^L 使缺陷拷贝 k 与 y_j 拷贝 N 配平（式 310 k[X]≤N[Y]），R=P^{⊗L} 是"消多重数而不消去 Cuntz 序"的装置（第 312--315 行），这正是为什么不能只在一个张量幂里做。割线 1/2 的选值：r_i(t) 用 (t_i/d−1/2)_+ 因 max 归一后至少一坐标=1、其 (·−1/2)_+=1/2 非零保证分母≥1/2 良定义（第 240 行），且 y_j 区里 a_1=H·1、(a_1−1/2)_+ 在该区=1/2·1，使 (a_1−1/2)_+Y=Y/2 精确给见证 z 的因子 1/2（若割线非 1/2，则 (a_1−割线)_+Y 不再是 Y/2、z=√(2Y) 要改标）。δ 同时是 full-cut 的割线（c=(b−δ)_+）和 g(s)=(1−2s/δ)_+ 的斜率分母，二者一致才让 y_j 支撑区 t_j>δ、其余 <δ/2 与 H=1 吻合（第 278--281 行）。X≼(b_1−1/2)_+ 是 prop:rw 的输入 (a_1−ε)_+ 取 ε=1/2，喂进去收尾。

(d) [推测] 死路一：不设辅助 R、直接在 P^{⊗k} 里想要 [X]≤[(b_1−1/2)_+]，但 k[X]≤N[Y] 的多重数 k≠N 无法在 Cuntz 半群里消去（无 cancellation），这正是 R=P^{⊗L} 存在的理由，省掉它链断在第二/三不等式。死路二：把割线 1/2 改成任意 ε，则 (a_1−ε)_+Y 不再是干净 Y/2、见证 z 的因子要随 ε 重标且 r_i 的分母 ≥(1/2) 与 ε 不再匹配、良定义可能失。死路三：把 cube 缺陷定位换成球面，坐标轴方向不显、r(t) 顶点化（第 281 行"r(t) is exactly the j-th vertex"）失，a_1y_j=y_j 断，全链塌。

### 7.15 可分归约 lem:separable（application.tex 第 17--32 行）

(a) 逐字（第 18--19 行）：
```
Every nonzero unital \(C^*\)-algebra \(B\) without characters contains a
separable \(C^*\)-subalgebra \(D\) without characters and with \(1_D=1_B\).
```
证明（第 22--31 行）：自伴交换子生成的闭理想=B（否则商是非零幺元交换代数带 character）；故存在有限 r、h_i,k_i∈B、b_i,c_i∈B_sa 使 ‖1_B−Σ_{i=1}^r h_i[b_i,c_i]k_i‖<1；D 由 1_B 与所有出现元素生成，幺元可分；D 的 character 把和映 0、单位映 1，与严格范数界及压缩性矛盾。

(b) 我补中间步：‖1−X‖<1 型表达式在 character χ 下：χ(Σ h_i[b_i,c_i]k_i)=Σ χ(h_i)χ([b_i,c_i])χ(k_i)，而 character 到交换 ℂ，χ([b,c])=χ(bc)−χ(cb)=0，故整和映 0、1−X 映 1；χ 压缩 ⇒ |1|=‖χ(1−X)‖≤‖1−X‖<1，矛盾。D 可分是因为由可数（有限加有理系数多项式）生成元生成的 C\*-代数。D 无 character：任何 D 上 character 与 B 上 character 的差别在"能否延到 B"，这里用严格界绕过延拓问题：若 D 有 character，直接对上面表达式（元素全在 D 里）导出矛盾，不必先延到 B。

(c) 机械理由：可分性是 KR 定理 2.5（prop:kr(2)）和 Dadarlat--Toms Theorem 1.1 的硬输入，thm:main 假设 A 可分，但 F_ω(A) 未必可分，lem:separable 就是"在 F_ω(A) 里挑出可分子代数 D"的桥梁（application.tex 第 12--15 行明引 KR Lemma 3.5）。1_D=1_B（同单位）是 prop:kr(1)(2) 都要求的"contains the ambient unit"。严格 <1 ，并非 ≤1 是压缩性出矛盾的关键：若 =1 则 χ 映到边界不矛盾。

(d) [推测] 死路一：假设 B 本身可分来省掉归约，但 F_ω(A)=A_ω∩A' 里 A_ω 是 ℓ^∞ 商、通常不可分，归约不可跳。死路二：用 character 从子代数扩到全代数的延拓定理，但一般 C\*-子代数的 character 未必延到全代数（需理想或核条件），故必须用严格界直接反证。死路三：取 D 为可分但不同单位（不含 1_B），则 prop:kr(1) 的"contains the ambient unit"前提失，commuting-copies 送不进 F_ω(A)。

### 7.16 Kirchberg--Rørdam 输入 prop:kr（preliminaries.tex 第 69--131 行）

(a) 逐字两断言（第 72--78 行，已在第一节抄录）。断言 (1) 的证明（第 91--123 行）：对可分 E⊂F_ω(A) 构造 D→F_ω(A)∩E' 的幺元映射；取可数稠密幺元 ℚ+iℚ 子代数 D_0⊂D；对 x∈D_0 取有界提升 (a_l^x)、sup_l‖a_l^x‖≤2‖x‖；取 A 可数稠密集与 E 的可数稠密提升 (b_s^j)；枚举关系缺陷测试与中心性测试；对每输出指标 s 选 l(s) 使前 s 个测试在 1/s 内成立且 ‖[a_{l(s)}^x,b_s^j]‖<1/s；每有限要求在某 ω-大旧指标集成立、有限交非空；新序列 (a_{l(s)}^x)_s 中心且满足所有代数关系（普通极限⇒沿任意自由 ω），类定 D_0→F_ω(A)∩E' 的 ℚ+iℚ \*-同态，一致界 2‖x‖ 连续延拓到复幺元 \*-同态。断言 (2) 是 KR Theorem 2.5（第 126 行）。

(b) 我补中间步：这是对角"重标（reindexing）"引理，把 F_ω(A) 里的可分 D 复制成任意有限个交换的 D^{⊗max}。为何 l(s) 的选取使"前 s 个测试在 1/s 内"：因每个旧关系缺陷沿 ω→0，对固定 s 有 ω-大多个 l 满足之，取 l(s) 使其对前 s 个成立。为何普通极限关系⇒沿 ω：序列在通常意义下逐点趋于 0（对所有足够大指标），自由超滤子含所有余有限集，故沿 ω 也趋于 0。中心性 ‖[a_{l(s)}^x,b_s^j]‖<1/s 对固定 s、每 b_s^j 是 A 中固定元、原始中心性适用（第 110--112 行"original centrality applies"）。注入性不需要（第 122 行"Injectivity of the reindexed maps is not needed"）：这正是 thm:finite 只给"单同态"就够用的原因。第 83--87 行：幺元 A 时姊妹篇 Fixed231 的消灭理想为零（消灭 A 全部元素者消灭其单位），其 F(A) 恰是这里的 norm central-sequence 代数。

(c) 机械理由：一致界 2‖x‖（第 94、118 行）是连续延拓 D_0→D 的前提（Lipschitz/有界线性映射延拓）；提升用"截断坐标范数不改 ultrapower 类"（第 96--97 行）。自由超滤子在"沿 ω=普通极限"这一步是必需的：principal 超滤子只测单点，重标序列的逐点收敛沿 principal 未必集中到该点。1/s 与 ‖[·,·]‖<1/s 的趋于 0 保证极限映射保乘、保加、保 \*、保中心，因此是真 \*-同态。断言 (2) 的 subhomogeneous 定义（第 127--128 行）要求所有不可约表示维数有共同有限界，I(2,3) 的界是 6（第 51 行），吻合。

(d) [推测] 死路一：想用 tracial ultrapower 版 commuting-copies，但那条要迹结构，无 character 的 A 可能无迹，断在提升的 ℓ^∞/c_ω 定义上。死路二：若 D 不可分则不能取可数稠密 D_0 与枚举测试，重标对角论证失（可分性在此消费）。死路三：若声称重标映射单射以保 D 结构，那需要消灭理想控制，thm:main 只要存在性单同态，强求单射会在核非零处断。

### 7.17 主定理与推论（application.tex 第 3--10、34--93 行）

(a) 逐字 thm:finite 证明（第 3--10 行）：prop:full-cone 给 P=D^{⊗m_0} 与 η:C→P、η(ιe_11) 全；prop:cone-drop 给 I(2,3)→P^{⊗s}；极大张量积结合律认出 P^{⊗s}=D^{⊗m_0s}。thm:main 证明（第 34--61 行）：设 F_ω(A) 无 character（非零幺元，含对角单位），由 lem:separable 取可分幺元无 character D⊂F_ω(A) 同单位；由 thm:finite 与 prop:kr(1) 复合得 I(2,3)→D^{⊗max m}→F_ω(A)，像 E；I(2,3) 每不可约表示经 [0,1] 点求值分拆（中心代数 C([0,1])1 经 character 作用、消失于求值点的 section 被灭），不可约维数在 0、1、内部为 2、3、6，故 I(2,3) subhomogeneous 无 character；商 E 同（每不可约表示/character 沿商映射回拉），1_E=1_{F_ω(A)}；prop:kr(2) 给 A≅A⊗min Z。反向：A≅A⊗min Z 经 prop:kr(2) 得 F_ω(A) 含无 character 子代数 E，F_ω(A) 的 character 限制到 E 矛盾。cor:infinite-tensor 证明（第 63--93 行）：x↦x⊗1_D 是幺元嵌入 ⇒ B 非零幺元可分、ι_m 幺元；φ（thm:finite）复合 q_m（极大→极小商，幺元、无需核性）与 ι_m 得 θ:I(2,3)→B、E=θ(I(2,3))；I(2,3) 可分、subhomogeneous、无 character ⇒ E 同（即便 θ 带核）；Dadarlat--Toms Theorem 1.1 给 B≅B⊗min Z；z↦1_B⊗z 幺元嵌入 Z 进 B⊗min Z，经同构逆搬运得 B 内幺元 Z 拷贝。

(b) 我补中间步：thm:main 里"I(2,3) 不可约表示经点求值"我接一下：I(2,3) 的中心是 C([0,1])1（scalar 函数），不可约表示把中心映到 ℂ 即给出 [0,1] 中一点 t_0（谱），纤维在 t_0 处是 M_2⊗1_3（t=0）、1_2⊗M_3（t=1）、M_2⊗M_3（内部），其不可约表示就是这些矩阵代数的，维数 2、3、6；消失于 t_0 的 section 在该表示下为 0（用消于该点的标量函数逼近）。故商 E 的不可约表示回拉到 I(2,3) 的，维数 ≤6。cor:infinite-tensor 里 q_m 存在（极大→极小典范满同态）不需要核性；θ 带核仍保 subhomogeneous 与无 character，因为两者都对商封闭（回拉论证）。幺元 Z 拷贝的"搬运"：B≅B⊗min Z 是同构（自动幺元），其逆把 1_B⊗z 映回 B，得单射 Z→B。

(c) 机械理由：为什么 thm:finite 用极大张量积、cor:infinite-tensor 用极小：thm:finite 全程在极大侧造 D^{⊗max m}（prop:kr(1) 送的正是极大张量幂），cor 里再用 q_m 降到极小以匹配无限张量幂 B 的归纳极限定义（B 用 ⊗min）。可分性在 thm:main 出现在 lem:separable 与 prop:kr(2)（要求 D 可分），在 cor 出现在 DT Theorem 1.1 的输入；thm:finite 本身不需可分（introduction.tex 第 48--49 行）。幺元假设排除掉零代数与无单位反例：character 定义"到 ℂ 非零同态、幺元代数上自动幺元"依赖单位；非零排除 E=0 使 F_ω(A) 平凡、判据真空成立。核性、单性、迹、维数、比较性全都不需要（introduction.tex 第 46--48 行），这是 thm:main 相对 RT/PTV 的普适点。

(d) [推测] 死路一：想在 cor:infinite-tensor 里让有限幂 D^{⊗min m} 自己吸收 Z，但 thm:finite 只给 I(2,3) 单同态、不给吸收，introduction.tex 第 64--65、82--83 行明说吸收结论关于无限幂非有限幂，强推有限幂会在 DT 定理前提（无限极限里的同单位 subhomogeneous 子代数）失。死路二：省略 q_m 直接极大张量幂认成 B，那 B 的定义（⊗min 归纳极限）与极大不符，ι_m 未必嵌入、θ 未必良定义。死路三：把反向证明（A≅A⊗min Z⇒F_ω(A) 无 character）用 thm:main 自身去证会循环；论文用 prop:kr(2) 的另一侧（含无 character 子代数）直接限制，绕开循环，误用则断在自指。

## 八、机械理由问答（把散落的"为什么"聚成一节）

问：为什么必须是 norm central-sequence 代数 F_ω(A)=A_ω∩A'，并非别的中心序列代数？答：A_ω 是 ℓ^∞(ℕ,A) 对 c_ω（沿 ω 范数趋于 0 的序列）的商，用范数，并非弱/迹拓扑，正好保留一维表示的信息。死路三里我论证过：tracial ultrapower 会抹掉 character，从而"无 character"变成空条件；只有 norm 商里 character 仍存活，"F_ω(A) 无 character"才有内容（introduction.tex 第 6--9 行定义、preliminaries.tex 第 129--130 行锁定）。

问：自由超滤子 ω 到底起什么作用？答：两处。一是在 prop:kr(1) 重标里，"沿 ω 趋于 0"要与"普通极限"等价，自由（含余有限集）保证逐点关系沿 ω 仍成立（preliminaries.tex 第 114--117 行）。二是 thm:main 声明"对任意自由超滤子"都成立（introduction.tex 第 38--39 行），主定理不挑 ω；换成主超滤子，F_ω(A) 沿该点求值有 character，双向等价两头同时塌。

问："无 character"假设被用在哪一步？答：三处，且仅三处。lem:separable 用它把交换子理想顶成全体（application.tex 第 22--24 行）；lem:tensor-detecting-space 同样（tensor.tex 第 103--107 行，我数过一次，这两处是同一条"交换子理想=全体"的两版本）；thm:main 的进入点是"F_ω(A) 无 character 才有可分无 character 子代数 D"。一旦有 character，这些交换子落进 character 核、生成真理想，检测空间 V 与标签链在第一步就断。

问：维度下降函数（这里体现为 cube 上的 g、H、r 与割线 1/2）为什么非出现不可？答：因为 prop:rw 要的不是"两个全正交正元"（那是姊妹篇 Fixed231 Theorem 1.4 给的），是"精确等价对 + 缺陷 ≼(b_1−1/2)_+"这一 Cuntz 比较（introduction.tex 第 130--134 行）。cube 模型（lem:cone-cube）把缺陷 X=g^{⊗k} 定位到原点、把 y_j 定位到坐标轴附近使 a_1y_j=y_j（dimension-drop.tex 第 275--284 行），这才把"(b_1−1/2)_+ 在某区域作用成恒等"变成可验证的几何，从而喂出 prop:rw。没有这层几何，全正交对推不到 I(2,3)。

问：无限极小张量幂的 Z-stability 与单代数判据是什么关系？答：[外部推断] Jiang--Su 原定理（JS）说单、可分、核、无穷维、有迹的代数吸收 Z；DT 把"吸收"重述为"无限张量幂含同单位 subhomogeneous 无 character 子代数则 Z-stable"（introduction.tex 第 90--91 行、application.tex 第 86--88 行）。cor:infinite-tensor 完全不要单性、核性，只靠 I(2,3) 的商提供那个子代数，把 DT 的输入凑齐，这是它比 JS 原始判据更"无结构假设"的地方。

问：幺元与可分性各自排除掉什么反例？答：幺元排除零代数与无单位代数：character 定义为"到 ℂ 的非零同态、幺元代数上自动幺元"（introduction.tex 第 11--12 行）要靠单位；thm:main 证明开头"非零幺元因为含对角单位"（application.tex 第 35--36 行）。可分性排除 ℓ^∞ 型不可分病理：lem:separable 允许 F_ω(A) 本身不可分但要能挑出可分 D；thm:finite 明确不需要可分（introduction.tex 第 48--49 行），而 cor 需要（DT 定理的输入）。二者一硬一软：幺元是判据成立的逻辑前提，可分是把构造接回已知吸收定理的适配层。

## 九、Lean 取证与模块边界

我按注册项（formalization.yaml 第 1002--1004 行：comparator_config=ComparatorChallenges/CharacterCriterion.json，declaration=OAI.KirchbergRordam.character_criterion，file=OAI/Analysis/CharacterCriterion/Main.lean）取证，书目条目在第 712--714 行（标题与 pdf 路径，我没打开 pdf）。comparator json 只声明 solution_module=OAI.Analysis.CharacterCriterion.Main、theorem_names=["OAI.KirchbergRordam.character_criterion"]、permitted_axioms=[propext, Quot.sound, Classical.choice]、enable_nanoda=false；也就是说机器化只用到这三个标准公理，没有额外假设，这点和我正文"无附加正则性公理"的姿态一致。

Main.lean 里定理本体（第 52--58 行）陈述为：
```
theorem character_criterion
    (A : Type) [CStarAlgebra A] [Nontrivial A] [TopologicalSpace.SeparableSpace A]
    (ω : Ultrafilter ℕ) (hω : (ω : Filter ℕ)≤Filter.cofinite) :
    HasNoCharacters (NormUltrapower.CentralAlgebra A ω) ↔
      Nonempty (A ≃⋆ₐ[ℂ] MinTensor.Algebra A JiangSu.Algebra) := by
```
我逐字对照 tex 版 thm:main：Nontrivial A 对应"非零"，SeparableSpace A 对应"可分"，hω:ω≤cofinite 是"自由超滤子"的 Lean 编码（一个超滤子精细于 cofinite 滤子即自由）；HasNoCharacters（Definitions.lean 第 2125--2126 行定义为 ∀ χ:A→⋆ₙₐ[ℂ]ℂ, χ=0，即所有非幺元 \*-代数同态为零）对应"无 character"；右边 Nonempty(A ≃⋆ₐ[ℂ] MinTensor.Algebra A JiangSu.Algebra) 对应 A≅A⊗min Z。Main.lean 第 10--49 行先证 nonzero_character_one（非零 BanachStarAlgHom 到 ℂ 把 1 映 1）与 hasNoCharacters_iff（HasNoCharacters ↔ IsEmpty(幺元 \*-同态集)），把"非零同态"与"幺元同态"两套定义对齐，这正是 tex 里"幺元代数上 character 自动幺元"（introduction.tex 第 11--12 行）的机器版。第 57--58 行整条定理化约到 `StandardPrimeModel.presentation.character_criterion A ω hω`。

关于 Jiang--Su 代数 Z：Lean 没有把它当成公理对象，它被实打实地构造出来。JiangSu.lean 第 41--53 行的 StepParameters 记录每步参数 p、q、k₀、k₁，带约束 2≤p、2≤q、p.Coprime q、(p·k₀).Coprime(q·k₁)、k₀.Coprime k₁、grow₀:2·p·q<k₀、grow₁:2·p·q<k₁。第 79--84 行 initial_sizes 说第 0 步 p=2、q=3（对应 tex 的 I(2,3)），next_sizes 说 p、q 按 k₀、k₁ 递推。Definitions.lean 第 2070--2112 行的 StandardPrimeModel.presentation 给出具体增长率 size n=2^(7^n)、exponent n=7^n−1（第 2085、2097 行）。JiangSu.lean 第 186--187 行 no_characters 由 dimensionDrop23_no_character 得，即 Z 自身无 character 是从 I(2,3) 型维数下降纤维推出来的，和 tex 里"I(2,3) 无 character"（application.tex 第 50--53 行）同构。第 163--171 行 projectionless 用 1/100 的近似容差把投影逼成 0 或 1，[外部推断] 这是 Jiang--Su 代数无投影这一标志特征的机器证明。

关于 norm central-sequence 代数本体：NormUltrapower.lean 里 BoundedSeq A=ℓ^∞ 序列、nullIdeal ω（Definitions.lean 第 102 行）的支集是 {x | normLimit ω x=0}、即沿 ω 范数趋 0 的序列（mem_nullIdeal，NormUltrapower.lean 第 109--110 行），Algebra A ω 是其商、CentralAlgebra A ω 是对角像的中心化子（mem_central_iff 第 203--204 行）。第 177--191 行 norm_mk_eq 与 diagonal_isometry 保证对角嵌入是等距，从而"含对角单位"（application.tex 第 36 行）在机器里成立。CentralSequences.lean 的 countable_iterated_collapse（第 73--185 行）用 CollapseTest 枚举关系缺陷＋一个 Reindex.diagonal_select 重标对角，正是 tex prop:kr(1)（preliminaries.tex 第 91--123 行）那条重标引理的机器化，第 117--119 行 hfree:(ω≤atTop) 用 hω:ω≤cofinite 把逐点收敛升级成沿 ω 收敛，与第八节"自由超滤子作用"完全吻合。

我必须诚实标出一个边界：Main.lean 的定理化约到的 `StandardPrimeModel.presentation.character_criterion`，其完整证明链落在 Definitions.lean（第 2076 行 namespace）与模块内其它文件（PrimeChannels.lean 第 211 行也有一个 character_criterion）。任务限定我只能读 CharacterCriterion 模块目录本身和 comparator json，没有对整个 lean 仓做递归检索，也没有读任何 PDF。所以我在这里只能说：机器化的"入口定理"在 Main.lean，其证明经 StandardPrimeModel.presentation，模块内可核对的定义（HasNoCharacters、NormUltrapower.CentralAlgebra、JiangSu.Algebra）与 tex 陈述一一对应；我不声称已逐行验证 presentation.character_criterion 内部每一个引理都编译通过，那是超出本次取证范围的事。

## 十、命名撞车：Kadison 相似性目录里的 Kirchberg 文件，以及为什么排除

取证中我撞上一个明确的陷阱，必须单列一节写清楚，否则笔记会被同名文件污染。在 lean/OAI/Analysis/KadisonSimilarity/Similarity/ 下存在 KirchbergCompleteBound.lean、KirchbergConjugation.lean、KirchbergEndgame.lean、KirchbergIntegral.lean 等一批以 Kirchberg 命名的文件。任务告知它们属于 Kadison 相似性问题那篇论文，与本 D98 无关，我据此完全不读取那个目录。

为什么这次撞车是真实风险：本篇判据的第一作者就叫 Kirchberg（Kirchberg--Rørdam 字符判据，introduction.tex 第 19--30 行），而 Kirchberg 在 C\*-代数里有大量" Kirchberg 某某"结果（切片秩、Kirchberg 代数是纯无穷单核可分代数的代表，[外部推断] 这些也常出现在与 Kadison--Similarity 交叉的算子代数文献里）。一个不细看路径的人，很容易把 KadisonSimilarity/Similarity 目录下的 Kirchberg*.lean 里的引理当成本篇 Z-stability 判据的机器化部件，进而把两篇论文的覆盖关系、comparator 配置、公理依赖全部错接。

我的排除依据是注册项本身，并非文件名：本篇的 declaration 是 OAI.KirchbergRordam.character_criterion，file 字段（formalization.yaml 第 1004 行）明确指向 OAI/Analysis/CharacterCriterion/Main.lean；comparator json 的 solution_module 也只写 OAI.Analysis.CharacterCriterion.Main。这两处路径级证据把本篇机器化钉死在 CharacterCriterion 模块，与 KadisonSimilarity 模块无关。命名空间也佐证：本篇全部落在 namespace OAI.KirchbergRordam（Main.lean 第 8 行、Definitions.lean 第 2123 行等），其下的 JiangSu、NormUltrapower、StandardPrimeModel 子空间服务的是字符判据；而 KadisonSimilarity/Similarity 那批 Kirchberg* 文件服务的是相似性问题，两者除"作者姓氏出现在标识符里"之外没有语义交集。因此我在第九节只把 CharacterCriterion 模块内的文件当作本篇的机器化证据，绝不引用 KadisonSimilarity 目录的任何引理来"支撑"本节任何关于 I(2,3)、cube 几何或 Z-stability 的说法。这个区分是刻意的、可复核的：凡本篇机器化结论，路径必含 CharacterCriterion；凡出现 KadisonSimilarity/Similarity 路径的内容，一律判为外来、不计入。

## 十一、外部检索与外部推断记录

任务允许素材不足时上网检索，并要求标明外部推断。我实际检索/依赖的外部知识点如下，全部标 [外部推断]，绝不硬编进"论文事实"。KR 原文《When central sequence C\*-algebras have characters》的 Question 3.1、Question 3.7、Proposition 3.9、Lemma 3.5、Theorem 2.5、Lemma 9.3、Proposition 6.1、Proposition 2.2/Corollary 2.3 这些编号是 tex 里直接引用的（references.tex 第 16--21 行给出 KR 的 IJM 2015 卷期与 arXiv:1409.1395v2），我据此确认判据的历史出处，但对 KR 原文证明细节的复述属于外部推断。[外部推断] Kirchberg 的切片秩（slice rank）与纯无穷性、Rørdam 早期用 central sequence 刻画吸收的工作、Warwick 型维度下降函数（dimension-drop function 作为 tracial 上界的推广，[外部推断] 源自 Blackadar--Handelman 与 Kirchberg 的维数下降代数族 I(p,q)），这些是我用来解释"为什么 I(2,3) 是自然的检验代数"的背景，论文本身没有引入 Warwick 的连续维数下降函数版本，只用了单点代数量 I(2,3)。[外部推断] Z-stability 与严格比较性（strict comparison）在 Toms--Winter、Rørdam--Winter 框架里的关联，是我判断"死路二（借 PTV purity）为什么断"的依据；论文对严格比较性的唯一正面使用是引言第 106--108 行提到 PTV 的 purity 强加 Cuntz 半群比较与可除，而本文明确不依赖它。[外部推断] Jiang--Su 原始定理（JS，references.tex 第 10--14 行，AJM 1999）要求单、可分、核、无穷维、有迹，我用它解释 cor:infinite-tensor 去掉了哪些假设；论文正文只引 JS 引入 Z 的定义（introduction.tex 第 12--14 行），去掉假设的部分是我对照 JS 原定理做出的外部推断。凡上述内容，若与 tex 正文冲突，一律以 tex 为准；我在第七节所有 (b) 段"我接的中间步"、所有 (d) 段 [推测]、以及本节的背景复述，都不构成对论文事实的引用。

（全篇结束。素材仅来自 build\ 下九个 tex 分片与注册项三件套、模块内可读文件、comparator json；未 pdftotext、未读任何 PDF、未递归检索 lean 仓、未触碰 KadisonSimilarity/Similarity 目录。）

## 十二、草稿纸重写第一批：prop:rw 全链的真数学化（rw-criterion.tex 第 15--318 行）

旧稿第七节把 rw-criterion 的证据大半写在字面与代码块里，算子式、态值、不等式全是散排。从本节起我把这些陈述逐条换成真数学模式，每条都给出我在草稿纸上的验算链；位置引用一律指 build\sections 下同名 tex 的行号，取证记录见第一与第七节。

先重排精确割线引理 lem:rw-exact-cut（第 15--51 行）。命题式：若 $a,b\in B_{+}$ 满足 $a\precsim b$，则对每个 $\delta>0$ 存在 $z\in B$ 使 $z^{*}z=(a-\delta)_{+}$ 且 $zz^{*}\in\operatorname{Her}(b)$。我在纸上取 $x\in B$ 使 $\lVert a-x^{*}bx\rVert<\eta<\delta$，令 $e=(a-\delta)_{+}$，$y=b^{1/2}xe^{1/2}$，则 $T=y^{*}y=e^{1/2}x^{*}bxe^{1/2}\ge e^{1/2}(a-\eta)e^{1/2}$。逐步：由 $\lVert a-x^{*}bx\rVert<\eta$ 得 $x^{*}bx\ge a-\eta$；在 $\operatorname{supp}(e)$ 上 $a\ge\delta$，故 $a-\eta\ge\delta-\eta>0$ 在该支撑上成立，压回得 $T\ge(\delta-\eta)e$；上界 $T\le\lVert x^{*}bx\rVert e$ 同理。两边夹逼说明 $\operatorname{supp}(T)=\operatorname{supp}(e)$，于是 $z=ue^{1/2}\in B^{**}$（$y=uT^{1/2}$ 的极分解）良定义。回收进 $B$ 靠 $z_{\tau}=y(T+\tau)^{-1/2}e^{1/2}\in b^{1/2}B$：$y\in b^{1/2}B$，$(T+\tau)^{-1/2}\in B$，$e^{1/2}\in B$，三者乘积留在 $b^{1/2}B$。误差链我逐字验证一遍：$z-z_{\tau}=(uT^{1/2}-y)(T+\tau)^{-1/2}e^{1/2}$，而 $uT^{1/2}=y$，差项写成 $f_{\tau}(T)$ 的压缩，$f_{\tau}(t)=1-\sqrt{t/(t+\tau)}$，得 $\lVert z-z_{\tau}\rVert^{2}\le\lVert f_{\tau}(T)ef_{\tau}(T)\rVert\le\frac{\sup_{t\ge0}tf_{\tau}(t)^{2}}{\delta-\eta}$（第 43--46 行）。这个 sup 我自己在草稿纸上算：令 $s=\sqrt{t/(t+\tau)}\in[0,1)$，反解 $t=\tau s^{2}(1-s^{2})^{-1}$，则 $tf_{\tau}(t)^{2}=\tau\,\frac{s^{2}(1-s)^{2}}{1-s^{2}}=\tau\,\frac{s^{2}(1-s)}{1+s}\le\tau$，于是 $\lVert z-z_{\tau}\rVert\le\sqrt{\tau/(\delta-\eta)}\to0$（$\tau\downarrow0$），$z$ 是 $B$ 中元素的范数极限，故 $z\in B$。$z^{*}z=e$ 的核对：$z^{*}z=e^{1/2}u^{*}ue^{1/2}=e^{1/2}\operatorname{supp}(T)e^{1/2}=e$，最后一步靠 $\operatorname{supp}(T)=\operatorname{supp}(e)$。整个链条里 $\delta-\eta>0$ 是分母，这条正是台账里 "η≥δ 失界" 一行的出处；我另算过 $\eta\downarrow$ 与 $\delta$ 固定的顺序无关，只要保持 $\eta<\delta$ 即可。

order-zero 表示（第 53--74 行）重排如下：设 $x_1,\ldots,x_q\in B$ 为压缩元且 $x_ix_j^{*}=\delta_{ij}h$，则 $\alpha(e_{ij})=x_i^{*}x_j$ 定出 cpc order-zero 映射。我在草稿纸上验乘法：$\alpha(e_{ij})\alpha(e_{kl})=x_i^{*}x_jx_k^{*}x_l=\delta_{jk}x_i^{*}hx_l=\delta_{jk}H\alpha(e_{il})$ 型关系，其中 $H=\sum_i x_i^{*}x_i$ 为压缩元（各项 $x_i^{*}x_i$ 两两正交故和仍 $\le1$）。支撑同态 $\bar\alpha$ 由 $\alpha(e_{ij})(H+\tau)^{-1}$ 当 $\tau\downarrow0$ 的强极限给出矩阵单位，$\alpha(x)=H\bar\alpha(x)=\bar\alpha(x)H$，$\bar\alpha(1_q)=\operatorname{supp}(H)$（第 66--69 行）。

lem:rw-commuting-maps（第 76--113 行）的重排：设 $\alpha:M_3\to B$、$\beta:M_2\to B$ 为 cpc、range 交换，满足 $\psi(x)\psi(y)=\psi(1)\psi(xy)$（$\psi=\alpha,\beta$），且 $\alpha(1_3)+\beta(1_2)=1_B$，则存在幺元同态 $I(2,3)\to B$。典范入射 $\alpha_0(y)(t)=t(1_2\otimes y)$、$\beta_0(x)(t)=(1-t)(x\otimes1_3)$（第 89--90 行）。我在 $E=C^{*}(\alpha(M_3),\beta(M_2),1_B)$ 的不可约表示下算：$\alpha(1_3)$ 在 $E$ 中居中故映为标量 $r\in[0,1]$；若 $0<r<1$，则 $r^{-1}\alpha$ 与 $(1-r)^{-1}\beta$ 在该表示内是两个交换的幺元矩阵同态，合成 $M_2\otimes M_3$ 的表示；若 $r=0$ 只剩 $M_2$ 侧，若 $r=1$ 只剩 $M_3$ 侧。代入有界：对非交换 $*$-多项式 $p$，$\lVert p(\alpha,\beta)\rVert$ 受 $p$ 在 $I(2,3)$ 中范数控制，因每个不可约表示下的值等于 $I(2,3)$ 在对应求值点的纤维，这按 C*-范数的 $\sup$ 定义成立（第 107--112 行）。

现在进入 prop:rw 本体（第 115--318 行）。第一段"从比较到精确关系"。输入 $a_1=w^{*}w$、$a_2=ww^{*}$、$1_B-a_1-a_2\precsim(a_1-\varepsilon)_{+}$。先把 $\varepsilon$ 缩小到 $0<\varepsilon<1$：对 $\varepsilon'<\varepsilon$ 逐点有 $(t-\varepsilon)_{+}\le(t-\varepsilon')_{+}$，故 $1_B-a_1-a_2\precsim(a_1-\varepsilon')_{+}$ 由 $\precsim$ 的传递性仍成立，缩小有害性为零。定义 $f(t)=\min\{t/\varepsilon,1\}$，$s_1=f(a_1)^{1/2}$；取 $w^{*}=u_0a_2^{1/2}$（极分解），$s_2=u_0f(a_2)^{1/2}$（第 119--121 行）。我在草稿纸上算 $s_2$ 的归属：$u_0=w^{*}a_2^{-1/2}$（支撑上）代入得 $s_2=w^{*}q(a_2)$，$q(t)=\sqrt{f(t)/t}$；逐段：$0<t\le\varepsilon$ 时 $f(t)/t=1/\varepsilon$，$t>\varepsilon$ 时 $f(t)/t=1/t$，两半在 $t=\varepsilon$ 衔接，赋 $q(0)=\varepsilon^{-1/2}$ 后 $q$ 在 $[0,1]$ 连续，故 $q(a_2)\in B$、$s_2\in B$（第 121--124 行）。验证 $s_2s_2^{*}=u_0f(a_2)u_0^{*}=f(a_1)=s_1^{2}$，其中用了 $a_1=u_0a_2u_0^{*}$：由 $w^{*}=u_0a_2^{1/2}$ 得 $w=a_2^{1/2}u_0^{*}$，故 $a_1=w^{*}w=u_0a_2u_0^{*}$。交叉项 $s_1s_2^{*}=f(a_1)^{1/2}f(a_2)^{1/2}u_0^{*}=0$，靠 $a_1\perp a_2$ 推出 $f(a_1)f(a_2)=0$。于是 $s_is_j^{*}=\delta_{ij}s_1^{2}$。再算 $d=s_1^{*}s_1+s_2^{*}s_2$：$s_1^{*}s_1=f(a_1)$；$s_2^{*}s_2=f(a_2)^{1/2}u_0^{*}u_0f(a_2)^{1/2}=f(a_2)^{1/2}\operatorname{supp}(a_2)f(a_2)^{1/2}=f(a_2)$，故 $d=f(a_1)+f(a_2)$（第 126--128 行）。

下一步 $a:=1-d=\varepsilon^{-1}(c-(1-\varepsilon))_{+}$，$c=1-a_1-a_2$（第 130--134 行）。我在 $C^{*}(a_1,a_2)\cong C(\Omega)$、$\Omega=\{(\alpha,\beta)\in[0,1]^{2}:\alpha\beta=0\}$ 上逐点验算：情形一 $\alpha+\beta\le\varepsilon$（此时 $\alpha<\varepsilon$、$\beta<\varepsilon$）：左边 $1-(\alpha+\beta)/\varepsilon$，右边 $\varepsilon^{-1}(1-\alpha-\beta-1+\varepsilon)=\varepsilon^{-1}(\varepsilon-\alpha-\beta)$，相等。情形二 $\alpha+\beta>\varepsilon$：由 $\alpha\beta=0$ 至多一个超阈值，设 $\alpha>\varepsilon$，则 $f(\alpha)=1$、$f(\beta)=\beta/\varepsilon$，左边 $=-\beta/\varepsilon<0$，取其正部为 $0$；右边 $(\varepsilon-\alpha-\beta)_{+}=0$，相等。比较 $c\precsim(a_1-\varepsilon)_{+}$ 喂 lem:rw-exact-cut，割线取 $\delta=1-\varepsilon>0$（这一步正是 $\varepsilon<1$ 被消费的场合），得 $z^{*}z=(c-(1-\varepsilon))_{+}$、$zz^{*}\in\operatorname{Her}((a_1-\varepsilon)_{+})$；令 $v=z/\sqrt{\varepsilon}$，则 $v^{*}v=\varepsilon^{-1}(c-(1-\varepsilon))_{+}=a$，得 eq:rw-relations：$v^{*}v=a=1-d$、$vv^{*}\in\operatorname{Her}((a_1-\varepsilon)_{+})$、$s_1^{2}vv^{*}=vv^{*}$（第 138--141 行）。第三条的验法：$f$ 在 $[\varepsilon,\infty)$ 上恒为 $1$，故 $s_1^{2}$ 在 $\operatorname{supp}(a_1-\varepsilon)_{+}$ 上作用如恒等。推论：$s_1v=v$、$s_2v=0$、$av=0$，以及 $ds_i=s_1^{2}s_i=s_id$（第 142--144 行）。Gram 结构给 $\rho:M_2\to B$，$\rho(e_{ij})=s_i^{*}s_j$、$\rho(1_2)=d$，支撑同态 $\sigma$、$p=\operatorname{supp}(d)$（第 145--148 行）。

第二段"两份正交缺陷代数"（第 150--180 行）。取 $v=ua^{1/2}$ 极分解，$e=u^{*}u=\operatorname{supp}(a)$，$r_i=s_i^{*}u=\sigma(e_{i1})u$，$R=r_1r_1^{*}+r_2r_2^{*}$。我验 $r_i^{*}r_j$：$r_i^{*}r_j=u^{*}s_is_j^{*}u=\delta_{ij}u^{*}s_1^{2}u=\delta_{ij}(s_1u)^{*}(s_1u)=\delta_{ij}u^{*}u=\delta_{ij}e$，用 $s_1u=u$。eq:rw-corners 全家：$r_i^{*}r_j=\delta_{ij}e$、$dr_i=r_i$、$R\le p$、$R\perp e$、$\sigma(e_{jk})r_i=\delta_{ki}r_j$（第 159--163 行）。其中 $R\perp e$ 我这样接：$a$ 与每个 $s_i$ 交换（因 $d$ 与之交换且 $a=1-d$），$au=0$ 给 $e\le1-p$，而 $R\le p$，故 $Re=0$。映射 $\varphi:\operatorname{Her}(a)\to B$、$\varphi(b)=\sum_{i=1}^{2}r_ibr_i^{*}$ 是同态：$\varphi(b)\varphi(b')=\sum_{i,j}r_i b r_i^{*}r_j b' r_j^{*}=\sum_i r_i bb' r_i^{*}$（靠 $r_i^{*}r_j=\delta_{ij}e$ 与 $ebe=b$，后者因 $b=\lim a^{1/2}b_na^{1/2}$ 且 $a^{1/2}=a^{1/2}e$）。值域落 $B$：逼近元给 $ubu^{*}\in B$（用 $ua^{1/2}=v$）与 $ub\in B$（第 166--174 行）。eq:rw-phi：$\varphi(b)r_i=r_ib$、$[\varphi(b),\sigma(M_2)]=0$、$\varphi(\operatorname{Her}(a))\perp\operatorname{Her}(a)$（第 176--180 行）。

第三段"另一坐标截面"（第 188--218 行）。$D_1=\{F\in C([0,1],M_2):F(0)\in\mathbb C1_2,\ F(1)=0\}$，$F(0)=c_F1_2$；$\bar\lambda(F)=\sum_{i,j}F_{ij}(d)\sigma(e_{ij})$，$\lambda(F)=\bar\lambda(F)+c_F(1-p)$。我在草稿纸上验标量纤维的必要性：$\sigma(1_2)=p$ 使 $\bar\lambda(F)\le p$ 侧；对纯标量 $f$（$f(1)=0$）有 $f(d)=f(d)p+f(0)(1-p)$（连续演算，$d$ 在 $1-p$ 上取 $0$），故 $\lambda(f1_2)=f(d)+c_f(1-p)-f(0)(1-p)$？重算：$\bar\lambda(f1_2)=f(d)\sigma(1_2)=f(d)p$，加 $c_f(1-p)=f(0)(1-p)$ 恰补回 $f(d)$ 在 $1-p$ 上的值，得 $\lambda(f1_2)=f(d)$（第 199--200 行）。这就是标量纤维项存在的理由：没有 $c_F(1-p)$，$\lambda$ 在 $p\ne1$ 处丢标量纤维。生成元检验：$(1-t)1_2\mapsto a$、$t(1-t)x\mapsto a\rho(x)$，两者都落在 $\operatorname{Her}(a)$，故 $\lambda$ 值域在 $\operatorname{Her}(a)\subseteq B$，绕开了 $p\in B$ 的假设（第 201--204 行）。$D_2=\{F\in C([0,1],M_2\otimes M_2):F(0)\in\mathbb C1_4,\ F(1)=0\}\subseteq D_1\otimes M_2$；$\varphi\circ\lambda$ 与 $\sigma$ 交换（eq:rw-phi），乘积在 $D_1\otimes M_2$ 上定同态，限制为 $\gamma$；其支撑投影为 $R$，因值域被 $R$ 支撑且含 $\varphi(a)$（$\varphi(a)$ 支撑 $R$）（第 206--218 行）。

第四段"翻转与最终 order-zero 对"（第 220--313 行）。$F$ 为翻转酉，$\theta$ 在 $[0,1/3]$ 为 $0$、在 $[2/3,1]$ 为 $1$，$U(t)=\frac{1+F}{2}+e^{i\pi\theta(t)}\frac{1-F}{2}$。我在草稿纸上验 $U$ 酉性：$F=F^{*}$、$F^{2}=1$，故 $\frac{1\pm F}{2}$ 是互补投影；$|e^{i\pi\theta}|=1$，两本征空间各自旋转，$U^{*}U=\frac{1+F}{2}+\frac{1-F}{2}=1$。边界：$\theta=0$ 处 $U=1$，$\theta=1$ 处 $U=\frac{1+F}{2}-\frac{1-F}{2}=F$。$U$ 是 $D_2$ 的乘子；$\gamma$ 的乘子扩张把 $U$ 送到 $w_0\in RB^{**}R$ 酉，令 $W=w_0+1-R$（第 224--234 行）。取 $g(t)=1$（$t\le2/3$）否则 $3(1-t)$；$h=\lambda(g1_2)=g(d)$、$k=\varphi(h)$、$l=1-h-k$。正性与界逐点验：$g\ge0$ 故 $h\ge0$、$k\ge0$；$g(t)\ge1-t$（$t\le2/3$ 时 $1\ge1-t$，$t>2/3$ 时 $3(1-t)\ge1-t$），由 $h\ge1-d$ 得 $l=1-h-k\le d$，又 $h+k\le1$（谱逐点），故 $0\le l\le d$（第 241--245 行）。$kW=Wk$ 与 $k^{\alpha}W=\gamma(g^{\alpha}U)\in B$（$\alpha>0$），合法性在 $g^{\alpha}U\in D_2$：$g^{\alpha}(0)\in\mathbb C$ 处为标量纤维、$g^{\alpha}(1)=0$。定义 $x_i=h^{1/2}r_i^{*}W$（$i=1,2$）、$x_3=h^{1/2}$。归属 $B$：$x_i=(r_i^{*}k^{1/4})(k^{1/4}W)$，$r_i^{*}k^{1/4}=h^{1/4}r_i^{*}\in B$（第 251--255 行）。核心 Gram 验算 $x_ix_j^{*}$：$x_ix_j^{*}=h^{1/2}r_i^{*}WW^{*}r_jh^{1/2}=h^{1/2}r_i^{*}r_jh^{1/2}=\delta_{ij}h^{1/2}eh^{1/2}$；关键一步 $h^{1/2}eh^{1/2}=h$：因 $g(t)>0$ 当且仅当 $t<1$，$\operatorname{supp}(h)\subseteq\operatorname{supp}(1-d)=\operatorname{supp}(a)=e$，故 $he=eh=h$。这个支撑包含是我在草稿纸上把 $g$ 的零点集合与 $1-d$ 的支撑对照出来的，它解释为什么 $g(1)=0$ 是硬要求。其次 $\sum_{i=1}^{3}x_i^{*}x_i$：$x_i^{*}x_i=W^{*}r_ihr_i^{*}W$，对 $i$ 求和给 $W^{*}\varphi(h)W=W^{*}kW=k$（用 $kW=Wk$ 与 $W$ 在 $R$ 上酉）；$x_3^{*}x_3=h$；总和 $h+k$（第 256--260 行）。于是 $\alpha(e_{ij})=x_i^{*}x_j$ 定 cpc order-zero $\alpha:M_3\to B$，$\alpha(1_3)=h+k$。$\beta(y)=l\sigma(y)$：直接看 $\beta$ 值在 $B$：取 $j(t)=1/t$（$t\ge2/3$），则 $\beta(y)=lj(d)\rho(y)$，因 $\rho(y)=\sigma(y)d$（order-zero 的 $H=d$ 因子），$lj(d)\in B$、$\rho(y)\in B$，且在 $l$ 的支撑（$d\ge2/3$ 谱段）上 $j(d)d=1$ 使两式相等。$l$ 在 $d$ 的谱 $[0,2/3]$ 子空间上为 $0$：那里 $h=1$ 且 $hk=0$ 逼 $k=0$、$l=1-1-0=0$（第 264--270 行）。又 $l\le d$ 给 $lp=l$，结合 $l(1-p)=0$：$\beta(1_2)=l\sigma(1_2)=lp=l$，故 $\alpha(1_3)+\beta(1_2)=h+k+l=1$（第 271--272 行）。

对易性检验靠加权翻转。$Q=g(1-g)$：$Q(0)=1(1-1)=0$、$Q(1)=0(1-0)=0$，支撑落在 $g\in(0,1)$ 即 $t\in(2/3,1)$，那里 $U=F$。逐点恒等式 $Q(t)(1\otimes y)U(t)^{*}=U(t)^{*}Q(t)(y\otimes1)$：在 $Q\ne0$ 处两端都化为 $Q\,F(1\otimes y)F$ 与 $Q\,F(y\otimes1)$ 的互转，而翻转酉满足 $F(1\otimes y)F=y\otimes1$（等价地 $F(1\otimes y)= (y\otimes1)F$）；在 $Q=0$ 处两端为 $0$。$\gamma$（含乘子部分）代入得 eq:rw-weighted-flip：$k(1-k)\sigma(y)W^{*}=W^{*}\varphi(\lambda(Q\otimes y))$（第 283--286 行）。令 $C_i=\alpha(e_{i3})$，我从 Gram 公式直接算：$C_i=x_i^{*}x_3=W^{*}r_ih$。链条（第 291--298 行）：$\beta(y)C_i=k(1-k)\sigma(y)W^{*}r_i=W^{*}r_i\lambda(Q\otimes y)=W^{*}r_ih(1-h)\sigma(y)=C_i\beta(y)$。我接的读法：第一步把 $\beta(y)=l\sigma(y)$ 在 $r_i$ 侧的支撑上换成 $k(1-k)$ 型（$l$ 在该侧的贡献由 $1-h-k$ 给出，$h$ 部分因 $hr_i$ 支撑关系被吸收）；第二步代入翻转恒等式反向；第三步 $\lambda(Q\otimes y)=Q(d)\sigma(y)$，这里 $Q(0)=0$ 起作用（无标量纤维 $c_F(1-p)$ 项）；第四步 $h(1-h)\sigma(y)$ 与 $k(1-k)$ 的互换靠 $hk=0$。另算 $C_i^{*}C_i=h r_i^{*}WW^{*}r_ih=h r_i^{*}r_ih=heh=h^{2}$；$C_iC_i^{*}=W^{*}r_ih^{2}r_i^{*}W=(W^{*}r_ihr_i^{*}W)^{2}=\alpha(e_{ii})^{2}$；$C_iC_j^{*}=W^{*}r_ih^{2}r_j^{*}W=A_0\alpha(e_{ij})$，$A_0=\alpha(1_3)=h+k$（第 303--307 行）。剩余矩阵元回收：$\alpha(e_{ij})=A_0\bar\alpha(e_{ij})$，乘 $(A_0+\tau)^{-1}$ 后令 $\tau\downarrow0$ 得 $\alpha(e_{ij})=\lim A_0(A_0+\tau)^{-1}\cdot A_0\bar\alpha(e_{ij})\cdot(A_0+\tau)^{-1}A_0$ 型逼近，误差 $\lVert\tau A_0(A_0+\tau)^{-1}\rVert\le\tau\to0$（第 307--311 行）。于是 $C^{*}(C_1,C_2)\supseteq\alpha(M_3)$ 且与 $\beta(M_2)$ 交换，lem:rw-commuting-maps 收尾（第 313 行）。

零缺陷边界情形我单独验一遍（第 315--317 行）：$v=0$ 时 $a=0$、$z=0$、$h=k=0$、$R=0$、$W=1$，$\beta$ 成为幺元 $M_2$ 同态、$\alpha=0$，$\alpha(1_3)+\beta(1_2)=0+1=1_B$ 仍满足引理前提。全程无一步用到稳定秩一或非零缺陷，这就是 rw-criterion.tex 第 8 行"applies to an arbitrary unital $C^{*}$-algebra" 的字面兑现。

## 十三、草稿纸重写第二批：cube 几何与 Cuntz 配平链的真数学化（dimension-drop.tex 第 18--368 行）

第七节 7.12--7.14 的叙述里，支撑几何的每次点名我都欠着一次代入验算。本节把 lem:cone-cube、lem:matrix-simplex、prop:cone-drop 的每个论断重排为数学模式，并把我按坐标逐点算过的地方写全。

lem:cone-cube（第 18--78 行）的等式：对 $k\ge1$，$C^{\otimes k}$ 认同于 $\{f\in C([0,1]^{k},M_2^{\otimes k}):f(t)\in\bigotimes_{i=1}^{k}E_i(t)\}$，其中 $E_i(t)=M_2$（$t_i>0$）、$E_i(t)=\mathbb C1$（$t_i=0$）。核性论证：$C$ 是 $C_0((0,1])\otimes M_2$ 的单位化，作为拓扑空间上连续函数张矩阵代数它是核的，故极大与极小张量幂一致。求值族 $\bigoplus_{t\in[0,1]^{k}}\operatorname{ev}_t$ 忠实（点评估分离函数），所以自然映射保范：$\lVert f\rVert=\sup_{t}\lVert f(t)\rVert$。反向包含我逐步重算：取 $M_2$ 的向量空间基 $b_0=1,b_1,b_2,b_3$，展开 $f(t)=\sum_{\alpha\in\{0,1,2,3\}^{k}}f_\alpha(t)\,b_{\alpha_1}\otimes\cdots\otimes b_{\alpha_k}$，系数 $f_\alpha\in C([0,1]^{k})$ 连续；边界条件翻译为：若存在 $i\in S_\alpha=\{j:\alpha_j\ne0\}$ 使 $t_i=0$，则 $f_\alpha(t)=0$。令 $p_\alpha(t)=\prod_{i\in S_\alpha}t_i$（空积 $=1$），我在草稿纸上验证一致收敛 $f_\alpha\cdot\frac{p_\alpha}{p_\alpha+\varepsilon}\to f_\alpha$：差为 $f_\alpha\cdot\frac{\varepsilon}{p_\alpha+\varepsilon}$；在 $\{p_\alpha\ge\eta\}$ 上该差 $\le\varepsilon/\eta\to0$ 一致；在 $\{p_\alpha<\eta\}$ 上 $|f_\alpha|$ 本身小，因为 $f_\alpha$ 在紧集 $\{p_\alpha=0\}$ 上为零、由一致连续性其在小子level集上受 $\omega(\eta)$ 控制；两端合起来给 $\sup$ 范收敛。于是 $f_\alpha$ 属于 $p_\alpha$ 生成的闭标量理想。标量逼近：一变量多项式积 $\sum c\prod_i\varphi_i(t_i)$ 在 $C([0,1]^{k})$ 中稠密（Stone--Weierstrass），每个 $\varphi_i\cdot1_{M_2}\in C$，故标量函数乘恒等属于 $C^{\otimes k}$。初等张量身份：$p_\alpha\cdot b_{\alpha_1}\otimes\cdots\otimes b_{\alpha_k}$ 的第 $i$ 因子在 $i\in S_\alpha$ 时为 $\iota b_{\alpha_i}$（其在 $0$ 处取值 $0$，与 $C$ 边界相容）、否则为 $1$，所以该项本身就是 $C^{\otimes k}$ 元素；用闭理想把系数 $f_\alpha$ 逼近进去，得 $f\in C^{\otimes k}$（第 67--77 行）。

lem:matrix-simplex（第 80--136 行）的公式族：$\theta_r:M_2\to M_2^{\otimes k}$（$r\in\Delta_{k-1}=\{r\in[0,1]^{k}:\sum_ir_i=1\}$），值域只用 $\{i:r_i>0\}$ 号因子，第 $j$ 顶点处是第 $j$ 坐标包含。翻转酉 $U(s)=\frac{1+F}{2}+e^{i\pi s}\frac{1-F}{2}$ 满足 $U(0)=1$、$U(1)=F$、$F(a\otimes1)F^{*}=1\otimes a$（第 94--100 行）。归纳定义：$r_k<1$ 时 $\theta_r(a)=(\tau\otimes\operatorname{id})(U(r_k)(a\otimes1)U(r_k)^{*})$，$\tau$ 用归一化权重 $(r_1/(1-r_k),\ldots,r_{k-1}/(1-r_k))$；$r_k=1$ 时 $\theta_r(a)=1^{\otimes(k-1)}\otimes a$。连续性估计我逐项代入：$\lVert\theta_r(a)-1^{\otimes(k-1)}\otimes a\rVert\le\lVert U(r_k)(a\otimes1)U(r_k)^{*}-F(a\otimes1)F^{*}\rVert\le2\lVert a\rVert\,\lVert U(r_k)-F\rVert$（第一阶用 $\tau\otimes\operatorname{id}$ 压缩、第二阶用展开 $UXU^{*}-VYV^{*}=(U-V)XU^{*}+V(X-Y)U^{*}+VY(U^{*}-V^{*})$ 取 $X=Y=a\otimes1$、$U,V$ 酉得系数 $2+\lVert U-V\rVert$ 再收紧到 $2$ 的常见写法；我纸面保留的是论文给的 $2\lVert a\rVert\lVert U(r_k)-F\rVert$）。端点逼近量：$U(s)-F=\bigl(\frac{1+F}{2}+e^{i\pi s}\frac{1-F}{2}\bigr)-\bigl(\frac{1+F}{2}-\frac{1-F}{2}\bigr)=(1+e^{i\pi s})\frac{1-F}{2}$，其范数 $=|1+e^{i\pi s}|\to0$（$s\to1$），且界对 $\tau$ 一致，故即便归一化前权重 $r_i/(1-r_k)$ 无极限，点范连续在整个闭单纯形仍成立（第 118--128 行）。支撑条件验算：$r_k=0$ 时 $U(0)=1$ 使 $\theta_r(a)=\tau(a)\otimes1$；$r_i=0$（$i<k$）时归纳假设令 $\tau$ 值域在第 $i$ 因子标量，$(\tau\otimes\operatorname{id})$ 保持。

prop:cone-drop（第 138--368 行）是本次重排的主体。段一 full cut：记 $b=\eta(\iota e_{11})$ 全，选 $h_i,\ell_i\in P$（$1\le i\le N$）使 $\lVert1_P-\sum_{i=1}^{N}h_ib\ell_i\rVert<\frac12$（第 164--168 行）。割 $\delta$ 的选取我在草稿纸上这么做：$q(t)=(t-\delta)_{+}e_{11}\in C$、$c=\eta(q)=(b-\delta)_{+}$；当 $\delta\downarrow0$ 时逐点 $\lvert(t-\delta)_{+}-t\rvert\le\delta$（$t\in[0,1]$）给 $\lVert(b-\delta)_{+}-b\rVert\le\delta\to0$；于是 $\lVert S-\sum_ih_ib\ell_i\rVert\le\sum_i\lVert h_i\rVert\,\delta\,\lVert\ell_i\rVert<\frac12$ 对足够小 $\delta$ 成立，三角不等式合并得 $\lVert1_P-S\rVert<\frac12+\frac12=1$（$S=\sum_ih_ic\ell_i$），Neumann 级数逼出 $S$ 可逆、$c$ 全。矩阵比较：$T=(h_1c^{1/2},\ldots,h_Nc^{1/2})$ 行、$Z=(c^{1/2}\ell_1,\ldots,c^{1/2}\ell_N)^{\mathrm T}$ 列、$d=Z^{*}Z=\sum_i\ell_i^{*}c\ell_i$。由 $S=TZ$ 得 $S^{*}S=Z^{*}T^{*}TZ\le\lVert T\rVert^{2}Z^{*}Z=\lVert T\rVert^{2}d$。我在草稿纸上的下界链：$d\ge\lVert T\rVert^{-2}S^{*}S\ge\lVert T\rVert^{-2}\lVert S^{-1}\rVert^{-2}1_P>0$，所以 $d$ 可逆。关键验证 eq:full-cut-comparison：令 $V=(\ell_id^{-1/2})_{i=1}^{N}$ 为列，逐块乘开 $V^{*}\operatorname{diag}(c,\ldots,c)V=\sum_{i=1}^{N}(\ell_id^{-1/2})^{*}c(\ell_id^{-1/2})=d^{-1/2}\bigl(\sum_i\ell_i^{*}c\ell_i\bigr)d^{-1/2}=d^{-1/2}dd^{-1/2}=1_P$；这一步我起初漏看 $d^{-1/2}$ 该挂哪一侧，重算三次才确认列向量每个 $\ell_i$ 右乘 $d^{-1/2}$ 是让求和回收成 $d^{-1/2}dd^{-1/2}$ 的唯一摆法。结论 $[1_P]\le N[c]$：$\operatorname{diag}(c,\ldots,c)$ 是 $N$ 份 $c$ 的直和、其类 $N[c]$，等式 $V^{*}\operatorname{diag}(c)V=1_P$ 是精确见证。

段二辅助放大：$c_1=c$、$c_2=\eta((\iota-\delta)_{+}e_{22})$，等价见证 $\eta\bigl(\sqrt{(\iota-\delta)_{+}}\,e_{21}\bigr)$。我在 $M_2$ 纤维上逐点验：取 $s(t)=\sqrt{(t-\delta)_{+}}$，则 $(s(t)e_{21})^{*}(s(t)e_{21})=s(t)^{2}e_{12}e_{21}=(t-\delta)_{+}e_{11}$、$(s(t)e_{21})(s(t)e_{21})^{*}=(t-\delta)_{+}e_{21}e_{12}=(t-\delta)_{+}e_{22}$，同态 $\eta$ 保持乘积故 $c_1=v^{*}v$、$c_2=vv^{*}$。正交：$q_1q_2=(t-\delta)_{+}^{2}e_{11}e_{22}=0$。和：$c_1+c_2=\eta((\iota-\delta)_{+}1_2)\le1_P$（$(t-\delta)_{+}\le t\le1$）。选 $L\ge1$ 使 $2^{L}\ge N$，$R=P^{\otimes L}$、$e=c^{\otimes L}$、$k=N^{L}$。$2^{L}$ 个元素 $c_{\sigma_1}\otimes\cdots\otimes c_{\sigma_L}$（$\sigma\in\{1,2\}^{L}$）两两正交（每坐标上 $\{c_1,c_2\}$ 正交），类都等于 $[e]$：$[c_1]=[c_2]$ 由 $[v^{*}v]=[vv^{*}]$，逐因子外张量把每份换成 $[c]$；其和 $\sum_{\sigma}\bigotimes_ic_{\sigma_i}=(c_1+c_2)^{\otimes L}\le1_R$，正交求和规则给出 $2^{L}$ 份 $[e]$。eq:cone-amplification 的四段界按来源拆开：$N[e]\le2^{L}[e]$ 来自 $N\le2^{L}$；$2^{L}[e]\le[1_R]$ 来自正交和 $\le1_R$；$[1_R]\le N^{L}[e]=k[e]$ 来自把 $[1_P]\le N[c]$ 张 $L$ 次（第 196--223 行）。

段三 cube 正交对：定义 $g(s)=(1-2s/\delta)_{+}$、$H(t)=1-\prod_{j=1}^{k}g(t_j)$、$d(t)=\max_jt_j$、$r_i(t)=\frac{(t_i/d(t)-1/2)_{+}}{\sum_{j}(t_j/d(t)-1/2)_{+}}$、$a_i(t)=H(t)\theta_{r(t)}(e_{ii})$、$v(t)=\sqrt{H(t)}\theta_{r(t)}(e_{21})$，原点统一取 $0$（第 225--248 行）。分母良定义：设 $t_{j^{*}}=d(t)$，该项 $(1-\frac12)_{+}=\frac12$，分母 $\ge\frac12>0$；又各 $r_i\ge0$ 且 $\sum_ir_i=1$，$r(t)\in\Delta_{k-1}$。界 $0\le H(t)\le\frac{2}{\delta}\sum_jt_j$：草稿纸上用望远镜 $1-\prod_ju_j\le\sum_j(1-u_j)$（对 $0\le u_j\le1$ 归纳），而 $1-g(s)=\min\{2s/\delta,1\}\le2s/\delta$，代 $u_j=g(t_j)$ 即得；于是 $H(t)\to0$（$t\to0$），配 $\lVert a_i(t)\rVert\le H(t)$、$\lVert v(t)\rVert\le\sqrt{H(t)}$ 给出原点连续（第 249--254 行）。边界归属：若 $t_j=0$ 则 $r_j(t)=0$，$\theta$ 支撑条件使 $\theta_{r(t)}$ 在第 $j$ 因子标量，恰满足 $E_j(t)$ 在 $t_j=0$ 的标量要求，故 $a_1,a_2,v\in C^{\otimes k}$（第 255--257 行）。eq:cone-positive-pair 逐条：$v^{*}v=H\theta(e_{21})^{*}\theta(e_{21})=H\theta(e_{11})=a_1$、$vv^{*}=H\theta(e_{21})\theta(e_{21})^{*}=H\theta(e_{22})=a_2$；$a_1a_2=H^{2}\theta(e_{11})\theta(e_{22})=0$；$a_1+a_2=H\theta(e_{11}+e_{22})=H\cdot1$。缺陷 $X=1-a_1-a_2=1-H=\prod_jg(t_j)=g^{\otimes k}$（第 258--267 行）。$y_j=g^{\otimes(j-1)}\otimes q\otimes g^{\otimes(k-j)}$：正；两两正交靠 $qg=0$（$(t-\delta)_{+}\ne0$ 蕴 $t>\delta$ 蕴 $1-2t/\delta<0$ 蕴 $g(t)=0$）。eq:cone-local-support $a_1y_j=y_j$ 分三种坐标：其一，$y_j(t)\ne0$ 处：$g(t_i)>0$（$i\ne j$）蕴 $t_i<\delta/2$，$q(t_j)\ne0$ 蕴 $t_j>\delta$，故 $d(t)=t_j$、$t_j/d=1$、$t_i/d<1/2$（$i\ne j$），$r(t)$ 恰为第 $j$ 顶点；乘积 $\prod_ig(t_i)$ 含零因子 $g(t_j)=0$ 故 $H(t)=1-0=1$（这一段我在草稿纸上先心算反了一次符号，重写确认 $H=1-\prod$ 在被单个零因子杀掉时取 $1$）；顶点处 $\theta_{r(t)}(e_{11})$ 在第 $j$ 因子张 $e_{11}$，$e_{11}q(t_j)=q(t_j)$，其余因子处 $r_i=0$ 使 $\theta$ 标量、与 $g$ 交换；合起来 $a_1(t)y_j(t)=y_j(t)$。其二，$y_j(t)=0$ 且 $t\ne0$：两端同 $0$。其三，$t=0$：$a_1(0)=0$、$y_j(0)=0$（$q(0)=0$），$0=0$。全谱覆盖（第 275--284 行）。比较链：$G=\eta(g)$ 满足 $[G]\le[1_P]$（精确见证 $G^{1/2}$：$(G^{1/2})^{*}1_PG^{1/2}=G$）与 $[1_P]\le N[c]$，合成 $[G]\le N[c]$；张上其余 $k-1$ 位得 $[X]=[G^{\otimes k}]\le N[g^{\otimes(j-1)}\otimes c\otimes g^{\otimes(k-j)}]=N[y_j]$；对 $j$ 求和并用正交求和：$k[X]\le N\sum_j[y_j]=N[Y]$，$Y=\sum_jy_j$（第 298--311 行）。

段四吸收缺陷：$B=P^{\otimes k}\otimes R=P^{\otimes(k+L)}$、$b_i=a_i\otimes1_R$。先算 $(a_1-\frac12)_{+}Y=\frac12Y$：在 $Y$ 的支撑上 $H=1$，$a_1=\theta(e_{11})$ 取值 $0$ 或秩一投影，谱含于 $\{0,1\}$，逐点 $(\lambda-\frac12)_{+}=\frac12\lambda$（$\lambda\in\{0,1\}$）；由 $a_1Y=Y$ 取伴得 $Ya_1=Y$、两者交换，函数演算给 $(a_1-\frac12)_{+}Y=\frac12a_1Y=\frac12Y$（第 323--325 行）。见证 $z=\sqrt{2Y}\otimes1_R$：$z^{*}(b_1-\frac12)_{+}z=(2Y)^{1/2}\bigl((a_1-\frac12)_{+}\otimes1_R\bigr)(2Y)^{1/2}=2\bigl((a_1-\frac12)_{+}Y\bigr)\otimes1_R=Y\otimes1_R$，精确见证（第 326--329 行）。四段链逐条对号（第 336--343 行）：$[X\otimes1_R]\le k[X\otimes e]$ 用 $[1_R]\le k[e]$ 张 $X$；$k[X\otimes e]\le N[Y\otimes e]$ 用 $k[X]\le N[Y]$ 张 $e$；$N[Y\otimes e]\le[Y\otimes1_R]$ 用 $N[e]\le[1_R]$ 张 $Y$；$[Y\otimes1_R]\le[(b_1-\frac12)_{+}]$ 用 $z$。压回 $B$：若有限矩阵中 $W_n^{*}(b\oplus0)W_n\to a\oplus0$，取 $(1,1)$ 角压缩得 $(W_n)_{11}^{*}b(W_n)_{11}\to a$（第 350--357 行），故 $1_B-b_1-b_2=X\otimes1_R\precsim(b_1-\frac12)_{+}$ 在 $B$ 内。喂 prop:rw（$\varepsilon=\frac12$）得幺元同态 $I(2,3)\to B$，指数 $m=k+L$（第 362--367 行）。多重数账本最后对一遍：$k=N^{L}$ 份缺陷对 $N$ 份 $y_j$，比值 $N^{L-1}$ 不允许在 Cuntz 序中消去，配平全部由 $R$ 与 $2^{L}\ge N$ 承担，这正是第 312--315 行"without any cancellation" 的算术内容；figures/cone-support.tex 第 3--9 行的两块蓝带正是 $t_j>\delta$（虚线 $0.6=\delta/2$ 之外、点线 $\delta$ 之外的条带）与橙色原点块 $\{t_1,t_2<\delta/2\}=\operatorname{supp}X$ 的示意图，我在 $k=2$ 把上述三种坐标逐一带数复核过一遍。

## 十四、草稿纸重写第三批：Sard 计数、双交换子与极分解的全套代入验算（tensor.tex 第 14--399 行）

第五、六、七节里我在多处用文字带过维数计数与矩阵单位验算，这一节把它们全部转成数学模式，逐式给出代入过程。

lem:tensor-independence（第 14--68 行）的代数核：设 $M\subseteq B(H)$ 为 von Neumann 因子、$1_M=1_H$，$B\subseteq M'$ 为含幺代数，则乘法 $M\odot B\to B(H)$、$a\otimes b\mapsto ab$ 单。我对 $b_1,\ldots,b_l\in B$ 复线性无关，验 $S=\{(a_1,\ldots,a_l)\in M^{1\times l}:\sum_ia_ib_i=0\}=\{0\}$：行空间弱闭、对 $M$ 的左右对角乘不变（右不变靠 $B\subseteq M'$：$a_ib_j$ 可换序），$J\subseteq M_l(M)$（行落在 $S$ 的矩阵全体）是弱闭左理想。支撑投影论证的每一步：$x\in J$ 蕴 $x^{*}x\in J$（左理想＋行组合）；$x^{*}x(x^{*}x+\varepsilon1)^{-1}\in J$（函数演算、$\varepsilon>0$ 时在代数内），令 $\varepsilon\downarrow0$ 强收敛到支撑投影 $\operatorname{supp}(x^{*}x)$，弱闭性收编；有限并：两投影的并是 $\operatorname{supp}(p+q)$、其 $p+q\in J$ 故并在 $J$；递增归纳的并 $p=\bigvee_{x\in J}\operatorname{supp}(x^{*}x)$ 作为有限并网的弱极限属 $J$（第 48--49 行"no separability assumption"指的就是网，并非序列）。每个 $x$ 满足 $x=xp$（标准事实 $x=x\operatorname{supp}(x^{*}x)$），故 $J=M_l(M)p$。酉侧：对 $u\in\mathcal U(M)$ 令 $U=\operatorname{diag}(u,\ldots,u)$，右不变给 $JU=J$；$xU$ 的右支撑投影 $=\operatorname{supp}(U^{*}x^{*}xU)=U^{*}\operatorname{supp}(x^{*}x)U$，对所有 $x$ 取并得 $U^{*}pU=p$；于是 $p$ 的每个分量与一切 $u\in M$ 交换、落进 $Z(M)=\mathbb C1$；每行成为 $b_i$ 的标量关系，线性无关逼该行 $=0$，逐点取遍得 $p=0$、$J=0$。

lem:tensor-real-labels（第 116--163 行）的计数我重排为算式并逐项复核。命题：$m=\dim_{\mathbb R}V\ge2$，对每个 $r\ge1$ 存在 $n\ge1$ 与 $x_1,\ldots,x_r\in V^{\otimes_{\mathbb R}n}$，使对任意 rank $\ge2$ 的实线性映射 $P_j:V\to E_j$，族 $(P_1\otimes\cdots\otimes P_n)(x_i)$（$1\le i\le r$）实线性无关。约化：rank $\ge2$ 的 $P_j$ 可后合成其像上的满射 $V\to\mathbb R^{2}$，若复化前已有依赖则该依赖在复合成后仍是依赖，故只需处理满射族（第 131--134 行）。参数计数（我逐个在纸上数）：$\operatorname{Surj}(V,\mathbb R^{2})$ 是 $\operatorname{Hom}(V,\mathbb R^{2})\cong\mathbb R^{2m}$ 的开子集，维 $2m$；$\mathcal P=\operatorname{Surj}(V,\mathbb R^{2})^{n}$ 维 $2mn$；$S^{r-1}$ 维 $r-1$；$W=V^{\otimes n}$ 维 $m^{n}$（逐因子 $\dim V=m$ 张 $n$ 层），$W^{r}$ 维 $rm^{n}$；定义域 $\mathcal P\times S^{r-1}\times W^{r}$ 维 $2mn+(r-1)+rm^{n}$；值域 $(\mathbb R^{2})^{\otimes n}$ 维 $2^{n}$。映射 $\Phi(P,u,x)=(P_1\otimes\cdots\otimes P_n)(\sum_iu_ix_i)$ 对 $x$ 的微分：固定 $(P,u)$，$x\mapsto(P_1\otimes\cdots\otimes P_n)(\sum_iu_ix_i)$ 是线性映射，某 $u_i\ne0$ 且张量积满射仍满，故微分满、$\Phi$ 是次浸没，$\Phi^{-1}(0)$ 为光滑子流形、余维 $\le2^{n}$，维数 $\le2mn+r-1+rm^{n}-2^{n}$。选 $n$ 使 $2^{n}>2mn+r-1$：右边是 $n$ 的线性函数（系数 $2m$）、左边是底 $2$ 的指数，$m\ge2$ 也总可解（我代 $m=2$、$r=1$ 试最小情形：$2^{n}>4n$ 从 $n=5$ 起成立）。于是 $\dim\Phi^{-1}(0)<rm^{n}=\dim W^{r}$。投影 $\pi:\Phi^{-1}(0)\to W^{r}$ 光滑、源维小于目标维，Sard 逼 $\pi(\Phi^{-1}(0))$ 为 Lebesgue 零测；流形二阶可数，按可数 atlas 分片应用 Sard，无需 $\mathcal P$ 紧（第 157--159 行）。取 $x$ 在零测集外：若某 $(P,u)$ 使 $\sum_iu_i(P_1\otimes\cdots\otimes P_n)x_i=0$，把非零 $u$ 归一为 $u/\lVert u\rVert\in S^{r-1}$（齐次性使等式不变），该三点组落在 $\Phi^{-1}(0)$ 里、投影命中 $x$，矛盾。于是无关性对任意非零系数族成立。rank $\ge2$ 前提的消费点：若某 $P_j$ rank $=1$，则 $(P_1\otimes\cdots\otimes P_n)$ 值域维按该腿缩到 $\le2^{n-1}$，微分对 $x$ 不再满、$\Phi^{-1}(0)$ 不再是余维 $2^{n}$ 的流形，计数链断；这也回收 7.7 里 $m\ge2$ 的用途。

cor:tensor-represented-labels（第 165--200 行）实到复的关键验算我补全：自伴算子集的实基 $\{v_i\}$ 若满足复关系 $\sum_i(a_i+ib_i)v_i=0$，取伴得 $\sum_i(a_i-ib_i)v_i=0$（$v_i^{*}=v_i$），两式相减给 $2i\sum_ib_iv_i=0$、相加给 $2\sum_ia_iv_i=0$，实无关性逼 $a_i=b_i=0$。表示侧：$\pi_j:V\to\pi_j(V)$ 满、$\dim_{\mathbb R}\pi_j(V)\ge2$（7.7 的检测性），套上段 Sard 结论；再复化：$\pi_j(V)$ 的复化嵌入表示代数；由 lem:tensor-grouped-factors 各腿弱闭为交换因子，lem:tensor-independence 把代数张量独立性保到乘积里（第 188--199 行）。

lem:tensor-full-square-zero（第 217--328 行）逐段代入。块一：$P_0=D\otimes_{\max} D^{\otimes n}\otimes_{\max} D^{\otimes n}$、$s=\sum_{i=1}^{m}v_i\otimes x_i\otimes1$、$t=\sum_{i=1}^{m}v_i\otimes1\otimes x_i$。我在草稿纸上展开交换子：$st=\sum_{i,j}v_iv_j\otimes x_i\otimes x_j$、$ts=\sum_{i,j}v_jv_i\otimes x_i\otimes x_j$，第二和换名 $i\leftrightarrow j$ 得 $\sum_{i,j}v_iv_j\otimes x_j\otimes x_i$，相减：$[s,t]=\sum_{i,j}[v_i,v_j]\otimes x_i\otimes x_j$。于是 $\pi([s,t])=\sum_{i,j}\pi_0([v_i,v_j])\pi_L(x_i)\pi_R(x_j)$。若 $\pi([s,t])=0$：$\pi_L(x_i)$ 与 $\pi_R(x_j)$ 在各自腿独立（标签推论），三块弱闭为交换因子（grouped-factors 分块），lem:tensor-independence 逼每个系数 $\pi_0([v_i,v_j])=0$，即 $\pi_0(V)$ 交换，与 $\pi_0$ 幺元表示撞上检测性，矛盾。注意这里用不着 $v_i$ 彼此无关（第 253--254 行明说）。块二：$z=[s,[s,t]]$ 自伴性验算：$[s,t]^{*}=[t,s]=-[s,t]$（两自伴换位反自伴）；对自伴 $A$ 与反自伴 $B$，$(AB-BA)^{*}=B^{*}A^{*}-A^{*}B^{*}=-BA+AB=[A,B]$，取 $A=s$、$B=[s,t]$ 得 $z^{*}=z$。凹性链：$f_\xi(\lambda)=\langle e^{i\lambda\pi(s)}\pi(t)e^{-i\lambda\pi(s)}\xi,\xi\rangle$，逐次求导：$\frac{d}{d\lambda}e^{i\lambda S}Te^{-i\lambda S}=iSe^{i\lambda S}Te^{-i\lambda S}+e^{i\lambda S}T(-iS)e^{-i\lambda S}=ie^{i\lambda S}[S,T]e^{-i\lambda S}$（$S$ 与其指数交换）；再导一次得 $i\cdot i\,e^{i\lambda S}[S,[S,T]]e^{-i\lambda S}=-e^{i\lambda S}\pi(z)e^{-i\lambda S}$ 的期望，即 $f_\xi''(\lambda)=-\langle e^{i\lambda\pi(s)}\pi(z)e^{-i\lambda\pi(s)}\xi,\xi\rangle\le0$（若 $\pi(z)\ge0$，第 266--270 行）。界性：$|f_\xi(\lambda)|\le\lVert\pi(t)\rVert\lVert\xi\rVert^{2}$。有界凹函数在 $\mathbb R$ 上必常：差分商对 $\lambda$ 单调不增，若在某点导数 $c\ne0$ 则沿 $\operatorname{sgn}c$ 方向线性外推发散，与有界矛盾。常值蕴 $f_\xi'(0)=\langle i\pi([s,t])\xi,\xi\rangle=0$ 对一切 $\xi$；$i\pi([s,t])$ 自伴（$(iK)^{*}=-iK^{*}=-i(-K)=iK$，$K=[s,t]$ 反自伴），二次型全零逼 $i\pi([s,t])=0$，与块一矛盾；$\pi(z)\le0$ 用凸函数同法（第 277--279 行）。故 $\pi(z)_{\pm}=\pi(z)_{\pm}\ne0$ 对每个不可约 $\pi$（函数演算与 $\pi$ 交换），$z_{\pm}$ 全。块三：$I_{\pm}=\operatorname{span}\{az_{\pm}b:a,b\in P_0\}$ 是代数双边理想，$z_{\pm}$ 全蕴其闭包 $=P_0$、范数稠；乘积 $(az_-b)(cz_+d)=a(z_-bcz_+)d\in J$（$J$ 为 $z_-P_0z_+$ 生成的闭理想，第 291 行），用 $I_-$、$I_+$ 的逼近元逼近 $1_{P_0}$ 得 $1\in J$、$J=P_0$；距离 $<1$ 的表达式只用有限个 $z_-P_0z_+$ 元素与其伴，取 $c_i=z_-d_iz_+$（$1\le i\le r$）生成单位理想；$c_ic_j=z_-d_i(z_+z_-)d_jz_+=0$（$z_+z_-=0$）。块四：$w_0=\sum_ic_i\otimes x_i'\in P_0\otimes_{\max} D^{\otimes n'}$，$w_0^{2}=\sum_{i,j}c_ic_j\otimes x_i'x_j'=0$；全性：设 $\sum_i\rho_0(c_i)\rho_1(x_i')=0$，lem:tensor-independence（$P_0$ 作"额外代数"侧，第 313--314 行）逼 $\rho_0(c_i)=0$ 全部，与 $c_i$ 生成单位理想、$\rho_0$ 幺元矛盾；归一 $w=w_0/\lVert w_0\rVert$ 给 $\lVert w\rVert=1$，$n,n'$ 随 $V$ 与桥族变、无一致界（第 324--327 行）。

prop:full-cone（第 330--399 行）的极分解验算我全部带出：$w=u|w|$ 在 $P^{**}$，$p=u^{*}u$、$q=uu^{*}$。$w^{2}=0$ 蕴 $\overline{\operatorname{ran}}w\subseteq\ker w$，而 $q$ 是 $\overline{\operatorname{ran}}w$ 的投影、$1-p$ 是 $\ker w$ 的投影，故 $q\le1-p$（第 350--353 行）。矩阵单位逐条乘：$E_{11}^{2}=p^{2}=p$、$E_{22}^{2}=q^{2}=q$、$E_{21}E_{12}=uu^{*}=q=E_{22}$、$E_{12}E_{21}=u^{*}u=p=E_{11}$、$E_{11}E_{22}=pq=0$（$q\le1-p$）、$E_{22}E_{21}=uu^{*}u=u$（$u^{*}u=p$ 消中间），单位 $p+q$。$h=|w|+|w^{*}|$：归一 $\lVert h\rVert=1$ 由 $\lVert w\rVert=1$ 与正交支撑合成（$\lVert a+b\rVert=\max(\lVert a\rVert,\lVert b\rVert)$ 当支撑正交）；$hE_{11}=|w|p+|w^{*}|p=|w|+0$（$|w|$ 支撑 $p$、$|w^{*}|$ 支撑 $q$ 且 $qp=0$）；$hE_{22}=|w^{*}|$ 同理；$hE_{21}=hu=|w|u+|w^{*}|u$：第一项 $|w|u=|w|(uu^{*})u=|w|qu=0$（$|w|q=0$），第二项用极分解恒等式 $u|w|=|w^{*}|u$ 得 $|w^{*}|u=u|w|=w$，合 $hE_{21}=w$；$hE_{12}=hu^{*}$：$|w^{*}|u^{*}=|w^{*}|(pu^{*})=0$（$u^{*}=pu^{*}$、$|w^{*}|p=0$），$|w|u^{*}=(u|w|)^{*}=w^{*}$。交换演算 $\varphi(f\otimes e_{ij})=f(h)E_{ij}$（$f\in C_0((0,1])$）良定义：$h$ 的谱落在 $(0,1]$ 的支撑侧，$f(h)$ 与 $E_{ij}$ 的支撑匹配（第 361--375 行）。值在 $P$ 的多项式论证：取在 $0$ 消失的多项式 $p_n\to f$ 一致，$p_n(h)E_{ij}=\sum_kc_kh^{k}E_{ij}$，$k\ge1$ 项 $h^{k}E_{ij}=h^{k-1}(hE_{ij})\in P$（四个 $hE_{ij}$ 全在 $P$：$|w|,|w^{*}|,w,w^{*}\in P$）；一致极限封闭。单位化得幺元同态 $\eta:C\to P$，$\eta(\iota e_{21})=w$、$\eta(\iota e_{11})=|w|$（第 380--385 行）。理想等同两向：$w$ 的理想含 $w^{*}w=|w|^{2}$、经演算含 $|w|$；反向 $w(|w|+\varepsilon1_P)^{-1}|w|\to w$（$\varepsilon\downarrow0$；逐谱 $t^{2}(t+\varepsilon)^{-1}\to t$ 在 $[0,1]$ 一致，差 $=\varepsilon t/(t+\varepsilon)\le\varepsilon$），故两个闭理想相等，$\eta(\iota e_{11})$ 全（第 389--398 行）。第 386--387 行明说 $u\in P$ 与 $p+q=1_P$ 都未被使用，我把这两处从全部验算里划掉后逐项检查过：矩阵单位、$hE_{ij}$、多项式逼近三步都不碰它们。

## 十五、草稿纸重写第四批：Cuntz 规则、重标引理与两定理的应用链数学化（preliminaries.tex 第 4--131 行、application.tex 第 3--93 行、introduction.tex 第 3--79 行）

定义层先落回数学模式（introduction.tex 第 3--14 行）：$A$ 非零幺元、$\omega$ 为 $\mathbb N$ 上自由超滤子，$A_\omega=\ell^{\infty}(\mathbb N,A)\big/\{(a_n):\lim_{n\to\omega}\lVert a_n\rVert=0\}$、$F_\omega(A)=A_\omega\cap A'$，$A$ 经对角嵌入 $a\mapsto(a)_n$ 视为 $A_\omega$ 的子代数；character 是到 $\mathbb C$ 的非零 $*$-同态 $\chi$，幺元代数上 $\chi(1)=1$ 自动（由 $\chi(1)\ne0$ 与 $\chi(1)^{2}=\chi(1)$）。$\Z$-stable 即 $A\cong A\otimes_{\min}\Z$。thm:main 的双向式：$F_\omega(A)$ 无 character $\Longleftrightarrow$ $A\cong A\otimes_{\min}\Z$（第 37--44 行）。thm:finite：无 character 的非零幺元 $D$，存在 $m\ge1$ 与幺元 $*$-同态 $I(2,3)\to D^{\otimes_{\max}m}$，$I(2,3)=\{f\in C([0,1],M_2\otimes M_3):f(0)\in M_2\otimes1_3,\ f(1)\in1_2\otimes M_3\}$（第 51--62 行）。cor:infinite-tensor：$B=D^{\otimes_{\min}\infty}:=\varinjlim_{n\ge1}\bigl(D^{\otimes_{\min}n},x\mapsto x\otimes1_D\bigr)$，则 $B\cong B\otimes_{\min}\Z$ 且 $B$ 含幺元 $\Z$ 拷贝（第 70--79 行）。

Cuntz 比较三条初等规则（preliminaries.tex 第 14--39 行）我在草稿纸上的完整验算。规则一 $[v^{*}v]=[vv^{*}]$：记 $b=v^{*}v$，取 $x_\gamma=v(b+\gamma)^{-1/2}$（$\gamma>0$，演算在单位化矩阵代数内进行），则 $x_\gamma^{*}(vv^{*})x_\gamma=(b+\gamma)^{-1/2}v^{*}vv(b+\gamma)^{-1/2}=(b+\gamma)^{-1/2}b^{2}(b+\gamma)^{-1/2}=b^{2}(b+\gamma)^{-1}$（$b$ 与 $(b+\gamma)^{-1}$ 交换可并排）；差的估计 $\lVert b-b^{2}(b+\gamma)^{-1}\rVert=\lVert b\gamma(b+\gamma)^{-1}\rVert=\sup_{t\in\sigma(b)}\frac{t\gamma}{t+\gamma}\le\gamma\to0$（逐点 $\frac{t}{t+\gamma}\le1$），故 $x_\gamma^{*}(vv^{*})x_\gamma\to b=v^{*}v$，即 $v^{*}v\precsim vv^{*}$；反向对 $v^{*}$ 重演一遍得 $vv^{*}\precsim v^{*}v$。规则二 $[\sum_ia_i]=\sum_i[a_i]$（$a_i$ 两两正交）：对行 $v=(a_1^{1/2},\ldots,a_l^{1/2})$（$1\times l$ 矩阵，元素在 $M_{1,1}$ 位），$v^{*}v=\sum_ia_i$（列乘行取迹型求和）；$vv^{*}$ 是 $l\times l$ 矩阵、$(i,j)$ 元 $a_i^{1/2}a_j^{1/2}$，正交性（$a_i^{1/2}a_j^{1/2}=\delta_{ij}a_i$：$i\ne j$ 时 $(a_i^{1/2}a_j^{1/2})^{2}\le\lVert a_i^{1/2}a_j^{1/2}\rVert^{2}\le\lVert a_ia_j\rVert=0$）使 $vv^{*}=\operatorname{diag}(a_1,\ldots,a_l)$，其类按直和定义即 $\sum_i[a_i]$；套规则一。规则三：对见证 $x_j$ 逐个复合 $\pi(x_j)$（同态像）或换 $x_j\otimes1$（外张量），误差放大：$\lVert a-\sum? \rVert$ 型余项被固定正张量因子的范数乘，即 $\lVert(x_j\otimes c)^{*}(b\otimes c)(x_j\otimes c)-(a\otimes c)\rVert\le\lVert c\rVert\lVert x_j^{*}bx_j-a\rVert$（极大张量积范数的次乘性），这正是第 34--36 行"at most the original error times the norm of the fixed positive tensor factor"的展开。另加上界句：$[a]\le[1_B]$ 用精确见证 $a^{1/2}$：$(a^{1/2})^{*}1_Ba^{1/2}=a$（第 38--39 行）。第 37--38 行声明这三条不使用消去律与正则性，与我第十四节的多重数配平做法一致。

prop:rw 的重排见第十二节，这里补 prop:kr 两条（preliminaries.tex 第 69--131 行）。断言 (1)：$D\subset F_\omega(A)$ 可分、含环境单位，则每个 $m\ge1$ 有幺元 $*$-同态 $D^{\otimes_{\max}m}\to F_\omega(A)$。重标构造的量化我写成式：取 $\mathbb Q+i\mathbb Q$ 系数可数稠密幺元子代数 $D_0\subset D$；每个 $x\in D_0$ 取提升 $(a_l^x)_l$ 使 $\sup_l\lVert a_l^x\rVert\le2\lVert x\rVert$（$x=0$ 取零提升、$x=1$ 取常值单位提升；商范数定义给 $\inf_l$-lim$_\omega\lVert a_l-x\rVert=0$，逐坐标截断 $\tilde a_l=\operatorname{clip}(a_l,2\lVert x\rVert)$ 不改 $\omega$-类等）；关系缺陷：加、数乘、乘、$*$、中心性五族，枚举后对输出指标 $s$ 选 $l(s)$ 使前 $s$ 项测试各在 $1/s$ 内且 $\lVert[a_{l(s)}^x,b_s^j]\rVert<1/s$（第 104--108 行）。可行性的集论：每个固定测试的达标集 $L_{\text{test}}\in\omega$（沿 $\omega$ 趋零的定义），前 $s$ 个测试对应有限交 $\bigcap_{i\le s}L_i\in\omega$ 非空（滤子公理），从中取 $l(s)$。新序列 $(a_{l(s)}^x)_s$：对每个固定测试，$s$ 足够大后 $1/s$ 容差与"前 $s$ 个含该测试"同时成立，故缺陷按通常意义逐点趋 $0$；逐点趋 $0$ 的标量序列沿任意自由 $\omega$ 趋 $0$（余有限集属 $\omega$）。于是类 $( (a_{l(s)}^x)_s )_s$ 定 $D_0\to F_\omega(A)\cap E'$ 的 $\mathbb Q+i\mathbb Q$ $*$-同态，一致界 $\lVert\cdot\rVert\le2\lVert x\rVert$ 使延拓到复化 $D$ 连续（第 114--119 行）；逐次取 $E$ 为早先像生成，叠 $m$ 次得 $m$ 份两两交换的幺元像，极大张量积泛性质合成 $D^{\otimes_{\max}m}\to F_\omega(A)$；第 123 行明说单射性未被使用。断言 (2)（KR Theorem 2.5）：$A\cong A\otimes_{\min}\Z$ $\Longleftrightarrow$ $F_\omega(A)$ 含同单位、可分、subhomogeneous（$\sup\{\dim\pi:\pi$ 不可约$\}<\infty$）、无 character 子代数（第 75--78、126--128 行）；第 129--130 行锁定：norm 商、迹 ultrapower 与核性假设都未被引入。

lem:separable（application.tex 第 17--32 行）的带数重排：无 character 的幺元 $B$ 中，自伴交换子生成的闭理想若真，商 $B/I$ 为非零幺元交换 C*-代数、Gelfand 谱非空给出 character、复合商映射回拉 $B$ 上 character，矛盾；故闭理想 $=B$，存在有限数据 $h_i,k_i\in B$、$b_i,c_i\in B_{\mathrm{sa}}$ 使 $\bigl\lVert1_B-\sum_{i=1}^{r}h_i[b_i,c_i]k_i\bigr\rVert<1$（第 26--28 行）。我验 character 灭掉该和：$\chi(h[b,c]k)=\chi(h)(\chi(bc)-\chi(cb))\chi(k)=\chi(h)\cdot0\cdot\chi(k)=0$（$\chi$ 到交换 $\mathbb C$），而 $\chi(1_B)=1$，压缩性给 $1=\lvert\chi(1_B-\textstyle\sum)\rvert\le\lVert1_B-\sum\rVert<1$，矛盾。$D=C^{*}(1_B,h_i,k_i,b_i,c_i:i\le r)$ 幺元、可分（有限生成元的多项式代数按有理实部虚部系数可数稠密）。

thm:main 的证明链在数学模式下的完整走向（application.tex 第 34--61 行）：设 $F_\omega(A)$ 无 character。非零性：$1_{F_\omega(A)}$ 来自对角单位（$A$ 幺元非零故 $1\ne0$）。lem:separable 给可分幺元无 character $D\subset F_\omega(A)$、$1_D=1_{F_\omega(A)}$。thm:finite 给幺元 $\phi:I(2,3)\to D^{\otimes_{\max}m}$；prop:kr(1) 给幺元 $\psi:D^{\otimes_{\max}m}\to F_\omega(A)$；复合像 $E=\psi\phi(I(2,3))$，$1_E=1_{F_\omega(A)}$。不可约表示分层：$Z(I(2,3))=C([0,1])1$（中心由标量函数构成，逐点求值 $\operatorname{ev}_t$ 分离），不可约表示 $\pi$ 限制中心为 character $t_0\in[0,1]$，$t_0=0$ 纤维 $M_2\otimes1_3$（维 $2$）、$t_0=1$ 纤维 $1_2\otimes M_3$（维 $3$）、$t_0\in(0,1)$ 纤维 $M_2\otimes M_3$（维 $6$）；消失于 $t_0$ 的标量函数在 $\pi$ 下为 $0$（用支撑远离 $t_0$ 的 Urysohn 型函数逼近），故 $\dim\pi\le6$，$I(2,3)$ subhomogeneous；character 会是一维不可约表示而所有纤维维 $\ge2$，矛盾，故无 character。商 $E\cong I(2,3)/\ker(\psi\phi)$：每个 $E$ 的不可约表示或 character 沿商回拉，维数界 $6$ 与无 character 都保持（第 46--53 行）。prop:kr(2) 收 $A\cong A\otimes_{\min}\Z$。反向：$A\cong A\otimes_{\min}\Z$ 经 prop:kr(2) 给无 character 幺元 $E\subset F_\omega(A)$；若 $\chi:F_\omega(A)\to\mathbb C$ 存在则 $\chi|_E$ 非零（$\chi(1)=1$）落在 $E$ 的 character 集，矛盾（第 57--60 行）。

cor:infinite-tensor 链条（application.tex 第 63--93 行）：连接映射 $\iota:x\mapsto x\otimes1_D$ 是幺元等距嵌入（极小张量积的态性），归纳极限 $B$ 非零幺元可分、$\iota_m:D^{\otimes_{\min}m}\hookrightarrow B$ 幺元。复合 $\theta=\iota_m\circ q_m\circ\phi:I(2,3)\xrightarrow{\ \phi\ }D^{\otimes_{\max}m}\xrightarrow{\ q_m\ }D^{\otimes_{\min}m}\xrightarrow{\ \iota_m\ }B$；$q_m$ 是典范满同态（恒等映射在 $\max$ 范下连续降到 $\min$），幺元、无需核性（第 71--77 行）。$E=\theta(I(2,3))\cong I(2,3)/\ker\theta$ 继承可分、subhomogeneous（界 $6$）、无 character；$1_E=1_B\ne0$（第 78--84 行）。DT Theorem 1.1（introduction.tex 第 87--90 行）输入 $B$ 与同单位子代数 $E$ 得 $B\cong B\otimes_{\min}\Z$。幺元 $\Z$ 拷贝的搬运：$z\mapsto1_B\otimes z$ 是 $B\otimes_{\min}\Z\supseteq\Z$ 的幺元嵌入（$B\ne0$ 保证极小侧忠实），取同构 $\Phi:B\cong B\otimes_{\min}\Z$（幺元自动：$\Phi(1)$ 是投影、由单满与单位论证回拉），$\Phi^{-1}(1_B\otimes\cdot):\Z\to B$ 即所求幺元单同态（第 88--92 行）。

thm:finite 的组合账（application.tex 第 3--10 行）写成指数等式：prop:full-cone 给 $P=D^{\otimes m_0}$、prop:cone-drop 给 $B=P^{\otimes s}$（$s=k+L$），结合律 $P^{\otimes s}=(D^{\otimes m_0})^{\otimes s}=D^{\otimes m_0s}$，故总指数 $m=m_0\cdot s=m_0(k+L)$；其中 $k=N^{L}$、$2^{L}\ge N$、$N$ 来自 full cut 表达式项数、$L$ 来自 prop:cone-drop 段二。依赖链上每一环都允许随 $D$ 变（introduction.tex 第 165--166 行"All tensor exponents and comparison constants are allowed to depend on $D$"），我在第十二至十四节从未在任何一步假设过一致界，这与台账 m 行的登记一致。

## 十六、常数依赖图与带数复核：把全篇的阈值放进同一张草稿纸

第二节台账是逐条登记的，这里我补一张跨节的依赖图，全部写成不等式，并用自造的假设数值走一遍量级（数值只为检验我各处抄的阈值互相不打架，属 [外部推断] 性质的自我复核，论文没有任何一致数值声明）。

主链：$m_{\text{total}}=m_0\cdot s$、$s=k+L$、$k=N^{L}$、$2^{L}\ge N$、$m_0=1+2n+n'$（$P_0=D\otimes_{\max}D^{\otimes n}\otimes_{\max}D^{\otimes n}$ 再张 $D^{\otimes n'}$，tensor.tex 第 230、306 行）；标签层 $n$ 由 $2^{n}>2mn+r-1$（$m=\dim_{\mathbb R}V$、$r$ 为桥数）固定，$n'$ 由第二标签族个数 $r$ 同样条件固定（第 303--304 行）。假设数值：取 $m=2$、$r=1$、$N=3$，则 $n\ge5$（$2^{5}=32>2\cdot2\cdot5+1-1=20$，我逐代验证了切换点在 $n=5$：$n=4$ 时 $2^{4}=16$ 与 $2mn+r-1=16$ 相等、严格不等号不成立）；$L=2$（$2^{1}=2<3$、$2^{2}=4\ge3$）、$k=3^{2}=9$、$s=11$、$m_0=1+10+5=16$、$m_{\text{total}}=176$。这组数没有任何定理含义，只是让我确认公式在纸面闭合：$k[X]\le N[Y]$ 的两边 $9$ 份对 $3$ 份，靠 $R=P^{\otimes2}$ 的 $[1_R]\le9[e]$ 与 $3[e]\le[1_R]$ 夹住，链上 $N\le2^{L}$（$3\le4$）与 $2^{L}[e]\le[1_R]\le N^{L}[e]$（$4\le9$）同时可满足。

割线族的一致性复核。RW 端：$\varepsilon\in(0,1)$、$\delta_{\text{cut}}=1-\varepsilon$、$\eta<\delta_{\text{cut}}$、$\tau\downarrow0$，四个参数的不等式链 $\tau>0>\ \eta-\delta_{\text{cut}}\ ($负$)$ 保证 $\lVert z-z_\tau\rVert^{2}\le\tau/(\delta_{\text{cut}}-\eta)$ 有意义；cone-drop 端最终取 $\varepsilon=\tfrac12$，回推 $\delta_{\text{cut}}=\tfrac12$、见证 $z=\sqrt{2Y}\otimes1_R$ 的因子 $2$ 恰来自 $\varepsilon^{-1}=2$（dimension-drop.tex 第 326--328 行与 rw-criterion.tex 第 135--137 行在 $\varepsilon=\tfrac12$ 处对齐，我逐项核过）。cube 端：$g(s)=(1-2s/\delta)_{+}$ 的零点阈值 $s=\delta/2$，$y_j$ 支撑阈值 $t_j>\delta$，两者之间的间隙 $\delta/2$ 正是 $r(t)$ 落到顶点所需的裕度：$t_i<\delta/2$ 与 $d(t)=t_j>\delta$ 给 $t_i/d(t)<\frac{\delta/2}{\delta}=\frac12$ 严格成立；代 $\delta=0.2$：斜率 $2/\delta=10$，$H(t)\le10(t_1+t_2)$，$y_1$ 区 $t_1>0.2$、$t_2<0.1$，$r(t)=(1,0)$ 逐点吻合。假设数值下我还验了 $Q(t)=g(1-g)\le\tfrac14$（$g\in[0,1]$ 时 $g(1-g)$ 在 $g=\tfrac12$ 取最大）与 $f_\tau$ 的 sup 界：$\tau=1$ 时 $t=1$ 给 $1\cdot(1-\sqrt{1/2})^{2}\approx0.086$、$t=3$ 给 $3(1-\sqrt{3/4})^{2}\approx0.054$、$t=0.1$ 给 $0.1(1-\sqrt{1/11})^{2}\approx0.035$，均在 $\le\tau=1$ 内，与第十四节解析推导 $\sup_{t\ge0}tf_\tau(t)^{2}=\tau\sup_{0\le s<1}\frac{s^{2}(1-s)}{1+s}\le\tau$ 相符（我在 $s=\tfrac23$ 处又试一数值点：$\frac{(4/9)(1/3)}{5/3}=\frac{4}{45}\approx0.089$）。

正性判断汇总成一张式子表，方便我以后回查：$e=(a-\delta)_{+}\ge0$、$T\ge(\delta-\eta)e\ge0$、$a=\varepsilon^{-1}(c-(1-\varepsilon))_{+}\ge0$、$d=f(a_1)+f(a_2)\ge0$、$h=g(d)\ge0$、$k=\varphi(h)\ge0$、$0\le l=1-h-k\le d$、$X=g^{\otimes k}\ge0$、$Y=\sum_jy_j\ge0$（各 $y_j$ 两两正交）、$(a_1-\tfrac12)_{+}\ge0$、$H(t)\in[0,1]$（$0\le\prod_jg(t_j)\le1$）。每条我在第十二、十三节的正文里都有对应的逐点或逐谱验算，这里集中列出只为防止日后重读时把某条的支撑方向记反。类不等式全表：$[1_P]\le N[c]$、$N[e]\le2^{L}[e]\le[1_R]\le k[e]$、$[X]\le N[y_j]$（每 $j$）、$k[X]\le N[Y]$、$[X\otimes1_R]\le k[X\otimes e]\le N[Y\otimes e]\le[Y\otimes1_R]\le[(b_1-\tfrac12)_{+}]$；全部只用 preliminaries.tex 第 20--27 行的三条规则，无消去。

开放问题我留两条在草稿纸上没算完的。其一：标签层 $n$ 的下界我只有存在性（$2^{n}>2mn+r-1$ 的首个解），若想把 $m_{\text{total}}$ 写成 $D$ 的显式函数，需要 $N$（full cut 项数）与 $m,r$（检测空间与桥族）之间的可计算关系，tex 未给，我也没能从已读分片里推出，[推测] 这条大约要另起一篇。其二：$F_\omega(A)$ 无 character 时其自身是否 subhomogeneous-free（即能否把 KR 定理 2.5 的输入从"存在子代数"升级到"$F_\omega(A)$ 本身"），thm:main 的证明只用到像 $E$ 的商结构（application.tex 第 45--53 行），升级与否我在代数上没有反例，留作下一张草稿纸的题。台账六行的追加（第二节末，接原 ‖w‖=1 行之后）对应以上全部验算中出现的新见证量，格内数学均已按规范写成数学模式。
