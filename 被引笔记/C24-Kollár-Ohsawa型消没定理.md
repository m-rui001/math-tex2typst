# C24 Kollár-Ohsawa 型消没定理（arXiv:1511.04222）

## 0 取证边界

- arXiv id：1511.04222。
- 作者（原文署名逐字）：Shin-ichi MATSUMURA。
- 发表年月：2015-11-13。
- 素材目录：`E:\math\被引素材/1511.04222`。
- 主 tex 清单：`被引素材/1511.04222/main.tex`，实测 47122 字节 / 1339 行。
- 本语料中引用它的稿号与 bib key（仅登记，不去读这些稿）：D318（bib key `Matsumura2018`）；D385（bib key `Matsumura2018`）。
- 取材薄读之处：preamble 把 `\ddbar`、`\deldel`、`\dbar`、`\HH`、`\A`、`\R`、`\C{}{}`、`\CC{}{}`、`\U{}`、`\lla`、`\rra`、`\la`、`\ra` 等自定义宏按 KaTeX 族与定义改写：`\ddbar`→`dd^c`、`\deldel`→`\sqrt{-1}\partial\bar{\partial}`、`\dbar`→`\bar\partial`、`\HH`→`\mathcal{H}`、`\A`→`\alpha`、`\R`→`\widetilde{\rho}`、`\C{i}{p}`→`\alpha_{i_0\cdots i_p}`、`\CC{i}{p}`→`\{\alpha_{i_0\cdots i_p}\}`、`\U{p}`→`U_{i_0\cdots i_p}`、`\lla`/`\rra`→`\langle\!\langle`/`\rangle\!\rangle`、`\la`/`\ra`→`(\!(`/`)\!)`；`\newtheorem` 生成的 theo/prop/lemm/cor/claim/prob/conj/rem 不抄入；`\thebibliography` 与 `\maketitle` 仅用作元数据校对，不抽正文。

- 素材宏补登记（对本节首条清单的补全，不覆盖已写条目）：`\e` 按 `\varepsilon` 读（`main.tex:55`）、`\V{}` 按 `V_{i_{0}\cdots i_{p}}` 读（`main.tex:64`），这两枚在首条清单里缺记，本笔补上；`\labelenumi` 被改为 `(\theenumi)` 形（`main.tex:45`），只影响 enumerate 排版；`\C{}{}` 与 `\CC{}{}` 下标模板里的三个句点是 LaTeX 的 `...` 形，本稿一律按 `\cdots` 读。
- 定理环境声明在 `main.tex:28-43`：theo、prop、lemm、cor、claim、prob、conj、defi、rem、ex 十个环境共用一个按节计数器。正文实际出现的实例为 theo 两枚（`main.tex:168`、`main.tex:249`）、cor 一枚（`main.tex:202`）、按 Takegoshi 引用的 theo 一枚（`main.tex:311`）、复述形 theo 两枚（`main.tex:412`、`main.tex:794`）、lemm 两枚（`main.tex:833`、`main.tex:1042`）、rem 一枚（`main.tex:1175`）。claim、prob、conj、defi、ex 五个环境在正文里零实例，因此素材没有反例、具体例子或定义级条目可抄，本稿不宣称它给了尖锐例子。
- 结果条数申报逐字：摘要（`main.tex:105-116`）申报两条成果，一是 a decomposition theorem for the cohomology groups of the canonical bundle twisted by Nakano semi-positive vector bundles by means of the higher direct image sheaves，二是 a vanishing theorem of Kollár-Ohsawa type by combining the $L^{2}$-method for the $\bar\partial$-equation。引言（`main.tex:151-160`）点名 Theorem m1、Corollary m1-co、Theorem m2 三条，并加一句它给出 arXiv:1503.06503 猜想 2.25 的肯定答复。
- 素材元数据：AMS 分类 Primary 32L20、Secondary 14C30 与 58A14（`main.tex:88`）；关键词七枚（`main.tex:90-97`）；资助为 JSPS Young Scientists (B) 编号 25800051（`main.tex:277-278`）；参考文献共 12 条 bibitem（`main.tex:1223-1304`），正文引用后无空的 `proof` 之外的补充章节，`main.tex:1306` 之后全为空行。

- 既存正文里的宏形保留登记（本次加深新增，不改写任何已落盘行）：§3.3、§3.4、§3.5、§3.6、§4.2、§5.3 等节里已落盘的 `$\C{b}{p-k}$`、`$\C{\alpha}{p}$`、`$\CC{x}{\ell}$`、`$\C{sb}{p-k}$` 一类写法是素材自定义下标宏 `\C{}{}`、`\CC{}{}` 的逐字形，KaTeX 无这两个宏；按加深单的条款它们属已落盘内容，本次不回改，故在此逐字登记其等价读法：`$\C{b}{p-k}$` 读作 $b_{i_{0}\cdots i_{p-k}}$，`$\C{\alpha}{p}$` 读作 $\alpha_{i_{0}\cdots i_{p}}$，`$\CC{x}{\ell}$` 读作 $\{x_{i_{0}\cdots i_{\ell}}\}$，`$\C{sb}{p-k}$` 读作 $(sb)_{i_{0}\cdots i_{p-k}}$。加深单新增的各行一律用展开后的 KaTeX 形，不再引入这些宏。
- 同类残留还有 §5.6 与 §5.7 里以 `\C{b}{p-k}`、`\C{x}{\ell}`、`\C{y}{\ell-1}` 写出的上链记号，读法同上；本稿未引入素材字体梯子形（`\fam`、`\tenmsb`、`\textfont`、裸 `\rm` 开关），素材原文本身也不用该类声明。

## 1 综述：直接像的分解与消没

### 1.1 问题的源头

`main.tex:119-150`：高阶直接像 $R^q f_*(K_X \otimes E)$ 的研究是代数几何与多复变中重要课题。设 $f: X \to Y$ 是 Kähler 流形到解析空间的正常满态射，$E$ 为 $X$ 上向量丛；Leray 谱序列

$$
H^p(Y, R^q f_*(K_X \otimes E)) \Rightarrow H^{p+q}(X, K_X \otimes E).
$$

Takegoshi 1995 [Math. Ann. 303, 389-416] 已证当 $E$ 允许 Nakano 半正曲率度量时谱序列在 $E_2$-项退化且给出 $p = 0$ 的单射定理。本文用 Takegoshi 1995 发展的调和积分理论详细分析该谱序列，给出 $p > 0$ 的同伦型与单射性，并由此推出 Kollár-Ohsawa 型消没定理。

### 1.2 谱序列退化的已知结论

`main.tex:237-243`：Ohsawa 1984 [Publ. Res. Inst. Math. Sci. 20, 21-38] 在 $q = 0$、$X$ 为完备 Kähler 流形时给出 $\bar\partial$-方程的归纳解法；Kollár 1986a [Ann. of Math. 123, 11-42] 在 $X$ 为光滑射影簇、$E$ 为 ample 线丛的拉回时给出同一结论。本文推广 Ohsawa 到高阶直接像、推广 Kollár 到复解析设置。

### 1.3 主定理 m1（分解与单射）

`main.tex:168-188`：设 $f: X \to Y$ 是 Kähler 流形到解析空间的正常满态射，$E$ 允许 Nakano 半正曲率度量。则对一切 $p, q \ge 0$ 存在自然同态

$$
\varphi_{p,q}: H^p(Y, R^q f_*(K_X \otimes E)) \to H^{p+q}(X, K_X \otimes E)
$$

满足：

- (i) $\varphi_{p,q}$ 单射；
- (ii) 当 $p \neq p'$、$p + q = p' + q'$ 时 $\mathrm{Im}\, \varphi_{p,q} \cap \mathrm{Im}\, \varphi_{p',q'} = \{0\}$。

定理 m1 的假设链逐字对齐 `main.tex:168-173`。设 $f \colon X \to Y$ 为从 Kähler 流形 $X$ 到解析空间 $Y$ 的正常满全纯映射（proper surjective holomorphic map，`main.tex:169-170`）；设 $E$ 为 $X$ 上的向量丛，容许一个（hermitian）度量，其曲率在 Nakano 意义下半正（`main.tex:171-172`），即存在度量 $h$ 使 $\sqrt{-1}\Theta_{h}(E)\ge_{\mathrm{Nak}} 0$。素材在本条里没有的假设要写清：不要求 $E$ 为线丛，不要求 $X$ 紧或弱伪凸，不要求 $f$ 是 Kähler 态射或子浸没，不对 $Y$ 加正规性或奇点条件，也不给 $p,q$ 的上界（只写 integers $p, q \geq 0$）。

结论一的同态式（`main.tex:173-177`，素材用不编号环境）：对一切整数 $p, q \ge 0$ 存在自然同态

$$\varphi_{p,q} \colon H^{p}(Y, R^{q}f_{*}(K_{X}\otimes E)) \to H^{p+q}(X, K_{X}\otimes E)$$

结论二的两条性质（`main.tex:178-183`，素材以两条 $\bullet$ 列出）：

- 性质一：$\varphi_{p,q}$ 单射（The homomorphism $\varphi_{p,q}$ is injective，`main.tex:180`）。
- 性质二：当 $p \neq p'$ 且 $p + q = p' + q'$ 时 $\mathrm{Im}\,\varphi_{p,q} \cap \mathrm{Im}\,\varphi_{p',q'} = \{0\}$（`main.tex:181-182`）。

记号说明按素材逐字（`main.tex:184-187`）：$K_{X}$ 为 $X$ 的典范丛，$R^{q}f_{*}(\bullet)$ 为第 $q$ 个高阶直接像层，$\mathrm{Im}\,\varphi_{p,q}$ 为 $\varphi_{p,q}$ 的像。同态的 naturality 只在词上出现（there exists a natural homomorphism），素材未写它关于 $f$ 的复合或对 $U\subset Y$ 限制的函子式，本稿登记为薄读之处。

陈述级定位：定理 m1 在素材里被完整复述两遍，第一遍在 `main.tex:168-188`（引言，带记号说明），第二遍在 `main.tex:412-428`（§3 的 Set up 小节，环境标题写作 `=Theorem \ref{m1}`），两遍的数学内容逐字相同；`main.tex:413-417` 把度量条件改写为 admitting (hermitian) metric with semi-positive curvature in the sense of Nakano，与引言同。

引言另加两句定位（`main.tex:155-162`）：Theorem m1 is stronger than the degeneration at $E_{2}$-term，以及 The following theorem can be seen as a weak form of the decomposition theorem。两句都是文字判断，素材没有给出「强多少」的可测形式，本稿照登。

### 1.4 推论 m1-co

`main.tex:202-218`：在 m1 假设外另设 $X$ 紧 Kähler，则

$$
H^\ell(X, K_X \otimes E) = \bigoplus_{p + q = \ell} \mathrm{Im}\, \varphi_{p,q}.
$$

设 $F$ 为 $X$ 上允许半正曲率度量的线丛、$s$ 为 $F^m$ 的非零截面（$m > 0$），则乘映射

$$
\Phi_s: H^p(Y, R^q f_*(K_X \otimes E \otimes F)) \xrightarrow{\otimes s} H^p(Y, R^q f_*(K_X \otimes E \otimes F^{m+1}))
$$

