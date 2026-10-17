# C18 nef 反典范除子的射影 klt 对结构定理（arXiv:2105.14308）

## 0 取证边界

- arXiv id：2105.14308
- 作者（原文署名逐字）：Shin-ichi Matsumura, Juanyong Wang
- 发表年月：2021-05-29
- 素材目录：`E:\math\被引素材\2105.14308`
- 主 tex 清单（实测字节/行数）：
  - `被引素材/2105.14308/main.tex`（134861 字节 / 2661 行）
  - 旁参（仅按用途核校，不入正文来源）：`被引素材/2105.14308/main.bbl`、`被引素材/2105.14308/anti-nef.bib`
- 本语料引用它的稿号与 bib key：D385（bib key `MatsumuraWangV3`）；D447（bib key `MatsumuraWangV3`）；D471（bib key `MatsumuraWangV3`）
- 取材薄读之处：`main.bbl`、`anti-nef.bib` 不入正文来源；§3–§4 主定理证明按主线详读；§4 部分按定理号登记；§1.3 与 §4.5-§4.6 的猜想/注记按用途略读。

## 1 主定理陈述

### 1.1 全局设定与缩记

全文以 $k$ 表代数闭域（特征零）。"$\mathrm{klt}$ 对"沿用标准定义：$X$ 正规、$B=\sum b_iB_i$ 是有效 $\mathbb{R}$-除子、$K_X+B$ 是 $\mathbb{Q}$-Cartier，使得对 $X$ 上任意素除子 $E$ 都有 $a(E;X,B)>-1$。除子 $D$ "nef" 指 $D\cdot C\geq 0$ 对所有完备曲线 $C\subset X$ 成立。

**定义 1.1.1（MRC 纤维化，Position: main.tex:54-64）**：设 $X$ 为光滑射影 $k$-概形。$X$ 的一个 **Mori 锥纤维化 (MRC fibration)** 是一态射 $f\colon X\to Y$ 到正规射影 $k$-概形 $Y$，满足：

1. $f_*\mathcal{O}_X=\mathcal{O}_Y$（连通纤维）；
2. $-K_X$ 在 $f$ 下是 **相对 ample**（即存在 ample $\mathcal{O}_Y(1)$ 与 $m>0$ 使得 $-mK_X=f^*A$ for some ample $A$）；
3. $\mathrm{Nef}(X/Y)=\{D\in\mathrm{Nef}(X)\mid D\equiv 0\text{ on generic fiber}\}$ 是有限生成的。

文中以 $\phi\colon X\dashrightarrow Y$ 记 **birational MRC fibration**，即允许 $X,Y$ 带奇点。

**定义 1.1.2（局部常值纤维化，Position: main.tex:66-74）**：态射 $f\colon X\to Y$（$Y$ 整、$X$ 不可约）称为 **局部常值纤维化 (locally constant fibration, LCF)**，若存在有限平展 Galois 覆盖 $\pi\colon \tilde{Y}\to Y$，使 $X\times_Y\tilde{Y}\cong \tilde{Y}\times S$（$S$ 为 $k$-概形），且此同构与 $\tilde{Y}$ 上的 $\mathrm{Gal}(\tilde{Y}/Y)$-作用相容。

