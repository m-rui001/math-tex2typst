# D126: Saxl 猜想的循环 polytabloid 证明：带宽矩阵与列收缩的反推笔记

写作现场记录。素材只有 `preprints/A-Cyclic-Polytabloid-Proof-of-Saxls-Conjecture-September-24-2026/build/` 下的七个 tex 分片，机器侧参照 `lean/ComparatorChallenges/Saxl.json`、`lean/OAI/RepresentationTheory/Saxl/Main.lean` 与 `lean/formalization.yaml:1478--1480` 那三行。我要做的是把这个证明在我脑子里"应该怎么长出来"的过程反推一遍，包括那些我试过并且死掉的分支。凡属我猜的作者心理，一律标 `[推测]`；凡属引文，给 `文件:行号`。PDF 我一个字没读（语料加密），`typst/` 分片也不算素材。

外部血统先把话说清：Saxl 猜想的本体是 Jan Saxl 在 2012 年 3 月 20 日的 UCLA 组合讨论班上提出的，出处是被 Pak--Panova--Vallejo 记录下来的，见 `build/sections/introduction.tex:47--49`。Specht 模、polytabloid、Young 规则这一套循环生成的语言来自 James 的讲义书（`james1978`，Lecture Notes in Mathematics 682），文中在 `build/sections/specht-tools.tex:84` 与 `:141` 直接点到了 Definitions 4.1、4.3 与 Theorem 4.12 以及 Section 16 的 Rule 16.4。阶梯三角形位置排布这个舞台是 Ikenmeyer 的，见 `build/sections/dominance.tex:9`。所以这篇论文的新料只有一样：把循环子模 `$W_m$` 本身当成跟踪对象，并非只在环境张量平方里谈支集。下面所有反推都围绕这一条展开。

## 0 初始动机：为什么先盯住 Steinberg 平方

我手里的问题陈述是 `build/sections/introduction.tex:18--25`：

```tex
\begin{theorem}[Saxl's conjecture]\label{thm:saxl}
For every integer $m\ge1$ and every partition $\lambda\vdash N_m$,
\[
g(\rho_m,\rho_m,\lambda)>0.
\]
Equivalently, $S^{\rho_m}\otimes S^{\rho_m}$ contains every irreducible
complex representation of $S_{N_m}$.
\end{theorem}
```

这里 `$N_m=\frac{m(m+1)}2$`、`$\rho_m=(m,m-1,\ldots,1)$` 来自 `build/sections/introduction.tex:13--15`，`$g(\alpha,\beta,\lambda)=\dim\Hom_{S_n}(S^\lambda,S^\alpha\otimes S^\beta)$` 在 `:7--10`。我最初的动机纯粹是类比驱动的：`build/sections/introduction.tex:43--46` 写了 Heide--Saxl--Tiep--Zalesski 证明 Steinberg 平方覆盖所有单模，除 `$\mathrm{PSU}_d(q)$` 里 `$d\ge3$` 且 `$\gcd(d,2(q+1))=1$` 的那族例外。类比链条是"Steinberg 特征标对应正则表示，阶梯 `$\rho_m$` 是对称群里最像 Steinberg 的一族"。我当时把这种类比当成方法论，觉得既然李型群那边能用几何（`$\mathrm{SU}_d(q)$` 上的共轭作用计数）证明，对称群这边也应该有一个计数式的证明。

猜想的意义层面，`build/sections/introduction.tex:32--37` 说配套论文 `universaltensorsquares2026` 用更强的循环命题（`thm:cyclic-saxl`）去造每个 `$n\notin\{2,4,9\}$` 的通用张量平方。也就是说这篇的价值定位是把"$S^{\rho_m}$ 的平方覆盖一切"升级成"由某个具体向量生成的循环子模已经覆盖一切"，前者只讲 `$g(\rho_m,\rho_m,\lambda)>0$`，后者讲生成元级别的定位。

(c) 机械理由，参数层面：`$m\ge1$` 是 `thm:saxl` 的量化起点，`$N_m$` 的二次增长决定了后面所有"删多少格"的算术；`$2m-1$` 是带宽二的格数（`$K=2m-1$`，见 `build/sections/path-band.tex:21`），它同时是 `$\eta\vdash 2m-1$` 的度数；`$s\in\{1,2\}$` 是带宽的取值集（`build/sections/band-quotient.tex:9`）。这三个常数互相咬合：`$N_m-N_{m-2}=2m-1$`，`$N_m-N_{m-1}=m$`。

(d) 我试过的错路（都是真死，不是修辞）：

1. `[推测]` 用特征标内积硬算 `$\langle\chi^{\rho_m}\chi^{\rho_m},\chi^\lambda\rangle$`。`$\rho_m$` 的特征标值由 Murnaghan--Nakayama 给出，自共轭阶梯的钩分解极其碎，平方以后求和对所有 `$S_{N_m}$` 共轭类展开，项数是 `$p(N_m)$` 级别，任何单个 `$\lambda$` 的符号抵消都无法控制。Pak--Panova--Vallejo 的判据（`build/sections/introduction.tex:60--63`）只处理主钩圈型那一类，覆盖不了全体。
2. `[推测]` 用半群性质 `$g(\alpha,\beta,\gamma)>0\wedge g(\alpha',\beta',\gamma')>0\Rightarrow g(\alpha+\alpha',\beta+\beta',\gamma+\gamma')>0$`。Luo--Sellke 靠它拿到概率为 `$1$` 的覆盖与四次幂通用性（`build/sections/introduction.tex:74--83`），但半群加法会把阶梯形状推离 `$\rho_m$`，所以它给不出平方断言。我一度想对 `$\rho_m$` 做"自相似拆分 `$\rho_m=\rho_a+\rho_b+\text{余项}$`"，余项永远不能被两半同时吸收，失败。
3. `[推测]` 试图直接用 `$2$`-模分解数（Bessenrodt--Bowman--Sutton，`build/sections/introduction.tex:69--72`）。那套机器给 `$2$`-height-zero 支集，等价于奇次数单模，覆盖的是密度零的一族，跟"每一个 `$\lambda$`"差着整整一个支配序的范围。

本笔注叙事对应的论文目录为 preprints/A-Cyclic-Polytabloid-Proof-of-Saxls-Conjecture-September-24-2026，在 .tools/lean_queue.txt 队列第 13 行号（按题名逐字匹配登记，本行只补登记、不改前文）。

## 1 我最初设想的证明形状与第一次崩盘

我最初的路线图是这样的：既然 `$S^{\rho_m}\otimes S^{\rho_m}$` 是半单的，只要对每个 `$\lambda$` 造一个非零 intertwining 映射 `$S^\lambda\to S^{\rho_m}\otimes S^{\rho_m}$`。造映射最自然的办法是配对：找一个 `$\lambda$` 型的 dual polytabloid `$t$`，证明 `$\langle v_{R_m}\otimes v_{C_m},t\rangle\ne0$`。我天真地以为可以一次对所有 `$\lambda$` 做，把 `$t$` 按 `$\lambda$` 的列结构摆到 `$B_m$` 上。

死因在 `$B_m$` 的大小：`$B_m=\{(i,j):i,j\ge1,\ i+j\le m+1\}$`（`build/sections/dominance.tex:11--15`）有 `$N_m$` 个位置，而我要的形状 `$\lambda\vdash N_m$` 可能有 `$\lambda_1$` 接近 `$N_m$` 的一行长条，列长度 `$\lambda_1^t$` 巨大，polytabloid 的交替段超过 `$4$` 项以后就完全不受控（`$2\times2$` 矩阵空间只有 `$4$` 维）。这一点在 `build/sections/introduction.tex:156--160` 里被正面承认："To test a partition with at most four rows, place its tableau columns on consecutive path segments and alternate the covectors within each column. Each segment has length at most four."，也就是说 `$\Mat_2(\C)$` 的 `$4$` 维性是 `$4$` 这个数的来源，而 `$4$` 又决定了带宽只取到 `$2$`。

于是第二次想法成形：不要一次做完，做归纳。把 `$B_m$` 里切出一个 `$B_{m-s}$` 的小三角形，剩下的条带 `$F$` 单独处理。这是 Ikenmeyer 的三角布置（`build/sections/dominance.tex:9`）加上"逐层剥边"的直觉。这里我踩的第一个真正的坑是：归纳需要"$W_m$ 有商同构于某个诱导模"，而我一开始只想证明"$W_m$ 含某个子模"。方向差一点，结论差一整个 `$W_{m-s}$` 的循环性。`build/sections/band-quotient.tex:5--7` 那段作者自述正好把这点钉住了：

```tex
The next step transfers support from a smaller cyclic staircase module
and a band into $W_m$. The projection must retain their specified
generators and realize the full induced module, not just a submodule
of it. We first define the two factors and then verify both requirements.
```

(c) 为什么"商"，并非"子"：归纳假设给的是 `$S^\nu$ 在 $W_{m-2}$ 里`，要把这条信息搬进 `$W_m$`，需要一个 `$G_m$`-等变映射把 `$W_m$` 映到含目标支集的模块上，再用复性把商提升为支集。若只有"子模"关系，支集信息方向反了。`build/sections/band-quotient.tex:196--204` 末尾那句 "The image of this ambient projection need not lie in the two original Specht factors; the composition is still a surjective $G$-equivariant linear map onto the displayed module. Semisimplicity over $\C$ proves the last assertion." 是这条方向的正式说明：投影 `$P_s$` 落在环境张量空间里， `$W_m$` 的两个 Specht 因子之外，所以商必须通过"$W_m$ 上的等变线性满射"这种弱形式来表述。

(d) 错路清单：

1. `[推测]` 用 Kronecker 系数的组合解释（`\operatorname{Tab}(S_n)` 的 Horn 型规则）直接构造张量平方里的最高权向量。Kronecker 问题没有已知正组合规则，`$g(\rho_m,\rho_m,\lambda)$` 连 `$\#\operatorname{stab}$` 型公式都没有，此路在我这里第一周就断。
2. `[推测]` 试图把 `$W_m$` 换成"$V_R\otimes V_C$ 中由 `$w_m$` 生成的、对某个更小的子群 `$H_R$` 不变的子空间"，用不动点维数下界。这样丢掉循环性，`build/sections/introduction.tex:180--184` 明确说"Only one copy of a suitable intermediate irreducible is needed"，可不动点法给不出可跟踪的生成元，归纳的每一步都要重新选向量，无法闭合。
3. `[推测]` 想用 `$\GL$`-型类比（Letellier--Nam 的 `$\GL_n(q)$` 阶梯平方定理，`build/sections/introduction.tex:90--94`）反推普通情形。文中说普通 Kronecker 正性蕴含幂零单字符正性，反方向不成立，所以类比只能给必要条件。

## 2 记号落地与引理 lem:polytabloid：交替块张量就是 Specht 模

我先把生成元写死。`build/sections/specht-tools.tex:47--51`：

```tex
 v_A=\sum_{\pi\in S_r}\sgn(\pi)
       \bigotimes_{i=1}^r e_{\pi(i)},\qquad
 v_L=\bigotimes_{A\in L}v_A,
```

引理原文在 `build/sections/specht-tools.tex:57--62`：

```tex
\begin{lemma}[Alternating blocks as polytabloids]\label{lem:polytabloid}
Define $\theta_i=\#\{A\in L:|A|\ge i\}$, so that the block sizes are
the column lengths of $\theta$.  Then
$\C[S_B]v_L\cong S^\theta$.
The same assertion holds for any ordered basis of a dual vector space.
\end{lemma}
```

(b) 中间步骤补齐。原文在 `:64--89`。链条是：把块按大小降序排成 `$\theta$` 的列，块内顺序从上到下填，得 tableau `$t$`；行 tabloid `$\{t'\}$` 记录每行的元素集合；`$M^\theta$` 是行 tabloid 张成的置换模；映射 `$\{t'\}\mapsto$`（第 `$i$` 行所有位置赋字母 `$i$` 的那个 word）是 `$S_B$`-等变双射（词基与 tabloid 基之间）。列子群 `$C_t$` 作用下的 polytabloid `$e_t=\sum_{c\in C_t}\sgn(c)c\{t\}$`（`:76--78`）映到 `$v_L$`，因为位置作用把"字母的置换"换成"它的逆"，而 `$\sgn(\pi^{-1})=\sgn(\pi)$`。非零性由行词系数 `$1$` 给出（`:81--82`）。最后所有平移张成 `$S^\theta$`，复数域上不可约，出处是 `:84` 的 James Theorem 4.12。

