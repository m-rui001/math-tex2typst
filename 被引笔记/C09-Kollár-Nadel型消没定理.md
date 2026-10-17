# C09 Kollár-Nadel 型消没定理（arXiv:1607.04684）

## 0 取证边界

- arXiv id：1607.04684。
- 原题名（逐字）：Kollár--Nadel type vanishing theorem。
- 作者（原文署名逐字，`main.tex:14, 20-22`）：Osamu Fujino（藤尾 修），Department of Mathematics, Graduate School of Science, Osaka University, Toyonaka, Osaka 560-0043, Japan，邮箱 `fujino@math.sci.osaka-u.ac.jp`。
- 发表年月：2016-07-15（arXiv v1 上线日期；`main.tex:15` 内文自署日期 `2016/7/10, version 0.01`）。
- 素材目录：`E:\math\被引素材\1607.04684`。主 tex 清单：`被引素材/1607.04684/main.tex`，盘面实测 10576 字节 / 328 行。
- MSC 2010（`main.tex:16`）：Primary 32L10；Secondary 32Q15。关键词（`main.tex:17-19`）：injectivity theorem, Nadel vanishing theorem, Kollár vanishing theorem, multiplier ideal sheaves。
- 本语料引用它的稿号与 bib key：D305（`Fujino2018`）、D385（`Fujino2018`）、D447（`Fujino2018`）、D451（`Fujino2018`）、D471（`Fujino2018`）。写手不读这些稿。
- 取材薄读之处（`main.tex`）：`1-100`（preamble、摘要、引言前半、Theorem A 与 Theorem 1.10 陈述）、`100-200`（主定理 f-thm3 的陈述与引言尾、证明开端、交换图、正合列）、`200-328`（长正合、Leray 谱序列图、$H^1$ 消没收尾、Nakano 半正 remark、致谢、参考文献）。整篇 325 行；一次读取即覆盖全部正文。
- preamble 自定义（`main.tex:1-37`）里 KaTeX 需替换的宏极少：`\mathcal J`（乘子理想层）、`\mathcal O`（结构层）、`\omega_X`（典范层）、`\sqrt{-1}` 写作 $\sqrt{-1}$、`\Theta_h(F)`（曲率）保留。`\DeclareMathOperator{\Coker}{Coker}` 用 `\operatorname{Coker}` 写。原文以 `\C` 未定义，本稿不引入 $\C$ 记号；复数域直接写 $\mathbb C$。`\xymatrix` 图在正合列段落里承载结构，本稿把它按行展开成散文与交换图注记。

- 素材结构与编号规则登记（`main.tex:1-37`）：文档类 `amsart` 12pt twoside，载入 `amssymb, amsmath, amsthm, amscd, enumerate, mathrsfs, graphicx, hhline, xy, hyperref`（`main.tex:1-6`），其中 `mathrsfs` 供 `\mathcal J` 的花体形，`xy` 与 `amscd` 供两处 `xymatrix` 交换图（`main.tex:169-185`、`main.tex:239-250`），KaTeX 不认这两个环境，本稿按行展开。`\DeclareMathOperator{\Coker}{Coker}` 在 `main.tex:25`，故正文一律写 `\operatorname{Coker}`。
- 定理环境计数：`\newtheorem{thm}{Theorem}[section]`（`main.tex:27`）按节计数，`\newtheorem*{rem}{\it{Remark}}` 与 `\newtheorem*{ack}{Acknowledgments}`（`main.tex:29-30`）为不编号环境。据此本文实际只有 3 个 Theorem（`f-thm1` 在 `main.tex:59`、`f-thm2` 在 `main.tex:89`、`f-thm3` 在 `main.tex:108`），Remark 一枚且不带编号。对本稿 §8 首句的更正：那里写作 Remark 8.1，按 `main.tex:29` 的 `newtheorem*` 声明，素材的 Remark 并无节号与序号，只有内部标签 `f-rem2.1`（`main.tex:272`）；本稿读法统一为「`main.tex:272-279` 的 Remark」。
- 公式编号规则：`\theequation` 被改为 `\thesection.\arabic{equation}` 并 `@addtoreset`（`main.tex:33-35`），故 §2 的四条编号式依次为 (2.1)（`main.tex:163-166`）、(2.2)（`main.tex:205-212`）、(2.3)（`main.tex:216-220`）、(2.4)（`main.tex:232-235`），另有两条不编号式在 `main.tex:223-230` 与 `main.tex:258-261`。
- 结果条数申报逐字：摘要（`main.tex:42-46`）只申报一条：We prove an analytic generalization of Kollar's vanishing theorem, which contains the Nadel vanishing theorem as a special case。引言（`main.tex:103-106`）把主定理 f-thm3 定位为 fujino-matsumura 的 Theorem D 的 slight generalization，并声明它是 Theorem f-thm1 与 Theorem f-thm2 的应用。因此本稿把陈述级条目定为：借来的两条（f-thm1、f-thm2）、自证的一条（f-thm3）、特例两条（Nadel 与 Kollar，见 `main.tex:134-138`）、延伸注记一条（Nakano 半正情形，`main.tex:272-279`）。
- 素材里的引用出口登记（`main.tex:291-324`，7 条 bibitem）：enoki（`main.tex:292-297`）、fujino1 Vanishing theorems（`main.tex:299-301`）、fujino2 Injectivity theorems（`main.tex:303-305`）、fujino3 Foundation of the minimal model program（`main.tex:307-309`）、fujino-matsumura（`main.tex:311-314`）、kollar Higher direct images of dualizing sheaves. I（`main.tex:316-319`）、matsumura A vanishing theorem of Kollar-Ohsawa type on compact Kahler manifolds（`main.tex:321-323`）。`main.tex:141-142` 把最后一条列为相关消没定理并指向其 Theorem 1.3。
- 记法核对（对 §0 首条的补正）：素材正文未出现 `\C` 宏，本稿也不引入；`\mathcal J` 直接以花体写；`\omega_X` 与 `\mathcal O_X` 保留；`hhline`、`enumerate` 两包在正文里没有可见作用，登记不发明。

- 稿内旧文的渲染兼容登记（加深时复核所得，三处，均按派单不改动）：其一，§7 中的二行二列交换图块以 `\begin{CD}` 与 `@V{}V` 形写成，KaTeX 无 `CD` 环境；其读法为上行 $H^{1}(Y,\mathcal F^{j})\hookrightarrow H^{j+1}(X,\omega_X\otimes F\otimes\mathcal J(h))$、下行 $H^{1}(Y,\mathcal F^{j}\otimes H^{\otimes m})\hookrightarrow H^{j+1}(X,\omega_X\otimes F\otimes\mathcal J(h)\otimes f^{*}H^{\otimes m})$、左竖箭 $\alpha$、右竖箭 $\beta$、横箭皆单射，对应素材 `main.tex:239-254` 的 `xymatrix` 块（那里单射记号是 `\ar@{^{(}->}[r]`）；本稿 §7 末段以纯文字重述同一条推导链，旧块照留。其二，§3 旧文第三段关于 Enoki 原始版本条件的叙述超出本素材可核对范围（`main.tex:81-82` 只声明推广关系，`main.tex:292-297` 只有书目），本稿 §3 末段已登记该点。其三，§5 旧文的第二特例一段以自问自答写出，本稿 §2 末段给出同一特例的公式级验算，两处并存，旧段按派单不改动。

- 本稿简写约定（加深新增）：$R^{j}f_{*}(\omega_X\otimes F\otimes\mathcal J(h))$ 在 §6、§7 简写 $\mathcal F^{j}$，此记号逐字来自素材 `main.tex:251-253`；(2.2) 右端项 $R^{j}f_{*}(\omega_D\otimes F|_D\otimes\mathcal J(h|_D))$ 简写 $\mathcal F^{j}_{B}$，属本稿补写；$\sigma\in H^{0}(Y,H^{\otimes m})$ 表示定义 $B$ 的截面，素材在 `main.tex:156-157` 只写 take a sufficiently large positive integer $m$ and a general member $B\in\lvert H^{\otimes m}\rvert$ 而没有点名截面，故 $\sigma$ 与 $s=f^{*}\sigma$ 都是本稿补写。

- 素材省略与笔误清单（本轮加深累计七处，全部登记不发明）：其一 `main.tex:160-161`，把 f-thm2 用于带奇度量 $h$ 而未写 q.psh. 函数一侧的运输；其二 `main.tex:213-214`，(2.2) 的正合性只以一句 since $B$ is a general member 交代，未证连接同态 $\delta_j=0$；其三 `main.tex:210` 与 `main.tex:217`，像映射已换成 $f|_D:D\to B$ 而符号仍写 $R^{j}f_{*}$；其四 `main.tex:255`，f-thm1 代入时的 $a=\varepsilon/m$ 与幂次曲率式都没写；其五 `main.tex:257-262`，重复了 (2.1) 在 $i=1$ 处已给的消没；其六 `main.tex:275-276`，Nakano 半正情形的延伸没有处理 $E|_D$ 的限制步；其七 `main.tex:144`，全篇记法交给 `fujino-matsumura`，本文内无任何定义式。

