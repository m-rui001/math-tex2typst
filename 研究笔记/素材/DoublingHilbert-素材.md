# Doubling-Hilbert 无有限维 bi-Lipschitz 嵌入 —— 思维链素材

> 论文：*A doubling Hilbert subset with no finite-dimensional bi-Lipschitz embedding*（OpenAI，2026-09-25）
> tex 源：`E:\math\preprints\A-doubling-Hilbert-subset-with-no-finite-dimensional-bi-Lipschitz-embedding-September-25-2026\build\main.tex`（单文件自包含，无 \input）
> Lean：`E:\math\lean\OAI\Geometry\DoublingHilbert\`（28 个 `.lean` 文件，按 `wc -l` 合计 4664 行），挑战配置 `E:\math\lean\ComparatorChallenges\DoublingHilbert.json`，`formalization.yaml` 第 87 行条目。
> 本文件只做素材采集，不写叙事笔记。所有不确定处标 [推测]。

## 目录

- 一、定理总览
- 二、逐引理带批注重构（主体）
  - 2.1 定义层：doubling、bi-Lipschitz、集合 $S$ 的构造
  - 2.2 Proposition（doubling 界 $76800$）
  - 2.3 层（sheets）、good points、紧致集 $K$ 与 $A,B$
  - 2.4 Lemma（lexicographic 极大值附近）
  - 2.5 方差恒等式与线积分约定
  - 2.6 近极值矩形的-setup（$N$、$n$、$r$、$Q$、$F_i$）
  - 2.7 Proposition（各向异性能量估计）
  - 2.8 Crossings：打包矛盾
  - 2.9 Corollary（有限-$p$ 函数空间障碍）
  - 2.10 Corollary（任意无限维 Banach 空间中的紧障碍）
- 三、叙事时间线（论文自述动机与英文原文引用）
- 四、Lean 取证
  - 4.1 元信息与 `sorry`/公理核查
  - 4.2 模块结构与依赖链（28 文件角色表）
  - 4.3 主线逐模块取证（4.3.1–4.3.12）
  - 4.4 Banach 支线（`CompactBanach` 链）
  - 4.5 论文句子 ↔ Lean 语句对照表
  - 4.6 七处结构性分歧（论文 vs Lean）
  - 4.7 tactic 卡点与绕行手法
  - 4.8 形式化状态总评
- 五、常数与参数表
  - 5.1 逐数值表（数值｜论文位置｜Lean 位置｜作用｜敏感度）
  - 5.2 三个常数家族（A 松弛族／B 编码族／C 几何刚性族）
---

# 一、定理总览

## 1.1 主定理精确陈述（tex 原文照抄，`\label{thm:main}`，Introduction 末尾）

```latex
\begin{theorem}\label{thm:main}
There is a fixed subset $S$ of real $\ell_2$, equipped with its induced Hilbert
distance, whose doubling constant is at most $76800$ and which admits no
bi-Lipschitz embedding into $\R^k$ for any positive integer $k$, at any finite
distortion.
\end{theorem}
```

紧随其后的一句话（tex 原文）：

> "In particular, dimension and distortion bounds depending only on the doubling constant cannot hold for all doubling Hilbert subsets."

摘要（abstract）原文（比主定理更强的 Banach 版声明）：

> "Every infinite-dimensional real Banach space contains a compact doubling subset that admits no bi-Lipschitz embedding into any finite-dimensional real normed space. The doubling constant has a universal bound, independent of the ambient Banach space. This answers the Lang--Plaut problem negatively, even for compact subsets of Hilbert space."

## 1.2 两个基础定义（tex 原文，Section 1）

```latex
A metric space $(X,d)$ is \emph{doubling with constant at most $\lambda$} if
every ball in $X$ is covered by at most $\lambda$ balls of half its radius,
with centers in $X$. A map $f:X\to\R^k$ is a \emph{bi-Lipschitz embedding with
distortion at most $D$} if there is a scale $a>0$ such that
\[
 a\,d(x,y)\le\norm{f(x)-f(y)}\le Da\,d(x,y)
 \qquad(x,y\in X).
\]
Both the target dimension $k$ and the distortion $D$ are required to be finite.
```

批注：注意三个量化细节——(i) 覆盖 balls 的**球心必须在 $X$ 内**（intrinsic covering）；(ii) 半径是"一半"（half its radius）；(iii) 尺度 $a$ 是存在量词、写在前面，distortion $D$ 与 $k$ 都是"某个有限值"。Lang–Plaut 问题问的是：对 Hilbert 空间的 doubling 子集，是否**总存在某个** $k$ 和某个 $D$（可以任意大，只要求有限）。反例必须对**所有** $(k,D)$ 同时失败，所以构造 $S$ 时必须"先固定 $S$，后面对任意 $k,D$ 再选参数"——tex 第 113 行明写："Neither $S$ nor its defining parameters will subsequently depend on a proposed embedding."

## 1.3 构造的集合是什么（一句话版）

$S$ 是 $\mathcal H=\R^2\oplus\bigoplus_{j\ge1}\R^{N_j}\cong\ell_2$ 中的点集 $(p,w)$：底座 $p\in\R^2$，尾巴 $w$ 有限支撑，第 $j$ 层坐标只能取 $0$ 或 $r_j e_{j,i}$，且取 $e_{j,i}$ 当且仅当 $p$ 落在第 $j$ 层第 $i$ 色的横条或竖条里（横条宽 $r_j$、竖条宽 $W_j r_j$，$r_j=1000^{-j}$，周期着色用 $N_j$ 种色）。它是"平面 + 一层层稀疏的正交小尾巴"：尾巴尺度以 $1000$ 倍速分离，所以任意球里最多一层"中间尺度"活跃 → doubling；每一活跃层在平面上刻出一个"棋盘"（$N n r\times Nr$ 的周期块），任何 Lipschitz 嵌入想同时保住横、竖两个方向的分离都会导出导数极值矛盾 → 装不进任何 $\R^k$。

对应 Assouad 型定理的哪一侧：Assouad（及 Naor–Neiman 的维度改进）说 doubling $(X,d)$ 的 **snowflake** $(X,d^\alpha)$ 可双 Lipschitz 嵌入某 $\R^k$。Lang–Plaut 问的是 $\alpha=1$（原始距离）且源空间恰好住在 Hilbert 里时能否保留结论。本文答"否"：即 **snowflake 定理在 $\alpha=1$ 不可去 snowflake**，即便源是 Hilbert 空间的子集、允许任意有限维与任意有限 distortion。doubling 常数 $76800$ 是**固定集 $S$ 的统一上界**，与 $k,D$ 无关；障碍是"$k,D$ 任意但固定后，$S$ 的某一层（依赖 $k,D$ 与循环出现的参数对 $(N,n)$）必然击穿嵌入"。

## 1.4 全文依赖图

```
Section 2 (construction)
  定义 S, r_j=1000^{-j}, (N_j,W_j) 无限循环, H_{j,i}/V_{j,i}/U_{j,i}
      └─► Proposition (doubling ≤ 300·16² = 76800)     [独立于后面所有部分]

Section 3 (sheets & extremal derivatives)
  反设 f: S→R^k 满足 (eq:bilip)（下常数归一为 1）
  sheet F_w；Rademacher + Lebesgue ⇒ good points (eq:good)
  K = closure{ (‖F_x‖², ‖F_y‖²) }，A = max第一坐标, B = max第二坐标|第一=A (eq:AB)
      └─► Lemma (near lexicographic max, lem:compact)
      └─► 方差恒等式 (eq:variance) + 沿线段积分(Fubini)

Section 4 (energy, prop:energy)
  N >(1+2D)^k (eq:N)；对每个 n 选近极值 sheet/点 (eq:nearmax)、方块 Q⁰ (eq:baseerror)、
  取循环层 (N_j,W_j)=(N,n) 且 Nnr<l·n^{-8}/100 (eq:fine)；矩形 Q 平铺周期块
  选择场 G_H^x, G_V^x, G_V^y；K-界 (eq:Kbounds)
      └─► n²·⟨‖G_H^x−F_x‖²⟩_Q → 0    (eq:horizontal)
      └─► ⟨‖G_V^y−F_y‖²⟩_Q → 0        (eq:vertical)
          （竖列先经 ⟨‖G_V^x‖²⟩→A（eq:eta），再由 lem:compact 得 limsup⟨‖G_V^y‖²⟩≤B (eq:Vynorm)）

Section 5 (crossings, sec:crossings)
  选能量均值为 ε_n→0 的周期块 P；Fubini 选每色一行一列 (eq:rowline)(eq:colline)
  h_i=(F_i−F)/r 的振动 ω_n=N√(2Nε_n)→0 (eq:omega)
  交叉点 (x_m,y_i) 处两个标签都合法 ⇒ 源距离恰 √2 r
      └─► ‖z_i−z_m‖ ≥ √2 − 2ω_n > 1
      └─► 体积打包 N ≤ (1+2D)^k，与 (eq:N) 矛盾。  ∎ thm:main

Section 6 (cor:lp)：  归一化 Gauss 级数 J_p: ℓ_2 → L_p[0,1] 等距
      └─► 同一 S 在每个 L_p（1≤p<∞）中有 doubling≤76800 的无障碍副本

Section 7 (cor:banach)：
  thm:main + 紧致性论证 ⇒ 每个 (k,A) 存在 S 的有限子集 X_j 无 k=j 维 distortion≤j 嵌入
  有限维 Dvoretzky（distortion<2）把 X_j 放进任意无限维 Banach B 的收缩簇 C_j⊂B(a_j v, ηa_j)
      └─► K_B={0}∪⋃C_j 紧、doubling ≤ Λ=1+6λ⁸（λ=76800, λ₀=λ⁴）、无任何有限维目标嵌入
```

一句话总结证明机制（tex 自述，55 行）："The proof couples a covering argument with a derivative obstruction."——覆盖论证（doubling 上界）与导数障碍（微分+方差恒等式+字典极值+交叉打包）耦合；前者只花 18 行，后者是全部戏肉。[推测] 这也解释了 Lean 侧文件体量分布：Doubling.lean 只有一个大命题，而能量/交叉链条拆成 Energy/Extremal/Crossings/Grids/Rectangles/SelectedSheets/Derivatives/Integration 八个中大型模块。

---

# 二、逐引理带批注重构

## 2.1 关键定义层：参数序列、空间与集合 $S$（Section 2 前半，tex 85–113 行）

### (a) 精确陈述（tex 原样）

```latex
Fix, once and for all, a sequence $(N_j,W_j)_{j\ge1}$ of pairs in $\N^2$ in
which every pair occurs infinitely often. For example, concatenate the finite
lists $\{1,\ldots,m\}^2$ for $m=1,2,\ldots$. Put $r_j=1000^{-j}$ and let
\[
 \mathcal H=\R^2\oplus\bigoplus_{j\ge1}\R^{N_j}
\]
be the Hilbert direct sum. This is isometric to real $\ell_2$. Let $e_{j,i}$,
$1\le i\le N_j$, denote the coordinate vectors in its $j$th summand.
```

第 $j$ 层着色：横条 $\{(x,y):qr_j<y<(q+1)r_j\}$（$q\in\mathbb Z$）按 $q\equiv i-1\pmod{N_j}$ 染色得 $H_{j,i}$；竖条 $\{(x,y):qW_jr_j<x<(q+1)W_jr_j\}$ 同法染色得 $V_{j,i}$；$U_{j,i}=H_{j,i}\cup V_{j,i}$（开集）。集合定义（eq:set）：

```latex
Define $S\subset\mathcal H$ to consist of the points
\begin{equation}\label{eq:set}
 (p,w),\qquad p\in\R^2,\quad w=(w_j)_{j\ge1},
