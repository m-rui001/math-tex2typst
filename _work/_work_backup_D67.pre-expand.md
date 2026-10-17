# D67 条件坐标扫描与解析迁移：我把"条件化"从障碍改写成账本

对象论文：`Conditional coordinate sweeps and analytic transfer`（2026-09-26，OpenAI）。
TeX 源码：`E:\math\preprints\Conditional-coordinate-sweeps-and-analytic-transfer-September-26-2026\build\`，`main.tex` 用 `\input` 引 7 个分片 `sections/01-introduction.tex` 到 `07-analytic.tex`，另有 `references.bib` 与 `figures/trajectory`。全文 1592 行、77125 字节。
Lean：`E:\math\lean\OAI\Probability\CoordinateSweeps\`（16 个文件），登记在 `E:\math\lean\formalization.yaml:332-335`（书目）与 `:1058-1060`（形式化条目 `OAI.CoordinateSweeps.conditional_main`，comparator 配置 `ComparatorChallenges/CoordinateSweeps.json`）。第 11 节给全部实测。
本笔记是单段式终稿：直接从 tex 与 Lean 读出写出，没有中间素材文件。

引文行号形如 `03:137`，指 `03-paths.tex` 第 137 行。编号条目全清单：Theorem 1.1（`thm:binary`）、Proposition 1.2（`prop:support`）、Theorem 3.1（`thm:conditional`，即全文主定理）、Lemma 4.1（`lem:sparse`）、Lemma 5.1（`lem:density`）、Lemma 6.1（`lem:overlap`），共 6 个；编号公式 25 条（`ac:eq:1` 到 `ac:eq:25`）。论文摘要（`main.tex:40`）逐字：

> For coordinate sweeps with near-uniform line laws and line sizes among powers of two in a suitable fixed interval, we prove a Schatten-moment bound after conditioning on any feasible collection of prescribed card trajectories. An analytic transfer to binary sweeps then shows that a fixed number of sweeps mixes the Thorp shuffle on $2^d$ cards in $O(d)$ physical steps, matching the order of the support lower bound.

## 0 我进场时手里有什么

牌堆模型在我进场前已经是老物件。Thorp 1973 的非随机洗牌（`01:19-26`）：牌堆对半分，对应位置配对，每对用一枚独立公平硬币决定次序再交错；在二进制位置串上一次物理 Thorp shuffle 是

```tex
 (x_1,x_2,\ldots,x_d)\longmapsto
 (x_2,\ldots,x_d,x_1+\xi_{x_2,\ldots,x_d}),
```

$\xi$ 独立公平、加法模 2。把确定性的坐标旋转吸收掉之后， successive 开关层依次作用在依次坐标方向上；转 $d$ 次回到恒等旋转，所以一次二元坐标扫描恰好等于 $d$ 个物理步（`01:28-31`）。混合时间按 `01:39-40` 定义：$\|q_d^{*t}-U_N\|_{\mathrm{TV}}\le 1/4$ 的最小 $t$。

我进场时手里的下界是平凡的随机比特计数（`01:68-79`，Proposition 1.2）：$t$ 步只用 $tN/2$ 个比特，支撑至多 $2^{tN/2}$，于是

```tex
 t_{\rm mix}(d)\ge
 \left\lceil\frac2N\log_2\!\left(\frac{3N!}{4}\right)\right\rceil
 =2d-O(1).
```

上界一侧的历史线在 `01:99-105`：Morris 2005/2008 给 $O(d^{44})$，Montenegro--Tetali 2006 收紧到 $O(d^{29})$，Morris 2009 对一切偶数牌堆给 $O((\log N)^4)$，Morris 2013 对 2 的幂牌堆给 $O(d^3)$。Czumaj--Vöcking 2014 的非马尔可夫耦合（`01:122-127`）对 $1-\varepsilon$ 比例的标记牌在 $O(d^2)$ 物理步内近均匀，等价于 $O(d)$ 次完整坐标扫描，但只谈端点边际。我的目标把话说满：固定次数 $w$ 的扫描（$wd$ 物理步）让 $2^d$ 张牌的整排列律在总变差下趋均匀，与 $2d-O(1)$ 的下界同阶。

进场时的猜想形态很朴素。我以为这是一篇"谱隙论文"：固定 $d$，算一次扫描的 Fourier 变换 $\widehat{B_N}(\lambda)=K_\lambda$，证明每个非平凡不可约表示上 $\|K_\lambda\|_{\mathrm{op}}\le 1-\delta$，$\delta$ 与 $\lambda$ 无关，然后 Diaconis--Shahshahani 的平方和标准动作收尾。这个想法的正确部分恰好是论文终点的形状（Theorem 1.1 的 $\|K_\lambda\|_{\mathrm{op}}\le D_\lambda^{-g}$），但我在纸上一碰就发现中间整段全是坑。坑在哪里，下面三节按我摔进去的顺序写。

本行只补登记：本笔讽事的论文目录为 preprints/Conditional-coordinate-sweeps-and-analytic-transfer-September-26-2026，在 .tools/lean_queue.txt 队列第 65 行号（目录名由本笔自己在 §0 写明，本行不改前文）。

## 1 我走错的三条路，和它们各自卡死的机械位置

**第一条死路：单牌边际加上逐点耦合。** `01:16-17` 一句话就把它判死：一次扫描后单张牌均匀，"but the joint permutation retains dependence because cards can use the same switches"。总变差是对整排列说的，边际均匀对 $K_\lambda$ 的任何信息都要经过把 $S_N$ 作用拆开这一步；单牌轨迹对应的是置换表示 $\mathrm{Ind}_{S_{N-1}}^{S_N}[\cdot]$ 层面上的东西，它只能触及 $\lambda_1\ge N-1$ 的类型。我要的是每个 $\lambda\vdash N$，包括 $D_\lambda$ 指数大的一般类型。这条路在机械上停住的位置：想从"每张牌近均匀"推 $\sum_{\lambda\ne(N)}D_\lambda^{2}\|K_\lambda\|^ {2w}$ 收敛，缺一条把边际信息转成逐表示算子范数的通道，而这条通道本身就和结论等强。后来我读到 `01:115-120`（Morris--Rogaway--Stegers 与 Hoang--Morris--Rogaway 确实做选定牌的边际），确认边际线是另一个问题（选定牌的端点律），和整排列混合之间隔着我要证的东西。

**第二条死路：先固定牌路径再直接估条件律。** 论文的核心动作是对一族预定轨迹 $\mathcal H$ 条件化。我最初的本能是"条件化是麻烦"：条件化之后线上的分布畸变，残差律的密度比 $L_m(z)(E_L(\mathcal H^+))/L_m(z)(E_L(\mathcal H))$ 可能巨大，证明里每暴露一张新牌就要付一次畸变代价，暴露 $h$ 张之后所有常数被指数吃掉。我按这个本能写的第一版估计是把条件律用 $U_m$ 替代再加误差项，误差项是 $\prod_L(m-h_L)_{v_L}^{-1}$ 型的乘积（对比 `03:106-119`），当 $h_L$ 接近线长 $m$ 时它发散。卡死的机械位置就在这个乘积：没有任何机制保证"暴露更多牌"的代价可以被已付掉的项吸收。论文的解法在我看来自始至终只有一条：把代价写成显势能差。`03:122-125` 给出

```tex
 p_{\mathcal H}(x,y)
 \le s^{-t}\exp\{C(\mathcal H^+)-C(\mathcal H)+(\log4)tb\}.
 \label{ac:eq:4}
```

而主定理不等式 `ac:eq:15` 的右端带 $-C(\mathcal H)$（`03:143-146`）。暴露新牌的代价 $C(\mathcal H^+)-C(\mathcal H)$ 正好和假设里的 $-C(\mathcal H)$ 对接；第 6 节循环求和后望远镜相消，回到原始 $-C(\mathcal H)$。`03:127-128` 的原文口径：The difference of potentials is the part of this estimate that permits further paths to be revealed during the induction。我的第二条路的错误在于把条件化当误差来源，论文把它当归纳谓词的参数。这不是修辞差异：主定理的量化是 every family $\mathcal H$（`03:139`），条件族全体同时成立才是归纳假设能用的原因，而"任意 $\mathcal H$"恰好是我一开始想避开的负担。

**第三条死路：在 $z=1$ 上直接打谱。** 我第三版方案放弃条件化，只处理二元扫描（即 `03:14` 的 $L_m(z)$ 取 $z=1$），对每个 $\lambda$ 直接算 $K_\lambda(1)$。这条路卡死的位置有实测依据。第一，`04:27` 起稀疏引理的证明分两支：$b>B_0=\lceil 8/\theta\rceil$ 只用线比较 `ac:eq:3`，而该比较在 $z\le z_{\rm cmp}(R)=\min\{1/2,1/(A_R+1)\}$（`03:27-29`）才成立；$z=1$ 时 $U_m$ 与 $B_m$ 的密度比 $m!B_m(g)$ 可以达到 $A_R$ 倍线长阶的失衡，比较直接失效。第二，$b\le B_0$ 支（`04:104-130`）我尝试照抄到 $z>0$：根森林计数要求共享事件的概率 $\omega$ 满足 $(k+h)\omega\le 1$，而多坐标支的 $\omega\le b\max_j m_j/s\le b\,s^{-1+2/b}$。当 $b$ 有界时 $\max_j m_j\ge s^{1/b}$ 可以占格子的可观比例，$h+k$ 一旦允许 $s^{1-\theta}$，$r=(k+h)\omega$ 就不趋于 0，`ac:eq:9` 的右边 $2^k r^{w/2}$ 失去指数小；计数在机械上停在 $w=k$ 时概率界不收敛。论文对此的回应写在 `04:132-140`：有界坐标支退到 $z=0$，用逆伽马矩恒等式做精确算账，再靠"固定 $R$ 后只有有限个网格"的连续性把 $z=0$ 的严格富余扩到一个公共小区间 $[0,z_{\rm sp}(R)]$（`04:376-387`）。也就是说 $z$ 必须小，而我要的恰恰是 $z=1$。我的第三条路的最后一根稻草在这里：小 $z$ 证明给出 $\|K_\lambda(z)\|\le D_\lambda^{-c(s)}$ 只在实小段成立；把它搬到 $z=1$ 靠的是第 8 节的解析迁移，我进场时完全没预料到一个概率论文要把次调和函数的对数位势障碍线搬进来。

## 2 关键转折：三个把负担改成资源的动作

第一条转折发生在读 `03:63-80` 之前。我原来的心智模型是"条件化污染测度"，转折点是把每条线上的组合学代价 $\phi_m(u)=\log m^u/(m)_u$ 认出来是"有放回 $m^u$ 对无放回 $(m)_u$"的失配（`03:64-66`），它有干净的界 $0\le\phi_m(u)\le u$（证明用 $m!\ge(m/e)^m$，`03:74-76`）。$C(\mathcal H)=\sum_L\phi_{|L|}(h_L)$ 于是是一个每暴露一张牌至多涨 $b$ 的势（`03:78-80`）。势能小、可加、并且以乘性方式进入概率比，这三个性质合起来把第二条死路翻活了。我的复盘：条件化的真正资源是"线独立性"。`03:49-55` 说条件事件是独立线上事件的交，条件化后各线残差律依旧独立，只是从 $L_m(z)$ 变成带预定指定位置的版本。坐标有序性（`03:38-43`）保证路径由端点唯一决定：阶段 $j$ 后槽位是 $(v_1,\ldots,v_j,u_{j+1},\ldots,u_b)$。这两条合起来意味着条件化只是逐线的局部手术，代价可以逐线计价。

第二条转折在 `06:5-14` 的参数顺序。定理 3.1 宣称"存在 $R$、存在 $q$、存在 $z_*>0$"，但证明里选择顺序是硬约束：先在稀疏引理里取 $\theta=a/16$、$K_0=10/e_0$，得到 $\rho$，再取整数 $q\ge\max\{1,\lceil 2/\rho\rceil\}$ 使 $2q\rho\ge 4$，最后才取充分大的 2 的幂 $R$。我一开始把这个顺序当成排版细节，重读到 `06:60-68` 才意识到 $q$ 的作用：稀疏支给出的算子范数 $s^{-\rho k}$ 升级为矩 $T_\lambda\le D_\lambda\cdot s^{-2q\rho k}$，要把 $-3F(\lambda)$ 打出来需要 $2q\rho\ge 4$ 配合 $F(\lambda)\le k\log s$ 与 $F(\lambda)\ge c_{\rm dim}k$（`02:93-99`）。$q$ 同时被第 7 节的循环迹展开消费：$2q$ 条边交替首尾相接，Hölder 才能把每条边的矩按 $1/(2q)$ 次幂摊平（`06:336-388`）。一个参数两处用，且都必须是大数，这就解释了 Lean 里 $q=65536000000$ 这种荒谬显值（`SparseBound.lean:39`，第 11 节）。

第三条转折是接受"证明主定理时先证明一个更强的、带钩型一致估计的引理"。`06:77-102` 的钩估计声明 (21) 对当前网格上一切可行族 $\mathcal H'$ 与一切 $(p,p)$ 钩型 $\gamma$ 成立，系数还比目标强（$\widehat c>c(s)$、$\widehat e<e(s)$），误差 $+s^{9/10}$。我第一次读到这里觉得绕远：为什么不在最后一步只处理 $\mathcal H=\varnothing$？答案在 `06:308-334`：把钩外方格 $\delta$ 加回来时，branching 把 $[\gamma]$ 在 $S_{M-k}$ 上的诱导实现成"每个 $k$ 元放置一份 $[\gamma]$ 纤维"，每个非零块上的条件算子面对的是增广族 $\mathcal H'$，其 $\gamma$ 维度可以任意小；没有对一切 $\mathcal H'$ 与任意小维度 $\gamma$ 的一致声明，归纳就断在纤维上。钩估计的"更强系数"则是给归纳留利息：两次短扫描的子问题网格更小，$c,e$ 依赖 $\log s$，分裂点必须保证 $c(s_1),c(s_2)$ 严格优于 $c(s)$，`06:289-295` 用 $\log s_u\in[\tfrac15\log s,\tfrac45\log s]$ 算出储备 $(\sqrt5/2-1)/\sqrt{\log s}>1/(10\sqrt{\log s})$，钩声明只花掉 $1/(20\sqrt{\log s})$。

这三个动作合起来就是我最终思路的骨架，而它和进场时的"谱隙论文"设想之间隔着：条件族全体上的同时命题、势能量化 $2q$ 矩、以及一根解析迁移的桥。桥的部分我在第 8 节逐字拆。

## 3 逐字读 02-preliminaries：表示事实与归一化

`02:4-12` 定乘法与卷积约定：置换将输入位置送到输出，$gh$ 先作用 $h$；于是卷积是复合律，$\widehat{\mu*\nu}(\lambda)=\widehat\mu(\lambda)\widehat\nu(\lambda)$。这个顺序约定在 `07:46` 被消费：$\mu_w=B_N^{*w}$ 的 Fourier 变换是 $K_\lambda(1)^w$，幂的顺序和扫描施加顺序一致。`02:13-14` 定范数：$\|A\|_p^p=\operatorname{Tr}|A|^p$，迹是普通未归一化矩阵迹。这一手归一化选择贯穿全文：$T_\lambda^{\mathcal H}=\|K_\lambda^{\mathcal H}\|_{2q}^{2q}$ 不带 $1/D_\lambda$，所以稀疏支升级矩时显式付出 $D_\lambda$ 一个因子（`04` 末与 `06:60-68`），`07:51` 的 Plancherel 和式里 $D_\lambda\cdot\|\cdot\|_2^2$ 的幂次 $2-2gw$ 也是这套约定的产物。

`02:16-22` 一段话解决"条件化之后槽集变了"的身份问题：群作用在槽位上；两个同基数槽集之间的随机双射，在把每个槽集与固定参考集认同后成为随机置换；换认同等于在两侧各乘一个酉阵，在幺正表示里的平均的奇异值不变。机械理由：预定轨迹在不同层挖掉不同的洞，残差线上"未占用输入槽"集合与"未占用输出槽"集合天然不同构于同一个参考集；没有这段约定，$K_\lambda^{\mathcal H}$ 根本不是一个方阵。

`02:24-29`：$[\lambda]$ 是 $S_l$ 的不可约，$D_\lambda$ 维数，$F(\lambda)=\log D_\lambda$；空图维数 1；全文对数取自然对数。`02:31-55` 三条经典事实的清单，我逐条核对我后文要用到的形态：其一，hook 长公式给 $D_\lambda$、共轭图 $\lambda'$ 对应符号扭转、限制到 $S_{l-j}$ 的重数是斜形状 $\lambda/\sigma$ 的标准表个数；其中"可区分 $j$ 张牌放入 $l$ 个槽的放置表示含 $[\lambda]$ 当且仅当 $\lambda_1\ge l-j$"（`02:40-42`）是两处关键入口：稀疏引理的交替核对子 $Q$ 杀真子集项（`04:41-48`）和有界坐标列型（`04:325-331`）都靠它。其二，Pieri：平凡表示诱导加水平带，符号诱导加垂直带。其三，Schur--Weyl：$(\mathbb C^p)^{\otimes t}$ 的 $S_t$ 型恰为行数 $\le p$ 的 $\sigma\vdash t$，重数空间是线性群的最高权 $\sigma$ 多项式不可约（`02:48-52`），第 6 节把它引到 `05` 的带符号版本。

维数账是这节的实质产出。`02:58-66`：大 $l$，$k=\min(l-\lambda_1,l-\lambda'_1)$，若 $0<k\le l/3$，

```tex
 D_\lambda\ge e^{-1}\binom{l}{k}.
 \label{ac:eq:1}
```

`02:67-77` 的推导我逐步补完：转置不妨设首行长 $l-k$，其下方 $k$ 个方格成图 $\mu$。对首行逐格展开 hook 公式得

$$D_\lambda=\binom lk D_\mu\prod_{j=1}^{l-k}\Bigl(1+\frac{\mu'_j}{l-k-j+1}\Bigr)^{-1}.$$

列 $\mu'_j$ 只在 $j\le k$ 可能非零；分母乘积取对数后用 $\log(1+x)\le x$，得指数下界 $\exp(-\sum_{j\le k}\mu'_j/(l-2k))$，其中 $j$ 号槽的最坏分母 $l-k-j+1\ge l-2k+1>l-2k$，而 $\sum_j\mu'_j=k$。条件 $k\le l/3$ 给出 $l-2k\ge l\ge 3k$，故 $k/(l-2k)\le 1$，乘积 $\ge e^{-1}$。每一步我检查过方向：$\binom lk$ 从"选哪 $k$ 列放 $\mu$ 的方格"来（首行 $l-k$ 格中，$\mu$ 的列锚定其中 $k$ 个位置），$D_\mu\ge1$ 被丢弃，所以 $e^{-1}$ 是乘积项的价，组合数是主项。`02:79-91` 处理 $k>l/3$：若首行首列都 $<l/8$，每个 hook 短于 $l/4$，hook 公式配 Stirling 给 $F(\lambda)\ge c_{\rm dim}l$；否则转置设首行长 $v\in[l/8,2l/3]$，保留首行加其下 $\lfloor v/4\rfloor$ 格的子图，前一段大行界的论证使保留形状维数关于 $v$ 指数、从而关于 $l$ 指数，branching 说 $D_\lambda$ 不小于保留形状在限制下的某个不可约的重数乘维数，论文取"至少该维数"这一单侧。`02:93-99` 合并：$c_{\rm dim}k\le F(\lambda)\le k\log l$，上界来自放置判据：$[\lambda]$ 或（必要时）其符号扭转落在 $k$ 元放置表示里，后者维数 $(l)_k\le l^k$，$D_\lambda$ 至多整表示维数。这里我注意到一个不对称：$c_{\rm dim}$ 的第二次缩减（"Reducing $c_{\rm dim}$ if necessary"）同时服务 $k\le l/3$ 支（$e^{-1}\binom lk\ge e^{-1}(l/k)^k$ 取对数 $\ge ck$）与 $k>l/3$ 支（$\ge cl\ge ck\cdot(3k/l)\cdot(l/k)$……实际是 $\ge c_{\rm dim}l$ 与 $k\le l$ 合并），一个常数买两支。

这节的分界线 $k\sim s^{1-a}$ 或 $F<s^{1-a/4}$ 属于后文，但 `02:100-102` 提前挂了两条用途：这些界"used to enter the sparse range"，且 `ac:eq:1` "also controls the sum over representations in the final mixing argument"（即 `07:58-68`）。我把这两个钩子记下，第 8 节按行兑现。

候选失败路线 [推测]：其一，想跳过 $k\le l/3$ 与 $k>l/3$ 的分类、只用一个全局不等式 $D_\lambda\ge f(l,k)$。这在 `07:62-66` 的两段求和会露馅：第一段对 $k$ 求和需要 $(N/k)^{-\beta k}$ 的幂形式，第二段需要 $\ge c_{\rm dim}N$ 的线性指数，两者消费的是不同支的形态。其二，把 $F(\lambda)\le k\log l$ 换成更锐的 $\log\binom lk+\ldots$：上界方向换不动，因为放置表示只给 $(l)_k$ 级别的整表示维数，锐化需要重数信息而放置表示本身不带。其三，用 Vershik--Okounkov 虚拟特征标机器替代经典 branching：`02:38-39` 只把 V--O 当 branching 规则的出处引用，全文没有再用其测度结构，若我改走那条路，`04` 的"真子集项被类型判据杀掉"就得换成 Gelfand--Tsetlin 模式语言，收益不明。

## 4 逐字读 03-paths：轨迹、线代价与主定理 Theorem 3.1

**网格与线律。** `03:4-11`：固定 2 的幂 $R\ge2$ 待取充分大；有序乘积网格 $\Omega=\Omega_1\times\cdots\times\Omega_b$，$m_j=|\Omega_j|$ 是落在 $[R,R^2]$ 内的 2 的幂，$s=\prod_jm_j$；$\Omega_j$ 认同 $\{0,1\}^{\log_2m_j}$。扫描先作用坐标 1 的所有平行线，再坐标 2，逐线独立；`03:10` 一句"A line always belongs to its particular stage"把线和阶段钉成一一对应，后面 $\phi_{|L|}(h_L)$ 的按线计价全靠它。`03:12-16` 线律：

```tex
 L_m(z)=(1-z)U_m+zB_m,
 \label{ac:eq:2}
