# D26 加倍 Hilbert 子集：我怎样把 Lang–Plaut 反例做成一条微分流水线

对象论文：*A doubling Hilbert subset with no finite-dimensional bi-Lipschitz embedding*（OpenAI，2026-09-25）。
TeX 源：`E:\math\preprints\A-doubling-Hilbert-subset-with-no-finite-dimensional-bi-Lipschitz-embedding-September-25-2026\build\main.tex`，单文件自包含（无 `\input`，正文加参考文献共 560 行），引文位置一律标成 `tex:55` 这样的行号，可在该文件逐行核对。
Lean：`E:\math\lean\OAI\Geometry\DoublingHilbert\`，28 个 `.lean` 文件；按 `wc -l` 合计 4664 行，这是素材当前的唯一口径（早期草稿曾误报 27 个文件 / 4819 行，素材已订正，第 12 节按 28/4664 对账）。挑战配置 `E:\math\lean\ComparatorChallenges\DoublingHilbert.json`；`E:\math\lean\formalization.yaml` 第 87 行条目。
素材：`E:\math\研究笔记\素材\DoublingHilbert-素材.md`（20.5 万字节，§一定理总览、§二逐引理重构 2.1 到 2.10、§三叙事时间线、§四 Lean 取证 4.1 到 4.8（含 4.3 的 12 个小节与 4.6 的七处结构性分歧）、§五常数表 5.1 与 5.2）。本笔记按素材章节顺序逐节展开，素材的每条公式、行号与英文原句都进入终稿；我引用前已在 tex 里逐条复核过。

记号与论文一致：$\langle h\rangle_E=|E|^{-1}\int_E h$ 是 $E$ 上的面积平均（tex:74-79 的 Conventions 段原文照抄进第 1 节）；$r_j=1000^{-j}$；$(N_j,W_j)$ 是预先固定、无穷遍历时，$N_j$ 是第 $j$ 层颜色数、$W_j$ 是竖条宽倍率。有一处我读素材时反复回头核对：论文把"色数"与"条带宽"在反证阶段同时记作 $N$ 与 $n$（tex:69：`use a recurring level with $(N_j,W_j)=(N,n)$`），而 Lean 侧 `colors j = N` 与 `widthFactor j = W` 是两个独立调度的参数，论文散文里的单个 $n$ 在机器里其实是 $W$。这个疑点挂到第 12 节的第五处结构性分歧才彻底解开。凡从文本反推而论文未明说的判断，我都标 [推测]；素材已标 [推测] 的，我沿用其证据强度，不升级成事实。

## 0 我进场时手里有什么

先摆问题。Lang 和 Plaut 的问句，tex:40 原文：

> "Lang and Plaut asked whether every doubling subset of Hilbert space admits a bi-Lipschitz embedding into some finite-dimensional Euclidean space; see \cite[Question 2.4]{LP}, restated in \cite[Question 1]{NN}. Gupta, Krauthgamer, and Lee independently formulated the question in the context of algorithmic dimension reduction \cite[Section 6, Question 1]{GKL}. The hypothesis already supplies a Hilbert-space realization, so the issue is whether a bound on metric covering complexity permits a reduction to finitely many Euclidean coordinates while preserving all distances up to a fixed factor."

两个基础定义也摆在门口（tex:33-38），后面所有量化都对着它们核对：

```tex
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

我把定义里的三个量化细节先钉住，因为它们决定反例的合法形状。其一，覆盖用的半半径球**球心必须在 $X$ 内**（intrinsic covering，"with centers in $X$"）；后来 Lean 的 `DoublingAtMost` 用 `Finset S` 把这条编成类型（第 12 节）。其二，半径减半是字面的"half its radius"。其三，尺度 $a$ 是存在量词、写在 distortion $D$ 前面，而 $k,D$ 只要求"某个有限值"。于是 Lang–Plaut 问的是：doubling 能不能推出**存在**某个 $k$ 和某个（可以任意大但有限的）$D$。要做反例，一个集合 $S$ 必须对**所有** $(k,D)$ 同时失败。这就引出全文第一设计约束，tex:113 那句我后来在三个不同位置重读到它（113、72、246）：

> "Neither $S$ nor its defining parameters will subsequently depend on a proposed embedding."

固定集原则。$S$ 连同 $(N_j,W_j)$、$r_j$ 在反设嵌入存在之前就定义死；反证阶段每一轮只能从 $S$ 里**挑**尺度，不能**造**尺度。第 1 节会看到 $(N_j,W_j)$ 的无穷遍历就是这个"挑"的接口。

进场时的已知版图，正面一侧（tex:42 逐字）：

> "Assouad's theorem gives a positive result after changing the metric: every doubling metric space admits such an embedding for the distance $d^\alpha$, where $0<\alpha<1$ \cite{Assouad}. This operation is called \emph{snowflaking}. Naor and Neiman proved that, when $\alpha$ is close to $1$, the target dimension can be bounded in terms of the doubling constant alone, independently of $\alpha$ \cite[Theorem 1.2]{NN}. The distortion bound still depends on the snowflake exponent. For finite Hilbert subsets, Gottlieb and Krauthgamer obtained embeddings of snowflakes with distortion arbitrarily close to one, with dimension depending on the doubling constant, exponent, and permitted distortion \cite[Theorem 1.2]{GK}. The Lang--Plaut question concerns the original distance $d$, even when arbitrary finite dimension and distortion are allowed."

术语说明：snowflaking（雪花化）指把度量替换为 $d^\alpha$（$0<\alpha<1$），它总是把距离结构变得更"松"，因而更容易嵌入欧氏空间。Assouad 定理说任何 doubling 空间经雪花化后可嵌入某个 $\R^k$；Naor–Neiman 把目标维数改进到只依赖 doubling 常数。但"原始距离"对应 $\alpha=1$，恰在这一步断掉。tex:42 那句 "The distortion bound still depends on the snowflake exponent" 我读进场时的第一反应是：能不能让 $\alpha\uparrow1$ 取嵌入序列的极限？这条极限路线我一开始认真想过，它的死因写在下文第 1 节 (d)1：distortion 界在 $\alpha\to1$ 时一致发散，且映射族没有可取极限的一致结构。

负面一侧，$p>2$ 已经有人（tex:44 逐字）：

> "For exponents $p>2$, Lafforgue and Naor constructed doubling subsets of $L_p$ admitting no bi-Lipschitz embedding into any finite-dimensional Euclidean space \cite[Theorem 1.1]{LN}. Independently, Bartal, Gottlieb, and Neiman obtained dimension-reduction obstructions for doubling subsets of $\ell_p$ using thin Laakso configurations \cite{BGN}. Baudier, \'Swi\k{e}cicki, and Swift later gave an elementary proof of the corresponding fixed-set theorem for $\ell_q$, $q>2$ \cite[Theorem 1]{BSS}. These results concern ambient exponents strictly greater than two and do not settle the Hilbert case. Schioppa announced a negative answer in \cite{Schioppa}, but withdrew the preprint after reporting a possible issue with its duality argument."

这段里有两个我要省掉的东西。第一，"$p>2$" 这一侧的全部机制都靠环境指数的几何：BGN 靠 thin Laakso 配置在 $\ell_p$（$p>2$）里的距离几何，论文明写这类结果 "concern ambient exponents strictly greater than two"。而 $\ell_2$ 有平行四边形恒等式，树状配置的超度量增益在 $\ell_2$ 里被抹掉 [推测，机制理由见第 2 节 (d)3]，所以 BGN 的组合分枝路线进不了 Hilbert。第二，Schioppa 事件：宣布否定答案、撤回，撤回理由只有一句 "a possible issue with its duality argument"（对偶论证出的问题）。技术细节论文未述（第 11 节未述清单第 3 条）。我从这一句读出的信号是刻意的武器库替换 [推测]：全文不用对偶、不用超平面分离，只用二维 Euclidean 微分、一个二次方差恒等式、面积比较与体积打包。这个"低技术武器库"的选择要到第 4 节 lem:compact 处才能看出代价与好处。

我的目标位置因此是三样都要：固定集、原始距离（$\alpha=1$）、源恰在 Hilbert 里。主定理（tex:47-49，`\label{thm:main}`）：

```tex
\begin{theorem}\label{thm:main}
There is a fixed subset $S$ of real $\ell_2$, equipped with its induced Hilbert
distance, whose doubling constant is at most $76800$ and which admits no
bi-Lipschitz embedding into $\R^k$ for any positive integer $k$, at any finite
distortion.
\end{theorem}
```

紧跟的推论句（tex:50）："In particular, dimension and distortion bounds depending only on the doubling constant cannot hold for all doubling Hilbert subsets." 摘要（tex:28）给的是更强的 Banach 版声明，比主定理多两件事（紧致性与任意无限维 Banach 空间）：

> "Every infinite-dimensional real Banach space contains a compact doubling subset that admits no bi-Lipschitz embedding into any finite-dimensional real normed space. The doubling constant has a universal bound, independent of the ambient Banach space. This answers the Lang--Plaut problem negatively, even for compact subsets of Hilbert space."

所以论文的成品是三层：thm:main（Hilbert 反例，第 1 到 8 节处理）、cor:lp（同一度量空间经 Gauss 级数等距搬进每个 $L_p$，第 9 节）、cor:banach（紧版本进任意无限维 Banach，第 10 节）。摘要把 Banach 版放在最前面宣传，而正文的戏肉全在 thm:main；我在第 10 节末会记一笔这个"宣传重心与劳动分布的错位"。

构造的一句话版本，先建立直觉再进细节：$S$ 是 $\mathcal H=\R^2\oplus\bigoplus_{j\ge1}\R^{N_j}\cong\ell_2$ 里的点集 $(p,w)$，底座 $p\in\R^2$，尾巴 $w$ 有限支撑，第 $j$ 层坐标只能取 $0$ 或 $r_je_{j,i}$，且取 $r_je_{j,i}$ 当且仅当 $p$ 落在第 $j$ 层第 $i$ 色的横条或竖条里（横条宽 $r_j$、竖条宽 $W_jr_j$，周期着色用 $N_j$ 种色）。它是"平面加一层层稀疏的正交小尾巴"：尾巴尺度以 1000 倍速分离，任意球里至多一层"中间尺度"活跃，于是 doubling；每一活跃层在平面上刻出一个 $Nnr\times Nr$ 的周期棋盘，任何双 Lipschitz 嵌入想同时保住横、竖两个方向的导数分离就会导出极值矛盾，于是装不进任何 $\R^k$。与 Assouad 型定理的拼图关系：Assouad（及 Naor–Neiman 的维数改进）说 doubling 空间雪花化后可嵌入某 $\R^k$；本文说 $\alpha=1$ 且源住在 Hilbert 里时结论可以整体失效。doubling 常数 76800 是固定集 $S$ 的统一上界、与 $k,D$ 无关；障碍的形态是"$k,D$ 任意但先固定后，$S$ 的某一层（依赖 $k,D$ 与遍历参数对 $(N,n)$）必然击穿嵌入"。

全文机制，tex:55 自述一句话："The proof couples a covering argument with a derivative obstruction."（覆盖论证与导数障碍相耦合）覆盖部分只花 tex:118-135 的 18 行，导数障碍是全部戏肉。[推测] 这也解释了 Lean 侧文件体量的分布：`Doubling.lean` 只有一个大命题（287 行），而能量/交叉链条拆成 Energy/Extremal/Crossings/Grids/Rectangles/SelectedSheets/Derivatives/Integration 八个中大型模块（第 12 节逐个数）。

依赖图（从素材抄录并核对过 tex 行号），第 1 到 10 节沿这张图走，第 11 到 13 节做取证与收尾：

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
  thm:main + 紧致性论证 ⇒ 每对 (k,A) 存在 S 的有限子集无 k=j 维 distortion≤j 嵌入
  有限维 Dvoretzky（distortion<2）把 X_j 放进任意无限维 Banach B 的收缩簇 C_j⊂B(a_j v, ηa_j)
      └─► K_B={0}∪⋃C_j 紧、doubling ≤ Λ=1+6λ⁸（λ=76800, λ₀=λ⁴）、无任何有限维目标嵌入
```

还有一条贯穿性纪律，我在第 6 节会正式命名它为"变量绑定链"：量化顺序是 $k,D\prec N\prec n\prec j$。先固定嵌入参数 $k,D$，再取超过打包容量的色数 $N$（eq:N），再让 $n\to\infty$ 驱动收敛，最后每个 $n$ 到 $S$ 里挑一个足够细的循环层 $j$。链条里任何一环倒置，构造就会自指（$S$ 反过来依赖嵌入），而那被 tex:113 禁止。

本笔注叙事对应的论文目录为 preprints/A-doubling-Hilbert-subset-with-no-finite-dimensional-bi-Lipschitz-embedding-September-25-2026，在 .tools/lean_queue.txt 队列第 16 行号（按题名逐字匹配登记，本行只补登记、不改前文）。

## 1 定义层：参数序列、空间与集合 $S$

对应素材 2.1，tex:85 到 113。参数与空间的原文（tex:85-89）：

```tex
Fix, once and for all, a sequence $(N_j,W_j)_{j\ge1}$ of pairs in $\N^2$ in
which every pair occurs infinitely often. For example, concatenate the finite
lists $\{1,\ldots,m\}^2$ for $m=1,2,\ldots$. Put $r_j=1000^{-j}$ and let
\[
 \mathcal H=\R^2\oplus\bigoplus_{j\ge1}\R^{N_j}
\]
be the Hilbert direct sum. This is isometric to real $\ell_2$. Let $e_{j,i}$,
$1\le i\le N_j$, denote the coordinate vectors in its $j$th summand.
```

第 $j$ 层着色：横条 $\{(x,y):qr_j<y<(q+1)r_j\}$（$q\in\mathbb Z$）按 $q\equiv i-1\pmod{N_j}$ 染色得 $H_{j,i}$；竖条 $\{(x,y):qW_jr_j<x<(q+1)W_jr_j\}$ 同法染色得 $V_{j,i}$；$U_{j,i}=H_{j,i}\cup V_{j,i}$，tex:103 特意补一句 "In particular, $U_{j,i}$ is open."。集合定义（eq:set，tex:105-113）：

```tex
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

Conventions 段（tex:74-79）：

```tex
Write $\N=\{1,2,\ldots\}$. In the proof of Theorem~\ref{thm:main}, all norms
are Euclidean or Hilbert norms. For a Lipschitz map $F$ on an open subset of
$\R^2$, write $F_x,F_y$ for its derivative columns, defined almost everywhere.
For an integrable function $h$ on a set $E$ of positive finite area, write
\[
 \langle h\rangle_E=\frac{1}{|E|}\int_E h.
\]
```

这一层没有证明，但每个成分都在给后面的论证埋钩子。我逐条拆（对应素材 2.1(b) 的六点）：

1. **$(N_j,W_j)$ 无穷遍历**是"固定集、变动尺度"技巧的接口。证明段里一旦需要某一层同时具有 $(N_j,W_j)=(N,n)$（$N$ 固定、$n$ 任意大），总能找到支撑之外、尺度足够小的 such 层。具体使用点 tex:225-228："Choose a level $j$ beyond the finite support of this sheet such that (N_j,W_j)=(N,n)... Infinite recurrence of each pair permits this choice." 注意"beyond the finite support"：选的层必须在当前 sheet 尾巴的支撑之外，否则加了 $re_{j,i}$ 会破坏 sheet 的合法性。
2. **$N_j$ 与 $W_j$ 的分工**：$N_j$ 控制颜色数（横竖各自周期为 $N_j$），$W_j$ 控制竖条相对横条的宽度倍率。能量估计时横方向线长 $=Nnr$（长加在 $W$ 上）、竖方向线长 $=Nr$；$n$ 只加宽竖条而不加多颜色。这样水平导数误差被 $n^2$ 放大后仍趋于 0（因为除以的条宽也是 $nr$ 级），垂直方向则靠 $n$ 变宽条带得到 $1/n$ 收敛（eq:Vxmean）。若只有单层参数（比如 $W_j\equiv N_j$），"线长增长"与"条纹变宽"就无法分开调节，见 (d)2。这是 Lean 侧把两参数保留为独立的伏笔（第 12 节分歧 5）。
3. **$r_j=1000^{-j}$ 指数分离**保证两件事：球半径 $t$ 附近"粗层坐标全冻住、细层总直径小、中间层至多一个"（第 2 节 doubling 证明的三句话全部依赖它）；以及选层时可把周期块尺寸 $Nnr$ 压到任意小（$l\cdot n^{-8}/100$ 以下，eq:fine）。
4. **$e_{j,i}$ 互相正交且正交于底座平面**：层间距离平方相加。同层不同色两点 $(p,r_je_{j,i})$、$(p,r_je_{j,m})$ 距离恰为 $r_j\|e_{j,i}-e_{j,m}\|=\sqrt2\,r_j$（tex:369-371 的"distance exactly $\sqrt2\,r$"），这正是第 8 节交叉分离的几何来源。
5. **$U_{j,i}$ 开、零选择总允许**：sheet 定义域 $\Omega_w=\bigcap_{j:w_j\ne0}U_{j,i_j}$ 是有限开集之交， hence 开集，Rademacher 定理需要开集上的 Lipschitz 映射。零选择总允许意味着 $(p,0)\in S$ 对全平面成立，即底座平面完整躺在 $S$ 里（tex:141："Since $S$ contains the base plane with all displacement coordinates zero, it cannot embed into $\R^0$"），这是整套二维微分机器的地基。
6. **"independently at each level"**：各层选择互不约束，尾巴是逐层有限选择的乘积结构，距离 $=\sum_j\|w_j-w'_j\|^2$，tail 估计 (eq:tail) 才能逐层放缩。

常数的机械理由（素材 2.1(c) 全保留，最优性论文未述、敏感度是我按链条重算的 [推测]）：

- **1000**：尺度分离倍率 $g$。约束链（与第 2 节合并推导）：$g>64$（中间层唯一性，`intermediate_unique` 的算术核心）、$g^2>2$ 级别（tail 几何和 $\frac{1}{1-g^{-2}}\le2$，实际极松）。取 $1000=10^3$ 使 $g^{-2}=10^{-6}$ 恰好写进 (eq:tail) 的 $\frac{2}{1-10^{-6}}$。改 $g=10<64$：半径 $t$ 的球里会有 $\approx\log_2 64\approx6$ 个中间尺度层同时活跃，标签数从"300"爆炸成每层约 300 的六层组合，doubling 界不再是这个常数。改 $g=100$：$100>64$ 仍可行，tail 常数 $\frac{2}{1-10^{-4}}$ 几乎不变。所以 **1000 并非临界值，是留裕度的圆整选择**；真正临界的是 $g>64$。[推测] 选 1000 可能还为了 eq:fine 里 "$Nnr_j<l\,n^{-8}/100$" 的 $1/100$ 显得顺，但严格说 $j$ 足够大时任意 $g>1$ 都能满足那一条，所以 1000 纯粹是 doubling 侧与美观的联合选择。
- **$\{1,\dots,m\}^2$ 拼接式列举**：确保每个 $(N,n)$ 出现无穷多次；列举方式与后续论证完全解耦，论文只用到"无穷出现"这一性质，示例仅演示存在性。
- **$\sqrt2$**（层内异色距离）：两个标准正交向量之差的范数。Crossings 端用 $\sqrt2>1$ 与 $\omega_n\to0$ 拼出 $\sqrt2-2\omega_n>1$。若 $e_{j,i}$ 不归一（比如取 $r_je_{j,i}/2$），分离降为 $\sqrt2/2$，打包目标"$N$ 个两两距离 $>1$ 的点"要改成别的归一化，$D$ 球半径与 $N>(1+2D)^k$ 全链条系数重写。[推测]
- **零选择包含边界**：横竖条都定义为严格不等式（开条），边界点（如 $y=qr_j$）不属于任何 $H_{j,i}$。若不允许零选择，$S$ 在边界线上缺 sheet，$\Omega_w$ 交出的区域碎片化，底座不再"几乎整个平面"，第 6 节"足够大的方块 $Q^0$"就没了着落。

候选失败路线（全部 [推测]，论文未述任何尝试史；素材 2.1(d) 三条）：

1. **沿 Assouad 取 $\alpha\to1$ 极限**。Assouad 给 $(S,d^\alpha)$ 嵌入，想让 $\alpha\uparrow1$ 的极限给出 $(S,d)$ 嵌入。失败机制：Naor–Neiman 的 distortion 界在 $\alpha\to1$ 时一致趋于无穷（tex:42 明写 "The distortion bound still depends on the snowflake exponent"），且嵌入映射族没有可取极限的一致 Lipschitz 结构。第 8 节 (d)3 会补一条更锋利的对应：交叉论证的每一步都在 $\alpha=1$ 的加法结构上成立，$d^\alpha$ 下全线崩塌，障碍精确停在 $\alpha=1$，与 Assouad 定理（$\alpha<1$ 可行）互补成整块拼图。
2. **单参数周期棋盘（$W_j\equiv1$）**。横竖条同宽，则近极值选择场 $G_V^x$ 的平均窗口 $nr$ 无法独立于颜色数 $N$ 增大，eq:Vxmean 的 $2D/n$ 项退化，$\eta_n\to0$（eq:eta）失败，"先压 $\|G_V^x\|^2\to A$ 再用 lem:compact"的垂直链条断在第一环。这是双参数 $(N_j,W_j)$ 必须分层的机制性原因。[推测，基于第 7 节估计结构]
3. **尾巴取无穷支撑**。若允许 $w$ 有无穷多非零层（比如每层都取 $r_je_{j,i_j}$），tail 距离 $\le(\sum_j r_j^2)^{1/2}<C\cdot r_1$ 不再随观察半径 $t\to0$ 收缩到 $t/32$ 比例，第 2 节覆盖论证里"细坐标自动进同一组"失效，分组必须同时记录无穷多个中间尺度的选择，球数不再是有限常数。尺度分离与有限支撑两者缺一不可。[推测]

## 2 doubling 上界：三层坐标分组机器（prop:doubling）

对应素材 2.2，tex:115-135。陈述（tex:115-117）：

```tex
\begin{proposition}\label{prop:doubling}
The doubling constant of $S$ is at most $300\cdot16^2=76800$.
\end{proposition}
```

证明是一台"粗层冻结、中间唯一、细层整体小"的三层分组机器，我按 tex:119-134 逐步推。

**步 1（粗层冻结）**。$r_j>t$ 的层。tex:119 第一句 "Distinct choices of $w_j$ have distance at least $r_j$."：同层两个不同选择的坐标距离，$0$ 对 $r_je_{j,i}$ 是 $r_j$，$r_je_{j,i}$ 对 $r_je_{j,m}$（$i\ne m$）是 $\sqrt2r_j$，都 $\ge r_j>t$。半径 $t$ 开球内两点若在某粗层选择不同，距离就超过 $t$，矛盾。所以球内所有点在这些层与球心坐标一致，粗层自由度数 $=0$。

**步 2（中间层唯一）**。窗口 $t/64<r_j\le t$。相邻 $r$ 之比 $1000>64$，窗口对数长度 $\log_{1000}64<1$，故至多一个层 $j^*$ 落入（tex:121 "There is at most one intermediate level satisfying $t/64<r_j\le t$, since consecutive radii have ratio $1000$."）。该层可选标签数：球投影到每个底座坐标是长 $2t$ 的区间；横条宽 $r_{j^*}>t/64$，区间骑跨的条数 $\le\lfloor 2t/r_{j^*}\rfloor+2\le129$（严格不等式 $2t/r_{j^*}<128$ 给 floor $\le127$，加 2 是边界补偿）；竖条宽 $W_{j^*}r_{j^*}\ge r_{j^*}$ 同理 $\le129$。颜色 $i$ 可用当且仅当 $p\in H_{j^*,i}\cup V_{j^*,i}$，非零标签 $\le129+129=258$，加零得 tex:121 的原话 "fewer than $300$ available labels, including zero"。中间层自由度数 $\le300$。

**步 3（细层整体小）**，(eq:tail)（tex:124-129）逐字：

```tex
 \sum_{r_j\le t/64}\norm{w_j-w'_j}^2
 \le 2\sum_{r_j\le t/64}r_j^2
 \le\frac{2}{1-10^{-6}}\left(\frac{t}{64}\right)^2
 <\left(\frac{t}{32}\right)^2.
```

我核对第一个 $\le$ 的系数：每层贡献 $2r_j^2$，上限给不出 $4r_j^2$。每层取值要么 $0$ 要么长度 $r_j$ 的正交基向量，两者之差的范数平方 $\le r_j^2+r_j^2=2r_j^2$（最坏情形 $i\ne m$ 时恰等，$0$ 对 $r_je_{j,i}$ 时只有 $r_j^2$）。几何级数：$\sum_{r_j\le t/64}r_j^2=(t/64)^2\sum_{k\ge0}1000^{-2k}=(t/64)^2\frac{1}{1-10^{-6}}$。最后一步 $<(t/32)^2$ 等价 $\frac{2}{1-10^{-6}}<4$ 即 $1-10^{-6}>\frac12$。细层总贡献小于半径 $t/32$。

**步 4（分组覆盖）**。tex:130：取含投影的边 $2t$ 方，切成 $16^2$ 个边 $t/8$ 小格（"assigning their boundaries arbitrarily"，边界点任意指派）。按（小格，中间层标签）分组：组内粗层同、中间层同、底座差 $\le\sqrt2\,t/8$（方格对角线）、细层差按 (eq:tail) $<t/32$，总距离 tex:131-133：

```tex
 t\sqrt{\frac{2}{64}+\frac{1}{1024}}=\frac{\sqrt{33}}{32}t<\frac t2
```

对账：$(\sqrt2\,t/8)^2=2t^2/64=32t^2/1024$，尾项平方 $(t/32)^2=t^2/1024$，和 $33t^2/1024$，开方 $\sqrt{33}/32\approx0.180<0.5$。tex:134："Choosing one point from each nonempty group as a center gives the required cover by balls in $S$." 关键收尾：直径 $<t/2$ 的组自动被"组代表为心的 $t/2$ 开球"覆盖，且球心可在 $S$ 内选（每组非空），这正好喂给定义的 intrinsic 版本。$\blacksquare$

常数的机械理由（素材 2.2(c)，逐项）：

- **64（中间窗口下界 $t/64$）**：双重职能。职能一：tail $<(t/32)^2$ 需要 $\frac{2}{1-10^{-6}}(t/b)^2<(t/32)^2$，即 $b>32\sqrt{2/(1-10^{-6})}\approx45.26$；$b=64$ 有余量。职能二：条数 $\lfloor2t/r_j\rfloor+2<2b+2$，标签总数 $<2(2b+2)+1=4b+5$；$b=64$ 给 $261<300$。取 $b=48$：勉强过职能一，职能二变 197，常数更小但裕度薄；取 $b=32$：职能一崩，分组直径失控。**可行窗口是 $b\in(45.3,\,g)$（$g=1000$），64 是窗口内圆整**。[推测：论文未讨论]
- **$16^2$（格子数）**：格边 $t/8$，对角 $\sqrt2t/8\approx0.177t$；直径预算 $t/2$ 减尾项后几乎全给底座，$0.177t$ 极宽裕。改 $8^2$（边 $t/4$，对角 $0.354t$）：平方和 $2/16+1/1024\approx0.126<0.25$ 仍过，doubling 可压到 $300\cdot64=19200$；改 $4^2$（边 $t/2$，对角 $0.707t$）崩。[推测：论文未讨论最优格子数，16² 大概率纯粹图干净]
- **300**：只是 259（即 258 加零）的圆整上界。它直接进入 $76800=300\cdot256$；在 cor:banach 里被复用为 $\lambda$，$\lambda$ 的幂塔式放大对基数并不敏感（universal 就够）。
- **"$+2$"（条数估计边界项）**：区间无论怎么摆放，覆盖它的开条数最多 $\lceil2t/r_j\rceil$；写成 $\lfloor\cdot\rfloor+2$ 是对开条边界的粗化保险，写 $+1$ 会在区间恰好骑跨三条缝时失效。[推测]