\end{equation}
where $w$ has finite support and, independently at each level,
\[
 w_j=0\quad\text{or}\quad w_j=r_je_{j,i}\text{ for some }i\text{ with }p\in U_{j,i}.
\]
The zero choice is always allowed, including on strip boundaries. Neither $S$
nor its defining parameters will subsequently depend on a proposed embedding.
```

约定段（Conventions，tex 74–79 行）：

```latex
Write $\N=\{1,2,\ldots\}$. In the proof of Theorem~\ref{thm:main}, all norms
are Euclidean or Hilbert norms. For a Lipschitz map $F$ on an open subset of
$\R^2$, write $F_x,F_y$ for its derivative columns, defined almost everywhere.
For an integrable function $h$ on a set $E$ of positive finite area, write
\[
 \langle h\rangle_E=\frac{1}{|E|}\int_E h.
\]
```

### (b) 证明机制推导

这一层没有证明，但每个成分都在为后面的两处论证埋钩子，逐项拆解：

1. **$(N_j,W_j)$ 无限循环**的作用是：证明段里一旦需要"某一层同时具有 $(N_j,W_j)=(N,n)$"（$N$ 固定、$n$ 任意大），总能找到足够小的 such $j$。这是"固定集、变动尺度"技巧的接口——$S$ 与嵌入无关地定义死，但反证阶段的每一轮 $n$ 都在 $S$ 内挑一个新的层来施展。具体使用点：tex 225–228 行 "Choose a level $j$ beyond the finite support of this sheet such that (N_j,W_j)=(N,n)... Infinite recurrence of each pair permits this choice."
2. **两层参数 $N_j$ vs $W_j$ 的分工**：$N_j$ 控制**颜色数**（横竖各自周期为 $N_j$），$W_j$ 控制**竖条相对横条的宽度倍率**。后面能量估计时，横方向线长 $=N n r$（$n$ 长在 $W$ 上），竖方向线长 $=Nr$；$n$ 只加宽竖条而不加多颜色。这样水平导数误差被 $n^2$ 放大后仍能 → 0（因为除以的条宽也是 $nr$ 级），垂直方向则靠 $n$ 变宽条带来 $1/n$ 收敛（eq:Vxmean）。若只有单层参数（比如 $W_j=N_j$），就无法把"线长增长"与"条纹变宽"分开调节——见 (c)。
3. **$r_j=1000^{-j}$ 指数分离**：保证 (i) 球半径 $t$ 落点附近"粗层坐标全冻住、细层总直径小、中间层至多一个"（Prop doubling 的三句话全部依赖它）；(ii) 后面选层时可把周期块尺寸 $Nnr$ 压到任意小（$l\cdot n^{-8}/100$ 以下）。
4. **$e_{j,i}$ 互相正交且正交于底座平面**：使层间距离可加合成平方和。同一层内不同颜色 $i\ne m$ 的两点 $(p,r_je_{j,i})$、$(p,r_je_{j,m})$ 距离恰为 $r_j\|e_{j,i}-e_{j,m}\|=\sqrt2\,r_j$——这正是 Crossings 一节"交叉点分离 $=\sqrt2\,r$ 恰好"的几何来源（tex 369–371 行）。
5. **允许集是开的（$U_{j,i}$ open），零选择总允许**：保证 sheet 定义域 $\Omega_w=\bigcap_{j:w_j\ne0}U_{j,i_j}$ 是有限个开集之交， hence 开集——Rademacher 定理需要开集上的 Lipschitz 映射。零选择总允许意味着 $(p,0)\in S$ 对所有 $p\in\R^2$ 成立，即**底座平面完整地躺在 $S$ 里**——这是"sheet 是 $\R^2$ 开子集上的映射、能用二维欧氏微分"这一整套解析机器的地基。tex 141 行："Since $S$ contains the base plane with all displacement coordinates zero, it cannot embed into $\R^0$."
6. **"independently at each level"**：各层选择互不约束（只要各自合法），所以尾巴空间是逐层有限选择的乘积结构，距离是 $\sum_j\|w_j-w'_j\|^2$——tail 估计 (eq:tail) 才可能逐层放缩。

### (c) 常数的机械理由

- **$1000$**：尺度分离倍率 $g$。约束链（与 2.2 合并推导）：$g>64$（中间层唯一性）、$g^2>2$（tail 几何和收敛速度足够，实际极松）。$1000=10^3$ 让 $g^{-2}=10^{-6}$ 恰好写进 (eq:tail) 的 $\frac{2}{1-10^{-6}}$。改成 $10$：$g=10<64$，半径 $t$ 的球里会有 $\approx\log_2 64\approx6$ 个中间尺度层同时活跃，标签数从"300"爆炸成每层 ~300 的六层组合，doubling 界崩塌（不再是常数）。改成 $100$：$g=100>64$ 仍可行，但 tail 常数 $\frac{2}{1-10^{-4}}$ 几乎不变——**1000 并非临界值，是留裕度的圆整选择**；真正临界的是 $g>64$。[推测] 选 1000 可能还为了 (eq:fine) 里 "$Nnr_j<l\,n^{-8}/100$" 的 $1/100$ 显得顺——但严格说 $j$ 足够大时任意 $g>1$ 都能满足，所以 1000 纯粹是 doubling 侧与美观的联合选择。
- **$\{1,\dots,m\}^2$ 拼接式列举**：确保每个 $(N,n)$ 出现无穷多次，且列举方式与后续论证完全解耦（论文只用到"无穷出现"这一性质，示例仅演示存在性）。
- **$\sqrt2$（层内异色距离）**：$\|r_je_{j,i}-r_je_{j,m}\|_2=r_j\sqrt2$ 来自两个标准正交向量之差。Crossings 端用 $\sqrt2>1$ 与 $\omega_n\to0$ 拼出 $\sqrt2-2\omega_n>1$。若 $e_{j,i}$ 不归一（比如取 $r_je_{j,i}/2$），分离降为 $\sqrt2/2$，则打包目标"$N$ 个两两距离 $>1$ 的点"要改成别的归一化，$D$ 球半径和 $N>(1+2D)^k$ 全链条系数重写。[推测]
- **零选择包含边界**：横竖条都定义为严格不等式（开条），边界点（如 $y=qr_j$）不属于任何 $H_{j,i}$。若不允许零选择，$S$ 在边界线上会缺 sheet、$\Omega_w$ 交出的区域碎片化，底座不再是"几乎整个平面"，微分论证的"足够大的方块 $Q^0$"就没了着落。

### (d) 候选失败路线 [推测]

1. **直接取 Assouad snowflake 的逆否**：Assouad 给 $(S,d^\alpha)$ 嵌入，想取 $\alpha\to1$ 的极限得到 $(S,d)$ 嵌入——失败，因为 Assouad 构造的嵌入在 $\alpha\to1$ 时 distortion 一致趋于无穷（论文引 Naor–Neiman 时明写 "The distortion bound still depends on the snowflake exponent"），且嵌入映射族没有可取极限的一致 Lipschitz 结构。
2. **单参数周期棋盘（$W_j\equiv1$）**：横竖条同宽，则近极值选择场 $G_V^x$ 的平均窗口 $nr$ 无法独立于颜色数 $N$ 增大，eq:Vxmean 的 $2D/n$ 项退化，$\eta_n\to0$（eq:eta）失败——垂直方向的"先压 $\|G_V^x\|^2\to A$ 再用 lem:compact"链条断在第一环。这是双参数 $(N_j,W_j)$ 必须分层的机制性原因。[推测，基于 2.7 的估计结构]
3. **尾巴取无穷支撑**：若允许 $w$ 有无穷多非零层（如每层都取 $r_je_{j,i_j}$），tail 距离 $\le(\sum_{j}r_j^2)^{1/2}<C\cdot r_1$ 不再随观察半径 $t\to0$ 收缩到 $t/32$ 比例，覆盖论证里"细坐标自动进同一组"失效——分组必须同时记录无穷多个中间尺度的选择，球数不再是有限常数。分离尺度 + 有限支撑两者缺一不可。[推测]

## 2.2 Proposition（doubling 上界 $76800$，`prop:doubling`，tex 115–135 行）

### (a) 精确陈述

```latex
\begin{proposition}\label{prop:doubling}
The doubling constant of $S$ is at most $300\cdot16^2=76800$.
\end{proposition}
```

### (b) 证明机制推导（逐步）

设球心在 $S$、半径 $t>0$。证明是一个"三层坐标分组"机器：

1. **粗层冻结**：$r_j>t$ 的层。同层两个不同选择（$0$ vs $r_je_{j,i}$，或 $r_je_{j,i}$ vs $r_je_{j,m}$，$i\ne m$）的坐标距离分别是 $r_j$ 与 $\sqrt2 r_j$，都 $>t$。所以球内所有点在这些层与球心坐标一致。→ 粗层自由度数 $=0$。
2. **中间层唯一**：窗口 $t/64<r_j\le t$。相邻 $r$ 之比 $1000>64$，窗口对数长度 $\log_{1000}64<1$，故至多一个层 $j^*$ 落入。该层的可选标签数：底座投影在边长 $2t$ 区间内。宽 $r_{j^*}$ 的横条：区间长 $2t$、条宽 $>t/64$ ⇒ 至多 $\lfloor 2t/r_{j^*}\rfloor+2\le129$ 条（严格不等式 $2t/r_{j^*}<128$ 给出 floor $\le127$，+2 边界补偿 $=129$）。竖条宽 $W_{j^*}r_{j^*}\ge r_{j^*}$ 同理 $\le129$。颜色 $i$ 可用当且仅当 $p\in H_{j^*,i}\cup V_{j^*,i}$，故非零标签 $\le129+129=258$，加上零 ⇒ "fewer than 300 available labels"。→ 中间层自由度数 $\le300$。
3. **细层整体小**（eq:tail，逐字）：

```latex
 \sum_{r_j\le t/64}\norm{w_j-w'_j}^2
 \le 2\sum_{r_j\le t/64}r_j^2
 \le\frac{2}{1-10^{-6}}\left(\frac{t}{64}\right)^2
 <\left(\frac{t}{32}\right)^2.
```

  第一个 $\le$：每层 $\|w_j-w_j'\|\le 2r_j$ 不优——实际用 $\|w_j-w_j'\|^2\le(\|w_j\|+\|w_j'\|)^2\le(2r_j)^2=4r_j^2$？tex 写 $2\sum r_j^2$，即用了 $\|w_j-w_j'\|^2\le2r_j^2$：因为每层取值要么 $0$ 要么长度 $r_j$ 的正交基向量，两者之差范数平方 $\le r_j^2+r_j^2=2r_j^2$（平行四边形/三角+平方展开，交叉项非正时更优；最坏 $i\ne m$ 时恰 $2r_j^2$）。几何级数：$\sum_{r_j\le t/64}r_j^2=(t/64)^2\sum_{k\ge0}1000^{-2k}=(t/64)^2\frac{1}{1-10^{-6}}$。最后一步 $< (t/32)^2$ 等价 $\frac{2}{1-10^{-6}}<4$ 即 $1-10^{-6}>\frac12$。→ 细层贡献 $<$ 半径 $t/32$。
4. **分组覆盖**：取含投影的边 $2t$ 方，切成 $16^2$ 个边 $t/8$ 小格（边界点任意指派）。按 (小格, 中间层标签) 分组：组内粗层同、中间层同、底座差 $\le\sqrt2\,t/8$、细层差 $<t/32$，总距离

```latex
 t\sqrt{\frac{2}{64}+\frac{1}{1024}}=\frac{\sqrt{33}}{32}t<\frac t2
```

 （$\sqrt2 t/8$ 平方 $=2t^2/64=t^2/32=32t^2/1024$，加尾项 $t^2/1024$，共 $33t^2/1024$，开方 $\sqrt{33}/32\approx0.180<0.5$）。每组取一点为心，非空组数 $\le300\cdot16^2=76800$。∎

关键：**球半径减半后**直径 $<t/2$ 的组自动被"组代表为心的 $t/2$ 开球"覆盖；球心可在 $S$ 内选（每组非空）。

### (c) 常数的机械理由

- **$64$（中间窗口下界 $t/64$）**：双重职能。职能一：保证 tail $<(t/32)^2$ 需要 $\frac{2}{1-10^{-6}}(t/b)^2<(t/32)^2$，即 $b>32\sqrt{2/(1-10^{-6})}\approx45.26$；$b=64$ 有余量。职能二：横条数 $\lfloor 2t/r_j\rfloor+2<2b+2$，标签总数 $<2(2b+2)+1=4b+5$；$b=64$ 给 $261<300$。若取 $b=48$：$48>45.26$ 勉强满足职能一（$\frac{2\cdot48^2}{?}$——需逐字重算），职能二变 $197$，常数更小但裕度薄；若 $b=32$：职能一崩（tail $=2\cdot(t/32)^2/(1-10^{-6})>(t/32)^2$ 甚至 $> (t/2)^2\cdot(\ldots)$，直径估计式 $\sqrt{2/64+2\cdot1024/1024\cdot?}$ 超 $t/2$），分组直径失控。所以 **$b\in(45.3, g)$（$g=1000$）是可行窗口，64 是窗口内圆整**。
- **$16^2$（格子数）**：格边 $t/8$，对角 $\sqrt2 t/8\approx0.177t$；预算 $t/2$ 减 tail $0.031t$ 剩 $\approx0.469t$ 全是底座预算，$0.177t$ 极宽裕。改用 $8^2$（边 $t/4$，对角 $0.354t$）：$0.354+0.031\le\sqrt{0.354^2+0.031^2}\cdot? $——平方和 $2/16+1/1024=0.126<0.25$，其实也能过，doubling 可压到 $300\cdot64=19200$。$4^2$（边 $t/2$，对角 $0.707t$）：崩。[推测：论文未讨论最优格子数，16² 大概率纯粹图干净]
- **$300$**：只是 $259$ 的圆整上界。它直接进入最终 $76800$；$76800=300\cdot256$ 在 Banach 推论里被复用为 $\lambda$，$\lambda^4=(300\cdot16^2)^4$ 之类的塔式放大对基数并不敏感（Universal 就够）。
- **"$+2$"（条数估计的边界项）**：区间无论怎么摆放，覆盖它的条数最多 $\lceil 2t/r_j\rceil$；写成 $\lfloor 2t/r_j\rfloor+2$ 是对开条边界情形的粗化保险，若写 $\lfloor\cdot\rfloor+1$ 在区间恰好骑跨三条缝时会失效。[推测]

### (d) 候选失败路线 [推测]

1. **多项式尺度分离 $r_j=j^{-\alpha}$ 或 $2^{-j}$ 配等比 $W_j$**：$g=2$ 时窗口 $(t/64,t]$ 含 $\approx6$ 层中间尺度，需要同时记录 6 层标签，每层 $\sim4b$ 个选项，覆盖数 $\sim(260)^6$——仍是有限常数（固定 $g$、固定窗口时 doubling 总成立），但若窗口对数长度随 $t$ 无界则崩。真正的危机在证明另一半：$g$ 太小时"细层直径 $\ll$ 观察尺度"不成立（$\sum_{r_j\le t/b}r_j^2$ 与 $t^2$ 比不消失），分组直径失去 $<t/2$。即 $g$ 必须同时胜过窗口深度与 tail 几何和两个要求。
2. **Heisenberg 式构造（Carnot 群球）**：Heisenberg 群带 Korányi 度量是 doubling 且（已知）不能 bi-Lipschitz 进任何 $\R^k$（欧氏维 vs Hausdorff 维论证 / Pansu 导数）。但它是**齐性空间**，作为度量空间不能等距放进 Hilbert——Lang–Plaut 问题要求源是 Hilbert 子集，度量必须来自 $\ell_2$。Heisenberg 的障碍机制（次黎曼维数）与 Hilbert 内蕴度量不相容，根本进不了题目假设。论文正文未提 Heisenberg；此路线失败是外推的结构判断。
3. **Laakso 树状分枝直接搬**：Laakso 空间（论文引用于 55 行 "separated branches force an increase in stretch"）是 doubling + Ahlfors 正则 + 不支持 Poincaré，其非嵌入性是"逐层分枝 stretch 无界"型障碍——它阻碍的是**目标空间类**（如一致凸空间/欧氏）满足 Poincaré 时的嵌入，而 Laakso 自身度量来自图上的最短路径度量，不是 Hilbert 诱导度量；把它塞进 $\ell_2$ 会破坏分枝分离（正交性预算有限）。BGN 的"thin Laakso configurations in $\ell_p$"之所以行，是靠 $\ell_p$（$p>2$）里树状配置的距离几何（论文 44 行明说这类结果 "concern ambient exponents strictly greater than two"）；在 $\ell_2$ 中平行四边形恒等式抹掉树状超度量增益——[推测] 这正是作者改用微分/导数障碍替代纯组合分枝论证的原因。

## 2.3 反证 setup：sheet、good points、紧集 $K$ 与字典极大 $(A,B)$（Section 3，tex 137–175 行）

### (a) 精确陈述（tex 原样，含全部量化）

反设（tex 141–145 行）：

```latex
Since $S$ contains the base plane with all displacement coordinates zero, it
cannot embed into $\R^0$. Suppose, for a contradiction, that for some finite
$k\ge1$ and $D\ge1$ there is a map $f:S\to\R^k$ satisfying
\begin{equation}\label{eq:bilip}
 \norm{z-z'}\le\norm{f(z)-f(z')}\le D\norm{z-z'}
 \qquad(z,z'\in S).
\end{equation}
```

sheet 定义（tex 146–158 行）：

```latex
For a fixed finite-support tuple $w$ of coordinate choices, let
\[
 \Omega_w=\{p:(p,w)\in S\}.
\]
If $w_j=r_je_{j,i_j}$ at its nonzero levels, then
\[
 \Omega_w=\bigcap_{j:w_j\ne0}U_{j,i_j}.
\]
This is a finite intersection of open sets; the empty intersection for the zero
tuple is $\R^2$. Whenever the domain is nonempty, the map
\[
 F_w:\Omega_w\to\R^k,\qquad F_w(p)=f(p,w),
\]
is called a \emph{sheet}. It is $D$-Lipschitz, since the corresponding source
points differ only in their base coordinates. This holds even when its domain
is disconnected.
```

good points（tex 160–164 行）：

```latex
Rademacher's theorem gives differentiability almost everywhere on each sheet
domain ... By Lebesgue differentiation ... At such a point, with $u=F_x(p)$ and
$v=F_y(p)$, the mean-square error satisfies
\begin{equation}\label{eq:good}
 \lim_{l\downarrow0}\left\langle\norm{F_x-u}^2+\norm{F_y-v}^2\right\rangle_{Q(p,l)}=0,
\end{equation}
where $Q(p,l)$ is the centered square of side $l$. Indeed, boundedness upgrades
the Lebesgue mean-norm conclusion to mean-square convergence, and squares may
replace balls by area comparison. Call these differentiability and Lebesgue
points \emph{good}; they form a set of full measure in each sheet domain.
```

$K,A,B$（tex 166–174 行）：

```latex
Let $K$ be the closure in $[0,D^2]^2$ of all pairs
\[
 (\norm{F_x(p)}^2,\norm{F_y(p)}^2)
\]
from all sheets and their good points. It is nonempty and compact. Define
\begin{equation}\label{eq:AB}
 A=\max\{s:(s,t)\in K\},\qquad
 B=\max\{t:(A,t)\in K\}.
\end{equation}
Thus $(A,B)\in K$. This single compact set and these two numbers remain fixed
throughout the argument.
```

### (b) 证明机制推导

1. **归一化**：bi-Lipschitz 定义里的尺度 $a$ 被吸收——(eq:bilip) 下界系数恰为 1。合法性：用 $f/a$ 替换 $f$，上界变 $D$。且 $D\ge1$ 可设（否则用 $\max(D,1)$）。这一步让后面所有 "$Dr$"、"$2Dr$" 误差里不携带 $a$。
2. **sheet 的 $D$-Lipschitz 性**：对 $p,p'\in\Omega_w$，源点 $(p,w),(p',w)\in S$ 距离 $=\|p-p'\|$（同 $w$ 只动底座），(eq:bilip) 立刻给 $\|F_w(p)-F_w(p')\|\le D\|p-p'\|$。注意**不要求 $\Omega_w$ 连通**——Lipschitz 是逐对条件，与定义域形状无关；这点在 Lean 里对应直接对 `LipschitzWith` 谓词证明。
3. **good points 三重身份**：Rademacher 给 a.e. 可微；Lebesgue 微分定理给 a.e. 点是 $F_x,F_y$ 的 Lebesgue 点；两者交 still full measure。(eq:good) 的含义是"以 $p$ 为中心、边 $l$ 方块上的平均平方误差随 $l\to0$ 消失"——它在 Section 4 被以定量形式使用（eq:baseerror：存在某个具体的小 $l$ 使平均误差 $<n^{-8}$）。有界性升级 $L^1\to L^2$ 的机制：$\|F_x-u\|^2\le(2D)^2\|F_x-u\|$ 逐点成立（导数范数 $\le D$），故 $L^1$ 收敛 $\Rightarrow L^2$ 收敛。
4. **$K$ 的有界性与闭性**：所有对落在 $[0,D^2]^2$（导数列范数 $\le D$），取闭包后是紧集（$\R^2$ 中有界闭）。非空：sheet 族非空（零 tuple 的 sheet 定义域为整个 $\R^2$，good points 满测）。
5. **字典极大良定义**：投影 $\{s:(s,t)\in K\}$ 是紧集的连续像故紧，max 取得到；对固定 $s=A$，截面 $\{t:(A,t)\in K\}$ 非空紧，max 取得到。所以 $(A,B)\in K$。"remain fixed throughout"是全文逻辑枢纽：$K,A,B$ 只依赖嵌入 $f$（先固定），后续 $n$、层 $j$、矩形 $Q$ 全依赖它们但反过来不变。
6. **为什么先 $x$ 后 $y$（lexicographic 顺序）**：能量估计的不对称设计（2.7）需要"先用 $A$ 界住 $\|G_V^x\|^2$ 的均值（它自动 $\le A$ a.e.），再把 $A$-饱和转化为垂直方向 $\|G_V^y\|^2$ 均值 $\le B$"。字典序把"第一坐标接近 $A$"翻译成"第二坐标不超过 $B+\varepsilon$"（这正是 lem:compact），刚好匹配这个两步走。若对称地取 $\max(s+t)$ 之类的单坐标极值，无法产生方向分离。

### (c) 常数的机械理由

- **$D\ge1$**：bi-Lipschitz 上界常数不小于 1 是归一化下界为 1 的结果（同一对点上下界相容需 $D\ge1$；且 $k\ge1$ 时可选点对使比 $\ge1$）。改成 $D>0$ 任意则 (eq:bilip) 与源距离自反冲突。
- **$[0,D^2]^2$**：平方而非范数——因为 lem:compact 处理的是平方的平均（方差恒等式天生产物）。若收集 $(\|F_x\|,\|F_y\|)\in[0,D]^2$ 也等价（单调映射保紧），但 eq:eta 处 $A-\|G\|^2$ 的非负性要求 $A$ 定义在同一量（平方）上。
- **$n^{-4}$、$n^{-8}$**（Section 4 的近极值与基误差指标，此处预告）：选择 $n^{-4}$ 让 $\|u\|^2$ 距 $A$、$|B-\|v\|^2|$ 都 $O(n^{-4})$；方差恒等式产生交叉项 $2\|u\|\cdot\|\langle G\rangle-u\|$，其量 $O(n^{-4})$ 与 $r/L_x$ 项相加；最终 n² 乘后要求 $n^2\cdot n^{-4}=n^{-2}\to0$。$n^{-8}$ 的平方根出现在 Cauchy–Schwarz（$L^2$ 平均界 $n^{-8}$ → 单项界 $n^{-4}$），与 eq:Hmean 里的 $+2n^{-4}$ 项对上。**两者幂次的耦合是 $(n^{-8})^{1/2}=n^{-4}$**，改成 $n^{-3}$/$n^{-6}$ 同样可用（任意 $n^{-2c}$, $c\to\infty$ 都收敛），关键是"$\sqrt{\text{base error}}\asymp$ nearmax 容差，且二者都 $=o(n^{-2})$"。[推测：论文取偶次幂纯为算顺]

### (d) 候选失败路线 [推测]

1. **对全空间取 sup 而非紧 closure**：若令 $A=\sup\|F_x\|^2$、$B=\sup\|F_y\|^2$（独立上确界），$(A,B)$ 未必被任何 sheet 逼近——字典引理失效：从 "$s$ 接近 $A$" 推不出 "$t\le B+\varepsilon$"（可能存在第一坐标大第二坐标也大但从不共现的散列）。紧集 + 字典序正是为了把"两个方向的饱和共现"编码进 $(A,B)\in K$。
2. **在 Hilbert 目标无穷维上做同样论证**：Rademacher 在无穷维目标不成立（a.e. 可微失效，需要 Fréchet 可微 + Radon–Nikodým 性质，$\R^k$ 有而一般 Banach 无）。所以定理只对有限维目标给出矛盾——这不损失什么，因为题目本就是"嵌入进某 $\R^k$"。若想推广到任意 Banach 目标（比如 cor:banach 的无障碍方向），必须换机制（紧致性/子列论证，见 2.10）——**论文明写**："A zero-dimensional target cannot contain an injective copy"，"choose a linear isomorphism... Equivalence of finite-dimensional norms"——全部靠有限维等价性，无 Rademacher。
3. **用 weak Poincaré / Cheeger 微分框架**：论文 55 行主动对比了 Cheeger 框架（需要 doubling measure + Poincaré 假设）并放弃，改用"ordinary Euclidean differentiation of Lipschitz maps on open subsets of $\R^2$"。失败机制：$S$ 本身作为 $\ell_2$ 子集不承载任何自然的 doubling **测度**（它是"胖"的：含二维平面片），Cheeger 的可微结构针对的是测度空间中的 Lipschitz 函数，而这里我们处理的是**离散层坐标的偏移** $(F_i-F)/r$——它不是 $S$ 上的函数，是 sheet 参数族的差分。硬套 Cheeger 坐标图会把问题绕回"目标微分结构"，正是要避免的。[推测，论文仅一句话提及]

## 2.4 Lemma（字典极大值附近，`lem:compact`，tex 177–196 行）

### (a) 精确陈述

```latex
\begin{lemma}[Near the lexicographic maximum]\label{lem:compact}
Let $D>0$, let $K\subseteq[0,D^2]^2$ be nonempty and compact, and define
$A=\max\{s:(s,t)\in K\}$ and $B=\max\{t:(A,t)\in K\}$.
For every $\varepsilon>0$ there is $\delta>0$ such that
\[
 (s,t)\in K,\quad s>A-\delta\quad\Longrightarrow\quad t\le B+\varepsilon.
\]
Consequently, if measurable pairs $(s_n,t_n)$ take values in $K$ on probability
spaces and $\mathbb E(A-s_n)\to0$, then
$\limsup_n\mathbb E t_n\le B$.
\end{lemma}
```

### (b) 证明机制推导

逐字（tex 187–196）：

```latex
Failure of the first assertion would give a sequence in $K$ with first
coordinate tending to $A$ and second coordinate greater than $B+\varepsilon$. A
conversubsequence would contradict the definition of $B$. For the second
assertion, Markov's inequality gives
\[
 \mathbb P\{A-s_n\ge\delta\}\le\frac{\mathbb E(A-s_n)}{\delta},
 \qquad
 \mathbb E t_n\le B+\varepsilon+
 D^2\frac{\mathbb E(A-s_n)}{\delta}.
\]
First let $n\to\infty$, and then $\varepsilon\downarrow0$.
```

机制拆步：
1. 第一性断言是纯拓扑：紧性把序列换成收敛子列，极限 $(A,t^*)\in K$ 且 $t^*\ge B+\varepsilon$，与 $B$ 在截面 $\{t:(A,t)\in K\}$ 上的极大性矛盾。**注意 $\delta$ 依赖 $\varepsilon$ 且无显式速率**——论文明写（69 行）："Compactness suffices for this latter estimate; no quantitative modulus of the second extremum is needed."
2. 第二性断言（概率形态）：把 $Q$ 上的归一化面积测度当概率测度，$(s_n,t_n)=(\|G_V^x(p)\|^2,\|G_V^y(p)\|^2)$。拆分 $\mathbb E t_n=\mathbb E[t_n;\,A-s_n<\delta]+\mathbb E[t_n;\,A-s_n\ge\delta]$：第一项 $\le B+\varepsilon$（逐点蕴涵），第二项 $\le D^2\cdot\mathbb P\{A-s_n\ge\delta\}\le D^2\mathbb E(A-s_n)/\delta$（Markov + $t_n\le D^2$）。取 $\limsup$ 后 $\varepsilon\downarrow0$。
3. 逻辑要点：**期望假设 $\mathbb E(A-s_n)\to0$ 而不是逐点假设**——因为 eq:eta 只给了 $\eta_n=\langle A-\|G_V^x\|^2\rangle_Q\to0$ 这种均值收敛（由 Cauchy–Schwarz/端点误差得来，逐点版不可能有：好点只是满测集）。

### (c) 常数的机械理由

- $\varepsilon\to\delta\to0$ 的双极限顺序：先 $n$ 后 $\varepsilon$。若试图 $\varepsilon$ 固定（比如取 $\varepsilon=1$），只能得 $\limsup\mathbb E t_n\le B+1$，太弱——2.7 末尾需要 $\limsup\langle\|G_V^y\|^2\rangle\le B$ 精确成立，才能与 $\|v\|^2\to B$ 夹出方差 $\to0$（eq:vertical 的推导把 $\langle\|G_V^y\|^2\rangle-\|v\|^2$ 压成 limsup $\le0$）。B 的精确值在这里是**生死线**。
- $D^2$（尾部截断的质量上界）：来自 $t_n\le D^2$ 逐点界（导数 $\le D$）。任何使 $K$ 无界的版本（如不取平方、或目标导数无界）都让 Markov 尾部项失控——但本设置里 $K\subset[0,D^2]^2$ 免费获得。
- 若 $K$ 只取"闭包"不取"字典"（即 $B'=\max\{t:(s,t)\in K \text{ for some } s\}$）：蕴涵 "$s>A-\delta\Rightarrow t\le B'+\varepsilon$" 仍真但 $B'$ 可能 $>B$，2.7 中方差上界 $\langle\|G_V^y\|^2\rangle-\|v\|^2\le B'-B>0$ 残留正常数，eq:vertical 停在一个正的 limsup，Crossings 的 $\omega_n\to0$ 失败，打包矛盾崩。**字典序是引理全部的力量所在。**

### (d) 候选失败路线 [推测]

1. **逐点版引理（不用期望）**：想要"$\|G_V^x\|^2$ 接近 $A$ a.e. ⇒ $\|G_V^y\|^2\le B+\varepsilon$ a.e."——不成立：$G_V^x$ 接近 $A$ 的测度集可以是"条带边缘"型碎集，逐点接近速率无模（$K$ 的连续模依赖具体 sheet 分布，紧致性不给一致模）。均值版本恰好绕开速率问题。[推测，对应论文 69 行明写不需要定量模]
2. **用 Prokhorov/经验测度紧致性替代**：把 $(s_n,t_n)$ 的分布列取弱收敛极限，极限测度支在 $K$ 且第一矩饱和——同样能得到结论，但引入概率论机器无必要；论文选 Markov 两行解决。失败谈不上，只是路线更重。

## 2.5 方差恒等式与沿线段积分（tex 198–204 行，无编号引理但全文枢纽）

### (a) 精确陈述

```latex
\begin{equation}\label{eq:variance}
 \left\langle\norm{G-a}^2\right\rangle
 =\left\langle\norm{G}^2\right\rangle-\norm a^2
       -2\inner{a}{\langle G\rangle-a}.
\end{equation}
```

（论文写 $\langle\norm{G}^2\rangle-\norm a^2-\ldots$，即 $-\norm a^2$ 项来自展开常数项，下面推导核对。）

线积分约定（tex 204 行原样）：

```latex
We also use integration along line segments. A Lipschitz map on an interval is
absolutely continuous, and its increments equal integrals of its derivative,
componentwise ... By Fubini, on almost every horizontal or vertical segment in
an open sheet domain, these line derivatives agree almost everywhere with the
corresponding partial derivatives. At excluded endpoints we take the unique
one-sided limits of the Lipschitz restriction. Bounds for the map persist in
those limits.
```

### (b) 机制推导

恒等式验证：$\langle\|G-a\|^2\rangle=\langle\|G\|^2\rangle-2\inner{a}{\langle G\rangle}+\|a\|^2=\langle\|G\|^2\rangle-\|a\|^2-2\inner{a}{\langle G\rangle-a}$。✓（tex 形式与展开一致。）

使用模式（在 2.7 出现三次）：
- **正向用**（横向前馈，eq:Hrate 前）：把 $\langle\|G_H^x-u\|^2\rangle$ 放大为 $\bigl(A-\|u\|^2\bigr)+2\|u\|\,\|\langle G_H^x\rangle-u\|$——第一项用 nearmax $<n^{-4}$，第二项用线积分给的均值控制 $\le D(2Dr/L_x+2n^{-4})$。恒等式的 "$-\|a\|^2$" 变成免费负项，被丢弃（放大方向：$\langle\|G-a\|^2\rangle\le\langle\|G\|^2\rangle-\|a\|^2+2\|a\|\|\langle G\rangle-a\|$，此处再用 $\langle\|G\|^2\rangle\le A$ 逐点界 eq:Kbounds）。
- **反向用**（垂直列两次的核心）：左边 $\ge0$ 丢掉后得 $0\le\eta_n\le A-\|u\|^2+2\|u\|\|\langle G_V^x\rangle-u\|$（eq:eta）——即"逐点 $\|G_V^x\|^2\le A$ + 均值靠近 $u$ ⇒ 平均亏损 $\to0$"。这是把 $L^1$-端点误差转化为 $L^2$-饱和的引擎。同样的丢左边再夹一次得 eq:vertical。

线积分机制：对固定 $y$（横条内部），$\int_{x_0}^{x_1}(F_i-F)_x\,dx=F_i(x_1,y)-F_i(x_0,y)$ 逐分量成立（一维 Lipschitz ⇒ AC）。条宽 $L_x$、两端都在 $Q\cap U_{j,i}$ 内，(eq:offset) 给两端点像差 $\le Dr$ 各一，故 $\le 2Dr$。除以 $L_x$ 得导数均值偏移 $\le 2Dr/L_x$——**"端点误差 / 条宽"是全文反复出现的除法器**。

### (c) 常数理由

- "$2Dr$" 里的 2：两端点各贡献 $Dr$。若只在一端有界会丢一半。
- 丢左边（$\ge0$）的合法性：所有 $G$ 定义在归一化面积测度上，期望非负性显然。这一步把"等式"变"单侧不等式"，是 eq:eta 里"$0\le\eta_n$"的出处；同时说明**不需要 $G_V^x$ 与 $u$ 的逐点关系**，只用其均值——定量要求降到最低。
- 交叉项放缩 $\|\langle G\rangle-a\|$ 前系数取 $\|u\|\le D$、$\|v\|\le D$：若目标维数高、$D$ 大，$D^2/n$ 项（eq:eta 末）衰减仍由 $n\to\infty$ 保证——$n$ 在 $D$ 之后选取，量化顺序正确（先固定 $k,D$，再取 $N>(1+2D)^k$，再对每个 $n$ 干活）。

### (d) 候选失败路线 [推测]

1. **不用方差恒等式、直接三角不等式**：$\langle\|G-u\|^2\rangle\le(\langle\|G-u\|\rangle)^2$ 反号不成立（Jensen 方向相反：$\le$ 应写 $\langle\|G-u\|\rangle^2\le\langle\|G-u\|^2\rangle$）。想用 $L^1$ 均值界推 $L^2$ 收敛必须有逐点上界 + **额外的矩信息**，而逐点上界只能给 $\langle\|G-u\|^2\rangle\le4D\langle\|G-u\|\rangle\cdot D$？实际 $(s\le2D)\Rightarrow s^2\le2D\,s$ 逐点成立（$s=\|G-u\|$），所以 $L^1\to L^2$ 可以硬转——但 eq:Hmean 类估计是对**均值向量** $\|\langle G\rangle-u\|$ 而非 $\langle\|G-u\|\rangle$ 成立，仍绕回恒等式。[推测]
2. **Sobolev/Poincaré 型不等式替代线积分**：在矩形上 $\langle\|G-\langle G\rangle\|^2\rangle\le C L^2\langle\|\nabla G\|^2\rangle$——会得到"导数的 $L^2$"控制"函数振荡"，方向恰好需要（Crossings 里绝对连续 + Cauchy–Schwarz 就是它的退化形式），但 $G$ 是**分段选取**的（按颜色切 sheet），整体不连续（跨条边界跳变），任何要求全局 Sobolev 正则的引理在网格线上失效。论文用"逐条内部线积分 + 允许边界跳跃"（tex 285 行 "The estimate sums the separate strip integrals and therefore allows jumps in the selection at strip boundaries"）精确绕开。

## 2.6 近极值矩形的 setup（Section 4 前半，tex 206–246 行）

### (a) 精确陈述（按出现顺序抄全部公式）

颜色数（eq:N，tex 210–213）：

```latex
Fix an integer
\begin{equation}\label{eq:N}
 N>(1+2D)^k.
\end{equation}
```

近极值 sheet 与点（eq:nearmax，eq:baseerror，tex 214–223）：

```latex
For each positive integer $n$, choose a sheet $F$ and a good point with
derivative columns $u,v$ such that
\begin{equation}\label{eq:nearmax}
 0\le A-\norm u^2<n^{-4},\qquad
 |B-\norm v^2|<n^{-4}.
\end{equation}
This is possible since $(A,B)\in K$ is in the closure of actual good-point
pairs. Choose a square $Q^0$ of side $l$, centered at that point, with closure
in the sheet domain and
\begin{equation}\label{eq:baseerror}
 \left\langle\norm{F_x-u}^2+\norm{F_y-v}^2\right\rangle_{Q^0}<n^{-8}.
\end{equation}
The sheet, the vectors, and $l$ may all depend on $n$.
```

选层与网格（eq:fine，tex 225–233）：

```latex
Choose a level $j$ beyond the finite support of this sheet such that
\begin{equation}\label{eq:fine}
 (N_j,W_j)=(N,n),\qquad Nnr_j<\frac{l n^{-8}}{100}.
\end{equation}
Infinite recurrence of each pair permits this choice. Set $r=r_j$. The level-$j$
period blocks have width $Nnr$ and height $Nr$, with corners at $(aNnr,bNr)$ for
integers $a,b$. Take inside $Q^0$ a rectangle $Q$ tiled, up to boundary lines,
by complete period blocks. Each coordinate interval loses at most two periods
by trimming to the grid, so its side lengths $L_x,L_y$ satisfy $L_x,L_y\ge l/2$.
In particular,
\begin{align}
 \left\langle\norm{F_x-u}^2+\norm{F_y-v}^2\right\rangle_Q&<4n^{-8},\label{eq:Qerror}\\
 \frac r{L_x},\frac r{L_y}&<\frac{n^{-9}}{50N}.\label{eq:ratio}
\end{align}
```

加色 sheet 与偏移界（eq:offset，tex 235–239）：

```latex
For each $1\le i\le N$, let $F_i$ be the sheet obtained from $F$ by adding
$re_{j,i}$ at level $j$. Writing $w$ for the tuple of $F$, this is a valid
finite-support tuple with domain exactly $\Omega_w\cap U_{j,i}$. In particular,
the same map $F_i$ is defined on the portions of both $H_{j,i}$ and $V_{j,i}$
in $Q$. By \eqref{eq:bilip},
\begin{equation}\label{eq:offset}
 \norm{F_i-F}\le Dr
 \quad\text{on }Q\cap(H_{j,i}\cup V_{j,i}).
\end{equation}
```

选择场与 $K$-界（eq:Kbounds，tex 241–246）：

```latex
Off the grid boundaries, define $G_H^x$ by selecting $(F_i)_x$ according to the
horizontal strip color $i$. Define $G_V^x,G_V^y$ by selecting
$(F_i)_x,(F_i)_y$ according to the vertical strip color. Almost everywhere on
$Q$,
\begin{equation}\label{eq:Kbounds}
 \norm{G_H^x}^2\le A,\qquad
 (\norm{G_V^x}^2,\norm{G_V^y}^2)\in K.
\end{equation}
Indeed, the good points have full measure for each of the finitely many sheets
in use.
```

### (b) 证明机制推导

1. **$N>(1+2D)^k$ 的由来要到 2.8 才闭环**：打包矛盾需要 $N$ 个两两距离 $>1$、落在半径 $D$ 球内的点；体积比较上限恰为 $(1+2D)^k$（见 2.8 推导）。先固定 $k,D$ → 再定 $N$ → 再让 $n$ 跑：量化顺序 $k,D\prec N\prec n\prec j$ 是全文的"变量绑定链"，任何倒置都使构造自指（$S$ 依赖嵌入被禁止，tex 113 行）。
2. **(eq:nearmax) 的可行性**：$(A,B)\in K$ = closure，故存在（sheet, good point）序列使 $(\|F_x\|^2,\|F_y\|^2)\to(A,B)$；对每个 $n$ 取一个进入 $n^{-4}$ 球的即可。**注意 $|B-\|v\|^2|<n^{-4}$ 是双侧**（后面 $\|v\|^2\to B$ 需要下侧也贴住，方差夹逼的两端都要）。
3. **(eq:baseerror) 的可行性**：所选取的点是 good point，(eq:good) 的极限陈述 $\to$ 存在具体的小 $l$。$Q^0$ 闭包含在 sheet 域内：域是开集、点在域内，可以。
4. **trimming 计数**：$Q^0$ 边长 $l$；要在内部放"完整周期块拼成"的 $Q$，每个坐标方向至多损失 2 个周期（两端各对齐一次网格）。$2\cdot Nnr\le 2\cdot\frac{ln^{-8}}{100}<l/2$（因 $n^{-8}/100<1/4$ 对 $n\ge1$？$n=1$ 时 $1/100<1/2$ ✓），故 $L_x\ge l-2Nnr>l/2$。同理 $L_y\ge l-2Nr$——需要 $Nr\le Nnr<ln^{-8}/100$（$n\ge1$）✓。tex 直接写 $L_x,L_y\ge l/2$。
5. **(eq:Qerror) 系数 4**：$|Q|\ge(l/2)^2$ 而 $|Q^0|=l^2$？不对——$Q\subset Q^0$，积分 $\int_Q\le\int_{Q^0}<n^{-8}l^2$，除以 $|Q|\ge l^2/4$ 得均值 $<4n^{-8}$。✓ 这就是 4 的出处：**面积至多放大 4 倍**。
6. **(eq:ratio)**：$r/L_x\le r/(l/2)=2r/l$。由 (eq:fine)：$Nnr<ln^{-8}/100\Rightarrow r/l<\frac{n^{-9}}{100N}$（$Nn r<ln^{-8}/100\Rightarrow r/l<n^{-8}/(100Nn)<n^{-9}/(100N)$，用了 $n\ge1$ 时 $n^{-8}/n=n^{-9}\ge n^{-8}$？注意 $n^{-8}/(100Nn)=n^{-9}/(100N)$ 恒等）。乘 2：$2r/l<n^{-9}/(50N)$。✓ 50 的出处 = 100 的一半被 trim 的 2 倍吃掉。
7. **$F_i$ 定义域恰为 $\Omega_w\cap U_{j,i}$**：加一层非零坐标 $re_{j,i}$ 合法当且仅当底座 $p\in U_{j,i}$；其余层不变当且仅当 $p\in\Omega_w$。"同一个 $F_i$ 同时覆盖横条与竖条部分"是下一节的关键——偏移 $F_i-F$ 在 $H_{j,i}\cap Q$ 与 $V_{j,i}\cap Q$ 上是**同一个映射**的两个侧面，这正是"横竖误差被耦合"的物理来源。
8. **(eq:offset) 推导**：对 $p\in Q\cap U_{j,i}$：源点 $(p,w)$ 与 $(p,w+re_{j,i})$ 都在 $S$，距离 $=r$，(eq:bilip) 给 $\|f(p,w+re_{j,i})-f(p,w)\|\le Dr$，即 $\|F_i(p)-F(p)\|\le Dr$。✓（下界同时给 $\ge r$，即偏移向量长度**恰在 $[r,Dr]$ 带宽内**——2.8 用下界版。）
9. **(eq:Kbounds) 推导**：a.e. 点上 $G_H^x(p)=(F_i)_x(p)$（某固定 $i$，按横条颜色），该点是 sheet $F_i$ 的 good point（有限个 sheet 的 good 集之交仍满测），故 $(\|(F_i)_x\|^2,\|(F_i)_y\|^2)\in K$。$\|G_H^x\|^2\le A$ 是 $A$ 作为第一坐标 max 的直接推论；$G_V$ 的对更强（整对属于 $K$）。网格边界被排除（零测）。✓

### (c) 常数的机械理由

- **$(1+2D)^k$**：见 2.8 体积比较，$N\le(1+2D)^k$ 是"$\R^k$ 半径 $D$ 球内两两距离 $>1$ 的点数"的硬上限（等号情形对应半径 1/2  Packing）。严格大于号：$N$ 取 $\lfloor(1+2D)^k\rfloor+1$。
- **$n^{-4},n^{-8}$**：见 2.3(c)。追加一处：(eq:fine) 里 $ln^{-8}/100$ 用 $n^{-8}$ 是为了让 (eq:ratio) 出 $n^{-9}$，进而在 eq:Hrate 产生 $n^{-7}$ 级项（$4D^2r/L_x$ 乘 $n^2$ 后 $=4D^2\cdot\frac{n^{-9}}{50N}\cdot n^2/\text{(无}N?)$——tex 里 $n^2\cdot4D^2r/L_x\le4D^2n^2\cdot\frac{n^{-9}}{50N}=\frac{4D^2}{50N}n^{-7}=\frac{4D^2}{25N}\cdot\frac{n^{-7}}{2}$？核对 eq:Hrate 末行：$\frac{4D^2}{25N}n^{-7}$。$4D^2\cdot n^{-9}/(50N)\cdot n^2=\frac{4D^2}{50N}n^{-7}=\frac{2D^2}{25N}n^{-7}<\frac{4D^2}{25N}n^{-7}$，即 tex 的上界写得比精确值大 2 倍——安全方向。[校验注：这是素材层面的逐项复核]
- **$100$**：在 $l\cdot n^{-8}/100$ 中吃 trim 的 2 倍与 ratio 定义的 2 倍，还剩 25 倍裕度变出 $50N$ 分母。纯圆整常数，任何 $>4$ 的值都能跑通链条，只改最终 $n$ 幂的系数。
- **$l/2$**：一半是"trim 至多损失两个周期"的目标陈述；只要 $Nnr,Nr\ll l$ 就能达到任意 $1-o(1)$ 比例，取 $1/2$ 使 (eq:Qerror) 系数为 4（$2^2$）。比例改 $3/4$ 则系数 $16/9$，链条不变。
- **$Q^0$ 是正方形**：(eq:good) 以方块陈述（"squares may replace balls by area comparison"），保持一致；换成圆盘只改常数。

### (d) 候选失败路线 [推测]

1. **不设 $N$ 固定而令 $N=N_j$ 随层变**：打包矛盾要求色数 $N>(1+2D)^k$ 与周期块内"每色一行一列"结构同时成立；若 $N$ 随 $n$ 增长，Crossings 里 $\omega_n=N\sqrt{2N\varepsilon_n}$ 需要 $\varepsilon_n$ 以 $N^{-3}$ 速度消失，能量估计没有这个速率（lem:compact 无模）。固定 $N$、变 $W_j=n$ 是唯一能把"无速率引理"和"振动收敛"捏合在一起的调度。
2. **直接对 $f$ 整体用 Rademacher 而不开 sheet**：$f$ 定义在 $S$（非开集）上，无经典导数；sheet 化把定义域拉回 $\R^2$ 开集，是"离散层 → 连续微分"的桥梁。跳过它则 (eq:good)、线积分全部无从谈起。
3. **用 $F_i-F$ 的下界 $\ge r$ 代替上界 $\le Dr$**：下界说偏移向量本身不小（$\|h_i\|\ge1$ 归一化后），若想让 $\{h_i\}$ 直接成为打包集合——失败，因为同一 sheet 对里 $h_i$ 只在**单色条带内**有定义且条带间无比较通道；分离 $\sqrt2$ 只在"交叉点处两个标签同时合法"时可用，必须回到 2.8 的交叉传输结构。[推测]

## 2.7 Proposition（各向异性能量估计，`prop:energy`，tex 248–310 行）

### (a) 精确陈述

```latex
\begin{proposition}[Anisotropic energy estimates]\label{prop:energy}
For each $n\in\N$, let $F,F_i,Q,u,v,r$ and the selected derivative fields be
chosen as above, satisfying \eqref{eq:nearmax}--\eqref{eq:ratio}. Then, as
$n\to\infty$,
\begin{align}
 n^2\left\langle\norm{G_H^x-F_x}^2\right\rangle_Q&\longrightarrow0,\label{eq:horizontal}\\
 \left\langle\norm{G_V^y-F_y}^2\right\rangle_Q&\longrightarrow0.\label{eq:vertical}
\end{align}
\end{proposition}
```

（tex 255 行原注：）"The factor $n^2$ compensates for horizontal segments of length $Nnr$; the vertical segments have length $Nr$."

### (b) 证明机制推导（四段逐一展开）

**第 1 段：水平选择（横向前馈）。** 在 $Q$ 内部的横色条（色 $i$，高 $r$、宽 $L_x$）上 $F_i$ 全条有定义。取条内一条水平线段（good 线，Fubini 保证 a.e. 高度可行），逐分量积分 $(F_i-F)_x$：

$$\Big|\int_{\text{seg}}(F_i-F)_x\,dx\Big| = \|F_i(x_1,y)-F_i(x_0,y)\| \le \|F_i(x_1,y)-F(x_1,y)\|+\|F(x_1,y)-F(x_0,y)\|+\ldots$$

不——tex 的实际路线（260 行）：端点差 $\|(F_i-F)(x_1,y)-(F_i-F)(x_0,y)\|\le 2Dr$（两端各自用 eq:offset）。均值化：$\|\langle G_H^x\rangle_{Q}-u\|\le\frac1{L_x}\cdot 2Dr$ 来自"条上 $(F_i)_x$ 的线平均 $=$ 端点差$/L_x$"，再加 $\langle\|F_x-u\|\rangle_Q\le(\text{eq:Qerror})^{1/2}<2n^{-4}$（Cauchy–Schwarz：$L^1\le L^2$ 均值，且被积含 $\|F_x-u\|^2$，界 $4n^{-8}$，开方 $2n^{-4}$，tex 写 $+2n^{-4}$）。得 **(eq:Hmean)**：

```latex
 \norm{\langle G_H^x\rangle-u}
 \le\frac{2Dr}{L_x}+2n^{-4}.
```

方差恒等式（$a=u$，$G=G_H^x$）+ 丢 $-\|u\|^2$ 后的组织方式（tex 265–270）：

$$\langle\|G_H^x-u\|^2\rangle=\langle\|G_H^x\|^2\rangle-\|u\|^2-2\inner{u}{\langle G_H^x\rangle-u}\le A-\|u\|^2+2\|u\|\,\|\langle G_H^x\rangle-u\|$$

用了 $\langle\|G_H^x\|^2\rangle\le A$（eq:Kbounds 逐点界）。代入 nearmax（$A-\|u\|^2<n^{-4}$）、$\|u\|\le D$ 与 eq:Hmean：

$$\le n^{-4}+2D\Big(\frac{2Dr}{L_x}+2n^{-4}\Big)=(1+4D)n^{-4}+\frac{4D^2r}{L_x}.$$

再转化到 $\|G_H^x-F_x\|^2$：$\|G_H^x-F_x\|^2\le2\|G_H^x-u\|^2+2\|F_x-u\|^2$（平方三角），对 $Q$ 平均：第二项 $\le$ eq:Qerror $=4n^{-8}$ 的两倍 $=8n^{-8}$？tex 的 (eq:Hrate)：

```latex
 n^2\left\langle\norm{G_H^x-F_x}^2\right\rangle
 \le 2(1+4D)n^{-2}+\frac{4D^2}{25N}n^{-7}+8n^{-6},
```

逐项对账：$2\cdot(1+4D)n^{-4}\cdot n^2=2(1+4D)n^{-2}$ ✓；$2\cdot\frac{4D^2r}{L_x}\cdot n^2\le 8D^2n^2\cdot\frac{n^{-9}}{50N}=\frac{4D^2}{25N}n^{-7}$ ✓（用了 eq:ratio）；第三项来自 $2\|F_x-u\|^2$ 部分：$n^2\cdot2\cdot\langle\|F_x-u\|^2\rangle\le n^2\cdot 2\cdot4n^{-8}=8n^{-6}$ ✓（tex 写 $8n^{-6}$，与 $2\times4n^{-8}\times n^2$ 吻合，第三项实际是 $n^{-6}$ 级而非我先前口算的 $n^{-8}$——因为拆分用了 $\|G-F_x\|^2\le2\|G-u\|^2+2\|F_x-u\|^2$，第二个 2 乘进 $4n^{-8}$）。全部 $\to0$。**(eq:horizontal) ∎**

**第 2 段：垂直选择第一列（$x$ 方向在宽竖条上的均值）。** 竖条宽 $nr$。对每条完整竖条（色 $i$，色条与 $Q$ 交出的每段）在 $x$ 上积分 $(F_i-F)_x$：条两端点像差 $\le2Dr$，除以条宽 $nr$ 得该条上 $(F_i)_x$ 线平均与 $\frac1{nr}\int(F_i-F)_x$ 的偏移 $\le\frac{2Dr}{nr}=\frac{2D}{n}$。把所有条的积分加起来（**允许条边界跳跃**，tex 285 行），再对 $y$ 平均，加 eq:Qerror 的 $2n^{-4}$：

```latex
 \norm{\langle G_V^x\rangle-u}\le\frac{2D}{n}+2n^{-4}.\tag{eq:Vxmean}
```

方差恒等式丢左边：$\eta_n=\langle A-\|G_V^x\|^2\rangle\ge0$ 且

```latex
 0\le\eta_n
 &\le A-\norm u^2+2\norm u\norm{\langle G_V^x\rangle-u}\tag{逐字}\\
 &\le (1+4D)n^{-4}+\frac{4D^2}{n}\longrightarrow0.\tag{eq:eta}
```

（$2D\cdot\frac{2D}{n}=\frac{4D^2}{n}$；$2D\cdot2n^{-4}=4D^2n^{-4}\le(1+4D)n^{-4}$ 吸收 ✓。）

**lem:compact 登场**：$(s,t)=(\|G_V^x(p)\|^2,\|G_V^y(p)\|^2)\in K$ a.e.（eq:Kbounds 第二式），概率测度 $=$ $Q$ 上归一化面积测度，$\mathbb E(A-s)=\eta_n\to0$（eq:eta）$\Rightarrow\limsup\mathbb E t\le B$：

```latex
 \limsup_{n\to\infty}\left\langle\norm{G_V^y}^2\right\rangle\le B.\tag{eq:Vynorm}
```

**第 3 段：垂直选择第二列。** 竖条高 $L_y$（跨全 $Q$ 高度）。$y$-线积分：eq:Vymean

```latex
 \norm{\langle G_V^y\rangle-v}\le\frac{2Dr}{L_y}+2n^{-4}\longrightarrow0
```

（第一项由 eq:ratio $\to0$，第二项显然。）方差恒等式反向夹（tex 303–309）：

$$0\le\langle\|G_V^y-v\|^2\rangle=\langle\|G_V^y\|^2\rangle-\|v\|^2-2\inner{v}{\langle G_V^y\rangle-v}\le\langle\|G_V^y\|^2\rangle-\|v\|^2+2D\|\langle G_V^y\rangle-v\|.$$

limsup：第一项 $\le B$（eq:Vynorm），第二项 $\ge B-\liminf\|v\|^2=B-o(1)$（nearmax 双侧！$\|v\|^2>B-n^{-4}$），交叉项 $\to0$（eq:Vymean）。合起来 limsup $\le0$，squeeze $\Rightarrow\langle\|G_V^y-v\|^2\rangle\to0$。tex 特别指出："In particular, convergence of the vectors $v$ themselves is unnecessary."（$v$ 只是逐 $n$ 选取的向量，没有理由收敛；双侧 nearmax + 夹逼绕开了紧性缺失。）最后 $\|G_V^y-F_y\|^2\le2\|G_V^y-v\|^2+2\|F_y-v\|^2$ 平均，第一项 $\to0$、第二项 $\le8n^{-8}\to0$。**(eq:vertical) ∎**

**结构总结**：横向链条是"一维的"（$A$-界直接给），纵向链条是"二维字典的"（先 $x$ 饱和 $\to\eta_n\to0\to$ lem:compact $\to$ $y$ 的均值上界 $B$）。$n^2$ 因子只出现在横向 eq:horizontal，因为后续 Crossings 里水平线段长 $Nnr$（振动 $\propto$ 长度 × 导数 $L^2$ 均值 $=Nnr\cdot\frac1r\sqrt{N^{-1}\cdot?}$——见 2.8：用 $n^2$ 加权的能量正是为了长行上的振荡控制归一）。竖行长 $Nr$ 与 $n$ 无关，无需加权。

### (c) 常数的机械理由

- **$n^2$ 加权**：与线段长 $Nnr$ 的平方配平（Cauchy–Schwarz 后端点/振荡界 $=$ 长 × $L^2$ 均值开方；见 2.8 的 $N\sqrt{2N\varepsilon_n}$）。若横向也写成不加权形式，2.8 中水平振动界 $=Nnr\cdot\frac1r\sqrt{\text{无界量}}$ 发散。
- **$2D/n$（eq:Vxmean）**：端点误差 $2Dr$ ÷ 条宽 $nr$。$D$ 线性出现一次、再进 eq:eta 的 $4D^2/n$（乘 $\|u\|\le D$）：$D^2$ 但被 $1/n$ 杀——$n$ 在 $D$ 后选取，量化顺序又一次救命。
- **$4D^2$（eq:eta）**：$2\|u\|\times2D/n\le4D^2/n$。
- **$(1+4D)$**：$n^{-4}+4D^2n^{-4}=(1+4D)n^{-4}$，nearmax 项与均值误差项的合并系数，无独立意义，只随 $D$ 多项式增长，被 $n\to\infty$ 支配。
- **eq:Hrate 的三幂 $n^{-2},n^{-7},n^{-6}$**：主导项是第一项 $2(1+4D)n^{-2}$（nearmax 的 $n^{-4}$ 乘 $n^2$ 后剩 $n^{-2}$）——**整个横向链条的收敛速率由 nearmax 容差 $n^{-4}$ 单点决定**。把 nearmax 改 $n^{-3}$ 则 $n^2\cdot n^{-3}=n^{-1}\to0$ 仍活；改 $n^{-2}$ 则 $n^2\cdot n^{-2}=1\not\to0$，eq:horizontal 崩。故 nearmax 容差指数必须 $>2$，$n^{-4}$ 是最小偶数裕度。同时 baseerror $n^{-8}$ 必须是 nearmax 的平方（$L^2$ 均值开方出 $L^1$），$(n^{-4})^2=n^{-8}$ 的耦合在此定型。**参数族约束：nearmax $=\rho_n$，baseerror $=\rho_n^2$，加权 $n^2$：要求 $\rho_n=o(n^{-2})$。**
- **$50N$（eq:ratio 分母）**：进入 $n^{-7}$ 项，被支配，不敏感。$N$ 在分母只是"更大 $N$ 更好"的假象——$N$ 实际由打包需求下界控制（2.6），不能拿它做收敛余量。

### (d) 候选失败路线 [推测]

1. **对称处理两方向（不要各向异性）**：对 $G_H^y$、$G_V^x$ 也求收敛——横向 $G_H^y$ 的振动控制需要竖线段长 $Nr$ 上的 $(F_i-F)_y$ 均值，横条**不跨全高**（高 $r$），线积分无法给出（条两端都在同一横条内、竖向量不守恒）；竖向 $G_V^x$ 已被使用但只到"均值 $\to u$"，其 $L^2$ 收敛根本没被要求（lem:compact 只吃它的矩）。各向异性不是偷懒，是几何可行性上限：色条只在"自己方向的跨度"上线积分闭合。
2. **用 Poincaré 不等式整体替代两段能量**：矩形 $Q$ 上 $\|G-\langle G\rangle\|_{L^2}\le C\operatorname{diam}\|\nabla G\|_{L^2}$——$G$ 分段不连续（见 2.5(d)2），且右端 $\nabla G$ 正是想估的对象，循环。
3. **让 $n$ 也放大 $N$（$N_n\to\infty$）**：若色数增长，lem:compact 的应用不变，但 $n^2$ 加权需换成 $N_n^2 n^2$ 级别才能喂 Crossings 的 $\omega_n$，而 nearmax/baseerror 是"存在性"选取（无速率），无法为增长的 $N_n$ 保证更快收敛；无定量模引理是刻意的最弱假设，代价就是 $N$ 必须冻结。[推测]

## 2.8 Crossings：打包矛盾（Section 5，tex 312–383 行，含 Figure 1）

### (a) 精确陈述（关键公式全抄）

周期块与能量（tex 316–320）：

```latex
Choose a complete period block $P\subset Q$ on which the mean of the
nonnegative combined energy
\[
 n^2\norm{G_H^x-F_x}^2+\norm{G_V^y-F_y}^2
\]
is no greater than its mean on $Q$. Denote its mean on $P$ by $\varepsilon_n$.
Proposition~\ref{prop:energy} gives $\varepsilon_n\to0$. The block has width
$Nnr$ and height $Nr$, and contains exactly one row and one column of each
color.
```

选线（eq:rowline, eq:colline，tex 322–331）：

```latex
For every color $i$, its row has area $|P|/N$. Fubini therefore permits a
horizontal segment $y=y_i$ in its interior, spanning $P$, such that
\begin{equation}\label{eq:rowline}
 \frac{1}{Nnr}\int_{\text{row segment}}
 n^2\norm{(F_i-F)_x}^2\,dx\le2N\varepsilon_n.
\end{equation}
Similarly choose $x=x_i$ in the interior of column $i$ with
\begin{equation}\label{eq:colline}
 \frac{1}{Nr}\int_{\text{column segment}}
 \norm{(F_i-F)_y}^2\,dy\le2N\varepsilon_n.
\end{equation}
```

振动与归一化偏移（eq:omega，tex 334–344）：

```latex
Write $h_i=(F_i-F)/r$ on its domain in $P$. Absolute continuity and
Cauchy--Schwarz give, on each chosen horizontal segment,
\[
 \diam h_i(\text{segment})
 \le\frac{Nnr}{r}\left(\frac{1}{Nnr}\int\norm{(F_i-F)_x}^2\,dx\right)^{1/2}
 \le N\sqrt{2N\varepsilon_n}.
\]
... Set
\begin{equation}\label{eq:omega}
 \omega_n=N\sqrt{2N\varepsilon_n}\longrightarrow0,
 \qquad z_i=h_i(x_i,y_i).
\end{equation}
By \eqref{eq:offset}, $\norm{z_i}\le D$.
```

交叉分离与打包（tex 369–383）：

```latex
For $i\ne m$, both added labels $re_{j,i}$ and $re_{j,m}$ are permitted at
$(x_m,y_i)$: the first by row $i$, the second by column $m$. The corresponding
source points have distance exactly $\sqrt2\,r$, so \eqref{eq:bilip} gives
\[
 \norm{h_i(x_m,y_i)-h_m(x_m,y_i)}\ge\sqrt2.
\]
...
\[
 \norm{z_i-z_m}\ge\sqrt2-2\omega_n>1
\]
for all pairs when $n$ is sufficiently large. This is simultaneous because $N$
is fixed.
...
\[
 N(1/2)^k\le(D+1/2)^k,\qquad N\le(1+2D)^k,
\]
contrary to \eqref{eq:N}. No map satisfying \eqref{eq:bilip} exists. Together
with Proposition~\ref{prop:doubling}, this proves Theorem~\ref{thm:main}.\qed
```

Figure 1 caption（tex 365，原文逐字，供笔记引用）：

> "A schematic period block, for $i\ne m$. At $c$, both labels are allowed: $i$ by the row and $m$ by the column. Their normalized offsets are separated by at least $\sqrt2$. Transport along the arrows changes $h_i$ and $h_m$ by at most $\omega_n$ each, so $z_i=h_i(p_i)$ and $z_m=h_m(p_m)$ are separated by at least $\sqrt2-2\omega_n$. The block and strip proportions are schematic."

### (b) 证明机制推导

1. **选 $P$ 的存在性**：$Q$ 被（至多差边界线）周期块平铺；非负函数的平均值 $\bar\varepsilon$ 下必有至少一块均值 $\le\bar\varepsilon$。边界线上 $G$ 未定义（零测），不影响均值。prop:energy 两式别相加：$n^2$-加权横向 $\to0$ ✓、纵向裸量 $\to0$ ✓，组合能量在 $Q$ 上均值 $\to0$，故 $\varepsilon_n\to0$。**两式输出形状（一带 $n^2$ 一裸）与此处输入形状（组合能量恰含同样权重）是设计对接**——横向带 $n^2$ 进能量、纵向不带，原因见第 4 步。
2. **选行线（eq:rowline）**：色 $i$ 横条 $\cap P$ $=$ 宽 $Nnr$ × 高 $r$ 横带，面积 $=|P|/N$。行内 a.e. 点处 $G_H^x=(F_i)_x$（横色条颜色为 $i$），故 $n^2\|(F_i-F)_x\|^2$ 在行上的积分被组合能量在行上的积分控制；行均值 $\le N\times P$均值 $\le N\varepsilon_n$，tex 写成 $2N\varepsilon_n$（一倍裕度，覆盖平铺差边界线的损失）。再由"存在一点函数值 $\le2$ 倍均值"的 Fubini/均值原理，行内存在水平线 $y=y_i$ 使线均值 $\le2N\varepsilon_n$。线还要落在行**内部**并属于"偏导 $=$ 线导"满测集——tex 332 逐字："These lines can simultaneously be chosen from the full-measure sets where partial derivatives agree with line derivatives. If $\varepsilon_n=0$, use lines of zero energy. The choices of the horizontal and vertical coordinates are independent."（横竖独立选：坏集分别是零测竖线族/横线族，互不干扰。）
3. **选列线（eq:colline）**：平行论证，列面积 $|P|/N$（宽 $nr$ × 高 $Nr$），用不加权能量。
4. **振动估计**：$F_i-F$ 是 $2D$-Lipschitz，限制在所选线段上 AC。$\operatorname{diam}h_i(\text{seg})\le\int_{\text{seg}}\|\partial_xh_i\|dx\le$ 线长 $\times$（导数 $L^2$ 均值）$=Nnr\cdot\frac1r\sqrt{\frac{1}{Nnr}\int\|(F_i-F)_x\|^2dx}=Nn\sqrt{2N\varepsilon_n}/n=N\sqrt{2N\varepsilon_n}$ ✓（线均值是对 $n^2\|(F_i-F)_x\|^2$ 的，开方除回 $n$）。**$n$ 在此精确相消——$n^2$ 加权的最终兑现点**：线长 $\propto n$、能量权重 $\propto n^2$，一一抵消后振动只依赖 $\varepsilon_n$ 与固定 $N$。竖线：长 $Nr$、无权重：$\frac{Nr}{r}\times\sqrt{\text{不加权线均值}}=N\sqrt{2N\varepsilon_n}$ ✓（tex："The identical bound on each chosen vertical segment follows from (eq:colline), with length $Nr$"）。
5. **交叉点合法性**：$c=(x_m,y_i)$。$y_i$ 在横色条 $i$ 内部 ⇒ $c\in H_{j,i}\subset U_{j,i}$ ⇒ 标签 $re_{j,i}$ 合法（行给的）；$x_m$ 在竖色条 $m$ 内部 ⇒ $c\in V_{j,m}\subset U_{j,m}$ ⇒ $re_{j,m}$ 合法（列给的）。$i\ne m$ 时两标签不同但**同时**许可——"行管横色、列管竖色"的双重许可结构是棋盘几何的精髓。源点对 $(c,w+re_{j,i})$、$(c,w+re_{j,m})$ 距离 $=\|re_{j,i}-re_{j,m}\|=\sqrt2r$（正交基向量差），eq:bilip 下界 ⇒ $\|h_i(c)-h_m(c)\|\ge\sqrt2$。
6. **传输**：$z_i=h_i(p_i)$，$p_i=(x_i,y_i)$。水平沿行线 $y=y_i$ 从 $c=(x_m,y_i)$ 到 $p_i$：同在所选线段上，$h_i$ 变化 $\le\omega_n$ ✓（$x_m\in P$ 内 ✓）。竖直沿列线 $x=x_m$ 从 $c$ 到 $p_m=(x_m,y_m)$：$h_m$ 变化 $\le\omega_n$ ✓。三角不等式拼出 $\|z_i-z_m\|\ge\sqrt2-2\omega_n$（Figure 1 的两支箭头）。
7. **交叉点免可微**（tex 345 逐字）："Oscillation on a Lipschitz line is controlled at every point by its derivative integral, so no differentiability assertion is required at the crossings."——$c$ 可以不是 good point：AC 的端点对不等式对线上一切实点成立，Lipschitz 连续把 a.e. 信息抬到端点。精巧豁免。
8. **收尾**：$\omega_n\to0$（$\varepsilon_n\to0$、$N$ 固定）⇒ $n$ 大时 $\sqrt2-2\omega_n>1$ 对全部 $\binom N2$ 对**同时**成立（"This is simultaneous because $N$ is fixed"）。$\{z_i\}\subset\overline B(0,D)$（eq:offset 给 $\|z_i\|\le D$）两两距离 $>1$：$N$ 个开 $1/2$-球互斥、装入 $D+1/2$ 球，体积比 $N(1/2)^k\le(D+1/2)^k\iff N\le(1+2D)^k$，与 eq:N 严格大于矛盾。∎ thm:main（连同 prop:doubling）。

### (c) 常数的机械理由

- **$\sqrt2$**：正交标签对距离，2.1 构造层预置。传输损耗 $\le2\omega_n$，打包需求"分离 $>1$"，即需 $\sqrt2-2\omega_n>1\iff\omega_n<\frac{\sqrt2-1}2$，由 $\omega_n\to0$ 保证。若标签非正交（夹角 $60^\circ$ 距离归一后 $1$），则 $1-2\omega_n>1$ 永假——**源分离必须严格大于归一化打包门槛**，直角恰给 $\sqrt2>1$ 的余量。
- **$2N$（eq:rowline 右端）**：$N$ 来自行面积 $|P|/N$（行均值 $\le N$ 倍全局均值），另一个 2 是"存在线 $\le2\times$ 均值"裕度。$\omega_n=N\sqrt{2N\varepsilon_n}$ 对 $N$ 是 $N^{3/2}$ 级放大——$\varepsilon_n\to0$ 无速率，全靠 $N$ 冻结吸收。
- **$(1+2D)^k$**：体积比 $\frac{(D+1/2)^k}{(1/2)^k}$。门槛 1 由 $\sqrt2-2\omega_n>1$ 归一化而来。$D$ 在底数、$k$ 在指数——$N>(1+2D)^k$ 要求"先 $k,D$ 后 $N$"，正是量化链 $k,D\prec N$ 的显形。
- **$n^2$ 权重与线长 $Nnr$ 的配对**（承 2.7）：振动 $=$ 线长 $\times$ 导数 $L^2$ 均值开方；线长里的 $n$ 与能量权重里的 $n^2$ 开方后一一抵消。若横向能量不加权而线长仍 $\propto n$，振动 $\propto n\sqrt{\text{裸均值}}$ 发散——加权是把 $n^{-2}$ 提前写进能量定义的记账法（2.7 横向链条 $n^2\langle\ldots\rangle\to0$ 正是为这里付账）。

### (d) 候选失败路线 [推测]

1. **不传输、直接在交叉点收集 $h_i(c)$**：不存在对所有色 $i$ 同时合法的单点 $c$——一点至多栖于一条横条 + 一条竖条（两色）。$N$ 个向量必须来自 $N$ 个不同基座点，"行/列振动 $\le\omega_n$ 传输到同色锚点 $p_i$"是把不同纤维上的数据搬进同一 $\R^k$ 做比较的唯一通道；这也是"每色一行一列 + 每色锚点"三件套结构的必然性。
2. **把 $z_0=0$（零标签）加入打包集**：可行（$\|h_i\|\ge1$ 由 eq:bilip 下界，开球互斥门槛 $\ge1$ 勉强够，改 $>\!1$ 需再榨 $\omega_n$）；论文不用——$N$ 个已经够矛盾，加第 $N+1$ 个不改变 $N>(1+2D)^k$ 的量级。无收益简化失败。[推测]
3. **snowflake 距离 $d^\alpha$ 下重演本节**：第 4–7 步全线崩——$d^\alpha$ 破坏 sheet 差分 $(F_i-F)/r$ 的加法结构与 AC 线积分（振荡不再由导数 $L^2$ 控制）；交叉分离变成 $(\sqrt2r)^\alpha$ vs $Dr^\alpha$，归一后 $\sqrt2^\alpha>1$ 虽在，但没有任何机制把它转成"每色向量两两分离"。障碍精确停在 $\alpha=1$——与 Assouad 定理（$\alpha<1$ 可行）形成互补拼图。论文未讨论 snowflake 变体；此对照是素材推断。

## 2.9 Corollary（有限-$p$ 函数空间障碍，`cor:lp`，tex 385–412 行）

### (a) 精确陈述

```latex
\begin{corollary}[Finite-$p$ function-space obstruction]\label{cor:lp}
For every real $1\le p<\infty$, the fixed metric space $S$ of
Theorem~\ref{thm:main} is isometric to a subset $S_p$ of $L_p([0,1];\R)$,
where $[0,1]$ carries Lebesgue measure. With its induced $L_p$ metric, $S_p$
has doubling constant at most $76800$ and admits no bi-Lipschitz embedding into
any finite-dimensional real normed space at any finite distortion.
\end{corollary}
```

### (b) 证明机制推导

1. **高斯等距**：$([0,1],\text{Leb})$ 上 iid 标准 Gauss $(g_i)_{i\ge1}$（存在性论文未证——[推测：Lean 需现成引理或构造]）。$c_p=(\mathbb E|g_1|^p)^{1/p}\in(0,\infty)$：所有有限矩存在且非零。有限支撑 $a$：$\sum a_ig_i$ 是中心 Gauss、方差 $\sum a_i^2$，正态分布的 $p$-矩 $=c_p^p(\sum a_i^2)^{p/2}$，故 $\|\sum a_ig_i\|_{L_p}=c_p(\sum a_i^2)^{1/2}$（tex 逐字）。
2. **延拓到全 $\ell_2$**：截断 Cauchy 列 $\to L_p$ 完备取极限（tex 特别注明 "Completeness, including at $p=1$"——$L_1$ 完备靠 Riesz–Fischer）。极限 $J_px=c_p^{-1}\lim_m\sum_{i\le m}x_ig_i$。线性与等距 $\|J_px-J_py\|_p=\|x-y\|_2$ 由极限传递。
3. **$p=2$ 自检**：$c_2=1$，$J_2$ 就是恒等（模标准正交基），与 thm:main 相容。
4. **目标一般化**：$f:S_p\to Y$（$\dim Y=k<\infty$，distortion 有限）$\xRightarrow{T}Y\cong\R^k$（范数等价 ⇒ $T$ bi-Lipschitz）⇒ $T\circ f\circ J_p|_S:S\to\R^k$ 矛盾 thm:main。零维：$S_p$ 多于一点，单射都不存在。
5. **doubling 继承**：等距不改度量 ⇒ $76800$ 原样。

### (c) 常数的机械理由

- **$c_p$**：归一化让等距**精确**（不是 bi-Lipschitz-with-constant $c_p$），陈述干净；不除 $c_p$ 则所有下游常数乘 $c_p$ 幂，无结构变化。
- **"$1\le p<\infty$" 右端**：$p=\infty$ 崩——Gauss 无界（$g_1\notin L_\infty$，$c_\infty=\infty$）。全部有限 $p$ 通吃靠"高斯有全体有限矩"。
- **"$76800$" 不变**：等距的平凡推论；若改用近似等距（如 Rademacher 级数进 UMD 空间）常数会漂移——高斯路线零漂移。[推测对比路线见 (d)1]

### (d) 候选失败路线 [推测]

1. **Rademacher 级数替代高斯**：Khintchine 给 $\|\sum a_ir_i\|_{L_p}\asymp_p(\sum a_i^2)^{1/2}$——只有等价范数不是等距，$S_p$ 的 doubling 常数会被 $\asymp_p$ 常数扭（仍可，但 76800 保不住）；且 Rademacher 张成的空间是 $\ell_2$ 在 $L_p$ 的**受控拷贝**非精确拷贝。高斯的正态矩恒等式是唯一"零失真"通道。
2. **搬到坐标 $\ell_p$ 源**：高斯序列不 $\ell_p$-可和（几乎每条轨道无界衰减不足），$J_p$ 值域不落在 $\ell_p$；论文 408 行主动划界："Corollary~\ref{cor:lp} concerns function-space sources $L_p[0,1]$, not coordinate $\ell_p$ sources"。$\ell_p$（$p\ne2$）情形由 BGN/BSS（$p>2$）占据，$1<p<2$ 的 $\ell_p$ 版本论文未述，是真开放边界。
3. **$p=1$ 用 LN 已有强结果**：LN 注明 $p=1$ 有 "stronger known results"（tex 408 行转述）；本推论不追求 $p=1$ 最强，只追求**同一集 $S$ 统一全部 $p$**——统一性才是卖点，强度让位。

## 2.10 Corollary（任意无限维 Banach 中的紧障碍，`cor:banach`，tex 414–491 行）

### (a) 精确陈述

```latex
\begin{corollary}[Compact Banach-space obstruction]\label{cor:banach}
There is a universal constant $\Lambda$ such that every infinite-dimensional
real Banach space $B$ contains a compact subset $K_B$ whose doubling constant
is at most $\Lambda$ and which admits no bi-Lipschitz embedding into any
finite-dimensional real normed space at any finite distortion. The subset
$K_B$ may depend on $B$, but is chosen independently of the target dimension
and distortion.
\end{corollary}
```

### (b) 证明机制推导（论文自注 "We use closed balls below; the same estimates work for open balls"，$\lambda=76800$）

**第 1 段（Finite witnesses，紧致化引理）**：命题——每对 $(k,A)$（$A\ge1$ 有限）存在 $S$ 有限子集不可嵌入 $\R^k$ distortion $\le A$。反证：设全部有限子集可。固定 $o\in S$，对每 $x$ 设紧盒 $Q_x=\{u\in\R^k:\|u\|\le A d_S(o,x)\}$。乘积 $\prod_xQ_x$ 紧（Tychonoff，依赖 Choice）。每条双向约束在乘积空间中闭（距离连续）。**FIP 验证**：有限多个约束牵涉有限点集 $E$（含 $o$）；取 $E$ 的某嵌入 $g$（归一化：$d\le\|g(x)-g(y)\|\le A d$），"$o$ 平移为零、除以下界尺度"后自动满足全部双向约束；盒约束 $\|g(x)\|\le A d_S(o,x)$：由上界 $\|g(x)-g(o)\|\le A d(o,x)$ 且 $g(o)=0$ ✓；其余坐标置 0 得 FIP 元素。紧致性 ⇒ 全局 $f$ 满足所有约束，矛盾 thm:main。∎
随后对角取用：每 $j$ 选 $X_j\subset S$ 有限、不可嵌入 $\R^j$ distortion $\le j$，$\#X_j\ge2$；"These choices are made before any target for $K_B$ is considered"。

**第 2 段（Dvoretzky 放置 + 簇 doubling $\lambda_0=\lambda^4$）**：经典有限维 Dvoretzky（引 Dvoretzky §7 与 COO Thm 1.1）：$X_j$ 的有限维 Hilbert 张成空间线性嵌入 $B$，distortion 严格 $<2$（一维情形 immediate）；重标度后 $d_S(x,y)\le\|T_jx-T_jy\|_B\le2d_S(x,y)$。$Y_j=T_jX_j$ 的 doubling：目标 $B_{Y_j}(T_jx,R)$，原像 $E\subset B_S(x,R)$（下界）。**四次半价**：$B_S(x,R)\subset$ 并 $\lambda^4$ 个 $R/16$-球。凡与 $E$ 交的 $R/16$-球取代表 $x_0\in E$；同球 $x'\in E$：$d_S(x',x_0)\le R/16+R/16=R/8$，像距

```latex
 \norm{T_jx'-T_jx_0}_B
 \le2d_S(x',x_0)
 \le2\left(\frac R{16}+\frac R{16}\right)
 =\frac R4\le\frac R2
```

⇒ 代表点 $T_jx_0$（在 $Y_j$ 内 ✓ intrinsic）的 $R/2$-球覆盖 $E$，计数 $\le\lambda^4$。

**第 3 段（紧装配与覆盖账）**：单位向量 $v\in B$，$a_j=2^{-j}$，$\eta=1/100$；平移 + 正缩放（等距仿射，不改 distortion $<2$ 也不改 $\lambda_0$-doubling）把 $Y_j$ 摆进 $C_j\subset B_B(a_jv,\eta a_j)$。$K_B=\{0\}\cup\bigcup_jC_j$。
- **紧性**：$z\in C_j\Rightarrow\|z\|\le(1+\eta)a_j$；任一序列或命中有限簇（常数子列）或簇号 $\to\infty$（$\to0$）。
- **尾部一桶收编**：$a_j\le r/4$ 的全部簇 + 0 落入 $B_{K_B}(0,r/2)$：$\|z\|\le1.01\cdot r/4=\frac{101}{400}r<\frac r2$ ✓。"The center $0$ need not belong to the ball being covered"——doubling 只要求球心 $\in K_B$。
- **活跃簇数**：$I=\{j:C_j\cap B_{K_B}(x,r)\ne\emptyset,\ a_j>r/4\}$ 有限。簇间分离（$i<j$，$p\in C_i,q\in C_j$）：

```latex
 \norm{p-q}_B
 \ge(a_i-a_j)-\eta(a_i+a_j)
 \ge\left(\frac12-\frac{3\eta}{2}\right)a_i
 =\frac{97}{200}a_i.
```

（用 $a_j\le a_i/2$：$(a_i-a_j)\ge a_i/2$、$\eta(a_i+a_j)\le\eta\cdot\frac32a_i$。）若 $|I|\ge2$，最小指标 $i$ 簇与另一簇的点同处 $B(x,r)$ ⇒ 距 $\le2r$ ⇒ $a_i\le\frac{400}{97}r$。所有 $I$-尺度 $\in(r/4,\frac{400}{97}r]$，极比 $<\frac{1600}{97}\approx16.5<32=2^5$ ⇒ 二进档位数 $\le5$。$|I|=1$ 无需界（单簇覆盖不依赖其大小）。
- **逐簇覆盖**：$y_j\in C_j\cap B(x,r)$；交 $B_{K_B}(x,r)\cap C_j\subset B_{C_j}(y_j,2r)$（内蕴：两点同经 $x$ 三角 $r+r$）。$\lambda_0$-doubling 用两次（$2r\to r\to r/2$）⇒ $\le\lambda_0^2$ 个 $r/2$-球（心在 $C_j\subset K_B$ ✓）。
- **总账**：$1+5\lambda_0^2\le1+6\lambda^8$。$\Lambda=1+6\lambda^8=1+6\cdot76800^8$。

**第 4 段（障碍传递）**：反设 $K_B$ 嵌入有限维赋范 $Y$（distortion 有限；零维因 $\#K_B\ge2$ 不可）。同构拉回 $\R^k$：$f:K_B\to\R^k$ distortion $D$。取 $j\ge\max(k,2D)$。复合 $X_j\xrightarrow{T_j}C_j$（distortion $<2$）$\xrightarrow{f}\R^k$（$D$）$\hookrightarrow\R^j$（补零等距，用 $j\ge k$）：总 distortion 严格 $<2D\le j$——与 $X_j$ 不可嵌入 $\R^j$ distortion $\le j$ 矛盾。∎

### (c) 常数的机械理由

- **$a_j=2^{-j}$**：(i) $a_j\to0$ 给紧性与尾部一桶；(ii) 倍率 2 与窗口极比 $<32$ 联立出 "$\le5$ 档"（$2^4=16<1600/97<32=2^5$——窗口宽度落在 $(2^4,2^5)$，至多 5 档 ✓）。
- **$\eta=1/100$**：约束 $\frac12-\frac{3\eta}2>0$ 即 $\eta<\frac13$（间距正性）；$1.01/4<1/2$ 即 $\eta<1$（尾部收编）。取 1/100 让两处都以"几乎不打折"通过，同时分离系数 $\frac{97}{200}\approx0.485$ 近 $\frac12$，窗口极比 $\approx16.5$ 逼近下限 $16$（若 $\eta\to\frac13$，分离 $\to0$、$a_i\le r/\text{sep}\to\infty$、档数 $\to\infty$、$\Lambda$ 爆炸）。
- **$\lambda^4$**：四次半价 = "球半径 $R\to R/2$ 但要过一座 distortion-2 的桥"的净开销：$R/16$ 网格球内两两源距 $\le R/8$，经 $T$ 放大 2 倍后 $\le R/4\le R/2$ ✓。若 Dvoretzky distortion $\kappa\in[2,4)$：$\kappa R/8\le R/2$ 仍 ✓、$\lambda_0=\lambda^4$ 不变；$\kappa\ge4$ 需加半价次数、$\lambda_0$ 升幂。
- **"$\le j$" vs "strictly below $2D\le j$"**：$X_j$ 的不可行阈值恰为 $j$；复合给的 $<2D\le j$ 必须严格 $<j$ 才矛盾——所以 Dvoretzky 用严格 $<2$（tex 两处 "distortion strictly below two" / "strictly below $2D\le j$" 的严格字都吃紧）。
- **$1+5\lambda_0^2\le1+6\lambda^8$**：$\lambda_0^2=\lambda^8$；$1\le\lambda^8$ 并项。$\Lambda$ 只要 universal，数值 $\approx6\times(7.68\times10^4)^8\approx2.7\times10^{39}$，论文明示不在乎（摘要强调的只是"independent of the ambient Banach space"）。

### (d) 候选失败路线 [推测]

1. **省去有限逼近、直接 Dvoretzky 搬整个 $S$**：$S$ 张成无穷维 Hilbert；Dvoretzky 只保证**有限维**子空间好拷贝，无穷维整体没有（$B$ 可能不含等距 $\ell_2$）。必须把障碍切成有限片 $X_j$ 逐片搬——这正是 FIP 引理（第 1 段）的存在理由：thm:main 的无穷障碍 ⇒ 有限障碍族，且 $(k,A)\mapsto j=\max(k,\lceil2D\rceil)$ 对角枚举与簇尺度 $a_j$ 对齐。
2. **簇不缩放（等距放置）**：$C_j$ 若保持原尺度则无 $a_j\to0$，$K_B$ 不紧、尾部无法一桶收编、活跃簇无限。缩放（distortion $<2$ 的仿射）是紧性与 doubling 两职的唯一同时解。
3. **直接宣称 $K_B$ doubling $\le\lambda$**：不行——bi-Lipschitz 像不保持 doubling 常数定量值；$\lambda\to\lambda^4\to\lambda^8$ 的塔式放大是 intrinsic-center 与双桥（Dvoretzky + 装配）的必然代价。

---

# 三、叙事时间线（论文自述动机、已知结果与明写障碍；英文逐字引用）

> 说明：本节引文全部逐字摘自 `build/main.tex`，出处标注 tex 行号与所在段落。论文没有自述的任何"心路历程"一律标"论文未述"。

## 3.1 问题史（Introduction 第 2–5 段，tex 40–44 行）

**问题来源（Lang–Plaut）**，tex 40 行逐字：

> "Lang and Plaut asked whether every doubling subset of Hilbert space admits a bi-Lipschitz embedding into some finite-dimensional Euclidean space; see \cite[Question 2.4]{LP}, restated in \cite[Question 1]{NN}. Gupta, Krauthgamer, and Lee independently formulated the question in the context of algorithmic dimension reduction \cite[Section 6, Question 1]{GKL}. The hypothesis already supplies a Hilbert-space realization, so the issue is whether a bound on metric covering complexity permits a reduction to finitely many Euclidean coordinates while preserving all distances up to a fixed factor."

（引用对应文献：LP = Lang–Plaut, *Bilipschitz embeddings of metric spaces into space forms*, GD 2001；NN = Naor–Neiman, RMI 2012；GKL = Gupta–Krauthgamer–Lee, FOCS 2003。）

**正面前史（snowflake 一侧）**，tex 42 行逐字：

> "Assouad's theorem gives a positive result after changing the metric: every doubling metric space admits such an embedding for the distance $d^\alpha$, where $0<\alpha<1$ \cite{Assouad}. This operation is called \emph{snowflaking}. Naor and Neiman proved that, when $\alpha$ is close to $1$, the target dimension can be bounded in terms of the doubling constant alone, independently of $\alpha$ \cite[Theorem 1.2]{NN}. The distortion bound still depends on the snowflake exponent. For finite Hilbert subsets, Gottlieb and Krauthgamer obtained embeddings of snowflakes with distortion arbitrarily close to one, with dimension depending on the doubling constant, exponent, and permitted distortion \cite[Theorem 1.2]{GK}. The Lang--Plaut question concerns the original distance $d$, even when arbitrary finite dimension and distortion are allowed."

**负面旁系（$p>2$ 一侧）**，tex 44 行逐字：

> "For exponents $p>2$, Lafforgue and Naor constructed doubling subsets of $L_p$ admitting no bi-Lipschitz embedding into any finite-dimensional Euclidean space \cite[Theorem 1.1]{LN}. Independently, Bartal, Gottlieb, and Neiman obtained dimension-reduction obstructions for doubling subsets of $\ell_p$ using thin Laakso configurations \cite{BGN}. Baudier, \'Swi\k{e}cicki, and Swift later gave an elementary proof of the corresponding fixed-set theorem for $\ell_q$, $q>2$ \cite[Theorem 1]{BSS}. These results concern ambient exponents strictly greater than two and do not settle the Hilbert case. Schioppa announced a negative answer in \cite{Schioppa}, but withdrew the preprint after reporting a possible issue with its duality argument."

素材要点：**Schioppa 撤回事件**是本文动机的最近历史节点——撤回原因是 "a possible issue with its duality argument"（对偶论证出问题）。这暗示本文刻意换武器库：全文不用对偶、不用超平面分离，只用二维 Euclidean 微分 + 面积比较 + 体积打包。[推测：论文没有明说"我们因此避用对偶"，此因果为素材推断]

## 3.2 方法自述（"The construction and proof strategy"，tex 54–72 行）

**方法血统**，tex 55 行逐字：

> "The proof couples a covering argument with a derivative obstruction. Differentiation has a substantial history as a method for ruling out Euclidean embeddings: Cheeger's framework gives such obstructions under doubling-measure and Poincar\'e-inequality hypotheses \cite[Section 14, Theorem 14.3]{Cheeger}. Laakso's nonembedding argument gives a related separation-versus-stretch principle: separated branches force an increase in stretch along a subsegment \cite[Section 4, Theorem 4.1]{Laakso}. Here the analytic step uses ordinary Euclidean differentiation of Lipschitz maps on open subsets of $\R^2$ and a quadratic variance identity. A lexicographic extremum treats the two derivative columns successively, and crossings turn their small variation into a packing obstruction. We describe the geometry first."

**目标陈述**，tex 40 行："the issue is whether a bound on metric covering complexity permits a reduction to finitely many Euclidean coordinates while preserving all distances up to a fixed factor."

**策略四段摘要**（对应 tex 段落标题，供笔记按段引用）：
1. "Sparse scales and common sheets"（57–64 行）：核心接口句，tex 60–64 逐字："If $F$ is one sheet and $F_i$ is obtained by adding a color-$i$ displacement at an unused level of size $r$, then $\norm{F_i(p)-F(p)}\le Dr$ wherever the added displacement is permitted. The horizontal and vertical restrictions belong to the same map $F_i$. Our objective is to find one horizontal line and one vertical line of each color along which the relative offset $(F_i-F)/r$ is nearly constant."——**"The horizontal and vertical restrictions belong to the same map $F_i$" 是全证明的机关句**：横竖两个方向的偏移被同一个函数耦合，才使字典导数极值可以两头使。
2. "Two derivative extrema and two different error bounds"（66–69 行）：关键免责句，tex 69 逐字："Compactness suffices for this latter estimate; no quantitative modulus of the second extremum is needed." 同段还给出各向异性的几何解释："The wide vertical strips first force the mean squared horizontal derivative norm of the vertically selected sheets toward $A$. The second extremum then gives vertical mean-square error tending to zero, with no growing factor required."
3. "Crossings turn small variation into a contradiction"（71–72 行）：tex 72 逐字："The fixed set is used throughout; only the sheets, local rectangles, and recurring level vary with $n$."——固定集原则的又一次宣示（与 113 行呼应）。

## 3.3 作者明写的"设计约束 / 不依赖"声明（散各处，逐字）

- 固定集独立性，tex 113 行："Neither $S$ nor its defining parameters will subsequently depend on a proposed embedding."
- 只用 Dvoretzky 的弱形式，tex 443 行："Only this qualitative finite-dimensional form of Dvoretzky is used."
- $L_p$ 推论不新增构造，tex 408 行："This transfer adds no new metric construction. Corollary~\ref{cor:lp} concerns function-space sources $L_p[0,1]$, not coordinate $\ell_p$ sources; the compact result below is a separate transfer to arbitrary infinite-dimensional Banach sources."
- LN 开放问题与本作覆盖范围，tex 408 行："Lafforgue and Naor proved the qualitative fixed-set obstruction with Euclidean targets for $p>2$ and, in the paragraph following their Theorem~1.1, recorded the corresponding question for $1<p\le2$ as open at that time, while noting stronger known results for $p=1$ \cite[Theorem 1.1 and the following paragraph]{LN}. Theorem~\ref{thm:main} treats $p=2$, and Corollary~\ref{cor:lp} answers that qualitative fixed-set question with finite-dimensional Euclidean targets when $1<p<2$."
- 与同库另一 preprint 的对照，tex 410–412 行："Finite-set dimension reduction in $L_p$, for $1<p<\infty$ and $p\ne2$, allows the target dimension to depend on cardinality~\cite[Theorem~1.1]{OpenAI2026LpReduction}, unlike the fixed infinite-set obstruction of Corollary~\ref{cor:lp}."（引 OpenAI *Subpolynomial dimension reduction in $L_p$*，2026-09-23——两篇构成"正面有限集 vs 负面固定无限集"对照对。）
- $v$ 免收敛声明，tex 309 行："In particular, convergence of the vectors $v$ themselves is unnecessary."
- 交叉点免可微，tex 345 行："Oscillation on a Lipschitz line is controlled at every point by its derivative integral, so no differentiability assertion is required at the crossings."
- 主定理的推论句，tex 50 行："In particular, dimension and distortion bounds depending only on the doubling constant cannot hold for all doubling Hilbert subsets."
- Banach 版与摘要口径，tex 28 行（摘要全引，见 1.1）。

## 3.4 论文未述清单（笔记中禁止编造的内容）

- 未述：尝试过哪些失败构造（Heisenberg、tree、snowflake 变体等一概不见于正文；第二节各 (d) 的失败路线全部是素材侧 [推测]）。
- 未述：$76800$、$1000$、$n^{-4}/n^{-8}$ 等常数是否最优，或做过何种搜索调优。
- 未述：Schioppa 对偶论证问题的具体技术细节（只给了"possible issue"一句话）。
- 未述：任何计算/实验/辅助工具过程；文风、定理编号、引用格式完全是传统数学 preprint 体裁。
- 未述：$1<p<2$ 时坐标空间 $\ell_p$ 的固定集障碍（作者刻意把 cor:lp 限制在 function-space $L_p[0,1]$，见 3.3 引文）。
- 未述：doubling 常数的下界方向——是否存在阈值 $C_0$，使 doubling $\le C_0$ 的 Hilbert 子集总有有限维嵌入（本反例的 $76800$ 远大于 2 维空间的自然常数 $\sim 5\text{–}6$）。[推测：笔记可把它作为"余味问题"提出，但必须注明论文未讨论]
- 未述：$S$ 的 Hausdorff 维数、测度性质等 finer invariants。[推测：对比 cor:lp 的等距搬运零代价，正说明"等距"与"bi-Lipschitz 搬运"在定量守恒上的本质差别]

---

# 四、Lean 取证：形式化模块结构与论文叙述的一致性

## 4.1 取证范围、元信息与"无 sorry"核查

登记信息（`E:\math\lean\formalization.yaml` 第 87 行附近条目，逐字）：

```yaml
  - title: "A doubling Hilbert subset with no finite-dimensional bi-Lipschitz embedding"
    authors: ["OpenAI"]
    id: ../preprints/A-doubling-Hilbert-subset-with-no-finite-dimensional-bi-Lipschitz-embedding-September-25-2026/main.pdf
    type: article
```

注意：登记的 `id` 指向 `main.pdf`（论文根目录的 PDF），而本素材的数学内容一律取自 `build/main.tex`；PDF 仅作条目索引，不作读取来源。

挑战配置 `E:\math\lean\ComparatorChallenges\DoublingHilbert.json` 逐字：

```json
{
  "challenge_module": "ComparatorChallenges.DoublingHilbert",
  "solution_module": "OAI.Geometry.DoublingHilbert.Main",
  "theorem_names": [
    "OAI.DoublingHilbert.main"
  ],
  "definition_names": [],
  "permitted_axioms": [
    "propext",
    "Quot.sound",
    "Classical.choice"
  ],
  "enable_nanoda": false
}
```

三点取证结论：

1. **求解模块是 `Main.lean`**，且被要求证明的定理名唯一：`OAI.DoublingHilbert.main`。同目录的 `CompactBanach.lean` 里还有一个 `OAI.CompactBanach.main`（论文 cor:banach 的形式化），但它**不在** `theorem_names` 中——即比较任务的靶心只是 Hilbert 反例本身，Banach 推广是"论文自证但竞赛不要求"的额外部分。这一点决定了 4.4 节的模块分层：`CompactBanach` 链上的十个文件是"超额完成"，不是主链必需品。`enable_nanoda: false` 表示此题不使用 Nanoda 的度量几何库（Mathlib 里那套 doubling/Assouad 形式化），所有 covering 论证都得手写。
2. **公理口径**：只允许 Mathlib 默认的三条 `propext`、`Quot.sound`、`Classical.choice`。取证方法：对整个目录 `DoublingHilbert/` 做正则扫描 `sorry|admit\b|^axiom|native_decide|decide!`，命中只有一处，且是英文散文里的动词：

```
Doubling.lean:100:/-- Compact metric sets admit a finite upper bound for any fixed positive separation. -/
```

即 28 个 `.lean` 文件（`wc -l` 合计 4664 行，含 `Main.lean`；最长的三个是 `Rectangles.lean` 489 行、`Construction.lean` 435 行、`SelectedSheets.lean` 405 行）**没有任何 `sorry`、没有 `admit` 战术、没有自定义 `axiom`、没有 `native_decide` 后门**。唯一的 `sorry` 出现在挑战声明文件 `E:\math\lean\ComparatorChallenges\DoublingHilbert.lean` 第 26 行，那是给竞争者的空缺，不是求解者的空缺：

```lean
/-- A single fixed subset, independent of dimension and distortion. -/
theorem main : ∃ S : Set RealL2,
    DoublingAtMost S 76800 ∧
      ∀ k : ℕ, 0 < k → ¬ AdmitsBiLipschitzEmbedding S k := by
  sorry
```

3. **口径逐字对齐**：挑战文件里的三个定义（`RealL2`、`DoublingAtMost`、`AdmitsBiLipschitzEmbedding`）与求解侧 `Model.lean` 的同名定义**文本完全相同**（除空白），因此"解的是同一道题"没有定义层面的漂移空间。取证用的关键句：

```lean
abbrev RealL2 := lp (fun _ : ℕ => ℝ) 2

/-- Intrinsic open-ball doubling with a specified integer bound and centers in the subset. -/
def DoublingAtMost (S : Set RealL2) (bound : ℕ) : Prop :=
  ∀ x : S, ∀ r : ℝ, 0 < r →
    ∃ centers : Finset S, centers.card ≤ bound ∧
      ∀ y : S, dist y x < r → ∃ c ∈ centers, dist y c < r / 2

/-- Finite distortion includes an arbitrary positive change of scale. -/
def AdmitsBiLipschitzEmbedding (S : Set RealL2) (k : ℕ) : Prop :=
  ∃ f : S → EuclideanSpace ℝ (Fin k),
    ∃ a : ℝ, 0 < a ∧ ∃ D : ℝ, 1 ≤ D ∧
      ∀ x y : S, a * dist x y ≤ dist (f x) (f y) ∧
        dist (f x) (f y) ≤ D * a * dist x y
```

与论文 Definition 1.1/1.2 的对应关系（论文用"每个半径 $r$ 的球可被 $C$ 个半径 $r/2$ 的球覆盖"的开球版本、中心允许取在 $S$ 内；bi-Lipschitz 允许任意正尺度 $a$ 与 $D\ge 1$）是**逐字段**的：`Finset S` = 中心在子集内，`r / 2` = 半半径，`EuclideanSpace ℝ (Fin k)` = $\mathbb{R}^k$，`0 < a` = 论文里的 scale，`1 ≤ D` = distortion。[取证要点：论文正文里 doubling 常数写的是"覆盖 $B(x,r)$ 需要多少个 $B(y,r/2)$"，与 Lean 一致；而数学界更常见的等价定义用闭包或任意中心——选择"intrinsic + open ball + 中心在 $S$ 的 `Finset`"是为了让 76800 这个整数是**可验证的上界**，不需要任何紧致性闭包论证]

## 4.2 模块清单与依赖图

`ls E:\math\lean\OAI\Geometry\DoublingHilbert` 共 28 个文件（行数取自各文件实际行数，`import` 关系取自全目录 `^import` 扫描）。命名规律：主线（Hilbert 反例）模块与支线（Banach 推论）模块混放同一目录，但 import 方向几乎单向——支线文件 import `Main`，只为复用 `RealL2`/`constructedSet` 等符号。

| 文件 | 行数 | 直接依赖（本目录内） | 一句话角色 |
|---|---|---|---|
| `Model.lean` | 24 | — | 题目口径三定义（与挑战文件逐字同） |
| `Construction.lean` | 435 | `Model` | 集合 $S$、尺度 $r_j$、颜色/宽度编码、strip 条件、距离比较引理 |
| `Doubling.lean` | 287 | `Construction` | `DoublingAtMost S 76800`（prop:doubling）+ 紧致 packing 界 |
| `Integration.lean` | 260 | `Derivatives` | 向量值 FTC、逐线积分、$L^2$ 振荡控制、`globalSheet` |
| `Derivatives.lean` | 235 | `Construction` | Rademacher/Lebesgue 好点、`derivativeCompact` |
| `Rectangles.lean` | 489 | `Integration` | `Segment`/`Rectangle` 概率律、`IsBoundedField`、修剪因子 4、好点矩形 |
| `Grids.lean` | 340 | `Rectangles` | `stripColor` 可测选择器、细层存在、周期网格裁剪、sheet 偏移/分离 |
| `SelectedSheets.lean` | 405 | `Grids` | `stripWidth`/`xPeriod`/`yPeriod`、`PeriodGrid`、逐 strip 选择与均值界 |
| `Extremal.lean` | 177 | — | 字典序极值、仿射屏障、方差恒等式（lem:compact 的定量替代） |
| `Energy.lean` | 368 | `SelectedSheets`,`Extremal` | prop:energy 的定量版 + `exists_small_energy_grid` |
| `Crossings.lean` | 370 | `Energy` | 逐色选线、 crossings、`exists_separated_family`（最终 packing 装配） |
| `Main.lean` | 69 | `Crossings`,`Doubling` | `no_normalized_embedding`、`no_scaled_embedding`、`main` |
| `CompactModel.lean` | 21 | — | Banach 侧的 `DoublingAtMost`/`AdmitsBiLipschitzEmbedding`（抽象度量空间版本） |
| `IntrinsicCovers.lean` | 76 | `CompactModel` | intrinsic ↔ ambient doubling 等价、迭代覆盖 `ambient_iterated_cover` |
| `CoverTransfer.lean` | 68 | `IntrinsicCovers` | `intrinsic_doubling_of_distortion36`（失真 36 ⇒ 指数 8） |
| `ClusterScales.lean` | 98 | — | `clusterScale j = 2^{-(j+1)}`、101/100、97/200、`five_scales` |
| `ClusterPlacement.lean` | 67 | `FinitePlacement`,`CoverTransfer`,`Main` | `cluster_placement`：把有限 $S$ 子集放到无穷维球的簇里 |
| `ClusterCover.lean` | 135 | `IntrinsicCovers`,`CompactUnion`,`ClusterScales` | `ambient_doubling_clusters`（$1+5L^2$）、`compact_doubling_clusters` |
| `CompactUnion.lean` | 43 | — | $\{0\}\cup\bigcup_j C_j$ 的紧致性（开覆盖论证） |
| `Auerbach.lean` | 98 | — | `exists_auerbach_basis`（极大行列式）、`exists_auerbach_vectors`（**替代 Dvoretzky**） |
| `CoordinateSupport.lean` | 90 | `Main` | 有限子集的坐标支撑 `finite_coordinate_support` |
| `CoordinateMap.lean` | 58 | `CoordinateSupport`,`Main` | `coordinateMap`：单侧界 $|c_i|\le\|\sum c_j v_j\|$ 的线性化 |
| `SparseCoordinates.lean` | 102 | `Main` | `norm_map_point_sub_le`（$\le 6R$） |
| `FinitePlacement.lean` | 63 | `SparseCoordinates`,`CoordinateSupport`,`Auerbach`,`CoordinateMap`,`Main` | `finite_placement`：失真 $\le 6$ 的线性搬运 |
| `FiniteCompactness.lean` | 92 | — | `normalized_embedding_of_finite`（Tychonoff/FIP）、`finite_witness_of_no_embedding` |
| `FiniteWitness.lean` | 43 | `FiniteCompactness`,`Main` | `finite_witness`、`finite_witness_card`（$\ge 2$ 点） |
| `FiniteTargets.lean` | 57 | — | `euclidean_embedding_of_finite_dimensional`（任意有限维 $E\to\mathbb{R}^{\dim}$，$A=D\cdot U\cdot V$） |
| `CompactBanach.lean` | 94 | `CompactModel`,`FiniteWitness`,`Auerbach`,`ClusterPlacement`,`ClusterCover`,`FiniteTargets`,`Main` | cor:banach 主线，$\Lambda=1+5(76800^8)^2$ |

主线拓扑（从 `Main` 回溯）：

```
Main ← Crossings ← Energy ← SelectedSheets ← Grids ← Rectangles ← Integration ← Derivatives ← Construction ← Model
                Energy ← Extremal（无依赖，纯紧集/概率论证）
                Doubling ← Construction
Main ← Doubling
```

`Extremal.lean` 与 `ClusterScales.lean` 只 import `Mathlib`，是两处"自足的工具层"。[取证观察：依赖图是一条链加两个旁支，几乎没有菱形依赖——这种"线性长链"结构对应论文里严格的参数选择顺序（先 $D$、再紧集 $K$、再 $\varepsilon_n$、再 $n$），Lean 把它固化成 import 方向]

**docstring 密度的不对称**（逐文件 `grep -c '^[[:space:]]*/--'` 计数，只统计贴在定理前的单行 docstring；模块标题用的 `/-!` 另计，12 个主线文件各有 1 条、`Model.lean` 无）：主线 12 个文件共 **81** 条定理级 docstring——`Construction` 10、`Grids` 10、`Rectangles` 9、`Doubling` 8、`Integration` 8、`Derivatives` 7、`Extremal` 8、`Crossings` 8、`Energy` 5、`SelectedSheets` 3、`Main` 3、`Model` 2；而支线 16 个文件（`Auerbach`、`CompactBanach`、`ClusterCover`、`ClusterPlacement`、`ClusterScales`、`CompactModel`、`CompactUnion`、`FiniteCompactness`、`FinitePlacement`、`FiniteTargets`、`FiniteWitness`、`SparseCoordinates`、`IntrinsicCovers`、`CoordinateMap`、`CoordinateSupport`、`CoverTransfer`）的该计数全部为 **0**（同一 `grep` 对 16 个文件逐一执行，无一例外）。密度也不均匀：`SelectedSheets.lean` 有 405 行却只有 3 条注释，`Rectangles.lean` 489 行有 9 条。多条主线 docstring 是"方法论自述"而非命名说明，例如 Extremal 的第 5 条、Energy 的第 4 条（下文 4.3.9、4.3.10 逐字引用）。[推测：这说明形式化的"解释性投入"集中在论文叙述最吃紧的解析核心；Banach 侧被认为是"标准组合论证"，不需要边注]

## 4.3 主线逐模块取证

### 4.3.1 `Model.lean`：把论文的两个 Definition 变成可计算口径

见 4.1 的逐字引用。取证要点：`bound : ℕ` 是自然数而不是实数，`Finset S` 要求中心是**有限证书**，`r / 2` 而非 $r/3$——这三条合起来意味着"76800"必须是一个**具体可数的整数**，不是渐近常数。论文里"存在常数 $C$ 使得……"的写法在这里被强制量化为"card ≤ 76800"。这正是后文 `Doubling.lean` 全部工作的动机：把覆盖数算出来。

### 4.3.2 `Construction.lean`：集合、尺度与 (N_j,W_j) 的编码

```lean
abbrev Base := ℝ × ℝ
abbrev Tuple := ℕ →₀ ℕ            -- 有限支撑的 ℕ 值函数 = 论文的有限支撑 tuple w

def scale (j : ℕ) : ℝ := (1000 : ℝ)⁻¹ ^ (j + 1)
def colors (j : ℕ) : ℕ := (Nat.unpair (Nat.unpair j).1).1 + 1
def widthFactor (j : ℕ) : ℕ := (Nat.unpair (Nat.unpair j).1).2 + 1

theorem recurrent_parameters (N W J : ℕ) (hN : 0 < N) (hW : 0 < W) :
    ∃ j ≥ J, colors j = N ∧ widthFactor j = W := by
  refine ⟨Nat.pair (Nat.pair (N - 1) (W - 1)) J, Nat.right_le_pair _ _, ?_⟩
  simp only [colors, widthFactor, Nat.unpair_pair]
  omega

def inColoredStrip (width : ℝ) (N i : ℕ) (t : ℝ) : Prop :=
  ∃ q : ℤ, q % (N : ℤ) = (i : ℤ) ∧ (q : ℝ) * width < t ∧ t < ((q : ℝ) + 1) * width

def allowed (j i : ℕ) (p : Base) : Prop :=
  inColoredStrip (scale j) (colors j) i p.2 ∨
    inColoredStrip ((widthFactor j : ℝ) * scale j) (colors j) i p.1

def admissible (p : Base) (w : Tuple) : Prop :=
  ∀ j ∈ w.support, w j ≤ colors j ∧ allowed j (w j - 1) p

def sheetDomain (w : Tuple) : Set Base := {p | admissible p w}
def coordinate (j i : ℕ) : ℕ := 2 + Nat.pair j i
noncomputable def levelVector (j i : ℕ) : RealL2 := lp.single 2 (coordinate j i) (scale j)
noncomputable def tupleVector (w : Tuple) : RealL2 := ∑ j ∈ w.support, levelVector j (w j - 1)
noncomputable def baseVector (p : Base) : RealL2 := lp.single 2 0 p.1 + lp.single 2 1 p.2
noncomputable def point (p : Base) (w : Tuple) : RealL2 := baseVector p + tupleVector w
def constructedSet : Set RealL2 := {z | ∃ p w, admissible p w ∧ z = point p w}
```

逐条与论文对齐的取证结果：

- $r_j = 1000^{-j}$：Lean 用 `scale j = 1000⁻¹^(j+1)`，指数是 $j+1$（docstring 明说"The scale at index `j` has exponent `j + 1`"），即 Lean 的下标比论文整体平移一格。配套 `scale_succ : scale (j+1) = scale j / 1000`、`scale_antitone`、`scale_tendsto_zero`。**论文未述**这个平移；它纯粹是为了让 `scale 0 < 1`，从而省去后续所有 $j\ge 1$ 的边界判断。[取证：`nearbyStripIndices` 里 `ht : t / 64 < width` 之类的假设不依赖 $j$ 从 0 还是 1 起，但 `exists_fine_level` 需要 `w.support.sup id` 之外还有余量，平移一格让 `max J (sup+1)` 的 omega 更短]
- $(N_j,W_j)$ 序列：论文写"取一个无穷 Often 遍历所有 $(N,W)$ 的正整数对的序列"。Lean 把它换成**双 `Nat.unpair`**：$j\mapsto((N,W),J)$ 三参数编码，`colors` 与 `widthFactor` 各取一次 unpair 的两个分量加 1，第三分量 $J$ 作为下界条件。于是 `recurrent_parameters` 的证明就是 `Nat.unpair_pair` + `omega`，零分析内容。**这是形式化对论文的第一处实质改写**：论文的"序列选取"是存在性叙述，Lean 给了显式可计算的双射，代价是 `colors j`/`widthFactor j` 变成不可读的复合函数，好处是所有"层指标足够大"的论证（`exists_fine_level` 用 `eventually_atTop` + `max J (support.sup id + 1)`）都不需要再提"无穷Often"。
- $U_{j,i}=H_{j,i}\cup V_{j,i}$：Lean 的 `allowed j i p` 正是"纵坐标落在宽 $r_j$ 的第 $i$ 号竖条"或"横坐标落在宽 $W_j r_j$ 的第 $i$ 号横条"。**注意 `Base` 的范数是 Mathlib 默认的 $L^\infty$（`Prod.norm_def` 给 $\max$）**，而条带宽度分配在两个不同方向上（$r_j$ vs $W_j r_j$）——这就是论文各向异性在类型层面的落点。
- `admissible`：`w j ≤ colors j ∧ allowed j (w j - 1) p`，配合 docstring"Value zero means no displacement; a nonzero tuple entry `i+1` means color `i`"。即 Lean 用**偏移一位的 ℕ 编码**把论文的"$w_j\in\{0,r_je_{j,i}\}$ 当且仅当 $p\in U_{j,i}$"翻译成 `w j = 0` 与 `w j - 1 = i` 的二择，避免了在 `ℕ` 上加一个 $\bot$ 元素。这解释了下文所有 `w.update j (i + 1)` 与 `levelVector j (w j - 1)` 的 $+1/-1$ 噪声。
- `coordinate j i = 2 + Nat.pair j i`：$S$ 的 Hilbert 坐标索引从 2 开始，0/1 留给基点 $(x,y)$；`Nat.pair` 保证 $(j,i)$ 块彼此正交，是论文 $\mathcal{H}=\mathbb{R}^2\oplus\bigoplus_j\mathbb{R}^{N_j}$ 的直接实现。
- 三个距离比较引理（论文以"显然"处理，Lean 必须逐条证明）：
  - `point_dist_sameTuple_le (p q w) : dist (point p w) (point q w) ≤ 2 * dist p q`，证明链是 `point_dist_sameTuple_sq` + `|p.1-q.1| ≤ dist p q` + `|p.2-q.2| ≤ dist p q` + `nlinarith`。**因子 2 的机械来源**：左边是 $\sqrt{\Delta x^2+\Delta y^2}$，右边是 $\max(|\Delta x|,|\Delta y|)$，真实比值是 $\sqrt2$，Lean 写成 $2$（`nlinarith` 只需 $|\Delta x|^2+|\Delta y|^2\le 2\,\mathrm{dist}^2$）。**全篇所有 $2D$、$(2D)^2=4D^2$ 都源自这次 $\sqrt2\to 2$ 的上取整**，见 4.6 的第七项分歧。
  - `scale_le_dist`（docstring "Every individual level distance is no larger than the whole source distance"，行 311）与 `distinct_levels_separated`（docstring "Distinct choices at one level are at least one scale apart"，行 282）：分别是论文的 $r_j\le d_S$ 与 $|w_j-w'_j|=\text{不同颜色}\Rightarrow d_S\ge r_j$。
  - `sum_scale_sq_le : (∀ j ∈ s, scale j ≤ R) → ∑ j ∈ s, (scale j)^2 ≤ 2 * R^2`，docstring 自称"**deliberately coarse** geometric-tail bound, adequate for the covering constant"。证明用 $1000^{-2}$ 作为公比的几何级数（`summable_geometric_of_abs_lt_one (r := 1000000⁻¹)`，注意 scale 平方后公比是 $10^{-6}$），得到 $(1-10^{-6})^{-1}\le 2$。**这是"1000 为什么不能改小"的形式化侧证**：Lean 只需 $(1000^2)/(1000^2-1)<2$，即任何 $>1$ 的基数都可行；1000 是论文给的，形式化只是享受它的松弛。
  - `fine_tail_le (w w' s) (hs : ∀ j ∈ s, scale j ≤ t/64) : ∑ j ∈ s, ‖entryVector w j - entryVector w' j‖^2 ≤ ...`（docstring "A uniform squared-distance bound for the finite-coordinate fine tail"），配合 `point_dist_lt_half`（见 4.3.3）构成 76800 的几何内核。

### 4.3.3 `Doubling.lean`：把 prop:doubling 变成一次算术

Lean 里 prop:doubling 的证明拆成六个可复用部件，论文只给了一句"数一下条带"。

```lean
def nearbyStripIndices (c width : ℝ) : Finset ℤ :=
  Finset.Icc (⌊c / width⌋ - 65) (⌊c / width⌋ + 65)

theorem nearbyStripIndices_card (c width : ℝ) : (nearbyStripIndices c width).card = 131 := ...
/-- 成员条件：hw : 0 < width, ht : t / 64 < width, hx : |x - c| < t, q*width < x < (q+1)*width ⊢ q ∈ nearbyStripIndices c width -/

def coordinateCell (c t x : ℝ) : ℤ := ⌊8 * (x - (c - t)) / t⌋
theorem coordinateCell_mem (ht : 0 < t) (hx : |x - c| < t) : coordinateCell c t x ∈ Finset.Ico (0 : ℤ) 16
theorem abs_sub_lt_of_coordinateCell_eq (ht : 0 < t) (h : coordinateCell c t x = coordinateCell c t y) :
    |x - y| < t / 8

def nearbyLabels (c : Base) (j : ℕ) : Finset ℕ :=
  insert 0 ((nearbyStripIndices c.2 (scale j)).image (...) ∪
            (nearbyStripIndices c.1 ((widthFactor j : ℝ) * scale j)).image (...))
theorem nearbyLabels_card (c : Base) (j : ℕ) : (nearbyLabels c j).card ≤ 300
```

- docstring "A uniform finite set of strips meeting an interval shorter than 128 strip widths" 给出 $\pm65$ 的来历：半径 $t$ 的球在一条坐标轴上的投影是长度 $2t$ 的区间，而条件 $t/64<\text{width}$ 使 $2t<128\,\text{width}$，故该区间最多触及 $128+1=129$ 个条带；Lean 取 $\pm65$ 即 $131$ 个，多出 2 的松弛纯粹为了让 `omega` 一行通过（`Int.card_Icc` + `omega`）。**改动敏感度**：把 65 改成 64 会卡在 $q=\lfloor c/\text{width}\rfloor-65$ 那个方向的 `nlinarith`（floor 的两端不等式 `Int.floor_le`/`Int.lt_floor_add_one` 各留 1 的余量，正好用完），所以 131 这个数**不是**松弛随意，而是 64→"128 条带"+3 的产物；而 64 本身又是下面 t/2 结论里 $\sqrt{17/512}\approx0.18\ll0.5$ 的巨大松弛的一部分。
- `nearbyLabels_card ≤ 300` 的证明是 `card_insert_le` + `card_union_le` + 两次 `card_image_le` + `omega`：$1+131+131=263\le 300$。**300 是论文正文里的数（[论文核对：正文只写"至多 300 种标签"]），Lean 复现了同一个不精确上界**，因为它下游只用到 `labels.card ≤ 300` 这一条假设。
- `coordinateCell`：把 $[c-t,\,c+t)$ 均分 16 个宽 $t/8$ 的格子（`Finset.Ico 0 16`），同格 ⇒ $|x-y|<t/8$。docstring "Sixteen cells of width `t/8` cover the coordinate projection of a radius-`t` ball"。注意是**半开区间 Ico**，所以 `coordinateCell_mem` 用 `h₀ : 0 ≤ ...` 与 `h₁ : ... < 16` 两端 `linarith`；若改成 `Icc 0 15` 会卡在 $x=c+t$ 时 floor 取到 16。
- `cover_of_finite_code`（docstring "A finite coding with fibers of small diameter supplies intrinsic covering centers"）是纯组合引理：给定 `code : s → I` 且同码 ⇒ 距离 $<r$，则存在 `card ≤ Fintype.card I` 的 `Finset X`（**中心取自 s**：`representative` 用 `Classical.choose` 从每个非空纤维里挑一个代表）。这是把"码集大小=覆盖数"的直觉变成 `Classical.choice` 的一次调用，`permitted_axioms` 里 `Classical.choice` 的用途之一就在这里。
- `source_cover_of_label` 是 76800 的组装点：

```lean
theorem source_cover_of_label (x : constructedSet) {t : ℝ} (ht : 0 < t)
    (labels : Finset ℕ) (hcard : labels.card ≤ 300)
    (label : Metric.ball x t → {i // i ∈ labels})
    (hlabel : ∀ y z : Metric.ball x t, label y = label z →
      ∀ j, t / 64 < scale j → sourceTuple y.val j = sourceTuple z.val j) :
    ∃ centers : Finset constructedSet, centers.card ≤ 76800 ∧
      ∀ y : constructedSet, dist y x < t → ∃ c ∈ centers, dist y c < t / 2
```

证明内部：`cells := Finset.Ico 0 16`，`code y := (key₁ y, key₂ y, label y)`，于是 `Fintype.card` 是 $16\cdot16\cdot 300 = 76800$，再对每条同码纤维用 `point_dist_lt_half`：

```lean
theorem point_dist_lt_half {p q : Base} {w w' : Tuple} {t : ℝ} (ht : 0 < t)
    (hx : |p.1 - q.1| < t / 8) (hy : |p.2 - q.2| < t / 8)
    (hlarge : ∀ j, t / 64 < scale j → w j = w' j) :
    dist (point p w) (point q w') < t / 2
```

其证明给出精确算术：把 $s=w.\mathrm{support}\cup w'.\mathrm{support}$ 按 `scale j ≤ t/64` 分成 `small`，`hlarge` 把 `small` 之外的纤维全部清零（`simp [entryVector, hlarge j hgt]`），剩下 `fine_tail_le`。合成的不等式形状是 $\mathrm{dist}^2 < (t/8)^2+(t/8)^2+C\,(t/64)^2$，即约 $0.0333\,t^2 < 0.25\,t^2$。**结论：$t/64$ 与 $t/8$ 之间的 8 倍余量是刻意的**——76800 距最优值有数量级松弛，与论文"常数无任何优化意图"的自述吻合（见三节引文）。
- `constructedSet_cover` 的控制流值得单独取证，它复刻了论文 prop:doubling 的 case split：

```lean
  by_cases hmid : ∃ j, t / 64 < scale j ∧ scale j ≤ t
  · obtain ⟨m, hm⟩ := hmid
    apply source_cover_of_label x ht (nearbyLabels (sourceBase x) m) (nearbyLabels_card _ _)
      (fun y => ⟨sourceTuple y.val m, admissible_mem_nearbyLabels ... ⟩)
    intro y z hyz j hj
    by_cases hjt : scale j ≤ t
    · have heq := intermediate_unique ⟨hj, hjt⟩ hm; subst j; exact congrArg Subtype.val hyz
    · exact (sourceTuple_coarse_eq y.prop (le_of_not_ge hjt)).trans
        (sourceTuple_coarse_eq z.prop (le_of_not_ge hjt)).symm
  · apply source_cover_of_label x ht {0} (by simp) (fun _ => ⟨0, by simp⟩)
```

三个分支对应论文的三句话：(i) 存在"中间尺度" $m$（$t/64<r_m\le t$）时，用 $m$ 层的 tuple 值当标签，标签集是 `nearbyLabels`，基数 300；(ii) 比 $m$ 更粗的层（$t\le$ scale $j$）在半径 $t$ 球内**不可能变化**（`sourceTuple_coarse_eq`，其证明是 `coarse_coordinate_eq`：若 $w_j\ne w'_j$ 则 $\mathrm{dist}\ge r_j\ge t$，矛盾）——这是论文的"粗层在球内被冻结"；(iii) 中间层唯一（`intermediate_unique`，靠 `scale` 严格递减，$r_m\le t<64 r_m$ 内至多一个 $j$ 满足 $t/64<r_j\le t$，因为 $1000>64$）；(iv) 不存在中间尺度时标签集退化为单点 `{0}`，即所有层的 tuple 都被冻结。[取证：`intermediate_unique` 的算术核心正是 $1000>64$；若把 `scale` 的底数改成 $<64$，`by_cases hmid` 分支里可能同时存在两个中间层，标签编码会漏掉一层 ⇒ 76800 失效。这是 **1000 这一常数在 Lean 里唯一真正被"用掉"的地方**（另一次是 `sum_scale_sq_le` 的 $10^{-6}$，那里只要求 $>1$）]
- `isCompact_exists_packing_bound`（docstring "Compact metric sets admit a finite upper bound for any fixed positive separation"）：紧集 + 正分离 $r$ ⇒ 存在 `bound : ℕ` 使任何 $r$-分离族基数 $\le$ bound。证明用 `hs.finite_cover_balls (0 < r/2)` 取有限子覆盖，把 $t$ 做成 `Fintype`，再用"每球至多一个分离点"构造 `Function.Injective c`。**这个引理是论文里"$\mathbb{R}^k$ 中体积比较 $N\le(1+2D)^k$"的 Lean 替身**——见 4.6 第二项分歧。

### 4.3.4 `Derivatives.lean`：好点、$K$ 与 2 因子

```lean
def sheetColumn (f : ℝ × ℝ → E) (Ω : Set (ℝ × ℝ)) (v : ℝ × ℝ) : ℝ × ℝ → E :=
  Ω.indicator (fun p => fderiv ℝ f p v)

theorem norm_sheetColumn_le (hΩ : IsOpen Ω) (hf : LipschitzOnWith C f Ω) (v p) :
    ‖sheetColumn f Ω v p‖ ≤ C * ‖v‖

def embeddingSheet (f : constructedSet → E) (w : Tuple) (p : Base) : E := by
  classical
  exact if h : admissible p w then f ⟨point p w, point_mem p w h⟩ else 0

theorem embeddingSheet_lipschitz (hf : LipschitzWith D f) (w : Tuple) :
    LipschitzOnWith (2 * D) (embeddingSheet f w) (sheetDomain w)

def goodSheetPoint (f) (w) (p) : Prop :=
  p ∈ sheetDomain w ∧ DifferentiableAt ℝ (embeddingSheet f w) p ∧
    Tendsto (fun r => ⨍ q in Metric.closedBall p r,
      ‖sheetColumn (embeddingSheet f w) (sheetDomain w) (1, 0) q -
        sheetColumn (embeddingSheet f w) (sheetDomain w) (1, 0) p‖ ^ 2) (𝓝[>] 0) (𝓝 0) ∧
    Tendsto (... (0, 1) ...) (𝓝[>] 0) (𝓝 0)

theorem ae_good_embeddingSheet (hf : LipschitzWith D f) (w : Tuple) :
    ∀ᵐ p, p ∈ sheetDomain w → goodSheetPoint f w p

def derivativePair (f) (w) (p) : ℝ × ℝ :=
  (‖sheetColumn (embeddingSheet f w) (sheetDomain w) (1, 0) p‖ ^ 2,
   ‖sheetColumn (embeddingSheet f w) (sheetDomain w) (0, 1) p‖ ^ 2)
def derivativeData (f) : Set (ℝ × ℝ) := {z | ∃ w p, goodSheetPoint f w p ∧ derivativePair f w p = z}
def derivativeCompact (f) : Set (ℝ × ℝ) := closure (derivativeData f)

theorem derivativePair_bounds (hf : LipschitzWith D f) :
    derivativePair f w p ∈ Icc (0, 0) ((2 * (D : ℝ)) ^ 2, (2 * (D : ℝ)) ^ 2)
theorem isCompact_derivativeCompact (hf) : IsCompact (derivativeCompact f) :=
  isCompact_Icc.of_isClosed_subset isClosed_closure (derivativeCompact_subset hf)
theorem derivativeData_nonempty (hf) : (derivativeData f).Nonempty := by
  obtain ⟨p, hp⟩ := (ae_good_embeddingSheet hf 0).exists
  exact ⟨derivativePair f 0 p, 0, p, hp (admissible_zero p), rfl⟩
```

取证要点：

- 论文的 $F_w$ 是"$f$ 与第 $w$ 个 sheet 的复合"，Lean 的 `embeddingSheet f w` 用 `if h : admissible p w then ... else 0` **把它定义在整个平面上**（域外填 0）。这不是语义变化（论文只在 $\Omega_w$ 内用 $F_w$），但它是 Lean 的必需：`fderiv ℝ` 要求函数在全空间有定义。配套 docstring："A sheet is the actual embedding on its domain; the arbitrary outside value is zero."
- `sheetColumn = Ω.indicator (fderiv ℝ f · v)`：用 `IsOpen Ω` 的 indicator 把域外导数强制记为 0，`norm_sheetColumn_le` 分 `by_cases hp : p ∈ Ω` 两支，域内用 `norm_fderiv_le_of_lipschitzOn`（需要 `hΩ.mem_nhds hp` 把 `LipschitzOnWith` 升成局部 Lipschitz），域外 `norm_zero` + `positivity`。这是论文里"$\|DF\|\le$ Lip 常数"的一句"显然"的完整展开。
- `goodSheetPoint` 的四条 = 论文 (eq:good) 的"$F_x,F_y$ 的 Lebesgue 点 + Rademacher 可微 + 在域内"。注意 Lean 用的是 **$L^2$ 平均**（`⨍ ‖·-·‖^2 → 0`）而不是论文的 $L^1$ 平均——升级靠有界性：`Derivatives` 里先 `ae_tendsto_average_norm_sub`（Mathlib 的 `IsUnifLocDoublingMeasure.ae_tendsto_average_norm`，$L^1$ 版本），再用 `IsBoundedField` 的界把 $L^1$ 提到 $L^2$。[取证：这正是"论文用一句话、Lean 用一次测度论基础设施调用"的典型位置；`IsUnifLocDoublingMeasure` 是 Mathlib 对 Lebesgue 微分定理的 doubling 抽象，与本题的 doubling 主题形成有趣的自指]
- `derivativeCompact` 与论文 $K$ 的定义一致（论文：$K=\overline{\{(\|D_xF_w\|^2,\|D_yF_w\|^2): \text{good points}, w\}}$），非空性由"零 tuple 的 sheet 有全测度好点"给出（`(ae_good_embeddingSheet hf 0).exists` + `admissible_zero`）——这一步论文**未述**：论文只说"紧集 $K$ 非空"，没解释为何非空；Lean 必须给出具体的 $w=0$。[取证：这是"论文未述"清单可新增一条]
- $K\subseteq[0,(2D)^2]^2$：论文里应是 $[0,D^2]^2$（用 Euclidean 基度量），Lean 因 $L^\infty$ 基度量 + $\sqrt2\to2$ 变成 $(2D)^2=4D^2$。见 4.6 第七项。
- `exists_lipschitz_extension_finiteDimensional`（docstring："Finite-dimensional Lipschitz sheet maps have some global Lipschitz extension. Only agreement on the original open domain is used for sharp derivative estimates."）：把 `LipschitzOnWith C f s` 扩成全空间 `LipschitzWith L g`（`∃ L` 而不指定值）。证明用了 `toEuclidean` + `extend_pi`（把有限维目标视作 $\mathbb{R}^n$，逐坐标用 `LipschitzWith` 的标量扩张 `extend_pi`）。**论文未述**这一步——论文的 $F_w$ 只在 $\Omega_w$ 上被微分，从不扩张；Lean 扩张是为了让 `column`（逐线限制）在整条线上有 `intervalIntegral` 可用。扩张会损失 Lipschitz 常数（`∃ L` 可能远大于 $C$），但所有下游估计只用到 `globalSheet_lipschitz` 返回的存在性 $C$，且真正"sharp"的导数估计靠 `globalSheet_eqOn`（在 `sheetDomain` 上与 $F$ 相等）把导数换回 $F$ 的导数，于是损失不进入常数。docstring 最后一句就是在声明这个"只取域上相等"的设计决定。

### 4.3.5 `Integration.lean`：把论文的四行"线积分常识"拆成 20 条引理

`Integration` 的 section 划分本身就在复刻论文的论证顺序：`VectorFTC` → `MeanSquares` → `PartialIntegration` → `Extensions`。核心四条：

```lean
/-- Vector-valued FTC for a Lipschitz curve with its a.e. derivative specified.
This is the scalar absolutely-continuous FTC tested against the continuous dual. -/
theorem integral_eq_sub_of_lipschitz_ae_derivative
    {f g : ℝ → E} {a b : ℝ} {C : NNReal}
    (hf : LipschitzOnWith C f (uIcc a b)) (hg : IntervalIntegrable g volume a b)
    (hderiv : ∀ᵐ x, x ∈ uIcc a b → HasDerivAt f (g x) x) :
    ∫ x in a..b, g x = f b - f a

/-- Hilbert-space Cauchy--Schwarz in the form needed for line transport;
in fact convexity makes this valid for every normed target. -/
theorem norm_average_sq_le_average_norm_sq [IsFiniteMeasure μ] [NeZero μ]
    {G : X → E} (hG : Integrable G μ) (hG2 : Integrable (fun x => ‖G x‖ ^ 2) μ) :
    ‖⨍ x, G x ∂μ‖ ^ 2 ≤ ⨍ x, ‖G x‖ ^ 2 ∂μ

/-- Squared oscillation of a Lipschitz curve is bounded by its derivative energy. -/
theorem curve_oscillation_sq_le_integral (hab : a ≤ b)
    (hf : LipschitzOnWith C f (uIcc a b)) (hg ...) (hg2 ...)
    (hderiv : ∀ᵐ x, x ∈ uIcc a b → HasDerivAt f (g x) x) :
    ‖f b - f a‖ ^ 2 ≤ (b - a) * (∫ x in a..b, ‖g x‖ ^ 2)

/-- Fubini plus the vector FTC controls every subinterval on almost every horizontal line. -/
theorem ae_integral_column_x (hf : LipschitzWith C f) :
    ∀ᵐ y, ∀ a b : ℝ, (∫ x in a..b, column f (1, 0) (x, y)) = f (b, y) - f (a, y)
```

三条取证结论：

1. **Cauchy–Schwarz 在证明里其实不是 Cauchy–Schwarz。** docstring 自己承认："in fact convexity makes this valid for **every normed target**"，证明是 `convexOn_norm ... |>.pow ... |>.map_average_le`，即范数的凸性 + Jensen（`ConvexOn.map_average_le`）。⇒ Hilbert 结构在这条链上的唯一用处是 `Construction` 里的正交/Pythagoras（`norm_levelVector_sub_sq`、`point_dist_sameTuple_sq`）。这条 Lean 注释比论文更诚实地标出了"$L^2$ 目标空间"与"$E$ 为 Hilbert"的真实分工。[与论文叙述的一致性检查：论文在 line-integral 段落写的是"$L^2$ 平均的 Cauchy–Schwarz"，未指出凸性即可——形式化反过来指出了这一点，笔记可引]
2. `curve_oscillation_sq_le_integral` 的输出形状 $(b-a)\int\|g\|^2$ 是论文"$\sup$ 振荡 $\le$ 长度 $\times$ 能量"的不等式来源，但注意 Lean 版本还多一个更强的逐点全区间控制：`Grids.lean` 的 `oscillation_sq_le_segment_energy`（docstring "An FTC identity on all subintervals controls all points of a line, not just a.e. points"）给出

```lean
theorem oscillation_sq_le_segment_energy (I : Segment) {f g : ℝ → E}
    (hg : IsBoundedField g)
    (hFTC : ∀ a b, (∫ x in a..b, g x) = f b - f a)
    {a b : ℝ} (ha : a ∈ Icc I.lo I.hi) (hb : b ∈ Icc I.lo I.hi) :
    ‖f b - f a‖ ^ 2 ≤ I.length ^ 2 * (∫ x, ‖g x‖ ^ 2 ∂I.law)
```

`I.length ^ 2` 而不是 `I.length`：因为右边是**平均值**（`I.law` 是概率测度），所以是 $|I|\cdot\overline{\|g\|^2}\cdot|I| = |I|^2\overline{\|g\|^2}$。这条与论文的"$h_i=(F_i-F)/r$ 在 crossings 处一致"的论证对应；关键差别是 `hFTC` 的量化形式是 `∀ a b`（全区间逐点），这正是论文里"由连续性从内部推到端点"那一步的 Lean 表达，配套引理 `norm_le_on_Icc_of_Ioo`（docstring "Endpoint bounds on an open real interval extend to its endpoints by continuity"）。
3. `globalSheet hf w := (exists_lipschitz_extension_finiteDimensional ...).choose`：用 `Classical.choice` 的 `.choose` 把存在量词"钉"成一个具体函数，从而使 `addedSheet`/`horizontalColumn` 这些下游定义是**函数**而非关系。这是 `permitted_axioms` 中 `Classical.choice` 的第二处实质用途（第一处是 `sourceBase`/`sourceTuple` 的 `Classical.choose` 与 `cover_of_finite_code` 的代表选取）。

### 4.3.6 `Rectangles.lean`：全篇最大的文件（489 行），却是"脚手架"

这个文件没有任何论文对应物——它是为了把论文里"取一个合适的矩形/取一条合适的线"这句概率式话语变成可执行操作而建的测度论基础设施。

```lean
/-- Uniform probability on a nondegenerate real interval. -/
def law (I : Segment) : Measure ℝ := (ENNReal.ofReal I.length)⁻¹ • volume.restrict (Ioc I.lo I.hi)
instance (I : Segment) : IsProbabilityMeasure I.law

/-- Globally bounded strongly measurable fields; all derivative selections below have this property. -/
def IsBoundedField (g : X → E) : Prop := StronglyMeasurable g ∧ ∃ M : ℝ, ∀ x, ‖g x‖ ≤ M
```

- `law` 用 `Ioc`（左闭右开）而不是 `Icc`：这样 `volume (Ioc lo hi) = length` 直接成立（`Real.volume_Ioc`），实例 `IsProbabilityMeasure` 的证明是 5 行 `simp` + `ENNReal.inv_mul_cancel`。同时 `ae_mem : ∀ᵐ x ∂I.law, x ∈ Ioo I.lo I.hi` 把端点 null 集一次性处理干净（`volume.ae_ne I.hi`）。[取证：这是论文"边界条带可忽略"那句话的机器化；论文只说"ignoring boundaries"，Lean 需要选一个具体的可测代表集]
- `IsBoundedField` 是一个自定义的"局部类"而非 Mathlib 的 `Bounded`：它有 `.add`、`.sub`、`.const`、`.norm_sq`、`.comp_measurable`、`.select`（逐片可测选择）、`.integral_fst/.integral_snd` 等闭包性引理。存在的唯一理由是把"$L^1$ 平均收敛升级到 $L^2$ 平均收敛"以及"Fubini 后仍可用"两件事做成可自动拼接的接口。`IsBoundedField.select`（docstring "First-moment sampling avoiding every specified null exceptional set" 所在段）是"逐片按可测指标选函数"的封闭性，`horizontalColumn`/`verticalColumn` 的可测性全靠它。
- 一阶矩抽样原理（**论文"取一条好线"的机器替身**）：

```lean
theorem exists_good_le_integral [IsProbabilityMeasure μ] {g : X → ℝ} (hg : Integrable g μ)
    {P : X → Prop} (hP : ∀ᵐ x ∂μ, P x) :
    ∃ x, P x ∧ g x ≤ ∫ y, g y ∂μ
```

证明是 `exists_notMem_null_le_integral`（一阶矩：非负可积函数的某点值不超过其积分）+ 避开给定 null 集。它的有限维兄弟是 `exists_le_finite_mean`（`∃ i, v i ≤ n⁻¹ * ∑ j, v j`，证明是 `by_contra!` + `Finset.sum_lt_sum_of_nonempty`）。**这两个引理合起来就是论文里所有"由平均值控制，故存在一个不超过平均值的对象"的实例**，包括 `exists_small_energy_block` 里"有限平均选一个完整周期"那一步。
- 修剪因子 4（对应论文的"trim 到半长"）：

```lean
theorem integral_le_four_of_subset (P Q : Rectangle) {g : Base → ℝ}
    (hg : IsBoundedField g) (hpos : ∀ p, 0 ≤ g p) (hsub : Q.closed ⊆ P.closed)
    (hx : P.x.length / 2 ≤ Q.x.length) (hy : P.y.length / 2 ≤ Q.y.length) :
    (∫ p, g p ∂Q.law) ≤ 4 * (∫ p, g p ∂P.law)
```

机械理由：两边都是**平均**，$\overline{g}_Q\le \frac{1}{|Q|}\int_P g = \frac{|P|}{|Q|}\overline g_P$，而 $|P|/|Q|\le 2\cdot2=4$。证明里 `ha : P.area ≤ 4 * Q.area` 由 `mul_le_mul hx hy` 得到，正是这个面积比。**4 是"每维各损失 2"的平方**，不是优化值；若论文在某处只沿一维修剪，Lean 里就应出现 2 而不是 4——实际出现的是 4，说明形式化两侧都做了半长修剪，这与 `exists_grid_inside` 的 `I.length / 2 ≤ ...` 输出配套（见 4.3.7）。
- `goodSheetPoint_exists_rectangle`：把 `goodSheetPoint` 的"球平均 $\to0$"转成"存在一个**矩形** $Q$，$Q\subseteq\Omega_w$ 且两个方向的 $\int\|\text{column}-\text{导数值}\|^2<\varepsilon$"。这是论文 (eq:good) 之后那句"故可选一个小矩形使其上平均任意接近好点值"的 Lean 版本。实现方式：`eventually_closedBall_subset (isOpen_sheetDomain w).mem_nhds` 保证小球在域内，然后把 $\ell^2$ 球用轴平行矩形包住（`square_closed`）。
- `Rectangle.exists_column_integral_le / exists_row_integral_le` 与 `integral_column_le_mul_grid / integral_row_le_mul_grid`（docstring "Exact finite averaging over adjacent equal cells" / "Exact integration by columns" / "Exact integration by rows"）：给出"网格矩形上的平均 $\ge$ 某列/某行的平均除以 $n$"，以及"单列平均 $\le n\times$ 整网格平均"。`Crossings.lean` 里的 `ColorBlock.column_energy_le` 正是 `integral_column_le_mul_grid` 的转发（乘数 `colors j`）。

### 4.3.7 `Grids.lean`：颜色选择器与 crossings 的两条几何引理

```lean
/-- The measurable periodic selector; boundary values play no role. -/
def stripColor (N : ℕ) (hN : 0 < N) (h t : ℝ) : Fin N :=
  ⟨Int.toNat (⌊t / h⌋ % (N : ℤ)), ...⟩

theorem measurable_stripColor (N : ℕ) (hN : 0 < N) (h : ℝ) : Measurable (stripColor N hN h) := by
  ... exact (measurable_of_countable c).comp (Int.measurable_floor.comp (measurable_id.div_const h))

/-- Each color appears exactly once in a complete period block. -/
theorem color_in_block (N : ℕ) (hN : 0 < N) {h t : ℝ} (hh : 0 < h) (b : ℤ) (i : Fin N)
    (ht : t ∈ Ioo (((b : ℝ) * N + i) * h) (((b : ℝ) * N + i + 1) * h)) :
    stripColor N hN h t = i ∧ inColoredStrip h N i t

/-- Trim an interval to full grid periods, losing at most two periods. -/
theorem exists_grid_inside (I : Segment) {h : ℝ} (hh : 0 < h) (hsmall : h < I.length / 4) :
    ∃ (a : ℤ) (n : ℕ) (hn : 0 < n),
      I.lo ≤ (grid (a * h) h n hh hn).lo ∧ (grid (a * h) h n hh hn).hi ≤ I.hi ∧
      I.length / 2 ≤ (grid (a * h) h n hh hn).length

/-- At a crossing two different permitted labels retain their exact Hilbert separation. -/
theorem globalSheet_separation_sq ... :
    2 * scale j ^ 2 ≤ ‖globalSheet hf (w.update j (i + 1)) p - globalSheet hf (w.update j (m + 1)) p‖ ^ 2

/-- The new sheet's displacement from the base sheet is at most D r wherever it is permitted. -/
theorem globalSheet_offset ... :
    ‖globalSheet hf (w.update j (i + 1)) p - globalSheet hf w p‖ ≤ D * scale j
```

取证要点：

- `stripColor` 用 $\lfloor t/h\rfloor\bmod N$ 实现论文的周期着色 $H_{j,i}/V_{j,i}$；docstring "boundary values play no role" 说的是它在条带边界上给任意值也无妨（因为 `inColoredStrip_stripColor` 需要假设 `∀ q, t ≠ q*h`，而 `ae_inColoredStrip_stripColor` 只需 a.e.）。可测性用 `measurable_of_countable`（取值于有限集 ⇒ 可测），不依赖任何实分析。这是**论文里"$U_{j,i}$ 是可测集"一句话 → Lean 里 8 行显式构造**的例子。
- `exists_grid_inside` 的输入 `hsmall : h < I.length / 4` 与输出"长度 $\ge$ $|I|/2$"给出**"至多损失 2 个周期"**的精确表述：两端各损失 $<h$，故剩余长度 $>|I|-2h>|I|/2$。这里的 $1/4$ 与 $1/2$ 是成对的：若只要求剩 $3|I|/4$ 就要 $h<|I|/8$，从而网格更稀、`PeriodGrid` 的 $n_x,n_y$ 更小。**$1/4$ 的机械理由**：`exists_nearmax_grid` 需要 $r_j/\text{length}\le t$ 同时 $\text{length}\ge|I|/2$，即一次修剪把 $t$ 只放大 2 倍，留给后面 $t$ 的调度余量；而"两端各损失一个周期"是硬约束，$2h<|I|/2$ 正好。
- `globalSheet_offset` 与 `globalSheet_separation_sq` 是 crossings 论证的两块基石，两者证明都走同一条路：`admissible_update_iff`（把 $p\in\Omega_w$ 与 $p\in\Omega_{w+e_i}$ 的相容性讲清楚）→ `globalSheet_eqOn` → `embeddingSheet_eq` → **把目标空间的距离换成源空间的距离**：
  - 偏移：`dist (point p (w.update j (i+1))) (point p w) = scale j`（用 `point_update`、`add_sub_cancel_left`、`norm_levelVector`），然后 `hf.dist_le_mul` ⇒ $\le D\cdot r_j$。**注意是等号不是不等号**，论文里 "$\le r_j$" 的松弛在 Lean 里其实是精确的。
  - 分离：`... ^ 2 = 2 * scale j ^ 2`（`add_sub_add_left_eq_sub` + `norm_levelVector_sub_sq j i m him`，即两个不同正交坐标各贡献 $r_j^2$ —— 这就是 $\sqrt2$ 的来源，**纯 Pythagoras**），然后 `pow_le_pow_left₀ dist_nonneg (hlower _ _) 2` 用**下界**假设 $d_S\le\|f'-f'\|$。⇒ 论文里"crossing 处两点被 $\sqrt2 r_j$ 分开"在 Lean 里是 $2r_j^2\le\|\cdot\|^2$，完全等价，且明确暴露"必须用双 Lipschitz 的下半支"这一事实：**上界 $D$ 只用于偏移，下界只用于分离**。

### 4.3.8 `SelectedSheets.lean`：各向异性与逐 strip 积分

```lean
def stripWidth (j : ℕ) : ℝ := (widthFactor j : ℝ) * scale j
def xPeriod (j : ℕ) : ℝ := (colors j : ℝ) * stripWidth j
def yPeriod (j : ℕ) : ℝ := (colors j : ℝ) * scale j

structure PeriodGrid (j : ℕ) where
  ax : ℤ
  ay : ℤ
  nx : ℕ
  ny : ℕ
  nx_pos : 0 < nx
  ny_pos : 0 < ny

/-- Horizontal integration on each separate vertical strip; discontinuous selections
are never differentiated across strip boundaries. -/
theorem horizontal_mean_bound_stripes ... :
    ‖(∫ p, column (G (σ p.1)) (1, 0) p ∂(Rectangle.mk (Segment.grid a h n hh hn) J).law) -
      (∫ p, column F (1, 0) p ∂(Rectangle.mk (Segment.grid a h n hh hn) J).law)‖ ≤ 2 * R / h

theorem horizontalColumn_mean (hf : LipschitzWith D f) (w) (j) (hj : w j = 0)
    (Q : Rectangle) (hQ : Q.closed ⊆ sheetDomain w) :
    ‖(∫ p, horizontalColumn hf w j (1, 0) p ∂Q.law) -
      (∫ p, column (globalSheet hf w) (1, 0) p ∂Q.law)‖ ≤ 2 * D * scale j / Q.x.length

theorem verticalColumn_y_mean ... : ... ≤ 2 * D * scale j / Q.y.length
theorem verticalColumn_x_mean ... : ... ≤ 2 * D / widthFactor j
```

- `stripWidth = W_j r_j`、`xPeriod = N_j W_j r_j`、`yPeriod = N_j r_j`：**各向异性在这里定型**——横向周期是纵向周期的 $W_j$ 倍。论文的 $n^2$ 权重（把水平能量乘 $N_n^2$ 以补偿矩形长边）在 Lean 里的真身是 `widthFactor j`，即 `Energy.combinedEnergy` 中的 `(widthFactor j)^2 * horizontalEnergy`。$W_j$ 与 $N_j$ 在论文里被同时取为 $n$（"take $N_n=W_n=n$"），Lean 通过 `recurrent_parameters N W` 允许二者独立，并在 `exists_energy_parameters` 里对 $W$ 单独调度——**这是第二处实质改写**（见 4.6 第五项）。
- `horizontal_mean_bound_stripes` 的 docstring 是方法论自述：**"discontinuous selections are never differentiated across strip boundaries"**。即 $G(\sigma(\cdot))$ 关于 $x$ 是分片（按竖条）的，不能整体微分；解决办法是把网格矩形按列切成 `Qi i := ⟨Segment.cell a h hh i, J⟩`，逐片用 FTC，再按 `integral_grid_x`（"Exact integration by columns"）加权 $\sum_i \frac{|cell_i|}{|grid|}=1$ 合并。结论 $\le 2R/h$ 的形状：$R$ 是逐片位移上界、$h$ 是条带宽，$\|平均导数差\|\le \frac{\text{端点差}}{\text{长度}} \sim \frac{2R}{h}$——**分片不连续被完全吸收进 $2R/h$**，因为每片内部端点差 $\le 2R$（两端各 $\le R$），而片宽 $h$ 与平均权重相消。这解释了 $h$（条带宽）而不是 $|I|$（矩形长）出现在分母：逐片积分把长边信息丢掉了。
- 三条 `*_mean` 界由此派生，形状各不相同，且与论文的 $2Dr/L_x$、$2D/W$ 对照：
  - `horizontalColumn_mean ≤ 2 D r_j / Q.x.length`：$R = D\,r_j$（`globalSheet_offset`），$h$ 换成整长（水平方向 $G(\sigma x)$ 只在竖条内变化，故可整体处理）。
  - `verticalColumn_y_mean ≤ 2 D r_j / Q.y.length`：对偶。
  - `verticalColumn_x_mean ≤ 2 D / widthFactor j`：这条是"沿 $x$ 平均竖直导数"的界，分母是条带宽 $W_jr_j$，分子 $D r_j$，于是商成 $D/W_j$（再乘 2）。**论文里 $2D/n$ 这一项在 Lean 里明确写成 $2D/W_j$**，暴露了它其实是"位移/条带宽"的比值，与 $1/n$ 无本质关系。
- `exists_block_integral_le`（docstring "Finite averaging chooses one complete period without increasing the mean energy"）：`∃ a b, ∫ (block a b).law g ≤ ∫ rectangle.law g`，两次 `exists_le_finite_mean` 复合（先列后行）。**注意它没有 $4$ 或 $N$ 的损失**——选出的周期块的平均恰好 $\le$ 整个网格平均，这是论文"取一个使平均不增的周期块"的精确实现；而论文里紧接的"crossing 处的能量放大有 $N$ 因子"则在 `Crossings.ColorBlock.row_energy_le/column_energy_le` 里出现，乘数是 `colors j`。

### 4.3.9 `Extremal.lean`：lem:compact 的定量替身（全素材最重要的一处分歧）

论文 lem:compact 只说"紧集 $K$ 的字典序最大值 $(A,B)$ 满足：$\varepsilon\to0^+$ 时 $\sup\{z_2: z\in K, z_1>A-\varepsilon\}\to B$"，即一个 **limsup 断言**。Lean 把它拆成三条**带定量模**的引理：

```lean
/-- Near a compact lexicographic maximum, the second coordinate has a uniform upper bound. -/
theorem near_lexicographic_maximum {K : Set (ℝ × ℝ)} (hK : IsCompact K) {A B : ℝ}
    (hfirst : ∀ p ∈ K, p.1 ≤ A) (hsecond : ∀ p ∈ K, p.1 = A → p.2 ≤ B)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ p ∈ K, A - δ < p.1 → p.2 ≤ B + ε

/-- A nonempty compact set has a lexicographic maximum. -/
theorem exists_lexicographic_maximum (hK : IsCompact K) (hne : K.Nonempty) :
    ∃ A B : ℝ, (A, B) ∈ K ∧ (∀ p ∈ K, p.1 ≤ A) ∧ (∀ p ∈ K, p.1 = A → p.2 ≤ B)

/-- An affine barrier bounds the second coordinate in terms of the first-coordinate deficit. -/
theorem lexicographic_affine_barrier {K : Set (ℝ × ℝ)} (hK : IsCompact K) {A B M : ℝ}
    (hfirst : ∀ p ∈ K, p.1 ≤ A) (hsecond : ∀ p ∈ K, p.1 = A → p.2 ≤ B)
    (hbound : ∀ p ∈ K, p.2 ≤ M) (hB : 0 ≤ B) (hM : 0 ≤ M) {ε : ℝ} (hε : 0 < ε) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ p ∈ K, p.2 ≤ B + ε + C * (A - p.1)
```

机制取证：

- `exists_lexicographic_maximum` 用两次 `IsCompact.exists_isMaxOn`（即 Weierstrass）：先在 $K$ 上最大化 `continuous_fst` 得 $A$，再在纤维 $K\cap\{p_1=A\}$（紧致：`hK.inter_right (isClosed_eq ...)`，非空：$\langle p, hp, \mathrm{rfl}\rangle$）上最大化 `continuous_snd` 得 $B$。**这就是论文"按字典序取最大值"的全部实现**，且它把"字典序"这个可能被质疑良定义性的词消解成两次连续函数取最大。
- `near_lexicographic_maximum` 的证明**不用度量紧性的序列语言**，而用"坏集取最大"：`bad := K ∩ {p | B + ε ≤ p.2}` 紧（`hK.inter_right (isClosed_le ...)`），若非空则其上 `continuous_fst` 的最大点 $p$ 满足 $p_1<A$（因为 $p_1=A$ 会与 `hsecond` 和 $p_2\ge B+\varepsilon$ 同时矛盾，证明里就是 `linarith`），取 $\delta := A - p_1$。⇒ **$\delta$ 是"坏集最右端到 $A$ 的距离"**，是一个具体的正实数（可能极小），Lean 只是把它 `obtain` 出来，从不估计它。这正是论文明说的"不需要定量模"，但 Lean 比论文多做了一步：**把 $\delta$ 变成斜率 $C := M/\delta$**（下一条引理）。
- `lexicographic_affine_barrier`：`refine ⟨M / δ, div_nonneg hM hδ.le, ?_⟩`，然后对 $p\in K$ 分两支：`A - δ < p.1` 时用 `near_lexicographic_maximum` 的界（$B+\varepsilon$，加上非负项 $C(A-p_1)$ 仍成立）；否则 $\delta\le A-p_1$，于是 $p_2\le M = (M/\delta)\cdot\delta \le C(A-p_1)$。⇒ 论文的 limsup 在 Lean 里被"斜率 $C=M/\delta$ 的仿射屏障 + 一个 $\varepsilon$ 余量"取代，$C$ 从此作为**假设**在 `Energy.anisotropic_energy_bound` 里一路传递到 `verticalCoefficient D C`。**这是"论文用极限、Lean 用常数"的教科书案例**，见 4.6 第三项。
- 方差恒等式与两条推论（对应论文 eq:variance）：`variance_identity`（docstring "The variance identity over an arbitrary probability space."，Extremal.lean 行 87）、

```lean
/-- Small moment error and an upper second moment force small mean-square variation. -/
theorem variance_le_of_moments ...   -- ∫‖F-a‖² ≤ (∫‖F‖² - ‖a‖²) + 2‖a‖·‖∫F - a‖ 的形状
/-- Discarding the nonnegative variance bounds the second-moment deficit. -/
theorem mean_deficit_le ...
/-- Integrated affine barrier; unlike a limsup statement, this keeps all quantitative data. -/
theorem integral_second_le_barrier {K : Set (ℝ × ℝ)} {s t : X → ℝ}
    (hs : Integrable s μ) (ht : Integrable t μ) (hvalues : ∀ᵐ x ∂μ, (s x, t x) ∈ K)
    {A B ε C : ℝ} (hbarrier : ∀ p ∈ K, p.2 ≤ B + ε + C * (A - p.1)) :
    (∫ x, t x ∂μ) ≤ B + ε + C * (A - ∫ x, s x ∂μ)
```

`integral_second_le_barrier` 的证明是 `integral_mono_ae` + 一串 `simpa only [integral_add, integral_const_mul, integral_sub, integral_const, probReal_univ, one_mul]`：**它把"$\int$ 与不等式交换"的三行论证压成一次 simp**，而右边 $C\cdot(A-\int s)$ 里 $\int$ 与 $A$ 的次序之所以能出现，是因为屏障对 $K$ 中**每一点**成立且 $(s x,t x)\in K$ a.e.（`hvalues.mono`）。docstring "unlike a limsup statement, this keeps all quantitative data" 是形式化者对自己改造的注释，值得笔记直接引用。
- `vertical_variance_bound`（docstring "The hard lexicographic energy step, before substituting the geometric moment bounds."）：这是论文最吃紧的一步——**把 $Y$（新 sheet 的竖直导数）的二阶矩用 $X$（同一新 sheet 的水平导数）的一阶矩亏损来控**。输出

```lean
(∫ x, ‖H x - v‖ ^ 2 ∂μ) ≤ B - ‖v‖ ^ 2 + ε +
  C * (A - ‖u‖ ^ 2 + 2 * D * ‖(∫ x, G x ∂μ) - u‖) + 2 * D * ‖(∫ x, H x ∂μ) - v‖
```

其证明四行：`integral_second_le_barrier` → `variance_le_of_moments`（对 $H,v$）→ `mean_deficit_le`（对 $G,u$）→ `gcongr` 把 $\|u\|\le D,\|v\|\le D$ 统一成 $D$ 因子。**这里的 $D$ 在 `Energy` 里全部实例化为 $2D$**（来自 `hu : ‖u‖ ≤ 2 * D`），这就是 `verticalCoefficient` 中出现 $8CD$ 与 $8D(2D+1)$ 的原因。[取证：`hvalues : ∀ᵐ x ∂μ, (‖G x‖², ‖H x‖²) ∈ K` 里第一分量是**水平**导数、第二分量是**竖直**导数，与 `derivativePair` 次序一致 ⇒ "字典序最大化 $(A,B)$"= 先最大化水平能量、再在其上最大化竖直能量；论文正是靠这个次序把"水平方向被 $A$ 卡住"与"竖直方向只能用 $A$ 的亏损换额度"耦合起来。Lean 里该耦合完全体现在"一条 $(\|X\|^2,\|Y\|^2)\in K$ 假设 + 屏障把 $Y$ 的额度写成 $A-\|X\|^2$ 的函数"，比论文散文更透明]

### 4.3.10 `Energy.lean`：prop:energy 的完全量化 + 参数调度

三个新常数定义：

```lean
def horizontalCoefficient (D : ℝ) : ℝ := 4 + 8 * D * (2 * D + 1)
def verticalCoefficient (D C : ℝ) : ℝ := 4 + 2 * C + 8 * C * D + 8 * D * (2 * D + 1)
def combinedEnergy (hf) (w) (j) (p) : ℝ :=
  (widthFactor j : ℝ) ^ 2 * horizontalEnergy hf w j p + verticalEnergy hf w j p
def horizontalEnergy hf w j p := ‖horizontalColumn hf w j (1, 0) p - column (globalSheet hf w) (1, 0) p‖ ^ 2
def verticalEnergy   hf w j p := ‖verticalColumn   hf w j (0, 1) p - column (globalSheet hf w) (0, 1) p‖ ^ 2
```

`combinedEnergy` 就是论文里"水平能量乘 $n^2$"的权重——在 Lean 里它是 $W_j^2$，与条带宽 $W_j r_j$ 成正比，**几何意义更直白**：把水平方向按"周期长边比例"放大，使水平/竖直两项可相加后仍控制 crossings。

`anisotropic_energy_bound` 的假设是 `hfirst`（$A$ 为水平上界）、`hbarrier`（仿射屏障）、`hu/hv`（$\|u\|,\|v\|\le 2D$）、`hnearu/hnearv`（$A-\|u\|^2\le t$、$B-\|v\|^2\le t$）、`hbaseu/hbasev`（旧 sheet 两方向 $L^2$ 误差 $\le t^2$）、`hrx/hry`（$r_j/L_x\le t$、$r_j/L_y\le t$）；结论是

$$\overline{\mathcal E}_{\text{horiz}}\le \text{horizontalCoefficient}(D)\cdot t,\qquad
\overline{\mathcal E}_{\text{vert}}\le 2\varepsilon+\frac{16CD^2}{W_j}+\text{verticalCoefficient}(D,C)\cdot t.$$

证明（行 141–205）的机械分解：

1. 记号 `Q/H/X/Y/F₁/F₂`（$H$ = 新 sheet 水平导数、$X$ = 新 sheet 沿 $x$ 取的竖直选列、$Y$ = 新 sheet 竖直导数、$F_1,F_2$ = 旧 sheet 两方向导数），六个 `IsBoundedField` 事实。
2. `norm_mean_sub_le_of_energy` 把 `hbaseu/hbasev`（$L^2$ 误差 $\le t^2$）转成**均值**误差 $\le t$。
3. `hrx'/hry'`：$2Dr_j/L_{x,y}\le 2Dt$。
4. 三条均值定位（`linarith` 拼三角不等式）：`hmH : ‖∫H − u‖ ≤ (2D+1)t`、`hmX : ‖∫X − u‖ ≤ 2D/W_j + t`、`hmY : ‖∫Y − v‖ ≤ (2D+1)t`。前两条来自 `horizontalColumn_mean`（$2Dr_j/L_x\le 2Dt$）与 `verticalColumn_x_mean`（$2D/W_j$）；**只有 $X$ 那条带 $1/W_j$**，即最终 $16CD^2/W_j$ 的唯一来源。
5. `ht2 : t² ≤ t`（`nlinarith` 用 `ht`、`ht1`）——**$t\le1$ 的唯一被用处**，作用是把旧 sheet 的 $L^2$ 误差降级成 $t$ 的一次齐次项。
6. 水平支：`hsecond : ∫‖H‖² ≤ A` 由 `integral_mono_ae` + `ae_horizontal_pair`（a.e. 处 $H$ 是好点导数对的第一分量）+ `hfirst`；`variance_le_of_moments` 给 $\int\|H-u\|^2\le(A-\|u\|^2)+2\|u\|\!\cdot\!\|(∫H)-u\|\le t+4D(2D+1)t$；`energy_sub_le_two`（docstring "A squared triangle inequality with the same reference vector"，即 $\|a-b\|^2\le2\|a-c\|^2+2\|b-c\|^2$）合成 $\int\|H-F_1\|^2$。算术核对：$2[t+4D(2D+1)t]+2t^2\le 4t+8D(2D+1)t=$ `horizontalCoefficient D * t` ✓——**系数 $4+8D(2D+1)$ 完全由"2 来自平方三角、2 来自 $2\|u\|\cdot$误差、$2D$ 来自 $\|u\|$ 界、$(2D+1)$ 来自均值定位"拼出，`unfold horizontalCoefficient; nlinarith` 收尾**。
7. 竖直支：`vertical_variance_bound`（$D$ 实例化为 $2D$）→ `hvar'`（`gcongr` 逐项代入 `hnearv`、`hnearu`、`hmX`、`hmY`，并把 $2\cdot(2D)$ 重写为 $4D$，见证明里的 `hfour`）：

$$\int\|Y-v\|^2\le t+\varepsilon+C\big(t+4D(2D/W_j+t)\big)+4D(2D+1)t,$$

再一次 `energy_sub_le_two` + `nlinarith` + `unfold verticalCoefficient; ring`：$2[t+\varepsilon+C(t+8D^2/W_j+4Dt)]+2t^2$ $=2\varepsilon+16CD^2/W_j+(4+2C+8CD+8D(2D+1))t$ ✓。**$16$ 的来源**是 $2\times C\times4D\times(2D/W_j)$，链条上每一环都不是优化值。

`exists_nearmax_grid`（docstring "Good points near the lexicographic pair and recurrence give actual fine grid rectangles."）把抽象假设变成可实例化的存在：

```lean
  obtain ⟨z, ⟨w, p, hp, hpz⟩, hz⟩ := Metric.mem_closure_iff.mp hAB t ht   -- (A,B)∈closure 的 t-近似好点
  let u := sheetColumn (embeddingSheet f w) (sheetDomain w) (1, 0) p
  obtain ⟨Q, hQ, hQu, hQv⟩ := goodSheetPoint_exists_rectangle hf hp (show 0 < t ^ 2 / 4 by positivity)
  let δ := min (Q.x.length / (4 * N * W)) (min (Q.y.length / (4 * N)) (min (t * Q.x.length / 2) (t * Q.y.length / 2)))
  obtain ⟨j, hjN, hjW, hjw, hjδ⟩ := exists_fine_level N W hN hW w hδ
  have hxperiod : xPeriod j < Q.x.length / 4 ...   -- 由 hr₁ 与 hjN/hjW 代入 nlinarith
  obtain ⟨G, hGQ, hGx, hGy⟩ := PeriodGrid.exists_inside Q hxperiod hyperiod
  have hGu := Rectangle.integral_le_four_of_subset Q G.rectangle bu (fun _ => sq_nonneg _) hGQ hGx hGy
```

- $A-\|u\|^2\le t$ 来自闭包定义：`mem_closure_iff` 给 $\mathrm{dist}((A,B),(\|u\|^2,\|v\|^2))<t$，`Prod.dist_eq` + `max_lt_iff` 拆成两个绝对值不等式，最后 `(le_abs_self _).trans hz'.1.le`。**论文说"取接近 $(A,B)$ 的好点"，Lean 用的是闭包的 $\varepsilon$-邻域刻画，零额外分析**。
- $\delta$ 的四个分量各服务一个下游条件：$L_x/(4NW)$ 保证 $N\cdot W\cdot r_j<L_x/4$（$x$ 方向容得下 4 个完整周期），$L_y/(4N)$ 对偶，$tL_x/2$ 与 $tL_y/2$ 保证 $r_j/L'_{x,y}\le t$（配合修剪后 $L'\ge L/2$）。$t^2/4$ 与修剪因子 $4$ 精确配对成 `hbaseu : ... ≤ t^2`：好点矩形上误差 $<t^2/4$，扩到周期网格乘 $4$ 得 $\le t^2$（严格 $<$ 转 $\le$ 用 `linarith`）。**这两个数（$1/4$ 与 $4$）是同一常数的互逆**，与 4.3.6 的因子 4 一致。
- `exists_energy_parameters`（docstring 逐字："**The order of choices is essential: the strip width follows the compact barrier, then the base error and the unused radius are made small.**"）：

```lean
theorem exists_energy_parameters {D C η : ℝ} (hD : 0 ≤ D) (hC : 0 ≤ C) (hη : 0 < η) :
    ∃ W : ℕ, 0 < W ∧ ∃ t : ℝ, 0 < t ∧ t ≤ 1 ∧
      2 * (η / 8) + 16 * C * D ^ 2 / (W : ℝ) +
        ((W : ℝ) ^ 2 * horizontalCoefficient D + verticalCoefficient D C) * t < η := by
  obtain ⟨W, hW⟩ := exists_nat_gt (max 1 (64 * C * D ^ 2 / η))
  ...
  have hterm : 16 * C * D ^ 2 / (W : ℝ) < η / 4 := ...
  let K := (W : ℝ) ^ 2 * horizontalCoefficient D + verticalCoefficient D C
  let t := min 1 (η / (4 * K))
```

这条引理是**"论文的两个参数 $n$"被拆成"$W$ 与 $t$"的现场**：$W$ 先取 $>64CD^2/\eta$ 把 $1/W$ 项压到 $\eta/4$；再令 $t:=\min(1,\eta/(4K))$ 把 $K t$ 压到 $\eta/4$，其中 $K=W^2\cdot\text{horiz}+\text{vert}$ **依赖 $W$**，故 $W$ 必须先定；余下 $2\varepsilon=\eta/4$ 由屏障的 $\varepsilon$（调用时给 `η / 8`）贡献，三项和 $<\eta$。**"order is essential" 指的就是 $C\Rightarrow W\Rightarrow t$ 的依赖箭头**；论文里对应的"先 $n$ 大、再 $m$ 更大"两级极限被压成一次算术调度。
- `exists_small_energy_grid`（docstring "The full analytic output: arbitrarily small combined energy on actual sheets of the single fixed Hilbert set, at a level with any prescribed number of colors."）是主装配线，顺序固定：`exists_lexicographic_maximum` → `derivativeCompact_subset` → `lexicographic_affine_barrier`（$\varepsilon:=\eta/8$）→ `exists_energy_parameters` → `exists_nearmax_grid` → `anisotropic_energy_bound` → `rw [hjW]`（把 $W_j$ 换成 $W$）→ 按 `combinedEnergy` 定义合并 $W^2H+V$ → `nlinarith` 用 `hparam`。输出 $\int\text{combinedEnergy}<\eta$ 且 `colors j = N`、`w j = 0`、`G.rectangle.closed ⊆ sheetDomain w`。**这条就是论文 prop:energy + 极限论证的有限化终态。**

### 4.3.11 `Crossings.lean`：从能量到 $N$ 个分离点

```lean
structure ColorBlock (j : ℕ) where ax : ℤ; ay : ℤ
def ColorBlock.rectangle (B : ColorBlock j) : Rectangle :=
  ⟨Segment.grid (B.ax * xPeriod j) (stripWidth j) (colors j) (stripWidth_pos j) (colors_pos j),
   Segment.grid (B.ay * yPeriod j) (scale j) (colors j) (scale_pos j) (colors_pos j)⟩
def ColorBlock.column (B) (i : Fin (colors j))  -- Segment.cell (B.ax * xPeriod j) (stripWidth j) ... i
def ColorBlock.row    (B) (i : Fin (colors j))  -- Segment.cell (B.ay * yPeriod j) (scale j) ... i
theorem x_length (B) : B.rectangle.x.length = (colors j : ℝ) * widthFactor j * scale j
theorem y_length (B) : B.rectangle.y.length = (colors j : ℝ) * scale j
theorem row_color (B) (i) (hy : y ∈ Ioo (B.row i).lo (B.row i).hi) :
    stripColor (colors j) ... (scale j) y = i ∧ inColoredStrip (scale j) (colors j) i y
```

`ColorBlock` 是**恰好一个完整周期**的矩形（$N$ 列 $\times$ $N$ 行，列宽 $W_jr_j$、行宽 $r_j$），由 `exists_small_energy_block`（docstring "Finite averaging chooses one complete period without increasing the mean energy."）从 `PeriodGrid` 里选出：

```lean
theorem exists_small_energy_block (hf : LipschitzWith D f) (N : ℕ) (hN : 0 < N) {η : ℝ} (hη : 0 < η) :
    ∃ (w : Tuple) (j : ℕ) (B : ColorBlock j), colors j = N ∧ w j = 0 ∧
      B.rectangle.closed ⊆ sheetDomain w ∧ (∫ p, combinedEnergy hf w j p ∂B.rectangle.law) < η
```

两条线选择引理 `exists_horizontal_line` / `exists_vertical_line`（docstring 分别强调 "a genuine **interior** horizontal line with an **all-points** oscillation bound" 与 "the same avoidance of **FTC null sets**"）合起来是 Fubini + 一阶矩抽样：`J.ae_mem.and ((J.ae_of_ae (ae_integral_column_x hG)).and (... hF))` 先把三个 a.e. 性质交起来，再 `exists_good_le_integral` 取一点；然后把 FTC 身份

```lean
  have hFTC : ∀ a b, (∫ x in a..b, g x) = (G (b, y) - F (b, y)) - (G (a, y) - F (a, y))
```

（用 `intervalIntegral.integral_sub` + `abel`）喂给 `oscillation_sq_le_segment_energy`，得到**闭区间上一致**的振荡界

$$c\,\big\|(G(b,y)-F(b,y))-(G(a,y)-F(a,y))\big\|^2\le |I|^2\!\int e\,d(\text{rectangle law}).$$

`exists_color_row` / `exists_color_column` 是它的两次实例化：$c$ 分别取 $(W_j)^2$ 与 $1$，$e$ 取 `combinedEnergy`；支配假设 `hdom` 的证明是

```lean
    unfold combinedEnergy horizontalEnergy horizontalColumn
    rw [(B.row_color i hy).1]
    exact le_add_of_nonneg_right (sq_nonneg _)
```

**即"组合能量 $\ge$ 加权水平能量"这一句在 Lean 里就是丢弃一个非负项**（水平方向丢竖直能量，竖直方向丢 `le_add_of_nonneg_left (mul_nonneg (sq_nonneg _) (sq_nonneg _))`），极其廉价；右侧再乘 `colors j`（`ColorBlock.row_energy_le` / `column_energy_le`）。

关键的定量收口引理（整篇最干净的一行算术）：

```lean
/-- The horizontal weight cancels exactly against the longer period side. -/
theorem small_oscillation_of_weighted_energy {n w r s e : ℝ}
    (hn : 0 < n) (hw : 0 < w) (hr : 0 < r) (hs : 0 ≤ s)
    (he : e ≤ 1 / (64 * n ^ 3))
    (hbound : w ^ 2 * s ^ 2 ≤ (n * w * r) ^ 2 * (n * e)) : s ≤ r / 8 := by
  have heq : (n * w * r) ^ 2 * (n * (1 / (64 * n ^ 3))) = w ^ 2 * (r / 8) ^ 2 := by field_simp; ring
  rw [heq] at hright
  have hsquared := (mul_le_mul_iff_right₀ (sq_pos_of_pos hw)).mp (hbound.trans hright)
  exact (sq_le_sq₀ hs (by positivity)).mp hsquared
```

机械解读：$n=N_j$（列数）、$w=W_j$（宽度因子）、$r=r_j$（尺度）、$s$=振荡、$e=\int\text{combinedEnergy}<\eta$。$(nwr)$ 正是 `x_length`，所以 $w^2s^2\le(nwr)^2\cdot ne$ 就是"加权振荡平方 $\le$ 长边平方 $\times$ 能量"；代入 $e\le1/(64n^3)$ 得 $(nwr)^2\cdot n/(64n^3)=w^2r^2/64=w^2(r/8)^2$，**$n$ 完全对消**（docstring 逐字："cancels exactly against the longer period side"），故 $s\le r/8$。⇒ $1/64$ 与 $1/8$ 是同一个 $8^2$ 的两面；$n^3$ 是"长边贡献 $n^2$、能量阈值再贡献一个 $n$"的产物。这就是论文 $\omega_n=N\sqrt{2N\varepsilon_n}\to0$ 的量化替身：Lean 直接令 $\eta=1/(64N^3)$（调用点写的是 `show 0 < 1 / (64 * (N : ℝ) ^ 3) by positivity`），于是振荡 $\le r_j/8$ 而非"趋于 0"。

最终装配：

```lean
theorem exists_separated_family (hf : LipschitzWith D f)
    (hlower : ∀ p q, dist p q ≤ dist (f p) (f q)) (N : ℕ) (hN : 0 < N) :
    ∃ z : Fin N → E, (∀ i, ‖z i‖ ≤ D) ∧ ∀ i m, i ≠ m → 1 ≤ dist (z i) (z m)
```

证明骨架（逐行核对）：

1. `exists_small_energy_block hf N hN (show 0 < 1 / (64 * (N : ℝ) ^ 3) by positivity)` 得 $(w,j,B)$，`subst N`（把 `colors j = N` 代入，此后 `Fin (colors j)` 即 `Fin N`）。
2. `choose y hy hyo using fun i => exists_color_row hf w j B i` 与 `choose x hx hxo using fun i => exists_color_column hf w j B i`：**逐色各取一条内部水平线 $y_i$ 与一条内部垂直线 $x_i$**，并记 $p_i=(x_i,y_i)$、$h_i:=F_i-F_0$（`let h i p := addedSheet hf w j i p - globalSheet hf w p`）。
3. `hrow i m : ‖h i (x m, y i) - h i (p i)‖ ≤ scale j / 8` 与 `hcolumn i m : ‖h m (x m, y i) - h m (p m)‖ ≤ scale j / 8`：两次 `small_oscillation_of_weighted_energy`，第二次以 `w := 1` 调用并用 `one_pow, one_mul, mul_one` 清理（因为竖直方向没有权重）。
4. `hcentral i m him : scale j ≤ ‖h i (p i) - h m (p m)‖`：交点 $c=(x_m,y_i)$ 既在 $i$ 号横条（`hiAllowed := Or.inl (B.row_color i (hy i)).2`）又在 $m$ 号竖条（`hmAllowed := Or.inr (B.column_color m (hx m)).2`），故 `globalSheet_separation_sq` 给 $2r_j^2\le\|h_i(c)-h_m(c)\|^2$；再用两次 `dist_triangle` 把 $c$ 换到 $p_i,p_m$，反证收尾：

```lean
    by_contra hn
    have hm : ‖h i (p i) - h m (p m)‖ < scale j := lt_of_not_ge hn
    have hbound : ‖h i c - h m c‖ ≤ 5 * scale j / 4 := by linarith
    have hsq := pow_le_pow_left₀ (norm_nonneg _) hbound 2
    nlinarith [sq_pos_of_pos hr]
```

**阈值比较即 $(5/4)^2=25/16=1.5625<2$**，等价于论文的 $\sqrt2-2\omega_n>1$。敏感度：若振荡界从 $r_j/8$ 退化为 $3r_j/8$，则 $(1+0.75)^2=3.06>2$，论证立刻失守；$1/8$ 之所以够用，是因为能量阈值 $\eta$ 可以任意小（$N$ 固定后 $\eta=1/(64N^3)$ 只是一个具体值）。
5. 归一化：`let z i := (scale j)⁻¹ • h i (p i)`；$\|z i\|\le D$ 由 `globalSheet_offset`（证明里 `change ‖h i (p i)‖ ≤ D * scale j at hoff`，再 `norm_smul, abs_inv, field_simp`）；$1\le\mathrm{dist}(z_i,z_m)$ 由 `hcentral`（`calc 1 = (scale j)⁻¹ * scale j ... ≤ _`）。

**docstring 的最后一句是取证重点**："The lower bound is the genuine source distance."——即 $\|z_i-z_m\|\ge1$ **只用了 `hlower`（双 Lipschitz 的下半支）**，而 $\|z_i\|\le D$ 只用 `hf`（上半支）。两条假设在 Lean 里被严格分开使用，绝不互相污染。

### 4.3.12 `Main.lean`：六行收尾（全案最"便宜"的部分）

```lean
theorem no_normalized_embedding {f : constructedSet → E} {D : NNReal}
    (hf : LipschitzWith D f) (hlower : ∀ p q, dist p q ≤ dist (f p) (f q)) : False := by
  obtain ⟨bound, hbound⟩ := isCompact_exists_packing_bound
    (isCompact_closedBall (0 : E) (D : ℝ)) (show (0 : ℝ) < 1 by norm_num)
  obtain ⟨z, hz, hsep⟩ := exists_separated_family hf hlower (bound + 1) (by omega)
  have hc := hbound z (fun i => by simpa only [mem_closedBall, dist_zero_right] using hz i) hsep
  omega
```

`no_scaled_embedding` 用 `g := fun x => a⁻¹ • f x` 把论文"归一化尺度"一句话写成 17 行 `calc`/`field_simp`（关键是 `hdist (x y) : dist (g x) (g y) = a⁻¹ * dist (f x) (f y)` 一次证明、两处复用，以及 `D' : NNReal := ⟨D, le_trans zero_le_one hD⟩` 这个把实数失真转成 `NNReal` 的构造）。`main` 的证明只有 8 行：`⟨constructedSet, constructedSet_cover, fun k _ hEmbedding => ... no_scaled_embedding f ha hD hf⟩`。

[取证：`bound + 1` + `omega` 表明矛盾形式是"packing 上界 vs 存在 $bound+1$ 个 1-分离点"，$N$ 在 `exists_separated_family` 里是**输入参数**而非构造出的序列——论文"对任意 $N$ 存在 $N$ 个分离点"的叙述被改写成"取 $N=\text{bound}+1$，一次调用即矛盾"。这是第四处实质改写。另注意 `isCompact_closedBall (0 : E) (D : ℝ)` 依赖 `E` 有限维 ⇒ `ProperSpace`，Mathlib 由 `FiniteDimensional` 自动提供；论文的"体积比较"在 Lean 里换成"紧集上的分离族有界"，见 4.6 第二项]

## 4.4 支线：`CompactBanach` 链（论文 cor:banach 的形式化）

论文 cor:banach 的路线（tex 行 416/438/445/485–487 逐字）：

> "Finite witnesses to Theorem~\ref{thm:main} can be placed in any infinite-dimensional real Banach space by the classical Dvoretzky theorem. A geometrically shrinking union of these finite clusters, with its limit point adjoined, is compact and retains a uniform doubling bound."
> "... gives a linear embedding $T_j$ of the finite Hilbert span of $X_j$ into $B$ with distortion strictly below two ..."
> "Only this qualitative finite-dimensional form of Dvoretzky is used."
> "Each $Y_j=T_j(X_j)$ has doubling constant at most $\lambda_0=\lambda^4$, uniformly in $j$ and $B$. ... Four halvings cover that $S$-ball by at most $\lambda^4$ $S$-balls of radius $R/16$."
> "$1+5\lambda_0^2\le1+6\lambda^8$ ... This proves a universal doubling bound; one may take $\Lambda=1+6\lambda^8$."

Lean 侧的终态（`CompactBanach.lean` 行 20–26 逐字）：

```lean
theorem main : ∃ Λ : ℕ, ∀ (B : Type u) [NormedAddCommGroup B] [NormedSpace ℝ B]
    [CompleteSpace B], ¬ FiniteDimensional ℝ B →
    ∃ K : Set B, IsCompact K ∧ DoublingAtMost K Λ ∧
      ∀ (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E]
        [FiniteDimensional ℝ E], ¬ AdmitsBiLipschitzEmbedding K E := by
  classical
  refine ⟨1 + 5 * (76800 ^ 8) ^ 2, ?_⟩
```

**结论：Lean 取 $\Lambda=1+5\lambda_0^2$ 且 $\lambda_0=76800^8$；论文取 $\Lambda=1+6\lambda^8$ 且 $\lambda_0=\lambda^4$。** 形式化没有做论文的 $5\to6$ 松弛，但指数从 $8$ 涨到 $16$，唯一原因是失真常数从"严格小于 2"变成"6"（搬运）与"36"（合成），见 4.6 第一项。

支线十个文件的取证（这些文件**没有一行 docstring**，全部只能靠语句本身读）：

1. `Auerbach.lean` —— **Dvoretzky 的替代品**。两条引理：

```lean
theorem exists_auerbach_basis {ι E} [Fintype ι] [DecidableEq ι]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] (e : Module.Basis ι ℝ E) :
    ∃ b : Module.Basis ι ℝ E, (∀ i, ‖b i‖ ≤ 1) ∧ ∀ x i, |b.repr x i| ≤ ‖x‖

theorem exists_auerbach_vectors {B ι} [NormedAddCommGroup B] [NormedSpace ℝ B] [Fintype ι]
    (hB : ¬ FiniteDimensional ℝ B) :
    ∃ v : ι → B, (∀ i, ‖v i‖ ≤ 1) ∧ ∀ (c : ι → ℝ) i, |c i| ≤ ‖∑ j, c j • v j‖
```

第一条的证明是**极大行列式**：在紧集 `U := {v : ι → E | ∀ i, ‖v i‖ ≤ 1}`（`isCompact_pi_infinite` + 逐坐标 `isCompact_closedBall 0 1`）上，对固定基 $e$ 的坐标矩阵取行列式极大（`let en := e.unitsSMul ...` 先把 $e$ 归一化到 $U$ 内，再用紧集上连续函数取极值），行列式极大 ⇒ 每个坐标系数不超过范数。第二条：从 `Module.Basis.ofVectorSpace ℝ B`（Hamel 基）出发，由 `¬FiniteDimensional` 推出基指标集 `Infinite`，用 `Infinite.natEmbedding` 取 `#ι` 个两两不同的基向量，`Submodule.span` 成有限维子空间 $V$，对其基 `Module.Basis.span hli` 用第一条，最后 `Submodule.norm_coe` 把结论搬回 $B$。
   **与论文的偏差**：论文用 Dvoretzky（失真 $<2$，但需要 $\dim B\ge m(\varepsilon)$ 且要引用经典定理 + `\cite[Section 7]{Dvoretzky}` 与 `\cite[Theorem 1.1]{COO}`）；Lean 用 Auerbach 式初等论证，失真变差（见下），但**完全不需要维度下界**，也不需要任何外部定理——它只用到"$B$ 无穷维 ⇒ 有无限个 Hamel 基向量"。[推测：形式化者选 Auerbach 是因为 Mathlib 没有 Dvoretzky 定理；这也解释了为什么支线文件全部无 docstring——这是一条"被迫自建"的路线，不像论文那样有现成引用可依]
2. `CoordinateSupport.lean` / `CoordinateMap.lean` —— `finite_coordinate_support X hX : ∃ I : Finset ℕ, ∀ z ∈ X, ∀ i ∉ I, z i = 0`（有限子集只用有限个坐标：靠 `pointSupport w` = `w.support` 的像），`coordinateMap I v := ∑ i : I, z i • v i`（线性映射！`map_add'/map_smul'` 用 `simp [add_smul, Finset.sum_add_distrib]` 两行构造），配 `coordinateMap_single`（$\|T(lp.single\,2\,j\,a)\|\le|a|$，需 `‖v i‖≤1`）与 `coordinateMap_lower`（`∀ i, |z i| ≤ ‖T z‖`，需 Auerbach 的下界性质）。
3. `SparseCoordinates.lean` —— 上失真界的全部来源：

```lean
theorem sum_scale_le (hR : 0 ≤ R) (hs : ∀ j ∈ s, scale j ≤ R) : ∑ j ∈ s, scale j ≤ 2 * R
theorem norm_map_point_sub_le (T) (hT : ∀ i a, ‖T (lp.single 2 i a)‖ ≤ |a|)
    (p q : Base) (w w' : Tuple) (hR : 0 ≤ R)
    (hf : |p.1 - q.1| ≤ R) (hs : |p.2 - q.2| ≤ R)
    (hw : ∀ j, w j ≠ w' j → scale j ≤ R) : ‖T (point p w - point q w')‖ ≤ 6 * R
```

$6=2+4$：基点两坐标各贡献 $R$（`hb : ‖T (baseVector (p-q))‖ ≤ 2*R`），差异层的总贡献 $2\sum_{j\in d}\text{scale}\,j\le 2\cdot 2R=4R$（`hd`，其中 `sum_scale_le` 用公比 $1000^{-1}$ 的几何级数，$1000/999$ 上取整成 $2$）。**注意这里用 $\sum r_j$（一次方、公比 $10^{-3}$），而 `Construction` 的覆盖部分用 $\sum r_j^2$（二次方、公比 $10^{-6}$）**——同一 `scale` 在两处被以不同幂次求和，1000 在两边都只需 $>1$。
4. `FinitePlacement.lean` —— 把上式与下式合成：

```lean
theorem dist_point_le_of_coordinate_bound (p q w w') (hR : 0 ≤ R) (hc : ∀ i, |point p w i - point q w' i| ≤ R) :
    dist (point p w) (point q w') ≤ 6 * R                       -- 把 T := LinearMap.id 塞进上一条！
theorem finite_placement (hB : ¬ FiniteDimensional ℝ B) (X : Finset RealL2)
    (hX : ∀ z ∈ X, z ∈ constructedSet) :
    ∃ T : RealL2 →ₗ[ℝ] B, ∀ x ∈ X, ∀ y ∈ X,
       dist x y / 6 ≤ dist (T x) (T y) ∧ dist (T x) (T y) ≤ 6 * dist x y
```

`dist_point_le_of_coordinate_bound` 的实现很漂亮：**它就是 `norm_map_point_sub_le` 在 $T=\mathrm{id}$ 时的特例**（`hT` 由 `lp.norm_single` 一行给出），从而"源空间的 $\ell_2$ 距离 $\le 6\sup_i|z_i|$"不需要 Pythagoras 与坐标个数，而由稀疏+几何衰减直接给出——**这正是"$S$ 的稀疏结构使 Auerbach 的弱下界够用"的机械解释**。下界方向则是 `hcoords : ∀ i, |(x-y) i| ≤ ‖T (x-y)‖`（`coordinateMap_lower`）代入同一引理。合成失真 $6\times6=36$。
5. `CoverTransfer.lean` —— `intrinsic_doubling_of_distortion36`：假设 `hd` 是失真 36 的双向界，结论是 `centers.card ≤ L ^ 8`。核心两行：`ambient_iterated_cover hS 8 (hp x) (div_pos hr ha)`（在源空间做 8 次半半径细分，半径 $r/a$）与

```lean
  have hbound : a * dist (p y) (p (chooseCenter ⟨z, hz⟩)) < r / 128 := by
    calc _ ≤ a * (dist (p y) z + dist (p (chooseCenter ⟨z, hz⟩)) z) := ...
      _ < a * (r / a / (2 : ℝ) ^ 8 + r / a / (2 : ℝ) ^ 8) := ...
      _ = r / 128 := by field_simp; ring
```

再 `(hd y ...).2`（上失真 36）+ `linarith` 得 $\mathrm{dist}(y,\text{center})<36r/128=0.28125\,r<r/2$。**指数 8 的机械理由（精确）**：需要 $2\Delta/2^n<1/2$，即 $2^n>4\Delta$；$\Delta=36\Rightarrow 2^n>144\Rightarrow n=8$（$2^7=128$ 失败）；$\Delta=2\Rightarrow 2^n>8\Rightarrow n=4$ —— **论文"$\lambda_0=\lambda^4$、Four halvings"与 Lean 的 $L^8$ 由同一条不等式决定**，差异全部来自 $2$ vs $36$。另注意 `chooseCenter` 用 `if hz : meets z then hz.choose else x`：**中心必须搬到 $Y$ 里**（intrinsic 要求），做法是"若该源球与像相交则取一个原像，否则退回 $x$"，这是 `Finset` 版本 `dite` 的典型手法。
6. `ClusterScales.lean` —— `clusterScale j := (1/2)^(j+1)`（与 `scale` 的 1000 底数无关，纯二进制），`cluster_norm_bound : ‖z‖ ≤ (101/100) * clusterScale j`（论文的 $1+\eta$，$\eta=1/100$ 逐字相同）、`cluster_separation : (97/200) * clusterScale i ≤ dist p q`（论文的 $(1/2-3\eta/2)=97/200$ 逐字相同）、`five_scales`（假设 `r/4 < scale j` 与 `scale j ≤ (400/97) * r`，结论 `s.card ≤ 5`；证明取 `min'` 后用 `clusterScale j ≤ clusterScale i / 32` 说明 `s ⊆ Icc i (i+4)`，因 $2^5=32>1600/97\approx16.5$ ⇒ 跨度 $\le4$ ⇒ 5 个）。**这三个常数与论文完全一致，说明 Lean 在这一段是逐字翻译。**
7. `ClusterPlacement.lean` —— `cluster_placement hB hS (X : Finset constructedSet) v hr`：输出 `f : X → B` 满足 `∀ x, dist (f x) (r • v) ≤ r / 100`、`DoublingAtMost (range f) (76800 ^ 8)`、以及尺度 `a` 使失真 36 双向界成立。即"把论文的 $T_j(X_j)\subset B(a_jv,\eta a_j)$ 直接参数化成 $r$-簇"。
8. `ClusterCover.lean` + `CompactUnion.lean` —— `ambient_doubling_clusters`（$K=\{0\}\cup\bigcup_j C_j$ 的 ambient doubling $\le 1+5L^2$；证明用 `eventually_atTop` 把"足够深的簇离 0 比 $r/4$ 还近"取出来，再 `Finset.range N` 过滤出**与 $B(x,r)$ 相交**且 `r/4 < clusterScale j` 的指标集 $I$，`five_scales` 给 $|I|\le5$，每簇贡献 $L^2$；`+1` 是极限点 0）、`compact_doubling_clusters`（把 ambient 版经 `doubling_iff_ambient` 转回 intrinsic，并同时输出 `IsCompact`）、`compact_shrinking_union`（`isCompact_of_finite_subcover`：取覆盖极限点的一个开元，得 $\varepsilon$-球，`hsmall` 给出尾部簇全落入其中，只剩 `Finset.range N`.biUnion C 这个有限并，逐簇取有限子覆盖）。**论文的"geometrically shrinking union + limit point adjoined is compact"在 Lean 里是开覆盖论证，不是序列紧致论证**——因为 Mathlib 的 `IsCompact` 定义就是开覆盖有限子覆盖，序列版本需要 `isCompact_metricSpace`/`tendsto_nhds` 一类转换。
9. `FiniteCompactness.lean` + `FiniteWitness.lean` —— cor:banach 里"有限证书 $X_j$"的来源：

```lean
theorem normalized_embedding_of_finite {X E} [MetricSpace X] [NormedAddCommGroup E] [ProperSpace E]
    (o : X) {A : ℝ} (hA : 0 ≤ A)
    (hfinite : ∀ s : Finset X, ∃ f : s → E, ∀ x y : s,
      dist x y ≤ dist (f x) (f y) ∧ dist (f x) (f y) ≤ A * dist x y) :
    ∃ f : X → E, ∀ x y : X, dist x y ≤ dist (f x) (f y) ∧ dist (f x) (f y) ≤ A * dist x y
```

证明：`Q := {f | ∀ x, f x ∈ closedBall 0 (A * dist o x)}` 用 `isCompact_pi_infinite`（Tychonoff）取紧；`C p := {f | 第 p 对坐标满足双边界}` 闭（`IsClosed` 由 `continuous` 的 dist 组合）；有限交性质由 `hfinite` 逐有限集提供；`hQ.inter_iInter_nonempty` 取出全局 $f$。**这就是论文"by compactness (Tychonoff) a locally-embeddable space embeds"的 Lean 实现，且它需要 `ProperSpace E`**（闭球紧），有限维自动满足。`finite_witness_of_no_embedding` 是其逆否 + `by_contra!`；`finite_witness k hA` 用 `no_scaled_embedding`（主线结果！）把 `$S$ 本身不可嵌入`转成`存在有限子集不可嵌入`，基点点取 `point 0 0`（`admissible_zero`）；`finite_witness_card` 再把基数抬到 $\ge2$（反证：若 $\le1$ 则常值映射即可，`Subtype.ext (Finset.card_le_one.mp ...)`）。
10. `FiniteTargets.lean` —— `euclidean_embedding_of_finite_dimensional`：把"$E$ 是任意有限维赋范空间"降到 `EuclideanSpace ℝ (Fin (Module.finrank ℝ E))`，用 `toEuclidean` 同构，$U:=\|e\|+1$、$V:=\|e^{-1}\|+1$，合成 $A=D\cdot U\cdot V$。**"+1" 是防 0 的技术性松弛**（保证 $U,V>0$ 且 $\ge1$），[推测：直接取范数也可，但会多出 `norm_ne_zero` 的旁支判断]。
11. `CompactBanach.lean` 的装配（94 行，`main` 一条）：`hS : AmbientDoubling constructedSet 76800`（由 `doubling_iff_ambient.mp constructedSet_cover`）→ `X_j := finite_witness_card ⟨(unpair j).1, (unpair j).2 + 1⟩`（**对角编码**：维度与失真上界打包进一个自然数）→ `v := exists_auerbach_vectors (ι := Unit)` 取一个单位向量（`hvunit` 用 `le_antisymm` 从 `‖v ()‖ ≤ 1` 与坐标下界导出 $=1$）→ `cluster_placement` 逐 $j$ 得 $C_j$ → `compact_doubling_clusters` 得 $K$ → 反证：给定 $K\to E$ 的嵌入，`euclidean_embedding_of_finite_dimensional` 转成 $g:K\to\mathbb{R}^{\dim}$（失真 $A$），取 $n>36A$，令 `j := Nat.pair (Module.finrank ℝ E) n`，则 $X_j$ 经 `intoK : X j → K` 与 $g$ 合成出一个失真 $\le(n+1)$ 的嵌入，与 $X_j$ 的"不可嵌入失真 $n+1$"矛盾。上界的合成是三行 `calc`：

```lean
      _ ≤ A * c * dist (f j x) (f j y) := hgg.2
      _ ≤ A * c * (36 * a j * dist x y) := mul_le_mul_of_nonneg_left (hd j x y).2 (mul_nonneg hApos hc.le)
      _ = (36 * A) * (c * a j) * dist x y := by ring
      _ ≤ ((n : ℝ) + 1) * (c * a j) * dist x y := ...   -- 36 * A ≤ n + 1
```

**$n>36A$ 与 $36A\le n+1$ 之间的这条缝就是"36"这个数在整条支线的唯一落点**，也是为什么 Lean 的指数翻倍。

## 4.5 论文句子 ↔ Lean 模块/定理对照表

| 论文（标签或原文短句） | Lean 位置 | 一致性判定 |
|---|---|---|
| Definition（doubling, intrinsic） | `Model.DoublingAtMost` | 完全一致（开球、中心 `Finset S`、$r/2$） |
| Definition（bi-Lipschitz，scale $a$、distortion $D\ge1$） | `Model.AdmitsBiLipschitzEmbedding` | 完全一致 |
| Theorem 1.1（thm:main） | `Main.main` | 一致；$\forall k,0<k$ 形式相同 |
| 集合 $S\subset\mathcal H$、$r_j=1000^{-j}$ | `Construction.constructedSet` / `scale` | 一致，下标平移 1 |
| $(N_j,W_j)$ 无穷 Often 遍历 | `Construction.colors/widthFactor` + `recurrent_parameters` | **改写**：双 `Nat.unpair` 显式编码 |
| $U_{j,i}=H_{j,i}\cup V_{j,i}$、$w_j\in\{0,r_ke_{j,i}\}$ 当且仅当 $p\in U_{j,i}$ | `Construction.allowed` / `admissible` / `inColoredStrip` | 一致；$0/i$ 用 $+1$ 偏移编码 |
| prop:doubling（常数 76800） | `Doubling.constructedSet_cover` ← `source_cover_of_label` | 一致；$76800=300\cdot16^2$ 在 Lean 里显式由 `Fintype` 基数算出 |
| "$\Omega_w$ 上 $F_w$ 是 $D$-Lipschitz" | `Derivatives.embeddingSheet_lipschitz`（$2D$） | **偏差**：因子 2（$L^\infty$ 基度量） |
| (eq:good) Rademacher + Lebesgue 好点 | `Derivatives.goodSheetPoint` + `ae_good_embeddingSheet` | 一致；$L^1$ 平均经 Mathlib 升级为 $L^2$ |
| $K=\overline{\{(\|F_x\|^2,\|F_y\|^2)\}}$ | `Derivatives.derivativeCompact` | 一致；含"非空"的具体见证 $w=0$ |
| lem:compact（limsup，无定量模） | `Extremal.near_lexicographic_maximum` + `lexicographic_affine_barrier` | **改写**：换成仿射屏障 $B+\varepsilon+C(A-p_1)$，$C=M/\delta$ |
| eq:variance 方差恒等式 | `Extremal.variance_identity` + `variance_le_of_moments` + `mean_deficit_le` | 一致（推广到任意概率空间） |
| 近极值选取（$n^{-4}/n^{-8}$） | `Energy.exists_nearmax_grid`（$\delta$ = 四项 min，误差 $t^2/4$） | **改写**：指数消失，换成显式 $\delta$ |
| prop:energy（各向异性估计） | `Energy.anisotropic_energy_bound` | **改写**：$t$ 参数化，系数 `horizontalCoefficient/verticalCoefficient` |
| "$n\to\infty$ 使能量 $\to0$" | `Energy.exists_energy_parameters` + `exists_small_energy_grid` | **改写**：$\forall\eta>0$ 的一次调度 |
| crossings：$h_i=(F_i-F)/r_j$、$\omega_n$ | `Crossings.exists_color_row/column` + `small_oscillation_of_weighted_energy` | **改写**：$\omega_n$ 换成 $\le r_j/8$ |
| $\sqrt2$ 分离 + $\omega_n$ 小 → 分离 $\ge r_j$ | `Crossings.exists_separated_family` 的 `hcentral`（$25/16<2$） | 一致 |
| $N\le(1+2D)^k$ 体积比较 | `Doubling.isCompact_exists_packing_bound` | **改写**：紧集 packing 界 |
| cor:lp（$L_p$ 归一化 Gauss 级数等距） | **不存在**（全目录无 `Lp`、无 Gauss 级数、无 `MeasureTheory` 的 $L_p$ 等距构造） | **未形式化** |
| cor:banach | `CompactBanach.main` | **改写**：Auerbach 代 Dvoretzky，$\Lambda=1+5(\lambda^8)^2$ vs $1+6\lambda^8$ |
| Figure 1 / 直觉图示 | 无对应 | 未形式化（正常） |

**cor:lp 未形式化是本次取证的一个实质发现**：论文第 4 节（tex 行 ~408–443 之前）的 $L_p$ 推论只有一条 `normalized Gaussian series isometry $J_p$` 与常数 $c_p=(\mathbb E|g|^p)^{1/p}$，而 Lean 目录里连 `Lp` 或 `MeasureTheory` 的相应构造都没有（支线全部在 `NormedAddCommGroup`/`lp (fun _ : ℕ => ℝ) 2` 层面）。这与 JSON 的 `solution_module` 只指 `Main` 一致：$L_p$ 是"免费推论"，不在任务范围。笔记写作时应避免把 Lean 说成"覆盖了 cor:lp"。

## 4.6 七处结构性分歧及其机械原因

1. **Auerbach 取代 Dvoretzky（支线）**：失真 $<2\to\le6$（搬运）$\Rightarrow\le36$（与簇放置合成），于是半数次数 $4\to8$、$\lambda_0=\lambda^4\to\lambda^8$、$\Lambda=1+5\lambda_0^2$ 的指数 $8\to16$。全部数值差异由 $2^n>4\Delta$ 一条公式解释。收益：不需要维度阈值、不需要引用 Dvoretzky/COO。
2. **体积比较 $\to$ 紧集 packing 界**：论文用 $\mathbb{R}^k$ 中"$N$ 个两两 $\ge r$ 的点必须落在半径 $D$ 球内 ⇒ $N\le(1+2D)^k$"（球体积比）。Lean 用 `isCompact_exists_packing_bound`：紧集上任何固定正分离族的基数有上界，**不提 $(1+2D)^k$**。机械原因：Lean 只需"$N$ 可以任意大 ⇒ 矛盾"，具体上界用不上；而且 $(1+2D)^k$ 需要 $D,k$ 的实数幂运算与球体积公式（Mathlib 里体积公式的可用性远不如紧性）。代价：Lean 版本对"维度如何进入上界"完全沉默，**因此无法回答"多快失败"这类定量问题**——这正是论文里被刻意保留而形式化里被丢弃的信息。
3. **limsup $\to$ 仿射屏障（主线核心分歧）**：见 4.3.9。论文明说"不需要定量模"，Lean 却发现"给一个斜率 $C$"几乎免费（`lexicographic_affine_barrier` 12 行），于是把整个后续估计改成 $t$ 的显式线性函数。**结果是把论文的"$n\to\infty$ 的两级极限"完全消解成一次算术调度（`exists_energy_parameters`）**。这条分歧是"形式化促进理解"的最强样本：它表明该 limsup 引理的证明内容其实是一个 Lipschitz 型的屏障（斜率 $M/\delta$），而论文没有点出。
4. **序列 $\to$ 有限调度**：论文按 $n=1,2,\dots$ 取层 $j_n$、$\varepsilon_n$、$N_n$；Lean 全程以"任意 $\eta>0$ +  prescribed $N$"为参数（`exists_small_energy_grid hf N hN hη`），最终矛盾用 `bound+1` 一次取得。机械原因：`Filter.Tendsto` 型陈述在 Lean 里需要额外管理"哪个量趋于 0"，而反证法只需"存在一个足够小的值"，$\eta$-形式更短。代价：**失去了"收敛速度"的一切信息**，包括论文里 $n^{-4},n^{-8},n^{-9}$ 的指数层级。
5. **$N_j$ 与 $W_j$ 在 Lean 里独立**：论文为简化取 $N_n=W_n=n$；Lean 通过 `recurrent_parameters N W` 保留两个独立参数，并且**只在 `exists_energy_parameters` 里调度 $W$**（$1/W$ 项），$N$ 只作为 crossings 的分离点个数（`colors j = N`）。[取证：这说明形式化揭示了"$n$ 的双重角色其实可以拆开——一个当分离点数 $N$，一个当条带宽 $W$；论文的 $n^2$ 权重是 $W^2$ 而非 $N^2$，见 4.3.10 对 `combinedEnergy` 的取证。这是一处**形式化反过来澄清论文**的地方，笔记值得重点写]
6. **sheet 的全局 Lipschitz 扩张**：论文从不扩张 $F_w$（只在 $\Omega_w$ 内工作）；Lean 必须 `globalSheet`（`exists_lipschitz_extension_finiteDimensional` + `.choose`），因为 `intervalIntegral` 与逐线 FTC 要求函数在整条线上有定义。用 `.choose` 固定选择 ⇒ 需要 `Classical.choice`；所有下游只靠 `globalSheet_eqOn` 把导数换回真实值。风险：扩张常数 $L$ 未知 ⇒ 但下游只用 `∃ L` 的存在性（`globalSheet_lipschitz`），且真正 sharp 的界来自 `embeddingSheet` 的 $2D$（域上），故**未污染最终常数**。
7. **$\sqrt2$ 被写成 2（贯穿主线的所有 $D$ 因子）**：`Base := ℝ × ℝ` 带 $L^\infty$ 范数 ⇒ `point_dist_sameTuple_le` 给 $\mathrm{dist}_{\mathcal H}\le2\,\mathrm{dist}_{\text{Base}}$（真实比值 $\sqrt2$）⇒ `embeddingSheet_lipschitz` 是 $2D$ ⇒ $K\subseteq[0,(2D)^2]^2$、`hu hv : ‖u‖,‖v‖ ≤ 2D` ⇒ `horizontalCoefficient = 4+8D(2D+1)`、`verticalCoefficient = 4+2C+8CD+8D(2D+1)`。**论文的 $D$ 因子在 Lean 里一律是 $2D$**，因此 `Energy` 的两个系数不能与论文逐项对齐（论文给的是渐近率 $O(D)t$ 级别，未定系数）。[推测：形式化者可能有意选择 $L^\infty$ 的 `Base`，因为 `Segment`/`Rectangle` 的逐线限制在 $L^\infty$ 乘积范数下与坐标轴的 `dist` 比较更省事；代价就是全链的 $2$ 噪声]

## 4.7 tactic 卡点与绕行手法（统计 + 现场证据）

对整个目录（`wc -l` 4664 行）做 tactic 词频统计（`grep -ow` 整词计数，含出现在注释里的同名英文词，故为"上界式"近似），得到如下分布：

```
have 500 | rw 191 | simp 145 | obtain 114 | refine 67 | simpa 62 | nlinarith 52 | linarith 47
classical 41 | positivity 37 | omega 33 | dsimp 32 | exact_mod_cast 32 | ring 26 | norm_num 21
filter_upwards 21 | choose 18 | ext 13 | field_simp 12 | by_contra 11 | abel 9 | gcongr 5
push_cast 5 | integral_mono 4 | convert 2 | simp_all 1
```

另有 `omit [...]` 32 处、`noncomputable`（section/def）47 处、属性标注共 **13 处**（`@[simp]` 12 处：`Construction.lean` 100/102/104/114/117/120/124/205/208 与 `CoordinateSupport.lean` 11/18/23；`@[ext]` 1 处：`Grids.lean:172` 的 `Segment.ext`）、`set_option`（含 `maxHeartbeats`）**0 次**、`#print axioms` **0 次**。据此可归纳出七类真实卡点：

1. **多项式常数是主战场，`nlinarith` 带 witness 列表。** `nlinarith`(52)+`linarith`(47) 超过 `simp` 用量，且常显式喂事实：`nlinarith [sq_pos_of_pos hr]`（`Crossings.hcentral` 的 $(5/4)^2<2$）、`nlinarith [dist_nonneg ..., sq_pos_of_pos ht]`（`point_dist_lt_half`）、`nlinarith [hx.1, hx.2]`（`ColorBlock.column_color` 的 floor/条带定位）、`have ht2 : t ^ 2 ≤ t := by nlinarith`（`Energy` 里 $t\le1$ 的唯一使用）。**机械含义**：本题绝大多数"论文一句话"其实是一个带平方的小不等式，Lean 把它们全部显式化，于是每个常数都留下 witness 痕迹，可直接用于第五节的常数表核对。
2. **`NNReal` 与实数的双向换算。** `D : NNReal` 是 `LipschitzWith` 的标准类型，而估计里要 $(D:\mathbb R)$、`(2 * (D : ℝ)) ^ 2`、`D.coe_nonneg`、`NNReal.coe_mul`、`⟨D, le_trans zero_le_one hD⟩`（`no_scaled_embedding` 里手工把实数失真装回 `NNReal`）。`exact_mod_cast`(32) 主要用于把 `ℕ` 的基数/正性穿过到 `ℝ`（`colors j`、`widthFactor j`、`(N : ℝ) ^ 3`），典型：`have hNR : (0 : ℝ) < N := by exact_mod_cast hN`、`have hWR : (0 : ℝ) < widthFactor j := by exact_mod_cast widthFactor_pos j`。
3. **a.e. 与 null 集管理：`filter_upwards`(21) + 自建接口。** 论文"忽略条带边界"在 Lean 里必须是 `Q.y.ae_of_ae (ae_inColoredStrip_stripColor ...)`、`Segment.ae_mem`、`Measure.ae_ae_of_ae_prod`（`Integration.ae_line_derivative_x`）、`hvalues.mono`。绕行的两个自建件是 `IsBoundedField`（把可测+有界打包，提供 `.sub/.const/.norm_sq/.comp_measurable/.select/.integral_fst/.integral_snd`）与 `Segment.law := (length)⁻¹ • volume.restrict (Ioc lo hi)`（配 `instance IsProbabilityMeasure`）。[取证：选 `Ioc` 而非 `Icc` 是为了 `volume_Ioc` 与端点 null 一次性解决；`ae_mem : ∀ᵐ x ∂I.law, x ∈ Ioo lo hi` 就是为此而生的引理]
4. **选择公理的"钉死"用法：`classical`(41) + `choose`(18)。** `globalSheet` 定义为 `(exists_lipschitz_extension_finiteDimensional ...).choose`；`sourceBase/sourceTuple` 用 `Classical.choose` 从子型证明里取坐标；`cover_of_finite_code` 里 `representative i hi = Classical.choose ...`；`Crossings` 里 `choose y hy hyo using fun i => exists_color_row ...`（同时钉住值与两条性质）；`chooseCenter` 用带证明的 `dite`。**这正是"论文用紧性/子序列、Lean 用有限证书"在 tactic 层的指纹**：所有"取一个"都必须落成 `choose`/`Classical.choose`。
5. **精确 `simp only` 纪律。** `simpa`(62) + `simp only [...]`(大量) 且列表写得很长，如 `simp only [integral_add, integral_const_mul, integral_sub, integral_const, probReal_univ, one_mul]`、`simp only [Prod.dist_eq, Real.dist_eq, max_lt_iff, derivativePair]`、`simpa only [mem_closedBall, dist_zero_right]`。**含义**：本题大量使用 Mathlib 的积分/测度化简规则，全局 `simp` 极易走偏（`simp_all` 全目录只用 1 次即为证据），因此形式化采取"逐条列出规则"的写法。这类长列表本身就是"哪个定理的哪一条 simp 被真正用到"的取证线索。
6. **端点/闭包的语言切换。** 论文的"由连续性到端点"被做成专用引理 `norm_le_on_Icc_of_Ioo`（docstring "Endpoint bounds on an open real interval extend to its endpoints by continuity"）；$K$ 的近似用 `Metric.mem_closure_iff` 而非序列；紧致性用 `isCompact_of_finite_subcover`（开覆盖）而非列紧；`exists_isMaxOn` 代替"取最大"。⇒ 形式化选择的是**拓扑/测度语言**，不是序列语言，这与论文正文的 $\varepsilon$–$\delta$ + 子序列混用相比更"拓扑"。
7. **无性能妥协的痕迹，但有一处 `decide`。** 没有 `set_option`（`maxHeartbeats` 自然也是 0 次）、没有 `native_decide`、`convert` 只 2 次；`@[simp]` 只有 12 条且全落在最小构造件（`admissible 0`、`tupleVector 0`、`coordinate j i ≠ 0/1`、`entryVector` 的两条分裂）上，`@[ext]` 只有 `Segment.ext` 一条——即" simp 集只登记真正会反复用到的构造等式"，没有把 Mathlib 式属性铺开。全目录唯一的 `decide` 在 `Doubling.lean:253`：`simp only [Fintype.card_coe, cells, Int.card_Ico]; decide`，用于把有限方格数算成具体整数，是内核可复核的封闭判定，不是外挂 SMT 后门。说明整个 4664 行是"手工结构化证明"。[推测：这与比较任务的可复核要求有关——每题要用同一套 lint/axiom 检查跑通，重型 tactic 会拖慢验证]

## 4.8 形式化状态总评（供笔记写"取证结论"用）

- **完整性**：`Main.lean` 的 `main` 已证，链路完整，无 `sorry`、无 `admit` 战术（全目录唯一的字符串 `admit` 是 `Doubling.lean:100` docstring 里的英文动词"admit a finite upper bound"，非 tactic）、无自定义 `axiom`；允许公理恰为 Mathlib 默认三件 `propext`、`Quot.sound`、`Classical.choice`（`Classical.choice` 的实质用途见 4.7 第 4 条；`propext`/`Quot.sound` 来自 Mathlib 内部，本题无特殊用法可指认）。[取证：目录内 `#print axioms` 出现 **0 次**，因此 permitted_axioms 无法从源码静态确证，此处依据仅为"无 `axiom` 声明、无 `native_decide`"；若要严格断言需实际运行 `#print axioms OAI.DoublingHilbert.main`，本素材未执行编译]
- **覆盖范围**：主线（构造 + doubling + 解析核心 + 不可嵌入）与 cor:banach 都被形式化；**cor:lp 未被形式化**；论文的图示、直觉段落、历史综述段落无对应物（正常）。
- **与论文叙述的一致性判定**：定义层逐字一致；构造层一致（两处改写：$(N_j,W_j)$ 编码、下标平移）；引理层结构性一致但**量化方式不同**（三处：limsup→仿射屏障、序列→$\eta$ 调度、体积→紧 packing）；常数层因 $L^\infty$ 基度量而系统性放大 $2$；支线因 Auerbach 而失真 $2\to36$、$\Lambda$ 指数 $8\to16$。
- **可直接写进笔记的"形式化洞见"三条**：
  1. `Energy.exists_energy_parameters` 的 docstring "**The order of choices is essential**" 是论文"参数层级"论述的机器化确认——论文说"先取 $n$ 大、再取 $m$ 更大"，Lean 说"$C\Rightarrow W\Rightarrow t$"，两者一致，但 Lean 揭示了真正被依赖的是 $W^2$ 与 $1/W$ 的对抗，而不是 $n$ 的单一增长。
  2. `Extremal.integral_second_le_barrier` 的 docstring "**unlike a limsup statement, this keeps all quantitative data**" 是对论文 lem:compact 的一句直接评论：该引理的 limsup 形式并非必需，仿射屏障形式同样可证且更强。
  3. `Crossings.small_oscillation_of_weighted_energy` 的 docstring "**The horizontal weight cancels exactly against the longer period side**" 把论文里"$n^2$ 权重与长边 $N\cdot W\cdot r$ 相消"的口头解释压缩成一行 `field_simp; ring` 的代数恒等式，是理解各向异性设计的最短路径。

---

# 五、常数与参数表

约定：论文位置给 `main.tex` 行号（该行可在 `build/main.tex` 直接核对）与式标签；Lean 位置给 `文件::定理名`。"敏感度"指**改动该数值后论证在哪一步失效**，未标明者表示改动只影响常数大小、不影响正确性（并给出理由）。

## 5.1 主表

| 数值 | 论文位置 | Lean 位置 | 作用 | 敏感度 / 改动崩溃点 |
|---|---|---|---|---|
| $76800=300\cdot 16^2$ | 行 48（thm:main 陈述）、行 116（prop:doubling 证明首句） | `Doubling::source_cover_of_label` 结论 `≤ 76800`；`Doubling::constructedSet_cover`；`Model::DoublingAtMost` 的 `bound`；`Main::main` | 整个定理的 doubling 上界，是"可验证整数"而非渐近记号 | 只是上界，改大仍成立；改小需重算三个因子（见下三行）。**论文行 116 直接把乘式写出**，说明作者知道它可替换 |
| $300$ | 行 116（"至多 300 个中间层标签"类表述） | `Doubling::nearbyLabels_card : (nearbyLabels c j).card ≤ 300`，作为 `source_cover_of_label` 的假设 `hcard : labels.card ≤ 300` | 中间尺度层上 tuple 值的可能个数 = 基点附近竖条 + 横条 + 无位移 | 真实计数是 $1+131+131=263$；300 是向上取整。**改为 263 完全安全**，改为 $<263$ 会卡在 `admissible_mem_nearbyLabels` |
| $131$（=65+65+1） | 论文未给（论文只做"至多 $\sim 2t/\text{width}+2$ 的口头估计） | `Doubling::nearbyStripIndices`（`Icc (⌊c/width⌋-65) (⌊c/width⌋+65)`）与 `nearbyStripIndices_card = 131`；docstring "an interval shorter than 128 strip widths" | 半径 $t$ 球的坐标投影（长度 $2t$）所触及的条带数上界 | $128=2\cdot64$ 是硬需求（$2t<128\,$width），$\pm65$ 留 3 的余量；改成 $\pm64$ 会在 `mem_nearbyStripIndices` 的 `nlinarith`（floor 两端各 1 的余量）失败 |
| $16=2\cdot8$ | 行 116（"$16^2$"） | `Doubling::coordinateCell`（`⌊8(x-(c-t))/t⌋`）+ `coordinateCell_mem ∈ Ico 0 16` + `abs_sub_lt_of_coordinateCell_eq : \|x-y\|<t/8`；`source_cover_of_label` 里 `cells := Finset.Ico 0 16` | 每坐标轴把长度 $2t$ 的区间切成宽 $t/8$ 的 16 格；两轴 ⇒ $16^2$ 个基底格子 | 16 与 $t/8$、$t/2$ 三者绑定：同格 ⇒ 每轴差 $<t/8$，两根 + 细尾 $=(17/512)t^2<t^2/4$ ✓ 余量巨大；若改 8 格（$t/4$）则 $(2+2+1)\cdot(t/4)^2\cdot?\,$——实际会因尾项系数而需重算，**目前 8 的选择纯粹是为了"数得清"** |
| $64$（$t/64<\text{scale}\,j$） | 行 116 附近证明段 | `Doubling::admissible_mem_nearbyLabels` 假设 `hj : t / 64 < scale j`；`Construction::fine_tail_le` 假设 `∀ j ∈ s, scale j ≤ t/64`；`point_dist_lt_half` 假设 `hlarge : ∀ j, t/64 < scale j → w j = w' j`；`constructedSet_cover` 的 `by_cases hmid : ∃ j, t/64 < scale j ∧ scale j ≤ t` | 定义"中间尺度"的下端，同时给出细尾 $\sum r_j^2$ 的上界 | **双重用途**：一是保证"每坐标至多一个中间层"（需底数 $>64$，见下一行），二是尾项 $\le t^2/1024$。$64$ 与 $8$ 之间是刻意留的大余量（$0.0333<0.25$），改成 $32$ 仍成立、改成 $\le 8$ 会卡在 `point_dist_lt_half` 的 `nlinarith` |
| $1000$（$r_j=1000^{-j}$） | 行 85："Put $r_j=1000^{-j}$" | `Construction::scale j := (1000 : ℝ)⁻¹ ^ (j+1)`；`scale_succ : scale (j+1) = scale j / 1000`；`sum_scale_sq_le`（公比 $1000^{-2}$）、`SparseCoordinates::sum_scale_le`（公比 $1000^{-1}$） | 层级几何衰减，保证 $\sum_j r_j$、$\sum_j r_j^2$ 都 $\le 2\max$ | **真正被"用掉"的唯一位置是 $1000>64$**（`intermediate_unique`：区间 $(t/64,\,t]$ 内至多一个 $r_j$）。次级要求 $1000>1$（两次几何求和的 $1/(1-q^\alpha)<2$）。[推测：1000 只是"看起来像工程常数"的取巧值，任何 $\ge 65$ 的整数都可行；论文未述选择理由] |
| $2$（$\sqrt2$ 的粗化） | 论文无（论文用 Euclidean 基度量，因子为 $D$） | `Construction::point_dist_sameTuple_le : dist (point p w) (point q w) ≤ 2 * dist p q`；`Derivatives::embeddingSheet_lipschitz`（$2D$）；`derivativePair_bounds : Icc (0,0) ((2D)^2,(2D)^2)`；`Energy::anisotropic_energy_bound` 的 `hu hv : ‖u‖,‖v‖ ≤ 2 * D` | 让 `Base := ℝ × ℝ` 的 $L^\infty$ 范数与 $\ell_2$ 源距离可比 | 真实比值 $\sqrt2$；Lean 用 `nlinarith` 走 $\Delta x^2+\Delta y^2\le 2\,\mathrm{dist}^2$ 后再上取整为 $2$。**全链 $D\to2D$ 的唯一源头**，改不动（除非把 `Base` 改成 `EuclideanSpace ℝ (Fin 2)`） |
| $n^{-4}$ | 行 216–217：$0\le A-\|u\|^2<n^{-4}$，$\|B-\|v\|^2\|<n^{-4}$ | `Energy::exists_nearmax_grid` 输出 `A - ‖u‖^2 ≤ t`、`B - ‖v‖^2 ≤ t`（$t$ 由 `exists_energy_parameters` 决定） | "近字典极值"的松紧度 | 论文要求 $n^2\cdot n^{-4}\to0$，即指数 $>2$；$n^{-4}$ 不是唯一选择。Lean 完全丢弃指数信息，只保留"$t$ 充分小" |
| $n^{-8}$（$=(n^{-4})^2$） | 行 221：$\langle\|F_x-u\|^2+\|F_y-v\|^2\rangle_{Q^0}<n^{-8}$；行 227：$Nnr_j<\frac{l\,n^{-8}}{100}$；行 231：`eq:Qerror` $<4n^{-8}$ | `Energy::exists_nearmax_grid` 的 `show 0 < t ^ 2 / 4` 与 `hbaseu/hbasev : ... ≤ t ^ 2` | 基底矩形上的平均误差 | **$n^{-8}=(n^{-4})^2$ 是"平方误差"量纲的必然**：能量是范数平方，所以 $L^2$ 误差是"点误差"的平方。Lean 里对应 $t^2$ vs $t$（`hnearu : A - ‖u‖^2 ≤ t` 与 `hbaseu : ... ≤ t^2`），并由 `ht2 : t^2 ≤ t`（需 $t\le1$）把两者合并 |
| $4$（修剪放大因子） | 行 231 `eq:Qerror`：$<4n^{-8}$ | `Rectangles::integral_le_four_of_subset`（结论 `≤ 4 * ∫`）；`Energy::exists_nearmax_grid` 里 `hGu/hGv` | 从"好的小矩形 $Q^0$"迁到"完整周期网格 $Q$"时的平均损失 | 精确来源 $|Q^0|/|Q|\le 2\cdot2$（每维长度减半）。**与 `exists_grid_inside` 的输出 `I.length / 2 ≤ ...` 是同一常数的两面**；若改用一维修剪则因子为 2 |
| $100$（行 227 的 $l n^{-8}/100$） | 行 227 | `Energy::exists_nearmax_grid` 的 `δ := min (Q.x.length/(4*N*W)) (min (Q.y.length/(4*N)) (min (t*Q.x.length/2) (t*Q.y.length/2)))` | 保证层级 $r_j$ 相对矩形尺寸"足够细"，从而容得下 4 个完整周期 | 论文的 100 是随手取的松弛；Lean 用 $4NW$、$4N$ 的精确形式（来自 `xPeriod = N·W·r_j < L_x/4`）。**注意 Lean 里没有 100 的对应物**——它把"细"的条件直接写成周期 $<L/4$ |
| $Nn r\times N r$（周期块尺寸） | 行 229、320、324、337；图注行 362（`$Nnr$`） | `SelectedSheets::stripWidth/xPeriod/yPeriod`；`Crossings::ColorBlock.x_length = (colors j) * widthFactor j * scale j`、`y_length = (colors j) * scale j` | 块宽 $=$ 色数 $\times$ 横条宽，块高 $=$ 色数 $\times$ 竖条宽（各向异性的具体形状） | $n$（即 $W_j$）出现在**长边**，故 $n^2$ 权重与之相消（见 $1/64,1/8$ 行）；若把权重移到 $N$ 而非 $W$，`small_oscillation_of_weighted_energy` 的 $n$ 对消会失败 |
| $n^2$ 权重 / $\langle\cdot\rangle$ 的加权 | 行 255："The factor $n^2$ compensates for horizontal segments of length $Nnr$" | `Energy::combinedEnergy := (widthFactor j)^2 * horizontalEnergy + verticalEnergy` | 把水平方向的"长边优势"计入能量，使 crossings 的行/列选择用同一标尺 | 权重必须是 $W^2$（长度比的平方）；Lean 用 $W_j^2$ 显式化了"为什么是平方"，**比论文 $n^2$ 的记号更清楚** |
| $N>(1+2D)^k$ | 行 ~340（crossings 命题的阈值） | **无对应**：Lean 用 `Doubling::isCompact_exists_packing_bound` 取抽象 `bound`，再 `bound + 1` | 保证 $\mathbb{R}^k$ 里半径 $D$ 球装不下 $N$ 个 1-分离点 | 论文此处依赖 $\mathbb{R}^k$ 的体积比较；Lean 换成紧性 ⇒ **丢失 $(1+2D)^k$ 的全部定量信息**（见 4.6 第二项）。这是两处叙述的实质不等价点 |
| $2Dr/L_x$、$2D/n$、$2Dr/L_y$ | 行 263、283、301 | `SelectedSheets::horizontalColumn_mean ≤ 2 * D * scale j / Q.x.length`；`verticalColumn_x_mean ≤ 2 * D / widthFactor j`；`verticalColumn_y_mean ≤ 2 * D * scale j / Q.y.length` | 三条"新 sheet 导数均值 $\approx$ 旧 sheet 导数均值"的界 | 形状是 $\mathrm{disp}/\mathrm{width}=(D r)/(W_j r_j)=D/W_j$ ⇒ 论文的 $2D/n$ **其实是 $2D/W_j$**（$W_j=n$ 的特例）；Lean 明确保留 $W_j$，暴露该界与"色数 $N$"无关 |
| $(1+4D)n^{-4}$、$4D^2 r/L_x$ | 行 269 | 对应 `Energy::anisotropic_energy_bound` 水平支的 $t+4D(2D+1)t$ 结构（配合 `hu`） | 单点方差 + 均值误差合成的水平二阶矩 | 论文用 $D$、Lean 用 $2D$，故 Lean 的系数 $4+8D(2D+1)$ **不能逐项对应**；结构（"常数 + $D$ 的线性/二次项"$\times t$）一致 |
| $\frac{4D^2}{25N}n^{-7}$、$8n^{-6}$ | 行 274（`eq:Hrate` 的中间行） | 无逐项对应（Lean 为 `horizontalCoefficient D * t`） | 论文把各误差源逐项累加，$1/(25N)$ 来自把矩形长边写成 $Nnr$ 后的除法 | [核对：$4D^2/(25N)\cdot n^{-7}$ 比精确值 $2D^2/(25N)\cdot n^{-7}$ 大 2 倍，属安全方向的松弛；$8n^{-6}$ 来自 $4n^{-8}$ 修剪与 $2n^{-4}$ 均值误差的乘积展开] |
| $\frac{4D^2}{n}\to0$ | 行 291（`eq:eta`） | 对应 `16 * C * (D : ℝ) ^ 2 / (widthFactor j : ℝ)` | 水平能量与"水平方向上竖直导数"的耦合项，唯一带 $1/W$ 的项 | **这是必须 $W\to\infty$ 的唯一原因**（`exists_energy_parameters` 里 $W>64CD^2/\eta$）；若该项不随 $W$ 衰减，整个调度失效 |
| $\omega_n=N\sqrt{2N\varepsilon_n}\to0$ | 行 342 | `Crossings::small_oscillation_of_weighted_energy`（结论 `s ≤ r / 8`，取 $\eta=1/(64N^3)$） | 沿行/列把 $h_i$ 从交点运到 $p_i$ 的最大漂移 | 论文需 $N\sqrt{N\varepsilon_n}\to0$，即 $\varepsilon_n=o(N^{-3})$；Lean 直接把 $\eta$ 设成 $1/(64N^3)$。**$64=8^2$、$n^3$ 的机械理由见 $1/64$ 行**；$\sqrt{\ }$ 与 $N$ 的幂次全部由 `field_simp; ring` 的那条恒等式锁定 |
| $\sqrt2$（交点分离） | 行 365（图注）、375 | `Grids::globalSheet_separation_sq : 2 * scale j ^ 2 ≤ ‖·‖^2`（即 $\sqrt2 r_j$） | 两个不同颜色在同一层给出两个正交坐标，各贡献 $r_j$ | **纯 Pythagoras**：$r_j^2+r_j^2=2r_j^2$；若每层允许多个非零坐标（论文不允许），$2$ 会变成别的数。Lean 把 $L^2$ 形式留在证明里（`pow_le_pow_left₀`），避免开方 |
| $\sqrt2-2\omega_n>1$ | 行 375 | `Crossings::hcentral`（`scale j ≤ ‖h i (p i) - h m (p m)‖`）+ 反证里的 `5 * scale j / 4`、`nlinarith` | 漂移后仍保持至少 $1$ 个尺度的分离 | 具体阈值：$(1+2\cdot\tfrac18)^2=\tfrac{25}{16}<2$ ✓。**振荡上界 $r/8$ 的容许范围**是 $2(1/8)<\sqrt2-1$（约 $0.414/2=0.207$，即 $<0.207r$），$1/8=0.125$ 有余量；若退化为 $3/8$ 则 $(11/8)^2=1.89<2$ 仍勉强可行，**但 $r/2$ 就彻底失败**（$2^2=4>2$） |
| $1$（归一化分离下限） | 行 375 右侧、以及 packing 论证中的单位分离 | `Crossings::exists_separated_family` 结论 `1 ≤ dist (z i) (z m)`；`Main::no_normalized_embedding` 里 `isCompact_exists_packing_bound ... (show (0 : ℝ) < 1 by norm_num)` | 把 $z_i$ 用 $r_j^{-1}$ 归一后，分离恰好 1 | 与"半径 $D$ 球"配套：任何固定正数都行（缩放 $r_j$ 即可），**1 只是选择**；但它同时是 `z` 的界 $\|z i\|\le D$ 的来源，故 1 与 $D$ 的比是实质内容（$D$ 越大越能装更多点 ⇒ `bound` 越大 ⇒ 需要的 $N$ 越大） |
| $D\ge1$ | Definition（论文）/ `AdmitsBiLipschitzEmbedding` 的 `hD : 1 ≤ D` | `Model::AdmitsBiLipschitzEmbedding`（`∃ D : ℝ, 1 ≤ D`）；`Main::no_scaled_embedding`（`(hD : 1 ≤ D)`，用于 `⟨D, le_trans zero_le_one hD⟩ : NNReal`） | 不失一般性地假定失真 $\ge1$ | Lean 里它还兼任"能装进 `NNReal`"的技术角色 |
| $a_j=2^{-j}$、$\eta=1/100$ | 行 455 | `ClusterScales::clusterScale j := (1/2)^(j+1)`；`ClusterPlacement::cluster_placement` 的 `dist (f x) (r • v) ≤ r / 100` | 簇的几何收缩半径与簇内松半径 | $1/100$ 与论文完全一致（Lean 逐字照搬）；$2^{-(j+1)}$ 与论文 $2^{-j}$ 差一次平移（同 `scale` 的处理） |
| $101/100$、$101/400$ | 行 459 附近、行 467：$\|z_B\|\le(1+\eta)a_j\le\frac{101}{400}r<\frac r2$ | `ClusterScales::cluster_norm_bound : ‖z‖ ≤ (101/100) * clusterScale j` | 深簇足够靠近 0（$\le r/2$） ⇒ 与 $x$ 的距离可忽略 | $101/400<1/2$ 是硬算术（$0.2525$），松弛极大；论文用 $1/2$ 处余量把"$|I|\ge2$ 时 $a_i\le 400r/97$"的推导做干净 |
| $97/200$ | 行 459 附近（分离）；行 481 | `ClusterScales::cluster_separation : (97/200) * clusterScale i ≤ dist p q` | 相邻两簇的点至少相距 $(1/2-3\eta/2)a_i$ | $97/200=0.485$ 来自 $1/2-3/200$，**系数 3** 是"$\eta$ 的两端误差 + 中心距离 $a_i-a_{i+1}=a_i/2$"的合并；与论文逐字一致 |
| $400/97$、$1600/97<32$、"至多 5 个尺度" | 行 481 | `ClusterScales::five_scales`（假设 `r/4 < scale j`、`scale j ≤ (400/97) r`，结论 `s.card ≤ 5`；证明用 `clusterScale j ≤ clusterScale i / 32` 得 `s ⊆ Icc i (i+4)`） | 限定同时与 $B(x,r)$ 相交的簇的个数 | $1600/97\approx16.49\in(16,32)$ ⇒ 二进制跨度 $\le 4$ ⇒ 5 个。**该区间是"卡死的"**：若比值 $\ge32$ 就得到 6 个尺度，$\Lambda$ 的 $5\to6$；若 $<16$ 则 4 个。论文与 Lean 都是 5，一致 |
| $\lambda=76800$、$\lambda_0=\lambda^4$ | 行 422、445（"Four halvings ... at most $\lambda^4$ $S$-balls of radius $R/16$"） | `CoverTransfer::intrinsic_doubling_of_distortion36`（结论 `≤ L ^ 8`）；`ClusterPlacement` 输出 `DoublingAtMost (range f) (76800 ^ 8)` | 簇内 doubling 常数 = 源的 doubling 经若干次半半径细分 | **指数规则：需 $2^n>4\Delta$**，$\Delta=2$（Dvoretzky）$\Rightarrow n=4$；$\Delta=36$（Auerbach $6\times6$）$\Rightarrow n=8$（$2^7=128<144$ 失败）。Lean 的 $8$ 精确由 `CoverTransfer` 里 `r / 128` + `36` + `linarith` 三行锁定 |
| $\Lambda=1+5\lambda_0^2\le1+6\lambda^8$ | 行 485–487 | `ClusterCover::ambient_doubling_clusters`（结论 `1 + 5 * L ^ 2`）；`CompactBanach::main`（`1 + 5 * (76800 ^ 8) ^ 2`） | 紧致并 $\{0\}\cup\bigcup_jC_j$ 的 universal doubling 常数 | 结构完全一致：$5$ 来自 `five_scales`、$L^2$ 来自"每簇两次半半径细分"、$+1$ 来自极限点 $0$。差异：Lean **不做** $5\to6$ 松弛，但因 $\lambda_0=\lambda^8$ 而最终指数 $16$（论文 $8$）。$n>36A$ 与 `36 * A ≤ (n : ℝ) + 1` 的对角线缝在 `CompactBanach::main` 行 59–89 |
| $n>36A$（对角编码取 $N$） | 论文未给具体不等式（用"取远大于失真的 $N$"） | `CompactBanach::main`：`obtain ⟨n, hn⟩ := exists_nat_gt (36 * A)`；`j := Nat.pair (Module.finrank ℝ E) n` | 让合成失真上界 $\le(n+1)$，与见证 $X_j$ 的"不可嵌入失真 $n+1$"矛盾 | $36$ 必须是簇放置的失真；换成 Auerbach 的 6 则缝更紧。**这是 Lean 版比论文多出的一处显式算术** |
| $c_p=(\mathbb E\|g\|^p)^{1/p}$ | cor:lp 段（行 ~390–408） | **未形式化** | 归一化 Gauss 级数 $J_p:\ell_2\to L_p[0,1]$ 的等距常数 | 论文未述最优性；形式化缺席 ⇒ 笔记若讨论须标明"仅论文有" |
| `horizontalCoefficient D = 4+8D(2D+1)` | 论文无（只写 $\to0$ 的率） | `Energy::horizontalCoefficient` | 水平能量 $\le$ 系数 $\times t$ | 由"2（平方三角）+ 2（均值误差系数）+ $2D$（$\|u\|$ 界）+ $(2D+1)$（均值定位）"机械拼成；**$D$ 大时是 $16D^2$ 阶**，故 $t$ 需 $\ll1/D^2$ 才能压能量 ⇒ 论文里被 $n\to\infty$ 吸收 |
| `verticalCoefficient D C = 4+2C+8CD+8D(2D+1)` | 论文无 | `Energy::verticalCoefficient` | 竖直能量里的 $t$ 项系数 | 唯一含 $C$（屏障斜率 $=M/\delta$）的系数；$C$ 可任意大（$\delta$ 不可控），因此**必须**先把 $W$ 定下来再定 $t$（$K$ 含 $W^2\cdot\text{horiz}+\text{vert}$）⇒ docstring "order of choices is essential" 的数值根源 |
| $2\varepsilon$（屏障余量） | 论文无（lem:compact 的 limsup 里是 0） | `Energy::anisotropic_energy_bound` 结论首项；`exists_energy_parameters` 里写作 `2 * (η / 8)` | 把 limsup 换成仿射屏障时付出的固定代价 | 只要 $\varepsilon<\eta/8$ 即可，**是纯粹的技术税**；论文不需要它是因为它用了极限语言 |
| $W>\max(1,\,64CD^2/\eta)$、$t=\min(1,\eta/(4K))$ | 论文无（对应"取 $n$ 足够大"） | `Energy::exists_energy_parameters` 证明首两行 | 两个参数的显式调度 | $64=4\times16$：$16CD^2/W<\eta/4\Leftarrow W>64CD^2/\eta$ ✓；$t$ 的 $4$ 是把 $Kt$ 压到 $\eta/4$。**$W$ 必须先于 $t$**，因为 $K\propto W^2$ |
| $\eta=1/(64N^3)$（能量阈值） | 论文的 $\varepsilon_n$ 需 $=o(N^{-3})$（以 $\omega_n\to0$ 表述） | `Crossings::exists_small_energy_block` 调用处 `show 0 < 1 / (64 * (N : ℝ) ^ 3)` | 让振荡 $\le r/8$ | 与 `small_oscillation_of_weighted_energy` 的 `he : e ≤ 1/(64*n^3)` 同一数；改大 $N$ 幂次只会更宽松，改小则崩（$n^2$ 边长 $\times n$ 需要 $\ge 64n^3$ 的抵消） |
| $t^2/4$（好点矩形误差） | 论文的 $n^{-8}$ | `Energy::exists_nearmax_grid` 里 `show 0 < t ^ 2 / 4` | 预留修剪因子 4 | 与 `integral_le_four_of_subset` 精确配对 ⇒ $4$ 不可任意改（若修剪损失是 $4$，这里必须 $\le t^2/4$） |
| `δ = min(4 项)` | 论文的 $Nnr_j<ln^{-8}/100$ | `Energy::exists_nearmax_grid`（见上 $100$ 行） | 同时保证"细"（4 个周期）与"薄"（$r/L\le t$） | 四个分量各服务一个下游条件；**去掉任一个**，`exists_grid_inside`（需 period $<L/4$）或 `hrx/hry`（需 $r/L\le t$）失效 |
| `1 + 5 * L ^ 2` 中的 $L^2$ | 论文"$\lambda_0^2$" | `ClusterCover::ambient_doubling_clusters` | 每簇贡献的覆盖数（两次半半径细分） | [推测：对应"先半半径细分一次选出与目标球相交的簇内中心，再细分一次得 $r/2$ 覆盖"；未在 tex 中逐字出现] |
| `76800 ^ 8`（簇的 doubling） | 论文 $\lambda^4$ | `ClusterPlacement::cluster_placement` 输出；`CompactBanach::main` 中 `hCdouble : DoublingAtMost (C j) (76800 ^ 8)` | 支线全部后续估计的输入 | 与 $n>36A$、$\Lambda$ 的指数联动；若 Auerbach 的失真降到 $<2$，该指数立即回到 $4$ |

## 5.2 常数的三个家族（写作时的组织建议）

- **家族 A：可计算性驱动（覆盖族）** $76800,300,263,131,\pm65,16,8,64,1000$。它们的存在**只为了把 prop:doubling 变成一个整数**，内部自由度极大（$263\to300$、$131$ 的 $+3$ 余量、$64$ 与 $8$ 之间的平方级余量）。家族 A 里唯一"刚性"的是 $1000>64$（中间层唯一性）。论文的 $r_j=1000^{-j}$ 与 Lean 的 `scale j = 1000^{-(j+1)}` 差一格平移。
- **家族 B：调度族（极限的替身）** $n^{-4},n^{-8},4n^{-8},n^{-9}/(50N),Nn r\times Nr,n^2,\omega_n,\varepsilon_n$（论文侧）↔ $t,\eta,W,C,\varepsilon,\delta,t^2/4$（Lean 侧）。这一族体现论文与形式化的**最大方法论差异**：论文用"$n\to\infty$ 的两级极限"，Lean 用"$\forall\eta>0$ 的一次调度"。指数 $n^{-8}=(n^{-4})^2$、$n^2$ 权重 $=W^2$、$\varepsilon_n=o(N^{-3})$ 这三条在 Lean 里分别变成 $t^2$ 与 $t$ 的量纲差、`(widthFactor j)^2`、`1/(64*N^3)`。
- **家族 C：几何刚性族（真正不可改的）** $2$（$\sqrt2$ 的 Pythagoras 分离）、$1/8$ 与 $5/4$ 与 $25/16<2$、$97/200$、$101/100$、$1600/97\in(16,32)$、$2^n>4\Delta$（$\Delta=2\Rightarrow n=4$；$\Delta=36\Rightarrow n=8$）、$n>36A$、$\Lambda=1+5\lambda_0^2$。**这一族才是数学内容**：每一项都有"改了就崩"的具体崩点（见上表）。[笔记写作建议：第二部分重构时以家族 C 为骨架，把家族 A/B 作为"松弛证据"穿插，最能体现"作者在何处放松、何处必须紧"]

一个贯穿三族的观察：**"松弛"与"刚性"在本文里是分层出现的**——覆盖族（A）几乎全是松弛（因为目标只是有限性），调度族（B）的指数关系有半刚性（$n^{-8}$ 必须是 $n^{-4}$ 的平方、$\varepsilon_n$ 必须 $o(N^{-3})$），几何族（C）完全刚性（$\sqrt2$、5 个尺度、$2^n>4\Delta$）。Lean 形式化把这三层的边界照得清清楚楚：它在 A 层照抄论文的松弛（300、16²），在 B 层把松弛换成显式参数（$t,\eta,W$），在 C 层给出了比论文更精确的算术（$25/16<2$、$r/128$ 与 36）。







