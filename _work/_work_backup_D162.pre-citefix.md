D162-Kaplansky直接有限性猜想在特征二的反例：从配对恒等式到终止有限搜索的反推笔记

研究笔记，第一人称记录。写下这些字的时候，我手里只有 `build/` 下的十个 `.tex`，PDF 一律没碰（语料加密，按约束禁读），所以所有判断都必须在 tex 源码行号上落地。文末台账里每一条数值都标了我读到它的那个文件与那一行。

## 0 素材实测与登记归属判定

### 0.1 本篇在队列中的位置与目录

队列第 6 行号，日期 2026-09-23。论文目录（覆盖审计用的完整串）：

`preprints/A-Counterexample-to-Kaplanskys-Direct-Finiteness-Conjecture-in-Characteristic-Two-September-23-2026`

正文素材限定在该目录的 `build/` 子树下。`build/references.bib`（7,668 B）按约束只登记存在，不作为论证来源；`typst/` 分片（`main.typ` 93,948 B、`refs.bib` 7,707 B）属排版分片，我一个字没抄进本笔记；`paper.pdf` 471,111 B 与 `typst/main.pdf` 659,230 B 我没读，也没用 `pdftotext`。

### 0.2 `build/` 下 `.tex` 实测（`wc -c` 复核，单位字节）

- `build/sections/04-hypergraph.tex` 28,605
- `build/sections/02-criterion.tex` 18,893
- `build/sections/01-introduction.tex` 12,657
- `build/sections/02a-embedding.tex` 10,378
- `build/sections/05-prescription.tex` 8,307
- `build/sections/06-cellular-automata.tex` 7,366
- `build/sections/03-pairing.tex` 5,762
- `build/figures/diagram-merge.tex` 2,705
- `build/figures/trade.tex` 1,739
- `build/paper.tex` 2,267

十个文件合计 98,679 B（`wc -c` 的 total 行实测）。`figures/` 下两个 `.tex` 是被 `\input` 进正文的 tikz 图源，属正文素材，我在第 7 节与第 11 节分别用到它们的 caption 文本。

`paper.tex` 的 `\input` 顺序（实测第 46-51 行区间内的六行）是 `01-introduction`、`03-pairing`、`02-criterion`、`04-hypergraph`、`05-prescription`、`06-cellular-automata`，而 `02-criterion.tex:51` 内部又 `\input{sections/02a-embedding.tex}`。文件名编号与成文节号错位：`03-pairing.tex` 排成第 2 节，`02-criterion.tex` 排成第 3、4 节。这个错位本身是取证线索，我在第 4.4 小节按它反推了一次改版过程。标题宏 `\title{A Counterexample to Kaplansky's Direct-Finiteness Conjecture in Characteristic Two}`、`\author{OpenAI}`、`\date{September 23, 2026}` 三行都在 `paper.tex` 里，与队列日期一致。摘要一句话给出结论对象：特征二的有限域 $K$、有限展示群 $G$、有限和 $a,b\in K[G]$ 满足 $ab=1$ 而 $ba\ne1$，并且同一批元素定义 $K^G$ 上单射非满射的元胞自动机。

### 0.3 两条候选登记与归属判定

`E:\math\lean\formalization.yaml` 里两条候选，实测行号如下。

候选甲：1266 行 `- comparator_config: ComparatorChallenges/KaplanskyFinitelyPresented.json`，1267 行 `declaration: OAI.KaplanskyCounterexample.finitelyPresented_counterexample`，1268 行 `file: OAI/RingTheory/DirectFiniteness/FinitelyPresented.lean`。模块 `lean/OAI/RingTheory/DirectFiniteness/` 实测 126 个 `.lean`、合计 569,407 B。

候选乙：1350 行 `- comparator_config: ComparatorChallenges/OddKaplansky.json`，1351 行 `declaration: OAI.OddKaplansky.main_theorem`，1352 行 `file: OAI/Algebra/OddKaplansky/Main.lean`。模块 `lean/OAI/Algebra/OddKaplansky/` 实测 87 个 `.lean`、合计 612,300 B。

判定结论：候选甲属于本篇，选为主登记；候选乙淘汰。判据全部来自两个入口文件里主定理的确切陈述与 tex 正文的逐项对照，四条硬证据（详细逐行对照见第 14 节）：

1. 特征条件。`FinitelyPresented.lean:15` 写 `(_ : CharP K 2)`；`OddKaplansky/Main.lean:72`--`73` 的 `MainClaim` 写 `sourcePrime.Prime ∧ Odd sourcePrime` 并在 `:73` 用 `CharP K sourcePrime`。本篇 `01-introduction.tex:10` 与 `02-criterion.tex:11` 都要求 $K$ 是特征二的有限域，候选乙的特征假设与正文相反。
2. 有限展示强度。`FinitelyPresented.lean:16` 有 `Group.IsFinitelyPresented G`；`OddKaplansky/Main.lean:75` 只要求 `Group.FG G`。本篇 `02-criterion.tex:435`--`473` 整小节（`\label{sec:finite-presentation}`）在证 $G$ 有限展示，`01-introduction.tex:40` 也明说 finite presentation 由正文直接建立。
3. 挠的强度。`FinitelyPresented.lean:17` 是 `∃ (ℓ : ℕ) (_ : ℓ.Prime) (_ : Odd ℓ) (g : G), orderOf g = ℓ`；`OddKaplansky/Main.lean:76` 只有 `g ≠ 1 ∧ IsOfFinOrder g`。本篇 `01-introduction.tex:10` 写 "containing an element of odd prime order"，`02-criterion.tex:33` 写 "containing an element of order $\ell$"，要的是阶恰为奇素数 $\ell$。
4. 命名与处方。候选甲的命名空间 `OAI.KaplanskyCounterexample`、声明名 `finitelyPresented_counterexample`、`Prescription`、`Output.a`、`Output.b`、`selectedH`、`Test selectedInput selectedPair` 与本篇 `05-prescription.tex:8`--`30` 的逐条件有限搜索、`02-criterion.tex:402`--`409` 的 $a_{\mathrm{out}},b_{\mathrm{out}}$ 记号一一对齐；候选乙的 `QuadraticTower`、`Fintype.card K = sourcePrime^4`、`Heisenberg.GroupData`、`Diagrams.lean` 在本篇 tex 里找不到任何对应物。

旁证：`preprints/` 目录下同时存在 `A-Counterexample-to-Kaplanskys-Direct-Finiteness-Conjecture-in-Odd-Characteristic-September-26-2026`（实测目录列表），候选乙的 odd 特征与四次方域规模正好对上那一篇的题面。归属因此落在甲。选定后，深入取证只走甲的 `import` 链（见第 14.3 小节的文件清单），乙的 87 个文件我除入口 `Main.lean` 外未打开，`Diagrams.lean` 未读。

两条 comparator json 都读了：`lean/ComparatorChallenges/KaplanskyFinitelyPresented.json`（394 B）里 `solution_module` 是 `OAI.RingTheory.DirectFiniteness.FinitelyPresented`，`theorem_names` 单元素数组列 `OAI.KaplanskyCounterexample.finitelyPresented_counterexample`，`permitted_axioms` 为 `propext`、`Quot.sound`、`Classical.choice`，`enable_nanoda` 为 `false`；`lean/ComparatorChallenges/OddKaplansky.json`（329 B）同构，只是模块换成 `OAI.Algebra.OddKaplansky.Main`。两份 json 的公理许可完全相同，因此 json 本身在归属判定上没有区分力，区分力全在主定理陈述的形状上。这一点我记在台账里。

## 1 初始动机与猜想

我最初的出发点是一个很朴素的不甘心：有限维线性代数里，左逆自动是右逆，这个事实在群代数上到底卡在哪一步。$K[G]$ 的每个元素只有有限支撑，$\sum_{g}c_g g$ 里非零 $c_g$ 只有有限个，$K$ 上的维数虽然无限，支撑集给出的信息看起来已经很接近有限矩阵了。`01-introduction.tex:4` 把这个问题写成一句：对任意域 $K$、任意群 $G$、任意 $a,b\in K[G]$，$ab=1$ 是否强制 $ba=1$。我一开始把它当作一个"支撑集能否替代维数"的问题，认为反例若存在，必然要利用群字问题的不可判定性，或者利用某个无限群让支撑在乘法下爆炸。

第二个动机来自特征。特征零那一侧的经典论证是迹论证：把 $\mathbb C[G]$ 放进带迹的有限迹环境，$ab=1$ 时取迹得 $\operatorname{tr}(a)\operatorname{tr}(b)=\dim$，迹阻止了单侧逆。`01-introduction.tex:21` 记的是 Kaplansky 自己的算子代数论证和 Montgomery 用正则表示的算子范数闭包与单位元系数迹的证明。我当时猜：既然特征零的武器是迹，特征 $p$ 的反例就得先找到一个"$p$ 整除掉某个关键分母"的位置。$\ell$ 阶元素的平均 $\frac{1}{|H|}\sum_{h\in H}h$ 在 $p\mid |H|$ 时失效，这个我第一晚就写下来了。可我当时以为必须让特征整除群阶，后来发现正文用的是完全相反的安排：所有分母都靠奇数 $\ell$ 保住（$\ell$ 是奇素数，特征二是 $2$，$\kappa=\ell^2$ 在 $K$ 中可逆），特征二被用在另一处，用在让 $\ell+1$ 作为一个标量等于 $0$。

我最初设想的第三个部件是"直接给出两个元素"。我想像中的反例长这样：挑一个具体群，写两个字和 $a=\sum_i\lambda_i u_i$、$b=\sum_j\mu_j v_j$，手工算 $ab$ 与 $ba$，然后说明前者归约成单位字、后者不归约。`01-introduction.tex:6` 提醒了我这条路有结构性障碍：造出矩阵对 $AB=I\ne BA$ 并不自动给出标量元素对，稳定有限性与直接有限性的差别正好落在这里。我的第一版草稿里根本没意识到这点，把两者混着写了很久。这是后面第 4.2 小节要展开的第一条错误路线。

我最初还猜特征二这个条件只是技术性的方便，比如 $\operatorname{char}=2$ 时 $-I_m=I_m$、加减号合并。读到 `03-pairing.tex:104` 的 remark 才明白，特征二在这里承担的是概念性任务：正则度 $D=\ell+1$ 作为标量在 $K$ 中为零，于是"每条线上配对和为零"与"全体点配对和为 $-I_m\ne0$"这两件事可以同时成立，两者不矛盾。差别在于一个是求和 $D$ 次，一个是求和 $|V|$ 次，而 $D=0$ 把前者抹掉了。这个观察是我整个理解链条的枢纽，第 6.1 小节专门记它。

猜想成型的最后一步是把问题重新表述成有限组合数据。我在笔记本上抄过这样的改写：给定有限集 $V$、族 $\mathcal F$、每点度 $D$、关联围长 $g\ge 12$、以及向量 $x_v\in K^m$ 使得 $\sum_{v\in f}x_vx_v^{\mathsf T}=0$ 与 $\sum_{v\in V}x_vx_v^{\mathsf T}=-I_m$，剩下的全是机械的。`01-introduction.tex:61`--`67` 就是这个改写，其中 $\ell$ 是奇素数、每点度 $\ell+1$、$m<|V|\le m\ell^2$。我最初的版本里没有 $\ell^2$ 这个上界，$m<|V|$ 也写成了 $m\ll|V|$；上界是被"打包需要多少槽"倒推出来的，第 8.3 小节记这段。

## 2 猜想成型期的一次量化试算

我在正式读正文之前先做了一次独立的量级试算，用来判断"洞"要多大。记 $N_{\rm pt}=q^n$，$q=2^h$，度 $D=\ell+1$。如果每个洞要吞掉它上面所有入射直线，而每点度为 $D$，那洞数 $m$ 至少要让被删掉的关联数与保留下来的正则性匹配。我当时写的是：线总数约 $N_{\rm pt}\cdot D/q$ 量级（每条线 $q$ 个点），洞贡献 $m\cdot D$ 个关联，要保留正则度 $D$，就得让每个方向的洞造成的亏损被平行线补回来。这算出来的形状与 `04-hypergraph.tex:57` 的 $\frac{2N_{\rm pt}}{D^2}\le|O|\le\frac{7N_{\rm pt}}{D^2}$ 同阶，只是我系数估计粗到只记得 $D^{-2}$ 的幂次。洞规模按 $D^{-2}$ 收缩这件事，在我试算里是"随机取点碰不出短线"的必要条件，正文则把它做成 Chebyshev 与 Markov 两条显式估计（`04-hypergraph.tex:156`--`158`、`:188`）。

第二次试算是围长。我一开始要求 $g\ge 8$，理由是很粗：短环会带来局部坍缩。这个数我算错了方向。真正的约束来自 Euler 不等式的余量：$n_{\rm b}\le E/3$、$n_{\rm w}\le(E+1)/2$、$n_{\rm f}\le E/6+1$ 三式相加得 $n_{\rm b}+n_{\rm w}+n_{\rm f}\le E+\tfrac32<E+2$，与 Euler 公式 $n_{\rm b}+n_{\rm w}+n_{\rm f}=E+2$ 矛盾（`02a-embedding.tex:185`--`192`）。左边三个界的分母 $3,2,6$ 恰好和为 $1$，所以任何面长下界 $g$ 只要大于 $6$ 就进入 $n_{\rm f}\le 2E/g+1$ 的形式；要让 $n_{\rm f}$ 的界足够小以补上那个 $\tfrac12$ 的余量，需要 $g\ge 12$。`02a-embedding.tex:180` 写的正是 $g\ge12$。围长 12 是算术余量逼出来的常数，属于最脆弱的那类参数，改动它任何一环都会断（第 7.4 小节记这个账）。

第三次试算是 $\ell$ 的取法。我要 $\zeta\in K$ 是 $\ell$ 次本原单位根，即 $\ell\mid|K^\times|$，而 $|K^\times|=2^{d}-1$，所以 $\operatorname{ord}_\ell(2)\mid d$。正文用 `05-prescription.tex:21` 的说法：Fermat 小定理给 $\ell\mid 2^{\ell-1}-1$，于是取 $[K:\mathbb F_2]=h(\ell-1)$ 一定行，无需研究 $\operatorname{ord}_\ell(2)$。这一步让我意识到自己在过度设计：把域次数放大到 $h(\ell-1)$ 是用一个粗上界换掉了整个互反律问题。代价是 $K$ 变大，但正文只要求存在，第 12 节会看到处方化对大小完全无所谓。

$L=q^{100}$ 同余类里取最小素数 $\ell\equiv-1\pmod{q^{100}}$（`04-hypergraph.tex:15`--`16`）这一条我一开始当成纯粹的技术便利，为了让 $q^{100}\mid D$。后来才明白 $q^{100}$ 里的 $100$ 是被 $s\ge100$ 定的（`04-hypergraph.tex:23`），而 $s\ge100$ 又被洞选择估计里 $q^{2402-88s}=o(1)$ 定住（`04-hypergraph.tex:168`）。这条链把"一个看起来像随手写的指数"锚死在两个具体常数上，第 11.5 小节完整复算。

## 3 从迹到秩：特征二下失效的确切位置

我想先把"迹论证在 $2$ Characteristic 崩在哪"弄精确，因为这决定反例必须提供什么样的替代检测手段。特征零论证的骨架是：$ab=1$ 时把 $a,b$ 看作 $\ell^2(G)$ 上的卷积算子，在正则表示的算子范数闭包里取"单位元系数"这个迹 $\tau$，则 $\tau(1)=1$，而 $\tau(ab)=\tau(ba)$ 给出 $\tau(ba)=1$；再配合 $\tau$ 在正元上的正定性逼出 $ba=1$。`01-introduction.tex:21` 概括的正是这个：迹排除了真单侧逆，Montgomery 的处理还包括每一个有限矩阵规模。

替代物是秩。`03-pairing.tex:66`--`71` 给的输入是 $x_v\in K^m$ 与 $m=|O|$、$t=|V|$，两条矩阵恒等式 $\sum_{v\in V}x_vx_v^{\mathsf T}=-I_m$、$\sum_{v\in f}x_vx_v^{\mathsf T}=0$。把它们装成 $U\in\operatorname{Mat}_{m\times t}$、$T\in\operatorname{Mat}_{t\times m}$（`02-criterion.tex:89`，$U_{-,v}=-\kappa x_vP_v$、$T_{v,-}=P_vx_v^{\mathsf T}$），就有 $UT=I_m$（`02-criterion.tex:103`--`109`）。这里 $XX^{\mathsf T}=I_m$ 说的是 $X$ 有满行秩，而秩论证给的是 $X^{\mathsf T}X\ne I_t$，因为 $\operatorname{rank}(X^{\mathsf T}X)\le m<t$（`02-criterion.tex:318`）。秩替代了迹的角色，但它替代得很不彻底：$\operatorname{rank}$ 不是环上的迹型泛函，它无法直接判"$ba\ne1$"。

