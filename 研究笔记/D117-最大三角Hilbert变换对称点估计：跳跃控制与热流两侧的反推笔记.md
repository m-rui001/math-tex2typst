# D117 最大三角Hilbert变换对称点估计：跳跃控制与热流两侧的反推笔记

素材：`E:\math\preprints\The-maximal-triangular-Hilbert-transform-at-the-symmetric-point-September-24-2026\build\`，`main.tex` + `sections/` 八片。机器侧：`E:\math\lean\OAI\Analysis\TriangularHilbert\`，顶层 10,861 行。本文所有 tex 行号都来自我逐片读入时的行号显示，关键几行另用 `sed -n 'Np'` 复核。

## 0 我带着什么猜想打开这篇稿子

我最初的动机很朴素：队列里这篇的题名把两个最难伺候的词放在了一起，maximal 与 symmetric point。三角 Hilbert 变换本身是个三输入纠缠形式，已知最好的结论带尺度依赖；`introduction.tex:72` 逐字写着 "Durcik, Kova\v{c} and Thiele proved power-type cancellation with hard truncations~\cite[Theorem~1]{DurcikKovacThiele2019}; at the symmetric"，接着 `introduction.tex:74` 是 "tuple the bound grows like $\sqrt{\log(R/\varepsilon)}$, by permutation and interpolation of their $(4,4,2)$ estimates."。所以我要判断的第一件事是：把 $\sqrt{\log(R/\varepsilon)}$ 换成绝对常数，代价会落在哪一层结构上。

`introduction.tex:46` 给出对称点的定义："of the scalar H\"older relation $1/p_0+1/p_1+1/p_2=1$."，即三个指数都取 3，输出落在 $L^{3/2}$。我最初的猜想链条有两条，事后看都偏了。

第一条 [推测]：我以为极大化会靠 $\{B_{\varepsilon,R}\}_{\varepsilon,R}$ 这个算子族的向量值极大不等式来解决，也就是先把每个截断当成一个取值映射 $t\mapsto B_{\varepsilon,R}(F,G)(x,y)$，再用平方函数或 $\gamma$-范数去吃掉上确界。理由是我读到的历史线里，`introduction.tex:69` 写着 "Kova\v{c}, Thiele and Zorin-Kranich proved estimates for a Walsh model"，而 `consequences.tex:25` 那种 "$\le 2\log(R/\varepsilon)\|F\|_3\|G\|_3$" 的对数恰是截断族在弱型端点的典型损失。

第二条 [推测]：我以为即便要用能量方法，方差也得固定成同一个数，因为热流 telescoping 的标准用法（`heat.tex:10` 逐字："Continuous Gaussian telescoping for entangled forms appears in Durcik~\cite[Lemma~3 and Section~3]{Durcik2015}."）是一条整体单调下降的曲线，而端点选择是逐点自由的，两者看起来互相拆台。

我真正想知道的是这篇稿子的思维链在哪里断裂过：极大化引入的自由度（每个输出位置自选 $\varepsilon_{ij},\rho_{ij}$）与能量单调性之间的冲突，作者是怎么把它转成一条可加的量。读完八片之后我的回答是：它被转成了跳跃，`jumps.tex:6` 逐字："increase in energy when entries switch on or off.  We will in fact bound"，而 `jumps.tex:7` 是 "the sum of the absolute energy jumps.  The estimate depends on the"，`jumps.tex:8` 收尾于 "original arrays alone, because every entry switches at most twice."。这一句是整个稿子的枢纽，我在第 9 节专门写它。

本笔注叙事对应的论文目录为 preprints/The-maximal-triangular-Hilbert-transform-at-the-symmetric-point-September-24-2026，在 .tools/lean_queue.txt 队列第 143 行号（按题名逐字匹配登记，本行只补登记、不改前文）。

## 1 取证边界与我拒绝做的事

我按字节降序读了 `sections/jumps.tex` 14,824、`sections/heat.tex` 14,746、`sections/maximal.tex` 14,483、`sections/consequences.tex` 9,699、`sections/introduction.tex` 7,314、`sections/trace.tex` 7,180、`sections/matrix.tex` 6,769，加 `main.tex` 与 `preamble.tex` 定点核对记号。`preamble.tex:74` 起定义了 $\R,\mathbb C,\mathop{}\!\mathrm d,\mathrm{op},\mathrm{HS},\operatorname{tr},\operatorname{supp},\operatorname{diag}$；`preamble.tex:90` 是 "\numberwithin{equation}{section}"，所以我引用的公式编号带节号。

`main.tex:3` 逐字 "\author{OpenAI}"，`main.tex:4` "\date{September 24, 2026}"。没有致谢、没有备注、没有版本历史。这决定了我这篇笔记的性质：论文里写着的事我给行号与逐字引用，论文里没写的思维链我一律标 [推测]，从外部文献补的事实标 [外部推断]。`references.bib:10` 里有 "note = {Section 9, contributed by Christoph Thiele, Problem 13}"，对应 `introduction.tex:53` "in~\cite[Section~9, Problem~13]{GrafakosEtAl2017}."。也就是说问题出处是现成的，但解题路径没有出处可查。

机器侧我按 `E:\math\lean\formalization.yaml` 第 1610 到 1612 行给的三条线索走：`file: OAI/Analysis/TriangularHilbert/Main.lean`、`declaration: OAI.TriangularHilbert.main_estimate`、`comparator_config: ComparatorChallenges/TriangularHilbert.json`。目录里 105 个 `.lean`，我没打算通读，只从 `Main.lean` 出发追定义链。

## 2 为什么能量必须是 $\operatorname{tr}P^{3/2}$：三次齐性与对称点咬合

`matrix.tex:11` 逐字：" \Phi(P)=\tr(P^{3/2}), \qquad \supp P=(\ker P)^\perp."。我先把中间步骤补齐：若 $R$ 的奇异值为 $\rho_i$，则 $R^*R$ 的特征值是 $\rho_i^2$，于是 $\Phi(R^*R)=\sum_i(\rho_i^2)^{3/2}=\sum_i\rho_i^3$，这是把 $\operatorname{tr}(R^*R)^{3/2}$ 读成"奇异值立方和"的唯一理由。

`matrix.tex:42` 逐字：" d\Phi_P(K)=\frac32\tr(\sqrt P K),"。它的推导我只用一句提示就能补全：`matrix.tex:60` 起取 $A=\sqrt P$，平方映射的导数是 $X\mapsto AX+XA$，反函数求导得 $AX_K+X_KA=K$；左乘 $A$ 再取迹，$\operatorname{tr}(A^2X_K)+\operatorname{tr}(AX_KA)=\operatorname{tr}(AK)$，而 $\operatorname{tr}(AX_KA)=\operatorname{tr}(A^2X_K)$，故 $2\operatorname{tr}(PX_K)=\operatorname{tr}(AK)$。对 $\Phi(P)=\operatorname{tr}(P\sqrt P)$ 求导得 $\operatorname{tr}(KA)+\operatorname{tr}(PX_K)=\operatorname{tr}(AK)+\tfrac12\operatorname{tr}(AK)=\tfrac32\operatorname{tr}(AK)$，正是 `matrix.tex:73` 那一行。

`matrix.tex:49` 到 `matrix.tex:51` 给出 Hessian 的逐项形式：

```
 b_P(K)=\frac32\sum_{i,j}
          \frac{|K_{ij}|^2}{\sqrt{p_i}+\sqrt{p_j}}.
```

中间步骤：$A=\sqrt P$ 在对角化基下元素为 $\sqrt{p_i}$，故 $(X_L)_{ij}=L_{ij}/(\sqrt{p_i}+\sqrt{p_j})$；$\mathrm d^2\Phi_P(K,L)=\tfrac32\operatorname{tr}(X_LK)=\tfrac32\sum_{ij}(X_L)_{ij}K_{ji}$，取 $L=K$ 并用 Hermitian 性 $K_{ji}=\overline{K_{ij}}$，得 $\tfrac32\sum_{ij}|K_{ij}|^2/(\sqrt{p_i}+\sqrt{p_j})$。这个分母 $\sqrt{p_i}+\sqrt{p_j}$ 后面会被 $\mathsf L_{\sqrt P}+\mathsf R_{\sqrt P}$ 的语言重述一次，它是全篇唯一出现"两个尺度相加"的地方，序比较引理靠它。

机械理由（对称点在哪一维取到）：$\Phi$ 关于 $R$ 是三次齐的，$R\mapsto tR$ 让能量乘 $t^3$。输入取 $L^3$、输出取 $L^{3/2}$ 时，双线性配对 $\int F_0\,B(F_1,F_2)$ 的三个因子各贡献一次齐性，总次数 3 与能量次数 3 相同。若把能量换成 $\operatorname{tr}P^{q/2}$（奇异值 $q$ 次和），则 `matrix.tex:151` 那一行 "$\le\frac34\lVert L\rVert_{\mathrm{op}}^2\Phi(R^*R)$." 的推导要用 $x^2y^2/(x+y)\le(xy)^{3/2}/2\le(x^3+y^3)/4`，右端恰是立方；取 $q\ne3$ 时这个 AM-GM 链的末项不再与 $\mathcal S(A)=\sum h^2|A_v|^3$（`heat.tex:53`）同次，缩放论证立刻失配。具体地说，`maximal.tex:29` 的结论右侧是 "$\le C\prod_{v=0}^2\left(\sum_{i,j}h^2|A_v(i,j)|^3\right)^{1/3}.$"，左侧三线性形式对 $(A_0,A_1,A_2)\mapsto(tA_0,tA_1,tA_2)$ 是 $t^3$ 次，右侧也是 $t^3$ 次；换成 $q$ 次能量后右侧变 $t^q$，只能在 $q=3$ 闭合。这就是"对称点"在机器里的真实含义：它是一次齐性的交点。

候选失败路线 [推测]：先用 $\|R\|_{\mathrm{HS}}^2=\operatorname{tr}(R^*R)$ 这类二次能量做 telescoping。失败在 `matrix.tex:169` 的 $\frac{x^2y^2}{x+y}\le\frac{(xy)^{3/2}}2$：二次能量给不出 $(xy)^{3/2}$ 这个混合次数，邻居比较时只剩 $x^2+y^2$，与 $L^3$ 输入质量不对偶。

候选失败路线 [推测]：用 $\det$ 或对数行列式做能量，指望它自带次可加性。失败在支撑约定：`matrix.tex:22` 到 `matrix.tex:24` 定义"supported on $P$ 即在 $\ker P$ 两侧为零"，行列式在秩变化处直接发散，而 `jumps.tex:112` 明写"At a truncation endpoint the rank of a star can change."，秩变化是本篇的核心场景。

## 3 两条序不等式：`lem:order` 与 `lem:insertion` 的常数从哪来

`matrix.tex:93` 到 `matrix.tex:95`：

```
\begin{equation}\label{eq:matrix-order}
 b_P(K)\ge a^{-1/2}b_Q(K).
\end{equation}
```

前提是 $P\le aQ$，$a\ge1$。补中间步骤：由 `matrix.tex:121` 逐字 "$P+\eta I\le a(Q+\eta I)$," 与 `matrix.tex:123` "$\sqrt{P+\eta I}\le\sqrt a\,\sqrt{Q+\eta I}$."，左乘右乘算子满足 $\mathsf L_A+\mathsf R_A\le\mathsf L_B+\mathsf R_B$（`matrix.tex:126` 到 `matrix.tex:130`，用 $\operatorname{tr}(X^*(B-A)X)$ 与 $\operatorname{tr}(X^*X(B-A))$ 非负），取逆反序得 $b_{P+\eta I}(K)\ge a^{-1/2}b_{Q+\eta I}(K)$。指数 $-1/2$ 的来源是：能量 $b$ 对"算子 $(\mathsf L_{\sqrt P}+\mathsf R_{\sqrt P})^{-1}$"线性依赖，而 $\sqrt P$ 与 $\sqrt Q$ 之间差 $\sqrt a$，取逆后差 $a^{-1/2}$。$a\ge1$ 这个限制不能松：若 $a<1$ 则 $P\le aQ$ 逼 $P$ 更小，反序方向会给出 $b_P(K)\ge a^{-1/2}b_Q(K)$ 里 $a^{-1/2}>1$，与 `matrix.tex:136` 用逐项公式在 $\eta\downarrow0$ 时"落在支撑上"的极限论证不再一致。

若把 $a^{-1/2}$ 换成别的衰减率，断点在 `heat.tex:173` 那一行（`lem:neighbors` 内部）"Lemma~\ref{lem:order} gives $b_{T_w}(U_w)\ge2^{-1/2}b_Q(U_w)$."：那里 $a=2$，靠的正是 $T_w\le2Q$，$2^{-1/2}$ 是 $a^{-1/2}$ 的直接代入；若衰减率是 $a^{-1}$，就只剩 $Y_{w+1,w}+Y_{w-1,w}\le c\,V_w$ 里的 $c=2^{-1/2}\cdot2=2^{1/2}$ 变成 $2$，第 6 节的严格耗散走廊会被压缩到不成立。

`matrix.tex:151` 的 $\tfrac34$ 我逐步核过：`matrix.tex:163` 到 `matrix.tex:166` 给 "$b_{R^*R}(R^*LR) =\frac32\sum_{i,j}\frac{\rho_i^2\rho_j^2}{\rho_i+\rho_j}|C_{ij}|^2.$"，配 `matrix.tex:169` 到 `matrix.tex:171` 的 $\frac{x^2y^2}{x+y}\le\frac{(xy)^{3/2}}2\le\frac{x^3+y^3}4$（第二个不等式是 AM-GM：$(xy)^{3/2}\le(x^3+y^3)/2$），得 $b\le\frac38\sum_{ij}(\rho_i^3+\rho_j^3)|C_{ij}|^2$。再用每行每列平方范数 $\le\|L\|_{\mathrm{op}}^2$（`matrix.tex:173` 到 `matrix.tex:174`），两部分各贡献 $\|L\|_{\mathrm{op}}^2\sum_i\rho_i^3$，合并 $\frac38\cdot2=\frac34$。$\tfrac34$ 因此是"$\tfrac32$ 的能量因子 × $\tfrac14$ 的 AM-GM 因子 × $2$ 的行列表面对称"三者的积，换掉任何一处都会把 `heat.tex:213` 的 "$V_v\le\tfrac34\lVert L_v\rVert_{\mathrm{op}}^2e_v,$" 改写，进而破坏 `heat.tex:230` 起用 $e_v$ 做控制函数的那个支配收敛论证。

候选失败路线 [推测]：不引入压缩 $C$，直接对全空间用 $\|L\|_{\mathrm{op}}^2$ 控制所有 $|C_{ij}|^2$。失败在 $\sum_{ij}|C_{ij}|^2$ 会发散到空间的维数平方，而 `matrix.tex:176` 到 `matrix.tex:178` 的求和是 $\frac38\sum_{ij}(\rho_i^3+\rho_j^3)|C_{ij}|^2$，行、列分别用一次 $\|L\|_{\mathrm{op}}^2$ 才把维数彻底消掉。这正是题名里 dimension-independent 的实际内容。

## 4 混合迹不等式：常数 5/3 与一次相位旋转

`trace.tex:34` 到 `trace.tex:36`：

```
 \left|\tr(D_0W_0D_1W_1D_2W_2)\right|
 \le \frac53D_*\sum_{v=0}^2
 b_{T_v}(R_v^*D_vR_v).
```

我要把 $\tfrac53$ 的来历摊开。`trace.tex:161` 到 `trace.tex:164` 是核心链：

```
 |\tr((DM)^3)|
 &\le D_*\bigl(A+3E+3\sqrt{AE}\bigr)\\
 &\le D_*\left(\frac52A+\frac92E\right)
 \le 5D_*\left(\frac A2+E\right)
 \le5D_*Q.
```

