# C34 多重调和函数的 Kiselman 最小值原理新证（arXiv:1810.12733）

## 0 取证边界

- arXiv id：1810.12733
- 作者（原文署名逐字）：Fusheng Deng, Zhiwei Wang, Liyou Zhang, Xiangyu Zhou
- 发表年月：2018-10-30
- 素材目录：`E:\math\被引素材/1810.12733`
- 主 `.tex` 清单：`被引素材/1810.12733/main.tex`（15043 字节 / 316 行；本次读取覆盖全文 1–315 行）
- 本语料中引用它的稿号与 bib key（仅登记，不读这些稿）：D305（bib key `DWZZ2018`）；D471（bib key `DengWangZhangZhou2018`）
- 取材薄读之处：全文 2 节、1 条引理、1 条命题、3 条主定理（Reinhardt 情形、抽象紧 Lie 群情形与原文复述的 Kiselman 原文版本）；bibliography 用的是内嵌 `thebibliography`，未读取外加 `.bib`；定理证明在 §2 一节完成，依赖 Ohsawa–Takegoshi 引理。

- 素材 preamble 记法登记（`main.tex:1-49` 只用于解释记号，不作内容来源）：`\mc` 按 `\mathbb{C}` 读（`main.tex:41`）、`\mr` 按 `\mathbb{R}` 读（`main.tex:42`）、`\ra` 按 `\to` 读（`main.tex:43`）、`\half` 按 `\tfrac{1}{2}` 读（`main.tex:30`）、`\be/\ee/\bea/\eea/\ben/\een/\bt/\et` 为公式环境缩写（`main.tex:32-40`）、`\ba/\bx/\by/\bm/\bn` 为粗体字母缩写（`main.tex:11-12`）。
- 形义不明、登记不发明的宏：`\cv`（`main.tex:13`）、`\vac`（`main.tex:15`）、`\Span`（`main.tex:48`，声明为 span 算子名）三个宏在正文里均未出现实例，本稿不给它们的展开形，也不据它们写任何陈述。
- 定理环境声明在 `main.tex:17-28`：`thm/cor/lem/prop` 共用一个按节计数器，`defn`、`rem`、`exm` 各按节独立计数。正文实用的环境只有一个 `lem`（`main.tex:154`）、一个 `prop`（`main.tex:167`）、三个 `thm`（`main.tex:84`、`main.tex:102`、`main.tex:115`）；`cor`、`defn`、`rem`、`exm` 四类在正文里没有实例，因此本稿不宣称素材给出推论或反例级条目。
- 素材尾部（`main.tex:271-277`、`main.tex:296-312`）为空行与重复排版的 `\maketitle`（`main.tex:306`），无数学内容；`\bibliographystyle{amsplain}` 与内嵌 `thebibliography` 在 `main.tex:278-300`，共 7 条 `bibitem`。
- 结果条数申报：摘要（`main.tex:74-77`）与引言（`main.tex:80-82`）只申报一条成果，即基于 Ohsawa–Takegoshi 拓展定理重证 Kiselman 最小值原理。据此本稿把陈述级条目定为 3 条定理加 1 条命题加 1 条引理，共 5 条，下文按条给到公式级。

## 1 问题的来源与 Reinhardt 化归

### 1.1 原文陈述的 Kiselman 原理

原文 `main.tex:84-93`（`thm-intr:Kiselman`）把 Kiselman 1978 的最小值原理逐字复述为：设 $\Omega\subset\mathbb{C}_t^r\times\mathbb{C}_z^n$ 为拟凸域，$p:\Omega\to U:=p(\Omega)\subset\mathbb{C}^r$ 为自然投影；所有纤维 $\Omega_t:=p^{-1}(t)$（$t\in U$）连通且为「管状域」（即对 $z$ 中像部分不动的形式），$\varphi$ 为 $\Omega$ 上的多重调和函数，则

$$\varphi^*(t):=\inf_{z\in\Omega_t}\varphi(t,z)$$

是 $U$ 上的多重调和函数。这条陈述的关键是「纤维方向取下确界后整体仍多重调和」。

### 1.1.1 定理 1.1 假设链的逐条公式级拆读

下面把 `main.tex:84-93` 的每条假设单占一行写出，全部记号按素材原形：

- 假设一（底域）：$\Omega\subset\mathbb{C}_t^r\times\mathbb{C}_z^n$ 为拟凸域，即 $\Omega$ 上存在多重次调和的连续定义函数（`main.tex:85`）。
- 假设二（投影）：$p:\Omega\to U:=p(\Omega)\subset\mathbb{C}^r$ 为到前 $r$ 个坐标的自然投影，$U$ 记为像集（`main.tex:86`）。
- 假设三（位势）：$\varphi$ 为 $\Omega$ 上的多重调和函数（原文 plurisubharmonic function on $\Omega$，`main.tex:87`）。
- 假设四（纤维形状）：对一切 $t\in U$，纤维 $\Omega_t:=p^{-1}(t)$ 连通且为管状域（connected tube domains，`main.tex:88`）。
- 假设五（像部分无关性）：对一切 $(t,z)\in\Omega$，$\varphi(t,z)$ 不依赖 $z$ 的像部（is independent of the image part of $z$，`main.tex:89`）。

定理 1.1 的结论式为：$$\varphi^*(t):=\inf_{z\in\Omega_t}\varphi(t,z),\qquad \varphi^*\ \text{在}\ U\ \text{上多重调和}\, (t\in U).$$ 该式在素材里占 `main.tex:91-92` 两行，展示式只写了下确界定义本身，未给逼近式、未给上界常数、未给光滑性断言。

陈述级行占核：`thm-intr:Kiselman` 在素材中占 `main.tex:84-93` 共 10 行（含 `\begin{thm}` 与 `\end{thm}`），其中展示式 1 条位于 `main.tex:91`。素材在本定理处未使用 `proof` 环境，证明全部转移到 §2 的命题 3.1（`main.tex:167-175`）与 `main.tex:258-269` 的化归段。

### 1.2 Reinhardt 化归

`main.tex:95-109` 把上述定理归到 $T^n$-不变 Reinhardt 域情形（`thm-intr:Reinhardt case`）：同一条 $\varphi^*$ 公式，要求纤维为连通 Reinhardt 域，$\varphi(t,\alpha z)=\varphi(t,z)$（$\alpha\in T^n$）。原文在 `main.tex:100-101` 用一句话点明 Reinhardt 情形蕴含管状情形，经指数映射把像部分"剥离"即可。

### 1.2.1 作用式、定义式与定理 1.2 的完整假设链

$T^n$ 在 $\mathbb{C}^n$ 上的作用式在 `main.tex:96-97` 逐字给出：$(e^{i\theta_1},\dots,e^{i\theta_n})\cdot(z_1,\dots,z_n):=(e^{i\theta_1}z_1,\dots,e^{i\theta_n}z_n)$，其中 $\theta=(\theta_1,\dots,\theta_n)\in\mathbb{R}^n$，群结构为 $(\mathbb{R}/2\pi\mathbb{Z})^n\cong T^n$（此同构式为本稿按素材语境补写的读法，非素材原式）。

定义（Reinhardt 域，`main.tex:98`）：$D\subset\mathbb{C}^n$ 为区域，若 $\alpha\cdot z\in D$ 对一切 $\alpha\in T^n$ 与 $z\in D$ 成立，即 $D$ 在 $T^n$ 作用下不变，则称 $D$ 为 Reinhardt 域。

化归式（本稿补写，素材只给 `main.tex:100` 一句 Taking exponential map）：坐标换式 $\exp:(w_1,\dots,w_n)\mapsto(e^{w_1},\dots,e^{w_n})$ 把 $\mathbb{C}^n$ 中的管状域送到 $(\mathbb{C}^*)^n$ 中的 $T^n$-不变域，$w$ 的虚部坐标正好给出 $T^n$ 旋转量，故假设五（像部分无关性）在换坐标后等价于假设 $\varphi(t,\alpha z)=\varphi(t,z)$（$\alpha\in T^n$）。本稿把它登记为读法，不作为素材陈述。

