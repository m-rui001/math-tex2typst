# D22 · 无穷拟阵 Packing/Covering 猜想反例：把降秩论证埋进双射线

> 对象：A Counterexample to the Infinite Matroid Packing/Covering Conjecture（2026-09-24）。
> 主定理：ZFC 中存在可数集 $E$ 上两个自对耦（$M_i^*=M_i$ 同标号）拟阵 $M_0,M_1$，使任意 $M_0$-独立集与 $M_1$-独立集之并都不是 $E$；从而无 packing/covering partition，Bowler–Carmesin 无限制 packing/covering 猜想与无限制交猜想皆假；Joo 关于两个 partitional 拟阵的 Question 1.5 得否定回答。反例非 finitary 非 cofinitary。
> Lean：34 文件 / 4477 行，permitted axioms 三大标准公理（与 "In ZFC" 一致）；论文第 7 节引用 Bowler–Carmesin 等价链处 Lean 反而自建极大波机器。

## 0. 要推翻的东西与我选的突破口

Bowler–Carmesin 猜想：对任意 set-indexed 拟阵族，基集可划分成 $P\dot\cup C$，使 packing 半边（两两不交生成集张满 $P$）与 covering 半边（独立集并覆盖 $C$）同时实现。Nash-Williams 的交猜想只针对 finitary 拟阵，Aharoni–Ziv 之后大家默认无穷版的正确框架要加"有限性"，而 BC 把它推到全部 (I1)(I2)(I3)(IM) 拟阵。Joo 进一步证明了两个 finitary 拟阵、finitary/cofinitary 直和族等一批正面结果，但留了 Question 1.5：两个 partitional 拟阵呢？

我从 Joo 的正面清单读出的信息：**所有已证情形的拟阵都带某种有限性**。所以反例必须刻意避开 finitary 与 cofinitary，不仅整体避开，最好连非空的 finitary/cofinitary 直和项都没有，这样才能滑出 Joo mixed direct-sum 定理的适用范围。这决定了构造的形状：拟阵必须"处处无穷"。

战略上我做了两个压缩。第一，主定理只造**两个**自对耦拟阵（两拟阵情形的无划分），普遍陈述的失败经由 BC 自己的等价链带走，我不需要识别 witnessing family。第二，核心矛盾设计成**序数降秩**：一个沿射线无穷传播的严格递减序数列。这让组合论证（packing/covering 的复杂组合学）化归为超限算术。

本笔注叙事对应的论文目录为 preprints/A-Counterexample-to-the-Infinite-Matroid-Packing-Covering-Conjecture-September-24-2026，在 .tools/lean_queue.txt 队列第 12 行号（按题名逐字匹配登记，本行只补登记、不改前文）。

## 1. 自对耦归约：为什么造"无独立覆盖"就够了

Lemma 2.1（closure-duality）三件事：限制闭包公式 $\operatorname{cl}_{N\upharpoonright X}(S)=\operatorname{cl}_N(S)\cap X$；spanning ⟺ 含基；spanning ⟺ 补在对偶中独立。(IM) 在 (2)(3) 各用一次，没有 (IM) 连"极大独立集存在"都没有。

Lemma 2.2（selfdual-reduction）是主定理最后一步的引擎：若自对耦对存在 packing/covering partition，则 $N_i.C=(N_i\upharpoonright C)^*$（自对耦恰用一次），covering 半边的 $I_i$ 经 Lemma 2.1(3) 翻面成 $T_i=C\setminus I_i$ 在 $N_i\upharpoonright C$ 中 spanning，且 $T_0\cap T_1=\varnothing$（用 $\bigcup I_i=C$）；令 $A_i=S_i\cup T_i$，四个交集逐一验证为空（$S_0\cap S_1$ 用 packing 的不交性，这是 packing 条件在此引理中的**唯一**出场），$A_i$ 在全拟阵中 spanning（限制闭包公式），补集 $F\setminus A_i$ 在 $N_i^*=N_i$ 中独立，两个补集之并 $=F\setminus(A_0\cap A_1)=F$。逆否：无独立覆盖 ⟹ 无混合划分。

论文引言里我特意写了一句警告："failure of a covering of $E$ alone does not rule out a mixed partition"，混合划分的 $P$ 半边可以同时给两边留出独立/生成结构，必须像上面那样把两半黏合。[推测] 我最初想直接取 $J_i=S_i\cup I_i$ 读出覆盖，但 $S_i$ 是生成集不必独立；转补集是被迫的。收缩半边想对称地找"生成"结构也是死路（收缩改变闭包），唯一的桥是 2.1(3) 的对偶翻面。

## 2. 舞台：双重指数块、独立列、两个理想

$D_m=\{m\}\times\{0,1\}^{\{0,1\}^m}$，$w_m=2^{2^m}$，$D=\coprod D_m$。**双重指数是全文第一个被下游钉死的常数**：列引理需要在 $D_m$ 内"固定 $r$ 个函数值剩 $2^{2^m-r}$ 个"（布尔函数空间）；块增长不等式 $w_m\ge2\sum_{j<m}w_j$（归纳：$2\sum_{j<m+1}w_j\le3w_m\le w_m^2$）同时供给 Lemma 4.1(3) 的单元素 Lipschitz（$|W_k|\ge2c_n$）与插值的几何误差预算。用 $2^m$ 两处同时崩。[推测] 我最初取单序列 $|D_m|=2^m$，发现单点改动可把尾部极值放大任意多，探针技术整体不可行。

$\mathcal J$ = 密度零理想（$|X\cap D_m|/w_m\to0$）；$E_0=L\dot\cup R$ 双份，$\mathcal J_0$ 两片同时密度零。拟阵 $Q$ 生活在双份上，密度必须两片同时趋零才能让"类"在切片下封闭。

**Lemma 3.1（独立列）**：$3\mathfrak c=\mathfrak c$ 个列 $A_t,B_t,G_t$，给 $r$ 个不同列与任意指定模式，模式在晚块中密度**恰** $2^{-r}$。构造：给每列分配两两不同的无穷 0-1 串 $h$，$(m,f)$ 属于该列 ⟺ $f(h\upharpoonright m)=1$。不同串在充分大 $m$ 处前缀两两不同，约束"$f$ 在 $r$ 个点上取指定值"恰固定 $r$ 个函数值。"exactly $2^{-r}$"（，并非 merely 正）是下游 $(3/4)^q$ 与 $\mathcal K$ 真性按字面使用的前提。[推测] 随机列只给 a.s. 且不可数族联合独立无法在 ZFC 逐字兑现；确定性前缀编码给出精确密度，这是我放弃概率构造的原因。

**$\mathcal K$（更大的理想）**：$X\cap\bigcap_{t\in F}A_t\in\mathcal J$ 对某有限 $F$，即 $\langle\mathcal J,\{A_t^c\}\rangle$ 生成的理想。真性：$\bigcap_{t\in F}A_t$ 密度 $2^{-|F|}\not\to0$。**$\mathcal K$ 与 $\mathcal J$ 的间距是整个证明的活动空间**：第 5 节的保留细胞是 $\mathcal K_0$-小但 $\mathcal J_0$-正的，于是"模 $\mathcal K$ 改动"能同时保序数秩（秩对 $\mathcal K$-对称差不变）与保 $\mathcal J_0$-正分离，一个理想做不成两件事。[推测] 若把 $G_t^c$ 也加进生成元，一致 $A/G$ 模式不再 $\mathcal K$-正，ultrafilter 的 FIP 论证垮掉。

## 3. ultrafilter 与序数秩：降秩论证的燃料