- 旧文第四处（照留）：§4 末段引用素材 `main.tex:144` 时把原文的交叉引用原语一并抄在引号内，属规格第 3 条禁止的形；本稿 §1 与 §2 的同一句引用已改为不带原语的写法，旧句按派单不改动。

## 1 单数 Hermite 度量与乘子理想层

要读懂 Fujino 这五页短文，先要固定三件基本物件：单数 Hermite 度量、它的曲率流、乘子理想层。设 $X$ 是紧 Kähler 流形，$F$ 是全纯线丛。一个（可能带奇性的）Hermite 度量 $h$ 在局部平凡化 $e$ 下写成 $\|e\|_h^2 = \mathrm{e}^{-\varphi}$，$\varphi$ 是局部 quasi-plurisubharmonic（q.psh.）函数，即在局部坐标 $z = (z_1, \dots, z_n)$ 下 $\sqrt{-1} \partial \bar{\partial} \varphi \geq 0$（作为当前）。$h$ 的曲率是当前意义上的闭 $(1,1)$ 流
$$\sqrt{-1} \Theta_h(F) = \sqrt{-1} \partial \bar{\partial} \varphi,$$
在奇集以外退化为光滑曲率形式。$X$ 上的典范层记 $\omega_X = \bigwedge^n T_X^* = K_X$。

乘子理想层 $\mathcal J(h) = \mathcal J(\varphi) \subseteq \mathcal O_X$ 的 stalk 在 $x \in X$ 上是
$$\mathcal J(\varphi)_x = \{ g \in \mathcal O_{X, x} : |g|^2 \mathrm{e}^{-\varphi} \text{ 在某个 } x \text{ 邻域可积} \}.$$
Nadel 1989 与 Demailly 的椭圆正则化都证明 $\mathcal J(\varphi)$ 是 $\mathcal O_X$ 的凝聚层。它把 $\varphi$ 的奇性代数化：$\mathrm{ord}_E(\varphi)$ 沿除子 $E$ 大于 1 时，$\mathcal J(\varphi)$ 沿 $E$ 出现一个零点。原文在 `main.tex:78` 与 `main.tex:100` 处把 $\mathcal J(h)$ 与 $\mathcal J(\varphi)$ 混用，本稿保持同样约定：$h$ 用 $\varphi$ 表出时，$\mathcal J(h) = \mathcal J(\varphi)$。

在光滑线丛 $M$ 上带光滑 Hermite 度量 $h_M$ 时，$\sqrt{-1} \Theta_{h_M}(M)$ 就是 Chern 曲率；$h_M$ 半正（nef 型）当且仅当 $\sqrt{-1} \Theta_{h_M}(M) \geq 0$ 处处成立。$F$ 有单数度量 $h$ 且 $\sqrt{-1} \Theta_h(F) - a \sqrt{-1} \Theta_{h_M}(M) \geq 0$（$a > 0$ 常数）时，$\varphi - a \psi$ 是 q.psh.（$\psi$ 为 $h_M$ 的局部权），这在原文 `main.tex:66-69` 与 `main.tex:119-122` 两处作为主假设出现，是本文所有消没/注入结论的"曲率下限"。

对全纯映射 $f: X \to Y$（$Y$ 射影簇），高次直接像 $R^j f_* (\omega_X \otimes F \otimes \mathcal J(h))$ 是 $Y$ 上的凝聚 $\mathcal O_Y$-模（Grauert 定理在 Kähler 情形的对应物）。Kollár-Nadel 型消没说的正是：对足够正曲率的 $F$，$H^i(Y, R^j f_* (\omega_X \otimes F \otimes \mathcal J(h))) = 0$ 对 $i > 0$ 全体 $j$。

素材侧的物件登记：本文自己不给单数 Hermite 度量与乘子理想层的定义，`main.tex:144` 一句 In this paper, we will freely use the same notation as in fujino-matsumura 把记法全部交给那篇预印本。上面第一至第三段的定义式属本稿的读法，不配位置串；配位置串的只有三处出现：`main.tex:76-78`（$\omega_X$ 为 $X$ 的典范丛、$\mathcal J(h)$ 为 $h$ 的乘子理想层，在 Theorem f-thm1 的结论里以系数层 $\omega_X\otimes F\otimes\mathcal J(h)$ 出现）、`main.tex:99-100`（$\mathcal J(\varphi)$ 为 q.psh. 函数 $\varphi$ 的乘子理想层，在 Theorem f-thm2 的集合 $\mathcal G$ 里以限制式 $\mathcal J(\varphi|_H)=\mathcal J(\varphi)|_H$ 出现）、`main.tex:129-131`（$\mathcal J(h)$ 为与单数 Hermite 度量 $h$ 相伴的乘子理想层，在主定理结论里）。

曲率下限式的两处逐字对照：Theorem f-thm1 一侧写作

$$\sqrt{-1}\Theta_{h_M}(M)\geq 0 \quad \text{and}\quad \sqrt{-1}\Theta_h(F)-a\sqrt{-1}\Theta_{h_M}(M)\geq 0\ \text{for some}\ a>0$$

（`main.tex:66-69`），Theorem f-thm3 一侧写作

$$\sqrt{-1}\Theta_g(f^*H)\geq 0 \quad \text{and}\quad \sqrt{-1}\Theta_h(F)-\varepsilon\sqrt{-1}\Theta_g(f^*H)\geq 0\ \text{for some}\ \varepsilon>0$$

（`main.tex:118-123`）。两式的形状完全同构，差别只在三处：第二个线丛由 $X$ 上的 $M$ 换成 $Y$ 上 ample 的 $H$ 的拉回 $f^*H$；度量由光滑的 $h_M$ 换成 $f^*H$ 上的光滑度量 $g$；正常数由 $a$ 改名 $\varepsilon$。素材在 `main.tex:65` 与 `main.tex:117` 只写 We assume that 与 Assume that，未写明这两条不等式取在哪个锥（Nakano、Griffiths、还是逐点半正），但因全部对象都是线丛，三种半正概念对线丛重合，本稿按当前意义下的半正读，并把这一读法登记为本稿补记，素材没有这条陈述。

## 2 经典 Kollár 与 Nadel 消没

Fujino 本文的定位是"把两条 1980 年代的经典消没定理并到一个解析版本里"。原文 `main.tex:134-142` 只一句"easily see"就把两条特例并入主定理，值得摊开对照。

Kollár 消没（1986，Ann. of Math. 123 (1986) 11-42 的 Theorem 2.1 (iii)，`main.tex:316-319` 的 bibitem kollar）设 $f: X \to Y$ 是光滑射影簇之间的态射，$L$ 是 $Y$ 上 ample 线丛，则
$$H^i(Y, R^j f_* (\omega_X \otimes f^* L)) = 0 \quad \text{对所有 } i > 0, j.$$
这一版对 $X$ 光滑、$Y$ 射影、$f$ 光滑极小纤维化最有用；Gram-Bott-Danielsson 1985 与 Fujino-Fukuda-Kano 的 MMP 文献里都作为标准工具。它的解析证明走 Hodge 理论：$R^j f_* \omega_X$ 是变 Hodge 结构在 $Y$ 上的 $\mathcal O_Y$-层版本，$f^* L$ 的正曲率让 Kodaira 消没沿纤维一致。

Nadel 消没（1989，J. Differential Geom. 30 (1989) 247-255）设 $X$ 是紧 Kähler 流形，$F$ 是全纯线丛带奇 Hermite 度量 $h$，$\sqrt{-1} \Theta_h(F) \geq \varepsilon \omega$（$\omega$ Kähler 形式，$\varepsilon > 0$），则
$$H^i(X, \omega_X \otimes F \otimes \mathcal J(h)) = 0 \quad \text{对所有 } i > 0.$$
证明走 Dolbeault 上 $\bar{\partial}$-Laplace 的 Hörmander 估计：$\mathcal J(h)$ 让上截面在 $h$ 的奇集附近被自动抑制，从而 $\bar{\partial}$ 方程 $L^2$ 解存在。Demailly 1993 的原始形式在 Fujino-Matsumura 的引用中被称作 Nadel 消没（`main.tex:135-136`）。