定理 1.2（`thm-intr:Reinhardt case`，`main.tex:102-109`）假设链逐条：

- $\Omega\subset\mathbb{C}_t^r\times\mathbb{C}_z^n$ 为拟凸域（`main.tex:103`）；
- $p:\Omega\to U:=p(\Omega)\subset\mathbb{C}^r$ 为自然投影（`main.tex:104`）；
- 纤维条件：$\Omega_t:=p^{-1}(t)$（$t\in U$）全为连通的 Reinhardt 域（`main.tex:104`）；
- 位势条件：$\varphi$ 为 $\Omega$ 上的多重调和函数，且 $\varphi(t,\alpha z)=\varphi(t,z)$ 对一切 $\alpha\in T^n$ 成立（`main.tex:105`）。

结论式：$$\varphi^*(t):=\inf_{z\in\Omega_t}\varphi(t,z)$$ 在 $U$ 上多重调和（`main.tex:106-108`）。与定理 1.1 相比，本条把「连通管状域加像部分无关」换成「连通 Reinhardt 域加 $T^n$-不变」，结论式的字形完全相同，差异全在假设四与假设五。

### 1.3 紧 Lie 群版本与原文安排

`main.tex:111-129` 在 Reinhardt 情形之外，进一步把作用群从 $T^n$ 换成任意保持 Lebesgue 测度的紧 Lie 群 $K$（条件 (a)–(d)）。`main.tex:131-144` 把证法归到 Demailly 关于 Bergman 核逼近多重子调和函数的方法（[Dem92](201-205)）：把 OT 引理应用到离散点拓展，Demailly 给出"多重子调和函数由 Bergman 核逼近"；DWZZ 后续工作用此给出了多重子调和函数的另一种刻画。

本派单的落点正好是这条延拓思路的另一端：`main.tex:137-140` 指出，把 Demailly 的拓展从离散点扩到正维子流形，便可重证 Kiselman 的最小值原理。

### 1.3.1 定理 1.3（紧 Lie 群情形）的公式级陈述

定理 1.3（`thm-intr:main`，`main.tex:115-129`）为本素材的主定理。逐条假设：

- 底域与投影：$\Omega\subset\mathbb{C}_t^r\times\mathbb{C}_z^n$ 拟凸，$p:\Omega\to U:=p(\Omega)\subset\mathbb{C}^r$ 自然投影（`main.tex:116-117`）；
- 纤维连通：$\Omega_t:=p^{-1}(t)$（$t\in U$）全部连通，此处不再要求 Reinhardt 结构（`main.tex:117`）；
- 位势：$\varphi$ 为 $\Omega$ 上的多重调和函数（`main.tex:118`）；
- 群作用的存在性：存在紧 Lie 群 $K$ 全纯地作用于 $\mathbb{C}^n$，即作用映射 $K\times\mathbb{C}^n\to\mathbb{C}^n$ 对第二个变量全纯（`main.tex:119`）。

四条附加条件按原文逐条给到公式级（`main.tex:120-125`）：

- 条件 (a)（保测度）：$K$ 在 $\mathbb{C}^n$ 上的作用保持 Lebesgue 测度，即对可积函数 $g$ 有 $\int_{\mathbb{C}^n}g(\alpha z)\,d\mu(z)=\int_{\mathbb{C}^n}g(z)\,d\mu(z)$ 对一切 $\alpha\in K$（`main.tex:121`）。
- 条件 (b)（纤维不变）：$\alpha\cdot\Omega_t\subset\Omega_t$ 对一切 $\alpha\in K$ 与 $t\in U$ 成立（`main.tex:122`）。
- 条件 (c)（纤维上不变全纯函数为常数）：若 $h\in\mathcal O(\Omega_t)$ 且 $h(\alpha z)=h(z)$ 对一切 $\alpha\in K$、$z\in\Omega_t$ 成立，则 $h$ 在 $\Omega_t$ 上恒等于某个常数（`main.tex:123`）。
- 条件 (d)（位势不变）：$\varphi(t,\alpha z)=\varphi(t,z)$ 对一切 $(t,z)\in\Omega$ 与 $\alpha\in K$ 成立（`main.tex:124`）。

结论式：$$\varphi^*(t):=\inf_{z\in\Omega_t}\varphi(t,z)$$ 在 $U$ 上多重调和（`main.tex:126-128`）。

证明归属：素材在 `main.tex:111-113` 声明定理 1.3 不由本文单独重证，其证明是定理 1.2 的论证按 `main.tex:112` 所引 Deng–Zhang–Zhou 两文框架的直接推广（For example, in the same way one can show the following），因此本文对定理 1.3 只给陈述，实际写出的证明只覆盖命题 3.1（`main.tex:177-256`）与 `main.tex:258-269` 的化归段。这一分工是本稿读 §2 时必须记住的边界。

### 1.4 与早期证明的关系

`main.tex:142-144` 比较本证明与既有路线：

- Kiselman 1978 用部分 Legendre 变换得到本原理；
- Berndtsson 1998 用 Prekopa 型不等式给出 pluri-subharmonic 版本的 Preskyopa 定理，从而推出 Kiselman 原理；
- Deng–Zhang–Zhou 2014、2017 在非紧群作用框架下推广该原理。

本稿路线与上述三者都不同：依赖 OT 引理与 Bergman 核逼近，不需 Prekopa 型不等式。该特征是把"OT+对偶权"机制直接搬到纤维取下确界的设置。

## 2 证明工具：Ohsawa–Takegoshi 拓展引理

`main.tex:154-162` 把 Ohsawa–Takegoshi 引理（`lem:OT`）陈述为：设 $\Omega\subset\mathbb{C}_t^r\times\mathbb{C}_z^n$ 为有界拟凸域，$p:\Omega\to U$ 为自然投影，$\varphi$ 为 $\Omega$ 上的多重调和函数，则对任一 $t\in U$ 与 $\Omega_t:=p^{-1}(t)$ 上的全纯函数 $f$，存在 $\Omega$ 上的全纯函数 $F$ 使 $F|_{\Omega_t}=f$，并且

$$\int_\Omega |F|^2 e^{-\varphi}\le C\int_{\Omega_t}|f|^2e^{-\varphi_t},$$

其中 $\varphi_t(z)=\varphi(t,z)$，$C$ 与 $\varphi$、$t$、$f$ 无关。这条引理在 `main.tex:212-214` 用来给出关键上界。原稿不重证 OT，只把 $C$ 当常数使用。

### 2.1 引理 2.1 的完整假设链与结论式

引理 2.1（`lem:OT`，`main.tex:154-162`）逐条：

- 底域：$\Omega\subset\mathbb{C}_t^r\times\mathbb{C}_z^n$ 为**有界**拟凸域（bounded pseudoconvex domain，`main.tex:155`）；
- 投影：$p:\Omega\to U:=p(\Omega)\subset\mathbb{C}^r$ 自然投影（`main.tex:156`）；
- 位势：$\varphi$ 为 $\Omega$ 上的多重调和函数（`main.tex:157`）；
- 源数据：任取 $t\in U$ 与 $\Omega_t:=p^{-1}(t)$ 上的全纯函数 $f\in\mathcal O(\Omega_t)$（`main.tex:158`）。

结论：存在 $\Omega$ 上的全纯函数 $F\in\mathcal O(\Omega)$ 满足拓展条件 $F|_{\Omega_t}=f$ 与 $L^2$ 估计

$$\int_\Omega|F|^2e^{-\varphi}\le C\int_{\Omega_t}|f|^2e^{-\varphi_t},$$

其中 $\varphi_t(z):=\varphi(t,z)$（`main.tex:160`），且 $C$ 为与 $\varphi$、$t$、$f$ 三者都无关的常数（`main.tex:161`）。素材未给 $C$ 的显式形，未给 $\Omega$ 的体积因子，也未给 $r$、$n$ 在 $C$ 中的依赖方式，故本稿只把 $C$ 当作绝对常数使用。