```

$B_m$ 是线上 $\log_2m$ 个比特的二元扫描。`03:18-21` 登记两个事实：两律的单槽边际都均匀；期望符号都是零，$B_m$ 那条的理由是翻转任一独立公平开关就反号。第二条在第 5 节列型支（`04:341-346`）消费。

**可比区间。** `03:24-36`：

```tex
 A_R=\max_m\max_{g\in S_m}m!B_m(g),\qquad
 z_{\rm cmp}(R)=\min\{1/2,1/(A_R+1)\},
```

$A_R+1$ 不是随手写的：$m!\,\mathbb E_{g}B_m$ 的平均值是 1，所以 $A_R\ge1$，$z\le1/(A_R+1)$ 给出密度上界 $(1-z)+zA_R\le 2-2/(A_R+1)<2$，即 $L_m(z)\le2U_m$；$z\le1/2$ 给出 $L_m(z)\ge(1-z)U_m\ge\tfrac12U_m$。`ac:eq:3` 的双边比较就是这么两半拼的。$z_{\rm cmp}(R)>0$ 的存在理由写在 `03:30-31`：允许线尺寸只有有限个。这个"有限"同时是后面两处连续性论证的地基（`04:376-385` 与 `06:39-42` 的基础情形）。

**轨迹与洞。** `03:38-43`：坐标有序性使路径由端点唯一确定，阶段 $j$ 后槽位 $(v_1,\ldots,v_j,u_{j+1},\ldots,u_b)$。预定族 $\mathcal H$ 是 $h$ 条这样的路径，要求每层（含输入输出两端）槽位互异，`03:46` 称被占槽为 holes。`03:47-55`：线 $L$ 上 $h_L$ 计数预定路径，$E_L(\mathcal H)$ 是该线置换实现预定指定的事件；层互异使指定是单射，`ac:eq:3` 使 $E_L(\mathcal H)$ 概率为正；条件事件是独立线上事件的交，所以条件后各线残差律独立、且是 $L_m(z)$ 在预定指定下的条件化，作用在未占用输入槽到未占用输出槽的随机双射之间。$M=s-h$，`03:57-61` 定义 $K_\lambda^{\mathcal H}$（$\lambda\vdash M$）。

**线代价。** `03:63-80` 全文最实惠的一个定义：

```tex
 \phi_m(u)=\log\frac{m^u}{(m)_u},\qquad
 (m)_u=m(m-1)\cdots(m-u+1),\qquad (m)_0=1,
```

以及 $C(\mathcal H)=\sum_{\text{stage lines }L}\phi_{|L|}(h_L)$。逐字核对 `03:72-76` 的界：$\phi_m(u)=\sum_{r=0}^{u-1}\log\frac{m}{m-r}$ 的加项非负且递增，前 $u$ 项均值不超过全长 $m$ 项均值，后者 $\le1$ 因为 $m!\ge(m/e)^m$（即 $\frac1m\sum_{r=0}^{m-1}\log\frac{m}{m-r}=\log\frac{m^m}{m!}\le1$）。得 $0\le\phi_m(u)\le u$；再对各层求和，每层 $\sum_Lh_L=h$，得 $0\le C(\mathcal H)\le bh$。这个 $bh$ 在 `04:55`（粗界 $C(\mathcal H_A)\le b(h+|A|)$）和 `06:22`（$e(s)h\log s-C(\mathcal H)\ge(e_0/4)h\log s$）两处被消费。

**转移概率的势能账。** `03:82-125`：$t$ 张可区分牌的放置是到可用槽的单射；$p_{\mathcal H}(x,y)>0$ 时端点对确定增广族 $\mathcal H^+$（大小 $h+t$），$v_L$ 是增广路径在线 $L$ 上的条数。线上条件概率比

```tex
 \frac{L_m(z)(E_L(\mathcal H^+))}
      {L_m(z)(E_L(\mathcal H))}
 \le \frac4{(m-h_L)_v}.
```

`03:113-115` 给机械理由：均匀情形比值恰为 $(m-h_L)_v^{-1}$（无放回放 $v$ 个指定对），`ac:eq:3` 把分子分母各改 $[1/2,2]$ 倍，$2/({1}/{2})=4$ 出在系数上。恒等式 `03:117-119`：

$$\frac1{(m-h_L)_v}=m^{-v}\exp\{\phi_m(h_L+v)-\phi_m(h_L)\},$$

我展开验证：$\phi_m(h+v)-\phi_m(h)=\log\frac{m^{h+v}}{(m)_{h+v}}-\log\frac{m^h}{(m)_h}=\log\frac{m^v(m)_h}{(m)_{h+v}}=\log\frac{m^v}{(m-h)_v}$。未用线贡献 1；$t$ 条路径每端点每层至多动 $tb$ 条线；每条增广路径自带 $\prod_jm_j^{-1}=s^{-1}$。相乘得 `ac:eq:4`（引文见第 1 节）。`03:127-128` 点题。

**主定理。** (a) 逐字（`03:136-157`，`samepage` 环境内）：

```tex
\begin{theorem}[Conditional sweep moment estimate]
There\label{thm:conditional}\label{ac:main} are a power of two \(R\ge2\), a positive integer \(q\), and \(z_*>0\) such
that every grid and every family \(\mathcal H\) of prescribed disjoint
trajectories defined above satisfy, for every \(z\in[0,z_*]\) and every
\(\lambda\vdash s-h\),
\begin{equation}
 \log T_\lambda^{\mathcal H}\ \le\
 -c(s)F(\lambda)+e(s)h\log s-C(\mathcal H).
 \label{ac:eq:15}
\end{equation}
Here a zero moment gives \(-\infty\). Use parameters
\[
 a=\frac1{100},\quad c_0=e_0=\frac a{100},\qquad
 c(s)=c_0+\frac1{\sqrt{\log s}},\qquad
 e(s)=e_0-\frac1{\sqrt{\log s}}.
\]
The empty diagram has dimension one. If \(h=s\), the remaining bijection is
the unique empty bijection and its moment is one. The assertion also includes
the one-dimensional trivial representation for every \(h\).
\end{theorem}
```

(b) 推导分工：`03:159-165` 指出 $\mathcal H=\varnothing$ 时 `ac:eq:15` 退化为 $T_\lambda^\varnothing\le D_\lambda^{-c(s)}$，被 `07` 解析迁移消费；一般 $\mathcal H$ 的 $-C(\mathcal H)$ 项专为 `ac:eq:4` 的势能差准备，被 `06` 的消费。完整证明是第 5 到 7 节：先 Lemma 4.1 打稀疏层，`05` 造正密度，`06` 按 $b$ 归纳合成。(c) 每个数值的机械理由：$a=1/100$ 是全文指数刻度（$p=\lfloor s^a\rfloor$、$s^{1-a/4}$、$s^{1-a/2}$、$a/16$、$a/50$ 全靠它互相错开）；$c_0=e_0=a/100=10^{-4}$ 同值是为了让 `06:414` 的 $\widehat c+\widehat e=c_0+e_0=a/50$ 恰好用 $2c_0$ 付费并仍小于 $F(\delta)$ 支的 $a/2$（`06:423-427`）；$c(s)$ 随 $s$ 增大而减小、$e(s)$ 随 $s$ 增大而增大（同一项 $1/\sqrt{\log s}$ 反向挪），配合 `06:107` 的均衡分裂，使"子网格 $s_u<s$"方向的归纳假设严格强于当前所需，储备算在 `06:289-295`。$R$ 的"充分大"有可核验的最低要求（`06:18-21`）：$1/\sqrt{\log R}\le e_0/2$ 且 $1/\log R\le e_0/4$，即 $\log R\ge\max\{4/e_0^2,\,4/e_0\}=4\times10^8$；这就是为什么全文所有"增大 $R$ 吸收误差"都成立：任何固定指数的 $s^\varepsilon$ 型错误在 $\log R\ge4\cdot10^8$ 面前都是 $o_R(1)$。零点约定与 $h=s$、平凡表示三个补充条款各堵一个量化漏洞：$K_\lambda^{\mathcal H}$ 可以是零矩阵（列型支里整个算子就恒为零），$\log0=-\infty$ 让 `ac:eq:15` 免证；$h=s$ 时 $M=0$，$\lambda$ 是空图，$T=1$，右边 $=e(s)s\log s-C(\mathcal H)\ge 0$ 由 $C\le bs\le s\log R^{-1}\cdot\log s$……实际论文没展开这段，`06:31-35` 用 $F(\lambda)=0$ 的统一论证覆盖空图与 1 维类型：条件平均是压缩，矩 $\le1$，而正 allowance $e(s)h\log s-C(\mathcal H)\ge0$ 由 `06:22-26` 的 $C\le bh\le h\log s/\log R\cdot b$ 型比较给出。

(d) 候选失败路线 [推测]：其一，把 $-C(\mathcal H)$ 换成常数 $\times h$：`06:356-367` 的望远镜相消依赖势能的精确可加对偶，$\prod_j(p_je^{-C(\mathcal H'_j)/(2q)})$ 里 $e^{-C(\mathcal H'_j)/(2q)}$ 与 `ac:eq:4` 的 $e^{C(\mathcal H^+)-C(\mathcal H)}$ 是同一函数的两种切片，常数界给不出相消。其二，允许 $[R,R^{2+\varepsilon}]$：$z_{\rm cmp}$ 的正性与线尺寸有限性都不受损，但 `04:106` 的 $\max_jm_j\le s^{2/b}$ 变成 $s^{(2+\varepsilon)/b}$，$B_0=\lceil8/\theta\rceil$ 要随 $\varepsilon$ 重调，而 `06:107-109` 的分裂区间 $[\tfrac15\log s,\tfrac45\log s]$ 依赖每坐标贡献 $[\log R,2\log R]$ 的 2 倍失衡上限；失衡放大侵蚀 `06:293` 的 $\sqrt5/2-1$ 储备，最坏时 $1/(20\sqrt L)$ 付不出去。三，把 $c_0\ne e_0$ 取成任意：`06:11` 的 $K_0=10/e_0$、`06:8` 的 $\theta=a/16$、`04:370` 的 $\rho=\min\{\theta/32,\beta/4\}$、`06:12` 的 $q\ge\lceil2/\rho\rceil$ 构成一条单向依赖链，$e_0$ 挪大会缩小 $K_0$ 从而放松稀疏假设 $h\le K_0k$ 反而更难（覆盖的 $\lambda$ 少），挪小则 $q$ 爆大、`07:6` 的 $a_0=c_0/(2q)$ 变差，迁移后的 $g$ 变小。论文取 $c_0=e_0$ 是让 `06:414` 的合并系数恰好等于 $a/50$ 的最省事点。

## 5 逐字读 04-sparse：Lemma 4.1 与交替核

(a) 逐字（`04:9-25`）：

```tex
\begin{lemma}[Conditional sparse contraction]\label{lem:sparse}
For every \(0<\theta<1\) and \(K_0\ge1\), there are \(\rho>0\) and \(R_0\)
such that, for each power of two \(R\ge R_0\), one can choose
\(z_{\rm sp}(R)>0\) with the following property. For every allowed grid and
prescribed family \(\mathcal H\), suppose that the integer \(k\ge1\) satisfies
\begin{equation}
 h\le K_0 k,\qquad h+k\le s^{1-\theta},
 \label{ac:eq:5}
