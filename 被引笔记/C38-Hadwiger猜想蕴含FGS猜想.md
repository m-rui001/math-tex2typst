# C38 Hadwiger猜想蕴含FGS猜想（arXiv:2108.10303）

## 0 取证边界

- arXiv id：2108.10303；原题名 "Hadwiger's conjecture implies a conjecture of Füredi-Gyárfás-Simonyi"；作者（API 署名逐字）：Stijn Cambie；发表年月：2021-08-23。
- 素材目录：`E:\math\被引素材/2108.10303`。主 tex 清单（实测）：`ReductionConjs.tex`（10092 字节 / 164 行），单文件全包。
- 本语料引用它的稿号与 bib key（原样登记）：D207（bib key `cambie2021`）；D210（bib key `cambie2021`）。
- 取证读取实测：1 次 Read，区间 `ReductionConjs.tex:1-164`，全文逐行读毕。素材即全文（引言两猜想、两条引理、主定理证明、致谢与文献表壳），无未读正文区间；`\bibitem` 内容在未附上的 `imp_a2.bib`，本稿只登记正文行内出现的引注名（hadw、BCE80、S16、DM82、PST03、KPT、FGS、Fox10）。
- 记法展开凭据（preamble 实测）：素材自定义算子 `\h`→`\operatorname{h}`、`\cm`→`\operatorname{cm}`、`\ccl`→`\operatorname{ccl}`（`ReductionConjs.tex:19-21`）；枚举标签重定义为罗马/拉丁小写（`ReductionConjs.tex:24-28`）。其余记号（$\delta,\omega,\alpha,\chi,\eta$）是标准图参数，无宏展开问题。
- 本稿对素材未展开的两处压缩推理（引理 2.1 末段"A 是团故可扩到 $\ge t$ 的匹配"、引理 2.2 的"再成一边"）给出补全读法并明说是补的；素材自身只交到不等式骨架。

## 1 图参数记法与基础不等式

全文是无环无向有限简单图。参数行（`ReductionConjs.tex:49-52`）：$\delta(G)$ 最小度、$\omega(G)$ 团数、$\alpha(G)$ 独立数、$\chi(G)$ 色数；Hadwiger 数 $\eta(G)$ 为使 $G$ 含 $K_t$ 子式的最大 $t$，即经删边与缩边能得到的最大完全图之阶，别家写作 $\operatorname{ccl}(G)$ 或 $\operatorname{h}(G)$（`ReductionConjs.tex:50-52`）。连通族（`ReductionConjs.tex:54-58`）：不相交子图 $H,H'$ 称为连通（connected），若存在 $u\in V(H)$、$v\in V(H')$ 使 $uv\in E(G)$；一族两两不相交子图称为（成对）连通族，若其中任意两者连通。素材点明关键等价（`ReductionConjs.tex:60`）：

$$
\eta(G)=\max\{\text{两两连通的不相交连通支个数}\},
$$

即 $K_t$ 子式与 $t$ 个两两连通的分枝集一一对应。$\operatorname{cm}(G)$ 是最大连通匹配（两两连通的不相交边集）的边数（`ReductionConjs.tex:61-62`）。

三条基础不等式，全部是素材正文写出的：其一，色数-独立数关系

$$
\chi(G)\ge\frac{n}{\alpha(G)}
$$

（`ReductionConjs.tex:72`，每色类是独立集、$n$ 个顶点分进 $\chi$ 个类）。其二，$\alpha=2$ 图的团-度不等式：对每个顶点 $v$，$\overline{N[v]}$（闭邻域的补集，即与 $v$ 不相邻的非 $v$ 顶点集）必须是团（其中两点若不邻接就和 $v$ 一起构成独立三元组），取 $v$ 为最小度点得

$$
n-(\delta+1)\le\omega
$$

（`ReductionConjs.tex:115`，"重要观察"，是两条引理共用的引擎）。其三，团内可取出连通匹配：

