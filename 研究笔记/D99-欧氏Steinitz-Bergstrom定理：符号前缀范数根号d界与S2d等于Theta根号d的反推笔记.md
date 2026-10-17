# D99 欧氏 Steinitz--Bergström 定理：符号前缀范数的 \sqrt d 界与 S_2(d)=\Theta(\sqrt d) 的反推笔记

队列行号 136。论文目录 `E:\math\preprints\The-Euclidean-Steinitz-Bergstrom-theorem-September-24-2026`。
本笔记是第一人称反推稿：我把自己放回"正在做这件事的人"的位置上，从 build 目录里那八个 tex 分片出发，
重建得出这条定理之前必须走过的思维链，包括走不通的路线。凡是我从 tex 里读不到的东西，都标成
[外部推断] 或 [推测]，不混进论文事实。

## 0 素材边界与取证范围

正文素材只来自 `build\` 下的平铺 tex，按字节降序全部读到：
matrix.tex 21425、survival.tex 14608、signing.tex 13446、assembly.tex 10921、introduction.tex 10600、
brownian.tex 6164、consequences.tex 5663、main.tex 2017。装配顺序在 main.tex:51-56：
introduction, assembly, signing, matrix, survival, consequences；brownian.tex 由 assembly.tex:274 就地 `\input`。
这个顺序本身就是一条证据：assembly 先给出两个解析输入命题并把主定理证完，才回头补证明，
而 brownian  subsection 被塞在 assembly 中间，说明 slab-energy 的证明是后来才从别处搬来的独立一块。
main.tex:39-48 的摘要逐字给出主线：给定次序的欧氏单位球有限向量序列存在一种符号赋值，使每个带符号
前缀的范数不超过 C\sqrt d，C 为绝对常数、与序列长度无关；因此每个有下标的零和单位球向量族存在一个
排列使不带符号的部分和满足同样的界，于是 S_2(d)=\Theta(\sqrt d)，欧氏 Steinitz--Bergström 猜想被解决。

Lean 侧只做了限定范围内的取证。formalization.yaml 第 1530--1532 行的注册三件套是
`comparator_config = ComparatorChallenges/SteinitzBergstrom.json`、
`declaration = OAI.EuclideanSteinitzBergstrom.main`、`file = OAI/Analysis/Steinitz/Main.lean`；
书目条目在 687--689 行，只有标题与 pdf 路径，我没有读任何 pdf。comparator json 我读了全文：
`theorem_names` 只有一个 `OAI.EuclideanSteinitzBergstrom.main`，`definition_names` 是空数组，
许可公理是 propext、Quot.sound、Classical.choice，`enable_nanoda` 为 false。
`OAI/Analysis/Steinitz/` 模块共 29 个 .lean，行数与字节的降序清单在第 8 节，那份清单是按规模与命名
对齐到 tex 分片的推断表，我没有逐文件通读，凡是没细看的地方我都写明是推断。
全仓只用过一条 `find + wc` 性质的命令和一次模块内的定位，没有对 lean 仓做递归 grep。
本节素材的论文目录完整登记：preprints/The-Euclidean-Steinitz-Bergstrom-theorem-September-24-2026（队列第 136 行对应，日期后缀照抄）。

## 1 常数与参数台账

这张表是我在反推过程中把所有出现过的数字、增长率、指位置记下来的总账。前五栏全部填实。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| C（主定理绝对常数） | 绝对常数，与 d、N、序列无关 | introduction.tex:11, 16 | thm:signing 结论、thm:steinitz 直接沿用同一个 C | introduction.tex:44 的"同一条 C 也够用"失效，两定理增长率脱钩 |
| C 的显式配方 | C=2D_\ast A_0/\sigma | assembly.tex:244 | assembly 主证明末尾闭合，把三处常数合成一个 | 任一环被吸收进不等式方向，最后除 \sigma 那一步给不出有限 C |
| C\sqrt d 上界一侧 | \lVert\sum_{i\le k}\varepsilon_i v_i\rVert\le C\sqrt d | introduction.tex:14-17 | thm:steinitz、consequences 两条推论 | 上界退化为 d 时欧氏猜想未解，历史界 Grinberg--Sevast'yanov 停在 d |
| \sqrt d 下界一侧 | S_2(d)\ge\tfrac12\sqrt d | introduction.tex:62-66 | 说明阶不可改进；摘要里 \Theta(\sqrt d) 的下侧 | 单纯形例子换成一般位置向量，平方范数 k(d+1-k)/d 的精确值不再成立 |
| S_2(d) | \sup\beta=\Theta(\sqrt d) | introduction.tex:30-32, 65 | 定理命名的载体，猜想的量化对象 | 若只证到 O(\sqrt d\log d)，S_2(d)=\Theta(\sqrt d) 不能写成绝对因子级别 |
| \beta(v_1,\ldots,v_N) | 对排列取最小再对前缀取最大 | introduction.tex:25-28 | transference 反证 \beta\le(\beta+C\sqrt d)/2 | 去掉"最小"就得不到 \beta 自锁定，链式不等式无法闭合 |
| k=\lfloor(d+1)/2\rfloor | 取半数前缀使平方范数\ge d/4 | introduction.tex:62 | 下界证明的中点选取 | 取 k=1 只给常数下界，取不出 \sqrt d |
| u_i | \sqrt{(d+1)/d}(e_i-\mathbf1/(d+1))，单位向量 | introduction.tex:56-59 | 单纯形下界例的构造 | 归一化因子改一个，\langle u_i,u_j\rangle=-1/d 与零和同时被破坏 |
| n 与 N 的关系 | n=N=向量个数，m=d+n | assembly.tex:62, introduction.tex:11 | filtered 命题的维数 m 与系数空间 | 把 m 写成 d+n 之外的形式，R_0 取前 d 坐标的定义要重写 |
| \sqrt{\log N} 尾巴 | Banaszczyk 界 O(\sqrt d+\sqrt{\log N}) | introduction.tex:130 | 历史对照，说明长度项在 N\gg d 时变显著 | 若保留该尾巴，"C 与序列长度无关"这句摘要断言不成立 |
| d^{1/4}\log^{7/4}N | Dutta--Jha--Jiang 高效界的主项 | introduction.tex:134 | 历史对照：算法化路线给不出纯 \sqrt d | 想直接引用它得 \sqrt d，log 项无法在固定输入长度内消失 |
| 任意范数下的 d 倍界 | Grinberg--Sevast'yanov 部分和留在 d 倍单位球 | introduction.tex:116 | 说明欧氏结构才给出 \sqrt d | 丢掉内积结构，能量对 trace 的闭合全部失效 |
| \kappa | 1/100 | assembly.tex:25, signing.tex:19 | 全部对角能量假设 \lambda_Q\le\kappa^2\tr Q；lem:shift-section 的均值高度 | \kappa 增大则 M\ge\frac{\ell}{2}(1-2\ell\kappa) 跌破 1，D_1 空集 |
| \delta | 1/4 | assembly.tex:25, signing.tex:19 | 自适应平移 q_i 的取值区间、slab 约束宽度、\sigma 的定义 | \delta 变大时 (c-q) 的余量 7/4<2 不再安全，选号失败 |
| \ell | 5/2 | signing.tex:19, 173 | 抬升集 B 的竖直截断长度、\lvert c\rvert<\ell-1=3/2 | \ell 必须同时 >2 与满足 \ell(1-2\ell\kappa)/2>1，改成 2 则无解 |
| D_\ast | \ge\max\{1,\sqrt{2H_0}/\kappa\} | assembly.tex:193, 181 | 把 K 的能量压到 \kappa^2\tr Q 的一半 | 取小则 assembly.tex:189 的第一项 H_0D_\ast^{-2} 超过 \kappa^2/2 |
| \sigma | \min\{1/2,\kappa\delta/(\sqrt2\pi)\} | assembly.tex:194, 121 | 列范数预算 \lVert Me_{d+j}\rVert^2\le\sigma^2 与 predictor 代价 | \sigma 变大则 \pi^2\delta^{-2}\sigma^2>\kappa^2/2；同时 C=2D_\ast A_0/\sigma 爆炸 |
| b_i | b_i=\sigma v_i，故 \lVert b_i\rVert\le\sigma\le1/2 | assembly.tex:123 | 对称收缩 C_i 的存在性与 \eta_i 的范围 | 若 b_i=v_i，\sigma 消失，除回去时前缀界多出无法吸收的因子 |
| \eta_i | 1/(1+\sqrt{1-\lVert b_i\rVert^2})\in[1/2,1] | assembly.tex:124, 134 | 抵消恒等式与 predictor 行 m_i 的系数 | \eta_i 取 1 会破坏 C_i^2+b_ib_i^T=I 的精确性；取 1/2 则列望远镜失败 |
| C_i | I-\eta_ib_ib_i^T=(I-b_ib_i^T)^{1/2}\succ0 | assembly.tex:126, 132 | filter 递推、可逆收缩假设、命题 prop:filtered 的前提 | 换成非对称收缩，loss 恒等式 (b_i^Tr_{i-1})^2 变成交叉项 |
| A_0,B_0,H_0 | 正的绝对常数；\mathcal D 的半径与能量常数 | assembly.tex:61, 78-79, 84 | 状态约束 A_0\sqrt d、坐标约束 B_0、H_0=\lambda_Q/\tr Q 界 | 三者任一依赖 n 则 prop:filtered 的一致性失效，assembly.tex:89 强调的均匀性失去 |
| A_0 与 c_1 的接口 | A_0>c_1\sqrt{C_\phi} | survival.tex:276, 296 | 让闭约束严格落在 \mathcal D 内部 | 不等号反了，存活事件与 \mathcal D 的关系断开，T\to\infty 极限给不出 \mathcal D |
| B_0 | >2 | survival.tex:283, 296 | 坐标盒 [-2,2] 落在 \lvert x_j\rvert<B_0 内 | 取 B_0=2 时闭事件不再严格内部，correlation 步骤的开闭切换失败 |
| H_0=C'+1/2 | 来自 \lambda_Q\le\lambda_Q^{OU}+\tfrac12\tr Q | survival.tex:43, 344 | assembly.tex:189 的能量闭合 | 势能下界 -\tr Q/2 若写成 -c\tr Q，H_0 放大，D_\ast 需再放大 |
| \lambda_Q(D) | 对角权重 Dirichlet 能量，协变速率 2Q 的布朗 | assembly.tex:14-19, brownian.tex:13 | 贯穿两命题的共同货币 | 归一化改成 \tfrac12Q 则 \pi^2/\delta^2 与 \kappa^2 全部要重标 |
| \lambda_Q^{OU}(D) | 高斯测度下的 Rayleigh 下确界 | survival.tex:33-36 | 与存活概率 e^{-T\lambda} 之间的桥 | 没有它，加性常数 A(Q,R,d,n)/T 无法靠 T\to\infty 消掉 |
| e^{-T\lambda_Q^{OU}} |  killed OU 半群的算子范数 | survival.tex:40-41, 56 | 把概率上界翻译成能量上界 | 只用布朗不用 OU，会残留 \gamma_m(D) 项随 m 变化 |
| \pi^2\delta^{-2}\sum m_iQm_i^T | 加 slab 的能量代价 | assembly.tex:106 | 控制 predictor 约束的成本 | \delta 减半时代价乘 4，需要重取 \sigma；一维基态是 cos(\pi x/\delta) 定死 |
| \pi^2 c_i/\delta^2 | 一维区间 (-\delta/2,\delta/2) 的第一特征值 | brownian.tex:128 | 每个 slab 的存活指数 | 用 \delta ，并非 \delta/2 会把闭事件压不进开事件 |
| \sum_{i}m_iQm_i^T\le\sigma^2\tr Q | predictor 约束的加权代价 | assembly.tex:174-177 | assembly.tex:189 的第二项 | 列预算失效则能量随 n 累积，绝对常数 C 立刻丢失 |
| \lVert Me_{d+j}\rVert^2 | \le\lVert b_j\rVert^2\le\sigma^2，望远镜 | assembly.tex:163-171 | 上面的加权和；\eta_i\le1 是唯一放缩 | 非对称 C_i 下 loss 恒等式不成立，望远镜多出交叉项 |
| h_t=E_\theta(0,t) | 尺度 \theta 上从 0 到 t 的累积能量 | survival.tex:90 | lem:epoch-prob 的分组依据 | 若按索引个数分组，组数随 n 增长，一致性消失 |
| e_0 | 1/(16c_a)，c_a=a2^a=3\cdot2^{5/2} | matrix.tex:415, matrix.tex:159 | 能量区间的宽度、lem:increment 的前提 | 放大 e_0 则 q<1/4 与 H\preceq I/2 的自锁定崩掉 |
| E^{1/a} | a=3/2，H\"older 型损失指数 2/3 | matrix.tex:166 | 时间/索引增量二阶矩，链接级数 2^{-l/(2a)} | 指数退到 1/2 时级数仍收敛但界变差；若失去幂次只剩对数则一致性失效 |
| E_\theta(s,t) | 双端 trace 差的和非负可加 | matrix.tex:122-134 | 全部增量估计的货币 | 可加性丢失则不能按 e_0 分箱，组数失控 |
| \sum_\theta\theta E_\theta(0,n)\le C\tr Q | 尺度加权能量总预算 | matrix.tex:147-151 | survival.tex:326 的 T 系数界 | 去掉 \theta 权重则小尺度组数无穷，时间覆盖率爆炸 |
| \theta\in2^{\mathbb Z} | 二分谱尺度 | matrix.tex:75 |  localization、时间区间长度 \theta^{-1} | 尺度改三分会重标 f_0 支撑与 \phi\ge1/4 常数 |
| f_0 | 折线：0 到 1/2、升到 1、平台到 2、降到 0 于 4 | matrix.tex:47-55 | 局部化算子 F_t^\theta、谱重构不等式 | 支撑带内 \phi\ge1/4 与 \tr f_0^2\le4k_t 都要重算 |
| 2 | f_0 的 Lipschitz 常数 | matrix.tex:56 | lem:scalar-comparison 的近距离界 | 平滑化 f_0 会让 \lvert f_0(x)-f_0(y)\rvert\le2x\lvert r-1\rvert 变成更差的常数 |
| a | 3/2 | matrix.tex:62 | w、p、p_1、\phi 的公共指数；B(r) 的二阶分析 | a>2 时 2^{-l/(2a)} 与 \phi 的可和性同时变化，\sum_\theta k_t\le Cd 需重证 |
| w(x) | \min\{x^a,x^{-1}\} | matrix.tex:61 | 势能的导数、\log w(e^u) 的 a-Lipschitz 性 | 指数不对称则 B(r)\ge c\min 型界失去两侧一致常数 |
| p,\ p_1,\ \phi | \int w/u,\ \int u^{a-1}/(1+u)^a,\ \min\{x^{a-1},x^{-1}\} | matrix.tex:62-66 | p 控端点、p_1 控增益、\phi 控尺度大小 | p_1' 与 H^{a-1}(I-H)^{-a} 的界 2^a 恰好对上，改 a 要重推该矩阵不等式 |
| h=p+p_1 | 能量密度母函数 | matrix.tex:121 | E_\theta 的定义 | 只用 p 时增益段无法被控制，lem:direct-gain 的核心缺失 |
| k_t(\theta) | \tr\phi(X_t)，尺度权重 | matrix.tex:81 | 约束半径 c_1\sqrt{k_t}、\sum_\theta k_t\le Cd | 换成计数则尺度求和不收敛，状态界的 C_\phi d 失去 |
| \sum_\theta k_t(\theta)\le Cd | 每个时刻的尺度总权重 | matrix.tex:97-100 | survival.tex:276 的 \sqrt d 来源 | \sqrt d 正是从这里出来，写成 C\log d 会让下界一侧不再匹配 |
| \tr f_0(X_t)^2\le4k_t | 二阶矩预算 | matrix.tex:107, survival.tex:121 | 链接的初始项 \mathbb E\lVert F_tU\rVert^2\le8k | 常数放大直接进 C_0 与 c_1，A\ge\log3 的选取要重做 |
| \tr(X_tf_0^2)\le16k_t | 时间增量预算 | matrix.tex:108, survival.tex:140 | \mathbb E\lVert F_t(U(\tau)-U(\sigma))\rVert^2\le Ck\theta\lvert\tau-\sigma\rvert | 该项控制时间方向的 Lipschitz 维数，坏了则 \theta^{-1} 区间覆盖无效 |
| \lVert F_t\rVert_{op}\le1 | 一致有界 | matrix.tex:110, survival.tex:202 | S_j 作为 1-Lipschitz 泛函，Borell 扩容 | F_t 有界性丢失，浓度项 e^{-r^2/2} 需除以 \lVert F_t\rVert |
| F_t\ne0\Rightarrow k_t\ge1/4 | 非空类的下界 | matrix.tex:111, survival.tex:110 | 类内 k=K_j 的良定义，K_j\le k_t<2K_j | 若 k_t 可任意小，K_j=2^j/4 的分级与求和都需加项 |
| \theta\le2\lVert Q\rVert_{op} | 活跃尺度上界 | matrix.tex:118 | 有限尺度集 \Theta、\sum_{\theta\in\Theta}\theta\le4q_{\max} | 无上界时 T\theta 覆盖数对大尺度发散 |
| \Theta\subset[q_{\min}/4,2q_{\max}] | 活跃尺度区间 | survival.tex:247-249 | 覆盖数与求和 | 依赖 Q 的最小元只允许出现在加性常数 A(Q,R,d,n) 里 |
| \mathcal I_j | K_j\le k_t<2K_j，K_j=2^j/4 | survival.tex:112 | 按尺度权重分类别 | 类别划分改线性则 \sum_j e^{-A2^j} 的几何衰减不成立 |
| c_1 | 绝对，>2C_0，使 A=(c_1-2C_0)^2/8\ge\log3 | survival.tex:208, 223-228 | epoch 概率下界 1/2 与类别尾和 | A<\log3 时 \sum e^{-A2^j}>\tfrac12，单组概率不再达到 1/2 |
| C_0 | \mathbb E\sup\le C_0\sqrt k | survival.tex:180-186 | 中心化的阈值 2C_0\sqrt{K_j} | C_0 依赖维度会破坏"类别失败概率可求和而不含 d"这一段 |
| v_l=Ck2^{-l/a} | 第 l 层父增量二阶矩 | survival.tex:161 | 级数 \sum_l2^{-l/(2a)}(1+\sqrt l) | 幂次变号则级数发散，期望上确界失去有限界 |
| C4^l | 深度 l 的代表点数 | survival.tex:157 | \log M\asymp l 进入 \sqrt{\log M+1/2} | 二维参数乘积覆盖给 4^l，改成一维则 \theta^{-1} 时间方向失控 |
| 2\sqrt{v(\log M+1/2)} | 高斯向量最大值不等式 | survival.tex:167-174 | 每层期望增量 | 需要任意依赖的高斯向量族，换成独立假设不能用在共享噪声上 |
| \exp(-(c_1-2C_0)^2K_j/2) | 类别失败概率 | survival.tex:219-222 | \sum_j 的几何求和 | 若只有一阶矩界而无 Borell 扩容，无法把 1/2 概率抬成指数尾 |
| e^{-r^2/2}\ge 1-\Phi(r) | Borell 高斯扩容 | survival.tex:212-215 | 从 \mathbb P\{S_j\le2C_0\sqrt{K_j}\}\ge1/2 出尾巴 | Borell 的 r 以标准差为单位，1-Lipschitz 性质是前提 |
| p_0>0 | 速率 q 的 OU 在长 1/q 区间留 [-2,2] 的概率 | survival.tex:281-292 | 坐标盒事件的乘子 | 若概率随 q 变化，覆盖数 \sum_j(1+TQ_{jj}) 的成本不再线性于 \tr Q |
| [-2,2] 与 B_0>2 | 盒事件严格内部 | survival.tex:283, 296 | 与 \mathcal D 的开性衔接 | 边界相切时需额外的开闭论证，correlation 乘积可能不闭合 |
| \theta^{-1} | 每尺度时间区间长度 | survival.tex:101, 304 | 与 L_t 的谱速率匹配，覆盖数 1+T\theta | 固定成 1 会让小尺度需要 O(T) 组，成本随尺度发散 |
| 1+TQ_{jj} | 坐标 j 的覆盖数 | survival.tex:308 | \sum_j(1+TQ_{jj})\le C(1+T\tr Q) | 覆盖数不按速率取，坐标方向的存活概率无法相乘 |
| 1+T\theta | 尺度 \theta 的覆盖数 | survival.tex:304 | survival-rate-bound 的 T 系数 | 与 e_0 分箱组数相乘时若组数不控，T 系数不再受 \tr Q 约束 |
| A+C'T\tr Q | -\log 存活概率的结构 | survival.tex:320-324 | 除以 T 后 T\to\infty 消去 A | 若主项含 n 或含 \#\Theta，能量界不能与映射个数无关 |
| A(Q,R,d,n) | C[\sum_\theta(1+E_\theta)+m]<\infty，允许依赖输入 | survival.tex:329-333 | 被 T 吸收 | 若误以为需要一致界，会去追 \#\Theta 的上界而卡住 |
| (\beta+C\sqrt d)/2 | transference 的新前缀界 | introduction.tex:97 | \beta 的最小性与自锁定不等式 | 系数 1/2 来自 A_j\pm B_j 的平均，改成 1 就失去 \beta\le C\sqrt d |
| P_j,M_j | (A_j+B_j)/2,\ (A_j-B_j)/2 | introduction.tex:89 | 正号段与负号段的分块表示 | 分块顺序（正号原序、负号逆序）若都取原序，负号段无法写成 -M_j |
| d^{\max\{1/p,1-1/p\}} | \ell_p 前缀界的增长率 | consequences.tex:16, 23 | \ell_p 推论，p=\infty 时给 Cd | 用 John 式统一因子会把 p\ge2 侧的 d^{1-1/p} 放大成 d |
| d^{1/p-1/2},\ d^{1/2-1/p} | 两个方向的范数比较 | consequences.tex:37-46 | 分 p\le2 与 p\ge2 两种归一 | 在 p\ge2 侧把除法方向写反会得到 d^{1/p} 的错误下界 |
| \tfrac13d^{1/p} | \ell_p 零和下界 | consequences.tex:31, 68-70 | 说明 d^{1/p} 阶在 p\le2 尖锐 | k=\lfloor d/2\rfloor 处的凸性下界 d/3\cdot2^{1-p} 依赖 w 的 \lVert w\rVert_p\le1 |
| V(B_2^d)\le C\sqrt d | 矩阵带符号常数 | consequences.tex:122 | B\'ar\'any transference 的输入 | 若只用维数线性界，U\le2V 只能给 O(d) |
| U\le2V | 排列常数与带符号常数的转移 | consequences.tex:126 | 得到 2C\sqrt d 的彩色界 | 因子 2 来自 B\'ar\'any 的论证，去掉它需要别的论证 |
| 2C\sqrt d | 彩色行排列界 | consequences.tex:92 | 推论 cor:colorful-steinitz 的结论 | k=1 时退化为 S_2(d) 上界，不能改成 C\sqrt d 而仍声称同一证明 |
| 1/2, 0 | 空序列与零维扩展、空和 | introduction.tex:47-48 | 边界情形的一致性 | 忽略零向量与重复会导致 m_i 定义里 \eta_i=1/2 分支需另证 |

## 2 初始动机：我为什么先去碰"带符号前缀"，并非"重排"

摘要把两件事并列，但我知道真正难的是第一件。给定次序 v_1,\ldots,v_N、只能选符号、要求每个前缀都被同一
组符号控制，这个量化结构比"零和族可以排列"更硬。introduction.tex:6-8 就是这么定位的：控制部分和有两个
自然入口，第一题的困难在于用一次符号选择控制所有前缀，并且界与 N 无关。所以我从一开始就把目标定在
thm:signing 上，把 thm:steinitz 当成它的推论，introduction.tex:33 明写"Theorem 2 由 Theorem 1 肯定地解决"，
introduction.tex:44 甚至说 thm:signing 里的常数在这里也够用。这种"常数复用"是我在草稿后期才敢写的话，
早期我只敢期望两个定理各自带一个常数。

我最初的猜想形态很朴素：既然单个前缀的平衡能做到 O(\sqrt d)（终端型结果，比如 [外部推断] Li 的终端
无穷范数绝对常数界在 introduction.tex:141-148 被引用并明确区分：那条定理对每个前缀单独使用时允许符号随
前缀改变），那么所有前缀一起做，多半也是同一量级，代价也许是一个 \log N。introduction.tex:129-132 记录
了 Banaszczyk 的 O(\sqrt d+\sqrt{\log N})，这就是我的起点。摘要里那句"C 与序列长度无关"正是我要打掉的东西，
而 introduction.tex:131 说得很直白：长度项在 N 与维数相比很大时才变显著。所以我的问题被压缩成一条：
如何把 \sqrt{\log N} 彻底删掉。

\sqrt d 这个尺度本身不是猜出来的，是被例子钉住的。introduction.tex:53-66 的正则单纯形给出下界：
u_i=\sqrt{(d+1)/d}(e_i-\mathbf1/(d+1))，零和、单位长、两两内积 -1/d，于是任取 k 个的和的平方范数是
k(d+1-k)/d，取 k=\lfloor(d+1)/2\rfloor 至少 d/4，与排列无关。这条下界在我手里同时起三个作用：它排除任何
o(\sqrt d) 的企图；它说明为什么 \sqrt d 是"随机和"的尺度（k 个近似正交的 \pm 项叠加，方差相加，标准差
\sqrt k 量级，而这里 k\sim d/2 且系数被归一化）；它还暗示上界必须逐点控制，并非期望控制，因为这个例子里
每个排列都在某个前缀上撞上 d/4。

## 3 第一条走不通的路线：贪心符号，以及它为什么只能给 \sqrt{\log N}

最直接的想法定理是逐个投符号：设 S_k=\sum_{i\le k}\varepsilon_iv_i，第 k 步选 \varepsilon_k 使
\lVert S_k\rVert 最小。这是 Steinitz 类问题里的传统做法。它在欧氏空间有一个可算的第一步：选 \varepsilon_k
使 \langle S_{k-1},\varepsilon_kv_k\rangle\le0，则
\lVert S_k\rVert^2=\lVert S_{k-1}\rVert^2+\lVert v_k\rVert^2+2\langle S_{k-1},\varepsilon_kv_k\rangle
\le\lVert S_{k-1}\rVert^2+\lVert v_k\rVert^2。
看起来是"平方累加"，但这条路立刻断在下一步：累加给 \lVert S_N\rVert^2\le\lVert S_0\rVert^2+\sum\lVert v_k\rVert^2=N，
界变成 \sqrt N，并非 \sqrt d。而且更糟的是，这个逐步不等式没有自锁定能力：\lVert S_{k-1}\rVert 大时，
\varepsilon_kv_k 只能沿 v_k 一条线动，减少量最多 \lVert v_k\rVert^2 量级，而垂直于 v_k 的分量一点都动不了。
我当时的判断是：贪心在 d=1 就能看出问题，d=1 时经典结果是前缀界 \le1（[外部推断] 即一维 Steinitz），
它靠的是符号必须交替；高维里"交替"这个概念没有可依赖的方向。

第二条改良路线是把维数分解：对每个坐标 \ell\in\{1,\ldots,d\} 单独做一维交替，然后取并。这在一维每坐标
给出 O(1)，但 d 个坐标不可能同时被 d 组符号满足，我只能要求一组符号同时打中所有坐标的"好的区间"。
把它写成凸几何语言：要找 \varepsilon 使每个前缀和落在某个球里，等价于在 \{-1,1\}^N 的 2^N 个点里找一个
落在 N 个半空间族交里的点。[推测] 这条路线在当年会断在测度论证上：2^{-N} 级别的点数与 N 个约束相乘，
只能换来 \sqrt{\log N} 的代价，这正是 Banaszczyk 型界里长度项的来源。我看到 introduction.tex:130 记录的
界时，倾向于相信这个 \sqrt{\log N} 是这类方法的本质障碍，并非一个可以打磨的常数。
[推测] 另一条我会先试的是 Spencer 六标准差式的熵方法：对每个前缀独立地取随机符号、用 \mathbb E\lVert S_k\rVert^2
求和、再对 k 取 union bound，期望给 \sqrt N 而联合界给 \sqrt{\log N} 级别的尾部。问题在于"同一组符号"，
union bound 会破坏耦合，除非我保留一个统一的势函数。这一点后来正是被势函数（能量）替换掉了。

第三条我确实沿着走过一段、并且最终被 tex 里的构造"否定"的路线是：直接用 Banaszczyk 的凸体高斯测度定理
（introduction.tex:153 提到 Gaussian convex bodies 是向量平衡的中心场景）逐前缀嵌套。要对每个前缀 k 用一次
该定理，就得为每个 k 找一个对称凸体 K_k 使 v_k\in\tfrac12 K_k 且高斯测度可控，然后要求存在 \varepsilon 使
\varepsilon_1v_1+\cdots+\varepsilon_kv_k\in K_k 对所有 k 同时成立。同时性无法由定理本身给出：Banaszczyk 定理
是单条包含关系的陈述，没有跨 k 的一致性。断点就在这里，而且我后来明白，这解释了为什么最终证明要把所有
前缀塞进同一个凸体的定义里（assembly.tex:74-81 的 \mathcal D 用 n+d 个坐标的约束一次性刻画全部时刻）。

## 4 关键转折一：把"前缀"变成"系数空间里一个点的坐标约束"

转折点是把序列本身当成坐标。assembly.tex:155-162 的策略段用我熟悉的语言重述了一遍（introduction.tex:155-162）：
在系数空间里，每个进来的向量占一个坐标，另外保留 d 个初始状态坐标；一列线性映射把这些系数送到 \R^d 里的
状态；每一步先对旧状态作用一个可逆收缩，再让下一个坐标注入进来向量的一个倍数。所有状态有界的系数集合
就是这个体。这个表述里最要紧的机械事实是 assembly.tex:66-72 的递推：C_tC_t^T+b_tb_t^T=I_d，
R_0x=(x_1,\ldots,x_d)，R_tx=C_tR_{t-1}x+b_tx_{d+t}。
为什么收缩必须可逆、为什么必须是 C_tC_t^T+b_tb_t^T=I 这种"能量守恒"形式，我在下一节逐条拆。

[推测] 我当年大概率会先试不可逆的正交投影收缩（即 C_t=(I-b_ib_i^T) ，并非它的平方根），因为它在
assembly.tex:132 的公式里看起来只是差一个平方。断点会在两处：一，C_i 奇异时 prop:filtered 的前提
"Invertible real d\times d matrix"（assembly.tex:63）被破坏，R_tQR_t^T 不再正定，L_t 的最小特征值可能为 0，
matrix.tex:115-118 关于特征值夹在 Q 的对角元素之间的论证失效，尺度集 \Theta 可能无上界也无下界；
二，assembly.tex:156-171 的精确 loss 恒等式 \lVert r_{i-1}\rVert^2-\lVert r_i\rVert^2=(b_i^Tr_{i-1})^2
依赖 C_i=(I-b_ib_i^T)^{1/2}。投影版本给的是 1-\lVert b_i\rVert 级别的平方损失，平方根版本才给出恰好的
一次损失，于是 \eta_i b_i^Tr_{i-1} 与列范数 \le\sigma^2 的望远镜对齐。这条恒等式是整个"补偿"能成立的原因。

## 5 逐引理反推（一）：assembly.tex 的滤波器、predictor 与抵消

### 5.1 prop:filtered：过滤体的一致能量界

(a) tex 逐字。assembly.tex:60-87：

> There are positive absolute constants $A_0,B_0,H_0$ with the following property. Let $d\ge1$ and $n\ge0$ be
> integers and put $m=d+n$. For $1\le t\le n$, let $C_t$ be an invertible real $d\times d$ matrix and let
> $b_t\in\R^d$ satisfy $C_tC_t^T+b_tb_t^T=I_d$. Define linear maps $R_t:\R^m\to\R^d$ by ...
> Then the bounded open convex centrally symmetric set $\mathcal D=\{x\in\R^m: \lvert x_j\rvert<B_0\ (1\le j\le m),\ > \lVert R_tx\rVert_2<A_0\sqrt d\ (0\le t\le n)\}$ satisfies $\lambda_Q(\mathcal D)\le H_0\operatorname{tr} Q$ for every positive
> definite diagonal $Q$.

assembly.tex:89-92 紧接着补了一句决定性的话："The constants are independent of the number of maps and of $Q$.
This uniformity is essential: the application will use $n$ equal to the number of vectors."

(b) 补中间步骤。这个命题的证明在 survival.tex:241-348，链条是：先把 \lambda_Q 换成平稳 OU 的
\lambda_Q^{OU}（survival.tex:43 给 \lambda_Q\le\lambda_Q^{OU}+\tfrac12\tr Q），再把 \lambda_Q^{OU} 换成
存活概率的指数速率（survival.tex:40 给 \mathbb P\{U([0,T])\subset D\}\le e^{-T\lambda_Q^{OU}(D)}，方向相反，
配合 killed 半群的表示得到下界翻译），然后证明对足够长的 T 存活概率不小，最后 T\to\infty 消掉加性常数。
中间对数概率界在 survival.tex:320-324：
-\log\mathbb P\{U([0,T])\subset\mathcal D\}\le A(Q,R,d,n)+C'T\tr Q。
除以 T 再让 T 发散，A 被压掉，于是 \lambda_Q^{OU}\le C'\tr Q，加 \tfrac12\tr Q 得 H_0=C'+1/2（survival.tex:344）。
"状态约束给出 A_0\sqrt d"这一步的机制是 survival.tex:266-278 的谱重构：对固定 t 把 L_t 对角化，
每个特征值 \lambda_i 都有一个二分尺度 \theta 使 \lambda_i/\theta\in[1,2]（在那里 f_0=1），于是
\sum_\theta\lVert F_t^\theta U\rVert^2\ge\lVert R_tU\rVert^2，而每个尺度上的约束给 c_1^2k_t(\theta)，
求和用 matrix.tex:98 的 \sum_\theta k_t(\theta)\le Cd 得到 c_1^2C_\phi d。开方就是 \sqrt d。

(c) 机械理由。\sqrt d 来自 \sum_\theta k_t(\theta)\le Cd 这条尺度求和：k_t=\tr\phi(X_t)，\phi(x)=\min\{x^{1/2},x^{-1}\}
在特征值 \lambda 两侧的二分尺度上是几何衰减的（matrix.tex:101-104 说"for each positive eigenvalue \lambda of
$L_t$, the terms \phi(\lambda/\theta) on either side of \theta=\lambda form bounded geometric sums"）。d 个特征值
每个贡献 O(1)，所以总权重 O(d)，开方后 O(\sqrt d)。若这里出现 \log d 或 d，说明 \phi 的衰减指数不够，
即 a-1=1/2 与 -1 这两个指数在 \theta=2^{\pm j} 上不可和。d 与 n 的关系：界里不含 n 是因为分箱依据是累积能量
h_t=E_\theta(0,t) ，并非索引 t 本身；能量预算 \sum_\theta\theta E_\theta(0,n)\le C\tr Q（matrix.tex:147）与
trace 预算 \sum\ell_t\le\tr Q、\sum g_t\le\sum Q_{d+t,d+t}（matrix.tex:36-41）都不含 n。
零和条件在这里完全没用上：prop:filtered 是纯粹的解析陈述，它只关心"所有状态有界的系数集"。
零和只在 transference 那一步（introduction.tex:75-103）被消费。
约束 \lvert x_j\rvert<B_0 承担的角色是坐标层面的正则性：它把 m 个一维 OU 的盒事件乘进 correlation，成本是
\sum_j(1+TQ_{jj})，正比于 \tr Q（survival.tex:308, 320-324）；没有它，\mathcal D 沿某些坐标方向无界，
不再是 bounded set，\lambda_Q 的定义（inf over H^1_0）也不成立。
为什么系数是 A_0\sqrt d ，并非 A_0：因为状态约束在 d 维里是"所有谱方向的和"，\sum_\theta k_t\le Cd 天生带 d，
若强行写成 A_0（与 d 无关），survival.tex:296 的 A_0>c_1\sqrt{C_\phi} 就不再可能，因为左边随 d 增长而右边不随。

(d) [推测] 候选失败路线。
[推测] 一：不去证一致能量界，是对每个 n 单独取 H_0(n)，再指望 assembly.tex:193 的 D_\ast\ge\sqrt{2H_0}/\kappa
自适应地放大。这条会在 assembly.tex:196-198 断掉，因为那三行明确要求"这些选择与 d、n 和向量无关"，
一旦 D_\ast 依赖 n，prop:adaptive 给出的 x\in K 虽然还在，但抵消后的界 2D_\ast A_0\sqrt d/\sigma 就随 n 走，
摘要里"C 与序列长度无关"立刻失效。
[推测] 二：把 \mathcal D 的状态约束写成单个终态约束 \lVert R_nx\rVert<A_0\sqrt d（只管最后一步）。
这条在 survival.tex:260-278 断：谱重构只对每个固定 t 成立，若只留 t=n，R_t 对 t<n 的状态不再受控，
assembly.tex:241-244 就得不到"所有这些状态范数小于 2D_\ast A_0\sqrt d"，全前缀陈述退化为终端陈述，
正好落到 introduction.tex:145-148 明确区分开的那一类（Li 的终端型结果）。
[推测] 三：用热核半群直接估 \lambda_Q(\mathcal D)（绕开概率），即对 \mathcal D 上的 Dirichlet 热核取主特征值，
指望随 n 增长时特征值有界。断点在 \mathcal D 的复杂度：它是 (d+n) 维空间里 n+d+1 组约束的交，
半群论证要么引入与约束个数成比例的损失，要么需要 domain monotonicity 的粗界（把交缩小成单个 slab），
后者会丢掉 \sqrt d 只能给 \sqrt{\log n} 级别，回到 Banaszczyk 的原点。

### 5.2 对称收缩与 \eta_i 的选择

(a) tex 逐字。assembly.tex:120-137：

> For a positive absolute $\sigma<1$, to be chosen below, set $b_i=\sigma v_i,\ \eta_i=\frac1{1+\sqrt{1-\lVert b_i\rVert_2^2}},\ C_i=I-\eta_ib_ib_i^T$.
> On the span of $b_i$, the matrix $C_i$ has eigenvalue $\sqrt{1-\lVert b_i\rVert_2^2}$, and on its orthogonal complement it is the identity.
> This includes $b_i=0$, for which $\eta_i=1/2$ and $C_i=I$. Consequently $C_i=(I-b_ib_i^T)^{1/2}=C_i^T\succ0$,
> $C_i^2+b_ib_i^T=I$, $\frac12\le\eta_i\le1$.

(b) 补中间步骤。把 C_i 写成 I-\eta_bb^T（b=b_i）。它保持 b^\perp 上每向量不变，把 b 方向缩放 1-\eta\lVert b\rVert^2。
要求这个缩放等于 \sqrt{1-\lVert b\rVert^2}，就得 1-\eta\lVert b\rVert^2=\sqrt{1-\lVert b\rVert^2}，
记 s=\lVert b\rVert^2，则 \eta=(1-\sqrt{1-s})/s。有理化：
(1-\sqrt{1-s})/s=(1-\sqrt{1-s})(1+\sqrt{1-s})/(s(1+\sqrt{1-s}))=s/(s(1+\sqrt{1-s}))=1/(1+\sqrt{1-s})，
这正是 tex 里 \eta_i 的表达式，分母有理化把它写得在 s\to0 时极限明显：\eta\to1/2。
于是 C_i 在 b 方向的本征值平方是 1-s，在 b^\perp 上是 1，因此 C_i^2=I-bb^T，即 C_i^2+b_ib_i^T=I_d，
这正是 prop:filtered 要求的关系 C_tC_t^T+b_tb_t^T=I_d（因为 C_i 对称）。
s\in[0,1]（\lVert v_i\rVert\le1、\sigma<1 保证 s<1）时 \sqrt{1-s}\in(0,1]，所以 \eta=1/(1+\sqrt{1-s})\in[1/2,1)。
b_i=0 时公式退化，tex 直接给出 \eta_i=1/2、C_i=I，与极限一致。

(c) 机械理由。为什么是"收缩后再注入"这种结构，并非别的：能量守恒 C_i^2+b_ib_i^T=I 意味着 R_t 作为
\R^m\to\R^d 的映射满足 R_tR_t^T=I_d（matrix.tex:22-24 归纳得到，"the support of $R_{t-1}$ is contained in the
initial block and the first $t-1$ new coordinates. Hence the new coordinate has no cross term"）。
这个 coisometry 性质在后面被反复消费：matrix.tex:85-89 用它说明提升 F_t^\theta 保范、
survival.tex:142 用它做 trace 恒等式 \tr(F_t^2Q)=\theta\tr(X_tf_0(X_t)^2) 而"does not require $Q$ and $F_t$
to commute"、survival.tex:265 用它把状态范数从谱方向重构回来。
为什么 \sigma 要同时出现在 b_i=\sigma v_i 与最终除以 \sigma（assembly.tex:243）：过滤体控制的是
\sum\varepsilon_ib_i=\sigma\sum\varepsilon_iv_i，所以除 \sigma 是必然的代价，C=2D_\ast A_0/\sigma；
\sigma 越小最终常数越大，但它让 predictor 约束的代价 \pi^2\delta^{-2}\sigma^2\tr Q 变小。
assembly.tex:194 的 \sigma=\min\{1/2,\kappa\delta/(\sqrt2\pi)\} 就是这两个需求的折中：
代入 assembly.tex:189 得 \pi^2\delta^{-2}\sigma^2\le\pi^2\delta^{-2}\cdot\kappa^2\delta^2/(2\pi^2)=\kappa^2/2，
而 D_\ast\ge\sqrt{2H_0}/\kappa 给 H_0D_\ast^{-2}\le\kappa^2/2，两项合起来正好 \kappa^2，
凑成 prop:adaptive 需要的 \lambda_Q(K)\le\kappa^2\tr Q。这两个 \tfrac12 的分配是我在草稿里会调很久的那个旋钮，
tex 里它被写成一条简洁的 min/max 定义，但每一半都恰好咬合，少一个 \sqrt2 就闭合不了。
为什么 \sigma\le1/2：它保证 \lVert b_i\rVert\le1/2，从而 s\le1/4、\sqrt{1-s} 有良好展开，并且
matrix.tex:34 那句"Since $\lVert b_t\rVert\le1$"的 trace 预算成立（更本质的 coisometry 由能量守恒给出，
\lVert b_t\rVert\le1 只是让增益项的可控性显而易见）。

(d) [推测] 候选失败路线。
[推测] 一：取 \sigma=1（即 b_i=v_i），然后指望 assembly.tex:189 的能量闭合。断在 \pi^2\delta^{-2}\sigma^2=\pi^2\cdot16
远超 \kappa^2/2=1/20000，除非把 D_\ast 取到不可思议的大，而 D_\ast 同时进入 C=2D_\ast A_0/\sigma，
常数会失控；更关键的是列预算 \lVert Me_{d+j}\rVert^2\le\lVert b_j\rVert^2\le\sigma^2 只给 \le1，
不再"小"，predictor 约束的能量代价与 n 无关性还在，但绝对小性没了，prop:adaptive 的前提不满足。
[推测] 二：用各向异性收缩（不同特征值方向不同）以图更快收缩。断在 assembly.tex:156-161：
精确 loss 恒等式 \lVert r_{i-1}\rVert^2-\lVert r_i\rVert^2=(b_i^Tr_{i-1})^2 只对秩一修正 C_i=I-\eta bb^T 成立，
一般收缩的 loss 是二次型 r^T(I-C^TC)r，无法 telescope 成 \le\lVert b_j\rVert^2。
[推测] 三：把 \eta_i 固定成 1（即 C_i=I-b_ib_i^T 的投影版本，loss 恰为 (b_i^Tr_{i-1})^2 也成立）。
这条比路线一更阴险：投影下 loss 恒等式确实也成立（因为 I-C^TC = bb^T-(bb^T)^2 只在 b 方向，
投影时 C^2=I-bb^T，所以 \lVert r\rVert^2-\lVert Cr\rVert^2=(b^Tr)^2/\lVert b\rVert^2 需要归一化匹配），
但 C_i 奇异，prop:filtered 的 "invertible" 前提（assembly.tex:63）失效，L_t 不再正定，
matrix.tex:115-118 的夹逼与 survival.tex:247 的 \Theta\subset[q_{\min}/4,2q_{\max}] 同时失去意义。

### 5.3 m_i、predictor 列预算与 clip 的撤销

(a) tex 逐字。assembly.tex:139-146 与 163-177：

> For $x\in\R^{d+n}$, let $x^0$ be obtained by setting its first $d$ coordinates to zero. Define row vectors $m_i$ by
> $m_ix=\eta_ib_i^TR_{i-1}x^0$. Each row $m_i$ is supported only on the noise coordinates $d+1,\ldots,d+i-1$.
> ... \lVert Me_{d+j}\rVert_2^2=\sum_{i=j+1}^n\eta_i^2(b_i^Tr_{i-1})^2\le\sum_{i=j+1}^n(\lVert r_{i-1}\rVert_2^2-\lVert r_i\rVert_2^2)\le\lVert b_j\rVert_2^2\le\sigma^2.

以及 assembly.tex:200-223 的选择段与 assembly.tex:215-220：

> The final membership $x\in K$ implies $\lvert m_ix\rvert<\delta$. Hence each shift was already within the permitted interval: clipping was inactive, and $x_{d+i}=m_ix+\varepsilon_i=\eta_ib_i^TR_{i-1}x+\varepsilon_i$.

(b) 补中间步骤。支撑性：R_{i-1} 只依赖坐标 1,\ldots,d,i,\ldots,d+i-1（递推 R_t=C_tR_{t-1}+b_tx_{d+t} 到 t=i-1 为止），
其中前 d 个坐标被 x^0 抹掉，所以 m_i 只碰到 d+1,\ldots,d+i-1。这给出因果性：第 i 步的平移量
q_i 只依赖在第 i 步之前已经被赋值的坐标，正好符合 prop:adaptive 对 q_i:\R^{i-1}\to[-\delta,\delta] 的要求。
列预算：固定噪声坐标 d+j。它对状态传播的贡献由 r_j=b_j、r_i=C_ir_{i-1}（j<i\le n）给出，
m_i 在该坐标上的系数是 \eta_ib_i^Tr_{i-1}（i>j），i\le j 时为 0。于是列向量的平方范数是
\sum_{i>j}\eta_i^2(b_i^Tr_{i-1})^2。用 \eta_i\le1 放掉 \eta_i^2，再用 loss 恒等式（C_i 对称且 C_i^2=I-b_ib_i^T，
故 \lVert r_{i-1}\rVert^2-r^T C_i^2r=(b_i^Tr_{i-1})^2）把每项写成差分，得望远镜
\lVert r_j\rVert^2-\lVert r_n\rVert^2\le\lVert b_j\rVert^2=\sigma^2\lVert v_j\rVert^2\le\sigma^2。
加权求和：\sum_i m_iQm_i^T=\sum_j Q_{jj}\lVert Me_j\rVert^2（这里用了 Q 对角），前 d 列是 0，
后 n 列每列 \le\sigma^2，故 \le\sigma^2\tr Q（assembly.tex:174-177）。
clip 撤销：x^{(i-1)} 在第 i 步之后不再改变前 i-1 个噪声坐标（赋值在不同坐标轴上，prop:adaptive 的第 328-331 行
"Distinctness of the coordinate directions ensures that later steps do not alter the preceding coefficient
coordinates"），所以 m_ix^{(i-1)}=m_ix；再由 x\in K 的约束 \lvert m_ix\rvert<\delta 得 m_ix 本来就在
[-\delta,\delta] 内，clip_\delta 是恒等的。tex 在 assembly.tex:221-223 明确说 clip 只是为了让
prop:adaptive 的无条件适用而加的脚手架。

(c) 机械理由。这里回答"符号赋值的贪心与相关性能不能兼容"。不能兼容，而且 tex 的结构告诉我为什么：
因果的平移 q_i 与符号 \varepsilon_i 是被 prop:adaptive 一次性给的，它靠的是把体反向变换 s 次（signing.tex:314-317）
再正向选择。整个构造里没有任何一步是"选 \varepsilon_i 使当前状态最小"这样的贪心；每一步的可行性由体的
几何（能量小 $\Rightarrow$ 存在好的截面）保证，并非由目标函数的下降保证。相关性体现在两处：
prop:adaptive 内部的截面/重排（signing.tex:184-187 的 Steiner 重排，以及 signing.tex:239-244 的
\lVert a^*-b^*\rVert_2\le\lVert a-b\rVert_2），以及 survival.tex:313 用 Gaussian correlation 把事件概率相乘。
这两处相关性都和"贪心"无关：贪心是逐点最优，相关原理是整体测度的乘积下界，二者对同一组约束的要求不同。
零和条件与"有下标族可排列"的互推：见第 6 节 transference，两个方向都只用到 (A_j\pm B_j)/2 的凸组合与
\beta 的最小性，零和用来把"剩余未用的负号索引的和"写成 -M_j。
为什么 \delta 必须是 1/4 这种具体数：signing.tex:19 固定 \ell=5/2，选号时需要 fiber 长度 >2 且
\lvert c-q\rvert<\ell-1+\delta=3/2+1/4<2（signing.tex:201-207），于是 \delta 与 \ell 是一对联动常数；
而 \delta 又出现在 \sigma=\kappa\delta/(\sqrt2\pi) 与 slab 代价 \pi^2\delta^{-2}，所以 \delta 缩小
会让能量代价变大、\sigma 变小、C 变大；\delta 增大到接近 1/2 时 3/2+\delta 与 2 的余量耗尽。

(d) [推测] 候选失败路线。
[推测] 一：不设 predictor 约束，直接令 x_{d+i}=\varepsilon_i。那 R_tx=\sum\varepsilon_iC_t\cdots C_{i+1}b_i
带收缩历史，等式 assembly.tex:238-240 的 R_tx=\sum_{i\le t}\varepsilon_ib_i 不成立，前缀与状态脱钩。
断点就在 assembly.tex:229-236 的三行展开：没有 \eta_tb_t^TR_{t-1}x 这一项去补回被 C_t 削掉的法向分量，
状态就永远比真实前缀小一个可累积的量，而这个量的符号无法由我控制。
[推测] 二：让 m_i 也依赖第 i 个坐标自己（即非因果的 predictor）。这样 assembly.tex:204-208 的
q_i 就不是"已赋值坐标的函数"，prop:adaptive 的假设（q_i:\R^{i-1}\to[-\delta,\delta]）被破坏，
signing.tex:320-327 的归纳里 q 无从计算。而且 m_ix=\delta 的约束变成隐式方程，clip 撤销的论证（依赖
\lvert m_ix\rvert<\delta 由 x\in K 给出）不再成立。
[推测] 三：不引入 x^0（即不抹掉初始 d 个坐标）。那 m_i 会碰到状态坐标，而状态坐标在 prop:adaptive 里
不被赋值（它只走 e_{d+1},\ldots,e_{d+n} 这些轴，assembly.tex:203），列预算里前 d 列不再为 0
（assembly.tex:150 那句"Its initial $d$ columns are zero"），\lVert Me_j\rVert^2 变成
\eta_i^2b_i^TC_i\cdots 作用在状态轴上的量，望远镜只能给 \le1 ，并非 \le\sigma^2，能量闭合失败。

### 5.4 抵消恒等式与 fig:cancellation

(a) tex 逐字。assembly.tex:228-244：

> R_tx=C_tR_{t-1}x+b_tx_{d+t}=(I-\eta_tb_tb_t^T)R_{t-1}x+b_t(\eta_tb_t^TR_{t-1}x+\varepsilon_t)=R_{t-1}x+\varepsilon_tb_t.
> Thus, simultaneously for every $0\le t\le n$, $R_tx=\sum_{i=1}^t\varepsilon_ib_i$. Since $x\in2D_*\mathcal D$, all these states have norm less than $2D_*A_0\sqrt d$.
> Dividing by $\sigma$ proves Theorem~\ref{thm:signing} with the absolute constant $C=2D_*A_0/\sigma$.

(b) 补中间步骤。三行的代数：把 x_{d+t}=\eta_tb_t^TR_{t-1}x+\varepsilon_t（即 unclipped-coordinates）代入
R_t 的递推。第一项 (I-\eta_tb_tb_t^T)R_{t-1}x=R_{t-1}x-\eta_t(b_t^TR_{t-1}x)b_t，第二项
b_t(\eta_tb_t^TR_{t-1}x+\varepsilon_t) 里的 \eta 项与之精确反号，剩下 R_{t-1}x+\varepsilon_tb_t。
注意这里用的是 R_{t-1}x ，并非 R_{t-1}x^0，因为初始块坐标全为 0（assembly.tex:211 那句
"Its first $d$ coordinates remain zero"，以及 assembly.tex:220 那句"Here $x^0=x$ because the initial block is zero"）。
归纳基 t=0：R_0x=x^0 的前 d 坐标，即 0。所以 R_tx=\sum_{i\le t}\varepsilon_ib_i 对一切 t 同时成立。

(c) 机械理由。这一节说明"为什么界是 \sqrt d ，并非 d 或 \log d"的最内层理由已经在前几处埋好：
唯一进入最终不等式的量是 A_0\sqrt d，而那个 \sqrt d 是 prop:filtered 的状态半径，来自
\sum_\theta k_t(\theta)\le Cd 的尺度求和。也就是说 \sqrt d 的指数被两个东西夹住：
上界侧由 \phi 的几何衰减（谱方向个数 d，每方向 O(1)）给出；下界侧由单纯形例子给出。
中间没有任何 \log：f_0 的二分支撑带让每个特征值只激活 O(1) 个尺度（matrix.tex:101-104），
如果尺度是 \theta^{-1} 的连续统或者支撑带是多项式衰减，并非几何衰减，就会出现 \log 因子。
这也解释了 assembly.tex:242 那句为什么范数是 2D_\ast A_0\sqrt d：x\in K\subset2D_\ast\mathcal D，
\mathcal D 里的状态界是 A_0\sqrt d，尺度放大 2D_\ast。

(d) [推测] 候选失败路线。
[推测] 一：想省掉 2D_\ast 这层放大，直接令 K=(D_\ast\mathcal D)\cap\{\lvert m_ix\rvert<\delta\}。
在 lem:slab-energy 里会断：brownian.tex:111-116 的论证需要 \overline{D_*D}\subset2D_*D 这种"闭包仍在开集内"
的余量，系数 2 就是那个余量。省掉它，slab 能量界里的闭事件无法放进开事件，\lambda_Q(K) 的上界不成立。
[推测] 二：让 b_i 与 v_i 不同向（比如 b_i=\sigma v_i/\lVert v_i\rVert 单位化）。当 \lVert v_i\rVert 很小
（比如趋于 0）时这条把小向量放大成单位向量，抵消后的 \varepsilon_ib_i 不再等于 \sigma\varepsilon_iv_i，
最后无法除以 \sigma 得到原序列的前缀；而 introduction.tex:47-48 明确允许零向量，单位化在 v_i=0 处直接无定义。
[推测] 三：把递推改成 R_t=C_t(R_{t-1}+b_tx_{d+t})（先加后缩）。此时抵消项要乘上 C_t 才能对齐，
即需要 x_{d+t}=\eta_tb_t^TR_{t-1}x+C_t^{-1} 型的东西，而 C_t^{-1} 无界（C_t 的最小本征值
\sqrt{1-\lVert b\rVert^2} 可以接近 1 但逆会放大高频方向），m_i 的列预算随之失败。

## 6 逐引理反推（二）：transference、slab 能量与布朗事实

### 6.1 从符号到排列：introduction.tex:75-103

(a) tex 逐字（introduction.tex:86-101）：

> The positive-sign and negative-sign selections from an original prefix sum respectively to $P_j=\frac{A_j+B_j}{2},\ M_j=\frac{A_j-B_j}{2}$.
> Place all positive-sign indices in their original order, followed by all negative-sign indices in reverse original order.
> A partial sum in the first block is some $P_j$. In the second block, the unused indices are the negative-sign indices of an original prefix.
> Since the total sum is zero, the current partial sum is therefore some $-M_j$. ... Every new partial sum has norm at most $\frac{\beta+C\sqrt d}{2}$.
> By minimality, $\beta\le\frac{\beta+C\sqrt d}{2}$, and hence $\beta\le C\sqrt d$.

出处标注在 introduction.tex:71-73：Chobanyan 的转移原理，用的是其"finite positive-forward, negative-reverse form"，
引 ChobanyanEtAl2023 的 Theorem 2.1 与 Remark 1。

(b) 补中间步骤。先固定一个达到 \beta 的排列（有限性保证存在，introduction.tex:76-77），按它重标向量，
于是 A_j=\sum_{i\le j}v_i 满足 \lVert A_j\rVert\le\beta 对一切 j；同一序列用 thm:signing 的符号得
B_j=\sum_{i\le j}\varepsilon_iv_i，\lVert B_j\rVert\le C\sqrt d。定义
P_j=\sum_{i\le j,\varepsilon_i=+1}v_i=(A_j+B_j)/2，M_j=\sum_{i\le j,\varepsilon_i=-1}v_i=(A_j-B_j)/2，
这是把 A_j 按符号拆成两半，恒等式直接由 B_j 的定义来。新排列是"正号索引按原序，接负号索引按逆原序"。
第一段：走 m 步（m 是前 j 个里的正号数）后部分和恰为 P_j，某 j。第二段：设全部正号集合为 I_+、负号为 I_-，
\lvert I_-\rvert=L。在第二段已经取了逆序的前 s 个负号（对应原索引 i_1>i_2>\cdots>i_s 里较大的那些），
当前部分和是 P_{\max}+\sum_{\text{已取负号}}v_i，其中 P_{\max}=P_N。由 A_N=\sum v_i=0 与
B_N=\sum\varepsilon_iv_i，P_N=(A_N+B_N)/2=B_N/2，M_N=(A_N-B_N)/2=-B_N/2，即 P_N+M_N=0（这一步只用零和）。
记到原索引 j 为止的负号部分和为 M_j，则"已取的负号"= M_N-M_j（逆序取到某个截断，等价于把 j 之前的负号留下没取）。
于是当前部分和 = P_N+M_N-M_j=-M_j。取范数 \le(\beta+C\sqrt d)/2，因为 \lVert M_j\rVert\le(\lVert A_j\rVert+\lVert B_j\rVert)/2。
第一段的界同理。最后：新排列是原族的一个排列，所以按 \beta 的最小性 \beta\le\max\lVert\text{新前缀}\rVert\le(\beta+C\sqrt d)/2，
解出 \beta\le C\sqrt d。introduction.tex:102 补了一句"This also covers either block being empty"，
即全正或全负时 P_N 或 M_N 为 0，论证仍闭合；全负时 P_N=0、M_N=B_N/2 且 P_N+M_N 需要 A_N=0，正是零和。

(c) 机械理由。零和条件在这里被消费的次数恰好是 1：P_N+M_N=0。少了它，第二段的"剩余负号 = -M_j"改写不了
成部分和的表达式，就得对 B_N 另加一项，界变成 (\beta+C\sqrt d+\lVert B_N\rVert)/2 这种不能自锁定的形式。
反过来，thm:signing 不需要零和（introduction.tex:12 只要求 \lVert v_i\rVert\le1），这解释了摘要里两句话的
分工：第一句是给定次序的符号问题，无零和；第二句是有下标的零和族的排列问题，"因此"两字的逻辑重量
全在这个 1/2 系数与自锁定不等式上。为什么"同一个常数 C 也够用"（introduction.tex:44）：因为链式不等式
\beta\le(\beta+C\sqrt d)/2 的解正是 \beta\le C\sqrt d，没有额外因子。
系数 1/2 的本质：两个可行解 A（受 \beta 控）与 B（受 C\sqrt d 控）的凸组合，插值出中间状态的界。
[外部推断] 这跟 Bergström 恒等式（平方和分解）在传统 Steinitz 证明里的角色是一个层级的技巧，
Bergström 的经典做法是把重排的界与符号的界用 Abel 变换联系，而这里用的是 Chobanyan 的测度论版本；
我把这一步写得很短，正说明它是"已经知道的技术"，我的新东西在前面那条定理。
重复与零向量的处理：introduction.tex:47 明说"Both statements allow repetitions and zero vectors"，
在 transference 里排列保持重数（introduction.tex:102 "This permutes indices and so preserves all multiplicities"）。

(d) [推测] 候选失败路线。
[推测] 一：不用两分块顺序而用"正负交错"的插值顺序。断在第二段：交错时已取部分不再是任何 j 的 M_j 或
其补集，"剩余索引恰是某前缀的负号集"这一关键结构消失，界退化成 \beta+C\sqrt d 的和，自锁定失败。
[推测] 二：直接对 thm:steinitz 用 thm:signing 的符号赋值当答案（即把 \varepsilon_iv_i 看成重排）。
断在陈述本身：thm:steinitz 的部分和是不带符号的 \sum v_{\pi(i)}，符号改变元素身份，重数虽然保住但向量本身被
取负了，不是原族的排列。这条错误尝试的代价是：我必须承认零和条件只能以"平均"的形式进入，即 (A\pm B)/2。
[推测] 三：如果只有终端型符号界（\lVert B_N\rVert\le C\sqrt d ，并非全前缀），上面的 P_j、M_j 只有 j=N 有界，
第一段与第二段的中途部分和失控。断点正好是 introduction.tex:145-148 强调的区别：终端陈述"允许符号随前缀改变"，
而转移需要一个对所有 j 同时成立的 B_j。

### 6.2 lem:slab-energy：加 slab 的能量代价

(a) tex 逐字（assembly.tex:95-108）：

> Let $D\subset\R^m$ be bounded, nonempty, open, convex and centrally symmetric. Let $D_*>0$, $\delta>0$, and let $m_1,\ldots,m_n$ be real rows of length $m$. Set $K=(2D_*D)\cap\bigcap_{i=1}^n\{x:\lvert m_ix\rvert<\delta\}$. For every positive definite diagonal $Q$, $\lambda_Q(K)\le D_*^{-2}\lambda_Q(D)+\pi^2\delta^{-2}\sum_{i=1}^n m_iQm_i^T$.

(b) 补中间步骤。证明在 brownian.tex:104-139。取协变速率 2Q 的布朗运动 W 从 0 出发，在 [0,T] 上强制闭约束
W(s)\in\overline{D_*D} 与 \lvert m_iW(s)\rvert\le\delta/2。同时成立蕴含在 K 内存活，因为
\overline{D_*D}\subset2D_*D（0 是凸集 D 的内点，故 r\overline D\subset D 对 r<2 成立，这里 r=D_* 而系数 2 就是余量）
以及 \delta/2 闭 slab 含在 \delta 开 slab 内。由 lem:gaussian-path-correlation（brownian.tex:73-102）
把交集概率放成各事件概率之积。对非零行 m_i，m_iW 是一维布朗运动、协变速率 2c_i，c_i=m_iQm_i^T
（brownian.tex:124-126）；区间 (-\delta/2,\delta/2) 上 -c_i\,d^2/dx^2 的第一 Dirichlet 特征函数是
\cos(\pi x/\delta)，特征值 \pi^2c_i/\delta^2：区间长度是 \delta，标准区间 (-L,L) 上第一特征值
=c\pi^2/(2L)^2=c\pi^2/\delta^2，L=\delta/2，代入即得。由 lem:brownian-rate 这就是该 slab 的存活指数。
零行给恒零过程，概率 1、代价 0。取负对数、除 T、T\to\infty，用 lem:brownian-rate 把两个存活率换成能量，
再用 Rayleigh 商的变量替换得 \lambda_Q(D_*D)=D_*^{-2}\lambda_Q(D)，即得。

(c) 机械理由。\pi^2 与 \delta^{-2} 不是任意常数：它们是一维区间基态特征值的精确值，说明"一条 slab 的代价"
在能量货币里就是 c_i 乘 \pi^2/\delta^2。这就是为什么 assembly.tex:194 里 \sigma 的定义带着 \pi 与 \delta：
\pi^2\delta^{-2}\sigma^2\le\kappa^2/2 要成立，\sigma\le\kappa\delta/(\sqrt2\pi) 恰好是等号解的一半。
"被谁消费"：assembly.tex:186-190。改动 \pi^2 的系数会直接搬到 D_\ast 或 \sigma 的取值上，最终搬到 C 上。
半阈值 \delta/2 与 \pi^2/\delta^2 之间有一个表面上的不一致（1 维 slab 用的是 \delta/2 宽的区间，
但能量写成 \pi^2\delta^{-2}），其机械理由是：区间 (-\delta/2,\delta/2) 的长度是 \delta，基态特征值
\pi^2/(长度)^2=\pi^2/\delta^2，所以闭事件用 \delta/2 阈值与开事件用 \delta 阈值之差只体现在包含关系上，
不额外付常数。这一点我在第一遍读的时候以为漏了个因子 4，检查后发现 tex 是对的。
brownian.tex:136-138 还专门补了一句："The argument used only inclusions between closed and open events;
it requires no assertion about equality of their survival rates." 这句话的存在本身就是证据：
作者担心读者以为需要 \lambda_Q(\overline{D_*D})=\lambda_Q(D_*D) 这种边界正则性。

(d) [推测] 候选失败路线。
[推测] 一：不用概率而用直接的测试函数（对每条 slab 取 g(x)=\cos(\pi m_ix/2\delta) 型的截断乘子），
试图把 \lambda_Q(K) 估成 \lambda_Q(D) 加上各 slab 代价。断在多个约束同时作用：n 条 slab 的测试函数乘积
的梯度会交叉，产生 \sum_{i\ne j} 的混合项；只有 correlation 论证天然把混合项变成"概率相乘"。
[推测] 二：把 D_* 折进 \mathcal D 的定义（即直接在 prop:filtered 里取更大的 A_0、B_0）。
断在 assembly.tex:193：D_\ast 必须同时压住 H_0D_\ast^{-2} 项而又不放大 C=2D_\ast A_0/\sigma，
如果 D_\ast 被吸收进 A_0、B_0，那么 A_0 就不再"绝对且与 Q、递归无关"之外的自由度可用，
两个约束（能量 \le\kappa^2 与常数 C 尽量小）无法同时调。
[推测] 三：假设 m_iQm_i^T 的求和能被 \lVert Q\rVert_{op} 控住从而只出现一条 slab。
断在 assembly.tex:174-177：那里的求和是对列做的，\sum_jQ_{jj}\lVert Me_j\rVert^2，用不了任何
"行更少"的捷径；若强行合并成 \lVert Q\rVert_{op}\sum_i\lVert m_i\rVert^2，\sum_i\lVert m_i\rVert^2
正是与 n 无关性丢失的地方（行个数 n 无界）。

### 6.3 lem:brownian-rate 与 lem:gaussian-path-correlation

(a) tex 逐字（brownian.tex:8-19 与 73-88）：

> If $W$ is Brownian motion with covariance rate $2Q$, started at $x\in D$, then $\lim_{T\to\infty}-\frac1T\log\mathbb P_x\{W(s)\in D\text{ for all }0\le s\le T\}=\lambda_Q(D)$.
> ... Let $X:[0,T]\to\R^m$ be a centered Gaussian process with continuous paths. For $i=1,\ldots,r$, let $E_i$ be an event of the form $E_i=\bigcap_{j=1}^{r_i}\{A_{ij}X(s)\in K_{ij}\text{ for all }s\in I_{ij}\}$ ... Then $\mathbb P(\bigcap E_i)\ge\prod\mathbb P(E_i)$.

(b) 补中间步骤。brownian-rate 的证明走 killed 半群：生成元 \tr(Q\nabla^2)，Dirichlet 实现是
-\tr(Q\nabla^2)，形式 \int\nabla g^TQ\nabla g。有界凸域是连通 Lipschitz 域，标准 Dirichlet 理论适用
（brownian.tex:30-33 引 DaviesSimon1984）。紧嵌入 H^1_0\hookrightarrow L^2 给谱离散、\lVert P_s^D\rVert_{2\to2}=e^{-s\lambda}、
存在非负第一特征函数 \varphi，强极大原理让 \varphi 严格正，自由热核控制加 \varphi=e^\lambda P_1^D\varphi
与 Cauchy--Schwarz 给 \varphi 有界。下界：e^{-T\lambda}\varphi(x)=P_T^D\varphi(x)\le\lVert\varphi\rVert_\infty\mathbb P_x\{\tau_D>T\}。
上界：\mathbb P_x\{\tau_D>T\}\le\lVert p_Q(1,x,\cdot)\rVert_2\lVert P_{T-1}^D\mathbf1_D\rVert_2
\le\lVert p_Q(1,x,\cdot)\rVert_2\lvert D\rvert^{1/2}e^{-(T-1)\lambda}。取对数除 T，夹逼得极限。
路径 correlation：先把每个闭区间换成有限网格，此时所有约束是同一个有限维中心高斯向量上的闭中心对称凸条件；
把该向量表成其线性支撑上标准高斯的线性像（故奇异协方差无障碍），用 Royen 高斯 correlation 不等式
（brownian.tex:96 引 Royen2014）对有限个事件迭代；再把网格加密到稠密，用 K_{ij} 闭 + 路径连续取递降极限，
概率上连续完成论证。

(c) 机械理由。协变速率写成 2Q 是一个归一化约定（assembly.tex:21-22 明说"This normalization corresponds to
Brownian motion with covariance rate $2Q$"）：因为热方程 u_t=\tr(Q\nabla^2)u 的基础解协方差是 2tQ，
而它的 Dirichlet 特征值就是 \lambda_Q，所以存活极限恰等于 \lambda_Q 而不带 1/2。若写成协变速率 Q，
则 brownian-rate 的右边要变成 2\lambda_Q 或者能量定义里出现 1/2，slab 代价 \pi^2\delta^{-2} 与
\kappa^2、\sigma 的闭合全部要重标。这是"每一个常数、每一个指数"链条里容易被忽略但咬合最紧的一环。
correlation 承担的角色：把"每个尺度、每个能量箱、每段时间、每个坐标盒"这四类事件的独立正概率
乘成一个整体存活概率。没有它，我只能对每个事件单独取概率然后指望维数不变性，而那必然引入
事件个数（随 n 增长）的损失。约束是闭集这一点对应 brownian.tex:91-101 的网格+闭集+路径连续论证，
它允许重复事件（survival.tex:314-316 特别说"its finite-grid argument and the continuity of the paths apply
even when some constraints are duplicates"）。

(d) [推测] 候选失败路线。
[推测] 一：用 Sudakov 型 minch 下界替代 correlation 来做乘积概率。断在事件不独立、不单调，
且 Sudakov 下界给的是\sup 的下界，并非"全部约束同时满足"的下界，方向不对。
[推测] 二：直接在 \mathcal D 上算 Dirichlet 特征值（不借助概率）。断在 \mathcal D 是 (d+n) 维、
n+d+1 组约束的交，单调性只能给出 \lambda_Q(\mathcal D)\ge\lambda_Q(\text{某个外包盒})，
方向是反的；要的是上界，所以必须构造测试函数，而好的测试函数正是由存活概率经 Feynman--Kac 反过来给的。
[推测] 三：对无限多个事件直接用 Royen（它是有限交的不等式）。断在 brownian.tex:91-101 那段网格化：
必须先有限化，再用闭性与路径连续取极限；如果跳过这层，事件集不可测或者极限方向给出的是不等号反向。

## 7 逐引理反推（三）：signing.tex 从能量到带平移的符号

这一节是 prop:adaptive（assembly.tex:32-50）的证明链条，四个环节串成一串：
一次对角能量假设 $\Rightarrow$ 一个同时控制所有坐标能量的函数（lem:simultaneous-density, signing.tex:36-92）
$\Rightarrow$ Minkowski 平均下能量的凸性（lem:minkowski, signing.tex:104-151，Prekopa 用在这里）
$\Rightarrow$ 一个允许带平移取符号的截面（lem:shift-section, signing.tex:159-307，抬升 Steiner 重排）
$\Rightarrow$ 反向构造体、正向选号（signing.tex:311-332）。

### 7.1 lem:simultaneous-density：一条对角能量假设换来 m 个坐标能量

(a) tex 逐字（signing.tex:36-49）：

> Let $K\subset\R^m$ be a nonempty bounded open convex set symmetric about zero. If $\lambda_Q(K)\le\kappa^2\operatorname{tr} Q$ for every positive definite diagonal $Q$, then there is a nonnegative $f\in H^1(\R^m)$, vanishing almost everywhere outside $K$, such that $\int f^2=1,\ \int\lvert\partial_i f\rvert^2\le\kappa^2$ for $1\le i\le m$.

(b) 补中间步骤。定义可行上界集 \mathcal A=\{u\in\R^m:\exists f\in\mathcal F,\ E_i(f)\le u_i\ \forall i\}，
其中 \mathcal F 是支撑在 K 内、L^2 范数 1 的非负 H^1 函数。三步：非空（任取 f 归一化）、
对加非负向量封闭（同一 f 即可）、凸（关键插值 h=(tf^2+(1-t)g^2)^{1/2}，
Sobolev 链式法则给 \partial_i h=(tf^2\partial_ig^2+(1-t)\ldots)/(2h) 型表达式，
配合 Cauchy--Schwarz 得 \lvert\partial_i h\rvert^2\le t\lvert\partial_i f\rvert^2+(1-t)\lvert\partial_i g\rvert^2，
而 \int h^2=t\int f^2+(1-t)\int g^2=1，故 h\in\mathcal F）。闭合性靠有界支撑 + H^1 一致界
（\lVert f\rVert_{H^1}^2=\int f^2+\sum_iE_i(f)\le 1+m\max u^{(j)}）给自反球弱紧，
加上有界域上 H^1\hookrightarrow L^2 紧，取子列弱 H^1、强 L^2 收敛到 \mathcal F 内的 f（支撑条件在 L^2 极限下
保持，因为 K 的补集上的积分对每个 f_j 是 0），能量对弱收敛下半连续。
然后反证：若 c=\kappa^2(1,\ldots,1)\notin\mathcal A，由 \mathcal A 闭凸与严格分离超平面定理存在非零 w
使 w\cdot c<\inf_{u\in\mathcal A}w\cdot u。上集性质迫使 w_i\ge0（若 w_i<0，把 u 加上大正数的第 i 分量
使 w\cdot u\to-\infty，与下界有限矛盾）。对 \epsilon>0 取 Q_\epsilon=\diag(w_i+\epsilon) 正定对角，
则 \inf_{f\in\mathcal F}\sum_iw_iE_i(f)=\inf_{f}\frac{\sum_i(w_i+\epsilon)E_i(f)}{\int f^2}-\epsilon\sum\ldots
的形式由 Rayleigh 下确界给出：\inf_{u\in\mathcal A}w\cdot u\le\inf_{f\in\mathcal F}\sum w_iE_i(f)
\le\lambda_{Q_\epsilon}(K)\le\kappa^2\sum(w_i+\epsilon)=w\cdot c+m\epsilon\kappa^2。
令 \epsilon\downarrow0 与严格分离矛盾。signing.tex:90 特意说"This argument also covers zero components of $w$"：
w 有零分量时 Q_\epsilon 仍正定，所以不需要额外扰动那些方向。

(c) 机械理由。这一步是把"对所有对角 Q 一致"这种看起来过强的假设变成可用的东西的唯一出口，
它本质是一个 Farkas/Gordan 型凸对偶：m 个能量约束的联合可行性等价于每个正组合的单约束可行性。
假设 \lambda_Q(K)\le\kappa^2\tr Q 对每个正定对角 Q 成立，正是"每个正组合的组合能量 \le\kappa^2 乘权重和"。
零扩展约定 eq:zero-extension（signing.tex:26-34）在这里被显式调用（signing.tex:82-83
"By (zero-extension), taking absolute values and normalizing does not change the Rayleigh infimum"）：
因为 \lvert f\rvert 与 f 有相同的弱导数绝对值，而 Rayleigh 商取 inf 时可以假设非负；
另外它保证 H^1_0(K) 与"支撑在 K 内的 H^1(\R^m)"是同一个空间，从而 \mathcal F 的定义合法。
凸性论证里 h 的构造用的是 L^2 上的"平方平均"，并非线性平均，正是因为我们要的是
\int h^2=1 归一化同时保持；线性平均 tf+(1-t)g 的 L^2 范数不等于 1，能量估计也没有这么干净。

(d) [推测] 候选失败路线。
[推测] 一：对每个坐标 i 单独取最小化 E_i 的特征函数 f_i，然后取某种平均。断在 f_i 彼此不同，
无法同时满足所有 m 个坐标的能量；而且第一 Dirichlet 特征函数只在 \lambda_{e_ie_i^T} 那种单权重下最优，
组合权重下不最优。凸集 \mathcal A 的论证正好补上这个洞。
[推测] 二：假设 \lambda_Q(K)\le\kappa^2 只在 Q=I 时成立（普通第一特征值小）。
断在 w 的分离论证：没有对每个对角 Q 的假设，就得不到 \inf_{f}\sum w_iE_i(f)\le\kappa^2\sum w_i 这一族不等式，
\mathcal A 与 c 的分离无法被推翻，即 m 个坐标能量可能各差一个 m 的因子。
[推测] 三：把 \int\lvert\partial_i f\rvert^2\le\kappa^2 改成 \sum_i\int\lvert\partial_i f\rvert^2\le\kappa^2（总量小）。
看起来更弱更省，但后面 lem:shift-section 的抬升只用到"水平方向 y 的导数"（signing.tex:220
"Only derivatives in the horizontal variable $y$ will be used"），需要对每个水平坐标单独可控，
而总量小允许某个坐标集中全部能量；断点在 signing.tex:242-244 把 \int\lvert\partial_{y_i}\Psi^*\rvert^2
逐坐标压到 \kappa^2，随后 signing.tex:294-298 用对角 Q 加权时要求每个坐标各自有界。

### 7.2 lem:minkowski：Prekopa 对数凹性用在哪一个积分上

(a) tex 逐字（signing.tex:104-111 与证明里 125-143）：

> Let $D_0,D_1$ be nonempty bounded open convex sets symmetric about zero, and $Q$ positive definite diagonal. For $0\le\alpha\le1$, $\lambda_Q((1-\alpha)D_0+\alpha D_1)\le(1-\alpha)\lambda_Q(D_0)+\alpha\lambda_Q(D_1)$.
> Let $W$ start at zero with Brownian covariance rate $2Q$. On a finite grid of positive times in $[0,T]$, its values form a Gaussian vector. Gaussian log-concavity (Prekopa 1973, Theorem 2) shows that $\mathbb P\{W\text{ lies in }A_\alpha\text{ on the grid}\}\ge\prod_{i=0}^1\mathbb P\{W\text{ lies in }A_i\text{ on the grid}\}^{\alpha_i}$.

(b) 补中间步骤。取 0<\eta<1、r=1-\eta，A_i=r\overline{D_i} 紧凸，A_\alpha=(1-\alpha)A_0+\alpha A_1
\subset r\overline{D_\alpha}\Subset D_\alpha（Minkowski 平均的紧凸集仍在开平均集内，因为
r\overline{D_\alpha}=(1-\alpha)r\overline{D_0}+\alpha r\overline{D_1} 且 0 为内点给出严格包含）。
(W(s_1),\ldots,W(s_M)) 是中心高斯向量，其分布密度关于 (s_1,\ldots,s_M) 取值是 log 凹的；
事件"每个 s_k 落在 A 内"是该高斯向量落在笛卡尔积 \prod_k A 里。Prekopa 对数凹性（这里引
Prekopa1973 Theorem 2）给出：对 log 凹测度，\mu((1-\alpha)E_0+\alpha E_1)\ge\mu(E_0)^{1-\alpha}\mu(E_1)^\alpha。
而 \prod_k((1-\alpha)A_0+\alpha A_1)=(1-\alpha)\prod_k A_0+\alpha\prod_k A_1（逐坐标 Minkowski 平均与积集交换），
所以"网格事件对 A_\alpha"包含"A_\alpha 的网格平均"，即被 (1-\alpha)E_0+\alpha E_1 包含，得到网格不等式。
把网格加密到 [0,T] 的稠密子集：事件是递降的（约束越多概率越小？这里是加密使约束集增大，
所以要用 A_i 闭 + W 路径连续来识别极限为"W([0,T])\subset A_i"），signing.tex:136-137 明确处理这一步。
由于 rD_i\subset A_i 与 A_\alpha\subset D_\alpha，得
\mathbb P_0\{W([0,T])\subset D_\alpha\}\ge\prod_i\mathbb P_0\{W([0,T])\subset rD_i\}^{\alpha_i}。
再用 lem:brownian-rate（brownian.tex:13）把左边的存活率与 \lambda_Q(D_\alpha) 联系、右边与
\lambda_Q(rD_i) 联系；再由 Rayleigh 商在 x\mapsto rx 下的缩放 \lambda_Q(rD)=r^{-2}\lambda_Q(D) 得
\lambda_Q(D_\alpha)\le r^{-2}((1-\alpha)\lambda_Q(D_0)+\alpha\lambda_Q(D_1))，最后 \eta\downarrow0 让 r^{-2}\to1。

(c) 机械理由。被 Prekopa 作用的"积分"是有限网格上的高斯向量在 \R^{mM} 里对积集 \prod_k A 的测度积分，
不是对凸体本身的体积积分。这一点很关键：如果用 Prekopa 直接对 D_\alpha 的指示函数做体版本
（|（1-\alpha)D_0+\alpha D_1|\ge|D_0|^{1-\alpha}|D_1|^\alpha），得到的是体积的对数凹性，
和 Dirichlet 能量没有联系。能量与存活率的桥只能靠布朗路径测度来搭，所以必须先固定 T 与网格、
再加密、再用 lem:brownian-rate。r^{-2} 因子的机械来源：布朗协变速率 2Q 在 x\mapsto rx 下变成
2r^2Q 的缩放，或者等价地 \int_{rD}\langle Q\nabla g,\nabla g\rvert = r^{m-2}\int_D\ldots 对比
\int_{rD}g^2=r^m\int_Dg^2，商出现 r^{-2}。让 \eta\downarrow0 是为了把闭包 r\overline D 换成开集 D，
这也是为什么 lem:minkowski 的陈述对开凸集成立，并非对闭集。
这条引理在链条里的唯一用途是 signing.tex:282-290：证明 s\mapsto h_Q(s)=\lambda_Q(D_s) 沿 |s| 凸，
从而能用 Jensen 与"均值高度 M>1"把 D_1 的能量压住。它是 D_s 之间的凸性来源，靠 B^* 的凸性给出
(1-t)D_s+tD_r\subset D_{(1-t)s+tr}（signing.tex:179-182 的 fiber 凸性），再套 lem:minkowski。
[外部推断] Brascamp--Lieb 1976 的经典结果是第一 Dirichlet 特征值在 Minkowski 平均下对数凹
（signing.tex:97-100 明说了这是该不等式的对角版本，并引 Bryan--Clutterbuck--Rankin 的现代表述）；
tex 选择重新证明，并非引用，理由在对角权重 Q 与开域逼近这两个细节上，
这是我在写严格证明时会遇到的同一种"引用不敢用"的处境。

(d) [推测] 候选失败路线。
[推测] 一：直接引用 Brascamp--Lieb 的对数凹版本（即 \lambda((1-\alpha)D_0+\alpha D_1)^{-1}
\ge\ldots 倒数型凹性）而只用 \alpha=1/2。断在两点：其一，对数凹给出的是倒数关系，我要的是普通凸性
才能配合"h_Q 单调 + Jensen 给 h_Q(1)\le\int h_Q\rho"（signing.tex:300-304），
倒数凹性只给 \lambda(D_{1/2})^{-1}\ge\ldots 即 \lambda(D_{1/2})\le 调和式界，方向和强度都不匹配；
其二，Brascamp--Lieb 对光滑域陈述，开凸域需要逼近，正是 signing.tex:115-123 做的那段 r\overline D 工程。
[推测] 二：用 Steiner 重排直接对能量做单调化而跳过 Minkowski 凸性。断在最终需要
\lambda_Q(D_1) 有界，而重排只把能量交给"高度的分布" \rho，必须有一个把
\int h_Q(|s|)\rho 与 h_Q(1) 联系的不等式；没有 h_Q 的凸 + 单调，1<M 与 h_Q(1)\le h_Q(M) 这一步不成立。
[推测] 三：把 T 固定为一个与输入有关的小值。断在缩放链条：需要 \eta\downarrow0 与网格加密两个极限，
而 lem:brownian-rate 的极限是 T\to\infty，若 T 有限只剩 \mathbb P 与 e^{-T\lambda} 之间的不等号方向问题，
拿不到 \lambda 本身的凸性。

### 7.3 lem:shift-section：抬升、竖直 Steiner 重排、均值高度 M>1

(a) tex 逐字（signing.tex:163-167 与关键不等式 199-207、251-277）：

> For every coordinate vector $e$, there is another domain $T_e(K)$ with the same properties such that, for all $y\in T_e(K)$ and $\lvert q\rvert\le\delta$, some $\varepsilon\in\{-1,1\}$ satisfies $y+(q+\varepsilon)e\in K$.
> $B=\{(y,s)\in\R^m\times\R:y+se\in K,\ \lvert s\rvert<\ell\}$, $B^*=\{(y,s):y\in P,\ \lvert s\rvert<L(y)/2\}$, $D_s=\{y\in P:L(y)>2s\}$.
> Choose $c\in(a+1,b_0-1)$; then $[c-1,c+1]\subset I_y,\ \lvert c\rvert<\ell-1=\frac32$. For $\lvert q\rvert\le\delta$, we have $\lvert c-q\rvert<7/4<2$. If $q\le c$, then $q+1$ lies in $[c-1,c+1]$; if $q\ge c$, then $q-1$ lies in that segment.
> $M\ge\frac\ell2(1-2\ell\kappa)=\frac{19}{16}>1$.

(b) 补中间步骤。L(y)=\lvert I_y\rvert 的凹性由 fiber 的凸性 (1-t)I_y+tI_z\subset I_{(1-t)y+tz} 直接取长度。
B^* 的开凸性：L 凹且正，\{(y,s):\lvert s\rvert<L(y)/2\} 是关于 y 的凸集（上方图的对偶形式），
K 的对称给出 L(-y)=L(y)，所以 B^* 分别对 y 与 s 对称。b=\sup\{s:D_s\ne\emptyset\} 满足 0<b\le\ell
（\ell 是人为截断，若 K 沿 e 方向的弦长全部小于 2 则 b<1，此时 M<b<1 会与下面 M>1 矛盾，
所以证明结构上保证了 D_1 非空）。
取 f（7.1 的产物）与 \Psi(y,s)=(2\ell)^{-1/2}f(y+se)\mathbf1_{(-\ell,\ell)}(s)。\lVert\Psi\rVert_2^2
=(2\ell)^{-1}\int_{-\ell}^{\ell}\int f(y+se)^2dy\,ds=(2\ell)^{-1}\cdot2\ell\cdot1=1（平移不变 + Fubini）。
水平导数 \partial_{y_i}\Psi=(2\ell)^{-1/2}(\partial_if)(y+se)\mathbf1，故能量不变，
这就是 signing.tex:216-219 的 eq:lifted-energy。竖直重排把每个 fiber 换成偶的、随 \lvert s\rvert 递减的函数 \Psi^*。
可测性用超水平长度 \mu(y,u)=\lvert\{s:\Psi(y,s)>u\}\rvert 构造，逐 (y,u) 换成居中区间，
所以 \Psi^* 可测且保 L^2 范数，支撑落在 B^*（因 \Psi 支撑在 B 内、重排保测度、K 与 L 的对称性）。
Riesz 不等式（同层蛋糕公式）\int ab\le\int a^*b^* 加上范数守恒给
\lVert a^*-b^*\rVert_2\le\lVert a-b\rVert_2；对 y 与 y+he_i 的 fiber 用一次、再对 y 积分，
差分商被控，取弱极限得水平导数不增（signing.tex:239-244，eq:rearranged-energy）。
均值高度 M 的计算：\i\lvert s\rvert\Psi^{*2}。用层蛋糕：\lvert s\rvert 对"居中长度 u 的区间"的积分是 u^2/4，
而 \Psi^{*2}(y,\cdot) 的超水平集是长度 \nu(y,v)=\lvert\{\Psi^{*2}>v\}\rvert 的居中区间，
所以 \int\lvert s\rvert\Psi^{*2}(y,s)ds=\int_0^\infty\frac{\nu(y,v)^2}4dv。
另一方面 \nu(y,v)=\mu(y,\sqrt v)，且 \mu(y,\sqrt v)=\lvert\{s:f(y+se)^2/(2\ell)>v\}\rvert
= 长度 of \{r: f(y+re)^2>2\ell v\}。把两个副本的 r,r' 写出来，用
\int_0^\infty\mu(\sqrt v)^2dv 的双重写法即得 signing.tex:254-257 的三重积分表达：
M=\frac1{8\ell}\int_{-\ell}^{\ell}\int_{-\ell}^{\ell}\int_{\R^m}\min\{f(y+re)^2,f(y+r'e)^2\}dy\,dr\,dr'。
（系数核对：\frac14\cdot\frac1{2\ell}\cdot 两个 \int dr 的区间长度 2\ell 各自出现一次，
最终 \frac{1}{4}\cdot\frac{1}{(2\ell)}\cdot(2\ell)^2/(2\ell)^2 ... 具体由 tex 那句
"a centered interval of length $u$ has integral of $|s|$ equal to $u^2/4$. Apply this to the superlevel
intervals of $\Psi^{*2}$ and use Tonelli; the factor $(2\ell)^{-1}$ in $\Psi^2$ gives the displayed normalization"
限定，我不再重推系数。）
对非负平移 u,v（都是 f 的平移，L^2 范数 1）：\int\min(u^2,v^2)=1-\frac12\lVert u^2-v^2\rVert_1，
因为 \min(a,b)=\frac{a+b-\lvert a-b\rvert}2 且 \int(u^2+v^2)=2；再
\lVert u^2-v^2\rVert_1=\int\lvert u-v\rvert(u+v)\le\lVert u-v\rVert_2\lVert u+v\rVert_2\le 2\lVert u-v\rVert_2，
于是 \ge 1-\lVert u-v\rVert_2（signing.tex:263-267）。而
\lVert f(\cdot+re)-f(\cdot+r'e)\rVert_2\le\lvert r-r'\rvert\,\lVert\partial_ef\rVert_2\le2\ell\kappa
（沿方向的 L^2 平移连续性由弱导数给出，\lVert\partial_ef\rVert_2^2=\int\lvert\partial_ef\rvert^2\le\kappa^2）。
于是被积函数下界是 1-2\ell\kappa，积分区域 \lvert r\rvert,\lvert r'\rvert<\ell 给出体积 (2\ell)^2，
M\ge\frac1{8\ell}(2\ell)^2(1-2\ell\kappa)=\frac{\ell}2(1-2\ell\kappa)。
代 \ell=5/2、\kappa=1/100：\frac{5}{4}(1-\frac{5}{4}\cdot\frac{2}{100}\cdot2)... 逐字算：
2\ell\kappa=2\cdot\tfrac52\cdot\tfrac1{100}=\tfrac1{20}，1-\tfrac1{20}=\tfrac{19}{20}，
\frac{\ell}{2}=\frac54，\frac54\cdot\frac{19}{20}=\frac{95}{80}=\frac{19}{16}>1。与 signing.tex:275 一致。
在 \Psi^{*2} 这个概率测度下 \lvert s\rvert<b 几乎必然（因为支撑在 B^* 内、B^* 的 s 半径是 L(y)/2<b），
所以 M=\mathbb E\lvert s\rvert<b。结合 M>1 得 b>1，于是 D_1 非空。
能量传递：h_Q(s)=\lambda_Q(D_s) 单调非降（D_s 随 s 递减、domain monotonicity）；凸性由
(1-t)D_s+tD_r\subset D_{(1-t)s+tr} 与 lem:minkowski。用 \rho(s)=\int\Psi^{*2}(y,s)dy 作 |s| 的分布，
逐 slice 测 Rayleigh 商再积分给 \int h_Q(\lvert s\rvert)\rho\le\i\langle Q\nabla_y\Psi^*,\nabla_y\Psi^*\rangle
\le\kappa^2\tr Q。Jensen（h_Q 凸）给 h_Q(M)=h_Q(\mathbb E\lvert s\rvert)\le\mathbb E h_Q(\lvert s\rvert)，
单调（1<M）给 h_Q(1)\le h_Q(M)，两式合起来 \lambda_Q(D_1)\le\kappa^2\tr Q。

(c) 机械理由。这里的每一个数字都是联动的，我可以逐项说明为什么不能改。
fiber 长度阈值 2 是必须的：要能放下 q+\varepsilon 这对相距 2 的点（q+1 与 q-1 距离 2），
所以 L(y)>2，即 D_1=\{L>2\}。\ell 必须 >2：截断 \lvert s\rvert<\ell 时，
若 \ell\le2 就没有长度为 2 的弦可以放进抬升集，b\le\ell\le2 与 M>1、b>1 不矛盾但选 c 需要的
\lvert c\rvert<\ell-1 与 \lvert c-q\rvert<2 都要余量：c\in(a+1,b_0-1) 非空恰需 b_0-a=L(y)>2，
而 \lvert c\rvert 的上界要 L(y) 关于 0 居中程度，tex 用 \lvert c\rvert<\ell-1=\frac32 来给
\lvert c-q\rvert\le\frac32+\frac14=\frac74<2。这个 "<2" 是关键：它保证 c-q\in(-2,2)，
从而 \{q+1,q-1\} 中至少一个落在 (c-2,c+2) 的可用范围里；更精确的论证是 tex 的分岔：
q\le c 时 q+1\le c+1 且 q+1\ge-c... 我用 tex 的原话："If $q\le c$, then $q+1$ lies in $[c-1,c+1]$"
（因 q\le c 给 q+1\le c+1，而 \lvert q\rvert\le\delta 与 \lvert c\rvert<\frac32 给
q+1\ge-\frac14+1=\frac34> -1... 实际所需是 q+1\ge c-1 即 q-c\ge-2，由 \lvert q\rvert,\lvert c\rvert<\frac32+\frac14<2 保证）。
\kappa 与 \ell 的关系由 M>1 定死：\frac\ell2(1-2\ell\kappa)>1 即 \ell-2\ell^2\kappa>2，
代入 \ell=\frac52 给 \frac52-\frac{25}{2}\kappa>2 即 \kappa<\frac1{12.5}=0.08，
而 \kappa=\frac1{100}=0.01 满足且有 6 倍余量；\ell=2 时该不等式成为 2-8\kappa>2，无解，
所以 \ell 严格大于 2 且 \kappa 严格小，这是两个常数被钉住的机械原因。
\delta 与 \ell 的余量式：\ell-1+\delta<2 即 \delta<3-\ell，\ell=\frac52 时 \delta<\frac12，取 \frac14 有 2 倍余量。
而 \delta 又同时是 slab 宽度（assembly.tex:182）与 prop:adaptive 的平移幅度上界（assembly.tex:40），
所以这三个常数 \kappa、\delta、\ell 是一组彼此约束的可行域，我猜作者在选它们时想的是
"每个都留 2 倍以上余量、写成 10 的幂与 2 的倍数最好看"，于是 \{1/100,1/4,5/2\}。

(d) [推测] 候选失败路线。
[推测] 一：不抬升，直接在 K 上做水平 Steiner 重排取中线截面。断在截面是 m 维集合而"重排保能量"
需要沿被重排方向的纤维操作，水平重排对水平能量没有控制；而竖直方向不重排就不能把
"能量在哪些高度"这件事压缩成可测度的 \rho。tex 用 (m+1) 维抬升、只重排 s、只估 y 导数（signing.tex:220），
是这套技巧里唯一能同时保住水平能量与几何对称的安排。
[推测] 二：把 b>1 的论证换成"用 K 的有界性给一个显式高度"。断在需要 D_1 非空且能量受控这两件事同时成立，
显式高度（比如取 K 沿 e 方向最长弦的中点截面）不能保证最长弦 >2，
而 M>1 的论证恰好把"最长弦 >2"与"能量小"通过 \rho 连起来，这是全局论证不可替换的部分。
[推测] 三：假设 \Psi^* 的光滑性直接用 Coarea 公式推 \int\lvert\nabla_y\Psi^*\rvert^2\le\int\lvert\nabla_y\Psi\rvert^2。
断在一般 H^1 函数与一般可测 fiber 上 P\'olya--Szeg\"o 对单方向重排并不成立（需要重排方向是被求导方向的补，
且纤维的测度对底点是连续可微），tex 用的是 Riesz 不等式 + 差分商 + 弱极限这条初等路线（signing.tex:239-248），
恰好绕开了光滑性；若我当年硬套 P\'olya--Szeg\"o，会在纤维长度函数 L 不可微处失去论证。

### 7.4 prop:adaptive：反向造体、正向选号

(a) tex 逐字（signing.tex:313-331）：

> Construct domains backwards by $K_s=K,\ K_{i-1}=T_{e_{j_i}}(K_i)$. Lemma shift-section preserves all domain and spectral hypotheses. Each $K_i$ therefore contains zero, and we may start with $x^{(0)}=0\in K_0$. Suppose $x^{(i-1)}\in K_{i-1}$, and set $q=q_i(x^{(i-1)}_{j_1},\ldots)$. Since $q\in[-\delta,\delta]$, the lemma supplies $\varepsilon_i\in\{-1,1\}$ with $x^{(i)}=x^{(i-1)}+(q+\varepsilon_i)e_{j_i}\in K_i$.

(b) 补中间步骤。反向 s 步，每步 T_e 把"允许带 \delta 平移取符号"的性质从 K_i 推到 K_{i-1}；
lem:shift-section 保留非空、有界、开、凸、中心对称、零在内部（因为 D_1\subset P 且 0 是
L 的最大点附近，L(0)=\lvert I_0\rvert 由 K 对称且 0 内点给出正长度，所以 0\in D_s 对小的 s；
更直接：signing.tex:319-320 声明"Each $K_i$ therefore contains zero"，这是 0\in D_1 的记录）
以及全部 \lambda_Q\le\kappa^2\tr Q。正向归纳只需 q_i 落在 [-\delta,\delta]，而这由假设
q_i:\R^{i-1}\to[-\delta,\delta] 给出（signing.tex:40）。坐标互异性保证第 i 步之后
x_{j_1},\ldots,x_{j_{i-1}} 不再变（signing.tex:329-331），所以 q_i 在未来步骤里被固定，
这是能让 assembly.tex:204-208 的因果性成立的条件。i=1 时 q_1 的定义域是单点（assembly.tex:49 特意说明）。

(c) 机械理由。为什么必须反向：T_e(K) 的含义是"从这里出发、无论之后遇到什么平移，都还能一步进 K"，
它是 K 关于方向 e 的预像型操作，所以步序与造体序相反。这也是为什么这是存在性论证，并非算法：
K_0,\ldots,K_{s-1} 是 s 次重排 + s 次截面选取的复合，而每一步的截面由该体的能量最小化子（7.1 的 f）
的非显式选择决定；assembly.tex:47-49 与 introduction.tex:49-51 都强调了这点（"Its successive choice of
signs does not supply an online rule or an efficient algorithm"）。
贪心与相关性的兼容性，在这一节的答案是：符号的可行性来自体的不变性，
每步的两个候选 q+1、q-1 中至少一个可行，而哪一个可行取决于 y 的具体位置，选择是逐点的、
不需要任何全局下降条件。反过来，"所有前缀"的整体约束已经被编码进 K（也就是 assembly.tex:181 的 K）
的一次性成员关系里，所以相关性完全在能量层面，贪心只在最后 s 步的局部，两者分层共存。

(d) [推测] 候选失败路线。
[推测] 一：正向造体（先选号再看体是否闭合）。断在正向时 T_e 是"可走一步"的像，并非原像，
走完 x^{(i)} 后无法保证剩余步仍可执行；反向归纳的可用性正是 K_{i-1} 的定义所保证的。
[推测] 二：把 s 次反向复合统一成一次多维重排（对 e_{j_1},\ldots,e_{j_s} 同时 Steiner 重排）。
断在多次重排一般不可交换，且每次 T_e 要重新验证 \lambda_Q 假设与"零在内部"；
tex 用逐坐标的 s 次复合（signing.tex:314-317），而每一次都调用 lem:shift-section 的完整保持性。
[推测] 三：允许 q_i 依赖未来坐标以图更强的 predictor。断在 signing.tex:322 的 q 计算：
若 q_i 依赖 x^{(i-1)} 里还没有的坐标，q_i 无法定义，且 assembly.tex:215-217 的
"m_ix^{(i-1)}=m_ix" 撤销 clip 的论证依赖支撑性（assembly.tex:144-146），未来依赖会让该等式失效。

## 8 逐引理反推（四）：matrix.tex 的矩阵变差估计

这是全篇技术上最厚的一片（21425 字节，matrix.tex:1-603）。它要解决的唯一问题是：当 n 任意大时，
过滤约束的谱局部化算子 F_t^\theta 沿 t 的总变差被一个与 n 无关的量控住。tex 在 matrix.tex:4-10 自陈路线：
先用总能量，并非步数来量变差，再用谱局部分离"索引变化"与"OU 时间变化"两种变差。

### 8.1 trace 预算与尺度大小

(a) tex 逐字（matrix.tex:22-43 与 97-118）：

> $R_tR_t^\top=I_d,\qquad L_t:=R_tQR_t^\top=C_tL_{t-1}C_t^\top+Q_{d+t,d+t}b_tb_t^\top$. In particular $L_t$ is positive definite. Every $C_t$ is a contraction, since $C_tC_t^\top\preceq I_d$.
> Let $\ell_t$ be the trace lost in the contraction, and let $g_t$ be the trace added afterward. Both are nonnegative. Since $\lVert b_t\rVert\le1$, $\sum g_t\le\sum Q_{d+t,d+t}$, $\sum\ell_t=\operatorname{tr} L_0+\sum g_t-\operatorname{tr} L_n\le\operatorname{tr} Q$.
> $\sum_{\theta\in2^{\mathbb Z}}k_t(\theta)\le Cd$.

(b) 补中间步骤。coisometry 归纳：R_t=C_tR_{t-1}+b_te_{d+t}^{\top}，故
R_tR_t^T=C_tR_{t-1}R_{t-1}^TC_t^T+b_tb_t^T=C_t^2+b_tb_t^T=I_d，用到归纳假设与 assembly.tex:133 的能量守恒。
交叉项为 0 的理由在 matrix.tex:19-21：R_{t-1} 只依赖前 d 与 d+1,\ldots,d+t-1 坐标，新坐标 d+t 与之支撑不重叠。
L_t 的递推同理（Q 对角，只有第 d+t 项 contribute）。正定性由 C_t 可逆 + 加正半定项归纳保持。
\ell_t=\tr L_{t-1}-\tr(C_tL_{t-1}C_t^T)\ge0（收缩不增 trace）；
g_t=Q_{d+t,d+t}\tr(b_tb_t^T)=Q_{d+t,d+t}\lVert b_t\rVert^2\le Q_{d+t,d+t}。
望远镜：\tr L_n=\tr L_0-\sum\ell_t+\sum g_t，移项并用 \tr L_0\le\tr Q 得 \sum\ell_t\le\tr Q。
尺度大小：k_t(\theta)=\tr\phi(L_t/\theta)，\phi(x)=\min\{x^{1/2},x^{-1}\}，交点在 x=1。
固定特征值 \lambda，对 \theta=2^j 求和：\lambda/\theta 大时用 x^{-1}（比值 2^{-1} 衰减），
小时用 x^{1/2}（比值 2^{-1/2} 衰减），两支几何级数各自求和给绝对常数 C，d 个特征值给 Cd。
支撑带 x\in[\frac12,4]（f_0 的支撑是 (\frac12,4)）上 \phi(x)\ge\min\{(\frac12)^{1/2},4^{-1}\}=\frac14，
故 f_0(x)^2\le4\phi(x)（逐段核对：x\in(\frac12,1) 时 f_0^2=(2x-1)^2<1\le4x^{1/2}；
x\in[1,2] 时 f_0=1\le4x^{-1}\le4 需 x\le4 成立；x\in(2,4) 时 f_0^2=(2-x/2)^2\le1\le4/x 即 x\le4）。
类似地 x f_0(x)^2\le16\phi(x)：x\in(2,4) 时左 \le4\cdot1、右 \ge16\cdot\frac14=4，边界吻合，
这就是 matrix.tex:109 那个 16 的出处。F_t\ne0 意味着某 x\in(\frac12,4)，\phi(x)\ge\frac14，即 matrix.tex:111。
特征值夹逼：q_{\min}I\preceq Q\preceq q_{\max}I 与 R_tR_t^T=I 给 q_{\min}I\preceq L_t\preceq q_{\max}I
（matrix.tex:115-116 说"Every eigenvalue of $L_t$ lies between the smallest and largest diagonal entries of $Q$"），
故活跃尺度有限且 \theta\le2q_{\max}=2\lVert Q\rVert_{op}（matrix.tex:118）。

(c) 机械理由。为什么能量预算要拆成"trace 损失 \ell_t"与"trace 增益 g_t"两个非负量：
后面 matrix.tex:147-151 的 \sum_\theta\theta E_\theta(0,n)\le C(\sum\ell_i+\sum g_i)\le C\tr Q
完全靠这两个预算，而它们各自与 n 无关。这是"与序列长度无关"的第一个技术支点
（第二个支点是 survival.tex 里的分箱依据用累积能量 h_t ，并非索引 t）。
coisometry ，并非等距的作用：R_t 是 d\times m、m>d，它是满射的部分等距。matrix.tex:85-89 说
"$R_t^\top$ is an isometry, so the lift preserves the localized state norm:
$\lVert F_t^\theta x\rVert=\lVert f_0(X_t)R_tx\rVert$"，这只在 R_tR_t^T=I 时成立；
它让所有谱计算可以在 \R^d 里做、把结果提升到 \R^m 时不损失范数。
matrix.tex:90-92 补的正交不变性（把 R_t 换成 OR_t 时 X_t\mapsto OX_tO^T 而 F_t^\theta 不变）
的意义是：我可以任意旋转状态坐标系来对角化 L_t，而 \mathcal D 的定义（只依赖 \lVert R_tx\rVert）不变。
\theta\le2\lVert Q\rVert_{op} 的消费处在 survival.tex:247-249 与 304：覆盖数 1+T\theta 对活跃尺度才有意义，
且 \sum_{\theta\in\Theta}\theta\le4q_{\max}。
a=\frac32 的机械作用集中在三处：\log w(e^u)=\min\{au,-u\} 的 a-Lipschitz（matrix.tex:199-200）、
b=\frac a2=\frac34\in(0,1) 使 B(0+)=1/b-1>0 与 B(r)/r\to1 两侧都正（matrix.tex:225-228）、
以及 u^a 在 0 处 C^1 需要 a>1（matrix.tex:490-491）。

(d) [推测] 候选失败路线。
[推测] 一：不设 \sum_\theta k_t\le Cd 而用 \theta 的连续积分（把二分尺度换成对 d\theta/\theta 的积分）。
断在 \int_0^\infty\phi(\lambda/\theta)\frac{d\theta}\theta 发散（两侧都按幂律衰减但积分对数发散），
正是二分尺度的几何求和给出有限的 C；这就是"尺度序列必须是二分"的硬理由，也解释了
为什么 \sqrt d 里不会混进 \log d。
[推测] 二：用 \sum_\theta k_t\le Cd 的粗版本（比如按 d 个特征值各计一次而不做几何衰减检查）。
断在 survival.tex:266-278 的谱重构：那里要用 \sum_\theta f_0(\lambda_i/\theta)^2\ge1，
与 matrix.tex:104 的"on the support band of $f_0$, one has $\phi\ge1/4$"配套；
若只保证求和有界而不保证 \phi 与 f_0 的支撑带对齐，两个不等式无法同时成立（f_0 需要 \phi 在
支撑带内不小于绝对常数，才能让 \tr f_0^2\le4k_t 有意义地反向使用）。
[推测] 三：试图把 \tr Q 换成 \lVert Q\rVert_{op}（更小的量）。断在 matrix.tex:147 的推导
用 \sum\ell_i+\sum g_i\le\tr Q，而 \tr Q 可以远大于 \lVert Q\rVert_{op}（差 d 倍）。
若目标能量界是 \lambda_Q\le H_0\lVert Q\rVert_{op}，那 assembly.tex:36 的假设
\lambda_Q(K)\le\kappa^2\tr Q 就变成不同量纲的假设，signing.tex:87-88 的分离论证（用
Q_\epsilon=\diag(w_i+\epsilon)，右端 \kappa^2\sum(w_i+\epsilon)）会失去匹配，
因为那里必须用 \tr 才能与 \sum w_iE_i(f) 对齐。

### 8.2 lem:scalar-comparison：标量比较不等式

(a) tex 逐字（matrix.tex:186-196 与 220-235）：

> $\mathcal J(x,y)=p(x)-p(y)+\left(\frac yx-1\right)\frac{w(x)+w(y)}2$.
> $\mathcal J(x,y)\ge c(1+y)\lvert f_0(x)-f_0(y)\rvert^2$, $\frac yx\mathcal J(y,x)\ge c(1+y)\lvert f_0(x)-f_0(y)\rvert^2$.
> $\mathcal J(x,y)\ge\frac{w(x)+w(y)}2B(r),\qquad B(r)=r-1-\frac{r^{a/2}-1}{a/2}$.

(b) 补中间步骤。r=y/x。u\mapsto\log w(e^u)=\min\{au,-u\} 斜率为 a 或 -1，故 a-Lipschitz，
即 \lvert\log w(x)-\log w(y)\rvert\le a\lvert\log x-\log y\rvert。y\le u\le x（r<1）时下界
w(u)\ge w(x)(u/x)^a 与 w(u)\ge w(y)(y/u)^a 同时成立，取 max；两支在 [y,x] 内相交（由 Lipschitz 界保证
交点存在且唯一），积分 \int_y^x\max\{\cdot\}\frac{du}u 时，在交点两侧各用一个表达式，
交点处两支相等且各自的积分原函数是 \frac{w(\cdot)}{a}(\cdot)^{a} 型，
合并得 p(x)-p(y)\ge\frac{w(x)+w(y)-2\sqrt{w(x)w(y)}r^{a/2}}a。
r>1 时对上界做同样的事给 p(y)-p(x)\le\frac{2\sqrt{w(x)w(y)}r^{a/2}-w(x)-w(y)}a。
用 2\sqrt{w(x)w(y)}\le w(x)+w(y)（AM--GM 反向，即几何均值 \le 算术均值）统一两支：
\mathcal J(x,y)=p(x)-p(y)+(r-1)\frac{w(x)+w(y)}2
\ge\frac{w(x)+w(y)}a\left[\left(1-2^{... }\right)\right] 整理成 tex 的形式
\frac{w(x)+w(y)}2\left[r-1-\frac{r^{a/2}-1}{a/2}\right]，即 \frac{w(x)+w(y)}2B(r)。
b=\frac a2=\frac34：B(1)=0；B'(r)=1-r^{b-1}，B'(1)=0；B''(r)=(1-b)r^{b-2}>0（因 b<1），
所以 B 严格凸、在 r=1 处取全局最小 0。B(0+)=0-1-\frac{0-1}{b}=\frac1b-1=\frac13>0；
B(r)/r=1-\frac1r-\frac{r^{b}-r}{br}\to1（因 b<1 使 r^b/r=r^{b-1}\to0，1/r\to0）。
由此存在绝对 c>0 使 B(r)\ge c\max 型三行分段（matrix.tex:230-235）：
r\le\frac12：B 在 (0,\frac12] 上递减（B'<0 因 r^{b-1}>1）且 B(\frac12)>0，故 B\ge B(\frac12)\ge c；
\frac12\le r\le2：B(1)=B'(1)=0 与 B''\ge\min_{[\frac12,2]}(1-b)r^{b-2}=:m>0 给 B(r)\ge\frac m2(r-1)^2；
r\ge2：B(r)/r 在 [2,\infty) 上下界 attained（趋于 1 且连续正）给 B(r)\ge cr。
rB(1/r) 满足同样三行：rB(1/r)=1-r-\frac{r^{1-b}-r}b，二阶导符号与边界行为对称（改 c）。
把 \mathcal J(y,x) 乘 \frac yx=r 后套 rB(1/r) 型表达式，就同时得到两式。
最后与 \lvert f_0(x)-f_0(y)\rvert^2 挂钩做三情形（matrix.tex:242-251）：
若 f_0(x)\ne f_0(y) 则至少一个自变量在 [\frac12,4]（那里 w\ge\min\{(\frac12)^{3/2},4^{-1}\}=\frac14，
所以"某个 w 值被下界控制"），另一个自变量按 r 的范围分：
\frac12\le r\le2：两自变量都在 [\frac14,8]，w 有正下界、1+y\le9，用 |f_0(x)-f_0(y)|\le2\lvert x-y\rvert=2x\lvert r-1\rvert
与 1+y\asymp x 得 (1+y)(f_0 差)^2\le C x^2\cdot4x^2(r-1)^2... 正确配法是
(1+y)|f_0(x)-f_0(y)|^2\le C'(1+x)x^2(r-1)^2 与 B(r)\ge c(r-1)^2、w(x)+w(y)\ge c''\min 同阶；
由于 w 与 (1+x)x^2 在各段的比值有界（区间紧），常数可绝对。
r\le\frac12：一个 w 有下界、y\le4 故 (1+y) 有界，而 |f_0 差|\le1，右端有界、左端 \ge c\cdot B(r)\cdot(\text{下界})
\ge c\cdot c，闭合。r\ge2：一个 w 有下界，且 y\le4（则 (1+y) 有界，用 |f_0差|\le1）
或 y=rx\le4r（则 (1+y)\le Cr，与 B(r)\ge cr 匹配）。

(c) 机械理由。\mathcal J 的形态是"p 的一阶差 + (r-1) 乘平均斜率"，它是带修正的 Taylor 剩余。
这个修正项不是审美的：在 8.3 里 \tr(p(Y)-p(Z)) 会被双随机权重展开成
\sum_{ij}n_{ij}\mathcal J(y_j,z_i)，而 F 的距离展开成 \sum m_{ij}(1+y_j)(f_0(z_i)-f_0(y_j))^2；
两者之间要逐点比较，权重关系是 n_{ij}=m_{ij}y_j/z_i，即 m_{ij}=\frac{z_i}{y_j}n_{ij}。
于是需要的是 \mathcal J(y,x)\ge c(1+y)(f_0 差)^2 与 \frac yx\mathcal J(y,x) 型两个版本，
第二个版本正好吸收 \frac{z_i}{y_j} 这个权重比。这就是 tex 为什么成对陈述这两个不等式
（matrix.tex:191-193 两行并列），并非只写一行。
"为什么是 (1+y) ，并非 (1+x)"：右权重是 (I+Q/\theta)，在 F_s 那一侧对角化时给出的是
Y 的本征值，所以自然出现 (1+y_j)；而 (I+Z) 那一侧（8.3 的增益段）给出 (1+z_j)。
tex 第二式写成 \frac yx\mathcal J(y,x)\ge c(1+y)(\cdots) 正是为两段各自匹配 y 的角色。

(d) [推测] 候选失败路线。
[推测] 一：用 p 的二阶 Taylor（\frac12p''(x)(x-y)^2）做剩余下界。断在 p 在 x=1 处二阶导变号
（p'=w/x，w 在 1 处从 x^a 切到 x^{-1}，p'' 在 1 附近从 (a-1)x^{a-2} 正跳到 -x^{-2} 负），
凸性失效，剩余可负；tex 用 Lipschitz of \log w 是全局两侧统一的工具，避开了符号变化。
[推测] 二：把 w 的两支取成对称指数（比如 w=\min\{x^{a},x^{-a}\}，a>1）。
则 \phi(x)=\min\{x^{a-1},x^{-a}\}，\sum_\theta\phi 仍可和，但 B(r)=r-1-\frac{r^{a/2}-1}{a/2} 在 r\to0 时
趋于 \frac2a-1，需要 a<2 才为正；若 a\ge2 则 B(0+)\le0，"r\le\frac12 时 B\ge c"这一行失效，
\mathcal J 无法控制远距离的 f_0 差。a=\frac32 同时满足 a>1（C^1 于 0）与 2/a>1（B(0+)>0），
这是它被选中的另一个理由。
[推测] 三：不设 f_0 的分段线性而设任意 C^1 局部化函数，指望同一个 \mathcal J 界。
断在"至少一个自变量在支撑带内"这个用法（matrix.tex:242-243）：它需要 f_0 在带外恒为 0，
光滑衰减函数没有紧支撑，情形分析里 y 可以任意大而 f_0(y) 非零，(1+y) 与 w(y) 的比值失去控制。

### 8.3 lem:endpoint-comparison：端点比较与双随机权重

(a) tex 逐字（matrix.tex:268-279、326-343、386-392）：

> $\bigl\lVert(F_t-F_s)(I_m+Q/\theta)^{1/2}\bigr\rVert_{\mathrm{HS}}^2\le C\{\operatorname{tr}(p(Y)-p(Z))+\operatorname{tr}(p(X)-p(Z))\}$
> $\bigl\lVert(\widetilde F-F_s)(I_m+Q_{\rm old})^{1/2}\bigr\rVert_{\mathrm{HS}}^2=\sum_{ij}m_{ij}(1+y_j)(f_0(z_i)-f_0(y_j))^2+\sum_id_if_0(z_i)^2+\sum_jh_j(1+y_j)f_0(y_j)^2$
> $\operatorname{tr}\bigl(p(Y)-p(Z)\bigr)=\sum_{ij}n_{ij}\mathcal J(y_j,z_i)+\frac12\sum_id_iw(z_i)+\frac12\sum_jh_jw(y_j)$
> $\bigl\lVert(F_t-F_s)Q_{\rm new}^{1/2}\bigr\rVert_{\mathrm{HS}}^2=\operatorname{tr}\bigl(f_0(X)^2V\bigr)=\sum_ix_id_i'f_0(x_i)^2$

(b) 补中间步骤。记号 Y=X_s、X=X_t、\mathcal C=C_t\cdots C_{s+1}、Z=\mathcal CY\mathcal C^T、V=X-Z。
P_s 投影到"初始块 + 前 s 个新坐标"；Q_{old}=P_s(Q/\theta)P_s、Q_{new}=Q/\theta-Q_{old}（对角使二者非负、
支撑不相交）。支撑恒等式（matrix.tex:290-298）逐条：
R_tR_s^T=\mathcal C（R_t 中来自前 s+d 坐标的部分恰是 \mathcal CR_s）；
R_tQ_{old}R_s^T=\mathcal C R_s(Q/\theta)R_s^T=\mathcal C Y；
R_tQ_{old}R_t^T=\mathcal CY\mathcal C^T=Z；R_tQ_{new}R_t^T=\sum_{s<i\le t}(\cdots)=X-Z=V；
F_sQ_{new}=0（F_s 的行支撑在 P_s 内）。
旧状态段：Z 与 Y 的特征基，m_{ij}=(\lvert\langle u_i,v_j\rangle\rvert^2) 是 \mathcal C 在这两组基下元素的平方。
\sum\le1 来自 \mathcal C\mathcal C^T\preceq I（收缩乘积）与 \mathcal C^T\mathcal C\preceq I。
d_i=1-\sum_jm_{ij}、h_j=1-\sum_im_{ij}。n_{ij}=m_{ij}y_j/z_i 的行和
\sum_jn_{ij}=\frac1{z_i}\sum_jm_{ij}y_j=\frac1{z_i}(\mathcal CY\mathcal C^T)_{ii}=1；
列和 \sum_in_{ij}=y_j(\mathcal C^TZ^{-1}\mathcal C)_{jj}=y_jy_j^{-1}=1，用 \mathcal C^TZ^{-1}\mathcal C=Y^{-1}
（Z=\mathcal CY\mathcal C^T 两边取逆得 Z^{-1}=\mathcal C^{-T}Y^{-1}\mathcal C^{-1}，左右乘 \mathcal C^T,\mathcal C）。
这一步用到 \mathcal C 可逆，正是 assembly.tex:63 与 matrix.tex:265-266 强调 invertible 的地方。
HS 展开：\lVert\widetilde F-F_s\rVert^2_{HS,w}=\tr(\widetilde F(I+Q_{old})\widetilde F^T)
-2\tr(\widetilde F(I+Q_{old})F_s^T)+\tr(F_s(I+Q_{old})F_s^T)。
第一项用 R_tR_t^T=I 得 \tr f_0(Z)(I+Z)f_0(Z)=\tr(f_0(Z)^2(I+Z))；
第三项用 R_s 得 \tr(f_0(Y)^2(I+Y))；交叉项 =\tr f_0(Z)\mathcal C(I+Y)f_0(Y)。
把前两项用 \sum_jm_{ij}=1-d_i 与 \sum_im_{ij}=1-h_i 改写为 \sum_{ij}m_{ij}(1+y_j)f_0(z_i)^2+\sum_id_if_0(z_i)^2
与 \sum_{ij}m_{ij}(1+y_j)f_0(y_j)^2+\sum_jh_j(1+y_j)f_0(y_j)^2，交叉项是
\sum_{ij}m_{ij}(1+y_j)f_0(z_i)f_0(y_j)，三式合并即 matrix.tex:326-333 的等式（是等号，不是不等号）。
\tr p 差的展开：\tr p(Y)-\tr p(Z)=\sum_jp(y_j)-\sum_iz_i 的 m 加权版本；
用 \sum_jm_{ij}=1-d_i 把 \sum_ip(z_i) 写成 \sum_{ij}m_{ij}p(z_i)+\sum_id_ip(z_i)，
类似处理 p(y_j)，得 \sum_{ij}m_{ij}(p(y_j)-p(z_i))+\sum_jh_jp(y_j)-\sum_id_ip(z_i)。
再把 m_{ij}=\frac{z_i}{y_j}n_{ij}=\frac{z_i}{y_j}n_{ij} 换成 n 权重并加入 \mathcal J 的定义项
-(\frac{z_i}{y_j}-1)\frac{w(y_j)+w(z_i)}2，剩余的 \sum d_i、\sum h_j 项正好合并成
\frac12\sum d_iw(z_i)+\frac12\sum h_jw(y_j)（这是 tex 直接陈述的结果，我把它读成"亏格按 w 记账"）。
然后用 lem:scalar-comparison 的第二式（带 \frac yx 前缀的那个，配 n_{ij}=\frac{y_j}{z_i}m_{ij} 的比例方向）
控制双和，亏格项用 f_0(u)^2\le Cw(u) 与 (1+u)f_0(u)^2\le Cw(u) 归入同一记账。
增益段：X 与 Z 的特征基（同维空间、同正定，故 m 是正交矩阵元素平方，行列和恰为 1，无亏格）。
n_{ij}=m_{ij}z_j/x_i 的行和 \le1 由 Z\preceq X；列和 \le1 由 X^{-1}\preceq Z^{-1}，
tex 给了逐向量证明：\sum_in_{ij}=z_jv_j^TX^{-1}v_j\le z_jv_j^TZ^{-1}v_j=1（v_j 是 Z 的单位特征向量，
Zv_j=z_jv_j 故 v_j^TZ^{-1}v_j=\frac1{z_j}）。d_i',h_j' 为相应亏格。
\tr(f_0(X)^2V)=\sum_i x_id_i'f_0(x_i)^2 来自 \tr(f_0(X)^2(X-Z)) 在 X 基下的对角元
（x_i d_i' 是 X-Z 的第 i 对角元），用 uf_0(u)^2\le Cw(u) 归入 \sum d_i'w(x_i)。
新坐标权重段：\lVert(F_t-F_s)Q_{new}^{1/2}\rVert^2 因 F_sQ_{new}=0 成为 \lVert F_tQ_{new}^{1/2}\rVert^2
=\tr(R_t^Tf_0(X)^2R_tQ_{new})=\tr(f_0(X)^2R_tQ_{new}R_t^T)=\tr(f_0(X)^2V)。
最后平方三角不等式（matrix.tex:396-398）把 (F_t-\widetilde F)+(\widetilde F-F_s) 在旧权重下合并，
再加新坐标段。

(c) 机械理由。为什么中间矩阵 \widetilde F=R_t^Tf_0(Z)R_t 必须存在：它是"先把 Y 收缩到 Z、再局部化"的对象，
使左半边只涉及一个正定矩阵族（Y 与 Z，通过 \mathcal C 相连），右半边只涉及 Z 与 X
（通过同一空间里的正交基相连，纯增益、无收缩）。若直接 F_t 对 F_s，收缩与增益混在一起，
非交换性让 trace 展开无法逐项对齐 \mathcal J。这就是 matrix.tex:172-177 说的三步策略里
"Exact matrix expansions then compare the two endpoints using the old part of the state and the
accumulated new gains"。
(I_m+Q/\theta)^{1/2} 的构成来源：survival.tex 需要控两种增量，U(\tau) 本身（协方差 I，见 survival.tex:120-122）
与 U(\tau)-U(\sigma)（协方差 \preceq2\lvert\tau-\sigma\rvert Q，乘上 \theta 归一化后是 Q/\theta 型，
survival.tex:131-141）。一个权重同时覆盖两种，代价是展开里出现 (1+y_j)，
而 \mathcal J 的下界恰好带 (1+y)，两者是配套的。
\theta 出现在分母的机械理由：X_t=L_t/\theta，所以 Q/\theta 是与 X 同量纲的对象；
若权重写成 (I+Q) 则 matrix.tex:293 的 \mathcal C Y 变成 \mathcal C(R_sQR_s^T)=\mathcal C\theta Y，
每个尺度多一个 \theta 因子，\sum_\theta 的几何可和性被破坏。

(d) [推测] 候选失败路线。
[推测] 一：跳过 \widetilde F，直接对 F_t-F_s 用三角不等式拆成"索引部分 + 时间部分"。
断在索引部分仍然同时含收缩与增益；tex 的拆法是把索引段再拆成"纯收缩 (\mathcal C)"与"纯增益 (V)"
两段，各自用不同特征基和不同亏格记账。
[推测] 二：只用 p 不用 p_1，指望 \tr(p(X)-p(Z)) 由收缩型亏格项吸收。断在 matrix.tex:402-406
这段作者自陈："Its remaining difficulty is that $p(X)-p(Z)$ describes a single accumulated gain,
whereas the energy records gains separated by contractions."，这正是 8.4 存在的原因；
没有 p_1，能量 E 里就没有可以支付"连续多次增益"的科目。
[推测] 三：把 m_{ij} 的双随机化 n_{ij} 省掉，直接用 m_{ij} 配 \mathcal J。断在
\mathcal J 的两式各带一个 \frac yx 型前缀，用 m 权重时其中一式需要 \frac{z_i}{y_j}\le C 的先验界，
而 y_j 可以远小于 z_i（强收缩方向），没有 n 的归一化就拿不到双随机性、也就拿不到
\sum_jm_{ij}y_j=z_i 这个重心恒等式。
[推测] 四：假设 \mathcal C 与 Y 可交换（把 \mathcal C 同时对角化）。断在 matrix.tex:264 那句
"each transported through the contractions that follow it" 允许的是任意非交换；
一旦可交换，Z 与 Y 同基、m 是对角置换，看起来简化，但真实的 C_i=I-\eta_bb^T 序列一般不可交换，
引理必须对一般情形成立，否则 assembly 的应用（b_i 任意次序）不成立。

### 8.4 lem:direct-gain：穿过非交换收缩的增益控制

(a) tex 逐字（matrix.tex:410-424、456-457、500-502、536-540）：

> For the matrices $X,Y,Z,V$ above, suppose $E=E_\theta(s,t)\le e_0$, where $c_a=a2^a,\ e_0=\frac1{16c_a},\ a=\frac32$. If $q=(c_aE)^{1/a}$, then $q<1/4$ and $V\preceq q(I_d+X),\quad\operatorname{tr}(p(X)-p(Z))\le Cq\operatorname{tr}\phi(X)$.
> Start with $(Z_*,V_*)=(Y,0)$. At each contraction, replace both matrices by their congruences under $C_i$. At each gain, add the positive semidefinite gain to $V_*$ only, interpolating linearly during this addition. At every stage $D=Z_*+V_*$ is the matrix in the original contraction-and-gain path; at the endpoint $(Z_*,V_*)=(Z,V)$.
> $\dot G\le c_a\operatorname{tr}\bigl(p_1'(D)\dot V_*\bigr)=c_a\frac{d}{d\xi}\operatorname{tr} p_1(D),\qquad G\le1$.
> This argument uses eigenvalue comparison, not operator monotonicity of the power $a$.

(b) 补中间步骤。S=I+Z_*、A=S^{-1/2}V_*S^{-1/2}、G=\tr A^a。
收缩段：S'=I+CZ_*C^T，T_c=(S')^{-1/2}CS^{1/2}，A'=T_cAT_c^T。
S'-CSC^T=(I+CZ_*C^T)-C(I+Z_*)C^T=I-CC^T\succeq0（收缩定义）。
于是 CSC^T\preceq S'，两边同裹 (S')^{-1/2} 得 T_cT_c^T=(S')^{-1/2}(CSC^T)(S')^{-1/2}\preceq I。
A' 的本征值：A'=T_cAT_c^T 与 T_c^TT_cA 非零谱相同（XY/YX 技巧），而
\lambda_k(T_cAT_c^T)\le\lVert T_c\rVert_{op}^2\lambda_k(A)\le\lambda_k(A)（用 A 半定与奇异值比较，
tex 的说法是"compare the singular values of $T_cA^{1/2}$ and $A^{1/2}$"）。
非负本征值逐点 \le 后取 a 次幂求和保序，故 G 不增。这里绝不能改成"由 A'\preceq A 得 (A')^a\preceq A^a"，
因为 u^{3/2} 不算子单调，这正是 matrix.tex:456-457 免责声明的所指。
增益段：S 固定、\dot V_*\succeq0。J=I+D=S+V_*、H=J^{-1/2}V_*J^{-1/2}、T=S^{-1/2}J^{1/2}。
I-H=J^{-1/2}SJ^{-1/2}\succ0。T^TT=J^{1/2}S^{-1}J^{1/2}；由 S=J^{1/2}(I-H)J^{1/2} 取逆得
S^{-1}=J^{-1/2}(I-H)^{-1}J^{-1/2}，故 T^TT=(I-H)^{-1}。
极分解 T=U(I-H)^{-1/2}（U 正交，因 T 可逆且 T^TT=(I-H)^{-1}）。
A=THT^T=S^{-1/2}V_*S^{-1/2} 的谱：A 与 (T^TT)H=(I-H)^{-1}H 非零谱相同，
故 A 的本征值是 h/(1-h)，h 跑遍 H 的本征值（matrix.tex:472-478）。
\dot G：\dot A=S^{-1/2}\dot V_*S^{-1/2}（S 固定），g(u)=u^a，
\frac d{d\xi}\tr g(A)=\tr(g'(A)\dot A)=a\tr(A^{a-1}S^{-1/2}\dot V_*S^{-1/2})
=a\tr(S^{-1/2}A^{a-1}S^{-1/2}\dot V_*)，即 matrix.tex:485-488。
u^a 在 0 处 C^1（a>1）保证 A 奇异时公式仍成立（matrix.tex:490-491）。
共轭恒等式：J^{1/2}S^{-1/2}=T^T? 核对：J^{1/2}S^{-1/2}A^{a-1}S^{-1/2}J^{1/2}。
由 T=S^{-1/2}J^{1/2} 得 T^T=J^{1/2}S^{-1/2}（S、J 对称），故该式 =T^TA^{a-1}T。
再用 A=U[H(I-H)^{-1}]U^T 与 T=U(I-H)^{-1/2}（于是 T^T=(I-H)^{-1/2}U^T）：
T^TA^{a-1}T=(I-H)^{-1/2}U^T\cdot U[H(I-H)^{-1}]^{a-1}U^T\cdot U(I-H)^{-1/2}
=(I-H)^{-1/2}[H(I-H)^{-1}]^{a-1}(I-H)^{-1/2}。右侧方括号内的两个因子都是 H 的函数、彼此可交换，
所以 [H(I-H)^{-1}]^{a-1}=H^{a-1}(I-H)^{-(a-1)}，两侧的 (I-H)^{-1/2} 合并进指数得
H^{a-1}(I-H)^{-a}，即 matrix.tex:493-497。整个过程中没有出现 Z_* 与 V_* 的交换假设，
这就是 matrix.tex:500-502 那句"no commutation of $Z_*$ and $V_*$ is assumed"的确切含义。
条件化：G\le1 时 \lambda_{\max}(A)^a\le G\le1 故 \lambda_{\max}(A)\le1，
由 h/(1-h)\le1 得 h\le\frac12 即 H\preceq I/2。a-1=\frac12，谱演算给
H^{1/2}(I-H)^{-3/2}\preceq2^{3/2}H^{1/2}（在 [0,\frac12] 上 (1-h)^{-3/2}\le2^{3/2}），
即 matrix.tex:507-509 的 \preceq2^aH^{1/2}。
又 V_*\preceq D 故 H=J^{-1/2}V_*J^{-1/2}\preceq J^{-1/2}DJ^{-1/2}=D(I+D)^{-1}（作为谱的写法），
半定序在平方根下保持（matrix.tex:514）， tex 给出积分公式证明
M^{1/2}=\frac1\pi\int_0^\infty u^{-1/2}M(uI+M)^{-1}du：对本征值 m 有
\frac1\pi\int_0^\infty u^{-1/2}\frac{m}{u+m}du=\sqrt m（代 u=mt 化为 beta 积分 \frac1\pi\int_0^\infty\frac{t^{-1/2}}{1+t}dt=1）；
保序性由 M(uI+M)^{-1}=I-u(uI+M)^{-1} 与"求逆反序"得到。
于是 H^{1/2}\preceq D^{1/2}(I+D)^{-1/2}。把共轭式用 J^{-1/2} 裹回：
S^{-1/2}A^{a-1}S^{-1/2}\preceq2^aD^{1/2}(I+D)^{-3/2}=2^ap_1'(D)
（p_1'(x)=\frac{x^{a-1}}{(1+x)^a}=\frac{x^{1/2}}{(1+x)^{3/2}}，与 matrix.tex:64 一致）。
与 \dot V_*\succeq0 配对、并注意增益期间 \dot D=\dot V_*，得
\dot G\le a\cdot2^a\tr(p_1'(D)\dot V_*)=c_a\frac d{d\xi}\tr p_1(D)。
闭合：G 初值 0、收缩不增；\tr p_1(D) 在所有增益段的总增量 \le E（E 的定义含 p_1 的双份 trace 差，
matrix.tex:123-128）。若 G 首次到达 1 发生在某增益中，积到该时刻给 1\le G\le c_aE\le c_ae_0=\frac1{16}，矛盾。
故全程 G\le c_aE\le\frac1{16}<1，差分不等式一路适用。终点：
\lambda_{\max}(A)^a\le\tr A^a\le q^a（q=(c_aE)^{1/a}），故 A\preceq qI，
V=S^{1/2}AS^{1/2}\preceq qS=q(I+Z)\preceq q(I+X)（Z\preceq X）。
q\le16^{-2/3}=2^{-8/3}<\frac14（2^{8/3}=4\cdot2^{2/3}>4，故 16^{-2/3}<\frac14）。
第二结论：由 V\preceq q(I+X) 的 Weyl 逐位比较给 x_j\ge z_j\ge(1-q)x_j-q（matrix.tex:558-561）。
分两种配对（matrix.tex:562-575）：若 x\le4q\le1，p(x)-p(z)\le p(x)=\frac{x^a}a\le\frac4aqx^{a-1}=\frac4aq\phi(x)
（x\le1 时 p(x)=\int_0^x u^{a-1}du=\frac{x^a}a；x\le4q 给 x^a\le4qx^{a-1}）；
若 x>4q，则 z\ge(1-q)x-q>x(1-q)-\frac x4\ge\frac x2（用 q<\frac14 与 q<\frac x4）且 x-z\le q(1+x)，
在 [\frac x2,x] 上 w(u)\le2^aw(x)、u^{-1}\le\frac2x，
p(x)-p(z)=\int_z^x\frac{w(u)}udu\le\frac{2^aw(x)}{x/2}\cdot q(1+x)\le Cq(1+x^{-1})w(x)\le Cq\phi(x)
（x\le1：(1+x^{-1})x^a\le2x^{a-1}；x\ge1：(1+x^{-1})x^{-1}\le2x^{-1}；\phi=\min\{x^{a-1},x^{-1}\}）。
对本征值求和得 \tr(p(X)-p(Z))\le Cq\tr\phi(X)=Cqk_t。

(c) 机械理由。S=I+Z_* 这个"带基线的相对量"是全引理的支点：
如果取 A=V_* 本身，收缩段 A'=CV_*C^T 的本征值虽然也不增，但增益段的导数
\dot G=a\tr(V_*^{a-1}\dot V_*) 会在 V_* 小（即刚开始）时失去与 p_1'(D) 的连线，
而真正要支付的科目是 \tr p_1(D) 的增量，它含 D ，并非 V_*；两个量相差恰是基线 I+Z_* 的贡献。
反过来说，"为什么必须有 I"：D=I+Z_*+V_* 让 p_1'(D) 在 D 小（\sim0）时 behave like x^{1/2}、
D 大时 like x^{-1}，这两端都能与 H^{a-1}(I-H)^{-a} 匹配；若去掉 I，D=Z_*+V_* 可能接近 0
（当初始 Y 很小时），p_1' 在 0 附近的行为变成奇异，微分不等式给出的常数依赖 Y，与一致性冲突。
c_a=a2^a 的两个因子：a 来自 \frac d{du}u^a，2^a 来自 H\preceq I/2 后 (I-H)^{-a}\le2^a；
e_0=\frac1{16c_a} 是"自锁定余量"：它让 c_aE\le\frac1{16}，与"假设 G 首次到达 1"矛盾，
并且 q\le16^{-2/3}<\frac14 使后续本征值比较的两个分支（x\le4q 与 x>4q）都落在预期区。
若把 e_0 改成 \frac1{c_a}（即去掉 16），则 q\le1，V\preceq q(I+X) 里 q 不再小，
x-z\le q(1+x) 与 z\ge x/2 失效，\tr(p(X)-p(Z))\le Cqk_t 不成立，
8.5 的 E^{1/a} 界与 survival 的链接全部退化为无界。
"链式格式的尺度序列"在这里的对应物是 p_1 ，并非尺度：尺度 \theta 已经固定在这一引理里，
它的作用是给 D 一个无量纲量（X_t=L_t/\theta），使得 E_\theta 的定义随 \theta 一致；
matrix.tex:152-153 那句"The factor $\theta$ cancels the factor $1/\theta$ from differentiating $p(x/\theta)$"
说的就是这个匹配，尺度序列在 \sum_\theta\theta E_\theta\le C\tr Q 处闭合。

(d) [推测] 候选失败路线。
[推测] 一：对 G 用 \lVert A\rVert_{op} ，并非 \tr A^a。断在增益段：\frac d{dt}\lVert A\rVert_{op}
在非交换情形没有闭式（需要用到 \dot A 在与最大本征值对应的特征方向上的投影，
而该方向随 \xi 变化），算子范数的导数公式只在单重本征值下成立；trace 版本
\frac d{d\xi}\tr g(A)=\tr(g'(A)\dot A) 无条件成立（多项式验证 + 一致逼近，matrix.tex:481-485），
这是 tex 选 trace 的原因，也解释了为什么整个 matrix.tex 的度量是 HS 范数，并非 op 范数。
[推测] 二：把 \widehat X_i 与 X_i 的两份 trace 差合成一份（只记收缩后或只记收缩前）。
断在这里：合成后无法把"增益的支付"与"收缩的损失"分账，\tr p_1(D) 的总增量不再 \le E，
因为 E 里少了专门对应增益的那一半；具体地，matrix.tex:131-134 说两份差都非负依赖
"h increasing + Weyl 比较（收缩使本征值下降、增益使其上升）"，只留一份时另一半的符号不保。
[推测] 三：把"首次到达 1"的停止论证换成整体 Gronwall。断在右端 \tr p_1(D) 的导数里含 D、
而 D 含 V_* 含 A 含 G，若直接用 Gronwall 就得先证明 \tr p_1'(D)\dot V_* 能被 G 的函数线性控制，
那会引入指数 e^{cE}；tex 用"若 G 到 1 则矛盾"的论证把 H\preceq I/2 变成条件性事实，
从而 (I-H)^{-a}\le2^a 有依据，这是本引理最关键的一个逻辑顺序，我一开始写反过：
先写 (I-H)^{-a} 有界再积，属于循环论证，必须在草稿里显式引入停止时刻。
[推测] 四：把 V\preceq q(I+X) 换成 \lVert V\rVert_{HS}\le Cq\sqrt d 这类弱一点的结论。
看起来够用（8.3 只要 trace 界），实际断在 matrix.tex:562-568 的分支论证需要逐对 (x,z) 的
序关系 z\ge(1-q)x-q，这是算子序给的；HS 界给不出逐特征值的下界，
于是 p(x)-p(z)\le Cq\phi(x) 无法建立。

### 8.5 lem:increment：加权增量估计与 E^{1/a} 的来源

(a) tex 逐字（matrix.tex:157-170 与 579-594）：

> There are absolute constants $e_0>0$ and $C<\infty$ ... if $E=E_\theta(s,t)\le e_0$, then $\bigl\lVert(F_t^\theta-F_s^\theta)(I_m+Q/\theta)^{1/2}\bigr\rVert_{\mathrm{HS}}^2\le C(1+k_t(\theta))E^{1/a},\qquad a=\frac32$.
> The total variation of $\operatorname{tr} p$ along the separate contraction and gain steps from $s$ to $t$ is at most $E$. Therefore $\lvert\operatorname{tr} p(Y)-\operatorname{tr} p(X)\rvert\le E$.
> $E+2\operatorname{tr}(p(X)-p(Z))\le E+CE^{1/a}k_t$. Since $0\le E\le e_0\le1$, we have $E\le E^{1/a}$.
> In particular, zero energy implies $F_t^\theta=F_s^\theta$ exactly, so repeated indices at zero distance will not increase the size of a covering in the next section.

(b) 补中间步骤。8.3 的右端两项分别处理。第一项 \tr(p(Y)-p(Z))：
用 \lvert\tr p(Y)-\tr p(X)\rvert\le E（总变差）与第二项的界合并；tex 的写法是
E+2\tr(p(X)-p(Z))，即把 \tr(p(Y)-p(Z))\le\lvert\tr p(Y)-\tr p(X)\rvert+\tr(p(X)-p(Z))\le E+\tr(p(X)-p(Z))
代入，得到 E+2\tr(p(X)-p(Z))。第二项由 8.4 给 \le Cqk_t=C(c_aE)^{1/a}k_t。
E\le e_0\le1 且 1/a=\frac23 使 E\le E^{2/3}，所以 E 项被 E^{1/a} 吸收，
提出 E^{1/a} 后余 C(1+k_t)。E=0 时 8.4 的论证给 V=0（matrix.tex:555-556 明确处理了 E=0 的分支：
"If $E=0$, this already gives $V=0$"）并且总变差 0 给 \tr p(Y)=\tr p(X)，
于是 8.3 右端为 0，即 F_t=F_s 严格相等（注意这里用的是"HS 范数带权 = 0 $\Rightarrow$ F_t-F_s=0"，
因权重 I+Q/\theta 正定）。

(c) 机械理由。指数 1/a=\frac23 的诞生地是 8.4 里"用 G=\tr A^a\le c_aE 反解 \lambda_{\max}(A)\le(c_aE)^{1/a}"。
这一步一步是：p_1 的增量支付 a 次幂的 trace，而我们需要一次幂的相对大小 V\preceq q(I+X)，
两者之间差一个 1/a 次幂。这个损失是本质性的：matrix.tex:575 之后没有任何地方能把 \frac23 改回 1。
它对整个证明的下游影响只有一处，即 survival.tex 的链接：survival.tex:127 的
\mathbb E\lVert(F_t-F_s)U(\tau)\rVert^2\le Ck\lvert h_t-h_s\rvert^{1/a}，
以及 survival.tex:161 的 v_l=Ck2^{-l/a}、survival.tex:183-185 的级数
\sum_{l\ge1}2^{-l/(2a)}(1+\sqrt l)。因为 \frac1{2a}=\frac13>0，级数收敛（\sqrt l 因子被指数压过）。
所以 E^{1/a} 只要严格优于常数就够用，指数值本身进不到最终界里，只进常数 C_0，
从而只进 C=2D_\ast A_0/\sigma 的数值，不进增长率。这一点是"绝对因子级别"这句话的技术含义。
"零能量给严格相等"的消费处在 survival.tex:188-190：
"If $h_t=h_s$, Lemma increment gives $F_t=F_s$ exactly. At sufficiently fine depth a target index therefore
has the same filter as its representative"，即分箱里能量相同的索引在链接网里被视为同一个约束，
覆盖数不被重复计数放大。这是"与 n 无关"的第三个支点。

(d) [推测] 候选失败路线。
[推测] 一：想证 E 的线性界 \lVert F_t-F_s\rVert_{HS}^2\le CE。断在 8.4 的 1/a 幂（上一段已述），
更强的说法是：u\mapsto u^{1/a}（=\frac23 次幂）的 Hölder 连续性是 Löwner--Heinz 型的最优结果，
非交换矩阵函数的正则性天花板就在这里；要突破必须换工具（例如假设交换性，那又回到 8.3(d) 路线四）。
[推测] 二：把 E^{1/a} 写成 E^{1/a} 乘一个依赖 n 的因子，指望后面链接吸收。断在链接的
求和 \sum_j e^{-A2^j} 与 \sum_\theta 都只允许绝对常数与 \tr Q，任何 n 依赖都会传到
survival.tex:320-324 的 T 系数、破坏 H_0 的绝对性，最终破坏 assembly.tex:196-198。
[推测] 三：不用 (1+k_t) 而用"该箱内索引个数"。断在覆盖数与概率：箱内索引个数可以任意大（n 无界），
而 k_t 有 \sum_\theta k_t\le Cd 的总预算，只有后者能让类别求和收敛（survival.tex:112 的 K_j 分级）。

## 9 逐引理反推（五）：survival.tex 的一致高斯存活

分工在我读完全篇后才清楚：matrix.tex 负责"变差用能量量度"，Chaining 负责"一个箱内的期望上确界"，
Correlation 负责"把箱与箱、尺度与尺度、时间与时间的正概率乘起来"，
lem:ou-energy 与 brownian.tex 的存活率负责"把概率翻译回 Dirichlet 能量"。
Brownian/热核与 Chaining 的角色区分是：前者给"概率 $\leftrightarrow$ 能量"的字典（指数化的存活率），
后者给"约束集合的几何 $\to$ 单条概率下界"的定量估计（与维度无关的期望上确界）。

### 9.1 lem:ou-energy：平稳 OU 的存活与两种能量

(a) tex 逐字（survival.tex:30-45）：

> $\lambda_Q^{\mathrm{OU}}(D)=\inf_{0\ne h\in H_0^1(D)}\frac{\int_D\langle Q\nabla h,\nabla h\rangle\,d\gamma_m}{\int_Dh^2\,d\gamma_m}$. For every $T>0$, $\mathbb P\{U([0,T])\subset D\}\le e^{-T\lambda_Q^{\mathrm{OU}}(D)},\qquad\lambda_Q(D)\le\lambda_Q^{\mathrm{OU}}(D)+\tfrac12\operatorname{tr} Q$.

生成元与协方差在 survival.tex:22-26：dU=-QU\,d\tau+\sqrt{2Q}\,dB(\tau)，
\mathcal L_Q=\tr(Q\nabla^2)-\langle Qx,\nabla\rangle，\operatorname{Cov}(U(\tau),U(\sigma))=e^{-Q\lvert\tau-\sigma\rvert}，
U(0)\sim\gamma_m 且与未来的驱动噪声独立。

(b) 补中间步骤。第一条：\mathbf1_D 在 L^2(\gamma_m) 里，killed 半群 P_T^D 的算子范数是 e^{-T\lambda^{OU}}
（自伴非负形式的谱界），而 \mathbb P\{U([0,T])\subset D\}=\langle\mathbf1_D,P_T^D\mathbf1_D\rangle
\le\lVert\mathbf1_D\rVert_2^2e^{-T\lambda^{OU}}=\gamma_m(D)e^{-T\lambda^{OU}}\le e^{-T\lambda^{OU}}。
tex 还提到 Dirichlet Feynman--Kac 与 Davies--Simon 的势能有限性（survival.tex:59-61）作为备选论证。
第二条（共轭）：g=h\sqrt\rho，\rho(x)=(2\pi)^{-m/2}e^{-\lvert x\rvert^2/2}，
h=g\rho^{-1/2}、\nabla\rho^{-1/2}=\frac12x\rho^{-1/2}，故 \nabla h=\rho^{-1/2}(\nabla g+\frac12xg)。
代入并把 \langle Q\nabla h,\nabla h\rangle\rho 展开成三块：
\langle Q\nabla g,\nabla g\rangle、\langle Q\nabla g,xg\rangle、\frac14g^2x^TQx。
交叉项：\sum_iq_{ii}\int x_ig\partial_ig，用 \int\partial_i(x_ig^2)=0 得
\int x_ig\partial_ig=-\int x_ig\partial_ig-\int g^2，故 \int x_ig\partial_ig=-\frac12\int g^2，
交叉项合计 -\frac12\tr Q\int g^2。三项合起来即 survival.tex:66-71 的式子
\int[\langle Q\nabla g,\nabla g\rangle+(\frac14x^TQx-\frac12\tr Q)g^2]dx。
乘 \sqrt\rho 是 H^1_0(D) 到自身的双射且保持对应 L^2 范数（\int h^2\rho=\int g^2），
势能 \frac14x^TQx-\frac12\tr Q\ge-\frac12\tr Q（因 x^TQx\ge0），取 Rayleigh 下确界即得第二条。

(c) 机械理由。为什么用平稳 OU 而不用普通布朗：\mathcal D 的约束里有 \lVert R_tx\rVert<A_0\sqrt d
这种"半径随维度增长"的集合，普通布朗在 [0,T] 内的典型位移是 \sqrt{mT}，存活概率会随 m 指数地小；
而平稳 OU 的不变测度是 \gamma_m（各坐标方差 1），在盒 \lvert x_j\rvert<2 里的概率是绝对常数，
这正是 survival.tex:281-292 的坐标盒论证依赖的定常性。
\frac12\tr Q 的机械来源就是上面分部积分产生的漂移势能的负下界，
它与 matrix.tex:147 的 \tr Q 同量纲，所以能合并进 H_0=C'+\frac12（survival.tex:344）。
"存活概率下界被谁消费"：被 assembly.tex:84 的 \lambda_Q(\mathcal D)\le H_0\tr Q 消费，
再被 assembly.tex:186-190 的能量闭合消费，最后由 prop:adaptive（assembly.tex:32-50）
在 m=d+n 维的 K 上取符号。链条末端是 thm:signing 的 C=2D_\ast A_0/\sigma（assembly.tex:244）。
T\to\infty 的极限过程（survival.tex:340-342）："Let $T$ tend to infinity while keeping the input fixed.
This removes the additive constant, including the number of spectral scales."
这是全篇处理"输入依赖"的关键手法：我不需要一致地控住 \#\Theta 与 \sum_\theta E_\theta，
只需要它们对固定输入有限（A(Q,R,d,n)<\infty，survival.tex:329-333 明说
"This additive constant may depend on the input and on the smallest entry of $Q$; no uniform bound on it is required"）。

### 9.2 lem:epoch-prob：一个能量箱、一个尺度、一段时间

(a) tex 逐字（survival.tex:92-105 与 198-231）：

> Let $\mathcal I\subset\{0,\ldots,n\}$ be an index set whose values $h_t$ lie in an interval of length at most $e_0$. For every $u\ge0$, $\mathbb P\{\lVert F_tU(\tau)\rVert\le c_1\sqrt{k_t}\text{ for every }t\in\mathcal I,\ u\le\tau\le u+\theta^{-1}\}\ge\frac12$.
> $\mathbb E\sup\ldots\le C\sqrt k(1+\sum_{l\ge1}2^{-l/(2a)}(1+\sqrt l))\le C_0\sqrt k$.
> Markov's inequality and (class-mean) give $\mathbb P\{S_j\le2C_0\sqrt{K_j}\}\ge1/2$. Borell's Gaussian enlargement inequality ... $\mathbb P\{S_j>2C_0\sqrt{K_j}+r\}\le1-\Phi(r)\le e^{-r^2/2}$.
> With $A=(c_1-2C_0)^2/8$, the sum of these bounds is at most $\sum_{j\ge0}e^{-A2^j}\le\frac{e^{-A}}{1-e^{-A}}\le\frac12$ once $c_1$ is an absolute constant large enough that $A\ge\log3$.

(b) 补中间步骤。先删去 F_t=0 的索引（matrix.tex:111 保证剩下的 k_t\ge\frac14），
按 K_j=2^j/4 分级，类内 k_t\in[K_j,2K_j)。二阶矩三条：
survival.tex:120-122 \mathbb E\lVert F_tU(\tau)\rVert^2=\tr f_0(X_t)^2\le4k_t\le8k
（平稳 + coisometry + cutoff-moments：\tr(F_t^2)=\tr(R_t^Tf_0^2R_t)=\tr(f_0^2R_tR_t^T)=\tr f_0^2）；
survival.tex:126-128 \mathbb E\lVert(F_t-F_s)U(\tau)\rVert^2\le Ck\lvert h_t-h_s\rvert^{1/a}
（由 lem:increment，丢掉 \succeq I 的正权重，并用 1+k_t\le6k）；
survival.tex:137-141 \mathbb E\lVert F_t(U(\tau)-U(\sigma))\rVert^2\le2\lvert\tau-\sigma\rvert\tr(F_t^2Q)
=2\theta\lvert\tau-\sigma\rvert\tr(X_tf_0(X_t)^2)\le Ck\theta\lvert\tau-\sigma\rvert，
中间等号用 R_tR_t^T=I：\tr(F_t^2Q)=\tr(f_0^2R_tQR_t^T)=\tr(f_0^2L_t)=\theta\tr(f_0^2X_t)。
两参数链接：取 H 使 h_t\in[H,H+e_0]，归一化 \alpha=(h_t-H)/e_0、\beta=\theta(\tau-u)\in[0,1]。
混合增量拆成索引增量 + 时间增量，二阶矩 \le Ck(\lvert\alpha-\alpha'\rvert^{1/a}+\lvert\beta-\beta'\rvert)
（常数吸收 e_0\le1）。深度 l：两参数都切成宽 2^{-l} 的二分格，占用格的代表点 \le C4^l 个。
父到子的增量二阶矩 v_l=Ck(2^{-l/a}+2^{-l})\le Ck2^{-l/a}（因 1/a=\frac23<1）。
高斯向量最大值不等式（survival.tex:164-174）：任意依赖的中心高斯向量 G_i、
\mathbb E\lVert G_i\rVert^2\le v 时 \mathbb E\max\lVert G_i\rVert\le2\sqrt{v(\log M+1/2)}；
证明是对每个 G_i 对角化协方差、用特征值非负且和 \le v 得 \mathbb Ee^{\lVert G_i\rVert^2/(4v)}\le e^{1/2}，
再用 e^{\max}\le\sum e^{(\cdot)}、Jensen 与 Cauchy--Schwarz，v=0 平凡。
逐层求和：\mathbb E\sup\le\sqrt{8k}+\sum_l2\sqrt{v_l(\log(C4^l)+1/2)}
\le C\sqrt k(1+\sum_l2^{-l/(2a)}\sqrt{1+l})=C_0\sqrt k。
收敛性辩护（survival.tex:187-193）：能量值只有有限多个不同值；h_t=h_s 时 lem:increment 给 F_t=F_s
严格相等，故足够细的层里目标索引与代表点共享同一 filter，代表点时间收敛到目标时间，
U 的路径连续完成上确界；survival.tex:195-196 落点："the number of indices does not enter (class-mean)"。
类别统一（survival.tex:198-207）：有限时间网格上 S_j 是高斯向量范数的最大，
把联合高斯向量表成一个标准高斯的线性像，每个线性映射范数 \le1（输出协方差 F_t^2\preceq I，
由 matrix.tex:110），故 S_j 是 1-Lipschitz 泛函。Markov + class-mean 给
\mathbb P\{S_j\le2C_0\sqrt{K_j}\}\ge\frac12；Borell 扩容（Borell1975 Theorem 3.1）给
\mathbb P\{S_j>2C_0\sqrt{K_j}+r\}\le1-\Phi(r)\le e^{-r^2/2}。取 c_1>2C_0，
类 j 失败概率 \le\exp(-(c_1-2C_0)^2K_j/2)，令 A=\frac{(c_1-2C_0)^2}8（因 K_j=2^j/4），
\sum_{j\ge0}e^{-A2^j}\le\frac{e^{-A}}{1-e^{-A}}=\frac1{e^A-1}\le\frac12 当 A\ge\log3。
所有类别同时满足的概率 \ge\frac12，得 epoch-prob；缩短时间区间只会增大概率（survival.tex:229-230）。

(c) 机械理由。半径 c_1\sqrt{k_t} 带 k_t 的理由：类内二阶矩 \le Ck，"典型大小"是 \sqrt k，
而 Borell 的尾部以标准差为单位，两者匹配后阈值才写成"均值水平 + r\sqrt{K_j}"，
尾和才有 e^{-A2^j} 的几何衰减。若阈值写成绝对常数（不带 \sqrt{k_t}），
那么 k_t 大的类别失败概率不再小，\sum_j 发散；这就是每个约束的半径必须带 k_t 的机械原因。
c_1 与 C_0 的关系决定 A，A\ge\log3 是唯一被写明的数值门槛（survival.tex:228）。
时间区间长度 \theta^{-1}：时间增量二阶矩里出现 \theta\lvert\tau-\sigma\rvert，
取 \lvert\tau-\sigma\rvert\le\theta^{-1} 使该量 \le1，于是 \beta\in[0,1] 的归一化成立、
链接常数是绝对的；同时覆盖数 1+T\theta 恰好让 \sum_\theta(1+T\theta)(1+E_\theta)
里的 T 项被 \sum_\theta\theta E_\theta\le C\tr Q 与 \sum_\theta\theta\le4\tr Q 吸收。
矩阵界的两个角色分工在 survival.tex:233-237 被作者点明：
"the trace of the covariance controls the expected vector norm, while its operator norm gives the absolute
concentration parameter. This distinction is what allows the class failure probabilities to be summed
without a factor depending on the dimension." 也就是 \tr f_0^2\le4k 进期望（可以含 d），
\lVert F_t\rVert_{op}\le1 进 Borell（必须与 d 无关）。反过来用就双双失效。
热核在证明里的两处现身：brownian.tex:45-48 的自由热核控制（保证第一特征函数有界）、
survival.tex:51-58 的 killed OU 半群（把存活概率写成 \langle\mathbf1_D,P_T^D\mathbf1_D\rangle）。
Chaining 承担的角色就是把"约束集合的几何（HS 度量 + 方差）"翻译成"单条概率 \ge\frac12"。

(d) [推测] 候选失败路线。
[推测] 一：用 Dudley 熵积分代替显式二层链接。它大概仍给期望界，但断在"1-Lipschitz 泛函"这一步：
Borell 扩容需要每个标量泛函的方差 \le1（survival.tex:198-207 用 \lVert F_t\rVert_{op}\le1 检查），
熵积分本身不提供这个与 d 无关的浓度单位，类别尾和随之失效。
[推测] 二：对整段 [0,T] 一次性链接。断在覆盖数：M 会带 T、\theta 与 n，
\log M 进入每层界后无法再分解成"箱数 \times 段数 \times 类别数"的三个可求和因子。
[推测] 三：只用 Markov 不请 Borell，指望 \frac12 事件直接乘。
断在 correlation 需要每个事件概率 \ge p_0 且乘积 p_0^{\#\text{事件}}，取负对数后
每个事件贡献 \log\frac1{p_0}；\frac12 已经够（cost 是绝对常数 \log2），所以问题不在此，
而在于 class-mean 只给 \mathbb E\sup\le C_0\sqrt k，Markov 给的水平是 2C_0\sqrt{K_j}、概率 \ge\frac12，
而"某个约束超过 c_1\sqrt{k_t}"必须靠扩容把 \frac12 换成指数尾，否则 \sum_j 无法收敛到 \frac12 以下
（单条 Markov 只给 \le\frac12 的和，类别一多就超）。
[推测] 四：假设能量值之间有正间隙，从而箱内只有有限个"新"约束。
tex 在 survival.tex:193-196 明确拒绝："Neither argument uses a lower bound on the positive gaps between
energy values"；若真去假设间隙，b_i 任取时该假设不成立，断在覆盖数构造的良定义性。

### 9.3 prop:filtered 的合并：四类事件的乘积

(a) tex 逐字（survival.tex:304-324）：

> For a fixed $T>0$, cover $[0,T]$ by at most $1+T\theta$ consecutive closed intervals of length at most $1/\theta$ at scale $\theta$ ... Also cover $[0,T]$ by at most $1+TQ_{jj}$ intervals of length at most $1/Q_{jj}$ for coordinate $j$ ... All these events are closed symmetric convex constraints on linear evaluations of the centered Gaussian path. There are finitely many events for this fixed input and $T$. Lemma gaussian-path-correlation therefore multiplies their probability lower bounds.

(b) 补中间步骤。事件族四类：
（一）对每个活跃尺度 \theta\in\Theta、每个非空能量箱 [re_0,(r+1)e_0)、每段长 \le\theta^{-1} 的时间区间，
施加 epoch 事件（\forall t 在箱内 \lVert F_tU(\tau)\rVert\le c_1\sqrt{k_t}），概率 \ge\frac12；
（二）对每个坐标 j、每段长 \le1/Q_{jj} 的区间，施加盒事件 \lvert U_j(\tau)\rvert\le2，概率 \ge p_0；
（三）箱数 \le C(1+E_\theta(0,n))（survival.tex:256-258，含能量值重复）；
（四）时间分段数：尺度 \theta 给 1+T\theta，坐标 j 给 1+TQ_{jj}。
取负对数相乘：-\log\mathbb P\le C\sum_\theta(1+T\theta)(1+E_\theta(0,n))+C\sum_j(1+TQ_{jj})
\le A(Q,R,d,n)+C'T\tr Q，用 \sum_\theta\theta E_\theta\le C\tr Q（matrix.tex:147）、
\sum_\theta\theta\le4\tr Q（survival.tex:249）、\sum_jQ_{jj}=\tr Q，
把 \#\Theta 与 \sum_\theta E_\theta 折进 A。
包含关系：A_0>c_1\sqrt{C_\phi}、B_0>2 使闭约束 \lVert R_tU\rVert\le c_1\sqrt{C_\phi d}
与 \lvert U_j\rvert\le2 严格落在 \mathcal D 内部（survival.tex:294-302），
故交集蕴含 \mathcal D 内存活。之后 \lambda_Q^{OU}\le C'\tr Q+A/T、T\to\infty、
再加 \frac12\tr Q 得 H_0=C'+\frac12。
坐标盒事件的推导（survival.tex:281-292）：速率 q 的平稳 OU 限制在长 1/q 的区间；
由平稳与时间重标归约到速率 1 在 [0,1]；该过程分布上等于 e^{-s}(Z+B(e^{2s}-1))，
Z\sim N(0,1)、B 独立标准布朗；事件 \{\lvert Z\rvert\le1,\ \sup_{r\le e^2-1}\lvert B(r)\rvert\le1\}
有固定正概率且蕴含 \lvert\cdot\rvert\le2（因 e^{-s}\le1 且 e^{-s}B(e^{2s}-1) 的偏差不超 \sup\lvert B\rvert）。

(c) 机械理由。事件之所以符合 brownian.tex:79-81 的形式（A_{ij}X(s)\in K_{ij}，K 闭中心对称凸，
I 闭区间）：\lVert F_tU(\tau)\rVert\le c_1\sqrt{k_t} 是"线性映射 U(\tau)\mapsto F_tU(\tau) 落进闭球"；
\lvert U_j(\tau)\rvert\le2 是"坐标泛函落进闭区间"。"对区间内所有 s"这一约束由网格化实现
（brownian.tex:91-101）。survival.tex:313-316 的"even when some constraints are duplicates"是必要的：
不同（箱, 时间段）可能给出完全相同的事件（能量相同则 filter 严格相同），
correlation 对重复仍成立，代价按分段数正确计入。
零和条件与"有下标族可排列"的互推不涉及 prop:filtered，但 m=d+n 的"每个向量一个坐标"设计
正是为了让 thm:steinitz 能从 thm:signing 干净推出（introduction.tex:75-103），解析部分只管符号。
"区间长度取弛豫时间的倒数"这条原理在坐标盒（1/Q_{jj}）与尺度事件（\theta^{-1}）里各用一次；
若把区间拉长到 2/q 之类，概率与覆盖数都会变，但负对数成本仍线性于 \tr Q；
真正会断的是区间远大于 1/q 时单事件概率趋于 0，乘积不再给出 T 线性的成本。

(d) [推测] 候选失败路线。
[推测] 一：想让 \lambda_Q(\mathcal D)\le H_0\tr Q 由 domain monotonicity（\mathcal D 含一个盒）得来。
方向不对：包含给 \lambda_Q 的下界，我要上界，只能构造测试函数，而正确的测试函数来源是存活概率本身。
[推测] 二：把能量箱换成索引箱（等分成 \lceil n/L\rceil 段）。断在箱数随 n 增长、
T 系数变 \frac nL，而 \frac nL 与 \tr Q 无关（n 任意大），H_0 失去绝对性。
这是"为什么必须按累积能量分箱"的反面陈述。
[推测] 三：去掉坐标盒事件，只留状态约束。断在 \mathcal D 有界性（assembly.tex:11-12 与
brownian.tex:39-41 需要 H^1_0\hookrightarrow L^2 紧，即有界域），
且 survival.tex:57 的 \gamma_m(D) 有限性也要它。

## 10 逐引理反推（六）：consequences.tex 的两条推论

### 10.1 \ell_p 前缀界与 d^{\max\{1/p,1-1/p\}}

(a) tex 逐字（consequences.tex:9-31 与 35-50）：

> Every sequence $v_1,\ldots,v_N\in\R^d$ with $\lVert v_i\rVert_p\le1$ admits signs ... $\max_k\lVert\sum_{i\le k}\varepsilon_iv_i\rVert_p\le Cd^{\max\{1/p,1-1/p\}}$. ... For $1\le p\le2$, both bounds have sharp dimension order $d^{1/p}$ ... at least $\frac13d^{1/p}$.
> $\lVert x\rVert_2\le\lVert x\rVert_p\le d^{1/p-1/2}\lVert x\rVert_2$ ... $\lVert x\rVert_p\le\lVert x\rVert_2\le d^{1/2-1/p}\lVert x\rVert_p$. Divide the input vectors by $d^{1/2-1/p}$, apply the corresponding Euclidean theorem, and scale back to obtain $Cd^{1-1/p}$.

(b) 补中间步骤。p\le2：\lVert v_i\rVert_p\le1 蕴含 \lVert v_i\rVert_2\le\lVert v_i\rVert_p\le1，
套 thm:signing 得欧氏前缀界 C\sqrt d，再用 \lVert\cdot\rVert_p\le d^{1/p-1/2}\lVert\cdot\rVert_2
得 C d^{1/p-1/2}\sqrt d=C d^{1/p}。
p\ge2：\lVert v_i\rVert_2\le d^{1/2-1/p}\lVert v_i\rVert_p\le d^{1/2-1/p}，
所以先把序列除以 d^{1/2-1/p} 使其进入欧氏单位球，得缩放序列的前缀欧氏界 C\sqrt d，
乘回 d^{1/2-1/p} 得原序列前缀欧氏界 C d^{1/2}，再由 \lVert\cdot\rVert_p\le\lVert\cdot\rVert_2 得
C d^{1/2}。tex 写的是 C d^{1-1/p}，比我这里的粗算更紧：差别在于 tex 用
\lVert\cdot\rVert_p 直接承接"缩放后的 \lVert\cdot\rVert_2 界"，即
\lVert\text{原前缀}\rVert_p=d^{1/2-1/p}\lVert\text{缩放前缀}\rVert_p
\le d^{1/2-1/p}\lVert\text{缩放前缀}\rVert_2\le d^{1/2-1/p}\cdot C\sqrt d=Cd^{1-1/p}。
关键是把 \lVert\cdot\rVert_p\le\lVert\cdot\rVert_2 用在前缀上（这是 consequences.tex:44 的第一不等式），
，并非先乘回再转换。我第一遍在这里算错了方向，重读后果断按 tex 的顺序重排。
p=\infty 时 d^{1-0}=d（consequences.tex:50）。零和侧同理，"Scaling preserves the zero sum"
（consequences.tex:49），且一次选择控制全部前缀（consequences.tex:50-51）。
下界：有序基 e_1,\ldots,e_d 的终端带符号和是 (\pm1,\ldots,\pm1)，\lVert\cdot\rVert_p=d^{1/p}
（consequences.tex:52-53）。零和侧加 d 份 w=-\frac1d(1,\ldots,1)，\lVert w\rVert_p=d^{1/p-1}\le1，
和为 0；取第 k=\lfloor d/2\rfloor 个基向量刚出现的时刻，已出现 t 份 w、a=\frac t d\in[0,1]，
前缀和 s 有 k 个坐标 1-a、d-k 个坐标 -a，k\ge\frac d3、d-k\ge\frac d3，
\lVert s\rVert_p^p=k(1-a)^p+(d-k)a^p\ge\frac d3((1-a)^p+a^p)\ge\frac d3\cdot2^{1-p}
（x\mapsto x^p 凸给 (1-a)^p+a^p\ge2(\frac12)^p=2^{1-p}），
故 \lVert s\rVert_p\ge(\frac d3 2^{1-p})^{1/p}=\frac12(2d/3)^{1/p}\ge\frac13 d^{1/p}。
d=1 时族 (1,-1)，任一排列前缀范数 1。

(c) 机械理由。指数 \max\{1/p,1-1/p\} 的两个分支来自两次范数比较的不对称方向：
p\le2 时输入天然适配欧氏（单位球嵌套方向有利），代价全在输出侧，给 d^{1/p}；
p\ge2 时输入需要归一（差 d^{1/2-1/p}），输出侧反而免费（\lVert\cdot\rVert_p\le\lVert\cdot\rVert_2），
净代价 d^{1-1/p}。p=2 两侧吻合为 \sqrt d，正是主定理，这条推论因此把主定理嵌进一条连续的 p 轴上。
p=1 与 p=\infty 都给 d，与 introduction.tex:115-116 的任意范数 d 倍界（Grinberg--Sevast'yanov）相容，
说明这条路线在端点处没有改进经典界，改进只发生在 1<p<\infty 的内部。
"one signing controls all prefixes"（consequences.tex:41 与 50-51）被两次强调，
防止读者把 \ell_p 版本误读为逐前缀独立选择。

(d) [推测] 候选失败路线。
[推测] 一：用 John 椭球把一般 p 化归到欧氏并期待统一 d^{1/2}。断在 John 位置的失真在输入与
输出两侧各贡献 \sqrt d，合成 d；而且 p=1 的下界例子显示终端和已达 d，d^{1/2} 不可能。
[推测] 二：把有序基的带符号下界直接当零和下界。断在有序基不零和；tex 因此补 d 份 w，
代价是把常数从 1 降到 \frac13（consequences.tex:68-70）。
[推测] 三：在 p\ge2 侧先乘回归一因子、再用 \lVert\cdot\rVert_p\le\lVert\cdot\rVert_2。
断在我上面算错的那一步：会得到 d^{1/2} ，并非 d^{1-1/p}，p 接近 1 时是错误量级（该方向应给 d^1）。

### 10.2 彩色行排列推论

(a) tex 逐字（consequences.tex:80-99 与 110-130）：

> There is one tuple of permutations $(\pi_1,\ldots,\pi_k)\in\mathfrak S_n^k$ such that $\max_{0\le m\le n}\lVert\sum_{j=1}^k\sum_{i=1}^ma_{\pi_j(i)}^j\rVert_2\le2C\sqrt d$.
> This is the column-major reduction in the proof of Barany 2024 Lemma 2.1, with the present signed-prefix bound in place of its dimension-linear bound. Thus Barany's matrix signed constant satisfies $V(B_2^d)\le C\sqrt d$, uniformly in $k,n$. ... His transference theorem gives $U(B_2^d)\le2V(B_2^d)$ for every number of rows.

(b) 补中间步骤。把 k\times n 数组按列优先展开成长度 kn 的序列 v_{(i-1)k+j}=b_i^j（固定列 i、扫完行 j），
应用 thm:signing 得一组符号 \varepsilon，则每个"完整列前缀"（前 mk 项）满足
\lVert\sum_{j=1}^k\sum_{i\le m}\varepsilon_i^jb_i^j\rVert\le C\sqrt d（consequences.tex:114-118 的等式链）。
这就是 V(B_2^d)\le C\sqrt d（V 允许任意数组逐项带符号）。
再由 B\'ar\'any 转移定理 U\le2V（U 在总零和数组上取行排列、控制同一聚合前缀）得 2C\sqrt d。
行数不同的短行用尾随零列补齐（consequences.tex:128-129），以保证"列数一致"这一前提能被
"对所有列数一致成立"的界使用。k=1 时上界退化为 S_2(d)\le C\sqrt d，
下界由单纯形例子给（consequences.tex:133-134），故 \sqrt d 阶尖锐；
consequences.tex:135-136 明确保留"the numerical constant $2C$ is not asserted to be optimal"。

(c) 机械理由。这一节回答"C 与序列长度无关为什么本质的"。数组的展开长度是 kn，
k 与 n 都可任意大而无关 d；若 thm:signing 带 \sqrt{\log(kn)}（Banaszczyk 型），
V(B_2^d) 就不能写"uniformly in $k,n$"（consequences.tex:122 的这句是硬要求），
U\le2V 的转移会带着同一个尾巴，彩色界变成 2C(\sqrt d+\sqrt{\log(kn)})。
摘要里"with $C$ absolute and independent of the sequence length"（main.tex:42-43）
正是为这类推论服务的。第二重本质性：贪心与在线算法给不出与长度无关的界（长度趋于无穷时
要么漂移要么放弃），所以 introduction.tex:49-51 与 consequences.tex:136-137 两次声明
存在性、无在线规则、无高效算法。列优先展开的必要性：聚合前缀 \sum_j\sum_{i\le m} 必须是
展开序列的前缀，这只有"逐列扫描"才成立；按行优先展开得到的是错误的对齐。

(d) [推测] 候选失败路线。
[推测] 一：对每行独立用 thm:steinitz。断在前提：只有全局总和 0，每行不必零和；
而结论控制聚合前缀不是单行前缀（consequences.tex:97-99 专门强调）。
[推测] 二：把带符号问题的解直接当排列（把 \pm 看作两种颜色）。
断在彩色问题的 \pi_j 逐行独立，符号一致性无法转成"同一前缀聚合"的形式。
[推测] 三：指望 2C 被改写成 C。断在 B\'ar\'any 的 U\le2V 定理本身给出 2，
tex 没有声称可改进；要改就得重做转移论证，与本文无关。

## 11 关键转折点（我的重建）

转折一：把"约束的个数"换成"约束的总变差"。我最初的直觉是把 n+d 个约束逐个处理，
于是不可避免地出现 n 或者 \log n。assembly.tex:89-92 与 matrix.tex:39-43 的两句
（"The constants are independent of the number of maps"、"These two budgets are independent of the
length of the sequence"）说明最终答案的立足点是：约束可以任意多，只要它们的累积变化量有界。
这是把问题从"离散计数"改写成"连续能量"的一步，而能量的载体是 trace。

转折二：意识到 \mathcal D 必须同时容纳 d 个状态坐标与 n 个系数坐标，
而系数坐标里的"预测项"必须恰好抵消收缩。assembly.tex 的整条构造（b_i=\sigma v_i、
C_i=I-\eta_ib_ib_i^T、m_i、clip、unclipped、cancel）是一次"反馈线性化"：
先造一个会自我收缩的动态系统，再让注入项精确补回被削掉的法向分量。fig:cancellation
（assembly.tex:247-272）被单独画出来，说明作者也认为这是最需要视觉解释的一步。
我把它读成一个 predictor--corrector：状态收缩是 corrector 的失败部分，
m_i 是 predictor 对该失败的预测，系数 \eta_i 是两者匹配的唯一旋钮。
转折发生前我大概会问"为什么收缩要可逆"；转折后的答案是"因为预测项需要与之精确抵消，
不可逆时丢失的分量无法从任何未来的坐标恢复"。

转折三：接受"用概率构造凸体"这个顺序。传统做法是：给一个凸体，估计它的特征值。
这里反过来：先规定想要的约束（\mathcal D 的定义，assembly.tex:74-81），
再证明它的能量足够小（prop:filtered），然后由 prop:adaptive 把能量兑换成符号。
顺序倒转的必要性在于：约束集合由问题的动态决定，不是可以自由选择的东西；
能自由选择的只有测试函数，而测试函数最好的来源是存活概率本身。
这也解释了 brownian.tex 与 survival.tex 为什么把 Dirichlet 能量与存活率之间的字典（lem:brownian-rate）
写得那么细：那是概率与谱两个世界唯一的兑换窗口。

转折四：从"每个前缀单独平衡"到"同一组符号控制所有前缀"的量化差异。
introduction.tex:145-148 对 Li 的终端结果的区分就是这个转折的书面证据：
终端型可以逐前缀换符号、每次绝对常数，但把它们合起来时符号必须统一，
这正是所有已知方法（贪心、熵、union bound）失败的地方。
我猜这个转折带来的最大改动是：能量假设必须是对所有对角权重 Q 一致的
（assembly.tex:36 与 signing.tex:40），因为不同前缀对应不同坐标子集，
只有"全对角一致"才能被子集化。若只假设 Q=I 的能量界，signing.tex:81-91 的分离论证给不出
逐坐标能量，整个链条在第一步就断。

## 12 最终思路与最初设想的差异

我最初设想的路径：一个凸几何/测度论证（Banaszczyk 型），用高斯测度的对数凹性
把每步的符号选择压缩成"体的一半包含下一步"，然后迭代。
最终得到的路径里有三条与这个设想明显不同。

差异一：概率不是辅助工具，是构造主体。最初我以为随机性只出现在"证明存在一组符号"这一步，
最终证明里随机性出现在两个完全不同的层次：一是符号的存在（signing.tex，靠的是 Sobolev 能量与
Steiner 重排，没有概率；那里 lem:minkowski 用了布朗与 Prekopa，但目的是证明一个纯谱不等式），
二是体的能量估计（survival.tex，一整节都是 OU 过程与高斯 correlation）。
把"能量"当成两个世界的公共货币，是我最初没想到的架构。

差异二：维度靠谱局部分解，并非靠各向异性归一。最初我以为 \sqrt d 会通过某种
"每维贡献 1"的加法出现。实际的机制是：约束被分解到二分尺度 \theta 上，
每个尺度独立处理（半径 c_1\sqrt{k_t}，时间粒度 \theta^{-1}），而 \sqrt d 是
\sum_\theta k_t(\theta)\le Cd 开根号的结果（matrix.tex:98 与 survival.tex:276）。
这个分解同时解释了两个事情：为什么没有 \log d（几何衰减的尺度求和，8.1(d) 路线一），
以及为什么维度只以"特征值个数"的方式进入（\tr\phi 是对角化的量，与 Q、F_t 是否交换无关）。

差异三：最终证明对"输入依赖"的处理方式与我的直觉相反。最初我要求每一步的界对所有输入一致，
因此试图一致地控住活跃尺度个数 \#\Theta 与总能量。survival.tex:329-333 给出的答案是：
这些量允许依赖输入，只要它们有限；把它们塞进加性常数 A(Q,R,d,n)，然后用 T\to\infty 抹掉。
这一步在时间维度上取极限来消掉组合维度上的估计，我在最初设想里完全没有预留这种余地。

差异四：符号赋值是"自适应平移"的产物。最初我以为符号选择只能看当前状态；
prop:adaptive（assembly.tex:39-48）允许第 i 步的平移 q_i 依赖前面所有已赋值的坐标，
而这一点恰好是 predictor 需要的（m_i 依赖 R_{i-1}x，即前面的噪声坐标）。
"允许自适应平移"不是技术修饰，它是让整条构造闭合的前提；而它的代价是
signing.tex 必须证明重排与截面技巧对这种依赖仍然有效，这就是 lem:shift-section 存在的全部理由。

差异五：我原本预期"欧氏"性质会通过正交群或旋转平均使用。实际证明里唯一用到内积结构的地方是
（一）coisometry R_tR_t^T=I 带来的 trace 恒等式（matrix.tex:85-89、survival.tex:142），
（二）特征值与谱演算。没有旋转平均、没有各向同性位置的论证。
欧氏假设被压缩成"可以对角化 + 有算子序"这么少东西，这一点我反推之后才意识到，
也解释了为什么 matrix.tex 的引理都以"positive semidefinite order"语言陈述。

## 13 Lean 侧取证：规模清单、簇表与 tex 对齐

我实际取证的只有：formalization.yaml 第 1530--1532 行的注册三件套与 687--689 行的书目条目、
comparator json 全文、以及 `OAI/Analysis/Steinitz/` 目录本身的行数/字节清单与每个文件的模块注释、
声明计数、import 计数；另外精读了 Main.lean（118 行）与 Model.lean（26 行）这两个最小文件。
29 个 .lean 我没有逐文件通读，150 轮额度下不可能，下面第 2 张表是按规模与命名的对齐推断，
我把它明确标为推断，装作读过是不诚实的。

清单（字节降序，`find` + `wc` 取得）：
HeatL2 1631 行 / 80251、Correlation 1419 / 70448、Coefficients 893 / 44081、Prekopa 857 / 44072、
Rearrangement 881 / 42659、Gain 830 / 40901、Survival 773 / 39568、Chaining 749 / 35200、
HeatEnergy 742 / 35168、SectionEnergy 618 / 29312、MatrixEnergy 634 / 28775、PathLaws 567 / 27154、
LiftedRearrangement 485 / 23360、FilterMoments 493 / 22906、Scales 457 / 22397、Spectral 407 / 19851、
Filter 380 / 17146、GaussianTail 268 / 12375、Predictor 253 / 11979、SigningData 225 / 11847、
Energy 252 / 11803、FilteredBody 194 / 11533、Adaptive 199 / 9372、GaussianProcess 220 / 9257、
Transference 179 / 7952、GaussianKernel 179 / 7778、KernelConvexity 153 / 7630、Main 118 / 5632、
Model 26 / 902。合计 29 个文件。

对齐推断表（"精读"列说明我是否读了正文）：

| tex 分片 | 最可能落在的 .lean | 依据 | 精读程度 |
| --- | --- | --- | --- |
| introduction.tex（陈述 + transference） | Model.lean, Transference.lean | Model 的 docstring 无、但定义 SignedPrefixBound 与 OrderingPrefixBound（Model.lean:9,17）；Transference 的注释是 "Positive-forward and negative-reverse permutation transference" | 两个文件全文读过 |
| assembly.tex（filter、predictor、抵消、常数闭合） | Main.lean, Filter.lean, Predictor.lean, FilteredBody.lean, SigningData.lean, FilterMoments.lean | Main.lean:15-72 的 filtered_signed_prefixes 把 assembly.tex:116-245 整段装配起来；Filter 注释 "Symmetric contraction updates and filtered matrix states"；Predictor 注释 "Predictor-column energy and exact feedback cancellation"；FilteredBody 注释 "Filtered-body energy and the predictor slab budget"；FilterMoments 注释 "Filtered moments, prefix bounds, and rank-one contractions" | 只精读 Main.lean；其余按注释、命名与 import 链推断 |
| signing.tex（密度、Minkowski、截面、自适应选号） | Rearrangement.lean, Adaptive.lean, SectionEnergy.lean, LiftedRearrangement.lean, Prekopa.lean, KernelConvexity.lean | Rearrangement 注释 "Vertical Steiner rearrangement and shifted section geometry" 且 Main.lean:28,48 调用 ShiftedSections.Good 与 ShiftedSections.adaptive_linear_equations；Adaptive 注释 "Energy-preserving sections and adaptive coordinate selection"；LiftedRearrangement 注释 "Lifted fiber rearrangement and overlap estimates"；Prekopa 注释 "Prékopa inequalities and Gaussian log-concavity" | 未精读，属推断 |
| matrix.tex（trace 预算、标量势、端点比较、增益控制） | MatrixEnergy.lean, Gain.lean, Coefficients.lean, Energy.lean, Spectral.lean, Scales.lean | MatrixEnergy 注释 "Scalar potentials and spectral endpoint inequalities"；Gain 注释 "Contraction and gain potentials for positive semidefinite matrices"；Coefficients 注释 "Filtered coefficients and their quadratic energy bounds"（namespace 是 EuclideanSteinitz.Gain）；Energy 注释 "Telescoping matrix energy and trace budgets"；Scales 注释 "Uniform dyadic scale-energy estimates"；Spectral 注释 "Real spectral calculus and noncommuting matrix inequalities" | 未精读，属推断 |
| survival.tex（OU 能量、链接、合并） | Survival.lean, Chaining.lean, Correlation.lean, HeatEnergy.lean, PathLaws.lean, GaussianProcess.lean, GaussianTail.lean | Survival 注释 "Gaussian path survival with slab and state constraints"；Chaining 注释 "Gaussian chaining, finite nets, and uniform process bounds"；Correlation 注释 "Gaussian correlation and symmetric convex events"（namespace EuclideanSteinitz.GaussianCorrelation）；HeatEnergy 注释 "Survival-energy estimates and simultaneous diagonal separation"；PathLaws 注释 "Gaussian heat kernels and autoregressive path laws"；GaussianProcess 注释 "Stationary Gaussian autoregressive rows and covariance identities"（Main.lean open GaussianAR） | 未精读，属推断 |
| brownian.tex（存活率、路径 correlation、slab 能量） | HeatL2.lean, GaussianKernel.lean, Prekopa.lean, Correlation.lean | HeatL2 注释 "Heat operators, weak coordinate derivatives, and Dirichlet energy"，是模块里最大的文件（1631 行）；GaussianKernel 注释 "Diagonal Gaussian kernels and their densities"；KernelConvexity 注释 "Convexity and norm inequalities for Gaussian kernels"（namespace HeatL2） | 未精读，属推断 |

Main.lean 是我唯一逐行读过的实现文件，它与 tex 的对应关系非常直白：
universalConstant := 2*bodyScale*stateRadius/signingScale（Main.lean:79）对 assembly.tex:244 的
C=2D_\ast A_0/\sigma；main := \exists C, SignedPrefixBound C \wedge OrderingPrefixBound C
（Main.lean:111-112）用 signed_prefix_bound 与 signing_implies_ordering 两个分量拼成，
对摘要的两句话一一对应（带符号前缀 + 零和族排列）；
hslab 那段（Main.lean:35-47）用 bodyScale*(2*slabRadius*signingScale)=1/4（引 signingScale_cancel）
实现 assembly.tex:194 的 \sigma=\kappa\delta/(\sqrt2\pi) 闭合，且把 \delta=\frac14 直接写成字面量 1/4；
filtered_signed_prefixes 里的 familyPredictor_future（Main.lean:32-34）是 assembly.tex:144-146 的支撑性，
noiseRow_eval 加 hx0（Main.lean:53-58）是 assembly.tex:220 的 x^0=x，
run_prefix_cancel（Main.lean:59-64）是 assembly.tex:229-240 的抵消恒等式。
comparator json 只登记一个定理名 OAI.EuclideanSteinitzBergstrom.main、definition_names 为空、
许可公理 propext / Quot.sound / Classical.choice、enable_nanoda 为 false，
这与"存在性证明、无算法"的定位一致（Classical.choice 承担选择公理层面的存在性）。
[推测] definition_names 为空说明 Lean 侧把 SignedPrefixBound、OrderingPrefixBound 这类
abbrev/def 不列为需要比对的对外定义，只比对最终定理语句。

## 14 外部推断与检索所得（不属于论文事实的部分）

以下条目是我为了理解问题位置而做的检索与常识性推断，全部标为外部，不进入 tex 事实。

[外部推断] Steinitz 定理的经典形态是：有限维 Banach 空间里条件收敛向量项级数可重排收敛到任意指定和，
其量化版本即"零和向量族可排列使部分和有界"，界依赖维数与范数。
introduction.tex:111-121 自己也把历史归给 Steinitz 的条件收敛级数工作，
并引 Ambrus--Heck 的历史综述与 Grinberg--Sevast'yanov 的任意范数 d 倍界。
[外部推断] 任意范数下界为 d 倍（，并非 \sqrt d）这件事说明欧氏结构提供的增益正好是 \sqrt d 量级，
与本文的下界例子（正则单纯形）吻合。
[外部推断] Bergström 的经典恒等式（\sum\lVert x_i\rVert^2 与 \max_k\lVert\sum_{i\le k}x_i\rVert^2 之间的
不等式）在传统 Steinitz 证明里用来把"部分和"与"项的平方和"挂钩；
introduction.tex:118 提到 \sqrt d 尺度在欧氏空间的长期历史并引 Behrend 讨论期望增长，
这与该恒等式的方差型结构一致。
[外部推断] 符号与前缀问题在 Banach 空间中的一般形态由 Banaszczyk 的凸体高斯测度定理主导，
其典型结论带有 \sqrt{d}+\sqrt{\log N} 型两项；本文 introduction.tex:129-132 记录了这条界，
并把长度项的出现条件说清楚（N 远大于维数）。
[外部推断] 相邻的"多个约束同时平衡"结果是 Spencer 六标准差定理那一族（列的符号使每行和 \le O(\sqrt n)），
它处理的是终端（非前缀）平衡、组合约束（行）与部分超图结构；
[外部推断] 它与本文的差异在于：Spencer 型方法靠熵/部分集对偶，界里对约束个数有依赖，
因此无法直接给出"与 n 无关"的全前缀界，这与我第 3 节的路线二失败原因相同。
检索中我还碰到 "Gaussian discrepancy"（把带符号平衡松弛为高斯向量分配）这一族工作，
它和本文的分工是：那条路线改变问题（允许连续高斯噪声，并非 \pm1），
本文在原始 \pm1 问题上取到 \sqrt d。
另一条我检索到但只能作为背景的是"Banaszczyk 的 K 与 C+K 包含关系"，
它是 Gaussian convex bodies 用于向量平衡的标准接口（introduction.tex:153 提到该场景的中心地位）。

## 15 我留下的问题

问题一：\delta=\frac14、\kappa=\frac1{100}、\ell=\frac52 这组常数是否有可行域的完整刻画？
我从 signing.tex:275 反解出 \kappa<\frac1{12.5}=0.08（M>1 的要求）与 \delta<\frac12（余量要求），
再从 assembly.tex:193-194 得到 D_\ast 与 \sigma 的耦合，但没有尝试求最优三元组；
tex 也没有给，因为它只需要绝对常数。

问题二：prop:filtered 的能量界 H_0 具体多大？tex 只给 H_0=C'+\frac12 且 C' 来自
survival.tex:320-324 的多个绝对常数的累积（c_1、A、Borell 尾部、覆盖数），
一条都没有数值化。C=2D_\ast A_0/\sigma 里 \sigma\approx\frac{1}{100}\cdot\frac14\cdot\frac1{\sqrt2\pi}
\sim6\times10^{-4}，光这一项就使 C 的下限量级在 10^3 以上（我按公式估的，tex 未给数值）。
Dutta--Jha--Jiang 的 d^{1/4}\log^{7/4}N 界（introduction.tex:134）在 N 不太大时数值上更友好，
这正是本文定理目前是存在性结果的代价。

问题三：Lean 侧 HeatL2.lean 为什么是模块里最大的文件（1631 行、80251 字节，
比 tex 里只有 140 行的 brownian.tex 大两个数量级）？我的解释是：Mathlib 里"弱坐标导数 + 热半群 +
Dirichlet 能量"这条分析基础没有现成的对角权重版本，需要从零建立；
这属于实现成本，与论文结构无关。我没有读该文件正文，所以这只是按规模与注释的推断。

问题四：main 的量化只声明 \exists C，没有把 S_2(d) 作为函数定义并证 \Theta(\sqrt d)
（Model.lean:9,17 只有 SignedPrefixBound 与 OrderingPrefixBound 两个谓词）。
introduction.tex:65 的 \frac12\sqrt d\le S_2(d)\le C\sqrt d 下界那一侧在 Lean 里如何表示，我没有查，
也不在 comparator json 的 theorem_names 里（那里只有 main 一个名字）。

## 16 向量个数与维数预算

我落的第一版配平是 `$m=d$`，让 `$d$` 个状态坐标自己兼任 `$n$` 个系数坐标，期望 `$R_t$` 直接写成前缀和 `$\sum_{i\le t}\varepsilon_i v_i$`。它在注入这一步垮掉：每一步的 `$C_t$` 要求可逆（assembly.tex:63），`$b_t\in\R^d$` 必须从一个新方向进来，而 `$R_t\colon\R^m\to\R^d$` 要满足余等距 `$R_tR_t^\top=I_d$`（matrix.tex:23）至少得 `$m\ge d$`。真正的预算是 `$m=d+n$`（assembly.tex:62）：前 `$d$` 个坐标承载 `$R_0x=(x_1,\ldots,x_d)$`，后 `$n$` 个位置逐一留给 `$x_{d+1},\ldots,x_{d+n}$`，于是 `$R_tx=C_tR_{t-1}x+b_tx_{d+t}$`（assembly.tex:70-72）。这三步心理活动我全部标 [推测]，tex 只给结果，不给次序。

约束的条数是我没料到的。`$\mathcal D$` 是 `$m+n+1=d+2n+1$` 个不等式的交：`$m$` 个坐标盒 `$\lvert x_j\rvert<B_0$`（`$1\le j\le m$`）与 `$n+1$` 个状态球 `$\lVert R_tx\rVert_2<A_0\sqrt d$`（`$0\le t\le n$`）（assembly.tex:75-81）。预测器矩阵 `$M$` 有 `$n$` 行 `$m_1,\ldots,m_n$`，`$m_i$` 的支撑只落在 `$\{d+1,\ldots,d+i-1\}$`（assembly.tex:144-146），第 1 行读 `$0$` 个坐标，第 `$i$` 行至多读 `$i-1$` 个，故 `$M$` 的非零元总数上限是 `$\sum_{i=1}^n(i-1)=\frac{n(n-1)}2$`，前 `$d$` 列全为零（assembly.tex:151）。号的个数是 `$s=n$`，按 `$e_{d+1},\ldots,e_{d+n}$` 的顺序取（assembly.tex:203-204）。输入长度这里写 `$n$`、引言写 `$N$`，同一个 `$n=N$` 在第 1 节台账里记过两次。

坐标盒 `$\lvert x_j\rvert<B_0$` 我一度想删，觉得状态球 `$\lVert R_tx\rVert<A_0\sqrt d$` 已经够圈住 `$\mathcal D$`。删掉之后 `$\mathcal D$` 无界，`$\lambda_Q$` 的存在性靠 `$H^1_0(D)\hookrightarrow L^2(D)$` 的紧嵌入（brownian.tex:39-40），无界集上这条直接断；存活论证里的加性常数 `$A(Q,R,d,n)$` 也finite不起来了（survival.tex:329-331）。坐标条数 `$m$` 在覆盖里第二次露面：`$m$` 个盒事件、时间成本 `$\sum_{j=1}^m(1+TQ_{jj})$`（survival.tex:308, 323），`$m=d+n$` 在 `$n\ge1$` 时给出 `$\sum_{j=1}^m1\le d+n$` 的线性代价，这就是"$N$ 被搬进维数"付的账单。

坐标盒 `$\lvert x_j\rvert<B_0$` 我一度想删，觉得状态球 `$\lVert R_tx\rVert<A_0\sqrt d$` 已经够圈住 `$\mathcal D$`。删掉之后 `$\mathcal D$` 无界，`$\lambda_Q$` 的存在性靠 `$H^1_0(D)\hookrightarrow L^2(D)$` 的紧嵌入（brownian.tex:39-40），无界集上这条直接断；存活论证里的加性常数 `$A(Q,R,d,n)$` 也 finite不起来了（survival.tex:329-331）。坐标条数 `$m$` 在覆盖里第二次露面：`$m$` 个盒事件、时间成本 `$\sum_{j=1}^m(1+TQ_{jj})$`（survival.tex:308, 323），`$m=d+n$` 在 `$n\ge1$` 时给出 `$\sum_{j=1}^m1\le d+n$` 的线性代价，这就是"$N$ 被搬进维数"付的账单。

个数第二次登场在 colorful 推论：`$k\times n$` 阵 `$a_i^j\in\R^d$` 按列拉直成 `$kn$` 项序列 `$v_{(i-1)k+j}=b_i^j$`（consequences.tex:107-108），界 `$C\sqrt d$` 对 `$k$` 与 `$n$` 同时一致，行置换界 `$2C\sqrt d$`（consequences.tex:91-94）也不随 `$k$` 长。对照 `$O(\sqrt d+\sqrt{\log N})$`（introduction.tex:130）里 `$N\gg d$` 时才咬人的尾巴 `$\sqrt{\log N}$`，`$m=d+n$` 这条构造路线是把长度换坐标，换来换去没换出对数。

## 17 平方和归一与预算的两半

把 `$b_i=v_i$` 直接写进构造是我的第一版，这时列望远镜给 `$\lVert Me_{d+j}\rVert_2^2\le\lVert v_j\rVert_2^2\le1$`（assembly.tex:169），即 `$\sigma=1$`，slab 代价 `$\pi^2\delta^{-2}\sigma^2\tr Q$`（assembly.tex:186-190）达到 `$\pi^2\delta^{-2}=16\pi^2\approx157.9$`，对目标 `$\kappa^2=10^{-4}$`（`$\kappa=\frac1{100}$`，assembly.tex:25）差 `$1.6\times10^{6}$` 倍，闭合无望。归一 `$b_i=\sigma v_i$`（assembly.tex:123）就是把 `$\sigma$` 从 `$1$` 压到 `$\frac{\kappa\delta}{\sqrt2\pi}\approx5.6\times10^{-4}$`，代价留到最后除以 `$\sigma$`，`$C=\frac{2D_\ast A_0}\sigma$`（assembly.tex:244）。

平方和预算在精确损失恒等式 `$\lVert r_{i-1}\rVert_2^2-\lVert r_i\rVert_2^2=(b_i^\top r_{i-1})^2$`（assembly.tex:159-161）处合拢，链条是 `$r_j=b_j$`、`$r_i=C_ir_{i-1}$`（`$j<i\le n$`，assembly.tex:152-153），对 `$i$` 求和得 `$\sum_{i=j+1}^n(b_i^\top r_{i-1})^2=\lVert b_j\rVert_2^2-\lVert r_n\rVert_2^2\le\sigma^2$，配合 `$\eta_i\le1$` 给出 `$\lVert Me_{d+j}\rVert_2^2=\sum_{i=j+1}^n\eta_i^2(b_i^\top r_{i-1})^2\le\sigma^2$`（assembly.tex:165-169），加权版本 `$\sum_{i=1}^nm_iQm_i^\top=\sum_{j=1}^{d+n}Q_{jj}\lVert Me_j\rVert_2^2\le\sigma^2\operatorname{tr} Q$`（assembly.tex:174-176）。我一开始担心右端会带出 `$\sigma^2\sum_{i\le n}\lVert v_i\rVert_2^2$` 这种含 `$n$` 的项，望远镜把这层担心消掉了：平方和自抵消，后头只剩头项 `$\lVert b_j\rVert_2^2$`。

