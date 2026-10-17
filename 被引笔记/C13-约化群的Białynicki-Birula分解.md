# C13 约化群的 Białynicki-Birula 分解（arXiv:1805.11558）

## 0 取证边界

- arXiv id：1805.11558
- 作者（原文署名逐字）：Joachim Jelisiejew, Łukasz Sienkiewicz
- 发表年月：2018-05-29
- 素材目录：`E:\math\被引素材\1805.11558`
- 主 tex 清单（实测字节/行数）：
  - `被引素材/1805.11558/main.tex`（188609 字节 / 3545 行）
- 本语料引用它的稿号与 bib key：D305（bib key `JS2018`）；D385（bib key `JelisiejewSienkiewicz2019`）；D447（bib key `JelisiejewSienkiewicz2019`）；D471（bib key `JelisiejewSienkiewicz2019`）
- 取材薄读之处：脚注致谢段、`Acknowledgements`、`thebibliography` 部分按用途略读，主定理证明中段按主线详读；本稿按"宣言 - 例 - 关键证明环节"三条线写。

## 1 BB 函子 $\mathcal{D}_{X}$ 的定义与存在性

这一节抄录论文核心构造。设 $\operatorname{k}$ 为域，$\operatorname{X}$ 为 $\operatorname{k}$ 上有限型 $\mathbf{G}$-概形，$\sigma\colon \mathbf{G} \times \operatorname{X} \to \operatorname{X}$ 是 $\mathbf{G}$ 的左作用。论文把"$\mathbb{A}^1$ 的 $\mathbb{G}_m$-作用"替换为"线性约化幺半群 $\overline{\mathbf{G}}$ 的 $\mathbf{G}$-作用"。BB 函子 $\mathcal{D}_{\operatorname{X}}=\mathcal{D}_{\operatorname{X},\overline{\mathbf{G}}}\colon \mathbf{Sch}_{\operatorname{k}}^{\mathrm{op}}\to \mathbf{Set}$ 定义为
$$
\mathcal{D}_{X}(S)=\bigl\{\varphi\colon \overline{\mathbf{G}} \times S \to \operatorname{X} \mid \varphi \text{ 是 } \mathbf{G}\text{-等变}\bigr\},
$$
其中 $\mathbf{G}$ 在 $\overline{\mathbf{G}}$ 上左乘、在 $S$ 上平凡、在 $\operatorname{X}$ 上经 $\sigma$ 作用（位置串：`main.tex:289-294` 的 equation 环境）。

每个 $\varphi$ 在 $\mathbf{G}$-点 $1$ 与零元 $0_{\overline{\mathbf{G}}}\in \overline{\mathbf{G}}$ 处分别截断给出两条自然态射：

$$
 i_{\operatorname{X}}\colon \operatorname{X}^+\to \operatorname{X},\quad \varphi\mapsto \varphi_{|1\times S},\qquad \pi_{\operatorname{X}}\colon \operatorname{X}^+\to \operatorname{X}^{\mathbf{G}},\quad \varphi\mapsto \varphi_{|0\times S},
$$
$s_{\operatorname{X}}\colon \operatorname{X}^{\mathbf{G}}\to \operatorname{X}^+$ 把 $\operatorname{X}^{\mathbf{G}}$ 上的常值族嵌回 $\operatorname{X}^+$（位置串：`main.tex:319-326`、`main.tex:515-521`）。论文用图 `eq:diagramWhatIsGoingOn`（位置串 `main.tex:411`）将这一对态射可视化为"忘记极限"与"取极限"两端。

主定理 1.1（位置串 `main.tex:419-427`，编号 `ref:introRepresentability:thm`）。

> 定理 1.1（BB 分解的存在性）。设 $\operatorname{X}$ 是 $\operatorname{k}$ 上有限型 $\mathbf{G}$-概形，则 $\mathcal{D}_{\operatorname{X}}$ 被一个 $\operatorname{k}$ 上有限型概形 $\operatorname{X}^+$ 表示，且 $\operatorname{X}^+$ 上有自然的 $\overline{\mathbf{G}}$-作用。态射 $\pi_{\operatorname{X}}\colon \operatorname{X}^+\to \operatorname{X}^{\mathbf{G}}$ 是有限型仿射且等变的。

论文在此前作了简化：在 §0 之后把一般 $\overline{\mathbf{G}}$ 用 **induction** 替换成"带零元且连通单位群"的线性约化幺半群 $\overline{\mathbf{N}}$（位置串 `main.tex:1453-1508` 中的 `ref:reductionToMonoidWithZero:thm`）。这一替换保证 $\operatorname{X}^+$ 的两个结构态射在拓扑上良好。

在文献定位上，本文的 BB 函子 $\mathcal{D}_{\operatorname{X}}$ 直接推广了 Drinfeld 的 $\mathbb{G}_m$-BB 分解
$$
\operatorname{X}^+(S)=\{\varphi\colon \mathbb{A}^1 \times S \to \operatorname{X}\mid \varphi \text{ 是 } \mathbb{G}_m\text{-等变}\},
$$
并把 $\Hilb_d\mathbb{A}^n$ 等奇异模空间上的 BB 分析扩到 $\GL_n$-轨道（位置串 `main.tex:230-256`）。论文以定理形式给出存在性是本节落点，下一节把它对仿射情形显式化为闭子概形。

## 2 仿射情形：BB 分解 = 由外部表示生成的理想闭子概形

本节固定 $\operatorname{X}=\Spec A$ 是仿射 $\mathbf{G}$-概形。这一节给出"outsider representation"概念并证明仿射 BB 分解的显式构造（位置串 `main.tex:1539-1670`）。