### 2.2 本稿实际使用的 $m$ 加权形式

素材在证明里把引理 2.1 的 $\varphi$ 换成 $m\varphi$（$m$ 为正整数），得到 `main.tex:212-214` 实际写入的估计式：设 $f\in H^2(\Omega,m\varphi)$ 为范数极小且 $f|_{\Omega_t}\equiv 1$ 的函数，则

$$\int_\Omega|f|^2e^{-m\varphi}\le C\int_{\Omega_t}e^{-m\varphi_z},$$

其中 $C$ 与 $m$、$t$ 无关（`main.tex:214`）。右端之所以只剩 $e^{-m\varphi_z}$，是因为拓展的源函数在这一步被取为常值 $1$，即 $|f|^2$ 在 $\Omega_t$ 上恒为 $1$。素材在 `main.tex:213` 写作 $e^{-m\varphi_z}$、在 `main.tex:222` 写作 $e^{-m\varphi_t}$，两处下标字形不同（$z$ 与 $t$）而所指同为限制位势 $\varphi_t(z)=\varphi(t,z)$ 的积分，本稿按素材逐字保留两种写法并在此登记差异，不作统一改写。

引理 2.1 的有界性假设在本稿中的落点：命题 3.1（`main.tex:167-170`）要求 $D\subset\mathbb{C}_z^n$ 为有界拟凸 Reinhardt 域，从而 $\Omega=U\times D$ 在 $z$ 方向有界，正是为了套用 `lem:OT`。`main.tex:260-263` 的化归段再把无界纤维情形用 $\varphi+M\max\{\rho,0\}$ 与截断域拉回该形状。

## 3 抽象同伦与乘积域化归

`main.tex:258-269` 是从"乘积域"命题推出 Reinhardt 定理的技术，思路来自 Berndtsson 1998 的 Prekopa 型方法。步骤如下：

1. `main.tex:260` 由逼近把 $\varphi$ 视作连续函数；
2. `main.tex:261-264` 缩小 $\Omega$ 使 $\varphi$ 在 $\overline\Omega$ 的某邻域内定义，再取光滑多重调和张量 $\rho$ 使 $\Omega=\{\rho<0\}$，并经 $T^n$-平均化 $\rho$；
3. `main.tex:265-267` 利用 $U$ 上局部性收缩 $U$ 得到拟凸 Reinhardt 域 $V$ 使 $\Omega\subset U\times V$ 且二者都落在 $\varphi$、$\rho$ 的定义域里；
4. `main.tex:268-269` 对 $U\times V$ 与函数 $\varphi+M\max\{\rho,0\}$ 应用命题 `prop:product case`，令 $M\to+\infty$ 取极限便得到 `thm-intr:Reinhardt case`。

该节的存在理由：让任意 Reinhardt 域 $\Omega$ 用"乘积 $U\times V$ 包住"再让 $M\to\infty$ 把 $\Omega$ 外的部分代价化。

### 3.1 化归段的逐式写法（`main.tex:258-269`）

素材用十二行文本给出从命题 3.1 到定理 1.2 的全部中间对象，逐式列出：

- 逼近步（`main.tex:260`）：By approximation, we can assume that $\varphi$ is continuous。素材未写逼近序列的形与方向，本稿不给 $\varphi_\nu$ 的显式构造，只登记「可用逼近把位势取成连续」这一步存在。
- 缩域步（`main.tex:261-262`）：By replacing $\Omega$ by a smaller domain, we can assume that $\varphi$ is defined on some neighborhood of $\overline\Omega$，即把定义域从 $\Omega$ 扩到一个开邻域 $W\supset\overline\Omega$，使 $\varphi|_W$ 有定义。
- 定义函数步（`main.tex:262-263`）：存在 $W$ 上的光滑多重调和函数 $\rho$ 使 $\Omega$ 由 $\rho<0$ 给出，即 $\Omega=\{(t,z)\in W:\rho(t,z)<0\}$，等价写法 $\Omega=\{\rho<0\}$。
- 平均化步（`main.tex:264`）：By averaging, $\rho$ can be taken to be invariant under the action of $T^n$，即 $\rho(t,\alpha z)=\rho(t,z)$ 对一切 $\alpha\in T^n$。素材未写出平均化的积分式，本稿不补。
- 局部化步（`main.tex:265-267`）：定理对 $t$ 变量是局部的（local for $U$），故可把 $U$ 收缩，并找到拟凸 Reinhardt 域 $V\subset\mathbb{C}^n$ 使 $\Omega\subset U\times V$，且 $U\times V$ 落在 $\varphi$ 与 $\rho$ 的定义域内。
- 截断步（`main.tex:268`）：对区域 $U\times V$ 与函数 $\varphi_M:=\varphi+M\max\{\rho,0\}$ 套用命题 3.1。
- 极限步（`main.tex:269`）：令 $M\to+\infty$ 得到定理 1.2。

### 3.2 截断位势的中间式（本稿补写，非素材原式）

$\max\{\rho,0\}$ 为两个多重调和函数 $\rho$ 与常值 $0$ 之极大，故多重调和，从而 $\varphi_M=\varphi+M\max\{\rho,0\}$ 在 $U\times V$ 上多重调和并在 $\overline{U\times V}$ 上连续，命题 3.1 的两条前提（有界拟凸 Reinhardt 纤维 $V$、$\varphi_M$ 的 $T^n$-不变性）由 §3.1 的平均化步与 §4.1 的形状假设满足。按命题 3.1 得到的结论函数为

$$\varphi_M^*(t):=\inf_{z\in V}\bigl(\varphi(t,z)+M\max\{\rho(t,z),0\}\bigr),$$

它在 $U$ 上多重调和。对 $M_2\ge M_1$ 有 $\varphi_{M_2}\ge\varphi_{M_1}$，逐项取下确界给出 $\varphi_{M_2}^*(t)\ge\varphi_{M_1}^*(t)$，即 $\{\varphi_M^*\}_{M}$ 随 $M$ 单调上升。当 $\rho(t,z)\ge 0$ 时 $\varphi(t,z)+M\max\{\rho(t,z),0\}\to+\infty$，故 $M\to+\infty$ 时 $\varphi_M^*(t)$ 的下确界点被压进集合 $\{z\in V:\rho(t,z)\le0\}$，而由 $\Omega\subset U\times V$ 与 $\Omega=\{\rho<0\}$ 得 $\Omega_t=\{z\in V:\rho(t,z)<0\}$，于是

$$\sup_{M>0}\varphi_M^*(t)=\inf_{z\in\Omega_t}\varphi(t,z)=\varphi^*(t).$$

单调上升族取极限要保持多重调和性需再上一次半连续正则化，素材在 `main.tex:269` 一句 letting $M\to+\infty$（素材此处用自定义宏 `\ra`）里把这一步省略，本稿登记为取材薄读之处之一。§9.2 与 §12.3 讨论同一省略。

## 4 命题 3.1：乘积域情形（`prop:product case`）

### 4.1 命题陈述

`main.tex:167-175`（`prop:product case`）陈述为：设 $D\subset\mathbb{C}_z^n$ 为有界拟凸 Reinhardt 域，$U\subset\mathbb{C}_t^r$，$\varphi$ 是 $\Omega:=U\times D$ 上的多重调和函数且在闭包上连续，并设 $\varphi(t,\alpha z)=\varphi(t,z)$（$\alpha\in T^n$），则

$$\varphi^*(t):=\inf_{z\in D}\varphi(t,z)$$

在 $U$ 上多重调和。

### 4.2 Hilbert 空间与丛结构

`main.tex:181-186` 定义 $H^2(\Omega,m\varphi)=\{f\in\mathcal O(\Omega);\|f\|_m:=\int_\Omega|f|^2e^{-m\varphi}<\infty\}$，$H^2(\Omega,m\varphi)^I$ 是 $T^n$-不变子空间；定义 $E^m_t=H^2(D,m\varphi_t)^I$。

