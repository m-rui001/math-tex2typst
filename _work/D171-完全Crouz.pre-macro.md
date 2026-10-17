# D171 完全 Crouzeix 定理的思考链：最优度量与公共边界密度

## 0 取证登记与边界

本篇研究的对象是队列第 129 行号那一篇论文，其目录全名逐字写作 `preprints/The-complete-Crouzeix-theorem-September-23-2026`，日期后缀照抄，不作任何改动。论文标题见 `main.tex:38-41`，作者署名 OpenAI，日期 September 23, 2026。

### 把 Crouzeix 一族的两条登记分开钉死

`.tools/records.txt` 全文共 184 行。第 31 行登记 `1038 | ComparatorChallenges/CompleteCrouzeix.json | declaration: OAI.CompleteCrouzeix.main | file: OAI/Analysis/NumericalRange/Main.lean`；第 49 行登记 `1110 | ComparatorChallenges/DirectCrouzeix.json | declaration: OAI.DirectCrouzeix.complete_crouzeix | file: OAI/Analysis/DirectCrouzeix/CompleteBound.lean`。行首那对数字 1038 与 1110 是全库登记号，跟文件自身行号 31、49 是两套编号，别把它们搞混。两行都带 Crouzeix 字样、都带 complete 字样，一眼扫过去极易当作同一篇。我用三处差异把本篇锁死在 1038：全库登记号取 1038（舍 1110），declaration 名取 `OAI.CompleteCrouzeix.main`（舍 `OAI.DirectCrouzeix.complete_crouzeix`），指向的模块文件取 `OAI/Analysis/NumericalRange/Main.lean`（舍 `OAI/Analysis/DirectCrouzeix/CompleteBound.lean`）。队列第 129 行号（`lean_queue.txt` 里写 `The-complete-Crouzeix-theorem-September-23-2026`）对应的正是 1038 这条。1110 属于另一篇（队列第 15 行号，早有人写过笔记），我这一篇既不读它、也不借它任何结论，连它的存在只用来把边界划清楚。

### 素材与取证纪律

正文素材只取 `build/` 目录下三个 tex：`main.tex`（实测 70,728 字节、1,523 行，是这篇论文的全部主体）、`references.tex`（5,073 字节、125 行，文献表）、`figures/coordinates.tex`（1,642 字节、37 行，那张两坐标示意图）。PDF 一概不读，pdftotext 一概不用；语料已加密，任何读取 PDF 的动作都会出错，所以我从头到尾只对着 tex 行号取证。`main.tex:221` 那句 `\input{figures/coordinates}` 说明图就嵌在这三个 tex 里，我把图注（`coordinates.tex:29-34`）当正文用。

Lean 侧只碰三样东西：records 第 1038 行、它指向的 `OAI/Analysis/NumericalRange/Main.lean`（实测 70 行）、以及 `ComparatorChallenges/CompleteCrouzeix.json`（15 行，登记 `theorem_names` 里唯一那条 `OAI.CompleteCrouzeix.main`，`permitted_axioms` 是 `propext`、`Quot.sound`、`Classical.choice`，`enable_nanoda` 为 false）。我没对整个 lean 仓做递归检索，只在 `Main.lean` 这一个文件上做过定点 grep。我没读任何其它 `D##` 笔记，也没读 `素材/`、`INDEX.md`、`队列台账.md` 之流。

### 关于 reconstruct 的坦白

论文的正文是打磨过的正向叙述（`main.tex:59-264` 一路从结构问题推到常数二），我在这份笔记里要把它拆回成我自己会走的那种思路：先猜、走死、绕、再撞对。凡是论文没写、只能靠我推测的早期弯路，我一律标 `[推测]` 并说清缺什么证据；凡是能落回 tex 的行号，我就把行号写进正文。挂到 §2 台账里的每一个量，都能在 `main.tex` 找到对应行段。

## 1 我一开始以为这是什么

一上手我读到的目标在 abstract（`main.tex:45-57`）和第 1 节开场（`main.tex:59-67`）。它要证的是 complete Crouzeix 猜想的完整形态：对任意复 Hilbert 空间上的任意有界算子 $A$、任意矩阵值多项式 $P(z)=\sum_{j=0}^d B_jz^j$，都有 $\lVert P[A]\rVert\le 2\sup_{W(A)}\lVert P\rVert$，而且这个 $2$ 与 Hilbert 空间、与系数规模 $m$、与次数 $d$ 都无关（`main.tex:151-157`）。标量情形就是 $m=1$（`main.tex:157`）。

我最初的猜想很朴素，甚至可以说天真。标量的常二已经在几份近期预印本里被证了（`main.tex:174-175`：Jin、Lorist--Schwenninger、Luo），$1+\sqrt2$ 的完整界也早在 Crouzeix--Palencia 手里拿到过（`main.tex:170-172`），Ransford--Schwenninger 还简化了它最后那步范数论证（`main.tex:172-173`）。我一开始盘算的是：既然标量的 $2$ 已经到手，矩阵值那一步大概只是把已有证明按块搬上来，或者把 $1+\sqrt2$ 的常数一点点磨到 $2$。读到 `main.tex:176-178` 我才被泼了第一盆冷水：Lorist 与 Schwenninger 的 Theorem 3 覆盖有界 Hilbert 算子，可他们自己第 3 节第 (iv) 段说清了，其交换论证没法立刻搬到矩阵系数上。这么一来我那条"抬块"的路当场断在第一处，断点就是系数之间不能交换。

第二个让我惦记的东西是它到底值不值得做。第 1 节的提问写得很直白（`main.tex:60-62`）：能不能一次选好一套受控的内积改动（也就是一套度量），再配一个正的边界密度，把某个矩阵的所有矩阵值解析赋值统统表示出来，而且这套度量和密度都不依赖被测函数的系数大小。抽象层面这条问题的分量有经典结果撑着：Paulsen 把最优条件数和完全有界范数等同起来（`main.tex:185-187`），Arveson 的扩张定理把完全压缩和正规边界扩张挂上钩（`main.tex:188`），Badea--Crouzeix--Delyon 早年在二维椭圆的数值范围上造过条件数不超过 $2$ 的保形相似（`main.tex:189-192`）。所以真正的奖赏是一句更强的话：对最优度量本身证明 $\kappa\le2$（`main.tex:193-195`）。我于是把目标从"再证一遍常二"改成"先把那套最优度量和公共密度造出来，常二当作它的推论"，这个改动在后面 §5、§6 才真正落地。

我也读了 `main.tex:197-203`，那里点明本文跟同门的 direct 证明（`\cite{Direct}`，见 `references.tex:84-88`）的分工：direct 那条从被测多项式自己的奇异向量出发去够多项式不等式，而本文先选定一个最优度量、再去证一条对每个系数规模、每个解析测试函数都成立的表示。这句话是我整份笔记的骨架来源，它告诉我该往"先度量、后表示"的方向走，具体在 §4 我把它的反面（先固定测试多项式）当成一条死路来写。

## 2 符号台账

