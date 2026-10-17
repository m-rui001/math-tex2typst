# D104 单折Diophantine表示：幂关系与椭圆曲线互定义性的反推笔记

队列行号 115。论文目录：E:\math\preprints\Single-fold-Diophantine-representations-September-24-2026。本笔记全部正文素材只取自该目录 build\ 下的 .tex 文件（语料 PDF 已加密，未用 pdftotext，未读任何 PDF）；Lean 侧取证严格限定在 formalization.yaml 注册行、OAI/NumberTheory/SingleFold/ 模块目录本身与 ComparatorChallenges/SingleFold.json 三处。凡超出素材的猜测，我一律以 [推测] 标注；凡来自外部文献检索的旁证，我以 [外部检索] 标注并注明那是我的推断，并非论文文本。

## 1 材料来源与取证协议

build\ 目录平铺文件，我先按任务给的四件核对，再用 Glob 补全清单，按字节降序全部读到：

- computation.tex 19055 字节 371 行
- elliptic.tex 17288 字节 418 行
- main.tex 15075 字节 293 行
- power.tex 13804 字节 361 行
- rank-one-proof.tex 8151 字节 189 行（附录 app:rank-one）
- witness-ledger.tex 6879 字节 138 行（附录 app:witnesses）
- consequences.tex 2235 字节 41 行
- height-window-figure.tex 1410 字节 33 行
- references.bib 4959 字节 169 行（书目，用于核对引文编号，不承载证明）

任务提示里只列了前四件，并要我"先用 Glob 或 ls 补全完整清单，全部都要读到"，所以后四件 tex 我也逐行读了；\input 链证实它们都在 main.tex 的编译图内：main.tex 第 284--290 行依次 \input{elliptic}、\input{power}、\input{computation}、\input{consequences}，附录段再 \input{rank-one-proof}、\input{witness-ledger}，而 height-window-figure 由 elliptic.tex 第 412 行引入。

Lean 注册三件套，逐字抄自 E:\math\lean\formalization.yaml 第 1510--1512 行：

```yaml
    - comparator_config: ComparatorChallenges/SingleFold.json
      declaration: OAI.SingleFold.main
      file: OAI/NumberTheory/SingleFold/Main.lean
```

书目条目在 formalization.yaml 第 582--584 行，只有标题与 pdf 路径（我按要求没有打开那个 pdf）：

```yaml
  - title: "Single-fold Diophantine representations"
    authors: ["OpenAI"]
    id: ../preprints/Single-fold-Diophantine-representations-September-24-2026/paper.pdf
```

ComparatorChallenges/SingleFold.json 全文 14 行，关键内容：challenge_module 是 ComparatorChallenges.SingleFold，solution_module 是 OAI.NumberTheory.SingleFold.Main，theorem_names 只有一项 OAI.SingleFold.main，definition_names 为空数组，permitted_axioms 是 propext、Quot.sound、Classical.choice 三条，enable_nanoda 为 false。也就是说这份形式化对外只承诺一个定理名，其余全部藏在模块内部。

我对 lean 仓没有做任何递归 grep；模块目录 OAI/NumberTheory/SingleFold/ 本身用一次 wc 拿到全部 28 个 .lean 的行数与字节（合计 7598 行 344596 字节），规模簇表在第 18 节。

## 2 初始动机与最初猜想

我把自己的问题这样起手：DPRM 方向我熟。Davis--Putnam--Robinson 1961 给出带指数运算的 Diophantine 表示；Matiyasevich 1970 用 Pell 型增长关系把指数消掉，得到多项式表示，进而否定 Hilbert 第十问题。main.tex 第 66--76 行复述的正是这条线，并且立刻点破要害："It does not bound the number of witnesses."（main.tex:76）。经典构造只说"存在某个 w"，从不管有多少个 w。而我关心的量恰好是这个计数：对每个输入 a，满足 P(a,w)=0 的完整辅助元组 w 有多少个？

main.tex 第 51--54 行给出单折定义："The representation is \emph{single-fold} if this complete tuple $w$ is unique whenever it exists. It is \emph{finite-fold} if the set of such tuples is finite for every input. These definitions count all auxiliary variables, including those used to express subsidiary arithmetic operations."最后那句"count all auxiliary variables"是我后来才真正读懂的杀手条款，但一开始它就是我给自己定的验收标准：任何"事后归一化"都不许做，唯一性必须把每一个子程序调用内部引入的变量也算进去。

我最初的猜想相当天真。我以为唯一性是可以"外挂"的：先拿普通 DPRM 表示 P(a,w)=0，再追加一叠方程把 w 里每个坐标强制压到某个典范代表上，比如分数压到既约且分母为正、自然数压到二进制展开、机器历史压到最短接受运行。我在草稿纸上写的第一版方案是：用一条"最小化泛函"，对每个坐标引入"它是最小的满足条件者"这样的表达式，而"最小"在 Diophantine 语言里只能写成"不存在更小的满足条件者"，即一个否定存在式，等价于一个全称量式。Diophantine 定义只允许存在量词，这一步当场卡死。这是我在纸面上撞的第一堵墙，也是 main.tex 第 80--84 行提到的 Matiyasevich 1974 已经看清的困难："reduces it to single-fold binary exponentiation"：唯一性无法外挂，只能从最底层的每个原子关系一路携带上来。

我当时的第二个猜想也错了：我以为可以绕开指数，直接对图灵机历史编码，用大基数进制把整段 run 打包成有限个整数。这在存在性上是标准做法（Jones--Matiyasevich 的位掩码法），但在唯一性上立刻泄漏：一段固定的 run 有无穷多种打包方式，块大小（基数）是自由的，同一时刻同一状态可以拆成两块零头。main.tex 第 137--138 行后来明说这就是难点："The problem is to retain uniqueness when a computation is expressed by polynomial equations."而 computation.tex 第 7--8 行把我当年想跳过的那一步钉住了："a fixed computation admits many encodings if its block size is left free."

现在回看，我的初始设想其实是"唯一性是一个全局属性，属于表示定理的输出端"；这篇论文的立场相反：唯一性是一个归纳不变量，属于每个构造算子的输入端与输出端约定。两种立场的差异决定了全部技术选型。以下各节我按引理逐个反推。

## 3 精确陈述：从 abstract 与定理环境逐字抄出

abstract 全文（main.tex:33-38）逐字如下：

> Every recursively enumerable set of natural-number tuples has a polynomial Diophantine representation with exactly one complete auxiliary tuple for each member. This proves the single-fold conjecture and, consequently, the finite-fold conjecture.

主定理 Theorem 1（标签 thm:main，main.tex:56-64）逐字如下：