`$\eta_i$` 并不是一眼就取 assembly.tex:124 那个值。我先试常数 `$\eta_i=\frac12$`：`$C_i=I-\frac12b_ib_i^\top$` 可逆（特征值 `$1-\frac{\lVert b_i\rVert_2^2}2\in[\frac12,1)$`）也收缩（`$C_i\preceq I_d$`），但 prop:filtered 的前提 `$C_tC_t^\top+b_tb_t^\top=I_d$`（assembly.tex:65-67）断在这一步：`$(I-\frac12bb^\top)^2+bb^\top=I_d+\frac12bb^\top-\frac14\lVert b\rVert_2^2\,bb^\top$`，不等于 `$I_d$`。再试 `$\eta_i=1$`，`$C_i^2+b_ib_i^\top=I_d-(1-\lVert b_i\rVert_2^2)b_ib_i^\top$`，同样不闭合。卡进方程的是谱平方根 `$C_i=(I-b_ib_i^\top)^{1/2}$` 配套 `$\eta_i=\frac1{1+\sqrt{1-\lVert b_i\rVert_2^2}}$`（assembly.tex:124, 132-133），`$b_i=0$` 的退化支给 `$\eta_i=\frac12$`、`$C_i=I_d$`（assembly.tex:129），一般支落在 `$\frac12\le\eta_i\le1$`（assembly.tex:134）区间里。