对一切 $p, q \ge 0$ 都单射。

### 1.5 主定理 m2（Kollár-Ohsawa 型消没）

`main.tex:249-261`：设 $f: X \to Y$ 是弱伪凸 Kähler 流形 $X$ 到解析空间 $Y$ 的正常满态射，$E$ 为 $X$ 上向量丛。若 $E$ 允许度量 $g$ 使 $\sqrt{-1}\Theta_g(E) \ge f^*\sigma \otimes \mathrm{id}_E$（Nakano 意义下 $\ge$ 某个 Kähler 形式 $\sigma$ 的拉回），则

$$
H^p(Y, R^q f_*(K_X \otimes E)) = 0, \quad \forall p > 0, q \ge 0.
$$

特例 $p = 0$ 时自然同构 $H^0(Y, R^q f_*(K_X \otimes E)) \cong H^q(X, K_X \otimes E)$。

推论 m1-co（`main.tex:202-218`）的假设链：Under the same situation as in Theorem m1, we further assume that $X$ is a compact Kähler manifold（`main.tex:203-204`）。即在 m1 的全部假设（$f$ 正常满、$E$ 容许 Nakano 半正度量）之外只加一条 $X$ 紧 Kähler。

结论一（直接和分解，`main.tex:205-208`）：对每个总次数 $\ell$ 有

$$H^{\ell}(X, K_{X}\otimes E)=\bigoplus_{p+q=\ell}\mathrm{Im}\,\varphi_{p,q}.$$

结论二（乘映射单射，`main.tex:209-217`）的假设与式：设 $F$ 为 $X$ 上容许半正曲率度量的线丛（a line bundle $F$ on $X$ admitting a metric with semi-positive curvature，`main.tex:209-210`），$s$ 为 $F^{m}$ 的非零截面，指数 $m > 0$（`main.tex:210`）。由与 $s$ 张乘诱导的乘映射

$$\Phi_{s}\colon H^{p}(Y, R^q f_{*}(K_{X}\otimes E\otimes F)) \xrightarrow{\otimes s} H^{p}(Y, R^q f_{*}(K_{X}\otimes E\otimes F^{m+1}))$$

对一切 $p, q \ge 0$ 单射。这里的度数范围要读准：映射两端 $p$ 相同、$q$ 相同，变化的只有 $F$ 的幂次（从 $F$ 到 $F^{m+1}$，即一次乘上 $F^{m}$ 的截面）。素材对线丛只写 semi-positive curvature，未写 Nakano，因为线丛情形两种半正概念重合。

推论 m1-co 的两条结论在 `main.tex:191-197` 预告：紧 Kähler 时得 $H^{\ell}(X, K_{X}\otimes E)$ 的分解定理（the first conclusion），另得半正线丛截面诱导乘映射的单射定理（the latter conclusion），并声明后者是 Kollár 1986b 主定理推论的推广（`main.tex:156-157`）。

定理 m2（`main.tex:249-261`）的假设链逐条：

- 底空间：$f \colon X \to Y$ 为从弱伪凸 Kähler 流形 $X$ 到解析空间 $Y$ 的正常满全纯映射（weakly pseudoconvex Kähler manifold，`main.tex:250-251`）；
- 向量丛：$E$ 为 $X$ 上的向量丛，本条不预设它半正（`main.tex:251`）；
- 曲率假设：$E$ 容许一个度量，其曲率在 Nakano 意义下不小于 $Y$ 上某个 Kähler 形式 $\sigma$ 的拉回，逐字为 If $E$ admits a metric whose curvature is larger than or equal to the pull-back of a Kähler form on $Y$ in the sense of Nakano（`main.tex:252-253`）；§4 复述时把该度量命名为 $g$ 并写成 $\sqrt{-1}\Theta_{g}(E) \geq f^{*}\sigma \otimes \mathrm{id}_{E}$（`main.tex:797-799`）。

结论式（`main.tex:255-257`）：

$$H^{p}(Y, R^q f_{*}(K_{X}\otimes E)) = 0 \quad \text{for any } p > 0 \text{ and } q \ge 0.$$

特殊情形 $p = 0$ 的自然同构（`main.tex:259-260`）：$H^{0}(Y, R^q f_{*}(K_{X}\otimes E)) \cong H^{q}(X, K_{X}\otimes E)$，素材以 In particular 引出，它是层论 $H^0$ 与高阶直接像定义的直接对照，不含新估计。

消没的范围与强度按式读：被杀的是 $Y$ 方向次数 $p > 0$ 的层上同调，$q$ 从 $0$ 起全允许，故谱序列 $E_2^{p,q}$ 中 $p > 0$ 的全部项归零，只剩 $p = 0$ 一列。$X$ 方向的 $H^{q}(X, K_{X}\otimes E)$ 本身不消没，它经上面同构被认作 $H^{0}(Y, R^q f_* (\bullet))$。定理 m2 的假设比 m1 强（要求曲率压过 $f^{*}\sigma$），结论比 m1 弱（只给消没），两者在 `main.tex:816-819` 与 `main.tex:860-865` 处接上：m1 给单射的 $\varphi_{p,q}$，m2 证明它在该曲率假设下为零映射。

### 1.6 与 Fujino 15 猜想的关系

`main.tex:160`：本定理 m2 对 Fujino 15 [arXiv:1503.06503] 猜想 2.25 给出肯定答复。

### 1.7 与本语料相关性的预告

`main.tex:106-115`：本稿在 D318、D385 两份研究笔记中被引用，bib key `Matsumura2018`。两稿均把 m1 的分解与 m2 的消没当作「半正曲率丛 + Leray 谱序列 → 高阶直接像结构」的核心工具。具体引用哪条定理、按什么节标题、以何种方式落记号见 §6。

## 2 Takegoshi 的调和积分工具

### 2.1 设定

`main.tex:286-309`：设 $f: X \to Y$ 是 Kähler 流形（带 Kähler 形式 $\omega$）到解析空间 $Y$ 的正常满态射，$E$ 为 $X$ 上带 hermitian 度量 $h$ 的向量丛；$\dim X = n$。对 $Y$ 中 Stein 开集 $U$，取 $U$ 上穷举光滑多重次调和函数 $\Psi_U$，记 $\Phi_U = f^*\Psi_U$，也是穷举多重次调和的。

### 2.2 调和形式空间

`main.tex:297-307`：在 $X_U = f^{-1}(U)$ 上定义

$$
\mathcal{H}^{n,k}(X_U, E, \Phi_U) = \{ u \in C^{n,k}_\infty(X_U, E) : \bar\partial u = 0, \bar\partial^* u = 0, (\bar\partial \Phi_U)^* u = 0 \},
$$

其中 $\bar\partial^*$、$(\bar\partial \Phi_U)^*$ 分别是 $\bar\partial$、$\bar\partial\Phi_U \wedge \bullet$ 的伴随算子。当 $h$ 的曲率 Nakano 半正时，$\mathcal{H}^{n,k}(X_U, E, \Phi_U)$ 不依赖于 $\Psi_U$ 的选取（Takegoshi 1995 定理 4.3 (ii)）。

### 2.3 定理 Tak：调和形式与 Dolbeault 上同调的等价

`main.tex:311-342`：在 $\Theta_h(E) \ge_\mathrm{Nak} 0$ 假设下：

- (1) 自然商映射（光滑 $\bar\partial$-闭 $(n,k)$-形式 $\to$ Dolbeault 上同调类）诱导同构

$$
\mathcal{H}^{n,k}(X_U, E, \Phi_U) \xrightarrow{\cong} H^k(X_U, K_X \otimes E).
$$

- (2) 对 $U_2 \subset U_1$，限制映射 $\mathcal{H}^{n,k}(X_{U_1}, E, \Phi_{U_1}) \to \mathcal{H}^{n,k}(X_{U_2}, E, \Phi_{U_2})$ 与 $H^k$ 的限制图交换：

$$
\begin{CD}
\mathcal{H}^{n,k}(X_{U_1}, E, \Phi_{U_1}) @>\cong>> H^k(X_{U_1}, K_X \otimes E) \\
@VVV @VVV \\
\mathcal{H}^{n,k}(X_{U_2}, E, \Phi_{U_2}) @>\cong>> H^k(X_{U_2}, K_X \otimes E).
\end{CD}
$$

记 $\mathcal{H}_U$ 为 (1) 中商映射的逆映射。

### 2.4 $L^2$-空间与 Bochner-Kodaira-Nakano 恒等式

`main.tex:372-395`：对 m2 的证明，定义 $E$-值 $(n,k)$-形式在 $h$、$\omega$ 下的 $L^2$-空间

$$
L^{n,k}_{(2)}(X, E)_{h,\omega} = \{u : E\text{-值 }(n,k)\text{-形式}, \|u\|_{h,\omega} < \infty\},
$$

其中

$$
\|u\|^2_{h,\omega} = \langle\!\langle u, u \rangle\!\rangle_{h,\omega} = \int_X \langle u, u\rangle_{h,\omega} dV_\omega, \quad dV_\omega = \omega^n / n!.
$$

`main.tex:386-395`：由 Bochner-Kodaira-Nakano 恒等式，

$$
\langle\!\langle \sqrt{-1}\Theta_h(E) \Lambda_\omega v, v \rangle\!\rangle \le \|\bar\partial v\|^2 + \|\bar\partial^* v\|^2
$$

对紧支光滑 $E$-值 $(n,k)$-形式 $v$ 成立，$\Lambda_\omega$ 是 $\omega \wedge \bullet$ 在 $\langle\bullet, \bullet\rangle_{h,\omega}$ 下的逐点伴随。

### 2.5 记号约定

`main.tex:359-367`：用 $\equiv$ 表示 $H^k$ 中的等号，$[\bullet]$ 表示由 $\bar\partial$-闭形式 $\bullet$ 代表的上同调类；$\alpha \equiv [\mathcal{H}_U(\alpha)]$ 对任意 $\alpha \in H^k(X_U, K_X \otimes E)$ 成立。

设定式的逐字补全（`main.tex:286-295`）：全文固定 $f \colon X \to Y$ 为带 Kähler 形式 $\omega$ 的 Kähler 流形 $X$ 到解析空间 $Y$ 的正常满全纯映射，$E$ 为 $X$ 上带 hermitian 度量 $h$ 的向量丛，$n := \dim X$（`main.tex:290`）。对 $Y$ 中 Stein 开集 $U$ 取穷举光滑多重次调和函数 $\Psi_{U}$，并置 $\Phi_{U} := f^{*}\Psi_{U}$，它同样穷举且多重次调和（`main.tex:291-295`）。调和形式空间的定义式按 `main.tex:298-302` 逐字为

$$\mathcal{H}^{n,k}(X_{U}, E, \Phi_{U}) = \{\, u \in C_{\infty}^{n,k}(X_{U}, E) \mid \bar\partial u = 0,\ \bar\partial^{*}u = 0,\ (\bar\partial \Phi_{U})^{*}u = 0\ \text{on}\ X_{U} \,\},$$