定义 2.1（位置串 `main.tex:1550-1553`）。设 $V$ 是不可约 $\mathbf{G}$-表示。若 $V$ 出现在 $H^0(\overline{\mathbf{G}},\cO_{\overline{\mathbf{G}}})$ 中则称 $V$ 是 $\overline{\mathbf{G}}$-表示，否则称 $V$ 是 **outsider 表示**。

论文给出关键判据（位置串 `main.tex:1578-1616`，编号 `ref:mainRepr:lem`）：设 $V$ 是 $\mathbf{G}$-表示，则下面三条等价。

(1) 作用 $\mathbf{G}\times V\to V$ 可延拓为 $\overline{\mathbf{G}}\times V\to V$；
(2) 余作用 $V\to H^0(\mathbf{G},\cO_{\mathbf{G}})\otimes V$ 经过 $H^0(\overline{\mathbf{G}},\cO_{\overline{\mathbf{G}}})\otimes V$；
(3) $V$ 不含 outsider 表示。

证明里所用的代数恒等式 $H^0(\mathbf{G},\cO_{\mathbf{G}})=\bigoplus_V V\otimes V^{\vee}$（$\mathbf{G}\times \mathbf{G}^{\mathrm{op}}$-等变，见 `main.tex:840-855`）说明 $H^0(\overline{\mathbf{G}},\cO_{\overline{\mathbf{G}}})\subset H^0(\mathbf{G},\cO_{\mathbf{G}})$ 是 $(\mathbf{G}\times \mathbf{G}^{\mathrm{op}})$-子表示，从而不可约 $\mathbf{G}\times \mathbf{G}^{\mathrm{op}}$-表示在 $H^0(\overline{\mathbf{G}},\cO_{\overline{\mathbf{G}}})$ 中以重数一出现（`main.tex:859-875` 的 `ref:isotypiccomponents:prop`）。该重数一性质是后面仿射 BB 表示能写成"理想闭子概形"的关键。

命题 2.2（仿射 BB 表示，位置串 `main.tex:1618-1670`，编号 `ref:representabilityForAffine:prop`）。

> 命题 2.2。设 $\operatorname{X}=\Spec A$ 是仿射 $\mathbf{G}$-概形，则 $\mathcal{D}_{\operatorname{X}}$ 被一个闭子概形 $\operatorname{X}^+=\Spec(A/I)\hookrightarrow \operatorname{X}$ 表示，其中 $I$ 由 $A$ 中的所有 outsider 表示生成。

