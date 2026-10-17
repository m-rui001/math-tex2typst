# D96 研究笔记：残差球上的记忆与样本下界：无噪高斯回归中 streaming learner 的反推笔记

队列行号 122。论文：Subsphere methods for memory--sample lower bounds in noiseless Gaussian regression（OpenAI，2026-09-27），目录 E:\math\preprints\Subsphere-methods-for-memory-sample-lower-bounds-in-noiseless-Gaussian-regression-September-27-2026。本笔记素材全部取自 build\ 下的 .tex 分片（main.tex、preamble.tex、sections\00 至 07、figures\residual-sphere.tex），Lean 取证限定在 formalization.yaml 指定行区间、模块目录 E:\math\lean\OAI\Probability\Subsphere\ 本身与 comparator json。同族队列行 107（D95）在写，我没有读研究笔记下的任何其他笔记，也不与本族任何既存措辞对齐。

## 0. Lean 侧取证记录（先固定证据面）

formalization.yaml 第 1546--1556 行区间里，第 1550--1552 行是本项目注册项：

```yaml
- comparator_config: ComparatorChallenges/SubsphereCurrent.json
  declaration: OAI.SubsphereCurrent.full_current_main_scope
  file: OAI/Probability/Subsphere/Main.lean
```

yaml 第 617--619 行的 bibliography 条目确认标题为 "Subsphere methods for memory–sample lower bounds in noiseless Gaussian regression"，id 指向该 preprint 目录下的 paper.pdf；按派单纪律我没有读 PDF，正文事实一律来自 tex。

ComparatorChallenges/SubsphereCurrent.json 全文很短：challenge_module 为 ComparatorChallenges.SubsphereCurrent，solution_module 为 OAI.Probability.Subsphere.Main，theorem_names 只有 OAI.SubsphereCurrent.full_current_main_scope，definition_names 为空，permitted_axioms 是 propext、Quot.sound、Classical.choice，enable_nanoda 为 false。

模块目录 E:\math\lean\OAI\Probability\Subsphere\ 下有 Main.lean（692 字节）、Model.lean（18346 字节）、Models.lean（3021 字节）与四个子目录 Estimates、Geometry、Kernels、Mixture。Main.lean 的 import 清单值得逐条对照 tex：Estimates.Weighted、Estimates.HalfPrecision、Estimates.AffinePrecision、Estimates.FixedPrecision、Mixture.Domination。它证明 full_current_main_scope 的方式是构造一个 CurrentMainScope 结构体，字段依次是 explicit_precision、Weighted.radius_weighted_full_estimate、half_precision、Affine.all_affine_full_estimate、Fixed.dimension_estimate。

[推测] 这份结构体本身暴露了写作史：explicit_precision 对应 07-beta-mixture 给出的主定理数值系数（正文 00-introduction.tex:254--255 明确说 Theorem s:main 的数值系数来自 beta-mixture 证明），而 half_precision、all_affine_full_estimate、dimension_estimate 分别挂着 04-weighted、05-affine、06-fixed-length 三条支线。definition_names 为空说明 comparator 只考核定理 statement，不考核有限状态模型的 Lean 定义是否与 tex 的 Definition 完全同构；Model.lean 有 18KB 之巨，建模细节大概率比 tex 的 37 行更繁琐。[推测] enable_nanoda 为 false 表明整条证明链刻意避开测度论重武器，只用有限和、beta 恒等式与球面几何初等论证，这跟 01-residual-spheres.tex 里所有密度、条件律都现场证明的做法一致（该文件 :135--137 处原文就说 all normalized densities, conditional laws, and inequalities used here are proved locally，见 00-introduction.tex:136--137）。

另一个细节：main.tex 第 20--27 行的 \input 顺序是 00, 01, 02, 03, 07, 04, 05, 06。07-beta-mixture 被插在 03-stopping 之后、04-weighted 之前。也就是说文件名的前缀编号与最终章节编号脱钩了：编译出来的第 5 节是 beta mixture，第 6 节才是 weighted。[推测] 这是后期重组：beta mixture 先写成附篇（编号 07 像是追加进仓库的），发现它才是主定理数值系数的承担者，就把它提到 weighted 之前，但不愿renumber文件以免打乱 git 历史。这解释了为什么"最终思路"与"最初设想的顺序"在物理层面就留了痕。

目录登记补记（追加，不改上句）：本笔记对应论文在 preprints/Subsphere-methods-for-memory-sample-lower-bounds-in-noiseless-Gaussian-regression-September-27-2026 目录下，队列行号 122，日期后缀 September-27-2026 与目录名逐字一致；取材面是该目录 build/ 下的 .tex 分片，另加 §0 上文所记 records.txt 第 1550 行、模块目录与 comparator json，PDF 全程未读。

## 1. 初始动机与最初猜想（反推）

我把手放在这项工作起点上的位置，是摘要那 8 行（main.tex:9--18）与引言第一句（00-introduction.tex:3--9）：

> "An exact linear equation may contain arbitrarily fine real information. Indeed, \(d\) independent Gaussian equations determine a vector in \(\R^d\) almost surely, because their coefficient matrix has full rank. A streaming learner with finitely many persistent states cannot retain the equations themselves at arbitrary precision."（00-introduction.tex:3--7）

动机在这句话里已经是完整的：精确方程的信息量原则上无限，d 个高斯方程就几乎确定整个向量（不止方向），而有限状态机只能带走有限比特。于是问题被压成一个非常干净的张力：一条精确方程值多少比特？如果状态里只放得下 M 位，样本流要长多少才够把方向估到 epsilon 精度？

我猜最初的研究者（也就是我此刻扮演的这个人）起手并不是冲着 2^{-16} 这种常数去的。合理的起点是 Sharan-Sidford-Valiant 的噪声版（00-introduction.tex:105--115 给了精确对照：他们的 Theorem~1 用各向同性高斯协变量、半宽 2^{-d/5} 的一致噪声，至多 d^2/4 位记忆、成功概率 2/3 要 Omega(d log r) 个样本）。无噪情形天然更简单还是更难？我的反推：直觉上"标签更精确、下界应该更容易证"，所以最初的猜想大概率是"把 SSV 的噪声论证里 2^{-d/5} 的量化误差直接删掉，密度假设变狄拉克条件化，剩下的机械搬运"。00-introduction.tex:113--115 那句 "The exact labels in Definition s:model are more informative than noisy labels, so that noisy lower bound alone does not give Theorem s:main" 就是这条搬运路线宣告失败的官方痕迹：信息更多的一方，旧下界不自动成立，因为下界是单调反方向的：对 learner 越有利的环境，样本下界越难证。

最初猜想我写成这样：把每步观测 (X_t, X_t·s) 视为一个"无限精度超平面"，learner 要在 M 位状态里维护对 s 的后验；有限状态意味着后验只能通过量化摘要传递；那么每块样本能推进的"角度分辨率"至多是 2^{-M/T} 级别。这个朴素计数给出的会是 T ≥ M/(d log(1/epsilon)) 之类的形状，跟真结论 T ≥ 2^{-16} d log2(1/epsilon) 在 d 的次数上就对不上（朴素计数里 M 出现在分子，真结论里 M 只出现在 o(d^2) 假设里）。[推测] 这条"逐比特计数后验分辨率"路线会在第一个需要集中不等式的地方断掉，因为状态转移是自适应的：learner 可以把当前实数样本与旧状态组合出任意精细的判断，量化信道的容量不是逐样本固定的。

真正决定游戏形状的是模型里两个不对称的自由度（00-introduction.tex:18--23）：

> "At every sample index its persistent state has at most \(2^M\) possible values. Its transition and stopping rules may depend on the index, \(d,M,T,\epsilon\), the current state, the entire current pair, and fresh randomness. Computation within a transition is unrestricted."

