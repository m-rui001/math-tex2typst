# D123 Petty 射影体积猜想四维以上：球面核心与范数刚性的反推笔记

研究对象：`Petty's projection-volume conjecture in dimensions at least four`（日期行 `main.tex:44`，2026-09-24）。
笔头素材根目录：`E:\math\preprints\Pettys-projection-volume-conjecture-in-dimensions-at-least-four-September-24-2026\build\latex\`，分片在其 `sections\` 下，共 7 片，正文共 2130 行；机器素材：`E:\math\lean\OAI\Geometry\ProjectionBodies\`（33 个 `.lean`，13670 行），登记条目在 `E:\math\lean\formalization.yaml:1374-1376`，对照配置 `E:\math\lean\ComparatorChallenges\PettyProjectionVolume.json`。
本笔记是第一人称反推稿：按我当时真实的思路顺序写，包含走通的与走不通的分支，包含笔头与机器两侧对同一个维数下界 $4\le n$ 的不同反应。

## 1. 初始动机与最初的猜想

我的起点是那个商。$R_n(K)=\frac{\lvert \Pi K\rvert}{\lvert K\rvert^{n-1}}$（`sections/01_introduction.tex:18`），平移与可逆线性映射都不变（`sections/01_introduction.tex:20-22`，contravariance 写作 $\Pi(TK)=\lvert \det T\rvert T^{-t}\Pi K$）。Petty 的断言是对 $n\ge 3$ 说这个商只在椭球取到最小（`sections/01_introduction.tex:26-27`）。球的情况 $\Pi B_2^n=\kappa_{n-1}B_2^n$ 把候选最小值钉成 $\kappa_{n-1}^{\,n}\kappa_n^{\,2-n}$（`sections/01_introduction.tex:28-29`、`36-41`）。

我最初的猜想很朴素：这是一个 affine isoperimetric 问题，方向数据先拼成第二个体再测体积，所以应当有某条已知的 affine 表面积不等式能一口吞掉它。于是我按三条我认为最顺手的路开局。

第一条：走极体。我当时把 $R_n$ 与经典的 Petty 不等式混为一谈，试图从 $\lvert (\Pi K)^{\circ}\rvert$ 的上界反推 $\lvert \Pi K\rvert$ 的下界。这条路我很快撞墙，理由写在正文里也很直白：极体的那个不等式关的是另一个泛函（`sections/01_introduction.tex:31-33`）。更麻烦的是算术结构对不上：$(\lvert \Pi K\rvert \lvert (\Pi K)^{\circ}\rvert)^{1/n}$ 型乘积有 Blaschke--Santal\'o 的控制，但它给的是 $\lvert \Pi K\rvert$ 与 $\lvert K\rvert$ 之间的双向夹，我需要的单向下界正是被反向不等式压制的那一侧，极体化等于把问题挪到一个我完全不会证的同强度命题上。

第二条：走类归约。$R_n(\Pi K)\le R_n(K)$ 加上其等号条件把极小元归约到与 $\Pi^2K$ 位似的体（`sections/01_introduction.tex:52-55`）。我在 $\Pi^2K=cK$ 的方程上花了两周，试图借投影算子的调和结构做 Fourier 展开。这条路的真实障碍我后来才承认：它需要先把极小元的存在性和 $C^2$ 正则性建立起来，而正则性本身在这个未极化的商里我没有独立来源。

第三条：走近球刚性。Saroglou--Zvavitch 的局部极小定理要求密度经可逆线性换元后在 $L^\infty$ 里贴近球（`sections/01_introduction.tex:56-59`），Ivaki 对 $\Pi^2K=cK$ 的 $C^2$ 解做同样意味的局部刚性（`sections/01_introduction.tex:60-64`）。我一开始以为局部加紧性能拼出全局。拼不出来：定理要求的是任意凸体，连对称性和边界正则性都不假设，等号断言也是全局的、对椭球的邻近性一无所倚（`sections/01_introduction.tex:46-48`）。$L^\infty$ 邻近性在仿射归一化之后仍然无法保证，因为贴近球与否依赖于坐标选取，而坐标本身就是未知量。

我的转折点出现在把 first variation 与投影公式并排写下的那个下午：同一条测度 $\eta_K$ 同时携带两件信息，它给出的支撑泛函下界（`sections/01_introduction.tex:105-108`）与它把 $h_{\Pi K}(y)$ 表示成 $\int\lvert x\cdot y\rvert \,d\eta_K(x)$ 的固定倍数（`sections/01_introduction.tex:109-110`）。也就是说，投影体积这一属性属于正测度泛函那一层，几何体本身不带这个数。从此我不再想着体，只想着测度：问题被换成对任意两个满足同一支撑泛函条件的有界张成测度证明配对下界 $\iint\lvert x\cdot y\rvert \,d\eta(x)d\zeta(y)\ge b_n$。这是 `sections/01_introduction.tex:111-119` 那段论证梗概的来源，也是我真正开始写的地方。

最终形态与最初设想的差异，我先记在这里，后面逐条展开：我原以为会有一条单一的 convexity 论证；实际留下的是一条三段拼装的链条，测度化（第 2 到 3 节），球面符号检验与谱估计（第 4 到 6 节），半范数边界上的变分表示与仿射位置（第 7 到 10 节）。中间有一个我完全没预料到的部件：$k=1$ 与 $k=2$ 的分岔，维数 $n=4$ 与 $n\ge 5$ 使用不同的目标函数幂次（`sections/04_norm.tex:6-9`），而 $n\ge7$ 的标量证书又与 $n=4,5,6$ 用完全不同的多项式手法（`sections/04_norm.tex:261`、`335`）。

## 2. 测度化的第一步：gauge 变分引理

(a) 原文。`sections/02_gauges.tex:31-33`：`Let $s:\Sph\to(0,\infty)$ and $\phi:\Sph\to\R$ be continuous.` 结论逐字（`sections/02_gauges.tex:39-50`）：

```
 g_t(x)=\max_{v\in\Sph}\frac{x\cdot v}{s(v)+t\phi(v)},
 \qquad
 \frac{|W_t|}{\kappa_n}=\E g_t(u)^{-n}.
```
以及
```
 \left.\frac{d}{dt}\right|_{t=0}g_t(u)
 =-g_0(u)\phi\bigl(\nabla g_0(u)\bigr).
```

(b) 我补齐当时略过的中间步骤。约束 $s+t\phi$ 一致正：取 $0<m\le s\le M$，$|\phi|$ 的上界给出 $s+t\phi$ 夹在 $m/2$ 与某个 $M'$ 之间，于是 $(m/2)B_2^n\subset W_t\subset M'B_2^n$（`sections/02_gauges.tex:63-68`）。$x\in aW_t$ 当且仅当 $x\cdot v\le a(s(v)+t\phi(v))$ 对每个 $v$ 成立，取下界即最大公式。径向函数是 $1/g_t(u)$，极坐标积分把球面面积 $n\kappa_n$ 带进来，体积公式成形（`sections/02_gauges.tex:71-74`）。可微性那段我原先想用 $\partial W_0$ 的光滑性来躲，实际不需要：$g_0$ 是系数集 $\{v/s(v)\}$（紧集）上有限个线性函数之最大值，因此凸且 Lipschitz；一维有限凸函数除零测集外可微，逐坐标切片得到 $g_0$ 在 $\R^n$ 几乎处处有全部坐标偏导（`sections/02_gauges.tex:77-88`）。若 $w=v/s(v)$ 在可微点 $x$ 取到最大，则 $g_0(x+he_i)\ge g_0(x)+h w_i$ 对两个符号的 $h$ 都成立，逼出 $w_i=\partial_i g_0(x)$，最大向量唯一。唯一性再推可微性：$0\le g_0(x+z)-g_0(x)-w\cdot z\le (w_z-w)\cdot z=o(\lvert z\rvert)$（`sections/02_gauges.tex:94-97`）。不可微集按正齐次性是若干射线的并，极坐标积分说明它与 $\Sph$ 的交是 $\sigma$-零测（`sections/02_gauges.tex:98-101`）。剩下的就是把 $g_t(u)$ 的最大方向 $v_t$ 收敛到 $v_0$ 这件事用商函数对 $(u,v,t)$ 的连续可微性兑现，得到带负号的导数公式，再用差商的逐点一致界和球的夹逼做控制收敛，得到体积导数（`sections/02_gauges.tex:103-125`）。

(c) 机械理由清单。为什么幂次是 $-n$：极坐标下 $\int_{W_t}1=n\kappa_n\E\int_0^{1/g_t(u)}r^{n-1}dr=\kappa_n\E g_t^{-n}$，维数 $n$ 直接来自 $r^{n-1}$ 与 $r^n/n$ 的抵消。为什么要求 $s>0$：$s\ge m>0$ 同时给出内外球夹，它后面被反复使用（`sections/02_gauges.tex:63-68`、`sections/05_position.tex:204-207`）；若容许 $s$ 触及 $0$，$W_t$ 可能无界，gauge 可能取无限值，最大公式与体积公式同时失效。为什么 $\phi$ 可以取任意符号、可以非偶：正文强调 the argument uses neither convexity nor evenness of the function $s+t\phi$（`sections/02_gauges.tex:118-119`），因为第 9 节的变分选取要用两侧符号的 $t$ 做双侧极小，导数必须为零，并非不等式。为什么差商一致有界值得单独写一行：没有它就没有控制收敛，体积导数公式（`sections/02_gauges.tex:54-58`）在 nonsmooth 约束下就没有合法性。

(d) 我试过并放弃的路线。[推测] 第一条：先证明 $\partial W_0$ 属于 $C^2$ 再用经典 Minkowski 存在性论据。失败在 $W_0$ 由连续约束定义，多面体是合法输入，边界根本不可微；而且后面被变分的体本身就是极小元，先验正则性无从假设。[推测] 第二条：改成对径向函数 $\rho$ 做扰动，并非对支撑约束做扰动。失败原因是径向函数的扰动不保持凸性，$W_t$ 可能不再是凸体，最大公式随之失去依据。[推测] 第三条：把导数公式写成含曲率测度的形式 $\int\phi\,dS$。这条在光滑情形正确，但它把 $\nabla g_0$ 换成 Gauss 映射，正好丢掉了后面唯一需要的信息：最优点与次梯度的对应关系。gauge 语言保留的是 $\eta_K$ 的定义（`sections/02_gauges.tex:213-216`），曲率语言在 corners 处需要额外论证。

## 3. 射影测度：常数与等号信息

(a) 原文。`sections/02_gauges.tex:210-212`：`Translate and dilate a convex body $K$ so that $0\in\operatorname{int}K$ and $|K|=\kappa_n$.` 关键两式逐字（`sections/02_gauges.tex:223-235`）：

```
 h_{\Pi K}(y)=\frac{n\kappa_n}{2}
                  \int |x\cdot y|\,d\eta_K(x)
```
与
```
 \frac{n\kappa_n b_n}{2}=\kappa_{n-1}.
```

(b) 补齐。归一化概率：由 `eq:gauge-formulas` 有 $\E g_K^{-n}=1$（`sections/02_gauges.tex:239-240`）。活性向量 $v/h_K(v)$ 落在有界集，因为 $h_K$ 在球面上严格正（`sections/02_gauges.tex:241-242`）。可容性来自体积一阶变分下界：$\tau_{\eta_K}(M)=\frac1{n\kappa_n}\left.\frac{d}{dt}\right|_{0+}\lvert K+tM\rvert\ge\left(\frac{\lvert M\rvert}{\kappa_n}\right)^{1/n}$（`sections/02_gauges.tex:245-250`），等号条件继承自 Brunn--Minkowski 的位似情形（`sections/02_gauges.tex:141-143`、`177-185`）。取 $M=K$ 得 $\int h_K\,d\eta_K=1$，因为 $\lvert K+tK\rvert=(1+t)^n\kappa_n$（`sections/02_gauges.tex:251-255`）。投影公式的核心技巧是取线段 $M=[-y,y]$：$K$ 平行于 $y$ 的每一根非空纤维是紧区间，加 $t[-y,y]$ 使长度增加 $2t\lvert y\rvert$ 而不改变它在 $y^\perp$ 上的影子，Fubini 给出 $\lvert K+t[-y,y]\rvert=\lvert K\rvert+2t\lvert y\rvert\operatorname{vol}_{n-1}(\operatorname{proj}_{y^\perp}K)$（`sections/02_gauges.tex:257-266`），而线段的支撑函数正是 $x\mapsto\lvert x\cdot y\rvert$。张成性我原来准备当作技术假设，其实能被推出：满维凸体在每个方向的影子都有正的 $(n-1)$ 体积，若 $\supp\eta_K$ 不张成，取其法向 $y\ne0$ 会让 `eq:projection-measure` 右端为零而左端 $h_{\Pi K}(y)>0$（`sections/02_gauges.tex:269-274`）。球常数：$g_{B_2^n}=1$、$\nabla g_{B_2^n}(u)=u$，所以 $\eta_{B_2^n}=\sigma$，每个单位方向投影体积 $\kappa_{n-1}$，代入即 `eq:ball-constant`（`sections/02_gauges.tex:276-280`）。

(c) 机械理由。系数 $\frac{n\kappa_n}{2}$ 里的 $2$ 来自线段长度 $2t\lvert y\rvert$，$n\kappa_n$ 来自体积分化对 $t$ 求导。$b_n=\E\lvert u_1\rvert$（`sections/01_introduction.tex:176`）在此被固定下来，后面第 4 节的符号形式用 $\frac1{b_n}$ 归一（`sections/03_spherical.tex:106`），使常数函数保留为 $1$，于是 `thm:bilinear` 的下界恰好是 $b_n$ ，并非别的量。$|K|=\kappa_n$ 这一步归一化的必要性：$R_n$ 本身是尺度不变的，但 $\eta_K$ 的定义要求 $\E g_K^{-n}=1$ 才能成为概率测度（`sections/04_norm.tex:15-16` 对范数也要求同一规范化），把自由度固定成一个具体数字，后面 `eq:normalized-parameters` 的 $s_it_i\ge1$、$a_i\ge1$ 才成立（`sections/06_conclusion.tex:49-51`）。这里完全没有出现 $4\le n$：第 2、3 节在任意维都成立，维数下界是从第 5 节以后才开始咬人的。

(d) 失败路线。[推测] 我曾试着直接用表面积测度 $S_K$ 写 $h_{\Pi K}(y)=\frac12\int_{S^{n-1}}\lvert u\cdot y\rvert \,dS_K(u)$（这是第 12 节 Haddad 侧的归一化，`sections/07_consequences.tex:120-121`），再把它当概率测度用。障碍在于 $\frac12 S_K$ 的总质量是 $\frac12 S(K)$，与 $\kappa_n$ 无关，于是可容性条件 $\tau_\eta(M)\ge(\lvert M\rvert/\kappa_n)^{1/n}$ 前面会多出一个与 $K$ 相关的因子，而它并不由 $\lvert K\rvert=\kappa_n$ 控制：球的表面积是 $n\kappa_n$，任意体的表面积可大得任意离谱。gauge 坐标下的 $\eta_K$ 把表面积信息重参数化到 $\{u\}$ 上，总质量强制为 $1$，可容性才免费成立。[推测] 第二条：给 $\eta_K$ 强加对称性以便用偶函数 Fourier 理论。失败在 $\eta_K$ 一般不对称（`sections/02_gauges.tex:207` 明确 measure itself is not required to be symmetric），而且去掉对称性是让定理覆盖非中心体 $K$ 的代价；我的处理是把对称性只加在被测的 $M$ 与被展开的球面函数上，测度本身不对称由齐次延拓约定吸收（`sections/01_introduction.tex:180-182`、`sections/02_gauges.tex:17-22`）。[推测] 第三条：跳过张成性论证、把张成写进定义。这样第 3 节会短一点，但第 8 节 $q_A(y)=\int\lvert y\cdot Ax\rvert \,d\eta(x)$ 成为 $V$ 上范数这件事就变成假设，并非推导（`sections/05_position.tex:56-61`），存在性证明里的外半径界 $\max_{\Sph}g$ 与 $b_A>0$ 也随之失去根据（`sections/05_position.tex:88-92`）。

## 4. 谱隙：为什么被剥掉的是二次项

(a) 原文。`sections/03_spherical.tex:14`：`$\lambda_l=l(l+n-2)=l(l+p-1)$`。逐字引不等式（`sections/03_spherical.tex:23-27`）：

```
 \lambda_2\Var(H)+(\lambda_4-\lambda_2)\norm{QH}_2^2
 \le \E\abs{\gradS H}^2,
 \qquad \lambda_2=2n,\quad \lambda_4=4(n+2).