证明要点（位置串 `main.tex:1626-1670`）：设 $f^{\#}\colon A\to H^0(\overline{\mathbf{G}},\cO_{\overline{\mathbf{G}}})\otimes C$ 是 $\mathbf{G}$-等变族 $f\colon \overline{\mathbf{G}}\times S\to \operatorname{X}=\Spec A$ 对应的代数同态。由于右端只含 $\overline{\mathbf{G}}$-表示，所有 outsider 表示都进入 $\ker f^{\#}$，故 $f$ 分解为
$$
\overline{\mathbf{G}}\times S\to \Spec(A/I)\hookrightarrow \Spec A.
$$
定义 $\overline{\sigma}_Z\colon \overline{\mathbf{G}}\times Z\to Z$ 为 $\overline{\mathbf{G}}$ 在 $Z$ 上的作用（判据 2.1(3) 保证它存在）；再用稠密性 $\mathbf{G}\subset \overline{\mathbf{G}}$ 与 $Z$ 的分离性把 $f$ 唯一表为 $\overline{\sigma}_Z$ 的拉回，从而 $(Z,\overline{\sigma}_Z)$ 是 $\mathcal{D}_{\operatorname{X}}$ 的泛对象。

论文 `main.tex:1672-1677` 还讨论了一个 $\mathbb{G}_m$-特例：若 $\overline{\mathbf{G}}=\Spec \operatorname{k}[t]$、$\mathbb{G}_m=\Spec \operatorname{k}[t^{\pm 1}]$、$\operatorname{X}=\Spec A$ 带 $\mathbb{Z}$-分次 $A=\bigoplus_i A_i$，则 $\operatorname{X}^+=\Spec(A/A_{<0}\cdot A)$。

仿射例子 `ex:actionGoesRight` 与 `ex:actionGoesWrong`（位置串 `main.tex:1679-1692`）展示 $\operatorname{X}^+$ 的奇异性：取 $\operatorname{X}=\Spec\operatorname{k}[x,y]/(xy)$、权重 $(-1,1)$ 的 $\mathbb{G}_m$-作用时 $\operatorname{X}^+=\Spec\operatorname{k}[y]$ 是光滑的，即便 $\operatorname{X}$ 不光滑；而 $\operatorname{X}=\Spec\operatorname{k}[x,y,z]/(xy-z^2)$、权重 $(-1,1,0)$ 时 $\operatorname{X}^{\mathbb{G}_m}=\Spec\operatorname{k}[z]/z^2$ 与 $\operatorname{X}^+=\Spec\operatorname{k}[y,z]/z^2$ 都不约化但 $\pi_{\operatorname{X}}$ 光滑。这些反例在 §1 的存在性框架下都是合规的，不平滑/不正规不破坏表示性。

## 3 线性约化幺半群 $\overline{\mathbf{G}}$ 与归纳构造

这一节处理"如何把一般线性约化幺半群 $\overline{\mathbf{G}}$ 化为带零元的 $\overline{\mathbf{N}}$"，是 §1 主定理能成立的关键步骤。

定义 3.1（位置串 `main.tex:783-787`）。设 $\mathbf{G}$ 是线性约化群。一个**线性约化幺半群** $\overline{\mathbf{G}}$ 是一个代数幺半群，其单位群 $\overline{\mathbf{G}}^{\times}\simeq \mathbf{G}$ 在 $\overline{\mathbf{G}}$ 中稠密。

定义 3.2（带零元/有根，位置串 `main.tex:1046-1052`）。若存在 $0_G\in \overline{\mathbf{G}}(\operatorname{k})$ 满足 $\overline{\mathbf{G}}\cdot 0_G=0_G$，则称 $\overline{\mathbf{G}}$ 是**带零元**的幺半群；$\overline{\mathbf{F}}=\{0_G\}$ 是 $\overline{\mathbf{G}}$ 的唯一闭 $\mathbf{G}$-轨道。若 $\overline{\mathbf{F}}(\operatorname{k})\neq \varnothing$ 则称 $\overline{\mathbf{G}}$ **有根**（pointed）。

引理 3.3（位置串 `main.tex:1024-1040`，编号 `ref:smallestorbit:lem`）。设 $\overline{\mathbf{G}}$ 是线性约化幺半群，则 $\overline{\mathbf{G}}$ 中存在唯一的闭左 $\mathbf{G}$-轨道 $\overline{\mathbf{F}}$，它是所有非空闭 $\mathbf{G}$-稳定子概形的交，并且也等于唯一的闭右 $\mathbf{G}$-轨道。

证明利用引理 `com1`（`main.tex:891-900`）：若有两个互不相交的闭 $\mathbf{G}$-轨道 $O_1,O_2$，则存在 $\mathbf{G}$-不变正则函数 $f$ 在 $O_1$ 取 $0$、$O_2$ 取 $1$，但 $\overline{\mathbf{G}}$ 上整体 $\mathbf{G}$-不变函数是常数（因为 $H^0(\overline{\mathbf{G}},\cO_{\overline{\mathbf{G}}})^{\mathbf{G}}\subset H^0(\mathbf{G},\cO_{\mathbf{G}})^{\mathbf{G}}=\operatorname{k}$），矛盾。

引理 3.4（Kempf 直线，位置串 `main.tex:1059-1086`，编号 `pointedness`）。设 $\operatorname{k}$ 是完全域，$\overline{\mathbf{G}}$ 是 $\operatorname{k}$ 上线性约化幺半群。则存在 $\mathbb{G}_m\to \mathbf{G}$ 与 $\mathbb{A}^1_{\operatorname{k}}\to \overline{\mathbf{G}}$（Kempf 直线）使得 $\varphi(1)=1_{\mathbf{G}}$，$\varphi(0)\in \overline{\mathbf{F}}$。特别地 $\overline{\mathbf{G}}$ 有根。

证明（位置串 `main.tex:1068-1083`）：把 $\overline{\mathbf{G}}$ 嵌入 $\mathbf{G}$-仿射空间 $V$，则 $\overline{\mathbf{F}}\subset \overline{\mathbf{G}\cdot 1_{\mathbf{G}}}$，而 $\mathbf{G}^0_{\overline{k}}$ 与 $\overline{\mathbf{F}}$ 相交（$\overline{\mathbf{F}}$ 是轨道，$\mathbf{G}^0_{\overline{k}}$ 在闭包中稠密）。用 Hilbert-Mumford 判据（`main.tex:1076`）在完全域上的版本（`Kempf_Hilbert_Mumford_perfect_field` 的 Corollary 4.3）给出所需 $\mathbb{G}_m$。

推论 3.5（位置串 `main.tex:1099-1106`，编号 `ref:KempfTorusInvariants:cor`）。设 $\operatorname{k}$ 完全，$\overline{\mathbf{G}}$ 带零元，单位群为 $\mathbf{G}$。任一 Kempf 环面 $\mathbb{G}_{m, \operatorname{k}}\to \mathbf{G}$ 满足 $\overline{\mathbf{G}}^{\mathbb{G}_{m, \operatorname{k}}}=0_{\overline{\mathbf{G}}}$，故 $H^0(\overline{\mathbf{G}},\cO_{\overline{\mathbf{G}}})_0=\operatorname{k}$ 在所诱导的 $\mathbb{N}$-分次中。

证明：固定 $\varphi\colon \mathbb{A}^1\to \overline{\mathbf{G}}$，则 $\Phi\colon \mathbb{A}^1\times \overline{\mathbf{G}}\to \overline{\mathbf{G}}$ 是 $\mathbb{A}^1$-作用。对 $g\in \overline{\mathbf{G}}^{\mathbb{G}}(\operatorname{k})$，有
$$
\Phi(0,g)=\Phi(1,g).
$$
又 $0_{\overline{\mathbf{G}}}\cdot g=0_{\overline{\mathbf{G}}}$，故 $\overline{\mathbf{G}}^{\mathbb{G}}=\{0_{\overline{\mathbf{G}}}\}$。

推论 3.6（位置串 `main.tex:1124-1151`，编号 `ref:KempfTorus:cor`）。设 $\operatorname{k}$ 完全、$\overline{\mathbf{G}}$ 带零元、$W=\Spec B$ 是带 $\overline{\mathbf{G}}$-作用的仿射 $\operatorname{k}$-概形，则对任何 Kempf 环面所诱导的 $\mathbb{N}$-分次 $B=\bigoplus_{i\geq 0}B_i$ 都有 $W^{\mathbf{G}}=W^{\mathbb{G}_m}$，故 $W^{\mathbf{G}}\subset W$ 的理想为 $B_+=\bigoplus_{i\geq 1}B_i$。特别地，$\bigcap_n I(W^{\mathbf{G}}\subset W)^n=0$。

证明：$B_+\subset J$（其中 $J$ 为 $W^{\mathbf{G}}$ 的理想），把余作用 $\Delta\colon B\to H^0(\overline{\mathbf{G}},\cO_{\overline{\mathbf{G}}})\otimes B$ 的权重写到 $0$ 即得 $\Delta(B)\subset \operatorname{k}\otimes B$，从而作用 $\overline{\mathbf{G}}\times W\to W$ 因子化为
$$
\overline{\mathbf{G}}\times W\stackrel{pr_1\times \id_W}{\longrightarrow} 0_{\overline{\mathbf{G}}}\times W\to W,
$$
所以 $W=W^{\mathbf{G}}$。

定理 3.7（归约到带零元的子幺半群，位置串 `main.tex:1453-1508`，编号 `ref:reductionToMonoidWithZero:thm`）。设 $\mathbf{G}$ 是线性约化群，$\overline{\mathbf{G}}$ 是以 $\mathbf{G}$ 为单位群、作为概形是 normal 的代数幺半群。设 $\overline{\mathbf{F}}$ 为所有闭左 $\mathbf{G}$-稳定子概形之交，$\mathbf{N}$ 为 $\overline{\mathbf{F}}(\operatorname{k})$ 中某点的稳定子，$\overline{\mathbf{N}}$ 为 $\mathbf{N}$ 在 $\overline{\mathbf{G}}$ 中的闭包。则

(1) $\mathbf{N}$ 线性约化且几何连通；
(2) $\overline{\mathbf{N}}$ 是带零元、单位群 $\mathbf{N}$ 的线性约化幺半群，且作为概形 normal 且不可约；
(3) 对任何带 $\mathbf{G}$-作用的概形 $\operatorname{X}$，限制映射
$$
\varphi\mapsto \varphi_{|\overline{\mathbf{N}}\times S}
$$
给出函子同构 $\mathcal{D}_{\operatorname{X},\overline{\mathbf{G}}}\to \mathcal{D}_{\operatorname{X},\overline{\mathbf{N}}}$，且在 $\operatorname{X}$ 上函子。

证明关键点（位置串 `main.tex:1478-1508`）：先由引理 `ref:Nlinred:lem` 与命题 `ref:Nproperties:prop` 得到 (1)，命题 `ref:isoOnMonoids:prop` 给出 $\overline{\mathbf{G}}\simeq (\mathbf{G}\times \overline{\mathbf{N}})/\mathbf{N}^{\mathrm{diag}}$（其中 $\mathbf{N}^{\mathrm{diag}}$ 是对角嵌入 $\mathbf{N}^{\mathrm{diag}}\subset \mathbf{G}\times \overline{\mathbf{N}}$），由此推出 (2)。对于 (3)，由 $\psi\colon \overline{\mathbf{N}}\times S\to \operatorname{X}$ 重构 $\hat\psi\colon \overline{\mathbf{G}}\times S\to \operatorname{X}$：先把 $\psi$ 经 $\mathbf{G}$-作用扩张为 $\widetilde\psi\colon \mathbf{G}\times \overline{\mathbf{N}}\times S\to \operatorname{X}$（按 $\widetilde\psi(g,\bar n,s)=\sigma(g,\psi(\bar n,s))$），再用 $\overline{\mathbf{G}}\simeq (\mathbf{G}\times \overline{\mathbf{N}})/\mathbf{N}$ 的商映射诱导出 $\overline{\mathbf{G}}\times S\to \operatorname{X}$ 上的族；逆过程即限制到 $\overline{\mathbf{N}}\times S$。

这一归约把 §1 主定理的证明归到 $\overline{\mathbf{G}}$ 带零元、单位群连通的"正规情形"。定理 1.1 的 $\overline{\mathbf{G}}$-作用结构（$\pi_{\operatorname{X}}$ 仿射等变）即由此结构继承而来。

## 4 形式 BB 函子 $\widehat{\mathcal{D}}_{X}$ 与代数化

第 4 节是 §1 主定理的证明核心：先证 $\widehat{\mathcal{D}}_{X}$ 在比 $\mathcal{D}_{\operatorname{X}}$ 更弱的假设下表示，再用 $\mathcal{D}_{\operatorname{X}}\to \widehat{\mathcal{D}}_{X}$ 的同构把表示性回推。

定义 4.1（形式 BB 函子，位置串 `main.tex:611-617` 的 equation 环境）。设 $\operatorname{X}$ 是 $\mathbf{G}$-概形，记 $\overline{\mathbf{G}}_n$ 为 $0\in \overline{\mathbf{G}}$ 的第 $n$ 阶无穷小邻域。形式 BB 函子 $\widehat{\mathcal{D}}_{X}\colon \mathbf{Sch}_{\operatorname{k}}^{\mathrm{op}}\to \mathbf{Set}$ 定义为
$$
\widehat{\mathcal{D}}_{X}(Z)=\bigl\{(\varphi_n)_{n\in\mathbb N}\mid \varphi_n\colon \overline{\mathbf{G}}_n\times Z\to \operatorname{X},\ \varphi_n\text{ 为 } \mathbf{G}\text{-等变},\ \varphi_{n+1|\overline{\mathbf{G}}_n\times Z}=\varphi_n\bigr\}.
$$
每个 $\mathcal{D}_{\operatorname{X}}(S)\to \widehat{\mathcal{D}}_{X}(S)$ 是限制映射。

定理 4.2（形式化同构，位置串 `main.tex:624-627`，编号 `ref:algebraizationABB`）。设 $\operatorname{X}$ 是 $\operatorname{k}$ 上有限型 $\mathbf{G}$-概形，则限制映射 $\mathcal{D}_{\operatorname{X}}\to \widehat{\mathcal{D}}_{X}$ 是同构。

论文在 `main.tex:660-680` 引用 Alper-Hall-Rydh `AHR` 的定理 2.6（位置串 `main.tex:663-670`，编号 `ref:etalestableneighbourhoods:thm`）来证这一同构：AHR 给出在代数闭域上每个 $\mathbf{G}$-不动点存在仿射 $\mathbf{G}$-稳定 étale 邻域，论文用此把无穷小信息代数化。

定义 4.3（形式 $\overline{\mathbf{G}}$-概形，位置串 `main.tex:2138-2158`）。形式 $\mathbf{G}$-概形是带 $\mathbf{G}$-等变闭浸入链 $Z_0\hookrightarrow Z_1\hookrightarrow \cdots$ 的序列 $\{Z_n\}_{n\in\mathbb N}$，满足 (i) $Z_0=Z_n^{\mathbf{G}}$ 概形论上成立；(ii) $Z_m\subset Z_n$ 由 $\mathcal I_n^{m+1}$ 定义，其中 $\mathcal I_n$ 是 $Z_0\subset Z_n$ 的理想。

定义 4.4（局部线性 $\overline{\mathbf{G}}$-概形，位置串 `main.tex:2251-2256`，编号 `ref:locallylinear:def`）。若 $\overline{\mathbf{G}}$-概形 $Z$ 可被一族仿射 $\overline{\mathbf{G}}$-稳定开子概形覆盖，则称 $Z$ 为**局部线性** $\overline{\mathbf{G}}$-概形。

定理 4.5（形式 $\overline{\mathbf{G}}$-概形的代数化，位置串 `main.tex:2277-2288`，编号 `ref:algebraizationOfFormalSchemes:thm`）。设 $\mathcal Z=\{Z_n\}$ 是形式 $\overline{\mathbf{G}}$-概形，则在局部线性 $\overline{\mathbf{G}}$-概形范畴中存在 colimit
$$
Z=\colim_n Z_n,
$$
且 $Z$ 是 $\mathcal Z$ 的唯一代数化。若 $\mathcal Z$ 局部 Noetherian，则 $\pi_{Z}\colon Z\to Z^{\mathbf{G}}$ 有限型；若再设 $Z_0$ 有限型则 $Z$ 也有限型。

证明骨架（位置串 `main.tex:2349-2454`）：取 $\mathcal A_n=(\pi_{Z_n})_*\cO_{Z_n}$，对每个 $\lambda\in \operatorname{Irr}(\overline{\mathbf{G}})$ 由稳定化引理（编号 `ref:stability:lem`，位置串 `main.tex:2306-2347`）得到 $n_{\lambda}=\sup A_{\lambda}$（其中 $A_{\lambda}$ 是 $\operatorname{k}[\mathbf{G}]_{\lambda}$ 中出现的 Kempf 环面权重的有限集），从而对 $n>n_{\lambda}$，$\mathcal A_n[\lambda]\twoheadrightarrow \mathcal A_{n-1}[\lambda]$ 是同构。定义 $\mathcal A[\lambda]=\mathcal A_{n_{\lambda}}[\lambda]$，
$$
\mathcal A=\bigoplus_{\lambda\in \operatorname{Irr}(\overline{\mathbf{G}})}\mathcal A[\lambda]=\bigoplus_{\lambda\in \operatorname{Irr}(\overline{\mathbf{G}})}\mathcal A_{n_{\lambda}}[\lambda],
$$
则 $\mathcal A=\lim_n \mathcal A_n$ 在 $\overline{\mathbf{G}}$-代数范畴。令 $Z=\Spec_{Z_0}\mathcal A$。

稳定化引理（位置串 `main.tex:2306-2347`）的关键等式：取 Kempf 环面诱导的 $\N$-分次 $\operatorname{k}[\overline{\mathbf{G}}]=\bigoplus_{i\geq 0}\operatorname{k}[\overline{\mathbf{G}}]_i$，由推论 `ref:KempfTorusInvariants:cor` 得 $\mathcal I_n=\bigoplus_{i\geq 1}\mathcal A_n[i]$，其中 $\mathcal I_n$ 是 $Z_0\subset Z_n$ 的理想。当 $n>n_{\lambda}=\sup A_{\lambda}$ 时
$$
\mathcal I_n^n\subset \bigoplus_{i\geq n}\mathcal A_n[i]\subset \bigoplus_{i\notin A_{\lambda}}\mathcal A_n[i],
$$
故 $\mathcal I_n^n[\lambda]=0$。由于 $\mathcal I_n^n[\lambda]=\ker(\mathcal A_n[\lambda]\twoheadrightarrow \mathcal A_{n-1}[\lambda])$，遂得稳定化。

定理 4.6（形式 BB 函子的表示性，位置串 `main.tex:2703-2716`，编号 `ref:representabilityformal:thm`）。设 $\operatorname{X}$ 是 $\operatorname{k}$ 上带 $\mathbf{G}$-作用的代数空间，则 $\widehat{\mathcal{D}}_{X}$ 可由代数空间表示，且 $\widehat{\mathcal{D}}_{X}\to \operatorname{X}^{\mathbf{G}}$ 是仿射的。进一步：(i) 若 $\operatorname{X}$ 是概形则 $\widehat{\mathcal{D}}_{X}$ 由概形表示；(ii) 若 $\operatorname{X}$ 局部 Noetherian 则 $\pi$ 有限型；若再设 $\operatorname{X}^{\mathbf{G}}$ 有限型则 $\widehat{\mathcal{D}}_{X}$ 有限型。

证明（位置串 `main.tex:2717-2800`）：选 étale 覆盖 $p\colon U\to \operatorname{X}$，由引理 `ref:liftingOfEtaleActions:lem`（位置串 `main.tex:2495-2560`）把 $\mathbf{G}$-作用唯一提升到每个 $U_n$（因为 $\operatorname{X}^{\mathbf{G}}\subset \operatorname{X}$ 的理想局部幂零）。在每个 $U_n$ 中取 BB 分解 $\mathcal{D}_{U_n}$ 的闭子概形 $Z_n\subset U_n$，由命题 `ref:closedImmersions:prop` 知 $Z_m=Z_n\cap U_m$，从而 $\{Z_n\}$ 构成形式 $\overline{\mathbf{G}}$-概形；应用定理 4.5 得其代数化 $Z$，由 étale 下降得 $Z$ 表示 $\widehat{\mathcal{D}}_{\operatorname{X}}$。

引理 4.7（提升引理，位置串 `main.tex:2495-2560`，编号 `ref:liftingOfEtaleActions:lem`）。设 $Y$ 是带 $\mathbf{G}$-作用的概形（或代数空间），$\operatorname{X}^{\mathbf{G}}\subset Y$ 的理想局部幂零；$\pi\colon U\to Y$ 是 étale 态射，则存在唯一的 $\mathbf{G}$-作用在 $U$ 上使 $\pi$ 等变。

注记：当态射退化为开嵌入时这一引理退化为 $\sigma(\mathbf{G}\times U)\subset U$，因 $\sigma(g,u)=u$；对一般 étale 态射需在 étale 拓扑下用下降论证（位置串 `main.tex:2517-2560`）。

命题 4.8（仿射情形 $\mathcal{D}_{\operatorname{X}}\to \widehat{\mathcal{D}}_{X}$ 是同构，位置串 `main.tex:2609-2673`，编号 `ref:agreementForAffine:lem:newversion`）。设 $W$ 是带 $\mathbf{G}$-作用的仿射概形，则 $\mathcal{D}_{W}\to \widehat{\mathcal{D}}_{W}$ 是同构；若 $W$ 是 $\overline{\mathbf{G}}$-概形，则两函子都由 $W$ 表示。

证明要点（位置串 `main.tex:2614-2673`）：用命题 2.2 把 $\mathcal{D}_{W}$ 表示为 $W$ 的闭子概形 $W^+$，由判据 2.1(3) 知 $W^+$ 已是 $\overline{\mathbf{G}}$-概形（再无 outsider 表示）。再证 $\mathcal{D}_{W^+}\to \widehat{\mathcal{D}}_{W^+}$ 是同构：对 $\widehat{\mathcal{D}}_{W^+}$ 中一族 $(\gamma_n)$，把 $\widehat{\gamma}\colon \{\overline{\mathbf{G}}_n\times S\}\to \widehat{W^+}$ 视作形式 $\overline{\mathbf{G}}$-态射；$W^+$ 仿射故局部线性，$\widehat{W^+}$ 是其形式化，由命题 `ref:algebraizationOfMaps:prop`（位置串 `main.tex:2460-2473`）得 $\widehat{\gamma}$ 来自唯一的 $\overline{\mathbf{G}}$-等变态射 $\overline{\mathbf{G}}\times S\to W^+$。

定理 4.2 与定理 4.6 合起来即 §1 主定理的完整证明：
- 定理 4.6 给出 $\widehat{\mathcal{D}}_{X}$ 的表示；
- 定理 4.2 给出 $\mathcal{D}_{\operatorname{X}}\simeq \widehat{\mathcal{D}}_{X}$；
- 命题 4.8 与推论 `ref:agreementForLocallyLinear:cor`（位置串 `main.tex:2674-2701`）把仿射情形扩展到局部线性情形，再用 étale 覆盖下降得到一般代数空间情形。

## 5 相对与光滑情形：经典 BB 分解的恢复

本节回到 $\overline{\mathbf{G}}$ 带零元、单位群 $\mathbf{G}$ 连通的设定，并在 $\operatorname{X}$ 是光滑 $\mathbf{G}$-簇时恢复经典 BB 分解的结构定理。

定理 5.1（相对光滑性，位置串 `main.tex:2966-3031`，编号 `ref:relativesmoothness:thm`）。设 $f\colon \operatorname{X}\to Y$ 是光滑 $\mathbf{G}$-等变态射，则 $f^+\colon \operatorname{X}^+\to  Y^+$ 也光滑。特别地，若 $\mathbf{G}$ 在 $Y$ 上平凡作用，则 $f^+\colon \operatorname{X}^+\to Y$ 是 BB 分解族。

证明要点（位置串 `main.tex:2995-3031`）：选 $\operatorname{X}$ 上 $x\in \operatorname{X}^{\mathbf{G}}$ 的局部 $\mathbb{G}_m$-稳定截线 $\varphi\colon \mathbb{A}\hookrightarrow \operatorname{X}$；沿 $\varphi$ 把 $f$ 与 $\varphi$ 拼成 $\overline{\mathbf{G}}$-态射 $j'\times f\colon \mathbb{A}\times Y\to \operatorname{X}$ 在 $x_0$ 处切映射同构，故 $j'\times f$ 在 $x_0$ 的某 $\mathbf{G}$-稳定邻域 $U$ 上 étale。应用 $\mathcal{D}_{-}$，得
$$
\mathcal{D}_{U}\to \mathcal{D}_{\mathbb{A}}\times \mathcal{D}_{Y}\stackrel{pr_2}{\to} \mathcal{D}_{Y}
$$
为光滑态射的复合，故 $\mathcal{D}_{f_{|U}}$ 光滑，再由 $\mathcal{D}_{U}\subset \mathcal{D}_{\operatorname{X}}$ 开得 $\mathcal{D}_{f}$ 在 $x$ 邻域光滑。

引理 5.2（光滑锥是仿射丛，位置串 `main.tex:3049-3079`，编号 `ref:conesWhichAreSmoothAreAffineSpaces:lem`）。设 $Z$ 是概形，$\mathcal B=\bigoplus_{i\geq 0}\mathcal B_i$ 是 $\cO_Z$-代数，$\varphi\colon \Spec(\mathcal B)\to Z$ 是光滑的，则 $\varphi$ 是仿射丛。

证明要点：固定 $z\in Z$ 与极小齐次生成元 $f_1,\ldots,f_r$ 生成 $\mathcal B_{>0}\otimes \kappa(z)$；由光滑性得 $r\leq \dim \varphi^{-1}(z)$，再用 $\varphi$ 的平坦性得
$$
\mathcal B\otimes \kappa(z)=\kappa(z)[F_1,\ldots,F_r]/(\ker p\otimes \kappa(z))
$$
只在 $(\ker p)\otimes \kappa(z)=0$ 时维数 $r$。故缩到 $\Spec A\subset Z$ 后 $\ker p=0$，$\mathcal B\simeq \mathcal B_0[F_1,\ldots,F_r]$，从而 $\Spec\mathcal B\simeq \mathbb{A}^r\times Z$。

推论 5.3（光滑簇 BB 分解为仿射丛，位置串 `main.tex:3085-3118`，编号 `ref:affineBundle:cor`）。设 $\operatorname{X}$ 是 $\operatorname{k}$ 上光滑簇，则 $\operatorname{X}^+$ 是 $\operatorname{X}^{\mathbf{G}}$ 上的仿射丛，且 $\operatorname{X}^{\mathbf{G}}$、$\operatorname{X}^+$ 均光滑。

证明（位置串 `main.tex:3091-3118`）：光滑性由定理 5.1 对 $\operatorname{X}\to \Spec\operatorname{k}$ 应用得到；$\pi_{\operatorname{X}}$ 仿射且有限型，故 $\operatorname{X}^+\simeq \Spec\mathcal B$；$s_{\operatorname{X}}$ 是 $\pi_{\operatorname{X}}$ 的截面，$\pi_{\operatorname{X}}$ 在 $s_{\operatorname{X}}$ 上满切空间从而在此处光滑；非光滑轨迹 $Z\subset \operatorname{X}^+$ 是 $\overline{\mathbf{G}}$-稳定闭子概形，对几何点 $z\in Z(\overline{k})$ 有 $0\cdot z\in  s_{\operatorname{X}}(\operatorname{X}^{\mathbf{G}})\cap Z$，矛盾，故 $\pi_{\operatorname{X}}$ 光滑。仿射丛由 Kempf 环面所诱导的 $\N$-分次结合引理 5.2 得到。

注：$\operatorname{X}^+\to \operatorname{X}^{\mathbf{G}}$ 一般不是向量丛（`main.tex:3120-3124` 的反例来自 `Iarrobino__fibre_bundle`）。

定理 5.4（光滑 BB 分解结构定理，位置串 `main.tex:487-504`，编号 `ref:ABBdecomposition:thm:intro`）。设 $\operatorname{X}$ 是光滑 $\mathbf{G}$-簇，$\overline{\mathbf{G}}$ 是带零元的线性约化幺半群。设 $\operatorname{X}^{\mathbf{G}}$ 的连通分支为 $C_1,\ldots,C_r$，$\operatorname{X}^+$ 为 $\operatorname{X}$ 的 BB 分解。则

(1) $\operatorname{X}^+$ 是光滑簇，连通分支 $\operatorname{X}^+_i=\pi_{\operatorname{X}}^{-1}(C_i)$，即 $\operatorname{X}^+_i\subset \operatorname{X}^+$ 是极限点位于 $C_i$ 的轨迹；
(2) 对每个 $i$，$\pi_{\operatorname{X}}\colon \operatorname{X}^+_i\to C_i$ 是逐纤维带 $\overline{\mathbf{G}}$-作用的仿射丛；$i_{\operatorname{X}}\colon \operatorname{X}^+_i\to \operatorname{X}_i$ 是局部闭浸入。

证明（位置串 `main.tex:3201-3212`）：光滑性与 $\pi_{\operatorname{X}}$ 的仿射丛性质由推论 5.3 给出；$i_{\operatorname{X}}$ 的局部闭浸入性由命题 `ref:ioneLocallyClosed:prop`（位置串 `main.tex:3135-3192`）给出：每个 $z\in Z(\overline{k})$ 的极限点 $z_0=\pi_{\operatorname{X}}(z)$ 落在 $\operatorname{X}_{\overline{k}}$ 的某仿射 $\mathbf{G}$-稳定邻域 $U'$（Sumihiro-Trautman 型结果 `Trautman` 定理 4.1），$U\subset \operatorname{X}$ 是 $U'$ 在 $\operatorname{X}$ 上的像，则 $i_{\operatorname{X}}^{-1}(U)\cap Z\to U$ 是闭浸入（由 $U^{+}\to U$ 闭浸入与 $U^{+}\cap Z\to  U^{+}$ 闭浸入复合，再与 $U^{+}\to  i_{\operatorname{X}}^{-1}(U)\cap Z$ 的开浸入相消得闭浸入），又 $i_{\operatorname{X}}^{-1}(U)\cap Z$ 是 $Z$ 的不可约开子集故 $U^{+}\cap Z\simeq  i_{\operatorname{X}}^{-1}(U)\cap Z$，最终 $i_{\operatorname{X}}^{-1}(U)\cap Z\to U$ 是闭浸入。

例子 5.5（Hilbert 方案上的 BB 细胞交，位置串 `main.tex:3221-3308`，编号 `ex:BBdecompositionForHilbA2`）。取 Hilbert 方案 $\Hilb=\Hilb_d\mathbb{A}^2$，按权重 $w\in \mathbb{Z}^2$ 与 $\mathbb{G}_m$-作用 $\mu_w$ 得 BB 分解。设 $<_1, <_2$ 为两个单项序、对应权重 $w_1,w_2$ 与作用 $\mu_1,\mu_2$；固定单项理想 $[M]$ 的两个细胞 $Z_1,Z_2\subset \Hilb$。则 $Z_1\times_{\Hilb}Z_2\simeq \mathbb{A}^{\dim_{\operatorname{k}}\Hom(M,S/M)_{\geq 0,\geq 0}}$，是仿射空间。

证明要点：取 $\mathbb{G}_m^{\times 2}\times \Hilb\stackrel{\mu}{\to} \Hilb$，把 $\Hilb$ 的 BB 分解 $\mathcal{D}_{\Hilb,\mathbb{A}^2}$（其中 $\mathbb{A}^2$ 是 $\mathbb{G}_m^{\times 2}$ 的紧化，见例 `ex:toric`）分解为以单项理想 $[M]$ 标记的仿射空间之并；选取定 $[M]$ 的细胞 $Z\subset \Hilb^+$。所证 $Z=Z_1\times_{\Hilb}Z_2$ 是由两个函子
$$
\begin{aligned}
D(S)&=\{\varphi\colon (\mathbb{A}^2\setminus\{0\})\times S\to \Hilb\mid \mathbb{G}_m\times\mathbb{G}_m\text{-等变},\ \varphi((1,0)\times S)=\varphi((0,1)\times S)=[M]\},\\
D'(S)&=\{\varphi'\colon \mathbb{A}^2\times S\to \Hilb\mid \mathbb{G}_m\times\mathbb{G}_m\text{-等变},\ \varphi'((0,0)\times S)=[M]\}
\end{aligned}
$$
之间的双向包含给出的。包含 $D\subset D'$ 由 $U$ 上的 $\Hilb$ 仿射 $(\mathbb{G}_m\times\mathbb{G}_m)$-稳定邻域与例 `ex:toric` 的 compactification 论证（位置串 `main.tex:3288-3296`）得到；反向包含由固定点等式 $\Hilb^{\mathbb{G}_m,\mu_1}=\Hilb^{\mathbb{G}_m,\mu_2}=\Hilb^{\mathbb{G}_m\times \mathbb{G}_m}$（位置串 `main.tex:3262-3265` 的 equation 环境）得到，故 $Z_1\cap Z_2$ 是仿射空间。

例子 5.5 是论文给出的"BB 分解可同时取多个紧化"这一新现象的第一个具体演示：取两个不同序的 BB 分解的细胞交在同一初值理想下是仿射空间，是单纯的 $\mathbb{G}_m$ 分解做不到的（$\mathbb{G}_m$ 情形下 $\mathbb{A}^2\setminus\{0\}$ 不是仿射），这就是本文引入"线性约化幺半群"作为 $\overline{\mathbf{G}}$ 的最大动机。

## 6 与本语料的接缝

本节登记本论文在 `被引笔记/` 一族其它稿中的实际使用情况，由派单给定：

- **D305（bib key `JS2018`）**：登记引用 `Jelisiejew-Sienkiewicz 2018`（即本篇）作为 BB 分解函数化推广的出处；
- **D385（bib key `JelisiejewSienkiewicz2019`）**：登记引用本篇作为约化群 BB 分解存在性与 $\operatorname{X}^+\to \operatorname{X}^{\mathbf{G}}$ 仿射性的源；
- **D447（bib key `JelisiejewSienkiewicz2019`）**：登记引用本篇"outsider 表示"判据与仿射闭子概形构造；
- **D471（bib key `JelisiejewSienkiewicz2019`）**：登记引用本篇归纳构造（"带零元、单位群连通"归约）。

本稿记号约定（与原论文保持一致）：
- $\mathbf{G}$ 线性约化群，$\overline{\mathbf{G}}$ 以 $\mathbf{G}$ 为单位群的线性约化幺半群；
- $\mathcal{D}_{\operatorname{X}}(S)=\{\varphi\colon \overline{\mathbf{G}}\times S\to \operatorname{X}\mid \varphi \text{ 是 } \mathbf{G}\text{-等变}\}$，$\pi_{\operatorname{X}}$ 限制到 $0_{\overline{\mathbf{G}}}$ 给出到 $\operatorname{X}^{\mathbf{G}}$ 的仿射有限型态射；
- 仿射情形 $\mathcal{D}_{\operatorname{X}}$ 由闭子概形 $\Spec(A/I)$（$I$ 由 outsider 表示生成）表示。

这些记号在上述 D 稿中的展开方式由语料稿侧自行翻译，本稿不再展开。

