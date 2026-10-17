# D109: Falconer 距离猜想全维版 -- 角增益与递归装配的反推笔记

## 0 初始动机与猜想

我做这项工作的起点是 Falconer 1985 年的那个经典问题：紧集 E 的 Hausdorff 维数大于环境空间维数的一半时，距离集 Delta(E) = {abs(x-y) : x,y in E} 是否必定有正 Lebesgue 测度。[外部推断] 此前最好的结果：偶数维 d>=4 由 Du-Iosevich-Ou-Wang-Zhang 给出阈值 d/2+1/4，奇数维由 Du-Zhang 给出 d/2+1/4+1/(8d-4)，平面由 Guth-Iosevich-Ou-Wang 处理 5/4 以上。2025 年 Shmerkin-Wang 在临界维 d/2 处仅证到了维数一结论。本文（00_introduction.tex:7-9）声称完全证明了所有 d>=2 的猜想。

我最初的猜想很简单：Falconer 的经典 Fourier 论证（s-球平均判据，Mattila 1987）在 d/2 阈值处失败，失败原因是径向投影的维数不可能超过源维数（00_introduction.tex:139-144），所以只要能绕过这个维数障碍，把球平均论证修补到临界处就行了。[推测] 我设想的路线是：先在 d/2+epsilon 处用已知的 decoupling/restriction 方法拿到正测度，然后让 epsilon 趋向零，用某种单调性论证传递结论。

这个想法的第一个问题是：decoupling 机器有硬上限，它给不出 d/2 的阈值。[推测] 我试过的第二条错误路线是试图把 Keleti-Shmerkin (2019) 的 profile 最优化从维数结论提升到测度结论：他们证明了 planar 距离集的 Hausdorff 维数下界，方法是把测度分拆为 dyadically regular classes 再优化 Lipschitz profiles 的 variation。这条路走不通的原因很明确：Hausdorff 维数结论允许 sigma-additive 分解中丢失 countable union 之外的质量，而 Lebesgue 测度正性要求某种绝对连续性，单调性论证在此处没有自然的接口。

取材队列：preprints/The-Falconer-distance-conjecture-in-all-dimensions-September-23-2026，对应 .tools/lean_queue.txt 第 138 行，即队列第 138 行号。

登记补记：本篇取材目录 preprints/The-Falconer-distance-conjecture-in-all-dimensions-September-23-2026（日期后缀 September-23-2026 照抄），位于 .tools/lean_queue.txt 队列第 138 行号；Lean 侧对应 .tools/records.txt 的 1386 | ComparatorChallenges/PlanarFalconer.json | declaration: OAI.PlanarFalconer.mainTarget_proved | file: OAI/MeasureTheory/Falconer/Main.lean，模块目录 lean/OAI/MeasureTheory/Falconer/。

## 1 初始设想的第三条错误路线与失败原因

[推测] 第三条我试过的路是把 Orponen-Shmerkin-Wang 2024 的 thin-tube bootstrap 从 planar 推广到任意维。他们的 Lemma 2.8 用的是平面上的 Furstenberg 型估计。我一度以为只要把 Furstenberg 定理换成高维 analog 就行了，但高维的 incidence 问题没有对应的深层输入。论文里 03_angular_gain.tex:6-7 明确说"The planar discretized Furstenberg theorem is the only deep input"，意味着这条路只能走切片，把高维 incidence 问题化为平面问题。我最初设想直接在高维用多线性 Kakeya 不等式，但这给出的指数太弱：在临界维数处 Kakeya 的 gain 不闭合递归。

第四条错误路线：[推测] 我考虑过是否可以用 Bourgain-Demeter 的 l^2-decoupling 在球面上直接做 restriction 估计。论文明确拒绝了这条路（00_introduction.tex:135 "it does not invoke a decoupling theorem"）。失败原因是：在 S=d/2 时球面的 restriction 常数与球面 Fourier 衰减的交互在临界处恰好退化，而递归需要的 gain 是 subpower 量级的，不是 fixed power 的。

## 2 关键转折点：角切片与平面 incidence 的对接

转折点出现在我意识到必须把"方向"和"距离"两件事解耦之后。论文 00_introduction.tex:139-144 的核心观察是：径向投影 pi_x(z) = (z-x)/abs(z-x) 的像集的维数被源维数 s 卡住，当 S < s < d-1 时不可能有 S^{d-1} 上的密度。但 Fourier 论证实际需要的只是 cap 估计（密度可有可无）。[推测] 这一步的灵感可能来自 Orponen 2019 的 finite-energy 方法（04_preparation.tex:418-431 的 Lemma prep:radial-lp），该方法在有有限 (h+epsilon)-energy 时给出径向密度的 L^p 可积性，但只在维数 h 足够小时才成立。

一旦接受"不需要密度、只需要 cap 估计"，整个证明就变成了：(i) 通过切片和平面 Furstenberg 定理获得方向 cap 估计；(ii) 把这些 cap 估计用 Fourier 论证转化为距离 shell 衰减；(iii) 用单调列 shell 重构引理把 shell 衰减升级为极限测度的绝对连续性。

## 3 角增益定理的机械拆解

03_angular_gain.tex:21-45 的 Theorem ang:linear-gain 是整个角切片论证的核心输出。让我逐条件拆：

固定 k >= 2（切片后的方向空间是 R^{k+1}，S^k 是方向球面），指数区间为 k-1 <= q <= k-1/2 < t < k。

为什么 t > k-1/2 而 q <= k-1/2？回溯到 00_introduction.tex:139 的 S=d/2 设定。当 d=2k-1（奇数维）时 S=k-1/2。Frostman 指数 s > S 所以 s > k-1/2。切片到 codimension h=k-1 后，点指数变为 t=s-(k-1)>1/2，方向指数 q 是方向测度的 ball 维数。端点 q=k-1 对应 S 的整数值。

逐字验证（03_angular_gain.tex:24）：
```
 k-1\le q\le k-\tfrac12<t<k.
```
这里 q=k-1 需要额外的 plate 条件（03_angular_gain.tex:32-35）：
```
 \nu\{w:\dist(w,H)\le r\}\le\delta^{-\epsilon}r^\zeta
```

这个 plate 条件的几何理由：当 q=k-1 时方向测度已经退化到超平面，需要额外的"远离所有超平面"的均匀性来保证切片后不会落在更低维的子空间上。

## 4 两种切片策略与 h 的选取

03_angular_gain.tex:52-63 说明了分两路走：

q > k-1 时：取 codimension h=k-1，切片留下平面（dimension 2），得到 b=q-h in (0,1/2], f=t-h in (1/2,1)。这正好落在平面 Furstenberg 定理（ang:furstenberg, 03_angular_gain.tex:78-92）的适用范围 b<f<2。

q = k-1 时（端点）：同样的 h=k-1 会让 b=0，出界。所以改用 h=k-2，留下三维切片，方向指数为 q-h=1，点指数为 t-h = t-(k-2) > k-1/2-(k-2) = 3/2。[推测] 这就是为什么端点需要完全不同的论证机器。

## 5 Loomis-Whitney 与弱径向估计：端点论证的骨架

03_angular_gain.tex:439-472 的 Lemma ang:loomis-whitney 是端点证明的计数引擎。它说：若 R^m 中的有界集 A 对每个 i=1,...,m 被 M_i 根宽度 C*delta、方向 v_i 的管覆盖，且 det(v_1,...,v_m)>=Delta，则

```
 |A|_{C_m\delta}\le C_{m,C}\Delta^{-m}\prod_{i=1}^m M_i^{1/(m-1)}.
```

在 m=3（端点切片的维度）时，三个方向的 tube count 各约 delta^{-1-o(1)}（因为 q-h=1），det 的下界约 delta^a（03_angular_gain.tex:695-698），所以

```
 |A|_delta \le delta^{-3/2-3a-o(1)}.
```

另一方面 A 的点 ball 维数给出 |A|_delta >= delta^{-(t-h)+o(1)}，而 t-h > 3/2（因为 t > k-1/2, h=k-2, 即 t-h > 3/2）。设 g = t-h-3/2 > 0，选择 a < g/4 就得到矛盾。

弱径向估计（ang:weak-radial, 03_angular_gain.tex:477-656）的作用是找到这三个"横截"方向。它的指数区间是 k-2 < ell < (k-1)^2/k（03_angular_gain.tex:480-481），上界 (k-1)^2/k = k-2+1/k 恰比 h=k-2 多出 1/k，这个 1/k 就是"找到三个横截方向"所需的增益量。[推测] 如果 k=2（平面情形），则 h=0, (k-1)^2/k = 1/2，而 k-2=0，所以 ell in (0,1/2)；论文在 03_angular_gain.tex:866 明确指出 k=2 时 h=0，证明仍然成立。

## 6 薄管升级命题：从整数到半整数

04_preparation.tex:278-311 的 Proposition prep:thin-upgrade 说：如果 k-1 是 available 的，则 k-1/2 也是 available 的。这是奇数维 Falconer 猜想的核心机制。

available 的定义（04_preparation.tex:25-37）是一个关于 pair set G_N 的方向测度的 cap 估计的递推闭合条件。其逻辑是：

(1) k-1 来自 Lemma prep:integer-caps（04_preparation.tex:535-570），它通过 radial L^p 估计把有限能量条件转化为整数指数的 cap 界。

(2) 从 k-1 到 k-1/2 的提升靠的是 Lemma prep:one-scale（04_preparation.tex:73-276），它用正则化类、contact interval 三分段（prep:contact, 04_preparation.tex:39-65）、以及角增益定理的反面（Corollary ang:bad-directions）做单尺度改进。

[推测] 为什么恰好停在 k-1/2，更大的指数会坏在哪一步？因为 S=d/2=k-1/2（奇数维 d=2k-1），递归需要的所有方向信息在这个指数上恰好闭合。超过它则递归的势函数会变为负，低于它则球 Fourier 衰减不严格。

## 7 粗滤网与重板排除

04_preparation.tex:584-729 的 Lemma prep:coarse-filter 构造了递减 Borel 集 Gamma_N，其极限有正乘积测度。核心机制：

a = s-(k-1) > 1/2（由 s > k-1/2 保证，见 04_preparation.tex:601）。在宽度 r 下，(k-1)-维仿射平面的 r-邻域被 rho 赋的测度至多 C*r^a。

"重板"定义为 rho(H_r) >= r^b（b 待选）。重板的参数集有 r-net 规模 O(r^{-C_0*b})（04_preparation.tex:612-615）。选 b 足够小使得 8*C_0*b < a/4 且 k*L*b < 1/2（04_preparation.tex:708）。

[推测] 这里 L > 2/a 是用来保证在重板内逐次选取 k+1 个点时每一步的"被禁区域"体积够小，使得可容许 k-simplex 的乘积测度至少 c*r^{(k+1)b}（04_preparation.tex:624）。如果 L 不够大，simplex 体积下界就不够，net 大小估计失败。

最终 Gamma_N 的 plate 指数 zeta = omega*b（04_preparation.tex:728），其中 omega 是粗滤网参数。

## 8 正则化与 profile 结构

02_regularization.tex:10-117 的 Lemma reg:regularization 把概率 rho 分拆为至多 N^{C_n/lambda} 个正则类，每类有非递减 n-Lipschitz profile m_alpha。关键界（02_regularization.tex:27-31）：

```
 R^{-m_\alpha(j/N)-C_n\lambda}
 \le\rho_\alpha(Q)\le
 R^{-m_\alpha(j/N)+C_n\lambda}
```

profile 下界（02_regularization.tex:34-37）：m_alpha(u) >= su - C_n*lambda - log_R K。

这保证了 m_alpha(1) >= s - C_n*lambda - log_R K，即类在"最粗尺度"上的维数不低于原始 Frostman 维数（减去可控制损失）。

在 05_profiles_tests.tex:44-51 中定义了递归使用的四个核心量：M(n)=R^{-m(n/N)}, A_n=m(n/N)-Sn/N, I(g,p)=m(p/N)-m(g/N), k(g,p)=A_p-min_{g<=n<=p}A_n。A_n 是"超出临界指数 S 的部分"，k(g,p) 是从深度 g 到 p 的"势的增量"。

## 9 振荡积分与加权 shell 转换

06_oscillatory.tex:182-220 的 Proposition osc:shell-conversion 是把距离测度的 Fourier 变换转换为球面角能量 H 的关键。其输入是 separated depth-a 上的加权距离测度 nu，输出是 shell [2^{v-1}, 2^{v+1}] 上的 Fourier L^2 范数被 H_F(a,v) 控制。

逐引理拆解第一个关键步骤：球面驻定相展开。06_oscillatory.tex:246-291 的 Lemma osc:stationary 给出直接展开和逆展开。

直接展开（06_oscillatory.tex:253-259）：
```
 \int_{S^{n_*}}e^{irw\cdot\Delta}\psi(w)b(w)\,dw
 =\Lambda^{-n_*/2}
   \left[e^{i\Lambda}\sum_{j=0}^{J-1}
                    \Lambda^{-j}(L_jb)(e)+E_J\right],
```
其中 n_* = d-1，Lambda = r*abs(Delta)，L_j 是由球面 Laplacian 定义的全局微分算子（06_oscillatory.tex:232-239）：
```
 L_j&=\frac{c_{n_*}}{(2i)^j j!}
   \prod_{q=0}^{j-1}
   \left(\Delta_{S^{n_*}}+q(q+1)
                    -\frac{n_*(n_*-2)}4\right)
```

[推测] 这个算子结构来自对 Helmholtz 方程在球极坐标下的 WKB 展开：把 Fourier extension F(xi) 用径向-角向分离，然后按 1/Lambda 阶逐项匹配。递归关系 2i(j+1)a_{j+1} = (Delta_S + j(j+1) - n_*(n_*-2)/4) a_j 出现在 06_oscillatory.tex:364-367 附近的证明中。

逆展开（06_oscillatory.tex:280-287 的 osc:inverse）用 B_j 算子：
```
 e^{i\Lambda}b(e)
 =\Lambda^{n_*/2}\sum_{j=0}^{J-1}\Lambda^{-j}
       \int_{S^{n_*}}e^{irw\cdot\Delta}\psi(w)(B_jb)(w)\,dw
       +O(R^{-T}).
```
B_j 通过 B_0=L_0^{-1}, B_j = -L_0^{-1} sum_{h=1}^j L_h B_{j-h} 递推定义（06_oscillatory.tex:271-274）。每个 B_j 是 Delta_S 的多项式，微分阶至多 2j。

适用条件（osc:stationary-regime, 06_oscillatory.tex:278-279）：
```
 \Lambda\ge R^{c\sigma},\qquad
 A^2/\Lambda\le R^{-c\sigma},\qquad 1\le A\le R^2
```
这里 A 是 b 的 C^m 范数的增长率。验证在 shell 转换中这成立：06_oscillatory.tex:438-450 给出了 q=v-a >= 20*sigma*N 时 Lambda 约 2^q >= R^{20*sigma}，而 D_*^2/Lambda <= R^{-18*sigma}（用了 L <= q/2 + sigma*N 的假设）。

## 10 空间系数的分离与权重消去

06_oscillatory.tex:406-433 的 Lemma osc:spatial-separation 说：在 separated depth-a cells 上，(D(x,y)*2^a)^{-j} 可以展开为 sum_l c_l f_l(x) g_l(y)，绝对系数和 bounded by C_{d,j}。

证明的机制：写 x = c_X + 2^{-a}*u, y = c_Y + 2^{-a}*z，则 abs(2^a*(c_X-c_Y) + u - z) 在有界 box 上有正上下界（因为 separation 条件 K_d/8 <= abs(c_X-c_Y)*2^a <= 4*K_d），所以负 j 次幂在固定 box 的邻域内可光滑延拓，Fourier 级数绝对收敛。

权重消去（06_oscillatory.tex:460-464, osc:weight-cancellation）：
```
 (D2^a)^{-n_*/2}(rD)^{n_*/2}(rD)^{-j}
 = (r2^{-a})^{n_*/2}(r2^{-a})^{-j}(D2^a)^{-j}.
```
左边是原始距离权重乘上驻定相的 Lambda^{n_*/2} 因子再乘 Lambda^{-j}。消去后 D 只剩下 (D*2^a)^{-j}，这正是 spatial separation 可以处理的项。

尺度偿付（osc:scale-payment, 06_oscillatory.tex:474-478）：
```
 2^{-jq}D_{\max}^{2j}
 \le\bigl[\max(2^{-q},R^{-98\sigma})\bigr]^j\le1.
```
D_max = max(1, 2^L * R^{-50*sigma})，而 q >= 20*sigma*N >= 20*log_2(R)*sigma，所以 2^{-q} <= R^{-20*sigma}。当 L <= q/2 + sigma*N 时 D_max <= max(1, 2^{q/2}R^{-49*sigma})。若 2^L*R^{-50*sigma} >= 1 则 D_max^{2j}*2^{-jq} = (2^{2L}R^{-100*sigma})^j * 2^{-jq} = 2^{j(2L-q)}*R^{-100*sigma*j}，由 2L <= q+2*sigma*N 得 2L-q <= 2*sigma*N = 2*sigma*log_2(R)，即 2^{2L-q} <= R^{2*sigma}，最终 D_max^{2j}*2^{-jq} <= R^{2*sigma*j}*R^{-100*sigma*j} = R^{-98*sigma*j} <= 1。

归一化恒等式（osc:normalization-identity, 06_oscillatory.tex:514-516）：
```
 2^{-a}\,2^v\,2^{n_*(v-a)}=2^{d(v-a)}.
```
左边：2^{-a} 来自 shell 积分中 dr 的归一化（06_oscillatory.tex:210 的 2^{-a}*int ... dr），2^v 来自 dr = 2^v ds 的换元，2^{n_*(v-a)} 来自驻定相的 Lambda^{-n_*/2} 平方。合计 2^{-a+v+(d-1)(v-a)} = 2^{(d-1)(v-a)+(v-a)} = 2^{d(v-a)}。

## 11 递归态定义与六种归约

08_recursion.tex:18-47 定义了 positive distance state：给 depth a 到 t，cells X,Y，index i，值 D_i^{X,Y}(a,t) 是归一化的近距对计数。逐字验证归一化公式（08_recursion.tex:37-42）：
```
 \mathsf D_i^{X,Y}(a,t)
 =2^{t-a}M(a)^{-4}
   \int\mathbf1_{\{|D(x,y)-D(x',y')|\le C_0 2^{-t}\}}
   \,d\theta_i^{X,Y}(a,t)(x,y)
   \,d\theta_i^{X,Y}(a,t)(x',y').
```
C_0 = 100(d+1)（08_recursion.tex:35），M(a) 是模型质量。

08_recursion.tex:49-83 定义了 angular state：有一个 retained base B=[a_0,t_0] 和 current interval [a,v]，满足 0 <= a_0 <= a <= v <= t_0 <= N 和 t_0 <= v+sigma*N（08_recursion.tex:53-55, osc:base-contract）。其值是 general angular energy H_i^B(a,v)。

Proposition rec:reductions（08_recursion.tex:194-261）给出六种归约：

1. Suffix（08_recursion.tex:267-331）：D_i(a,t) -> D_{i+1}(a,p)，cost = A_p - min_{[p,t]}A。用于 2p > a+t 的情况。核心是 Taylor 展开到 depth-p 的 cell 上用 witness direction e_0 做投影测试。

2. Low（08_recursion.tex:333-371）：D_i(a,t) -> D_{i+1}(a,v)，cost = 0。用于 t-v >= sigma*N 的频率 shell。

3. High（08_recursion.tex:373-405）：D_i(a,t) -> H_i^{[a,t]}(p,v)，cost = k(a,p)。用于 t-v < sigma*N 的高频 shell。

4. Direct（08_recursion.tex:407-440）：H_i^B(a,v) -> H_i^B(p,v)，cost = k(a,p)。当 h <= a 时用 graph 估计沿最长 descriptor 的 anchor 推进。

5. Near（08_recursion.tex:442-465）：H_i^B(a,v) -> H_i^B(h,v)，cost = 0。当 h > a 时在 depth h 切分 transform，near term 有 bounded degree。

6. Far（08_recursion.tex:468-588）：H_i^B(a,v) -> D_{i+1}(b,v)，cost = 0。far term 用两次驻定相展开回到 positive state。

角态分割深度公式（08_recursion.tex:179-181, rec:angular-split-depth）：
```
 L_0=\max\{L,\lceil10\sigma N\rceil\},\qquad h=v-2L_0.
```
这比较最长剩余 descriptor 和当前频率范围的一半。[推测] 10*sigma*N 的下界是为了保证当所有 descriptor 都短时仍然有足够的空间做 near/far 分拆。

归一化恒等式（08_recursion.tex:105-109, rec:normalization）：
```
 2^{d(b-a)}\left(\frac{M(b)}{M(a)}\right)^2
 =2^{d(b-a)}R^{-2I(a,b)}
 =R^{-2(A_b-A_a)}.
```
关键用到了 S=d/2：2^{d(b-a)} * R^{-2(m(b/N)-m(a/N))} = 2^{d(b-a)} * R^{-2*m(b/N)+2*m(a/N)}。因为 S=d/2 所以 d(b-a) = 2*S*(b-a) = 2*(Sn/N - Sm/N 的 N-归一化)，恰好使得 R^{-2(A_b-A_a)}。

## 12 双深度势函数与递归闭合

09_ledger.tex:13-20 定义了势函数 V(J) = min_{a<=i<j<=t, j-i>=10q_0}(A_i+A_j)，对宽度 >= 10q_0 的区间 J=[a,t] 定义。

为什么需要"两个 well-separated depths"？因为单个 A 的最差情况可能在 policy 的 inner interval 之外取到最小值，而 suffix cost 涉及 [p,t] 上的最小值。用两深度对保证了在 child interval 中替换一个深度为 minimizer 时，另一个保持不变。