**Lemma 3.2**：存在与 $\mathcal K$ 不交、含所有 $G_t$、且满足 (3.3) "$X\in\mathcal U\Rightarrow\{t:X\subseteq_{\mathcal K}G_t\}$ 有限"的 ultrafilter。滤子 $\mathcal F$ 要求三族：$\mathcal K$-集之补、诸 $G_t$、**forbidden 集之补**（forbidden = 模 $\mathcal K$ 含于无穷多个 $G_t$）。FIP：给有限要求，对每个 forbidden $Z_j$ 取无穷见证指标中 $F$ 外的不同 $t_j$，令 $P=\bigcap_{t\in F}G_t\cap\bigcap_j G_{t_j}^c$；$P$ 是一致模式故 $\mathcal K$-正（$P\cap\bigcap_{F'}A_t$ 对一切有限 $F'$ 密度 $2^{-(\cdot)}>0$）；$P\cap Z_j\subseteq Z_j\setminus G_{t_j}\in\mathcal K$；于是 $P\setminus(N\cup\bigcup Z_j)$ 仍 $\mathcal K$-正、非空。(3.3) 是 **thinning 的燃料**：抽薄要靠选一个不在 $\{t:Y_\xi\subseteq_{\mathcal K}G_t\}$ 里的 $G_t$，此集必须有限。[推测] "infinitely many"（，并非 merely 非空）在 forbidden 定义里正是为了在有限个 $G_t$ 已被占用后仍有不同 $t_j$ 可选。

**序数秩 $\rho$**：把所有大集枚举为 $(F_\xi)_{\xi<\mathfrak c}$（Lean 里非大集填 univ 保证每项都大），$\rho(X)=\min\{\xi:F_\xi\subseteq_{\mathcal K}X\}$。Lemma 3.3：$\mathcal K$-对称差不变大小与秩（候选指标集相同，$F_\xi\setminus Y\subseteq(F_\xi\setminus X)\cup(X\triangle Y)$）；$X\subseteq_{\mathcal K}Y$ 皆大 ⟹ $\rho(X)\ge\rho(Y)$（反单调）。秩是**辅助**序数秩，与拟阵秩无关，它只当降秩的燃料表。选 $\min\{\xi:F_\xi\subseteq_{\mathcal K}X\}$ 这个形状是因为它自动满足三条：$\mathcal K$-不变、反单调、可抽薄抬升。[推测] 取值域 $\omega_1$ 做可数递归不够：递归长度与 $\gamma$ 都可达 $\mathfrak c$。

**Lemma 3.4（rank-raising thinning）**：$s\subseteq X$、$s$ 小、$X$ 大、$\gamma<\mathfrak c$，存在大 $u$，$s\subseteq u\subseteq X$、$\rho(u)>\gamma$。构造：对 $\xi\le\gamma$ 令 $Y_\xi=F_\xi\cap(X\setminus s)$（大），由 (3.3) $S_\xi=\{t:Y_\xi\subseteq_{\mathcal K}G_t\}$ 有限；计数 $\bigl|\bigcup_{\xi\le\gamma}S_\xi\bigr|\le\max(\aleph_0,|\gamma+1|)<\mathfrak c$，**无需连续统正则性**（对每个固定 $\gamma$ 逐点成立）。取 $t$ 在并外，$u=s\cup(X\cap G_t)$。若 $F_\xi\subseteq_{\mathcal K}u$，则 $Y_\xi\setminus G_t=F_\xi\cap X\cap s^c\cap G_t^c\subseteq F_\xi\setminus u\in\mathcal K$，与 $t\notin S_\xi$ 矛盾。一个 $t$ 同时对付所有 $\xi\le\gamma$，[推测] 逐个 $\xi$ 抬高会陷入"每步保持大"的递归维护且无正则性可用。

## 4. 双重保留（Lemma 3.5）：同时打中 <𝔠 个正集

$H_{t,0}=(A_t^c\cap B_t^c)\times\{L,R\}$、$H_{t,1}=(A_t^c\cap B_t)\times\{L,R\}$：不交、都 $\mathcal K_0$-小（$A_t^c$ 因子）。引理：$<\mathfrak c$ 个 $\mathcal J_0$-正集可被**同一个** $t$ 的两个细胞同时 $\mathcal J_0$-正地打中。

单个 $S$ 的论证是全文最漂亮的密度计算：$S$ 正 ⟹ 有 $\epsilon>0$ 与无穷子列密度 $\ge\epsilon$。称 $t$ bad 若某 $S\cap H_{t,k}\in\mathcal J_0$。反证取 $q$ 个互异 bad：每细胞由两列（$A_t,B_t$）上的特定模式描述，避开 = 放掉 $2\times2$ 模式中的 1 个留 3 个，由 3.1 避开模式总密度恰 $3^q\cdot2^{-2q}=(3/4)^q$。于是

$$\frac{|S\cap W_m|}{|W_m|}\le\left(\frac34\right)^q+\sum_{i\le q}\frac{|S\cap H_i\cap W_m|}{|W_m|},$$

沿 $\epsilon$-子列取极限得 $\epsilon\le(3/4)^q$；$q$ 大时矛盾，bad 指标有限。族情形：$<\mathfrak c$ 个有限 bad 集之并仍 $<\mathfrak c$（同 3.4 的估计），取 $t$ 在并外。

$(3/4)^q$ 的来源：两列细胞、每细胞放掉 $\frac14$。任何 $<1$ 的常数都行（三列细胞给 $(7/8)^q$），$3/4$ 是最省列数的方案。[推测] 只用**一个**细胞则"既加又删"（$A'\subseteq Z'$ 的单调性）崩溃，两个不交细胞是保单调的最小配置；让细胞 $\mathcal J_0$-小则端点改动破坏类身份、插入的新原型掉进旧类、反链崩塌。这是全文唯一"同时满足 <𝔠 个正性要求"的装置，在 Lemma 5.3 一次调用。

## 5. 探针：$c_n(\sup+\inf)$ 是全文最精巧的设计

类 $\mathcal C(T)=\{X:X\triangle T\in\mathcal J_0\}$（$T,T^c$ 都正）。探针（(4.1)）：

$$f_n^T(X)=p_n^T(X)+c_n\Bigl(\sup_{m\ge n}d_m^T(X)+\inf_{m\ge n}d_m^T(X)\Bigr),$$

$p_n=|X\cap V_n|-|T\cap V_n|$（前缀差），$d_m=\frac{|X\cap W_m|-|T\cap W_m|}{|W_m|}$（块密度差），$\ell=\liminf$、$h=\limsup$。两条规则：$\mathcal B^-(T)=\{X:-1<\ell_T(X)\le0\}$、$\mathcal B^+(T)=\{X:0\le h_T(X)<1\}$。

为什么是 sup**+**inf，我逐个排除过：纯前缀 $p_n$ 则后期改动不可见，"有限改动保规则"退化成"前缀相同即等价"，反链与交换公理破；$c_n\sup$ 单项则补对称差一个号（$f^{T^c}(X^c)=-f^T(X)$ 需要 sup+inf 才干净，Lemma 4.1(4)）；$\sup-\inf$ 对中间平移不敏感，插值的半开端点出重影。sup+inf 的敏感度 $2c_n\delta$ 配合 $d_m^T(X)\to0$（同类成员）恰使有限改动的渐近净额为 $b$。sup 与 inf 都取尾部 $m\ge n$：让未来的块影响现在的探针，这是第 4 节 spike 构造的全部可能来源。阈值 $-1,0,1$ 与"单元素改动 $\le1$"配套，半开搭配使 $T$ 自身属两条规则且 $\mathcal B^+(T^c)=\{B^c:B\in\mathcal B^-(T)\}$ 逐字成立。

**Lemma 4.1（探针四性质）**：(1) $d_m\to0$、$p_n/c_n\to0$（拆和 $[0,M)\cup[M,n)$ 加权 Cesàro）；(2) $X\subseteq Y$ 时 $f_n(Y)-f_n(X)\ge|(Y\setminus X)\cap V_n|$（sup/inf 对逐点更大不减）；(3) 单元素改动至多挪 1，$k\ge n$ 的块上总变化 $\le c_n\cdot\frac2{|W_k|}\le1$，**块增长 (3.1) 在此第一次实质出场**（$c_n\le c_k\le|W_k|/2$）；净变化 $b$ 的有限改动使 $f_n$ 最终恒等；(4) 补对称 $f^{T^c}(X^c)=-f^T(X)$（逐块取负 + $\sup(-u)=-\inf u$）。

**Lemma 4.2（类内连续性）**：公共区间 $I\subseteq X_k\subseteq Y$、$Y\setminus I\in\mathcal J_0$、逐点最终一致 ⟹ 逐 $n$ 探针收敛。灵魂是**一致收敛**：$|d_m(X_k)-d_m(X)|\le\frac{|(Y\setminus I)\cap W_m|}{|W_m|}$ **与 $k$ 无关**，只有一致收敛才能穿过 sup/inf（sup 对逐点收敛不连续）。[推测] 只假设各 $X_k\in\mathcal C(T)$ 不假设公共区间，误差不能相加成一致界。下游两用：删除过程的停时论证 + 递减极限处保住下界。

**Lemma 4.3（反链与平衡交换）**：$T$ 属两条规则；平衡有限改动（净 $b=0$）不动 $\ell,h$；反链，有限差 $k\ge1$ 时 $\ell(Y)=\ell(X)+k>0$ 矛盾于 $\le0$；无穷差时 $|(Y\setminus X)\cap V_n|\to\infty$，单调性给 $f_n(Y)\ge f_n(X)+|(Y\setminus X)\cap V_n|\to+\infty$。**Lean 的更省路线值得记录**：不分有限/无穷差，取 $e\in Y\setminus X$ 单点，$\ell(\mathrm{insert}\ e\,X)=\ell(X)+1$ 加单调性 $\ell(X)+1\le\ell(Y)\le0$ 与 $\ell(X)>-1$ 矛盾，一次覆盖两种情形。[推测] 阈值端点被反链钉死：$\ell(Y)\le0$ 的上端点恰在 0，否则 $k$ 小时无矛盾。

## 6. 正池与插值：把任意端点修进 $(-1,0]$

**Lemma 4.4（正池 / spike 构造）**：$G\subseteq X^c$ 正 ⟹ 存在 $P\subseteq G$、$P\in\mathcal J_0$、$f_n^T(X\cup P)\to+\infty$；对称地删除方向。构造是**双尺度**安排：误差阈值列 $N_j$（$\frac{|p_n|}{c_n}+2a_n+\frac1{\sqrt{c_n}}\le2^{-j}$，$a_n=\sup_{m\ge n}|d_m(X)|\to0$）与尖峰块 $m_j\ge N_{j+1}$（$G$ 密度 $\ge\delta$、$1/|W_{m_j}|\le\delta-b_j$、$b_j=2^{1-j}$），从 $G\cap W_{m_j}$ 取 $\lceil b_j|W_{m_j}|\rceil$ 个点。$P$ 的非零块密度 $b_j\to0$ 故 $P\in\mathcal J_0$（留在类里，$\mathcal K_0$ 不够！）。对 $n\in[N_j,N_{j+1})$：尖峰块在尾部，$\frac{f_n(X\cup P)}{c_n}\ge-\frac{|p_n|}{c_n}+b_j-2a_n\ge\frac1{\sqrt{c_n}}\to\infty$。**双尺度的关键**：$n\in[N_j,N_{j+1})$ 时 $m_j\ge N_{j+1}>n$ 使尖峰在尾部可见，而误差按更紧的 $2^{-j}$ 控制。[推测] 尖峰放前段则 $n>m_j$ 时落出尾部，发散链断；$P$ 取固定比例则跳出类。删除方向经补对称化归（$f^{T^c}(X^c\cup P)=-f^T(X\setminus P)$）。

**Lemma 4.5（插值）**：$I\subseteq Y$ 皆在类、$\ell(I)\le-1<0<\ell(Y)$ ⟹ 存在 $B\in\mathcal B^-(T)$、$I\subseteq B\subseteq Y$。三分支：

- **A（$\ell(I)=a$ 有限）**：加 $\lfloor-a\rfloor$ 个元素；$\ell(B)=a+\lfloor-a\rfloor\in(-1,0]$（整数化舍入）。元素够：gap 有限时全添后 $\ell(Y)=a+h\le-1$ 矛盾于 $>0$。
- **B（$\ell(Y)=b$ 有限）**：删 $\lceil b\rceil$ 个 gap 元素；$\ell(B)=b-\lceil b\rceil\in(-1,0]$。（Lean 额外发现：gap 必无穷，有限 gap 时 $\ell(I)=b-h>0$ 与 $\le-1$ 矛盾，论文隐含使用未明说。）
- **C（$-\infty$ 到 $+\infty$）**：递减列 $X_0=Y\supseteq X_1\supseteq\cdots$，每阶段：取 $M_j\ge j$ 使 $2c_j\sup_{m\ge M_j}\frac{|(Y\setminus I)\cap W_m|}{|W_m|}<2^{-j}$，**逐个**删 $X_{j-1}\setminus I$ 中块 $\ge M_j$ 的元素，一有 $f_n\le0$（某 $n\ge j$）即停。停时有限：删光后与 $I$ 只差有限元素、$\ell=-\infty$，由 Lemma 4.2 停时更早，矛盾。阶段内界：停时后 $f_n\ge-1$（$\forall n\ge j$，每次删除至多降 1 的重置机制）；对 $n<j$ 前缀不动、尾部降幅 $<2^{-j}$。极限 $X_\infty=\bigcap X_j$：$\ell\le0$（每阶段有见证）、$f_n(X_\infty)\ge-1-\sum_{j>n}2^{-j}=-1-2^{-n}$，**几何预算**。$\ell=-1$ 时从 $Y\setminus X_\infty$（必无穷，否则 $\ell(Y)$ 有限）加一点修补到 $0$。

$-1$ 的双重角色：整数化舍入的锚 + 阶段重置下界 + $-1-2^{-n}>-2$ 的预算锚。$M_j\ge j$ 把 $n$ 分成 $<j$（预算控制）与 $\ge j$（重置控制）两段。[推测] Zorn 直接取极大集：链的上界是无穷并，$\ell\le0$ 不必保持，必须逐阶段 + 几何预算；整块删除则"每次 ≤1"失效。

**Prop 4.6（区间三择一）**：$T\setminus I\in\mathcal J_0$ 或 $Y\setminus T\in\mathcal J_0$ ⟹ 存在 $B\in\mathcal B^\sigma(T)$ 满足 $B\subseteq I$ / $I\subseteq B\subseteq Y$ / $Y\subseteq B$ 之一。四层：端点修正工具（$\ell\le-1$ 时用正池向上修、$\ell>0$ 向下修）；两端在类的四情况；单端在类 + 正 gap；第四层处理 $I$ 不在类，截到 $T\cap I$（$(T\cap I)\triangle T=T\setminus I$ 小）再用第三层；$Y\setminus T$ 小的情形经补集化归（对 $T^c$ 与 $[Y^c,I^c]$ 用 left 版本再取补）。**假设的形状是被递归钉死的**：第 5 节"间隔未被命中"恰好推出每个旧原型满足两个差的否定形式（(5.5)），即本命题假设在未命中场景下必然成立，这是局部性质接到全局递归的接口。[推测] 我最初只证"两端在类"版本，在递归里发现未命中间隔的原型与端点的相对位置只有两种，才补出第四层。

## 7. zone 与插入：超限递归的两个自由度

**admissible**：$u(X)=X_L$、$y(X)=D\setminus X_R$（$y$ 是 $R$-切片之补，descent 的形状 $x_{k+1}=D\setminus z_k$ 由此编码进定义）。两条分支：皆大且 $\rho(u)>\rho(y)$；皆小且 $\rho(D\setminus u)>\rho(D\setminus y)$。**严格不等式是降秩每步严格下降的来源**，非严格撞不上良基性。Upper zone：$u$ 大且（$y$ 小或 $\rho(u)\le\rho(y)$）；Lower：补在 Upper。

**Lemma 5.1（分割与封闭性）**：四象限（$u,y$ 的大小）穷尽三分身份；Upper 向上封闭（秩链条 $\rho(u')\le\rho(u)\le\rho(y)\le\rho(y')$）、Lower 向下；$\mathcal K_0$-对称差不变；补交换两 zone；$\varnothing$ Lower、$E_0$ Upper；**admissible 集与补都 $\mathcal J_0$-正**（一片大即正），这是递归里"原型类合法"的入场券。[推测] 只保留 admissible 不要 zone 不行：递归端点情形需要方向性；admissible 只需 $\mathcal K_0$-不变而**不能要** $\mathcal J_0$-不变，保留集的改动正是 $\mathcal K_0$-小但 $\mathcal J_0$-正的。

**Lemma 5.2（zone crossing）**：$A$ Lower、$Z$ Upper、$A\subseteq Z$ ⟹ 存在 admissible $B$ 夹在中间。固定 $B_R=A_R$（**单变量化**：两个秩阈值是自指约束，动 $R$ 侧引入第二个自由度），只动 $B_L$：$s=A_L$ 小（象限分类：$A_L$ 大且 $A_R$ 小会使 $A$ Upper）、$X=Z_L$ 大。$y=D\setminus A_R$ 大时对 $\gamma=\rho(y)$ 用 thinning 直接得第一支；$y$ 小时对补侧 $s'=D\setminus X$、$X'=D\setminus s$、$\gamma'=\rho(D\setminus y)$ 用 thinning 得 $v$，$B_L=D\setminus v$ 小，**第二支的不等式关于补集的秩，thinning 输出恰是那个补集，阈值要对齐**。[推测] 两片同时 thinning 会被自指约束卡死。

**Lemma 5.3（插入原型）**：$<\mathfrak c$ 个 admissible 原型 $\mathcal T$、$A\subseteq Z$、$A$ 非 Upper、$Z$ 非 Lower、每 $T$ 满足 (5.2) $T\setminus A,Z\setminus T\notin\mathcal J_0$ ⟹ 存在 admissible $B\in[A,Z]$ 与每 $T$ 双向正差。构造：**if-then-else 迹清单**，只对"尚未正"的 $T$ 列迹（$A\setminus T$ 小时列 $G\setminus T$，正性由 $Z\setminus T=(A\setminus T)\cup(G\setminus T)$ 与 (5.2) 推出；$T\setminus Z$ 小时列 $T\cap G$，对称）；迹总数 $<\mathfrak c$。双重保留给 $t$：$H_0,H_1$ 不交 $\mathcal K_0$-小、与每个迹交正。只改间隙：$A'=A\cup(H_0\cap G)$、$Z'=Z\setminus(H_1\cap G)$，$A'\subseteq Z'$（$H_0\cap H_1=\varnothing$ 的三个情况验证）、身份经 $\mathcal K_0$-不变保持。选 $B$：$A'$ 或 $Z'$ 已 admissible 直接取；否则 $A'$ Lower、$Z'$ Upper、Lemma 5.2。分离性：已正方向自动传递；未正方向由保留集补足，$H_0\cap(G\setminus T)\subseteq B\setminus T$、$H_1\cap T\cap G\subseteq T\setminus B$（$B\cap(H_1\cap G)=\varnothing$）。[推测] 迹不分是否已正会破产：某些方向已正时 $G\setminus T$ 未必正，reservations 假设不成立，if-then-else 是被迫的。

## 8. 超限递归与局部拟阵 $Q$

**Prop 5.4**：间隔对 $(I,Y)$（无穷 gap）排成长 $\mathfrak c$ 的序列（Lean 把 $(I,Y)$ 编码为 $E_0\times Bool$ 的子集解码，妙招）。递归逐阶段保留互补原型对（$T$ 配 $-$ 规则、$T^c$ 配 $+$ 规则），要求两两双向正差。处理当前间隔：已命中跳过；否则**枢纽引理 (5.5)**，每个旧原型满足 $T\setminus I,Y\setminus T\notin\mathcal J_0$（Prop 4.6 的逆否：任一差小都会给命中基，含其补，与未命中矛盾）。**选 $[A,Z]$ 三分**：$I$ Upper ⟹ $[\varnothing,I]$（admissible 不能包含 Upper 集，向上封闭）；$Y$ Lower ⟹ $[Y,E_0]$；否则 $[I,Y]$。情形 1、2 的 (5.2) 验证用"admissible 包含 Upper 集 ⟹ 自身 Upper"的封闭性矛盾。插入 $(B,-)$ 与 $(B^c,+)$：补封闭免费（$\mathcal B^+(T^c)=\{B^c\}$ 恒等式），$B^c$ 与旧 $T$ 的差经 $T^c$（也是旧原型）转手即正。每阶段前驱 $|\alpha|<\mathfrak c$（初始序数）、原型 $\le2|\alpha|$、迹 $<\mathfrak c$，**全部逐点估计，无正则性**。

**Theorem 5.5**：$\mathcal B$ 是基族（反链、补封闭、平衡交换、区间三择一），独立集 = 基的子集。(I1)(I2) 平凡；极大独立集 = 基（反链）；(I3) 取 $e\in B_1\setminus I$（$B_1\subseteq I$ 会经反链迫使 $I$ 是基）；**末句断言**（非基独立集可加任意元素）：$e\in B_0$ 直接并；$e\notin B_0$ 时平衡交换换出 $f\in B_0\setminus I$。(IM) 分两支：**gap 有限**，候选族 $\{I\cup H:H\subseteq Y\setminus I\}$ 有限，取最大（[推测] 我可能一开始忽略了有限 gap，被 $Y$ 只比 $I$ 多一个元素的反例打回）；**gap 无穷**，(5.4) 三分支逐字（$B\subseteq I$ 支经反链给 $B=I$ 是基；$I\subseteq B\subseteq Y$ 支直接是扩张；$Y\subseteq B$ 支 $Y$ 自身独立）。对偶：基之补是基（BDKPW）+ 补封闭 ⟹ $Q^*=Q$。基皆 admissible ⟹ **(6.1)**：$B_L\in\mathcal U\Rightarrow D\setminus B_R\in\mathcal U$ 且 $\rho(B_L)>\rho(D\setminus B_R)$，降秩的燃料装填完毕。

**Remark 5.6**：$Q$ uniform（dependent ⟹ (IM) 极大独立子集 $I\subseteq X$，$I$ 非基则末句断言给扩张、矛盾 ⟹ $I$ 是基 ⟹ $X$ spanning）；基与补无穷（admissibility 的大集切片）；有限集独立（平衡换入）；$E_0$ dependent（基补非空）⟹ 非 finitary，自对耦 ⟹ 非 cofinitary。这同时肯定回答 Bowler–Geschke 的"ZFC 中无穷自对耦 uniform 拟阵存在吗"（他们只在 MA 下造过）与 Gollin–Joo 的 uniform 存在性问题。

## 9. 双射线装配与降秩终局

直和公理验证（可数直和 (I1)–(IM) 分量式，(IM) 靠逐分量选择）。双射线：顶点 $v_n$（$n\in\mathbb Z$），捆绑 $e_n=\{n\}\times D$，**中心 $e_{-1}$**；方向表，$n\le-1$：$L=e_n,R=e_{n-1}$；$n\ge0$：$L=e_{n-1},R=e_n$，$L$ 指向中心、$R$ 向外。$M_0=\bigoplus_{n\in2\mathbb Z}Q_n$、$M_1=\bigoplus_{n\in2\mathbb Z+1}Q_n$。

**为什么按奇偶拆**：每个捆绑恰被一个偶顶点分量与一个奇顶点分量共用，两个拟阵的竞争发生在同一批元素上；同奇偶装配则分量支撑不交、覆盖自动存在。**为什么 $L$ 指向中心**：让"向外走"每步的内标签承接上一步外标签之补，传播链良定义。**为什么双射线，并非半射线**：起点需要中心捆绑两侧互补的大侧二选一，自对耦要求两端对称。

降秩论证：设 $J_0,J_1$ 独立覆盖 $E$，换 $J_1\supseteq E\setminus J_0$ 得**划分**。按奇偶把每元素指派给捆绑的同奇偶端点：每顶点收到的标签集是 $Q_n$ 的独立集。中心捆绑 $e_{-1}$ 分给 $v_{-1}$（奇）与 $v_0$（偶）两份互补集合，ultrafilter 二分性 ⟹ 恰一份大。从那个端点沿射线**永远向外**：$x_k$ = 内标签（$x_0$ 大）、$z_k$ = 外标签，$x_{k+1}=D\setminus z_k$（划分 + 同标号）。归纳：$x_k$ 大 ⟹ 含于某基 $B_k$ ⟹ $u_k=(B_k)_L$ 大 ⟹ (6.1) 给 $y_k$ 大且 $\rho(u_k)>\rho(y_k)$；$y_k\subseteq D\setminus z_k=x_{k+1}$ ⟹ $x_{k+1}$ 大；反单调：

$$\rho(x_k)\ \ge\ \rho(u_k)\ >\ \rho(y_k)\ \ge\ \rho(x_{k+1}).$$

无穷严格递减序数列不可能（值集有最小元）。故无独立覆盖，Lemma 2.2 升级为无 packing/covering partition。[推测] 单个顶点上没有矛盾，矛盾来自沿射线的无穷传播，这正是把 $Q$ 沿路径摆放的全部动机。

**第 7 节（论文引用路线）**：BC 的普遍等价链"交 ∀对 ⇔ packing/covering ∀对 ⇔ ∀族 ⇔ (7.1) ∀族 ⇔ (7.2) ∀族"，Theorem 1.1 推翻第二环 ⟹ 两个分离猜想 (7.1)(7.2) 在 ZFC 中皆假；witnessing family 不必等同 $(M_0,M_1)$。

## 10. Lean 镜子

34 文件 / 4477 行；`ComparatorChallenges/InfiniteMatroid.json`，permitted axioms 恰三大标准公理（ultrafilter 引理走 `Classical.choice`，与 "In ZFC" 一致）；**被 comparator 核验的只有 `main` 一条**。Lean 主定理：$E=\mathbb Z\times D$（$D=(m:\mathbb N)\times((\mathrm{Fin}\ m\to\mathrm{Bool})\to\mathrm{Bool})$，函数空间实现 $D_m$，`card_dBlock = 2^(2^m)`），$M_0,M_1$ 显式给出（`rayMatroid Q false/true`），断言自对耦 + 无独立覆盖 + ¬`HasPackingCovering`；partitional/uniform/交推论在 `Corollaries.lean`/`SeparateCounterexamples.lean`。$E$ 具体给出，比论文"存在一个可数集"略强。

**路线差异（★）与重心转移**：

1. **第 7 节 Lean 反而更重**：论文引用 BC 等价链；Lean **自建极大 wave（Zorn）+ 残差机器**（`Waves/CoveringReduction/PairDuality/IntersectionReduction` 约 300 行），显式产出 witnessing family（残差族 $N_i=M_i／W.1$），比论文"不识别 witness"更强。Corollary 1.2 的交归约（交 ⟹ packing/covering partition）Lean 也自证（`packingCovering_of_intersection`）。[推测] 动机是让 permitted-axioms 挑战自足，不把引用当证明义务。
2. **抽象接口分层**：`RankModel`（ideal/ultra/avoids/rank/antitone/thinning 六字段）、`BasisSystem`（五字段）、`CylinderContinuous`（圆柱一致连续，插值引理在 $\mathbb N$-标号抽象层证明再经 `labelEquiv : E0 ≃ ℕ` 搬回），全局装配只依赖接口，`hK : R.ideal = KIdeal` 把接口钉到具体理想，`include hK` 模式可区分"结构性"与"具体性"引理。
3. **更省的两处**：反链用单点化（加一探针 +1，不分有限/无穷差）；直和直接用 Mathlib `Matroid.sum'`（论文一整段公理验证 → 0 行自证；partitional 证书走 `Matroid.sigma`，**两个直和入口并存**，读证明时要分清）。
4. **常数差异**：spike 高度 $b_j=2^{1-j}$ vs Lean $\delta/(j+1)$（可互换，"常数任意性"取证点）；$(3/4)^q$、$(1/2)^j$、$1/\sqrt{c_n}$ 逐字对应。
5. **组织差异**：ultrafilter 引理抽象到任意指标类型（`exists_rank_ultrafilter`）；reservations 的 $\epsilon$-子列论证改写成密度不等式；递归用 `wellFounded_lt.fix` + `Option`（none=跳过），并非"长度 𝔠 的序列"，跨阶段分离经 `max` 阶段的 `GoodPrototypes`；降秩用 `left : Bool` 统一两臂、$(X_R)^c=x_{k+1}$ 的**相等**（比论文的包含更紧）、`WellFoundedLT` 收尾替代"序数无递减链"散文；拟阵化走 `Matroid.ofBase`（基公理接口，(I1)(I2)(I3) 被吸收，(IM) 由有限 gap 的候选有限性 + 无穷 gap 的 `intervals` 合成）。
6. **Lean-only 细节**：`columnString` 前 2 比特编码族属（$A/B/G$）+ `cindexBinaryEquiv` 编码序数，"分配不同串"的完全具体化；非大集枚举填 univ（"allowing repetitions"的填充式实现）；`componentEquiv` 内联重复证明、`push Not` tactic 等 tactic 痕迹。
7. **缺口**：Remark 5.6 后半（基补无穷、非 finitary/cofinitary、开放问题回答）、$M_i$ 层面的非 finitary 论证（含"无非空 finitary 直和项"，我滑出 Joo mixed 定理范围的关键！）、Joo Question 1.5 的文献层陈述，均不在 Lean 中；comparator 只核验 `main`，推论未被 challenge 单独背书。

## 11. 常数总表

| 层 | 常数 | 机械角色 | Lean 落点 |
|---|---|---|---|
| 舞台 | $w_m=2^{2^m}$、(3.1) $w_m\ge2\sum_{j<m}w_j$ | 列空间 + 单元素 Lipschitz + 误差预算 | `card_dBlock`、`block_growth` |
| 列 | $2^{-r}$ 精确密度 | $\mathcal K$ 真性、$(3/4)^q$ | `columns_pattern` |
| 理想 | $\mathcal J\subsetneq\mathcal K$ 间距 | 保留细胞 $\mathcal K_0$-小 $\mathcal J_0$-正 | `KSmall/KIdeal` |
| 超滤 | (3.3) 列复杂度有限 | thinning 计数 | `hfinite` |
| 秩 | $\mathfrak c$ 初始序数、$\rho$ 最小指标 | 降秩燃料 | `CIndex`、`ordinalRank` |
| 保留 | $(3/4)^q$ | bad 指标有限 | `eventually_avoidCells` |
| 探针 | 阈值 $-1,0,1$；$c_n(\sup+\inf)$ | 反链 + 补对称 + 舍入 | `LowerBasis`、`fProbe` |
| spike | $b_j$、$m_j\ge N_{j+1}$、$1/\sqrt{c_n}$ | 双尺度发散 | `exists_small_spikes` |
| 插值 | $2^{-j}$、$-1-2^{-n}$、+1 修补 | 几何预算 | `deletion_stage`、`hlower` |
| 装配 | 严格 $\rho(u)>\rho(y)$ | 每步严格降秩 | `Admissible` |
| 终局 | (6.1)/(6.2) 链 | 良基矛盾 | `independent_rank_step` |

## 12. 可信度审查与倒推锚点

论文侧：主定理第三句有专门引理（2.2）支撑非自动；每个"$<\mathfrak c$ 个要求"场合显式基数论证且声明无正则性；探针设计有补对称与 Lipschitz 双重检验。三个注意点：Lemma 4.5 情形 B 隐含"gap 无穷"（Lean 显式化）；Prop 4.6 第四层的分支推理紧凑；BC2015/BG2016 的引用是外部承重墙，Lean 恰好把最重的一条（等价链）换成了自证。Lean 侧：零新公理；关键构造全部有对应；两处强于论文（wave 自证、显式 witness）；缺口集中在 finitary 性质与文献层断言。

倒推锚点：块为什么双重指数（第 2 节）；为什么需要第二个理想 $\mathcal K$（第 2 节末）；ultrafilter 为什么必须排除 forbidden 集（第 3 节）；两个不交保留细胞为什么是minimal配置（第 4 节）；sup+inf 为什么不是别的组合（第 5 节）；双尺度 spike 为什么 $m_j\ge N_{j+1}$（第 6 节）；Zorn 为什么不行、必须几何预算（第 6 节）；递归为什么每阶段插一对互补原型（第 8 节）；严格不等式为什么不可放松（第 7、9 节）；为什么按奇偶拆、为什么双射线（第 9 节）；Lean 为什么在第 7 节反而更重（第 10 节）。

## 13. 双射线：把标题的承诺逐步钉回 06 的行号

第 0 节把标题押在"埋"字上，第 9 节却只给了降秩论证一次总览。这一节把它拆开：$Q$ 从哪一行被搬上射线、$x_k$ 与 $z_k$ 从哪一行获得定义、每一次严格下降由哪一行供给、链条为什么不能停机。行号一律指向 `build\sections\` 下的分片，逐字对照。术语说明：本节的"自对偶"与第 1 节起的"自对耦"同指 tex 的 self-dual，写作约定见 02-matroids.tex:42-43。

**(a) 装置进场**：06-counterexample.tex:3-8 逐字："We now use the local matroid $Q$ from Theorem~\ref{thm:local-matroid} to construct the required pair. Recall that $Q=Q^*$ on $E_0=L\mathbin{\dot\cup}R$, where each of $L,R$ is a labeled copy of the countable set $D$." 06:16 的 "The rank is antitone under inclusion of members of $\mathcal U$." 只是把 03-filters.tex:161-162（Lemma 3.3 后半）搬来，不重新证明；06:17-18 宣告策略："An independent covering will propagate a member of $\mathcal U$ along a ray, strictly decreasing this rank at every step."

**(b) 几何铺设**：06:43-48 给顶点 $v_n$（$n\in\mathbb Z$）、捆绑 $e_n=\{n\}\times D$ 与 $E=\mathop{\dot\bigcup}_{n}e_n$；06:49 一句 "Thus every bundle has the fixed label map $(n,d)\mapsto d$ onto $D$." 最容易被读过去，它保证任意两个顶点上的标签集可以直接取补、直接比较；06:50-51 给可数性；06:52 指定中心捆绑 $e_{-1}$；06:53 "At every vertex put a copy $Q_n$ of $Q$ on $e_{n-1}\cup e_n$."；06:56-62 是那张两行方向表；06:63 "Both middle vertices therefore use the central bundle as $L$."；06:64 "All copies use the same label maps, ultrafilter, and rank."；06:68-73 定 $M_0=\bigoplus_{n\in2\mathbb Z}Q_n$、$M_1=\bigoplus_{n\in2\mathbb Z+1}Q_n$；06:74-76 给"每捆绑恰有一个该奇偶端点"的支撑划分；06:77-78 由直和核验加 $Q=Q^*$ 得 $M_i=M_i^*$ on the same labels。

**(c) 降秩链条逐步**（每行给出处、给出该步唯一消费的东西）：

1. 06:111-113：假设 $J_i$ 独立覆盖 $E$，把 $J_1$ 换成 $E\setminus J_0\subseteq J_1$，得独立划分 $E=J_0\dot\cup J_1$。消费的是 hereditary（I2），产出是"分配"这一动作的唯一性；不先化归成划分，后面的补等式只有包含关系。
2. 06:114-116：按奇偶把每元素交给同奇偶端点，"At every vertex, the assigned elements on its two incident bundles form an independent set of its copy of $Q$."。消费 06:24-25 的分量式独立判据。
3. 06:118-119：中心捆绑被切成两片，"Exactly one of the two label sets belongs to $\mathcal U$."。消费 03-filters.tex:102-103 的 ultrafilter 定义（对每个 $X$ 恰取 $X$ 与 $D\setminus X$ 之一）；这是整条链唯一的起点二选一。
4. 06:120-122："Start at that endpoint and move outward forever. Write $x_k\subseteq D$ for the labels received by the $k$th vertex on its inward bundle. Thus $x_0\in\mathcal U$."。$x_0$ 之大直接继承第 3 步。
5. 06:124-127：$x_{k+1}=D\setminus z_k$，理由写在同一行 "because the assignment is a partition and the label maps agree."。等号（，并非包含）来自 06:49 与 06:112 两处；这一步是整节唯一把"划分"翻译成"补"的地方。
6. 06:129-131：归纳假设 $x_k\in\mathcal U$，把该顶点的独立指派装进一个基 $B_k$。消费 (IM)：02-matroids.tex:19-21 保证 $Y=E_0^{(n)}$ 内有极大独立元，05-assembly.tex:291-293 说明极大独立集恰是基。
7. 06:132-136：$u_k=(B_k)_L$、$y_k=D\setminus(B_k)_R$，由 $x_k\subseteq u_k$ 得 $u_k\in\mathcal U$。这里用到 $\mathcal U$ 对超集封闭（滤子公理，03-filters.tex:102-103 的"proper filter"部分）。
8. 06:137-138：对 $B_k$ 用 06:9-15 的 (6.1)（即 05-assembly.tex:276-282 的 eq:basis-rank-decrease）得 $y_k\in\mathcal U$ 与 $\rho(u_k)>\rho(y_k)$。全链条中唯一的严格不等式就在这里产生，其来源是"每个基都 admissible"（05-assembly.tex:274 与 322）。
9. 06:138-139：$z_k\subseteq(B_k)_R$ ⟹ $y_k\subseteq x_{k+1}$ ⟹ $x_{k+1}\in\mathcal U$。$z_k\subseteq(B_k)_R$ 是第 2 步"指派含于基"在 $R$ 片上的投影。
10. 06:140-144：两次反单调（03-filters.tex:161-162）夹住第 8 步的严格号，得 $\rho(x_k)\ge\rho(u_k)>\rho(y_k)\ge\rho(x_{k+1})$。
11. 06:145-147：无穷严格下降序数列不可能，理由是"其值集有最小元，下一个值会更小"；这里没有用任何关于 $\mathfrak c$ 的假设，纯粹是序数的良基性。
12. 06:149-153：得 $M_0,M_1$ 无独立覆盖，经 02-matroids.tex:85-115（Lemma 2.2）升级为无 packing/covering 划分，主定理 01-introduction.tex:32-43 证毕。

**(d) 步数与"有限并失败"之间的关系**。我原来以为降秩论证的力量来自"两个拟阵太少"，逐步钉完才看清两件事被分开了：

- 元数（覆盖里独立集的个数）由 $E_0=L\dot\cup R$ 的双坐标钉死。第 5 步的补等式需要"上一个顶点的外片"与"下一个顶点的内片"是同一集合 $D$ 上的同一标签，第 6-8 步的 $u_k,y_k$ 只有两片坐标可用。覆盖若写成 $k$ 个独立集，装置就要 $k$ 片坐标的局部拟阵；本文的局部对象恰是 $k=2$ 的形状，与 01-introduction.tex:36-39 只否定两元并的陈述对齐。
- 步数由射线长度供应。每个顶点消耗一个严格下降，顶点集是 $\mathbb Z$，所以下降长度是 $\omega$；有限长的路径给不出矛盾，因为序数 $<\mathfrak c$ 之间允许任意有限长的严格下降（$\mathfrak c$ 是极限序数或后继都一样，有限下降总是合法）。于是"埋"字的准确含义是：单个 $Q$ 只贡献一条局部不等式，它必须被 $\omega$ 个顶点的接力激活，而 $\omega$ 个顶点需要 $\omega$ 个捆绑、$2\omega$ 个分量支撑，这正是 $E$ 必须可数无穷（06:50-51）的组合理由。
- 值域为什么是序数，并非自然数：降秩本身只要每次严格下降，$\mathbb N$-值也够；真正逼出序数的是 03-filters.tex:180-186 的 thinning，它要对任意 $\gamma<\mathfrak c$ 抬出 $\rho(u)>\gamma$；$\omega_1$ 级别的值域是为"任意高度可抬"付的价钱，降秩只是它的消费方（[推测]，论文未把这两件事的关系写成句子）。
- 每步都吃一次 (IM)（第 6 步）。finitary 拟阵在 BDKPW 框架里同样满足 (IM)（02-matroids.tex:10-22 是对全部无穷拟阵的公理），(IM) 的缺失给不出矛盾；矛盾的真正来源是基的结构：区间 $(-1,0]$ 的舍入阈值（04-local-bases.tex:40-42）与 admissible 的严格秩不等式（05-assembly.tex:18）这两件事在 finitary 拟阵里没有对应物，这一点论文没有明说，是我从 01-introduction.tex:139-144 的定义与 05-assembly.tex:336-341 的非 finitary 论证对照出来的。

[推测] 三条我试过的失败路线。其一，把 $Q$ 直接摆在 $E=\mathbb N\times D$ 的半射线上：06:53 要求每个顶点的 $Q_n$ 挂在两条相邻捆绑上，半射线有一个端点只剩一条捆绑，$Q$ 的定义域缺一块；即使硬改成"端点用限制拟阵"，第 3 步的中心二分也无处安放（06:63 那句 "Both middle vertices" 正是为对称性而写）。其二，把 (6.1) 的严格号放松成 $\ge$：05-assembly.tex:18 的两支定义会变成平凡条件，thinning 抬秩失去方向，链条在第 10 步退化为常值序列，06:145-147 的矛盾消失。其三，让相邻顶点共用同一片 $L$（把方向表两行合并）：第 5 步的等式 $x_{k+1}=D\setminus z_k$ 就不再成立，因为同一捆绑会被两个顶点同时当作内片切分，$z_k$ 与 $x_{k+1}$ 落在同一个 $D$ 的同一侧，补关系变成自指。

## 14. 四段式一：可数直和的公理核验与共同 ground set（06:20-41、06:43-78）

**(a) 逐字文本**。06-counterexample.tex:22-25："For completeness, the direct sums we use satisfy all the infinite-matroid axioms. Let $(Q_j:j\in J)$ be matroids on pairwise disjoint sets $F_j$, where $J$ is countable. Declare $I\subseteq\bigcup_{j\in J}F_j$ independent if $I\cap F_j$ is independent in every $Q_j$." 06:26-29："Axioms (I1) and (I2) follow componentwise. The maximal independent sets are exactly the unions of one basis from each component: a nonmaximal component permits an extension of the union, and if all components are maximal no element can be adjoined." 06:31-34："For (I3), if $I$ is not maximal, some $I\cap F_j$ is not maximal in $Q_j$. Given a global basis $B$, its part $B\cap F_j$ is a component basis. Apply (I3) there and adjoin the resulting element to $I$." 06:34-37："For (IM), given independent $I\subseteq Y$, choose in each component a maximal independent extension of $I\cap F_j$ inside $Y\cap F_j$. Their union is a maximal independent extension of $I$ inside $Y$. These choices are available in ZFC." 06:37-41："This proves that the direct sum is a matroid, and also proves its stated description of bases. If every component is self-dual on its own labels, then the complement of each global basis is again a global basis, so the direct sum is self-dual on the same labels."

**(b) 中间步骤**。

- (I1)：$\varnothing\cap F_j=\varnothing$ 在 each $Q_j$ 独立（02-matroids.tex:14）。(I2)：$I'\subseteq I$ 逐片取交仍是逐片子集，heredity 在 $Q_j$ 内用一次。两行都真的只用分量式，没有隐藏步骤。
- 极大独立集 = 各分量基之并，两个方向都要补：（$\subseteq$）若 $J$ 极大，取任一 $j$，$J\cap F_j$ 若在 $Q_j$ 内不极大，就有 $e\in F_j$ 使 $(J\cap F_j)\cup\{e\}$ 独立；其余分量不动，故 $J\cup\{e\}$ 仍全局独立，矛盾。（$\supseteq$）设 $J=\bigcup_j B_j$ 且各 $B_j$ 为基，若有 $e$ 使 $J\cup\{e\}$ 独立，$e$ 落在某个 $F_{j_0}$，则 $B_{j_0}\cup\{e\}$ 在 $Q_{j_0}$ 中独立，与基的极大性矛盾。06:27-29 用"no element can be adjoined"一句压掉了后半。
- (I3)：$I$ 不极大 ⟹ 存在 $j$ 使 $I\cap F_j$ 在 $Q_j$ 不极大（这正是 06:26-29 已证的"极大当且仅当逐片极大"的逆否）；$B$ 是全局基 ⟹ $B\cap F_j$ 是 $Q_j$ 的基（同一段的另一方向）；在 $Q_j$ 内用 (I3) 得 $e\in(B\cap F_j)\setminus(I\cap F_j)$，于是 $e\in B\setminus I$ 且 $I\cup\{e\}$ 逐片独立。论文写 "Apply (I3) there" 时把"$B\cap F_j$ 是基"这个前提交给前一句，链条里没有断点。
- (IM)：对固定 $I\subseteq Y$，在每个 $Q_j$ 中对 $I_j=I\cap F_j\subseteq Y_j=Y\cap F_j$ 用 (IM) 得极大 $J_j$。并 $J=\bigcup_j J_j$ 含 $I$、含于 $Y$；若 $J$ 在 $\{K:I\subseteq K\subseteq Y\}$ 内不极大，某个 $e\in Y\setminus J$ 使 $J\cup\{e\}$ 独立，$e\in F_{j_0}$ 就给出 $J_{j_0}\cup\{e\}$ 独立，与 $J_{j_0}$ 的极大性矛盾。
- 自对偶：全局基 $B=\bigcup_jB_j$，其在 $E=\bigcup_jF_j$ 中的补 $E\setminus B=\bigcup_j(F_j\setminus B_j)$；每片 $F_j\setminus B_j$ 是 $Q_j^*=Q_j$ 的基（02-matroids.tex:36-38 的对偶基描述），故补是全局基。这里"同标号"是字面要求：补必须取在同一个 $F_j$ 上，而 $F_j$ 的标签由 06:49 的统一标签映射固定。
- $M_0,M_1$ 的支撑划分：$Q_n$ 的支撑是 $e_{n-1}\cup e_n$，而 $e_n$ 恰与 $v_n,v_{n+1}$ 相邻，两者一奇一偶，故固定奇偶时诸支撑两两不交且并为 $E$。06:74-76 用 "each bundle has exactly one endpoint of that parity" 一句话给出这个计数论证。

**(c) 机械理由**。

- 为什么 $J$ 必须可数（06:24）：射线有 $\omega$ 个顶点，$J=2\mathbb Z$ 或 $2\mathbb Z+1$ 自然可数；可数还保证 $E=\bigcup_jF_j$ 可数，而 01-introduction.tex:128-129 要用"common ground set is countable"去接 Joo 的 Question 1.5。
- 为什么 (IM) 那段末尾单写 "These choices are available in ZFC"（06:36-37）：每个分量的选择集非空由分量自己的 (IM) 给出，但把 $\omega$ 个非空集的同时选择做完需要可数选择；这在 ZFC 是定理，在 ZF 不是。这一行是正文里唯一显式点出"用到选择"的地方，其余选择都藏在 03-filters.tex:139-140 的 ultrafilter lemma 与 03-filters.tex:14 的"$\mathfrak c$ 兼作初始序数"（即 $\mathcal P(D)$ 可良序）里。
- 为什么 ZFC 而 ZF 不够（汇总三处，逐行）：03-filters.tex:14 把 $\mathfrak c=2^{\aleph_0}$ 当作初始序数，ZF 下 $\mathcal P(\mathbb N)$ 未必可良序；03-filters.tex:139-140 的 ultrafilter lemma 在 ZF 下对非有限生成滤子不成立（等价于 Boolean prime ideal theorem）；06:36-37 的逐分量选择需要 $\mathsf{AC}_\omega$。01-introduction.tex:33 的 "In ZFC" 与这三处一一对应，Lean 侧 permitted axioms 恰为 `propext, Quot.sound, Classical.choice` 也印证没有第四种依赖。
- 为什么这一段要"for completeness"整段写进论文：Lean 直接用 Mathlib 的 `Matroid.sum'`（第 10 节第 3 条），所以 tex 这一段在形式化里没有对应物，属于纯文献层的自足性要求；删掉它主定理仍然真，但读者无法确认 $M_i$ 落在 (I1)-(IM) 类里。

**(d) [推测] 候选失败路线**。其一，把奇偶换成三着色而 $Q$ 仍只有两片坐标：06:74-76 的"恰一个该奇偶端点"失效，$M_i$ 不再是 $E$ 上的拟阵，(I1) 就无从谈起。其二，把 (IM) 的逐分量极大扩张改成"整体极大"再用 Zorn：$Y$ 上的候选族 $\{K:I\subseteq K\subseteq Y\}$ 的极大性无法从链的上界（无穷并）保持，因为无穷并的逐片独立性要求每片是某个 $J^{(\lambda)}\cap F_j$ 的并的上确界，链未必在片内达到极大；这正是论文逐片选的动机。其三，若分量 $Q_j$ 只自对偶到"同构"，并非"同标号相等"（02-matroids.tex:42-43 的约定），$E\setminus B=\bigcup_j(F_j\setminus B_j)$ 就不再是基，第 9 节 Lemma 2.2 与 01-introduction.tex:126-127 的替换两处同时断。

## 15. 四段式二：非 finitary、非 cofinitary，且无非空直和项（06:94-107）

**(a) 逐字文本**。06-counterexample.tex:94-99："Every finite subset of $E$ is independent in each $M_i$, because all its component parts are finite and every finite subset of $Q$ is independent by Remark~\ref{rem:uniform-local}. But $E$ is dependent in each $M_i$: its intersection with any component support is the dependent whole ground set of that copy of $Q$. Thus neither $M_i$ is finitary. Since $M_i=M_i^*$, neither is cofinitary either." 06:101-107："In fact, neither matroid has a nonempty finitary or cofinitary direct summand. Suppose a nonempty set $F$ supports a finitary summand. Every subset of $F$ is independent, since all its finite subsets are independent, so $F$ is the summand's only basis. Thus every basis of $M_i$ contains $F$. But complements of bases are also bases of $M_i$, a contradiction. Dualizing the direct-sum basis description gives the same contradiction for a cofinitary summand." 配套定义在 01-introduction.tex:139-142："Here a matroid is \emph{finitary} if a set is independent whenever all its finite subsets are independent, and \emph{cofinitary} if its dual is finitary." 动机句在 01-introduction.tex:148-150："The examples here have no nonempty finitary or cofinitary direct summand, as we show in Section~\ref{sec:counterexample}, so they lie outside this mixed direct-sum class."

**(b) 中间步骤**。

- 有限集在 $M_i$ 中独立：$A\subseteq E$ 有限 ⟹ 对每个分量支撑 $S_n=e_{n-1}\cup e_n$，$A\cap S_n$ 有限，而 05-assembly.tex:336-338 说 $Q$ 的每个有限子集独立（做法是从任一基出发，把 $A$ 中缺的元素逐个换入、等量换出）；用 06:24-25 的分量判据合成全局独立。注意这里消费的正是 05 节里那句看似无关紧要的 "using its infinitude and balanced finite changes"：换出元素必须取得到，靠的是每个基无穷（05-assembly.tex:334-335）。
- $E$ 在 $M_i$ 中 dependent：$E\cap S_n=S_n=E_0^{(n)}$，而 05-assembly.tex:339-340 说 $E_0$ 在 $Q$ 中 dependent（"because every basis has a nonempty complement"）；分量判据立刻给出 $E$ 不独立。于是"每个有限子集独立而全集不独立"，finitary 的定义（01:139-141）被逐字违反。
- 自对偶 ⟹ 非 cofinitary：$M_i^*=M_i$ ⟹ $M_i^*$ 也非 finitary，而 cofinitary 的定义恰是"对偶 finitary"。06:98-99 两句就是全部，中间无隐含步骤。
- 无非空 finitary 直和项（补出论文跳过的四处）：设 $M_i=N\oplus N'$，$N$ 支撑在 $F\ne\varnothing$ 且 finitary。第一跳：任意有限 $T\subseteq F$ 在 $M_i$ 中独立（上条已证），由直和的分量判据，$T$ 在 $N$ 中独立。第二跳：$N$ finitary ⟹ 任意 $S\subseteq F$ 在 $N$ 中独立；取 $S=F$ 得 $F$ 自身在 $N$ 中独立。第三跳：$F$ 是 $N$ 的全部 ground set，$F$ 独立 ⟹ $F$ 是 $N$ 的唯一极大独立集，即唯一基。第四跳：直和的基 = 各分量基之并（06:26-29）⟹ 每个 $M_i$ 的基 $B$ 都含 $F$；又基之补仍是基（02-matroids.tex:36-38 加 06:39-41），故 $E\setminus B$ 也含 $F$；两含式与 $B\cap(E\setminus B)=\varnothing$ 冲突，与 $F\ne\varnothing$ 冲突。论文在"so $F$ is the summand's only basis"处一次跨过第一到第三跳，在最后一句里把第四跳写成 "a contradiction"。
- cofinitary 版本（论文压成一句 "Dualizing..."，我按对偶展开）：$N$ 支撑在 $F$ 且 cofinitary ⟹ $N^*$ 支撑在 $F$ 且 finitary ⟹ 上一段给出 $N^*$ 的唯一基是 $F$ ⟹ 由对偶基 = 补基，$N$ 的唯一基是 $\varnothing$ ⟹ 每个 $M_i$ 的基 $B$ 满足 $B\cap F=\varnothing$，即 $F\subseteq E\setminus B$；但 $E\setminus B$ 本身是基，故 $F\subseteq E\setminus(E\setminus B)=B$，与 $B\cap F=\varnothing$ 矛盾。这一步需要 $F\ne\varnothing$。

**(c) 机械理由**。

- 为什么"整体非 finitary"不够、必须"无非空 finitary/cofinitary 直和项"：01-introduction.tex:145-147 引 Joo 的正面定理覆盖"countable ground set 上、成员为 finitary 与 cofinitary 拟阵之直和"的任意 set-indexed 族。只证整体非 finitary 时，$M_i$ 仍可能被分解成一堆 finitary 分量加一堆 cofinitary 分量，从而落回 Joo 的适用面；06:101-107 把这条退路也堵掉。第 0 节的战略句在此处得到兑现。
- 为什么论证只需要"基之补是基"而不需要别的对偶性质：finitary 分支用到 $B\supseteq F$ 与 $E\setminus B\supseteq F$ 并存，cofinitary 分支用到 $B\cap F=\varnothing$ 与 $E\setminus B\cap F=\varnothing$ 并存；两支都是同一句话（06:105-106 "complements of bases are also bases"）的两面。这正是自对偶在这里的第二重用途：Lemma 2.2 用它做归约，本节用它做防分解。
- 为什么 $F$ 可以任意（不必是分量支撑）：论证的起点只有 06:94-95 的"有限集独立"，与 $F$ 的位置无关；所以这个结论对整个 $E$ 上的任何直和分解成立，比只排除"标准奇偶分解"强。
- 可数性在本段没有被用到：$F$ 可以不可数，finitary 判据只管有限子集。真正吃可数性的是 06:24 与 01:128-129。
- 诚实记录：Lean 里这一段（$M_i$ 层面的非 finitary 与"无非空直和项"）没有对应物，只在 $Q$ 层有 `Partitional.lean` 一类的支撑（第 10 节第 7 条），comparator 也只核验 `main`。所以 tex 06:94-107 目前只有散文级证据。

**(d) [推测] 候选失败路线**。其一，若删掉 05-assembly.tex:336-338 的"有限集独立"，第一跳立刻无源，$F$ 的有限子集不再已知独立，整段防分解失效；这也解释为什么 06:94-95 要在防分解之前出现。其二，若把 finitary 换成"每个有限集的闭包是有限集的闭包"之类较弱的局部有限性，第二跳（$N$ 的有限子集独立 ⟹ 全体子集独立）就用不上定义本身，论证要重做。其三，若 $M_i$ 只对偶到同构级（$M_i^*\cong M_i$ ，并非同标号相等），第四跳里 $E\setminus B$ 未必是 $M_i$ 的基，两支同时崩；这与 02-matroids.tex:42-43 的约定句呼应。

## 16. 四段式三：Corollary 1.2 的交归约（01:93-130）

**(a) 逐字文本**。定义 01-introduction.tex:93-98："For matroids $M,N$ on a common ground set $E$, the pair \emph{satisfies intersection} if there is a set $J$ independent in both matroids and a partition $J=J_M\dot\cup J_N$ such that $\operatorname{cl}_M(J_M)\cup\operatorname{cl}_N(J_N)=E$." 陈述 01:103-114："The same pair $(M_0,M_1)$ constructed in Theorem~\ref{thm:main} consists of partitional matroids and does not satisfy intersection. More explicitly, for every set $J$ independent in both $M_0$ and $M_1$ and every partition $J=J_0\dot\cup J_1$, $\operatorname{cl}_{M_0}(J_0)\cup\operatorname{cl}_{M_1}(J_1)\ne E$. Consequently, the unrestricted infinite Matroid Intersection Conjecture is false in ZFC. The pair also gives a negative ZFC answer to Jo\'o's Question~1.5 for two partitional matroids on a common countable ground set." 证明 01:116-130："Each $M_i$ is a direct sum of countably infinitely many copies of the uniform matroid $Q$, so it is partitional. Bowler and Carmesin \cite[Proposition~3.6]{BowlerCarmesin2015} prove that, for any matroids $M,N$ on the same ground set, $(M,N)\text{ satisfies intersection}\Longleftrightarrow (M,N^*)\text{ has a packing/covering partition}$. Apply this equivalence with $M=M_0$ and $N=M_1$. Since $M_1^*=M_1$ on the same labelled ground set, the right-hand side concerns the identical pair $(M_0,M_1)$ and is false by Theorem~\ref{thm:main}. Its common ground set is countable, so it also satisfies the hypotheses of Jo\'o's question."

**(b) 中间步骤**。

- partitional 一句的前提在 01:82-87：Joo 的术语里"uniform 之直和"叫 partitional，而 01:84-86 又把 Joo 的 uniform 定义换算成"每个子集独立或 spanning"，后者正是 05-assembly.tex:326-327 为 $Q$ 证的性质。链条是：$Q$ uniform（05:326-333）+ $M_i$ 为可数个 $Q$ 的直和（06:68-73）⟹ $M_i$ partitional（01:82-83）。
- 等价式用的是反方向：$\text{RHS}\Rightarrow\text{LHS}$ 的逆否，即 RHS 假 ⟹ LHS 假。RHS 对 $(M_0,M_1^*)=(M_0,M_1)$ 恰是"有 packing/covering 划分"，01:41 已给否证。
- 展开成 01:105-110 的显式量化：LHS 是"存在 $J$ 与 $J$ 的一个划分使闭包并覆盖 $E$"；它的否定逐字是"对每个这样的 $J$ 与每个划分，闭包并 $\ne E$"。论文把否定写成 $\ne E$ ，并非"某个元素不被覆盖"，量词顺序没有放松的空间。
- Joo Question 1.5 的接入需要三个前提同时成立：两拟阵 partitional（上）、ground set 可数（01:128-129，来自 06:50-51）、不满足交（本条已证）。01:89-91 说明该问题恰问"两 partitional 拟阵的交"，所以一个反例即负答案。

**(c) 机械理由**。

- 为什么"$M_1^*=M_1$ 同标号"必须在等价式右端逐字出现：Prop 3.6 的右端把 $N^*$ 与 $M$ 放在同一 $E$ 上谈 packing/covering 划分，替换 $M_1^*\to M_1$ 是集合相等级替换；同构级的自对偶不足以让"the identical pair"（01:127）成立。
- 为什么闭包取在全拟阵上，并非限制上：01:93-98 的定义写 $\operatorname{cl}_M(J_M)$，与 02-matroids.tex:27-32 的全集闭包定义一致；主定理端 01:18-26 的划分定义里 packing 半边用 $\operatorname{cl}_{M_i\upharpoonright P}$。两种闭包混用是 BC 框架的常规，但 Corollary 1.2 里若误把交猜想的闭包读成限制闭包，Prop 3.6 的字面形式就对不上，所以 01:96-97 的写法必须逐字保留。
- 为什么本推论必须另起一节，并非由主定理直接给出：主定理的否定式只管"两个独立集的并"，交猜想的否定式管"$J$ 的划分加两个闭包"。两者之间的桥梁完全外包给 BC（01:119-125），tex 内部没有自证；这是论文的引用承重墙之一，Lean 用 `IntersectionReduction.lean` 自建（第 10 节第 1 条）。
- 可数性在这里第二次被消费：第一次是支撑划分与 Joo 问题前提，第二次就是 01:128-129 那句。若把射线换成不可数指标集，交猜想的无限制版本照样被反证，但 Joo 问句的"countable ground set"前提会掉，负答案就不落在那个问题上。

**(d) [推测] 候选失败路线**。其一，若 BC Prop 3.6 只在有限 ground set 上陈述，整条归约作废，Corollary 1.2 就得在无穷情形自证；我核到的是 01:119-120 明确写 "for any matroids $M,N$ on the same ground set"，但 tex 没有复述该命题的证明义务，风险留在文献层。其二，若 Joo 的 uniform 定义与 05-assembly.tex:326-327 的性质不等价（01:84-86 的等价句是引 Joo Prop 2.2 得来的），$M_i$ 就不再 partitional，Question 1.5 的负答案失去资格，而"无交"本身仍然真。其三，若试图绕过 Prop 3.6、从"无独立覆盖"直接推"不满足交"，中间缺的是把 $J_i$ 的闭包条件翻成独立性的那一步；对照 02-matroids.tex:55-57 的 Lemma 2.1(3)，需要的正是补集式对偶，而 $J_0\dot\cup J_1=J$ 未必覆盖 $E$，翻面后得到的是 $E\setminus\operatorname{cl}_{M_0}(J_0)$ 型集合的独立性，与主定理的 $I_0\cup I_1\ne E$ 形式不吻合。我最初以为两者只差一句对偶，实际差一个"$J=E$"的假设。

## 17. 四段式四：两个分离猜想的普遍否定（07:4-47）

**(a) 逐字文本**。记号 07-consequences.tex:5-7："For a set-indexed family $\mathcal M=(M_i:i\in\Theta)$ on $E$, write $\mathcal M\!\upharpoonright Y=(M_i\!\upharpoonright Y:i\in\Theta)$ and $\mathcal M.Y=(M_i.Y:i\in\Theta)$." Covering Conjecture 07:9-18（eq:covering-conjecture）逐字为：左端 "$\mathcal M$ has a covering"，右端 "for every $Y\subseteq E$, $[\mathcal M\!\upharpoonright Y$ has a packing $\Longrightarrow \mathcal M\!\upharpoonright Y$ has a covering$]$". Packing Conjecture 07:20-29（eq:packing-conjecture）把两处对调：左端 "$\mathcal M$ has a packing"，右端 "for every $Y\subseteq E$, $[\mathcal M.Y$ has a covering $\Longrightarrow \mathcal M.Y$ has a packing$]$". 出处 07:30："These are the conjectures of~\cite[Conjectures~5.2 and~6.3]{BowlerCarmesin2015}." 陈述 07:32-35："The unrestricted separate Covering and Packing Conjectures of Bowler and Carmesin are both false in ZFC." 证明 07:37-47："Bowler and Carmesin's universal equivalences identify intersection for every pair, packing/covering for every pair, packing/covering for every set-indexed family, \eqref{eq:covering-conjecture} for every set-indexed family, and \eqref{eq:packing-conjecture} for every set-indexed family \cite[Section~7]{BowlerCarmesin2015}. Theorem~\ref{thm:main} falsifies the pairwise packing/covering assertion, so both separate universal conjectures are false. These last two failures are consequences of equivalence between universal statements; this argument does not identify their witnessing families with the pair $(M_0,M_1)$."

**(b) 中间步骤**。

- 链条上的五项被 07:38-42 逐字列出：交∀对、p/c∀对、p/c∀族、(7.1)∀族、(7.2)∀族。它们是同一普遍陈述的五个等价写法，所以任一假则全假；Thm 1.1 打的是第二项。
- 第二项假 ⟹ 第四项假、第五项假，用到"∀族"包含"∀对"（$\Theta=\{0,1\}$ 是集合）与链条的双向等价两处。
- (7.1) 的左端对 $(M_0,M_1)$ 恰是主定理否证的"$I_0\cup I_1=E$"（07:11 的 "has a covering" 与 01:36-39 的 $I_0\cup I_1\ne E$ 是同一句的两个方向），但 (7.1) 断的是等价式，所以单凭 $(M_0,M_1)$ 无法见证等价式失效：要见证失效，还得使右端的局部条件成立，而这一步论文没有单独核验，只能靠 07:38-42 的链条转递。07:42-46 的两句正是对此的免责声明。
- 记号核对：$\mathcal M.Y$ 用的是收缩 $M.Y=M/(E\setminus Y)=(M^*\!\upharpoonright Y)^*$（01-introduction.tex:14-16 与 02-matroids.tex:40-41 两处同式），与 $\mathcal M\!\upharpoonright Y$ 的限制构成对偶的一对；两个猜想的不对称（一个测限制、一个测收缩）就是这个对偶的体现。

**(c) 机械理由**。

- 为什么一个二元素反例足以否定"unrestricted"的分离猜想：三项 ∀ 陈述彼此等价，反例只需在其中一项上失败即可全局生效；这是把第 0 节"战略压缩"贯彻到最末的一环，代价是 witness 的定位丢失。
- 为什么 07:33-34 要重复 "in ZFC"：Thm 1.1 是 ZFC 陈述（01:33），BC 的等价链条本身在 BDKPW 公理体系内证明且不需额外公设（[推测]，论文没有对引用的 Section 7 做公理论述，此点应算外部依赖的敞口），所以转递之后结论仍留在 ZFC 里。Lean 侧对应 `SeparateCounterexamples.lean`，但 comparator 的 `theorem_names` 里只有 `main` 一项（见第 22 节），分离猜想的推论没有被 challenge 单独背书。
- 为什么 $\Theta$ 必须写作集合（07:4 "set-indexed"）：若允许真类族，"packing/covering 对每族成立"与"对每对成立"之间的等价可能因为量词域不同而断裂；论文全程用 $\Theta$ 为集合，与 02-matroids.tex:86 的 $N_0,N_1$ 二元素情形相容。
- 可数性在本节没有被消费：$E$ 可数只对 Joo 的问句（01:128-129）是前提，对 (7.1)(7.2) 的否定不需要。

**(d) [推测] 候选失败路线**。其一，若 BC 的 Section 7 链条在 BDKPW 体系外的某个无穷拟阵公理版本里不成立（例如只对 set-finite 族成立），推论 7.1 就退回"未知"；论文对此完全外包，属于文献层敞口。其二，若有人想把 $(M_0,M_1)$ 直接当 (7.1) 的见证族，需要额外验证右端"对每个 $Y\subseteq E$，限制族有 packing 则有 covering"，而 $Y=e_{n-1}\cup e_n$ 这类分量支撑上的限制族退化成一个 $Q$ 加一个平凡拟阵，其 packing 存在性未审；论文绕开了这个坑，我不打算替它补。其三，若把 (7.2) 的 $\mathcal M.Y$ 误读成限制，两个猜想的字面不对称（07:14 与 07:25）会消失，等价链条的对应关系也就错位；这一点靠 07:5-7 的记号句钉住。

## 18. 四段式五：$\mathcal J_0$ 的双片平均与 $\mathcal K$-正模式（03:37-51、03:86-91）

**(a) 逐字文本**。03-filters.tex:37-41："Let $L$ and $R$ be labelled copies of $D$, and write $E_0=L\mathbin{\dot\cup}R$. For $X\subseteq E_0$, its two slices, viewed as subsets of $D$, are denoted by $X_L$ and $X_R$. When writing lifts, we identify $E_0$ with $D\times\{L,R\}$. Write $W_m$ for the union of the two copies of $D_m$." 03:42-48："The ideal $\mathcal J_0$ on $E_0$ consists of the sets whose two slices belong to $\mathcal J$. Equivalently, $X\in\mathcal J_0\Longleftrightarrow |X\cap W_m|/|W_m|\longrightarrow0$." 03:49-51："This equivalence follows because the doubled-block density is the average of the two nonnegative slice densities. Complements are always taken in the relevant ground set, $D$ or $E_0$." 关于 $\mathcal K$ 的下半段 03:86-91："We will repeatedly use the following consequence. A consistent finite pattern prescribing positive membership in $A$-columns and arbitrary signs in $G$-columns is $\mathcal K$-positive. Intersecting such a pattern with any further finitely many positive $A$-columns still gives a pattern with a fixed positive eventual density, so \eqref{eq:larger-ideal} excludes membership in $\mathcal K$." 03:93-98 给出 $\subseteq_{\mathcal K}$、$\mathcal K_0$ 与"$\mathcal K_0$ 保序数秩 / $\mathcal J_0$-正差保不可比"的分工句。

**(b) 中间步骤**。

- $|W_m|=2w_m$，且 $X\cap W_m=(X_L\cap D_m)\,\dot\cup\,(X_R\cap D_m)$，故 $\lvert X\cap W_m\rvert/\lvert W_m\rvert=\tfrac12(\lvert X_L\cap D_m\rvert/w_m+\lvert X_R\cap D_m\rvert/w_m)$，即两片密度的算术平均。
- 两个非负数列的平均趋零 ⟺ 各自趋零：平均 $\to0$ 时每项 $\le$ 两倍平均 $\to0$；反向由极限线性。于是 03:42-43 的"两片都属于 $\mathcal J$"与 03:44-48 的"整密度趋零"逐字等价，这正是 03:49-50 那句话的全部内容。
- 平均刻画对第 4 节的可复用性：$H_{t,k}$ 在 $L,R$ 两片上重复同一个 $D$-模式（03:222-225 的 $\times\{L,R\}$），所以其在 $W_m$ 中的比例与在 $D_m$ 中相同，03:255 的 "Duplicating the cells on the two copies does not change these proportions" 就是这条的直白陈述；因此 $(3/4)^q$ 的计算可以在 $D$ 上做、在 $E_0$ 上用。
- $\mathcal K$-正模式：设模式固定 $s$ 个 $A$-列取正号、$q$ 个 $G$-列取任意号，由列引理（03:56-58）其在 $D_m$ 上的比例最终恰 $2^{-(s+q)}$；再交 $s'$ 个正 $A$-列后比例最终恰 $2^{-(s+s'+q)}$，两者都不趋零。按 03:73-77 的定义，$X\in\mathcal K$ 要求存在某有限 $F$ 使 $X\cap\bigcap_{t\in F}A_t\in\mathcal J$；现在对每个有限 $F$（把 $s'$ 取成 $|F|$）该交集密度都不趋零，故 $X\notin\mathcal K$，即 $\mathcal K$-正。这就是 03:90-91 "so \eqref{eq:larger-ideal} excludes membership in $\mathcal K$" 的展开。
- 反向依赖：ultrafilter 的 FIP 论证（03:128-138）里模式 $P$ 的 $\mathcal K$-正性恰好是这条的一个实例，其中 $G$ 侧同时出现正号与负号；若 $\mathcal K$ 的生成元含 $G_t^c$，模式里 $G$ 的负号就把 $P$ 拉进 $\mathcal K$，FIP 直接失效。