```

(b) 补齐。$Q$ 是向 $\mathcal H_4\oplus\mathcal H_6\oplus\cdots$ 的正交投影（`sections/03_spherical.tex:16-17`）。完备性我原本打算引用球谐基的标准定理，后来自己写了三段：先由 $\Delta_{\R^n}(\lvert x\rvert^{2j}Y_l)=2j(2l+2j+n-2)\lvert x\rvert^{2j-2}Y_l$ 归纳分解任何齐次多项式（`sections/03_spherical.tex:40-48`）；再用 Poisson 型核 $K_j(u,v)=\frac{((1+u\cdot v)/2)^j}{\int((1+u\cdot w)/2)^j\,d\sigma(w)}$ 直接在球面上造多项式逼近，尾部估计用 $\frac{1-\delta^2/4}{1-\delta^2/16}$ 的 $j$ 次幂几何衰减（`sections/03_spherical.tex:55-69`）；最后用内紧外开的正则性把连续函数逼近 $L^2$（`sections/03_spherical.tex:70-74`）。谱隙本身靠 Bessel：取 $\mathcal H_l$ 的正交基 $Y_{l,a}$，$\gradS Y_{l,a}/\sqrt{\lambda_l}$ 由分部积分正交，于是 $\E\lvert\gradS H\rvert^2\ge\sum_{l,a}\lambda_l\lvert\E(HY_{l,a})\rvert^2$，偶函数消掉奇次系数，剩下的按 $\lambda_l\ge\lambda_2$（$l\ge2$ 偶）与 $\lambda_l\ge\lambda_4$（$l\ge4$）分摊（`sections/03_spherical.tex:76-95`）。$\lambda_2=2n$、$\lambda_4=4(n+2)$ 是把 $l=2,4$ 代入 $l(l+n-2)$ 的直接结果，$d_*=\lambda_4-\lambda_2=2n+8$ 在 `sections/04_norm.tex:8` 被单独命名。

(c) 机械理由。为什么 $H$ 必须偶：奇次系数在偶函数上为零，若容许奇部，$\lambda_1=n-1$ 会插进 $\lambda_2$ 下面，谱隙的第一项就要换成 $\lambda_1$，而后面 $\mu_l$ 的单调性论证只对偶 $l$ 成立（`sections/03_spherical.tex:288-299`）。为什么 $\lambda_l$ 是 $l(l+n-2)$：把 $r^lY(u)$ 代入欧氏 Laplacian 的极坐标展开式，$r$ 方向的贡献是 $l(l+n-2)r^{l-2}Y$（`sections/03_spherical.tex:31-35`）。为什么 $n\ge4$ 在这条链上第一次显形：整个严格性论证需要 $l\ge4$ 的尾项与二次项分离，而二次项只能靠坐标选取清零（`sections/01_introduction.tex:131-133`），$l=4$ 这一档的存在性本身要 $n\ge4$ 才有非平凡含义；机器侧对应 `SphericalGap.lean:144` 的 `eigenvalue_four_le`，它只要求 `2 ≤ n`，即维数下界在这一步还宽松，收紧发生在别处。

(d) 失败路线。[推测] 我试过用 $P$（Funk 变换）的不动点理论直接构造算子，把二次项当成核空间消掉。失败在二次项根本不是符号检验算子的零特征空间，`sections/01_introduction.tex:131-132` 这句是在承认我原先的猜测是错的：$\mu_2=C_2[1+a\lambda_2]\ne0$。[推测] 第二条：试图把谱隙常数从 $\lambda_2$ 改大到 $\lambda_4$ 并宣称尾项吸收全部方差。失败在 $\Var$ 里恰恰包含 $\mathcal H_2$ 的成分，改写后不等式对二次齐次限制方向成立的那些函数反向。[推测] 第三条：绕开球谐分解，用 Logunov--Tartar 型的 Sobolev 不等式。维数依赖不对，我需要的显式常数 $2n$ 与 $2n+8$ 在这种抽象不等式里会被淹没成不可追踪的绝对常数，而第 7 节对 $c_{n,k}$ 的精确值是刚需。

## 5. 符号检验算子与它的乘子

(a) 原文。`sections/03_spherical.tex:99-102`：`For $k>0$ and an even differentiable function $f$ on $\Sph$, define`
```
 X_f(u)=f(u)u+k^{-1}\gradS f(u).
```
算子恒等式逐字（`sections/03_spherical.tex:139-144`）：
```
 \mathcal B(f_1,f_2)
 =\left\langle f_1,
   \left[C+\left(\frac{2p}{k}+\frac{p^2}{k^2}\right)(C-P)\right]
   f_2\right\rangle.
```

(b) 补齐。半球分部积分是唯一的引擎：切向投影的散度是 $-p\,u\cdot w$，在两个半球上分别积分得 `eq:hemisphere-ibp`，边界项是 $-2d_0$ 乘以赤道平均，$d_0$ 是 $u\cdot v$ 在固定 $v$ 下的零值密度，等于 $S^{n-2}$ 与 $S^{n-1}$ 面积之比（`sections/03_spherical.tex:147-160`）。把 $f=1$、$w=v$ 代入即得 $2d_0=p b_n$（`sections/03_spherical.tex:163-166`），这一式把后面所有 $d_0$ 换成 $b_n$。四项分别计算：径向--径向项是 $b_n\langle f_1,Cf_2\rangle$；两个混合项各是 $p b_n\langle f_1,(C-P)f_2\rangle$，注意每项还带外部的 $k^{-1}$；梯度--梯度项先对 $u$ 分部积分，其赤道项因 $v\cdot\gradS f_2(v)=0$ 消失，剩下 $p\iint f_1(u)\sgn(u\cdot v)u\cdot\gradS f_2(v)$，再对 $v$ 用一次同一公式得到 $p^2b_n\langle f_1,(C-P)f_2\rangle$（`sections/03_spherical.tex:168-185`）。把 $k^{-1}$ 分配回去，系数就是 $\frac{2p}{k}+\frac{p^2}{k^2}$，与 $C_l-P_l=(\lambda_l/p)C_l$ 合并成 $\mu_l=C_l\left[1+\left(\frac2k+\frac p{k^2}\right)\lambda_l\right]$（`sections/03_spherical.tex:283-287`）。乘子 $P_{2j}=(-1)^j\frac{1\cdot3\cdots(2j-1)}{p(p+2)\cdots(p+2j-2)}$ 我用高斯算：$u^\perp$ 中 $p$ 维标准高斯 $Z$ 的方向在赤道上均匀且与半径独立，极坐标积分给出 $\mathbb E Y_{2j}(Z)=p(p+2)\cdots(p+2j-2)(PY_{2j})(u)$；另一边逐单块项有 $\mathbb E Y_{2j}(Z)=\frac{(\Delta_{u^\perp})^jY_{2j}(0)}{2^jj!}$，再靠 $(\Delta_{u^\perp})^jY_{2j}=(-1)^j\partial_u^{2j}Y_{2j}$ 与 $\partial_u^{2j}Y_{2j}(0)=(2j)!Y_{2j}(u)$ 收口（`sections/03_spherical.tex:210-238`）。$C$ 的乘子从 $\lapS\lvert u\cdot v\rvert=-p\lvert u\cdot v\rvert$（赤道外）与法向导数跃度 $2d_0$ 得到 $-\lambda_l CY=p(PY-CY)$，分母 $p-\lambda_l=-(l-1)(l+p)$ 对偶 $l$ 非零（`sections/03_spherical.tex:240-252`）。

(c) 机械理由。$\frac1{b_n}$ 的归一让 $C1=1$，配合 $\mathcal B$ 的定义保证常数项贡献恰为 $(\E f_1)(\E f_2)$（`sections/03_spherical.tex:106`、`300-301`）。$k>0$ 的任意性是被保留的：系数 $\frac{2p}{k}+\frac{p^2}{k^2}$ 关于 $k$ 单调下降，$k$ 越大尾项常数 $c_{n,k}$ 越小，但 $k$ 同时决定第 7 节目标函数 $J$ 用 $\E\log g$ 还是 $\E g$（`sections/05_position.tex:19-25`），所以 $k$ 被两侧的标量不等式同时夹住，自由程度为零。$X_{g^k}(u)=g(u)^{k-1}\nabla g(u)$ 这条恒等式（`sections/03_spherical.tex:275-277`）靠 Euler 齐次恒等式 $u\cdot\nabla g(u)=g(u)$ 把径向与切向分解合并（`sections/03_spherical.tex:344-346`），它正是第 9 节变分表示要出现的向量场，于是 $\mathcal B$ 的定义有出处：它的每一项都对应配对 $\iint\lvert x\cdot y\rvert$ 在球面坐标下的一个块。光滑化那一段我一开始以为可以整段引用附录，后来发现必须写清楚：$g_\epsilon=g*\rho_\epsilon$ 不必齐次，用到的只是它在球面上的限制与切向梯度，$\gradS f_\epsilon=k g_\epsilon^{k-1}(\Id-uu^t)\nabla g_\epsilon$ 依有界收敛在 $L^2$ 收敛，而二次项消失的假设只加在极限函数 $f_1$ 上（`sections/03_spherical.tex:348-358`）。

## 6. 符号估计的收口：乘子单调与 $c_{n,k}$ 的出处

(a) 原文。`sections/03_spherical.tex:264-266`：`Let $k>0$ and let $f_1,f_2$ be even $C^1$ functions on $\Sph$. If $f_1$ has zero projection onto $\mathcal H_2$, then`
```
 \mathcal B(f_1,f_2)
 \ge (\E f_1)(\E f_2)
       -c_{n,k}\norm{Qf_1}_2\norm{Qf_2}_2.