$$
\operatorname{cm}(G)\ge\Bigl\lfloor\frac{\omega}{2}\Bigr\rfloor
$$

（`ReductionConjs.tex:126`，团内极大匹配的两两公共邻点仍在团内，故该匹配自动连通）。

问题谱系两条：Hadwiger 猜想（1943）说无 $K_{t+1}$ 子式的图 $t$-可染色，等价形即 $\eta\ge\chi$；由随机图 $G_{n,1/2}$ 的结果它几乎对全体图成立（`ReductionConjs.tex:66-70`）。把 $\chi\ge n/\alpha$ 代入得弱形 $\eta\ge n/\alpha$，Duchet–Meyniel 首研；$\alpha=2$ 情形因诱导 $K_{1,2}$（海鸥）而名海鸥问题：

$$
\alpha(G)=2\ \Longrightarrow\ \eta(G)\ge\frac{n}{2},
$$

且该弱形与 "$\alpha=2$ 类上的 Hadwiger 猜想" 等价（PST03 定理 3.1，`ReductionConjs.tex:72-81`）；$G$ 无诱导 $C_4$ 或无诱导 $C_5$ 时海鸥问题成立（PST03 定理 5.2 与 5.5，`ReductionConjs.tex:80`）。$\eta(G)\ge cn$（$c>\frac13$）当且仅当存在线性大小的连通匹配（`ReductionConjs.tex:86`，KPT 与 FGS 的观察），这就是连通匹配参数进入舞台的理由。

## 2 FGS 风险猜想、尖锐例子与本文归约陈述

FGS 猜想（`ReductionConjs.tex:93-95`）：设图 $G$ 满足 $\alpha=2$、阶 $n=4t-1$，则

$$
\operatorname{cm}(G)\ge t .
$$

素材原话称 FGS 作者"冒险"猜出精确下界（`ReductionConjs.tex:42-43,87`）。尖锐性例（`ReductionConjs.tex:97` 登记）：$G=K_{2t-1}\cup K_{2t-1}$。按本稿实算：该图 $\alpha=2$（每块团取一点即极大独立集），两块团之间无边，故任何两条分属不同块的边不连通，连通匹配整体落在单个 $K_{2t-1}$ 内，尺寸 $\lfloor(2t-1)/2\rfloor=t-1$，即 $\operatorname{cm}=t-1$；其阶为 $4t-2$。对阶恰为 $4t-1$ 的相邻例 $K_{2t}\cup K_{2t-1}$，同法得 $\operatorname{cm}=\max\{\lfloor 2t/2\rfloor,\lfloor(2t-1)/2\rfloor\}=t$，恰触猜想下界：两例夹出界 $t$ 与 $t-1$ 各自不可改形的原因。

当前最佳一般下界（`ReductionConjs.tex:98`）：同设定（$\alpha=2$、$n=4t-1$）下已知

$$
\operatorname{cm}(G)=\Omega\bigl(n^{4/5}\log^{1/5} n\bigr)
$$

（Fox，素材记为 $\Theta$ 量级的下界结果）；与猜想的线性界 $\operatorname{cm}\ge(2n+3)/4$ 量级（$n=4t-1$ 时 $t=(n+1)/4$）之间有从多项式 $n^{4/5}$ 到线性的缺口。

## 3 引理一：团数被连通匹配卡住

引理 2.1（`ReductionConjs.tex:118-133`）。设图 $G$ 阶 $n=4t-1$、$\alpha=2$、$\operatorname{cm}\le t-1$，则

$$
\omega\le\operatorname{cm}.
$$

证明按素材行序复现，不等式全部落地。反设 $\omega>\operatorname{cm}$。