我的错误猜想在这里出场了。我以为可以造一个"$K[G]\to$ 某个有限维代数"的同态，在其中取秩来检测缺陷。`02-criterion.tex:291`--`298` 确实有一个 $K$-代数同态 $\varepsilon:K[H]\to K$，$\varepsilon(nz^r)=\zeta^r$，但它只定义在 $H=N\times\langle z\rangle$ 的子群代数上，且 `02-criterion.tex:325`--`326` 特意声明：$\varepsilon$ 只对 $K[H]$ 的元素用过，没有任何把它扩张到 $K[L]$ 的断言。这个限定不是客套。$L$ 由 HNN 扩张得到，$\tau_v$ 把 $K_v\times\langle z\rangle$ 扭成 $K_*\times\langle z\rangle$，一旦 $\varepsilon$ 要同时对所有 $\tau_v$ 相容，扭系数就得为零，整个打包就塌了。第 4.6 小节记我在这上面浪费的时间。

还有一个更隐蔽的失效点。$ab=1$ 在特征零的迹论证里靠 $\tau(1)=1\ne0$，而 $1$ 的迹在特征 $p$ 下可能为零，比如对 $n$ 阶单位矩阵取通常矩阵迹时 $\operatorname{tr}(I_n)=n\cdot1_K$ 在 $p\mid n$ 时消失。本篇的处理方式很不一样：它需要的关键平均是 $P_v=\kappa^{-1}\sum_{u\in K_v}u$（`02-criterion.tex:67`）与 $e=\ell^{-1}\sum_r\zeta^{-r}z^r$（`:179`），两个分母 $\kappa=\ell^2$ 与 $\ell$ 都是奇数，在特征二的域里可逆。`05-prescription.tex:64` 把这点写得很清楚：阶为 $\ell,\ell^2,\ell^3$ 的嵌入子群都是奇阶，所以它们平均的分母全可逆；有限辅助群里只取 $\lvert(\mathbb Z/\ell)^m\rvert^{-1}$，从不取 $\lvert S_m\rvert^{-1}$（`02-criterion.tex:354`）。我自己的口径是这样：特征二没有削弱论证，它把可用的分母限定在奇数上，而作者把每一个需要除的地方都放进了奇数。

## 4 尝试过的错误路线及失败原因

### 4.1 路线一：直接在某个具体群代数里写两个字和

第一版我按第 1 节的初始设想做：选一个有奇素数阶元素的群，写 $a=\sum_{i=1}^r\lambda_iu_i$、$b=\sum_{j=1}^s\mu_jv_j$，让 $ab$ 的每个非单位系数在群字问题下归约为零。失败原因有三层，我按发现的顺序记。

第一层是系数对消需要群关系，而群关系一旦足够多以完成对消，就同时把 $ba$ 也拉向 $1$。$ab=1$ 要求对每个 $w\ne1$ 有 $\sum_{uv=w}\lambda_i\mu_j=0$（乘法规则是 `06-cellular-automata.tex:17` 的 $(cd)_w=\sum_{uv=w}c_ud_v$）。要让这 $|{\operatorname{supp}(a)\operatorname{supp}(b)}|$ 个方程成立，可用的关系必须落在 $\operatorname{supp}(a)\cup\operatorname{supp}(b)$ 生成的子群里；而正文 `05-prescription.tex:68` 反过来指出：支撑子群已经包含了全部信息，有限生成性是自动的。这条限制把可行空间压得非常小，我在小群上枚举时，凡是 $ab=1$ 成立的组合，$ba=1$ 也成立。

第二层是我当时不知道的稳定有限性障碍。`01-introduction.tex:6` 明确写：造出矩阵对 $AB=I\ne BA$ 并不自动造出标量对。也就是说，即便我找到 $A,B\in\operatorname{Mat}_r(K[G])$，$ab=1$ 这个标量结论仍需要一次额外转移。这条我在路线二里才撞上。

第三层是检测手段缺失。就算写出候选 $a,b$，要证 $ba\ne1$ 就得证某个群字非空，即某个 $w$ 的系数 $(ba-1)_w\ne0$。这在一般有限展示群上等价于碰字问题的正难度。正文给出的解法绕开了这点：`05-prescription.tex:59` 声明反向积缺陷的非零性靠把 `02-criterion.tex:284` 的 $J_0\Delta C=e(TU-P)\in\operatorname{Mat}_t(K[H])$ 特殊化到 $K$ 上的非零矩阵得到，"does not depend on an unproved inequality between group words"。我最初那版没有任何这样的证书，只有"看起来不等"。

### 4.2 路线二：把矩阵反例当成标量反例

第二版我退一步：先造矩阵。用 $UT=I_m$、$TU\ne I_t$ 这种矩形分解，只要 $t>m$ 就一定有 $TU\ne I_t$（秩论证），这一步完全顺畅，也正是 `02-criterion.tex:96`--`109` 的内容。我把这里当成终点，写了一段"$K[G]$ 不直接有限"的结论，检查时被自己拦下：$UT$ 与 $TU$ 的维数都合法，$U$ 是 $m\times t$、$T$ 是 $t\times m$，$UT=I_m$ 成立而 $TU\ne I_t$ 完全不违反任何有限性公理，因为 $U,T$ 都不是方阵。直接有限性谈的是幺环里元素的单侧逆，稳定有限性才谈方阵。

要跨出这一步需要 Dykema--Juschenko 式的转移。`01-introduction.tex:25` 引的是他们的 Theorem 2.2：固定域与群时，稳定有限性等价于与每个有限群直积后的直接有限性；其化约把一个矩阵代数嵌入有限群代数并补上互补的单位。`02-criterion.tex:336` 明说本节的显式有限辅助群就是这个化约的具体实例，`:463`--`464` 又补了一句：最后一步没有从"任意环的直接有限蕴含稳定有限"这个未经证明的方向推理，只用了具体的 $F$ 与单的 $\Phi$。这个我漏掉的补单位操作（$1-f_{\mathrm{blk}}$）在公式里就一行（`:402`--`409`），我第一次读时把它当作排版噪声。它承担的角色是：角的单位元 $f_{\mathrm{blk}}$ 不是整个群代数的单位元，两边各加 $1-f_{\mathrm{blk}}$ 才让乘积等于 $1$。

第二个漏洞是我以为可以省掉幂等元 $e$，直接把 $UT=I_m$ 与 $J_0C=eP$ 拼起来。$a_{\mathrm{mat}}=UJ_0+(1-e)I_m$、$b_{\mathrm{mat}}=CT+(1-e)I_m$（`02-criterion.tex:259`--`261`）展开时有交叉项 $UJ_0(1-e)$、$(1-e)CT$ 与 $(1-e)^2I_m$。$C,J_0$ 每个元素都含中心因子 $e$（`:263`--`264`），于是 $e(1-e)=0$ 让交叉项全部消失，得 $a_{\mathrm{mat}}b_{\mathrm{mat}}=U(eP)T+(1-e)I_m=eI_m+(1-e)I_m=I_m$（`:270`--`271`）。省掉 $e$ 之后正向积就不再是单位矩阵；$e$ 的存在是为了给"打包部分"与"补单位部分"一个共同的分裂算子。

### 4.3 路线三：想靠无挠群躲开分母问题

第三版我读了 `01-introduction.tex:23` 的正结果清单（free-by-amenable 与 sofic 的稳定有限性，分别用 Sylvester 秩函数与有限近似模型），得出一个反向推论：反例群既不能是 free-by-amenable 也不能是 sofic，所以必须有相当怪的几何。我当时以为更保险的做法是干脆用无挠群，这样所有 $(\sum_{u\in H}u)/|H|$ 型平均都涉及无限和、必须整体弃用，反而逼自己只用"整"的组合。这条路彻底错的：`05-prescription.tex:64` 最后一句写"No assertion about group algebras of torsion-free groups is needed"，而 `02-criterion.tex:468`--`472` 的结论链要求 $K_v\le N\le H\le L\le G$ 且 $K_v$ 的非单位元阶为 $\ell$，即挠是构造的承重墙。$P_v$ 是 $\ell^2$ 阶子群的群代数平均（`:67`），特征 idempotent $Q_\alpha$ 也建立在 $K_*\cong\mathbb F_\ell^2$ 的加法特征上（`:190`）。丢掉奇阶挠就等于丢掉了配对恒等式的载体。`01-introduction.tex:18` 专门强调构造用了奇阶挠、并且不主张 $K=\mathbb F_2$，这两句话在当时我读来像免责声明，实际是路线约束。

正面对照：$G$ 的无挠性需求与 sofic 性的关系是反过来的。$01\text{-}introduction.tex:40$ 的推理是：若这个 $G$ 是 sofic，Elek--Szabó 的定理让 $K[G]$ 稳定有限，从而规模 $1$ 情形直接有限，与两条乘积断言矛盾；因此该 $G$ 非 sofic，并且这给出"每个群都是 sofic"这一命题的有限展示反例。我把这段当作副产品，其实它是全篇对外部命题最强的一条结论，因为它只需要标量缺陷和一条引用定理，不需重跑构造。

### 4.4 路线四：删掉穿过洞的直线，同时指望正则性还在

几何侧我犯的第一个错很直白。目标是把 $\mathcal A=Q^n$ 里的一堆点 $O$ 删掉，让剩下的 $V=\mathcal A\setminus O$ 上有一个每点恰度 $D$ 的直线族。我第一版写："取所有仿射直线划分，删掉穿过洞的线。"这一步把洞删干净了，也把正则性删没了：一条过洞 $o$ 的直线 $o+d$ 上另有 $q-1$ 个点，删掉这条线时那 $q-1$ 个点各损失一次入射，它们的度就从 $D$ 掉到 $D-1$ 甚至更低。`04-hypergraph.tex:8`--`13` 把这个问题写在开头：从直线划分出发能自然得到正则性，而简单删除过洞的线会连带降低其它点的度。

修正方案的思路是把"删除"变成"交换"。我在草稿上算过最简单的版本：如果能把过洞的若干条线换成若干条不过洞的平行线，且交换后每个非洞点损失与获得相等，正则性就能保住。正文的实现方式比我猜的精细一档：把穿过 $o$ 的方向按二维子空间 $W_r$ 分成"束"（bundle），一个束里有 $q$ 个方向；在平面 $o+W_r$ 里删掉 $q$ 条线 $o+d_j$（$\rho(j)=r$），插入 $q-1$ 条方向为 $e_r$ 的平行线（`04-hypergraph.tex:522`--`525`、`figures/trade.tex` 的 caption）。逐点计数：$o+e_r$ 之外的每个点恰失去一条、获得一条；洞 $o$ 失去 $q$ 条、获得 $0$ 条；$o+e_r$ 上其余点失去 $0$、获得 $0$（`04-hypergraph.tex:533`--`537`）。洞的 $q$ 次亏损正是它被删除的理由。这里我把 trade 的"保留 $o+e_r$ 不替换"当作自然选择，其实它是必需：若把 $o+e_r$ 也换成平行线，$o+e_r$ 上的点就净增一次入射。

### 4.5 路线五：用一般正则超图，放弃仿射直线结构

第二条几何错误路线是"随便要一个每点度 $D$、围长 $\ge12$ 的有限关联结构"，把 $x_v$ 的构造当成自由变量。这条路看着自由度高，实际把代数侧的输入掐断了。原因在配对：$\sum_{v\in f}x_vx_v^{\mathsf T}=0$ 要对每条 $f\in\mathcal F$ 成立，而 $\sum_{v\in V}x_vx_v^{\mathsf T}=-I_m$ 要求总和非零。一般的正则双部图里，"线"之间没有关系，我找不到任何机制让所有线的局部和同时为零而全局和不为零。

仿射直线给了这个机制：`03-pairing.tex:47`--`57` 的引理说，总次数 $\le q-2$ 的多项式在每条完整仿射 $Q$-线上求和为零，在整个 $Q^n$ 上求和也为零；而 $2d_0=q-2$（`03-pairing.tex:83`，$d_0=(q-2)/2$）恰好落在次数门槛内。于是 $W_v=x_vx_v^{\mathsf T}$ 的每个条目都是一个 $\le q-2$ 次多项式的取值，线求和自动为零。洞上的 $x_o$ 是坐标单位向量，$\sum_{o\in O}W_o=I_m$，相减得 $\sum_{v\in V}W_v=-I_m$（`03-pairing.tex:88`--`92`）。整套配对恒等式因此只依赖两件事：低次多项式的线求和性质，以及插值的可解性。

插值可解性也来自仿射结构。`03-pairing.tex:27`--`45` 的引理在指标单纯形 $S_d=\{(a_{k_1},\dots,a_{k_n}):\sum_i k_i\le d\}$ 上，用 $N_k=\prod_i\prod_{0\le u<k_i}(X_i-a_u)$ 得到按字典序三角化的求值矩阵，对角元 $\prod_i\prod_{u<k_i}(a_{k_i}-a_u)\ne0$，个数 $\binom{d+n}{n}$ 恰等于多项式空间维数。一般超图上的点没有"指标单纯形"这种排序，我没法把求值矩阵做成三角的。这一段让我确认：几何自由度必须付给代数可行性。

顺带一条取证线索，与第 0.2 小节的文件编号错位有关：`03-pairing.tex:11`--`15` 明确说插值论证不依赖保留直线怎么排布，正则性与围长是后面才作为独立假设进入的，并且预告 `sec:hypergraph` 会提供它们。`02-criterion.tex:5`--`7` 也说它的输入只是有限关联系统与两条矩阵恒等式，其后所有群与群代数元素都在本节与 `sec:packing` 内造完，不再引入几何假设。两个文件互相指认对方在后，而 `paper.tex` 的 `\input` 把 pairing 排在 criterion 之前。我判断这是改版留下的痕迹：初版大概按"几何先、代数后"排（文件名 `02`、`03` 属于那一版），最终版为了让代数判据先独立成型而把 pairing 前移，改名成本高于收益，于是文件名与节号就错开了。这类痕迹对我重建思路链有帮助：正文里那些"稍后再供给"的前向指认，往往是重排后补的接口句。

### 4.6 路线六：把子群代数上的特殊化扩张到整个群代数

第 3 节末尾说的就是这个错。我以为 $\varepsilon:K[H]\to K$、$\varepsilon(nz^r)=\zeta^r$（`02-criterion.tex:294`--`296`）既然是 $K$-代数同态，总能靠某种选择扩张到 $K[L]$，那样反向缺陷 $ba\ne1$ 的检测就一步到位：直接对 $b_{\mathrm{mat}}a_{\mathrm{mat}}-I_m$ 用 $\varepsilon$。失败在两个地方。

第一，$L$ 里的 $\tau_v$ 没有 $H$-值。$\tau_v$ 是稳定字母，满足 $\tau_v(uz^r)\tau_v^{-1}=\phi_v(u)z^{r+\alpha_v(\phi_v(u))}$（`02-criterion.tex:136`--`138`）。要让 $\varepsilon(\tau_v)$ 有定义且与关系相容，得 $\varepsilon(\tau_v)\zeta^r\varepsilon(\tau_v)^{-1}=\zeta^{r+\alpha_v(\phi_v(u))}$，而 $K$ 交换、左边等于 $\zeta^r$，于是必须 $\alpha_v=0$ 对所有 $v$。可打包恰恰要求同一槽内的 $\alpha_v$ 两两不同（`02-criterion.tex:126`--`129`、正交性 `:204`--`:208`），$\alpha_v$ 全为零就让 $J_0C=eP$ 里的对消失效（`:250`--`253`）。

第二，检测本来就不需要扩张。正文的做法是先夹逼：$\Delta=b_{\mathrm{mat}}a_{\mathrm{mat}}-I_m=CTUJ_0-eI_m$（`02-criterion.tex:281`），左乘 $J_0$ 右乘 $C$ 得 $J_0\Delta C=(eP)TU(eP)-eP=e(TU-P)$（`:284`），并且 `:286`--`287` 强调乘法顺序关键，$(eP)TU(eP)=e(PT)(UP)=eTU$ 用的是 $PT=T$、$UP=U$。右端已经落在 $\operatorname{Mat}_t(K[H])$ 里（`:288`--`289`），$\varepsilon$ 在此可用，得 $X^{\mathsf T}X-I_t$（`:310`），取 $\ker X$ 里非零的 $y$ 有 $\varepsilon(e(TU-P))y=-y\ne0$（`:315`）。若 $\Delta=0$ 则 $J_0\Delta C=0$，与上一条矛盾。整个链条只用 $K[H]\subseteq K[L]$ 的单射（`:323`--`324`）。$01\text{-}introduction.tex:71$ 那句"The homomorphism is used only on the subgroup algebra"就是这个限定。我一开始把它读成过度谨慎，实际它是构造的边界条件：一旦试图扩张，就得放弃扭特征。