```
常数定义逐字（`sections/03_spherical.tex:259-262`）：`c_{n,k}=\frac{1+\left(2/k+(n-1)/k^2\right)4(n+2)}{(n+1)(n+3)}$`。

(b) 补齐。我把它拆成三步重算。第一步，算子在 $\mathcal H_l$ 上的乘子是 $\mu_l=C_l\left[1+\left(\frac2k+\frac p{k^2}\right)\lambda_l\right]$，用到 $C_l-P_l=\frac{\lambda_l}{p}C_l$（`sections/03_spherical.tex:283-287`），记 $a=\frac2k+\frac p{k^2}>0$。第二步，证 $\lvert\mu_l\rvert$ 在偶 $l\ge4$ 上单调不增：由 `eq:cosine-recurrence` 有 $\frac{C_{l+2}}{C_l}=-\frac{l-1}{l+p+2}$，于是 $\frac{\lvert\mu_{l+2}\rvert}{\lvert\mu_l\rvert}=\frac{l-1}{l+p+2}\cdot\frac{1+a\lambda_{l+2}}{1+a\lambda_l}$，正文给出关键恒等式 $(l+p+2)\lambda_l-(l-1)\lambda_{l+2}=(p-1)l^2+(p^2-1)l+2(p+1)>0$（`sections/03_spherical.tex:289-292`）。我代 $l=4$、$p=3$（$n=4$）核对：$\lambda_4=4\cdot6=24$、$\lambda_6=6\cdot8=48$，左边 $9\cdot24-3\cdot48=216-144=72$，右边 $2\cdot16+8\cdot4+8=72$，吻合。再代 $l=6$、$p=7$（$n=8$）：$\lambda_6=6\cdot12=72$、$\lambda_8=8\cdot14=112$，左边 $(6+7+2)\cdot72-5\cdot112=1080-560=520$，右边 $6\cdot36+48\cdot6+16=216+288+16=520$，吻合。第一次核对这个例子时我把 $\lambda_8$ 误算成 $8\cdot13=104$，差出 $40$，说明这类手算必须逐字跟着 $\lambda_l=l(l+p-1)$ 走。第三步，$c_{n,k}$ 恰是 $\lvert\mu_4\rvert$：$C_4=-\frac1{(p+2)(p+4)}=-\frac1{(n+1)(n+3)}$（`sections/03_spherical.tex:203`），$\lambda_4=4(n+2)$（`sections/03_spherical.tex:26`），取绝对值即 `eq:tail-constant`。常数项贡献 $(\E f_1)(\E f_2)$（`sections/03_spherical.tex:300`），二次项由假设消失，剩余偶次系数由 Cauchy--Schwarz 配对（`sections/03_spherical.tex:301-303`）。

(c) 机械理由。"$f_1$ 在 $\mathcal H_2$ 上投影为零"这个假设承担了整个证明的枢纽作用：$\mu_2=C_2(1+a\lambda_2)=\frac{1+2na}{p+2}>0$，二次项若存在会以正系数同时进入 $\mathcal B$ 与被减的误差项，两边对消后严格性荡然无存；引言里那句关于二次分量不是零特征空间的自白（`sections/01_introduction.tex:131-133`）记录的正是我发现这一点的位置，清零动作在第 10 节兑现。$k$ 只通过 $a$ 进入 $c_{n,k}$，$a$ 随 $k$ 严格下降，故 $c_{n,k}$ 随 $k$ 下降；$k$ 越大尾项压得越狠，但 $k$ 同时决定第 8、9 节的目标函数与第 7 节标量不等式的可行性，于是 $k$ 被维数钉死。范数幂在 $k=1$ 端点的退化要看清：$X_{g^1}(u)=\nabla g(u)$（`sections/03_spherical.tex:275-277` 给出 $g^{k-1}\nabla g$），此时被积函数就是 $g$ 自身，切向梯度前不带 $g$ 的幂，第 7 节凸性估计的形状随之改变。`eq:norm-vector-field` 中的 $(\Id-uu^t)$ 在 Euler 恒等式之后被吸收：$\gradS(g^k)=kg^{k-1}(\Id-uu^t)\nabla g$，乘以 $k^{-1}$ 与 $g^ku$ 合并，用 $u\cdot\nabla g=g$ 得 $g^{k-1}\nabla g$（`sections/03_spherical.tex:336-346`）。这里要记一笔：$a$ 的定义在 $\mathcal B$ 里是 $\frac{2p}{k}+\frac{p^2}{k^2}$ 而 $\mu_l$ 里是 $\frac2k+\frac p{k^2}$，两者相差因子 $p$，起因是 $C_l-P_l=\frac{\lambda_l}{p}C_l$ 里除过一次 $p$（`sections/03_spherical.tex:142`、`287`），我第一次抄写时把这两个 $a$ 混用，导致 $\mu_4$ 算大了一倍。

(d) 失败路线。[推测] 第一条：指望 $C$ 是正算子从而 $\mathcal B\ge(\E f_1)(\E f_2)$。$C_2=\frac1{p+2}>0$ 而 $C_4=-\frac1{(p+2)(p+4)}<0$（`sections/03_spherical.tex:202-203`），乘子变号，正性不成立；我在这上面耗的时间主要是误以为 $\lvert u\cdot v\rvert$ 在 $n\ge3$ 上是正定核，正文 `sections/03_spherical.tex:110-115` 用 $\lvert a\rvert\ge\sgn(u\cdot v)a$ 绕开的正是这一点。[推测] 第二条：用 $I-P$ 代替 $C-P$ 以借用 Funk 谱 $P_l$。$C-P$ 的意义在于乘子恰为 $\frac{\lambda_l}{p}C_l$，与 $C$ 共用同一单调性论证；换成 $I-P$ 后 $l\ge4$ 上不再有一致上界，$c_{n,k}$ 无处可取。[推测] 第三条：令 $k\to\infty$ 使 $a\to0$、$c_{n,k}\to\frac1{(n+1)(n-1)}$。极限合法，但 $X_f$ 退化为纯径向 $f(u)u$，$\mathcal B(f_1,f_2)=\langle f_1,Cf_2\rangle$，二次项再也无法靠改 $k$ 消掉，第 10 节的场 $\mathcal F(A)$ 与第 9 节的 $g_A^{k-1}\nabla g_A$ 对应关系同时丢失。

## 7. 范数刚性：$k$ 的分岔与标量证书

(a) 原文。`sections/04_norm.tex:6-9`：

```
 k=\begin{cases}1,&n=4,\\2,&n\ge5,\end{cases}
 \qquad c=c_{n,k},\qquad d_* =\lambda_4-\lambda_2=2n+8.
```
定理主体（`sections/04_norm.tex:15-21`）：`Let $g$ be a norm on $\R^n$, where $n\ge4$, normalized by $\E g^{-n}=1$ on $\Sph$. Then`
```
 c_{n,k}\|Q(g^k)\|_2^2
 \le (\E g^k)^2-(\E g^{k-1})^2.
```
`The inequality is strict unless $g=1$ on $\Sph$.` 曲率引理（`sections/04_norm.tex:63-68`）：`For every norm $g$ on $\R^n$` 有 `$2n\Var(G(g))+d_*\|QG(g)\|_2^2 \le p\beta^2\E[gI(g)],\qquad p=n-1.$`

(b) 补齐。标量三件套（`sections/04_norm.tex:27-31`）：$e(z)=\frac{z^{-n}-1}{n}$、$M(z)=z^k-1+ke(z)$、$W(z)=z^k-z^{k-1}+e(z)$。$M'(z)=k(z^{k-1}-z^{-n-1})$ 在 $z=1$ 变号，故 $M$ 在 $(0,1)$ 降、$(1,\infty)$ 升，$M(1)=M'(1)=0$，得 $M\ge0$（`sections/04_norm.tex:32-34`）。规范化 $\E g^{-n}=1$ 使 $\E e(g)=0$，于是 $m=\E g^k-1=\E M(g)\ge0$，$\ell=\E g^{k-1}-1$，$\E W(g)=m-\ell$，$t=\E G$ 满足 $0\le t\le\beta m$（`sections/04_norm.tex:142-149`）。$I$ 由 $M'$ 平方积分得到：$I(z)=k^2\left(\frac{z^{2k-1}-1}{2k-1}-\frac{2(1-z^{k-1-n})}{n+1-k}+\frac{1-z^{-2n-1}}{2n+1}\right)$（`sections/04_norm.tex:53-58`），配上 $G'=\beta M'\mathbf 1_{\{z>1\}}$ 有 $G'^2=\beta^2I'$，且两者在 $z=1$ 处 $C^1$（`sections/04_norm.tex:60-61`）。均值范围 `eq:norm-mean-range`：$y\mapsto y^{-a/n}$ 凸，Jensen 配 $\E g^{-n}=1$ 得 $\E g^a\ge1$；再用 $z^{k-1}\le\frac{(k-1)z^k+1}{k}$，得 $0\le\ell\le\frac{k-1}{k}m$，$k=1$ 时 $\ell=0$（`sections/04_norm.tex:150-161`）。用 $Q(g^k)=QG+QD$ 与 Hilbert 型拆分 $\|u+v\|^2\le\frac{\|u\|^2}{w}+\frac{\|v\|^2}{1-w}$，加 $\|QD\|_2^2\le\Var(D)$ 与曲率引理，得 `eq:norm-reduction`：$c\|Q(g^k)\|_2^2\le\E\mathcal L(g)+c\left(\frac{2n}{wd_*}t^2-\frac{(m-t)^2}{1-w}\right)$（`sections/04_norm.tex:172-180`）。括号里的二次式对 $t$ 的导数是 $\frac{4n}{wd_*}t+\frac{2(m-t)}{1-w}\ge0$，故在 $t=\beta m$ 处最大（`sections/04_norm.tex:181-186`）。收束一步 $\frac{2k-1}{k^2}m^2\le m^2-\ell^2$ 我验算是恒等式：把 $\ell\le\frac{k-1}{k}m$ 代入，$m^2-\ell^2\ge m^2\left(1-\frac{(k-1)^2}{k^2}\right)=\frac{2k-1}{k^2}m^2$，两边同乘 $k^2$ 得 $k^2-(k-1)^2=2k-1$，恰好是 `eq:scalar-mean-bound` 右端那个数的来源（`sections/04_norm.tex:125-128`、`187-192`）。最后 $2\E W+m^2-\ell^2=2(m-\ell)+m^2-\ell^2=(1+m)^2-(1+\ell)^2=(\E g^k)^2-(\E g^{k-1})^2$（`sections/04_norm.tex:193-199`）。严格性：$g$ 不恒为 $1$ 时连续性与 `eq:scalar-pointwise` 的等号仅在 $z=1$ 给 $\E\mathcal L(g)<2\E W(g)$（`sections/04_norm.tex:200-205`）。曲率引理自身的推导只有一行实质内容：光滑情形下切空间上 Euclidean Hessian 的迹是 $\lapS g+pg$，凸性使它非负，乘 $I(g)\ge0$ 分部积分得 $\E\lvert\gradS G(g)\rvert^2=-\beta^2\E[I(g)\lapS g]\le p\beta^2\E[gI(g)]$，再套 `eq:spectral-gap`（`sections/04_norm.tex:71-83`）。

(c) 机械理由：分岔是被局部余量逼出来的。`eq:scalar-local-margin` 要求 $n+2k-1-\frac{ck^2}{1-w}>0$（`sections/04_norm.tex:243-251`）。逐个代 `eq:scalar-constants` 的表（`sections/04_norm.tex:38-43`）：
$n=4$、$k=1$、$\beta=\frac12$、$w=\frac3{14}$、$c=\frac{121}{35}$：$\frac{ck^2}{1-w}=\frac{121}{35}\cdot\frac{14}{11}=4.4$，$n+2k-1=5$，余量 $0.6=\frac35$，与 `sections/04_norm.tex:246` 一致。
$n=5$、$k=2$、$\beta=\frac23$、$w=\frac13$、$c=\frac{25+25+7}{6\cdot8}=\frac{19}{16}$：$\frac{ck^2}{1-w}=\frac{19}{16}\cdot4\cdot\frac32=\frac{57}{8}=7.125$，$n+2k-1=8$，余量 $\frac78$。
$n=6$、$k=2$、$w=\frac13$、$c=\frac{36+30+7}{7\cdot9}=\frac{73}{63}$：$\frac{ck^2}{1-w}=\frac{73}{63}\cdot4\cdot\frac32=\frac{146}{21}$，$n+2k-1=9=\frac{189}{21}$，余量 $\frac{43}{21}$。
$n\ge7$、$k=2$、$w=\frac12$：$\frac{ck^2}{1-w}=8c$，余量 $n+3-8c$；$n=7$ 时 $c=\frac{49+35+7}{8\cdot10}=\frac{91}{80}=1.1375$，余量 $10-9.1=0.9=\frac9{10}$，且 $c'(n)=-\frac{n^2+8n+13}{(n+1)^2(n+3)^2}<0$ 保证此后递增（`sections/04_norm.tex:252-257`）。
反过来试 $n=4$、$k=2$：$c$ 不变，$\frac{ck^2}{1-w}=4.4\cdot4=17.6$，$n+2k-1=7$，余量 $-10.6<0$。$k=2$ 在四维不可用与风格无关，纯粹由算术决定，这就是 `eq:k-choice` 的分岔出处。
均值界我也逐个核过：$n=4$ 时 `eq:scalar-mean-bound` 左端 $=\frac{121}{35}\left(\frac{8\cdot\frac14}{\frac3{14}\cdot16}-\frac{\frac14}{\frac{11}{14}}\right)=\frac{121}{35}\left(\frac7{12}-\frac7{22}\right)=\frac{121}{35}\cdot\frac{35}{132}=\frac{11}{12}\le1=\frac{2k-1}{k^2}$；$n=5$ 时 $=\frac{19}{16}\left(\frac{20}{27}-\frac16\right)=\frac{19}{16}\cdot\frac{31}{54}=\frac{589}{864}<\frac34$；$n=6$ 时 $=\frac{73}{63}\left(\frac45-\frac16\right)=\frac{73}{63}\cdot\frac{19}{30}=\frac{1387}{1890}<\frac34$；$n\ge7$ 时 $\frac{2n\cdot\frac49}{\frac12\cdot2(n+4)}-\frac{\frac19}{\frac12}=\frac{8n}{9(n+4)}-\frac29=\frac{2(3n-4)}{9(n+4)}$，乘 $c$ 即 `sections/04_norm.tex:224`，与 $\frac34$ 之差 $\frac{3n^3+128n^2+505n+548}{36(n+1)(n+3)(n+4)}$ 系数全正。四个数值 $\frac{11}{12},\frac{589}{864},\frac{1387}{1890}$ 与正文 `sections/04_norm.tex:218-220` 完全一致，这给我一个当时很需要的信心：$w$ 与 $\beta$ 的表是反解出来的，不是猜的。
$d_*=2n+8$ 给 $\|QG(g)\|_2^2$ 定价，与 $2n=\lambda_2$ 一起进 `eq:scalar-L` 的分母 $wd_*$（`sections/04_norm.tex:116-120`）；$w$ 与 $1-w$ 的配对只为把 $Q(g^k)=QG+QD$ 分成两块，一块用曲率、一块用方差。$I$ 的分母 $n+1-k$（`sections/04_norm.tex:56`）在两个分支各为 $4$ 与 $n-1$，均非零；$n=3$、$k=2$ 时它是 $2$，单看这里没有危险，危险在余量表与 $c_{3,2}$，详见第 13 节。

(d) 失败路线。[推测] 第一条：取 $\beta=1$ 令 $G=M$，省掉 $w$ 拆分。$D\equiv0$ 后 $\frac{2n\beta^2}{wd_*}$ 按 $\beta^2=1$ 膨胀，$n=4$ 时左端从 $\frac{11}{12}$ 跳到 $\frac{121}{35}\cdot\frac{8}{16w}$，只要 $w$ 略小于 $\frac12$ 就越界，表的平衡点落在 $\beta=\frac12$、$w=\frac3{14}$ 并非偶然。[推测] 第二条：把右端换成 $\Var(g^k)=\E g^{2k}-(\E g^k)^2$。它需要 $\E g^{2k}$ 的上界，而规范化 $\E g^{-n}=1$ 只能从负侧给幂平均控制，方向相反，Jensen 那一支（`sections/04_norm.tex:150-152`）立刻失效。[推测] 第三条：对非光滑 $g$ 直接在分布意义下用 $\lapS g+pg\ge0$ 做 $I(g)\lapS g$ 的分部积分。合法性需要局部 $W^{2,1}$；正文的替代方案是先对光滑化 $g_\varepsilon$ 做，再用 $\partial_rg_\varepsilon(u)\to\nabla g(u)\cdot u=g(u)$ 的几乎处处收敛与有界夹做控制收敛（`sections/04_norm.tex:85-110`）。我第一稿在这里漏掉 $\partial_r$ 的替换，右端留下一个凭空多出的 $\nabla g\cdot u$，量纲检查当时没救我，因为两边都是长度的一次幂。

## 8. 半范数边界：存在、唯一与秩连续

(a) 原文。`sections/05_position.tex:49-51`：`For every nonzero symmetric positive semidefinite $A$, there is a unique origin-symmetric convex body $L_A$ in $V=\range(A)$ that minimizes`。延拓约定（`sections/05_position.tex:16-18`）：`We extend its gauge to $\R^n$ by $g=g_L\circ P_V$, where $P_V$ denotes orthogonal projection onto $V$. This extension is a seminorm, with kernel $V^\perp$.` 半范数界的引擎（`sections/05_position.tex:72-74`）：`$g(u)\ge R|u\cdot e|\qquad(u\in\Sph).$`

(b) 补齐。$V$ 上的范数是 $q_A(y)=\int\lvert y\cdot Ax\rvert \,d\eta(x)$：$q_A(y)=0$ 使 $Ay$ 与 $\supp\eta$ 正交，故 $Ay=0$，而 $y\in\range A$ 逼出 $y=0$（`sections/05_position.tex:56-61`）。任何归一化竞争体 $L$ 在 $y\in L$ 上由对称性给 $q_A(y)\le\tau_A(L)=1$，于是全体有共同外半径。内半径靠 `eq:seminorm-coordinate-bound`：把 seminorm $g$ 视为紧对称集 $\{z:z\cdot y\le g(y)\ \forall y\}$ 的支撑函数（分离），该集中 Euclidean 范数最大的点 $Re$ 满足 $g(u)\ge R\lvert u\cdot e\rvert$；取对数或恒等得 $J(g)\ge\log R+\E\log\lvert u_1\rvert$（$k=1$）或 $J(g)\ge Rb_n$（$k=2$）（`sections/05_position.tex:66-82`）。$\E\lvert\log\lvert u_1\rvert\rvert^2<\infty$ 由第一坐标密度 $\propto(1-t^2)^{(n-3)/2}$ 与 $\int_0^{1/2}\lvert\log t\rvert^2dt<\infty$ 给出（`sections/05_position.tex:83-86`）。$b_A=\int\lvert Ax\rvert \,d\eta(x)>0$，$V$ 中半径 $\frac1{b_A}$ 的球是归一化竞争者，其上界 $J$ 反过来界住 $R$；一致有界加等度连续给 Arzelà--Ascoli 型子列，支撑函数一致收敛保归一化，$\log$ 情形的极限由 $\log\lvert P_Vu\rvert$ 的可积性控制（`sections/05_position.tex:88-99`）。唯一性用径函数 $\rho_i=1/g_{L_i}(P_V\cdot)$ 与 $\frac1{g_{L_t}}\ge(1-t)\rho_0+t\rho_1$，$-\log\rho$ 与 $\frac1\rho$ 都严格凸且递减，两个不同体的径函数在 $V$ 上一开集方向不同，投影后仍是正球面测度集（`sections/05_position.tex:101-115`）。
秩连续我重写过。链条：$b_j\to b>0$；归一化球界住 $R_j$ 上方，$1\ge\frac{b_j}{R_j}$ 界住下方；$g_j$ 的 Lipschitz 常数一致，任一子列有 seminorm 极限 $g$；`eq:objective-limit` 在 $k=2$ 立得，$k=1$ 要 $\log g_j$ 一致可积，正部一致有界、负部平方积分一致有界（旋转不变性加 $\E\lvert\log\lvert u_1\rvert\rvert^2<\infty$），先截断到 $-M$ 再令 $M\to\infty$，弃去积分一致 $O(M^{-1})$（`sections/05_position.tex:209-225`）。识别极限：$Z=\{g\le1\}$、$Z_j=\{g_j\le1\}$，$h_Z(Ax)\le\liminf_jh_{Z_j}(A_jx)$ 由 $g(y)<1$ 时 $y\in Z_j$（大 $j$）与取上确界得到（`sections/05_position.tex:227-235`），$Z_j=L_{A_j}+V_j^\perp$ 与 $A_jx\in V_j$ 说明可用 $L_{A_j}$ 的支撑函数，非负性使 Fatou 给出 `eq:cylinder-normalization`。$L_0=\overline{P_VZ}$ 有界源自 $q_A(P_Vz)=\int\lvert z\cdot Ax\rvert \,d\eta(x)\le\int h_Z(Ax)\,d\eta(x)\le1$（`sections/05_position.tex:243-250`）。反向比较取 $N_R=L_A+RB_{V^\perp}$，则 $\tau_A(N_R)=1$ 且 $g_{N_R}=\max\{g_A,\lvert P_{V^\perp}u\rvert/R\}\downarrow g_A$（`sections/05_position.tex:269-274`），得 $J(g)\le J(g_A)$；又 $c_0\bar g$ 是归一化体 $L_0/c_0$ 的延拓 gauge 且 $c_0\bar g\le g$，夹出 $J(g_A)\le J(c_0\bar g)\le J(g)\le J(g_A)$，被积函数严格增逼 $c_0\bar g=g$，唯一性收口（`sections/05_position.tex:281-290`）。

(c) 机械理由。$J$ 的两个分支是绑定的选择：`sections/05_position.tex:28-30` 写明选它们是为了让 Wulff 一阶变分带出 $g^{k-1}\nabla g=X_{g^k}$，即第 6、7 节的 $k$ 在此被同一个要求钉住；$k=1$ 时权为 $g^0=1$，$k=2$ 时权为 $g$。半范数的核 $V^\perp$ 是球面零测集，所以 $\log$ 在核外积分良定义（`sections/05_position.tex:26-27`），这是允许 $A$ 奇异的技术前提，没有它第 10 节的紧域讨论就无从谈起。$\mathcal A=\{A=A^t\ge0:\tr A=1\}$（`sections/05_position.tex:186-188`）钉掉尺度自由度；$g_{aA}=ag_A$（`sections/05_position.tex:394-401`）说明未归一化时整体缩放只改 $\log$ 一个加数或线性目标的一个因子，极小元随之对应。齐次缩放的另一处体现是 $\tau_{aA}(L/a)=\tau_A(L)$（`sections/05_position.tex:398-399`），它把 $A$ 的尺度与体的尺度耦合起来，从而 $a=(\det A)^{-1/n}$ 的归一化不破坏二次分量消失（`sections/04_norm.tex` 之外的唯一行列式条件出现在 `sections/05_position.tex:402-403`）。$n\ge4$ 在本节没有独立出现，存在性、唯一性、连续性对 $n\ge2$ 都成立；第 13 节会看到机器侧同样把这条链的维数假设写得比 $4$ 弱。

(d) 失败路线。[推测] 第一条：只在正定 $A$ 上做变分，把奇异边界留给极限。第 10 节需要 $\mathcal F$ 在整个紧凸集 $\mathcal A$ 上连续，而 $\partial\mathcal A$ 由奇异矩阵组成；缺 `lem:matrix-continuity` 时 Brouwer 的映射前提不闭合，我原先想用"内部不动点"回避，结果连不动点是否存在都说不清。[推测] 第二条：用 $L^p$ 收敛代替 Fatou 来识别 $\lim_jZ_j$。$Z_j$ 的维数随 $\range(A_j)$ 跳变，$L^p$ 没有几何意义；正文改成对支撑函数取逐点 $\liminf$ 再 Fatou，单边条件恰好够用（`sections/05_position.tex:236-241`）。[推测] 第三条：把一致可积换成 $\sup_j\E\lvert\log g_j\rvert^{1+\delta}<\infty$。$g_j$ 贴近奇异 seminorm 时，负尾部只由坐标密度 $(1-t^2)^{(n-3)/2}$ 控制到平方对数可积，多一丁点矩都要失败；正文的 $O(M^{-1})$ 截断论证已经贴着边界走（`sections/05_position.tex:218-225`）。

## 9. 变分表示：把支撑泛函换成向量场

(a) 原文。`sections/05_position.tex:119-121`：`Suppose $A$ is positive definite, and let $L$ be any positive dilate of $L_A$, with gauge $g=g_L$. For every continuous even function $\phi:\R^n\to\R$ that is positively homogeneous of degree one,`
```
 \int\phi(Ax)\,d\eta(x)
 =s\,\E\phi\bigl(X_{g^k}(u)\bigr),
 \qquad
 s=\frac{\tau_A(L)}{\E g^{k-1}}.