第一拍（连通性）：若 $G$ 不连通，则 $\alpha=2$ 迫使 $G$ 恰为两个团的并 $K_a\cup K_b$（三个分量的话每分量取一点便得独立三元组；分量内两点不邻接同理），$a+b=4t-1$ 故较大者 $a\ge 2t$，团内匹配给出 $\operatorname{cm}\ge\lfloor a/2\rfloor\ge t$，与 $\operatorname{cm}\le t-1$ 矛盾；于是 $G$ 连通（`ReductionConjs.tex:124-125`）。

第二拍（两个数值界）：$\operatorname{cm}\ge\lfloor\omega/2\rfloor$ 与 $\operatorname{cm}\le t-1$ 联立得

$$
\Bigl\lfloor\frac{\omega}{2}\Bigr\rfloor\le t-1\ \Longrightarrow\ \omega\le 2t-1,
$$

再经基础不等式 $n-(\delta+1)\le\omega$ 得

$$
\delta\ge n-1-\omega\ \ge\ (4t-2)-(2t-1)=2t-1
$$

（`ReductionConjs.tex:126-127`）。

第三拍（二部匹配论证）：取团 $A$，$|A|=\omega$，$B=G\setminus A$；设 $M$ 为二部图 $G[A,B]$ 的最大匹配。素材说 $|M|\ge\omega$ 时"即完"（`ReductionConjs.tex:130`）：此时 $A\cup M$ 内 $|M|$ 条二部边经团 $A$ 两两连通，可扩出 $\ge t$ 的连通匹配。核心是 $|M|<\omega$ 情形的计数：断言

$$
|A\cup V(M)|=\omega+2|M|\ \ge\ 2t .
$$

素材论证（`ReductionConjs.tex:131`）：若不然，取 $a\in A\setminus V(M)$，其邻居数 $\ge\delta$，而 $A\cup V(M)$ 除去 $a$ 自身只剩 $\omega+2|M|-1<\delta$ 个点，故 $a$ 必有邻居落在 $B\setminus V(M)$，于是 $M$ 可增广，违背最大性。继而（`ReductionConjs.tex:132`）：$A\cup M$ 含至少 $2t$ 个点、$A$ 是团，素材断言其中的匹配可扩为大小 $\ge t$ 的连通匹配，与 $\operatorname{cm}\le t-1$ 矛盾。补全读法（申报为笔者补）：$M$ 的边两两经 $A$ 中端点的团边连通；$A$ 中尚未被 $M$ 覆盖的点两两相邻，对它们内部配对再并入 $M$，可得大小至少

$$
|M|+\Bigl\lfloor\frac{\omega-|M|}{2}\Bigr\rfloor=\Bigl\lceil\frac{\omega+|M|}{2}\Bigr\rceil
$$

的两两连通边族；由 $\omega+2|M|\ge 2t$ 与 $\omega\le 2t-1$ 及 $\omega\ge|M|$ 可核验 $\lceil(\omega+|M|)/2\rceil\ge t$ 在素材给出的不等式组下成立。素材质地只交到"since $A$ is a clique"一语，上面是把它换成不等式的一读。$\omega\le\operatorname{cm}$ 得证。

推论形态：反例图（$\operatorname{cm}\le t-1$）的团数同样被卡死，$\omega\le\operatorname{cm}\le t-1$，代入 $n-(\delta+1)\le\omega$ 立刻得最小度下界

$$
\delta\ \ge\ n-1-\omega\ \ge\ (4t-2)-(t-1)=3t-1,
$$

这正是下一节引理 2.2 第一行用的数（`ReductionConjs.tex:140`）。

## 4 引理二：点边连通族的组件数不超连通匹配数

引理 2.2（`ReductionConjs.tex:135-142`，主证明的枢纽）。设 $G$ 阶 $n=4t-1$、$\alpha=2$、$\operatorname{cm}\le t-1$；若 $k_1$ 个单点与 $k_2$ 条边构成两两连通族，则

$$
k_1+k_2\le\operatorname{cm}.
$$

