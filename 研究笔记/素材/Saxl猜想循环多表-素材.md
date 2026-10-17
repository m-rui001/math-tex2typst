# Saxl 猜想的循环多表（Cyclic Polytabloid）证明 —— 研究素材

> 素材来源：
> - 论文 TeX 源码：`E:\math\preprints\A-Cyclic-Polytabloid-Proof-of-Saxls-Conjecture-September-24-2026\build\paper.tex` 与 `build\sections\{introduction,specht-tools,dominance,band-quotient,path-band,completion}.tex`（2026-09-24, 作者 OpenAI）
> - Lean 形式化：`E:\math\lean\formalization.yaml` 登记 `comparator_config: ComparatorChallenges/Saxl.json`，`declaration: OAI.Saxl.saxl_conjecture`，`file: OAI/RepresentationTheory/Saxl/Main.lean`；模块目录 `E:\math\lean\OAI\RepresentationTheory\Saxl\`（39 个文件，共约 7558 行）
>
> 用途：供撰写"第一人称反推思维链"笔记。所有 LaTeX 引用均照抄 TeX 源码。论文之外的推断一律标 [推测]。

---

## 一、定理总览

### 1.1 主定理（Saxl 猜想）—— TeX 原文照抄

论文摘要：

> For every staircase partition, we prove that the tensor square of the
> corresponding irreducible complex representation of the symmetric group
> contains every irreducible representation of that group. This proves
> Saxl's conjecture.

主定理（`sections/introduction.tex`，Theorem 1.1）：

```latex
\begin{theorem}[Saxl's conjecture]\label{thm:saxl}
For every integer $m\ge1$ and every partition $\lambda\vdash N_m$,
\[
g(\rho_m,\rho_m,\lambda)>0.
\]
Equivalently, $S^{\rho_m}\otimes S^{\rho_m}$ contains every irreducible
complex representation of $S_{N_m}$.
\end{theorem}
```

其中基本记号（引言 (1.1) 式）：

```latex
N_m=\frac{m(m+1)}2,\qquad \rho_m=(m,m-1,\ldots,1).
```

Kronecker 系数定义：

```latex
g(\alpha,\beta,\lambda)
=\dim\Hom_{S_n}(S^\lambda,S^\alpha\otimes S^\beta)
```

即 $S^\lambda$ 在对角作用下张量积 $S^\alpha\otimes S^\beta$ 中的重数。

**Saxl 猜想的内容**：对每个阶梯（staircase）分拆 $\rho_m=(m,m-1,\dots,1)\vdash N_m$，其对应不可约表示的张量平方 $S^{\rho_m}\otimes S^{\rho_m}$ 包含 $S_{N_m}$ 的**每一个**不可约表示。历史背景（引言 1.1 小节，论文原话要点）：

- Saxl 于 2012 年 3 月 20 日在 UCLA 组合讨论班上提出该断言（由 Pak–Panova–Vallejo 记录，`\cite[Conjecture~1.2 and Footnote~2]{pakpanovavallejo2016}`）。
- 此前已知的部分结果：Ikenmeyer 证明了 $\lambda$ 与 $\rho_m$ 支配序可比时的正性；Pak–Panova–Vallejo 处理了 hook 与两行分拆（充分大 $m$）；Bessenrodt 处理双钩（double hook）；Li 处理三钩（triple hook）；Bessenrodt–Bowman–Sutton 用 2-模分解数覆盖了全部 2-高度零成分（即全部奇次数表示）；Harman–Ryba 证明了**张量立方**的全覆盖；Luo–Sellke 证明了渐近覆盖率趋于 1。注意"渐近覆盖不排除例外成分，而立方/四次幂多用了张量因子，二者都给不出平方断言"——这正是本定理的缺口。
- 前驱结果：Brown–van Willigenburg–Zabrocki 证明 $S^{(m,m-1)}\otimes S^{(m,m-1)}$ 是所有行数不超过 4 的 $S_{2m-1}$ 不可约的无重数直和（`\cite[Corollary~4.1]{brownwilligenburgzabrocki2010}`）。本论文需要的是"每个成分都出现在**一个指定的带状生成子**的循环模里"这一更强结论。

### 1.2 更强的循环（cyclic）定理——论文真正证明的对象

构造（引言 1.2 小节 + `sections/dominance.tex` (2.2)–(2.4) 式）：

把 $N_m$ 个张量位置放进三角形 $B_m=\{(i,j):i,j\ge1,\ i+j\le m+1\}$。设 $R_m,C_m$ 为其行、列集合分划（行内按 $j$ 递增排序，列内按 $i$ 递增排序）。取 $\C^m$ 的有序基 $e_1,\dots,e_m$。在长度为 $r$ 的块上用 $e_1,\dots,e_r$ 交错化（signed sum over all permutations），行块连乘得 $v_{R_m}$，列块连乘得 $v_{C_m}$——这两个都是阶梯型的 polytabloid。核心对象：

```latex
W_m=\C[S_{B_m}](v_{R_m}\otimes v_{C_m}),
```

其中 $S_{B_m}$ 同时置换两层的位置。

```latex
\begin{theorem}[Cyclic staircase support]\label{thm:cyclic-saxl}
For every $m\ge1$ and every partition $\lambda\vdash N_m$, the irreducible
$S^\lambda$ occurs in $W_m$.
\end{theorem}
```

由 $\rho_m^t=\rho_m$ 与 polytabloid 引理，$V_R:=\C[G_m]v_{R_m}\cong S^{\rho_m}$、$V_C\cong S^{\rho_m}$，故 $W_m\subseteq S^{\rho_m}\otimes S^{\rho_m}$，于是 cyclic-saxl $\Rightarrow$ Saxl。论文强调："The proof establishes it inside one explicitly generated submodule of the tensor square, a stronger conclusion that retains the vector needed at each induction step."（证明在张量平方的一个显式生成子模内建立结论——更强的结论，且在每步归纳中都保留了所需的向量。）

### 1.3 证明概览（五步骨架）

1. **支配情形（起点）**——Proposition `prop:dominated`（§2, dominance.tex）：若 $\rho_m\unrhd\lambda$，则 $S^\lambda$ 出现在 $W_m$。机制：符号扭曲 + 行子群的符号平均把 $W_m\otimes\epsilon$ 的像化到含 $Z_m=\C[G](v_{R_m}\otimes v_{R_m})$ 的模，再用一个"逐位置加法 $q(e_a\otimes e_b)=f_{a+b-1}$ + 内容投影"的 $G$-等变映射把 $Z_m$ **满射**到置换模 $M^{\rho_m}$；由 Young 规则 $M^{\rho_m}$ 含所有 $\tau\unrhd\rho_m$ 的 $S^\tau$，取 $\tau=\lambda^t$ 再扭回符号即可。
2. **切割带（band）得到满诱导商**——Lemma `lem:sector-induction` + Proposition `prop:band-quotient`（§3, band-quotient.tex）：固定 $s\in\{1,2\}$，$h=m-s$，把小三角形 $D=B_h$ 从带 $F=B_m\setminus D$ 中分离。定义逐位置投影 $P_s$：保留"两个字母同高或同低"的字，其余置零。关键事实：阶梯的行列计数使得**保留下来的高位位置集合被唯一强制为 $D$**（Ryser 型 0-1 矩阵前缀和等式，(3.4)–(3.5) 式）。于是 $P_s(w_m)=\widetilde w_h\otimes u_{m,s}$（带符号因子化，(3.6) 式），且坐标扇区的直和分解给出同构
   ```latex
   \C[G]z\cong\Ind_H^G A_0\cong\Ind_H^G(W_h\boxtimes U_{m,s}),
   ```
   从而 $W_m \twoheadrightarrow \Ind_{S_D\times S_F}^{S_{B_m}}(W_h\boxtimes U_{m,s})$。商的右因子是**真实的带生成子**的循环模 $U_{m,s}=\C[S_F]u_{m,s}$，左因子是**真实的小阶梯循环模** $W_h$——这就是"归纳追踪生成子而非仅追踪环境张量积支撑"的关键。
3. **宽 1 带**：$U_{m,1}\cong S^{(m)}$（平凡模），(4.1) 式。配合 Pieri 一步覆盖"第一行 $\ge m$"的λ。
4. **宽 2 带的四行检测**——Lemma `path:contraction` + Lemma `path:segment` + Proposition `prop:two-band`（§4, path-band.tex）：宽 2 带是长 $K=2m-1$ 的奇数路径，逐位置配对 $V=\C^2\otimes\C^2$ 与 $\Mat_2(\C)$，把 $\langle u, X_1\otimes\cdots\otimes X_K\rangle$ 化为 $(-1)^{m-1}[X_1\adj(X_2)X_3\cdots X_{K-2}\adj(X_{K-1})X_K]_{11}$。取 $V^*$ 的特殊基 $I,Z,T,J$（(4.5) 式），长 $r\le4$ 的交错段矩阵全是可逆矩阵 $r!(-1)^{e-\delta}M_1\cdots M_r$。对行数 $\le4$ 的 $\eta\vdash 2m-1$，把其表列放在连续段上做对偶 polytabloid $t_N$，再用同时共轭 $N_i=QM_iQ^{-1}$ 把乘积 $QBQ^{-1}$ 的 $(1,1)$ 端点元素变成非零，从而配对非零、得到非零映射 $U_{m,2}\to\mathcal T_N^*$，目标不可约故满，得 $S^\eta$ 出现在 $U_{m,2}$ 本身。
5. **水平带归约 + 归纳组装**——Lemma `comb:strip-reduction` + `thm:cyclic-saxl` 证明（§5, completion.tex）：不被 $\rho_m$ 支配的 $\lambda$ 要么 $\lambda_1\ge m$（一条宽 1 水平 $m$-带即可，情形 (i)），要么 $m\ge5$ 且前四行有超过 $2m-1$ 个盒子（(5.2) 式），于是至多四次"整扫（full sweep）+ 一次部分扫"恰好移走 $2m-1$ 个盒子、剩 $\nu\vdash N_{m-2}$（情形 (ii)）。迭代 Pieri 给出某 $\eta\vdash2m-1$、$\len(\eta)\le4$ 且 $c_{\nu,\eta}^{\lambda}>0$；带计算给出 $S^\eta\subseteq U_{m,2}$，归纳给出 $S^\nu\subseteq W_{m-2}$，诱导商给出 $S^\lambda\subseteq W_m$。

**可复用步骤**（论文 §1.2 标题"The construction and its reusable steps"强调）：(a) 坐标扇区诱导引理 `lem:sector-induction`（一般有限群陈述，含显式逆）；(b) 段交错引理 `path:segment`（两两反交换矩阵的符号计算，适用于任意检验基）；(c) 逐位置收缩公式 `path:contraction`。这三条都是与阶梯无关的一般工具。

### 1.4 与伴随论文的关系

引言指出：companion 论文 `\cite[Theorem~1.1]{universaltensorsquares2026}` 用本文的 cyclic 语句（Theorem 1.2/cyclic-saxl）加上额外论证，对每个 $n\notin\{2,4,9\}$ 构造 $S_n$ 的一个不可约表示，其张量平方包含全部不可约表示。本论文只需该更强语句"一份拷贝"："Only one copy of a suitable intermediate irreducible is needed."

---

## 二、逐引理带批注重构

> 本节体例：每条引理/定理一个小节。(a) 精确陈述（TeX 照抄）；(b) 证明机制逐步推导，中间步骤不跳；(c) 每个假设/常数的机械性理由；(d) [推测] 候选失败路线及失败机制。文件路径引用如 `dominance.tex:L60` 指 `build\sections\dominance.tex` 第 60 行。

### 2.1 工具层：位置张量、polytabloid、Young 规则（specht-tools.tex）

#### 2.1.1 交替块向量与 polytabloid 同构（Lemma 2.1 `lem:polytabloid`）

**(a) 陈述**（specht-tools.tex:L57-62）：

```latex
\begin{lemma}[Alternating blocks as polytabloids]\label{lem:polytabloid}
Define $\theta_i=\#\{A\in L:|A|\ge i\}$, so that the block sizes are
the column lengths of $\theta$.  Then
$\C[S_B]v_L\cong S^\theta$.
The same assertion holds for any ordered basis of a dual vector space.
\end{lemma}
```

其中块张量（(2.1) 式 `tools:block-tensor`）：

```latex
 v_A=\sum_{\pi\in S_r}\sgn(\pi)
       \bigotimes_{i=1}^r e_{\pi(i)},\qquad
 v_L=\bigotimes_{A\in L}v_A,
```

**(b) 证明机制**（specht-tools.tex:L64-89）：
1. 把 $L$ 的块按大小递减排成一列，作为形状 $\theta$ 的表 $t$ 的各**列**（块内自上而下按给定顺序放），表项是 $B$ 的不同元素。"块=列"字典的依据：$\theta_i=\#\{A:|A|\ge i\}$ 恰好数出长度 $\ge i$ 的块数，即 $\theta$ 第 $i$ 行的盒子数。
2. 行 tabloid $\{t'\}$ 记录每行的**集合**；$M^\theta$ 是行 tabloid 张成的置换模。
3. 字映射：把 $\{t'\}$ 送到"第 $i$ 行每个位置都赋字母 $i$"的字。这是 $S_B$-等变双射（在位置作用 $ge_a=e_{a\circ g^{-1}}$ 下置换位置等价于置换字的坐标索引），把 $M^\theta$ 的 tabloid 基实现为内容为 $\theta$ 的字基。
4. 列子群 $C_t$（= 块内置换子群）的 polytabloid
   ```latex
    e_t=\sum_{c\in C_t}\sgn(c)c\{t\}
   ```
   在此映射下恰好变成 $v_L$：在一列内，位置作用把置换 $\pi$ 变成 $\pi^{-1}$，而 $\sgn(\pi^{-1})=\sgn(\pi)$，符号不翻转。
5. 非零性：原行字（单位元对应的字）在 $e_t$ 中系数为 $1$——$C_t$ 中非单位元必把某列内元素移到别的行，所以不会与行字重合。故 $v_L\ne0$。
6. $e_t$ 的全部平移张成的空间就是 Specht 模 $S^\theta$，在 $\C$ 上不可约（引用 `\cite[Definitions~4.1 and~4.3, Theorem~4.12]{james1978}`）。
7. 对偶版本：对偶空间任取有序基均可；或用"可逆基变换在对偶张量幂上诱导 $S_B$-等变可逆映射"。这一句是 §4 里对偶检验基取 $N_i=QM_iQ^{-1}$ 的合法性来源。

**(c) 机械性理由**：
- 块内用 $\sgn$ 交错化：要命中的就是 $S^\theta$ 的标准实现（列交错化的行 tabloid）。$v_A$ 的字系数为 $\pm1$ 且每块字母是 $\{1,\dots,r\}$ 的双射（L54-56）——支撑=特定字集合，后面全部计数依赖它。
- "改变块的排序只改变 $v_L$ 的符号"（L53）：交错向量在块内反序下乘 $(-1)^{\binom r2}$，符号分歧在所有下游论证中都被积为 $\pm$ 总体系数，不影响支撑结论。
- 约束"块大小 $\le d$"（L46）：块内需要 $r$ 个不同字母，鸽笼原理。
- 行列排序（递增 $j$/递增 $i$）的选择只影响 $v_L$ 的整体符号（每块一个 $\sgn$），论文在 dominance.tex:L25 明确固定它以便系数计算可复现。

**(d) [推测] 失败路线**：
1. 若把块按**行**而非按列摆放，$v_L$ 变成"行交错"向量，生成 $S^{\theta^t}$ 而非 $S^\theta$；支配情形里 $\lambda^t$ 的共轭链条整体错位（Lean 中 `stairRowTableau`/`staircaseSwap`（TableauTransport.lean:L75-90）管理的正是这个对偶）。
2. 若位置作用取 $ge_a=e_{a\circ g}$（少了逆），列内置换的符号翻转，$v_L$ 映到 $-\sgn$-polytabloid，得 $S^\theta\otimes\sgn=S^{\theta^t}$，第 4 步失效。
3. 若块大小超过 $d$，$v_A=0$（$r$ 个位置放 $r$ 个互异字母不可能），生成子整体消失。Lean 对应现象：`columnAlt_eq_zero_of_rows`（SpechtClassification.lean:L200-228）——$d<\mu.colLen\ 0$ 时第一列放不下互异字母，columnAlt 恒零。

#### 2.1.2 共轭反转支配序（(2.2) 式 `tools:conjugate-dominance`）

**(a)** $\lambda\unrhd\mu\iff\mu^t\unrhd\lambda^t$，其中 $\lambda^t_j=\#\{i:\lambda_i\ge j\}$。

**(b) 机制**（specht-tools.tex:L21-31）：两条恒等式，对每个整数 $q\ge1$：

```latex
 \sum_i\max(\lambda_i-q,0)
 =\max_{k\ge0}\left(\sum_{i=1}^k\lambda_i-kq\right),
 \qquad
 \sum_{j=1}^q\lambda^t_j
 =n-\sum_i\max(\lambda_i-q,0).
```

第一条的推导：固定 $k$，$\sum_{i=1}^k\lambda_i-kq=\sum_{i\le k}(\lambda_i-q)$，再补上"长度 $\le q$ 的行贡献 0"的截断；当 $k$ 取遍所有行时，恰好把长 $>q$ 的行全部计入而长 $\le q$ 的行计入非正数（会降低总和），故最大值在 $k=$ {长 $>q$ 的行数} 处取得，值即 $\sum_i\max(\lambda_i-q,0)$。第二条：前 $q$ 列的盒子数 = $n-\sum_i\min(\lambda_i,q)$，而 $\min(\lambda_i,q)=\lambda_i-\max(\lambda_i-q,0)$。于是 $\lambda\unrhd\mu$ ⇒ 对一切 $k$，$\sum_{i\le k}\lambda_i\ge\sum_{i\le k}\mu_i$ ⇒ 第一条左端不减 ⇒ 第二条右端（即共轭前缀和）不减。把已证的单向蕴含应用到 $(\mu^t,\lambda^t)$ 得反向。

Lean 对应 `dominates_transpose`（DominatedSupport.lean:L97-103），用配角不等式 `corner_inequality`：$\mathrm{rowPrefix}(\mu^t,k)+\mathrm{rowPrefix}(\mu,r)\le|\mu|+rk$（`DominatedSupport.lean:L51-68`），及其在 $r=\mu.colLen\ k$ 处的**等式** `corner_equality`（L70-95）——这是同一事实的另一种包装（论文对 $k$ 取 max；Lean 对"角点"取等），两者可互推。

**(c) 机械性理由**：这是 $\tau=\lambda^t$ 这一步的全部依据——$\rho_m\unrhd\lambda$ 经共轭变成 $\lambda^t\unrhd\rho_m^t=\rho_m$，落入 Young 规则要求的支配方向；同时 $\rho_m^t=\rho_m$（自共轭）使链条闭合。

**(d) [推测]**：
1. 若试图直接在 $W_m$ 中构造 $S^\lambda$（绕开共轭+符号扭转），需要 $W_m$ 含"行型"生成子，但 $v_{R_m}\otimes v_{C_m}$ 两个因子都是列交错对象；$W_m\otimes\epsilon$ 与"行对象模"的同一是不可省的一步。
2. 若对非自共轭形状套用同一路线，$V_R\otimes\epsilon\cong S^{\rho^t}\ne S^\rho$，(2.10) 处的 $\Hom$ 维数计算崩塌。

---

#### 2.1.3 Pieri 规则（Lemma 2.2 `lem:pieri`）

**(a) 陈述**（specht-tools.tex:L125-136）：

```latex
\begin{lemma}[Pieri rule]\label{lem:pieri}
For $\nu\vdash a$ and $b\ge0$,
\begin{equation}\label{tools:pieri}
 \Ind_{S_a\times S_b}^{S_{a+b}}
      (S^\nu\boxtimes\mathbf1)
 \cong
 \bigoplus_{\substack{\lambda\vdash a+b,\ \lambda\supseteq\nu\\
                      \lambda/\nu\text{ a horizontal strip}}}
       S^\lambda.
\end{equation}
Every summand occurs once.
\end{lemma}
```

**(b) 机制**：Littlewood–Richardson 规则的一行特化（L138-141）：LR 填充的 $b$ 个添加字母全是 $1$，列严格性强迫 $\lambda/\nu$ 每列至多一盒（水平带）；唯一满足列严格的填充自动满足 lattice-word 条件，故每个和项恰出现一次。论文并不直接用这个同构，而是用它的两个推论：支配/重数结论由 Lemma 2.4 承担，正方向的存在性（给定水平带可以造出非零映射）由其证明的构造性保证。Lean 中正方向被完全展开为 `pieri_strip_restriction`（StripExtension.lean:L201-222）：映射 $F=\mathrm{pr}\circ T\circ\iota$，其中
- $T=$ `wordRestrict`（PieriRestriction.lean:L35-37）：在**被删带的位置集合**上固定字母、在其余位置对字母求和——精确地说就是"与全 1 泛函在删除位置做收缩"，$T(\mathrm{polytabloid}\ t)$ 把 $\mu$-polytabloid 压到 $\nu$ 的字空间；
- $\mathrm{pr}=$ `subrepProject`：到 $\nu$-Specht 子模的等变正交投影（SpechtDuality.lean:L72-75，用双线性配对的自对偶性构造）；
- 非零性：`strip_contraction_pair`（StripExtension.lean:L172-198）证明 $T(\mathrm{polytabloid}\ t)$ 与 $\nu$-polytabloid 的配对 = $|C_s|\cdot1\ne0$，核心是 `strip_contraction_coefficient`（L124-155）：求和式中只有单位元存活，因为水平带没有两盒同列 ⇒ 列群中固定所有被删位置的元素必为恒等（`column_fixed_of_strip`，L98-113）。

**(c) 机械性理由**：水平带条件对应诱导中平凡表示放在 $S_b$ 上（$\mathbf1$）；允许"空分拆 + 平凡群 $S_0$"（L122-123）是为了归纳基（$m=1$、$q=0$ 链）不留特判。带非空性 $\eta\ne\mu$ 在 Lean 的 `StripChain.snoc` 里是显式假设（StripReduction.lean:L12），机械地排除"零大小带"造成的链退化。

**(d) [推测] 失败路线**：
1. 若把 $\mathbf1$ 换成竖直带版本（每行至多一盒，即对偶 Pieri），completion 的 (i)/(ii) 分裂要整体翻共轭，宽 1/宽 2 带的"行=对"结构变成"列=对"，奇偶路径的编号 (4.2) 与端点字母全部重排。
2. 若想用竖直带 Pieri 直接处理"第一列很长的 $\lambda$"（对偶于第一行长的情形），宽 1 带不再平凡（$U_{m,1}$ 的对偶不是平凡模而是 sgn 的某次外幂），带计算量倍增。
3. 多重数"恰一次"若不成立（比如把 $\mathbf1$ 误放成置换模 $M^{(b)}$），completion 情形 (ii) 的 $a_\eta>0\Rightarrow c_{\nu,\eta}^{\lambda}>0$ 推理（(5.3) 式）会失去"和为正则至少一项为正"的保证。

#### 2.1.4 Young 规则（支撑 + 对角重数）（Lemma 2.4 `lem:young-rule`）

**(a) 陈述**（specht-tools.tex:L145-158）：

```latex
\begin{lemma}[Young's rule: support and diagonal multiplicity]
\label{lem:young-rule}
Let $\theta=(\theta_1,\ldots,\theta_\ell)\vdash n$. The row-tabloid
permutation module has the equivalent induced realization
\[
 M^\theta=
 \Ind_{S_{\theta_1}\times\cdots\times S_{\theta_\ell}}^{S_n}
 \mathbf1.
\]
Then $S^\tau$ occurs in $M^\theta$ if and only if
$\tau\unrhd\theta$, and $S^\theta$ occurs once.
The word module of any content obtained by reordering the parts of
$\theta$ is also isomorphic to $M^\theta$.
\end{lemma}
```

**(b) 证明机制**（specht-tools.tex:L160-222）：
1. **重数 = 链计数**。归纳传递性 + Pieri：逐层做 $\Ind_{S_a\times S_b}^{S_{a+b}}(S^\nu\boxtimes\mathbf1)$，故 $S^\tau$ 在 $M^\theta$ 中的重数 = 链
   ```latex
    \varnothing=\nu^{(0)}\subseteq\nu^{(1)}\subseteq\cdots
    \subseteq\nu^{(\ell)}=\tau,
    \qquad |\nu^{(k)}/\nu^{(k-1)}|=\theta_k,
   ```
   （(2.3) 式 `tools:strip-chain`）的条数，逐差为水平带。
2. **必要性（支配）**：每条带使第一列高度至多加一 ⇒ $\nu^{(k)}$ 至多 $k$ 行；$\nu^{(k)}\subseteq\tau$ ⇒ $\sum_{i\le k}\theta_i=|\nu^{(k)}|\le\sum_{i\le k}\tau_i$。$k>\ell$ 时两边都是 $n$（$\tau$ 至多 $\ell$ 行）。
3. **重数一（$\tau=\theta$）**：等号强迫 $\nu^{(k)}=$ $\theta$ 的前 $k$ 行（前缀和被压死，行数被压死），该链存在且唯一。
4. **充分性（构造性）**：归纳于 $\ell$。$\ell=1$ 时 $\tau\unrhd(n)$ 强制 $\tau=(n)$。$\ell>1$：令 $t=\theta_\ell$；$\tau_1\ge\theta_1\ge t$ 保证 $\tau$ 至少 $t$ 列；从 $t$ 个**最高的**列（等高取最右）各删底盒得 $\nu$。要验证：
   - $\nu$ 是分拆：不等高相邻列差 $\ge1$；等高组内只降一个后缀，弱减保持（L190-194）；
   - $\tau/\nu$ 是水平 $t$-带（按构造每列恰删至多一盒）；
   - 前缀损失公式（(2.4) 式 `tools:prefix-loss`）：
     ```latex
      \sum_{i=1}^k\tau_i-\sum_{i=1}^k\nu_i
            =\max(0,t-\tau_{k+1}):
     ```
     推导：高于 $k$ 行的列恰有 $\tau_{k+1}$ 个（列高 $>k\iff$ 第 $k{+}1$ 行有盒子）；"取最高列、等高取最右"保证删除优先发生在这些高列 ⇒ 恰有 $\max(0,t-\tau_{k+1})$ 个被删盒位于前 $k$ 行。
   - 损失为零：支配不等式直接从 $\tau$ 传递到 $\nu$。损失为正且 $k<\ell$：
     ```latex
      \sum_{i=1}^k\nu_i
      =\sum_{i=1}^{k+1}\tau_i-t
      \ge\sum_{i=1}^{k+1}\theta_i-t
      \ge\sum_{i=1}^k\theta_i,
     ```
     第一步用损失公式，第二步用 $\tau\unrhd\theta$，第三步用 $t\le\theta_{k+1}$（$\theta$ 递减且 $t=\theta_\ell$）。
   - $k=\ell$ 的边界（L209-214）：支配在 $\ell$ 给 $\len(\tau)\le\ell$、在 $\ell-1$ 给 $\tau_\ell\le t$；于是高为 $\ell$ 的列共 $\tau_\ell\le t$ 个，全被选中，第 $\ell$ 行消失，$\len(\nu)\le\ell-1$，此后前缀和都是全和 $n-t$，支配对 $(\theta_1,\dots,\theta_{\ell-1})$ 成立。归纳给出到 $\nu$ 的链，追加被删带。
5. **内容重排同构**（L218-221）：指定字母重数的字的稳定子 = 等字母位置集上对称群之积；重排重数共轭该子群。

**(c) 机械性理由**：
- 需要**构造性**充分性而非引用：dominated 情形与 strip reduction 都要在具体图上**执行删带**（Lean 的 `stripRemove`，HorizontalRemoval.lean:L47-53），前缀损失公式被 `dominates_stripRemove_last`（L176-208）逐层复用。
- $S^\theta$ 重数一用于 dominated 情形的 (2.10)：$M^{\rho_m}$ 中 $S^{\rho_m}$ 恰一次 ⇒ $\Hom$ 维数 = 1 ⇒ "交错线"唯一。
- Lean 对应物：`sizedStripChain_of_dominates`（YoungRule.lean:L31-58）就是第 4 步的构造性版本（用 `stripRemove τ (θ.rowLen k)` + `rowTruncate θ k`），以及 `young_invariant_functional`（L116-173）给出"支配 ⇒ 存在非零不变泛函"的对偶形式（见第三节 3.4.3）。

**(d) [推测] 失败路线**：
1. "删最高列"改成"删最左列"：等高组内被降低的不再是后缀，可能在列高序列中掏洞破坏分拆性（需要精心构造等高列与中间列的排布才能显式反例，但弱减性论证确实只对"后缀"封闭）。
2. 漏掉 $k=\ell$ 边界：$\len(\nu)\le\ell-1$ 不成立时"剩余前缀和 = $n-t$"为假，$\nu\unrhd(\theta_1,\dots,\theta_{\ell-1})$ 断链，归纳失败。
3. 重数一在 Lean 中并未以"重数"形式实现（Lean 用不可约性 + 象非零替代，见 3.4.2）；若硬要在 Lean 里做重数计数需引入缺失的 LR/对称函数理论。

### 2.2 支配情形（Proposition 2.5 `prop:dominated`，dominance.tex）

**(a) 陈述**（dominance.tex:L54-58）：

```latex
\begin{proposition}
\label{prop:dominated}
If $m\ge1$, $\lambda\vdash N_m$, and $\rho_m\unrhd\lambda$, then
$S^\lambda$ occurs in $W_m$.
\end{proposition}
```

背景设定（dominance.tex:L11-41）：$B_m=\{(i,j)\in\mathbb Z_{\ge1}^2:i+j\le m+1\}$，$G_m=S_{B_m}$；行/列分划 $R_m,C_m$ 块大小为 $m,m-1,\dots,1$；$w_m=v_{R_m}\otimes v_{C_m}$，$W_m=\C[G_m]w_m\subseteq V_R\otimes V_C$，$V_R=\C[G_m]v_{R_m}\cong S^{\rho_m}$、$V_C\cong S^{\rho_m}$（由 $\rho_m^t=\rho_m$ 与 Lemma 2.1）。

**(b) 证明机制**（dominance.tex:L60-198，逐步）：

**第 1 步（化归）**：由 Young 规则 + 共轭反转 + 符号恒等式（(2.2) 的 `tools:dual-sign`：$(S^\lambda)^*\cong S^\lambda$，$S^\lambda\otimes\sgn\cong S^{\lambda^t}$），只需证 $W_m\otimes\epsilon$ 包含 $M^{\rho_m}$ 的每个成分。

**第 2 步（符号平均 = 重复行生成子）**：行子群 $H_R=\prod_{i=1}^m S_{R_{m,i}}$ 以 $\epsilon|_{H_R}$ 作用于 $v_{R_m}$（行内交错向量的定义给出）。于是**未规格化**的符号对角平均恰好
```latex
 \sum_{h\in H_R}\epsilon(h)\,h w_m
 =v_{R_m}\otimes u,\qquad
 u=\sum_{h\in H_R}h v_{C_m}.
```
（(2.6) 式 `dom:signed-average`）。为什么是"恰好"：$h$ 作用在第一因子的符号平均把 $v_{R_m}$ 重新交错化（不变），而第二因子被平均成 $u$。

**第 3 步（$u\ne0$）**：取字 $e_{a_0}$，$a_0(i,j)=i$（每格取行号）。$e_{a_0}$ 被 $H_R$ 固定；它在 $v_{C_m}$ 中系数为 $1$（每列按递增 $i$ 排序时恰好是恒等赋值 $1,2,\dots,m+1-j$）；故它在每个 $h v_{C_m}$ 中系数也是 $1$（$h^{-1}e_{a_0}=e_{a_0}$）；在 $u$ 中系数 $=|H_R|=\prod_{r=1}^m r!\ne0$。**要点**：$u$ 是列 polytabloid 的 $H_R$-平均 = 列内容为 $(m,m-1,\dots,1)$ 的置换模中的非零向量，且被 $H_R$ 固定。

**第 4 步（交错线唯一）**：Frobenius 互反 + 诱导的符号扭转恒等式 + Young 规则给
```latex
 \dim\Hom_{H_R}(\epsilon|_{H_R},\Res_{H_R}^{G}V_R)
 &=\dim\Hom_G(\Ind_{H_R}^{G}\epsilon|_{H_R},V_R)\notag\\
 &=\dim\Hom_G(M^{\rho_m}\otimes\epsilon,V_R)\notag\\
 &=\dim\Hom_G(M^{\rho_m},V_R\otimes\epsilon)=1.
```
（(2.8) 式 `dom:alternating-line`）。最后一步：$V_R\otimes\epsilon\cong S^{\rho_m}$（自共轭），而 $S^{\rho_m}$ 在 $M^{\rho_m}$ 中重数一（Lemma 2.4）。$v_{R_m}$ 非零且 $H_R$-交错，故张满这条唯一的线。**于是任何 $H_R$-交错向量 $x\in V_R$ 都有 $x=c\,v_{R_m}$。**

**第 5 步（把符号扭转搬进第二因子）**：结合律同构
```latex
 (V_R\otimes V_C)\otimes\epsilon
 \longrightarrow V_R\otimes(V_C\otimes\epsilon),\qquad
 (x\otimes y)\otimes z\longmapsto x\otimes(y\otimes z)
```
（(2.9) 式）是 $G$-同构——机械地"扭转只做一次，放在哪个因子都可以"。取 $G$-同构 $\phi:V_C\otimes\epsilon\xrightarrow\sim V_R$（存在因为 $V_C\otimes\epsilon\cong S^{\rho_m^t}=S^{\rho_m}$）和 $0\ne z\in\epsilon$。$u$ 是 $H_R$-固定 ⇒ $u\otimes z$ 是 $H_R$-交错 ⇒（第 4 步）$\phi(u\otimes z)=c\,v_{R_m}$，$c\ne0$。把 (2.6) 乘 $z$、经 (2.9)、再 $\id\otimes\phi$，右边变成 $c(v_{R_m}\otimes v_{R_m})$。**结论**：$W_m\otimes\epsilon$ 的同构像包含
```latex
 Z_m=\C[G](v_{R_m}\otimes v_{R_m})
 \ \subseteq\ V_R\otimes V_R.
```
（(2.11) 式 `dom:repeated-row-cyclic`）

**第 6 步（加法投影 + 内容投影）**：取 $E_{\mathrm{out}}$ 基 $f_1,\dots,f_{2m-1}$，定义逐位置线性映射
```latex
 q:E_m\otimes E_m\longrightarrow E_{\mathrm{out}},\qquad
 q(e_a\otimes e_b)=f_{a+b-1}.
```
按位置重组两层张量（无符号的张量重组合），在每个位置作用 $q$，再投影到"字母 $r$ 恰出现 $r$ 次（$1\le r\le m$）、无更大字母"的字空间 $\mathcal M_\alpha$，$\alpha=(1,2,\ldots,m,0,\ldots,0)$。得 $G$-等变映射 $Q$（(2.12) 式 `dom:pair-letter-map`）：局部映射处处相同 ⇒ 与位置置换交换；内容在 $G$ 下不变 ⇒ 投影等变。

**第 7 步（平方刚性：唯一存活的字）**：$v_{R_m}\otimes v_{R_m}$ 的每个展开项中，在长 $r$ 的行上两层赋值 $(a_1,\dots,a_r),(b_1,\dots,b_r)$ 都是 $1..r$ 的排列，令 $c_j=a_j+b_j-1$，则
```latex
 \sum_{j=1}^r c_j=r^2,
 \qquad
 \sum_{j=1}^r c_j^2-r^3
 =\sum_{j=1}^r(c_j-r)^2\ge0.
```
（(2.13) 式 `dom:square-minimum`；注意 $\sum c_j=\sum a+\sum b=2\cdot\frac{r(r+1)}2-r=r^2$）。被内容投影保留的字的全三角形平方和为 $\sum_{r=1}^m r^3$；对每行用 (2.13) 再求和，迫使**每行取等号**，即该行每格 $c_j=r$。于是唯一被保留的输出字是
```latex
 t_m=\bigotimes_{(i,j)\in B_m}f_{m+1-i},
```
（行 $i$ 的每格输出 $r=m+1-i$）。**机械解读**：Cauchy–Schwarz 等号条件（$c_j=r$ 逐格）把"内容正确"强化为"逐格正确"。

**第 8 步（系数计算，无相消）**：长 $r$ 行上，每个 $a_j=\pi(j)$ 有唯一配对 $b_j=r+1-\pi(j)$（使 $a+b-1=r$）；$b=(\omega_r\pi)$，$\omega_r(j)=r+1-j$ 是行反序。两项交错符号之积 $\sgn(\pi)\sgn(\omega_r\pi)=\sgn(\omega_r)=(-1)^{\binom r2}$ 与 $\pi$ 无关！行间独立，故
```latex
 Q(v_{R_m}\otimes v_{R_m})
 =\left((-1)^{\sum_{r=1}^m\binom r2}\prod_{r=1}^m r!\right)t_m\ne0.
```
（(2.14) 式 `dom:noncancellation`）。**要点**：所有 $r!$ 个项符号相同（不是相消而是相加），系数非零。

**第 9 步（满到置换模）**：$t_m$ 的等字母集合恰是行 ⇒ 稳定子 $=H_R$，轨道是 $\mathcal M_\alpha$ 的基，故
```latex
 Q(Z_m)=\C[G]t_m=\mathcal M_\alpha
 \cong\Ind_{H_R}^{G}\mathbf1\cong M^{\rho_m}.
```
（(2.15) 式）。内容 $(1,2,\dots,m)$ 对应分拆 $\rho_m$：重排内容共轭标准 Young 子群（Lemma 2.4 末句）。

**第 10 步（收尾）**：由 Young 规则，一切 $\tau\unrhd\rho_m$ 的 $S^\tau$ 出现在 (2.15) 的商中；半单性 ⇒ 出现在 $W_m\otimes\epsilon$；取 $\tau=\lambda^t$（由 $\rho_m\unrhd\lambda$ 与共轭反转 $\lambda^t\unrhd\rho_m^t=\rho_m$），再扭回 $\epsilon$ 得 $S^\lambda\subseteq W_m$。

**(c) 假设与常数的机械性理由**：
- 未规格化平均（不除以 $|H_R|$）：避免特征 0 中除以大整数，只关心非零性。
- $q(e_a\otimes e_b)=f_{a+b-1}$ 的 $-1$：让对角线 $a=b=1$ 映到 $f_1$，使 $t_m$ 的字母恰为 $m+1-i$（从 1 开始的字母编号）；Lean 版本（`pairSumMap`）直接用 $a+b$（从 0 开始的 Fin 编号），两者等价。
- 输出字母表取 $2m-1$ 个字母（$a+b-1$ 的范围是 $1..2m-1$）：投影到内容 $\alpha$ 后只用到 $1..m$，但若输出表只有 $m$ 个字母，$q$ 就不再是"局部同一线性映射"下的纯投影而是要截断——保持 $q$ 处处同一映射是 $G$-等变性的最低成本。
- 平方和目标 $\sum r^3$：来自"内容 $(1,\dots,m)$ 每个字母 $r$ 出现 $r$ 次"⇒ $\sum r\cdot r^2=\sum r^3$；而行和 $r^2$ 与它严丝合缝，这是整个刚性论证的"巧合"，也是该证明对阶梯形状的特殊依赖。
- Lean 对应：`dominated_support`（DominatedSupport.lean:L158-210），其中第 7 步的一般化是 `pair_sum_rigidity`（RepeatedProjection.lean:L20-53，见 3.4.4），第 8 步系数是 `repeated_alt_projection` 的 $|H|\cdot\sgn(\omega)$（L209-231）。

**(d) [推测] 失败路线**：
1. 若把 $u$ 的非零性论证换成"取任意支撑点"而不验证 $e_{a_0}$ 被 $H_R$ 固定，平均后的向量可能为 0（各 $h v_{C_m}$ 的支撑不相交时系数会互相抵消到别处）；实际 $e_{a_0}$ 的"行号字"是唯一同时被行群固定且在 $v_{C_m}$ 支撑中的字，选错字（如列号字）系数为 0。
2. (2.13) 若改为一次幂比较（$\sum c_j$ 匹配），等号条件只给行内平均为 $r$，不足以逐格固定 $c_j=r$，会有多个存活字、相消可能性重现；平方（或任何严格凸函数）是必需的。Lean 的 `pair_sum_rigidity` 用的是 $\sum(c_i-t_i)^2=0$ 的同一凸性。
3. 若省去第 5 步的因子重组合 (2.9) 而直接在 $W_m$ 上扭符号，"扭转在第二因子实现"的同构需要 $\phi$ 的存在性（$V_C\otimes\epsilon\cong V_R$），这依赖 $S^{\rho_m}$ 的**自共轭**；对非自共轭 $\rho$ 此路不通——这解释了为什么整个构造锁死在阶梯分拆上。

---

### 2.3 坐标扇区诱导引理（Lemma 3.1 `lem:sector-induction`，band-quotient.tex）

**(a) 陈述**（band-quotient.tex:L32-43）：

```latex
\begin{lemma}[Induction from coordinate sectors]\label{lem:sector-induction}
Let a finite group $G$ act transitively on a finite set $\Omega$.
Suppose a $G$-module has a direct-sum decomposition
$T=\bigoplus_{A\in\Omega}T_A$ with $gT_A=T_{gA}$.
Fix $D\in\Omega$, let $H$ be its stabilizer, and take $z\in T_D$.
If $A_0=\C[H]z$, then the map
\begin{equation}\label{band:induced-map}
 \Phi:\C[G]\otimes_{\C[H]}A_0\longrightarrow\C[G]z,
 \qquad g\otimes a\longmapsto ga
\end{equation}
is an isomorphism of $G$-modules.
\end{lemma}
```

**(b) 证明机制**（band-quotient.tex:L45-68）：
1. 良定义：关系 $(gh)\otimes a=g\otimes ha$ 在两边象相同。等变、满显然。
2. 对每个 $A\in\Omega$ 取 $g_A\in G$ 使 $g_AD=A$，取坐标投影 $\pi_A:T\to T_A$。关键分解：**$\C[G]z=\bigoplus_{A\in\Omega}g_AA_0$ 且 $g_AA_0\subseteq T_A$**。为什么直和成立：$g_AA_0\subseteq T_A$ 且各 $T_A$ 是直和项；为什么覆盖 $\C[G]z$：$\C[G]z$ 由 $g\,z$ 张成，$g=g_Ah$（$h\in H$）时 $gz=g_A(hz)\in g_AA_0$。这一步用 $A_0$ 对 $H$ 封闭。
3. 逆映射（(3.2) 式 `band:induced-inverse`）：
   ```latex
    \Psi(y)=\sum_{A\in\Omega}
             g_A\otimes g_A^{-1}\pi_A(y).
   ```
   良定义：换成 $g_Ah$ 时 $g_Ah\otimes h^{-1}(g_A^{-1}\pi_A(y))=g_A\otimes g_A^{-1}\pi_A(y)$（结合张量积的平衡关系）。
4. $\Phi\Psi(y)=\sum_A\pi_A(y)=y$（直和分解）。
5. $\Psi\Phi(g\otimes a)$：设 $A=gD$，写 $g=g_Ah$；$g\otimes a$ 的象 $ga=g_A(ha)$ 落在 $A$-扇区，故 $\Psi$ 只取 $A$ 项：$g_A\otimes g_A^{-1}\pi_A(g_Aha)=g_A\otimes ha=g\otimes a$。

**(c) 机械性理由**：
- "$T_A$ 由字坐标定义（某位置集合上的高字母条件）" ⇒ 直和性来自**字基不相交**；$gT_A=T_{gA}$ 来自位置作用把字坐标作复合置换。扇区条件是纯组合的，无表示论输入。
- 论文特意包含显式逆 $\Psi$：后续 Prop 3.2 的"商映射"定义为 $P_s|_{W_m}$ 后接 $\Psi$ 与扇区识别，逆的存在让"满射"变成"同构后限制"。
- 稳定子恰为 $H$：在应用里 $D$ 的稳定子是 $S_D\times S_F$（保持高位置集合 = 逐点保持？不——集合级保持即可；但配合扇区内字坐标的结构，$\C[G]z$ 的扇区分解只需要集合稳定子）。论文 L189："the stabilizer of $D$ in $G$ is exactly $H$"，这里 $H=S_D\times S_F$ 是集合 $D$（作为子集）的完全稳定子。

**(d) [推测] 失败路线**：
1. 若 $z\notin T_D$（例如投影残留跨扇区项），$g_AA_0$ 会与相邻扇区相交，直和分解失败，$\Psi$ 的单项式定义不再有意义。Lean 中对应约束是 $z$ 落在 `wordSector`（CyclicSector.lean:L98-99）且由 `alphabetSub` 双侧字母条件保证。
2. 若 $A_0$ 只对 $H$ 的真子群封闭，$\C[G]z$ 的扇区覆盖会缺项（$g$ 的 coset 代表不齐），$\Phi$ 满但注入失败。
3. 有限性假设（$\Omega$、$G$ 有限）：无限版本需要拓扑/分析平均，$\Psi$ 的有限和失效。Lean 里所有求和都依赖 `Fintype` 实例（`letI := Fintype.ofFinite ...` 反复出现）。

Lean 对应物不是这个引理的直接翻译，而是两件组合工具：`averagedMap` + `sector_average_nonzero`（CyclicSector.lean:L14-74，把"扇区上等变 + 投影保持 + 扇区外投影消灭"变成非零平均映射）与 `sector_support_transfer`（L103-152）；逆映射 $\Psi$ 的角色由 Maschke 提升引理 `intertwining_lift_surjective`（L78-92）与 `cyclic_projection_support`（L214-229）替代（见第三节 3.4.6 的差异讨论）。

### 2.4 带商（Proposition 3.2 `prop:band-quotient`，band-quotient.tex）

**(a) 陈述**（band-quotient.tex:L70-79）：

```latex
\begin{proposition}[Band quotient]\label{prop:band-quotient}
For the parameters in \Cref{band:sets}, there is a surjective
$G_m$-equivariant map
\begin{equation}\label{band:quotient}
 W_m\twoheadrightarrow
 \Ind_{S_D\times S_F}^{S_{B_m}}(W_h\boxtimes U_{m,s}).
\end{equation}
In particular, every irreducible constituent of the induced module on
the right is a constituent of $W_m$.
\end{proposition}
```

参数（(3.1) 式 `band:sets`）：$s\in\{1,2\}$，$h=m-s\ge1$，$D=B_h$，$F=B_m\setminus D$，$|F|=N_m-N_h=s(2m-s+1)/2$；带生成子（(3.3) 式 `band:generator`）$u_{m,s}=v_{R_F}\otimes v_{C_F}$，$U_{m,s}=\C[S_F]u_{m,s}$（两层字母表为 $1..s$；$R_F,C_F$ 是 $F$ 的非空行/列交集，块大小 $\le s$）。

**(b) 证明机制**（band-quotient.tex:L81-205，三段）：

**第一段（投影与高位置的唯一性）**：
1. 用重组合 $E_m^{\otimes B_m}\otimes E_m^{\otimes B_m}\cong(E_m\otimes E_m)^{\otimes B_m}$，定义逐位置投影
   ```latex
    p_s(e_a\otimes e_b)=
    \begin{cases}
    e_a\otimes e_b,& a,b\le s\text{ 或 }a,b>s,\\
    0,&\text{otherwise},
    \end{cases}
    \qquad P_s=p_s^{\otimes B_m}.
   ```
   处处同一局部映射 ⇒ $P_s$ 与 $G$ 交换。"高位置"= 两个字母都 $>s$ 的保留位置。
2. 保留字中的高位置集 $A$ 的计数约束：第一层（行块）交错给出**行高计数** $r_i=\max(h+1-i,0)$——行 $i$ 中保留的高字母数（该行原是 $1..m+1-i$ 的排列，高字母 $s+1..m+1-i$ 共 $\max(m+1-i-s,0)=\max(h+1-i,0)$ 个）；第二层同理给列计数 $d_j=\max(h+1-j,0)$。
3. 前缀恒等式（(3.4) 式 `band:margin-equality`）：
   ```latex
    \sum_{i=1}^k r_i
    =\#\{(i,j)\in B_h:i\le k\}
    =\sum_{j=1}^m\min(k,d_j).
   ```
   中间项是 $B_h$ 前 $k$ 行的格子数（因 $r_i$ 正是 $B_h$ 第 $i$ 行长 $h+1-i$）；右端是"各列对前 $k$ 行高位置贡献的上界之和"（列 $j$ 至多贡献 $\min(k,d_j)$ 个，因为它的高位置共 $d_j$ 个且分布在 $k$ 行里）。
4. 由左 = 右，**每列都取等**：$d_j>0$ 时取 $k=d_j$，列 $j$ 的全部 $d_j$ 个高位置都在前 $d_j$ 行；$d_j=0$ 的列无高位置。于是
   ```latex
    A=\{(i,j)\in B_m:i\le h+1-j\}=B_h=D.
   ```
   （(3.5) 式 `band:unique-high-set`）。论文注明这是行/列 margin 不等式取等的 Ryser 论证（`\cite[Section~2]{ryser1957}`）：阶梯 margin 使每个前缀界都是等式。**这是整个商构造的引擎：投影不消灭生成子，且高位置被组合唯一强制。**
5. 顺带 $P_s(w_m)\ne0$：字 $e_{a_0}\otimes e_{a_0}$ 型的字（两层都取行号/列号的原字）保留。

**第二段（带符号的因子化）**：
6. 在长 $r$ 的行/列块上，它与 $D$ 的交是长 $a=\max(r-s,0)$ 的前段，与 $F$ 的交是长 $b=\min(r,s)$ 的后段。保留赋值把高字母 $s+1,\dots,r$ 放前段、低字母 $1..b$ 放后段。设 $\Alt$ 为表的未规格化交错化（$\Alt(\varnothing)=1$），则该块张量中具有此指定高集的部分恰为
   ```latex
    (-1)^{ab}\,
    \Alt(e_{s+1},\ldots,e_r)\otimes\Alt(e_1,\ldots,e_b).
   ```
   （(3.6) 式 `band:block-factorization`）。推导：每个高字母在位置序上先于每个低字母 ⇒ 恰 $ab$ 个跨段逆序，贡献 $(-1)^{ab}$；其余逆序都在两段内部，由两段各自独立求和吸收；每对（高排列,低排列）恰出现一次。$r\le s$ 时高段为空，公式退化为原交错化。
7. 行与列的长度列表都是 $m,m-1,\dots,1$，跨段符号相乘：
   ```latex
    \prod_{r=1}^m(-1)^{2\max(r-s,0)\min(r,s)}=1,
   ```
   ——每行一个 $(-1)^{ab}$、每列一个 $(-1)^{ab}$，成对抵消。**这是唯一用到"两层形状互为转置"的地方。**
8. 恒等 $E_h\cong E_{\mathrm{hi}}=\Span(e_{s+1},\dots,e_m)$（$e_a\mapsto e_{s+a}$，即 Lean 的 `highLetter`），低字母部分恰是 $R_F,C_F$ 的块。按 $D,F$ 重排张量因子（无符号），得
   ```latex
    z:=P_s(w_m)=\widetilde w_h\otimes u_{m,s}\ne0.
   ```
   （(3.7) 式 `band:generator-factorization`）。
9. $H=S_D\times S_F$ 两因子独立作用 ⇒
   ```latex
    A_0:=\C[H]z
    =\Span\{(\sigma\widetilde w_h)\otimes(\tau u_{m,s})\}
    =\widetilde W_h\boxtimes U_{m,s}
    \cong W_h\boxtimes U_{m,s}.
   ```
   （(3.8) 式 `band:subgroup-orbit`；第二个等号由张量对线性组合的分配展开。）

**第三段（扇区与商）**：
10. $\Omega=\{A\subset B_m:|A|=|D|\}$；扇区
    ```latex
     T_A=(E_{\mathrm{hi}}\otimes E_{\mathrm{hi}})^{\otimes A}
          \otimes
          (E_{\mathrm{lo}}\otimes E_{\mathrm{lo}})^{\otimes(B_m\setminus A)}
    ```
    ——"恰在 $A$ 上高"的字的坐标张成；字基不相交 ⇒ 直和；$gT_A=T_{gA}$。$z\in T_D$，$D$ 的稳定子恰为 $H$。由 Lemma 3.1：
    $\C[G]z\cong\Ind_H^G A_0\cong\Ind_H^G(W_h\boxtimes U_{m,s})$。
11. $P_s$ 等变 ⇒ $P_s(W_m)=\C[G]P_s(w_m)=\C[G]z$。取限制 $P_s|_{W_m}$，接 $\Psi$（Lemma 3.1 的逆）与 (3.8) 的识别，得 (3.9) 的满射。**论文明确警告**（L200-203）：这个环境投影的象不必落在两个原 Specht 因子里；复合映射仍是满 $G$-线性映射到所列模。最后一句"每个不可约成分是 $W_m$ 的成分"由 $\C$ 上半单性给出。

**(c) 假设与常数的机械性理由**：
- $s\in\{1,2\}$：宽 1 带平凡（$U_{m,1}\cong S^{(m)}$，配 Pieri 一步），宽 2 带用 §4 的矩阵计算；$s\ge3$ 时带内块大小 $\le s$ 而 §4 的"四行"检测只覆盖 $\le4$ 行，且矩阵论证依赖 $\Mat_2$ 的 $\adj=\tr I-X$ 恒等式——这是 $2\times2$ 特有。
- $h=m-s\ge1$：带切割后必须剩下真三角形给归纳假设用（$W_h$ 非平凡）。$m\ge3$（§4）与 $m\ge5$（情形 (ii)）都由此派生。
- $|F|=s(2m-s+1)/2$：$s=1$ 时 $=m$（对角线），$s=2$ 时 $=2m-1$——正是 strip reduction 要移走的盒子数，(i)/(ii) 两种情形分别匹配。
- 块大小 $\le s$ 的 $R_F,C_F$：$F$ 是宽度 $s$ 的带，行/列交至多 $s$ 格。
- Lean 对应：`sameHighProjection`（HighProjection.lean:L114-127，逐位置保留同高字对）、高位置唯一性 `high_positions_rigidity`+`staircase_projected_high_positions`（L43-168，注意 Lean 用**签名和取等** $w(x)=2h-1-2i-2j$ 的 Ferrers 论证替代 Ryser margin，见 3.4.7）、旋转与符号因子化 `rotateRow`/`rotateColumn`/`rotatePositions_sign`/`staircase_cut_layers`（L196-204 与 CoordinateSector.lean:L143-204）、因子化 `staircase_cut_factor`（BandSupport.lean:L232-241）、扇区传递 `strip_product_support`（StripSupport.lean:L76-131）。

**(d) [推测] 失败路线**：
1. 若把 $P_s$ 换成"任一字母高"的较宽投影（保留 $a\le s<b$ 的位置），高位置集合不再被唯一强制为 $B_h$（margin 论证对"单层高"无效），扇区分解里 $z$ 跨扇区，Lemma 3.1 的前提崩塌。
2. 若去掉第二段中成对符号抵消（例如只对行做旋转），$z$ 与 $\widetilde w_h\otimes u_{m,s}$ 差一个整体符号——这无害；但若行/列旋转选取不对称（如列不旋转），两层的高位置集合不一致，$P_s(w_m)$ 可能真为 0 或因子化失败。Lean 中这个对称性体现为 `rotateColumn = staircaseSwap ∘ rotateRow ∘ staircaseSwap`（HighProjection.lean:L224-225）与 `rotatePositions_sign`（CoordinateSector.lean:L164-177）。
3. 商映射的象不在原 Specht 因子里（L200-203 的警告）：若误以为 $P_s$ 限制后仍落在 $V_R\otimes V_C$ 内，会试图把商分解为 $W_h\boxtimes U_{m,s}$ 的**子模**包含而非商——方向反了，归纳传递就不成立（商里出现的东西不必出现在子模里）。

---

### 2.5 宽 1 带与路径编号（path-band.tex 开头）

**(a)**（path-band.tex:L9-35）宽 1 带 = 对角线上 $i+j=m+1$ 的 $m$ 个位置；每个行列块都是单点，两层字母表只有字母 $1$，故 $u_{m,1}$ 是被一切位置置换固定的非零常数字张量，且
```latex
 U_{m,1}\cong S^{(m)} \qquad (m\geq2).
```
（(4.1) 式 `path:one-band`）。宽 2 带（$K=2m-1$ 个位置 $F=B_m\setminus B_{m-2}$）沿路径编号（(4.2) 式 `path:positions`）：
```latex
 p_{2j-1}=(m+1-j,j)\quad(1\leq j\leq m),\qquad
 p_{2j}=(m-j,j)\quad(1\leq j<m).
```
在此编号下：行块 = 单点 $\{1\}$ 与对 $(2,3),(4,5),\dots,(K-1,K)$；列块 = 对 $(1,2),(3,4),\dots,(K-2,K-1)$ 与单点 $\{K\}$。每对按路径下标递增排序；行序与递增 $j$ 一致，而 $m-1$ 个列对**反转**递增 $i$，于是
```latex
 u=(-1)^{m-1}u_{m,2},\qquad U_{m,2}=\C[S_F]u.
```
（(4.3) 式 `path:generator-sign`）。

**(b) 机制**：把带按"蛇形"编号使行块与列块都成为**相邻对**（除两个端点单点外）——这是后文"连续段"放置检验表列的前提。行块 $(2,3),(4,5),\dots$ 对应 $\{p_{2j},p_{2j+1}\}$（同列 $j$ 的两个格：$(m-j,j),(m-j-1,j)$？核对：$p_{2j}=(m-j,j)$，$p_{2j+1}=(m+1-(j+1),j+1)=(m-j,j+1)$——是**相邻两列**的格子，即"行 $m-j$"的两个成员。对，行块。）列块 $(1,2),(3,4),\dots$ 是同一列的两个格。单点块：$p_1=(m,1)$ 是第 1 行的唯一格（行单点）；$p_K=p_{2m-1}=(1,m)$ 是第 $m$ 列的唯一格（列单点）。端点单点在收缩公式里强制"首字母/末字母 = 1"（见 2.6）。列对方向反转的来源：列 $C_{m,j}$ 按递增 $i$ 排序，而路径编号沿蛇形在列上**向下再向上**行进……实际核验：列块 $(p_{2j-2},p_{2j-1})$？路径下标 $2j-1=(m+1-j,j)$、$2j-2$…… 论文 L31-33 直接给出结论：$m-1$ 个列对的排序都反转速一个 $\sgn=-1$，共 $(-1)^{m-1}$。

**(c) 机械性理由**：$m\ge3$ 的约束（宽 2 带 $\ge5$ 个位置）保证"行对、列对、两个单点"三类块都非空，路径结构成立；$m=2$ 时带 = $F=B_2\setminus B_0=B_2$ 有 3 个位置，$U_{2,2}$ 的支撑由带公式另行处理（论文里 §4 从 $m\ge3$ 起做；归纳里 (ii) 情形 $m\ge5$ 自动满足）。Lean 中 $K=2(h+1)+1=2m-1$ 由 `bandPath_card`（BandFactorization.lean:L225-227）与 `pathCellsEquiv`（L206-214）显式建立。

**(d) [推测]**：若用别的蛇形起点（例如从右上角开始），端点单点换到另一对角，(4.4) 的收缩公式端点条件换位，符号 $(-1)^{m-1}$ 变 $(-1)^{?}$——结论不变但所有中间公式都要重推；起点选择唯一影响的是"段矩阵表"(4.9) 中 $p$ 的奇偶分配。

### 2.6 路径收缩公式（Lemma 4.3 `path:contraction`，path-band.tex）

**(a) 陈述**（path-band.tex:L114-122）：

```latex
\begin{lemma}[Path contraction]\label{path:contraction}
For arbitrary $X_1,\ldots,X_K\in\Mat_2(\C)$,
\begin{equation}\label{path:contraction-formula}
 \left\langle u,X_1\otimes\cdots\otimes X_K\right\rangle
 =(-1)^{m-1}
 \left[X_1\adj(X_2)X_3\adj(X_4)\cdots
                 X_{K-2}\adj(X_{K-1})X_K\right]_{11}.
\end{equation}
\end{lemma}
```

其中 $E=\C^2$（基 $e_1,e_2$）、$V=E\otimes E$、$V^*\cong\Mat_2(\C)$（$X$ 在 $e_a\otimes e_b$ 上取值 $X_{ab}$）、$J=\begin{pmatrix}0&1\\-1&0\end{pmatrix}$，配对是不变双线性求值配对。

**(b) 证明机制**（path-band.tex:L124-151）：
1. **端点单点**：$u$ 在位置 $1$ 的行单点要求第一层字母 = $1$（$a_1=1$）；位置 $K$ 的列单点要求最后第二层字母 = $1$（$b_K=1$）。（单点块的"交错化"= 恒等 = 该位置字母被钉死为块的字母 $1$。）
2. **对块的系数**：交错对在路径序下的系数是 $J_{ab}$（$2\times2$ 交错化 $\sgn(1)\,e_1\otimes e_2+\sgn(2)\,e_2\otimes e_1$ 的坐标即 $J$）。行块与列块分别钉住第二层相邻对与第一层相邻对。
3. 于是左边 = 指数和（(4.5) 式 `path:index-sum`）：
   ```latex
    \sum_{\substack{a_1,\ldots,a_K,b_1,\ldots,b_K\in\{1,2\}\\
                     a_1=b_K=1}}
    \left(\prod_{\ell=1}^{m-1}
      J_{b_{2\ell-1},b_{2\ell}}J_{a_{2\ell},a_{2\ell+1}}\right)
    \prod_{q=1}^K(X_q)_{a_qb_q}.
   ```
4. **逐次收缩**：从 $a_1$ 到 $b_K$ 依次读 contracted 指标，得
   ```latex
    \left[X_1JX_2^{\mathsf T}JX_3JX_4^{\mathsf T}J
          \cdots X_{K-2}JX_{K-1}^{\mathsf T}JX_K\right]_{11}.
   ```
   偶位置的转置记录"其列指标先于行指标被收缩"（偶位置是**列块**的第二个成员/行块的第一个成员——列块 $J$ 作用在第二层，收缩时从第二层指标进入，故 $X^{\mathsf T}$ 把列指标搬到行位置）。
5. **$2\times2$ 恒等式**（(4.6) 式 `path:adjugate`）：
   ```latex
    \adj(X)=\begin{pmatrix}d&-b\\-c&a\end{pmatrix}
           =\tr(X)I-X,\qquad JX^{\mathsf T}J=-\adj(X).
   ```
   每个 $JX^{\mathsf T}J$ 变成 $-\adj(X)$；恰有 $m-1$ 个偶位置，得符号 $(-1)^{m-1}$。注意 $\adj$ 在 $\Mat_2$ 上是**线性**的（$\tr(X)I-X$），这是后文"段矩阵是矩阵的交错**和**"能有意义的根本原因。

**(c) 机械性理由**：
- 端点字母 = 1 是**块结构**强制的（单点块的字母表），不是选择；后文 (4.11) "Only the test covectors have changed; $u$ and its endpoint letters remain those fixed" 强调共轭变换不动 $u$。
- $\adj$ 而非逆：配对是多项式（双线性）的，不能用 $X^{-1}$（非线性、不可逆时无定义）；$\Mat_2$ 中 $\adj$ 恰好线性且 $JX^{\mathsf T}J=-\adj X$ 把转置吸收掉。
- Lean 对应：`path_contraction`（PathContraction.lean:L141-160）：$\langle\mathrm{bandWord}\ r,\mathrm{pureWord}\ X\rangle=(-1)^r\cdot[\prod_q D(1+q)(X_q)]_{00}$，其中 $D(1+q)$：$q$ 偶 = 恒等、$q$ 奇 = $\adjugate$（`Band.D`，BandMatrices.lean:L21），与 (4.4) 一致（指标平移 1，且 Lean 把生成子 $u$ 实现为**系数泛函** `bandWord r`：端点字母钉 0、对块系数 $J$——`bandWord` 定义 PathContraction.lean:L22-26，`chain_entries_endpoint` L133-139 给出与 `chainML` 乘积端点的等式）。

**(d) [推测] 失败路线**：
1. 若在 3×3 或更大矩阵上尝试同一公式，$\adj$ 非线性（$n\ge3$ 时 $\adj$ 是 $n-1$ 次多项式），段的"交错矩阵和"无法合并进乘积——整个 §4 依赖 $n=2$。
2. 若端点单点用字母 2（块字母表换序），端点条件变成 $a_1=2,b_K=2$，收缩给 $[\cdots]_{22}$ 型端点；可行但与后文 $Q$ 共轭把向量送到 $e_1$ 的做法错位。
3. 若把偶位置转置漏掉（$JX J$ 而非 $JX^{\mathsf T}J$），恒等式变成 $JXJ\ne\pm\adj X$（一般不成立），公式错。

### 2.7 段交错（Lemma 4.5 `path:segment`，path-band.tex）

**(a)** 基选择（(4.7) 式 `path:matrix-basis`）：
```latex
 M_1=I,\qquad
 M_2=Z=\begin{pmatrix}1&0\\0&-1\end{pmatrix},\qquad
 M_3=T=\begin{pmatrix}0&1\\1&0\end{pmatrix},\qquad
 M_4=J=ZT.
```
线性无关：$I,Z$ 张对角空间、$T,J$ 张反对角空间。后三个无迹且两两**反交换**；$Z^2=T^2=I$，$J^2=-I$；全部可逆。逐位置算子（奇位恒等、偶位取伴随）$D_q$，段交错矩阵（(4.8) 式 `path:segment-definition`）：
```latex
 A_{r,p}=\sum_{\pi\in S_r}\sgn(\pi)
      D_p(M_{\pi(1)})D_{p+1}(M_{\pi(2)})\cdots
      D_{p+r-1}(M_{\pi(r)}).
```

陈述（path-band.tex:L197-213）：
```latex
\begin{lemma}[Segment alternation]\label{path:segment}
Let $e$ be the number of even positions among $p,\ldots,p+r-1$, and put
$\delta=1$ if $p$ is even and $\delta=0$ otherwise. Then
\begin{equation}\label{path:segment-formula}
 A_{r,p}=r!(-1)^{e-\delta}M_1\cdots M_r.
\end{equation}
In particular, all these matrices are invertible. Their values are
\begin{equation}\label{path:segment-table}
 \begin{array}{c|cc}
 r & p\text{ odd} & p\text{ even}\\ \hline
 1&I&I\\
 2&-2Z&2Z\\
 3&-6J&-6J\\
 4&-24I&24I
 \end{array}
\end{equation}
\end{lemma}
```

**(b) 证明机制**（path-band.tex:L215-236）：
1. 固定 $\pi$，设 $I=M_1$ 占局部槽 $j$。删去 $I$ 后剩下 $M_2,\dots,M_r$ 的一个排列，其符号恰是把这些两两反交换矩阵重排到标准序 $M_2\cdots M_r$ 所获得的符号（反交换 ⇒ 每次对调乘 $-1$）。
2. 把 $I$ 从第 1 槽挪到第 $j$ 槽贡献 $(-1)^{j-1}$ 且**不改变任何矩阵乘积**（$I$ 与一切交换）。合起来
   $\sgn(\pi)M_{\pi(1)}\cdots M_{\pi(r)}=(-1)^{j-1}M_1\cdots M_r$。
3. $\adj$ 固定 $I$、翻转其余三个基矩阵（$\adj(X)=\tr(X)I-X$：无迹矩阵取负）。位置 $p+j-1$ 为偶时整段多乘 $-1$，记 $\epsilon_j$；$\epsilon_j\equiv\delta+j-1\pmod2$。总符号 $=(-1)^{j-1}\cdot(-1)^{e-\epsilon_j}=(-1)^{e-\delta}$，**与 $\pi$ 无关**。
4. 全部 $r!$ 项相同 ⇒ $A_{r,p}=r!(-1)^{e-\delta}M_1\cdots M_r$；标准积 $r=1,2,3,4$ 分别是 $I,Z,J,-I$，代入给表 (4.9)。特别地所有段矩阵可逆（$r! \ne 0$ 乘可逆阵）。

**(c) 机械性理由**：
- 为什么取 $\{I,Z,T,J\}$：(i) 四个可逆；(ii) 非单位元无迹（$\adj$ = 取负，使 $D_q$ 在基上只是"乘 $\pm1$"）；(iii) 两两反交换（交错符号可整体提出）；(iv) 两两相乘仍落在 $\pm$ 基元素（$Z^2=T^2=I$，$J^2=-I$，$ZT=J$ 等）——这样整条路径的乘积仍是**单个基元素的倍数**，端点 $(1,1)$ 元素是否为零变成有限几种情形的查表。论文引用 `\cite[Section~3]{drenskygiambruno1994}`：这组矩阵正是检验 $2\times2$ 多项式恒等式（含 $\adj$）的标准代数基。
- $e-\delta$ 的来历：段内偶位置个数决定 $\adj$ 翻转次数；$\delta$（起点奇偶）修正 $I$ 所在槽的奇偶与全局奇偶的错位。
- 表 (4.9) 中 $r=3$ 两列同为 $-6J$：因为 $M_1M_2M_3=IZT=J$ 且 $e-\delta$ 对 $(p$ 奇, $r=3)$ 是 $1-0=1$、$(p$ 偶$)$ 是 $2-1=1$，同奇偶。
- Lean 对应：`segment_one_even/one_odd/two_even/two_odd/three_even/three_odd/four_even/four_odd`（BandMatrices.lean:L54-166）用 `fin_cases` 暴力算出与 (4.9) 完全一致的表（`segment 2 0 = 2•basis 1` 等）；另有代数路线 `ScaledBasis` 封闭性（`basis_mul` 16 个 case，L181-247）与 `segment_scaled`（L256-269）。

**(d) [推测] 失败路线**：
1. 若把 $I$ 换成另一个可逆矩阵 $M_1'$（不满秩秩一问题不存在，但 $I$ 的"与一切交换"性质丢失），第 2 步的"$I$ 挪槽不改变乘积"失效，$\pi$ 之间出现真矩阵差异，$r!$ 公式崩塌。
2. 若四个基矩阵中有一个迹非零（如 $\mathrm{diag}(1,2)$），$\adj$ 不再是简单取负，$D_q$ 把基元素打成基元素的**和**，段矩阵的封闭性丧失。
3. 段长 $\le4$ 的上限来自：$M_1\cdots M_5=IZTJ\cdot I$？实际 $r=5$ 时 $A_{5,p}$ 仍是 $\pm5!$ 倍可逆阵（论证对任意 $r$ 成立！）——上限 4 不是公式失效，而是**表列长**：$\eta$ 至多 4 行 ⇒ 每列长 $\le4$。若想检测 5 行形状，需要 $r\le5$ 的段仍可逆（成立）但**端点元素** $(QBQ^{-1})_{11}\ne0$ 的共轭自由度是否还够（$B$ 是可逆阵，特征向量论证仍可用），真正的障碍在下一节的检测机制与 $U_{m,2}$ 的字母表只有 4 个配对字母（$V^*$ 基 4 个）——见 2.8。

### 2.8 宽 2 带的四行检测（Proposition 4.6 `prop:two-band`，path-band.tex）

**(a) 陈述**（path-band.tex:L245-248）：

```latex
\begin{proposition}[Four-row support of the width-two band]\label{prop:two-band}
For every $m\geq3$ and every partition $\eta\vdash 2m-1$ with
$\len(\eta)\leq4$, the irreducible module $S^\eta$ occurs in $U_{m,2}$.
\end{proposition}
```

**(b) 证明机制**（path-band.tex:L250-309）：
1. **检验表列的放置**：设 $\eta$ 的列长为 $r_1,\dots,r_c$（每个 $1\le r_j\le4$，和为 $K$），把路径切成连续段 $s_j=1+\sum_{i<j}r_i$ 起、长 $r_j$。对任意有序基 $N_1,\dots,N_4$，定义对偶张量 $t_N$：其第 $j$ 段因子为
   ```latex
    \sum_{\pi\in S_{r_j}}\sgn(\pi)
          N_{\pi(1)}\otimes\cdots\otimes N_{\pi(r_j)}.
   ```
   段 = 表列、基初始标号 = 表行 ⇒（Lemma 2.1 的对偶版）$t_N$ 是 polytabloid，$\mathcal T_N=\C[S_F]t_N\subseteq(V^*)^{\otimes K}$ 是 $\eta$ 型不可约模。
2. **第一配对**：取 $N_i=M_i$。收缩公式 (4.4) 的多重线性 + $t_M$ 定义 ⇒
   ```latex
    \langle u,t_M\rangle=(-1)^{m-1}[B]_{11},\qquad
    B=A_{r_1,s_1}A_{r_2,s_2}\cdots A_{r_c,s_c}.
   ```
   （(4.10) 式 `path:ordered-factorization`）。为什么是段矩阵的**有序乘积**：各段独立求和恰好是乘积的分配展开；段连续 ⇒ 无矩阵因子互换。由 Lemma 4.5，$B$ 可逆。
3. **端点元素的共轭自由度**：$\adj(X)=\tr(X)I-X$ 逐点验证给
   $D_q(QXQ^{-1})=QD_q(X)Q^{-1}$（对一切 $Q\in\GL_2(\C)$、$q$ 奇偶皆然——$\adj(QXQ^{-1})=Q\adj(X)Q^{-1}$）。取 $B$ 的特征向量 $v$（特征值 $\beta\ne0$），取 $Q$ 把 $v$ 送到第一坐标向量，令 $N_i=QM_iQ^{-1}$（共轭是 $V^*$ 的可逆线性变换 ⇒ 仍是有序基）。每个段矩阵变 $QA_{r_j,s_j}Q^{-1}$，乘积变 $QBQ^{-1}$，且 $(QBQ^{-1})e_1=\beta e_1$，于是
   ```latex
    \langle u,t_N\rangle=(-1)^{m-1}[QBQ^{-1}]_{11}
                       =(-1)^{m-1}\beta\ne0.
   ```
   （(4.11) 式 `path:nonzero-pairing`）。**只有检验余向量变了；$u$ 与其端点字母保持不变**（L295-296）。
4. **检测**：不变求值配对定义
   ```latex
    \Phi:U_{m,2}\longrightarrow\mathcal T_N^*,\qquad
    \Phi(x)(t)=\langle x,t\rangle,
   ```
   （(4.12) 式 `path:quotient-map`）；等变性显式验证 $\Phi(gx)(t)=\langle x,g^{-1}t\rangle=(g\Phi(x))(t)$。$\Phi$ 在生成子 $u$ 上非零 ⇒ $\Phi\ne0$；目标不可约（$\eta$ 型，自对偶 `tools:dual-sign`）⇒ $\Phi$ 满 ⇒ $S^\eta$ 出现在 $U_{m,2}$（半单性）。
5. **反例式示例**（Example 4.7，L311-321）：$m=3$、$\eta=(2,2,1)$ 时段长 $3,2$、起点 $1,4$，$B=(-6J)(2Z)=12T$，$[T]_{11}=0$ ——不共轭就配对为零！取
   ```latex
    Q=\begin{pmatrix}1&1\\1&2\end{pmatrix},\qquad
    QTQ^{-1}=\begin{pmatrix}1&0\\3&-1\end{pmatrix},
   ```
   配对值 $12\ne0$。**说明共轭步骤不可省**。

**(c) 机械性理由**：
- 检验基可以依赖 $\eta$（$Q$ 依赖 $B$ 依赖段划分）：$t_N$ 不必统一，只需对每个 $\eta$ 存在一组。这是"对每个成分单独检测"的策略，而非构造单一万有检验。
- 特征向量论证要求 $B$ 可逆（Lemma 4.5 提供）；若 $B$ 有重根也无妨（任取特征向量）。
- $\len(\eta)\le4$ 与字母表大小 4 的对应：$V^*$ 恰 4 维（$\Mat_2$），列长 $r$ 的交错化需要 $r$ 个**不同**基元素（$\pi$ 是 $S_r$ 的排列）——$r>4$ 时无基可选，$t_N$ 定义失败。这是"检测至多 4 行"的硬上限，也是 completion 情形 (ii) 必须把成分压到 $\le4$ 行的原因（见 2.9）。
- Lean 对应：`fourRow_support`（BandPairing.lean:L111-127）。**重要差异**：Lean 不做特征向量+依赖 $\eta$ 的 $Q$，而是用**固定的** $Q=\begin{pmatrix}1&1\\1&2\end{pmatrix}$（正是 Example 4.7 的矩阵！），配合 `ScaledBasis` 封闭性（`blocks 1 rs = c·basis i`，$c\ne0$）与逐基元素验证 `Q_basis_ne_zero`（BandMatrices.lean:L296-298，$i=0,1,2,3$ 四个 case 的 $(Q\,\mathrm{basis}_i\,Q^{-1})_{00}\ne0$）——把"对每个 $\eta$ 找 $Q$"换成"统一的 $Q$ 对四种基元素都行"。检测方向也相反：Lean 用 `hom_to_cyclic_of_pair`（SpechtDuality.lean:L120-139）从 Specht 模**射向**带循环模（配对非零 ⇒ 到循环模的非零 intertwining map），绕开 $\mathcal T_N^*$ 与满射性论证（配对的对称性 + 循环模的自对偶使双向等价）。详见第三节 3.4.8。

**(d) [推测] 失败路线**：
1. 若 $V^*$ 基选成 $\{I,Z,T,K\}$（$K$ 换成另一反交换无迹阵），$K^2=+I$ 时第三行表变 $\pm6\cdot$？：$M_1M_2M_3=ZTK$；若 $ZTK=-J$ 型仍可逆即可，真正危险是某个基元素**奇异**（如用 $Z+I=\mathrm{diag}(2,0)$），段矩阵行列式出现零公因子。
2. 若把段放置改成非连续（表列交叉放在不相邻位置），(4.10) 的段乘积要插入 $D$ 算子交错，$B$ 不再是段矩阵之积，可逆性论证失效——需要新的组合引理控制交错。
3. 共轭步骤若省略，Example 4.7 显示配对可为零；若只对部分 $\eta$ 共轭，结论退化为"$U_{m,2}$ 含某些 $\eta$"，completion 的 (ii) 情形会在需要具体 $\eta$ 时失败（Lean 用分离引理绕开这一点，见 3.4.9）。

---

### 2.9 水平带归约（Lemma 5.1 `comb:strip-reduction`，completion.tex）

**(a) 陈述**（completion.tex:L10-27）：

```latex
\begin{lemma}[Horizontal-strip reduction]
\label{comb:strip-reduction}
Let $m\ge2$ and $\lambda\vdash N_m$. If $\lambda$ is not dominated by
$\rho_m$, then at least one of the following holds.
\begin{enumerate}[label=\textup{(\roman*)}]
\item There is a partition $\nu\vdash N_{m-1}$ such that
      $\lambda/\nu$ is a horizontal strip of size $m$.
\item One has $m\ge5$, and there are partitions
      \[
      \nu=\lambda^{(0)}\subset\lambda^{(1)}\subset\cdots
      \subset\lambda^{(q)}=\lambda,
      \qquad q\le4,
      \]
      with $\nu\vdash N_{m-2}$ and every
      $\lambda^{(i)}/\lambda^{(i-1)}$ a nonempty horizontal strip.
      Their total size is $2m-1$.
\end{enumerate}
\end{lemma}
```

**(b) 证明机制**（completion.tex:L30-76）：
1. **情形 (i)**：$\lambda_1\ge m$。删去**最右** $m$ 个非空列各自的底盒。列高序列的右端后缀减一保持弱减与非负 ⇒ 余图是分拆 $\nu$；被删盒每列至多一盒 ⇒ 水平带；$N_m-m=N_{m-1}$ 给大小。论文强调与 Lemma 2.4 的删除的差别（L31-33）：这里不必保持支配不等式，"右端后缀"只要保分拆即可。
2. **情形 (ii) 之支配失败点**：$\lambda_1\le m-1$ 时，支配失败给出下标 $k<m$ 使
   ```latex
   \sum_{i=1}^k\lambda_i>km-\frac{k(k-1)}2.
   ```
   （(5.1) 式 `comb:dominance-failure`；右边 = $\rho_m$ 前 $k$ 行和 $\sum_{i\le k}(m+1-i)$）。$k<m$ 因为 $\rho_m$ 前 $m$ 行和已是 $N_m=|\lambda|$。$k\le3$ 时 $\sum_{i\le k}\lambda_i\le k(m-1)\le km-\frac{k(k-1)}2$（后一不等式即 $k(m-1)\le k(m+1-(k+1)/2)$ ⟺ $m-1\le m-(k-1)/2$ ⟺ $k\le3$）——**矛盾**，故 $4\le k<m$，特别 $m\ge5$。
3. **前四行容量**（(5.2) 式 `comb:four-row-capacity`）：
   ```latex
   \sum_{i=1}^4\lambda_i
   \ge\frac4k\sum_{i=1}^k\lambda_i
   >4m-2(k-1)\ge2m+4>2m-1.
   ```
   第一步："前 4 项均值 $\ge$ 前 $k$ 项均值"（$\lambda$ 递减）；第二步代 (5.1)；第三步 $4m-2(k-1)\ge4m-2(m-2)=2m+4$（$k\le m-1$）。
4. **整扫（full sweep）**：删去每个非空列的底盒一次，行长 $(\alpha_1,\alpha_2,\dots)$ 变 $(\alpha_2,\alpha_3,\dots)$——**整扫 = 竖直方向"削一层"**，余图嵌套于原图，被删盒是大小 $\alpha_1$ 的水平带。四次整扫从 $\lambda$ 起共移走 $\lambda_1+\cdots+\lambda_4$ 盒。
5. **部分收尾**：整扫到"剩余待删数 $\le$ 非空列数"为止，再从最右列删掉差额个底盒；由第 1 步的后缀论证，这次部分扫也留分拆。由 (5.2)，**至多四次非空整扫 + 至多一次部分扫（合计 $q\le4$ 条带）恰好移走 $2m-1$ 盒**，余 $\nu\vdash N_m-(2m-1)=N_{m-2}$。反向排列序列即 (ii) 的链。
6. **锐性示例**（L78-85）：$m=13$、$\lambda=(8^{11},3)\vdash91=N_{13}$，支配在 $k=12$ 失败（$91>90$）；八列图中每条水平带至多 8 盒 ⇒ 三条带拿不下 $25=2m-1$ 盒；实际扫走 $8+8+8+1=25$，余 $\nu=(8^7,7,3)\vdash66=N_{11}$。**$q=4$ 是紧的。**

**(c) 机械性理由**：
- (i) 与 (ii) 的分界 $\lambda_1\ge m$：宽 1 带大小 $m=|F|$（$s=1$）恰能吃掉 $\lambda_1\ge m$ 的情形；同时"宽 1 带平凡"使 (i) 的带因子无需 §4 计算。
- $q\le4$ 与 $\len(\eta)\le4$ 的匹配：情形 (ii) 中诱导出的带成分 $\eta$ 至多 $q$ 行（每个水平带至多新增一行——两条新行都需要第一列的新盒子），恰好落入 `prop:two-band` 的范围。
- $m\ge5$ 的下界保证 $h=m-2\ge3$，§4 的路径结构（$m\ge3$）适用。
- Lean 对应：`strip_reduction`（StripReduction.lean:L139-162）+ `strip_reduction_capacity`（L105-137，即 (5.1)/(5.2) 的合并：输出 `5 ≤ m ∧ 2*m-1 ≤ rowPrefix μ 4`）+ `stripChain_of_capacity`（L22-57，整扫/部分扫的容量归纳）。**注意**：Lean 的 `strip_reduction` 情形 (i) 用 `stripRemove μ m`（与论文同一构造）；锐性示例 $\lambda=(8^{11},3)$ **不在 Lean 中**（Lean 只证 $q\le4$ 的存在性，不证紧性）。

**(d) [推测] 失败路线**：
1. 若部分收尾扫不在"最右列"而在任意列做，底盒删除后列高不再保持弱减（中间被掏空）——这正是 Lemma 2.4 里"取最高列"与这里"取最右列"的差别；两处规则不同却形似，是移植时最容易出错的地方。
2. 若 (5.1) 的 $k\le3$ 排除算错（例如允许 $k=3$ 进入情形 (ii)），$m\ge5$ 不成立，$h=m-2$ 可能 $=1,2$，§4 的 $m\ge3$ 前提失效，$U_{m,2}$ 的路径结构（$K\ge5$）破坏。
3. 容量论证 (5.2) 若误用"前 4 项均值 $\ge$ 全体均值"（对递减序列为假），估计失效；Lean 中对应 `rowPrefix_mean`（StripReduction.lean:L59-81）用双乘交叉不等式 $q\cdot\mathrm{rowPrefix}\ \mu\ k\le k\cdot\mathrm{rowPrefix}\ \mu\ q$ 精确实现"均值单调"。

### 2.10 主归纳组装（Theorem 1.2 `thm:cyclic-saxl` 与 Theorem 1.1 `thm:saxl`，completion.tex）

**(a)** `thm:cyclic-saxl`（dominance.tex:L45-49，见第一节 1.2 引文）与 `thm:saxl`（introduction.tex:L18-25）。

**(b) 证明机制**（completion.tex:L87-156）：

**归纳骨架**：对 $m$ 强归纳。基：$W_1$ 是一元群的一维表示。归纳步：$\lambda\vdash N_m$：
- 若 $\rho_m\unrhd\lambda$：Prop 2.5 直接给。
- 情形 (i)（宽 1 切割，$s=1$，$|D|=N_{m-1}$、$|F|=m$）：归纳假设给 $S_D^\nu\subseteq W_{m-1}$；$U_{m,1}$ 平凡；Pieri 给 $S_{B_m}^\lambda$ 出现在 $\Ind_{S_D\times S_F}^{S_{B_m}}(S_D^\nu\boxtimes\mathbf1)$；经 Prop 3.2 的商（$U_{m,1}$ 是 $\mathbf1$ 的实现）与半单性，$S^\lambda\subseteq W_m$。
- 情形 (ii)（宽 2 切割，$s=2$，$K=2m-1$）：写 $b_i=|\lambda^{(i)}|-|\lambda^{(i-1)}|$，$\sum b_i=K$，$q\le4$。取 $F$ 的互不相交子集，大小 $b_1,\dots,b_q$，作置换模
  ```latex
  A=\Ind_{S_{b_1}\times\cdots\times S_{b_q}}^{S_F}\mathbf1
    \cong\bigoplus_{\eta\vdash K}(S_F^\eta)^{\oplus a_\eta}.
  ```
  迭代 Pieri + 诱导传递 ⇒ $S_{B_m}^\lambda$ 是 $\Ind_{S_D\times S_F}^{S_{B_m}}(S_D^\nu\boxtimes A)$ 的成分，即 (5.3) 式 `comb:positive-multiplicity`：
  ```latex
  \sum_{\eta\vdash K}a_\eta c_{\nu,\eta}^{\lambda}>0,\qquad
  c_{\nu,\eta}^{\lambda}
  =\dim\Hom_{S_{B_m}}\!\left(
   S_{B_m}^\lambda,
   \Ind_{S_D\times S_F}^{S_{B_m}}
   (S_D^\nu\boxtimes S_F^\eta)\right).
  ```
  每个 $A$ 的成分至多 $q$ 行（每条水平带至多引入一行新行：两条新行都要第一列的新盒）⇒ 存在 $\eta$：$a_\eta>0$ 且 $c_{\nu,\eta}^{\lambda}>0$。由 Prop 4.6，$S_F^\eta\subseteq U_{m,2}$；由归纳，$S_D^\nu\subseteq W_{m-2}$；**各取一份拷贝**即给 $S_{B_m}^\lambda$ 在 $\Ind_{S_D\times S_F}^{S_{B_m}}(W_{m-2}\boxtimes U_{m,2})$ 中——它是 $W_m$ 的商（Prop 3.2）——再由半单性回到 $W_m$。注意 (ii) 有 $m\ge5$ ⇒ 所有被引用的小模指标为正。

**收尾（thm:saxl）**（L150-156）：两生成因子都是 $\rho_m$ 型 ⇒ $W_m\subseteq S^{\rho_m}\otimes S^{\rho_m}$（对角作用）⇒ 每个 $S^\lambda$ 出现在该张量平方 ⇒ $g(\rho_m,\rho_m,\lambda)>0$。

**(c) 机械性理由**：
- "只需一份拷贝"（L183-184：Only one copy of a suitable intermediate irreducible is needed）：合成映射 $\Ind(W_{m-2}\boxtimes U_{m,2})$ 里，$S^\nu\boxtimes S^\eta$ 的单一拷贝就够张成目标成分——这是"循环追踪生成子"哲学的酬劳：归纳假设给的正是 $W_{m-2}$、$U_{m,2}$ 里的**指定生成子支撑**，而非环境模支撑。
- 半单性只用于"商的成分也是模的成分"这一步，处处是复数域的 Maschke。
- Lean 对应：`full_cyclic_support`（Main.lean:L58-79，`Nat.strong_induction_on`，情形分裂 `Dominates` vs `strip_reduction`，两种情形都汇入 `band_cut_support`）→ `cyclic_saxl_conjecture`（L82-84）→ `saxl_conjecture := saxl_of_cyclic_support cyclic_saxl_conjecture`（L88）。`band_cut_support`（L28-45）把 (i)/(ii) 统一：给定 `SizedStripChain bs ν μ` 与两个因子的支撑假设，经 `shiftedStairWord_support`、`strip_product_support`、`staircase_cut_factor`、`cyclic_projection_support` 四步搬回 `staircaseCyclic (h+s)`。

**(d) [推测] 失败路线**：
1. 若在情形 (ii) 中把 $A$ 换成单个 $S^\eta$（预先挑定），需要 LR 系数信息（哪个 $\eta$ 使 $c_{\nu,\eta}^\lambda>0$），超出论文手段；论文用"和为正 ⇒ 某项为正"绕开，Lean 用分离引理绕开（见 3.4.9）。若和为正性论证失效（如 $a_\eta$ 有理数化），整套失败。
2. 归纳步 (ii) 里 $q$ 条带的**顺序**：`SizedStripChain bs ν μ` 的 $bs$ 是有序表，$b_i$ 与 $\lambda^{(i)}$ 对齐；若顺序乱掉，颜色计数 `hcB`（每色格子数 $=bs[j]$）错位，Pieri 链构造失败。
3. $m=2,3,4$ 的边界：$\rho_m\unrhd\lambda$ 在 $m\le4$ 时并不覆盖全部 $\lambda$。例 $m=3$：$\lambda=(2,2,2)\vdash6$，$\rho_3=(3,2,1)$，前缀和 $(2,4,6)\le(3,5,6)$ ⇒ 支配成立，走 Prop 2.5；$\lambda=(3,3)$：前缀和 $(3,6)$，$6>5$ ⇒ 支配失败且 $\lambda_1=3=m$ ⇒ 走情形 (i)（$s=1$，$h=2$）。所以 $m\le4$ 时都能走支配或 (i)，不依赖 (ii) 的 $m\ge5$；若边界处理错误（比如把 (i) 的判据 $\lambda_1\ge m$ 写成 $>$），$(3,3)$ 这类会被错误推向 (ii) 而崩溃。

---

## 三、Lean 取证（E:\math\lean\OAI\RepresentationTheory\Saxl\，39 个模块）

### 3.1 形式化登记与配置

`E:\math\lean\formalization.yaml` 中登记（L72-75 与 L1478-1480）：

```yaml
  - title: "A Cyclic Polytabloid Proof of Saxl's Conjecture"
    id: ../preprints/A-Cyclic-Polytabloid-Proof-of-Saxls-Conjecture-September-24-2026/paper.pdf
```

```yaml
    - comparator_config: ComparatorChallenges/Saxl.json
      declaration: OAI.Saxl.saxl_conjecture
      file: OAI/RepresentationTheory/Saxl/Main.lean
```

`E:\math\lean\ComparatorChallenges\Saxl.json` 全文：

```json
{
  "challenge_module": "ComparatorChallenges.Saxl",
  "solution_module": "OAI.RepresentationTheory.Saxl.Main",
  "theorem_names": ["OAI.Saxl.saxl_conjecture"],
  "definition_names": [],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
  "enable_nanoda": false
}
```

**permitted axioms 解读**：仅允许 Lean/Mathlib 的三个标准公理（命题外延、商的声音、经典选择），即不允许任何自定义 `axiom` 声明或 `sorry` 化的捷径；`enable_nanoda: false` 表示不启用 nano-da 辅助证明检查。这是"论文结论在 ZFC + Mathlib 基础上机器验证"的最强取证形态。

### 3.2 模块依赖链

由各文件首行 import 复核：**39 个模块构成一条严格线性链**（每个文件只 import 链上前一个 Saxl 模块，Model import Mathlib）：

```
Model → Basic → Polytabloid → SpechtSubmodule → SpechtDuality →
TableauTransport → StaircaseTensor → HighProjection → CoordinateSector →
PositionSplit → BandFactorization → PathAlternation → BandMatrices →
PathContraction → ColumnContraction → BandPairing → CyclicSector →
BandSupport → ShapeRigidity → SpechtClassification → SupportSeparation →
PositionTensor → BandOrbit → BandGlue → SignEquivalence → PieriRestriction →
StripExtension → SizedStrips → StripSupport → HorizontalRemoval →
YoungRule → CyclicTensor → RepeatedProjection → StaircaseSign →
DominatedQuotient → DominatedSupport → StripReduction → Main
```

主题分层（链条的"逻辑顺序"与文件序不同，是主题顺序）：
1. **基础**（Model, Basic）：字空间、位置表示、循环子表示、polytabloid、Specht、kronecker、staircase 图。
2. **Specht 理论**（Polytabloid, SpechtSubmodule, SpechtDuality, TableauTransport, ShapeRigidity, SpechtClassification）：不可约性、自对偶、表列举无关性、形状刚性、特征分类。
3. **带/扇区机制**（CoordinateSector, PositionSplit, BandFactorization, BandOrbit, BandGlue, CyclicSector, SupportSeparation, PositionTensor）：切割、扇区、粘合。
4. **路径/矩阵**（PathAlternation, BandMatrices, PathContraction, ColumnContraction, BandPairing）：蛇形路径、$\Mat_2$ 基、收缩、四行检测。
5. **带/条组合**（SignEquivalence, PieriRestriction, StripExtension, SizedStrips, StripSupport, HorizontalRemoval, StripReduction）：符号转置、Pieri、条链、扫除归约。
6. **支配与组装**（YoungRule, CyclicTensor, RepeatedProjection, StaircaseSign, DominatedQuotient, DominatedSupport, Main）：Young 规则、支配情形、最终定理。

### 3.3 核心定义对照表（论文记号 ↔ Lean 定义）

| 论文 | Lean（Model.lean / TableauTransport.lean / StaircaseTensor.lean） | 说明 |
|---|---|---|
| 位置集合 $B$，字基 $e_a$ | `WordSpace n d := (Fin n → Fin d) → ℂ` | 对偶化的字坐标（系数函数），非形式张量 |
| $g e_a=e_{a\circ g^{-1}}$ | `wordRep n d`：`(wordRep g f) a = f (a ∘ g)` | 同一作用在坐标函数上的显式形式 |
| 循环子模 $\C[G]v$ | `cyclic ρ v := Subrepresentation.span ℂ (Set.range fun g => ρ g v)` | 未规格化，直接 span 轨道 |
| 表 $t$（位置集的标号） | `Tableau n μ := Fin n ≃ μ.cells`（`canonicalTableau` 由基数构造） | Lean 用"枚举等价"而非带填表的图 |
| 行字（tabloid 内容） | `rowWord t : Fin n → Fin (μ.colLen 0)`，$i\mapsto(t\ i).val.1$ | 行指标（0 基） |
| 列群 $C_t$ | `columnGroup t := {g \| ∀ i, (t (g i)).val.2 = (t i).val.2}` | 保列（同列坐标） |
| polytabloid $e_t$ | `polytabloid t := ∑ g : columnGroup t, signC g • wordRep g (Pi.single (rowWord t) 1)` | 在字坐标里直接求和 |
| $M^\theta$（置换模） | `tabloidSub t := cyclic (wordRep …) (Pi.single (rowWord t) 1)` | 行字的轨道张成 |
| $S^\theta$ | `spechtSub t := cyclic (wordRep …) (polytabloid t)`，`spechtRep t` | **循环定义**（轨道 span），不是 James 的商构造 |
| Kronecker 系数 | `kronecker a b t := finrank ℂ (IntertwiningMap (spechtRep t) ((spechtRep a).tprod (spechtRep b)))` | 维数直接定义为 finrank Hom |
| 阶梯 $\rho_m$ | `staircase m`：cells = range m ×ˢ range m 过滤 `x.1 + x.2 < m` | **0 基**，条件 `i+j < m`（论文 $i+j\le m+1$ 1 基） |
| $W_m=\C[G_m]w_m$ | `staircaseCyclic m := cyclic (wordRep …) (staircaseWord m)`，`staircaseWord m := wordTensor (polytabloid (stairRowTableau m) ⊗ polytabloid (stairTableau m))` | 第一因子是**转置表**（`stairRowTableau = stairTableau ∘ staircaseSwap`），即列层；顺序与论文 $v_R\otimes v_C$ 相反，无实质影响 |
| Saxl 猜想 | `SaxlConjecture := ∀ m, 1 ≤ m → ∀ μ, μ.card = (staircase m).card → 0 < kronecker …` | 用"图基数相同"代替"$\lambda\vdash N_m$" |
| 循环版猜想 | `CyclicSaxlConjecture := ∀ m μ, … → ∃ f ≠ 0 : IntertwiningMap (spechtRep μ) (staircaseCyclic m)` | 非零 intertwining map = 成分出现的构造式表述 |

### 3.4 逐主题取证：对应差异与 Lean-only 细节

#### 3.4.1 Model/Basic：表示论的"字坐标"化

- 一切张量积通过 `wordTensor`（TableauTransport.lean:L38-46）：`WordSpace n d ⊗ WordSpace n e ≃ WordSpace n (d*e)`，$x\otimes y\mapsto((a,b)\mapsto x(\mathrm{splitLeft})\cdot y(\mathrm{splitRight}))$。论文的"ordinary tensor identifications introduce no signs"（specht-tools.tex:L43）在 Lean 中是一个真实的线性等价 + 等变性引理 `wordTensor_equivariant`（L48-60）。
- `staircase_card`（Basic.lean:L99-101）：$(\mathrm{staircase}\ m).card=m(m+1)/2$ 由 `staircase_card_succ` 与乘二法证明——论文里 $N_m$ 的定义，Lean 需要作为引理（用于 `saxl_kronecker_pos` 的字面次数）。
- `polytabloid_rowWord`（Basic.lean:L45-57）：polytabloid 在自己行字上的系数 = 1，是论文 L81-82"coefficient $1$"的严格化；证明用 `Finset.sum_eq_single 1`——列群中只有恒等元固定行字（`column_perm_rowWord`）。
- `kronecker_pos_iff`（Basic.lean:L22-29）：$0<\mathrm{finrank\ Hom}\iff\exists$ 非零 intertwining map。整个 Lean 证明只需要"存在非零映射"，从不计算维数——比论文的 $g>0$ 陈述更弱更可操作。

#### 3.4.2 SpechtSubmodule/Polytabloid：不可约性从零重建（论文引用 James）

论文 Lemma 2.1 的第 6 步引用 James 定理 4.12（polytabloid 构造给出不可约 Specht 模）。Lean **不引用任何 Specht 理论**，自行重建：

1. `columnAlt t`（Polytabloid.lean:L117-122）= 列交错算子 $\sum_{g\in C_t}\sgn(g)\,\mathrm{wordRep}(g)$（作用于任意字母数的字空间）。
2. `columnAlt_tabloid`（SpechtSubmodule.lean:L52-66）：columnAlt 把整个置换模 `tabloidSub t` 打进一维线 $\C\cdot\mathrm{polytabloid}\ t$。关键引理 `columnAlt_single`（Polytabloid.lean:L207-225）：对任何行字的置换，交错化要么撞列（`columnAlt_collision`：同列两格同字母 ⇒ 与对换平均反交换 ⇒ = 0）要么是 polytabloid 的倍数（`column_rearrangement` + `ferrers_rearrangement`：列单射重排的支撑必须落在 Ferrers 图内，用签名权 $w(c)=2\,\mathrm{rowLen}(c.1)-2c.2-1$ 的取等论证 `finset_eq_of_signed_sum`）。
3. `specht_cyclic_of_ne_zero`（SpechtSubmodule.lean:L164-184）：Specht 循环模中任何非零向量再生成整个模。证明：非零 $x$ 有某个平移与 polytabloid 配对非零（`specht_detect`，用 star-正定性 `dotProduct_self_star_eq_zero`——注意这是**复数上的正定性**论证）；该平移落在置换模里，columnAlt 后是 $c\cdot\mathrm{polytabloid}$（$c\ne0$），而 columnAlt 保持任何循环模 ⇒ polytabloid 在 $x$ 的循环模里。
4. `specht_irreducible`（L196-227）：任何非平凡子表示含非零 $x$ ⇒ 其循环模 = 全空间。

**差异**：论文引用外部定理（James），Lean 全部内化；`ferrers_rearrangement`/`finset_eq_of_signed_sum`（Polytabloid.lean:L15-45, L49-83）是论文完全没有的纯组合引理——"列单射重排的字支撑必为 Ferrers 图"，本质是 margin 取等的第三种实现（与 2.1.2、3.4.7 同源）。

#### 3.4.3 YoungRule/CyclicTensor：Young 规则的对偶（泛函）形式

- 论文 Lemma 2.4 是"$S^\tau\subseteq M^\theta\iff\tau\unrhd\theta$ + 重数一"。Lean 的 `young_invariant_functional`（YoungRule.lean:L117-123）只造**充分性**方向的对偶形式：
  ```
  τ.card = θ.card → Dominates τ θ →
  ∃ a（字，内容 = θ 的重排）(l : Dual ℂ (Specht τ)), l ≠ 0 ∧ (a 固定的置换保持 l)
  ```
  证明链：`sizedStripChain_of_dominates`（构造条链，即论文 Lemma 2.4 第 4 步）→ `stripChain_restriction`（SizedStrips.lean:L31-114，带**颜色函数** $c:\mathrm{Fin}\ \mu.card\to\mathbb N$ 的迭代 Pieri 限制映射：$c=0$ 的格子恰是 $\nu$ 的格子，颜色 $j+1$ 的格子数恰为 $bs[j]$，映射对保色置换等变）→ `vector_of_invariant_functional` + `orbitAverage`。
- `young_orbit_map`（CyclicTensor.lean:L20-70）把泛函翻成轨道映射：存在非零 $F:\mathrm{wordRep}\to\mathrm{spechtRep}\ t$ 使 $F(\mathrm{Pi.single}\ w)\ne0$（$w$ 为指定内容的字）。`perm_of_equal_content`（YoungRule.lean:L79-91）处理内容重排：等内容的字相差一个置换。
- **差异**：论文用"商 $Z_m\twoheadrightarrow M^{\rho_m}$ + 抽成分"；Lean 反向——从 word 空间向 Specht **造非零映射**，支配情形里作为 $F:\mathrm{wordRep}\to S^{\mu^t}$ 使用（DominatedSupport.lean:L171-173）。方向相反但由自对偶等价；Lean 因此**完全不需要**重数一（multiplicity-one）与必要性方向——必要性在 Lean 中不存在，支配失败的替代路径由 `strip_reduction` 承担。

#### 3.4.4 RepeatedProjection/DominatedQuotient：平方刚性与系数（论文 (2.13)/(2.14) 的 Lean 化）

- `pair_sum_rigidity`（RepeatedProjection.lean:L20-53）是论文 `dom:square-minimum` 的一般化：实值函数 $a,t,c$ 与置换 $\omega,g,h,k$，若 $t(\omega i)=t(i)$、$a_i+a_{\omega i}=t_i$、$t(gi)=t(i)=t(hi)$、$c_i=a_{gi}+a_{hi}=t_{ki}$，则 $c=t$。证明：$\sum t_i a_i$ 的对称化给 $\sum t_ia_i=\frac12\sum t_i^2$，交叉项给 $\sum t_ic_i=\sum t_i^2$，配合 $\sum c_i^2=\sum t_i^2$（$k$ 是置换）得 $\sum(c_i-t_i)^2=0$。**论文逐行做 $\sum(c_j-r)^2$；Lean 一次性在抽象实变量层面做**——论文的 $r^2,r^3$ 特化数据完全消失。
- `paired_term_projection`（L157-208）：投影 `orbitProjection t (pairSumMap (merge (a∘g) (a∘h)))` = 若 $h=\omega g$ 则 $\mathrm{Pi.single}\ t\ 1$ 否则 0。配对唯一性 `paired_relation_iff`（L134-151）：$a_{gi}+a_{hi}=t_i$ 有唯一解 $h=\omega g$（由 $(t_i,a_i)$ 单射 + $\omega$ 的互补恒等式 `repeated_complement`）。
- `repeated_alt_projection`（L209-231）：**系数 = $|H|\cdot\sgn(\omega)$**——论文 (2.14) 的 $\prod_r r!\cdot(-1)^{\sum\binom r2}$：$H=$ 列群（阶 $\prod r!$）、$\omega=$ 行反序（符号 $\prod_r(-1)^{\binom r2}$），完全一致。
- `repeatedTarget m := Fin.rev ∘ rowWord (stairTableau m)`（StaircaseSign.lean:L38-39）：输出字母 = $m-1-$行号（0 基），即论文 $t_m=\bigotimes f_{m+1-i}$ 的 0 基版本；内容"字母 $k$ 出现 $k+1$ 次" = 论文 $\alpha=(1,2,\dots,m)$。
- `dominatedQuotient m φ`（DominatedQuotient.lean:L82-89）= `orbitProjection (repeatedTarget m) ∘ pairSumMap ∘ pairAntiMap m φ ∘ signTwistMap(含入)`——论文第 6 步 $Q$（加法+内容投影）的完整组装；`pairAntiMap` 借第二因子的符号等价 $\phi$（= `staircase_sign_equiv`）把 signTwist 搬到输出侧，对应论文 (2.9)+(2.10) 的"扭转进第二因子 + $\phi$"。
- `repeatedTarget_in_quotient`（L93-119）：论文第 8 步非零性的镜像——在 signTwist 后的循环模里取列群符号和 $x$（`signed_average_staircase`，L59-80，= 论文 (2.6)），其象 = $(c\cdot q)\cdot\mathrm{Pi.single}(\mathrm{repeatedTarget})$，$c=$ 行平均系数、$q=|H|\sgn(\omega)\ne0$。

#### 3.4.5 StaircaseSign：$\phi$ 的显式构造与"交错线"

- `staircase_sign_equiv m`（StaircaseSign.lean:L97-157）：论文一句话带过的"Choose a $G$-isomorphism $\phi:V_C\otimes\epsilon\to V_R$"在 Lean 中是与 $\mu$ 无关的一般引理 `specht_sign_transpose`（SignEquivalence.lean:L91-151）的实例：$S^\mu\cong\mathrm{signTwist}(S^{\mu^t})$，用 `orbitAverage`（符号平均）+ 两个不可约性 + 非零性 ⇒ 双射。Lean 里 $\phi$ 不是"选择"而是被构造出来的具体映射。
- `alternating_specht_line`（StaircaseSign.lean:L159-178）：$H$-交错向量必是 polytabloid 的倍数 = 论文 (2.8) 的"维数 = 1"论证的**构造式**替代（Lean 不算维数，直接用 `columnAlt` 的秩一性质）。
- `rowAverage m`（L180-210）：$H_R$-平均的列 polytabloid（论文 $u$），`rowAverage_nonzero` 用 `polytabloid_rowWord` 的系数 1（= 论文第 3 步 $e_{a_0}$ 系数 $|H_R|$ 论证的替代：Lean 直接对行字求值，每个列群元素贡献 1）。
- `rowReversal`（L13-36）：$\omega$（行反序）作为列群的显式元素（`rowReversalCell` 把 $(i,j)$ 送到 $(i,m-1-i-j)$，对合）。

#### 3.4.6 CyclicSector/DominatedSupport：扇区诱导与半单提升（论文 Lemma 3.1 的替代技术）

- **论文** Lemma 3.1 给显式逆 $\Psi$ 的同构 $\C[G]\otimes_{\C[H]}A_0\cong\C[G]z$。**Lean** 不构造诱导模的余积模型，改用三条一般引理：
  1. `averagedMap ρ σ f := ∑ g, σg ∘ f ∘ ρg⁻¹`（CyclicSector.lean:L14-24）：任意线性映射的群平均自动等变。
  2. `sector_average_nonzero`（L43-74）：若 $f\ne0$、对 $H$ 等变、存在投影 $P$ 保持 $\mathrm{im}(f)$ 且**杀死 $H$ 外平移**，则平均非零（用 $P$ 作用于平均 = $|H|\cdot f$）。这就是论文 $\Psi$ "扇区选择"效果的平均化实现——投影 $P=$ `coordinateProjection (wordSector D A)` 起扇区选择作用。
  3. `sector_support_transfer`（L103-152）：把上述变成"循环模的指定生成子 → 检测出成分"的现成定理；`cyclic_projection_support`（L214-229）：**等变投影下成分可回提**——$f:\tau\to\mathrm{cyclic}(\sigma,Fv)$ 非零 ⇒ 存在非零 $\tilde f:\tau\to\mathrm{cyclic}(\rho,v)$。证明用 `intertwining_lift_surjective`（L78-92）= **半单模的提升性质**（`IsSemisimpleModule.lifting_property`，即 Maschke 的模论形式）：满映射 $F\circ-$ 可提升。这正是论文两处"semisimplicity ⇒ 成分回到 $W_m$"（Prop 3.2 末句、completion L144）的机器化。
- **差异**：Lean 全程在字坐标里，诱导模 $\Ind$ 从未出现；"满诱导商"命题（paper (3.9)）被替换为成分传递命题（`band_cut_support` 里的链式调用）。数学内容等价（诱导的成分 = 张量泛函的非零化），但证明结构不同：论文"构造同构再取成分"，Lean"平均 + 提升"。
- `signCancelMap`（DominatedSupport.lean:L143-156）：符号扭转在 intertwining map 上的"搬家"引理，对应论文 `tools:dual-sign` 的操作面。

#### 3.4.7 HighProjection/CoordinateSector/BandFactorization：高位置唯一性与切割（论文 Prop 3.2 第一、二段的 Lean 化）

- `sameHighProjection n d e s`（HighProjection.lean:L114-127）：逐位置保留"$\mathrm{splitLeft}$ 与 $\mathrm{splitRight}$ 同高（都 $\ge s$ 或都 $<s$）"的字对——论文 $p_s$。注意 Lean 直接在**字对字母表** `Fin d*Fin e` 上工作（`finProdFinEquiv`），没有形式张量积 $E\otimes E$。
- **高位置唯一性**（论文 (3.4)/(3.5) 的 Ryser margin）：Lean 用两条不同的路。
  - 一般路：`high_positions_rigidity`（HighProjection.lean:L43-93）——设 $g$ 保行、$k$ 保列、两层高集合相同，则高集合 $=\{i+j<h\}$。证明：$A=\{s\le(gx).2\}$、$B=\{i+j<h\}$，用 `highRowEquiv`/`highColEquiv`（$A$ 经行/列两种方式都双射到 $B_h$）得到 $A,B$ 的基数、行坐标和、列坐标和分别相等，然后签名权 $w(x)=2h-1-2i-2j$（$B$ 上为正、$B$ 外为负）的 `finset_eq_of_signed_sum` 取等 ⇒ $A=B$。
  - 应用：`staircase_projected_high_positions`（L129-168）——从 `sameHighProjection … (staircaseWord …) w ≠ 0` 出发，用 `polytabloid_support`（非零 polytabloid 的支撑字 = 行字的列群平移，L96-111）把 $w$ 的两层分别接到保行/保列置换，套一般路。**论文的"列 $j$ 取 $k=d_j$ 前缀取等"论证被替换为签名和取等**；两者都是 margin 论证，但 Lean 版与 `ferrers_rearrangement`（3.4.2）共享同一抽象引理。
- **旋转与符号因子化**（论文 (3.6)/(3.7)）：Lean 不显式写 $(-1)^{ab}\Alt(\text{high})\otimes\Alt(\text{low})$，而是构造行旋转 `rotateRow h s`（把每行低字母挪到带、高字母挪到 $B_h$，HighProjection.lean:L196-223）与列旋转 `rotateColumn = swap∘rotateRow∘swap`（L224-232）；`altWord_sector_rotated`（CoordinateSector.lean:L143-151）+ `altWord_sector`（L74-104）给出"投影保留的部分 = $\sgn(r)\cdot$ 扇区稳定子上的交错字"；`rotatePositions_sign`（L164-177）：两层旋转的符号**相等**（列旋转 = 共轭），相乘为 1 —— 这正是论文 $\prod_r(-1)^{2ab}=1$ 的角色，但实现为"同一符号出现两次"。最终 `staircase_cut_layers`（L180-204）：
  ```
  sameHighProjection s (staircaseWord (h+s)) = wordTensor (cutRowWord h s ⊗ cutColumnWord h s)
  ```
  即论文 (3.7) 的 $z=P_s(w_m)=\widetilde w_h\otimes u_{m,s}$ 的两层拆分。
- **切割组合**（BandFactorization.lean）：`cutPositions h s : Fin (staircase (h+s)).card ≃ Fin (staircase h).card ⊕ Fin (bandSize h s)`（L27-31）——论文的 $D,F$ 分解与扇区 $\Omega$ 的具体实现；`bandSize h s = |F|$；`highLetter h s`（L53-54）= 论文恒等 $E_h\cong E_{\mathrm{hi}}$ 的字母平移 $a\mapsto a+s$；`cutRowWord_factor`/`cutColumnWord_factor`（L142-167）= 论文 (3.8) 的 $A_0=\widetilde W_h\boxtimes U_{m,s}$ 因子化（通过 `altWord_fiber_split`：PositionSplit.lean:L82-107，交错群在独立块上分裂为积、符号为积——这是论文第 6 步"两段内部独立求和"的一般化）。
- **路径编号**：`bandPathEquiv h`（L217-218）= `pathCellsEquiv h ∘ (bandCellsEquiv h 2).symm`，坐标 $(h+1-(k+1)/2, k/2)$——论文 (4.2) 蛇形编号；`bandPath_card`：`bandSize h 2 = 2(h+1)+1 = 2m-1`。

#### 3.4.8 路径与矩阵层（论文 §4 的 Lean 化）

- **生成子作为系数泛函**：Lean 把 $u$（带交错张量）实现为字系数函数 `Path.bandWord r`（PathContraction.lean:L22-26）：
  ```
  bandWord r w = [首层首字母=0]·[末层末字母=0]·∏_i J(second(w(2i)), second(w(2i+1)))·J(first(w(2i+1)), first(w(2i+2)))
  ```
  ——论文 (4.5) 指数和的"闭式"版本：端点单点钉字母 0（0 基的 1），对块系数 $J$。两层合成：`paired_rowAlt`（BandPairing.lean:L156-166）证明行层 `rowAlt` 与反转列层的乘积 = $(-1)^r\cdot$`bandWord`，对应论文 (4.3) 的 $u=(-1)^{m-1}u_{m,2}$；`stairBandWord_path_eval`（BandSupport.lean:L28-41）把 `stairBandWord h 2` 在路径坐标下表为 $(-1)^{h+1}\cdot$`Path.bandWord`。
- **收缩公式**：`path_contraction`（PathContraction.lean:L141-160）：
  ```
  dotProduct (bandWord r) (pureWord X) = (-1)^r * (List.ofFn (q ↦ D(1+q) (X q))).prod 0 0
  ```
  其中 `D q X = if q % 2 = 0 then X.adjugate else X`（BandMatrices.lean:L21）。与论文 (4.4) 相同（Lean 的 $r=m-1$；$D(1+q)$：$q$ 偶恒等/奇伴随）。Lean 的推导路线不同：不做"逐次收缩 + 转置吸收"，而是 (a) 把 $X_q$ 按 `entry a`（矩阵单元）展开（`chain_expand`，多重线性），(b) 对纯字母字算闭式 `chain_entries`（L108-131，归纳 + `adj_entry`：$\adj(\mathrm{entry}\ a)_{ij}=-J_{i,a_2}J_{a_1,j}$，即 $JX^{\mathsf T}J=-\adj X$ 的单元版），(c) 两边配对。**数学核心相同**：$\Mat_2$ 的伴随线性恒等式。
- **段表**：论文 (4.9) 由反交换符号论证；Lean 提供两条路：
  - 暴力：`segment_one_even` … `segment_four_odd`（BandMatrices.lean:L54-166），8 个 `fin_cases`/`norm_num` 计算（`segment 2 0 = 2•basis 1`、`segment 3 * = -6•basis 3`、`segment 4 * = ±24•basis 0`），与 (4.9) 逐项一致（Lean 的 `basis 1=Z, 2=T, 3=J`）。
  - 代数：`ScaledBasis`（L172-176）"是某基元素的非零倍数"性质在乘法下封闭（`basis_mul` 16 个 case 查表，L181-247），`segment_scaled`（L256-269）对 $1\le r\le4$ 给 `blocks` 的封闭性。
- **统一 $Q$**：论文对每个 $\eta$ 取共轭 $Q$（特征向量法）；Lean 固定 $Q=\begin{pmatrix}1&1\\1&2\end{pmatrix}$（BandMatrices.lean:L278-279，正是论文 Example 4.7 的矩阵），`Q_basis_ne_zero`（L296-298）逐一验证四个共轭基元素的 $(0,0)$ 元素非零；`Band.conjugation`（BandPairing.lean:L11-61）与 $D_q$ 交换（`conjugation_D`）、`segments_conjugation` 把段乘积整体共轭、`conjugation_blocks_ne_zero` 收尾。**Lean 的"存在 $Q$"命题**（`band_nonzero_pairing`，L301-307）形式上仍是 $\exists Q$，但证明里 $Q$ 从不依赖 $rs$——比论文更强的均匀版本。
- **四行检测**：`fourRow_support`（BandPairing.lean:L111-127）：
  ```
  2 ≤ r → μ.colLen 0 ≤ 4 → ∃ f ≠ 0 : IntertwiningMap (spechtRep t) (cyclic (wordRep (2r+1) 4) (bandWord r))
  ```
  检验表 = `Columns.columnTableau μ`（ColumnContraction.lean:L228-229：按列递归枚举 Ferrers 图，列长表 `μ.transpose.rowLens`）；检验基 = `L(i) = Band.conjugation (basis i)`；非零配对由 `fourRow_tableau_noncancellation`（L98-107）+ `chainFunctional_endpoint`（L82-87：$\mathrm{chainFunctional}(2r{+}1)\ \text{端点} = (-1)^r\langle x,\mathrm{bandWord}\ r\rangle$）给出；最后 `hom_to_cyclic_of_pair`（SpechtDuality.lean:L120-139）把"配对非零"变成"到循环模的非零 intertwining map"。**方向与论文相反**（Lean：$S^\eta\to$ 带循环模；论文：带循环模 $\to\mathcal T_N^*$），由配对对称性（`bandWord_real`：bandWord 是实值，BandPairing/PathContraction 的 `bandWord_real`）与双模自对偶等价。Lean 还需 `mapped_columnTableau`（ColumnContraction.lean:L272-305）把 polytabloid 在 wordMap 下的象展开成 `Perms` 上的符号和、`sum_chain`/`segments`（L160-167）因子化为段乘积——对应论文 (4.10) 的分配展开论证。
- **`specht_rows_of_hom`**（SpechtClassification.lean:L232-247）与 `columnAlt_eq_zero_of_rows`（L200-228）：**论文没有的引理**——映射非零进 $d$ 字位置表示的 Specht 至多 $d$ 行（第一列放不下 $>d$ 个互异字母）。在 3.4.9 的分离论证中承担"成分行数 $\le$ 字母数"的关键约束。

#### 3.4.9 条链与粘合（论文 completion 情形 (ii) 的 Lean 化：LR 正性的替代）

- **单条水平带**：`pieri_strip_restriction`（StripExtension.lean:L201-222）——非零、对"保持被删带位置的置换"等变的映射 $F=\mathrm{pr}\circ T\circ\iota$；`wordRestrict`（PieriRestriction.lean:L35-37）= 在被删位置固定字母、其余位置对字母求和（论文没有这个名字，但它就是"与全 1 泛函收缩"）；非零性 `strip_contraction_pair`（StripExtension.lean:L172-198）——**论文 Lemma 2.2 引用 LR 的部分在 Lean 中是 200 行的显式构造**。`pieri_strip_surjective`（PieriRestriction.lean:L11-31）用不可约性把非零升级为满。
- **带尺寸/颜色的迭代**：`SizedStripChain bs ν μ`（SizedStrips.lean:L11-14）= 论文 $\nu=\lambda^{(0)}\subset\cdots\subset\lambda^{(q)}=\lambda$ 的归纳定义（带精确大小表 $bs$）；`stripChain_restriction`（L31-114）给颜色函数 $c$（$c=0$ ⟺ 格子在 $\nu$ 里；颜色 $j+1$ 的格子数 = $bs[j]$）与满的、对保色置换等变的映射——这是论文"选择互不相交子集 + 迭代 Pieri"（completion L107-117）的机器化，**且把置换模 $A$ 与分解 $\bigoplus(S^\eta)^{\oplus a_\eta}$ 整个绕开**。
- **两因子合成**：`strip_product_support`（StripSupport.lean:L76-131）：给定 (a) 高因子非零映射 $f:S^\nu\to\mathrm{cyclic}(\mathrm{shiftedStairWord})$，(b) 带因子假设 `hband : ∀ η (r : Tableau b η), η.colLen 0 ≤ bs.length → ∃ F ≠ 0 : … → cyclic (stairBandWord)`，则存在非零 $F:S^\lambda\to\mathrm{cyclic}(\mathrm{positionProduct}\ e\ v\ u)$。中间件：
  - `placed_strip_restriction`（L13-69）：把带尺寸链的颜色任意地放到给定块分解 $e:\mathrm{Fin}\ n\simeq \mathrm{Fin}\ a\oplus\mathrm{Fin}\ b$ 上（高块颜色 0）；
  - `bandOrbitMap`（BandOrbit.lean:L35-41）：把 $F_0$ 沿带位置置换平均，得到带颜色坐标 $(\mathrm{Fin}\ b\to\mathrm{Fin}\ k)$ 上的等变映射（$k=bs.\mathrm{length}$）；
  - `bandGlue`/`bandGlue_sector_exists`（BandGlue.lean:L15-213）：对带颜色字用 `word_support_separates`（SupportSeparation.lean:L130-157）选出不杀死该颜色字的带 intertwining map $L$，粘合成 $X\to\mathrm{WordSpace}\ n\ d$ 且落入扇区。
- **`word_support_separates` 是 LR 正性的替代**：它说"若带循环模含每个 $\le k$ 行的 Specht 型，则对任何非零带字 $x$ 存在 $f$ 使 $f(x)\ne0$"。证明：半单模的支撑 = 简单子模全覆盖（`hom_separates_of_simple_support`，用 `IsSemisimpleModule.eq_bot_or_exists_simple_le` 与扩张性质）；每个简单子模经 `irreducible_equiv_specht` + `specht_rows_of_hom` 得到 $\le k$ 行的形状，由 `hband` 命中。**于是论文 (5.3) 的 $\sum_\eta a_\eta c_{\nu,\eta}^\lambda>0$ ⇒ 存在 $\eta$ 的论证，被"逐个简单子模命中"完全替代**；"每个成分至多 $q$ 行"（completion L129-133 的组合论证）被 `specht_rows_of_hom`（字母数界行数）替代——注意两者的机制不同：论文数"新增行"，Lean 数"颜色字母数 $k=bs.\mathrm{length}\le4$"。`support_relabel`（CyclicSector.lean:L253-265）、`cyclic_smul_eq`/`cyclic_action_eq`（L233-251）处理生成子的重标与缩放。
- **宽 1/宽 2 带供给**（Main 的 `hband` 实参）：`oneBand_support`（BandSupport.lean:L326-330）= 论文 (4.1)：`stairBandWord h 1` 被一切置换固定（`oneBand_invariant`，经 `alphabet_small_invariant`：单字母字母表上的字恒固定）⇒ 一维平凡成分；`twoBand_support`（L45-62）= Prop 4.6 的 Lean 版，带路径重标（`support_relabel` + `bandPathEquiv`）、常数缩放（`cyclic_smul_eq`）与投影回提（`cyclic_projection_support (restrictLetters (lowPairLetter h))`）。

#### 3.4.10 扫除归约与最终组装（StripReduction/Main）

- `strip_reduction`（StripReduction.lean:L139-162）：与论文 Lemma 5.1 一致的二分：情形 (i) `stripRemove μ m`（$\mu.\mathrm{rowLen}\ 0\ge m$ 分支）；情形 (ii) `strip_reduction_capacity`（L105-137：输出 `5 ≤ m ∧ 2*m-1 ≤ rowPrefix μ 4`，内含 (5.1) 的 $k\ge4$ 排除——`hk4 : 4 ≤ k` 的 `interval_cases` + `omega`——与 (5.2) 的均值论证 `rowPrefix_mean`）+ `stripChain_of_capacity`（L22-57：容量归纳实现"整扫 + 部分扫"，$q\le4$）。**差异**：论文的锐性示例 $\lambda=(8^{11},3)$（$q=4$ 紧）不在 Lean 中——Lean 不证紧性。
- `full_cyclic_support`（Main.lean:L58-79）：强归纳；$m=1$ 由 `staircase_one_dominates`（L47-54：$m=1$ 的阶梯支配一切同基数图——论文基"$W_1$ 一维"的代数化）；非支配时 `strip_reduction` 的两种结果都汇入 `band_cut_support`（L28-45）：
  1. `shiftedStairWord_support`：归纳假设的映射沿 `pairLift (highLetter h s)` 提升到高字母层；
  2. `strip_product_support`：与带因子合成（见 3.4.9）；
  3. `rw [← staircase_cut_factor]`：识别 `positionProduct (cutPositions) (shiftedStairWord) (stairBandWord) = sameHighProjection s (staircaseWord (h+s))`；
  4. `cyclic_projection_support (sameHighProjection …) (staircaseWord (h+s)) F`：经等变投影 $P_s$ 回提到 `staircaseCyclic (h+s)`。
- `cyclic_saxl_conjecture`（L82-84）直接包装；`saxl_conjecture := saxl_of_cyclic_support cyclic_saxl_conjecture`（L88），其中 `saxl_of_cyclic_support`（CyclicTensor.lean:L146-159）复合 `staircaseToTensor m`（嵌入 $\mathrm{staircaseCyclic}\hookrightarrow\mathrm{Specht}\otimes\mathrm{Specht}$，CyclicTensor.lean:L114-126，用 `intertwiningLiftSubrep`）并论证单射性 ⇒ kronecker > 0。
- **额外包装定理**（论文没有对应物或只有口述）：
  - `saxl_contains_every_irreducible`（Main.lean:L96-108）：任何 $S_{N_m}$ 的不可约复表示**单射**映入 $S^{\rho_m}\otimes S^{\rho_m}$——用 `irreducible_equiv_specht`（分类）+ `staircaseToTensor_injective`。这是论文摘要"contains every irreducible representation"的字面化。
  - `saxl_kronecker_pos`（L112-122）：以**字面次数** $m(m+1)/2$（`hμ : μ.card = m * (m+1)/2`）陈述的正性——处理"图基数相同但次数表述不同"的搬运（`staircase_card`）。
  - `cyclic_saxl`（L92）：与 `cyclic_saxl_conjecture` 相同的别名导出。

### 3.5 论文 ↔ Lean 对应差异总表

| 论文条目 | Lean 声明 | 差异性质 |
|---|---|---|
| Lemma 2.1（polytabloid 同构，引用 James） | `polytabloid`/`spechtSub`/`specht_irreducible`（SpechtSubmodule） | Lean 从零证不可约性；同构本身不陈述（Specht 直接定义为循环模） |
| (2.2) 共轭反转支配 | `dominates_transpose` + `corner_inequality`/`corner_equality`（DominatedSupport） | 证明换成角点不等式，非 max 公式 |
| Lemma 2.2（Pieri） | `pieri_strip_restriction`/`pieri_strip_surjective`（StripExtension/PieriRestriction） | 只做正方向、单带、显式收缩构造；不引 LR |
| Lemma 2.4（Young 规则） | `young_invariant_functional`（YoungRule）+ `sizedStripChain_of_dominates` | 只做充分性、对偶（泛函/轨道映射）形式；无重数一、无必要性 |
| Prop 2.5（dominated） | `dominated_support`（DominatedSupport） | 结构不同：Lean 走"cyclic → word → $S^{\mu^t}$ → 符号回扭 → 提升"，论文走"$W_m\otimes\epsilon\supset Z_m\twoheadrightarrow M^\rho$"；数值（$|H|\sgn\omega$）一致 |
| Lemma 3.1（扇区诱导 + 显式逆） | `averagedMap`/`sector_average_nonzero`/`sector_support_transfer`（CyclicSector） | Lean 不构造诱导模；平均 + 投影杀死扇区外平移 |
| Prop 3.2（带商） | `sameHighProjection`+`staircase_cut_layers`+`staircase_cut_factor`+`strip_product_support`+`cyclic_projection_support` | 论文：满诱导商。Lean：成分传递链；无 $\Ind$、无 $\boxtimes$ |
| (3.4)/(3.5) 高位置唯一（Ryser） | `high_positions_rigidity`+`staircase_projected_high_positions`（HighProjection） | 证明换成签名权 $2h-1-2i-2j$ 取等；引理是论文没有的一般形式（保行/保列置换 + 同高集合） |
| (3.6)/(3.7) 符号因子化 | `rotateRow`/`rotateColumn`/`altWord_sector_rotated`/`rotatePositions_sign`/`staircase_cut_layers` | 论文用 $(-1)^{ab}$ 逐块计数；Lean 用行旋转 + 共轭列旋转，符号相等相消 |
| (4.1) $U_{m,1}\cong S^{(m)}$ | `oneBand_support`/`oneBand_invariant` | 一致（单字母表固定性） |
| (4.2)-(4.3) 路径编号与符号 | `bandPathEquiv`/`pathCellsEquiv`/`paired_rowAlt`/`stairBandWord_path_eval` | 一致；Lean 显式给出坐标公式 $(h+1-(k+1)/2,k/2)$ |
| Lemma 4.3（收缩公式） | `path_contraction`（PathContraction） | 同一恒等式；Lean 经单元展开 + 归纳闭式，论文经指标收缩 + 转置吸收 |
| Lemma 4.5（段交错） | `segment_*_even/odd` 8 式 + `ScaledBasis`/`segment_scaled` | 表 (4.9) 一致；Lean 双路线（暴力 + 代数封闭性），无 $e-\delta$ 符号论证 |
| Prop 4.6（四行检测） | `fourRow_support`（BandPairing）+ `Band.conjugation`/`Q_basis_ne_zero` | 论文：依赖 $\eta$ 的 $Q$（特征向量）；Lean：统一 $Q=\begin{pmatrix}1&1\\1&2\end{pmatrix}$ + 基元素四查；方向相反（$S^\eta\to$ 带模） |
| Lemma 5.1（带归约） | `strip_reduction`/`strip_reduction_capacity`/`stripChain_of_capacity` | 一致；锐性示例 $(8^{11},3)$ 不在 Lean |
| `thm:cyclic-saxl` 证明 | `full_cyclic_support`/`band_cut_support`（Main） | 一致的强归纳骨架；(i)/(ii) 汇入同一 `band_cut_support` |
| `thm:saxl` | `saxl_conjecture` = `saxl_of_cyclic_support …` | Lean 额外提供 `saxl_kronecker_pos`（字面次数）与 `saxl_contains_every_irreducible`（任意不可约单射入） |

### 3.6 论文一句带过、Lean 必须展开的引理清单

1. **"Specht 模不可约"**（论文引 James Theorem 4.12）→ Lean `specht_irreducible`，附带 `polytabloid_real`（polytabloid 实值）、`cyclic_star`（star 稳定性）、`specht_detect`（非零向量可检测，正定性）。为在 $\C$ 上谈 star-正定还需要 `let : StarOrderedRing ℂ := RCLike.toStarOrderedRing` 这类类型类搭桥（SpechtSubmodule.lean:L158-160）。
2. **"形状不同的 Specht 不同构"**（论文不需要明说，但分类需要）→ `specht_shape_rigidity`（ShapeRigidity.lean:L211-218），用行矩 `rowMoment` 的混合不等式 `mixed_moment_le`（$w(c)=2\mu.colLen(c.2)-2c.1-1$ 的又一个签名和引理）。
3. **"复不可约表示都是某个 Specht"**（论文由完全可约性一句带过）→ `irreducible_equiv_specht`（SpechtClassification.lean:L170-196）：类函数空间维数上界（`classEvaluation` 单射）、Specht 特征的标准正交（Mathlib `Representation.char_orthonormal`）、反证 + 线性无关。
4. **"符号平均非零"**（论文 (2.6) 后"取 $e_{a_0}$"）→ Lean 用 `polytabloid_rowWord` 的系数 1 与 `orbitAverage_base`（固定字轨道平均 = 固定群阶数倍）。
5. **"半单性给出成分回提"**（论文 Prop 3.2 末句、completion L144）→ `intertwining_lift_surjective` + `cyclic_projection_support`（Mathlib `IsSemisimpleModule.lifting_property`）。
6. **"改变表列举给出同构"**（论文"changing enumeration gives isomorphic"）→ `spechtSub_tableau_independent`/`polytabloid_move`（TableauTransport.lean:L39-77，含 columnMove 的共轭与符号不变性）。
7. **"改变对偶基不改变结论"**（论文 Lemma 2.1 末句）→ Lean 中不出现——因为对偶检验基直接进 `wordMap L` 的系数矩阵 $L$，"基变换"只是换 $L$（`conjugation` 乘法性质）。
8. **"空分拆与平凡群 $S_0$"**（论文 L122-123）→ Lean 用 `card_zero_iff_bot`、`StripChain.nil`、`Empty` 类型层层显式处理（HorizontalRemoval.lean:L23-28、StripExtension.lean:L133-134 的空带 `HorizontalStrip ν ν`）。
9. **"$u_{m,1}$ 是常数字"**（论文 (4.1) 一句话）→ `oneBand_invariant` 需要先证 `alphabet_small_invariant`（单元素字母表上的字被所有置换固定，BandSupport.lean:L254-273）。
10. **"颜色格子数 = 带大小"**（论文 (ii) 中取互不相交子集）→ `extendColor_count_old/count_new`（StripExtension.lean:L82-117）——颜色延拓的逐色计数引理。

### 3.7 Lean 缺失、替换与额外部分

**Lean 缺失（论文有而形式化不做）**：
1. Kronecker 系数的**显式数值**或 LR 理论——Lean 从不需要（只要正性）。
2. 锐性示例 $\lambda=(8^{11},3)$（$q=4$ 紧性）。
3. 引言的历史/伴随论文叙述（`universaltensorsquares2026` 等文献推导）。
4. 图 1（B_3 带的插图）与 Example 4.7 的"若不共轭则为零"警示——Lean 的统一 $Q$ 使该警示失去形式化必要（但 Lean 的 $Q$ 恰取 Example 4.7 的矩阵，暗示作者知道该例）。

**Lean 替换（同定理不同证）**：
1. Ryser margin ⇒ 签名和取等（两处：Ferrers 重排、高位置刚性）。
2. 显式诱导逆 $\Psi$ ⇒ 群平均 + 半单提升。
3. LR 一行特化 ⇒ `wordRestrict` 收缩构造。
4. (5.3) LR 正性 ⇒ `word_support_separates` 简单子模分离（配合 `specht_rows_of_hom` 的"字母数界行数"）。
5. 依赖 $\eta$ 的共轭矩阵 ⇒ 统一 $Q$ 四查。

**Lean 额外（论文没有）**：
1. `saxl_contains_every_irreducible`：任意不可约复表示单射入阶梯平方（论文摘要有此语、正文由 cyclic 语句直接可得，Lean 显式组装并用到分类定理）。
2. `saxl_kronecker_pos`：字面次数 $m(m+1)/2$ 的 kronecker 正性。
3. 一整套"一般有限群"工具（`cyclic`、`averagedMap`、`sectorGroup`、`fiberGroup`、`altWord`）——为让阶梯论证复用而做的抽象化。

**公理面**：`permitted_axioms = [propext, Quot.sound, Classical.choice]`；通读全部 39 文件未见自定义 `axiom`；非构造性以 `classical`/`by_contra` 大量出现（经典逻辑），`Fintype.ofFinite` 桥接有限群求和。`enable_nanoda: false`。

---

## 四、常数与参数表

### 4.1 尺寸常数

| 记号 | 值 | 首次出现 | 机械作用 |
|---|---|---|---|
| $N_m$ | $m(m+1)/2$ | (1.1) | 阶梯次数；$N_m-m=N_{m-1}$、$N_m-(2m-1)=N_{m-2}$ 是两条切割的大小恒等式 |
| $\rho_m$ | $(m,m-1,\dots,1)$ | (1.1) | 自共轭（$\rho_m^t=\rho_m$）——支配情形 $\Hom$ 计数与因子同构 $\phi$ 的存在性都靠它 |
| $s$ | $1$ 或 $2$ | (3.1) | 带宽；$s=1$ 配平凡带 + 单步 Pieri；$s=2$ 配 $\Mat_2$ 路径计算 |
| $\lvert F\rvert$ | $s(2m-s+1)/2$ | (3.1) 后 | $s=1$：$m$（对角线长）；$s=2$：$2m-1$（扫除目标） |
| $K$ | $2m-1$ | §4 | 宽 2 带位置数（奇数），路径编号 $p_1,\dots,p_K$；$K=2(h+1)+1$（Lean `bandPath_card`） |
| $V^*$ 基大小 | $4=\dim\Mat_2(\C)$ | (4.7) | 检测行数上限 $\len(\eta)\le4$ 的硬来源；$M_1=I,M_2=Z,M_3=T,M_4=J$ |
| 段长上限 | $r\le4$ | (4.9) | 表列长 $\le4$（4 行形状）；段矩阵 = $r!\,(\pm)$基元素 |
| $q$ | $\le4$ | Lemma 5.1(ii) | 扫除条数上限；= 段数 = 表列数；紧例 $\lambda=(8^{11},3)$，$m=13$ |
| $m$ 下界集合 | 支配任意 $m\ge1$；(i) 任意 $m\ge2$；(ii) $m\ge5$；§4 需 $m\ge3$ | 各节 | (ii) 的 $m\ge5$ 自动满足 §4 的 $m\ge3$（$h=m-2\ge3$） |
| $e,\delta$ | 段内偶位置数；起点奇偶 | Lemma 4.5 | $A_{r,p}=r!(-1)^{e-\delta}M_1\cdots M_r$ 的符号数据 |

### 4.2 符号/系数常数

| 常数 | 值 | 出处 | 机制 |
|---|---|---|---|
| $\sgn(\omega_r)$ | $(-1)^{\binom r2}$ | (2.14) | 行反序的符号；$\sum_r$ 给总系数符号 |
| $\lvert H_R\rvert$ | $\prod_{r=1}^m r!$ | (2.6)/(2.14) | 行群阶 = polytabloid 中固定字的系数；Lean `Nat.card (columnGroup …)` |
| $Q(v_{R_m}\otimes v_{R_m})$ 系数 | $(-1)^{\sum\binom r2}\prod r!$ | (2.14) | 无相消（同号相加）；Lean `(Nat.card H) * signC ω` |
| $(-1)^{ab}$ | 块跨段逆序数 | (3.6) | 高段×低段大小；行列成对抵消 $\prod(-1)^{2ab}=1$ |
| $u=(-1)^{m-1}u_{m,2}$ | 列对反转数 | (4.3) | $m-1$ 个列对各反一个序 |
| $J$ | $\begin{pmatrix}0&1\\-1&0\end{pmatrix}$ | §4 | 对块交错系数；$JX^{\mathsf T}J=-\adj X$、$J^2=-I$ |
| $\adj(X)$ | $\tr(X)I-X$ | (4.6) | $2\times2$ 特有线性性——整个 §4 的可线性化根源 |
| 段矩阵表 | $\pm r!\,\{I,Z,J,I\}$ | (4.9) | $r=1,2,3,4$：$\pm1\cdot I,\pm2Z,\mp6J,\pm24I$（奇偶列见原文） |
| $\beta$ | $B$ 的非零特征值 | (4.11) | 配对终值 $(-1)^{m-1}\beta$；Lean 里换成 $(Q\,\mathrm{basis}_i\,Q^{-1})_{00}$ 四查 |
| $Q$ | $\begin{pmatrix}1&1\\1&2\end{pmatrix}$ | Example 4.7 / Lean `Band.Q` | 论文：依赖 $\eta$；Lean：统一固定 |
| $c$（平均系数） | $\#\{g:\mathrm{rowWord}\circ g=\mathrm{rowWord}\}$ | Lean `orbitAverage_base` | 固定群阶，扮演 $|H_R|$ |

### 4.3 阈值不等式（组合引擎）

| 不等式 | 内容 | 用途 |
|---|---|---|
| (2.13) | $\sum_j c_j=r^2$，$\sum_jc_j^2-r^3=\sum_j(c_j-r)^2\ge0$ | 平方刚性，唯一存活字 |
| (3.4) | $\sum_{i\le k}r_i=\#\{B_h:i\le k\}=\sum_j\min(k,d_j)$ | 高位置 = $B_h$（margin 取等） |
| (5.1) | $\exists k<m:\sum_{i\le k}\lambda_i>km-\binom{k}{2}$（$\rho_m$ 前 $k$ 行和） | 支配失败点；$k\le3$ 排除 ⇒ $m\ge5$ |
| (5.2) | $\sum_{i\le4}\lambda_i>\frac4k\cdot(km-\binom k2)\ge2m+4>2m-1$ | 前四行容量 ⇒ 4 次扫除够 |
| `rowPrefix_mean`（Lean） | $q\cdot\mathrm{rowPrefix}\ \mu\ k\le k\cdot\mathrm{rowPrefix}\ \mu\ q$ | 均值单调的乘积形式（(5.2) 的机器版） |
| 签名权 $w(c)=2h-1-2i-2j$ | $B_h$ 上正、外负 | Lean 高位置唯一性（替代 Ryser） |
| $w(c)=2\,\mathrm{rowLen}(c_1)-2c_2-1$ | Ferrers 上正、外负 | Lean Ferrers 重排（替代/支撑 James 论证） |

---

## 五、开放问题与可信度审查

### 5.1 论文明确承认或暗示的边界

1. **只证支撑（正性），不给公式**：引言明言"Throughout, the objective is support, or positivity, rather than a formula for Kronecker multiplicities."——$g(\rho_m,\rho_m,\lambda)$ 的具体值（除 $S^{\rho_m}$ 重数一这类特款）完全未知。
2. **需"一份拷贝"的循环强化**：证明只能给出 $W_m$（单个带生成子的循环模）内的覆盖，这是比 $S^{\rho_m}\otimes S^{\rho_m}$ 更强的陈述；伴随论文 `universaltensorsquares2026` 用它构造 $n\notin\{2,4,9\}$ 的万有平方——$n\in\{2,4,9\}$ 的例外不在本文讨论范围。
3. **$s\le2$ 的带宽限制**：带计算依赖 $\Mat_2$ 的伴随线性性；宽 $\ge3$ 的带没有对应的显式成分检测（[推测] 若有 $\Mat_3$ 类似的"反交换线性基 + 伴随线性"结构则可推广，但目前未知）。
4. **诱导商的象不在原 Specht 因子内**（band-quotient.tex:L200-203）：商映射不可避免地离开 $V_R\otimes V_C$ 的"自然"坐标——任何想保持因子分解的重构都会失败。

### 5.2 可信度审查要点（供反推笔记自查）

1. **交叉验证状态**：主定理 `OAI.Saxl.saxl_conjecture` 有完整的 Lean 形式化（39 模块、约 7558 行），公理面仅 propext/Quot.sound/Classical.choice；且 Lean 与论文的**证明路线在多处实质不同**（诱导商 vs 平均+提升、Ryser vs 签名和、依赖 $\eta$ 的 $Q$ vs 统一 $Q$、LR 正性 vs 分离引理）——两条独立路线到达同一结论，出错概率大幅降低。
2. **数值一致性抽查**（论文 ↔ Lean）：
   - 多边形块系数 $|H|\sgn\omega$：论文 $(-1)^{\sum\binom r2}\prod r!$ ↔ Lean `Nat.card H * signC ω` ✔；
   - 段表 (4.9) ↔ Lean `segment_*_even/odd` ✔（含 $r=3$ 双列为 $-6J$ 的细节）；
   - 路径长 $K=2m-1$ ↔ `bandSize h 2 = 2*(h+1)+1` ✔；
   - $m\ge5$（情形 ii）↔ `strip_reduction_capacity` 的 `5 ≤ m` ✔；
   - $m=1$ 基 ↔ `staircase_one_dominates` ✔。
3. **潜在弱点（已在正文批注为 [推测]）**：
   - (2.13) 的 $\sum r^3$ 与行和 $r^2$ 的"巧合"是证明对阶梯形状的特殊依赖——非阶梯无此刚性；
   - 共轭步骤（Example 4.7）表明配对可为零——任何复述若省略 $Q$ 共轭即错；
   - "每个成分至多 $q$ 行"（论文数新行）与 Lean 的"字母数界行数"（`specht_rows_of_hom`）机制不同但结论一致——反推笔记若混合两种表述需小心前提。
4. **论文内部自洽性**：Theorem 1.2（cyclic）⇒ Theorem 1.1 的桥（$W_m\subseteq S^{\rho_m}\otimes S^{\rho_m}$）只依赖 $\rho_m^t=\rho_m$ 与 Lemma 2.1，无循环引用；归纳强于弱归纳之处（(ii) 用 $m-2$）由 $m\ge5$ 保证指标正性（completion.tex:L146 注明）。

### 5.3 可延伸的开放方向（[推测]，供笔记讨论）

1. ** Kronecker 系数的下界/公式**：本证明给出成分存在，能否从构造中读出 $g(\rho_m,\rho_m,\lambda)\ge1$ 之外的定量信息（例如通过 $W_m$ 的维数或生成子的稳定子）？
2. **一般 $k$-带的矩阵推广**：$\Mat_2$ 上 $I,Z,T,J$ 的反交换结构在 $\Mat_k$ 上的类似物是否足以检测 $\le k^2$ 行的成分？（这将把 companion 论文的 $n\notin\{2,4,9\}$ 例外压缩。）
3. **其它"自共轭支配生成子"**：把 $v_{R_m}\otimes v_{C_m}$ 换成别的 polytabloid 对（例如矩形 $\square_{a\times b}$），同样的切割-带-归约骨架是否给出新的覆盖定理？（需要 (a) margin 取等结构、(b) 带因子成分检测、(c) 带归约的组合替代，三者同时成立。）
4. **半群/渐近结果的组合化**：Luo–Sellke 的渐近覆盖与本文的逐点覆盖之间的"例外集"是否可用本文的带机制显式界定？

### 5.4 取证材料索引（绝对路径）

- 论文 TeX：`E:\math\preprints\A-Cyclic-Polytabloid-Proof-of-Saxls-Conjecture-September-24-2026\build\paper.tex`；`build\sections\{introduction,specht-tools,dominance,band-quotient,path-band,completion}.tex`；`references.tex`
- README：`E:\math\preprints\A-Cyclic-Polytabloid-Proof-of-Saxls-Conjecture-September-24-2026\README.md`
- 形式化登记：`E:\math\lean\formalization.yaml`（L72-75、L1478-1480）；`E:\math\lean\ComparatorChallenges\Saxl.json`
- Lean 模块目录：`E:\math\lean\OAI\RepresentationTheory\Saxl\`（Main.lean 为终点；`OAI.Saxl.saxl_conjecture` 为登记的最终声明）

---（素材完）

EOF