中间步骤：$3\sqrt{AE}\le\frac32A+\frac32E$（AM-GM），故 $A+3E+3\sqrt{AE}\le A+\frac32A+\ldots$ 逐项是 $A+\tfrac32A=\tfrac52A$、$3E+\tfrac32E=\tfrac92E$；再由 $\tfrac92E\le5E$ 得 $\tfrac52A+\tfrac92E\le5(\tfrac A2+E)$；最后 `trace.tex:114` 那行 "\ge\frac A2+E." 说明 $\frac A2+E\le Q$。三处 $3$ 与 $1$ 来自按最小下标出现次数分类：`trace.tex:132` 出现一次（$3m_i$），`trace.tex:143` 出现两次（$3m_i^2D_{ii}$），`trace.tex:156` 出现三次（$\le D_*A_i$）。$3$ 是循环轨道的大小：$\operatorname{tr}((DM)^3)$ 对 $(i,j,k)$ 求和时被加数在循环置换下不变，最小下标在轨道内可占三个位置之一。

系数 $\tfrac53$ 是两步除法的结果：`trace.tex:198` 逐字 "6|\tau|\le5D_*Q\le10D_*\mathcal E,"。由 `trace.tex:95` "\mathcal E\ge\frac12Q," 得 $Q\le2\mathcal E$；又 $\operatorname{tr}((DM)^3)=6\operatorname{Re}\tau$（`trace.tex:180`），取相位 $z$ 使 $z\tau=|\tau|$ 后 $6|\tau|\le5D_*Q\le10D_*\mathcal E$，两边除 6 得 $|\tau|\le\frac{10}{6}D_*\mathcal E=\frac53D_*\mathcal E$。也就是说 $\tfrac53=\tfrac{10}{6}$，分母 6 来自正反两个方向的六个三点闭路，分子 10 来自 $5\times2$。`trace.tex:63` 到 `trace.tex:65` 那句 "$A_v$ and $K_v$ are, respectively, $T_v$ and $R_v^*D_vR_v$, after a permutation of blocks and extension by zero." 是维数无关性的第二次出场：`matrix.tex:82` 到 `matrix.tex:85` 已经声明零扩张不改能量。

机械理由（为什么必须做一次相位旋转）：$\operatorname{tr}((DM)^3)$ 只给出 $6\operatorname{Re}\tau$，直接估计会丢虚部。`trace.tex:186` 到 `trace.tex:189` 显示旋转 $W_0\mapsto zW_0$ 后 $R_0\mapsto R_0\operatorname{diag}(zI,I)$、$R_1\mapsto R_1\operatorname{diag}(I,\bar zI)$、$R_2$ 不变，右乘酉矩阵使 Gram 与其插入同时被共轭，于是 $\mathcal E$ 与 $D_*$ 都不变，$\tau$ 却转成实正数。若不旋转，只能在 $\tau$ 的实部上取界，`prop:selected-kernel` 那条链路里的绝对值就取不出来。

候选失败路线 [推测]：把三个 $D_v$ 的算子范数分别用 $D_*$ 控制后各自独立取绝对值，试图省掉公共度量 $M^2$。失败在 `trace.tex:81` 的 $\sum_vb_{M^2}(K_v)\ge\frac13b_{M^2}(\sum_vK_v)$：这步用了二次型的三角不等式（三个向量的二次不等式），代价是 $\frac13$；若分开估计，$\sum_vK_v=MDM$ 这个整体就丢了，而 $|\operatorname{tr}((DM)^3)|$ 恰好只与 $MDM$ 的立方有关，与分块 $K_v$ 的立方无关。

候选失败路线 [推测]：把循环迹直接写成 $W_0W_1W_2$ 的普通迹并用奇异值不等式 $\|AB\|_1\le\|A\|\,\|B\|_1$ 逐段剥离。失败原因：这样只能得到 $\prod_v\|W_v\|_{\mathrm{op}}$ 型界，而 $h$ 网格上 $\|W_v\|_{\mathrm{op}}$ 的累积带 $h$ 的负幂，`maximal.tex:29` 右侧要的是离散 $\ell^3$ 质量，纯粹范数剥离给不出可加的三次质量。

## 5 热流身份式：$\tfrac12$ 的抵消与 $\sigma_v=\alpha_vs$

`heat.tex:17` 到 `heat.tex:21` 逐字：

```
 g_\sigma(t)=(2\pi\sigma)^{-1/2}e^{-t^2/(2\sigma)},\qquad
 w_v(i)=h g_{\sigma_v}(u_i-p_v),\\
 W_v(i,j)=A_v(i,j)\sqrt{w_v(i)w_{v+1}(j)}.
```

密度对参数的三个导数写在 `heat.tex:125` 到 `heat.tex:127`：

```
 \partial_pw=Lw,\qquad
 \partial_p^2w=(L^2-\sigma^{-1})w,\qquad
 \partial_\sigma w=\tfrac12\partial_p^2w.
```

我自己验算过：$\partial_p\big(e^{-(u-p)^2/2\sigma}\big)=\frac{u-p}{\sigma}e^{-(u-p)^2/2\sigma}$，即 $Lw$，$L=(u-p)/\sigma$；再导一次得 $(L^2-\sigma^{-1})w$；对 $\sigma$ 导得 $(-\frac1{2\sigma}+\frac{(u-p)^2}{2\sigma^2})w=\frac12(L^2-\sigma^{-1})w$。$\partial_\sigma=\tfrac12\partial_p^2$ 是热方程，$\tfrac12$ 是它的全部信息。

`heat.tex:114` 到 `heat.tex:119` 是本节的主干：

```
 2\partial_s e_v
 &=\sum_i\alpha_i\partial_{p_i}^2e_v
       -\alpha_vV_v-\sum_{w\ne v}\alpha_wY_{v,w},
       \label{eq:heat-identity}\\
 \partial_{p_{v+1}}\partial_{p_{v-1}}e_v&=Z_v.
       \label{eq:heat-mixed}
```

中间步骤（这是论文略掉的一段）：$T_v$ 对行密度线性，$\partial_{p_v}T_v=U_v$，$\partial_{p_v}^2T_v=$ 插入 $(L^2-\sigma^{-1})w$ $=-\sigma^{-1}T_v+$ 插入 $L^2w$。链式法则给 $\partial_{p_v}^2e_v=b_{T_v}(U_v)+\mathrm d\Phi(\text{插入 }L^2w)-\sigma^{-1}\mathrm d\Phi(T_v)$。另一方面 $\partial_{\sigma_v}T_v=\tfrac12$ 插入 $(L^2-\sigma^{-1})w$，故 $\partial_{\sigma_v}e_v=\tfrac12\mathrm d\Phi(\text{插入 }L^2w)-\tfrac12\sigma^{-1}\mathrm d\Phi(T_v)$。两式相减，含 $L^2w$ 与 $\sigma^{-1}$ 的项完全消掉，只剩 $\partial_{\sigma_v}e_v=\tfrac12\partial_{p_v}^2e_v-\tfrac12b_{T_v}(U_v)$，即 `heat.tex:137` 到 `heat.tex:140` 的

```
 \partial_{\sigma_v}e_v
 =\tfrac12\partial_{p_v}^2e_v
    -\tfrac12\mathcal B_{T_v}(U_v,U_v)
 =\tfrac12\partial_{p_v}^2e_v-\tfrac12V_v.
```

这次消元说明了我一开始看错的地方：我以为成本项 $V_v$ 是热流耗散的"副产物"，实际它是两个导数之差里唯一 surviving 的项，$\partial_p^2$ 与 $\partial_\sigma$ 的公共部分（$\mathrm d\Phi$ 线性项）彼此抵消。$\tfrac12$ 因子必须两边一致，否则抵消不干净；这正是 $\partial_\sigma w=\tfrac12\partial_p^2w$ 中那个 $\tfrac12$ 被消费的位置。

列方向的处理换了 Gram：`heat.tex:142` 到 `heat.tex:143` "For a column vertex $w\ne v$, use instead $S_v$, which is linear in that column density and has fixed support."。为什么必须换：$W_v$ 的列指标属于 $H_{v+1}$，$W_{v-1}^*$ 的列指标属于 $H_{v-1}$，$S_v=R_vR_v^*$ 的行方向是 $H_v$，改 $p_w$（$w\ne v$）只动 $S_v$ 的列密度，行密度不动。若坚持用 $T_v$，一次改变会同时触碰两个块列，支撑就不固定，`lem:star-smoothness`（`heat.tex:78` 到 `heat.tex:83`）的"$\ker R_v=\ker(R_v^0D_{\rm col})$"论证不再可用。

$\partial_{p_{v+1}}\partial_{p_{v-1}}e_v=Z_v$ 的中间步骤：$S_v=W_vW_v^*+W_{v-1}^*W_{v-1}$ 的两个加数依赖不同列密度，交叉偏导为 0，所以 $\partial_{p_{v+1}}\partial_{p_{v-1}}S_v=0$，链式法则里只剩 Hessian 项 $\mathcal B_{S_v}(U_{v,v+1},U_{v,v-1})$，这就是 `heat.tex:38` 定义的 $Z_v$。混合导数不带一阶项这一事实，是后面 `heat.tex:266` 到 `heat.tex:268` 把 $\partial_d^2J_v$ 写成 $\int Z_v$ 的前提。

机械理由（$\sigma_v=\alpha_vs$ 的参数化）：$\alpha$ 为 $(1,\lambda,\lambda)$ 的排列时，$s$ 同时驱动三个方差按比例增长，$\partial_s=\sum_i\alpha_i\partial_{\sigma_i}$，这是 `eq:heat-identity` 左侧 $2\partial_se_v$ 与右侧 $\sum_i\alpha_i\partial_{p_i}^2e_v$ 同时出现的唯一方式。若允许 $\alpha_i$ 各自独立随 $s$ 变（非比例），$\partial_s$ 就不再等于 $\sum\alpha_i\partial_{\sigma_i}$，`heat.tex:148` 那句 "Summing the three variance derivatives with coefficients $\alpha_i$ proves \eqref{eq:heat-identity}." 直接失效。

候选失败路线 [推测]：给每个顶点配独立时间 $s_v$，试图让三个星各自单调。失败在求和之后没有共同的时间轴可以 telescoping：`jumps.tex:346` 的 $c_*\int_{s_-}^{s_+}\int_{\Pi_0}\sum_vV_v$ 需要一个统一尺度积分，独立时间会把 $\Pi_0$ 上的积分变成三维区域，边界项无法用单个 $J$ 表示。

候选失败路线 [推测]：不设 $\sigma_v\ge h^2$ 的下界，让 $s$ 从 0 起。失败在两处：`jumps.tex:43` "$h>0$, $\sigma\ge h^2$ and $n\in\mathbb Z$" 是 Gaussian 与离散极大比较的前提（否则 $a=\sqrt\sigma/h<1$，`jumps.tex:98` 的环形分割把点质量 $|f(n)|$ 之外的一切都丢掉，界不成立）；`heat.tex:300` 的初始能量引理声明 "For any $d\in\R$ and variances $\sigma_v\ge h^2$"，一旦放开，`heat.tex:313` 的网格质量 $\le1+\frac{2h}{\sqrt{2\pi\sigma}}$ 在 $\sigma\to0$ 时发散，$C_0$ 不存在。

## 6 $\lambda=11/10$ 落在一条窄走廊里：邻居比较与严格耗散

`heat.tex:49` 逐字："change of coordinates has absolute determinant one.  Put $\lambda=11/10$."。这个数出现得太随意，我必须自己推出它的容许区间。

先补 `lem:neighbors`（`heat.tex:161` 到 `heat.tex:163`）"$Y_{w+1,w}+Y_{w-1,w}\le\sqrt2\,V_w.$" 的中间步骤。记 $A=W_w$、$B=W_{w-1}^*$、$L=L_w$。由 $\|Az+Bz'\|^2\le2\|Az\|^2+2\|Bz'\|^2$ 得 $T_w=\begin{pmatrix}A\\B\end{pmatrix}^*\begin{pmatrix}A\\B\end{pmatrix}$ 型的对角块控制：$T_w\le2Q$，$Q=\operatorname{diag}(A^*A,B^*B)$。`heat.tex:172` 说 $U_w=[A\ B]^*L[A\ B]$ 支撑在 $T_w$ 上，`lem:order` 用 $a=2$ 给 $b_{T_w}(U_w)\ge2^{-1/2}b_Q(U_w)$。在 $Q$ 的分块保持特征基里，`matrix.tex:50` 的逐项公式说明 $b_Q$ 是非负平方项之和，丢掉非对角块（即 $A^*LB$ 与 $B^*LA$ 那两块）只会变小：$b_Q(U_w)\ge b_{A^*A}(A^*LA)+b_{B^*B}(B^*LB)$。最后 $A^*A=W_w^*W_w\le W_w^*W_w+W_{w-1}^*W_{w-1}=S_{w+1}$（比较因子 $a=1$），插入吻合 $U_{w+1,w}=W_wL_{w+1}W_w^*\ldots$ 的共轭形式，`lem:order` 再用一次给 $b_{A^*A}(A^*LA)\ge b_{S_{w+1}}(U_{w+1,w})=Y_{w+1,w}$。两项合并即 $\sqrt2=2^{1/2}$，来自 $2^{-1/2}$ 取倒数。

再补 `lem:plane-dissipation` 的系数统计。`heat.tex:196` 到 `heat.tex:198`：

```
 2\partial_sJ(d,s)\le\int_{\Pi_d}\sum_w
 \left[-\alpha_w+
 \sqrt2\max\{0,\Sigma_\alpha/2-\alpha_w\}\right]V_w\,\dd\pi_d.
```

推导：$2\partial_sJ_v=\int[\Sigma_\alpha Z_v-\alpha_vV_v-\sum_{w\ne v}\alpha_wY_{v,w}]$（`heat.tex:276` 到 `heat.tex:278`），其中 $Z_v$ 的系数 $\Sigma_\alpha$ 来自 `heat.tex:258` 的 $\partial_d^2J_v=\int\partial_{p_i}^2e_v$ 对 $i$ 求和后按 $\alpha_i$ 加权再叠 `eq:heat-mixed`。用 $2Z_v\le Y_{v,v+1}+Y_{v,v-1}$（`heat.tex:280`，Cauchy-Schwarz 配 `matrix.tex:55` 的 $|\mathcal B_P(K,L)|\le b_P(K)^{1/2}b_P(L)^{1/2}$，再 AM-GM），对 $v$ 求和后，带着"打分位置在 $w$"的两个邻居成本 $Y_{w+1,w}+Y_{w-1,w}$ 的共同系数是 $\Sigma_\alpha/2-\alpha_w$（`heat.tex:281` 到 `heat.tex:282`）。系数为正时上 `lem:neighbors` 换成 $\sqrt2V_w$，为负时直接丢弃（$V_w\ge0$）。

代入 $\alpha=(1,\lambda,\lambda)$，$\Sigma_\alpha=1+2\lambda$。$w$ 处 $\alpha_w=1$：$\max\{0,\frac{1+2\lambda}2-1\}=\lambda-\frac12$（$\lambda>\tfrac12$ 时），系数 $-1+\sqrt2(\lambda-\tfrac12)$。$w$ 处 $\alpha_w=\lambda$：$\max\{0,\frac{1+2\lambda}2-\lambda\}=\tfrac12$，系数 $-\lambda+\tfrac{\sqrt2}2$。严格耗散要求两者皆负：

```
 \lambda>\frac{\sqrt2}{2}\approx0.70711,
 \qquad \lambda<\frac{1+\sqrt2}{2}\approx1.20711.
```

`heat.tex:288` 逐字："$-1+(3/5)\sqrt2$ and $-11/10+(1/2)\sqrt2$, both strictly negative. Dividing by two gives"。$\lambda=11/10$ 时 $\lambda-\tfrac12=\tfrac35$，两个系数是 $-1+0.6\sqrt2=-0.15147$ 与 $-1.1+0.70711=-0.39289$，取较小绝对者并除 2，得 `heat.tex:204` 的

```
 c_* = \frac12\min\{1-\tfrac35\sqrt2,\tfrac{11}{10}-\tfrac12\sqrt2\}>0.
```

数值 $c_*=\tfrac12\cdot0.15147=0.075736$。起作用的永远是 $\alpha_w=1$ 那个窄顶点：它的负余量只有 $0.151$，而宽顶点余量 $0.393$。

为什么 $\lambda$ 还必须 $>1$：`maximal.tex:45` 逐字 "$(\\lambda s,\\lambda s,\\lambda s)$, where $\\lambda=11/10$, and put"，随后 `maximal.tex:47` 定义 $D_v(i,i)=k_s(u_i-p_v)/g_{\lambda s}(u_i-p_v)$，只有 $\lambda>1$ 才使基方差 $\lambda s$ 大于窗口方差 $s$，比值才有 `maximal.tex:51` 到 `maximal.tex:53` 的高斯衰减：