素材反证设计：若结论失效，取满足 $k_1+k_2=\operatorname{cm}+1\le t$ 的连通族，并在所有这些族中令 $k_2$ 极大。三组计数（`ReductionConjs.tex:140`）：

$$
\delta\ \ge\ 3t-1,\qquad
\text{族占据的顶点数}\ \le\ k_1+2k_2\ \le\ 2\operatorname{cm}+1\ \le\ 2t-1,\qquad
k_2\le\operatorname{cm},
$$

其中 $\delta\ge 3t-1$ 来自引理 2.1 的推论形态（$\omega\le\operatorname{cm}\le t-1$）；第二式用了 $k_1+k_2=\operatorname{cm}+1$，故 $k_1+2k_2=(k_1+k_2)+k_2\le(\operatorname{cm}+1)+\operatorname{cm}=2\operatorname{cm}+1$，再由 $\operatorname{cm}\le t-1$ 收得 $\le 2t-1$。

增广一步（`ReductionConjs.tex:141`）：对族中任一单点成员 $v$，其邻居至少 $\delta\ge 3t-1$ 个，而全族只占至多 $2t-1$ 个点，$3t-1>2t-2$，故 $v$ 必有邻居 $w$ 在族的顶点并之外。补全读法（申报为笔者补，素材质地是"So we can form an additional edge which is connected, i.e. $k_2$ was not taken maximal"）：把成员 $\{v\}$ 替换成边 $\{v,w\}$，族仍两两连通（$v$ 原本与每个成员相接，连通边照旧经过 $v$；$w$ 是新点不碍事），成员总数不变而 $(k_1,k_2)$ 变为 $(k_1-1,k_2+1)$，与 $k_2$ 极大矛盾；若 $k_1=0$，则 $k_2=\operatorname{cm}+1$ 条边自身就是超过 $\operatorname{cm}$ 的连通匹配，直接矛盾。故 $k_1+k_2\le\operatorname{cm}$。

注意此引理的陈述对象"点与边组成的连通族"恰好是子式分枝集的原型：单点分枝集与两点分枝集（两点连通即一条边）。

## 5 主定理证明：分枝集计数与双重不等式

主定理（素材引言区 `ReductionConjs.tex:104-106` 陈述，证明在 `ReductionConjs.tex:146-153`）。设 $G$ 阶 $n=4t-1$、$\alpha=2$、$\operatorname{cm}\le t-1$（即 FGS 猜想的反例图），则

$$
\eta(G)\le 2t-1 .
$$

于是海鸥问题在 $n=4t-1$ 处失效（其要求是 $\eta\ge n/2=2t-\frac12$，即整数意义下 $\eta\ge 2t$），海鸥与 Hadwiger 在 $\alpha=2$ 类等价，Hadwiger 告吹；contraposition 即主定理。

证明反设存在 $K_{2t}$ 子式。子式按素材第 1 节等价形给出 $2t$ 个两两连通的不相交连通分枝集。把分枝集按尺寸分类：$k_1$ 个尺寸 $1$（单点）、$k_2$ 个尺寸 $2$（两点连通即一条边）、$k_3$ 个尺寸 $\ge 3$。三条计量关系（`ReductionConjs.tex:149-150`）：

$$
k_1+k_2+k_3=2t\quad(\text{组件总数}),\qquad
k_1+k_2\le t-1\quad(\text{引理 2.2：}k_1+k_2\le\operatorname{cm}\le t-1),
$$

$$
k_1+2k_2+3k_3\le n=4t-1\quad(\text{分枝集两两不交、尺寸分别}\ \ge 1,2,3).
$$

收束的双重不等式（`ReductionConjs.tex:152`，素材逐字）：

$$
6t\;=\;3(k_1+k_2+k_3)\;\le\;\bigl(k_1+2k_2+3k_3\bigr)+2(k_1+k_2)\;\le\;(4t-1)+2(t-1)\;=\;6t-3 .
$$