\end{equation}
and let \(\lambda\vdash M=s-h\) satisfy
\(\lambda_1=M-k\) or \(\lambda'_1=M-k\). Then, for every
\(z\in[0,z_{\rm sp}(R)]\),
\begin{equation}
 \|K_\lambda^{\mathcal H}\|_{\rm op}\le s^{-\rho k}.
 \label{ac:eq:6}
\end{equation}
\end{lemma}
```

(b) 证明按坐标数分支：$B_0=\lceil8/\theta\rceil$（`04:27`）。支一 $b>B_0$ 只用 `ac:eq:3`；支二 $b\le B_0$ 先在 $z=0$ 证明再连续性外推。行型 $\lambda_1=M-k$ 的机器是交替核 `04:37-40`：

```tex
 Q(x,y)=s^{-k}\sum_{A\subseteq[k]}(-1)^{k-|A|}s^{|A|}p_A(x_A,y_A).
 \label{ac:eq:7}
```

$A=[k]$ 项是完整放置转移核；真子集 $A$ 的算子值域落在"$|A|$ 元放置上函数的拉回"这一子表示里，放置判据（`02:40-42`）说它只含首行 $\ge M-|A|>M-k$ 的类型，投到 $\lambda$ 型全灭；$A=[k]$ 的存活块恰是一份 $K_\lambda^{\mathcal H}$，于是 $\|K_\lambda^{\mathcal H}\|_{\mathrm{op}}\le\|Q\|_{\rm HS}$（`04:41-49`）。$s$ 的缩放因子的用途写在 `04:50-51`：恰好吃掉"某条路径的阶段线不被任何其他约束触碰时其概率为 $1/s$"这一档。逐项粗界 `04:53-60`：由 `ac:eq:4` 与 $C(\mathcal H_A)\le b(h+|A|)$，$|s^{|A|}p_A|\le\exp\{b(h+|A|)+(\log4)b|A|\}$，对 $2^k$ 个子集求和得 `ac:eq:8`：$|s^kQ(x,y)|\le2^k\exp\{bh+(1+\log4)bk\}$。

计数机器（`04:62-102`）：把 $Q$ 在端点数组非单射时零延拓，然后全格 $\Omega^k$ 有放回独立采样端点，得精确恒等式 $\|Q\|_{\rm HS}^2=\mathbb E_{\rm full}|s^kQ(x,y)|^2$。共享定义两种：某层共槽、某阶段共线。设单个粒子与任一固定轨迹共享的概率 $\le\omega$。造粒子--洞图，共享为边。组合论证逐句核对：一个含洞的连通分支里，每个粒子指向朝最近洞距离减 1 的邻居，距离严格下降故成向洞汇聚的森林，粒子全为尾；纯粒子分支 $v\ge2$ 个顶点取生成树给 $v-1\ge v/2$ 条粒子尾。两种合起来：至少 $w$ 个粒子入边则图含 $\ge\lceil w/2\rceil$ 条边的有向森林。固定 $j$ 条边的森林概率：自叶删起，每条边给 $\le\omega$；尾与父的选择数 $\binom{k}{j}(k+h)^j$；$r=(k+h)\omega\le1$ 时 `ac:eq:9`：至少 $w$ 粒子入边的概率 $\le\sum_{j\ge\lceil w/2\rceil}^k\binom kj r^j\le2^kr^{w/2}$。

支一取"共线"为共享：粒子在阶段 $j$ 用定线的概率 $m_j/s$，$\omega\le b\max_jm_j/s$；每坐标 $m_j\ge R$ 给 $b\le\log s/\log R$，每坐标 $m_j\le R^2$ 给 $\max_jm_j\le s^{2/b}$（$R^{2b}\le s^{2/b\cdot b}$ 方向：$\max m_j\le R^2$ 且 $s\ge R^b$，故 $R^2\le s^{2/b}$）。于是 $(k+h)\omega\le b\,s^{-\theta+2/b}$：`04:110-112` 要求 $2/b<\theta/4$（由 $b>B_0\ge8/\theta$）且 $b\le s^{\theta/4}$（增大 $R$ 后由 $s\ge R^b$ 一致成立），合起来 $r\le s^{-\theta/2}$。取消机制（`04:114-119`）：某粒子 $i$ 与所有其他约束阶段线无交集时，$p_{A\cup\{i\}}=p_A/s$ 对一切 $A\ni(\not\ni)i$ 成立（线独立、单槽边际均匀；子集概率为零时同样成立），`ac:eq:7` 的配对项两两抵消。故 $Q\ne0$ 蕴含全部 $k$ 个粒子入边；取 $w=k$ 的 `ac:eq:9` 与 `ac:eq:8`：$\Pr_{\rm full}(Q\ne0)\le2^ks^{-\theta k/4}$，$\|Q\|_{\rm HS}\le2^{3k/2}e^{bh+(1+\log4)bk}s^{-\theta k/8}\le s^{-\theta k/16}$（用 $h\le K_0k$、$b/\log s\le1/\log R$，指数前的所有 $e^{O(k/\log R\cdot\log s)}$ 在 $R$ 大时是 $s^{o(k\log s)}$，从 $\theta/8$ 里挖出 $\theta/16$）。

支二（`04:132-321`）在 $z=0$：$\xi=1/(10B_0)$，$\eta=s^{-\xi}$，增大 $R$ 使 $\eta\le1/2$。线 $L$ 称 light 若 $h_L+t_L\le|L|\eta$（$t_L$：端点数组的 $k$ 条辅助路径用 $L$ 的条数，不管联合可行性）；粒子 good 若其全线 light 且不与任何路径或洞共层槽。目标 `ac:eq:10`：$|s^kQ|\le\exp(O(b(k+h)))\eta^{|G|/2}$。$z=0$ 时线上条件律精确可算：对可行子集 $A$，$s^{|A|}p_A=\prod_Lm^{v_L(A)}/(m-h_L)_{v_L(A)}$。good 路径不共槽意味着 $J\cup S$ 可行当且仅当 $J$ 可行（$S\subseteq G$ 任意），于是可按 $J$ 分组、先弃不可行 $J$：$D_J=\prod_{L\text{ non-light}}m^{r_L(J)}/(m-h_L)_{r_L(J)}$，$\log D_J\le b(h+|J|)$。轻线上放逆伽马变量 $W_L=m/Z_L$，$Z_L\sim\operatorname{Gamma}(m-h_L+1,1)$，矩恒等式 $\mathbb EZ^{-v}=\Gamma(\alpha-v)/\Gamma(\alpha)$（对伽马密度直接积分）给出 $\mathbb EW_L^v=m^v/(m-h_L)_v$，lightness 保证 $v<\alpha$。对 good 路径集合做交替求和得精确表达式（`04:196-205`）：$s^kQ=\sum_{J\text{ valid}}(-1)^{k-|J|-|G|}D_J\,\mathbb E[\prod_{\text{light}}W_L^{r_L(J)}\prod_{i\in G}(\prod_jW_{L_j(i)}-1)]$。逐线成组取矩：`ac:eq:11` 的密度倾斜上界 $\mathbb E W^v|W-1|^u=\frac{m^{u+v}}{(m-h)_{u+v}}\mathbb E|1-Z'/m|^u\le C_1^{u+v}\eta^{u/2}$。它的机械链条我全跑了：lightness 给形状 $n=m-h+1-u-v\ge m(1-\eta)+1$ 与比值 $\le(1-\eta)^{-(u+v)}\le2^{u+v}$；中心矩母函数 $e^{-nt}(1-t)^{-n}$ 在 $|t|\le1/2$ 时对数 $\le Cnt^2$，Chernoff 得 $\Pr(|Z'-n|>x)\le2e^{-c\min\{x^2/n,x\}}$，积分尾部得 $(\mathbb E|Z'-n|^u)^{1/u}\le C(\sqrt{nu}+u)$；$u\le m\eta$ 给 $|1-n/m|\le\eta+1/m\le2\eta$；三角不等式收。good 路径逐阶段望远镜 $\prod_jW_{L_j(i)}-1=\sum_a(W_{L_a(i)}-1)\prod_{j<a}W_{L_j(i)}$，展开项按线记 $u_L,v_L$，$\sum u_L=|G|$、$u_L+v_L\le t_L$，跨线独立取矩得每项 $\le C_1^{bk}\eta^{|G|/2}$，乘 $b^{|G|}\cdot2^{k-|G|}\cdot e^{b(h+k)}$ 归并入 `ac:eq:10`。

good 粒子的计数（`04:256-312`）：$|G|<k/2$ 蕴含两事件之一：$\ge k/4$ 个粒子共层槽（用 `ac:eq:9`，$\omega=(b+1)/s$），或 $\ge k/4$ 个粒子踩非光线；后者某阶段吃到 $a_k=k/(8B_0)$ 个，分"洞多线"（$h_L>m_j\eta/2$，占槽比例 $\le2h/(s\eta)$，界 $2^k(2h/(s\eta))^{a_k}$）与"路径多线"（$t_L>m_j\eta/2$ 的线数 $r_j\le\lfloor2k/(m_j\eta)\rfloor$；先定线集，占用界 $2^k(2k/(s\eta))^{a_k}$，再乘集数 $(s+1)^{r_j}$）。$b\le B_0$ 与 $R\le m_j\le R^2$ 给 $m_j\eta\ge s^{2/(5B_0)}$，$r_j\log(s+1)/(k\log s)=o_R(1)$；省下的指数 $(\theta/16)k\log s$ 与 $(\theta/(16B_0))k\log s$ 对付三项 $2^k$、阶段和、集数有余，得 `ac:eq:12`：$\Pr_{\rm full}(|G|<k/2)\le s^{-\nu k}$，$\nu=\theta/(100B_0)$。合成：$|G|\ge k/2$ 上逐项省 $\eta^{|G|/2}\le s^{-\xi k/4}$；补集上 `ac:eq:8` 乘 `ac:eq:12` 的平方根，$\|Q\|_{\rm HS}\le e^{O(b(k+h))}(s^{-\xi k/4}+s^{-\nu k/2})$。列型 $\lambda_1'=M-k$ 走符号扭转放置表示，`04:329-339` 把剩余双射的符号拆成"确定因子 $\times$ 各线残差符号之积"（线上先按同序列指定对再列未指派点，删指定后残差双射好定义；换槽序只动一个确定符号）；残差线独立，一行期望符号为零则整项为零。$b>B_0$：$s/\max m_j\ge s^{1-\theta}\ge h+k$，每阶段存在全空线，其残差律 $L_m(z)$ 期望符号零；$b\le B_0$、$z=0$：$s-h-k>s/m_j$，某线至少两个未指派点，均匀条件残差律的符号均值零。收尾常数顺序 `04:358-387`：$\beta=\min\{\xi/4,\nu/2\}$，$\rho=\min\{\theta/32,\beta/4\}$ 先于 $R$，$R_0$ 后定；固定 $R\ge R_0$ 后 $b\le B_0$ 支只有有限多网格（$s\le R^{2B_0}$）、有限多可行族与表示，条件算子是线概率的有限表达式、分母在 $z=0$ 为正故连续，严格富余给 $\delta(R)$，$z_{\rm sp}(R)=\min\{\delta(R),z_{\rm cmp}(R)\}$。

(c) 数值理由：$B_0=8/\theta$ 同时保 $2/b<\theta/4$ 与 $b\le s^{\theta/4}$；$8$ 里藏了三层减半（$r\le s^{-\theta/2}$、$w=k$ 森林 $r^{k/2}\to s^{-\theta k/4}$、HS 开方再半 $\to\theta/8$，末步让 $\theta/16$）。$\xi=1/(10B_0)$ 要 $10B_0$：`04:261-263` 用 $\xi\le\theta/80$ 压 $2h/(s\eta)\le2s^{-(\theta-\xi)}\le s^{-\theta/2}$，而每阶段要均分 $B_0$ 份所以 $10B_0$ 与 $80$ 挂钩（$B_0\ge8$）。$\nu=\theta/(100B_0)$：从三项 $o_R$ 侵蚀后的 $\theta/(16B_0)$ 级储备里再折一个 $\times16/100$。$\rho=\min\{\theta/32,\beta/4\}$：$\theta/32$ 是支一的 $\theta/16$ 再开方级让渡，$\beta/4$ 同理对 $\max\{\xi/4,\nu/2\}$ 留四倍余量给 $e^{Cb(1+K_0)k}\le s^{\beta k/2}$。

(d) 失败路线 [推测]：其一，支二想在 $z>0$ 直接做：$z>0$ 时线上条件残差律非均匀，$\mathbb E W^v=m^v/(m-h)_v$ 的精确矩恒等式换成 $z$ 的多项式修正，`ac:eq:11` 的 $\eta^{u/2}$ 系数要重证且失去闭式；论文改用"$z=0$ 严格富余 + 有限性 + 连续性"，本质是承认算不出。其二，支一若把共享定义成"共槽"，并非"共线"：$\omega\approx b/s$ 太小用不了 `ac:eq:9`（$r=(k+h)b/s$ 可以远大于 1 除非 $k+h\ll s/b$，而假设只给 $s^{1-\theta}$），而"共线"版本的 $\omega\le b\max m_j/s$ 恰在 $b>B_0$ 时把 $\max m_j\le s^{2/b}$ 的 $2/b$ 换成小量。三，取消机制若只做到"good 粒子逐个抵消"而不引入 $G$ 的整组先可行后成组：good 定义里"共享不共槽"保证 $J\cup S$ 可行性对 $S$ 一致，这是分组合法的前提；我试过只按线 light 定义 $G$（去掉共槽条件），$J\cup S$ 与 $J$ 的可行性可能不同，交替和无法因式化成 $\prod_i(\cdot-1)$，`ac:eq:10` 在第一步就散架。

## 6 逐字读 05-density：Lemma 5.1 与带符号张量密度

(a) 逐字（`05:19-33`）：

```tex
\begin{lemma}[Signed density domination]\label{lem:density}
Let \(P_\alpha\) be the isotypic projection for \(\alpha\vdash l\) in this
signed tensor representation. The types present are precisely those in the
\((p,p)\)-hook: all their boxes lie in the first \(p\) rows or the first
\(p\) columns. For every such type there is a probability distribution
\(\mu_\alpha\) on even densities such that, in positive semidefinite order,
\begin{equation}
 P_\alpha\preceq
 \exp\{F(\alpha)+O(p^2\log(s+1))\}
 \mathbb E_{r\sim\mu_\alpha}r^{\otimes l}.
 \label{ac:eq:13}
\end{equation}
Its multiplicity is at most \(\exp(O(p^2\log(s+1)))\), and the number of
types present is at most \((s+1)^{2p}\). All constants are absolute.
\end{lemma}
```

设定（`05:10-17`）：$p\in[1,s]$，$V=E\oplus O$ 两半各维 $p$；$S_l$ 在 $V^{\otimes l}$（$l\le s$）上带符号置换：交换两个相邻奇因子记号，其余不记；奇因子重排的实现是酉作用。even density：$V$ 上半正定、迹 1、对 $E\oplus O$ 分块对角。

(b) 扇区分解 `05:42-61`：固定偶因子数 $t$，一个奇偶模式给出 $E$ 的通常张量幂与 $O$ 的带符号通常张量幂，对模式求和即从 $S_t\times S_{l-t}$ 诱导上来；扇区 $\mathcal V_{\sigma,\tau}\cong\operatorname{Ind}_{S_t\times S_{l-t}}^{S_l}([\sigma]\boxtimes[\tau'])\otimes W_\sigma(E)\otimes W_\tau(O)$，$\sigma\vdash t$、$\tau\vdash l-t$ 行数各 $\le p$。钩型刻画 `06:63-81`：$[\tau']$ 可由尺寸 $\tau_1,\ldots,\tau_p$ 的符号表示逐列（垂直带）诱导合成；Pieri 给 $\alpha_i\le\sigma_i+p$、$\alpha'_j\le\tau_j+p$（补零后），故 $\alpha_{p+1}\le p$；反向由"前 $p$ 行为偶型、下方按列从左到右逐垂直带加格"构造，奇张量幂里每带一个基符号的词承载对应诱导。类型数 $(s+1)^{2p}$：钩形状由前 $p$ 行长与前 $p$ 列长决定。权比较 `05:83-113`：$\mathcal S=l\log l-\sum\sigma_i\log\sigma_i-\sum\tau_j\log\tau_j$；臂 $H_i=(\alpha_i-p)_+\le\sigma_i$；水平臂的 hook 逐个不超过"行 hook $+p$"，臂长 $H_i$ 的 hook 乘积 $\le\prod_{r\le H_i}(r+p)=H_i!\binom{H_i+p}p\le H_i!(s+p)^p$；核 $\le p^2$ 个 hook、每个 $\le s$；hook 公式得 $D_\alpha\ge(s+p)^{-O(p^2)}\cdot l!/(\prod\sigma_i!\prod\tau_j!)$，Stirling 展开 $\log n!=n\log n-n+O(\log(n+1))$，一次项因 $|\sigma|+|\tau|=l$ 相消，得 `ac:eq:14`：$\mathcal S\le F(\alpha)+O(p^2\log(s+1))$。密度构造 `05:115-158`：$d_E=\operatorname{diag}(\sigma_i/l)$，独立 Haar 旋转成 $r_U$；Weyl 维数公式给 $m_\sigma\le(t+1)^{p(p-1)/2}$；$r_U^{\otimes l}$ 保持每个 Schur--Weyl 扇区，对两个酉群求平均在重数空间上成标量，标量 $\ge\prod(\sigma_i/l)^{\sigma_i}\prod(\tau_j/l)^{\tau_j}/(m_\sigma m_\tau)=e^{-\mathcal S}/(m_\sigma m_\tau)\ge e^{-\mathcal S-O(p^2\log(s+1))}$（最高权线本征值 $\prod(\sigma_i/l)^{\sigma_i}$，其余非负；零分量按 $0^0=1$ 连续性处理）。跨奇偶模式不付钱的理由在 `05:150-152`：密度保持每个模式且每个模式上张量因子相同。扇区投影求和：相关扇区数 $N_\alpha\le(s+1)^{2p}$，先均匀选扇区再选 Haar 阵，$N_\alpha$ 折进 $O(p^2\log(s+1))$ 得 `ac:eq:13`。两边取迹：$\operatorname{Tr} P_\alpha=D_\alpha\operatorname{mult}(\alpha)$，$\operatorname{Tr} r^{\otimes l}=1$，得重数界。末段 `05:176-182` 的分块推论：槽按块分划时带符号酉重排把乘子群作用张量化，逐块套 `ac:eq:13` 得块内常数密度积；even 性使还原带符号重排后仍与普通张量积相容；特别地，偶密度的常张量幂与整个带符号对称群作用交换（这个"交换"性质正是 `06:222-229` 里 $B_\varepsilon P_\gamma\preceq D_\gamma^{-1}P_\gamma$ 成立的前提）。

(c) 数值与结构的机械理由：迹 1 归一化是为第 7 节"参考密度 $\bar r_\varepsilon^{\otimes n}$ 迹 1 且交换"这一步买的单；若密度不归一，$\operatorname{tr}(A_\varepsilon\bar rA_\varepsilon v_j)\le s_2/(1-\varepsilon)$ 的 AM--GM 收口会带 $(\dim V)^l$ 级别的泄漏。$O(p^2\log(s+1))$ 的三处来源（臂组合数、核 hook、扇区数）全部是"每对指标 $\log$ 级"结构，$p^2$ 是 $p\times p$ 核的规模；$\log(s+1)$ ，并非 $\log s$ 是 $s=1$ 边界（$p$ 可到 $s$，`05:10`）的防零写法。$l\le s$ 把 $\mathcal S$ 里的 $\log l$ 统一换成 $\log s$ 尺度，才和第 7 节的误差 $O((s_1+s_2)p^2\log(s+1))$ 接得上。

(d) 失败路线 [推测]：其一，绕开带符号作用、直接对偶表示用通常 Schur--Weyl：扇区支撑从钩扩成整片行数 $\le 2p$ 的区域，第 7 节行/列投影的交叠估计会多付出 $O(s)$ 级指数，这正是 Berele--Regev 钩定理被引用的原因（`05:35-37` 的归功）。其二，把 $\mu_\alpha$ 取成单个固定密度，并非分布：$r_U^{\otimes l}$ 对扇区的标量来自 Haar 平均，固定对角密度在重数空间上非标量，$\preceq$ 逐向量验证不了。其三，跨模式计数若走"每模式一份 $\mathbb E r^{\otimes l}$ 相加"：模式数 $\binom lt\le2^l$ 会进指数；`05:150-152` 的"同一标量作用于每个模式"省掉它，靠的正是密度分块对角、模式是 $E/O$ 张量因子重排这一事实；若密度不是 even 的（混合 $E,O$ 的 $V$ 密度），这条免费通道立刻关闭。

## 7 逐字读 06-induction：归纳骨架与 Lemma 6.1

**常数顺序。** `06:5-29` 将选择顺序写死：$\theta=a/16=1/1600$、$K_0=10/e_0=10^5$ 代入 Lemma 4.1；由 $\rho$ 取整数 $q\ge\max\{1,\lceil2/\rho\rceil\}$（即 $2q\rho\ge4$）；再取充分大的 2 的幂 $R$，显式要求 `06:18-20`：$1/\sqrt{\log R}\le e_0/2$、$1/\log R\le e_0/4$，即 $\log R\ge4\times10^8$。推论三连 `06:22-26`：$c(s)\le2c_0$、$e(s)\ge e_0/2$、$e(s)h\log s-C(\mathcal H)\ge(e_0/4)h\log s$（用 $b\le\log s/\log R$ 与 $C\le bh$）。$R$ 定完后才取 $z_*$，同时满足 `ac:eq:3`、Lemma 4.1 与基础情形。

**归纳骨架。** 对坐标数 $b$ 归纳，同时对一切网格、一切可行族、一切表示。$F(\lambda)=0$ 的类型（空图、$M=1$、一维平凡）：条件平均是压缩，矩 $\le1$，非负 allowance 收工（`06:31-35`）。基础 $b=1$、$z=0$：条件化留下剩余槽上的均匀双射，一切非平凡平均恰为零矩阵；$R$ 固定后一元网格、路径族、表示都只有有限多，算子 $z$ 连续，缩 $z_*$ 得公共区间（`06:37-42`）。$b\ge2$：先记万能界 $T_\lambda^{\mathcal H}\le D_\lambda$（矩不超过维数，因算子范数 $\le1$），故目标不等式在 `ac:eq:16`：$(1+c(s))F(\lambda)\le e(s)h\log s-C(\mathcal H)$ 成立时自动（`06:44-50`）。**稀疏维数区** `06:51-69`：设 $F(\lambda)<s^{1-a/4}$ 且 (16) 失败。由 $e(s)\ge e_0/2$ 与 allowance 得 $h\log s\le K_0F(\lambda)$；$k=\min(M-\lambda_1,M-\lambda_1')$ 满足 $c_{\rm dim}k\le F\le k\log s$（$M\ge s/2$ 后 $\log M$ 换 $\log s$ 只动绝对常数），于是 $h\le K_0k$；再 $h+k\le(K_0+1)F(\lambda)/c_{\rm dim}\le(K_0+1)s^{1-a/4}/c_{\rm dim}\le s^{1-\theta}$（$\theta=a/16<a/4$，$K_0$ 与 $c_{\rm dim}$ 的绝对量被 $\log R\ge4\cdot10^8$ 淹没）。Lemma 4.1 给 $\|K\|_{\mathrm{op}}\le s^{-\rho k}$；$D_\lambda$ 个奇异值每个 $\le s^{-2q\rho k}$……逐字核对 `06:63-67`：$\log T\le F-2q\rho k\log s\le-3F$（$2q\rho\ge4$ 且 $F\le k\log s$），$-3F\le-c(s)F+$ allowance（$c(s)\le2c_0<3$）。**剩余：大维数区** `ac:eq:17`：$F(\lambda)\ge s^{1-a/4}$。

**钩估计声明。** `06:82-98`：$p=\lfloor s^a\rfloor$，$\widehat c=c(s)+\frac1{20\sqrt{\log s}}$，$\widehat e=e(s)-\frac1{20\sqrt{\log s}}$；断言 (21)：对当前网格上一切 $h'$ 元可行族 $\mathcal H'$ 与一切 $(p,p)$ 钩 $\gamma\vdash s-h'$，$\log T_\gamma^{\mathcal H'}\le-\widehat cF(\gamma)+\widehat e h'\log s-C(\mathcal H')+s^{9/10}$。`06:99-102` 强调：对 $F(\gamma)$ 无下界、系数双向加强、势能全额保留。**分裂**：坐标表切成连续两块 $\lfloor b/2\rfloor$ 与 $\lceil b/2\rceil$，乘积 $s_1,s_2$；每坐标贡献 $[\log R,2\log R]$，故 $\tfrac15\log s\le\log s_u\le\tfrac45\log s$。我核算了 $1/5$ 的来源：最坏是两块坐标全取两端异号，比值 $\le2\lfloor b/2\rfloor/(2\lfloor b/2\rfloor+\lceil b/2\rceil)\le2/3$，$4/5$ 与 $1/5$ 都是宽裕写法，真正的硬要求是离 0 与 1 有绝对距离，因为下一步的储备要用 $\sqrt{\log s_u}$ 对 $\sqrt{\log s}$ 的比。把网格看作 $s_2$ 行每行 $s_1$ 格：前半段在行内扫，后半段在列内扫；接缝处 $\mathcal H'$ 的中点位置挖洞，剩 $s-h'$ 个自由点，行约束 $\mathcal H_i$、列约束拼回 $\mathcal H'$。

**算子分解。** `06:118-155`：$X$ 行平均（入层到接缝）、$Y$ 列平均（接缝到出层），条件独立使 $YX$ 为全条件平均；$P_\gamma$ 全群投影、$P_\alpha^R,P_\beta^C$ 行列子群投影（$\alpha_i$ 剖分行 $i$ 的自由点数，空行取空型），$F_R=\sum_iF(\alpha_i)$、$F_C=\sum_jF(\beta_j)$。接缝上把 $YP_\gamma X$ 限制到 $\gamma$-同型空间是 $K_\gamma^{\mathcal H'}\otimes I$（酉相容认同下；重数 $\ge1$ 由 Lemma 5.1 的钩支撑保证），插入子群分解得 `ac:eq:20`：$(T_\gamma^{\mathcal H'})^{1/(2q)}\le\|YP_\gamma X\|_{2q}\le\sum_{\alpha,\beta}\|YP_\beta^C\|_{2q}\,\|P_\beta^CP_\gamma P_\alpha^R\|_{\mathrm{op}}\,\|P_\alpha^RX\|_{2q}$。行侧 $X=\bigotimes_iX_i$（带符号酉重排正当化），$\|P_\alpha^RX\|_{2q}^{2q}=\prod_i\operatorname{mult}(\alpha_i)T_{\alpha_i}^{\mathcal H_i}$；对每个局部受约束扫描用归纳假设（行数更少的子问题），重数按 Lemma 5.1 的 $\exp(O(p^2\log(s+1)))$ 付费，线势能按"每线恰属一个孩子"相加回 $C(\mathcal H')$，尺寸权重 $\log s_1+\log s_2=\log s$，得 `ac:eq:18`：左边 $\le-c_*(F_R+F_C)+e_*h'\log s-C(\mathcal H')+O((s_1+s_2)p^2\log(s+1))$，$c_*=\min_uc(s_u)$、$e_*=\max_ee(s_u)$。

(a) 中段引理逐字（`06:190-200`）：

```tex
\begin{lemma}[Overlap at the junction]\label{lem:overlap}
For the row and column type lists on the free junction sites and the full
hook type \(\gamma\) defined above,
\begin{equation}
 \log\|P_\beta^C P_\gamma P_\alpha^R\|_{\rm op}^2
 \le F_R+F_C-F(\gamma)+h'
       +O((s_1+s_2)p^2\log(s+1)).
 \label{ac:eq:19}
\end{equation}
Here a zero norm has logarithm \(-\infty\), and the constant is absolute.
\end{lemma}
```

(b) 证明四拍，我逐拍补步。第一拍 `06:202-207`：$P_\gamma$ 与两子群投影交换，故 $\|P_\beta^CP_\gamma P_\alpha^R\|_{\mathrm{op}}^2\le\|P_\beta^CP_\gamma P_\alpha^R\|_{\rm HS}^2=\operatorname{Tr}(P_\alpha^RP_\beta^CP_\gamma)$，且 $P_\beta^CP_\gamma$ 半正定。第二拍：迹里用 Lemma 5.1 控制 $P_\alpha^R$（行侧），提出 $\exp(F_R+O(s_2p^2\log(s+1)))$，剩"乘积密度混合"，行 $i$ 的单点 even 密度 $r_i$。第三拍（核心）：对全部 $s_2$ 行（含空行）平均得 $\bar r$，正则化 $\bar r_\varepsilon=(1-\varepsilon)\bar r+\varepsilon I/\dim V$，$A_\varepsilon=\bar r_\varepsilon^{-1/2}$；$B_\varepsilon=\bar r_\varepsilon^{\otimes n}$（$n=s-h'$）迹 1 且与全带符号群作用交换（`05:181-182` 的常张量幂交换性），在 $\gamma$-同型空间形如 $I_{D_\gamma}\otimes B_\gamma$，于是每个本征值在迹里被数 $D_\gamma$ 次、本征值 $\le1/D_\gamma$，即 $B_\varepsilon P_\gamma\preceq D_\gamma^{-1}P_\gamma$。它与 $P_\beta^C$ 交换，用 $P_\beta^C$ 压缩、右端用 $P_\beta^CP_\gamma\preceq P_\beta^C$、再共轭 $B_\varepsilon^{-1/2}$：$P_\beta^CP_\gamma\preceq D_\gamma^{-1}A^{\otimes n}P_\beta^CA^{\otimes n}$。第四拍：列投影再套密度混合（提出 $\exp(F_C+O(s_1p^2\log(s+1)))$），每个混合被积函数是逐自由点迹积 $\prod\operatorname{tr}(A r_iAv_j)\ge0$（写成 HS 平方 $\|r_i^{1/2}Av_j^{1/2}\|_{\rm HS}^2$ 证非负）；对固定列求和过行：$\sum_i\operatorname{tr}(A\bar r A v_j)=s_2\operatorname{tr}(A_\varepsilon\bar rA_\varepsilon v_j)\le s_2/(1-\varepsilon)$，因 $(1-\varepsilon)\bar r\preceq\bar r_\varepsilon$ 共轭后 $A\bar rA\preceq I/(1-\varepsilon)$；缺 $l<s_2$ 点的列用 AM--GM：保留位乘积 $\le(1-\varepsilon)^{-(s_2-l)}(s_2/(s_2-l))^{s_2-l}\le(1-\varepsilon)^{-(s_2-l)}e^l$（$(1+x)^{1/x}\le e$ 逐字验证：$x=l/(s_2-l)$ 时指数恰 $l$）；全列缺位总数 $h'$，$e^l$ 相乘出 $e^{h'}$ 即 (19) 的 $+h'$；$\varepsilon\downarrow0$ 由一致有界被积函数控制。

(c) 为什么每一项长这样：$-F(\gamma)$ 来自 $D_\gamma^{-1}$，这是整条归纳里"全群维数买子群维数"的唯一出口；$+h'$ ，并非 $+h'\log s$ 来自每缺一个点只付常数 $e$，因为预算 $s_2/(1-\varepsilon)$ 是按列发的；两个 $O$ 的分裂（$s_2p^2$ 配 $F_R$、$s_1p^2$ 配 $F_C$）说明密度混合的行侧按 $s_2$ 条线计价、列侧按 $s_1$ 条线计价，`06:187-188` 特意注明中段估计不用轨迹概率，只用固定棋盘。

**合成。** `06:270-306`：中段非零则范数既 $\le1$ 又满足 (19)，写 $W$ 为 (19) 右端，则 $q\log\|\cdot\|_{\mathrm{op}}^2\le c_*\min(0,W)\le c_*W$（用 $c_*\le2c_0<1\le q$）；乘进 (18) 使 $F_R+F_C$ 相消：$\log T_\gamma^{\mathcal H'}\le-c_*F(\gamma)+e_*h'\log s-C(\mathcal H')+c_*h'+O_q((s_1+s_2)p^2\log(s+1))$（$O_q$ 吸收 $2q$ 次幂展开与局部钩型列表数）。系数储备逐字核对 `06:289-295`：$c_*-c(s)=e(s)-e_*\ge(\sqrt5/2-1)/\sqrt L>1/(10\sqrt L)$，$L=\log s$：由 $\log s_u\le\frac45L$ 得 $1/\sqrt{\log s_u}\ge\sqrt{5/4}/\sqrt L$，减 $1/\sqrt L$ 剩 $(\sqrt5/2-1)/\sqrt L$；声明只花 $1/(20\sqrt L)$，利息留一半。洞储备 $h'\sqrt L/20$：$h'(c_*-\widehat c)\ge h'(\frac1{10\sqrt L}-\frac1{20\sqrt L})=\frac{h'}{20\sqrt L}\cdot L$……按 `06:296-298` 原文口径是"剩余洞储备至少 $h'\sqrt L/20$，$R$ 大时吸收 $c_*h'$"：$c_*\le2c_0=2\cdot10^{-4}$ 而 $\sqrt L/20\ge 2\cdot10^4/20=100$。误差 $(s_1+s_2)p^2\log(s+1)\le2s^{4/5+2a}\log(s+1)=2s^{0.82}\log(s+1)\le s^{9/10}$（$q$ 固定后 $O_q$ 同样被 $R$ 淹没）。

**加回钩外。** `06:308-396`：$\lambda$ 的 $(p,p)$ 钩部分 $\gamma$ 是 Young 图，双指标各减 $p$ 平移出 $\delta$，$k=|\delta|$。branching 加 Frobenius 互反给 $[\lambda]$ 在 $\operatorname{Ind}_{S_{M-k}}^{S_M}[\gamma]$ 中重数 $D_\delta$；诱导空间维数 $(M)_kD_\gamma$，故 `ac:eq:22`：$F(\lambda)\le F(\gamma)+k\log s$。纤维实现：$k$ 张可区分牌在自由槽上的每个放置配一份 $[\gamma]$ 纤维；$x\to y$ 块 $=p_{\mathcal H}(x,y)\times$（增广族 $\mathcal H'$ 下 $[\gamma]$ 条件算子），$\mathcal H'$ 大小 $h+k$，(21) 无维数条件下逐块适用。诱导平均的 $2q$ 矩 $\ge D_\delta T_\lambda^{\mathcal H}$；迹按循环放置指标展开、$2q$ 条边交替输入输出：`ac:eq:23` $D_\delta T_\lambda^{\mathcal H}\le\sum(\prod p_j)\prod(T_\gamma^{\mathcal H'_j})^{1/(2q)}$（伴随边用转置转移元与伴随纤维算子，奇异值同、前向势能同）。势能望远镜是关键一步：对每条边把 (21) 的 $e^{-C(\mathcal H'_j)/(2q)}$ 与 `ac:eq:4` 的 $1/(2q)$ 次幂结合，$p_j^{1/(2q)}e^{-C(\mathcal H'_j)/(2q)}\le s^{-k/(2q)}e^{-C(\mathcal H)/(2q)}(4^{kb})^{1/(2q)}$（增广族锚定在原 $\mathcal H$ 上，$\Delta C_j$ 恰与 $C(\mathcal H'_j)$ 相消），$2q$ 条边相乘得 `06:361-365` 的 $\prod(p_je^{-C(\mathcal H'_j)/(2q)})\le s^{-k}e^{-C(\mathcal H)+(\log4)kb}\prod p_j^{1-1/(2q)}$。剩下的纯计数：边矩阵的行列和都是 1（转移平均双射），删一边成链、逐端求和给 $\sum A_r=n_k=(M)_k$，标量 Hölder 给 $\sum\prod p_j^{1-1/(2q)}\le n_k$；净计数因子 $s^{-k}(M)_k\le1$。得 `ac:eq:24`。收尾 `06:398-442`：括号 $[(\widehat c+\widehat e)k\log s+(\log4)kb-F(\delta)]$，$\widehat c+\widehat e=c_0+e_0=a/50$；$\delta$ 的行、列长 $\le\lambda$ 的第 $p+1$ 行长/列长 $\le s/(p+1)$，每 hook $\le2s/(p+1)$；$k\ge s^{1-a/2}$ 时 hook 公式加 $k!\ge(k/e)^k$ 给 $F(\delta)\ge k(\frac a2\log s-\log(2e))\gg$ 括号正项（$\frac a{50}<\frac a2$ 且 $b/\log s\le1/\log R$）；$k<s^{1-a/2}$ 时弃 $-F(\delta)$，括号 $\le O(s^{1-a/2}\log s)$；最后 $(\widehat c-c(s))F(\lambda)\ge s^{1-a/4}/(20\sqrt{\log s})$（靠 `ac:eq:17`！）吞掉 $s^{9/10}+s^{1-a/2}\log s=o(\cdot)$。归纳完毕。

(d) 失败路线 [推测]：其一，中段若不用 $D_\gamma^{-1}$ 而用 HS 范数直接估 $\operatorname{Tr}(P_\alpha^RP_\beta^CP_\gamma)$：三个投影的迹就是 $\gamma$-同型空间上行列子群交角的维数和，没有密度混合就没有 $A_\varepsilon$ 归一化通道，$F_R+F_C$ 无法在 (18) 处相消，(21) 会多出 $+F_R+F_C$ 级灾难。二，势能望远镜若把 `ac:eq:4` 用满次幂，并非 $1/(2q)$：每边付 $s^{-k}$，循环总代价 $s^{-2qk}$ 对 $s^{k}\cdot(M)_k$ 级别的求和不匹配，计数因子爆成 $((M)_k/s^k)^{2q}$。三，$p=\lfloor s^a\rfloor$ 若取 $p\ge s^{a/2}$ 之类：$\delta$ 的上界行长 $s/(p+1)$ 仍成立，但 $F(\delta)\ge k(a'\log s-\cdot)$ 的系数变成 "$1-\log(s/p)/\log s$" 型，$a'<a/50$ 时括号的 $(\widehat c+\widehat e)k\log s$ 付不起；$p=\lfloor s^a\rfloor$ 恰让钩外每行短到 $s^{1-a}$，把 $F(\delta)$ 系数抬到 $a/2$，是"$>a/50$"的最低配置。

## 8 逐字读 07-analytic：解析迁移（全文枢纽）

(a) 这一节没有编号定理环境，出口是编号不等式 `ac:eq:25`（`07:37-41`）：

```tex
 \|K_\lambda(1)\|_{\op}\le D_\lambda^{-g},
 \qquad g=a_0G(1)>0.
```

外加 Theorem 1.1（`01:54-64`）逐字：

```tex
\begin{theorem}[Binary sweep contraction]\label{thm:binary}
There are absolute constants \(g>0\) and \(d_0\) such that, for \(d\ge d_0\)
and every \(\lambda\vdash 2^d\),
\[
 \|K_\lambda\|_{\op}\le D_\lambda^{-g}.
\]
The sign representation is annihilated. There is an absolute positive integer \(w\)
such that the law after \(w\) independent sweeps converges to uniform in
total variation as \(d\to\infty$, uniformly over deterministic initial
decks.
\end{theorem}
```

(b) 全链条七步。**步一（多项式性与实段界）**：$\mathcal H=\varnothing$ 时 $K_\lambda(z)$ 是线平均之积，$L_m(z)$ 对 $z$ 线性，故 $K_\lambda(z)$ 是矩阵值多项式（`07:4`）。`07:5-8`：$a_0=c_0/(2q)$，由 $c(s)\ge c_0$ 与 $\|\cdot\|_{\mathrm{op}}\le\|\cdot\|_{2q}$（未归一化迹：$\|A\|_{2q}^{2q}\ge s_{\max}^{2q}$），$\|K_\lambda(z)\|_{\mathrm{op}}\le D_\lambda^{-a_0}$ 对 $0\le z\le z_*$。**步二（单位圆盘上的严格收缩）** `07:10`：线上 $B_m$ 平均在不可约表示里是"逐独立开关层的正交投影之积"（对合酉元 $\tau$ 的平均 $(I+\rho(\tau))/2$ 是投影）。若该积范数取到 1，有限维下单向量达到，逐投影等号强制该向量被所有开关群固定；立方体所有边上的对换生成 $S_m$，故向量全不变，与非平凡不可约矛盾。允许 $m$ 有限、非平凡不可约有限，取最大值 $\kappa<1$。**步三（半径 $r$ 的盘界）** `07:12-18`：限制到线子群 $S_m$，$P,Q$ 为 $U_m,B_m$ 平均；$PQ=QP=P$（均匀平均吸收每个群元），故 $(1-z)P+zQ=I_{\operatorname{ran}P}\oplus z\,Q|_{\ker P}$，范数 $\le\max\{1,|z|\kappa\}$。$\kappa=0$ 取 $r=2$，否则 $1<r<\kappa^{-1}$：每条线平均在 $|z|\le r$ 上压缩，同阶段线平均交换、乘积仍压缩，全算子有序积给 $\|K_\lambda(z)\|_{\mathrm{op}}\le1$，对网格与 $\lambda$ 一致。**步四（障碍线势）** `07:20-26`：取 $0<u<v<\min\{z_*,1,r-1\}$，$\Omega=\{|z|<r\}\setminus[u,v]$，

```tex
 G(z)=\varepsilon_0\int_u^v\log\frac1{|z-t|}\,dt
```

线段外调和；对数奇性可积给出跨线段的连续延拓（含端点）；$|z|=r$ 上 $|z-t|\ge r-v>1$ 故 $G\le0$；线段上取值有界，$\varepsilon_0$ 小使得线段上 $G\le1$；$G(1)>0$ 因 $t\in[u,v]$ 时 $0<1-t<1$。**步五（次调和迁移）** `07:28-42`：定单位向量 $u_0,v_0$，$f(z)=u_0^*K_\lambda(z)v_0$ 标量多项式（$f\equiv0$ 时 $|f(1)|=0$ 免证）；$\log|f|$ 次调和（零点处 $-\infty$）；$A=a_0\log D_\lambda$，$H=\log|f|+AG$。边界 limsup：圆盘上 $\log|f|\le0$、$G\le0$；实段上 $\log|f|\le-A$、$G\le1$：两路边都 $\le0$。次调和函数的边界 limsup 最大值原理（引 Demailly 第 I 章 4.C.1 定理 (4.14)）给 $H\le0$ 于 $\Omega$；$1\in\Omega$（因 $v<1$ 且 $r>1$）：$\log|f(1)|\le-AG(1)$；对单位向量取上确界得 `ac:eq:25`，$g=a_0G(1)>0$。$R,q,z_*$ 已在 Theorem 3.1 固定，$\kappa,r,u,v,\varepsilon_0$ 只依赖它们，故 $g$ 与网格、坐标数、$\lambda$ 无关。**步六（搬到 $B_N$）** `07:44`：$\ell=\log_2R$；$d\ge\ell$ 写 $d=b\ell+t$，$0\le t<\ell$，比特按连续块分成一块 $\ell+t$ 与 $b-1$ 块 $\ell$，线尺寸 $2^{\ell+t}\in[R,R^2]$ 与 $R$ 都落在允许区间；$z=1$ 时块内不相交线上的二元扫描可按比特方向交错，网格扫描恰为 $B_N$（$N=2^d$）；符号系数零（翻一个公平开关反号）。**步七（Fourier 收口）** `07:46-56`：$\mu_w=B_N^{*w}$，$\widehat{\mu_w}(\lambda)=K_\lambda(1)^w$；Diaconis--Shahshahani 的 Cauchy--Schwarz 加矩阵 Plancherel：

```tex
 \|\mu_w-U_N\|_{\TV}^2
 \le \frac14\sum_{\lambda\ne(N)}D_\lambda\,
                \|K_\lambda(1)^w\|_2^2
 \le \frac14\sum_{\lambda\notin\{(N),(1^N)\}}
                D_\lambda^{\,2-2gw}.
```

第二行用符号湮灭与 $\|K^w\|_2^2\le D\|K\|_{\mathrm{op}}^{2w}\le D^{1-2gw}$。求和账 `07:58-71`：$\beta=2gw-2$，$k(\lambda)=\min(N-\lambda_1,N-\lambda_1')$；$k\le N/3$ 时型数 $\le2\cdot2^k$（转置侧 $\times$ $k$ 的分拆数），`ac:eq:1` 给 $D_\lambda\ge e^{-1}(N/k)^k$，于是第一段 $\le2e^\beta\sum_k[2(k/N)^\beta]^k$，固定 $k$ 项一致被 $(2\cdot3^{-\beta})^k$ 控制，$\beta>\log2/\log3$ 时可控求和；$k>N/3$ 时 $\log D_\lambda\ge c_{\rm dim}N$、分拆数 $\le2^N$，第二段 $\le\exp((\log2-\beta c_{\rm dim})N)\to0$。取绝对整数 $w$ 使 $\beta=2gw-2>\max\{\log2/\log3,\ \log2/c_{\rm dim}\}$。TV 距离随 $d\to\infty$ 归零，对确定性初始牌堆一致（平移不变）。物理步 `07:73`：$wd$ 步达 $\le1/4$，配 Proposition 1.2 的 $2d-O(1)$ 得 $t_{\rm mix}(d)=\Theta(d)$。

(c) 每个装置的机械理由，我按"若拆掉哪根断哪里"来记。$z_*$ 必须小于 1：整个第 5 到 7 节的证明都在 `ac:eq:3` 的影子里跑，$z\le z_{\rm cmp}\le1/2$；而目标是 $z=1$。盘半径 $r>1$ 必须存在：若界只在单位盘，实段 $[u,v]$ 把盘切成两半后 $1$ 与圆盘边界 $\{|z|=r\}$ 之间……关键是 $1$ 要同时在"盘界 $\le1$"区域内部（作为 $\Omega$ 的内点，$1<r$）又在实段界的外侧（$v<1$）；半径不超过 1 的盘给不出 $1\in\Omega$。而 $r<\kappa^{-1}$ 的上限又被 `07:14` 的结构钉死：$(1-z)P+zQ$ 在 $\operatorname{ran}P$ 上恒等于 $I$，全平面一致的 $\le1$ 界当且仅当 $\kappa=0$；一般 $\kappa>0$ 时 $|z|>\kappa^{-1}$ 就破 1，所以 $r=2$（$\kappa=0$）或 $r\in(1,\kappa^{-1})$，两头都写得动。$G$ 用线段对数位势，并非单点 $\log|z-t_0|$：单点障碍在 $z\to t_0$ 无界、无法在整段 $[u,v]$ 上统一 $G\le1$；沿段积分把奇性摊薄成连续（`07:24-25` 明说"Direct integration of the logarithm gives a continuous extension"），这正是 slit 两侧边界值可控的原因。$A=a_0\log D_\lambda\ge0$ 的乘子结构让同一条 $G$ 服务所有维数：实段界与盘界的差恰是 $A$，$g=a_0G(1)$ 随 $a_0$ 线性，而 $a_0=c_0/(2q)=10^{-4}/(2q)$，$q$ 在第 7 节买循环展开，在这里按 $1/q$ 泄进 $g$，再由 $w\asymp1/g$ 买回；全文三处大数（$q$、$R$、$w$）各就各位。$2\cdot2^k$ 型计数与 $e^{-1}$ 是 `ac:eq:1` 原样搬运；$\beta$ 双阈值 $\log2/\log3$ 与 $\log2/c_{\rm dim}$ 分别配两段和，没有第三条路。固定 $d$ 的收敛（Theorem 1.1 第一句只管 $d\to\infty$）在 `01:89-95` 用另一台机器：单次扫描以正概率给恒等或任一立方体边对换，边对换生成 $S_N$，补恒等得某 $w'$ 次幂全支撑、正最小概率给一致 minorization，迭代收敛。
(d) 失败路线 [推测]：其一，试图用最大模定理替代次调和：$\|K_\lambda(z)\|_{\mathrm{op}}$ 对矩阵值函数不是调和意义的次调和（范数带奇性、不半连续成上正则），必须先用 $u_0^*Kv_0$ 标量化再取 $\log|f|$；而标量化后对 $(u_0,v_0)$ 的选取要一致（论文取遍单位球对上确界），这是次调和路线唯一干净的入口。二，试图把实段换成小圆弧 $\{|z|=u\}$：圆上界 $\le D^{-a_0}$ 需要"对全部角度 $\theta$ 的 $z=ue^{i\theta}$ 成立"，而定理 3.1 只给了实 $z$；解析开拓在整圆成立当且仅当多项式恒等，但界不是等式。三，试图不引入 $\kappa$ 而直接用 $z=1$ 处的行/列平均收缩：$K_\lambda(1)$ 在平凡线型的不变方向上恰为 $I$，范数 1 不可免，"$\le1$ 于盘"已经是最优的粗界，细的全部信息被塞进 $G(1)$ 一个正数里。

## 9 背景与检索：两个口径分开记

**论文口径**（全部能从 tex 与 `references.bib` 逐行验证）。物理模型 Thorp 1973《Nonrandom shuffling with applications to the game of Faro》（bib:101-106）。上界历史链在 `01:99-105` 与 bib:1-29：Morris 2005 稿/2008 刊 $O(d^{44})$（bib:25-29），Montenegro--Tetali 2006 综述 §6.4 内收紧 $O(d^{29})$（bib:49-55），Morris 2009 对一切偶数 $N$ 给 $O((\log N)^4)$（bib:1-6），Morris 2013 对 2 的幂给 $O(d^3)$（bib:8-12）。"暴露选定牌信息"的先例论文自己点名四处并给到节与引理号（`01:107-120`）：Morris 2008 §4 Lemma 3 的 chameleon 恒等式（无序被占集条件下的标记牌律）、Morris 2013 §4 Lemma 7 证明（反向 Thorp shuffle 两次耦合中逐条暴露完整带标签轨迹、累加期望熵变）、Morris--Rogaway--Stegers（CRYPTO 2009，§3 与附录 A Lemma 2，选定牌边际加沿演化耦合，bib:40-47）、Hoang--Morris--Rogaway（CRYPTO 2012  proceedings、编号按 arXiv:1208.1176v2，§3 Theorem 3 与 Lemma 4 的条件平方差异，bib:31-38）。Czumaj--Vöcking 2014（bib:85-91）与 Czumaj STOC 2015 §1.5（bib:95-99）：非马尔可夫耦合对 $1-\varepsilon$ 比例标记牌 $O(d^2)$ 物理步/ $O(d)$ 次完整扫描的近均匀端点律；`01:128-130` 明说本篇与其对象差异：它们管选定牌端点，本篇管每个可行族的整体残差双射。表示侧：Sagan、Stanley、Vershik--Okounkov（bib:14-23，branching 与 tableau 规则出处），Berele--Regev 钩定理（bib:70-76），Christandl--König--Renner postselection 的正密度混合支配（bib:77-83，Lemma 2 与 Theorem 1 证明），Demailly 笔记 Chapter I §4.C.1 Theorem (4.14)（bib:57-61，次调和边界 limsup 最大值原理），Diaconis--Shahshahani 1981 §2 Lemma 2 与 Lemma 14 证明（bib:63-68，Cauchy--Schwarz 加矩阵 Plancherel）。

**上网检索口径**（以下内容不进入我对 tex 的任何陈述，信息不足处标 [推测]）。我跑了两次 WebSearch，主题分别是 Thorp shuffle 的 $O(d)$ 混合、Diaconis--Graham 的 top-to-random 对照与 Berger 谱界路线。两次返回的都是综述页、讨论班页与聚合站，没有拿到任何一篇可核对的一手文献正文，因此下面全部标 [推测]：[推测] top-to-random（cutting cards）类洗牌在 Diaconis--Graham 传统下混合阶为 $\Theta(N\log N)$ 级别，与 Thorp shuffle 的 $\Theta(d)=\Theta(\log N)$ 形成数量级对照，这类对照常被用作"并行开关层优于串行移动"的范例；本篇 `references.bib` 十条文献里没有 Diaconis--Graham 条目，这个对照在本论文内部完全缺席。[推测] Chen--Louhichi 与 Peres--Solomon--Schramm--Virág 一脉（超平面游走/交错洗牌语言）曾被报道给出 Thorp shuffle $O(d)$ 混合的猜想或局部结果；Berger 等有一类以谱数据推进交错洗牌的路线。本篇的相关工作清单（`01:97-141`）未引用上述任何一条，且 Theorem 1.1 以自含链条主张 $O(d)$；[推测] 这可能意味着要么这些先前结果并非整排列律的 $O(d)$ 上界、要么本篇是首次给出可完整核验的证明，仅凭检索我分不清这两种情形。技术组合的文献位置按论文口径可归纳为：轨迹暴露（Morris 系）$\times$ 条件化矩界（本篇新件）$\times$ 钩支撑密度支配（Berele--Regev + CKR 的合成）$\times$ 亚调和迁移（经典工具的新用途）；四件各有出处、合成没有先例，这是 `01:132-141` 逐句可以让读者核到的最强自我定位。

**邻域边界声明**。队列里另有两篇 Thorp 主题论文（Compatibility entropy... 与 Routing densities...）我按纪律不假设其存在、不引用其结论，本笔记全部陈述只从本篇 tex 出发。我检查了已有笔记 `D35-最短公共超串的多项式时间二近似.md` 的全部节标题（grep '^## ' 共 20 节，从 lem:counts 到 prop:partition 词法）：该篇属组合词法线，无马尔可夫链谱隙段落，故混合时间线上没有需要划界的已写笔记。

## 10 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $d,N=2^d$ | 比特数、牌数 | 01:12 | Prop 1.2、Thm 1.1、07:44 分裂 | $N$ 非 2 的幂则比特分组与 $B_N$ 等同断裂 |
| $R$ | 2 的幂，硬要求 $\log R\ge4/e_0^2=4\times10^8$ | 03:4; 06:14-20 | $z_{\rm cmp}>0$、支分、连续性有限性、一切 $o_R(1)$ 吸收 | 减小则 06:22-26 allowance 链与 04:129 的 $s^{o(1)}$ 淹没失效 |
| $\ell=\log_2R$ | 每线比特数 | 07:44 | $d=b\ell+t$ 分组 | $R$ 非 2 的幂则无线比特模型 |
| $m_j\in[R,R^2]$，$b\le\log s/\log R$ | 线尺寸、坐标数 | 03:5-7; 06:22 | $\max m_j\le s^{2/b}$ (04:106)、$[\tfrac15,\tfrac45]$ 分裂 (06:107) | 区间加宽则 √5/2−1 储备被吃、$s^{2/b}$ 支界崩 |
| $L_m(z)=(1-z)U_m+zB_m$ | 线律 | 03:13-16 | 全篇 | $z=1$ 恰是二元扫描，条件证明只在 $z\le z_{\rm cmp}$ 活 |
| $A_R$ | $\max m!B_m(g)\ge1$ | 03:27 | $z_{\rm cmp}$ | 无限线尺寸集则 $\sup=\infty$、$z_{\rm cmp}=0$ |
| $z_{\rm cmp}(R)=\min\{1/2,1/(A_R+1)\}$ | 正、依赖 $R$ | 03:28-29 | `ac:eq:3` 双边比较 | 任一半改动则 4 倍系数与 $1/2$ 底边失去 |
| $z_*$ | $>0$，取 $\le\min\{z_{\rm cmp},z_{\rm sp},\text{base}\}$ | 06:28-29 | Thm 3.1、07:21 的 $v<z_*$ | 增到 $\ge1$ 则 sparse 支比较前提消失 |
| $a=1/100$ | 固定 | 03:149 | $\theta=a/16$、$p=\lfloor s^a\rfloor$、$s^{1-a/4}$、$a/50$、$a/2$ | 指数互让格局 $a/50<a/2$、$\theta<a/4$ 全要重排 |
| $c_0=e_0=a/100=10^{-4}$ | 固定同值 | 03:149 | $c(s),e(s),K_0=10/e_0,\log R$ 门槛 | 改异则 06:414 合并系数 $c_0+e_0$ 不再等于 $a/50$ |
| $c(s)=c_0+1/\sqrt{\log s}$；$e(s)=e_0-1/\sqrt{\log s}$ | 单调趋常数 | 03:150-151 | `ac:eq:15`、$c_*,e_*$ 储备 | 符号反向则子网格归纳利息为负 |
| $q$ | 整数 $\ge\lceil2/\rho\rceil$；Lean 实值 $65536000000$ | 06:11-13 | $2q\rho\ge4$ (06:64)、循环 $2q$ 边、$a_0=c_0/(2q)$ | 减小则 $-3F$ 步断；增大则 $g\downarrow$、$w\uparrow$ |
| $T_\lambda^{\mathcal H}=\lVert K_\lambda^{\mathcal H}\rvert _{2q}^{2q}$ | 未归一化 | 03:130-134 | 全篇 | 归一化版会重写 06:64 与 07:51 的幂账  |
| $\phi_m(u)=\log m^u/(m)_u\in[0,u]$；$C(\mathcal H)\in[0,bh]$ | 线代价 | 03:63-80 | `ac:eq:4`、06:22-26 | 换常数界则势能望远镜不闭合 |
| $\theta=a/16=1/1600$；$K_0=10/e_0=10^5$ | Lean 同值 1/1600、100000 | 06:8-9; SparseBound.lean:34-35 | 假设 `ac:eq:5`、$B_0$ | 放宽 $\theta$ 则 $h+k\le s^{1-\theta}$ 覆盖不到大 $F$ 补集 |
| $\rho$ | 公式值 $\min\{\theta/32,\beta/4\}=1/163840000$；Lean 保守实值 $1/32768000000$ | 04:370; SparseBound.lean:38 | $q$（$2q\rho\ge4$）、`ac:eq:6` | 减小则 $q$ 必须同步增大、$a_0$ 恶化 |
| $B_0=\lceil8/\theta\rceil=128$ | 均匀化常数 | 04:27 | 支划分、$\xi=1/(10B_0)=1/1280$ | 8 若减小则 $2/b<\theta/4$ 不成立 |
| $\eta=s^{-\xi}$ | light 判据 $h_L+t_L\le\lvert L\rvert\eta$ | 04:137-144 | `ac:eq:11` 的 $\eta^{u/2}$、矩有限性 | $\xi$ 若超过 $\theta/80$ 则 04:261-263 三个小量失控 |
| $\nu=\theta/(100B_0)=1/20480000$；$\beta=\min\{\xi/4,\nu/2\}$ | | 04:310,359 | `ac:eq:12`、$\rho$ | 折扣 100 若减则三项 $2^k$、阶段和、集数吃光储备 |
| $p=\lfloor s^a\rfloor$ | $s^{0.01}$ 阶 | 06:83 | 密度代价 $p^2\log(s+1)$、$F(\delta)$ 的 hook $\le2s/(p+1)$ | $p$ 指数 $<a/50$ 量级则 06:428-429 括号付不起 |
| $\widehat c,\widehat e$ | $c,e$ 各挪 $\pm1/(20\sqrt{\log s})$ | 06:84-86 | 声明 (21)、利息核算 | 挪超过 $(\sqrt5/2-1)/\sqrt L$ 则合成处 $c_*-c(s)$ 变负 |
| $s^{9/10}$ | 声明 (21) 的误差预算 | 06:96 | 由 $(\widehat c-c)F\ge s^{1-a/4}/(20\sqrt{\log s})$ 吞并 (06:432-438) | 预算抬过 $s^{1-a/4}$ 门槛则大维数区收尾断 |
| $[\tfrac15,\tfrac45]$ | 分裂比 $\sqrt5/2-1$ | 06:107,291-295 | $\widehat c,\widehat e$ 的存在 | 区间失衡则利率归零 |
| $k=\lvert\delta\rvert$ | 阈值 $s^{1-a/2}$ | 06:428 | $F(\delta)\ge k(\tfrac a2\log s-\log2e)$ 分支 | 阈值挪动则两分支之一两头亏 |
| $a_0=c_0/(2q)$ | Lean 尺度 $\approx7.6\times10^{-16}$ | 07:4 | $A=a_0\log D_\lambda$、$g=a_0G(1)$ | 任何 $q$ 增大线性侵蚀最终 $g$ |
| $\kappa<1$；$r$ | 有限集上最大非平凡线平均范数；$r=2$（$\kappa=0$）或 $1<r<\kappa^{-1}$ | 07:10,17 | $\Omega$、盘界 | $\kappa\to1$ 则环带塌缩、$u<v$ 选不出 |
| $u,v$；$\varepsilon_0$ | $0<u<v<\min\{z_*,1,r-1\}$；$\varepsilon_0\le1/\sup_{[u,v]}G$ 型 | 07:21-26 | $G\le0$ 于圆周、$G\le1$ 于缝、$G(1)>0$ | 缝若含 1 则 $G(1)$ 不定号、迁移归零 |
| $g=a_0G(1)$ | 绝对、随网格与 $\lambda$ 一致 | 07:39-42 | Thm 1.1、$\beta$ | 论文未给显数值：$G$ 经 $\varepsilon_0,R,q,z_*,\kappa$ 链条，可算未算 [推测] 属故意留白 |
| $w$；$\beta=2gw-2$ | 绝对整数，$2gw-2>\max\{\log2/\log3,\log2/c_{\rm dim}\}$ | 07:58,69-70 | $wd$ 物理步 | $g$ 减半 $w$ 约翻倍，$O(d)$ 阶不毁、常数爆 |
| $c_{\rm dim}$ | 绝对、论文未给值（02:79-101 存在式） | 02:81-101 | 稀疏区入口、07:65-67 第二段和 | 其值进入 $\log2/c_{\rm dim}$ 阈值；Lean 用实常数 4 替代（Main.lean:44） |
| $t_{\rm mix}(d)$ 下界 $2d-O(1)$ | | 01:75-78 | 摘要的阶最优声明 | Stirling 段若挪则整除性小改 |

依赖链一节：真正单向的链是 $(\theta,K_0)\to\rho\to q\to R\to z_*\to(\kappa,r,u,v,\varepsilon_0)\to g\to w$（`06:8-29` 与 `07:42` 明文规定），所以 $O(d)$ 里的隐常数是 $w$，而 $w\asymp\max\{\log_2/\log3,\log2/c_{\rm dim}\}/(2g)$、$g=a_0G(1)$、$a_0=c_0/(2q)$：链上第一个爆炸点是 $q$（Lean 实例化到 $6.55\times10^{10}$），第二个是 $R\ge e^{4\times10^8}$，两者合起来使"固定次数扫描"的"固定"在数值上毫无感动性，阶却是对的。幂次区间的 2 的幂步长被三处同时消费：$z_{\rm cmp}$ 的有限性、$\{0,1\}^{\log_2m}$ 的比特模型、07:44 的比特分组；区间宽度 $[R,R^2]$（恰两倍）同时喂 $s^{2/b}$ 与 $[\tfrac15,\tfrac45]$。Schatten 指数 $2q$ 的双身位：在归纳里是循环迹边数，在迁移里是 $a_0$ 的分母；全文没有任何一处允许 $q$ 事后改小，Lean 里 $2q\rho=4$ 取到等号（`SparseBound.lean:38-39`），说明该参数已被钉到最低配置。

## 11 Lean 取证

检索轨迹（全部实跑）：`grep -n -i "thorp|sweep|shuffle" E:\math\lean\formalization.yaml` 命中本篇书目条目 `formalization.yaml:332-335` 与形式化条目 `formalization.yaml:1058-1060`（declaration `OAI.CoordinateSweeps.conditional_main`，file `OAI/Probability/CoordinateSweeps/Main.lean`，comparator `ComparatorChallenges/CoordinateSweeps.json`）；模块目录 16 个 `.lean` 文件、合计 9769 行（`find ... | wc -l`）。顶层声明实测 734 个：theorem 256、lemma 225、def 214、abbrev 20、noncomputable def 4、structure 7、instance 8（`grep -ho` 分型统计）。`sorry` 分布：16 个文件逐文件 `grep -c sorry` 全为 0；文件内无 `axiom` 声明（`grep -n "axiom"` 无命中）；comparator 允许公理清单仅 `propext, Quot.sound, Classical.choice`（CoordinateSweeps.json 的 permitted_axioms 字段）。tactic 频次实测：have 934、exact 418、apply 391、simp 357、positivity 131、norm_num 129、let 115、omega 85、linarith 85、nlinarith 62、calc 59、obtain 54、ring 50、show 41、refine 34、convert 25、gcongr 1。

被认证对象的形状：`ConditionalMain`（Conditioning.lean:1046-1051）为 $\exists r\,q\,zStar$，$1\le r$、$1\le q$、$0<zStar\le1/2$，对所有 `Allowed r` 网格（Grid.lean:263：每坐标比特数 $\in[r,2r]$，即论文 $R=2^r$、$m_j\in[R,R^2]$）、所有洞结构 `Holes h` 与可行证明、$z\in[0,zStar]$、所有 $\sigma:$`UnitaryIrrep H.stabilizer`，`logMoment (schattenMoment q ...) ≤ (-c·log dim + e·h·log size - cost : EReal)`。$a=1/100$、$c_0=e_0=a/100$、$c(s)=c_0+1/\sqrt{\log s}$、$e(s)=e_0-1/\sqrt{\log s}$ 逐字同文（Conditioning.lean:1035-1039）。`conditional_main`（Main.lean:454）前的 doc 注释（Main.lean:451-453）自报映射："Manuscript03 thm:conditional / ac:main, with c₀=e₀=a/100, a=1/100, natural logarithms, unnormalized integer Schatten moments, all feasible disjoint paths (including none and all), and log(0)=−∞"。

论文陈述与 Lean 陈述的错口，我分五类列全。第一类，覆盖面：`07-analytic` 整节未形式化。实测关键词计数（`grep -ric`，16 文件求和）：subharmonic 0、density 0、schur 0、weyl 0、overlap 0，thorp/mixing/totalvariation 亦 0。因此 Theorem 1.1、Proposition 1.2、$\kappa,r,G,g,w$ 与 Plancherel 求和全部在 Lean 之外；"$O(d)$ 混合"没有认证，只有条件定理被认证。第二类，路线替换：论文用 $S_{s-h}$ 的不可约 $\lambda$ 加参考槽集认同（02:16-22 的奇异值不变性为此保媒），Lean 直接以洞配置稳定子群的幺正表示 `UnitaryIrrep H.stabilizer` 为量化对象，认同问题被构造消音；`logMoment ≤ (· : EReal)` 把 $\log0=-\infty$ 编码进扩展实数。第三类，假设加强或削弱：$zStar\le1/2$ 是论文没有明文写出的附加性质（与 $z_{\rm cmp}\le1/2$ 相容，属存在性收紧，并非冲突）；$R$ 的"2 的幂"在 Lean 里体现为按比特数 $r\in\mathbb N$ 参数化；大 $R$ 的存在性由 `Main.lean:398-410` 的 `∀ᶠ atTop` 滤子论证供应（`exists_main_scale`），与论文"增大 $R$ 吸收误差"同构，都是存在，并非数值。第四类，常数实例化：`SparseBound.lean:34-39` 给出 $\theta=1/1600$、$K_0=100000$、$\rho=1/32768000000$、$q=65536000000$；$\theta,K_0$ 与论文公式 $\theta=a/16$、$K_0=10/e_0$ 精确吻合，$\rho$ 取公式值 $1/163840000$ 的约 $1/200$ 保守实例，$q$ 恰使 $2q\rho=4$ 取等，`Main.lean:44` 把论文 $c_{\rm dim}k\le F(\lambda)\le k\log l$ 的双边界实作为 `log dim ≤ k*log size ∧ k ≤ 4*log dim`，绝对常数 $1/c_{\rm dim}$ 被实例化为 4。第五类，中段装置换路：论文 Lemma 5.1 的带符号 Schur--Weyl 密度支配在 Lean 没有对应物（schur/weyl/density 全零命中），其职能被具体 Young 图模型 `shapeSubrep`/`hasShape`（Main.lean:116-118）加上显式 $p^2$ 型误差算术接管：`hook_auxiliary`（Main.lean:110-187）的误差项显式写成 $((2q+1)((A{+}B)(2p)^2+c_*(A{+}B)\cdot41p^2))\log(s{+}1)$（Main.lean:173-175），`Scales.lean:201-247` 的 `hook_comparison`、`hook_error_bound` 与 `eventually_absorb_hook` 做利率核对；`MomentBound`（Main.lean:100-103）是归纳谓词（指数实数版，`moment_le_exp_of_logMoment_le` 双向引理化，Main.lean:12-20）；Lemma 6.1 的接缝交叠没有独立认证名（overlap 0 命中），其内容并入 `Induction.lean` 的 `actual_hook_bound` 调用链（Main.lean:167）。钩外回收在 Lean 是 `removed_dimension_entropy`（Main.lean:209-214），条件里出现 `hL : 800 ≤ Real.log s` 与 $(a/4)k\log s\le F(\delta)$，对应论文 `06:420-427` 但系数 $\widehat c+\widehat e=a/50$ 被放大余量成 $a/4$ 的对比式。

## 12 最终思路与最初设想的差异，以及残余疑点

进场时我以为自己在读一篇谱隙论文，交稿时我手里是一篇"结构定理加解析延拓"论文。差异清单：其一，主定理的量化对象是一切可行条件族的条件矩界，Thorp 结论只是 $\mathcal H=\varnothing$ 加 $z:0\to1$ 的两步推论；我最初把 $\mathcal H$ 当作技术负担，最终它承担了归纳假设的全部强度。其二，混合时间结论 $t_{\rm mix}=\Theta(d)$ 的下界端没有用任何链式机器，只是支撑计数（Prop 1.2，七行证明），我最初以为下界会是对比/熵论证。其三，$z$ 参数在论文里是"证明用润滑剂、结论里不存在"的：条件证明只能活在 $[0,z_*]$，而 $z_*$ 从不显式；我最初计划里没有任何复分析，最终 $g=a_0G(1)$ 把一个对数位势线积分供成了全部常数里最抽象的一个。其四，$2q$ 指数同时是组合装置（循环迹）与分析装置（$a_0$ 分母），这种"一参两用"在我的初始设想里没有对应物，Lean 把 $2q\rho=4$ 钉成等号说明这个参数没有闲钱。其五，稀疏/大维数的两分不由维数大小直接给出，而由 `ac:eq:16` 失败加 $F<s^{1-a/4}$ 推出 $h\le K_0k$ 间接入场（`06:51-61`），即"条件密度高"与"维数小"在参数上是同一件事的两面，我进场时假设它们独立。

残余疑点我留五条。一，$R$ 的门槛 $\log R\ge4\times10^8$ 与 $\ell=\log_2R$ 耦合：$d$ 必须大到能按 $\ell$ 切分（`07:44` 的 $d\ge\ell$），[推测] $d_0$ 至少 $10^8$ 量级，任何有限牌堆验证都无望，这不影响定理但影响我把结论转述给谁。二，$G(1)$ 的数值从未被论文估计，$g$ 的可计算下界要过 $\varepsilon_0$ 的选取，[推测] 论文明确留白，因为只需正性。三，`01:89-95` 的固定 $d$ 收敛用 minorization，与 Theorem 1.1 第二句的 $w$ 次扫描 TV 收敛是两条独立通道；[推测] $w$ 次扫描自身是否对固定 $d$ 遍历，论文没有说，minorization 走的是"补恒等乘积"的另一幂。四，论文对 Chen--Louhichi/PSSV 一脉的沉默（第 9 节检索口径）让我无法在文献坐标里安放 Theorem 1.1 的优先权，这属于背景问题，并非证明问题。五，Lean 与论文在表示参数化上的错口（stabilizer 幺正表示对 $S_{s-h}$ 不可约）我核对了奇异值不变性通道（02:16-22），但 Lean 侧是否完整覆盖"平凡表示与 $h=s$ 条款"这两类量化边角，我只在 doc 注释层面（Main.lean:451-453 自报 including none and all 与 log(0)=−∞）验证，归一化的必然。把这一段我的理解变化按顺序记下：进场假设是筛；中段卡在"为什么真子集要留着"；出路是承认投影算子与求和顺序无关，先把核做大再投影，代价只是一枚 Hilbert--Schmidt 范数。

## 13 深读 06-induction 前 42 行：常数锁定的次序与两类自动情形

本轮把 06-induction.tex 开头逐字读第二遍。我原先把这段当成排版性的"先声明常数"，第二遍才承认它把全文的依赖方向钉死，且不允许反向。

顺序见 06-induction.tex:5--29：先定 $\theta=a/16$ 与 $K_0=10/e_0$ 交给稀疏引理，引理输出 $\rho$ 与 $R_0$；因为"$\rho$ 对充分大的 $R$ 一致"（06-induction.tex:9--10），才允许取整数 $q\ge\max\{1,\lceil 2/\rho\rceil\}$ 并附带 $2q\rho\ge4$（06-induction.tex:11--13）；$q$ 落定之后才"取充分大的 2 的幂 $R$"（06-induction.tex:14）；$R$ 落定之后才选 $z_*>0$，一次满足三件事：线比较、稀疏引理、基础情形（06-induction.tex:28--29）。我进场时想倒过来办：先按组合装置的需要定 $q$，我当时认定 $2q$ 只是循环迹的边数、属纯组合量，随后让 $\rho$ 去迁就它。这条路在我这里死掉的原因很直白，$\rho$ 是引理的结论、不接受外部指定，$q$ 只能等它；而 $2q\rho\ge4$ 是全文唯一把稀疏利率换算成维数折扣的地方（换算点在第 14 节讨论的那一行）。

$R$ 的地位恰好相反，它是全文唯一可以被反复抬高的参数。抬高至少三处：06-induction.tex:15 声明"下面所有充分大要求对 $s\ge R$ 一致成立"，06-induction.tex:27 明写"进一步增大 $R$ 会吸收下面出现的误差"，04-sparse.tex:140 在 $b\le B_0$ 分支又要求增大 $R$ 使 $\eta\le1/2$。抬 $R$ 的代价全部转嫁给 $z_*$ 与最终的 $g$，而 $R$ 自身不进结论，于是阶是对的、常数毫无感动性。$q$ 一冷、$R$ 一热，构成本篇的常数控件盘：前者只能等，后者可以无限赊。

$R$ 固定后立刻兑换两行不等式 $1/\sqrt{\log R}\le e_0/2$ 与 $1/\log R\le e_0/4$（06-induction.tex:17--21）。配合 $b\le\log s/\log R$ 与 $C(\mathcal H)\le bh$，得到 $c(s)\le2c_0$、$e(s)\ge e_0/2$，以及全文反复支取的那笔储备 $e(s)h\log s-C(\mathcal H)\ge(e_0/4)h\log s$（06-induction.tex:22--26）。我把分母上的 $4$ 记成利润留存率：$e(s)$ 先让掉一半，势能 $C(\mathcal H)$ 再从剩余里吃掉同量级一块，$(e_0/4)h\log s$ 是所有分支共同的现金，哪个分支把它花成负值就当场断在第 14 节那个链条的中段。

两个自动情形我原先都当成平凡边角，重读才知它们是归纳的地基，并非装饰。第一，$F(\lambda)=0$ 时条件平均是压缩（06-induction.tex:31--32），矩因此 $\le1$，上面那笔正储备直接给出结论；这一条覆盖空格图、$M=1$ 与所有一维类型，零矩按约定 $\log0=-\infty$ 记账（06-induction.tex:34--35）。第二，$b=1$ 且 $z=0$：对指定赋值条件化之后剩下的是一枚均匀双射，任何非平凡平均为零（06-induction.tex:37--39）。$z$ 方向的正性靠"$R$ 固定后只有有限多个单坐标网格、路径族与表示，其条件算子在零处连续"（06-induction.tex:39--42），缩小 $z_*$ 即得公共区间上的基础情形。连续性论证只在 $R$ 固定之后才合法，有限性本身依赖 $R$：这是同一顺序的第二处咬合，也解释了稀疏引理为何把结论里的正性写成 $R$ 的函数 $z_{\rm sp}(R)$（04-sparse.tex:12）。

## 14 深读 06-induction 44--75：稀疏区入场券与 $-3F$ 那一步的账

第 13 节的储备就位后，正文给出第一个自动豁免：$b\ge2$ 时用压缩界 $T_\lambda^{\mathcal H}\le D_\lambda$，只要 $(1+c(s))F(\lambda)\le e(s)h\log s-C(\mathcal H)$ 成立，目标不等式就免费（06-induction.tex:44--50，即声明 `ac:eq:16`）。剩下要干活的是它的反面。我原先以为分叉在 $k$ 或 $h$ 的大小上，逐字读到 06-induction.tex:51--61 才明白入场条件是"(16) 失败 且 $F(\lambda)<s^{1-a/4}$}"这一对，$h\le K_0k$ 是推论、是入场券的副产物，这正是第 12 节差异清单第五条的算术出处。

失败方向的不等式给出 $(1+c(s))F>e h\log s-C\ge(e_0/4)h\log s$，于是 $h\log s\le 4(1+c(s))F/e_0$。用第 13 节的 $c(s)\le2c_0$ 与 $c_0=e_0=10^{-4}$，右边系数是 $4.0008\times10^{4}$；正文写的却是 $h\log s\le K_0F(\lambda)$，而 $K_0=10/e_0=10^{5}$（06-induction.tex:8 与 06-induction.tex:53--54）。差额 $10$ 对 $4.0008$，约 $2.5$ 倍余量。[推测] 这里留 $2.5$ 倍是为了让 $K_0$ 可以原样喂进稀疏引理而不必再带 $c(s)$ 的修正项，正文没有解释这个 $10$，我按"免检余量"记账，不敢说它是刻意设计。

同一句还顺手给 $M=s-h\ge s/2$（06-induction.tex:53--54）：$h\le K_0F\le K_0s^{1-a/4}$ 对 $s\ge R$ 是 $o(s)$，所以剩下的自由槽位与 $s$ 同阶。接着置 $k=\min(M-\lambda_1,M-\lambda'_1)$，用第 2 节的维数估计 $c_{\rm dim}k\le F(\lambda)\le k\log s$（06-induction.tex:54--56）。左半边把 $h\log s\le K_0F$ 换成 $h\le K_0k$，右半边留到后面付 $-3F$。再要 $h+k\le s^{1-\theta}$，正文只交代"for large $R$ ，because $\theta=a/16<a/4$"（06-induction.tex:57--61）；我的补账是 $k\le F/c_{\rm dim}\le s^{1-a/4}/c_{\rm dim}$，故 $h+k\le(K_0+1)c_{\rm dim}^{-1}s^{1-a/4}$，把 $c_{\rm dim}$ 与 $K_0+1$ 咽下去正好需要 $a/4$ 与 $\theta$ 之间那 $1/4$ 的间距，这就是 $\theta$ 取 $a/16$（比 $a/4$ 再小四倍）的真实用途。[推测] 正文没写这一步的账，属可核未核。另外 $k\ge1$ 由 $F(\lambda)>0$ 得到（06-induction.tex:60--61），这一枚下限是稀疏引理假设里的整数条件，缺它整段引用不合法。

此后引理直接给算子范数折扣，$D_\lambda$ 枚奇异值一起入账，得 $\log T_\lambda^{\mathcal H}\le F(\lambda)-2q\rho k\log s\le-3F(\lambda)\le-c(s)F(\lambda)+e(s)h\log s-C(\mathcal H)$（06-induction.tex:62--68）。中间那一跳我才看清 $2q\rho\ge4$ 的真正消费者：由维数估计右半边 $F\le k\log s$，$F-2q\rho k\log s\le(1-2q\rho)F\le-3F$，第 11--13 行制造的不等式在 fifty 行之后一行用尽，全文最紧的一处耦合就在这里，没有任何闲钱可以再压 $q$。最后一跳用 $c(s)\le2c_0\ll3$ 与第 13 节那笔非负储备，两处都免费。稀疏区到此结清（06-induction.tex:69），剩下的只有大维数区 $F(\lambda)\ge s^{1-a/4}$（06-induction.tex:71--75，即声明 `ac:eq:17`）。我把三态关系重画一遍：免费区（16 成立）、稀疏区（16 失败且 $F<s^{1-a/4}$，走第 14 节五步）、大维数区（$F\ge s^{1-a/4}$，走后续 hook 与逐点回收），三者以 $F$ 相对 $h\log s$ 的比为唯一坐标，$k$ 只在中间那态里出现。

## 15 深读 04-sparse 5--51：交错放置核 $Q$ 的真实身份是一枚投影

稀疏引理的陈述见 04-sparse.tex:9--25：对每个 $0<\theta<1$ 与 $K_0\ge1$，存在 $\rho>0$ 与 $R_0$，使每个 2 的幂 $R\ge R_0$ 都能选配 $z_{\rm sp}(R)>0$；对允许网格与指定族 $\mathcal H$，若整数 $k\ge1$ 满足 $h\le K_0k$ 与 $h+k\le s^{1-\theta}$（04-sparse.tex:14--17，声明 `ac:eq:5`），且 $\lambda\vdash M=s-h$ 满足 $\lambda_1=M-k$ 或 $\lambda'_1=M-k$，则对一切 $z\in[0,z_{\rm sp}(R)]$ 有 $\lVert K_\lambda^{\mathcal H}\rVert_{\mathrm{op}}\le s^{-\rho k}$（04-sparse.tex:18--24，声明 `ac:eq:6`）。假设只约束 $(h,k)$ 与"首行或首列到边界的距离"，对 $\lambda$ 其余部分一字不提，这就是它能被 06-induction.tex:61 当黑箱整块引用的原因；我一开始担心它隐含要对 $\lambda$ 的形状做额外控制，读完陈述就放下了。

开篇两句交代双线策略：行情形用交错放置核，列情形用同一放置表示按符号扭转（04-sparse.tex:5--7）。证明第一句把参数 $B_0=\lceil 8/\theta\rceil$ 拍在桌上（04-sparse.tex:27），分 $b>B_0$ 与 $b\le B_0$ 两条路；前者只用线比较 `ac:eq:3`，后者先在 $z=0$ 上做、$R$ 固定后用连续性（04-sparse.tex:27--31）。$B_0$ 的具体用途在第 16 节那条 $2/b<\theta/4$ 上，取 $8/\theta$ 的天花板让 $b>B_0$ 时 $2/b$ 自动小过 $\theta/4$，这是同一个常数的第二次上岗。

核的定义在 04-sparse.tex:33--40：对输入与输出的 $k$-放置 $x,y$，记 $p_A(x_A,y_A)$ 为标签集 $A\subseteq[k]$ 那些路径的条件概率、$p_\varnothing=1$，令
$$Q(x,y)=s^{-k}\sum_{A\subseteq[k]}(-1)^{k-\lvert A\rvert}s^{\lvert A\rvert}p_A(x_A,y_A).$$
我最初把这枚求和读成对 $k$ 条路径相互碰撞的容斥筛（它的形状实在太像），读了 04-sparse.tex:41--49 三遍才改口：符号的作用在表示论一侧，筛的工作另有其人（04-sparse.tex:55--56 的概率为零与 04-sparse.tex:114--118 的配对消项）。理由逐字如下：$A=[k]$ 那一项是完整放置转移核；真子集 $A$ 对应的算子值域落在"放在 $|A|$-放置上的函数之拉回 $y\mapsto f(y_A)$"张成的子表示里，而按第 2 节的分支规则，该子表示只含首行 $\ge M-\lvert A\rvert>M-k$ 的类型（04-sparse.tex:41--46），$\lambda$ 的首行恰在 $M-k$，故向类型 $\lambda$ 投影时每个真子集项都被杀；完整放置表示含有 $[\lambda]$，幸存的那一块正是 $K_\lambda^{\mathcal H}$ 的一份复制（04-sparse.tex:46--48）。于是 $\lVert K_\lambda^{\mathcal H}\rVert_{\mathrm{op}}\le\lVert Q\rVert_{\mathrm{HS}}$（04-sparse.tex:48--49）：先取块、再放大到 Hilbert--Schmidt，两步都是收缩方向，一步不亏。

系数 $s^{\lvert A\rvert}$ 我单独记一笔账。每个子集项按"它放弃约束的槽位数"乘上 $s$ 的相应幂，04-sparse.tex:50--51 明文说这个尺度是为了抵销"某条路径各阶段直线都不被其余约束触碰时，它的转移概率恰为 $1/s$"。这句话在此处只是预支，真正兑现要在 04-sparse.tex:114--118；我原先按容斥读的时候完全解释不了为什么是 $s^{|A|}$，改成投影读以后它就成了归一化的必然。把这一段我的理解变化按顺序记下：进场假设是筛；中段卡在"为什么真子集要留着"；出路是承认投影算子与求和顺序无关，先把核做大再投影，代价只是一枚 Hilbert--Schmidt 范数。

## 16 深读 04-sparse 53--130：有放回抽样把约束计数换成恒等式

第 15 节把目标换成 $\lVert Q\rVert_{\mathrm{HS}}$，接下来全文最漂亮的一步是 04-sparse.tex:62--77 的"扩展再加有放回"。先把粗界交代清楚：若 $A$ 的路径把 $\mathcal H$ 增广成不相交族 $\mathcal H_A$，用线代价估计 `ac:eq:4` 与 $C(\mathcal H_A)\le b(h+\lvert A\rvert)$ 得粗界，非法子集概率为零，对 $A$ 求和即 $|s^kQ(x,y)|\le 2^k\exp\{bh+(1+\log 4)bk\}$（04-sparse.tex:53--60，声明 `ac:eq:8`）。

然后是恒等式：当任一端点数组未能注入其可用槽位时，把 $Q$ 按零延拓；在端点放置上保留交错公式原样，即便 $k$ 条路径在中途某层相撞也不改公式；再让所有输入与输出槽位从全网格 $\Omega$ 独立均匀有放回地采样。于是 $\lVert Q\rVert_{\mathrm{HS}}^2=s^{-2k}\sum_{x,y\in\Omega^k}|s^kQ(x,y)|^2=\mathbb E_{\mathrm{full}}|s^kQ(x,y)|^2$ 成为精确等号（04-sparse.tex:62--72）。我最初的算盘是直接在对端点的受约束分布里数 $Q$ 的支撑，读到这里意识到那会把路径间的相交条件全部混进测度，独立性无从下手；零延拓的代价只是把"非法"搬进被积函数，换来 04-sparse.tex:73--77 说的：任意采样端点对按第 3 节的逐层公式决定一条辅助轨迹，在固定层其槽位在 $\Omega$ 上均匀，不同粒子之间独立，而条件洗牌概率仍留在 $Q$ 内部。粒子之间的独立与洗牌概率的耦合被彻底分开了，这是整篇稀疏证明的支点。

共享被分成两类：同一层的同槽，或同一阶段的同线。设 $\omega$ 控制一枚独立粒子与任一固定轨迹共享的概率，把粒子与洞都当顶点、每次涉及粒子的共享连一条边。引理内容是：若至少 $w$ 枚粒子与边相入，则该图含一片至少 $\lceil w/2\rceil$ 条边、粒子尾互异有向森林。证明在 04-sparse.tex:84--89：碰到洞的分量里让每枚粒子指向离最近洞更近一格的邻点，距离沿边递减故成以洞为根的森林且每枚粒子都是尾；只含粒子的分量若有 $v\ge2$ 枚相入顶点，一棵有根生成树给出 $v-1\ge v/2$ 枚粒子尾。这片森林的计数在 04-sparse.tex:91--102：固定 $j$ 条边的有向森林，先条件化除叶粒子外所有路径，其父已定、共享事件概率 $\le\omega$ 且不再涉及其余边，逐片剥叶得概率 $\le\omega^j$；尾与父的选法至多 $\binom{k}{j}(k+h)^j$；取 $r=(k+h)\omega\le1$ 即得 $\sum_{j=\lceil w/2\rceil}^{k}\binom{k}{j}r^j\le2^kr^{w/2}$（声明 `ac:eq:9`）。我核对自认为可省的 $\lceil w/2\rceil$ 折半，其实来路就是那个 $v-1\ge v/2$：无洞分量必须交出近一半的边数，这是本篇为"路径可能自成闭环"付的固定税。

$b>B_0$ 分支把共享定义为同阶段直线（04-sparse.tex:104--112）：一枚粒子在阶段 $j$ 用定线的概率是 $m_j/s$，故 $\omega\le b\max_jm_j/s$；用 $\max_jm_j\le s^{2/b}$ 得 $(k+h)\omega\le b\,s^{-\theta+2/b}\le s^{-\theta/2}$，其中 $2/b<\theta/4$ 由 $b>B_0=\lceil 8/\theta\rceil$ 直接兑现，$b\le s^{\theta/4}$ 则由 $s\ge R^b$ 抬高 $R$ 后一致成立。$B_0$ 的两副面孔至此齐了：第 15 节里它划开"用不用线比较"，这里它保证 $2/b$ 足够小。

收尾的消项在 04-sparse.tex:114--130：若某条路径不与别的粒子路径或洞共享任何阶段直线，把它加进任一子集只会让该子集的转移概率乘 $1/s$，其直线独立于其余约束、逐槽用均匀边际；子集概率为零时结论照样成立。于是 `ac:eq:7` 里配对项相消，$Q\ne0$ 要求全部 $k$ 枚粒子都被线共享相入。取 `ac:eq:9` 的 $w=k$ 再配 `ac:eq:8`，得 $\Pr_{\mathrm{full}}(Q\ne0)\le2^ks^{-\theta k/4}$ 与 $\lVert Q\rVert_{\mathrm{HS}}\le2^{3k/2}e^{bh+(1+\log4)bk}s^{-\theta k/8}\le s^{-\theta k/16}$。我把这笔指数账拆开验证：$s^{-\theta k/8}$ 是概率的平方根，$2^{3k/2}$ 是 $2^{k/2}\cdot2^k$，前者来自平方根、后者来自元界；最后一步要用 $h\le K_0k$ 与 $b/\log s\le1/\log R$（04-sparse.tex:129--130），也就是要求 $\log R$ 大到能把 $2^{3/2}e^{(K_0+1+\log4)b}$ 咽进 $s^{\theta k/16}$。θ 在这一串里被连砍三刀：$\theta/2$ 来自 $r$，$\theta/4$ 来自森林，$\theta/8$ 来自平方根，$\theta/16$ 是入账利率。此后 $K_0$ 与 $\theta$ 进入 $R$ 的门槛，与 06-induction.tex:8 的 $\theta=a/16$ 首尾相接。

## 17 深读 04-sparse 132--321：$b\le B_0$ 的 light 线、good 粒子与 gamma 倾斜

坐标数有界时一根线可以占去网格的可观比例，许多路径共享同线成为常态，直线共享的计数报废。正文的替代方案在 04-sparse.tex:132--146：在 $z=0$ 上工作，置 $\xi=1/(10B_0)$、$\eta=s^{-\xi}$，抬 $R$ 使 $\eta\le1/2$（04-sparse.tex:137--140）；对任一端点数组，记 $t_L$ 为其 $k$ 条辅助路径用线 $L$ 的条数（不管是否联合可行），称 $L$ 为 light 当且仅当 $h_L+t_L\le|L|\eta$；一枚粒子 good 当且仅当其路径每根线都 light 且它在任何层不与别的粒子或洞共槽，$G$ 是 good 粒子的集合。我原先猜测这里要重新设计核，读完确认核还是同一枚 $Q$，换的是"元界"与"支撑概率"两笔账的算法。

元界是 $|s^kQ|\le\exp(O(b(k+h)))\eta^{|G|/2}$（04-sparse.tex:146--150，声明 `ac:eq:10`）。证明分四层，我按顺序复述以免自己日后误记。第一层：零延拓之外立即成立，于是只看原放置矩阵的元；对路径逐层与 $\mathcal H$ 相容的子集 $A$，均匀条件线律给出 $s^{|A|}p_A(x_A,y_A)=\prod_L m^{v_L(A)}/(m-h_L)_{v_L(A)}$，$m=|L|$，非法 $A$ 概率为零、该乘积不形成（04-sparse.tex:151--161）。第二层：因 good 路径不共层槽，$J\cup S$ 合法当且仅当对每个 $J\subseteq[k]\setminus G$ 与 $S\subseteq G$ 有 $J$ 合法，故可按 $J$ 归组、在成线因子之前丢掉所有非法 $J$；对合法 $J$ 记 $r_L(J)$ 并令 $D_J=\prod_{L\text{ non-light}}m^{r_L(J)}/(m-h_L)_{r_L(J)}$，再用第 3 节 $\phi_m$ 的界得 $\log D_J\le\sum_L\phi_{|L|}(h_L+r_L(J))\le b(h+|J|)$（04-sparse.tex:163--184）。第三层是我最想学的一手：在每根 light 线上置 $W_L=m/Z_L$，$Z_L$ 相互独立、服从形状 $m-h_L+1$、速率为 1 的 gamma 分布，由 $\mathbb E Z^{-v}=\Gamma(\alpha-v)/\Gamma(\alpha)$（$0\le v<\alpha$，积分 gamma 密度即得）推出 $\mathbb E W_L^v=m^v/(m-h_L)_v$，light 性恰好保证这些矩有限（04-sparse.tex:186--194）。于是对 good 路径做交错后得到精确表达式 $s^kQ(x,y)=\sum_{J}(-1)^{k-|J|-|G|}D_J\,\mathbb E[\prod_{L\text{ light}}W_L^{r_L(J)}\prod_{i\in G}(\prod_{j=1}^bW_{L_j(i)}-1)]$，注意同一根 light 线被多条路径共用时是同一个变量，独立性只在线之间可得，粒子因子之间没有（04-sparse.tex:196--208）。第四层是密度倾斜：对 $u+v\le t_L$ 有 $\mathbb E W_L^v|W_L-1|^u\le C_1^{u+v}\eta^{u/2}$（04-sparse.tex:210--217，声明 `ac:eq:11`），其中 $Z'$ 形状 $n=m-h_L+1-u-v$；light 性给出 $n\ge m(1-\eta)+1>0$ 与 $m^{u+v}/(m-h_L)_{u+v}\le(1-\eta)^{-(u+v)}\le2^{u+v}$（04-sparse.tex:219--224）；gamma 的中心化矩母函数是 $e^{-nt}(1-t)^{-n}$，$|t|\le1/2$ 时对数 $\le Cnt^2$，Chernoff 给 $\Pr(|Z'-n|>x)\le2\exp[-c\min\{x^2/n,x\}]$，积分尾部得 $(\mathbb E|Z'-n|^u)^{1/u}\le C(\sqrt{nu}+u)$；再由 $u/m\le\eta$、$\lvert1-n/m\rvert\le\eta+1/m\le2\eta$ 三角不等式收住 $C'\sqrt\eta$（04-sparse.tex:225--240）。

支撑概率那笔账在 04-sparse.tex:242--312。逐 good 路径按阶段望远：$\prod_jW_{L_j(i)}-1=\sum_{a}(W_{L_a(i)}-1)\prod_{j<a}W_{L_j(i)}$，展开项里 $u_L$ 数差分因子、$v_L$ 数未差分因子，$\sum_Lu_L=|G|$、$u_L+v_L\le t_L$，线间独立与 `ac:eq:11` 给出单项 $\le C_1^{bk}\eta^{|G|/2}$，望远选法 $b^{|G|}$、合法 $J$ 选法 $2^{k-|G|}$，配上 $D_J$ 就是 `ac:eq:10`（04-sparse.tex:242--254）。数 good 粒子时概率仍指有放回的全网格采样、洞固定；稀疏假设与 $\xi=1/(10B_0)\le\theta/80$ 给出 $(b+1)(k+h)/s\le s^{-\theta/2}$ 与 $2h/(s\eta),2k/(s\eta)\le2s^{-(\theta-\xi)}\le s^{-\theta/2}$（04-sparse.tex:256--265）。若 $|G|<k/2$，则要么至少 $k/4$ 枚粒子共层槽（用 `ac:eq:9`，$\omega=(b+1)/s$），要么至少 $k/4$ 枚用非 light 线；后者里有某阶段在非 light 线上有至少 $k/(4B_0)$ 枚，每根这样的线满足 $h_L>m_j\eta/2$ 或 $t_L>m_j\eta/2$，故一类至少接到 $a_k=k/(8B_0)$ 枚（04-sparse.tex:267--273）。占据界分别是 $2^k(2h/(s\eta))^{a_k}$ 与 $2^k(2k/(s\eta))^{a_k}$，后者还要对至多 $(s+1)^{r_j}$ 个固定线集求和，$r_j=\lfloor2k/(m_j\eta)\rfloor$；三事件合并见 04-sparse.tex:275--292 的显式三项和，阈值取上不改变底数在 $[0,1]$ 内的幂（04-sparse.tex:293--294）。省下的账在 04-sparse.tex:296--307：$m_j\ge s^{1/(2B_0)}$、$m_j\eta\ge s^{2/(5B_0)}$、$r_j\log(s+1)/(k\log s)\le2s^{-2/(5B_0)}\cdot\log(s+1)/\log s=o_R(1)$；顶点项省 $(\theta/16)k\log s$，每根非 light 线项省 $(\theta/(16B_0))k\log s$，抬 $R$ 后得 $\Pr_{\mathrm{full}}(|G|<k/2)\le s^{-\nu k}$，$\nu=\theta/(100B_0)$（04-sparse.tex:308--312，声明 `ac:eq:12`）。最后合流：$|G|\ge k/2$ 上用 `ac:eq:10` 得元界省 $s^{-\xi k/4}$，补集上用 `ac:eq:8` 加 `ac:eq:12` 的平方根，$\lVert Q\rVert_{\mathrm{HS}}\le\exp(O(b(k+h)))(s^{-\xi k/4}+s^{-\nu k/2})$（04-sparse.tex:313--321）。这里 $\xi$ 与 $\nu$ 的关系值得记：$\nu=\xi/10$，折扣更差，所以它进补集项的平方根；两把利率谁强谁弱决定 $\beta=\min\{\xi/4,\nu/2\}$ 的取法（04-sparse.tex:358--360），我读到这里确认 $\min$ 的两支各对应一条事件，谁都不许省过头。

## 18 深读 04-sparse 323--388：列情形整块归零与常数字付的顺序

列类型 $\lambda'_1=M-k$ 的处理在 04-sparse.tex:323--356，我原先准备读一整段重复的行论证，结果读到的是一个更强的结论：带符号的放置核元在相关参数范围里逐元素为零（04-sparse.tex:355--356）。机制值得单独记。$k$-放置表示按符号扭转后含 $[\lambda]$，其元是 $\operatorname{sgn}(g)\mathbf 1_{\{g(x)=y\}}$ 对剩余双射 $g$ 的条件平均（04-sparse.tex:325--329）；全路径族非法的元为零，合法元则对全部 $h+k$ 条路径条件化（04-sparse.tex:329--330）。关键的分解在 04-sparse.tex:332--339：每根线上把指派路径按输入与输出同序排在前面、未指派 site 跟在后面，删去固定指派后留下残余双射，与原槽位序的比较只贡献一枚确定符号；对每条线做此事再逐阶段合成，剩余双射的符号就等于固定因子乘上各线残余符号之积，而条件化之后的线相互独立。结论于是收缩成"找到一根残余符号均值为零的线"。

两根分支各自给出那根线。$b>B_0$ 时 $s/\max_jm_j\ge s^{1-2/b}>s^{1-\theta}\ge h+k$（04-sparse.tex:341--344），每个阶段的线数多于路径数，于是存在一根未被 $h+k$ 条路径中任何一条触碰的线，其残余律是 $L_m(z)$、期望符号为零（04-sparse.tex:345--346）。$b\le B_0$ 且 $z=0$ 时固定任一阶段 $j$，未指派 site 数满足 $s-h-k\ge s(1-s^{-\theta})>s/m_j$，条件是 $R^{-\theta}+R^{-1}<1$；该阶段共 $s/m_j$ 根线，故有一根线至少两个未指派 site，均匀条件律下它在两个未指派 site 集之间是均匀双射，期望符号为零（04-sparse.tex:347--356）。这里的对比让我改了自己一个判断：列情形根本没有"稀疏折扣"，它是精确归零，行情形才付利息；这也说明 04-sparse.tex:5--7 那句"同一放置表示按符号扭转"承担了多少重量。

常数兑现段 04-sparse.tex:358--388 把第 13 节抱怨过的顺序问题正面回答了一次。置 $\beta=\min\{\xi/4,\nu/2\}>0$，有界坐标的行估计至多 $2e^{Cb(1+K_0)k}s^{-\beta k}\le s^{-\beta k/2}$，靠 $b/\log s\le1/\log R$（04-sparse.tex:358--364）；列算子在 $z=0$ 为零，多坐标行估计至多 $s^{-\theta k/16}$，列算子在 `ac:eq:3` 成立时为零，于是
$$\rho=\min\{\theta/32,\beta/4\}>0$$
在 $R$ 之前选定，再取充分大的 $R_0$ 使前面所有估计成立（04-sparse.tex:365--372）。两个分母的 $32$ 与 $4$ 是利率的两次对折：$\theta/32$ 相对 $s^{-\theta k/16}$ 留出一半余量给前置常数，$\beta/4$ 相对 $s^{-\beta k/2}$ 同理。$R\ge R_0$ 时有界坐标在 $z=0$ 的界对 $s^{-\rho k}$ 呈严格余量（04-sparse.tex:373--374），而固定 $R$ 后 $b\le B_0$ 只有有限多个允许网格（$s\le R^{2B_0}$）、有限多可行路径族、整数 $k$ 与分拆；每枚条件算子是线概率的有限表达式，其条件化分母在 $z=0$ 为正，故在该点连续，严格余量加有限性给出 $\delta(R)>0$ 使 `ac:eq:6` 对 $0\le z\le\delta(R)$ 成立；最后 $z_{\rm sp}(R)=\min\{\delta(R),z_{\rm cmp}(R)\}>0$，多坐标证明在整个区间上由 `ac:eq:3` 适用，覆盖一切 $b$（04-sparse.tex:376--387）。$z_{\rm cmp}$ 在此第二次上岗，与 06-induction.tex:28--29 选 $z_*$ 时列的三件事一致；我原先以为 $\delta(R)$ 与 $z_{\rm cmp}(R)$ 是两把互不相干的保险，读完确认它们是同一条线比较假设的两个使用者。

## 19 深读 06-induction 80--240：声明 (21) 的利息设计与接缝三因子

hook 估计那一段我读了三遍才把利率的出处对上。设定在 06-induction.tex:80--102：$p=\lfloor s^a\rfloor$，$\widehat c=c(s)+1/(20\sqrt{\log s})$，$\widehat e=e(s)-1/(20\sqrt{\log s})$；对少坐标归纳假设下，声称当前网格上任何 $h'$ 条指定轨迹族 $\mathcal H'$（逐层槽位互异、满足第 3 节的坐标规则）与任何 $(p,p)$-钩图 $\gamma\vdash s-h'$ 满足 $\log T_\gamma^{\mathcal H'}\le-\widehat cF(\gamma)+\widehat e h'\log s-C(\mathcal H')+s^{9/10}$（06-induction.tex:93--98，声明 `ac:eq:21`）。06-induction.tex:99--102 明写这条声明对 $F(\gamma)$ 无下界，保留全部轨迹势能、并把两个系数各改善一点；它由两段更短的坐标扫描导出，等被删的格子补回时再用它的维数储备。

我关心的是"改善一点"到底值多少。坐标表切成连续的 $\lfloor b/2\rfloor$ 与 $\lceil b/2\rceil$，乘积 $s_1,s_2$；每枚坐标贡献介于 $\log R$ 与 $2\log R$，故 $\tfrac15\log s\le\log s_u\le\tfrac45\log s$（06-induction.tex:104--110），特别地 $p\le s_u$（06-induction.tex:111）。子问题用的是 $s_u$，于是归纳假设里的系数按 $s_u$ 取值，正文取 $c_*=\min_{u=1,2}c(s_u)$、$e_*=\max_{u=1,2}e(s_u)$（06-induction.tex:168--171）。我自己算一遍：$c(t)=c_0+1/\sqrt{\log t}$ 随 $t$ 减小而增大，故最坏在 $\log s_u$ 最小处，即 $\log s_u\ge\tfrac15\log s$ 给 $c_*\ge c_0+(\sqrt5/2)/\sqrt{\log s}$；而 $\widehat c=c_0+1.05/\sqrt{\log s}$，由 $\sqrt5/2\approx1.118$ 得正的利差约 $0.068/\sqrt{\log s}$。$e$ 侧同理，$e_*\le e_0-\sqrt5/\sqrt{\log s}$ 比 $\widehat e=e_0-1.05/\sqrt{\log s}$ 更优。$\tfrac15$ 与 $\tfrac45$ 这对分裂比的作用被我算成了 $\sqrt5/2$ 这个数，分母 $20$ 的选取就藏在这里；若切得更偏心（例如 $\tfrac1{100}$ 对 $\tfrac{99}{100}$），$\sqrt5$ 换成 $10$，利差被 $\widehat c$ 的 $1.05$ 吃光，声明 (21) 立刻无息可图。

因式分解的骨架在 06-induction.tex:111--155。把网格看成 $s_2$ 行长 $s_1$ 的板，前半在行内作用、后半在列内作用；接缝处删去 $\mathcal H'$ 的中间位置，留下 $s-h'$ 个自由格子的固定棋盘，逐条指定轨迹在那里一切为二，给出每行每列的路径约束（06-induction.tex:111--116）。自由格子上用第 5 节的带符号张量表示；$X$ 是输入层到接缝的条件行平均，$Y$ 是接缝到输出的条件列平均，行与列的随机化在固定路径约束下条件独立，故 $YX$ 就是全条件平均（06-induction.tex:118--122）。$P_\gamma$ 为全群典型投影，$P_\alpha^R,P_\beta^C$ 为行、列子群投影，$\alpha_i$ 分拆第 $i$ 行的自由格子数、$\beta_j$ 同理，无自由格子的行列取空类型；$F_R=\sum_iF(\alpha_i)$、$F_C=\sum_jF(\beta_j)$（06-induction.tex:123--132）。全投影与两个子群投影交换，层间双射把两侧全典型投影互相缠绕，于是在相容幺正认同下 $YP_\gamma X$ 从输入 $\gamma$-典型空间限制到输出的形式是 $K_\gamma^{\mathcal H'}\otimes I$，恒等作用在张量重数空间上，钩类型由密度引理出现故重数至少一枚（06-induction.tex:133--139）。接缝处插入子群分解得三因子积和（06-induction.tex:141--151，声明 `ac:eq:20`）：$(T_\gamma^{\mathcal H'})^{1/(2q)}\le\lVert YP_\gamma X\rVert_{2q}\le\sum_{\alpha,\beta}\lVert YP_\beta^C\rVert_{2q}\lVert P_\beta^CP_\gamma P_\alpha^R\rVert_{\mathrm{op}}\lVert P_\alpha^RX\rVert_{2q}$，第一处不等用"至少一份 $\gamma$ 上的未归一化迹"，第二处用三角不等式、乘积范数不等式与外因子的 $\lVert A\rVert_{\mathrm{op}}\le\lVert A\rVert_{2q}$（06-induction.tex:152--155）。

两端与中间各自的账在 06-induction.tex:157--200。两端：行侧按行序排自由格子使 $X=\bigotimes_iX_i$（带符号幺正重排为此保媒），$\lVert P_\alpha^RX\rVert_{2q}^{2q}=\prod_i\operatorname{mult}(\alpha_i)T_{\alpha_i}^{\mathcal H_i}$，列式同形；密度引理把每枚重数界成 $\exp(O(p^2\log(s+1)))$；对每个局部受约束扫描用归纳假设，得 $\log(\lVert P_\alpha^RX\rVert_{2q}^{2q}\lVert YP_\beta^C\rVert_{2q}^{2q})\le-c_*(F_R+F_C)+e_*h'\log s-C(\mathcal H')+O((s_1+s_2)p^2\log(s+1))$（06-induction.tex:157--185，声明 `ac:eq:18`）；这里我特意核对"每根阶段直线恰属一个子问题故势能相加为 $C(\mathcal H')$"与"两部分各带 $h'$ 条指定轨迹、尺寸权重相加 $\log s_1+\log s_2=\log s$"（06-induction.tex:172--175），这两句是 $h'$ 与 $C$ 不重复计账的凭据，少一句就变成 $2h'$ 与 $2C$。中间：接缝交叠引理给 $\log\lVert P_\beta^CP_\gamma P_\alpha^R\rVert_{\mathrm{op}}^2\le F_R+F_C-F(\gamma)+h'+O((s_1+s_2)p^2\log(s+1))$（06-induction.tex:190--200，声明 `ac:eq:19`，零范数按 $\log0=-\infty$ 记账）。它的证明用 $\lVert\cdot\rVert_{\mathrm{op}}^2\le\lVert\cdot\rVert_{\mathrm{HS}}^2=\Tr(P_\alpha^RP_\beta^CP_\gamma)$，$P_\beta^CP_\gamma$ 是正投影，故可在迹内用密度引理控制 $P_\alpha^R$，除去因子 $\exp(F_R+O(s_2p^2\log(s+1)))$ 后剩下乘积密度的概率混合，第 $i$ 行的单 site 矩阵是偶密度 $r_i$（06-induction.tex:202--213）；再对 $s_2$ 行（含空行）平均，$\bar r=s_2^{-1}\sum_ir_i$、$\bar r_\varepsilon=(1-\varepsilon)\bar r+\varepsilon I/\dim V$、$A_\varepsilon=\bar r_\varepsilon^{-1/2}$，取 $n=s-h'$，正算子 $B_\varepsilon=\bar r_\varepsilon^{\otimes n}$ 迹为一且与全带符号群作用交换，在 $\gamma$-典型空间上是 $I_{D_\gamma}\otimes B_\gamma$，故其每个本征值在迹里至少被计 $D_\gamma$ 次，得 $B_\varepsilon P_\gamma\preceq D_\gamma^{-1}P_\gamma$；再压缩到 $P_\beta^C$、右侧用 $P_\beta^CP_\gamma\preceq P_\beta^C$、并以 $B_\varepsilon^{-1/2}$ 共轭，得 $P_\beta^CP_\gamma\preceq D_\gamma^{-1}A_\varepsilon^{\otimes n}P_\beta^CA_\varepsilon^{\otimes n}$（06-induction.tex:215--238）。$\varepsilon$ 正则化是我在这里唯一读不懂动机的一笔：$\bar r$ 可能退化，故 $A_\varepsilon$ 需要先可逆；[推测] 后续要让 $\varepsilon\to0$，本轮读到 06-induction.tex:238 仍在 $\varepsilon>0$ 上，极限如何处理我尚未读到，记为疑点。

合起来看利息设计：`ac:eq:18` 与 `ac:eq:19` 相加时 $F_R+F_C$ 恰好对消成 $-F(\gamma)$，多出来的是 $(c_*-1)(F_R+F_C)$ 与 $e_*h'\log s$、$h'$、两份 $O((s_1+s_2)p^2\log(s+1))$。$s_1+s_2=s$、$p^2\approx s^{2a}$ 让误差项形似 $s^{1+2a}\log s$ 而大得荒唐，但 `ac:eq:20` 左侧带 $1/(2q)$ 次幂，取 $(2q)^{-1}$ 倍对数后这笔误差被 $2q$ 摊薄，我算的数量级是 $s^{1+2a}\log s/(2q)$；$2q\ge8/\rho$ 让它可以被 $s^{9/10}$ 与利差 $(\widehat c-c)F$ 联合吃掉。这一读法意味着 $q$ 在本篇领两份薪水：06-induction.tex:62--68 用 $2q\rho\ge4$ 换维数折扣，06-induction.tex:141--155 用 $2q$ 次幂摊薄重数与交叠误差。[推测] 正文没有明写第二份，是我按幂次对账推出来的，依据是 06-induction.tex:152--155 那句"未归一化迹"与外因子范数不等式的组合。

## 20 深读 05-density：偶密度、钩支撑的充要刻画与扇区标量

第 5 节的开场就交代了它的岗位：稀疏估计解决的是小表示维数，剩下的图要在带洞的矩形上比较行对称与列对称，方法是构造支配钩图投影的正张量密度，其迹一归一化保证"即使有些 site 已被移除"比较仍然合法（05-density.tex:4--8）。第 19 节末尾那枚迹一算子 $B_\varepsilon$ 正是这里的兑现，两句相隔三节，我在两轮阅读里把它们当作两件独立事，这是我的损失。

设定在 05-density.tex:10--17：$p\in[1,s]$ 为整数，$V=E\oplus O$，$E$ 与 $O$ 各维数 $p$；在 $V^{\otimes l}$（$l\le s$）上令 $S_l$ 带符号地置换槽位，交换两个相邻奇因子（$O$ 中的向量）付一枚负号，其余相邻交换不付；在奇偶齐次张量上符号就是奇因子被诱导的重排之号，这定义一个幺正作用。"偶密度"定义为 $V$ 上半正定、迹一、且对 $E\oplus O$ 分块对角的算子。我第一遍读时把"偶"误解为密度本身是偶函数，读完 05:14--17 三句才确认它指的是分块对角这一结构性质，正是它让 05:176--182 那句"撤销带符号重排后回到通常张量积"成立。

主引理（05-density.tex:19--33，带符号密度支配）：$P_\alpha$ 是该带符号张量表示中 $\alpha\vdash l$ 的典型投影，出现的类型恰是落在 $(p,p)$-钩里的类型，即所有格子位于前 $p$ 行或前 $p$ 列；对每个这样的类型存在偶密度上的概率分布 $\mu_\alpha$ 使 $P_\alpha\preceq\exp\{F(\alpha)+O(p^2\log(s+1))\}\mathbb E_{r\sim\mu_\alpha}r^{\otimes l}$（声明 `ac:eq:13`）；重数至多 $\exp(O(p^2\log(s+1)))$，类型数至多 $(s+1)^{2p}$，常数全为绝对。出处交代在 05:35--40：带符号张量作用与其钩支撑属于 Berele 与 Regev 的钩理论经典，正支配由张量幂混合这一手也见于 Christandl、K\"onig 与 Renner 的后选择技术，本文从通常 Schur--Weyl 扇区导出带符号版本并把不可约维数 $D_\alpha$ 显式留着。

证明的支撑刻画部分（05-density.tex:42--81）我按逻辑链抄一遍。$l=0$ 时张量空间与其唯一表示都是一维，任一密度即得（05:43--44）。固定偶因子数 $t$：给定奇偶图案给出 $E$ 与 $O$ 的通常张量幂，后者上的对称群作用按符号扭转；对图案求和就是把 $S_t\times S_{l-t}$ 的作用诱导到 $S_l$。记 $W_\sigma(E),W_\tau(O)$ 为通常 Schur--Weyl 重数空间，则正交扇区（$\sigma\vdash t$、$\tau\vdash l-t$、各至多 $p$ 行）形如 $\mathcal V_{\sigma,\tau}\cong\operatorname{Ind}_{S_t\times S_{l-t}}^{S_l}([\sigma]\boxtimes[\tau'])\otimes W_\sigma(E)\otimes W_\tau(O)$（05:48--58）；诱导记录两种奇偶的位置，$\tau$ 上的转置记录奇符号扭转（05:59--61）。$[\tau']$ 出现在对大小为 $\tau_1,\dots,\tau_p$ 的子群诱导符号表示之后，因其列可作为竖条依次加入；若 $\alpha$ 出现在 $\mathcal V_{\sigma,\tau}$，Pieri 规则至多经 $p$ 个竖条从 $\sigma$ 到达它，转置并对调两因子得从 $\tau$ 出发的同形陈述，补零后 $\alpha_i\le\sigma_i+p$、$\alpha'_j\le\tau_j+p$，特别 $\alpha_{p+1}\le p$，即钩条件（05:63--72）。反向构造在 05:73--81：取钩形的前 $p$ 行为偶形，其下的格子按列从左到右加入，至多 $p$ 个竖条；奇张量幂里每竖条一枚基符号并带指定重数的字载有对应的符号诱导，Pieri 给出该钩形；前 $p$ 行长与前 $p$ 列长唯一确定钩形，故类型数 $\le(s+1)^{2p}$。

维数与权重的那笔账在 05-density.tex:83--113。置 $\mathcal S=l\log l-\sum_i\sigma_i\log\sigma_i-\sum_j\tau_j\log\tau_j$（零项按零解释），$p\times p$ 核外的水平与竖直臂长 $H_i=(\alpha_i-p)_+$、$V_j=(\alpha'_j-p)_+$；条带不等式给 $H_i\le\sigma_i$、$V_j\le\tau_j$；水平臂内每根钩至多其行钩加 $p$，故长 $H_i$ 的臂其钩积至多 $\prod_{r=1}^{H_i}(r+p)=H_i!\binom{H_i+p}{p}\le H_i!(s+p)^p$，竖直臂同，核内至多 $p^2$ 根钩长度 $\le s$；钩长公式于是给 $D_\alpha\ge(s+p)^{-O(p^2)}\,l!/(\prod_i\sigma_i!\prod_j\tau_j!)$，再用 $\log(n!)=n\log n-n+O(\log(n+1))$ 且 $|\sigma|+|\tau|=l$ 使线性项相消，得 $\mathcal S\le F(\alpha)+O(p^2\log(s+1))$（05:108--113，声明 `ac:eq:14`）。我在此核对了一个先前记错的量级：$\mathcal S$ 与 $F(\alpha)$ 之差完全来自核外 $p^2$ 个钩与 $(s+p)$ 幂，因此误差里出现 $p^2$ 属结构必然，随 $p$ 二次增长；这与 06-induction.tex:84 的 $p=\lfloor s^a\rfloor$ 合起来意味着 $p^2=s^{2a}$ 是"钩尺寸"与"误差"之间唯一的可调旋钮。

正密度的构造在 05-density.tex:115--158：$d_E=\operatorname{diag}(\sigma_1/l,\dots,\sigma_p/l)$、$d_O$ 同形，$r_U=(U_Ed_EU_E^*)\oplus(U_Od_OU_O^*)$，两幺正群独立 Haar；这是偶密度。Weyl 维数公式给 $m_\sigma=\prod_{i<j}(\sigma_i-\sigma_j+j-i)/(j-i)\le(t+1)^{p(p-1)/2}$，$m_\tau$ 以 $l-t$ 代 $t$（05:122--130）。$d_E$ 的张量幂在重数空间上是 $W_\sigma(d_E)$，最高权线本征值 $\prod_i(\sigma_i/l)^{\sigma_i}$，其余本征值非负，零本征值情形按连续性延伸并约定 $0^0=1$（05:131--135）。张量密度保持每个 Schur--Weyl 扇区，对两幺正群取平均使其在两个不可约重数空间上成为标量，扇区 $\mathcal V_{\sigma,\tau}$ 上的标量是 $m_\sigma^{-1}\Tr W_\sigma(d_E)\cdot m_\tau^{-1}\Tr W_\tau(d_O)\ge e^{-\mathcal S}/(m_\sigma m_\tau)\ge e^{-\mathcal S-O(p^2\log(s+1))}$（05:137--149）。05:150--152 那两句我读得很慢：同一标量对每个奇偶图案都成立，因为密度保持这些图案且每图案上的张量因子相同，所以图案的数目根本不进标量。我原先预备在这里吃一个 $\binom{l}{t}$ 的组合因子，正文一句话把它免了，依据就是"分块对角加同因子"这一结构。于是扇区投影满足 $Q_{\sigma,\tau}\preceq\exp\{F(\alpha)+O(p^2\log(s+1))\}\mathbb E_Ur_U^{\otimes l}$（05:152--158）。

最后两步（05-density.tex:160--173）：相关扇区投影覆盖 $P_\alpha$，其数 $N_\alpha\le(s+1)^{2p}$（两个补零分拆由 $2p$ 个介于 $0$ 与 $s$ 的整数确定），对这些扇区求和并"先均匀选扇区再选其两枚 Haar 幺正"就造出 $\mu_\alpha$，因子 $N_\alpha$ 被 $O(p^2\log(s+1))$ 吸收；取迹得重数界，$\Tr P_\alpha=D_\alpha\operatorname{mult}(\alpha)$ 而每张量密度迹一。收尾段 05:176--182 是分块使用说明书：site 分成块后，带符号幺正重排使块乘积子群的作用成为张量积，逐块用 `ac:eq:13` 得块内常值的密度乘积；每个密度是偶的，故撤销重排把它带回通常张量积并换一遍 site 标签；特别地，偶密度的常张量幂与整个带符号对称群作用交换。第 19 节接缝上那个"按行排序使 $X=\bigotimes_iX_i$"的合法性，全部由这一段供应。

## 21 深读 01-introduction：模型口径、两条结论与先前工作的差异

引言第一段是全文最浓缩的设计声明，我这次逐字抄下自己的理解（01-introduction.tex:3--10）：揭示被选中牌的路径会把一次洗牌的剩余随机性分离成局部选择，同时改变这些选择的律；在有序坐标扫描里，条件化仍按坐标线分离，每个残余选择是"该阶段被指定路径留出的空槽之间的双射"；本文在整个剩余双射上保持控制，同时保留"无放回地指定互异位置"这一代价的精确值；正是这个代价使估计在证明过程中继续揭示更多牌路径时保持稳定。第 19 节那个势能 $C(\mathcal H')$ 在此被点名：它的作用域是归纳中途新增的轨迹，我原先以为它是记账的副产品，读完确认它是本文与"一次条件化到底"路线的分水岭。

模型在 01-introduction.tex:12--17：固定正整数 $d$，$N=2^d$，二元坐标扫描作用于槽 $\{0,1\}^d$；每个坐标方向上对每条平行边独立地以概率 $1/2$ 固定或对调其上的两张牌，按顺序访问坐标；记其律为 $B_N$。一枚牌在一次扫描后均匀，但联合置换保留依赖，因为不同的牌可以用同一枚开关。物理来源见 01:19--32：Thorp 关于非随机洗牌与 Faro 的研究；把牌堆分成相等的两半、对应配对、用独立公平硬币决定每对的次序再交织；在二元位置串上一枚物理 Thorp 洗牌写作 $(x_1,x_2,\ldots,x_d)\mapsto(x_2,\ldots,x_d,x_1+\xi_{x_2,\ldots,x_d})$，加法模二，比特 $\xi$ 独立公平；撤销那记确定的坐标旋转后， successive 开关层依次作用于 successive 坐标方向；$d$ 次物理洗牌后旋转回到恒等，故一次二元扫描恰花费 $d$ 枚物理步；01:31--32 把坐标表示的出处指向 Morris 2008 第 1.1 节。记号约定在 01:34--44：$q_d$ 是一枚物理步的律，$U_N$ 是 $S_N$ 上均匀分布，全变差取 $\tfrac12\sum_{g\in S_N}\lvert\mu(g)-\nu(g)\rvert$，$t_{\rm mix}(d)=\inf\{t\in\mathbb Z_{\ge0}:\lVert q_d^{*t}-U_N\rVert_{\TV}\le1/4\}$；平移由确定的初始牌堆给出、保持到均匀的距离，故定义对所有确定初始牌堆一致。表示侧记号 01:46--51：$K_\lambda=\mathbb E_{g\sim B_N}\rho_\lambda(g)$、$D_\lambda=\dim\rho_\lambda$。

定理与反例的配对在 01-introduction.tex:54--86。二元扫描收缩：存在绝对常数 $g>0$ 与 $d_0$，使 $d\ge d_0$ 时对每个 $\lambda\vdash2^d$ 有 $\lVert K_\lambda\rVert_{\mathrm{op}}\le D_\lambda^{-g}$；符号表示被湮灭；存在绝对正整数 $w$，$w$ 次独立扫描后的律在 $d\to\infty$ 时按全变差趋于均匀，对确定初始牌堆一致。支撑障碍：对每个 $t\ge0$ 有 $\lVert q_d^{*t}-U_N\rVert_{\TV}\ge1-2^{tN/2}/N!$，从而 $t_{\rm mix}(d)\ge\lceil(2/N)\log_2(3N!/4)\rceil=2d-O(1)$（01:68--79）。证明七行（01:80--86）：$tN/2$ 枚公平比特决定置换，支撑至多 $2^{tN/2}$；在全变差定义里测这个支撑即得下界；距离不超过 $1/4$ 要求其在均匀测度下至少 $3/4$；Stirling 给渐近式。我把 $(2/N)\log_2(N!)$ 的 $2d$ 单独核一遍：$\log_2 N!\approx N\log_2 N-N\log_2 e$，除以 $N/2$ 得 $2\log_2 N=2d$ 减去 $O(1)$，所以那个前因子 $2$ 与阈值 $3/4$ 的 $O(1)$ 修正彼此独立，$2d-O(1)$ 的阶属硬性；再对照"一次扫描 $=d$ 物理步"，$w$ 次扫描给 $wd$ 步，与下界 $2d$ 之间只差常数倍，这才是"$\Theta(d)$ 阶最优"这句话的全部含量。

固定 $d$ 的收敛走另一条通道（01-introduction.tex:88--95）：一次扫描可以是恒等，也可以是任一单条立方边对换，概率为正；连通图的边对换生成 $S_N$；用恒等补乘积便得到一支具全支撑的幂，其正的最小概率给出均匀 minorization，迭代即收敛。这条与定理第二句的 $w$ 次扫描 TV 收敛互不消费，正是我在第 12 节疑点三条下的判断，本轮逐字确认后把 [推测] 降级为"两条独立通道"这一事实陈述。

先前工作一节（01-introduction.tex:99--120）给出阶的演进：Morris 2005 年 7 月作者版（2008 年刊出）对 $N=2^d$ 给 $O(d^{44})$ 枚物理洗牌；Montenegro 与 Tetali  sharpen 到 $O(d^{29})$；Morris 2009 对一切偶数 $N$ 给 $O((\log N)^4)$；Morris 2013 对 2 的幂牌堆给 $O(d^3)$。信息揭示的用法早有先例：Morris 的变色龙恒等式把标记牌律表示为"对一个无序占位集的轨迹"条件化（01:107--110，出处 Morris 2008 第 4 节引理 3）；后期熵证明在逆向 Thorp 洗牌的两次耦合运行中逐次揭示完全带标记轨迹，求和期望熵变以取得 $d$ 枚物理步后的收缩（01:110--114，Morris 2013 第 4 节引理 7 证明）；Morris、Rogaway 与 Stegers 用平均化的条件单牌界加沿演化的耦合分析被选牌 Thorp 边缘（01:115--117）；Hoang、Morris 与 Rogaway 对互异 swap-or-not 洗牌用相关的条件平方偏差计算（01:118--120）。四条先例的共性是被条件化的对象"无序"或"单牌"，本文的差别在 01:7--10 已经写好：条件化互异位置的无放回指定、并对整个剩余双射取矩。我把这条差异记为本文最省事的定位句，它比第 9 节的文献检索口径更可靠，因为它出自作者自己的开场段。

## 22 本轮追加的勘误与申报

一，块落位错误待搬正：第 16 节与第 17 节作为一个整块，当前物理位于第 12 节正文末句与第 13 节标题之间，编号顺序因此呈 12、16、17、13、14、15、18 至 21。起因是我在追加第 16--17 节时把锚点取成第 12 节的末句，而该句在第 13--15 节追加之后已不再处于全稿末尾。正确落位应在第 15 节之后、第 18 节之前，请整块搬正；本轮我没有自行剪切，也没有删改任何已落盘文字。二，随块重复：上述错块的开头多带了一份第 15 节末段的尾句（从"归一化的必然"到"Hilbert--Schmidt 范数"，约 190 B），搬正后需在该块内删重；本轮不做就地删除。

三，首块体量缺口：第 13--15 节三节合计 10,179 B，低于 15,000 B 的目标带。逐节实测为第 13 节 3,329、第 14 节 3,333、第 15 节 3,517、第 18 节 3,548，四节低于 4,000--4,500 的规定带；第 17 节 5,342、第 19 节 7,238、第 20 节 6,976、第 21 节 5,346 高于该带，第 16 节居带内偏上。偏离均系下笔时的分段习惯，落盘后不回改。

四，取材窗口申报：本轮按派单第一步的计数规则选定四片深读，即 06-induction.tex、04-sparse.tex、01-introduction.tex、05-density.tex（四者在稿内各出现 1 次，与 03-paths.tex 的 2 次、07-analytic.tex 的 3 次相比更少；并列 1 次的第五片 02-preliminaries.tex 因单片字节最小 4,617 而被舍）。实读窗口为 04-sparse.tex 的第 1 至 388 行（全文读完）、05-density.tex 的第 1 至 182 行（读完）、06-induction.tex 的第 1 至 120 与 121 至 240 两段（241 至 448 行本轮未读）、01-introduction.tex 的第 1 至 120 行（121 至 234 行未读）。因此第 19 节末段关于 $\varepsilon$ 正则化的极限处理、第 20 节末段关于分块密度与后续合并的完整账目，落点都在未读窗口内，正文已按 [推测] 标注。

五，口径差异：第 10 节旧台账的位置栏用片号简写形如 03 冒号加行号，本轮第 23 节统一写成 文件.tex:行 并限定在本会话真实读出的行号，旧行一律不回改，两套口径并存。

六，写入过程：本轮 `Write` 工具使用 0 次；有一次 Edit 因锚点串在稿中出现两处而失败，未写入任何字节，随后加长锚点解决；未读任何 PDF 与 typst 分片，未执行任何 git 命令，未触碰 `.tools/` 下除本规格外的文件。

## 23 台账续表（本轮深读四片的新增常数与装置）

| 记号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\theta=a/16$ | 固定值 $1/1600$ | 06-induction.tex:8 | $B_0=\lceil 8/\theta\rceil$ 与 $\rho=\min\{\theta/32,\beta/4\}$ (04-sparse.tex:27,370) | 抬高则 $2/b<\theta/4$ 与 $h+k\le s^{1-\theta}$ 同时失守 |
| $K_0=10/e_0$ | $10^{5}$ | 06-induction.tex:8 | 稀疏假设 $h\le K_0k$ (04-sparse.tex:15) | 系数降到 $4.0008$ 以下则 06-induction.tex:53 的 $h\log s\le K_0F$ 断 |
| $q$ | 整数 $\ge\max\{1,\lceil 2/\rho\rceil\}$，附 $2q\rho\ge4$ | 06-induction.tex:11--13 | $\log T\le F-2q\rho k\log s$ (06-induction.tex:64--66) | 减小则 $(1-2q\rho)F\le-3F$ 那一步断 |
| $R$ | 2 的幂，可反复抬高 | 06-induction.tex:14--15,27 | 全部"充分大"陈述与 $z_*$ 的选取 | 不抬则 $s^{-\theta k/16}$ 的前置常数咽不下 (04-sparse.tex:129--130) |
| $1/\sqrt{\log R}\le e_0/2$ | 门槛 | 06-induction.tex:17--21 | $c(s)\le2c_0$、$e(s)\ge e_0/2$ (06-induction.tex:24--25) | 反向则第 19 节利差 $c_*-\widehat c$ 变负 |
| $e(s)h\log s-C(\mathcal H)\ge(e_0/4)h\log s$ | 公共现金 | 06-induction.tex:22--26 | 免费区与稀疏区收尾 (06-induction.tex:47--68) | 任一支花成负值即两态同断 |
| $z_*>0$ | 在 $R$ 之后选 | 06-induction.tex:28--29 | 基础情形、线比较、稀疏引理 | 提前选则有限性与连续性论证失效 (04-sparse.tex:376--382) |
| $F(\lambda)=0$ 分支 | 矩 $\le1$ | 06-induction.tex:31--35 | 空格图、$M=1$、一维类型 | 取消 $\log0=-\infty$ 约定则陈述空转 |
| $b=1,z=0$ | 非平凡平均恒零 | 06-induction.tex:37--42 | 归纳基 | $R$ 未固定则网格无限、取不出 $\delta$ |
| $(1+c(s))F\le eh\log s-C$ | 免费判据 | 06-induction.tex:47--50 | 压缩界 $T_\lambda^{\mathcal H}\le D_\lambda$ (06-induction.tex:44--46) | 判据收紧则大维数区多付 $p^2$ 误差 |
| $F(\lambda)<s^{1-a/4}$ | 稀疏区入口 | 06-induction.tex:51 | 与声明 (17) 互补 (06-induction.tex:71--75) | 阈值挪动则 $M\ge s/2$ 或 $\theta$ 余量失守 |
| $k=\min(M-\lambda_1,M-\lambda'_1)$ | 整数 $\ge1$ | 06-induction.tex:54--61 | 稀疏引理假设 (04-sparse.tex:13--19) | $k=0$ 时引理不适用，只能退回免费区 |
| $c_{\rm dim}k\le F\le k\log s$ | 双向界 | 06-induction.tex:54--56 | $h\le K_0k$ 与 $-3F$ 两步 | 左界失效则 $h+k\le s^{1-\theta}$ 断 |
| $z_{\rm sp}(R)=\min\{\delta(R),z_{\rm cmp}(R)\}$ | 存在式正数 | 04-sparse.tex:384 | 引理在全区间的成立 (04-sparse.tex:386--387) | 去掉 $z_{\rm cmp}$ 则多坐标分支无凭据 |
| $B_0=\lceil 8/\theta\rceil$ | $128$ | 04-sparse.tex:27 | 分支划分与 $2/b<\theta/4$ (04-sparse.tex:110--111) | 减小则 $s^{2/b}$ 反噬 $(k+h)\omega$ |
| $Q(x,y)=s^{-k}\sum_{A\subseteq[k]}(-1)^{k-\lvert A\rvert}s^{\lvert A\rvert}p_A$ | 交错放置核 | 04-sparse.tex:37--40 | $\lVert K_\lambda^{\mathcal H}\rVert_{\mathrm{op}}\le\lVert Q\rVert_{\mathrm{HS}}$ (04-sparse.tex:48--49) | 去符号则真子集项不再被投影杀掉 |
| $2^k\exp\{bh+(1+\log4)bk\}$ | 元界 | 04-sparse.tex:57--60 | 支撑概率与补集元界 (04-sparse.tex:314--320) | $b$ 的系数翻倍则 $s^{\theta k/16}$ 余量吃光 |
| $\lVert Q\rVert_{\mathrm{HS}}^2=\mathbb E_{\mathrm{full}}\lvert s^kQ\rvert^2$ | 零延拓恒等式 | 04-sparse.tex:68--72 | 其后全部粒子计数 | 改无放回则粒子间独立性消失 |
| $r=(k+h)\omega\le1$ | 共享半径 | 04-sparse.tex:95--102 | $2^kr^{w/2}$ 的衰减 | $r>1$ 时二项和不再下降 |
| $\omega\le b\max_jm_j/s$ | 线共享概率 | 04-sparse.tex:104--108 | $(k+h)\omega\le s^{-\theta/2}$ | 弃 $\max_jm_j\le s^{2/b}$ 则 $b>B_0$ 分支全断 |
| $\Pr_{\mathrm{full}}(Q\ne0)\le2^ks^{-\theta k/4}$ | 支撑概率 | 04-sparse.tex:121--123 | $\lVert Q\rVert_{\mathrm{HS}}\le s^{-\theta k/16}$ (04-sparse.tex:124--127) | 森林折半 $\lceil w/2\rceil$ 改细则指数对折丢失 |
| $\xi=1/(10B_0)$, $\eta=s^{-\xi}$ | light 判据尺度 | 04-sparse.tex:137--140 | 倾斜矩界里的 $\eta^{u/2}$ (04-sparse.tex:210--217) | $\eta>1/2$ 则 gamma 形状 $n$ 可能非正 |
| $C_1^{u+v}\eta^{u/2}$ | 密度倾斜矩界 | 04-sparse.tex:210--217 | 元界 (04-sparse.tex:242--254) | 改成 $\eta^{u}$ 则 $\lvert G\rvert\ge k/2$ 的阈值失配 |
| $\lvert G\rvert\ge k/2$ | 二分事件 | 04-sparse.tex:313 | 元界省 $s^{-\xi k/4}$ | 阈值降半则补集概率界不够锐 |
| $\nu=\theta/(100B_0)$ | $1/20480000$ | 04-sparse.tex:308--312 | 支撑概率 $s^{-\nu k}$ 与 $\beta$ (04-sparse.tex:358--360) | 折扣 $100$ 减小则三事件不再 $o(k\log s)$ |
| $\beta=\min\{\xi/4,\nu/2\}$ | 两利率合流 | 04-sparse.tex:358--360 | $\rho$ 的构造 (04-sparse.tex:368--372) | 任一支省过头则 $s^{-\beta k/2}$ 的前置常数失控 |
| $\rho=\min\{\theta/32,\beta/4\}$ | 公式值 $1/163840000$ | 04-sparse.tex:370 | $q$ 的选取 (06-induction.tex:11--13) | 增大则 $q$ 同步增大、最终 $g$ 被线性侵蚀 |
| 列情形核元恒零 | 精确归零 | 04-sparse.tex:355--356 | 引理的列支 (04-sparse.tex:366--368) | 若只给折扣则需要第二套利率账 |
| $s-h-k>s/m_j$ | 未指派 site 计数 | 04-sparse.tex:347--352 | 至少两未指派 site 的线 | $R^{-\theta}+R^{-1}\ge1$ 则该分支空转 |
| $p=\lfloor s^a\rfloor$ | $s^{0.01}$ 阶 | 06-induction.tex:84 | 声明 (21) 与 $(p,p)$ 钩 (05-density.tex:22--24) | $p$ 增大则 $O(p^2\log(s+1))$ 抬升、$2q$ 摊薄不够 |
| $\widehat c=c(s)+1/(20\sqrt{\log s})$ | 利差约 $0.068/\sqrt{\log s}$ | 06-induction.tex:85--86 | 归纳声明 (21) 的强度 | 分母 $20$ 改 $2$ 则利差转负 |
| $[\tfrac15,\tfrac45]$ | 分裂比，来源 $\sqrt5/2$ | 06-induction.tex:107--110 | $c_*,e_*$ 的选取 (06-induction.tex:168--171) | 失衡则 $\log s_u$ 的下界撑不起利息 |
| $F_R+F_C$ 对消 | `ac:eq:18` 加 `ac:eq:19` | 06-induction.tex:181--184 与 06-induction.tex:194--197 | 三因子积 $(T_\gamma^{\mathcal H'})^{1/(2q)}$ (06-induction.tex:143--149) | 势能或 $h'$ 重复计账则闭合失败 |
| $\operatorname{mult}(\alpha)\le\exp(O(p^2\log(s+1)))$ | 重数界 | 05-density.tex:31--32 | 行侧乘积 $\prod_i\operatorname{mult}(\alpha_i)T_{\alpha_i}^{\mathcal H_i}$ (06-induction.tex:161--167) | 改指数为 $p$ 一次幂则接缝误差项超支 |
| $N_\alpha\le(s+1)^{2p}$ | 相关扇区数 | 05-density.tex:80--81 与 05-density.tex:160--162 | `ac:eq:13` 的 $O(p^2\log(s+1))$ 吸收 | $2p$ 变 $p^2$ 则吸收失败 |
| $\mathcal S\le F(\alpha)+O(p^2\log(s+1))$ | 熵账 | 05-density.tex:108--113 | 扇区标量下界 (05-density.tex:141--149) | $\lvert\sigma\rvert+\lvert\tau\rvert=l$ 破则线性项不再相消 |
| $m_\sigma\le(t+1)^{p(p-1)/2}$ | Weyl 维数上界 | 05-density.tex:122--130 | 标量里的 $1/(m_\sigma m_\tau)$ (05-density.tex:141--148) | 幂次抬高则 $p^2$ 预算翻若干倍 |
| $D_\alpha\operatorname{mult}(\alpha)=\Tr P_\alpha$ | 迹账 | 05-density.tex:171--173 | 重数界的最后一步 | 张量密度迹非一则放大同倍 |
| 图案数不进标量 | 结构免费 | 05-density.tex:150--152 | 扇区一致标量 | 密度若不分块对角则须补 $\binom{l}{t}$ |
| $N=2^d$ | 牌数 | 01-introduction.tex:12--13 | 定理的 $\lambda\vdash2^d$ (01-introduction.tex:56) | 非 2 的幂则物理步与扫描的换算 (01-introduction.tex:23--31) 需改写 |
| $t_{\rm mix}(d)\ge2d-O(1)$ | 支撑下界 | 01-introduction.tex:74--78 | $\Theta(d)$ 的阶最优声明 (01-introduction.tex:88--89) | 比特数 $tN/2$ 若改则阶随之变 |
| $w$ | 绝对正整数 | 01-introduction.tex:60--64 | 定理第二句的 TV 收敛 | $g$ 减半则 $w$ 约翻倍，阶不变 |
| $O(d^{44})$ 至 $O(d^3)$ | 先前工作的阶演进 | 01-introduction.tex:99--105 | 本文 $\Theta(d)$ 的对照 | 与本文口径无关，改动只影响叙述定位 |
| 变色龙条件对象 | 无序占位集轨迹 | 01-introduction.tex:107--114 | 与本文无放回指定位置的差别 (01-introduction.tex:7--10) | 口径若混则新意被前例吸收 |

## 24 勘误补记（本轮第二轮自检）

第 22 节所列各项继续有效，本轮收工前又跑了一遍机械自检，新发现四项，按类别登记，均不做就地替换。

一，禁串一处：第 13 节末段在"地基"与"装饰"之间用了那组三字转折连接词，属于外部清理通道一次可清的一类；全文其余同类连接词、六个停顿与强调短语、长破折号、整行三短横、对勾与装饰符号实测均为 0 命中，该行是本轮唯一自伤。

二，台账格内成对裸竖线一处：第 23 节中记号格为熵账那一行（位置栏写 05-density.tex:108--113），其末格把两个分拆的绝对值连写成了四枚同形裸竖线，令该行竖线总数由 6 变 10，同侧清理通道可换成同系列允许的限制符号；本轮不代劳。除此之外新表 45 行实测每行恰 6 枚竖线、无空格。

三，数学定界符总数为奇数 4173，逐行扫描全文仅第 293 行一处不成对：该行属第 8 节，用左括号加反斜杠的形式开式、用行内定界符闭式，是本轮之前的旧稿缺陷。本轮新增五节（13 至 21）与两节（22、23）自身的定界符逐行成对，实测 0 行异常。按规格我不在别处补一枚同形字符做奇偶补偿，留给本体侧就地修那一处。

四，指代口径：本轮新节里"第 2 节""第 3 节""第 5 节"这类说法有时指素材论文自己的节（preliminaries、paths、density），有时指本稿的节号（如"第 13 节""第 19 节"）。两者共用同一措辞造成歧义，具体分辨依据是位置栏：紧接"文件.tex:行"的叙述指本稿节号，出现在"用第 N 节的估计"这类无位置栏处指论文原节。旧稿第 8 至 12 节没有这类混用，本轮不回改，只在此申报。

另记两条核对结果。台账表头全文各一份：首格为"符号"的标准表头 1 次（在第 10 节），首格为"记号"的续表头 1 次（第 23 节），分隔行实测 2 行、与两份表头配对。行内代码反引号总数 784，偶数。全稿无行首回车符，换行一律 LF。第 22 节第一条所报的块落位仍待搬正：第 16 与第 17 两节连同其开头多出的第 15 节末段重复句，应整块移到第 15 节之后、第 18 节之前。