两条的差别：Kollár 有态射 $f$ 与"源光滑、靶射影、纤维光滑"，权是 pullback 的 ample；Nadel 无 $f$（$f = \mathrm{id}$），权是任意正曲率的线丛，允许奇度量与乘子理想层。Fujino 本文要一次覆盖两者：既允许 $f$ 到射影簇 $Y$，又允许 $F$ 的度量带奇性并显式带 $\mathcal J(h)$。$\sqrt{-1} \Theta_g(f^* H) \geq 0$ 与 $\sqrt{-1} \Theta_h(F) - \varepsilon \sqrt{-1} \Theta_g(f^* H) \geq 0$ 这两条曲率条件正是把 Kollár 的"$f^* L$ ample 提升"与 Nadel 的"$\varepsilon$-正"合并到同一形式（`main.tex:118-123`）。

两条原料在本素材里的申报位置与验算式。素材只给一句归约：`main.tex:134-138` 逐字为 We can easily see that Theorem f-thm3 contains Demailly's original formulation of the Nadel vanishing theorem (see fujino-matsumura Theorem 1.4) and Kollar's vanishing theorem (see kollar Theorem 2.1 (iii)) as special cases。因此 Kollár 与 Nadel 的原始陈述并不在本素材内，上面两小节引的式子属本稿按 f-thm3 假设代入后的验算，全部登记为读法；下面把代入过程给到公式级，位置串只指 f-thm3 自身的假设行 `main.tex:108-132`。

特例一（Kollár 一侧）。数据取法：$f: X \to Y$ 保持 f-thm3 的形状（$X$ 紧 Kähler、$Y$ 射影簇），取 $Y$ 上 ample 线丛 $L$ 与其光滑 Hermite 度量 $h_L$ 使 $\sqrt{-1}\Theta_{h_L}(L) \geq 0$，置

$$F := f^{*}L, \qquad h := f^{*}h_L,$$

则曲率按拉回交换（`main.tex:112-114` 的 $F$ 与 $h$ 就位）：

$$\sqrt{-1}\Theta_h(F) = f^{*}\sqrt{-1}\Theta_{h_L}(L).$$

再取 $H := L$ 与 $g := h_L$（`main.tex:115-117` 的 $H$ 与 $g$ 就位），两条假设在 $\varepsilon := 1$ 时同成立：

$$\sqrt{-1}\Theta_g(f^{*}H) = f^{*}\sqrt{-1}\Theta_{h_L}(L) \geq 0, \qquad \sqrt{-1}\Theta_h(F) - \varepsilon\sqrt{-1}\Theta_g(f^{*}H) = 0 \geq 0.$$

$h$ 光滑意味着局部权重 $\varphi$ 光滑，乘子理想层退化为 $\mathcal J(h) = \mathcal O_X$，于是 f-thm3 的结论式 `main.tex:126` 化为

$$H^{i}(Y, R^{j}f_{*}(\omega_X \otimes f^{*}L)) = 0 \quad \text{for every } i > 0 \text{ and } j,$$

即 Kollár 消没的形状（$L$ ample、系数为 $f^{*}L$、消没指标是 $Y$ 方向次数 $i > 0$）。

特例二（Nadel 一侧）。数据取法：$Y := X$、$f := \mathrm{id}_X$，取 $X$ 上 ample 线丛 $H$ 与光滑度量 $g$ 使

$$\omega := \sqrt{-1}\Theta_g(H)\ \text{为 Kähler 形式},$$

则 $f^{*}H = H$、$\sqrt{-1}\Theta_g(f^{*}H) = \omega$，f-thm3 的第二条假设 `main.tex:119-123` 变成

$$\sqrt{-1}\Theta_h(F) - \varepsilon\,\omega \geq 0 \quad \text{即}\quad \sqrt{-1}\Theta_h(F) \geq \varepsilon\,\omega,$$

正是 Nadel 型正曲率条件（$\varepsilon > 0$ 逐字来自 `main.tex:123`）。直接像侧：$\mathrm{id}_{X}$ 的任意阶直接像函子为恒等，故对系数层 $\mathcal G$ 有 $R^{j}(\mathrm{id}_{X})_{*}\mathcal G = 0$（$j > 0$）与 $R^{0}(\mathrm{id}_{X})_{*}\mathcal G = \mathcal G$。把 f-thm3 的结论按 $j$ 分栏：$j > 0$ 时左端恒为零，$j = 0$ 时化为

$$H^{i}(X, \omega_X \otimes F \otimes \mathcal J(h)) = 0 \quad \text{for every } i > 0,$$

即 Nadel 消没（允许 $h$ 带奇性、系数显式带 $\mathcal J(h)$）。

覆盖关系的读法：f-thm3 一次涵盖两条经典定理，靠的是假设里同时留有 $f$ 与 $\varepsilon$ 两个旋钮，前者管 Kollár 侧的纤维方向，后者管 Nadel 侧的奇度量强度。素材另在 `main.tex:141-142` 指向一条相关消没（matsumura 的 Theorem 1.3），未写其陈述，本稿不代述。

## 3 Fujino-Matsumura 注入定理（Theorem A）

主定理的直接前提是 Fujino-Matsumura 2016 预印本（`main.tex:311-314` bibitem `fujino-matsumura`）的 Theorem A，本文原封搬进引言。Theorem 1.1（`main.tex:59-79`，标签 `f-thm1`）设：

- $F$ 是紧 Kähler 流形 $X$ 上的全纯线丛，$h$ 是 $F$ 上的单数 Hermite 度量；
- $M$ 是 $X$ 上的全纯线丛，$h_M$ 是光滑 Hermite 度量；
- 存在常数 $a > 0$ 使 $\sqrt{-1} \Theta_{h_M}(M) \geq 0$ 且 $\sqrt{-1} \Theta_h(F) - a \sqrt{-1} \Theta_{h_M}(M) \geq 0$（都在当前意义）；
- $s \in H^0(X, M)$ 非零全局截面。

则逐点乘 $s$ 诱导的映射
$$\times s: H^i(X, \omega_X \otimes F \otimes \mathcal J(h)) \to H^i(X, \omega_X \otimes F \otimes \mathcal J(h) \otimes M)$$
对每个 $i$ 都是单射。

`main.tex:81-85` 说明这是 Enoki 1993（Lecture Notes in Pure and Appl. Math. 145, Dekker, "Einstein metrics and Yang-Mills connections (Sanda, 1990)", 59-68，`main.tex:292-297`）注入定理的推广。Enoki 的原始版本要求 $M$ nef 且带光滑半正度量、$F$ 半正，$s$ 非零时 $\otimes s$ 在 $H^i(X, \omega_X \otimes F \otimes M^k)$ 上的乘法单射；Fujino-Matsumura 允许 $F$ 带单数度量并把 $\mathcal J(h)$ 拉进系数层。这是本文主定理证明里"抽 $H^1$ 消没"的关键，见 §6 结尾。Remark 部分（`main.tex:269-279`）指出把 $\omega_X$ 换成 $\omega_X \otimes E$（$E$ Nakano 半正向量丛）时定理依然成立，细节留给读者按 `fujino-matsumura` 第 6 节。

原文在 `main.tex:83-85` 承认 Theorem 1.1 的表述"看起来做作"（formulation may look artificial），但正是这个"两个曲率条件 + 一个截面"的抽象形式让后续把 Kollár 型几何情形套进来成为纯代数推论。这一层设计哲学是 Fujino 系列论文（`main.tex:299-309` 的 fujino1/2/3 三篇综述与基础手册）的一贯主张：把 Hodge 理论消没重写成关于单度量的注入语句，再让 Bertini 型引理负责几何截面。

f-thm1 的假设逐字拆成四条，每条给盘面行号。第一条（`main.tex:60-62`）：$F$ 是紧 Kähler 流形 $X$ 上的全纯线丛，$h$ 是 $F$ 上的 singular hermitian metric。第二条（`main.tex:63-64`）：$M$ 是 $X$ 上的全纯线丛，配备 smooth hermitian metric $h_M$。第三条是曲率对（`main.tex:65-69`）：

$$\sqrt{-1}\Theta_{h_M}(M)\geq 0,\qquad \sqrt{-1}\Theta_h(F)-a\sqrt{-1}\Theta_{h_M}(M)\geq 0,\qquad a>0 .$$

正常数 $a$ 逐字挂在 `main.tex:69` 的 for some $a>0$ 上，素材没有给 $a$ 的任何归一化（不必 $\leq 1$，也不必 $<1$）。第四条（`main.tex:70`）：$s$ 是 $M$ 的非零整体截面，原文 Let $s$ be a nonzero global section of $M$。素材对这四项之外没有附加假设：没有要求 $s$ 的零点集光滑或约化，没有要求 $M$ 全局生成或 big，没有要求 $X$ 射影（只写 compact Kähler，`main.tex:61`），也没有要求 $F$ 或 $M$ 的曲率严格正。这四处沉默是本定理比经典 Nadel 型注入语句好用之处，属本稿读法。

结论式逐字（`main.tex:71-75`）：