`$\kappa^2$` 拆成 `$\frac{\kappa^2}2+\frac{\kappa^2}2=\kappa^2$` 的两半制衡，是能反推出来的唯一拆法：`$H_0D_\ast^{-2}\le\frac{\kappa^2}2$` 等价于 `$D_\ast\ge\frac{\sqrt{2H_0}}\kappa$`，`$\pi^2\delta^{-2}\sigma^2\le\frac{\kappa^2}2$` 等价于 `$\sigma\le\frac{\kappa\delta}{\sqrt2\pi}$`，assembly.tex:193-194 的 `$D_\ast\ge\max\{1,\frac{\sqrt{2H_0}}\kappa\}$` 与 `$\sigma=\min\{\frac12,\frac{\kappa\delta}{\sqrt2\pi}\}$` 就是这两条等价式的誊写。我起初试过三等分 `$\frac{\kappa^2}3+\frac{2\kappa^2}3$`，`$D_\ast$` 被推高 `$\sqrt{\frac32}$` 倍、`$\sigma$` 收紧 `$\sqrt{\frac23}$` 倍，`$C=\frac{2D_\ast A_0}\sigma$` 反而变大 `$\sqrt2$` 倍，回到对半。`$\frac12$` 的 guardrail 支：`$\frac{\kappa\delta}{\sqrt2\pi}\approx5.6\times10^{-4}<\frac12$`，min 恒取小者，`$\lVert b_i\rVert_2\le\sigma\le\frac12$` 顺带保证 `$\sqrt{1-\lVert b_i\rVert_2^2}$` 实值与 `$\lVert Me_{d+j}\rVert_2^2\le\sigma^2\le\frac14$`。