```
 |D_v(i,i)|=\sqrt\lambda\,|z|
       e^{-(\lambda-1)z^2/(2\lambda)}
 \le\frac{\lambda}{\sqrt{e(\lambda-1)}}.
```

我自己求了这个极大值：$f(z)=z e^{-cz^2}$，$c=(\lambda-1)/(2\lambda)$，$z_*=1/\sqrt{2c}=\sqrt{\lambda/(\lambda-1)}$，$f(z_*)=(2ce)^{-1/2}$，乘前面 $\sqrt\lambda$ 得 $\lambda/\sqrt{e(\lambda-1)}$。$\lambda=1.1$ 给 $1.1/\sqrt{2.71828\times0.1}=1.1/0.52137=2.1098$。

于是 $\lambda$ 被夹在走廊 $(1,\,1.20711)$ 内：下沿由 $1/\sqrt{\lambda-1}$ 的爆炸（`prop:selected-kernel` 的 $D_v$ 一致界）给出，上沿由 $c_*>0$（`lem:plane-dissipation` 的严格耗散）给出。$11/10$ 在这条宽 $0.207$ 的走廊里居中偏上，两侧余量各约 $0.1$。$D_v$ 的上界在 $\lambda\to1.20711$ 时是 $1.20711/\sqrt{e\cdot0.20711}=1.20711/0.75038=1.6087$，在 $\lambda\to1.05$ 时是 $1.05/\sqrt{e\cdot0.05}=1.05/0.36861=2.8486$：把 $\lambda$ 往下挪会放大 $D_v$ 常数，往上挪会压掉 $c_*$。

机械理由（为什么是"一个窄、两个宽"）：`jumps.tex:188` 逐字 "$\alpha$ be any permutation of $(1,11/10,11/10)$ and use variances"。若取三个都等于 1，则 $\Sigma_\alpha/2-\alpha_w=\tfrac12$ 变成 $-\tfrac12<0$，邻居项全丢弃，$2\partial_sJ\le-\int\sum V_w$，看似更好；但 `maximal.tex:47` 的 $D_v$ 变成 $k_s/g_s$，比值 $\sqrt{\lambda}=1$ 且指数衰减消失（$\lambda-1=0$），一致界不存在。也就是"基方差比窗口方差宽"与"耗散系数为负"这两件事由同一个 $\lambda-1$ 控制，一正一负，只有严格中间的选择可行。三个顶点里恰好一个是窄的（提供 $D_v$ 需要的比较），两个宽的负责吸收邻居项，$\Sigma_\alpha$ 保持 $16/5$。

`heat.tex:62` 到 `heat.tex:65` 我读到的动机陈述很关键，逐字：

```
The odd-window estimate in Section~\ref{sec:maximal} uses wider Gaussian
weights for uniformly bounded diagonal factors, but compares each score cost
after narrowing only its own vertex. The fixed enlargement
$\lambda=11/10$ retains strict dissipation for all three comparisons.
```

"narrowing only its own vertex" 说明 $\alpha(v)$（在自身顶点取 1、其余取 $\lambda$）是为 $V_v$ 定制的三套方差，并非三套独立的证明。`maximal.tex:81` 到 `maximal.tex:82` "$b_{T_v^{\mathrm b}}\bigl((R_v^{\mathrm b})^*D_vR_v^{\mathrm b}\bigr)\le\lambda^{1/4}s V_v^{\boldsymbol\alpha(v)}.$" 里的 $\lambda^{1/4}$ 由两处合成：$T_v^{\alpha(v)}\le\sqrt\lambda T_v^{\mathrm b}$（`maximal.tex:66`，用 $g_s\le\sqrt\lambda g_{\lambda s}$）给 $a=\sqrt\lambda$，`lem:order` 的 $a^{-1/2}$ 给 $\lambda^{1/4}$；$s$ 来自 `eq:maximal-window-score`（`maximal.tex:72` 到 `maximal.tex:74`）的 $\sqrt s$ 平方（二次齐性）。$\lambda^{1/4}$ 之后要乘 $\lambda/\sqrt{e(\lambda-1)}$（即 $D_*$），再乘 $\mathop{}\!\mathrm d s/s$ 里的 $s$ 抵消，得 `maximal.tex:89` 到 `maximal.tex:92` 的 $\le C\mathcal S(A)$。若 $\lambda$ 改动，$C$ 里同时含 $\lambda^{1/4}\cdot\lambda/\sqrt{e(\lambda-1)}$ 与 $1/c_*$，后者在 $\lambda\to1.20711$ 时爆炸。

候选失败路线 [推测]：让 $\lambda$ 依赖尺度 $s$（例如窄顶点随 $s$ 靠近 1）。失败在 `jumps.tex:188` 的排列前提与 `heat.tex:111` "Fix a positive vector $\boldsymbol\alpha$ and set $\sigma_i=\alpha_i s$."：$\alpha$ 必须与 $s$ 无关，否则 $\partial_s$ 不再等于 $\sum\alpha_i\partial_{\sigma_i}$，第 5 节那次 $\tfrac12$ 消元的右边会多出 $\partial_s\alpha_i$ 项，而这项没有符号。

候选失败路线 [推测]：对称地取 $\alpha=(1,1,\lambda)$（两个窄的）。失败在系数统计：$\alpha_w=1$ 出现两次，$\Sigma_\alpha=2+\lambda$，$\max\{0,\Sigma/2-1\}=\lambda/2$，系数 $-1+\sqrt2\lambda/2<0$ 要求 $\lambda<\sqrt2\approx1.4142$，看似更松；但 $\alpha_w=\lambda$ 时 $\Sigma/2-\lambda=1-\lambda/2>0$ 要求 $\lambda<2$，配合 $D_v$ 一致界需 $\lambda$ 严格大于 1，走廊看似变宽。真正的障碍在 `maximal.tex:58` 到 `maximal.tex:60`："changing from the base variances to $\boldsymbol\alpha(v)s$ changes only its row weight."：只有当 $\alpha(v)$ 在 $v$ 之外全取同一个 $\lambda$ 时，基方差 $(\lambda s,\lambda s,\lambda s)$ 到 $\alpha(v)s$ 的改变才只碰一个顶点的行权重；两个窄的会让另两个顶点的权重同时错位，`eq:maximal-window-score` 那个精确身份不再成立。

## 7 初始能量 $C_0=2\sqrt2(1+\sqrt{2/\pi})$：网格质量的分配

`heat.tex:303` 到 `heat.tex:305`：

```
 \le C_0\mathcal S(A),\qquad
 C_0=2\sqrt2\left(1+\sqrt{2/\pi}\right).
```

中间步骤全在 `heat.tex:311` 到 `heat.tex:313` 与 `heat.tex:322` 到 `heat.tex:326`。第一步是网格质量：$\sum_{i=-N}^Nh g_\sigma(u_i-p)\le1+\frac{2h}{\sqrt{2\pi\sigma}}$。证明思路我已核对：对 $u_i\ge p+h$ 把格点值与它前面长度 $h$ 的区间上的积分比较（该区间上高斯 $\ge$ 端点值），对 $u_i\le p-h$ 用后面的区间，这些区间互不相交且落在 $\R$ 上，故总和控制 $\le\int g_\sigma=1$；剩下至多两个落在 $(p-h,p+h)$ 内的格点各贡献 $h\sup g_\sigma=h/\sqrt{2\pi\sigma}$，合计 $\frac{2h}{\sqrt{2\pi\sigma}}$。取 $\sigma\ge h^2$ 得最坏值 $1+\frac{2}{\sqrt{2\pi}}=1+\sqrt{2/\pi}=1+0.79788=1.79788$，即 `heat.tex:322` 的 $M$。

第二步是加权 Hölder：$\big(\sum_{ij}|A_v|^2w_v(i)w_{v+1}(j)\big)^{3/2}\le M\sum_{ij}|A_v|^3w_v(i)w_{v+1}(j)$。这里用的是加权版 $\|\cdot\|_{\ell^2(\mu)}\le\mu_{\rm tot}^{1/2}\|\cdot\|_{\ell^3(\mu)}$ 的三次方形式：设 $\mu=ww'$ 为乘积测度，则 $(\sum|A|^2\mu)^{3/2}\le(\mu_{\rm tot}\sum|A|^3\mu)$，其中 $\mu_{\rm tot}=(\sum w_v)(\sum w_{v+1})\le M^2$，再取 $3/2$ 次给 $\le M^3$，而论文写的是 $M$。我要把这个差异说清：`heat.tex:324` 左端是 $\|W_v\|_{\rm HS}^3=(\sum|A_v|^2ww')^{3/2}$，由 Hölder 指数 $\tfrac32$ 与 $3$ 的对偶关系（$2$ 是 $\tfrac32$ 与 $3$ 的调和中间量）可得 $(\sum|A|^2\mu)^{3/2}\le(\sum\mu)^{1/2}\cdot$？正确做法是 $\sum|A|^2\mu=\sum|A|^2\mu^{2/3}\mu^{1/3}\le(\sum|A|^3\mu)^{2/3}(\sum\mu)^{1/3}$，取 $3/2$ 次得 $(\sum|A|^2\mu)^{3/2}\le(\sum|A|^3\mu)(\sum\mu)^{1/2}$。$\sum\mu=\mu_{\rm tot}\le M^2$ 故 $(\sum\mu)^{1/2}\le M$。这就把 `heat.tex:326` 的系数 $M$ 精确解释为"$\ell^{3/2}$ 与 $\ell^3$ 的 Hölder 配平后剩下的总质量平方根"，并非随手写的 $M$。

第三步是平面积分：以 $p_v,p_{v+1}$ 为自由坐标，每个密度积分为 $h$，得 `heat.tex:331` 到 `heat.tex:333` "$\int_{\Pi_d}\lVert W_v\rVert_{\mathrm{HS}}^3\,\mathop{}\!\mathrm d\pi_d\le M\sum_{i,j}h^2|A_v(i,j)|^3.$"。第四步是 `heat.tex:232` 到 `heat.tex:235` 的能量估计 "$e_v\le(\lVert W_v\rVert_{\mathrm{HS}}^2+\lVert W_{v-1}\rVert_{\mathrm{HS}}^2)^{3/2}\le\sqrt2(\lVert W_v\rVert_{\mathrm{HS}}^3+\lVert W_{v-1}\rVert_{\mathrm{HS}}^3).$"，前一半来自"星至多两条边"与 $\Phi\le\|R\|_{\rm HS}^3$，后一半用 $(a^2+b^2)^{3/2}\le\sqrt2(a^3+b^3)$（等价于 $\|x\|_2\le\sqrt2\|x\|_\infty$ 在二维上）。$e_v$ 对 $v$ 求和时每条边被两个星用一次，故总因子 $2\cdot\sqrt2\cdot M$，即 $C_0=2\sqrt2(1+\sqrt{2/\pi})=2.82843\times1.79788=5.0827$。

机械理由（$\sqrt2$ 与 $2$ 各自不可省）：把 $R_v^*R_v$ 的 $\Phi$ 用单边估计会丢掉第二条边，$2\sqrt2$ 变成 $\sqrt2$，但 `heat.tex:334` "Each edge occurs in exactly two stars." 明确说求和时重复计数 2 必须吸收。若改用 $(a^2+b^2)^{3/2}\le(a^3+b^3)\cdot2^{1/2}$ 的最佳常数（我核过：$a=b$ 时取等，$(2a^2)^{3/2}=2\sqrt2a^3$ 对 $2a^3$，比值 $\sqrt2$ ✓），任何放大都会串到 `heat.tex:346` 的 $C_0/c_*$：那里逐字 "$\le\frac{J(0,s_0)-J(0,s_1)}{c_*}\le\frac{C_0}{c_*}\mathcal S(A).$"，$C_0/c_*=5.0827/0.075736=67.11$，这是整篇第一个真正"大"的常数，它直接决定 $C\mathcal S(A)$ 里的 $C$。

候选失败路线 [推测]：用逐点 $\sup_i w_v(i)\le h(2\pi\sigma)^{-1/2}$ 代替网格质量 $M$。失败在 $\sigma\ge h^2$ 只给 $h/\sqrt{2\pi\sigma}\le1/\sqrt{2\pi}$，看似同阶，但 $\sum|A|^2ww'$ 里格点个数 $2N+1$ 会显式出现，最终界带 $N$，违反 `heat.tex:6` 的 "The estimate must be independent of the number of matrix entries; this uniformity will allow us to pass from finite matrices to functions."。

候选失败路线 [推测]：把初始能量改成"末能量 $\le C\mathcal S(A)$"从而省掉丢弃非负项那一步。失败在 `jumps.tex:352` 逐字 "Here the terminal energy was discarded by nonnegativity."，说明末能量在掩膜下不可控（它对应 $s_+$ 处的开放端点集合，随端点选择而变），而初能量因 `heat.tex:306` 到 `heat.tex:307` "The same bound holds if any entries are replaced by smaller entries in absolute value before forming the weighted matrices." 而对掩膜稳健。这句附加声明正是为了让 `jumps.tex:353` 到 `jumps.tex:353-355` 那句 "The initial right-hand mask has entries bounded by those of the original array, and all its variances are at least $h^2$.  Lemma~\ref{lem:initial-energy} therefore gives $J(s_-+)\le C\mathcal S(A).$" 能引用它。

## 8 奇窗口、端点选择与掩膜：maximal 线的前半

第 0 节我把 maximal 的困难押在"算子族的极大化"上，读完 `maximal.tex` 才发现这一节的第一个句子就把接口交给了 jumps：`maximal.tex:3-4` 逐字 "The estimate of Section~\ref{sec{jumps}} allows different truncation / endpoints at every output position. We first use this freedom on a finite / mesh, choosing the endpoints that maximize each output."。也就是说，逐点自由选取端对的权力是 jumps 造出来的机器，maximal 只负责把它消化进三线性形式的右端。这一节补第 6 节留在半路的引用（`maximal.tex:95-124` 的识别段我还没写过），第 11 节再回来接硬截断比较。

`maximal.tex:12-16` 逐字：

```
 k_s(t)=\frac{t}{\sqrt{s}}g_s(t),\qquad
 \psi=k_1*k_1*k_1,\qquad
 I_{\varepsilon,R}(t)=\int_{\varepsilon^2}^{R^2}
       s^{-1/2}\psi(t/\sqrt{s})\,\frac{\dd s}{s}.
```

中间步骤：$k_s$ 是奇函数（$t$ 乘偶高斯），并且自带缩放一致性 $k_s(t)=s^{-1/2}k_1(t/\sqrt s)$。我逐项验过：右端 $=s^{-1/2}(t/\sqrt s)(2\pi)^{-1/2}e^{-t^2/2s}=s^{-1}t(2\pi)^{-1/2}e^{-t^2/2s}$，左端 $=t\,s^{-1/2}(2\pi s)^{-1/2}e^{-t^2/2s}$，同一表达式。三顶点各插一个奇窗口，平面积分就产生三重卷积，所以 $\psi=k_1*k_1*k_1$ 的定义不是装饰，它预先记录了 `maximal.tex:103-105` 那句 "(k_s*k_s*k_s)(u_i+u_j+u_l)" 的来源。

`maximal.tex:26-29` 逐字（prop:selected-kernel 的结论）：

```
 \left|h^3\sum_{i,j,l}A_0(i,j)A_1(j,l)A_2(l,i)
       I_{\varepsilon_{ij},\rho_{ij}}(u_i+u_j+u_l)\right|
 \le C\prod_{v=0}^2\left(\sum_{i,j}h^2|A_v(i,j)|^3\right)^{1/3}.
```

