# C51 加权Bergman空间与共形映射积分均值谱（arXiv:math/0406345）

## 0 取证边界

登记对象：Haakan Hedenmalm、Serguei Shimorin，"Weighted Bergman spaces and the integral means spectrum of conformal mappings"，arXiv:math/0406345，发表年月 2004-06-17。素材内署名行写作 `H\aa kan Hedenmalm and Serguei Shimorin`，下接机构行 `at the Royal Institute of Technology, Stockholm`（`main.tex:148-150`），标题在源文件中拆成两行 `\centerline`（`main.tex:141-143`）。

素材类与排版：`\documentclass[10pt]{article}`，宏包 `amsmath`、`amssymb`、`amsfonts`、`curves`、`graphicx[dvips]`（`main.tex:2-8`）；`\numberwithin{equation}{section}` 使公式编号带节号（`main.tex:7`），故下文出现的 "(1.3)" 式编号即素材的 `\begin{equation}` 标签号；定理环境 `THEOREM`、`PROPOSITION`、`LEMMA`、`COROLLARY`、`CONJECTURE`、`DEFINITION`、`REMARK` 共用按节计数器（`main.tex:11-22`），`PROBLEM` 独立编号（`main.tex:17`）。`proof` 环境是自定义的粗体 "Proof." 起、以实心方块 `\qed` 收尾（`main.tex:64`、`main.tex:108`）。页边距被手工放宽（`main.tex:130-135`），源文件自称 `defnote.tex`（`main.tex:10`）。

本语料中引用它的稿号与 bib key（本稿只在此原样登记，不据此反查这些稿）：D40（`HedenmalmShimorin`）、D54（`HedenmalmShimorin2005`）。

取证边界：唯一取材文件 `被引素材/math_0406345/main.tex`，实测 130100 字节 / 3127 行。全文分块通读八次，行区间依次为 1-400、401-800、801-1200、1201-1600、1601-2000、2001-2400、2401-2800、2801-3127，覆盖正文、全部证明与图表注记。文中所有定位串均为实读行号，形如 `main.tex:306-309`；未读素材目录内的任何 `.pdf`，未执行任何版本管理命令，未生成排版产物。

记法换算（KaTeX 是唯一宏权威，素材宏一律按其定义展开；`\newcommand` 与 `\def` 定义的宏在正文中不保留原宏名，只在本表与代码段中出现）：

- 黑板体数域与几何集合：`\C,\D,\T,\R,\Z,\N,\A,\Q,\sph` → $\mathbb C,\mathbb D,\mathbb T,\mathbb R,\mathbb Z,\mathbb N,\mathbb A,\mathbb Q,\mathbb S$（`main.tex:26-33`、`main.tex:38`），`\Cinfty` → $\mathbb C_\infty$（`main.tex:40`），`\OD` → $\overline{\mathbb D}$（`main.tex:83`），`\cdzero` → $\mathbb C_0(\mathbb D)$（`main.tex:84`）。
- 花体函数类与空间：`\schlicht` → $\mathcal S$（`main.tex:36`），`\calH` → $\mathcal H$，`\calD` → $\mathcal D$，`\calA` → $\mathcal A$，`\calB` → $\mathcal B$，`\calN` → $\mathcal N$，`\calG` → $\mathcal G$，`\calU` → $\mathcal U$，`\calL` → $\mathcal L$，`\calM` → $\mathcal M$，`\calI` → $\mathcal I$，`\calJ` → $\mathcal J$，`\calE` → $\mathcal E$，`\calX` → $\mathcal X$（`main.tex:67-80`）；`\B` → $\mathcal B(\mathbb D)$（`main.tex:66`），`\Bz` → $\mathcal B_0(\mathbb D)$（`main.tex:82`），`\primes` 与 `\pspace` 同为 $\mathcal P$（`main.tex:39`、`main.tex:123`），`\espace` → $\mathcal E$（`main.tex:124`），`\Hspace` → $\mathcal H$（`main.tex:125`），`\restrspace` → $\mathcal D$（`main.tex:127`）。
- 需要特别登记的一处不一致：素材把 `\calF` 定义为 `\mathfrak F`（`main.tex:72`），本稿遵其定义写作 $\mathfrak F$；同样 `\calA` 与 `\ami`（`main.tex:50`，$A_{-\infty}$）不同源，勿混。
- 粗体算子与向量值记号：`\Lop,\Top,\Sop,\Pop,\Qop,\Aop,\Hop,\Kop,\Uop,\Iop,\Mop,\Vop` → $\mathbf L,\mathbf T,\mathbf S,\mathbf P,\mathbf Q,\mathbf A,\mathbf H,\mathbf K,\mathbf U,\mathbf I,\mathbf M,\mathbf V$（`main.tex:111-122`），`\projt,\projk,\projr,\comp` → $\mathbf P,\mathbf Q,\mathbf R,\mathbf C$（`main.tex:41-45`），`\projpi` → $\boldsymbol\Pi$（`main.tex:44`），`\chib` → $\boldsymbol\chi$（`main.tex:37`），`\weightmat` → $\boldsymbol\sigma$，`\diagmat` → $\boldsymbol\delta$（`main.tex:109-110`），`\dz` 与 `\bpartial` → $\boldsymbol\partial$（`main.tex:61-62`），`\identity` → $\mathbf{{id}}$（`main.tex:46`）。
- 缩写与算子名：`\diff` → $\mathrm d$（`main.tex:92`），`\esssup` → $\mathrm{ess}\,\mathrm{sup}$（`main.tex:63`），`\re` → $\mathrm{Re}$（`main.tex:101`），`\spann` → $\mathrm{span}$（`main.tex:128`），`\deck` → $\mathrm{Deck}$（`main.tex:81`），`\autD` → $\mathrm{aut}(\mathbb D)$（`main.tex:47`），`\ap,\aq,\hp,\atwo,\ltwo,\lp,\linfty,\hinfty,\apa,\aqa` 分别是 $A^p(\mathbb D)$、$A^q(\mathbb D)$、$H^p(\mathbb D)$、$A^2(\mathbb D)$、$L^2(\mathbb D,dA)$、$L^p(\mathbb D,dA)$、$L^\infty(\mathbb D)$、$H^\infty(\mathbb D)$、$A^p_\alpha(\mathbb D)$、$A^q_\alpha(\mathbb D)$（`main.tex:48-58`、`main.tex:52-53`），`\Dbullet` → $D_\bullet$（`main.tex:59`），`\area` → $\Sigma$（`main.tex:88`），`\continuum` → $\Lambda$（`main.tex:126`），`\formderiv` → $\Omega$（`main.tex:93`），`\thpar` → $\sigma$，`\fopar` → $\varkappa$，`\fipar` → $K$（`main.tex:89-91`），`\lapm` → $\widetilde\Delta_M$（`main.tex:100`），`\nphip` → $\big\|(\varphi')^{t/2}\big\|$（`main.tex:35`）。
- 求和与积分的压缩宏：`\ind` → $\int_{\mathbb D}$，`\intt` → $\int_{\mathbb T}$，`\intzpi` → $\int_0^{2\pi}$，`\sumn` → $\sum_{n=0}^{+\infty}$，`\summn` → $\sum_{m,n\ge0}$，`\suml` → $\sum_{l=0}^{+\infty}$（`main.tex:60`、`main.tex:85-87`、`main.tex:103`）。
- 希腊字母的重定义与改名：`\renewcommand{\th}{\theta}`（`main.tex:105`），`\eps` → $\varepsilon$（`main.tex:107`），`\secpar` → $\beta$（`main.tex:34`）。带参宏 `\normb#1`、`\normapa#1`、`\mur#1`（`main.tex:96-97`、`main.tex:102`）在本稿一律展开为显式写法 $\|g\|_{\mathcal B}$、$\|g\|_{\alpha,p}$、$\widehat\mu_r(\cdot)$。

结构承诺：本稿设 `## 1` 到 `## 7` 共七个正文节，末节 `## 7` 为与本语料的接缝；各节的公式级定理陈述、推导中间步与具体算例均以素材行号锚定。

## 1 引言：谱函数的两种定义、已知精确段与 Helson-Szegő 式愿景

### 1.1 类 $\mathcal S$、Koebe 函数与积分均值

素材第 1 节标题 `\section{Introduction}\label{se0}`（`main.tex:154`），小节题 "The class $\mathcal S$"（`main.tex:156`）。定义：$\mathcal S$ 是单位开圆盘 $\mathbb D$ 到复平面 $\mathbb C$ 的具单全纯函数 $\varphi$ 之集，规格化 $\varphi(0)=0$、$\varphi'(0)=1$（`main.tex:157-159`）。经典变形估计（素材编号 (1.1)，`main.tex:161-165`）：

$$\frac{1-\lvert z\rvert}{(1+\lvert z\rvert)^{3}}\le\lvert\varphi'(z)\rvert\le\frac{1+\lvert z\rvert}{(1-\lvert z\rvert)^{3}},\qquad z\in\mathbb D .$$

锐性由 Koebe 函数的适当旋转给出（`main.tex:166-171`）：

$$\kappa(z)=\frac{z}{(1-z)^{2}},\qquad\kappa'(z)=\frac{1+z}{(1-z)^{3}},$$

它属于 $\mathcal S$ 并把圆盘映成去掉缝 $]-\infty,-\tfrac14]$ 的平面（素材用欧式区间记法 $]-\infty,-1/4]$，`main.tex:170`）。$\lvert\kappa'(z)\rvert$ 在边界点 $z=1$ 附近大、在 $z=-1$ 附近小，其余处"相当温和"（`main.tex:173-175`），这一句是全部谱问题的原型算例。

度量平均增减的手段是积分均值（`main.tex:176-178`）：