(c) 每个常数的机械理由。`$\theta_i=\#\{A\in L:|A|\ge i\}$` 把"块长列表"翻译成"列高列表"，于是 `$\theta$` 真的是分拆（块长按降序排即得 `$\theta$` 的行）；阶梯情形块长是 `$m,m-1,\ldots,1$`（`build/sections/dominance.tex:34`："Both set partitions have block sizes $m,m-1,\ldots,1$"），所以 `$\theta=\rho_m$`，而 `$\rho_m^t=\rho_m$`（同处 `:35`）保证行划分和列划分给出同一个型。块长必须 `$\le d$`（`build/sections/specht-tools.tex:45`：whose blocks have size at most `$d$`，`$d=\dim E$`）否则 `$e_{\pi(i)}$` 里的字母会越界，交替张量恒为零。对偶空间版本在 `:86--88` 给了两条理由：基选取无关，或者基变换在张量幂上诱导与 `$S_B$` 交换的可逆映射。这条对偶版本后面被 `build/sections/path-band.tex:262--267` 用来断言 `$\mathcal T_N=\C[S_F]t_N$` 是不可约的 `$\eta$` 型模。

(d) 错路：

1. `[推测]` 一开始我想把 `$v_L$` 定义成行交替，并非列交替，指望"行 Specht 模与列 Specht 模对偶"来省事。结果符号约定变成 `$S^{\theta^t}$` 与 `$\sgn$` 扭曲的混用，`build/sections/specht-tools.tex:95--98` 的 `tools:dual-sign` `$ (S^\lambda)^*\cong S^\lambda,\ S^\lambda\otimes\sgn\cong S^{\lambda^t} $` 只在正确的朝向下方可用，朝向搞反时 `$\sgn(\omega_r)$` 那类符号（`build/sections/dominance.tex:169--173`）会整体错位。
2. `[推测]` 想把 `$v_L$` 的块长推广到重复块（比如 `$2,2,1,1$`），指望 `$\theta$` 不必是分拆也能得 Specht 模。`$\theta$` 必须先降序排列，重复块只是允许、并不改变论证，但我当时误以为能直接得到 `$M^\theta$` 的商；实际 `$\C[S_B]v_L$` 是 `$S^\theta$`，比 `$M^\theta$` 小得多，商方向要用 Young 规则。
3. `[推测]` 用 `$q$`-变形（`$q$`-Specht 模）试图让符号抵消带参数可控。复数域上的半单性是 `build/sections/specht-tools.tex:99--101` 明确引用的事实，`$q$`-形下失去半单性，商提升为支集这一步就断了。

引理 lem:young-rule 是这条链的下一环，原文在 `build/sections/specht-tools.tex:145--158`：

```tex
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

(b) 补齐。必要性：Pieri 递推（`tools:pieri`，`:127--134`）说 `$\Ind_{S_a\times S_b}^{S_{a+b}}(S^\nu\boxtimes\mathbf1)\cong\bigoplus S^\lambda$`，指标集是 `$\lambda/\nu$` 为水平条带，于是 `$M^\theta$` 里 `$S^\tau$` 的重数等于条带链 `$\varnothing=\nu^{(0)}\subseteq\cdots\subseteq\nu^{(\ell)}=\tau$`、`$|\nu^{(k)}/\nu^{(k-1)}|=\theta_k$` 的条数（`tools:strip-chain`，`:165--169`）。每个水平条带至多给第一列加一格，故 `$\nu^{(k)}$` 至多 `$k$` 行，`$\sum_{i=1}^k\theta_i=|\nu^{(k)}|\le\sum_{i=1}^k\tau_i$`（`:171--176`）。充分性：对 `$\ell$` 归纳，`$t=\theta_\ell$`，因为 `$\tau_1\ge\theta_1\ge t$` 所以 `$\tau$` 至少有 `$t$` 列；从最高的 `$t$` 列各删底部一格、等高处优先取右列，得 `$\nu$`；列高仍弱减故 `$\nu$` 是分拆且 `$\tau/\nu$` 是水平 `$t$`-条带；关键等式 `tools:prefix-loss`（`:195--198`）`$ \sum_{i=1}^k\tau_i-\sum_{i=1}^k\nu_i=\max(0,t-\tau_{k+1}) $`；再由 `$\sum_{i=1}^k\nu_i=\sum_{i=1}^{k+1}\tau_i-t\ge\sum_{i=1}^{k+1}\theta_i-t\ge\sum_{i=1}^k\theta_i$`（`:203--208`）闭合归纳。重数一：`$\tau=\theta$` 时等号强制 `$\nu^{(k)}$` 恰为 `$\theta$` 的前 `$k$` 行（`:179--182`）。末段（`:218--221`）说词稳定子是等字母位置集上的对称群之积，重排字母多重度只是共轭该子群，所以任意重排内容给出同构的置换模。

(c) 常数的机械理由。支配序 `$\lambda\unrhd\mu$` 的定义在 `build/sections/specht-tools.tex:14--15`（`$\sum_{i=1}^k\lambda_i\ge\sum_{i=1}^k\mu_i$` 对每个 `$k\ge1$`），共轭反序 `tools:conjugate-dominance` 的证明用 `$ \sum_i\max(\lambda_i-q,0)=\max_{k\ge0}(\sum_{i=1}^k\lambda_i-kq) $` 与 `$\sum_{j=1}^q\lambda^t_j=n-\sum_i\max(\lambda_i-q,0)$`（`:21--28`），这两个恒等式是"支配增加则共轭支配减少"的唯一理由，也是 `build/sections/dominance.tex:195--197` 里 `$\rho_m\unrhd\lambda\Rightarrow\lambda^t\unrhd\rho_m$` 的来源。`$\max(0,t-\tau_{k+1})$` 这个表达式是"删掉的底部格有 `$\tau_{k+1}$` 列高于第 `$k$` 行"的直接计数，选列规则（先删最高的、等高取右）保证前缀损失刚好等于它。

(d) 错路：

1. `[推测]` 我一度想用 Littlewood--Richardson 的完整 `$c_{\nu\eta}^\lambda$` 规则替代 Pieri，以为更一般更好用。结果条带链的"至多 `$k$` 行"论证依赖单行平凡表示 `$\mathbf1$`，一般 `$\eta$` 会让每步引入多行，必要性的不等式链整个失效。
2. `[推测]` 想把充分性的构造性删除换成"$\tau$ 与 $\theta$ 的支配差最小化"这种抽象极值论证。抽象论证给不出链本身，而 `build/sections/completion.tex:107--134` 的归纳需要"$\eta$ 存在且行数受控"，必须构造性。
3. `[推测]` 忽略 `$n=0$` 的边界（`:161` 单独处理 `$n=0$`），令 `$\theta$` 有空部分时 `$\ell$` 与归纳步数错位；`$S_0$` 与空分拆这条恒等式在 `build/sections/specht-tools.tex:122--123` 被明确启用，漏掉它会在 `$b=0$` 的 Pieri 情形出鬼。

## 3 被支配情形：符号扭曲、带符号对角平均与内容投影

`prop:dominated` 的原文，`build/sections/dominance.tex:54--58`：

```tex
\begin{proposition}
\label{prop:dominated}
If $m\ge1$, $\lambda\vdash N_m$, and $\rho_m\unrhd\lambda$, then
$S^\lambda$ occurs in $W_m$.
\end{proposition}
```

生成元定义在 `build/sections/dominance.tex:28--33`：

```tex
 w_m=v_{R_m}\otimes v_{C_m},\qquad
 W_m=\C[G_m]w_m
 \ \subseteq\ E_m^{\otimes B_m}\otimes E_m^{\otimes B_m}.
```

(b) 补齐整条链。第一步（`dom:signed-average`，`:75--80`）：行子群 `$H_R=\prod_{i=1}^m S_{R_{m,i}}$`（`:70--72`）在 `$v_{R_m}$` 上的作用是符号特征标 `$\epsilon|_{H_R}$`，故 `$\sum_{h\in H_R}\epsilon(h)\,h w_m=v_{R_m}\otimes u$`，`$u=\sum_{h\in H_R}h v_{C_m}$`。`$u\ne0$` 的证据是词 `$a_0(i,j)=i$`：它在每个递增列里的系数是 `$1$`，被 `$H_R$` 固定，故在 `$u$` 里系数 `$|H_R|=\prod_{r=1}^m r!\ne0$`（`:81--86`）。第二步（`dom:alternating-line`，`:90--96`）用 Frobenius 互反 `$\Hom_G(\Ind_{H_R}^G\epsilon|_{H_R},V_R)$` 与 `$\Ind_{H_R}^G\epsilon\cong M^{\rho_m}\otimes\epsilon$` 得 `$\dim=1$`，依据是 `$\rho_m$` 自共轭故 `$V_R\otimes\epsilon\cong S^{\rho_m}$` 且它在 `$M^{\rho_m}$` 中重数一。第三步（`dom:twist-one-factor`，`:104--109`）把 `$\epsilon$` 扭到第二个因子：`$(V_R\otimes V_C)\otimes\epsilon\to V_R\otimes(V_C\otimes\epsilon)$` 是 `$G$`-同构，取 `$\phi:V_C\otimes\epsilon\to V_R$` 与 `$0\ne z\in\epsilon$`，由 `$u$` 被 `$H_R$` 固定得 `$u\otimes z$` 在 `$H_R$` 下交替，于是 `$\phi(u\otimes z)=c\,v_{R_m}$`，`$c\ne0$`，从而像里含 `$Z_m=\C[G](v_{R_m}\otimes v_{R_m})$`（`dom:repeated-row-cyclic`，`:120--124`）。第四步是显式满射：`$q:E_m\otimes E_m\to E_{\mathrm{out}}$`，`$q(e_a\otimes e_b)=f_{a+b-1}$`（`:127--131`），逐位置作用后投影到内容 `$\alpha=(1,2,\ldots,m,0,\ldots,0)$` 的张成 `$\mathcal M_\alpha$`，得 `$G$`-等变映射 `$Q$`（`dom:pair-letter-map`，`:138--142`）。

(c) 常数的机械理由。`$q$` 的 `$a+b-1$`：两字母都取 `$1,\ldots,r$` 时输出落在 `$1,\ldots,2r-1$`，`$E_{\mathrm{out}}$` 的基取到 `$f_{2m-1}$`（`:127`），`$2m-1$` 正是带宽二的格数，这个重合是 `$K=2m-1$` 在别处再次出现的根源。平方最小性 `dom:square-minimum`（`:151--157`）：行长 `$r$` 的两个赋值 `$a,b$` 都是 `$1,\ldots,r$` 的置换，`$c_j=a_j+b_j-1$`，则 `$\sum_jc_j=r^2$`（因为两个和都是 `$r(r+1)/2$`），且 `$\sum_jc_j^2-r^3=\sum_j(c_j-r)^2\ge0$`。对全三角形求和，被内容投影保留的项要求 `$\sum_{r=1}^m r\cdot r^2=\sum_{r=1}^m r^3$`（`:158--159`：sum of squared output letters is `$\sum_{r=1}^m r^3$`），于是每行取等号，`$c_j=r$` 在该行处处成立，唯一保留词是 `$t_m=\bigotimes_{(i,j)\in B_m}f_{m+1-i}$`（`:163--165`）。系数是 `$(-1)^{\sum_{r=1}^m\binom r2}\prod_{r=1}^m r!$`（`dom:noncancellation`，`:176--180`），因为每个 `$a_j=\pi(j)$` 只有唯一相容的 `$b_j=r+1-\pi(j)=\omega_r\pi(j)$`，符号积 `$\sgn(\pi)\sgn(\omega_r\pi)=\sgn(\omega_r)=(-1)^{\binom r2}$`（`:169--173`）。`$t_m$` 的稳定子恰为 `$H_R$`，轨道是 `$\mathcal M_\alpha$` 的基，故 `$Q(Z_m)=\C[G]t_m\cong\Ind_{H_R}^G\mathbf1\cong M^{\rho_m}$`（`dom:permutation-quotient`，`:183--187`）。

我原先以为这里会有某种"$\rho_m$ 的极大性"论证（阶梯在支配序里对同度数分拆是不是极大？答案是极大，`$\rho_m\unrhd\lambda$` 对所有 `$\lambda\vdash N_m$` 都成立吗？不成立：支配极大要求前缀和最大，而 `$\rho_m=(m,m-1,\ldots,1)$` 的第一行只有 `$m$`，任何 `$\lambda_1>m$` 的分拆都不被支配），所以本命题只覆盖"第一行不太长"的那一族，剩下的必须靠后面两节。这点在 `build/sections/introduction.tex:124--130` 说得很直白："We first prove that it contains every $S^\lambda$ for which $\lambda$ is dominated by $\rho_m$"。

(d) 错路：

1. `[推测]` 我试过把 `$Q$` 换成"$\sum$ 型内容投影不加平方论证"，即直接声称 `$Q(v_{R_m}\otimes v_{R_m})\ne0$` 靠某一项非零。真困难在于抵消：同一输出词可来自多对不同分配，只有 `$\sum c_j^2$` 的下界论证能保证唯一保留词，进而保证"无抵消"。少了 `dom:square-minimum` 就只能得到"系数可能为零"。
2. `[推测]` 试过不做符号扭曲、直接在 `$W_m$` 内部构造 `$M^{\rho_m}$` 的商。`$w_m=v_{R_m}\otimes v_{C_m}$` 的两个因子都带列交替，而 `$M^{\rho_m}$` 需要行不变性；不加 `$\epsilon$` 扭曲就无法把 `$v_{C_m}$` 变成 `$H_R$`-不变的 `$u$`，`dom:signed-average` 那一步根本不会出现。
3. `[推测]` 试过用 `$E_{\mathrm{out}}$` 取 `$2m$` 维（把 `$a+b$` ，并非 `$a+b-1$` 当输出），结果 `$c_j\in\{2,\ldots,2r\}$`，平方和的最小值点不再是常数，`$t_m$` 的唯一性破掉，内容 `$\alpha$` 也要重排。

## 4 切下条带：高位置集为什么被钉死在 `$B_h$` 上

`prop:band-quotient` 的原文，`build/sections/band-quotient.tex:70--79`：

```tex
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