候选失败路线（[推测]，素材 2.2(d)）：

1. **较小的固定分离比或慢衰减尺度**。$g=2$ 时窗口 $(t/64,t]$ 含约 6 层中间尺度，需同时记录 6 层标签，每层 $\sim4b$ 个选项，覆盖数 $\sim260^6$，仍是有限常数（固定 $g$、固定窗口时 doubling 总成立），真正的危机在另一半：$g$ 太小时 $\sum_{r_j\le t/b}r_j^2$ 与 $t^2$ 之比不消失，分组直径失去 $<t/2$。$g$ 必须同时胜过窗口深度与 tail 几何和两个要求。若尺度衰减慢到窗口对数长度随 $t$ 无界（比如 $r_j=j^{-\alpha}$），doubling 直接崩。
2. **Heisenberg 式构造（Carnot 群球）**。Heisenberg 群带 Korányi 度量是 doubling 且已知不能双 Lipschitz 进任何 $\R^k$（欧氏维 vs Hausdorff 维、Pansu 导数）。但它是齐性空间，作为度量空间不能等距放进 Hilbert：Lang–Plaut 题目要求源是 Hilbert 子集、度量来自 $\ell_2$。次黎曼维数机制与 Hilbert 内蕴度量不相容，根本进不了题目假设。论文正文未提 Heisenberg；此路线失败是我的结构性外推 [推测]。
3. **Laakso 树状分枝直接搬**。Laakso 空间（论文在 tex:55 引用于 "separated branches force an increase in stretch"）是 doubling、Ahlfors 正则、不支持 Poincaré，其非嵌入性是逐层分枝 stretch 无界型障碍，阻碍的是满足 Poincaré 的目标空间类；而 Laakso 自身度量来自图上的最短路径度量，不是 Hilbert 诱导度量。把它塞进 $\ell_2$ 会破坏分枝分离（正交性预算有限）。BGN 的 thin Laakso configurations 之所以在 $\ell_p$ 行，是靠 $p>2$ 里树状配置的距离几何（tex:44 明写 "concern ambient exponents strictly greater than two"）；在 $\ell_2$ 中平行四边形恒等式抹掉树状超度量增益 [推测]，这正是（我事后确认的）改用微分/导数障碍替代纯组合分枝论证的原因。

## 3 反证 setup：sheet、好点、紧集 $K$ 与字典极大 $(A,B)$

对应素材 2.3，tex:137-175。反设（tex:141-145）：

```tex
Since $S$ contains the base plane with all displacement coordinates zero, it
cannot embed into $\R^0$. Suppose, for a contradiction, that for some finite
$k\ge1$ and $D\ge1$ there is a map $f:S\to\R^k$ satisfying
\begin{equation}\label{eq:bilip}
 \norm{z-z'}\le\norm{f(z)-f(z')}\le D\norm{z-z'}
 \qquad(z,z'\in S).
\end{equation}
```

sheet 定义（tex:146-158）：

```tex
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

好点（tex:160-164，引用 Heinonen 的 Rademacher 定理 `[Theorem 3.1]` 与 Tao 的 Lebesgue 微分笔记 `[Theorem 32 and Exercise 33]`）：

```tex
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

$K$、$A$、$B$（tex:166-175）：

```tex
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

tex:175 末还有一句预告："The next lemma explains the benefit of maximizing the coordinates in this order: if the mean deficit from $A$ tends to zero, then the mean second coordinate cannot exceed $B$ in the limit."（下一节引理解释按此顺序最大化的好处：若对 $A$ 的均值亏损趋于零，则第二坐标的均值在极限下不超过 $B$。）

机制拆步（素材 2.3(b)）：

1. **归一化**。双 Lipschitz 定义里的尺度 $a$ 被吸收，(eq:bilip) 下界系数恰为 1。合法性：用 $f/a$ 替换 $f$，上界变 $D$。$D\ge1$ 可设。这一步让后面所有 "$Dr$、$2Dr$" 误差里不携带 $a$。
2. **sheet 的 $D$-Lipschitz 性**。对 $p,p'\in\Omega_w$，源点 $(p,w),(p',w)\in S$ 距离 $=\|p-p'\|$（同 $w$ 只动底座），(eq:bilip) 上支立刻给 $\|F_w(p)-F_w(p')\|\le D\|p-p'\|$。**不要求 $\Omega_w$ 连通**：Lipschitz 是逐对条件，与定义域形状无关。我在 Lean 里核对过这条的对应物 `embeddingSheet_lipschitz`（第 12 节，那里因基度量选择变成 $2D$）。
3. **好点的三重身份**：Rademacher 给 a.e. 可微；Lebesgue 微分定理给 a.e. 点是 $F_x,F_y$ 的 Lebesgue 点；交仍满测。(eq:good) 的含义是"以 $p$ 为中心、边 $l$ 方块上的平均平方误差随 $l\to0$ 消失"，它将在第 6 节被以定量形式使用（eq:baseerror：存在具体的小 $l$ 使平均误差 $<n^{-8}$）。$L^1$ 升级到 $L^2$ 的机制我补一步：$\|F_x-u\|^2\le(2D)\|F_x-u\|$ 逐点成立（导数范数 $\le D$、差 $\le2D$），故 $L^1$ 收敛乘上有界性即 $L^2$ 收敛，这就是 tex:164 "boundedness upgrades..." 的展开。
4. **$K$ 的有界与闭**：所有对落在 $[0,D^2]^2$（导数列范数 $\le D$），取闭包即紧。非空：零 tuple 的 sheet 定义域是整个 $\R^2$，好点满测。论文这里只写 "It is nonempty and compact"，为什么非空没解释，Lean 被迫给出见证 $w=0$（第 12 节，`derivativeData_nonempty`）。
5. **字典极大良定义**。术语：按"先最大化第一坐标、再在第一坐标等于最大值的截面内最大化第二坐标"的顺序取极值，叫字典序（lexicographic）最大化。投影 $\{s:(s,t)\in K\}$ 是紧集连续像故紧，max 取到；固定 $s=A$ 的截面非空紧，max 取到，所以 $(A,B)\in K$。"remain fixed throughout" 是全文逻辑枢纽：$K,A,B$ 只依赖先固定的嵌入 $f$，后续 $n$、层 $j$、矩形 $Q$ 全依赖它们而反过来不变。
6. **为什么先 $x$ 后 $y$**。能量估计（第 7 节）的不对称设计需要"先用 $A$ 界住 $\|G_V^x\|^2$ 的均值（逐点 $\le A$ 由 eq:Kbounds 免费），再把 $A$-饱和转化为垂直方向 $\|G_V^y\|^2$ 均值 $\le B+\varepsilon$"。字典序恰好把"第一坐标接近 $A$"翻译成"第二坐标不超过 $B+\varepsilon$"（这就是 lem:compact）。若对称地取 $\max(s+t)$ 这类单坐标极值，产生不了方向分离。

常数的机械理由（素材 2.3(c)）：

- **$D\ge1$**：归一化下界为 1 后，同一对点上下界相容需 $D\ge1$。写成 $D>0$ 任意则 (eq:bilip) 与源距离自反冲突（取 $z=z'$ 之外再取下界链会逼 $D\ge1$）。
- **$[0,D^2]^2$**：收集平方，并非范数，因为 lem:compact 处理的是平方的平均（方差恒等式天生产物）。收 $(\|F_x\|,\|F_y\|)\in[0,D]^2$ 单调等价，但 eq:eta 处 $A-\|G\|^2$ 的非负性要求 $A$ 定义在同一量（平方）上。
- **$n^{-4}$、$n^{-8}$**（第 6 节正式登场，这里预告）：$n^{-4}$ 让 $\|u\|^2$ 距 $A$、$|B-\|v\|^2|$ 都 $O(n^{-4})$；方差恒等式产生的交叉项 $2\|u\|\cdot\|\langle G\rangle-u\|$ 与之同量级；最终 $n^2$ 乘后要求 $n^2\cdot n^{-4}=n^{-2}\to0$。$n^{-8}$ 的平方根出现在 Cauchy–Schwarz（$L^2$ 均值界 $n^{-8}$ 转单项界 $n^{-4}$），与 eq:Hmean 的 "$+2n^{-4}$" 对上。**两个幂次的耦合是 $(n^{-8})^{1/2}=n^{-4}$**；改 $n^{-3}/n^{-6}$ 同样可用（任意 $n^{-2c}$，$c\to\infty$ 都收敛），关键是 $\sqrt{\text{base error}}\asymp$ nearmax 容差、且两者都 $=o(n^{-2})$。[推测：论文取偶次幂纯为算顺]

候选失败路线（[推测]，素材 2.3(d)）：

1. **对全空间取独立 sup ，并非紧集字典**。令 $A'=\sup\|F_x\|^2$、$B'=\sup\|F_y\|^2$ 各自独立。失败机制：$(A',B')$ 未必被任何 sheet 逼近，从"$s$ 接近 $A'$"推不出"$t\le B'+\varepsilon$"（可能存在第一坐标大、第二坐标也大但从不共现的散列点对）。紧集加字典序正是把"两个方向的饱和共现"编码进 $(A,B)\in K$ 这一事实。
2. **把同样论证搬到无穷维目标**。Rademacher 对无穷维目标不成立（a.e. 可微失效，需要 Fréchet 可微加 Radon–Nikodým 性质，$\R^k$ 有而一般 Banach 无）。所以矛盾只对有限维目标产生；这不损失什么，题目本就是"嵌入进某 $\R^k$"。推广到任意 Banach 目标的无障碍方向必须换机制（紧致性/子列论证），论文明写 cor:banach 用的全是有维范数等价："choose a linear isomorphism... Equivalence of finite-dimensional norms"，不见 Rademacher。见第 10 节。
3. **用 Cheeger 的 weak Poincaré / 可微结构框架**。tex:55 主动对比了 Cheeger 框架（需要 doubling-measure 与 Poincaré 假设）并放弃，改用 "ordinary Euclidean differentiation of Lipschitz maps on open subsets of $\R^2$"。失败机制 [推测]：$S$ 作为 $\ell_2$ 子集不承载自然的 doubling **测度**（它是"胖"的：含二维平面片），Cheeger 的可微结构针对测度空间中的 Lipschitz 函数，而这里处理的对象是**离散层坐标的偏移** $(F_i-F)/r$，它不是 $S$ 上的函数，是 sheet 参数族的差分。硬套 Cheeger 坐标图会把问题绕回"目标微分结构"，恰是要避免的。

## 4 字典极大引理：全文唯一一处"无速率"许可（lem:compact）

对应素材 2.4，tex:177-196。陈述（tex:177-186）：

```tex
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

证明逐字（tex:187-196）：

```tex
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

机制拆步（素材 2.4(b)）：

1. 第一断言纯拓扑：紧性把序列换成收敛子列，极限 $(A,t^*)\in K$ 且 $t^*\ge B+\varepsilon$，与 $B$ 在截面 $\{t:(A,t)\in K\}$ 上的极大性矛盾。**$\delta$ 依赖 $\varepsilon$ 且没有任何显式速率**。tex:69 明写："Compactness suffices for this latter estimate; no quantitative modulus of the second extremum is needed."（紧性对后一估计够用；第二个极值不需要定量模。）这句话是我读全文时停下来最久的一处：它等于作者当众承认自己的证明里有一处"只有存在性、没有速率"的关节，并且论证居然不要求给它速率。这个豁免如何一路存活到打包矛盾，第 7、8 节会逐段验收；Lean 侧反而给它配了速率（斜率 $C=M/\delta$ 的仿射屏障），是第 12 节分歧 3 的主题。
2. 第二断言（概率形态）：把 $Q$ 上归一化面积测度当概率测度，$(s_n,t_n)=(\|G_V^x(p)\|^2,\|G_V^y(p)\|^2)$。拆 $\mathbb E t_n=\mathbb E[t_n;A-s_n<\delta]+\mathbb E[t_n;A-s_n\ge\delta]$：第一项 $\le B+\varepsilon$（逐点蕴涵），第二项 $\le D^2\cdot\mathbb P\{A-s_n\ge\delta\}\le D^2\mathbb E(A-s_n)/\delta$（Markov 加 $t_n\le D^2$）。先 $n\to\infty$ 再 $\varepsilon\downarrow0$。
3. **假设的形态是关键**：期望假设 $\mathbb E(A-s_n)\to0$，不是逐点假设。因为 eq:eta 只能给出 $\eta_n=\langle A-\|G_V^x\|^2\rangle_Q\to0$ 这种均值收敛（由 Cauchy–Schwarz 与端点误差得来，逐点版不可能有：好点只是满测集，接近速率无一致模）。

常数的机械理由（素材 2.4(c)）：

- **双极限顺序（先 $n$ 后 $\varepsilon$）**：若 $\varepsilon$ 固定（比如取 1），只能得 $\limsup\mathbb E t_n\le B+1$，太弱。第 7 节末需要 $\limsup\langle\|G_V^y\|^2\rangle\le B$ **精确**成立，才能与 $\|v\|^2\to B$ 夹出方差 $\to0$（eq:vertical 的推导把 $\langle\|G_V^y\|^2\rangle-\|v\|^2$ 压成 limsup $\le0$）。$B$ 的精确值是生死线。
- **$D^2$（尾部截断的质量上界）**：来自 $t_n\le D^2$ 逐点界。任何让 $K$ 无界的版本都会让 Markov 尾部项失控；本设置里 $K\subset[0,D^2]^2$ 免费获得。
- **字典 vs 全截面**：若改用 $B'=\max\{t:\exists s,(s,t)\in K\}$，蕴涵 "$s>A-\delta\Rightarrow t\le B'+\varepsilon$" 仍真，但 $B'$ 可能大于 $B$，第 7 节方差上界会残留正常数 $B'-B$，eq:vertical 停在一个正的 limsup，Crossings 的 $\omega_n\to0$ 失败，打包矛盾崩。**字典序是本引理全部的力量所在。**

候选失败路线（[推测]，素材 2.4(d)）：

1. **逐点版引理**。想要"$\|G_V^x\|^2$ 接近 $A$ a.e. 蕴含 $\|G_V^y\|^2\le B+\varepsilon$ a.e."。不成立：$\|G_V^x\|^2$ 接近 $A$ 的点集可以是"条带边缘"型碎集，逐点接近速率无一致模（$K$ 的连续模依赖具体 sheet 分布，紧致性只给逐点存在不给一致）。均值版本恰好绕开速率问题。这与 tex:69 的"不需要定量模"是同一件事的两面。
2. **Prokhorov/经验测度弱收敛**。把 $(s_n,t_n)$ 的分布列取弱收敛极限，极限测度支在 $K$ 且第一矩饱和，同样能得结论。失败谈不上，只是路线更重：引入概率论基础设施，而论文用 Markov 两行解决。我重读时确认这处"重路线豁免"与第 0 节"低技术武器库"的选择一致。
3. **[推测，我补的] 直接对上确界速率建模**。若想在论文里写 $\delta(\varepsilon)$ 的显式公式，需要对 $K$ 的几何有额外信息（哪张 sheet、哪个好点逼近极值），而 $K$ 是从**所有** sheet 的好点收集来的，其形状对 $f$ 完全不可控。这一处不可控正是作者把"速率"从证明里逐出去的原因；Lean 版把 $\delta$ 做成坏集最右端到 $A$ 的距离（第 12 节），存在但从不估计，是同一事实的机器呈现。

## 5 方差恒等式与沿线段积分：两台每天开工的机器

对应素材 2.5，tex:198-204。恒等式 (eq:variance)（tex:199-203）：

```tex
\begin{equation}\label{eq:variance}
 \left\langle\norm{G-a}^2\right\rangle
 =\left\langle\norm{G}^2\right\rangle-\norm a^2
       -2\inner{a}{\langle G\rangle-a}.
\end{equation}
```

直接展开验证：$\langle\|G-a\|^2\rangle=\langle\|G\|^2\rangle-2\inner a{\langle G\rangle}+\|a\|^2$，再把 $-2\inner a{\langle G\rangle}+\|a\|^2$ 拆成 $-\|a\|^2-2\inner a{\langle G\rangle-a}$，与 tex 形式一致。素材特别注明"论文写 $\langle\|G\|^2\rangle-\norm a^2-\ldots$，即 $-\norm a^2$ 项来自展开常数项"，我按上面两步核对通过。它的意义是把"$L^2$ 偏差"分解成三样可分别控制的量：二阶矩 $\langle\|G\|^2\rangle$（由 $K$ 给上界）、参考向量模方 $\|a\|^2$（由 nearmax 给靠近 $A$ 或 $B$）、均值偏移 $\|\langle G\rangle-a\|$（由线积分给）。

线积分约定（tex:204 原样）：

```tex
We also use integration along line segments. A Lipschitz map on an interval is
absolutely continuous, and its increments equal integrals of its derivative,
componentwise ... By Fubini, on almost every horizontal or vertical segment in
an open sheet domain, these line derivatives agree almost everywhere with the
corresponding partial derivatives. At excluded endpoints we take the unique
one-sided limits of the Lipschitz restriction. Bounds for the map persist in
those limits.
```

使用模式在 prop:energy 里出现三次，方向不同：

- **正向用**（横向前馈）：把 $\langle\|G_H^x-u\|^2\rangle$ 放大为 $\bigl(A-\|u\|^2\bigr)+2\|u\|\,\|\langle G_H^x\rangle-u\|$。第一项用 nearmax 的 $<n^{-4}$，第二项用线积分给的均值控制。机制是 tex:265-270 的两行：$\langle\|G_H^x-u\|^2\rangle\le A-\|u\|^2+2\|u\|\|\langle G_H^x\rangle-u\|$，其中用了 $\langle\|G_H^x\|^2\rangle\le A$（eq:Kbounds 逐点界），恒等式里的 $-\|u\|^2$ 与放大后的交叉项一起被折进两项形状。
- **反向用**（垂直列，两次）：左边 $\ge0$ 直接丢掉，得 $0\le\eta_n\le A-\|u\|^2+2\|u\|\|\langle G_V^x\rangle-u\|$（eq:eta），即"逐点 $\|G_V^x\|^2\le A$ 加均值靠近 $u$，推出平均亏损趋于 0"。这是把 $L^1$ 型端点误差转化为二阶矩饱和的引擎。同样的丢左再夹一次得 eq:vertical。

线积分的"除法器"：对固定 $y$（横条内部），逐分量积分 $\int_{x_0}^{x_1}(F_i-F)_x\,dx=(F_i-F)(x_1,y)-(F_i-F)(x_0,y)$。两端各自用 (eq:offset) 得 $\le Dr$，合起来端点差 $\le 2Dr$；除以条长 $L_x$ 得导数均值偏移 $\le 2Dr/L_x$。**"端点误差除以条宽"是全文反复出现的除法**，第 7 节的三条均值界 (eq:Hmean)(eq:Vxmean)(eq:Vymean) 全是它的实例，只是分母依次换成 $L_x$、$nr$、$L_y$。

常数的机械理由（素材 2.5(c)）：

- "$2Dr$" 里的 2：两端点各贡献 $Dr$，只在一端有界会丢一半。
- 丢左边（$\ge0$）的合法性：所有平均都在归一化面积测度上，期望非负显然。这步把"等式"降为"单侧不等式"，是 eq:eta 里 "$0\le\eta_n$" 的出处；同时暴露一个设计决定：**不需要 $G_V^x$ 与 $u$ 的逐点关系，只用其均值**，定量要求降到最低。
- 交叉项系数取 $\|u\|\le D$、$\|v\|\le D$：目标维数高、$D$ 大时，$D^2/n$ 项（eq:eta 末）的衰减仍由 $n\to\infty$ 保证，因为 $n$ 在 $D$ 之后选取，量化顺序 $k,D\prec N\prec n$ 正确。

候选失败路线（[推测]，素材 2.5(d)）：

1. **绕开恒等式、用 Jensen/三角不等式**。$\langle\|G-u\|^2\rangle\le\langle\|G-u\|\rangle^2$ 方向反了（Jensen 给 $\langle\|G-u\|\rangle^2\le\langle\|G-u\|^2\rangle$）。想用 $L^1$ 均值界推 $L^2$ 收敛，逐点上界 $\|G-u\|\le2D$ 确实给 $s^2\le2D\,s$ 的逐点转化，硬转可行；但第 7 节的 eq:Hmean 类估计是对**均值向量** $\|\langle G\rangle-u\|$ 成立，并非对 $\langle\|G-u\|\rangle$，从均值向量回到 $L^2$ 偏差仍然要展开平方，绕回恒等式本身。[推测]
2. **Sobolev/Poincaré 型不等式替代逐条线积分**。矩形上 $\langle\|G-\langle G\rangle\|^2\rangle\le CL^2\langle\|\nabla G\|^2\rangle$，方向貌似正好需要（Crossings 里绝对连续加 Cauchy–Schwarz 就是它的退化形式），但 $G$ 是**分段选取**的（按颜色切 sheet），跨条带边界跳变、整体不连续，任何要求全局 Sobolev 正则的引理在网格线上失效；且右端 $\nabla G$ 恰是想估的对象，循环。论文的处理是"逐条内部线积分加允许边界跳跃"，tex:285 原话："The estimate sums the separate strip integrals and therefore allows jumps in the selection at strip boundaries."

## 6 近极值矩形的 setup：eq:N 到 eq:Kbounds 的九步对账

对应素材 2.6，tex:206-246。先摆全部公式（按出现顺序，素材要求一条不落）。颜色数（eq:N，tex:210-213）：

```tex
Fix an integer
\begin{equation}\label{eq:N}
 N>(1+2D)^k.
\end{equation}
```

近极值 sheet 与点（eq:nearmax、eq:baseerror，tex:214-223）：

```tex
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

选层与网格（eq:fine，tex:225-233）：

```tex
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

加色 sheet 与偏移界（eq:offset，tex:235-239）：

```tex
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

选择场与 $K$-界（eq:Kbounds，tex:241-246）：

```tex
Off the grid boundaries, define $G_H^x$ by selecting $(F_i)_x$ according to the
horizontal strip color $i$. Define $G_V^x,G_V^y$ by selecting
$(F_i)_x,(F_i)_y$ according to the vertical strip color. Almost everywhere on
$Q$,
\begin{equation}\label{eq:Kbounds}
 \norm{G_H^x}^2\le A,\qquad
 (\norm{G_V^x}^2,\norm{G_V^y}^2)\in K.
\end{equation}
Indeed, the good points have full measure for each of the finitely many sheets
in use. The map $f$, its target parameters $k,D$, the set $K$, and the numbers
$A,B,N$ remain fixed throughout.
```

术语说明：周期块（period block）指第 $j$ 层着色的最小重复矩形，宽 $N_jW_jr_j$、高 $N_jr_j$；这里取 $(N_j,W_j)=(N,n)$，所以是 $Nnr\times Nr$。tex:69 的说法是 "one period block contains one row and one column of each color"。

机制九步（素材 2.6(b) 全展开）：

1. **eq:N 的由来要到第 8 节才闭环**：打包矛盾需要 $N$ 个两两距离 $>1$、落在半径 $D$ 球内的点，而 $\R^k$ 中体积比较上限恰是 $(1+2D)^k$。先固定 $k,D$，再定 $N$，再让 $n$ 跑：变量绑定链 $k,D\prec N\prec n\prec j$，任何倒置都使构造自指（$S$ 依赖嵌入被 tex:113 禁止）。
2. **eq:nearmax 可行**：$(A,B)\in K$ 意味着它在实际好点对的闭包里，取序列进入 $n^{-4}$ 球即可。注意 $|B-\|v\|^2|<n^{-4}$ 是**双侧**绝对值，而 $A-\|u\|^2$ 是单侧（下侧由 eq:Kbounds 免费：$\|u\|^2\le A$）。双侧是给第 7 节末的夹逼用的：$\|v\|^2>B-n^{-4}$ 要顶住 limsup 的上界 $B$，两边都得贴住。
3. **eq:baseerror 可行**：所选取的点是 good point，(eq:good) 的极限陈述给出存在具体的小 $l$。$Q^0$ 闭包含在 sheet 域内：域开、点在域内，可以。
4. **trimming 计数**：$Q^0$ 边长 $l$；每个坐标方向两端各对齐一次网格，至多损失 2 个周期。$2\cdot Nnr\le 2\cdot\frac{ln^{-8}}{100}<l/2$（$n^{-8}/100<1/2$ 对一切 $n\ge1$ 成立），故 $L_x\ge l-2Nnr>l/2$；同理 $L_y\ge l-2Nr$，其中 $Nr\le Nnr<ln^{-8}/100$。tex 直接写 $L_x,L_y\ge l/2$。
5. **eq:Qerror 的系数 4**：$Q\subset Q^0$，$\int_Q\le\int_{Q^0}<n^{-8}l^2$，除以 $|Q|\ge(l/2)^2=l^2/4$，均值 $<4n^{-8}$。4 的出处就是**面积至多放大 4 倍**。
6. **eq:ratio**：$r/L_x\le r/(l/2)=2r/l$。由 eq:fine，$Nnr<ln^{-8}/100\Rightarrow r/l<n^{-8}/(100Nn)=n^{-9}/(100N)$，乘 2 得 $2r/l<n^{-9}/(50N)$。50 的出处：100 的一半被 trim 的因子 2 吃掉。
7. **$F_i$ 的定义域恰为 $\Omega_w\cap U_{j,i}$**：加一层非零坐标 $re_{j,i}$ 合法当且仅当 $p\in U_{j,i}$；其余层不变当且仅当 $p\in\Omega_w$。"同一个 $F_i$ 同时覆盖横条与竖条部分"是下一节的关键：偏移 $F_i-F$ 在 $H_{j,i}\cap Q$ 与 $V_{j,i}\cap Q$ 上是**同一个映射**的两个侧面。tex:64 的机关句我在此正式引用："The horizontal and vertical restrictions belong to the same map $F_i$."（横竖两个限制属于同一个映射 $F_i$。）横竖误差被同一个函数耦合，字典导数极值才能两头使。
8. **eq:offset 推导**：对 $p\in Q\cap U_{j,i}$，源点 $(p,w)$ 与 $(p,w+re_{j,i})$ 都在 $S$、距离 $=r$，(eq:bilip) 上支给 $\|F_i(p)-F(p)\|\le Dr$。(eq:bilip) 下支同时给 $\ge r$，即偏移向量长度恰在 $[r,Dr]$ 带宽内；下支要到第 8 节交叉分离才兑现。
9. **eq:Kbounds 推导**：a.e. 点上 $G_H^x(p)=(F_i)_x(p)$（$i$ 为该横条颜色），该点是 sheet $F_i$ 的好点（有限个 sheet 的好集之交仍满测，tex:245-246 "Indeed, the good points have full measure for each of the finitely many sheets in use."），故 $(\|(F_i)_x\|^2,\|(F_i)_y\|^2)\in K$；第一坐标 $\le A$ 是 $A$ 定义的直接推论，$G_V$ 的对更强（整对属于 $K$）。网格边界零测、被排除。