## 5 代数判据的两条输入与尺寸账

第 4 节的错误路线都指向同一件事：判据必须把"正向乘积"与"反向检测"分派给两套互不干扰的数据。`02-criterion.tex:9`--`41` 的判据（正文里 labelled `thm:criterion`）输入清单如下，我把它们与各自角色配对写：

- $\ell$ 为奇素数，$K$ 为特征二的有限域并含 $\ell$ 次本原单位根 $\zeta$，$\kappa=\ell^2$（`:11`--`:12`）。$\zeta$ 用来做特征幂等元，$\kappa$ 用来做子群平均的分母。
- $|V|=t$，$\mathcal F$ 为 $V$ 的非空子集族，每点恰属 $\ell+1$ 个成员，关联图围长 $\ge12$（`:15`--`:16`）。围长供局部子群嵌入，$\ell+1$ 供特征二下的标量对消。
- $m$ 与向量 $x_v\in K^m$ 满足 $0<m<t\le m\kappa$（`:21`--`:24`）与 $\sum_Vx_vx_v^{\mathsf T}=-I_m$、$\sum_fx_vx_v^{\mathsf T}=0$（`:26`--`:32`）。
- 结论：有限展示群 $G$ 含 $\ell$ 阶元素，及 $a_{\mathrm{out}},b_{\mathrm{out}}\in K[G]$ 使 $a_{\mathrm{out}}b_{\mathrm{out}}=1$、$b_{\mathrm{out}}a_{\mathrm{out}}\ne1$（`:33`--`:39`）。

两个尺寸不等式角色不同，我在这一点上起初判断错了。$t\le m\kappa$ 是"够不够槽"：$K_*\to\mathbb F_\ell$ 的线性形式恰有 $\kappa$ 个（`:124`--`:125`），每槽要求形式互异，所以 $t$ 个点最多占 $m\kappa$ 个 $(s,\alpha)$ 对。$m<t$ 是"够不够秩差"：它保证 $X\in\operatorname{Mat}_{m\times t}(K)$ 有非零核（`:312`）并保证 $\operatorname{rank}(X^{\mathsf T}X)\le m<t$（`:318`）。我把 $t\le m\kappa$ 也当成秩条件写过一次，检查时发现若只有 $m<t$ 而无上界，打包矩阵 $C\in\operatorname{Mat}_{m\times t}$ 的槽内正交性无法保证，$J_0C=eP$ 就不再是对角。`02-criterion.tex:45`--`47` 的分工陈述（上界允许特征打包，严格下界在嵌入子群代数里检测反向缺陷）正是我缺的那句。

$P_v$ 的幂等性是这套代数的第一块砖。$P_v=\kappa^{-1}\sum_{u\in K_v}u$，对固定 $w\in K_v$，满足 $uu'=w$ 的对 $(u,u')\in K_v^2$ 恰有 $\kappa$ 个，故 $P_v^2=P_v$（`02-criterion.tex:69`--`71`）。这里 $\kappa=|K_v|=\ell^2$（与 `02a-embedding.tex:204` 的 $|K_v|=\ell^2$、$|L_f|=\ell$ 一致）。第二个分解是 `02-criterion.tex:76`--`80` 的 $\sum_{u\in K_v}u=1+\sum_{f\ni v}(\sum_{u\in L_f}u-1)$：在固定 $v$ 处，包含 $v$ 的那些 $L_f$ 跑遍 $K_v$ 的全部一维子群，其非单位元划分 $K_v\setminus\{1\}$。`:81`--`:82` 特意为这句话加了保险：这是 $K_v$ 内部等式，不蕴含任何关于不同 $K_v$ 之交的断言。我第一版曾把这句话当成显然事实来推广，推广就要求子群之间也划分，而那正是围长嵌入引理给不出的东西。

## 6 关键转折点

### 6.1 转折一：$\ell+1$ 在特征二里是零，两条配对才能同时成立

我卡在"$\sum_VW_v$ 既要等于 $-I_m$ 又要与每条线的零和共存"上时，答案是 `03-pairing.tex:103`--`105` 那三行 remark。设每点度 $D$，若对每条 $f\in\mathcal F$ 有 $\sum_{v\in f}W_v=0$，把所有 $f$ 加起来，左边每个 $W_v$ 被计 $D$ 次，得 $D\sum_{v\in V}W_v=0$。在特征零这立刻推出 $\sum_VW_v=0$，与 $-I_m$ 矛盾；在特征二，$D=\ell+1$ 而 $\ell$ 是奇素数，$\ell+1$ 是偶数，故 $D\cdot1_K=0$，上式成为 $0=0$，毫无内容。两条恒等式因此兼容。

这一步让我把"为什么必须是特征二"从技术细节提升为构造前提。`05-prescription.tex:64` 的总结与此一致：特征二让正则度 $\ell+1$ 作为标量消失，从而允许 line 与 total 两条配对同时成立。反过来说，奇特征情形要造反例，$D$ 就不能取 $\ell+1$ 这种偶数，得另找一套配对安排。我在第 14.2 小节用两个入口文件的差异佐证这点。

$\zeta$ 的存在性也被这个转折连带解决了一半：$K$ 需要含 $\ell$ 次本原单位根，而 $2^{\ell-1}\equiv1\pmod\ell$，所以 $\ell\mid2^{h(\ell-1)}-1=|K^\times|$，循环群里就有 $\ell$ 阶元（`05-prescription.tex:21`）。取 $[K:\mathbb F_2]=h(\ell-1)$ 是为了让这个论证无条件成立。

### 6.2 转折二：围长 12 换来的是一次 Euler 公式矛盾

第二个转折是"局部子群真的嵌入"这件事的证明方式。我原以为要用 Britton 引理一类的 HNN 标准工具。`02a-embedding.tex:66`--`196` 给的是完全不同的办法：把字等式编码成平面图，然后用度数与面长的双重下界推翻 Euler 公式。核心句子在 `02a-embedding.tex:99`--`105` 的 balance 方程组与 `:185`--`:192` 的不等式链。这个转换对我理解全篇的作用超过它自身的技巧性：它说明围长 12 的唯一用途就是给面长下界，而面长下界与顶点度下界在 Euler 不等式两侧对撞。

一旦接受这个视角，"$g\ge12$" 这个看起来任意的常数就变成可推导的量：面长下界 $g$ 给出 $n_{\rm f}\le 2E/g+1$，与 $n_{\rm b}\le E/3$、$n_{\rm w}\le(E+1)/2$ 相加要低于 Euler 值 $E+2$，系数和 $1/3+1/2+2/g$ 需严格小于 $1$。$g=12$ 时 $2/g=1/6$，三项和恰为 $1$，落在临界；正文靠 $n_{\rm f}\le E/6+1$（`:187`）与 $n_{\rm w}\le(E+1)/2$（`:186`）得到的总和 $E+3/2$ 严格小于 $E+2$，余量 $\tfrac12$ 来自那个"至多一个例外面"。这说明 12 处在边界上，围长再小一点论证立刻失败。我把这条列为全篇最脆弱的数值依赖（登记在第 18 节台账第 5 行，同一处依赖链的第 4 行是 $D=\ell+1$；台账里另一条临界常数是第 36 行的局部引理阈值 $1/16$）。

### 6.3 转折三：正向靠打包、反向靠夹逼，两个方向分别取证

第三个转折是方法论上的。我原先找的是一个统一泛函，对 $ab$ 与 $ba$ 同时给出结论。正文把两件事拆开：正向用 $UT=I_m$ 加特征打包（$e$ 与 $Q_\alpha$ 的正交性）造出 $a_{\mathrm{mat}}b_{\mathrm{mat}}=I_m$；反向用一个"夹回子群代数再特殊化"的操作造出 $\Delta\ne0$。两个方向用的代数对象不同，$UT$ 用到 $P_v$ 的群内分解（`02-criterion.tex:78`），反向用到 $X$ 的秩（`:310`--`:318`）。`01-introduction.tex:69` 那句"Two parts of this criterion explain the separation"就是这个意思。

拆开之后我才看清为什么 $e$ 要同时出现在 $C$、$J_0$ 里。它让正向展开里的 $(1-e)$ 部分自动正交，同时在反向夹逼里被 $\varepsilon$ 送到 $1$（`:299`），使 $\varepsilon(e(TU-P))=X^{\mathsf T}X-I_t$。一个中心幂等元同时管住两个方向，这个设计我在第四版草稿才看出来。

## 7 胶合群 $N$ 与嵌入引理：逐行取证

### 7.1 生成元、关系与"短关系有限"

数据源是关联系统 $(V,\mathcal F)$。对每个 $v\in V$ 取 coordinatized 副本 $K_v^0=(\mathbb F_\ell^2,+)$，对每个 $f\in\mathcal F$ 取 $L_f^0=(\mathbb F_\ell,+)$，并在 $v\in f$ 时取单射 $\iota_{vf}:L_f^0\to K_v^0$，其像是 $K_v^0$ 的 $\ell+1$ 个不同一维子群（`02a-embedding.tex:4`--`14`）。生成元是 $s_{f,c}$（$f\in\mathcal F$、$0\ne c\in L_f^0$），共 $|\mathcal F|(\ell-1)$ 个。定义关系是那些"存在 $v$ 属于所有 $f_i$ 且 $\sum_i\varepsilon_i\iota_{vf_i}(c_i)=0$"的带符号字（`:16`--`27`）。

关键工程决定在 `:42`--`:48`：同一个群可由长度至多 $3$ 的关系子集给出。理由是同一 $K_v^0$ 内反复应用乘表关系与逆关系可把任何带符号字约到其和对应的生成元或空字。于是 $N$ 有限展示。`02-criterion.tex:442`--`444` 用的正是这个有限展示，`:455`--`:457` 数了 HNN 步的增量：稳定字母 $|V|$ 个、关系至多 $|V|\ell^3$ 条（指标为 $v\in V$、$u\in K_v$、$r\in\Z/\ell$）。

Lean 侧的对应物在链上文件里能对到名字。`PrescribedPresentation.lean:16`--`19` 证 `Group.IsFinitelyPresented (AssignedDevelopment.Base Inc ell assignment)`，靠 `N_shortRelators_finite`（即 `GluedGroup.shortRelators` 有限）与 `N_shortEquiv`（`PrescribedOutputs.lean:32`--`36` 定义的 `PresentedGroup (…) ≃* AssignedDevelopment.Base …`，来自 `GluedGroup.shortEquiv`）。"短关系"对应 tex 的"长度至多三"。

### 7.2 从一个字等式到一张带权平面图

反设 $s_{f,c}=1$（$c\ne0$）。`02a-embedding.tex:68`--`79` 先做合法性论证：把带符号字上的插入/删除关系取生成的同余，因为每个形式逆对都是定义关系（其超边有入射点），商仍是群且泛性质恰为 $N$ 的展示，故 $N$ 中的等价于此同余。`:76`--`:78` 补了一句：正规闭包表达式里的 $uru^{\pm1}u^{-1}$ 因子可以先用嵌套逆对插入造出 $uu^{-1}$、再把 $r^{\pm1}$ 插进两半之间。我起初把这段当作冗余，后来认定它是必需的：平面图论证只需要"逐次插入删除"这种局部形式，若合法化不写明，整个图的来源就有漏洞。

画法在 `:81`--`:88`：把 successive words 放在水平层上，每个带符号字母当一个 token；两层之间按保持顺序的 token 连线；被插入或删除的连续块在一个新的黑色顶点开始或结束其 token，该顶点标以使对应关系和为零的点 $v$。可平面性来自块的连续性，星形占据其它导线之间的单个间隙。`:90`--`:96` 给权重：每条完整生命周期的线在中点白顶点 $i$ 处细分，靠创建端的边权 $\varepsilon y$、靠删除端的边权 $-\varepsilon y$；初始 token 例外，它有一个标 $f$ 的白色端点，连到删除顶点的边权 $-c$。于是得到黑色标于 $V$、白色标于 $\mathcal F$ 的平面二部多重图，balance 条件是黑点处 $\sum_{a\ni x}\iota(\omega(a))=0$、普通白点处 $\sum_{a\ni y}\omega(a)=0$，唯一例外白点和非零（`:101`--`:105`）。`:111`--`:112` 只保留例外所在的连通分支。

### 7.3 极小化与一次收缩

`:115`--`:118` 的取法把比较类放宽了，这一步是关键：在所有满足标记、非零边权、balance 条件且恰有一个例外白点的连通平面二部多重图中，按顶点数再按边数取字典序极小，且明说这个比较图无需来自某个字归约。放宽比较类是必要的，否则"更小者"可能不在字归约生成的类中，矛盾就推不出来。

两条化简。无平行边：两条平行边的权同属一个 $L_i^0$、黑端同用 $\iota_{vi}$，用其和替换（和为零则删去），再取例外分支，balance 与例外非零和都被可加性保持（`:123`--`:128`）。同标相邻可收缩：断言每个度数 $\ge2$ 的顶点处，循环相邻的邻点标号不同；若相同，用一条沿两条边与它们之间空扇区的辅助弧并收缩，`figures/diagram-merge.tex` 的 caption 记的是白点 $p,q$ 同标 $f$ 在黑点 $x$（标 $v$）的空扇区内合并成 $r$，权 $a,b$ 的两条边成为不同平行边。收缩保持二部性、保持非零权，同色合并时 balance 在同一 $K_v^0$ 或同一 $L_i^0$ 里相加（`:140`--`:149`）。

`02a-embedding.tex:165`--`176` 是面长论证的技术核心，也是我读到最吃紧的一段：度数 $\ge2$ 的顶点处转入转出边不同且在循环序中相邻，其对端标号不同，故边界走在关联图里的像在该转折点无立即回返；这一点对圈的收尾转折同样成立；桥不构成困难，因为桥的两边分别计数，而面边界只在度 $1$ 顶点处沿边立即回返；度 $1$ 顶点至多一个，就是例外白点，它只属于一个面。于是除至多一个面外，每个面的边界在关联图中像为一个无立即回返的非空闭走，含圈，故长度 $\ge12$。

### 7.4 度、面、Euler：一段可复算的数值链

黑度 $\ge3$（度 $1$ 不可能，因 $\iota_{vi}$ 单射；度 $2$ 不可能，因两白邻标号不同而零 balance 会把 $K_v^0$ 两个不同一维子群里的非零向量等同），白度 $\ge2$ 除例外 $\ge1$（`:156`--`:163`）。由 $2E$ 条边侧计得三个界：$n_{\rm b}\le E/3$、$n_{\rm w}\le(E+1)/2$、$n_{\rm f}\le E/6+1$，相加 $n_{\rm b}+n_{\rm w}+n_{\rm f}\le E+3/2<E+2$，与连通平面图的 Euler 公式矛盾（`:183`--`:192`）。`01-introduction.tex:69` 那句"Incidence girth forces a contradiction with Euler's formula for any diagram witnessing a collapsed local element"是对这五十七行的压缩。

我复核了系数的余量：$1/3+1/2+1/6=1$，$3/2$ 与 $2$ 之差 $1/2$ 全靠"至多一个例外面"和 $n_{\rm w}$ 里那个 $+1/2$。任何把例外面数量放宽到 $2$ 的改动都会让 $n_{\rm f}\le E/6+2$，和变成 $E+5/2$，矛盾消失。这个观察与第 16 节"能否降围长"的问题直接相关。

## 8 特征幂等元、扭转共轭与打包

### 8.1 矩形恒等式先立起来

$U\in\operatorname{Mat}_{m\times t}(K[N])$、$T\in\operatorname{Mat}_{t\times m}(K[N])$ 定义为 $U_{-,v}=-\kappa x_vP_v$、$T_{v,-}=P_vx_v^{\mathsf T}$，$P=\operatorname{diag}_{v\in V}(P_v)$（`02-criterion.tex:85`--`91`）。$x_v$ 的条目在系数域里，与所有群代数元素交换；幂等性给 $UP=U$、$PT=T$（`:94`--`:95`）。$UT$ 的计算在 `:96`--`:103`：$UT=-\kappa\sum_vW_vP_v^2=-\sum_vW_v\sum_{u\in K_v}u$，再代入 `:78` 的群内分解，得 $-\sum_vW_v-\sum_{f\in\mathcal F}(\sum_{v\in f}W_v)(\sum_{u\in L_f}u-1)=I_m$，最后一步同时用了 `eq:criterion-pairing` 的两条。这里我核对过符号：特征二是 $2$，故 $-I_m=I_m$，而正文仍写 $-I_m$，为的是让奇特征下的公式形状保持可读；`02-criterion.tex:301`--`302` 那句 "Since the characteristic is two and $\kappa$ is odd" 说明作者清楚这点。

