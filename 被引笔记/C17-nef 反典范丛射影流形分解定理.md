# C17 nef 反典范丛射影流形分解定理（arXiv:1706.08814）

## 0 取证边界

- arXiv id：1706.08814
- 原题名（逐字）：A decomposition theorem for projective manifolds with nef anticanonical bundle
- 作者（逐字，API 署名）：Junyan Cao, Andreas Höring
- 发表年月：2017-06-27
- 素材目录：`E:\math\被引素材/1706.08814`
- 主 tex 清单（实测，路径以盘面为准）：
  - `被引素材/1706.08814/main.tex`（101111 字节 / 2048 行）
- 本语料引用它的稿号与 bib key（你只在 §0 原样登记，不去读这些稿）：D385（bib key `CaoHoring`）；D447（bib key `CaoHoring`）；D471（bib key `CaoHoring`）
- 取材薄读之处：本稿正文（main.tex）单文件源；preamble 之 `\bP`/`\cC`/`\Cal`-族定义在 `main.tex:127-152`（`\sA, \sB, \sE, ...`/`\bR, \bZ, \bC, \bQ`）与 `main.tex:228-360`（重定义 `\r`、`\c`、`\o`、`\p` 等）；它们进入正文时需按族展开为 `\mathbb`/`\mathcal`/`\operatorname`；附录 Lelong 估计（Lemmas `approx`、`lelongnumcont`）在 `main.tex:1749-1837`。

## 1 主定理与猜想背景

### 1.1 猜想 Conjecture `newcon`

`main.tex:401-409` 给出 Beauville-Bogomolov 分解定理的 nef 反典范类类比（`\mathbb{C}^q`、Calabi-Yau 流形 $Y_j$、hyperkähler 流形 $S_k$、有理连通流形 $Z$ 之乘积）：

> **Conjecture 1.1**（`main.tex:401`，记号 `newcon`） 设 $X$ 为紧 Kähler 流形且 $-K_X$ 在数值意义下 nef。则其万有覆盖 $\widetilde X$ 分解为
> $$\widetilde X\simeq\mathbb{C}^q\times\prod Y_j\times\prod S_k\times Z,$$
> 其中 $Y_j$ 不可约 Calabi-Yau、$S_k$ 不可约 hyperkähler、$Z$ 有理连通。

`main.tex:411-413` 列出已证得情形：$T_X$ nef 之 `CP91, DPS94`；$-K_X$ Hermite 半正之 `DPS96, CDP15`；一般纤维为弱 Fano 之 `CH17`。本文主攻 $X$ 为射影且 $\pi_1(X)=1$ 之情形（`main.tex:415`）。

### 1.2 主定理 Theorem `theoremmain` 与 Corollary

`main.tex:421-424`：

> **Theorem 1.2**（`main.tex:421`，`theoremmain`） 设 $X$ 为射影流形、$-K_X$ nef、$\pi_1(X)=1$。则 $X\simeq Y\times F$，其中 $K_Y\sim 0$ 且 $F$ 有理连通。

`main.tex:426-430` 由 `Cao16` Cor.1.4 推出 Conjecture `newcon`（`main.tex:428-430`）：

> **Corollary 1.3**（`main.tex:428`） Conjecture `newcon` 对射影流形成立。

### 1.3 Theorem `theoremMRC`（MRC-纤维化结构）

`main.tex:434-440`：

> **Theorem 1.4**（`main.tex:434`，`theoremMRC`） 设 $X$ 为射影流形、$-K_X$ nef。则存在局部平凡纤维化 $X\to Y$ 使纤维 $F$ 有理连通且 $K_Y\equiv 0$。

`main.tex:442-443` 记录三阶情形的 Mori 理论 + 显式计算已知（`BP04`），但一般 Kähler 情形仍开放。

### 1.4 策略与文献归位

`main.tex:446-480` 给出本文章的总策略与文章骨架：Qi Zhang `Zha05` 给 MRC 纤维化之底有 Kodaira 维数零；技术与 Albanese 情形 `Cao16` 不同之处在于 MRC 纤维化不必为全纯映射，所以要用"几乎全纯"映射 $X$ 在 Chow 空间 $\mathord{\mathcal{C}(X)}$ 取极一般纤维对应之不可约分支 $Y$（`main.tex:448-455`），normalization 给出通用族 $X'\to Y$，再取奇点解消 $\Gamma\to X'$ 得 $\pi\colon\Gamma\to X$、$\varphi\colon\Gamma\to Y$；技术核心是对充分 ample $A$、$L=\pi^\star A$、正整数 $p,m$、$E$ 为 $\pi$-例外主部，研究直接像
$$\mathcal V_p:=\varphi_\star\!\big(\mathcal O_\Gamma(pL+pmE-p\tfrac 1r\varphi^\star\det\varphi_\star(\mathcal O_\Gamma(L+mE)))\big),$$
$r=\rank\varphi_\star(\mathcal O_\Gamma(L+mE))$。要证（`main.tex:458-465`）：对充分大 $m$、充分整除 $p$，$\mathcal V_p$ 是某开集 $Y_0\subset Y$（参见 Setup `setup`）上的平凡向量丛。`main.tex:465-469` 据 `DPS94` 回追法给出 $\varphi^{-1}(Y_0)\dashrightarrow Y_0\times F$ 双有理分裂；`main.tex:472-476` 给出 $T_X$ 切丛分裂，从而得定理。

### 1.5 预备事实（关于 reflexive 层的 Proposition `facts`）

`main.tex:501-511`：$M$ 为流形，$\mathcal F$ reflexive sheaves：
1. `Har80` Cor.1.4：存在 $\codim\ge 3$ 的子集 $Z$ 使 $\mathcal F\otimes\mathcal O_{M\setminus Z}$ 局部自由；
2. `Har80` Cor.1.7：$\varphi\colon M\to N$ proper、等维数、dominant；$\mathcal F$ reflexive，则 $\varphi_\star\mathcal F$ reflexive；
3. `Har80` Prop.1.6：$M$ normal，$\mathcal F_1,\mathcal F_2$ reflexive，若存在 $\codim\ge 2$ 的闭子集 $Z$ 使 $\mathcal F_1\otimes\mathcal O_{M\setminus Z}\simeq\mathcal F_2\otimes\mathcal O_{M\setminus Z}$，则 $\mathcal F_1\simeq\mathcal F_2$。

## 2 向量丛的正性基础

### 2.1 Hermite 度量与曲率定义

`main.tex:520-543` 引入 holomorphic 向量丛 $E$ 上的 possibly singular Hermite 度量 $h$：可测取 $H_r$ 半正定矩阵值函数，要求 $0<\det h<+\infty$ 几乎处处（`main.tex:528`，`genefinit`）。`main.tex:534-543` 给出 positivity 定义：$(E,h)$ 的 Chern 连接 $\Theta_h(E)$ 满足 $i\Theta_h(E)\succcurlyeq\theta\otimes{\operatorname{Id}}_{\End(E)}$ 当对每开集 $U$、每 $s\in H^0(U,E^\star)$ 都有 $dd^c\ln|s|_{h^\star}-\theta\ge 0$ 以电流意义成立；正定即 $\theta=0$。

`main.tex:547-552` 给 **Definition `weakpocu`**（weakly positively curved）：$(X,\omega_X)$ Kähler、$E$ holomorphic 向量丛；若每 $\varepsilon>0$ 都存在 possibly singular Hermite 度量 $h_\varepsilon$ 使 $i\Theta_{h_\varepsilon}(E)\succcurlyeq-\varepsilon\omega_X\otimes{\operatorname{Id}}_{\End(E)}$，则 $E$ 弱正曲。

`Remark 2.1`（`main.tex:554-562`，`equdefn`）：
- (i) $i\Theta_h(E)\succcurlyeq\theta\otimes\Id$ 时，任意紧子集 $U\subset X$ 上 $h\ge c\cdot\Id$；
- (ii) 射影情形用 `PT14` 第 2 节 + `Pau16` Thm 2.21 之论证可证明"弱正曲"蕴含 Viehweg 意义的弱正性，反之不明。

### 2.2 Proposition `speccase`（齐延拓）

`main.tex:568-588`：设 $E$ 是 holomorphic 向量丛、$\theta$ 平滑闭 $(1,1)$-形式；Zariski 开集 $X_0\subset X$、其上 $(E|_{X_0},h_0)$ 满足 $i\Theta_{h_0}(V)\succcurlyeq\theta\otimes\Id$。
- (i) $h_0\ge c\cdot\Id$ on $X_0$ $\Rightarrow$ 延拓为整体 $h$ 使 $i\Theta_h(E)\succcurlyeq\theta\otimes\Id$；
- (ii) $\codim_X(X\setminus X_0)\ge 2$ $\Rightarrow$ 同上延拓。

证（`main.tex:583-588`）：(i) 给 $U\subset X$ 开、$s\in H^0(U,E^\star)$。由假设 $dd^c\ln|s|_{h_0^\star}\ge\theta$ on $U\cap X_0$；$h_0\ge c\cdot\Id$ 给出 $\ln|s|_{h_0^\star}$ 在 $U$ 之紧子集上有上界，由 Hartogs 延拓为 quasi-psh 函数且满足电流意义 $dd^c\ln|s|_{h^\star}\ge\theta$ 在 $U$ 上成立。(ii) 用 Hartogs 定理直接延拓。

### 2.3 Proposition `quotientweakpositive`（商弱正）