证明链的中间步骤（`maximal.tex:40-124`）：掩膜 $A_0^s(i,j)=A_0(i,j)\mathbf 1_{\{\varepsilon_{ij}^2<s<\rho_{ij}^2\}}$（`maximal.tex:41`）；基方差 $(\lambda s,\lambda s,\lambda s)$（`maximal.tex:44-45`）；对角插入 $D_v(i,i)=k_s(u_i-p_v)/g_{\lambda s}(u_i-p_v)$（`maximal.tex:47`）由第 6 节算过的一致界 $\lambda/\sqrt{e(\lambda-1)}$ 控制；`maximal.tex:71-74` 的身份式 $(R_v^{\mathrm b})^*D_vR_v^{\mathrm b}=\sqrt s\,(R_v^{\boldsymbol\alpha(v)})^*L_v^{\boldsymbol\alpha(v)}R_v^{\boldsymbol\alpha(v)}$ 是精确等式，两边的行密度同为 $h\,k_s(u_i-p_v)$，列权重完全一致；随后对基矩阵用 lem:mixed-trace，三个成本项分别用 $\boldsymbol\alpha(v)$ 的 masked 耗散，`maximal.tex:86-87` 逐字 "The factor $s$ cancels / $\mathop{}\!\mathrm d s/s$"，得到 `maximal.tex:89-92` 的 $\le C\mathcal S(A)$。识别部分：`maximal.tex:101-103` 逐字 "On $\Pi_0$, substitute $r=u_i-p_0$ and $q=u_j-p_1$. / The Jacobian is one and the third argument becomes / $u_i+u_j+u_l-r-q$."，于是中心积分化为卷积；`maximal.tex:111-114` 逐字 "The mask restricts the / scale integral of the $(i,j,l)$ term to / $(\varepsilon_{ij}^2,\rho_{ij}^2)$. Taking the absolute value after / integration"。取绝对值在积分之后，这正是逐点选端对能成立的原因：每个 $(i,j)$ 的 $s$ 积分区间互不相干，绝对值放进去之前所有区间已被 jumps 侧一次性买断。

机械理由：右端 $1/3$ 指数的来源。先归一：$n_v=(\sum h^2|A_v|^3)^{1/3}$，任一为零则符号和为零（`maximal.tex:118-119`）；否则对 $A_v/n_v$ 用估计，此时 $\mathcal S$ 归一化的值是 $3$（`maximal.tex:120-121` 逐字 "The normalized value of / $\mathcal S$ is $3$"），左端双线性地在每个顶点一次齐，把 $n_v$ 缩放回去就得 $\prod_v n_v$，即 $\prod_v(\sum h^2|A_v|^3)^{1/3}$。左端的三次齐性 $h^3\sum A_0A_1A_2$ 与右端 $n_0n_1n_2$ 再次咬合，和第 2 节的 $\mathcal S$ 同次逻辑是同一件事换了位置。

关键转折在 `maximal.tex:160-178`。我第 0 节担心"上确界要靠取值映射的极大不等式"，实际做法是测试数组配对：先固定有限端对族，$U_k(i,j)$ 逐点取最大并按最小达标下标选支（`maximal.tex:155-156` 逐字 "At each output pair choose the least index attaining this maximum, and / write $U(i,j)$ for its output"），再取

```
 A_0(i,j)=H^{-1/3}M(i,j)^{1/2}\,\overline{U(i,j)}/|U(i,j)|
```

（`maximal.tex:163-166`，$H=\sum h^2M^{3/2}$）。指数 $\tfrac12$ 是唯一的：设 $A_0=H^{-1/3}M^{a}\cdot$phase，配对条件 $A_0U=H^{-1/3}M^{a+1}$ 求和给 $H^{-1/3}H=H^{2/3}$ 对任何 $a$ 都成立？不对，$|U(i,j)|=M(i,j)$ 只在选中支处成立，所以 $a+1$ 次 $M$ 求和要恰好是 $H=\sum M^{3/2}$，即 $a+1=3/2$，$a=1/2$；同时 $\sum|A_0|^3=H^{-1}\sum M^{3a+1/3\cdot0}\cdot$……直接验：$|A_0|^3=H^{-1}M^{3/2}$，求和 $=H^{-1}H=1$ ✓。两条约束（配对次数、立方质量归一）都锁在 $3$ 与 $\tfrac32$ 的 Hölder 配对上，$\tfrac12$ 没有自由度。`maximal.tex:176-177` 逐字 "This estimate has no dependence on the number of endpoint pairs. The / complex phase of $A_0$ accounts for the absolute value at each output."，phase 因子 $\overline U/|U|$ 就是把 $\sup_k$ 换成 $\max$ 再换成配对的全部代价。

连续极限部分只补两处：`maximal.tex:216-218` 逐字 "No convergence or regularity of the maximizing indices is needed: we / passed to the limit in the finite maximum itself."，这解释了我一开始想找的"选择映射的可测性"，实际不需要选择映射的极限性质，有限最大本身收敛；`maximal.tex:224-225` 的有理端对枚举与单调收敛把 $m\to\infty$ 收尾。

候选失败路线 [推测]：用平方函数 $(\sum_k|U_k|^2)^{1/2}$ 吃掉 $\sup_k$。失败在右端质量：平方函数给 $\ell^2$ 混合，而本篇全部常数锁在 $\ell^3$ 立方质量上，$(2N+1)^{1/3}$ 的维数损失无法消除，`heat.tex:5-7` 的维数无关要求直接违背。
候选失败路线 [推测]：先对 integrand 取绝对值再做 $s$ 积分。失败在顺序：绝对值放进去后掩膜区间 $(\varepsilon_{ij}^2,\rho_{ij}^2)$ 的端点贡献要逐个控制，jump 记账（下一节）的 $\sum_\tau|\Delta J|$ 结构不复存在，损失回到 $\sqrt{\log(R/\varepsilon)}$ 那条线上。
候选失败路线 [推测]：把三重卷积的三换成二（两个奇窗口一个偶窗口）。失败在 $\Pi_0$ 上的变量替换：第三个因子必须是 $k_s$ 才能把 $u_l$ 方向的自由度换成 $t$ 的奇性；偶窗口给出的中心积分关于 $t$ 偶，与 Hilbert 核的 $1/t$ 奇性符号结构不匹配。

## 9 跳跃枢纽：每个条目至多切换两次

兑现第 0 节的承诺，这一节专写 `jumps.tex:8` 那句 "original arrays alone, because every entry switches at most twice."。先把它的上下文补齐：`jumps.tex:9-11` 逐字 "We first establish two inputs to this bound: estimates for Gaussian / averages that are uniform in the scale, and a formula for changes in / the matrix energy that remains valid when the rank changes."。两条输入，后者我本节处理，前者留给下一节。

输入设置：`jumps.tex:166-172` 逐字 "Independently for every pair $(i,j)$, choose / finite endpoints"，随后

```
 h\le\varepsilon_{ij}<\rho_{ij},
 \qquad
 A_0^s(i,j)=A_0(i,j)
       \mathbf1_{\{\varepsilon_{ij}^2<s<\rho_{ij}^2\}}.
```

以及 $s_-=\min_{i,j}\varepsilon_{ij}^2$、$s_+=\max_{i,j}\rho_{ij}^2$（`jumps.tex:179-181`）。$A_1,A_2$ 全程不动，只有 $A_0$ 带掩膜；`jumps.tex:176-177` 说明输出处的任何相位都预先折进固定的 $A_0(i,j)$，所以掩膜只开关绝对值。

lem:rank-change 的语句（`jumps.tex:122-127` 逐字）：

```
 &\Phi(R_+^*R_+)-\Phi(R_-^*R_-)\\
 &\quad=3\int_0^1\operatorname{Re}
   \langle R(z)\sqrt{R(z)^*R(z)},D\rangle_{\HS}\,\dd z.
```

加上逐元梯度界（`jumps.tex:130-133` 逐字）：

```
 |(R\sqrt{R^*R})_{ij}|
 \le\|\operatorname{row}_iR\|_2\,
       \|\operatorname{col}_jR\|_2.
```

中间步骤：对 $\eta>0$ 先沿 $R(z)$ 微分 $\operatorname{tr}((R^*R+\eta I)^{3/2})$，用 lem:hessian 得导数 $3\operatorname{Re}\langle R(z)\sqrt{R^*R+\eta I},D\rangle_{\mathrm{HS}}$（`jumps.tex:141-144`）。因子 $3$ 我数过两遍：$d\Phi_P(K)=\tfrac32\operatorname{tr}(\sqrt P K)$（matrix.tex:42），而 $P=R^*R$ 对 $R$ 的方向 $D$ 的导数是 $DR+R^*D$ 的对称组合，迹里出两份，$\tfrac32\times2=3$；另一种看法是 $\Phi$ 三次齐、沿直线 $R_-+zD$ 的差就是导数的积分，导数本身三次含一份 $R$ 一份 $\sqrt{R^*R}$，次数 $1+2=3$。正则化到 $\eta\downarrow0$ 的均匀性由谱演算不等式 $\lVert\sqrt{R^*R+\eta I}-\sqrt{R^*R}\rVert_{\mathrm{op}}\le\sqrt\eta$（`jumps.tex:145-148`）保证，$R(z)$ 在参数区间内有界，所以被积函数一致收敛，端点能量也收敛，先积分再取极限成立。逐元界 (R√{R*R})_{ij}=$\langle\operatorname{row}_iR,\operatorname{col}_j\sqrt{R^*R}\rangle$ 用 Cauchy--Schwarz，而 $\sqrt{R^*R}$ 的第 $j$ 列范数平方恰是 $(R^*R)_{jj}$，即 $R$ 的第 $j$ 列范数平方；这条恒等式对零列与奇异矩阵都成立（`jumps.tex:158-159`）。

跳到两个星的估计（`jumps.tex:205-241`）：`jumps.tex:210-213` 逐字 "The superscripts denote one-sided masks.  Interpolate all changed / entries at once between these two arrays.  Each interpolated entry / has absolute value at most $|A_0(i,j)|$, even when some entries open / and others close at the same scale."。四个切片量（`jumps.tex:217-223` 逐字）：

```
 X^2&=\sum_m|A_0(i,m)|^2w_1(m),&
 Y^2&=\sum_m|A_0(m,j)|^2w_0(m),\\
 H^2&=\sum_m|A_2(m,i)|^2w_2(m),&
 K^2&=\sum_m|A_1(j,m)|^2w_2(m).
```

`jumps.tex:225-231` 逐字 "In $R_0=[W_0\;W_2^*]$, a changing entry has row norm at most / $\sqrt{w_0(i)}\sqrt{X^2+H^2}$, column norm at most / $\sqrt{w_1(j)}Y$, and derivative modulus / $\sqrt{w_0(i)w_1(j)}|\delta A(i,j)|$."。我把这三行重建了一遍：$R_0$ 的第 $i$ 行由两块拼接，第一块是 $W_0$ 的第 $i$ 行，元素 $\sqrt{w_0(i)}\sqrt{w_1(m)}A_0(i,m)$，平方范数 $w_0(i)X^2$；第二块是 $W_2^*$ 的第 $i$ 行，即 $W_2$ 的第 $i$ 列的共轭，元素 $\sqrt{w_2(m)}\sqrt{w_0(i)}A_2(m,i)$，平方范数 $w_0(i)H^2$；相加开根即 $\sqrt{w_0(i)}\sqrt{X^2+H^2}$。列方向：变号条目只在第一块，列 $j$ 范数 $\sqrt{w_1(j)}Y$。把三项乘起来：导数模 $\sqrt{w_0(i)w_1(j)}|\delta A|\times$ 行范数 $\times$ 列范数 $=|\delta A|\,w_0(i)w_1(j)\sqrt{X^2+H^2}\,Y$，再用 $\sqrt{x^2+y^2}\le x+y$ 得 $(X+H)Y$ 项。对星 $R_1=[W_1\;W_0^*]$ 走共轭位置 $(j,i)$，同行范数逻辑给 $(Y+K)X$；星 $R_2=[W_2\;W_1^*]$ 不含 $A_0$，不动（`jumps.tex:232`）。两条合并乘导数公式的 $3$，就是 `jumps.tex:236-238` 的

```
 |\Delta e_0|+|\Delta e_1|
 \le3\sum_{i,j}|\delta A(i,j)|w_0(i)w_1(j)
       \bigl[(X+H)Y+(Y+K)X\bigr].
```

`jumps.tex:241` 收尾逐字 "This estimate requires no assumption on the ranks during interpolation."，这是 lem:rank-change 存在的全部理由。

中心平面的概率测度（`jumps.tex:243-267`）：$d\nu_{ij}=h^{-2}w_0(i)w_1(j)\,d\pi$ 在 $\Pi_0$ 上是概率测度，自由坐标 $(p_0,p_1)$ 下的密度为 $g_{\sigma_0}(u_i-p_0)g_{\sigma_1}(u_j-p_1)$，两个单位质量乘积，我验算过归一。于是 $p_0,p_1$ 独立高斯、$p_2=-p_0-p_1$，期望公式（`jumps.tex:256-261` 逐字）：

```
 \mathbb E_{\nu_{ij}}w_0(m)
     &=h g_{2\sigma_0}(u_m-u_i),\\
 \mathbb E_{\nu_{ij}}w_1(m)
     &=h g_{2\sigma_1}(u_m-u_j),\\
 \mathbb E_{\nu_{ij}}w_2(m)
     &=h g_{\sigma_0+\sigma_1+\sigma_2}(u_m+u_i+u_j).
```

中间步骤：方差相加。第一条是独立高斯卷积：$p_0\sim N(u_i,\sigma_0)$ 下 $\mathbb E\,h g_{\sigma_0}(u_m-p_0)=h\,g_{2\sigma_0}(u_m-u_i)$，因为两高斯卷积方差相加；第三条先给 $p_0+p_1\sim N(u_i+u_j,\sigma_0+\sigma_1)$，再对 $g_{\sigma_2}(u_m+p_0+p_1)$ 取均值把 $-\!(u_m+p_0+p_1)$ 的方差补上，得 $h g_{\sigma_0+\sigma_1+\sigma_2}(u_m+u_i+u_j)$。`jumps.tex:266-267` 提到每条也可直接配方验证，我按第一条独立算过一遍，配方法给出的交叉项恰好消成 $2\sigma_0$。

星形控制量（`jumps.tex:270-277`）把 $X,Y,H,K$ 换成离散极大函数：$X_*^2(i,j)=M_{\mathbb Z}(|A_0(i,\cdot)|^2)(j)$、$Y_*^2=M_{\mathbb Z}(|A_0(\cdot,j)|^2)(i)$、$H_*^2(i,j)=M_{\mathbb Z}(|A_2(\cdot,i)|^2)(-i-j)$、$K_*^2=M_{\mathbb Z}(|A_1(j,\cdot)|^2)(-i-j)$。每条期望的方差 $\ge h^2$（$\sigma_v\ge h^2$ 的基线，$s\ge s_-\ge h^2$），下一节的 (8.5) 式给 $\mathbb E X^2\le C_gX_*^2$ 等四条；概率测度下 Cauchy--Schwarz 给出 $\mathbb E(XY)\le C_gX_*Y_*$ 等三条（`jumps.tex:283-287`），并且 `jumps.tex:287-288` 特意声明 "No independence of these four random variables is needed."，因为 CS 只要求两个被积变量平方可积。$X,Y,H,K$ 本身是中心 $p$ 的函数，星形量则只依赖原数组与输出指标、不依赖跳标 $\tau$（`jumps.tex:289-290`），这是"估计只依赖原数组"这句枢纽话的第一半。

求和与开关计数（`jumps.tex:292-336`）：把 (8.10) 对 $d\pi$ 积分并用 $w_0(i)w_1(j)d\pi=h^2d\nu_{ij}$，得 `jumps.tex:296-297` 的 $|\Delta J(\tau)|\le3C_g\sum h^2|\delta A(i,j)|(2X_*Y_*+H_*Y_*+K_*X_*)$，其中 $2X_*Y_*$ 是 $\mathbb E[(X+H)Y+(Y+K)X]$ 里 $XY$ 出现两次的合并。`jumps.tex:299-301` 逐字 "Every entry opens once and closes once.  Therefore its total absolute / change, summed over any subset of endpoint scales, is at most / $2|A_0(i,j)|$."，于是 `jumps.tex:303-305`：

```
 \sum_\tau|\Delta J(\tau)|
 \le6C_g\sum_{i,j}h^2|A_0(i,j)|
       (2X_*Y_*+H_*Y_*+K_*X_*).
```