$$\times s:\ H^{i}\bigl(X,\ \omega_X\otimes F\otimes \mathcal J(h)\bigr)\ \longrightarrow\ H^{i}\bigl(X,\ \omega_X\otimes F\otimes \mathcal J(h)\otimes M\bigr),$$

`main.tex:76` 同一句里给出两件事：映射由张量 $\otimes s$ 诱导（induced by $\otimes s$），量词是 injective for every $i$，即 $i$ 取遍全体上同调次数，素材未把 $i$ 限制在某个区间，也未排除 $i=0$。同句后半给记号：$\omega_X$ 是 $X$ 的 canonical bundle（`main.tex:77`），$\mathcal J(h)$ 是 $h$ 的 multiplier ideal sheaf（`main.tex:78`）。

曲率对的权重形翻译（本稿补写，位置串只指假设行 `main.tex:65-69`）。在 $U\subseteq X$ 上取 $F$ 与 $M$ 的局部平凡化，$h$ 与 $h_M$ 的局部权重记 $\varphi$ 与 $\psi$，则 $\sqrt{-1}\Theta_h(F)=\sqrt{-1}\partial\bar\partial\varphi$、$\sqrt{-1}\Theta_{h_M}(M)=\sqrt{-1}\partial\bar\partial\psi$，曲率对化为

$$\sqrt{-1}\partial\bar\partial\psi\geq 0,\qquad \sqrt{-1}\partial\bar\partial(\varphi-a\psi)\geq 0 \quad \text{on } U,$$

即 $\psi$ 与 $\varphi-a\psi$ 同时 psh.。这层翻译在 §7 处必须用一次：把 $M$ 换成 $M^{\otimes m}$、$h_M$ 换成 $h_M^{m}$ 时，局部权重从 $\psi$ 变为 $m\psi$，故

$$\sqrt{-1}\Theta_{h_M^{m}}(M^{\otimes m})=m\sqrt{-1}\Theta_{h_M}(M),\qquad \sqrt{-1}\Theta_h(F)-\frac{a}{m}\sqrt{-1}\Theta_{h_M^{m}}(M^{\otimes m})=\sqrt{-1}\Theta_h(F)-a\sqrt{-1}\Theta_{h_M}(M)\geq 0,$$

即幂次提升把 f-thm1 的容许常数从 $a$ 改成 $a/m$，形状不变。素材全篇没写这条幂次曲率公式，本稿按权重的线性算出，登记为补写。

素材在 `main.tex:83-85` 自己承认 This formulation may look artificial（逐字：Although the formulation of Theorem 1.1 may look artificial, it has many interesting applications，素材以标签 f-thm1 交叉引用该定理），并把应用交给 `fujino-matsumura`。`main.tex:81-82` 只声明 f-thm1 是 Enoki 注入定理（bibitem `enoki`，`main.tex:292-297`）的推广，素材内没有写出 Enoki 定理的任何陈述式；因此本稿 §3 第三段关于 Enoki 原始版本条件的叙述无法由本素材核对，属稿方旧文，登记在 §0 的取材边界里，本轮不改动。

## 4 乘子理想层的 Bertini 型定理

Theorem 1.2（`main.tex:89-101`，标签 `f-thm2`）也是从 Fujino-Matsumura 借来的工具，编号是那篇论文的 Theorem 1.10。陈述：$X$ 紧复流形，$\Lambda$ 是自由线性系（意味着没有不动点，$\varphi_\Lambda: X \to \mathbb P(\Lambda^*)$ 全纯），$\dim \Lambda \geq 1$，$\varphi$ 是 $X$ 上 q.psh. 函数。集合
$$\mathcal G = \{ H \in \Lambda : H \text{ 光滑且 } \mathcal J(\varphi|_H) = \mathcal J(\varphi)|_H \}$$
在 $\Lambda$ 的古典拓扑下稠密。

这个陈述的实质：一般超曲面上限制乘子理想层，与先限制再取乘子理想层一致。$\mathcal J(\varphi|_H) = \mathcal J(\varphi)|_H$ 是乘子理想层"与限制可交换"，是 MMP 文献里反复出现的性质；经典证明走 resolution of singularities 与 inversion of adjunction（Ein-Lazarsfeld 1997、de Fernex-Ein-Mustţă 2008 等）。Fujino-Matsumura 版把证明换成解析路径：$\bar{\partial}$ 估计 + 关于线性系参数 $t \in \Lambda$ 的隐函数微分，因此适用于 q.psh.（非代数）奇性。

$\mathcal G$ 稠密在本文证明里的直接用处是：从 $|H^{\otimes m}|$（$H$ 是 $Y$ 上 ample）取一般 $B$，其原像 $D = f^{-1}(B)$ 同时满足：光滑、包含 $\mathcal O_X / \mathcal J(h)$ 的素子（associated primes）以外、$\mathcal J(h|_D) = \mathcal J(h)|_D$。这三条正是 §6 里交换图 $\beta$ 单、$\gamma$ 单、最右列 $\operatorname{Coker} \alpha \cong \mathcal J(h|_D)$ 三个箭头成立的理由，见 `main.tex:156-190`。

`main.tex:144` 一句"In this paper, we will freely use the same notation as in O. Fujino, S. Matsumura（`main.tex:311-314` bibitem）"说明本文把符号约定完全交给那篇论文；本稿按 §0 的映射把 $\mathcal J, \mathcal O, \omega_X, \Theta$ 等统一到 KaTeX 认得的形态，不再引入新记号。

f-thm2 的假设逐字三条（`main.tex:89-93`）：$X$ 是 compact complex manifold（素材此处只写紧复流形，没有 Kähler 要求，也没有射影要求，对比 `main.tex:61` 与 `main.tex:110` 的 Kähler 措辞）；$\Lambda$ 是 $X$ 上的 free linear system 且 $\dim\Lambda\geq 1$（`main.tex:90-91`）；$\varphi$ 是 $X$ 上的 quasi-plurisubharmonic 函数（`main.tex:91-92`）。集合式逐字（`main.tex:95-98`）：

$$\mathcal G=\{\,H\in\Lambda \mid H\ \text{是光滑的且}\ \mathcal J(\varphi|_H)=\mathcal J(\varphi)|_H\,\}.$$

素材原文在集合符里用 `|\,` 作分隔并把等式嵌进 `\text{}` 中，本稿按 KaTeX 写作 `\mid` 并把两条成员条件拆开放在散文里：第一条是 $H$ smooth，第二条是乘子理想层与限制交换。结论（`main.tex:98`）：Then $\mathcal G$ is dense in $\Lambda$ in the classical topology，即稠密性取在 $\Lambda$ 的经典（欧氏）拓扑上；素材没有说明 $\Lambda$ 按向量空间还是按其射影化来拓扑，本稿按向量空间读（本稿读法）。记号句（`main.tex:99-100`）声明 $\mathcal J(\varphi)$ 是 $\varphi$ 的 multiplier ideal sheaf，即由局部可积性

$$\mathcal J(\varphi)_x=\{\,g\in\mathcal O_{X,x}\mid \text{存在 } x \text{ 的邻域 } V \text{ 使 } \int_V \lvert g\rvert^{2}e^{-\varphi}\,dV<\infty\,\}$$

定义的层（此式为 §1 的层定义在 q.psh. 函数一侧的改写，属本稿补写，素材不给）。

free linear system 素材未定义（`main.tex:90-91` 只用词组）。本稿按标准读法补一条等价式：$\Lambda$ 自由当且仅当求值同态

$$\Lambda\otimes_{\mathbb C}\mathcal O_X\longrightarrow \mathcal L,\qquad \mathcal L=\text{与 } \Lambda \text{ 相伴的线丛}$$

满，即基点集为空；此时 $\Lambda$ 决定全纯映射 $\operatorname{ev}:X\to\mathbb P(\Lambda^{*})$，$\Lambda$ 的成员是超平面原像。登记不发明：素材没有 $\mathcal L$、没有 $\operatorname{ev}$，本稿也不替它补性质。

两条限制式的区分（本稿读法，用于 §6 的第三条件）。$\mathcal J(\varphi)|_H$ 指层的限制 $\mathcal J(\varphi)\otimes_{\mathcal O_X}\mathcal O_H$，$\mathcal J(\varphi|_H)$ 指把 $\varphi$ 限制到光滑超曲面 $H$ 后所得 q.psh. 函数的乘子理想层。沿 $H$ 的切片积分性给出恒有包含

$$\mathcal J(\varphi)|_H\ \subseteq\ \mathcal J(\varphi|_H),$$

f-thm2 的实质是对一般成员反向包含成立，从而两层相等。素材没有写这条恒含包含，登记为补写。