持久信息只有状态这 2^M 个值，但单步计算无限、且规则可以依赖指标。这就是 Steinhardt-Duchi、SVW、Raz 一线反复强调的分界（00-introduction.tex:93--103），本文把它用到连续无噪回归上。我要把"o(d^2) 位记忆被状态机建模"的机械理由先记下：状态数上限是 2^M，M(d) = o(d^2) 即状态熵相对 d^2 消失；证明里唯一消费 M 的地方是 00-introduction.tex:215--216 "There are at most \((T+1)2^M\) terminal index-state pairs"，即终止阶段对 (tau, 终态) 这一对做并集界。d^2 这个量级不是随手写的：02-subspace-moments.tex 的终止帽概率 (8epsilon/R)^{D-1}（:29）在 D-1 约 c·d 时，帽质量约 exp(-c' d ln(1/epsilon))，要让 (T+1)2^M 个帽盖住概率 2/3，需要 M 至少约 d ln(1/epsilon)/ln2 减去 log T 项；当 M 只比 d^2 低一个 log d 因子时这个矛盾才打得开。换言之 o(d^2) 是"帽计数"与"块归纳可用维数"两头夹出来的允许域边缘，不是从哪篇文献抄的先验阈值。[推测] 当年一定试过 M = o(d) 甚至 o(d log d) 这种更自然的记忆类，但固定长度/停止规则两种表述下的归纳需要残差测试球维数始终保持正比于 d（见 s:stopping 那条 log(1/epsilon) = o(d) 约束，00-introduction.tex:217--220），更小的 M 只会让约束更容易满足，所以定理真正的瓶颈在别处：M 大到 d^{2-o(1)} 时帽计数与维数约束同时失效，d^2 就是那条失效线。这也与 SSV 的 d^2/4 位、Raz 的二次记忆问题同数量级，说明社区早就把 d^2 当作这类线性测量问题的内存墙。

为什么成功阈值取 2/3：纯粹是把"平均意义下不可能"转成"每个信号都不行"的鲁棒常数，00-introduction.tex:61 的 \ge\frac23 与 :73 的逐信号版本只隔着一步积分（:80--83 的证明就一行）。2/3 在帽计数里只贡献一个绝对常数，任何 (1/2, 1) 内的数都行；选 2/3 是为了和 SSV/Raz 系文献的 2/3 保持同行可比。epsilon ≤ 1/10 的作用更机械：它是让 log2(1/epsilon) ≥ log2 10 > 3、帽半径 8epsilon/R 在小角度近似里不顶到全球、以及后面 s:stopping 推出 log(1/epsilon) = o(d) 时把 epsilon 下界留出的自由度；1/10 本身没有神圣性，[推测] 写 1/10 而不用 1/2 是想让 (8\epsilon/R)^{D-1} 在 R=1 附近仍是真收缩（8/10 < 1 时 02 文件 :29 的 min 才走幂律支）。注意 epsilon 没有下界，log2(1/epsilon) 因此可以任意大，这正是定理的卖点：精度成本以 log(1/epsilon) 计,，并非常数。

## 2. 主定理与模型的逐条拆解（四段式第一组）

### 2.1 Definition（有限状态高斯流）

(b) 补中间步骤。观测模型 X_t ~ N(0, I_d)、Y_t = <X_t, s> 逐条读：对固定 s ≠ 0，标量 Y_t 是 N(0, <X_t,s> 方差 = |s|^2 = 1)，但本文不直接算这个边际，是反过来用"给定 X，<X,S> 有密度"（01-residual-spheres.tex:36--43）。模型里最容易被略读的是 :25--28：

> "The learner stops at an index \(\tau\in\{0,\ldots,T\}\) and returns \(\widehat s\in S^{d-1}\). Its output law depends only on the terminal state, \(\tau\), and fresh randomness. Thus the last pair affects the output only through the terminal state."

这一句把"输出不许直接抄最后一个实数标签"写进定义：否则 learner 可以在最后一步用 X_T 解出超平面、以零误差返回该超平面法向的投影方向，样本下界立刻假。允许 tau 取 0 是给"完全不看样本、直接猜"留了入口，帽引理会把它吃掉：猜中任意 epsilon 帽的概率 (2\epsilon)^{d-1} 级别，d 大时低于 2/3 是自动的。

(c) 机械理由。共享种子规则（:30--35）要求 (seed, 初态) 与信号、所有行独立，且"conditional on the seed, initialization carries no signal or sample information"。这是把所有随机化 learner 归约到确定性规则族 + 外部随机性的标准招法：下界对每个种子成立，则对混合成立。:37--45 的可测性条款（联合可测 vs 完备化可测）是为 Borel 引理服务的工程保险：定理允许转移核只关于 gamma_d(dx) dy 的完备化可测，随后 Lemma s:borel 几乎处处换成 Borel 版本，归纳比较才有逐点函数可用。T 是确定性有限视界（:46），排除"自适应 horizon 本身携带信息"的漏洞，因为 tau ≤ T 的枚举计数 (T+1)2^M 依赖 T 是常数。

(d) [推测] 候选失败路线一：让规则只依赖状态不依赖指标（齐次自动机），以为"反正指标可写进状态"。断点：状态位预算会被指标编码吃掉，M = o(d^2) 下能编码的指标数远小于 d log(1/epsilon) 所需块数，模型直接弱化到无法覆盖真实算法；论文 :20--21 特意写 rules may depend on the index 就是为了把这条捷径堵在自己定义之外，避免被"你排除了正常实现"反驳。[推测] 候选失败路线二：把"最后一条样本不许进输出"弱化为"输出可依赖最后一条样本但需 Lipschitz"。断点：任何非零实数直通输出都让帽计数失效，s:state-maximum 之后整套块归纳建立在"块内数据只通过离散状态离开"上，一步放水全盘皆输。[推测] 候选失败路线三：用互信息/容量论证替代状态枚举（把信道看成 M 比特/样本的沟通复杂度问题）。断点：本模型单样本信道容量无限（实数进、实数出，只是存不下），容量类下界如 Raz 的分支程序框架处理的是输入压缩，而这里的难点恰在无压缩输入 + 压缩存储，直接搬 SWIG 类机器会先要在"每批观测条件化到残差球"处断链，而那正是本文核心引理的位置。

### 2.2 Theorem s:main（显式无噪精度界）

(a) 00-introduction.tex:53--67，结论 T ≥ 2^{-16} d log2(1/epsilon)，阈值只依赖记忆序列 M，对 epsilon 一致（:85 "The dimension threshold is uniform in the accuracy"）。

(b) 补链：假设 Prob{arccos <ŝ,S> ≤ epsilon} ≥ 2/3。若 T < 2^{-16} d log2(1/epsilon)，块归纳给每个可达终态 v 的后继成功率在维数 D ≈ d - o(d) 的仿射子球上 ≤ 某帽估计，把所有 (tau, v) 对求和 ≤ (T+1)2^M · (上界)。要压过 2/3 需要 2^M · (8epsilon)^{c d} ≤ 1/3 量级，取对数得 M ln2 ≥ c d ln(1/epsilon) - O(d) - ln ln(3/2)。当 M = o(d^2) 且 T = O(d log(1/epsilon)) 时 s:stopping 证明 log(1/epsilon) = o(d)，于是 c d ln(1/epsilon) 主导 M ln2 = o(d^2 ln 2)，矛盾。2^{-16} 就是这条链里所有绝对常数（beta 矩乘积界、帽子前因子、混合比较指数、块长选择）的累积倒数取安全下界。

(c) 为什么恰好 16 次幂：00-introduction.tex:239--241 给了锚点，weighted 定理里 h = floor(d/16)，状态选择只花 W^{1/h}，W ≈ 2^M · T 相关，1/16 来自把矩阶取得足够小使每块只扣 2 个测试维数仍留正比例维数（"a block costs only two test dimensions" :202--204）。2^{-16} 与 h=floor(d/16) 大概率同一族常数：块数约 16、每块样本数约 d/常数、每块成功率的损失约 2^{O(1)} 级别，16 次幂是给 h 取整损失 + beta 乘积尾项 + W^{1/h} ≤ 2^{M/h} 中 M/h ≥ d/16^{-1}... 逐层留余量后的整数指数。[推测] 真要优化的话这是全链条最肥的靶子：把 16 改小直接线性改进系数，但每一步都要重开 epsilon 范围与 d 阈值。为什么 log 以 2 为底：M 以比特计，2^M 个状态，log_2 让 (T+1)2^M 计数中比特与样本天然同单位；换成 ln 只动 2^{-16} 里的 ln2 因子。

(d) [推测] 失败路线一：先证 noisy→noiseless 的单调化（让噪声方差趋 0 取极限）。断在定理 statement 层：噪声消失时 SSV 的密度假设退化为奇异测度，他们全局 L^2 密度论证（:130--133 明确对比）失效。[推测] 失败路线二：把 2^{-16} 当作可任意小的"存在性常数"，先用非构造性紧论证证 T ≥ c d log(1/epsilon)。断在维度阈值一致性：非构造常数无法保证 "uniformly for 0 < epsilon ≤ 1/10"，因为 c 若依赖 epsilon 区间端点的紧致性抽取，d 阈值就会随 epsilon 漂移，而 :85--88 的推论形态（epsilon = d^{-r} 给 r d log2 d）要求阈值先看 M 后统一。[推测] 失败路线三：直接对单个 epsilon 证下界再取并集。断在有理点可数性之外：epsilon 区间连续统，逐点界要过 Borel-Cantelli 式一致化，需要输出事件对 epsilon 单调（arccos 帽确实单调），但状态枚举数 (T+1)2^M 依赖 epsilon（通过 T 的选择），逐点并集会在 M 与 epsilon 关系上漏条件，正文干脆声明"no relation between accuracy and memory is assumed"（:86--87）就是在堵这个洞。

## 3. 01-residual-spheres：块到底留下了什么

### 3.1 Lemma s:borel（一致先验下的 Borel 版本）

(a) 01-residual-spheres.tex:10--16 陈述；:17--55 证明。关键句 :49--52 "Couple the original and Borel finite kernels using the same fresh uniform random numbers. Their choices agree outside \(Z\), so induction makes their state paths and stopping indices identical almost surely."

(b) 中间步：固定 (v, t)，把"继续/停止/去哪个态"合成带标记的有限目的分布，得到关于 (x,y) 的有限个完备可测非负函数、逐点求和为 1。逐坐标取 Borel 版本（简单函数逼近 + 可数多个水平集模零替换为 Borel 集），在"和不为 1 或出现负值"的坏集上换固定点质量。坏集为什么可数并仍零：指标 ≤ T、状态 ≤ 2^M，有限。每对 (X_t, <X_t,S>) 关于 gamma_d dy 绝对连续：给定 x ≠ 0，<x,S> 是均匀球面坐标的 |x| 倍，坐标有密度（:36--40，密度显式式即 :105--110 的 c(D,l)(1-|t|^2)^{(D-l-2)/2}），x=0 是零测高斯事件。自适应路径碰坏集的概率用 :46--48 的单调界压住。

(c) 为什么需要这整个引理：后续所有"块后成功率 ≤ max_v F_v(K)"的逐点函数演算要求 g_v Borel；完备化可测函数不能直接塞进 Fubini-逐点-max 链条里做归纳，因为 max 不保完备可测的逐点一致。d ≥ 2 是坐标有密度的最小维数（d=1 时球面只有两点，坐标是 ±|x|，无密度）。

(d) [推测] 失败路线一：跳过 Borel 化，直接在完备化可测类里归纳。断在 s:state-maximum 的 max_v 之后还要对 K 求期望、对 t,e 求期望的三层交换，可测性缺口会在"坏种子集合随 v 变化"处爆。[推测] 失败路线二：对每个种子单独选 Borel 版本后再联合可测化。断在 :67--70 原文已经写明："We may therefore average those original probabilities afterward; no jointly measurable choice of Borel versions across seeds is needed"，当年若强求跨种子可测选择，会掉进选择公理式的 Borel 提升不存在问题。[推测] 失败路线三：把模型定义直接改成 Borel 规则，省掉引理。断在 comparator/Lean 侧：Models.lean 若把可测性写死为 Borel，会失去覆盖"只用 Lebesgue 可测规则写自然实现"的普适性声明，审稿角度这是削弱定理适用面。

### 3.2 Lemma s:coordinates 与 beta 分数

(a) :95--114 陈述，:115--139 证明；:141--146 的估计 "so \(c_D\le\sqrt D\)"。

(b) 中间步全部在原文 :116--134：U = G/|G|，G 分解为 E_1 ⊕ E_2 的独立高斯；平方长度/2 是形状 l/2 与 (D-l)/2 的独立 gamma；(A,B) -> (qv,(1-q)v) 雅可比 v；密度分离出 beta(q) × gamma(v)，得 q 与 v 独立且 q ~ Beta(l/2,(D-l)/2)；对 E_1 取极坐标得投影密度 c(D,l)(1-|t|^2)^{(D-l-2)/2}，归一常数 c(D,l) = Gamma(D/2)/(pi^{l/2} Gamma((D-l)/2)) 来自 beta 积分乘 |S^{l-1}| = 2 pi^{l/2}/Gamma(l/2)。

(c) 机械理由：指数 (D-l-2)/2 里 -2 是 l 维球坐标的面积元 |t|^{l-1}dt 归一后的余量；l=0 或 l=D 端点用点质量解释（:112--113），避免形状参数为 0 的 beta；D-l=1 时指数可达 -1/2（:135--137），可积因为 -1/2 > -1。c_D ≤ sqrt(D) 的证明：归一化 integrand (1-t^2)^{(D-3)/2} 在 |t| ≤ D^{-1/2} 上 ≥ 1/2（指数 ≥ 0 时用 Bernoulli，指数 0 即 D=3 直接），该区间测度 2/sqrt(D)，故 1 = c_D × integrand 积分 ≥ c_D × (1/2)(2/sqrt D)。这一步 :144--146 自述"keeps all cap constants exponential"：c_D/2 · delta^{D-1} ≤ sqrt(D)/2 · delta^{D-1}，多项式前因子在 (D-1) 次幂的收缩面前无害，帽界才敢把所有常数塞进底数（02 文件的 8epsilon/R 就是这么来的）。

(d) [推测] 失败路线一：用表面积比 |S^{D-1}| 直接算帽。断在 D 变化时面积常数丑陋且需要 Stirling，不如密度 + Bernoulli 一刀。[推测] 失败路线二：把 Beta 律写成 Jacobi ensemble 特例引用大文献。断在 Lean 侧：json 的 permitted_axioms 只有三条基础公理且 nanoda 关闭，引用矩阵值分布论等于自杀；tex :136--137 也说了全部现场证明。[推测] 失败路线三：对 l 连续参数化（分数维数）以统一各支。断在 :137--138 "The endpoint decompositions require no beta law with a zero shape"：连续化后 l→0 的形状参数触发 Gamma 极点，反而多一套留数处理。

### 3.3 Lemma s:beta-identities（矩与乘积）

(a) :148--170 陈述；实数阶矩 :150--156 条件 q < A、发散条件 q ≥ A；整数积形式 :159--161；乘积封闭 :167--169。

(b) 中间步：E Z^{-q} = B(A-q,B)/B(A,B) 要求 A-q-1 > -1 即 q < A，q ≥ A 时原点发散（:172--174）；Gamma 递推把实数式化简为 prod_{t=1}^h (A+B-t)/(A-t)；乘积封闭用三个独立 gamma G1,G2,G3：Z = G1/(G1+G2) 与 G1+G2 独立，故 Z 与 X = (G1+G2)/(G1+G2+G3) 独立，ZX = G1/(G1+G2+G3) ~ Beta(A, B+C)。

(c) 机械理由：逆半径矩的阶必须严格低于第一个形状参数，这就是后文所有 "finite beta products"（00-introduction.tex:207--208）的来源：残差半径 rho = r sqrt(t)，t ~ Beta((D-b)/2, b/2)（:224），任何 rho^{-2h} 型因子要求 2h < (D-b)/2 之类的间隙，块长 b 与矩阶 h 的取舍全部由此驱动；q ≥ A 发散的声明是防止后文在 D-b 缩水到接近 0 时仍套用乘积式。h=0 空积为 1（:161）是 Lean 里 prod_range 空情形的明示。

(d) [推测] 失败路线一：只用二阶矩。断在逆半径期望 E t^{-1} 当 b/2 ≥ 1 且 (D-b)/2 ≤ 1 时发散，一阶就顶到 A 边界，二阶更糟;必须把阶 h 压到维数的一半以下并配合块数。[推测] 失败路线二：引用 beta-gamma 演算全集。断在自查性：整个下游只需要三个恒等式，引大而 full_current_main_scope 的审计面。[推测] 失败路线三：绕开 beta 乘积、用 Stirling 逐项估 Gamma 比。可行但会把 2^{-16} 恶化成含 ln 项的脏常数;乘积封闭让 (D-b)/2 形状的迭代在归纳步保持同族,是"矩阶 ∝ d 仍显式可算"的结构原因。

### 3.4 Lemma s:residual（精确残差律：全篇心脏）

(a) :213--234 陈述，核心式 :221--226：

> \[ s=z+r\sqrt{1-t}\,e+r\sqrt t\,v,\quad t\sim\Beta((D-b)/2,b/2),\ e\sim\sigma_{R_X},\ v\sim\sigma_K, \]

加"labels are Xs = X(z + r sqrt(1-t) e)"与边际反转："Marginally, \(t\) is independent of \((e,K)\), \(e\) is uniform on \(S(H)\), and, conditional on \(e\), \(K\) is uniform among the \((D-b)\)-dimensional subspaces of \(H\cap e^\perp\)."

(b) 中间步：X 限制到 H 秩 b 几乎必然（b < D 条件 :217 保证）；给定 X 用 s:coordinates 于 H = R_X ⊕ K，|P_{R_X} omega|^2 = 1-t 的律是 Beta(b/2,(D-b)/2)，本文写成 t = |P_K omega|^2 ~ Beta((D-b)/2, b/2)（形状对调与命名方向一致）；v 是 K 中均匀方向且与 t,e 独立（坐标引理的分量方向独立性）；Xv = 0 给出标签恒等；给定 X 时限制映射 R_X 上单射，故标签恰好决定 r sqrt(1-t) e（即 p）；反转顺序用 :187--207 的一致正交标架论证：先取 H 的一致标架、前 b 向量张 R_X、第一向量作 e，则给定 e 后剩余标架在 H ∩ e^⊥ 中仍一致，后 D-b 个向量张一致的 (D-b) 维子空间，而 beta 律不依赖标架，故独立声明成立。

(c) 机械理由：b < D 是残差维数 D-b ≥ 1 的生存条件，b = D 时 t 塌成 0、rho = 0、"残差球"退化为一对点，learner 反而完全确定 s（d 方程解向量），下界失效的正是这一侧，所以块的样本数必须严格小于测试维数；z ⟂ H、|z|^2+r^2 = 1 是仿射子球参数化（00-introduction.tex:144--146 的式 s:affine-sphere），把"信号在单位球"翻译成"半径平方预算 r^2 = 1-|z|^2"；t 的形状对 (D-b)/2 ，并非 (D-b)：球面测度的平方投影天然是半维数 beta，这个 /2 一路传导到逆矩条件 h < (D-b)/4 级别的间隙。摘要那句 "The proof conditions each batch on its observed projection and controls the resulting random residual subsphere"（main.tex:16--17）说的就是本引理 + :163--166 的"条件在观测投影 p 上时 K 在 E = H ∩ p^⊥ 的 (D-b) 维子空间上均匀"。注意 :300--304 的防御声明：残差空间是"analysis variables"，learner 拿到的是 X, Xs 全数据；本引理不做任何"给定可达状态的后验是均匀"的错误宣称，后验均匀只在把 X 的具体实现换回随机变量时按条件律成立。

(d) [推测] 失败路线一：贝叶斯后验路线，宣称"给定状态后 s 的条件律集中在残差球上，直接对该后验算信息量"。断在状态是 (X, Xs) 的任意函数：给定 v 事件既包含行信息又包含投影信息，后验不是子球，是子球与数据依赖壳的交；本文改用"目标先取子球均匀、块后条件律恰好是更小残差子球"的对称化，v 的信息全部塞进 g_v 的 max。[推测] 失败路线二：QR/Gram-Schmidt 显式分解 X 来做坐标变换。断在一致性：Householder/GS 的符号分支使雅可比带奇异因子，:187--207 用 Mezzadri 式"一致标架 = 高斯矩阵极分解像"的整体不变性绕开逐向量构造的符号账。[推测] 失败路线三：条件在行张成子空间，并非投影 p 上做归纳。断在 :162--166 指出的事实：条件在子空间上时 p 仍随机且与 K 纠缠；条件在 p 上 K 才成为 E = H ∩ p^⊥ 中的均匀子空间，矩归纳的"每块只扣 2 维"依赖这个分离。

### 3.5 Lemma s:state-maximum（块平均：状态选择一次付清）

(a) :276--291 陈述，核心不等式 :285--288：

> \[ \E_{X,s}\sum_v\kappa_v(X,Xs)g_v(s)\le \E_{t,e}\E_{K\mid e}\max_v F_v(K). \]

(b) 中间步：给定 X（连同 t, e，因为标签决定 p = r sqrt(1-t) e），u 在 K 上均匀且与 κ 的可测依赖相容，条件均值 = Σ_v κ_v(X, X z') F_v(K) ≤ max_v F_v(K)（用 Σκ ≤ 1、F_v ≤ max）；右侧与 X 的其余部分无关，只剩 (t,e) 的边际与 K|e 的条件律，套用 s:residual 反转段。左边是递归 s:recursion（:76--79 G_in(s) = E_X Σ_v κ_v(X, Xs) G_v(s)）的双边形态：κ 可加权和 ≤ 1 允许"停止分支"混入（停止的 g 视为终端帽函数）。

(c) 机械理由：W^{1/h} 税率的出处在 00-introduction.tex:179--184：E_K max_v F_v ≤ (Σ_v E_K F_v^h)^{1/h} ≤ W^{1/h} sup_v (…) 的 Hölder 链条；max 前置于 X 边际化是关键次序，若先对 X 取平均、状态选择就会退化成逐实现的自适应赌博，归纳假设无法传递。κ_v 权重 Borel 非负、和 ≤ 1 三个条件各自对应：可实现转移核的合法性、测度不增、以及停止概率可以缺失（≤ ，并非 =）。

(d) [推测] 失败路线一：直接对 E Σ_v κ_v F_v 用全期望公式逐状态归纳、不设 max。断在 κ_v 与 F_v(K) 正相关：状态 v 恰好在 K 对其有利时被选中，逐点期望的乘积界需要 κ 与 K 独立，模型明确允许相关。[推测] 失败路线二：把 max 换成 Σ 并把 W^{1/h} 换成 W。断在税率：W ≈ 2^{M+log T}，M 近 d^2 时 W 指数级，Σ 形式要求 h ≥ M/d 与 h ≤ c d 冲突。[推测] 失败路线三：用 Doob optional stopping 处理 κ 的自适应选择。断在 κ 不是鞅增量，是任意核，optional sampling 的适配版本反而引回同一 Hölder 界。

## 4. 03-stopping：维度预算是从终止计数里挤出来的

### 4.1 章旨（逐字）

> "Each block estimate below loses two dimensions. Before iterating it, we must know that enough dimensions remain. Terminal state counting gives this fact on any putative short run."（03-stopping.tex:3--5）

约定 :9--11 全程 W = 2^M、log2 以 2 为底、成功对独立均匀信号平均。

### 4.2 Lemma s:terminal-count（终止计数与垫圈）

(a) 03-stopping.tex:13--26，两条界 :17--19：

> \[ \Prob(\mathrm{success})\le (T+1)W(c_d/2)\epsilon^{D-1}\text{ 型两支：}(c_d/2)\epsilon^{d-1}\text{ 与 }(2\epsilon)^{d-1}; \]

准确逐字为 :17--19 的 (T+1)W(c_d/2)epsilon^{d-1} 与 (T+1)W(2epsilon)^{d-1}，垫宽 :23--25 W_* = (T+2)W。

(b) 补链：对每个终止对 (t,v)，到达概率 q_{t,v}(s) 放大为 1，输出律 pi_{t,v} 与目标无关，积分成单个角帽质量；角成功蕴含弦误差 ≤ epsilon（单位向量弦-角单调链条在 02 文件 :44--45 已证），套 s:caps 两条帽界。对每个满足 Borel 引理的种子逐种成立，再回平均。垫圈构造 :42--46：把每个已停状态连同其原停止指标变成吸收态、忽略后续样本、最后层用原输出律；任一层活跃态 ≤ W、吸收标签 ≤ (T+1)W，故 W_* = W+(T+1)W = (T+2)W，含 0 号停止。

(c) 机械理由：(T+1)W 是"终止指标 × 终态"笛卡尔积，这就是 M 进入整篇证明的唯一物理通道；两条界分别来自 02 文件 :15--18 与 :21--23，前者带 c_d/2 更锐、后者纯角形式更干净，short-run 用锐版本，其他场合用角版本。W_* 的 +2 是吸收标签加活跃预算的合成余量，保证垫后仍是同族模型（规则可按层查表），归纳里"短尾块补未用新行"（04 文件 :285--286 同款手法）因此合法。

(d) [推测] 路线一：不对终止对枚举，改用"输出分布的支撑基数"论证。断处：输出律可含外部随机性，支撑可以是整球；只有把"给定 (t,v) 输出与目标无关"这一信息限制用满才见帽，枚举是唯一入口。[推测] 路线二：不垫圈，对 tau 分层归纳。断处：块归纳要求每个边界都从层 i 满长度出发，早停让"块"参差不齐，s:state-maximum 的 kappa 权重和 ≤ 1 只覆盖单块；垫圈把 ≤ 变成 =，一步买到均匀长块。[推测] 路线三：把 (T+1)W 换成可达状态集大小以省 log T。断处：可达性依赖信号，逐 s 变化的可达集破坏"q_{t,v} ≤ 1 放大"的无条件性，省下的 log T 会在别处以更坏形式回来。

### 4.3 固定 alpha 精度区的插曲

> "For a fixed \(\alpha>0\), accuracy \(\epsilon=2^{-\alpha d}\) therefore requires \(T\ge2^{(\alpha-o(1))d^2}\) when \(M=o(d^2)\)."（03-stopping.tex:55--57）

(c) 这段是"输出限制何时已经决定性"的定位器：把 T+1 ≥ (4/(3c_d)) 2^{-M} epsilon^{-(d-1)} 反解，epsilon 指数级小时帽计数本身给出 d² 量级样本，块方法无需登场。它同时宣告：块方法真正要吃的区间是 epsilon 亚指数（含 d^{-r}）那里，帽计数只贡献 log epsilon 的线性依赖来源。这段在正文的位置（:49--59）暗示写作顺序：先有终止计数，再找"计数不够用"的参数区，块归纳是为那个区补的第二台机器。

### 4.4 Lemma s:short-run（短程维数预算）

(a) :61--71 陈述；结论三件套 :67：L = o(d)、T = o(d²)、log2 W_* = o(d²)；显式估计 :78--79 逐字：

> \[ (d-2)L\le M+\tfrac32\log_2d+\log_2\tfrac{c+1}{2\alpha}. \]

(b) 补链：成功 ≥ alpha 与 sharp 计数结合得 alpha ≤ (T+1)W(c_d/2)2^{-(d-1)L}，取 log2：(d-1)L ≤ M + log2(T+1) + log2(c_d/2) + log2(1/alpha)。T ≤ cdL 且 L ≥ 1、d ≥ 3 给 T+1 ≤ (c+1)dL，拆 log 得 log2(c+1) + log2 d + log2 L；log2 L ≤ L（L ≥ 1 时）搬回左边把 (d-1)L 减成 (d-2)L；c_d ≤ sqrt d（01 文件 :142）贡献 1/2 log2 d，与前面的 log2 d 合成 3/2 log2 d；log2(c_d/2) 的 -1 与 log2(1/alpha) 合并成 log2((c+1)/(2alpha)) 型余项。第二、三件套直接由 T ≤ cdL 与 log2 W_* = M + log2(T+2) 配 M = o(d²)。块数 ceil(T/k) ≤ cdL/(c_0 d) = (c/c_0)L = o(d)。

(c) 逐常数理由：d-2 ，并非 d：一行 L 从左边被 log2 L 吸走，另一行是 (d-1) 到 (d-2) 的取整损失；3/2 是"一个 log d 来自 T+1、半个来自 c_d"；(c+1)/(2alpha) 里的 2 是给 log2(c_d/2) ≤ 0 与 L ≥ 1 边界留的统一余量。为什么 L = o(d) 是命脉：右边只有 M(d) + 对数项，M = o(d²) 时 (d-2)L ≤ o(d²) forcing L/d → 0，与证明规则、epsilon 取值无关（"uniformly in the accuracy and the rules" :81--82），这就是主定理维度阈值只看 M 序列的结构原因。:86--87 明文警告短程假设 essential：L = o(d) 只在 T ≤ cdL 的维度列上成立，防止误读成对所有 learner 的绝对陈述。

(d) [推测] 路线一：不用 T ≤ cdL 假设直接推 L = o(d)。断在逻辑方向：L ~ alpha d 时 T 可以取 2^{alpha d²}/poly 满足计数，一切成立，没有矛盾可挖。[推测] 路线二：把 sharp 计数换成角计数 (T+1)W(2epsilon)^{d-1}。可走通但常数脏（多摊 2 的 (d-1) 次幂与 c_d 的对比损失），short-run 是主链引理，正文宁可用带 c_d 的锐式。[推测] 路线三：允许 T 随种子自适应（随机 horizon）。断在 T 确定性（00 文件 :46），枚举 (T+1)W 立刻失效。

### 4.5 Lemma s:full-data 与 quarter-endpoint

(a) :90--99 陈述，界 :96--98 逐字：

> \[ \Prob\le \frac{T}{d(1-r_0^2)}+\min\{1,\ (c_D/2)(2\epsilon/r_0)^{D-1},\ (8\epsilon/r_0)^{D-1}\}, \]

适用 0 ≤ T ≤ d-3、D = d-T。:123--135 推 T > d/4 端点（s:quarter-endpoint）。

(b) 补链：把全部 T 行 + 标签直接给估计器（对任何早停 learner 是加强信息，:139--141）；行张成 T 维子空间几乎必然，p = P_R S 由标签完全决定（行矩阵在自身张成上单射），残差 S = p + rU、r² = 1-|p|²、U 在 R⊥ 的球面上均匀。对称性给 E|p|² = T/d（T 个正交坐标平方和、每个均值 1/d）；Markov：P(r < r_0) = P(|p|² > 1-r_0²) ≤ (T/d)/(1-r_0²)。在 r ≥ r_0 上，成功残差方向落入以输出投影为中心的弦帽、半径 2eps/r_0（02 文件 :44--56 的 recentering：任一成功方向为心，其余成功方向与其距离 ≤ 2eps/R），套 s:caps 的锐帽与仿射终止两支加全质量 1 成 min 三支。T=0 时 R = {0}、p = 0、r = 1 退化为全球。取 r_0 = 1/2：T ≤ d/4 时 Markov 支 = (d/4)/(d·3/4) = 1/3，D ≥ 3d/4，2eps/r_0 = 4eps ≤ 0.4，帽支 (c_D/2)0.4^{D-1} = o(1)，总成功 ≤ 1/3 + o(1) < 1/2。

(c) 机械理由：epsilon ≤ 1/10 在这里显形：正文 :125 写死 "2\epsilon/r_0\le0.4"，r_0 = 1/2 时即 4epsilon ≤ 0.4 ⟺ epsilon ≤ 1/10，这是"为什么恰好 1/10"的第一落点（另一处依赖在 s:caps 的 min 分支需要 8epsilon/R 有 < 1 的余地，1/10 让两支过渡平滑）。T ≤ d-3 保证 D ≥ 3、02 文件弦帽段可用。quarter-endpoint 是主定理 1024 分叉的对方：07 文件 :130--132 用 T < d/64 撞上 T > d/4。min 第三支 (8epsilon/r_0)^{D-1} 与第二支看似重复，实际是对 02 文件 s:affine-terminal 统一底数形态的直接引用。全数据界还有一个常被忽略的职能：它同时覆盖 "bounded precision"（00-introduction.tex:221 那句 "A full-data residual estimate handles bounded precision"），即 lambda 有界的粗精度端。

(d) [推测] 路线一：用 p 的精确 beta 分布替代 Markov。断处收益：可把 1/3 压到任意小、省掉 r_0，但只改常数不改结构；Markov 一行换来全篇一个显式 0.4，作者选了后者。[推测] 路线二：把端点从 T ≤ d/4 推到 T ≤ (1/2-o(1))d。断在 D ≥ 3d/4 变 D ≥ d/2 时帽支仍 o(1)，看似可行，但 r_0 = 1/2 的 Markov 支变 T/(3d/4) 顶到 2/3，吞光成功预算，端点必须停在 1/3 安全线以下。[推测] 路线三：对无噪场景直接断言 T ≥ d（满秩方程组唯一解）。错在把"解向量"与"有限记忆估方向"混为一谈：满秩需要 d 行全存下，模型禁止；这条是初始猜想阶段最自然的坑，§1 已列为第一个被放弃路线。

## 5. 07-beta-mixture：2^{-16} 的出生证明

### 5.1 双分量控制的动机段（逐字）

> "The first test is the whole ambient sphere. The second fixes one direction from the span of the earlier draws and averages on a latitude perpendicular to that direction. If the ambient space has linear dimension \(D'\), each such latitude has linear dimension \(D'-1\), regardless of the number of earlier draws. This is the reason that a block will spend only two test dimensions."（07-beta-mixture.tex:10--16）

(b) 补链：02 文件 s:directions 的密度 c(K,j)/c(N,j)·dist(y,V)^{-(N-K)} 在先前副本张成的 V 附近爆炸，奇指数 N-K 随块缩水而涨。控制该奇性有两条路：04 文件用 tube 加 shell 求和（cap-moment 方法），本文件用测度控制（domination）：把真实条件律压成"ambient 全球均匀 + 一条纬度混合"两个可测对象之和乘 2^{D'}。纬度律的半径由 beta 变量 Z 选定，恰在 V 附近复刻真实密度发散（q → 0 端由第二形状差 beta_1 - beta_0 吸收）。

(c) 为什么两族测试只花 2 维：ambient 球 S(E) 是第 1 扣（E = H∩e⊥ 相对原 H），纬度 H̃ = E∩e_0⊥ 是第 2 扣；副本数 m 再多，每个条件因子都回到同一对测试维度，归纳假设里 D-1 与 D-2 两级永远备着（:171--174 "the available bounds therefore include all affine tests of dimensions D-1 and D-2"）。这是全文对 SSV Section~7 Lemma~12 的差异化贡献：他们逐副本付维数或依赖全局 L² 密度假设（00-introduction.tex:130--133），这里"每块固定 2 维"（:202--204 原文 "a block costs only two test dimensions, although it contains a number of samples proportional to \(d\)"）。

(d) [推测] 路线一：单分量控制（只用 nu_0 乘一个大常数）。断处：dist(y,V)^{-(N-K)} 在 V 的任意小邻域内对 sigma_E 不可积，任何有限倍数压不住 q → 0 发散。[推测] 路线二：nu_1 的纬度半径取确定值，并非 beta 随机。断处：真实律 q 的零端尾指数由 alpha 决定，确定半径只在单点匹配密度，积分比较立刻溢出 2^{D'}。[推测] 路线三：对每个副本换新 ambient（逐副本扣 1 维）。断处：m ~ d/16 个副本扣 m 维，块样本数 k ~ d/16 与维数消耗同速，归纳在 O(1) 块后死亡，正是"块成本 ∝ 副本数"旧范式的死因。

### 5.2 Lemma s:mixture（双分量控制）

(a) :21--48。参数 :26--31：alpha = (n-j)/2、alpha_* = (D'-j)/2、beta_0 = j/2、beta_1 = (D'-n+j-1)/2；构造 :33--38 逐字：

> \[ \sqrt{1-Z}\,e_0+\sqrt Z\,u_0,\qquad Z\sim\Beta(\alpha,\alpha_*-\alpha),\quad e_0\sim\sigma_V,\quad u_0\mid e_0\sim\sigma_{E\cap e_0^\perp}; \]

结论 :42：作为 S(E) 上正测度 Law(v) ≤ 2^{D'}(nu_0 + nu_1)。

(b) 中间量 Q(y) = |P_{V⊥}y|² 的三套律：真实 v：N = V ⊕ (N∩V⊥) 用 s:coordinates 得 Q ~ Beta(alpha, beta_0)（N∩V⊥ 半维 (n-j)/2 对 V 半维 j/2）。nu_0：E = V ⊕ V⊥ 给 Beta(alpha_*, beta_0)。nu_1：Q = ZX，X = |P_{V⊥}u_0|²；u_0 在 (D'-1) 维空间 E∩e_0⊥ 中，对 V⊥ ⊕ (V∩e_0⊥) 分解给 X ~ Beta(alpha_*, (j-1)/2)；Z 与 X 独立，s:beta-product 得 ZX ~ Beta(alpha, (alpha_*-alpha)+(j-1)/2) = Beta(alpha, beta_1)。j=1 支 :64--67：V∩e_0⊥ = {0}、X = 1、beta_1 = alpha_*-alpha、Q = Z，原文声明 "We do not use a beta law with second shape zero."。向量提升 :69--79：三律对 O(V)×O(V⊥) 独立正交变换不变；固定非零分量长度后不变平均 = 两独立均匀方向积分；标量密度比逐点提升为向量测度比。密度比 :81--105：b = D'+1-n ≥ 2；q ≥ 1/2 时 f_{alpha,beta_0}/f_{alpha_*,beta_0} = B(alpha_*,beta_0)/B(alpha,beta_0)·q^{-(alpha_*-alpha)}，beta 积分随任一正形状参数增而减故前因子 ≤ 1，q^{-(alpha_*-alpha)} ≤ 2^{alpha_*-alpha} ≤ 2^{D'}；q < 1/2 时对照 f_{alpha,beta_1}，(1-q) 扮演对称角色，前因子 ≤ 1 用 beta_1 ≥ beta_0（b ≥ 2 ⟺ (beta_1-beta_0) = (b-2)/2 ≥ 0）；在 1/2 分片相加，b=2 等号情形 :104 明写包含。

(c) 机械理由：alpha 与 alpha_* 之差 (D'-n)/2 正是"子空间维数亏损"；q ≥ 1/2 片把亏损塞进第一形状差、由 nu_0 接住，q < 1/2 片塞进第二形状差、由 nu_1 接住。2^{D'} 是把 2^{max(alpha_*-alpha, beta_1-beta_0)} 粗化到 2^{D'} 防取整。j=0 与 n = D' 两支 :44--47 明文退出混合（第一方向对均匀 N 平均后全球均匀；n = D' 时 N = E），主证明 :220--222 照此在"任何 beta mixture 使用之前"处理，防止 alpha_*-alpha = 0 的退化 beta 与正文 :66--67 的零形状禁令冲突。

(d) [推测] 路线一：把分片点 1/2 换成 q 的 beta 中位数以求最优常数。断在收益：中位数需要额外未解不等式，1/2 处两支各自 ≤ 2^{D'} 已经够机器逐行验证；换点不动 2^{-16} 数量级。[推测] 路线二：用 KL 散度/Rényi 控制替代逐点密度比。断在审计形态：Mixture.Domination.lean 的命名（Domination）说明 Lean 侧就是逐点密度比路线；熵路线需要积分不等式链，与 nanoda 关闭的初等预算冲突。[推测] 路线三：单次混合覆盖全部 m 个副本的联合律。断在联合密度形状参数逐副本漂移，s:directions 的条件结构本来只能逐因子用，联合化丢掉反向归纳的逐段接口。

### 5.3 主定理证明全 walkthrough（发动机舱）

(a) 07-beta-mixture.tex:111--306 全文即证明。反设沿无界维度列结论失败；:115--118 定 lambda = log2(1/epsilon)、c_* = 2^{-16}、T < c_* d lambda，本章对数全取 2 底。短程归约 :120--132 以 c = c_*、alpha = 2/3 套 s:short-run，得 lambda = o(d)、T = o(d²)、log2 w = o(d²)，垫宽 w = (T+2)2^M（:125--126）；分叉 :130--132 逐字：

> "If \(\lambda\le1024\), then \(T<d/64\), contradicting the full-data bound \eqref{s:quarter-endpoint} at large \(d\). We therefore restrict to \(\lambda>1024\)."

参数组 :135--141 逐字：

> \[ k=m=\lfloor d/16\rfloor,\qquad p=2\lfloor d/32\rfloor,\qquad \ell=p/2,\qquad J=\lceil T/k\rceil,\qquad G=2^{4d}w^{1/m}. \]

预算 :149--152：J ≤ 32c_*lambda+1 = o(d)、J ≤ d/8、m,p ≥ d/32。归纳不变量 :166--169：一切维数 D ≥ d-2i 的仿射子球上 ∫h_{i,v}(c+ru)dσ_H ≤ G^{J-i}(8epsilon/r)^p。

(b) 基例 :176--179：i=J 时 D ≥ d-2J ≥ 3d/4 给 D-1 ≥ p；8epsilon/r ≥ 1 用全质量、否则指比较 s:affine-terminal，且 G^0 = 1。也顺带处理 J=0。

反向步逐因子（:181--281）：块长 1 ≤ b ≤ k；残差律 rho² ~ Beta((D-b)/2,b/2)、c' = c+r sqrt(1-rho²)e、r' = r·rho、E = H∩e⊥（D' = D-1）、n = D-b；s:state-maximum 把左端压成 E_{rho,e}E_N max_{v'}F_{v'}(N)，原文 :198--199 强调 "This step keeps all dependence on the exact batch data until the state maximum has been taken."。固定 rho,e,v'，记 U_0 = G^{J-i-1}(8epsilon/r')^p。m 阶矩按 N 内 m 个独立方向展开；给定前 j 个方向有 D ≥ 3d/4、n ≥ 11d/16、m ≤ d/16 < n（:215--217，算法 3d/4 - d/16 = 11d/16）。j=0 与 b=1（此时 n = D'）两支直接 ≤ U_0，先于任何混合使用。j ≥ 1、b ≥ 2 上 s:mixture：nu_0 因子 ≤ U_0（D' ≥ d-2(i+1) 达标）；nu_1 因子目标在 H̃ = E∩e_0⊥（维 D-2 ≥ d-2(i+1)）、中心 c̃ = c'+r' sqrt(1-Z)e_0 ⊥ H̃、半径 r̃ = r' sqrt Z，合法性 :233--236 验证 |c̃|² + r̃² = |c'|²+r'² = 1；归纳假设给均值 ≤ U_0 Z^{-ell}。逆矩 :240--252 逐字界：

> \[ \E Z^{-\ell}=\prod_{t=1}^{\ell}\frac{\alpha_*-t}{\alpha-t}\le2^\ell\le2^d, \]

条件核算：n-j ≥ 10d/16 推 alpha ≥ 5d/16；ell = p/2 = floor(d/32) ≤ d/32；alpha - ell ≥ 9d/32 ≥ d/4；alpha_* ≤ d/2；最大比在 t = ell：(alpha_*-ell)/(alpha-ell) ≤ (15d/32)/(9d/32) = 5/3 < 2。混合系数 2^{D'} ≤ 2^d 合并成单因子 ≤ 2^d U_0(1+E Z^{-ell}) ≤ 2^{3d}U_0（2^{2d+1} ≤ 2^{3d} 的粗化）。反向条件序积分：E_N F^m ≤ (2^{3d}U_0)^m；Jensen 加对 ≤ w 个状态求和：E max ≤ w^{1/m}2^{3d}U_0（:266--270）。r' = r·rho 的平均把 (8epsilon/r')^p 拆成 (8epsilon/r)^p·rho^{-p}；:271--279 第二张整数 beta 积（逐字为 E rho^{-p} = prod_{t=1}^{ell}(D/2-t)/(n/2-t) ≤ 2^ell ≤ 2^d）条件核算：n/2-ell ≥ 11d/32-d/32 = 10d/32 = 5d/16 ≥ d/4、D/2 ≤ d/2、每比 ≤ (d/2)/(5d/16 - 损失) < 2。每块总费率 w^{1/m}2^{3d}·2^d = w^{1/m}2^{4d} = G，归纳闭合。

数尾 :283--299：i=0 取 H = R^d、c=0、r=1；先对初态、再对种子回平均（:285--288 引用 s:borel 的"原始可测条件概率可平均"话术）；log2 G = 4d + log2 w^{1/m} ≤ 5d 终成立（log2 w = o(d²)、m ≥ d/32）；成功上界取 log2 后逐字链 :293--295：

> \[ 5d(32c_*\lambda+1)+p(3-\lambda)\le5d+(160c_*-1/64)d\lambda\le5d-d\lambda/128\le-3d. \]

逐项机械：J ≤ 32c_*lambda+1（T/k ≤ c_* d lambda/(d/32) + 1）；log2(8epsilon)^p = p(3-lambda)；3-lambda ≤ -lambda/2 由 lambda ≥ 1024；p ≥ d/32 给 p(3-lambda) ≤ -d lambda/64；160c_* = 160/65536 = 5/2048 ≤ 1/128 = 16/2048；合并 160c_*-1/64 ≤ -1/128；5d - d lambda/128 ≤ -3d 当且仅当 lambda ≥ 1024。成功 ≤ 2^{-3d} < 2/3 矛盾。:301--305 声明两支 eventual 条件只经 (d-2)lambda 显式估计与绝对全数据阈值，维度阈值只依赖 M 序列、对 epsilon 一致。

(c) 2^{-16} 的约束系统（台账之外的重点清算）：c_* 同时受 (i) 160c_* ≤ 1/128 即 c_* ≤ 1/20480；(ii) 分叉相容性：lambda ≤ 1024 支要 T < c_* d·1024 < d/4 撞上 quarter-endpoint，正文取 c_*·1024 = 1/64 恰好是 2^{-16}·2^{10} = 2^{-6}，与 d/4 留 4 倍余量。(i) 允许 2^{-15}（1/32768 < 1/20480），(ii) 在分叉点 1024 与"d/64 干净二元幂"的美学下把 c_* 钉死 2^{-16}：1024·2^{-15} = 1/32 也行，但 1/32 撞 1/4 的余量减半，且 -3d 尾距 依赖 lambda ≥ 1024 精确。p 取偶数（p = 2 floor(d/32)，:142--143 原文"The radius exponent \(p\) is even, so the inverse-radius moments below have the integer exponent \(\ell=p/2\)"）的机械理由：两张逆矩产品（Z^{-ell} 与 rho^{-p}）都走 s:beta-identities 的整数积公式，绕开实数支 Gamma 比较，也让 rho^{-p} = (rho²)^{-p/2} 的指数与 beta 变量的自然坐标 rho² 严格对齐。为什么帽形用 (8epsilon/r)^p：与 02 文件 s:affine-terminal 的 min{1,(8epsilon/R)^{D-1}} 同底同形，基例比较只剩指数单调。为什么 2/3 进 short-run、1/2 进 quarter-endpoint：主定理假设 2/3，但 full-data 支只需较弱的 1/2 阈值就产生矛盾（1/3 + o(1) < 1/2 < 2/3），用弱阈值得更硬端点。

(d) [推测] 路线一：先优化常数（k、m 取 d/15 之类）再结数尾账。断在 1024 分叉点联立漂移：k 系数改动平移 32c_*lambda，分叉点与 c_* 要重解整套不等式，过早优化锁死后期接口。[推测] 路线二：把 w^{1/m} 换成状态熵加权。断在状态集无度量结构，2^M 个态的 max 只有枚举与 Hölder 两种吃法；熵路线要重建 Borel 引理对非常数基数族的版本。[推测] 路线三：单层归纳（每块只扣 1 维，nu_0 独扛 j ≥ 1）。断在 q < 1/2 密度发散压不住，与 §5.1 路线一同源同死；两级测试维是密度分片的硬性代价。[推测] 路线四：让块长 b 随机（依赖数据量决定下一块大小）。断在 s:short-run 的块数 o(d) 结论依赖确定 k ≥ c_0 d 除法，随机块长使"J ≤ 32c_*lambda+1"失去确定分母，归纳级数与维数预算同时失控。

## 6. 04-weighted：半径加权范数，第二台机器

### 6.1 加权范数定义

(a) 04-weighted.tex:9--18 逐字：

> \[ B_n(g)=\sup_{\dim H=n,\ z\perp H,\ R>0,\ \norm z^2+R^2=1}R^a\int g(z+R\omega)\,d\sigma_H(\omega), \]

其中指数 a = d/16（:9），并注明 "In particular \(B_d(g)=\int g\,d\sigma_{\R^d}\). The radius weight allows small subspheres to carry more mass while keeping the same test at every scale."（:16--18）

(b) 补链：B_d 无约束（唯一仿射表示取 z=0、R=1），其余 n 维子球族全体打包成单个实数；上确界遍历中心 z 与半径 R，恰是 00 文件式 s:affine-sphere 的全族。小半径子球的积分本来可以被任意集中，乘 R^a 后仍被 B_n 统一封顶，这就是"同一测试在所有尺度可用"的会计含义。

(c) 机械理由：a = d/16 与归纳里"每块扣 2 维、共扣约 b ≤ o(d) 块、终止要求 n ≥ d/2"（:38 范围 d/2 ≤ n ≤ d）三方相容：帽支 (2ε/R)^{n-1} 乘 R^a 后需要 n-1 ≥ a 才收缩（证明 :162--163 "Since \(n-1\ge a\)"），n ≥ d/2 时 a = d/16 有 7d/16 的指数余量；再往大取会撞 cap-moment 裕度条件（见 6.2），再往小取则终止界 ε^a 变松、T 率前因子变差但量级不变。

### 6.2 Lemma s:cap-moment（管与壳）

(a) :67--95。假设 :73--78 两条：全质量 ∫f dσ_E ≤ A_0^dΛ 与帽假设 ∫_{|y-y_0|≤δ}f ≤ A_1^dΛδ^{N-1-a}；裕度 :80--82 逐字：

> \[ N-1-a-(h-1)-b\ge1, \]

结论 :84--93：E_L(∫f dσ_L)^h ≤ ([4max{A_0,9A_1}]^dΛ)^h 与 max 版 W^{1/h}·[4max{A_0,9A_1}]^d·max_vΛ_v；特例 :94 "In particular, \(A_0=1,A_1=4\) gives the constant \(144^d\)."

(b) 补链：奇异源是 s:directions 的 dist(y,V)^{-(N-K)} 因子（记 b = N-K）。管引理 :98--110：距 V 小于 δ 的球面点落在其规范化投影的 2δ 邻域并集里；S(V) 的最大 δ-分离点集基数 ≤ (3/δ)^j（δ/2 开球互斥且嵌于 V 内半径 1+δ/2 的球，体积比给出 3^jδ^{-j} 级）；用 3δ 帽覆盖这些点，逐帽套帽假设得 ≤ A_1^d·3^{α+j}Λδ^{α-j}（α = N-1-a），把 3^{α+j} ≤ 3^{2d} 吸收进 Q_0^d（Q_0 = max{A_0,9A_1}）。壳求和 :113--121：层 2^{-i-1}<dist≤2^{-i} 上 dist^{-b} ≤ 2^{bi}，管质量 ≤ Q_0^dΛ2^{-i(α-j)}，级数 Σ_i2^{-i(α-j-b)} 由裕度 α-j-b ≥ 1（j ≤ h-1 逐层最坏代入即 :80--82）压成 Q_0^dΛ2^{b+1} ≤ (4Q_0)^dΛ。零距离集 σ_E-零因为 j<N；δ=1 支由全质量假设接管。h 阶矩展开 E∏f(Y_i) 后按 s:directions 反向条件序积分：末因子带 dist^{-b} 用逆距界 (4Q_0)^dΛ，往前逐因子退回全质量，乘出 [4max{A_0,9A_1}]^{dh}。max 版 :134--141：max_vF_v ≤ (Σ_vF_v^h)^{1/h}，Jensen 与 (Σ_vE F_v^h)^{1/h} ≤ W^{1/h}max。

(c) 机械理由：裕度里每一项都有名字：N-1-a 是帽假设的管衰减指数，(h-1) 是最坏副本张成维数 j，b = N-K 是条件密度奇异指数，≥1 保壳级数比值 ≤ 1/2。A_0 与 A_1 分离的原因是两族系数在乘积里角色不同：全质量支每层一次、帽支每壳每帽重复用；9A_1 吸收 3^{α+j} 与壳首因子；外层 4 吸收 2^{b+1} ≤ 2^{2d}。A_0=1、A_1=4 代入：Q_0 = max{1,36} = 36、4Q_0 = 144，特例 144^d 与 05 文件 :100 "gives \(144^d\Lambda\)" 完全对上，证明两个分片共用这台泵。

(d) [推测] 路线一：对 dist^{-b} 与帽质量 δ^{α-j} 直接做 Stieltjes 积分替代壳求和。断在需要帽假设的逐点连续版本与 α-j-b 严格正的下界量化；台阶化取 ≥1 后一切变 2 的幂初等比较，Lean 里可判定。[推测] 路线二：tube 计数用覆盖数 N(V,δ) 渐近记号。断在常数失控：渐近记号吞掉 3^j 后与 [4max]^d 无法对齐，05 文件 C_*=1000^{32} 式"一步吸收全部粗化"失去落点。[推测] 路线三：h 取连续阶（Rényi 型）。断在矩展开 E∏f(Y_i) 依赖整数副本与 s:directions 的 j<h 逐层条件；分数阶要重造副本结构，没有免费路径。

### 6.3 Theorem s:weighted-theorem（块估计与终止估计）

(a) :22--51。块界 :40--42 逐字：

> \[ B_n(g_{\rm in})\le W^{1/m}C^d\max_{v\in\mathcal V}B_{n-2}(g_v), \]

终止界 :48--50：B_n(g_π) ≤ C^dε^a，g_π 是帽指示对任意输出测度 π 的平均（:44--46）。参数 k=m=⌊d/16⌋、a=d/16。

(b) 终止段 :158--166：R ≥ 2ε 时固定输出的成功方向在半径 2ε/R ≤ 1 的弦帽内，s:caps 锐界给 (c_n/2)(2ε/R)^{n-1}；乘 R^a：R^a(2ε/R)^{n-1} = (2ε)^a(2ε/R)^{n-1-a} ≤ (2ε)^a（因 2ε/R ≤ 1 且 n-1 ≥ a），得 (c_n/2)(2ε)^a ≤ C^dε^a（c_n ≤ √n）。R < 2ε 时 R^a ≤ (2ε)^a 全质量一行。输出测度平均合法因两支界与 π 无关。

块段 :168--262 逐链：测试 (z,H,R) 维 n；V 为 H 内 k 个投影行的张成，p = RP_Vω、r² = R²-|p|²、K = H∩V⊥ 维 q = n-k；给定矩阵与 p，目标 z+p+rU、U~σ_K、标签 X(z+p)；s:state-maximum 的 p-条件化版本 :178--181：E_pE_{K|p}max∫g_v(z+p+rU)dσ_K。K|p 是 H' = H∩p⊥（维 N=n-1）中一致 q-子空间：长度定 beta 分数、方向定 e、s:residual 给条件律（:182--185 自证）。固定 p,g：f(U)=g(z+p+rU)，Λ = r^{-a}B_{n-2}(g)。纬度论证 :190--201：对 w∈S(H') 条件于坐标 t=〈Uw〉，该纬度上目标均匀于 z+p+rtw + r√(1-t²)S(H'∩w⊥)；它是线性维 n-2 的合法仿射测试：中心与 H'∩w⊥ 正交、中心平方加半径平方 = |z|²+|p|²+r² = 1；故纬度均值 ≤ Λ(1-t²)^{-a/2}。把纬度界对维 N 坐标密度（余指数 (N-3-a)/2 ≥ 0）积分得 :206--211 两条：全质量 ≤ 2c_NΛ、弦帽 ≤ c_NΛη^{N-1-a}（区间长 ≤ η²/2、1-t² ≤ η²）；2c_N ≤ 2√d ≤ 4^d 使 A_0、A_1 绝对化。代入 s:cap-moment：N=n-1、q=n-k、矩 m=k、奇异幂 N-q = k-1，裕度 :222--228 逐字：

> \[ N-1-a-l-(N-q)=n-1-a-l-k\ge n-a-2k\ge5d/16\ge1, \]

算术：n ≥ d/2、a=d/16、k ≤ d/16，d/2-d/16-2d/16 = 5d/16；l ≤ m-1 最坏代入。矩结论 :230--233 后接 max :238--242：E max ≤ W^{1/m}C^d·r^{-a}max_vB_{n-2}(g_v)。半径平均 :243--262：t=(r/R)²~Beta(q/2,k/2)；分母 B(q/2,k/2) ≥ (1/2)4^{-(q/2-1)_+-(k/2-1)_+} ≥ 4^{-d}（限制 [1/4,3/4]）；乘 t^{-a/2} 后分子 ∫t^{(q-a)/2-1}(1-t)^{k/2-1}dt ≤ 2：q-a ≥ 2 使首指数 ≥ 0，k ≥ 2 时次指数 ≥ 0，k=1 支 ∫₀¹(1-t)^{-1/2}dt = 2；合 E(R/r)^a ≤ C^d。乘 R^a、平均、取 sup 闭合。

(c) weighted 与 beta-mixture 的分工（规格点名）：mixture 走"测度逐点控制 + 偶指数整数矩 ell"，换到显式 c_* = 2^{-16}；weighted 走"管壳可积 + 实数 a=d/16"，换到 mixture 没有的两样：其一，定理对任意有界 Borel 后继函数族成立、与 learner 建模解耦（:5--7 "The resulting block inequality is independent of a learner"），可复用为纯几何引理；其二，成功阈值 1/2、输出测度任意。代价是 C 非显（:23 "There are absolute constants \(C\ge1\) and \(d_*\)"），推论率只剩未指定的 c。00-introduction.tex:241--244 与 :254--255 明说主定理系数出自 beta-mixture、weighted 只给 1/2 成功下的同率。:258--259 的 "This direct beta-integral argument does not require \(a/2\) to be an integer." 是实数指数路线的宣言。

(d) [推测] 路线一：用 weighted 直接冲主定理常数。断在 C 的黑箱来自壳求和、管覆盖、max 合并三层粗化的打包；重开等于重写 s:cap-moment，而 mixture 路线的 2^d、2^{3d}、2^ell 全可逐字核算。[推测] 路线二：B_n 去掉中心 z 只留半径族。断在纬度论证 :196--201：纬度子球中心 z+p+rtw 是带心测试，去心后归纳假设无可施加对象，n-2 维测试进不了链条。[推测] 路线三：a 整数化让逆矩走整数积。断在反而变糟：终止界与帽指数的差要 floor 重核、q-a ≥ 2 需重推、裕度 5d/16 的写法依赖实数 a 等式；:259 的声明就是对该路线的封口。

### 6.4 Corollary s:weighted-application

(a) :269--277：M=o(d²)、成功 ≥ 1/2 ⟹ T ≥ c·d log2(1/ε)，阈值可依赖 M 序列。

(b) 证明 :278--317：T ≥ dL 维自动满足；其余 short-run 给 L=o(d)、log2W_*=o(d²)；垫成 b=⌈T/k⌉ 块、宽 W_*；第 i 级维数 n=d-2i，预算 :294--296 d-2b ≥ d/2；迭代 :300--302 逐字：

> \[ \frac12\le[W_*^{1/m}C^d]^b\,C^d\,\epsilon^a; \]

取 log2、用 m ≥ d/32 与 log2W_*/m ≤ d 得 L ≤ C_1(b+1)；L ≥ 4C_1 支由 b ≤ T/k+1 解出 T ≥ kL/(2C_1) ≥ dL/(64C_1)；L < 4C_1 支 quarter-endpoint 兜底。

(c) 1/2 是下游接口展示：:266--267 原话 "This application uses success \(1/2\), which is enough for the constant-accuracy estimate \eqref{s:quarter-endpoint}"。quarter-endpoint 的矛盾线本来就在 1/2（全数据给 1/3+o(1)），加权机器对齐最弱公共阈值。

(d) [推测] 路线一：让 weighted 独立覆盖 2/3 全率、宣布 mixture 冗余。断在迭代式 C^{d(b+1)} 的 b 含 T，取 log 后 C_1 非显式嵌套，回不到 2^{-16} 级声明。[推测] 路线二：精确 floor 处理短尾块。断在 :286--287 的"短尾块补未用新行"已把特判清零，精确化要逐块重验 s:residual 的 b<D。[推测] 路线三：小 L 支用 T ≥ 1 粗界。断在率形状：必须借 d/4 绝对线性界才能写成 c d L。

## 7. 05-affine：把 ε 因子沿所有仿射子球同步传播

### 7.1 参数与命题

(a) 05-affine.tex:9--15 声明 "In this section \(m\) is the block length and \(k\) is the number of blocks."，参数组逐字：

> \[ m=\lfloor d/16\rfloor,\qquad p=\lfloor d/8\rfloor,\qquad a=2\lfloor d/32\rfloor,\qquad n_0=\lceil d/2\rceil,\qquad C_*=1000^{32}. \]

命题 :17--41：垫成 k 块各 m 样本、宽 ≤ W、末层输出律与目标无关；预算 :27--29 n_0+2k ≤ d 且 W^{1/p} ≤ 2^d；不变量 :35--38：层 (k-ℓ)m 的状态 v 在维 n ≥ n_0+2ℓ 的一切仿射子球上 ∫g_v(z+rξ)dσ_H ≤ (R_ℓ/r)^a，R_ℓ = 16C_*^ℓε。

(b) 命名陷阱先入账：07 文件 m 是矩阶、k 是块长；05 文件 m 是块长、k 是块数、p 是矩阶、a 是半径指数（与 07 的 p 同式 2⌊d/32⌋，与 04 的实数 a=d/16 不同物）。[推测] 这是三套机器各自长出来的记号没有回头统一，编译顺序（07 插在 04 前）也佐证各分片曾独立成文。

### 7.2 证明的逐段核算

基例 ℓ=0（:43--49）：16ε/r ≥ 1 时右端 ≥ (16ε/r)^a ≥ 1 走全质量；否则成功方向在半径 2ε/r 弦帽、极角 ≤ 4ε/r，s:caps 角界 (2θ)^{n-1} 给 (16ε/r)^{n-1}，n-1 ≥ a 收缩。

归纳步 :51--121：块 b=m，s:residual 给 t、e、L（n-m 维均匀子空间于 E=H∩e⊥，N=n-1）；z'=z+r√(1-t)e、ρ=r√t、f_u(y)=g_u(z'+ρy)、F_u(L)=∫f_udσ_L；s:state-maximum 压成 E_{t,e}E_Lmax_uF_u(L)，:65--66 注："The maximum is over all next boundary states and has already removed their possible dependence on the rest of the exact block data." 固定 t,e,u：Λ=(R_ℓ/ρ)^a；ambient 测试 z'+ρS(E) 维 n-1 ≥ n_0+2ℓ 给全质量 Λ；帽段对 y_0∈S(E) 条件极角 θ，纬度测试中心 z'+ρcosθy_0、半径 ρsinθ、空间 E∩y_0⊥ 维 n-2 ≥ n_0+2ℓ，均值 ≤ Λ(sinθ)^{-a}；对归一 sin^{N-2}θ 密度积分（余指数 N-2-a ≥ 0、归一积分 ≥ 2^{-(N-2)}、sinθ ≤ θ、区间长 ≤ δ²/2 换算）得 :83--86：帽 ≤ 4^dΛδ^{N-1-a}；δ>1 全质量续。s:cap-moment 代 A_0=1、A_1=4、矩 p、奇异幂 m-1，裕度 :92--96 逐字：

> \[ N-1-a-j-(m-1)\ge n-a-p-m\ge d/4+2(\ell+1)\ge1, \]

算术：n ≥ d/2+2(ℓ+1)，a ≤ d/16、p ≤ d/8、m ≤ d/16，差 = d/2-(1+2+1)d/16 = d/4。管系数 :99 报 36^d、逆距 :100 报 144^dΛ；矩与 max :101--104：E_LF_u^p ≤ (144^dΛ)^p、max ≤ W^{1/p}144^dΛ ≤ 288^dΛ（预算 W^{1/p} ≤ 2^d）。半径平均 :106--117：t~Beta((n-m)/2,m/2)，q=a/2=⌊d/32⌋ 整数；形状差 (n-m)/2-q ≥ 3d/16（n ≥ d/2、m ≤ d/16 给 (n-m)/2 ≥ 7d/32，减 d/32 余 6d/32）；每比 (n/2-j)/((n-m)/2-j) ≤ (d/2)/(3d/16) = 8/3 < 3；E t^{-a/2} ≤ 3^d。合成 :118--121：288^d·3^d = 864^d；a ≥ d/32 使 C_*^a ≥ 1000^d ≥ 864^d，故 R_{ℓ+1}=C_*R_ℓ 闭合。

### 7.3 应用与 C_*=1000^{32} 的机械理由

:124--151：h=log2(1/ε)；T > dh 维自动满足；其余 short-run(c=1, α=2/3)，垫 k=⌈T/m⌉ 块、W=(T+2)2^M；预算验证 n_0+2k ≤ d 与 W^{1/p} ≤ 2^d（:133 原文以 "with \(p\ge d/16\) eventually" 口径通过--比定义 p=⌊d/8⌋ 松半档，纯留安全余量）。终局 :139--143 逐字：

> \[ \frac23\le(16C_*^k\epsilon)^a,\qquad h\le k\log_2C_*+\log_224\le(T/m+1)\log_2C_*+\log_224. \]

r=1、z=0 全球代入不变量；两边取 log2 并除 a ≥ 1，log2 16 + log2(3/2) ≈ 4.58 ≤ log2 24，24 就是基例常数 16 与阈值 2/3 的合并取整。h ≥ 2(log2C_*+log2 24) 时解出 T ≥ mh/(2log2C_*)，m ≥ d/32；小 h 支 quarter-endpoint 兜底。

(c) C_* = 1000^{32} 两行解释：底数 1000 ≥ 864 覆盖归纳步全部粗化（288·3），指数 32 是余量 a ≥ d/32 的倒数，使 C_*^a ≥ 1000^d 逐项归一 R_ℓ；换成 865^{32} 定理照跑，选 1000 只为 log2C_* ≈ 318 可读。与 07 的 p=2⌊d/32⌋、04 的 a=d/16 对照，三套机器的最坏维数裕度分别是 5d/16、d/4、13d/32（06 文件），共同母题是"n ≥ d/2 才开工"。

(d) [推测] 路线一：R_ℓ 递推不带前因子 16、直接 ε·C^ℓ。断在基例：16 来自弦-角两跳粗化（2ε/r 帽、4ε/r 角、(2θ)^{n-1}），不写进 R_0 则 ℓ=0 验证差 16 倍。[推测] 路线二：不设 W^{1/p} ≤ 2^d 预算、界内保留 W 显式。断在形状封闭：右侧带 W 因子后下一层 Λ 不再是纯 (R/r)^a 形态，纬度比较失去归纳假设可施加对象。[推测] 路线三：p 与 m 对齐取 ⌊d/16⌋ 省 floor。断在逆矩每比 < 3 依赖 q=a/2 严格小于形状差 (n-m)/2 的算术余量，p 变大直接吃裕度。

## 8. 06-fixed-length：维度横向归纳与纬度模拟

### 8.1 命题（逐字要点）

06-fixed-length.tex:11--31：绝对常数 C ≥ 2、d_*；k=p=⌊d/32⌋、γ=d/32；整数 j ≥ 0、m 满足 d/2+2j ≤ m ≤ d；固定长度 learner 在维 m 收 jk 个精确高斯样本、每层 ≤ 2^{d²} 状态、输出可为 R^m 任意向量、规则可用任意与目标无关的固定参数；对一切 η>0：

> \[ \Prob\{\norm{\mathrm{output}-s}\le\eta\}\le(C^{j+1}\eta)^\gamma. \]

(b) 与停止规则版的关系（规格点名）：本节同时拆除"早停"与"单位球输出"两个约束；桥是 03 垫圈引理反向使用：停止规则 learner 垫成固定长度后每层状态 ≤ (T+2)2^M，short-run 保证该数终 ≤ 2^{d²}，正好落入命题的绝对状态预算。收益：中间命题对任意欧氏输出与任意正容差成立，强于主定理的输出约束；成本：界只给 (C^{j+1}η)^γ 形状，T 率要末段 reduction 才还原，常数全隐。

### 8.2 归纳的三幕

第一幕分解（:53--75）：A 为前 k 行、R 张成、N_0=R⊥、u=P_Rs、r=√(1-|u|²)；给定 A,u 目标 u+rz、z~σ_{N_0}、首标签 Au；:60--62 关键句 "the first block's selected state supplies no additional information about \(z\) under this conditioning"；f_v(z) 定义为从态 v 出发的后继成功概率（Borel）；条件成功 ≤ max_v∫f_vdσ_{N_0}；给定 u，N_0 是 E=u⊥（维 D=m-1）中一致 (m-k) 子空间，u=√(1-t)e 同时定 beta 分数与方向，状态 max 先于子空间边际律（:72--75）。

第二幕纬度模拟（:77--109）：固定 e∈S(E)、坐标 t，H=E∩e⊥、c=u+rt·e、ρ=r√(1-t²)，纬度目标 c+ρz'、z'~σ_H（维 m-2）。模拟构造 :91--94 逐字：

> \[ x=x'+x'',\qquad y=\ip{x''}{c}+\rho\ip{x'}{z'}=\ip{x}{c+\rho z'}. \]

从 H 内新样本对 (x',〈x',z'〉) 与独立 H⊥ 高斯 x'' 拼出 R^m 标准高斯对；x'' 与 (z', x', 全部历史 learner 随机性) 联合独立（:87--89）；额外高斯在转移内使用，"so the state set does not grow"（:96--97）；参数 H,c,ρ,v 先于变目标 z' 固定；输出投影到 H 除 ρ，原误差 η 控制模拟误差 η/ρ。模拟体有 (j-1)k 样本、m-2 ≥ d/2+2(j-1)，归纳假设适用：纬度均值 ≤ (C^jη/(r√(1-t²)))^γ，记 B=C^jη/r。

第三幕帽转化与矩（:110--173）：纬度界对维 D 坐标密度（余指数 (D-3-γ)/2 ≥ 0）积分，弦帽 τ 区间长 ≤ τ²/2、1-t² ≤ τ²，得 :113--117：∫_{|z-e|≤τ}f ≤ (c_D/2)B^γτ^{D-1-γ}；τ=2 全球；系数 ≤ 4^d。s:cap-moment 代 ambient D=m-1、子空间 m-k、矩 p=k、a=γ、Λ=B^γ、A_0=A_1=4，裕度 :131--133 逐字：

> \[ D-1-\gamma-(p-1)-(k-1)=m-\gamma-2k\ge13d/32+2j\ge1, \]

算术：m ≥ d/2+2j、γ=d/32、k ≤ d/32。max 结论 :136--139：条件期望 ≤ 2^{d²/p}144^d(C^jη/r)^γ，状态税 W^{1/h} 以 W=2^{d²}、h=p 落地。半径平均 :144--163：r²~Beta((m-k)/2,k/2)，用实数身份 beta-real：E r^{-γ} = B((m-k-γ)/2,k/2)/B((m-k)/2,k/2) ≤ 4^d；分子两指数 ≥0（m-k-γ ≥ 7d/16+2j）积分 ≤1，分母限制 [1/4,3/4] 给 ≥ (1/2)4^{-(m/2-2)} ≥ 4^{-d}；:162--163 强调该论证适用于实指数 γ=d/32。收束：p ≥ d/64 给 2^{d²/p} ≤ 2^{64d}；(2^{64}·576)^d(C^jη)^γ，γ=d/32，C 取大使 C^γ 吞并之，联合归纳完成。

### 8.3 末段 reduction 与常数的对咬

:176--205：F=ln(1/ε) 自然对数、F_0=8logC、a_0 满足 :180--182 逐字：

> \[ a_0\le\frac1{8F_0},\qquad a_0\le\frac1{256\log C}. \]

反设沿大维列 T < a_0dF、成功 ≥ 2/3；short-run 取 L=F/log2、c=a_0log2；垫 n=⌈T/k⌉ 块；垫宽终 ≤ 2^{d²}、d/2+2n ≤ d。两支对咬：F ≤ F_0 时 T < a_0dF_0 = d·logC/F_0 = d/8（用 a_0 ≤ 1/(8F_0) 与 F_0=8logC），撞 quarter-endpoint 的 d/4；F > F_0 时 :196--198 逐字：

> \[ (n+1)\log C\le(64a_0F+2)\log C\le F/2, \]

算术：n ≤ T/k+1 ≤ a_0F·64+1（k ≥ d/64）；64a_0logC ≤ 1/4（第二约束）给 64a_0FlogC ≤ F/4；F ≥ F_0=8logC 给 2logC ≤ F/4；合计 ≤ F/2。命题代 m=d、j=n、η=ε：成功 ≤ (C^{n+1}ε)^γ ≤ exp(-γF/2) < 2/3，矛盾。固定长度路线就此独立复证精度下界，且保留更强的"任意向量输出"中间陈述。

(c) 为什么 γ=d/32 而主链帽指数 p=2⌊d/32⌋：本机只需 (C^{j+1}η)^γ 的形状，实数 γ 一步用 beta-real；C^{j+1} 的 j 线性结构与主链 G^{J-i} 同型。状态预算 2^{d²} 逐层设定与 short-run 的 log2W_* = o(d²) 严丝合缝：这就是"为什么命题长这样，并非更一般"的接口答案。

(d) [推测] 路线一：用纬度模拟机独扛主定理。断在常数链的三层粗化（基例 2η、模拟 η/ρ、帽-角转换）使 C 彻底隐式，2^{-16} 无处安放。[推测] 路线二：x'' 复用已生成行池。断在独立性要求 :87--89 的联合独立声明；复用把残差均匀性换成条件奇异律，s:residual 失效。[推测] 路线三：γ 提到 d/16 加速衰减。断在 (D-3-γ)/2 ≥ 0 与裕度 13d/32 同时顶界：γ > d/16 后坐标密度余指数转负，帽积分在赤道发散。

## 10. 补记 02-subspace-moments：帽与共同子空间方向（全族泵房）

### 10.1 章旨

02-subspace-moments.tex:3--7 逐字："The residual law reduces a block to averages of continuation functions on a random subspace. We first bound terminal success by spherical caps. We then compute the dependence between several directions drawn in the same random subspace. Both block methods will use this conditional law; their different ways of bounding its moments come later." 两台机器共用本文件的两个引理，这是它排在 01 之后、03 之前的原因。

### 10.2 Lemma s:caps（帽与终止输出）

(a) :11--33 陈述三式：弦帽 :15--18 σ{u:|u-e|≤δ} ≤ (c_D/2)δ^{D-1} ≤ (√D/2)δ^{D-1}（D≥3）；角帽 :20--23 σ{u:∠(u,e)≤θ} ≤ (2θ)^{D-1}（D≥2, 0≤θ≤π）；仿射终止 :27--29：z+RS(H) 上任意固定单位输出的角成功 ≤ min{1,(8ε/R)^{D-1}}，且对一切与目标无关的输出律平均后仍成立。

(b) 弦帽：t=〈u,e〉 的坐标密度（s:coordinate-density，l=1）在 1 旁长 ≤ δ²/2 的区间上积分，区间内 1-t² ≤ δ²，界 ≤ c_D·δ²·(δ²)^{(D-3)/2} = c_Dδ^{D-1}；对称区间取半得 (c_D/2)δ^{D-1}。角帽：极角密度 ∝ sin^{D-2}φ；分子 ∫₀^θ ≤ θ^{D-1}/(D-1)；分母限制 [π/6,5π/6] ≥ sin(π/6)^{D-2}·(2π/3) 粗化后正文写作 ≥ 2^{-(D-2)}（:39--42），比 (2π/3)·2^{-(D-2)}·(D-1) 更脏的常数被合并进 (2θ)^{D-1}。仿射：角误差 ≤ ε 蕴含欧氏误差 ≤ ε（单位向量 |u-v| ≤ ∠(u,v)）；投影除 R 后成功方向落在半径 ε/R 的欧氏球内；取任一成功方向为心，其余与其弦距 ≤ 2ε/R；弦距 δ ≤ 2 时对应角 ≤ 2arcsin(δ/2) ≤ (π/2)δ（:51--52）；8ε/R < 1 时套角帽：(2·(π/2)·2ε/R)^{D-1} ≤ (8ε/R)^{D-1}（π/2·4 ≤ 8 的粗化即 :52 那句）；否则总质量。输出律平均：逐点界与输出无关，积分保持（:56）。

(c) 机械理由：8 的构成 = 2（球直径翻倍）× π/2（弦角换算）≤ 4·2，取整到 8 一步吞 π；底数 8ε/R 从此刻进主链归纳不变量 (8ε/r)^p（07:168），全篇帽形态统一。弦帽版要求 D≥3 是因分母 sin 积分用了 [π/6,5π/6] 的两点余量、l=1 密度在 D=2 时指数 -1/2 可积但区间论证变宽；角帽版 D≥2 通吃。min{1,·} 的 1 支是"半径太大帽=全球"的兜底，让同一式子服务所有 R。

(d) [推测] 路线一：用精确帽面积公式（正则化不完全 beta 函数）替代粗化。断在下游：所有常数都要跟着重排成 Gamma 比，07 的 2^{-16} 数值尾账失去整数级干净形态；帽引理的职责是把 √D 级前因子压进底数，精确公式违背该职责。[推测] 路线二：跳过 recentering，直接对输出球与信号球的交算测度。断在输出可偏离 H：投影像可能是空集或整球，"以成功方向为心"的两步三角（:46--52）正是为无结构输出设计。[推测] 路线三：θ 界用 (θ/(π/2))^{D-1} 之类几何最优形式。断在收益只在 D=2,3，主链 D ≥ 3d/4，粗化损失已被指数吃掉，白丢 8 的整齐。

### 10.3 Lemma s:directions（共同随机子空间的联合方向律）

(a) :66--81 陈述；核心密度 :74--78 逐字：

> \[ \frac{c(K,j)}{c(N,j)}\dist(y,V)^{-(N-K)}\le\dist(y,V)^{-(N-K)}, \]

前提 1≤h<K≤N、给定 L 后 Y_i 独立 σ_L；给定前 j 个方向后 V 维 j 几乎必然、L 变为包含 V 的一致 K-子空间；j=0 边际 σ_E；K=N 密度恒 1。

(b) 补链：表示 L=QL_0、Y_i=Qξ_i（ξ 先在固定 L_0 里抽）；h<K 保证前 j 个原像线性无关；给定原像与像，Gram-Schmidt 把原像基与像基锁死，Q 在正交补上的作用是统一正交等距（:93--95），故 L=V⊕L'、L' 为 V⊥ 中一致 (K-j)-空间，且该条件律只依赖 V，忘掉原像仍成立（Blaschke-Petkantschin 的球面化身，正文 :61--64 引 Rubin 并声明现场证）。下一原像的 V-分量按维 K 坐标密度 :104--106、垂直分量由统一等距送出成 V⊥ 均匀方向；对 σ_E 抽同型方向用维 N 密度；两密度比值 = c(K,j)/c(N,j)·(1-|P_Vy|²)^{-(N-K)/2}，dist(y,V) = √(1-|P_Vy|²)·…单位向量到 j-子空间的距离恰等于其垂直分量长度，改写即 :76。前因子 ≤1 的证明 :113--117：单位球上 (1-|t|²)^{(K-j-2)/2} ≥ (1-|t|²)^{(N-j-2)/2}（指数更负者值更大、但积分域同一），故归一 c(K,j) ≥ c(N,j)。

(c) 机械理由：奇异指数 N-K 是"子空间亏维"，在块场景里 N-K 等于块长减一量级（04:219 报 N-q = k-1，05:90 报 m-1，06 经裕度式含 k-1），三个下游各自记账同一式子。K=N 支密度恒 1 的显式声明对应主证明 b=1（n=D'）退出混合的接口（07:220--222）：条件在亏零的子空间上方向本来就独立均匀。c(K,j)/c(N,j) ≤ 1 让 04、06 可以扔掉前因子直用 dist^{-(N-K)}，07 干脆不碰这个比，是另起 mixture 控制；一份密度三种吃法，是"先证最精确的、各分片按需降级引用"的写作证据。

(d) [推测] 路线一：直接引 Blaschke-Petkantschin 公式原文。断在归一化：BP 公式带 unnormalized 面积元与 Jacobian 惯例差异，本库全部用概率测度（01:89--90 明文 "We use uniform probability, never unnormalized surface area"），引用要逐因子对账，比自己证两条短密度还贵。[推测] 路线二：只证 j=1 的两方向相关版、迭代用。断在逐层条件维数漂移：第 j 层的 K-j 变化必须精确跟踪，独立迭代版会把裕度 (h-1) 项丢在过程中，s:cap-moment 的 margin 无从写出。[推测] 路线三：用 Stiefel 流形上显式联合密度公式。断在与 Lean 结构不匹配：OAI/Probability/Subsphere/Geometry/MassBounds.lean 等模块名指向"质量界"式陈述，并非流形密度计算，且一致性论证已经覆盖可测性（01:208--211 的子空间平均可测声明）。

## 11. 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| 2^{-16}（c_*） | \lvert 2^{-16}\rvert = 1/65536 | 07-beta-mixture.tex:117 | 主定理界 T\ge c_*d\lambda；short-run 取 c=c_*；\lambda\le1024 支的 T<d/64 | 160c_*\le1/128（07:297）与 1024c_*=1/64 两条算术同时崩；变大则 -3d 数尾转正当维数足够大 |
| 2/3 | 成功阈值 \lvert 2/3\rvert | 00-introduction.tex:61 与 main.tex:13 | 终止计数 alpha=2/3（07:121、05:126、06:184）；corollary 的逐信号积分 | 放宽到 \lvert 1/2\rvert 以下要靠 04 推论形态；收紧不省样本；它进 log2((c+1)/2\alpha) 只动绝对常数 |
| epsilon 范围 | 0<\epsilon\le\lvert 1/10\rvert | 00-introduction.tex:12、05-affine.tex:27 | 03:125 的 4\epsilon\le0.4；帽 min 的底数收缩支；04:271 | 放宽则 quarter-endpoint 帽支不消失，r_0=1/2 与 0.4 两处同时断 |
| lambda | \lambda=\log_2(1/\epsilon)，范围 \lvert\log_2 10\rvert 以上无上界 | 07-beta-mixture.tex:116 | 界 c_*d\lambda；分叉 \lambda\le1024；short-run 的 L | 设 \lambda 有界则全数据支独扛、块归纳失去存在理由 |
| d 阈值（d_*） | 只依赖记忆序列 M 的"充分大" | 00-introduction.tex:55 | 定理与 04:23、06:12 的一致陈述 | 若依赖 epsilon 则 epsilon=d^{-r} 推论（00:87--88）失去统一形态 |
| M(d) | 增长 M=o(d^2) | 00-introduction.tex:54 | (T+1)2^M 枚举；log2W_*=o(d^2)；2^{d^2} 预算 | M\asymp d^2 时 (d-2)\lambda\le M+O(log d) 不再 forcing \lambda=o(d) |
| 2^M | 状态数上界 \lvert 2^M\rvert | 00-introduction.tex:19 | W（03:9）、w（07:125） | M=0 退化为单次估计，帽界直接顶死成功率 |
| W_*（w） | W_*=(T+2)W，即 w=(T+2)2^M | 03-stopping.tex:24 与 07:125 | 垫圈后的枚举宽度；Jensen 求和；05:131、06:191 | 无 +2 则早停态无法吸收进固定长度层 |
| T | 确定有限视界，T< c_*d\lambda 反设 | 00-introduction.tex:46 | (T+1)W；J=\lceil T/k\rceil | T 随机化则枚举与除法同时失效 |
| c_D | c(D,1)\le\sqrt D | 01-residual-spheres.tex:141--142 | 02:17 锐帽；03:75 short-run 的 3/2 log2d；04:215；06:120 | 无此界则帽前因子带 Gamma 比，2^{-16} 尾账不可算 |
| 仿射帽底数 | (8\epsilon/R)^{D-1}，8 为绝对常数 | 02-subspace-moments.tex:29 | 07:168 归纳不变量；03:97 min 第三支 | 8 若依赖参数则归纳各级 R 变换不闭合 |
| 角帽 | (2\theta)^{D-1}，0\le\theta\le\pi | 02-subspace-moments.tex:23 | 05:47 的 (16\epsilon/r) 基例；02 自身仿射段 | D=2 支全靠它（s:caps 的 D\ge3 限制） |
| beta 分数 | t\sim\Beta((D-b)/2,b/2) | 01-residual-spheres.tex:224 | 残差半径 rho；03:106--113；07:184--187；05:52--59；06:144--148 | b=D 时退化点质量、方向被标签唯一决定，下界假 |
| 实数逆矩 | \E Z^{-q}=\mathrm B(A-q,B)/\mathrm B(A,B) 当 q<A | 01-residual-spheres.tex:150--156 | 06:146--153 的 \E r^{-\gamma}；发散警戒线 | q\ge A 一切逆矩爆炸，γ 提到 d/16 以上即触雷 |
| 整数逆矩积 | \E Z^{-h}=\prod_{t=1}^h (A+B-t)/(A-t) | 01-residual-spheres.tex:159--161 | 07:249--252（Z^{-\ell}）；07:275--279（rho^{-p}）；05:114--117 | 阶非整数则必须回实数支、比值 \lvert\le2\rvert 的逐比论证失效 |
| beta 乘积封闭 | ZX\sim\Beta(A,B+C) | 01-residual-spheres.tex:167--169 | 07:57--66 的 Q 在 nu_1 下律 | 无封闭性则要三重 Gamma 卷积显式算 |
| 块参数 k,m | k=m=\lfloor d/16\rfloor | 07-beta-mixture.tex:136 | J=T/k；矩阶 m<n=11d/16 起 | m\ge n 违背 s:directions 的 j<h<K；k 变大则 J、d-2J 预算崩 |
| p 与 ell | p=2\lfloor d/32\rfloor（偶），\ell=p/2 | 07-beta-mixture.tex:137--143 | (8\epsilon/r)^p；基例 D-1\ge p；两张整数积 | p 奇则 \ell 非整数；p 大则 q-a、D-1\ge p 裕度缩 |
| J | J=\lceil T/k\rceil，界 32c_*\lambda+1=o(d) | 07-beta-mixture.tex:139--152 | G^{J-i} 级数；d-2J\ge3d/4 | J 到 c d 级则终止维数非正、帽基例不成立 |
| G | G=2^{4d}w^{1/m}，log2G\le5d 终成立 | 07-beta-mixture.tex:141、290 | 每块费率 | 4d 若变 6d，数尾 5d 改 7d 后 -3d 不保 |
| 2^{3d} | 单因子税 2^d(1+\E Z^{-\ell}) | 07-beta-mixture.tex:253--257 | G 的 3d 分量 | 混合前因子 2^{D'} 粗化失效则变 2^{2D'} |
| 2^{d}（逆矩和） | \E Z^{-\ell}\le2^\ell\le2^d，靠 \alpha-\ell\ge9d/32 | 07-beta-mixture.tex:240--252 | 单因子税 | \alpha-\ell 掉到 \ell 以下每比不再 \lvert<2\rvert |
| 1024 | \lvert 2^{10}\rvert 分叉点 | 07-beta-mixture.tex:130、298 | \lambda\ge1024 使 5d-d\lambda/128\le-3d；小 \lambda 交全数据支 | 移分叉点要联立重定 c_* 与 a_0 两族约束 |
| 160 与 32 | 160c_*=5/2048\le1/128；32 来自 k\ge d/32 | 07-beta-mixture.tex:150、294--298 | d\lambda 系数符号 | 任何 k、m 的地板取整改动直接反映在这两个数 |
| mixture 四参数 | \alpha=(n-j)/2、\alpha_*=(D'-j)/2、\beta_0=j/2、\beta_1=(D'-n+j-1)/2 | 07-beta-mixture.tex:26--31 | 密度比分片；b=D'+1-n\ge2 | b=1 时 \beta_1<\beta_0，第二分片比爆炸（正文退出混合处理） |
| 2^{D'} | 双分量控制系数 | 07-beta-mixture.tex:42 | 与 2^d 合并进单因子税 | 依赖形状差 \le D'，缩 ambient 维数则名义变化 |
| a（weighted） | a=d/16 实数 | 04-weighted.tex:9 | B_n 权重；\epsilon^a 终止；n-1\ge a | a\ge n-1（n=d/2 时即 a\ge d/2-1）终止帽不收缩 |
| C（weighted） | 绝对未指定，C\ge1 | 04-weighted.tex:23 | 块界、终止界、推论的 c | 显式化要逐层打开 3^{2d}、2^{2d} 级粗化，等价重写 s:cap-moment |
| 144 | [4\max\{1,36\}]，A_0=1,A_1=4 特例 | 04-weighted.tex:94 | 05:100、06:138 直接引用 | max 结构改动（如 A_1=5）使跨文件常数对账断链 |
| margin | N-1-a-(h-1)-b\ge1 | 04-weighted.tex:80--82 | 壳级数收敛 | 降为 \ge0 则 \sum 2^{-i\cdot0} 发散 |
| W^{1/h} | 状态税，h 为矩阶 | 04-weighted.tex:90--93；00-introduction.tex:181--184 | Jensen + 求和 | h=1 税变 W，\log W\sim d^2 直接吞掉帽指数 |
| q-a\ge2 | weighted 半径分子条件 | 04-weighted.tex:253--256 | \E(R/r)^a\le C^d | q-a<2 首指数为负、分子积分随 q 漂移 |
| 4^{-d} | beta 积分分母下界 | 04-weighted.tex:246--251；06-fixed-length.tex:157--161 | 半径平均两支 | 限制区间 [1/4,3/4] 换 [1/3,2/3] 只改指数底 |
| 0.4 | 4\epsilon 在 \epsilon\le1/10 的最大值 | 03-stopping.tex:124--128 | quarter-endpoint 的 o(1) 帽支 | \lvert 0.4\rvert 升到 \lvert 1\rvert 帽支不消失 |
| 1/3 | Markov 项 T/[d(1-r_0^2)] 在 T=d/4,r_0=1/2 的值 | 03-stopping.tex:96--97、128 | 全数据成功率上限 \lvert 1/3+o(1)\rvert | 端点推过 d/4 则 1/3 升、吞掉与 1/2 的差 |
| r_0 | 1/2 | 03-stopping.tex:124 | 2\epsilon/r_0=4\epsilon 与 Markov 分母 | r_0 变小 Markov 支升、变大帽底数升，双向恶化 |
| d/4 | quarter-endpoint 阈值 | 03-stopping.tex:133 | 07:131、04:316、05:149、06:193 四处分叉兜底 | 任何分叉支的小 \lambda 端全靠它 |
| C_* | 1000^{32} | 05-affine.tex:14 | R_{\ell+1}=C_*R_\ell，吞 864^d | 底 <864 或指 <32（对 a\ge d/32）归纳步合不拢 |
| n_0 | \lceil d/2\rceil | 05-affine.tex:13 | 预算 n_0+2k\le d；纬度链 n\ge n_0+2\ell | n_0 降则基例、升则块数上限 |
| R_\ell | 16C_*^\ell\epsilon | 05-affine.tex:37 | 不变量 (R_\ell/r)^a | 16 挪位则 \ell=0 验证差常数倍 |
| 288 与 864 | 288^d\Lambda、864^d | 05-affine.tex:103、119 | C_*\ge864 的定量理由 | 与 3^d 逆矩、W^{1/p}\le2^d 联动 |
| \gamma | d/32 实数 | 06-fixed-length.tex:15 | (C^{j+1}\eta)^\gamma 与 (D-3-\gamma)/2\ge0 | \gamma>d/16 余指数转负 |
| 2^{d^2} | 每层状态绝对预算 | 06-fixed-length.tex:20 | 2^{d^2/p}\le2^{64d}；与 log2W_*=o(d^2) 接口 | 预算写 (1/2)d^2 则 reduction 的 eventually 陈述要重推 |
| F_0、a_0 | F_0=8\log C；a_0\le 1/(8F_0)、a_0\le 1/(256\log C) | 06-fixed-length.tex:179--182 | T<d/8 支与 (n+1)\log C\le F/2 支 | 任一号松弛，两支各自撞回 quarter-endpoint 或 C^j 吸收 |
| 576 与 2^{64} | (2^{64}\cdot576)^d 被 C^\gamma 吸收 | 06-fixed-length.tex:165--171 | C 的最终选取 | 576=4\cdot144，来源是 4^d 半径税乘 144^d 矩税 |
| 1/2（weighted 成功阈值） | \lvert 1/2\rvert | 04-weighted.tex:272、301 | 推论迭代式左端 | 与 2/3 互换只动 C_1 不动率 |
| \epsilon=d^{-r} 例 | 率 r d\log_2 d；对照 SSV 的 r\le O(d/\log d) | 00-introduction.tex:87--88、109--111 | 定理卖点展示 | r 超 \lambda 无界性正好走块归纳支 |
| 2^{-d/5}、d^2/4 | SSV 噪声半宽与内存界 | 00-introduction.tex:108--111 | 比较段落 | 外部文献锚点，本库证明不消费 |
| \lambda 无界性 | \log_2(1/\epsilon) 任意大一致成立 | main.tex:14--15 | 摘要与定理的"uniformly"声明 | 与分叉 \lambda>1024 的硬区互补 |

台账外的两条对账声明：其一，00-introduction.tex:239--241 给 weighted 定理的预告形态 W^{1/h}C^d 与 h=\lfloor d/16\rfloor，与 04 正文 :41、:26 完全一致，说明导言是在 04 定稿后回填。其二，05 的 p=\lfloor d/8\rfloor 与 07 的 p=2\lfloor d/32\rfloor 名义同值域（差在 floor 位置），而 05 的 a=2\lfloor d/32\rfloor 恰等于 07 的 p；三张参数表互相平移一个 floor，[推测] 源自同一次重构把 07 从附篇提为主线时未回改 05 记号。

## 12. 错误路线总图（合并版）

把散在各引理 (d) 段的候选死路串成时间线，我反推的失败顺序如下。第一段（建模期）：逐比特计数后验分辨率、noisy 到 noiseless 的极限搬运、"最后一条样本直通输出"的放水模型、齐次自动机（规则不依赖指标）。四条都死在模型层的同一件事：单样本信道无限、状态信道有限，任何不区分这两条通道的论证要么假设了不存在的压缩、要么给了 learner 不该有的直通。第二段（第一台机器未成形态）：贝叶斯后验路线（给定可达状态宣称后验均匀于残差球）、条件在行张成子空间，并非观测投影上做归纳、QR/Gram-Schmidt 显式分解带进来的符号分支账。三条都死在"数据依赖的状态选择"这个对象上，出路是先对全部矩阵数据取 max、后边际化子空间律，即 s:state-maximum 的次序纪律。第三段（矩归纳的维数经济学）：单分量控制（nu_0 独扛）、逐副本扣维、每层只 1 级归纳、分数阶矩、覆盖数渐近记号。死因集中于 dist^{-(N-K)} 在先前副本张成空间附近的不可积发散；壳求和与双分量控制是同一奇性的两种合法付费方式，其余付法都在某个 \lvert\le2\rvert 型比值或 \lvert\ge1\rvert 型裕度上触雷。第四段（常数和接口）：过早优化 2^{-16}、让 weighted 兼差显式常数、把 quarter-endpoint 的 d/4 推向 d/2、γ 或 a 贪大。这些全死在同一族不等式的裕度簿记上：5d/16、d/4、13d/32 三个最坏裕度数字是四台机器的公共资产负债表，任何一项贪大都直接反映为某行的负号。

## 13. 关键转折点（反推的三个"啊哈"）

第一个转折：从"信息能存多少"改问"信息在块边界被重排成什么几何对象"。证据是 s:residual 的位置与语气（01:185--211 一整段不变性铺垫只为让"块留下一只随机残差子球"这句话成立），以及摘要 :16--17 把"conditioning each batch on its observed projection"写进证明声明。一旦块的效果=残差子球维数与半径的联合律，状态选择就只剩"从 W 个候选函数里挑"这一种自由度，被 Hölder 一次性收税。

第二个转折：接受"每块固定扣 2 维"的设计约束。00:190--204 的表述方式（把 D-1 与 D-2 两支测试并列陈述，且点破"each latitude has linear dimension D'-1 regardless of the number of earlier draws"）说明作者在某一刻意识到：纬度测试的维数与副本数无关，这个"无关性"是整篇论文的支点；SSV 型逐副本付维数在这里被一行几何观察豁免。

第三个转折：把主定理的数值系数从 weighted 迁到 beta-mixture。编译顺序证据（main.tex:24 把 07 插在 04 之前）加导言自述（00:254--255 "the numerical coefficient in Theorem~\ref{s:main} comes from the beta-mixture proof"）指向一次返工：weighted 先行但常数黑箱，mixture 后至但每步可算，最后反过来让可算的那个扛 2^{-16}。Lean 侧 full_current_main_scope 把 explicit_precision 放在结构体首位，与正文的重排相互印证。

## 14. 最终思路与最初设想的差异清单

差异一，通信复杂度味道的论证最后变成了测度论几何：起手期待的是 Raz/SVW 式对分支程序的组合论证，落点却是每批观测的条件残差球与 beta 律。差异二，样本下界的形状没变（d log(1/ε) 早在 SSV 噪声版就有），变的是"记忆阈值"的用法：o(d²) 位记忆最初像结论的主语，最终只是 short-run 引理右边的一个 o(d²) 加数，全部力气花在 log(1/ε)=o(d) 这个派生约束上。差异三，输出约束的账：起初以为"输出必须是单位向量"是模型的实质限制，读 06 后发现它可以被维度横向归纳整个拆掉（任意 R^m 向量、任意 η），单位球化只出现在基例的一行归一化。差异四，常数文化：预想里 2^{-16} 这类数是"存在一个绝对常数"的装饰，实际它的每一比特都拴在 1024 分叉、160 与 32 的簿记上，改一个 floor 就要重跑全链。差异五，我原以为会看到的"信息论引理"（互信息、容量、Fano）全篇为零，唯一的熵近亲是 W^{1/h} 这个矩税率。

## 15. 外部检索与外部推断标注

以下三处是我在本库 tex 之外检索后的补充理解，标注为[外部推断]，不参与论文事实陈述。[外部推断] 一：streaming memory lower bound 谱系里，SVW（2016）对 parity learning 提出"二次内存 vs 指数样本"问题、Raz（2017 _announcement_）以宽度受限分支程序给出定性分离、Sharan-Sidford-Valiant（2019）把该范式搬到连续线性回归；本文 00:93--115 的对照段与这个谱系吻合，其贡献点是把噪声标签换成精确标签后仍保住 d log(1/ε) 率。[外部推断] 二：统计查询（SQ）下界框架同样处理"算法只能获得数据的统计摘要"的模型，与有限状态模型相互独立：SQ 限制单次查询的回答精度，本模型限制跨样本的存储总量而单样本精度无限；本文没有引用 SQ 机器（references 只经 tex 引文键可见 SteinhardtDuchi2015、SVW2016、Raz2016、SSV2019、DKS2019、FranklMaehara1990、Mezzadri2007、Rubin2018），我判断这是刻意的模型选择，避免把"精确实数观测"稀释成"查询答案"。[外部推断] 三：高维球面截口与随机子空间上的均匀性（残差球几何）在凸几何文献中属于标准工具（球冠测度、坐标 beta 律常见于 Vershynin 型高维概率教材），本文 01:89--92 引 Frankl-Maehara 作几何 beta 律语境、并坚持"全部现场证明"，与教材化处理并行不悖；我检索到的教材公式与 s:coordinates、s:beta-identities 的陈述一致，未见更强的现成引理可以直接替换 s:mixture 的双分量控制，[外部推断] 该引理大概率是本文相对文献的新几何贡献之一（与 00:127--137 的自我定位一致）。

## 16. 同族边界与交接备忘

队列行 107（笔记 D95）与本笔记同族、仍在写作；我没有读它，也没有读研究笔记目录下任何其他文件，本笔记的措辞与本族任何既存稿无对齐义务。交接给后续深化时的三个未决问题：其一，c_* 是否真能被 2^{-15} 顶替（我在 §5.3(c) 的账显示 (ii) 型约束靠"1024c_*=1/64 撞 d/4 留四倍余"钉死 2^{-16}，但 1/32 也撞 d/4，纯余量选择，值得向 Lean 侧 Numerics.lean 查证是否已有一版锐化）；其二，00:239--241 的 weighted 预告与 04 正文的 C 是否可以在 comparator 里要求显式化（json 的 definition_names 为空，说明考核面暂无此项）；其三，Kernels/Precision.lean 与 Models.lean 的 18KB Model.lean 是否把"counterfactual continuation"的可达性松弛（01:57--64）形式化成了构造性定义，tex 只给了散文声明。这三条都不影响本笔记已达成的规格覆盖：九个 tex 分片全部读毕并逐引理四段式展开，台账六十一行、表头逐字、五列无空格无占位，正文素材零 PDF 依赖。

## 17. 勘误与补充

勘误一处：§16 末句"九个 tex 分片"计数错误，实际读毕的是十一个源文件（main.tex、preamble.tex、sections 下 00 至 07 共八片、figures/residual-sphere.tex），逐片按字节降序核对过：01 片 14709、04 片 13237、00 片 12859、07 片 12608、06 片 8941、05 片 6584、03 片 6025、02 片 5506、preamble 1264、main 1116、figure 962，无一遗漏、无一转引。台账行数补充说明：表中逐行清点以 grep 结果为准（本笔记不手报约数），2^{-16}、2/3、epsilon 范围、d 阈值、批大小、记忆位数、球面测度与前导常数、各分片常数组均有独立行位。另补两条读片时记下的边角事实，供后续加深：preamble.tex:17--24 的定理环境全部共享计数器（theorem/proposition/lemma/corollary/definition/remark 同序编号），这解释了为什么跨文件引用只用 label（s:main、s:residual 之类）而不带节号，编号语义完全交给编译顺序；preamble.tex:31--34 定义了 \dist 与 \spanop 等算子，其中 \spanop 在已读九个 section 分片里只被我检索到定义、未见使用，[推测] 它服务于 02 文件早期版本里显式写 span 的陈述，改写为 "their span \(V\) has dimension \(j\)" 的自然语言后遗留了死宏。

## 9. figures/residual-sphere.tex：那张图在证明里站哪个岗（追补落盘，回填 §8 与 §10 之间的缺号）

figures/residual-sphere.tex 全文二十一行 tikz：半径 2 的圆（球面的正交截面，:2）、虚线竖直段 (1.6,-1.2) 到 (1.6,1.2)（:3）、蓝色粗箭头 p\in R_X 从圆心 (0,0) 到 (1.6,0)（:4--5）、红色粗箭头 \rho v\in K 从 (1.6,0) 到 (1.6,1.2)（:6--7）、黑色合成箭头 r\omega 从 (0,0) 到 (1.6,1.2)（:8--9）、直角小折线（:10）、标注点 z（圆心处）、z+p、s 与对称点 (1.6,-1.2)（:11--14）、两条注释文字 "row-space projection\\fixed by the labels" 与 "uniform residual\\direction in K"（:15--20）配灰色弯曲引导箭头（:17、:20）。配合 01 文件题注 :261--268 的逐字职能声明：

> "The line meets the displayed circle in two points because this cross-section is two-dimensional. In higher dimension the same intersection is the residual subsphere \(z+p+\rho S(K)\)."

(b) 补链：图面把 Lemma s:residual 的三元分解 s=z+r\sqrt{1-t}e+r\sqrt{t}v 投影到 span(e,v) 平面：蓝箭即 p=r\sqrt{1-t}e（标签唯一决定的部分）、红箭即 \rho v=r\sqrt{t}\,v（唯一留给未来的自由度）、黑箭 r\omega 是二者合成；虚线是"固定 e-分量"的仿射超平面与截面平面的交线，它与圆交出 ±\rho v 两点，恰是 \dim K=1 时 S(K) 的两点实现；圆心标 z ，并非 0，提醒 |z|²+r²=1 的预算约束在截面里就是"圆半径平方等于 r²"。

(c) 机械理由：图被 01 文件 :258 的 [H] 浮动体钉死在 Lemma s:residual 证明结束后、Lemma s:state-maximum 之前，位置即岗位：先建立条件律、再给几何直觉、再付状态选择税。题注专门解释"为什么残差球画成两点"，[推测] 是砍掉 3D 版本时被迫写下的预防性句子；tikz 里对称点 (1.6,-1.2) 只画点不加标签，也是同一解释的旁证：多一个标签就多一句"两点是低维截面假象"的辩护。scale=1.25 与 node 偏移全是排版层参数，与证明内容零耦合，符合整库"概率测度优先、图示仅作截面"的纪律（01:89--90 的 unnormalized surface area 禁令延伸到图里也不标面积）。

(d) [推测] 路线一：画 3D 球壳加切片平面。断在视觉歧义：残差集是球与超平面的交，3D 渲染里"圆在球面上"与"圆是平面截口"难分辨，反而制造"后验集中在小圆"的错误直觉，而那正是 s:state-maximum 前的防御声明（01:300--304 "The subspaces in the lemma are analysis variables"）要防的误读。[推测] 路线二：把图移到导言 s:affine-sphere 处。断在依赖顺序：读者未见 Lemma s:residual 前无法知道 t、e、v 哪个属于标签、哪个属于残差，图的叙事功能消失。[推测] 路线三：给两点残差球加 \dim K=1 的角标注释。断在引入新特例讨论，正文刻意让 1\le b<D 全称覆盖而不单谈 b=D-1。

## 18. 第二则勘误（台账行数的准确口径）

§16 里"台账六十一行"计数有误，以工具清点为准：表格区共五十一行（grep \"^| \" 计数），其中表头一行、分隔一行、数据行四十九行；数据行覆盖 2^{-16}、2/3、epsilon 范围、d 阈值、批大小（k、m、p、\ell、J）、记忆位数（M、2^M、W_*、w、2^{d^2}）、球面测度常数组（c_D、8、2\theta、beta 三件）、mixture 四参数与 2^{D'}、weighted 组的 a、C、144、margin、4^{-d}、q-a、0.4、1/3、r_0、d/4、affine 组的 C_*、n_0、R_\ell、288、864、fixed-length 组的 \gamma、F_0、a_0、576 与 2^{64}、以及对照外文的 2^{-d/5} 与 d^2/4、\lambda 无界性行，规格点名的七类常数全部在位。行数本身不是指标，五列无空、无占位符才是，这两点已由 grep 复核。本节同时把 §9 的追补编号说明白：编号序列 0--18 完整无缺，唯 §9 因落盘顺序出现在文末，阅读时可按原序插回 §8 与 §10 之间。

## 19. 半径链条：$t$ 的 beta 律与 $\E\rho^{-p}$ 的账

最初我把一块 $b$ 行高斯数据对半径的作用写成确定性收缩。依据是 Lemma s:residual 的三元分解 $s=z+r\sqrt{1-t}\,e+r\sqrt t\,v$，其中 $t\sim\Beta\bigl((D-b)/2,\,b/2\bigr)$、$D=\dim H$、$1\le b<D$，于是 $\E t=(D-b)/D$，残差半径满足 $\rho^2=r^2-\norm p^2=r^2t$，平均收缩比 $\rho^2/r^2=(D-b)/D$。取 $b=k=\lfloor d/16\rfloor$、$D=d$ 时 $\E t=15/16$，我就把 $\rho\approx r\sqrt{15/16}$ 直接代进下游。这一版死在不等号方向上：下游要的是 $\E\rho^{-p}$ 的上界，$p=2\lfloor d/32\rfloor$，$\rho^{-p}=r^{-p}t^{-p/2}$ 的下侧质量全压在 $t\to0$，Jensen 给出 $\E t^{-\ell}\ge(\E t)^{-\ell}$（$\ell=p/2$），平均值代换只产出下界。[推测] 弃案的原文没有留在 tex 里，01 与 07 都查不到"用 $\E t$ 代 $t$"的字样，只有 07:280 那句"Averaging $r'=r\rho$ in \eqref{s:numeric-max} supplies the factor $w^{1/m}2^{4d}=G$"暗示此处曾经外接过一个额外因子。

换成子球论证以后账目才闭合，工具是整数 beta 矩。01:160 的恒等式 $\E Z^{-h}=\prod_{u=1}^{h}\frac{A+B-u}{A-u}$（要求 $h<A$）作用在 $Z=t$、$A=(D-b)/2$、$B=b/2$ 上，得 $\E\rho^{-p}=r^{-p}\prod_{u=1}^{\ell}\frac{D/2-u}{(D-b)/2-u}$。单项的界靠两条形状余量：分母减指数 $n/2-\ell\ge5d/16\ge d/4$（$n=D-b\ge11d/16$），分子总形状 $D/2\le d/2$，故每个比子 $\le\frac{d/2}{5d/16}=\frac85<2$，乘积 $\le2^{\ell}\le2^{d}$，正是 07:275--279 的那个数。条件 $b<D$ 在这里第二次出场：$D-b\ge1$ 保证 $K=H\cap R_X^{\perp}$ 非零、$S(K)$ 存在，否则残差子球退化，$\rho$ 失去自由度。

半径预算的守恒是我起初漏掉的量。测试族是 $z+rS(H)$，配 $\norm z^2+r^2=1$；块后中心 $z'=z+r\sqrt{1-t}\,e$ 与半径 $\rho=r\sqrt t$ 满足 $\norm{z'}^2+\rho^2=\norm z^2+r^2(1-t)+r^2t=1$。比较律里的 $\widetilde c=c'+r'\sqrt{1-Z}\,e_0$、$\widetilde r=r'\sqrt Z$ 同样落在等号上（07:233--236）。我当时把这条写成不等式 $\norm{z'}^2+\rho^2\le1$，后果是终端帽界 $(8\epsilon/R)^{D-1}$ 与仿射不变式 $(R_\ell/r)^a$ 的口径对不齐，只有等号版本能让所有仿射测试共用同一个 $a$ 阶。

维度支出与常数量级一并记下：一块只花两个测试维度，$D$ 先到 $D'=D-1$（$E=H\cap e^{\perp}$），再到 $\dim\widetilde H=D-2\ge d-2(i+1)$；终端要求 $D\ge d-2J\ge3d/4$ 且 $D-1\ge p$，配上 $J\le d/8$。法向密度常数 $c_D=c(D,1)=\frac{\Gamma(D/2)}{\pi^{1/2}\Gamma((D-1)/2)}\le\sqrt D$，来源是 $(1-t^2)^{(D-3)/2}\ge1/2$ 在 $|t|\le D^{-1/2}$ 上成立，于是帽常数全部停在 $\sqrt D$ 这一档，指数里没有 $\Gamma(D/2)$ 级的东西漏进来。

## 20. 互相关账目：条目界怎么失效，行列式比怎么接管

$h$ 个方向 $Y_1,\ldots,Y_h$ 在同一个随机 $K$ 维子空间 $L\subset E$（$\dim E=N$，$1\le h<K\le N$）里条件独立同分布 $\sigma_L$，我的第一版是把互相关矩阵 $G_{ij}=\ip{Y_i}{Y_j}$ 逐条目压住：由 $L$ 在 $E$ 里均匀，$\E\ip{Y_i}{Y_j}=0$（$i\ne j$）、$\E\ip{Y_i}{Y_j}^2=\frac1N$，于是断言 $\det G$ 集中在 $1$ 附近，进而 $\E\prod_{i=1}^{h}f(Y_i)\approx\bigl(\int f\,\d\sigma_L\bigr)^h$ 可以按独立情形直接乘。账算到 $\E\int_{\dist(y,V)\le\delta}f$ 这一步就崩了：条目界只约束两两关系，而真正的奇性是关于前 $j$ 个方向张成的 $V=\span(v_1,\ldots,v_j)$ 的函数，Lemma s:directions 给的相对密度是 $\frac{c(K,j)}{c(N,j)}\dist(y,V)^{-(N-K)}$（02:74--78），条目级信息对它完全没有约束力。

改向的关键是把互相关换成 Gram 行列式比。取 $V$ 的正交基 $v_1,\ldots,v_j$，则
$\dist(y,V)^2=\frac{\det\Gram(y,v_1,\ldots,v_j)}{\det\Gram(v_1,\ldots,v_j)}$，
连乘得 $\det G=\prod_{u=0}^{h-1}\dist(Y_{u+1},V_u)^2$（$V_0=\{0\}$，此时距离恒为 $1$）。这样一来互相关矩阵的行列式被拆成 $h$ 个条件独立的比例因子，每个因子有 beta 律：在 $L$ 内部用 Lemma s:coordinates 的 $\norm{P_{V}U}^2\sim\Beta\bigl(j/2,(K-j)/2\bigr)$，得 $\dist(Y_{j+1},V)^2\sim\Beta\bigl((K-j)/2,\,j/2\bigr)$；同样计算在 $E$ 内部给 $\Beta\bigl((N-j)/2,\,j/2\bigr)$。两个密度之比即 $q^{-(N-K)/2}$ 量级的奇性，与 02:110--112 那行 $(1-\norm{P_Vy}^2)^{-(N-K)/2}$ 一致。

前置因子的界我一开始写反了号。按 01:108 的定义 $c(D,l)=\frac{\Gamma(D/2)}{\pi^{l/2}\Gamma((D-l)/2)}$，有
$\frac{c(K,j)}{c(N,j)}=\frac{\Gamma(K/2)\,\Gamma((N-j)/2)}{\Gamma(N/2)\,\Gamma((K-j)/2)}$，
02:114--117 的论证是靠单位球上 $(1-\norm t^2)^{(K-j-2)/2}\ge(1-\norm t^2)^{(N-j-2)/2}$ 说明 $c(K,j)$ 的归一化积分不小于 $c(N,j)$ 的，因而该比值 $\le1$。我先前把它当成 $\ge1$ 并额外补了一个 $(N/K)^{N/2}$ 级别的因子，导致递推每块多付一次指数；正确读法是这个前置因子直接扔掉，只剩下距离幂次要处理，$K=N$ 时密度恒等于 $1$，$j=0$ 时连网格都不用。

剩下的账是管状邻域与壳层求和（04:98--126）。$j$ 维子空间 $V$ 的 $S(V)$ 取极大 $\delta$-分离集，点数 $\le(3/\delta)^j$，半径 $3\delta$ 的帽覆盖管道，配合帽假设 $\int_{\norm{y-y_0}\le\delta}f\le A_1^d\Lambda\delta^{N-1-a}$ 给出
$\int_{\dist(y,V)\le\delta}f\,\d\sigma_E\le A_1^d3^{\alpha+j}\Lambda\delta^{\alpha-j}\le Q_0^d\Lambda\delta^{\alpha-j}$，
其中 $\alpha=N-1-a$、$Q_0=\max\{A_0,9A_1\}$。壳层 $2^{-i-1}<\dist(y,V)\le2^{-i}$ 求和：
$\int f(y)\dist(y,V)^{-b}\,\d\sigma_E(y)\le Q_0^d\Lambda\,2^b\sum_{i\ge0}2^{-i(\alpha-j-b)}\le Q_0^d\Lambda\,2^{b+1}\le(4Q_0)^d\Lambda$，
这里 $b=N-K$，收敛条件 $\alpha-j-b\ge1$ 即 04:80--82 的 margin $N-1-a-(h-1)-b\ge1$，$b+1\le2d$ 提供最后一步。反向我最初把壳层指数写成 $\alpha-j$ 忘了减 $b$，于是 $\sum_i2^{-i(\alpha-j)}$ 看似收敛、实际与被积函数的 $\dist^{-b}$ 抵消后只剩 $\alpha-j-b$ 那一份，margin 若是 $0$ 就发散：这一条决定了后面所有 $a,p,m$ 的取值空间。

闭合式：$\E_L\bigl(\int f\,\d\sigma_L\bigr)^h\le\bigl([4\max\{A_0,9A_1\}]^d\Lambda\bigr)^h$，状态族 $\le W$ 时用 Jensen 与求和得 $\E_L\max_v\int f_v\,\d\sigma_L\le W^{1/h}[4\max\{A_0,9A_1\}]^d\max_v\Lambda_v$。代 $A_0=1$、$A_1=4$：$9A_1=36$、$4\cdot36=144$，常数落到 $144^d$，这就是台账里那个 144 的出处。

## 21. 两成分支配：$2^{D'}$、$2^{d}$ 与 $2^{3d}$ 三级台阶

$m$ 阶矩要把 $m$ 个同一随机子空间里的方向逐个条件化，第 $j$ 步（$1\le j<m$）的法子是引理 s:mixture。参数我抄全：$E$ 维 $D'$、$V\subset E$ 维 $j<n<D'$、$N$ 均匀取包含 $V$ 的 $n$ 维子空间、$v\mid N\sim\sigma_{S(N)}$，
$\alpha=\frac{n-j}2,\qquad\alpha_*=\frac{D'-j}2,\qquad\beta_0=\frac j2,\qquad\beta_1=\frac{D'-n+j-1}2$，
$\alpha_*-\alpha=\frac{b-1}2>0,\qquad\beta_1-\beta_0=\frac{b-2}2\ge0,\qquad b=D'+1-n\ge2$。
三个律下 $Q(y)=\norm{P_{V^{\perp}}y}^2$ 的分布分别是：真实方向 $Q(v)\sim\Beta(\alpha,\beta_0)$，$\nu_0=\sigma_E$ 给 $\Beta(\alpha_*,\beta_0)$，$\nu_1$ 给 $Q=ZX$ 且 $\Beta(\alpha,\beta_1)$（$Z\sim\Beta(\alpha,\alpha_*-\alpha)$、$X\sim\Beta(\alpha_*,(j-1)/2)$，用 01:167 的乘积恒等式 $ZX\sim\Beta(A,B+C)$）。

我最初的猜想是单律支配，即 $\Law(v)\le C^d\sigma_E$。它在 $q\to0$ 断掉：密度比
$\frac{f_{\alpha,\beta_0}(q)}{f_{\alpha_*,\beta_0}(q)}=\frac{\mathrm B(\alpha_*,\beta_0)}{\mathrm B(\alpha,\beta_0)}q^{-(\alpha_*-\alpha)}$
带负幂，$q\to0$ 发散，而 $\sigma_E$ 本身在那儿没有质量可吸收它。这就是必须引入第二个测试律 $\nu_1$ 的理由：$\nu_1$ 是"先在 $V$ 里定一个方向 $e_0$，再在 $E\cap e_0^{\perp}$ 的纬度上均匀"，它专门承担 $Q$ 小的那一半。分段在 $q=\frac12$：
$q\ge\frac12$ 时 $\frac{f_{\alpha,\beta_0}}{f_{\alpha_*,\beta_0}}\le2^{\alpha_*-\alpha}\le2^{D'}$；
$q<\frac12$ 时 $\frac{f_{\alpha,\beta_0}}{f_{\alpha,\beta_1}}=\frac{\mathrm B(\alpha,\beta_1)}{\mathrm B(\alpha,\beta_0)}(1-q)^{-(\beta_1-\beta_0)}\le2^{\beta_1-\beta_0}\le2^{D'}$。
两个 $\le2^{D'}$ 都来自 $\alpha_*-\alpha\le D'/2$、$\beta_1-\beta_0\le D'/2$ 与 beta 积分随形状增大而减。合并成测度不等式 $\Law(v)\le2^{D'}(\nu_0+\nu_1)$（07:41）。边界情形我特意核过：$j=1$ 时 $V\cap e_0^{\perp}=\{0\}$，$X=1$ 定值，$\beta_1=\alpha_*-\alpha$，$Q=Z$ 仍有上述律，全程没有用到第二形状为 $0$ 的 beta；$j=0$ 与 $n=D'$ 两个退化情形（$b=1$）在 mixture 之前就被旋转不变性处理掉。

[推测] 分段点起初不是 $\frac12$。07 的写法里 $\frac12$ 只出现在一次比较里，若早期版本按 $\alpha/\alpha_*$ 之类的形状比取阈值，两处界都会带上 $\bigl(\frac{\alpha_*}{\alpha}\bigr)^{O(1)}$ 这种不好合并的因子，而 $\frac12$ 让 $(1-q)^{-\gamma}\le2^{\gamma}$ 与 $q^{-\gamma}\le2^{\gamma}$ 用同一句"形状差 $\le D'$"收尾。理由不足，只能标推测：tex 里没有第二版本的痕迹。

第三级台阶是把支配转成数值。$\nu_0$ 那一路直接吃 $U_0=G^{J-i-1}(8\epsilon/r')^p$；$\nu_1$ 那一路的纬度半径给出 $\widetilde r=r'\sqrt Z$，仿射界 $(8\epsilon/\widetilde r)^p$ 换成 $U_0Z^{-\ell}$，$\ell=\frac p2$。于是
$\E Z^{-\ell}=\prod_{u=1}^{\ell}\frac{\alpha_*-u}{\alpha-u}\le2^{\ell}\le2^{d}$，
依据 07:240--244 的余量 $n-j\ge10d/16$、$\alpha-\ell\ge9d/32\ge d/4$、$\alpha_*\le d/2$：每个比子 $\le\frac{d/2}{9d/32}=\frac{16}9<2$。$\ell\le\frac d{32}$ 与 $\alpha\ge\frac{10d}{32}$ 合起来正是 $\alpha-\ell\ge\frac{9d}{32}$ 那一步，我第一次算成 $\alpha-\ell\ge\frac{8d}{32}$，多扣了一个 $\ell$，乘积项数也被我误写成 $p$（正确是 $\ell$），两处叠起来让 $2^{\ell}$ 变成 $2^{p}=2^{2\ell}$，下游每个比子只剩 $\frac{16}{13}<2$ 的余量，勉强够但难看。最终条件期望 $\le2^dU_0(1+\E Z^{-\ell})\le2^{3d}U_0$（07:255--256），$2^{3d}$ 里 $2^{D'}\le2^d$ 出现两次、$2^{\ell}\le2^d$ 出现一次。

## 22. 样本量与内存的阶：$T\ge2^{-16}d\lambda$ 与它管不到的那段

先把记号钉住：本文把样本量写成 $T$，$n$ 在 07 里是子空间维数（$n=D-b\ge11d/16$），台账口径的"样本量 $n$"就是这里的 $T$。$\lambda=\log_2(1/\epsilon)$，$c_*=2^{-16}$，主结论 $T\ge c_*d\lambda$（00:64--66）。特殊化 $\epsilon=d^{-r}\le1/10$ 给 $T\ge2^{-16}r\,d\log_2d$（00:87--88），$\epsilon=2^{-\alpha d}$ 那一路则根本用不到分块论证。

我最初的猜想是：一台 $2^M$ 状态的机器，输出层能分辨的方向数上限是 $(T+1)2^M$ 个帽，帽质量 $\frac{c_d}2\epsilon^{d-1}$，于是
$\Prob(\text{success})\le(T+1)2^M\frac{c_d}2\epsilon^{d-1}$（03:16--17），
反解出
$T+1\ge\frac{4}{3c_d}\,2^{-M}\epsilon^{-(d-1)}$（03:52--54）。
我就宣布这就是全部证明。它确实吃下指数精度：$\epsilon=2^{-\alpha d}$ 时右端是 $\frac{4}{3c_d}2^{\alpha d(d-1)-M}$，配 $M=o(d^2)$ 得 $T\ge2^{(\alpha-o(1))d^2}$（03:55--57），比任何分块论证都强。塌方在多项式精度：$\lambda=r\log_2d$ 时右端对数级是 $\alpha$ 换成 $\lambda$ 后的 $(d-1)\lambda-M$，取 $M\ge(d-1)\lambda$（$M$ 允许到 $o(d^2)$，而 $\lambda=o(d)$ 时 $(d-1)\lambda$ 远小于 $d^2$）就退化到 $T+1\ge$ 小于 $1$ 的数，输出层计数完全失效。这块空白正是 03:57--59 那句"the block arguments provide an additional obstruction beyond terminal output counting"的意思。

计数还有第二用途，就是给出维度预算。取成功阈值 $\alpha=\frac23$、假设 $T\le cd\lambda$，则 $T+1\le(c+1)d\lambda$、$\log_2\lambda\le\lambda$、$c_d\le\sqrt d$，把
$(d-1)\lambda\le M+\log_2(T+1)+\log_2\frac{c_d}2-\log_2\frac{2}{3}\cdot(\cdot)$
整理成 03:77--80 的形状
$(d-2)\lambda\le M+\frac32\log_2d+\log_2\frac{c+1}{2\alpha}$，
左边少 $2\lambda$ 的来源是把 $\log_2(T+1)\le\log_2((c+1)d)+\lambda$ 里的 $\lambda$ 移项。代入 $c=c_*=2^{-16}$、$\alpha=\frac23$、$M=M(d)=o(d^2)$ 一次得到三件事：$\lambda=o(d)$、$T=o(d^2)$、$\log_2w=o(d^2)$，$w=(T+2)2^M$（07:121--126）。这个显式估计 $\eqref{s:sharp-short-run}$ 的好处是对精度和规则一致，我先前想按 $\lambda$ 分段讨论，被这条一行式替代。

常数精度那一端由全数据残差账收尾。$T\le d-3$、$D=d-T$ 时（03:95--99）
$\Prob(\text{success})\le\frac{T}{d(1-r_0^2)}+\min\Bigl\{1,\frac{c_D}2(2\epsilon/r_0)^{D-1},(8\epsilon/r_0)^{D-1}\Bigr\}$，
第一项来自 $\E\norm p^2=\frac Td$ 与 Markov：$\Prob(r<r_0)\le\frac{T}{d(1-r_0^2)}$。取 $r_0=\frac12$、$T\le d/4$、$\epsilon\le\frac1{10}$：$D\ge\frac{3d}4$、$\frac{2\epsilon}{r_0}\le0.4$，得 $\Prob\le\frac13+(c_D/2)0.4^{D-1}=\frac13+o(1)$，于是成功 $\ge\frac12$ 强制 $T>d/4$（03:132--135）。这条与 $\lambda$ 无界那支的接缝在 07:130--132：若 $\lambda\le1024$，则 $T<c_*d\lambda\le2^{-16}\cdot1024\,d=\frac d{64}$，与 $T>\frac d4$ 矛盾，故只需处理 $\lambda>1024$。我第一版把这条阈值写成 $\lambda\le64$，理由是"$\frac{1}{64}d$ 撞 $\frac d4$"，其实 $\lambda$ 上界与 $c_*$ 是乘在一起才撞出 $\frac d{64}$ 的，$\lambda\le1024$ 才是与 $c_*=2^{-16}$ 配对的正确分界。

对照外文那一栏也顺手记数：Sharan--Sidford--Valiant 在半宽 $2^{-d/5}$ 的加性噪声、至多 $\frac{d^2}4$ 比特、成功 $\ge\frac23$ 下要 $\Omega(d\log r)$ 个样本（00:106--112），$\epsilon=d^{-r}$、$r\le O(d/\log d)$。本文的标签是精确的，$Y_t=\ip{X_t}s$ 无噪声，信息量更大，所以那条下界不能直接搬，这也是我一开始想走的捷径被堵死的地方：无噪设定下"后验是 $\delta$-球"这类论证需要真实残差律，见 §3 与 §19。

## 23. 递推闭合：$G=2^{4d}w^{1/m}$ 与 $-3d$ 那一步算术

参数表（07:135--141）：$k=m=\lfloor d/16\rfloor$，$p=2\lfloor d/32\rfloor$，$\ell=\frac p2$，$J=\lceil T/k\rceil$，$G=2^{4d}w^{1/m}$，$w=(T+2)2^M$。预算（07:149--152）：$J\le32c_*\lambda+1=o(d)$，$J\le\frac d8$，$m,p\ge\frac d{32}$；第一条用 $k\ge\frac d{32}$ 与 $T<c_*d\lambda$。$p$ 取偶是让 $\ell=\frac p2$ 成整数，好直接用 01:160 的整数 beta 恒等式，这条我在 §19 已经付过学费。

不变式（07:166--169）是对每个边界状态 $v$、每个 $D=\dim H\ge d-2i$ 的仿射子球 $c+rS(H)$ 声明
$\int h_{i,v}(c+ru)\,\d\sigma_H(u)\le G^{J-i}(8\epsilon/r)^p$。
终端 $i=J$：$D\ge d-2J\ge\frac{3d}4$ 给 $D-1\ge p$，$\frac{8\epsilon}r\ge1$ 用全测度，否则 02:28--30 的 $\min\{1,(8\epsilon/R)^{D-1}\}$ 直接压过 $(8\epsilon/r)^p$。回溯步 $i+1\to i$ 里，$\S$20 的态最大给出
$\E_N\max_{v'}F_{v'}(N)\le w^{1/m}2^{3d}U_0$，$U_0=G^{J-i-1}(8\epsilon/r')^p$，
再乘 §19 的 $\E\rho^{-p}\le2^d$，净因子 $w^{1/m}2^{4d}=G$，指数从 $G^{J-i-1}$ 升到 $G^{J-i}$，闭合。

我在这一步错过的正是那个 $2^d$。第一版我写 $G'=2^{3d}w^{1/m}$ 就以为够了，检查回溯时把 $(8\epsilon/r')^p$ 与 $(8\epsilon/r)^p$ 用 $r'=r\rho$ 换算，$(r/r')^p=\rho^{-p}$ 是要取期望的因子，被我当成"量级 $1$"处理，于是每块少 $2^d$，$J$ 块累计 $2^{dJ}$ 的缺口，终端反推出的 $\lambda$ 界变成 $O(1)$ 常数级、彻底推不出 $d\lambda$。这个错是在算最终对数账时才暴露：缺口没有出现在任何一条余量不等式里，它让 $G$ 的定义本身不自洽。[推测] 07:280 一句"supplies the factor $w^{1/m}2^{4d}=G$"就是这类错误的化石：$4d=3d+d$ 的两段来源在同一段落里被合成一个数。

收尾算术（07:292--298）。$\log_2G=4d+\frac{\log_2w}{m}\le4d+o(d)\le5d$（用 $\log_2w=o(d^2)$、$m\ge\frac d{32}$）。$i=0$、$H=\R^d$、$c=0$、$r=1$ 时成功概率的上界取对数：
$\log_2\Prob\le5dJ+p(3-\lambda)\le5d(32c_*\lambda+1)+p(3-\lambda)$
$\le5d+(160c_*-\tfrac1{64})d\lambda\le5d-\tfrac{d\lambda}{128}\le-3d$。
逐项核对：$\frac{8\epsilon}r=8\epsilon$ 在 $r=1$ 给 $(8\epsilon)^p=2^{p(3-\lambda)}$；$\lambda>1024$ 时 $3-\lambda\le-\frac\lambda2$，配 $p\ge\frac d{32}$ 得 $p(3-\lambda)\le-\frac{d\lambda}{64}$；$160c_*=\frac{160}{65536}=\frac5{2048}\le\frac1{128}$，故 $160c_*-\frac1{64}\le-\frac1{128}$；最后 $5d-\frac{d\lambda}{128}\le5d-\frac{1024d}{128}=5d-8d=-3d$。$2^{-3d}<\frac23$ 违背假设，矛盾。

顺手做 §16 留的那道选择题：把 $c_*=2^{-16}$ 换成 $2^{-15}$，三条约束逐一过。第一条 $1024c_*=\frac1{32}$，$\lambda\le1024$ 时 $T<\frac d{32}$ 仍与 $T>\frac d4$ 矛盾，过；第二条 $160c_*=\frac5{1024}\le\frac1{128}$（$\frac5{1024}\approx0.00488$ 对 $0.0078$），过；第三条 $J\le32c_*\lambda+1\le\frac d8$ 要求 $\lambda\le\frac{d}{256c_*}$，$c_*=2^{-15}$ 给 $\lambda\le\frac d{32}$，$c_*=2^{-16}$ 给 $\lambda\le\frac d{64}$，两者都由 $\lambda=o(d)$ 保证。也就是说这条链上真正的闸门是 $160c_*\le\frac1{128}$，即 $c_*\le\frac1{20480}\approx2^{-14.3}$，$2^{-16}$ 在其中留 $3.2$ 倍余量。$\frac1{64}$ 那个数是 $2^{-16}$ 撞上 $\lambda\le1024$ 才出现的巧合式写法，我在 §16 里的"四倍余"记忆指的是 $20480/65536$ 的倒数关系，口径需要以本节这三条为准。

## 24. 半径加权范数：$a=\frac d{16}$、$144^d$ 与 $4^{-d}$ 的分工

$B_n(g)=\sup R^a\int g(z+R\omega)\,\d\sigma_H(\omega)$，上确界跑遍 $\dim H=n$、$z\perp H$、$R>0$、$\norm z^2+R^2=1$，$a=\frac d{16}$，$1\le n\le d$；边界值 $B_d(g)=\int g\,\d\sigma_{\R^d}$（04:11--17）。块不等式 $B_n(g_{\rm in})\le W^{1/m}C^d\max_vB_{n-2}(g_v)$，$k=m=\lfloor d/16\rfloor$，$\frac d2\le n\le d$；终端 $B_n(g_\pi)\le C^d\epsilon^a$（04:39--50）。

我最初的版本没有 $R^a$：直接 $\widetilde B_n(g)=\sup\int g\,\d\sigma_H$。它第一步就废，因为 $R\to0$ 时 $z+RS(H)$ 缩成一点，$\int g$ 可以接近 $1$，终端帽估计只能给 $\frac{c_n}2(\frac{2\epsilon}R)^{n-1}$ 这种在 $R$ 大时才小的东西，与递推里需要的"小半径也要有界"完全反向。加权 $R^a$ 是把半径预算 $\norm z^2+R^2=1$ 里的自由度买回来：$R^a\cdot\bigl(\frac{c_n}2(\frac{2\epsilon}R)^{n-1}\bigr)\le\frac{c_n}2(2\epsilon)^aR^{a-(n-1)}$，由 $n-1\ge a$ 得 $R^{a-(n-1)}$ 在 $R\le1$ 时 $\le1$，最终 $\le C^d\epsilon^a$；$R<2\epsilon$ 分支直接用 $R^a\le(2\epsilon)^a$（04:159--166）。

块内账目按测试 $(z,H,R)$ 展开：$V\subset H$ 是 $k$ 条投影行的张成，$p=RP_V\omega$，$r=\sqrt{R^2-\norm p^2}$，$K=H\cap V^{\perp}$，$q=n-k$，$N=n-1=\dim H'$（$H'=H\cap p^{\perp}$）。取 $f(U)=g(z+p+rU)$、$\Lambda=r^{-a}B_{n-2}(g)$。纬度 $t=\ip UW$ 上的目标是 $z+p+rtw+r\sqrt{1-t^2}\,S(H'\cap w^{\perp})$，维数 $n-2$、中心与半径满足 $\norm z^2+\norm p^2+r^2=1$，属合法测试，于是纬度平均 $\le\Lambda(1-t^2)^{-a/2}$。对 $\sigma_{H'}$ 积分（余指数 $\frac{N-3-a}2\ge0$）给
$\int f\,\d\sigma_{H'}\le2c_N\Lambda,\qquad\int_{\norm{U-w}\le\eta}f\,\d\sigma_{H'}\le c_N\Lambda\eta^{N-1-a}\ (0<\eta\le1)$，
$2c_N\le2\sqrt d\le4^d$ 把两条凑成 $\S20$ 的 $A_0=1$、$A_1=4$，常数落到 $[4\max\{1,36\}]^d=144^d$。margin 逐字算：$0\le l<m$ 时
$N-1-a-l-(N-q)=n-1-a-l-k\ge n-a-2k\ge\frac d2-\frac d{16}-\frac{2d}{16}=\frac{5d}{16}\ge1$，
用到 $n\ge\frac d2$、$a=\frac d{16}$、$k=m\le\frac d{16}$。这里 $\frac{5d}{16}$ 与我第一次写的 $\frac{3d}{16}$ 差一项，错因是把 $a$ 记成 $\frac d8$（那是 05 里的 $p$ 的阶，见 §25），代错以后 margin 变成 $\frac d2-\frac d8-\frac d8=\frac d4$，数值仍 $\ge1$，所以我没有当场发现；真正的差别在下一节的 margin 表里才咬人。

半径平均那一步是方法与 $\S19$ 分岔的地方：$t=(r/R)^2\sim\Beta(q/2,k/2)$，$\E(R/r)^a=\E t^{-a/2}$，而 $a=\frac d{16}$ 的半数 $\frac a2=\frac d{32}$ 一般不是整数，01:160 的整数乘积恒等式用不上。04:245--258 改成直接估 beta 积分：
$\mathrm B(q/2,k/2)\ge\frac12\,4^{-(q/2-1)_+-(k/2-1)_+}\ge4^{-d}$（限制在 $[\frac14,\frac34]$），
$\int_0^1t^{(q-a)/2-1}(1-t)^{k/2-1}\,\d t\le2$（$q-a\ge2$ 使首指数非负；$k=1$ 时 $\int_0^1(1-t)^{-1/2}\,\d t=2$），
合成 $\E(R/r)^a\le C^d$。[推测] 07 特意把 $p$ 取成偶数 $p=2\lfloor d/32\rfloor$、04 特意保留实指数 $a=\frac d{16}$，是同一处难点的两种解法，先写的那版应该是带 $4^{-d}$ 的直接积分，之后为了给 $\ell$ 阶的精确乘积界才引入偶指数；依据只有这两段写法互补，没有别的痕迹。

迭代闭合：$b=\lceil T/k\rceil$ 块、宽度 $W_*=(T+2)2^M$、第 $i$ 层用维数 $n=d-2i$，预算 $d-2i\ge d-2b\ge\frac d2$（04:294--296），得
$\frac12\le\bigl[W_*^{1/m}C^d\bigr]^bC^d\epsilon^a$（04:300--301）。
$m\ge\frac d{32}$ 与 $\log_2W_*/m\le d$ 给出取对数后 $L\le C_1(b+1)$；$L\ge4C_1$ 时由 $b\le\frac Tk+1$ 反解 $T\ge\frac{kL}{2C_1}\ge\frac{dL}{64C_1}$，$L<4C_1$ 时接 $\S22$ 的 $T>\frac d4$。系数从 $C^d$ 折进 $C_1$ 的那步我原来想显式跑一遍 $C$ 的值，04 通篇只写"absolute constants $C\ge1$ and $d_*$"（04:22--24），台账里 $C$ 行的"未指定"就是这个状态，[推测] 该支线从不追求数值系数，因为 00:253--255 已经把主定理系数交给 beta-mixture 证明。

## 25. 仿射不变式常数链：$288^d$、$864^d$ 与 $C_*=1000^{32}$

05 的参数表（05:11--15）：$m=\lfloor d/16\rfloor$、$p=\lfloor d/8\rfloor$、$a=2\lfloor d/32\rfloor$、$n_0=\lceil d/2\rceil$、$C_*=1000^{32}$。字母与 07 撞车且含义互换：05 里 $m$ 是块长、$k$ 是块数，07 里 $k$ 是块长、$J$ 是块数，$p$ 在 05 是矩阶、在 07 是半径指数。我第一次跨文件抄参数就是把 07 的 $p=2\lfloor d/32\rfloor$ 抄进 05 的 $W^{1/p}\le2^d$，得到 $\log_2W\le d\cdot\frac d{16}$ 这种弱一档的条件；改用 05 自己的 $p=\lfloor d/8\rfloor$ 后，$\log_2W=o(d^2)$ 配 $p\ge\frac d{16}$ 才刚好给出 $W^{1/p}\le2^d$（05:130--134）。

不变式（05:35--38）：$\dim H=n\ge n_0+2\ell$ 时 $\int g_v(z+r\xi)\,\d\sigma_H(\xi)\le(R_\ell/r)^a$，$R_\ell=16C_*^{\ell}\epsilon$。终端 $\ell=0$：$\frac{16\epsilon}r\ge1$ 用全测度；否则弦帽半径 $\frac{2\epsilon}r$、极角 $\le\frac{4\epsilon}r$，$\S20$ 的帽算式给 $(\frac{16\epsilon}r)^{n-1}$，$n-1\ge a$ 收成 $(\frac{16\epsilon}r)^a$。那个 $16$ 我起初写 $8$（与 07 的 $\frac{8\epsilon}R$ 对齐），结果归纳步里 $288^d$ 换出来的 $R_{\ell+1}$ 与终端常数不同源，多留一层 $2^a$；把两端统一成 $16=2^4$ 之后 $a\ge1$ 就把 $\log_2\frac32$ 那点尾差吞进 $\log_224$（05:141）。

归纳步常数逐档列：纬度给 $\Lambda=(R_\ell/\rho)^a$；帽估 $\int_{\norm{y-y_0}\le\delta}f_u\,\d\sigma_E\le4^d\Lambda\delta^{N-1-a}$（$\sin\theta\le\theta$、原归一化积分 $\ge2^{-(N-2)}$）；$\S20$ 的管状系数 $3^{\alpha+j}$ 在此成 $36^d$；壳层求和给 $144^d\Lambda$；再乘 $W^{1/p}\le2^d$ 得
$\E_L\max_uF_u(L)^{p}\le(144^d\Lambda)^p,\qquad\E_L\max_uF_u(L)\le W^{1/p}144^d\Lambda\le288^d\Lambda$（05:99--104）。
矩阶是 $p=\lfloor d/8\rfloor$、奇指数 $N-K=m-1$，margin 逐项：
$N-1-a-j-(m-1)\ge n-a-p-m\ge\frac d2-\frac d{16}-\frac d8-\frac d{16}+2(\ell+1)=\frac d4+2(\ell+1)\ge1$，
这里 $\frac d2-\frac d{16}-\frac d8-\frac d{16}=\frac{8-1-2-2}{16}d=\frac d4$ 我算过两遍，第一遍得 $\frac{3d}{16}$，错在把 $a=2\lfloor d/32\rfloor\le\frac d{16}$ 记成 $\frac d8$；$\S24$ 那条 $\frac{5d}{16}$ 与本条 $\frac d4$ 的差别正是同一个符号在两个文件里的不同阶。

半径部分是整数化的那版：$q=\frac a2=\lfloor d/32\rfloor$，$t\sim\Beta((n-m)/2,m/2)$，
$(n-m)/2-q\ge\frac{3d}{16}>0$，单项 $\le\frac{d/2}{3d/16}=\frac83<3$，
$\E t^{-a/2}=\prod_{u=1}^{q}\frac{n/2-u}{(n-m)/2-u}\le3^d$（05:107--117）。
乘起来 $288^d\cdot3^d=864^d$，于是 $R_{\ell+1}=C_*R_\ell$ 成立的条件是 $C_*^a\ge864^d$；$a\ge\frac d{32}$ 时 $C_*^a=1000^{32a}\ge1000^d\ge864^d$（05:119--121）。$C_*=1000^{32}$ 这个怪形的来源就在这行不等式：底数 $1000$ 只需压过 $864$，指数 $32$ 用来抵消 $a\ge\frac d{32}$ 的损失，二者都是被 $864^d$ 与 $\frac d{32}$ 唯一决定的。[推测] 早期稿里这一步可能直接令 $C_*=(864\cdot\text{余量})^{32}$ 或把 $864^d$ 写得更细，现版本挑 $1000$ 只是可读性选择，tex 没有留下替代方案的痕迹。

终点（05:139--148）：$z=0$、$r=1$、$H=\R^d$ 时 $\frac23\le(16C_*^k\epsilon)^a$，取对数得
$h\le k\log_2C_*+\log_224\le\bigl(\frac Tm+1\bigr)\log_2C_*+\log_224$，
$h\ge2(\log_2C_*+\log_224)$ 时 $T\ge\frac{mh}{2\log_2C_*}$，$m\ge\frac d{32}$ 给 $\frac1{64\log_2C_*}$ 这一档系数；$h$ 小的分支接 $\S22$ 的 $T>\frac d4$。与 $\S23$ 的 $2^{-16}$ 比，这条支线的系数是 $\frac1{64\cdot32\log_21000}\approx\frac1{2048\cdot9.97}$，量级 $2^{-19.3}$ 上下，这解释了 00:242--243 那句"with an unspecified absolute coefficient"：05 与 04 都能给出同阶率，只有 07 把常数压成可读的 $2^{-16}$。

## 26. 固定长度归纳与谱量：$2^{64}$、$576^d$、$\gamma=\frac d{32}$

06 的参数（06:14--16）：$k=p=\lfloor d/32\rfloor$，$\gamma=\frac d{32}$，$C\ge2$ 与 $d_*$ 绝对，$j\ge0$ 块、维数 $m$ 满足 $\frac d2+2j\le m\le d$，样本数 $jk$，每层状态 $\le2^{d^2}$，输出可以是 $\R^m$ 里任意向量，容差 $\eta>0$ 任意。结论 $\Prob\{\norm{\mathrm{output}-s}\le\eta\}\le(C^{j+1}\eta)^{\gamma}$（06:27--30）。基底 $j=0$：输出与目标独立，$\eta\ge1$ 平凡；$\eta<1$ 时零输出不算，非零 $v$ 有
$\bigl\lVert\frac v{\norm v}-s\bigr\rVert\le\bigl|1-\norm v\bigr|+\norm{v-s}\le2\eta$，
$\S20$ 的弦帽给 $K_0^d\eta^{\gamma}$，因为 $m-1\ge\gamma$。

这条支线的关键岗是纬度模拟（06:91--94）：从 $H$ 里的新鲜对 $(x',\ip{x'}{z'})$ 出发，独立抽 $x''$ 于 $H^{\perp}$，喂给原续算
$x=x'+x'',\qquad y=\ip{x''}{c}+\rho\ip{x'}{z'}=\ip{x}{c+\rho z'}$，
它是纬度目标 $c+\rho z'$ 在 $\R^m$ 里的标准高斯对，附加高斯只在转移内部使用，状态集不扩大；结束把输出投回 $H$ 除 $\rho$，原误差 $\le\eta$ 转成模拟误差 $\le\frac{\eta}\rho$。归纳假设于是给出纬度平均 $\le\bigl(\frac{C^j\eta}{r\sqrt{1-t^2}}\bigr)^{\gamma}$，记 $B=\frac{C^j\eta}r$，对 $D=m-1$ 的坐标密度（余指数 $\frac{D-3-\gamma}2\ge0$）积分得
$\int_{\norm{z-e}\le\tau}f\,\d\sigma_E\le\frac{c_D}2B^{\gamma}\tau^{D-1-\gamma}$，
$c_D\le\sqrt d$、$D\le d$ 把两侧系数压到 $4^d$。套 $\S20$ 的矩引理（$A_0=A_1=4$、矩阶 $p=k$、奇指数 $N-K=m-1$、$a=\gamma$、$\Lambda=B^{\gamma}$）：
$D-1-\gamma-(p-1)-(k-1)=m-\gamma-2k\ge\frac{13d}{32}+2j\ge1$，
$\E\bigl[\max_v\int f_v\,\d\sigma_{N_0}\mid u\bigr]\le2^{d^2/p}144^d\bigl(\tfrac{C^j\eta}r\bigr)^{\gamma}$。
状态数换算我核对过两遍：$2^{d^2/p}$ 里的 $p\ge\frac d{64}$（$p=\lfloor d/32\rfloor\ge\frac d{64}$ 对 $d\ge64$），于是 $\frac{d^2}p\le64d$，这就是 06:169 那个 $2^{64}$ 的全部来历，与精度、内存无关，纯粹是 $2^{d^2}$ 状态预算除以 $\frac d{64}$ 阶矩。半径用实指数恒等式 01:151：
$\E r^{-\gamma}=\frac{\mathrm B((m-k-\gamma)/2,\,k/2)}{\mathrm B((m-k)/2,\,k/2)}\le4^d$，
分子 $\le1$ 因 $m-k-\gamma\ge\frac{7d}{16}+2j$ 使两指数非负，分母限制在 $[\frac14,\frac34]$ 给 $\mathrm B\ge\frac12 4^{-(m/2-2)}\ge4^{-d}$。合并 $144^d\cdot4^d\cdot2^{64d}=(2^{64}\cdot576)^d$（06:169），再由 $\gamma=\frac d{32}$ 让 $C^{\gamma}$ 吸收，闭合对 $j$ 的同时归纳。

终点常数（06:178--205）另有一套：$F=\ln\frac1\epsilon$，$F_0=8\ln C$，$a_0>0$ 满足 $a_0\le\frac1{8F_0}$ 与 $a_0\le\frac1{256\ln C}$，反设 $T<a_0dF$。用 $\S22$ 的短程引理（$L=\frac F{\ln2}$、$c=a_0\ln2$、$\alpha=\frac23$）得 $F=o(d)$、$T=o(d^2)$、padding 后 $\log_2W_*=o(d^2)$，块数 $n=\lceil\frac Tk\rceil=o(d)$，宽度终至 $\le2^{d^2}$。$F\le F_0$ 时 $T<a_0dF_0\le\frac d8$，撞 $\S22$ 的 $T>\frac d4$；$F>F_0$ 时 $k\ge\frac d{64}$ 与
$(n+1)\ln C\le(64a_0F+2)\ln C\le\frac F2$
成立（前一项用 $a_0\le\frac1{256\ln C}$，后一项用 $F\ge F_0=8\ln C$ 吃掉那个 $2\ln C$），代进 $ (C^{j+1}\eta)^{\gamma}$ 得 $\exp(-\frac{\gamma F}2)<\frac23$。这里 $64a_0F+2$ 那步我第一次漏了 $+2$，按 $64a_0F\le\frac12$ 取到 $a_0\le\frac1{128\ln C}$，与 tex 的 $\frac1{256\ln C}$ 差一倍；补上 $+2$ 才看清 $F>F_0$ 这个分支存在的理由。

设计矩阵的谱量这条线，我在最早期想过另一条路。无噪设定里 $Y_t=\ip{X_t}s$，$b$ 行 $X$ 限制在 $D$ 维 $H$ 上时几乎必然满秩 $b$（01:236），且在 $R_X$ 上单射，所以标签唯一决定 $r\sqrt{1-t}\,e$（01:242--244）；我的设想是把精度下界挂在最小奇值上：用 $\sigma_{\min}(X_{\rm sub})$ 的量化下界说明"解集是一个直径 $\sim\frac1{\sigma_{\min}}$ 的椭球"，再从 $b$ 与 $d$ 之比直接读出 $T$。它断在三处。第一处是无噪本身：解集是仿射子空间 $z+p+\rho S(K)$ 与球的交，形状由残差方向的均匀律决定，椭球长短轴的讨论根本没有入场处，真正入场的谱量是 $\S19$ 与 $\S20$ 那族 Gram 行列式比，也就是 $\det G=\prod_{u=0}^{h-1}\dist(Y_{u+1},V_u)^2$ 里的每一个条件 beta 分数；它们与 $X$ 限制在 $H$ 上所得的分数奇值平方同分布，只在分布层面被使用。第二处是模型不限制单次转移的计算量， learner 可以对 $X$ 做任意运算，任何依赖算法实现 $\sigma_{\min}$ 估计的论证对它无效。第三处是必需的界要对 $\lambda=\log_2\frac1\epsilon$ 线性，谱分位数只给 $b$ 对 $d$ 的信息，$\epsilon$ 不在其中。01:191--196 是唯一出现矩阵解析式谱算子的地方：$Q=A(A^{\mathsf T}A)^{-1/2}$ 正交、左右正交不变，用它把"逐个在正交互补里均匀取向量"的标架与均匀正交矩阵的像等同起来，即只用 $(A^{\mathsf T}A)^{-1/2}$ 的存在性与不变性，全程没有 $\sigma_{\min}$ 的量化下界，也从未调用 Marchenko--Pastur 或 Bai--Yin 一类结果；$\E\norm p^2=\frac Td$（03:112）与 Markov 的 $\Prob(r<r_0)\le\frac T{d(1-r_0^2)}$ 才是文中真正被使用的"设计矩阵二阶谱信息"，一条迹归一化就够。[推测] 放弃奇值路线的具体草稿没进 tex，我只能从 01、02 两个文件通篇没有奇值记号、以及 01:191 那段"作者特意把极分解讲成不变性论证"的写法反推这条弯路确实存在；证据面限于 tex 与 §0 记下的 comparator 条目（json 的 theorem_names 只有 full_current_main_scope，definition_names 为空，无奇值相关命题登记），再细就只能标推测。