`main.tex:592-609` 引自 `PT14` + `Pau16` Lem 2.19：$\pi\colon E_1\to E_2$ generic surjective，$h$ on $E_1$ 使 $i\Theta_h(E_1)\succcurlyeq\theta\otimes{\operatorname{Id}}_{E_1}$，则 $h$ 诱导 $h_{\operatorname{quo}}$ on $E_2$ 使 $i\Theta_{h_{\operatorname{quo}}}(E_2)\succcurlyeq\theta\otimes{\operatorname{Id}}_{E_2}$。从而 $E_1$（弱）正 $\Rightarrow$ $E_2$（弱）正。证：$X_0\subset X$ Zariski 开使 $\pi$ 在 $X_0$ 上满；诱导 quotient metric $h_2$ on $E_2|_{X_0}$ 使 $i\Theta_{h_2}(E_2)\succcurlyeq\theta\otimes{\operatorname{Id}}_{E_2}$ on $X_0$。generic point $x\in X\setminus X_0$ 邻域 $U$ 上 $h\ge c\cdot\Id$（Remark 2.1），故 $h_2\ge c\cdot\Id$ on $U\cap X_0$；Proposition `speccase` 延拓为整体 $h_{\operatorname{quo}}$。

### 2.4 Theorem `mainposit`（PT14 直接像正性）

`main.tex:614-628` 记 `PT14` 第 5 节：$f\colon X\to Y$ 射影流形间的 fibration，$L$ 为 $X$ 上带 possibly singular 度量 $h_L$ 之线丛，$\Theta_{h_L}(L)\ge 0$。存在 $m\in\mathbb N$ 使 multiplier ideal sheaf $\mathcal I(h_L^{1/m}|_{X_y})$ 在 generic fiber $X_y$ 上平凡（即 $\int_{X_y}|e_L|_{h_L}^{2/m}<+\infty$、$e_L$ 为 $L$ 之 basis）。则 $Y_1=\text{locally free locus of }f_\star(\mathcal O_X(mK_{X/Y}+L))$，向量丛 $f_\star(\mathcal O_X(mK_{X/Y}+L))\otimes\mathcal O_{Y_1}$ 容许 possibly singular Hermite 度量 $h$ 使 $(f_\star(\mathcal O_X(mK_{X/Y}+L))\otimes\mathcal O_{Y_1}, h)$ 在 $Y_1$ 上正曲。

证明思想（`main.tex:624-628`）：`Ber09, BP08` 给 Zariski 开集 $Y_0$ 上有正曲之连续度量 $h$；Ohsawa-Takegoshi 与 semi-stable reduction 给 $h\ge c\cdot\Id$；用 Proposition `speccase`。

`Proposition 2.5`（`main.tex:632-641`，`lowercurcontrol`）：在同一设置下，$h_L$ 满足 $\Theta_{h_L}(L)\ge f^\star\theta$（$\theta$ 为 $Y$ 上 smooth $d$-closed $(1,1)$-形式，未必正）。则向量丛 $f_\star(\mathcal O_X(mK_{X/Y}+L))\otimes\mathcal O_{Y_1}$ 容许 possibly singular Hermite 度量 $h$ 使
$$i\Theta_h(f_\star(\mathcal O_X(mK_{X/Y}+L)))\succcurlyeq\theta\otimes{\operatorname{Id}}_{\End(f_\star(\mathcal O_X(mK_{X/Y}+L)))}$$
于 $Y_1$ 上成立（引 `PT14` Section 5 + `CP17` Lemma 5.25）。

## 3 Numerical flatness（数值平坦性）

### 3.1 Lemma `curvestablecase`（Demailly 想法）

`main.tex:657-698`：$C$ 光滑曲线，$E$ rank $n$ 数值平坦向量丛；$\pi\colon\mathbb P(E)\to C$ 自然投影；$A$ 是 $C$ 上 ample 线丛；$T_m\ge 0$ 带 analytic singularities 的 current 且与 $c_1(\mathcal O_{\mathbb P(E)}(m)+\pi^\star A)$ 同类，$T_m$ 在 generic $\pi$-fiber 邻域内 smooth。设
$$a_m:=\max_{x\in\mathbb P(E)}\nu(T_m,x),$$
则
$$\lim_{m\to\infty}\frac{a_m}{m}=0.\qquad(\text{`lim0sup`})$$

证：Proposition `lelongnumcont`（`main.tex:1783-1836`）给 $k\in\{1,\dots,n\}$ 随 $m$ 变，闭 $(k,k)$-positive current $\Theta_k$ 在类 $(c_1(\mathcal O_{\mathbb P(E)}(m)+\pi^\star A))^k$ 中，$\pi$-fiber 含 codim $k$ 子空间 $Z_m$ 使（`main.tex:678-680`，`ineqimportnew`）
$$\Theta_k\ge\big(\tfrac{a_m}{n}\big)^k\cdot[Z_m]$$
以电流意义。$\alpha=c_1(\mathcal O_{\mathbb P(E)}(1))$ nef $\Rightarrow$
$$(m\alpha+\pi^\star c_1(A))^k\cdot\alpha^{n-k}=\Theta_k\cdot\alpha^{n-k}\ge\big(\tfrac{a_m}{n}\big)^k\int_{[Z_m]}\alpha^{n-k},$$
而 $Z_m\subseteq\pi$-fiber $\Rightarrow$ $\int_{[Z_m]}\alpha^{n-k}\ge 1$，故
$$(m\alpha+\pi^\star c_1(A))^k\cdot\alpha^{n-k}\ge\big(\tfrac{a_m}{n}\big)^k.\qquad(\text{`ineqpolynew`})$$
因 $c_1(E)=0$，$\alpha^n=0\in H^{n,n}(\mathbb P(E))$，故 $m\gg 0$ 时上式左端 $\le C_1 m^{k-1}+C_2$；联立给 $(\frac{a_m}{n})^k\le C_1m^{k-1}+C_2$，$k\le n$ $\Rightarrow$ $a_m\le C_3 m^{(n-1)/n}+C_4$ uniform constants，得 `lim0sup`。

### 3.2 Lemma `equdef`（三条件等价）

`main.tex:702-751`：$X$ $n$-维射影流形，$E$ holomorphic 向量丛；$\pi\colon\mathbb P(E)\to X$，$\omega$ Kähler metric on $\mathbb P(E)$。
- (i) 存在 very ample $A$ 使
$$H^0(\mathbb P(E),\mathcal O_{\mathbb P(E)}(m)+\pi^\star A)\to H^0(\mathbb P(E)_x,\mathcal O_{\mathbb P(E)}(m)+\pi^\star A)$$
对 generic $x\in X$ 满（$m\gg 1$）；
- (ii) $\pi_\star(\mathbb B_-(\mathcal O_{\mathbb P(E)}(1)))\subsetneq X$（注：$\mathbb B(L)=\bigcap_{m\ge 1}\operatorname{Bs}(|mL|)$；$\mathbb B_-(L)=\mathbb B(L+\varepsilon A)$ 任 ample $A$ 充分小 $\varepsilon>0$）；
- (iii) 每 $\varepsilon>0$ 都存在 possibly singular 度量 $h_\varepsilon$ on $\mathcal O_{\mathbb P(E)}(1)$ 使 $i\Theta_{h_\varepsilon}(\mathcal O_{\mathbb P(E)}(1))\ge-\varepsilon\omega$ 且一般纤维 $\mathbb P(E)_x$ 上的限制 $h_\varepsilon^{\otimes m}|_{\mathbb P(E)_x}$ 之 multiplier ideal $\mathcal I(h_\varepsilon^{\otimes m}|_{\mathbb P(E)_x})$ 对每 $m\in\mathbb N$ 平凡。

证方向见 `main.tex:727-750`：(i)→(ii) 是定义；(ii)→(iii) 是用 $\pi_\star(\operatorname{Bs}(\mathcal O_{\mathbb P(E)}(m)+\varepsilon mA))\subsetneq X$ 找 $h_\varepsilon$ 带 analytic singularities；(iii)→(i) 用 Ohsawa-Takegoshi 沿 generic fiber 提升截面。

### 3.3 Proposition `numflatweakpost`

`main.tex:755-823`：$E$ rank $n$ 向量丛在 $X$（$n$-维射影）上，$c_1(E)=0$，且 $\pi_\star(\mathbb B_-(\mathcal O_{\mathbb P(E)}(1)))\subsetneq X$。则 $E$ 数值平坦。特例：$E$ 弱正曲且 $c_1(E)=0$ 则数值平坦。

证（`main.tex:764-823`）：任取 $\mathbb P(E)$ 中曲线 $B$，$\pi|_B$ finite；只需证 $c_1(\mathcal O_{\mathbb P(E)}(1))\cdot B\ge 0$。
- **Step 1**：$A$ very ample on $X$，$\{s_1,\dots,s_{k_m}\}$ 是 $H^0(\mathbb P(E),\mathcal O_{\mathbb P(E)}(m)+\pi^\star A)$ 的基；置
$$T_m:=dd^c\ln\sum_{i=1}^{k_m}|s_i|^2\ge 0$$
为 $c_1(\mathcal O_{\mathbb P(E)}(m)+\pi^\star A)$ 类中的 current；$a_m=\nu(T_m,B)$。证明 $\lim_m\frac{a_m}m=0$（`lim0`）：Lemma `equdef` 给出 $T_m$ 在 generic fiber $\pi$ 上 smooth；取 $C\subset X$ 由 $|A|$ 中 general 元完全交得之曲线，因 $C$ general 故 $E|_C$ 弱正曲 + $c_1(E|_C)=0$；$\dim C=1$ 故 $E|_C$ 数值平坦。$T_m|_{\pi^{-1}(C)}$ 在 generic fiber $\mathbb P(E)_x$ 上 smooth；应用 Lemma `curvestablecase` 得
$$\lim_m\frac{\nu(T_m|_{\pi^{-1}(C)},x)}{m}=0,\quad x\in B\cap\pi^{-1}(C);$$
与 $\nu(T_m|_{\pi^{-1}(C)},x)\ge\nu(T_m,B)$ $\forall x\in B$ 联立，得 `lim0`。
- **Step 2**：取 $\mathbb P(E)$ 上 Kähler 度量 $\omega$。`Dem92` Thm 1.1 给 current $\tilde T_m$ 在同类使 $\tilde T_m\ge-Ca_m\omega$ 且 $\nu(\tilde T_m,x)=\max(\nu(T_m,x)-a_m,0)$，特别 $\nu(\tilde T_m,B)=0$。于是
$$c_1(\mathcal O_{\mathbb P(E)}(m)+\pi^\star A)\cdot B=\tilde T_m\cdot B\ge-Ca_m\int_B\omega,$$
$m\to\infty$ 给 $c_1(\mathcal O_{\mathbb P(E)}(1))\cdot B\ge 0$。