我起初担心 $\sum_{f}(\sum_{v\in f}W_v)(\cdots)$ 里两个因子是否可交换：$W_v$ 的条目在 $K$ 里，$\sum_{u\in L_f}u-1$ 在 $K[N]$ 里，标量与群代数元素交换，所以顺序无所谓。这个疑问值得保留，因为它在 `:286`--`:287` 的反向夹逼里就不成立了，那里两个因子都在 $K[L]$ 里，顺序是实质的。

### 8.2 扭转扩张与它的嵌入证书

$z$ 生成 $\ell$ 阶循环群，$H=N\times\langle z\rangle$；取定 $v_*\in V$，记 $K_*=K_{v_*}$，$\phi_v:K_v\to K_*$ 是按 $\mathbb F_\ell^2$ 坐标相同的同构（`02-criterion.tex:120`--`124`）。$K_*\to\mathbb F_\ell$ 的线性形式恰 $\kappa$ 个，由 $t\le m\kappa$ 可给每个 $v$ 指派槽 $s(v)\in\{1,\dots,m\}$ 与形式 $\alpha_v$，使对 $(s(v),\alpha_v)$ 两两不同（`:125`--`:128`）。

$L$ 由 $H$ 添加稳定字母 $\tau_v$（$v\in V$）与关系 $\tau_v(uz^r)\tau_v^{-1}=\phi_v(u)z^{r+\alpha_v(\phi_v(u))}$（`:134`--`:139`）给出，用的是多重 HNN 扩张。嵌入性我没有走 Britton，正文 `:150`--`:172` 给的是置换表示构造：让 $H$ 在自身上做左乘，限制到 $\psi_v$ 的定义域或像上是 $\ell^3$ 阶子群的正则作用的并；两族轨道基数相同（$H$ 有限时都是 $|H|/\ell^3$，$H$ 无限时都可数无穷，理由是 $H$ 可数而子群有限）。配对这些轨道、取代表 $h_i,k_i$，令 $F_v(ah_i)=\psi_v(a)k_i$（`:159`--`:166`），这个 $H$ 上的双射把 $a$ 的左乘共轭为 $\psi_v(a)$ 的左乘。

`:167`--`:171` 是我最看重的一段：这些指派连同 $H$ 的左正则作用满足 $L$ 的全部定义关系，"no defining relation couples two distinct stable letters"，所以重合的结合子群对各 $F_v$ 的独立选取不加任何相容条件。这条观察解释了为什么本节能同时挂 $|V|$ 个稳定字母：多重 HNN 的相容性难题在这里被关系的形状自动排除。Lean 侧 `HNNPresentation.lean:15`--`:38` 的 `multipleHNN_finitelyPresented` 就是这个多重结构的证明性对应物，它把 `MultipleHNN.con A B φ` 改写成带 `∃ j, x=u j ∧ y=v j` 的 `conGen` 再用 `finitelyPresented_finite_relations`；`:40`--`:53` 的 `characterTwist_finitelyPresented` 先给 `N × C` 上有限展示、再证 source 有限、最后调用前者，与 tex `:448`--`:457` 的"直接积加稳定字母"同构。

`:174`--`:176` 取 $u=1$ 得出每个 $\tau_v$ 与 $z$ 交换，$z$ 在 $H$ 中已中心，故在 $L$ 中中心。中心性是 $e=\ell^{-1}\sum_{r=0}^{\ell-1}\zeta^{-r}z^r$ 成为中心幂等元的前提（`:177`--`:181`）。完整性验证在 `:182`--`:185`：卷积平方里 $z^a$ 的系数是 $\ell^{-2}\cdot\ell\cdot\zeta^{-a}$，重编号给 $ez=\zeta e$，单位元系数 $\ell^{-1}\ne0$ 因 $\langle z\rangle$ 仍嵌入。

### 8.3 $Q_\alpha$ 的正交性

$Q_\alpha=\kappa^{-1}\sum_{u\in K_*}\zeta^{\alpha(u)}u$（`:189`--`:191`）。$Q_\alpha Q_\beta$ 中 $w$ 的系数是 $\kappa^{-2}\zeta^{\beta(w)}\sum_u\zeta^{\alpha(u)-\beta(u)}$；$\alpha=\beta$ 时内和为 $\kappa$，否则取 $u_0$ 使 $\zeta^{\alpha(u_0)-\beta(u_0)}\ne1$，把求和变量平移 $u_0$ 让内和乘上该标量而自身不变，故为零（`:192`--`:201`）。于是 $Q_\alpha Q_\beta=Q_\alpha$（$\alpha=\beta$）或 $0$（`:203`--`:209`）。扭共轭与 $ez^r=\zeta^re$ 合起来给 $\tau_v eP_v\tau_v^{-1}=eQ_{\alpha_v}$（`:211`--`:217`）。

我在验证平移论证时先犯了个方向错：我以为要引用加法特征正交关系的一般群论结论。正文用的是纯有限域上的求和不动性，一行都不引外部定理。这类"自带证明"的选择在 `01-introduction.tex:75` 有总说明：整个直接构造里唯一引进的非初等存在定理是 Linnik 的一致最小素数界，其余（群嵌入、有限矩阵块、插值、概率论证）全部就地证。

### 8.4 打包矩阵与 $J_0C=eP$

$C\in\operatorname{Mat}_{m\times t}(K[L])$、$J_0\in\operatorname{Mat}_{t\times m}(K[L])$ 由 $C_{s,v}=\tau_veP_v$（当 $s=s(v)$）、$(J_0)_{v,s}=eP_v\tau_v^{-1}$（当 $s=s(v)$）给出，其余为零（`:226`--`:241`）。断言 $J_0C=eP$（`:243`--`:246`）：对角项是 $eP_v$；$v\ne w$ 且不同槽时项为零；同槽时用 `:213` 改写为 $eP_v\tau_v^{-1}\tau_weP_w=\tau_v^{-1}eQ_{\alpha_v}eQ_{\alpha_w}\tau_w=0$，因 $\alpha_v\ne\alpha_w$（`:247`--`:254`）。这一步是全篇我最久才看懂的地方：同一槽内允许两个不同点共享槽，靠的就是它们的形式不同，交叉项被正交性杀掉。$t\le m\kappa$ 在这里被用完。

方形元素 $a_{\mathrm{mat}}=UJ_0+(1-e)I_m$、$b_{\mathrm{mat}}=CT+(1-e)I_m$（`:258`--`:261`），正向乘积见 `:268`--`:272`。我数过维数：$(1-e)I_m$ 是 $m\times m$ 的，$UJ_0$ 也是 $m\times m$ 的（$U$ 是 $m\times t$、$J_0$ 是 $t\times m$），闭合。$e$ 与 $1-e$ 把代数分成两块，$I_m=eI_m+(1-e)I_m$，这正是 `:271` 那行的内容。

## 9 反向缺陷：夹逼、定义域限定与秩

### 9.1 $\Delta$ 与其夹逼

$\Delta=b_{\mathrm{mat}}a_{\mathrm{mat}}-I_m$。直接乘法给 $\Delta=CTUJ_0-eI_m$（`:281`）。我手工复核了一遍：$b_{\mathrm{mat}}a_{\mathrm{mat}}=(CT+(1-e)I)(UJ_0+(1-e)I)=CTUJ_0+(1-e)CT+(1-e)UJ_0+(1-e)^2I$；含 $e$ 因子的项与 $(1-e)$ 相乘为零，$CT$、$UJ_0$ 的每项都含 $e$，故中间两项消失，剩 $CTUJ_0+(1-e)I$；减 $I_m=eI_m+(1-e)I_m$ 得 $CTUJ_0-eI_m$。左夹右夹给 $J_0\Delta C=(eP)TU(eP)-eP=e(TU-P)$（`:283`--`:285`），顺序用法是 $(eP)TU(eP)=e(PT)(UP)=eTU$（`:286`--`:288`）。

这里出现一个我起初以为可以简化的地方：能不能直接算 $TU$？$TU=P$ 型的结果不成立。$TU$ 是 $t\times t$，其对角块含 $-\kappa x_vP_v\cdot P_wx_w^{\mathsf T}$，正文只在特殊化之后才说 $TU$ 与 $P$ 的差非零。$P=\operatorname{diag}(P_v)$ 而 $\varepsilon(P_v)=1$（`:299`），所以 $\varepsilon(e(TU-P))=X^{\mathsf T}X-I_t$（`:308`--`:311`）。若 $TU=P$ 成立，整个反例就没了，而这正是 $m<t$ 阻止的事。

### 9.2 $\varepsilon$ 的定义域限定

$\varepsilon:K[H]\to K$，$\varepsilon(nz^r)=\zeta^r$（$n\in N$），因 $H=N\times\langle z\rangle$ 而良定（`:291`--`:298`）。它把 $e$ 送到 $1$、把每个 $P_v$ 送到 $1$（`:299`）。$\varepsilon(U)=X$、$\varepsilon(T)=X^{\mathsf T}$、$XX^{\mathsf T}=I_m$（`:301`--`:305`）。最后一条来自 $\sum_vW_v=-I_m$，在特征二即 $I_m$。

`:323`--`:326` 的三行限定我现在读作方法论声明：$e(TU-P)$ 在 $\operatorname{Mat}_t(K[H])$ 中非零，靠 $K[H]\subseteq K[L]$ 的单射与 `:284` 推出 $\Delta\ne0$；$\varepsilon$ 只对 $K[H]$ 的元素用过，没用到任何向 $K[L]$ 的扩张。我在第 4.6 小节记录的错误路线就撞在这三行上。

### 9.3 非零见证的两种取法

第一种：$t>m$ 取 $0\ne y\in\ker X$，则 $\varepsilon(e(TU-P))y=-y\ne0$（`:312`--`:316`）。第二种是显式的：取 $I_t-X^{\mathsf T}X$ 的第一个非零列；该矩阵非零因为 $\operatorname{rank}(X^{\mathsf T}X)\le m<t$，且 $X(I_t-X^{\mathsf T}X)=0$（`:317`--`:320`）。第二种只用给定向量上的有限域算术。

这个"两种取法"的结构对第 12 节的处方化至关重要。处方要的是可执行定义，"取核里一个非零元"在原则上是有限线性代数，但正文仍给了一条更机械的备选，把选择写死成"第一个非零列"。我在 Lean 侧看到 `PrescribedOutputs.lean:25`--`:29` 的 `prescribed_products` 需要额外提供 `X_global`、`X_local`、`forms_distinct`、`sizes.2.1` 与一个 `convert ... ext i j; split_ifs` 的矩阵一致性证明，说明这些正是形式化里被拆成独立接口的地方。

## 10 有限辅助群与从矩阵到标量

### 10.1 矩阵单位的显式实现

$B=(\mathbb Z/\ell)^m$、$F=B\rtimes S_m$（`:340`--`:344`），$S_m$ 置换坐标。$p_i=|B|^{-1}\sum_{w\in B}\zeta^{-w_i}w\in K[F]$（`:347`--`:349`）。坐标特征互异，`:198` 用过的特征和计算搬到 $B$ 上给出 $p_i$ 两两正交幂等；每个非零因单位元系数 $|B|^{-1}$，分母存在因 $|B|=\ell^m$ 为奇数；关键是"不需要 $|S_m|$ 的逆"（`:350`--`:354`）。这一条我起初当作顺带说明，其实是硬约束：$m!$ 一般为偶数，在特征二里不可逆，任何用到 $|S_m|^{-1}\sum_\sigma\sigma$ 的做法都会当场失效。

$\sigma_i\in S_m$ 交换坐标 $1$ 与 $i$，$\sigma_1=1$，则 $\sigma_ip_1\sigma_i^{-1}=p_i$；$p_{ij}=\sigma_ip_1\sigma_j^{-1}$（`:356`--`:361`）。乘积规则 $p_{ij}p_{kr}=\delta_{jk}p_{ir}$（`:368`--`:370`）：$j\ne k$ 时由 $p_jp_k=0$ 给零，$j=k$ 时直接相消给 $\sigma_ip_1^2\sigma_r^{-1}=p_{ir}$。线性无关性由左乘 $p_i$ 右乘 $p_j$ 隔离出 $p_{ij}$ 的系数得到（`:371`--`:373`）。

### 10.2 $\Phi$ 的单射性与系数比较

$G=L\times F$（`:377`--`:379`），$f_{\mathrm{blk}}=\sum_ip_{ii}$，$\Phi(Z)=\sum_{i,j}Z_{ij}p_{ij}$（`:382`--`:388`）。乘性来自矩阵单位规则，$\Phi(I_m)=f_{\mathrm{blk}}$。单射性的证明在 `:390`--`:396`：群基把 $K[L\times F]$ 认作 $K[L]\otimes_KK[F]$；若 $\Phi(Z)=0$，写 $Z_{ij}=\sum_gc_{ij,g}g$，比较每个 $g$ 的 $L$-基系数得 $\sum_{i,j}c_{ij,g}p_{ij}=0$，由线性无关全为零。我在这一步上犯过一个错：我以为需要某种张量单射性论证，其实只需要"按 $L$ 基系数逐条比较"，这正是群基给出的免费分解。

### 10.3 输出元素与补单位

$a_{\mathrm{out}}=1-f_{\mathrm{blk}}+\sum_{i,j}((UJ_0)_{ij}+(1-e)\delta_{ij})p_{ij}$，$b_{\mathrm{out}}=1-f_{\mathrm{blk}}+\sum_{i,j}((CT)_{ij}+(1-e)\delta_{ij})p_{ij}$（`:400`--`:410`，正文里加了 boxed）。等价地 $1-f_{\mathrm{blk}}+\Phi(a_{\mathrm{mat}})$ 与 $1-f_{\mathrm{blk}}+\Phi(b_{\mathrm{mat}})$（`:412`--`:413`）。由 $f_{\mathrm{blk}}^2=f_{\mathrm{blk}}$ 与 $f_{\mathrm{blk}}\Phi(Z)=\Phi(Z)=\Phi(Z)f_{\mathrm{blk}}$，$1-f_{\mathrm{blk}}$ 双边零化所有像（`:414`--`:421`）。于是 $a_{\mathrm{out}}b_{\mathrm{out}}=1-f_{\mathrm{blk}}+\Phi(I_m)=1$，而 $b_{\mathrm{out}}a_{\mathrm{out}}-1=\Phi(\Delta)\ne0$（`:423`--`:432`）。

`:432`--`:433` 补了一句：这些计算只需要 $f_{\mathrm{blk}}$ 在 $\Phi$ 像上的单位作用。`01-introduction.tex:25` 说 Dykema--Juschenko 的化约是"嵌入矩阵代数到有限群代数并补上互补单位"，`:71` 说"一个有限辅助群把矩阵障碍转成标量输出"，两处指的都是本节。

`:475`--`:479` 是一段防误读的收尾：本节通过展示两个元素证明某个群代数的直接有限性失败，特别地，最后一步没有从"任意环的直接有限蕴含稳定有限"推理，只用了显式 $F$ 与单的 $\Phi$。这正是我路线二的病灶。

### 10.4 有限展示与挠的保留

$N=\langle\mathcal S_N\mid\mathcal R_N\rangle$ 有限（`02-criterion.tex:442`），$H=\langle\mathcal S_N,z\mid\mathcal R_N,z^\ell,[z,s]\ (s\in\mathcal S_N)\rangle$（`:447`--`:450`，用 $[x,y]=xyx^{-1}y^{-1}$）。$L$ 加 $|V|$ 个稳定字母与至多 $|V|\ell^3$ 条关系（`:451`--`:457`，实测计数句在 `:455`--`:457`），故 $L$ 有限展示；用来证嵌入的置换作用是证书，其选择不增加生成元与关系（`:457`--`:458`）。$F$ 有限，乘法表给有限展示；$G=L\times F$ 的展示是两个不相交生成集的展示加上 $L$ 的每个生成元与 $F$ 的每个生成元的交换子，仍有限（`:460`--`:465`）。$K_v\le N\le H\le L\le G$ 且 $K_v$ 的非单位元阶 $\ell$（`:467`--`:472`）。

`OddTorsion.lean:14`--`:35` 把这条挠链做成了具体同态：`diagonalPoint : Multiplicative (ZMod ell) →* GluedGroup.PointGroup ell` 用常值函数，单射性靠取 $0$ 坐标的 `congrArg`；`retainedPoint` 是四层复合（`MonoidHom.inl`、`CharacterTwist.emb`、`ChosenCriterion.inclusion` 及其单射性、`AssignedDevelopment.point`），单射性逐层用 `Function.Injective.comp` 加 `congrArg Prod.fst`。`prescribed_odd_prime_order`（`:37`--`:44`）算 `orderOf` 时连用三次单射改写与 `ZMod.addOrderOf_one`。tex 的 "$K_v\le N\le H\le L\le G$" 在 Lean 里就是这条复合。

## 11 仿射线系统的概率构造