## 18 重排的逐步范数界与常数的阶

传递那一段最短，可我的第一版排错了。我先写的排列是：正号下标按原序排前面，负号下标也按原序接在后面。第二段的局部和就写成 `$P_j$` 再减去一段负项的运行和，无法用手上仅有的两个界 `$\lVert A_j\rVert_2\le\beta$`、`$\lVert B_j\rVert_2\le C\sqrt d$`（introduction.tex:84-85）表示，走到 `$N$` 步只剩 `$\beta+N\max_i\lVert v_i\rVert_2\le\beta+N$` 这种带 `$N$` 的死界。正解是 Chobanyan 的正向负反向形（introduction.tex:70-73）：正号下标按原序，负号下标按原序的逆序，第一段局部和恰为 `$P_j=\frac{A_j+B_j}2$`，第二段局部和恰为 `$-M_j=-\frac{A_j-B_j}2$`（introduction.tex:88-95），每个新局部和满足 `$\lVert P_j\rVert_2,\lVert M_j\rVert_2\le\frac{\beta+C\sqrt d}2$`，自锁定 `$\beta\le\frac{\beta+C\sqrt d}2$` 移项即得 `$\beta\le C\sqrt d$`（introduction.tex:98-100）。两个平均值给出 `$\frac12$`，`$\frac12$` 给出可闭合的不等式；`$\sum_{i=1}^Nv_i=0$`（introduction.tex:38）是让 `$-M_j$` 成立的前提，缺它第二段就多出 `$\frac{\lVert\sum v_i\rVert}2$` 的漂移项。重排保持全部重数（introduction.tex:102），零向量与重复向量都在许可输入里（introduction.tex:47-48）。