第二部分（`main.tex:816-823`）：$E$ 弱正曲 $\Rightarrow$ $h_{\varepsilon,1}$ 使 $i\Theta_{h_{\varepsilon,1}}(E)\succcurlyeq-\varepsilon\omega_X\otimes\Id$ $\Rightarrow$ 诱导 possibly singular $h_\varepsilon$ on $\mathcal O_{\mathbb P(E)}(1)$ 使 $i\Theta_{h_\varepsilon}(\mathcal O_{\mathbb P(E)}(1))\ge-\varepsilon\pi^\star\omega_X$；`genefinit` 给出 $h_\varepsilon$ bounded over generic fiber of $\pi$ $\Rightarrow$ $\mathcal I(h_\varepsilon^{\otimes m}|_{\mathbb P(E)_x})$ 平凡；Lemma `equdef` 给 $\pi_\star(\mathbb B_-(\mathcal O_{\mathbb P(E)}(1)))\subsetneq X$ $\Rightarrow$ 数值平坦。

### 3.4 Corollary `trivialexten`

`main.tex:830-843`：$S$ 光滑射影曲面，$Z\subset S$ finite set；$S\setminus Z$ 上向量丛 $V$ 满足 $c_1(V)=0$ 且弱正曲；$j\colon S\setminus Z\hookrightarrow S$ inclusion；$\widetilde V=(j_\star V)^{\star\star}$。则 $\widetilde V$ 数值平坦。

证：$\widetilde V$ reflexive 故在 $S$（二维）局部自由；$c_1(\widetilde V)=0$（$\codim_Z=2$）；Proposition `speccase` 给 $\widetilde V$ 在 $S$ 上弱正曲；Proposition `numflatweakpost` 给数值平坦。

## 4 Setup 与双有理几何（Section 3 上半部）

### 4.1 Setup `setup`