其中 $X_{U} := f^{-1}(U)$，$\bar\partial^{*}$ 为 $\bar\partial$ 的伴随算子，$(\bar\partial \Phi_{U})^{*}$ 为楔乘 $\bar\partial \Phi_{U} \wedge \bullet$ 的伴随算子（`main.tex:303-304`）。第三条件 $(\bar\partial \Phi_{U})^{*}u = 0$ 是 Takegoshi 理论相对经典 Hodge 理论多出来的一栏，素材在 `main.tex:305-307` 声明：当 $h$ 的曲率半正时该空间不依赖穷举多重次调和函数 $\Psi_{U}$ 的选取，依据是 Takegoshi 1995 定理 4.3 (ii)。

定理 Tak（`main.tex:311-342`，转引 Takegoshi 1995 定理 4.3 与 5.2）的假设只有一条：$h$ 的曲率在 Nakano 意义下半正（`main.tex:313-314`）。结论两条：

- 结论 (1)（`main.tex:316-323`）：由光滑 $\bar\partial$-闭 $E$-值 $(n,k)$-形式空间到（Dolbeault）上同调群的自然商映射诱导同构

$$\mathcal{H}^{n,k}(X_{U}, E, \Phi_{U}) \xrightarrow{\ \cong\ } H^{k}(X_{U}, K_{X}\otimes E).$$

- 结论 (2)（`main.tex:324-341`）：对 $Y$ 中满足 $U_{2} \subset U_{1}$ 的 Stein 开集，限制映射 $\mathcal{H}^{n,k}(X_{U_{1}}, E, \Phi_{U_{1}}) \longrightarrow \mathcal{H}^{n,k}(X_{U_{2}}, E, \Phi_{U_{2}})$ 良定义，且与 $H^{k}$ 一侧的限制交换，即下图交换（素材用 `CD` 环境，本稿按 KaTeX 改写成两条复合相等的形式）：从 $\mathcal{H}^{n,k}(X_{U_{1}}, E, \Phi_{U_{1}})$ 先取同构再限制，与先限制再取同构，所得两个映射 $H^{k}(X_{U_{1}}, K_{X}\otimes E) \leftarrow$ 一侧的像逐点相等。

记 $\mathcal{H}_{U}$ 为该商映射的逆，逐字式（`main.tex:350-353`）：

$$\mathcal{H}_{U} \colon H^{k}(X_{U}, K_{X}\otimes E) \xrightarrow{\ \cong\ } \mathcal{H}^{n,k}(X_{U}, E, \Phi_{U}),$$

素材在 `main.tex:355` 声明常省去下标 $U$，故 §3 里的 $\mathcal{H}(\alpha)$ 即 $\mathcal{H}_{U}(\alpha)$，$U$ 由上下文里 $\alpha$ 所属的开集决定。

记号约定按 `main.tex:356-367` 逐字：在 $H^{k}(X_{U}, K_{X}\otimes E)$ 中的等号写作 $\equiv$，由 $\bar\partial$-闭 $E$-值形式 $\bullet$ 决定的上同调类写作 $[\bullet]$，于是对任意 $\alpha \in H^{k}(X_{U}, K_{X}\otimes E)$ 有

$$\alpha \equiv [\mathcal{H}_{U}(\alpha)].$$

该式的来源是 (1) 的逆映射定义：$\mathcal{H}_{U}(\alpha)$ 是与 $\alpha$ 同类的调和代表。素材强调区分上同调类与 $\bar\partial$-闭形式本身（`main.tex:356-359`），因为 §3 的构造要在形式层面取 Čech 上循环。

$L^{2}$ 空间与范数式按 `main.tex:371-385` 逐字（仅 m2 一侧使用）：

$$L_{(2)}^{n,k}(X, E)_{h,\omega} := \{\, u \mid u\ \text{为}\ X\ \text{上的}\ E\text{-值}\ (n,k)\text{-形式},\ \|u\|_{h,\omega} < \infty \,\},$$

$$\|u\|^{2}_{h,\omega} := \langle\!\langle u, u \rangle\!\rangle_{h,\omega} := \int_{X} \langle u, u \rangle_{h,\omega}\, dV_{\omega}, \qquad dV_{\omega} := \omega^{n}/n!,$$

其中 $\langle u, u \rangle_{h,\omega}$ 是关于 $h$ 与 $\omega$ 的逐点内积（`main.tex:384-385`）。Bochner-Kodaira-Nakano 恒等式给出的基本估计（`main.tex:386-392`）：对紧支光滑 $E$-值 $(n,k)$-形式 $v$，

$$\langle\!\langle \sqrt{-1}\Theta_{h}(E) \Lambda_{\omega}\, v, v \rangle\!\rangle \le \| \bar\partial v \|^{2} + \| \bar\partial^{*} v \|^{2},$$

$\Lambda_{\omega}$ 是楔乘 $\omega \wedge \bullet$ 关于 $\langle \bullet, \bullet \rangle_{h,\omega}$ 的逐点伴随（`main.tex:393-395`）。素材把该式作为唯一一处来自 BKN 的输入，未写 curvature term 与 $\tau$-算子的完整恒等式，只给不等式形，本稿按不等式形登记。

## 3 第一主定理 m1 的证明：$\varphi_{p,q}$ 构造与单射性

### 3.1 构造思路

`main.tex:398-405`：本节给出 $\varphi_{p,q}$ 的显式构造，并证单射性与像的不相交性。取 $Y$ 的 Stein 开覆盖 $\mathcal{U} = \{U_i\}_{i \in I}$，Cech 上同调

$$
H^p(Y, R^q f_*(K_X \otimes E)) \cong \check H^p(\mathcal{U}, R^q f_*(K_X \otimes E)).
$$

对 $\mathcal{U}$ 的 $p+1$-重交 $U_p := U_{i_0} \cap \cdots \cap U_{i_p}$，$U_p$ 也是 Stein，因此有

$$
H^0(U_p, R^q f_*(K_X \otimes E)) \xrightarrow{\cong} H^q(f^{-1}(U_p), K_X \otimes E).
$$

记 $V_p = f^{-1}(U_p)$。一个 $p$-上链 $\alpha_{i_0\cdots i_p} \in H^q(V_p, K_X \otimes E)$ 满足 $\delta(\alpha_{i_0\cdots i_p}) \equiv 0$（上同调类意义）即给出 Cech $p$-上循环。

### 3.2 调和形式代表

`main.tex:477-498`：对 $p = 0$ 的情形，由 $\delta(\{\alpha_{i_0}\}) \equiv 0$ 与 Tak 定理 (2) 的兼容性，$\{\mathcal{H}(\alpha_{i_0})\}$ 是 $E$-值 $(n,q)$-形式的 0-上循环（$E$-值形式意义，并非上同调类意义），从而给出 $X$ 上整体定义的 $E$-值 $(n,q)$-形式。定义

$$
\varphi_{0,q}(\{\alpha_{i_0}\}) := [\{\mathcal{H}(\alpha_{i_0})\}] \in H^q(X, K_X \otimes E).
$$

### 3.3 归纳构造 $\C{b}{p-k}$

`main.tex:504-556`：对 $p > 0$，因「光滑 $E$-值 $(n,q)$-形式」的高阶直接像是 fine sheaf，存在 $(p-1)$-上链 $\C{b}{p-1}$（值为不必 $\bar\partial$-闭的 $E$-值 $(n,q)$-形式）使 $\{\mathcal{H}(\C{\alpha}{p})\} = \delta(\C{b}{p-1})$（由 $\delta\{\mathcal{H}(\{\alpha\})\} = \mathcal{H}(\delta\{\alpha\}) = 0$）。归纳地，由「$\bar\partial \C{b}{p-k}$ 是 $\bar\partial$-闭 0-上链」得 $(p-k-1)$-上链 $\C{b}{p-k-1}$ 使 $\{\bar\partial \C{b}{p-k}\} = \delta(\C{b}{p-k-1})$（值为 $E$-值 $(n,q+k)$-形式）。终止于 $k = p-1$ 时 $\{\bar\partial \C{b}{p-(p-1)}\}$ 是 $\delta$-闭 0-上链，故定义 $X$ 上整体 $E$-值 $(n,p+q)$-形式。定义

$$
\varphi_{p,q}(\C{\alpha}{p}) := [\{\bar\partial b_{i_0}\}] \in H^{p+q}(X, K_X \otimes E).
$$

### 3.4 良定义性