逐步界长什么样：`$\max_{0\le k\le N}\lVert\sum_{i\le k}\varepsilon_iv_i\rVert_2\le C\sqrt d$`（introduction.tex:14-17）是 `$N+1$` 条范数界由同一组 `$\varepsilon\in\{-1,1\}^N$` 同时兑现；单步跳量 `$\lVert\varepsilon_kv_k\rVert_2\le1$` 与 `$d$` 无关，界全部来自 `$N+1$` 条前缀的公共控制，`$C$` 与 `$d,N$`、序列都无关（introduction.tex:18-19）。

常数的阶我算过一遍。`$C=\frac{2D_\ast A_0}\sigma$`（assembly.tex:244），代 `$\sigma=\frac{\kappa\delta}{\sqrt2\pi}$` 得 `$C=\frac{2\sqrt2\,\pi D_\ast A_0}{\kappa\delta}\approx3.6\times10^{3}\,D_\ast A_0$`（`$\kappa\delta=\frac1{400}$`，`$2\sqrt2\pi\approx8.9$`，`$\frac{8.9}{1/400}\approx3.6\times10^{3}$`）；再代 `$D_\ast\ge\frac{\sqrt{2H_0}}\kappa=100\sqrt{2H_0}$` 得 `$C\gtrsim3.6\times10^{5}\sqrt{2H_0}\,A_0$`。`$H_0=C'+\frac12\ge\frac12$`（survival.tex:344）使 `$\sqrt{2H_0}\ge1$`，于是 `$C\gtrsim3.6\times10^{5}A_0$`，而 `$A_0>c_1\sqrt{C_\phi}$`（survival.tex:276）两头都没数值化，只能说 `$C$` 在 `$10^{5}$` 阶往上 [推测]。这比第 15 节问题二的 `$10^{3}$` 高半到两个数量级：那里取 `$D_\ast\ge1$`，这里把 `$\frac{\sqrt{2H_0}}{\kappa}$` 的下界代足了，两式相差 `$100\sqrt{2H_0}$` 倍。