`main.tex:856-892`：$X$ 单连通 uniruled 射影流形、$-K_X$ nef。Chow 空间 $\mathord{\mathcal{C}(X)}$ 极一般点对应 MRC 纤维化之极一般纤维的唯一不可约分支，记为 $Y$（取奇点解消）。$\mathord{f:{X'}  \rightarrow Y}$ 为 universal family 的 normalization 之拉回；$\mathord{p:{X'}  \rightarrow X}$ 双有理且 $p$-例外不 dominate $Y$。`Zha05` Cor.1 给 $\kappa(Y)=0$；取有效 $\mathbb Q$-Cartier divisor $N_Y\sim_\mathbb Q K_Y$。$A$ very ample；`surgene`（`main.tex:870-873`）即 $\Sym^p H^0(X_y,A)\to H^0(X_y,pA)$ 对每 $p\in\mathbb N$ 与一般 $y\in Y$ 满。取奇点解消 $\mathord{\mu:\Gamma  \rightarrow {X'}}$，诱导 $\mathord{\varphi:\Gamma  \rightarrow Y}$、$\mathord{\pi:\Gamma  \rightarrow X}$；$L=\pi^\star A$、$r=\rank\varphi_\star(\mathcal O_\Gamma(L))$。$X$ $\mathbb Q$-factorial $\Rightarrow$ $\pi$-例外主部 codim 1，记为 $E$。$Y_0\subset Y$ 取最大 Zariski 开集使
- $\Gamma_0:=\varphi^{-1}(Y_0)\to Y_0$ 等维数；
- 对 $Y_0$ 上每素除子 $B$，$\varphi^\star B\not\subseteq E$；
- $P\subset Y$ 取 $Y\setminus Y_0$ 中最大 reduced divisor。

### 4.2 Lemma `lemmabirationalLTZZ`（LTZZ 型双有理命题）

`main.tex:902-953`：$X$ 射影流形、$-K_X$ nef；$\mathord{\psi:Z  \rightarrow X}$ 有限，$\mathord{{\varphi'}:Z  \rightarrow {Y'}}$ fibration onto 射影流形 $Y'$；假设
$$K_{Z/Y'}\sim_\mathbb Q\psi^\star K_X+E_1-E_2,$$
$E_1,E_2$ 有效 $\mathbb Q$-除子使 $\supp(E_1+E_2)$ 不满射 $Y'$。则 $E_1$ 是 $\psi$-例外 $\Rightarrow$ $E_2$ 是 $\psi$-例外。

证（反证）：若 $E_2$ 非 $\psi$-例外，先证 $E_1-E_2$ pseudo-effective（claim）：对每 $\delta>0$
$$K_{Z/Y'}+\psi^\star(-K_X+\delta H)\sim_\mathbb Q E_1-E_2+\psi^\star(\delta H)$$
pseudo-effective（$\delta$ 后两项为 $\psi^\star(\delta H)$）?；实质上 $K_{Z/Y'}+\psi^\star(-K_X+\delta H)$ 在一般 $\varphi'$-纤维上 big（因 $\supp(E_1+E_2)$ 不满射，$K_Z,\psi^\star K_X$ 沿一般纤维相同 + $\psi$ 有限 + $\delta H$ ample） $\Rightarrow$ 充分整除 $m\gg 0$ 时 $\varphi'_\star(\mathcal O_Z(m(K_{Z/Y'}+\psi^\star(-K_X+\delta H))))$ 非零。$\psi^\star(-K_X+\delta H)$ semiample $\Rightarrow$ $\psi^\star(-K_X+\delta H)\sim_\mathbb Q B_\delta$ 有效使 $(Z,B_\delta)$ klt；`Cam04` Thm 4.13 给 $\varphi'_\star(\mathcal O_Z(m(K_{Z/Y'}+B_\delta)))$ 弱正；相对求值映射 generic surjectivity $\Rightarrow$ $m(K_{Z/Y'}+B_\delta)$ 弱正 $\Rightarrow$ pseudo-effective。得 $E_1-E_2$ pseudo-effective。

取 $C\subset Z$ 为 $\psi^\star$ 一般 ample divisor 完全交之曲线；$E_1\cdot C=0$（$E_1$ $\psi$-例外），$(E_1-E_2)\cdot C=-E_2\cdot C<0$（$\supp(-E_2)$ 非 $\psi$-例外），矛盾。

### 4.3 Proposition `propositionfundamentals`（双有理结构三性质）

`main.tex:955-1023`：在 Setup `setup` 下，设 $E_j$ 为 $\pi$-例外主部 $E$ 之不可约分支；$\pi$ 双有理 $X$ 光滑 $\Rightarrow$
$$K_\Gamma\sim\pi^\star K_X+\sum a_jE_j,\quad a_j>0.$$
MRC 纤维化几乎全纯 $\Rightarrow$ $E=\supp(\sum a_jE_j)$ 不满射 $Y$。

1. `birational`（`main.tex:972-976`）：$K_{\Gamma/Y}\sim_\mathbb Q\pi^\star K_X+\sum a_jE_j-\varphi^\star N_Y$；Lemma `lemmabirationalLTZZ` $\Rightarrow$ $\varphi^\star N_Y$ 是 $\pi$-例外 $\Rightarrow$ 由 $Y_0$ 定义 $\supp(N_Y)\subset P$。
2. 设存在素除子 $D\subset\Gamma$ 非 $\pi$-例外且 $\varphi(D)\subset Y\setminus Y_0$（必 codim $\ge 2$）。把 $\varphi(D)$ 的 blowup + 奇点解消合成 $\mathord{\tau:{Y'}  \rightarrow Y}$；$Y$ 光滑 $\Rightarrow$
$$K_{Y'}\sim\tau^\star K_Y+E_{Y'}\sim_\mathbb Q\tau^\star N_Y+E_{Y'},\quad \supp E_{Y'}=\tau\text{-例外}.$$
取 $\mathord{{\tau'}:Z  \rightarrow \Gamma}$ 为 $\Gamma\dashrightarrow Y'$ 之 indeterminacies 的 resolution；$D'\subset Z$ 为 $D$ 的 strict transform；$\varphi'(D')\subset\supp(\tau^\star N_Y+E_{Y'})$ 是典范除子，故 $(\varphi')^\star(\tau^\star N_Y+E_{Y'})$ 之支集是 $\pi\circ\tau'$-例外（如 1 之论证）；$D'$ $\pi\circ\tau'$-例外；$D'$ 非 $\tau'$-例外 $\Rightarrow$ $D=\tau'(D')$ $\pi$-例外，矛盾。故 $\pi(\varphi^{-1}(Y\setminus Y_0))$ 各不可约分支 codim $\ge 2$；特别 $\varphi$-例外除子都是 $\pi$-例外。
3. `Laz04a` Prop.4.1.12 允许取有限覆盖 $\mathord{{\tau'}:{Y'}  \rightarrow Y}$ 在 $B$ 上以 $m_j$-重分歧；fibre product $\Gamma\times_YY'$ 非 normal；normalisation $Z$ + relative canonical 关系由 `Rei94` Prop.2.3 给
$$K_{Z/Y'}=(\tau')^\star K_{\Gamma/Y}-A+C_1-C_2,$$
$A$ 有效使 $B_j\subset\tau'(A)$，$C_1,C_2$ 有效对底变换之非平坦部分；由 2 知 $\tau'(\supp(C_1-C_2))$ 在 $\pi\circ\tau'$-例外。联立 `birational`
$$K_{Z/Y'}=(\tau')^\star\pi^\star K_X+\pi^\star(\sum a_jE_j)+C_1-(\varphi^\star N_Y+A+C_2).$$
$\pi^\star(\sum a_jE_j)+C_1$ 之支集是 $\pi\circ\tau'$-例外 $\Rightarrow$ $\varphi^\star N_Y+A+C_2$ 之支集 $\pi\circ\tau'$-例外；$\tau'(A)\supseteq B_j$ $\Rightarrow$ $B_j$ $\pi$-例外。

### 4.4 Remark `remarkholomorphicconstant`

`main.tex:1025-1037`：任何全纯函数 $s\colon Y_0\to\mathbb{C}$ 是常数，$\varphi^\star s$ 在 $(\Gamma\setminus E)\cap\varphi^{-1}(Y_0)$（与 $X$ 之 Zariski 开子集等同）上全纯；Proposition `propositionfundamentals` 2 给余集 codim $\ge 2$ $\Rightarrow$ 延拓至 $X$，故常数。进而 $\mathcal O_{Y_0}^{\oplus r_1}\to\mathcal O_{Y_0}^{\oplus r_2}$ 之秩在 $Y_0$ 上一致。

## 5 直接像的平凡性（Section 3 中段）

### 5.1 目标

`main.tex:1046-1071`：证 Setup `setup` 下对 $m$ 充分大、$p\in\mathbb N$ 充分整除
$$\mathcal V_p:=\varphi_\star\!\big(\mathcal O_\Gamma(pL+pmE-\tfrac p{r}\varphi^\star\det\varphi_\star(\mathcal O_\Gamma(L+mE)))\big)$$
是 $Y_0$ 上平凡向量丛。思路：`propositionfundamentals` $\Rightarrow$ $-K_{\Gamma/Y}$ 可写成 nef + 支集在 $\pi$-例外 之除子；模仿 `Cao16` 大部分论证得 Lemma `psflemma` + Lemma `lmpost`。新增难点为 $E\cap\varphi^{-1}(Y_0)$ 使得一开始就 $\mathcal V_p$ 仅在 $Y_0\setminus\varphi_\star(E)$ 上 flatness；用 **Lemma `lemmastabilise`**（`main.tex:1204-1239`）给出 `isoointr`：
$$(\det\varphi_\star(\mathcal O_\Gamma(L+mE)))\otimes\mathcal O_{Y_0}\simeq(\det\varphi_\star(\mathcal O_\Gamma(L+(m+1)E)))\otimes\mathcal O_{Y_0}.$$
联立 `psflemma`、`lmpost` 在 Proposition `flatness`（`main.tex:1289-1309`）中证 $\mathcal V_p$ 在 $Y_0$ 上弱正曲 + $\pi_\star\varphi^\star c_1(\mathcal V_p)=0$；用 Corollary `trivialexten` + $Y_0$ 性质（Proposition `propositionfundamentals`）在 Proposition `propositiontrivial`（`main.tex:1410-1500`）证 $\mathcal V_p$ 在 $Y_0$ 上平凡。

### 5.2 Lemma `psflemma`（伪有效下界）

`main.tex:1076-1148` 引自 Viehweg 对角 trick `Vie95` Thm 6.24 + Q. Zhang `Zha05` + `Cao16` Prop.3.12 + `CP17` Thm 3.13。Setup 下对每 $m\in\mathbb N$，
$$A-\tfrac 1r\pi_\star\varphi^\star c_1(\varphi_\star(\mathcal O_\Gamma(L+mE)))$$
在 $X$ 上 pseudo-effective（`pshnew`）。

证：设 $E'\subset\Gamma$ 为 $\varphi$ 之非 reduced/non flat locus 并集；取 $\Gamma^{(r)}$ 为 $\Gamma$ 沿 $\varphi$ 的 $r$ 次纤维积之 desingularisation，$\pr_i$ 第 $i$ 个 directional projection，$\varphi_r$ 诱导 fibration。置
$$L^{(r)}:=\sum_{i=1}^r\pr_i^\star L,\quad E^{(r)}:=\sum_{i=1}^r\pr_i^\star E.$$
存在自然形态 `natmor` $\det\varphi_\star(\mathcal O_\Gamma(L+mE))\to(\varphi_r)_\star(\mathcal O_{\Gamma^{(r)}}(L^{(r)}+mE^{(r)}+\Delta))$，$\Delta$ 支集在 $\sum\pr_i^\star(E')$。在 generic 点 $y\in Y$ 上 `natmor` 非零 $\Rightarrow$ $H^0(\Gamma^{(r)},L')$ 非平凡，$L':=L^{(r)}+mE^{(r)}+\Delta-\varphi_r^\star c_1(\varphi_\star(\mathcal O_\Gamma(L+mE)))$ 有效。

比较 $K_{\Gamma^{(r)}/Y}$ 与 $\sum\pr_i^\star(\pi^\star K_X)$：`propositionfundamentals` $\Rightarrow$ $(\varphi^{(r)})^\star K_Y$ 数值等价于支集在 $\sum\pr_i^\star E$ 之除子；$K_{\Gamma^{(r)}}-\sum\pr_i^\star K_\Gamma$ 支集在 $\sum\pr_i^\star E'$；$\sum\pr_i^\star(K_\Gamma-\pi^\star K_X)$ 支集在 $\sum\pr_i^\star E$。得 $-\mathbb K_{\Gamma^{(r)}/Y}+\Delta'=-\sum\pr_i^\star(\pi^\star K_X)$（$\Delta'$ 支集在 $\sum\pr_i^\star(E'+E)$），nef。

`Cao16` Prop.2.10 给 ample $A_Y$ 使对每 $p\in\mathbb N$ 且 $q$ 充分大，相对上同调沿 diagonal 给
$$H^0(\Gamma,F_{p,q}+prL-p\varphi^\star c_1(\varphi_\star(\mathcal O_\Gamma(L+mE)))+\varphi^\star A_Y)$$
$$\to H^0(\Gamma_y,F_{p,q}+prL-p\varphi^\star c_1(\varphi_\star(\mathcal O_\Gamma(L+mE)))+\varphi^\star A_Y)$$
在 generic $y\in Y$ 上满，$F_{p,q}$ 有效支集在 $E\cup E'$。故 $F_{p,q}+prL-p\varphi^\star c_1(\varphi_\star(\mathcal O_\Gamma(L+mE)))+\varphi^\star A_Y$ 有效。`propositionfundamentals` $\Rightarrow$ $\pi_\star(F_{p,q})\subset\pi_\star(E\cup E')$ codim $\ge 2$，故
$$\pi_\star\!\Big(c_1\big(rL-\varphi^\star c_1(\varphi_\star(\mathcal O_\Gamma(L+mE)))+\tfrac 1p\varphi^\star A_Y\big)\Big)$$
在 $X$ 上 pseudo-effective；$p\to+\infty$ 得 `pshnew`。

### 5.3 Lemma `lmpost`（相对弱正）

`main.tex:1154-1198`：设 $E_1$ 有效 $\mathbb Q$-除子满足 $\varphi_\star(E_1)\subsetneq Y$、$L_Y$ 是 $Y$ 上 $\mathbb Q$-线丛、$a>0$ 使
$$L_1:=aL+E_1+\varphi^\star L_Y$$
pseudo-effective。则对 $c\in\mathbb N$ 充分大，$\varphi_\star(L_1+cE)$ 在 locally free locus $Y_1$ 上弱正曲（Definition `weakpocu`）；特别 $\det\varphi_\star(L_1+cE)$ pseudo-effective on $Y$。

证：用 $E_2$ 有效支集在 $E$ 使 $-K_\Gamma+E_2=-\pi^\star K_X$。选 ample $L_Y+A_Y$。对每 $\varepsilon\in\mathbb Q^+$，
$$-K_\Gamma+E_2+\varepsilon aL+\varepsilon\varphi^\star(L_Y+A_Y)=\pi^\star(-K_X+\varepsilon aA)+\varepsilon\varphi^\star(L_Y+A_Y)$$
semiample。又 $\varepsilon E_1+\varphi^\star K_Y\sim_\mathbb Q D$（$\varphi_\star(D)\subsetneq Y$）$\Rightarrow$
$$-K_{\Gamma/Y}+E_2+\varepsilon L_1=(-K_\Gamma+E_2+\varepsilon aL+\varepsilon\varphi^\star(L_Y+A_Y))+(\varepsilon E_1+\varphi^\star K_Y)-\varepsilon\varphi^\star A_Y$$
容许可 singular 度量 $h_{1,\varepsilon}$ 使 $i\Theta_{h_{1,\varepsilon}}(-K_{\Gamma/Y}+E_2+\varepsilon L_1)\ge-\varepsilon\varphi^\star\omega_Y$、$h_{1,\varepsilon}|_{\Gamma_y}$ 在 generic fiber 上 smooth。

$L_1$ pseudo-effective $\Rightarrow$ possibly singular $h$ 使 $i\Theta_h(L_1)\ge 0$；有 $m$（只依赖 $h$）使 $\mathcal I(h^{1/m}|_{\Gamma_y})=\mathcal O_{\Gamma_y}$ on generic fiber；每 $0<\varepsilon<1/m$ 配 $h_\varepsilon:=mh_{1,\varepsilon}+(1-m\varepsilon)h$ 为 $-mK_{\Gamma/Y}+mE_2+L_1$ 之 possibly singular 度量使
$$i\Theta_{h_\varepsilon}(-mK_{\Gamma/Y}+mE_2+L_1)\ge-m\varepsilon\varphi^\star\omega_Y,$$
$\mathcal I(h_\varepsilon^{1/m}|_{\Gamma_y})=\mathcal O_{\Gamma_y}$。Proposition `lowercurcontrol` 应用到 $(-mK_{\Gamma/Y}+mE_2+L_1,h_\varepsilon)$ 在 locally free locus $Y_{1,m}$ 上得 possibly singular $\tilde h_\varepsilon$ 使（`semipocur`）
$$i\Theta_{\tilde h_\varepsilon}(\varphi_\star(\mathcal O_\Gamma(mE_2+L_1)))\succcurlyeq-m\varepsilon\omega_Y\otimes\Id$$
at $Y_{1,m}$。取 $c$ uniform 使 $cE\ge mE_2$ 推回得弱正性（first part done）；second part 引 `Pau16` Cor. 2.26 first part。

### 5.4 Lemma `lemmastabilise`（行列式的稳定化）

`main.tex:1204-1239`：Setup `setup` 下，存在 $m_0\in\mathbb N$ 使对每 $m\ge m_0$，自然包含 `incl` 给出同构 `isoo`
$$(\det\varphi_\star(\mathcal O_\Gamma(L+mE)))\otimes\mathcal O_{Y_0}\simeq(\det\varphi_\star(\mathcal O_\Gamma(L+(m+1)E)))\otimes\mathcal O_{Y_0}.$$

证：有效除子
$$c_1(\varphi_\star(\mathcal O_\Gamma(L+(m+1)E)))-c_1(\varphi_\star(\mathcal O_\Gamma(L+mE)))$$
支集在 $\varphi_\star(E)$（固定 strict subvariety of $Y$，与 $m$ 无关）。若 `isoo` 反设对无穷多 $m$ 在 $Y_0$ 上非同构，可找有效 $\widetilde D\not\subseteq Y\setminus Y_0$ + $a_m\to+\infty$ 使
$$c_1(\varphi_\star(\mathcal O_\Gamma(L+mE)))-c_1(\varphi_\star(\mathcal O_\Gamma(L)))\ge a_m\cdot[\widetilde D].$$
联立 Lemma `psflemma`，$A-\frac 1r\pi_\star\varphi^\star c_1(\varphi_\star(\mathcal O_\Gamma(L)))-\frac{a_m}r\pi_\star\varphi^\star[\widetilde D]$ 在 $X$ 上 pseudo-effective。$Y_0$ 与 $\widetilde D$ 定义 $\Rightarrow$ $\pi_\star\varphi^\star[\widetilde D]$ 是 $X$ 上非平凡有效类；$a_m\to+\infty$ 矛盾。

### 5.5 Lemma `psflemm`（水平正性消失）

`main.tex:1244-1285`：Setup `setup` 下，$m_0\in\mathbb N$ as in `lemmastabilise`，$m\ge m_0$；$\theta$ 是 $Y$ 上闭 $(1,1)$-current，对 $Y_0$ 之某 movable compact curve $\mathcal C$ 满足 $\theta\cdot\mathcal C>0$（`remark*`：`\theta` 不必正）。则
$$L+cE-\tfrac 1r\varphi^\star c_1(\varphi_\star(\mathcal O_\Gamma(L+mE)))-\varphi^\star\theta$$
对每个 $c>0$ 不 pseudo-effective。

证（反证）：设存在 $c\ge m$ 使上式 pseudo-effective；由 Lemma `lmpost` 给 $c_1>0$ 使 $c_1(\varphi_\star(\mathcal O_\Gamma(T+c_1E)))$ 在 $Y$ 上 pseudo-effective。联立 $T$ 定义得 `lemlater`
$$\det\varphi_\star(\mathcal O_\Gamma(L+cE+c_1E))\ge\det\varphi_\star(\mathcal O_\Gamma(L+mE))+r\theta\quad\text{on }Y.$$

Lemma `lemmastabilise` $\Rightarrow$
$$c_1(\varphi_\star(\mathcal O_\Gamma(L+cE+c_1E)))-c_1(\varphi_\star(\mathcal O_\Gamma(L+mE)))$$
有效支集在 $Y\setminus Y_0$。$\mathcal C\subset Y_0$ 故
$$c_1(\varphi_\star(\mathcal O_\Gamma(L+cE+c_1E)))\cdot\mathcal C=c_1(\varphi_\star(\mathcal O_\Gamma(L+mE)))\cdot\mathcal C,$$
与 `lemlater` 矛盾（因 $\theta\cdot\mathcal C>0$、$\mathcal C$ movable）。

### 5.6 Proposition `flatness`（弱正曲 + 数值原像）

`main.tex:1289-1405`：Setup `setup`，$m_0\in\mathbb N$ as in `lemmastabilise`，$m\ge m_0$；$\omega_X$ 上 Kähler 度量，$\beta$ smooth form 表示 $\frac 1r\det\varphi_\star(\mathcal O_\Gamma(L+mE))$。

(i) 对每 $p\in\mathbb N$、$Y_{1,p}=\text{locally free locus of }\varphi_\star(\mathcal O_\Gamma(pL+pmE))$、每 $\varepsilon>0$，存在 possibly singular 度量 $h_{\varepsilon,p}$ on $\varphi_\star(\mathcal O_\Gamma(pL+pmE))$ over $Y_0\cap Y_{1,p}$ 使
$$i\Theta_{h_{\varepsilon,p}}(\varphi_\star(\mathcal O_\Gamma(pL+pmE)))\succcurlyeq(-\varepsilon\omega_X+p\beta)\otimes{\operatorname{Id}}_{\End(\cdots)}\quad\text{on }Y_0\cap Y_{1,p}.$$

(ii) 对每 $p\in\mathbb N$ 被 $r$ 整除、$r_p=\rank\varphi_\star(\mathcal O_\Gamma(pL+pmE))$：
$$\tfrac 1{r_p}\pi_\star\varphi^\star c_1(\varphi_\star\mathcal O_\Gamma(pL+pmE))=\tfrac pr\pi_\star\varphi^\star c_1(\varphi_\star\mathcal O_\Gamma(L+mE))\in H^{1,1}(X,\mathbb R).$$

证 (i)：Lemma `psflemma` 给 $c>0$ 使 $L+cE-\varphi^\star\beta$ pseudo-effective；possibly singular $h_L$ 使 $i\Theta_{h_L}(L+cE)\ge\varphi^\star\beta$。Lemma `lmpost` 应用到 $L+cE-\varphi^\star\beta$ 给 $c'\ge m$ 使 `semp`
$$i\Theta_{h_\varepsilon}\varphi_\star(L+c'E)\succcurlyeq(-\varepsilon\omega_X+\beta)\otimes{\operatorname{Id}}_{\End(\varphi_\star(L+c'E))}\quad\text{on }Y_{1,1,c'}.$$
`isoo` 给 $\varphi_\star(\mathcal O_\Gamma(L+c'E))\otimes\mathcal O_{Y_0}=\varphi_\star(\mathcal O_\Gamma(L+mE))\otimes\mathcal O_{Y_0}$；联立给 `sempos` on $Y_{1,1}\cap Y_0$
$$i\Theta_{h_{\tilde\varepsilon}}(\varphi_\star(\mathcal O_\Gamma(L+mE)))\succcurlyeq(-\varepsilon\omega_X+\beta)\otimes{\operatorname{Id}}_{\End(\cdots)}.$$
自然形态 `namor` $\Sym^p\varphi_\star\mathcal O_\Gamma(L+mE)\otimes\mathcal O_{Y_0}\to\varphi_\star\mathcal O_\Gamma(pL+pmE)\otimes\mathcal O_{Y_0}$ 由 `surgene` 在 generic 满；Proposition `quotientweakpositive` 用 `sempos` 推回得 `sempospcase` on $Y_{1,p}\cap Y_0$。

证 (ii)：$\alpha$ smooth form 表示 $\frac 1{r_p}c_1(\varphi_\star(\mathcal O_\Gamma(pL+pmE)))$。$C\subset X$ 为 very ample $A_X$ 之 general 完全交曲线，$\pi$-例外 $Z$ 不交；pushforward 为 strict transform in $\Gamma$。$\varphi_\star\mathcal O_\Gamma(L+mE)$ reflexive on $Y_0$ $\Rightarrow$ $Y_0\setminus Y_{1,1}$ codim $\ge 2$ in $Y_0$；`propositionfundamentals` 给 $\pi(\varphi^{-1}(Y\setminus Y_{1,1}))$ codim $\ge 2$，故可设 movable curve $\varphi(C)\subset Y_{1,1}\cap Y_0$。$\tau\colon\tilde C\to\varphi(C)$ normalization。

$N_1(X)$ 由 very ample $A_X$ 的 $A_X^{\dim X-1}$ 类生成；对偶与投影公式归结 `eqli`$\int_{\tilde C}\tau^\star(\alpha-p\beta)=0$。`namor` 在 $\tilde C$ 上诱导 generically surjectivity $\tau^\star\mathcal E_p\to\tau^\star\mathcal V_p$（$\mathcal E_p=\Sym^p\varphi_\star\mathcal O_\Gamma(L+mE)\otimes(\det\varphi_\star\mathcal O_\Gamma(L+mE))^{\otimes -p/r}$，$\mathcal V_p$ `direc`）。`flatness` (i) 给 $\tau^\star\mathcal E_p$ nef + $c_1=0$ $\Rightarrow$ 数值平坦；故 $\tau^\star\mathcal V_p$ 亦然（`Laz04b` Ex.6.4.17）；$c_1(\mathcal V_p)$ 表为 $r_p(\alpha-p\beta)$，得 `sepos`
$$\int_{\tilde C}\tau^\star(\alpha-p\beta)\ge 0.$$

反向：$pL$ 也是 very ample 在 $X$ 上的 pull-back；Lemma `psflemma` 替换 $L$ 为 $pL$ 得 $pL+c_3E-\varphi^\star\alpha$ pseudo-effective；于是
$$L+\tfrac{c_3}pE-\tfrac{\varphi^\star\alpha}p=L+\tfrac{c_3}pE-\varphi^\star\beta-\varphi^\star(\tfrac{\alpha-p\beta}p)$$
pseudo-effective；由 Lemma `psflemm`（$\theta=(\alpha-p\beta)/p$）得
$$\int_{\tilde C}\tau^\star(\alpha-p\beta)\le 0.$$
联立 `sepos` 得 `eqli`，即 (ii)。

### 5.7 Proposition `propositiontrivial`（直接像平凡）

`main.tex:1410-1500`：Setup `setup`，$m_0\in\mathbb N$ as in `lemmastabilise`，$m\ge m_0$；$p$ 充分整除；$\mathcal V_p$ `direc`。则 $\mathcal V_p$ 是 $Y_0$ 上平凡向量丛。

证：$\mathcal V_p$ reflexive on $Y_0$ $\Rightarrow$ $Y_0\cap Y_{1,p}$ 之余在 $Y_0$ 中 codim $\ge 2$；Proposition `facts` 3 给只需证 $\mathcal V_p\otimes\mathcal O_{Y_0\cap Y_{1,p}}$ 平凡。$Z:=\pi(E)$ codim $\ge 2$；$j\colon X\setminus Z\hookrightarrow X$。

取 very ample $A_X$ on $X$，由 $A_X$ 之 general 元素 $H_1,\dots,H_{n-2}$ 完全交得 surface $S$；$Z_S=Z\cap S$ finite，$S\setminus Z_S$ 单连通（Lefschetz：$\pi_1(S)\simeq\pi_1(X)=1$）。strict transform $\pi^{-1}(S\setminus Z_S)$ 减去 $\varphi^{-1}(Y_0)$ 余有限（`propositionfundamentals`）。

$\varphi^\star\mathcal V_p|_{\pi^{-1}(S\setminus Z_S)}$ 弱正曲（Proposition `flatness` (i)）+ $c_1=0$（Proposition `flatness` (ii)） $\Rightarrow$ Corollary `trivialexten` 给其在 $S$ 上延拓为数值平坦；$\pi_1(S)=1$ $\Rightarrow$ 此延拓从而 $\varphi^\star\mathcal V_p|_{\pi^{-1}(S\setminus Z_S)}$ 平凡向量丛。

$Z$ codim $\ge 2$ $\Rightarrow$ 同构 `isobir`
$$H^0(\Gamma\setminus E,\varphi^\star\mathcal V_p)\simeq H^0(X\setminus Z,\varphi^\star\mathcal V_p)\simeq H^0(X,(j_\star(\varphi^\star\mathcal V_p))^{\star\star}).$$
取 $C=S\cap H_{n-1}$（$H_{n-1}$ general in $|A_X|$）；取 $A_X$ 充分整使 $H^0(\Gamma\setminus E,\varphi^\star\mathcal V_p)\to H^0(C,\varphi^\star\mathcal V_p)$ 满。$Z\cap S=\emptyset$ $\Rightarrow$ $(\varphi^\star\mathcal V_p)|_C$ 平凡；故存在 $s_1,\dots,s_{r_p}\in H^0(\Gamma\setminus E,\varphi^\star\mathcal V_p)$ 使 $s_1\wedge\cdots\wedge s_{r_p}\in H^0(\Gamma\setminus E,\det\varphi^\star\mathcal V_p)$ 非平凡断面。`isobir` 给出 $H^0(X,(j_\star(\det\varphi^\star\mathcal V_p))^{\star\star})$ 之断面；$X$ 紧 + `flatness`（ii）给 $c_1=0$ $\Rightarrow$ 非零断面必为常数 $\Rightarrow$ $s_1\wedge\cdots\wedge s_{r_p}$ 非零常数。

**Claim**：$s_i|_{\varphi^{-1}(Y_0)\setminus E}=\varphi^\star\tau_i$ 对某 $\tau_i\in H^0(Y_0,\mathcal V_p)$。一旦证则 $s_1\wedge\cdots\wedge s_{r_p}=\varphi^\star(\tau_1\wedge\cdots\wedge\tau_{r_p})$ 为非零常数 $\Rightarrow$ $\tau_i$ 给 $\mathcal V_p$ 之平凡化。

Claim 证（`main.tex:1485-1499`）：$\Gamma\setminus E\to Y$ 非 proper，故非显然。$\varphi$ 具连通纤维 $\Rightarrow$ $s_i\in H^0(\Gamma\setminus E,\varphi^\star\mathcal V_p)$ 诱导 $\tilde\tau_i\in H^0(Y_0\setminus\varphi(E),\mathcal V_p)$。只需证 $\tilde\tau_i$ 延拓到 $H^0(Y_0,\mathcal V_p)$：$\mathcal V_p\otimes\mathcal O_{Y_0}$ reflexive $\Rightarrow$ 只需在每 divisor $B\subset Y$ 之一般点延拓。$Y_0$ 定义 $\Rightarrow$ $\Gamma\setminus E\to Y$ dominate 每 $B\subset Y_0$；`propositionfundamentals` 3 给一般 fiber over $B$ 至少含一 reduced 分支 $\Rightarrow$ 存在局部断面。沿局部断面 $\tilde\tau_i$ 有界 $\Rightarrow$ Riemann 延拓。

## 6 Theorem `theoremmain` 之证明（Section 3 下半）

### 6.1 乘法结构之建立

`main.tex:1503-1632`：Setup `setup` + Proposition `propositiontrivial` 之记号。选 $m\ge m_0$（`propositiontrivial`），充分整除 $p_0$ 使 $\mathcal V_{p_0}\otimes\mathcal O_{Y_0}$ 平凡，故
$$\varphi_\star(\mathcal O_\Gamma(p_0(L+mE)))\otimes\mathcal O_{Y_0}\simeq\big((\det\varphi_\star(\mathcal O_\Gamma(L+mE)))^{\otimes p_0/r}\big)^{\oplus r_{p_0}}\otimes\mathcal O_{Y_0}.$$
特别 $\det\varphi_\star(\mathcal O_\Gamma(p_0(L+mE)))\otimes\mathcal O_{Y_0}$ 在 Picard 群中可被 $r_{p_0}$ 整除。简化记号：用 $p_0L$ 替代 $L$，$p_0mE$ 替代 $mE$，则 $\det\varphi_\star(\mathcal O_\Gamma(L+mE))\otimes\mathcal O_{Y_0}$ 可被 $r$ 整除，`propositiontrivial` 对所有 $p\in\mathbb N$ 成立。

`symmap`（`main.tex:1518-1520`）：$\Sym^p(\varphi_\star(\mathcal O_\Gamma(L+mE)))\otimes\mathcal O_{Y_0}\to\varphi_\star(\mathcal O_\Gamma(p(L+mE)))\otimes\mathcal O_{Y_0}$ 在 generic surjectivity；twist by $(\det\varphi_\star(\mathcal O_\Gamma(L+mE)))^{\otimes -p/r}$ 后为
$$\Sym^p\mathcal V_1\otimes\mathcal O_{Y_0}\to\mathcal V_p\otimes\mathcal O_{Y_0}.$$
`propositiontrivial` 给两端为平凡向量丛 $\Rightarrow$ 秩常（Remark `remarkholomorphicconstant`）$\Rightarrow$ `symmap` surjectivity。

$L$ globally generated + $\varphi$-big，但 $L+mE$ 仅在一般 fiber 上 $\varphi$-globally generated；
$$\varphi^\star\varphi_\star(\mathcal O_\Gamma(L+mE))\to L+mE$$
不必满。取 indeterminacies 的 resolution $\Gamma'\to\Gamma$（光滑），拉回 $L,E$；可设
$$\varphi^\star\varphi_\star(\mathcal O_\Gamma(L+mE))\twoheadrightarrow M\hookrightarrow L+mE,\quad M\text{ 线丛}.$$
Pushforward 到 $Y$：
$$\varphi_\star(\mathcal O_\Gamma(L+mE))\to\varphi_\star(\mathcal O_\Gamma(M))\hookrightarrow\varphi_\star(\mathcal O_\Gamma(L+mE)),$$
复合为 id $\Rightarrow$ injection 为 isomorphism，故 `mobilefix`
$$L+mE=M+N,\quad M\text{ 是 }\varphi\text{-globally generated},\quad N\text{ 有效不 surjective onto }Y.$$
对一般 $\varphi$-fiber $F$，$L|_F=(L+mE)|_F=(M+N)|_F=M|_F$ very ample。

满射 $\varphi^\star\varphi_\star(\mathcal O_\Gamma(M))\twoheadrightarrow M$ 给出 $\Gamma\to\mathbb P(\varphi_\star(\mathcal O_\Gamma(M)))$；image 记 $\mathcal U_M\subset\mathbb P(\varphi_\star(\mathcal O_\Gamma(M)))$，有 commutative diagram（`main.tex:1566-1571`）
：图中四个对象为 $\Gamma$、$\mathcal U_M$、$\mathbb P(\varphi_\star(\mathcal O_\Gamma(M)))$、$Y$；五条箭头各带自己的标记：$\psi_M\colon\Gamma\to\mathcal U_M$，$\mathcal U_M$ 水平射向 $\mathbb P(\varphi_\star(\mathcal O_\Gamma(M)))$ 的那条是单射（源式未给它名字，此处记作 $\iota_M$，即 image 在射影丛中的包含），$\varphi_M\colon\mathcal U_M\to Y$，$\operatorname{pr}\colon\mathbb P(\varphi_\star(\mathcal O_\Gamma(M)))\to Y$，$\varphi\colon\Gamma\to Y$（斜箭头，$\Gamma$ 直接落到 $Y$）。两条复合 $\varphi_M\circ\psi_M$、$\operatorname{pr}\circ\iota_M$ 都有定义，图所断言的合态等式为
$$\varphi=\varphi_M\circ\psi_M=\operatorname{pr}\circ\iota_M\circ\psi_M\ (\text{在 }\Gamma\text{ 上}),\qquad \varphi_M=\operatorname{pr}\circ\iota_M\ (\text{在 }\mathcal U_M\text{ 上}).$$

**Step 1**（`main.tex:1573-1642`，$\varphi^{-1}(Y_0)\simeq Y_0\times F$ with $F$ a general $\varphi$-fibre）：

$pM\hookrightarrow p(L+mE)$ 给出交换图。左列 isomorphism 由 $\varphi_\star$ 等式证；底行 surjectivity 自 `symmap` $\Rightarrow$ 右列亦为 isomorphism。

设 $G:=(\det\varphi_\star(\mathcal O_\Gamma(L+mE))\otimes\mathcal O_{Y_0})^{\otimes 1/r}\simeq(\det\varphi_\star(\mathcal O_\Gamma(M))\otimes\mathcal O_{Y_0})^{\otimes 1/r}$，`propositiontrivial` 给对每 $p\in\mathbb N$
$$\varphi_\star(\mathcal O_\Gamma(pM))\otimes\mathcal O_{Y_0}\simeq(G\otimes\mathcal O_{Y_0})^{\oplus r_p}.\quad(\text{`ideovery`})$$

记 $\mathcal O_{\mathbb P(\varphi_\star(\mathcal O_\Gamma(M)))}(1)$ 为 tautological bundle，$\mathcal I_{\mathcal U_M}$ 为 ideal sheaf。$p$ 充分大时，$\pr_\star(\mathcal I_{\mathcal U_M}(p))$ $\pr$-globally generated，$R^j\pr_\star(\mathcal I_{\mathcal U_M}(p))=0$。正合列 `pushidealsheaf`
$$0\to\pr_\star(\mathcal I_{\mathcal U_M}(p))\to\pr_\star(\mathcal O_{\mathbb P(\cdots)}(p))\simeq\Sym^p(\varphi_\star(\mathcal O_\Gamma(M)))\to(\varphi_M)_\star(\mathcal O_{\mathcal U_M}(p))\to 0,$$
$\mathcal O_{\mathcal U_M}(p)$ 为 tautological bundle 在 $\mathcal U_M$ 上的限制。$M=\psi_M^\star\mathcal O_{\mathbb P(\cdots)}(1)$ + projection formula 给出 inclusion `notnormal`
$$(\varphi_M)_\star(\mathcal O_{\mathcal U_M}(p))\to\varphi_\star(\mathcal O_\Gamma(pM)).$$
$\psi_M$ 在一般 $\varphi$-fibre 上同构 $\Rightarrow$ `notnormal` 在 generic 点上是 isomorphism。

Twist `pushidealsheaf` 与 `notnormal` by $G^{-p}$：
$$\Sym^p\varphi_\star(\mathcal O_\Gamma(M))\otimes G^{-p}\to(\varphi_M)_\star(\mathcal O_{\mathcal U_M}(p))\otimes G^{-p}\to\varphi_\star(\mathcal O_\Gamma(pM))\otimes G^{-p}.$$
`ideovery` 给出两端限制在 $Y_0$ 上为平凡向量丛 + Remark `remarkholomorphicconstant` $\Rightarrow$ 映射在 $Y_0$ 上的秩常 $\Rightarrow$ `notnormal` 在 $Y_0$ 上是 isomorphism。故 $(\varphi_M)_\star(\mathcal O_{\mathcal U_M}(p))\otimes G^{-p}\otimes\mathcal O_{Y_0}$ 平凡，由 `pushidealsheaf` $\Rightarrow$ $\pr_\star(\mathcal I_{\mathcal U_M}(p))\otimes G^{-p}\otimes\mathcal O_{Y_0}$ 平凡；这给出 $\mathcal U_M\subset Y_0\times\mathbb P^{r-1}$ 之方程常系数，故 $\mathcal U_M$ 是乘积。

**Step 2**（`main.tex:1644-1678`，切丛分裂）：`mobilefix` $L+mE=M+N$，$N$ 对应 $L+mE$ 的 $\varphi$-fixed components；$L$ $\varphi$-globally generated $\Rightarrow$ $mE-N$ 有效。

一般 $\varphi$-fiber $\varphi^{-1}(y)$ 取不可约分支 $F_0\not\subseteq E$：$\pi$-birational onto image $\Rightarrow$ $L|_{F_0}=(\pi^\star A)|_{F_0}$ nef + big；$M|_{F_0}=L|_{F_0}+(mE-N)|_{F_0}$ 也 big $\Rightarrow$ $F_0$ 不被 $\psi_M$ contract。

Birational $\psi_M^0\colon\varphi^{-1}(Y_0)\to\varphi_M^{-1}(Y_0)\simeq Y_0\times F$ 之例外分支之一 $D$。$\varphi^{-1}(Y_0)\to Y_0$ flat $\Rightarrow$ $\varphi(D)$ 是 divisor；一般 fiber of $D\to\varphi(D)$ 之不可约分支 $F_0$：若 $F_0\not\subset E$，则 $F_0$ 不被 $\psi_M$ contract（Step 2 之论证）$\Rightarrow$ $D$ 不被 $\psi_M^0$ contract；故 $\psi_M^0$-例外 $\subseteq E$。特别
$$T_{\varphi^{-1}(Y_0)\cap(\Gamma\setminus E)}\simeq V_1^0\oplus V_2^0,$$
$V_1^0=\text{pull-back of }T_{Y_0\times F/Y_0}$、$V_2^0=\text{pull-back of }T_{Y_0\times F/F}$（沿 $\varphi^{-1}(Y_0)\cap\Gamma\setminus E\hookrightarrow\varphi_M^{-1}(Y_0)\simeq Y_0\times F$）。两者都是 algebraically integrable foliations，$V_1^0$ 之一般叶为 $\varphi$-fibre。

**Step 3**（`main.tex:1680-1706`，切丛分裂 + 结论）：$\Gamma\setminus E\hookrightarrow X$ 将 $\varphi^{-1}(Y_0)\cap(\Gamma\setminus E)$ 等同为 $X$ 之 Zariski 开子集 $X_0$；inclusion $j\colon X_0\hookrightarrow X$。定义 reflexive sheaves on $X$
$$V_1:=(j_\star V_1^0)^{\star\star},\quad V_2:=(j_\star V_2^0)^{\star\star}.$$
`opensplitting` 给 $(V_1\oplus V_2)\otimes\mathcal O_{X_0}=T_{X_0}$；`propositionfundamentals` 2 给 $X\setminus X_0$ codim $\ge 2$；Proposition `facts` 3 延拓为 reflexive sheaf 同构
$$V_1\oplus V_2\simeq T_X.$$
$\dim V_{j,x}\otimes_{\mathcal O_{X,x}}\mathbb C(x)$ 为 upper semicontinuous 函数，其和为 $\operatorname{rk} T_X$ = 常数 $\Rightarrow$ $V_1,V_2$ 局部自由（`Har77` II Ex.5.8.c）+ 给出 regular foliations。一般 $V_1$-叶为 MRC-fibration 的一般纤维，有理连通 $\Rightarrow$ `Höring07` Cor.2.11 给 smooth $X\to Y$ 使 $T_{X/Y}=V_1$。$T_X=V_1\oplus V_2$ $\Rightarrow$ $X\to Y$ 之相对 tangent 序列被 $V_2$ 分割；$V_2$ 可积 $\Rightarrow$ Ehresmann 定理（`CLN85` V §2 Prop.1 + Thm 3）给出万有覆盖分裂 $\widetilde X\simeq\widetilde Y\times\widetilde F$。$X$ 单连通 $\Rightarrow$ $X$ 自身是乘积 $Y\times F$。

## 7 Theorem `theoremMRC` 之证明

### 7.1 Step 1（$\mathcal F\subset T_X$ 为 subbundle）

`main.tex:1708-1733`：若 $X$ 非 uniruled，由 `BDPP13` 知 $K_X\equiv 0$。故设 $X$ uniruled，$\mathcal F\subset T_X$ 是使一般 $x\in X$ 处 $\mathcal F$-叶为 MRC 纤维之 integrable saturated subsheaf（saturated $\Rightarrow$ reflexive）。

$f\colon X'\to X$ finite étale 覆盖：$f^\star$ exact $\Rightarrow$ pull-back $f^\star\mathcal F\subset f^\star T_X=T_{X'}$ 是 $X'$ MRC 对应之 saturated subsheaf；若 $f^\star\mathcal F$ 为 subbundle 则 $\mathcal F$ 是 subbundle（invariant under finite étale covers）。故对有限基本群簇成立（`theoremmain` + `CH17` 等价版本）。

`Cao16` Cor.1.4 给 locally trivial Albanese $\alpha\colon X\to\mathord{\text{Alb}(X)\hspace{0.5ex}}$ 使纤维 $G$ 有限基本群。$\mathord{\text{Alb}(X)\hspace{0.5ex}}$ 非 uniruled，故 $\mathcal F\subset T_{X/\mathord{\text{Alb}(X)\hspace{0.5ex}}}\subset T_X$。取 $y\in\mathord{\text{Alb}(X)\hspace{0.5ex}}$，analytic neighborhood $U$ $\Rightarrow$ $\alpha^{-1}(U)\simeq U\times G$；$G$ 有限基本群 + 已知 $G$ 的 MRC 纤维化 $\to U\times Z$ smooth $\Rightarrow$ $\mathcal F|_{\alpha^{-1}(U)}\subset T_X|_{\alpha^{-1}(U)}$ 是 subbundle（uniqueness of $\mathcal F|_{\alpha^{-1}(U)}$）。

### 7.2 Step 2（MRC 纤维化结构）

`main.tex:1733-1745`：Step 1 给 $\mathcal F\subset T_X$ regular foliation；$\mathcal F$ 含一有理连通叶 $\Rightarrow$ `Höring07` Cor.2.11 给 smooth $\varphi\colon X\to Y$ 使 $T_{X/Y}=\mathcal F$。$-K_X$ nef + $\varphi$ smooth $\Rightarrow$ $-K_Y$ nef（`Deb01` Cor.3.15）；$Y$ 非 uniruled（`GHS03`）$\Rightarrow$ $K_Y\equiv 0$。

Fischer-Grauert 定理（`FG65`）把"$\varphi$ 局部平凡"归于"纤维双全纯不变量"。Rationally connected 流形单连通 $\Rightarrow$ $\varphi$-fibre 在 étale 覆盖下被 lift $\Rightarrow$ 不变量；`Cao16` Cor.1.4 假定情形：locally trivial Albanese $\alpha$ + 纤维 $G$ 有限基本群；`theoremmain` 给 $G$ 的 MRC 纤维化 local trivial + 不变量在 étale covers 下 + $\alpha$ 局部平凡 + 自同构 preserve MRC 纤维化 $\Rightarrow$ 所有 $\varphi$-fibre 双全纯 $\Rightarrow$ $\varphi$ locally trivial。

## 8 附录：analytic 工具

### 8.1 Lemma `approx`（Dem92 型近似）

`main.tex:1754-1780`：$C$ 1-维射影流形、$E$ rank $n$ 向量丛 on $C$；$\pi\colon\mathbb P(E)\to C$；$T=\alpha+dd^c\psi\ge 0$ analytic singularity 正 current，$\alpha$ smooth、$\psi$ quasi-psh；$\psi$ 在 generic fiber of $\pi$ 上 smooth。则对每 $c>0$，存在闭 almost positive $(1,1)$-current 序列 $T_{c,k}=\alpha+dd^c\psi_{c,k}$（$\psi_{c,k}$ 在 $\mathbb P(E)\setminus E_c(T)$ 上 smooth，$\searrow\psi$ 当 $k\to\infty$）使
$$T_{c,k}\ge-\varepsilon_k\omega,\quad\lim_{k\to\infty}\varepsilon_k=0,$$
且 $\nu(T_{c,k},x)=(\nu(T,x)-c)_+$ 每点 $x\in X$；$E_c(T):=\{x\mid\nu(T,x)\ge c\}$，$(\nu(T,x)-c)_+:=\max\{\nu(T,x)-c,0\}$。

证：$\psi$ 在 generic fiber of $\pi$ 上 smooth $\Rightarrow$ 取 Stein cover $\{U_i\}$ of $C$ 使 $T$ 在 $\pi^{-1}(U_i\cap U_j)$ 上 smooth（$i\neq j$）。$\pi^{-1}(U_i)$ 上 $T_{\mathbb P(E)/C}$ relatively ample $\Rightarrow$ 找 $\mathcal O_{\mathbb P(\pi^{-1}(U_i))}(1)$ 上 positive curvature metric；`Dem92` Thm 1.1 给 $\pi^{-1}(U_i)$ 上序列 $T_{c,k,i}=\alpha+dd^c\psi_{c,k,i}$，$\psi_{c,k,i}$ 在 $\pi^{-1}(U_i)\setminus E_c(T)$ 上 smooth，$\searrow\psi|_{\pi^{-1}(U_i)}$ when $k\to\infty$ 且 $T_{c,k,i}\ge-\varepsilon_k\omega$，$\nu(T_{c,k,i},x)=(\nu(T,x)-c)_+$ $x\in\pi^{-1}(U_i)$。$V\Subset U_i\cap U_j$ 上 $\lim_k\|\psi_{c,k,i}-\psi_{c,k,j}\|_{\mathcal C^0(\pi^{-1}(V))}=0$；`Dem92` Lemma 3.5 gluing $\{T_{c,k,i}\}_i$ 牺牲一点 positivity，证毕。

### 8.2 Proposition `lelongnumcont`（Lelong 数估计）

`main.tex:1783-1836`：Lemma `approx` 之设置，$a:=\max_{x\in\mathbb P(E)}\nu(T,x)$。则存在 $k\in\{1,\dots,n\}$、闭 $(k,k)$-positive current $\Theta_k$ 在类 $(c_1(T))^k\in H^{k,k}(\mathbb P(E))$ 中、codimension $k$ 子簇 $Z$ 含于 $\pi$-fiber 使
$$\Theta_k\ge\big(\tfrac a n\big)^k\cdot[Z]$$
电流意义成立。

证：`Dem92` Thm 1.7 同型论证；按 jumping values $0=b_1\le b_2\le\cdots\le b_n\le b_{n+1}$，$\codim E_c(T)=p$ on $c\in(b_p,b_{n+1}]$。$a$ 之定义给 $b_k$ 使 $b_{k+1}-b_k\ge\frac an$；$E_{b_{k+1}}(T)$ 取 codim $k$ 分支 $Z$，generic Lelong $\nu(T,Z)=b_{k+1}$。$\psi$ 在 generic fiber smooth $\Rightarrow$ $Z\subseteq$ some fiber of $\pi$。

归纳：假设 $\Theta_{p-1}$ $(p-1,p-1)$-positive in $(c_1(T))^{p-1}$，$\nu(\Theta_{p-1},x)\ge(b_{k+1}-b_1)\cdots(b_{k+1}-b_{p-1})$ on $Z$。$c>b_p$ 时 Lemma `approx` 之 $T_{c,k}$ 在 $\pi^{-1}(U_i)$ 上几乎正 + singular locus $\subseteq E_c(T)$ codim $\ge p$ $\Rightarrow$ `Dem92` Lemma 7.4 给 $\Theta_{p-1}\wedge(T_{c,k}+\varepsilon_k\omega)$ 正 current well-defined；定义
$$\Theta_p=\lim_{c\to b_p+0}\lim_{k\to\infty}\Theta_{p-1}\wedge(T_{c,k}+\varepsilon_k\omega),$$
则有
$$\nu(\Theta_p,x)\ge\nu(\Theta_{p-1},x)\cdot(\nu(T,x)-b_p)_+,$$
$\Rightarrow$ $\nu(\Theta_p,x)\ge(b_{k+1}-b_1)\cdots(b_{k+1}-b_p)$ on $Z$。

最后步骤：$(c_1(T))^{k}$ 类中 $\Theta_k$ 满足
$$\nu(\Theta_k,x)\ge(b_{k+1}-b_1)\cdots(b_{k+1}-b_k)\ge(b_{k+1}-b_k)^k\ge(\tfrac a n)^k\quad\text{for }x\in Z.$$
$Z$ codim $k$ $\Rightarrow$ Siu 分解定理给 $\Theta_k\ge(\tfrac a n)^k[Z]$ 电流意义。得证。

## 9 与本语料的接缝

Cao-Höring 2017（`CaoHoring`）作为本语料中关于 nef 反典范丛射影流形分解的奠基论文，被如下三篇本语料稿在以下位置用作"乘积分解为有理连通 × Calabi-Yau"或"MRC 纤维化的局部平凡结构"的关键引用：

- **D385**：调用 Theorem `theoremmain`（`main.tex:421-424`），把 $\pi_1(X)=1$ + $-K_X$ nef 推到 $X\simeq Y\times F$ 的乘积结构；记号 $Y$（$K_Y\sim 0$）与 $F$（有理连通）的读法与本稿 §1.2、§6 之 Step 3 一致。
- **D447**：调用 Theorem `theoremMRC`（`main.tex:434-440`）给出的局部平凡纤维化 $X\to Y$、$K_Y\equiv 0$；其证明依赖 Proposition `propositiontrivial`（`main.tex:1410-1500`）之直接像 $\mathcal V_p$ 在 $Y_0$ 上平凡，本稿 §5.7 给详细推导。
- **D471**：调用 Corollary（`main.tex:428-430`，由 `Cao16` Cor.1.4 + Theorem `theoremmain` 推出）来表述 Conjecture `newcon`（`main.tex:401-409`）在射影情形成立；记号 $\widetilde X\simeq\mathbb{C}^q\times\prod Y_j\times\prod S_k\times Z$ 与本稿 §1.1 一致。

C 稿内的记号读取约定（与素材 `main.tex` 之 preamble 保持一致）：

- $\lfloor\rfloor$/`\rup{}` = `\lfloor`/`\lceil`（`main.tex:292-293`），$\lfloor{mD}\rfloor$ = $\lfloor mD\rfloor$。本源 $\operatorname{NE}(X)$ 之 $\overline{\operatorname{NE}}(X)$ 形：本稿统一写 $\overline{\operatorname{NE}}(X)$（即 $\overline{\text{NE}}(X)$），不缩写为 $\bar N$。 
- $\mathcal O_X$ 出自 `\r` 重定义为 $\mathbb R$ 后不影响 `\mathcal O`，故正文统一写 $\mathcal O_X$（如 `main.tex:332` 之 $\mathcal O_X(pA)$）。
- $K_{X/Y}$（相对典范除子）：按 `main.tex:587` 之相对典范 sheaf，记号 $K_{X/Y}=K_X-\varphi^\star K_Y$。
- $\Sym^p(\varphi_\star\mathcal O_\Gamma(L+mE))$（`symmap`）= $\Sym^p\varphi_\star\mathcal O_\Gamma(L+mE)$，在前面用 $\Sym^p$。
- $a_m/m\to 0$ 记号：本稿出现于 Lemma `curvestablecase`、Proposition `flatness`（i）的弱正曲条件、Proposition `numflatweakpost` Step 2 的 Dem92 截尾；它们的核心不等式是 Dem92 Thm 1.1 的 $\tilde T_m\ge-Ca_m\omega$，$\nu(\tilde T_m,B)=0$。
- Hermite 度量曲率符号（`\succcurlyeq`）：本稿用 $i\Theta_h(E)\succcurlyeq\theta\otimes\Id$ 表示逐点微分形式意义，亦保留为 $\succcurlyeq$。
- $L$（$= \pi^\star A$）和 $E$（$\pi$-例外主部）：$L+mE$ 的 mobile 分解 $M+N$（`mobilefix`）由 $\varphi^\star\varphi_\star$ 的 generic surjectivity 与 global generation 给出。


### 摘要

Cao-Höring 2017 在射影范畴内对 nef 反典范丛流形给出了类似 Beauville-Bogomolov 的分解：单连通时 $X\simeq Y\times F$，其中 $K_Y\sim 0$ 且 $F$ 有理连通；一般情形有 MRC 纤维化 $X\to Y$ 使 $F$ 有理连通、$K_Y\equiv 0$（`main.tex:421-440`）。其证明的本技术核心在 Section 3：构造 universal family $\Gamma\to Y\to X$（`setup`），用 Campana-Favre-Zhang 的特殊性研究与 Viehweg 直接像正性（`PT14`、`Cam04`）处理 reflexive 层的扭曲（`flatness`/`propositiontrivial`），最后通过 tangent 切丛分裂（Step 3 in `subsectionproof`）用 Ehresmann 定理证乘积分解。