**(c) 机械理由**。

- 为什么 $\mathcal J_0$ 必须是"两片同时密度零"（03:42-43）：单片版本连理想都不是。取 $X$ 的 $L$-片密度零、$R$-片满；取 $Y$ 的 $L$-片满、$R$-片密度零；两者都满足"某片零"，$X\cup Y$ 两片都满，对并封闭失败。理想性质是 03:33-35 那句定义（对子集与有限并封闭）的直接要求，而 $\mathcal C(T)$、$\mathcal K$、$\subseteq_{\mathcal K}$ 全都建立在理想性上。
- 为什么 $\mathcal J_0\subseteq\mathcal K_0$ 是接口（03:95）：第 4 节用 $\mathcal J_0$ 定义类 $\mathcal C(T)$，第 3 节用 $\mathcal K$ 定义秩并声明秩对 $\mathcal K$-对称差不变（03:158-163）；插入原型时对端点做的改动属于 $\mathcal K_0$ 但要求 $\mathcal J_0$-正（03:226-227 加 03:96-98），于是同一次改动必须"在秩的眼里为 0"且"在不可比性的眼里为正"。这两个理想缺一不可，一个理想做不成两件事（第 2 节末句在此得到逐行支撑）。
- 空交约定（03:78 "where an empty intersection is $D$"）看似琐碎，实际是 $\mathcal J\subseteq\mathcal K$（03:82）的唯一来源：取 $F=\varnothing$ 时条件退化为 $X\in\mathcal J$；没有这条约定，$\mathcal J_0$-小的改动就不再自动 $\mathcal K_0$-小，类身份与秩不变性脱钩，Lemma 5.3 的"$A'$ 与 $A$ 同 zone"这一步（05-assembly.tex:131 一带的保留间隙论证）会断。
- 可数性在这两段的用处：$W_m$ 有限（$2w_m$）才使密度是普通比例；$D=\coprod_mD_m$ 可数并使块序号趋于无穷才使"沿块取极限"有意义。若 ground set 不可数，密度极限的语言整体要换成测度或理想基，本文的探针 $d_m^T$（04:24）就没有定义。