$$\mathbf M_{t}[\varphi'](r)=\frac{1}{2\pi}\int_{-\pi}^{\pi}\bigl\lvert\varphi'\bigl(re^{i\theta}\bigr)\bigr\rvert^{t}\,d\theta,\qquad 0<r<1,$$

$t\in\mathbb R$。由 (1.1) 知存在依赖 $t$ 的正 $\beta$ 使

$$\mathbf M_{t}[\varphi'](r)=O\Bigl(\frac{1}{(1-r)^{\beta}}\Bigr)\quad (r\to1^{-})\;$$

（素材 (1.2)，`main.tex:180-184`），使该估计成立的一切 $\beta$ 的下确界记为 $\beta_\varphi(t)$，称为 $\varphi$ 的积分均值谱函数； universal 版本

$$\mathrm B_{\mathcal S}(t)=\sup_{\varphi\in\mathcal S}\beta_{\varphi}(t)$$

（`main.tex:189-191`）。每个 $\beta_\varphi(t)$ 是 $t$ 的凸函数，故 $\mathrm B_{\mathcal S}(t)$ 亦凸（`main.tex:192-193`）。取 (1.1) 与测试函数 $\varphi(z)=z$ 得平凡界（素材 (1.3)，`main.tex:196-199`）：

$$0\le\mathrm B_{\mathcal S}(t)\le\max\{3t,-t\},\qquad t\in\mathbb R.$$

### 1.2 已知精确段与 Brennan 猜想的位置

`main.tex:202-213` 登记两条已知精确公式。第一条（素材引 \[FeMG\]）：

$$\mathrm B_{\mathcal S}(t)=3t-1,\qquad \tfrac25\le t<+\infty.$$

第二条（素材引 \[CarMak\]）：存在临界常数 $R_{\mathrm{CM}}$，$2\le R_{\mathrm{CM}}<+\infty$，使

$$\mathrm B_{\mathcal S}(t)=-t-1\ \ (t\le-R_{\mathrm{CM}}),\qquad -t-1<\mathrm B_{\mathcal S}(t)\ \ (-R_{\mathrm{CM}}<t<+\infty),$$

$R_{\mathrm{CM}}$ 的精确值未知；著名的 Brennan 猜想等价于 $R_{\mathrm{CM}}=2$，也可表述为 $\mathrm B_{\mathcal S}(-2)=1$（`main.tex:211-213`）。注意这两段精确区间的接缝在 $t=2/5$ 处：$\mathrm B_{\mathcal S}(2/5)=3\cdot\tfrac25-1=\tfrac15$，凸性与平凡界 $\max\{3t,-t\}$ 在该点给出斜率转折，素材后面所有上界改进都发生在中间带 $(-R_{\mathrm{CM}},2/5)$ 上。

### 1.3 外盘类 $\Sigma$ 与其谱

第 2 个小节 "The class $\Sigma$"（`main.tex:216-255`）考虑外盘

$$\mathbb D_e=\{z\in\mathbb C_\infty:\,1<\lvert z\rvert\le+\infty\}$$

到 Riemann 球面 $\mathbb C_\infty=\mathbb C\cup\{\infty\}$ 的共形映射 $\varphi$，规格化 $\varphi(z)=z+O(1)$（$|z|\to+\infty$）（`main.tex:217-221`）。变形估计（素材 (1.4)，`main.tex:223-227`）：

$$\frac{\lvert z\rvert^{2}-1}{\lvert z\rvert^{2}}\le\lvert\varphi'(z)\rvert\le\frac{\lvert z\rvert^{2}}{\lvert z\rvert^{2}-1},\qquad z\in\mathbb D_e .$$

积分均值同式但 $1<r<+\infty$，关心的是 $r\to1^{+}$ 的行为（`main.tex:228-236`）。$\mathrm B_{\Sigma}(t)$ 定义为 $\beta_\varphi(t)$ 在 $\Sigma$ 上的上确界，同样凸，平凡界（素材 (1.5)，`main.tex:245-248`）：

$$0\le\mathrm B_{\Sigma}(t)\le\lvert t\rvert,\qquad t\in\mathbb R,$$

已知（`main.tex:249-254`）

$$\mathrm B_{\Sigma}(t)=\lvert t\rvert-1,\qquad t\in\,]-\infty,-R_{\mathrm{CM}}]\cup[2,+\infty[,$$

其中 $R_{\mathrm{CM}}$ 与前面同一个常数，于是"待研究区间"是 $[-R_{\mathrm{CM}},2]$。

### 1.4 Makarov 比较定理与 Kraetzer 猜想

Makarov（素材引 \[Mak1\]）通过调和测度分析得到两个谱函数的恒等式（素材 (1.6)，`main.tex:261-265`）：

$$\mathrm B_{\mathcal S}(t)=\max\bigl\{\mathrm B_{\Sigma}(t),\,3t-1\bigr\},\qquad t\in\mathbb R .$$

素材声明原定理陈述用的是有界映射类 $\mathcal S_b$（保持原点的有界共形映射），但两类足够相似使论证可移（`main.tex:266-269`）。这条恒等式把 $\mathrm B_{\mathcal S}$ 的完全确定问题归约到 $\mathrm B_{\Sigma}$，是"为什么本文主要研究 $\mathrm B_{\mathcal S}$ 却处处以 $\mathrm B_{\Sigma}$ 为对照"的原因。素材明确承认没能解决 Kraetzer 猜想（素材引 \[Krae\]）中适用于 $\mathrm B_{\mathcal S}$ 的那部分，该猜想主张（`main.tex:276-277`）

$$\mathrm B_{\Sigma}(t)=\frac{t^{2}}{4},\qquad-2\le t\le 2.$$

校验一点：若 Kraetzer 成立，则由 (1.6) 在 $t\in[0,2]$ 上 $\mathrm B_{\mathcal S}(t)=\max\{t^2/4,3t-1\}$，交点由 $t^2/4=3t-1$ 即 $t^2-12t+4=0$ 给出 $t=6-4\sqrt2\approx0.343$，与已知的 $2/5=0.4$ 门槛接近但不重合；素材的估计都写成对 $\mathrm B_{\mathcal S}$ 的多项式上界，正是朝这条抛物线靠拢。

### 1.5 Bergman 空间改写与"Hilbert 化"

小节 "Bergman space methods"（`main.tex:280-329`）。第一步是定义的对数型改写（`main.tex:282-292`，素材用 `gather*` 列出两个方向）：对 $-1<\alpha<+\infty$，

$$\int_{0}^{1}\mathbf M_{t}[\varphi'](r)(1-r)^{\alpha}\,\mathrm d r<+\infty\ \Longrightarrow\ \mathbf M_{t}[\varphi'](r)=O\Bigl(\frac{1}{(1-r)^{\alpha+1}}\Bigr)\ (r\to1^{-}),$$

反向则是：该 $O$ 估计推出对每个 $\varepsilon>0$ 有 $\int_0^1\mathbf M_t[\varphi'](r)(1-r)^{\alpha+\varepsilon}\,\mathrm dr<+\infty$。于是引入加权 Bergman 空间 $\mathcal H_\alpha(\mathbb D)$：$\mathbb D$ 上全纯且

$$\|f\|_{\alpha}^{2}=\int_{\mathbb D}\lvert f(z)\rvert^{2}\,\mathrm d A_{\alpha}(z)<+\infty,$$

其中面积元（素材 (1.7)，`main.tex:297-301`）

$$\mathrm d A_{\alpha}(z)=(\alpha+1)\bigl(1-\lvert z\rvert^{2}\bigr)^{\alpha}\,\mathrm d A(z),\qquad \mathrm d A(z)=\frac{\mathrm d x\,\mathrm d y}{\pi}\ (z=x+iy),$$

归一化使 $\mathrm d A_\alpha(\mathbb D)=1$。由此得谱函数的新表达式（素材 (1.8)，`main.tex:305-309`）：

$$\beta_{\varphi}(t)=\inf\Bigl\{\alpha+1:\ (\varphi')^{t/2}\in\mathcal H_{\alpha}(\mathbb D)\Bigr\},$$

素材称之为问题的"Hilbertization"（`main.tex:310`）。本文的工作是估计在 $\varphi\in\mathcal S$ 上一致的范数 $\bigl\|(\varphi')^{t/2}\bigr\|_{\alpha}$，从而估计 $\mathrm B_{\mathcal S}(t)$（`main.tex:312-315`）。

方法是 Bergman 空间技术结合经典几何函数论工具，特别是 Prawitz 对 Grönwall 面积定理的推广（`main.tex:316-318`）。素材强调这套办法的好处：能把面积定理的全部强度编码进去，而不只是像经典逐点估计（素材 (1.9)，`main.tex:322-326`）那样只取一个侧面

$$\Bigl\lvert\frac{\varphi''(z)}{\varphi'(z)}-\frac{2\bar z}{1-\lvert z\rvert^{2}}\Bigr\rvert\le\frac{4}{1-\lvert z\rvert^{2}},\qquad z\in\mathbb D,$$

该式是 Bieberbach 不等式 $\tfrac12\lvert\varphi''(0)\rvert=\lvert\widehat\varphi(2)\rvert\le2$ 的推论（`main.tex:327-328`）。

### 1.6 复参数谱

`main.tex:331-351` 把 $t$ 换成 $\tau\in\mathbb C$：$\tau$-积分均值定义为

$$\mathbf M_{t}[\varphi'](r)=\frac{1}{2\pi}\int_{-\pi}^{\pi}\Bigl\lvert\bigl[\varphi'(re^{i\theta})\bigr]^{\tau}\Bigr\rvert\,\mathrm d\theta,\qquad 0<r<1,$$

$\varphi\in\Sigma$ 时把范围改为 $1<r<+\infty$（`main.tex:335-337`）。记号上素材此处左端仍写 $\mathbf M_t$，与左端 $\tau$ 不符，属源文件笔误。幂的定义靠 $\varphi'(z)$ 在盘内无零点拯救，取 $[\varphi'(0)]^{\tau}=1$ 的分枝（`main.tex:338-341`）。由此 $\beta_\varphi(\tau)$、$\mathrm B_{\mathcal S}(\tau)$、$\mathrm B_{\Sigma}(\tau)$ 照旧定义，且二者在整个复平面上是凸的（更准确说：作为 $\operatorname{Re}\tau,\operatorname{Im}\tau$ 的函数的相应凸性，`main.tex:342-347`）。素材说它的方法对复 $\tau$ 也给出 $\mathrm B_{\mathcal S}(\tau)$ 的估计，只是通常不加强调（`main.tex:348-350`）。

### 1.7 底层理念：面积 Muckenhoupt 条件、Helson-Szegő 与 Bloch 范数

小节 "Underlying ideas"（`main.tex:353-495`）是全文思想纲领，值得按公式逐段登记。设

$$\sup_{\varphi}\int_{\mathbb D}\bigl\lvert[\varphi'(z)]^{\tau}\bigr\rvert\,\mathrm d A_{\alpha}(z)<+\infty\;$$

（素材 (1.10) 前的 `equation*`，`main.tex:358-362`），并对 $-\tau$ 同样成立（`main.tex:369-373`）；真正需要的是两式的乘积有界（`main.tex:375-381`），写作

$$\sup_{\varphi}\ \Bigl\langle\bigl\lvert[\varphi'(z)]^{\tau}\bigr\rvert\Bigr\rangle_{\mathbb D,\alpha}\Bigl\langle\bigl\lvert[\varphi'(z)]^{\tau}\bigr\rvert^{-1}\Bigr\rangle_{\mathbb D,\alpha}<+\infty,$$

其中 $\langle f\rangle_{Q,\alpha}=\frac1{|Q|_\alpha}\int_Q f\,\mathrm dA_\alpha$ 是 $\mathrm dA_\alpha$ 平均（`main.tex:390-394`）。素材在这里写出的两条带号公式（编号 (1.10) 与 (1.11)，`main.tex:383-389`、`main.tex:401-407`）右端都缺了 "$<$"，只有 "$+\infty$"，属源文件排印脱落，本文按上下文补齐。

把 $\varphi$ 换成

$$z\longmapsto\frac{\varphi\bigl(\frac{z+z_{0}}{1+\bar z_{0}z}\bigr)-\varphi(z_{0})}{(1-\lvert z_{0}\rvert^{2})\varphi'(z_{0})}\in\mathcal S$$

并对 $\mathbb D$ 作适当的 Möbius 坐标平移，得局部化版本（`main.tex:395-407`）：上确界对一切 $\varphi\in\mathcal S$ 与一切 Carleson"方块"$Q\subset\mathbb D$ 取的

$$\sup_{\varphi,Q}\ \Bigl\langle\bigl\lvert[\varphi'(z)]^{\tau}\bigr\rvert\Bigr\rangle_{Q,\alpha}\Bigl\langle\bigl\lvert[\varphi'(z)]^{\tau}\bigr\rvert^{-1}\Bigr\rangle_{Q,\alpha}<+\infty.$$

条件 (1.11) 是 $\mathrm dA_\alpha$-面积版的 Muckenhoupt（或 Békollé）型条件。极限情形 $\alpha=-1$ 时 $\mathrm dA_\alpha$ 退化为单位圆 $\mathbb T$ 上的弧长测度，正权 $\omega$ 的 Muckenhoupt $(A_2)$ 条件

$$\sup_{Q}\ \langle\omega\rangle_{Q,-1}\langle\omega^{-1}\rangle_{Q,-1}<+\infty$$

按 Helson-Szegő 定理（素材引 \[HelSzeg\]）等价于

$$\log\omega=u+\widetilde v,\qquad u,v\in L^{\infty}(\mathbb T)\ \text{实值},\ \ \|v\|_{L^{\infty}(\mathbb T)}<\frac{\pi}{2},$$

$\widetilde v$ 是 $v$ 的调和共轭（`main.tex:410-423`）；此时 Carleson 方块默认包含相邻的边界弧（`main.tex:423-425`）。素材把 Helson-Szegő 解读为"$\log\omega$ 的 $\operatorname{BMO}(\mathbb T)$ 范数的一部分很小"（`main.tex:425-426`），并指出 \[Hed\] 用类似论证证明 Brennan 猜想等价于 $|\varphi'|^{q}$ 的某个面积 Muckenhoupt 条件（`main.tex:426-428`）。

把弧长换成面积测度时，$\operatorname{BMO}(\mathbb T)$ 的全纯子空间 $\operatorname{BMOA}(\mathbb D)$ 对应的空间是 Bloch 空间 $\mathcal B(\mathbb D)$（素材引 \[HKZ\]，`main.tex:429-435`）：

$$\|f\|_{\mathcal B}=\sup\bigl\{(1-\lvert z\rvert^{2})\lvert f'(z)\rvert:\ z\in\mathbb D\bigr\}<+\infty .$$

于是纲领是："理想地上界应找 $\log\varphi'$ 的 Bloch 范数估计，使之与面积 Muckenhoupt 条件 (1.11) 大致等价"（`main.tex:436-439`）。素材老实承认这是在黑暗中摸索，因为面积测度情形没有 Helson-Szegő 型定理；而 $\mathrm B_{\mathcal S}(t)$ 在原点附近为偶函数的猜测、以及 Binder 提示的更强旋转不变性，都支持"研究 (1.11) 就是研究 $\mathrm B_{\mathcal S}(\tau)$（至少对靠近原点的 $\tau$）"这一判断（`main.tex:440-447`）。若 $f\in\mathcal B(\mathbb D)$ 的 Bloch 范数足够小，则可证 $e^{f}$ 属于任意固定的 $\mathcal H_\alpha(\mathbb D)$ 且范数可控；反之 $\varphi\in\mathcal S$ 时 $\log\varphi'\in\mathcal B(\mathbb D)$，这是 (1.9) 的直接推论（`main.tex:447-453`）。障碍在于必要条件与充分条件的常数之间存在实质间隙，唯一的桥是找 Bloch 范数的合适替身（`main.tex:453-456`）。

后续方法史（`main.tex:457-495`）：第一位作者曾在 \[Hed\] 建议研究与 $\log\varphi'$ 相关的 Volterra 型算子的谱性质（灵感来自与 Alexandru Aleman 的谈话），实质上是研究 $\varphi''/\varphi'$ 的乘子性质；第二位作者 Shimorin 发现 Schwarzian 导数从 $\mathcal H_\alpha(\mathbb D)$ 到 $\mathcal H_{\alpha+4}(\mathbb D)$ 的乘子范数可以直接用面积方法有效估计，无须经典型 (1.12) 的逐点估计

$$\Bigl\lvert\frac{\varphi'''(z)}{\varphi'(z)}-\frac{3}{2}\Bigl[\frac{\varphi''(z)}{\varphi'(z)}\Bigr]^{2}\Bigr\rvert\le\frac{6}{(1-\lvert z\rvert^{2})^{2}},\qquad z\in\mathbb D,$$

并因此给出 $\mathrm B_{\mathcal S}(-1)$ 与 $\mathrm B_{\mathcal S}(-2)$ 的更好估计（`main.tex:457-473`）。(1.12) 也以另一种方式表达 $\log\varphi'\in\mathcal B(\mathbb D)$，而乘子范数估计蕴含与该 Schwarzian 相伴的 Volterra 型算子的谱半径估计（`main.tex:474-477`）。Shimorin 的工作提示：用 $\log\varphi'$ 的导数从 $\mathcal H_\alpha(\mathbb D)$ 到 $\mathcal H_{\alpha+2}(\mathbb D)$ 的乘子范数来度量 $\log\varphi'$ 的大小，比通常 Bloch 范数更合适（`main.tex:477-480`）。再 dissecting Prawitz 定理（Grönwall 面积定理的推广）得到一族由实参数 $\theta$（$0<\theta\le1$）标号的乘子范数型估计；其一般来源是双盘 $\mathbb D^2$ 上的对角限制算子与范数估计中锐常数的使用（`main.tex:480-486`）。沿对角线加入对应零点重数的高阶项后，得到一个对所有 full mapping 都取等号的估计；可惜这些附加项携带的信息在积分均值谱研究中一般难以有效利用（`main.tex:487-492`）。方法细节在素材的第 2、3、4 节（`main.tex:493-494`）。

## 2 Prawitz 面积定理、把特殊点搬动的做法与二变量不等式 (2.1)

### 2.1 定理 2.1（Prawitz）

素材第 2 节 `\section{Area theorem type estimates}\label{areathm}`（`main.tex:496`）的出发点是 Prawitz 对 Grönwall 面积定理的推广（`main.tex:498-499`）。定理 2.1（`main.tex:501-510`）：设 $\varphi\in\mathcal S$，则对 $0<\theta\le1$ 有

$$\int_{\mathbb D}\biggl\lvert\varphi'(z)\Bigl(\frac{z}{\varphi(z)}\Bigr)^{\theta+1}-1\biggr\rvert^{2}\frac{\mathrm d A(z)}{\lvert z\rvert^{2\theta+2}}\le\frac{1}{\theta},$$

且等号成立当且仅当 $\varphi$ 是 full mapping。

证明（`main.tex:512-519`）只有三句，但每句都是必要的：不等式来自 Prawitz 的经典结果（素材引 \[Milin\] 第 13 页）；\[Milin\] 中的不等式是对 $\Sigma$ 类陈述的，需要"从 $\Sigma$ 到 $\mathcal S$ 的标准 passage"才得上式；等号刻画属于 Prawitz 定理本身的一部分。也就是说素材把这个定理当作已知工具，不重证。

幂的解释（`main.tex:522-527`）：

$$\Bigl(\frac{z}{\varphi(z)}\Bigr)^{\theta+1}=\exp\Bigl((\theta+1)\log\frac{z}{\varphi(z)}\Bigr),$$

其中对数由"在 $\mathbb D$ 内全纯且在 $z=0$ 取值 $0$"两个要求唯一确定（因为 $\varphi(z)/z$ 在盘内无零点）。素材在此未定义 "full mapping"，本稿按经典用法判读为：像集是 $\mathbb C$ 去掉有限多条解析弧所得区域的 $\mathcal S$ 中函数（Koebe 函数即最简单的一例，去掉一条直线缝）；这一判读与 $\theta=1$ 时等号由 $\kappa$ 达到相吻合，读者引用时应回查 \[Milin\] 的定义。

### 2.2 二变量版本：三步搬运

小节 "A two-variable version of Prawitz' theorem"（`main.tex:529-588`）是全文的技术枢纽，做法是把特殊点 $z=0$ 在盘中搬动。三步完整记录：

第一步，给定 $\varphi\in\mathcal S$ 与固定 $w\in\mathbb D$，令

$$\psi(\zeta)=\frac{\varphi\bigl(\frac{\zeta+w}{1+\bar w\zeta}\bigr)-\varphi(w)}{(1-\lvert w\rvert^{2})\varphi'(w)},\qquad\zeta\in\mathbb D,$$

则 $\psi$ 仍是 $\mathcal S$ 的元素（`main.tex:531-535`）。第二步，把这个 $\psi$ 代入定理 2.1 的 $\varphi$ 位置，得一个关于 $\zeta$ 的积分不等式（`main.tex:536-544`），被积式含三个因子：$\frac1{\varphi'(w)}(1+\bar w\zeta)^{-2}\varphi'\bigl(\frac{\zeta+w}{1+\bar w\zeta}\bigr)$、$\Bigl(\frac{(1-|w|^2)\varphi'(w)\zeta}{\varphi(\frac{\zeta+w}{1+\bar w\zeta})-\varphi(w)}\Bigr)^{\theta+1}$ 与 $-1$，权为 $\frac{\mathrm dA(\zeta)}{|\zeta|^{2\theta+2}}$，右端仍为 $\frac1\theta$。第三步，作变量替换

$$z=\frac{\zeta+w}{1+\bar w\zeta}\quad\Longleftrightarrow\quad\zeta=\frac{z-w}{1-\bar wz}$$

并化简，得不等式（素材 (2.1)，`main.tex:550-559`）：

$$\int_{\mathbb D}\biggl\lvert\frac{\varphi'(z)}{\varphi'(w)}\Bigl(\frac{\varphi'(w)(z-w)}{\varphi(z)-\varphi(w)}\Bigr)^{\theta+1}-\Bigl(\frac{1-\lvert w\rvert^{2}}{1-\bar w z}\Bigr)^{1-\theta}\biggr\rvert^{2}\frac{\mathrm d A(z)}{\lvert z-w\rvert^{2\theta+2}}\le\frac{1}{\theta}(1-\lvert w\rvert^{2})^{-2\theta},$$

对一切 $0<\theta\le1$ 成立。素材称"This inequality is basic for our analysis"（`main.tex:560`）。

### 2.3 拆成双变量函数 $\Phi_\theta$ 与 $L_\theta$

把 (2.1) 改写为双盘上的语言（`main.tex:561-576`）。定义

$$\Phi_{\theta}(z,w)=\frac{1}{z-w}\biggl\{\frac{\varphi'(z)}{\varphi'(w)}\Bigl(\frac{\varphi'(w)(z-w)}{\varphi(z)-\varphi(w)}\Bigr)^{\theta+1}-1\biggr\},\qquad(z,w)\in\mathbb D^{2},\ z\ne w,$$

$$L_{\theta}(z,w)=\frac{1}{z-w}\biggl\{1-\Bigl(\frac{1-\lvert w\rvert^{2}}{1-\bar w z}\Bigr)^{1-\theta}\biggr\},\qquad(z,w)\in\mathbb D^{2},\ z\ne w.$$

两个关键事实（`main.tex:571-575`）：$\Phi_\theta$ 全纯扩张到整个双盘 $\mathbb D^2$，且其对角限制是

$$\Phi_{\theta}(z,z)=\frac{1-\theta}{2}\,\frac{\varphi''(z)}{\varphi'(z)};$$

$L_\theta$ 实解析扩张到 $\mathbb D^2$。对角限制出现 $\varphi''/\varphi'$ 是整套方法的靶心：它正是 $\log\varphi'$ 的导数，而 1.7 段说明要控制的量就是 $\log\varphi'$ 的大小。系数 $\frac{1-\theta}{2}$ 随 $\theta\to1$ 消失，这个退化是后文 $\theta$ 参数族估计的代价来源。

于是有定理 2.2（`main.tex:578-588`）：固定 $\theta$，$0<\theta\le1$，$\varphi\in\mathcal S$ 任意，则对一切 $w\in\mathbb D$，

$$\int_{\mathbb D}\bigl\lvert\Phi_{\theta}(z,w)+L_{\theta}(z,w)\bigr\rvert^{2}\frac{\mathrm d A(z)}{\lvert z-w\rvert^{2\theta}}\le\frac{1}{\theta}(1-\lvert w\rvert^{2})^{-2\theta},$$

等号当且仅当 $\varphi$ 是 full mapping。与 (2.1) 相比，权指数从 $2\theta+2$ 变成 $2\theta$，因为 $1/(z-w)$ 因子被吸收进 $\Phi_\theta,L_\theta$ 的定义。

本稿对结构的判读：定理 2.2 说的是"某个全纯函数 $\Phi_\theta(\cdot,w)$ 加上某个实解析函数 $L_\theta(\cdot,w)$，在带权 $|z-w|^{-2\theta}\mathrm dA(z)$ 下大小受控"。后续 §3、§4 的全部工作就是把这个含混的和拆开：$\Phi_\theta g$ 项落在 Bergman 空间里，$L_\theta g$ 项的正交投影可以被显式计算，于是"和的范数受控"兑换成"$\Phi_\theta g$ 的投影范数受控"，后者正是 $\varphi''/\varphi'$ 的乘子范数估计。

## 3 双盘加权空间 $\mathcal H_{\alpha,\beta}(\mathbb D^2)$：核分解、对角限制与把范数写成一行行的和

### 3.1 空间、核与投影算子

素材第 3 节 `\section{Bergman spaces in the bidisk}\label{se2}`（`main.tex:592`）。对 $-\infty<\alpha,\beta<+\infty$（这里的 $\beta$ 是素材宏 `\secpar`，`main.tex:34`；$\sigma(\alpha,\beta)$ 是素材宏 `\thpar`，`main.tex:89`），考虑 Hilbert 空间 $\mathcal L_{\alpha,\beta}(\mathbb D^2)$：双盘上 Lebesgue 可测函数（模去零函数），范数有界条件为

$$\|f\|_{\alpha,\beta}=\Bigl(\int_{\mathbb D}\int_{\mathbb D}\lvert f(z,w)\rvert^{2}\lvert z-w\rvert^{2\beta}\,\mathrm d A(z)\,\mathrm d A_{\alpha}(w)\Bigr)^{1/2}<+\infty$$

（`main.tex:594-600`）。注意两个变量的权不同：$z$ 用普通面积 $\mathrm dA$，$w$ 用加权面积 $\mathrm dA_\alpha$，对角因子 $\lvert z-w\rvert^{2\beta}$ 单独承担奇性。闭子空间 $\mathcal H_{\alpha,\beta}(\mathbb D^2)$ 由 $\mathbb D^2$ 上全纯的元组成，且素材立刻指出：$\mathcal H_{\alpha,\beta}(\mathbb D^2)$ 除非 $-1<\alpha<+\infty$ 否则是零空间（`main.tex:601-604`）。

再生核记为 $P_{\alpha,\beta}\bigl((z,w);(z',w')\bigr)$，对 $(z,w)$ 全纯、对 $(z',w')$ 反全纯，由再生性定义（`main.tex:605-612`）：

$$f(z,w)=\int_{\mathbb D}\int_{\mathbb D}P_{\alpha,\beta}\bigl((z,w);(z',w')\bigr)f(z',w')\lvert z'-w'\rvert^{2\beta}\,\mathrm d A(z')\,\mathrm d A_{\alpha}(w').$$

$\beta=0$ 时有显式公式（`main.tex:613-615`）：

$$P_{\alpha,0}\bigl((z,w);(z',w')\bigr)=\frac{1}{(1-z\bar z')^{2}(1-w\bar w')^{\alpha+2}}.$$

对任意核 $T=T_{\alpha,\beta}$ 定义算子（`main.tex:616-621`）

$$\mathbf T_{\alpha,\beta}f(z,w)=\int_{\mathbb D}\int_{\mathbb D}T_{\alpha,\beta}\bigl((z,w);(z',w')\bigr)f(z',w')\lvert z'-w'\rvert^{2\beta}\,\mathrm d A(z')\,\mathrm d A_{\alpha}(w'),$$

素材声明后文遇到的所有此类算子都有界；$P_{\alpha,\beta}$ 对应的 $\mathbf P_{\alpha,\beta}$ 是正交投影 $\mathcal L_{\alpha,\beta}(\mathbb D^2)\to\mathcal H_{\alpha,\beta}(\mathbb D^2)$（`main.tex:622-625`）。

### 3.2 沿对角线的消失阶与命题 3.1

对非负整数 $N$，$\mathcal H_{\alpha,\beta;N}(\mathbb D^2)$ 是 $\mathcal H_{\alpha,\beta}(\mathbb D^2)$ 中满足

$$f(z,w)=O\bigl(\lvert z-w\rvert^{N}\bigr)\quad(\text{沿对角线附近})$$

的元组成的闭子空间；这些函数沿对角线消失到 $N$ 阶，且可全纯地被 $(z-w)^N$ 除（`main.tex:627-632`）。$N=0$ 时就是全空间；更一般地，当 $-\infty<\beta+N\le0$ 时 $\mathcal H_{\alpha,\beta;N}(\mathbb D^2)=\mathcal H_{\alpha,\beta}(\mathbb D^2)$（`main.tex:632-636`）。其再生核记 $P_{\alpha,\beta;N}$，对应正交投影 $\mathbf P_{\alpha,\beta;N}:\mathcal L_{\alpha,\beta}(\mathbb D^2)\to\mathcal H_{\alpha,\beta;N}(\mathbb D^2)$（`main.tex:638-643`）。

命题 3.1（`main.tex:646-654`）：对 $-1<\alpha,\beta<+\infty$，

$$P_{\alpha,\beta;N}\bigl((z,w);(z',w')\bigr)=(z-w)^{N}(\bar z'-\bar w')^{N}P_{\alpha,\beta+N}\bigl((z,w);(z',w')\bigr).$$

证明一句到位（`main.tex:656-660`）：乘以 $(z-w)^N$ 是 $\mathcal H_{\alpha,\beta+N}(\mathbb D^2)\to\mathcal H_{\alpha,\beta;N}(\mathbb D^2)$ 的等距同构，结论立得。这个"乘 $(z-w)^N$ 平移 $\beta$"的机制是后文所有锐常数的根。

### 3.3 分层 $\mathcal I_{\alpha,\beta;N}$ 与两个分解

定义

$$\mathcal I_{\alpha,\beta;N}(\mathbb D^2)=\mathcal H_{\alpha,\beta;N}(\mathbb D^2)\ominus\mathcal H_{\alpha,\beta;N+1}(\mathbb D^2),$$

其再生核为（素材 (3.1)，`main.tex:662-671`）

$$Q_{\alpha,\beta;N}\bigl((z,w);(z',w')\bigr)=P_{\alpha,\beta;N}\bigl((z,w);(z',w')\bigr)-P_{\alpha,\beta;N+1}\bigl((z,w);(z',w')\bigr),$$

对应正交投影 $\mathbf Q_{\alpha,\beta;N}:\mathcal L_{\alpha,\beta}(\mathbb D^2)\to\mathcal I_{\alpha,\beta;N}(\mathbb D^2)$；记 $Q_{\alpha,\beta}=Q_{\alpha,\beta;0}$。由命题 3.1 得（素材 (3.2)，`main.tex:676-681`）

$$Q_{\alpha,\beta;N}\bigl((z,w);(z',w')\bigr)=(z-w)^{N}(\bar z'-\bar w')^{N}Q_{\alpha,\beta+N}\bigl((z,w);(z',w')\bigr).$$

因为沿对角线消失到无穷阶的唯一函数是零函数，有正交分解

$$\mathcal H_{\alpha,\beta}(\mathbb D^2)=\bigoplus_{N=0}^{+\infty}\mathcal I_{\alpha,\beta;N}(\mathbb D^2),$$

从而核分解（素材 (3.3)，`main.tex:688-696`）

$$P_{\alpha,\beta}\bigl((z,w);(z',w')\bigr)=\sum_{N=0}^{+\infty}Q_{\alpha,\beta;N}\bigl((z,w);(z',w')\bigr)=\sum_{N=0}^{+\infty}(z-w)^{N}(\bar z'-\bar w')^{N}Q_{\alpha,\beta+N}\bigl((z,w);(z',w')\bigr),$$

以及范数分解（素材 (3.4)，`main.tex:697-703`）：对 $f\in\mathcal L_{\alpha,\beta}(\mathbb D^2)$，

$$\bigl\|\mathbf P_{\alpha,\beta}f\bigr\|_{\alpha,\beta}^{2}=\sum_{N=0}^{+\infty}\bigl\|\mathbf Q_{\alpha,\beta;N}f\bigr\|_{\alpha,\beta}^{2}.$$

这正是素材在 1.7 段末所说"沿对角线加入高阶项"（对应零点重数）的严格形式：$N$ 层就是重数 $N$ 的贡献（`main.tex:487-492`）。

### 3.4 两族单位算子与引理 3.2、3.3

自然的单位算子族有两个。其一是同时旋转（`main.tex:705-709`）

$$R_{\theta}[f](z,w)=f(e^{i\theta}z,e^{i\theta}w),\qquad f\in\mathcal H_{\alpha,\beta}(\mathbb D^2),\ \theta\in\mathbb R,$$

注意这里的 $\theta$ 是旋转角，与 §2 中 $0<\theta\le1$ 的参数同字不同义，素材未加区分，引用时需按上下文判别。其二是引理 3.2（`main.tex:712-721`）：对每个 $\lambda\in\mathbb D$，算子

$$\mathbf U_{\lambda}[f](z,w)=\frac{(1-\lvert\lambda\rvert^{2})^{\alpha/2+\beta+2}}{(1-\bar\lambda z)^{\beta+2}(1-\bar\lambda w)^{\alpha+\beta+2}}f\Bigl(\frac{\lambda-z}{1-\bar\lambda z},\frac{\lambda-w}{1-\bar\lambda w}\Bigr)$$

在 $\mathcal H_{\alpha,\beta}(\mathbb D^2)$ 上单位，且是自逆的：$\mathbf U_{\lambda}^{2}[f]=f$。证明"是一个初等变量替换计算"（`main.tex:723-724`）。补充事实（`main.tex:726-734`）：若 $\alpha,\beta$ 均为偶整数，则对每个 Möbius 自同构 $\psi$ 可定义

$$\mathbf U_{\psi}[f](z,w)=f\bigl(\psi(z),\psi(w)\bigr)\bigl(\psi'(z)\bigr)^{1+\beta/2}\bigl(\psi'(w)\bigr)^{1+\alpha/2+\beta/2},$$

全部单位，且 $\psi\mapsto\mathbf U_\psi$ 是 $\mathbb D$ 的 Möbius 自同构群的一个单位表示。

引理 3.3（`main.tex:740-749`）给出核沿对角线的显式值：固定 $-1<\alpha,\beta<+\infty$，则

$$P_{\alpha,\beta}\bigl((z,w);(z',z')\bigr)=Q_{\alpha,\beta}\bigl((z,w);(z',z')\bigr)=\frac{\sigma(\alpha,\beta)}{(1-z\bar z')^{\beta+2}(1-w\bar z')^{\alpha+\beta+2}},$$

其中常数由

$$\frac{1}{\sigma(\alpha,\beta)}=\int_{\mathbb D}\int_{\mathbb D}\lvert z-w\rvert^{2\beta}\,\mathrm d A(z)\,\mathrm d A_{\alpha}(w)$$

给出。证明（`main.tex:751-786`）的中间步值得完整记录：先用旋转不变性 $P_{\alpha,\beta}((e^{i\theta}z,e^{i\theta}w);(0,0))=P_{\alpha,\beta}((z,w);(0,0))$，而对角幂级数展开表明具有该不变性的 $\mathbb D^2$ 上全纯函数只能是常数，于是

$$\sigma(\alpha,\beta)=P_{\alpha,\beta}\bigl((z,w);(0,0)\bigr)$$

（素材 (3.5)），其积分表达式由把再生性用于常值函数 $1$ 得到。再对 $\lambda\in\mathbb D$、$f\in\mathcal H_{\alpha,\beta}(\mathbb D^2)$，由 (3.5) 与引理 3.2 得

$$(1-\lvert\lambda\rvert^{2})^{\alpha/2+\beta+2}f(\lambda,\lambda)=\mathbf U_{\lambda}[f](0,0)=\sigma(\alpha,\beta)\bigl\langle\mathbf U_{\lambda}^{2}f,\mathbf U_{\lambda}1\bigr\rangle_{\alpha,\beta}=\sigma(\alpha,\beta)\bigl\langle f,\mathbf U_{\lambda}1\bigr\rangle_{\alpha,\beta},$$

这正是对角点 $(\lambda,\lambda)$ 的再生恒等式，故

$$P_{\alpha,\beta}\bigl((z,w);(\lambda,\lambda)\bigr)=\sigma(\alpha,\beta)(1-\lvert\lambda\rvert^{2})^{-\alpha/2-\beta-2}\mathbf U_{\lambda}[1](z,w),$$

化简即所要表达式。

### 3.5 对角限制算子与锐范数恒等式

由引理 3.3，

$$P_{\alpha,\beta}\bigl((z,z);(z',z')\bigr)=\frac{\sigma(\alpha,\beta)}{(1-z\bar z')^{\alpha+2\beta+4}},$$

它被识别为集合意义下等于 $\mathcal H_{\alpha+2\beta+2}(\mathbb D)$ 的 Hilbert 空间的再生核，该空间带范数

$$\|f\|^{2}=\frac{1}{\sigma(\alpha,\beta)}\int_{\mathbb D}\lvert f(z)\rvert^{2}\,\mathrm d A_{\alpha+2\beta+2}(z)=\frac{1}{\sigma(\alpha,\beta)}\|f\|_{\alpha+2\beta+2}^{2}$$

（`main.tex:789-798`）。记 $\oslash$ 为对角限制运算：$(\oslash f)(z)=f(z,z)$（`main.tex:799-800`）。由再生核一般理论（素材引 \[Aronsz\]、\[Saitoh\]）有锐估计（素材 (3.6)，`main.tex:801-807`）：

$$\frac{1}{\sigma(\alpha,\beta)}\|\oslash f\|_{\alpha+2\beta+2}^{2}\le\|f\|_{\alpha,\beta}^{2},\qquad f\in\mathcal H_{\alpha,\beta}(\mathbb D^2).$$

引理 3.4（`main.tex:810-838`）把不等式升级为恒等式：

$$\frac{1}{\sigma(\alpha,\beta)}\bigl\|\oslash f\bigr\|_{\alpha+2\beta+2}^{2}=\bigl\|\mathbf Q_{\alpha,\beta}f\bigr\|_{\alpha,\beta}^{2},\qquad f\in\mathcal H_{\alpha,\beta}(\mathbb D^2).$$

证明（`main.tex:819-838`）的构造很干净：由 (3.6) 的推导过程可知，对每个 $f$ 存在 $g$ 使 $\oslash g=\oslash f$ 且 $\frac1{\sigma(\alpha,\beta)}\|\oslash f\|_{\alpha+2\beta+2}^{2}=\|g\|_{\alpha,\beta}^{2}$；把这个 $g$ 按 (3.4) 的分层正交分解

$$g=\mathbf Q_{\alpha,\beta}f+\bigl(g-\mathbf Q_{\alpha,\beta}f\bigr)\in\mathcal I_{\alpha,\beta;0}(\mathbb D^2)+\mathcal H_{\alpha,\beta;1}(\mathbb D^2),$$

正交性给出 $\|\mathbf Q_{\alpha,\beta}f\|_{\alpha,\beta}^{2}\le\|g\|_{\alpha,\beta}^{2}$，结合 (3.6) 即得等号。也就是说"对角限制的范数完全由第 0 层决定"，高阶层对 $\oslash$ 无贡献；反之，若要估计第 $N$ 层，就得对 $N$ 阶导数做同样的事，这正是 3.6 小节的命题 3.8、3.9。

### 3.6 常数 $\sigma(\alpha,\beta)$ 的显式与超几何求值

引理 3.5（`main.tex:842-852`）：固定 $-1<\alpha,\beta<+\infty$，则

$$\frac{1}{\sigma(\alpha,\beta)}=\int_{\mathbb D}\int_{\mathbb D}\lvert z-w\rvert^{2\beta}\,\mathrm d A(z)\,\mathrm d A_{\alpha}(w)=\frac{1}{1+\beta}\,\frac{\Gamma(\alpha+2)\,\Gamma(\alpha+2\beta+3)}{\Gamma(\alpha+\beta+2)\,\Gamma(\alpha+\beta+3)}.$$

证明（`main.tex:854-875`）是关键一步的完整计算：作替换 $\zeta=\frac{w-z}{1-\bar wz}$、$z=\frac{w-\zeta}{1-\bar w\zeta}$，把 $(z,w)$ 换成 $(\zeta,w)$，化简后得

$$\frac{1}{\sigma(\alpha,\beta)}=\frac{\alpha+1}{(1+\beta)(\alpha+2\beta+3)}\sum_{n=0}^{+\infty}\frac{(\beta+2)_{n}(\beta+1)_{n}}{n!\,(\alpha+2\beta+4)_{n}}=\frac{\alpha+1}{(1+\beta)(\alpha+2\beta+3)}\,{}_{2}F_{1}\bigl(\beta+2,\beta+1;\alpha+2\beta+4;1\bigr),$$

其中 Pochhammer 记号 $(a)_n=a(a+1)\cdots(a+n-1)$（`main.tex:866-868`），最后用 Gauss 恒等式（素材 (3.7)，`main.tex:869-873`）

$${}_{2}F_{1}(a,b;c;1)=\frac{\Gamma(c)\,\Gamma(c-a-b)}{\Gamma(c-a)\,\Gamma(c-b)}$$

收尾。本稿核对：取 $a=\beta+2$、$b=\beta+1$、$c=\alpha+2\beta+4$，则 $c-a-b=\alpha$，$c-a=\alpha+\beta+2$，$c-b=\alpha+\beta+3$，于是右端为 $\frac{\Gamma(\alpha+2\beta+4)\Gamma(\alpha)}{\Gamma(\alpha+\beta+2)\Gamma(\alpha+\beta+3)}$；乘以前面的 $\frac{\alpha+1}{(1+\beta)(\alpha+2\beta+3)}$，用 $\Gamma(\alpha+2\beta+4)=(\alpha+2\beta+3)\Gamma(\alpha+2\beta+3)$ 与 $\alpha+1=\Gamma(\alpha+2)/\Gamma(\alpha+1)\cdot(\alpha+1)$、$(\alpha+1)\Gamma(\alpha+1)=\Gamma(\alpha+2)$ 化简，正好得引理右端。这个 Gamma 比式就是全部锐常数的显式来源。

注记 3.6（`main.tex:877-884`）随之给出比值

$$\frac{\sigma(\alpha,\beta+n)}{\sigma(\alpha,\beta)}=\frac{n+1+\beta}{1+\beta}\,\frac{(\alpha+\beta+2)_{n}(\alpha+\beta+3)_{n}}{(\alpha+2\beta+3)_{2n}},\qquad n=1,2,3,\ldots$$

素材把它单独列为 remark，因为后文每出现一层 $N$ 就要用一次这个比值。

### 3.7 $Q_{\alpha,\beta}$ 的积分表示与逐层范数公式

引理 3.7（`main.tex:888-896`）：核 $Q_{\alpha,\beta}$ 有积分表示

$$Q_{\alpha,\beta}\bigl((z,w);(z',w')\bigr)=\sigma(\alpha,\beta)\int_{\mathbb D}\frac{\mathrm d A_{\alpha+2\beta+2}(\xi)}{(1-\bar\xi z)^{\beta+2}(1-\bar\xi w)^{\alpha+\beta+2}(1-\xi\bar z')^{\beta+2}(1-\xi\bar w')^{\alpha+\beta+2}}.$$

证明（`main.tex:898-945`）分三段：先验证由该积分定义的 $\widetilde Q_{\alpha,\beta}$ 在固定 $(z',w')$ 时对 $(z,w)$ 属于 $\mathcal H_{\alpha,\beta}\ominus\mathcal H_{\alpha,\beta;1}$，用 \[HKZ\] 第 1 章的方法可证它在 $\mathcal L_{\alpha,\beta}(\mathbb D^2)$ 中，再由形状直接看出 $\mathbb D^2$ 全纯；正交性来自被积的每个"项"都是在对角点 $(\xi,\xi)$ 处取点值的再生元的倍数，而 $\mathcal H_{\alpha,\beta;1}$ 中的函数在所有对角点为零。再直接计算对角限制

$$\widetilde Q_{\alpha,\beta}\bigl((z,z);(z',w')\bigr)=\frac{\sigma(\alpha,\beta)}{(1-z\bar z')^{\beta+2}(1-z\bar w')^{\alpha+\beta+2}},$$

这一步用的是 $\mathcal H_{\alpha+2\beta+2}(\mathbb D)$ 的经典核的再生性；由引理 3.3，右端就是 $Q_{\alpha,\beta}((z,z);(z',w'))$。最后，$\mathcal I_{\alpha,\beta;0}$ 中的函数由其对角限制唯一决定，故 $\widetilde Q_{\alpha,\beta}=Q_{\alpha,\beta}$。

命题 3.8（`main.tex:949-959`）给出第 $N$ 层范数的一维表示：对 $-1<\alpha,\beta<+\infty$、$N=0,1,2,\ldots$，

$$\bigl\|\mathbf Q_{\alpha,\beta;N}f\bigr\|_{\alpha,\beta}^{2}=\frac{1}{\sigma(\alpha,\beta+N)}\biggl\|\oslash\Bigl[\frac{\mathbf P_{\alpha,\beta;N}f(z,w)}{(z-w)^{N}}\Bigr]\biggr\|_{\alpha+2\beta+2N+2}^{2},\qquad f\in\mathcal L_{\alpha,\beta}(\mathbb D^2),$$

证明是命题 3.1 与引理 3.4 的组合（`main.tex:961-964`）。配合引理 3.3 展开成积分（素材 (3.8)，`main.tex:966-975`）：

$$\oslash\Bigl[\frac{\mathbf P_{\alpha,\beta;N}f(z,w)}{(z-w)^{N}}\Bigr](z)=\sigma(\alpha,\beta+N)\int_{\mathbb D}\int_{\mathbb D}\frac{(\bar z'-\bar w')^{N}}{(1-z\bar z')^{\beta+N+2}(1-z\bar w')^{\alpha+\beta+N+2}}f(z',w')\lvert z'-w'\rvert^{2\beta}\,\mathrm d A(z')\,\mathrm d A_{\alpha}(w').$$

### 3.8 把逐层量换成 $f$ 的 $N$ 阶导数：命题 3.9 与推论 3.10

素材接 (3.8) 说"We want to express this in terms of derivatives of order $N$ of $f$"（`main.tex:977-978`）。由 (3.3) 的级数展开得（素材 (3.9)，`main.tex:980-987`）

$$\bigl[\partial_{z}^{k}P_{\alpha,\beta}\bigr]\bigl((z,z);(z',w')\bigr)=\sum_{n=0}^{k}n!\,(\bar z'-\bar w')^{n}\binom{k}{n}\bigl[\partial_{z}^{k-n}Q_{\alpha,\beta+n}\bigr]\bigl((z,z);(z',w')\bigr),$$

其中 $\partial_z$ 记对 $z$ 的偏导（素材用粗体 `\bpartial`，`main.tex:62`）。再由引理 3.7 计算 $\partial_z^{k-n}Q_{\alpha,\beta}$（`main.tex:989-1012`），对角限制后得

$$\bigl[\partial_{z}^{k-n}Q_{\alpha,\beta}\bigr]\bigl((z,z);(z',w')\bigr)=\frac{(\beta+2)_{k-n}}{(\alpha+2\beta+4)_{k-n}}\ \partial_{z}^{k-n}\frac{\sigma(\alpha,\beta)}{(1-z\bar z')^{\beta+2}(1-z\bar w')^{\alpha+\beta+2}},$$

把 $\beta$ 换成 $\beta+n$ 并用引理 3.3，得（素材 (3.10)，`main.tex:1013-1022`）

$$\bigl[\partial_{z}^{k-n}Q_{\alpha,\beta+n}\bigr]\bigl((z,z);(z',w')\bigr)=\frac{(\beta+n+2)_{k-n}}{(\alpha+2\beta+2n+4)_{k-n}}\ \partial_{z}^{k-n}\bigl[P_{\alpha,\beta+n}\bigl((z,z);(z',w')\bigr)\bigr].$$

把 (3.9) 作用于 $f\in\mathcal L_{\alpha,\beta}(\mathbb D^2)$ 并代入 (3.10)，得

$$\oslash\bigl[\partial_{z}^{k}\mathbf P_{\alpha,\beta}f\bigr](z)=\sum_{n=0}^{k}n!\binom{k}{n}\frac{(\beta+n+2)_{k-n}}{(\alpha+2\beta+2n+4)_{k-n}}\ \partial_{z}^{k-n}\oslash\Bigl[\frac{\mathbf P_{\alpha,\beta;n}f(z,w)}{(z-w)^{n}}\Bigr](z),$$

再对 $z$ 求 $N-k$ 次导（素材 (3.11)，`main.tex:1032-1042`）：

$$\partial_{z}^{N-k}\oslash\bigl[\partial_{z}^{k}\mathbf P_{\alpha,\beta}f\bigr](z)=\sum_{n=0}^{k}n!\binom{k}{n}\frac{(\beta+n+2)_{k-n}}{(\alpha+2\beta+2n+4)_{k-n}}\ \partial_{z}^{N-n}\oslash\Bigl[\frac{\mathbf P_{\alpha,\beta;n}f(z,w)}{(z-w)^{n}}\Bigr](z).$$

目标关系由命题 3.9 给出（`main.tex:1046-1057`）：固定 $-1<\alpha,\beta<+\infty$，对每个 $N=0,1,2,\ldots$，

$$\oslash\Bigl[\frac{\mathbf P_{\alpha,\beta;N}f(z,w)}{(z-w)^{N}}\Bigr]=\sum_{k=0}^{N}a_{k,N}\,\partial_{z}^{N-k}\oslash\bigl[\partial_{z}^{k}\mathbf P_{\alpha,\beta}f\bigr],$$

其中常数为

$$a_{k,N}=\frac{(-1)^{N-k}}{k!\,(N-k)!}\,\frac{(\beta+k+2)_{N-k}}{(\alpha+2\beta+N+k+3)_{N-k}}.$$

证明（`main.tex:1059-1128`）是一次纯粹的组合恒等式验证，中间步值得逐步登记：把 (3.11) 代入右端（素材 (3.12) 的双线求和），只需验证

$$\sum_{k=n}^{N}a_{k,N}\,n!\binom{k}{n}\frac{(\beta+n+2)_{k-n}}{(\alpha+2\beta+2n+4)_{k-n}}=\delta_{n,N},\qquad n=0,1,\ldots,N,$$

代入 $a_{k,N}$ 的显式即

$$\sum_{k=n}^{N}\frac{(-1)^{N-k}}{(k-n)!\,(N-k)!}\frac{(\beta+n+2)_{k-n}(\beta+k+2)_{N-k}}{(\alpha+2\beta+2n+4)_{k-n}(\alpha+2\beta+N+k+3)_{N-k}}=\delta_{n,N}.$$

$n=N$ 时直接验证成立。$n<N$ 时先用 Pochhammer 的拼接恒等式

$$(\beta+n+2)_{k-n}(\beta+k+2)_{N-k}=(\beta+n+2)_{N-n}$$

（与 $k$ 无关，可提出），再用

$$(\alpha+2\beta+2n+4)_{k-n}(\alpha+2\beta+N+k+3)_{N-k}=\frac{(\alpha+2\beta+2n+4)_{2N-2n-1}}{(\alpha+2\beta+n+k+4)_{N-n-1}}$$

把问题压成

$$\sum_{k=n}^{N}\frac{(-1)^{N-k}}{(k-n)!\,(N-k)!}(\alpha+2\beta+n+k+4)_{N-n-1}=0.$$

换元 $j=k-n$、$N'=N-n$，再把 $\lambda=\alpha+2\beta+2n+4$ 当独立变量，最终化为

$$\sum_{j=0}^{N'}(-1)^{j}\binom{N'}{j}(\lambda+j)_{N'-1}=0,\qquad N'=1,2,3,\ldots$$

而 $(\lambda)_{N'-1}$ 是次数 $N'-1$ 的多项式 $q(\lambda)$，$\sum_j(-1)^j\binom{N'}{j}q(\lambda+j)$ 是 $N'$ 阶差分，对次数小于 $N'$ 的多项式自动为零。证毕。

推论 3.10（`main.tex:1134-1143`）把 $\mathcal H_{\alpha,\beta}(\mathbb D^2)$ 的范数完全写成"一维范数之和"，即沿对角线的 Taylor 展开的 analogue：对 $f\in\mathcal H_{\alpha,\beta}(\mathbb D^2)$，

$$\|f\|_{\alpha,\beta}^{2}=\sum_{N=0}^{+\infty}\frac{1}{\sigma(\alpha,\beta+N)}\biggl\|\sum_{k=0}^{N}a_{k,N}\,\partial_{z}^{N-k}\oslash\bigl[\partial_{z}^{k}f\bigr]\biggr\|_{\alpha+2\beta+2N+2}^{2},$$

常数取自引理 3.5 与命题 3.9。证明是 (3.4)、命题 3.8 与命题 3.9 的组合（`main.tex:1145-1149`）。

本稿判读：推论 3.10 是素材所说的"essentially the full strength"的载体，左侧是双盘上的单一范数，右侧是逐阶导数的一维 Bergman 范数的加权和，系数 $a_{k,N}$ 与 $\sigma(\alpha,\beta+N)$ 都显式；把 §2 的面积不等式代到左侧的 $f=\Phi_\theta g$ 型函数上，就能把"和的受控"翻译成"各阶 $\oslash[\partial_z^k f]$ 的受控"，其中第 0 阶正比于 $\varphi''/\varphi'$，这就是 1.7 段所说"难以有效利用的高阶项"的准确出处。

## 4 主不等式：对第二变量积分、双盘正交分解与逐层常数的渐近

素材第 4 节标题 `\section{The main inequality}\label{se4}`（`main.tex:1151`），起首小节题 "Integration with respect to the second variable"（`main.tex:1153`）。本节把 §2 的点态面积不等式对第二变量 $w$ 取加权面积平均，再用 §3 的对角分层展开把左端写成无穷多个一维 Bergman 范数之和，得到全篇核心估计（本稿定理 4.9）。

记号说明：素材在 `\numberwithin{equation}{section}` 下只给带号环境编号，本节带号环境依次为 `eq-16`、`eq-17`、`eq-10.55`、`main-1`、`main-2`、`main-3`、`main-4`、`main-6`、`main-7`、`main-9`、`main-10`、`main-11`、`main-12`、`main-13`、`main-14`，故下文把 $(4.1)$ 到 $(4.15)$ 依次对应到这 15 个标签；`equation*` 与 `multline*` 不计号。定理类环境按 §0 登记的共享计数器依次为引理 4.1、引理 4.2、命题 4.3、引理 4.4、命题 4.5、推论 4.6、命题 4.7、命题 4.8、定理 4.9。

### 4.1 对 $w$ 积分与两次正交分解

固定 $\theta$，$0<\theta\le1$，$\varphi\in\mathcal S$ 任意。素材声明以下部分计算只在 $0<\theta<1$ 有效，$\theta=1$ 的情形"通常可由一个简单极限论证补上"（`main.tex:1154-1157`）。由定理 2.2 得（素材 (4.1)，`main.tex:1158-1164`）

$$\int_{\mathbb D}\bigl\lvert\Phi_\theta(z,w)+L_\theta(z,w)\bigr\rvert^{2}\,\frac{\mathrm d A(z)}{\lvert z-w\rvert^{2\theta}}\le\frac1{\theta}\,\bigl(1-\lvert w\rvert^{2}\bigr)^{-2\theta}.$$

设 $g$ 在 $\mathbb D$ 全纯，则（素材 (4.2)，`main.tex:1167-1175`）

$$\int_{\mathbb D}\int_{\mathbb D}\bigl\lvert\Phi_\theta(z,w)\,g(w)+L_\theta(z,w)\,g(w)\bigr\rvert^{2}\,\lvert z-w\rvert^{-2\theta}\,\mathrm d A(z)\,\mathrm d A_\alpha(w)\le\frac1{\theta}\int_{\mathbb D}\lvert g(w)\rvert^{2}\,\bigl(1-\lvert w\rvert^{2}\bigr)^{-2\theta}\,\mathrm d A_\alpha(w)=\frac{\alpha+1}{\theta(\alpha-2\theta+1)}\lVert g\rVert_{\alpha-2\theta}^{2}.$$

本稿核对最后一个等号：按 $\mathrm d A_\alpha(w)=(\alpha+1)(1-\lvert w\rvert^{2})^{\alpha}\mathrm d A(w)$，中间项等于 $\frac{\alpha+1}{\theta}\int_{\mathbb D}\lvert g\rvert^{2}(1-\lvert w\rvert^{2})^{\alpha-2\theta}\mathrm d A$，而 $\lVert g\rVert_{\alpha-2\theta}^{2}=(\alpha-2\theta+1)\int_{\mathbb D}\lvert g\rvert^{2}(1-\lvert w\rvert^{2})^{\alpha-2\theta}\mathrm d A$，相除即得系数 $\frac{\alpha+1}{\theta(\alpha-2\theta+1)}$。素材注明此等号要求 $-1+2\theta<\alpha<+\infty$（`main.tex:1176-1178`），正是右端积分收敛的条件。

素材随后声明约定：此后设 $g\in\mathcal H_{\alpha-2\theta}(\mathbb D)$ 且 $-1<\alpha-2\theta<+\infty$；(4.2) 左端即 $\Phi_\theta(z,w)g(w)+L_\theta(z,w)g(w)$ 在 $\mathcal L_{\alpha,-\theta}(\mathbb D^{2})$ 中的范数平方（对照 §3，双盘权指数取 $\beta=-\theta$，于是权重 $\lvert z-w\rvert^{2\beta}=\lvert z-w\rvert^{-2\theta}$ 与 (4.2) 左端吻合），并且"稍后将证明该和的两项都属于 $\mathcal L_{\alpha,-\theta}(\mathbb D^{2})$"（`main.tex:1180-1186`）。据此写出全纯/正交补分解（素材 (4.3)，`main.tex:1187-1193`）

$$\Phi_\theta(z,w)\,g(w)+L_\theta(z,w)\,g(w)=\Bigl\{\Phi_\theta(z,w)\,g(w)+\mathbf P_{\alpha,-\theta}\bigl[L_\theta(z,w)\,g(w)\bigr]\Bigr\}+\mathbf P_{\alpha,-\theta}^{\perp}\bigl[L_\theta(z,w)\,g(w)\bigr],$$

以及对应的范数分解（素材 (4.4)，`main.tex:1195-1202`）

$$\bigl\lVert\Phi_\theta(z,w)\,g(w)+L_\theta(z,w)\,g(w)\bigr\rVert_{\alpha,-\theta}^{2}=\bigl\lVert\Phi_\theta(z,w)\,g(w)+\mathbf P_{\alpha,-\theta}\bigl[L_\theta(z,w)\,g(w)\bigr]\bigr\rVert_{\alpha,-\theta}^{2}+\bigl\lVert\mathbf P_{\alpha,-\theta}^{\perp}\bigl[L_\theta(z,w)\,g(w)\bigr]\bigr\rVert_{\alpha,-\theta}^{2},$$

其中 $\mathbf P_{\alpha,-\theta}^{\perp}=\mathbf I-\mathbf P_{\alpha,-\theta}$ 是 $\mathcal L_{\alpha,-\theta}(\mathbb D^{2})$ 中与 $\mathbf P_{\alpha,-\theta}$ 互补的投影，$\mathbf I$ 为恒等算子（`main.tex:1203-1207`）。把 (4.4) 代回 (4.2)，主不等式取得（素材 (4.5)，`main.tex:1209-1217`）

$$\bigl\lVert\Phi_\theta(z,w)\,g(w)+\mathbf P_{\alpha,-\theta}\bigl[L_\theta(z,w)\,g(w)\bigr]\bigr\rVert_{\alpha,-\theta}^{2}\le\frac{\alpha+1}{\theta(\alpha-2\theta+1)}\lVert g\rVert_{\alpha-2\theta}^{2}-\bigl\lVert\mathbf P_{\alpha,-\theta}^{\perp}\bigl[L_\theta(z,w)\,g(w)\bigr]\bigr\rVert_{\alpha,-\theta}^{2}.$$

结构要点：左端是"可算的正项"，右端第一项只依赖 $\alpha,\theta$，第二项是负的正项，可以在后面用逐层展开替换为若干一维范数之和，从而把 (4.5) 变成一条关于 $g$ 的各阶导数与 $\Phi_\theta$ 的各阶对角导数的显式不等式。

### 4.2 补投影项范数的显式：引理 4.1、4.2 与命题 4.3

由勾股关系（素材 (4.6)，`main.tex:1225-1232`）

$$\bigl\lVert\mathbf P_{\alpha,-\theta}^{\perp}\bigl[L_\theta(z,w)\,g(w)\bigr]\bigr\rVert_{\alpha,-\theta}^{2}=\bigl\lVert L_\theta(z,w)\,g(w)\bigr\rVert_{\alpha,-\theta}^{2}-\bigl\lVert\mathbf P_{\alpha,-\theta}\bigl[L_\theta(z,w)\,g(w)\bigr]\bigr\rVert_{\alpha,-\theta}^{2}.$$

素材先复述 Gauss 超几何函数的定义（`main.tex:1233-1236`）：${}_2F_1(a,b;c;x)=1+\sum_{n=1}^{+\infty}\frac{(a)_n(b)_n}{(c)_n\,n!}x^n$，至少对 $x\in\mathbb D$ 收敛（除非某项分母碰巧为零）。

引理 4.1（`main.tex:1238-1247`）：固定 $w\in\mathbb D$，则

$$\int_{\mathbb D}\bigl\lvert L_\theta(z,w)\bigr\rvert^{2}\,\lvert z-w\rvert^{-2\theta}\,\mathrm d A(z)=\frac1{\theta}\Bigl[1-{}_2F_1\bigl(1-\theta,-\theta;1;\lvert w\rvert^{2}\bigr)\Bigr]\,\bigl(1-\lvert w\rvert^{2}\bigr)^{-2\theta}.$$

证明（`main.tex:1249-1263`）的两步都要登记：作 Möbius 替换 $z=\frac{w-\zeta}{1-\bar w\zeta}$、等价地 $\zeta=\frac{w-z}{1-\bar w z}$，得

$$\int_{\mathbb D}\bigl\lvert L_\theta(z,w)\bigr\rvert^{2}\lvert z-w\rvert^{-2\theta}\,\mathrm d A(z)=\bigl(1-\lvert w\rvert^{2}\bigr)^{-2\theta}\int_{\mathbb D}\biggl\lvert\frac{1-(1-\bar w\zeta)^{\theta-1}}{\zeta}\biggr\rvert^{2}\,\lvert\zeta\rvert^{-2\theta}\,\mathrm d A(\zeta),$$

再把被积式中的幂按 Taylor 级数展开，并用"径向加权 Bergman 空间中 $z^j$ 与 $z^k$ 在 $j\ne k$ 时正交"把交叉项全部消掉，剩下的系数级数正是 ${}_2F_1(1-\theta,-\theta;1;\lvert w\rvert^{2})$ 的补。

引理 4.2（`main.tex:1265-1271`）：对 $w\in\mathbb D$，

$${}_2F_1\bigl(1-\theta,-\theta;1;\lvert w\rvert^{2}\bigr)\ge{}_2F_1\bigl(1-\theta,-\theta;1;1\bigr)=\frac{\Gamma(2\theta+1)}{2\bigl[\Gamma(\theta+1)\bigr]^{2}}.$$

证明（`main.tex:1273-1280`）指出：${}_2F_1(1-\theta,-\theta;1;x)$ 的 Taylor 系数除首项外全为负，故在 $x\in[0,1)$ 上不小于端点值；端点值是特殊函数教科书里的经典求值。

命题 4.3（`main.tex:1284-1297`）把两引理合成：对 $g\in\mathcal H_{\alpha-2\theta}(\mathbb D)$，

$$\int_{\mathbb D}\bigl\lvert L_\theta(z,w)\,g(w)\bigr\rvert^{2}\,\lvert z-w\rvert^{-2\theta}\,\mathrm d A(z)\,\mathrm d A_\alpha(w)=\frac{\alpha+1}{\theta(\alpha-2\theta+1)}\int_{\mathbb D}\Bigl[1-{}_2F_1\bigl(1-\theta,-\theta;1;\lvert w\rvert^{2}\bigr)\Bigr]\,\lvert g(w)\rvert^{2}\,\mathrm d A_{\alpha-2\theta}(w)$$

$$\le\frac{\alpha+1}{\theta(\alpha-2\theta+1)}\left[1-\frac{\Gamma(2\theta+1)}{2\bigl[\Gamma(\theta+1)\bigr]^{2}}\right]\lVert g\rVert_{\alpha-2\theta}^{2}.$$

由此特别看出 $L_\theta(z,w)g(w)\in\mathcal L_{\alpha,-\theta}(\mathbb D^{2})$（即 (4.3) 后面那句"稍后证明"的内容在此兑现），并且它的范数平方有表示（素材 (4.7)，`main.tex:1301-1312`）

$$\bigl\lVert L_\theta(z,w)g(w)\bigr\rVert_{\alpha,-\theta}^{2}=\frac{\alpha+1}{\theta(\alpha-2\theta+1)}\left(1-\frac{\Gamma(2\theta+1)}{2\bigl[\Gamma(\theta+1)\bigr]^{2}}\right)\lVert g\rVert_{\alpha-2\theta}^{2}+\frac{\alpha+1}{\theta(\alpha-2\theta+1)}$$

$$\times\int_{\mathbb D}\Bigl[{}_2F_1(1-\theta,-\theta;1;1)-{}_2F_1(1-\theta,-\theta;1;\lvert w\rvert^{2})\Bigr]\,\lvert g(w)\rvert^{2}\,\mathrm d A_{\alpha-2\theta}(w).$$

素材说首项是"本质项"，第二项可视为"高阶项的贡献"，并把它做成引理 4.4（`main.tex:1318-1328`）：存在只依赖 $\alpha,\theta$ 的正常数 $C_1$，使

$$0\le\int_{\mathbb D}\Bigl[{}_2F_1(1-\theta,-\theta;1;\lvert w\rvert^{2})-{}_2F_1(1-\theta,-\theta;1;1)\Bigr]\,\lvert g(w)\rvert^{2}\,\mathrm d A_{\alpha-2\theta}(w)\le C_1\,\lVert g\rVert_{\alpha-\theta}^{2}.$$

证明（`main.tex:1330-1357`）的中间步：先用两条初等工具 $1-x^n\le n^{\theta}(1-x)^{\theta}$（$0\le x\le1$）与 Pochhammer 的标准渐近 $(1-\theta)_n/n!\sim n^{-\theta}/\Gamma(1-\theta)$（$n\to+\infty$），把级数逐项放大为

$$\int_{\mathbb D}\sum_{n=1}^{+\infty}\frac{\lvert(-\theta)_n\rvert(1-\theta)_n}{(n!)^{2}}\bigl(1-\lvert w\rvert^{2n}\bigr)\lvert g\rvert^{2}\,\mathrm d A_{\alpha-2\theta}(w)\le\theta\int_{\mathbb D}\sum_{n=1}^{+\infty}\frac{\bigl[(1-\theta)_n\bigr]^{2}}{(n-\theta)(n!)^{2}}\,n^{\theta}\bigl(1-\lvert w\rvert^{2}\bigr)^{\theta}\lvert g\rvert^{2}\,\mathrm d A_{\alpha-2\theta}(w)$$

$$\le C_2(\alpha,\theta)\left(\sum_{n=1}^{+\infty}\frac{n^{-\theta}}{n-\theta}\right)\lVert g\rVert_{\alpha-\theta}^{2},$$

其中最后一步认出 $\bigl(1-\lvert w\rvert^{2}\bigr)^{\theta}\,\mathrm d A_{\alpha-2\theta}(w)$ 与 $\mathrm d A_{\alpha-\theta}(w)$ 只差一个常数倍；取 $C_1(\alpha,\theta)=C_2(\alpha,\theta)\sum_{n\ge1}n^{-\theta}/(n-\theta)$ 即得（$0<\theta<1$ 时级数收敛，$\theta=1$ 平凡）。素材补一句：把右端 $\lVert g\rVert_{\alpha-\theta}^{2}$ 换成 $\lVert g\rVert_{\alpha-2\theta+\nu}^{2}$，结论对任意固定 $0<\nu<2\theta$ 仍然成立（`main.tex:1359-1362`）。于是 (4.7) 有缩写（素材 (4.8)，`main.tex:1364-1374`）

$$\bigl\lVert L_\theta(z,w)g(w)\bigr\rVert_{\alpha,-\theta}^{2}=\frac{\alpha+1}{\theta(\alpha-2\theta+1)}\left[1-\frac{\Gamma(2\theta+1)}{2\bigl[\Gamma(\theta+1)\bigr]^{2}}\right]\lVert g\rVert_{\alpha-2\theta}^{2}+O\bigl(\lVert g\rVert_{\alpha-\theta}^{2}\bigr),$$

"大 $O$" 中的常数只依赖 $\alpha,\theta$。

### 4.3 投影项的逐层计算：命题 4.5 与推论 4.6

剩下的问题是 $\mathbf P_{\alpha,-\theta}\bigl[L_\theta(z,w)g(w)\bigr]$ 的范数。素材的做法是按对角展开逐层算，沿用 (3.4) 的分层正交分解与命题 3.8 的逐层范数公式（`main.tex:1375-1381`）。

命题 4.5（`main.tex:1383-1390`）：对 $g\in\mathcal H_{\alpha-2\theta}(\mathbb D)$，

$$\oslash\biggl[\frac{\mathbf P_{\alpha,-\theta;N}\bigl[L_\theta(z,w)\,g(w)\bigr]}{(z-w)^{N}}\biggr](z)=\frac{(-1)^{N+1}(1-\theta)_{N+1}}{(N+1)!\,\bigl(\alpha+N+2-2\theta\bigr)_{N+1}}\;g^{(N+1)}(z),\qquad z\in\mathbb D.$$

证明（`main.tex:1392-1473`）的链条较长但每步初等，逐段登记。第一段，按 (3.8) 把 $\mathbf P_{\alpha,-\theta;N}$ 写成核积分（`main.tex:1393-1403`）

$$\oslash\biggl[\frac{\mathbf P_{\alpha,-\theta;N}\bigl[L_\theta g\bigr]}{(z-w)^{N}}\biggr](z)=\sigma(\alpha,-\theta+N)\int_{\mathbb D}\int_{\mathbb D}\frac{(\bar z'-\bar w')^{N}}{(1-z\bar z')^{-\theta+N+2}(1-z\bar w')^{\alpha-\theta+N+2}}\,L_\theta(z',w')\,g(w')\,\lvert z'-w'\rvert^{-2\theta}\,\mathrm d A(z')\,\mathrm d A_\alpha(w').$$

第二段，先对 $z'$ 积分。作替换 $z'=\frac{w'+\zeta}{1+\bar w'\zeta}$、等价地 $\zeta=\frac{w'-z'}{1-\bar w'z'}$，把积分化为关于 $\zeta$ 的形式，展开 $(1+\bar w'\zeta)^{\theta-1}-1$ 与 $\bigl(1+\bar\zeta\frac{w'-z}{1-z\bar w'}\bigr)^{\theta-N-2}$ 两个二项级数并按 $\bar\zeta^{N}\zeta^{n}$ 的正交性取系数（`main.tex:1410-1428`），得

$$\int_{\mathbb D}\frac{(\bar z'-\bar w')^{N}}{(1-z\bar z')^{-\theta+N+2}(1-z\bar w')^{\alpha-\theta+N+2}}\,L_\theta(z',w')\,\lvert z'-w'\rvert^{-2\theta}\,\mathrm d A(z')$$

$$=\bar w'\,\frac{(1-\lvert w'\rvert^{2})^{N+1-2\theta}}{(1-z\bar w')^{\alpha-2\theta+2N+4}}\sum_{n=0}^{+\infty}\frac{\binom{\theta-1}{N+n+1}\binom{\theta-N-2}{n}}{N+n+1-\theta}\,(\bar w')^{N+n}\Bigl(\frac{w'-z}{1-z\bar w'}\Bigr)^{n}.$$

第三段，再对 $w'$ 积分（`main.tex:1429-1441`）：把上式乘 $g(w')$ 后对 $\mathrm d A_\alpha(w')$ 积分，出现因子 $(\alpha+1)$，权重合并成 $(1-\lvert w'\rvert^{2})^{N+1+\alpha-2\theta}$，分母幂次变成 $(1-z\bar w')^{\alpha-2\theta+2N+n+4}$，分子留下 $(\bar w')^{N+n+1}(w'-z)^{n}$。

第四段，用"把再生恒等式求 $k$ 次导"得到的公式（`main.tex:1443-1449`）

$$\int_{\mathbb D}\frac{(\bar w')^{k}}{(1-z\bar w')^{\gamma+k+2}}\,f(w')\,\mathrm d A_\gamma(w')=\frac{1}{(\gamma+2)_{k}}\,f^{(k)}(z),$$

双重积分于是坍缩为 $g^{(N+1)}(z)$ 乘一个纯系数级数（`main.tex:1450-1458`）

$$\oslash\biggl[\frac{\mathbf P_{\alpha,-\theta;N}\bigl[L_\theta g\bigr]}{(z-w)^{N}}\biggr](z)=(-1)^{N+1}(\alpha+1)\,\frac{\sigma(\alpha,-\theta+N)}{(N+1)!}\,g^{(N+1)}(z)\sum_{n=0}^{+\infty}\frac{(1-\theta)_{N+n+1}(N+1-\theta)_{n}}{(N+1-\theta)\,n!\,(\alpha+N-2\theta+2)_{N+n+2}}.$$

第五段，把 $(1-\theta)_{N+n+1}=(1-\theta)_{N}(N+1-\theta)_{n}$ 拆开，提出 $n$ 无关因子，剩下的识别为 ${}_2F_1(N+1-\theta,N+2-\theta;\alpha+2N-2\theta+4;1)$（`main.tex:1460-1470`），再施 Gauss 恒等式 (3.7) 与引理 3.5 给出的 $\sigma(\alpha,\beta)$ 显式（素材此处引它自己的 `Gausshypergeom` 与 `lm-4`，即 (3.7) 与引理 3.5，`main.tex:1471-1472`），系数正好化为 $\frac{(-1)^{N+1}(1-\theta)_{N+1}}{(N+1)!(\alpha+N+2-2\theta)_{N+1}}$。

推论 4.6（素材 (4.9)，`main.tex:1475-1487`）：对 $g\in\mathcal H_{\alpha-2\theta}(\mathbb D)$，

$$\Bigl\lVert\mathbf P_{\alpha,-\theta}\bigl[L_\theta(z,w)\,g(w)\bigr]\Bigr\rVert_{\alpha,-\theta}^{2}=\sum_{N=0}^{+\infty}\frac{1}{\sigma(\alpha,-\theta+N)}\left[\frac{(1-\theta)_{N+1}}{(N+1)!\,\bigl(\alpha+N+2-2\theta\bigr)_{N+1}}\right]^{2}\bigl\lVert g^{(N+1)}\bigr\rVert_{\alpha-2\theta+2N+2}^{2}.$$

这条式子把"双盘上第 $N$ 层投影的范数"换成"$g$ 的 $N+1$ 阶导数在一维空间 $\mathcal H_{\alpha-2\theta+2N+2}(\mathbb D)$ 中的范数"，两个权指数之差恰为 $2N+2$，正是下一小节要处理的位移。

### 4.4 位移范数与导数范数的差：命题 4.7

命题 4.7（`main.tex:1491-1502`，条件是 $-1<\alpha<+\infty$）：固定实参数 $\nu$，$0<\nu\le1$，则存在正常数 $C_3(\alpha,\nu)$，使对每个 $g\in\mathcal H_\alpha(\mathbb D)$ 与每个整数 $n=1,2,3,\ldots$，

$$0\le(\alpha+2)_{2n}\lVert g\rVert_{\alpha}^{2}-\bigl\lVert g^{(n)}\bigr\rVert_{\alpha+2n}^{2}\le C_3(\alpha,\nu)\,n^{2\nu}(\alpha+2)_{2n}\lVert g\rVert_{\alpha+\nu}^{2}.$$

证明（`main.tex:1504-1541`）三步齐全，值得逐字登记。第一步，范数的 Taylor 系数表示（`main.tex:1505-1508`）：

$$\lVert g\rVert_{\alpha}^{2}=\sum_{k=0}^{+\infty}\frac{k!}{(\alpha+2)_{k}}\,\lvert\widehat g(k)\rvert^{2},\qquad g(z)=\sum_{k\ge0}\widehat g(k)z^{k}.$$

第二步，把它代入差式，用 $\bigl(g^{(n)}\bigr)^{\wedge}(k-n)=(k-n+1)_n\,\widehat g(k)$ 换指标（`main.tex:1510-1519`）：

$$(\alpha+2)_{2n}\lVert g\rVert_{\alpha}^{2}-\bigl\lVert g^{(n)}\bigr\rVert_{\alpha+2n}^{2}=(\alpha+2)_{2n}\sum_{k=0}^{+\infty}\left(1-\frac{(k-n+1)_{n}}{(k+\alpha+2)_{n}}\right)\frac{k!}{(\alpha+2)_{k}}\lvert\widehat g(k)\rvert^{2}.$$

第三步，控制括号里的系数，得技术不等式（素材 (4.10)，`main.tex:1522-1526`）：对 $k=0,1,2,\ldots$、$n=1,2,3,\ldots$，

$$0\le1-\frac{(k-n+1)_{n}}{(k+\alpha+2)_{n}}\le C_4(\alpha)\frac{n^{2\nu}}{(k+1)^{\nu}}.$$

左端非负显然。素材指出右端在 $k\le n^{2}-1$ 时"几乎显然"（可取 $C_4(\alpha)=1$），因为此时 $(k-n+1)_n$ 中会出现非正因子而使左端不超过 $1$，而右端 $\ge C_4 n^{2\nu}/n^{2\nu}=C_4$。对 $k\ge n^{2}$ 用对数估计（`main.tex:1529-1538`）：

$$1-\frac{(k-n+1)_{n}}{(k+\alpha+2)_{n}}\le\log\frac{(k+\alpha+2)_{n}}{(k-n+1)_{n}}=\sum_{l=1}^{n}\left[\log\Bigl(1+\frac{\alpha+1+l}{k}\Bigr)-\log\Bigl(1-\frac{n-l}{k}\Bigr)\right]$$

$$\le\sum_{l=1}^{n}\left[\frac{\alpha+1+l}{k}+C_5\frac{n-l}{k}\right]\le C_4(\alpha)\frac{n^{2}}{k+1}\le C_4(\alpha)\left[\frac{n^{2}}{k+1}\right]^{\nu},$$

其中最后一步用了 $\nu\le1$ 与 $\frac{n^2}{k+1}\le1$（由 $k\ge n^{2}$ 保证 $n^2/(k+1)<1$）。把这三步合并即得命题。

这条不等式的作用是把 $\bigl\lVert g^{(N+1)}\bigr\rVert_{\alpha-2\theta+2N+2}^{2}$ 换成 $(\alpha-2\theta+2)_{2N+2}\lVert g\rVert_{\alpha-2\theta}^{2}$，误差按命题 4.7 取 $\nu=\theta$ 控制；素材说明只要 $0<\nu<2\theta$ 误差级数就收敛（`main.tex:1543-1548`）。

### 4.5 投影侧的主常数 $\varkappa(\alpha,\theta)$

由 (4.9) 作上述替换后，素材经代数化简得（素材 (4.11)，`main.tex:1550-1556`）

$$\Bigl\lVert\mathbf P_{\alpha,-\theta}\bigl[L_\theta(z,w)\,g(w)\bigr]\Bigr\rVert_{\alpha,-\theta}^{2}=\varkappa(\alpha,\theta)\lVert g\rVert_{\alpha-2\theta}^{2}+O\bigl(\lVert g\rVert_{\alpha-\theta}^{2}\bigr),$$

其中主常数由一条显式级数给出（素材 (4.12)，`main.tex:1558-1567`）

$$\varkappa(\alpha,\theta)=\frac{(1-\theta)\,\Gamma(\alpha+2)\,\Gamma(\alpha+2-2\theta)}{\Gamma(\alpha+2-\theta)\,\Gamma(\alpha+3-\theta)}\sum_{N=0}^{+\infty}\bigl(\alpha+3-2\theta+2N\bigr)\,\frac{(1-\theta)_{N}(2-\theta)_{N}\bigl[(\alpha+2-2\theta)_{N}\bigr]^{2}}{(\alpha+2-\theta)_{N}(\alpha+3-\theta)_{N}\bigl[(N+1)!\bigr]^{2}},$$

而"来自余项估计的那条级数"由 Pochhammer 的标准渐近收敛（`main.tex:1568-1569`）。这里 $\varkappa$ 是素材宏 `\fopar`（`main.tex:90`）的展开，本稿按 §0 的换算表统一写 $\varkappa(\alpha,\theta)$。

素材把 $\varkappa(\alpha,\theta)$ 改写成广义超几何函数的形式，先复述定义（`main.tex:1571-1576`）

$${}_4F_3\biggl(\begin{matrix}a_1&a_2&a_3&a_4\\&b_1&b_2&b_3\end{matrix}\bigg|x\biggr)=1+\sum_{n=1}^{+\infty}\frac{(a_1)_n(a_2)_n(a_3)_n(a_4)_n}{(b_1)_n(b_2)_n(b_3)_n\,n!}\,x^{n}$$

在级数收敛处成立。关键手法是把 (4.12) 级数里的末因子拆成 $\alpha+3-2\theta+2N=(\alpha+2-2\theta+N)+(N+1)$（`main.tex:1577-1578`），拆出的两段各自凑成一条 ${}_4F_3$ 在 $x=1$ 的值，于是（素材 (4.13)，`main.tex:1579-1597`）

$$\varkappa(\alpha,\theta)=\frac{(1-\theta)\,\Gamma(\alpha+2)\Gamma(\alpha+2-2\theta)}{\Gamma(\alpha+2-\theta)\Gamma(\alpha+3-\theta)}\left\{\frac{(\alpha+1-\theta)(\alpha+2-\theta)}{\theta(1-\theta)(\alpha+1-2\theta)}-\right.$$

$$-\left.\frac{(\alpha+1-\theta)(\alpha+2-\theta)}{\theta(1-\theta)(\alpha+1-2\theta)}\,{}_4F_3\biggl(\begin{matrix}-\theta&1-\theta&\alpha-2\theta+1&\alpha-2\theta+2\\&1&\alpha-\theta+1&\alpha-\theta+2\end{matrix}\bigg|1\biggr)+{}_4F_3\biggl(\begin{matrix}1-\theta&2-\theta&\alpha-2\theta+2&\alpha-2\theta+2\\&2&\alpha-\theta+2&\alpha-\theta+3\end{matrix}\bigg|1\biggr)\right\}.$$

本稿核对拆分确实给出两个 ${}_4F_3$：第一段多出因子 $(\alpha+2-2\theta+N)=(\alpha+2-2\theta)(\alpha+3-2\theta)_{N}$，把它并入分子参数列即得 $(-\theta,1-\theta,\alpha-2\theta+1,\alpha-2\theta+2)$ 与分母 $(1,\alpha-\theta+1,\alpha-\theta+2)$；第二段多出 $(N+1)$，与 $[(N+1)!]^2$ 相消后把分母的 $1$ 升为 $2$、分子的 $(2-\theta)_N$ 升为 $(2-\theta)_N$ 并补上 $(\alpha-2\theta+2)_N$，正好是第二个 ${}_4F_3$ 的参数列。素材没有展开这一步，本稿按 Pochhammer 的移位规则 $(a)_{N+1}=(a)_N(a+N+1)$ 复原。

### 4.6 不等式两端的合成与定理 4.9

把 (4.6)、(4.8) 与 (4.11) 合并，(4.5) 的右端化为（`main.tex:1598-1603`）

$$\left\{\frac{(\alpha+1)\,\Gamma(2\theta+1)}{2\theta\,(\alpha-2\theta+1)\bigl[\Gamma(\theta+1)\bigr]^{2}}+\varkappa(\alpha,\theta)\right\}\lVert g\rVert_{\alpha-2\theta}^{2}+O\bigl(\lVert g\rVert_{\alpha-\theta}^{2}\bigr).$$

左端则用推论 3.10 与命题 4.5 展开。素材为此对 $k=0,1,2,\ldots$ 引入对角函数（`main.tex:1606-1609`）

$$\Phi_{k,\theta}(z)=\oslash\bigl[\partial_{z}^{k}\Phi_\theta\bigr](z),\qquad z\in\mathbb D,$$

即 $\Phi_\theta(z,w)$ 对第一个变量求 $k$ 次导后再取对角线，并得到命题 4.8（`main.tex:1612-1637`，条件 $-1+2\theta<\alpha<+\infty$）：对 $g\in\mathcal H_{\alpha-2\theta}(\mathbb D)$，

$$\Bigl\lVert\Phi_\theta(z,w)\,g(w)+\mathbf P_{\alpha,-\theta}\bigl[L_\theta(z,w)\,g(w)\bigr]\Bigr\rVert_{\alpha,-\theta}^{2}=\sum_{N=0}^{+\infty}\frac{1}{\sigma(\alpha,-\theta+N)}\left\lVert b_N\,g^{(N+1)}(z)+\sum_{k=0}^{N}a_{k,N}\,\partial_{z}^{N-k}\bigl[\Phi_{k,\theta}(z)\,g(z)\bigr]\right\rVert_{\alpha-2\theta+2N+2}^{2},$$

其中（素材 (4.14)，`main.tex:1626-1629`）

$$b_N=\frac{(-1)^{N+1}(1-\theta)_{N+1}}{(N+1)!\,(\alpha-2\theta+N+2)_{N+1}}$$

与（素材 (4.15)，`main.tex:1631-1635`）

$$a_{k,N}=\frac{(-1)^{N-k}}{k!\,(N-k)!}\,\frac{(-\theta+k+2)_{N-k}}{(\alpha-2\theta+N+k+3)_{N-k}}.$$

本稿核对系数来源：$b_N$ 就是命题 4.5 右端的系数，$a_{k,N}$ 是命题 3.9 的通用系数 $a_{k,N}=\frac{(-1)^{N-k}}{k!(N-k)!}\frac{(\beta+k+2)_{N-k}}{(\alpha+2\beta+N+k+3)_{N-k}}$ 在 $\beta=-\theta$ 处的取值，两处都自洽。

素材把这一步的说明写成一句"Finally, we express the main inequality (4.5) in the following guise"（`main.tex:1639-1640`），随即给出本节的目标定理 4.9（`main.tex:1642-1662`）。

定理 4.9（主不等式；条件 $-1+2\theta<\alpha<+\infty$，$0<\theta\le1$）：存在只依赖 $\alpha,\theta$ 的常数 $C_6(\alpha,\theta)$，使对任意 $g\in\mathcal H_{\alpha}(\mathbb D)$，

$$\sum_{N=0}^{+\infty}\frac{1}{\sigma(\alpha,-\theta+N)}\left\lVert b_N\,g^{(N+1)}(z)+\sum_{k=0}^{N}a_{k,N}\,\partial_{z}^{N-k}\bigl[\Phi_{k,\theta}(z)\,g(z)\bigr]\right\rVert_{\alpha-2\theta+2N+2}^{2}\le$$

$$\le\left[\frac{(\alpha+1)\,\Gamma(2\theta+1)}{2\theta\,(\alpha-2\theta+1)\bigl[\Gamma(\theta+1)\bigr]^{2}}+\varkappa(\alpha,\theta)\right]\lVert g\rVert_{\alpha-2\theta}^{2}+C_6(\alpha,\theta)\,\lVert g\rVert_{\alpha-\theta}^{2},$$

其中 $\sigma(\alpha,N-\theta)$、$b_N$、$a_{k,N}$、$\varkappa(\alpha,\theta)$ 依次由引理 3.5、(4.14)、(4.15)、(4.13) 给出（`main.tex:1658-1661`）。注意定理陈述里 $g$ 的入口空间写 $\mathcal H_\alpha$，而右端主项的范数下标是 $\alpha-2\theta$、余项下标是 $\alpha-\theta$，即"位移 $2\theta$ 的主项 + 位移 $\theta$ 的次项"这种结构。

本稿判读：定理 4.9 把 §2 的一条点态面积不等式转成了"一列一维 Bergman 范数的平方和 $\le$ 一条显式常数乘低一阶范数 + 更低位移的余项"。左端第 $N$ 层是 $b_Ng^{(N+1)}+\sum_{k\le N}a_{k,N}\partial_z^{N-k}[\Phi_{k,\theta}g]$ 的 $\mathcal H_{\alpha-2\theta+2N+2}$ 范数，$\Phi_{0,\theta}=\frac{1-\theta}{2}\frac{\varphi''}{\varphi'}$，因此 $N=0$ 层就是 $-\frac{1-\theta}{\alpha+2}g'+\frac{1-\theta}{2}\frac{\varphi''}{\varphi'}g$ 在 $\mathcal H_{\alpha+1}$ 中的范数（把 (4.14)、(4.15) 取 $N=0$ 代入：$b_0=-\frac{1-\theta}{\alpha-2\theta+2}$，$a_{0,0}=\frac{-\theta+2}{\alpha-2\theta+3}$，与 §6 里 (6.3) 的形式相差一个可吸收的常数倍）；$N=1$ 层开始才出现 $\frac{\varphi'''}{\varphi'}$ 与 $\bigl(\frac{\varphi''}{\varphi'}\bigr)^{2}$。素材在 §6 只取前一到三层就换掉了历史上最好的解析界，这正说明主不等式的强度集中在低层。

## 5 $\varphi$ 形式的代数：对角函数 $\Phi_{k,\theta}$ 与幂的导数因子

素材第 5 节标题 `\section{The algebra of $\varphi$-forms}\label{sec-alg}`（`main.tex:1664`）。这一节是给定理 4.9 左端"配系数"的：每一层出现的 $\Phi_{k,\theta}$ 都是形如 $\frac{\varphi^{(j_1+1)}\cdots\varphi^{(j_n+1)}}{[\varphi']^{n}}$ 的表达式的线性组合，素材把这类表达式组织成一个带次数与双次数的代数。

### 5.1 单项 $\varphi$ 形式、次数与双次数

素材从两个经典表达式开场（`main.tex:1666-1674`）：$\frac{\varphi''(z)}{\varphi'(z)}$ 称为"导数的对数导数"或"预 Schwarz 导数"（pre-Schwarzian），$\frac{\varphi'''(z)}{\varphi'(z)}-\frac32\bigl[\frac{\varphi''(z)}{\varphi'(z)}\bigr]^{2}$ 称为 Schwarz 导数。定义（`main.tex:1677-1686`）：形如 $\frac{\varphi^{(n+1)}(z)}{\varphi'(z)}$（$n$ 为正整数）的表达式是次数 $n$、双次数 $1$ 的单项 $\varphi$ 形式；次数与双次数在乘法下可加，例如 $\frac{\varphi'''(z)\varphi''(z)}{[\varphi'(z)]^{2}}$ 是次数 $3$、双次数 $2$ 的单项 $\varphi$ 形式；同次数同双次数的线性组合仍称单项 $\varphi$ 形式；同次数不同双次数的组合称"次数 $n$ 的 $\varphi$ 形式（不带双次数）"；再对不同次数的组合取最大次数，得到次数 $n$ 的 $\varphi$ 形式，如此得到"$\varphi$ 形式的代数"（`main.tex:1687-1692`）。素材末句声明："就我们关心而言，只有单项 $\varphi$ 形式才有趣味"（`main.tex:1692-1693`）。

### 5.2 $\Phi_\theta$ 沿对角线的 Taylor 展开与命题 5.1

素材的小节题 "Explicit calculation of the functions $\Phi_{k,\theta}$"（`main.tex:1696`）从回忆出发式（`main.tex:1697-1701`）

$$\Phi_\theta(z,w)=\frac1{z-w}\left\{\frac{\varphi'(z)}{\varphi'(w)}\left(\frac{\varphi(z)-\varphi(w)}{\varphi'(w)(z-w)}\right)^{-\theta-1}-1\right\},\qquad(z,w)\in\mathbb D^{2},\ z\ne w$$

开始，把 $\varphi(z)$ 在 $z=w$ 处 Taylor 展开 $\varphi(z)=\varphi(w)+\sum_{j=1}^{+\infty}\frac{\varphi^{(j)}(w)}{j!}(z-w)^{j}$，于是差商写成（`main.tex:1702-1710`）

$$\frac{\varphi(z)-\varphi(w)}{\varphi'(w)(z-w)}=1+\sum_{j=2}^{+\infty}\frac1{j!}\,\frac{\varphi^{(j)}(w)}{\varphi'(w)}\,(z-w)^{j-1},$$

对其取 $-\theta-1$ 次幂并用二项级数（`main.tex:1711-1724`）

$$\left(\frac{\varphi(z)-\varphi(w)}{\varphi'(w)(z-w)}\right)^{-\theta-1}=\sum_{n=0}^{+\infty}\binom{-\theta-1}{n}\left(\sum_{j=2}^{+\infty}\frac1{j!}\,\frac{\varphi^{(j)}(w)}{\varphi'(w)}(z-w)^{j-1}\right)^{n}=1+\sum_{n=1}^{+\infty}\binom{-\theta-1}{n}(z-w)^{n}\left(\sum_{j=2}^{+\infty}\frac1{j!}\,\frac{\varphi^{(j)}(w)}{\varphi'(w)}(z-w)^{j-2}\right)^{n},$$

同时 $\frac{\varphi'(z)}{\varphi'(w)}=1+\sum_{k=2}^{+\infty}\frac1{(k-1)!}\frac{\varphi^{(k)}(w)}{\varphi'(w)}(z-w)^{k-1}$（`main.tex:1725-1727`）。两式相乘、减去 $1$ 再除以 $z-w$，得 $\Phi_\theta$ 的展开（`main.tex:1728-1751`）

$$\Phi_\theta(z,w)=\sum_{k=2}^{+\infty}\frac1{(k-1)!}\,\frac{\varphi^{(k)}(w)}{\varphi'(w)}(z-w)^{k-2}+\sum_{k=1}^{+\infty}\frac1{(k-1)!}\,\frac{\varphi^{(k)}(w)}{\varphi'(w)}(z-w)^{k-1}\sum_{n=1}^{+\infty}\binom{-\theta-1}{n}(z-w)^{n-1}\left(\sum_{j=2}^{+\infty}\frac1{j!}\,\frac{\varphi^{(j)}(w)}{\varphi'(w)}(z-w)^{j-2}\right)^{n},$$

再把内层的 $n$ 次幂展开成 $n$ 重和（`main.tex:1752-1759`）

$$\left(\sum_{j=2}^{+\infty}\frac1{j!}\,\frac{\varphi^{(j)}(w)}{\varphi'(w)}(z-w)^{j-2}\right)^{n}=\sum_{j_1,\ldots,j_n=1}^{+\infty}\frac{\varphi^{(j_1+1)}(w)\cdots\varphi^{(j_n+1)}(w)}{(j_1+1)!\cdots(j_n+1)!\,[\varphi'(w)]^{n}}\,(z-w)^{j_1+\cdots+j_n-n},$$

整理出素材带标签 `eq-5.01` 的主展开式（素材 (5.1)，`main.tex:1761-1772`）

$$\Phi_\theta(z,w)=\sum_{l=0}^{+\infty}\frac1{(l+1)!}\,\frac{\varphi^{(l+2)}(w)}{\varphi'(w)}(z-w)^{l}+\left\{1+\sum_{l=1}^{+\infty}\frac1{l!}\,\frac{\varphi^{(l+1)}(w)}{\varphi'(w)}(z-w)^{l}\right\}\sum_{n=1}^{+\infty}\binom{-\theta-1}{n}\sum_{j_1,\ldots,j_n=1}^{+\infty}\frac{\varphi^{(j_1+1)}(w)\cdots\varphi^{(j_n+1)}(w)}{(j_1+1)!\cdots(j_n+1)!\,[\varphi'(w)]^{n}}(z-w)^{j_1+\cdots+j_n-1}.$$

对整数 $k,n$（$1\le n\le k$）引入（`main.tex:1774-1779`）

$$\Psi_{k,n}(z)=\sum_{(j_1,\ldots,j_n)\in I(k,n)}\frac{\varphi^{(j_1+1)}(z)\cdots\varphi^{(j_n+1)}(z)}{(j_1+1)!\cdots(j_n+1)!\,[\varphi'(z)]^{n}},$$

其中 $I(k,n)$ 是满足 $j_1+\cdots+j_n=k$ 的正整数 $n$ 元组之集；$\Psi_{k,n}$ 是次数 $k$、双次数 $n$ 的单项 $\varphi$ 形式。素材给了两个起步算例（`main.tex:1782-1785`）：

$$\Psi_{k,1}(z)=\frac{\varphi^{(k+1)}(z)}{(k+1)!\,\varphi'(z)},\qquad\Psi_{k,2}(z)=\sum_{l=1}^{k-1}\frac{\varphi^{(l+1)}(z)\,\varphi^{(k-l+1)}(z)}{(l+1)!(k-l+1)!\,[\varphi'(z)]^{2}}.$$

命题 5.1（`main.tex:1787-1795`）：对 $k=0,1,2,\ldots$，

$$\Phi_{k,\theta}(z)=\oslash\bigl[\partial_{z}^{k}\Phi_\theta\bigr](z)=(k+1-\theta)\,k!\sum_{n=1}^{k+1}\frac{(-1)^{n-1}(\theta+1)_{n-1}}{n!}\,\Psi_{k+1,n}(z).$$

证明（`main.tex:1797-1854`）的中间步：先把 (5.1) 第二块里"前因子 $1+\sum_l$"与内层 $n$ 重和相乘的那部分重排为 $n+1$ 重和，并把 $j_0$ 那一项的权重 $(j_0+1)$ 显式提出（`main.tex:1798-1812`）：

$$\sum_{l=1}^{+\infty}\frac1{l!}\frac{\varphi^{(l+1)}(w)}{\varphi'(w)}(z-w)^{l}\sum_{n=1}^{+\infty}\binom{-\theta-1}{n}\sum_{j_1,\ldots,j_n}\frac{\varphi^{(j_1+1)}\cdots\varphi^{(j_n+1)}}{(j_1+1)!\cdots(j_n+1)![\varphi']^{n}}(z-w)^{j_1+\cdots+j_n}$$

$$=\sum_{n=1}^{+\infty}\binom{-\theta-1}{n}\sum_{j_0,j_1,\ldots,j_n=1}^{+\infty}(j_0+1)\,\frac{\varphi^{(j_0+1)}(w)\cdots\varphi^{(j_n+1)}(w)}{(j_0+1)!\cdots(j_n+1)!\,[\varphi'(w)]^{n}}(z-w)^{j_0+\cdots+j_n}.$$

取 (5.1) 的第 $k$ 阶 Taylor 系数（即 $\frac1{k!}\Phi_{k,\theta}(w)$）得三段和式（`main.tex:1815-1831`）。关键的对称化步骤（`main.tex:1832-1842`）：因为 $n+1$ 元组和是对称的，$(j_0+1)$ 的平均值是 $\frac{k+1+n}{n+1}$（总和 $j_0+\cdots+j_n=k+1$，共 $n+1$ 个分量），故

$$\sum_{(j_0,\ldots,j_n)\in I(k+1,n+1)}(j_0+1)\,\frac{\varphi^{(j_0+1)}\cdots\varphi^{(j_n+1)}}{(j_0+1)!\cdots(j_n+1)!\,[\varphi']^{n}}=\frac{n+k+2}{n+1}\,\Psi_{k+1,n+1}(w),$$

于是（`main.tex:1844-1851`）

$$\frac1{k!}\Phi_{k,\theta}(w)=\frac1{(k+1)!}\,\frac{\varphi^{(k+2)}(w)}{\varphi'(w)}+\sum_{n=1}^{k+1}\binom{-\theta-1}{n}\Psi_{k+1,n}(w)+\sum_{n=1}^{k}\binom{-\theta-1}{n}\frac{n+k+2}{n+1}\Psi_{k+1,n+1}(w),$$

换求和次序并把 $w$ 改回 $z$，用 $\binom{-\theta-1}{n}=\frac{(-1)^{n}(\theta+1)_{n-1}\cdots}{n!}$ 的整理形式即得命题（`main.tex:1852-1853`）。注记 5.2（`main.tex:1856-1859`）：$\Phi_{k,\theta}(z)$ 是次数 $k+1$ 的单项 $\varphi$ 形式。

本稿按命题 5.1 复原三个具体算例，它们正是 §6 各层系数的出处。$k=0$：$\Phi_{0,\theta}=(1-\theta)\Psi_{1,1}=(1-\theta)\frac{\varphi''}{2!\,\varphi'}=\frac{1-\theta}{2}\frac{\varphi''}{\varphi'}$，与素材在命题 6.1 证明里说的"几乎是命题 5.1 的平凡情形"吻合（`main.tex:1992-1995`）。$k=1$：由 $I(2,1)=\{(2)\}$、$I(2,2)=\{(1,1)\}$ 得 $\Psi_{2,1}=\frac{\varphi'''}{3!\,\varphi'}=\frac16\frac{\varphi'''}{\varphi'}$、$\Psi_{2,2}=\frac{\varphi''\varphi''}{2!\,2!\,[\varphi']^{2}}=\frac14\bigl(\frac{\varphi''}{\varphi'}\bigr)^{2}$，于是

$$\Phi_{1,\theta}(z)=(2-\theta)\left[\frac16\,\frac{\varphi'''}{\varphi'}-\frac{\theta+1}{8}\left(\frac{\varphi''}{\varphi'}\right)^{2}\right],$$

系数 $\frac16$ 与 $\frac{\theta+1}{8}$ 与素材第二层表达式（`main.tex:2146-2147`）逐项相同。$k=2$：$I(3,1)=\{(3)\}$、$I(3,2)=\{(1,2),(2,1)\}$、$I(3,3)=\{(1,1,1)\}$，得 $\Psi_{3,1}=\frac{\varphi^{(4)}}{24\varphi'}$、$\Psi_{3,2}=\frac{\varphi''\varphi'''}{6[\varphi']^{2}}$、$\Psi_{3,3}=\frac{(\varphi'')^{3}}{8[\varphi']^{3}}$，其中 $\Psi_{3,2}$ 的两个有序元组各贡献 $\frac1{2!\,3!}=\frac1{12}$、相加得 $\frac16$，故

$$\Phi_{2,\theta}(z)=2(3-\theta)\left[\frac1{24}\,\frac{\varphi^{(4)}}{\varphi'}-\frac{\theta+1}{12}\,\frac{\varphi''\varphi'''}{[\varphi']^{2}}+\frac{(\theta+1)(\theta+2)}{48}\left(\frac{\varphi''}{\varphi'}\right)^{3}\right].$$

这三例说明一件对 §6 重要的事实：第 $k$ 层里 $\bigl(\frac{\varphi''}{\varphi'}\bigr)^{k+1}$ 的系数是 $(k+1-\theta)k!\cdot(-1)^{k}\frac{(\theta+1)_{k-1}}{(k+1)!}\cdot\frac{1}{2^{k+1}}$ 型的具体有理数乘 $\theta$ 的多项式，而 $\frac{\varphi^{(k+2)}}{\varphi'}$ 的系数恒为 $(k+1-\theta)k!\cdot\frac{1}{(k+2)!}=\frac{k+1-\theta}{(k+1)(k+2)}$；换言之层数越高，出现的导数组合越"深"，但每层的系数都是显式可写的。

### 5.3 $\varphi'$ 的幂的导数因子 $\Omega_{k,\lambda}$

素材的小节题 "Derivatives of powers of $\varphi'$"（`main.tex:1862`）。取复参数 $\lambda$，令

$$g_\lambda(z)=\bigl[\varphi'(z)\bigr]^{\lambda}=\exp\bigl[\lambda\log\varphi'(z)\bigr],\qquad z\in\mathbb D,$$

其中 $\log\varphi'(z)$ 在 $z=0$ 取 $0$、在 $\mathbb D$ 内全纯（`main.tex:1863-1867`）。两条起步等式是（素材 (5.2)、(5.3)，`main.tex:1868-1878`）

$$g'_{\lambda}(z)=\lambda\,\frac{\varphi''(z)}{\varphi'(z)}\,g_{\lambda}(z),\qquad g''_{\lambda}(z)=\lambda\left(\frac{\varphi'''(z)}{\varphi'(z)}+(\lambda-1)\left[\frac{\varphi''(z)}{\varphi'(z)}\right]^{2}\right)g_{\lambda}(z).$$

定义（素材 (5.4)，`main.tex:1879-1884`）：$\Omega_{k,\lambda}(z)$ 由 $g^{(k)}_\lambda(z)=\Omega_{k,\lambda}(z)\,g_\lambda(z)$ 决定，于是

$$\Omega_{1,\lambda}(z)=\lambda\,\frac{\varphi''}{\varphi'},\qquad\Omega_{2,\lambda}(z)=\lambda\,\frac{\varphi'''}{\varphi'}+\lambda(\lambda-1)\left[\frac{\varphi''}{\varphi'}\right]^{2},$$

并由求导法则得到递推（`main.tex:1888-1890`）

$$\Omega_{k+1,\lambda}(z)=\Omega_{k,\lambda}'(z)+\lambda\,\frac{\varphi''(z)}{\varphi'(z)}\,\Omega_{k,\lambda}(z).$$

三阶显式（素材 (5.5)，`main.tex:1893-1899`）：

$$\Omega_{3,\lambda}(z)=\lambda\,\frac{\varphi^{(4)}(z)}{\varphi'(z)}+3\lambda(\lambda-1)\,\frac{\varphi'''(z)\varphi''(z)}{[\varphi'(z)]^{2}}+\lambda(\lambda-1)(\lambda-2)\left[\frac{\varphi''(z)}{\varphi'(z)}\right]^{3}.$$

一般公式（素材 (5.6)，`main.tex:1900-1908`）取试探形式

$$\Omega_{k,\lambda}(z)=\sum_{n=1}^{k}(\lambda-n+1)_{n}\sum_{(j_1,\ldots,j_n)\in I(k,n)}c(j_1,\ldots,j_n)\,\frac{\varphi^{(j_1+1)}(z)\cdots\varphi^{(j_n+1)}(z)}{[\varphi'(z)]^{n}},$$

系数 $c$ 假定在置换下不变，$\mathfrak P(j_1,\ldots,j_n)$ 记该 $n$ 元组的全部不同置换之集，$|\cdot|$ 表元素个数。初始值与递推为（`main.tex:1915-1923`）

$$c(1)=1,\qquad c(j_1,\ldots,j_{n-1},0)=\frac1n\,c(j_1,\ldots,j_{n-1}),\qquad c(j_1,\ldots,j_n)=\frac{n}{\bigl|\mathfrak P(j_1,\ldots,j_n)\bigr|}\sum_{(J_1,\ldots,J_n)\in\mathfrak P(j_1,\ldots,j_n)}c(J_1,\ldots,J_{n-1},J_n-1).$$

本稿按这套规则把 $k=3$ 完全复原，作为对 (5.5) 与 (5.6) 互相印证的算例：$n=1$ 时 $I(3,1)=\{(3)\}$，按单变元约定 $c(3)=1$，该项为 $(\lambda)_1\frac{\varphi^{(4)}}{\varphi'}=\lambda\frac{\varphi^{(4)}}{\varphi'}$，与 (5.5) 首项一致（素材只显式写了 $c(1)=1$，$c(j)\equiv1$ 是与 (5.5) 相容的唯一取法，本稿按此补齐）；$n=2$ 需要 $c(1,2)=c(1,1)+c(2,0)=1+\frac12=\frac32$（用到 $c(1,1)=2\cdot c(1,0)=2\cdot\frac12=1$ 与 $c(2,0)=\frac12c(2)=\frac12$），于是 $\sum_{I(3,2)}c=\frac32+\frac32=3$，配合 $(\lambda-1)_2=\lambda(\lambda-1)$ 给出 (5.5) 的中间项 $3\lambda(\lambda-1)$；$n=3$ 需要 $c(1,1,1)=3\,c(1,1,0)=3\cdot\frac13c(1,1)=1$，配合 $(\lambda-2)_3=\lambda(\lambda-1)(\lambda-2)$ 给出末项。三项齐备，与 (5.5) 逐项吻合。注记 5.3（`main.tex:1925-1928`）：对所有 $k=1,2,3,\ldots$，$\Omega_{k,\lambda}$ 是次数 $k$ 的单项 $\varphi$ 形式。

本稿判读：§5 的两个成果各有明确用途。命题 5.1 把定理 4.9 左端出现的 $\Phi_{k,\theta}$ 全部翻译成 $\Psi_{k+1,n}$ 的显式线性组合，于是"取前 $m$ 层"得到的不等式左端是 $[\varphi']^{t/2}$ 的各阶导数与 $\frac{\varphi^{(j+1)}}{\varphi'}$ 的单项式的线性组合，§6 的 $A_1(\theta),\ldots,A_5(\theta)$ 就是这么来的；$\Omega_{k,\lambda}$ 一支则用来把 $g^{(k)}_\lambda$ 换回 $g_\lambda$ 乘单项式，特别地 $\lambda=\tau/2$ 时 $g_{\tau/2}=[\varphi']^{\tau/2}$，素材在 (6.4) 处正是用 $\frac{\varphi''}{\varphi'}g_\tau=\frac2\tau g'_\tau$（`main.tex:2000-2004`）这类关系把一阶、二阶导数项合并成 $A_1,A_2$ 两条系数。

## 6 谱函数的上界：单层判据、原点渐近界、全 $\theta$ 优化与数表

素材第 6 节标题 `\section{Estimates of the integral means spectrum}`（`main.tex:1930`）。定理 4.9 是一列平方和的估计，本节从中"数几层"，每数一层就多一条正项，于是得到可计算的判据。

记号说明：本节带号环境依次为 `eq:K-bound`、`condition-1term`、`means-1`、`eq-idder`、`eq:esttau`、`means-2`、`means-3`、`means-2termsineq`、`means-2termsineqX`、`means-4`、`means-5`、`means-CBineq`、`means-originineq`、`means-2termsopt`、`means-A1`、`means-A2`、`means-lastcondition`、`means-Itheta`、`intersec=empty`、`means-Itheta'`、`means-inters`、`means-3terms`、`means-3terms'`、`means-slut`、`eq:normcontrol`，下文依次记为 (6.1) 到 (6.25)；共享计数器下的定理类环境依次为命题 6.1、注记 6.2、命题 6.3、推论 6.4、引理 6.5、引理 6.6、定理 6.7、注记 6.8、命题 6.9、注记 6.10、注记 6.11、命题 6.12、注记 6.13。素材在本节把谱函数写作 $B_{\mathcal S}(\tau)$（即 §1 的 $\mathrm B_{\mathcal S}$）。

### 6.1 只数第一层：判据 (6.2) 与命题 6.1

素材的小节题 "An estimate based on the first diagonal term"（`main.tex:1932-1936`）说明本节主要关心 $\tau\in\mathbb C$ 靠近原点时 $B_{\mathcal S}(\tau)$ 的估计。全程假设 $\varphi$ 足够光滑，精确地说：$\varphi$ 在一个稍大的开圆盘上全纯且单叶（`main.tex:1938-1940`）。对合适的实参数 $\beta$（允许依赖 $\tau$）取得关于 $\varphi$ 一致的先验界 $\bigl\lVert(\varphi')^{\tau/2}\bigr\rVert_{\beta-1}=O(1)$ 后，"标准的伸缩论证"把同一界推广到一切 $\varphi\in\mathcal S$；按 (1.8) 即得 $B_{\mathcal S}(\tau)\le\beta$（`main.tex:1941-1947`）。判据里的核心常数定义为（素材 (6.1)，`main.tex:1952-1957`）

$$K(\beta,\theta)=\frac{(\beta+2\theta)\,\Gamma(2\theta+1)}{2\theta\beta\,\bigl[\Gamma(\theta+1)\bigr]^{2}}+\varkappa(\beta+2\theta-1,\theta),$$

其中 $\varkappa$ 由 (4.13) 给出。本稿核对：定理 4.9 右端方括号在 $\alpha=\beta+2\theta-1$ 时正是上式首项，因为 $\alpha+1=\beta+2\theta$、$\alpha-2\theta+1=\beta$。

命题 6.1（`main.tex:1961-1978`）：固定 $\tau\in\mathbb C\setminus\{0\}$ 与 $\theta$，$0<\theta<1$。若某个正实数 $\beta$ 满足（素材 (6.2)，`main.tex:1965-1971`）

$$K(\beta,\theta)<(1-\theta)(\beta+1)(\beta+2)\left|\frac1{\beta+1}-\frac1{\tau}\right|^{2}\frac{\Gamma(\beta+1+2\theta)\,\Gamma(\beta+2)}{\Gamma(\beta+1+\theta)\,\Gamma(\beta+2+\theta)},$$

并且 $\bigl\lVert(\varphi')^{\tau/2}\bigr\rVert_{\beta-1+\theta}=O(1)$ 关于 $\varphi\in\mathcal S$ 一致成立，则 $\bigl\lVert(\varphi')^{\tau/2}\bigr\rVert_{\beta-1}=O(1)$ 同样一致成立；特别地 $B_{\mathcal S}(\tau)\le\beta$。

证明（`main.tex:1980-2019`）四步。第一步，只保留定理 4.9 左端 $N=0$ 项并取 $\alpha=\beta+2\theta-1$，得（素材 (6.3)，`main.tex:1984-1990`）

$$\frac1{\sigma(\beta+2\theta-1,-\theta)}\left\lVert-\frac{1-\theta}{\beta+1}\,g'+\frac{1-\theta}2\,\frac{\varphi''}{\varphi'}\,g\right\rVert_{\beta+1}^{2}\le K(\beta,\theta)\,\lVert g\rVert_{\beta-1}^{2}+O\Bigl(\lVert g\rVert_{\beta-1+\theta}^{2}\Bigr),$$

对任意 $g\in\mathcal H_{\beta-1}(\mathbb D)$ 成立。这里用到的 $\Phi_{0,\theta}(z)=\oslash\Phi_\theta(z)=\frac{1-\theta}2\frac{\varphi''(z)}{\varphi'(z)}$ 是命题 5.1 的 $k=0$ 情形（`main.tex:1992-1995`），而系数 $-\frac{1-\theta}{\beta+1}$ 就是 (4.14) 的 $b_0$。第二步，把 (6.3) 用于 $g=g_\tau(z)=[\varphi'(z)]^{\tau/2}$，并观察（素材 (6.4)，`main.tex:2000-2004`）

$$\frac{\varphi''(z)}{\varphi'(z)}\,g_\tau(z)=\frac2{\tau}\,g'_{\tau}(z),\qquad z\in\mathbb D.$$

第三步，命题 4.7 取 $\nu=\theta$、$\alpha=\beta-1$、$n=1$ 给出 $\lVert g'\rVert_{\beta+1}^{2}=(\beta+1)(\beta+2)\lVert g\rVert_{\beta-1}^{2}+O\bigl(\lVert g\rVert_{\beta-1+\theta}^{2}\bigr)$。第四步，把 (6.4) 代入 (6.3) 的左端，括号里的范数成为 $\left(\frac2{\tau}-\frac1{\beta+1}\right)(1-\theta)\,g'$ 的范数，于是出现因子 $(1-\theta)^{2}\bigl|\frac1{\beta+1}-\frac1{\tau}\bigr|^{2}(\beta+1)(\beta+2)$，再乘 $\frac1{\sigma(\beta+2\theta-1,-\theta)}$。本稿按引理 3.5 的显式复核这一步：$\frac1{\sigma(\beta+2\theta-1,-\theta)}=\frac1{1-\theta}\frac{\Gamma(\beta+2\theta+1)\Gamma(\beta+1)}{\Gamma(\beta+\theta+1)\Gamma(\beta+\theta+2)}$，与 $(1-\theta)^{2}$ 相乘得 $(1-\theta)\frac{\Gamma(\beta+2\theta+1)\Gamma(\beta+1)}{\Gamma(\beta+\theta+1)\Gamma(\beta+\theta+2)}$，再吸收进 $(\beta+1)(\beta+2)$ 中的一个 $(\beta+1)$（即 $\Gamma(\beta+2)=(\beta+1)\Gamma(\beta+1)$），恰好是命题 6.1 判据右端的形状，从而（`main.tex:2010-2017`）

$$\left\{(1-\theta)\frac{\Gamma(\beta+1+2\theta)\Gamma(\beta+2)}{\Gamma(\beta+1+\theta)\Gamma(\beta+2+\theta)}(\beta+1)(\beta+2)\left|\frac1{\beta+1}-\frac1{\tau}\right|^{2}-K(\beta,\theta)\right\}\,\lVert g_\tau\rVert_{\beta-1}^{2}=O\bigl(\lVert g_\tau\rVert_{\beta-1+\theta}^{2}\bigr),$$

大括号内为正时即得结论。注记 6.2（`main.tex:2021-2030`）：判据 (6.2) 里的严格不等号可放宽为 $\le$ 而结论 $B_{\mathcal S}(\tau)\le\beta$ 仍成立，理由是在取等情形把 $\tau$ 微移即可回到严格情形，再用 $\mathrm B_{\mathcal S}$ 的连续性取极限。

### 6.2 平凡先验界与伸缩论证

素材接着给出比 Koebe 点态估计 (1.9) 更一般的一条（素材 (6.5)，`main.tex:2035-2044`；素材质文说"更一般的估计"，来源是把 (1.9) 积分后再作代数整理）：

$$\bigl\lvert[\varphi'(z)]^{\tau}\bigr\rvert\le\frac{(1+\lvert z\rvert)^{2|\tau|-\operatorname{Re}\tau}}{(1-\lvert z\rvert)^{2|\tau|+\operatorname{Re}\tau}},\qquad z\in\mathbb D,$$

对一切 $\tau\in\mathbb C$ 有效；中间用的不等式是 $\bigl\lvert\log\varphi'(z)+\log(1-\lvert z\rvert^{2})\bigr\rvert\le 2\log\frac{1+\lvert z\rvert}{1-\lvert z\rvert}$（`main.tex:2043-2044`）。由此（素材 (6.6)，`main.tex:2046-2052`）对固定 $\tau\in\mathbb C$，

$$\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{2|\tau|+\operatorname{Re}\tau-1+\varepsilon}^{2}=O(1)$$

关于 $\varphi\in\mathcal S$ 一致成立，对一切正 $\varepsilon$。这条"平凡界"是全部迭代推理的入口，它把命题 6.1 的先验假设 $\beta-1+\theta$ 层的界变成可用。

### 6.3 原点附近的第一条渐近界：命题 6.3 与推论 6.4

素材的小节题 "A first estimate of the integral means spectrum near the origin"（`main.tex:2055-2057`）。命题 6.3（`main.tex:2059-2066`，即素材带标签 `means-3` 的 (6.7)）：固定 $\theta$，$0<\theta<1$，则

$$\limsup_{\mathbb C\ni\tau\to0}\,\frac{B_{\mathcal S}(\tau)}{|\tau|^{2}}\le\frac{1+\theta}{2(1-\theta)}.$$

证明（`main.tex:2068-2090`）取正 $\varepsilon$ 并令 $\beta(\tau)=\bigl[\frac{1+\theta}{2(1-\theta)}+\varepsilon\bigr]|\tau|^{2}$，把它代入判据 (6.2) 两端，比较 $\tau\to0$ 时两端的主项。本稿把这两条渐近展开算清楚，因为它牵涉素材质文的一处标注错位：

- 左端 $K(\beta,\theta)$：由 (6.1)，$\beta\to0$ 时的发散来自首项 $\frac{(\beta+2\theta)\Gamma(2\theta+1)}{2\theta\beta[\Gamma(\theta+1)]^{2}}\sim\frac{\Gamma(2\theta+1)}{\beta[\Gamma(\theta+1)]^{2}}$，而 $\varkappa(\beta+2\theta-1,\theta)$ 在 $\beta=0$ 处有限，故左端主项是 $\frac{1}{\bigl[\frac{1+\theta}{2(1-\theta)}+\varepsilon\bigr]}\frac{\Gamma(2\theta+1)}{[\Gamma(\theta+1)]^{2}}\frac1{|\tau|^{2}}+o\bigl(|\tau|^{-2}\bigr)$。
- 右端：$(\beta+1)(\beta+2)\to2$，$\bigl|\frac1{\beta+1}-\frac1{\tau}\bigr|^{2}=\frac1{|\tau|^{2}}\bigl(1+O(|\tau|)\bigr)$，Gamma 比式趋于 $\frac{\Gamma(1+2\theta)\Gamma(2)}{\Gamma(1+\theta)\Gamma(2+\theta)}$，故右端主项是 $\frac{2(1-\theta)\Gamma(2\theta+1)}{\Gamma(1+\theta)\Gamma(2+\theta)}\cdot\frac1{|\tau|^{2}}+o\bigl(|\tau|^{-2}\bigr)$，与 $\varepsilon$ 无关。

由于 $\Gamma(2+\theta)=(1+\theta)\Gamma(1+\theta)$，右端系数 $\frac{2(1-\theta)\Gamma(2\theta+1)}{(1+\theta)[\Gamma(1+\theta)]^{2}}$ 恰等于左端在 $\varepsilon=0$ 时的系数，于是 $\varepsilon>0$ 使判据 (6.2) 严格成立，命题 6.1 的先验假设由 (6.6) 提供（$\beta(\tau)-1+\theta$ 层正是平凡界可吸收的位置），从而 $\bigl\lVert[\varphi']^{\tau/2}\bigr\rVert_{\beta(\tau)-1}=O(1)$，得命题 6.3 的结论 (6.7)。素材把带 $\varepsilon$ 的那条例式写成"右端行为"、把不含 $\varepsilon$ 的写成"左端行为"（`main.tex:2072-2081`），两条式子的内容都正确，只是左右标签互换；结论不受影响，本稿在 §7 的更正登记里记下。

推论 6.4（`main.tex:2092-2102`）：$\limsup_{\mathbb C\ni\tau\to0}\frac{B_{\mathcal S}(\tau)}{|\tau|^{2}}\le\frac12$，只需在 (6.7) 中令 $\theta\to0^{+}$。

### 6.4 数到第二层：不等式 (6.8) 与两栏展开

素材的小节题 "The improved estimate of the integral means spectrum near the origin"（`main.tex:2105-2107`）声明：把定理 4.9 左端的前两项留下可以得到比 $\frac12$ 更好的常数。固定 $\theta\in(0,1)$ 与正 $\beta$，取 $\alpha=\beta+2\theta-1$、$g=g_\tau=[\varphi']^{\tau/2}$，用命题 5.1 计算 $\Phi_{0,\theta}$ 与 $\Phi_{1,\theta}$，并用 (6.4)，得对 $0<\beta<+\infty$（素材 (6.8)，`main.tex:2119-2135`）

$$(1-\theta)(\beta+1)(\beta+2)\,\frac{\Gamma(\beta+1+2\theta)\Gamma(\beta+2)}{\Gamma(\beta+1+\theta)\Gamma(\beta+2+\theta)}\left|\frac1{\beta+1}-\frac1{\tau}\right|^{2}\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{\beta-1}^{2}+(2-\theta)\,\frac{\Gamma(\beta+2\theta+1)\Gamma(\beta+4)}{\Gamma(\beta+\theta+2)\Gamma(\beta+\theta+3)}\cdot\clubsuit$$

$$\le K(\beta,\theta)\,\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{\beta-1}^{2}+O\Bigl(\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{\beta+\theta-1}^{2}\Bigr),$$

其中（素材 (6.9)，`main.tex:2137-2149`；$\mathrm d z=\mathrm d/\mathrm d z$ 记求导算子，`main.tex:2150`）

$$\clubsuit=\left\lVert\frac{1-\theta}{2(\beta+2)(\beta+3)}\,\partial_z^{2}\Bigl\{\bigl[\varphi'\bigr]^{\tau/2}\Bigr\}-\frac{1-\theta}{2(\beta+3)}\,\partial_z\left\{\frac{\varphi''}{\varphi'}\,\bigl[\varphi'\bigr]^{\tau/2}\right\}+\left\{\frac16\,\frac{\varphi'''}{\varphi'}-\frac{\theta+1}8\left(\frac{\varphi''}{\varphi'}\right)^{2}\right\}\bigl[\varphi'\bigr]^{\tau/2}\right\rVert_{\beta+3}^{2}.$$

这里大括号里的 $\frac16$ 与 $\frac{\theta+1}{8}$ 正是本稿在 §5.2 复原的 $\Phi_{1,\theta}=(2-\theta)\bigl[\frac16\frac{\varphi'''}{\varphi'}-\frac{\theta+1}{8}\bigl(\frac{\varphi''}{\varphi'}\bigr)^{2}\bigr]$ 的两个系数，两处独立算得同一结果。

接下去的取参策略是（`main.tex:2151-2160`）：$\beta=\beta(\tau)=B_0|\tau|^{2}$，$B_0$ 是固定的实常数、$0<B_0<\frac12$，并且 $\theta=\theta(\tau)=4|\tau|$，于是平凡界 (6.6) 保证 $\bigl\lVert[\varphi']^{\tau/2}\bigr\rVert_{\beta(\tau)+\theta(\tau)-1}^{2}=O(1)$ 关于 $\varphi$ 一致。代入 (6.8) 后素材把它写成带误差函数的形式（素材 (6.10)，`main.tex:2161-2173`）

$$\frac{2+\epsilon_1(\tau)}{|\tau|^{2}}\,\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{-1+\beta(\tau)}^{2}+\bigl(6+\epsilon_2(\tau)\bigr)\left\lVert\left\{\left(\frac1{24}+\epsilon_3(\tau)\right)\left[\frac{\varphi''}{\varphi'}\right]^{2}+\epsilon_4(\tau)\,\frac{\varphi'''}{\varphi'}\right\}\bigl[\varphi'\bigr]^{\tau/2}\right\rVert_{3+\beta(\tau)}^{2}$$

$$\le\frac{1+\epsilon_5(\tau)}{B_0\,|\tau|^{2}}\,\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{-1+\beta(\tau)}^{2}+O(1),$$

其中 $\lim_{\tau\to0}\epsilon_k(\tau)=0$（$k=1,\ldots,5$），并且 $\epsilon_1,\epsilon_2,\epsilon_5$ 取值实（`main.tex:2175-2177`）。本稿核对 (6.10) 里 $6$、$\frac1{24}$、$2$ 三个数的出处，方法是把 $\theta=4|\tau|$、$\beta=B_0|\tau|^2$ 令 $\tau\to0$ 逐步取极限。先看前置因子：$(2-\theta)\frac{\Gamma(\beta+2\theta+1)\Gamma(\beta+4)}{\Gamma(\beta+\theta+2)\Gamma(\beta+\theta+3)}\to2\cdot\frac{\Gamma(1)\Gamma(4)}{\Gamma(2)\Gamma(3)}=2\cdot\frac{6}{1\cdot2}=6$，这是 $\epsilon_2$ 那条；第一项的因子 $(1-\theta)(\beta+1)(\beta+2)\frac{\Gamma(\beta+1+2\theta)\Gamma(\beta+2)}{\Gamma(\beta+1+\theta)\Gamma(\beta+2+\theta)}\to1\cdot2\cdot\frac{\Gamma(1)\Gamma(2)}{\Gamma(1)\Gamma(2)}=2$，配上 $\bigl|\frac1{\beta+1}-\frac1{\tau}\bigr|^2=\frac1{|\tau|^2}(1+o(1))$ 给出 $\epsilon_1$ 那条；右端 $K(\beta,\theta)\sim\frac{\Gamma(2\theta+1)}{\beta[\Gamma(\theta+1)]^2}=\frac{1+o(1)}{B_0|\tau|^2}$ 给出 $\epsilon_5$ 那条。再看 $\clubsuit$ 内 $\bigl[\frac{\varphi''}{\varphi'}\bigr]^2[\varphi']^{\tau/2}$ 的净系数：用 $\partial_zg=\frac{\tau}2\frac{\varphi''}{\varphi'}g$ 与 $\bigl(\frac{\varphi''}{\varphi'}\bigr)'=\frac{\varphi'''}{\varphi'}-\bigl(\frac{\varphi''}{\varphi'}\bigr)^2$，三段分别贡献

- $\frac{1-\theta}{2(\beta+2)(\beta+3)}\partial_z^2g$：$\partial_z^2g=\frac{\tau}2\frac{\varphi'''}{\varphi'}g+\bigl(\frac{\tau^2}4-\frac{\tau}2\bigr)\bigl[\frac{\varphi''}{\varphi'}\bigr]^2g$，整体是 $O(\tau)$，极限下消失（进 $\epsilon_3$、$\epsilon_4$）；
- $-\frac{1-\theta}{2(\beta+3)}\partial_z\bigl\{\frac{\varphi''}{\varphi'}g\bigr\}$：展开为 $-\frac{1-\theta}{2(\beta+3)}\bigl\{\frac{\varphi'''}{\varphi'}g+\bigl(\frac{\tau}2-1\bigr)\bigl[\frac{\varphi''}{\varphi'}\bigr]^2g\bigr\}$，$\bigl[\frac{\varphi''}{\varphi'}\bigr]^2$ 项极限系数 $+\frac16$，$\frac{\varphi'''}{\varphi'}$ 项极限系数 $-\frac16$；
- $\bigl\{\frac16\frac{\varphi'''}{\varphi'}-\frac{\theta+1}8\bigl[\frac{\varphi''}{\varphi'}\bigr]^2\bigr\}g$：$\frac{\varphi'''}{\varphi'}$ 项系数 $+\frac16$，$\bigl[\frac{\varphi''}{\varphi'}\bigr]^2$ 项系数 $-\frac18$。

于是 $\frac{\varphi'''}{\varphi'}$ 的 $-\frac16$ 与 $+\frac16$ 相消，剩下的正是 (6.10) 中 $\epsilon_4\frac{\varphi'''}{\varphi'}$ 只留高阶小量的原因；$\bigl[\frac{\varphi''}{\varphi'}\bigr]^2$ 的净系数为 $\frac16-\frac18=\frac1{24}$，正是 $\frac1{24}+\epsilon_3$ 的出处。素材直接给出 (6.10) 而未展示这段合并，本稿按 $\Phi_{0,\theta}$、$\Phi_{1,\theta}$ 的显式复原。

### 6.5 把三阶导数项消掉：引理 6.5 与 (6.11)

引理 6.5（`main.tex:2179-2189`，条件 $-1<\alpha<+\infty$）：存在正常数 $C_7(\alpha)$ 使对任意 $g\in\mathcal H_\alpha(\mathbb D)$，

$$\left\lVert\frac{\varphi'''}{\varphi'}\,g\right\rVert_{\alpha+4}^{2}\le C_7(\alpha)\,\lVert g\rVert_{\alpha}^{2},$$

并且 $C_7(\alpha)=O\bigl(\frac1{\alpha+1}\bigr)$（$\alpha\to-1^{+}$）。证明（`main.tex:2191-2198`）只用一条恒等式加两件旧工具：

$$\frac{\varphi'''}{\varphi'}\,g=\frac{\mathrm d}{\mathrm dz}\left(\frac{\varphi''}{\varphi'}\,g\right)+\left[\frac{\varphi''}{\varphi'}\right]^{2}g-\frac{\varphi''}{\varphi'}\,g',$$

再配 Koebe-Bieberbach 点态估计 (1.9) 与命题 4.7。注意右端第一项是"全导数"，其 $\mathcal H_{\alpha+3}$ 范数按命题 4.7 由 $\bigl\lVert(\frac{\varphi''}{\varphi'}g)\bigr\rVert_{\alpha+1}$ 控制，后两项同理，三阶商 $\frac{\varphi'''}{\varphi'}$ 因此被降成二阶可控量。

把引理 6.5 用于 (6.10)，$\epsilon_4$ 那条被吸收，素材得到（`main.tex:2200-2209`；素材 (6.11)）：对每个固定正 $\varepsilon$ 与充分小的 $|\tau|$，

$$\bigg\lVert\left[\frac{\varphi''}{\varphi'}\right]^{2}\bigl[\varphi'\bigr]^{\tau/2}\bigg\rVert_{\beta(\tau)+3}^{2}\le\frac{96}{|\tau|^{2}}\left(\frac1{B_0}-2+\varepsilon\right)\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{\beta(\tau)-1}^{2}+O(1).$$

本稿核对 $96$ 的出处：(6.10) 第二项系数是 $6+\epsilon_2$，括号内主项是 $\frac1{24}\bigl[\frac{\varphi''}{\varphi'}\bigr]^2g$，故把第一项 $\frac{2+\epsilon_1}{|\tau|^2}\lVert g\rVert^2$ 移到右端后，$\bigl\lVert[\frac{\varphi''}{\varphi'}]^2g\bigr\rVert^2$ 的系数是 $\frac1{6\cdot(1/24)^2}=\frac{576}{6}=96$ 乘以 $\bigl(\frac{1+\epsilon_5}{B_0}-2-\epsilon_1\bigr)\frac1{|\tau|^2}$，即 $\frac{96}{|\tau|^2}(\frac1{B_0}-2+\varepsilon)$，与 (6.11) 一致。

### 6.6 一条 Cauchy-Schwarz 插值：引理 6.6 与定理 6.7

引理 6.6（`main.tex:2213-2222`，条件 $0<\beta<+\infty$；素材 (6.12) 即其带标签 `means-CBineq` 的显示式）：对每个 $g\in\mathcal H_{\beta-1}(\mathbb D)$，

$$\left\lVert\frac{\varphi''}{\varphi'}\,g\right\rVert_{\beta+1}^{2}\le\frac{\beta+2}{\sqrt{\beta(\beta+4)}}\,\lVert g\rVert_{\beta-1}\cdot\bigg\lVert\left[\frac{\varphi''}{\varphi'}\right]^{2}g\bigg\rVert_{\beta+3}.$$

证明只写一句"标准的 Cauchy-Schwarz-Bunyakovsky 不等式应用"（`main.tex:2224-2227`）。本稿补出权的搭配：左端被积的权是 $(1-\lvert z\rvert^{2})^{\beta+1}$，恰为 $(1-\lvert z\rvert^{2})^{(\beta-1)/2}$ 与 $(1-\lvert z\rvert^{2})^{(\beta+3)/2}$ 之积，于是把 $\bigl\lvert\frac{\varphi''}{\varphi'}g\bigr\rvert^2$ 拆成 $\bigl(\lvert g\rvert\bigr)$ 与 $\bigl(\bigl\lvert\frac{\varphi''}{\varphi'}\bigr\rvert^2\lvert g\rvert\bigr)$ 的乘积再作 $L^2$ 配对即得形状，因子 $\frac{\beta+2}{\sqrt{\beta(\beta+4)}}$ 来自三个加权面积测度 $\mathrm d A_{\beta-1},\mathrm d A_{\beta+1},\mathrm d A_{\beta+3}$ 的归一化常数 $(\beta+1),(\beta+2),(\beta+4)$ 之比。

现在把 (6.4)、命题 4.7、引理 6.6 与 (6.11) 串成一条链（`main.tex:2229-2247`，$\beta(\tau)=B_0|\tau|^{2}$）：

$$\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{\beta(\tau)-1}^{2}=\frac{|\tau|^{2}}{4(\beta(\tau)+1)(\beta(\tau)+2)}\left\lVert\frac{\varphi''}{\varphi'}\,\bigl[\varphi'\bigr]^{\tau/2}\right\rVert_{1+\beta(\tau)}^{2}+O(1)$$

$$\le\frac{|\tau|^{2}}{4(\beta(\tau)+1)\sqrt{\beta(\tau)(\beta(\tau)+4)}}\cdot\bigg\lVert\left[\frac{\varphi''}{\varphi'}\right]^{2}\bigl[\varphi'\bigr]^{\tau/2}\bigg\rVert_{\beta+3}\cdot\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{\beta(\tau)-1}+O(1)$$

$$\le\frac{1+\epsilon_6(\tau)}{8\sqrt{B_0}}\sqrt{96\left(\frac1{B_0}-2+\varepsilon\right)}\cdot\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{\beta(\tau)-1}^{2}+O\Bigl(\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{\beta(\tau)-1}\Bigr)+O(1),$$

其中 $\epsilon_6(\tau)$ 实值且 $\tau\to0$ 时趋于 $0$。首行的等号来自 $\partial_zg_\tau=\frac{\tau}2\frac{\varphi''}{\varphi'}g_\tau$ 与命题 4.7 的 $\lVert g'\rVert_{\beta+1}^2=(\beta+1)(\beta+2)\lVert g\rVert_{\beta-1}^2+O(\lVert g\rVert_{\beta-1+\theta}^2)$；末行的分母 $8\sqrt{B_0}$ 则由 $\beta\to0$ 时 $4(\beta+1)\sqrt{\beta(\beta+4)}\to4\cdot1\cdot2\sqrt{B_0}|\tau|$ 与 $|\tau|^2/|\tau|$ 相消而来。于是当

$$\frac{1+\epsilon_6(\tau)}{8\sqrt{B_0}}\sqrt{96\left(\frac1{B_0}-2+\varepsilon\right)}<1$$

时左端的范数可被吸收，得到 $\bigl\lVert[\varphi']^{\tau/2}\bigr\rVert_{\beta(\tau)-1}=O(1)$ 关于 $\varphi$ 一致，从而 $\limsup_{\tau\to0}\frac{B_{\mathcal S}(\tau)}{|\tau|^{2}}\le B_0$。素材把条件化为 $96\bigl(\frac1{B_0}-2\bigr)<64B_0$（`main.tex:2256-2258`）。本稿解这条不等式：乘 $B_0>0$ 得 $96-192B_0<64B_0^{2}$，除以 $32$ 得 $2B_0^{2}+6B_0-3>0$，正根为 $B_0=\frac{-6+\sqrt{36+24}}{4}=\frac{\sqrt{15}-3}{2}=0.43649\ldots$，故对所有 $B_0>\frac{\sqrt{15}-3}{2}$（并 $B_0<\frac12$）判据成立，取下确界即得定理 6.7（`main.tex:2261-2269`；素材 (6.13)）：

$$\limsup_{\mathbb C\ni\tau\to0}\frac{B_{\mathcal S}(\tau)}{|\tau|^{2}}\le\frac{\sqrt{15}-3}{2}=0.43649\ldots$$

注记 6.8（`main.tex:2271-2274`）：此前同类最好估计是 Pommerenke 的 $B_{\mathcal S}(t)\le(3+\varepsilon)t^2$（实 $t$ 靠近原点，素材引 \[Pomm\]），本稿按 $\frac12$ 与 $3$ 的比较看出定理 6.7 把常数改了两个量级并推广到复 $\tau$。

### 6.7 一次用满所有 $\theta$：圆盘判据与命题 6.9

素材的小节题 "An optimization method to estimate ${\mathrm B}_{\mathcal S}$ using two terms"（`main.tex:2277-2278`）。目标是把 (6.8) 中"每个 $\theta$ 单独用一次"改成"同时用满 $\theta\in]0,1]$"，为此需要估计在 $\theta$ 被压进某个紧区间 $[\theta_0,1]$ 时各量的关于 $\theta$ 的一致性，素材声明这"属实且不必费太多力气即可验证"（`main.tex:2279-2287`）。固定 $\tau\in\mathbb C$ 与 $\beta$，$0<\beta<+\infty$，把 (6.8) 用 (5.2) 改写为不带平方的一条（素材 (6.14)，`main.tex:2290-2297`）

$$\left\lVert A_1(\theta)\,\partial_z^{2}\Bigl\{\bigl[\varphi'\bigr]^{\tau/2}\Bigr\}+A_2(\theta)\left[\frac{\varphi''}{\varphi'}\right]^{2}\bigl[\varphi'\bigr]^{\tau/2}\right\rVert_{\beta+3}\le\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{-1+\beta}+O\Bigl(\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{-1+\beta+\theta}\Bigr),$$

其中两个系数由（素材 (6.15)，`main.tex:2299-2310`）

$$A_1(\theta)=\left[\frac{1-\theta}{2(\beta+2)(\beta+3)}-\frac{1-\theta}{\tau(\beta+3)}+\frac1{3\tau}\right]\left\{(2-\theta)\,\frac{\Gamma(\beta+2\theta+1)\,\Gamma(\beta+4)}{\Gamma(\beta+\theta+2)\,\Gamma(\beta+\theta+3)}\right\}^{\frac12}$$

$$\times\left\{K(\beta,\theta)-(1-\theta)(\beta+1)(\beta+2)\frac{\Gamma(\beta+2\theta+1)\,\Gamma(\beta+2)}{\Gamma(\beta+\theta+1)\,\Gamma(\beta+\theta+2)}\left|\frac1{\beta+1}-\frac1{\tau}\right|^{2}\right\}^{-1/2}$$

与（素材 (6.16)，`main.tex:2312-2323`）

$$A_2(\theta)=\left[\frac16\left(1-\frac{\tau}2\right)-\frac{\theta+1}8\right]\left\{(2-\theta)\,\frac{\Gamma(\beta+2\theta+1)\Gamma(\beta+4)}{\Gamma(\beta+\theta+2)\,\Gamma(\beta+\theta+3)}\right\}^{\frac12}$$

$$\times\left\{K(\beta,\theta)-(1-\theta)(\beta+1)(\beta+2)\frac{\Gamma(\beta+2\theta+1)\,\Gamma(\beta+2)}{\Gamma(\beta+\theta+1)\,\Gamma(\beta+\theta+2)}\left|\frac1{\beta+1}-\frac1{\tau}\right|^{2}\right\}^{-\frac12}$$

给出；两条式子共用同一个"$K$ 减去第一层系数"的倒数平方根，因此 $A_1,A_2$ 的比值只由方括号里的两个多项式型因子决定。素材要求不妨设（素材 (6.17)，`main.tex:2326-2332`）

$$(1-\theta)(\beta+1)(\beta+2)\frac{\Gamma(\beta+2\theta+1)\,\Gamma(\beta+2)}{\Gamma(\beta+\theta+1)\,\Gamma(\beta+\theta+2)}\left|\frac1{\beta+1}-\frac1{\tau}\right|^{2}<K(\beta,\theta)$$

对一切 $0<\theta\le1$ 成立；否则命题 6.1 加注记 6.2 已经给出 ${\mathrm B}_{\mathcal S}(\tau)\le\beta$。这一假设保证两个平方根在整个 $]0,1]$ 上取实值（`main.tex:2333-2338`）。对每个 $\theta$ 考虑圆盘（素材 (6.18)，`main.tex:2340-2346`）

$${\mathcal D}_\theta=\left\{\,w\in\mathbb C:\ \left|A_1(\theta)-w\,A_2(\theta)\right|\le\frac1{\sqrt{(\beta+1)_{4}}}\right\},\qquad(\beta+1)_{4}=(\beta+1)(\beta+2)(\beta+3)(\beta+4).$$

命题 6.9（`main.tex:2351-2371`）：若存在 $\theta_0\in(0,1]$ 使 $(a)$ 交集 $\bigcap_{\theta_0<\theta\le1}{\mathcal D}_\theta$ 为空，$(b)$ $\bigl\lVert[\varphi']^{\tau/2}\bigr\rVert_{-1+\beta+\theta_0}=O(1)$ 关于 $\varphi\in\mathcal S$ 一致，则 $\bigl\lVert[\varphi']^{\tau/2}\bigr\rVert_{-1+\beta}=O(1)$ 一致成立，特别地 ${\mathrm B}_{\mathcal S}(\tau)\le\beta$。

证明（`main.tex:2373-2419`）是"紧性 $+$ 对偶 $+$ 积分"三段式。第一段，紧性论证把 (a) 加强为：对充分小的正 $\varepsilon$，放大后的圆盘 ${\mathcal D}_\theta^{\varepsilon}=\{w:\lvert A_1(\theta)-wA_2(\theta)\rvert\le\frac{1+\varepsilon}{\sqrt{(\beta+1)_4}}\}$ 的交仍为空，从而

$$\inf_{w\in\mathbb C}\ \bigl\lVert A_1-w\,A_2\bigr\rVert_{C[\theta_0,1]}\ge\frac{1+\varepsilon}{\sqrt{(\beta+1)_{4}}},$$

这里 $C[\theta_0,1]$ 是区间上复值连续函数带一致范数的 Banach 空间。第二段，标准对偶给出总变差为 $1$ 的复 Borel 测度 $\mu$ 使得

$$\frac{1+\varepsilon}{\sqrt{(\beta+1)_{4}}}\le\left|\int_{\theta_0}^{1}A_1(\theta)\,\mathrm d\mu(\theta)\right|\qquad\text{同时}\qquad\int_{\theta_0}^{1}A_2(\theta)\,\mathrm d\mu(\theta)=0.$$

第三段，把 (6.14) 先乘 $\mathrm d\mu(\theta)$ 再积分，$A_2$ 项因正交条件消失，得（`main.tex:2394-2416`）

$$\frac{1+\varepsilon}{\sqrt{(\beta+1)_{4}}}\left\lVert\partial_z^{2}\left\{\bigl[\varphi'\bigr]^{\tau/2}\right\}\right\rVert_{\beta+3}\le\left\lVert\int_{\theta_0}^{1}\left\{A_1(\theta)\,\partial_z^{2}\bigl\{[\varphi']^{\tau/2}\bigr\}+A_2(\theta)\left[\frac{\varphi''}{\varphi'}\right]^{2}[\varphi']^{\tau/2}\right\}\mathrm d\mu(\theta)\right\rVert_{\beta+3}$$

$$\le\int_{\theta_0}^{1}\left\lVert A_1(\theta)\,\partial_z^{2}\bigl\{[\varphi']^{\tau/2}\bigr\}+A_2(\theta)\left[\frac{\varphi''}{\varphi'}\right]^{2}[\varphi']^{\tau/2}\right\rVert_{\beta+3}\,\lvert\mathrm d\mu(\theta)\rvert\le\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{-1+\beta}+O\Bigl(\Bigl\lVert\bigl[\varphi'\bigr]^{\tau/2}\Bigr\rVert_{-1+\beta+\theta_0}\Bigr).$$

本稿补出收尾：由命题 4.7（$\alpha=\beta-1$、$n=2$）有 $\bigl\lVert g''\bigr\rVert_{\beta+3}^{2}=(\beta+1)_{4}\lVert g\rVert_{\beta-1}^{2}+O(\lVert g\rVert_{\beta-1+\nu}^{2})$，即 $\bigl\lVert g''\bigr\rVert_{\beta+3}\ge\sqrt{(\beta+1)_4}\,\lVert g\rVert_{\beta-1}-O(\cdot)$，代进上式左端，$\sqrt{(\beta+1)_4}$ 相消后剩 $(1+\varepsilon)\lVert g\rVert_{\beta-1}\le\lVert g\rVert_{\beta-1}+O(1)$，$\varepsilon$ 项吸收余项即得结论。素材此处只写"in view of Proposition main-asympt and the assumption $(b)$"（`main.tex:2417-2418`），本稿把这条不等式的方向写明白。

素材接着说明命题 6.9 的"道德内容"：只要判据（素材 (6.19)，`main.tex:2425-2428`）

$$\bigcap_{0<\theta\le1}{\mathcal D}_\theta(\beta,\tau)=\emptyset$$

成立，就能得到关于 $[\varphi']^{\tau/2}$ 的一致界；实际使用时须从一条平凡先验界出发，按命题 6.9 逐级把 $\beta$ 往下挪。并且由 Helly 交集定理，(6.19) 等价于存在三元组 $\theta_1,\theta_2,\theta_3\in(0,1]$ 使 ${\mathcal D}_{\theta_1}\cap{\mathcal D}_{\theta_2}\cap{\mathcal D}_{\theta_3}=\emptyset$（`main.tex:2433-2440`），这把无穷交判据降成有限个圆盘的判交问题。

注记 6.10（`main.tex:2442-2466`）：$\tau=t$ 为实时 $A_1(\theta),A_2(\theta)$ 实值，只需沿实轴验证，即把圆盘换成闭区间（素材 (6.20)）

$${\mathcal I}_\theta=\left\{\,x\in\mathbb R:\ \left|A_1(\theta)-x\,A_2(\theta)\right|\le\frac1{\sqrt{(\beta+1)_{4}}}\right\},$$

判据化为（素材 (6.21)）$\bigcap_{\theta_0\le\theta\le1}{\mathcal I}_\theta=\emptyset$；若记 ${\mathcal I}_\theta=[\alpha_1(\theta),\alpha_2(\theta)]$，它等价于

$$\inf_{\theta\in[\theta_0,1]}\alpha_2(\theta)<\sup_{\theta\in[\theta_0,1]}\alpha_1(\theta),$$

素材说这条"用计算机容易检验"。注记 6.11（`main.tex:2468-2485`）：若把引理 6.6 的信息织进优化方法，改为盯住 $A_2(\theta)$ ，并非 $A_1(\theta)$，则区间换成

$${\mathcal J}_\theta=\left\{\,x\in\mathbb R:\ \left|A_2(\theta)-x\,A_1(\theta)\right|\le\frac{t^{2}}{4(\beta+1)\sqrt{\beta(\beta+4)}}\right\},$$

判据 $\bigcap_{\theta_0\le\theta\le1}{\mathcal J}_\theta=\emptyset$ 同样推出 ${\mathrm B}_{\mathcal S}(t)\le\beta$，并且数值试验表明它在原点附近比命题 6.9 的判据 $(a)$ 更强。

### 6.8 数值实现：$\mathrm B_*(t)$ 的两张数表与旧界的逐条对比

更正申报：本节起头的编号声明表把 §6 末尾两个带号环境写作"命题 6.12、注记 6.13"，与素材共享计数器的实际出现顺序错位一格。按 `main.tex:2486` 之后的实读，正确次序是注记 6.12（`main.tex:2639-2652`）、命题 6.13（`main.tex:2694-2717`）、注记 6.14（`main.tex:2858-2868`）；本节与后续小节一律按此更正，已落盘的声明表保留不改。

素材的 "Numerical implementation" 段（`main.tex:2488-2495`）交代表的来历：对实 $\tau=t$ 反复应用命题 6.9，并考虑注记 6.10 的实轴区间版本，得到 ${\mathrm B}_{\mathcal S}(t)\le{\mathrm B}_*(t)$，这里 $\mathrm B_*(t)$ 是把判据能验证的 $\beta$ 逐点列出的函数；$\theta_0$ 取足够小的值；另有若干 $t$ 处改用注记 6.11 的方法（素材标签 `remark-cb`）替代命题 6.9，这些行在表里以星号标注。

素材接着把 $\mathrm B_{\mathcal S}(-1)$、$\mathrm B_{\mathcal S}(-2)$ 两条与第二作者早前一条乘子估计给出的旧界 $\mathrm B_{\mathcal S}(-1)\le0.420$、$\mathrm B_{\mathcal S}(-2)\le1.246$ 对照（`main.tex:2497-2501`）。本稿按表 1 取值 $\mathrm B_*(-1)=0.403$、$\mathrm B_*(-2)=1.218$，两条分别改进了 $0.017$ 与 $0.028$，方向与素材申报一致。

素材还说明旧不等式是主不等式的特例（`main.tex:2501-2508`）：在定理 4.9 里取 $\theta=1$，并仿 (6.14) 只留左端求和的前两项。本稿逐项核对该特例化，三条都对得上：

- $\theta=1$ 时 (4.14) 给 $b_0=-\frac{1-\theta}{\alpha-2\theta+2}=0$，命题 5.1 的 $k=0$ 情形给 $\Phi_{0,1}(z)=\frac{1-\theta}2\frac{\varphi''(z)}{\varphi'(z)}=0$，故 $N=0$ 层整项消失，与素材质文一致；
- 定理 4.9 的余项常数 $C_6(\alpha,\theta)$ 也随之消失，素材给的理由是 $\theta=1$ 时 $L_\theta=0$。本稿用两条独立途径复核这条理由：按引理 4.1，$\|L_\theta(w)\|^2$ 的方括号是 $1-{}_2F_1(1-\theta,-\theta;1;|w|^2)$，取 $\theta=1$ 得 ${}_2F_1(0,-1;1;\cdot)=1$，方括号归零；按 (4.12)，$\varkappa(\alpha,\theta)$ 的前置因子含 $(1-\theta)$，取 $\theta=1$ 同样归零；
- 剩下的主常数是 $\frac{(\alpha+1)\Gamma(3)}{2(\alpha-1)\bigl[\Gamma(2)\bigr]^{2}}=\frac{\alpha+1}{\alpha-1}$（要求 $\alpha>1$，即 $\theta=1$ 下 $-1+2\theta<\alpha$ 的具体形态）。把定理 4.9 的 $\alpha=\beta+2\theta-1$ 换回判据位置即 $\alpha=\beta+1$，于是主常数成 $\frac{\beta+2}{\beta}$，恰好是 (6.1) 在 $\theta=1$ 处的取值 $K(\beta,1)=\frac{\beta+2}{\beta}+\varkappa(\beta+1,1)$，两处自洽。

表 1（`main.tex:2512-2549`，$t\le0$ 一侧；第三列是素材给的支撑线 $\max\{-t-1,0\}$，即 §1 登记过的 $t\le-R_{\mathrm{CM}}$ 精确段 $-t-1$ 的截断）：

| $t$ | ${\mathrm B}_*(t)$ | $\max\{-t-1,0\}$ |
|---|---|---|
| $-20.000$ | $19.028$ | $19.000$ |
| $-10.000$ | $9.040$ | $9.000$ |
| $-8.000$ | $7.049$ | $7.000$ |
| $-6.000$ | $5.067$ | $5.000$ |
| $-5.000$ | $4.082$ | $4.000$ |
| $-4.000$ | $3.105$ | $3.000$ |
| $-3.000$ | $2.144$ | $2.000$ |
| $-2.500$ | $1.674$ | $1.500$ |
| $-2.400$ | $1.582$ | $1.400$ |
| $-2.300$ | $1.490$ | $1.300$ |
| $-2.200$ | $1.398$ | $1.200$ |
| $-2.100$ | $1.308$ | $1.100$ |
| $-2.000$ | $1.218$ | $1.000$ |
| $-1.900$ | $1.130$ | $0.900$ |
| $-1.800$ | $1.042$ | $0.800$ |
| $-1.752$ | $1.001$ | $0.752$ |
| $-1.700$ | $0.956$ | $0.700$ |
| $-1.600$ | $0.871$ | $0.600$ |
| $-1.500$ | $0.787$ | $0.500$ |
| $-1.400$ | $0.706$ | $0.400$ |
| $-1.300$ | $0.626$ | $0.300$ |
| $-1.200$ | $0.549$ | $0.200$ |
| $-1.100$ | $0.474$ | $0.100$ |
| $-1.000$ | $0.403$ | $0.000$ |
| $-0.900$ | $0.336$ | $0.000$ |
| $-0.800$ | $0.272$ | $0.000$ |
| $-0.700$ | $0.213^{*}$ | $0.000$ |
| $-0.600$ | $0.159^{*}$ | $0.000$ |
| $-0.500$ | $0.112^{*}$ | $0.000$ |
| $-0.400$ | $0.072^{*}$ | $0.000$ |
| $-0.300$ | $0.0404^{*}$ | $0.000$ |
| $-0.200$ | $0.0179^{*}$ | $0.000$ |
| $-0.150$ | $0.0100^{*}$ | $0.000$ |
| $-0.100$ | $0.00443^{*}$ | $0.000$ |
| $-0.050$ | $0.00110^{*}$ | $0.000$ |

本稿读表给出的四个数与判断。第一，$t\to-\infty$ 时上界与精确段 $-t-1$ 的差收敛到 $0.01$ 量级：$t=-20$ 差 $0.028$，$t=-10$ 差 $0.040$，$t=-6$ 差 $0.067$，$t=-4$ 差 $0.105$，$t=-3$ 差 $0.144$，即差随 $|t|$ 单调缩小，方法在左端 asymptotically 锐到已知精确段。第二，Brennan 猜想在 $t=-2$ 处要求 $\mathrm B_{\mathcal S}(-2)=1$，表给 $\mathrm B_*(-2)=1.218$，剩余间隙 $0.218$；表的曲线在 $t=-1.752$ 处已经压到 $1.001$，也就是"上界过 $1$"这件事发生在 $-2$ 的右侧 $0.248$ 处，方法未能触及 $t=-2$ 这条点。第三，$t\ge-1$ 一侧支撑线取 $0$，表值全部为正，故本表在这些点是严格的正向改进，并非持平。第四，星号行（用注记 6.11 的判据）与定理 6.7 的原点渐近常数为同源，本稿算比值 $\frac{{\mathrm B}_*(t)}{t^{2}}$：$t=-0.05$ 得 $0.44$，$-0.10$ 得 $0.443$，$-0.15$ 得 $0.444$，$-0.20$ 得 $0.448$，$-0.30$ 得 $0.449$，$-0.40$ 得 $0.450$，$-0.50$ 得 $0.448$，$-0.60$ 得 $0.442$，$-0.70$ 得 $0.435$；这些数贴着 $\frac{\sqrt{15}-3}{2}=0.43649\ldots$ 摆动，$t=-0.70$ 已经低于该常数，这与定理 6.7 只申报 $\tau\to0$ 的 $\limsup$ 相容。

表 2（`main.tex:2551-2588`，$t\ge0$ 一侧；第三列是精确段 $\mathrm B_{\mathcal S}(t)=3t-1$（$t\ge2/5$，FeMMacGregor 型结果，§1 已登记）的正部 $\max\{3t-1,0\}$）：

| $t$ | ${\mathrm B}_*(t)$ | $\max\{3t-1,0\}$ |
|---|---|---|
| $0.000$ | $0.00000$ | $0.000$ |
| $0.050$ | $0.00141^{*}$ | $0.000$ |
| $0.100$ | $0.0065$ | $0.000$ |
| $0.150$ | $0.0157$ | $0.000$ |
| $0.200$ | $0.031$ | $0.000$ |
| $0.250$ | $0.056$ | $0.000$ |
| $0.300$ | $0.101$ | $0.000$ |
| $0.350$ | $0.190$ | $0.050$ |
| $0.400$ | $0.314$ | $0.200$ |
| $0.450$ | $0.447$ | $0.350$ |
| $0.500$ | $0.585$ | $0.500$ |
| $0.600$ | $0.870$ | $0.800$ |
| $0.700$ | $1.159$ | $1.100$ |
| $0.800$ | $1.452$ | $1.400$ |
| $0.900$ | $1.746$ | $1.700$ |
| $1.000$ | $2.041$ | $2.000$ |
| $1.100$ | $2.337$ | $2.300$ |
| $1.200$ | $2.634$ | $2.600$ |
| $1.300$ | $2.932$ | $2.900$ |
| $1.400$ | $3.230$ | $3.200$ |
| $1.500$ | $3.528$ | $3.500$ |
| $1.600$ | $3.826$ | $3.800$ |
| $1.700$ | $4.124$ | $4.100$ |
| $1.800$ | $4.423$ | $4.400$ |
| $1.900$ | $4.722$ | $4.700$ |
| $2.000$ | $5.021$ | $5.000$ |
| $2.100$ | $5.320$ | $5.300$ |
| $2.200$ | $5.619$ | $5.600$ |
| $2.300$ | $5.918$ | $5.900$ |
| $2.400$ | $6.217$ | $6.200$ |
| $2.500$ | $6.517$ | $6.500$ |
| $3.000$ | $8.014$ | $8.000$ |
| $4.000$ | $11.011$ | $11.000$ |
| $5.000$ | $14.010$ | $14.000$ |
| $6.000$ | $17.010$ | $17.000$ |

本稿读表 2：$t\ge0.35$ 起上界与精确线 $3t-1$ 的差稳定在 $0.01$ 到 $0.09$ 之间（$t=0.5$ 差 $0.085$，$t=1$ 差 $0.041$，$t=2$ 差 $0.021$，$t=6$ 差 $0.010$），说明方法在大 $t$ 处同样是贴线的，与表 1 的左侧行为对称。$0<t<2/5$ 区间精确线取 $0$（素材 §1 的平凡界给 $\mathrm B_{\mathcal S}(t)\le3t$），表值 $0.031$、$0.056$、$0.101$ 分别在 $t=0.2,0.25,0.3$ 处低于 $3t$ 的 $0.6$、$0.75$、$0.9$ 三个数，改进幅度是四五倍。原点方向再算 $\frac{{\mathrm B}_*(t)}{t^{2}}$：$t=0.05$ 得 $0.564$，$0.10$ 得 $0.65$，$0.15$ 得 $0.698$，$0.20$ 得 $0.775$，$0.25$ 得 $0.896$，$0.30$ 得 $1.122$；正值一侧的比值明显高于定理 6.7 的 $0.43649$，且随 $t$ 递增，这与 $\mathrm B_{\mathcal S}$ 在 $t>0$ 侧凸性趋陡一致，也说明表 2 的 $t\in(0,0.35)$ 各行是在有限 $\beta$ 处验证判据的结果，尚未进入 $\limsup$ 的渐近区。素材在两张表下写 `TABLES 1 AND 2.`（`main.tex:2590`）。

图 1（`main.tex:2595-2637`）是 `curves` 宏包的手绘 `\picture` 环境，本稿把它的坐标解码后核对与数表一致。坐标变换由刻度注记读出：水平轴上 $t=-2,-1,0,1,2$ 的刻度分别在 $x=-75,0,75,150,225$（`main.tex:2598-2606`），故 $x=75(t+1)$；竖直轴上 $B=1,2$ 的刻度在 $y=75,150$（`main.tex:2607-2610`），故 $y=75B$。两条支撑线的 `\curve` 节点因此可直读：`\curve(-100,100, 0,0)`（`main.tex:2613`）即从 $\bigl(-\tfrac73,\tfrac43\bigr)$ 到 $(-1,0)$ 的线段，正合 $B=-t-1$；`\curve(100,0, 150,150)`（`main.tex:2615`）即从 $\bigl(\tfrac13,0\bigr)$ 到 $(1,2)$，正合 $B=3t-1$，两段的标注在 `main.tex:2614` 与 `main.tex:2616`。主曲线 `B={\mathrm B}_*(t)` 的标注在 `main.tex:2617`，其节点串在 `main.tex:2618-2621`，本稿逐项换算（$t=x/75-1$，$B=y/75$）并与表对照：

$$(x,y)\ (-90,104.85)\to t=-2.2,\ B=1.398;\quad (-75,91.35)\to t=-2,\ B=1.218;\quad (-60,78.15)\to t=-1.8,\ B=1.042;$$
$$(x,y)\ (-45,65.325)\to t=-1.6,\ B=0.871;\quad (-30,52.95)\to t=-1.4,\ B=0.706;\quad (-15,41.175)\to t=-1.2,\ B=0.549;$$
$$(x,y)\ (0,30.225)\to t=-1,\ B=0.403;\quad (15,20.4)\to t=-0.8,\ B=0.272;\quad (30,12.075)\to t=-0.6,\ B=0.161;$$
$$(x,y)\ (45,5.70)\to t=-0.4,\ B=0.076;\quad (60,1.5)\to t=-0.2,\ B=0.02;\quad (75,0)\to t=0,\ B=0;$$
$$(x,y)\ (82.5,0.49)\to t=0.1,\ B=0.00653;\quad (90,2.325)\to t=0.2,\ B=0.031;\quad (93.75,4.185)\to t=0.25,\ B=0.0558;$$
$$(x,y)\ (97.5,7.575)\to t=0.3,\ B=0.101;\quad (101.25,14.22)\to t=0.35,\ B=0.1896;\quad (105,23.55)\to t=0.4,\ B=0.314;$$
$$(x,y)\ (112.5,43.875)\to t=0.5,\ B=0.585;\quad (120,65.25)\to t=0.6,\ B=0.87;\quad (135,108.9)\to t=0.8,\ B=1.452;$$
$$(x,y)\ (150,153.075)\to t=1.0,\ B=2.041.$$

逐条与两张表给出的 ${\mathrm B}_*(t)$ 相同，差异只出现在 $t=-0.6,-0.4$ 两个节点（图取 $0.161,0.076$，表取 $0.159,0.072$），差在第三位小数，属绘图取整。图注在 `main.tex:2635-2636`，写作 "Graph of $B={\mathrm B}_*(t)$, the estimated universal spectral function; support lines included."，即图里同时画出两条支撑线。

注记 6.12（`main.tex:2639-2652`）把表的信息用到另一类 $\Sigma$。素材的推理只用三条事实：$\mathrm B_\Sigma(t)$ 凸、$\mathrm B_\Sigma(t)\le\mathrm B_{\mathcal S}(t)$、$\mathrm B_\Sigma(2)=1$（§1 登记的 Makarov 结果，素材编号 (1.6)）。由凸性与 $\mathrm B_\Sigma(0)=0$、$\mathrm B_\Sigma(2)=1$，对 $0<t<2$ 有 $\mathrm B_\Sigma(t)\le\frac{t}{2}\cdot1$? 不，素材用的方向相反：它从 $\mathrm B_\Sigma$ 的凸性以及 $\mathrm B_\Sigma(t)\le{\mathrm B}_*(t)$ 的点值供给里"取较大供应量的样本值"推出（`main.tex:2642-2645`）

$$\mathrm B_\Sigma(1)\le0.4600,$$

把 Makarov-Pommerenke 的旧值 $\mathrm B_\Sigma(1)\le0.4886$ 改进了 $0.0286$。本稿复核凸性这一步的可行范围：$\mathrm B_\Sigma$ 凸、$\mathrm B_\Sigma(0)=0$、$\mathrm B_\Sigma(2)=1$ 给出弦 $\frac{t}2$ 在 $t=1$ 处为 $0.5$，比 $0.4600$ 弱，所以素材必须用到 $t$ 远离 $1$ 的样本值来压低割线；按表 2 与 $\mathrm B_\Sigma(t)\le{\mathrm B}_*(t)$，可取 $\mathrm B_\Sigma(0.35)\le0.190$、$\mathrm B_\Sigma(1.5)\le3.528$ 等点，凸函数在 $(0.35,0.190)$ 与 $(2,1)$ 之间的割线在 $t=1$ 处取值 $\frac{1-0.190}{2-0.35}\cdot0.65+0.190=0.4811$，仍不到 $0.4600$；再用 $t<0$ 一侧的 $\mathrm B_\Sigma(-0.7)\le0.213$ 与 $(2,1)$ 的割线在 $t=1$ 处给 $\frac{1-0.213}{2.7}\cdot1.7+0.213=0.7107$，更弱。本稿按实读的素材文字只能确认它宣称的结论 $0.4600$ 与所用三性质，无法从表 1、表 2 的样本复现出 $0.4600$ 这条具体割线，素材质文也只说"from a somewhat larger supply of sample values"（`main.tex:2643-2644`），即样本集比表里列出的更密。这条按"素材申报、本稿未能复现"登记。注记 6.12 后半给出 $\mathrm B_\Sigma(1)$ 的两条几何解释（`main.tex:2646-2651`）：它描述单连通有界平面区域的 Green 线（Green 函数的水平曲线）趋边时的长度增长率，也决定 $\Sigma$ 中函数 Laurent 系数的衰减率。

## 7 与本语料的接缝

§0 登记过引用方：D40（bib key `HedenmalmShimorin`）与 D54（bib key `HedenmalmShimorin2005`）两篇语料稿。C 稿侧不动语料稿，本稿也不反查语料稿（§0 取证边界），所以本节的接口点全部给到素材行与本稿节行两级可核对的对象，本体侧落回引时按条目配对即可逐条验收。

### 7.1 接口点：七组可核对的对象

第一组，记号层。类 $\mathcal S$ 与规格化 $\varphi(0)=0$、$\varphi'(0)=1$、积分均值 $\mathbf M_{t}[\varphi'](r)$、谱函数 $\beta_\varphi(t)$、universal 谱 $\mathrm B_{\mathcal S}(t)$ 五件在 §1.1 逐一落定义，外盘类 $\Sigma$ 与 $\mathrm B_\Sigma(t)$ 在 §1.3，谱函数的凸性与平凡界 $0\le\mathrm B_{\mathcal S}(t)\le\max\{3t,-t\}$ 同在 §1.1。凡语料稿使用"积分均值谱"一词，记号以这五件为准；下确界定义与凸性在任何引用位不改变含义。

第二组，精确段与平凡界（§1.2）：$\mathrm B_{\mathcal S}(t)=3t-1$ 在 $\tfrac25\le t<+\infty$ 成立，$\mathrm B_{\mathcal S}(t)=-t-1$ 在 $t\le-R_{\mathrm{CM}}$ 成立，$2\le R_{\mathrm{CM}}<+\infty$ 且精确值未知，Brennan 猜想与 $R_{\mathrm{CM}}=2$ 等价，等价写法是 $\mathrm B_{\mathcal S}(-2)=1$。语料稿引用本论文支撑"已知精确段"时只能取这两段；中段 $(-R_{\mathrm{CM}},\tfrac25)$ 内只有上界可言。

第三组，比较式与 Kraetzer 猜想。Makarov 比较公式按素材实读（位置串 `main.tex:261-265`）为：

$$\mathrm B_{\mathcal S}(t)=\max\bigl\{\mathrm B_\Sigma(t),\,3t-1\bigr\},\qquad t\in\mathbb R.$$

Kraetzer 猜想按素材原文（位置串 `main.tex:274-277`）为：

$$\mathrm B_\Sigma(t)=\frac{t^{2}}{4},\qquad -2\le t\le 2,$$

`main.tex:274-276` 原文申报作者未能解决其中适用 $\mathrm B_{\mathcal S}$ 的那部分。这一组给语料的是一条硬边界：语料稿引本论文，不得据此说该文解决了谱函数整体，也不得说该文证明了 Kraetzer 陈述。

第四组，Hilbert 化恒等式，位置串 `main.tex:305-309`（本稿 §1.5）：

$$\beta_\varphi(t)=\inf\Bigl\{\alpha+1:\,(\varphi')^{t/2}\in\mathcal H_\alpha(\mathbb D)\Bigr\},$$

配套权（位置串 `main.tex:297-301`）为 $\mathrm dA_\alpha(z)=(\alpha+1)\bigl(1-\lvert z\rvert^{2}\bigr)^{\alpha}\,\mathrm dA(z)$，$\mathrm dA(z)=\frac{\mathrm dx\,\mathrm dy}{\pi}$。语料稿把积分均值的 growth 阶改写成加权 Bergman 空间的属于性时，接口就是这两条展示式；$\mathcal H_\alpha(\mathbb D)$ 在本稿读 §1.5，双盘版本 $\mathcal H_{\alpha,\beta}(\mathbb D^{2})$ 读 §3.1。

第五组，证明骨架链。七个环节依次为：Prawitz 面积定理（§2.1）、二变量三步搬运（§2.2）、对角限制的锐范数恒等式（§3.5）、定理 4.9 主不等式（§4.6）、命题 5.1 的导数因子 $\Phi_{1,\theta}=(2-\theta)\Bigl[\frac16\frac{\varphi'''}{\varphi'}-\frac{\theta+1}{8}\Bigl(\frac{\varphi''}{\varphi'}\Bigr)^{2}\Bigr]$（§5.2）、单层判据 (6.2)（§6.1）、命题 6.9 的圆盘判据与全 $\theta$ 优化（§6.7）。语料稿引用"该文方法"时必须落到这条链的某个环节，跳过链只报方法名不算接口。

第六组，原点终极上界。定理 6.7（§6.6）的常数行在素材实读，位置串 `main.tex:2267`：

$$\limsup_{\mathbb C\ni\tau\to0}\frac{\mathrm B_{\mathcal S}(\tau)}{\lvert\tau\rvert^{2}}\le\frac{\sqrt{15}-3}{2}=0.43649\ldots$$

引用这条时三件限定要随行同传：它是对复 $\tau\to0$ 的 $\limsup$ 渐近陈述，不在任何固定非零 $t$ 处给一致界；实 $t$ 一侧前面有 $\frac12$ 一档（推论 6.4，§6.3），旧界 Pommerenke 的 $(3+\varepsilon)t^{2}$ 被它替换（注记 6.8，§6.6）。

第七组，数表与 $\Sigma$ 的应用（§6.8）。${\mathrm B}_*(t)$ 的读数：$t=6$ 与 $3t-1$ 差 $0.010$，$t=0.2$ 处表值 $0.031$ 而平凡界取 $0.6$，$t=-1$ 处表值 $0.403$。推论端 $\mathrm B_\Sigma(1)$：Makarov-Pommerenke 旧值 $0.4886$ 被注记 6.12 改到 $0.4600$，改进量 $0.0286$。语料稿取 $0.4600$ 这条时必须带上 §6.8 登记的限定：本稿未能从两张数表的样本复现该割线。

### 7.2 素材里已有什么、本语料还缺什么

素材供给齐整，以本稿承接节为证：§1 有谱的两种定义、精确段、比较式与背景三条线；§2 有 Prawitz 恒等式及二变量放大；§3 有双盘加权空间的完整算子代数（核分解 §3.1、消失阶与命题 3.1 §3.2、分层与两个分解 §3.3、单位算子族与引理 3.2、3.3 §3.4、对角限制锐范数恒等式 §3.5、常数 $\sigma(\alpha,\beta)$ 的显式与超几何求值 §3.6、$Q_{\alpha,\beta}$ 积分表示与逐层范数公式 §3.7、命题 3.9 与推论 3.10 §3.8）；§4 有定理 4.9 两端的合成与逐层常数渐近；§5 有 $\varphi$ 形式的代数；§6 有判据、两层展开、引理 6.5 的三阶吸收、引理 6.6 的插值、定理 6.7、圆盘判据、两张数表与图 1 的解码坐标。另有 §1.6 复参数谱与 §1.7 面积 Muckenhoupt 条件、Helson-Szegő、Bloch 范数三条背景线，全部在素材引言内落过行号。

本语料还缺的，按件登记。第一条，回引未落。D40 与 D54 均无指向本稿的锚（§0 只登记了引用关系），落回引时要挂的对象即 §7.1 的七组，逐组可验收。第二条，$0.4600$ 割线的复现。素材申报其样本集比两张数表更密（§6.8 已按"素材申报、本稿未能复现"登记），语料侧对该线目前只有申报口径；复现路径素材已备好：按命题 6.9 的圆盘判据（§6.7）逐点取样，本语料尚无人执行这一步。第三条，复参数段落的归属待核。§1.6 与 §6.3、§6.6 的陈述按 $\mathbb C\ni\tau\to0$ 取 $\limsup$，D40 或 D54 是否承接了复 $\tau$ 版本，本稿从语料稿侧不可知；本体侧配对时的核对对象：语料稿是否携带复 $\tau$ 的 $\limsup$ 陈述，若未携带，该段按素材对本语料的余量登记。第四条，$R_{\mathrm{CM}}$ 的精确值。素材只给 $2\le R_{\mathrm{CM}}<+\infty$ 与 Brennan 等价链（§1.2），精确值的证明不在素材内，语料侧无法从本稿补出这个数。

### 7.3 更正与复核登记

第一条，兑现 §6.3 预告的更正登记。实读命题 6.3 证明段 `main.tex:2068-2090`：素材在 `main.tex:2073-2076` 把主项不含 $\varepsilon$、系数为 $\frac{2(1-\theta)\Gamma(2\theta+1)}{\Gamma(1+\theta)\Gamma(2+\theta)}$ 的显示式标成 left hand side 行为，在 `main.tex:2077-2080` 把主项含 $\bigl[\frac{1+\theta}{2(1-\theta)}+\varepsilon\bigr]^{-1}$ 的显示式标成 right hand side 行为，与 §6.3 复算给出的判据 (6.2) 两端左右配置相反；两条显示式的内容本身复算皆正确。登记如下：错在素材的左右标签，命题 6.3 结论 (6.7) 与其后整条链条不受影响。

第二条，本节动笔时实测发现 §6.8 注记 6.12 段首句（稿内行 1089）"把表的信息转 used 到另一类"混入一个多余英文词 used。该处属已落盘内容，不在本笔权限内，按不得回改条款不动，登记在此由收稿侧处置。

第三条，复核残余清点。数表与图 1 的差异只在 $t=-0.6$ 与 $t=-0.4$ 两个节点，分别为 $0.002$ 与 $0.004$（§6.8 已按绘图取整登记）；§6.4 到 §6.6 复算出的三个数 $6$、$96$、$\frac{1}{24}$ 与素材 (6.10)、(6.11) 逐字一致，本节复核无新增偏差。