`main.tex:188-190` 设 $\tilde E^m=U\times H^2(\Omega,m\varphi)^I$ 与 $E^m=\coprod_{t\in U}H^2(D,m\varphi_t)^I$：前者是 $U$ 上平凡平坦全纯 Hermite 向量丛（无限秩），后者是 $U$ 上平凡全纯线丛。

### 4.3 商映射与诱导 Hermite 度量

`main.tex:191-198` 取 $E^m$ 的典范框架 $\mathbb{I}$：$\mathbb{I}|_{\Omega_t}$ 是常值 1 函数，全纯截面自然等同于 $U$ 上全纯函数。商映射 $\pi:\tilde E^m\to E^m$ 在纤维层面由 $\pi_t(f)=f|_{\Omega_t}$ 给出。

`main.tex:199` 由此诱导奇异 Hermite 度量

$$h_m(\mathbb{I}_t)=\inf\{\|f\|_m;f\in H^2(\Omega,m\varphi)^I,\;f|_{\Omega_t}\equiv 1\},$$

记 $h_m(\mathbb{I})=e^{-m\varphi_m}$。由 $\tilde E^m$ 平坦且 $E^m$ 为商丛，$h_m$ 的曲率是半正闭电流，故 $\varphi_m$ 对所有 $m$ 是 $U$ 上的次调和函数（`main.tex:203-205`）。

### 4.4 期望的极限

`main.tex:206` 提出目标：证 $\varphi_m$ 在某种意义下收敛到 $\varphi^*$，从而 $\varphi^*$（其上连续包络）为多重调和。

### 4.5 命题 3.1 假设链的逐行落点与 $r=1$ 化归

命题 3.1（`main.tex:167-175`）的假设按原文逐行：

- $D\subset\mathbb{C}_z^n$ 为有界拟凸 Reinhardt 域（`main.tex:168`）；
- $U\subset\mathbb{C}_t^r$ 为一域（`main.tex:168`，原文写作 `\mc_t^r` 形，未加拟凸或边界条件）；
- $\varphi$ 为 $\Omega:=U\times D$ 上的多重调和函数，且在 $\overline\Omega$ 上连续（continuous on the closure of $\Omega$，`main.tex:169-170`）；
- $\varphi(t,\alpha z)=\varphi(t,z)$ 对一切 $\alpha\in T^n$（`main.tex:171`）。

结论式：$$\varphi^*(t):=\inf_{z\in D}\varphi(t,z)$$ 在 $U$ 上多重调和（`main.tex:172-174`）。此处纤维已从 $\Omega_t$ 特化为固定乘积 $D$，故下确界号后不再出现 $t$ 依赖的区域。

证明首步（`main.tex:178-179`）：Since $\varphi^*$ is upper-semicontinuous, we can assume that $U$ is a planar domain. 该句把 $r$ 维参数域化归为 $r=1$ 的平面域。其机理是：多重调和等价于对每条复直线限制为次调和，而次调和性可用上半连续函数在圆盘上的均值不等式检验；$U$ 上的平面域检验一旦成立，高维参数方向按坐标圆盘重复即可。素材未展开该论证，本稿登记为薄读之处，后续 §5 全部估计都在 $r=1$（即 $U\subset\mathbb{C}$，$\Delta(t,r)$ 为圆盘）的前提下写出。

### 4.6 丛数据的全式重写

把 `main.tex:181-189` 的对象逐个写成公式（$m$ 为正整数）：

$$H^2(\Omega,m\varphi)=\{f\in\mathcal O(\Omega):\|f\|_m:=\textstyle\int_\Omega|f|^2e^{-m\varphi}<\infty\},$$

$H^2(\Omega,m\varphi)^I$ 为其中 $T^n$-不变子空间，即 $\{f\in H^2(\Omega,m\varphi)^I\}$ 中的元素满足 $f(t,\alpha z)=f(t,z)$（$\alpha\in T^n$）；纤维空间定义为 $E_t^m:=H^2(D,m\varphi_t)^I$（`main.tex:186`）。两个丛为

$$\tilde E^m=U\times H^2(\Omega,m\varphi)^I,\qquad E^m=\coprod_{t\in U}H^2(D,m\varphi_t)^I,$$

前者是 $U$ 上无限秩的平凡平坦全纯 Hermite 向量丛，后者是 $U$ 上平凡全纯线丛（`main.tex:188-190`）。典范框架 $\mathbb I$ 由限制条件 $\mathbb I|_{\Omega_t}\equiv 1$（$\Omega_t=\{t\}\times D$，$t\in U$）确定（`main.tex:191-192`），于是 $E^m$ 的全纯截面自然等同于 $U$ 上的全纯函数（`main.tex:193`）。

典范丛同态 $\pi:\tilde E^m\to E^m$ 在纤维层面为 $\pi_t:H^2(\Omega,m\varphi)^I\to E_t^m$，$\pi_t(f)=f|_{\Omega_t}$（`main.tex:195-196`）。`main.tex:197` 声明 $\pi$ 满（surjective），因此商诱导 $E^m$ 上的（奇异）Hermite 度量 $h_m$，其显式形为

$$h_m(\mathbb I_t)=\inf\{\|f\|_m: f\in H^2(\Omega,m\varphi)^I,\ f|_{\Omega_t}\equiv 1\}$$

（`main.tex:199`）。素材另引入两个度量记号：$h^*$ 为 $E:=E^1$ 上由 $h^*(\mathbb I)=e^{-\varphi^*}$ 给出的度量（`main.tex:201`），$h_m$ 的对数写法为 $h_m(\mathbb I)=e^{-m\varphi_m}$（`main.tex:202`），后者定义了整族逼近函数 $\{\varphi_m\}_{m\ge1}$。$h^*$ 与 $h_m$ 的关系正是本证明的目标：$\varphi_m$ 收敛到 $\varphi^*$ 等价于度量 $h_m^{1/m}$ 收敛到 $h^*$。素材未把这一等价写成式子，仅在 `main.tex:206` 以 We want to show that $\varphi_m$ converges to $\varphi^*$ in some sense as $m\rightarrow\infty$ 表述目标。

## 5 上下界估计（`eqn:h_m<` 与 `eqn:h_m>`）

### 5.1 上界（OT 引理的应用）

`main.tex:208-214`：固定 $t\in U$，取 $f\in H^2(\Omega,m\varphi)$ 使 $\|f\|_m$ 最小且 $f|_{\Omega_t}\equiv 1$。由极小元的唯一性与 $T^n$-不变性，$f\in H^2(\Omega,m\varphi)^I$。OT 引理给出

$$\int_\Omega |f|^2 e^{-m\varphi}\le C\int_{\Omega_t}e^{-m\varphi_z},$$

其中 $C$ 与 $m$、$t$ 无关。结合 $\varphi_m$ 定义得

$$-\varphi_m(t)=\tfrac{1}{m}\log\int_\Omega|f|^2e^{-m\varphi}\le\tfrac{1}{m}\log\int_{\Omega_t}e^{-m\varphi_t}+\tfrac{\log C}{m}.$$

这就是 `eqn:h_m<`（`main.tex:221-223`）。

### 5.2 下界（均值不等式）