**(d) [推测] 候选失败路线**。其一，若把 $\mathcal K$ 的生成元换成 $B_t^c$（第 4 列，并非第 1 列），$H_{t,0}=A_t^c\cap B_t^c$ 不再被单个生成元控制，03:226-227 的 $\mathcal K_0$-小性失效，双重保留随之失效。其二，若把 $G_t^c$ 也写进 $\mathcal K$ 的生成元，03:88 的 "arbitrary signs in $G$-columns" 变成"只许正号"，而 03:117-118 要求所有 $G_t$ 属于滤子，03:129 的 $P$ 无法同时满足两边，FIP（03:119）断链。其三，若 $\mathcal J_0$ 定义为两片之一的密度零，除理想性外还有一处硬崩：03:49-50 的平均等价不再成立，第 4 节 Prop 4.6 假设的"$T\setminus I\in\mathcal J_0$"与 05 节 (5.5) 的差形式不再逐字同义，递归与局部三择一之间的接口断开。

## 19. 我走过的错路（第二批）

第 2 节到第 10 节散落的 [推测] 记的是构造层面的岔路，这里集中记我读这篇论文时自己判断错过的六处，每处给出反证文本的落点或必然失效的理由。

1. 我以为自对偶对的主定理可以直接以"无独立覆盖"收尾，省掉归约引理。反证文本两处：02-matroids.tex:5-6 "This reduction is essential: a mixed packing/covering partition need not be a packing or a covering on the whole set."；01-introduction.tex:45-46 "The last conclusion needs a separate argument: failure of a covering of $E$ alone does not rule out a mixed partition."。两句都在，论文比我谨慎。
2. 我以为 $\mathcal J_0$ 只要"某一片密度零"就够，双片同时是多余的讲究。失效理由见 18(c)：那样连理想都不成立，03:33-35 的定义句、$\mathcal C(T)$、$\subseteq_{\mathcal K}$ 三处同时塌；而且 03:49-50 专门为此写了一句平均论证，作者显然想过同一个问题。
3. 我以为序数秩可以取"$X$ 在枚举里第一次出现的位置"，即 $F_\xi=X$ 的最小 $\xi$。反证落点在 03-filters.tex:152-153：论文写的是 $F_\xi\subseteq_{\mathcal K}X$。若取相等，03-filters.tex:158-163 的 $\mathcal K$-对称差不变性立刻崩（对称差会改变集合身份，候选指标集随之改变），而第 5 节的整个"改动保秩"就没了依据；枚举"允许重复"（03-filters.tex:149）也是为 $\subseteq_{\mathcal K}$ 服务的。
4. 我以为 $\mathcal K$ 作为"$\mathcal J$ 加一批列补"的理想，生成元应该把 $G_t^c$ 一起收进来才对称。反证文本 03-filters.tex:75-77 只写 $A_t$，且 03:86-91 明确把 "$G$-columns 取任意号"列为可用的关键后果；收了 $G_t^c$ 之后 03:129 的 $P$ 不再 $\mathcal K$-正，ultrafilter 的 FIP（03:119）当场失效。对称性在这里是错觉，两个生成元各干一件活。
5. 我以为插值引理里的 $\ell(I)=-\infty,\ell(Y)=+\infty$ 情形可以一次 Zorn 或"离散 IVT"解决。反证文本两处：04-local-bases.tex:229-236 的停时论证，04-local-bases.tex:251-253 "There is a first stage $j_0$ that makes deletions. Otherwise the unchanged set $Y$ would have a nonpositive probe in every tail, contrary to $\ell(Y)=+\infty$."。若真有一步到位的极大元，这两段都属多余；作者写它们，说明链上界（$\bigcap_jX_j$）的下极限控制必须靠几何预算逐段挣出来（04:257-258），与第 6 节末的 [推测] 互相印证。
6. 我按 Lean 的做法（直和走 `Matroid.sum'`，自证 0 行）判断 06:20-41 是"可删的工程话"，在草稿里略过它。错误在于 15(b) 的第四跳完全依赖 06:26-29 那句"极大独立集恰为各分量基之并"：防分解论证要说"每个 $M_i$ 的基都含 $F$"，其唯一依据就是这句直和基描述。Lean 省略它是因为 Mathlib 的 `sum'` 定理自带基刻画，纸面省略则整段推论悬空。同一段文本在两种载体上的义务不同，这是我这次读下来最大的方法论收获。