记号碰撞两处（本稿登记）。其一：f-thm2 里的 $H$ 是线性系的一条成员（除子），f-thm3 里的 $H$ 是 $Y$ 上的 ample 线丛（`main.tex:115`），两者同字母不同对象，本稿每次引用都带行号。其二：本稿 §2 在 $R^{j}(\mathrm{id}_{X})_{*}\mathcal G$ 处把 $\mathcal G$ 用作一般系数层的临时记号，与素材 f-thm2 的稠密子集 $\mathcal G$（`main.tex:96`）无关。

## 5 Kollár-Nadel 型消没定理陈述与两种特例

主定理是 Theorem 1.3（`main.tex:108-132`，标签 `f-thm3`）。原文的完整假设：

- $f: X \to Y$ 是全纯映射，$X$ 紧 Kähler 流形，$Y$ 射影簇；
- $F$ 是 $X$ 上的全纯线丛，带单数 Hermite 度量 $h$；
- $H$ 是 $Y$ 上的 ample 线丛；
- $f^* H$ 上存在光滑 Hermite 度量 $g$ 使 $\sqrt{-1} \Theta_g(f^* H) \geq 0$；
- 存在 $\varepsilon > 0$ 使 $\sqrt{-1} \Theta_h(F) - \varepsilon \sqrt{-1} \Theta_g(f^* H) \geq 0$。

结论：
$$H^i(Y, R^j f_*(\omega_X \otimes F \otimes \mathcal J(h))) = 0 \quad \text{对所有 } i > 0 \text{ 和所有 } j.$$

`main.tex:134-140` 一句带过两个特例：把 $h$ 取光滑正度量、$F = f^* L$（$L$ 是 $Y$ 上 ample），$\mathcal J(h) = \mathcal O_X$，得到 Kollár 消没；$Y$ 取点、$f$ 常值映射，得到 Nadel（Demailly 型）消没。写手把这两条特例的验算补在这里：

- Kollár 特例：$F = f^* L$，$h = g^k$（$L$ 的足够幂的正度量提升），$\sqrt{-1} \Theta_h(F) = \sqrt{-1} \Theta_{g}(f^* L)$，与 $\sqrt{-1} \Theta_g(f^* H)$ 都是半正；$\varepsilon$ 足够小使 $L \geq \varepsilon H$ 在 Neron-Severi 意义下成立即可。此时 $\mathcal J(h) = \mathcal O_X$，主式化简为 Kollár 陈述。
- Nadel 特例：$Y$ 一点，$f: X \to \mathrm{pt}$，$R^j f_* = H^j(X, \cdot)$ 视为常数层，$H^i(Y, -) = \delta_{i0} \cdot H^0(Y, -) = \delta_{i0} \cdot (\cdot)$。等等，$i > 0$ 那侧 $H^i(\mathrm{pt}, -) = 0$ 自动；因此要真正得到 Nadel，需要把 $f = \mathrm{id}_X$、$Y = X$、$H$ 换成任意 ample 与 $g$ 半正度量。取 $\varepsilon$ 与 $g$ 让 $\sqrt{-1} \Theta_g(f^* H) \geq \omega$（$\omega$ 是某 Kähler 形式），$\sqrt{-1} \Theta_h(F) \geq \varepsilon \omega$，即 Demailly 型 Nadel。$R^j f_* = 0$（$j > 0$）、$R^0 f_* \mathcal F = \mathcal F$（$f = \mathrm{id}$），主式退化为 $H^i(X, \omega_X \otimes F \otimes \mathcal J(h)) = 0, i > 0$。

`main.tex:103-106` 强调本文主定理是 `fujino-matsumura` 的 Theorem D 的"轻微推广"（slight generalization），差别就在允许 $\mathcal J(h)$ ，并非要求 $h$ 光滑，且把"$X$ 光滑、$Y$ 射影"这一对放宽到"$X$ 紧 Kähler、$Y$ 射影簇"。

f-thm3 的假设链逐字五条，逐条给行号与量词。第一条（`main.tex:109-111`）：$f:X\to Y$ 是全纯映射，源 $X$ 是 compact Kähler manifold，靶 $Y$ 是 projective variety；素材没有要求 $f$ 满、没有要求 $f$ 光滑、没有要求 $Y$ 光滑，也没要求 $X$ 射影。第二条（`main.tex:112-114`）：$F$ 是 $X$ 上的全纯线丛，配备 singular hermitian metric $h$。第三条（`main.tex:115`）：$H$ 是 $Y$ 上的 ample line bundle。第四条（`main.tex:116-117`）：存在 $f^{*}H$ 上的 smooth hermitian metric $g$。第五条（`main.tex:118-123`）是曲率对与它携带的正常数：

$$\sqrt{-1}\Theta_g(f^{*}H)\geq 0,\qquad \sqrt{-1}\Theta_h(F)-\varepsilon\sqrt{-1}\Theta_g(f^{*}H)\geq 0,\qquad \varepsilon>0 .$$

第四条与第五条把 $\varepsilon$ 只声明为存在（for some $\varepsilon>0$，`main.tex:123`），没有下界；$g$ 只要求半正而不要求正，这两处是 f-thm3 相对 Kodaira 型陈述的宽松之处（本稿读法）。结论式（`main.tex:124-128`）：

$$H^{i}\bigl(Y,\ R^{j}f_{*}(\omega_X\otimes F\otimes \mathcal J(h))\bigr)=0\quad \text{for every } i>0 \text{ and } j,$$

量词逐字为 for every $i>0$ and $j$（`main.tex:128`）：素材只约束 $i$ 的正性，对 $j$ 不设上界，即结论同时涵盖全部高阶直接像；$j$ 超出 $\dim X$ 时 $R^{j}f_{*}=0$ 本已成立，素材未谈（`main.tex:129-131` 只补记号 $\omega_X$ 与 $\mathcal J(h)$）。命名句在 `main.tex:139-140`：we call Theorem 1.3 the vanishing theorem of Kollár--Nadel type（素材以标签 f-thm3 交叉引用）。

数据对齐表（本稿补写，供 §7 的 $\beta$ 使用）。f-thm1 需要六件数据 $(X,F,h,M,h_M,a,s)$，f-thm3 提供 $(X,Y,f,F,h,H,g,\varepsilon)$，§6 另给整数 $m\gg 1$ 与 $B\in\lvert H^{\otimes m}\rvert$ 及其定义截面 $\sigma\in H^{0}(Y,H^{\otimes m})$。对位如下：$X$ 不变、$F$ 不变、$h$ 不变，而

$$M:=f^{*}H^{\otimes m},\qquad h_M:=g^{m},\qquad a:=\frac{\varepsilon}{m},\qquad s:=f^{*}\sigma\in H^{0}(X,f^{*}H^{\otimes m}),$$

$\sqrt{-1}\Theta_{g^{m}}(f^{*}H^{\otimes m})=m\sqrt{-1}\Theta_{g}(f^{*}H)\geq 0$ 给出 f-thm1 的第一条假设，$\sqrt{-1}\Theta_h(F)-(\varepsilon/m)\cdot m\sqrt{-1}\Theta_g(f^{*}H)=\sqrt{-1}\Theta_h(F)-\varepsilon\sqrt{-1}\Theta_g(f^{*}H)\geq 0$ 给出第二条，$s$ 非零因 $\sigma$ 定义非零除子 $B$。素材在 `main.tex:255` 只写 Since $\beta$ is injective by Theorem 1.1，上述对位与幂次曲率式都没写出来，全部登记为本稿补写。

## 6 证明主线：对 $\dim Y$ 归纳与两层正合列

证明在 `main.tex:153-267`，全部 115 行。骨架是对 $\dim Y$ 归纳。$\dim Y = 0$ 时 $Y$ 是有限点集，$H^i(Y, -) = 0$ 对 $i > 0$ 显然。设 $\dim Y \geq 1$，取充分大正整数 $m$ 与 $|H^{\otimes m}|$ 一般成员 $B$，令 $D = f^{-1}(B)$。$m$ 与 $B$ 的选取通过三条：

1. $D$ 光滑，$B$ 避开临界值集，$f$ 沿 $D$ 横截。这靠 Bertini 定理（$H$ ample 提供 embedding 后取一般超平面）。
2. $D$ 不包含 $\mathcal O_X / \mathcal J(h)$ 的任何 associated prime。这是有限集条件，同样在一般性里得到。
3. $\mathcal J(h|_D) = \mathcal J(h)|_D$。这条靠 §4 的 Bertini 型定理（Theorem 1.2）。

同时用 Serre 消没（`main.tex:162-167`）加强条件：把 $m$ 再放大使得
$$H^i(Y, R^j f_*(\omega_X \otimes F \otimes \mathcal J(h)) \otimes H^{\otimes m}) = 0 \quad \text{对 } i > 0, \text{ 所有 } j.$$
记作式 (2.1)（`main.tex:163-166`）。这条是收 $i \geq 2$ 时的直接消没，也是最后 $i = 1$ 的靶子。

`main.tex:168-185` 画一个大交换图（`xymatrix`）。写手按行拆开：