那个因子 `$2$` 我一度以为可省，猜真正的常数能写成 `$C'=\frac{D_\ast A_0}\sigma$`。省不动：`$K=(2D_\ast\mathcal D)\cap\{x:\lvert m_ix\rvert<\delta\}$`（assembly.tex:181-182）里的膨胀 `$2D_\ast$` 服务于闭事件 `$W(s)\in\overline{D_\ast D}$`（brownian.tex:109）落进开集，靠的是 `$\overline{D_\ast D}\subset2D_\ast D$`（brownian.tex:113-114），凸集含 `$0$` 内点给出 `$\overline D\subset2D$`；半阈 slab `$\lvert m_iW(s)\rvert\le\frac\delta2$` 落进开 slab `$\lvert m_ix\rvert<\delta$`（brownian.tex:110, 114-115），`$\frac\delta2$` 里的 `$\frac12$` 也是同一笔开闭切换的钱。两处 `$\frac12$` 都能改成就 `$\frac{1-\epsilon}2$` 形式，但 `$C$` 只放大不缩小，我退回接受 `$C=\frac{2D_\ast A_0}\sigma$` 的弱界闭合。

## 19 Bergström 侧的不等式与 η 的收紧

历史侧 Ambrus--Heck 的化简读出来是两条不等式（introduction.tex:121-125）：范数侧 `$1-\varepsilon\le\lVert v_i\rVert\le1$`，`$0<\varepsilon\le1$` 与 `$d$` 无关；比较侧把前缀对准比例份额 `$\frac kN\sum_{i\le N}v_i$`，界形如 `$\bigl\lVert\sum_{i\le k}v_{\pi(i)}-\frac kN\sum_{i\le N}v_i\bigr\rVert\le C'\sqrt d$` 的阶。我一度以为符号定理必须继承下界 `$\lVert v_i\rVert_2\ge1-\varepsilon$`，把 assembly 与 introduction 来回走了两遍才确认：全文没有一处用到它。输入侧只有 `$\lVert v_i\rVert_2\le1$`（assembly.tex:117-118）；零向量走 `$b_i=0$` 支，`$\eta_i=\frac12$`、`$C_i=I_d$`（assembly.tex:129）；`$\lVert b_i\rVert_2\le\sigma\le\frac12$` 使 `$\sqrt{1-\lVert b_i\rVert_2^2}\ge\sqrt{1-\sigma^2}\ge\frac{\sqrt3}2\approx0.866$`，`$\eta_i\le\frac1{1+\sqrt3/2}\approx0.5359$`。比例项在零和输入下塌成 `$\frac kN\sum v_i=0$`，我们给的是免 `$\varepsilon$`、免非零和的更强形态。两个表述谁推出谁，我没核验，tex 只写了 Theorem 7 的化简方向，其余标 [推测]。