左等号是组件计数；第一个不等号逐分量核验：尺寸 $\ge 3$ 的组件在右式计 $3$（经第一括号）、尺寸 $2$ 的计 $2+2=4$、尺寸 $1$ 的计 $1+2=3$，均不小于左式的 $3$ 倍权（右式对 $k_2$ 多给了 $k_2\ge 0$）；第二个不等号分别代入上面两条计量。$6t\le 6t-3$ 即 $0\le -3$，矛盾。故 $K_{2t}$ 子式不存在，$\eta(G)\le 2t-1$。

补一句子式方向：素材没有要求分枝集导出子图完全（子式定义只要求各部连通、部间有边），第 1 节的等价 $\eta(G)=\max$ 连通族组件数（`ReductionConjs.tex:60`）已把这点消化。反例图的 Hadwiger 数被钉在 $2t-1$，即 $K_{2t}$ 是反例图够不到的最小完全子式。

主定理与 Hadwiger 的正式接线（笔者按素材 `ReductionConjs.tex:68-70,72` 补写形式）：设 Hadwiger 真，反设 FGS 伪，取 $n=4t-1$、$\alpha=2$、$\operatorname{cm}\le t-1$ 的 $G$，则上面证得 $\eta(G)\le 2t-1$；另一方面 Hadwiger 给

$$
\eta(G)\ge\chi(G)\ge\frac{n}{\alpha(G)}=\frac{4t-1}{2}=2t-\frac12,
$$

两式对整数 $\eta(G)$ 矛盾。故 Hadwiger $\Rightarrow$ FGS。素材致谢段另记 FGS 原始猜想的"冒险"评语与四位被致谢者（`ReductionConjs.tex:155-157`）。

## 6 数值核验与界余量

量化结构写开（据前引各行，便于 D 稿核对引用强度）：FGS 猜想的形是

$$
\forall t\ge 2,\ \forall G:\quad |V(G)|=4t-1\ \wedge\ \alpha(G)=2\ \Longrightarrow\ \operatorname{cm}(G)\ge t,
$$

主定理证的是其逆否前置：对同一 $G$，

$$
|V(G)|=4t-1\ \wedge\ \alpha(G)=2\ \wedge\ \operatorname{cm}(G)\le t-1\ \Longrightarrow\ \eta(G)\le 2t-1<\frac{|V(G)|}{2}+\frac12 ,
$$

即反例 $G$ 自己同时是海鸥问题在阶 $4t-1$ 的反例；海鸥与 Hadwiger 在 $\alpha=2$ 类等价（`ReductionConjs.tex:79`）闭合最后一步。中间那半整数写清楚：海鸥要求 $\eta\ge\frac{4t-1}{2}=2t-\frac12$，$\eta$ 为整数故等价于 $\eta\ge 2t$，与 $\eta\le 2t-1$ 正面冲突。

$\operatorname{cm}$ 与 $\eta$ 的一个无条件单向不等式（笔者按素材 `ReductionConjs.tex:60` 的等价形补写）：任一连通匹配若含 $m$ 条边，则该 $m$ 条边是 $m$ 个两两连通的连通分枝集，按第 1 节等价即给出 $K_m$ 子式，故对一切图

$$
\eta(G)\ \ge\ \operatorname{cm}(G).
$$

素材登记的 KPT/FGS 观察（$\eta(G)\ge cn$ 对某 $c>\frac13$ 成立当且仅当存在线性连通匹配，`ReductionConjs.tex:86`）中，$\Leftarrow$ 方向的无条件版本就是上式配上 $\operatorname{cm}\ge c'n$；$\Rightarrow$ 方向需要 $\alpha=2$ 的结构，素材不证、只引。本稿主证明没有直接用 $\eta\ge\operatorname{cm}$，它走的恰是反向通道：从 $\operatorname{cm}$ 小推 $\eta$ 小，而 $\eta\ge\operatorname{cm}$ 说明这两参数在 $\alpha=2$、$n=4t-1$、$\operatorname{cm}\le t-1$ 的角落被同时挤压：$\operatorname{cm}\le\eta\le 2t-1$，下界消失、上界收紧，海鸥缺口的宽度 $\eta-\frac n2$ 在反例假想下至多 $(2t-1)-(2t-\frac12)=-\frac12$。
小情形全枚举级核验（笔者按定理条件实算，素材未列数字）。