- 中层横行：$0 \to \mathcal J(h) \otimes \mathcal O_X(-D) \xrightarrow{\alpha} \mathcal J(h) \to \operatorname{Coker} \alpha \to 0$；下面一行是 $0 \to \mathcal O_X(-D) \to \mathcal O_X \to \mathcal O_D \to 0$；$\alpha$ 由 $\mathcal J(h) \otimes \mathcal O_X(-D) \subseteq \mathcal J(h)$ 自然包含（乘 $D$ 定义截面 $\mathcal O_X(-D) \hookrightarrow \mathcal O_X$）。
- 上层两列：$0$ 到 $0$（第一列第一格与最后一格皆零）。
- 下层：$0 \to (\mathcal O_X / \mathcal J(h)) \otimes \mathcal O_X(-D) \xrightarrow{\gamma} \mathcal O_X / \mathcal J(h) \to 0$，最后一列的映射 $\beta: \operatorname{Coker} \alpha \to \mathcal O_D$。

蛇形引理（`main.tex:188-190`）：因 $D$ 不包含 $\mathcal O_X / \mathcal J(h)$ 的 associated prime，$\gamma$ 单射；于是 $\beta$ 单射，$\operatorname{Coker} \alpha \cong \mathcal J(h)|_D$。加上 §4 的第三条即 $\operatorname{Coker} \alpha \cong \mathcal J(h|_D)$。

由此得正合列（`main.tex:191-195`）
$$0 \to \mathcal J(h) \otimes \mathcal O_X(-D) \to \mathcal J(h) \to \mathcal J(h|_D) \to 0.$$
把它与 $\omega_X \otimes F \otimes \mathcal O_X(D)$ 作张量积（即把 $\mathcal O_X(-D)$ 消掉、右边乘 $\mathcal O_X(D)|_D$），并用伴随公式 $\omega_X \otimes \mathcal O_X(D)|_D \cong \omega_D$：
$$0 \to \omega_X \otimes F \otimes \mathcal J(h) \to \omega_X \otimes F \otimes \mathcal J(h) \otimes f^* H^{\otimes m} \to \omega_D \otimes F|_D \otimes \mathcal J(h|_D) \to 0$$
（`main.tex:199-203`）。$f|_D: D \to B$，$B \in |H^{\otimes m}|$ 是 $Y$ 上 Cartier 除子（$H$ ample 故 $B$ 射影簇，$H^{\otimes m}|_B$ 是 $B$ 上 ample 的），把上式在 $f_*$ 下推出 $Y$ 上层的正合列：
$$0 \to R^j f_*(\omega_X \otimes F \otimes \mathcal J(h)) \to R^j f_*(\omega_X \otimes F \otimes \mathcal J(h)) \otimes H^{\otimes m} \to R^j (f|_D)_*(\omega_D \otimes F|_D \otimes \mathcal J(h|_D)) \to 0,$$
即 `main.tex:205-212` 的式 (2.2)。这里 $R^j (f|_D)_*$ 记在 $B$ 上、与 $R^j f_*$ 限制到 $B$ 一致，$B$ 是 $Y$ 上 Cartier 除子所以 $H^{\otimes m}$ 平坦，长正合列的 $R^j$ 侧保持正合。

证明前半的逐字骨架（本稿按行拆开 `main.tex:153-214`）。归纳句与起点（`main.tex:154-155`）：逐字为 We use the induction on $\dim Y$ 与 If $\dim Y=0$, then the statement is obvious。本稿把这一步写成式：$\dim Y=0$ 时 $Y$ 是有限点集，任何层 $\mathcal H$ 满足 $H^{i}(Y,\mathcal H)=0$（$i>0$），故结论对全部 $j$ 成立。三条件句（`main.tex:156-161`）逐字为 take a sufficiently large positive integer $m$ and a general member $B\in\lvert H^{\otimes m}\rvert$ such that $D=f^{-1}(B)$ is smooth，contains no associated primes of $\mathcal O_X/\mathcal J(h)$，and satisfies $\mathcal J(h|_D)=\mathcal J(h)|_D$ by Theorem 1.2（素材以标签 f-thm2 指代该定理）。第二条的算子化读法（本稿补写）：记 $\operatorname{Ass}(\mathcal O_X/\mathcal J(h))=\{\mathfrak p_1,\dots,\mathfrak p_k\}$，$D$ 不含任何 $\mathfrak p_\nu$ 的一般点，等价于局部化处

$$(\mathcal O_X/\mathcal J(h))_{\mathfrak p}\longrightarrow (\mathcal O_X/\mathcal J(h))_{\mathfrak p}\otimes_{\mathcal O_{X,\mathfrak p}}\mathcal O_{D,\mathfrak p}$$

对每个 $\mathfrak p\in\operatorname{Ass}(\mathcal O_X/\mathcal J(h))$ 仍单，这正是下图 $\gamma$ 单（`main.tex:186-187`）的理由。第三条来自 f-thm2，但 f-thm2 陈述在 $X$ 上的自由线性系与一个 q.psh. 函数 $\varphi$ 上，而本文此处只有带奇度量 $h$：本稿读作把 f-thm2 作用在 $F$ 的平凡化邻域内的局部权重上（$\mathcal J$ 的等式本身是局部语句），素材没有写出这层运输，登记为省略。

大交换图的逐行清单（`main.tex:169-185`，`xymatrix`）。顶行（`main.tex:171`）是两个带下竖箭的 $0$。第二行（`main.tex:172-176`）

$$0\to \mathcal J(h)\otimes\mathcal O_X(-D)\xrightarrow{\ \alpha\ }\mathcal J(h)\to \operatorname{Coker}\alpha\to 0,$$

第三行（`main.tex:177-179`）

$$0\to \mathcal O_X(-D)\to \mathcal O_X\to \mathcal O_D\to 0,$$

第四行（`main.tex:180-182`）

$$\bigl(\mathcal O_X/\mathcal J(h)\bigr)\otimes\mathcal O_X(-D)\xrightarrow{\ \gamma\ }\mathcal O_X/\mathcal J(h),$$

底行（`main.tex:183`）又是两个 $0$。竖箭 $\beta$ 标在 `main.tex:176` 的 xy-pic 原语 `\ar[d]^{\beta}` 处，即 $\beta:\operatorname{Coker}\alpha\to\mathcal O_D$，来自第二行右端与第三行右端的自然映射。蛇形引理句逐字（`main.tex:186-190`）：由于 $D$ 不含 $\mathcal O_X/\mathcal J(h)$ 的 associated primes，$\gamma$ 单；This implies that $\beta$ is injective by the snake lemma and that $\operatorname{Coker}\alpha=\mathcal J(h)|_D=\mathcal J(h|_D)$。素材这里用等号串写两层等同，严格说 $\operatorname{Coker}\alpha\to\mathcal J(h)|_D$ 是经由 $\beta$ 的像的辨认，第二个等号即第三条件（本稿读法）。

张量与伴随的中间式（`main.tex:196-198` 只写 By taking $\otimes\omega_X\otimes F\otimes\mathcal O_X(D)$ and using adjunction，三条逐项计算素材没写，本稿补）：

$$\bigl(\mathcal J(h)\otimes\mathcal O_X(-D)\bigr)\otimes\bigl(\omega_X\otimes F\otimes\mathcal O_X(D)\bigr)\cong\omega_X\otimes F\otimes\mathcal J(h),$$

$$\mathcal J(h)\otimes\bigl(\omega_X\otimes F\otimes\mathcal O_X(D)\bigr)\cong\omega_X\otimes F\otimes\mathcal J(h)\otimes f^{*}H^{\otimes m},$$

$$\mathcal J(h|_D)\otimes\bigl(\omega_X\otimes F\otimes\mathcal O_X(D)\bigr)\bigr|_D\cong\omega_D\otimes F|_D\otimes\mathcal J(h|_D),$$

其中用了 $\mathcal O_X(D)=f^{*}\mathcal O_Y(B)=f^{*}H^{\otimes m}$（$\sigma$ 定义 $B$，故 $\mathcal O_Y(B)\cong H^{\otimes m}$）与伴随公式 $\omega_X\otimes\mathcal O_X(D)\bigr|_D\cong\omega_D$；$\mathcal O_X(-D)\otimes\mathcal O_X(D)\cong\mathcal O_X$ 给出第一行。

(2.2) 的正合性一句（`main.tex:213-214`）逐字为 is exact for every $j$ since $B$ is a general member of $\lvert H^{\otimes m}\rvert$。从 $X$ 上的短正合列经 $f_{*}$ 只能得到长正合列，故 (2.2) 在 $R^{j}$ 层写作短正合，等价于连接同态