常数的机械理由（素材 2.6(c)）：

- **$(1+2D)^k$**：$\R^k$ 半径 $D$ 球内两两距离 $>1$ 的点数硬上限（第 8 节体积比较；等号情形对应半径 $1/2$ 打包）。$N$ 取 $\lfloor(1+2D)^k\rfloor+1$，严格大于。
- **$n^{-4},n^{-8}$ 追加一处**：eq:fine 里 $ln^{-8}/100$ 用 $n^{-8}$ 是为了让 eq:ratio 出 $n^{-9}$，进而在 eq:Hrate 产生 $n^{-7}$ 级项。逐项核对：$n^2\cdot 4D^2r/L_x\le 8D^2n^2\cdot\frac{n^{-9}}{50N}=\frac{4D^2}{25N}n^{-7}$，与 tex:274 吻合（素材的"校验注"：这比"精确值" $\frac{2D^2}{25N}n^{-7}$ 大 2 倍，属安全方向松弛；我按 tex 复核，$8D^2$ 来自平方三角拆分前的系数，链条自洽）。
- **100**：在 $l\cdot n^{-8}/100$ 里吃 trim 的 2 倍与 ratio 定义的 2 倍，还剩约 25 倍裕度变出 $50N$ 分母。纯圆整常数，任何 $>4$ 的值都能跑通链条，只改最终 $n$ 幂系数。
- **$l/2$**："trim 至多损失两个周期"的目标陈述；只要 $Nnr,Nr\ll l$ 可达任意 $1-o(1)$ 比例，取 $1/2$ 让 eq:Qerror 系数恰为 $2^2=4$。比例改 $3/4$ 则系数 $16/9$，链条不变。
- **$Q^0$ 是正方形**：(eq:good) 以方块陈述（"squares may replace balls by area comparison"），保持一致；换圆盘只改常数。

候选失败路线（[推测]，素材 2.6(d)）：

1. **不设 $N$ 固定、令 $N=N_j$ 随层变**。打包矛盾要求色数 $N>(1+2D)^k$ 与周期块内"每色一行一列"结构同时成立；若 $N$ 随 $n$ 增长，Crossings 的 $\omega_n=N\sqrt{2N\varepsilon_n}$ 需要 $\varepsilon_n$ 以 $N^{-3}$ 速率消失，而能量估计（经 lem:compact）根本没有速率可给。固定 $N$、变 $W_j=n$ 是唯一能把"无速率引理"和"振动收敛"捏合的调度。这条与第 4 节 (d)1 是同一枚硬币：无速率是 lem:compact 的让步，$N$ 冻结是它的还债。
2. **跳过 sheet 化、直接对 $f$ 用 Rademacher**。$f$ 定义在 $S$（非开集）上，没有经典导数；sheet 化把定义域拉回 $\R^2$ 开集，是"离散层坐标到连续微分"的桥梁。跳过它则 (eq:good)、线积分、$K$ 全部无从谈起。
3. **用 $F_i-F$ 的下界 $\ge r$ 直接当打包集**。下界说归一化偏移 $\|h_i\|\ge1$，看似现成的分离。失败机制：$h_i$ 只在**单色条带内**有定义，条带之间没有比较通道；$\sqrt2$ 分离只在"交叉点处两个标签同时合法"时可用，必须回到第 8 节的交叉传输结构。[推测]

## 7 prop:energy：各向异性能量估计，全文最重的三十行

对应素材 2.7，tex:248-310。陈述：

```tex
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

tex:255 的原注："The factor $n^2$ compensates for horizontal segments of length $Nnr$; the vertical segments have length $Nr$."（$n^2$ 因子补偿长 $Nnr$ 的水平线段；竖线段长 $Nr$。）输出形状一加权一裸加权，这个不对称到第 8 节组合能量时才说明白：它是给交叉点选线用的标尺预置的。

**第 1 段：水平选择（横向前馈）**。$Q$ 内部的横色条（色 $i$，高 $r$、宽 $L_x$）上 $F_i$ 全条有定义。取条内一条水平线段（good 线，Fubini 保证 a.e. 高度可行），逐分量积分 $(F_i-F)_x$。素材忠实记录了 tex:260 的实际路线：端点差 $\|(F_i-F)(x_1,y)-(F_i-F)(x_0,y)\|\le 2Dr$（两端各用 eq:offset），均值化给条上 $(F_i)_x$ 线平均对 $u$ 的偏移 $\le 2Dr/L_x$；再加旧 sheet 自身的均值误差：Cauchy–Schwarz 把 eq:Qerror 开方，$\langle\|F_x-u\|\rangle_Q\le(4n^{-8})^{1/2}=2n^{-4}$。得 (eq:Hmean)（tex:261-264）：

```tex
 \norm{\langle G_H^x\rangle-u}
 \le\frac{2Dr}{L_x}+2n^{-4}.
```

方差恒等式取 $a=u$、$G=G_H^x$，用 $\langle\|G_H^x\|^2\rangle\le A$（eq:Kbounds），代入 eq:nearmax（$A-\|u\|^2<n^{-4}$）与 $\|u\|\le D$：

$$\langle\|G_H^x-u\|^2\rangle\le n^{-4}+2D\Big(\frac{2Dr}{L_x}+2n^{-4}\Big)=(1+4D)n^{-4}+\frac{4D^2r}{L_x}.$$

这里 $(1+4D)$ 的合并：$n^{-4}+2D\cdot2n^{-4}=n^{-4}+4D\,n^{-4}$，对。再转回 $G_H^x-F_x$：平方三角 $\|G_H^x-F_x\|^2\le2\|G_H^x-u\|^2+2\|F_x-u\|^2$，平均、乘 $n^2$，得 (eq:Hrate)（tex:272-275）：

```tex
 n^2\left\langle\norm{G_H^x-F_x}^2\right\rangle
 \le 2(1+4D)n^{-2}+\frac{4D^2}{25N}n^{-7}+8n^{-6},
```

逐项对账（素材 2.7(b) 的核算我全额保留）：第一项 $2(1+4D)n^{-4}\cdot n^2=2(1+4D)n^{-2}$；第二项 $2\cdot\frac{4D^2r}{L_x}\cdot n^2\le 8D^2n^2\cdot\frac{n^{-9}}{50N}=\frac{4D^2}{25N}n^{-7}$（用 eq:ratio）；第三项 $n^2\cdot2\cdot\langle\|F_x-u\|^2\rangle\le n^2\cdot2\cdot4n^{-8}=8n^{-6}$。素材还特意纠过一次口算："第三项实际是 $n^{-6}$ 级，并非我先前口算的 $n^{-8}$，因为拆分用了 $\|G-F_x\|^2\le2\|G-u\|^2+2\|F_x-u\|^2$，第二个 2 乘进 $4n^{-8}$。" 三项都 $\to0$。eq:horizontal 成立。

**第 2 段：垂直选择第一列**。竖条宽 $nr$。对每条完整竖条在 $x$ 上积分 $(F_i-F)_x$：条两端点像差 $\le 2Dr$，除以条宽 $nr$ 得该条上 $(F_i)_x$ 线平均的偏移 $\le\frac{2Dr}{nr}=\frac{2D}{n}$。把所有条的积分加起来（允许条边界跳跃，tex:285），再对 $y$ 平均，加 eq:Qerror 开方的 $2n^{-4}$，得 (eq:Vxmean)（tex:282-284）：

```tex
 \norm{\langle G_V^x\rangle-u}\le\frac{2D}{n}+2n^{-4}.
```

方差恒等式丢左边：记 $\eta_n=\langle A-\|G_V^x\|^2\rangle$，tex:287 说明 "By \eqref{eq:Kbounds}, it is nonnegative."，且（tex:288-292 的形状）

```tex
 0\le\eta_n
 \le A-\norm u^2+2\norm u\norm{\langle G_V^x\rangle-u}
 \le (1+4D)n^{-4}+\frac{4D^2}{n}\longrightarrow0.\tag{eq:eta}
```

核对：$2D\cdot\frac{2D}{n}=\frac{4D^2}{n}$；$2D\cdot2n^{-4}=4D^2n^{-4}\le(1+4D)n^{-4}$ 被吸收。**lem:compact 登场**（tex:293）：对 eq:Kbounds 的第二式 $(s,t)=(\|G_V^x(p)\|^2,\|G_V^y(p)\|^2)\in K$ a.e.，概率测度取 $Q$ 上归一化面积测度，$\mathbb E(A-s)=\eta_n\to0$，得 (eq:Vynorm)（tex:294-296）：

```tex
 \limsup_{n\to\infty}\left\langle\norm{G_V^y}^2\right\rangle\le B.
```

这一手就是第 4 节"均值假设，并非逐点假设"的兑现点：eq:eta 只有均值收敛，lem:compact 恰好只吃均值。

**第 3 段：垂直选择第二列**。竖条高 $L_y$（跨全 $Q$ 高度），$y$-线积分给 (eq:Vymean)（tex:300-302）：

```tex
 \norm{\langle G_V^y\rangle-v}\le\frac{2Dr}{L_y}+2n^{-4}\longrightarrow0
```

（第一项由 eq:ratio，第二项显然。）方差恒等式反向夹（tex:303-309 的原文形状，$\|v\|\le D$）：

$$0\le\langle\|G_V^y-v\|^2\rangle\le\langle\|G_V^y\|^2\rangle-\|v\|^2+2D\|\langle G_V^y\rangle-v\|.$$

取 limsup：首项 $\le B$（eq:Vynorm），而 $\|v\|^2>B-n^{-4}$（nearmax 双侧在此用上），于是 $\langle\|G_V^y\|^2\rangle-\|v\|^2$ 的 limsup $\le B-B=0$；交叉项 $\to0$（eq:Vymean）。squeeze 得 $\langle\|G_V^y-v\|^2\rangle\to0$。tex:309 特意补一句我读到时很领情："In particular, convergence of the vectors $v$ themselves is unnecessary."（$v$ 逐 $n$ 选取、没有理由收敛；双侧 nearmax 加夹逼绕开了这份紧性。）最后 $\|G_V^y-F_y\|^2\le2\|G_V^y-v\|^2+2\|F_y-v\|^2$ 平均，第一项 $\to0$、第二项 $\le 8n^{-8}\to0$。eq:vertical 成立。$\blacksquare$

**结构总结**（素材 2.7 结构段）：横向链条是"一维的"（$A$ 界直接用），纵向链条是"二维字典的"（先 $x$ 饱和，$\eta_n\to0$，lem:compact，再得 $y$ 均值上界 $B$）。$n^2$ 因子只出现在 eq:horizontal，因为后续 Crossings 里水平线段长 $Nnr$，振动控制需要加权能量恰好带 $n^2$；竖行长 $Nr$ 与 $n$ 无关，无需加权。tex:69 把这套不对称讲成两句宣言："The wide vertical strips first force the mean squared horizontal derivative norm of the vertically selected sheets toward $A$. The second extremum then gives vertical mean-square error tending to zero, with no growing factor required."

常数的机械理由（素材 2.7(c)）：

- **$n^2$ 加权**：与线段长 $Nnr$ 的平方配平（Cauchy–Schwarz 后振荡界 $=$ 长 $\times L^2$ 均值开方，见第 8 节 $N\sqrt{2N\varepsilon_n}$）。横向若不加权，第 8 节水平振动 $=Nnr\cdot\frac1r\sqrt{\text{无界量}}$ 发散。
- **$2D/n$（eq:Vxmean）**：端点误差 $2Dr$ 除以条宽 $nr$。$D$ 线性出现一次，再进 eq:eta 的 $4D^2/n$（乘 $\|u\|\le D$）：$D^2$ 被 $1/n$ 杀，$n$ 在 $D$ 后选取，量化顺序又一次救命。
- **$(1+4D)$**：$n^{-4}+4D^2n^{-4}=(1+4D)n^{-4}$，nearmax 项与均值误差项的合并系数，无独立意义，只随 $D$ 多项式增长、被 $n\to\infty$ 支配。
- **eq:Hrate 的三幂 $n^{-2},n^{-7},n^{-6}$**：主导项是第一项 $2(1+4D)n^{-2}$（nearmax 的 $n^{-4}$ 乘 $n^2$ 剩 $n^{-2}$）。**整个横向链条的收敛速率由 nearmax 容差 $n^{-4}$ 单点决定**：改 $n^{-3}$ 则 $n^2\cdot n^{-3}=n^{-1}\to0$ 仍活；改 $n^{-2}$ 则 $n^2\cdot n^{-2}=1\not\to0$，eq:horizontal 崩。故 nearmax 容差指数必须 $>2$，$n^{-4}$ 是留了一倍裕度的偶数。同时 baseerror 必须是 nearmax 的平方（$L^2$ 均值开方出 $L^1$ 界）：$(n^{-4})^2=n^{-8}$ 的耦合在此定型。参数族约束：**nearmax $=\rho_n$，baseerror $=\rho_n^2$，加权 $n^2$，要求 $\rho_n=o(n^{-2})$。**
- **$50N$（eq:ratio 分母）**：进入 $n^{-7}$ 项，被支配，不敏感。$N$ 在分母只是"更大 $N$ 更好"的假象：$N$ 实际由打包需求下界控制（eq:N），不能拿它做收敛余量。

候选失败路线（[推测]，素材 2.7(d)）：

1. **对称处理两方向（不要各向异性）**。对 $G_H^y$、$G_V^x$ 也要求 $L^2$ 收敛。横向 $G_H^y$ 的振动控制需要在长 $Nr$ 的竖线段上积 $(F_i-F)_y$，但横条**不跨全高**（高仅 $r$），线积分无法闭合；竖向 $G_V^x$ 已被使用但只用到"均值 $\to u$"与矩信息，其 $L^2$ 收敛根本没被要求（lem:compact 只吃它的二阶矩）。各向异性不是偷懒，是几何可行性上限：色条只在"自己方向的跨度"上线积分闭合。
2. **Poincaré 整体替代两段能量**。见第 5 节 (d)2：$G$ 分段不连续、右端循环。
3. **让 $n$ 也放大 $N$（$N_n\to\infty$）**。lem:compact 的应用不变，但 $n^2$ 加权需换成 $N_n^2n^2$ 级别才能喂第 8 节的 $\omega_n$，而 nearmax/baseerror 是"存在性"选取（无速率），无法为增长的 $N_n$ 保证更快收敛。无定量模引理是刻意的最弱假设，代价就是 $N$ 必须冻结。[推测]

## 8 Crossings：打包矛盾与 thm:main 收尾

对应素材 2.8，tex:312-383，含 Figure 1。选块（tex:316-320）：

```tex
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

注意组合能量的输入形状（一带 $n^2$ 一裸加权）与 prop:energy 的输出形状**精确对接**：横向带 $n^2$ 进能量、纵向不带，原因在振动估算里各自抵长线。选线（eq:rowline、eq:colline，tex:322-331）：

```tex
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

tex:332 补三条技术性说明："These lines can simultaneously be chosen from the full-measure sets where partial derivatives agree with line derivatives. If $\varepsilon_n=0$, use lines of zero energy. The choices of the horizontal and vertical coordinates are independent."（坏集分别是零测竖线族与横线族，横竖独立选互不干扰；$\varepsilon_n=0$ 的退化情形直接取零能线。）振动与归一化偏移（tex:334-345）：

```tex
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
By \eqref{eq:offset}, $\norm{z_i}\le D$. Oscillation on a Lipschitz line is
controlled at every point by its derivative integral, so no differentiability
assertion is required at the crossings.
```

交叉分离与打包（tex:369-383）：

```tex
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

Figure 1 caption（tex:365 原文逐字，素材指定要保留）：

> "A schematic period block, for $i\ne m$. At $c$, both labels are allowed: $i$ by the row and $m$ by the column. Their normalized offsets are separated by at least $\sqrt2$. Transport along the arrows changes $h_i$ and $h_m$ by at most $\omega_n$ each, so $z_i=h_i(p_i)$ and $z_m=h_m(p_m)$ are separated by at least $\sqrt2-2\omega_n$. The block and strip proportions are schematic."

机制八步（素材 2.8(b)）：

1. **选 $P$ 的存在性**：$Q$ 被（至多差边界线）周期块平铺；非负函数的平均值 $\bar\varepsilon$ 之下必有至少一块均值 $\le\bar\varepsilon$。边界线上 $G$ 未定义但零测，不影响均值。prop:energy 两式别相加即得组合能量在 $Q$ 上均值 $\to0$，故 $\varepsilon_n\to0$。
2. **选行线**：色 $i$ 横条交 $P$ 得宽 $Nnr$、高 $r$ 的横带，面积 $=|P|/N$。行内 a.e. 点处 $G_H^x=(F_i)_x$，故 $n^2\|(F_i-F)_x\|^2$ 在行上的积分被组合能量在行上的积分控制；行均值 $\le N\times P$ 均值 $\le N\varepsilon_n$，tex 写成 $2N\varepsilon_n$（一倍裕度，覆盖平铺差边界线的损失）。再由"存在一点函数值 $\le2$ 倍均值"的均值原理，行内存在水平线 $y=y_i$ 使线均值 $\le2N\varepsilon_n$，且线落在行内部、属于"偏导等于线导"的满测集。
3. **选列线**：平行论证，列面积 $|P|/N$（宽 $nr$、高 $Nr$），用不加权能量。
4. **振动估计**：$F_i-F$ 是 $2D$-Lipschitz，限制在所选线段上绝对连续。逐分量：$\operatorname{diam}h_i(\text{seg})\le\int_{\text{seg}}\|\partial_xh_i\|dx\le$ 线长乘导数 $L^2$ 均值 $=Nnr\cdot\frac1r\sqrt{\frac{1}{Nnr}\int\|(F_i-F)_x\|^2dx}$。注意线均值是对 $n^2\|(F_i-F)_x\|^2$ 的，开方要除回 $n$：$=Nn\cdot\frac{\sqrt{2N\varepsilon_n}}{n}=N\sqrt{2N\varepsilon_n}$。**$n$ 在此精确相消，是 $n^2$ 加权的最终兑现点**：线长里的 $n$ 与能量权重里的 $n^2$（开方成 $n$）一一抵消，振动只依赖 $\varepsilon_n$ 与固定 $N$。竖线：长 $Nr$、无权重，$\frac{Nr}{r}\sqrt{2N\varepsilon_n}=N\sqrt{2N\varepsilon_n}$，tex:340 原话 "The identical bound on each chosen vertical segment follows from \eqref{eq:colline}, with length $Nr$."
5. **交叉点合法性**：$c=(x_m,y_i)$。$y_i$ 在横色条 $i$ 内部，故 $c\in H_{j,i}\subset U_{j,i}$，标签 $re_{j,i}$ 合法（行给的）；$x_m$ 在竖色条 $m$ 内部，故 $c\in V_{j,m}\subset U_{j,m}$，标签 $re_{j,m}$ 合法（列给的）。$i\ne m$ 时两标签不同但**同时**许可，"行管横色、列管竖色"的双重许可结构是棋盘几何的精髓。源点对 $(c,w+re_{j,i})$、$(c,w+re_{j,m})$ 距离 $=\|re_{j,i}-re_{j,m}\|=\sqrt2r$（正交基向量差，第 1 节埋的点），(eq:bilip) **下支**给 $\|h_i(c)-h_m(c)\|\ge\sqrt2$。
6. **传输**：$z_i=h_i(p_i)$，$p_i=(x_i,y_i)$。沿行线 $y=y_i$ 从 $c=(x_m,y_i)$ 到 $p_i$，$h_i$ 变化 $\le\omega_n$；沿列线 $x=x_m$ 从 $c$ 到 $p_m=(x_m,y_m)$，$h_m$ 变化 $\le\omega_n$。三角不等式拼出 $\|z_i-z_m\|\ge\sqrt2-2\omega_n$，即 Figure 1 的两支箭头。
7. **交叉点免可微**（tex:345 逐字）："Oscillation on a Lipschitz line is controlled at every point by its derivative integral, so no differentiability assertion is required at the crossings." $c$ 可以不是好点：AC 的端点对不等式对线上一切实点成立，Lipschitz 连续把 a.e. 信息抬到端点。精巧豁免，与 tex:309 的 $v$ 免收敛同族：全文在三个位置（lem:compact 无速率、$v$ 免收敛、交叉点免可微）刻意把定量要求降到最低。
8. **收尾**：$\omega_n\to0$（$\varepsilon_n\to0$、$N$ 固定）给 $n$ 大时 $\sqrt2-2\omega_n>1$ 对全部 $\binom N2$ 对**同时**成立（tex:377 "This is simultaneous because $N$ is fixed."）。$\{z_i\}\subset\overline B(0,D)$（$\|z_i\|\le D$ 来自 eq:offset）两两距离 $>1$：$N$ 个开 $1/2$-球互斥、装入 $D+1/2$ 球，体积比 $N(1/2)^k\le(D+1/2)^k$ 即 $N\le(1+2D)^k$，与 eq:N 严格大于矛盾。没有映射满足 (eq:bilip)；连同 prop:doubling，thm:main 证毕。$\blacksquare$

tex:72 的第三段策略摘要在此完全兑现："Section~\ref{sec:crossings} selects one period block and a line of every color in each direction with the required small errors. ... The fixed set is used throughout; only the sheets, local rectangles, and recurring level vary with $n$."

常数的机械理由（素材 2.8(c)）：

- **$\sqrt2$**：正交标签对距离，第 1 节构造层预置。传输损耗 $\le2\omega_n$，打包需求"分离 $>1$"，即需 $\omega_n<\frac{\sqrt2-1}2$，由 $\omega_n\to0$ 保证。若标签非正交（比如夹角 $60^\circ$、距离归一后 $=1$），则 $1-2\omega_n>1$ 永假：**源分离必须严格大于归一化打包门槛**，直角恰给 $\sqrt2>1$ 的余量。
- **$2N$（eq:rowline 右端）**：$N$ 来自行面积 $|P|/N$（行均值 $\le N$ 倍全局均值），另一个 2 是"存在线 $\le2\times$ 均值"的裕度。$\omega_n=N\sqrt{2N\varepsilon_n}$ 对 $N$ 是 $N^{3/2}$ 级放大，$\varepsilon_n\to0$ 无速率，全靠 $N$ 冻结吸收。
- **$(1+2D)^k$**：体积比 $(D+1/2)^k/(1/2)^k$；门槛 1 由 $\sqrt2-2\omega_n>1$ 归一化而来。$D$ 在底数、$k$ 在指数，eq:N 要求"先 $k,D$ 后 $N$"，变量绑定链显形。
- **$n^2$ 权重与线长 $Nnr$ 的配对**（承第 7 节）：振动 $=$ 线长 $\times$ 导数 $L^2$ 均值开方；线长里的 $n$ 与能量权重里的 $n^2$ 开方后一一抵消。横向若不加权而线长仍 $\propto n$，振动 $\propto n\sqrt{\text{裸均值}}$ 发散。加权是把 $n^{-2}$ 提前写进能量定义的记账法。

候选失败路线（[推测]，素材 2.8(d)）：

1. **不传输、直接在交叉点收集 $h_i(c)$**。不存在对所有色 $i$ 同时合法的单点 $c$：一点至多栖于一条横条加一条竖条（两色）。$N$ 个向量必须来自 $N$ 个不同基座点，"每色一行一列加每色锚点 $p_i$"的三件套是把不同纤维上的数据搬进同一 $\R^k$ 做比较的唯一通道。
2. **把 $z_0=0$（零标签）加入打包集**。可行（$\|h_i\|\ge1$ 由 (eq:bilip) 下支，开球互斥门槛勉强够），论文不用：$N$ 个已经够矛盾，加第 $N+1$ 个不改变 $N>(1+2D)^k$ 的量级，无收益。
3. **在 snowflake 距离 $d^\alpha$ 下重演本节**。第 4 到 7 步全线崩：$d^\alpha$ 破坏 sheet 差分 $(F_i-F)/r$ 的加法结构与 AC 线积分（振荡不再由导数 $L^2$ 控制）；交叉分离变成 $(\sqrt2r)^\alpha$ 对 $Dr^\alpha$，归一后 $\sqrt2^\alpha>1$ 虽在，但没有机制把它转成"每色向量两两分离"。障碍精确停在 $\alpha=1$，与 Assouad 定理（$\alpha<1$ 可行）形成互补拼图。论文未讨论 snowflake 变体，此对照是素材推断。

## 9 有限-$p$ 函数空间障碍：一条 Gauss 等距把 $S$ 原样搬进每个 $L_p$

对应素材 2.9，tex:385-412。节的开场白（tex:387）先定调："A normalized Gaussian series gives isometric realizations of the same fixed metric space in real $L_p[0,1]$ for every finite $p\ge1$."逐字陈述（tex:389-391）：

```tex
\begin{corollary}[Finite-$p$ function-space obstruction]\label{cor:lp}
For every real $1\le p<\infty$, the fixed metric space $S$ of Theorem~\ref{thm:main}
is isometric to a subset $S_p$ of $L_p([0,1];\R)$, where $[0,1]$ carries Lebesgue
measure. With its induced $L_p$ metric, $S_p$ has doubling constant at most $76800$
and admits no bi-Lipschitz embedding into any finite-dimensional real normed space
at any finite distortion.
\end{corollary}
```

我进场先核对的量化变化：主定理说"进不了任何 $\R^k$"，这里目标放宽为"任何有限维实赋范空间"，源从 Hilbert 子集换成 $L_p([0,1])$ 子集，而 doubling 常数 76800 一个数都没动。"动都没动"正是这个推论的全部技术内容，我按 tex:392-406 推一遍中间步骤。

第一步，Gauss 等距恒等式。固定 $p$，在 Lebesgue 的 $[0,1]$ 上取独立同分布标准 Gauss 列 $(g_i)_{i\ge1}$。存在性论文未证（教材事实：$[0,1]$ 上可以构造可数多个独立标准正态随机变量，比如二进制展开加 Box–Muller；Lean 侧若要做这条会需要现成引理或显式构造 [推测]）。令 $c_p=(\mathbb E|g_1|^p)^{1/p}\in(0,\infty)$：高斯的全部有限矩存在且非零，这是"$1\le p<\infty$ 通吃"的真正凭据。对有限支撑实序列 $a$，$\sum_i a_ig_i$ 是中心 Gauss、方差 $\sum_i a_i^2$，正态的 $p$ 矩等于 $c_p^p(\sum a_i^2)^{p/2}$，于是 tex:394 的等式：

```tex
 \norm{\sum_i a_i g_i}_{L_p}=c_p\left(\sum_i a_i^2\right)^{1/2}.
```

我通读时在这条前停了一下：整个证明用到"高斯"这个具体分布的就此一处。线性组合仍服从正态、矩只通过方差依赖系数，别的分布要么丢了形状不变性（矩恒等式变成不等价），要么丢了任意 $p$ 的有限矩。这条恒等式就是 cor:lp 与"Khintchine 型搬运"的分水岭，失败路线 1 会回到它。