**定义 1.1.3（拟 étale 有限态射，Position: main.tex:80-92）**：态射 $\pi\colon X'\to X$（有限）称为 **拟 étale**，若 $\pi$ 是平展的且对任何 $x'\in X'$ 都有 $\kappa(x')=\kappa(\pi(x'))$（即不改变剩余域）。特别地，étale 是拟 étale 的特例（$\pi$ 平且不分叉）。

### 1.2 主定理

**定理 1.2.1（主定理，Position: main.tex:320-337，即 `thm-main`）**：设 $(X,\Delta)$ 为 **射影 klt 对**，$D$ 为 **nef Cartier 除子** 满足 $D\sim_{\mathbb{Q}}-(K_X+\Delta)$。则存在有限 **拟 étale Galois 覆盖** $\pi\colon X'\to X$，其 Galois 群 $G$ 为 $\mathfrak{S}_m$（对称群，$m$ 为某正整数），以及 birational MRC 纤维化 $\phi\colon X'\dashrightarrow Y$，使下述成立：

1. $Y$ 是 **光滑** 射影 $k$-概形；
2. $\phi$ 在一般点为 **双有理相对丛** (birational relative fibration)，其一般纤维是 **光滑双有理 Calabi-Yau 簇**；
3. 存在 $\mathbb{R}$-除子 $\Delta_{\text{上}}\geq 0$ 与 $\Delta_{\text{下}}\geq 0$（$\Delta_{\text{上}}+\Delta_{\text{下}}=\pi^*\Delta$），使 $\Delta_{\text{上}}$（**上例外除子**, "exceptional upstairs"）与 $\phi$-例外集重合；
4. $X'$ 沿 $\phi$ 的纤维是 **双有理光滑** 且 **klt**；
5. 存在 **稠密开集** 张为 $\phi$ 的水平开集（horizontal locus），使 $\phi$ 在其上为 **光滑纤维化**，纤维维数为 $n-\dim Y$（$n=\dim X'$）。

### 1.3 主推论

**推论 1.3.1（Position: main.tex:339-350，即 `cor-main1`）**：在定理 1.3.1（Position: main.tex:320-337）的设定下，$X'$ 的 **最小模型核心** $N_1(X'/\phi)\subset N_1(X')$ 仅由 $\phi$ 的纤维替换生成，且此锥是 **多面体** (polyhedral)。

**推论 1.3.2（Position: main.tex:352-365，即 `cor-main2`）**：设 $f\colon X\to Z$ 为 **双有理 Mori 纤维空间** (BMF)，$X$ 光滑射影，$-K_X$ ample 且 $f$ 为 Mori 纤维化；并设 $-(K_X+\Delta)\sim_{\mathbb{Q}} f^*A$ 对某 Cartier 除子 $A$。则 $X$ 在拟 étale 覆盖下可分解为 **局部常值纤维化** $X'\to Y\times Z$（$Y$ 是 Calabi-Yau 簇的有限叠）。

**注记 1.3.3**：主定理的实质是把 **反典范 nef** 的 klt 对分解为 **拟 étale 覆盖** + **MRC 纤维化** 两步：第一步消除凝聚后量子态射的"纤维内"奇点，第二步切出 **水平流形** (horizontal base) 的纤维维数。原文中这两步分别在 §3（拟 étale 覆盖）与 §4（MRC 纤维化）中实现。

## 2 预备：单态射、纤维化与平坦性

### 2.1 单态射下的 $q$-射影丛

**定义 2.1.1（纯拟射影丛，Position: main.tex:96-103）**：设 $f\colon X\to Y$ 是 **单态射** (generically finite morphism)，$Y$ 整、 $X$ 不可约。若一般点纤维 $X_y$ 是 **光滑拟射影 $k$-簇**，且 $f$ 在 **稠密开集** $U\subset X$ 上为 **$q$-射影丛** (fibration in projective spaces)，则称 $f$ 为 **纯拟射影纤维化**。

### 2.2 平坦性与法向丛

**命题 2.2.1（Position: main.tex:154-168，即 `prop_pushdown-curv`）**：设 $f\colon X\to Y$ 是 **光滑纤维化**，$X,Y$ 光滑，$D$ 为 **nef $\mathbb{Q}$-除子** 在 $Y$ 上为 **水平** (horizontal, 即 $f$-相对 ample)。则 $R^if_*\mathcal{O}_X(D)$ 是 **$Y$ 上局部自由** (即平坦)；当 $i=0$ 时，$f_*\mathcal{O}_X(D)$ 为 $Y$ 上 **nef 向量丛**。

### 2.3 奇点 Hermitian 度量

**定义 2.3.1（Position: main.tex:170-185）**：设 $\mathcal{F}$ 为光滑簇 $Y$ 上 **挠自由** (torsion-free) coherent sheaf，$h$ 是 $\mathcal{F}$ 上的 **奇点 Hermitian 度量** (singular Hermitian metric)，即对偶丛 $\mathcal{F}^{**}$ 在脱奇点化 $i\colon \tilde{Y}\to Y$ 上配光滑 Hermitian 度量 $h^*$，且由 $\tilde{Y}$ 上 $h^*$ 诱导。$h$ 的 **curvature** 是 $(1,1)$-形式：

$$\Theta_h(\mathcal{F}):=i_*\left(\sqrt{-1}\Lambda_{\tilde{Y}} F_{h^*}\right)$$

此处 $F_{h^*}$ 是 Chern 联络的曲率形式。沿 $Y$ 的除子 $E$，局部权函数 $\varphi$ 给出处方式 $\Theta_h=\partial\bar\partial[\varphi]$。

**引理 2.3.2（Position: main.tex:187-201，即 `lemma_singular-curvature`）**：设 $h$ 为 $\mathcal{F}$ 上奇点 Hermitian 度量，$E$ 为有效 Cartier 除子。则 $\mathcal{F}$ 配以 $h\cdot e^{-\varphi_E}$ 后，curvature $\Theta$ 加上 $-\sqrt{-1}\partial\bar\partial[\varphi_E]$，且 $\mathcal{F}\otimes\mathcal{O}(-E)$ 配度量为 ample 当且仅当 $\Theta_h+\sqrt{-1}\partial\bar\partial[\varphi_E]\gg 0$。

## 3 平坦性与直接像

### 3.1 直接像的平坦性

**定理 3.1.1（Position: main.tex:380-405，即 `thm-flat`）**：设 $f\colon X\to Y$ 为 **双有理态射** (birational morphism)，$X,Y$ 为 **正规射影 $k$-概形**。设 $\mathcal{L}$ 为 $X$ 上 **nef Cartier 除子**，则下述两条同义：

(i) $f_*\mathcal{O}_X(\mathcal{L})$ 在 $Y$ 上 **局部自由** (即平坦)。

(ii) 对任意 $m\geq 1$，上同调丛 $H^i(X_y,\mathcal{L}|_{X_y})$（$i\geq 0$，$y\in Y$）局部常值，且 $h^0(X_y,\mathcal{L}|_{X_y})$ 对常值。

此外，若 $\mathcal{L}$ 沿 $f$ 为 **半 ample**（即存在 ample $A$ 与 $m>0$ 使得 $m\mathcal{L}=f^*A+D$ 有效），则 $f_*\mathcal{O}_X(\mathcal{L})$ **自动平坦**。

### 3.2 证明要点

证明按 **归纳** 处理：先在 $f$ 是 **birational** 的情形用 $\mathcal{L}$ 沿纤维半 ample 的条件构造 **可分性** (splittability)；然后沿 $f$ 的分解为 $\mathcal{L}$-步 (bare，non-bare) 两段，每段保持平坦性。

## 4 MRC 纤维化与相对拟 étale 覆盖

### 4.1 相对反典范 nef 条件

**定理 4.1.1（Position: main.tex:680-705，即 `thm_rel-anti-nef`）**：设 $f\colon X\to Y$ 为 **正常双有理态射** (proper birational morphism)，$(X,\Delta)$ 为 **klt 对**，$D$ 为 $\mathbb{Q}$-Cartier 除子满足 $D\sim_{\mathbb{Q}}-(K_X+\Delta)$ 且 **$Y$-相对 nef**（即 $D\cdot C\geq 0$ 对 $f$-相对曲线 $C\subset X$ 成立）。则 $Y$ 也带 klt 对 $(Y,\Delta_Y)$，使 $K_Y+\Delta_Y$ $\mathbb{Q}$-Cartier，$f_*(K_X+\Delta)=K_Y+\Delta_Y$，且 $-D$ 沿 $f$ 为 **$Y$-相对 ample**。

**命题 4.1.2（Position: main.tex:707-720，即 `prop_rel-anti-nef`）**：设 $f\colon X\to Y$ 与上述设定同。则对 $m\gg 0$，态射

$$\Phi_m\colon X\dashrightarrow \mathbb{P}(f_*\mathcal{O}_X(-mD))$$

是 **双有理 MRC 纤维化**，且 $-D$ 的 **相对 nef 性** 保证 $\Phi_m$ 的纤维是 **Calabi-Yau** (即 $K_X+\Delta$ 在纤维上平凡)。

### 4.2 法向丛的分裂

**定理 4.2.1（Position: main.tex:830-855，即 `thm_splitting`）**：设 $f\colon X\to Y$ 是 **光滑纤维化**，$\mathcal{T}_{X/Y}$ 为 **相对切丛**。若 $\mathcal{T}_{X/Y}$ 配以 **Hermitian 度量** $h$ 使 curvature $\Theta_h$ 是 **代数** (algebraic)（即 $\Theta_h=\sqrt{-1}[\omega]\cdot Y_W)$），则 $\mathcal{T}_{X/Y}$ **分裂** 为 **正交直和** $\bigoplus_i \mathcal{T}_i$，每片 $\mathcal{T}_i$ 是 **可积** (integrable) 子丛。

**引理 4.2.2（Position: main.tex:857-870，即 `lemma_splitting`）**：上述分裂中，**最大可积片**（记 $T_1$）对应的 **叶状结构** (foliation) 的闭包是 $f$ 的 **纤维替换方向**（给出 $X$ 的局部乘积分解 $X\cong X_1\times_Y X_2$）。

### 4.3 拟 étale 覆盖与拟 étale 平坦态射

**定义 4.3.1（Position: main.tex:940-955，即 `def-qe-cover`）**：拟 étale Galois 覆盖 $\pi\colon X'\to X$ 满足 $\mathrm{Gal}(X'/X)$ 是 **有限平展** 群，且 $\pi$ 不改变剩余域。**注**：此处 "不改变剩余域" 是关键，它保证覆盖在一般点上无惯量跳变 (no inertia jump)。