`main.tex:225-239`：取 $r\ll 1$ 使 $\varphi(t',z)\le\varphi(t,z)+\epsilon$（$|t-t'|<r$），对 $|f|$ 在 $\Delta(t,r)\times D$ 上应用均值不等式：

$$\int_\Omega|f|^2e^{-m\varphi}\ge\int_{\Delta(t,r)\times D}|f|^2e^{-m\varphi}\ge\int_D\Bigl(\int_{\Delta(t,r)}|f(\tau,z)|^2d\mu_\tau\Bigr)e^{-m(\varphi_z+\epsilon)}d\mu_z\ge \pi r^2\int_D e^{-m(\varphi_t+\epsilon)}.$$

即 `eqn:h_m>`

$$-\varphi_m(t)\ge\tfrac{1}{m}\log\int_D e^{-m(\varphi_t+\epsilon)}+\tfrac{\log\pi r^2}{m}.$$

### 5.3 双向夹逼与收敛

`main.tex:241-247` 把上界与下界并列写成

$$-\tfrac{1}{m}\log\int_D e^{-m\varphi_t}-\tfrac{\log C}{m}\le\varphi_m\le -\tfrac{1}{m}\log\int_D e^{-m(\varphi_t+\epsilon)}-\tfrac{\log\pi r^2}{m}.$$

记 `eqn:bi-inequality`。当 $m\to\infty$ 时 $-(\log C)/m$、$-(\log\pi r^2)/m$ 都收敛到 0，左端与右端均趋于 $\varphi^*$（按 $\epsilon$-修正），从而 $\varphi_m$ 在 $\Delta$ 上逐点收敛到 $\varphi^*$。

### 5.4 上连续包络与最终一致收敛

`main.tex:249-255`：定义 $\tilde\varphi_m$ 为 $\sup_{j\ge m}\varphi_j$ 的上连续包络，记 $\tilde\varphi^*$ 为 $\tilde\varphi_m$ 的极限。$\tilde\varphi^*$ 多重调和，故只须证 $\varphi^*=\tilde\varphi^*$。

- 上半：`eqn:bi-inequality` 首项立刻给出 $\tilde\varphi^*\ge\varphi^*$。
- 下半：`main.tex:252-255` 利用 $\varphi$ 在 $\overline\Omega$ 上一致连续，使 `eqn:bi-inequality` 右端在 $U$ 上一致收敛到 $\varphi^*+\epsilon$；取 $m$ 足够大时 $\tilde\varphi^*\le\varphi^*+2\epsilon$，再令 $\epsilon\to 0$ 得 $\tilde\varphi^*\le\varphi^*$。

故 $\varphi^*=\tilde\varphi^*$，$\varphi^*$ 是多重调和的。这完成 `prop:product case` 的证明。

### 5.5 上界链的逐式（`main.tex:208-223`）

证明在这一段固定 $t\in U$，取 $\|f\|_m$ 的极小元。三行中间式按素材顺序抄出：

- 极小性条件（`main.tex:208-209`）：$f\in H^2(\Omega,m\varphi)$ 满足 $\|f\|_m=\inf\{g\in H^2(\Omega,m\varphi):g|_{\Omega_t}\equiv 1\}$，即 $f|_{\Omega_t}\equiv 1$ 且范数取到 `main.tex:199` 的下确界。
- 不变性收紧（`main.tex:210-211`）：由极小元唯一与 $\varphi$ 的 $T^n$-不变性得 $f\in H^2(\Omega,m\varphi)^I$。素材把唯一性理由留给 Hilbert 空间严格凸性，正文未写。
- OT 估计（`main.tex:212-213`）：$\int_\Omega|f|^2e^{-m\varphi}\le C\int_{\Omega_t}e^{-m\varphi_z}$，$C$ 与 $m$、$t$ 无关（`main.tex:214`）。

把定义式与估计式并列（`main.tex:216-219` 的不编号公式与 `main.tex:221-223` 的编号公式）：

$$-\varphi_m(t)=\frac{1}{m}\log\left(\int_\Omega|f|^2e^{-m\varphi}\right),$$

$$-\varphi_m(t)\le\frac{1}{m}\log\left(\int_{\Omega_t}e^{-m\varphi_t}\right)+\frac{\log C}{m}.$$

该式即素材编号式 `eqn:h_m<`，位置为 `main.tex:221-223`。上一段里与它并列的定义式位于 `main.tex:217-219`，在素材中是不编号环境 `equation*`，故本稿只以文字指代、不抄 `\label`。

第一式的来源是 §4.6 的两条定义 $h_m(\mathbb I_t)=e^{-m\varphi_m(t)}$ 与 $h_m(\mathbb I_t)=\|f\|_m^2$ 的对照：由 $h_m(\mathbb I_t)=\|f\|_m^2=\int_\Omega|f|^2e^{-m\varphi}$ 取 $\frac{1}{m}\log$ 并比较 $e^{-m\varphi_m}$ 即得。素材在 `main.tex:216-219` 写作 By definition 一步到位，未写这条对照，本稿在此补出中间式并标注为读法。

### 5.6 下界链的逐式（`main.tex:225-240`）

先固定 $\epsilon$ 与半径。原文（`main.tex:226-227`）：对任意 $\epsilon>0$，存在与 $z$ 无关的 $0<r\ll1$，使 $|t-t'|<r$ 时 $\varphi(t',z)\le\varphi(t,z)+\epsilon$ 对一切 $(t',z)\in\Omega$ 成立。

均值不等式一步（`main.tex:227` 只写 By mean value inequality，本稿补出其标准形）：对每个固定 $z\in D$，$\tau\mapsto|f(\tau,z)|^2$ 次调和，故 $|f(t,z)|^2\le\frac{1}{\pi r^2}\int_{\Delta(t,r)}|f(\tau,z)|^2d\mu_\tau$。把它乘上 $e^{-m\varphi}$ 后在 $\Delta(t,r)\times D$ 积分，链式四步逐字照 `main.tex:228-235`：

$$\int_\Omega|f|^2e^{-m\varphi}\ \ge\ \int_{\Delta(t,r)\times D}|f|^2e^{-m\varphi}\ \ge\ \int_D\left(\int_{\Delta(t,r)}|f(\tau,z)|^2d\mu_\tau\right)e^{-m(\varphi_z+\epsilon)}d\mu_z\ \ge\ \pi r^2\int_D e^{-m(\varphi_z+\epsilon)}.$$

第二号的来源是把 $\Delta(t,r)$ 上的均值不等式反向用：被积函数在 $\Delta(t,r)\times D$ 上不小于 $\pi r^2|f(t,z)|^2$ 形的点态下界，权再按 $\varphi(t',z)\le\varphi(t,z)+\epsilon$ 换成 $e^{-m(\varphi_z+\epsilon)}$。末号的来源是对 $\tau$ 积分后只剩 $\pi r^2|f(t,z)|^2$，再用 $f(t,z)$ 在 $\Omega_t=\{t\}\times D$ 上恒为 $1$ 消去 $|f|^2$。素材在 `main.tex:236` 给出记号 $\Delta(t,r)=\{\tau\in\mathbb C:|\tau-t|<r\}$，并说明 $d\mu_\tau$、$d\mu_z$ 分别为 $U$ 与 $D$ 上的 Lebesgue 测度。

结论式（`main.tex:238-240`，即 `eqn:h_m>`）：

$$-\varphi_m(t)\ge\frac{1}{m}\log\left(\int_D e^{-m(\varphi_t+\epsilon)}\right)+\frac{\log\pi r^2}{m}.$$

### 5.7 双向夹逼式的逐字形与素材笔误登记

`main.tex:241-246` 把 `eqn:h_m<` 与 `eqn:h_m>` 合并（原文用 Combing，素材逐字如此）：

$$-\frac{1}{m}\log\left(\int_D e^{-m\varphi_t}\right)-\frac{\log C}{m}\le\varphi_m\le-\frac{1}{m}\log\left(\int_D e^{-m(\varphi_t+\epsilon)}\right)-\frac{\log\pi r^2}{m}.$$

两处需要登记的细节：

- 该式在素材里对 $\varphi_m$ 未写自变量，即写作 $\varphi_m$，不带自变量 $(t)$，而 `eqn:h_m<`、`eqn:h_m>` 都带 $(t)$；本稿按带自变量读。
- `main.tex:247` 的结论句逐字为 which implies $\varphi_m$ converges to $\varphi$ pointwise on $\Delta$，出现的是 $\varphi$（不带星号）与 $\Delta$（不带 $U$）。按上下文与 `main.tex:206` 的目标句，此处应为 $\varphi^*$ 与 $U$。本稿按素材逐字登记该处笔误，并在 §5.8 用 $\varphi^*$ 与 $U$ 写极限式。

### 5.8 对数 Laplace 渐近这一步（素材未写，本稿补出中间式）

夹逼式两端在 $m\to\infty$ 下的行为由两条误差与一条主项决定。误差项：

$$\lim_{m\to\infty}\frac{\log C}{m}=0,\qquad \lim_{m\to\infty}\frac{\log\pi r^2}{m}=0,$$

其中 $\log\pi r^2<0$（$r\ll1$），故 $-\frac{\log\pi r^2}{m}>0$ 且随 $m$ 消失；$\log C$ 的符号素材未给，仅按绝对值被 $m$ 吃掉来读。主项：对有界区域 $D$ 与在 $\overline D$ 上连续的 $\varphi_t$，

$$\lim_{m\to\infty}\left(-\frac{1}{m}\log\int_D e^{-m\varphi_t(z)}d\mu_z\right)=\inf_{z\in D}\varphi_t(z)=\varphi^*(t),$$

即 $-\frac1m\log$ 的 $L^m$ 型对数平均收敛到 $L^\infty$ 下确界。把 $\varphi_t$ 换成 $\varphi_t+\epsilon$ 时该极限为 $\varphi^*(t)+\epsilon$。于是夹逼式给出逐点极限 $\lim_{m\to\infty}\varphi_m(t)=\varphi^*(t)$ 与不等式 $\varphi^*(t)\le\liminf_m\varphi_m(t)$、$\limsup_m\varphi_m(t)\le\varphi^*(t)+\epsilon$，再由 $\epsilon$ 任意取到极限。素材把这一整步并入 `main.tex:247` 的一句，未写出上面三条式子，本稿登记为读法并给到公式级。

## 6 商的 Hermite 度量与丛曲率

### 8.1 平坦父丛与商丛

把 $\tilde E^m=U\times H^2(\Omega,m\varphi)^I$ 视作标准平坦丛。平坦意味着其上典范 Hermite 度量（在基点上取 $L^2$ 范数）的曲率为零。当 $E^m$ 由 $\pi$ 商映射诱导时，$E^m$ 上的 Hermite 度量 $h_m$ 通过"母丛极小"得到：

$$h_m(\mathbb{I}_t)=\inf\{\|f\|_m;f\in H^2(\Omega,m\varphi)^I,\;f|_{\Omega_t}\equiv 1\}.$$

这是奇异 Hermite 度量，但能给出定义良好的曲率电流。

### 8.2 曲率半正与 $\varphi_m$ 次调和

`main.tex:203-205`：由于 $\tilde E^m$ 平坦、商映射 $\pi$ 全纯，$(E^m,h_m)$ 的曲率电流 $-\partial\overline{\partial}\log h_m$ 为半正闭电流。即 $-\partial\overline{\partial}(-m\varphi_m)\ge 0$，等价于 $\varphi_m$ 在 $U$ 上次调和。由于 $U\subset\mathbb{C}^r$ 且为拟凸平面域（取 $\delta=r=1$ 时），$\varphi_m$ 对所有 $m$ 是次调和函数。

### 8.3 极小元的内蕴刻画

`main.tex:208-211`：对每个 $t$，$f$ 取的是 $\|f\|_m$ 的极小元且 $f|_{\Omega_t}\equiv 1$。极小元的唯一性来自 Hilbert 空间严格凸性。由 $T^n$-不变性，$\|f\|_m$ 在 $T^n$ 等距映射下不变，极小元也自动不变。这把 OT 引理所需的 $f\in H^2(\Omega,m\varphi)$ 收紧到 $f\in H^2(\Omega,m\varphi)^I$。

### 6.4 曲率电流的公式级写法与 `main.tex:203-205` 的变量笔误

由 §4.6 的 $h_m(\mathbb I)=e^{-m\varphi_m}$ 得 $\log h_m(\mathbb I)=-m\varphi_m$，于是 $(E^m,h_m)$ 的曲率电流在典范框架上为

$$\Theta(E^m,h_m)=-\partial\overline{\partial}\log h_m(\mathbb I)=m\,\partial\overline{\partial}\varphi_m,$$

素材 `main.tex:203-204` 声明该电流半正闭（semipositive curvature current），依据是 $\tilde E^m$ 平坦（曲率为 $0$）而 $(E^m,h_m)$ 是其全纯商丛：全纯满射在 $L^2$ 极小元度量下降低曲率，故商丛曲率不小于一 $0$，此为 Demailly 关于商度量曲率的标准事实，素材未证。半正性即

$$\partial\overline{\partial}\varphi_m\ge0\ \text{在}\ \mathcal D'(U),$$

而 $\partial\overline{\partial}u\ge0$ 在分布意义下与 $u$ 次调和等价，故 `main.tex:205` 得 $\varphi_m$ 在 $U$ 上次调和，对一切 $m\ge1$。该句素材逐字写作 hence $\varphi_m(z)$ is a subharmonic function on $U$ for all $m$，自变量写作 $z$，而本证明自 $r=1$ 化归后 $U\subset\mathbb{C}_t$ 上的函数自变量应为 $t$（`main.tex:216-223` 的 $\varphi_m(t)$ 即为证）。本稿登记此处变量笔误，按 $\varphi_m(t)$ 读。

### 5.9 上连续包络与一致收敛的最终两式（`main.tex:249-255`）

记 $\{\varphi_j\}_{j\ge m}$ 的上确界族与它的上连续包络：

$$\psi_m(t):=\sup_{j\ge m}\varphi_j(t),\qquad \tilde\varphi_m(t):=\psi_m^*(t):=\lim_{\rho\to0^+}\ \sup_{|\tau-t|<\rho}\psi_m(\tau),$$

第二个极限式为上连续包络的标准定义，素材在 `main.tex:249` 只用 the upper semicontinuous envelope of $\sup_{j\geq m}\varphi_j$ 一语指代，未写出 $\rho\to0^+$ 的上确界式，本稿补出并登记为读法。$\tilde\varphi^*$ 定义为

$$\tilde\varphi^*(t):=\lim_{m\to\infty}\tilde\varphi_m(t)=\sup_{m\ge1}\tilde\varphi_m(t),$$

因 $\psi_m$ 随 $m$ 单调下降（下标集合 $\{j\ge m\}$ 缩小），$\tilde\varphi_m$ 亦单调下降，其极限即上确界；单调下降的上连续函数族的极限的上连续包络仍多重调和，素材 `main.tex:250` 直接断言 Then $\tilde\varphi^*$ is plurisubharmonic 并把该正则化事实作为已知。

余下的就是证明 $\varphi^*=\tilde\varphi^*$ 的两个不等式（`main.tex:250-255`）：

- 上半（`main.tex:251`）：由 `eqn:bi-inequality` 左端 $-\frac{1}{m}\log\int_D e^{-m\varphi_t}-\frac{\log C}{m}\le\varphi_m$ 与 §5.8 的 $\lim_{m}\bigl(-\frac{1}{m}\log\int_D e^{-m\varphi_t}\bigr)=\varphi^*(t)$，取上确界与包络得 $\tilde\varphi^*\ge\varphi^*$。
- 下半（`main.tex:252-255`）：$\varphi$ 在 $\overline\Omega$ 上一致连续，故对固定 $\epsilon$ 可选到与 $t$ 无关的 $r$，使 `eqn:bi-inequality` 右端 $-\frac{1}{m}\log\int_D e^{-m(\varphi_t+\epsilon)}-\frac{\log\pi r^2}{m}$ 在 $U$ 上一致收敛到 $\varphi^*+\epsilon$（`main.tex:253` 逐字：the last term in（素材指向前面的双向夹逼式）converges uniformly on $U$ to $\varphi^*+\epsilon$ as $m\to\infty$，其中素材把左端误标为 last term，按式形应为右端项）。于是 $m$ 足够大时 $\tilde\varphi^*\le\varphi^*+2\epsilon$（`main.tex:254`），$\epsilon$ 任意（`main.tex:255`）给出 $\tilde\varphi^*\le\varphi^*$。

两式合起来 $\varphi^*=\tilde\varphi^*$，$\varphi^*$ 多重调和，`main.tex:256` 结束 `prop:product case` 的 proof 环境。此处 $2\epsilon$ 的来源是 $|\varphi_m-(\varphi^*+\epsilon)|$ 型的逼近误差与 $\frac{\log\pi r^2}{m}$ 误差之和被同一个 $\epsilon$ 上界吸收，素材未拆分，本稿登记为薄读之处。

## 7 OT 引理在本稿中的作用机制

### 9.1 与一般 OT 的差异

经典 OT 引理要求把全纯函数从 $\Omega$ 的一个"测度小"的子集上拓展出去。本稿用法略有不同：`main.tex:158-162` 把 $\Omega_t$（高维纤维）作为"源"，把 $f$ 拓展到全 $\Omega$。这条用法是 Manivel、Ohsawa、Takegoshi 与 B\l{}ocki–Lempert 一系工作中"高维拓展型 OT"的代表。

### 9.2 常数 $C$ 的选取

`main.tex:160-161` 写明 $C$ 与 $\varphi$、$t$、$f$ 无关；这一无关性是 OT 引理的核心结论（与权重有界性 + 拟凸紧性结合得到）。在本稿中，`eqn:h_m<` 把 $\log C/m$ 当成对 $\varphi_m$ 的固定扰动，常数 $C$ 并不显式给出数值，仅作为 $m\to\infty$ 极限下的渐近常数。

### 9.3 OT 与均值不等式的对偶

`eqn:h_m<` 用 OT 在 $\Omega$ 方向"扩"，`eqn:h_m>` 用均值不等式在 $\Delta(t,r)\subset U$ 方向"缩"。这种"OT 给上、均值给下"的对偶是本稿骨架的核心，OT 给出 $h_m$ 的"扩张"估计，均值不等式给出"收缩"估计。两条估计在 $m\to\infty$ 极限下均化为 $\varphi^*$。

## 8 一致连续性与极限收敛

### 10.1 $\varphi$ 一致连续的角色

`main.tex:226` 与 `main.tex:252-253`：在均值不等式与最终夹逼中均用到 $\varphi$ 的（一致）连续性。具体地：

- 均值不等式用 $r\ll 1$ 时 $\varphi(t',z)\le\varphi(t,z)+\epsilon$ 把权重移到 $t$；
- 极限论证用 $\varphi$ 在 $\overline\Omega$ 上的一致连续性把 $\epsilon$ 收敛控制成"对所有 $t$ 一致"。

### 10.2 双向不等式的统一形式

`eqn:bi-inequality` 是本稿的核心数学公式。两侧都以 $-1/m$ 的对数形式呈现，几何意义是"取下确界"被 $-1/m\cdot\log$ 的指数型平均所逼近。这是 Demailly 关于多重子调和函数 Bergman 核逼近定理的纤维化版本。

### 10.3 与 Prekopa 型公式的比较

把 `eqn:bi-inequality` 与 Berndtsson 的 Prekopa 型不等式对照：

- Berndtsson 给出 $\int e^{-\varphi^*}$ 的一组下界；
- 本稿给出 $\varphi^*$ 在 $-\log$ 形式下的双向夹逼。

两条路线在 $\varphi^*$ 处的极限相同，但本稿不需 Prekopa 型不等式作输入。

## 9 闭包的取法与 $\max\{\rho,0\}$ 截断

### 12.1 截断函数 $\varphi+M\max\{\rho,0\}$

`main.tex:268` 引入的 $\varphi+M\max\{\rho,0\}$ 把 $\varphi$ 从 $U\times V$ 推到 $U\times V$ 外为 $\infty$，从而强制 OT 引理只在 $U\times V$ 上用。这是把"任意 $\Omega$ 化归乘积域"的关键技巧：$M$ 控制代价、$M\to\infty$ 强制只在 $\Omega$ 内部有效。

### 12.2 极限交换的合法性

$\varphi^*$ 的多重单调性要求 $\varphi^*$ 与 $\varphi$ 在极限过程中保持上半连续。当 $M\to\infty$ 时，$\varphi+M\max\{\rho,0\}$ 逐点上确界地趋向 $\varphi+\infty\cdot 1_{\{\rho\ge 0\}}$，即在 $\Omega$ 内部等于 $\varphi$，在外部为 $\infty$。由多重子调和函数族的下半连续包络定理，上半连续包络取多重子调和。

### 12.3 与 $\varphi^*$ 的极限关系

命题 `prop:product case` 的结论对每个 $M$ 给出 $\varphi^*_M(t)=\inf_{z\in V}(\varphi(t,z)+M\max\{\rho(t,z),0\})$ 多重子调和。当 $M\to\infty$ 时，$\varphi^*_M$ 单调下降地收敛到 $\varphi^*(t)=\inf_{z\in\Omega_t}\varphi(t,z)$，极限仍是多重子调和。

## 10 抽象紧 Lie 群版本的独立性

### 13.1 抽象版本的成立路径

`main.tex:131-134` 提到 Reinhardt 情形的论证可推广到 Deng–Zhang–Zhou 2014、2017 考虑的更一般框架。具体路径是：把 $T^n$ 换成保持 Lebesgue 测度的紧 Lie 群 $K$；当 $K$-不变全纯函数在 $\Omega_t$ 上为常数时，$K$-平均化 $T^n$ 同伦仍可做 OT 引理。

### 13.2 条件 (a)–(d) 的最小性

四个条件中：

- (a) 保测度 → OT 引理所需的测度论条件；
- (b) 纤维不变 → $K$-平均化在纤维上封闭；
- (c) 不变全纯函数常数 → $K$-平均化给出与 $T^n$ 等价的"对位结构"；
- (d) $\varphi$ 不变 → 使 $\varphi^*$ 在 $K$ 平均下不变。

条件 (c) 是把 Reinhardt 域的 $T^n$-等距性升级到任意紧 Lie 群的关键。

### 13.3 公开问题的延拓

`main.tex:137-140` 在引言末尾提示一条自然推广：把 Demailly 的"从离散点拓展"换成"从正维子流形拓展"，并指出本稿是这条思路的第一个具体成果。本 C 稿对这条延拓本身的分析不展开，仅在 §1.3、§13.1 简述。

## 11 单位分解与 $\varphi$ 连续性的依赖

### 14.1 上半连续包络与多重子调和性

`main.tex:178`：$\varphi^*$ 本身只上半连续，并不自动多重子调和。把 $\varphi_m$ 的极限 $\tilde\varphi_m=\text{usc}(\sup_{j\ge m}\varphi_j)$ 取其上连续包络后再取极限得到的 $\tilde\varphi^*$ 才多重子调和。这是多重子调和函数族在一致收敛意义下的标准提升。

### 14.2 $\varphi_m$ 极限的两步走

极限过程分两步：

- 步骤一：`main.tex:241-247` 用 `eqn:bi-inequality` 给 $\varphi_m\to\varphi^*$（逐点）；
- 步骤二：`main.tex:249-255` 把 $\varphi_m$ 升级到上连续包络族，再逐点上确界取极限。

两步走让最终极限在保留多重子调和性的同时，逐点等于 $\varphi^*$。

### 14.3 与"$\varphi$ 闭包连续"的关系

`main.tex:170`（命题假设）需要 $\varphi$ 在 $\overline\Omega$ 上连续。这一连续条件是均值不等式与双向夹逼的统一前提：均值不等式要求 $\varphi$ 在小盘上一致收敛，连续给出这一收敛；`eqn:bi-inequality` 右端的一致收敛性也用到该条件。

## 12 与其它代表性多重子调和技术的交叉

### 15.1 与 Siu 引理的关系

OT 引理是 Siu 引理关于 $L^2$ 拓展方向的细化版本。Siu 引理本身给出 $\Omega$ 上正常值全纯函数的拓展，OT 在 $L^2$ 权下细化 Siu。本稿把 OT 用作"$\Omega_t$ 上的全纯函数 → $\Omega$ 上的全纯函数"的高维拓展，这是 Siu 引理典型的应用方向。

### 15.2 与 Skoda 引理的关系

Skoda 引理给出 $\Omega$ 上有界全纯函数空间 $H^\infty(\Omega)$ 与 $L^2$ 加权空间的关联。本稿不显式用 Skoda 引理，但商丛 $E^m$ 的"$\|f\|_m$ 极小元"方法可视为 Skoda 的 $L^2$ 极小元技巧的纤维化版本。

### 15.3 与 Demailly 核逼近的关系

`main.tex:131-135` 与 `main.tex:206` 把本证明归到 Demailly 关于 Bergman 核逼近多重子调和函数的纲领（Demailly 1992, J. Algebraic Geom.）。区别在于：

- Demailly 把 $\varphi$ 视作 $\Omega$ 上的函数并由 Bergman 核逼近；
- 本稿把 $\varphi^*$ 视作 $U$ 上的函数并由 $\varphi_m$ 逼近。

两者均依赖 OT 引理 + Bergman 核权重。

## 13 注释与文献

- `main.tex:281` Berndtsson 1998：Prekopa's theorem and Kiselman's minimum principle for plurisubharmonic functions, Math. Ann. 312, 785-792.
- `main.tex:283-285` Demailly 1992：Regularization of closed positive currents and intersection theory, J. Algebraic Geom. 1(3), 361-409.
- `main.tex:286` DWZZ 2018 preprint：New characterization of plurisubharmonic functions and positivity of direct image sheaves.
- `main.tex:287` Deng–Zhang–Zhou 2014：Positivity of direct images of positively curved volume forms, Math. Z. 278, 347-362.
- `main.tex:288` Deng–Zhang–Zhou 2017：Positivity of character subbundles and minimum principle for noncompact group actions, Math. Z. 286, 431-442.
- `main.tex:289` Kiselman 1978：The partial Legendre transformation for plurisubharmonic functions, Invent. Math. 49(2), 137-148.
- `main.tex:292-295` Ohsawa–Takegoshi 1987：On the extension of $L^2$ holomorphic functions, Math. Z. 195(2), 197-204.

`main.tex:147-148` 致谢：作者受 NSFC 资助。

## 14 证明工艺的总览

### 17.1 三层夹逼结构

把本命题（`prop:product case`）的论证组织成三层夹逼：

- 第一层：OT 给出的 `eqn:h_m<` 把 $\varphi_m$ 控制到 $-\frac{1}{m}\log\int e^{-m\varphi_t}$ 上方；
- 第二层：均值不等式给出的 `eqn:h_m>` 把 $\varphi_m$ 控制到 $-\frac{1}{m}\log\int e^{-m(\varphi_t+\epsilon)}$ 下方；
- 第三层：$\epsilon$ 在 $\varphi$ 一致连续下"对所有 $t$ 一致地"被夹到 0，最终极限为 $\varphi^*$。

### 17.2 与多重子调和闭包的兼容性

三层夹逼与多重子调和的上连续包络兼容：从 $\varphi_m$ 到 $\tilde\varphi_m$ 再到 $\tilde\varphi^*$，每一步均保持多重子调和性。最终的等式 $\varphi^*=\tilde\varphi^*$ 把"逐点极限"与"多重子调和闭包"两类极限对齐。

### 17.3 整张论证的依赖图

依赖图自上而下：

- 输入层：拟凸 $\Omega$、Reinhardt 纤维、$\varphi$ 在 $\overline\Omega$ 上连续、$\varphi$ 在 $T^n$ 下不变；
- 工具层：OT 引理（`lem:OT`）、均值不等式、$\varphi$ 的一致连续性；
- 夹逼层：`eqn:h_m<`、`eqn:h_m>` 合成 `eqn:bi-inequality`；
- 极限层：$\varphi_m\to\varphi^*$ 与上连续包络 $\tilde\varphi^*$；
- 输出层：`prop:product case`（乘积情形）、`thm-intr:Reinhardt case`（Reinhardt 情形）、`thm-intr:main`（紧 Lie 群情形）。

`thm-intr:Reinhardt case` 由 `prop:product case` 加截断 $\varphi+M\max\{\rho,0\}$ 与 $M\to\infty$ 推得；`thm-intr:main` 由 Reinhardt 情形经指数映射推得。

## 15 与本语料的接缝

- D305（bib key `DWZZ2018`）与 D471（bib key `DengWangZhangZhou2018`）均以本 arXiv:1810.12733 为同一作者群 DWZZ 关于多重子调和函数 Bergman 核刻画的代表证言。语料稿中调用本 C 稿的位置串与回引方向由本体侧执行，本 C 稿不直接修改 D305/D471。
- 在 C 稿中读到的关键记号映射如下，便于回引：
  - $\varphi$ ， 多重子调和函数（多重调和函数）；
  - $\Omega_t:=p^{-1}(t)$ ， 纤维；
  - $\varphi^*(t):=\inf_{z\in\Omega_t}\varphi(t,z)$ ， 纤维下确界；
  - $H^2(\Omega,m\varphi)^I$ ， $T^n$-不变、$L^2$ 加权 $e^{-m\varphi}$ 的全纯 Hilbert 空间；
  - $h_m(\mathbb I)=e^{-m\varphi_m}$ ， 商丛的奇异 Hermite 度量；
  - `eqn:h_m<`、`eqn:h_m>`、`eqn:bi-inequality` ， OT 上界与均值下界的夹逼式。
- 复用本 C 稿时优先指向 `main.tex:115-129`（紧 Lie 群版本）与 `main.tex:154-162`（OT 引理）。两处都是语料里"以多重子调和器为权"型论证的标准调用点。
- 二次引用语境：D305 关注 Bergman 核逼近刻画，D471 关注"权重 + 极限"机制。两稿调用 `prop:product case` 与 `eqn:bi-inequality` 时，本 C 稿都给出"OT 给上、均值给下"的双向夹逼链条；调用 `thm-intr:main`（紧 Lie 群版本）时，本 C 稿已把 (a)–(d) 展开。
- 复用本 C 稿时优先指向 `main.tex:115-129`（紧 Lie 群版本）与 `main.tex:154-162`（OT 引理）。两处都是语料里"以多重子调和器为权"型论证的标准调用点。
- 二次引用语境：D305 关注 Bergman 核逼近刻画，D471 关注"权重 + 极限"机制。两稿调用 `prop:product case` 与 `eqn:bi-inequality` 时，本 C 稿都给出"OT 给上、均值给下"的双向夹逼链条；调用 `thm-intr:main`（紧 Lie 群版本）时，本 C 稿已把 (a)–(d) 展开。

- D305（bib key `DWZZ2018`）与 D471（bib key `DengWangZhangZhou2018`）均以本 arXiv:1810.12733 为同一作者群 DWZZ 关于多重子调和函数 Bergman 核刻画的代表证言。语料稿中调用本 C 稿的位置串与回引方向由本体侧执行，本 C 稿不直接修改 D305/D471。
- 在 C 稿中读到的关键记号映射如下，便于回引：
  - $\varphi$ ， 多重子调和函数（多重调和函数）；
  - $\Omega_t:=p^{-1}(t)$ ， 纤维；
  - $\varphi^*(t):=\inf_{z\in\Omega_t}\varphi(t,z)$ ， 纤维下确界；
  - $H^2(\Omega,m\varphi)^I$ ， $T^n$-不变、$L^2$ 加权 $e^{-m\varphi}$ 的全纯 Hilbert 空间；
  - $h_m(\mathbb I)=e^{-m\varphi_m}$ ， 商丛的奇异 Hermite 度量；
  - `eqn:h_m<`、`eqn:h_m>`、`eqn:bi-inequality` ， OT 上界与均值下界的夹逼式。
- 复用本 C 稿时优先指向 `main.tex:115-129`（紧 Lie 群版本）与 `main.tex:154-162`（OT 引理）。两处都是语料里"以多重子调和器为权"型论证的标准调用点。