第二步，延拓到全 $\ell_2$。对一般 $x\in\ell_2$，同一恒等式用在尾部上使部分和 $\bigl(c_p^{-1}\sum_{i\le m}x_ig_i\bigr)_m$ 成为 $L_p$-Cauchy 列（尾部 $\ell_2$ 范数 $\to0$ 推着 $L_p$ 距离 $\to0$），取极限定义 $J_px$。tex:395 的插入语 "Completeness, including at $p=1$, therefore defines ..." 我特意核对过：作者写下 including at $p=1$ 是在堵"端点可能漏"的质疑，$L_1$ 完备靠 Riesz–Fischer，极限照样存在。线性与等距 $\|J_px-J_py\|_p=\|x-y\|_2$ 由逐条极限传递。自检：$p=2$ 时 $c_2=1$，$J_2$ 在标准正交基意义下就是恒等，与 thm:main 相容，这个推论是严格推广，并非旁证。

第三步，目标一般化与 doubling 继承。反设 $f:S_p\to Y$ 是双 Lipschitz 嵌入，$Y$ 实赋范、$\dim Y=k<\infty$、失真有限。$k=0$ 时 $S_p$ 多于一一点（$S$ 含整个底座平面），单射都不存在，tex:404 一句带过。$k\ge1$ 时取线性同构 $T:Y\to\R^k$，有限维范数等价使 $T$ 双 Lipschitz（tex:405 "Equivalence of finite-dimensional norms makes $T$ bi-Lipschitz with finite distortion"），复合 $T\circ f\circ J_p|_S:S\to\R^k$ 是有限失真嵌入，与 thm:main 矛盾。doubling 侧：$J_p|_S$ 是等距，度量原样继承，76800 零漂移。

假设与常数的机械理由：
- **除掉 $c_p$ 的理由**：让 $J_p$ 成为精确等距，并非法向 $c_p$ 倍的相似。归一化使"$S_p$ 与 $S$ 是同一个度量空间"字面成立，76800、无障碍性全部免费继承；不除的话陈述要写成 "bi-Lipschitz with constant $c_p$"，下游每个距离界乘上 $c_p$ 幂，结构不变但句子脏了。等距与 bi-Lipschitz 搬运在定量守恒上的这个本质差别，正是 cor:lp 能"零成本"的原因，对照素材 3.4 未述清单末条。
- **右端点 $p<\infty$ 硬性**：$p=\infty$ 时 $g_1$ 无界，$g_1\notin L_\infty$，$c_\infty=\infty$，第一步恒等式根本没有对象。左端点 $p=1$ 软性通过（一阶矩有限、$L_1$ 完备）。区间开闭完全由高斯矩的存在性决定。
- **"$76800$" 原样**：等距的平凡推论。这个数在 cor:lp 里的角色只是"继承登记"；它真正被重新消费是在 cor:banach（第 10 节的 $\lambda$）。
- **划界句（tex:408 逐字）**："This transfer adds no new metric construction. Corollary~\ref{cor:lp} concerns function-space sources $L_p[0,1]$, not coordinate $\ell_p$ sources; the compact result below is a separate transfer to arbitrary infinite-dimensional Banach sources." 作者主动把贡献范围钉在函数空间源上，坐标 $\ell_p$（$1<p<2$）情形不碰。
- **LN 覆盖范围句（tex:408 逐字）**："Lafforgue and Naor proved the qualitative fixed-set obstruction with Euclidean targets for $p>2$ and, in the paragraph following their Theorem~1.1, recorded the corresponding question for $1<p\le2$ as open at that time, while noting stronger known results for $p=1$ \cite[Theorem 1.1 and the following paragraph]{LN}. Theorem~\ref{thm:main} treats $p=2$, and Corollary~\ref{cor:lp} answers that qualitative fixed-set question with finite-dimensional Euclidean targets when $1<p<2$." 我的对账结论：增量恰为 $1<p<2$ 的函数空间、定性、固定集版本；$p>2$ 让给 LN，$p=1$ 承认存在更强已知结果。
- **姊妹篇对照（tex:410-412 逐字）**："Finite-set dimension reduction in $L_p$, for $1<p<\infty$ and $p\ne2$, allows the target dimension to depend on cardinality~\cite[Theorem~1.1]{OpenAI2026LpReduction}, unlike the fixed infinite-set obstruction of Corollary~\ref{cor:lp}." 同库 2026-09-23 的 preprint 给 $L_p$ 有限集降维的正面结果，两篇拼成"有限集可降维（维数依赖基数）vs 固定无限集不可"的镜像；作者在 cor:lp 末尾专门放这三行，是防读者把正负两条混读。

候选失败路线（[推测]，素材 2.9(d)，论文一概未述）：
1. **Rademacher 级数替代高斯**。Khintchine 给 $\|\sum a_ir_i\|_{L_p}\asymp_p(\sum a_i^2)^{1/2}$：等价，并非相等。副本仍是 doubling（$\asymp_p$ 是双 Lipschitz 通道，doubling 有限性保住），但 76800 会被 $\asymp_p$ 常数扭掉，"doubling constant at most 76800" 这句就写不成；且 Rademacher 张成的是 $\ell_2$ 在 $L_p$ 中的受控拷贝，并非精确拷贝。高斯的正态矩恒等式是唯一零失真通道，代价是分布没有选择权。
2. **把值域搬进坐标空间 $\ell_p$（$p\ne2$）**。高斯序列几乎每条轨道不 $\ell_p$-可和（衰减速率不足），$J_p$ 的值域天然住在函数空间 $L_p[0,1]$ 而落不进坐标 $\ell_p$。$\ell_p$（$p>2$）一侧已由 BGN/BSS 占据（tex:44），$1<p<2$ 的坐标版本论文未述，是真开放边界（第 11 节未述清单第 5 条），引用时不能把 cor:lp 说成覆盖了它。
3. **$p=1$ 追求最强**。LN 注明 $p=1$ 有更强已知结果（tex:408 转述）；本推论若单独在 $p=1$ 发力就会丢掉统一性。作者要的是同一个 $S$、同一个 76800 同时住进全部 $1\le p<\infty$，统一性是卖点，单点强度让位。

另记一笔取证预告：Lean 目录里 cor:lp 没有任何对应物（无 $L_p$、无 Gauss、无矩计算，第 12 节详述），"形式化覆盖了 cor:lp"这种句子在这篇笔记里不允许出现。

## 10 任意无限维 Banach 中的紧障碍：从固定集到收缩簇并（cor:banach）

对应素材 2.10，tex:414-491。开场白（tex:416）逐字：

> "Finite witnesses to Theorem~\ref{thm:main} can be placed in any infinite-dimensional real Banach space by the classical Dvoretzky theorem. A geometrically shrinking union of these finite clusters, with its limit point adjoined, is compact and retains a uniform doubling bound."

逐字陈述（tex:418-421）：

```tex
\begin{corollary}[Compact Banach-space obstruction]\label{cor:banach}
There is a universal constant $\Lambda$ such that every infinite-dimensional
real Banach space $B$ contains a compact subset $K_B$ whose doubling constant
is at most $\Lambda$ and which admits no bi-Lipschitz embedding into any
finite-dimensional real normed space at any finite distortion. The subset
$K_B$ may depend on $B$, but is chosen independently of the target dimension
and distortion.
\end{corollary}
```

先回答"它比第 9 节强在哪"。三条：环境从"每个 $L_p$"扩到"每个无限维实 Banach 空间"（$L_p$ 只是特例）；拓扑从"可分完备度量子集"升级到**紧**（thm:main 的 $S$ 含整个底座平面，压根不紧，摘要那句 "even for compact subsets of Hilbert space" 靠的正是这次升级）；量化保持"$与目标和弦数、失真无关"，外加 $K_B$ 只依赖环境空间。多用的机器：FIP 紧致化引理（把无穷障碍切成有限证书）、对角枚举 $X_j$、有限维 Dvoretzky（严格失真 $<2$）、平移缩放装配加覆盖账。付出的代价同样明码：集不再固定（依赖 $B$），doubling 常数从 76800 爆炸为 $\Lambda=1+6\lambda^8\approx2.7\times10^{39}$，且"同一度量空间"这种零漂移不再是显然的。证明四段，$\lambda=76800$，tex:422 有句口径声明 "We use closed balls below; the same estimates work for open balls."（下文覆盖账都用闭球陈述，开球版本同估计，这是为了装配时中心选取干净。）

**第 1 段，有限证书**。命题：每对 $(k,A)$（$A\ge1$ 有限）存在 $S$ 的有限子集不可嵌入 $\R^k$、失真 $\le A$。反证走 Tychonoff：设全部有限子集都可，固定 $o\in S$，对每个 $x$ 放紧盒 $Q_x=\{u\in\R^k:\|u\|\le A\,d_S(o,x)\}$，乘积 $\prod_{x\in S}Q_x$ 紧（这里吃了选择公理，与 Lean 侧 `Classical.choice` 的用途对得上）。每条双向约束 $d_S(x,y)\le\|f(x)-f(y)\|\le A\,d_S(x,y)$ 在乘积空间中按坐标连续所以闭。有限交性质：有限多条约束只牵涉有限点集 $E\cup\{o\}$，取 $E$ 的某个嵌入 $g$，平移使 $g(o)=0$、除以下界尺度，双向约束自动满足；盒约束 $\|g(x)\|\le A\,d_S(o,x)$ 由上支加 $g(o)=0$ 给出；其余坐标置零。紧致性把逐有限集满足拧成全局 $f$ 满足所有约束，与 thm:main 矛盾。随后对角取用：每 $j$ 选有限 $X_j\subset S$ 不可嵌入 $\R^j$、失真 $\le j$，且 $\#X_j\ge2$（tex:435 "Each $X_j$ has at least two points."）。tex:436 那句是固定集原则的变形宣示，值得逐字留着："These choices are made before any target for $K_B$ is considered."

**第 2 段，Dvoretzky 放置与簇 doubling $\lambda_0=\lambda^4$**。固定无限维 $B$。经典有限维 Dvoretzky（tex:438 引 `\cite[Section~7]{Dvoretzky}` 与 `\cite[Theorem~1.1]{COO}`）给 $X_j$ 的有限维 Hilbert 张成空间到 $B$ 的线性嵌入 $T_j$，失真**严格** $<2$（一维情形 immediate）；重标度后 $d_S(x,y)\le\|T_jx-T_jy\|_B\le2\,d_S(x,y)$。tex:443 的防御句逐字："Only this qualitative finite-dimensional form of Dvoretzky is used."（只用这个定性有限维形式；无测度、无渐近、无穷维情形一概不碰。）$Y_j=T_jX_j$ 的 doubling 按内蕴定义数：目标球 $B_{Y_j}(T_jx,R)$，原像 $E\subset B_S(x,R)$（下界保证）。源球经四次半价细分成 $\le\lambda^4$ 个 $R/16$ 球；凡与 $E$ 相交的细分球里取代表 $x_0\in E$，同球内 $x'\in E$ 满足 tex:448 的算术：

```tex
 \norm{T_jx'-T_jx_0}_B
 \le2d_S(x',x_0)
 \le2\left(\frac R{16}+\frac R{16}\right)
 =\frac R4\le\frac R2
```

代表点的像 $T_jx_0$ 在 $Y_j$ 内（中心内蕴性满足），于是 $Y_j$ 是 $\lambda_0=\lambda^4$-doubling，一致于 $j$ 与 $B$。

**第 3 段，紧装配与覆盖账**。取单位向量 $v\in B$，$a_j=2^{-j}$，$\eta=1/100$；平移加正缩放（失真保持 $<2$、doubling 不变的仿射等距搬运）把 $Y_j$ 摆进簇 $C_j\subset B_B(a_jv,\eta a_j)$，令 $K_B=\{0\}\cup\bigcup_jC_j$。紧性按序列语言（tex:465 逐字）："Every sequence in $K_B$ therefore has either a constant subsequence among $0$ and finitely many clusters, or a subsequence whose cluster indices tend to infinity and which converges to $0$."（注意这是"每序列有收敛子列"，度量空间中与开覆盖紧等价；Lean 侧改用开覆盖论证，第 12 节。）覆盖账四笔。其一，尾部一桶收编：$a_j\le r/4$ 的全部簇连同极限点 0 落进单个 $B_{K_B}(0,r/2)$，因为 $\|z\|\le(1+\eta)a_j\le\frac{101}{400}r<\frac r2$；tex:469 补一句容易被追问的："The center $0$ need not belong to the ball being covered."（doubling 只要求球心在集合内，不要求在被覆盖的球内。）其二，活跃簇有限：$I=\{j:C_j\cap B_{K_B}(x,r)\ne\emptyset,\ a_j>r/4\}$。簇间分离（$i<j$，$p\in C_i$，$q\in C_j$，用 $a_j\le a_i/2$）：

```tex
 \norm{p-q}_B
 \ge(a_i-a_j)-\eta(a_i+a_j)
 \ge\left(\frac12-\frac{3\eta}{2}\right)a_i
 =\frac{97}{200}a_i.
```

若 $|I|\ge2$，最小指标 $i$ 的簇与另一簇的点同在 $B(x,r)$，距离 $\le2r$，得 $a_i\le400r/97$；所有活跃尺度挤进 $(r/4,(400/97)r]$，极比 $<1600/97\approx16.5<32$，二进至多 5 档。$|I|=1$ 不需要界（tex:481 原话 "no bound on that scale is needed"）。其三，逐簇覆盖：$B_{K_B}(x,r)\cap C_j\subset B_{C_j}(y_j,2r)$（两点同经 $x$ 三角），$\lambda_0$-doubling 用两次（$2r\to r\to r/2$）得 $\le\lambda_0^2$ 个 $r/2$ 球，中心在 $C_j\subset K_B$。其四，总账 $1+5\lambda_0^2\le1+6\lambda^8$，tex:487："This proves a universal doubling bound; one may take $\Lambda=1+6\lambda^8$."

**第 4 段，障碍传递**。反设 $K_B$ 可嵌入某有限维实赋范空间（零维排除，$\#K_B\ge2$），同构拉回得 $f:K_B\to\R^k$ 失真 $D$。取 $j\ge\max(k,2D)$。复合 $X_j\xrightarrow{T_j}C_j\xrightarrow{f}\R^k\hookrightarrow\R^j$（补零等距用 $j\ge k$）：失真严格 $<2D\le j$，与"$X_j$ 不可嵌入 $\R^j$ 失真 $\le j$"矛盾。tex:487 两处 "strictly below" 都吃紧：Dvoretzky 若只给 $\le2$，复合上界就撞上阈值 $\le j$，矛盾失效。$\blacksquare$

假设与常数的机械理由（素材 2.10(c)）：
- **$a_j=2^{-j}$**：一份差两职。$a_j\to0$ 供紧性与尾部一桶收编；倍率恰 2 与窗口 $(r/4,(400/97)r]$ 的极比 $1600/97\in(2^4,2^5)$ 咬合出"至多 5 档"。窗口右端 $400/97$ 来自分离系数 $97/200$，左端 $r/4$ 是尾部判据，两头都由 $\eta$ 间接控制。
- **$\eta=1/100$**：约束只有两条：$\frac12-\frac{3\eta}2>0$（间距为正，即 $\eta<\frac13$）与 $1.01/4<\frac12$（尾部收编，即 $\eta<1$）。取 1/100 让两处都以"几乎不打折"通过，分离系数 $97/200=0.485$ 贴近 $\frac12$、极比 $\approx16.5$ 逼近下限 16。$\eta\to\frac13$ 时分离 $\to0$、活跃尺度窗口发散、$\Lambda$ 爆炸，1/100 是"远离奇点又不装优化"的圆整。
- **$\lambda^4$（四次半价）**：净开销 $R\to R/16$ 加一座失真 2 的桥：$R/16$ 球内两点源距 $\le R/8$，经 $T_j$ 上支放大 2 倍恰为 $R/4\le R/2$。一般化：Dvoretzky 失真 $\kappa\in[2,4)$ 时 $\kappa R/8\le R/2$ 仍活、指数 4 不变；$\kappa\ge4$ 必须加半价次数、$\lambda_0$ 升幂。Lean 支线失真 $\kappa=36$，于是指数变 8，一般规则 $2^n>4\kappa$（第 12、13 节各出现一次）。
- **"$\le j$" 阈值与严格不等号**：见证 $X_j$ 的不可行性按"$\le j$"定义，复合给出"严格 $<2D\le j$"才能踩进禁区。tex 里 "distortion strictly below two"（438）与 "strictly below $2D\le j$"（487）两处严格字都不是修辞。
- **$1+5\lambda_0^2\le1+6\lambda^8$**：$\lambda_0^2=\lambda^8$，$5\le6$ 并上极限点的 1。$\Lambda\approx6\times(7.68\times10^4)^8\approx2.7\times10^{39}$；论文明示这个数不要紧，摘要强调的只有 "independent of the ambient Banach space"。与 Lean 版差异（论文做 $5\to6$ 松弛、指数 8；Lean 不做 $5\to6$、指数 16）留到第 12 节分歧 1 对账。

候选失败路线（[推测]，素材 2.10(d)，论文未述）：
1. **跳过有限逼近、直接 Dvoretzky 搬整个 $S$**。$S$ 张成无穷维 Hilbert；Dvoretzky 只对有限维子空间给好拷贝，无穷维整体没有定理保证（$B$ 甚至可能不含等距 $\ell_2$）。障碍必须先切成有限片 $X_j$ 逐片搬。第 1 段的 FIP 引理就是这份"切成有限"的存在理由，对角枚举 $(k,A)\mapsto j=\max(k,\lceil2D\rceil)$ 再把片号与簇尺度 $a_j$ 对齐。
2. **簇不缩放（等距放置）**。$C_j$ 保持原尺度则无 $a_j\to0$：$K_B$ 不紧、尾部无法一桶收编、活跃簇无限、覆盖账发散。失真 $<2$ 的仿射缩放同时解决紧性与 doubling 两个职务，是唯一的省事配置。
3. **直接宣称 $K_B$ 的 doubling $\le\lambda$**。双 Lipschitz 像保持 doubling 的有限性但**不保持定量值**；$\lambda\to\lambda^4\to\lambda^8$ 的塔式放大是中心内蕴要求加两座桥（Dvoretzky、装配）的必然代价。对照第 9 节：等距搬运零漂移，bi-Lipschitz 搬运付指数，这正是两节并置想照出来的差别。

最后兑现第 0 节许下的那笔账：摘要把 Banach 版顶在头一句（"Every infinite-dimensional real Banach space contains a compact doubling subset..."），可正文劳动分布完全倒挂：thm:main 及前置占 tex:47-383 的三百余行，cor:lp 二十几行，cor:banach 七十八行且每段都是标准件（FIP、Dvoretzky 定性形式、几何收缩并、覆盖记账）。我读出的宣传逻辑：对题目外的读者，"连紧集都反例"才是终点感最强的陈述，而它的边际成本几乎为零（有限证书 + 现成 Dvoretzky）。一篇论文的价值重心和展示重心可以不在同一处；第 9、10 两节的分工就是例证，一个守"同一度量空间"的零漂移，一个守"任何无限维环境 + 紧"的覆盖面，两条都靠 thm:main 独自供血。

## 11 我的问题坐标与设计约束：问题史、方法自述与作者的防御句

对应素材 3.1 到 3.4。问题史的三段逐字引文（tex:40、42、44）已在第 0 节全文摆过，这里不重复原文，只记我二读之后建立的坐标系。

**问题地图**。三根轴：源空间（住在 Hilbert 与否；函数空间还是坐标空间）、距离（原始 $d$ 还是雪花化 $d^\alpha$）、集类型（有限集还是固定无限集、紧不紧）。正面一侧全在"距离"轴上活动：Assouad 给 $\alpha<1$ 总可行，Naor–Neiman 把目标维数压到只依赖 doubling 常数（tex:42 的 "The distortion bound still depends on the snowflake exponent" 标明失真仍欠 $\alpha$），Gottlieb–Krauthgamer 对有限 Hilbert 子集把雪花失真压到任意接近 1（维数换给三个参数）。负面一侧在"源空间"轴上：LN 与 BGN/BSS 都要求环境指数严格大于 2（tex:44）。Lang–Plaut（LP Question 2.4，NN Question 1 重述，GKL Section 6 Question 1 独立提出）问的是三轴交点 (Hilbert, $\alpha=1$, 任意 doubling 子集) 能否共存；thm:main 答否，选点恰是该交点上"固定无限集"一极。cor:lp 与 cor:banach 把前线分别推向"环境 = 每个 $L_p$"与"紧 + 任意无限维 Banach"，主坐标 (Hilbert 源、原始距离、固定集) 一步未让。三个提问出处我核对过等价性：GKL 的提法带算法降维背景，所以 tex:50 那句 "dimension and distortion bounds depending only on the doubling constant cannot hold" 读起来像定理更像否定一条复杂性猜度：反例的强度恰好只需否定"存在只依赖常数的界"。Schioppa 撤回事件（tex:44 末句）是本文动机的最近历史节点，"a possible issue with its duality argument" 一句之外论文未述细节；我把它读作武器库替换的信号 [推测，第 0 节已记]：本作通篇无对偶、无超平面分离，只有二维 Euclidean 微分、二次方差恒等式、面积比较与体积打包。

**方法自述**（"The construction and proof strategy"，tex:54-72，首段逐字）：

> "The proof couples a covering argument with a derivative obstruction. Differentiation has a substantial history as a method for ruling out Euclidean embeddings: Cheeger's framework gives such obstructions under doubling-measure and Poincar\'e-inequality hypotheses \cite[Section 14, Theorem 14.3]{Cheeger}. Laakso's nonembedding argument gives a related separation-versus-stretch principle: separated branches force an increase in stretch along a subsegment \cite[Section 4, Theorem 4.1]{Laakso}. Here the analytic step uses ordinary Euclidean differentiation of Lipschitz maps on open subsets of $\R^2$ and a quadratic variance identity. A lexicographic extremum treats the two derivative columns successively, and crossings turn their small variation into a packing obstruction. We describe the geometry first."

这段的修辞结构是"认两个祖先、各取一件、其余全弃"：从 Cheeger 取"用微分排除嵌入"的总方针，弃它的假设组合（doubling 测度 + Poincaré，$S$ 两样都不承载，第 3 节 (d)3 拆过）；从 Laakso 取"分离逼拉伸"原理，把载体从树状分枝换成周期块棋盘。自家四件套随后列出：普通 $\R^2$ 微分、方差恒等式、字典极值先后处理两导数列、crossings 化小振荡为打包矛盾。这正是我第 5 到 8 节的展开顺序的倒序。tex:60 目标句与 tex:40 问题句的呼应（"whether a bound on metric covering complexity permits a reduction to finitely many Euclidean coordinates while preserving all distances up to a fixed factor"）我挂回第 0 节。

**作者明写的设计约束**（策略摘要三段，tex:60-64、66-69、71-72，逐字引用后各加一句"作者在防什么"）：

1. tex:60-64，共同 sheet 接口句：

> "If $F$ is one sheet and $F_i$ is obtained by adding a color-$i$ displacement at an unused level of size $r$, then $\left\lVert F_i(p)-F(p)\right\rVert\le Dr$ wherever the added displacement is permitted. The horizontal and vertical restrictions belong to the same map $F_i$. Our objective is to find one horizontal line and one vertical line of each color along which the relative offset $(F_i-F)/r$ is nearly constant."

这句防的质疑是"横条上读到的数据和竖条上读到的是不是同一个映射"。中间那句 "The horizontal and vertical restrictions belong to the same map $F_i$" 我在第 6 节称它为全证明的机关句：偏移被同一个函数耦合，字典极值才能对两个导数列先后使用；若横竖各配一个扩张映射，lem:compact 的额度传递就断了链路。末句则把选线目标提前声明，第 8 节的 eq:rowline/eq:colline 是它的兑现。

2. tex:69，两处极值的分工句：

> "Compactness suffices for this latter estimate; no quantitative modulus of the second extremum is needed."

> "The wide vertical strips first force the mean squared horizontal derivative norm of the vertically selected sheets toward $A$. The second extremum then gives vertical mean-square error tending to zero, with no growing factor required."

第一句防审稿追问速率：作者当众声明 lem:compact 的 $\delta(\varepsilon)$ 全程只以紧性推论的面目出现，证明不需要它的增长率。第二句解释各向异性为什么使这个豁免成立：第一个极值被 $1/W_j$ 项消费（宽条带逼 $\langle\|G_V^x\|^2\rangle\to A$），第二个极值只输出"趋于零"的 squeeze，"with no growing factor required" 与 tex:38 的 "This is simultaneous because $N$ is fixed" 呼应：无速率引理的债由 $N$ 冻结来还（我第 7 节 (d)3 的同一枚硬币）。

3. tex:72，固定集宣示：

> "The fixed set is used throughout; only the sheets, local rectangles, and recurring level vary with $n$."

这句防量化偷换的指控（反例到底依不依赖被反设的嵌入）。它与 tex:113 的 "Neither $S$ nor its defining parameters will subsequently depend on a proposed embedding." 首尾呼应；同一纪律在 tex:246（"The map $f$, its target parameters $k,D$, the set $K$, and the numbers $A,B,N$ remain fixed throughout."）第三次出现，全文密度最高的一条自禁。

**散在各节的防御句**（素材 3.3 清单，逐字 + 我在防什么的读法）：
- tex:309："In particular, convergence of the vectors $v$ themselves is unnecessary." 防"逐 $n$ 选的导数向量凭什么收敛"：双侧 nearmax 夹逼替代紧性，$v$ 只需要矩信息不需要极限。
- tex:345："Oscillation on a Lipschitz line is controlled at every point by its derivative integral, so no differentiability assertion is required at the crossings." 防"交叉点可能不是好点"：AC 的端点双侧估计对线上一切实点成立，Lipschitz 连续把 a.e. 信息抬到端点。
- tex:408 划界句与 LN 覆盖句（全文见第 9 节）：前者防"创新被高估"（transfer 不新增任何度量构造）兼防管界误读（函数空间源、非坐标 $\ell_p$），后者防侵占 LN/BGN/BSS 优先权，且承认 $p=1$ 存在更强已知结果。
- tex:410-412 姊妹篇句（全文见第 9 节）：防"同库两篇自相矛盾"的表面观感（有限集正面 vs 固定无限集负面）。
- tex:443："Only this qualitative finite-dimensional form of Dvoretzky is used." 防重型机器疑心：cor:banach 只吃经典定理的有限维定性形式（失真严格 $<2$），无穷维渐近、测度版本一概未用。Lean 支线连这个也省了（Auerbach 自建，第 12 节分歧 1）。
- tex:50 推论句与 tex:28 摘要（全文见第 0 节）：前者防定理被读弱（它直接否定"界只依赖 doubling 常数"这一元命题），后者防定理被读小（首句即 Banach 版）。
- 固定集原则的三次重申（tex:113、72、246）：防自指。

防御网合起来挡三类指控：量化偷换、速率缺失、管界侵占。我注意到一条空缺：全文没有任何一处为常数尺寸辩护（76800、1000、$n^{-4}$ 都没进过防御句），说明作者不把常数最优当作贡献的一部分，这与素材 5.2"松弛/刚性分层"的观察吻合。