参数在 `band:sets`（`:9--14`）：`$s\in\{1,2\}$`、`$h=m-s\ge1$`、`$D=B_h$`、`$F=B_m\setminus D$`、`$G=S_{B_m}$`、`$H=S_D\times S_F$`，且 `$|F|=N_m-N_h=s(2m-s+1)/2$`（`:14`）。带生成元 `band:generator`（`:19--22`）：`$u_{m,s}=v_{R_F}\otimes v_{C_F}$`，`$U_{m,s}=\C[S_F]u_{m,s}$`，`$R_F,C_F$` 是 `$F$` 的行、列截块划分，每块长至多 `$s$`（`:16`）。

(b) 中间步骤。投影 `$p_s(e_a\otimes e_b)$` 保留"两字母同低或同高"、否则 `$0$`，`$P_s=p_s^{\otimes B_m}$`（`:90--98`）。保留词里称两字母都 `$>s$` 的位置为 high，记 high 集为 `$A$`。交替性给出第一层行计数 `$r_i=\max(h+1-i,0)$`、第二层列计数 `$d_j=\max(h+1-j,0)$`，边际等式 `band:margin-equality`（`:108--112`）：`$ \sum_{i=1}^k r_i=\#\{(i,j)\in B_h:i\le k\}=\sum_{j=1}^m\min(k,d_j) $`。每列至多贡献 `$\min(k,d_j)$` 个 high 位置到前 `$k$` 行，前缀和相等强制逐列相等；对 `$d_j>0$` 取 `$k=d_j$` 得该列的 `$d_j$` 个 high 全在前 `$d_j$` 行，故 `$A=B_h=D$`（`band:unique-high-set`，`:119--121`）。`:122--125` 把这事认作 0-1 矩阵行列边际不等式的取等情形，引 `ryser1957` Section 2。

符号分解 `band:block-factorization`（`:136--139`）：长 `$r$` 的块与 `$D$` 的交是前段 `$a=\max(r-s,0)$`，与 `$F$` 的交是后段 `$b=\min(r,s)$`，规定 high 集后的那块张量恰为 `$(-1)^{ab}\Alt(e_{s+1},\ldots,e_r)\otimes\Alt(e_1,\ldots,e_b)$`，符号来自 `$ab$` 次"高字母全在低字母之前"的逆序；行列交叉符号相乘为 `$\prod_{r=1}^m(-1)^{2\max(r-s,0)\min(r,s)}=1$`（`:147--151`，指数是 `$2$` 的倍数），故 `$z:=P_s(w_m)=\widetilde w_h\otimes u_{m,s}\ne0$`（`band:generator-factorization`，`:158--160`）。

(c) 假设的机械理由。`$s\le2$`：全文只用 `$s\in\{1,2\}$`，因为 `$F$` 的块长上界就是 `$s$`，而支集检测要靠 `$\Mat_2(\C)$` 的 `$4$` 维基，段长上限 `$4=2s$` 只在 `$s=2$` 时够用到"至多四行"。`$h=m-s\ge1$` 保证 `$W_h$` 仍有意义（阶梯至少一格），`build/sections/completion.tex:145--146` 特意为归纳下界写了 "case (ii) has $m\ge5$, so every smaller module invoked has a positive index"。`$H$` 是 `$D$` 在 `$G$` 中的稳定子（`:189` 说 the stabilizer of $D$ in $G$ is exactly $H$），这是 `$D$` 作为"位置集之集"上轨道代表元的必要条件。

(d) 错路：

1. `[推测]` 我曾以为 high 集唯一性可以用"行数与列数的简单比较"得到，不必用 Ryser 型前缀边际。只用总量 `$\sum_j\min(k,d_j)$` 在 `$k=m$` 的等式确实成立但太弱：它只给出 `$|A|=|D|$`，而 `$|A|=|D|$` 对归纳毫无用处，扇区论证需要的是"每个前缀都取等"，才能把 `$A$` 钉成 `$D$`。这条错误的代价是 `$P_s(w_m)$` 的因子化里 `$D$` 会换成某个同势集合，`$\widetilde w_h$` 与 `$u_{m,s}$` 就不再分别落在 `$D,F$` 上。
2. `[推测]` 试过把 `$p_s$` 改成"高低混合也保留、按权重 `$1/2$` 投影"的正交投影。它不再是 `$\{0,1\}$` 型保留，`$z$` 变成多个 high 集分量的和，落在好几个 `$T_A$` 里，`lem:sector-induction` 的前提（`$z\in T_D$`）被破坏，诱导模同构无从谈起。
3. `[推测]` 试过 `$s=3$`：`$F$` 块长至多 `$3$`，`$K=2m-1$` 换成 `$3m-3$`，段长上限变成 `$6$`，而 `$\Mat_3(\C)$` 是 `$9$` 维、四元基那套"两两反交换"结构（`Z^2=T^2=I,J^2=-I`）没有 `$3$` 维类似物，交替段矩阵的可逆性证明整体失效。

## 5 扇区归纳引理：把"子模包含"升级成"整条诱导模"

这是我在读 `build/sections/band-quotient.tex:26--43` 时停下来的地方，原文先交代动机再给引理：

```tex
In the disjoint-coset model of induction
\cite[Section~3.3]{fultonharris1991}, translates of the inducing module
form a direct sum. We record why disjoint coordinate sectors realize
this model for the cyclic span of a specified vector, including the
inverse map.

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

(b) 中间步骤。原文 `:45--68`。`$\Phi$` 良定靠平衡关系 `$gh\otimes a=g\otimes ha$`；等变与满显而易见。逆映射靠"每个 `$A$` 选一个 `$g_A$` 使 `$g_AD=A$`"和坐标投影 `$\pi_A:T\to T_A$`：由 `$\C[G]z=\bigoplus_{A}g_AA_0$` 与 `$g_AA_0\subseteq T_A$` 得 `$g_A^{-1}\pi_A(y)\in A_0$`，于是 `$\Psi(y)=\sum_{A\in\Omega}g_A\otimes g_A^{-1}\pi_A(y)$`（`band:induced-inverse`，`:55--58`）。选 `$g_A$` 的任意性由 `$g_Ah\otimes h^{-1}a=g_A\otimes a$` 吸收。`$\Phi\Psi(y)=\sum_A\pi_A(y)=y$`；反向 `$\Psi\Phi(g\otimes a)=g_A\otimes ha=g\otimes a$`（`$g=g_Ah$`，`$A=gD$`）。应用点在 `:178--199`：`$\Omega$` 取 `$B_m$` 的大小为 `$|D|$` 的子集之集，`$T_A=(E_{\mathrm{hi}}\otimes E_{\mathrm{hi}})^{\otimes A}\otimes(E_{\mathrm{lo}}\otimes E_{\mathrm{lo}})^{\otimes(B_m\setminus A)}$`（`:181--185`），词基互不相交故直和，`$gT_A=T_{gA}$`；`$z\in T_D$` 由 `band:generator-factorization` 给出，`$D$` 的稳定子恰为 `$H$`，`$A_0=\C[H]z\cong W_h\boxtimes U_{m,s}$`（`band:subgroup-orbit`，`:167--174`）。

(c) 假设的机械理由。`$z\in T_D$` 是唯一的实质前提，而它恰好等价于第 `$4$` 节的 high 集刚性：若 `$A\ne D$`，则 `$z$` 有多个扇区分量，`$\Psi$` 的良定与 `$\Phi$` 的单射同时崩掉。`$H$` 必须是稳定子，并非更大的子群，否则 `$\C[G]\otimes_{\C[H]}A_0$` 的秩比 `$\C[G]z$` 小。`$G$` 在 `$\Omega$` 上传递是选系代表 `$g_A$` 的前提。`build/sections/introduction.tex:148--150` 特意点出这条引理"isolates the general reason that sector separation gives an induced-module isomorphism, including an explicit inverse"，机器侧对应 `lean/OAI/RepresentationTheory/Saxl/CoordinateSector.lean` 与 `CyclicSector.lean` 两个模块，也就是这件事在 Lean 里被拆成两次独立的通用化。

(d) 错路：

1. `[推测]` 用双陪集分解 `$\C[G]=\bigoplus_{HgH}\C[HgH]$` 直接算 `$\C[G]z$` 的维数。维数比较只能在 `$z$` 是权向量时给出同构，我这里 `$z$` 是两个轨道的张量积，稳定化子群 `$H$` 在 `$A_0$` 上的作用非平凡，双陪集计数变成 `$\dim\C[G]\otimes_{\C[H]}A_0=\sum_{HgH}\dim A_0^{H\cap gHg^{-1}}$` 这种我控制不了的形式。
2. `[推测]` 试图省掉显式逆映射，只用"`$\Phi$` 满 + 维数相等"。维数相等需要 `$|\Omega|\cdot\dim A_0=\dim\C[G]z$`，而 `$\dim A_0$` 本身要靠 `$W_h$` 的不可约分解估计，绕回来了。显式 `$\Psi$` 是免费的，我当时把它当装饰，结果卡在 `$W_h$` 维数上。
3. `[推测]` 把 `$\Omega$` 换成"所有 high 集可能的集合"，即允许 `$z$` 混合扇区。这样 `$\Phi$` 定义域仍在，但 `$\C[G]z$` 不再同构于诱导模，`prop:band-quotient` 的右端退化为某个真子模，归纳假设的支集信息可能落在被丢掉的那部分。

## 6 宽度一是平凡的，宽度二是一条奇长度路径

`build/sections/path-band.tex:9--15`：

```tex
For width one, the band consists of the $m$ positions with $i+j=m+1$.
Every row and column block is a singleton, and both alphabets consist only
of the letter $1$. Thus $u_{m,1}$ is a nonzero constant word tensor, fixed
by every position permutation, and
\begin{equation}\label{path:one-band}
 U_{m,1}\cong S^{(m)} \qquad (m\geq2).
\end{equation}
```

宽度二的编号在 `path:positions`（`build/sections/path-band.tex:21--26`）：

```tex
Let $m\geq3$, $K=2m-1$, and $F=B_m\setminus B_{m-2}$.
Number its positions along the path by
\begin{equation}\label{path:positions}
 p_{2j-1}=(m+1-j,j)\quad(1\leq j\leq m),\qquad
 p_{2j}=(m-j,j)\quad(1\leq j<m).
\end{equation}
```

紧接着 `:27--35`：行块是单点 `$1$` 与对 `$\ (2,3),(4,5),\ldots,(K-1,K)$`；列块是 `$(1,2),(3,4),\ldots,(K-2,K-1)$` 与单点 `$K$`；每对按路径指标递增排序，记所得交替带张量为 `$u$`；行序与 `$j$` 递增一致，而 `$m-1$` 个列对各自把 `$i$` 递增顺序翻转，故

```tex
 u=(-1)^{m-1}u_{m,2},\qquad U_{m,2}=\C[S_F]u.