## 20. 缺口清单（诚实版）

这篇论文在若干处只给构造或引用，我把核到的与没核到的分开记，不替它补圆。

- 交归约（01:119-125）与五链等价（07:38-42）都整段外包 Bowler--Carmesin 2015，tex 内无自证；论文对这两处引用的公理依赖也没有讨论。这是全篇最硬的文献承重墙。Lean 用 `Waves.lean`（118 行）、`CoveringReduction.lean`、`PairDuality.lean`、`IntersectionReduction.lean` 自建，把墙换成自己的地基，第 10 节第 1 条已记；此处补充：正因为 Lean 自建，形式化一侧对"引用是否可接受"其实给出了否定回答。
- 03-filters.tex:149 的 "allowing repetitions if needed" 缺一句基数论证（大集族基数 $\le 2^{\aleph_0}=\mathfrak c$，故存在从 $\mathfrak c$ 到其上的满射）。逻辑上无碍，我按外部常识补住，标 [外部推断]。
- 06-counterexample.tex:27-29 的"nonmaximal component permits an extension of the union"没写新增元素落在哪个分量；15(b) 已补，原文确实省略。
- 06:106-107 的 cofinitary 分支压成一句 "Dualizing the direct-sum basis description gives the same contradiction"，中间有三次身份切换（$N\to N^*$、基刻画的对偶、$F$ 与基不相交），15(b) 末条补全。
- 05-assembly.tex:307-309 有限 gap 分支只给"取含 gap 元素最多的独立扩张"，没写它为何在 $Y$ 内极大（要补一句：$Y$ 内可加的元素只可能来自 gap）。
- 06:16 的 antitone 句没有回指标号；对照 03-filters.tex:161-162 可确认是 Lemma 3.3 后半。这类"引用靠读者找位置"的小摩擦在第 6 节较多。
- 论文没有讨论反例是否 graph-like、是否有表示矩阵、是否与 BC 猜想在 graph-like 类上的正面结果冲突。我按第 7 节与 01-introduction.tex:27-30 的字面陈述核过：无冲突，因为本文对象是抽象 BDKPW 拟阵；这个问题论文未置一词，属 [外部推断] 的追问。
- 01-introduction.tex:67-69 声称借用了 Bowler--Geschke 的 Lemma 12 的 "complementary interval-recursion pattern"，正文没有逐点对应；我的判断（[外部推断]）是指向 05-assembly.tex:167 起的 basis-family 递归，但论文没有写这一句，不能当作已知。
- 派单术语核对："double ray" 在 06:1 与 06:91（figure label）出现；"bundle" 在 06:44 与 01:168 出现；"self-dual" 在 02:43、06:77 等处出现，约定句在 02:42-43；"mixed partition" 在 01:46、02:5 出现；"independent covering" 在 06:17、06:149 出现；"descending ranks" 是 06:109 的小节标题。派单里的"同标号"对应 "on the same labelled ground set"（01:34、01:126）与 "on the same labels"（06:64、06:78）。一个细节：02:43 与 06:49 写作 labeled，01:34、01:126、06:77 写作 labelled，两种拼法并存，说明分片是分别成稿的。
- 未核到的位置我一律不写行号。第 3 节 reservations 的"族情形"（多个 bad 集取并）落在 03-filters.tex:259 之后，本轮我没有逐行读完那半页，因此第 21 节台账里只登记了单元情形（03:242-259）与陈述（03:229-238），族情形标为"未逐行核对"。