$$\delta_j:\ R^{j}f_{*}\bigl(\omega_D\otimes F|_D\otimes\mathcal J(h|_D)\bigr)\longrightarrow R^{j+1}f_{*}\bigl(\omega_X\otimes F\otimes\mathcal J(h)\bigr)$$

对每个 $j$ 为零。素材没有给出 $\delta_j=0$ 的论证，只用一句一般性交代；本稿登记此处为省略，并指出 §7 使用 (2.2) 时只消费它的正合性，不消费 $\delta_j$ 的来源。

## 7 长正合、Leray 谱序列与 $H^1$ 消没收尾

`main.tex:215-235` 用归纳假设与式 (2.2) 抽出 $i \geq 2$。式 (2.2) 关于 $B$ 层的上同调给出长正合列。归纳假设：$B \subsetneq Y$（Cartier 除子，$\dim B = \dim Y - 1$），$f|_D: D \to B$，$D$ 是紧 Kähler（作为 $X$ 的光滑除子），$B$ 是射影簇；把主定理套到 $(f|_D, D, F|_D, h|_D, H|_B^{\otimes m})$，得
$$H^i(B, R^j (f|_D)_*(\omega_D \otimes F|_D \otimes \mathcal J(h|_D))) = 0, \quad i > 0, \text{ 所有 } j.$$
这是 `main.tex:215-220` 的式 (2.3)。

对式 (2.2) 走 $B$ 的长正合，用式 (2.1)（$Y$ 上的 Serre 消没）与式 (2.3)（$B$ 上的归纳消没）合并得：对 $i \geq 2$，
$$H^i(Y, R^j f_*(\omega_X \otimes F \otimes \mathcal J(h))) \cong H^i(Y, R^j f_*(\omega_X \otimes F \otimes \mathcal J(h)) \otimes H^{\otimes m}),$$
即 `main.tex:223-230`；再由式 (2.1) 右边 $= 0$（$i \geq 2 > 0$），故 $i \geq 2$ 全消，`main.tex:232-235` 的式 (2.4)。

剩下 $i = 1$ 需要注入定理。`main.tex:236-254` 借 Leray 谱序列 $H^p(Y, R^q f_* \mathcal F) \Rightarrow H^{p+q}(X, \mathcal F)$，$\mathcal F = \omega_X \otimes F \otimes \mathcal J(h)$。$i \geq 2$ 的消没把谱序列的五项正合列退化为 $p = 1, q = j$ 处的交换图（`main.tex:240-250` 的 `xymatrix`）：
$$
\begin{CD}
H^1(Y, \mathcal F^j) @>>> H^{j+1}(X, \omega_X \otimes F \otimes \mathcal J(h)) \\
@V{\alpha}VV @VV{\beta}V \\
H^1(Y, \mathcal F^j \otimes H^{\otimes m}) @>>> H^{j+1}(X, \omega_X \otimes F \otimes \mathcal J(h) \otimes f^* H^{\otimes m})
\end{CD}
$$
其中 $\mathcal F^j = R^j f_*(\omega_X \otimes F \otimes \mathcal J(h))$，横箭是谱序列 $d_2$ 之前的自然映射，写成单射（`main.tex:253` "Note that the horizontal arrows are injective"）。$\beta$ 就是 §3 的 Theorem 1.1（注入定理）在 $M = f^* H^{\otimes m}$、$s$ 为 $H^{\otimes m}$ 沿 $B$ 的典范截面（$B$ 是 Cartier 除子，$s \in H^0(Y, H^{\otimes m})$ 定义它）、$a = 1 / m$（因 $\sqrt{-1} \Theta_{h}(F) - \varepsilon \sqrt{-1} \Theta_g(f^* H) \geq 0$ 可写成 $\sqrt{-1} \Theta_h(F) - (\varepsilon / m) \sqrt{-1} \Theta_{g^m}(f^* H^{\otimes m}) \geq 0$）下的实例。因此 $\beta$ 单射，交换图迫使 $\alpha$ 单射。

`main.tex:257-265` 收尾：由式 (2.1)，$H^1(Y, \mathcal F^j \otimes H^{\otimes m}) = 0$ 对每个 $j$，$\alpha$ 单射给出 $H^1(Y, \mathcal F^j) = 0$。合上 $i \geq 2$ 的 (2.4)，主定理的 $H^i(Y, \mathcal F^j) = 0$（$i > 0$ 所有 $j$）全部得证。

收工段的逐式链条（本稿按 `main.tex:215-266` 拆开）。归纳假设的数据核对（素材在 `main.tex:215` 只写 By induction on $\dim Y$，核对全在本稿）：$B\in\lvert H^{\otimes m}\rvert$ 是 ample 线性系的一般成员，故 $B$ 为射影簇、$\dim B=\dim Y-1$；$D=f^{-1}(B)$ 光滑，作为紧 Kähler 流形 $X$ 的光滑复超曲面带诱导 Kähler 形式，故 $D$ 紧 Kähler；把 f-thm3 的五条假设逐一搬过去：

$$f:=f|_D:D\to B,\qquad F:=F|_D,\qquad h:=h|_D,$$

$$H_B:=H^{\otimes m}\bigl|_B\ \text{在 } B \text{ 上 ample},\qquad g_B:=g\bigl|_{(f|_D)^{*}H_B},$$

$g_B$ 光滑且

$$\sqrt{-1}\Theta_{g_B}\bigl((f|_D)^{*}H_B\bigr)=\bigl(m\sqrt{-1}\Theta_{g}(f^{*}H)\bigr)\bigr|_{D}\geq 0,$$

$$\sqrt{-1}\Theta_{h|_D}(F|_D)-\varepsilon\sqrt{-1}\Theta_{g_B}\bigl((f|_D)^{*}H_B\bigr)=\bigl(\sqrt{-1}\Theta_h(F)-\varepsilon\sqrt{-1}\Theta_g(f^{*}H)\bigr)\bigr|_{D}\geq 0,$$

两条曲率假设按限制仍成立（同一 $\varepsilon$），f-thm3 对 $(f|_D,D,B,F|_D,h|_D,H_B,g_B,\varepsilon)$ 可用，得 (2.3)：

$$H^{i}\bigl(B,\ R^{j}f_{*}(\omega_D\otimes F|_D\otimes \mathcal J(h|_D))\bigr)=0\quad\text{for every } i>0 \text{ and } j$$

（`main.tex:216-220` 逐字；此处 $R^{j}f_{*}$ 仍写作 $f$，实际像映射是 $f|_D:D\to B$，见 §6 的记号登记）。

(2.2) 的长正合与 $i\geq 2$ 的等式（`main.tex:221-230`）。把 (2.2) 记作 $Y$ 上的短正合列 $0\to\mathcal F^{j}\to\mathcal F^{j}\otimes H^{\otimes m}\to\mathcal F^{j}_{B}\to 0$，其中 $\mathcal F^{j}_{B}:=R^{j}f_{*}(\omega_D\otimes F|_D\otimes \mathcal J(h|_D))$ 视为 $Y$ 上支撑在 $B$ 的层，长正合列的一段是

$$H^{i-1}(Y,\mathcal F^{j}_{B})\longrightarrow H^{i}(Y,\mathcal F^{j})\longrightarrow H^{i}(Y,\mathcal F^{j}\otimes H^{\otimes m})\longrightarrow H^{i}(Y,\mathcal F^{j}_{B}),$$

右端项 $\mathcal F^{j}_{B}$ 是闭浸入 $\iota:B\hookrightarrow Y$ 下的推出 $\iota_{*}$ 像，而 $\iota_{*}$ 正合且 $R^{q}\iota_{*}=0$（$q>0$），故有

$$H^{i}(Y,\mathcal F^{j}_{B})\cong H^{i}(B,\mathcal F^{j}_{B}),$$

按 (2.3)，$i\geq 2$ 时 $i-1\geq 1$ 与 $i$ 都落在正次数区间，上下两项皆零，中间那条同态于是是同构；素材在 `main.tex:223-230` 把这一同构直接写作等号

$$H^{i}\bigl(Y,\ R^{j}f_{*}(\omega_X\otimes F\otimes \mathcal J(h))\bigr)=H^{i}\bigl(Y,\ R^{j}f_{*}(\omega_X\otimes F\otimes \mathcal J(h))\otimes H^{\otimes m}\bigr)$$

for every $i\geq 2$ and $j$ by (2.3)。再套 (2.1)（`main.tex:163-166`，$i>0$ 即含 $i\geq 2$）右端为零，得 (2.4)：

$$H^{i}\bigl(Y,\ R^{j}f_{*}(\omega_X\otimes F\otimes \mathcal J(h))\bigr)=0\quad\text{for every } i\geq 2 \text{ and } j$$

（`main.tex:232-235`）。

Leray 谱序列一侧的推导（本稿补写，素材在 `main.tex:236-254` 只给图与一句 Note that the horizontal arrows are injective）。谱序列为