```

(b) 补齐。`$F$` 是两条反对角线的并：`$\{i+j=m+1\}$` 有 `$m$` 个点（就是 `$p_{2j-1}$`），`$\{i+j=m\}$` 有 `$m-1$` 个点（就是 `$p_{2j}$`），合起来 `$2m-1=K$` 个，与 `build/sections/band-quotient.tex:14` 的 `$|F|=s(2m-s+1)/2$` 在 `$s=2$` 时吻合：`$2(2m-1)/2=2m-1$`。路径顺序 `$p_1,p_2,\ldots,p_K$` 把行对与列对交错成"锯齿"，这正是 `$J$` 收缩能写成矩阵乘积的几何前提。`:36--102` 的图 `fig:band-path` 画了 `$m=3$`（`$K=5$`）的情形，并说明实线箭头是列对、虚线箭头是行对、行单点是 `$p_1$`、列单点是 `$p_5$`。

(c) 常数的机械理由。`$m\ge3$`：`$m=2$` 时 `$F=B_2\setminus B_0$`，`$K=3$`，列对个数 `$m-1=1$`，形式上还行，但 `$B_{m-2}=B_0$` 让 `$h=m-s=0$` 违反 `build/sections/band-quotient.tex:9` 的 `$h\ge1$`；`$m\ge2$` 的 `$U_{m,1}$` 断言同理（`:15` 写了 `$m\geq2$`）。`$(-1)^{m-1}$` 的来源是列对翻转数，与 `build/sections/path-band.tex:32` 那句 "each of the $m-1$ column pairs reverses increasing $i$" 一一对应；机器侧 `lean/OAI/RepresentationTheory/Saxl/BandSupport.lean:50--52` 里 `$(-1)^{h+1}$` 出现（`h=m-2` 时 `$h+1=m-1$`），两处符号必须对上，这是我在 Lean 里最容易先撞上的一条硬约束。

(d) 错路：

1. `[推测]` 我最初把 `$F$` 想成"最后 `$s$` 行"这种水平条带，指望行块列块都还在原来的行/列划分里。水平切法下 `$F$` 的列块会横跨整个宽度，块长不 `$\le s$`，`band:generator` 的 `$v_{C_F}$` 字母表不够大。斜向切（`$i+j$` 固定）才让所有块长 `$\le s$`。
2. `[推测]` 试图让路径按 `$i$` 递增单调排列，并非锯齿排列。单调排布下行块与列块不再是"不相交的相邻对"，收缩公式 `$X_1\adj(X_2)X_3\cdots$` 的交错结构消失，矩阵乘积变成需要跨块的张量缩并，`4$` 维基技巧全部作废。
3. `[推测]` 宽度二时想直接令 `$u=u_{m,2}$` 而不带 `$(-1)^{m-1}$`。`$U_{m,2}$` 作为循环模不受整体标量影响，所以看似无害；但 `$\langle u,t_N\rangle$` 的符号要与 `build/sections/path-band.tex:292--293` 的 `$(-1)^{m-1}[QBQ^{-1}]_{11}$` 匹配，`$m=3$` 的例子里配对值写成 `$12$` 就是靠 `$(-1)^{m-1}=1$`（`:320`），符号记错会让例子对不上而不能立刻发现。

## 7 列收缩：路径配对等于带伴随的矩阵字

引理 `path:contraction`，`build/sections/path-band.tex:114--122`：

```tex
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

(b) 中间步骤补齐。设定在 `:104--112`：`$E=\C^2$`，`$V=E\otimes E$`，把 `$V^*$` 与 `$\Mat_2(\C)$` 通过"`$X$` 在 `$e_a\otimes e_b$` 上取值 `$X_{ab}$`"认同，并记 `$J=\begin{pmatrix}0&1\\-1&0\end{pmatrix}$`。证明 `:124--151` 的关键是：两个单点块强制第一层（行层）首指标与列层末指标为 `$1$`；一个交替对在路径序下的系数是 `$J_{ab}$`；于是配对展开成 `$\sum_{a_1,\ldots,b_K}$`，约束 `$a_1=b_K=1$`，被 `$\prod_{\ell=1}^{m-1}J_{b_{2\ell-1},b_{2\ell}}J_{a_{2\ell},a_{2\ell+1}}\prod_q(X_q)_{a_qb_q}$` 加权（`path:index-sum`，`:129--135`）。从 `$a_1$` 读到 `$b_K$` 得到 `$[\,X_1JX_2^{\mathsf T}JX_3JX_4^{\mathsf T}J\cdots X_{K-2}JX_{K-1}^{\mathsf T}JX_K\,]_{11}$`（`:137--140`）；偶位出现转置是因为该块的列指标先于行指标被遇到；`path:adjugate`（`:145--148`）给 `$\adj(X)=\tr(X)I-X$` 与 `$JX^{\mathsf T}J=-\adj(X)$`；`$m-1$` 个偶位贡献 `$(-1)^{m-1}$`。收尾一句（`:150`）"In particular, adjugation is a linear operation on $\Mat_2(\C)$." 是整节能做多线性展开的理由。

(c) 机械理由。伴随矩阵出现在偶位、原矩阵出现在奇位，这个 `$2$`-周期性来自 `$D_q$` 的定义（`:181--188`：`$D_q(X)=X$` 若 `$q$` 奇，`$\adj(X)$` 若 `$q$` 偶）。`$[\ \cdot\ ]_{11}$` 这个固定端点来自 `$a_1=b_K=1$` 两个单点约束，它后面会变成 `$QBQ^{-1}$` 的 `$11$` 元，是 `$\GL_2$` 共轭自由度的用武之地。`$\adj(X)=\tr(X)I-X$` 同时给出两件事：线性，以及"共轭与伴随交换" `$D_q(QXQ^{-1})=QD_q(X)Q^{-1}$`（`:280--284`），后者是 `$\Gamma$` 检测能自由换基的代数基础。机器侧这条公式在 `lean/OAI/RepresentationTheory/Saxl/PathContraction.lean:141` 的 `theorem path_contraction (r : ℕ) (X : Fin (2*r+1) → Mat)`，注意 `$K=2r+1$` 的写法：Lean 用 `$r=h+1=m-1$`，于是长度写成 `$2(h+1)+1$`（见 `BandSupport.lean:19,28`），与论文的 `$2m-1$` 是同一个小数的两种参数化。

(d) 错路：

1. `[推测]` 用 `$\det$` 型余向量（把交替对认作 `$\Lambda^2\C^2$`）来代替 `$J$`。方向没错但只给 `$2\times2$` 情形的特例，一旦需要 `$4$` 个不同基元就必须换回 `$\Mat_2(\C)$` 的完整 `$4$` 维基；`$\det$` 是多重线性的、不能逐位相乘。
2. `[推测]` 想把 `$D_q$` 的奇偶定义改成"$q$ 偶时用 `$X^{\mathsf T}$`"。`$JX^{\mathsf T}J=-\adj(X)$` 说明二者只差符号，但转置在相邻因子间的传播会打乱矩阵乘的顺序，收缩图不再是链；伴随的好处是它把转置吸收掉。
3. `[推测]` 直接宣称"`$\langle u,\cdot\rangle$` 是 `$V^{\otimes K}$` 上的迹型泛函"。迹型要求首尾也缩并，而单点块把首尾钉在 `$1$`，所以是矩阵元，并非迹；写成迹会漏掉 `$QBQ^{-1}$` 的端点自由度，检测不到 `$\beta$`。

## 8 四元基与分段交替：`$4$` 这个数字从 `$\dim\Mat_2=4$` 来

基的选择在 `path:matrix-basis`（`build/sections/path-band.tex:163--169`）：

```tex
Use the following ordered basis of $V^*$:
\begin{equation}\label{path:matrix-basis}
 M_1=I,\qquad
 M_2=Z=\begin{pmatrix}1&0\\0&-1\end{pmatrix},\qquad
 M_3=T=\begin{pmatrix}0&1\\1&0\end{pmatrix},\qquad
 M_4=J=ZT.
\end{equation}
```

`:170--179` 给理由：`$I,Z$` 张成对角矩阵、`$T,J$` 张成非对角矩阵故线性无关；后三个无迹且两两反交换；`$Z^2=T^2=I$`、`$J^2=-I$`，四个都可逆；并注明这类在 `$Z,T,J$` 上的交替求值出现在带伴随的 `$2\times2$` 矩阵多项式恒等式研究里（`drenskygiambruno1994` Section 3）。段矩阵定义 `path:segment-definition`（`:189--195`）：

```tex
 A_{r,p}=\sum_{\pi\in S_r}\sgn(\pi)
      D_p(M_{\pi(1)})D_{p+1}(M_{\pi(2)})\cdots
      D_{p+r-1}(M_{\pi(r)}).
```

引理 `path:segment`（`:197--213`）：记 `$e$` 为 `$p,\ldots,p+r-1$` 中偶位个数、`$\delta=1$` 若 `$p$` 偶否则 `$0$`，则

```tex
 A_{r,p}=r!(-1)^{e-\delta}M_1\cdots M_r.
```

值表 `path:segment-table`（`:204--212`）：`$r=1$` 两列都 `$I$`；`$r=2$` 是 `$-2Z$`（`$p$` 奇）与 `$2Z$`（`$p$` 偶）；`$r=3$` 两列都 `$-6J$`；`$r=4$` 是 `$-24I$` 与 `$24I$`。

(b) 补齐。证明 `:215--236`：固定 `$\pi$`，设 `$M_1=I$` 占局部槽 `$j$`；去掉 `$I$` 后剩下 `$M_2,\ldots,M_r$` 的置换，其符号恰等于把这些两两反交换的矩阵重排所积累的符号；把 `$I$` 从规范首位移到槽 `$j$` 给 `$\sgn(\pi)$` 贡献 `$(-1)^{j-1}$` 而不改变乘积，故 `$\sgn(\pi)M_{\pi(1)}\cdots M_{\pi(r)}=(-1)^{j-1}M_1\cdots M_r$`。`path:adjugate` 说伴随固定 `$I$`、把其余三个基元取负（`$\tr$` 为零且 `$\adj(X)=-X$` 对无迹 `$2\times2$` 矩阵成立）。记 `$\epsilon_j=1$` 若 `$p+j-1$` 偶，伴随额外贡献 `$(-1)^{e-\epsilon_j}$`；由 `$\epsilon_j\equiv\delta+j-1\pmod 2$`，总符号 `$(-1)^{e-\delta}$` 与 `$\pi$` 无关，`$r!$` 项全等。典范乘积 `$r=1,2,3,4$` 依次是 `$I,Z,J,-I$`，乘上 `$r!$` 与符号得值表。

(c) 机械理由与我的推导。为什么 `$r\le4$`：`$\eta$ 至多四行` 等价于列长 `$r_j\le4$`（`build/sections/path-band.tex:251--252` 写了 `$1\leq r_j\leq4$` 且 `$\sum_jr_j=K$`），而交替和需要 `$r$` 个不同基元，`$\dim_{\C}V^*=\dim\Mat_2(\C)=4$` 给出硬上限，这就把"四行""宽度二"`$s\le2$`、`$K=2m-1$` 三件事锁在同一个 `$4$` 上。`$r!$` 因子是"所有项同号"的必然结果，不是巧合。机器侧 `lean/OAI/RepresentationTheory/Saxl/BandMatrices.lean:23` 的 `def segment (r p : ℕ) : Mat`，随后 `segment_two_even : segment 2 0 = (2 : ℂ) • basis 1`、`segment_three_odd : segment 3 1 = (-6 : ℂ) • basis 3`、`segment_four_even : segment 4 0 = (24 : ℂ) • basis 0` 与 `$\Sexpr` 表逐条对应（Lean 的 `$p$` 从 `$0$` 起，所以论文"`$p$` 偶"这一列对应 Lean 的 `p = 0`），另有 `segment_mod : segment r p = segment r (p % 2)`（`:169`）把奇偶性压缩成一个布尔量。`ScaledBasis`（`:172`）与 `basis_mul`（`:181`）、`ScaledBasis.mul`（`:248`）合起来说：基元乘积仍是"某个基元的非零倍数"，于是任意段乘积的可逆性由闭合性自动得到，这比论文里手写 `$r=1..4$` 值表更机械。

(d) 错路：