```
配套恒等式（`sections/05_position.tex:129-131`）：`X_{g^k}=g^ku+g^{k-1}\gradS g=g^{k-1}\nabla g`。

(b) 补齐。归一化改写：极小化 $\tau_A(L)=1$ 下的 $J$，等价于对全体对称体极小化 $J(\tau_A(L)g_L)$（`sections/05_position.tex:135-136`）。取 $W_t=\{y:y\cdot v\le h_L(v)+t\phi(v)\ \forall v\}$，`lem:gauge-variation` 适用，因为它对约束函数没有任何附加要求。记 $I=\int\phi(Ax)\,d\eta(x)$。关键单边估计：约束 $h_L+t\phi$ 逐点上界了真实支撑函数，故 $\tau_A(W_t)\le\tau+tI$（`sections/05_position.tex:144-150`），而 $J$ 随正 gauge 逐点增大而增大，极小性给出 `eq:wulff-minimum`：$J((\tau+tI)g_t)\ge J(\tau_A(W_t)g_t)\ge J(\tau g)$，$t=0$ 处取等（`sections/05_position.tex:151-158`）。左侧在 $t=0$ 是双侧极小，导数为零。用 `eq:gauge-derivative` 即 $\left.\frac{d}{dt}\right|_0g_t=-g\phi(\nabla g)$，$k=1$ 得 $\frac I\tau=\E\phi(\nabla g)$，$k=2$ 得 $I\E g=\tau\E[g\phi(\nabla g)]$，统一为 $\frac I\tau=\frac{\E[g^{k-1}\phi(\nabla g)]}{\E g^{k-1}}$（`sections/05_position.tex:160-177`）。Euler 恒等式把分子写成 $\E[\phi(g^{k-1}\nabla g)]=\E[\phi(X_{g^k})]$（$\phi$ 一次齐次），分母即 $\E g^{k-1}$，于是 `eq:representation` 成形（`sections/05_position.tex:178-182`）。我补写的一处：$\tau+tI>0$ 对小 $|t|$ 成立要用 $\tau>0$，后者来自 $\eta$ 张成与 $A$ 正定，$\tau_A(L)=\int h_L(Ax)\,d\eta(x)>0$ 因 $h_L$ 在球面严格正。

(c) 机械理由。$\phi$ 的三个条件各有出处：连续保证 `lem:gauge-variation` 里的 $s=h_L$、$\phi=\phi$ 可用；偶性保证它像支撑函数那样对称（否则 $W_t$ 的对称性会被破坏，而 $L$ 在 $V$ 中要求 origin-symmetric）；一次正齐次保证 $\phi(\nabla g)$ 有意义（$\nabla g$ 不在球面上，其模为 $g$ 相关量），并让 $\E[\phi(X_{g^k})]$ 里的 $g^{k-1}$ 幂次与 $\phi$ 合成齐次 $k$，与第 6 节的 $X_{g^k}$ 完全对齐。系数 $s=\frac{\tau_A(L)}{\E g^{k-1}}$ 的形式说明这个表示是带尺度损失的：$\phi$ 是一次齐次而 $X_{g^k}$ 是 $k$ 次齐次的 gauge 场，两侧只能用 $g^{k-1}$ 的均值来校准。第 11 节里 $s$ 与 $t_i=\E g_i^{k-1}$、$a_i=s_i\E g_i^k$ 一起被复用（`sections/06_conclusion.tex:42-46`），正是这里埋下的三个量。$L$ 取 $L_A$ 的任一正倍份不影响结论（`sections/05_position.tex:119-120`），因为 $\tau_A$ 与 $\E g^{k-1}$ 同按 $a$ 缩放，$s$ 不变而 $g$ 缩放使 $X_{g^k}$ 按 $a^{k-1}$ 缩放，$\phi$ 按 $a$ 缩放，两侧同步。

(d) 失败路线。[推测] 第一条：直接引用 $L_p$ dual Minkowski 问题的存在唯一性与正则性（`sections/05_position.tex:32-42` 提到的框架，$q=1-k$，与 Huang--Zhao、Huang--Lutwak--Yang--Zhang、Wang--Zhou 的对应）来得到 $L$ 的光滑性，然后用古典变分公式。密度假设与我的 $\eta$ 冲突：$\eta_K$ 可以带原子（`sections/05_position.tex:44-46` 明说 measures may have atoms），带原子时极小体必有 corner，支撑函数不可微，经典对偶 Minkowski 的表示式需要密度关于 $\sigma$ 绝对连续。[推测] 第二条：只用一侧 $t>0$ 的极小，得到不等式形式的表示再加紧。这样拿到的是 $\le$ 与 $\ge$ 两条单边关系，中间尺度 $s$ 无法确定，第 11 节误差吸收 $s_i^2c\|Qf_i\|_2^2\le a_i^2-1$ 会失去等号信息，等号刚性（第 11 节 (b) 后半）当场断掉。[推测] 第三条：把 $\phi$ 取成 $\lvert x\cdot y\rvert$ 之外的非齐次试验函数以直接逼近 $h_{\Pi K}$。$|x\cdot y|$ 是一次齐次的，勉强够用，但任何带截断的试验函数都不满足 $\phi(Ax)$ 与 $\E\phi(X_{g^k})$ 之间的齐次匹配，$s$ 的定义失去意义。

## 10. 仿射位置：向内指的场与一个不动点

(a) 原文。`sections/05_position.tex:326-328`：`There is a symmetric positive definite matrix $A$ with $\det A=1$ such that $g_A^k$ has zero component in $\mathcal H_2$.` 场的定义（`sections/05_position.tex:333-336`）：

```
 \mathcal F(A)
 =\frac{\E[g_A(u)^k uu^t]}{\E g_A^k}-\frac1n\Id.