全文只此一张表。每个符号都给一个能核对的数值或增长率、一段能翻到的 `main.tex` 行号、它的下游、以及若把它改动会在哪一步断裂。§3 到 §11 的行文反复回指这张表里的量。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\kappa$ | $1\le\kappa\le2$ | main.tex:116-130 | $\lVert S\rVert\lVert S^{-1}\rVert=\kappa$ 与 §9 链条 | 常数一改则 §9 右端与 §11 落差全跟着改 |
| $\kappa^2$ | 最小值, 满足 $1\le\kappa^2\le4$ | main.tex:108-111 | 分离集约束 $s<\kappa^2$ | 若 $\kappa^2>4$ 则 §9 的 $\kappa\le2$ 断 |
| $T=f(A)$ | $\rho(T)<1$ | main.tex:107,277 | $H_0=\sum_{j\ge0}T^{*j}T^j$ 见证严格可行 | 谱半径不小于一则 §5 的 $H_0$ 发散 |
| $H$ | 满足 $I\preceq H\preceq\kappa^2 I$ | main.tex:109,120 | 开方得 $S=H^{1/2}$ | 换成非最优度量则 §7 端点分离对不上 |
| $S=H^{1/2}$ | $\lVert S\rVert\lVert S^{-1}\rVert=\kappa$ | main.tex:122-123,293-296 | 定义 $D$ 与 $A'$ | 改 $S$ 则 §5 的最小条件数身份丢 |
| $D=Sf(A)S^{-1}$ | $D^*D\preceq I,\ \rho(D)<1$ | main.tex:123,127 | $\Phi_D$ 的正性与 §7 酉实现 | 若 $\rho(D)\ge1$ 则 §6 密度级数不收敛 |
| $A'=SAS^{-1}$ | 与 $A$ 相似 | main.tex:123,141 | $v[A']=\int\Lambda\otimes v(G)$ | 改相似则 §10 界常数漂移 |
| $\Phi_D(\zeta)$ | 正, $\int\zeta^j\Phi_D=D^j$ | main.tex:321-322,342-344 | 定义 $\Lambda$ | 换符号则 §6 矩恒等式错位 |
| $j(t)$ | $j(t)>0$, 即 $\eta'(\theta)$ | main.tex:323,353-354 | $\Lambda=j\,\Phi_D\circ\psi$ | Jacobian 变号则 §6 测度搬运崩 |
| $\Lambda(t)$ | $\Lambda\succeq0,\ \int\Lambda=I_n$ | main.tex:137,324,356-357 | 每个 $m$ 上的 $V_m$ 等距嵌入 | 质量非 $I_n$ 则 §7 取等 $1=\lVert V^\dagger M_FVx\rVert$ 崩 |
| $V_m$ | 等距嵌入 | main.tex:361-364 | $v[A']=V_m^\dagger M_vV_m$ | 非等距则 §8 纤维等式失去取等 |
| $F_\mathbb D$ | 有理, $\overline{\mathbb D}$ 上压缩 | main.tex:392-397,508-511 | 极值 $F_\mathbb D[D]x=y$ | 不压缩则 §7 酉实现断 |
| $\mathcal A_T$ | 仿射集, 首分量 $s$ | main.tex:410-412 | 与 $\mathcal O$ 做分离 | 少一分量则 §7 对偶矩阵缺一块 |
| $\mathcal O$ | 开凸集, 约束 $s<\kappa^2$ | main.tex:414-416 | 触发有限维分离 | 若 $0\in\mathcal O$ 则分离不成立 |
| $\lambda$ | 先证 $\lambda>0$ 再归一为一 | main.tex:448-453 | 得 $\mathrm{tr}\,X_0=1$ | $\lambda=0$ 则 §7 缩放失、归一崩 |
| $X_0,Y_0,Z_0$ | 半正定对偶三元 | main.tex:448,455-457 | 支撑于 $\kappa^2$ 与 $1$ 特征空间 | 支撑错则端点向量分不开 |
| $\mathrm{tr}\,Y_0$ | 等于 $\kappa^2$ | main.tex:458-464 | 定出端点比值 | 不为 $\kappa^2$ 则 $SX=\kappa X$ 拿不到 |
| $X^*Y$ | 等于 $0$ | main.tex:390,897-899 | 整矩阵零均值 $r_0=(X^*Y)^{\mathsf T}$ | 非零则 §9 正交失、$\kappa$ 下界无 |
| $G(t)$ | $at+b+O(t^{-1})$, 且 $a=\phi_{\mathrm{ext}}'(0)^{-1}\ne0$ | main.tex:552,1497-1498 | $q_G$ 与 Faber $b_k$ | $a=0$ 则首项 $a^{-k}$ 无定义 |
| $q_G(t)=tG'(t)$ | 外向法向 | main.tex:99,553,1512-1513 | $m(w,t)\ge0$ 与 $K_A$ | 非法向则 §8 支撑半平面正性崩 |
| $b_k(z)$ | $\deg b_k=k$, 首项 $a^{-k}$, 且 $b_0=1$ | main.tex:553-556 | $K_A=\sum b_k(A)t^{-k}$ | 次数错则 §6 桥接 $c_u$ 崩 |
| $B(w,t)$ | 过对角全纯 | main.tex:561-567 | $m=1+B+\overline{B}$ | 对角奇异则边缘积分不为 1 |
| $\beta_{ij}$ | $\lvert\beta_{ij}\rvert\le C_\rho\rho^{i+j}$ | main.tex:569,613-614 | $\mathcal M$ 的 Fourier 作用 | 衰减不足则 §6 双级数不正规收敛 |
| $m(w,t)$ | $\ge0$, 两边缘皆为 1 | main.tex:572-575 | $\mathcal M$ 为压缩 | 边缘非 1 则保均值失 |
| $K_A(t)$ | 系数几何衰减 | main.tex:580-585 | $E_A=K_A+K_A^*$ | 不收敛则 §8 场不成有界 |
| $E_A(t)$ | $\succeq0$, $\int E_A=2I_n$ | main.tex:582,746 | 第二正块 $\Delta$ | 质量非 $2I_n$ 则 §8 与 $\Lambda$ 的质量对照反 |
| $\mathcal H_k$ | $L^2(\mathbb T;M_k)$, 用 HS 范数 | main.tex:676-678 | 投影与比较都在此空间 | 换范数则 §9 的 $\mathrm{tr}\,\Delta J\Delta J$ 变 |
| $P_0,P_+,P_-$ | Fourier 三分投影 | main.tex:681-683 | $\mathcal C=P_0+P_++\mathcal M P_+$ | 分解错则 §9 的 $g,h$ 落频失配 |
| $\mathcal M$ | 压缩, 保均值 | main.tex:686-687,751-754 | $\mathcal C,\mathcal C^\dagger$ | 非压缩则 §6 的 $\lVert\mathcal C u\rVert^2\le2\lVert u\rVert^2$ 失 |
| $\mathcal C^\dagger$ | $u_0+u_++\mathcal M^\dagger u_-$ | main.tex:724-725 | $g=\mathcal C^\dagger r$ | 号序错则 §9 对角界 $4\lVert g\rVert^2$ 断 |
| $\mathcal C$ 加权界 | $\lVert\mathcal C^\dagger u\rVert^2+\lVert(\mathcal C^\dagger u)_0\rVert^2\le2\lVert u\rVert^2$ | main.tex:730-733,781-784 | 对角界 $4\lVert g\rVert^2$ | 常数 2 一改则 §9 的 8 改、$\kappa\le2$ 变 |
| $g=\mathcal C^\dagger r$ | 非零, 公共尺度 $\lVert g\rVert_2$ | main.tex:971,999,1011-1013 | 对角与交叉界的公共尺度 | $g=0$ 则除零、§9 不闭合 |
| $h=\widetilde{\mathcal C}^\dagger r$ | 落严格负频 | main.tex:1031-1033 | 交叉下界 $\kappa^2\lVert g\rVert^2$ | 与 $g$ 同频则正交崩、$\kappa$ 系数丢 |
| $p_e,q_e,r_e$ | 投影后的三密度 | main.tex:958-964 | 填进块 $\Delta$ | 号序错则 §9 的 $r_e$ 权重 $\kappa$ 丢 |
| $\Delta(t)$ | 分块正定 | main.tex:922-926,991-996 | $\mathrm{tr}\,(\Delta J\Delta J)\ge0$ | 不正则 §9 得不出 $2\lVert r_e\rVert^2\le\lVert p_e\rVert^2+\lVert q_e\rVert^2$ |
| $J=\mathrm{diag}(I_k,-I_k)$ | 自伴对合 | main.tex:1038 | 把正性译成范数差 | 换号则交叉项系数不为 $-2$ |
| 终链 | $2\kappa^2\lVert g\rVert^2\le8\lVert g\rVert^2$ | main.tex:1047-1051 | 得 $\kappa^2\le4$ | 任一环改动则 $\kappa\le2$ 失效 |
| $\Omega_\epsilon$ | $\{h_\delta<\epsilon/2\}$, 实解析 Jordan | main.tex:1088-1094,1122 | 外逼近供 §10 | 边界不正则 §4 保形坐标引理失 |
| 锐利例 | $A$ 幂零二阶块, $\lVert A\rVert=2$, $\max\lvert P\rvert=1$ | main.tex:1159-1167 | 定 $2$ 的最优 | 取更小常数此例即反例 |

## 3 第一条死路：把标量常二按块抬上来

先说我一开始最顺手的那条路，它断得也最快。标量情形（$m=1$）已由几份预印本拿住 $2$（`main.tex:174-175`），我自然想把它按矩阵系数 $B_j$ 分块抬到矩阵值情形，指望 $\lVert P[A]\rVert$ 能被每个标量块的控制拼出来。这条路卡在张量求值的顺序上。定义里 $P[A]=\sum_{j=0}^d A^j\otimes B_j$ 作用在 $\mathcal H\otimes\mathbb C^m$（`main.tex:151-154`），它的算子范数是那个 $mn\times mn$ 大块的整体范数，混杂了所有系数块之间的干涉；单看每个 $B_j$ 的标量界根本控不住这个混合。更硬的一堵墙是交换：基空间的 $A^j$ 和系数空间的 $B_j$ 分处张量两侧本可各自行动，可一旦要在标量证明里对 $A$ 做泛函微积分、又让 $B_j$ 参与共轭与转置，标量证明里那步交换就站不住，`main.tex:176-178` 明说 Lorist--Schwenninger 第 3 节第 (iv) 段讲清了这一步没法立刻过到矩阵系数。$\AA hag$--Czy$\acute z$--Virtanen 只把完整常二做到基空间阶数不超过三、系数规模任意（`main.tex:178-182`），侧面印证这条"抬块"在一般维数上并不白给。

我在这个断点上停留了很久，直到把注意力从"怎么把标量界拼成矩阵界"挪开。真正需要的对象应当一次性把系数规模 $m$ 和次数 $d$ 全部吸收掉，让 $S$、$\Lambda$、$\kappa$ 与被测函数无关（`main.tex:146,163-164`）。这个"无关"二字是我此后所有构造的准星。

## 4 第二条死路：先固定被测多项式再取奇异向量

第二条路受了 direct 证明的诱惑（`main.tex:197-203`，`\cite{Direct}` 见 `references.tex:84-88`）。direct 那条从被测多项式自身的奇异向量出发，绕过了相似问题，一路算到多项式不等式；我照着做，先去抓某个固定 $v$ 达到范数的那对奇异向量，再据此反推一个度量。路走了一半就崩：这样造出来的 $S$ 与 $\Lambda$ 是围着这一个 $v$ 转的，它凭什么对另一个 $w$、对另一个系数规模 $m'$ 还成立？`main.tex:163-164` 把"同一个 $S$、$\Lambda$、$\kappa$ 对所有 $m$ 与 $v$ 都管用"列成结论，而按 $v$ 现取的向量根本给不出这种一致。卡住的量就是那对被测试函数决定的奇异向量，它们让度量和密度失去了普适性。

把我从这条死路里捞出来的，是 `main.tex:224-230` 那段话。它说：为了界定 $\kappa$，当 $\kappa>1$ 时确实用到一个系数规模为 $n$ 的辅助函数 $F_\mathbb D$，可它"只用来测试一套基空间度量，不去限制独立选定的目标规模 $m$"。一句话点破了分工：允许有一类只服务于卡 $\kappa$ 的辅助测试函数（规模恰好取 $n$），前提是 $S$、$\Lambda$ 早在这之前就已对每个 $m$ 造好（`main.tex:146`、§6）。于是我把"先有普适密度、后有针对一个辅助函数的取等"排成先后顺序，不再从测试函数反推度量。这个顺序正是 §5、§6、§7 三节连起来的走法，反面（先定测试函数）就是本节这条死路。

## 5 转折点一：把问题改写成对度量求一个最小值

真正的拐点出现在我不再直接盯 $\lVert P[A]\rVert$，转而对度量本身求极值。选定保形坐标 $f:\Omega\to\mathbb D$（`main.tex:92-101` 那条引理给的，附录 `main.tex:1323-1461` 里逐段重建），记 $T=f(A)$，然后写下这个优化（`main.tex:108-111`）：$\kappa^2=\min\{\tau\in\mathbb R:\ I\preceq H\preceq\tau I,\ T^*HT\preceq H,\ \text{对某个}\ H=H^*\}$。严格可行指的是 $H-I$、$\tau I-H$、$H-T^*HT$ 三块全正定（`main.tex:112-113`）。

我一开始担心这集合是空的、或者最小取不到。空集的风险被一个显式见证挡掉了：正度量可行性判据是经典结果（`main.tex:278-279`，引 Stein 1952），我自己把见证造出来。取 $\rho(T)<\eta<1$，Jordan 标准形给 $\lVert T^j\rVert\le C_\eta\eta^j$，于是 $H_0=\sum_{j\ge0}T^{*j}T^j$ 按范数收敛，满足 $H_0\succeq I$ 与 $H_0-T^*H_0T=I$（`main.tex:281-285`）。有了 $H_0$，取 $c>1$ 和 $\tau>\lVert cH_0\rVert$，$(\tau,cH_0)$ 的三块松弛全正定，严格可行坐实（`main.tex:286-289`）。可达性也顺：可行对在任何固定上界以下构成有限维空间的闭有界子集，最小必被取到（`main.tex:289-290`）。每个可行 $\tau$ 都 $\ge1$（`main.tex:290`），这就是台账里那条 $1\le\kappa^2$。

把 $H$ 定住、令 $S=H^{1/2}$，合同变换给 $D^*D=S^{-1}T^*HTS^{-1}\preceq I$，相似给 $\rho(D)<1$，夹逼 $I\preceq H\preceq\kappa^2 I$ 给 $\lVert S\rVert\lVert S^{-1}\rVert\le\kappa$（`main.tex:292-296`）。最有决定性的一步是反过来看：若 $R$ 可逆且 $\lVert RTR^{-1}\rVert\le1$，令 $H_R=R^*R$ 就有 $T^*H_RT\preceq H_R$，除掉最小特征值即得可行度量、其 $\tau=\lVert R\rVert^2\lVert R^{-1}\rVert^2$，于是 $\kappa\le\lVert R\rVert\lVert R^{-1}\rVert$；再把这不等式用回最优的 $S$，得到 $\kappa=\min\{\lVert R\rVert\lVert R^{-1}\rVert:\ R\ \text{可逆},\ \lVert RTR^{-1}\rVert\le1\}$（`main.tex:298-308`）。这一步把"证一条算子不等式"换成了"证最优相似条件数有上界"，我此后所有力气都花在 $\kappa\le2$ 这一个数上，见 §9 收尾。

## 6 转折点二：先造出一张对任何系数规模都成立的密度

有了最优度量，下一步是那个能扛住 §4 失败的普适密度。它在 bound $\kappa$ 之前就该立起来（`main.tex:318-319` 明说"在任何 $\kappa$ 界之前"）。密度来自圆盘内的正表示：$\Phi_D(\zeta)=(I-D/\zeta)^{-1}+[(I-D/\zeta)^{-1}]^*-I$（`main.tex:321-322`），这正是 Delyon--Delyon 圆盘预解正表示的写法（`main.tex:327-328`，引 `references.tex:52-55`）。它的正性一看便知：对 $\lvert\zeta\rvert=1$，$E_\zeta=I-D/\zeta$ 可逆且 $E_\zeta^*\Phi_D(\zeta)E_\zeta=I-D^*D\succeq0$（`main.tex:333-336`）。

这里有个我起初没当回事、事后发现吃重的细节：把 $\sum_{j\ge0}\lVert D^j\rVert<\infty$ 拿下来靠的是严格谱半径 $\rho(D)<1$（`main.tex:337-338`），用的是谱半径、不是严格范数界。台账第 6 行 $D^*D\preceq I$ 允许 $\lVert D\rVert=1$（`main.tex:296`），只有 $\rho(D)<1$ 才救得起下面这条级数。展开 $\Phi_D(\zeta)=I+\sum_{j\ge1}(\zeta^{-j}D^j+\zeta^jD^{*j})$ 后，逐矩给出 $\int\zeta^j\Phi_D\,d\sigma=D^j$（`main.tex:342-344`）。于是对任何近闭圆盘全纯的 $h$ 都有 $h[D]=\int\Phi_D(\zeta)\otimes h(\zeta)\,d\sigma$（`main.tex:346-350`）。取 $h=v\circ f^{-1}$，标量复合给 $h[D]=v[A']$，再换元 $\zeta=\psi(t)$（`main.tex:351-356`）就落到目标表示 $v[A']=\int\Lambda(t)\otimes v(G(t))\,d\sigma$，零阶矩给 $\int\Lambda\,d\sigma=I$（`main.tex:356-357`）。密度本身是 $\Lambda(t)=j(t)\Phi_D(\psi(t))$，其中 $j(t)=\frac{tG'(t)f'(G(t))}{\psi(t)}>0$（`main.tex:323-324`）。这个 $j$ 是保形边界换元的角向 Jacobian：写 $\psi(e^{i\theta})=e^{i\eta(\theta)}$ 就有 $j=\eta'(\theta)>0$（`main.tex:353-354`），图 `coordinates.tex:27` 那条虚线 $\zeta=f(G(t))$ 画的正是它。

普适性就体现在 $V_m$ 的构造上：对每个 $m$，$(V_m b)(t)=(\Lambda(t)^{1/2}\otimes I_m)b$ 从 $\mathbb C^n\otimes\mathbb C^m$ 等距嵌入边界 $L^2$（`main.tex:359-364`），乘子 $M_v$ 乘 $I_n\otimes v(G(t))$，则 $v[A']=V_m^\dagger M_vV_m$ 且 $\lVert v[A']\rVert\le\max_{\overline\Omega}\lVert v\rVert$（`main.tex:365-370`），相似在第一因子给带 $\kappa$ 的那半界。`main.tex:372-373` 收尾一句把 §4 的伤口彻底缝合：$S$ 的定义和 $\Lambda$ 的定义都不依赖 $m$、也不依赖 $v$。我读到这里确认自己走对了，密度与被测函数解耦了，剩下只要证 $\kappa\le2$。

## 7 转折点三：分离、酉实现，与那个只为卡度量的辅助极值函数

要卡住 $\kappa$，我需要在 §6 的压缩里对某一个辅助函数拿到等号。假设 $\kappa>1$（`main.tex:224-225`），端点极值命题（`main.tex:386-401`）要找 $X,Y\in M_n(\mathbb C)$ 满足 $\mathrm{tr}(XX^*)=\mathrm{tr}(YY^*)=1$、$SX=\kappa X$、$SY=Y$、$X^*Y=0$，再配一个在 $\overline{\mathbb D}$ 上压缩的矩阵值有理函数 $F_\mathbb D$ 使 $F_\mathbb D[D]x=y$，其中 $x=\mathrm{vec}(X)$、$y=\mathrm{vec}(Y)$（`main.tex:388-397`）。这条命题证得绕，我在几个坎上都想偏过。

第一坎是分离本身。在实空间 $\mathbb R\oplus\mathrm{Herm}_n^3$ 里，仿射集 $\mathcal A_T=\{(s,J-I,sI-J,J-T^*JT)\}$（`main.tex:410-412`）与开凸集 $\mathcal O=\{(s,U,V,W):s<\kappa^2,\ U,V,W\succ0\}$（`main.tex:414-416`）不相交，一般凸分离框架引 Rockafellar（`main.tex:418-419`）。我起初以为直接把 $\mathcal O$ 往原点一侧压就分离了，可投影 $\pi(\mathcal O-a_0)=\mathcal K$ 可能让 $0\in\overline{\mathcal K}$，最近点论证当场失效。`main.tex:428-441` 给的补救是：取 $z_j=-c_*/j$，它落在 $\overline{\mathcal K}$ 外（否则 $0$ 会跑到内点与闭集的开放线段上而属于 $\mathcal K$），取 $\overline{\mathcal K}$ 中离 $z_j$ 最近点 $y_j$，则 $y_j\to0$，方向 $\nu_j$ 收敛到单位 $\nu$，仍给出支撑不等式。这一段是我 reconstruct 时最容易想略过、实则不能略的地方。

分出来以后，因为 $\mathcal A_T$ 是仿射的，$\ell$ 在其上恒定，在 $\mathcal O$ 上有界逼出符号 $\ell(s,U,V,W)=\lambda s-\mathrm{tr}(Y_0U)-\mathrm{tr}(X_0V)-\mathrm{tr}(Z_0W)$，$\lambda\ge0$、$X_0,Y_0,Z_0\succeq0$（`main.tex:447-449`）。第二坎是 $\lambda$ 的符号：若 $\lambda=0$，严格可行会在 $\mathcal A_T$ 上取到负值，可分离又要求取值不小于 $\sup_{\mathcal O}\ell=0$，矛盾，故 $\lambda>0$，缩放成一（`main.tex:451-453`）。归一后恒定性给出对偶关系 $X_0-Y_0=Z_0-TZ_0T^*$、$\mathrm{tr}\,X_0=1$（`main.tex:455-457`）。把 $(\kappa^2,H)$ 代入，常数值是 $\mathrm{tr}\,Y_0\ge\kappa^2$，而这点的取值是 $\kappa^2$ 减去几项非负迹仍不超过 $\kappa^2$，逼得每项皆零，于是 $\mathrm{tr}\,Y_0=\kappa^2$（`main.tex:458-464`）。第三坎是端点支撑：正矩阵 $B,C$ 有 $\mathrm{tr}(BC)=\lVert C^{1/2}B^{1/2}\rVert_{\mathrm{HS}}^2$，迹消零意味着 $\mathrm{ran}\,B\subseteq\ker C$，由此 $X_0$ 支撑在 $H$ 的 $\kappa^2$ 特征空间、$Y_0$ 支撑在 $1$ 特征空间（`main.tex:467-472`）。取平方因子 $XX^*=\kappa^{-2}SX_0S$、$YY^*=\kappa^{-2}SY_0S$、$Q=\kappa^{-2}SZ_0S$，列空间因 $\kappa>1$ 正交故 $X^*Y=0$（`main.tex:474-481`），合同变换给平衡式 $XX^*-YY^*=Q-DQD^*$（`main.tex:482-484`）。

第四坎，也是真正让局面打开的一步，是把平衡式变成酉实现。取 $L=Q^{1/2}$，两行 $R_1=[L\ Y]$ 与 $R_2=[DL\ X]$ 与各自伴随乘积相等，映射 $R_2^*v\mapsto R_1^*v$ 是良定义等距，补满成酉阵取伴随得 $[L\ Y]=[DL\ X]\begin{pmatrix}a&b\\c&d\end{pmatrix}$（`main.tex:490-499`）。这一步用的是经典插值机制（`main.tex:487-489`，引 Katsnelson--Kheifets--Yuditskii）与酉 colligation 的传递函数范数恒等式（`main.tex:505-506`，引 Brodskii）。由 $L=DLa+Xc$、$Y=DLb+Xd$ 且 $\lVert a\rVert\le1$、$\rho(D)<1$，迭代给按范数收敛的 $Y=Xd+\sum_{j\ge0}D^{j+1}Xca^jb$（`main.tex:502-504`）。定义 $R(\zeta)=d+\zeta c(I-\zeta a)^{-1}b$、$F_\mathbb D(\zeta)=R(\zeta)^{\mathsf T}$（`main.tex:508-511`），酉性给 $\mathrm U\binom{\zeta v}{e}=\binom{v}{R(\zeta)e}$，于是 $\lVert e\rVert^2-\lVert R(\zeta)e\rVert^2=(1-\lvert\zeta\rvert^2)\lVert v\rVert^2\ge0$，压缩成立（`main.tex:512-516`）；$\mathbb T$ 上任何表观极点都是可去奇点（真极点会在内径向趋近处发散，`main.tex:518-521`）。

最后把 $F_\mathbb D[D]x=y$ 钉死，靠的是张量约定下那条向量化的恒等式 $(D^k\otimes B)\,\mathrm{vec}(X)=\mathrm{vec}(D^kXB^{\mathsf T})$（`main.tex:526-527`）。$F_\mathbb D$ 的 Taylor 系数恰是 $d$ 与 $ca^jb$ 的转置，代回级数即得 $F_\mathbb D[D]x=y$（`main.tex:529-531`）。这里我踩过一个坑：起初随手用标量转置，第二因子顺序对不上；`main.tex:83-86` 定的"第一因子共轭线性、基空间在前"的约定加上那个 $\mathsf T$，才让取等成立。这个约定在 §8 里还会再吃一次，用来把交叉密度的均值整个消成零。

## 8 边界工具：外核、预解场，与一个把 Laurent 测试变成解析赋值的投影

要比较两套密度，我先得把边界算子备齐。外坐标 $G$ 在无穷远处写 $G(t)=at+b+O(t^{-1})$，$a\ne0$，记 $q_G(t)=tG'(t)$（`main.tex:552-553`）。$q_G(t)$ 是外向法向（`main.tex:99,1512-1513`，附录 `main.tex:1505-1514` 用 $G$ 的径向、角向导数正交且不消来确认），这个几何事实下面撑正性全靠它。由它定义一组标量多项式 $b_k$：$b_0=1$、$\deg b_k=k$、首项系数 $a^{-k}$，靠展开式 $\frac{q_G(t)}{G(t)-z}=\sum_{k\ge0}b_k(z)t^{-k}$（`main.tex:556-559`）。再给混合展开 $B(w,t)=\frac{q_G(t)}{G(t)-G(w)}-\frac{t}{t-w}=\sum_{i,j\ge1}\beta_{ij}w^{-i}t^{-j}$（`main.tex:561-563`），$B$ 过对角全纯，系数几何衰减 $\lvert\beta_{ij}\rvert\le C_\rho\rho^{i+j}$（`main.tex:569,613-614`），衰减来自在倒数双盘上做 Cauchy 估计。核 $m(w,t)=1+B(w,t)+\overline{B(w,t)}$ 连续、非负，且对每个变量的归一圆测度边缘都等于 1（`main.tex:572-575,625-634`）。非负这一步我核对得小心：$\mathbb T$ 上不同点处 $2\mathrm{Re}\,\frac{t}{t-w}=1$，于是 $m=2\mathrm{Re}\frac{q_G(t)}{G(t)-G(w)}\ge0$，正号来自法向与凸性给的 $\mathrm{Re}(\overline{q_G(t)}(G(t)-G(w)))\ge0$（`main.tex:626-631`）。$b_k$ 其实是经典 Faber 多项式、$\beta_{ij}$ 是微分过的 Grunsky 系数（`main.tex:658-664`）。

第二个正系统来原矩阵。对任何 $W(A)\subset\Omega$ 的有限矩阵 $A$，$K_A(t)=q_G(t)(G(t)I-A)^{-1}=\sum_{k\ge0}b_k(A)t^{-k}$，$E_A(t)=K_A(t)+K_A(t)^*\succeq0$（`main.tex:579-583`）。这里我一度想当然地以为 $E_A$ 的正性显然，实际靠的是直接合同 $R_t^*(K_A+K_A^*)R_t=q_GR_t^*+\overline{q_G}R_t$（$R_t=G(t)I-A$），在单位向量上其二次型是 $2\mathrm{Re}(\overline{q_G(t)}(G(t)-x^*Ax))\ge0$，支撑半平面加 $W(A)\subset\Omega$ 给号，再由 $R_t$ 可逆传回 $E_A\succeq0$（`main.tex:645-652`）。$E_A$ 的总质量是 $\int E_A\,d\sigma=2I_n$（`main.tex:746`），这跟 $\Lambda$ 的质量 $I_n$ 形成台账里那对"2 对 1"，两套系统的差别的根子就在这。

把核接成有界投影，是 §9 与 §10 真正要用 $\mathcal C$、$\mathcal C^\dagger$ 的前提。在 $\mathcal H_k=L^2(\mathbb T;M_k)$（逐点用未归一 HS 范数，`main.tex:676-678`）上，$P_0,P_+,P_-$ 是常数、严格正频、严格负频的 Fourier 投影（`main.tex:681-683`），定义 $\mathcal M u(w)=\int m(w,t)u(t)\,d\sigma$（`main.tex:686-687`）。物理 Cauchy 积分 $c_u(z)=\int u(t)\frac{q_G(t)}{G(t)-z}\,d\sigma$，对有限 Laurent 数据逐项积分给 $c_u(z)=\sum_{j\ge0}b_j(z)U_j$（`main.tex:699-709`），于是 $c_u$ 是整多项式、$t^j$ 的物理积分是 $b_j$（$j\ge0$）或 $0$（$j<0$）。投影定理（`main.tex:715-747`）说边界迹 $\mathcal C u=c_u\circ G$ 延成每个 $\mathcal H_k$ 上的有界投影，$\mathcal C=P_0+P_++\mathcal M P_+$，真实 Hilbert 伴随 $\mathcal C^\dagger u=u_0+u_++\mathcal M^\dagger u_-$（`main.tex:718-728`）。压缩性 $\lVert\mathcal M u\rVert_2\le\lVert u\rVert_2$ 来自逐点 Jensen（`main.tex:749-754`）。吃重的带权界 $\lVert\mathcal C^\dagger u\rVert_2^2+\lVert(\mathcal C^\dagger u)_0\rVert_2^2\le2\lVert u\rVert_2^2$（`main.tex:730-733,781-784`）是 §10 里那个 $4\lVert g\rVert^2$ 的上游；模块恒等式 $\mathcal C(F\mathcal C u)=F\mathcal C u$ 与 $\mathcal C((\mathcal C u)F)=(\mathcal C u)F$（`main.tex:736-739`）则保证左右两种乘法顺序都被 $\mathcal C$ 固定，这正对台账里 $F_\mathbb D$ 那行的用途。预解收缩式 $\int E_A\otimes u\,d\sigma=c_u[A]+c_{u^*}[A]^*$（`main.tex:742-745`）是把预解场和 Laurent 测试缝在一起的最后一环。

`main.tex:689-697` 那条 Remark 提醒我这套外核与 direct 证明共享：设 $h=G$、$\lambda=t$、$\mu=w$，其校正 $s(\lambda,\mu)=B(\mu,\lambda)$、$s_{kj}=\beta_{jk}$，得到的积分作用是同一个 $\mathcal M$（其 Hilbert 伴随则不是）。我在 reconstruct 时把这点当成"本文与 direct 的公共分析段"（`main.tex:541-548` 也这么说），所以 §8 这些构造对两条路都成立，差异要等到 §10 才拉开。

## 9 桥：一次取等，两套正密度，和一个整矩阵消掉的交叉均值

现在把 §7 的端点向量和 §8 的边界工具接起来。设 $\kappa>1$，记 $R_S=S\otimes I_n$，端点数据是 $\lVert x\rVert=\lVert y\rVert=1$、$R_Sx=\kappa x$、$R_Sy=y$、$F_\Omega[A']x=y$（`main.tex:839-842`），其中 $F_\Omega=F_\mathbb D\circ f$。

取等这一步我起初以为需要某种极端构造，其实全靠 §6 的等距 $V=V_n$。令 $x_\Lambda=Vx=(\Lambda^{1/2}\otimes I_n)x$、$y_\Lambda=Vy$，$M_F$ 乘 $I_n\otimes F(t)$，插值恒等式给一条夹逼 $1=\lVert V^\dagger M_FVx\rVert\le\lVert M_FVx\rVert\le\lVert Vx\rVert=1$（`main.tex:848-855`）。两端都是 1，中间两个不等号只能取等：第一个取等说 $M_FVx$ 落在 $\mathrm{ran}\,V$（否则正交投影 $VV^\dagger$ 保不住一个带非零垂向分量的向量的范数），第二个取等说正算子 $I-M_F^\dagger M_F$ 在 $Vx$ 处二次型为零从而湮灭它，于是几乎处处有纤维等式 $y_\Lambda=(I_n\otimes F)x_\Lambda$、$x_\Lambda=(I_n\otimes F^*)y_\Lambda$（`main.tex:856-865`）。这一步把 $M_F$ 在边界上的作用彻底锁死成 $F$ 的逐点乘。

对基因子取部分迹（对角基块之和，留下系数空间矩阵），定义 $p=\mathrm{Tr}_{\mathrm{base}}(x_\Lambda x_\Lambda^*)$、$q=\mathrm{Tr}_{\mathrm{base}}(y_\Lambda y_\Lambda^*)$、$r=\mathrm{Tr}_{\mathrm{base}}(y_\Lambda x_\Lambda^*)$（`main.tex:869-873`）。写 $x_\Lambda=\sum_a e_a\otimes\xi_a$、$y_\Lambda=\sum_a e_a\otimes\eta_a$，则 $r=\sum_a\eta_a\xi_a^*$，配纤维等式 $\eta_a=F\xi_a$、$\xi_a=F^*\eta_a$，得两条乘法顺序 $p=F^*r$、$r=Fp$、$q=rF^*$（`main.tex:875-882`）。这里台账第 29 行的模块恒等式 §8 就等着用。

真正让 §10 的正交论证成立的是下面这条我差点看漏的：同样的张量约定还识别了均值而不丢矩阵信息。$p=(X^*\Lambda X)^{\mathsf T}$、$q=(Y^*\Lambda Y)^{\mathsf T}$、$r=(X^*\Lambda Y)^{\mathsf T}$（`main.tex:885-889`），交叉密度 $(j,k)$ 元是 $\sum_a(\Lambda^{1/2}Y)_{aj}\overline{(\Lambda^{1/2}X)_{ak}}=(X^*\Lambda Y)_{kj}$（`main.tex:890-895`）。积分得 $r_0=(X^*Y)^{\mathsf T}=0$、$\mathrm{tr}(p_0)=1$（`main.tex:897-899`）。`main.tex:900-901` 特意警告：整个矩阵均值消失，只有标量 $\mathrm{tr}(r_0)=0$ 是不够的，那给不出下面要的 Fourier 正交。这就是我 §7 死磕转置约定的回报，也是 §4 那条死路（随便挑向量）永远拿不到的性质。

第二套正密度用原矩阵的 $E_A\succeq0$（§8）。令 $x_e=(E_A^{1/2}\otimes I_n)x$、$y_e=(E_A^{1/2}\otimes I_n)y$，同样取部分迹得 $p_e,q_e,r_e$，写成 $x_e=\sum_a e_a\otimes\alpha_a$、$y_e=\sum_a e_a\otimes\beta_a$，块 $\Delta=\sum_a\binom{\alpha_a}{\beta_a}\binom{\alpha_a}{\beta_a}^*\succeq0$ 即 $\begin{pmatrix}p_e&r_e^*\\r_e&q_e\end{pmatrix}$（`main.tex:913-926`）。这条正性吃的是原矩阵的 $W(A)\subset\Omega$，用不到 $A'=SAS^{-1}$ 的任何数值范围包含（`main.tex:927-928`）。

把 $E_A$ 场认成第一套密度的投影版本，靠相似给的 $\kappa$ 因子。对近 $\overline\Omega$ 全纯的 $v$，$v[A]=R_S^{-1}v[A']R_S$ 从而 $y^*v[A]x=\kappa\,y^*v[A']x$、$y^*v[A]^*x=\kappa^{-1}y^*v[A']^*x$（`main.tex:930-938`）；对角配对上两个因子正负相消。对 Laurent 多项式 $u$，$c_u$ 近 $\overline\Omega$ 全纯，用预解收缩式、上面的 $\kappa$ 因子与测试取向（`main.tex:903-909`）逐条推 $\langle r_e,u\rangle=\kappa\langle r,\mathcal C u\rangle+\kappa^{-1}\langle r,\widetilde{\mathcal C}u\rangle$，再移项到伴随得 $\langle\kappa\mathcal C^\dagger r+\kappa^{-1}\widetilde{\mathcal C}^\dagger r,u\rangle$；对角计算无相似因子。Laurent 稠密于是给投影密度 $p_e=\mathcal C^\dagger p+\widetilde{\mathcal C}^\dagger p$、$q_e=\mathcal C^\dagger q+\widetilde{\mathcal C}^\dagger q$、$r_e=\kappa\mathcal C^\dagger r+\kappa^{-1}\widetilde{\mathcal C}^\dagger r$（`main.tex:942-964`）。至此 §10 要的假设全部就位：一个非零场 $g=\mathcal C^\dagger r$，对角被 $2\lVert g\rVert_2$ 控制，交叉被 $\kappa\lVert g\rVert_2$ 托底，$\Delta$ 的正性会逼出 $\kappa\le2$（`main.tex:967-975`）。

## 10 有序比较：常数二到底从哪里冒出来

到这一步我手里只剩一条纯边界不等式的比较，它被专门以任意系数规模 $k$ 陈述，好暴露它的降维无关性（`main.tex:967-975,977-997`）。假设 $F=F_\Omega\circ G$ 取值在 $M_k$、近 $\overline\Omega$ 全纯、边界上 $\lVert F(t)\rVert\le1$；$p,q,r\in\mathcal H_k$ 满足 $p=p^*$、$q=q^*$、$p=F^*r$、$q=rF^*$、$r_0=0$、$\mathrm{tr}(p_0)>0$；按上式定义 $p_e,q_e,r_e$；若块 $\Delta(t)=\begin{pmatrix}p_e&r_e^*\\r_e&q_e\end{pmatrix}\succeq0$ 几乎处处成立，则 $\kappa\le2$（`main.tex:977-997`）。

证明开局就把三种乘法顺序分得极清，这是我从 §3 死路学到的教训。记 $g=\mathcal C^\dagger r$、$P_1=\mathcal C^\dagger p$、$P_2=\mathcal C^\dagger q$。左乘 $F$ 的 Hilbert 伴随是左乘 $F^*$、右乘 $F$ 的伴随是右乘 $F^*$，因为 $\mathrm{tr}((uF)^*v)=\mathrm{tr}(F^*u^*v)=\mathrm{tr}(u^*vF^*)$（`main.tex:999-1005`）。把 §8 模块恒等式两条取伴随、因子留在原侧，得有序投影 $P_1=\mathcal C^\dagger(F^*g)$、$P_2=\mathcal C^\dagger(gF^*)$（`main.tex:1006-1011`）。若 $g=0$，第一条使 $P_1=0$，与保均值和 $\mathrm{tr}(p_0)>0$ 矛盾，故 $g\ne0$（`main.tex:1011-1013`）。这个非零是最后敢除的凭据。

对角上界怎么得到 $4\lVert g\rVert_2^2$，是常数二的一半来源。每个 $P_j$ 只含非负 Fourier 幂、其均值 Hermitian，Fourier 正交给 $\lVert P_j+P_j^*\rVert_2^2=4\lVert(P_j)_0\rVert_2^2+2\lVert(P_j)_+\rVert_2^2=2(\lVert P_j\rVert_2^2+\lVert(P_j)_0\rVert_2^2)$（`main.tex:1015-1021`）。由 $\lVert F\rVert\le1$，$F^*g$ 与 $gF^*$ 的 HS $L^2$ 范数都不超 $\lVert g\rVert_2$；把带权界（§8 的 $\lVert\mathcal C^\dagger u\rVert_2^2+\lVert(\mathcal C^\dagger u)_0\rVert_2^2\le2\lVert u\rVert_2^2$）分别作用到 $P_1,P_2$ 的输入 $F^*g$、$gF^*$，再借 $\widetilde{\mathcal C}^\dagger$ 的星关系和 $p=p^*$、$q=q^*$，得 $\lVert p_e\rVert_2^2\le4\lVert g\rVert_2^2$、$\lVert q_e\rVert_2^2\le4\lVert g\rVert_2^2$（`main.tex:1022-1029`）。那个 $4$ 就是带权里的 $2$ 被 Fourier 恒等式再翻一倍。

交叉下界另一半也在这里现形。记 $h=\widetilde{\mathcal C}^\dagger r$，保均值加上整矩阵等式 $r_0=0$ 把 $g$ 塞进严格正频子空间、把 $h$ 塞进严格负频子空间，于是 $\lVert r_e\rVert_2^2=\kappa^2\lVert g\rVert_2^2+\kappa^{-2}\lVert h\rVert_2^2\ge\kappa^2\lVert g\rVert_2^2$（`main.tex:1031-1037`）。这正是 §9 那个整矩阵零均值的回报：$g\perp h$ 让 $\kappa^2$ 与 $\kappa^{-2}$ 之间没有交叉项，$\kappa$ 系数原封不动留在下界。若我手里只有标量 $\mathrm{tr}(r_0)=0$，这一步正交就没了，下界塌成不带 $\kappa$ 的东西。

收尾用符号矩阵把正性译成范数差。令 $J=\mathrm{diag}(I_k,-I_k)$，$\Delta$ 与 $J\Delta J$ 皆正给 $0\le\mathrm{tr}(\Delta^{1/2}(J\Delta J)\Delta^{1/2})=\mathrm{tr}(\Delta J\Delta J)=\lVert p_e\rVert_{\mathrm{HS}}^2+\lVert q_e\rVert_{\mathrm{HS}}^2-2\lVert r_e\rVert_{\mathrm{HS}}^2$（`main.tex:1038-1044`），逐点可积。合起来 $2\kappa^2\lVert g\rVert_2^2\le2\lVert r_e\rVert_2^2\le\lVert p_e\rVert_2^2+\lVert q_e\rVert_2^2\le8\lVert g\rVert_2^2$，因 $g\ne0$ 除得 $\kappa^2\le4$、$\kappa\le2$（`main.tex:1045-1051`）。常数二的账就此结清：左端那个 $2$ 来自 $J\Delta J$ 正性里 $-2\lVert r_e\rVert^2$ 的系数，右端那个 $8$ 来自两条对角界各 $4$，于是 $2\kappa^2\le8$ 逼出 $\kappa\le2$。

最后把两条定理合上（`main.tex:1054-1065`）：$\kappa=1$ 时界已成立；$\kappa>1$ 时 §7 的端点极值与 §9 的桥在辅助规模 $k=n$ 处凑齐引理全部假设，$\kappa\le2$ 得证。而 §6 早用同一个度量、同一张密度对每个独立选的 $m$ 立好了表示，于是对任意目标规模都成立。我盯着 $k=n$（辅助）与 $m$（任意）这两个数字解耦，确认 §4 那条死路真的被绕过去了。

## 11 从可行域到任意 Hilbert 空间：外逼近与有限压缩

前面全篇把 $\Omega$ 假设成可行域（有界开凸、边界正则实解析 Jordan，`main.tex:88-89`），可 $W(A)$ 未必满足这些。§11 要补的就是这层落差，把结果落到任意有限矩阵、再落到任意有界算子。多项式不等式 $\lVert P[A]\rVert\le2\max_{W(A)}\lVert P\rVert$ 对一切 $n,m,d$ 成立、常数与两个规模及次数无关、且无更小常数能一致成立（`main.tex:1075-1086`）。

卡点之一是把 $W(A)$ 塞进一个真正可行域。高斯外逼近引理（`main.tex:1088-1094`）给的办法我起初觉得玄：对非空紧凸 $K$ 和 $\epsilon$，取距离函数 $d_K$（凸、$1$-Lipschitz，`main.tex:1097-1099`），令 $h_\delta(x)=\mathbb E\,d_K(x-\delta Z)+\delta\lvert x\rvert^2$，$c=\mathbb E\lvert Z\rvert$，Lipschitz 界给 $\lvert\mathbb E\,d_K(x-\delta Z)-d_K(x)\rvert\le c\delta$（`main.tex:1100-1108`）。卷积实解析（对复化坐标用高斯控制，`main.tex:1109-1115`），严格凸、Hessian 至少 $2\delta I$。选 $\delta$ 使 $c\delta+\delta R_K^2<\epsilon/2$ 且 $c\delta<\epsilon/2$，则 $\Omega_\epsilon=\{h_\delta<\epsilon/2\}$ 满足两条包含，边界靠隐函数定理正则有向、靠径向投影同胚成 Jordan 曲线（`main.tex:1117-1130`）。这条构造的意义在于：数值范围退化成一点或一段时它照样给出可行域（`main.tex:1157`），这正是 `main.tex:1069-1071` 点名要用它、而 direct 的有限支撑指数构造（`main.tex:1071-1072`）之外我需要的兜底。

多项式推论的证明里我先确认 $W(A)$ 的凸性：Toeplitz--Hausdorff 定理在这里由二维压缩重证，秩一正交投影写成 $\frac12\begin{pmatrix}1+u&v+iw\\v-iw&1-u\end{pmatrix}$（`main.tex:1133-1146`）。再把高斯域套到 $K=W(A)$ 上，$P$ 固定，两条定理给 $\lVert P[A]\rVert\le2\max_{\overline\Omega_\epsilon}\lVert P\rVert$，紧邻域上一致连续使右端收敛到 $\max_K\lVert P\rVert$（`main.tex:1148-1158`）。锐利性用台账最后那行：$n=2$、$m=1$、$P(z)=z$、$A$ 取幂零二阶块（`main.tex:1159-1167`），$\lVert A\rVert=2$ 而 $2\lvert x_1x_2\rvert\le\lvert x_1\rvert^2+\lvert x_2\rvert^2=1$，故 $\max_{W(A)}\lvert P\rvert=1$，$2$ 不可再降。

搬到一般 Hilbert 空间这一步，是我最初完全没预想的、却最漂亮的一段。核心是有界算子的界 $\lVert P[A]\rVert\le2\sup_{W(A)}\lVert P\rVert$（`main.tex:1175-1190`）只靠有限压缩：对 $\xi=\sum_j\xi_j\otimes e_j$，取 $E=\mathrm{span}\{A^k\xi_j:0\le k\le d,\,1\le j\le m\}$、$A_E=Q_EA\lvert_E$，归纳给 $A_E^k\xi_j=A^k\xi_j$、$P[A]\xi=P[A_E]\xi$、$W(A_E)\subset W(A)$，套有限情形（`main.tex:1210-1239`）。`main.tex:1238-1239` 明说这套不用任何耗尽 $\mathcal H$ 的子空间序列，非可分性因此免费得到（呼应 abstract `main.tex:48-49`）。再补 $K=\overline{W(A)}$ 紧凸且含谱（`main.tex:1241-1259`），全纯与有理版本靠 Runge 多项式逼近把 contour 积分 $F[A]=\frac1{2\pi i}\int_\Gamma(zI-A)^{-1}\otimes F(z)\,dz$ 逼近到 $P_\ell[A]$（`main.tex:1261-1308`），于是 $\overline{W(A)}$ 是 $A$ 的完备 $2$-谱集。我原本只想证多项式，最后连有理和全纯泛函演算一并到手，这超出了 §1 里那条"再证一遍常二"的设想。

## 12 最终思路与最初设想的落差

把首尾对一遍，落差有几处值得我自己记住。设想阶段我要的是"给 $\lVert P[A]\rVert$ 一个直接的范数上界"，路径要么按块抬标量证明（§3，卡在系数交换）、要么从被测多项式奇异向量反推（§4，卡在 $S,\Lambda$ 失去普适）。落地的路径却是：先解一个度量优化 $\kappa^2=\min\{\tau:I\preceq H\preceq\tau I,\ T^*HT\preceq H\}$（`main.tex:108-111`），再证 $\kappa$ 恰是最优相似条件数（`main.tex:305-308`），接着造一张对所有 $m$ 通用的正密度（`main.tex:316-374`），最后用一次辅助规模 $k=n$ 的取等配合两套正密度逼出 $\kappa\le2$（`main.tex:967-1051`）。多项式界从 §11 的外逼近与压缩里当作推论掉出来，压根没被直接攻击过。

常数的来路也和我预想不同。我原以为 $2$ 会从某个几何常数长出来（毕竟 $1+\sqrt2$ 在前，`main.tex:170-172`），结果它纯粹是算术凑数：带权界里的 $2$ 翻成对角界的 $4$、块正性里的 $-2\lVert r_e\rVert^2$ 翻成 $2\kappa^2\lVert g\rVert^2$，两端一夹 $2\kappa^2\le8$（`main.tex:1045-1051`）。这个 $8$ 和那个 $2$ 谁都不带几何意味，却刚好把 $\kappa\le2$ 卡在锐利例（`main.tex:1159-1167`）的最优值上。

还有一个我起初当包袱、后来认出是骨架的东西：$S,\Lambda$ 与被测函数、与目标规模 $m$ 无关（`main.tex:146,372-373`）。标量证明里这不成问题，正因为没有系数规模可言；一旦要"完备"，这条无关性是全部难点所在。度量本身还不唯一，最优 $H$ 允许零松弛、允许 $\lVert D\rVert=1$（`main.tex:295-296`），我早期误以为要把 $S$ 选得 canonical 才能往下走，实际只要"取到某最小度量"就够。非可分性同样是白捡的：它没进我最初的目标清单，靠 §11 的有限压缩顺带解决（`main.tex:1238-1239`）。

## 13 与 Lean 登记的对照

我按边界规矩只翻了 records 第 1038 行指向的那个模块 `OAI/Analysis/NumericalRange/Main.lean`（70 行）与 `ComparatorChallenges/CompleteCrouzeix.json`。登记里 `solution_module` 是 `OAI.Analysis.NumericalRange.Main`，`theorem_names` 只有 `OAI.CompleteCrouzeix.main`，`definition_names` 为空，`permitted_axioms` 是 `propext`、`Quot.sound`、`Classical.choice`，`enable_nanoda` 为 false。对照模块本体：命名空间 `CompleteCrouzeix` 里，定理 `complete_crouzeix_bound`（`Main.lean:30-59`）陈述的是 $\lVert\text{polynomialAt}\ A\ B\rVert\le 2*\text{rangeMaximum}\ A\ B$，对 $0<n$、$0<m$ 的有限矩阵 $A$、系数列 $B$ 成立；定理 `main`（`Main.lean:61-63`）是 `UniversalBound 2 ∧ ∀ C, UniversalBound C → 2 ≤ C`，即常二成立且任何通用界 $C$ 都 $\ge2$。

把这条和论文对齐，我看到的覆盖面是 §11 的 Corollary polynomial（`main.tex:1075-1086`）连同其最优性（`main.tex:1159-1167`），停在有限矩阵层。`Main.lean:43` 调 `exists_admissible_neighborhood` 给一个包住 `numericalRange A` 的可行域，再在 `Main.lean:52` 用 `D.polynomial_bound_unit` 把归一化后的系数 $B'$（`Main.lean:45-51`，缩到 $\lVert P\rVert\le1$）套上界 $2$，最后 `le_of_forall_pos_le_add`（`Main.lean:34-35`）加 $\epsilon/2$ 收口。这整套是"可行域上单位界"的直接引用，论文 §5 到 §10 那一路最优度量、公共密度、端点分离、酉实现、$\kappa\le2$ 的算术，在本模块里都塌进了 `D.polynomial_bound_unit` 一个黑箱。[推测] 该黑箱连同 `exists_admissible_neighborhood` 都在 `Main.lean:1` 导入的 `OAI.Analysis.NumericalRange.DomainBound` 里；我按取证纪律没有打开那个依赖模块，所以它内部到底有没有把 $\kappa^2=\min\{\tau:\ldots\}$、$\Lambda$、$\Delta\succeq0$ 这套结构形式化，我无从断言。

由此我确认两件事。其一，Lean 登记里的 `main` 对应论文的推论级结论，对应不上 `thm:structural`（`main.tex:116-130`）与 `thm:representation`（`main.tex:132-147`）这两条结构定理，除非那些结构内容被搬进了我没看的 `DomainBound`。其二，`Classical.choice` 被允许，和论文里"取某个最小度量 $H$"（`main.tex:113-114`）、"选 $\delta$"（`main.tex:1117-1118`）这类选择动作相容。至于 Hilbert 空间版 `cor:hilbert`（`main.tex:1175-1309`）的有限压缩，`Main.lean` 通篇是 `Matrix (Fin n)` 的有限矩阵陈述，没出现任意 $\mathcal H$ 上的 $A$，[推测] 该无穷维推广没在这个模块里形式化；我没法从这 70 行确认它被证过，只能标为对照缺口。

## 14 还没打通之处与 [推测] 清单

把这份 reconstruct 里我确实没把握的地方摊开，逐条说清证据缺在哪。

关于 §3 与 §4 两条死路：论文本身不叙述失败尝试，它是 `main.tex:59-264` 一路正向铺陈。我把"抬块"与"先固定测试多项式"读成早期弯路，依据只有三处对比句：交换论证过不到矩阵系数（`main.tex:176-178`）、direct 与被本文分别取"奇异向量优先"对"度量优先"（`main.tex:197-203`）、辅助函数规模 $n$ 与目标规模 $m$ 的解耦声明（`main.tex:224-230`）。这三处能支撑"这两条路各卡在哪"，但支撑不了"研究者真的先后试过它们"，那属于我的 reconstruct，整段该读作 [推测]。

关于最优度量的唯一性：`main.tex:295-296` 说优化器可能有零松弛、$\lVert D\rVert=1$ 被允许，`main.tex:113-114` 把 $H$ 称作"某个"极小度量。全文我没找到 $\kappa^2$ 处最小值是否唯一的任何断言。[推测] 一般不唯一，因为 §7 的分离只用了 $\kappa^2$ 特征空间和 $1$ 特征空间的支撑信息（`main.tex:467-472`），对其它特征空间上的 $H$ 未加约束；证据不足在于论文没讨论极值点结构。

关于 $j(t)>0$ 的定向：`main.tex:323` 断言 $j=\frac{tG'(t)f'(G(t))}{\psi}>0$，其正性归到 $\psi=f\circ G$ 是保定向圆微分同胚（`main.tex:100`、附录 `main.tex:1515-1519`）。我把这条链当作已证。[推测] 若 $\psi$ 反定向则 $j<0$ 会让 §6 的测度搬运带符号，但这在附录已被保定向排除，属低风险推测。

关于常数 $C_\rho$：`main.tex:569`、`main.tex:613-614` 只给 $\lvert\beta_{ij}\rvert\le C_\rho\rho^{i+j}$ 这种存在性几何衰减，随 $r<\rho<1$ 选法而定。[推测] 具体 $C_\rho$ 依赖 $G$ 在倒数盘上的解析半径；论文不需要显式值，只 §6、§8 用其可和性，故未给闭式。

关于与 direct 证明的行级对应：`main.tex:689-697` 给了 $h=G$、$\lambda=t$、$\mu=w$、$s(\lambda,\mu)=B(\mu,\lambda)$、$s_{kj}=\beta_{jk}$ 的换名，可它指向的 `\cite{Direct}` 正文（`references.tex:84-88`）我按纪律没读，那条 `github.com/.../paper.pdf` 也被我排除在素材外。所以 §8 末尾"公共分析段"的判断只建立在本文自述的 `main.tex:541-548` 上，无法逐式核对到 direct 那边，这是我能取证边界内的固有限制。

关于 Lean 覆盖：§13 里两处 [推测]（`DomainBound` 内部、无穷维推广是否形式化）源于我只被允许看 `Main.lean`、json 与 records 行，看不到依赖模块，这属于登记对照的已知盲区，不影响本笔记对 `main.tex` 正文的所有行号引用。

## 15 底下那层地基：保形坐标是怎么一砖一砖砌起来的

回头复盘时我承认，§5 到 §9 全篇骑在 Lemma conformal-coordinates（`main.tex:92-101`）上，可我一开始把它当现成工具用，差点低估它。整条坐标在附录 `main.tex:1323-1520` 里逐段重建，用的都是经典极值论证（`main.tex:1315-1318` 点名 Ahlfors 与 Pommerenke）。把它算作思考链的一环，是因为我卡过它的三个细节。

第一块是 Riemann 映射本身走极值路线。在所有单叶全纯 $\phi:U\to\mathbb D$、$\phi(z_*)=0$ 里极大化 $\lvert\phi'(z_*)\rvert$，上确界 $\alpha$ 正且有限（小圆盘给 Cauchy 导数上界，`main.tex:1327-1330`）。取逼近列，Cauchy 估计加紧耗尽给局部一致收敛的子列，极限单叶靠辐照原理（两点同像就在两小圆盘各留住一个零点，与单叶矛盾，`main.tex:1331-1341`）。满射那步是我当时没料到的巧：设 $w\in\mathbb D\setminus\phi(U)$，$q=\frac{\phi-w}{1-\overline w\,\phi}$ 在单连通域上无零故有平方根 $h$，$h$ 仍单叶且 $|h|<1$，令 $\beta=h(z_*)$，$\psi=\frac{h-\beta}{1-\overline\beta\, h}$ 在 $z_*$ 处导数模是 $\frac{1+\lvert w\rvert}{2\sqrt{\lvert w\rvert}}\alpha>\alpha$（`main.tex:1342-1360`）。那把不等式 $\frac{1+\lvert w\rvert}{2\sqrt{\lvert w\rvert}}>1$ 是算术均值不小于几何均值，正是它让"漏掉一点 $w$"反推出矛盾。我记下这个数，因为它是整篇第一处把"常数"从算术里逼出来的地方，和 §10 里 $2\kappa^2\le8$ 的气质其实一致。

第二块是解析边界上的调和反射。用把边界弧拉直的坐标 $z=\chi(\xi)$，$u(\xi)=\log\lvert\phi(\chi(\xi))\rvert$ 在上半盘调和且负、在实直径上取零（`main.tex:1369-1380`）。反射用 Poisson 奇延拓直接得（上半圆给 $u$、下半圆给其反射的负值，延拓在实轴奇、故在直径上消失，`main.tex:1382-1389`）。$\widehat u$ 在原点梯度非零这一步我读了两遍：首个非零齐次项形如 $c\,\mathrm{Im}(\xi^k)$，若 $k\ge2$ 则 $\sin(k\theta)$ 在 $0<\theta<\pi$ 变号，会逼 $u$ 变号，矛盾，故 $k=1$（`main.tex:1391-1400`）。取共轭 $\widehat v$，$\exp(\widehat u+i\widehat v)$ 全纯非零、原点导数非零，与 $\phi\circ\chi$ 同模故商为常模常数，调常后回物理坐标就跨 $p$ 全纯延拓（`main.tex:1402-1407`）。

第三块是把局部延拓缝成一个延拓，再证单叶。选有限多个小盘 $V_i=B(p_i,R_i/3)$ 覆盖边界，重叠透镜 $U_i\cap U_j$ 含边界点且与 $U$ 相交，同一性定理令两侧延拓相等，缝成 $\overline U$ 邻域上的全纯 $\phi$（`main.tex:1409-1434`）。边界像既开又紧故为整圆，两点同像会在 $\D$ 内近处给双原像、与内部单叶矛盾，于是 $\overline U$ 上单叶；再排除邻域里趋近的同像对，得闭包邻域上单叶，其逆全纯延到 $\overline\D$ 邻域（`main.tex:1436-1458`）。外坐标用反演 $\iota(z)=\frac1{z-z_0}$（`main.tex:1465-1467`）把 $\overline\Omega$ 外（含无穷）映成含零的有界星形单连通域，映射后 $G(t)=z_0+\frac1{h(1/t)}$、$a=h'(0)^{-1}\ne0$、$G(t)=at+b+\sum_{\ell\ge1}c_\ell t^{-\ell}$（`main.tex:1490-1499`）。最后 $tG'(t)$ 是外向法向、$itG'(t)$ 是正切向、$f\circ G$ 保定向微分同胚（`main.tex:1504-1519`），这条正是 §6 里 $j(t)=\eta'(\theta)>0$ 的定向凭据。

我把附录单列一节，是为了在 reconstruct 里诚实标注：它不属于"我走过的弯路"，它属于"我以为不必自己证、结果 §7 的 $G$ 与 §9 的 $q_G$ 都靠它兜底"。台账第 19、20 行的 $G$、$q_G$ 一旦没有这套构造，外核 $m\ge0$ 和 $E_A\succeq0$ 两处正性就都失去几何抓手。

## 16 被我从略的约定：全纯求值与三种伴随符号

这一节我本该更早写，因为 §7 的取等、§8 的密度表示、§9 的矩阵零均值、§10 的"左右乘法各有其伴随"，全都吊在 `main.tex:69-86` 与 `main.tex:266-276` 那段看起来很无聊的约定上。数值范围写作 $W(A)=\{x^*Ax:x\in\mathbb C^n,\ x^*x=1\}$（`main.tex:72-75`）。矩阵值函数 $v$ 谱近全纯时 $v[A]$ 走 Jordan 块上的 Taylor：对 $J=\beta I+N$ 有 $v[J]=\sum_{j=0}^{s-1}N^j\otimes v^{(j)}(\beta)/j!$，再在第一因子换基（`main.tex:77-81`）；特别地 $v(z)=\sum_j B_jz^j$ 时 $v[A]=\sum_j A^j\otimes B_j$（`main.tex:81-82`）。求值规则在 `main.tex:266-273` 讲清：有限 Jordan Taylor 的乘积律保住系数矩阵的次序，共轭 Jordan 形给第一因子上的相似，标量复合给 $(v\circ f)[J]=v[f(J)]$ 与 $\mathrm{spec}(f(A))=f(\mathrm{spec}(A))$，全程不假想可对角化。我起初觉得"不可对角化"这条是多余的谨慎，直到 §5 要保证 $\mathrm{spec}(A)\subset W(A)\subset\Omega\Rightarrow\rho(T)<1$（`main.tex:277`）时才发现，谱映射对亏损矩阵照样成立，全靠这套 Taylor 定义。

三个伴随符号是 `main.tex:83-86` 立的：内积对第一因子共轭线性，$U\preceq V$ 指 $V-U$ 半正定，${}^*$ 是基空间或系数空间上的伴随，${}^{\mathsf T}$ 是普通转置，${}^\dagger$ 是函数空间算子的伴随。§10 一开局就吃这条：左乘 $F$ 的 Hilbert 伴随是左乘 $F^*$、右乘 $F$ 的伴随是右乘 $F^*$，验证用 $\mathrm{tr}((uF)^*v)=\mathrm{tr}(u^*vF^*)$（`main.tex:999-1005`），这里 $*$ 是逐点矩阵伴随、$\dagger$ 才是在 $\mathcal H_k$ 上的算子伴随，两者若混用整步就废。§6 的 $v[A']=V_m^\dagger M_vV_m$（`main.tex:367-369`）用的也是 $\dagger$，因为 $V_m$ 是往边界 $L^2$ 的等距嵌入、其伴随在函数空间一侧（`main.tex:214-218` 那句"乘以后取嵌入的伴随"）。

最让我后悔没早点写清楚的是转置 $\mathsf T$ 和"整矩阵均值"的绑死关系。§9 里 $p=(X^*\Lambda X)^{\mathsf T}$、$q=(Y^*\Lambda Y)^{\mathsf T}$、$r=(X^*\Lambda Y)^{\mathsf T}$（`main.tex:885-889`），交叉密度 $(j,k)$ 元展开成 $\sum_a(\Lambda^{1/2}Y)_{aj}\overline{(\Lambda^{1/2}X)_{ak}}=(X^*\Lambda Y)_{kj}$（`main.tex:890-895`），正是这个 $kj$ 对 $jk$ 的转置，把 $\int r\,d\sigma$ 认成 $(X^*Y)^{\mathsf T}$。$X^*Y=0$ 因此给出 $r_0=(X^*Y)^{\mathsf T}=0$ 这个整矩阵为零（`main.tex:897-899`）。我最初 reconstruct 到这一步，只算了 $\mathrm{tr}(r_0)=0$，正交论证当场不成立；`main.tex:900-901` 那句警告"只有标量迹不够"就是在拦我这个错。台账第 18 行 $X^*Y$ 那格标的"§9 正交失、`$\kappa$` 下界无"，根因就在这条转置约定；可见 §7 我死磕的第一因子共轭线性、基空间在前，全部意义到 §9、§10 才兑现。

顺带把 §4 那条死路再说透一层。从固定 $v$ 的奇异向量反推，之所以连"整矩阵零均值"都给不出，是因为那对向量随 $v$ 变，$X^*Y=0$ 这类关系只在 §7 用分离与酉实现把 $X,Y$ 建成 $H$ 的 $\kappa^2$ 与 $1$ 特征向量的平方因子后才恒成立（`main.tex:474-481`）。约定的严苛程度，本质是被"普适 $S,\Lambda$"倒逼出来的；这也是 §3、§4 两条死路在正文里我一句话带过、实则处处咬人的地方。

## 17 差点被我略过的酉 colligation，与那条收敛的不动点级数

§7 里最像我"借来的机器"的是 `main.tex:486-534`。我 reconstruct 时一度把它当已知插值结果跳过，后来发现它每一步都吃 §5、§6 的产物，得回头补。起点是平衡式 $XX^*-YY^*=Q-DQD^*$（`main.tex:482-484`）。令 $L=Q^{1/2}$，两行 $R_1=[L\ Y]$、$R_2=[DL\ X]$。它们与各自伴随的乘积相等：$R_1R_1^*=LL^*+YY^*=Q+YY^*$，$R_2R_2^*=DQD^*+XX^*$，两者之差恰是平衡式左边右边对调，故 $R_1R_1^*=R_2R_2^*$（`main.tex:490-491`）。于是映射 $R_2^*v\mapsto R_1^*v$ 是值域上的良定义等距，补齐维数相同的正交余成给一个酉阵、取伴随，得 $[L\ Y]=[DL\ X]\begin{pmatrix}a&b\\c&d\end{pmatrix}$，记 $U=\begin{pmatrix}a&b\\c&d\end{pmatrix}$ 酉（`main.tex:491-499`）。这一步的"平衡给等距、等距补成酉"是经典插值机制（`main.tex:487-489` 引 Katsnelson--Kheifets--Yuditskii），端点数据与有限维实现是这里新立的。

拆块得 $L=DLa+Xc$、$Y=DLb+Xd$。把第一个式子反复代入第二个：$Y=Xd+DLb=Xd+D(DLa+Xc)b=Xd+D^2La+DXcb$，继续把 $L$ 展开一次得 $D^3La+D^2Xca\cdot b$ 之类，靠 $\lVert a\rVert\le1$（酉块）与 $\rho(D)<1$（§5），级数按范数收敛成 $Y=Xd+\sum_{j\ge0}D^{j+1}Xca^jb$（`main.tex:500-504`）。我当时卡在这里想确认"为什么只需 $\lVert a\rVert\le1$，无须加强到 $\lVert a\rVert<1$"，答案是酉块的范数只需 $\le1$，真正压住余项的是 $\rho(D)<1$ 带来的 $D^{j+1}$ 衰减，两者叠起来才收敛。这步正是酉 colligation 的传递函数恒等式（`main.tex:505-506` 引 Brodskii）。

据此对 $\lvert\zeta\rvert<1$ 定 $R(\zeta)=d+\zeta c(I-\zeta a)^{-1}b$、$F_\mathbb D(\zeta)=R(\zeta)^{\mathsf T}$（`main.tex:507-511`）。压缩性我核对过：取 $e\in\mathbb C^n$、$v=(I-\zeta a)^{-1}be$，酉性给 $U\binom{\zeta v}{e}=\binom{v}{R(\zeta)e}$，由保范数算出 $\lVert e\rVert^2-\lVert R(\zeta)e\rVert^2=(1-\lvert\zeta\rvert^2)\lVert v\rVert^2\ge0$（`main.tex:512-517`），故 $R$ 在 $\mathbb D$ 上压缩，转置不损范数与全纯（`main.tex:517`）。可去极点这一步容易被想跳：$R$ 的分式有界于 $\mathbb D$，$\mathbb T$ 上任何表观极点若为真极点会在内径向趋近处发散，矛盾故可去，消完后有限个极点离 $\overline\D$ 有距，给一个公共邻域使 $F_\mathbb D$ 全纯，连续性把压缩带到圆周（`main.tex:518-523`）。最后向量化恒等式 $(D^k\otimes B)\mathrm{vec}(X)=\mathrm{vec}(D^kXB^{\mathsf T})$（`main.tex:526-527`）把 $F_\mathbb D$ 的 Taylor 系数（恰为 $d$、$ca^jb$ 的转置）代回级数，得 $F_\mathbb D[D]x=y$（`main.tex:529-531`）。有理只在圆盘变量里断言，$F_\Omega=F_\mathbb D\circ f$ 只要求近 $\overline\Omega$ 全纯（`main.tex:531-533`）。

我把这节单列，是因为 §10 的比较对 $F$ 只提两条要求：近 $\overline\Omega$ 全纯、边界 $\lVert F(t)\rVert\le1$（`main.tex:978-980`）。这两条恰靠此处 colligation 的压缩与可去极点同时兑现；任一失守，§10 的模块恒等式和 $\lVert F^*g\rVert\le\lVert g\rVert$ 都落空，$\kappa\le2$ 就无从谈起。

## 18 算子层推论的两处硬骨头：谱包含与有理演算

§11 我把算子版一带而过，其实 `main.tex:1175-1309` 有两块我起初没当真、事后发现是完备谱集的命门。第一块是 $K=\overline{W(A)}$ 包含谱 $\mathrm{spec}(A)$。对 $\lambda\notin K$，$\delta=\mathrm{dist}(\lambda,K)>0$，Cauchy--Schwarz 给 $\lVert(\lambda I-A)x\rVert\lVert x\rVert\ge\lvert\langle x,(\lambda I-A)x\rangle\rvert\ge\delta\lVert x\rVert^2$（`main.tex:1245-1252`）。因 $W(A^*)=\{\overline z:z\in W(A)\}$，同法给 $\lVert(\overline\lambda I-A^*)y\rVert\ge\delta\lVert y\rVert$（`main.tex:1253-1255`）。第一个下界使 $\lambda I-A$ 单射且值域闭，第二个使值域稠密（其正交余是 $\overline\lambda I-A^*$ 的核，`main.tex:1256-1258`），于是可逆，$\mathrm{spec}(A)\subset K$（`main.tex:1258-1259`）。我读这段时一度以为谱包含是"显然"，直到看见它靠两个方向的下界拼出满射，才明白无界算子情形这步绝不省。

第二块是从多项式升到全纯与有理。先取 $\epsilon$ 使 $K_\epsilon=\{z:\mathrm{dist}(z,K)\le\epsilon\}\subset U$，其补连通，Runge（有理逼近后把极点挪到无穷，`main.tex:1266-1269`，引 `references.tex:108-111`）给矩阵多项式 $P_\ell$ 在 $K_\epsilon$ 上一致逼近 $F$；逐分量用标量定理，逐点一致即算子范数一致（`main.tex:1270-1274`）。选可行域 $\Omega$、$\Gamma=\partial\Omega$ 正向，全纯演算逐元素写 $F[A]=\frac1{2\pi i}\int_\Gamma(zI-A)^{-1}\otimes F(z)\,dz$，按算子范数收敛；多项式情形把 contour 抬到大圆、预解 Neumann 展开还回既定的基空间在前求值，误差 $\lVert F[A]-P_\ell[A]\rVert\le\frac{\mathrm{length}(\Gamma)}{2\pi}\max_\Gamma\lVert(zI-A)^{-1}\rVert\max_\Gamma\lVert F-P_\ell\rVert\to0$（`main.tex:1275-1292`）。取更大邻域是为在固定 contour 上收敛、不止在 $K$ 上收敛（`main.tex:1295-1296`）。有理那步：极点在 $K$ 外的矩阵有理函数在全纯于某 $U$、避开所有极点，谱包含保证其有理求值良定义，且与上面 contour 求值相符，预解恒等式把 $(z-a)^{-1}$ 的 contour 求值认作 $(A-aI)^{-1}$、对 $a$ 求导给高阶极点、部分分式给一切有理函数（`main.tex:1298-1306`）。这才把 $\overline{W(A)}$ 说成完备 $2$-谱集，比 §11 的多项式界更强。零空间 $\mathcal H=\{0\}$ 的边角约定也在 `main.tex:1205-1208`：一切求值为零算子、空上确界记零，界是 $0\le0$。

## 19 把 abstract 的四句承诺逐句对回正文

收尾前我把 `main.tex:46-57` 的四句承诺拆开，逼自己每句交出处。第一句"以证锐利常二数值范围不等式解决 complete Crouzeix 猜想，对所有有界算子与所有矩阵值多项式、不需可分性"，落在 §11 的有限多项式界 `main.tex:1075-1086`、§18 的算子界 `main.tex:1187-1190`，非可分靠 `main.tex:1238-1239` 的有限压缩。第二句"$\overline{W(A)}$ 是完备 $2$-谱集，界延到闭包附近全纯的有限矩阵值函数"，落在 `main.tex:1191-1203` 与 §18 的 Runge 升格。第三句"对有限矩阵与含其数值范围、边界正则实解析 Jordan 的有界凸域，使保形圆盘像压缩的最优相似被取到、条件数不超 $2$"，落在 §5 的 `main.tex:116-130`，其可行域前提在 `main.tex:88-89`、其"取到"在 `main.tex:289-290`、其"条件数恰等于最小相似"在 `main.tex:305-308`。第四句"对相似后的矩阵，一个质量为恒等元的连续正边界密度表示所有近闭域全纯矩阵值函数的赋值"，落在 §6 的 `main.tex:132-147`，普适性凭 `main.tex:372-373`。四句都能交出处，我据此确认正文没有越出 abstract 的承诺、abstract 也没有比正文多要什么。

顺带把两处容易读漏的限定也钉一下。abstract `main.tex:50-52` 说"every matrix-valued polynomial"，正文把"所有系数规模 $m$、所有次数 $d$"写成与 $m,d$ 无关（`main.tex:154-157`）；abstract `main.tex:52-53` 说"holomorphic near that closure"，正文把闭包换成 $K=\overline{W(A)}$ 并要求 $U\ni K$（`main.tex:1191-1197`）。这两处限定我早先 reconstruct 时容易滑过去，现在按行号补回。

## 20 为什么边界要实解析，以及锐利例上的那笔账

有个我一直没正面回答的问题：可行域为何非要正则实解析 Jordan 边界（`main.tex:88-89`），随便一个凸的开集不行吗？把 §5 到 §8 拆开看就明白，实解析至少在三处吃重。其一，附录的调和反射（`main.tex:1363-1407`）要把 $f$ 跨边界全纯延拓，靠的是边界局部解析参数化把 $u=\log\lvert\phi\rvert$ 作 Poisson 奇延拓，边界若仅 $C^1$ 就没有这个全纯延拓，Lemma `main.tex:94-95` 那句"$f$ 与 $f^{-1}$ 单叶延过 $\overline\Omega$、$\overline\D$"立刻落空。其二，外坐标 $G$ 要单叶延到 $\{|t|>r\}\cup\{\infty\}$、无穷处简单极点（`main.tex:96-99`、`main.tex:1490-1499`），这靠解析边界的反射与反演 $\iota(z)=\frac1{z-z_0}$ 保实解析（`main.tex:1481-1482`）。其三，§8 的外核 $\beta_{ij}$ 几何衰减 $\lvert\beta_{ij}\rvert\le C_\rho\rho^{i+j}$（`main.tex:569,613-614`）来自 $B$ 在倒数双盘全纯的 Cauchy 估计，边界失解析则衰减不成、双级数不正规收敛，$\mathcal M$ 的压缩也悬。所以实解析是这些正性与收敛的公分母。

锐利例上我把那笔算术再走一遍，好确认台账最后那行不是空话。取 $n=2$、$m=1$、$P(z)=z$、$A=\bigl(\begin{smallmatrix}0&2\\0&0\end{smallmatrix}\bigr)$。$\lVert P[A]\rVert=\lVert A\rVert=2$（`main.tex:1160`），而对单位 $x\in\mathbb C^2$ 有 $\lvert x^*Ax\rvert=2\lvert x_1x_2\rvert\le\lvert x_1\rvert^2+\lvert x_2\rvert^2=1$（`main.tex:1162-1164`），等号在 $x_1=x_2=1/\sqrt2$ 处取到，于是 $\max_{W(A)}\lvert P\rvert=1$（`main.tex:1165-1166`）。比值 $\lVert P[A]\rVert/\max_{W(A)}\lvert P\rVert=2$ 把常二钉死，且它已是基空间二阶、系数一阶的情形，所以对一切 $n,m,d$ 的一致常数都降不到 $2$ 以下（`main.tex:1166-1167`）。下界那端，$\kappa^2\ge1$ 是平凡的：$I\preceq H\preceq\tau I$ 逼 $\tau\ge1$（`main.tex:290`），台账第 1、2 行的 $1\le\kappa^2\le4$ 左端由此而来。

有一处我谨慎地不下断言：本文没写清这个幂零 $A$ 上最优相似的 $\kappa$ 是否正好等于 $2$，`main.tex:189-192` 只说二维椭圆的数值范围上 Badea--Crouzeix--Delyon 造出条件数不超 $2$ 的保形相似。[推测] 锐利性由多项式界层面（上面那笔账）就已确立，无须 $\kappa$ 真的达到 $2$；至于 $\kappa$ 能否逼近 $2$，正文未给构造，我标为推测、不硬编。这份笔记到此，从 §3、§4 的两条死路，到 §5 的度量优化、§6 的普适密度、§7 的端点分离与酉实现、§8 到 §10 的两套正密度与常数二算术、§11 到 §18 的算子推广，每一步都能落回 `main.tex` 的某段行号；凡落不回的，都已就地标 `[推测]`。

## 21 拿论文自带的路线图反查我的 reconstruct

`main.tex:205-264` 是作者自书的一张"两条结论如何证"路线图，把它逐段对回我 §3 到 §20，能检验 reconstruct 是否走偏。路线图第一句讲 §metric 先取到度量最小、再在估 $\kappa$ 之前造出正圆盘密度（`main.tex:206-207`），我这边正对应 §5 先立优化、§6 先造密度、都早于 §10 估 $\kappa$。它接下来说边界换元 $t\mapsto G(t)\mapsto\psi(t)$ 有正角向 Jacobian，把它塞进密度给 $\Lambda$，质量一使 $b\mapsto(\Lambda^{1/2}\otimes I_m)b$ 成等距嵌入，乘 $I_n\otimes v(G(t))$ 再取伴随得 $v[A']$（`main.tex:207-218`），这是我 §6 的主体。它写"Figure 展示两个边界参数"（`main.tex:219`、`coordinates.tex`），我在 §6 用 $j=\eta'>0$ 兑现了那个换元。

路线图中段讲：若 $\kappa>1$，有限维分离给 $S\otimes I_n$ 的 $\kappa$ 与 $1$ 特征空间里的单位 $x,y$，酉实现给压缩的 $F_\mathbb D$ 使 $F_\mathbb D[D]x=y$，其系数规模取 $n$、只为测试一套基空间度量、不限目标 $m$（`main.tex:224-230`）。这段我一字不差地放进 §4（作为死路的解药）与 §7（作为构造）。它再点 §inputs 的外核、真实 Cauchy 伴随、两种解析乘法顺序、原 $A$ 的正预解（`main.tex:232-235`），我落在 §8。它讲 §bridge 用压缩取等给 $x_\Lambda,y_\Lambda$ 的前后与伴随关系、部分迹求和留下系数场、张量约定钉死的转置把均值对齐含一个整矩阵消失的交叉均值、原 $A$ 预解给第二正块、解析与伴随交叉测试以 $\kappa$ 与 $\kappa^{-1}$ 联系两块（`main.tex:236-245`），这正是我 §9 与 §16 反复强调的转置约定。

路线图最末说：决定性比较在第二正块里拿交叉密度对两条对角密度，用带 HS 范数的边界 $L^2$，正性把交叉范数平方两倍钉在对角平方和之下，两对角皆由同一非零投影交叉场 $g$ 控制，零矩阵均值把两投影交叉项分进正交 Fourier 子空间使 $\kappa$ 给第二条交叉密度下界（`main.tex:247-254`）。这段与我 §10 一步步对得上：$g\ne0$、对角界 $4\lVert g\rVert^2$、交叉界 $\kappa^2\lVert g\rVert^2$、$J\Delta J$ 正性给 $2\kappa^2\lVert g\rVert^2\le8\lVert g\rVert^2$。它合起来证 $\kappa\le2$、回到每个目标规模的公共密度，再进 §limit 把结果用于多项式、升到任意有限数值范围含点与段、用有限压缩与全纯逼近得任意 Hilbert 空间有界算子的完整不等式，附录给局部保形重建（`main.tex:255-263`）。这些我在 §11、§15、§18 依次接住。

对完全程，我的 reconstruct 顺序（先度量、后普适密度、再辅助极值、最后常数算术）与作者路线图同向；我额外补的两条死路 §3、§4，路线图没写，是从 `main.tex:176-178`、`main.tex:197-203`、`main.tex:224-230` 三处对比句反推的，标 §14 的 [推测]。这份笔记就按这个对应关系收住。

## 22 三个最脆的量，我各自再验一遍

临收稿我挑台账里最容易被自己写错的三处，逐个回 `main.tex` 复核一遍数值与来路。

其一，两套密度差的那个因子 $2$。$\Lambda$ 的质量是 $\int_\T\Lambda\,d\sigma=I_n$（`main.tex:356-357`），它来自 $\Phi_D$ 的零阶矩 $\int\zeta^j\Phi_D\,d\sigma=D^j$ 取 $j=0$（`main.tex:343-344`）。$E_A$ 的质量是 $\int_\T E_A\,d\sigma=2I_n$（`main.tex:746`），因为 $K_A(\infty)=I_n$（`main.tex:640`）给 $\int K_A=I_n$，而 $E_A=K_A+K_A^*$ 两半各贡献 $I_n$（`main.tex:582`）。`main.tex:827-829` 专门强调 $E_A$ 与归一化的 $\Lambda$ 是两回事、质量不同、表示不同。我一度想把 $E_A$ 也归一到质量 $I_n$ 好让 §10 对称，后来确认不能：§10 的交叉下界 $\lVert r_e\rVert_2^2=\kappa^2\lVert g\rVert_2^2+\kappa^{-2}\lVert h\rVert_2^2$（`main.tex:1035-1036`）里那个不带额外系数的 $\kappa^2$，正对应 $E_A$ 未缩水的 $2I_n$ 质量；归一会把 §9 的 $\kappa$ 因子与 $E_A$ 的质量搅在一起，台账第 26 行"质量非 $2I_n$ 则 §8 与 $\Lambda$ 对照反"记的就是这笔。

其二，$\rho(T)<1$ 怎么传到 $\rho(D)<1$。$T=f(A)$ 因 $\mathrm{spec}(A)\subset W(A)\subset\Omega$ 与谱映射给 $\rho(T)<1$（`main.tex:277`）。$D=Sf(A)S^{-1}$（`main.tex:123`）与 $T$ 相似，谱相同故 $\rho(D)=\rho(T)<1$（`main.tex:293`）。这条相似保谱传递看着显然，却正是 §6 级数绝对一致收敛 $\sum_{j\ge0}\lVert D^j\rVert<\infty$ 的凭据（`main.tex:337-338`），台账第 6 行的 $\rho(D)<1$ 由此落地。

其三，为何 §6 用谱半径、不用范数。最优度量下 $D^*D\preceq I$ 允许 $\lVert D\rVert=1$（`main.tex:293-296`），极值点松弛可以为零。若我拿 $\lVert D\rVert<1$ 去证收敛，就在端点失守；论文全程咬住 $\rho(D)<1$（`main.tex:337-338`），把 $\lVert D\rVert=1$ 的边界情形也纳进来。这跟我 §5 里 $\kappa=\min\lVert R\rVert\lVert R^{-1}\rVert$（`main.tex:305-308`）允许最小值被取到、$H$ 可退化，是同一套"在闭包里取极值、故只能靠谱半径这种连续且不被范数饱和卡住"的纪律。三处验完，我对台账里那几个带 $2$、带 $\rho$ 的行都有了可回指的落点。