1. `[推测]` 用 Pauli 型正交基（含 `$\frac{1}{\sqrt2}$` 归一化）以期配对值更好看。归一化引入 `$\sqrt2$` 与复共轭，`$\adj$` 在 `$\Mat_2(\C)$` 上是 `$\C$`-线性的（`:150`），但配对值不再是整数，`$m=3$` 例子里 `$12$` 这种可验证的整数证据消失，我在手算阶段无法自检。
2. `[推测]` 试图让每个段用不同的基（段 `$j$` 用 `$N^{(j)}_i$`）。`$A_{r,p}=r!(-1)^{e-\delta}M_1\cdots M_r$` 的证明完全依赖"所有段共用同一基且前四个元素固定"，混基后 `$I$` 的位置与符号 `$(-1)^{j-1}$` 的论证不再成立。
3. `[推测]` 想用上三角基（`$I,E_{12},E_{11},E_{12}E_{21}$` 之类）以让 `$11$` 元自动非零。上三角元不可逆（`$E_{12}$` 幂零），段矩阵 `$A_{r,p}$` 的可逆性直接破坏，`prop:two-band` 里 `$B$` 可逆、`$\beta\ne0$` 的链条断在最开始。

## 9 共轭测试基与宽度二支集：`$11$` 元必须能救活

命题原文 `build/sections/path-band.tex:245--248`：

```tex
\begin{proposition}[Four-row support of the width-two band]\label{prop:two-band}
For every $m\geq3$ and every partition $\eta\vdash 2m-1$ with
$\len(\eta)\leq4$, the irreducible module $S^\eta$ occurs in $U_{m,2}$.
\end{proposition}
```

(b) 补齐。`:250--267`：取 `$\eta$` 的列长序列 `$r_1,\ldots,r_c$`，`$1\le r_j\le4$`、`$\sum r_j=K$`；把路径切成连续段，第 `$j$` 段起点 `$s_j=1+\sum_{i<j}r_i$`；对 `$V^*$` 的任意有序基 `$N_1,\ldots,N_4$`，定义 `$t_N$` 在第 `$j$` 段上为 `$\sum_{\pi\in S_{r_j}}\sgn(\pi)N_{\pi(1)}\otimes\cdots\otimes N_{\pi(r_j)}$`；段即 `$\eta$` 的列、初段基元标注行，故 `lem:polytabloid` 给出 `$\mathcal T_N=\C[S_F]t_N\subseteq(V^*)^{\otimes K}$` 是 `$\eta$` 型不可约模。取 `$N_i=M_i$` 时多线性与 `$t_M$` 定义给出 `path:ordered-factorization`（`:271--274`）：`$\langle u,t_M\rangle=(-1)^{m-1}[B]_{11}$`，`$B=A_{r_1,s_1}\cdots A_{r_c,s_c}$`；段连续故无矩阵交换，`B` 由 `path:segment` 可逆。`:280--294` 是转折：由 `$\adj(X)=\tr(X)I-X$` 得 `$D_q(QXQ^{-1})=QD_q(X)Q^{-1}$` 对每个 `$Q\in\GL_2(\C)$`；取 `$B$` 的属于 `$\beta\ne0$` 的特征向量 `$v$`，选 `$Q$` 把 `$v$` 送到第一个坐标向量，令 `$N_i=QM_iQ^{-1}$`，各段矩阵共轭化、乘积变 `$QBQ^{-1}$`，由 `$(QBQ^{-1})e_1=\beta e_1$` 得 `path:nonzero-pairing`：`$\langle u,t_N\rangle=(-1)^{m-1}\beta\ne0$`。`:298--308` 造 `$\Phi:U_{m,2}\to\mathcal T_N^*$`，`$\Phi(x)(t)=\langle x,t\rangle$`，等变性写作 `$\Phi(gx)(t)=\langle x,g^{-1}t\rangle=(g\Phi(x))(t)$`；目标不可约且由 `tools:dual-sign` 自对偶得型 `$\eta$`，非零映射在不可约目标上自动满，半单性给出支集。

`path:conjugation-example`（`:311--321`）是我认为最诚实的一段，它承认固定基会失败：`$m=3$`、`$\eta=(2,2,1)$`，列段长 `$3,2$`、起点 `$1,4$`，乘积 `$(-6J)(2Z)=12T$` 的 `$11$` 元为零；取 `$Q=\begin{pmatrix}1&1\\1&2\end{pmatrix}$`，`$QTQ^{-1}=\begin{pmatrix}1&0\\3&-1\end{pmatrix}$`，配对值变成 `$12$`。

(c) 机械理由。为什么必须改基而不改 `$u$`：`$\Phi$` 的定义要求两端是同一个位置集上的配对，改 `$u$` 就等于换了归纳里的生成元，`prop:band-quotient` 的因子 `$U_{m,2}$` 不再由投影向量生成。`$\len(\eta)\le4$` 与段长上限同源于 `$\dim\Mat_2=4$`。为什么一个 `$\eta$` 就够：`comb:positive-multiplicity` 只要求 `$\sum_\eta a_\eta c_{\nu,\eta}^\lambda>0$` 里有某一项为正，`build/sections/completion.tex:135--145` 明说 "One copy of each suffices"。机器侧 `lean/OAI/RepresentationTheory/Saxl/BandSupport.lean:45--47` 的 `theorem twoBand_support (h : ℕ) (hh : 1 ≤ h) (μ : YoungDiagram) (t : Tableau (bandSize h 2) μ) (hμ : μ.colLen 0 ≤ 4)` 把"至多四行"写成形如 `$\mu.colLen\ 0\le4$` 的列高条件，中间用 `restrictLetters (lowPairLetter h)`、`Path.bandWord (h+1)`、`Path.fourRow_support` 与 `support_relabel` 串起来，最后一步是 `cyclic_projection_support`。`ColumnContraction.lean:130,153,161` 的 `chain`、`segments`、`sum_chain` 与 `toYoung`、`columnTableau`、`columnPerm`、`columnEquiv`（`:204--266`）则是"把列长列表变成表格与列置换、并核对符号"的那部分机械，论文里 `$\sgn(\pi)$` 与反交换符号混在一句话里，Lean 必须拆成 `$\perm$`、`$\sg$`、`$\perm\_col$`、`$\columnPerm\_sign$` 四条独立引理。

(d) 错路：

1. `[推测]` 我一开始以为 `$B$` 可逆就够了，直接在 `$B$` 上取 `$11$` 元。`$12T$` 这个例子说明可逆矩阵的给定矩阵元可以是零，必须把"选特征向量再共轭"这一步引进来。这也是我第一次真正感到"`$\eta$` 的列到段的划分"与"`$u$` 的行对列对划分"是两套不同的组合，`fig:band-path` 的灰色竖线正是在强调两者不同。
2. `[推测]` 试图用 `$u$` 的平移 `$gu$` 来制造非零 `$11$` 元。`$g$` 同时移动段结构，`$t_N$` 的段就不再连续，`path:ordered-factorization` 里"无矩阵交换"的前提被破坏，乘积顺序一变，特征向量论证整个失效。
3. `[推测]` 想把目标模从 `$\mathcal T_N^*$` 换成 `$\mathcal T_M^*$`（用原基），再靠 `$\GL_2$` 作用在 `$S_F$` 轨道上求和。这样 `$\Phi$` 不再是单个 `$t_N$` 的配对，非零性要证整个和不为零，抵消无法控制；论文只换一个测试基就把问题闭合，比我试过的任何"平均化"都省。

## 10 水平条带归约：四种扫描为什么不能再少

`comb:strip-reduction` 原文，`build/sections/completion.tex:10--27`：

```tex
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

(b) 补齐。情形 (i)（`build/sections/completion.tex:34--38`）：`$\lambda_1\ge m$` 时从最右的 `$m$` 个非空列各删底部一格，对列高序列的右缀减 `$1$` 保持弱减与非负，故余图是分拆 `$\nu$`，删掉的格成水平条带，且 `$N_m-m=N_{m-1}$`。情形 (ii)（`:40--59`）：设 `$\lambda_1\le m-1$`；不被支配给出某个 `$k<m$` 使 `comb:dominance-failure`：`$\sum_{i=1}^k\lambda_i>km-\frac{k(k-1)}2$`；`$k<m$` 因为阶梯前 `$m$` 项之和已是 `$N_m$`；对 `$k\le3$` 有 `$\sum_{i=1}^k\lambda_i\le k(m-1)\le km-\frac{k(k-1)}2$`，矛盾，故 `$4\le k<m$`，特别地 `$m\ge5$`；由部分和的均值单调，`comb:four-row-capacity`：`$\sum_{i=1}^4\lambda_i\ge\frac4k\sum_{i=1}^k\lambda_i>4m-2(k-1)\ge2m+4>2m-1$`。扫描论证（`:61--75`）：整扫去掉每个非空列的底部格，行长从 `$(\alpha_1,\alpha_2,\ldots)$` 变成 `$(\alpha_2,\alpha_3,\ldots)$`，余图嵌套、去格成大小为 `$\alpha_1$` 的水平条带；四次整扫去 `$\lambda_1+\cdots+\lambda_4$` 格；做法是"整扫直到还需去掉的格数不超过当前非空列数，再对最右若干列做部分扫"，右缀论证保证最后也是分拆；由 `comb:four-row-capacity` 至多四次非空扫描正好去掉 `$2m-1$` 格，余图大小 `$N_m-(2m-1)=N_{m-2}$`，反序得 (ii)。

下限证据在 `:78--85`：`$m=13$`、`$\lambda=(8^{11},3)$` 大小 `$91=N_{13}$`，在 `$k=12$` 处失败（前十二项和 `$91>90$`），八列图里每个水平条带至多 `$8$` 格，三条带无法去掉 `$25=2m-1$` 格；扫描去 `$8+8+8+1=25$`，余 `$\nu=(8^7,7,3)$` 大小 `$66=N_{11}$`。

(c) 常数的机械理由。`$2m-1$` 是 `$s=2$` 时的 `$|F|$`，`$m$` 是 `$s=1$` 时的 `$|F|$`（`build/sections/band-quotient.tex:14` 的 `$s(2m-s+1)/2$`）；这两个数是"去多少格"的唯一合法选择，因为它们由带宽决定。`$q\le4$` 的独立理由：情形 (ii) 下每个水平条带大小至多等于非空列数 `$\lambda_1\le m-1$`，所以两条带至多去 `$2m-2<2m-1$`，两条永远不够；`$m=13$` 的例子给出三条不够的具体反例（`$3\cdot8=24<25$`），所以 `$4$` 在一般意义上是紧的。`$4$` 与 `path:segment` 里的段长上限 `$4$` 是同一个数字出现在两个不同位置：一个是"扫描次数"，一个是"`$\eta$` 的行数"，而 `build/sections/completion.tex:129--134` 说明二者的桥是"每条水平条带至多引入一个新行，两行同时新增需要第一列出现两个新格"，故 `$A$` 的每个支集行数 `$\le q\le4$`。Lean 侧 `lean/OAI/RepresentationTheory/Saxl/StripReduction.lean:139--142` 把结论写成 `$\exists q\le4$` 加 `StripChain q ν μ`，并用 `by_cases hfirst : m ≤ μ.rowLen 0` 分支、`stripRemove μ m` 与 `staircase_card_succ` 完成情形 (i)。`Main.lean:18--25` 的 `StripChain.sized` 再把 `StripChain q` 转成具体长度列表 `bs : List ℕ`，`bs.length = q`，因为下游 `band_cut_support` 需要的是"每段尺寸"，并非"段数"。

(d) 错路：

1. `[推测]` 我原以为情形 (ii) 能用两次"$m$-条带"解决，即先把 `$\lambda$` 降到 `$N_{m-1}$` 再降到 `$N_{m-2}$`，这样只需 `$s=1$` 的商两次。失败原因正是 `$\lambda_1\le m-1$`：第一次的 `$m$`-条带根本不存在，删不了 `$m$` 格。
2. `[推测]` 试图让扫描保持某个预定支配不等式（模仿 `lem:young-rule` 的构造性删除）。`build/sections/completion.tex:31--33` 明确说这里不需要："this reduction need not preserve a prescribed dominance inequality; a rightmost suffix suffices to preserve the partition."，我先前多加的约束让右缀规则失去自由度，某些 `$\lambda$` 无法保持分拆性。
3. `[推测]` 想把 `$q$` 放宽到任意、由 `$\eta\vdash 2m-1$` 的行数不受控的 `$A$` 支集凑数。`prop:two-band` 只覆盖 `$\len(\eta)\le4$`，一旦 `$q$` 可能超过 `$4$`，`comb:positive-multiplicity` 里挑出的 `$\eta$` 就没有支集保证，`Main.lean:33` 的假设 `$\eta.\mathsf{colLen}\ 0\le\ \mathsf{bs.length}$` 也无法与 `twoBand_support` 的 `$\mathsf{hμ}:\mu.\mathsf{colLen}\ 0\le4$` 闭合。

## 11 归纳闭包：把两个商拼成 `$W_m$` 的全部支集

`build/sections/completion.tex:87--94` 是主干：

```tex
\begin{proof}[Proof of \Cref{thm:cyclic-saxl}]
We induct on $m$. The module $W_1$ is the one-dimensional representation
of the one-element group, so the assertion holds at $m=1$.