**论文未述清单**（素材 3.4，这条清单就是我写 0 到 13 节时编造的边界）：
1. 失败构造尝试史。Heisenberg、tree、snowflake 变体一概不见于正文；各节 (d) 的候选失败路线全部是素材侧 [推测]，我的复述不升级为事实。
2. $76800$、$1000$、$n^{-4}/n^{-8}$ 等常数是否最优、有无搜索调优。
3. Schioppa 对偶论证问题的具体技术细节（只有 "a possible issue" 一句）。
4. 任何计算、实验或辅助工具过程；文风、编号、引用格式完全是传统数学 preprint 体裁。
5. $1<p<2$ 时坐标空间 $\ell_p$ 的固定集障碍（cor:lp 被作者刻意限制在 function-space $L_p[0,1]$，tex:408 划界句为证）。
6. doubling 常数的下界方向：是否存在阈值 $C_0$，使 doubling $\le C_0$ 的 Hilbert 子集总有有限维嵌入（本反例的 76800 远大于平面子集的自然常数（约 $5$ 到 $6$））。我想把它作为余味问题提出 [推测：最自然的后续，属论文之外]，引用时必须注明论文未讨论。
7. $S$ 的 Hausdorff 维数、测度性质等更细不变量。对照第 9 节：等距搬运守恒一切度量不变量，正说明 cor:lp 的"零代价"只有对度量性质成立。
8.（本笔记取证新增）$K$ 非空为何成立（tex:166-175 只写 "It is nonempty and compact"，见证 $w=0$ 是 Lean 逼出来的，第 12 节）；`scale j = 1000^{-(j+1)}` 的下标平移无解释（纯粹是形式化侧的省事选择）。
9.（本笔记取证新增）"$n$ 的双重角色"从未被论文点破：tex:69 同时写 $(N_j,W_j)=(N,n)$，读者要到 Lean 的 `widthFactor` 独立调度才看清收敛引擎是 $1/W$ 而打包引擎是 $N$（第 12 节分歧 5）。

## 12 Lean 取证：一台 4664 行的机器怎样跟着论文走

### 取证范围、元信息与"无 sorry"核查

登记条目（`E:\math\lean\formalization.yaml` 第 87 行附近，逐字）：title 为 "A doubling Hilbert subset with no finite-dimensional bi-Lipschitz embedding"，authors 为 ["OpenAI"]，id 指向论文根目录 `main.pdf`，type 为 article。口径先立起来：登记的 id 是 PDF，而本笔记的数学内容一律取自 `build/main.tex`，PDF 只当索引用，从未作为读取来源。挑战配置 `E:\math\lean\ComparatorChallenges\DoublingHilbert.json` 逐字：

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

三个读点。其一，靶心唯一：被要求证明的定理只有 `OAI.DoublingHilbert.main`（求解模块 `Main.lean`）。同目录 `CompactBanach.lean` 里的 `OAI.CompactBanach.main`（cor:banach 的形式化）不在 `theorem_names`，即 Banach 推广是"论文自证但竞赛不要求"的超额部分，这决定下文"主线 12 文件 / 支线 16 文件"的分层。其二，`enable_nanoda: false` 表示此题不用 Mathlib 里 Nanoda 的度量几何库（那套 doubling/Assouad 形式化），所有 covering 论证手写。其三，公理口径只允许 Mathlib 默认三件。

"无 sorry" 核查（以下全部是对源码文本的静态扫描结果，非编译验证）：对整个 `DoublingHilbert/` 目录跑正则 `sorry|admit\b|^axiom|native_decide|decide!`，命中仅一处，且是英文散文里的动词：

```
Doubling.lean:100:/-- Compact metric sets admit a finite upper bound for any fixed positive separation. -/
```

即 28 个 `.lean` 文件（`wc -l` 合计 4664 行，含 `Main.lean`；最长的三个是 `Rectangles.lean` 489 行、`Construction.lean` 435 行、`SelectedSheets.lean` 405 行）没有 `sorry`、没有 `admit` 战术、没有自定义 `axiom`、没有 `native_decide` 后门。全库唯一的真 `sorry` 在挑战声明文件 `ComparatorChallenges\DoublingHilbert.lean` 第 26 行，是给竞争者留的空缺，不是求解者的：

```lean
/-- A single fixed subset, independent of dimension and distortion. -/
theorem main : ∃ S : Set RealL2,
    DoublingAtMost S 76800 ∧
      ∀ k : ℕ, 0 < k → ¬ AdmitsBiLipschitzEmbedding S k := by
  sorry
```

数字对账在这里做完：素材早期草稿曾误报"27 个文件 / 4819 行"，当前文本已订正为 28 / 4664，本笔记头部与各节一律按 28/4664。口径要老实分两层：**读源码文本得到的**：无 sorry/admit/axiom/native_decide；`Classical.choice` 的可指认用途有两处（`cover_of_finite_code` 用 `Classical.choose` 从每个非空纤维取代表、`globalSheet` 用 `.choose` 钉死扩张函数）；`@[simp]` 共 12 处、`@[ext]` 共 1 处（行号清单见后文 tactic 小节）。**没有机器验证过的**：`#print axioms` 在目录内出现 0 次，我也没有执行编译，所以"`OAI.DoublingHilbert.main` 的公理依赖恰为 propext/Quot.sound/Classical.choice"是 JSON 声明加源码结构的推断，要坐实需实际跑 `#print axioms OAI.DoublingHilbert.main`。

定义口径逐字对齐也属"读文本得到"：挑战文件的 `RealL2`、`DoublingAtMost`、`AdmitsBiLipschitzEmbedding` 与求解侧 `Model.lean` 同名定义文本完全相同（除空白），"解的是同一道题"没有定义层面的漂移空间。三个细节决定 76800 的性质：`bound : ℕ`（整数，并非渐近符号）、`Finset S`（中心是取自子集的有限证书）、`r / 2`（半半径开球）。论文的"存在常数 $C$ 使得……"在这里被强制量化成"card ≤ 76800"，这正是 `Doubling.lean` 全部工作的动机；而数学界更常用的闭包/任意中心等价定义在此不被采用，是为了让整数上界可验证、不需要紧致性闭包论证。

### 模块清单与依赖图

主线 12 文件（Hilbert 反例）：

| 文件 | 行数 | 目录内依赖 | 一句话角色 |
|---|---|---|---|
| `Model.lean` | 24 | 无 | 题目口径三定义（与挑战文件逐字同） |
| `Construction.lean` | 435 | Model | 集合 $S$、尺度、颜色/宽度编码、strip 条件、距离比较 |
| `Doubling.lean` | 287 | Construction | `DoublingAtMost S 76800` + 紧集 packing 界 |
| `Derivatives.lean` | 235 | Construction | Rademacher/Lebesgue 好点、`derivativeCompact` |
| `Integration.lean` | 260 | Derivatives | 向量值 FTC、逐线积分、$L^2$ 振荡、`globalSheet` |
| `Rectangles.lean` | 489 | Integration | `Segment`/`Rectangle` 概率律、`IsBoundedField`、修剪因子 4 |
| `Grids.lean` | 340 | Rectangles | `stripColor` 可测选择器、细层存在、网格裁剪、sheet 偏移/分离 |
| `SelectedSheets.lean` | 405 | Grids | `stripWidth`/`xPeriod`/`yPeriod`、`PeriodGrid`、逐 strip 均值界 |
| `Extremal.lean` | 177 | 无 | 字典序极值、仿射屏障、方差恒等式 |
| `Energy.lean` | 368 | SelectedSheets, Extremal | prop:energy 定量版 + `exists_small_energy_grid` |
| `Crossings.lean` | 370 | Energy | 逐色选线、crossings、`exists_separated_family` |
| `Main.lean` | 69 | Crossings, Doubling | `no_normalized_embedding`、`no_scaled_embedding`、`main` |

支线 16 文件（Banach 推论链，行数括注）：`CompactModel`（21，抽象度量空间口径）、`IntrinsicCovers`（76，intrinsic↔ambient 等价与迭代覆盖）、`CoverTransfer`（68，失真 36 ⇒ 指数 8）、`ClusterScales`（98，簇尺度算术：101/100、97/200、five_scales）、`ClusterPlacement`（67）、`ClusterCover`（135，$1+5L^2$）、`CompactUnion`（43，紧性）、`Auerbach`（98，替代 Dvoretzky）、`CoordinateSupport`（90）、`CoordinateMap`（58）、`SparseCoordinates`（102，$\le6R$）、`FinitePlacement`（63，失真 $\le6$ 线性搬运）、`FiniteCompactness`（92，Tychonoff/FIP）、`FiniteWitness`（43）、`FiniteTargets`（57，任意有限维目标 ⇒ $\R^{\dim}$）、`CompactBanach`（94，支线主线）。主线与支线混放同一目录，import 方向几乎单向：支线文件 import `Main`，只为复用 `RealL2`/`constructedSet` 符号。

主线拓扑（自 `Main` 回溯）：

```
Main ← Crossings ← Energy ← SelectedSheets ← Grids ← Rectangles ← Integration ← Derivatives ← Construction ← Model
                Energy ← Extremal（自足工具层，纯紧集/概率论证）
                Doubling ← Construction；Main ← Doubling
```

一条长链加两个旁支（`Extremal`、`ClusterScales` 只 import Mathlib），几乎没有菱形依赖。我把这张图读成论文参数选择顺序（先 $D$、再紧集 $K$、再 $\varepsilon_n$、再 $n$）的机器固化：Lean 把"谁先谁后"变成了 import 的不可逆方向。

docstring 密度不对称（grep 贴定理前的单行 docstring 计数）：主线 12 文件共 81 条（`Construction` 10、`Grids` 10、`Rectangles` 9、`Doubling` 8、`Integration` 8、`Derivatives` 7、`Extremal` 8、`Crossings` 8、`Energy` 5、`SelectedSheets` 3、`Main` 3、`Model` 2），支线 16 文件同一计数全为 0（逐文件执行，无一例外）。密度也不均：`SelectedSheets` 405 行仅 3 条，`Rectangles` 489 行 9 条。多条主线 docstring 是方法论自述，并非命名说明（下文逐字引三条）。[推测：解释性投入集中在论文叙述最吃紧的解析核心；Banach 侧被当作"标准组合论证"，不需要边注。]

### 主线逐模块取证

`Model.lean`：三定义见上节引文，不再复述；它是唯一"论文句子 = Lean 句子"零损耗的模块。

`Construction.lean`：`scale j := (1000 : ℝ)⁻¹ ^ (j + 1)` 把论文 $r_j=1000^{-j}$ 整体下标平移一格（docstring 明说指数是 `j+1`，论文未述理由；效果是 `scale 0 < 1` 免掉全篇 $j\ge1$ 边界判断 [推测：另让 `exists_fine_level` 的 `max J (sup+1)` 这类 omega 更短]）。$(N_j,W_j)$ 的"无穷 Often 遍历"被换成 `Nat.unpair (Nat.unpair j)` 的三重显式编码（$(N,W,J)$），`recurrent_parameters` 的证明是 `Nat.unpair_pair` + `omega`，零分析内容：论文的存在性叙述在这里变成可计算双射，代价是 `colors j`/`widthFactor j` 成为不可读复合函数，好处是所有"层指标足够大"的论证不再提"无穷 Often"。tuple 用 $+1$ 偏移编码零/颜色（`w j = 0` 无位移、非零值 `i+1` 表颜色 `i`），全目录的 `+1/-1` 噪声源于此。`coordinate j i = 2 + Nat.pair j i` 给底座留坐标 0/1、层间块正交，是 $\mathcal H=\R^2\oplus\bigoplus_j\R^{N_j}$ 的直接实现。论文以"显然"处理的距离比较在这里逐条成引理，其中 `point_dist_sameTuple_le : dist (point p w) (point q w) ≤ 2 * dist p q` 的因子 2 真实值是 $\sqrt2$（`Base := ℝ × ℝ` 带 Mathlib 默认 $L^\infty$ 范数，`nlinarith` 只需 $\Delta x^2+\Delta y^2\le2\,\mathrm{dist}^2$）：全篇 $2D$、$(2D)^2$ 都从这次上取整流出（分歧 7）。`sum_scale_sq_le` 的 docstring 自称 "deliberately coarse"（公比 $10^{-6}$ 几何级数，$(1-10^{-6})^{-1}\le2$）：形式化只享受 1000 的松弛，不消费它。

`Doubling.lean`：prop:doubling 拆成六个可复用部件，论文只有一句"数一下条带"。`nearbyStripIndices c width := Icc (⌊c/width⌋-65) (⌊c/width⌋+65)`，基数恒等 131；docstring "an interval shorter than 128 strip widths" 给出硬需求 $2t<128\,$width，$\pm65$ 比必需的 $\pm64$ 多留 3 的余量给 floor 两端各 1 的 `nlinarith` 裕度。`nearbyLabels_card ≤ 300` 的证明是 $1+131+131=263\le300$ 的 `omega`：论文正文的"至多 300"被 Lean 以同一个不精确上界复现，因为下游只吃 `labels.card ≤ 300` 这一条。`coordinateCell c t x := ⌊8(x-(c-t))/t⌋` 把 $[c-t,c+t)$ 均分 16 个宽 $t/8$ 格（半开 `Ico 0 16`，改 `Icc 0 15` 会在 $x=c+t$ 的 floor 取值处卡死）。`cover_of_finite_code`：码纤维 → `Finset` 中心（代表用 `Classical.choose` 从非空纤维取），"码集大小 = 覆盖数"的公理化一次。`source_cover_of_label` 是 76800 的组装点：编码三元组 `(key₁, key₂, label)`，`Fintype.card = 16·16·300 = 76800`，同码纤维直径经 `point_dist_lt_half` 控制在 $t/2$ 内（形状 $\mathrm{dist}^2<(t/8)^2+(t/8)^2+C(t/64)^2$，约 $0.033t^2<0.25t^2$，$t/64$ 与 $t/8$ 间的 8 倍余量刻意）。`constructedSet_cover` 的控制流 `by_cases hmid : ∃ j, t/64 < scale j ∧ scale j ≤ t` 复刻论文三分支：有中间层则以其 tuple 值为标签（粗层被 `sourceTuple_coarse_eq` 冻结：不同选择 ⇒ 距离 $\ge r_j\ge t$ 出球；中间层唯一性 `intermediate_unique` 的算术核心恰是 $1000>64$，**这是常数 1000 在 Lean 里唯一真正被用掉的位置**，另一处 `sum_scale_sq_le` 只要求 $>1$）；无中间层则标签集退化为 `{0}`。`isCompact_exists_packing_bound`（紧集 + 固定正分离 ⇒ 分离族基数有界；证明走有限子覆盖 + 单射入有限索引集）是论文 $\R^k$ 体积比较 $N\le(1+2D)^k$ 的 Lean 替身（分歧 2）。

`Derivatives.lean`：`embeddingSheet f w` 用 `if h : admissible p w then f ⟨point p w, _⟩ else 0` 把论文只定义在 $\Omega_w$ 上的 $F_w$ 补成全平面函数（`fderiv ℝ` 要求全空间有定义；无语义变化，docstring "the arbitrary outside value is zero"）。`sheetColumn := Ω.indicator (fderiv ℝ f · v)`；`norm_sheetColumn_le` 分域内外两支，域内用 `norm_fderiv_le_of_lipschitzOn`，先把 `LipschitzOnWith` 经 `hΩ.mem_nhds` 升成局部 Lipschitz：论文 "$\|DF\|\le$ Lip 常数"一句"显然"的完整展开。`goodSheetPoint` 四条对应 (eq:good)，但平均用 $L^2$（`⨍‖·-·‖² → 0`），并非论文的 $L^1$：先 `ae_tendsto_average_norm_sub`（Mathlib 的 Lebesgue 微分定理 doubling 抽象 `IsUnifLocDoublingMeasure.ae_tendsto_average_norm`），再有界性升 $L^2$。这个基础设施名字与本题 doubling 主题形成一次有趣的自指。`derivativePair_bounds` 给 $[0,(2D)^2]^2$ 盒（论文 $[0,D^2]^2$，噪声同分歧 7）。`derivativeData_nonempty` 以零 tuple sheet 的全测度好点见证 $K\ne\emptyset$：论文未述为何非空，Lean 被迫给出具体 $w=0$（未述清单第 8 条）。`exists_lipschitz_extension_finiteDimensional`（`toEuclidean` + 逐坐标 `extend_pi`）把片 Lipschitz 扩张成全空间 Lipschitz，docstring 末句 "Only agreement on the original open domain is used for sharp derivative estimates." 是设计声明：扩张常数未知（只存 `∃ L`），真正的 sharp 估计靠 `globalSheet_eqOn` 把导数换回域上的 $F$，损失不进最终常数。论文从不扩张 $F_w$（分歧 6）。

`Integration.lean`：section 划分（VectorFTC / MeanSquares / PartialIntegration / Extensions）按论文论证顺序排。`integral_eq_sub_of_lipschitz_ae_derivative` 的 docstring 自报路线："This is the scalar absolutely-continuous FTC tested against the continuous dual"（向连续对偶测试，把 Banach 值 FTC 归约到标量）。`norm_average_sq_le_average_norm_sq` 的 docstring 比论文诚实："Hilbert-space Cauchy--Schwarz in the form needed for line transport; in fact convexity makes this valid for every normed target"，证明是范数凸性 + Jensen（`ConvexOn.map_average_le`）：这条链上 Hilbert 结构的唯一用处是 Construction 的正交/勾股，$L^2$ 平均不等式其实对所有赋范目标成立。论文在 line-integral 段写 "$L^2$ 的 Cauchy–Schwarz" 未点破这一点，形式化反过来澄清（可对照第 5 节）。`curve_oscillation_sq_le_integral` 输出 $(b-a)\int\|g\|^2$；`Grids` 的加强版 `oscillation_sq_le_segment_energy`（docstring "An FTC identity on all subintervals controls all points of a line, not just a.e. points"）以 `hFTC : ∀ a b` 的全区间形式给出逐点一致界 $|I|^2\int\|g\|^2\,d(I.\mathrm{law})$（平方来自 `law` 是概率平均），配 `norm_le_on_Icc_of_Ioo`（"Endpoint bounds on an open real interval extend to its endpoints by continuity"）兑现论文"由连续性推到端点"。`globalSheet hf w := (...).choose` 用选择公理把扩张钉成函数，并非关系，下游 `addedSheet`/`horizontalColumn` 因此可微分可积分。

`Rectangles.lean`：全篇最大文件（489 行）却没有论文对应物，是为把"取一个合适的矩形/一条合适的线"变成可执行操作的测度论脚手架。`law I := (ENNReal.ofReal I.length)⁻¹ • volume.restrict (Ioc I.lo I.hi)` 用左闭右开：`Real.volume_Ioc` 让 `IsProbabilityMeasure` 实例 5 行 simp 通过，`ae_mem : ∀ᵐ x ∂I.law, x ∈ Ioo lo hi` 一次性处理两端点 null 集（论文 "ignoring boundaries" 的机器化：它只需要说忽略，Lean 必须选一个可测代表集）。`IsBoundedField`（强可测 + 一致界）是自建局部类，带 `.add/.sub/.const/.norm_sq/.comp_measurable/.select/.integral_fst/.integral_snd` 封闭性接口，专职两件事：$L^1\to L^2$ 提升、Fubini 后仍可拼接；`horizontalColumn`/`verticalColumn` 的可测性全靠 `.select`。一阶矩抽样 `exists_good_le_integral`（`∃ x, P x ∧ g x ≤ ∫g`）与有限维兄弟 `exists_le_finite_mean`（`∃ i, v i ≤ n⁻¹ * ∑ v`）合起来承接论文全部"由平均值控制故存在不超平均的对象"，包括选块那步。修剪界 `integral_le_four_of_subset`（`Q ⊆ P`、每维长度减半 ⇒ `∫_Q law g ≤ 4 * ∫_P law g`）：两边都是平均，面积比 $\le2\cdot2=4$，4 不是优化值，若只沿一维修剪应为 2（实际是 4，说明形式化两侧都修，与 `exists_grid_inside` 的输出配套）。`goodSheetPoint_exists_rectangle` 把 (eq:good) 的球极限转成"存在矩形 $Q\subseteq\Omega_w$ 使两方向 $\int\|\text{column}-\text{值}\|^2<\varepsilon$"。`integral_column_le_mul_grid`/`row` 给出单列平均 $\le$ 网格平均 $\times$ 列数，`Crossings` 的 `ColorBlock.column_energy_le` 是它的转发（乘数 `colors j`）。

`Grids.lean`：`stripColor N hN h t := ⟨Int.toNat (⌊t/h⌋ % N), _⟩` 实现论文周期着色，可测性走 `measurable_of_countable`（取有限值）+ floor 可测，docstring "The measurable periodic selector; boundary values play no role"；论文 "$U_{j,i}$ 是可测的"一句话在这里变成 8 行显式构造。`color_in_block` 保证完整周期块内每色恰出现一次（论文 "one period block contains one row and one column of each color" 的实现）。`exists_grid_inside`：输入 `hsmall : h < I.length / 4`，输出网格段两端对齐且 `I.length / 2 ≤ length`，即"至多损失两个周期"；$1/4$ 与 $1/2$ 成对（两端各损 $<h$，剩 $>|I|-2h>|I|/2$），机械理由在下游 `exists_nearmax_grid` 要同时有 $r_j/L'\le t$ 与 $L'\ge|I|/2$，一次修剪只把 $t$ 放大 2 倍。`globalSheet_offset`（新片偏移 $\le D\cdot\text{scale}\,j$）与 `globalSheet_separation_sq`（同层异标签 $\sqrt2$ 分离的平方形式 $2r_j^2\le\|\cdot\|^2$）是 crossings 的两块基石，都经 `admissible_update_iff` → `globalSheet_eqOn` → `embeddingSheet_eq` 把目标距离换回源距离；偏移那条源侧其实是**等式** $\mathrm{dist}=\text{scale}\,j$（论文写 $\le r_j$ 反而松），分离那条只用 (eq:bilip) **下支**（`pow_le_pow_left₀` 吃下界）：上界 $D$ 供偏移、下界供分离，两条假设分工干净。

`SelectedSheets.lean`：`stripWidth j := widthFactor j * scale j`、`xPeriod := colors * stripWidth`、`yPeriod := colors * scale`，各向异性定型为"横向周期是纵向的 $W_j$ 倍"；论文的 $n^2$ 权重真身是 `combinedEnergy` 里的 `(widthFactor j)^2`。`horizontal_mean_bound_stripes` 的 docstring 是方法论自述："Horizontal integration on each separate vertical strip; discontinuous selections are never differentiated across strip boundaries"：网格按列切片 `Qi i := ⟨Segment.cell ..., J⟩`，逐片用 FTC，再由 `integral_grid_x` 以权重 $\sum_i|cell_i|/|grid|=1$ 合并；分片跳变被完全吸收进 $2R/h$（每片端点差 $\le2R$、片宽 $h$、平均权重相消），分母是条带宽，并非矩形长边，因为逐片积分把长边信息丢掉了。派生的三条均值界与论文形状一一对上：`horizontalColumn_mean ≤ 2 D r_j / Q.x.length`（eq:Hmean）、`verticalColumn_x_mean ≤ 2 * D / widthFactor j`（eq:Vxmean 的 $2D/n$，暴露它实为 $2D/W_j$、与色数无关）、`verticalColumn_y_mean ≤ 2 D r_j / Q.y.length`（eq:Vymean）。`exists_block_integral_le`（docstring "Finite averaging chooses one complete period without increasing the mean energy"）：两次 `exists_le_finite_mean` 复合（先列后行），选出的周期块均值 $\le$ 全网格均值，零损失；能量放大的 $N$ 因子推迟到 `Crossings` 的 `row_energy_le/column_energy_le`（乘数 `colors j`）。

`Extremal.lean`：lem:compact 的定量替身，全案最重要的一处分歧（分歧 3）。`exists_lexicographic_maximum` 用两次 `IsCompact.exists_isMaxOn`（Weierstrass）：先在 $K$ 上最大化第一坐标得 $A$，再在紧截面 $\{p\in K:p_1=A\}$ 上最大化第二坐标得 $B$，"字典序"这个可能有良定义性质疑的词被消解成两次连续函数取最大。`near_lexicographic_maximum` 不用序列语言：坏集 `K ∩ {p₂ ≥ B+ε}` 紧，在其上取第一坐标最大点 $p$，则 $p_1<A$（否则与 $B$ 的截面极大性 `linarith` 矛盾），$\delta:=A-p_1$：$\delta$ 是"坏集最右端到 $A$ 的距离"，一个可能极小但具体的正实数，Lean 只 `obtain` 它、从不估计它，与论文"不需要定量模"完全一致；但 Lean 比论文多走一步，把 $\delta$ 变成斜率。`lexicographic_affine_barrier`：取 $C:=M/\delta$，$p$ 近侧用坏集界加非负项、远侧 $p_2\le M=C\delta\le C(A-p_1)$，得 $p_2\le B+\varepsilon+C(A-p_1)$：论文的 limsup 在这里被"仿射屏障 + $\varepsilon$ 余量"取代，$C$ 从此作为假设一路传进 `Energy.anisotropic_energy_bound` 直到 `verticalCoefficient D C`。代数套件：`variance_identity`（docstring "The variance identity over an arbitrary probability space."，eq:variance 的推广版）+ `variance_le_of_moments` + `mean_deficit_le`（丢非负方差界二阶矩亏损）。`integral_second_le_barrier` 把屏障逐点成立 + a.e. 取值于 $K$ + `integral_mono_ae` 压成一串 `simp only [integral_add, integral_const_mul, ...]`，docstring 直接评论论文："Integrated affine barrier; unlike a limsup statement, this keeps all quantitative data."。`vertical_variance_bound`（docstring "The hard lexicographic energy step, before substituting the geometric moment bounds."）四行完成论文最吃紧的一步：`integral_second_le_barrier`（$(s,t)=(\|G\|^2,\|H\|^2)$）→ `variance_le_of_moments` → `mean_deficit_le` → `gcongr`；注意 `hvalues` 里第一分量是水平导数、第二分量是竖直导数，与 `derivativePair` 次序一致，字典序"先横后竖"的耦合在 Lean 里就是一条 $(\|X\|^2,\|Y\|^2)\in K$ 假设加屏障把 $Y$ 的额度写成 $A-\|X\|^2$ 的函数，比论文散文更透明；其中的 $D$ 因子在 `Energy` 里全部实例化为 $2D$。