## 21. 逐字台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\mathfrak c=2^{\aleph_0}$ 兼作初始序数 | 枚举 $(F_\xi)$ 的长度 $\mathfrak c$ | 03-filters.tex:14 与 03-filters.tex:149 | $\rho$ 值域、thinning、长 $\mathfrak c$ 递归 | 03-filters.tex:209-213 的 $\max(\lambda,\aleph_0)<\mathfrak c$ 逐点估计失去意义 |
| $D_m$、$w_m$ | $w_m=\lvert D_m\rvert=2^{2^m}$ | 03-filters.tex:17-18 | 密度理想 $\mathcal J$、列引理 | 03-filters.tex:68 的 $2^{2^m-r}$ 计数改写不成 |
| 块增长不等式 (3.1) | $w_m\ge2\sum_{j<m}w_j$（$m\ge1$） | 03-filters.tex:22-23 | 单元素扰动界 04-local-bases.tex:58-60 | 探针的 Lipschitz 失效，插值停时随之失效 |
| 归纳过渡式 | $2\sum_{j<m+1}w_j\le3w_m\le w_m^2$，需 $w_m\ge4$ | 03-filters.tex:25-26 | (3.1) 本身 | 03-filters.tex:25 的基例 $m=1$ 之后归纳断链 |
| $\mathcal J$ 密度零 | $\lvert X\cap D_m\rvert/w_m\to0$ | 03-filters.tex:29-31 | 类 $\mathcal C(T)$、$d_m^T$ | 04-local-bases.tex:53 的 $d_m^T(X)\to0$ |
| $\mathcal J_0$ 双片刻画 | 两片密度算术平均 $\to0$ ⟺ 各自 $\to0$ | 03-filters.tex:44-48（平均句 03-filters.tex:49-50） | Prop 4.6 的假设形式、(5.5) 接口 | 03-filters.tex:96-98 的理想分工句失去依据 |
| 三族列 | $A_t,B_t,G_t$（$t<\mathfrak c$，$3\mathfrak c=\mathfrak c$） | 03-filters.tex:54-55 与 03-filters.tex:62-63 | $\mathcal K$、细胞 $H_{t,k}$ | 03-filters.tex:129 的模式 $P$ 无法同时避开 $q$ 个 $Z_j$ |
| 模式精确密度 | 充分晚块中恰 $2^{-r}$ | 03-filters.tex:56-58 | $\mathcal K$ 真性、$(3/4)^q$ | 03-filters.tex:83-84 与 03-filters.tex:253-254 同崩 |
| 列成员判据 | $(m,f)$ 在列内 ⟺ $f(h\upharpoonright m)=1$ | 03-filters.tex:64-65 | 前缀两两不同 | 03-filters.tex:66 的 prefixes distinct 失去编码依据 |
| 余量计数 | $D_m$ 内剩 $2^{2^m-r}$ 个函数 | 03-filters.tex:68 | 精确 $2^{-r}$ | 03-filters.tex:69 的结论降为正密度 |
| $\mathcal K$ 定义式 | $X\cap\bigcap_{t\in F}A_t\in\mathcal J$ 对某有限 $F$ | 03-filters.tex:73-77 | 秩不变性、$H_{t,k}\in\mathcal K_0$ | 03-filters.tex:158-163 的 $\rho$ 不变性 |
| 空交约定 | $\bigcap_{t\in\varnothing}A_t=D$ | 03-filters.tex:78 | $\mathcal J\subseteq\mathcal K$（03-filters.tex:82） | 04 节的 $\mathcal J_0$-改动不再被 $\mathcal K_0$ 吸收 |
| $\mathcal K$-正模式推论 | $A$ 全正号、$G$ 任意号者 $\mathcal K$-正 | 03-filters.tex:86-91 | ultrafilter 的 FIP | 03-filters.tex:131 的 is $\mathcal K$-positive |
| (3.3) 有限性 | $\{t:X\subseteq_{\mathcal K}G_t\}$ 有限 | 03-filters.tex:108-112 | thinning 的指标计数 | 03-filters.tex:193-194 的并集不再 $<\mathfrak c$ |
| forbidden 定义 | 模 $\mathcal K$ 含于无穷多 $G_t$ | 03-filters.tex:116-117 | 见证指标 $t_j$ 的可选性 | 03-filters.tex:124-127 的 $t_j$ 取不齐 |
| 模式 $P$ 构造式 | $P=\bigcap_{t\in F}G_t\cap\bigcap_{j\le q}G_{t_j}^c$ | 03-filters.tex:128-130 | FIP 的非空性 | 03-filters.tex:134-138 的 $\mathcal K$-正性论证 |
| ultrafilter 引理的使用 | 由真滤子扩为 ultrafilter | 03-filters.tex:139-140 | 全文的二分性 | 06-counterexample.tex:118-119 的中心二选一 |
| $\rho$ 定义式 | $\min\{\xi<\mathfrak c:F_\xi\subseteq_{\mathcal K}X\}$ | 03-filters.tex:151-154 | admissibility 的严格号 | 05-assembly.tex:276-282 无从取值 |
| thinning 输出 | $u=s\cup(X\cap G_t)$ 且 $\rho(u)>\gamma$ | 03-filters.tex:183-185 与 03-filters.tex:196-198 | Lemma 5.2 的两支 | 05-assembly.tex:76（lem:zone-crossing 所在行） |
| 正则性免除 | 每个固定 $\gamma<\mathfrak c$ 逐点估计 | 03-filters.tex:209-213 | 递归每阶段的 $<\mathfrak c$ 要求族 | 05-assembly.tex:167（prop:basis-family 所在行） |
| 保留细胞 | $H_{t,0},H_{t,1}$ 不交且 $\mathcal K_0$-小 | 03-filters.tex:222-227 | 双重保留与双向正差 | 05-assembly.tex:102（lem:insert-prototype 所在行） |
| $\epsilon$ 见证 | 无穷多块上比例 $\ge\epsilon$ | 03-filters.tex:242-244 | 沿子列取极限 | 03-filters.tex:256-259 的极限不等式无处可取 |
| $(3/4)^q$ | 避开 $q$ 个细胞之比例为 $3^q/4^q$ | 03-filters.tex:251-254 与 03-filters.tex:258-259 | bad 指标有限 | 03-filters.tex:246 的 only finitely many bad |
| $c_n$ 与 $V_n$ | $V_n=\bigcup_{m<n}W_m$，$c_n=\lvert V_n\rvert$ | 04-local-bases.tex:22 | 前缀与尾部的配比 | 04-local-bases.tex:53 的 $p_n^T(X)/c_n\to0$ |
| 探针 $f_n^T$ | $p_n^T+c_n(\sup_{m\ge n}d_m^T+\inf_{m\ge n}d_m^T)$ | 04-local-bases.tex:25-27 | 两条规则、补对称、Lipschitz | 04-local-bases.tex:61-62 与 06-counterexample.tex:138-139 |
| 阈值区间 | $-1<\ell\le0$ 与 $0\le h<1$ | 04-local-bases.tex:40-42 | 反链、整数化舍入 | 04-local-bases.tex:124（lem:local-antichain 所在行） |
| spike 截止式 | $\lvert p_n\rvert/c_n+2a_n+1/\sqrt{c_n}\le2^{-j}$ | 04-local-bases.tex:166-168 | 发散下界 | 04-local-bases.tex:184-188 的三段放缩 |
| 尖峰参数 | $b_j=2^{1-j}<\delta$、$m_j\ge N_{j+1}$、$1/\lvert W_{m_j}\rvert\le\delta-b_j$ | 04-local-bases.tex:171-174 | $P\in\mathcal J_0$ 与尾部可见性 | 04-local-bases.tex:177-178 的密度趋零 |
| 取整可行性 | $\lceil b_j\lvert W_{m_j}\rvert\rceil\le\delta\lvert W_{m_j}\rvert$ | 04-local-bases.tex:175-176 | 恰好选出 $\lceil\cdot\rceil$ 个 | 04-local-bases.tex:176 的 Rounding is possible |
| 阶段损失式 | $2c_j\sup_{m\ge M_j}\lvert(Y\setminus I)\cap W_m\rvert/\lvert W_m\rvert<2^{-j}$ | 04-local-bases.tex:220-222 | $n<j$ 段的预算控制 | 04-local-bases.tex:242-243 的整段损失估计 |
| 重置下界 | $f_n(X_j)\ge-1$（$n\ge j$） | 04-local-bases.tex:237-238 | 极限点的下界 | 04-local-bases.tex:253-256 的逐段恢复 |
| 几何预算和 | $-1-\sum_{j>n}2^{-j}=-1-2^{-n}$ | 04-local-bases.tex:257-258 | $X_\infty$ 留在 $\mathcal C(T)$ 内 | 04-local-bases.tex:245-249 的极限身份 |
| (6.1) 严格不等式 | $\rho(B_L)>\rho(D\setminus B_R)$ | 05-assembly.tex:276-282 与 06-counterexample.tex:9-15 | 降秩链条每步唯一的严格号 | 06-counterexample.tex:141-144 退化为常值 |
| (5.4) 三分支 | $B\subseteq I$、$I\subseteq B\subseteq Y$、$Y\subseteq B$ | 05-assembly.tex:162（eq:interval-alternative 所在行）与 05-assembly.tex:310-316 | (IM) 的无穷 gap 支 | 05-assembly.tex:317 的"四公理皆备" |
| 统一标签映射 | $(n,d)\mapsto d$ 在所有捆绑上相同 | 06-counterexample.tex:49 | 补等式 $x_{k+1}=D\setminus z_k$ | 06-counterexample.tex:124-127 |
| 方向表 | $n\le-1$ 时 $L=e_n,R=e_{n-1}$；$n\ge0$ 时 $L=e_{n-1},R=e_n$ | 06-counterexample.tex:57-61 | 永远向外的传播 | 06-counterexample.tex:120 的 move outward forever |
| 奇偶分解 | $M_0=\bigoplus_{n\in2\mathbb Z}Q_n$、$M_1=\bigoplus_{n\in2\mathbb Z+1}Q_n$ | 06-counterexample.tex:70-72 | 支撑两两不交且并为 $E$ | 06-counterexample.tex:74-76 |
| 序数下降链 | $\rho(x_k)\ge\rho(u_k)>\rho(y_k)\ge\rho(x_{k+1})$，长度 $\omega$ | 06-counterexample.tex:141-144 | 主定理的无覆盖结论 | 06-counterexample.tex:149-153 |
| 无非空 finitary 直和项 | 每个基含 $F$ 与每个基之补含 $F$ 并存 | 06-counterexample.tex:101-107 | 01-introduction.tex:148-150 的越界声明 | Joo 的混合直和正面定理重新吞掉反例 |
| 五环等价链 | 交∀对、p/c∀对、p/c∀族、(7.1)∀族、(7.2)∀族 | 07-consequences.tex:38-42 | Corollary 7.1（07-consequences.tex:32-35） | 07-consequences.tex:42-43 |