$$E_2^{p,q}=H^{p}\bigl(Y,\ R^{q}f_{*}(\omega_X\otimes F\otimes \mathcal J(h))\bigr)\ \Longrightarrow\ H^{p+q}\bigl(X,\ \omega_X\otimes F\otimes \mathcal J(h)\bigr),$$

微分 $d_r:E_r^{p,q}\to E_r^{p+r,\,q-r+1}$。由 (2.4)，$E_2^{p,q}=0$ 对 $p\geq 2$ 成立，故总次数 $j+1$ 的过滤化只余 $p=0$ 与 $p=1$ 两列：

$$E_{\infty}^{1,j}\subseteq H^{j+1}(X,\ \cdot),\qquad E_2^{1,j}=E_{\infty}^{1,j},$$

$E_2^{1,j}\to E_{\infty}^{1,j}$ 之所以是同构，因为从 $E_r^{1,j}$ 出发的 $d_r$ 落到第一指标 $1+r\geq 3$ 的列（已由 (2.4) 消没），进入 $E_r^{1,j}$ 的 $d_r$ 来自第一指标 $1-r\leq -1$ 的列（本为零）。于是边缘同态

$$H^{1}\bigl(Y,\ \mathcal F^{j}\bigr)\hookrightarrow H^{j+1}\bigl(X,\ \omega_X\otimes F\otimes \mathcal J(h)\bigr)$$

单，这正是图里两条横箭的来处（下横箭同理，把系数换成 $\otimes H^{\otimes m}$ 后由 (2.1) 给出 $p\geq 2$ 的消没）。

$\beta$ 侧的注入定理代入：按 §5 末尾的数据对位 $M=f^{*}H^{\otimes m}$、$h_M=g^{m}$、$a=\varepsilon/m$、$s=f^{*}\sigma$，f-thm1 在指标 $i=j+1$ 处的结论式

$$\times s:\ H^{j+1}\bigl(X,\omega_X\otimes F\otimes \mathcal J(h)\bigr)\hookrightarrow H^{j+1}\bigl(X,\omega_X\otimes F\otimes \mathcal J(h)\otimes f^{*}H^{\otimes m}\bigr)$$

与图的右竖箭逐字相同（`main.tex:242-248` 的右列两组），故 $\beta$ 单（`main.tex:255`）。交换图给出 $\alpha$ 单。素材此处有一处可核对的形状：图的左下角群 $H^{1}(Y,\mathcal F^{j}\otimes H^{\otimes m})$ 按 (2.1) 取 $i=1$ 已经为零，`main.tex:257-262` 又把这条消没重新写一遍作为 $\alpha$ 单推出 $H^{1}(Y,\mathcal F^{j})=0$ 的前提（`main.tex:263-265`），即该图下行的单射标记在逻辑上已被 (2.1) 吞掉；本稿按素材的写法照录，登记此点为 redundancy（`main.tex:258-261` 的不编号式逐字为 $H^{1}(Y,R^{j}f_{*}(\omega_X\otimes F\otimes \mathcal J(h))\otimes H^{\otimes m})=0$）。收束句 `main.tex:266`：Thus we obtain the desired vanishing theorem: Theorem 1.3。

证明之后一条 Remark（`main.tex:272-279`，环境为不编号 `rem`，内部标签 f-rem2.1）。逐字假设与结论：$E$ 是 $X$ 上的 Nakano semipositive vector bundle（`main.tex:273-274`），则 f-thm3 在把 $\omega_X$ 换成 $\omega_X\otimes E$ 后仍成立（`main.tex:275-276`），即

$$H^{i}\bigl(Y,\ R^{j}f_{*}(\omega_X\otimes E\otimes F\otimes \mathcal J(h))\bigr)=0\quad\text{for every } i>0 \text{ and } j,$$

细节留给读者（`main.tex:277-278`，指向 `fujino-matsumura` 第 6 节）。本稿把这条换成式的代价摊开：证明链上有三处消费 $\omega_X$，其一 (2.1) 的 Serre 消没（系数层整体换成带 $E$ 的版本，不受影响），其二伴随公式 $\omega_X\otimes\mathcal O_X(D)\bigr|_D\cong\omega_D$ 需换成 $(\omega_X\otimes E)\otimes\mathcal O_X(D)\bigr|_D\cong\omega_D\otimes E|_D$，其三 $\beta$ 处的注入定理需 f-thm1 的 $\omega_X\otimes E$ 版本。第二处需要 $E|_D$ 仍是同类半正对象，素材与 `main.tex:275` 的 We can easily see 都没有处理限制步，本稿登记此处为素材留下的练习。

## 8 与本语料的接缝

`main.tex:269-279` 的 Remark 8.1 把 $\omega_X$ 换成 $\omega_X \otimes E$（$E$ 是 $X$ 上 Nakano 半正向量丛）时主定理仍成立，细节留给读者按 `fujino-matsumura` 第 6 节。这一步骤的实质：注入定理 Theorem 1.1 在 `fujino-matsumura` 版本里对 $\omega_X \otimes E$ 也成立，Kollár 型归纳的交换图与伴随公式仅把 $\omega_X$ 替换为 $\omega_X \otimes E$，$E|_D$ 依然 Nakano 半正（Nakano 半正在光滑子丛下限制保持）。因此长正合与 Leray 图完全照搬，$\beta$ 依然单射。

致谢在 `main.tex:281-288`：作者受 JSPS 三项资助 Grant-in-Aid for Young Scientists (A) 24684002、Scientific Research (S) 16H06337、Scientific Research (B) 16H03925；感谢松本真一（Shin-ichi Matsumura）的建议让 Theorem 1.3 优于原始表述。

参考文献共 7 条（`main.tex:291-324`）：Enoki 1993（Kawamata-Viehweg 消没之 Kähler 版）、Fujino 三篇综述 `fujino1/2/3`（消没、注入、MMP 基础）、Fujino-Matsumura 2016（注入定理主源，本文工具全在此）、Kollár 1986（Ann. of Math. 123 原文）、Matsumura 2016（Kollár-Ohsawa 型消没）。

本语料以 bib key `Fujino2018` 引本稿的稿号共五处：D305、D385、D447、D451、D471。写手不去读这些稿，本节只登记派单信息并给 C 稿侧的记号读法。

- 记号读法：C 稿里出现的 $\mathcal J(h)$（乘子理想层）、$\mathcal O_X$（结构层）、$\omega_X$（典范层）、$\sqrt{-1} \Theta_h(F)$（曲率当前形式）、$R^j f_*$（高次直接像）、$H^i(Y, \cdot)$（Zariski 上同调）都按 §0 与 §1 的映射读；$\operatorname{Coker}$ 用 `\operatorname{Coker}`。
- D305/D385/D447/D451/D471 若走的是"$f$ 到射影簇 + 带奇度量的线丛 + 乘子理想层"这一套消没语境，接缝落在 §5 主定理陈述与 §6 归纳骨架（`main.tex:108-132, 153-212`）；若引用的是注入定理作为中间工具，接缝落在 §3（`main.tex:59-79`）与 §7 尾段 $\beta$ 单射那一步（`main.tex:236-256`）。
- 本稿 bib key `Fujino2018` 指向 2016 arXiv 预印本，并非期刊版；期刊版通常出现在 Adv. Stud. Pure Math. 或类似会议文集（`main.tex:50-53` 提到"conference"）。语料稿若引期刊版，C 稿的正文位置串仍以 `main.tex` 为准，行号一致。
- 与本单同时写的 C10（BDPP 2013 pseudo-effective cone）与 C11（Berndtsson-Păun 2008 Bergman kernel）与本文同属解析代数几何一系：D385/D447/D471 同时引用 C08/C09/C10/C11；D305 同时引 C09/C11；D451 同时引 C08/C09。这几稿的接缝在 C 稿一侧按各自派单登记，写手不去跨引。

- 补充一句方法论口径。注入定理与消没定理的差别：注入说"乘截面后 $H^i$ 单射"，消没说"$H^i = 0$"。§7 收尾的图正是把两者串起来：$i \geq 2$ 靠归纳与 Serre 直接归零；$i = 1$ 靠"上一层是 0（Serre） + 竖箭头是单射（注入）"逼出"这一层是 0"。这个模板在 Kollár-Singer、Fujino 综述 `fujino2`（Injectivity theorems, Adv. Stud. Pure Math.）与 Matsumura 单作者版本（`main.tex:321-323` Kollár-Ohsawa 型消没）里反复出现；C09 只把最短的一次落地写成 115 行证明，因此它作为参考文献更适合被引作"应用 Fujino-Matsumura 注入定理与乘子理想层 Bertini 型定理的直接推论"，并非独立的技术核心。语料稿引本稿通常同时引 `FujinoMatsumura2018`；若后者缺席，接缝应回到 §3 与 §4 说明工具来源。