机械理由：$6=3\times2$。$3$ 来自导数公式的次数（上面推过），$2$ 来自单区间示性函数 $\mathbf 1_{(\varepsilon^2,\rho^2)}$ 的全变差 $|\Delta|=2$。若允许条目在多个不相交尺度区间里反复开关，全变差变成 $2\times$（区间数），端点数重新进入右端，第 0 节那个 $\sqrt{\log(R/\varepsilon)}$ 就回来了；单区间掩膜把"每对端点一个因子"换成"每条目一次质量"。这一步是整个稿子里 $\log$ 消失的确切位置，比我第 0 节猜的任何极大化机制都更靠前。

收尾用离散 Hölder：$\ell^3_h$ 范数下 $|A_0|\cdot X_*Y_*$ 的三重配对给 $n_0\cdot Cn_0\cdot Cn_0$，$H_*Y_*$ 给 $n_0^2n_2$，$K_*X_*$ 给 $n_0^2n_1$，`jumps.tex:331-334`：

```
 \sum_\tau|\Delta J(\tau)|
 \le C(2n_0^3+n_0^2n_2+n_0^2n_1)
 \le C\mathcal S(A).
```

末步的 Young 不等式 $a^2b\le(2a^3+b^3)/3$（`jumps.tex:334` 逐字 "The last step uses $a^2b\le(2a^3+b^3)/3$."）我按权 Young 验过：$a^2b\le\tfrac23a^3+\tfrac13b^3$ 是 $(\tfrac32,3)$ 配对的等权情形，系数 $2/3,1/3$ 通分即 $(2a^3+b^3)/3$。切片估计的双射（`jumps.tex:321-323` 逐字 "For $H_*$, fix $i$ and change the summation index from $j$ to $-i-j$; / this is a bijection of $\mathbb Z$."）保证 $H_*,K_*$ 也是普通切片估计，无重数无网格因子。

telescoping（`jumps.tex:338-361`）：枚举互异端点平方 $t_0=s_-<\cdots<t_m=s_+$，每段开区间内数组固定，用第 5--6 节的 lem:plane-dissipation；`jumps.tex:346-350` 逐字：

```
 c_*\int_{s_-}^{s_+}\int_{\Pi_0}\sum_vV_v\,\dd\pi\,\dd s
 &\le\sum_{k=0}^{m-1}\bigl[J(t_k+)-J(t_{k+1}-)\bigr]\\
 &=J(s_-+)-J(s_+-)
       +\sum_{k=1}^{m-1}\bigl[J(t_k+)-J(t_k-)\bigr]\\
 &\le J(s_-+)+\sum_{k=1}^{m-1}|\Delta J(t_k)|.
```

末能量由非负性丢弃（`jumps.tex:352`，第 7 节末尾我已处理过这句的前向引用），初能量由 lem:initial-energy 对小数组界给 $C\mathcal S(A)$；`jumps.tex:357-358` 逐字 "The initial opening is accounted for / by the right-hand initial energy; a final closing jump is unnecessary."，说明首跳被初能量吃掉、尾跳被非负性扔掉，中间跳才有 jump 记账，这是边界处理的精确分工。

候选失败路线 [推测]：逐条独立插值 $\delta A(i,j)$ 然后对每条用固定支撑的 lem:hessian。失败在零化：条目关闭时该奇异值归零，$b_P(K)$ 的分母 $\sqrt{p_i}+\sqrt{p_j}$（matrix.tex:49-51）在核方向发散，常数失控；lem:rank-change 的正则化正是为了绕过支撑约定。
候选失败路线 [推测]：把 $X,Y,H,K$ 换成 $\|A_0\|_{\mathrm{op}}$ 型的全局量。失败在两个星共边：$A_0$ 同时进 $R_0$ 与 $R_1$，逐元导数 $\delta A(i,j)$ 对能量的影响按行列范数局部分配，换成算子范数后行、列信息合并，Hölder 配对里 $n_0^2n_2$ 这类混合项造不出来。
候选失败路线 [推测]：不设 $h\le\varepsilon_{ij}$。失败在 `jumps.tex:179-181` 与初始能量接口：$s_-<h^2$ 时 lem:initial-energy 的前提 $\sigma_v\ge h^2$ 断裂（第 7 节末已经数过这个后果），而且基线方差 $\lambda s$ 可能低于网格分辨，$D_v$ 一致界里的 $z=(u_i-p_v)/\sqrt s$ 极值点落在无格点区域。

## 10 直线上的输入：lem:line-maximal 与 $C_g$

`jumps.tex:30-47` 给出两条极大不等式与一条高斯比较，逐字先立语句：弱型在 `jumps.tex:34-36`：

```
 \mu\{Mf>\rho\}\le\frac3\rho\|f\|_1.
```

强型在 `jumps.tex:38-41`：

```
 \|Mf\|_q^q\le
 \frac{6q\,2^{q-1}}{q-1}\|f\|_q^q.
```

高斯比较在 `jumps.tex:42-46`（前提 `jumps.tex:43` 逐字 "$h>0$, $\sigma\ge h^2$ and $n\in\mathbb Z$"）：

```
 \sum_{m\in\mathbb Z}h g_\sigma((m-n)h)|f(m)|
 \le C_g M_{\mathbb Z}f(n).
```

中间步骤（覆盖与弱型）：`jumps.tex:51-57` 是中心化覆盖选择：反复取最大半径的区间、丢弃所有与之相交者，选中者两两不交，被丢弃者的半径不超过淘汰者半径、区间落在三倍扩张内。逐字 `jumps.tex:55-57`："This enlargement has three times the / original length on $\R$.  On $\mathbb Z$, its cardinality is / $6r+1\le3(2r+1)$, including $r=0$."。我验过 $r=0$ 的边界：单点集 $6r+1=1\le3$ 成立，所以离散弱型常数同样取 $3$；连续一侧 $\{M_{\R}f>\rho\}$ 开性由固定半径均值的连续性来（`jumps.tex:64-65`），再紧逼近与内正则。

弱到强（`jumps.tex:69-84`）：分解 $f=f\mathbf1_{|f|\le\rho/2}+f\mathbf1_{|f|>\rho/2}$，第一部分极大 $\le\rho/2$ 不进超水平集，第二部分给 `jumps.tex:72-74` 的 $\mu\{Mf>\rho\}\le\frac6\rho\int_{|f|>\rho/2}|f|\,d\mu$，其中 $6=3/(1/2)$，即弱型常数 $3$ 除以水平 $\rho$ 对 $\rho/2$ 的折半。分布函数积分：$\|Mf\|_q^q=q\int_0^\infty\rho^{q-1}\mu\{Mf>\rho\}d\rho$，代入并用 Tonelli 交换积分次序，内层对 $\rho\in(0,2|f(x)|)$ 积 $\rho^{q-2}$ 得 $(2|f|)^{q-1}/(q-1)$，逐字 `jumps.tex:79-82`：

```
 &\le6q\int |f(x)|
          \int_0^{2|f(x)|}\rho^{q-2}\,\dd\rho\,\dd\mu(x)\\
 &=\frac{6q\,2^{q-1}}{q-1}\|f\|_q^q.
```

机械理由：分母 $q-1$ 是 $\int_0^{X}\rho^{q-2}d\rho$ 在 $q\le2$ 时的原函数系数（$q>1$ 收敛）；$2^{q-1}$ 来自内积分上限 $2|f(x)|$ 的 $q-1$ 次幂；$6q$ 里的 $q$ 是分布公式 $q\rho^{q-1}$ 的指标、$6$ 是弱型 $3$ 乘水平折半 $2$。本篇只消费 $q=\tfrac32$：常数 $6\cdot\tfrac32\cdot2^{1/2}/\tfrac12=18\sqrt2=25.456$，它乘进 `jumps.tex:314-319` 的切片范数 $\|X_*\|_{3,h},\|Y_*\|_{3,h}\le Cn_0$ 等四条（逐字 `jumps.tex:314-315`："The $q=3/2$ case of \eqref{eq:line-maximal-strong}, applied on slices, / gives"）。$q=\tfrac32$ 的位置由切片平方 $\ell^{3/2}$ 与平面 $\ell^3$ 配对锁死：$\|X_*^2\|_{3/2}=\|X_*\|_3^2$，要的就是 $q=3/2$，没有选择余地。

高斯比较（`jumps.tex:91-106`）：置 $a=\sqrt\sigma/h\ge1$（`jumps.tex:91`），核写成 $(\sqrt{2\pi}a)^{-1}e^{-(m-n)^2/2a^2}$（`jumps.tex:94-96`）。区域分割逐字 `jumps.tex:98-100`："Split the integers into $|m-n|\le a$ and the annuli / $2^{j-1}a<|m-n|\le2^ja$, $j\ge1$.  The sum of $|f|$ over / $|m-n|\le2^ja$ is at most $3\cdot2^ja\,M_{\mathbb Z}f(n)$."。近区：格点数 $\le2\lceil a\rceil+1$，论文路径是用 $M_{\mathbb Z}$ 吸收平均值，$(2a+1)/a\le3$（$a\ge1$），得近区贡献 $\le \frac{3\cdot2}{\sqrt{2\pi}}\cdot M/2$……我按公式核对：最终 `jumps.tex:104-105` 给

```
 C_g=\frac3{\sqrt{2\pi}}
 \left(1+\sum_{j\ge1}2^j e^{-4^{j-1}/2}\right)<\infty.
```

括号里的 $1$ 是近区项：核最大 $(\sqrt{2\pi}a)^{-1}$，$\sum_{|m-n|\le a}|f(m)|\le(2a+1)M\le3aM$（$a\ge1$），相乘得 $\frac{3}{\sqrt{2\pi}}M$，恰是括号外 $\tfrac3{\sqrt{2\pi}}$ 乘 $1$。环 $j$：点数 $\le2\cdot2^ja+1\le3\cdot2^ja$，高斯在环上最大 $e^{-(2^{j-1}a)^2/2a^2}=e^{-4^{j-1}/2}$，核前缀 $(\sqrt{2\pi}a)^{-1}$，合并 $\frac{3}{\sqrt{2\pi}}\cdot2^j e^{-4^{j-1}/2}M$ ✓ 逐项吻合。数值：$j=1$ 项 $2e^{-1/2}=1.213$，$j=2$ 项 $4e^{-2}=0.541$，$j=3$ 项 $8e^{-8}=0.0027$，级数和 $\approx1.757$，括号 $2.757$，$C_g=1.1968\times2.757=3.2998\approx3.30$，进入第 9 节的 $6C_g\approx19.80$。

被谁消费：$C_g$ 只出现在 `jumps.tex:281-283` 的期望界与 `jumps.tex:296` 的 $|\Delta J(\tau)|$；强型常数进入 `jumps.tex:316-319`；弱型常数是两者的母版；`maximal.tex:297` 又回引 lem:line-maximal 给逐点端误差（`maximal.tex:309-317` 的壳层分解用的正是同一个 centered maximal $M_{\R}$）。`jumps.tex:107` 收尾逐字 "All constants are independent of the mesh and of the support of $f$."，这一句保证 $C_g$ 可以进入全篇统一常数。

候选失败路线 [推测]：用非中心化 Hardy--Littlewood 极大替换 $M_{\mathbb Z}$。表面上能省覆盖常数的一半，失败在离散侧：非中心化均值要跨越格点位置，单点集（$r=0$）不再被任何非中心化区间一致控制，`jumps.tex:56-57` 特意点名的 "including $r=0$" 情形正是为了让 $|f(m)|$ 单个格点也被 $M_{\mathbb Z}f(m)$ 吃掉；换成非中心化后近区估计 $(2a+1)M\le3aM$ 在 $a\ge1$ 处不再逐点成立。
候选失败路线 [推测]：弱型加 Marcinkiewicz 内插得强型，省掉分布函数计算。失败在常数的可追溯性：内插给出的强型范数是隐常数链，本篇的 $C_g$、$18\sqrt2$、$3$ 要逐级乘进 $6C_g$ 与 $C$，最后再和 $C_0/c_*=67.11$ 合成 $C_M$；隐常数链让台账第 16 节里"被谁消费"列全部断链。这是权衡，不是不可能。
候选失败路线 [推测]：放弃环形分割，直接 $\sum_m e^{-(m-n)^2/2a^2}\le\sqrt{2\pi}a$（theta 函数界）。失败在带权：要的是 $\sum(\cdot)|f(m)|\le C_gM_{\mathbb Z}f(n)$ 的算子界，并非 $\ell^1$ 范数界，theta 求和把 $f$ 的局部平均信息抹平，环分割正是"逐环把 $|f|$ 的和交给 $M_{\mathbb Z}$"的标准模板，跳过它就得重做 `jumps.tex:100-102` 的全部比较。

## 11 热流收尾：lem:star-smoothness 与平面泛函的求导正当化

第 5、6 节我先把微分恒等式与系数统计写死，把"能不能求导、能不能穿过积分号"留在了幕后；这一节补 `heat.tex` 的两段机房，热流线才闭合。第 0 节第二条 [推测]（"方差得固定成同一个数，端点选择逐点自由，两者互相拆台"）的真正解法一半也在这里：支撑不动性让两个自由度共存。

`heat.tex:85-87` 逐字：

```
The weighted star has the form $R_v=D_{\rm row}R_v^0D_{\rm col}$, where
$R_v^0=[A_v\ A_{v-1}^*]$ is fixed and both diagonal multipliers are strictly
positive; the column multiplier has one block for each neighbor.
```

中间步骤（支撑两问）：$T_v$ 的核就是 $R_v$ 的核，因为 $\langle T_vx,x\rangle=\lVert R_vx\rVert^2$；$D_{\rm row}$ 可逆给出 $\ker R_v=\ker(R_v^0D_{\rm col})$（`heat.tex:92`），行参数只进 $D_{\rm row}$，所以变 $v$ 自身的中心与方差时 $T_v$ 支撑固定。$S_v$ 的值域是 $D_{\rm row}\operatorname{ran}R_v^0$（`heat.tex:93-94`），列参数只进 $D_{\rm col}$，所以变邻居顶点时 $S_v$ 支撑固定。两句话合起来正好规定了第 5 节的方向选择：行方向导数走 $T_v$、列方向走 $S_v$，否则支撑会随参数漂移，$b_P$ 的分母 $\sqrt{p_i}+\sqrt{p_j}$（`matrix.tex:49-51`）就可能触零。

联合光滑性：`heat.tex:97-98` 逐字 "For joint smoothness, the rank-zero case is immediate.  Otherwise factor / $R_v^0=XY^*$ with $X,Y$ of full column rank."。取满列秩分解后 $X'=D_{\rm row}X$、$Y'=D_{\rm col}Y$，$P'=X'^*X'$ 与 $Q'=Y'^*Y'$ 正定（对角乘子逐点严格正）。谱等式在 `heat.tex:102-103` 逐字：

```
The nonzero eigenvalues of
$R_vR_v^*=X'Q'X'^*$ are those of $Q'^{1/2}P'Q'^{1/2}$, by comparing
$AA^*$ and $A^*A$ for $A=X'Q'^{1/2}$.
```