依赖链（正向读一遍，反向即断点表）：$D=\coprod_mD_m$ 的可数枚举与 $w_m=2^{2^m}$（03-filters.tex:17-23）⟹ 大集族按 $\mathfrak c$ 长枚举、序数秩 $\rho$ 取值 $\xi<\mathfrak c$（03-filters.tex:149-154）⟹ thinning 能把 $\rho$ 抬过任意 $\gamma$（03-filters.tex:183-198），与双重保留给出的 $\mathcal K_0$-小细胞（03-filters.tex:222-259）合流 ⟹ 局部拟阵 $Q$ 的基同时满足不可比性（探针阈值，04-local-bases.tex:25-42）与 admissibility 的严格秩不等式（05-assembly.tex:276-282）⟹ 把 $Q$ 按统一标签摆上双射线（06-counterexample.tex:49、57-61）并按奇偶合成 $M_0,M_1$（06:70-76）⟹ $Q=Q^*$ 沿直和升为 $M_i=M_i^*$ on the same labels（06:77-78，靠 06:39-41）⟹ 任给两独立集 $J_0,J_1$，划分后沿射线接力降秩（06:111-144），$\omega$ 步严格下降不可能（06:145-147）⟹ $I_0\cup I_1\ne E$（01-introduction.tex:36-39）⟹ Lemma 2.2 升级为无 packing/covering 划分（02-matroids.tex:85-115）⟹ 经 BC Prop 3.6 与五链等价取到交猜想与两个分离猜想的否定（01:119-128、07:38-43）。链上任一环换成较弱的量值（$\mathbb N$-值秩、单片密度零、$\ge$ 号 admissibility、不同标号的对偶）都会在最后一列指出的那一步失去依据。