$t=2$、$n=7$：猜想断言 $\alpha=2$ 的 $7$ 点图有 $\operatorname{cm}\ge 2$ 的连通匹配。尖锐候选 $K_4\cup K_3$：$\alpha=2$，连通匹配限于单块团内，$\operatorname{cm}=\max\{\lfloor 4/2\rfloor,\lfloor 3/2\rfloor\}=2$，恰界；此时 $\eta(K_4\cup K_3)=4$（两块团子式合并至多 $K_4$，$K_5$ 需 $5$ 个两两连通组件），海鸥下界要求 $\eta\ge 3.5$ 即 $4$，$4=4$ 不违反；反例链在 $t=2$ 处没有可违的对象，引理 2.2 的 $\delta\ge 3t-1=5$ 与 $7$ 点、$\omega\le\operatorname{cm}=2$ 相容（$7-(5+1)=1\le\omega$ 自动）。

$t=3$、$n=11$：尖锐候选 $K_6\cup K_5$，$\operatorname{cm}=\max\{\lfloor 6/2\rfloor,\lfloor 5/2\rfloor\}=3=t$，恰界。核验主证明三计量在"若有 $K_6$ 子式"假想下：$k_1+k_2+k_3=6$，引理 2.2 的 $k_1+k_2\le\operatorname{cm}=3$ 此处给出 $6t\le(4t-1)+2\cdot 3$，即 $18\le 11+6=17$，矛盾余量 $1$；主证明用更紧的 $\operatorname{cm}\le t-1=2$（反例设定下）得 $18\le 11+4=15$，余量 $3$。可见反证链的富余恰是 $3$：把组件计数 $6t$ 与容量 $4t-1$ 之差 $2t-1$ 同 $2(\operatorname{cm}+1)$ 对照，$\operatorname{cm}\le t-1$ 时 $2(\operatorname{cm}+1)\le 2t$，而需要 $\le 2t-3$ 才能矛盾，缺口 $3$ 由 $4t-1$ 的奇性提供（$n=4t-1$ 时 $\sum$ 尺寸至多 $4t-1$，尺寸全 $2$ 的最优布局也要偶数个点，浪费 $1$；引理 2.2 比"至多 $\operatorname{cm}+1$"再紧 $1$；素材未明说这层，登记为笔者的算术读法）。

界不可再弱的位置：引理 2.2 的结论若放宽为 $k_1+k_2\le\operatorname{cm}+1$，主不等式右端变 $(4t-1)+2t=6t-1$，仍矛盾（$6t\le 6t-1$）；若放宽为 $k_1+k_2\le\operatorname{cm}+2$ 则右端 $6t+1$，链条断掉。故本证明实际用到的强度是"$\le\operatorname{cm}+1$" 即可，素材取到的 $\le\operatorname{cm}$ 富余一级。另一处：尺寸分层里 $k_3$ 组件只按 $3$ 计费，若图里有大分枝集，$k_1+2k_2+3k_3\le 4t-1$ 更松、矛盾更硬，证明的最坏情形恰是"几乎全是边分枝集"，与 $F=K_{2t}\cup K_{2t-1}$ 型极值图呼应。

阶形参数量级（素材 `ReductionConjs.tex:94` 锁定 $n=4t-1$）：$n=4t$ 时猜想强度按 $t=\lfloor(n+1)/4\rfloor$ 续推无新内容（去掉一个顶点连通匹配至多掉 $1$）；素材只声明 $4t-1$ 形，本稿不代它扩写。