`$\eta_i$` 出现在两处并自我抵消：系数恒等式 `$x_{d+i}=\eta_ib_i^\top R_{i-1}x+\varepsilon_i$`（assembly.tex:218-220）代入递推得 `$R_tx=(I-\eta_tb_tb_t^\top)R_{t-1}x+b_t(\eta_tb_t^\top R_{t-1}x+\varepsilon_t)=R_{t-1}x+\varepsilon_tb_t$`（assembly.tex:231-236），`$\eta_t$` 的两份贡献 `$-\eta_tb_t(b_t^\top R_{t-1}x)$` 与 `$+\eta_tb_t(b_t^\top R_{t-1}x)$` 精确相消，剩下 `$\varepsilon_tb_t$`，迭代到 `$R_tx=\sum_{i\le t}\varepsilon_ib_i$`（assembly.tex:239）。`$\eta_i$` 消掉之后，`$\sigma$` 预算里唯一残留是 `$\eta_i^2$`。

`$\eta_i\le1$` 是我最初以为无法改进的界，也是这节唯一算出来的便宜。把 `$t=\lVert b_i\rVert_2^2\le\sigma^2\approx3.2\times10^{-7}$` 展开：`$\eta_i=\frac1{1+\sqrt{1-t}}=\frac12+\frac t8+O(t^2)$`，`$\eta_i^2\le\frac14+o(1)$`，列预算 `$\lVert Me_{d+j}\rVert_2^2=\sum_{i=j+1}^n\eta_i^2(b_i^\top r_{i-1})^2\le(\frac14+o(1))\sigma^2$` 比 assembly.tex:165-169 的 `$\sigma^2$` 好 `$4$` 倍。带回 `$\pi^2\delta^{-2}\sigma^2\le\frac{\kappa^2}2$`，`$\sigma\le\frac{\kappa\delta}{\sqrt2\pi}$` 松弛为 `$\sigma\le\frac{\sqrt2\,\kappa\delta}\pi$`，即 `$\sigma$` 可翻倍、`$C=\frac{2D_\ast A_0}\sigma$` 减半，`$\lVert b_i\rVert_2\le\sigma\le1.1\times10^{-3}<\frac12$` 仍容得下。我停下来没做：`$O(t^2)$` 项在加权 `$\sum_{i=1}^nm_iQm_i^\top$` 里的符号我没逐行核验，且 `$D_\ast$`、`$H_0$` 都未数值化，省下的 `$2$` 倍淹没在 `$10^{5}$` 阶里。[推测] 我猜 tex 用 `$\eta_i\le1$` 是故意留 slack。