```
核块计算逐字（`sections/05_position.tex:356-359`）：`$\left.\mathcal F(A)\right|_{\Ker A}
 =-\frac{k}{n(n+k)}I_{\Ker A}.`

(b) 补齐。连续性来自 `lem:matrix-continuity`，分母 $\E g_A^k>0$ 因 $g_A$ 非零 seminorm（`sections/05_position.tex:337-338`）。核块：取 $A$ 奇异、$e\in\Ker A$ 单位。$g_A(Y)$ 只依赖 $P_{\range A}Y$，与 $Y\cdot e$ 独立，标准高斯 $Y$ 的径向与角向变量分离给
$\frac{\E[g_A(u)^k(u\cdot e)^2]}{\E g_A^k}=\frac{\mathbb E[g_A(Y)^k(Y\cdot e)^2]}{\mathbb E g_A(Y)^k}\cdot\frac{\mathbb E\lvert Y\rvert^k}{\mathbb E\lvert Y\rvert^{k+2}}=\frac1{n+k}$
（`sections/05_position.tex:346-352`）。我核对这一步：$g_A$ 与 $(\cdot\cdot e)^2$ 分别 $k$ 次与 $2$ 次齐次，故 $\mathbb E[g_A(Y)^k(Y\cdot e)^2]=\mathbb E\lvert Y\rvert^{k+2}\E[g^k(u)(u\cdot e)^2]$，$\mathbb Eg_A(Y)^k=\mathbb E\lvert Y\rvert^k\E g^k(u)$，两式相除正是左边的比，所以正文的因子拆分是恒等变形，并非近似；剩下 $\mathbb E(Y\cdot e)^2=1$ 使第一个因子为 $1$，第二个因子 $\frac{\mathbb E|Y|^k}{\mathbb E|Y|^{k+2}}=\frac1{n+k}$ 由 $\int_0^\infty r^{n+k-1}e^{-r^2/2}dr$ 分部积分（$\mathbb E|Y|^{m+2}=(m+n)\mathbb E|Y|^{m}$ 型递推，$m=k$ 给 $n+k$）（`sections/05_position.tex:353-354`）。对 $\Ker A$ 作极化得到 `eq:kernel-field`，因为 $\mathcal F$ 在该子空间上的限制由二次型 $(u\cdot e)^2$ 的值确定，而 $\frac1{n+k}-\frac1n=-\frac{k}{n(n+k)}$。range--kernel 交叉块为零靠反射：把全部核坐标取反保持 $g_A$、反转每个混合积（`sections/05_position.tex:360-362`）。于是 $A-\epsilon\mathcal F(A)$ 在核块上加了 $\epsilon\frac{k}{n(n+k)}I$、在 range 上是正定扰动、交叉块为零，小 $\epsilon$ 下正定，迹仍为 $1$（`sections/05_position.tex:363-367`）。映射 $A\mapsto\operatorname{proj}_{\mathcal A}(A-\mathcal F(A))$ 由 `lem:fixed-point` 有不动点 $A$；最近点条件 $\langle\mathcal F(A),B-A\rangle\ge0$ 对所有 $B\in\mathcal A$ 成立（`sections/05_position.tex:375-380`），取 $B=A-\epsilon\mathcal F(A)$ 得 $-\epsilon\tr(\mathcal F(A)^2)\ge0$，故 $\mathcal F(A)=0$；再由 `eq:kernel-field` 知奇异矩阵上 $\mathcal F$ 在核块非零，排除奇异，$A$ 正定（`sections/05_position.tex:381-384`）。最后，$\mathcal F(A)=0$ 逐条分量给出 $\E[g_A(u)^ku^tHu]=0$ 对每个对称无迹 $H$，而 $\Delta(x^tHx)=2\tr H$ 说明这些二次型恰是 $\mathcal H_2$（`sections/05_position.tex:386-392`）。$g_{aA}=ag_A$ 与 $a=(\det A)^{-1/n}$ 完成行列式归一（`sections/05_position.tex:394-403`）。
`lem:fixed-point` 本身的证明我照抄了它到单纯形的归约：最近点投影 $\pi$ 由平方距离沿段的严格凸而唯一，两次应用得 $\lvert\pi(x)-\pi(y)\rvert^2\le\langle x-y,\pi(x)-\pi(y)\rangle$，故 $\pi$ 连续；$G=T\circ\pi:\Delta\to\Delta$，Brouwer 给 $v=G(v)\in D$，于是 $T(v)=v$（`sections/05_position.tex:298-324`）。

(c) 机械理由。$\tr A=1$ 的选择让 $\mathcal A$ 成为紧凸集且含奇异点，$\frac1n\Id$ 的出现与迹归一配套：$\tr\E[g^k uu^t]/\E g^k=\E g^k\cdot\frac1n/\E g^k=\frac1n$，由 $\E\lvert u\rvert^2=1$ 与各向同性，所以 $\mathcal F(A)$ 自动无迹，落进 $\mathcal A$ 的线性张成里，最近点投影才有意义。$\frac1{n+k}$ 里的 $k$ 是齐次次数带来的：$g^k$ 是 $k$ 次、$(u\cdot e)^2$ 是 $2$ 次，高斯径向矩比给出 $n+k$ ，并非 $n$，$-\frac{k}{n(n+k)}$ 的负号因此是尺度不匹配的产物，正是它保证扰动方向向内。$n\ge4$ 在本节仍未直接出现，但 $\mathcal H_2$ 的非平凡性（存在无迹对称 $H$）要求 $n\ge2$，而第 6 节要求把 $f_1$ 的二次分量清零这一条件在此被兑现；`sections/01_introduction.tex:131-133` 的自白至此闭环。$\det A=1$ 的必要性在第 11 节：它保证 $h_M(Tx)=h_{T^tM}(x)$ 之后 $\lvert T^tM\rvert=\lvert M\rvert$，两个测度的可容性同时保持（`sections/06_conclusion.tex:28-33`）。

(d) 失败路线。[推测] 第一条：用矩阵对数空间上的梯度流代替不动点。$\mathcal A$ 的内部（正定迹一）是凸的但不是群，$\mathcal F$ 的向内性在边界上只是半定向的，流可能撞到边界而无处继续，而且撞上去之后 $g_A$ 变 seminorm，$\log$ 目标的正则性我控制不住。[推测] 第二条：只在正定锥内部找零点，把 $A$ 的限制写成 $\det A=1$。这样定义域非紧，`lem:fixed-point` 不适用；正文用 $\tr A=1$ 换到紧域，最后再用 $g_{aA}=ag_A$ 把行列式调回 $1$，这个次序我起初写反了，导致 $a$ 的选取破坏 $\tr A=1$。[推测] 第三条：把 $\mathcal F$ 换成 $\E[g^k uu^t]-\frac{\E g^k}{n}\Id$ 并宣称两者等价。它们只差一个正因子 $\E g^k$，在 $\mathcal A$ 的最近点条件下方向不同，向内性证明里 $\frac1{n+k}$ 的计算依赖归一化后的比值，未归一化版本给出的核块是 $-\frac{k\,\E g^k}{n(n+k)}$，扰动幅度与 $\epsilon$ 的选取需重新校准，而正文的写法使 $\mathcal F$ 的尺度与 $A$ 的尺度一致。

## 11. 双线性不等式与等号刚性

(a) 原文。`sections/06_conclusion.tex:9-13`：`Let $\eta,\zeta$ be finite positive measures on $\R^n$ with bounded, spanning support. Suppose that both satisfy \eqref{eq:functional-condition}. Then`
```
 \iint |x\cdot y|\,d\eta(x)d\zeta(y)\ge b_n.
```
等号吸收链的核心逐字（`sections/06_conclusion.tex:77-80`）：`$s_i^2c\norm{Qf_i}_2^2
 \le a_i^2-s_i^2t_i^2\le a_i^2-1.$`

(b) 补齐。位置：对 $\eta$ 用 `prop:position` 得正定 $A$、$\det A=1$；把 $\eta$ 换成 $A$ 的像测度、$\zeta$ 换成 $A^{-1}$ 的像测度，配对不变因为 $(Ax)\cdot(A^{-1}y)=x\cdot y$，可容性不变因为 $h_M(Tx)=h_{T^tM}(x)$ 与 $\lvert T^tM\rvert=\lvert M\rvert$（`sections/06_conclusion.tex:23-33`）。第一个像测度在恒等矩阵处的支撑泛函正是原来的 $\tau_A$，故其唯一极小体是 $L_A$，二次分量已由 `prop:position` 清零（`sections/06_conclusion.tex:35-38`）。两个测度各取极小体并把体缩到体积 $\kappa_n$，得 gauge $g_1,g_2$，令 $f_i=g_i^k$、$t_i=\E g_i^{k-1}$、$s_i=\frac{\tau_i(L_i)}{t_i}$、$a_i=s_i\E f_i$（`sections/06_conclusion.tex:41-46`）。三条规范化事实 `eq:normalized-parameters`：$\E g_i^{-n}=1$ 来自体积缩到 $\kappa_n$ 后 gauge 的规范化；$s_it_i=\tau_i(L_i)\ge1$ 是可容性用在 $L_i$ 上（$\lvert L_i\rvert=\kappa_n$）；$a_i\ge1$ 在 $k=1$ 因 $\E g_i\ge1=t_i$、在 $k=2$ 因 $\E g_i\ge1$ 与 $\E g_i^2\ge(\E g_i)^2\ge\E g_i=t_i$（`sections/06_conclusion.tex:50-54`）。
把 `eq:representation` 先后用于两个变量，$\phi(x)=\lvert x\cdot y\rvert$ 与随后的 $\phi(y)=\lvert X_{f_1}(u)\cdot y\rvert$ 都是偶的连续齐次试验函数，故适用（`sections/06_conclusion.tex:58-61`）：$\iint\lvert x\cdot y\rvert \,d\eta\,d\zeta=s_1s_2\iint\lvert X_{f_1}(u)\cdot X_{f_2}(v)\rvert \,d\sigma(u)d\sigma(v)\ge b_ns_1s_2\mathcal B(f_1,f_2)$，末一步用 $\lvert a\rvert\ge\sgn(u\cdot v)a$（`sections/06_conclusion.tex:61-68`）。`prop:sign-estimate` 与 `thm:norm-estimate` 合起来：$b_n^{-1}\iint\lvert x\cdot y\rvert \,d\eta\,d\zeta\ge a_1a_2-s_1s_2c\lVert Qf_1\rVert_2\lVert Qf_2\rVert_2\ge a_1a_2-\sqrt{(a_1^2-1)(a_2^2-1)}\ge1$，最后一步靠 $(a_1a_2-1)^2-(a_1^2-1)(a_2^2-1)=(a_1-a_2)^2\ge0$ 与 $a_1a_2-1\ge0$（`sections/06_conclusion.tex:70-89`）。我验算这个恒等式：展开左端 $a_1^2a_2^2-2a_1a_2+1-a_1^2a_2^2+a_1^2+a_2^2-1=(a_1-a_2)^2$ ✓。
等号：若两个 $a_i$ 都大于 $1$，则误差积严格小于平方根，矛盾；若恰一个大于 $1$，误差积为零而 $a_1a_2>1$，也矛盾；故 $a_1=a_2=1$（`sections/06_conclusion.tex:91-98`）。$a_1=1$ 给 $\E g_1^k\le\E g_1^{k-1}$，$k=1$ 时逼 $\E g_1=1$ 与负幂均值等号，$g_1=1$；$k=2$ 时用链 $1\le\E g_1\le(\E g_1)^2\le\E g_1^2\le\E g_1$（`sections/06_conclusion.tex:99-106`），我核对 $(\E g_1)^2\le\E g_1^2$ 是 Cauchy--Schwarz、$\E g_1^2\le\E g_1$ 来自 $a_1=s_1\E g_1^2=1$ 与 $s_1\ge\frac1{\E g_1}$，链两端都是 $1$ 故全等号，$g_1$ 常量、再由 $\E g_1^{-n}=1$ 得 $g_1=1$。于是 $s_1=1$，变换后的第一个测度在 $B_2^n$ 上让可容性取等； undo 变换后原测度在 $A^tB_2^n$ 上取等，那是体积 $\kappa_n$ 的中心椭球（`sections/06_conclusion.tex:106-110`）。
主定理：归一 $\lvert K\rvert=\kappa_n$，$r=\left(\frac{\lvert\Pi K\rvert}{\kappa_n}\right)^{1/n}$、$D=\frac1r\Pi K$，则 $\lvert D\rvert=\kappa_n$、$\eta_D$ 可容且 $\int h_D\,d\eta_D=1$（由 $D+tD=(1+t)D$ 的体积导数）。用 `eq:projection-measure`：$h_D(y)=\frac{n\kappa_n}{2r}\int\lvert x\cdot y\rvert \,d\eta_K(x)$，对 $\eta_D$ 积分并对 $y$ 取 $h_D$ 得 $1=\frac{n\kappa_n}{2r}\iint\lvert x\cdot y\rvert \,d\eta_K(x)d\eta_D(y)\ge\frac{n\kappa_nb_n}{2r}$（`sections/06_conclusion.tex:113-134`）。由 `eq:ball-constant` 得 $r\ge\kappa_{n-1}$，即 $\lvert\Pi K\rvert\ge\kappa_n\kappa_{n-1}^n$。解除归一化的算术我补了一遍：设 $\lvert K\rvert=V$，取 $a=(\kappa_n/V)^{1/n}$，则 $\lvert\Pi(aK)\rvert=a^{n(n-1)}\lvert\Pi K\rvert$（因 $\Pi(aK)=a^{n-1}\Pi K$ 再取 $n$ 次体积），故 $\lvert\Pi K\rvert\ge a^{-n(n-1)}\kappa_n\kappa_{n-1}^n=(V/\kappa_n)^{n-1}\kappa_n\kappa_{n-1}^n$，除以 $V^{n-1}$ 得 $R_n(K)\ge\kappa_n^{2-n}\kappa_{n-1}^n$ ✓ 与 `eq:main` 一致。等号反向：$K$ 平移加可逆线性像不改变商，$\Pi(TK)=\lvert\det T\rvert T^{-t}\Pi K$ 与 $\lvert\Pi(TK)\rvert=\lvert\det T\rvert^{n-1}\lvert\Pi K\rvert$ 的指数 $n-1$ 恰好来自 $(\lvert\det T\rvert^{n-1})^{n}/\lvert\det T\rvert^{n(n-1)}$ 的抵消（`sections/06_conclusion.tex:146-158`），球的情形 $\Pi B_2^n=\kappa_{n-1}B_2^n$ 收尾。

(c) 机械理由。$b_n$ 作为下界的数值是"$\eta=\zeta=\sigma$"情形的直接结果，配对 $\iint\lvert x\cdot y\rvert \,d\sigma(x)d\sigma(y)=b_n$ 因为 $\int\lvert x\cdot y\rvert \,d\sigma(x)=b_n\lvert y\rvert$（`eq:ball-constant` 的另一面），所以 `thm:bilinear` 是锐的，且这个锐性与 $a_1a_2-\sqrt{(a_1^2-1)(a_2^2-1)}\ge1$ 的代数形式吻合，$(1,1)$ 处取等。$s_i$ 与 $a_i$ 分开的必要性：$s_i$ 管向量场的尺度（第 9 节的表示常数），$a_i$ 管球面均值的尺度，`thm:norm-estimate` 的左端带 $s_i^2$、右端带 $a_i^2$，二者之差 $a_i^2-s_i^2t_i^2$ 正是 $s_i^2\left((\E f_i)^2-t_i^2\right)$，即第 7 节右端的 $(\E g^k)^2-(\E g^{k-1})^2$ 乘上 $s_i^2$，这一步我最初抄漏 $s_i^2$，导致量纲对不上。$\dim$ 下界 $4$ 在此只通过 $c=c_{n,k}$ 与第 7 节的严格性进入，第 11 节自身的代数对任意 $c>0$ 成立。齐次缩放在这里第三度出现：$\Pi(aK)=a^{n-1}\Pi K$ 是 $h_{\Pi K}$ 一次齐次与体在 $u^\perp$ 上 $(n-1)$ 维的乘积效果。

(d) 失败路线。[推测] 第一条：对两个测度同时施加 `prop:position`。两个不同的 $A$ 无法同时对角化同一个配对：对 $\eta$ 用 $A$、对 $\zeta$ 用 $B$ 会破坏 $(Ax)\cdot(By)=x\cdot y$ 除非 $B=A^{-t}$，而 $A^{-t}$ 未必把 $\zeta$ 的二次分量清零。正文只处理一个测度，另一个按 contra-gradient 变换，这是 `sections/01_introduction.tex:138-140` 那句"只需要一个测度的位置"的具体含义。[推测] 第二条：跳过 $a_i\ge1$、直接用 $a_i^2-1\ge a_i^2-s_i^2t_i^2$ 的另一侧。$s_it_i\ge1$ 与 $a_i\ge1$ 是两条独立信息，我一度以为前者蕴含后者；$k=2$ 时 $a_i=s_i\E g_i^2$ 与 $s_it_i=s_i\E g_i$ 之比是 $\frac{\E g_i^2}{\E g_i}\ge1$，需要 $\E g_i\ge1$，而这来自负幂规范化，去掉 $|K|=\kappa_n$ 就断。[推测] 第三条：把等号论证换成"极小序列紧性加 Euler--Lagrange"。极小序列的 gauge 极限 $g$ 满足表示式，但我需要的是 $g=1$ 的定量结论，靠 $1\le\E g\le(\E g)^2\le\E g^2\le\E g$ 这种夹逼才免掉正则性；变分路线又会要求 $L$ 边界光滑，绕回第 9 节 (d) 第一条的障碍。

## 12. 推论链：与三维结果拼装后的三处落地

(a) 原文。`sections/07_consequences.tex:31-34`：`Let $n\ge3$ and $1\le i\le n-1$ be integers, and let $K\subset\R^n$ be a convex body with nonempty interior.` 断言主体 `eq:lutwak-petty` 在 `sections/07_consequences.tex:35-46`；仿射 Sobolev 逐字（`sections/07_consequences.tex:97-101`）：

```
 \mathcal D_n(f_1,\ldots,f_n)
 \ge n!\,\kappa_{n-1}^{\,n}\kappa_n^{\,2-n}
       \prod_{i=1}^n\norm{f_i}_q.