$T=4$ 一档全档实算（延续 $t=2,3$ 的核验风格）：$n=4t-1=15$，尖锐候选 $G_0=K_8\cup K_7$：$\alpha(G_0)=2$（两块团各取一点），连通匹配整块落在单团内，$\operatorname{cm}(G_0)=\max\{\lfloor 8/2\rfloor,\lfloor 7/2\rfloor\}=4=t$，恰触界。假想 $G_0$ 落在反例设定（$\operatorname{cm}\le t-1$）里跑主证明三计量：$k_1+k_2+k_3=2t=8$；$k_1+k_2\le\operatorname{cm}\le 3$；$k_1+2k_2+3k_3\le 15$。双重不等式给出

$$
24=3\cdot 8\ \le\ 15+2\cdot 3=21,
$$

假，余量 $24-21=3$。把 $t=3$ 档（$18\le 15$ 前写 $11+4=15$，余 $3$）与 $t=4$ 档（余 $3$）并排可读出一般式：

$$
6t-\bigl[(4t-1)+2(t-1)\bigr]=3\quad\text{对一切}\ t\ \text{恒成立},
$$

即矛盾余量与 $t$ 无关、恒为 $3$：容量项 $4t-1$ 与组件权项 $2(t-1)$ 随 $t$ 的增速合计 $6t-3$，恰比左端 $6t$ 慢 $3$。这就是归约对整个 $t$ 轴统一成立而不需大 $t$ 分档核验的全部原因，也说明证明对参数不能容忍任何一侧的松动：若 $n$ 的形改为 $4t$（容量 $+1$）或引理 2.2 改为 $k_1+k_2\le\operatorname{cm}+2$（权项 $+2$），$3$ 的余量立刻被吃穿，链条断裂。素材在 $n=4t-1$ 与 $n=4t$ 两形之间只声明前者（`ReductionConjs.tex:94`），与此灵敏度一致。

余量在极端分枝布局下的逐档核验（笔者实算）：余量 $3$ 的分配可拆为两处独立损耗。其一，容量不等式 $k_1+2k_2+3k_3\le 4t-1$ 取等要求 $k_3$ 个三点组件恰好铺满奇数余量：$k_1=0$、$k_3=0$ 时总占用 $2k_2=4t$ 为偶数，与 $4t-1$ 差 $1$，此为"$n$ 的奇性"损耗；其二，第二计量 $k_1+k_2\le\operatorname{cm}\le t-1$ 在 $G_0$ 类极值图上是 $k_1+k_2\le t$（若只用 $\operatorname{cm}\le t$），素材引理 2.2 给到 $\le\operatorname{cm}$ 够不到 $\le\operatorname{cm}+1$，再省 $2$，$1+2=3$ 与恒等余量对上。两处损耗各自不可再挤，与本节开头 $t=3$ 档的对照一致。

## 7 与本语料的接缝

本语料两稿以 bib key `cambie2021` 引本篇：D207 与 D210（派单原样登记，两稿正文本写手未读，此处只交接读法）。

对接点按可引用性排：其一，归约本身（Hadwiger $\Rightarrow$ FGS，等价于"FGS 的反例是 Hadwiger 反例的胚芽"，`ReductionConjs.tex:102-108`），D 稿若在 Hadwiger/海鸥谱系里需要把"精确常数型连通匹配下界"降级为已知大定理的推论，引主定理一条即可，注意它只对 $n=4t-1$ 的形给出界 $t$。其二，引理 2.2（点边连通族组件数 $\le\operatorname{cm}$，`ReductionConjs.tex:135-142`）是可独立移植的计数杠杆：任何"分枝集按尺寸分层 + 容量不等式"的子式论证都可能调它；使用时须带齐三假设 $n=4t-1$、$\alpha=2$、$\operatorname{cm}\le t-1$。其三，基础不等式 $n-(\delta+1)\le\omega$（$\alpha=2$ 图，`ReductionConjs.tex:115`）与 $\operatorname{cm}\ge\lfloor\omega/2\rfloor$（`ReductionConjs.tex:126`）在极值图论稿里常被单独征引。其四，状态登记用：FGS 现知下界 $\Theta(n^{4/5}\log^{1/5}n)$ 级（Fox，`ReductionConjs.tex:98`）、海鸥问题在无诱导 $C_4$/$C_5$ 类成立（`ReductionConjs.tex:80`）、$\eta\ge cn$（$c>1/3$）与线性连通匹配等价（`ReductionConjs.tex:86`）。