Let $m\ge2$, suppose the assertion holds for all smaller positive indices,
and fix $\lambda\vdash N_m$. If $\rho_m\unrhd\lambda$, then
\Cref{prop:dominated} supplies $S^\lambda$ in $W_m$. Otherwise apply
\Cref{comb:strip-reduction}.
```

(b) 补齐。基例 `$m=1$`：`$B_1$` 只有一个位置，`$W_1$` 是一元群的一维表示，`$\lambda$` 只能是 `$(1)$`。情形 (i)（`build/sections/completion.tex:96--105`）：用 `$s=1$` 的切割，`$|D|=N_{m-1}$`、`$|F|=m$`；`$U_{m,1}\cong S^{(m)}$` 即平凡；归纳假设给 `$S_D^\nu\subseteq W_{m-1}$`；Pieri（`lem:pieri`）给 `$S_{B_m}^\lambda$` 是 `$\Ind_{S_D\times S_F}^{S_{B_m}}(S_D^\nu\boxtimes\mathbf1)$` 的支集；再由 `prop:band-quotient` 的商搬到 `$W_m$`。情形 (ii)（`:107--147`）：令 `$K=2m-1$`、`$s=2$`，写 `$b_i=|\lambda^{(i)})|-|\lambda^{(i-1)}|$`，故 `$b_1+\cdots+b_q=K$` 且 `$q\le4$`；取 `$F$` 的不交子集按这些尺寸构成置换模 `$A=\Ind_{S_{b_1}\times\cdots\times S_{b_q}}^{S_F}\mathbf1\cong\bigoplus_{\eta\vdash K}(S_F^\eta)^{\oplus a_\eta}$`；反复用 Pieri 加诱导传递性得 `$S_{B_m}^\lambda$` 是 `$\Ind_{S_D\times S_F}^{S_{B_m}}(S_D^\nu\boxtimes A)$` 的支集，等价于 `comb:positive-multiplicity`（`:118--128`）：`$\sum_{\eta\vdash K}a_\eta c_{\nu,\eta}^{\lambda}>0$`，其中 `$c_{\nu,\eta}^{\lambda}=\dim\Hom_{S_{B_m}}(S_{B_m}^\lambda,\Ind_{S_D\times S_F}^{S_{B_m}}(S_D^\nu\boxtimes S_F^\eta))$`，系数都是非负整数；每条水平条带至多引入一行（两行同时新增要在第一列放两格，违反条带定义），故 `$A$` 的每个支集行数 `$\le q\le4$`，于是存在 `$\eta$` 使 `$a_\eta>0$` 且 `$c_{\nu,\eta}^{\lambda}>0$`；`prop:two-band` 给 `$S_F^\eta\subseteq U_{m,2}$`，归纳给 `$S_D^\nu\subseteq W_{m-2}$`，一份一份就够，商与复性给结论；`$m\ge5$` 保证 `$m-2\ge3>0$`。`thm:saxl` 的证明（`:150--156`）只剩一句：`$W_m\subseteq S^{\rho_m}\otimes_{\C}S^{\rho_m}$`。

(c) 常数的机械理由。`$q\le4$` 与 `$\len(\eta)\le4$` 的接口是 `comb:positive-multiplicity` 里 `$\eta$` 的来源：`$\eta$` 由 `$q$` 次条带加法构造，行数受 `$q$` 控制；这条接口在 Lean 里被写成 `Main.lean:33` 的假设 `$\eta.\mathsf{colLen}\ 0\le\mathsf{bs.length}$`，其中 `$\mathsf{bs.length}=q$` 来自 `StripChain.sized`（`Main.lean:18--25`）。`$b_i\ge1$` 由 `comb:strip-reduction` 的 "nonempty horizontal strip" 保证，`$A$` 的定义里 `$S_{b_i}$` 才有意义。`$S^{(m)}$` 在 `$U_{m,1}$` 里对应 `$\mathbf1$`，所以情形 (i) 的诱导右端正好是 Pieri 的形状。

(d) 错路：

1. `[推测]` 我原先打算把归纳做在"度数 `$n$`"上，并非"$m$"上，指望 `$W_m$` 与 `$W_{m'}$` 之间有当 $m'\ne m$ 时的兼容性。不同 `$m$` 的位置集 `$B_m$` 大小不同、群也不同，没有自然的限制映射，归纳指标必须与三角形同步。
2. `[推测]` 试图把情形 (i) 与 (ii) 合并成"$\lambda$ 总能拆成 `$\nu\boxtimes\eta$`，其中 `$\eta$` 行数受控"，跳过 `$\lambda_1\ge m$` 的分支判断。合并后 `$\eta$` 的行数上界会退化，`$s=1$` 时 `$\eta=(m)$` 只有一行这件事就没有专门证明，`oneBand_support`（`BandSupport.lean:326--330`，条件 `$\mu.\mathsf{colLen}\ 0\le1$`）就没有对应物。
3. `[推测]` 想在 `$A$` 的分解里直接指定 `$\eta$` 的形状（比如 `$\eta=(b_1,\ldots,b_q)$` 排序后的分拆）。`$a_\eta$` 是否非零取决于条带加法的具体顺序，指定形状会让 `$a_\eta>0$` 变成需要额外证明的事，论文用"$\sum a_\eta c_\eta>0$ 里挑一项"绕开了这个选择。

## 12 关键转折：我在三个地方改变了问题的形状

第一个转折在"$W_m$ 是被跟踪的对象"这件事上。`build/sections/introduction.tex:180--184` 的表述是 "The smaller factor in the quotient is the actual cyclic module $W_{m-s}$, and the band factor is generated by the actual projected vector. This is why both parts of the induction track generators instead of using ambient tensor-product support alone."。我最初的形状是"$\lambda$ 在平方里出现"，转折后是"$\lambda$ 在 `$W_m$` 里出现"，强结论把弱结论包含。代价是每一步都要证明投影后的向量仍是生成元（`band:generator-factorization` 的非零、`staircase_projected_ne_zero` 这条 Lean 定理），收益是归纳假设可用。

第二个转折在切法：从水平/垂直切到沿反对角线切。我试过的水平切在第 `$10$` 节的 (d) 里记过，死因是 `$F$` 的列块长度不受 `$s$` 控制；斜切后 `$F=B_m\setminus B_{m-s}$` 的每个行块与列块长度都 `$\le s$`（`build/sections/band-quotient.tex:16`），于是 `$u_{m,s}$` 的字母表只需 `$\{1,\ldots,s\}$`，`$2\times2$` 的结构才可能出现。

第三个转折在测试基：从"固定基一次算到底"到"`$u$` 不动、只动 `$V^*$` 的基"。`build/sections/path-band.tex:295--296` 写了 "Only the test covectors have changed; $u$ and its endpoint letters remain those fixed in \Cref{path:generator-sign,path:index-sum}."，而 `$m=3$` 的例子证明这一步并非装饰。

最终形状与最初设想的差距可以量化：起初我想对 `$\lambda\vdash N_m$` 一次性造配对，需要的交替段长度上界是 `$\lambda_1^t$`，可以任意大；现在的形状把段长压到 `$4$`，代价是引入归纳、商、条带三个新装置，并且证明从"一个引理"变成"两个定理 + 六个支撑性命题与引理"（`thm:saxl`、`thm:cyclic-saxl`、`prop:dominated`、`prop:band-quotient`、`prop:two-band`、`lem:polytabloid`、`lem:young-rule`、`lem:pieri`、`lem:sector-induction`、`comb:strip-reduction`）。

(d) 这个转折差点没发生的原因，`[推测]` 三条：

1. `[推测]` 我一直把"$W_m\subseteq V_R\otimes V_C$"当成一个仅供引用的包含关系，没意识到 `$W_m$` 自己在商的方向上也是主角；把包含读成"目标空间"就会去做环境支集。
2. `[推测]` 对"至多四行"这个范围的偏见：我以为支配范围外的大部分 `$\lambda$` 都有长首行，四行族是边角料。`build/sections/completion.tex:53--59` 的均值论证说明情形 (ii) 的前四行和 `$>\lambda$ 本身要求`，也就是四行族恰好是被支配条件漏掉的主力的补集。
3. `[推测]` 低估了符号。`$(-1)^{m-1}$`、`$(-1)^{ab}$`、`$(-1)^{\sum_r\binom r2}$` 三处符号各自独立，任何一处错了都不影响结构、只影响非零判断的可见性，所以我一度以为可以忽略；`$m=3$` 例子里配对值 `$12$` 的正负正是靠 `$(-1)^{m-1}=1$` 才写得出来。

## 13 机器侧：`saxl_conjecture` 声明的是哪两个 Specht 模

台账入口是 `lean/formalization.yaml:1478--1480`，comparator 配置 `ComparatorChallenges/Saxl.json` 只认一个定理名 `OAI.Saxl.saxl_conjecture`，允许公理三条 `propext`、`Quot.sound`、`Classical.choice`，`enable_nanoda` 关掉（`Saxl.json:4--13`）。声明本体在 `lean/OAI/RepresentationTheory/Saxl/Model.lean:107--110`：

```lean
def SaxlConjecture : Prop :=
  ∀ (m : ℕ), 1 ≤ m → ∀ (μ : YoungDiagram) (hμ : μ.card = (staircase m).card),
    0 < kronecker (canonicalTableau (staircase m) rfl)
      (canonicalTableau (staircase m) rfl) (canonicalTableau μ hμ)
```

`Main.lean:88` 落槌：`theorem saxl_conjecture : SaxlConjecture := saxl_of_cyclic_support cyclic_saxl_conjecture`。所以机器声明的是"$\mu.\mathsf{card}$ 等于阶梯图 `$\mathsf{staircase}\ m$` 的格子数`"这一族 `$\mu$` 上 `$\mathsf{kronecker}$` 严格为正。两个 Specht 模都是同一个阶梯型：`canonicalTableau (staircase m) rfl` 出现两次，也就是论文里的 `$S^{\rho_m}\otimes S^{\rho_m}$`，张量平方的两个因子形状相同，分解断言是说它包含 `$S_{N_m}$` 的所有单模。`staircase m` 在 Lean 里是 `{(i,j) ∈ Fin m × Fin m | i + j < m}`（`Model.lean:97--104`），即 `$B_m$` 的零基指标版本。

中间层 `CyclicSaxlConjecture`（`CyclicTensor.lean:140--143`）要求的是存在非零交织映射：

```lean
def CyclicSaxlConjecture : Prop :=
  ∀ m, 1 ≤ m → ∀ (μ : YoungDiagram) (hμ : μ.card = (staircase m).card),
    ∃ f : Representation.IntertwiningMap (spechtRep (canonicalTableau μ hμ))
      (staircaseCyclic m).toRepresentation, f ≠ 0
```

`staircaseCyclic m` 是 `cyclic (wordRep _ _) (staircaseWord m)`（`StaircaseTensor.lean:94--96`），`staircaseWord m` 是 `polytabloid (stairRowTableau m) ⊗ₜ[ℂ] polytabloid (stairTableau m)` 的逐位置张量（`:91--92`），正是论文的 `$w_m=v_{R_m}\otimes v_{C_m}$`。`saxl_of_cyclic_support`（`CyclicTensor.lean:146--156`）用 `kronecker_pos_iff` 把"存在非零交织映射"换成"$\mathsf{kronecker}>0$"，靠的是 `staircaseToTensor m` 与 `$f$` 复合后的非零性检验。`Main.lean:96--108` 的 `saxl_contains_every_irreducible` 是第三种说法：给定任意有限维不可约 `$\rho$`，用 `irreducible_equiv_specht` 拿到型 `$p$`，再经 `full_cyclic_support` 与 `staircaseToTensor_injective` 得到一个单射交织映射 `$\rho\to(\mathsf{spechtRep}(\mathsf{stairTableau}\ m)).\mathsf{tprod}\(\mathsf{spechtRep}(\mathsf{stairTableau}\ m))$`。这里的 `$\mathsf{tprod}$` 就是论文里 `$S^{\rho_m}\otimes S^{\rho_m}$` 的对角作用张量积。

`Main.lean:110--122` 另有一条 `saxl_kronecker_pos`，注释写 "The positive-multiplicity conclusion with the literal triangular degree, rather than the definitionally convenient cell count."，结论里度数换成字面的 `$m*(m+1)/2$`，靠 `staircase_card m` 把 `$\mathsf{card}$` 换回来。这告诉我机器侧对"`$N_m$` 的两种写法"是敏感的：`$\mathsf{staircase}\ m$` 的格数是 `$\sum_{i<m}(m-i)$` 型计算，`$m(m+1)/2$` 是闭式，二者需要一条独立引理。

`Main.lean:28--45` 的 `band_cut_support` 是唯一的胶水定理，假设清单值得逐条看：`he : h + s = m`（`build/sections/band-quotient.tex:9` 的 `$h=m-s$`）、`hν : ν.card = (staircase h).card`、`t : Tableau (staircase m).card μ`、`bs : List ℕ` 配 `hs : SizedStripChain bs ν μ`、`fh ≠ 0`（归纳假设）、以及带假设 `hband : ∀ (η) (r : Tableau (bandSize h s) η), η.colLen 0 ≤ bs.length → ∃ F ≠ 0`。证明体只有四步：`shiftedStairWord_support`、`strip_product_support`、`rw [← staircase_cut_factor]`、`cyclic_projection_support (sameHighProjection _ _ _ s)`。`full_cyclic_support`（`Main.lean:58--80`）用 `Nat.strong_induction_on`，`by_cases hd : Dominates (staircase m) μ` 分派到 `dominated_support`，否则 `rcases strip_reduction ... with ⟨ν,hν,hs⟩ | ⟨hm5,q,hq,ν,hν,hs⟩`，两支分别调 `oneBand_support (m-1) η r hη` 与 `twoBand_support (m-2) (by omega) η r (by omega)`。`m=1` 的边界由 `staircase_one_dominates`（`Main.lean:47--54`）单独处理：所有 `$\mu\vdash\mathsf{staircase}\ 1$` 都被 `$\mathsf{staircase}\ 1$` 支配，所以 `$m=1$` 时 `$\neg\mathsf{Dominates}$` 分支为空，`hm2 : 2 ≤ m` 由此得来。

(d) 错路：

1. `[推测]` 把 `$\mathsf{SaxlConjecture}$` 直接写成 `$W_m$` 的支集集合相等。支集是 `$\mathbb N$` 值函数 `$\mathsf{kronecker}$`，写成集合等式需要单模分类的可选择代表，机器上等价但重述成本高；论文的 `$g(\rho_m,\rho_m,\lambda)>0$` 已是最低代价形式。
2. `[推测]` 用 `$\mathsf{Subrepresentation}$` 的格论语句"某模包含于某模"替代 `$\exists f\ne0$`。后者给出可复合的态射，前者要证包含时还得处理生成元的等式；`Main.lean:36` 的结论形态 `$\exists F$`、`$F\ne0$` 说明整个证明走的是态射代数。
3. `[推测]` 让 `$\mathsf{Dominates}$` 沿用论文的字母序。`HorizontalRemoval.lean:12` 是 `def Dominates (μ ν : YoungDiagram) : Prop := ∀ k, rowPrefix ν k ≤ rowPrefix μ k`，第一个参数是被支配者右侧的"大者"，与 `$\lambda\unrhd\mu$` 的参数顺序一致但读法反直觉，我若按论文顺序反着用，`hd : Dominates (staircase m) μ` 就会变成错误方向，`dominated_support` 立刻类型不匹配。

## 14 机器侧为什么把带宽与列收缩分家

模块清单（`lean/OAI/RepresentationTheory/Saxl/` 共 `$38$` 个 `$\mathsf{.lean}$`）里，体积靠前的四个是 `BandSupport.lean` `$14665$` 字节、`HighProjection.lean` `$13596$`、`BandMatrices.lean` `$13529$`、`ColumnContraction.lean` `$12691$`。读完这四位的顶层声明，我的结论是：分家的边界正好落在"哪些位置留下来"与"留下来的位置配成什么标量"这两问上。

带宽一侧的证据在 `HighProjection.lean`：`high_positions_rigidity`（`:43`）对应 `band:unique-high-set`；`sameHighProjection`（`:114--121`）的实现是 `$\mathsf{toFun}\ z\ w := \mathsf{if}\ (\forall i,\ s\le(\mathsf{splitLeft}\ w\ i).\mathsf{val}\leftrightarrow s\le(\mathsf{splitRight}\ w\ i).\mathsf{val})\ \mathsf{then}\ z\ w\ \mathsf{else}\ 0$`，这是论文 `$p_s$` 的字面翻译，判断条件是一个关于 `$\mathsf{Fin}$` 值的逻辑等价；`staircase_projected_high_positions`（`:129`）、`rotateRow`/`rotateColumn`（`:215--227`）、`staircase_projected_ne_zero`（`:257`）合起来做的是"投影非零且 high 集刚性"。这些引理的证明风格是 `$\mathsf{omega}$` 加 `$\mathsf{simp}$` 的指标算术，`polytabloid_support`（`:96`）与 `polytabloid_column_coeff`（`:247`）负责 polytabloid 的单点系数。

列收缩一侧的证据在 `ColumnContraction.lean`：`Cells rs`、`row`、`col`、`enumerate : (rs : List ℕ) → Fin rs.sum ≃ Cells rs`（`:23--31`）把"列长列表"变成一个可枚举的格集；`perm`、`sg`、`sign_perm`（`:53--61`）、`perm_col`（`:71`）说列置换保持列指标；`chain`、`segments`、`sum_chain`（`:130--167`）实现论文的 `$A_{r,p}$` 型交替和；`toYoung`（`:204`）、`columnTableau`（`:228`）、`columnPerm`、`columnPerm_bijective`、`columnEquiv`、`columnPerm_sign`（`:235--266`）把 `$\eta$` 的列结构翻译成列群上的置换并核对符号。`BandMatrices.lean` 是这一侧的代数内核：`D q X = if q % 2 = 0 then X.adjugate else X`（`:21`）是 `$D_q$`；`segment`、八条 `segment_*_even/odd`、`segment_mod`（`:23--169`）是值表；`ScaledBasis` 与 `basis_mul`、`ScaledBasis.mul`（`:172--248`）是可逆性的闭合论证。`PathContraction.lean` 的 `path_contraction`（`:141`）与 `chain_entries`、`chain_entries_endpoint`（`:108--133`）是 `$[\ \cdot\ ]_{11}$` 的推导。`BandSupport.lean` 把两侧接起来：`twoBand_support`（`:45`）先证 `$\mathsf{restrictLetters}\ (\mathsf{lowPairLetter}\ h)\ (\mathsf{stairBandWord}\ h\ 2)=(-1)^{h+1}\bullet(\lambda w\Rightarrow\mathsf{Path.bandWord}\ (h+1)\ (w\circ\mathsf{bandPathEquiv}\ h))$`（`:49--53`），再 `$\mathsf{support\_relabel}$`、`$\mathsf{cyclic\_smul\_eq}$`、`$\mathsf{cyclic\_projection\_support}$`。

分家的必要性有三条硬理由。其一，字母表表示不同：论文的 `$w_m\in E_m^{\otimes B_m}\otimes E_m^{\otimes B_m}$`（`build/sections/dominance.tex:28--33`）在 Lean 里是 `$\mathsf{wordRep}\ n\ (d*e)$` 上的单层词，两层被 `$\mathsf{finProdFinEquiv}$` 打包成一个 `$\mathsf{Fin}$` 字母（`BandSupport.lean:15--18` 的 `lowPairLetter`、`BandFactorization.lean:53--54` 的 `highLetter`），带宽判断要在打包字母上做 `$\mathsf{splitLeft}$`/`$\mathsf{splitRight}$`，而收缩计算要把它解包成 `$\mathsf{Fin}\ 4$`；两套表示之间的等价需要显式 `$\mathsf{Equiv}$`，混写会类型错。其二，正确性判据不同：带宽侧的断言是支撑集与刚性（一个集合等式），可用判定性命题 `$s\le a\leftrightarrow s\le b$` 表达；收缩侧的断言是 `$\Mat_2\ \mathbb C$` 里的标量等式，需要逐矩阵元展开（`PathContraction.lean:53--76` 的 `entry_sum`、`adj_entry`）。其三，复用范围不同：`lem:sector-induction` 与 `CoordinateSector.lean`、`CyclicSector.lean` 是纯群论的，`BandFactorization.lean` 的 `cutPositions`（`:27--31`）是纯位置的，把它们与 `$2\times2$` 代数分开，才能让 `$s=1$` 与 `$s=2$` 两支共用同一套商机器（`Main.lean:74--79` 两次调用同一个 `band_cut_support`）。

(d) 错路：

1. `[推测]` 把 `$P_s$` 与 `$D_q$` 写进同一个模块，指望一个"带投影的收缩"定理一次到位。两类语句的 `$\mathbb C$` 结构不同（前者是 `$0/1$` 选择，后者是线性映射），合并后 `$\mathsf{IntertwiningMap}$` 的定义要同时携带判定点与矩阵乘法，`isIntertwining'` 的证明会变得不可自动化。
2. `[推测]` 直接用论文的两层张量表示而不打包成 `$d*e$`。`$\mathsf{wordRep}$` 在库里是"字母表为 `$\mathsf{Fin}\ d$` 的词空间"，二层结构需要另外定义 `$\mathsf{Rep}$` 作用与配对；打包成 `$d*e$` 让 `$\mathsf{Fin}$` 算术可用 `$\mathsf{omega}$`，代价是所有"$a,b\le s$"的陈述变成 `$\mathsf{splitLeft}$`。我在读 `sameHighProjection` 时先猜它是 `$\mathsf{if}$` 一个 `$\mathsf{And}$`，实际是双向蕴含 `$\leftrightarrow$`，这正是"同低或同高"的紧凑写法。
3. `[推测]` 把列收缩的符号核算并进 `$\mathsf{Segment}$` 计算。`ColumnContraction.lean:71` 的 `perm_col`（列置换保持列指标）与 `:266` 的 `columnPerm_sign` 是纯组合的，与矩阵值无关；合并会让 `$\mathsf{segment}$` 的每条取值引理都要重复一次符号论证。

## 15 独立台账

下表逐条给出我在笔记里用到的常数、指数与增长率。第三栏是 `位置(文件:行)`，tex 侧省略前缀 `build/`。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| `$N_m$` | `$\frac{m(m+1)}2$`，`$\Theta(m^2)$` | `sections/introduction.tex:13--15` | `$\lambda\vdash N_m$` 的全部量化 | `$N_m-(2m-1)=N_{m-2}$` 失配，`comb:strip-reduction` 的余图尺寸错 |
| `$\rho_m$` | `$(m,m-1,\ldots,1)$`，自共轭 | `sections/introduction.tex:13--15` | `$V_R,V_C\cong S^{\rho_m}$`（`dominance.tex:36--41`） | `dom:alternating-line` 末条等式的重数一失效 |
| `$B_m$` | `$\{(i,j):i+j\le m+1\}$`，`$N_m$` 点 | `sections/dominance.tex:11--15` | `$G_m=S_{B_m}$`、`$W_m\subseteq E_m^{\otimes B_m}\otimes E_m^{\otimes B_m}$` | 行列表长 `$m,\ldots,1$` 不再成立，`lem:polytabloid` 给不出 `$\rho_m$` |
| `$R_m,C_m$` | 行、列划分，块长 `$m,\ldots,1$` | `sections/dominance.tex:17--25` | `$w_m=v_{R_m}\otimes v_{C_m}$` | `dom:signed-average` 里 `$H_R$` 的符号作用无法定义 |
| `$s$` | `$\{1,2\}$` | `sections/band-quotient.tex:9` | `$\lvert F\rvert$`、`$U_{m,s}$`、`$P_s$` | 段长上限离开 `$4$`，`path:segment` 的可逆表崩 |
| `$h$` | `$m-s\ge1$` | `sections/band-quotient.tex:9` | `$D=B_h$`、`$W_h$` | `$h=0$` 时 `thm:cyclic-saxl` 的归纳假设无定义 |
| `$F$` | `$B_m\setminus B_h$`，`$\frac{s(2m-s+1)}2$` 点 | `sections/band-quotient.tex:11--14` | `$u_{m,s}=v_{R_F}\otimes v_{C_F}$` | `$\lvert F\rvert$` 与 `$K$` 脱钩，`comb:positive-multiplicity` 的和式尺寸错 |
| `$K$` | `$2m-1$` | `sections/path-band.tex:21` | `$\eta\vdash K$`、`$\sum_jr_j=K$` | 带生成元的度数与 `$\eta$` 的度数不等，`prop:two-band` 陈述不成立 |
| `$r_i,d_j$` | `$\max(h+1-i,0)$`、`$\max(h+1-j,0)$` | `sections/band-quotient.tex:104--106` | `band:margin-equality` | 前缀等式不再成立，`band:unique-high-set` 的 `$A=D$` 失 |
| `$a,b$` | `$\max(r-s,0)$`、`$\min(r,s)$` | `sections/band-quotient.tex:128--130` | `band:block-factorization` | 高低段划分改变，`$\Alt$` 因子不再对应 `$D,F$` |
| `$(-1)^{ab}$` | 逆序数 `$ab$` | `sections/band-quotient.tex:136--141` | 交叉符号乘积 `$\prod_r(-1)^{2ab}=1$`（`:147--151`） | `$z=P_s(w_m)$` 的整体符号变，`band:generator-factorization` 非零性需重证 |
| `$\lvert H_R\rvert$` | `$\prod_{r=1}^m r!$` | `sections/dominance.tex:86` | `$u\ne0$` 的系数证据 | 若 `$H_R$` 定义变，词 `$e_{a_0}$` 的系数不再是阶乘，非零性丢 |
| `$Q$` | 逐位置 `$q(e_a\otimes e_b)=f_{a+b-1}$` | `sections/dominance.tex:127--142` | `dom:permutation-quotient` | `$E_{\mathrm{out}}$` 维数 `$2m-1$` 不够，最高输出字母越界 |
| `$\sum c_j^2-r^3$` | `$\sum_j(c_j-r)^2\ge0$` | `sections/dominance.tex:151--157` | 平方和最小性迫使 `$c_j=r$` | 唯一保留词 `$t_m$` 不再唯一，`dom:noncancellation` 崩 |
| `$\sum_{r=1}^m r^3$` | 闭式 `$\frac{m^2(m+1)^2}{4}$`，`$\Theta(m^4)$`（闭式为我补算） | `sections/dominance.tex:158--159` | 三角和约束的右端 | 等号条件变弱，无法逐行取等 |
| `$(-1)^{\sum_r\binom r2}$` | 指数 `$\frac{(m-1)m(m+1)}{6}$` | `sections/dominance.tex:169--180` | `$Q(v_{R_m}\otimes v_{R_m})$` 的符号 | `$m=3$` 例子里配对值的符号与 `path-band.tex:320` 不符 |
| `$\alpha$` | `$(1,2,\ldots,m,0,\ldots,0)$` | `sections/dominance.tex:134--137` | `$\mathcal M_\alpha\cong M^{\rho_m}$` | 内容重排定理（`specht-tools.tex:218--221`）不再可用来回参数序 |
| `$U_{m,1}$` | `$S^{(m)}$`，平凡 | `sections/path-band.tex:9--15` | 情形 (i) 的 `$\boxtimes\mathbf1$` | `$\mathsf{oneBand\_support}$`（`BandSupport.lean:326--330`）的条件 `$\mu.\mathsf{colLen}\ 0\le1$` 无从成立 |
| `$(-1)^{m-1}$` | 列对翻转数 `$m-1$` | `sections/path-band.tex:32--35` | `$u=(-1)^{m-1}u_{m,2}$`、`path:contraction-formula` | 与 Lean 侧 `$(-1)^{h+1}$`（`BandSupport.lean:51`）符号对不上 |
| `$D_q$` | `$q$` 奇取 `$X$`，偶取 `$\adj(X)$` | `sections/path-band.tex:181--188` | `path:segment-definition` | 奇偶互换后 `$e-\delta$` 的符号公式整体平移 |
| `$\adj(X)$` | `$\tr(X)I-X$`，`$JX^{\mathsf T}J=-\adj(X)$` | `sections/path-band.tex:145--148` | 线性性与 `$D_q(QXQ^{-1})=QD_q(X)Q^{-1}$`（`:280--284`） | 共轭与 `$D_q$` 不可交换，`path:nonzero-pairing` 的换基失效 |
| `$\{M_i\}$` | `$I,Z,T,J$`，`$4$` 元基 | `sections/path-band.tex:163--175` | 段交替与可逆性 | `$\dim\Mat_2(\C)=4$` 的上限破，`$r\le4$` 失去依据 |
| `$A_{r,p}$` | `$r!(-1)^{e-\delta}M_1\cdots M_r$` | `sections/path-band.tex:197--203` | `path:ordered-factorization` 的 `$B$` | `$r!$` 前的符号若与 `$\pi$` 相关，段矩阵可能奇异 |
| `$A_{r,p}$` 值表 | `$-2Z,2Z,-6J,-6J,-24I,24I$` | `sections/path-band.tex:204--212` | 可逆性逐条验证 | `$r=4$` 一行变号会牵动 `$\beta$` 的特征向量选取 |
| `$\len(\eta)$` | `$\le4$` | `sections/path-band.tex:245--248` | `prop:two-band` 的适用域 | 情形 (ii) 挑出的 `$\eta$` 无支集保证 |
| `$\beta$` | `$B$` 的非零特征值 | `sections/path-band.tex:285--294` | `$\langle u,t_N\rangle=(-1)^{m-1}\beta$` | `$B$` 不可逆时 `$\beta=0$`，配对归零 |
| `$12T$` | `$(-6J)(2Z)$`，`$11$` 元为零 | `sections/path-band.tex:311--321` | 反例：固定测试基不充分 | 省掉共轭步骤则 `$\eta=(2,2,1)$`、`$m=3$` 检不出来 |
| `$k$` | `$4\le k<m$` | `sections/completion.tex:41--53` | `comb:four-row-capacity` | `$k\le3$` 的排除用的是 `$k(m-1)\le km-\frac{k(k-1)}2$`，改动即失去 `$m\ge5$` |
| `$m$` 下限 | 情形 (ii) 需 `$m\ge5$` | `sections/completion.tex:20,53` | 归纳里的 `$m-2\ge3$` | `$W_{m-2}$` 索引非正在 `Main.lean:76--79` 的 `$\mathsf{by\ omega}$` 处报错 |
| `$q$` | `$\le4$`，条带数 | `sections/completion.tex:19--26` | `$A$` 的行数界与 `$\mathsf{bs.length}$` | `$\eta.\mathsf{colLen}\ 0\le\mathsf{bs.length}$`（`Main.lean:33`）无法闭合 |
| `$8^{11},3$` | `$m=13$`，大小 `$91$`，失败在 `$k=12$` | `sections/completion.tex:78--82` | `$q\le4$` 的最优性证据 | 三条带上限 `$3\cdot8=24<25$` 的论证失去实例 |
| `$8+8+8+1$` | `$25$`，余 `$\nu=(8^7,7,3)$` 大小 `$66=N_{11}$` | `sections/completion.tex:83--85` | 扫描算法的具体轨跡 | 部分扫描的右缀论证若不成立，余图不再是分拆 |
| `$\mathsf{Dominates}$` | `$\forall k,\ \mathsf{rowPrefix}\ \nu\ k\le\mathsf{rowPrefix}\ \mu\ k$` | `Saxl/HorizontalRemoval.lean:12` | `Main.lean:65` 的 `$\mathsf{by\_cases}$` 分派 | 参数顺序反了会让 `$\mathsf{dominated\_support}$` 类型错 |
| `$\mathsf{HorizontalStrip}$` | 同列至多一新格：`$x.2=y.2\to x=y$` | `Saxl/PieriRestriction.lean:11--12` | `$\mathsf{StripChain}$`、`$\mathsf{SizedStripChain}$` | 行数界"$q$ 次加法至多 `$q$` 行"失去依据 |
| `$\mathsf{bandSize}\ h\ 2$` | `$2(h+1)+1=2m-1$` | `Saxl/BandSupport.lean:11--13`、`PathContraction.lean:141` | `$\mathsf{stairBandWord}$`、`$\mathsf{twoBand\_support}$` | 与论文 `$K$` 的参数化不同源，改一处需同步 `rw` |
| `$\mathsf{colLen}\ 0\le4$` | 列高（即行数）上限 `$4$` | `Saxl/BandSupport.lean:45--47` | `$\mathsf{Path.fourRow\_support}$` | 放宽到 `$5$` 时 `$\mathsf{segment}$` 无定义值 |
| `$\mathsf{sameHighProjection}$` | `$\forall i,\ s\le\mathsf{splitLeft}\ w\ i\leftrightarrow s\le\mathsf{splitRight}\ w\ i$` | `Saxl/HighProjection.lean:114--121` | `$\mathsf{cyclic\_projection\_support}$`（`Main.lean:45`） | 判据写成合取会漏掉"同低"分支，商非零性失 |
| `$\mathsf{SaxlConjecture}$` | `$0<\mathsf{kronecker}$` 对两个阶梯表 | `Saxl/Model.lean:107--110` | `$\mathsf{saxl\_conjecture}$`（`Main.lean:88`） | `$\mathsf{kronecker\_pos\_iff}$` 一侧改变则 `$\mathsf{saxl\_of\_cyclic\_support}$` 断 |
| `$\mathsf{CyclicSaxlConjecture}$` | `$\exists f,\ f\ne0$` | `Saxl/CyclicTensor.lean:140--143` | `$\mathsf{cyclic\_saxl\_conjecture}$`（`Main.lean:82--84`） | 去掉非零条件则只给平凡映射，推不出正性 |
| 允许公理 | `$\mathsf{propext}$`、`$\mathsf{Quot.sound}$`、`$\mathsf{Classical.choice}$` | `ComparatorChallenges/Saxl.json:8--12` | comparator 审核 | 增列第四条公理会被台账判为超出标准库 |

## 16 我重做时会走的路与仍然没闭合的问题

把上面串起来，我现在的理解是：`prop:dominated` 处理被 `$\rho_m$` 支配的一族，`comb:strip-reduction` 的 (i) 把剩下的"首行够长"一族塞回 `$s=1$` 的平凡带，(ii) 把最后一族塞进 `$s=2$` 的四行检测，三条覆盖全部 `$\lambda\vdash N_m$`。支配序在这里的角色是"划分责任区"，它本身不提供证明。我最初设想的"一个配对打通所有 `$\lambda$`"变成"一个配对只打通四行族"，剩下的靠归纳。

仍未闭合、我打算继续追的几件事。`$2m-1$` 与 `$4$` 的耦合意味着任何推广都要换一个矩阵尺寸：若想把带宽提到 `$s=3$`，段长上限是 `$6$`，需要 `$\Mat_3(\C)$` 里一组 `$9$` 元基使每个交替段可逆，`$Z,T,J$` 那套两两反交换在 `$3$` 维没有对应物，我不确定存在性。`$U_{m,2}$` 我只用来覆盖"至多四行"，它是否已经含更多支集，机器与论文都没说；`[推测]` 若 `$U_{m,2}$` 的支集更大，`comb:strip-reduction` 的 `$q\le4$` 可能能压到 `$q\le3$`，但 `$m=13$` 的例子说明当前算法下三条带不够，要换删法，并非换 `$q$`。`[推测]` 半单性在 `specht-tools.tex:99--101` 与 `band-quotient.tex:203--204` 各用一次，若在有限域上工作这两次都要重做，机器侧 `$\mathbb C$` 是硬编码在 `$\mathsf{wordRep}$` 的参数里的。`[推测]` `Main.lean:47--54` 的 `staircase_one_dominates` 是 `$m=1$` 的补丁；`$m=2$` 走 `strip_reduction` 分支，`lean/StripReduction.lean:142` 的第二支要求 `$5\le m$`，所以 `$m=2,3,4$` 全靠第一支或 `$\mathsf{Dominates}$` 成立，这条边界我没有逐例验算，值得补一次 `$m\le4$` 的穷举核对。`$W_m$` 是否等于 `$V_R\otimes V_C$` 本身（即 `$\mathsf{staircaseToTensor}$` 是否满）论文没有断言，`saxl_contains_every_irreducible` 只用到单射方向；`[推测]` 若 `$W_m$` 真等于全张量积，`prop:dominated` 与 `prop:two-band` 可以合并成一个"生成元可检测"命题，但这需要 `$W_m$` 的维数公式，我没有。