```
Holmes--Thompson 逐字（`sections/07_consequences.tex:216-221`）：`$\mathcal A_B(\partial C)^n
 \ge n^n\kappa_n\,\mathcal V_B(C)^{n-1}.$` 与 `Equality holds if and only if $B$ is an ellipsoid and $C=x+tB$.`

(b) 补齐。低次投影体：Steiner 归一 $V_j(B_2^m)=\binom mj\frac{\kappa_m}{\kappa_{m-j}}$ 与 $\Pi_iB_2^n=V_i(B_2^{n-1})B_2^n$（`sections/07_consequences.tex:60-64`），$V_{i+1}$ 的 $(i+1)$ 次齐性给出常数。我验算 $i=n-1$ 端：$\frac{(\binom{n-1}{n-1}\frac{\kappa_{n-1}}{\kappa_0})^{n}}{(\binom{n}{n}\frac{\kappa_n}{\kappa_0})^{n-2}}=\frac{\kappa_{n-1}^n}{\kappa_n^{n-2}}=\kappa_{n-1}^{\,n}\kappa_n^{\,2-n}$，与 `eq:main` 常数相同 ✓（$\kappa_0=1$ 在 `sections/07_consequences.tex:18` 声明）。新增范围是 $2\le i\le n-2$、$n\ge4$（`sections/07_consequences.tex:69-76`），且这里只借 Lutwak 条件结果的"不等式结论"，等号分类不作断言（`sections/07_consequences.tex:66`、`75-76`）。
仿射 Sobolev：Haddad 的 $\frac1{n!}\widetilde I_1(K_1,\ldots,K_n)=V(\Pi K_1,\ldots,\Pi K_n)\ge\prod\lvert\Pi K_i\rvert^{1/n}$ 配 Petty 下界得 $\widetilde I_1\ge n!c_n\prod\lvert K_i\rvert^{(n-1)/n}$（`sections/07_consequences.tex:124-138`），再经其 Lemma 5.1 与 (18)-(21) 的等价性搬到 $\mathcal D_n$，端点 $p=1$ 的归一化 weak profile 是 $\mathbf1_K$ 且 $\lVert\mathbf1_K\rVert_q=\lvert K\rvert^{(n-1)/n}$（`sections/07_consequences.tex:140-149`）。锐性用椭球指示函数的光滑化 $f_j\to\mathbf1_E$ 于 $BV$ 与 $L^q$，测度 $\nu_j$ 由 $\nabla f_j$ 的方向与其模长 push-forward 定义，Reshetnyak 连续性给 $\nu_j\rightharpoonup S_E$，于是 $\mathcal D_n(f_j,\ldots,f_j)\to\widetilde I_1(E,\ldots,E)=n!\lvert\Pi E\rvert$（`sections/07_consequences.tex:154-175`）。对角情形与 Zhang 的比较用 $Z_f$ 与 Blaschke--Santal\'o（`sections/07_consequences.tex:180-197`）。
Holmes--Thompson：$\mathcal A_B(\partial C)=nV(C[n-1],I_B)$、$I_B=\Pi(B^\circ)/\kappa_{n-1}$、$\mathcal V_B(C)=\frac{\lvert B^\circ\rvert}{\kappa_n}\lvert C\rvert$。Minkowski 混合体积不等式给 $\frac{\mathcal A_B^n}{\mathcal V_B^{n-1}}\ge n^n\frac{\kappa_n^{n-1}}{\kappa_{n-1}^n}R_n(B^\circ)$：我按定义核过这条，$V(C[n-1],I_B)^n\ge\lvert C\rvert^{n-1}\lvert I_B\rvert$，而 $\lvert I_B\rvert=\frac{\lvert\Pi B^\circ\rvert}{\kappa_{n-1}^n}=\frac{R_n(B^\circ)\lvert B^\circ\rvert^{n-1}}{\kappa_{n-1}^n}$，除以 $\mathcal V_B(C)^{n-1}=\frac{\lvert B^\circ\rvert^{n-1}}{\kappa_n^{n-1}}\lvert C\rvert^{n-1}$ 即得（`sections/07_consequences.tex:228-233`）。再用 $R_n(B^\circ)\ge\kappa_{n-1}^n\kappa_n^{2-n}$，右端成 $n^n\kappa_n^{n-1+2-n}=n^n\kappa_n$ ✓。等号：第一步等号使 $C$ 与 $I_B$ 位似，第二步使 $B^\circ$ 为椭球，于是 $I_B$ 与 $B$ 位似（`sections/07_consequences.tex:236-239`）。

(c) 机械理由。三条推论都只在 $n\ge3$ 陈述，因为它们各自外挂 Chen 等人的三维结果；`sections/01_introduction.tex:70-74` 明确我们在 $n\ge4$ 的证明里不使用那个三维定理，所以拼装只发生在推论层。$n!\,$因子在 `eq:mixed-affine-sobolev` 里的位置来自混合体积的对称展开，与 $\widetilde I_1$ 的定义中"没有 $1/n!$"的约定配对（`sections/07_consequences.tex:88-90`）。缩放律 $f_i(x)\mapsto f_i(Ax+b)$ 下 $\mathcal D_n$ 与 $\prod\lVert f_i\rVert_q$ 同按 $\lvert\det A\rvert^{1-n}$ 变化（`sections/07_consequences.tex:89-91`），这就是"$A$ 的仿射不变性"在函数侧的镜像，也正是为什么 Petty 常数原样出现在函数不等式里。Holmes--Thompson 的归一化 $\frac{\lvert B^\circ\rvert}{\kappa_n}$ 保证 Minkowski 不等式取等时两端尺度一致，$\kappa_{n-1}$ 在 $I_B$ 定义中的除法是为了让 $B$ 为 Euclidean 单位球时 $\mathcal A_B$ 退化成经典表面积。

(d) 失败路线。[推测] 第一条：想从 `thm:main` 的等号情形顺手给出 `cor:lutwak-petty` 的等号分类。 Lutwak 的条件结果只传递不等式，它把 Petty 的等号信息抹掉了；正文因此明确不作断言（`sections/07_consequences.tex:75-76`）。我最初的草稿写了一句"等号当且仅当椭球"，属于越界。[推测] 第二条：把 $\widetilde I_1$ 到 $\mathcal D_n$ 的搬运改成自己在 BV 上做直接变分。端点 $p=1$ 的 profile 等价性由 Haddad 的 (18)-(21) 给出，直接做需要重做 symmetrization 与层整，收益只有自我满足。[推测] 第三条：把 Holmes--Thompson 的等号条件写成仅关于 $C$。第一步等号只给 $C$ 与 $I_B$ 位似，$B$ 未定；必须联合第二步对 $B^\circ$ 的椭球结论，才能得到"$B$ 椭球且 $C$ 与之位似"这种双侧结论（`sections/07_consequences.tex:236-239`）。同理，$p>1$ 的 Haddad 问题不能搭这趟车，`sections/07_consequences.tex:198-199` 已声明只用 $p=1$。

## 13. 机器侧取证：登记名空间、语句形状与 $4\le n$ 的落点

登记条目在 `lean/formalization.yaml:1374-1376`，三行给出 comparator 配置 `ComparatorChallenges/PettyProjectionVolume.json`、declaration `OAI.PettyProjection.petty_projection_volume`、file `OAI/Geometry/ProjectionBodies/Main.lean`。这里有一处命名陷阱值得记：登记名空间是 `PettyProjection`，目录名是 `ProjectionBodies`，而 `lean/OAI/Geometry/` 下同时存在 `ProjectionBody`、`ProjectionVolume`、`Zonotope`、`PolarProducts` 等同族目录。我只按读到的内容定位：`Main.lean:7` 打开 `namespace PettyProjection`，`Main.lean:1` 导入 `OAI.Geometry.ProjectionBodies.AffineCovariance`，`Model.lean:9` 在同一命名空间下定义语句，因此 `formalization.yaml` 那三行自洽，目录名与名空间不同族这件事本身不构成矛盾。json 侧（`ComparatorChallenges/PettyProjectionVolume.json:2-13`）给出 `solution_module` 为 `OAI.Geometry.ProjectionBodies.Main`、`theorem_names` 只有一条、`permitted_axioms` 为 `propext` 与 `Quot.sound` 与 `Classical.choice`，`enable_nanoda` 为 `false`，`definition_names` 为空数组。

语句形状在 `Model.lean`。`Space n` 缩写为 `EuclideanSpace ℝ (Fin n)`（`Model.lean:11`），`IsConvexBody K` 定义为 `IsCompact K ∧ Convex ℝ K ∧ (interior K).Nonempty`（`Model.lean:13-14`），注意这里不含 $0\in\operatorname{int}K$，而笔头侧 `prop:projection-measure` 开头就要平移加缩放（`sections/02_gauges.tex:210-212`）。`shadowVolume K u` 取的是子模 `perpendicular u = (Submodule.span ℝ {u})ᗮ` 上诱导体积对正交投影像的测度（`Model.lean:20-26`），`projectionBody K` 写成半空间交，条件是 $\lVert u\rVert=1$ 蕴含 $\langle u,x\rangle\le$ shadowVolume（`Model.lean:30-31`），也就是笔头"支撑函数为影子体积"的构造式反面：纸面先给支撑函数再断言存在唯一凸体，机器先造集合再证它的支撑函数。`projectionRatio K = volume.real (projectionBody K) / volume.real K ^ (n - 1)`（`Model.lean:33-34`）里 $n-1$ 是自然数减，`pettyConstant n = kappa (n - 1) ^ n * kappa n ^ (2 - (n : ℤ))`（`Model.lean:36-37`）里第二个指数是整数幂；$\kappa_n^{2-n}$ 在纸上是个分数，在机器里是 `zpow`，需要底数 $>0$，即单位球体积为正这一事实要显式供应。`IsEllipsoid` 用线性同构 `Space n ≃ₗ[ℝ] Space n` 加平移写成像集（`Model.lean:39-41`），与 `thm:main` 的 $K=a+TB_2^n$ 一字对应。`MainClaim`（`Model.lean:43-46`）把 $\forall n,\ 4\le n$ 写在量词最外层。

证明本体只有四行（`Main.lean:11-16`）：`theorem petty_projection_volume (n : ℕ) (hn : 4 ≤ n) (K : Set (Space n)) (hK : IsConvexBody K)`，body 是 `obtain ⟨hbound,hrigid⟩ := projection_lower_bound hn hK` 加 `exact ⟨hbound,hrigid,ellipsoid_projectionRatio (by omega)⟩`。这两行告诉我两件事。第一，下界与刚性一起来自 `Normalization.lean:274` 的 `theorem projection_lower_bound {n : ℕ} (hn : 4≤n)`，它内部又调 `Normalization.lean:261` 的 `centered_projection_lower_bound`，那条带 `hn : 4≤n` 与 `[NeZero n]` 两个前提。第二，`ellipsoid_projectionRatio` 在 `AffineCovariance.lean:196` 只需 `hn : 2≤n`，所以 `Main.lean:16` 用 `by omega` 从 $4\le n$ 现推 $2\le n$。机器侧的维数下界因此只压在下界与刚性那半边，椭球达到常数那半边从二维就成立。

我把 `4 ≤`、`5 ≤`、`n ≥ 4`、`Nat.succ` 四个写法在该目录内做了一次带行号的检索，命中集中在五个文件：`ScalarCalculus.lean` 的 108、136、150、158、163、169、175、180（$I$ 与 $G$ 的导数公式与 $C^1$ 性），`ScalarBounds.lean` 的 109、141、160、185、750（`mean_bound`、`local_margin`、`low_W_bound`、`low_pointwise`、`pointwise`），`NormEstimates.lean` 的 68、93、154、194、197、206、215、240、252、307、333（含 `norm_estimate` 在 333），`NormRigidity.lean` 的 305、332、353、398、539、554，`Normalization.lean` 的 261、274。相反，`WulffVariation.lean`、`VariationalMinimizers.lean`、`VariationalRepresentation.lean`、`RankContinuity.lean`、`AffinePosition.lean`、`PositionMatrices.lean`、`FixedPointCalculus.lean`、`Brouwer.lean`、`BrunnMinkowski.lean`、`Homothety.lean`、`RelativeGauges.lean`、`SeminormBounds.lean`、`SignCalculus.lean`、`SignSpectrum.lean`、`CosineSpectrum.lean`、`CosineCalculus.lean`、`SphericalCore.lean` 未以这些写法命中 $4\le n$。`SphericalGap.lean:144-145` 的 `eigenvalue_four_le` 只要求 `hn : 2 ≤ n` 与 `hd : 4 ≤ d`。这份分布与笔头侧一致：$n\ge4$ 在第 2、3、4、5、8、9、10 节都不咬人，它只在第 7 节的标量证书与曲率估计里落地，再由 `NormRigidity.lean` 与 `Normalization.lean` 往上送。

`ScalarCalculus.lean:108` 有个耐人寻味的额外前提：`lemma hasDerivAt_Iformula_other {n : ℕ} (hn : 4 ≤ n) (hne : n ≠ 4)`。纸面把 `eq:k-choice` 当作一句话，机器里 $k$、$\beta$、$w$ 大概率被写成按 $n=4$ 分支的 `if`，于是每个代数恒等式要在两个分支各证一遍，$n=4$ 那支另起一条引理。[推测] 这一读法来自 `_other` 后缀与 136 行无后缀版本并存，以及 `eq:scalar-constants` 表的双分支形状，我没有逐行读完该文件的证明体。同样，`eq:scalar-pointwise` 在机器里是 `ScalarBounds.lean:750` 的 `theorem pointwise (n : ℕ) (hn : 4 ≤ n) {z : ℝ} (hz : 0 < z)`，正的 $z$ 被明确假设，对应纸面的 "$\mathcal L(z)\le2W(z)$ for $z>0$"。

两侧都卡住的那一步，我现在能给出算式。笔头侧 $n=3$ 的失败先在表的模板里试：$k=2$ 时 $c_{3,2}=\frac{1+\left(1+\frac24\right)\cdot20}{4\cdot6}=\frac{31}{24}\approx1.2917$，$d_*=2n+8=14$，局部余量条件 $n+2k-1-\frac{ck^2}{1-w}>0$ 变成 $6-\frac{5.1667}{1-w}>0$，即 $w<0.1389$；`eq:scalar-mean-bound` 在 $\beta=\frac23$ 下要求 $\frac{0.1905}{w}-\frac{0.1111}{1-w}\le0.5806$，粗算 $w\ge0.31$ 才可行。两区间不相交，表在三维直接失效。把 $\beta$ 降到 $\frac12$ 时第二条在 $w\approx0.09$ 处给出约 $0.32$ 的松弛，与第一条出现窄窄的交，但 $z>1$ 那侧的证书（`eq:large-coefficients` 的 $H=\frac{18(n+4)}c$ 与 $V_0,V_1,V_2,R$ 的移位正系数）依赖 $n\ge7$ 的单调性与 $n=4,5,6$ 的显式多项式，三维没有一支覆盖它。[推测] 这里只验了两条标量约束，其余约束未逐条检查，结论应读作"表的模板在 $n=3$ 无立足点"。机器侧对应的卡点是 `ScalarBounds.lean:109` 的 `mean_bound` 与 `ScalarBounds.lean:141` 的 `local_margin` 都带 `hn : 4 ≤ n`，$n=3$ 时这两个语句连命题形状都不成立，往下 `NormEstimates.lean:333` 的 `norm_estimate` 与 `Normalization.lean:274` 的 `projection_lower_bound` 的 `hn` 随之断链。

机器侧独有、纸面没有对应物的摩擦有三处。第一是 `[NeZero n]`：`Fin n` 上的空间与体积引理大量需要非零维实例，而这些地方明明已有 `hn : 4≤n`，`omega` 不能把不等式自动喂成类型类，于是两者成对出现在同一行（`Normalization.lean:261`；`NormEstimates.lean` 的 93、154、206、215、240、252、307、333；`NormRigidity.lean` 的 332、353、398、539、554）。第二是指数类型：`projectionRatio` 用自然数幂 `^ (n - 1)`（`Model.lean:34`），`pettyConstant` 用整数幂 `^ (2 - (n : ℤ))`（`Model.lean:37`），两者在同一条不等式里比较，第 11 节 (b) 里 $a^{n(n-1)}$ 的尺度抵消在机器里要穿过 `zpow` 与 `npow` 的换算。第三是 $h_L$ 与 gauge 的双向翻译：纸面一句 "the choice of the gradient on its null exceptional set is immaterial"（`sections/02_gauges.tex:217-218`），机器侧要构造测度并证明它与平移缩放相容；模块清单里 `SupportMeasures.lean`（287 行）、`ShadowSlices.lean`（292 行）、`SliceTransport.lean`（381 行）、`AffineCovariance.lean`（210 行）的存在与体量与此对应。[推测] 具体分工我没有读，只按名字与行数推测。

## 14. 差异复盘：留下的东西与我原本想造的东西

把第 1 节的三条开局与最终形态并排看，差异集中在四处。

第一，我以为会有一条 convexity 主论证，实际留下三条互锁的下界：符号检验给出 $a_1a_2-\sqrt{(a_1^2-1)(a_2^2-1)}$ 这种代数形状（`sections/06_conclusion.tex:81-88`），范数刚性把根号里两项换成 $(\E g^k)^2-(\E g^{k-1})^2$（`sections/04_norm.tex:17-20`），变分表示负责把测度配对换成球面配对（`sections/05_position.tex:122-127`）。任何一条单独都不含投影体，这正是引言所说两个独立部件的出处（`sections/01_introduction.tex:121-129`）。

第二，我原本把二次谐波当作可容忍的误差项。它不行，$\mu_2=\frac{1+2na}{p+2}>0$ 让它与主项同号，误差吸收失效；更麻烦的是它不能被任何不等式界住，只能被坐标选取清零。清零在纸面上是 `prop:position` 的全部动机，在机器里是 `AffinePosition.lean`（492 行）加 `PositionMatrices.lean`（421 行）加 `FixedPointCalculus.lean`（591 行）加 `Brouwer.lean`（184 行）四条文件，是整套形式化里密度最大的一块。我起初设想取惯性主轴就能解决：$g_A$ 本身依赖 $A$，$\mathcal F(A)$ 的分子分母都是同一个 $A$ 的函数（`sections/05_position.tex:333-336`），这是一个隐式方程，对角化不够。

第三，等号情形的来源与预期相反。我准备从极小元的 Euler--Lagrange 方程加刚性来推，实际路线是代数的：三个非负量 $a_i\ge1$、$s_it_i\ge1$、$c\lVert Qf_i\rVert_2^2\le a_i^2-s_i^2t_i^2$ 构成的夹链只要有一处不取等，最后一步就严格（`sections/06_conclusion.tex:91-98`），刚性由此免费得到，随后交给 `prop:projection-measure` 的位似等号条件（`sections/02_gauges.tex:219-222`）。这里唯一的分析内容是第 7 节那条严格性，其余是恒等式。

第四，$k$ 的分岔我完全没预料到，$\beta$、$w$、$c$ 的表看起来是反解出来的。第 7 节 (c) 的四组余量（$\frac35$、$\frac78$、$\frac{43}{21}$、$\frac9{10}$）说明顺序是：先要求余量为正，再挑可行的 $w$，最后定 $\beta$。$n=4,5,6$ 用显式多项式 $P_4,P_5,P_6$ 与 $U_4,U_5,U_6$（`sections/04_norm.tex:264-313`），$n\ge7$ 用系数证书 $V_0,V_1,V_2,R$ 与移位正系数（`sections/04_norm.tex:379-404`），两套手法之间没有过渡，只有 $n=10$ 这个门槛（`sections/04_norm.tex:406`、`414-423`）：$q_1$ 的符号在 $n=7,8,9$ 可为负，正文另给逐分量下界表（`sections/04_norm.tex:441-458`）与精确元组（`sections/04_norm.tex:460-472`）来补，并靠 $q_1+q_2\frac{j-1}{2n-j+2}$ 在 $j\ge5$ 的单调性把无限多个系数收敛到有限次检验（`sections/04_norm.tex:473-481`）。

遗留问题我记三条。其一，$n=3$ 的失败我只在表的模板内验证，没有证明不存在别的 $(\beta,w,k)$ 组合，因此四维是分界这一说法在方法层面还缺一句最优性论证。其二，$k=1$ 在 $n\ge5$ 的不可行我只是从 $\ell=0$ 使右端 $(\E g^k)^2-(\E g^{k-1})^2$ 退化为 $m^2$、而 `eq:scalar-mean-bound` 右端此时为 $1$ 来感知的，没有做成命题。其三，机器侧我读了 `Main.lean`、`Model.lean` 与两次带行号检索，`SphericalCore.lean`（49,427 字节）与 `SeminormBounds.lean`（34,109 字节）这两个最大文件的内容分布我没有核对，只按 $4\le n$ 的命中位置反推它们在链条中的层级。

## 15. 常量与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $4\le n$ | 整数维下界，写在量词最外层 | `sections/01_introduction.tex:36-37` | `thm:main`、`eq:k-choice`、`ScalarBounds.pointwise` | 代 $n=3$、$k=2$ 时余量式要求 $w<0.1389$ 而均值界要求 $w\ge0.31$，第 13 节算式断 |
| $p=n-1$ | 随 $n$ 线性，$p\ge3$ | `sections/01_introduction.tex:172-173` | $\lambda_l=l(l+p-1)$、$P_{2j}$ 的分母 $p(p+2)\cdots$ | 步长错位则 `eq:transform-multipliers` 与 $\mu_l$ 同时错 |
| $b_n=\E\lvert u_1\rvert$ | 随 $n$ 衰减约 $\sqrt{2/(\pi n)}$ | `sections/01_introduction.tex:176` | `eq:sign-form` 的 $1/b_n$、`eq:ball-constant`、`thm:bilinear` 右端 | 去掉归一则球面对 $\sigma,\sigma$ 的配对不再读出 $b_n$ |
| $\kappa_m$ | $\operatorname{vol}_m(B_2^m)$ | `sections/01_introduction.tex:14-15` | 一切常数与 `pettyConstant` | $\lvert K\rvert=\kappa_n$ 归一断则 $s_it_i\ge1$ 与 $a_i\ge1$ 同时失 |
| $R_n(K)$ | 平移、$\mathrm{GL}$、尺度三重不变 | `sections/01_introduction.tex:18` | `thm:main`、`cor:holmes-thompson` | $\Pi(TK)$ 的指数 $n-1$ 错则解除归一化时 $a^{n(n-1)}$ 的抵消断 |
| $\kappa_{n-1}^{\,n}\kappa_n^{\,2-n}$ | 候选最小值 | `sections/01_introduction.tex:39-40` | `eq:main`、`eq:lutwak-petty` 在 $i=n-1$ | 与 `eq:ball-constant` 不吻合则球不取等，锐性演示断 |
| $\Pi K$ | 支撑函数等于影子体积 | `sections/01_introduction.tex:6-9` | `eq:projection-measure`、`Model.lean:30-31` | 半空间交与支撑函数两种定义互证缺失则机器侧整链断 |
| $\eta_K$ | 概率、有界支撑、张成 | `sections/02_gauges.tex:213-216` | `def:admissible-measure`、`thm:bilinear` | $\E g_K^{-n}=1$ 破坏则不是概率测度，`eq:eta-normalization` 断 |
| $\tau_\eta(M)$ | 下界 $(\lvert M\rvert/\kappa_n)^{1/n}$ | `sections/02_gauges.tex:199-206` | 可容性、`lem:minimizer` 的归一化 | 指数 $1/n$ 改动则位似等号条件失效，等号刚性断 |
| $g_L$ | 正齐次凸 gauge，$L=\{g_L\le1\}$ | `sections/02_gauges.tex:12-15` | `lem:gauge-variation`、$\eta_K$ 定义 | 原点非内点时 gauge 可取 $0$ 或 $\infty$，最大公式断 |
| $W_t$ | 支撑约束的交集体 | `sections/02_gauges.tex:34-37` | 全部一阶变分与 `prop:representation` | 容许 $s+t\phi$ 触零则 $W_t$ 无界，内外球夹断 |
| $\frac{n\kappa_n}{2}$ | 投影公式系数 | `sections/02_gauges.tex:224` | `thm:main` 里 $1=\frac{n\kappa_n}{2r}\iint$ | 因子 $2$ 源于线段长 $2t\lvert y\rvert$，丢失则 $r$ 的界差一倍 |
| $n\kappa_n$ | 球面面积 | `sections/02_gauges.tex:72-73` | 体积公式、`cor:volume-first-variation` | 极坐标测度错则 $\E g^{-n}$ 的归一断 |
| $\lambda_l$ | $l(l+n-2)$，随 $l$ 二次增长 | `sections/03_spherical.tex:14` | 谱隙、$\mu_l$、$C_{2j}$ | 分母 $p-\lambda_l=-(l-1)(l+p)$ 变号则 $C$ 的乘子不可解 |
| $\lambda_2=2n$ | 线性增长 | `sections/03_spherical.tex:26` | `eq:spectral-gap`、`lem:curvature` 左端 | 与 `eq:scalar-L` 中 $2nG^2$ 同步错，二次式单调性断 |
| $\lambda_4=4(n+2)$ | 线性增长 | `sections/03_spherical.tex:26` | $c_{n,k}$ 的分子、$d_*$ | 尾项常数与定价同时改，余量表作废 |
| $d_*=2n+8$ | 线性，四维取 $16$ | `sections/04_norm.tex:8` | `eq:norm-curvature`、`eq:scalar-L`、`eq:scalar-mean-bound` | 四维取值改小则 $\frac{11}{12}$ 上抬越过 $1$ |
| $Q$ | 偶次 $\ge4$ 的正交投影 | `sections/03_spherical.tex:16-17` | `prop:sign-estimate`、`thm:norm-estimate` | 把 $l=2$ 纳入则 `prop:position` 的清零假设失去意义 |
| $X_f$ | $fu+k^{-1}\gradS f$ | `sections/03_spherical.tex:101` | `eq:sign-form`、`eq:norm-vector-field`、`eq:representation` | $k^{-1}$ 改 $k$ 则 $a$ 变成 $\frac{2k}{}+\frac{k^2}{p}$，$\mu_l$ 全错 |
| $C,P$ | 保常数的自伴压缩 | `sections/03_spherical.tex:120-123` | `lem:sign-operator`、乘子表 | 概率测度约定改动则 $2d_0=pb_n$ 与所有系数同步缩放 |
| $C_2=\frac1{p+2}$ | 正 | `sections/03_spherical.tex:202` | $\mu_2=\frac{1+2na}{p+2}$ 的失效论证 | 若变负则二次项可被吸收，第 10 节的清零变冗余 |
| $C_4=-\frac1{(p+2)(p+4)}$ | 负，绝对值约 $n^{-2}$ | `sections/03_spherical.tex:203` | $c_{n,k}=\lvert\mu_4\rvert$ | 递推 $(l-1)/(l+p+2)$ 改动则一致上界断 |
| $2d_0=pb_n$ | 赤道密度关系 | `sections/03_spherical.tex:165` | 两个混合项与梯度项系数 | $d_0$ 错则 $\frac{2p}{k}+\frac{p^2}{k^2}$ 变，`eq:sign-operator` 断 |
| $c_{n,k}$ | 尾项常数，随 $k$ 严格递减 | `sections/03_spherical.tex:261` | `thm:norm-estimate`、`eq:scalar-L`、$H$ | 改动即改余量表与 $n\ge7$ 的全部 $A_i,B_i$ |
| $c=\frac{121}{35}$ | 四维、$k=1$ | `sections/04_norm.tex:213` | 余量 $\frac35$ 与均值界 $\frac{11}{12}$ | 分子分母任一改动，两条已核数值同时错 |
| $c=\frac{n^2+5n+7}{(n+1)(n+3)}$ | $n\ge5$、$k=2$，递减趋于 $1$ | `sections/04_norm.tex:214`、`256` | $H=\frac{18(n+4)}c$、大维证书 | $c'(n)<0$ 失效则 $n+3-8c$ 的递增论证断 |
| $k$ | $n=4$ 取 $1$，$n\ge5$ 取 $2$ | `sections/04_norm.tex:7` | $J$ 的分支、$X_{g^k}$、$a_i$、$\frac{2k-1}{k^2}$ | 交换分支则四维余量 $5-17.6<0$，$z\le1$ 段失 |
| $\beta$ | $\frac12$（四维）与 $\frac23$（五维以上） | `sections/04_norm.tex:40-42` | $G$、$0\le t\le\beta m$、`eq:scalar-mean-bound` | 取 $1$ 时四维左端越界，第 7 节 (d) 第一条重演 |
| $w$ | $\frac3{14}$、$\frac13$、$\frac12$ 三档 | `sections/04_norm.tex:40-42` | Hilbert 拆分、`eq:scalar-L`、局部余量 | 出可行窗则余量与均值界两区间不相交 |
| $I(z)$ | 分母含 $2k-1$、$n+1-k$、$2n+1$ | `sections/04_norm.tex:55-58` | `lem:curvature` 右端、`eq:scalar-L` | $n+1-k$ 退化时闭式失效，机器侧须另起分支 |
| 局部余量 | $\frac35,\frac78,\frac{43}{21},\frac9{10}$ 后递增 | `sections/04_norm.tex:244-253` | `eq:scalar-pointwise` 在 $0<z\le1$ | 任一处非正则该区间严格性断 |
| $(s_4,s_5,s_6)$ | $(2880,712800,221130)$ | `sections/04_norm.tex:266` | $P_n$ 的清分母定义 | 改 $s_n$ 则所列系数与 $U_n$ 数值全部作废 |
| $4ab-d^2$ | $149084$ 起四个正判别式 | `sections/04_norm.tex:322-325` | $U_4,U_5$ 的线性与二次项控制 | 任一非正则 $dt\le a+bt^2$ 这一步失 |
| $U_4,U_5,U_6$ | 下界 $328$、$193700$、判别式 $92839690886319$ | `sections/04_norm.tex:310-331` | $P_n(1+x)/x^2>0$ 在 $n=4,5,6$ | 一个下界转负则 $z>1$ 的小维证书断 |
| $H=\frac{18(n+4)}c$ | 随 $n$ 近似常数 $18$ | `sections/04_norm.tex:336` | `eq:large-coefficients` 的 $A_2,A_1,A_0,B_0$ | 改动破坏 `eq:large-signs` 的多项式证书 |
| $V_0,V_1,V_2,R$ | 移位后系数全正 | `sections/04_norm.tex:379-404` | $q_0+\frac{r_0}8$、$q_1$、$q_2$、$r_0$ 的符号 | 出现负系数即让 $n\ge7$ 的逐 $j$ 下界断 |
| $\binom nj\le2^{-j}\binom{2n}j$ | 对 $3\le j\le2n$ | `sections/04_norm.tex:410-413` | $q_0$ 与 $r_0$ 贡献的合并 | 放宽则该比较断，$n\ge10$ 的系数非负性失 |
| $J$ | $\E\log g$（$k=1$）或 $\E g$（$k=2$） | `sections/05_position.tex:20-25` | `lem:minimizer`、`prop:representation` | 换目标则 $g^{k-1}\nabla g$ 的表示断 |
| $q_A(y)$ | $V=\range A$ 上的范数 | `sections/05_position.tex:57-61` | 外半径界、`lem:matrix-continuity` | 张成性丢失则只是半范数，紧性论证断 |
| $g(u)\ge R\lvert u\cdot e\rvert$ | 半范数逐点下界 | `sections/05_position.tex:72-74` | $J\ge\log R+\E\log\lvert u_1\rvert$ 与 $J\ge Rb_n$ | 去掉则 $\log$ 情形负部不可控，存在性与秩连续同断 |
| $\E\lvert\log\lvert u_1\rvert\rvert^2<\infty$ | 密度 $\propto(1-t^2)^{(n-3)/2}$ | `sections/05_position.tex:83-86` | 一致可积、截断误差 $O(M^{-1})$ | 换成 $1+\delta$ 矩则第 8 节 (d) 第三条的失败重演 |
| $\mathcal A$ | $\{A=A^t\ge0,\ \tr A=1\}$ 紧凸 | `sections/05_position.tex:187` | `lem:fixed-point`、`prop:position` | 去迹归一则域非紧，Brouwer 前提断 |
| $\mathcal F(A)$ | 对称无迹连续场 | `sections/05_position.tex:333-336` | 向内性、最近点条件 | 分母 $\E g_A^k$ 改动则核块常数与尺度都变 |
| $\frac1{n+k}$ | 高斯径向矩比 | `sections/05_position.tex:346-352` | `eq:kernel-field` | 若为 $\frac1n$ 则 $\mathcal F$ 在核上为零，向内性断 |
| $-\frac{k}{n(n+k)}$ | 核块本征值，严格负 | `sections/05_position.tex:358` | 排除奇异 $A$ | 符号翻转则奇异性无法排除，$A$ 未必正定 |
| $g_{aA}=ag_A$ | 尺度对应 | `sections/05_position.tex:397` | $\det A=1$ 的归一 | 失败则行列式归一会破坏二次分量清零 |
| $s_i,t_i,a_i$ | $s_it_i\ge1$、$a_i\ge1$ | `sections/06_conclusion.tex:43-51` | `eq:error-absorption` | 失一则 $\sqrt{a_i^2-1}$ 无定义，末步代数断 |
| $(a_1-a_2)^2$ | 恒等式余项，非负 | `sections/06_conclusion.tex:85-88` | `thm:bilinear` 末步 | 展开一旦不闭合则下界不再 $\ge1$ |
| $\lVert Q(g^k)\rVert_2^2$ | 上界 $(\E g^k)^2-(\E g^{k-1})^2$ | `sections/04_norm.tex:17-20` | `eq:error-absorption` | 严格性丢则等号刚性里 $g=1$ 的推出断 |
| $r=\left(\frac{\lvert\Pi K\rvert}{\kappa_n}\right)^{1/n}$ | 归一化投影半径 | `sections/06_conclusion.tex:119-121` | `thm:main` 的 $r\ge\kappa_{n-1}$ | 取 $n$ 次根错则 $\lvert\Pi K\rvert\ge\kappa_n\kappa_{n-1}^n$ 读数错 |
| `hn : 4 ≤ n` | Lean 顶层假设 | `Main.lean:11` | `projection_lower_bound hn hK` | 削弱则 `ScalarBounds.lean:750` 的 `pointwise` 无从应用 |
| `hn : 2≤n` | 椭球达到常数那一侧 | `AffineCovariance.lean:196` | `Main.lean:16` 由 `by omega` 供给 | 若该侧也需 $4$ 则说明被过度假设，现状否 |
| `[NeZero n]` | 类型类前提 | `Normalization.lean:261` | `Fin n` 体积与球面引理 | 缺实例编译断，数学内容不变 |
| `kappa n ^ (2 - (n : ℤ))` | 整数幂，需底数为正 | `Model.lean:36-37` | `pettyConstant` 与比值比较 | 正性缺则 `zpow` 定义断，常数无从书写 |
| `hne : n ≠ 4` | `I` 公式的分支前提 | `ScalarCalculus.lean:108` | `hasDerivAt_Iformula`、`deriv_I` | 分支不合并则 $G'^2=\beta^2I'$ 关系断 |
| `permitted_axioms` | 三条：`propext`、`Quot.sound`、`Classical.choice` | `ComparatorChallenges/PettyProjectionVolume.json:8-12` | 对照审计 | 多出公理则 comparator 拒绝该声明 |
| `enable_nanoda` | `false` | `ComparatorChallenges/PettyProjectionVolume.json:13` | 自动化开关 | 开启会掩盖尚未人工证明的段落 |
| `Space n` | `EuclideanSpace ℝ (Fin n)` | `Model.lean:11` | 全链类型与体积测度 | 换成抽象内积空间则 `Fin n` 相关体积引理断 |

## 16. 自检记录

结构：正文 16 个连续编号小节，前 14 节按 (a) 逐字引用、(b) 中间步骤、(c) 机械理由、(d) 失败路线四段展开到 `lem:gauge-variation`、`prop:projection-measure`、`lem:spherical-harmonics`、`lem:sign-operator`、`lem:spherical-multipliers`、`prop:sign-estimate`、`thm:norm-estimate`、`lem:curvature`、`lem:scalar-estimates`、`lem:minimizer`、`lem:matrix-continuity`、`prop:representation`、`lem:fixed-point`、`prop:position`、`thm:bilinear`、`thm:main` 与三条推论。前向引用落地清单：第 4 节指向第 10 节的二次分量清零，第 5 节指向第 9 节的向量场，第 8 节指向第 10 节的紧域，第 9 节指向第 11 节的 $s_i$、$t_i$、$a_i$，第 12 节指向第 11 节的常数，第 13 节回收第 7 节的余量表，第 14 节回收第 1 节的三条开局。

风格自查用 grep：破折号字符 0 命中，独占行的分隔线 0 命中，加粗列表 0 命中，表情符号 0 命中，规格禁止的那五个短语在本笔记第 2 节起的追加部分 0 命中；首批落盘的正文里第 19 行与第 95 行各留有一处被禁的转折句式与一个被禁短语，按只追加不改写的落盘纪律未动，留待字符级清理。数学符号全部进 `$...$`，绝对值写 `\lvert` 与 `\rvert`，范数写 `\lVert` 与 `\rVert`，整除写 `\mid`，台账表格单元内不出现裸竖线。

字数与体量由 `wc -c` 与 `grep -o '\$'` 实测，见交付报告。

## 17. 追加事故记录与阅读边界

写第 15 节时我的锚点取得过窄。当时用来定位的收尾句 "其余是恒等式" 之后紧接第 14 节 "第四" 段的开头，而我把整段 "第四" 连同 "遗留问题" 段一起重写进新内容，于是这两段在文件里出现了两份：一份在第 14 节的正常位置，一份从第 326 行 "见交付报告" 之后粘在句尾，直到第 328 行。粘住的那一份还与第 16 节的末句合并成了同一行。

按本笔记的落盘纪律，已落盘内容不做删除也不做改写，所以我保留这两份，只在末尾记录事故本身。阅读边界因此需要一句明确交代：本笔记正文的规范阅读顺序到第 16 节的末句为止，第 326 行行尾 "第 7 节 (c)" 起至第 328 行末的全部内容属于第 14 节 "第四" 段与 "遗留问题" 段的重复粘贴，读者应把它们当作第 14 节已有文本的副本，不携带新信息；这两段副本连同第 19 行与第 95 行的两处风格残留，一并交给字符级清理批处理，我不再动它们。

第 16 节说 "正文 16 个连续编号小节"，含本节为 17 节，编号连续无跳号。台账节第 15 节实测表头 2 行、数据行 58 行，全部五格有实内容，未使用占位符，单元格内没有裸竖线。体量方面，追加本节之前的实测为 85,133 字节、`$` 计数 2,663；本节本身只增加一处 `$` 密集引用，最终数值以交付报告为准。


清理批落笔（本体侧，追加于第 17 节之后）：第 19 行与第 95 行的两处被禁对举句式、第 95 行的那个被禁短语已逐字改写，字数变化合计约 12 字；第 17 节记的那份重复粘贴已删去（第 14 节第四段与遗留问题段各留两份，现已只留第 14 节的原件），故第 17 节的阅读边界交代只作为事故记录保留，正文实际长度以本次清理后的字节数为准。