记号读法：$\operatorname{cm}(G)$ 在素材里以自定义算子 `\cm` 落地（`ReductionConjs.tex:21`），本稿与 D 稿对接一律写作 `\operatorname{cm}`；$\eta$ 即 Hadwiger/contraction clique 数，素材注明他文或写 `\ccl`、`\h`（`ReductionConjs.tex:52`），对接时以 $\eta$ 为准以免与色数 $\chi$ 混排。更正前笔：本篇素材定理环境共享计数，引言区四个环境的实际编号是 Conjecture 1.1（Hadwiger）、1.2（海鸥）、1.3（FGS）与 Theorem 1.4（主定理），第 2 节两引理为 Lemma 2.1、2.2；§2 处"素材内即 Theorem 2.1 前的主结果"一句按此更正。发表年月 2021-08-23（arXiv v1），未见期刊终稿信息于素材内。

更正与补记两笔：其一，§6 首段起首的 "$T=4$ 一档" 应为 "$t=4$ 一档"，纯排字之误，该段全部数值按 $t=4$、$n=15$ 读；其二，§2 曾把主定理位置写作"引言区"，更精确的座标是 `ReductionConjs.tex:104-106` 陈述、`ReductionConjs.tex:146-153` 证明，两处旧说法不冲突、以后者为准。D 稿征引时的最小心跳集：假设三元组（$n=4t-1$、$\alpha=2$、$\operatorname{cm}\le t-1$）、结论二元组（$\eta\le 2t-1$、contraposition 至 Hadwiger），界 $t$ 的尖锐例 $K_{2t}\cup K_{2t-1}$，全部有本稿 §2、§5、§6 的行号可回查。素材把这条记为主观察（`ReductionConjs.tex:110-111`）：$n=4t-1$、$\alpha=2$、$\operatorname{cm}\le t-1$ 的图里，点边连通族的组件数至多 $\operatorname{cm}$。

本文主定理（`ReductionConjs.tex:104-106`，素材内即 Theorem 2.1 前的主结果；定理环境按节内共享计数器编号）：

**定理.** 若 Hadwiger 猜想真，则 FGS 猜想真。等价地，若 FGS 猜想伪，则 Hadwiger 猜想伪。

精确化（`ReductionConjs.tex:108`）：若 FGS 对某个 $t$ 失效，则海鸥问题在 $n=4t-1$ 处失效。逻辑骨架两拍：第一拍是证明本体（下面三节逐行展开）：$G$ 阶 $4t-1$、$\alpha=2$、$\operatorname{cm}\le t-1$ 蕴含

$$
\eta(G)\le 2t-1<2t,
$$

即反例图连 $K_{2t}$ 子式都没有；第二拍是 contraposition：Hadwiger 真时 $\eta(G)\ge\chi(G)\ge n/\alpha=(4t-1)/2=2t-\frac12$，$\eta$ 取整数故 $\eta(G)\ge 2t$，与第一拍矛盾，于是 $\operatorname{cm}\ge t$。素材把它包装成"信 Hadwiger 的人不必觉得 FGS 冒险；想否证 Hadwiger 的人可以去攻 FGS 猜想"（`ReductionConjs.tex:102`）。