Payment 引理（09_ledger.tex:30-117, ledger:payment）：对任何正 cost 归约，cost <= V(J') - V(J)。这直接给出递归的单调下降：sum of costs along any branch <= V(final) - V(initial)。

09_ledger.tex:134-189 的 Lemma ledger:termination 界住了分支上的转移数：至多 20/kappa 个非 low 转移，至多 1/sigma 个 low 转移。因此平滑指数 i 的增量至多 20/kappa + 1/sigma。J_0 的定义（09_ledger.tex:143）：
```
 J_0=\left\lceil100(1/\kappa+1/\sigma)+100\right\rceil.
```

主定理（09_ledger.tex:191-301, ledger:bound）：单 profile angular 态的界为
```
 \mathsf H_0^{[c,N]}(c,N)
 \le R^{2A_c-\mathcal V([c,N])
                   +C_d(\kappa+\sigma/\kappa)+o(1)}.
```

证明的 telescope：start changes 的 R^{-2(A_{a'}-A_a)} 因子沿分支乘积为 R^{2A_c-2A_{a_f}}（09_ledger.tex:223-224）。cost 总和 <= V(J_*) - V([c,N])（09_ledger.tex:231-234, ledger:cost-sum）。最后一个有定义的势 V(J_*) <= 2A_{a_f} + O_d(kappa)（09_ledger.tex:248-250, ledger:last-potential）。合在一起 R^{2A_c - V([c,N]) + O_d(kappa) + stopping + non-low*sigma}。

## 13 Lean 机器侧取证：机器证到的与笔头声称的

formalization.yaml 第 1386-1388 行逐字：
```
    - comparator_config: ComparatorChallenges/PlanarFalconer.json
      declaration: OAI.PlanarFalconer.mainTarget_proved
      file: OAI/MeasureTheory/Falconer/Main.lean
```

这三行是唯一的登记权威。让我分析它究竟声称了什么。

Main.lean 第 50 行（唯一 grep 命中）：
```
theorem mainTarget_proved : MainTarget := manuscript_main
```

MainTarget 在 Model.lean 第 13-14 行的定义：
```
def MainTarget : Prop :=
  forall E : Set Plane, IsCompact E -> 1 < dimH E -> 0 < volume (distanceSet E)
```

关键事实：Plane 在 Model.lean 第 8 行定义为 `abbrev Plane := EuclideanSpace R (Fin 2)`，即 R^2。distanceSet（第 10-11 行）是 `{r | exists x in E, exists y in E, dist x y = r}`。

所以 `OAI.PlanarFalconer.mainTarget_proved` 断言的是：对 R^2 中紧集 E，dimH E > 1 蕴含 distanceSet E 有正 Lebesgue 测度。这是 Falconer 猜想的平面版（d=2, S=d/2=1），不是"all dimensions"版。

同时仓库中存在 AllDimensions.lean（第 33-35 行），定义了
```
def MainTarget : Prop :=
  forall (d : Nat), 2 <= d -> forall E : Set (Space d), IsCompact E ->
    (d : ENNReal) / 2 < dimH E -> 0 < volume (distanceSet E)
```
这才是全维版。它属于 namespace `OAI.Falconer`（第 22 行），不是 `OAI.PlanarFalconer`。

命名冲突分析：论文题名是"The Falconer distance conjecture in all dimensions"。比较器 json 叫 PlanarFalconer.json，里面 `"challenge_module": "ComparatorChallenges.PlanarFalconer"`，`"solution_module": "OAI.MeasureTheory.Falconer.Main"`。json 中 `"theorem_names"` 列的就是 `OAI.PlanarFalconer.mainTarget_proved` 一个。permitted_axioms 是 propext/Classical.choice/Quot.sound（与规格允许的三个一致）。enable_nanoda: false。

机器验收面落在哪个维数？答案是维数 2。Main.lean 的 manuscript_main（第 12 行）签名是 `(E : Set Plane)`，即 Fin 2-indexed Euclidean space。整个证明链用的是 exists_normalized_root_setup（第 15 行）中 Plane 上特有的工具，没有涉及一般 d 的参数化。

进一步：Main.lean 第 12-13 行的 theorem 签名：
```
theorem manuscript_main (E : Set Plane) (hE : IsCompact E) (hd : 1 < dimH E) :
    0 < volume (distanceSet E) := by
```
hd 是 `1 < dimH E`，其中 1 = d/2 对 d=2。整个归约链：exists_normalized_root_setup -> exists_source_assembly_parameters -> two_root_has_shell_approximations -> shell_criterion -> positive_distance_volume_of_weighted_ac -> distanceSet_positive_of_dilate。所有中间步骤的签名都是 Plane-specific。

AllDimensions.lean 中还有 estimates 子目录里的 AllDimensionalMain.lean（grep 命中第 26 行），其签名依赖 `PublishedQuadraticStationary` 假设。[推测] 这说明全维版在 Lean 中是条件性的（依赖某些"已发表"引理作为 axioms/assumptions 被引入），尚未无条件证明。

## 14 装配：入口深度与 shell 衰减

10_assembly.tex 把前述所有零件拼起来。

入口深度（05_profiles_tests.tex:25-27）参数选取顺序：
```
0<beta<min(chi/10,1/10), kappa <<_d beta/d, sigma <<_{d,beta,kappa} kappa.
```
然后 omega 最后选（05_profiles_tests.tex:29-30）。

10_assembly.tex:62-112 的 Lemma asm:entry：beta < min(chi/10, 1/10) 固定后，定义
```
 c=\max\{n\in\{0,\ldots,N\}:
                  \min(A_{1,n},A_{2,n})\le\beta\}
```
即"最后一个使两条 excess profile 中较短的那条仍在 beta 以下的深度"。范围估计（10_assembly.tex:74）：floor(beta*N/(2d)) <= c < N/4。

下界理由：对 n <= beta*N/(2d)，Lipschitz bound 给 A_{j,n} <= d*n/N <= beta/2 < beta。上界理由：对 n >= N/4，profile 下界 A_{j,n} >= chi/4 - C_d*sigma > beta（sigma 够小时）。

entry cost（10_assembly.tex:78-79）：min_j k_j(0,c) <= beta + C_d*sigma。由 c 的最大性，存在 j_* 使 A_{j_*,c} <= beta，而 min_{0<=n<=c} A_{j_*,n} >= -C_d*sigma（因为 A_0=0 且 Lipschitz）。所以 k_{j_*}(0,c) = A_c - min A <= beta + C_d*sigma。

势下界（10_assembly.tex:85-90, asm:entry-potential）：V_j([c,N]) >= 2*beta - 2d/N。因为 c 的定义保证所有 n >= c 处 A_{j,n} > beta - d/N（Lipschitz + 最大性），取两个 separated 深度 u,v >= c 时 A_{j,u}+A_{j,v} >= 2(beta - d/N)。

shell 衰减证明（10_assembly.tex:256-444, Proposition asm:shell-decay）的核心链：

步骤 1：root shell conversion（a=0, v=N）给 H_F(0,N)。

步骤 2：graph separated form at p=c 给 R^{-A_1,c - A_2,c + min_j k_j(0,c) + O_d(sigma) + o(1)} 乘上 general two-profile energy H(c,N)。

步骤 3：Cauchy-Schwarz 分拆两 profile 为单 profile 态 H_j(c,N)（asm:two-profile-cs, 10_assembly.tex:330-338）。

步骤 4：Theorem ledger:bound 给 H_j(c,N) <= R^{2A_{j,c} - V_j([c,N]) + O_d(kappa+sigma/kappa) + o(1)}。

步骤 5：asm:entry-cancellation（10_assembly.tex:358-366）把 A_{j,c} 项相消：
```
 min_j k_j(0,c) - (1/2)(V_1([c,N])+V_2([c,N]))
 <= -beta + C_d*sigma + 2d/N
```
2A_{j,c} 与 -A_{j,c} 相消后剩 -V/2 + min_k。由 V >= 2beta-2d/N 和 min_k <= beta+C_d*sigma，得到 <= -beta + C_d*sigma + 2d/N。

步骤 6：omega 的约束（10_assembly.tex:389, asm:omega-choice）：4d*omega < beta/8。乘上空间 partition 数 R^{4d*omega} 后总 exponent 仍然严格负。

最终（10_assembly.tex:435-437）：
```
 R^{-beta+C_d(kappa+sigma/kappa)+4d*omega+o(1)} + R^{-T+4d*omega}
```
successive choices 让指数为负。

## 15 单调 shell 重构引理

10_assembly.tex:454-573 的 Lemma asm:monotone-shell 是最终步骤。它说：若 alpha_N 递减到 alpha_infty，||alpha_N - tau_N||_TV 的 sum 有限，且 shell Fourier 积分的 sqrt-summability，则 alpha_infty 绝对连续。

证明用的 Littlewood-Paley 分解：P_N = Q_N - Q_{N-1}（10_assembly.tex:477），其中 Q_N 的 multiplier 是 smooth cutoff。关键恒等式（asm:reconstruction, 10_assembly.tex:553-558）：
```
 Q_M\alpha_\infty
 =Q_{K-1}\alpha_\infty
  +\sum_{N=K}^MP_N\tau_N
  +\sum_{N=K}^MP_N(\alpha_N-\tau_N)-Z_M.
```

这里 Z_M = sum_{N=K}^M P_N(alpha_N - alpha_infty)。单调性让 Z_M 收敛到 Z 在 L^1（asm:variation-tail, 10_assembly.tex:539-546）。

[推测] 为什么需要单调性？因为 P_N 的 L^1 operator norm 不随 N 有界，所以不能直接对 alpha_N 做 band-by-band L^1 估计。单调性让 alpha_N - alpha_infty = sum_{n>=N} zeta_n（positive increments），这样 Z = sum_n (Q_n - Q_{K-1}) zeta_n 的绝对收敛就靠 sum ||zeta_n||_TV = alpha_K(R) - alpha_infty(R) < infinity 保证。

Plancherel 用在哪里：10_assembly.tex:496-499 把 shell Fourier L^2 界转化为 ||P_N*tau_N||_{L^2} 的 summability。L^2 级数绝对收敛（asm:two-convergent-series, 10_assembly.tex:502-503），所以 G = sum P_N*tau_N 在 L^2 中收敛。

最终 Q_M*alpha_infty 分布意义收敛到 alpha_infty（Q_M kernel 是 approximate identity），所以 alpha_infty 在 L^1_loc 中有密度。

## 16 最终思路与最初设想的差异

回溯到 ## 0 的初始猜想，最终的证明结构与它有以下根本差异：

(1) 我最初以为 Fourier 论证是主角。实际上整篇论文的 Fourier 内容仅限于：经典的 Falconer 阈值论证（prep:classical-plane, 04_preparation.tex:318-377 处理 s>(n+1)/2 的 exceptional case）、radial L^p 估计（04_preparation.tex:420-533）、以及驻定相展开（osc:stationary）。真正的重心在 incidence 几何（角增益）和递归 combinatorics（profile 归约、双深度势函数）。

(2) 我最初设想通过 epsilon 极限传递获得 d/2 的结果。论文实际上是在 d/2 处直接工作，不经过任何 epsilon 逼近。[推测] 这是因为极限传递在 Lebesgue 测度正性上不可行：一个有密度的测度的弱极限可能是奇异的（论文因此设计了 monotone-shell lemma ，并非简单极限论证）。

(3) 我最初以为递归只需要一个量。实际有两个递归态（positive count D 和 angular energy H）加六种归约。[推测] 双态设计的理由是：positive count 处理"距离近对"的自然 combinatorics，但高频部分需要 Fourier 信息（即 angular energy）；而 angular energy 的 graph 归约又回到 positive count。这种 mutual recursion 是闭合势函数论证的必要结构。

(4) 关于奇偶维的统一处理：我最初以为奇数维比偶数维难得多。论文确实如此：偶数维只需要 integer caps（h = floor(S) = S 本身就是整数），奇数维多了一步从 k-1 到 k-1/2 的薄管升级（prep:thin-upgrade）。但这个"多出来的一步"的代价是一整个角增益定理及其端点论证（03_angular_gain.tex 的 42,932 字节中大部分是端点情形）。

(5) 机器面与笔头面的分裂：论文标题声称 all dimensions，而 Lean 形式化只到了平面。这不是疏忽：全维版的递归结构（所有指数 k, S, h, ell, J_0）在 d>=3 时的形式化代价是指数级增长。[推测] 可能作者选择了先完整机器化 d=2 作为 proof of concept，全维版留作后续。AllDimensions.lean 的存在（有完整的 MainTarget 定义但无 unconditional proof）支持这一判断。

(6) 我最初以为 profile 的 Lipschitz 性质是 technical convenience。实际上它是整个势函数论证的核心：势 V(J) 用两个 separated depths 的 A_i+A_j 最小值定义，而 profile 的 d-Lipschitz 性质（09_ledger.tex:249, 20d*q_0/N 的误差来源）恰好给出 terminal 估计 O_d(kappa)。没有 Lipschitz 条件，最后的势不能被 bound 住。

## 17 角增益证明中的 Haar 估计与切片选取

03_angular_gain.tex:208-247 的 Lemma ang:haar 提供了切片的核心概率估计。它说的是：n 维空间中 codimension-h 的 Haar 随机子空间 V，一个单位向量 w 落入 V 的 delta-邻域的概率约 delta^h。多向量版本（03_angular_gain.tex:217-219, ang:haar-multiple）：
```
 \delta^{-jh}\Pr\{\dist(w_i,V)\le\delta\text{ for all }i\}
       \le C_{n,j}\prod_{i=1}^j(d_i+\delta)^{-h}.
```
这里 d_1 >= ... >= d_j 是 {w_1,...,w_j} 的奇异值。

证明（03_angular_gain.tex:224-247）的机制：SVD 把 w_i 写成 sum_j s_{ij} u_j（u_j 是正交奇异方向）。固定 V，逐步揭示 random orthonormal frame of V。每步条件在先前 constrained vectors 后，projection onto V-perp restricted to their orthogonal complement 有 rank h 且 nonzero singular values bounded below（因为先前 projections 的平方和 < 1/2 if dimensional constant small）。下一向量在该 complement 的单位球上均匀，其投影长 <= r 的概率 <= C_n*r^h。乘起来得 product of (delta/d_i)^h。

03_angular_gain.tex:254-433 的 Lemma ang:slice-selection 用这些估计构造好的切片。选取过程是三步截断（03_angular_gain.tex:372-423）：先去掉方向切片质量 > K^3 的平面，再去掉点 ball bound 违反 K^6*r^{t-h} 的点和方向 ball bound 违反 K^3*r^{q-h} 的方向，最后去掉 active tube count > K^{12}*delta^{h-q} 的方向/z-pairs。每步的 incidence 代价 <= CK^{-2}，在 K 足够大后总损失 < K^{-1}。

[推测] K^{12} 的来源：tube count bound N(V,z,w) 的积分 <= K*delta^{h-q}（03_angular_gain.tex:414-416），期望值与 Markov 不等式的 ratio 决定了截断阈值。K^6 的点质量和 K^3 的方向质量相乘给 K^9，但实际用的是 K^{12}，多出的 K^3 是给 z-volume bound 留余量。

## 18 平面 measure incidence 引理的反证结构

03_angular_gain.tex:103-201 的 Lemma ang:planar-measures 是 proof by contradiction。它假设存在 delta->0 的序列使得 incidence 质量 >= delta^{o(1)}，而方向纤维被 delta^{-b-o(1)} 条 strip 覆盖。

反证步骤：
(1) 采样 n = ceiling(delta^{-b}) 个方向标签，用 Bernstein + union bound 得样本 cap bound（ang:sample-caps, 03_angular_gain.tex:133-136）。
(2) 取 empirical incidence 至少 I/2 的样本。
(3) 取 X_0（被至少 In/4 个采样方向 incident 的点标签集），mu-mass >= I/4。
(4) 归一化 mu|_{X_0} 并采样 m = ceiling(delta^{-f}) 个点标签，得类似 cap bound。
(5) 着色 spatial delta-grid 取最分离集 P，|P|_delta >= m*delta^{o(1)}，P 是 (delta, f, delta^{-o(1)})-set。
(6) 对 P 中每个 x，其方向族 T_x 的 covering count >= cIn/T，且 T_x 是 (delta, b, delta^{-o(1)})-set。
(7) 总 union covering count <= n*delta^{-b-o(1)} = delta^{-2b-o(1)}。
(8) 与 Theorem ang:furstenberg（需要 >= delta^{-2b-epsilon_0}）矛盾。

关键细节在步骤 (6)：为什么 T_x 作为 line-parameter set 有 (delta,b)-set 性质？因为 ang:sample-caps 给了方向 r-ball 中的 count <= T*n*r^b，而 T_x 中每条 line 由方向唯一决定（x 固定）。归一化损失是 CT^2/I = delta^{-o(1)}。

## 19 弱径向估计的单尺度论证

03_angular_gain.tex:477-656 的 Lemma ang:weak-radial 是端点证明的独立构件。它的输入是 R^k 中的概率 lambda 满足 (k-1)-ball bound 和 hyperplane plate bound；输出是 pair set G 使得每个 anchor 的 cap 估计有指数 ell。

证明的单尺度断言（03_angular_gain.tex:505-638）的结构：

(a) 正则化源测度为 classes，profile m。

(b) 把 depth interval 分 J blocks，忽略前两个。对每个后续 block [a,b]：移除 pin 距 cell center < R^{-1/(4J)} 的 pairs。代价：C_J*R^{-(k-1)/(4J)+epsilon}。

(c) freezing direction 误差（ang:freezing-error, 03_angular_gain.tex:540-543）：O(2^{-2a}*R^{1/(4J)}) = o(2^{-b})，因为 a >= 2N/J + O(1) 且 b-a = N/J + O(1)，即 2^{-2a}*R^{1/(4J)} = 2^{-2a+1/(4J)}，而 2^{-b} = 2^{-a-N/J}。需要 -2a+1/(4J) > -a-N/J 即 a < N/J + 1/(4J)，这由 a >= 2N/J 保证（实际上 a <= b <= N so a >= 2N/J 意味着 N/J >= a >= 2N/J... 这里的方向应该是 2^{-2a}*R^{1/(4J)} <= 2^{-2a+1/(4J)*log_2(R)}... 需要仔细核验）。

[修正：实际上 03_angular_gain.tex:543-544 说 "here a >= 2N/J+O(1) and b-a = N/J+O(1)"，所以 2^{-2a}*R^{1/(4J)} = 2^{-2a+N/(4J)}。而 2^{-b} = 2^{-(a+N/J+O(1))}。需要 -2a+N/(4J) > -(a+N/J) 即 a < N/J + N/(4J) = 5N/(4J)。但 a >= 2N/J，矛盾？让我重新理解：a 和 b 是 block 的 start 和 end depth，b-a = N/J。所以 b = a + N/J。需要 2^{-2a+N/(4J)} = o(2^{-b}) = o(2^{-a-N/J})，即 -2a+N/(4J) < -a-N/J，即 a > N/J+N/(4J) = 5N/(4J)。而 a >= 2N/J = 8N/(4J) > 5N/(4J)。成立。]

(d) troublesome pair 定义（ang:local-fraction, 03_angular_gain.tex:549-551）：F = R^{e'}*D^{-(k-1)/k}，其中 D = R^{m(b/N)-m(a/N)} 是 block 内的 mass ratio。

(e) 核心矛盾：若 I_Q（troublesome 的 incidence 质量）>= R^{-c_2}，用 Jensen 得 k 个 pin 的共同 troublesome source set 有质量 >= I_Q^k。用 Loomis-Whitney（三管）+ Haar 估计（det >= R^{-eta} 的 triple）和 conditional child bound（ang:conditional-child），得到两个方向相反的 ball-covering 估计，矛盾条件是 k*eta + k*c_2 + C_k*tau < ke'/(k-1)。

(f) 最终 cap mass 估计（03_angular_gain.tex:629-633）：
```
 R^{J(e'+e'')+o(1)}
 R^{-\frac{k-1}{k}(k-1-2k/J-C_k\tau-\epsilon)}.
```
J 大时 2k/J 小，(k-1)/k*(k-1-2k/J-...) 接近 (k-1)^2/k。这正是 ell < (k-1)^2/k 的来源。

## 20 profiles-tests 中的 descriptor 与 mask 构造

05_profiles_tests.tex:112-150 定义了 descriptors。平行 descriptor [g,p]（g < p）有 anchor p 和 nominal length p-g；投影 descriptor [p,t]（p < t）有 anchor p 和 nominal length t-p。

好方向定义（05_profiles_tests.tex:131-150）：

平行 [g,p]：方向 w 在 level-i 是 good 若 depth-p occupied centers in B(c_P, 10(d+1)*2^{-g}) 中距 c_P + R*w 不超过 W_i(p) 的个数 <= R^{k(g,p)+C_d*sigma}。

投影 [p,t]：方向 w 在 level-i 是 good 若 (rho_P x rho_P){abs((z-z')*w) <= W_i(t)} <= 2^{-(t-p)} * R^{A_p - min_{p<=n<=t}A_n + C_d*sigma}。

W_i(n) = (2 - i/J_0) * 2^{-n} * R^{500*sigma}（05_profiles_tests.tex:122-125）。随 i 增大 W_i 递减，所以好集递增。level-0 是最严条件（最宽管）。

[推测] R^{500*sigma} 的宽度放大因子是给整个递归中所有方向扰动留余量：角态的 graph 估计改变方向 O(delta)，多次归约累积的方向扰动由 500*sigma 的 slack 吸收。这个数字没有出现在任何显式不等式中作为 sharp constant，是 "sufficiently large dimensional constant" 的一种实例化。

descriptor 选择策略（test:list-selection，05_profiles_tests.tex 后续未完整读到的部分）：对每个区间 [a,t]，固定 policy choice p 使得 A_p = min_{inner}[a,t] A。list M(a,t) 由 [a,t] 上各 block 的 parallel + projection descriptors 组成。

## 21 contact interval 与一尺度改进的三分段

04_preparation.tex:39-65 的 Lemma prep:contact 对非递减 Lipschitz m with m(0)=0, m(u) >= su, 和 q < t < s，找到 0 < A < B < 1 (B < 2A) 使得 m 在 [0,A]、[A,B]、[B,1] 上分别满足三条线性下界：m(w) >= qw, m(w)-m(A) >= t(w-A), m(w)-m(B) >= q(w-B)。

证明的机制（04_preparation.tex:49-65）：设 g(u) = m(u)-qu, F(u) = min_{u<=v<=1}g(v)。F 非递减 Lipschitz，F(0)=0, F(1) >= s-q > t-q。取 F 的可微点 A 使 F'(A) > t-q。在 A 处 F(A)=g(A)（否则 F 局部常数）。取接触点 B > A 使 F(w)-F(A) >= (t-q)(w-A) on [A,B]。

[推测] 为什么要三条，并非两条？外层两段用 q-指数（available 假设），中间段用 t-指数（比 q 强，来自 Frostman 的 ball bound t < s 在 block 内的局部表现）。三段 telescope 后的总 cap 指数恰好是 q + c_1*(B-A)/4 > q，实现一尺度改进。

04_preparation.tex:73-276 的 Lemma prep:one-scale 是三分段论证的实际执行。对 source class（正则化后的单个 m）：

外段 [0,A] 和 [B,1]（04_preparation.tex:135-165）：用 profile comparisons 给 rho_Q(B(z,CR^{-w})) <= R^{-q(w-u)+o(1)}。对固定 witness z 积分 pins on G^z，用 cap bound 得 local mean estimate R^{-q(v-u)+o(1)}。Markov 删去超出部分代价 R^{-e'+o(1)}。

中段 [A,B]（04_preparation.tex:167-231）：scale 到 bounded size 后条件 law 有 t-ball bound。用 Corollary ang:bad-directions（角增益的 contrapositive）得 common Borel bad direction set B_Q，其反向 law 质量 <= D^{c_1}。删 bad directions 后对每个 remaining pin：good witness gives robust tube cover at center direction w_{x,Q}。Grid perpendicular projection at scale R^{-B}：heavy cells (mass > D^{q+c_1/2}) 至多 C*D^{-q-c_1/2} 个，对应 tube cover。

endpoint density pruning（04_preparation.tex:249-257）：用 Lemma reg:pruning-multiplication 把三个 local factors telescope，density threshold R^{-e''}。

总 gain：f_0*f_1*f_2 = R^{-qA+e'} * R^{-(q+c_1/2)(B-A)} * R^{-q(1-B)+e'} = R^{-q-(c_1/2)(B-A)+2e'}。选 e',e'' 使 2e'+3e'' < c_1(B-A)/4 则总 cap 指数 < q 有严格改进。

## 22 经典距离阈值引理（Falconer 1985）

04_preparation.tex:318-377 的 Lemma prep:classical-plane 是 exceptional case 的处理。它说：若 rho 在 R^n 有 s-ball bound 且 s > (n+1)/2，则距离集有正 Lebesgue 测度。

证明用的是 Mattila 的 spherical average criterion：取分离的 rho_1, rho_2 的 normalized restrictions，distance pushforward tau 的 Fourier transform 的 leading term（stationary phase on sphere）是
```
 \widehat\tau(r) \sim r^a \int_{S^{n-1}} \psi(w)\hat\rho_1(rw)\overline{\hat\rho_2(rw)}\,d\sigma(w)
```
其中 a = (n-1)/2。Cauchy-Schwarz + 球面 average 估计 + annulus 估计给
```
 \int_{r \sim R} |\hat\tau(r)|^2 dr \lesssim R^{(n+1)/2-s} + R^{-1}
```
当 s > (n+1)/2 时 dyadic sum 收敛，Plancherel 给 L^2 density for tau。

[推测] 这个 classical argument 之所以只在 s > (n+1)/2 时工作，是因为球面 kernel 的 Fourier decay 是 |xi|^{-(n-1)/2}，平方后与 ball bound 的交叉项给出 (n+1)/2 这个阈值。Falconer 猜想需要的是 s > n/2 的结论，差距恰好是 1/2。这正是角增益和薄管升级要填补的缺口。

在本文的框架中，这个引理的作用是处理 odd-dimensional exceptional case（04_preparation.tex:770-778 的 proof of prep:starting-pairs）：如果原始 Frostman measure 在某个 k-plane 上有正质量，则 restricted 到该 k-plane 的 measure 有 s > k-1/2 >= (k+1)/2（k>=2），在 k-plane 内部应用 classical argument 即得结论。

## 23 角态 graph 估计：分离与非分离形式

论文中 graph 估计（sections/07_graph.tex，本次取证未完整读取）是递归归约中 Direct 步骤和 High 步骤的引擎。让我根据 08_recursion.tex 中的引用重建其功能。

08_recursion.tex:388-405 的 High 步骤引用 "Corollary graph:separated-form with g=a"。08_recursion.tex:433 的 Direct 步骤引用 "Proposition graph:estimate"。两者共同点是：给定一个 general angular energy H^{X,Y}(a,v)，graph 估计利用 descriptor list 中某个 parallel test [g,p]（anchor p，parallel to current start a）来推进到 depth-p cells。

从 08_recursion.tex:521-588 的 far-step normalization 中可以看到 graph 估计的输出形式：它把 energy 分解为 depth-b cells 上的 positive distance counts，代价由 stationary gains 2^{-(d-1)(v-b)} 和 collision normalization 决定。

[推测] graph 估计的核心机制是把球面上的 inner product U_X*conj(V_Y) 的绝对值平方（即 H_F）展开为一个 graph：节点是 depth-p cells (P,Q)，边是 incidence（由 parallel test 的 tube condition 决定）。独立角的 Cauchy-Schwarz 把 graph 上的能量 bound 为 max positive count。

## 24 递归归约中 terminal 估计与误差预算

08_recursion.tex:591-600 的 Stopping 段给出 terminal state 的 bound。Terminal 的定义是当前区间宽度 <= 100*q_0 = 100*ceiling(kappa*N)。

positive state terminal：D_i(a,t) <= 2^{t-a}*R^{C_d*sigma}（08_recursion.tex:596），因为 t-a <= 100*q_0 <= 100*(kappa*N+1) 所以 2^{t-a} <= R^{100*kappa+o(1)}。

angular state terminal：H_i^B(a,v) <= 2^{d(v-a)}*R^{C_d*sigma}（08_recursion.tex:595），同理 v-a <= 100*q_0 给 2^{d*100*q_0} = R^{100*d*kappa+o(1)}。

合并为 08_recursion.tex:259 的 R^{C_d*(kappa+sigma)+o(1)}。

误差预算（09_ledger.tex:262-274）：target accuracy T > C_d*(1/kappa+1/sigma)+10d+10。每个 ancestor main factor <= R^{C_d+o(1)}。分支步数 <= 20/kappa+1/sigma。所以 propagated errors 总和 <= (20/kappa+1/sigma)*R^{-T+C_d*(1/kappa+1/sigma)} = R^{-T+C_d*20/kappa+...}，只要 T 足够大就被 R^{o(1)} 吸收。

## 25 Loomis-Whitney 熵证明的细节

03_angular_gain.tex:439-472 的 Lemma ang:loomis-whitney 在证明末尾（第 464-471 行）用 entropy chain rule 给出 discrete Loomis-Whitney 的另一种证法。

离散 LW 不等式（原文引用 LoomisWhitney1949）：对 S subset Z^m，|S|^{m-1} <= prod_i |pr_{\hat i} S|，其中 pr_{\hat i} 是去掉第 i 个坐标的投影。

熵证法：令 X uniform on S。H(X_{\hat i}) >= sum_{j!=i} H(X_j | X_1,...,X_{j-1})（chain rule，去掉第 i 个坐标后剩余 m-1 个条件的 entropy 之和不超过联合 entropy，而联合 entropy 就是 log|S|）。对 i 求和：sum_i H(X_{\hat i}) >= (m-1) * H(X) = (m-1)*log|S|。左边 <= sum_i log|pr_{\hat i}S|。所以 (m-1)*log|S| <= sum_i log|pr_{\hat i}S|，即 |S|^{m-1} <= prod_i |pr_{\hat i}S|。

在本文的 application（m=3）中：S 是 L^{-1}A 中的 grid cubes，L 是 direction matrix（columns v_1,v_2,v_3）。|det L| >= Delta 给 ||L^{-1}|| <= C*Delta^{-1}。每个 tube parallel to v_i 变成 coordinate-axis-parallel tube of width C_{m,C}*delta*Delta^{-1}。投影 pr_{\hat i}S 的基数 <= C_{m,C}*Delta^{-(m-1)}*M_i。所以 |S| <= prod_i (C*Delta^{-(m-1)}*M_i)^{1/(m-1)} = C^m*Delta^{-m}*prod_i M_i^{1/(m-1)}。

## 26 切片选取中可测性问题的处理

03_angular_gain.tex:303-333 处理了一个技术核心：如何可测地选择 tube covers。

问题：假设每个方向 fiber E_w 被至多 delta^{-q-epsilon} 管覆盖，但这些覆盖没有先验的可测参数化。

解法（03_angular_gain.tex:305-333）：
(1) 取固定 spatial delta-grid（有界区域内）。对每根管的 axis 取一个点，round 到 grid。保持 direction w 不变。这使 width 至多放大 C_n*delta。
(2) 候选覆盖 = grid anchors 的有限列表（长度 <= floor(M_delta)）。这是有限集。
(3) 对每个候选 J，函数 w -> mu(E_w \ union_{a in J} T(w,a)) 是 measurable（Fubini）。
(4) 选第一个使其为零的候选。Coverage up to mu-null set 足够（每个 point slice mu_{V,z} 绝对连续于 mu）。
(5) 对 completed sigma-algebra 中可测的关系，先取 Borel subset 模 product-null 一致，再 discard fiber 差异为正的 nu-null directions。

这个处理在整个证明中出现了两次（角增益切片和 profile tests 的 mask 构造），[推测] 是形式化时最容易出错的环节之一，因为它涉及 axiom of choice 的可测版本。

## 27 粗滤网的初始尺度处理与 uniform vanishing

04_preparation.tex:688-706 处理初始尺度 j_0 <= j <= 4*j_0 的合并损失。

这些尺度的 net 有至多 C_b*2^{4*C_0*b*j_0} 个 members（每个 j 有 O(r^{-C_0*b}) = O(2^{C_0*b*j}) 个，从 j_0 到 4*j_0 求和）。全部放大到宽度 C*2^{-j_0}，用 intersection 论证得 exceptional first-endpoint mass <= C_b*2^{-(a/2-8*C_0*b)*j_0}。

关键引理：uniform vanishing（04_preparation.tex:699-702, prep:uniform-vanishing）：
```
 \sup_H\rho(H_\varepsilon)\longrightarrow0
       \qquad(\varepsilon\downarrow0).
```
这由零 hyperplane 质量 + 紧参数空间的 convergent subsequence 论证得。[推测] 这是整个 coarse filter 构造中唯一用到测度的 topological regularity（，并非 Fourier 或 incidence）的地方。

## 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| S | d/2 | 01_conventions.tex:40 | 全篇递归归一化与 profile 下界 | 递归 R^{-2(A_b-A_a)} 恒等式断裂 |
| k | (d+1)/2（奇数维）或 d/2（偶数维的 h） | 01_conventions.tex:41 | 角增益的指数区间 k-1<=q<=k-1/2<t<k | q=t 时 Furstenberg 不适用 |
| q | k-1 到 k-1/2 | 03_angular_gain.tex:24 | ang:linear-gain 的方向 ball 指数 | b=q-h 出 (0,1/2] 则 planar theorem 失效 |
| t | k-1/2 到 k（严格） | 03_angular_gain.tex:24 | ang:linear-gain 的点 ball 指数 | f=t-h 出 (1/2,1) 则 b<f 失败 |
| h（非端点） | k-1 | 03_angular_gain.tex:53 | 切片 codimension | h>=q 时 b<=0 出界 |
| h（端点） | k-2 | 03_angular_gain.tex:59 | 端点切片的三维留下空间 | h=k-1 时 b=0 planar 不可用 |
| ell | k-2 到 (k-1)^2/k 之间 | 03_angular_gain.tex:480-481 | ang:weak-radial 的 cap 指数 | ell 超上界则 J blocks telescope 给不出正 gain |
| zeta | omega*b（04_preparation.tex:728） | 04_preparation.tex:728 | prep:thin-upgrade 的 plate bound | zeta=0 时 prep:one-scale 的 bad-direction 无法应用 |
| a | s-(k-1)>1/2 | 04_preparation.tex:601 | coarse filter 的 plate 衰减指数 | a<=1/2 时 net 大小估计给不收敛 |
| b（重板） | 8*C_0*b<a/4 且 k*L*b<1/2 | 04_preparation.tex:708 | coarse filter 的删除代价 | b 太大则 limiting mass 为零 |
| L | >2/a | 04_preparation.tex:620 | simplex 体积下界的分离指数 | L<=2/a 时 tuple admissible 测度为零 |
| C_0 | 100(d+1) | 08_recursion.tex:35 | positive state 的 distance tolerance | 太小时 suffix Taylor 误差吸收不了 |
| K_d | 1000(d+1) 到 4000(d+1) 的 2 的幂 | 06_oscillatory.tex:20-21 | separated cell 定义 | 太小则 cone 张角太宽，psi 不闭合 |
| J_0 | ceiling(100(1/kappa+1/sigma)+100) | 09_ledger.tex:143 | 平滑指数的上界 | 不够大则某 branch 的 index 溢出 |
| kappa | <<_d beta/d | 05_profiles_tests.tex:26 | block 宽度 q_0=ceiling(kappa*N) | 太大则 terminal bound 吃掉 beta saving |
| sigma | <<_{d,beta,kappa} kappa | 05_profiles_tests.tex:27 | regularization loss 与角态 slack | 太大则 profile 下界不严格 |
| beta | <min(chi/10,1/1/10) | 05_profiles_tests.tex:25 | 入口势与 cost 的 balance | 太大则 entry potential 不够，递归不闭合 |
| chi | >0（Frostman gap S+chi 的超出量） | 04_preparation.tex:382-384 | profile 下界 A_n >= chi*n/N | chi=0 则 A 可以非正，无势可付 |
| omega | 4d*omega<beta/8 | 10_assembly.tex:389 | coarse filter 的 cell count R^{2d*omega*N} | 太大则 shell 组装的 partition 因子 R^{4d*omega} 吃掉 decay |
| q_0 | ceiling(kappa*N) | 08_recursion.tex:192 | terminal 宽度阈值 100*q_0 | q_0/N 不趋于 kappa 则 profile Lipschitz 误差控制失效 |
| C_d(sigma) | 全篇通用 dimensional loss | 05_profiles_tests.tex:35-36 | 每个 ball bound / mass 比较的 slack | 去掉则正则化类之间无法统一比较 |
| epsilon（角增益） | 正、依赖 k,q,t,zeta,C | 03_angular_gain.tex:27 | ang:linear-gain 的 ball loss 容许 | 零 loss 则紧集论证不闭合（需 sequential uniformity） |
| c（角增益） | 正、输出指数 | 03_angular_gain.tex:41 | incidence 上界 delta^c | 太大则 bad-direction corollary 无内容 |
| R | 2^N | 01_conventions.tex:40 | 全篇尺度参数 | 非 dyadic 则 grid/annulus 对齐需额外常数 |
| C_rad | 足够大的固定宽度常数 | 04_preparation.tex:128-129 | one-scale 的 local radial fiber 定义 | 太小则 tube cover 不 capture 所有方向扰动 |
| e' | 外段 Markov loss | 04_preparation.tex:159 | one-scale 三分段删除 | 太大则总 gain c_1(B-A)/4 被吃掉 |
| e'' | density pruning loss | 04_preparation.tex:254 | one-scale 的 telescoping density | 太大则 endpoint prune 不给出正 gain |
| e_1 | 薄管升级的 M-range 参数 | 04_preparation.tex:296 | thin-upgrade 的 intersection 范围 | e_1 太大则 combined deletion 不是 power-small |
| L_0 | max(L, ceiling(10*sigma*N)) | 08_recursion.tex:180 | angular split depth h=v-2L_0 | L_0 不取 max 则短 descriptor 时 h 无意义 |

依赖链散文：整条参数链从 chi（Frostman gap）出发：chi 决定 beta（beta < chi/10），beta 决定 kappa（kappa << beta/d），kappa 决定 sigma（sigma << kappa），sigma 决定 omega（4d*omega < beta/8）和 J_0（J_0 是 1/kappa+1/sigma 的函数）。这些参数确定后，角增益定理中的 epsilon 和 c 被固定，进而 c_1 固定薄管升级的 gain rate。coarse filter 的 zeta = omega*b 依赖于 omega 和 b；b 受限于 a = s-(k-1)，而 s 受限于 S+chi。递归的 terminal 界 R^{C_d(kappa+sigma)} 依赖于 kappa 和 sigma 的乘积是否够小以让 beta - C_d(kappa+sigma/kappa) - 4d*omega > 0。这个不等式的 chain 是：sigma/kappa << 1（因 sigma << kappa），kappa << beta/d（因 kappa 的选择），4d*omega < beta/8（因 omega 的选择），所以 C_d*sigma/kappa + C_d*kappa + 4d*omega < beta/2 for sufficiently small choices，留下严格负的 shell 指数 -beta/2。

## 28 Suffix 归约的 Taylor 展开与 witness 论证

08_recursion.tex:267-331 详细给出了 suffix 归约的执行。设 theta = theta_i^{X,Y}(a,t)，要证 D_i(a,t) <= R^{cost+transition} * D_{i+1}(a,p) + R^{-T}。

步骤 1（Taylor 线性化，08_recursion.tex:268-281）：保留 depth-p subcells (P,Q) 若 P x Q 与 parent pair set 有交。取 witness pair (c_P', c_Q') 在交中，设 e_0 = e(c_P', c_Q') = (c_P'-c_Q')/D(c_P',c_Q')。Hessian bound：nabla^2 D <= C*2^a（因为 separation 给 D 约 2^{-a}）。Taylor：
```
 D(x,y)=e_0\cdot(x-y)+O_d(2^{a-2p})
       =e_0\cdot(x-y)+O_d(2^{-t})
```
最后等号用了 suffix 条件 2p > a+t，即 a-2p < -t。

步骤 2（witness angle 扰动）：witness angle e(x,y) 对 (x,y) in P x Q 偏离 e_0 约 O_d(2^{a-p})。对 y,y' in Q 之间，两种方向的差异给投影 y-y' 的变化 O_d(2^{a-2p}) = O_d(2^{-t})（由 suffix 条件）。

步骤 3（投影测试 transfer）：witness (P,Q) 满足 parent 的 projection test [p,t]，该 test 对 full conditional rho|_Q/rho(Q)  formulated。其宽度 W_i(t) absorbs fixed multiples of 2^{-t}。由 test:projection-threshold（05_profiles_tests.tex:146-150）得 self-collision mass B 的界：
```
 B=2^{-(t-p)}R^{A_p-\min_{p\le n\le t}A_n+C_d\sigma}
```

步骤 4（按 coarse bin 分组）：保留 cell pairs 按 center-distance 的 width-2^{-p} bins 分组，组 G 的权重 W_G = sum_{(P,Q) in G} rho(P)*rho(Q)。fine distance-bin vector 的 l^2 范数平方 <= C*B*W_G^2（by rec:bins-shift）。

步骤 5（合并到 child positive count）：每个 full pair in retained P x Q 满足 child list M(a,p) at level i+1。理由：descriptors 的 anchors <= p（由 parent list 的定义），nominal lengths <= (p-a)/2（由 parent interval 的 list selection），spatial anchor cells agree，direction change O_d(2^{a-p}) 在 transfer neighborhood 内。所以 sum_G W_G^2 <= 2^{-(p-a)}*M(a)^4*D_{i+1}(a,p)。

步骤 6（总乘积）：parent normalization 2^{t-a}*M(a)^{-4} 乘 B 乘 child count 的 inverse normalization：
```
 2^{t-a}M(a)^{-4} \cdot B \cdot 2^{-(p-a)}M(a)^4
 = 2^{t-p} \cdot 2^{-(t-p)}R^{A_p-\min_{[p,t]}A+C_d\sigma}
 = R^{A_p-\min_{[p,t]}A+C_d\sigma}
```
这是 suffix cost 的确切形式。

## 29 Near 归约的有度数论证

08_recursion.tex:442-465 处理 angular parent 在 h > a 时的 near split。

把 H^{X,Y}(a,v) 的 transforms U_X, V_Y 切为 depth-h cell pieces。osc:H 定义中两个绝对值平方的展开给出 sum over (P,Q),(P',Q')。"near term" 定义为：P 与 P' 的 center 距离 <= 10(d+1)*2^{-h}（in X 的 parent cell），Q 与 Q' 同理（in Y 的 parent cell）。

有度数：在 depth-h 的固定 grid cell 周围，10(d+1)*2^{-h} 距离内只有 C_d 个邻居。所以 graph 中每个 row (P,Q) 只有 C_d 个 columns (P',Q') 满足 near 条件，column degree 同理。

对 row-column product 用 2*abs(uv) <= |u|^2 + |v|^2，积分后得独立角度的平方之和。rows 或 columns 的数量 <= R^{2I(a,h)+C_d*sigma}（由 test:centre-count 的 occupied cell 估计）。四个 transform splitting factors（M(h)/M(a) 的幂）乘 label count 乘 energy prefactor ratio：
```
 2^{d(h-a)}R^{-4I(a,h)}R^{2I(a,h)+C_d\sigma}
 =R^{-2(A_h-A_a)+C_d\sigma}
```
这恰好是 rec:normalization 的 R^{-2(A_b-A_a)} 形式（取 b=h），所以 near 是 zero-cost 归约。

## 30 Far 归约中的二次驻定相与长度分带

08_recursion.tex:468-588 处理 far terms：两个 point displacement 之一 >= C_d*2^{-h}。

固定四点，设位移 Delta_1, Delta_2 的长度 d_1, d_2。d_+ = max, d_- = min。对较大位移的角积分做 full-sphere 驻定相展开：Lambda = r*d_+ >= 2^{v-h} = 2^{2L_0} >= R^{20*sigma}（由 osc:stationary-regime 条件验证）。

若 d_+ > 2*d_-：另一个角积分中 phase derivative 的 modulus >= d_+ - d_- > d_+/2，non-stationary 分部积分给 O(R^{-T})。

若 d_+ 与 d_- 可比：两次驻定相都适用。选整数 n 使 d_+ in (2^{-n-1}, 2^{-n}]，设 b = n + log_2 K_d。两个长度都在 K_d*2^{-b}/4 到 K_d*2^{-b} 之间。这正好把四点放进 depth-b separated geometry（osc:separation 的 K_d/8 到 4K_d 区间在 rescale 后满足）。

两个 leading stationary gains 乘积：2^{-(d-1)(v-b)}（每个 gain 是 Lambda^{-(d-1)/2} 的平方，两个合并为 2^{-(d-1)(v-b)}）。

径向积分后的 kernel bound（rec:far-kernel, 08_recursion.tex:513-516）：
```
 C2^{-(d-1)(v-b)}
       (1+2^v|d_1-d_2|)^{-2}.
```
这由 rec:bins-kernel（08_recursion.tex:131-133）与 positive count 的定义结合得。

Normalization 全链条（08_recursion.tex:577-585）：
```
 2^{d(v-a)}M(a)^{-4}
   2^{-(d-1)(v-b)}
   M(b)^4 2^{-(v-b)}R^{2I(a,b)+C_d\sigma}
 = 2^{d(b-a)}R^{-2I(a,b)+C_d\sigma}
 = R^{-2(A_b-A_a)+C_d\sigma}
```
这给出 far step 是 zero-cost 的。[推测] 之所以 far 能把 (d-1)(v-b) 的 stationary gain "花掉"来买回 2^{v-b} 的 collision normalization（来自 rec:bins-kernel），是因为两者的 ratio 恰好是 2^{d(b-a)} 即 rec:normalization，而 S=d/2 使得 A_b-A_a 成为唯一的 net exponent。

## 31 端点弱径向估计中的 Jensen 与 Gram-Schmidt

03_angular_gain.tex:566-603 是弱径向估计中最密集的代数段。核心 claim（ang:common-k-incidence, 03_angular_gain.tex:569-573）：
```
 \int \rho_Q\Bigl(\bigcap_{i=1}^k B_{x_i}\Bigr)
           \,d\lambda(x_1)\cdots d\lambda(x_k)
      \ge I_Q^k.
```
这是 Jensen：k 个 independent pins，每个的 "troublesome source set" B_{x_i} 的 rho_Q-质量 >= I_Q（因为 I_Q = int rho_Q(B_x) d lambda(x)）。由 concavity of t -> t^k（Jensen on the product measure）得 intersection 的 mass >= I_Q^k。

接下来处理 nearly dependent tuples（03_angular_gain.tex:575-583）：若 abs(det(v(x_1,Q),...,v(x_k,Q))) < R^{-eta}，则 Gram-Schmidt 中某步的距离 < R^{-eta/(k-1)}。对应的 pin 落在通过 z_Q 的仿射 hyperplane 的 C*R^{-eta/(k-1)}-邻域。Plate bound 给 product measure <= C_k*R^{epsilon-eta*zeta/(k-1)}。

选 eta 小（相对于 e'）、c_2 和 epsilon 更小使 R^{epsilon-eta*zeta/(k-1)} = o(R^{-k*c_2})。于是存在一个 tuple（det >= R^{-eta}）其共同 source set 有 conditional mass >= (1/2)R^{-k*c_2}。

下界（ang:conditional-child, 03_angular_gain.tex:588-591）：这个 set 需要至少 c*D*R^{-k*c_2-C_k*tau} 个 2^{-b}-balls。上界（Loomis-Whitney）：至多 C*D*R^{k*eta-e'*k/(k-1)} 个。矛盾条件：k*eta + k*c_2 + C_k*tau < k*e'/(k-1)，即 eta + c_2 + C_k*tau/k < e'/(k-1)。[推测] 选择顺序是 eta -> c_2 -> tau, epsilon。

## 32 最终 Theorem thm:main 的组装逻辑

10_assembly.tex:597-613 的 Proof of Theorem thm:main：

(1) Frostman probability on E with exponent > d/2. 
(2) Odd-dimensional exceptional case: 若 measure charges an affine k-plane，Lemma prep:classical-plane 在 k-plane 内 already gives conclusion.
(3) All other cases: Proposition prep:starting-pairs gives separated probabilities + filters. Then Proposition asm:completion (10_assembly.tex:578-595) gives the conclusion via the monotone-shell lemma.

[推测] 步骤 (2) 的重要性：它把证明分为两条主路。在"generic"（不 charge 任何 plane）的 case 中，可以假设所有 hyperplane 测度为零（04_preparation.tex:316-317），这是 coarse filter 工作的必要前提（prep:coarse-filter 要求 rho 给零 mass 给 every affine hyperplane）。如果没有这个 reduction，重板排除的 net-size 估计就不闭合。

步骤 (3) 中 asm:completion 的实际链：prep:starting-pairs（给 mu_1, mu_2, Gamma_N, cap bounds）-> regularization（分 class，给 profiles m_j）-> test:smooth-masks（构造 angular masks）-> osc:shell-conversion（Fourier to angular energy）-> graph:estimate + ledger:bound（递归 bound angular energy）-> asm:retained-measures（TV approximation）-> asm:monotone-shell（absolute continuity）-> 结论。

## 33 角增益对偶形式与 bad-directions corollary

03_angular_gain.tex:872-919 的 Corollary ang:bad-directions 是 Theorem ang:linear-gain 的对偶形式，直接从主定理推出。它的用法在 one-scale improvement 中（04_preparation.tex:174-176）。

corollary 的陈述：给定 point probability mu 满足 t-ball bound with loss delta^{-epsilon_1}，定义 bad direction set B_delta（存在 delta^{-q-c_1} 管 capture mu-mass >= delta^{c_1}）。则存在 Borel superset B_delta^+ 使得任何 q-ball-bounded 方向 law nu 满足 nu(B_delta^+) <= delta^{c_1}。

证明（03_angular_gain.tex:894-919）：构造 B_delta^+ 为所有满足 max_J mu(union_{a in J} T_{C'}(w,a)) >= delta^{c_1} 的 w（J runs over grid anchor lists of size <= floor(delta^{-q-c_1})）。对 w in B_delta^+，选 first attaining J，得 measurable incidence with mass >= delta^{c_1}*nu(B_delta^+)，using <= delta^{-q-epsilon} tubes per fiber。Theorem bounds this by delta^c，hence nu(B_delta^+) <= delta^{c-c_1} <= delta^{c_1}。

[推测] 为什么构造 B_delta^+ 而不直接用 B_delta？因为 B_delta 的定义涉及"存在一组管"，这不一定可测（uncountable supremum over tube configurations）。B_delta^+ 用 finite grid + finite list 把存在量词化为有限 max，从而保证 Borel 可测性。这正是第 26 节讨论的可测性技术的再次应用。

## 34 投影测试与平行测试的 Fourier 来源

为什么需要两种测试类型（parallel 和 projection）？让我从 Fourier 端回溯。

在距离测度 tau = D_#(mu x mu) 的 Fourier transform 中，径向积分产生球面平均：hat_tau(r) 约等于 int_{S^{d-1}} hat_mu(rw)*conj(hat_mu(rw)) d sigma(w) 的某种 weighted version。这个球面积分被距离 shell [2^{v-1}, 2^{v+1}] 上的 L^2 norm 控制。

当做 shell 分解后，每个 shell 的贡献是一个 oscillatory integral over pairs (x,y) with D(x,y) in a specific range。驻定相给出的 leading term 涉及 "e(x,y)-direction"（即 (x-y)/abs(x-y)）上的 angular factor。

对于 positive count D_i(a,t)：它计数 pairs with nearly equal distances。把 D_i 的 Fourier representation 分成 low/high shells（suffix 条件 2p>a+t 或 prefix 分壳），low shells 给 shorter positive states，high shells 需要进入 angular energy。

关键观察（00_introduction.tex:164-169）：A cap test controls parallel tubes, whereas a scalar projection test involves belts on the sphere. The required belt estimate follows from a Fourier calculation: the annular power is B^{d-2S}, which is exactly one at S=d/2.

[推测] 这里 d-2S=0 是 critical 的标志。在 S=d/2 时球面 average 的 annular power 恰好退化（既不给 decay 也不给 growth），所以必须用 combinatorial/incidence 信息（即角测试）来补 gain。如果 S<d/2（高于临界），annular power d-2S>0 给直接 decay，无需递归。如果 S>d/2（低于临界），annular power 负，距离测度可能奇异。

平行测试 [g,p]：管条件是"occupied depth-p centers in a tube about direction w 的数量 <= R^{k(g,p)+C_d*sigma}"。这直接对应 ball bound 在 tube 内的计数，用 test:centre-count 验证（05_profiles_tests.tex:68-70）：一个 radius-C*2^{-g} ball 含至多 C'*R^{I(g,p)+C_d*sigma} 个 occupied depth-p centers。所以若 w 方向的 tube 太宽（太多 centers），则 k(g,p) 必须大，意味着 A 在 [g,p] 上 drop 很多。

投影测试 [p,t]：条件是"conditional projected measure 的 self-collision mass <= 2^{-(t-p)}*R^{A_p-min_{[p,t]}A+C_d*sigma}"。这对应的是把 rho_P 投影到 w 方向后，其 pushforward 的 delta(t)-self-collision 的 bins 估计。2^{-(t-p)} 是"trivial"（均匀分布时的自碰撞率），额外因子 R^{A_p-min A} 允许因 profile drop 带来的 deviation。

## 35 角态的 descriptor list 继承与 deduplication

08_recursion.tex:85-102 处理了 angular state 中 descriptor 的继承逻辑。当一个 angular state 有 base B=[a_0,t_0] 和 current start a 时，remaining list 是 M_{>a}(B)（anchor deeper than a 的 descriptors）。

一个 descriptor 的 origin：若 t in M_{>a}(B) 有 anchor p 和 length L，则 origin 是 B 内的一个 interval 包含 [p-L, p+L]，且提供 parallel descriptors [g,p]（p-L <= g < p）。[推测] origin 的概念是为了让 direct 步骤能找到一个合法的 graph step：它需要的 parallel descriptor [g,p]（g=max(a,p-L)）必须存在于某个 origin 中，而 origin 是 base 的子区间。

Deduplication：同一个 descriptor 可以在不同 contexts 中出现（比如同一个 [g,p] 作为两个不同 origin 的 parallel sub-descriptor）。在 state 定义中每个 descriptor 只出现一次（"exactly one occurrence of each descriptor in M_{>a}(B)"），但一个 descriptor 可能有多个合法的 origins。[推测] 这避免了递归中因同一测试被多次消费而导致的虚假 cost。

08_recursion.tex:96-102 的 "removal operation after osc:angular-cs deletes its factors anchored at depths at most a' at bounded cost"：从 positive energy 中移除 reached anchors（depth <= current start a'）时，因为对应的 mask factor 在 depth-a' cells 上是空间常数（osc:symbol-bounds 的最后一段），其绝对值的 bound 是 bounded，乘入 energy 只改常数不改 exponent。

## 36 全局球面算子的代数性质与 D_*=0 情形

06_oscillatory.tex:231-239 定义的 L_j 算子序列：L_0 = c_{n_*}*Id，L_j = c_{n_*}/((2i)^j*j!) * prod_{q=0}^{j-1}(Delta_S + q(q+1) - n_*(n_*-2)/4)。

[推测] 这里的 q(q+1) - n_*(n_*-2)/4 结构来自 Helmholtz equation 的球极分离：球面上的 radial-angular decomposition 中 angular eigenvalues 是 -l(l+n_*-1)，而 Gaussian phase correction 贡献 +n_*(n_*-2)/4 的 shift（来自 measure factor (1-|u|^2/4)^{(n_*-2)/2} 在 Taylor 展开中的 contribution）。

当 d=2（n_*=1）时球面是 S^1。Delta_{S^1} 的 eigenvalues 是 -m^2（m in Z）。L_j 的 prod_{q=0}^{j-1}(-m^2+q(q+1)-(-1)(-3)/4) = prod(-m^2+q^2+q+3/4)。在 q=0：-m^2+3/4；q=1：-m^2+2+3/4=-m^2+11/4。对 m=0（constant mode）所有因子都 nonzero，L_j 作用在 constants 上不为零。这对 S^1 情形是合法的。

D_*（06_oscillatory.tex:87, osc:derivative-scale）：
```
 D_*=R^\sigma\max(1,2^L R^{-50\sigma}).
```
当 L=0（空 descriptor list）时 D_* = R^sigma，角导数至多 R^{j*sigma}。这意味着没有任何 angular test 的 energy 的 angular derivatives 以 R^sigma 增长，而 Lambda >= R^{c*sigma} 的 stationary regime 仍然适用（只要 sigma 和 c 匹配）。[推测] 空 list 的 angular state 对应"已经所有测试都 reached"的 terminal 情形，此时 graph 估计不适用，递归停止。

## 37 从 available 定义到 thin-upgrade 的闭包论证

04_preparation.tex:25-37 的 Definition prep:availability：exponent q is available for pair family G_N if for every e>0, there exist c_e>0, C_e<inf, Borel B_N subset G_N with (nu x rho)(B_N) <= C_e*2^{-c_e*N}，and both directional measures of G_N\B_N give every cap of radius u in [2^{-N},1] mass at most 2^{e*N}*u^q。

04_preparation.tex:278-311 的 Proposition prep:thin-upgrade 证明：若 k-1 available 则 k-1/2 available。

关键步骤（闭包 under sup）：设 q* = sup of available exponents in [k-1, k-1/2]。若 q* < k-1/2，选 q available with q* - e/2 < q < q*。Then q' > q with q' <= q + c/2（Lemma prep:one-scale 的 gain rate）is also available（by the iteration argument in 04_preparation.tex:291-311）。这与 q* 是 supremum 矛盾。

iteration 的 intersection 论证（04_preparation.tex:296-306）：对 M in [e_1*N, N]，input loss eps（来自 q-availability）at scale 2^{-M} 是 2^{eps*M} <= 2^{eps_0*M}（by choosing eps < e_1*eps_0/2），so prep:one-scale applies at each such M. Intersecting outputs over these M: combined deletion <= C*sum_{M>=e_1*N} 2^{-c*M} = O(2^{-c*e_1*N})。At radii 2^{-M} the output gives cap bound delta^{q+c_1/2}（strictly better than q）。At larger radii, trivial bound mass<=1 suffices if 2^{e*N}u^{q'} >= 1，i.e. u >= 2^{-e*N/(q'-...)}... the choice of e_1 ensures this for large N.

[推测] 这里的"从 q 到 q' 的闭包"之所以需要 intersect over many M，是因为 prep:one-scale 的 gain 只在一个 dyadic scale 处有效；要得到"对所有半径"的 cap bound，需要在所有 relevant scales 同时 work。Intersection 的代价（deletion sum）仍然 power-small 因为 M >= e_1*N 的 geometric sum converges。

## 38 端点 plate 条件在角增益中的角色

03_angular_gain.tex:32-35 的 plate 条件 ang:endpoint-plate：
```
 \nu\{w:\dist(w,H)\le r\}\le\delta^{-\epsilon}r^\zeta
```
对所有 linear hyperplane H 和 delta <= r <= 1。这只在 q=k-1（端点）时需要。

[推测] 为什么 q>k-1 不需要 plate 条件？因为此时 b=q-h > 0（h=k-1），Furstenberg 定理对 b>0 直接适用。端点 b=0 时方向测度退化到更低维，必须保证它不 concentrate on a hyperplane。plate 条件说"方向测度不 concentrate 在超平面的 r-neighborhood 上太快"，指数 zeta > 0 给出了定量版。

在 one-scale improvement 中（04_preparation.tex:80-85），plate bound 以 C*u^zeta 的形式出现，zeta 来自 coarse filter（prep:coarse-filter item 3）。prep:one-scale 的假设（04_preparation.tex:82-85）包含两个条件：cap bound delta^{-eps_0}*u^q 和 plate bound C*u^zeta。后者在 Corollary ang:bad-directions 的应用中作为端点 plate 假设被喂入（04_preparation.tex:174 的 "with a sufficiently large fixed tube-width constant" + zeta 条件隐含在 ang:bad-directions 的 statement 中）。

## 39 递归树的 polynomial 分支数与 o(1) 吸收

08_recursion.tex:198-199（Prop rec:reductions 的陈述）：每个归约产生的 children 数目是 "polynomial in N"。[推测] 这个多项式来自：suffix 的 grid cell 分组（至多 2^{p-a} 个 coarse bins）、high/low 的 shell index 范围（至多 N 个）、near/far 的 depth-h 或 depth-b cell labels（至多 R^{C*I} 个，由 test:centre-count 控制）。

09_ledger.tex:215-220 的 Theorem ledger:bound 证明中："Each transition has at most polynomially many discrete choices in N, and all coefficient sums in the oscillatory estimates are bounded or subpower. Thus the total main term is bounded by R^{o(1)} times the largest terminal branch bound."

这里 R^{o(1)} 吸收的是：(1) polynomial in N 的分支数（= R^{o(1)}，因为 log_2(N)/N -> 0）；(2) 每个 oscillatory coefficient 的绝对和（spatial-separation 的 sum |c_l| <= C_{d,j}，bounded）；(3) descriptor list size 的多项式界（test:descriptor-properties 给 polynomial in N）。

[推测] 如果分支数是 exponential in N（比如每个归约产生 2^{cN} 个 children），则 o(1) 吸收不了，递归 bound 会多出 R^{c}，破坏 terminal estimate 的严格负性。这正是为什么 graph estimate 必须用 Cauchy-Schwarz（产生 max ，并非 sum）以及 spatial separation 必须用绝对收敛的 Fourier series（bounded sum），并非逐点乘积（可能给 exponential）。

## 40 正则化中 depth 间隔与 lambda 的选取

02_regularization.tex:52-57 选取中间深度 0=j_0<j_1<...<j_J=N，间隔 <= lambda*N+1，J <= C/lambda。这里 lambda 是正则化参数（正文中对应 kappa 或 sigma，视应用而定）。

关键：J <= C/lambda 决定了 class 数量 N^{C_n/lambda}（02_regularization.tex:16）。lambda 越小 class 越多，但每个 class 内的 mass comparison 越 uniform（因为 block depth 越大，每 block 内变化越少）。

02_regularization.tex:91-92 定义 profile：m_alpha(j_i/N) = (1/N)*sum_{h<=i} log_2 b_h。这里 b_h 是 depth j_h 的 branching number（power of 2 between 1 and 2^{n*(j_h-j_{h-1})}）。Linear interpolation between selected depths。

slopes of m 在 [0,n] 内：因为 log_2(b_h) <= n*(j_h - j_{h-1})，除以 N 得 slope <= n*(j_h-j_{h-1})/(N*(j_h/N - j_{h-1}/N))... 实际上是 log_2(b_h)/(j_h - j_{h-1}) <= n。这正是 d-Lipschitz condition of A_n 的来源（A_n = m(n/N) - S*n/N，两个 Lipschitz function 之差 Lipschitz with constant d-S + S = d）。

[推测] 正则化丢弃的质量上界是 R^{-lambda+o(1)}（02_regularization.tex:20-22），而 lambda 就是正文中的 sigma。这给 assembly 阶段的 total TV error 提供了 R^{-sigma+o(1)} 的量级。整个证明中 sigma 出现在至少五个地方：regularization loss、conditional ball loss (C_d*sigma)、transition factor (C_d*sigma)、terminal bound (C_d*sigma)、entry cost (C_d*sigma)。sigma 被选为 << kappa << beta，使得所有这些 sigma-losses 加起来不超过 beta/4。

## 41 尝试过的错误路线及失败原因（补充案例）

第 ## 1 节列了四条错误路线。再补两条我在取证中确认论文本身明确排除的路：

(7) 直接用 Fourier restriction 把 shell estimate 与 spherical average 对接。这条路在 01_conventions.tex 的 classical threshold argument（04_preparation.tex:318-377）中已经做到了 s>(d+1)/2 的极限。在 s=d/2 时球面 kernel decay 的平方不够（需要 s>(d+1)/2 而不仅仅是 s>d/2）。[推测] 差距恰好是 1/2，这正是 prep:thin-upgrade 从 k-1 到 k-1/2 的那 half-step。所以 restriction 方法被精确地用到了它的极限处，剩下的缺口由 combinatorial incidence 填补。

(8) 用 product-set 结构。如果 E 有某种 product 结构（比如 E = E_1 x ... x E_m），距离集可以分解。论文明确不假设 product structure（00_introduction.tex:20-21 "imposes no regularity beyond the strict Hausdorff dimension assumption"）。[推测] product 方法在 Falconer lattice examples 处失败：这些 examples 有 product 结构但距离集是 null，说明 product 结构不足以给出正测度（必须有 d/2 的维数 gap）。

## 42 论文结构总览与阅读顺序建议

论文的 11 片 tex 文件构成的依赖链如下：

00_introduction -> 01_conventions（notation）-> 02_regularization（profile machinery）-> 03_angular_gain（incidence）-> 04_preparation（measures construction）-> 05_profiles_tests（masks + descriptors）-> 06_oscillatory（Fourier shell conversion）-> 07_graph（graph estimate）-> 08_recursion（state reductions）-> 09_ledger（potential + main recursive bound）-> 10_assembly（entry + shell decay + monotone limit）。

如果只关心奇数维的核心创新：03_angular_gain + 04_preparation:subsection_1（thin-tube upgrade）。

如果只关心递归闭合：08_recursion + 09_ledger + 10_assembly。

如果只关心最终测度论证：10_assembly:subsection_3（monotone-shell lemma）。

[推测] 07_graph.tex（26,000+ 字节）是递归中最复杂的单片，定义了 graph estimate 的完整 machinery（独立角变量、spatial multipliers、descriptor 继承规则）。我在本次取证中没有完整读取它，但从 08_recursion.tex 中的引用（Proposition graph:estimate, Corollary graph:separated-form）和 10_assembly.tex 中的使用（asm:graph-factor），可以重建它的输入输出接口：输入是 general angular energy with separated cells + a parallel descriptor [g,p]，输出是 R^{-2(A_p-A_g)+k(g,p)+C_d*sigma+o(1)} 乘以 child energies at depth p。

## 43 若干行号核验与指数消费链的逐一定位

为确保台账中"位置(文件:行)"栏的精确性，以下逐条用实测行号核验指数消费链的关键节点：

临界维数 S=d/2 的首次出现：01_conventions.tex:40 逐字为 `The original ambient dimension is always denoted by \(d\), and \(S=d/2\).`。它被消费的环节：(i) 02_regularization.tex 中 profile 下界 log_R K 的抵消（s-ball bound 的 Frostman 维数 s 与 S 的差即 chi）；(ii) 05_profiles_tests.tex:47 定义 A_n = m(n/N)-Sn/N；(iii) 08_recursion.tex:106-110 的归一化恒等式 R^{-2(A_b-A_a)}（precisely uses S=d/2）；(iv) 09_ledger.tex:249 的 terminal Lipschitz 估计。

角度增益幂次 (k-1)^2/k：出现在 03_angular_gain.tex:481 `k-2<\ell<\frac{(k-1)^2}{k}`。消费链：(i) 弱径向估计的单尺度断言最终 cap exponent（03_angular_gain.tex:631-632）；(ii) triple-weight 估计中 (a-2b_0)(ell-h) 正性需要 ell>h=k-2（03_angular_gain.tex:796-798）；(iii) 一尺度改进 Lemma prep:one-scale 中 bad-directions corollary 的端点条件（04_preparation.tex:174）。

profiles 分割参数 sigma：定义于 05_profiles_tests.tex:27 `0<\sigma\ll_{d,\beta,\kappa}\kappa`。消费链：(i) regularization lambda=sigma 决定丢弃质量 R^{-sigma+o(1)}（02_regularization.tex:22）；(ii) angular gain 中 W_i(n) 的 R^{500*sigma} 宽度放大（05_profiles_tests.tex:124）；(iii) 角态 split depth 的 ceiling(10*sigma*N)（08_recursion.tex:180）；(iv) D_* 的 max(1,2^L*R^{-50*sigma})（06_oscillatory.tex:87）；(v) entry-potential 中的 C_d*sigma 修正（10_assembly.tex:79）。

递归轮数 20/kappa+1/sigma：出自 09_ledger.tex:135-136。消费链：(i) J_0 = ceiling(100(1/kappa+1/sigma)+100)（09_ledger.tex:143）；(ii) error budget T > C_d*(1/kappa+1/sigma)+10d+10（09_ledger.tex:270）；(iii) non-low transition count 决定 R^{C_d*sigma/kappa} 的 total loss（09_ledger.tex:257-258）；(iv) entry interval [c,N] nonterminality 需要 3N/4 > 100*q_0 = 100*kappa*N，即 kappa < 3/400（10_assembly.tex:107）。

## 台账续表：递归与装配阶段的常数

（下表汇总在 ## 17 至 ## 43 节中首次出现的常数及其消费链；主体条目见前文第 536 行起的台账节，两表合并阅读才完整。）

| 记号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| C_n | 维数 n 的绝对常数 | 02_regularization.tex:16 | 正则化 class 数 N^{C_n/lambda} 与 mass comparison R^{C_n*lambda} | 变大则 class 数超 polynomial 界，shell assembly 的 partition 因子不可控 |
| b_i | 2 的幂、1 到 2^{n*(j_i-j_{i-1})} | 02_regularization.tex:70-82 | profile 定义 m(j_i/N)=(1/N)*sum log_2 b_h | 非 power-of-2 则 occupied-cell mass 比较的 2^{CJ} 因子不对齐 |
| C_0（角增益中的 net-size） | (k+1)(1+kL) 加 fixed | 04_preparation.tex:637 | 重板 net 的覆盖数 r^{-C_0*b} | 太大则 initial scale loss 不趋于零 |
| D（block mass ratio） | R^{m(b/N)-m(a/N)} | 03_angular_gain.tex:525 | conditional child mass bound 的归一化 | D<=1 时 F>=1 无 troublesome pairs，gain 消失 |
| e（角态 stationary-regime） | 任意 fixed positive | 03_angular_gain.tex:719 | 弱径向估计的输出 loss delta^{-e} | e 太大则 triple-incidence 中 a-2b_0 正性破坏 |
| b_0（端点 close-pair 阈值） | delta^{b_0}，小正数 | 03_angular_gain.tex:725 | 删除 close pairs + triple-weight 的 3hb_0 loss | b_0 太大则 exponent (a-2b_0)(ell-h)-e-3hb_0 不正 |
| theta（pair transfer exponent） | 0 到 1 之间自由 | 04_preparation.tex:733-741 | exceptional-pair-transfer 的界 | 需 c_e-theta*h>0，theta 太大则 transfer 不 power-small |
| e_1（thin-upgrade 的 M 下界比例） | 正、2e_1*q'<e | 04_preparation.tex:295 | one-scale 在所有 M>=e_1*N 的 intersection | 太大则 combined deletion sum 发散 |
| C_rad | 足够大 fixed width | 04_preparation.tex:128-129 | one-scale 中 local radial fiber 的 cap radius | 太小则 tube cover 不 capture 方向扰动 |
| e''（density prune loss） | 正、2e'+3e''<c_1(B-A)/4 | 04_preparation.tex:260 | one-scale 的 endpoint pruning 总代价 | 太大则 cap exponent 不减 |
| K（slice truncation） | subpower、K->inf | 03_angular_gain.tex:374-376 | 切片选取的三步截断阈值 | K 增长不够快则 incidence 损失不趋于零 |
| J（弱径向 block 数） | 大 fixed integer | 03_angular_gain.tex:528 | 分 block 后的 telescope 与 ignored growth 2k/J | J 不够大则 2k/J 吃掉 (k-1)^2/k - ell_1 的 gap |
| e'（troublesome fraction） | 小 fixed positive | 03_angular_gain.tex:550 | local-fraction F=R^{e'}*D^{-(k-1)/k} | e' 太大则 F>=1 无矛盾 |
| c_2（Jensen 假设阈值） | 小正数、k*c_2<C_k*tau 约束 | 03_angular_gain.tex:566-603 | common-k-incidence 的下界与 Loomis-Whitney 的对比 | 太大则 k*eta+k*c_2+C_k*tau >= ke'/(k-1) 不矛盾 |
| L_j（球面微分算子阶 j） | order 2j, polynomial in Delta_S | 06_oscillatory.tex:235-239 | stationary expansion 的各阶系数 | 阶数不够则 error bound 不任意小 |
| B_j（逆展开算子） | order 2j, recursive def | 06_oscillatory.tex:271-274 | inverse formula 的 cancellation | B_j 不存在则不能把 b(e) 用全 sphere integral 表达 |
| Psi（shell frequency cutoff） | C_c^infty((1/4,4)), >=1 on [1/2,2] | 06_oscillatory.tex:128 | 角能量 H 的 radial measure | support 不覆盖 [1/2,2] 则 lower bound 失效 |
| psi（方向 cone cutoff） | 0 to 1, equals 1 near e | 06_oscillatory.tex:29-32 | shared-angle H_F 定义 | 不 vanishing near -e 则 stationary phase 混入两个点 |
| T（target accuracy） | >C_d(1/kappa+1/sigma)+10d+10 | 09_ledger.tex:269-270 | 每步 oscillatory 误差 | 太小则 R^{-T} 不 negligible 于 terminal bound |
| eta（TV decay rate） | min(c_*,sigma)/2 | 10_assembly.tex:240 | monotone-shell criterion 第一 summability | 零则 $\lVert \alpha_N-\tau_N\rVert_{\mathrm{TV}}$ 不趋于零 |
| gamma（shell decay rate） | 正、来自 -beta/2 | 10_assembly.tex:443 | monotone-shell criterion 第二 summability | 零则 Fourier 级数不收敛于 L^2 |
| c_1（角增益 corollary） | 正、min(epsilon/2,c/3) | 03_angular_gain.tex:898 | ang:bad-directions 的 tube count 与 threshold | 太大则 incidence mass 不 delta^c 控制 |
| C_{m,C}（LW 常数） | 依赖 m 和 tube width C | 03_angular_gain.tex:444 | 端点 triple 的 Loomis-Whitney covering bound | 去掉 Delta^{-m} 则 determinant 损失不出现 |
| C_{n,j}（Haar 常数） | 依赖 n 和 j | 03_angular_gain.tex:219 | ang:haar-multiple 的上界 | 不存在则多向量 band probability 无界 |
| c_1(B-A)/4（one-scale gain） | 正、由 2e'+3e'' 约束 | 04_preparation.tex:262 | prep:one-scale 的最终 cap 指数增益 | 非正则一尺度不改进，thin-upgrade 不闭合 |
| D^{q+c_1/2}（中段 heavy-cell 阈值） | R^{(q+c_1/2)(B-A)} | 04_preparation.tex:213 | one-scale 中段 tube-count 与 H_{x,Q} 定义 | 太大则 D^{-q-c_1/2} 管不够 capture |
| M_delta | delta^{-q-o(1)}（tube count per fiber） | 03_angular_gain.tex:306 | slice-selection 的可测选择候选数 | 太大则候选列表枚举不可数 |
| sup_V mass bound | subpower（K^3 a priori） | 03_angular_gain.tex:299-300 | 切片后方向 measure 的一致上界 | 不存在则 triple-incidence 的 Holder 不给出下界 |

上表的依赖链：K_d 决定 separated geometry 的 cone aperture，psi 在此 cone 上为 1；Psi 决定 shell frequency support，两者配合使 osc:shell-conversion 的 stationary regime 成立。sigma 同时出现在 D_*（控制 angular derivative bound）和 split depth L_0（控制 far/near 分界）中，若 sigma 改变则 L_0 和 D_* 联动变化，far-step 的 Lambda >= R^{c*sigma} 条件可能出界。c_2 和 e' 的关系（k*eta+k*c_2+C_k*tau < ke'/(k-1)）是弱径向估计能否给出正 gain 的唯一自由参数约束；它通过 ell < (k-1)^2/k 传导到端点角增益，再通过 ang:bad-directions 的 c_1 传导到 prep:one-scale 的 gain rate，最终传导到 prep:thin-upgrade 从 k-1 到 k-1/2 的步长，再传导到 starting-pairs 的 cap exponent S，再传导到递归的 $A_n$ 定义，闭合整个链条。

## 记号约定与基线核对

落盘前先把本节的记号钉死，后面七节全部沿用。距离集的维数指数写作 $\dim\{x-y:\;x,y\in E\}\ge\min(2s,d)-\eta_d(s)$，并规定 $\eta_d(s)\ge0$，
其中 $s=\dim E$，$d$ 是环境维数，$\eta_d(s)$ 是我要求自己去逼近的亏损项。Falconer 猜想的陈述就是 $\eta_d(s)\le d-(d-s)=s$ 型约束在 $2s>d$ 时给出 $\dim=s$（等价于 $2s>d\Rightarrow$ 距离集有正 Lebesgue 测度）。装配阶段的尺度记号按论文口径固定：大尺度参数 $R=2^{N}$，小尺度 $\delta$，源维数 $s$ 一律指 Hausdorff 维数 $\dim_H$，临界值 $S=d/2$（00_introduction.tex:139），profile 超额量 $A_n=m(n/N)-Sn/N$（00_introduction.tex:176），损失参数按 10_assembly.tex:258-259 的次序 $\beta,\kappa,\sigma,\omega$，单级净增益写 $\varepsilon$，振荡误差的精度写 $T$。

## 探针小节

本小节用于验证落盘。临界维数 $S=d/2$ 处的核心恒等式是 $2^{d(b-a)}R^{-2I(a,b)}=R^{-2(A_b-A_a)}$（08_recursion.tex:106-108），其中 $I(a,b)=m(b/N)-m(a/N)$，$A_b-A_a=(b-a)/N$ 的偏差被 $S$ 精确抵消。

计数基线：改造前全文的美元定界与圆括号定界合计只有 4 处，这是台账之外唯一的结构性缺口；从这里开始我新增的每一条公式只用美元行内定界，或者用左右配对的圆括号定界，其它不计入统计的定界形式一律不出现，既有行保持原样。

\(\eta_d(s)\) 的符号选定后，"角增益"就写成单级映射 \(T_d:\eta\mapsto \eta'\)，递归装配即 \(T_d^{n}\) 的不动点问题。

## 各维门槛的数值登记与奇偶分裂

先把结论写成数字。论文摘要与 Theorem thm:main（00_introduction.tex:11-17，paper.tex:7-10）给的断言是：对每个整数 \(d\ge2\)，紧集 \(E\subset\R^d\) 满足 \(\dim_HE>d/2\) 就有 \(\cL^1(\Delta(E))>0\)，其中 \(\Delta(E)=\{|x-y|:x,y\in E\}\)（00_introduction.tex:3-6）。我把临界指数一律记作 \(S=d/2\)，于是逐维门槛是 \(d=2\Rightarrow S=1\)，\(d=3\Rightarrow S=3/2\)，\(d=4\Rightarrow S=2\)，\(d=5\Rightarrow S=5/2\)，\(d=6\Rightarrow S=3\)，一般 \(S=d/2\)。

再登记历史门槛与差值，全部按 Introduction 的原文（00_introduction.tex:28-72）逐项算：

Falconer 1985 的充分门槛是 \((d+1)/2\)，与目标的差为 \((d+1)/2-d/2=1/2\)，对一切 \(d\) 恒等于 \(1/2\)，这个常数与 \(d\) 无关这一点我一开始没料到。Wolff 的平面门槛 \(4/3\) 给出 \(4/3-1=1/3\)。Erdo\u{g}an 对 \(d\ge3\) 给 \(d/2+1/3\)，差值同样是 \(1/3\)。Du--Guth--Ou--Wang--Wilson--Zhang 在 \(d=3\) 给 \(9/5\)，差 \(9/5-3/2=18/10-15/10=3/10\)。Du--Zhang 给 \(d/2+1/4+1/(8d-4)\)，它在 \(d=3\) 处等于 \(3/2+1/4+1/20=3/2+3/10=9/5\)，与上条在 \(d=3\) 完全重合；在 \(d=4\) 处等于 \(2+1/4+1/28=2+2/7\)，在 \(d=8\) 处等于 \(4+1/4+1/60\)。pin 版本的差值：Guth--Iosevich--Ou--Wang 平面 \(\dim_HE>5/4\) 差 \(1/4\)；Du--Iosevich--Ou--Wang--Zhang 对偶数 \(d\ge4\) 给 \(d/2+1/4\)，差恰为 \(1/4\)；Du--Ou--Ren--Zhang 对 \(d\ge3\) 给 \(\dim_HE>d/2+1/4-1/(8d+4)\)，差为 \(1/4-1/(8d+4)\)。两个 pin 差值之差是 $\left(\tfrac14+\tfrac1{8d-4}\right)-\left(\tfrac14-\tfrac1{8d+4}\right)=\tfrac1{8d-4}+\tfrac1{8d+4}=\tfrac{16d}{64d^{2}-16}=\tfrac{4d}{16d^{2}-4}$，
代入 \(d=4\) 得 \(16/252=4/63\approx0.0635\)，代入 \(d=3\) 得 \(12/140=3/35\approx0.0857\)，代入 \(d=8\) 得 \(32/1020=8/255\approx0.0314\)，量级 \(O(d^{-1})\)，所以两条曲线的间距按 \(1/(2d)\) 收敛到 \(0\)。

我最初把"最后一段距离"想成一个统一的 power 型亏损：设想存在 \(\delta_d>0\) 使历史方法停在 \(d/2+\delta_d\)，且 \(\delta_d\) 由某个 restriction 指数决定。登记后发现 \(\delta_d\) 的行为并不可统一：偶数 \(d\ge4\) 的 pin 结果是常数 \(\delta_d=1/4\)，奇数 \(d\ge3\) 的是 \(\delta_d=1/4-1/(8d+4)\)，两者在 \(d\to\infty\) 都趋于 \(1/4\)，但 \(d=2\) 处是 \(1/4\)（\(\dim_HE>5/4\)）与 \(1/3\)（\(\dim_HE>4/3\)）并存。[推测] 我原先以为 \(\delta_d\) 会随 \(d\) 单调下降，登记表里 \(d=2\) 的 \(1/3\) 与 \(d=3\) 的 \(3/10\) 与 \(d=4\) 的 \(2/7\) 之间的非单调（\(0.333\)、\(0.300\)、\(0.286\)、\(d=5\) 时 \(1/4+1/36\approx0.278\)）说明单调性只在 \(\{3/10,\,2/7,\,5/18,\dots\}\) 这条子列上成立，\(d=2\) 由独立论证给出。

临界维的对照数字必须一起登记，否则门槛的意义会丢。Shmerkin--Wang（00_introduction.tex:74-77）在 \(\dim_HE=\dim_PE=d/2\) 处只给 \(\dim_H\Delta(E)=1\)，结论是维数 \(1\) 恰是 \(\R\) 上的满维数，但没有 \(\cL^1(\Delta(E))>0\)；Introduction 第 22-24 行明确保留严格不等号并声明不做端点。这两条的数值间距是"一个严格不等号"，也就是 \(s-d/2\) 可以任意小但没有下界，正是这个非一致性把我后面的装配参数逼成"先选 \(\beta\)，再选 \(\kappa\)，再选 \(\sigma\)，最后选 \(\omega\)"的四级顺序。

奇偶分裂在同一节里已经写死：把环境维数写成 \(d=2k\) 或 \(d=2k-1\)，则 \(S=k\) 或 \(S=k-\tfrac12\)。Introduction 第 154-158 行的分工是"整数指数来自投影到更小空间后的超临界径向可积性；奇数维由 thin-tube 改进补上额外的半维；该线性增益靠切片到平面证明；整数端点需要单独的 transverse-triple 论证"。翻译成指数：偶数情形要拿到的 cap 指数是整数 \(q=k-1\)，奇数情形要拿到 \(q=k-\tfrac12\)，两者相差 $\left(k-\tfrac12\right)-(k-1)=\tfrac12$，
这就是"额外的半维"的字面数值。我在第 4 节会看到这两条路共用同一个 \(k\)，但切片余维数不同：奇数走 \(h=k-1\)，偶数端点走 \(h=k-2\)。

真正的硬障碍在 00_introduction.tex:139-144，那里给的是一组严格不等式，常数形式没有：径向投影的像维数被源维数卡住，所以当 $S<s<d-1$ 且 $S=\tfrac d2$ 时不能假定向 $S^{d-1}$ 上有密度。把 \(S=d/2\) 代入，区间非空的条件是 \(d/2<d-1\)，即 \(d>2\)，也就是 \(d\ge3\)。数值验证：\(d=3\) 时 \(1.5<s<2\) 的窗口宽度 \(0.5\)；\(d=4\) 时 \(2<s<3\) 宽度 \(1\)；\(d=5\) 时 \(2.5<s<4\) 宽度 \(1.5\)；窗口宽度按 \(d/2-1\) 线性增长，\(d=2\) 时宽度为 \(0\) 而消失。[推测] 我起初把这条障碍理解成"高维才有技术问题"，登记后才明白 \(d=2\) 是障碍自动为空的退化维，这解释了 10_assembly.tex:606-607 为什么单列一句"\(d=2\) 的 cap 准备是 prep:integer-caps 的整数情形"，也解释了 assembly 的 proof of thm:main 里 \(d=2\) 走的是另一条支路。

第二个数值入口是环形幂次（00_introduction.tex:164-169）：需要的 belt 估计来自 Fourier 计算，环带的幂是 $B^{d-2S}$，在 $S=\tfrac d2$ 处取 $B^{d-2S}=B^{0}=1$，
在临界处恰好等于 \(1\)。这一项是我整个反推的锚点：论文说 cap 测试控制平行管，scalar 投影测试控制球面 belt，两者之间的换算给出的正是这个 \(1\)。我最初的反例形状猜测是把增益读成 \(B^{d-2s}\) 在 \(s>d/2\) 时的正幂，令 \(s\downarrow d/2\) 让幂次 \((d-2s)\to0^{+}\)，此时环带幂趋于常数 \(1\)，单尺度没有任何衰减。[推测] 我的"取极限传递结论"设想失败在这一点上：失败过程没有写进 tex，tex 只保留了 \(B^{d-2S}=1\) 这句作为动机，因此我只能从该幂次在 \(S=d/2\) 处的取值判定失败，判据是 \(d-2S=0\) 使估计退化成与 \(B\) 无关。

补一条登记：Liu 的平面正 pin 结果（00_introduction.tex:79-86）条件是 \(\dim_HE>1\)、\(\dim_HE+\dim_HF>2\)、\(\dim_HF=\dim_PF\)，把 \(F=E\) 代入时三条化为 \(\dim_HE>1\) 与 \(2\dim_HE>2\) 与 \(\dim_PE=\dim_HE\)，也就是 \(d=2\) 的门槛 \(1=d/2\) 加上一个正则性假设；论文强调该正则性是假设（第 87-88 行）。这条与 Theorem thm:main 的差在于后者不需要 \(\dim_PE=\dim_HE\)。BOP2026（第 91-92 行）的 \(k=1\) 门槛高于 \(d/2\)，即其差值为正数且未给出具体量。

## 角增益指数的逐符号复算

这一节把 Theorem ang:linear-gain（03_angular_gain.tex:21-45）的每个符号按数字复核一遍，顺带记录我第一次复算时对掉的两项。第 3 节已经抄过陈述，这里只做数值验算，第 4 节的 $h$ 选取全部由这些验算决定。

定理的输入维数是 $k+1$，方向空间是 $S^{k}$，$k\ge2$。指数的允许区间是
$k-1\le q\le k-\tfrac12<t<k$，即 $q$ 的上界 $k-\tfrac12$ 与 $t$ 的下界相同，两端都开：$q\le k-\tfrac12$ 与 $t>k-\tfrac12$。把 $q$ 的区间长度算出来是 $(k-\tfrac12)-(k-1)=\tfrac12$，$t$ 的区间长度是 $k-(k-\tfrac12)=\tfrac12$，两个区间各占半维，合起来正好把 $(k-1,k)$ 切成三段。我最初把这两段读反了，以为 $t$ 落在 $[k-1,k-\tfrac12]$ 而 $q$ 落在 $(k-\tfrac12,k)$，读反的后果在下一段。

损失参数是 $\epsilon>0$，输出是 $\delta^{c}$，其中 $c>0$ 与 $\epsilon$ 同时由定理给出；$q$-ball 界与 $t$-ball 界的损失都是 $\delta^{-\epsilon}$。管覆盖数是 $\delta^{-q-\epsilon}$，宽度 $C\delta$，方向平行于 $w$。我第一次复算漏掉的正是覆盖数里的那个 $\epsilon$：只把 $\delta^{-\epsilon}$ 记在 ball 界上，写成覆盖数 $\delta^{-q}$，于是我以为结论 $\delta^{c}$ 的 $c$ 与 $\epsilon$ 无关。检查 corollary ang:bad-directions（03_angular_gain.tex:872-919）的选择才能定死依赖关系：那里先取 $\epsilon_{1}\le\epsilon/2$，再取 $0<c_{1}<\min(\epsilon/2,\,c/3)$，于是 $\epsilon$ 至少被 $\epsilon/2$ 与 $c/3$ 两个量夹住，$c$ 依赖 $\epsilon$。数值上 $c_{1}<c/3$ 给出 $c-c_{1}>c-c/3=2c/3$，而要求的 $\nu(B_{\delta}^{+})\le\delta^{c_{1}}$ 只需 $2c/3\ge c_{1}$，即 $c_{1}\le 2c/3$；定理取的是 $c_{1}<c/3$，富余一倍。富余的来源是同一批参数还要喂给切片后的 ball 界，这条我在第 33 节记过，这里只核对数字。

端点 $q=k-1$ 的附加 plate 条件是 $\nu\{w:\operatorname{dist}(w,H)\le r\}\le\delta^{-\epsilon}r^{\zeta}$，对 $\delta\le r\le1$ 与每个线性超平面 $H$ 成立，$\zeta>0$ 固定。取 $r=1$ 时右端是 $\delta^{-\epsilon}$，大于 $1$，条件自动成立；取 $r=\delta$ 时右端是 $\delta^{-\epsilon}\delta^{\zeta}=\delta^{\zeta-\epsilon}$，要使它有意义的衰减需要 $\zeta>\epsilon$，这给出 $\epsilon$ 与 $\zeta$ 的隐式排序。取 $r=\delta^{1/2}$ 时右端 $\delta^{(\zeta-\epsilon)/2}$。这些代入是第 38 节那条 plate 角色讨论的数值版本。

切片后的平面指数：$h=k-1$ 时 $b=q-h=q-(k-1)$ 与 $f=t-h=t-(k-1)$，代入允许区间得
$b\in[0,\tfrac12]$（$q=k-1$ 时 $b=0$；$q=k-\tfrac12$ 时 $b=\tfrac12$）；$f$ 我第一遍写成 $f\in(0,\tfrac12)$，回代检查：$t>k-\tfrac12$ 给 $f>\tfrac12$，$t<k$ 给 $f<1$，故 $f\in(\tfrac12,1)$；而 $q\ge k-1$ 给 $b\ge0$，$q\le k-\tfrac12$ 给 $b\le\tfrac12$，故 $b\in[0,\tfrac12]$。原文（03_angular_gain.tex:678-681 一带）写的是 $b\in(0,\tfrac12]$，即左端开。差别就在 $b=0$：Furstenberg 型输入 ang:furstenberg 的要求是 $0<b<1$ 与 $b<f<2$，所以 $b=0$ 出界，这个左端开口正是分路的起点，超出排版细节的范围。我第一次复算时把 $b$ 的区间写成闭区间 $[0,\tfrac12]$，于是以为端点情形只是"$b$ 很小"的极限情形，只要 $\epsilon_{0}$ 随 $b\to0$ 退化即可；这个想法错了，因为 $b=0$ 意味着方向参数集是 $(\delta,0,\delta^{-\epsilon_{0}})$ 型集合，覆盖数下界 $\delta^{-2b-\epsilon_{0}}$ 变成 $\delta^{-\epsilon_{0}}$，与平凡上界 $\delta^{-\epsilon_{0}}$ 同阶，矛盾消失，整个反证失效。这是本笔记所谓"最初的错误路线"里最便宜的一条，纯数值即可否决。

Furstenberg 输入的常数逐条登记：给定 $0<b<1$ 与 $b<f<2$，存在 $\epsilon_{0}>0$；$P$ 是非空有界 $(\delta,f,\delta^{-\epsilon_{0}})$ 集；每个 $x\in P$ 的入射管族 $\mathcal T_{x}$ 的线参数构成 $(\delta,b,\delta^{-\epsilon_{0}})$ 集；结论 $\bigl|\bigcup_{x\in P}\mathcal T_{x}\bigr|_{\delta}\ge\delta^{-2b-\epsilon_{0}}$。反证里用到的计数是：抽样方向数 $n=\lceil\delta^{-b}\rceil$，每个方向的纤维覆盖数 $\delta^{-b-o(1)}$，合并后覆盖数 $n\delta^{-b-o(1)}=\delta^{-2b-o(1)}$（03_angular_gain.tex:128 与 193-195），与下界 $\delta^{-2b-\epsilon_{0}}$ 冲突的条件是 $o(1)<\epsilon_{0}$，即抽样带来的 $o(1)$ 必须小于 $\epsilon_{0}$。$o(1)$ 来自 binomial 计数的集中性，原文用 $K=\delta^{-o(1)}$、期望计数 $Knr^{b}$ 且 $nr^{b}\ge1$，并取 $T$ 大于 $K+\log(1/\delta)$ 的固定大倍数；这里的 $r$ 是网格半径，$n=\lceil\delta^{-b}\rceil$ 代入 $r^{b}$ 得 $nr^{b}\approx\delta^{-b}r^{b}=(r/\delta)^{b}\ge1$ 当 $r\ge\delta$，与 ball 的下限 $r\ge\delta$ 一致。

端点 $b=0$ 的修法在第 4 节已定性给出，这里只补数值：改取 $h=k-2$，则 $b=q-h=(k-1)-(k-2)=1$，$f=t-h=t-(k-2)$。由 $t>k-\tfrac12$ 估 $f$ 的下界，第一遍误记成 $f>\tfrac12+2=\tfrac52$，这里多加了 $1$；逐项：$t-(k-2)>k-\tfrac12-k+2=\tfrac32$，故 $f\in(\tfrac32,2)$（上界来自 $t<k$ 给 $f<2$）。此时 $b=1$ 又不落在 $0<b<1$ 内，正好卡在 Furstenberg 区间的右端点之外，且 $f<2$ 的上界被 $b<f$ 用满：$1<f<2$ 成立。所以端点需要 transverse-triple 论证这一句的数字理由就是 $b=1$ 与 $f\in(\tfrac32,2)$。我在第 4 节说 $f>3/2$，与这里一致；当时我把 $f$ 的下界写成 $t-h>3/2$ 而怀疑 $2$ 的上界是否被用满，答案是 $f<2$ 恰好用满 $b<f<2$ 的右半。

三维切片里的指数核对（03_angular_gain.tex:860-868）：Loomis--Whitney 给出 $|A|_{\delta}\le\delta^{-3/2-3a-o(1)}$，与 $|A|_{\delta}\ge\delta^{g-o(1)}$ 型下界冲突的条件写作 $3a<g=t-h-\tfrac32$，代入 $h=k-2$ 得 $g=t-k+2-\tfrac32=t-k+\tfrac12$，再由 $t>k-\tfrac12$ 得 $g>0$，由 $t<k$ 得 $g<\tfrac12$，即 $g\in(0,\tfrac12)$。三向量情形 $m=3$ 的 LW 界是 $|A|_{C_{m}\delta}\le C_{m,C}\Delta^{-m}\prod_{i=1}^{m}M_{i}^{1/(m-1)}$，这里 $m=3$ 给指数 $1/(m-1)=\tfrac12$，三因子相乘给 $\delta^{-3/2-o(1)}$ 与行列式损失 $\Delta^{-3}$；那个 $3a$ 就是把 $\Delta\ge\delta^{a}$ 代入 $\Delta^{-3}$ 得到的，$a$ 是行列式的退化指数。我一开始把 $1/(m-1)$ 误记为 $1/m$，于是算出 $\delta^{-1}$ 型的管计数和，结论 $3a<g$ 变成 $a<g/3$，与原文的 $3a<g$ 差 $9$ 倍，这条错算在第 5 节按文字叙述过，现在落成数字。$k=2$ 时 $h=0$，所有切片权重为 $1$，同一证明成立，$z$ 积分退化为零维单点上的积分；此时 $b=q$，$f=t$，区间 $q\in[1,\tfrac32]$、$t\in(\tfrac32,2)$，$g=t-2-\tfrac32$，这里代错了 $h$；检查：$h=k-2=0$ 时端点分支的 $g=t-h-\tfrac32=t-\tfrac32\in(0,\tfrac12)$，仍然为正。也就是说 $k=2$ 的两条分支在 $h=0$ 与 $h=k-2=0$ 处重合，这是 $d=3$ 情形（$S=\tfrac32$）的入口，$d=3$ 对应 $k=2$ 由 $d=2k-1$ 给出。

Haar 带估计（ang:haar，03_angular_gain.tex:207-219）的指数核对：$V$ 是 $\R^{n}$ 中余维 $h$ 的 Haar 随机子空间，$0\le h\le n-1$，单向量 $\Pr\{\operatorname{dist}(w,V)\le\delta\}\asymp\delta^{h}$；$j\le n-h$ 个单位向量奇异值 $d_{1}\ge\cdots\ge d_{j}\ge0$ 满足 $\delta^{-jh}\Pr\{\forall i:\operatorname{dist}(w_{i},V)\le\delta\}\le C_{n,j}\prod_{i=1}^{j}(d_{i}+\delta)^{-h}$。$h=0$ 时概率与各因子都为 $1$。证明里的条件维数下界是 $n-j+1\ge h+1$，含一维核的极限情形；每次投影长度不超过 $r$ 的概率 $\le C_{n}r^{h}$；被保留的约束要求其右端 $C_{j}\delta/d_{i}$ 小于某个固定的小维数常数，且早先投影长度平方和 $<\tfrac12$。等价形式 $\Pr\le C_{n,j}\prod_{i}\min(1,\delta/d_{i})^{h}$ 与 $\delta^{-jh}$ 归一化合并即给出上式，因为 $\min(1,\delta/d_{i})^{h}\cdot\delta^{-jh}=\prod\min(\delta,\delta/d_{i}\cdot\delta)^{h}$，这一步化简不成立；逐项核对：$\delta^{-jh}\prod_{i}\min(1,\delta/d_{i})^{h}=\prod_{i}\delta^{-1}\min(1,\delta/d_{i})^{h}=\prod_{i}\min(\delta^{-h},\delta^{-h}(\delta/d_{i})^{h})=\prod_{i}\min(\delta^{-h},d_{i}^{-h})$，与 $\prod(d_{i}+\delta)^{-h}$ 同阶，差别只在 $d_{i}\lesssim\delta$ 时用 $\delta$ 截断，这正是 $(d_{i}+\delta)$ 的作用。我第一次没写截断，直接把 $d_{i}^{-h}$ 相乘，于是 $d_{i}=0$ 时读成无穷，误以为引理在退化奇异值处失效。

切片选取（ang:slice-selection，03_angular_gain.tex:246-300）的指数变换：$\mathrm{d}\nu_{V}(w)=\delta^{-h}\mathbf1_{\{|P_{V^{\perp}}w|\le\delta\}}\mathrm{d}\nu(w)$，$\mathrm{d}\mu_{V,z}(x)=\delta^{-h}\mathbf{1}_{\{|P_{V^{\perp}}x-z|\le\delta\}}\mathrm{d}\mu(x)$，限制后两测度的 ball 指数变成 $q-h$ 与 $t-h$，质量与 ball 损失 $\le\delta^{-o(1)}$，纤维覆盖数 $\le\delta^{-(q-h)-o(1)}$ 宽度 $C'\delta$。$h=k-1$ 时 $q-h\in[0,\tfrac12]$、$t-h\in(\tfrac12,1)$；$h=k-2$ 时 $q-h=1$、$t-h\in(\tfrac32,2)$；$h=0$ 时两指数不变。要求 $t,q>h$，对 $h=k-1$ 即 $q>k-1$，与端点 $q=k-1$ 冲突，这就是端点必须换 $h=k-2$ 的第二处数字理由；对 $h=k-2$ 即 $q>k-2$，由 $q\ge k-1$ 自动满足。

反证框架里我原先猜的反例形状：把 $E$ 想成 $k+1$ 维里的"板条堆叠"，即方向集中在某个超平面 $H$ 的 $\delta$-邻域内，此时 $\nu\{w:\operatorname{dist}(w,H)\le r\}$ 在 $r=\delta$ 处等于 $1$，plate 条件要求 $\delta^{\zeta-\epsilon}\ge1$，即 $\zeta\le\epsilon$，与 $\epsilon$ 可任意小冲突，于是这种反例被 plate 条件排除。排除的数值边界就是上面那个 $\zeta>\epsilon$ 排序。[推测] 我的板条直觉对应原文的 "nonconcentrated laws" 一句（03_angular_gain.tex:49-50 附近），原文没有把这条例外情形写成公式，所以这条只能标推测，依据是 plate 条件只在 $q=k-1$ 出现这一处结构。

## Profile 超额量与递归状态的逐层指数

本节用纯数字复述 05_profiles_tests.tex 的定义链和 08_recursion.tex:106-108 的归一化恒等式，重点在我第一遍算错的两处。

Profile 超额量按定义 $A_n=m(n/N)-Sn/N$，其中 $S=d/2$，$m$ 是 Lipschitz 曲线且 $m(0)=0$，斜率 $\in[0,d]$。从 $A_0=m(0)-S\cdot0=0$ 出发，两个关键界是 $|A_i-A_j|\le d|i-j|/N$（由斜率上界 $d$ 得到）与 $A_n\ge\chi n/N-C_d\sigma$（由 profile 下界 05_profiles_tests.tex:62）。我一开始把第二个界中的 $\chi$ 记成了 $2s-d$，但 Frostman 指数是 $s=S+\chi=d/2+\chi$ 所以 $2s-d=2\chi$，差了一个因子 $2$；实际用的是 $\chi$ 本身，因为 $A_n$ 已经减掉了 $S=d/2$ 的线性项。

模型质量 $M(n)=R^{-m(n/N)}$，深度 $n$ 的 occupied cell 的真实质量在 $M(n)R^{\pm C_d\sigma}$ 范围内（05_profiles_tests.tex:65）。条件球估计的 loss 是 $K=R^{A_p-\min_{p\le n\le t}A_n+C_d\sigma}$（05_profiles_tests.tex:77-79），这里 $k(p,t)=A_p-\min_{p\le n\le t}A_n$ 被定义为"rise"。我第一次算的时候忘了取 min 而写成 $A_p-A_t$，这给出 $k(p,t)=A_p-A_t$ 可能为负；正确的定义强制 $k\ge0$。

核心归一化恒等式（08_recursion.tex:106-108）：$2^{d(b-a)}R^{-2I(a,b)}=R^{-2(A_b-A_a)}$，其中 $I(a,b)=m(b/N)-m(a/N)$。逐项验证：左端 $=2^{d(b-a)}\cdot2^{-2N\cdot[m(b/N)-m(a/N)]}=2^{d(b-a)-2[m(b/N)-m(a/N)]N}$，而 $2N\cdot m(b/N)=N\cdot m(b/N)/N$ 不对，让我仔细做：$R^{-2I(a,b)}=R^{-2(m(b/N)-m(a/N))}=2^{-2N(m(b/N)-m(a/N))}$，而 $2^{d(b-a)}=2^{d(b-a)}$。右端 $R^{-2(A_b-A_a)}=2^{-2N(A_b-A_a)}=2^{-2N([m(b/N)-Sb/N]-[m(a/N)-Sa/N])}$ $=2^{-2N[m(b/N)-m(a/N]-S(b-a)/N]}=2^{-2N\cdot I(a,b)+2S(b-a)}=2^{-2N\cdot I(a,b)+d(b-a)}$。与左端一致。$S=d/2$ 在这里恰好使 $2S=d$，这个精确对消是整个递归闭合的关键，我最初以为可以用 $S=d/2-\eta$ 做"稍微亚临界"的估计来避免等式约束，但失败原因就在这个恒等式：任何偏移 $\eta$ 导致每层多出 $R^{2\eta(b-a)/N}$ 的累积增长，$\sum(b-a)$ 遍历整条分支约 $N$，总增长 $R^{2\eta}$ 是 fixed power ，并非 $R^{o(1)}$，递归不闭合。

Positive distance state 的值 $\mathsf D_i^{X,Y}(a,t)$（08_recursion.tex:36-42）里出现了归一化因子 $2^{t-a}M(a)^{-4}$，碰撞集判定 $|D(x,y)-D(x',y')|\le C_0 2^{-t}$，$C_0=100(d+1)$（08_recursion.tex:35）。我第一次把 $C_0$ 误记成 $10d$，但原文是 $100(d+1)$，多出 $100$ 的因子来自 Taylor 展开 $O_d(2^{a-2p})$ 中需要 $100$ 倍的常数吸收（08_recursion.tex:271-278 的 suffix Taylor 界）。Terminal state 的界是 $R^{C_d(\kappa+\sigma)+o(1)}$（08_recursion.tex:259），其中 $\kappa$ 控制 block 宽度 $q_0=\lceil\kappa N\rceil$，terminality 判据是 interval 宽度 $\le100q_0=100\lceil\kappa N\rceil$。

Angular split depth $L_0=\max\{L,\lceil10\sigma N\rceil\}$，$h=v-2L_0$（08_recursion.tex:180-181）。$h\le a$ 时走 direct/graph 步，$h>a$ 时走 near/far 步。我第一次把 $\lceil10\sigma N\rceil$ 中的系数 $10$ 和 $\lceil100q_0\rceil$ 中的系数混淆，以为两者都是 $100$，实际上 $L_0$ 用的是 $10\sigma N$ 而 terminality 用的是 $100q_0$，它们约束不同。

## 递推转移因子与 cost 逐级核算

Transition factor（08_recursion.tex:202-203）是 $R^{-2(A_{a'}-A_a)+\mathrm{cost}+C_d\sigma+o(1)}$，每一级非 low 转移都乘一个。分支上 telescope 给出 $-2A_c+2A_{a_f}$（start 的总变化），然后 cost 的总量被 potential $\mathcal V([c,N])$ 支付。

Suffix cost 是 $A_p-\min_{[p,t]}A$，它等于 $k(p,t)$。High cost 是 $k(a,p)$，其中 $p$ 是当前 interval 的 fixed policy choice。Low step 的 cost 为 $0$，全部因子 $R^{o(1)}$。Near step 的 cost 为 $0$。Far step 的 cost 为 $0$。Direct step 的 cost 是 $k(a,p)$。

我最初对 recursive angular bound $\mathsf H_0^{[c,N]}(c,N)\le R^{2A_c-\mathcal V([c,N])+C_d(\kappa+\sigma/\kappa)+o(1)}$（09_ledger.tex:199-201）的指数核算里，把 $C_d(\kappa+\sigma/\kappa)$ 误读为 $C_d(\kappa+\sigma)\cdot\kappa^{-1}$，以为两项同阶。正确的理解是：$\kappa$ 项来自 terminal 贡献（$R^{C_d(\kappa+\sigma)+o(1)}$），$\sigma/\kappa$ 项来自非 low transitions 的累计 $C_d\sigma$ loss，每个非 low step 损失 $C_d\sigma$，共 $\le20/\kappa$ 个非 low step（09_ledger.tex:135），总损失 $20C_d\sigma/\kappa$ 归为 $C_d(\sigma/\kappa)$。

Finite policy 约束 $J_0=\lceil100(1/\kappa+1/\sigma)+100\rceil$（05_profiles_tests.tex:122, 09_ledger.tex:143），smoothing index $i\le i_{\mathrm{in}}+20/\kappa+1/\sigma$（09_ledger.tex:181）。Target accuracy 要求 $T>C_d(1/\kappa+1/\sigma)+10d+10$（09_ledger.tex:269-270）。这三条给出了 $J_0$ 为什么有 $100$ 倍裕量的数字理由：$100(1/\kappa+1/\sigma)+100>20/\kappa+1/\sigma+1$ 对一切 $\kappa,\sigma<1$ 成立。

Entry cost $\min_{j=1,2}k_j(0,c)\le\beta+C_d\sigma$（10_assembly.tex:78-79）。Entry potential $\mathcal V_j([c,N])\ge2\beta-2d/N$（10_assembly.tex:87-89）。净 gain 在 assembly 阶段是 potential $-$ entry cost $=(2\beta-2d/N)-(\beta+C_d\sigma)=\beta-2d/N-C_d\sigma$，选 $\sigma$ 使得 $C_d\sigma<\beta/3$，$N$ 使得 $2d/N<\beta/3$，得到净 gain $\ge\beta/3$。我第一次算净 gain 时漏掉了 $-2d/N$，以为 gain 是 $\beta-C_d\sigma$ 与 $N$ 无关；实际上对有限 $N$ 这给出非一致性，assembly 必须取 $N$ 足够大。

Shell decay（10_assembly.tex:260-265）要求 $\int_{2^{N-1}\le|r|\le2^{N+1}}|\widehat{\tau_N}(r)|^2\,dr\lesssim2^{-\gamma N}$，$\gamma>0$ 来自 $-\beta/2$（10_assembly.tex:443 附近）。TV decay rate $\eta<\min(c_*,\sigma)/2$（10_assembly.tex:240）。两条 summability 同时成立时 monotone-shell lemma 给出绝对连续性。

## 弱径向估计的指数链与端点矛盾条件

Weak radial estimate（03_angular_gain.tex:477-502, proof 从 504 起）是端点 $q=k-1$ 论证的辅助输入，给出 cap 指数 $\ell$ 满足 $k-2<\ell<(k-1)^2/k$。

单尺度断言（03_angular_gain.tex:506-509）：对 $\ell_1<(k-1)^2/k$，删除 $O(R^{-c_1})$ pair 质量后，每个纤维在 radius $u$ 处的 cap 质量 $\le R^{-\ell_1}$。$m(1)\ge k-1-C_k\tau-\epsilon$（03_angular_gain.tex:517-518）。条件 child 质量界 $R^{C_k\tau}D^{-1}$，$D=R^{m(b/N)-m(a/N)}$（03_angular_gain.tex:524-525）。

Divide into $J$ blocks，ignore first two blocks。在后续 block $[a,b]$ 中删除 pin 距 cell center $<R^{-1/(4J)}$ 的 pair，代价 $C_JR^{-(k-1)/(4J)+\epsilon}$（03_angular_gain.tex:532-533）。Troublesome pair 判定阈值 $F=R^{e'}D^{-(k-1)/k}$（03_angular_gain.tex:550）；$F\ge1$ 时无 troublesome pairs。$F<1$ 时 troublesome sources 在 $\le C/F$ 平行管中（03_angular_gain.tex:555）。

矛盾条件（03_angular_gain.tex:599-600）：$k\eta+kc_2+C_k\tau<ke'/(k-1)$。选参顺序：先 $\eta$ 小比较 $e'$，再 $c_2$ 与 $\epsilon$ 小使得 $C_kR^{\epsilon-\eta\zeta/(k-1)}=o(R^{-kc_2})$，最后 $\tau$ 小。LW 上界 $CDR^{k\eta-e'k/(k-1)}$（03_angular_gain.tex:596）与下界 $cDR^{-kc_2-C_k\tau}$ 矛盾要求 $k\eta-e'k/(k-1)<-kc_2-C_k\tau$，即 $k\eta+kc_2+C_k\tau<ke'/(k-1)$。我最初把分母 $k-1$ 写成 $k$，得到 $k\eta+kc_2+C_k\tau<e'$，这比正确条件弱了一个 $(k-1)$ 因子。

最终 cap 指数（03_angular_gain.tex:631-632）：$R^{J(e'+e'')+o(1)}\cdot R^{-\frac{k-1}{k}(k-1-2k/J-C_k\tau-\epsilon)}$。$J$ 大 depending on $(k-1)^2/k-\ell_1$，$e',e''$ 小。Ignored growth $2k/J+o(1)$（03_angular_gain.tex:629）。我第一遍漏了 $2k/J$，以为指数就是 $\frac{k-1}{k}(k-1-\text{losses})$；少了 $2k/J$ 后在 $J$ 不够大时指数变成负的（gain 消失）。

多尺度升级（03_angular_gain.tex:641-647）：选 $\ell<\ell_1<(k-1)^2/k$，$0<e<1$，在 dyadic $u\in[\delta,\delta^{e/(2k)}]$ 逐尺度应用单尺度，input loss $\delta^{-\epsilon}\le u^{-2k\epsilon/e}$。Sum of deletions $C\log(1/\delta)\delta^{ec_1/(2k)}$（03_angular_gain.tex:648）。要求 $2k\epsilon/e$ 使所有单尺度假设一致成立，即 $\epsilon<e/(2k)\cdot$（单尺度容许 loss）。

Triple-incidence 端点条件（03_angular_gain.tex:796-798 附近，从 ledger 续表第 817 行可查）：$(a-2b_0)(\ell-h)-e-3hb_0>0$，其中 $a$ 是 triple-weight exponent、$b_0$ 是 close-pair 阈值、$h$ 是维度参数、$\ell$ 是 cap 指数。我算这一条时取 $h=k-2$，$\ell>(k-1)^2/k-(k-2)=k-2+1/k$?? 检查：$\ell>k-2$ 且 $\ell<(k-1)^2/k=k-2+1/k$。区间长度 $1/k$，$k$ 大时极窄。第一次我以为 $\ell$ 可以到 $k-1$，实际上 $(k-1)^2/k=k-2+1/k<k-1$ 对一切 $k\ge2$ 成立（$1/k<1$），端点条件在 $k$ 大时非常紧。

## 扇区分解与角度增益的具体数值

角度增益在偶数维与奇数维走不同的扇区分解。论文用 $k$ 标记"切片后的方向空间维数加一"，$d=2k$ 时 $S=k$，$d=2k-1$ 时 $S=k-1/2$。

偶数维 $d=2k$ 路径：$S=k$，方向测度的 ball 指数 $q\le k-1/2$（来自 plate condition），切片 $h=k-1$ 后 $b=q-h\le 1/2$。$b>0$ 要求 $q>k-1$，而 $q\le k-1/2$，所以 $b\in(0,1/2]$。Furstenberg 给 $\delta^{-2b-\epsilon_0}$ 型下界，$b\le1/2$ 时下界 $<\delta^{-1-\epsilon_0}$。我最初设想在偶数维用 $h=k$（多切一刀），此时 $b=q-k<0$（因为 $q\le k-1/2$），出界。

奇数维 $d=2k-1$ 路径：$S=k-1/2$，端点 $q=k-1$。$h=k-2$ 后 $b=q-h=1$，出 Furstenberg 的 $0<b<1$ 范围。改用三维切片 + transverse-triple：三个方向 $v_1,v_2,v_3$ 满足 $|\det(v_1,v_2,v_3)|\ge\Delta\ge\delta^a$（$a<g/4$，$g=t-h-3/2=t-k+1/2$），LW 损失 $\Delta^{-3}\le\delta^{-3a}$。要求 $3a<g$ 即 $3a<t-k+1/2$，取 $a<g/4$ 满足。三维中 $f=t-h=t-k+2$，由 $t>k-1/2$ 得 $f>3/2$，由 $t<k$ 得 $f<2$。

扇区划分的数值：$S^k$ 上的 cap $B(\theta,r)$，radius $r$ 从 $\delta$ 到 $1$ 的 dyadic 分层。每层管覆盖数 $\delta^{-q-\epsilon}$ 个方向平行于 $w$ 的 width-$C\delta$ 管（03_angular_gain.tex:39）。在三维切片里三个 transverse 方向的行列式退化参数 $\Delta$ 给出扇区的有效 aperture：$\Delta\ge\delta^a$ 等价于三个方向两两夹角 $\ge c\delta^{a/2}$（由 Gram-Schmidt 逐步估出）。我最初设想用等角扇区划分 $c\delta^a$ 处取 $a=1/3$（均匀三维退化），但原文允许 $a$ 任意小（只受 $a<g/4$ 约束），实际增益在 $a$ 极小时最大，代价是 Furstenberg 输入需要 $b<f<2$ 中的 margin $g-4a>0$ 被保持。

## 双线性型与 Loomis-Whitney 常数链

Loomis-Whitney 引理（03_angular_gain.tex:439-448）：$m$ 个单位向量 $v_1,\ldots,v_m\in\R^m$，$|\det(v_1,\ldots,v_m)|\ge\Delta>0$，$A$ 被 $M_i$ 条 width-$C\delta$ 管覆盖（每方向），则 $|A|_{C_m\delta}\le C_{m,C}\Delta^{-m}\prod_{i=1}^m M_i^{1/(m-1)}$。

数值核对：$m=2$（平面情形）时 $|A|_{C_2\delta}\le C_{2,C}\Delta^{-2}(M_1M_2)^{1}$，两条方向族的覆盖数直接相乘除以行列式平方。$m=3$ 时 $|A|_{C_3\delta}\le C_{3,C}\Delta^{-3}(M_1M_2M_3)^{1/2}$，三因子开半。

应用端（03_angular_gain.tex:593-596）：$k$ 个管覆盖（每方向 $M_i\le C/F$ 条管），下界要求至少 $cDR^{-kc_2-C_k\tau}$ 个 balls。LW 给出上界 $CDR^{k\eta-e'k/(k-1)}$。这里 $m=k$，$M_i$ 的指数 $1/(k-1)$，积 $\prod M_i^{1/(k-1)}=(C/F)^{k/(k-1)}=C^{k/(k-1)}F^{-k/(k-1)}$。代入 $F=R^{e'}D^{-(k-1)/k}$ 得 $F^{-k/(k-1)}=R^{-e'k/(k-1)}D$。行列式损失 $\Delta^{-k}$，由 $|\det|\ge R^{-\eta}$ 给 $\Delta^{-k}\le R^{k\eta}$。合起来上界 $\le C_{k,C}R^{k\eta}R^{-e'k/(k-1)}D\cdot D^{-1}D=CDR^{k\eta-e'k/(k-1)}$（与 03_angular_gain.tex:596 吻合）。

我第一次在 $m=k$ 情形把 $1/(m-1)$ 记成 $1/m$，算出 $\prod M_i^{1/k}=F^{-k/k}=F^{-1}$，少了 $(k-1)$ 分母后与下界 $cDR^{-kc_2}$ 的矛盾变成 $e'/1>e'k/(k-1)$?? 不成立因为 $k/(k-1)>1$。这个笔误让我以为矛盾在任何 $e'$ 都成立，而实际需要 $e'$ 够小使 $k\eta+kc_2+C_k\tau<ke'/(k-1)$ 可满足。

Haar 带估计（03_angular_gain.tex:207-219, ang:haar-multiple）的常数 $C_{n,j}$：$V$ 是 $\R^n$ 中余维 $h$ 的随机子空间，$j$ 个向量的联合概率 $\delta^{-jh}\Pr\le C_{n,j}\prod_{i=1}^j(d_i+\delta)^{-h}$。$j=1$ 时 $\delta^{-h}\Pr\{\operatorname{dist}(w,V)\le\delta\}\le C_{n,1}(\|w\|+\delta)^{-h}=C_{n,1}\cdot O(1)$（$w$ 单位），给出 $\Pr\asymp\delta^h$。$j=2$ 时需要奇异值乘积 $d_1d_2$ 控制。

## Assembly 阶段幂次与单调测度重构

Shell-to-distance 转化（10_assembly.tex:294-298）：root shell conversion 的权重 $W(x,y)=D(x,y)^{-(d-1)/2}$，对固定 separated supports 在 $d_0\le D(x,y)\le d_1$ 下有界。Squaring 后 Fourier norm 上界 $R^{o(1)}\sup\mathsf H_F(0,N)+O(R^{-T})$。

Graph estimate 贡献的 entry cost：$\min_j k_j(0,c)\le\beta+C_d\sigma$（10_assembly.tex:78-79）。Cauchy-Schwarz 后 single-profile 贡献 $R^{2A_c-\mathcal V([c,N])+C_d(\kappa+\sigma/\kappa)+o(1)}$。Assembly 的最终 shell bound 是这两者的乘积：$R^{\beta+C_d\sigma}\cdot R^{2A_c-(2\beta-2d/N)+C_d(\kappa+\sigma/\kappa)+o(1)}$。$A_c\le\beta$（由 entry 定义 10_assembly.tex:68-69），所以 $2A_c\le2\beta$。合起来指数上界 $\le\beta+C_d\sigma-2\beta+2d/N+C_d(\kappa+\sigma/\kappa)+o(1)=-\beta+C_d\sigma+C_d\kappa+C_d\sigma/\kappa+2d/N+o(1)$。选参使 $C_d\sigma+C_d\kappa+C_d\sigma/\kappa+2d/N<\beta/2$，净 gain $\ge\beta/2$，即 $\gamma=\beta/2>0$。

Monotone-shell lemma（10_assembly.tex:198-224 附近，Introduction 00_introduction.tex:212-222）：$\alpha_N$ 递减到 $\alpha_\infty$，$\|\alpha_N-\tau_N\|_{\mathrm{TV}}\lesssim2^{-\eta N}$，$\int_{2^{N-1}\le|r|\le2^{N+1}}|\widehat{\tau_N}(r)|^2\,dr\lesssim2^{-\gamma N}$。Telescoping：$\alpha_n-\alpha_{n+1}$ positive，smooth Fourier cutoffs 给出 $\sum_N\|\alpha_N-\alpha_\infty\|_{\mathrm{TV}}<\infty$ 与 $\sum_N\int_{\text{shell}_N}|\widehat{\tau_N}|^2<\infty$。绝对连续性由 $L^2$ Fourier 可和性 + $L^1$ 近似传递。

Distance weight 的维数幂次 $W=D^{-(d-1)/2}$：在 $d=2$ 时 $W=D^{-1/2}$，$d=3$ 时 $W=D^{-1}$，$d=4$ 时 $W=D^{-3/2}$。$d-1$ 来自球面面积元 $r^{d-1}$ 在 Fourier 变换中的径向权重；$(d-1)/2$ 是 stationary phase 给 $r^{-(d-1)/2}$ 衰减后的平方。我一开始把 $(d-1)/2$ 和 $(d-2)/2$ 搞混（后者是 restriction 里出现的面维数），直到在 10_assembly.tex:118-119 查到 $W(x,y)=D(x,y)^{-(d-1)/2}$ 的逐字定义。

Entry depth $c=\max\{n:\min(A_{1,n},A_{2,n})\le\beta\}$（10_assembly.tex:68-69），范围 $\lfloor\beta N/(2d)\rfloor\le c<N/4$（10_assembly.tex:73-74）。下界验证：$n\le\beta N/(2d)$ 时 Lipschitz 界给 $A_{j,n}\le d\cdot n/N\le\beta/2<\beta$，所以 $n$ 符合定义。上界验证：$n\ge N/4$ 时 $A_{j,n}\ge\chi/4-C_d\sigma>\beta$（需 $\sigma$ 小），所以 $c<N/4$。Interval $[c,N]$ 的宽度 $\ge3N/4>100q_0=100\kappa N$，要求 $\kappa<3/400$（10_assembly.tex:107）。

## 振荡积分的稳相展开与导数预算

06_oscillatory.tex 里的 stationary phase 给出 shell 频率到角能量的转化。核心公式：$e(x,y)=(x-y)/|x-y|\in S^{d-1}$，distance $D(x,y)=|x-y|$，Fourier 变换的径向积分在 $|\xi|=2^j$ 附近展开。

Shell frequency cutoff $\Psi\in C_c^\infty((1/4,4))$，$\Psi\ge1$ on $[1/2,2]$（06_oscillatory.tex:128）。Directional cutoff $\psi$ supported near $e$，vanishing near $-e$（06_oscillatory.tex:29-32），这使 stationary phase 只在一个临界点 $z_0$ 附近贡献，不混入两个。

球面微分算子 $L_j$ order $2j$，polynomial in $\Delta_{S^{d-1}}$（06_oscillatory.tex:235-239），与逆展开算子 $B_j$（order $2j$，recursive def，06_oscillatory.tex:271-274）配对。稳相展开的 $j$-阶系数 $\sim L_j(b)(e)\cdot 2^{-j(d-1)/2}$，error bound $\le C\cdot 2^{-(M+1)(d-1)/2}$（06_oscillatory.tex:87 附近，$D_*$ 的界含 $\max(1,2^L R^{-50\sigma})$）。$L$ 是最大 nominal descriptor length。

Derivative budget：$B$ 固定独立于 $N$（08_recursion.tex:67-68, 09_ledger.tex:193-195），$T>C_d(1/\kappa+1/\sigma)+10d+10$（09_ledger.tex:269-270）决定每步 oscillatory 误差 $O(R^{-T})$ 可忽略。$D_*$（06_oscillatory.tex:87）的 $\max(1,2^L R^{-50\sigma})$：$L\le50\sigma N$ 时 $D_*=1$（无增长），$L>50\sigma N$ 时 $D_*=2^L R^{-50\sigma}=2^{L-50\sigma N}$，这给出 far-step 里 $\Lambda\ge R^{c\sigma}$ 型条件的来源。我最初把 $50\sigma$ 误写成 $10\sigma$（和 $L_0$ 定义里的系数混淆），导致以为 $D_*=1$ 对一切 $L$ 成立，从而完全没意识到 far-step 的约束。

Angular inner product $\mathsf H_F$ 到 general angular energy $\mathsf H$ 的 Cauchy-Schwarz 转化（08_recursion.tex:184-190 附近）：$\mathsf H_F(a,v)\le\mathsf H(a,v)\cdot(\text{spatial multiplier norm})^2$，spatial multiplier bounded by definition of admissible symbols。每一步 graph estimate 的 output 是 $R^{-2(A_p-A_g)+k(g,p)+C_d\sigma+o(1)}\times$（child energies at depth $p$）。

## 扇区分解替换掉单角度增益的那一步

定理给出的输出是 $(\mu\otimes\nu)(E)\le\delta^{c}$，我一开始把它当成"对每个固定角度都成立的一点式估计"来用，于是想直接对 $\nu$ 做积分分割，写 $\nu=\nu|_{B}+\nu|_{B^{c}}$，其中 $B$ 是"好的方向集"。这条路在我这里停在同一个问题上：$B$ 由纤维覆盖数定义，而覆盖数 $\le\delta^{-q-\epsilon}$ 是在"存在某个覆盖"的意义上定义的，投影后重合的方向标签会被并在一起，$B$ 的可测性就没有依据。第 26 节按文字讲过这个可测性处理，这里落成数字，替换动作发生在 corollary ang:bad-directions（03_angular_gain.tex:872-919）的定义式

$B_{\delta}=\{w:\le\delta^{-q-c_{1}}\ \text{个宽度}\ C\delta\ \text{的管捕获}\ \mu\text{-质量}\ge\delta^{c_{1}}\}$，
$B_{\delta}^{+}=\{w:\max_{J}\mu\bigl(\bigcup_{a\in J}T_{C'}(w,a)\bigr)\ge\delta^{c_{1}}\}$，

其中 $J$ 跑遍一个固定的有界空间 $\delta$-网格中所有长度 $\le\lfloor\delta^{-q-c_{1}}\rfloor$ 的锚点列表。候选列表的个数是 $\delta$-网格点数目的 $\lfloor\delta^{-q-c_{1}}\rfloor$ 次方，形式上 $\binom{\lesssim\delta^{-O(1)}}{\le\delta^{-q-c_{1}}}$，这个数被吸收进后续的 $o(1)$；这一步之后才有 "candidate masses are measurable, so this is a Borel set"。角度增益由单点式换成扇区式的证据就是这里的 $\max_{J}$：一个方向 $w$ 好或坏由它在每个锚 $a$ 上的 $C'$-宽管 $T_{C'}(w,a)$ 并集决定，即由 $(w,a)$ 平面上的扇区决定。

参数链的具体数值：先取放大宽度 $C'>C$ 足够大以容纳 ang:slice-selection 里的空间锚点舍入；再取 ang:linear-gain 在宽度 $C'\delta$ 下的 $\epsilon,c$；然后 $\epsilon_{1}\le\epsilon/2$，$0<c_{1}<\min(\epsilon/2,c/3)$。代入得 $\nu(B_{\delta}^{+})\le\delta^{c-c_{1}}$，要求右边 $\le\delta^{c_{1}}$ 的条件是 $c-c_{1}\ge c_{1}$，即 $c_{1}\le c/2$；实际取 $c_{1}<c/3$，第一遍我把富余量误写成 $\tfrac{c}{3}-\tfrac{c}{2}$，那是个负数；逐项：$c_{1}<c/3<c/2$，所以 $c-c_{1}>2c/3>c_{1}$，富余量为 $2c/3-c_{1}>2c/3-c/3=c/3$。同时 $\epsilon_{1}\le\epsilon/2$ 保证 ball 损失 $\delta^{-\epsilon_{1}}$ 与管数 $\delta^{-q-c_{1}}\le\delta^{-q-\epsilon}$ 两处用同一个 $\epsilon$，条件 $c_{1}<\epsilon/2$ 就是 $\delta^{-q-c_{1}}\le\delta^{-q-\epsilon}$ 的充分条件。$B_{\delta}\subset B_{\delta}^{+}$ 靠舍入：在每个坐标轴上舍入原覆盖中的点，得到放大宽度下的候选且捕获质量不减，等号不需要。

切片本身的扇区几何在 ang:slice-selection（03_angular_gain.tex:246-300）：带子定义为 $|P_{V^{\perp}}w|\le\delta$ 与 $|P_{V^{\perp}}x-z|\le\delta$，两个测度各带因子 $\delta^{-h}$；$z$ 在一个固定的足够大球上积分；要求 $t,q>h$；抽样后 $\mathbb E_{V}\int(\widetilde\mu_{V,z}\otimes\widetilde\nu_{V})(\widetilde E_{V,z})\,\mathrm{d}z\ge\delta^{o(1)}$；限制测度的质量与 ball 损失 $\le\delta^{-o(1)}$，指数由 $q,t$ 变成 $q-h,t-h$；纤维管数 $\le\delta^{-(q-h)-o(1)}$ 宽度 $C'\delta$；坐标映射 $p_{V,z}(x)=P_{V}x$ 与 $v_{V}(w)=P_{V}w/|P_{V}w|$。这里 $\delta^{-h}$ 的作用是把带宽 $\delta$ 的截面向 $V^{\perp}$（维数 $h$）上的 $\delta$-球归一，所以 $\int\delta^{-h}\mathbf1_{\{|P_{V^{\perp}}w|\le\delta\}}\,\mathrm{d}w\approx\delta^{-h}\cdot\delta^{h}=1$，量纲闭合。我第一遍读的时候漏掉 $\delta^{-h}$，把 $\nu_{V}$ 当概率，于是每条纤维的管数下界少了一个 $h$ 次幂。

三步截断（03_angular_gain.tex:374-376 一带）的常数：截断阈值 $K$ 取 subpower 且 $K\to\infty$；截断后方向质量 $\le K^{3}$，代价 $CK^{-2}$，所以 $K$ 增大时代价趋于 $0$；存活积分入射 $\ge(2K)^{-1}$；候选纤维管数 $M_{\delta}=\delta^{-q-o(1)}$；$\sup_{V}$ 质量有 a priori subpower 上界 $K^{3}$。舍入的误差项是投影改变每个方向 $O(\delta)$，一个带子的点其坐标落在半径 $r\ge\delta$ 的球内时原空间半径 $\le Cr$；线参数空间里穿过一点的条带截距变化 $O(\delta)$，故每条原条带只对应有限个 $\delta$-cell。

原空间侧的扇区口径由 06_oscillatory.tex:20-32 固定：$K_{d}$ 取 $2$ 的幂且
$1000(d+1)<K_{d}<4000(d+1)$，
分离条件 $K_{d}2^{-a}/8\le|c_{X}-c_{Y}|\le4K_{d}2^{-a}$，
于是 $D(x,y)\asymp_{d}2^{-a}$，方向 $e(x,y)=(x-y)/D(x,y)$ 落在一个小固定孔径的锥里；
$\psi$ 满足 $0\le\psi\le1$，在这些方向的固定邻域上恒等 $1$，在其负方向的固定邻域上为 $0$，各阶导数一致有界。
孔径数值：由分离条件，$|x-y|\ge K_{d}2^{-a}/8$ 而 cell 直径 $\le\sqrt d\,2^{-a}$，故锥的半角 $\le(\sqrt d\,2^{-a})/(K_{d}2^{-a}/8)=8\sqrt d/K_{d}$，用 $K_{d}>1000(d+1)$ 得 $8\sqrt d/K_{d}<8\sqrt d/(1000(d+1))$；代入 $d=2$ 得 $8\sqrt2/3000\approx3.8\times10^{-3}$，$d=3$ 得 $8\sqrt3/4000\approx3.5\times10^{-3}$，$d=4$ 得 $16/5000=3.2\times10^{-3}$，$d=8$ 得 $8\sqrt8/9000\approx2.5\times10^{-3}$。这个量就是我一直在找的具体角度，它跟 $\delta$ 无关，是常数级孔径。球面切向量场取 $\Omega_{uv}=w_{u}\partial_{w_{v}}-w_{v}\partial_{w_{u}}$，$1\le u<v\le d$，场的个数 $\binom{d}{2}$：$d=2$ 时 $1$ 个，$d=3$ 时 $3$ 个，$d=4$ 时 $6$ 个；长度 $q$ 的词记 $\Omega^{\alpha}$，$|\alpha|=q$，空词是恒等。角尺度 $D_{l_{\mathfrak t}}=\max(1,2^{l_{\mathfrak t}}R^{-50\sigma})$，转折发生在 $2^{l}=R^{50\sigma}$ 即 $l=50\sigma N$ 处；这与第 30 节的 far/near 分界 $L_{0}=\max\{L,\lceil10\sigma N\rceil\}$ 是两个不同的 $\sigma$ 倍数，$50$ 与 $10$ 之比 $5$ 我在第 24 节记过一次，这里再钉住：$D_{l}$ 用 $50\sigma$，$L_{0}$ 用 $10\sigma$。

反例形状我最初猜的是"两块平行板"：取 $X,Y$ 为深度 $a$ 的两个分离 cell，方向集中在锥的一条中心线附近宽度 $2^{-l}$ 的扇区里，此时 $D_{l}=\max(1,2^{l}R^{-50\sigma})$ 在 $l<50\sigma N$ 时取 $1$，mask 的角导数不受 $2^{l}$ 放大，估计退化成低尺度情形，增益丢失发生在 $l\ge50\sigma N$ 一侧。把角度增益换成扇区分解的决定性一步就是承认：单个锥的增益不可用，可用的陈述是坏方向集的 $\nu$-质量 $\le\delta^{c_{1}}$，其余方向才带增益，而这个"其余"必须写成 $\max_{J}$ 形式才可测。[推测] 我的板条与平行板直觉在 tex 里没有对应公式，能核到的只有 $K_{d}$ 孔径、$\psi$ 的支撑条件与 $B_{\delta}^{+}$ 的定义，所以这一段的直觉部分标推测。

## 弱径向估计的指数天花板与三处漏账

Lemma ang:weak-radial（03_angular_gain.tex:498-520 一带）的输入是 $k\ge2$、$\zeta>0$ 与开区间
$k-2<\ell<\frac{(k-1)^{2}}{k}$。
区间的长度先算出来：$\frac{(k-1)^{2}}{k}-(k-2)=\frac{k^{2}-2k+1-k^{2}+2k}{k}=\frac1k$，
于是 $k=2$ 时 $\ell\in(0,\tfrac12)$，$k=3$ 时 $\ell\in(1,\tfrac43)$，$k=4$ 时 $\ell\in(2,\tfrac94)$，$k=5$ 时 $\ell\in(3,\tfrac{16}{5})$。窗口按 $1/k$ 收缩，这解释了我一直以为是"技术余量"的东西：可用的 cap 指数与整维 $k-1$ 的差是
$(k-1)-\frac{(k-1)^{2}}{k}=\frac{(k-1)k-(k-1)^{2}}{k}=\frac{k-1}{k}$，
即 $k=2$ 差 $\tfrac12$，$k=3$ 差 $\tfrac23$，$k=4$ 差 $\tfrac34$，$k\to\infty$ 差趋于 $1$。与薄管升级的目标 $k-\tfrac12$ 比，天花板 $\frac{(k-1)^{2}}{k}$ 低 $\tfrac32-\tfrac1k$：逐项 $\frac{(k-1)^{2}}{k}=\frac{k^{2}-2k+1}{k}=k-2+\frac1k$，故 $\bigl(k-\tfrac12\bigr)-\bigl(k-2+\frac1k\bigr)=\tfrac32-\tfrac1k$，故 $k=2$ 差 $1$，$k=3$ 差 $\tfrac76$，$k=4$ 差 $\tfrac54$，$k=5$ 差 $\tfrac{13}{10}$，$k\to\infty$ 差趋于 $\tfrac32$。这个 $\tfrac32-\tfrac1k$ 就是第 6 节薄管升级要从 $k-1$ 爬到 $k-\tfrac12$ 的真实距离里"弱径向一段能给的"那部分，剩下的 $(k-\tfrac12)-(k-1)=\tfrac12$ 由一尺度改进与闭包补足。

命题的输出是：对每个 $e>0$ 存在 $\epsilon,c>0$，源测度 $\lambda$ 满足 $\lambda(B(x,r))\le\delta^{-\epsilon}r^{k-1}$ 与 $\lambda(H^{(r)})\le\delta^{-\epsilon}r^{\zeta}$（$\delta\le r\le1$，$H$ 为仿射超平面），则存在可测对集 $G$ 使 $(\lambda\otimes\lambda)(G^{c})\lesssim\delta^{c}$ 且 $\lambda\{z:(x,z)\in G,\ \pi_{x}(z)\in B(\theta,r)\}\le\delta^{-e}r^{\ell}$ 对每个 $x$、每个 cap 心 $\theta$、$\delta\le r\le1$ 成立；对角线从 $G$ 中删去；射影方向空间的球由对映 cap 取并得到，常数改变固定。$\delta^{-e}$ 与 $\delta^{c}$ 是两个不同量级的损失，$e$ 任意小、$c$ 由 $e$ 决定，这个方向在第 19 节的文字里已经说过，数值上就是 $e$ 先给定、$\epsilon$ 后给定。

单尺度论证（$u=2^{-N}$，$R=2^{N}$）的账：先固定 $\ell_{1}<\frac{(k-1)^{2}}{k}$，删去 $O(R^{-c_{1}})$ 的对质量，使每条存活纤维在半径 $u$ 处 cap 质量 $\le R^{-\ell_{1}}$。正则化参数 $\tau>0$ 给出比较误差 $R^{C_{k}\tau}$、profile 的 $k$-Lipschitz 性与 $m(1)\ge k-1-C_{k}\tau-\epsilon$；类质量下界 $R^{-\tau}$ 被吸收进常数。深度 $a<b$ 的 occupied cell 的条件子代质量为
$R^{C_{k}\tau}D^{-1}$，其中 $D=R^{m(b/N)-m(a/N)}$。
把深度区间分成 $J$ 个近等块，丢掉前两块；后面每块 $[a,b]$ 内删去 pin 到源 cell 中心 $z_{Q}$ 距离 $\le R^{-1/(4J)}$ 的对，代价
$C_{J}R^{-(k-1)/(4J)+\epsilon}$，
其余对的中心方向 $v(x,Q)=(z_{Q}-x)/|z_{Q}-x|$ 与到 $Q$ 内任一点的方向差 $O(2^{-a}R^{1/(4J)})$，冻结方向造成的横向位移
$O(2^{-2a}R^{1/(4J)})=o(2^{-b})$，
成立的条件写成深度就是 $a\ge2N/J+O(1)$ 与 $b-a=N/J+O(1)$。我第一遍漏的三处账里，最难找的是最后这条：$2^{-2a}R^{1/(4J)}=R^{-2a/N+1/(4J)+o(1)}$ 要小于 $2^{-b}=R^{-b/N}$，代入 $a=2N/J$、$b=3N/J$ 得左边指数 $-4/J+1/(4J)=-15/(4J)$ 对右边 $-3/J$，$-15/(4J)<-3/J$ 即 $15/4>3$，成立；但若不丢前两块，$a$ 可以小到 $O(1)$，$2^{-2a}$ 就不再是负幂，整条估计崩掉，这就是丢掉前两块的数值理由。

第二处漏账在 troublesome 阈值
$F=R^{e'}D^{-(k-1)/k}$
上。$F\ge1$ 时 troublesome 对为空，增益消失，所以要求 $F<1$，即 $e'<\frac{k-1}{k}\log_{R}D=\frac{k-1}{k}\bigl(m(b/N)-m(a/N)\bigr)$；麻烦源集落在至多 $C/F$ 条宽度 $C'2^{-b}$ 的平行管内。我一开始把 $D^{-(k-1)/k}$ 的指数 $\frac{k-1}{k}$ 读成 $\frac{k-2}{k}$，于是每块少扣一份质量，最终 cap 指数从 $\frac{k-1}{k}\bigl(k-1-\dots\bigr)$ 变成 $\frac{k-2}{k}\bigl(k-1-\dots\bigr)$，天花板变成 $\frac{(k-1)(k-2)}{k}=k-3+\frac{2}{k}$，$k=3$ 时给 $2$，与真实天花板 $\frac43$ 差 $2-\tfrac43=\tfrac23$；这个错值会一路传导到第 31 节的 Jensen 矛盾式，使其右端变小而更容易"闭合"，也就是虚假闭合。

Jensen 与行列式那一步的数字（03_angular_gain.tex:624-660 一带，第 31 节按叙述讲过）：记块内入射为 $I_{Q}$，主张 $I_{Q}\le R^{-c_{2}}$；反设 $I_{Q}\ge R^{-c_{2}}$，Jensen 给 $\int\rho_{Q}\bigl(\bigcap_{i=1}^{k}B_{x_{i}}\bigr)\ge I_{Q}^{k}$；若 $|\det(v(x_{1},Q),\dots,v(x_{k},Q))|<R^{-\eta}$，则某个 Gram--Schmidt 步距 $<R^{-\eta/(k-1)}$，该 pin 落在过 $z_{Q}$ 的仿射超平面的 $CR^{-\eta/(k-1)}$ 邻域内，plate 界于是给出这些组的乘积质量 $\le C_{k}R^{\epsilon-\eta\zeta/(k-1)}$；要它是 $o(R^{-kc_{2}})$ 就需 $\epsilon-\frac{\eta\zeta}{k-1}<-kc_{2}$。存活组里存在一个行列式 $\ge R^{-\eta}$ 的 $k$ 元组，其公共源集条件质量 $\ge\frac12R^{-kc_{2}}$，由条件子代界它需要至少
$cDR^{-kc_{2}-C_{k}\tau}$
个半径可比 $2^{-b}$ 的 ball；另一方面 $k$ 重管覆盖经 Loomis--Whitney 给出至多
$CD R^{k\eta-e'k/(k-1)}$，
两式冲突的条件是
$k\eta+kc_{2}+C_{k}\tau<\frac{ke'}{k-1}$。
我第一遍把 $e'k/(k-1)$ 写成 $e'(k-1)/k$，两边差
$\frac{ke'}{k-1}-\frac{e'(k-1)}{k}=e'\cdot\frac{k^{2}-(k-1)^{2}}{k(k-1)}=\frac{e'(2k-1)}{k(k-1)}$，
$k=2$ 时差 $\tfrac{3e'}{2}$，$k=3$ 时差 $\tfrac{5e'}{6}$，$k=4$ 时差 $\tfrac{7e'}{12}$，量级 $O(e'/k)$；按错式子选 $e'$ 会让左边 $k\eta+kc_{2}$ 相对右边放大 $\bigl(\tfrac{k}{k-1}\bigr)^{2}$ 倍，矛盾变弱，递归打不开。删 troublesome 对的代价每块 $R^{-c_{2}}$，密度删除每块损失 $R^{e''}$， witness 线与目标线的横向差 $O(2^{-N})$，每个命中子代质量 $\ge R^{-e''}$ 乘子代全质量，于是父质量被乘上 $R^{e''}F$；这些逐块相乘再对 $Q$ 求和，$\rho(Q)$ 和为 $1$，望远镜把 profile 增量消掉。

最终 cap 指数的账面（03_angular_gain.tex:698-706）：
$R^{J(e'+e'')+o(1)}\cdot R^{-\frac{k-1}{k}\bigl(k-1-\frac{2k}{J}-C_{k}\tau-\epsilon\bigr)}$。
被忽略的生长是 $\frac{2k}{J}+o(1)$，即第三处漏账：我把块数 $J$ 当固定小整数时，$\frac{2k}{J}$ 吃掉 $\frac{(k-1)^{2}}{k}-\ell_{1}$ 的全部余量。定量看，要求
$\frac{k-1}{k}\cdot\frac{2k}{J}<\frac{(k-1)^{2}}{k}-\ell_{1}$，
即 $J>\frac{2(k-1)}{(k-1)^{2}/k-\ell_{1}}=\frac{2k(k-1)}{(k-1)^{2}-k\ell_{1}}$；
代入 $k=3$、$\ell_{1}=\tfrac{13}{12}$（天花板 $\tfrac43=\tfrac{16}{12}$，余量 $\tfrac{3}{12}=\tfrac14$）得 $J>\frac{2\cdot3\cdot2}{4-3\cdot\frac{13}{12}}=\frac{12}{4-\frac{13}{4}}=\frac{12}{\frac34}=16$，即 $J\ge17$；
再代入 $k=4$、$\ell_{1}=2$（天花板 $\tfrac94$，余量 $\tfrac14$）得 $J>\frac{2\cdot4\cdot3}{9-4\cdot2}=\frac{24}{1}=24$，即 $J\ge25$。我第一遍把这里的 $(k-1)^{2}$ 代成 $k^{2}$，$k=3$ 时算出 $\frac{12}{9-\frac{13}{4}}=\frac{48}{23}\approx2.09$，$k=4$ 时算出 $\frac{24}{16-8}=3$，两个值都偏小一个数量级，$J\ge17$ 与 $J\ge25$ 的差别正是我原先以为"$J$ 取 $3$ 到 $5$ 就够"的出处。$J$ 的选取依赖 $\frac{(k-1)^{2}}{k}-\ell_{1}$ 这一点在原文（03_angular_gain.tex:705 一带）是显式写的，选完 $J$ 再选 $e',e''$，使 $J(e'+e'')$ 小于剩余余量。多尺度拼接（03_angular_gain.tex:710-724）：取 $\ell<\ell_{1}<\frac{(k-1)^{2}}{k}$，只需看 $0<e<1$；在 $\delta$ 与 $\delta^{e/(2k)}$ 之间的二进 $u$ 上用单尺度，此时输入损失 $\delta^{-\epsilon}\le u^{-2k\epsilon/e}$，故把 $\epsilon$ 取得足够小即 $2k\epsilon/e$ 小于单尺度允许的指数；删除总量
$C\log(1/\delta)\,\delta^{ec_{1}/(2k)}$，
是正幂；$r\le\delta^{e/(2k)}$ 用 cap 估计，更大的 $r$ 处 $\delta^{-e}r^{\ell}\ge1$ 自动成立。$\ell$ 与 $\ell_{1}$ 之间的松弛吸收固定常数。

端点分支（$q-h=1$）的 triple 论证里，指数同样可以逐条落账（03_angular_gain.tex:762-800）：wedge 恒等式
$|(1,p)\wedge(0,u)\wedge(0,v)|^{2}=|u\wedge v|^{2}+|p\wedge u\wedge v|^{2}$，
wedge 小于 $2\delta^{a}$ 推出 $\alpha\le C\delta^{a-2b_{0}}$；三个方向的奇异值最大者可比 $1$，前两块张成面积 $\ge c\delta^{b_{0}}$，故第二奇异值 $\ge c\delta^{b_{0}}$，第三 $\ge c\delta^{2b_{0}}\alpha$，Haar 带估计给归一化抽样权重
$\delta^{-3h}\Pr_{V}\{\max_{1\le i\le3}|P_{V^{\perp}}w_{i}|\le\delta\}\le C\delta^{-3hb_{0}}(\alpha+\delta)^{-h}$；
按 $\alpha$ 的二进环带求和后
$\mathbb E_{V}\lambda_{V}^{\otimes3}(\mathcal T_{\delta})\le C\delta^{(a-2b_{0})(\ell-h)-e-3hb_{0}}$。
指数为正的选择次序是：由 $\ell>h$ 先取 $b_{0}>0$ 足够小依赖于 $a,\ell,h$，再取 $e>0$ 足够小，同时保证 $a-2b_{0}>0$；$e$ 定了以后弱径向给出 $c_{e}>0$，再取 $\theta>0$ 使 $c_{e}-\theta h>0$。我第一遍把 $(a-2b_{0})(\ell-h)$ 展开成 $a(\ell-h)-2b_{0}$，丢了 $b_{0}$ 上的括号，于是以为 $b_{0}$ 的容许量与 $\ell-h$ 无关，实际是线性相关：$b_{0}$ 的上限由 $a(\ell-h)-2b_{0}(\ell-h)-e-3hb_{0}>0$ 给出，即
$b_{0}<\frac{a(\ell-h)-e}{2(\ell-h)+3h}$，
分母 $2(\ell-h)+3h=2\ell+h$，所以 $b_{0}<\frac{a(\ell-h)-e}{2\ell+h}$。三重点入射用 H\"older 得 $\mathbb E_{V}\int\!\int F(V,z,x)^{3}\,\mathrm{d}\widetilde\mu_{V,z}(x)\,\mathrm{d}z\ge\delta^{o(1)}$，删掉坏 triple 与例外锚对之后仍有一 $\delta^{o(1)}$ 量的 triple 其原始 wedge $\ge2\delta^{a}$，投到 $V$ 并单位化各向量改变 $O(\delta)$，故 $V$ 内行列式 $\ge\delta^{a}$；点集投影满足 $|A|_{\delta}\ge\delta^{-(t-h)+o(1)}$，每个原始方向标签的覆盖是 $\delta^{-(q-h)-o(1)}=\delta^{-1-o(1)}$ 条管，LW 给 $|A|_{\delta}\le\delta^{-3/2-3a-o(1)}$，冲突条件是 $3a<g=t-h-\tfrac32$。这里 $q-h=1$ 是端点身份的标志，也是 $m=3$ 的 LW 出现在三维切片里的原因。

## 六级归约的转移因子逐项结账

Proposition rec:reductions（08_recursion.tex:194-261）的转移因子是
$R^{-2(A_{a'}-A_{a})+\mathrm{cost}+C_{d}\sigma+o(1)}$，
六个子式的 cost 分别是：Suffix 为 $A_{p}-\min_{[p,t]}A$，Low 为 $0$ 且整体因子 $R^{o(1)}$，High 为 $k(a,p)$，Direct 为 $k(a,p)$，Near 为 $0$，Far 为 $0$。我第一遍把 Low 行的 $C_{d}\sigma$ 也记上了，于是以为低壳也带固定幂损失；原文（08_recursion.tex:205-206）明确 low child 有 cost zero 与 entire multiplier $R^{o(1)}$，无 $C_{d}\sigma$；只有 low-frequency stopping term 带 $R^{C_{d}\sigma+o(1)}$。这个区分决定第 9 节的 $\sigma/\kappa$ 损失来源：非 low 转移至多 $20/\kappa$ 步，故合并的 $C_{d}\sigma$ 松弛是 $O_{d}(\sigma/\kappa)$。

正态计数 $\mathsf D_{i}^{X,Y}(a,t)=2^{t-a}M(a)^{-4}\int\mathbf1_{\{|D(x,y)-D(x',y')|\le C_{0}2^{-t}\}\,\mathrm{d}\theta\,\mathrm{d}\theta}$ 里的常数 $C_{0}=100(d+1)$（08_recursion.tex:35）。后缀归约里同组两对的距离差 $\le(1+4\sqrt d)2^{-p}$，需要它 $<C_{0}2^{-p}$，即 $1+4\sqrt d<100(d+1)$；代入 $d=2$ 得 $1+4\sqrt2\approx6.66<300$，$d=3$ 得 $1+4\sqrt3\approx7.93<400$，$d=4$ 得 $9<500$，$d=9$ 得 $1+12=13<1000$，富余两个数量级，所以我曾怀疑 $C_{0}$ 是否被别的估计用紧，检查全文只有这一处与 $C_{0}2^{-t}$ 的容差一起出现，富余是给固定倍数的放大留位置。

归一化恒等式（08_recursion.tex:106-110）是 $\S=d/2$ 唯一被"用满"的地方：
$2^{d(b-a)}\left(\frac{M(b)}{M(a)}\right)^{2}=2^{d(b-a)}R^{-2I(a,b)}=R^{-2(A_{b}-A_{a})}$，
最后一步要求 $2S=d$。逐项展开 $M(n)=R^{-m(n/N)}$ 与 $I(a,b)=m(b/N)-m(a/N)$、$A_{n}=m(n/N)-Sn/N$：
$-2(A_{b}-A_{a})=-2\bigl(I(a,b)-S(b-a)/N\bigr)=-2I(a,b)+2S(b-a)/N$，
而 $d(b-a)\log_{2}2=(b-a)\log_{R}R^{d}$ 换成 $R$-幂是 $R^{d(b-a)/N}$，两边相等当且仅当 $d=2S$。我最初按球面维数把前置因子写成 $2^{(d-1)(b-a)}$，于是得到
$R^{(d-1)(b-a)/N-2I(a,b)}=R^{-2(A_{b}-A_{a})}R^{(-(b-a)/N)+(2S-d)(b-a)/N}$，
多出 $R^{(2S-d+1)(b-a)/N}$ 这一项；在 $S=d/2$ 处它是 $R^{(b-a)/N}$，每级带一份 $R^{1/N\cdot(b-a)}$ 的假增益，$b-a$ 可达 $N$，于是整个递归被这个幽灵项托住而"闭合"。这条错账在第 11 节按文字讲过，这里给出幂次。

far 步的稳相数字（08_recursion.tex:475-483）：$\Lambda=rd_{+}\gtrsim2^{v-h}=2^{2L_{0}}$，
$D_{*}^{2}/\Lambda\le R^{-18\sigma}$ 当 $2^{L}R^{-50\sigma}\le1$，$D_{*}^{2}/\Lambda\le R^{-98\sigma}$ 当 $2^{L}R^{-50\sigma}>1$，
另有 $\Lambda\ge R^{c\sigma}$ 与 $D_{*}\le R^{2}$。$18$ 与 $98$ 的来源是 $D_{*}\le R^{2}$ 与 $\Lambda$ 的下界组合：$D_{*}^{2}/\Lambda\le R^{4}R^{-c\sigma}$ 这一读法不成立，正确读法是 $D_{*}$ 由 mask 的角导数尺度给出，两个分支分别把 $2^{L}\le R^{50\sigma}$ 与 $2^{L}>R^{50\sigma}$ 代入 $D_{*}$ 的定义，得到 $R^{50\sigma}$ 与 $R^{2}$ 两种上界，再除以 $\Lambda\ge R^{2\cdot10\sigma}=R^{20\sigma}$ 的幂次差。[推测] 原文只给结论 $R^{-18\sigma}$、$R^{-98\sigma}$ 与分界 $2^{L}R^{-50\sigma}\gtrless1$，中间的代入没有写成公式，我只能核对分界常数 $50$ 与 $10$（$L_{0}$ 用 $\lceil10\sigma N\rceil$）以及输出指数 $18$ 与 $98$ 同 $50$ 的换算在此无法闭合，故标推测；可核到的硬事实是 $D_{l}=\max(1,2^{l}R^{-50\sigma})$（06_oscillatory.tex:44）与 $L_{0}=\max\{L,\lceil10\sigma N\rceil\}$（08_recursion.tex:180）两处常数。

长度分带（08_recursion.tex:500-508）把连续几何量化成整数：取 $n$ 使 $d_{+}\in(2^{-n-1},2^{-n}]$，令 $b=n+\log_{2}K_{d}$，则两个位移都落在 $K_{d}2^{-b}/4$ 与 $K_{d}2^{-b}$ 之间；移到深度 $b$ 的 cell 中心改变至多 $2\sqrt d\,2^{-b}$；由 $d_{+}\le\sqrt d\,2^{-a}$ 得 $b>a$；由 far 下界得 $b\le h+O_{d}(1)<v$。代入 $K_{d}$ 的范围 $1000(d+1)<K_{d}<4000(d+1)$ 得 $\log_{2}K_{d}$ 的区间：$d=2$ 时 $\log_{2}3000\approx11.55$ 到 $\log_{2}10000\approx13.29$，$d=3$ 时 $\log_{2}4000\approx11.97$ 到 $\log_{2}16000\approx13.97$，$d=4$ 时 $\log_{2}5000\approx12.29$ 到 $\log_{2}20000\approx14.29$，即 $b$ 相对 $n$ 平移 $12$ 到 $14$ 级，这个平移就是分离几何的"放大倍数"。near 阈值为 $10(d+1)2^{-h}$：$d=2$ 时 $30\cdot2^{-h}$，$d=3$ 时 $40\cdot2^{-h}$，与 $K_{d}2^{-b}/4\ge250(d+1)2^{-b}$ 比较，要求 $250(d+1)2^{-b}>10(d+1)2^{-h}$，检查：即 $25\cdot2^{-b}>2^{-h}$，亦 $b<h+\log_{2}25<h+4.64$，与原文 $b\le h+O_{d}(1)$ 一致，$O_{d}(1)$ 里的常数就有 $\log_{2}25$ 这一份。

稳相增益的幂次配平（08_recursion.tex:511-516 与 579-585）：两个 leading gain 相乘是 $O_{d}(2^{-(d-1)(v-b)})$，单个 kernel 界
$C2^{-(d-1)(v-b)}(1+2^{v}|d_{1}-d_{2}|)^{-2}$；
总账
$2^{d(v-a)}M(a)^{-4}\cdot2^{-(d-1)(v-b)}\cdot M(b)^{4}2^{-(v-b)}R^{2I(a,b)+C_{d}\sigma}=2^{d(b-a)}R^{-2I(a,b)+C_{d}\sigma}=R^{-2(A_{b}-A_{a})+C_{d}\sigma}$。
幂次逐步核对：$d(v-a)-(d-1)(v-b)-(v-b)=d(v-a)-d(v-b)=d(b-a)$，正好消掉壳层频率前置因子。我第一遍把两个 leading gain 写成 $2^{-d(v-b)}$ 并把碰撞归一化的 $2^{-(v-b)}$ 另外再乘一次，于是得到 $2^{(d-1)(b-a)}\cdot2^{-(v-b)}$，多出 $-(v-b)$；错误发生在把 $n_{*}$（球面维数）当成 $d$：单个稳相增益是 $\Lambda^{-n_{*}/2}$ 且 $n_{*}=d-1$，两个相乘给 $\Lambda^{-(d-1)}$，逐项核对：$\Lambda^{-n_{*}/2}\cdot\Lambda^{-n_{*}/2}=\Lambda^{-n_{*}}=\Lambda^{-(d-1)}$，与 $2^{-(d-1)(v-b)}$ 一致，因为 $\Lambda\asymp2^{v-b}$。near 步的配平（08_recursion.tex:457-459）是
$2^{d(h-a)}R^{-4I(a,h)}R^{2I(a,h)+C_{d}\sigma}=R^{-2(A_{h}-A_{a})+C_{d}\sigma}$，
行数或列数 $\le R^{2I(a,h)+C_{d}\sigma}$，四因子来自 transform  splitting；far 步的四元组标签数 $\le R^{2I(a,b)+C_{d}\sigma}$，两个内部点对的第一 cell 固定后只有维数多个标签。

终止态与势函数（08_recursion.tex:258-260 与 09_ledger.tex:14-18）：terminal 界 $R^{C_{d}(\kappa+\sigma)+o(1)}$，terminal 定义是当前区间宽度 $\le100q_{0}$，$q_{0}=\lceil\kappa N\rceil$，$q_{0}/N=\kappa+O(1/N)$。势函数
$\mathcal V(J)=\min_{a\le i<j\le t,\ j-i\ge10q_{0}}(A_{i}+A_{j})$，
$J$ 宽度至少 $10q_{0}$ 才有定义。支付不等式 $\mathrm{cost}\le\mathcal V(J')-\mathcal V(J)$。三处几何常数：origin 满足 $b_{0}\le p-L$、$p+L\le u_{0}$、$v\le a+2L$；$i_{0}<b_{0}+2q_{0}$；$v<b_{0}+2q_{0}+2L\le u_{0}+2q_{0}$；子区间里 $p\le i\le v-10q_{0}<u_{0}-8q_{0}$；inner interval 不早于 $p$ 开始、不晚于 $u_{0}-2q_{0}$ 结束。suffix 分支要求 $2p>a+t$，子区间宽度超过非终止父宽度的一半故 $>10q_{0}$；high prefix 分支要求 $2p\le a+t$ 且 $t-v\ge\sigma N$（low）或 $0\le t-v<\sigma N$（high），并且 $v-p\ge(t-a)/2-\sigma N>10q_{0}$。

分支预算（09_ledger.tex:134-189）：固定块代表数 $K\le1/\kappa+2$；high 与 direct 合计 $\le K$；suffix $\le N/q_{0}\le1/\kappa$；low $\le1/\sigma$；角 episodes $\le K+1$，far 步 $\le K+1$；near 步 $\le2K+1$；非 low 合计 $\le5K+2<20/\kappa$；平滑指标 $i\le i_{\mathrm{in}}+20/\kappa+1/\sigma$；$J_{0}=\lceil100(1/\kappa+1/\sigma)+100\rceil$，且 $20/\kappa+1/\sigma+1<J_{0}$。我第一遍以为 near 步可以连续出现，于是分支数无界；实际按"最大值下降则记账到刚越过的锚，最大值不变则下一步必是 direct"分类，near 步总数 $2K+1$ 有界，$5K+2$ 与 $20/\kappa$ 的比较要求 $5(1/\kappa+2)+2<20/\kappa$，即 $7<15/\kappa$，$\kappa<15/7$，回代检查：$5K+2\le5/\kappa+12$，要 $5/\kappa+12<20/\kappa$ 即 $12<15/\kappa$ 即 $\kappa<1.25$，这对小固定 $\kappa$ 自动成立，常数 $20$ 富余 $4$ 倍。

单profile 角界（09_ledger.tex:198-201）是
$\mathsf H_{0}^{[c,N]}(c,N)\le R^{2A_{c}-\mathcal V([c,N])+C_{d}(\kappa+\sigma/\kappa)+o(1)}$，
望远镜给 $2A_{c}-2A_{a_{f}}$，最后势 $\mathcal V(J_{*})\le A_{i}+A_{j}\le2A_{a_{f}}+20d\,q_{0}/N=2A_{a_{f}}+O_{d}(\kappa)+o(1)$，终止项 $O_{d}(\kappa+\sigma)$，非 low 转移的 $\sigma$ 合并 $O_{d}(\sigma/\kappa)$。精度要求 $T>C_{d}(1/\kappa+1/\sigma)+10d+10$，祖先主因子 $\le R^{C_{d}+o(1)}$。$10d+10$ 那两项我在第 24 节核过：$10d$ 覆盖 cell 直径与分离常数的维数依赖，$10$ 覆盖系数和的绝对大小。

## 入口深度的取法与四级参数的幂次预算

装配阶段（10_assembly.tex）的输入是 Proposition prep:starting-pairs 给的 $\chi>0$ 与两个概率 $\mu_{1},\mu_{2}$，其 ball 界是 $\mu_{i}(B(x,u))\le Cu^{S+\chi}$，$S=d/2$。先把几何常数列出来：一次公共相似把 $E$ 放进 $(1/4,3/4)^{d}$；$Q_{0}$ 是深度零 cube 且包含 $E$ 于内部；尺度 $R=2^{N}$ 上用参数 $\sigma$ 的正则化；保留类 $\mathcal C_{j,N}$ 的个数 $R^{o(1)}$，被丢质量 $\le R^{-\sigma+o(1)}$；$a_{j,C}=\mu_{j}(C)$，$\rho_{j,C}=a_{j,C}^{-1}\mu_{j}|_{C}$；$m_{j}(0)=0$ 故 $M_{j}(0)=R^{-m_{j}(0)}=1$。profile 数据是
$A_{j,n}=m_{j}(n/N)-Sn/N$，$k_{j}(g,p)=A_{j,p}-\min_{g\le n\le p}A_{j,n}$，
以及三条界（10_assembly.tex:49-51）
$A_{j,0}=0$，$|A_{j,n}-A_{j,n'}|\le d|n-n'|/N$，$A_{j,n}\ge\chi n/N-C_{d}\sigma$。

入口深度的定义（10_assembly.tex:68-69）取的是最后越界点：
$c=\max\{n\in\{0,\dots,N\}:\min(A_{1,n},A_{2,n})\le\beta\}$，
$\beta$ 的范围 $0<\beta<\min(\chi/10,1/10)$。我第一遍把 $\max$ 读成 $\min$，也就是"第一次达到 $\beta$ 的深度"。两种取法的账不一样。取 $\min$ 时 $c$ 可能为 $0$，此时 $k_{j}(0,c)=0$，入口代价为零，但 $[c,N]$ 上的势只剩
$\mathcal V_{j}([0,N])\le A_{j,0}+A_{j,10q_{0}}=0+\chi\cdot10q_{0}/N-C_{d}\sigma\approx10\kappa\chi-C_{d}\sigma$，
衰减指数只有 $\kappa\chi$ 量级；取 $\max$ 时入口代价升到 $\beta+C_{d}\sigma$，换来势的下界 $2\beta-2d/N$，净衰减
$\min_{j}k_{j}(0,c)-\tfrac12(\mathcal V_{1}+\mathcal V_{2})\le-\beta+C_{d}\sigma+2d/N$，
是 $\beta$ 量级。两者比值 $\beta/(\kappa\chi)$：按后面的选参 $\kappa<\beta/(16C_{d})$，得 $\beta/(\kappa\chi)>16C_{d}/\chi$，代入典型值 $\chi=1/10$，回代看尺度：$\chi$ 由起始 Frostman 指数给出、可任意小，所以这个比值随 $\chi\to0$ 发散，取 $\max$ 的优势在临界情形是压倒性的。原文真正的硬约束是（10_assembly.tex:76-77）$A_{j,n}\ge\beta-d/N$ 对一切 $c\le n\le N$ 成立，这条只有 $\max$ 定义能给，因为它把 $c$ 之后所有 $\le\beta$ 的点都排除掉了。

$c$ 的位置由两头夹住（10_assembly.tex:74）：
$\lfloor\beta N/(2d)\rfloor\le c<N/4$。
下界的证明用 Lipschitz 界：$n\le\beta N/(2d)$ 时 $A_{j,n}\le d\cdot n/N\le d\cdot\beta/(2d)=\beta/2<\beta$，故这些 $n$ 都 qualify，最大值至少 $\lfloor\beta N/(2d)\rfloor$。上界的证明用下界式：$n\ge N/4$ 时 $A_{j,n}\ge\chi/4-C_{d}\sigma$，要它 $>\beta$ 需 $\chi/4-\beta>C_{d}\sigma$；由 $\beta<\chi/10$ 得 $\chi/4-\chi/10=5\chi/20-2\chi/20=3\chi/20$，即要求 $\sigma<3\chi/(20C_{d})$，这就是"$\sigma$ 相对 $d,\chi,\beta$ 足够小"的数值内容。代入 $\chi=1/10$、$C_{d}=1$ 得 $\sigma<3/200=0.015$；$\chi=1/100$ 时 $\sigma<0.0015$。区间宽度：$N-c>3N/4$，而 $100q_{0}=100\lceil\kappa N\rceil\le100(\kappa N+1)$，故 $3N/4>100q_{0}$ 要求 $\kappa<3/400=0.0075$（大 $N$ 时），这正是"非终止"的数值条件。

势函数的入口版本（10_assembly.tex:86-89）：
$\mathcal V_{j}([c,N]):=\min_{c\le u<v\le N,\ v-u\ge10q_{0}}(A_{j,u}+A_{j,v})\ge2\beta-2d/N$，
每个指标都用 $A_{j,n}\ge\beta-d/N$ 两次，$2(\beta-d/N)=2\beta-2d/N$。最大性给 $A_{j,c+1}>\beta$，故 $A_{j,c}>\beta-d/N$；至少一侧 $j_{*}$ 有 $A_{j_{*},c}\le\beta$，配合 $\min_{0\le n\le c}A_{j_{*},n}\ge-C_{d}\sigma$ 得 $\min_{j}k_{j}(0,c)\le\beta+C_{d}\sigma$，上界与下界的差是 $(\beta+C_{d}\sigma)-(\beta-d/N)=C_{d}\sigma+d/N$，即代价的富余量。

shell 转换与双 profile 拆分（10_assembly.tex:289-338）：descriptor 的最大标称长度
$L\le\max(c,(N-c)/2)\le N/2$，
根壳转换用 $a=0$、$v=N$，输出 $R^{o(1)}\sup\mathsf H_{F}(0,N)+O(R^{-T})$；graph 因子（10_assembly.tex:311）
$R^{-A_{1,c}-A_{2,c}+\min_{j}k_{j}(0,c)+O_{d}(\sigma)+o(1)}$；
拆分用的 Cauchy--Schwarz 带前置 $2^{d(N-c)}$ 与测度 $\mathrm{d}\lambda_{N}(r)=\Psi(r/2^{N})\,\mathrm{d}r/2^{N}$，
$2^{d(N-c)}\int E_{1}E_{2}\,\mathrm{d}\lambda_{N}\le\bigl(2^{d(N-c)}\int E_{1}^{2}\,\mathrm{d}\lambda_{N}\bigr)^{1/2}\bigl(2^{d(N-c)}\int E_{2}^{2}\,\mathrm{d}\lambda_{N}\bigr)^{1/2}$；
每侧套用 $\mathsf H_{j}(c,N)\le R^{2A_{j,c}-\mathcal V_{j}+O_{d}(\kappa+\sigma/\kappa)+o(1)}$。指数合并（10_assembly.tex:359-365）：
$-A_{1,c}-A_{2,c}+\min_{j}k_{j}(0,c)+\tfrac12\sum_{j=1}^{2}\bigl(2A_{j,c}-\mathcal V_{j}\bigr)=\min_{j}k_{j}(0,c)-\tfrac12(\mathcal V_{1}+\mathcal V_{2})$，
$A_{j,c}$ 项完全对消，这一步是我最初设计时最担心的一行：两个 $A_{j,c}$ 前面一个负号、一个来自 $2A_{j,c}$ 的一半，恰好抵消，前提是 graph 步把 $A_{1,c}+A_{2,c}$ 都扣掉，而 ledger 界每侧给回 $2A_{j,c}$ 的一半。若 graph 步只用到一侧的 profile，残项是 $\tfrac12(A_{1,c}-A_{2,c})$，符号不可控。

四级参数的顺序与预算（10_assembly.tex:258-259 与 381-391）：先 $\beta$，再 $\kappa$ 使 $C_{d}\kappa<\beta/16$，再 $\sigma$ 使 $C_{d}\sigma/\kappa<\beta/16$，最后 $\omega$ 使 $4d\omega<\beta/8$；空间乘积数 $L_{N}\lesssim R^{2d\omega}$，平方后代价 $R^{4d\omega}$；精度取 $T>10+4d\omega$。合并指数
$-\beta+C_{d}(\kappa+\sigma/\kappa)+4d\omega+o(1)$，
三项上界相加 $\beta/16+\beta/16+\beta/8=(1+1+2)\beta/16=\beta/4$，故主项 $\le-3\beta/4+o(1)$，放大 $N$ 后写成 $O(R^{-\beta/2})$，富余 $\beta/4$。误差项 $R^{-T+4d\omega}$ 与 $R^{-\beta/2}$ 比较：需 $T-4d\omega>\beta/2$，由 $T>10+4d\omega$ 得 $T-4d\omega>10>\beta/2$（因 $\beta<1/10$），闭合。这里 $\beta/16$ 的两个 $16$ 与 $\beta/8$ 的 $8$ 是同一预算的三份配额，我第一遍以为三份配额之和要 $\le\beta$，实际只需 $<\beta$，$3/4$ 的余量给 $o(1)$。

装配侧的 $\varepsilon$ 出现在两个不同位置，必须分清：prep:starting-pairs 的 cap 界写成"对每个 $e>0$ 存在 $c(e)>0$、$C_{e}$ 与 $B_{N}\subset\Gamma_{N}$，$(\mu_{1}\otimes\mu_{2})(B_{N})\le C_{e}2^{-c(e)N}$，使得在 $G_{N}=\Gamma_{N}\setminus B_{N}$ 上对 $2^{-N}\le u\le1$ 与每个 cap $B(w,u)$ 有 $\mu_{2}\{y:(x,y)\in G_{N},\pi_{x}(y)\in B(w,u)\}\le2^{eN}u^{S}$"；$\Gamma_{N}$ 是至多 $C2^{2d\omega N}$ 个空间 Borel 乘积的不交并。这里 $2^{eN}=R^{e}$ 是任意小的幂损失，$2^{2d\omega N}=R^{2d\omega}$ 是乘积计数，两者各管一头：前者进 mask 的 level-zero 测试，后者进 $L_N$ 的平方代价。装配用的 $\eta$ 由 $\|\alpha_{N}-\tau_{N}\|_{\mathrm{TV}}\lesssim2^{-\eta N}$ 给出，取值 $0<\eta<\min(c_{*},\sigma)/2$，其来源是两项删除 $\lesssim R^{-c_{*}}+R^{-\sigma+o(1)}$，$\eta$ 取半是为了让 $o(1)$ 不破坏求和。

单调 shell 判据（10_assembly.tex:454-471）的常数是纯分析侧的：$\vartheta\in C_{c}^{\infty}(\R)$ 在 $[-1,1]$ 上为 $1$、支撑在 $[-2,2]$；$Q_{N}$ 是 $\vartheta(2^{-N}r)$ 的逆变换卷积，$P_{N}=Q_{N}-Q_{N-1}$，乘子支撑在 $\{2^{N-1}\le|r|\le2^{N+1}\}$；界
$\|Q_{N}\nu\|_{L^{1}}\le C_{\vartheta}\|\nu\|_{\mathrm{TV}}$，$\|\sum_{N=a}^{b}P_{N}\nu\|_{L^{1}}\le2C_{\vartheta}\|\nu\|_{\mathrm{TV}}$，
后者的 $2$ 来自望远镜 $Q_{b}-Q_{a-1}$，与带数无关。Plancherel（Mattila1995 式 (12.4)）给
$\|P_{N}\tau_{N}\|_{L^{2}}\lesssim\bigl(\int_{2^{N-1}\le|r|\le2^{N+1}}|\widehat{\tau_{N}}(r)|^{2}\,\mathrm{d}r\bigr)^{1/2}$，
所以 shell 界 $2^{-\gamma N}$ 在 $L^{2}$ 范数下是 $2^{-\gamma N/2}$，判据第二条求和用的正是这个平方根，这就是 $O(2^{-\gamma N/2})$ 里 $\tfrac12$ 的出处。$P_{N}$ 的支撑倍数为 $2$（从 $2^{N-1}$ 到 $2^{N+1}$），这是我起初担心重叠的地方，检查后知道重叠由 $\vartheta$ 的 $[-2,2]$ 支撑控制，倍数固定。

求和闭合的数字：第一条 $\sum_{N}\|\alpha_{N}-\tau_{N}\|_{\mathrm{TV}}\lesssim\sum_{N}2^{-\eta N}<\infty$ 只要 $\eta>0$；第二条 $\sum_{N}2^{-\gamma N/2}<\infty$ 只要 $\gamma>0$。两条都不要求速率一致，这是我最初以为需要 $\eta$ 与 $\gamma$ 满足 $\eta+\gamma>1$ 之类条件的原因所在：判据只用可求和性，没有任何指数比较。极限测度 $\alpha_{\infty}=D_{\#}(W\mathbf1_{\Gamma_{\infty}}(\mu_{1}\otimes\mu_{2}))$，$\Gamma_{\infty}=\bigcap_{N}\Gamma_{N}$，其正性由 $(\mu_{1}\otimes\mu_{2})(\bigcap_{N}\Gamma_{N})>0$ 与 $W\ge$ 正常数在 $d_{0}\le D(x,y)\le d_{1}$ 上给出，$W(x,y)=D(x,y)^{-(d-1)/2}$。最后一条权重 $W$ 的两端界是我在第 10 节担心的来源：$d=2$ 时 $W=D^{-1/2}$，$d=3$ 时 $W=D^{-1}$，$d=4$ 时 $W=D^{-3/2}$，靠分离支撑的 $d_{0}>0$ 才有界，与 $N$ 无关。

## 稳相展开算子、双线性换算与机器侧常数

第 9 节按叙述讲过 shell 转换，这里把它的全部常数落成一张式子清单，并交代我在双线性这一步上的误判。球面维数记 $n_{*}$，$S^{n_{*}}$ 上的 Laplacian 取 $\Delta_{S^{n_{*}}}=\operatorname{div}\nabla$，特征值非正。展开算子（06_oscillatory.tex:229-239）是
$c_{n_{*}}=(2\pi)^{n_{*}/2}e^{-i\pi n_{*}/4}$，$L_{0}=c_{n_{*}}\operatorname{Id}$，$L_{j}=\frac{c_{n_{*}}}{(2i)^{j}j!}\prod_{q=0}^{j-1}\left(\Delta_{S^{n_{*}}}+q(q+1)-\frac{n_{*}(n_{*}-2)}{4}\right)$（$j\ge1$），$L_{j,-1}b=\overline{L_{j}\overline{b}}$，$L_{j,+1}=L_{j}$。逐系数：$j=1$ 时因子 $(2i)^{1}1!=2i$，乘积只含 $q=0$ 一项即 $\Delta_{S^{n_{*}}}-\frac{n_{*}(n_{*}-2)}{4}$；$j=2$ 时 $(2i)^{2}2!=-8$，乘积是 $\bigl(\Delta-\frac{n_{*}(n_{*}-2)}{4}\bigr)\bigl(\Delta+2-\frac{n_{*}(n_{*}-2)}{4}\bigr)$；$q(q+1)$ 列出来是 $0,2,6,12,20,\dots$，即第 $j$ 个算子是 $\Delta_{S^{n_{*}}}$ 的 $j$ 次多项式、微分阶 $2j$。$n_{*}=d-1$ 时 $\frac{n_{*}(n_{*}-2)}{4}$ 的具体值：$d=2$ 给 $\frac{1\cdot(-1)}{4}=-\frac14$，$d=3$ 给 $0$，$d=4$ 给 $\frac14$，$d=5$ 给 $1$，$d=6$ 给 $\frac94$；$d=3$ 时该项归零，所以在平面上做稳相展开时 $L_{j}$ 的常数位移消失，这一点此前我只在第 36 节按"$D_{*}=0$ 情形"叙述过，数值上就是 $n_{*}=2$。

正向展开（06_oscillatory.tex:249-256）与余项：
$\int_{S^{n_{*}}}e^{irw\cdot\Delta}\psi(w)b(w)\,\mathrm{d}w=\Lambda^{-n_{*}/2}\left[e^{i\Lambda}\sum_{j=0}^{J-1}\Lambda^{-j}(L_{j}b)(e)+E_{J}\right]$，$|E_{J}|\le C_{J}\Lambda^{-J}A^{2J+d+2}$，$\Lambda=r|\Delta|$，条件是 $\Lambda\ge1$ 与 $\|b\|_{C^{m}}\le C_{m}A^{m}$。无截断版本对 $\epsilon\in\{+1,-1\}$ 求和，即 $\Lambda^{-n_{*}/2}\sum_{\epsilon}e^{i\epsilon\Lambda}\sum_{j}\Lambda^{-j}(L_{j,\epsilon}b)(\epsilon e)$。反向算子（06_oscillatory.tex:271-274）$B_{0}=L_{0}^{-1}$，$B_{j}=-L_{0}^{-1}\sum_{h=1}^{j}L_{h}B_{j-h}$，逐项：$B_{1}=-L_{0}^{-1}L_{1}B_{0}=-L_{0}^{-2}L_{1}$，$B_{2}=-L_{0}^{-1}(L_{1}B_{1}+L_{2}B_{0})=L_{0}^{-3}(L_{1}^{2}-L_{0}L_{2})$，$B_{3}=-L_{0}^{-1}(L_{1}B_{2}+L_{2}B_{1}+L_{3}B_{0})=L_{0}^{-4}(-L_{1}^{3}+2L_{0}L_{1}L_{2}-L_{0}^{2}L_{3})$；$B_{j}$ 是 $\Delta_{S^{n_{*}}}$ 的阶 $\le2j$ 多项式。稳相可用区（06_oscillatory.tex:278-281）是三条同时成立
$\Lambda\ge R^{c\sigma}$，$A^{2}/\Lambda\le R^{-c\sigma}$，$1\le A\le R^{2}$，
此时对任意给定 $T>0$ 取固定足够大的 $J$ 就有 $e^{i\Lambda}b(e)=\Lambda^{n_{*}/2}\sum_{j=0}^{J-1}\Lambda^{-j}\int e^{irw\cdot\Delta}\psi(w)(B_{j}b)(w)\,\mathrm{d}w$ 到 $O(R^{-T})$ 精度。导数配平是 $(rd_{+})^{-j}$ 付掉 $2j$ 阶符号导数，$A^{2J+d+2}$ 里的 $d+2$ 是我第一遍漏掉的加性项：它使 $J$ 的上限由 $A^{2J}\cdot A^{d+2}\le\Lambda^{J-T}$ 决定，解出 $J\ge\frac{(d+2)\log A+T\log R}{\log\Lambda-2\log A}$，分母为正的条件就是 $A^{2}/\Lambda\le R^{-c\sigma}$ 那一类。

角能量与转换权重（06_oscillatory.tex:110-140）：
$U_{X}(r,w)=\frac{1}{M_{1}(a)}\int_{X}e^{irw\cdot x}b_{x}(w)\,\mathrm{d}\rho_{1}(x)$，$V_{Y}$ 同型；
$\mathsf H^{X,Y}(a,v)=2^{d(v-a)}\int\Psi(r/2^{v})\bigl(\int_{S^{d-1}}|U_{X}|^{2}\,\mathrm{d}w\bigr)\bigl(\int_{S^{d-1}}|V_{Y}|^{2}\,\mathrm{d}w\bigr)\frac{\mathrm{d}r}{2^{v}}$；
$\Psi\ge0$ 属于 $C_{c}^{\infty}((1/4,4))$ 且在 $[1/2,2]$ 上 $\ge1$；归一化用 profile 模型质量，底层测度质量 $\rho_{1}(X)/M_{1}(a)=R^{O_{d}(\sigma)}$，不是条件概率。共享角版本 $\mathsf H_{F}^{X,Y}(a,v)$ 多一层 $\psi(w)$ 与单个内积的平方，Introduction（00_introduction.tex:185-186）写的链条是"稳相先给出角内积平方 $\mathsf H_{F}$，Cauchy--Schwarz 把它界住 $\mathsf H$"。

[推测] 双线性型这个词我在 build 目录里全文检索过：对 00 到 10 共 11 个 tex 分片 grep `bilinear`、`Sjoebelin`、`Sjoeblin`、`Sobolev`，命中 $0$ 行，因此本节标题用的"双线性换算"是我自己的说法，依据只有 $\mathsf H_{F}\to\mathsf H$ 的一次 Cauchy--Schwarz 与 10_assembly.tex:329-338 的 $2^{d(N-c)}$ 归一化。信息不足的地方在此：论文没有把任何一步命名为双线性估计，也没有给出形如 $\|T(f,g)\|$ 的双线性泛函，所以我无法确认它是否隐藏了 Sjöbelin 型（即球面 Fourier  integral 的 $L^{2}$ 加权不等式）的显式引用；能确认的是 $L_{j}$、$B_{j}$ 承担的角色正是这类计算里的微分算子演算，常数 $c_{n_{*}}=(2\pi)^{n_{*}/2}e^{-i\pi n_{*}/4}$ 的相位 $-\pi n_{*}/4$ 与 Sjöbelin 型公式里常见的 Maslov 相位一致，$n_{*}=1$ 时是 $-\pi/4$，$n_{*}=2$ 时 $-\pi/2$，$n_{*}=3$ 时 $-3\pi/4$，$n_{*}=4$ 时 $-\pi$。模长 $(2\pi)^{n_{*}/2}$ 在 $n_{*}=1,2,3,4$ 处是 $(2\pi)^{1/2}\approx2.507$、$2\pi\approx6.283$、$(2\pi)^{3/2}\approx15.749$、$(2\pi)^{2}\approx39.478$。

graph 估计（07_graph.tex:18-40）的范围条件是三条
$p-a\le v-p+2\sigma N$，$L\le v-p+2\sigma N$，$v-p\ge10\sigma N$，
支撑条件是 $b_{z}^{(j)}(w)\ne0\Rightarrow w\in G^{(j)}_{\ell_{j},[g_{j},p]}(z)$，level $\ell_{j}\in\{0,\dots,J_{0}\}$，$J_{0}=\lceil100(1/\kappa+1/\sigma)+100\rceil$。与第 6 节里 direct 步用的 $g=\max(a,p-L)$ 对齐：$a\le g<p$，$p-L\le v+\sigma N-2L\le a+\sigma N$，$g\le a+\sigma N$。$2\sigma N$ 与 $10\sigma N$ 的 $5$ 倍关系（富余 $\tfrac{L}{\sigma N}$ 项）是这条范围条件能同时容纳 $p-a$ 与 $L$ 的原因。

机器侧只到平面。取证三件：`.tools/records.txt` 里本篇对应行是
"1386 | ComparatorChallenges/PlanarFalconer.json | declaration: OAI.PlanarFalconer.mainTarget_proved | file: OAI/MeasureTheory/Falconer/Main.lean"，
`.tools/lean_queue.txt` 第 138 行是本篇目录名；comparator json 的字段是
`challenge_module` 为 ComparatorChallenges.PlanarFalconer，`solution_module` 为 OAI.MeasureTheory.Falconer.Main，`theorem_names` 只有一条 OAI.PlanarFalconer.mainTarget_proved，`definition_names` 为空数组，`permitted_axioms` 是 propext、Classical.choice、Quot.sound 三条，`enable_nanoda` 为 false。

Main.lean 的顶层定理是
theorem manuscript_main (E : Set Plane) (hE : IsCompact E) (hd : 1 < dimH E) : 0 < volume (distanceSet E)
与 theorem mainTarget_proved : MainTarget := manuscript_main。这里的门槛 $1=\dim_H$ 正是 $d=2$ 时的 $S=d/2$。可提取的显式常数集中在分离几何：
`hlo : 100 ≤ dist (Q 0).center (Q 1).center`，`hhi : dist (Q 0).center (Q 1).center ≤ 2000`，
`hsep : 90 ≤ dist z.1 z.2 ∧ dist z.1 z.2 ≤ 2010`，
以及 `(0:ℝ) < 90` 与 `(0:ℝ) < 2010` 两个 witness。四个数的关系是 $90=100-10$ 与 $2010=2000+10$，即点对距离区间由中心距离区间向两侧各扩 $10$；$10$ 我读作两个 cell 内点的半径上界之和的一半，[推测] 依据是 $Q$ 是 `NormalizedRootSetup` 给出的 cube 序列、其半径界在 Main.lean 里没有展开。Hölder 共轭对的常数是
`hp1 : 1 < 1+δ/8` 与 `hpq : (1+δ/8).HolderConjugate ((1+δ/8)/((1+δ/8)-1))`，
把第二个分量显式算出来：$p=1+\delta/8$，$p-1=\delta/8$，$q=\frac{1+\delta/8}{\delta/8}=\frac{8+\delta}{\delta}=\frac{8}{\delta}+1$；代入 $\delta=1$ 得 $(p,q)=(1.125,9)$，验算 $\frac{1}{1.125}+\frac{1}{9}=0.888\ldots+0.111\ldots=1$。$\delta\to0$ 时 $q=8/\delta+1\to\infty$，这条正是"投影到更小空间后的超临界径向可积性"在机器侧的形状：指数 $1+\delta/8$ 恒大于 $1$，共轭指数按 $8/\delta$ 发散。参数名 $\beta,\lambda,\sigma,\kappa$ 由 `exists_source_assembly_parameters` 一次给出，其条件里有 `hlamδ`、`hkapβ`、`hgap`、`hratio` 四条约束名，与 10_assembly.tex 的 $\beta,\kappa,\sigma,\omega$ 四级顺序同构但字母不同（机器侧多一个 $\lambda$、少一个 $\omega$）。shell 判据与重构分别是 `shell_criterion` 与 `two_root_has_shell_approximations`，最后用 `distanceSet_positive_of_dilate` 把 $s\cdot E$ 上的结论搬回 $E$。

模块目录 `lean/OAI/MeasureTheory/Falconer/` 的实测形状：子目录 12 个，Angular、Estimates、Fourier、Frostman、Geometry、Graphs、Incidence、Measures、Radial、Recursion、Shells、Slicing；顶层文件 5 个，Campaign123Development.lean 为 66385 字节，Campaign123PlanarFurstenbergProof.lean 为 2982 字节，DistanceSet.lean 为 2087 字节，Main.lean 为 3041 字节，Model.lean 为 368 字节。Main.lean 只 import 四个模块：Shells.TwoRootApproximations、Estimates.SourceAssemblyParameters、Frostman.NormalizedRootSetup、Shells.ShellReconstruction。[推测] 缺口在这里说清楚：机器侧的类型签名里环境是 `Plane`，$d\ge3$ 的奇偶分裂（$h=k-1$ 与 $h=k-2$ 两条路）、$\frac{(k-1)^{2}}{k}$ 天花板、以及 $K_{d}$ 孔径 $1000(d+1)<K_{d}<4000(d+1)$ 都不出现在 `theorem manuscript_main` 的假设或结论中；我只能判定"当前这一行 records 指向的定理是平面版"，判定"高维版本尚未机器化"需要遍历整个 lean 仓，那是本次取证规则禁止的，故标推测。与论文侧的对应关系有一条可以直接核对：10_assembly.tex:606-607 说 $d=2$ 的 cap 准备走 prep:integer-caps 的整数情形，机器侧的 $1<\dim_H E$ 与 $S=1$ 一致，两侧的门槛数字相同，其余 $d$ 无从比对。