`Energy.lean`：三个新常数 `horizontalCoefficient D := 4 + 8 * D * (2 * D + 1)`、`verticalCoefficient D C := 4 + 2 * C + 8 * C * D + 8 * D * (2 * D + 1)`、`combinedEnergy := (widthFactor j)^2 * horizontalEnergy + verticalEnergy`。`anisotropic_energy_bound` 结论 $\overline{\mathcal E}_{\text{horiz}}\le\text{hc}\cdot t$、$\overline{\mathcal E}_{\text{vert}}\le2\varepsilon+16CD^2/W_j+\text{vc}\cdot t$，证明七步机械分解：记号与六个 `IsBoundedField` 事实；`norm_mean_sub_le_of_energy` 把旧片 $L^2$ 误差 $t^2$ 转成均值误差 $t$；三条均值定位（`hmH ≤ (2D+1)t`、`hmX ≤ 2D/W_j+t`、`hmY ≤ (2D+1)t`，只有 $X$ 条带 $1/W_j$，它是最终 $16CD^2/W_j$ 的唯一来源）；`ht2 : t² ≤ t`（`nlinarith`，$t\le1$ 全篇唯一被用处）；水平支 `variance_le_of_moments` + `energy_sub_le_two`（平方三角 $\|a-b\|^2\le2\|a-c\|^2+2\|b-c\|^2$）合成 $2[t+4D(2D+1)t]+2t^2\le(4+8D(2D+1))t$，系数 `unfold; nlinarith` 收尾；竖直支同构，16 $=2\times C\times4D\times(2D/W_j)$，链条上每一环都不是优化值。`exists_nearmax_grid`：$A-\|u\|^2\le t$ 取自 `Metric.mem_closure_iff` 的闭包 $\varepsilon$-邻域刻画（论文"取接近 $(A,B)$ 的好点"的机器形，零额外分析）；$\delta:=\min(L_x/(4NW),\,L_y/(4N),\,tL_x/2,\,tL_y/2)$ 四个分量各喂一个下游条件（横纵各容 4 个完整周期、修剪后 $r/L'\le t$）；好点矩形误差取 $t^2/4$，与修剪因子 4 精确配对成 `hbaseu : ... ≤ t²`。`exists_energy_parameters` 的 docstring 逐字："The order of choices is essential: the strip width follows the compact barrier, then the base error and the unused radius are made small."：先 $W>64CD^2/\eta$（把 $16CD^2/W$ 压进 $\eta/4$），再 $t:=\min(1,\eta/(4K))$，其中 $K=W^2\cdot\text{hc}+\text{vc}$ 依赖 $W$，所以 $C\Rightarrow W\Rightarrow t$ 的箭头不可倒。论文"先 $n$ 大、再 $m$ 更大"的两级极限被压成这一次算术调度（分歧 4），且调度暴露真正的对抗是 $W^2$ 项对 $1/W$ 项（分歧 5）。`exists_small_energy_grid`（docstring "The full analytic output: arbitrarily small combined energy on actual sheets of the single fixed Hilbert set, at a level with any prescribed number of colors."）是装配线：字典极大 → $K$ 盒 → 屏障（$\varepsilon:=\eta/8$）→ 参数调度 → 近极值网格 → 各向异性界 → 合并 $W^2H+V$，输出 $\int\text{combinedEnergy}<\eta$ 加 `colors j = N` 加 `w j = 0`。

`Crossings.lean`：`ColorBlock j` 是恰含一个完整周期的 $N\times N$ 单元矩形（`x_length = colors·widthFactor·scale`、`y_length = colors·scale`，即论文的 $Nnr\times Nr$）。`exists_small_energy_block` 由有限平均选出不增均值的块。选线两引理（docstring 强调 "a genuine **interior** horizontal line with an **all-points** oscillation bound" 与 "the same avoidance of **FTC null sets**"）：三个 a.e. 集相交 + `exists_good_le_integral` + `hFTC : ∀ a b` + `oscillation_sq_le_segment_energy`，得闭区间逐点一致界 $c\,\|(G-F)(b)-(G-F)(a)\|^2\le|I|^2\int e$。`exists_color_row/column` 两次实例化，权重 $c$ 分别 $(W_j)^2$ 与 $1$；支配假设 `hdom` 的证明就是丢弃一个非负项（`le_add_of_nonneg_right (sq_nonneg _)`），论文"组合能量 $\ge$ 加权水平能量"在 Lean 里值一行。收口引理 `small_oscillation_of_weighted_energy`：由 `he : e ≤ 1/(64n³)` 与 `w²s² ≤ (nwr)²·(ne)`，经 `have heq : (n*w*r)² * (n*(1/(64*n³))) = w²*(r/8)² := by field_simp; ring` 得 $s\le r/8$，docstring "The horizontal weight cancels exactly against the longer period side"：$n$（即 $N_j$）完全对消，论文 $\omega_n=N\sqrt{2N\varepsilon_n}\to0$ 在这里换成具体阈值 $\eta=1/(64N^3)$ 加常数振荡界 $r_j/8$。最终装配 `exists_separated_family`：`choose y hy hyo using exists_color_row`（连同两条性质一起钉住）逐色取内外线；两次传输调用收口引理（竖直方向以 `w := 1` 调用、`one_pow, one_mul, mul_one` 清理）；交叉点 $c=(x_m,y_i)$ 双合法（行给 $i$、列给 $m$，`Or.inl/Or.inr` 分别投 `row_color/column_color`），`globalSheet_separation_sq` 给 $2r_j^2\le\|h_i(c)-h_m(c)\|^2$，反证分支里 `hbound : ‖h i c - h m c‖ ≤ 5 * scale j / 4` 平方后与 $2r_j^2$ 硬碰：$(5/4)^2=25/16<2$，即论文 $\sqrt2-2\omega_n>1$ 的算术化身。归一化 `z i := (scale j)⁻¹ • h i (p i)`：$\|z_i\|\le D$ 只用上半支（`globalSheet_offset`），$1\le\mathrm{dist}(z_i,z_m)$ 只用下半支，docstring 特意留话 "The lower bound is the genuine source distance."。

`Main.lean`：收尾六行。`no_normalized_embedding`：`isCompact_exists_packing_bound (isCompact_closedBall (0 : E) D) (0<1)` 得抽象 `bound`，`exists_separated_family hf hlower (bound + 1)` 得 $N=\text{bound}+1$ 个单位分离点，`hbound` 代入后 `omega` 关单。矛盾形态是"packing 上界 vs 存在 bound+1 个 1-分离点"：论文"对任意 $N$ 存在"的叙述被改写成"取 $N=\text{bound}+1$ 一次调用"（分歧 4 的另一面）；`isCompact_closedBall` 依赖有限维 ⇒ `ProperSpace`，Mathlib 自动供给，论文的球体积公式全程缺席。`no_scaled_embedding`（17 行）用 `g := a⁻¹ • f` 兑现"归一化尺度"，`hdist` 证一次用两处，失真装回 `NNReal` 靠 `⟨D, le_trans zero_le_one hD⟩`。`main` 8 行：`⟨constructedSet, constructedSet_cover, ...no_scaled_embedding⟩`。

### 支线：CompactBanach 链

终态逐字（`CompactBanach.lean` 行 20-26）：

```lean
theorem main : ∃ Λ : ℕ, ∀ (B : Type u) [NormedAddCommGroup B] [NormedSpace ℝ B]
    [CompleteSpace B], ¬ FiniteDimensional ℝ B →
    ∃ K : Set B, IsCompact K ∧ DoublingAtMost K Λ ∧
      ∀ (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E]
        [FiniteDimensional ℝ E], ¬ AdmitsBiLipschitzEmbedding K E := by
  classical
  refine ⟨1 + 5 * (76800 ^ 8) ^ 2, ?_⟩
```

对照第 10 节：Lean 取 $\Lambda=1+5\lambda_0^2$、$\lambda_0=76800^8$；论文取 $\Lambda=1+6\lambda^8$、$\lambda_0=\lambda^4$。形式化没做 $5\to6$ 的松弛，指数却从 8 涨到 16，唯一原因是失真从"严格小于 2"变成"6"（搬运）与"36"（合成）。

链上十个取证要点（支线文件一行 docstring 都没有，全部只能读语句本身）：
1. `Auerbach.lean` 顶替 Dvoretzky。`exists_auerbach_basis` 在紧集 `U := {v | ∀ i, ‖v i‖ ≤ 1}`（`isCompact_pi_infinite` + 逐坐标闭球紧）上对固定基的坐标矩阵取行列式极大，极大性推出 $|b.repr x i|\le\|x\|$；`exists_auerbach_vectors` 从 Hamel 基 `Module.Basis.ofVectorSpace` 经 `¬FiniteDimensional` ⇒ 基指标集无穷 ⇒ `Infinite.natEmbedding` 取出 `#ι` 个两两不同向量，张成有限维子空间后用第一条再 `norm_coe` 搬回。论文需要 Dvoretzky 加两条引文加"strictly below two"；Lean 只需要"$B$ 无穷维"，不需要维度下界、不需要任何外部定理，代价是失真变差。[推测：Mathlib 没有 Dvoretzky，这是一条被迫自建的路线，也解释了支线零 docstring：无现成引用可依托，就不写边注了。]
2. `CoordinateSupport`/`CoordinateMap`：有限子集只用有限个坐标（`finite_coordinate_support`，靠 `pointSupport w = w.support` 的像）；`coordinateMap I v := ∑ i : I, z i • v i` 是线性映射（`map_add'/map_smul'` 两行 simp），配 `coordinateMap_single`（$\|T(lp.single\,2\,j\,a)\|\le|a|$，用 $\|v_i\|\le1$）与 `coordinateMap_lower`（$|z_i|\le\|Tz\|$，吃 Auerbach 下界性质）。
3. `SparseCoordinates.norm_map_point_sub_le : ‖T (point p w - point q w')‖ ≤ 6 * R`：$6=2+4$，基点两坐标各 $R$，差异层 $2\sum_{j\in d}r_j\le2\cdot2R$（`sum_scale_le` 用公比 $10^{-3}$ 一次方几何级数，$1000/999$ 上取整成 2；Doubling 处用的是二次方公比 $10^{-6}$，同一个 `scale` 两种幂次求和，两边都只要底数 $>1$）。
4. `FinitePlacement.finite_placement`：上界的实现很漂亮，`dist_point_le_of_coordinate_bound` 就是 `norm_map_point_sub_le` 在 $T=\mathrm{id}$ 的特例（`hT` 由 `lp.norm_single` 一行），源空间 $\ell_2$ 距离 $\le6\sup_i|z_i|$ 不需要勾股与坐标个数，由稀疏 + 几何衰减直接给出，这正是"为什么 Auerbach 的弱下界够用"的机械解释。合成失真 $6\times6=36$。
5. `CoverTransfer.intrinsic_doubling_of_distortion36`：8 次半半径细分（`ambient_iterated_cover hS 8`）后 `hbound` 的 calc 把两端各 $r/128$ 合成 $r/128$，再经上失真 36 得 $36r/128=0.28125r<r/2$。指数规则一般式 $2^n>4\Delta$：$\Delta=36\Rightarrow n=8$（$2^7=128<144$ 失败）；$\Delta=2\Rightarrow n=4$。论文的 "Four halvings ... at most $\lambda^4$ ... radius $R/16$" 与 Lean 的 $L^8$ 是同一条不等式的两个实例，数值差全来自 $2$ vs $36$。`chooseCenter` 用带证明的 `dite`（与像相交则取原像、否则退回 $x$）把中心搬进值域（intrinsic 要求）。
6. `ClusterScales`：`clusterScale j := (1/2)^(j+1)`（又一次下标平移）、`cluster_norm_bound`（$101/100$）、`cluster_separation`（$97/200$）、`five_scales`（窗口极比 $\le1600/97<32\Rightarrow s\subseteq Icc i(i+4)\Rightarrow\le5$ 个）：四个常数与论文逐字一致，这一段 Lean 是逐字翻译。
7. `ClusterPlacement`：`cluster_placement` 输出 `∀ x, dist (f x) (r • v) ≤ r / 100` + `DoublingAtMost (range f) (76800 ^ 8)` + 尺度 `a` 的失真 36 双向界，即论文的 $T_j(X_j)\subset B_B(a_jv,\eta a_j)$ 参数化。
8. `ClusterCover`/`CompactUnion`：`ambient_doubling_clusters` 得 $1+5L^2$（`eventually_atTop` 收编尾部簇、`five_scales` 限活跃数、每簇 $L^2$、$+1$ 给极限点）；`compact_shrinking_union` 用 `isCompact_of_finite_subcover` 走开覆盖，不是论文的序列语言（tex:465 写的是"每序列有收敛子列"）。Mathlib 的 `IsCompact` 定义就是开覆盖，度量空间里两者等价，但形式化选了拓扑一侧。
9. `FiniteCompactness`/`FiniteWitness`：FIP 引理的实现，盒空间 $Q=\{f\,|\,\forall x, f x\in\overline B(0, A\,d(o,x))\}$ 由 `isCompact_pi_infinite`（Tychonoff）紧，约束集由距离连续性闭，有限交性质由逐有限集可嵌入假设提供，取出全局嵌入；假设里有 `[ProperSpace E]`（闭球紧），有限维自动满足。`finite_witness` 用主线的 `no_scaled_embedding` 把"$S$ 不可嵌入"转成"存在有限子集不可嵌入"，`finite_witness_card` 把基数抬到 $\ge2$（否则常值映射可行）。
10. `FiniteTargets`：任意有限维赋范目标 $E$ 经 `toEuclidean` 降到 $\R^{\dim}$，合成失真 $A=D\cdot U\cdot V$，$U=\|e\|+1$、$V=\|e^{-1}\|+1$，"+1" 是防零的技术性松弛 [推测：直接取范数也行，只是多旁支判断]。装配处 `X_j := finite_witness_card ⟨(unpair j).1, (unpair j).2 + 1⟩` 把（维度, 失真）对角编码进单指标；`obtain ⟨n, hn⟩ := exists_nat_gt (36 * A)` 与 `36 * A ≤ (n : ℝ) + 1` 之间这条缝是"36"在整条支线的唯一落点；三行 `calc` 合成失真 $\le n+1$ 撞上见证矛盾。

### 论文句子 ↔ Lean 模块对照表

| 论文 | Lean 位置 | 判定 |
|---|---|---|
| Definition 1.1（doubling, intrinsic） | `Model.DoublingAtMost` | 完全一致 |
| Definition 1.2（scale $a$、$D\ge1$） | `Model.AdmitsBiLipschitzEmbedding` | 完全一致 |
| thm:main | `Main.main` | 一致（$\forall k,0<k$ 同形） |
| $S$、$r_j=1000^{-j}$ | `Construction.constructedSet`/`scale` | 一致，下标平移 1（论文未述） |
| $(N_j,W_j)$ 无穷遍历 | `colors`/`widthFactor` + `recurrent_parameters` | 改写：双 unpair 显式编码 |
| prop:doubling = 76800 | `Doubling.constructedSet_cover` | 一致；$300\cdot16^2$ 由 `Fintype.card` 显式算出 |
| sheet 是 $D$-Lipschitz | `embeddingSheet_lipschitz`（$2D$） | 偏差：因子 2 |
| (eq:good) 好点 | `goodSheetPoint` + `ae_good_embeddingSheet` | 一致；$L^1$ 经 Mathlib 升 $L^2$ |
| $K$ 紧、非空 | `derivativeCompact` + `derivativeData_nonempty` | 一致，多出见证 $w=0$ |
| lem:compact（limsup 无速率） | `near_lexicographic_maximum` + `lexicographic_affine_barrier` | 改写：仿射屏障，$C=M/\delta$ |
| eq:variance | `variance_identity` 三件套 | 一致（推广到任意概率空间） |
| $n^{-4}/n^{-8}$ 近极值选取 | `exists_nearmax_grid`（$\delta$ 四项 min，$t^2/4$） | 改写：指数消失换显式参数 |
| prop:energy | `anisotropic_energy_bound` | 改写：$t$ 参数化 + 两系数 |
| "$n\to\infty$ 能量 $\to0$" | `exists_energy_parameters` + `exists_small_energy_grid` | 改写：$\forall\eta>0$ 一次调度 |
| crossings 与 $\omega_n$ | `exists_color_row/column` + `small_oscillation_of_weighted_energy` | 改写：$\eta=1/(64N^3)$、$s\le r/8$ |
| $\sqrt2-2\omega_n>1$ | `exists_separated_family` 的 `hcentral`（$25/16<2$） | 一致 |
| $N\le(1+2D)^k$ 体积比较 | `isCompact_exists_packing_bound` | 改写：定量信息丢弃 |
| cor:lp | 无（全目录无 $L_p$/Gauss/矩构造） | 未形式化 |
| cor:banach | `CompactBanach.main` | 改写：Auerbach 代 Dvoretzky，$\Lambda=1+5(\lambda^8)^2$ |
| Figure 1 与直觉段 | 无 | 未形式化（正常） |

cor:lp 未形式化是本次取证的一个实质发现：$L_p$、Gauss、$c_p$、矩计算在 Lean 目录里一概不存在，支线全部停在 `lp (fun _ : ℕ => ℝ) 2` 层面；这与 JSON 只指 `Main` 一致（$L_p$ 是免费推论、不在任务范围）。写笔记时凡提 cor:lp 的形式化状态，只能说"缺席"。

### 七处结构性分歧及其机械原因

1. **Auerbach 取代 Dvoretzky（支线）**：失真 $<2\to\le6\to\le36$，半数次数 $4\to8$，$\lambda_0=\lambda^4\to\lambda^8$，$\Lambda$ 指数 $8\to16$；全部数值差由 $2^n>4\Delta$ 一条公式解释。收益：无维度下界、无外部定理引用。
2. **体积比较 → 紧集 packing 界**：论文的 $N\le(1+2D)^k$ 换成"紧集上固定正分离族基数有上界"，Lean 只需"$N$ 任意大即矛盾"，用不上具体上界；且 $(1+2D)^k$ 要实数幂与球体积公式，Mathlib 里紧性远比体积公式好用。代价：Lean 对"维数如何进入上界"完全沉默，无法回答"多快失败"，这是论文保留而形式化丢弃的信息。
3. **limsup → 仿射屏障**：论文明说不要定量模，Lean 发现给斜率 $C=M/\delta$ 几乎免费（12 行），于是后续全部估计改写成 $t$ 的显式线性函数，两级极限消解为一次调度。"形式化促进理解"的最强样本：lem:compact 的证明内容其实是一个 Lipschitz 型屏障，论文没有点出。
4. **序列 → 有限调度**：论文的 $n=1,2,\dots$ 取层/取误差流程改成"任意 $\eta$ + prescribed $N$"，矛盾以 $N=\text{bound}+1$ 一次取得；`Tendsto` 陈述要额外管理"谁趋于 0"，反证只要"存在足够小"。代价：$n^{-4},n^{-8},n^{-7}$ 的指数层级信息全灭。
5. **$N_j$ 与 $W_j$ 独立**：论文取 $N_n=W_n=n$ 省事，Lean 经 `recurrent_parameters N W` 保留两参数且只单独调度 $W$：$1/W$ 项驱动收敛，$N$ 只数分离点。形式化反过来澄清论文：$n^2$ 权重是 $W^2$ ，并非 $N^2$，$\omega_n$ 里的 $N$ 与权重里的 $n$ 是两个参数（第 8 行悬念在此解开，也是第 11 节"设计约束"一节没写进论文的一条脚注）。
6. **sheet 全局扩张**：论文从不扩张 $F_w$；`intervalIntegral` 与逐线 FTC 要求全平面有定义，于是 `globalSheet` + `.choose` + `globalSheet_eqOn` 三件套，扩张常数只存在、不进估计。风险被 docstring "Only agreement on the original open domain is used" 明确隔离，最终常数未污染。
7. **$\sqrt2$ 写成 2**：$L^\infty$ `Base` ⇒ `point_dist_sameTuple_le` 因子 2 ⇒ `embeddingSheet_lipschitz` 为 $2D$ ⇒ $K$ 盒 $(2D)^2$ ⇒ `hu/hv ≤ 2D` ⇒ 两个系数全是 $2D$ 噪声，论文的 $D$ 因子与 Lean 不能逐项对齐。[推测：选 $L^\infty$ 是为了 `Segment`/`Rectangle` 逐线限制与坐标距离比较省事；代价是贯穿全链的 2。]

### tactic 卡点与绕行手法

全目录 4664 行的 tactic 词频（`grep -ow` 整词，含注释同名英文词，上界式近似）：

```
have 500 | rw 191 | simp 145 | obtain 114 | refine 67 | simpa 62 | nlinarith 52 | linarith 47
classical 41 | positivity 37 | omega 33 | dsimp 32 | exact_mod_cast 32 | ring 26 | norm_num 21
filter_upwards 21 | choose 18 | ext 13 | field_simp 12 | by_contra 11 | abel 9 | gcongr 5
push_cast 5 | integral_mono 4 | convert 2 | simp_all 1
```

另 `omit [...]` 32 处、`noncomputable` 47 处；属性标注共 13 处：`@[simp]` 12（`Construction.lean` 的 100/102/104/114/117/120/124/205/208 行与 `CoordinateSupport.lean` 的 11/18/23 行）、`@[ext]` 1（`Grids.lean:172` 的 `Segment.ext`）；`set_option`（含 `maxHeartbeats`）0 次、`#print axioms` 0 次。七个真实卡点：
1. 多项式常数是主战场：`nlinarith`(52)+`linarith`(47) 压过 `simp`，且常带 witness 列表（`nlinarith [sq_pos_of_pos hr]` 判 $(5/4)^2<2$、`ht2 : t² ≤ t := by nlinarith` 是 $t\le1$ 唯一使用点）。每个"论文一句话"在这里现形为一个带平方的小不等式，常数都留 witness 痕迹，第 13 节台账逐条可查。
2. `NNReal` 与 $\mathbb R$ 双向换算：`LipschitzWith` 吃 `D : NNReal`，估计要 $(D:\mathbb R)$、$(2D)^2$、`⟨D, le_trans zero_le_one hD⟩` 手工装回；`exact_mod_cast`(32) 主要把 $\mathbb N$ 基数/正性穿到 $\mathbb R$（`colors j`、`(N : ℝ)^3`）。
3. a.e. 与 null 集管理：`filter_upwards`(21) 加两个自建接口（`IsBoundedField` 打包可测 + 有界；`law` 选 `Ioc` 使端点 null 一次解决）。论文"忽略边界"四五个字，这里是 `ae_mem.and (ae_of_ae (ae_integral_column_x ...))` 型的三集合交纪律。
4. 选择公理的"钉死"用法：`classical`(41) + `choose`(18)：纤维代表、`globalSheet` 的 `.choose`、`choose y hy hyo using exists_color_row`（值与两条性质同钉）、`chooseCenter` 的 `dite`。这就是"论文用紧性/子序列、Lean 用有限证书"在 tactic 层的指纹。
5. 精确 `simp only` 纪律：`simpa`(62) 且规则列表写得很长（`integral_add, integral_const_mul, ...` 一串），`simp_all` 全目录仅 1 次；长列表本身就是"哪条 Mathlib simp 被真正用到"的取证线索。
6. 端点/闭包语言切换：`norm_le_on_Icc_of_Ioo` 专办"连续性推到端点"；$K$ 近似用 `mem_closure_iff`、紧性用 `isCompact_of_finite_subcover`、极值用 `exists_isMaxOn`。形式化整体站在拓扑/测度语言一侧，与论文的 $\varepsilon$-$\delta$ 混序列语言相比更"拓扑"。
7. 无性能妥协痕迹：`set_option` 0、`native_decide` 0、`convert` 2；唯一 `decide` 在 `Doubling.lean:253`（`simp only [Fintype.card_coe, cells, Int.card_Ico]; decide`），把有限方格数算成具体整数的内核可复核封闭判定，不是外挂后门。13 处属性标注全部落在最小构造件上，simp 集不铺开。[推测：与 comparator 要求每题同套 lint/axiom 检查跑通有关，重型 tactic 会拖慢验证。]

### 形式化状态总评

完整性（读文本层面）：`Main.main` 已证、链路完整、无 sorry/admit/axiom/native_decide。公理层面（再声明一次边界）：三公理口径来自 JSON 声明与源码结构，`#print axioms` 未执行，机器验证状态未知。覆盖：主线（构造 + doubling + 解析核心 + 不可嵌入）与 cor:banach 双边形式化，cor:lp 缺席；图示、直觉段、历史综述无对应物（正常）。一致性分层判定：定义层逐字一致；构造层一致含两处改写（unpair 编码、下标平移）；引理层结构性一致而量化方式不同（limsup→屏障、序列→$\eta$ 调度、体积→紧 packing 三处）；常数层因 $L^\infty$ 基度量系统性带 2；支线因 Auerbach 失真 $2\to36$、$\Lambda$ 指数 $8\to16$。三条可带回数学叙述的形式化洞见，docstring 逐字为凭："The order of choices is essential"（参数层级是机器确认的硬约束，真正的对抗是 $W^2$ 对 $1/W$）；"unlike a limsup statement, this keeps all quantitative data"（limsup 形式并非必需，屏障形式同证且更强）；"The horizontal weight cancels exactly against the longer period side"（各向异性设计的最短理解路径是一行 `field_simp; ring` 恒等式）。

## 13 常数与参数：台账

对应素材 5.1 与 5.2。约定：论文位置给 tex 行号与式标签，Lean 位置给 `文件::定理名`；"动了会坏在哪"是我按链条重算的敏感度，素材与论文沉默处标 [推测]。素材 5.2 把常数分成三族，我把族读法定为：家族 A 是记账出来的松弛，家族 B 是两种叙述文体之间的翻译指数，家族 C 才是数学内容本身。doubling 常数 76800、打包阈值 $N>(1+2D)^k$、$\sqrt2$、传输容差 $1/8$ 与各分层参数全部入册。

**家族 A：可计算性驱动（覆盖族）**。目标是把 prop:doubling 变成一个具体整数。