### 11.1 参数链与它的依赖顺序

`04-hypergraph.tex:15`--`:33` 给全部常数：$q=2^h$；$\ell$ 是模 $q^{100}$ 余 $-1$ 的最小素数；$D=\ell+1$、$s=\lfloor\log_qD\rfloor$、$b=s+20$、$n=10b$、$N_{\rm pt}=q^n$；$q^{100}\mid D$、$s\ge100$、$q^s\le D<q^{s+1}$；$D\le(c+1)q^{100L}$ 给 $s\le100L+\log_2(c+1)$，故 $s$ 关于 $h$ 一致有界。$d_0=(q-2)/2$，$S$ 是 `03-pairing.tex:31` 的指标单纯形，$|S|=\binom{d_0+n}{n}$。

`:35`--`:40` 逐条解释每个常数的用途，我第一次读时觉得啰嗦，第二次读才确认这是作者自己的思路记录：$q\mid D$ 让一个束里恰有 $q$ 个方向；$s\ge100$ 让洞选取估计小；$b=s+20$ 的松弛控制后面的事件权重；$n=10b$ 的十倍允许构造中的十重独立子空间，因为短多边形的每一步至多涉及两个这样的子空间，十重直接性覆盖至多五步的形。

### 11.2 方向空间：用 Vandermonde 换掉随机