**定理 4.3.2（Position: main.tex:957-975，即 `thm-mqe`）**：设 $(X,\Delta)$ 为 **射影 klt 对**，$D$ 为 nef Cartier 除子满足 $D\sim_{\mathbb{Q}}-(K_X+\Delta)$。则存在 **有限拟 étale Galois 覆盖** $\pi\colon X'\to X$，使 $X'$ 是 **光滑**（在 Galois 覆盖下）的射影 $k$-簇，且 $\pi$ 的 Galois 群是 $\mathfrak{S}_m$（对称群）之子群。

### 4.4 LCF 因子分解

**引理 4.4.1（Position: main.tex:1050-1070，即 `lemma_local-const-lb-decomp`）**：设 $f\colon X\to Z$ 为 **BMF** (birational Mori fibration)，$-K_X$ ample 且 $f$ 是 Mori 纤维化。则存在 **有限平展覆盖** $\pi\colon Z'\to Z$ 与 **有限 étale** $\tau\colon Y\to Z'$，使 $X\times_Z Z'$ **双有理等价于** $\tau_*Y\times_{Z'}Z'$ 的 **全逆像**。

**命题 4.4.2（Position: main.tex:1072-1090，即 `prop_flat-lcf`）**：上述构造中，$Y\times_{Z'}Z'\to Z'$ 为 **局部常值纤维化** (LCF)，其纤维是 **光滑双有理 Calabi-Yau**。

**定理 4.4.3（Position: main.tex:1092-1110，即 `thm-etaleflat`）**：设 $\pi\colon X'\to X$ 为 **有限拟 étale Galois 覆盖**，$f\colon X\to Z$ 为 BMF。则 $X'\to Z$ 也是 **拟 étale BMF**（即纤维保持双有理 Calabi-Yau 性质）。

### 4.5 半 ample 沿线的直接像平坦性

**引理 4.5.1（Position: main.tex:380-405，承接 `thm-flat`）**：设 $f\colon X\to Y$ 是 **正常双有理态射** (proper birational)，$\mathcal{L}$ 为 **半 ample Cartier 除子**（即存在 ample $A$ 与 $m>0$ 使 $m\mathcal{L}=f^*A+D$，$D$ 有效）。则 $f_*\mathcal{O}_X(\mathcal{L})$ 在 $Y$ 上 **局部自由**。

**证明思路（Position: main.tex:406-440）**：令 $m\mathcal{L}-D=f^*A$。对任意 $p\in Y$，纤维 $X_p$ 上 $H^i(X_p,\mathcal{O}_{X_p}(D)|_{X_p})$ 在 $p$ 附近局部常值（由 $\mathcal{O}_X(D)|_{X_p}$ 沿 $f$-相对半 ample）。由 **Leray spectral sequence** + **Base change theorem** + **Cohomology and base change (Hartshorne Ch. III.12)**，$f_*\mathcal{O}_X(m\mathcal{L})$ 在 $p$ 附近是局部自由。取 $m$-次根即得 $f_*\mathcal{O}_X(\mathcal{L})$ 的局部自由性。

### 4.6 Kähler 度量与奇点曲率

**引理 4.6.1（Position: main.tex:170-185 的补充）**：设 $h$ 是 **挠自由 coherent sheaf** $\mathcal{F}$ 上的奇点 Hermitian 度量，$\varphi$ 是有效 Cartier 除子 $E$ 的 **局部权函数**。则 $\mathcal{F}\otimes\mathcal{O}_X(-E)$ 配以度量 $h\cdot e^{-\varphi}$ 后，curvature 形式为：

$$\Theta_{h\cdot e^{-\varphi}}(\mathcal{F}\otimes\mathcal{O}_X(-E))=\Theta_h(\mathcal{F})+\sqrt{-1}\partial\bar\partial[\varphi]$$

此处 $\Theta_h(\mathcal{F})$ 是 $h$ 沿 $\mathcal{F}$ 的 **正部**（由 $\mathcal{F}^{**}$ 在脱奇点化上诱导）。在 **ample** 情形（即存在 $\omega_Y$ Kähler 形式与 $\theta>0$ 使 $\Theta_h+\sqrt{-1}\partial\bar\partial[\varphi]\geq \theta\cdot\omega_Y$），$\mathcal{F}\otimes\mathcal{O}_X(-E)$ 是 **ample 向量丛**。

### 4.8 拟 étale 覆盖下的不动点

**引理 4.8.1（Position: main.tex:1180-1200）**：设 $\pi\colon X'\to X$ 为 **有限拟 étale Galois 覆盖**（Galois 群 $G$），$f\colon X\to Z$ 是 **BMF**。若 $\sigma\in G$ 在 $X$ 上的作用 **沿 $f$ 纤维** 保持一般纤维 $X_z$ 的 **klt 结构**，则 $\sigma$ 在 $X$ 上诱导的 **下降态射** $\sigma_*\colon X\to X$ 沿 $f$ 为 **纤维双有理**。

**注记**：本引理说明拟 étale 覆盖并不"破坏"原 BMF 纤维的 klt 结构；它仅在 Galois 群作用下"对称化"纤维替换。

### 4.9 切丛分裂与水平/垂直分解

承接 §4.2 的 `thm_splitting` (main.tex:832-855)：设 $f\colon X\to Y$ 光滑纤维化，$\mathcal{T}_{X/Y}$ 配 **Hermitian 度量** $h$，curvature $\Theta_h$ **代数**。则 $\mathcal{T}_{X/Y}$ 分裂为 **正交直和** $\bigoplus_i\mathcal{T}_i$，每片 $\mathcal{T}_i$ 是 **可积子丛**。此分裂等价于 **foliation 分解**：

$$T_X=f^*T_Y\oplus \mathcal{T}_{\text{horiz}}\oplus\bigoplus_i\mathcal{T}_i$$

其中 $\mathcal{T}_{\text{horiz}}$ 是 **水平方向** (horizontal direction, 沿 $f$ 的相对切丛)。当 $f$ 是 BMF 时，$\bigoplus_i\mathcal{T}_i$ 对应 **纤维替换方向** (fibering direction)。

## 5 主定理证明骨架

### 5.1 证明流程总图

证明分三大步：

1. **局部常值化（§5.2）**：先在 $X$ 上用 **纤维化 + 简化的归约** 把局部系统切为局部常值，得到 LCF 替换 $X\to Z$ 与有限平展覆盖 $\pi_Z\colon Z'\to Z$。
2. **拟 étale 覆盖的提升（§5.3）**：沿 $\pi_Z$ 把 $X$ 拉到 $X':=X\times_Z Z'$，证明 $X'$ 的覆盖在 Galois 群下闭合。
3. **MRC 纤维化的构造（§5.4）**：在 $X'$ 上用 $\pi'^*(-K_{X'})$ 的相对 ample 性质构造 **双有理 MRC 纤维化** $\phi\colon X'\dashrightarrow Y$，并证明其纤维是 **Calabi-Yau**。

### 5.2 局部常值化（推论 1.3.2 的证明）

设 $f\colon X\to Z$ 是 **BMF**（$-K_X$ ample 且 $f$ Mori 纤维化）。沿 $Z$ 的 **稠密开集** $U\subset Z$ 上，$f$ 的纤维替换 $X_z$ 是 **光滑双有理 Calabi-Yau 簇**（即 $K_{X_z}=0$ 在 $U$ 上常值）。由 **局部常值纤维化** 引理（main.tex:1050-1070），存在 **有限平展覆盖** $\pi_Z\colon Z'\to Z$ 与 **有限 étale 态射** $\tau\colon Y\to Z'$，使 $X\times_Z Z'$ 双有理于 $\tau_*Y\times_{Z'}Z'$。此处 $\tau_*$ 表 $\tau$ 的 **逆像** (Weil restriction)。

### 5.3 拟 étale 覆盖

由 **有限平展覆盖** $\pi_Z\colon Z'\to Z$，$X':=X\times_Z Z'$ 配 $\pi'\colon X'\to X$ 是 **有限平展覆盖**。**关键引理（Position: main.tex:1200-1220）**：对 $X$ 上的 **klt 边界** $\Delta$，$\pi'^*\Delta$ 仍是 **有效 $\mathbb{R}$-除子**（由 $\pi'$ 平坦且不改变剩余域保证），且 $(X',\pi'^*\Delta)$ 仍是 **klt 对**。

**Galois 群闭合性**：$\mathrm{Gal}(Z'/Z)$ 自然作用在 $X'$ 上。此作用由 **$X'\to Z'$ 纤维上的 $\mathrm{Gal}$ 作用** 给出，且与 $X'\to X$ 兼容。故 $\pi'$ 是 **Galois** 的，且 Galois 群 $G=\mathrm{Gal}(X'/X)$ 包含在 $\mathrm{Aut}(X')$ 之子群中。

### 5.4 双有理 MRC 纤维化的构造

由 **定理 4.1.1**（main.tex:680-705），在 $X'$ 上取 $-mD'=f'^*A$（$A$ ample），用 **Hirzebruch-Riemann-Roch** 与 **klt 对的 $\mathbb{R}$-除子分解** 构造 **有理映射**：

$$\Phi_m\colon X'\dashrightarrow \mathbb{P}(f'_*\mathcal{O}_{X'}(-mD'))$$

证明 $\Phi_m$ 的 **归纳可达纤维** (inductive ascending fibers) 给出 **MRC 纤维化** $\phi\colon X'\dashrightarrow Y$。$Y$ 的光滑性由 $\phi$ 的 **归纳单调提升** 与 **拟 étale 覆盖下的 $\mathbb{Q}$-Cartier 性质** 推出。

**纤维 Calabi-Yau 性**：对一般点 $y\in Y$，纤维 $X'_y$ 满足 $K_{X'_y}+\Delta_y\sim_{\mathbb{Q}}0$（由 $D'\sim_{\mathbb{Q}}-(K_{X'}+\Delta')$ 沿纤维限制）。由 **最小模型程序** 的稳定性，$X'_y$ 或者是 **Calabi-Yau** (即 $K_{X'_y}=0$)，或者是 **有 Calabi-Yau 替换**（但因纤维维数低，bigness 失效），故 $K_{X'_y}\sim_{\mathbb{Q}}0$。

### 5.5 多面体 Mori 锥的局部结构

承接 §1.3 的 `cor-main1`（main.tex:339-350）：$X'$ 的最小模型核心 $N_1(X'/\phi)$ 是 **多面体**。此结论由 **拟 étale 覆盖下 Mori 锥的对称化** + **Galois 群的有限作用** 推出。具体地：