我按 $A=X'Q'^{1/2}$ 验了双侧：$AA^*=X'Q'X'^*=S_v$，$A^*A=Q'^{1/2}X'^*X'Q'^{1/2}=Q'^{1/2}P'Q'^{1/2}$，而 $AA^*$ 与 $A^*A$ 非零谱重合是标准事实。于是 `heat.tex:104-106` 的 $e_v=\Phi(Q'^{1/2}P'Q'^{1/2})$ 把 $e_v$ 写成"正定矩阵的光滑函数复合光滑参数"：正定锥上平方根光滑（`matrix.tex:59-68` 的逆函数论证），$\Phi=\operatorname{tr}(P\sqrt P)$ 在正定锥光滑（lem:hessian），复合光滑。

平面泛函的求导正当化（lem:plane-dissipation 的前半，`heat.tex:207-249`）：语句在 `heat.tex:189-192`：

```
 J_v(d,s)=\int_{\Pi_d}e_v\,\dd\pi_d,
 \qquad J(d,s)=\sum_vJ_v(d,s),
 \qquad \Sigma_\alpha=\sum_i\alpha_i.
```

`heat.tex:193-194` 声明这些积分有限、对 $s>0$ 连续可微、对 $d$ 二次连续可微。中间步骤（支配链）我完整数了一遍：成本界 $V_v\le\tfrac34\lVert L_v\rVert_{\mathrm{op}}^2e_v$ 与 $Y_{v,w}\le\tfrac34\lVert L_w\rVert_{\mathrm{op}}^2e_v$ 来自 lem:insertion（`heat.tex:211-214`，第 3 节已算出 $\tfrac34$ 的组成），第二条要先在另一列块上零延拓 $L_w$ 得 $B_w$ 使 $U_{v,w}=R_vB_wR_v^*$，再对 $R_v^*$ 用引理（`heat.tex:216-218`），零延拓不改能量靠的是 `matrix.tex:81-85`。逐字 `heat.tex:219-222`：

```
 Also $2|Z_v|\le Y_{v,v+1}+Y_{v,v-1}$.
 For a Hermitian matrix $B$,
 \[
  |\tr(\sqrt{T_v}R_v^*BR_v)|\le\lVert B\rVert_{\op}e_v,
 \]
```

我补的推导：前者是 `matrix.tex:55` 的 $|\mathcal B_P(K,L)|\le b_P(K)^{1/2}b_P(L)^{1/2}$ 配 $2\sqrt{xy}\le x+y$；后者用循环迹把 $\sqrt{T_v}$ 挪成 $R_v\sqrt{T_v}R_v^*\cdot B$，而 $R_v\sqrt{T_v}R_v^*=(\sqrt{\sqrt{T_v}}R_v)^*(\sqrt{\sqrt{T_v}}R_v)$ 半正定、迹为 $\operatorname{tr}(\sqrt{T_v}T_v)=\operatorname{tr}(T_v^{3/2})=e_v$，与 Hermitian $B$ 配对不超过 $\lVert B\rVert_{\mathrm{op}}$ 乘迹；`heat.tex:223-225` 说列方向用 $S_v$ 同法。密度比值界：$\partial_pp^{-1}$ 型比值是 $L$ 与 $L^2-\sigma^{-1}$ 的多项式，$\lVert L_w\rVert_{\mathrm{op}}\le\sup_i|u_i-p_w|/\sigma_w$ 至多线性增长；能量本身用 `heat.tex:232-235` 的 $e_v\le\sqrt2(\lVert W_v\rVert_{\rm HS}^3+\lVert W_{v-1}\rVert_{\rm HS}^3)$ 归到边。边的立方界的高斯衰减逐字 `heat.tex:237-239`："Each edge norm cubed is bounded by a Gaussian in its two endpoint / centers, locally uniformly for $s>0$.  Indeed, the finite set of nodes is / bounded and $(u-p)^2\ge p^2/2-u^2$."。我验了这个基本不等式：$(u-p)^2=u^2-2up+p^2$，而 $-2up\ge-\tfrac{p^2}2-2u^2$（$2|up|\le\tfrac{p^2}2+2u^2$ 来自 $2ab\le\varepsilon a^2+b^2/\varepsilon$ 取 $\varepsilon=\tfrac14$），合并得 $(u-p)^2\ge\tfrac{p^2}2-u^2$ ✓。平面上 $|d|\le D$ 时 `heat.tex:241-243` 给 $p_0^2+p_1^2+p_2^2\le4(p_i^2+p_j^2)+3D^2$；我按 $2ab$ 拆分重推：记 $S=p_i^2+p_j^2$，$p_k=d-p_i-p_j$，则 $p_k^2\le2S+2d^2+S+d^2$（交叉项 $|{-2d(p_i+p_j)}|\le2\sqrt2\,|d|\sqrt S\le2d^2+S$），三坐标和 $\le4S+3d^2\le4S+3D^2$ ✓。$4$ 是 $(p_i+p_j)^2\le2S$ 与交叉项各贡献一份 $2S$ 与 $S$ 的合成，$3$ 是 $2d^2+d^2$，两个常数都由这步拆分唯一给出。

支配收敛的结论在 `heat.tex:246-249` 逐字：

```
This proves all needed differentiation statements
by dominated convergence.  The constants in this justification may
depend on the finite mesh and the compact parameter intervals; they will
not enter the uniform estimate.
```

机械理由（为什么这里允许"依赖网格的常数"）：这一段的常数只做求导合法化，不进入任何后续不等式；真正进入台账的是 $c_*$、$C_0$、$C_g$、$\tfrac53$ 这些一致常数。它与 `heat.tex:5-7` 的维数无关声明、`jumps.tex:107` 的 "independent of the mesh" 构成三层分工：合法化可以脏，最终界必须干净。

$\partial_d^2$ 的两条恒等式（`heat.tex:255-271`）：先逐字 `heat.tex:257-259` 给纯二阶 $\partial_d^2J_v=\int_{\Pi_d}\partial_{p_i}^2e_v\,\mathop{}\!\mathrm d\pi_d$ 对每个 $i$ 成立；交叉版本取 $p_j$ 为依赖坐标写 $\partial_dJ_v=\int\partial_{p_j}e_v$，再把依赖坐标换成 $p_k$ 求导，配 eq:heat-mixed 得 `heat.tex:266-268` 的 $\partial_d^2J_v=\int_{\Pi_d}Z_v\,\mathop{}\!\mathrm d\pi_d$。关键转折：我最初以为需要逐点恒等 $\partial_{p_i}^2e_v=Z_v$，这当然不成立（两者是不同的二次插入）；`heat.tex:270-271` 逐字把门关上："These are identities of integrated derivatives; no pointwise equality / between pure and mixed derivatives is required."。平面测度在换依赖坐标时绝对行列式为一（`heat.tex:48-49` 已立），所以两条积分路径同值，这就是第 6 节"det-one"约定的第二次消费、第 7 节平面积分的第三次消费。

候选失败路线 [推测]：逐顶点求导 $\partial_sJ_v$ 后试图各自单调。失败在符号：$-\partial_sJ$ 的负定性来自三个顶点的成本合并（邻居项经 lem:neighbors 吸收进 $V_w$），单个 $J_v$ 的 $s$ 导数含 $+\Sigma_\alpha Z_v$ 正项，没有丢弃对象。
候选失败路线 [推测]：用 lem:insertion 直接界 $Z_v$。失败在类型：insertion 只管对角 $b_P(K)$，双线性 $|\mathcal B_P(K,L)|$ 界只能从 `matrix.tex:55` 的 Cauchy--Schwarz 来，而该引理在 heat 线仅此一处消费；跳过它，`heat.tex:280` 的 $2Z_v\le Y_{v,v+1}+Y_{v,v-1}$ 就没有出处，`heat.tex:281-282` 的系数统计断裂。
候选失败路线 [推测]：在平面图上固定 $p_0$ 逐点界 $e_v$，放弃全平面的高斯支配。失败在积分可积性：$w_v(i)w_{v+1}(j)$ 的两个密度分居两个自由坐标，固定一个后另一个方向的界只给线性衰减，并非高斯，$\int_{\Pi_d}$ 发散，求导号下的支配不成立。

## 12 trace 收尾与 matrix 残留：零块支撑、排序技巧与 Loewner--Heinz

第 4 节把 $\tfrac53$ 与相位旋转写完，但 trace 证明里三处约定我标了"前向引用"没兑现：$\ker$ 包含、零特征值约定、$q_i$ 排序技巧；matrix 侧还剩 Daletskii 与 Loewner--Heinz 两段引文的功能没解释。这一节把它们落地。

`trace.tex:42-44` 逐字交代了证明的三段结构："We first put the three quadratic costs in a common metric. We then / estimate a cubic trace in an eigenbasis and recover the absolute value / of the original cyclic product by changing the phase of one edge."。第一段补支撑细节：`trace.tex:67-69` 给

```
 \ker A_v=\ker(P_vM)\subseteq\ker K_v,
 \qquad 0\le A_v\le M^2.
```

中间步骤：$A_v=MP_vM=(P_vM)^*(P_vM)$ 半正定，$\langle A_vx,x\rangle=\lVert P_vMx\rVert^2$（`trace.tex:71-72`）给出第一个等号。包含 $\subseteq$：$P_v$ 与 $D$ 交换（$D$ 是分块对角），所以 $P_vDMx=P_vDP_vMx$；若 $P_vMx=0$ 则 $K_vx=MP_vDMx=0$ ✓。$A_v\le M^2$ 由 $M^2-A_v=M(I-P_v)M$ 半正定。第二个细节是零特征值约定，`trace.tex:100-101` 逐字 "If either eigenvalue is zero, its summand is zero; pairs of zero / eigenvalues are omitted."，而 `trace.tex:152-153` 在二次出现情形特意补 "This also holds when $q_i=0$, without any / division by $q_i$."。我核对了后一句：两次出现情形的界走 $\bigl|\sum_{k>i}m_k|D_{ik}|^2\bigr|\le D_*\bigl(\sum_{k>i}q_k^2|D_{ik}|^2\bigr)^{1/2}$（`trace.tex:145-150`），拆分是 $u_k=q_k|D_{ik}|$、$v_k=|D_{ik}|$ 的 Cauchy--Schwarz 配 $\sum_k|D_{ik}|^2=\lVert De_i\rVert^2\le D_*^2$，全程无除法；合并成 $3D_*\sqrt{A_iE_i}$ 时 $q_i=0$ 两端同时为零，自洽。机械理由：$b_P$ 的定义依赖 $(\mathsf L_{\sqrt P}+\mathsf R_{\sqrt P})^{-1}$，零特征值对上分母消失，论文的处理是把相应求和项按支撑约定剔除（`matrix.tex:19-20` 的限制作用域 + `trace.tex:85-86` 的 "All these quadratic forms are taken on their supports; no / invertibility of $M$ is required."），并非取极限补值；这跟 lem:order 用 $\eta I$ 正则再 $\eta\downarrow0$（`matrix.tex:119-138`，第 3 节写过）是同一种两只手的交替。

排序技巧：`q_i=\lvert m_i\rvert$ 非增排列后，`trace.tex:117-118` 逐字 "Indeed, for $i<j$ we have $q_j\le q_i$, so / $2q_i/(q_i+q_j)\ge1$ whenever the denominator is positive."。我把 eq:trace-AE 的 $Q\ge\tfrac A2+E$ 完整重推：对角块求和项 $\tfrac{q_i^4}{2q_i}|D_{ii}|^2=\tfrac12A_i$ ✓；非对角对 $(i,j)$，$i<j$，$Q$ 中两份对称项合并为 $\tfrac{2q_i^2q_j^2}{q_i+q_j}|D_{ij}|^2$，与 $E_i$ 的成分 $q_iq_j^2|D_{ij}|^2$ 相比系数即 $\tfrac{2q_i}{q_i+q_j}\ge1$ ✓。$E_i$ 的定义（`trace.tex:104`）把 $j>i$ 的求和装进 $q_i$ 的权重里，正是为了让排序不等式逐项可用；若不排序，$2q_i\ge q_i+q_j$ 不成立，$Q\ge\tfrac A2+E$ 就断。

三次出现情形我补了一个第 4 节没写的细节：$\lvert m_i^3D_{ii}^3\rvert\le D_*A_i$ 的约化是 $|D_{ii}|\le D_*$（Hermitian $D$ 的对角元被算子范数控制），把 $D_{ii}^3$ 削成 $D_{ii}^2$ 恰好留下 $A_i=q_i^3|D_{ii}|^2$ 的形状 ✓。$6\operatorname{Re}\tau$ 的六我数过双重来源（第 4 节记 $\tfrac53=\tfrac{10}{6}$ 的分母）：`trace.tex:174-178` 逐字 "Because $M$ has zero diagonal blocks, a nonzero closed three-step / block product must visit all three vertices. The three starting / points in one orientation each give $\tau$, by cyclicity of the / trace. Reversing the orientation gives $\overline\tau$, since the / $D_v$ are Hermitian."。零对角块是"必须换顶点"的结构原因，而 $M$ 的定义（`trace.tex:49-53`）把对角留空正是设计点。

相位旋转段收尾在 `trace.tex:195-200`：逐字 "Applying \eqref{eq:trace-Q} and \eqref{eq:trace-cubic} to the modified / matrices, with $Q$ computed for the new $M$, gives" 与 "which is \eqref{eq:mixed-trace}. The case $\tau=0$ is immediate."。我起初想找一步"整体酉相似使 $M$ 谱不动"的构造，验算后发现论文走的是更朴素的路：$W_0\to zW_0$ 之后谱与迹链不要求不动，整条 trace-Q + trace-cubic 论证不依赖 $W_v$ 的具体相位，对变形后的矩阵逐字重跑即可；$R_v$ 侧的不变更靠 `trace.tex:186-192` 的三个共轭（右乘酉矩阵同时共轭 Gram 与插入，`trace.tex:192` "while $R_2$ is unchanged."）。取 $z$ 使 $z\tau=\lvert\tau\rvert$（`trace.tex:182-183`）后 $\operatorname{tr}((DM)^3)=6\lvert\tau\rvert$ 成立，一次旋转把"$\operatorname{Re}$ 丢失虚部"彻底消掉。

matrix 残留两段的功能：`matrix.tex:33-36` 逐字 "The square-root derivative used here is a case of the classical / divided-difference calculus for Hermitian matrix / functions~\cite[Section~1, Equation~(1)]{Daletskii1957}. / We give a direct inverse-function proof to keep the support conventions explicit."，也就是说 Daletskii 的差商演算是被作者主动放弃的现成机器，理由是支撑约定要逐字可见；这与第 2 节我的观察一致：本篇所有比较都发生在 $\sqrt{\ }$ 一层。`matrix.tex:113-117` 接着逐字 "inversion order proves that the / positive square root preserves order. This is the classical / Loewner--Heinz square-root monotonicity; see, for example, / Kwong~\cite[Theorem~1 and Section~2]{Kwong1975}. The supported / Hessian comparison below is derived from these order facts here."。机械理由：$t\mapsto t^t$ 型的幂函数算子单调只在幂指数属于 $(0,1]$（[外部推断]：Kwong 1975 的主题正是幂的算子单调性范围），$\sqrt{\ }$ 的指数 $\tfrac12$ 踩在上界内侧，所以 $P+\eta I\le a(Q+\eta I)\Rightarrow\sqrt{P+\eta I}\le\sqrt a\sqrt{Q+\eta I}$ 合法；如果 lem:order 想一步到位比较 $P^{3/2}$ 与 $Q^{3/2}$，指数 $1.5$ 越界，链直接失效。lem:order 绕开越界的方式正是把三次能量拆成"两个 $\sqrt{}$ 夹一个逆算子"，$a^{-1/2}$ 的衰减率就是这次绕路的过路费。这给了我第 2 节"对称点"清单的第三种形态：第一次是齐性次数相等（3 对 3），第二次是 Hölder 配对（$\tfrac32$ 对 3），第三次是算子单调指数的边界（$\tfrac12$ 对 $1.5$）。

候选失败路线 [推测]：用 Loewner--Heinz 一般幂版本（$0<\alpha<1$ 的 $\alpha$-Hölder 型算子不等式）替换逐项逆算子论证。[推测] 失败在常数：一般幂比较给出的衰减率是 $\alpha$ 的隐函数，而第 3、6 节全靠 $a^{-1/2}$ 的显式率；换成隐率后 `heat.tex:173` 的 $2^{-1/2}$ 与 `maximal.tex:82` 的 $\lambda^{1/4}$ 无法精确合成。
候选失败路线 [推测]：对 $M$ 直接用谱投影把 $Q$ 的定义延到零特征值对。失败在不等式方向：零对上的项若按极限赋值（分母 $\to0$、分子 $|D_{ij}|^2$ 不消失于支撑外），$Q$ 变大，$Q\ge\tfrac A2+E$ 与 $5D_*Q\ge6|\tau|$ 的一侧不再由 $\mathcal E$ 控制。剔除零对是 $\mathcal E\ge\tfrac12Q$ 成立的定义前提。

## 13 consequences 线：从 $2\log$ 到有理穷竭与联合主值

最后一条线最短但脏活最多，它的功能是把 mesh 上的代数定理变成 $L^3(\R^2)$ 的解析定理。我按消费顺序记四个关键引理。

lem:finite-truncations（`consequences.tex:16-40`）。逐字 `consequences.tex:22-25`：

```
 \left\|\int_{\varepsilon<|t|<R}
 |F(x+t,y)G(x,y+t)|\,\frac{\dd t}{|t|}\right\|_p
 \le 2\log(R/\varepsilon)\|F\|_3\|G\|_3.
```

中间步骤：`consequences.tex:30-32` 逐字 "For each fixed $t$, H\"older's inequality and translation invariance give / $\|F(\cdot+t,\cdot)G(\cdot,\cdot+t)\|_p\le\|F\|_3\|G\|_3$. / Minkowski's integral inequality proves"。逐 $t$ 的 Hölder 指数核对：$\tfrac1p=\tfrac23=\tfrac13+\tfrac13$，两个平移的 $L^3$ 范数不变（平移保持 Lebesgue 测度），Minkowski 积分不等式把 $\int dt/|t|$ 的绝对值挪进范数内，$\int_{\varepsilon<|t|<R}dt/|t|=2\log(R/\varepsilon)$ 的 $2$ 来自 $|t|$ 双侧。这条 $2\log$ 界是全篇唯一保留对数损失的地方，它的存在恰恰是为了说明：损失只在"绝对收敛性"这一步，主定理的 $C$ 与它无关。可测性与连续性段 `consequences.tex:33-39`：对可数环带 $1/n<|t|<n$，$n\ge2$ 应用上述界（`consequences.tex:33-34` 逐字 "Apply it to the countable annuli / $1/n<|t|<n$, $n\ge2$."），环带外公共零集上逐点绝对可积；端点连续性是 Lebesgue 积分的绝对连续性；代表元无关性靠把同一个界用于零 $L^3$ 差再走同一列环带（`consequences.tex:37-39`）。上确界可测的处理在 `consequences.tex:44-45` 逐字 "Endpoint continuity makes this supremum equal to the / one over positive rational endpoint pairs, so it is measurable."，这是第 8 节 `maximal.tex:224-230` 有理穷竭的连续统版本，两处同一个手法。

thm:main 的密度段（`consequences.tex:47-70`）逐字 `consequences.tex:52-54`："Fix a finite family of rational endpoint pairs.  The difference of the / two finite maxima of magnitudes is bounded by the sum of the corresponding / truncation differences.  Thus these maxima also converge in $L^p$."。我补的中间步骤：对两组数 $\{a_k\},\{b_k\}$，$\max_k|a_k|$ 与 $\max_k|b_k|$ 之差被 $\max_k|a_k-b_k|\le\sum_k|a_k-b_k|$ 控制，逐项 $L^p$ 收敛（固定端对的双线性收敛由 eq:elementary-bilinear 加双线性拆分给出）有限和也收敛，于是有限最大收敛；常数 $C_M$ 与族无关，穷竭有理对后用 $(3/2)$ 次幂的单调收敛。`consequences.tex:61-69` 再给连续延拓声明，逐字收尾："The bound just established makes the maximal map continuous from / $L^3\times L^3$ to $L^{3/2}$.  Density shows that it is the unique / continuous extension of its compact smooth values."。eq:maximal-continuity（`consequences.tex:63-66`）逐点 $|B_*(F,G)-B_*(f,g)|\le B_*(F-f,G)+B_*(f,G-g)$ 是次线性不等式，后面联合主值里出现两次 2 倍系数靠的就是它。

thm:bilinear-pv（`consequences.tex:72-136`）。光滑输入逐点联合极限的机制在 `consequences.tex:94-98`：截断积分改写为 $\int_\varepsilon^R\frac{h(t)-h(-t)}t\,dt$，逐字收尾 "Its numerator is $O(t)$ at zero and vanishes for large $t$, so it has a / joint limit at every point."。中间步骤：$h$ 光滑则 $h(t)-h(-t)=2t\cdot h'(0)/2+O(t^3)$ 消掉 $1/t$，大 $t$ 端由紧支撑归零。一般输入走振荡量 $\Omega_n$（`consequences.tex:102-113`）：$\Omega_n(F,G)\le\Omega_n(f_m,g_m)+2B_*(F-f_m,G)+2B_*(f_m,G-g_m)$，两个 $2$ 各来自一次 eq:maximal-continuity；$n\to\infty$ 首项归零（光滑情形对固定 $m$ 逐点已证，$L^p$ 尾由支配），取 $L^p$ 范数用 thm:main 界住余项（`consequences.tex:117-120`），再令 $m\to\infty$。`consequences.tex:121-123` 逐字 "The right side tends to zero with $m$.  Hence the limiting oscillation / is zero almost everywhere.  This is the Cauchy criterion for all pairs / of endpoints in the indicated tails"，注意判的是所有端点对的 Cauchy 条件，联合极限由此而来；可测性取一列共尾端点对（`consequences.tex:124-125`）；$L^p$ 收敛由 $\Omega_n\le2B_*\in L^p$ 的支配收敛升级（`consequences.tex:127-132`）。双线性靠范数极限传递，唯一性靠稠密（`consequences.tex:133-136`）。

prop:flat-equivalence 与最优常数（`consequences.tex:184-243`）。逐字 `consequences.tex:199` "Use the determinant-one change of variables"，映射 $x=-a$、$y=-b$、$t=a+b+c$ 与三对 $(a,b)\mapsto(x,y)$ 型映射互逆，`consequences.tex:213-214` "Each pair map has determinant one.  Their inverses are"，保 $L^3$ 范数、紧光滑性与 Schwartz 类（`consequences.tex:219`）。截断区域对应：$\varepsilon<|a+b+c|<R$ 即 $\varepsilon<|t|<R$ ✓。常数段：`consequences.tex:223-224` 逐字 "The inverse maps realize every simplex triple, which proves equality / of the two optimal scalar constants."，反向映射满射是"最优常数相等"的全部理由。对偶段把 $C_S$ 与逐点极大常数接线，`consequences.tex:236-241` 逐字：

```
 H=\frac{\overline U}{|U|}\,
       \frac{|U|^{1/2}}{\|U\|_p^{1/2}},
```

"has $L^3$ norm one and satisfies / $\int HU=\|U\|_p$"。指数 $\tfrac12$ 的机械理由我按唯一性推一遍：设 $|H|=c|U|^\beta$，$\|H\|_3=1$ 要求 $3\beta=p=\tfrac32$，$\beta=\tfrac12$ 是唯一解；此时 $\int HU=c\int|U|^{3/2}=c\|U\|_p^{3/2}$，取 $c=\|U\|_p^{-1/2}$ 得 $\int HU=\|U\|_p$ ✓。这与第 8 节测试数组的 $a=\tfrac12$（$a+1=\tfrac32$）是同一条 Hölder 对偶在连续侧的投影；$C_S$ 之后逐字 "The pointwise maximal optimal constant is at least / $C_S$."（`consequences.tex:242-243`），把标度最优常数下推到逐点极大。

cor:scalar-pv（`consequences.tex:147-169`）一句话过：$\lvert\mathcal L_{\varepsilon,R}\rvert\le2\log(R/\varepsilon)\prod_v\lVert F_v\rVert_3$ 的绝对可积（`consequences.tex:161-162`）给 Fubini 换序，截断形式识别为 $\int F_0B_{\varepsilon,R}(F_1,F_2)$（`consequences.tex:163-164`），端点一致界用 thm:main（配对 $(\tfrac32,3)$），联合标度收敛用 thm:bilinear-pv 的 $L^{3/2}$ 范数极限与 $F_0$ 配对。`consequences.tex:179-182` 把 flat 与 simplex 的等价归给 [外部推断] 的文献先例："The flat and simplex scalar formulations, including equality of their / optimal norm constants, are already related in / \cite[Appendix~B.1]{KovacThieleZorinKranich2015}. We record explicit / norm-preserving maps and track both finite endpoints and their joint limit."，作者的增量在"跟踪有限端点与联合极限"，这正是逐字引 map 的原因。

候选失败路线 [推测]：跳过 $\Omega_n$ 振荡量，用截断算子列的范数 Cauchy 性直接得主值。失败在收敛类型：截断族在算子范数拓扑下从不 Cauchy（端点内缩外扩总留有对数质量的尾巴），必须先拿到逐点 a.e. 极限再靠 $2B_*\in L^p$ 的支配升级，`consequences.tex:130-131` 的支配收敛是不可绕的。
候选失败路线 [推测]：用非可数端点族的逐点上确界可测性引理（完备测度空间上的上半连续版本）替换有理穷竭。[推测] 失败在工程面：$B_{\varepsilon,R}(F,G)$ 对端点的上半连续性需要逐 $t$ 被积函数的连续性预算，而 lem:finite-truncations 的端点连续只在好点上成立；有理穷竭把问题压回"可数上确界可测"这条零成本路。

勘误补记（追加更正，不动原文）：第 9 节所称"(8.5) 式"与第 10 节所称"(8.10)"分别指 `jumps.tex:44-47`（离散高斯极大比较）与 `jumps.tex:296-297`（单尺度跳界），下文台账按此对齐；第 8 节首行引文里我抄录 `maximal.tex:3` 时把宏 `sec:jumps` 误打为 `sec{jumps}`，原文以 `maximal.tex:3` 为准；第 9 节一处来源把 `jumps.tex:288-289` 的 "The starred quantities depend only on the original arrays and the / output indices, not on the scale $\tau$." 标成了 289--290。

## 14 Lean 机器侧取证一：main_estimate 到底声明了什么

第 1 节记下 `formalization.yaml:1610-1612` 的三条线索（comparator json、declaration `OAI.TriangularHilbert.main_estimate`、file `OAI/Analysis/TriangularHilbert/Main.lean`），本节兑现前两条加 json。入口文件 `Main.lean` 只有 47 行，声明体在 `Main.lean:38` 逐字 "theorem main_estimate : MainEstimate := by"。目标类型住在 `Model.lean:40-45`，逐字：

```
def MainEstimate : Prop :=
  ∃ C : ℝ≥0, ∀ F G : Plane → ℂ,
    MemLp F 3 volume → MemLp G 3 volume →
    (∀ᵐ z ∂volume, GoodPoint F G z) ∧
    AEMeasurable (maximal F G) volume ∧
    maximalNorm F G ≤ (C : ℝ≥0∞) * eLpNorm F 3 volume * eLpNorm G 3 volume
```

拆件逐条对位论文：(1) `Plane := ℝ × ℝ`（`Model.lean:12`）；(2) `Endpoints` 是带字段 `lower_pos : 0 < lower`、`lower_lt_upper : lower < upper` 的结构（`Model.lean:14-18`），`maximal` 的上确界 `⨆ E : Endpoints`（`Model.lean:35`）跑遍整个类型，论文散文的 "The supremum is over both finite hard truncation endpoints"（`introduction.tex:23`）在机器里由结构字段保证"两端都有限"，类型里根本不存在无穷端点；(3) `GoodPoint`（`Model.lean:28-30`）逐字把 lem:finite-truncations 的好点写成"每个环带 $1/(n+2)<|t|<n+2$ 上 integrable"，`maximal` 定义里 `if GoodPoint ... else 0` 对应论文 "and set it to / zero elsewhere"（`consequences.tex:43-44`）；(4) 输出范数 `maximalNorm` 在 `Model.lean:37-38` 逐字 "(∫⁻ z : Plane, maximal F G z ^ ((3 : ℝ) / 2)) ^ ((2 : ℝ) / 3)"，ENNReal 值的 $L^{3/2}$ 准范数。

对称点进入类型的方式我数出三层。第一层是指数字面量：输入侧 `MemLp F 3 volume` 与 `eLpNorm F 3 volume` 的 3，输出侧 `((3 : ℝ) / 2)` 与 `((2 : ℝ) / 3)`，配对关系 $\tfrac1{3/2}=\tfrac13+\tfrac13$ 不写在任何注释里，写在这两个 $\mathbb R$ 字面量的互相还原上（`^ ((2:ℝ)/3)` 是取 $3/2$ 次幂的逆）。第二层是齐性链：`Main.lean:41` 逐字 "simpa only [eLpNorm_cyclicB hF,eLpNorm_cyclicC hG] using"，归一化引理 `eLpNorm_cyclicB/C` 把 $\mathbb R^2$ 输入范数搬到 cyclic 坐标，`CyclicHomogeneity.lean:11-12` 的 `cyclicNorm` 用同一对指数字面量，改任何一处这条 simpa 立刻断。第三层是三顶点结构：`MatrixSupport.lean:976-977` `abbrev Three := Fin 3`、`abbrev BlockSpace (ι : Type uι) := Three × ι`，`triangleBlocks`（`:995`）把 `trace.tex:49-53` 的零对角块矩阵逐块写死，循环三步路的"三"在机器里是类型 `Fin 3`。

证明体四行（`Main.lean:38-42`）：见证 `mainConstant`，三元组装 `ae_goodPoint`、`aemeasurable_maximal`（`Main.lean:19-23`，走 `measurePreserving_reflect` 与 `aemeasurable_cyclicMax`）和范数不等式；中间引理 `maximal_eq_cyclicMax_ae`（`Main.lean:11-17`）逐字给 "maximal F G =ᵐ[volume] (fun z => cyclicMax (cyclicB F) (cyclicC G) (-z))"，反射 $z\mapsto-z$ 的测度保持把 flat 极大换成循环极大；`maximalNorm_eq_cyclicNorm`（`Main.lean:25-36`）用 `Homeomorph.neg` 的 lintegral 换元。所以 main_estimate 的全部实质量收缩在 `CyclicNorm.lean:39-40` 的 `cyclicNorm_le`：`mainConstant` 定义在 `CyclicNorm.lean:11`，逐字 "(2*momentConstant)^((2:ℝ)/3)"；`momentConstant` 在 `DiscreteMax.lean:15`，逐字 "def momentConstant : ℝ := 4*hardPairingConstant*(hardPairingConstant+1)"。机械理由（结构层面）：指数 $\tfrac23$ 与 maximalNorm 的 $\tfrac23$ 同底，因为单位归一后先界 $(3/2)$-矩再回乘；分子的 $2$ 来自双线性两输入，`CyclicNorm.lean:37` 逐字 "show momentConstant*((1:ℝ)+1) = 2*momentConstant by ring"。`hardPairingConstant` 我只引用它的正性（`DiscreteMax.lean:16-19` 的 `momentConstant_pos` 与 positivity），[推测] 它是论文 prop:selected-kernel 那条链上常数 $C$ 的机器名，其值沿有限组合链不透明，机器满足于有限且正，第 7 节 $C_0/c_*=67.11$ 型的具体数值在机器侧被放弃了追踪。

比较器 json 共 14 行：`challenge_module` 与 `solution_module` 在前两键（:2-3），`theorem_names` 只列一项 `"OAI.TriangularHilbert.main_estimate"`（:4-6），`definition_names` 空（:7），公理白名单位于 `TriangularHilbert.json:8-12`，逐字：

```
  "permitted_axioms": [
    "propext",
    "Quot.sound",
    "Classical.choice"
  ],
```

三枚恰是 Mathlib 默认三件套：外延性、商同余、选择。白名单外零添加，尤其没有任何序完备性或新选择公理，`enable_nanoda` 为 false（:13），判定性自动化也不允许。我在全模块（105 个 `.lean`，目录内递归，未出模块）grep 了 `sorry`，零命中，所以整条 main_estimate 证明的公理负担被压缩到：`Classical.choice` 被 `Model.lean:33` 的 `classical` 战术块消费（`GoodPoint` 的可判定性与 `Endpoints` 上确界的处理），`propext`/`Quot.sound` 被 ENNReal 与 lintegral API 消费，其余全靠构造。[推测] 三枚公理的白名单是比较器的通用默认（这篇没被特批任何额外公理），也印证第 1 节"没有致谢没有版本历史"的风格：作者对机器侧的要求同样是最小可查。

## 15 Lean 机器侧取证二：MatrixSupport.lean 的 90,327 B 承担什么

模块文件尺寸梯度极陡（`ls -la` 实测）：MatrixSupport.lean 90,327 B、1,920 行；第二名 Support.lean 11,643 B；再后 PlaneIntegral.lean 8,940、PlaneDom.lean 8,749、TotalJump.lean 8,372、HeatBound.lean 7,740、HeatCost.lean 7,532、HeatContinuous.lean 7,306、GroupedGaussian.lean 7,062、SelectedScale.lean 6,961、SignedTraceOrder.lean 6,867、PlaneTime.lean 6,758、GramDeriv.lean 6,534、HeatStar.lean 6,108、WeightedStar.lean 6,047。最大者是次大者的 7.8 倍，我读完整份声明清单（`grep -nE '^(theorem|lemma|def|...)'` 共约 170 条声明）后的判断：它一个文件是 matrix.tex、trace.tex 两节全部加上 jumps.tex 梯度段的机器之家。按主题分五段（行号都出自同一份 grep）：

第一段 `:12-333`，逐元三次求和。`cyclic_sum_insert`（:12）、`spectralWeight`（:159）、`cubicTerm`（:192）与三条分情形界 `norm_cubicTerm_diag_le`（:198）、`norm_cubicTerm_twice_le`（:210）、`norm_cubicTerm_once_le`（:223）、总装 `norm_cubic_sum_le`（:265）、对角迹 `trace_cube_mul_diagonal`（:306）。这正是第 12 节"最小下标出现一/二/三次"的逐条机器化：论文一句话的轨道计数，在这里每个情形都有一条独立引理，因为循环置换不变性必须由 `cubicTerm_cyclic`（:195）单独证明后才能复用。

第二段 `:335-865`，变分式 Hessian。核心定义链：`sylv`（:387）是 $AX+XA$，`penalty`（:408），`variation`（:432），`rootCost`（:434）逐字：

```
def rootCost (A K : Matrix ι ι ℂ) : ℝ := (3 / 2 : ℝ) * sSup (Set.range (variation A K))
```

论文把 $\mathcal B_P(K,K)$ 写成 $(\mathsf L_{\sqrt P}+\mathsf R_{\sqrt P})^{-1}$ 的内积（`matrix.tex:22-28`），机器里零谱上逆不可表示，于是改写成二次最大化：$A=\sqrt P$ 时对 $X$ 取 $\operatorname{sSup}$ 的 $\mathrm{variation}(A,K,X)=2\langle K,X\rangle-\langle X,\mathcal L_A X+\mathcal R_A X\rangle$ 恰在 Sylvester 解处给出逆算子值（`rootCost_eq_of_solution` :442），无解时仍良定。配套的代价是整条正则化链：`variation_bddAbove`（:457）、`rootCost_antitone`（:475）、`rootCost_scale`（:484）、`sylv_solvable_of_bddAbove`（:747）、`rootCost_le_of_order`（:1464）。`hessianCost`（:570）定义为 `rootCost (CFC.sqrt P) K`；`energy`（:667）是 $\operatorname{tr}(P\sqrt P)$；`energy_hasFDerivWithinAt`（:682）逐字实现 `matrix.tex:42` 的一阶导；`sylv_diagonal_apply`（:502）与 `rootCost_diagonal`（:521）是 eq:hessian-metric 逐项公式的诊断台；`penalty_three_identity`（:792）加 `rootCost_three_le`（:800）就是 `trace.tex:81` 三向量不等式（我第 4 节标的那个 $\tfrac13$）的机器形态。

第三段 `:867-1258`，块矩阵与 lem:mixed-trace 本体。不变性搬运链 `traceReal_unitary_conj` 等（:537-558）与第二批 `hessianCost_unitary_conj`（:898）执行 `matrix.tex:81-85` 的"酉共轭与零延拓不改能量"；构造层 `triangle`（:1000）、`blockD`（:1001）、`triangle_trace_cube`（:1021）、`vertexProj`（:1053）、`rowStar`（:1086）、`starGram`（:1088）、`starInsert`（:1090）逐块复刻 `trace.tex:47-65`，其中 `starGram_eq`（:1093）与 `starInsert_eq`（:1099）就是 "after a permutation of blocks / and extension by zero" 那两句；相位段 `phaseEdge`（:1198）、`rowPhase`（:1201）、`starCost_phase`（:1219）、`exists_phase_norm`（:1230）实现 `trace.tex:182-192` 的一次旋转；封装点 `mixed_trace_le`（:1242）即 lem:mixed-trace。

第四段 `:1258-1538`，正则化、谱面事实与两个序界。`regularize`（:1263）加 `continuous_sqrt_matrix`（:1275）；`energy_diagonal`（:1311）、`energy_spectral`（:1315）、`energy_eq_of_charpoly_eq`（:1321）给出特征多项式路线；`energy_gram_flip`（:1327）即 $\Phi(T_v)=\Phi(S_v)$（`trace.tex:22`）；`gradient_gram`（:1338）与 `energyGradient_gram`（:1348）是 lem:rank-change 积分式（`jumps.tex:122-128`）的固定形状版本，路径形式在 `energy_path_hasDerivAt`（:1852）；`hessianCost_inserted_gram_le`（:1509）是 lem:insertion，含 $\tfrac34$；`hessianCost_le_of_le_smul`（:1620）是 lem:order 的用法形态。

第五段 `:1541-1920`，邻居比较与逐元梯度。`blockD` 系列（:1545-1596）把分块对角 Gram 的 $b$ 值往下压；`wideRow`/`gramRow`/`pinchedRow`（:1641/:1644/:1647）与 `gramRow_le_two_pinchedRow`（:1666）即 `heat.tex:169-170` 的 $T_w\le2Q$；`hessianCost_gramRow_ge_edges`（:1685）是"丢非对角块"那半步（`heat.tex:174-178`）；`centerGram`（:1758）、`edgeGram_le_centerGram`（:1778）对 $A^*A\le S_{w+1}$；`neighbor_comparison`（:1786）是 lem:neighbors 本体（含 $\sqrt2$）；`sqrtInverse`（:1807）、`hessianPairPD`（:1817）、`two_hessianPairPD_le`（:1833）对 `matrix.tex:55` 的 Cauchy--Schwarz（第 11 节 2|Z| 界的唯一供给点）；`rowNorm`/`colNorm`（:1879/:1880）加 `colNorm_sqrt_gram`（:1901）加 `entry_gradient_le`（:1910）逐字实现 `jumps.tex:130-133` 的行列范数乘积界。

为什么一个文件要 1,920 行 [推测]：三重机器成本叠加。支撑约定：论文里"supported on $P$ 即在 $\ker P$ 两侧为零"（`matrix.tex:14-15`）是一句话加一个极限论证（`matrix.tex:135-138`），机器里必须 PosDef 分支与半正定 sSup 双轨并行，每个不变性都要重挂一遍有界性引理。指标搬运：论文的"换块与零延拓"在 Lean 里是 BlockSpace 上的显式双射，`starGram_eq_gramRow`（:1727）、`insertRow_eq`（:1654）这类"同一句话的粘合层"就有四条以上。可判定性基础设施：`[Fintype ι] [DecidableEq ι]` 在文件里成对出现三十多处，逐元和 Finset 求和都要它。结论：这个文件的大小与我第 1 节读到的论文风格同源，论文省略的每一句"显然"，机器侧摊成一条可命名引理；90,327 B 恰好是 matrix 加 trace 两节省略密度的总和。下游消费链我也用单文件内 grep 确认：Support/HeatStar/GramDeriv 吃第二、四段，TotalJump 吃 entry_gradient_le，SelectedScale 与 DiscreteMax 吃第一段，SignedTraceOrder 吃第三段，`Main.lean:1` 唯一直接 import 是 TruncationCoordinates（逐字 "import OAI.Analysis.TriangularHilbert.TruncationCoordinates"），其余经它传递。

候选失败路线 [推测]：我曾假设巨型文件是战术样板复制（生成物）。核对声明名与定义体后放弃：`rootCost` 用显式 `sSup (Set.range ...)` 手工构造，各引理陈述互不相同，没有同构重复。
候选失败路线 [推测]：把 Φ 的光滑性整体外包给谱演算或 `CFC` 的一揽子引理。机器实际走 `hasFDerivAt_square`（:614）加 `sqrt_smoothWithin_posDef`（:627）的逐层链，配合 `sqrt_smul`（:621）这类小引理，因为正定锥内的平方根光滑需要 `matrix.tex:59-68` 的逆函数论证对应物，mathlib 没有现成的矩阵平方根 $C^\infty$ 陈述可直接引用。

## 16 台账

全篇常数与增长率总账。第一列符号，第二列实测值或增长率，第三列出处精确到行，第四列写直接消费者，第五列写改动后第一个断裂点。机器侧出处用文件:行，论文侧用 tex:行。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\lambda$ | $1.1$，容许走廊 $(1,\,1.20711)$ | heat.tex:49 | lem:plane-dissipation heat.tex:286-288 与 $D_v$ maximal.tex:47 | 逼近上沿则 $c_*$ 归零，逼近下沿则 $D_v$ 一致界爆炸 |
| $c_*$ | $0.075736$ | heat.tex:204 | heat.tex:344-346 与 jumps.tex:346 的 telescoping | 放大任何一份负余量，严格耗散消失 |
| $C_0$ | $2\sqrt2(1+\sqrt{2/\pi})=5.0827$ | heat.tex:304 | jumps.tex:354-355 的初能量接口 | $\sqrt2$ 或 $M$ 改动后 masked-dissipation 右端 $C$ 走形 |
| $C_0/c_*$ | $67.11$ | heat.tex:346 | jumps.tex:193 的 $\le C\mathcal S(A)$ | 两个上游引理任一改动，先在这里显形 |
| $M$ | $1+\sqrt{2/\pi}=1.79788$ | heat.tex:322 | $C_0$ 的构造 heat.tex:322-332 | 松开 $\sigma\ge h^2$ 后网格质量无界，$M$ 不存在 |
| $a^{-1/2}$ | $2^{-1/2}$ 于 $a=2$ | matrix.tex:94 | heat.tex:173 与 maximal.tex:79-82 | 改成 $a^{-1}$ 则邻居界 $\sqrt2\to2$，第 6 节走廊宽度不够 |
| $\tfrac34$ | $0.75$ | matrix.tex:151 | heat.tex:213-214 支配链 | 放大后支配函数不再是可积高斯控制 |
| $\tfrac53$ | $\tfrac{10}{6}$ | trace.tex:35 | maximal.tex:84-85 的 lem:mixed-trace 调用 | 轨道计数改则，$6\operatorname{Re}\tau$ 的分母失据 |
| $6$ | $3$ 个循环起点 $\times$ 两个方向 | trace.tex:174-180 | trace.tex:198 的 $6\lvert\tau\rvert\le5D_*Q$ | $D_v$ 去 Hermitian 后反向不再是 $\overline\tau$ |
| $\tfrac13$ | 三向量二次型不等式 | trace.tex:81 | trace.tex:76-84 公共度量链 | 分块独立估计则 $MDM$ 整体丢失 |
| $\tfrac12$ | $\partial_\sigma w=\tfrac12\partial_p^2w$ | heat.tex:127 | heat.tex:137-140 的消元 | 两处 $\tfrac12$ 任一改动，$V_v$ 混入一阶 $\mathrm d\Phi$ 项 |
| $\Sigma_\alpha$ | $16/5$ | heat.tex:286 | heat.tex:281-282 的系数统计 | 排列改为两窄一宽则邻居系数符号翻转 |
| $-1+\tfrac35\sqrt2$ | $-0.15147$ | heat.tex:288 | $c_*$ 的 min 取值 | 窄顶点负余量清零，耗散退化 |
| $\tfrac{\lambda}{\sqrt{e(\lambda-1)}}$ | $2.1098$ | maximal.tex:53 | $D_*$ 因子 maximal.tex:86-88 | $\lambda\to1^+$ 爆炸且无点可换 |
| $\lambda^{1/4}$ | $1.0241$ | maximal.tex:82 | eq:masked-window-integral maximal.tex:89-92 | $a=\sqrt\lambda$ 的二次使用被拆开则指数错乱 |
| $C_g$ | $3.2998$ | jumps.tex:104-105 | $6C_g$ jumps.tex:304 | $a=\sqrt\sigma/h\ge1$ 松开则环分割失效 |
| $18\sqrt2$ | $25.456$（$q=\tfrac32$ 代入 $\tfrac{6q2^{q-1}}{q-1}$） | jumps.tex:40 | 切片范数 jumps.tex:316-319 | 隐式插值常数进入则台账断链 |
| 弱型常数 $3$ | 三倍覆盖 | jumps.tex:35 | jumps.tex:72-74 的 $6=3/(1/2)$ | 非中心化覆盖改值且丢 $r=0$ 情形 |
| $2\lvert A_0(i,j)\rvert$ | 单区间示性全变差 | jumps.tex:299-301 | eq:total-jump-majorant jumps.tex:303-305 | 多区间掩膜则变 $2\times$ 区间数，端点计数回流 |
| 导数因子 $3$ | $\tfrac32\times2$ | jumps.tex:125 | jumps.tex:236-238 | 能量次数改动则该因子的合成瓦解 |
| $6C_g$ | $19.799$ | jumps.tex:304 | eq:total-jump-bound jumps.tex:329-332 | 初能量吸收不动则 telescoping 右端溢出 |
| $(1+v)^{-2}$ | 包络衰减率 | maximal.tex:250 | 壳层求和 maximal.tex:312-317（$4\cdot2^{-k}$） | 率 $1$ 时几何级数发散，逐点控制失效 |
| $c_0$ | $-\tfrac{2}{3\sqrt{6\pi}}=-0.15355$ | maximal.tex:246 | maximal.tex:353-363 | $\psi=k_1^{*3}$ 锁定，无法归一化掉 |
| $\lvert c_0\rvert^{-1}$ | $6.5124$ | maximal.tex:363 | $C_M$（consequences.tex:14 记名） | 该因子线性进入 $C_M$ 与 $C_S$ |
| $2\log(R/\varepsilon)$ | 对数质量 | consequences.tex:25 | lem:finite-truncations；cor:scalar-pv consequences.tex:161-162 | 主定理要消的 $\log$ 只活在绝对收敛层，改动则 Minkowski 步断 |
| $(2a^3+b^3)/3$ | Young 系数 | jumps.tex:334 | eq:total-jump-bound 收尾 | 三次齐性错配则到 $\mathcal S(A)$ 的最后一步断 |
| $\sigma\ge h^2$ | 网格尺度下界 | jumps.tex:43 | jumps.tex:91-98 与 heat.tex:300 | $s\to0$ 时初能量发散，$C_0$ 失效 |
| $4S+3D^2$ | 平面高斯控制 | heat.tex:241-243 | heat.tex:244-249 支配收敛 | 两常数各由一次 $2ab$ 拆分给出，收紧即假 |
| maximalNorm 指数对 | `(3:ℝ)/2` 与 `(2:ℝ)/3` | Model.lean:37-38 | MainEstimate Model.lean:40-45；CyclicHomogeneity.lean:11-12 | 字面量改动则对称点更名不副实，simpa 断 |
| 测试指数 $\tfrac12$ | $a+1=\tfrac32$ 与 $3\beta=\tfrac32$ 的唯一解 | maximal.tex:165；consequences.tex:237-238 | eq:discrete-finite-maximum；$C_S$ 对偶段 | 改动后归一化与配对不能同时成立 |
| $\text{iota}$ 侧 $h^2$ 网格测度 | $h^2$ 双指标质量 | heat.tex:53；DiscreteMax.lean:13 | $\mathcal S(A)$ 全部消费点；matrixCubic | 换成 $h$ 的单指标计数则齐性与 $\Phi$ 三次不配 |
| `Three := Fin 3` | 三顶点硬类型 | MatrixSupport.lean:976-977 | rowStar :1086；triangleBlocks :995 | 顶点数改变则循环三步路不再闭合 |
| `mainConstant` | $(2\cdot\text{momentConstant})^{2/3}$ | CyclicNorm.lean:11 | cyclicNorm_le CyclicNorm.lean:39-40；Main.lean:39 | 见证改动则 coe_mainConstant（:13-15）重证，矩界重挂 |
| 公理白名单 | `propext`、`Quot.sound`、`Classical.choice` | TriangularHilbert.json:8-12 | 比较器复核 main_estimate | 增删任何一条或引入 `sorry` 即复核失败（模块 grep 实测无 `sorry`） |

台账读法补两句：第 6、7 两行的 $c_*$ 与 $C_0$ 在第 14 节的机器侧都只以"有限且正"存在（`hardPairingConstant` 不透明），所以论文数值链与机器存在性链在本表里分属两种"被谁消费"；末行三枚公理里 `Classical.choice` 的可见消费点在 `Model.lean:33` 的 `classical` 块，`propext` 与 `Quot.sound` 藏在 ENNReal/lintegral API 之下，这是论文读者最容易完全忽略、机器复核却逐条点名的部分。