自适应平移一侧的配套不等式：`$q_i=\operatorname{clip}_\delta(m_ix^{(i-1)})\in[-\delta,\delta]$`（assembly.tex:202-207）要求因果性 `$m_i$` 只读 `$x_{d+1},\ldots,x_{d+i-1}$`，而 `$x_{d+j}$`（`$j<i$`）赋值后不再变，故 `$m_ix^{(i-1)}=m_ix$`（assembly.tex:211-214）；终值在 `$K$` 内给出 `$\lvert m_ix\rvert<\delta$`，clip 失效，`$q_i$` 就是 `$m_ix$` 本身。clipping 是保险丝，因果性把保险丝熔断的代价降为零。

## 20 欧氏指数与一般赋范指数的差别

把历史线按 `$d$` 的指数排一排：任意范数下的重排界是 `$d$` 倍单位球，`$\sum_{i\le k}v_{\pi(i)}\in d\,B$`（Grinberg--Sevast'yanov，introduction.tex:115-116）；欧氏符号指派是 `$C\sqrt d$`（introduction.tex:16），指数 `$\frac12$`；Banaszczyk 给 `$O(\sqrt d+\sqrt{\log N})$`（introduction.tex:130），长度项 `$\sqrt{\log N}$` 在 `$N$` 无界时不消失；Dutta--Jha--Jiang 的高效界主项 `$d^{1/4}\log^{7/4}N$`（introduction.tex:134），`$\log N\ge d^{1/7}$` 时 `$d^{1/4}\log^{7/4}N\ge d^{1/2}$`（把隐藏常数当 `$1$` 看，[推测]）；`$\ell_p$` 族是 `$Cd^{\max\{1/p,1-1/p\}}$`（consequences.tex:16）。欧氏对一般的指数差就是 `$1-\frac12=\frac12$`。

`$p$` 扫描下顶点在 `$2$`：`$1\le p\le2$` 段指数 `$\max\{\frac1p,1-\frac1p\}=\frac1p$`，`$2\le p\le\infty$` 段取 `$1-\frac1p$`，`$p=1$` 给 `$d^{1}$`、`$p=\infty$` 给 `$Cd$`（consequences.tex:50）、`$p=2$` 给 `$d^{1/2}$`；下界侧 `$1\le p\le2$` 时两问的阶都是 `$d^{1/p}$`，最差情形分别到 `$d^{1/p}$` 与 `$\frac13d^{1/p}$`（consequences.tex:27-31）。`$p=1$` 的 `$d^{1/p}=d$` 与 Grinberg--Sevast'yanov 的 `$d$` 对上号，说明指数 `$1$` 在 `$\ell_1$` 里是真饱和。

`$\ell_p$` 界怎么从 `$\sqrt d$` 搬来：两组范数比较，`$1\le p\le2$` 用 `$\lVert x\rVert_2\le\lVert x\rVert_p\le d^{\frac1p-\frac12}\lVert x\rVert_2$`（consequences.tex:36-38），直接套定理得 `$Cd^{\frac1p-\frac12}\cdot\sqrt d=Cd^{1/p}$`；`$2\le p\le\infty$` 用 `$\lVert x\rVert_p\le\lVert x\rVert_2\le d^{\frac12-\frac1p}\lVert x\rVert_p$`（consequences.tex:43-45），输入除 `$d^{\frac12-\frac1p}$` 再乘回，得 `$Cd^{\frac12+(1-\frac1p)-\frac12}=Cd^{1-\frac1p}$`。两次都是线性代数级的比较，内积结构原封保留。

断点在哪我试过定位：`$R_tR_t^\top=I_d$`（matrix.tex:23）、`$L_t=C_tL_{t-1}C_t^\top+Q_{d+t,d+t}b_tb_t^\top$`（matrix.tex:25-27）、`$\sum_t\ell_t=\tr L_0+\sum_tg_t-\tr L_n\le\tr Q$`（matrix.tex:38-41）、`$\mathbb E\lVert F_tU(\tau)\rVert^2=\tr f_0(X_t)^2\le4k_t$`（survival.tex:120-121）、`$\operatorname{Cov}(U(\tau),U(\sigma))=e^{-Q\lvert\tau-\sigma\rvert}$`（survival.tex:25），全篇货币是内积、转置、迹、高斯这四个词，一般 Banach 空间里没有对应物。我最初想把 `$\sqrt d$` 经 John 接触型不等式（`$B_K\subset c\sqrt d\,B_2^d\subset cd\,B_K$` 量级的包含）搬到任意对称范数，复合结果是 `$C\sqrt d\cdot\sqrt d=Cd$`，只重新撞上 Grinberg--Sevast'yanov 的 `$d$`，指数上零收获 [外部推断，tex 未提 John]。

Li 的终端平衡（introduction.tex:141-147）是量词差一个高度的例子：`$\lVert\sum_{i\le N}\varepsilon_iv_i\rVert_\infty\le c_0$` 只管末和，一条前缀换算 `$\lVert\cdot\rVert_2\le c_0\sqrt d$` 只需 `$\sqrt d$` 阶，对 `$N+1$` 条前缀各用一次就是 `$N+1$` 组各自独立的 `$\varepsilon^{(k)}$`；我最初想归纳粘合，从 `$k-1$` 到 `$k$` 翻 `$\varepsilon_i$` 会让所有 `$j\ge i$` 的前缀移动 `$2v_i$`，累计 `$\sum_i\lVert 2v_i\rVert_2\le2N$`，界退化出 `$N$`。本文要的是同一组 `$\varepsilon$` 同时控制全前缀族（introduction.tex:18-19），这条差距 `$2N$` 对 `$C\sqrt d$`，正是 `$O(\sqrt d+\sqrt{\log N})$` 里 `$\sqrt{\log N}$` 尾巴被完全消掉所付的构造费。

## 21 半径、覆盖计数与存活概率

signing 的几何是一串半径不等式。抬升 `$B=\{(y,s):y+se\in K,\ \lvert s\rvert<\ell\}$` 取 `$\ell=\frac52$`（signing.tex:19, 171-174），纤维长 `$L(y)=\lvert I_y\rvert$` 在 `$D_s=\{y:L(y)>2s\}$` 上为正（signing.tex:191-193），`$0<b\le\ell$`（signing.tex:195）。目标纤维 `$D_1$` 要求 `$L(y)>2$`：写 `$I_y=(a,b_0)$`，取 `$c\in(a+1,b_0-1)$` 有 `$[c-1,c+1]\subset I_y$` 与 `$\lvert c\rvert<\ell-1=\frac32$`（signing.tex:200-204），配 `$\lvert q\rvert\le\delta=\frac14$` 得 `$\lvert c-q\rvert\le\frac32+\frac14=\frac74<2$`（signing.tex:205-206），`$q+1$` 与 `$q-1$` 至少一个进 `$[c-1,c+1]$`。我先按 `$\ell=2$` 试算，`$b\le\ell=2$` 与 `$L>2$` 严格冲突，`$D_1$` 只剩开集边缘，改到 `$\ell=\frac52$` 才留出 `$2<\ell$` 的余量。

均值高度 `$M=\iint\lvert s\rvert\Psi^*(y,s)^2\,dy\,ds$` 的下界是常数账上最紧的一枚：`$M\ge\frac\ell2(1-2\ell\kappa)$`（signing.tex:275），代 `$\kappa=\frac1{100}$`、`$\ell=\frac52$` 得 `$2\ell\kappa=\frac1{20}$`，`$M\ge\frac54\cdot\frac{19}{20}=\frac{19}{16}=1.1875>1$`，再由 `$M<b$` 得 `$b>\frac{19}{16}>1$`，`$D_1$` 非空（signing.tex:277-278）。把 `$M(\ell)=\frac\ell2(1-\frac\ell{50})$` 当二次函数解 `$M>1$`：`$\ell^{2}-50\ell+100<0$`，可行区间 `$\ell\in(25-5\sqrt{21},25+5\sqrt{21})\approx(2.09,47.9)$`，`$\ell=\frac52$` 贴着下沿，slack 只有 `$M-1=\frac3{16}$`；抬升归一 `$(2\ell)^{-1/2}=\frac1{\sqrt5}$`（signing.tex:213）。第 15 节问题一记过 `$\kappa<\frac1{12.5}$` 与 `$\delta<\frac12$` 两条反解，这里 `$\ell$` 的可行下沿 `$2.09$` 是同一元二次式另一侧的根。

能量侧三条：`$\int\lvert\partial_{y_i}\Psi\rvert^2=\int\lvert\partial_if\rvert^2\le\kappa^2$`（signing.tex:216-219）、重排不增 `$\int\lvert\partial_{y_i}\Psi^*\rvert^2\le\kappa^2$`（signing.tex:242-244）、Jensen 收尾 `$h_Q(1)\le h_Q(M)\le\int h_Q(\lvert s\rvert)\rho(s)\,ds\le\kappa^2\tr Q$`（signing.tex:300-304），`$h_Q(s)=\lambda_Q(D_s)$` 单调（`$D_s$` 随 `$s$` 缩）。

slab 半径：`$\delta=\frac14$`，存活区间 `$(-\frac{\delta}2,\frac{\delta}2)=(-\frac18,\frac18)$`，一维 Dirichlet 特征函数 `$\cos(\frac{\pi x}\delta)$`、特征值 `$\frac{\pi^{2}c_i}{\delta^{2}}=16\pi^{2}c_i\approx157.9\,c_i$`，`$c_i=m_iQm_i^\top$`（brownian.tex:124-129）。状态球半径 `$A_0\sqrt d$`（assembly.tex:79）、盒半径 `$B_0>2$`（survival.tex:283）、闭约束半径 `$\lVert R_tU(\tau)\rVert^{2}\le c_1^{2}C_\phi d$` 与 `$\lvert U_j(\tau)\rvert\le2$`（survival.tex:274-278, 301-302）、速率界 `$\lambda_Q\le\lambda_Q^{\mathrm{OU}}+\frac12\tr Q$` 与势下界 `$\frac14x^\top Qx-\frac12\tr Q\ge-\frac12\tr Q$`（survival.tex:43, 66-75）。覆盖计数四叠：时刻 `$1+T\theta$`、盒 `$1+TQ_{jj}$`、能量段 `$C(1+E_\theta(0,n))$`（survival.tex:304-308, 320-324）、谱尺度 `$\Theta\subset[\frac{q_{\min}}4,2q_{\max}]$` 且 `$\sum_{\theta}\theta\le4q_{\max}\le4\tr Q$`（survival.tex:247-250）。链式格位：深度 `$l$` 的代表元 `$\le C4^{l}$` 个（survival.tex:157-159），增量方差 `$v_l=Ck2^{-l/a}$`（`$a=\frac32$`，即 `$2^{-\frac{2l}3}$`），和式 `$\sum_{l\ge1}2^{-\frac l{2a}}(1+\sqrt l)=\sum_{l\ge1}2^{-l/3}(1+\sqrt l)<\infty$`（survival.tex:183-186），极大值工具 `$\mathbb E\max_{i\le M}\lVert G_i\rVert\le2\sqrt{v(\log M+\frac12)}$`（survival.tex:166-169）。类概率端：`$K_j=\frac{2^j}4$`、`$\mathbb P\{S_j>2C_0\sqrt{K_j}+r\}\le e^{-r^{2}/2}$`、单类失败 `$\le\exp\bigl(-\frac{(c_1-2C_0)^{2}K_j}2\bigr)$`、`$A=\frac{(c_1-2C_0)^{2}}8\ge\log3$`、`$\sum_{j\ge0}e^{-A2^{j}}\le\frac{e^{-A}}{1-e^{-A}}\le\frac12$`（survival.tex:210-228），`$c_1\ge2C_0+\sqrt{8\log3}\approx2C_0+2.96$` 是我从 `$A\ge\log3$` 反解的数值 [推测]，tex 只说 `$c_1$` 取够大。

严格内嵌的宽度我第一版没算够：`$\mathbb E\lVert F_tU(\tau)\rVert^{2}\le8k\le8K_j$`（survival.tex:119-122）只管期望，Markov 只给 `$\mathbb P\{S_j\le2C_0\sqrt{K_j}\}\ge\frac12$`（survival.tex:208-209），剩下的 `$\frac12$` 要靠 Borell 放大 `$\mathbb P\{S_j>2C_0\sqrt{K_j}+r\}\le1-\Phi(r)\le e^{-r^{2}/2}$`（survival.tex:210-215）补成类求和可容。我原本想让 `$c_1$` 直接吃 `$C_0$`（把 `$2C_0$` 吸收掉），随即发现求和被 `$A=\frac{(c_1-2C_0)^2}8$` 控制，`$c_1=2C_0$` 时 `$A=0$`、级数发散，退回 `$c_1>2C_0$` 的弱一步才闭合。格点计数这条线里数不到 `$\mathbb Z^d$`：构造连续，仅有的"格"是 dyadic 时间网格与深度 `$l$` 的 `$C4^{l}$` 代表元；体积只作为 prefactor `$\lVert p_Q(1,x,\cdot)\rVert_2\,\lvert D\rvert^{1/2}$`（brownian.tex:59-62）露一次面，我因此把"半径、体积、格点数"里的格点一项标 [信息不足]：tex 没有格点计数可用，硬编会越界。

## 22 下界例子与常数的落差

下界例子的全部数字都能手算。单纯形：`$u_i=\sqrt{\frac{d+1}d}(e_i-\frac{\mathbf1}{d+1})$`（`$1\le i\le d+1$`，introduction.tex:56-58），个数 `$d+1$` 严格大于维数 `$d$`（它们住在 `$\mathbf1^\perp\subset\R^{d+1}$` 这个 `$d$` 维超平面里），`$\sum_{i=1}^{d+1}u_i=0$`、`$\langle u_i,u_j\rangle=-\frac1d$`（`$i\ne j$`，introduction.tex:60），平方和归一在这组向量上是 `$\sum_{i\le d+1}\lVert u_i\rVert_2^{2}=d+1$` 与 `$\sum_{i\le d+1}\langle u_i,u_j\rangle=0$` 两条同时成立。任取 `$k$` 个不同成员，`$\bigl\lVert\sum_{i\in I}\ u_i\bigr\rVert_2^{2}=\frac{k(d+1-k)}d$`（introduction.tex:61-62），取 `$k=\lfloor\frac{d+1}2\rfloor$`：`$d$` 奇时值 `$\frac{(d+1)^{2}}{4d}=\frac d4+\frac12+\frac1{4d}$`、`$d$` 偶时值 `$\frac{d+2}4$`，两种都 `$\ge\frac d4$`，开方得 `$\lVert\cdot\rVert_2\ge\frac{\sqrt d}2$`，于是 `$\frac12\sqrt d\le S_2(d)\le C\sqrt d$`（introduction.tex:64-66）。我一开始以为这个例子能把下界常数推过 `$\frac12$`：`$k$` 跑遍 `$1,\ldots,d+1$` 时 `$\frac{k(d+1-k)}d$` 的最大值开方只有 `$\frac{d+1}{2\sqrt d}=\frac12(\sqrt d+\frac1{\sqrt d})$`，除 `$\sqrt d$` 取 `$d\to\infty$` 极限回到 `$\frac12$`，例子的天花板就是 `$\frac12$`，多出项 `$\frac1{2\sqrt d}$` 是有限 `$d$` 的红利，阶层面用不掉。

`$\ell_p$` 下界例子（consequences.tex:52-70）个数翻倍：`$e_1,\ldots,e_d$` 加 `$d$` 份 `$w=-\frac1d(1,\ldots,1)$`，共 `$2d$` 条，零和、`$\lVert w\rVert_p=d^{\frac1p-1}\le1$`（`$p\ge1$`）。任何排列在过完第 `$k=\lfloor\frac d2\rfloor$` 个基向量处，设已出现 `$t$` 份 `$w$`、`$a=\frac td\in[0,1]$`，前缀和 `$s$` 有 `$k$` 个坐标 `$1-a$`、`$d-k$` 个坐标 `$-a$`：`$\lVert s\rVert_p^{p}=k(1-a)^{p}+(d-k)a^{p}\ge\frac d3\bigl((1-a)^{p}+a^{p}\bigr)\ge\frac d3\,2^{1-p}$`（两端用 `$k,d-k\ge\frac d3$` 与凸性在 `$a=\frac12$` 的最小值），开方 `$\lVert s\rVert_p\ge\frac12(\frac{2d}3)^{1/p}\ge\frac13d^{1/p}$`。`$d=1$` 的边角是族 `$(1,-1)$`，任一排列前缀范数 `$1$`（consequences.tex:69-70）。

上下的落差在常数层。第 18 节算出 `$C\gtrsim3.6\times10^{5}\sqrt{2H_0}\,A_0$` 阶，下界占 `$\frac12$`，比值 `$\frac{S_2(d)}{\sqrt d}\in[\frac12,C]$`（introduction.tex:65）的区间宽度至少 `$10^{5}$` 阶 [推测，`$H_0,A_0,c_1,C_\phi$` 四家全未数值化]；colorful 一侧 `$U(\mathcal K)\le2V(\mathcal K)$`、`$V(B_2^d)\le C\sqrt d$` 合成 `$2C\sqrt d$`（consequences.tex:122-126, 93），`$2C$` 的 `$2$` 来自 B\'ar\'any 传递（consequences.tex:126），tex 自己声明这族 `$2C$` 不声称最优（consequences.tex:135-136），取 `$k=1$` 时它退回单纯形例的 `$C\sqrt d$` 阶（consequences.tex:133-134）。我最初想让上下界在常数层对接，比如证明 `$S_2(d)\ge\frac12\sqrt d$` 一侧同时给出 `$C\le1$` 的必要条件，这被 `$k(d+1-k)/d$` 的精确值劝退：例子的作用只锁 `$\sqrt d$` 这个阶（introduction.tex:53），阶以上的一切都是构造的账单，与下界无关。最终思路与开局的差异也在这里收口：开局我以为要找一个"最优常数的 Steinitz 定理"，读完 assembly.tex:244 的 `$C=\frac{2D_\ast A_0}\sigma$` 就明白本文卖出的是 `$\Theta(\sqrt d)$` 的阶，`$\sigma\approx5.6\times10^{-4}$` 这种分母就是定价方式本身。