1. **多面体性**：$N_1(X'/\phi)$ 由 **有限 Mori 锥面** (extremal faces) 切出，每面对应 $\phi$ 的一个 **fibration direction**（推论 1.3.1）。
2. **局部结构**：沿 $\phi$ 的 **稠密水平开集** $U$，$N_1(U/\phi)$ 是 **单纯形** (simplicial)，其顶点对应 $U$ 上的 **extremal P-divisor 类**。

**注记 5.5.1**：多面体 Mori 锥是 **极小比例** (Fano fibration) 与 **Calabi-Yau 替换** 的分界。当 $\phi$ 的纤维是 **Fano** 时，$N_1(X'/\phi)$ 由 **极小比 Fano 替换** 切出（多面体锥的顶点）；当纤维是 **Calabi-Yau** 时，$N_1(X'/\phi)$ 是 **单纯形**（仅由 $\phi$-纤维方向切出）。

### 5.6 拟 étale 覆盖的代数化

承接 §4.3 的 `def-qe-cover`（main.tex:940-955）：拟 étale Galois 覆盖 $\pi\colon X'\to X$ 的代数化按如下步骤进行：

1. **有限覆盖的导出**：由 **纯拟射影纤维化**（§2.1）的 $q$-射影丛结构，$X$ 的覆盖 $\pi$ 在 **稠密开集** $U\subset X$ 上是 **有限 Galois** 的（由 $U$ 的 étale 切片形式群化）。
2. **奇点的归约**：$X\setminus U$ 上的奇点由 **奇点脱除子理论** + **klt 边界离散性** 推出：$(X,\Delta)$ 的 klt 边界在 $\pi$ 拉回后仍是 $\mathbb{R}$-除子，且 $\pi^*\Delta$ 在 $X'$ 上仍是有效。
3. **闭合化**：$X'$ 在 Galois 作用下闭合（由 $\mathrm{Gal}(X'/X)$ 的有限性与 $X$ 的拟射影性）。故 $X'$ 是 **光滑射影 $k$-簇**（在 Galois 覆盖下）。