`main.tex:559-599`：$p = 0$ 时 $\{\alpha_{i_0}\} \equiv \{\alpha'_{i_0}\}$ 蕴含 $\mathcal{H}(\alpha_{i_0}) = \mathcal{H}(\alpha'_{i_0})$（同一调和形式），$\varphi_{0,q}$ 良定义。$p > 0$ 时若 $\C{\alpha}{p} \equiv \C{\alpha'}{p} + \delta(\C{c}{p-1})$，由相同的归纳过程取对应 $\C{c}{p-k} = \bar\partial \C{d}{p-k}$（$\C{d}{p-k}$ 为构造过程中的差），得 $\{b_{i_0} - b'_{i_0} - c_{i_0}\}$ 是 $X$ 上整体 $(n,p+q-1)$-形式 $\eta$，$\{\bar\partial b_{i_0}\} = \{\bar\partial b'_{i_0}\} + \bar\partial\eta$，故 $\varphi_{p,q}$ 不依赖 $\C{b}{p-k}$ 的选取；Stein 开覆盖的换基兼容性由 Tak (2) 自动给出。

### 3.5 单射性

`main.tex:603-680`：设 $\varphi_{p,q}(\{\C{\alpha}{p}\}) \equiv 0$。$p = 0$ 时 $\{\mathcal{H}(\alpha_{i_0})\} = \bar\partial \eta$（$E$-值 $(n,q-1)$-形式 $\eta$），由 Tak 商映射 $\alpha_{i_0} \equiv [\mathcal{H}(\alpha_{i_0})] \equiv [\bar\partial\eta] \equiv 0$。

$p > 0$ 时设 $\{\bar\partial b_{i_0}\} = \bar\partial\eta$，取 $c_{i_0} = b_{i_0} - \eta$，则 $c_{i_0}$ $\bar\partial$-闭；再取 $d_{i_0}$ 使 $c_{i_0} = \mathcal{H}(c_{i_0}) + \bar\partial d_{i_0}$（因 $c_{i_0}$ 与 $\mathcal{H}(c_{i_0})$ 代表同一上同调类）；归纳得 $\C{c}{p-1}$ 为 $\bar\partial$-闭 $(p-1)$-上链使 $\{\mathcal{H}(\C{\alpha}{p})\} = \delta(\C{c}{p-1})$，从而 $\{\C{\alpha}{p}\} \equiv \delta(\{[\C{c}{p-1}]\})$，证 $\{\C{\alpha}{p}\} = 0$。

### 3.6 像的不相交性

`main.tex:685-720`：设 $\varphi_{p,q}(\C{\alpha}{p}) = \varphi_{p',q'}(\C{\alpha'}{p'})$ 且 $p < p'$、$p + q = p' + q'$。取对应 $\C{b}{p-k}$、$\C{b'}{p'-k'}$，设 $\{\bar\partial b_{i_0}\} - \{\bar\partial b'_{i_0}\} = \bar\partial\eta$，取 $c_{i_0} = b_{i_0} - b'_{i_0} - \eta$；沿用 §3.5 的归纳得 $(p-1)$-上链 $\C{c}{p-1}$（值为 $\bar\partial$-闭 $E$-值 $(n,q)$-形式）使 $\{\mathcal{H}(\C{\alpha}{p}) - \bar\partial \C{b'}{p'}\} = \delta(\C{c}{p-1})$（这里用到 $p < p'$ 的假设确保 $\bar\partial \C{b'}{p'}$ 的形式阶数恰当）；再作用 $\mathcal{H}$ 得 $\{\mathcal{H}(\C{\alpha}{p})\} = \delta(\{\mathcal{H}(\C{c}{p-1})\})$，故 $\{\C{\alpha}{p}\} \equiv \delta(\{[\mathcal{H}(\C{c}{p-1})]\})$，即 $\{\C{\alpha}{p}\}$ 在 Cech 上同调中为零，$\varphi_{p,q}$ 作用为零。

构造层的公式级补全。设固定 $\omega$ 与曲率 Nakano 半正的度量 $h$（`main.tex:429-430`），于是每个上同调类 $\alpha$ 在 $f^{-1}(U)$ 上有唯一调和代表 $\mathcal{H}(\alpha)$（`main.tex:431-434`）。

Čech 计算的两条同构式（`main.tex:438-451`）：取 $Y$ 的 Stein 开覆盖 $\mathcal{U} := \{U_{i}\}_{i \in I}$，标准同构为

$$H^{p}(Y, R^{q}f_{*}(K_{X}\otimes E)) \cong \check{H}^{p}(\mathcal{U}, R^{q}f_{*}(K_{X}\otimes E)),$$

因 $U_{i_{0}\cdots i_{p}} := U_{i_{0}} \cap \cdots \cap U_{i_{p}}$（素材以宏 `\U{p}` 记之）仍为 Stein，故有自然同构

$$H^{0}(U_{i_{0}\cdots i_{p}}, R^{q}f_{*}(K_{X}\otimes E)) \xrightarrow{\ \cong\ } H^{q}(f^{-1}(U_{i_{0}\cdots i_{p}}), K_{X}\otimes E).$$

素材据此把取值在 $R^{q}f_{*}(K_{X}\otimes E)$ 的 $p$-上链，认同为取值在 $E$-值 $(n,q)$-形式的 Dolbeault 上同调的 $p$-上链 $\{\alpha_{i_{0}\cdots i_{p}}\}$（`main.tex:452-456`）。

上边界算子的定义式按 `main.tex:464-469` 逐字：

$$\delta(\{\alpha_{i_{0}\cdots i_{p}}\}) := \Big\{ \sum_{k=0}^{p+1} (-1)^{k} \alpha_{i_{0}\cdots \widehat{i_{k}} \cdots i_{q+1}} \big|_{f^{-1}(U_{p+1})} \Big\}_{i_{0}\cdots i_{p+1}}.$$

该式素材有两处笔误需登记：求和内最后一个下标写作 $i_{q+1}$，按上边界次数应为 $i_{p+1}$；限制记号 $|_{f^{-1}(U_{p+1})}$（素材写作带宏的 `f^{-1}(\U{p+1})`）未写下标串，按上下文指 $(p+1)$-重交。素材另在 `main.tex:470-472` 置 $V_{i_{0}\cdots i_{p}} := f^{-1}(U_{i_{0}\cdots i_{p}})$（宏形为 `\V{p}` 与 `\U{p}`）并声明省去限制记号与下标串 $i_{0}\cdots i_{p}$，故后文 $\alpha_{i_{0}\cdots i_{p}}$ 一律默认限制到 $V_{i_{0}\cdots i_{p}}$。

待构造的目标（`main.tex:477-481`）：对任意 $p$-上循环 $\{\alpha_{i_{0}\cdots i_{p}}\}$（$\alpha_{i_{0}\cdots i_{p}} \in H^{q}(V_{i_{0}\cdots i_{p}}, K_{X}\otimes E)$ 且 $\delta(\{\alpha_{p}\}) \equiv 0$），造出 $X$ 上的 $\bar\partial$-闭 $E$-值 $(n, p+q)$-形式，并用它的类定义 $\varphi_{p,q}(\{\alpha_{p}\}) \in H^{p+q}(X, K_{X}\otimes E)$。

$p = 0$ 的基础式（`main.tex:484-499`）：由 $\delta(\{\alpha_{i_{0}}\}) \equiv 0$ 与定理 Tak (2) 的兼容性得形式层面的等式

$$\delta(\{\mathcal{H}(\alpha_{i_{0}})\}) = \mathcal{H}(\delta(\{\alpha_{i_{0}}\})) = 0,$$

素材在 `main.tex:493-495` 特别注明此等号是 $E$-值 $(n,q)$-形式层面的等号，不是上同调类层面的。于是 $\{\mathcal{H}(\alpha_{i_{0}})\}$ 构成 $E$-值 $(n,q)$-形式的 $0$-上循环，粘出 $X$ 上整体形式，定义式为

$$\varphi_{0,q}(\{\alpha_{i_{0}}\}) := [\{\mathcal{H}(\alpha_{i_{0}})\}] \in H^{q}(X, K_{X}\otimes E).$$

$p > 0$ 的归纳族 $(*)$（`main.tex:504-552`）逐式：先由 fine sheaf 论证（the higher direct images of the smooth $E$-valued $(n,q)$-forms are fine sheaves，`main.tex:513-515`）得 $\delta(\mathcal{H}(\alpha_{p})) = \mathcal{H}(\delta(\alpha_{p})) = 0$，于是存在取值在不必 $\bar\partial$-闭的 $E$-值 $(n,q)$-形式的 $(p-1)$-上链 $\{b_{p-1}\}$ 使 $\{\mathcal{H}(\alpha_{p})\} = \delta(\{b_{p-1}\})$；再对 $\bar\partial b_{p-1}$ 重复，逐步升形式次数。素材在 `main.tex:543-552` 用带 `\left\{\begin{array}{ll}` 的联立系统写出，本稿按联立形抄出（$k = 1, 2, \dots, p$）：

$$\begin{cases}\{\mathcal{H}(\alpha_{i_{0}\cdots i_{p}})\} = \delta(\{b_{i_{0}\cdots i_{p-1}}\}),\\ \{\bar\partial b_{i_{0}\cdots i_{p-1}}\} = \delta(\{b_{i_{0}\cdots i_{p-2}}\}),\\ \vdots\\ \{\bar\partial b_{i_{0}i_{1}}\} = \delta(\{b_{i_{0}}\}).\end{cases}$$

系统里第 $k$ 行的 $\{b_{i_{0}\cdots i_{p-k}}\}$ 取值在 $E$-值 $(n, q+k-1)$-形式（`main.tex:538-541`），末行给出 $\delta(\{\bar\partial b_{i_{0}}\}) = 0$，故 $\{\bar\partial b_{i_{0}}\}$ 决定 $X$ 上整体的 $E$-值 $(n, p+q)$-形式。定义式（`main.tex:556`）为

$$\varphi_{p,q}(\{\alpha_{i_{0}\cdots i_{p}}\}) := [\{\bar\partial b_{i_{0}}\}] \in H^{p+q}(X, K_{X}\otimes E).$$

素材在 `main.tex:519-523` 插入一句强调：$\{b_{p-1}\}$ 可由 $\mathcal{H}(\alpha_{p})$ 经 $\mathcal{U}$ 关联的单位分解具体造出（见引理 par），并且 The construction of $b_{p-1}$ plays an important role in the proof of Theorem m2，这一句标出了 §3 与 §4 的接口。

良定义性（`main.tex:559-599`）的中间式：$p = 0$ 时 $\{\alpha_{i_{0}}\} \equiv \{\alpha'_{i_{0}}\}$ 蕴含 $\mathcal{H}(\alpha_{i_{0}}) = \mathcal{H}(\alpha'_{i_{0}})$ 于 $U_{i_{0}}$ 上（`main.tex:561-562`）。$p > 0$ 时对 $\{\alpha_{p}\} \equiv \{\alpha'_{p}\} + \delta(\{c_{p-1}\})$ 与两套满足 $(*)$ 的 $\{b_{p-k}\}$、$\{b'_{p-k}\}$，逐层下降的等式为

$$\{b_{p-1} - b'_{p-1} - \mathcal{H}(c_{p-1})\} = \delta(\{d_{p-2}\}), \qquad c_{p-2} := \bar\partial d_{p-2},$$

$$\{b_{p-2} - b'_{p-2} - c_{p-2}\} = \delta(\{d_{p-3}\}), \qquad c_{p-3} := \bar\partial d_{p-3},$$

一般地 $c_{p-k} := \bar\partial d_{p-k}$（$k = 1, 2, \dots, p$，`main.tex:571-588`）。末了 $\delta\{b_{i_{0}} - b'_{i_{0}} - c_{i_{0}}\} = 0$ 给出 $X$ 上整体 $E$-值 $(n, p+q-1)$-形式 $\eta$，再由 $c_{i_{0}}$ 的 $\bar\partial$-闭性得

$$\{\bar\partial b_{i_{0}}\} = \{\bar\partial b'_{i_{0}}\} + \bar\partial \eta,$$

故两类相等（`main.tex:589-597`）。换 Stein 覆盖的不变性素材写作一句易证（`main.tex:598-599`）。

单射性（`main.tex:603-680`）的目标式与中间式：设 $\varphi_{p,q}(\{\alpha_{p}\}) \equiv 0$，素材把证明归约为造一个取值在 $E$-值 $(n,q)$-形式的 $(p-1)$-上链 $\{c_{p-1}\}$ 满足两条

$$\bullet\ \ \{\alpha_{p}\} \equiv \delta(\{[c_{p-1}]\}), \qquad \bullet\ \ c_{p-1}\ \text{为}\ \bar\partial\text{-闭}.$$

$p = 0$ 时：由 $\varphi_{0,q}(\{\alpha_{i_{0}}\}) \equiv 0$ 得 $\{\mathcal{H}(\alpha_{i_{0}})\} = \bar\partial \eta$（$\eta$ 为 $E$-值 $(n, q-1)$-形式，`main.tex:611-613`），再用 $\mathcal{H}$ 是商映射的逆这一事实 $\alpha_{i_{0}} \equiv [\mathcal{H}(\alpha_{i_{0}})]$，链式为

$$\alpha_{i_{0}} \equiv [\mathcal{H}(\alpha_{i_{0}})] \equiv [\bar\partial \eta] \equiv 0.$$

$p > 0$ 时的归纳链（`main.tex:640-678`）：取满足 $(*)$ 的 $\{b_{p-k}\}$，由 $[\{\bar\partial b_{i_{0}}\}] \equiv 0$ 得 $\{\bar\partial b_{i_{0}}\} = \bar\partial \eta$；置 $c_{i_{0}} := b_{i_{0}} - \eta$，有 $\{\bar\partial b_{i_{0}i_{1}}\} = \delta(\{c_{i_{0}}\})$ 与 $c_{i_{0}}$ $\bar\partial$-闭（`main.tex:645-649`）。由 $\delta(\{\mathcal{H}(c_{i_{0}})\}) = 0$（左端在 $V_{i_{0}i_{1}}$ 上 $\bar\partial$-正合，`main.tex:650-653`）与 $c_{i_{0}}$、$\mathcal{H}(c_{i_{0}})$ 同类，取 $E$-值 $(n, p+q-2)$-形式 $d_{i_{0}}$ 使

$$c_{i_{0}} = \mathcal{H}(c_{i_{0}}) + \bar\partial d_{i_{0}},$$

代回得

$$\{\bar\partial b_{i_{0}i_{1}}\} = \delta(\{\mathcal{H}(c_{i_{0}}) + \bar\partial d_{i_{0}}\}) = \delta(\{\bar\partial d_{i_{0}}\}) = \bar\partial \delta(\{d_{i_{0}}\}),$$

再置 $\{c_{i_{0}i_{1}}\} := \{b_{i_{0}i_{1}}\} - \delta(\{d_{i_{0}}\})$，重复到 $\{c_{p-1}\}$（`main.tex:665-675`）。收尾链式（`main.tex:676-679`）：

$$\{\alpha_{p}\} \equiv \{[\mathcal{H}(\alpha_{p})]\} \equiv \delta(\{[c_{p-1}]\}),$$

即上循环为上边缘，类为零。素材在 `main.tex:674-675` 写出的中间等式为 $\{\mathcal{H}(\alpha_{p})\} = \delta(\{c_{p-1}\})$，其中左端下标写作 `\alpha`（前文多用宏 `\A`，二者同形）。

像的不相交性（`main.tex:685-720`）的式链：设 $\varphi_{p,q}(\{\alpha_{p}\}) = \varphi_{p',q'}(\{\alpha'_{p'}\})$，不失一般设 $p < p'$（`main.tex:689`）；两套 $(*)$ 分别记为 $\{b_{p-k}\}$、$\{b'_{p'-k'}\}$。存在 $E$-值 $(n, p+q-1)$-形式 $\eta$ 使 $\{\bar\partial b_{i_{0}}\} - \{\bar\partial b'_{i_{0}}\} = \bar\partial \eta$，置 $c_{i_{0}} := b_{i_{0}} - b'_{i_{0}} - \eta$，得

$$\{\bar\partial(b_{i_{0}i_{1}} - b'_{i_{0}i_{1}})\} = \delta(\{c_{i_{0}}\}), \qquad c_{i_{0}}\ \text{为}\ \bar\partial\text{-闭},$$

沿用同一归纳得取值在 $\bar\partial$-闭 $E$-值 $(n,q)$-形式的 $(p-1)$-上链 $\{c_{p-1}\}$ 满足 $\{\mathcal{H}(\alpha_{p}) - \bar\partial b'_{p'}\} = \delta(\{c_{p-1}\})$（`main.tex:706-710`，此处用到 $p < p'$ 保证 $\bar\partial b'_{p'}$ 的形式次数 $\ge p+1$ 才能与 $\alpha_{p}$ 的次数 $q$ 对齐；素材只在 `main.tex:711` 写 Here we used the assumption of $p < p'$）。作用 $\mathcal{H}$ 得 $\{\mathcal{H}(\alpha_{p})\} = \delta(\{\mathcal{H}(c_{p-1})\})$，于是

$$\{\alpha_{p}\} \equiv \{[\mathcal{H}(\alpha_{p})]\} \equiv \delta(\{[\mathcal{H}(c_{p-1})]\}),$$

$\{\alpha_{p}\}$ 在 Čech 上同调中为零，故 $\mathrm{Im}\,\varphi_{p,q} \cap \mathrm{Im}\,\varphi_{p',q'} = \{0\}$。此处登记素材笔误：`main.tex:716` 的中项写作 $\mathcal{H}(\alpha_{p-1})$，按上循环次数应为 $\alpha_{p}$。

## 4 推论 m1-co：直接和分解与 $F^m$ 乘映射单射

### 4.1 直接和分解

`main.tex:723-742`：设 $X$ 紧 Kähler。由定理 m1，$H^\ell(X, K_X \otimes E) \supset \bigoplus_{p+q=\ell} \mathrm{Im}\, \varphi_{p,q}$。Takegoshi 1995 「I Decomposition theorem」给出 Leray 谱序列 $H^p(Y, R^q f_*(K_X \otimes E)) \Rightarrow H^{p+q}(X, K_X \otimes E)$ 在 $E_2$-退化，从而

$$
\dim H^\ell(X, K_X \otimes E) = \sum_{p+q=\ell} \dim H^p(Y, R^q f_*(K_X \otimes E)).
$$

与 m1 的单射性合起来即 $H^\ell(X, K_X \otimes E) = \bigoplus_{p+q=\ell} \mathrm{Im}\, \varphi_{p,q}$。

### 4.2 乘映射 $\Phi_s$ 的交换图

`main.tex:745-773`：设 $F$ 为 $X$ 上允许半正曲度量的线丛，$s$ 为 $F^m$ 的非零截面。乘映射 $\Phi_s$（在高阶直接像上）与 $\Psi_s$（在 $X$ 上的高阶上同调上）满足交换图

$$
\begin{CD}
H^p(Y, R^q f_*(K_X \otimes E \otimes F)) @>\varphi_{p,q}>> H^{p+q}(X, K_X \otimes E \otimes F) \\
@V\Phi_s VV @V\Psi_s VV \\
H^p(Y, R^q f_*(K_X \otimes E \otimes F^{m+1})) @>\varphi'_{p,q}>> H^{p+q}(X, K_X \otimes E \otimes F^{m+1}).
\end{CD}
$$

理由：给定 $a$ 对应的 $(p-k)$-上链 $\C{b}{p-k}$ 满足 (*) 后，$\C{sb}{p-k}$ 对 $sa$ 也满足 (*)（因为 Takegoshi 1995 命题 4.4 说 $s\mathcal{H}(a) \equiv s a$ 且 $s\mathcal{H}(a)$ 仍调和）。

### 4.3 $\Phi_s$ 的单射性

`main.tex:776-782`：$F$ 半正 $\Rightarrow$ $E \otimes F$、$E \otimes F^{m+1}$ 半正；$\varphi_{p,q}$ 与 $\varphi'_{p,q}$ 由 m1 单射；$\Psi_s$ 由标准单射定理（Enoki 1990 [Einstein metrics and Yang-Mills, 59-68]、Takegoshi 1995）单射。交换图交换且三侧单射，$\Phi_s$ 必单射。

推论 m1-co 证明的中间式补全（`main.tex:723-782`）。设定：$f \colon X \to Y$ 为从紧 Kähler 流形 $X$ 到解析空间 $Y$ 的正常满全纯映射，$E$ 容许 Nakano 半正度量（`main.tex:725-728`）。

第一条中间式（`main.tex:730-733`，由定理 m1 直接得到的只是包含关系，等号另需论证）：

$$H^{\ell}(X, K_{X}\otimes E) \supset \bigoplus_{p+q=\ell}\mathrm{Im}\,\varphi_{p,q}.$$

第二条中间式（`main.tex:734-741`）来自 Takegoshi 的 $E_2$-退化（见其文 I Decomposition theorem 一节）：谱序列 $H^{p}(Y, R^{q}f_{*}(K_{X}\otimes E)) \Longrightarrow H^{p+q}(X, K_{X}\otimes E)$ 在 $E_2$ 项退化，于是 $X$ 紧时

$$\dim H^{\ell}(X, K_{X}\otimes E) = \sum_{p+q=\ell} \dim H^{p}(Y, R^{q}f_{*}(K_{X}\otimes E)).$$

两条合起来给出等号：右端每个 $\dim H^{p}(Y, R^{q}f_{*}(\bullet))$ 由 $\varphi_{p,q}$ 单射投进左端，且按 m1 性质二互不相交，故像的直和维数已达总维数，包含式只能是等式。素材在 `main.tex:742` 写作 This leads to the first conclusion，未展开维数计数，本稿把计数式登记为读法。

乘映射部分的交换图按 `main.tex:751-762` 的四边读成一个等式：左上行 $\varphi_{p,q}$、右列 $\Psi_{s}$、下行 $\varphi'_{p,q}$、左列 $\Phi_{s}$，交换性即

$$\Psi_{s} \circ \varphi_{p,q} = \varphi'_{p,q} \circ \Phi_{s}$$

作为 $H^{p}(Y, R^q f_{*}(K_{X}\otimes E\otimes F))$ 到 $H^{p+q}(X, K_{X}\otimes E\otimes F^{m+1})$ 的两条映射相等。

交换性的两条关键式（`main.tex:763-768`）：对给定 $\{\alpha_{p}\} \in H^{p}(Y, R^q f_{*}(K_{X}\otimes E\otimes F))$，

$$[s\mathcal{H}(\alpha_{p})] \equiv s\,\alpha_{p}, \qquad s\,\mathcal{H}(\alpha_{p}) \equiv \mathcal{H}(s\,\alpha_{p}),$$

第一式说的是 $s\mathcal{H}(\alpha_{p})$ 代表的类就是 $\bar\partial$-闭形式层面的乘 $s\alpha_{p}$；第二式的成立还要 $s\mathcal{H}(\alpha_{p})$ 自身仍是调和形式，素材把这一条挂在 Takegoshi 1995 命题 4.4 上（`main.tex:767-768`，逐字为 $s\mathcal{H}(\alpha_{p})$ is also harmonic by Proposition 4.4）。由此对满足 $(*)$ 的 $\{b_{p-k}\}$ 得 $\{s b_{p-k}\}$ 对 $\{s\alpha_{p}\}$ 也满足 $(*)$（`main.tex:769-772`），图即交换。

单射性的三段论（`main.tex:776-782`）：$F$ 半正故 $E \otimes F$ 与 $E \otimes F^{m+1}$ 半正；$\varphi_{p,q}$ 与 $\varphi'_{p,q}$ 由定理 m1 单射；$\Psi_{s}$ 由标准单射定理单射（素材引 Enoki 1990 与 Takegoshi 1995，`main.tex:780-781`）。图中三侧单射迫使 $\Phi_{s}$ 单射。半正性的可加性素材未写式子，本稿按标准式登记为读法：$\sqrt{-1}\Theta_{E\otimes F} = \sqrt{-1}\Theta_{E}\otimes \mathrm{id}_{F} + \mathrm{id}_{E}\otimes \sqrt{-1}\Theta_{F}$，右端两项在 Nakano 锥内故和仍在锥内。

## 5 第二主定理 m2：Kollár-Ohsawa 型消没

### 5.1 Kähler 形式在解析空间上的定义

`main.tex:807-815`：$\sigma$ 在 $Y$ 的正则部分 $Y_\mathrm{reg}$ 上是 Kähler 形式，且对每个 $y \in Y$ 存在邻域 $U_y$ 的局部闭嵌入 $i: U_y \hookrightarrow \mathbb{C}^m$ 与 $\mathbb{C}^m$ 邻域上的 Kähler 形式 $\tilde\sigma$ 使 $\sigma = i^*\tilde\sigma$ 在 $U_y \cap Y_\mathrm{reg}$ 上成立。$f^*\sigma$ 在 $f^{-1}(Y_\mathrm{reg})$ 上的拉回是 $X$ 上的半正 $(1,1)$-形式，再延拓到整个 $X$。

### 5.2 证明思路

`main.tex:816-866`：用 m1 把消没问题归约为证 $\varphi_{p,q}$ 在曲率假设 $\sqrt{-1}\Theta_g(E) \ge_\mathrm{Nak} f^*\sigma \otimes \mathrm{id}_E$ 下是零映射。取 $Y$ 的 Stein 开覆盖 $\mathcal{U} = \{U_i\}_{i \in I}$，由「$\{\bar\partial b_{i_0}\}$ 是 $X$ 上整体 $E$-值 $(n,p+q)$-形式」只要证它是 $\bar\partial$-正合的，即存在 $E$-值 $(n,p+q-1)$-形式 $\eta$ 使 $\{\bar\partial b_{i_0}\} = \bar\partial\eta$。

### 5.3 引理 par：单位分解给出 $\C{b}{p-k}$ 的显式公式

`main.tex:833-842`：固定 $\mathcal{U}$ 上的单位分解 $\{\rho_i\}_{i \in I}$，记 $\widetilde\rho_i = f^*\rho_i$。则对 $\ell$-上链 $\C{x}{\ell}$（值为 $E$-值 $(n,q)$-形式），取

$$
y_{i_0 \cdots i_{\ell-1}} = \sum_{j \in I} \widetilde\rho_j x_{ji_0\cdots i_{\ell-1}}
$$

即满足 $\C{x}{\ell} = \delta(\C{y}{\ell-1})$。证明是直接的计算。

### 5.4 $\bar\partial$-方程的化为有界线性泛函

`main.tex:867-922`：固定 $X$ 上完备 Kähler 形式 $\omega$（弱伪凸 Kähler 流形允许完备 Kähler 形式）。对满足 $\sqrt{-1}\Theta_g(E) \ge_\mathrm{Nak} f^*\sigma \otimes \mathrm{id}_E$ 的度量 $g$，引入

$$
h := g e^{-2 \chi \circ \Phi}
$$

其中 $\Phi$ 是 $X$ 上穷举光滑多重次调和函数、$\chi: \mathbb{R} \to \mathbb{R}$ 递增凸（后选）。因 $\chi \circ \Phi$ 多重次调和，

$$
\sqrt{-1}\Theta_h(E) = \sqrt{-1}\Theta_g(E) + 2 \sqrt{-1}\partial\bar\partial \chi \circ \Phi \otimes \mathrm{Id}_E \ge_\mathrm{Nak} f^*\sigma \otimes \mathrm{id}_E.
$$

`main.tex:899-922`：考虑线性泛函

$$
\mathrm{Im}\, \bar\partial^* \to \mathbb{C}, \quad w = \bar\partial^* v \mapsto \langle\!\langle v, \{\bar\partial b_{i_0}\} \rangle\!\rangle_{h,\omega},
$$

只要证有界（即存在 $C > 0$ 使 $|\langle\!\langle v, \{\bar\partial b_{i_0}\}\rangle\!\rangle|^2 \le C \|\bar\partial^* v\|^2$ 对一切 $v \in \mathrm{Dom}\, \bar\partial^*$），由 Hahn-Banach 与 Riesz 表示定理即得 $\eta$ 解 $\{\bar\partial b_{i_0}\} = \bar\partial\eta$。

### 5.5 紧支光滑形式的估计

`main.tex:925-957`：只需证紧支光滑 $v$ 的 $|\langle\!\langle v, \{\bar\partial b_{i_0}\}\rangle\!\rangle|^2 \le C(\|\bar\partial v\|^2 + \|\bar\partial^* v\|^2)$。理由是：对任意 $v \in \mathrm{Dom}\, \bar\partial^*$，由 $\omega$ 完备得 Demailly《Complex analytic and differential geometry》Chapter VII 定理 (3.2) 的密度引理，存在紧支光滑 $v_k \to v$（连同 $\bar\partial v_k \to \bar\partial v$、$\bar\partial^* v_k \to \bar\partial^* v$），再用正交分解 $v = v_1 + v_2 \in \mathrm{Ker}\, \bar\partial \oplus (\mathrm{Ker}\, \bar\partial)^\perp$ 化归。

### 5.6 引理 comp：$B_\delta^{-1}$ 的 $\overline{\partial} f^*\rho \wedge \bullet$ 估计

`main.tex:961-1027`：取 $B_\delta = \omega_\delta \Lambda_\omega$，$\omega_\delta = \delta\omega + f^*\sigma$，$B_\delta$ 正定可逆（Demailly 书 Chapter V 命题 (5.8)）。Cauchy-Schwarz 得

$$
|\langle\!\langle v, \{\bar\partial b_{i_0}\}\rangle\!\rangle|^2 \le \langle\!\langle B_\delta^{-1} \{\bar\partial b_{i_0}\}, \{\bar\partial b_{i_0}\}\rangle\!\rangle \cdot \langle\!\langle B_\delta v, v \rangle\!\rangle.
$$

由 Bochner-Kodaira-Nakano 与假设

$$
\lim_{\delta \to 0} \langle\!\langle B_\delta v, v \rangle\!\rangle = \langle\!\langle f^*\sigma \Lambda_\omega v, v \rangle\!\rangle \le \langle\!\langle \sqrt{-1}\Theta_h(E) \Lambda_\omega v, v \rangle\!\rangle \le \|\bar\partial v\|^2 + \|\bar\partial^* v\|^2.
$$

对任意相对紧集 $K \Subset X$，由引理 par 与引理 comp 得

$$
\langle\!\langle B_\delta^{-1} \{\bar\partial b_{i_0}\}, \{\bar\partial b_{i_0}\}\rangle\!\rangle_{K, h, \omega} \le D \sum_{i_0 : U_{i_0} \cap K \neq \emptyset} \sum_{j : U_j \cap U_{i_0} \neq \emptyset} \int_{B_{i_0}} |b_{ji_0}|^2_{h,\omega} |\bar\partial \rho_j|^2_\sigma dV_\omega,
$$

$D$ 不依赖 $\delta$；让 $\chi$ 增长足够快使右端有限，即得

$$
|\langle\!\langle v, \{\bar\partial b_{i_0}\}\rangle\!\rangle|^2 \le C(\|\bar\partial v\|^2 + \|\bar\partial^* v\|^2)
$$

对紧支光滑 $v$。m2 证毕。

### 5.7 引理 comp 的证明

`main.tex:1042-1172`：取局部坐标 $z = (z_1, \ldots, z_n)$ 在 $x$ 使

$$
\omega = \frac{\sqrt{-1}}{2} \sum_{j=1}^n dz_j \wedge d\bar z_j, \quad f^*\sigma = \frac{\sqrt{-1}}{2} \sum_{j=1}^n \lambda_j dz_j \wedge d\bar z_j \quad \text{at } x.
$$

设 $f = (f_1, \ldots, f_m)$ 在 $y = f(x)$ 的局部坐标 $t$ 中（$\sigma = \frac{\sqrt{-1}}{2} \sum dt_j \wedge d\bar t_j$ at $y$），则

$$
\sum_{p=1}^m \frac{\partial f_p}{\partial z_k} \overline{\frac{\partial f_p}{\partial z_\ell}} = \delta_{k\ell} \lambda_k \quad \text{at } x.
$$

对 $\varphi = \sum_I \sum_i \varphi_{I,i} e_i \otimes dz \wedge d\bar z_I$（$e_i$ 在 $x$ 处构成 $E$ 的标准正交基）与 $\bar\partial f^*\rho = \sum_{k,j} \frac{\partial \rho}{\partial \bar t_j}(f(z)) \overline{\frac{\partial f_j}{\partial z_k}(z)} d\bar z_k$，记 $g_k(z) = \sum_j \frac{\partial \rho}{\partial \bar t_j}(f(z)) \overline{\frac{\partial f_j}{\partial z_k}(z)}$。由 Cauchy-Schwarz

$$
|g_k(0)|^2 \le |\bar\partial \rho|^2_\sigma \sum_{p=1}^m \left|\frac{\partial f_p}{\partial z_k}(0)\right|^2.
$$

设 $\mu_j = \delta + \lambda_j$ 为 $\omega_\delta$ 关于 $\omega$ 的特征值。逐项展开得

$$
\langle B_\delta^{-1}(\bar\partial f^*\rho \wedge \varphi), \bar\partial f^*\rho \wedge \varphi \rangle_{h,\omega} \le C_2 |\varphi|^2_\omega |\bar\partial \rho|^2_\sigma \sum_J \frac{\sum_{k \in J} \sum_{p=1}^m \left|\frac{\partial f_p}{\partial z_k}(0)\right|^2}{\sum_{j \in J} (\delta + \sum_{p=1}^m \left|\frac{\partial f_p}{\partial z_j}(0)\right|^2)}.
$$

右端按 $J$ 各项分别 $\le 1$（因 $\sum_p |\partial f_p/\partial z_k|^2 = \lambda_k$ 且 $\lambda_k \le \delta + \lambda_k$），故 $\le C_2 |\varphi|^2_{h,\omega} |\bar\partial \rho|^2_\sigma$。

### 5.8 与 Ohsawa 1984 的对比

`main.tex:1175-1213`：Ohsawa 1984 处理 $q=0$ 的策略：对 $\bar\partial$-闭 $E$-值 $(n,k)$-形式 $f$，构造 $\bar\partial g = f$ 的解使 $\|g\|_\sigma \le C\|f\|_\sigma$，$\|\bullet\|_\sigma = \lim_{\delta \to 0} \|\bullet\|_{\delta\omega + \sigma}$。这一路径要求 $\|f\|_\sigma < \infty$，对 $q > 0$ 时 $\|\bar\partial b_{i_0}\|_\sigma = \infty$（Takegoshi 1995 定理 5.2）。本文改用 $\lim_{\delta\to 0} \langle\!\langle B_\delta^{-1} \bar\partial b_{i_0}, \bar\partial b_{i_0}\rangle\!\rangle$ 有限这一形式，从而绕开 $\|f\|_\sigma < \infty$ 的限制；并把 Ohsawa 1984 的「逐次构造 $g$」换成单射映射 $\varphi_{p,q}$ 在更强曲率假设下取零。

解析空间上 Kähler 形式的定义式逐字（`main.tex:807-815`）：$\sigma$ 先是正则部分 $Y_{\mathrm{reg}}$ 上的 Kähler 形式；称它是 $Y$ 上的 Kähler 形式，当且仅当对每个 $y \in Y$ 存在 $y$ 的开邻域 $U_{y}$ 的局部嵌入 $i \colon U_{y} \hookrightarrow \mathbb{C}^{m}$，与 $i(U_{y})$ 邻域上的 Kähler 形式 $\widetilde{\sigma}$，使得

$$\sigma = i^{*}\widetilde{\sigma} \quad \text{on } U_{y} \cap Y_{\mathrm{reg}}.$$

拉回 $f^{*}\sigma$ 定义为 $f^{-1}(Y_{\mathrm{reg}})$ 上的拉回到整个 $X$ 的延拓，它是 $X$ 上的半正 $(1,1)$-形式（`main.tex:814-815`）。延拓的唯一性与正则部分余集为解析子集这一事实素材未写，登记为薄读之处。

定理 m2 的归约句（`main.tex:816-819`）：只要证 $\varphi_{p,q}$ 在曲率假设下为零映射，再经定理 m1 的单射性即得 $H^{p}(Y, R^q f_{*}(K_{X}\otimes E)) = 0$。$p > 0$ 的前提在 `main.tex:843` 明写为 Assume that $p > 0$。

引理 par 的完整陈述与式（`main.tex:833-842`）：设 $\{x_{\ell}\}$ 为取值在 $E$-值 $(n,q)$-形式的 $\ell$-上循环，则

$$y_{i_{0}\cdots i_{\ell-1}} := \sum_{j \in I} \widetilde{\rho}_{j}\, x_{j i_{0}\cdots i_{\ell-1}}$$

满足 $\{x_{\ell}\} = \delta(\{y_{\ell-1}\})$，其中 $\{\rho_{i}\}_{i \in I}$ 是绑定到 $\mathcal{U}$ 的单位分解、$\widetilde{\rho}_{i} := f^{*}\rho_{i}$（`main.tex:830-831`）。素材声明证明是直接计算并略去（`main.tex:842`，The proof is a straightforward computation, and thus we omit it）。

$(*)$ 的显式解（`main.tex:846-853`）：由引理 par 归纳给出的 $\{b_{p-k}\}$ 具体为

$$b_{i_{0}\cdots i_{p-1}} := \sum_{j \in I} \widetilde{\rho}_{j}\, \mathcal{H}(\alpha_{j i_{0}\cdots i_{p-1}}), \qquad b_{i_{0}\cdots i_{p-k}} := \sum_{j \in I} \widetilde{\rho}_{j}\, \bar\partial b_{j i_{0}\cdots i_{p-k}},$$

特别地末段等式（`main.tex:855-858`）为

$$\bar\partial b_{i_{0}} = \bar\partial\Big(\sum_{j \in I} \widetilde{\rho}_{j}\, \bar\partial b_{j i_{0}}\Big) = \sum_{j \in I} \bar\partial \widetilde{\rho}_{j} \wedge \bar\partial b_{j i_{0}} \quad \text{on } U_{i_{0}},$$

第二个等号用的是 $\bar\partial^{2} = 0$，故 $\bar\partial$ 只落到 $\widetilde{\rho}_{j}$ 上。目标式（`main.tex:860-865`）：造 $X$ 上 $E$-值 $(n, p+q-1)$-形式 $\eta$ 使

$$\{\bar\partial b_{i_{0}}\} = \bar\partial \eta,$$

即 $\varphi_{p,q}(\{\alpha_{p}\}) = \{\bar\partial b_{i_{0}}\}$ 为 $\bar\partial$-正合，从而 $\varphi_{p,q} \equiv 0$。

度量扭曲与曲率式（`main.tex:869-894`）：取 $X$ 上完备 Kähler 形式 $\omega$（弱伪凸 Kähler 流形容许完备 Kähler 形式，`main.tex:869-871`），取满足 $\sqrt{-1}\Theta_{g}(E) \ge f^{*}\sigma \otimes \mathrm{id}_{E}$ 的度量 $g$ 与穷举光滑多重次调和函数 $\Phi$，置

$$h := g\, e^{-2\chi \circ \Phi},$$

$\chi \colon \mathbb{R} \to \mathbb{R}$ 递增凸、稍后选（`main.tex:881-885`）。$\chi \circ \Phi$ 仍多重次调和，故

$$\sqrt{-1}\Theta_{h}(E) = \sqrt{-1}\Theta_{g}(E) + 2\sqrt{-1}\partial\bar\partial(\chi \circ \Phi) \otimes \mathrm{Id}_{E} \ge_{\mathrm{Nak}} f^{*}\sigma \otimes \mathrm{id}_{E},$$

第二项非负故扭曲不破坏假设；此后所有范数关于 $h$ 与 $\omega$ 取（`main.tex:895-898`，并声明略去下标）。

有界性归约（`main.tex:899-922`）：考虑定义在 $\mathrm{Im}\,\bar\partial^{*}$ 上的线性泛函

$$\mathrm{Im}\,\bar\partial^{*} \longrightarrow \mathbb{C}, \qquad w = \bar\partial^{*}v \mapsto \langle\!\langle v, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle_{h,\omega},$$

其中 $\mathrm{Im}\,\bar\partial^{*}$ 是闭算子 $\bar\partial^{*}$ 在 $L^{n,p+q-1}_{(2)}(X, E)_{h,\omega}$ 中的值域（`main.tex:906-908`）。要证的是它良定义且有界，即存在常数 $C > 0$ 使

$$\lvert \langle\!\langle v, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle \rvert^{2} \le C \lVert \bar\partial^{*} v \rVert^{2} \quad \text{for any } v \in \mathrm{Dom}\,\bar\partial^{*}.$$

一旦有界，Hahn-Banach 定理与 Riesz 表示定理给出 $X$ 上的 $E$-值 $(n, p+q-1)$-形式 $\eta$ 满足

$$\langle\!\langle v, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle = \langle\!\langle \bar\partial^{*} v, \eta \rangle\!\rangle\ \text{对一切}\ v \in \mathrm{Dom}\,\bar\partial^{*}, \qquad \lVert \eta \rVert^{2} \le C,$$

它正是 $\{\bar\partial b_{i_{0}}\} = \bar\partial \eta$ 的解（`main.tex:916-922`）。这里 $\eta$ 的 $L^2$ 界 $C$ 就是泛函范数的平方，素材把它与有界性常数并写成一个 $C$。

紧支化归（`main.tex:925-956`）：只要对紧支光滑 $v$ 证

$$\lvert \langle\!\langle v, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle \rvert^{2} \le C(\lVert \bar\partial v \rVert^{2} + \lVert \bar\partial^{*} v \rVert^{2}),$$

即可推到一切 $v \in \mathrm{Dom}\,\bar\partial \cap \mathrm{Dom}\,\bar\partial^{*}$。理由一是密度引理（Demailly 书 Chapter VIII 定理 (3.2)，`main.tex:939-941`）在 $\omega$ 完备的前提下给出紧支光滑列 $v_{k}$ 使 $v_{k} \to v$、$\bar\partial v_{k} \to \bar\partial v$、$\bar\partial^{*} v_{k} \to \bar\partial^{*} v$ 于 $L^{n,\bullet}_{(2)}(X, E)_{h,\omega}$（`main.tex:935-942`，素材在此明写 Here we used the condition that $\omega$ is complete）；理由二是正交分解 $v = v_{1} + v_{2} \in \mathrm{Ker}\,\bar\partial \oplus (\mathrm{Ker}\,\bar\partial)^{\perp}$ 带来的链式不等式

$$\lvert \langle\!\langle v, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle \rvert^{2} = \lvert \langle\!\langle v_{1}, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle \rvert^{2} \le C \lVert \bar\partial^{*} v_{1} \rVert^{2} \le C \lVert \bar\partial^{*} v \rVert^{2}$$

（`main.tex:944-956`）。链中第一个等号要求 $v_{2}$ 一侧的配对为零，素材未写该句理由，登记为薄读之处；按 $\bar\partial b_{i_{0}}$ 为 $\bar\partial$-闭、$\langle\!\langle v_{2}, \bar\partial b_{i_{0}}\rangle\!\rangle = \langle\!\langle \bar\partial v_{2}, \bullet \rangle\!\rangle$ 形的配对可读出，本稿不给完整证明。

关键算子与拆积（`main.tex:961-979`）：置

$$B_{\delta} := \omega_{\delta}\Lambda_{\omega}\ \text{作用于}\ L^{n,\bullet}_{(2)}(X, E)_{h,\omega}, \qquad \omega_{\delta} := \delta\omega + f^{*}\sigma,$$

$B_{\delta}$ 正定故有逆算子 $B_{\delta}^{-1}$（依据 Demailly 书 Chapter VI 命题 (5.8)，`main.tex:969-972`）。由 Cauchy-Schwarz 得本证明的中心拆积：

$$\lvert \langle\!\langle v, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle \rvert^{2} \le \langle\!\langle B_{\delta}^{-1}\{\bar\partial b_{i_{0}}\}, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle \cdot \langle\!\langle B_{\delta} v, v \rangle\!\rangle.$$

第二因子在 $\delta \to 0$ 的极限下由 BKN 恒等式与曲率压过假设控制（`main.tex:982-993`）：

$$\lim_{\delta \to 0}\langle\!\langle B_{\delta} v, v \rangle\!\rangle = \langle\!\langle f^{*}\sigma \Lambda_{\omega} v, v \rangle\!\rangle \le \langle\!\langle \sqrt{-1}\Theta_{h}(E)\Lambda_{\omega} v, v \rangle\!\rangle \le \lVert \bar\partial v \rVert^{2} + \lVert \bar\partial^{*} v \rVert^{2}.$$

三处依据逐个点名：第一个等号是 $\delta\omega\Lambda_{\omega}$ 项随 $\delta$ 归零；第二个不等号用 Nakano 意义下 $f^{*}\sigma \le_{\mathrm{Nak}} \sqrt{-1}\Theta_{h}(E)$ 配 $\Lambda_{\omega}$ 的保序性；第三个不等号即 §2 末尾的 BKN 估计。第一因子（含 $B_{\delta}^{-1}$ 的那一个）由引理 par 与引理 comp 联合控制，见下面 `main.tex:994-1037` 的三重不等式。

第一因子的三重不等式链（`main.tex:999-1024`）逐段：对任意相对紧集 $K \Subset X$，

$$\langle\!\langle B_{\delta}^{-1}\{\bar\partial b_{i_{0}}\}, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle_{K,h,\omega} \le \sum_{i_{0}\in I,\ U_{i_{0}}\cap K\neq\varnothing} \langle\!\langle B_{\delta}^{-1}\bar\partial b_{i_{0}}, \bar\partial b_{i_{0}}\rangle\!\rangle_{B_{i_{0}},h,\omega}$$

$$\le \sum_{i_{0}\in I,\ U_{i_{0}}\cap K\neq\varnothing}\ \sum_{j\in I,\ U_{j}\cap U_{i_{0}}\neq\varnothing} \langle\!\langle B_{\delta}^{-1}\,\bar\partial f^{*}\rho_{j}\wedge\bar\partial b_{ji_{0}},\ \bar\partial f^{*}\rho_{j}\wedge\bar\partial b_{ji_{0}}\rangle\!\rangle_{B_{i_{0}},h,\omega}$$

$$\le D \sum_{i_{0}\in I,\ U_{i_{0}}\cap K\neq\varnothing}\ \sum_{j\in I,\ U_{j}\cap U_{i_{0}}\neq\varnothing} \int_{B_{i_{0}}} \lvert b_{ji_{0}}\rvert^{2}_{h,\omega}\,\lvert \bar\partial\rho_{j}\rvert^{2}_{\sigma}\,dV_{\omega}.$$

第一行是把 $\{\bar\partial b_{i_{0}}\}$ 按覆盖拆开求和，第二行代入显式解 $\bar\partial b_{i_{0}} = \sum_{j}\bar\partial\widetilde{\rho}_{j}\wedge\bar\partial b_{ji_{0}}$（`main.tex:856-858`），第三行用引理 comp。素材在 `main.tex:1024` 声明这三行来自引理 par 与引理 comp，右端与 $\delta$ 无关是因引理 comp 的常数 $D$ 不含 $\delta$（`main.tex:1026-1027`），再取 $\chi$ 增长足够快使右端有限（`main.tex:1028-1029`），最后合起两因子得 $|\langle\!\langle v, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle|^{2} \le C(\lVert\bar\partial v\rVert^{2} + \lVert\bar\partial^{*} v\rVert^{2})$（`main.tex:1032-1036`），证毕（`main.tex:1037`）。登记两处：$\chi$ 的具体选法与增长速率素材未给，只写 choose rapidly increasing function $\chi$；记号 $B_{i_{0}}$ 在 `main.tex:1010` 首次出现而全篇未定义，本稿不猜它的形（按上下文最可能是 $f^{-1}(U_{i_{0}})$ 内的某个相对紧子域，此属本稿读法，素材未如此陈述）。

引理 comp 的陈述式（`main.tex:1042-1053`）：设 $\varphi$ 为 $X$ 上的 $E$-值 $(n,k)$-形式，$\rho$ 为 $Y$ 上光滑函数，则存在正数 $D$，只依赖 $k$ 与 $\mathrm{rank}\, E$，使

$$\bigl\langle B_{\delta}^{-1}(\bar\partial f^{*}\rho \wedge \varphi),\ (\bar\partial f^{*}\rho \wedge \varphi)\bigr\rangle_{h,\omega} \le D\,\lvert\varphi\rvert^{2}_{h,\omega}\,\lvert\bar\partial\rho\rvert^{2}_{\sigma}.$$

注意 $D$ 的依赖清单里不含 $\delta$、不含 $v$、不含点 $x$，正是不含 $\delta$ 才让上面第三行的界对 $\delta$ 一致。素材在陈述处（`main.tex:1050-1051`）右端写作 $\lvert\varphi\rvert^{2}_{h,\omega}$，而证明末行（`main.tex:1158`）写作 $\lvert\varphi\rvert^{2}_{\omega}$，两处只差度量下标；在 $x$ 点取 $E$ 的标准正交基 $e_{i}$ 时二者同值，本稿按同值读并登记该字形差异。

证明里的逐点等式与记号约定（`main.tex:1094-1109`）：在所取坐标下

$$\lvert\varphi\rvert^{2}_{\omega} = \sum_{I}\sum_{i=1}^{\mathrm{rank}\,E}\lvert\varphi_{I,i}\rvert^{2}\ \text{在 } x,\qquad \lvert\bar\partial\rho\rvert^{2}_{\sigma} = \sum_{j=1}^{m}\Bigl\lvert\frac{\partial\rho}{\partial\bar t_{j}}(f(0))\Bigr\rvert^{2}\ \text{在 } y,$$

其中 $dz := dz_{1}\wedge dz_{2}\wedge\cdots\wedge dz_{n}$，$d\bar z_{I} := d\bar z_{i_{1}}\wedge d\bar z_{i_{2}}\wedge\cdots\wedge d\bar z_{i_{k}}$ 对有序多重指标 $I = \{i_{1} < i_{2} < \cdots < i_{k}\}$，$e_{i}$ 是在 $x$ 给出正交基的 $E$ 局部标架（`main.tex:1103-1109`）。展开式的第一行（`main.tex:1128-1151`）为

$$\bigl\langle B_{\delta}^{-1}(\bar\partial f^{*}\rho \wedge \varphi), (\bar\partial f^{*}\rho \wedge \varphi)\bigr\rangle_{h,\omega} = \sum_{J}\sum_{i=1}^{\mathrm{rank}\,E}\Big(\sum_{I\cup\{k\}=J}\mathrm{sgn}\binom{J}{Ik}\varphi_{I,i}\,g_{k}(0)\Big)\Big(\sum_{I'\cup\{k'\}=J}\mathrm{sgn}\binom{J}{I'k'}\varphi_{I',i}\,g_{k'}(0)\Big)\Big(\sum_{j\in J}\mu_{j}\Big)^{-1},$$

这里 $\mu_{j}$ 是 $\omega_{\delta}$ 关于 $\omega$ 的特征值，在 $x$ 点有 $\mu_{j} = \delta + \lambda_{j}$（`main.tex:1123-1125`）；$\mathrm{sgn}\binom{J}{Ik}$ 是重排 $d\bar z_{I}\wedge d\bar z_{k}$ 到 $d\bar z_{J}$ 的符号，素材以 `{\rm{sgn}}\begin{pmatrix} J \\ Ik \end{pmatrix}` 写出而未定义它，本稿按楔积重排符号读并登记为薄读之处。两步放缩（`main.tex:1152-1164`）为

$$\le C_{1}\sum_{J}\sum_{i=1}^{\mathrm{rank}\,E}\sum_{I\cup\{k\}=J}\lvert\varphi_{I,i}\rvert^{2}\,\lvert g_{k}(0)\rvert^{2}\Big(\sum_{j\in J}\mu_{j}\Big)^{-1} \le C_{2}\,\lvert\varphi\rvert^{2}_{\omega}\,\lvert\bar\partial\rho\rvert^{2}_{\sigma}\sum_{J}\frac{\sum_{k\in J}\sum_{p=1}^{m}\bigl\lvert\frac{\partial f_{p}}{\partial z_{k}}(0)\bigr\rvert^{2}}{\sum_{j\in J}(\delta + \sum_{p=1}^{m}\bigl\lvert\frac{\partial f_{p}}{\partial z_{j}}(0)\bigr\rvert^{2})}.$$

第一个不等号的依据是基本不等式 $(\sum_{i=1}^{N}\lvert a_{i}\rvert)^{2} \le 2^{N-1}\sum_{i=1}^{N}\lvert a_{i}\rvert^{2}$，第二个不等号的依据是 $g_{k}(0)$ 的 Cauchy-Schwarz 估计；常数 $C_{1}, C_{2} > 0$ 只依赖 $k$ 与 $\mathrm{rank}\, E$（`main.tex:1165-1169`）。末项的分子按 $\sum_{p}\lvert\partial f_{p}/\partial z_{k}(0)\rvert^{2} = \lambda_{k}$ 与分母 $\delta + \lambda_{k}$ 逐项相消，故该分式对一切 $\delta > 0$ 不超过 $1$（`main.tex:1170`），引理 comp 得证。

与 Ohsawa 1984 对比的三条注记（`main.tex:1175-1214`）逐式：

注 (1)：Ohsawa 在完备 Kähler 流形上对 $\bar\partial$-闭 $E$-值 $(n,k)$-形式 $f$ 造 $\bar\partial g = f$ 的解使

$$\lVert g \rVert_{\sigma} \le C \lVert f \rVert_{\sigma} \quad \text{只要 } \lVert f \rVert_{\sigma} < \infty, \qquad \lVert \bullet \rVert_{\sigma} := \lim_{\delta \to 0}\lVert \bullet \rVert_{\delta\omega + \sigma},$$

$\lVert\bullet\rVert_{\delta\omega+\sigma}$ 是按 Kähler 形式 $\delta\omega + \sigma$ 取的 $L^2$ 范数（`main.tex:1186-1187`，precise statement 引 Ohsawa 定理 2.8）。

注 (2)：$q > 0$ 时 $\lVert\bar\partial b_{i_{0}}\rVert_{\sigma} < \infty$ 不成立，素材声明可由 Takegoshi 定理 5.2 证得 $\lVert\bar\partial b_{i_{0}}\rVert_{\sigma} = \infty$（`main.tex:1193-1196`），故本文改估 $\lim_{\delta\to 0}\langle\!\langle B_{\delta}^{-1}\{\bar\partial b_{i_{0}}\}, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle$ 的有限性（`main.tex:1197-1199`）。

注 (3)：同一计算可验

$$\lim_{\delta \to 0}\langle\!\langle B_{\delta}^{-(p+q)}\{\bar\partial b_{i_{0}}\}, \{\bar\partial b_{i_{0}}\}\rangle\!\rangle < \infty,$$

若能从 $\lim_{\delta\to 0}\langle\!\langle B_{\delta}^{-k} f, f \rangle\!\rangle < \infty$ 造出 $\bar\partial g = f$ 的解满足 $\lim_{\delta\to 0}\langle\!\langle B_{\delta}^{-(k-1)} g, g \rangle\!\rangle < \infty$，就可照 Ohsawa 的逐次构造法证定理 m2；素材明写这一策略没有成功（However this strategy did not succeed，`main.tex:1212`），因此必须回到定理 m1 造出的单射 $\varphi_{p,q}$。这一段是本论文方法选择的自述，也是 m1 与 m2 的逻辑接口。

## 6 与本语料的接缝

本稿在 D318 与 D385 两份研究笔记中被引用，bib key 均为 `Matsumura2018`。两稿均把 m1 的分解与 m2 的消没当作「Nakano 半正丛 + Leray 谱序列 → 高阶直接像结构」的核心工具。

- D318 中由定理 m1（`main.tex:168-188`）得到单射 $\varphi_{p,q}: H^p(Y, R^q f_*(K_X \otimes E)) \to H^{p+q}(X, K_X \otimes E)$，并以推论 m1-co（`main.tex:202-218`）推出 $X$ 紧时的直接和分解 $H^\ell = \bigoplus_{p+q=\ell} \mathrm{Im}\, \varphi_{p,q}$，再用定理 m2（`main.tex:249-261`）的 $H^p(Y, R^q f_*(K_X \otimes E)) = 0$（$p > 0$）配合 D318 的具体几何情形给出各高阶直接像的具体维数。具体在哪一节、以何节标题引用本稿，请以 D318 的最终稿面为准。
- D385 中主要引用定理 m2 的消没形式 `main.tex:249-261` 与定理 Tak（`main.tex:311-342`）的调和形式-Dolbeault 上同调等价，籍此把 D385 中待证的高阶直接像的维数下降归约为 Bochner-Kodaira-Nakano 估计；推论 m1-co 的 $F^m$ 乘映射单射性（`main.tex:202-218`）作为辅助。

本稿记号约定（KaTeX 形态）：

- $K_X$、$R^q f_*$、$\Theta_h(E)$：典范丛、高阶直接像、曲率形式（`main.tex:130-134`、`main.tex:386-395`）。
- $\mathcal{H}^{n,k}(X_U, E, \Phi_U)$：调和形式空间（`main.tex:297-307`），$\mathcal{H}_U$ 为 Dolbeault 上同调的逆映射（`main.tex:347-353`）。
- $\varphi_{p,q}$：m1 给出的自然同态（`main.tex:168-188`）；$\Phi_s$：$F^m$ 截面诱导的乘映射（`main.tex:213-217`）。
- $B_\delta = \omega_\delta \Lambda_\omega$、$\omega_\delta = \delta\omega + f^*\sigma$：m2 证明中的关键算子与 Kähler 形式族（`main.tex:962-967`）。
- $\Lambda_\omega$、$dV_\omega = \omega^n / n!$：逐点伴随算子与体积形式（`main.tex:384-395`）。

D318 / D385 若需直接定位本稿内部条目，按节号：主定理 m1 / m2 / 推论 m1-co 在 §1.3-§1.5；Takegoshi 工具在 §2.1-§2.5；$\varphi_{p,q}$ 构造与单射性在 §3.1-§3.6；直接和分解与 $F^m$ 乘映射在 §4.1-§4.3；m2 证明与引理 par / comp 在 §5.1-§5.7；与 Ohsawa 1984 的对比在 §5.8。