`04-hypergraph.tex:69`--`:102` 的引理要二维子空间 $W_r$（每束一个）与 $(b-1)$ 维子空间 $E_j$（每指标一个），使列表中任意至多十个成员直和。证法我不意外但很干净：取 $b$ 次扩域 $Q'/Q$，把 $\mathcal A$ 认作 $(Q')^{10}$；对不同 $\xi\in Q'$，向量 $(1,\xi,\dots,\xi^9)$ 任意至多十个在 $Q'$ 上无关，因前 $k$ 个坐标构成可逆 Vandermonde 阵。参数量够：$D+D/q<q^{s+2}\le q^b$（`:91`--`:92`）。每个 $W_r$、$E_j$ 取自己的参数，落在对应一维 $Q'$-空间内并取规定的 $Q$-维数。交验证（`:96`--`:101`）靠"任何涉及 $U_j$ 与 $U_{j'}$ 的等式先要 $E_j$、$E_{j'}$ 分量为零"。$U_j=d_j\oplus E_j$ 是 $b$ 维，交关系列在 `:76`--`:82`。

这里我学到一件事：需要"很多两两独立的小子空间"时，扩域上的有理曲线参数化比随机选取省事，且完全确定。`05-prescription.tex:30` 那句"辅助扩域只是 $Q$-向量空间的一个模型，不要求嵌入 $K$"回答了我对 $Q'$ 合法性的疑问。

### 11.3 洞的选取：三条性质各有去向

`04-hypergraph.tex:130`--`:140` 要 $O\subset S$ 满足洞规模 `eq:hypergraph-hole-size` 与三条性质：(i) 每个 $W_r$ 的平移至多含一个洞；(ii) 每个 $U_j$ 的陪集 $C$ 与每个 $r$ 有 $|O\cap(C+W_r)|\le100$；(iii) 没有例外矩形在四条边线上各有一个属于 $O$ 的不同见证点。例外矩形定义为角 $x,x+u,x+u+v,x+v$，其中 $0\ne u\in e_r$、$0\ne v\in e_{r'}$、$r\ne r'$；某边的见证点是离开该边但落在包含它的 $W_r$ 或 $W_{r'}$ 平移里的点（`:121`--`:127`）。

概率论证（`:142`--`:194`）：记 $M=N_{\rm pt}/D^2$，$|S|\ge q^n/(3^nn!)\ge c_SN_{\rm pt}$（$d_0\ge q/3$，$n$ 有界）；每点以 $\theta=5M/|S|$ 独立入选，$\mathbb E|X|=5M$、$\operatorname{Var}(|X|)\le5M$、$M>q^{n-2s-2}=q^{8s+198}\to\infty$，Chebyshev 给 $\Pr(4M\le|X|\le6M)=1-o(1)$。占用违约用 union bound 压在 $D^2N_{\rm pt}(\theta q^{b+2})^{100}=O(q^{2s+2+n+100(b+2-2s)})=O(q^{2402-88s})=o(1)$。碰撞对与见证四元组用 Markov：$\mathbb EZ/M\le O(q/D+q^8/D^4)=o(1)$，删标记点后 $3M\le|O|\le6M$，落在 `:57` 的界内。`:275`--`:280` 明确把三条洞条件的分工写开：(i) 分离同束内的替换平面并使每对洞的检验落在非零 $E_j$ 分量上；(ii) 控制固定 $P_{j,C}$ 时事件计数里的洞贡献；(iii) 已经排除全由替换线组成的矩形。

替换线的定义在 `:196`--`:207`：$T_r=\bigcup_{o\in O}(o+W_r)$，标签 $R_r$ 的替换线是所有 $o+W_r$ 中方向 $e_r$ 的线，去掉 $o+e_r$ 本身。`:209`--`:224` 证它们避开 $O$、同标签内两两不交、且没有例外矩形四边全是替换线（用到 $W_r\cap W_{r'}=0$ 与相邻边平面只在共享角相交）。

### 11.4 slab 随机变量与两类坏事件

对每个指标 $j$ 与每个 $U_j$ 的陪集 $C$，独立均匀取二维子空间 $P_{j,C}\subset E_j$；$d_j\oplus P_{j,C}$ 的平移把 $C$ 分成三维仿射 slab（`:235`--`:237`）。$u\in U_j$ 记其 $E_j$-分量为 $u^{(E_j)}$。固定的非零 $v\in E_j$ 落入 $P_{j,C}$ 的概率是 $p_*=(q^2-1)/(q^{b-1}-1)\le2q^{3-b}$：$E_j$ 的线性自同构在其非零向量上传递，而每个二维子空间含 $q^2-1$ 个（`:239`--`:245`）。这个概率我复核过分母：$E_j$ 维数 $b-1$，故二维子空间的个数与 Gaussian 系数 $\binom{b-1}{2}_q$ 相关，非零向量总数 $q^{b-1}-1$，比值即 $p_*$。

第一类坏事件是洞对：对每对在 $C$ 里的洞，若它们落在同一 slab 则算坏。它们的差有非零 $E_j$-分量，否则该差会落在 $d_j\subset W_{\rho(j)}$，违反洞条件 (i)（`:248`--`:253`）。该事件恰是那个分量属于 $P_{j,C}$，概率 $p_*$。

第二类坏事件关于 $k$ 步闭环标记序列，$k\in\{3,4,5\}$。步型两种：generic 步 $G_j$ 要求 $u\in U_j$ 且 $u^{(E_j)}\ne0$；replacement 步 $R_r$ 要求 $0\ne u\in e_r\setminus\{0\}$ 且两端点都属于 $T_r$（`:255`--`:261`）。要求至少一个 $G$ 步、循环相邻步标签不同，并且允许顶点重复（`:267`--`:270`）。允许重复顶点这点我起初当作多余，读 `:569`--`:585` 才明白它是刻意放大列表：真正的围长违例给出的多边形是这个大类的子集，先把大类全部排除，最后一步就只剩"归类"工作。$R_r$ 步不要求落在真实替换线上，只要求端点在 $T_r$ 里，`:263`--`:266` 明说这会故意放大可能的多边形清单。

### 11.5 多边形分类：$g$ 只能取 $1$ 或 $2$

`:283`--`:297` 的引理说任何含 generic 步的候选序列必属三形之一：(i) 交替 $G_j,R_r$ 且对边向量配对的矩形；(ii) 交替不同 $G_j,G_{j'}$ 且对边配对的矩形；(iii) 含两个 $G_j$、两个 $G_{j'}$ 与一个 $R_r$ 且 $\rho(j)=\rho(j')=r$ 的五边形。坏事件用 $2g$ 个不同随机变量，概率 $p_*^{2g}$，$g$ 是不同 generic 标签数。

证明里的三步我逐条记下来。第一步：每步至多涉及 $W$-族与 $E$-族中的两个成员，故至多 $2k\le10$ 个空间出现，十重直接性可用（`:300`--`:303`）。第二步：闭合迫使每个 generic 标签的 $E_j$-分量之和为零，故该标签至少出现两次；长度 $\le5$ 的循环非相邻条件允许每标签至多两次，于是 $g\in\{1,2\}$ 且每标签恰两次（`:304`--`:308`）。第三步：$g=1$ 时 $d_j$ 与出现的各 $e_r$ 线性无关，故每个 exceptional 标签也必须出现两次，只剩 (i)；$g=2$、$k=4$ 时标签必交替，$U_j\cap U_{j'}=0$ 迫使对边配对；$k=5$ 时那个 $e_r$-分量必须由 generic 步的 $W$-分量抵消，单靠 $d_j$ 或 $d_{j'}$ 之一抵消不了（它们都不同于 $e_r$），故两个 generic 标签都在束 $r$ 内，得 (iii)（`:310`--`:327`）。

独立性论证在 `:329`--`:337`，我读得最慢：同一 generic 标签 $G_j$ 的两次 occurrence 之间，在一个循环方向上恰有一个中间步；该步标签不同且其向量在 $U_j$ 外，故两次 occurrence 属于不同 $U_j$-陪集（若第一次从 $x$ 起、向量 $u\in U_j$、中间向量 $v\notin U_j$，第二次从 $x+u+v\notin x+U_j$ 起）。不同 generic 标签的变量也互异，于是 $2g$ 个变量全部独立。这一步是 $p_*^{2g}$ 成立的理由，$p_*^{g}$ 会把同一标签的两次 occurrence 记成同一个变量，也是我把 (iii) 的概率写成 $p_*^4$ 的依据。

### 11.6 事件权重逐项复算与 $\mu=O(q^{-7})$

`:341`--`:409` 固定一个变量 $P_{j,C}$，把所有用到它的事件概率求和。逐项：洞对贡献 $\le100^2p_*$（因 $C\subset C+W_r$，$C$ 内洞至多 $100$）；generic 矩形选另一个标签（$\le D$）、起点（$q^b$）、每标签一个向量（$\le q^{2b}$），闭合定其余两个，贡献 $O(Dq^{3b}p_*^4)$；混合矩形 $G_j,R_r$ 的初始 generic 步两端点属于 $C\cap T_r$，能贡献该交集的洞至多 $100$ 个，每个非空交 $C\cap(o+W_r)$ 是 $U_j\cap W_r$ 的陪集，$r=\rho(j)$ 时 $q$ 点、否则 $1$ 点，故 $C\cap T_r$ 至多 $100q$（第一情形）或 $100$（第二情形），选两端点再选 $e_r$ 中至多 $q$ 个 exceptional 向量，对 $D/q$ 个束求和得 $O(100^2(q^3+D))$ 个混合矩形，贡献 $O(100^2(q^3+D)p_*^2)$；五边形另一 generic 标签在束 $\rho(j)$ 内给 $q$ 种，选起点、两个 generic 向量、一个 exceptional 向量至多 $q^{b+2b+1}$，贡献 $O(q^{3b+2}p_*^4)$。

合起来 $\mu\le100^2p_*+O(Dq^{3b}p_*^4+(D+q^3)p_*^2+q^{3b+2}p_*^4)=O(q^{-s-17}+q^{-7}+q^{-s-33}+q^{-2s-31}+q^{-s-6})=O(q^{-7})$（`:398`--`:405`）。我代 $b=s+20$、$p_*\le2q^{3-b}$、$D<q^{s+1}$ 复算了主项：$(D+q^3)p_*^2$ 里 $q^3\cdot q^{6-2b}=q^{9-2s-40}=q^{-2s-31}$，$D\cdot q^{6-2b}=q^{s+1+6-2s-40}=q^{-s-33}$；$Dq^{3b}p_*^4=q^{s+1+3b+12-4b}=q^{s+14-3(s+20)}=q^{-2s-46}$，被 $q^{-s-33}$ 控制，而正文列出的 $q^{-s-17}$ 来自洞对项 $100^2p_*=O(q^{4-b}\cdot q^{3-b})$？我复核的结果是 $100^2p_*\le10^4\cdot2q^{3-b}=O(q^{3-s-20+4})=O(q^{-s-13})$，正文写 $q^{-s-17}$，差别在把 $10^4$ 折进 $q$ 的幂次时用的常数口径；两者都是 $o(q^{-7})$ 量级，不影响主项 $q^{-7}$ 由 $(D+q^3)p_*^2$ 中的 $Dp_*^2$ 给出这一判断。主项 $q^{-7}$ 的来源：$Dp_*^2$ 里 $D\approx q^s$、$p_*^2\approx q^{6-2b}=q^{6-2s-40}$，得 $q^{-s-36}$；$q^3p_*^2=q^{9-2s-40}=q^{-2s-31}$。我最终确认 $q^{-7}$ 这一项对应的其实是把 $s\ge100$ 的下界代入后的保守主阶，正文用 $O(q^{-7})$ 作为对 $\mu$ 的一致上界陈述（`:353`），只要 $q^{-7}$ 大于所有实际项就成立；这一点我登记为"需要复核项"，见第 16 节。

### 11.7 局部引理：自带证明与 $1/16$ 这个阈值

`:411`--`:423` 附近的陈述（实测 `:417`--`:423`）是非对称 Lovász 局部引理的特例，并给了经典条件概率证明：事件由独立随机变量决定，每事件指派至多四个变量；若每个变量上事件概率和 $\le1/16$，则全不发生的概率为正。证明取 $x_A=2\Pr(A)$，由每事件指派集非零得 $0\le x_A\le1/8<1$，邻居和 $\le2\cdot4\cdot1/16=1/2$，于是 $\Pr(A)\le x_A\prod_B(1-x_B)$ 因乘积 $\ge1-\sum x_B\ge1/2$（`:426`--`:438`）。归纳部分对任意不含 $A$ 的子表 $\mathcal S$ 证 $\Pr(A\mid\bigcap_{B\in\mathcal S}B^c)\le x_A$，把 $\mathcal S$ 分成邻居与非邻居，$B_0$ 表非邻居的避免、$D_0$ 表邻居的避免，独立性给 $\Pr(A\mid B_0)=\Pr(A)$，再用 $\Pr(A\mid B_0\cap D_0)\le\Pr(A)/\prod(1-x_B)\le x_A$（`:440`--`:465`）。

阈值的算术我全部复核过：$1/16$ 与 $1/8$ 与 $1/2$ 三处相互咬合，$\mu=O(q^{-7})$ 对大 $h$ 远小于 $1/16$，故 `:467`--`:470` 得出"固定 $P_{j,C}$ 使每 slab 至多一个洞且无任何候选多边形事件"。`:415` 那句 "No resampling algorithm is needed" 是我喜欢的一处坦诚：只需存在性，莫oser--Tardos 的重采样分析在这里是多余的。

### 11.8 slab 内的线划分与 trade 的正则性守恒

`:480`--`:511` 的引理：三维仿射空间方向为 $P\oplus d$（$\dim QP=2$、$\dim d=1$），无指定点时用 $P$ 中任一固定非零方向的平行线；有指定点 $o$ 时取 $0\ne\delta\in d$ 与在 $Q$ 上无特征向量的 $Q$-线性算子 $J$（把 $P$ 认作二次扩域的 $Q$-空间，$J$ 为乘 $\eta\notin Q$；$\eta x=\lambda x$ 有 $x\ne0$、$\lambda\in Q$ 会迫使 $\eta=\lambda$），除 $o+d$ 外用线 $\{o+x+\gamma(Jx)\delta:x\in P,\ \gamma(x)=1\}$（$0\ne\gamma\in\Hom_Q(P,Q)$）。对每个 $x\ne0$，$x,Jx$ 是 $P$ 的基，故每个 $c\in Q$ 恰有一个泛函满足 $\gamma(x)=1$ 与 $\gamma(Jx)=c$；于是 $q^2-1$ 条线划分 $o+d$ 之外的 $q^3-q$ 个点，轴 $o+d$ 供其余 $q$ 个点。这个 $q^2-1$ 与 $q^3-q=(q-1)q(q+1)$ 的整除关系（$q^3-q=(q^2-1)q$）我在草稿上验算过一次，正是它保证划分闭合。

trade 的守恒计数在 `:522`--`:557`。`:539`--`:549` 处理了一个我以为不存在的问题：没有删除操作被请求两次（两洞同用一条初步划分的线意味着同 slab，已被排除）；不同初步划分的线方向属不同 $U_j$ 且交为零，不可能重合；插入线同标签由替换线引理区分，跨标签也不能重合。正因如此，"逐点度变化在所有 trade 同时执行时才真正相加"（`:548`--`:549`）。若这一条不成立，我会遇到两个 trade 争抢同一条线的双记问题，正则度守恒就推不出来。

围长最后一步在 `:562`--`:585`：两条不同仿射线至多共点，故长度 $<12$ 的关联环给出沿 successive 线的 $k=3,4,5$ 个非零步的多边形；循环相邻标签不同因同标签线两两不交；有 generic 步时它是被排除的候选序列之一，每个 generic 步的 $E_j$-分量落在其 slab 方向 $P_{j,C}$ 里，故对应坏事件发生，矛盾；全为 replacement 标签时，出现的各 $e_r$ 方向独立（至多五个 $W_r$ 出现），闭合迫使每标签至少两次、循环非相邻至多两次，唯一可能是对边配对的四步交替矩形，而这被替换线引理排除。

## 12 处方化：把存在性证明改造成终止的有限搜索

### 12.1 搜索对象、顺序与四个测试

`05-prescription.tex:8`--`:29` 把全部选择写成对每个 $h\ge2$ 执行的四步计算。步骤 (1)：$q=2^h$，$\ell$ 为模 $q^{100}$ 余 $-1$ 的最小素数，逐个测试该同余类里的整数是否素数，Linnik 定理保证搜索终止；再由 $D=\ell+1$、$s=\lfloor\log_qD\rfloor$、$b=s+20$、$n=10b$ 定参数。步骤 (2)：$g$ 取 $\mathbb F_2$ 上次数 $h(\ell-1)$ 的字典序首个首一不可约多项式，$K=\mathbb F_2[Z]/(g(Z))$；排序用次数小于 $h(\ell-1)$ 的唯一代表补零后的系数向量。步骤 (3)：$Q=\{x\in K:x^q=x\}$ 带诱导序，$\zeta$ 取 $K$ 中第一个乘法阶 $\ell$ 的元素。步骤 (4)：$\mathcal A=Q^n$ 按字典序，指标单纯形 $S$，子集按指示向量序（$0<1$），于是仿射线、线族、二元组 $(O,\mathcal F)$ 全部有序；对每个 $O\subset S$ 与每个完整仿射 $Q$-线族 $\mathcal F$ 测试四条件：(a) $2q^n/D^2\le|O|\le7q^n/D^2$；(b) $\mathcal F$ 的每条线含于 $\mathcal A\setminus O$；(c) $\mathcal A\setminus O$ 的每点恰在 $D$ 条线上；(d) 关联图无长度 $<12$ 的环。

外层循环从 $h=2$ 起，固定 $h$ 时步骤 (4) 只测有限集与有限图；停在首个成功二元组，全失败则 $h\leftarrow h+1$（`:30`）。选出的便是最小的成功 $h$ 与其序下第一个成功对。这里我注意到一个设计：搜索枚举的是所须关联数据本身，枚举辅助随机选择的做法被明确排除（`:30`--`:31`），因为辅助选择的空间是变量指派族，规模无法控制，而关联数据在固定 $h$ 下是有限的。

### 12.2 唯一性与"无需字等式 oracle"

`:32`--`:34` 固定数据后写 $m=|O|$、$t=|V|$，指示多项式 $f_o$ 与向量 $x_v$ 是 `prop:pairing` 里唯一的那一组，系数可用有限域线性代数算出。`:36`--`:44` 把群侧的每个自由都消掉：$K_v^0=(\mathbb F_\ell^2,+)$ 用标准坐标副本，$L_f^0=(\mathbb F_\ell,+)$ 按残基 $0,\dots,\ell-1$ 排序，$\mathbb F_\ell^2$ 按字典序，一维子群按子集序，再按序匹配到 $v$ 处的 $D=\ell+1$ 条入射线，$\iota_{vf}$ 把 $1\in L_f^0$ 送到被指派方向的第一个非零向量；$v_*$ 取 $V$ 的首点；线性形式按系数对排序，点按序指派给前 $t$ 个 $(s,\alpha)$ 对。`:44` 那句"证 $H$ 嵌入 $L$ 用的正规置换作用是嵌入证书，这样的置换选取不属于群的定义"，是我在本篇读到的最重要一条方法论声明：证书与定义分离，处方只写定义。

`:56` 声明展示式无论不同群字是否代表同一元素都定义有限和，归一化不需要字相等 oracle。`:59` 声明反向缺陷非零靠把 `eq:reverse-sandwich` 右边（在 $\operatorname{Mat}_t(K[H])$ 里）特殊化为 $K$ 上非零矩阵得到，"it does not depend on an unproved inequality between group words"。这两句合起来划定了本篇主张的力度：给出的是代数证书，不是一个跑起来的算法。`01-introduction.tex:18` 也写了处方"未必计算可行且未被执行过"。

### 12.3 主定理的收尾与三条范围声明

`:58`--`:60` 的 Theorem~\ref{thm:main} 证明链条是：有限搜索因 `thm:hypergraph` 而终止；其输出满足 `prop:pairing`，从而满足 `thm:criterion` 全部假设；该定理给出两条乘积断言、给出 $G$ 的有限展示、保留 $\ell$ 阶元素；$\ell$ 为奇素数、`eq:exact-field` 的域是特征二有限域。

`:62`--`:68` 三条范围声明我分别当作三条"防越界"注释：其一，构造显式用挠，$\ell,\ell^2,\ell^3$ 阶子群全为奇阶，分母可逆，有限辅助群里只逆 $\lvert(\mathbb Z/\ell)^m\rvert$；特征二让正则度 $\ell+1$ 作为标量为零；无挠群情形不需任何断言。其二，若 $G_0$ 有限，$K_0[G_0]$ 在任意域 $K_0$ 上有限维（即便特征整除 $\lvert G_0\rvert$），左乘是忠实表示，有限维里 $L_aL_b=I$ 迫使 $L_bL_a=I$，故本篇的 $G$ 必为无限群（`:66`）。其三，任意群与任意两个有限群代数和，其支撑并生成的子群的群代数嵌入原代数，两条乘积断言已在该子群代数里成立或失败，故有限生成对反例自动成立；本篇 $G$ 的有限展示结论来自展示论证，不能从支撑子群有限生成推出（`:68`）。这三条正好对上我在第 4.1、4.2、4.3 节记录的三个错误。

### 12.4 Lean 侧的搜索界

`FinitelyPresented.lean:19`--`:22` 把处方写进主定理的合取：`2 ≤ selectedH ∧ selectedH ≤ 217 ∧ Test selectedInput selectedPair`，加上 `∀ h, Succeeds h → selectedH ≤ h` 与 `∀ p, Test selectedInput p → @LE.le _ (pairOrder selectedInput).toLE selectedPair p`，即"最小成功 $h$ 与该 $h$ 下的序最小成功对"。:26 用 `finite_search_terminates` 供给外层终止性。$217$ 这个上界在 tex 里没有对应数字（tex 只说"足够大的 $h$"），它是形式化里可判定搜索的实际边界，我在第 18 节台账第 45 行登记，并注明它的来源只能是 Lean 侧。

## 13 元胞自动机、非 sofic 与非满射见证

### 13.1 表示与右邻约定带来的乘积顺序

`06-cellular-automata.tex:14`--`:24`：$c=\sum_uc_ua\in K[G]$，$\operatorname{supp}(c)=\{u:c_u\ne0\}$，$(cd)_w=\sum_{uv=w}c_ud_v$（`:17`），$T_c:K^G\to K^G$ 由 $(T_cx)(g)=\sum_uc_ux(gu)$（`:21`--`:24`）。即使 $x$ 无限支撑，该和仍有限；$K$ 有限时它便是记忆为 $\operatorname{supp}(c)$ 的元胞自动机。引理（`:28`--`:60`）说 $c\mapsto T_c$ 是忠实幺单位 $K$-代数同态，$T_c\circ T_d=T_{cd}$、$T_1=\mathrm{id}$。重算过程在 `:43`--`:48`，而 `:49`--`:50` 那句 "the product is $cd$, not $dc$, for this right-neighbor convention" 提醒了本篇唯一一次顺序陷阱：右邻约定下复合顺序与乘积顺序同向。`01-introduction.tex:43`--`:46` 的 $\tau(x)(g)=\phi((x(gu))_{u\in M})$ 用的正是右邻。

忠实性靠 $\delta_h$：$(T_c\delta_h)(1_G)=c_h$（`:52`--`:57`），故 $T_c=0$ 迫使所有 $c_h=0$。这条也是后面构造非满射见证元的机关。

### 13.2 像的有限局部方程刻画

命题（`:64`--`:112`）：$K$ 有限域、$a,b\in K[G]$ 满足 $ab=1$，$M=\operatorname{supp}(b)$，$\phi(p)=\sum_{u\in M}b_up(u)$（`:69`--`:72`），则 $\tau=T_b$ 单射且 $\operatorname{im}(\tau)=\{y:T_{ba}y=y\}$（`:74`--`:77`）。单射由 $T_a\circ\tau=T_{ab}=\mathrm{id}$（`:87`--`:90`）对任意 $x,x'$ 得。像的等式两边：$y=T_bx$ 时 $T_{ba}y=T_bT_aT_bx=T_bx=y$；反向 $T_{ba}y=y$ 时 $y=T_b(T_ay)$。`:114`--`:122` 把 $\operatorname{im}(\tau)=\{y:T_{ba}y=y\}$ 写成一致有限局部方程 $\sum_{u\in\operatorname{supp}(ba-1)}(ba-1)_uy(gu)=0$（$g\in G$），并强调缺失的构形即使在无限支撑函数里也没有原像，论证全程未限制到有限支撑构形。这是我读到的最漂亮的一段"顺手加强"：元胞自动机本来定义在所有构形上，正文就把结论做在全部构形上。

### 13.3 非满射见证与记忆的最小性

$ba\ne1$ 时任取满足 $(ba-1)_h\ne0$ 的 $h$，由 `:56` 得 $(T_{ba}\delta_h-\delta_h)(1_G)=(ba-1)_h\ne0$，故 $\delta_h$ 不被 $T_{ba}$ 固定、由像的刻画排除；`:110`--`:111` 特意为 $h=1_G$ 补了一句，此时 $\delta_h(1_G)=1_K$，该值非零。`:124`--`:132` 讨论记忆无需最小：若 $b=\sum_{j=1}^r\lambda_ju_j$ 是某个有限表达式（允许重复），取 $M'=\{u_j:1\le j\le r\}$、$\phi'(p)=\sum_j\lambda_jp(u_j)$，重复群元素自动合并成同一算子 $T_b$；于是 `eq:exact-outputs` 的有限字表达式给出局部规则，无需判定所显示的字是否代表同一元素的算法。这条对第 12.2 小节的"无需字等式 oracle"是同一件事的两面。

推论（`:134`--`:149`）对 Theorem~\ref{thm:main} 的 $K,G,a_{\mathrm{out}},b_{\mathrm{out}}$ 给出 $T_{b_{\mathrm{out}}}$ 单射非满、像为 $T_{b_{\mathrm{out}}a_{\mathrm{out}}}$ 的不动点集，故 $G$ 非 surjunctive。`:151`--`:157` 又划清边界：特征二用于造代数见证，命题本身不需它；域有限只供有限字母表；见证元的标量形式让字母表取 $K$ 本身，升到 $K$ 上的向量空间这一步并不需要；非零缺陷系数的存在由代数证书给出，不主张有限搜索或群字归一的可行执行。

### 13.4 $F_\infty$ 传递与 sofic 结论的独立性

`:159`--`:192` 把结论搬到型 $F_\infty$ 的群：$G$ 有限展示，配套的嵌入定理给出单射 $i:G\hookrightarrow U$（$U$ 型 $F_\infty$），线性扩张得幺单位代数单射 $i_*:K[G]\hookrightarrow K[U]$（不同群基仍不同），取 $A=i_*(a_{\mathrm{out}})$、$B=i_*(b_{\mathrm{out}})$，则 $AB=1$、$BA-1=i_*(b_{\mathrm{out}}a_{\mathrm{out}}-1)\ne0$；若 $U$ 为 sofic，Elek--Szabó 定理使 $K[U]$ 稳定有限，矛盾；再对 $U,K,A,B$ 用本节命题得 $T_B$ 单射非满，故 $U$ 非 surjunctive。

这段给我一条方法上的启发：$G$ 的非 sofic 性只依赖标量缺陷与一条外部定理，与 $G$ 的构造细节无关（`01-introduction.tex:40` 也这么说）。所以"$G$ 非 sofic"与"$G$ 非 surjunctive"两条结论的取得成本几乎为零，它们是这个构造的赠品。`01-introduction.tex:53`--`:58` 还记了一条同样的赠品：本篇的标量对是配套论文里群代数行列式猜想反例的输入，那边在另一个有限生成群上造出有理群代数中可逆而 Fuglede--Kadison 行列式严格落在 $0$ 与 $1$ 之间的整系数方阵。

## 14 主登记的逐条对照与淘汰证据

### 14.1 主登记陈述与 tex 主定理的形状对照

登记声明 `OAI.KaplanskyCounterexample.finitelyPresented_counterexample`（`formalization.yaml:1267`）在 `OAI/RingTheory/DirectFiniteness/FinitelyPresented.lean:35`--`:40`，逐段读作四行合取：`∃ (K : Type) (_ : Field K) (_ : Fintype K) (_ : CharP K 2)`、`∃ (G : Type) (_ : Group G) (_ : Group.IsFinitelyPresented G)`、`∃ (ℓ : ℕ) (_ : ℓ.Prime) (_ : Odd ℓ) (g : G), orderOf g = ℓ`、`∃ a_out b_out : MonoidAlgebra K G, a_out * b_out = 1 ∧ b_out * a_out ≠ 1`。

对应 `01-introduction.tex:10`--`:16` 的 Theorem~\ref{thm:main}："a finite field $K$ of characteristic two, a finitely presented group $G$ containing an element of odd prime order, and elements $a_{\mathrm{out}},b_{\mathrm{out}}\in K[G]$"，加两条乘积断言。四个成分一对一：`Fintype K ∧ CharP K 2` 对 finite field of characteristic two；`Group.IsFinitelyPresented G` 对 finitely presented；`orderOf g = ℓ` 配 `ℓ.Prime ∧ Odd ℓ` 对 element of odd prime order；`a_out * b_out = 1 ∧ b_out * a_out ≠ 1` 对 $a_{\mathrm{out}}b_{\mathrm{out}}=1$ 与 $b_{\mathrm{out}}a_{\mathrm{out}}\ne1$。变量名 `a_out`、`b_out` 与 tex 的 $a_{\mathrm{out}}$、$b_{\mathrm{out}}$ 同名，两处同名出自同一次写作，算一条归属证据。

`:14`--`:30` 的 `thm_main` 更强，它把存在性结论与处方证书捆在一起：`finite_search_terminates`（`:26`）、`Output.prescribed_finitelyPresented`、`Output.prescribed_odd_prime_order`、`Output.prescribed_products`，再加 `2 ≤ selectedH ∧ selectedH ≤ 217 ∧ Test selectedInput selectedPair` 与两条最小性（`:19`--`:22`）。`finitelyPresented_counterexample := thm_main.1`（`:40`）取的正是第一个合取支。`:33`--`:34` 的文档注释说这条声明是 "the existential main result of the characteristic-two paper, separated from the certificates for its prescribed construction"，其中 "characteristic-two paper" 是我在归属判定上最直接的一条自证。

### 14.2 候选乙被淘汰的四条硬证据与一条旁证

淘汰理由按强度排列。

其一，特征假设相反。`OAI/Algebra/OddKaplansky/Main.lean:71`--`:79` 的 `MainClaim` 头两个 conjunct 是 `sourcePrime.Prime ∧ Odd sourcePrime`，域假设是 `CharP K sourcePrime`（`:73`）且 `Fintype.card K = sourcePrime^4`（`:74`）。`Prescribed.K` 由 `QuadraticTower.CoeffField p` 给出（`:14`），`:19`--`:21` 用 `charP_of_injective_ringHom` 从 `ZMod p` 上拉特征，`card_field`（`:22`）证 $\lvert K\rvert=p^4$。本篇要求 $[K:\mathbb F_2]=h(\ell-1)$（`05-prescription.tex:11`--`:16`），四次方塔在 tex 里没有对应物。

其二，展示强度不足。`MainClaim` 只写 `Group.FG G`（`:75`），`fixed_field_transfer`（`:92`--`:104`）的结论也是 $L\times\Lambda$ 配 `Fintype Λ` 的形式。本篇 `02-criterion.tex:435`--`:473` 用整节证有限展示，`FinitelyPresented.lean:16` 明确带 `Group.IsFinitelyPresented G`，`PrescribedPresentation.lean:21`--`:26` 用 `CurrentMain.characterTwist_finitelyPresented` 与 `CurrentMain.finitelyPresented_prod` 组合出 `Group.IsFinitelyPresented G`。候选乙给不出这条。

其三，挠的形状不同。`MainClaim` 的挠是 `∃ g : G, g ≠ 1 ∧ IsOfFinOrder g`（`:76`），本篇要 `orderOf g = ℓ` 对某个奇素数 $\ell$（`02-criterion.tex:33`、`:467`--`:472`）。`OddTorsion.lean:37`--`:44` 恰好把 `orderOf g = ℓ` 证到位，用的是三次 `orderOf_injective` 与 `ZMod.addOrderOf_one`。

其四，转移机制不同。候选乙的 `fixed_field_transfer` 需要 `3 ≤ Fintype.card K`，用 `FixedField.finite_field_data` 与 `Heisenberg.GroupData M (FixedField.leastQ M hM r)`（`:101`--`:103`），即海森堡型群与最小 $Q$ 界；本篇的有限辅助群是 $F=(\mathbb Z/\ell)^m\rtimes S_m$（`02-criterion.tex:341`--`:344`），两套工具不同源。候选乙也有 `Cellular.operator` 与 `Cellular.theorem_all_configurations`（`:43`--`:54`、`:88`--`:90`），形状与本篇 `06-cellular-automata.tex:64`--`:112` 的 `prop:ca-transfer` 相近，所以只看元胞自动机部分分不出归属，必须靠特征与展示两条。

旁证：`preprints/` 下确有 `A-Counterexample-to-Kaplanskys-Direct-Finiteness-Conjecture-in-Odd-Characteristic-September-26-2026`（实测目录列表，日期 2026-09-26），odd 特征、$p^4$ 域、`Group.FG` 三件事与那一篇题面吻合；`OAI/Algebra/OddKaplansky/Diagrams.lean` 实测 170,753 B，这种单文件规模在本篇没有对应章节，本篇全部图只有 2,705 B 与 1,739 B 两个 tikz 源。

### 14.3 沿 import 链读到的文件与各自承担的 tex 段落

主登记入口 `FinitelyPresented.lean:1`--`:4` 的 import 是 `Mathlib`、`...PrescribedPresentation`、`...OddTorsion`、`...Main`。按链往下读到的清单（绝对路径都在 `E:\math\lean\OAI\RingTheory\DirectFiniteness\` 下）：

- `FinitelyPresented.lean`（2,047 B）：`thm_main` 与登记声明 `finitelyPresented_counterexample`。
- `Main.lean`（387 B）：`theorem main_theorem : MainClaim := Prescription.Output.prescribed_main`（`:9`），自身只 import `PrescribedOutputs`。
- `PrescribedPresentation.lean`（1,044 B）：import `HNNPresentation` 与 `PrescribedOutputs`；`prescribed_base_finitelyPresented`（`:16`--`:19`）用 `N_shortRelators_finite` 与 `N_shortEquiv` 经 `Group.IsFinitelyPresented.equiv N_shortEquiv` 转出。对应 `02a-embedding.tex:42`--`:48` 的"长度至多三的关系子集给出同一群"。
- `OddTorsion.lean`（1,917 B）：`diagonalPoint`（`:14`--`:21`）、`retainedPoint`（`:23`--`:35`）、`prescribed_odd_prime_order`（`:37`--`:44`），对应 `02-criterion.tex:467`--`:472` 的挠链。
- `PrescribedOutputs.lean`（2,318 B，import `ShortRelators`）：`abbrev G := ChosenCriterion.Group …`（`:13`）、`def a`／`def b`（`:15`--`:23`，参数含 `zeta_primitive h`、`X`、`i0`、`slot`）、`prescribed_products`（`:25`--`:30`）、`instance G_fg`（`:31`）、`N_shortEquiv`（`:32`--`:36`）、`N_shortRelators_finite`（`:38`--`:40`）、`prescribed_main`（`:43`--`:47`）。tex 对应：`X` 是 `02-criterion.tex:300` 的 $X\in\operatorname{Mat}_{m\times t}(K)$（列为 $x_v$），`slot` 对应 `:126`--`:128` 的 $s(v)$，`i0` 对应 `:121`--`:122` 取的 $v_*$（处方里为 $V$ 首点），`ChosenCriterion.Group` 对应 $G=L\times F$。
- `HNNPresentation.lean`（2,038 B，import `FinitePresentation`、`CharacterTwist`）：`multipleHNN_finitelyPresented`（`:15`--`:38`）把 `MultipleHNN.con A B φ` 改写成带 `∃ j, x=u j ∧ y=v j` 的 `conGen` 再用 `finitelyPresented_finite_relations`；`characterTwist_finitelyPresented`（`:40`--`:53`）先给 `N × C` 上有限展示、再证 source 有限、最后调用前者。对应 `02-criterion.tex:131`--`:172` 与 `:451`--`:458`。

`prescribed_main`（`PrescribedOutputs.lean:43`--`:47`）只断言 `Group.FG G`，而登记声明断言 `Group.IsFinitelyPresented G`；差值由 `PrescribedPresentation.lean:21` 补上。我一开始把 `prescribed_main` 的 `Group.FG` 当作登记与 tex 不符的证据，随后确认登记用的是 `thm_main.1`，强度足够。这是一次我自己的误读，记下来免得下次重犯。

### 14.4 两处易混点与命名冲突

其一，`main_theorem` 在两个模块里同名：`OAI.KaplanskyCounterexample.main_theorem`（`DirectFiniteness/Main.lean:9`）与 `OAI.OddKaplansky.main_theorem`（`OddKaplansky/Main.lean:81`，即候选乙的登记声明）。按名字检索会同时命中，队列相邻两篇又同属 Kaplansky 家族，所以归属判定必须看陈述形状。

其二，`MainClaim` 也同名：候选乙在 `OddKaplansky` 里定义了带 `sourcePrime` 的版本（`:71`），候选甲链上的 `Main.lean:9` 引用的 `MainClaim` 属 `KaplanskyCounterexample`，其定义在我未读的链外文件里。我对它的内容不作任何断言，只登记"该名字在甲链上被引用而未在甲链已读的这几个文件里定义"。

### 14.5 与拟迹那一篇的边界

`formalization.yaml:1270`--`:1272` 处另有 `ComparatorChallenges/KaplanskyQuasitrace.json`、`OAI.Kaplansky.kaplansky_quasitrace_counterexample`、`OAI/Analysis/Kaplansky/Main.lean`，属拟迹家族，已由别的编号写过。本篇取证全程留在 `OAI/RingTheory/DirectFiniteness/` 一条链上，未读该模块任何文件，未引用其编号。`preprints/` 下的 `A-counterexample-to-Kaplanskys-quasitrace-conjecture-September-23-2026` 与 `A-Torsion-Free-Counterexample-to-the-Kadison-Kaplansky-Projection-Conjecture-September-23-2026` 两篇我也未取用素材。

## 15 最终思路与最初设想的差异

把第 1 节的初始猜想与第 8--13 节的最终结构并排看，差异集中在五处，我按"原本的预期"与"实际形状"分列，并标出差异带来的成本。

第一处：从"两个元素"到"先矩阵、再标量"。我原本预期证明的主线是构造 $a,b$ 本身；实际主体是 $\operatorname{Mat}_m(K[L])$ 里的一对 $a_{\mathrm{mat}},b_{\mathrm{mat}}$，再用 $F=(\mathbb Z/\ell)^m\rtimes S_m$ 的矩阵单位与补单位 $1-f_{\mathrm{blk}}$ 抬成标量（`02-criterion.tex:330`--`:433`）。多付的代价是一整节有限群表示（$p_i$、$p_{ij}$、$\Phi$ 的乘性与单射），换来的是"$AB=I\ne BA$ 不蕴含标量结论"这个障碍被显式跨过。`01-introduction.tex:6` 那两句提示正是这条差异的官方说法。

第二处：从"一个泛函测两端"到"两个方向分派两套工具"。我原本预期有统一的检测泛函；实际正向靠 $UT=I_m$ 与特征打包（$e$、$Q_\alpha$、$J_0C=eP$），反向靠夹逼回 $K[H]$ 再取 $\varepsilon$ 与秩（`02-criterion.tex:276`--`:326`）。代价是必须维护一个不能扩张的特殊化，并把使用范围写死（`:325`--`:326`）。

第三处：从"特征二是为了方便"到"特征二是配对的前提"。我原以为 $2$ 只让 $-1$ 与符号简化；实际 $D=\ell+1$ 在 $K$ 中为零才是 line 与 total 两条恒等式共存的理由（`03-pairing.tex:103`--`:105`、`05-prescription.tex:64`）。附带地，所有需要除的地方必须落在奇数上（`02-criterion.tex:350`--`:354` 明说不用 $\lvert S_m\rvert^{-1}$）。这条差异把我的注意力从"域小一点方便"转到"域里要有 $\ell$ 次本原根且奇数可逆"。

第四处：从"围长是防止局部坍缩的粗略保险"到"围长是 Euler 不等式的系数"。我原本预期一个远大于所需的保守常数；实际 $12$ 处在临界，配合黑度 $\ge3$、白度 $\ge2$、至多一个例外面（`02a-embedding.tex:156`--`:192`）。这条差异让我知道哪些改动是禁手：放宽例外面数、降低面长下界都会让矛盾立刻消失。

第五处：从"存在性证明的产物是抽象存在"到处方化后仍不承诺执行。我原本以为把选择固定下来后可直接宣称算法；实际正文只在两个层面主张：搜索终止（`05-prescription.tex:30`，靠 `thm:hypergraph`）与两条乘积断言有代数证书（`:59`）。`01-introduction.tex:18` 的"未必计算可行且未被执行过"与 `06-cellular-automata.tex:156`--`:157` 的"不主张实际执行"划定强度。Lean 侧同样把证书与执行分开：`selectedH ≤ 217` 与 `Test selectedInput selectedPair` 是可判定陈述，`finite_search_terminates` 是终止性证明，链上没有任何跑出具体字的评估。

还有一条我最初的猜想被完全推翻：我以为反例群需要某种字问题不可判定性的病态；实际 $G$ 有限展示、含 $\ell$ 阶元，并且同时是"每个群都是 sofic"与 Gottschalk surjunctivity 两个猜想的反例（`01-introduction.tex:40`、`06-cellular-automata.tex:134`--`:141`）。病态不在群的算法性质里，在关联几何的短环排除里。

## 16 遗留问题与下一步取证计划

四个问题在读完全篇后仍无答案，按可推进性排序。

其一，$q^{-7}$ 主项的出处。第 11.6 小节的复算里，代入 $b=s+20$、$p_*\le2q^{3-b}$、$D<q^{s+1}$ 后我得到的各项都强于 $q^{-7}$，而正文把 $\mu$ 的一致上界写成 $O(q^{-7})$（`04-hypergraph.tex:353`、`:402`--`:404`）。我目前的解释是：作者给出的是对全部子贡献一致成立的保守阶，且 $s$ 在估计里只用下界 $100$（`:27`--`:33` 只声明 $s$ 关于 $h$ 有界）。这条解释不足以让我满意，下一步应逐子项列表，把 $q^{-s-17}$ 与 $100^2p_*$ 的常数口径对齐（$10^4$ 折成 $q$ 的幂需要 $h$ 的下界，而正文走的是 $h\to\infty$）。

其二，围长能否降到 $10$。`02a-embedding.tex:185`--`:192` 的三个界在 $g=10$ 时给 $n_{\rm f}\le E/5+1$，总和 $E/3+(E+1)/2+E/5+1=31E/30+3/2$，超过 $E+2$，矛盾不成立。也就是说 12 附近是这套极小图论证的下限；真正的 $g=10$ 情形需要另一类比较图。这与 `04-hypergraph.tex:283`--`:297` 的多边形分类能否在 $k\le5$ 之外给出更强排除有关，我没找到答案。

其三，无挠版本。`05-prescription.tex:62`--`:64` 明说不作任何无挠断言；本篇的 $P_v$、$Q_\alpha$、$p_i$ 全是奇阶子群的平均，去掉挠等于删掉三处核心工具。这是否是本类构造的本质限制，我暂无判据。

其四，甲链上未读的模块文件。按约束我只走 import 链上的六个文件（含入口）。同模块里 `SlabAvoidance.lean` 25,499 B、`RibbonGeometry.lean` 14,028 B、`PlanarBalance.lean` 13,807 B、`Pairing.lean` 12,879 B（实测）与 tex 的 `04-hypergraph.tex`、`03-pairing.tex`、`02a-embedding.tex` 标题字面相近，但都不在入口的直接 import 上，我没有读，也不对它们的内容作任何断言。第 7.2 小节的平面图论证与 `PlanarBalance.lean` 的关系是我下一步最想看的一条。

## 17 外部来源与引文边界

### 17.1 我在正文里看到的引文键（未外部核验，登记为待核）

下列名字全部来自 `build/sections/*.tex` 里的 `\cite` 键与上下文句子，属正文素材的一部分。我没有对它们做任何外部核验，也没有读 `build/references.bib`（7,668 B，按约束只登记存在）。因此下表只是"正文自述的先验清单"，每条后面的行号是正文出现该引用的位置：Montgomery 1969（`01-introduction.tex:21`）、Ara--O'Meara--Perera 2002（`:23`）、Elek--Szabó 2004 及其 Corollary 4.7 与 Definition 4.2（`:23`、`:28`、`:40`）、Dykema--Juschenko 2015 及 Theorem 2.2（`:25`、`02-criterion.tex:336`）、Gottschalk 1973（`01-introduction.tex:47`）、Gromov 1999 的 Section 7.G 加撇（`:49`）、Weiss 2000 的 Theorem 3.2（`:49`）、Ceccherini-Silberstein--Coornaert 2006 的 Theorem 4.2（`:49`）、Phung 2023 的 Theorem B（`:49`）、Ceccherini-Silberstein--Coornaert--Phung 2025 的两篇（`:49`）、Xylouris 2011 的 Theorem 1.1（`:73`、`04-hypergraph.tex:18`）、Linnik 1944（`04-hypergraph.tex:16`）、Erdős--Lovász 1975（`:413`）、Moser--Tardos 2009 的 Theorem 1.1（`:415`）、HNN 1949 的 Theorem II（`02-criterion.tex:131`）、Dyn--Floater 2014（`03-pairing.tex:19`）、Golowich--Lin 2024（`03-pairing.tex:22`、`01-introduction.tex:75`）、Dinur--Liu--Zhang 2025（同上两处）、DeterminantCompanion 的 Theorem 1.1（`01-introduction.tex:55`）、UniversalFinftyCompanion 的 Theorem 1.1（`06-cellular-automata.tex:176`）。

正文对其中两条明确划界：`01-introduction.tex:75` 说编码论那两项工作里没有用到任何定理，只借用"次数在乘积下相加、限制到线上不增次数"这两个特征；`:23` 说 Ara--O'Meara--Perera 与 Elek--Szabó 的正结果是对可能反例的群的限制，本篇的群不满足它们的前提。这两句对我判断"哪些引用是承重、哪些是定位"很有用，我在第 4.3 小节按它排除了无挠路线。

### 17.2 外部检索得到的可核对链接

我的两次网络检索只用于确认这条结果在公众语境中的位置与家族关系，未用于任何一步论证。逐条说明它们各自支撑什么：

- https://m.huxiu.com/article/422259.html ：报道单位猜想（Kaplansky unit conjecture）被反例推翻，主体是 Klein bottle 群上的构造，特征是"不等于 2"。它支撑我在第 1 节把"特征限制"当作一等公民看待，也提醒直接有限性猜想与单位猜想在同一家族里的位置差别。
- https://zhuanlan.zhihu.com/p/369516922 ：同一事件的中文长文报道，用途同上，无独立信息增量。
- https://www.360doc.cn/article/535749_973138049.html 与 https://m.huxiu.com/article/422259 ：同题转载。
- https://i.ifeng.com/c/8x1tRMJ9fpF 与 https://k.sina.cn/article_5952915720_162d2490806704yj58.html ：报道这批机器生成数学手稿的整体规模（数百篇），支撑我"本篇属于一个更大的同族产出，相邻论文可能共用关键词"这一归属风险判断，也就是第 14.4 小节两条重名的现实背景。
- https://en.wikipedia.org/wiki/Fibonacci_group 与 https://www.researchgate.net/publication/220169514_Maximal_Subgroups_of_some_Non_Locally_Finite_P-groups ：这两条是检索噪声，与本篇无关，我没有从中取任何断言。登记它们是为了让我的检索记录可复核，避免看起来像挑过有用材料。

需要写清的一条边界：以上链接没有一条用来支撑本篇的构造或证明，本篇所有数学断言的来源都在第 0.2 小节的十个 `.tex` 文件里；所有 Lean 断言的来源都在第 14.3 小节列的链上文件里。若日后要把第 17.1 节的引文键落实到具体文献，必须先读 `references.bib` 并逐条外部核验，届时这条边界要重画。

### 17.3 自检与禁令核对

这一小节只记计数与判定，不引入任何新的数学内容，因此它的落盘不会改动下面任何一项被计量的量。

文件口径类：
- 数学定界符（dollar 符号）总数：2868，规格下限 1000，判定为达标；全篇只用成对的行内定界，块级定界命中 0。
- 逐行计数为奇数的行数：0，判定为达标；行内代码与公式嵌套处曾出现过 8 处奇偶错行，全部作字符级修正后复测归零。
- 一级节（井号两个）数：19，节号自 0 至 18，逐号核对连续，跳号命中 0。
- 二级小节（井号三个）数：51（含本小节）。
- 数值台账数据行数：50，规格下限 28，判定为达标；表头两行按规格逐字书写，各一行。
- 台账单元格内裸竖线字符命中：0，绝对值一律写 `\lvert` 与 `\rvert`，整除一律写 `\mid`；空单元格命中 0，占位横线命中 0。
- 整行只有水平线的行数：0（表头分隔行不计）。

禁令类（全部以字符串计数核对，命中数均为 0）：
- 先否定再转折句式：0。对照关系一律改写成直写两端，或使用"两者的差别在""口径不同"这类平铺句式。
- 引导语五串：0。
- 三字中文长横线字符：0，人名并列用两个减号，数值区间用一个减号。
- 表情符号：0。装饰性加粗列表：0。聊天残留：0。能力声明句：0。小标题复述该节首句：0。

引用与指向类：
- 前向引用核对：正文中出现的全部节号与小节号指向都在本文件里有对应实节。曾有两条错位指向，一条落在本文件没有的更大节号上，一条落在台账里不含该常数的行号上；现分别改为第 18 节台账第 5 行与第 45 行，复测后错位命中 0。
- 归属判定：主登记为候选甲，即 `ComparatorChallenges/KaplanskyFinitelyPresented.json` 与 `OAI/RingTheory/DirectFiniteness/FinitelyPresented.lean` 那条；候选乙（`OddKaplansky`）淘汰，四条硬证据见第 14.2 小节。
- 素材口径判定：正文取材只来自 `build/` 下十个 `.tex`（合计 98,679 字节）；两个 PDF 与 `typst/` 分片未读、未取材；`references.bib` 只登记存在与字节数，未作为论证来源。
- 取证口径判定：Lean 侧只读两条 yaml 行区间、两条 comparator、两个入口文件与候选甲的 import 链（含入口共六个文件），未对 lean 仓做递归检索；`Diagrams.lean` 未读。
- 落盘方式：Write 只用了一次（首批不超过两万五千字节），此后全部用 Edit 追加；已落盘段落未作段落级删改或重排，个别字词与行号指向的字符级修正全部登记在交付报告里。

## 18 数值台账

下表每行一个我实际复核过的量。位置列一律写成 `文件:行`，tex 路径都相对 `preprints/A-Counterexample-to-Kaplanskys-Direct-Finiteness-Conjecture-in-Characteristic-Two-September-23-2026/build/`，lean 路径相对 `E:\math\lean\`。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| `$K$` | 特征二有限域，含 `$\zeta$` | sections/02-criterion.tex:11 | `thm:criterion` 的全部代数 | 改奇特征则 `$D=\ell+1$` 非零，`03-pairing.tex:104` 的对消失效 |
| `$\ell$` | 奇素数 | sections/02-criterion.tex:11 | 所有平均的分母 | 取 `$\ell=2$` 后 `$\kappa^{-1}$` 与 `$\ell^{-1}$` 不存在，$P_v$ 与 $e$ 全塌 |
| `$\kappa$` | `$\ell^2$` | sections/02-criterion.tex:12 | `$P_v$`、尺寸上界、槽数 | 改成 `$\ell$` 则 `$t\le m\kappa$` 不足以分配互异形式 |
| `$D$` | `$\ell+1$`，每点恰此度 | sections/02-criterion.tex:15 | 标量对消与 trade 的束大小 | 改成 `$\ell$` 则 `$q\mid D$` 失，束无法分成 `$q$` 一组 |
| 围长 | `$\ge12$` | sections/02-criterion.tex:16 | 面长下界与 Euler 矛盾 | 降到 10 时 `$31E/30+3/2$` 超过 `$E+2$`，`02a-embedding.tex:191` 失效 |
| `$m,t$` | `$0<m<t\le m\kappa$` | sections/02-criterion.tex:23 | 槽分配与秩差 | 去掉上界则 `$J_0C=eP$` 的非对角项不再全零 |
| 配对 | `$\sum_{v\in V}x_vx_v^{\mathsf T}=-I_m$` | sections/02-criterion.tex:28 | `$UT=I_m$` 的正向证明 | 右端改零则 `$\varepsilon$` 特殊化给 `$X^{\mathsf T}X$` 无从判非零 |
| 线配对 | `$\sum_{v\in f}x_vx_v^{\mathsf T}=0$` | sections/02-criterion.tex:31 | `$UT$` 展开的第二项 | 非零则 `$UT\ne I_m$`，`02-criterion.tex:103` 断 |
| `$P_v$` | `$\kappa^{-1}\sum_{u\in K_v}u$`，幂等 | sections/02-criterion.tex:67 | `$U$`、`$T$`、`$P=\diag(P_v)$` | 分母改偶数则幂等性证明 `$P_v^2=P_v$` 断 |
| 群内分解 | `$\sum_{u\in K_v}u=1+\sum_{f\ni v}(\sum_{u\in L_f}u-1)$` | sections/02-criterion.tex:78 | `$UT=I_m$` | 去掉它则 `$-\sum_vW_v$` 无法拆成线贡献 |
| `$U_{-,v}$` | `$-\kappa x_vP_v$` | sections/02-criterion.tex:89 | `$UT$` 系数配平 | 去掉因子 `$\kappa$` 则 `$-\kappa\cdot\kappa^{-1}=-(1)$` 不成，符号与规模同时错 |
| 扭转关系 | `$\tau_v(uz^r)\tau_v^{-1}=\phi_v(u)z^{r+\alpha_v(\phi_v(u))}$` | sections/02-criterion.tex:136 | `$\tau_veP_v\tau_v^{-1}=eQ_{\alpha_v}$` | 取 `$\alpha_v=0$` 则同槽交叉项存活，`$J_0C=eP$` 断 |
| 轨道计数 | `$\lvert H\rvert/\ell^3$`（有限情形） | sections/02-criterion.tex:155 | `$H$` 嵌入 `$L$` 的置换构造 | 子群阶改 `$\ell^2$` 则两族轨道基数不等，配对不存在 |
| `$e$` | `$\ell^{-1}\sum_{r=0}^{\ell-1}\zeta^{-r}z^r$` | sections/02-criterion.tex:179 | 中心幂等与 `$ez=\zeta e$` | 系数改 `$\ell^{-2}$` 则 `$e^2=e$` 断，`02-criterion.tex:182` 的卷积检验失败 |
| `$Q_\alpha$` | `$\kappa^{-1}\sum_{u\in K_*}\zeta^{\alpha(u)}u$` | sections/02-criterion.tex:190 | 正交性 `$Q_\alpha Q_\beta=0$`（`$\alpha\ne\beta$`） | 平移论证需 `$\zeta^{\alpha(u_0)-\beta(u_0)}\ne1$`，`$\zeta$` 非本原则断 |
| 稳定字母 | `$\lvert V\rvert$` 个 | sections/02-criterion.tex:455 | `$L$` 的有限展示 | 增到 `$2\lvert V\rvert$` 且关系互耦则 `$F_v$` 独立性失，嵌入证明断 |
| 扭转关系数 | `$\le\lvert V\rvert\ell^3$` | sections/02-criterion.tex:456 | `$L$` 有限展示 | 若允许关系耦两个稳定字母，`02-criterion.tex:168` 的独立指派论证断 |
| 打包恒等式 | `$J_0C=eP$` | sections/02-criterion.tex:245 | `$a_{\mathrm{mat}}b_{\mathrm{mat}}=I_m$` | 右端改 `$P$` 则 `$(1-e)$` 交叉项不再消失 |
| 夹逼 | `$J_0\Delta C=e(TU-P)$` | sections/02-criterion.tex:284 | 反向缺陷检测 | 换序成 `$e(UP)T$` 则 `$eTU$` 不成，`02-criterion.tex:286` 的顺序依赖失 |
| 特殊化 | `$\varepsilon(nz^r)=\zeta^r$` | sections/02-criterion.tex:296 | `$X^{\mathsf T}X-I_t$` | 扩张到 `$K[L]$` 需所有 `$\alpha_v=0$`，与打包冲突 |
| 秩账 | `$\rank(X^{\mathsf T}X)\le m<t$` | sections/02-criterion.tex:318 | 见证矩阵非零 | 若 `$m=t$` 则 `$X^{\mathsf T}X=I_t$` 可能成立，缺陷检测断 |
| 有限辅助群 | `$B=(\mathbb Z/\ell)^m$`，`$F=B\rtimes S_m$` | sections/02-criterion.tex:341 | 矩阵单位 `$p_{ij}$` | 用 `$S_m$` 平均需 `$\lvert S_m\rvert^{-1}$`，特征二下不存在 |
| 坐标幂等 | `$p_i=\lvert B\rvert^{-1}\sum_{w\in B}\zeta^{-w_i}w$` | sections/02-criterion.tex:348 | `$p_{ij}p_{kr}=\delta_{jk}p_{ir}$` | `$\ell$` 为偶则 `$\lvert B\rvert=\ell^m$` 不可逆，`02-criterion.tex:353` 断 |
| 标量输出 | `$a_{\mathrm{out}}b_{\mathrm{out}}=1$` | sections/02-criterion.tex:425 | 主定理与元胞自动机推论 | 去掉 `$1-f_{\mathrm{blk}}$` 则乘积为 `$f_{\mathrm{blk}}\ne1$` |
| 缺陷 | `$b_{\mathrm{out}}a_{\mathrm{out}}-1=\Phi(\Delta)\ne0$` | sections/02-criterion.tex:430 | 非 sofic 与非 surjunctive | `$\Phi$` 不单射则推不出标量缺陷非零 |
| `$q,\ell$` | `$q=2^h$`，`$\ell\equiv-1\ (\mathrm{mod}\ q^{100})$` | sections/04-hypergraph.tex:15 | `$D$`、`$s$`、`$b$`、`$n$` | 同余改 `$+1$` 则 `$q^{100}\mid D$` 失，束划分断 |
| 参数链 | `$b=s+20$`，`$n=10b$`，`$N_{\rm pt}=q^n$` | sections/04-hypergraph.tex:21 | `$p_*$` 与十重直接性 | `$n$` 改 `$5b$` 则五步多边形不再被覆盖，`04-hypergraph.tex:301` 断 |
| 洞规模 | `$2N_{\rm pt}/D^2\le\lvert O\rvert\le7N_{\rm pt}/D^2$` | sections/04-hypergraph.tex:57 | `$0<m<t$` 与 `$t/m\le D^2/2-1$` | 上界超 `$N_{\rm pt}/2$` 则 `$t$` 可非正，`03-pairing.tex:95` 断 |
| 参数量 | `$D+D/q<q^{s+2}\le q^b$` | sections/04-hypergraph.tex:91 | 方向空间的存在性 | 改 `$b=s+1$` 则参数不够，Vandermonde 构造断 |
| 采样概率 | `$\theta=5M/\lvert S\rvert$`，`$M=N_{\rm pt}/D^2$` | sections/04-hypergraph.tex:151 | Chebyshev 界 `$\Pr(4M\le\lvert X\rvert\le6M)=1-o(1)$` | 系数 5 改 2 则删除标记点后 `$\lvert O\rvert$` 下界失 |
| 发散量 | `$M>q^{8s+198}\to\infty$` | sections/04-hypergraph.tex:154 | Chebyshev 与占用界 | `$s$` 无上界支撑则此式与 `$O(q^{2402-88s})$` 同时失 |
| 占用违约 | `$O(q^{2402-88s})=o(1)$` | sections/04-hypergraph.tex:168 | 洞条件 (ii) 的概率界 | `$s<28$` 时指数转正，union bound 失效 |
| 标记点 | `$\mathbb EZ/M\le O(q/D+q^8/D^4)=o(1)$` | sections/04-hypergraph.tex:186 | Markov 删除步骤 | `$q^8/D^4$` 不趋零则 `$Z\le M$` 概率不趋一 |
| `$p_*$` | `$\le2q^{3-b}$` | sections/04-hypergraph.tex:242 | 全部多边形事件权重 | 二维子空间计数改 `$q^{b-1}$` 分母则概率阶变，`$\mu$` 界断 |
| 事件和 | `$\mu=O(q^{-7})$` | sections/04-hypergraph.tex:353 | 局部引理条件 | 主项超 `$1/16$` 则 `04-hypergraph.tex:422` 的条件断 |
| 局部引理阈值 | `$1/16$`，邻居和 `$\le1/2$` | sections/04-hypergraph.tex:422 | `$\Pr(A\le x_A\prod(1-x_B))$` 与归纳 | 阈值改 `$1/10$` 则 `$2\cdot4\cdot1/10>1/2$`，乘积下界失 |
| slab 划分 | `$q^2-1$` 条线划分 `$q^3-q$` 点 | sections/04-hypergraph.tex:508 | trade 的守恒计数 | `$J$` 有 `$Q$`-特征向量则线方向退化，划分不闭合 |
| trade 增量 | 删 `$q$` 条插 `$q-1$` 条 | sections/04-hypergraph.tex:523 | 每点净变零、洞失 `$q$` | 插 `$q$` 条则 `$o+e_r$` 上点净增一度，正则性断 |
| 域次数 | `$[K:\F_2]=h(\ell-1)$` | sections/05-prescription.tex:11 | `$\zeta$` 存在与 `$Q\subset K$` | 改 `$h$` 则 `$\ell\mid2^{h}-1$` 无保证，`$e$` 定义断 |
| 搜索起点 | `$h=2$` 起，逐 `$h$` 递增 | sections/05-prescription.tex:30 | 处方终止性 | 起点提到大 `$h$` 仍可停，但 `$\ell$` 测试量与 `$\mathcal A$` 规模指数上升 |
| 群嵌入链 | `$K_v\le N\le H\le L\le G$` | sections/02-criterion.tex:468 | `$\ell$` 阶元保留 | 任一环不单射则 `$\operatorname{orderOf}$` 计算断 |
| 元胞算子 | `$T_c\circ T_d=T_{cd}$` | sections/06-cellular-automata.tex:36 | `$T_a$` 为 `$T_b$` 左逆 | 改左邻约定则复合反号，`$T_{ab}$` 变 `$T_{ba}$`，单射性断 |
| 像的刻画 | `$\im(T_b)=\{y:T_{ba}y=y\}$` | sections/06-cellular-automata.tex:76 | 非满射见证 `$\delta_h$` | 丢 `$ba$` 条件则缺失构形无法用局部方程识别 |
| 主登记强度 | `$\operatorname{CharP}K\,2$` 加 `$\operatorname{Group.IsFinitelyPresented}G$` | OAI/RingTheory/DirectFiniteness/FinitelyPresented.lean:15 | 归属判定证据一 | 只留 `$\operatorname{Group.FG}$` 则与 `$02\text{-}criterion.tex:435$` 不匹配 |
| 处方界 | `$2\le\text{selectedH}\le217$` | OAI/RingTheory/DirectFiniteness/FinitelyPresented.lean:19 | `thm_main` 的证书支 | 该界只存在于 Lean 侧，tex 无对应数字，改动会断可判定搜索描述 |
| 挠证明 | `$\operatorname{orderOf}g=\ell$` | OAI/RingTheory/DirectFiniteness/OddTorsion.lean:37 | `thm_main` 第三合取 | 改 `$\operatorname{IsOfFinOrder}$` 则与 `$01\text{-}introduction.tex:10$` 的 odd prime order 失配 |
| 候选乙强度 | `$\operatorname{CharP}K\,\operatorname{sourcePrime}$`，`$\operatorname{Fintype.card}K=p^4$` | OAI/Algebra/OddKaplansky/Main.lean:73 | 淘汰依据 | 该形状与本篇特征二假设冲突，改判会连带 `$p\mid D$` 类论证 |
| 甲模块规模 | 126 个 `.lean`，569,407 B | 实测（`find` 与 `wc -c`） | 取证边界声明 | 若放开漫游则约束三失，笔记无法保证引用行号可核 |
| 乙模块规模 | 87 个 `.lean`，612,300 B（`Diagrams.lean` 170,753 B） | 实测（同上） | 归属淘汰旁证 | 该单文件规模在本篇十个 tex 内无对应章节 |
| 素材总量 | 十个 `.tex` 合计 98,679 B | 实测（`wc -c` 的 total 行） | 第 0.2 节清单 | 行数引用若与字节清单不符，台账位置列全部失去可核性 |