> For every integer $n\ge1$ and every recursively enumerable set $S\subseteq\mathbb N^n$, there are an integer $m\ge1$ and a polynomial $P\in\mathbb Z[A_1,\ldots,A_n,W_1,\ldots,W_m]$ such that, for every $a\in\mathbb N^n$,
>  \[ \#\{w\in\NN^m:P(a,w)=0\}= \begin{cases}1,&a\in S,\\0,&a\notin S.\end{cases} \]

量化结构机械拆解：最外层是对元数 n 的全称（注意 n>=1，零元组情形被排除在外）；对每个 n 是对 r.e. 集 S 的全称；然后存在 m>=1（见证元数也是存在断言的一部分，不是给定常数）；存在一个整系数多项式 P；再对一切输入 a 逐点断言一个基数等式。"单折"在这里的字面兑现就是那个分段的 1：w 的完整元组在 a 属于 S 时恰有一个，否则零个。按 main.tex:53-54 的条款，这 m 个 W 变量里塞进了全部子算术的辅助变量：有理数约化见证、Pell 坐标、商与余、松弛量、分支选择子，一个都不许藏在"某组互素代表存在"这种口语里。被表示的对象在定理层面是任意 r.e. 关系；而构造内部被单折表示的关键幂关系是 Pow(b,n,c) ⟺ (b>=2 且 c=b^n)（power.tex:104-108），它是把指数从椭圆曲线高度引回算术的中转站。

推论 cor:unique-h10（main.tex:123-132）逐字如下：

> There exist integers $m,D\ge1$ for which no algorithm has the following property: on every input polynomial $F\in\mathbb Z[W_1,\ldots,W_m]$ of total degree at most $D$ satisfying the promise $\#\{w\in\mathbb N^m:F(w)=0\}\le1$, the algorithm halts and correctly decides whether this set is nonempty.

这是带"至多一解"承诺的 H10 变体。consequences.tex 第 35--40 行特意划界：承诺是 <=1 ，并非恰好 1；不承诺 Z 或 Q 上的类比；m 与 D 只是存在性界，多项式系数（以及随 a 变化时的位长）不受控。我对这三句划界的读法是：作者知道读者会立刻想把它加强成"恰一解承诺"或"Q 上版本"，而那两步目前都超出了构造能力。Miller--Shlapentokh 的对照在 main.tex:86--90：在有理整数与多项式环上他们能做到单折/有限折，见证域与变量域一换，结论强度就换。

## 4 常数与参数台账

下表按数据流排序：椭圆曲线簇的常数先被增长函数消费，增长函数的界被幂关系消费，幂与位包含被机器编译器消费，最后是推论层。位置列给"文件:行"，行号以 build\ 下平铺文件的实际行号为准。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $E:y^2=x^3-25x$ | 固定曲线，秩 1，\lvert\mathcal T\rvert=4 | elliptic.tex:12-13, elliptic.tex:20-23 | 全部高度构造与代表点选取 | 换曲线则秩与挠群要重证；挠 \mathcal T[2] 变则 [E:2E]=2^{r+2} 的指数变，rank-one-proof.tex:165-171 的秩上界失配 |
| $A=-25,B=0$ | Nagell--Lutz 判据量 $4A^3+27B^2$ 绝对值 62500 | rank-one-proof.tex:172-178 | 用 36\nmid62500 排除 (-4,6) 为挠点，定秩=1 | 若该整除成立则非挠性证明失效，\hat h(P)>0 无从谈起 |
| $[E(\mathbb Q):2E(\mathbb Q)]$ | \le 8 | rank-one-proof.tex:160, rank-one-proof.tex:118-121 | 秩上界 r\le1（同页 165-171） | 若 im\alpha' 含 [2] 则界退化到 16，只给 r\le2，唯一分解 nP+t 崩溃，W_j 不再良定义 |
| $H(a/d)$ | \max\{\lvert a\rvert,d\}，既约且 d>0 | elliptic.tex:176-179 | h_x 与 W(Q) 的原材料 | 换 max 之外的范数则 2 次主项系数与 c_E 全变，窗口常数需整体重标 |
| $\hat h$ 规范化 | $\hat h(Q)=\frac12\lim 4^{-N}h_x([2^N]Q)$ | elliptic.tex:182-185 | 二次性 \hat h(jQ)=j^2\hat h(Q) | 去掉因子 1/2 则 a_E 定义平移一倍，eq:height-constants 两式或违其一 |
| $c_E$ | 固定实数，\bigl\lvert\log H(x(Q))-2\hat h(Q)\bigr\rvert\le c_E 全点一致 | elliptic.tex:190-195 | \kappa 的选取、窗口误差 6c_E | 若误差随 Q 增长则窗口两分支都不成立，R 唯一性失效 |
| $\kappa$ | 整数，满足 e^{6c_E}<\kappa<e^{2a_E-6c_E}（原文取 \kappa>e^{6c_E} 并配合 2a_E-6c_E>\log\kappa） | elliptic.tex:202-207 | 平方窗口 L_0\le\kappa D_0,\ D_0\le\kappa L_0（elliptic.tex:336-338） | \kappa\le e^{6c_E} 时真指标 r=k^2 被窗外剔除；\kappa\ge e^{2a_E-6c_E} 时邻位指标混入，R 不唯一 |
| $m_*$ | 正偶整数，取得充分大使 a_E=2m_*^2\hat h(P) 同时满足 a_E>2c_E 与 2a_E-6c_E>\log\kappa | elliptic.tex:202-207 | W(Q)=H(x([m_*]Q)) 定义（elliptic.tex:210-217）；杀挠使 W(nP+t) 只依赖 j=\lvert n\rvert | 取奇数或不杀挠则 W_j 依赖 t，eq:quadratic-sequence 不成立；a_E 不够大则整数分离失败 |
| $a_E$ | 2m_*^2\hat h(P)>0，二次主项系数 | elliptic.tex:203-207, elliptic.tex:228-232 | \log W_j=a_Ej^2+\varepsilon_j；\delta=1/(128a_E) | 若 P 挠使 \hat h(P)=0，则序列有界，括号对大 u 无解，g 不是全域函数 |
| $W_0,W_1$ | W_0=1，W_1>1，(W_j) 严格增且无界 | elliptic.tex:229-236 | 尺度括号 W(Q)\le u+W_1<\max 邻值（elliptic.tex:299-313） | 若 W_1=1 则 u=0 时 k 不唯一；若非单调则 k 存在性断 |
| $6c_E$ | 窗口比值误差上界：\lvert e\rvert\le 6c_E，六个高度项，W_k 计两重 | elliptic.tex:344-349 | 与 \log\kappa 比较的窗口两分支证明 | 若把 W_k 记一重则常数虚低，误差半径覆盖 r=k^2\pm1 的区间，图 height-window-figure.tex:25-31 的分离图景失效 |
| $\delta$ | 可取 1/(128a_E) | elliptic.tex:389-393 | 增长下界 \delta(\log u)^2<\log g(u)（elliptic.tex:289-292） | 取更大值下界为假；取更小值则 \ell 下界抬高，u 膨胀、Pell 坐标位数上升 |
| $u_0$ | 整数 \ge4，越过两个渐近阈值 | elliptic.tex:401；power.tex:97-103 | u 公式的平移项；不等式 u^u<(2u-1)^{u-1} 只在 u\ge4 成立（power.tex:152-162） | 若 u_0<4 则归纳基 f(4)=343/256>1 用不上，截断 F,H<v<u^u 断链，大指标 Pell 解放进来 |
| $\ell$ | 整数，\ell>3/(\delta\log2) | power.tex:126-128 | 存在性核验 \log F\le\frac{3}{\ell\log2}(\log u)^2<\delta(\log u)^2<\log v（power.tex:241-254） | \ell 偏小则真解 F\ge v 被截断剔除，"规定的输出有见证"一半失败 |
| $u$ | (c+1)^\ell(n+1)(b+1)+u_0 | power.tex:133-135 | 同时给出模数 bu-1、u-1 的尺度与 2u-1-n-cn\ge cn+2c+n+9>0（power.tex:212-216） | 删 (b+1) 因子则 i 的区间 1\le i<u 与模 bu-1 的钉住错位；删 (c+1)^\ell 则商误差 <1 不等式失去支撑 |
| $D=a^2-1$ | 非平方：(a-1)^2<D<a^2 | power.tex:38-40 | Pell 正解与指标 i\ge1 的双射 | 若 D 平方则 (x+\sqrt Dy)(x-\sqrt Dy)=1 只剩平凡解族，指标唯一性断 |
| $y_i(a)$ 界与同余 | (2a-1)^{i-1}\le y_i\le(2a)^{i-1}；y_i\equiv i\pmod{a-1} | power.tex:26-29 | 截断排除 i\ge u；同余把 i,j 钉成 n+1（power.tex:180-188） | 模若写成 a ，并非 a-1，区间 1..u-1 内不再恰有一个代表，钉不住 |
| $R_i= y_{i+1}/y_i$ 单调量 | 2a-1\le R_i\le 2a；R_i(bu)\ge bR_i(u) | power.tex:65-89 | 比值双边估计 b^n\le F/H\le b^n(1+\frac1{2u-1})^n（power.tex:30-34） | 失去 R_i(bu)\ge bR_i(u) 则下界 c\ge b^n 断，商识别不成 |
| $z$ | 1/(2u-1)，满足 nz<1 | power.tex:194-210 | (1+z)^n-1\le\frac{nz}{1-nz} 的几何级数尾界 | nz\ge1 时分母变号，误差界爆掉，\frac FH-b^n<1 不成立 |
| $i,j$ | 两个 Pell 指标（纯记号，不进系统变量） | power.tex:167-188；witness-ledger.tex:85-86 | 证明内部把 F=y_i(bu),H=y_j(u) 定形 | 若把 i,j 当存在变量，指标本身有多个命名方式，完整元组唯一性当场多付一重自由 |
| $B=2^w=4b$ | (2L,4L] 内唯一 2 的幂，L=C+T | computation.tex:134-138；computation.tex:295-302 | 块基数唯一性；B>2C 保证 B>2s、B\ge4 | 区间放宽到 (2L,8L] 可含两个 2 的幂，同一 run 出现两套编码，唯一见证断 |
| $C$ | 1+s+\sum_j d_j | computation.tex:99-105 | 时钟初值 r_{0,0}=C；计数器值界 d_j+t<C+t<B/2 | 不含 s 则状态数可能顶穿数字容量，状态分区出现进位 |
| $k,J,M,H$ | k=T+1，H=B^k，J=B^{k-1}，M=\sum_{t=0}^{k-1}B^t=(H-1)/(B-1) | computation.tex:134-145 | 块寻址与移位；末位剥离 R_j=\rho_jJ+\eta_j | J 错一阶则最后时刻无法剥离，递推方程多出一条幻影转移 |
| $(2b-1)M$ | 每块只许低 w-1 位的掩码 | computation.tex:173-185, computation.tex:239-245 | 排除带符号的进位与借位，支撑 \lvert c_t\rvert<B 逐位清零论证（computation.tex:253-269） | 若用 (B-1)M 顶位可用，系数可达 B-1 并借位，r_{j,t+1}=r_{j,t}+a-f 不再由多项式等式唯一读出 |
| $(B-1)V_q$ | 非零分支时刻整块放开、零分支时刻全零的掩码 | computation.tex:186-196, computation.tex:272-280 | 零测试 R_j\bits(B-1)V_q | 若 V_q 与 Z_q 关系改为独立变量，掩码与分支不再互锁 |
| $s,\tau,r$ | 状态数、测试状态数、计数器数（固定机） | witness-ledger.tex:100-106, witness-ledger.tex:125 | 见证元长度上界 s+3\tau+r+1 次位包含调用等 | 机器改动则全部有限集重列；对定理本身无害因为机器只随 S 固定一次 |
| $\rho_j,\eta_j$ | 末位值与各 J 余量 | computation.tex:177-179 | 由除以 J 的带余除法唯一读出 | 若去掉 \eta_j<J 界，商余分解不唯一 |
| $62500$ | 4A^3+27B^2 之绝对值（A=-25,B=0） | rank-one-proof.tex:172-183 | 挠点 y^2\mid62500 的必要条件；模 3 约化再逼 3\mid y | 两路判别任一失效，\mathcal T 列表就不能声称穷尽 |
| $D_\text{cor}=\max\{1,\deg P\}$ | 固定多项式 P 的总次数（随 S 而固定） | consequences.tex:14-24 | 承诺问题的次数界；特化 F_a 不升次数 | 若特化升次则界 D 失效；这也解释了为什么 A 变量只留一个且 n=1 特化 |
| $m,D$ | 推论中两存在整数 \ge1 | main.tex:123-131 | 算法输入空间：变量数恰 m、总次数 \le D | 变量数不固定时"至多一解"的判决问题不再是单一固定语言，对角化失效 |
| $e_i$ 选择子 | e_i(e_i-1)=0,\ \sum e_i=1 | main.tex:246-249 | 不相交并的门控；(1-e_i)z=0 清零一切局部变量（main.tex:251-257） | 无清零条款则每个未选中分支自由取值，见证集立刻无穷，单折定义自身先崩 |
| 有理码 $(p,n,d,t,s,q)$ | 六元组满足 pn=0,\ d=1+t+s,\ (p+n)t+d=1+qd | elliptic.tex:40-47 | 一切有理算术的原子唯一性（lem:rational-codes） | t 若不锁在 0\le t<d 则逆元代表无穷多个；d=1 时若无平移恒等式须单列情形 |

台账使用规则：后文逐引理反推时，凡出现上表符号我都不再解释来源，只引用其行号；凡我要改动某常数做敏感性检查，先到"若改动断在哪一步"列对答案。

## 5 约定层：单折多项式系统与闭合性引理

### 5.1 逐字引用

定义（main.tex:205-213）："A \emph{single-fold polynomial system} for a relation $R\subseteq\mathbb N^d$ is a finite list of integer polynomial equations $F_i(a,z)=0$ such that the set of complete tuples $z$ is a singleton for $a\in R$ and empty otherwise. A \emph{single-fold graph} of a function $f:D\to\mathbb N^e$, where $D\subseteq\mathbb N^d$, is such a system for $\{(a,f(a)):a\in D\}$. Thus each input $a\in D$ determines both the output and all further auxiliary variables uniquely. Inputs outside $D$ have no solutions."

约定段（main.tex:215-224）："All unspecified variables in polynomial systems range over $\mathbb N$... a displayed inequality $F\ge G$ means $F-G=s$ with a new variable $s\in\mathbb N$, and $F>G$ means $F-G=1+s$. The slack is unique; the values of $F$ and $G$ need not separately be nonnegative. An integer $z$ is represented by its unique sign code $z=z^+-z^-$, where $z^+,z^-\in\mathbb N$ and $z^+z^-=0$."

引理（lem:composition，main.tex:232-239）："Finite conjunctions of single-fold polynomial systems, using separate auxiliary tuples for distinct calls, preserve uniqueness for fixed values of all their displayed arguments. Composition of single-fold graphs preserves uniqueness of outputs and complete auxiliary tuples. A finite union of single-fold relations also has a single-fold system if their displayed argument sets are pairwise disjoint."

门控段（main.tex:246-257）："For a disjoint union with $r$ cases, introduce selectors $e_1,\ldots,e_r$ with $e_i(e_i-1)=0,\ \sum_{i=1}^r e_i=1$. Write every equation in case $i$... in the form $F=0$, and replace it by $e_iF=0$. For each variable $z$ local to this case, also impose $(1-e_i)z=0$. This last rule applies to all local coordinates, outputs of local calls, normalization variables, selectors, and slacks, including those inside nested calls."

收束段（main.tex:260-269 与 277-282）：情形函数要求"guards to partition its input domain and each active case to determine the shared output"；$\max(a,b)$ 由不相交情形 $a\ge b,h=a$ 与 $a<b,h=b$ 给出；带余除法"$a=dq+r$ and $r<d$; both and the slack are unique"；"No unbounded choice of a B\'ezout coefficient or of an inactive-case variable is permitted in the constructions below."；最后有限系统 $F_1=\cdots=F_r=0$ 等价于 $\sum F_i^2=0$（eq:squares，main.tex:277-280）。

### 5.2 推导补全

选择子的布尔性：$e(e-1)=0$ 在 $\mathbb N$ 上只有 $e=0$ 与 $e=1$ 两个解，因为两个连续自然数之积为零当且仅当其中一个为零。加上 $\sum e_i=1$，恰好一个选择子取 1。若各情形的展示参数集两两不交，则展示参数本身在多个情形里共享、不参与门控，而"哪个情形被激活"由展示参数唯一决定，这就是 main.tex:255-257 那句 "Disjointness makes the selector itself unique" 的全部含义；我核对它的逆否形式：若两个情形展示同一参数集，同一输入会被两个选择子同时认领，选择子不再唯一。

门控的充分性验证：设 $x$ 在情形 $j$ 局部。若 $e_j=1$，方程 $(1-e_j)x=0$ 平凡成立，$e_jF=F=0$ 恢复情形内原方程；若 $e_i=1$ 而 $i\ne j$，则 $(1-e_i)x=0$ 强制该变量归零，且情形 $i$ 的全部方程被乘零自动成立。于是整个门控系统在 $\mathbb N$ 上的解集与"被激活情形的解集乘以其余情形局部变量全零"一一对应。递归嵌套时该规则逐层生效，这正是 witness-ledger.tex:20 "These rules apply recursively to nested calls" 所指。

复合的唯一性链条：$h=f\circ g$，输入 $a$ 固定后，$g$ 的单折图把中间输出 $y$ 连同 $g$ 的内部辅助元组一起钉死；再把 $(y)$ 作为 $f$ 的展示参数，$f$ 的图把最终输出与 $f$ 的内部元组钉死。存在性与唯一性沿链归纳，一步都不需要"选择哪个中间值"的自由度。这里我特别提醒自己在普通 DPRM 证明里被默认允许的"存在某组中间值"式写法，在本篇是非法的。

符号码的唯一性：给定整数 $z$（作为已定表达式），方程 $z=z^+-z^-$ 与 $z^+z^-=0$ 迫使二者之一为零：若 $z\ge0$ 取 $z^+=z,z^-=0$，若 $z<0$ 取 $z^+=0,z^-=\lvert z\rvert$；乘积条件排除两个都正的情形。绝对值即 $z^++z^-$。

松弛量：$F\ge G$ 引入 $s=F-G$，一旦 $F,G$ 的取值确定，$s$ 由差唯一给出；这就是"the slack is unique; the values of $F$ and $G$ need not separately be nonnegative"的机制面。严格不等式偏移 1 是为了在整数域上把 $>$ 与 $\ge$ 区分开：$F-G$ 是整数，$F>G$ 等价于 $F-G-1\in\mathbb N$。

平方和归并：$\mathbb N$ 上的 $\sum F_i^2=0$ 当且仅当每个 $F_i=0$，因为平方和非负且实数域无零因子；该归并不引入变量、不改变解集（main.tex:281-282），所以全文可以用"有限系统"工作，只在最后一步（computation.tex:360-365）落成单一方程。

### 5.3 机械理由

"单折"约束在这层省掉的东西：一旦每个原子关系自带完整元组唯一性，整个证明的量化结构就只剩"代入"。定理陈述里对 $w$ 的计数不再需要任何内部约束，因为每个调用点的唯一性由引理 5 的三条闭合规则自动传递。这就是为什么论文能把 200 多行的归纳不变量（第 112-115 行："uniqueness must include reduced rational coordinates, arithmetic quotients and slacks, and the variables of inactive cases. The proof keeps this complete-witness requirement through every substitution"）写成散文，并非写成带指标的树状引理森林。

它同时禁止的东西更关键。经典 DPRM 里有两处标准自由选取被点名封杀（main.tex:268-269）：其一，Bézout 系数：证明两数互素时通常写 $\exists u,v.\,ua+vd=1$，解集是无限余集，所以 elliptic.tex:36-38 把"限制 Bézout 系数到一个剩余区间"当作标准修复手段引用（见 \cite[Section~2]{cco2024}），但最终采用的方案更彻底：直接用六元组逆元码（下节）；其二，不相交并中未激活情形的变量：不设 $(1-e_i)z=0$ 的话，每个未激活情形内部变量任取，见证立刻无穷。

带余除法在这里的角色也不同于存在性证明：$a=dq+r$、$r<d$ 在 $d>0$ 时是欧几里得唯一性，可直接当单折图用；computation.tex 里的 $\eta_j<J$、$r<H$ 全部消费这条约定。

定理要求 $m\ge1$。我的机械读法：这是语法统一条款，任何系统都可以追加一个被方程 $W_1=0$ 锁死的哑变量来补足元数，唯一性不受损。[推测] 作者真正需要它的原因是 Lean 侧的 `MainStatement`（Model.lean:20-22 逐字：`∃ (m : ℕ), 1 ≤ m ∧ ∃ P : MvPolynomial (Fin n ⊕ Fin m) ℤ, Represents P S`）把 $m\ge1$ 写进了类型，哑变量补足在形式化里是零成本的。

输入元数条款 $n\ge1$：零元组 r.e. 集只有 $\emptyset$ 与 $\{*\}$ 两种，前者需要"无解"、后者需要恰一元组，其实都可手工处理；[推测] 排除 $n=0$ 是为了让"计数器初值取自输入坐标"这类叙述（computation.tex:120-122）不用另立特判。

### 5.4 候选失败路线

- [推测] 路线一：把归一化推迟到最后。先造普通 r.e. 表示 $Q(a,w)=0$，再令 $P(a,w)=Q(a,w)\cdot\prod_j(w_j\ \text{非典范})^2$ 之类把非典范见证抬高次。失败机制：Diophantine 只能表达存在，"$w$ 是典范代表"的否定方向（不存在更典范的 $w'$）是全称语句，乘进去的因子无法表达"最"字。这正是我在第 2 节撞过的墙在引理层的重现。
- [推测] 路线二：门控时只乘方程不清零局部变量，声称"未激活情形无所谓"。失败机制：定理计数的是完整元组，未激活情形里的每个自由变量都直接贡献一个见证副本；只要一个情形里有任一局部变量无方程约束，见证集就无穷，并非有限，连有限折都保不住。
- [推测] 路线三：互素性用"限制到一个剩余区间"的 Bézout 见证（即取 $0\le u<d$）而不换掉整个框架。部分可行但脆弱：$v=(1-ua)/d$ 由 $u$ 唯一决定，看起来能救；然而当 $d=1$ 时区间 $[0,d-1]$ 退化为单点、当 $\gcd(a,d)\ne1$ 时又必须有"无解"表现，边界情形要额外分支，而每个分支又引入新的门控变量。elliptic.tex:38-39 明说他们的平移逆元恒等式 $(p+n)t+d=1+qd$ "also handles denominator one without a separate case"，说明作者确实评估过区间限制方案并选择了免分支的那个。

## 6 秩一曲线：E: y^2=x^3-25x 与挠群

### 6.1 逐字引用

elliptic.tex:11-27（曲线与命题）："Let \[ E:\quad y^2=x^3-25x \] denote the nonsingular projective cubic obtained by adjoining \(O=[0:1:0]\) to this affine equation. We use its chord--tangent group law with identity \(O\). Negation sends \((x,y)\) to \((x,-y)\)." 命题 prop:rank-one："The group \(E(\QQ)\) has rank one and torsion subgroup \[ \mathcal T=\{O,(0,0),(5,0),(-5,0)\}. \] Consequently there exists \(P\in E(\QQ)\) such that every rational point has a unique expression \(nP+t\), with \(n\in\ZZ\) and \(t\in\mathcal T\)."

附录骨架（rank-one-proof.tex:4-7）："For \(E:y^2=x^3-25x\), we first prove \([E(\QQ):2E(\QQ)]\le8\), which will force rank at most one. We then exhibit a nontorsion point and determine the full torsion subgroup." 关键判据（同文件:165-178）："$[E(\mathbb Q):2E(\mathbb Q)] =2^r|\mathcal T/2\mathcal T| =2^r|\mathcal T[2]|=2^{r+2}$, since its rational points of order dividing two are precisely $O,(0,0),(5,0),(-5,0)$. Hence $r\le1$. The point $(-4,6)$ is nontorsion... Here $36\nmid62500$, so the rank is one."

### 6.2 推导补全

我把两条等斜下降拆开补步。一般形 $E_{a,b}:y^2=x^3+ax^2+bx$ 带 2-挠点 $(0,0)$，对偶曲线 $E':y^2=x^3-2ax^2+(a^2-4b)x$。映射 $\phi(x,y)=(y^2/x^2,\,y(1-b/x^2))$ 的像满足 $E'$：令 $X=x+a+b/x$，文中恒等式 $X((X-a)^2-4b)=y^2(1-b/x^2)^2$ 的验证我按原始变量展开确认：$X$ 满足 $(X-a)^2=a^2-4b+4(x^2+ax+b)/x\cdot x$……更直接的路子是注意 $X$ 正是把除子 $(0,0)$ 模掉后的标准 $x$-坐标提升，$y^2=x(b+ax+x^2)$ 代入即两端同式，展开 $X^3-2aX^2+b'X$ 与 $y^2(1-b/x^2)^2$ 的差被 $y^2=x^3+ax^2+bx$ 吸收。复合 $\psi\phi$ 的 $x$-坐标（rank-one-proof.tex:104-109）：$x(\psi\phi(x,y))=(x^2-b)^2/(4y^2)$，与倍加公式 $((3x^2+2ax+b)/(2y))^2-a-2x$ 展开后相同，于是 $\psi\phi=[2]$ 到符号为止；像集对取反封闭，所以 $\psi\phi E(\mathbb Q)=2E(\mathbb Q)$ 作为子群成立，这一步解释了为什么"逐点符号歧义"（文中 line 112-114）无害。

平方类同态 $\alpha$ 的同态性证明补步：非竖直直线 $y=\lambda x+\nu$ 与 $E_{a,b}$ 交点的 $x$ 满足三次方程 $x^3+(a-\lambda^2)x^2+(b-2\lambda\nu)x-\nu^2=0$；$\nu\ne0$ 时三根之积为 $\nu^2$（常数项取负），是平方，$\alpha$ 值乘积为单位平方类；$\nu=0$ 时一根为 $0$（点 $(0,0)$，$b\ne0$ 保证单根），另两根之积 $b$，与 $\alpha((0,0))=[b]$ 抵消。三点之和为零（第三点是前两点之和的取反），$\alpha$ 对取反不变，故 $\alpha$ 在弦-切律下加性成立。竖直对与含 $O$ 对按定义归位。

核恒等式 $\ker\alpha=\psi E'(\mathbb Q)$（rank-one-proof.tex:74-98）：反向包含由 $x=2x+a+2y/s$ 显式构造原像，关键一行是 $(2x+a+2y/s)(2x+a-2y/s)=b'$ 的来源：展开 $=(2x+a)^2-4y^2/s^2$，用 $y^2=x^3+ax^2+bx$ 与 $s^2=x$，得 $4x^2+4ax+a^2-4(x^3+ax^2+bx)/x=4x^2+4ax+a^2-4x^2-4ax-4b=a^2-4b=b'$。于是 $X\ne0$（因 $b'\ne0$），再由 $X^2-(2a+4x)X+b'=0$ 推出 $Y^2=X^3-2aX^2+b'X$，即 $X$ 落在 $E'$ 上，$\psi$ 送回原点。

像集有限性（对 $a=0,b=-25$）：估值论证我说它等价于"奇估值只可能出现在整除 $b$ 的素数处"。$p\nmid b$ 且 $v_p(x)>0$ 时 $x^2+ax+b$ 是 $p$-进单位，$2v_p(y)=v_p(x)$ 迫使 $v_p(x)$ 偶；$v_p(x)<0$ 时 $x^2$ 是 $x^2+ax+b$ 中唯一最小估值项，$2v_p(y)=3v_p(x)$，因左边偶故 $v_p(x)$ 偶。$E$ 上 $b=-25$ 只贡献素数 5，所以 $\operatorname{im}\alpha\subseteq\{[1],[-1],[5],[-5]\}$。$E'$ 是 $y^2=x^3+100x$（$b'=a^2-4b=100$），$x$ 恒正（$x^3+100x$ 与 $x$ 同号），素数 2 与 5 贡献 $\{[1],[2],[5],[10]\}$；排除 $[2]$ 的初等同余：$N^2=2m^4+50e^4$ 模 5 得 $N\equiv\pm(2^{1/2}m^2)$……文中最短：模 5 时 $2m^4\equiv N^2$，四次剩余模 5 只取 $\{0,1\}$，$2m^4\in\{0,2\}$，平方剩余 $\in\{0,1,4\}$，交集只有 0，故 $5\mid m,N$；代回 $N_1^2=50m_1^4+2e^4$ 再模 5 得 $N_1^2\equiv2e^4$，同一矛盾（$5\nmid e$）。所以 $\lvert\operatorname{im}\alpha'\rvert\le2$（子群不含 [2] 只剩含 [1] 至多两个元素的子格……文中只断言 size at most two，我不加强），配合 $\lvert\operatorname{im}\alpha\rvert\le4$ 给 $[E:2E]\le8$。

挠群收尾：$y^2=x^3-x$ 是原方程模 3（因 $25\equiv1$），在 $\mathbb F_3$ 上 $x^3-x\equiv x(x-1)(x+1)$ 遍历三个剩余类均为零（费马小定理逐点验证 $x=0,\pm1$ 全覆盖），所以 $y^2\equiv0$，$3\mid y$；而 Nagell--Lutz 给 $y^2\mid62500=2^2\cdot5^6$，$3\nmid62500$，矛盾逼出 $y=0$。$y=0$ 即 $x^3-25x=x(x-5)(x+5)=0$，得三个仿射 2-挠点加 $O$。非挠性：$(-4,6)$ 在曲线上（$36=-64+100$），Nagell--Lutz 要求整数坐标且 $y^2\mid4A^3+27B^2=4(-25)^3=-62500$，$36\nmid62500$，故非挠，$r=1$。

### 6.3 机械理由

为什么必须恰是秩 1：群分解 $E(\mathbb Q)=\mathbb Z P\oplus\mathcal T$ 提供唯一的"整数指标"概念。秩 0 没有无限可枚举点、无高度增长可用；秩 $\ge2$ 时 $nP_1+mP_2$ 的指标不再是整数，是格点，$j^2$ 型二次主项变成二元二次型，两个不同方向的格点可给出几乎相同的高度值，窗口分离（第 9 节）的整数间距论证失效。所以"单折"对曲线的要求是量化的：椭圆曲线本身不是被索取的对象，被索取的是一条其商 $E(\mathbb Q)/\mathcal T$ 同构于 $\mathbb Z$ 的曲线。

为什么选 $y^2=x^3-25x$：这条曲线有满 rational 2-挠（三个非零 2-挠点），于是 $\mathcal T[2]=\mathcal T$，$[E:2E]=2^{r+2}$ 的指数 2 恰由挠贡献；2-挠多意味着有 2-等斜下降可用，下降像集由 $b=-25$ 的素因子撑住，只有 5。曲线本身是 $101$ 号? 我核对了它属于经典的同余数族 $y^2=x^3-n^2x$ 在 $n=5$ 处的成员，$n=5$ 是同余数（3-4-5 三角形），所以解析秩为 1 与该族理论吻合，(-4,6) 即文献里的经典生成元候选。[外部检索] 这一族与同余数问题的关联是背景知识，不是论文文本（相关背景见维基百科椭圆整除序列与同余数词条，见文末链接）。论文对选曲线的全部自述理由只有技术性的：挠结构、下降可行、有显式非挠点（rank-one-proof.tex:4-7）。

为什么 $nP+t$ 的唯一分解要"先证点唯一再谈码唯一"：main.tex:271-275 预先声明点码是整段六元组，存在量化一个未指明的点意味着整个码进入见证；因此必须先有群论层面的唯一点，才轮到组合码层面的唯一性。这个顺序在第 7、8 节被反复执行。

数域假设挡掉的反例：全程在 $\mathbb Q$ 上进行。若换到一般数环（Poonen 式场景，main.tex:98-100），Denef 型障碍出现：整数环上的整性定义依赖单位群与秩假设的组合，而挠平移的最大性选择（引理 representatives）在多单位情形不再唯一。[推测] 我不认为作者回避数域是技术不能，是唯一性预算：每个额外单位都会给窗口比较添一族新变量，单折条款要求这些变量全部可锁。

### 6.4 候选失败路线

- [推测] 路线一：用秩 $\ge2$ 曲线换取更大增长。断点在第 9 节窗口：指标差 $\lvert k^2-r\rvert\ge1$ 的整数分离依赖商群是 $\mathbb Z$；$\mathbb Z^2$ 中最短非零向量在高处任意小比例地出现，固定乘性窗口 $\kappa$ 无法与二次型等值面簇分离，$R$ 的候选变成无穷族。
- [推测] 路线二：不设 $E$ 有挠，改用自由秩 1 群 $\mathbb Z P$。断在 $W(nP)$ 对 $n$ 符号的依赖：$\pm n$ 给出同一点取反、同一 $x$，但 $x$ 坐标对负指标无新信息尚可，真正的问题是"正指标枚举"失去挠平移后最大 $x$ 代表不再由有限个比较挑出，representative 条件里 $x(Q)\ge x(Q+t)$ 的四兄弟比较塌缩为 $t=O$ 一员，$y\ge0$ 半平面约束又需要序而 Diophantine 的序只能靠松弛量，成本相似；作者选有挠曲线让"每轨道一个代表"完全由四个代数比较实现，分支全部互异且穷尽（elliptic.tex:257-274 的穷尽性论证依赖 2-挠点之外无 $y=0$ 点）。

- [推测] 路线三：跳过下降直接引用"该曲线秩为 1"的计算代数数论结论。形式化与自洽性上都会断：Lean 侧存在 LocalDescent/SquareSupport/QuadraticHeight/Rank/Duplication/Torsion 一整簇文件（见第 18 节规模表），说明定理链条里每一步下降都要机器可查；论文附录同样把 $\phi,\psi$、核恒等式、像集界、Nagell--Lutz 全量写出，正是"不许引用黑箱"的同款纪律。[推测] 该纪律的动机与形式化目标耦合，属外部推断。

## 7 唯一码层：有理数六元组码与点算术

### 7.1 逐字引用

码定义（elliptic.tex:40-47）："A rational number is represented by six natural numbers $(p,n,d,t,s,q)$ satisfying \[ pn=0,\qquad d=1+t+s,\qquad (p+n)t+d=1+qd. \] Its value is $(p-n)/d$. The denominator is positive and $0\le t<d$; the last equation asserts that $t$ is an inverse of $p+n$ modulo $d$."

引理（lem:rational-codes，elliptic.tex:49-55）："Every rational number has exactly one code satisfying \eqref{eq:rational-code}. Any fixed finite sequence of rational additions, subtractions, multiplications, divisions by nonzero divisors, and comparisons on valid codes has a polynomial implementation with unique outputs and auxiliary coordinates."

动机段（elliptic.tex:35-39）："We must count all coordinates of a rational-point computation, including the witnesses for reducedness. Restricting a B\'ezout coefficient to one residue interval is a standard way to make coprimality witnesses unique... The following shifted inverse identity also handles denominator one without a separate case."

点码与群律（elliptic.tex:85-105 与 99-105）：$o=1$ 时"force both rational numerators to zero; this gives the unique dummy coordinate pair $(0,0)$ and represents $O$"；仿射曲线方程明文为 "$a_y^2d_x^3=d_y^2(a_x^3-25a_xd_x^2)$"；引理 lem:point-arithmetic 断言加法有唯一输出码与唯一完整辅助元组，七情形表在 elliptic.tex:108-123，斜率方程 "$\lambda(x_2-x_1)=y_2-y_1$"（情形 3、4）与 "$2y_1\lambda=3x_1^2-25$"（情形 6、7），门控收尾（elliptic.tex:143-151）："the reducedness equations for a local slope code are gated along with its other equations, and every coordinate of an inactive slope code is forced to zero."

### 7.2 推导补全

合法性方向：从三方程出发，令 $a=p+n$。$pn=0$ 给出 $a=\max(p,n)$ 且 $p,n$ 恰一个非零（或都零）。$(p+n)t+d=1+qd$ 改写为 $at=1+(q-1)d$，故 $at\equiv1\pmod d$，即 $t$ 是 $a$ 模 $d$ 的逆；由 $d=1+t+s$ 得 $0\le t\le d-1$。存在逆元即 $\gcd(a,d)=1$，所以值 $(p-n)/d$ 已既约、分母 $d\ge1$ 为正。

唯一性方向（按证明 elliptic.tex:57-70 补中间步）：给定既约分数 $r=a/d$（$d>0$），符号拆分 $p,n$ 由 $p=\max(a,0),n=\max(-a,0)$ 唯一；$d$ 唯一。若 $d>1$：逆元类 $t\bmod d$ 在 $[0,d-1]$ 恰一个代表，$s=d-1-t$ 随之唯一；再由 $q=((p+n)t+d-1)/d$，分子被整除性保证为整数，非负性检查：$a t\ge 0$ 且 $at=1+(q-1)d$，故 $q=1+(at-1)/d$；当 $t=0$ 时 $a\cdot0=1+(q-1)d$ 逼 $d\mid1$ 与 $d>1$ 矛盾，故实际 $t\ge1$、$q\ge1$？不必细究：证明直接说 $q$ 由等式解出且为非负整，我给逐点核验：$q=(at+d-1)/d$，$at\ge1$（因 $at\equiv1\bmod d$ 且 $at\ne0$），故分子 $\ge d$，$q\ge1$，自然非负。若 $d=1$：$d=1+t+s$ 逼 $t=s=0$；末式 $(p+n)\cdot0+1=1+q\cdot1$ 逼 $q=0$。零的码 $(0,0,1,0,0,0)$ 是这条的特例，与文中"the unique code of zero"逐字吻合。

算术清分母：$z_1+z_2=z_3$ 化为 $a_1d_2d_3+a_2d_1d_3=a_3d_1d_2$（文中例式）。乘法是 $a_1a_2d_3=a_3d_1d_2$。除法 $\div D$（$D$ 为非零已定值）化为 $a_1 d_2=a_2 D$ 型；被除值确定后既约表示唯一，再由唯一码定理整个六元组被锁。比较 $z_1\le z_2$ 化为 $a_1d_2\le a_2d_1$（两侧乘正分母），差即松弛量。

七情形穷尽性补步（elliptic.tex:120-123）：$x_1=x_2$ 时曲线方程给 $y_1^2=y_2^2$，于是 $y_2=\pm y_1$；取反情形入第 5 类（$y_1+y_2=0$），重合情形按 $y_1$ 符号入第 6 或 7 类；$y_1=y_2=0$ 落入 $y_1+y_2=0$，返回 $O$，与 2-挠点相加为自身取反=自身，群律正确。互斥性由守卫的序比较与等式直接读：情形 1、2 关于 $O$ 标志互斥；3、4 由 $x_1<x_2$ 与 $x_1>x_2$ 互斥；5、6、7 在 $x_1=x_2$ 枝内由 $y$ 方程三分。

斜率解的唯一性：情形 3、4 中 $x_2-x_1\ne0$ 由严格比较守卫担保，$\lambda=(y_2-y_1)/(x_2-x_1)$ 是唯一有理解，其码唯一；情形 6、7 中 $y_1\ne0$（$y_1=0$ 会落入第 5 类），$\lambda=(3x_1^2-25)/(2y_1)$ 同理。输出方程 $x_3=\lambda^2-x_1-x_2$、$y_3=\lambda(x_1-x_3)-y_1$ 是弦-切公式的斜率形式；$x_3$ 坐标等式我核对与经典式 $\lambda^2-x_1-x_2$ 一致，$y_3$ 用直线过 $(x_1,y_1)$：$y_3-\!y_1=\lambda(x_3-x_1)$ 移项即文中式。

### 7.3 机械理由

六元组，并非四元组的原因：四元 $(p,n,d,\text{something})$ 无法把"既约"变成方程见证；Bézout 二系数见证 $(u,v)$ 有无穷仿射线族，必须典范化。作者选择的典范化对象不是 Bézout 系数，是逆元剩余 $t$：$\gcd(a,d)=1$ 当且仅当存在（唯一的）$t\in[0,d-1]$ 使 $at\equiv1$，商 $q$ 把同余式铺平成方程。$s$ 则是把区间约束 $t\le d-1$ 写成等式 $d=1+t+s$ 的松弛量。于是"既约见证"被换成了"逆元见证"，每个可解方向恰好一个变量组。平移技巧 $+d$ 与右端 $+qd$（，并非 $1+qd$ 的裸同余式）的作用是让 $t=0,d=1$ 的平凡解自然成立，避免对单位分母单独分支，这就是 elliptic.tex:38-39 那句 without a separate case 的全部工程价值。

$o$ 标志的存在理由：dummy 码是零的有理码，它在仿射平面上指到 $(0,0)$，而 $(0,0)$ 恰是 $E$ 上真实存在的 2-挠点；没有标志则 $O$ 与 $(0,0)$ 共用一组坐标码，加法表会在第 5 类与第 1、2 类之间串线。elliptic.tex:96-97 明写 "the flag distinguishes $O$ from the affine point $(0,0)$"。

固定倍点插入（elliptic.tex:153-157）：$P$ 与四个挠点取定后以固定整数码进入系统，"No assertion that the construction numerically computes this choice of $P$ is needed"，这句与 main.tex:117-121 的存在性立场呼应：整篇给的是存在一个整系数多项式，不是给算法。

除法只允许"by nonzero divisors"：除零在清分母后变成恒等式 $0=0$，会释放整个输出码的自由度；守卫保证除数非零是引理陈述里那个定语的全部重量。

### 7.4 候选失败路线

- [推测] 路线一：用经典 Bézout 码 $(u,v,p,n,d)$ 加区间限制 $0\le u<d$。$v$ 虽由 $u$ 决定，但 $d=1$ 时区间退化为 $\{0\}$ 而 $u=0$ 需要 $vd=1$ 给出 $v=1$，与 $v$ 的符号码又叠一层分支；两个分支（$d=1$、$d>1$）在每次除法处都要门控一次，嵌套调用里门控变量呈指数膨胀，且每个分支多一套松弛量。作者换逆元码后分支消失。这条路线我在草稿里写到第三个嵌套除法就停了。
- [推测] 路线二：只锁 $x$ 坐标码、让 $y$ 用"方程的两个根任选其一并给符号见证"。断点：$y$ 的符号见证本身是自由布尔变量，除非每个比较链都带符号选择子；elliptic.tex:115-118 的分支设计正是把 $y$ 的符号当作情形守卫（$y_1=y_2>0$ 与 $<0$ 分立），说明符号信息只能活在守卫里，不能活在见证里。
- [推测] 路线三：加法表省略第 6、7 类，把倍加并为"切线斜率统一式"。断点：$y_1=y_2<0$ 与 $y_1=-y_2$（第 5 类）在只用 $y_1=y_2$ 或 $y_1+y_2=0$ 判据时于 $y_1=y_2=0$ 重叠或于符号上含糊，穷尽性证明 elliptic.tex:120-123 依赖三分法把 $y=0$ 划给第 5 类；合并后守卫不再互斥，选择子不再被展示参数唯一决定（违反 lem:composition 的不交条件）。

## 8 高度机器：一致误差、倍增常数和代表点

### 8.1 逐字引用

定义与定理引用（elliptic.tex:176-197）："$H(a/d)=\max\{|a|,d\}$"；"$\widehat h(Q)=\frac12\lim_{N\to\infty}4^{-N}h_x([2^N]Q)$"；一致比较式 eq:uniform-height：$\bigl|\log H(x(Q))-2\widehat h(Q)\bigr|\le c_E$，并注明"These are precisely the uniform comparison and quadraticity statements of \cite[Chapter~VIII, Proposition~9.1 and Theorem~9.3]{silverman}."

常数选择（elliptic.tex:200-208）："Choose an integer $\kappa>e^{6c_E}$, then choose a positive even integer $m_*$ so large that $a_E=2m_*^2\widehat h(P)$ satisfies \[ a_E>2c_E,\qquad 2a_E-6c_E>\log\kappa. \] Such a choice exists because $\widehat h(P)>0$."

$W$ 函数与序列（elliptic.tex:210-236）："$W(Q)=H(x([m_*]Q))$（非 $O$ 时），$W(O)=1$"；eq:quadratic-sequence：$W_0=1,\ \log W_j=a_Ej^2+\varepsilon_j,\ |\varepsilon_j|\le c_E$；"the successive logarithmic difference is at least $a_E(2j+1)-2c_E>0$. Hence $(W_j)_{j\ge0}$ is strictly increasing and unbounded."

代表点条件（eq:representative，elliptic.tex:240-246）："$Q\ne O,\ y(Q)\ge0,\ W(Q)>1,\ Q+t\ne O$ and $x(Q)\ge x(Q+t)\ (t\in\mathcal T)$."引理 lem:representatives："For each integer $j\ge1$, exactly one point in $(jP+\mathcal T)\cup(-jP+\mathcal T)$ satisfies \eqref{eq:representative}."

### 8.2 推导补全

$\widehat h$ 的二次性用在两处。其一，$\log W_j=\log H(x([m_*](jP+t)))$：$[m_*]$ 是群自同态，$m_*(jP+t)=m_*jP+m_*t$；$m_*$ 偶且 $\mathcal T\cong\mathbb Z/2\times\mathbb Z/2$ 的指数为 2，故 $m_*t=O$，于是 $[m_*](jP+t)=[m_*j]P$ 只依赖 $j$ 与符号？$x$ 对取反不变：$[-m_*j]P$ 与 $[m_*j]P$ 同 $x$，故只依赖 $j=\lvert n\rvert$，这正是 $W_j$ 良定义的原因。其二，$\widehat h([m_*j]P)=(m_*j)^2\widehat h(P)$，代入 eq:uniform-height：$\log H(x([m_*j]P))=2\widehat h([m_*j]P)+O'(1)$，其中 $O'$ 用同一 $c_E$（把 $Q=[m_*j]P$ 视为一个点整体），得 $2m_*^2\widehat h(P)j^2+\varepsilon_j$，$\lvert\varepsilon_j\rvert\le c_E$，与 $a_E$ 定义对齐。

单调性核验：$\log W_{j+1}-\log W_j=a_E(2j+1)+\varepsilon_{j+1}-\varepsilon_j\ge a_E(2j+1)-2c_E$；$j\ge1$ 时 $\ge3a_E-2c_E>0$（用 $a_E>2c_E$ 甚至只需 $3a_E>2c_E$，取 $a_E>2c_E$ 是为了给窗口计算留统一常数）。无界性由主项增长立得。

代表点唯一性补步（照 elliptic.tex:257-274 展开）：(i) $W(Q)>1$ 排除挠：挠点 $Q$ 使 $[m_*]Q=O$，$W(Q)=1$；非挠点 $[m_*]Q$ 非 $O$，其 $x$ 坐标码的 $H\ge1$，而 eq:quadratic-sequence 在 $j=0$ 外都 $>1$。(ii) 陪集 $jP+\mathcal T$ 内 $x$ 互异：若 $x(Q_1)=x(Q_2)$，短 Weierstrass 形式给 $y_1^2=y_2^2$，故 $Q_2=\pm Q_1$；相等则平移同；取反则 $Q_1+Q_2=O$ 即 $2jP\in\mathcal T$，与非挠矛盾。(iii) 四点集有唯一最大 $x$；条件 $x(Q)\ge x(Q+t)$ 恰好选中它（$t=O$ 时自反成立）。(iv) 取反保持 $x$、置换 $\mathcal T$（因挠群在取反下封闭），所以反陪集的唯一最大点是正陪集最大点的取反；二者 $y$ 相反，恰一个 $y\ge0$；$y=0$ 的点全在 $\mathcal T$ 内，被 $W>1$ 排除，所以两个最大点 $y$ 非零、$y\ge0$ 判据不产生并列。穷尽性：任意 $Q$ 属某 $nP+t$，按 $\pm n$ 归到唯一代表轨道。

$Q+t\ne O$ 条款的必要性补验：若无此条，代表条件可能对 $Q$ 与 $-Q$（当 $Q=-t'$ 为挠时）双选中；但挠已被 $W>1$ 杀，所以此条与 $W>1$ 冗余吗？我核对：$Q$ 非挠时 $Q+t$ 永不为 $O$（$O-t$ 是挠），因此该条对非挠点自动成立。它的真实功能是让代表测试成为纯有限多项式系统时，把"每个平移的加法输出非 $O$"显式可验，供 $x(Q)\ge x(Q+t)$ 的比较有定义域保障（$O$ 的 $x$ 是 dummy 0，不比较）。这是防呆条款，并非新数学。

### 8.3 机械理由

$\kappa>e^{6c_E}$ 的数字理由要到第 9 节才闭合：窗口的六个高度项各贡献一份至多 $c_E$ 的误差，$W_k$ 在 $D_0$ 里以平方出现贡献两份，合计 $6c_E$（elliptic.tex:344-349："The error has six terms when multiplicity is counted: one each from $W_{2k},W_r,W_1,W_{r+1}$, and two from $W_k$."）。不等式 $2a_E-6c_E>\log\kappa$ 把两个要求夹成可行区间 $e^{6c_E}<\kappa<e^{2a_E-6c_E}$，可行当且仅当 $6c_E<2a_E-6c_E$，即 $a_E>6c_E$；作者实际取 $a_E>2c_E$ 加上第二条严格不等式共同担保，因为 $\kappa$ 先取（只依赖 $c_E$），再要求 $2a_E-6c_E>\log\kappa$ 通过 $m_*$ 放大 $a_E$ 达成，两个条件可同时满足。$m_*$ 偶数是杀 $\mathcal T$（指数 2）的机械要求，"so large"是放大 $a_E$ 的自由度，两者由同一整数实现。

为什么用"完整的 $\log x$ 高度"，并非 Poonen 式的分母增长：elliptic.tex:168-172 自述差别在 bounded logarithmic error permits an exact comparison of integer indices。Poonen 2002 的路径（main.tex:98-100 引 \cite[Theorem~1 and Section~2.3, Lemma~8]{poonen2002}）服务的是整数环间存在定义，其误差结构容许的是极限意义下的定义；单折要的是精确逐点分离，必须有对一切点统一成立的 $c_E$。N\'eron--Tate 定理给出的一致版（Silverman AEC VIII.9.1/9.3）是这里的承重墙，误差有界是"exact index selection"（main.tex:104）的充要气氛：误差若依赖 $Q$，窗口要么不可判要么无穷宽。

$W$ 计算本身的单折性（elliptic.tex:218-223）：先走 $[m_*]Q$ 的固定加法链（倍加次数固定，链长是常数），再取 $x$ 码的 $\max(p+n,d)$；max 用两个比较分支、唯一松弛量；dummy 码给出 $W=1$ 与定义一致。这一段是"$W$ 是单折可计算函数"的机器面，我特别记下作者连"无穷远点的 dummy 坐标也返回 1"都核对过，免得 $W$ 在 $O$ 处留自由。

### 8.4 候选失败路线

- [推测] 路线一：不设 $m_*$，直接对 $P$ 的轨道取 $x$ 最大代表。断在挠平移的 $x$ 互异性仍成立，但误差常数与主项系数 $\widehat h(P)$ 之间没有放大旋钮：$a_E=\widehat h(P)$ 是曲线固有值，很可能不满足 $2a_E-6c_E>\log\kappa$（右端 $\kappa$ 又由同一 $c_E$ 控制时区间 $6c_E$ 与 $2\widehat h(P)-6c_E$ 可能空交）；倍增 $m_*$ 的意义就是把 $a_E$ 拉高而 $c_E$ 不动（$c_E$ 只依赖曲线与坐标，不依赖点，见 eq:uniform-height 的量词）。
- [推测] 路线二：用 $y$ 坐标高度或 naive 分母高数替代 $\log H(x)$。断在与 $\widehat h$ 的一致比较：$y^2=x^3-25x$ 给 $h_y=\frac32h_x+O(1)$ 尚可，但倍加主项系数变为 $\frac32$ 倍，重标无本质困难；真正失败的是取反下 $y$ 变号、$y$ 高度的符号处理引入额外门控，而 $x$ 是偶函数（elliptic.tex:189 "Since $x$ is an even function of degree two"），唯一性预算直接省掉符号分支。

- [推测] 路线三：代表条件里删 $y(Q)\ge0$，允许每轨道两个代表（$Q$ 与 $-Q$ 同 $x$ 同 $W$）。断在唯一性：此后每个绝对指标 $j$ 恰有两个代表点，括号与窗口选出的 $R$ 有双胞胎，完整元组数量翻倍，第 9 节 g 的图不再是单折；补救需要把符号也典范化，而 $y\ge0$ 是四个代数比较里最便宜的典范化。

## 9 增长函数 g：单折机器的心脏（prop:growth）

### 9.1 逐字引用

命题（elliptic.tex:283-293）："There are a total function $g:\mathbb N\to\mathbb N$, a real constant $\delta>0$, and an integer $u_0\ge4$ such that the graph of $g$ has a single-fold Diophantine representation, including uniqueness of its output and every auxiliary coordinate for each input, and \[ \delta(\log u)^2<\log g(u)<u\log u \qquad(u\ge u_0). \]"

括号选择（elliptic.tex:296-313）："On input $u\in\mathbb N$, require a representative $Q$ satisfying \[ W(Q)\le u+W_1<\max\{W(Q+P),W(Q-P)\}. \] If $Q$ has absolute index $k\ge1$, its two neighbors have W-values $W_{k-1}$ and $W_{k+1}$, in some order. Thus their maximum is $W_{k+1}$... there is exactly one $k\ge1$ such that $W_k\le u+W_1<W_{k+1}$. Lemma~\ref{lem:representatives} then gives exactly one permissible point $Q$. This reasoning includes $u=0$, for which $k=1$."

窗口恒等式与系统（elliptic.tex:321-338）："The quadratic main terms in \eqref{eq:quadratic-sequence} suggest the identity \[ (2k)^2-2k^2-\bigl((r+1)^2-r^2\bigr)+1=2(k^2-r). \] ... form the positive integers \[ L_0=W([2]Q)\,W(R)\,W_1,\qquad D_0=W(Q)^2\max\{W(R+P),W(R-P)\}, \] and impose \[ L_0\le\kappa D_0,\qquad D_0\le\kappa L_0. \]"

误差核算（elliptic.tex:341-358）："$\log\frac{L_0}{D_0}=2a_E(k^2-r)+e,\ |e|\le6c_E$"；"The error has six terms when multiplicity is counted: one each from $W_{2k},W_r,W_1,W_{r+1}$, and two from $W_k$."；"If $r=k^2$, its absolute value is less than $\log\kappa$, so \eqref{eq:square-window} holds. If $r\ne k^2$, integer separation and \eqref{eq:height-constants} give $\left|\log\frac{L_0}{D_0}\right|\ge2a_E-6c_E>\log\kappa$, so the window fails."

总量与增长段（elliptic.tex:362-402）：输出 "$g(u)=W(R)=W_{k^2}$"；估计链 "$a_Ek^2-c_E\le\log U<u+W_1$ 侧的双边：$a_Ek^2-c_E\le\log U<a_E(k+1)^2+c_E\le4a_Ek^2+c_E$"；下界 "We may take $\delta=1/(128a_E)$"；上界 "$\log g(u)\le a_Ek^4+c_E\le\frac{(\log(u+W_1)+c_E)^2}{a_E}+c_E=O((\log u)^2)$. This is eventually strictly less than $u\log u$."

图注（height-window-figure.tex:27-31）："The choice $6c_E<\log\kappa<2a_E-6c_E$ puts the entire middle interval in the admissible band and every other integer-index interval outside it. The error bars represent bounds, not additional variables."

### 9.2 推导补全

恒等式验算：左端 $=4k^2-2k^2+r^2-(r^2+2r+1)+1=2k^2-2r=2(k^2-r)$。关键在 $+1$ 项：它精确抵消 $(r+1)^2-r^2=2r+1$ 里的常数 1，使待验证命题 $r=k^2$ 对应主项精确为零，分离间隙从"某点附近"提升为"距零至少 $2a_E$"。

对数比展开：$\log(L_0/D_0)=\log W_{2k}+\log W_r+\log W_1-2\log W_k-\log W_{r+1}$。代入 $\log W_j=a_Ej^2+\varepsilon_j$：主项 $a_E[(2k)^2+r^2+1^2-2k^2-(r+1)^2]=2a_E(k^2-r)$；误差 $e=\varepsilon_{2k}+\varepsilon_r+\varepsilon_1-2\varepsilon_k-\varepsilon_{r+1}$，六份 $\pm c_E$，$\lvert e\rvert\le6c_E$。注意 $\log W_1$ 是固定整数 $W_1=W(P)$ 的对数，并非变量，它带着自己的误差 $\varepsilon_1$ 进入核算，这正是"六项"的由来，若误当精确值只数五项就会把半径写成 $5c_E$，窗口判断的两分支各差一份。

两分支闭合：接受侧，$r=k^2$ 时 $\lvert\log(L_0/D_0)\rvert=\lvert e\rvert\le6c_E<\log\kappa$（严格化用 $\kappa>e^{6c_E}$），故 $e^{-\log\kappa}<L_0/D_0<e^{\log\kappa}$ 即 $L_0\le\kappa D_0$ 与 $D_0\le\kappa L_0$。拒绝侧，$r\ne k^2$ 时 $\lvert k^2-r\rvert\ge1$（整数分离！$k,r$ 都是正整数指标），$\lvert\log(L_0/D_0)\rvert\ge2a_E-6c_E>\log\kappa$，窗口两式中至少一式违反映。于是窗口恰由指标 $r=k^2$ 的代表点满足；再由 lem:representatives，绝对指标 $k^2$ 的代表点唯一，$R$ 被钉死。

括号侧：$Q=jP+t$，$\lvert j\rvert=k$。$Q\pm P=(j\pm1)P+t$，绝对指标为 $\lvert j\pm1\rvert$；$j=k\ge1$ 时得 $\{k+1,k-1\}$，$j=-k$ 时得 $\{k-1,k+1\}$（$\lvert-k+1\rvert=k-1$，$\lvert-k-1\rvert=k+1$），所以无论符号，邻点 $W$ 值集合相同，最大者 $W_{k+1}$。严格增无界序列 + $u+W_1\ge W_1$ 给出恰一个 $k$ 使 $W_k\le u+W_1<W_{k+1}$；$u=0$ 时该式是 $W_1\le W_1<W_2$，$k=1$ 成立，无需特判。这就是偏移 $+W_1$ 的全部职能：把定义域左端从 $W_1$ 平移到 0，换全域性。

增长估计补步：下界一侧，$\log U\ge a_Ek^2-c_E$ 与 $\log U<4a_Ek^2+c_E$ 来自括号 $\log W_k\le\log U<\log W_{k+1}$ 加 eq:quadratic-sequence。由右不等式，$k^2>(\log U-c_E)/(4a_E)$；$u$ 充分大时 $\log U=\log(u+W_1)\ge\frac12\log u$（文中说"for all sufficiently large $u$"并直接给 $k^2>\log u/(8a_E)$， absorbed 了 $c_E$ 与 $W_1$），于是 $\log g=a_Ek^4+\varepsilon_{k^2}\ge a_Ek^4-c_E> a_E(\log u/(8a_E))^2-c_E=(\log u)^2/(64a_E)-c_E$，再吸收一次 $c_E\le(\log u)^2/(128a_E)$，得 $(\log u)^2/(128a_E)$，即 $\delta=1/(128a_E)$。上界一侧同理，$\log g\le((\log(u+W_1)+c_E)^2)/a_E+c_E$ 是 $(\log u)^2$ 阶，终小于 $u\log u$。两界在 $u$ 大后同时成立，取 $u_0\ge4$ 越过阈值。

### 9.3 机械理由

为什么必须引入 $[2]Q$：可用的指标池只有 $\{k-1,k,k+1,1,r,r+1\}$ 这类线性扰动，它们平方之后对 $k$ 只贡献 $k^2$ 的一次组合（$(k+1)^2-k^2=2k+1$ 线性），要得到 $+2k^2$ 的净系数就必须借 $(2k)^2-2k^2$，即固定倍加 $[2]Q$。恒等式左侧的每一项都对应系统里一个真实的高度计算，无一项是装饰：$W([2]Q)$ 对应 $4k^2$，$-2\log W_k$ 对应 $D_0$ 里的平方 $W(Q)^2$，$W_r$ 与 $-W_{r+1}$ 对应 $R$ 与它的邻点最大，$W_1$ 对应常数校准。

为什么用乘性窗口，并非加性比较：Diophantine 系统里没有 $\log$；$\log(L_0/D_0)$ 的全部作用被翻译成两条整数不等式 $L_0\le\kappa D_0$、$D_0\le\kappa L_0$，即"指标选择用 products, comparisons and fixed additions 表达，indices and logarithms 属于证明不属于系统"（main.tex:169-171 逐字："The conditions use only products, comparisons and fixed additions of rational points; the indices and logarithms belong to their proof, not to the polynomial system."）。

为什么 $\max$ 出现在 $D_0$：$R$ 的邻点不知道符号方向，$\max\{W(R+P),W(R-P)\}=W_{r+1}$ 与 $Q$ 侧同理，是"绝对指标"进入系统的唯一方式；max 本身由第 5 节的两个比较分支实现，唯一松弛量与选择子。

为什么 $Q$ 与 $R$ 都要求是代表点：把每个绝对指标的候选从 8 个点（$\pm j$ 各 4 个挠平移）压到 1 个点，全靠 eq:representative 的五条件；这一步不做完，后面任何高度比较都在多重集上取义，唯一性预算立刻破产。

为什么 g 只声明增长界而不声明具体公式：g 的角色在 power.tex 里只被两处消费，$v<g$ 的截断（需要 $\log v$ 超过 Pell 坐标的对数上界，即下界 $\delta(\log u)^2$）与 $v<u\log u$（保证指标 $<u$），公式细节（$W_{k^2}$ 的算术身份）完全不出场。这是刻意的接口最小化：第 11 节只吃 eq:power-growth-hypothesis 这一个假设。

### 9.4 候选失败路线

- [推测] 路线一：去掉括号，只留窗口选 $(Q,R)$。断点：对每个 $k\ge1$，取指标 $k$ 的代表 $Q_k$ 与指标 $k^2$ 的代表 $R_{k^2}$ 都满足窗口，输入 $u$ 与系统无任何联系，见证对 $(Q_k,R_{k^2})$ 有无穷多个，g 连有限折都不是。括号是把"输入尺度"注入唯一性的唯一通道，这也是我重读证明时承认的最精巧耦合点：$u$ 不进任何代数方程，只通过 $W$ 值区间约束点。
- [推测] 路线二：用 $(k+1)$ 倍点代替 $[2]Q$ 凑二次项，如 $(k+1)^2-k^2-r$ 型组合。断点：$(k+1)^2-k^2=2k+1$ 线性，与 $r^2-(r+1)^2=-2r-1$ 相消后主项是 $2(r-k)$ 加常数，只能检测 $r=k$ 型仿射关系；要检测乘性关系 $r=k^2$ 必须有净 $k^2$ 项，二倍点是最低成本实现（更高倍点只是把 $a_E$ 再放大，窗口几何不变，文中"scalar can enlarge $a_E$"已覆盖该自由度）。
- [推测] 路线三：把窗口常数 $\kappa$ 改成依赖 $k$ 的函数（例如随输入增长的宽窗）。断点：$\kappa$ 必须是系统里的固定整数才能写成 $L_0\le\kappa D_0$；随 $k$ 变宽的窗在拒绝侧失效，因为 $r\ne k^2$ 时主项间隙 $2a_E$ 是绝对常数，窗宽一旦可比或更宽，邻位指标混入选 R，唯一性断。整数分离能给出的分离功率与二次主项曲率成正比，这正是 $a_E$ 可以被 $m_*$ 放大而 $c_E$ 不动的红利用途。

## 10 Pell 序列引理：指数恢复的初等引擎

### 10.1 逐字引用

引理（lem:pell-sequences，power.tex:18-35）："For an integer $a\ge2$, put $D=a^2-1$ and define integers $x_i(a),y_i(a)$ by $(a+\sqrt D)^i=x_i(a)+y_i(a)\sqrt D\ (i\ge0)$. Every solution in positive integers of $x^2-Dy^2=1$ is $(x_i(a),y_i(a))$ for exactly one $i\ge1$. Moreover, \[ y_i(a)\equiv i\pmod{a-1},\qquad (2a-1)^{i-1}\le y_i(a)\le(2a)^{i-1}\quad(i\ge1). \] If $b,u\ge2$ and $n\ge0$ are integers, then \[ b^n\le\frac{y_{n+1}(bu)}{y_{n+1}(u)}\le b^n\left(1+\frac1{2u-1}\right)^n. \]"

存在性核（power.tex:44-56）："Choose the unique integer $i\ge0$ for which $1\le\gamma:=\beta\alpha^{-i}<\alpha$. ... If $\gamma>1$... Thus $y'\ge1$ and $x'^2=1+Dy'^2\ge a^2$, which implies $\gamma\ge\alpha$, a contradiction. Consequently $\gamma=1$ and $\beta=\alpha^i$."

比值单调（power.tex:77-89）："We also have $R_i(bu)\ge bR_i(u)$ for every $i\ge1$. There is equality for $i=1$, and the induction step follows from $R_{i+1}(bu)-bR_{i+1}(u)=\frac b{R_i(u)}-\frac1{R_i(bu)}\ge0$."

### 10.2 推导补全

非平方性：$(a-1)^2=a^2-2a+1<a^2-1=D<a^2$（$a\ge2$ 时 $2a-1\ge3>0$ 保证左不等式），夹在连续平方之间故 $D$ 非平方，$\sqrt D$ 无理。

生成性：范数 $N(x+y\sqrt D)=(x+y\sqrt D)(x-y\sqrt D)=x^2-Dy^2$ 乘性。正解 $\beta=x+y\sqrt D>1$（$x,y\ge1$ 且 $x^2=1+Dy^2>0$），其共轭 $x-y\sqrt D=1/\beta\in(0,1)$，故 $\beta>1$ 且 $\beta^{-1}>0$。取 $i$ 使 $1\le\gamma=\beta\alpha^{-i}<\alpha$（对数刻度上必然存在且唯一）。$\gamma$ 系数为 $\mathbb Z[\sqrt D]$ 中元素（$\alpha^{-1}=a-\sqrt D\in\mathbb Z[\sqrt D]$，其幂也是），范数 1：$\gamma\gamma'=1$。若 $\gamma>1$：$x'=(\gamma+\gamma^{-1})/2>0$、$y'=(\gamma-\gamma^{-1})/(2\sqrt D)>0$ 为整数，$y'\ge1\Rightarrow x'^2=1+Dy'^2\ge1+D=a^2\Rightarrow x'\ge a\Rightarrow\gamma=x'+y'\sqrt D\ge a+\sqrt D=\alpha$，与 $\gamma<\alpha$ 矛盾。故 $\gamma=1$。$i$ 的唯一性：$\alpha>1$ 时 $\alpha^i$ 严格增。

同余：递推 $y_{i+2}=2ay_{i+1}-y_i$，$y_0=0,y_1=1$；模 $a-1$ 下 $2a\equiv2$，得 $\bar y_{i+2}=2\bar y_{i+1}-\bar y_i$，而 $\bar y_i\equiv i\cdot1$ 满足同递推（$2(i+1)-(i)=i+2$）与同初值，归纳即 $y_i\equiv i\pmod{a-1}$。

双侧增长：$R_i=y_{i+1}/y_i$ 满足 $R_1=2a$、$R_{i+1}=2a-1/R_i$；归纳 $2a-1\le R_i\le2a$：$R_1=2a$ 在区间内；若 $R_i\in[2a-1,2a]$ 则 $1/R_i\in[1/(2a),1/(2a-1)]$，$R_{i+1}\in[2a-1/(2a-1),2a-1/(2a)]\subset[2a-1,2a]$（用 $1/(2a)\le1/(2a-1)$ 与 $2a-1/(2a-1)\ge2a-1$ 即 $1/(2a-1)\le1$）。连乘 $y_i=\prod_{h=1}^{i-1}R_h\cdot y_1$ 给 $(2a-1)^{i-1}\le y_i\le(2a)^{i-1}$。$y_{n+1}(a)\ge(2a-1)^n\ge n+1$：$2a-1\ge3$，$3^n\ge n+1$ 归纳显然。

比值双侧：先证 $R_i(bu)\ge bR_i(u)$：$i=1$ 等号（$2bu=b\cdot2u$）；归纳步 $R_{i+1}(bu)-bR_{i+1}(u)=(2bu-1/R_i(bu))-b(2u-1/R_i(u))=b/R_i(u)-1/R_i(bu)\ge0$，因 $R_i(bu)\ge bR_i(u)\ge R_i(u)\ge1$（第一步用归纳假设，$b\ge2$）。连乘形式：$y_{n+1}(bu)/y_{n+1}(u)=\prod_{i=1}^{n}R_i(bu)/R_i(u)$，每项 $\ge b$ 给左界 $b^n$；每项 $\le2bu/(2u-1)=b\cdot\frac{2u}{2u-1}=b(1+\frac1{2u-1})$ 给右界 $b^n(1+\frac1{2u-1})^n$。$n=0$ 空积时 $y_1(bu)/y_1(u)=1=b^0$，同式成立（power.tex:88-89 专门核对）。

### 10.3 机械理由

这一族引理为何长成这样，要按"系统里能写什么方程"倒过来读。Diophantine 系统能直接书写的只有：Pell 型方程 $X^2-DF^2=1$（系数含参数 $a$ 的多项式）、线性同余 $F\equiv n+1\pmod{a-1}$（写成 $F=n+1+(a-1)q$，$q\in\mathbb N$ 由等式两侧确定当 $F$ 确定）、区间截断 $0<F<v$（松弛量）。因此引理的三件套恰好是这三件事的解析学对应：双射性（每个正解恰有一个指标 $i$，power.tex:24-25 逐字 "exactly one $i\ge1$"）保证"解即指标"不需要额外见证；同余 $y_i\equiv i\pmod{a-1}$ 把指标从数值里按模读出；双侧指数增长把"指标 $<u$"翻译成一个纯粹的大小条件 $y_i<(2u-1)^{u-1}$。三者拼起来，指标既被截断限制在 $[1,u)$，又被模 $a-1$（或 $bu-1$）的剩余类锁定，区间长度不足一个周期时锁定就是精确锁定。

$D=a^2-1$ 的选择是经典成对 Pell 设置（main.tex:92-97 说我们沿用 Cantone--Cuzziol--Omodeo 的策略并替换其指数截断；power.tex:9-13 明确 "adapt Matiyasevich's exponential single-fold construction \cite[Section~4]{mati1974}"）：两个 Pell 方程共享一个指标参数 $n+1$，模数分别是 $bu-1$ 与 $u-1$，比值 $y_{n+1}(bu)/y_{n+1}(u)$ 夹住 $b^n$。为什么模 $a-1$：$a\equiv1\pmod{a-1}$ 使递推系数 $2a\equiv2$，同余序列退化为等差，这是同余读标全部便宜性的来源；选 $D=a^2+1$ 或任意非平方 $D$ 就没有这个同余结构。

比值单调 $R_i(bu)\ge bR_i(u)$ 的机械职能：它给商的下界，从而给 $c=\lfloor F/H\rfloor\ge b^n$ 的"$\ge$"方向；上界靠 $\frac{R_i(bu)}{R_i(u)}\le\frac{2bu}{2u-1}=b(1+\frac1{2u-1})$ 与几何级数尾界。两条界在下一节的商识别里各自到位，这里先埋线。

$n=0$ 的边界：$y_1\equiv1$、空积为 1，比值的两边都塌成 1，商 $c=1=b^0$ 无误。文中在三处（power.tex:88、255-261 以及 174-178 的截断核验）分别点名了 $n=0$，说明这是被认真核验过的退化点，并非被默认吞掉。

### 10.4 候选失败路线

- [推测] 路线一：把双侧界换成单侧 $y_i\ge(2a-1)^{i-1}$ 加"解必属某 $y_i$"的事实，不设上界。截断 $F<v$ 只能给出 $i$ 的上界方向（$y_i$ 增长快于 $v$ 时 $i$ 有上界），这个方向恰好是需要的，看似可省上界；但商 $F/H$ 的上界误差必需（否则 $F/H$ 可远大于 $b^n$，商识别断），而上界 $\le(2a)^{i-1}$ 又在存在性核验 power.tex:246-252 里给 $\log F$ 封顶。单侧化会在验证两端各断一次。
- [推测] 路线二：用固定 $D=5$ 的 Fibonacci/Pell 盘替代参数族 $D=a^2-1$。固定 $D$ 的 Pell 群仍是循环的，但模数（$a-1$）不再随参数动，两个 Pell 方程无法共享可锁定的自由整数对 $(bu,u)$；经典 Julia Robinson 路线要借 Lucas 序列的额外整除链，互素见证唯一性更难安置。成对 Pell 加参数模数是 Matiyasevich 1974 单折指数构造的原生部件，换掉等于放弃已核算过的唯一性预算。
- [推测] 路线三：直接量化指标 $i$ 并要求 $F=y_i(bu)$。$y_i$ 作为 $i$ 的函数不是多项式（Lucas 序列需要指数表示才能闭式），把指标塞进系统等于预先假设有单折的"序列求值"关系，这是循环论证。文中把指标声明为纯证明记号（power.tex:274-275 逐字："The indices $i,j$ used in the proof introduce no variables in the system."）。

## 11 幂关系的单折表示（prop:power）

### 11.1 逐字引用

命题（power.tex:96-113）："Suppose that $g:\mathbb N\to\mathbb N$ has a complete single-fold graph and that there are fixed constants $\delta>0$ and $u_0\in\mathbb N$, with $u_0\ge4$, such that \[ \delta(\log u)^2<\log g(u)<u\log u \qquad(u\ge u_0). \] Then the relation $\operatorname{Pow}(b,n,c)\Longleftrightarrow b\ge2\ \hbox{and}\ c=b^n$ has a complete single-fold representation. In particular, for each $b\ge2$ and $n\in\mathbb N$, the output $c$ and all auxiliary variables are jointly unique."

设计说明（power.tex:116-124）："The ratio in Lemma~\ref{lem:pell-sequences} suggests taking $c$ as the integer quotient of $y_{n+1}(bu)$ by $y_{n+1}(u)$. To make its error less than one without introducing a free scale, we prescribe $u$ as a polynomial in $c,b,n$... For the intended output $c=b^n$, a sufficiently large fixed power of $c+1$ also makes $g(u)$ exceed both intended Pell coordinates."

系统五式（power.tex:132-141，逐字）："$b\ge2,\qquad u=(c+1)^\ell(n+1)(b+1)+u_0,\qquad v=g(u)$"；"$X^2-\bigl((bu)^2-1\bigr)F^2=1,\qquad Y^2-(u^2-1)H^2=1$"；"$0<F<v,\qquad 0<H<v$"；"$F=n+1+(bu-1)q,\qquad H=n+1+(u-1)q'$"；"$F=cH+r,\qquad r<H$"。

$\ell$ 选取与多项式性（power.tex:126-128、142-147）："Choose a fixed positive integer $\ell>\frac3{\delta\log2}$."；"The exponent $\ell$ is fixed, so the formula for $u$ is polynomial."；"Only the fixed integers $\ell,u_0$ enter the system; $\delta$ and logarithms occur only in its proof."

截断不等式（power.tex:152-162）："$u^u<(2u-1)^{u-1}\ (u\in\mathbb N,\ u\ge4)$"，证明用 $f(u)=(2-1/u)^{u-1}/u$，$f(4)=343/256>1$，且 $f(u+1)/f(u)>\frac{2u-1}{u+1}>1$。

商识别（power.tex:192-217）："$c=\lfloor F/H\rfloor\ge b^n$"；"$0\le\frac FH-b^n\le\frac{b^n n}{2u-1-n}\le\frac{cn}{2u-1-n}<1$"；"$2u-1-n-cn\ge cn+2c+n+9>0$"。

存在性核验（power.tex:241-254）："$\log u\ge\ell n\log b\ge\ell n\log2$"；"$\log F\le n\log(2bu)\le\frac3{\ell\log2}(\log u)^2<\delta(\log u)^2<\log v$"。

唯一性段（power.tex:264-277）："For fixed $b,n$, the soundness argument first fixes $c$. The formula in \eqref{eq:power-input} then fixes $u$, after which the single-fold hypothesis fixes $v$ and every auxiliary variable in its call. Equation~\eqref{eq:pinned-pell-indices} fixes $F,H$. Their Pell equations fix the natural coordinates $X,Y$, since a nonnegative square root is unique. The two residue equations fix $q,q'$, and the division equation fixes $r$. All inequality slacks are then fixed... The indices $i,j$ used in the proof introduce no variables in the system. Thus the complete tuple is unique. Finally, the constraint $b\ge2$ excludes all solutions at $b=0,1$."

### 11.2 推导补全

锁定链第一步（指标压缩）。任一解里 $u\ge u_0\ge4$。$F,H>0$ 满足 Pell 方程，系数 $(bu)^2-1$ 与 $u^2-1$ 分别形如 $a^2-1$（$a=bu\ge2$、$a=u\ge2$），由引理 10 双射存在唯一 $i,j\ge1$ 使 $F=y_i(bu)$、$H=y_j(u)$。增长上界 $\log g(u)<u\log u$ 即 $v<u^u$，再串 eq:pell-index-cutoff：$F,H<v<u^u<(2u-1)^{u-1}$。若 $i\ge u$，则 $F=y_i(bu)\ge(2bu-1)^{i-1}\ge(2u-1)^{u-1}$（$b\ge2$，$i-1\ge u-1$，底与指数同向单调），矛盾；故 $1\le i<u$，同理 $1\le j<u$。

锁定链第二步（同余钉标）。残数方程直接给 $H\equiv n+1\pmod{u-1}$ 与 $F\equiv n+1\pmod{bu-1}$；引理同余给 $H=y_j(u)\equiv j\pmod{u-1}$、$F=y_i(bu)\equiv i\pmod{bu-1}$。由 $u$ 公式，$n+1<u-1$（power.tex:180-181："$1\le n+1<u-1$"，用 $\ell\ge1$、$(c+1)(b+1)\ge1$ 逐项放大即得），于是区间 $[1,u-1]$（$j$ 的实际范围是 $1\le j\le u-1$）内模 $u-1$ 剩 $n+1$ 唯一代表，$j=n+1$；$i$ 侧区间 $1\le i\le u-1<bu-1$ 更短于一个周期，$i=n+1$。得 eq:pinned-pell-indices：$i=j=n+1$。

锁定链第三步（商识别）。$F=cH+r$、$0\le r<H$ 意味着 $c=\lfloor F/H\rfloor$，比值下界给 $c\ge b^n$。误差：$nz<1$（$z=1/(2u-1)$；由 $u\ge(c+1)(n+1)+4$ 推 $2u-1-n-cn\ge cn+2c+n+9>0$，文中 power.tex:212-216 先算此正性再回用），二项式逐项 $\binom nh z^h\le(nz)^h/h!\cdot h!\to(nz)^h$ 粗放成几何级数：$(1+z)^n-1\le\sum_{h=1}^n(nz)^h\le\frac{nz}{1-nz}$。故 $0\le F/H-b^n\le b^n\frac{nz}{1-nz}=\frac{b^n n}{2u-1-n}\le\frac{cn}{2u-1-n}<1$（末步正是上面正性不等式的改写）。整数 $c\in[b^n,b^n+1)$，钉死 $c=b^n$。

存在性核验补步。给定 $b\ge2,n$，令 $c=b^n$、$u$ 按公式、$v=g(u)$ 取假设单折图之唯一见证。置 $F=y_{n+1}(bu)$、$H=y_{n+1}(u)$、$X=x_{n+1}(bu)$、$Y=x_{n+1}(u)$，Pell 方程由定义满足。同余式反向给整除：$F-n-1$ 被 $bu-1$ 整除且 $F\ge n+1$（eq:pell-index-lower $y_{n+1}(a)\ge n+1$），商 $q$ 非负；$q'$ 同理。商误差同上得 $0\le F/H-c<1$，故 $r=F-cH\in\mathbb N\cap[0,H)$。截断核验：$\log u\ge\ell\log c=\ell n\log b\ge\ell n\log2$（$n=0$ 时 $\log u\ge0$ 无信息，另走显式情形 $c=1,F=H=1$，$v\ge W_0=1$ 方向由 $\log v>\delta(\log u)^2\ge0\ge\log1$ 覆盖）；$b<u$、$2<u$ 给 $2bu<u^3$ 即 $\log(2bu)\le3\log u$；于是 $\log F\le n\log(2bu)\le\frac{\log u}{\ell\log2}\cdot3\log u=\frac3{\ell\log2}(\log u)^2<\delta(\log u)^2<\log v$，即 $F<v$；$H\le(2u)^n\le(2bu)^n$ 同理。松弛量与非严格不等式各按第 5 节约定自动补齐。

### 11.3 机械理由

$u$ 公式是整节的枢轴，拆成四个功能件。$(c+1)^\ell$ 供两处：把 $\log v$ 拉高到盖过 $\log F\sim n\log(bu)$（"平方赢线性"：$\log u\sim\ell n\log b$，于是 $(\log u)^2\sim\ell^2n^2(\log b)^2$ 二次压一次），以及供商误差余量 $u\ge(c+1)(n+1)+4$（只需一次幂，$\ell$ 的更强要求只出现在截断核验）。$(n+1)$ 保证钉标区间条件 $n+1<u-1$。$(b+1)$ 保证 $b<u$（$\log(2bu)\le3\log u$ 与区间 $u-1<bu-1$ 同吃一件）。$+u_0$ 保证 $u\ge u_0$ 使增长界可用、且 $u\ge4$ 使 eq:pell-index-cutoff 可用。删任一件，11.2 的某条不等式在退化输入（$n=0$、$b=2$、小 $c$）处跌破，我逐件试过。

$\ell$ 必须固定：$\ell$ 若依赖输入，$u=(c+1)^\ell\cdots$ 不是多项式，系统整体不是 Diophantine（power.tex:142 已点名）。$\ell>3/(\delta\log2)$ 的数值由链条 $\frac3{\ell\log2}<\delta$ 反解，3 来自 $u^3>2bu$，2 来自 $b\ge2$。

无须单调性（power.tex:92-94 逐字："no monotonicity hypothesis on the growth function is needed"）：锁定链只用逐点界，$g$ 的内部单调性服务于 $g$ 自身良定义，不外借；接口只暴露 $\delta,u_0$。这是标题所谓互定义性的工程形态：幂由增长函数造，增长函数由椭圆曲线高度造，椭圆曲线对幂一无所知。

$b\ge2$ 双重职能：排除 $b=0,1$ 的解族污染（$c=0^0$、$1^n$ 都无唯一 $c$ 可言），并保证两 Pell 盘参数 $bu\ge2u>u\ge2$ 分离与 $D$ 非平方。Lean 侧 `Power.lean:299` theorem power 的陈述 `SF (fun z : Fin 3 => 2 ≤ z 0 ∧ z 2 = z 0 ^ z 1)` 与此逐字对齐，第 18 节对表。

完整见证账目：每调用一次 $v=g(u)$ 就引入整个内部元组 $\xi$（第 9 节的点码、加链、比较松弛量），witness-ledger.tex:74-86 把幂调用内部写成十一元组 $(u,v,X,Y,F,H,q,q',r,\sigma_b,\sigma_F,\sigma_{Fv},\sigma_H,\sigma_{Hv},\sigma_r,\xi)$（含六松弛量），"No sign variable accompanies the natural square roots $X,Y$; no Pell index is quantified"（witness-ledger.tex:85-86）正是本节唯一性段的账本化。

### 11.4 候选失败路线

- [推测] 路线一：让 $u$ 自由存在化。同一 $(b,n,c)$ 有无穷多合格 $u$，见证立刻无穷；power.tex:117-118 "without introducing a free scale" 点名的就是它。把 $u$ 定为 $(b,c,n)$ 的多项式同时保住存在与唯一，代价是 $\ell$ 按最坏截断固定。
- [推测] 路线二：单 Pell 盘加整除链读 $b^n$。需要 $\gcd$ 或 Bézout 见证族，第 7 节已封杀自由互素见证；且单盘没有比值结构，$b^n$ 的两侧界无处着床。两盘 $y_{n+1}(bu)/y_{n+1}(u)$ 把 $n$ 的读取全部转给"区间 + 剩余类"初等锁定，见证只剩商余松弛量。
- [推测] 路线三：把 $g$ 的下界换成 $u^k$ 多项式型。钉标与商误差两端仍可，但截断核验里 $\log F\sim n\log(bu)$ 与 $\log v\sim k\log u\sim k\ell n\log b$ 同阶，比较需要 $k>$ 依赖于 $b,u$ 的比值，不再是统一常数；$(\log u)^2$ 对 $n\log(bu)$ 是渐近碾压，多项式对数是同阶缠斗。[推测] 下界形状 $(\log u)^2$ 由这夹逼唯一决定，第 8 节恰好给出这个形状不是巧合，是必然。

## 12 二进制位包含关系（prop:subset）

### 12.1 逐字引用

记号（power.tex:285-292）："For $x,y\in\mathbb N$, write $x\preccurlyeq y$ if every binary digit equal to one in $x$ is also equal to one in $y$... then $x\preccurlyeq y$ means $x_i\le y_i$ for every $i$. In particular, $x\preccurlyeq y$ implies $x\le y$."

命题（power.tex:304-307）："The relation $x\preccurlyeq y$ on $\mathbb N^2$ has a complete single-fold Diophantine representation."

系统（power.tex:310-319）："Require $x\le y$ and use three calls to Proposition~\ref{prop:power} to specify \[ B=2^{y+1},\qquad H=B^x,\qquad N=(B+1)^y. \] All three bases are at least two. Introduce natural variables $s,d,r,t$ and impose \[ N=sBH+dH+r,\qquad d<B,\qquad r<H,\qquad d=2t+1. \]"

无进位论证（power.tex:325-333）："Every coefficient is at most $\sum_{j=0}^y\binom yj=2^y<B$, so this is the base-$B$ expansion of $N$ without carries. As $H=B^x$ and $0\le x\le y$, the digit $d$ extracted in \eqref{eq:subset-digit} is therefore $\binom yx$."

奇偶判别（power.tex:334-347）："Repeated squaring gives $(1+Z)^{2^i}=1+Z^{2^i}$, and hence $(1+Z)^y=\prod_{i:\,y_i=1}(1+Z^{2^i})$ in $\mathbb F_2[Z]$. Each monomial in the product is obtained by choosing some of the positions where $y_i=1$. Uniqueness of binary expansion ensures that distinct choices have distinct exponents. The coefficient of $Z^x$ is thus one precisely when $x\preccurlyeq y$. Equivalently, $\binom yx$ is odd precisely in that case. The final equation $d=2t+1$... proves the required equivalence."

退化核对（power.tex:356-359）："The case $x=y=0$ causes no exception: it gives $B=2,\quad H=N=1,\quad s=r=t=0,\quad d=1$."

### 12.2 推导补全

双重除法的唯一分解：先 $N$ 除 $H$：$N=(sB+d)H+r$、$r<H$，欧几里得除法确定商 $Q_1=sB+d$ 与余 $r$；再 $Q_1$ 除 $B$：确定 $s$ 与 $d$。方程 $N=sBH+dH+r$ 配 $d<B,r<H$ 恰是这两步带余除法的合并书写，给定 $(B,H,N)$ 时 $(s,d,r)$ 唯一（power.tex:320-323 的论证即此）。$d=2t+1$ 是奇偶测试，$t=(d-1)/2$ 由 $d$ 唯一确定。

被提取数字的身份：二项式定理 $N=(B+1)^y=\sum_{j=0}^y\binom yjB^j$。每个系数 $\binom yj\le2^y<B$，所以按 $B$ 进制展开时各位不互相进位，第 $x$ 位数字是 $\binom yx$；$H=B^x$、$x\le y$ 保证 $\lfloor N/H\rfloor\bmod B$ 正好落在第 $x$ 块上。

Lucas 定理模 2 的自包含证明：$\mathbb F_2$ 中 Frobenius 给出 $(1+Z)^{2^i}=1+Z^{2^i}$（二项系数 $\binom{2^i}{h}$ 对 $0<h<2^i$ 皆偶，可由 $v_2$ 估值或迭代 $i$ 次平方验证）；把 $y=\sum_i y_i2^i$ 代入 $(1+Z)^y=\prod_i(1+Z^{2^i})^{y_i}$，展开时每个单项对应"从 $y$ 的 1-位集合中选一个子集"，指数为该子集的二进制和；二进制展开唯一性使不同子集给不同指数，故 $Z^x$ 系数为 1 当且仅当 $x$ 的 1-位包含于 $y$ 的 1-位集合，当且仅当 $\binom yx$ 为奇。

双向闭合：真包含时 $x\le y$ 自动（$x\preccurlyeq y\Rightarrow x\le y$，power.tex:292 点名），三次幂调用按 prop:power 有唯一完整见证，提取位为奇，系统可解；系统可解时提取位 $d=\binom yx$ 为奇，Lucas 反向给出 $x\preccurlyeq y$。若 $x>y$，前置守卫已排除；我另核了守卫冗余度：即便删 $x\le y$，$H=B^x\ge B^{y+1}>N$ 使商 $sB+d=0$、$d=0$，与 $d=2t+1$ 矛盾，系统仍无解；守卫的作用是让"提取的是真数字"这句证明语言成立，并顺带贡献一个必含松弛量 $\sigma_{xy}$ 进账本（witness-ledger.tex:95）。

### 12.3 机械理由

基数取 $2^{y+1}$ 的机械理由：无进位需要每系数 $<B$，系数和恰 $2^y$，所以 $B>2^y$ 充分；$B$ 又必须是幂调用认可的基数（$\ge2$）。$y=0$ 时 $\lvert$候选 $2^y=1$ 不合法，$2^{y+1}=2$ 是同时满足两条件的最小 2-幂。选 2 的幂还有一层下游原因：机器层需要 $B=4b$、块宽 $w$ 与二进制位对齐（computation.tex:135 的 $\operatorname{Pow}(2,w,B)$），$B=2^{y+1}$ 形态的调用天然给出 $w=y+1$ 的读取通道。

三次幂调用全部保留完整内部见证（power.tex:302-303 逐字："retain all witnesses of the three power calls and two divisions"），因为 $x\preccurlyeq y$ 在下游被调用 $s+3\tau+r+1$ 次（witness-ledger.tex:125），每一次的膨胀都直接进入 m 的账；若允许"复用"同一幂见证，复合引理（第 5 节"separate auxiliary tuples for distinct calls"）立刻不适用。

与文献的对接：大基数提二项系数归于 Julia Robinson 1952 第 5 节，二项奇偶归于 Lucas 1878（power.tex:296-300 逐一给引），组合即 Jones--Matiyasevich 位掩码法。[推测] 作者重证 Lucas 片段（，并非引用）的动机是让"系数为奇 ⟺ 位包含"在 Lean 里可查：`Binary.lean` 199 行独立成簇，说明这层在形式化中是单独模块。

### 12.4 候选失败路线

- [推测] 路线一：逐位量化比较 $x_i\le y_i$。位的个数随 $\log y$ 增长，展开成有限多项式系统需要把"对每一位"内化为单一方程，逐位方案把无限合取写进定义，超出 Diophantine 语法的有限系统条款。
- [推测] 路线二：基数取 $B=2^y$ 省一幂。$y=0$ 时基数 1，$\operatorname{Pow}(1,0,H)$ 型调用基数条件 $b\ge2$ 违反，prop:power 不适用；修补需要单列情形 $y=0$，又要门控与清零，见证预算反而恶化。文中把 $x=y=0$ 显式算出四元组正是拒绝这类"顺手省"的姿态。
- [推测] 路线三：用 $\binom yx$ 的整除性（如模 $2^k$）替代奇偶。更高模的剩余读法要额外的带余见证链，而奇偶只需一个 $t=(d-1)/2$，是位判定里松弛量最省的写法；且 Lucas 模 2 的证明只迭代 $i$ 次 Frobenius，无中国剩余定理式互素见证。

## 13 计数器机器：通用性与编译（computation.tex）

### 13.1 逐字引用

机器模型（computation.tex:19-33）："A counter machine has a finite set of states, a distinguished initial state $q_*$, a distinguished halt state $h$, and finitely many counters with values in $\mathbb N$. Every state other than $h$ has exactly one instruction of one of the following forms: INC(j)... TESTDEC(j)..."；"The other counters remain unchanged. The halt state has no instruction. Thus every configuration outside $h$ has exactly one successor. Time counts individual instructions, including those used to implement a subroutine."

引理 lem:counter-universality（computation.tex:41-46）："Let $n\geq 1$ and let $S\subseteq\mathbb N^n$ be recursively enumerable. There is a counter machine that, when its first $n$ counters are initialized to $a_1,\ldots,a_n$ and its remaining counters to zero, reaches its halt state if and only if $\mathbf a\in S$."证明要点（computation.tex:48-92）：一元带词 $1^{a_1}\#\cdots1^{a_n}\#$；"Any rejecting terminal behavior can be replaced by an infinite loop, so only acceptance halts."；带子存为左右两栈，"stored as $\sum_{i<m}e_iD^i$. The empty stack is zero."，$D=q+1$；压栈用"increment the initially zero scratch counter exactly $D$ times"；退栈把商余分散到控制与草计数；"A zero test on the counter that is always zero implements an unconditional jump."；"duplicating these states supplies its finitely many required return destinations."

常数 C 与弧集（computation.tex:94-113）："$C=1+s+\sum_{j=1}^r d_j$"；"The symbol $C$ denotes this expression, not an additional choice."；"At time $t$ in any run, counter $j$ has value at most $d_j+t<C+t$, since an instruction increases a counter by at most one. A clock with value $C+t$ will therefore give a common bound for the counter values."；"Let $\mathcal A$ be this finite set of arcs... The halt state has no outgoing arc, and $|\mathcal A|\leq 2s$."

命题 prop:machine-compiler（computation.tex:117-125）："There is a finite system of integer polynomial equations in $a\in\mathbb N^n$ and natural auxiliary variables such that, for every input $a$, the complete auxiliary tuple has exactly one solution when the initialized machine halts, and no solution when it does not halt."

基与几何级数（computation.tex:133-145）："$\operatorname{Pow}(2,w,B),\qquad B=4b,\qquad B>2C,\qquad k>0,\qquad\operatorname{Pow}(B,k,H)$"；"$BJ=H,\qquad (B-1)M=H-1$"；These equations force "$B=2^w,\qquad J=B^{k-1},\qquad M=\sum_{t=0}^{k-1}B^t$"。

状态与分支掩码（computation.tex:151-171）："$I_q\preccurlyeq M,\qquad \sum_q I_q=M$"；"$Z_q\preccurlyeq I_q,\qquad N_q\preccurlyeq I_q,\qquad Z_q+N_q=I_q,\qquad Z_q+V_q=M$"；弧表达式 "$E_a$ to be $I_q$ for an increment arc from $q$, and $Z_q$ or $N_q$ for the corresponding arc from a test state"；转移 "$I_q=\mathbf 1_{q=q_*}+B\sum_{a:\operatorname{dest}(a)=q}E_a$"。

计数器与时钟（computation.tex:173-204）："$R_j\preccurlyeq (2b-1)M,\qquad R_j=\rho_jJ+\eta_j,\qquad\eta_j<J$"；"$R_j=d_j+B\left(R_j-\rho_jJ+\sum_{a\in\mathcal A_j^+}E_a-\sum_{a\in\mathcal A_j^-}E_a\right)$"；零测试 "$R_j\preccurlyeq (B-1)V_q$"；时钟 "$R_0=C+B(R_0-\rho_0J+M-J)$"，尺度 "$b\leq\rho_0,\qquad 2\rho_0<B$"。

证明核心段：无进位（computation.tex:216-219）"The sum in \eqref{eq:machine-state-partition} has at most $s<B$ in each digit, so it has no carries. Thus exactly one state is present at each time."；停机掩码（computation.tex:229-236）"$M=1+B(M-I_h),\qquad BI_h=1+(B-1)M=H=BJ$. Thus $I_h=J$: the halt state occurs precisely at time $k-1$"；带符号系数（computation.tex:252-269）"An integer sum $\sum_{t=0}^{k-1}c_tB^t=0$ with $|c_t|<B$ has every $c_t=0$: reduce modulo $B$, use that the only multiple of $B$ in $(-B,B)$ is zero, divide by $B$, and repeat... This argument rules out borrowing as well as carrying."；时钟读数（computation.tex:286-289）"$\rho_0=C+k-1$"；唯一尺度（computation.tex:295-302）"$2(C+T)<B\leq4(C+T)$. For every positive integer $L$, the interval $(2L,4L]$ contains exactly one power of two: take the smallest power strictly greater than $2L$, whose predecessor is at most $2L$. Its successor exceeds $4L$."；端点情形（computation.tex:325-326）"This also handles $T=0$: then $q_*=h$, $k=1$, $J=M=1$, all arc masks vanish, and every update sum is empty."

### 13.2 推导补全

几何推论：$\operatorname{Pow}(2,w,B)$ 按定义给 $B=2^w$ 且该幂调用的内部见证唯一；$BJ=H$ 与 $H=B^k$（来自 $\operatorname{Pow}(B,k,H)$）在整环里消去 $B$ 得 $J=B^{k-1}$；$(B-1)M=H-1=B^k-1=(B-1)\sum_{t=0}^{k-1}B^t$ 消去 $B-1$ 得 $M=\sum_{t<k}B^t$。$M$ 的每个块恰在最低位为 1，这是后面一切"块"语言的本体论根据。

状态块唯一化：$I_q\preccurlyeq M$ 经第 12 节意味着 $I_q$ 的每个 $B$-块值是 0 或 1（只许落在 $M$ 的 1-位即各块最低位），且块外无位。逐块求和 $\sum_q I_q$ 的块值不超过状态数 $s$；$B>2C\ge2(1+s)>s$ 使该和无进位，于是它等于 $M$ 当且仅当每块恰有一个 $q$ 取 1：每个时刻恰一个状态。

分支分割：$Z_q\preccurlyeq I_q$ 与 $N_q\preccurlyeq I_q$ 说两个分支掩码只在 $q$ 发生的时刻取块位；$Z_q+N_q=I_q$ 每块求和 $\le1$ 无进位，逼出该时刻两分支恰选一。$V_q$ 由 $Z_q+V_q=M$ 定义式确定：零分支时刻块为 0，其余时刻块为 1，逐位互补。

状态转移的逐块语义：右端 $B\sum_{\mathrm{dest}(a)=q}E_a$ 把时刻 $t$ 的选中弧掩码整体左移一块；块和上界 $\lvert\mathcal A\rvert\le2s<B$ 再保无进位。$t=0$ 块由 $\mathbf 1_{q=q_*}$ 给定初态，$t\ge1$ 块给出"时刻 $t-1$ 选中弧的终点是 $q$"。逐块读该方程即机器转移表的多项式转写。

停机掩码恒等式推导：每个非停机时刻恰选一弧、停机时刻无弧，故 $\sum_{a\in\mathcal A}E_a=M-I_h$（右端逐块：非停机时刻 1、停机时刻 0；等式成立本身依赖"至多一弧"已由分支分割证明）。对状态方程求和 $\sum_q$：左端 $=M$，右端 $=1+B\sum_a E_a=1+B(M-I_h)$。整理 $BI_h=1+(B-1)M$；由几何式 $(B-1)M=H-1$ 得 $BI_h=H$；又 $BJ=H$，消去 $B$ 得 $I_h=J$。$J=B^{k-1}$ 的 1-位在最后一块，$I_h\preccurlyeq M$ 排除其他位，故停机当且仅当在时刻 $k-1$：早停与"停机后垫圈"都被方程本身排除，这一步不需要任何额外不等式。

计数器逐块恢复：掩码 $(2b-1)M$ 允许每块低 $w-1$ 位（$2b-1=B/2-1=2^{w-1}-1$ 的二进制恰是低 $w-1$ 位全 1），故 $R_j=\sum_t r_{j,t}B^t$、$0\le r_{j,t}\le B/2-1$ 唯一。除以 $J=B^{k-1}$：$R_j=\rho_jJ+\eta_j$、$\eta_j<J$ 给出 $\rho_j=r_{j,k-1}$（末块值）与 $\eta_j$（前 $k-1$ 块值）。更新方程两端同减 $R_j$，把 $B(\cdots)$ 展开为带符号的 $\sum_tc_tB^t$：$c_0=r_{j,0}-d_j$，$1\le t\le k-1$ 时 $c_t=r_{j,t}-r_{j,t-1}-a_{j,t-1}+f_{j,t-1}$（$a,f$ 为该时刻选中加/减弧的 0-1 指标，互斥），高次项不存在因末块已被 $-\rho_jJ$ 剥掉且末时刻无选中弧。界核验：$\lvert c_0\rvert<B$（$d_j\le\sum_jd_j<C<B/2$ 且 $r<B/2$，差在 $(-B/2,B/2)$）；$\lvert c_t\rvert\le(B/2-1)+1=B/2<B$（文中说 "at most $B/2$"，我用 $a,f$ 互斥把 $\lvert-a+f\rvert\le1$ 用足）。带符号零和 + $\lvert c_t\rvert<B$ 的逐位归零论证（模 $B$、取唯一 $(-B,B)$ 内倍数 0、除 $B$、归纳）同时排除进位与借位，得 $r_{j,0}=d_j$、$r_{j,t+1}=r_{j,t}+a_{j,t}-f_{j,t}$。

零测试闭合：$q$ 为零分支选中时刻时 $V_q$ 块为 0，$(B-1)V_q$ 该块整块 0，$R_j\preccurlyeq(B-1)V_q$ 迫使 $r_{j,t}=0$；递减分支时刻由逐块更新 $r_{j,t+1}=r_{j,t}-1\ge0$ 反推 $r_{j,t}\ge1$。TESTDEC 语义双向吻合。

时钟逐块：$R_0=C+B(R_0-\rho_0J+M-J)$，$M-J$ 逐块为前 $k-1$ 时刻的 1；同前逐位归零：$r_{0,0}=C$、$r_{0,t+1}=r_{0,t}+1$（$t\le k-2$），故 $r_{0,t}=C+t$、$\rho_0=r_{0,k-1}=C+k-1$。结合停机分析 $k-1=T$（真实停机指令数，因逐块方程已证编码串就是确定性真实运行），尺度条件 $b\le\rho_0$ 即 $B/4\le C+T$、$2\rho_0<B$ 即 $2(C+T)<B$，合成 $B\in(2L,4L]$，$L=C+T$。区间含恰一个 2 的幂：取 $>2L$ 的最小 2 幂 $B$，其前驱 $B/2\le2L$ 给 $B\le4L$，后继 $2B>4L$；端点 $2L$ 本身为 2 幂时 $B=4L$ 仍在区间且唯一（文中 "including when an endpoint is a power of two" 专核此处）。

存在性方向补步：真停机 run 定 $k=T+1$ 与唯一 $B$；$C\ge2$ 给 $2L\ge4$、$B\ge8$，故 $4\mid B$、$b=B/4$ 整、$w=\log_2B$ 整；块值界 $r_{j,t}\le d_j+t\le\sum_jd_j+T<C+T=L<B/2$ 与时钟值 $C+t\le L<B/2$ 全在掩码容量内，于是各 $R_j,R_0$ 由真实数字拼装；状态/分支掩码由真实 run 拼装；每个 $\operatorname{Pow}$ 与 $\preccurlyeq$ 调用对拼装参数为真命题，自动携带唯一内部见证。$T=0$ 时 $q_*=h$、$k=1$、$J=M=1$，所有弧掩码为 0，状态和方程 $M=1+B(M-I_h)$ 给出 $1=1+B(1-I_h)$ 即 $I_h=1=J$，各更新和为空，逐式核验通过（computation.tex:325-326）。

唯一性方向：真实 run 定 $T$、定每时刻状态/分支/计数值，故定 $k$；$k$ 经唯一尺度定 $B$；$B$ 定 $w,b,H,J,M$（幂调用的指数唯一性在此汇合）；run 定全部 $I_q,Z_q,N_q,R_j,R_0$；$V_q=M-Z_q$；带余除法定各 $\rho_j,\eta_j$；展示变量之外的一切（引用自变量的命名变量、松弛量、每次 $\operatorname{Pow}/\preccurlyeq$ 调用的内部元组含不活跃分支清零变量）由 prop:power、prop:subset 与第 5 节约定逐层锁定。

### 13.3 机械理由

时钟为何必须 $(2L,4L]$ 半开：只给 $2\rho_0<B$ 时同一 run 在任何更大的 2 幂基下都可重编码（块值上界随 $B/2$ 放宽），见证无穷；补上 $B\le4L$ 后基数区间恰含一个 2 幂。半开区间的两侧分别来自两条不等式，$b\le\rho_0$ 给 $\le4L$、$2\rho_0<B$ 给 $>2L$，端点归属与不等号的严格性逐一对应（"$\rho_0-b$" 松弛非负、"$B-2\rho_0-1$" 松弛严格，witness-ledger.tex:109-113 的清单坐实）。dyadic 区间与 2 幂之比 2 的结构是"恰一个"的组合根源；换成 $(L,4L]$ 就有两个幂。

顶位保留的机械理由：转移方程右端含减法（$-\sum E_a$），是带符号和；逐块数字 $\le B/2-1$ 把每个系数压进 $(-B,B)$，模 $B$ 归零论证才成立。若用满掩码 $(B-1)M$，块值可到 $B-1$，减法系数可达 $\pm(B-1)$ 邻域而借位链（如 $1\cdot B^t-1\cdot B^{t-1}\cdot B$ 型 telescoping）产生伪解，编码串不再唯一解码真实 run。computation.tex:175-176 的预告句 "Reserving the top bit will let the decoding proof exclude signed carries in the counter updates, which include subtraction" 是设计先行的直接证据。

确定性条款的位置：模型段"exactly one successor"（computation.tex:32-33）+ 引理证明里拒绝行为改无限循环（computation.tex:51-52）。编译正确性方向上，解码得到的字符串被证明就是那条唯一后继链；若允许多接受路径，见证数等于接受路径数，定理的 1 立刻变 $\ge2$。

$C$ 不用新变量的理由：它是 $1+s+\sum_jd_j$ 的缩写，展示输入已含 $d_j$（输入坐标或 0）；引入变量反而要锁它的唯一性（witness-ledger.tex:128 重申 "introduces no variable"）。

$r$ 个计数器 + 1 个时钟计数器的统一处理：Lean 与 witness-ledger 都用 $0\le j\le r$ 指标（$R_0$ 即时钟），零测试 $R_{j(q)}\preccurlyeq D_q$ 的 $j(q)$ 表测试状态到计数器的映射。[推测] 把时钟并入计数器族是为了让掩码与逐块方程复用同一模板，节省一个平行的变量族。

本节无数域与秩假设：纯算术；秩与挠的假设全部沉淀在 $g$ 的 $\delta,u_0$ 接口里，经第 11 节间接消费。这一点支撑了我对"互定义性"标题的读法：椭圆曲线一侧给增长，增长给幂，幂给位掩码，位掩码给计算，反向没有任何依赖回路。

### 13.4 候选失败路线

- [推测] 路线一：沿用 Jones--Matiyasevich 的原式（基 $B$ 为一个大常数或存在量化）。同一 run 在任何足够大的 2 幂基下有合法重编码，块宽度 $w$ 自由即见证族无穷；时钟 + 二进区间的功能就是把"基的选择"内化为 run 长度的单值函数。我的初版编码正是栽在"基自由"上，这一节等于对该错误的定点修复。
- [推测] 路线二：用中国剩余定理把每个时刻的配置打包进单一大整数的不同素数幂位。模数（素数幂）本身成为存在数据，互素见证族不唯一；且移位/窗口操作在 CRT 坐标下没有多项式表达，块移位 $B$ 乘法的干净线性结构是位掩码法的核心红利。
- [推测] 路线三：允许停机状态有出弧、run 记录到 $k>T$ 后继续垫圈。停机掩码恒等式 $I_h=J$ 依赖"停机时刻无弧"（$\sum_aE_a=M-I_h$）；一旦停机后可转移，恒等式右端多计弧，$k$ 与 $T$ 解耦，同一 run 有任意长记录，尺度区间随之漂移，见证再次无穷。文中"This also excludes earlier halts and padded records"正是点掉这两种作弊记录。

## 14 主定理组装与带承诺不可判定性推论

### 14.1 逐字引用

组装（computation.tex:347-358）："Given the recursively enumerable set $S\subseteq\mathbb N^n$, choose the machine of Lemma~\ref{lem:counter-universality} and apply Proposition~\ref{prop:machine-compiler}. Expand each call to a single-fold relation into its finite polynomial system, using fresh auxiliary variables, and expand all inequalities and disjoint cases according to Section~\ref{sec:conventions}. The number of equations and variables is finite: the machine is fixed, its state and counter sets are finite, and each relation call has a fixed finite definition. The time parameter $k$ is one natural variable; the digit expansions used in the proof introduce no additional variables indexed by its value."

落成多项式（computation.tex:360-371）："$F_1(\mathbf a,\mathbf z)=\cdots=F_N(\mathbf a,\mathbf z)=0$"、"$P(\mathbf a,\mathbf z)=\sum_{i=1}^N F_i(\mathbf a,\mathbf z)^2$"、"On natural tuples, $P=0$ is equivalent to the simultaneous vanishing of all $F_i$. This operation introduces no variables and preserves the solution set exactly."

推论证明（consequences.tex:11-33 核心句）："Fix a nonrecursive recursively enumerable set $S\subseteq\mathbb N$."；"Choose one such $P$, put $D=\max\{1,\deg P\}$"；"Substitution is computable from the finite coefficient encoding of $P$ and $a$. Although the proof does not numerically specify $P$, the finite code of this one fixed polynomial can be hard-coded into a Turing machine."；"A hypothetical algorithm with the stated property, applied to $F_a$, would therefore decide membership in $S$, a contradiction."；"Every constructed input satisfies the promise, so the algorithm's behavior outside it is irrelevant."

划界（consequences.tex:35-40）："The bounds in Corollary~\ref{cor:unique-h10} are existential... The coefficients of $F_a$, and therefore their input bit lengths, may grow with $a$. The promise permits both zero and one complete solution; it is not an exactly-one promise. The corollary makes no claim about analogous uniqueness promises for solutions over $\mathbb Z$ or $\mathbb Q$."

### 14.2 推导补全

主定理：给定 $S$，引理 10.1 的通用机器（lem:counter-universality）给出以 $S$ 为停机集的确定机；命题 prop:machine-compiler 给有限系统；展开即 $F_i(\mathbf a,\mathbf z)=0$ 的列表，$\mathbf z$ 汇总全部辅助坐标（含嵌套的幂与位包含调用、$g$ 调用、有理/点算术、门控选择子、松弛量）。平方和归并在 $\mathbb N$ 上等价（第 5 节已核），得单一 $P$。$S$ 成员恰一个 $\mathbf z$、非成员零个，即 $\#\{w\}=1$ 或 $0$，逐字兑现 thm:main 的基数分段式。

推论：取 r.e. 非递归 $S\subseteq\mathbb N$（例如停机问题的一元编码集）；对 $n=1$ 用主定理得固定 $m,P$；对每个 $a$ 特化 $F_a(\mathbf W)=P(a,\mathbf W)$。三件核验：其一，$F_a$ 变量数恰 $m$、总次数 $\le\max\{1,\deg P\}=D$（特化把 $\mathbf a$ 变量折进系数，不改 $\mathbf W$ 的次数）。其二，承诺成立：单折性给 $\#\{w:F_a(w)=0\}\le1$。其三，$a\mapsto F_a$ 可计算：$P$ 的有限系数表硬编码进图灵机，代入 $a$ 只做整数算术，输出 $F_a$ 的系数编码。若存在所承诺的判决算法 $A$，则复合机 $a\mapsto A(F_a)$ 判定 $S$，与 $S$ 非递归矛盾。

### 14.3 机械理由

为什么 $n=1$ 特化：单参数族 $F_a$ 是判决问题的输入语法，定理的 $n$ 元版本降一元靠的就是"把其余输入折进系数"，这要求原表示只有一个自由展示参数；$S$ 的 r.e. 非递归性在一元集合上可得（标准停机集的一元化）。

为什么承诺取 $\le1$：归约构造出的族每点都满足承诺，算法无需处理违例输入；而"恰 1"承诺无法覆盖 $a\notin S$ 的零解实例，除非另有把零解垫成恰一解的可计算手法（那要求判定成员性，循环）。consequences.tex:38-39 明说 "it is not an exactly-one promise"。

存在性界 $m,D$ 的理由：主定理对固定 $S$ 只断言存在 $m,P$，不给出数值（main.tex:117-121 的立场在推论层的镜像）；但归约只需"这一个固定 $P$ 的系数表可以硬编码"，不需要会构造它。我在这一点上停留较久：论文反复声明非数值性，而推论的成立恰恰只依赖非构造存在（固定对象存在即可硬编码），两者是同一枚硬币。

系数位长随 $a$ 增长（consequences.tex:37-38）：这是承诺问题与"输入规模"讨论之间作者主动划掉的线；若想要系数长度线性界型的精细版本，需要 $P$ 的显式构造与高度常数的数值化，超出本篇能力。

### 14.4 候选失败路线

- [推测] 路线一：证明"$S\mapsto P$ 可计算"的加强版以把推论升级为显式界。断在数值层：$m_*,\kappa$ 需要 $\widehat h(P)$ 与 $c_E$ 的数值比较（第 8 节两个不等式都是实数比较），机器的停机时间、$\ell$ 的选取又依赖 $\delta$；原则上全链可计算（$(-4,6)$ 显式、下降有限可查），但篇中拒绝承诺任何数值程序，把可计算性叙事整体让位给存在性叙事。
- [推测] 路线二：把主定理的 $n\ge1$ 放开到 $n=0$ 再做推论。$n=0$ 时 $S$ 二选一，单折表示平凡存在，反而需要 $m\ge1$ 的哑变量约定统一处理；推论的归约用一元集合，无须 $n=0$，作者直接排除省一个分支。
- [推测] 路线三：试图在 $\mathbb Z$ 上陈述同型推论。第 5 节全部约定（松弛量、区间锁定、带余除法）建立在 $\mathbb N$ 的良序与正性上；$\mathbb Z$ 上的单位群（$\pm1$）给每个解配符号双胞胎，恰一见证立刻变两见证；consequences.tex:39-40 的划界句是对该失败的官方承认。

## 15 见证台账附录：完整元组到底数了哪些坐标（app:witnesses）

### 15.1 逐字引用

宗旨（witness-ledger.tex:3-8）："This appendix fixes one finite expansion of the systems used in the proof. Its purpose is to make explicit which coordinates the single-fold assertion counts. Each call has a fresh internal tuple. Its displayed output is counted by its caller, and its displayed inputs are already available. Equal-valued coordinates in distinct calls remain distinct variables."

原始约定（witness-ledger.tex:10-22）："A polynomial equality introduces no auxiliary variable. A weak comparison $F\ge G$ introduces the single slack $F-G$; a strict comparison $F>G$ introduces $F-G-1$... In particular, a zeroed inactive rational code has no ungated positive-denominator requirement."

加法的内部元组（witness-ledger.tex:28-32）："The internal addition tuple consists of seven selectors, four local six-coordinate slope codes (Cases 3, 4, 6, and 7), and the four strict comparison slacks in those cases. Other guards are equalities and require no further witnesses. Clearing denominators introduces no free multiplier."

倍乘链与高度（witness-ledger.tex:36-42）："Fix one addition chain for $[m_*]Q$ once and for all; for example, use $Q,2Q,\ldots,m_*Q$... The chain length is a fixed constant."

$\xi$ 块（witness-ledger.tex:51-72）：四个 itemize 块（$Q,R$ 码与代表测试、五邻点与 $[2]Q$ 码及五个加法元组与五个高度元组、两个邻值最大与 $L_0,D_0$、四松弛量 "u+W_1-h_Q,\ N_Q-u-W_1-1,\ \kappa D_0-L_0,\ \kappa L_0-D_0$"）加收尾 "Impose $v=h_R$. Here the already present internal coordinate $h_R$ and the displayed output $v$ are distinct variables fixed to the same value... The integer indices $k,r$ and the real quantities in the growth proof are not variables of this tuple."

幂元组（witness-ledger.tex:74-86）："$(u,v,X,Y,F,H,q,q',r,\sigma_b,\sigma_F,\sigma_{Fv},\sigma_H,\sigma_{Hv},\sigma_r,\xi)$"，六松弛量值 "b-2,\ F-1,\ v-F-1,\ H-1,\ v-H-1,\ H-r-1"；"No sign variable accompanies the natural square roots $X,Y$; no Pell index is quantified."

位包含元组（witness-ledger.tex:88-98）：$(e,A,B,H,N,s,d,r,t,\sigma_{xy},\sigma_d,\sigma_r)$ 加三次完整幂元组；松弛量 "y-x,B-d-1,H-r-1"；"These calls, including all of their growth tuples, remain present when $x=0$ or $y=0$."

计算元组（witness-ledger.tex:100-128）：展示坐标 $(w,B,b,k,H,J,M)$、$(I_q)_q$、$(Z_q,N_q,V_q)_{q\text{ test}}$、$(R_j,\rho_j,\eta_j)_{0\le j\le r}$；$r+5$ 个松弛量 "$B-2C-1,\ k-1,\ (J-\eta_j-1)_{0\le j\le r},\ \rho_0-b,\ B-2\rho_0-1$"；两个幂元组；$s+3\tau+r+1$ 次位包含元组；"Arc masks are expressions... introduce no variables. The expression $C=1+s+\sum_jd_j$ also introduces no variable."

总量条款（witness-ledger.tex:130-138）："Its length depends only on the fixed machine and fixed arithmetic constructions, not on an input or its halting time. Proof digits, configurations, and time indices are not extra coordinates... Replacing the resulting finite list of equations by its sum of squares introduces no coordinate and preserves exactly this complete tuple."

### 15.2 推导补全

我做一次逐层计数以确认"长度固定"不是修辞。加法元组：7 选择子（七情形各一）+ 4 个斜率码（情形 3、4、6、7 各 6 坐标）+ 4 严格比较松弛量 $=7+24+4=35$ 个内部坐标，外加被调用者计入的输出点码（1 标志 + 2 有理码 $=13$ 坐标）。有理码 6 坐标、点码 13 坐标是原子的。高度调用 $W(Q)$：倍乘链 $m_*-1$ 次加法（每条 35+13），一次最大（2 选择子 + 2 松弛量），输出 1 个整数。代表测试：$Q$ 自身高度 + 4 个 $Q+t$ 点码与 4 个加法元组 + 6 个比较松弛量。$\xi$：2 个代表测试 + 4 次邻点加法与 1 次 $[2]Q$ 及各自高度（共 5 加法 5 高度）+ 2 个最大 + 2 个乘积命名 + 4 松弛量。幂元组 17 项含一个 $\xi$。位包含元组 12 项含 3 个幂元组。机器层：展示变量 $7+s+3\tau+3(r+1)$，松弛量 $r+5$，2 个幂元组，$(s+3\tau+r+1)\times$ 位包含元组。所有系数只依赖 $(s,r,\tau,m_*)$，全是固定数。

复合引理（第 5 节）保证这一层层套叠在唯一性下封闭：每层的展示参数被上一层钉死后，本层内部元组是参数的单值函数；台账把"函数"展开成"方程组 + 唯一解"的语言，读者可以机械核对没有哪一层引用了未约束变量。

$v=h_R$ 双变量记账值得玩味：$h_R$ 已经在 $\xi$ 内部（$R$ 的高度输出），$v$ 是对外展示输出，二者以方程等同但计两个坐标。原因在约定段："Its displayed output is counted by its caller"，输出必须同时属于内部账（作为 $R$ 计算的副产物）与外部接口（作为幂调用可见的 $v$），合并成一个变量会破坏"每次调用自带新鲜元组"的语法。

不活跃码的分母问题：若某有理码在不活跃情形被清零，六元组全 0；此时若仍有未门控的 $d=1+t+s$，将读出 $0=1$，系统无解。所以门控必须覆盖包括分母正性在内的全部码方程（witness-ledger.tex:20-22），清零后的"码"只是 6 个哑 0，不再声称自己是有理数。这解释了第 7 节引理证明里"slope code 的既约方程与其余方程一同门控"的必要性。

### 15.3 机械理由

为什么需要整篇附录：主定理计数的是 $\#\{w\in\mathbb N^m\}$，$m$ 是展开后全部辅助变量的个数。任何"显然可以复用""显然同名同值"的口语都会改变 $m$ 与解集大小，从而改变定理内容；附录把选择固定为最保守的一种（新鲜元组、等值不并变量），并声明"one finite expansion"（第 3 行），意思是还有别的合法展开，本文选定其一。这与我第 2 节的教训同源：唯一性必须写成条款，不能写成气质。

为什么长度与输入无关：$k$ 是变量值不是变量个数；逐块数字 $r_{j,t}$、时刻、弧选择都只活在证明语义里，系统方程以掩码整数整体书写（$R_j$ 一个变量代表 $k$ 个时刻的计数器轨迹），这正是大基数编码的本钱。对照经典 DPRM 中"每时刻每变元一个存在量词"的做法，这里的存在量词个数与 run 长度完全解耦。

为什么位包含调用在 $x=0$ 或 $y=0$ 时全链保留（第 97-98 行）：退化情形若改走特判分支，分支选择子进入元组并可能不唯一（输入为 0 时两个分支的守卫边界）；保留全链让 $0$ 情形与一般情形共用同一方程文法，第 12 节 $x=y=0$ 的显式四元组核对就是该选择的兑现。

### 15.4 候选失败路线

- [推测] 路线一：对相同参数值的两次调用共享一份见证元组（"反正算出的东西一样"）。共享引入等式把两个新鲜元组绑成一份，唯一性表面无损，但复合引理的归纳语法（每次调用独立新鲜）被破坏：一旦共享，"完整元组由参数唯一决定"要重证，且共享图可能引入圈（循环依赖的参数等式），最坏时在门控清零规则下产生额外解。附录第 7 行"等值坐标保持不同变量"是对该优化的官方否决。
- [推测] 路线二：把 $m_*$ 倍乘链换成二进制幂链（square-and-multiply，约 $\log_2 m_*$ 次加法）。元组更短，但链形依赖于 $m_*$ 的二进制展开，$m_*$ 是存在常数、其二进制位不是展示数据；要形式化需把"选择哪条链"参数化，链选择本身成为见证自由度的来源。作者选最笨的线性链 "Q,2Q,\ldots,m_*Q"，用常数长度买断歧义。
- [推测] 路线三：让逐块数字 $r_{j,t}$ 进入系统（对 $t$ 的每个值放一个变量）。变量的个数变成 $k$ 的函数，$m$ 不再固定，定理陈述 $\exists m$ 的语法直接失效；这是大基数打包技术在本篇唯一性语境下不可替代的原因。

## 16 尝试过的错误路线与关键转折点（反推综合）

以下是我把四片 tex 拼成链条后重构的研究轨迹；凡属重构的心理叙事我都标 [推测]，凡有文本直接痕迹的我给出处。

第一阶段，我把问题理解成"给 DPRM 表示加归一化"。证据是第 2 节所述的最小化不可表达性；文本痕迹是 main.tex:216-224 一开篇就把不等式、符号、除法全部改写成"自带典范见证"的等式语法，以及 main.tex:268-269 点名封杀两类自由选择。两条线合起来读，作者的立场与我的初始猜想正面相撞：单折不是后置过滤器，是前置文法。

第二阶段，[推测] 我推测自己也走过 CCO 综述里的老路：成对 Pell 加"指数截断"。main.tex:94-97 明说 Cantone--Cuzziol--Omodeo 的配对 Pell 表示带着一个待替换的 exponential cutoff（"the problem of replacing its exponential cutoff"）。截断本身必须单折，否则截断见证污染唯一性；而用 Pell 序列造一个单折截断函数，等于先用幂关系造增长、再用增长造幂，循环。这是我认为本构造真正的发明点所在：截断的职责被剥离给一个只需两条对数界（$\delta(\log u)^2$ 与 $u\log u$）的黑盒 $g$，黑盒的实现从 Pell 世界整体迁移到椭圆曲线高度世界，循环被切断。power.tex:13-14 的接口句（"Our cutoff is supplied by the complete single-fold polynomial graph of Proposition~\ref{prop:growth}"）是这次迁移的官方盖章。

第三阶段的关键转折在"误差形状"的选择上。文本痕迹：elliptic.tex:189-197 刻意强调用 full rational x-height 且误差对全体有理点一致（$c_E$ 不依赖点），main.tex:101-104 逐字 "The bounded additive error makes the exact index selection below possible."。[推测] 我原先以为分母增长（Poonen 2002 的路数，main.tex:98-100）足以选标，写下来才发现 Poonen 的定义是极限意义（"eventually Diophantine"式的渐近条款在该文里以余有限集为代价），而单折要逐点精确；精确比较一个二次型整数指标，只有加性误差有界的解析工具能给出：乘性窗口的两侧各差一份误差，加性有界才使"真指标进窗、假指标出窗"用同一组常数闭合。这一点在 height-window-figure.tex 的图注里被画成几何事实：间隔 $2a_E$、误差半径 $6c_E$、窗高 $\log\kappa$ 的三重夹。

第四阶段，计算编码层的转折是"时钟"。[推测] 我的第一版打包让基 $B$ 由外部给定或存在量化；computation.tex:7-8 与 14-15 给出了对症的表述："a fixed computation admits many encodings if its block size is left free"、"Here a clock and a dyadic interval determine the base."。把 run 长度本身编码进一个逐块 +1 的辅助计数器，再用两条不等式把基夹进二进区间，是整篇里最"计算机科学"的一步：它本质上是把"输入规模参数"内化为"被模拟对象的运行时不变量"。Chaitin 的按输入定时选基（main.tex:110-112）是雏形，作者的改造是把"时间"做成了系统内的变量对 $(R_0,\rho_0)$，基的唯一性成为不等式的推论，并非外约。

第五阶段，唯一性的"簿记学"独立成附录。[推测] 这不是一夜领悟：main.tex:227-230 引 mati1974 Sections 3.1-3.3 与 cco2024 第 2 节 590-591 页来说明"闭合算子要保持唯一性需要显式条款"，说明前人已在同一坑边立过牌；作者的推进是把它升级为全篇通用的会计制度（witness-ledger 整节），连"等值不并变量""不活跃码免分母正性"这种边角科目都入账。我把它读作对 Lean 形式的预案：`Model.lean` 的 `Represents` 定义（逐字：`∀ w v, evalNat P a w = 0 → evalNat P a v = 0 → w = v`）把"完整元组相等"写成一阶语句，任何口语化的"显然唯一"都过不了这一关，附录是纸面上先跑一遍的机器。

## 17 最终思路与最初设想的差异

差异一，对象的错位。我以为最终产物会是某个显式多项式族（给定机器能写出系数）；成品是纯存在陈述（main.tex:117-121）：常数"存在被证明、数值不指定"。构造性只到"文法与闭合规则"层，数值层主动弃权。

差异二，工具的反转。我最初把椭圆曲线当作数论深度的装饰，把 Pell 当作主力；成品里 Pell 只承担初等数论的三个引理性职能（双射、同余、双侧界），全部"解析深度"由一条具体的秩一曲线 $y^2=x^3-25x$ 及其 N\'eron--Tate 高度提供。[推测] 选有理 2-挠的曲线，是因为挠平移给了"每绝对指标一个代表点"一个纯代数（四次比较）的实现；若曲线无挠，代表选取要引入序与符号见证，预算翻倍。

差异三，增长函数的地位。最初设想里"介于幂与 $u^u$ 之间的单折函数"是权宜脚手架；成品中它是全篇唯一对外接口（prop:power 只吃它的增长界），曲线、下降、高度全部封在接口之下。这让论文有了一张"模块化图纸"的形态：elliptic/power/computation 三片 tex 恰好是接口三层。

差异四，我对"单折"的量化理解变了。最初我以为难度在"唯一"；成品教会我难点其实在"完整"：所有辅助变量都计入见证元组，使得每个便利措施（自由基数、自由截断、自由互素见证、未激活分支的哑变量）都要先用唯一性赎买才能使用。平方和归并、门控清零、逆元码、时钟区间，全是为"完整"付的账。

差异五，推论的姿态。我以为主定理的杀手锏应用是否决某显式问题；成品的推论是带承诺的不可判定性，且连发三道界牌（存在性界、非恰一承诺、不涉 $\mathbb Z/\mathbb Q$，consequences.tex:35-40）。[推测] 这种克制与"常数未数值化"一脉相承：构造没有给出显式 $P$，任何依赖实例数值性质的强化都无权申领。

## 18 Lean 侧取证：规模簇表与主链精读

取证边界复述：只用了 formalization.yaml 第 1510--1512 行注册与 582--584 行书目（书目只有标题与 pdf 路径，pdf 未读）、ComparatorChallenges/SingleFold.json 全文、以及模块目录 OAI/NumberTheory/SingleFold/ 本身；对 lean 仓未做任何递归检索。

JSON 逐字要点：`"theorem_names": ["OAI.SingleFold.main"]`，`"definition_names": []`，`"permitted_axioms": ["propext","Quot.sound","Classical.choice"]`，`"enable_nanoda": false`。[推测] definition_names 留空说明验收只对外审计那一个定理名，模块内二百余条声明全部允许私有；三公理即 Mathlib 常规底座，`Classical.choice` 与论文"常数存在但不数值化"的姿态（main.tex:117-121）严格同构：`evalNat` 就是 `noncomputable def`（Model.lean:8）。

模块全量规模（一次 wc，28 个 .lean，合计 7598 行 344596 字节），按簇分组。阅读状态我如实标注：全读（4 件）、仅声明清单（2 件）、未读（22 件，其职能由命名与规模对齐推断，[推测] 语气贯穿该表）。

| 簇 | 文件(行数/字节) | 读法 | 与 tex 链条的推断对应 |
| --- | --- | --- | --- |
| 顶层 | Main.lean (28/962) | 全读 | thm:main 的出口：`theorem main : MainStatement` |
| 顶层 | Model.lean (26/1055) | 全读 | sec:conventions 的 `evalNat`/`Represents`/`MainStatement` 三件套 |
| 编译基底 | PolynomialCompiler.lean (304/13575) | 未读（仅定位两行：:17 structure Representation、:254 theorem export_polynomial、:27 def SF） | 有限系统到单多项式的归并（eq:squares 的机器版）与 SF 谓词 |
| 码层 | RationalCodes.lean (413/19469) | 未读 | lem:rational-codes 六元组码 |
| 码层 | EllipticCoordinates.lean (463/24841) | 未读 | lem:point-arithmetic 七情形加法表 |
| 附录秩簇 | FunctionalCompiler.lean (262/13085), DescentMap.lean (360/14643), SquareSupport.lean (156/7236), LocalDescent.lean (199/7854), EllipticHeight.lean (242/9254), QuadraticHeight.lean (224/9266), FiniteGeneration.lean (110/4330), Rank.lean (346/13219), Duplication.lean (216/9229), Torsion.lean (94/3677) | 未读 | app:rank-one 的 2-等斜下降、平方类支撑、高度、Mordell--Weil 有限生成、挠群 |
| 增长簇 | HeightGrowth.lean (281/13454), EllipticGrowth.lean (498/23948) | 后者仅声明清单 | sec:growth：`height_constants`（对 eq:height-constants）、`Representative`/`representative_unique`（对 lem:representatives）、`Bracket`/`Window`（对 eq:index-bracket/eq:square-window）、`sequence_approx`（对 eq:quadratic-sequence）、`neighbor_max` |
| 幂簇 | Pell.lean (284/11518), Power.lean (304/14655) | 后者仅声明清单 | lem:pell-sequences 与 prop:power：清单含 `choose_ell`、`input`、`input_bounds`、`cutoff`、`System`、`pinned`、`sound`、`unique`、`complete`、`power_of_growth`、`power : SF (fun z : Fin 3 => 2 ≤ z 0 ∧ z 2 = z 0 ^ z 1)`（Power.lean:299），四个证明段一一对位 |
| 位簇 | Binary.lean (199/7904), Packed.lean (290/11813) | 未读 | prop:subset 的 $\preccurlyeq$ 与打包 |
| 机器簇 | CounterMachine.lean (361/14851), CounterRecords.lean (458/20383), CounterBounds.lean (356/15809), CounterCompilation.lean (181/9766), MacroMachine.lean (401/18519), TuringSimulation.lean (383/21830), RecursiveEnumeration.lean (159/8451) | CounterCompilation 与 RecursiveEnumeration 全读 | sec:computation：机器定义、逐块记录、界、系统编译、宏机、图灵模拟、r.e. 通用性 |

一次 `grep '^import'` 拿到全模块导入图，得到一个我当时没预料的结构事实：28 个文件的兄弟导入构成一条单链，没有分叉：

```
Model → PolynomialCompiler → RationalCodes → EllipticCoordinates →
FunctionalCompiler → DescentMap → SquareSupport → LocalDescent →
EllipticHeight → QuadraticHeight → FiniteGeneration → Rank →
Duplication → Torsion → HeightGrowth → EllipticGrowth → Pell → Power →
Binary → Packed → CounterMachine → CounterRecords → CounterBounds →
CounterCompilation → MacroMachine → TuringSimulation → RecursiveEnumeration → Main
```

每个文件只导入一个兄弟文件（Model 只导入 Mathlib）。[推测] 这是刻意的审计友好布局：定理 `OAI.SingleFold.main` 的全部依赖是这条链的传递闭包，检查一个文件只需先检查其唯一前驱。它与 tex 的 \input 布局同构但顺序不同：tex 按"约定、曲线、幂、机器"分片并行叙述，Lean 把同一数据流强制串行化，附录的下降机器（FunctionalCompiler 到 Torsion 的十文件段）被整体嵌在码层与增长层之间，正对应它"为增长层供秩与挠"的角色。

主链四件全读文件的精读记录：

其一，Model.lean。`Represents P S` 定义为两件的合取（逐字，Model.lean:14-18）：`∀ a, (a ∈ S ↔ ∃ w, evalNat P a w = 0) ∧ ∀ w v, evalNat P a w = 0 → evalNat P a v = 0 → w = v`。这就是 thm:main 的"恰一或零"拆成存在与唯一的机器写法，"No coordinates are hidden outside `w`" 的注释（Model.lean:12-13）重申台账纪律。`MainStatement`（:20-22）把 $n\ge1$、$m\ge1$、`REPred` 假设全部显式入类型。[推测] `REPred` 的定义不在本模块内（模块内 grep 无 `def REPred`），来自仓库更上游的可计算性层级，超出我的许可阅读范围，其在 RecursiveEnumeration.lean:128、143 处被消费。

其二，Main.lean（28 行）。`recursively_enumerably_sf`：从 `hp : REPred p` 经 `TM2Macro.exists_counter hp` 得宏编译的计数器机 `M`，`CounterCompilation.halts_sf M` 得停机集的 SF 性，再逐坐标构造 `MapSF (counterInput)`（`inputSlot` 的 some/none 分支对应"前 $n$ 个计数器装输入、其余装 0"，Main.lean:16-18 与 computation.tex:120-122 对位），`(hi.pullback hc).congr ...` 收束。`main`：`obtain ⟨r⟩ := recursively_enumerable_sf hS; obtain ⟨m,hm,P,hP,hU⟩ := export_polynomial r` 两步拆包，恰是 tex 里"编译机器、平方和归并"的最后两笔。

其三，RecursiveEnumeration.lean 的 TM2Macro 段。`Good A` 与 `FiniteState n M S`（:11、:90）把"可达指令集张成的有限状态集"做成 `Fintype`，`program_within`（:48）证明程序永不逃逸该有限集，`counter_halts`（:105-126）用一段五步 `calc` 把计数器停机等价到宏机等价到图灵机停机。这整段就是 lem:counter-universality 的机器化身：tex 用两页 prose 描述的"带子存栈、scratch 计数、状态复制做返回地址"，Lean 侧显然由 TuringSimulation 与 MacroMachine 两文件承担（未读，[推测] 由 21830 与 18519 的规模与导入位置推断）。`exists_code`（:128）把 `REPred` 变成部分递归码，`exists_counter`（:143）组装成定理级陈述 `p a ↔ Counter.Halts M (counterInput a)`。

其四，CounterCompilation.lean（181 行）。`Var Q J` 枚举（:24-28）逐字是 computation.tex 展示变量的清单：`w,B,b,k,H,last,mask` 对 $(w,B,b,k,H,J,M)$（`last` 即 $J=B^{k-1}$、`mask` 即 $M$），`state/zeroBranch/decBranch/complement` 对 $(I_q,Z_q,N_q,V_q)$，`counter/final/rem` 加 `Option J` 的 none 哨兵对 $(R_j,\rho_j,\eta_j)$ 并把时钟 $R_0$ 并入同一族（`none` 即 $j=0$ 时钟位，与第 13 节"时钟并入计数器"的推断一致）。`baseC`（:56）对 $C=1+s+\sum d_j$。`system_sf`（:131-166）把 eq:machine-base 到 eq:machine-clock-scale 的每条方程转成 SF 组合子串：`powerRel` 对两次 $\operatorname{Pow}$ 调用、`bits` 对每次 $\preccurlyeq$、`branch_sf`/`zero_test_sf` 对分支与零测试的逐状态合取（`by_cases M.instr q` 的三叉正是 INC/TESTDEC/HALT 指令表）。`halts_sf`（:168-178）用 `system_unique` 与 `system_complete`（定义在 CounterBounds/CounterRecords，未读，[推测] 对应 prop:machine-compiler 的 soundness 与 totality 两半）通过 `SF.ex` 把"存在唯一见证"封进停机关系的 SF 性。

一处诚实声明：Power.lean 与 EllipticGrowth.lean 我只见过顶层声明清单（grep 的 `^theorem/^lemma/^def` 行号列表），未逐行读证明体；上表对它们的"对位"全部是命名加行号锚点的对齐推断。其余 22 个文件同理只入规模簇表。

## 19 外部检索登记与旁证强度

本轮联网检索得到的是书目级旁证，我把每条用到什么程度如实登记，正文凡超出 tex 素材的史实叙述均已标 [推测]，以下再补 [外部检索] 标记的三条：

- 有限折猜想的正式出处与 Matiyasevich 2010 的持续在场：检索到 "Towards finite-fold Diophantine representations"（Zapiski POMI 377, 2010）的书目镜像页，与论文 references.bib:36-44 自引一致；单折到有限折的蕴含链（abstract 的 consequently 一句）由此确认是社区公认层级，属于背景，并非新证据。
- Matiyasevich 一系关于"有限解 Diophantine 方程的解高上界算法是否存在"的问题（Fundamenta Informaticae 一篇题目的检索页）：它与 cor:unique-h10 的"至多一解承诺"形成概念呼应，[推测] 作者可能有意让推论回答该问题的负面变体（承诺下也无判决算法），但 tex 内没有任何引用指向该文，我不作强关联。
- 曲线 $y^2=x^3-25x$ 属于同余数曲线族 $y^2=x^3-n^2x$（$n=5$）的常识：检索页仅到百科级（同余数词条、椭圆整除序列词条），我给的外部定位只到"该族秩正性与同余数性质的经典关联是背景知识"这一句；论文对该曲线的全部可用信息仍是 rank-one-proof.tex 的显式下降。[外部检索]

另有一条负面声明：检索未找到对本篇 2026-09-24 预印本的任何第三方评论或勘误，故第 16 节关于"作者踩过的坑"的叙事只能由文本痕迹反推（我引的每个痕迹都有行号），没有任何外部记忆可依托。

## 20 收尾自检记录

落盘完成时对全文跑过的机械检查与结果（追加本节前的实测值，追加后字节数见最终回报）：

- 体量：正文（截至第 19 节末）121597 字节，超过 70000 字节的规格线。
- 节次：`grep -n "^## "` 得到 1 至 20 连续编号，无跳号、无重复。
- 台账：第 4 节表头逐字为 "| 记号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |"，紧随五行分隔行 "| --- | --- | --- | --- | --- |"，数据行 32 行，五栏无空格、无破折号占位；表内绝对值一律 \lvert \rvert 写法。第 18 节的规模簇表另用独立表头，不参与该规格。
- 禁字扫描：全文件 U+2014 长横计数 0（人名连接用 --，区间用 -）；派单禁令清单里列出的五个禁用连接词组逐一检索，计数全为 0；被禁的关联句式（以"不是"起头、14 字内无句读地紧跟转折尾）检索计数 0（第 6 节原有一处，已改写）。
- 素材纪律：正文引用全部落在 build\ 的九个文件上，行号可在该目录复核；未调用 pdftotext，未打开任何 PDF；Lean 侧只读了许可的四个文件全文、两个文件的顶层声明清单、一次模块内 import 行 grep 与一次 wc，外加 yaml 两个片段与 JSON 全文。
- 偏离登记：其一，任务列出的 build 四件外实际有 9 个文件（含四个小 tex 与 references.bib），按"全部都要读到"的条款我全读了，超出原清单属合规扩展；其二，联网检索只得到书目级命中，未获得可引用的内容级材料，我据此把第 16、17 节的历史叙事全部压成 [推测] 并只在第 19 节挂了 [外部检索] 的三条弱旁证；其三，`REPred` 的定义在许可目录之外，我只在 Model.lean:21 与 RecursiveEnumeration.lean:128 记录它的消费点，未追定义；其四，Power.lean 与 EllipticGrowth.lean 我只精读了顶层声明清单，第 18 节表内已如实标注"仅声明清单"。

本篇笔记到此为止。它给出的最终图景是：单折性是一场从六元组码的第一行方程持续到平方和归并的簿记，中间每一处口语里的"显然唯一"，都要换成对全部辅助变量名逐一点名的论证之后才允许出现。