| 数值 | 位置 | 作用 | 动了会坏在哪 |
|---|---|---|---|
| $76800=300\cdot16^2$ | tex:48（thm:main 陈述）、tex:116（prop:doubling）；`Doubling::source_cover_of_label`/`constructedSet_cover`、`Model::DoublingAtMost` 的 `bound`、`Main::main` | 全定理的 doubling 上界，可验证整数，并非渐近记号 | 改大无害；改小需重算 300、$16^2$、64 三个因子。tex:116 直接把乘式写出，说明作者知道它可替换 |
| $300$ | tex:116；`Doubling::nearbyLabels_card`（作 `source_cover_of_label` 假设 `hcard`） | 中间层 tuple 标签数上界（竖条 + 横条 + 零） | 真实计数 $1+131+131=263$，300 是圆整；改 263 完全安全，改 $<263$ 卡 `admissible_mem_nearbyLabels`。Lean 复现同一个不精确上界，因下游只吃 `≤ 300` |
| $131$（$\pm65$） | 论文未给（只有口头 "$\le\lfloor 2t/w\rfloor+2$ 类"）；`Doubling::nearbyStripIndices(_card)` | 半径 $t$ 球坐标投影（长 $2t$）触及的条带数 | 硬需求 $2t<128\,$width（129 条），$\pm65$ 比 $\pm64$ 多 3 的余量恰好被 floor 两端各 1 的 `nlinarith` 用掉；改 $\pm64$ 会卡在 `mem_nearbyStripIndices` |
| $16=2\cdot8$ | tex:116（$16^2$）；`Doubling::coordinateCell` + `coordinateCell_mem ∈ Ico 0 16` + `abs_sub_lt_of_coordinateCell_eq` | 每轴把 $[c-t,c+t)$ 切 16 格宽 $t/8$，两轴 $16^2$ 个基底格 | 同格 ⇒ 每轴差 $<t/8$，两根加细尾 $\approx0.033t^2<0.25t^2$，余量巨大；8 格（$t/4$）仍过（76800 可压到 19200），4 格（$t/2$）崩。半开 `Ico` 改 `Icc 0 15` 在 $x=c+t$ 的 floor 处卡死。16 纯粹为"数得清" [推测：论文未讨论] |
| $64$（窗口下端 $t/64$） | tex:121/124；`admissible_mem_nearbyLabels`、`fine_tail_le`、`point_dist_lt_half`、`constructedSet_cover` 的 `by_cases hmid` | 定义"中间尺度"下端，兼给细尾 $\sum r_j^2$ 上界 | 双重职能：中间层唯一性需底数 $>64$；tail 需 $b>32\sqrt{2/(1-10^{-6})}\approx45.3$。可行窗口 $b\in(45.3,1000)$；改 32 尾项失控，改 $\le8$ 卡 `point_dist_lt_half` 的 `nlinarith`。64 与 8 之间是刻意平方级余量 |
| $1000$（$r_j=1000^{-j}$） | tex:85；`Construction::scale j=1000⁻¹^(j+1)`、`Doubling::intermediate_unique`、`Construction::sum_scale_sq_le`、`SparseCoordinates::sum_scale_le` | 层级几何衰减，$\sum r_j$ 与 $\sum r_j^2$ 都 $\le2\max$ | 真正刚性只有一条：$1000>64$（`intermediate_unique`，1000 唯一被"用掉"的位置）。次级要求 $>1$（两次几何和上取整 2）。改 100 可行；改 10 中间层唯一性崩（约 6 层同时活跃，标签组合爆炸）；衰减慢到窗口对数长度随 $t$ 无界（$r_j=j^{-\alpha}$）则 doubling 直接崩。[推测：任何 $\ge65$ 整数都行，1000 是留裕度的圆整] |
| Lean 的 $2$（$\sqrt2$ 粗化） | 论文无对应（论文基度量 Euclidean、因子 $D$）；`Construction::point_dist_sameTuple_le`、`Derivatives::embeddingSheet_lipschitz`、`derivativePair_bounds` $((2D)^2)$ | 让 $L^\infty$ `Base` 与 $\ell_2$ 源距离可比 | 真实比值 $\sqrt2$，`nlinarith` 走 $\Delta x^2+\Delta y^2\le2\,\mathrm{dist}^2$ 后上取整；全链 $D\to2D$ 唯一源头，不动 `Base` 就去不掉（分歧 7） |

**家族 B：调度族（极限的替身）**。论文用"$n\to\infty$ 的两级极限"，Lean 用"$\forall\eta>0$ 的一次调度"，这一族是两种文体的互译表。

| 数值 | 位置 | 作用 | 动了会坏在哪 |
|---|---|---|---|
| $n^{-4}$（nearmax 容差） | tex:216-217；`Energy::exists_nearmax_grid` 输出 `A - ‖u‖^2 ≤ t` 等 | 近字典极值 $(A,B)$ 的松紧度 | 消费点唯一：$n^2\cdot n^{-4}=n^{-2}\to0$ 驱动 eq:horizontal。指数必须 $>2$；改 $n^{-3}$ 仍活，改 $n^{-2}$ 崩。4 本身有裕度 [推测：取偶数纯为算顺] |
| $n^{-8}=(n^{-4})^2$（baseerror） | tex:221/227、231（eq:Qerror $<4n^{-8}$）；`exists_nearmax_grid` 的 `t^2/4` 与 `hbaseu : ... ≤ t^2` | 旧片在矩形上的平均平方误差 | 与 nearmax 的平方耦合半刚性（Cauchy–Schwarz 开方后须同容差量级）；Lean 由 `ht2 : t² ≤ t`（`nlinarith`）完成量纲合并，这也是 $t\le1$ 全篇唯一被用处。参数族约束：nearmax $=\rho_n$、baseerror $=\rho_n^2$、加权 $n^2$、要求 $\rho_n=o(n^{-2})$ |
| $4$（修剪放大因子） | tex:231（eq:Qerror）；`Rectangles::integral_le_four_of_subset`、`Energy` 的 `hGu/hGv` | 从好矩形 $Q^0$ 迁到完整周期网格的平均损失 | 面积比 $2\cdot2$（每维长度减半），与 `exists_grid_inside` 输出 `I.length / 2 ≤ ...` 是同一常数两面；只沿一维修剪则是 2，此时 $t^2/4$ 必须联动改。非优化值 |
| $t^2/4$（好点矩形误差） | 论文侧对应 $n^{-8}$；`exists_nearmax_grid` 里 `show 0 < t ^ 2 / 4` | 预留修剪因子 4 | 与 `integral_le_four_of_subset` 精确配对，修剪损失 4 时这里必须 $\le t^2/4$，不可任意 |
| $100$（eq:fine 分母） | tex:227（$Nnr_j<ln^{-8}/100$）；Lean 无对应物 | 保证层足够细、容得 4 个完整周期 | 纯圆整：吃掉 trim 的 2 与 ratio 的 2 后还剩约 25 倍裕度；任何 $>4$ 都跑得通，只改最终 $n$ 幂系数。Lean 把条件直接写成周期 $<L/4$，100 在机器里根本不存在 |
| $\delta=\min(L_x/(4NW),\,L_y/(4N),\,tL_x/2,\,tL_y/2)$ | 同上（论文的 $100$ 行）；`Energy::exists_nearmax_grid` | 同时保证"细"（4 个周期）与"薄"（$r/L\le t$） | 四分量各喂一个下游：去掉前两个则 `exists_grid_inside`（period $<L/4$）失效，去掉后两个则 `hrx/hry`（$r/L\le t$）失效 |
| $Nn r\times Nr$（周期块尺寸） | tex:229/320/324/337、图注 tex:362；`SelectedSheets::xPeriod/yPeriod`、`Crossings::ColorBlock.x_length/y_length` | 各向异性几何：长边加在 $W$、色数用 $N$ | $n$（即 $W_j$）出现在长边上，权重必须与之配平；把权重挪到 $N$ 上，`small_oscillation_of_weighted_energy` 的 $n$ 对消立刻失败 |
| $n^2$ 权重 | tex:255（"The factor $n^2$ compensates for horizontal segments of length $Nnr$"）；`Energy::combinedEnergy := (widthFactor j)^2 * horizontalEnergy + ...` | 水平能量换成与竖直同一标尺 | 权重是长度比的平方 $W^2$ ，并非 $N^2$；不加权则水平振动 $\propto n\sqrt{\text{裸均值}}$ 发散、eq:rowline 的选线界给不出；论文与 Lean 都靠 $n^2$ 与线长 $Nnr$ 中 $n$ 的一次方相消兑现（eq:vertical 后第 8 节的 $n$ 精确对消） |
| $N>(1+2D)^k$ | tex:210-213（eq:N） | 打包矛盾阈值 | 严格大于才与体积比 $N\le(1+2D)^k$ 冲突；$N$ 若随 $n$ 增长，需要 $\varepsilon_n=o(N^{-3})$ 的速率，而 lem:compact 无速率可给（第 6 节 (d)1 与第 7 节 (d)3 的债）。Lean 无对应：抽象 `bound+1` 一次调用，$(1+2D)^k$ 的定量信息整体缺席（分歧 2/4） |
| $2Dr/L_x$、$2D/n$、$2Dr/L_y$ | tex:263/283/301；`SelectedSheets::horizontalColumn_mean/verticalColumn_x_mean/verticalColumn_y_mean` | 线积分除法器的三个实例 | 形状是位移/宽度：$2D/n$ 真身 $2D/W_j$，与色数 $N$ 无关（Lean 保留 $W_j$ 才暴露；分歧 5）。若误把 $N$ 当收敛引擎，eq:eta 的调度失效 |
| $(1+4D)n^{-4}$、$4D^2r/L_x$ | tex:269 | 水平二阶矩的两项合成 | $\lVert u\rVert\le D$ 与均值误差的乘积结构；论文用 $D$、Lean 用 $2D$，系数不可逐项对齐（分歧 7），结构（常数次项 + $D$ 二次项，乘 $t$）一致 |
| $\frac{4D^2}{25N}n^{-7}$、$8n^{-6}$ | tex:274（eq:Hrate 中间行） | 各误差源逐项累加 | $n^{-7}$：eq:ratio 的 $n^{-9}$ 乘 $n^2$ 再除 $50N$；$8n^{-6}$：$2\cdot4n^{-8}\cdot n^2$（素材纠过口径，是 $n^{-6}$ 非 $n^{-8}$，第二个 2 来自平方三角拆分）。$\frac{4D^2}{25N}$ 比精确路线的 $\frac{2D^2}{25N}$ 大一倍，安全方向松弛 |
| $\frac{4D^2}{n}\to0$ | tex:291（eq:eta） | 驱动 lem:compact 的唯一消失项 | 整个调度里 $W\to\infty$ 的唯一理由（Lean 对位 `16 * C * D² / W`）；该项不随 $W$ 消失则 `exists_energy_parameters` 无解 |
| $\omega_n=N\sqrt{2N\varepsilon_n}\to0$ | tex:342（eq:omega） | 沿行/列搬运 $h_i$ 的最大漂移 | 要求 $\varepsilon_n=o(N^{-3})$：$\omega_n$ 对 $N$ 是 $N^{3/2}$ 级放大，无速率引理的债由 $N$ 冻结吸收。Lean 直接取 $\eta=1/(64N^3)$，收敛叙述换成常数界 $s\le r/8$ |
| $\eta=1/(64N^3)$ | Lean 侧；`Crossings::exists_small_energy_block` 调用处 `show 0 < 1 / (64 * (N : ℝ) ^ 3)` | 替代极限的具体能量阈值 | $64=8^2$、$N^3=$ 长边 $N^2$ 乘能量余量 $N$，由 `(nwr)² · n/(64n³) = w²(r/8)²` 一条 `field_simp; ring` 恒等式锁定；幂次改小对消失败，改大只会更松 |
| $2\varepsilon$（屏障余量） | Lean 侧；`anisotropic_energy_bound` 结论首项、`exists_energy_parameters` 的 `2 * (η / 8)` | 用仿射屏障替代 limsup 的固定税 | 纯技术税（$\varepsilon<\eta/8$ 即可）；论文不交这笔税因为它用极限语言（分歧 3 的价格标签） |
| `horizontalCoefficient D = 4+8D(2D+1)` | Lean 侧；`Energy::horizontalCoefficient` | 水平能量 $\le$ 系数 $\times t$ | 由 2（平方三角）+ 2（均值系数）+ $2D$（$\lVert u\rVert$ 界）+ $(2D+1)$（均值定位）机械拼出，`unfold; nlinarith` 收尾；$D$ 大时 $16D^2$ 阶 ⇒ $t\ll1/D^2$，论文侧由 $n\to\infty$ 吸收 |
| `verticalCoefficient D C = 4+2C+8CD+8D(2D+1)` | Lean 侧；`Energy::verticalCoefficient` | 竖直能量 $t$ 项系数，唯一含屏障斜率 $C=M/\delta$ | $C$ 不可控（$\delta$ 可任意小）⇒ $W$ 必须先于 $t$ 定（$K=W^2\cdot\text{horiz}+\text{vert}$）；"order of choices is essential" 的数值根源 |
| $W>\max(1,64CD^2/\eta)$、$t=\min(1,\eta/(4K))$ | Lean 侧；`exists_energy_parameters` 证明首两行 | 两参数的显式调度 | $64=4\times16$ 与 $16CD^2/W<\eta/4$ 互逆；$K\propto W^2$ 使顺序不可交换：先 $t$ 后 $W$ 时 $K$ 未定，调度无从写出 |

**家族 C：几何刚性族**。改了就崩、崩点可指出的那族，数学内容所在。

| 数值 | 位置 | 作用 | 动了会坏在哪 |
|---|---|---|---|
| $\sqrt2$（层内异色分离） | tex:365（图注）、369-371；`Grids::globalSheet_separation_sq : 2 * scale j ^ 2 ≤ ‖·‖²` | 两个正交标签的恰距离 | 纯 Pythagoras $r_j^2+r_j^2=2r_j^2$；$e_{j,i}$ 不归一（取 $r_je/2$）则分离降 $\sqrt2/2$，归一化门槛 1、$(1+2D)^k$、eq:N 全链重写。Lean 保持平方形式（`pow_le_pow_left₀`）避免开方；若同层允许多个非零坐标，2 就变成别的数（论文构造禁止） |
| $1/8$、$5/4$、$25/16<2$ | tex:375（$\sqrt2-2\omega_n>1$）；`Crossings::small_oscillation_of_weighted_energy` 结论 `s ≤ r/8`、`hcentral` 反证里 `5 * scale j / 4` + `nlinarith [sq_pos_of_pos hr]` | 传输后仍保住至少 1 个尺度的分离 | 容差带：需 $2\cdot(s/r)<\sqrt2-1\approx0.414$ 即 $s<0.207r$；$r/8=0.125r$ 有余量，$3r/8$ 时 $(11/8)^2=1.89<2$ 仍勉强，$r/2$ 时 $4>2$ 彻底崩。(5/4)² 与 2 的比较就是论文的 $\sqrt2-2\omega_n>1$ |
| $1$（归一化分离下限） | tex:375；`Crossings::exists_separated_family` 结论 `1 ≤ dist (z i) (z m)`；`Main::no_normalized_embedding` 的 `show (0 : ℝ) < 1` | 打包用的单位分离 | 任何固定正数皆可（随 $r_j$ 缩放），1 只是选择；实质内容是 $1:D$ 的比值 ⇒ `bound` 的大小 ⇒ 所需 $N$ 的大小 |
| $D\ge1$ | 论文 Definition；`Model::AdmitsBiLipschitzEmbedding`（`1 ≤ D`）、`Main::no_scaled_embedding`（`⟨D, le_trans zero_le_one hD⟩`） | 失真归一的合法性 | 另兼任"失真可装进 NNReal"的 Lean 技术角色 |
| $a_j=2^{-j}$、$\eta=1/100$ | tex:455；`ClusterScales::clusterScale j=(1/2)^(j+1)`、`ClusterPlacement` 的 `r / 100` | 簇收缩半径与簇内松半径 | $\eta$ 的双约束 $\eta<1/3$（间距 $\frac12-\frac{3\eta}2>0$）与 $\eta<1$（尾部收编 $1.01/4<1/2$）：$\eta\to1/3$ 分离趋零、活跃尺度窗发散、$\Lambda$ 爆炸；1/100 让两处都以几乎不打折通过。$2^{-j}$ 的倍率与窗口 $(r/4,(400/97)r]$ 联立出"至多 5 档"；Lean 的 $-(j+1)$ 平移同族 A 的 `scale` |
| $101/100$、$101/400<1/2$ | tex:459/467；`ClusterScales::cluster_norm_bound` | 深簇并入单球 $B_{K_B}(0,r/2)$ | $0.2525<0.5$ 余量大，整步只依赖 $(1+\eta)/4<1/2$；与论文逐字一致 |
| $97/200$ | tex:459；`ClusterScales::cluster_separation` | 簇间分离 $(\frac12-\frac{3\eta}2)a_i$ | 系数 3 合并了两端 $\eta$ 误差与中心距 $a_i-a_{i+1}=a_i/2$；与论文逐字一致 |
| $400/97$、$1600/97\in(16,32)$ | tex:481；`ClusterScales::five_scales`（`s ⊆ Icc i (i+4)`） | 活跃簇数 $\le5$ | 区间卡死：极比若 $\ge32$ 则 6 档、$<16$ 则 4 档；$\Lambda$ 的系数直接跟着变。论文与 Lean 都是 5 |
| $2^n>4\Delta$（半数次数规则） | tex:445（"Four halvings ... $\lambda^4$ ... $R/16$"）；`CoverTransfer::intrinsic_doubling_of_distortion36` | 失真桥的覆盖传递开销 | $\Delta=2$（Dvoretzky）$\Rightarrow n=4$；$\Delta=36$（Auerbach $6\times6$）$\Rightarrow n=8$，$2^7=128<144$ 恰好失败。一条不等式同时决定两版 $\lambda_0$ 与 $\Lambda$ 的指数 |
| $\lambda_0=\lambda^4$ vs $76800^8$ | tex:422/445；`ClusterPlacement` 输出 `DoublingAtMost (range f) (76800 ^ 8)` | 簇内 doubling 常数 | 与上行联动；失真若能压回 $<2$ 指数立刻回 4。Auerbach 的全部代价就是这一行 |
| $\Lambda=1+5\lambda_0^2\le1+6\lambda^8$ | tex:485-487；`ClusterCover::ambient_doubling_clusters`（`1 + 5 * L ^ 2`）、`CompactBanach::main`（`1 + 5 * (76800 ^ 8) ^ 2`） | 紧致并的 universal doubling | 结构一致：5 来自 `five_scales`、$L^2$ 来自每簇两次半价、$+1$ 来自极限点 0。差异：Lean 不做 $5\to6$ 松弛、指数 16；数值 $\approx2.7\times10^{39}$，论文只在乎 universal（"independent of the ambient Banach space"） |
| $n>36A$ | 论文未给具体不等式（口头"取远大于失真的 $N$"）；`CompactBanach::main`（`exists_nat_gt (36 * A)` 与 `36 * A ≤ (n : ℝ) + 1` 之间的缝） | 对角阈值吻合 | "36"在整条支线的唯一落点；换 Dvoretzky 的 2 则缝紧、指数回单字头。Lean 比论文多出的一处显式算术 |
| $c_p=(\mathbb E\lVert g\rVert^p)^{1/p}$ | tex:393（cor:lp） | 归一化 Gauss 级数精确等距 | 有限性来自"高斯全体有限矩"，$p=\infty$ 无对象（$c_\infty=\infty$）；不除 $c_p$ 则下游常数乘 $c_p$ 幂。最优性论文未述，形式化缺席，此条仅论文有 |

台账读完，三句话收尾。家族 A 整体是松弛：覆盖族的目标只是有限性，所以 300 照抄 263 的圆整、$\pm65$ 白送 3 的余量、$16^2$ 与 $t/8$ 之间留着平方级空隙，唯一刚性条目是 $1000>64$。家族 B 半刚性：$n^{-8}$ 必须是 $n^{-4}$ 的平方、$\varepsilon_n$ 必须 $o(N^{-3})$、$W^2$ 必须压住 $1/W$，指数之间的量纲耦合不可动，动具体数值可动。家族 C 全刚性：$\sqrt2$、$25/16<2$、$1600/97\in(16,32)$、$2^n>4\Delta$，每一项的崩点都指得出。Lean 形式化对三族的态度恰好是试金石：在 A 层照抄论文的松弛，在 B 层把极限换成显式参数，在 C 层算出比论文更细的算术。我在第 11 节说过作者的防御网不防常数尺寸，现在可以补完：76800 与 $\Lambda$ 这些数在这篇论文里只有两种用途，要么被数出来，要么被崩掉；前者支撑可验证性，后者支撑正确性，两种都不支撑最优性，而最优性恰恰是它留给读者的空白（未述清单第 2、6 条）。本笔记到此全文终。

## 14 常数与参数台账（符号口径，五栏）

第 13 节那三张表按"数值"排，位置栏把 tex 行号与 Lean 定理名混在一起写。这一张按符号排，位置栏一律给 `main.tex:行号`（文件是 `preprints\A-doubling-Hilbert-subset-with-no-finite-dimensional-bi-Lipschitz-embedding-September-25-2026\build\main.tex`，第 0 节已给全路径），每条都回到 tex 里重新定位：先在本笔记前 13 节收集出现过的常数，再逐个去 main.tex 找承载它的那一行，找不到内容行的条目直接舍弃，不留占位。上一条"本笔记到此全文终"是第 13 节收尾时写的，本节与第 15、16 节都在其后追加，第 0 到 13 节的文字一字未改（本次追加只用 Edit 在尾部接，未整片重写文件）。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\lambda$ | $76800=300\cdot16^2$ | main.tex:116 | thm:main 陈述 main.tex:48；cor:lp 的继承句 main.tex:390；cor:banach 起手令 $\lambda=76800$ main.tex:422 | prop:doubling 的分组直径账 main.tex:130-132 与标签计数 main.tex:121 要同时重算，末关在 main.tex:134 的"每组取一点作心" |
| $r_j$ | $1000^{-j}$，层间倍率 1000 | main.tex:85 | 同句之后的 "consecutive radii have ratio 1000"（main.tex:121）；细层几何和 main.tex:127 的 $1-10^{-6}$ | 倍率降到 $\le64$ 则 main.tex:121 的"至多一层中间尺度"失手；改成慢衰减则 main.tex:126 的单层贡献不再被首项支配，(eq:tail) 求和断 |
| 窗口下端 $t/64$ | 分母 $64$；硬下限 $32\sqrt{2/(1-10^{-6})}\approx45.26$ | main.tex:121 | 同句的 $\lfloor2t/r_j\rfloor+2\le129$；(eq:tail) 的求和下限 main.tex:125 | 分母降到 $45.26$ 以下断在 main.tex:128 的 $<(t/32)^2$；升到 $149$ 以上则条数顶破 300；升到 $1000$ 以上中间层唯一性也没了 |
| $129$ | $\lfloor2t/r_j\rfloor+2$ 的最坏值（靠 $2t/r_j<128$） | main.tex:121 | 同句的 "fewer than $300$ available labels, including zero" | 单方向条数一旦可超过 $149$，$2\cdot$(条数)$+1\ge300$，main.tex:116 的因子 300 撑不住 |
| $300$ | 中间层可用标签数上界（含零） | main.tex:121 | prop:doubling 的乘式 $300\cdot16^2$（main.tex:116） | 按 tex 自身算术真实上界是 $1+129+129=259$；压到 260 以下仍安全，压到 259 以下断在 main.tex:134 的分组计数 |
| $16^2$ 与格边 $t/8$ | $256$ 个底座小格 | main.tex:130 | 同句的组底座直径 $\sqrt2\,t/8$；平方和项 $2/64$ 进 main.tex:132 | 改 $4^2$（格边 $t/2$）则 main.tex:132 的开方值 $\ge1/2$，直径 $<t/2$ 失手；改 $8^2$ 仍过并把 $\lambda$ 降到 $300\cdot64=19200$ |
| $\sqrt{33}/32$ | $\approx0.180$，门槛是 $<1/2$ | main.tex:132 | main.tex:134 的半半径球覆盖 | 一旦 $\ge1/2$，组不能被"组内一点的 $t/2$ 球"吞住，prop:doubling 整条结论作废 |
| 同层标签选择 | $w_j=0$ 或 $w_j=r_je_{j,i}$，每层至多一个非零 | main.tex:111 | (eq:tail) 的每层贡献 $2r_j^2$（main.tex:126）；交叉距离恰 $\sqrt2\,r$（main.tex:369） | 同层允许多个非零坐标则 main.tex:126 变胖，main.tex:121 的标签计数与 main.tex:371 的 $\sqrt2$ 门槛同时重写 |
| $(N_j,W_j)$ | $\N^2$ 的序列，每对无穷次出现 | main.tex:85 | 条宽 $r_j$ 与 $W_jr_j$（main.tex:93 与 main.tex:97）；eq:fine main.tex:227；"Infinite recurrence of each pair permits this choice" main.tex:229 | 某对只出现有限次则 main.tex:225-229 选不到层，第 6 节之后的全部对账没有起点 |
| $D\ge1$ | 上 Lipschitz 常数 | main.tex:141 | $K\subseteq[0,D^2]^2$ main.tex:166；eq:N main.tex:212；$\lVert F_i-F\rVert\le Dr$ main.tex:237 | $D$ 挪进下界则 main.tex:237 的偏移界带尺度 $a$，main.tex:371 的 $\sqrt2$ 归一化与 main.tex:381 的体积比一起失效 |
| $K$ | 紧盒 $[0,D^2]^2$ 内所有导数对的闭包 | main.tex:166 | lem:compact 的假设 main.tex:178；eq:Kbounds main.tex:244 | 换成闭包之外的更大集合，main.tex:175 的 $(A,B)\in K$ 与 eq:nearmax main.tex:216 的实际可实现性脱钩 |
| $A,B$ | 字典极大：先 $\max s$，再在截面 $\{t:(A,t)\in K\}$ 内 $\max t$ | main.tex:172-173 | eq:nearmax main.tex:216-217；eq:Kbounds main.tex:243；lem:compact main.tex:179 | 顺序颠倒则 eq:eta main.tex:291 失去逐点 $\le A$ 的免费上界，eq:Vynorm main.tex:295 无从谈起 |
| $\varepsilon,\delta$ | 只存在，无速率 | main.tex:180 | 第一断言的蕴涵 main.tex:182；经 main.tex:293 喂 eq:Vynorm main.tex:295 | 要显式 $\delta(\varepsilon)$ 就得控 $K$ 的形状；main.tex:69 的 "no quantitative modulus of the second extremum is needed" 一撤，main.tex:342 的 $\omega_n\to0$ 立刻缺速率 |
| $D^2$（尾部质量） | Markov 项的分子 | main.tex:193 | 同句的 $\mathbb E t_n\le B+\varepsilon+D^2\mathbb E(A-s_n)/\delta$ | 盒子无界则该右端无界，lem:compact 第二断言整体失效 |
| $n^{-4}$ | nearmax 容差 | main.tex:216-217 | eq:Hmean 的 $+2n^{-4}$ main.tex:263；eq:eta main.tex:291；eq:Vymean main.tex:301 | 指数 $\le2$ 时 main.tex:274 的首项 $2(1+4D)n^{-2}$ 不趋零，eq:horizontal main.tex:251 断 |
| $n^{-8}$ | baseerror，取 $(n^{-4})^2$ | main.tex:221 | Cauchy--Schwarz 后成 main.tex:263 的 $2n^{-4}$；直接进 eq:Qerror main.tex:231 | 换成 $n^{-3}$ 则开方只给 $n^{-1.5}$，$n^2$ 加权后 main.tex:274 出现增长项；硬条件是 $\sqrt{\text{baseerror}}=o(n^{-2})$ |
| $4$（修剪面积因子） | $\langle\cdot\rangle_Q<4n^{-8}$ | main.tex:231 | eq:Hmean main.tex:263；eq:Vymean main.tex:301；余项 main.tex:274 | 与 main.tex:229 的 $L_x,L_y\ge l/2$ 是同一笔账的两面；修剪比例改 $\theta$ 则系数变 $\theta^{-2}$，main.tex:274 的 $8n^{-6}$ 系数联动而幂次不动 |
| $100$ | eq:fine 的分母 | main.tex:227 | main.tex:229 的 trim 计数；eq:ratio main.tex:232 | 一半被 trim 的因子 2 吃掉，写成 main.tex:232 的 $50N$；再小到容不下完整周期时 main.tex:229 的"矩形被周期块铺满"失据 |
| $n^{-9}/(50N)$ | eq:ratio：$r/L_x$ 与 $r/L_y$ 的上界 | main.tex:232 | main.tex:274 的 $\frac{4D^2}{25N}n^{-7}$；eq:Vymean main.tex:301 | 把 $N$ 换成随 $n$ 增长的量则 main.tex:301 的 $2Dr/L_y$ 不趋零，同时 main.tex:342 的 $N$ 冻结被拆 |
| $N>(1+2D)^k$ | 阈值随 $k$ 指数增长 | main.tex:212 | main.tex:383 的 "contrary to \eqref{eq:N}" | 与 main.tex:381 的体积比 $N\le(1+2D)^k$ 必须严格反向；$N$ 改随 $n$ 增长则 main.tex:342 需 $\varepsilon_n=o(N^{-3})$，而 main.tex:195 的两级极限给不出 |
| $Nnr\times Nr$ | 周期块尺寸，长边带 $n$ | main.tex:229 | main.tex:320 的重复声明；行面积 $\lvert P\rvert/N$ main.tex:322；长度因子 main.tex:337 | 把 $n$ 从长边挪走则 main.tex:255 的补偿句反号，$n$ 与 $n^2$ 开方的抵消在 main.tex:338 失败 |
| $n^2$ | 横向能量权重 | main.tex:251 | combined energy main.tex:318；$\varepsilon_n$ main.tex:320；eq:rowline main.tex:325 | 权重是线长比 $n$ 的平方；缺它则 main.tex:337 的振动随 $n$ 发散，main.tex:342 的 $\omega_n\to0$ 不成立 |
| $2Dr/L_x$，$2D/n$，$2Dr/L_y$ | 三个除法器实例：端点误差 $2Dr$ 除条宽 | main.tex:263 | main.tex:269；eq:Vxmean main.tex:283；eq:Vymean main.tex:301 | main.tex:283 的分母是条宽 $nr$ 即 $W_j$，与色数无关；误读成 $N$ 则 main.tex:291 的 $\frac{4D^2}{n}$ 不再由 $n\to\infty$ 消灭 |
| $\frac{4D^2}{25N}n^{-7}$ 与 $8n^{-6}$ | eq:Hrate 的两个显式余项 | main.tex:274 | main.tex:276 的 "which proves \eqref{eq:horizontal}" | 前者由 $n^2\cdot4D^2\cdot n^{-9}/(50N)$ 拼出，后者是 $2n^2\cdot4n^{-8}$；baseerror 或 eq:ratio 任一改幂次，这两项的阶立刻变 |
| $\frac{4D^2}{n}\to0$ | 调度里唯一靠 $n\to\infty$ 消灭的项 | main.tex:291 | lem:compact 的调用 main.tex:293；eq:Vynorm main.tex:295 | 不消失则 $\eta_n$ 不趋零，main.tex:184 的假设 $\mathbb E(A-s_n)\to0$ 落空，eq:vertical main.tex:252 整支断 |
| $\omega_n=N\sqrt{2N\varepsilon_n}$ | 每支传输漂移，对 $N$ 是 $N^{3/2}$ 级放大 | main.tex:342 | main.tex:375 的 $\sqrt2-2\omega_n>1$；图注 main.tex:365 | 需要 $\omega_n<(\sqrt2-1)/2$；$\varepsilon_n\to0$ 无速率，余量全靠 $N$ 在 main.tex:212 冻结 |
| $\sqrt2$ | 异色源点的恰距离 | main.tex:371 | main.tex:375；图注 main.tex:365 | 来自正交同长 $r$ 的勾股（$e_{j,i}$ 见 main.tex:89）；夹角改 $60^\circ$ 则分离降为 $r$，main.tex:375 的 $>1$ 永假 |
| 门槛 $1$ 与打包半径 $1/2$ | 归一化分离下限 | main.tex:379 | 体积比 $N(1/2)^k\le(D+1/2)^k$ main.tex:381 | 门槛换成 $c$ 则 main.tex:212 的阈值变 $(1+2D/c)^k$，同时 main.tex:375 的余量收紧，两处联动 |
| $c_p$ | $(\mathbb E\lvert g_1\rvert^p)^{1/p}\in(0,\infty)$ | main.tex:393 | $J_px=c_p^{-1}\lim_m\sum x_ig_i$ main.tex:399 | 不除则 main.tex:403 的精确等距变成 $c_p$ 倍相似，main.tex:390 的 76800 要带扭曲因子；$p=\infty$ 无定义 |
| $\lambda_0=\lambda^4$ | 簇 doubling 常数 | main.tex:445 | 两次半价覆盖 main.tex:483；$\Lambda$ main.tex:485 | 指数 4 是同句 "Four halvings" 的次数；Dvoretzky 的失真上界若高于 2，halving 次数与指数一起重数 |
| $a_j=2^{-j}$，$\eta=1/100$ | 簇中心尺度与簇半径比 | main.tex:455 | 尾部收编 main.tex:467；簇间分离 main.tex:479；档数窗口 main.tex:481 | $\eta$ 的双约束是 $\eta<1/3$（分离为正）与 $\eta<1$（收编成立）；$\eta\to1/3$ 则 main.tex:479 的 $97/200$ 趋零、main.tex:481 的 $400/97$ 发散 |
| $1600/97\in(16,32)$ | 活跃尺度的极比 | main.tex:481 | 同句的 "at most five such dyadic scales"；$\Lambda$ 里的系数 5 main.tex:485 | 极比若 $\ge32$ 则变 6 档、main.tex:485 的 5 要改 6；倍率 2（main.tex:455）与窗口两端共同决定档数 |
| $1+5\lambda_0^2\le1+6\lambda^8$ | universal doubling $\Lambda$，量级 $2.7\times10^{39}$ | main.tex:485 | main.tex:487 的 "one may take $\Lambda=1+6\lambda^8$"；cor:banach 陈述 main.tex:419 | 5 是档数、$+1$ 是极限点 0（main.tex:465）；$5\to6$ 只是圆整，指数 8 来自 $\lambda_0=\lambda^4$ 再平方 |
| $j\ge k$，$j\ge2D$ | 对角阈值吻合 | main.tex:490 | 同句的复合失真 "strictly below $2D\le j$"；$X_j$ 的取定 main.tex:435 | 严格号一丢就撞上 main.tex:435 的"失真至多 $j$"，cor:banach 末段矛盾消失 |