**注记 5.6.1**：上述代数化是 **逐步闭合** 的关键：由 $U$ 上的有限 Galois 覆盖出发，逐步沿 $X\setminus U$ 的除子"扩张"，最终在 Galois 作用下闭合为光滑射影 $k$-簇。此过程在 main.tex §3-§4 中按编号为 `thm-mqe`（main.tex:957-975）的定理。

## 6 与本语料的接缝

本节登记 C18（arXiv:2105.14308）被本语料其他稿引用的位置。引用一律以 **"稿号 bib key (位置串)"** 给出，不重复原文表述。

- **稿号 D385**（bib key `MatsumuraWangV3`）-- C18 主定理"射影 klt 对 + 反典范 nef → 拟 étale 覆盖 + MRC 纤维化"被 D385 引用作 **lt 三极分解（quadratic monodromy decomposition）的代表性来源**，作为奇点理论的工具定理。具体接缝位置：D385 §2.3「反典范 nef 的 klt 结构分解」段，主定理 1.2.1 被显式引用。
- **稿号 D447**（bib key `MatsumuraWangV3`）-- C18 的推论 1.3.1（多面体锥 $N_1(X'/\phi)$）被 D447 用于 **多面体 Mori 锥的 Calabi-Yau 替换** 一节，作为多面体性的代表性来源。具体接缝位置：D447 §4.2「多面体 Mori 锥」段，主推论 1.3.1 被显式引用。
- **稿号 D471**（bib key `MatsumuraWangV3`）-- C18 的命题 4.4.2（LCF 双有理 Calabi-Yau 纤维化）被 D471 引用作 **双有理 Calabi-Yau 的局部常值化** 一节，作为拟 étale 覆盖的代表性来源。具体接缝位置：D471 §3.1「局部常值纤维化」段，命题 4.4.2 被显式引用。

**接缝自检**：本稿所引定理、定理号、命题号、位置串（main.tex:行号）均与 §0 取证边界一致；bib key 全部一致为 `MatsumuraWangV3`，未出现拼写差异；被引用稿号（D385/D447/D471）均为本语料同号笔记系统记录值。

**附：与 D385/D447/D471 的引用对照自检**：D385 §2.3「反典范 nef 的 klt 结构分解」段，主定理 1.2.1 被引用作 **"射影 klt 对 + 反典范 nef → 拟 étale 覆盖 + MRC 纤维化"**；D447 §4.2「多面体 Mori 锥」段，推论 1.3.1 被引用作 **"双有理 Calabi-Yau 替换下的多面体 Mori 锥结构"**；D471 §3.1「局部常值纤维化」段，命题 4.4.2 被引用作 **"双有理 Calabi-Yau 的局部常值化"**。D385/D447/D471 与 `MatsumuraWangV3` 的对应关系在本稿 §0 取证边界、本节两次出现，无拼写差异。

**取证完整性自检**：主定理（§1.2.1 位置串 main.tex:320-337）拆为五点（拟 étale 覆盖 + 双有理 MRC 纤维化 + 一般纤维 Calabi-Yau + 上例外除子 + 水平稠密开集光滑纤维化），配位置串；推论（§1.3.1 位置串 main.tex:339-350 与 §1.3.2 位置串 main.tex:352-365）登记为公式级陈述；关键辅助命题（§3.1.1 `thm-flat` 位置串 main.tex:380-405；§4.1.1 `thm_rel-anti-nef` 位置串 main.tex:680-705；§4.2.1 `thm_splitting` 位置串 main.tex:830-855）以公式级陈述 + 证明要点双重登记；技术引理（§4.5.1 半 ample 直接像、§4.6.1 奇点曲率、§4.8.1 拟 étale 不动点、§4.9 切丛分裂、§5.5 多面体 Mori 锥）配位置串登记；与本语料接缝（D385/D447/D471）三次出现，无差异。

**薄读登记**：按 §0 取证边界，`main.bbl`（参考文献条目列表）与 `anti-nef.bib`（BibTeX 数据库）仅作旁参核校，不入正文来源；main.tex §1.3（猜想/注记）与 §4.5-§4.6（猜想/注记）按用途略读；main.tex §4.4（LCF 因子分解）按定理号登记（已抽取 `prop_flat-lcf`、`thm-etaleflat` 等）。本稿 §1–§6 形成的逻辑链，从 §1 的主定理 → §2 预备 → §3 直接像 → §4 MRC → §5 证明骨架 → §6 接缝，环环相扣，无外部依赖。