## 22. Lean 二次取证（行号与清单）

书目登记在 `lean\formalization.yaml:67`（title 为 "A Counterexample to the Infinite Matroid Packing/Covering Conjecture"）、`:68`（authors 为 OpenAI）、`:69`（id 指向 `../preprints/...September-24-2026/paper.pdf`，type 为 article）；形式化登记在同文件 `:1246`（comparator_config 为 `ComparatorChallenges/InfiniteMatroid.json`）、`:1247`（declaration 为 `OAI.InfiniteMatroidCounterexample.main`）、`:1248`（file 为 `OAI/Combinatorics/InfiniteMatroid/Main.lean`）。三件套齐备，被 comparator 核验的声明仍只有 `main` 一条。

`ComparatorChallenges\InfiniteMatroid.json` 的六个字段逐一记录：`challenge_module` 为 `ComparatorChallenges.InfiniteMatroid`，`solution_module` 为 `OAI.Combinatorics.InfiniteMatroid.Main`，`theorem_names` 为 `[OAI.InfiniteMatroidCounterexample.main]`，`definition_names` 为空（`[]`，即没有要求任何定义级对齐），`permitted_axioms` 为 `[propext, Quot.sound, Classical.choice]`，`enable_nanoda` 为 `false`。与第 10 节记的"恰三大标准公理"一致，并新记两点：定义名单为空、nanoda 未开。

模块目录 `lean\OAI\Combinatorics\InfiniteMatroid\` 共 34 个 `.lean`、4477 行，本轮点到的几个文件行数：`SparsePerturbation.lean` 200、`TransfiniteConstruction.lean` 179、`Zones.lean` 204、`Waves.lean` 118。全清单（按 tex 归位）：tex 第 2 节对 `Matroid.lean`、`BasisExtension.lean`、`PackingCovering.lean`；第 3 节对 `Basic.lean`、`Cardinality.lean`、`Columns.lean`、`DensityIdeal.lean`、`Ideals.lean`、`OrdinalRank.lean`、`Reservations.lean`；第 4 节对 `BlockDensity.lean`、`Cesaro.lean`、`LocalBases.lean`、`ProbeLimits.lean`、`Interpolation.lean`、`SparsePerturbation.lean`、`Separation.lean`；第 5 节对 `Prototype.lean`、`PrototypeExtension.lean`、`Zones.lean`、`TransfiniteConstruction.lean`、`FiniteCounting.lean`；第 6 节对 `DoubleRay.lean`、`RankDescent.lean`、`Main.lean`；第 7 节对 `Waves.lean`、`CoveringReduction.lean`、`PairDuality.lean`、`IntersectionReduction.lean`、`SeparateCounterexamples.lean`、`Corollaries.lean`、`CorollaryModel.lean`、`Partitional.lean`。`CorollaryModel.lean` 与第 20 节的敞口对应：推论层的陈述被抽象成模型接口，并非逐条从 tex 复述，这解释了 comparator 为何只签 `main`。