台账读完，接着写依赖链：哪个常数喂哪条引理，改动它之后证明从哪一步塌。

链一（覆盖侧，全程与嵌入无关）。$r_j=1000^{-j}$ 与分母 64 一起喂 main.tex:121 的中间层唯一性，唯一性喂 129 与 300 的标签计数，格数 $16^2$ 与格边 $t/8$ 喂 main.tex:132 的直径开方，$\sqrt{33}/32<1/2$ 喂 main.tex:134 的取心覆盖，合起来出 prop:doubling 的 76800。76800 之后只被三处消费：thm:main 的陈述、cor:lp 的等距继承（main.tex:390，数字原样搬）、cor:banach 的 $\lambda$（main.tex:422），后者把它抬成 $\lambda^4$、再平方成 $\lambda^8$。这条链上没有任何一步用到 76800 的小，只用到它有限，所以改动 64、$16^2$、1000 中的任一个，塌点都落在 main.tex:121 或 main.tex:132 这两行本身，下游只是数字变大。

链二（障碍侧，靠 $D$ 与 $k$）。eq:bilip 的上界喂 sheet 的 $D$-Lipschitz（main.tex:158），后者喂导数列逐点 $\le D$，于是 $K\subseteq[0,D^2]^2$（main.tex:166）；$K$ 喂 $A,B$ 的字典极大与 lem:compact 的整个陈述；lem:compact 的尾部项用 $D^2$（main.tex:193）。eq:nearmax 的 $n^{-4}$ 与 baseerror 的 $n^{-8}$ 喂三条均值界（main.tex:263、283、301），三条界喂 eq:Hrate 的余项与 eq:eta 的 $\frac{4D^2}{n}$，后者喂 lem:compact 的假设 $\mathbb E(A-s_n)\to0$（main.tex:293），出来是 eq:Vynorm，再与 eq:variance 夹出 eq:vertical。能量 $\varepsilon_n$ 喂选线阈值 $2N\varepsilon_n$，选线喂 $\omega_n$，$\omega_n$ 喂 $\sqrt2-2\omega_n>1$，分离喂体积比，体积比撞 eq:N。这条链的方向性极脆：eq:N 与体积比必须严格反向（main.tex:212 对 main.tex:381），一改成 $\le$ 就断在 main.tex:383；$n^{-4}$、$n^{-8}$、$n^{-9}/(50N)$ 是量纲耦合，改幂次断在 main.tex:274 或 main.tex:291；$D^2$ 的具体大小只是松紧，改它不断任何步。

链三（调度侧）。$k,D\prec N\prec n\prec j$：main.tex:113 禁止 $S$ 依赖嵌入，main.tex:210-212 在 $k,D$ 之后冻结 $N$，main.tex:214 起让 $n$ 跑，main.tex:225-229 再按 eq:fine 到 $S$ 里挑层 $j$。$N$ 的冻结是 $\omega_n$ 的归宿（main.tex:342），$n\to\infty$ 是 $\frac{4D^2}{n}$ 的归宿（main.tex:291），$j$ 的挑选是 eq:baseerror 与周期铺满的归宿（main.tex:221、229）。三件事各有一个专属消失机制，谁也不能替谁：把 $n$ 的角色交给 $N$（让色数跑、条宽固定）则 main.tex:291 与 main.tex:301 同时断，因为 $2Dr/L_y$ 里没有了 $n$；把 $N$ 的角色交给 $n$ 则 main.tex:379 的打包只有 $n$ 个分离点，而阈值 $(1+2D)^k$ 不认 $n$。

## 15 勘误与口径并列

本次把 5 栏台账逐条回 tex 定位时，顺手把前 13 节所有形如 `tex:NNN` 的引用（去重后 114 个行号，集中在第 13 节的表与第 2、3、6、9、10 节）全部对了一次内容行。区间型引用（tex:33-38、118-135、119-134、124-129、177-186、177-196、187-196、199-203、206-246、265-270、312-383、385-412、392-406、414-491）与实际行界全部吻合，行号的偏差只出现在"指向句子"的点上，且都是同一类毛病：引用落在公式界的 `\[`、`\]`、`\end{equation}` 或段落间空行上，正文文字本身没错。以下按行号列出更正，原文不回改。

1. 第 9 节笔记第 721 行写 "tex:394 的等式"，`main.tex:394` 是 `\[`，该恒等式的文字行是 `main.tex:395`。
2. 第 9 节笔记第 729 行把 "Completeness, including at $p=1$, therefore defines" 记作 tex:395，实际在 `main.tex:397`（同段末尾的 $J_p$ 定义式在 399-400）。
3. 第 9 节笔记第 731 行写 "tex:404 一句带过"，`main.tex:404` 是空行，"A zero-dimensional target cannot contain an injective copy of $S_p$" 那句在 `main.tex:405`；同一行另引的 tex:405 是对的。
4. 第 10 节笔记第 769 行把 "These choices are made before any target for $K_B$ is considered." 记作 tex:436，`main.tex:436` 是空行，该句与同段的 "Each $X_j$ has at least two points." 都在 `main.tex:435`；下一段的小标题在 437。
5. 第 10 节笔记第 782 行写 "紧性按序列语言（tex:465 逐字）"，被引的 "Every sequence in $K_B$ therefore has either a constant subsequence..." 在 `main.tex:463`；`main.tex:465` 是覆盖账第一笔的起句（"Fix $x\in K_B$ and $r>0$..."），两处各自有用，只是第 782 行的逐字引用应改指 463。
6. 第 10 节笔记第 782 行写 "tex:469 补一句"，`main.tex:469` 是 `\]`，"The center $0$ need not belong to the ball being covered." 在 `main.tex:470`。
7. 第 5 节笔记第 376 行标 "tex:204 原样"，行号对，但引用块里 "componentwise ... By Fubini" 的省略号处原文是 `\cite[Theorem 3.3]{Heinonen}.`，属截断，并非误行，记在此处免得日后被当成漏引。
8. 第 13 节笔记第 1107 行给 $101/100$ 与 $101/400<1/2$ 的位置写 tex:459/467，`main.tex:459` 处只有 "This placement has distortion strictly below two..."，$101/100$ 的字面出处是 `main.tex:467`，其来源 $(1+\eta)a_j$ 在 `main.tex:463` 与 `main.tex:467` 各出现一次；tex:467 无误，tex:459 只是该段的职能说明。
9. 第 4 节笔记第 331-333 行的逐字块把 `main.tex:188`（一整行，265 字符，四句话连排）按打印排式切成三行，切处正好落在 "convergent subsequence" 中间，块里因此写作 "A conversubsequence"；tex 原文是 "A convergent subsequence would contradict the definition of $B$."。同一块的行界标签 tex:187-196 本身没错，只是块内换行与 raw 文件不同步。第 16 节(a) 按 raw 行重贴了一次。

口径并列（同一量两个值，我不动原文，只把两处摆在一起）。量是"半径 $t$ 球内中间层可用标签数（含零标签）的上界"。

- 出处一：`main.tex:121` 自己的算术是单方向条数 $\le\lfloor2t/r_j\rfloor+2\le129$，于是总数 $\le1+129+129=259$；本笔记第 2 节第 187 行按这条写作"非零标签 $\le129+129=258$，加零"，得数 259。
- 出处二：本笔记第 2 节第 210 行用参数式 $2b+2$ 与 $4b+5$（$b=64$）得 $261<300$，比 259 多 2，因为那里用的是 $2t/r_j<2b$ 的宽松版，没吃掉 floor 与 $+2$ 的边界补偿。
- 出处三：本笔记第 12 节第 949 行与第 13 节第 1067 行写 "真实计数 $1+131+131=263$"，那是 Lean 的 `Icc (⌊c/width⌋-65) (⌊c/width⌋+65)` 口径，每方向 131 个条带指标，比 tex 的 129 多 2。

三个数都在 300 以内，所以 prop:doubling 的结论不受影响；受影响的是"300 是对谁圆整"这句话：按 tex 是 259 圆整到 300，按 Lean 是 263 圆整到 300。我在第 14 节的台账里把这一条按 tex 口径写（见 $\lambda$、$129$、$300$ 三行），第 13 节原文的 263 保持不动，两处并存。

## 16 加深：全文唯一一处无速率的关节（lem:compact 重做）

写第 14 节台账时，$\varepsilon,\delta$ 那一行的第五栏我卡住了：其它行都能写"把数改小到某处就断"，这一行没有数可改。回头翻第 4 节，发现我只写到"第一断言纯拓扑"就转身去了能量估计，$\delta$ 从哪来、第二断言的两条不等式各吃哪些前提，都没落纸。这一节把这两处补全，素材没有这条（素材 2.4 只给证法轮廓），第 12 节也不重讲。

(a) 逐字引用，按行给号（全部在 `main.tex`，与第 4 节的整块引用互为行级对照）。

陈述块 main.tex:177-186：

```tex
177 \begin{lemma}[Near the lexicographic maximum]\label{lem:compact}
178 Let $D>0$, let $K\subseteq[0,D^2]^2$ be nonempty and compact, and define
179 $A=\max\{s:(s,t)\in K\}$ and $B=\max\{t:(A,t)\in K\}$.
180 For every $\varepsilon>0$ there is $\delta>0$ such that
181 \[
182  (s,t)\in K,\quad s>A-\delta\quad\Longrightarrow\quad t\le B+\varepsilon.
183 \]
184 Consequently, if measurable pairs $(s_n,t_n)$ take values in $K$ on probability spaces and $\mathbb E(A-s_n)\to0$, then
185 $\limsup_n\mathbb E t_n\le B$.
186 \end{lemma}
```

证明块 main.tex:187-196：

```tex
187 \begin{proof}
188 Failure of the first assertion would give a sequence in $K$ with first coordinate tending to $A$ and second coordinate greater than $B+\varepsilon$. A conversubsequence would contradict the definition of $B$. For the second assertion, Markov's inequality gives
189 \[
190  \mathbb P\{A-s_n\ge\delta\}\le\frac{\mathbb E(A-s_n)}{\delta},
191  \qquad
192  \mathbb E t_n\le B+\varepsilon+
193  D^2\frac{\mathbb E(A-s_n)}{\delta}.
194 \]
195 First let $n\to\infty$, and then $\varepsilon\downarrow0$.
196 \end{proof}
```

取证两点：main.tex:188 是一整行（265 字符），四句话连排，原文写的是 "A convergent subsequence would contradict the definition of $B$."；第 4 节的逐字块按打印排式把这一行切成三行，并把 convergent subsequence 连排成 conversubsequence，属转录偏差（第 15 节第 9 条）。main.tex:189-194 是那个显示式，190 行是 Markov 不等式，192-193 行是期望上界。本节往后一律按 raw 行的编号引。

(b) 推导补到中间步骤。

步 1（截面非空，$B$ 取到）。$K$ 非空紧，第一坐标投影是紧集连续像故紧，$A=\max$ 取到；截面 $\{t:(A,t)\in K\}$ 非空（含 $A$ 的那条竖线与 $K$ 的交非空），仍是紧集，故 $B$ 取到且 $(A,B)\in K$。tex 没写这段，它在 main.tex:175 用一句 "Thus $(A,B)\in K$" 带过（那句说的是全局的 $K$，本引理里对应的是 main.tex:179 的定义良性）。

步 2（坏集紧）。对固定 $\varepsilon>0$ 令 $E_\varepsilon=\{s:\exists t,\ (s,t)\in K,\ t\ge B+\varepsilon\}$。它是 $\pi_1\bigl(K\cap(\mathbb R\times[B+\varepsilon,\infty))\bigr)$：闭集与紧集的交紧，紧集的连续像紧，故 $E_\varepsilon$ 是 $\mathbb R$ 的紧子集。

步 3（$A$ 不在坏集里，$\delta$ 由此得）。若 $A\in E_\varepsilon$，存在 $t\ge B+\varepsilon$ 使 $(A,t)\in K$，与 $B$ 是截面最大值矛盾。取 $\delta=\operatorname{dist}(A,E_\varepsilon)>0$（紧集不含该点则距离为正）。这就是 tex 那句 "there is $\delta>0$"（main.tex:180）的构造式版本，$\delta$ 完全由 $K$ 的形状决定，论文从不估它。

步 4（严格与不严格的等价）。按步 3 取 $\delta$ 得到的是 $s>A-\delta\Rightarrow t<B+\varepsilon$（$s>A-\delta$ 时 $s\notin E_\varepsilon$）；main.tex:182 写的是 $t\le B+\varepsilon$。先对 $\varepsilon/2$ 用严格版再放宽即得 tex 版。第二断言只用 $\le$，两种写法都够用，但形式化必须选一种，这是它比笔头多花一轮的地方。

步 5（tex 原走的序列反证）。设第一断言对某 $\varepsilon_0>0$ 失败：对每个 $m$ 存在 $(s_m,t_m)\in K$ 使 $s_m>A-1/m$ 且 $t_m>B+\varepsilon_0$。紧性给收敛子列 $(s_{m_l},t_{m_l})\to(s^*,t^*)$。夹逼给 $s^*=A$；$[B+\varepsilon_0,\infty)$ 闭给 $t^*\ge B+\varepsilon_0$；$K$ 闭给 $(A,t^*)\in K$，与 $B$ 的定义矛盾。步 2 到步 3 与步 5 是同一处性质的两种说法（$K$ 闭、$B$ 是截面最大），只在这里吃紧性，别处不吃。

步 6（第二断言的全期望拆分）。Markov 需要非负随机变量：$s_n\le A$ a.e. 来自 $s_n$ 取值于 $K$ 且 $A$ 是 $K$ 第一坐标的上确界（main.tex:178 与 179 合起来），于是 $A-s_n\ge0$。tex 省略了这个非负性，我在台账里把它记进"若改动断在哪一步"：一旦 $K$ 换成第一坐标无上界的集合，main.tex:190 那行的方向就没依据。接着拆
$\mathbb E t_n=\mathbb E[t_n;\,A-s_n<\delta]+\mathbb E[t_n;\,A-s_n\ge\delta]$。
第一项：在 $\{A-s_n<\delta\}$ 上由第一断言逐点有 $t_n\le B+\varepsilon$，故该项 $\le(B+\varepsilon)\mathbb P\{A-s_n<\delta\}\le B+\varepsilon$。第二项：$t_n\le D^2$（main.tex:178 的盒子右端）给 $\le D^2\,\mathbb P\{A-s_n\ge\delta\}$，再套 main.tex:190 的 Markov。两行合起来正是 main.tex:192-193。

步 7（极限顺序不可换）。对固定的 $\varepsilon$（及其 $\delta$）令 $n\to\infty$：$\limsup_n\mathbb E t_n\le B+\varepsilon+D^2\cdot\lim_n\mathbb E(A-s_n)/\delta=B+\varepsilon$。再对 $\varepsilon=1,1/2,1/3,\ldots$ 取交，得 $\limsup_n\mathbb E t_n\le B$，即 main.tex:185。反过来先令 $\varepsilon\downarrow0$ 则 $\delta$ 也随之趋零（$E_\varepsilon$ 单调缩小但 $\delta(\varepsilon)$ 无下界），最后一项 $D^2\mathbb E(A-s_n)/\delta$ 不再由 $n$ 的极限消灭。main.tex:195 那句 "First let $n\to\infty$, and then $\varepsilon\downarrow0$" 就是在给这个顺序立法。

步 8（论文里的调用，main.tex:293-295，前提逐条对）。空间是 $Q$ 配归一化面积测度，$\lvert Q\rvert=L_xL_y$ 有限且正（$L_x,L_y\ge l/2>0$，main.tex:229）；$s_n=\lVert G_V^x\rVert^2$、$t_n=\lVert G_V^y\rVert^2$ 可测，因选取场按竖条颜色分片（main.tex:241），有限色、每片是可测集上的可测函数；逐点取值于 $K$ 由 eq:Kbounds（main.tex:244）；均值假设 $\mathbb E(A-s_n)=\langle A-\lVert G_V^x\rVert^2\rangle_Q=\eta_n\to0$ 正是 eq:eta（main.tex:287-291）的结论。吐出 eq:Vynorm（main.tex:295）。这条调用里唯一不带速率的就是步 3 的 $\delta$，论文对此的公开态度在 main.tex:69： "Compactness suffices for this latter estimate; no quantitative modulus of the second extremum is needed."

(c) 每个假设、常数、指数的机械理由。

加倍常数 76800 在本引理里没有接口。它住在 $S$ 侧（main.tex:116），而本引理的每条假设只提 $D$、$K$、$A$、$B$、$(s_n,t_n)$，一次不涉及覆盖数。两侧的唯一交点是 main.tex:113 那条"固定集纪律"，它规定 $S$ 的参数先于嵌入定死，于是 76800 永远进不到 $\delta(\varepsilon)$ 里。我在台账第 14 节给 $\delta$ 写"若改动断在哪一步"时，答案只能在调度侧找：替它挡速率的是 $N$ 的冻结与 $n\to\infty$，不是任何一个覆盖常数。

双向 Lipschitz 的两支在这里分工不同。上界 $D$：经 main.tex:158 的 sheet 是 $D$-Lipschitz 得导数列逐点 $\le D$，再由 main.tex:166 的 $K\subseteq[0,D^2]^2$ 交给步 6 的尾部估计；引理陈述里的 $D$ 就是这支上界的别名，与下界无关。下界 1：在本引理一次都没出现，它到 main.tex:371 的 $\sqrt2$ 分离与 main.tex:212 的 $(1+2D)^k$ 才兑现。所以 main.tex:178 写 $D>0$ 而 main.tex:141 写 $D\ge1$ 不是笔误，是引理刻意弱化假设。

目标维数 $k$ 同样不进本引理。$k$ 的唯一作用是配合 $D$ 把 $N$ 顶到 $(1+2D)^k$ 之上（main.tex:212），也就是畸变随目标维数呈底数 $1+2D$、指数 $k$ 的增长率；$N$ 因此是一个先定死的有限数。$N$ 冻结之后，main.tex:342 的 $\omega_n=N\sqrt{2N\varepsilon_n}$ 里的 $N^{3/2}$ 放大只是常数因子，$\varepsilon_n\to0$ 无需任何速率；这条豁免一路回溯，正是步 3 那个不肯被估计的 $\delta$ 的容身处。要撤掉豁免，就得让 $N$ 随 $n$ 增长，那时 $(1+2D)^k$ 与 $\omega_n$ 两处同时改口径。

指数 2（$D^2$ ，并非 $D$）来自 $K$ 记的是导数范数的平方（main.tex:168）。若把 $K$ 改成记范数本身，步 6 的尾部界变 $D$，结论照旧，但 eq:eta 的形状 $\eta_n=\langle A-\lVert G_V^x\rVert^2\rangle$（main.tex:287）就没处安放，方差恒等式（main.tex:199-202）也接不上。平方不是审美，是被第 7 节的用法钉住的。

非负性 $A-s_n\ge0$ 是 tex 略写、Lean 必写的一环（步 6）。它让 Markov 的方向成立，也让"均值亏损趋零"这类说法有意义；台账里 $K$ 那一行的第五栏写的就是这一处。

(d) 候选失败路线。

[推测] 其一，把单侧结论升级成双侧 $\mathbb E t_n\to B$。需要 $\liminf_n\mathbb E t_n\ge B$，即存在把 $Q$ 上导数分布实际推向 $(A,B)$ 的选法。eq:nearmax（main.tex:214-218）只锁住一个点、eq:Kbounds（main.tex:242-244）只给上界，$G_V^y$ 在横条方向不受任何约束（选取场按颜色切，main.tex:241），所以均值只被压着、没被托着。双侧若真拿到，第 7 节末"丢掉方差左边"那一步可省，eq:ratio 的 $50N$ 分母也不再必要；我判断走不通，卡点是选取场没有"朝极值选"的自由度。

[推测] 其二，给 $\delta(\varepsilon)$ 配显式模。可写的形式只有步 3 那个 $\delta(\varepsilon)=\operatorname{dist}(A,E_\varepsilon)$，而 $E_\varepsilon$ 依赖 $K$，$K$ 又是所有 sheet 全部好点的收集（main.tex:166-170），对 $f$ 无先验控制。任何代入 $\delta\ge c\varepsilon^{\beta}$ 的尝试都会把 $\beta$ 经 eq:Vynorm 传进 $\omega_n$，与 main.tex:69 的豁免句正面相撞。Lean 侧的做法（第 12 节：换成具体阈值 $\eta=1/(64N^3)$）说明只有两种出路：要么给数，要么把极限整段换掉。

[推测] 其三，用单一标量泛函 $\max(s+\kappa t)$ 代替字典序。那时饱和的是 $s+\kappa t$ ，并非 $s$，坏集与截面都不再存在，lem:compact 只剩一条方向；$\langle\lVert G_V^y\rVert^2\rangle$ 的上界带 $(A-\text{饱和值})/\kappa$ 型松弛，把 $\kappa\to\infty$ 才回到字典序，但此时 $\delta$ 依赖 $\kappa$，$n$ 的调度要整段重写。第 4 节我说过"字典序是本引理全部的力量所在"，这条是从反面试它：单标量版本给不出 $B$ 的精确上界，而 eq:vertical 要的正是精确。

机器侧一行：本节的对应物在 `E:\math\lean\OAI\Geometry\DoublingHilbert\`（28 个 `.lean`、`wc -l` 合计 4664 行，与第 0 节口径一致，本次在目录里重数过），挑战配置 `E:\math\lean\ComparatorChallenges\DoublingHilbert.json` 只点名 `OAI.DoublingHilbert.main` 一个定理，允许 `propext`、`Quot.sound`、`Classical.choice` 三公理；那里的 $\delta$ 是坏集右端点到 $A$ 的距离，存在但从不估计，与步 3 是同一件事的两种呈现，细节留在第 12 节。
