# D518 Serre 交汇重数正性猜想的证明笔记

## §0 任务登记与范围界定

这单子要做的，是把 2026 年 9 月 23 日那份署名 OpenAI 的预印本（paper.tex:35-37）背后的思维链重新走一遍。论文标题为 Positivity of Serre's Intersection Multiplicity，正文宣称证明的是 Serre 正性猜想的完整形态，包括分歧混合特征数情形（paper.tex:41-44）。素材只有 build 目录下六个 .tex 文件：paper.tex 1814 字节，sections/introduction.tex 13616 字节，sections/lengths.tex 20080 字节，sections/descent.tex 23107 字节，sections/asymptotic.tex 26631 字节，sections/positivity.tex 25129 字节，合计 118977 字节。PDF 一字未读，typst 分片不作来源，README 只当索引。论文本体没有 Lean 内容，本单也没有 Lean 行，形式化仓库整个不碰。

正文前把全书约定抄录在案（introduction.tex:245-262）：复形按同调方式分次；连通的导出代数指负次同调消失；结合代数上的完美模取右模；系数代数的纯量定位只沿交换底环的中央像做；$K$ 理论一律用完美复形的非连通代数 $K$ 理论，下标 $\mathbb Q$ 表示有理代数化；对序列 $a=(a_1,\ldots,a_r)$，记 $K(a;V)$ 为以 $V$ 为系数的同调 Koszul 复形，$H_i(a;V)$ 为其同调；记号 $a^v$ 指逐分量幂 $(a_1^v,\ldots,a_r^v)$，它生成的理想的 $v$ 次幂是另一个东西；正规化长度允许在 nonzero 模上取零值（这个词我下笔就译：非零模）。再加一条我自己的用词约定：perfectoid 一律写作完美态，alteration 写作变形，idempotent completion 写作幂等完备化，localizing invariant 写作局部化不变量，全文统一。

这几条约定当时看着只是排版层面的洁癖，尤其 $a^v$ 与逐分量幂那一条，我起初完全没理会它的分量；后文 §6 与 §10 里它两次成为论证的承重墙，到 §12 我再回头结算这个差距。

本节末尾，本单两条登记串逐字如下：
preprints/Positivity-of-Serres-Intersection-Multiplicity-September-23-2026
其他队列第 341 行号

## §1 出发点：这个量本身与正性的不自动

先把手上的量写清楚。$(R,\mathfrak m)$ 是交换 Noether 正则局部环，维数 $d$，$M,N$ 是非零有限生成模，$M\otimes_R N$ 有限长。Serre 用 Tor 的 Euler 特征数定义交汇重数
$$\chi^R(M,N)=\sum_{i=0}^{d}(-1)^i\operatorname{length}_R\operatorname{Tor}_i^R(M,N)$$
（introduction.tex:6-9）。支撑条件保证每一项有限，正则性保证高次 Tor 在 $d$ 次以上消失。几何直觉告诉我这东西该是正的：两条子簇在一个点上正当相交，局部交点数就是该点的相交度，怎么数都是正。可代数量是一个交错和，$\operatorname{Tor}_i$ 对 $i\ge 1$ 带负号进来，正文原话是：正性并不能从非零的零次项形式地推出，高次项以交错符号参与（introduction.tex:11-14）。零次项 $\operatorname{length}_R(M\otimes_R N)$ 是正整数没错，但交错和高次项原则上完全有能力把正的贡献抵掉，抵到零这一步没有任何先验的排除理由。

条件 $\dim_R M+\dim_R N=d$ 叫互补维数。比它更小的情形，$\dim M+\dim N<d$，Roberts 与 Gillet--Soulé 独立证明了 $\chi=0$ 的消没定理（introduction.tex:45-48）。也就是说，最难啃的恰好是维数条件取等的边界情形：消没定理在这里失效，Gabber 的非负性只给 $\chi\ge 0$，剩下要排除的是 $\chi=0$ 本身。我最初的猜想形态很朴素：找一个正的加性不变量 $\mu$，让 $\chi\ge\mu$，两边夹死。笔记后面会看到，最后成形的证明完全没走这条夹逼路线，它走的是两层 Galois 平均加一个渐近商范畴（§7、§9、§10）。

## §2 已知版图的边界与分歧问题卡壳处

动手前先把地图钉牢。Serre 的对角线归约把正性在等特征与不分歧（unramified 我写作不分歧，下笔即中文）两种情形都解决了，同一套论证还处理任意完备离散赋值环上的形式幂级数环（introduction.tex:39-44）。这句话信息量很大：连混合特征的分歧离散赋值环基底都覆盖到了，所以单纯的"分歧"本身并没有把已知与未知分开；真正悬着的，是完备混合特征正则局部环上素商模这一格。Roberts 用局部 Chern 特征、Gillet--Soulé 用 Adams 运算给出消没（introduction.tex:45-48）；Gabber 在剩下的混合特征情形用变形与法丛上的交汇计算给出非负性，记载在 Berthelot 的 Bourbaki 报告 6.1.1（introduction.tex:49-52，references.tex:10-15）。消没定理在后面的归约里负责砍掉低维贡献，互补维数情形的严格正性则额外要排除零值。

再往边界内看，分歧混合特征里已知的正性结果有两族。Skalit 证明了底为二维正则局部环、其上本质平滑（essentially smooth 写作本质平滑）的正则局部环情形的正性（introduction.tex:57-58）。KC 与 Soto Levins 处理带 Serre 提升性条件的模：$R=S/(f)$，$S$ 不分歧正则局部环，$f\in\mathfrak m_S\setminus\mathfrak m_S^2$，$M$ 有提升 $L$，即有限 $S$ 模满足 $M=L\otimes_S R$ 且 $\dim S-\dim L=\dim R-\dim M$；他们不要求 $L$ 满足通常提升的 Tor 消没（introduction.tex:59-67）。本论文的主定理这两条都不设。

还有一条我起初最想走的捷径：Bhatt--Hochster--Ma 证明过，若两个商域 $R/P$ 与 $R/Q$ 上都有极限 Cohen--Macaulay 序列，正性成立（introduction.tex:80-82，references.tex:17-23）；Ishiro--Shimomoto 在完备混合特征 Noether 局部整环、剩余类域 $F$ 有限的前提下，从完美态塔造出这样的代数序列（introduction.tex:82-85，references.tex:92-97）。正文把这族路线定性为"经过有限模的条件路线"，并明确主证明不假设任何这样的塔（introduction.tex:85-88）。最后记一笔文献伦理：introduction.tex:30-35 的脚注收录了 2025 年 12 月 9 日 note.com 上一份署名 Editan、Copilot 与 Gemini 的帖子，它宣称同一个素商形态的正性猜想；论文作者的处理是只登记为同范围主张，不承认其为已确立定理。我完全认同这个分寸：对方只给了链接没有可核验正文，任何更重的引用都是给自己造假证据。

## §3 第一条错路：条件路线与不变性幻觉

重建我自己动笔的顺序。手里的杠杆是 Gabber 的 $\chi\ge 0$，要升级到 $\chi>0$，思路无非两类：造一个显式正的下界，或者证明零值会导致矛盾。第一反应是抄 Bhatt--Hochster--Ma 的条件定理，去 $D=R/P$ 与 $E=R/Q$ 上凑极限 Cohen--Macaulay 序列。可是主证明的第一步归约（positivity.tex:22-58，详见 §10）要求把剩余类域扩成代数闭域 $k$，为此要先用残余域扩张引理（lengths.tex:16-31）把环平坦地换成剩余类域为 $\overline k$ 的环。[推测] 我认为这两组假设存在明显张力：Ishiro--Shimomoto 的构造以剩余类域 $F$ 有限为前提，代数闭化的 $k$ 在特征 $p$ 下几乎不可能是 $F$ 有限；而论文的归约又绕不开代数闭化，因为正规化基（lengths.tex:86-98 的 Cohen--Gabber 型引理）就要求 $k$ 完全。论文没有明写它放弃条件路线的失败过程，我给出的只是假设清单之间的冲突，证据到此为止，所以标推测并到此为止。

第二条幻觉更隐蔽，值得整个一节。归约之后我手上有一对 Galois 扩张 $A_D\subset D'$ 与 $A_E\subset E'$，$G_D$、$G_E$ 是两个 Galois 群（positivity.tex:69-96）。自然想法：正规化长度 $\lambda_D$ 定义在 tower 模上，我大概会把 $\chi^R(D,E)$ 通过 $D'$ 上的复形搬到扩张上，再用 Galois 不变性把不变量拉回底下。这套推理默认了 $\lambda_D$ 在扭变 $\sigma\in G_D$ 下不变。扭变的定义（positivity.tex:105-118）改的是 $R$ 经由 $\iota_\sigma:R\to D'\xrightarrow{\sigma}D'$ 作用到 $C_D$ 的方式；模还是那个模，环作用换了。长度函数是从基底 $A_D$ 的参数塔上继承来的，它凭什么对换作用的副本给出同一个值？没有任何理由。论文在两处专门设卡：descent.tex:526-532 的注记声明不需要 $\lambda$ 的 $G$ 不变性，等式只对共轭类求和成立；asymptotic.tex:563-564 在定理陈述里再次写明既不假设 $\lambda$ 的不变性，也不假设两个赋值在单个类上相等。两处重复强调同一个否定，我的读法是作者真在这一点上摔过：先假设不变性做平均，发现平均之外每一步都断，回头把命题强度降为只在轨道和上比较。这直接塑造了 §7 的两层平均结构。

## §4 第二条错路：非一致陷阱与平坦性不足

第三条坑埋在渐近范畴里。我打算把一列有限逼近的 Euler 赋值做成连续量，最省事的做法是拿每个复形的原始同调长度直接除 $s_n$ 取极限。asymptotic.tex:75-87 给出了否决例：取 $A=T$ 为离散赋值环、参数 $z$，规格化数 $s_n=n$，考察 $T/(z^n)$ 的一次秩自由分解 $0\to T\xrightarrow{z^n}T\to0$ 的序列。逐秩为常数 $1$，是 $o(n)$，于是这个序列落在小范畴 $\mathcal N_T$ 里，在商范畴中是零对象；可它的零次原始同调 $T/(z^n)$ 长度是 $n$，规格化后是 $1$。也就是说原始同调长度在商范畴上根本不良定义：代表元变了，值没变零。这个反例强制了正确的施工顺序（asymptotic.tex:9-13）：先在一致支撑的提升上造非负长度，再经由支撑子商与幂等完备化把长度延过去；支撑条件本身也要分前后，在 $\mathcal D_S$ 内是序列上的一致同调支撑，在 $\mathcal P_S$ 内只要求在商之后消失（asymptotic.tex:62-73）。我后来体会到，"支撑可以只在商后出现"与"幂等子的投影不必提升"（asymptotic.tex:7-9）是同一条警告的两个侧面，都是不良定义换马甲。

第四个坑在下降一侧。要把 $K$ 理论类沿有限覆盖 $T\to A$ 压回底侧，需要支撑的有理 $K$ 理论沿这个覆盖下降。有理性转移（rational transfer）只解决有限平坦 faithfully flat 覆盖（descent.tex:161-165 的原话：有理转移给出有限平坦情形）。可是我的覆盖来自正规化基上的整闭包 $A_D\subset D'$：有限、挠-free、 generically separable，未必平坦；正则局部环维数大于 $1$ 时有限挠-free 模不必自由，平坦性没有依据。论文的解法不是硬造平坦，是把覆盖族换大：令 $\tau$ 为由 cdh 覆盖与有限 faithfully flat 覆盖生成的位势（descent.tex:213-218 一带），再证每个有限满射都是 $\tau$ 覆盖（descent.tex:207-250），关键一步是对支配分支 $X_0\to Y$ 用 blow-up 平坦化（descent.tex:230-234，引 Stacks 标签 0815）加低维归纳。配套声明在 descent.tex:252-254：论证只用实际收缩与层的极限，既不要求超下降，也不碰无界下降谱列的收敛问题。我一开始想在"把 $T$ 换成平坦化"上做文章，即先把覆盖平坦化再比长度，这条路后来发现会破坏与系数代数 $H$ 的相容性，因为平坦化改变了支撑条件本身；论文把平坦化放进位势论内部，让函子的层性质替它背书，才算绕干净。

## §5 证明总图：四节的依赖链与真正的定理形态

把成品的骨架先摊开，后面各节逐块填肉。论文四节的顺序是 lengths、descent、asymptotic、positivity（paper.tex:47-51），引言末尾给出的路线图（introduction.tex:172-177）与我的重建一致：lengths 节供应正规化长度的精确输入；descent 节证支撑有理下降与第一个 Euler 比较；asymptotic 节构造秩商范畴及其支撑 Euler 赋值；positivity 节做逼近并完成两次比较。

依赖链上真正承重的结果，我数下来是六个。第一个是正规化长度输入定理（lengths.tex:225-252）：给出 $D$ 代数 $C_D$ 与其上的可加非负长度 $\lambda_D$，对任何参数系 $z$ 与 $v\ge 1$，满足 $\lambda_D H_i(z_1^v,\ldots,z_h^v;C_D)=0$（$i>0$）与 $\lambda_D(C_D/(z^v)C_D)=v^h e((z),D)$，右边正且有限；塔上的有限阶、下确界、上确界三条性质保留，且不要求涉及的子模或覆盖是 $C_D$ 模。第二个是支撑有理下降定理（descent.tex:33-56）：有限满射 $\Spec T\to\Spec A$、$G$ 在几何纤维上可迁时，$\mathbf K^J(H)_\mathbb Q\simeq(\mathbf K^J(H\otimes_A^{\mathbf L}T)_\mathbb Q)^{hG}$，特别地 $K_0$ 有理不变量下降为满射。第三个是常规定长比较引理（descent.tex:427-524）：对支撑于闭点的完美 $T$ 复形 $P$，轨道和 $\sum_{g\in G}\chi_T(g^*P)$ 与 $\sum_{g\in G}\chi_C(g^*P)$ 相等。第四个是渐近赋值命题（asymptotic.tex:181-295）：在 $\mathcal P_T^J$ 上造出同调函子与非负 Euler 赋值，并有 Koszul 多项式恒等式。第五个是渐近范数比较定理（asymptotic.tex:552-584）：同样的轨道和等式在商范畴里成立。第六个是正性主证明里的两个平均（positivity.tex:120-125 与 positivity.tex:566-592）。

终等式的形态值得提前看清。第一层平均把目标量写进轨道和：$\lvert G_D\rvert a_Da_E\chi^R(D,E)=\sum_{\sigma\in G_D}c_\sigma$，于是只要证每个 $c_\sigma>0$。固定 $\sigma$ 后换一条扩张线，第二层平均给出 $\lvert G_E\rvert c_\sigma=\sum_{\gamma\in G_E}b_{\sigma,\gamma}>0$（introduction.tex:144-162 的示意图把这两个接口并排画出来）。两层各用一侧的 Galois 群，两个长度代数 $(C_D,\lambda_D)$ 与 $(C_E,\lambda_E)$ 分别挂在两侧扩张上，互不干涉，也不需要任何一侧的长度对另一侧的群有不变性。引言 164-170 行还点了可复用技术点：带任意连通代数系数的有限满射下降论证，以及模可忽略秩后支撑 Euler 赋值的构造；比较是在商后的幂等直和项上证的，不要求复形在商前就有统一支撑。这句我抄在这里，是为了到 §9 时对照：它正好是对 §4 两个坑的正面回答。

落盘探针行：Edit 追加通道自检，保留不删。

## §6 正规化长度输入：C_D 是怎么长出来的

先问为什么要造这个代数。比较论证需要一族代数，在其上参数商有指定的正长度、正次参数 Koszul 同调长度为零（lengths.tex:3-5）；另外 §10 的有限逼近要求这个长度定义在平展塔上的底层模，连同完整的代数作用都不需要（lengths.tex:5-7 与 lengths.tex:248-251）。分句的资格清单也钉死了：既不分歧也不 Cohen--Macaulay 都不用假设（lengths.tex:8-9 一带）。两种特征都得造，因为混合特征环境环的素商自己可能是特征 $p$ 的环，而等特征情形的正性早已是已知定理（lengths.tex:10-13）。

第一步把剩余类域摆平。残余域扩张引理（lengths.tex:16-79）给完备局部环 $B$ 一个平坦局部扩张 $B\to B'$，理想生成不变、剩余类域换成代数闭包，且对每个有限模与每个 $a\ge 1$ 保持 $\operatorname{length}(V/\mathfrak b^aV)$。等特征走系数领域：$B=k[[X_1,\ldots,X_t]]/I$，换系数再商掉扩张理想，平坦性由变量的局部平坦性判别法给出。混合特征这边我把 Cohen 结构读得很慢：$B=V[[X_1,\ldots,X_t]]/I$，$V$ 是以 $p$ 为一致化元的完备离散赋值环。论文在没有 $k$ 完全这个假设的前提下造扩张赋值环：给一个单代数剩余扩张，把首一不可约多项式升到 $V[X]$，则 $V[X]/(f)$ 在 $V$ 上有限平展、模 $p$ 归约恰是目标域、所有素理想在 $(p)$ 上方，于是它是局部的一维正则环，即离散赋值环，不可分扩张同此（lengths.tex:46-53）。沿耗尽 $\overline k$ 的单扩张塔取并，非零元都是单位乘 $p$ 的整幂，非零理想由最小赋值元素生成，并仍是离散赋值环；取完备化得 $V'$，无挠即平坦（lengths.tex:55-66）。长度保持靠复合列逐层张量化，维数保持来自 Hilbert--Samuel 函数相等，正则性保持是极大理想生成元个数与维数都不变（lengths.tex:70-78）。这条引理看着朴素，实际是第一张多米诺：主归约要 $k$ 代数闭，正规化基要 $k$ 完全，只有这种保长度的平坦扩张能让两者同时到位。

第二步正规化基（lengths.tex:86-110）。特征 $p$ 时是 Cohen--Gabber 定理，给有限且在一般点可分的包含 $A\subseteq D$，$A=k[[t_1,\ldots,t_h]]$。混合特征时取系数环 $W(k)\subseteq D$，把 $p$ 扩成参数系 $p,t_2,\ldots,t_h$，记 $t_1=p$，完备加参数条件让幂级数映射模有限；核为零的论证是纯维数的：源与目标同维 $h$，而正则局部整环的非零理想必降维；分域扩张在特征零自动可分。第三步塔与长度（lengths.tex:112-181）：$A_n=A[t_1^{1/p^n},\ldots,t_h^{1/p^n}]$，$\Lambda=\varinjlim A_n$ 保持不完备，混合特征才另用 $p$ 进完备化 $A_\infty$。每阶都是剩余类域 $k$ 的完备正则局部环，$A_a\to A_b$ 有限平展秩 $p^{(b-a)h}$。在此之上 $\lambda_\infty$ 是 $\mathfrak m_A$ 定幂零化模范畴上的非负可加函数，三条性质：有限展示模下降到某阶的有限长 $A_n$ 模 $V_n$ 且 $\lambda_\infty=p^{-nh}\operatorname{length}_{A_n}(V_n)$；有限生成模的长度是盖它的所有有限展示模长度的下确界；任意模块长度是其有限生成子模的上确界（lengths.tex:128-144）。配套的零长度极限引理说：和、直和、滤过余极限保持长度零，直列 $\lambda_\infty(V_a)\to 0$ 时余极限长度为零、迁移映射不必单（lengths.tex:183-208）。最后这条无单射要求后面在逼近环节被反复引用。

主件是正规化长度输入定理（lengths.tex:225-379）。特征 $p$ 分支：$C_D=D_{\mathrm{perf}}$，塔层 $B_q=\Lambda\otimes_{A^{1/q}}D^{1/q}$；一般点可分给出与纯不可分扩张的线性几乎无关，定位后是域，于是 $B_q$ 嵌套地并出 $C_D$（lengths.tex:259-271）。对 $\mathfrak d$ 准素理想 $H$ 有 $\lambda_\infty(V_q)=q^{-h}\operatorname{length}_D(D/H^{[q]})$，可 $V_q$ 映向 $C_D/HC_D$ 的像未必单，这是我读这一节时撞的第一个硬点：并集层面直接读长度，会低估 $C_D/HC_D$。论文用一个迹分母统一控制核：存在非零 $g\in A$ 使 $gC_D\subseteq B_1$ 且 $g^{1/q}C_D\subseteq B_q$（lengths.tex:280-298）。构造走迹对偶基：取 $K=\operatorname{Frac}(A)$、$L=\operatorname{Frac}(D)$ 的一组落在 $D$ 里的基与对偶基，公共分母 $g$ 让 $g\beta_j$ 回到 $D$；$\Lambda$ 正规（整方程降到某个正规层）加上 $LK'$ 完全，使迹系数都落在 $\Lambda$ 内。核被 $g^{1/q}$ 零化；有限长自同态的核与余核等长，对乘法 $g^{1/q}$ 用一次，得 $\lambda_\infty\ker\le q^{-h}\operatorname{length}D/(H^{[q]},g)=O(q^{-1})$；估计的两根支柱是 $H$ 有 $s$ 个生成元时 $H^{s(q-1)+1}\subseteq H^{[q]}$ 与 $\dim D/(g)\le h-1$（lengths.tex:299-311）。$W_q$ 一致准素扭地并到 $C_D/HC_D$，Hilbert--Kunz 极限存在（Monsky）加零长度极限引理，得 $\lambda_D(C_D/HC_D)=e_{\mathrm{HK}}(H,D)$（lengths.tex:312-320）。参数理想的场合再由 Roberts 的 Frobenius 同限定理（取 Ma 论文 2.4 的形态，原文是 intersection theorems）把正次 Koszul 同调的规格化长度压向零；滤过余极限与同调交换、公零化理想 $(z)$ 让极限引理适用，而 Euler 特征恒等式在除以 $q^h$ 后把剩下的零次长度钉在 $e((z),D)$（lengths.tex:320-346）。这里我特别记下 $z^v$ 逐分量幂与理想幂的区别：定理对每个参数系与每个 $v\ge1$ 逐分量地成立（lengths.tex:232-240），后面支撑验证用的正是逐分量版本。

混合特征分支：$C_D=(D\otimes_A A_\infty)_{\mathrm{perfd}}$，完美态化建在 Bhatt--Scholze 的构造上；选 $g$ 使 $A[1/g]\to D[1/g]$ 有限平展后，Cai--Lee--Ma--Schwede--Tucker 三连发：4.0.4 用几乎理想 $(g)_{\mathrm{perfd}}$ 零化 $A_n\otimes_A D$ 的一切参数系的正 Koszul 同调，4.0.10 让一致 $\mathfrak m_A$ 幂扭的同调长度归零，4.0.14 把参数商长度认成 Hilbert--Samuel 重数（lengths.tex:348-370）。塔不完备的版本通过限制标量回到 $\Lambda$（lengths.tex:145-147 与 369-370）。收尾推论（lengths.tex:386-414）供末端使用：对有限长 $A$ 模 $V$，$\lambda_D\operatorname{Tor}_i^A(V,C_D)=0$（$i>0$）、$\lambda_D(V\otimes_A C_D)=r\operatorname{length}_A(V)$，且 $\lambda_D(C_D/\mathfrak dC_D)>0$。严格正性的证法我喜欢：张量复合列得 $C_D/HC_D$ 的滤过，因子是 $C_D/\mathfrak dC_D$ 的商，右正合够了、不必单，于是 $0<e(H,D)\le\operatorname{length}_D(D/H)\cdot\lambda_D(C_D/\mathfrak dC_D)$，一个正量被有限量除过去就给出下界。

## §7 第一次平均：把目标量塞进 Galois 轨道和

归约引理（positivity.tex:12-58）先把问题压成标准形。等特征直接引 Serre 定理收工，剩剩余类特征 $p>0$；完备化接残余域扩张，把环境环换成代数闭剩余域 $k$ 的完备正则局部环，平坦局部扩张保有限长（复合列化为以 $R_1/\mathfrak m_{R_1}$ 为因子的滤过）、保 Hilbert--Samuel 函数因而保维数、保正则性。然后对 $M,N$ 取素滤过：因子对的张量仍有限长（支撑只会变小），Euler 特征可加，Roberts--Gillet--Soulé 消没（positivity.tex:39-44）砍掉一切维数和小于 $d$ 的对，两边滤过各自至少剩一个顶维因子，对每个剩余对证严格正即对 $M,N$ 证严格正。零维对 $\chi^R(k,R)=\operatorname{length}_R(k)=1$ 白送，故可设 $h,l>0$，$P+Q$ 准素于极大理想。这一段没有任何新数学，价值全在把 $k$ 摆成代数闭，好让下一步的整闭包只有一个局部因子。

固定 $D=R/P$、$E=R/Q$ 后，沿 lengths.tex:86-110 取正规化基 $A_D\subset D$、$A_E\subset E$，再在各自分域的有限 Galois 闭包中取整闭包 $D'$、$E'$（positivity.tex:69-81）。三个技术断言都短：excellence 保有限；完备局部环上的有限整环代数只有一个局部因子（Stacks 03QH）；剩余类域是 $k$ 的有限扩张因而还是 $k$。几何纤维上的可迁性我用一段一段复述：对 $\Omega$ 代数闭的 $A$ 域，$S=T\otimes_A\Omega$ 中任意元的范数 $\prod_{g\in G}g(u)$ 是标量，因为多项式系数落在 $T^G=A$ 里；若 $S$ 的艺术环结构有多个轨道的点，乘积分解给出非平凡不变幂等元 $e$，其范数是 $e^{|G|}=e$ 又是标量，矛盾（positivity.tex:84-96）。至此下降定理的假设全部就位。

选长度代数时有一处容易被快读漏掉的约定：$(C_D,\lambda_D)$ 取在 $D'$ 上、$(C_E,\lambda_E)$ 取在 $E'$ 上，选定后全程不动（positivity.tex:98-103）。对 $\sigma\in G_D$，扭变 $\iota_\sigma:R\to D'\xrightarrow{\sigma}D'$ 给 $C_D$ 换 $R$ 作用，令
$$c_\sigma=\sum_{i=0}^{d}(-1)^i\operatorname{length}\text{侧的}\lambda_D\bigl(\operatorname{Tor}_i^R(C_D,E')\bigr)$$
严格照原文是 $c_\sigma=\sum_{i=0}^{d}(-1)^i\lambda_D(\operatorname{Tor}_i^R(C_D,E'))$（positivity.tex:104-118）。第一平均引理（positivity.tex:120-152）的链条：取 $E'$ 的有限 $R$ 平展分解扩到 $D'$ 上有界平展复形；它在闭点外定位后为零，因为 $D'$ 与 $E'$ 的支撑在除去 $\mathfrak m_R$ 后不相交，扭变的 $R$ 核仍是 $P$ 所以每个扭变同样支撑；把 descent.tex:427-450 的轨道和等式用上去；对矩阵逐元素施 $\sigma$ 给半线性同构，每个共轭的普通 Euler 值都等于 $\chi^R(D',E')$；$D'$ 上与 $R$ 上的普通长度相等，因为剩余类域同为 $k$。剩下是把 $\chi^R(D',E')$ 换算回 $\chi^R(D,E)$：取单射 $D^{a_D}\to D'$ 余核挠，其维数小于 $h$，与 $E'$ 的交汇特征按消没定理为零，可加性给 $\chi^R(D',E')=a_D\chi^R(D,E')$，$E$ 侧同理，得
$$\lvert G_D\rvert\,a_Da_E\,\chi^R(D,E)=\sum_{\sigma\in G_D}c_\sigma$$
（positivity.tex:122-124、142-151）。系数 $\lvert G_D\rvert a_Da_E$ 全正，于是目标降为：每个 $c_\sigma$ 严格为正。

至此我只把一半的比较用掉了。另一半的结构在引言的示意图里已经画好（introduction.tex:144-162）：对固定 $\sigma$，在另一侧扩张 $A_E\subset E'$ 上再做一次平均，把 $c_\sigma$ 写成 $\lvert G_E\vert$ 个赋值 $b_{\sigma,\gamma}$ 的和；这些 $b$ 由 $C_E$ 赋值，全部非负，且每一个都严格正。两层平均、两个互不相干的长度代数、零不变性假设，这就是 §3 里那次幻灭换来的正确形态。接下来两节先把比较机器本身拆开。

## §8 支撑有理下降：从截断不变量到轨道和等式

下降这一节的战略意图写在开头（descent.tex:4-12）：用支撑的有理 $K$ 理论比较普通 Euler 长度与正规化 Euler 长度；打法是先证两个赋值在从底下拉回的类上相等，再证共轭类之和来自底下的有理类；后半句就是下降定理本身。系数代数 $H$ 保持连通是刻意的，因为 §9 要把同一台定理用在商掉可忽略秩的序列范畴上，那边的系数恰好是连通的（descent.tex:10-12）。范畴记号：$\operatorname{Perf}_J(H\otimes_A^{\mathbf L}B)$ 是中心定位在 $V(JB)$ 外消失的完美模，配非连通 $K$ 理论谱 $\mathbf K^J(-)$ 与其 $\pi_0$（descent.tex:17-31）。定理陈述（descent.tex:33-56）假设 $A$ 是 Noether 交换 $\mathbb Z_{(p)}$ 代数、$J$ 含 $p$、$T$ 有限交换 $A$ 代数带 $G$ 作用、$\Spec T\to\Spec A$ 满且 $G$ 在每根几何纤维上可迁，结论是谱级等价 $\mathbf K^J(H)_\mathbb Q\simeq(\mathbf K^J(H\otimes_A^{\mathbf L}T)_\mathbb Q)^{hG}$ 与 $K_0$ 级满射。陈述后的免责条款（descent.tex:58-61）我读了两遍：不需平坦、不需 tame 分歧、$H$ 可以非交换、可以在正次无上界，唯独连通性不能丢。

不变量这边的工程是 Land--Tamme 机器的转接。截断的局部化不变量指在连通结合代数上取值不因换到 $\pi_0$ 而变的那类；有理无穷 $K$ 理论 $I(U)=\operatorname{fib}(\mathbf K(U)_\mathbb Q\to\operatorname{HN}(U\otimes\mathbb Q/\mathbb Q))$ 由 Goodwillie 的相对比较定理保证截断（descent.tex:63-83）。然后构造本节的专用不变量 $E(U)=\operatorname{fib}(\mathbf K(U)_\mathbb Q\to\mathbf K(U[1/p])_\mathbb Q)$（descent.tex:88-93）。它的截断性有一条我起初没看出必要的论证：两个特征标映射的负循环同调项天然相同，因为 $U\otimes\mathbb Q\simeq U[1/p]\otimes\mathbb Q$，取纤维方图得 $E\simeq\operatorname{fib}(I(U)\to I(U[1/p]))$（descent.tex:94-101）。论文明确警告这条路没有把 $\mathbf K(U)_\mathbb Q$ 认成 $\mathbf K(U\otimes\mathbb Q)$（descent.tex:103-104），这句话是防读者（也是防未来的我）顺手把有理化的 $K$ 理论塞回来。与 $H$ 张量保局部化保截断，$\pi_0(H\otimes^{\mathbf L}B)=\pi_0(H)\otimes_A\pi_0(B)$（descent.tex:106-113），支撑函子 $\mathcal L(Y)=\operatorname{fib}(E(Y;H)\to E(Y\setminus Z_Y;H))$ 随之有 cdh 下降（descent.tex:114-125）。真正的识别引在 $p\in J$：支撑在逆 $p$ 后消失，展开两层纤维、用完美复形定位，得 $\mathcal L(Y)\simeq\mathbf K(\operatorname{Perf}_{Z_Y}(H_Y))_\mathbb Q$，货真价实的支撑有理 $K$ 理论，cdh 只是过桥的脚手架（descent.tex:127-135）。几何定位的输入是 Thomason--Trobaugh 的完美定位定理，再用车轮引理把系数版本拼出来，非连通 $K$ 理论把正合序列送成纤维列靠 Blumberg--Gepner--Tabuada（descent.tex:149-156）。支撑条件的范畴学辨认也补了一笔：$P$ 完美、$z$ 中心时，紧性把自同态谱的定位认成 $P[1/z]$ 的自同态谱，于是 $P[1/z]=0$ 当且仅当某幂 $z^v$ 零化恒等态射（descent.tex:137-147），这就是 §9 里两种支撑记号互通的根据。

下降族的问题是 cdh 覆盖与有限 faithfully flat 覆盖之外还有没有别的人。引理一（descent.tex:167-205）处理有限忠实平坦：限制标量给出转移映射 $\operatorname{tr}_f$，与拉回复合等于张量 $f_*\mathcal O_X$；局部该向量丛自由、秩 $a>0$，选平凡化后复合就是乘 $a$，且在整张预层图上自然；有理化后 $a^{-1}\operatorname{tr}_f$ 让 $\mathcal L$ 成为 $\mathcal L_X$ 的收缩；换到 $X$ 上余 Čech 神经有截面、有额外退化，收缩的下降比较跟着是等价；两侧都是 Zariski 层所以能黏合。我最初的替代方案是"只允许平坦覆盖，反正我的 $D'$ 有限挠-free"，但正则局部环维数至少 $2$ 时挠-free 不必平（§4 的坑），这条退路被引理二的构造堵死：把 $\tau$ 取成 cdh 覆盖加有限忠实平坦覆盖生成的位势，再证任意有限满射都是 $\tau$ 覆盖（descent.tex:207-250）。流程是归约到整基、对真闭子集降维归纳：取支配 $Y$ 的既约不可分分支 $X_0$，在密开上有限平坦，对 $\mathcal O_{X_0}$ 做 blow-up 平坦化（Stacks 0815），严格变换在整基上有限满且忠实平坦；blow-up 中心 $Z$ 用归纳假设也是 $\tau$ 覆盖，两个覆盖族合起来穿过 $X$。零维起步：整既约基是域，非零有限代数自动忠实平坦。附注声明只用实际收缩与层极限，超下降与无界下降谱列都不欠（descent.tex:252-254）。

定理本身的证明是几何轨道论证（descent.tex:256-372），结构我想清楚了就很简单：先用有限满射下降到余 Čech 神经各项上，那里拉回的覆盖自带截面；再对 $\dim Y$ 归纳。截面 $s:Y\to X\times_S Y$ 的有限个 $G$ 平移在点上覆盖源，理由就是几何纤维可迁；每个平移是闭浸入并经过 $V=(X\times_S Y)_{\mathrm{red}}$；留下互异的平移、用可迁有限 $G$ 集 $I$ 编号；两个不同平移的重合子是 $Y$ 的真闭子概形（整既约上一般点相等则处处相等），其既约并为 $Z$。把 $q:W=\coprod_I Y\to V$ 拿出来：在 $Y\setminus Z$ 上像互不相交且铺满 $V$，所以 $q$ 是改正、配一个 $G$ 等变的抽象 blow-up 方。关键识别：$\mathcal L(W)\simeq\prod_I\mathcal L(Y)$ 上的 $G$ 作用就是置换作用，稳定子在所属副本上恒等（截面系数的自然性保证没有扭曲），有理谱上对有限群取不变量正合，故 $\mathcal L(W)^{hG}\simeq\mathcal L(Y)$；这一步连有界性都不用，因为平凡 $\mathbb Q[G_s]$ 模 $\mathbb Q$ 投影（descent.tex:339-343）。对 $Z$ 用归纳假设、对 $W$ 用置换识别，blow-up 方的纤维积拼回 $\mathcal L(V)^{hG}\simeq\mathcal L(Y)$，既约化换回原像，零维起步。取 $Y=S$ 即谱等价，$K_0$ 满射顺带升级为同构（descent.tex:365-371）。

机器的出口是常规定长比较引理（descent.tex:427-524）。输入：完备正则局部底 $(A,\mathfrak m_A,k)$、$T$ 有限局部整环扩张同剩余域、$r=\operatorname{rank}_A T$、$C$ 带长度满足长度契约 $\lambda H_i(z^v;C)=0$（$i>0$）与 $\lambda(C/(z^v)C)=v^e r$（descent.tex:377-396，契约由 §6 定理供给）。两个赋值 $\chi_T(P)=\sum_i(-1)^i\operatorname{length}_T H_i(P)$ 与 $\chi_C(P)=\sum_i(-1)^i\lambda H_i(P\otimes_T^{\mathbf L}C)$ 的有限性不是白来的：支撑判据给出统一的 $v$ 使每个 $z_j^v$ 在 $P$ 上零伦，拆锥得 $K_v\otimes_T P\otimes_T C\simeq\bigoplus_j(P\otimes_T C)[j]^{\binom ej}$（descent.tex:460-466）；先取 Koszul 同调则谱列项长有限由契约保证，再借分解与非负性回推 $H_i(P\otimes_T C)$ 的有限。在从 $A$ 拉回的类上双方都等于 $r$ 倍的底下 Euler 和：归一化侧用超 Tor 谱列加有限长基变换引理（descent.tex:398-420，Koszul 分解 $k$、对复合列归纳、连接映象入零次的像长为零），普通侧用 $A$ 正则给 $T$ 的有限平展分解、交错秩 $r$、$T$ 长等于 $A$ 长（剩余域同为 $k$）（descent.tex:482-516）。两边在拉回子空间上重合后，定理把不变类都从底下来，轨道和 $\sum_g[g^*P]$ 恰是不变的，等式到手（descent.tex:518-523）。注记收尾再钉一次：等式只在轨道和上，个别类不谈，正因如此两侧的长度代数可以独立选取（descent.tex:526-532）。

## §9 渐近商范畴：一致支撑、可忽略秩与不提升的幂等子

asymptotic 节的目标是把上一条引理搬到序列范畴的商上（asymptotic.tex:4-5），两个雷区在开篇点名：支撑可以只在商后出现；支撑对象可以是投影提升不回来的幂等直和项，其同调长不能由任意提升的原始同调计算（asymptotic.tex:6-9）。施工顺序因此是先在一致支撑提升上造非负长度，再穿过支撑商与幂等完备化延过去，最后证纯量扩张相容（asymptotic.tex:9-13）。

设定：$(A,J)$ excellence 正则局部 $\mathbb Z_{(p)}$ 代数、$T$ 有限局部整环扩张、$C$ 带满足长度契约的 $\lambda$；固定正整数列 $s_n$ 与正整数集上一个非主超滤 $\mathcal U$；界 $O(s_n)$、$o(s_n)$ 一律指通常极限，超滤只用来给有界列取 $\overline a=\lim_{n\to\mathcal U}a_n/s_n$（asymptotic.tex:15-44）。这个分工我当时琢磨过为什么要两套极限：商范畴的对象性由逐秩 $O/o$ 的通常界决定，而赋值取值要有确定的实数，超滤保证任意有界列都能取到极限而不必预先证收敛；两套极限各管一半，界面干净。范畴侧：$S=A$ 或 $T$，取秩 $a_n=O(s_n)$ 的自由序列加法范畴、态射是矩阵序列的全体，做公共有界度范围内的完美壳再幂等完备化得 $\mathcal D_S$；$\mathcal N_S$ 由秩 $o(s_n)$ 的自由序列生成的厚子范畴；$\mathcal P_S=(\mathcal D_S/\mathcal N_S)^{\natural}$（asymptotic.tex:45-56）。支撑：存在 $v$ 使每个 $z_j^v$ 零化恒等态射，在 $\mathcal D_S$ 里是序列的一致同调支撑、在 $\mathcal P_S$ 里只要求商后消失；两边都厚，因为中心作用幂零在平移、锥、收缩下保持、锥只许加大幂次（asymptotic.tex:58-73）。

支撑子商引理（asymptotic.tex:96-155）是全节的范畴学枢纽，陈述：自然正合函子 $\mathcal S_S/(\mathcal S_S\cap\mathcal N_S)\to\mathcal D_S/\mathcal N_S$ 全忠实，其幂等完备化就是 $\mathcal P_S^J$。证明三步都值得记。第一步说从支撑对象到小对象的任何态射都分解过一个"支撑的小对象"：对每个参数迭代取 $\operatorname{fib}(z_j^v:Y\to Y)$，用 $X$ 上零作用抬 $f$，最后穿过 $K_v\otimes_A Y[-e]$，它按厚度在小范畴里、按 Koszul 同伦在支撑范畴里（asymptotic.tex:107-122）。第二步用屋顶演算证全：给定 $X\xleftarrow{s}Z\xrightarrow{f}Y$ 且 $\operatorname{cofib}(s)\in\mathcal N_S$，把 $X\to\operatorname{cofib}(s)$ 的腿穿过支撑小对象 $N_1$、取纤维 $Z_1$，新屋顶 $X\leftarrow Z_1\to Y$ 整个落在支撑子商里；忠实同理（asymptotic.tex:124-145）。第三步证本质：$X\in\mathcal P_S^J$ 有 $v$ 使零映射的锥分裂，故 $X$ 是 $K_v\otimes X$ 的收缩，后者又是 $q_S(K_v\otimes Y)$ 的收缩，而 $K_v\otimes Y$ 是一致支撑提升（asymptotic.tex:147-154）。我复核时特别注意"$X$ 是 $K_v\otimes X$ 的收缩"这类操作在商范畴的恒等态射上取 $v$，正是"支撑只在商后"的用法样本。

赋值构造（asymptotic.tex:157-295）。两个阿贝尔范畴 $\mathcal A_T$、$\mathcal A_C$：公倍 $J$ 幂零化、长 $O(s_n)$ 的模序列，核、余核、扩张都保持条件；规格化超滤极限长为零的序列成 Serre 子范畴，商掉后得 $\overline{\mathcal A}_T$、$\overline{\mathcal A}_C$ 与其上处处有限的非负可加长度（asymptotic.tex:159-179）。命题给出的同调函子 $\mathsf H_i^{\mathrm{ord}}$、$\mathsf H_i^C$ 在一致支撑提升上就是原始同调序列及其张 $C$，系数 $b_i$ 有限非负、支在公共有界范围，Euler 和给出 $K_0(\mathcal P_T^J)\to\mathbb R$ 的同态（asymptotic.tex:181-219）。证明的三段落对应三种对象：有界自由序列上用 Koszul 分解与先取 Koszul 同调的谱列两侧夹出 $O(s_n)$ 界（asymptotic.tex:226-244）；一般的 $X\in\mathcal S_T$ 可能由非支撑的自由序列 $F$ 收缩而来，就走 $X$ 收缩自 $K_v\otimes X$ 收缩自 $K_v\otimes F$，把界传回来（asymptotic.tex:246-254）；小范畴消灭性用"对该 $v$ 张 Koszul 后同调归零的对象类是厚的"包住 $\mathcal N_T$（asymptotic.tex:256-263）。幂等完备化上的延长只用阿贝尔目标里取像 $\operatorname{im}\mathsf H_i(a)$，明确不要求投影子提升成链映射（asymptotic.tex:268-274），三角保持靠 Balmer--Schlichting：完备化里的特征列是原范畴特征列的收缩（asymptotic.tex:274-279）。多项式恒等式 $(1+t)^e\sum_i b_i(F)t^i=\sum_i t^i\lim_{n\to\mathcal U}\operatorname{len}H_i(K_v\otimes_A F_n)/s_n$ 把两边焊死，且论文明说系数来自同调函子、不是对多项式做形式除法后假设的正（asymptotic.tex:208-219 与 297-301）。

纯量扩张相容（asymptotic.tex:302-459）是技术上最厚的一块。命题：对一切 $X\in\mathcal P_A^J$，$\chi_{\mathrm{ord}}(X\otimes_A^{\mathbf L}T)=r\chi_A(X)=\chi_C(X\otimes_A^{\mathbf L}T)$，对商后幂等子定义的直和项成立、不要求幂等子在定位前提升（asymptotic.tex:337-348）。打法是把两条谱列穿过支撑屋顶下降到长度商、最后才取幂等像。普通侧：固定 $T$ 的有限平展 $A$ 分解 $P_\bullet$（正则性给存在），滤过 $Y\otimes_A P_\bullet$，第一页 $E^1_{u,b}=H_b(Y)\otimes_A P_u$ 对同伦自然，支撑小锥映射在长度商里是同构、于是逐页到有限滤过收束项全部下降；同一 $a$ 在每页与滤过上的像满足 $\operatorname{gr}_u\operatorname{im}(a)=\operatorname{im}(\operatorname{gr}_u a)$， Euler 长得 $\sum_u(-1)^u\operatorname{rank}_A P_u$ 乘 $\sum_b(-1)^b\overline{\operatorname{length}}_A V_b$，前因子按分域上算恰为 $r$（asymptotic.tex:350-424）。归一化侧：超 Tor 谱列 ${}^CE^2_{u,b}=\operatorname{Tor}_u^A(H_b(Y),C)$ 由 $Y$ 的有界 Postnikov 滤过来，$0\le u\le e$、$b$ 有界，不存在无界收敛麻烦；有限 Tor 引理（asymptotic.tex:319-335，不需要完备性，这是它与 §6 推论的差别所在）杀掉正 Tor 行，还顺手给出 $\overline{\mathcal A}_A\to\overline{\mathcal A}_C$ 的正合张量函子：左正合的唯一失效是某个零长正 Tor 模的像（asymptotic.tex:425-458）。

连接下降定理的桥是连通系数引理（asymptotic.tex:461-532）。生成元 $E_S=(S^{s_n})$：若 $a_n\le cs_n$ 逐 $n$ 成立（超出有限项并入 $c$），坐标嵌入投影把 $(S^{a_n})$ 做成 $E_S^c$ 的直和项，于是 $\mathcal D_S\simeq\operatorname{Perf}(B_S)$，$B_S=\prod_n M_{s_n}(S)$。$B_A$ 作为 $A$ 模平展的验证走理想判别：Noether 环的有限生成理想有限展示，积与张量交换逐段注入；$T$ 有限展示让 $B_A\otimes_A^{\mathbf L}T\cong B_T$（asymptotic.tex:482-505）。态射模对 $A$ 平展，Drinfeld 的 dg 商算出导出商，路径生成元全在同调非负次且逐次平展，故 $K$-平展；完美壳加幂等完备化恰好杀 $\mathcal N_A$，取 $H=\operatorname{End}_{\mathcal P_A}(q_AE_A)$ 得连通代数、$\mathcal P_A\simeq\operatorname{Perf}(H)$；$T$ 侧张量过去同构成立，并声明这认的是选定生成元的端代数，任意完美对象平移不算（asymptotic.tex:507-532）。支撑识别：完美模的中心定位是望远镜，紧性给出"逆 $z_j$ 为零当且仅当某幂零化恒等"，与 §8 的判据同源，且比较不需要 $\mathcal P_S^J$ 对象的一致支撑提升（asymptotic.tex:534-543）。最后渐近范数比较定理（asymptotic.tex:552-584）只是把 $\mathcal P_A^J\to(\mathcal P_T^J)^G$ 的 $K_0$ 有理满射（来自 §8）与命题在底下的消失拼起来：$\chi_{\mathrm{ord}}-\chi_C$ 在有理 Grothendieck 群上的扩张在像上为零，作用到不变范数类的原像即得 $\sum_g\chi_{\mathrm{ord}}(gX)=\sum_g\chi_C(gX)$。定理末行照例重申：不假设 $\lambda$ 的 $G$ 不变性，也不假设个别类上两赋值相等（asymptotic.tex:563-564）。

## §10 有限逼近与截断：把 $c_\sigma$ 变成商范畴里的对象

回到 positivity 节，固定 $\sigma$，记 $C=C_D$、$\lambda=\lambda_D$（positivity.tex:154-156）。第一步选参数。要一组 $x_1,\ldots,x_h\in Q$，既在 $R$ 上正则、其像又是 $D$ 的参数系，两个要求同时满足靠联合素避开（positivity.tex:160-173）：设已选 $i-1$ 个，$R/(x_1,\ldots,x_{i-1})$ 的伴随素高度全是 $i-1$（$R$ Cohen--Macaulay），没有一个包含高为 $h\ge i$ 的 $Q$；再把 $D/(x_1,\ldots,x_{i-1})$ 中妨碍下一次参数降维的素逐个避开，这些素像的原像若含 $Q$ 就含 $P+Q$ 只能落在极大理想，与它们正维数矛盾。两层素避都在 $Q$ 内部执行，每步都可行。令 $B=R/(x)$、$I_\sigma=(\iota_\sigma(x_1),\ldots,\iota_\sigma(x_h))D'$、$U=C/I_\sigma C$。$I_\sigma$ 是 $D'$ 的参数理想（有限性与自同构 $\sigma$ 传递该性质），§6 定理给出
$$0<\lambda(U)=e(I_\sigma,D')<\infty,\qquad \lambda(H_q(x;C))=0\ (q>0)$$
（positivity.tex:175-189）。再取定 $a\ge1$ 使 $\mathfrak m_B^a(D'/I_\sigma)=0$，它同时零化 $U$ 与一切 $D'/I_\sigma$ 模（positivity.tex:190-194）。这个 $a$ 是全场唯一的公共消灭子，§11 的正下界全靠它把长度与极小生成数挂钩。

Tor 识别引理（positivity.tex:196-244）把 $\tau_i(L):=\lambda(\operatorname{Tor}_i^B(U,L))$ 认成 $\lambda(\operatorname{Tor}_i^R(C,L))$，并证 $\tau_i(L)=0$（$i>l$），对任意有限 $B$ 模 $L$。前半用换环谱列 $\operatorname{Tor}_p^B(\operatorname{Tor}_q^R(C,B),L)\Rightarrow\operatorname{Tor}_{p+q}^R(C,L)$：$K(x;C)$ 的同调被 $x$ 与 $P$ 联合零化、一致准素扭，正次行长为零因为它们是长零模的有限和的子商，零次行有限因为 $\lambda(U)<\infty$（positivity.tex:206-223）。后半的维度账漂亮，我抄下来当模板：取 $L$ 的 $R$ 平展分解 $P_L$（次数 $0$ 到 $d$），三复形 $K(x;R)\otimes_R C\otimes_R P_L$ 两种算法。先取 Koszul 同调：正次行长零，零次行 $U\otimes_R P_L$，总同调在次数大于 $d$ 时长零。另一方面 $xL=0$ 给出分裂 $K(x;R)\otimes_R^{\mathbf L}L\simeq\bigoplus_{j=0}^h L[j]^{\binom hj}$，衍生张 $C$ 后总次数 $i+h$ 的同调含 $\operatorname{Tor}_i^R(C,L)$ 为直和项；$i>l=d-h$ 时 $i+h>d$，长必为零（positivity.tex:224-244）。两项结论合起来：$\tau_i$ 良定、$\tau_i(L)=0$（$i>l$）、全部有限。

逼近引理（positivity.tex:246-381）是我最想学手艺的一段。难点在 $U$ 没假定了有限生成或有限展示，要造有限长 $B$ 模 $M_n$ 逼近它，还须同时保住塔作用与 $B$ 作用。办法是把两个作用打包进一个代数：$S_j=A_j\otimes_A(D'/I_\sigma)$、$S=\Lambda\otimes_A(D'/I_\sigma)$，$\Lambda$ 作用与 $D'/I_\sigma$ 作用合成 $S$ 作用，下降到 $S_j$ 时 $B$ 作用沿 $B\to D'/I_\sigma$（由 $\iota_\sigma$ 诱导）限制而来，不在有限阶另选 $B$ 作用（positivity.tex:246-272）。$S_j$ 是 Artin 局部环、剩余域 $k$：塔的参数根在 Artin 商 $D'/I_\sigma$ 上幂零，归约后公共剩余域还是 $k$；于是有限 $S_j$ 模的 $B$ 长与 $A_j$ 长相等，复合列因子是 $k$，对两边都是长一（positivity.tex:294-307）。给定 $\epsilon$：先按上确界性质取 $U$ 的有限生成 $S$ 子模 $V$ 使 $\lambda(U/V)<\epsilon$；注意这里用了"Λ-有限生成子模的 $S$-扩张仍 Λ-有限生成"；再取满射 $S^r\to V$、核 $K$，其长被 $r\lambda(S)$ 界住，取有限生成 $S$ 子模 $K_0\subset K$ 使 $\lambda(K/K_0)<\epsilon$，令 $P_\epsilon=S^r/K_0$，则 $P_\epsilon\to U$ 的核与余核长都小于 $\epsilon$，$P_\epsilon$ 对 $S$ 与 $\Lambda$ 有限展示、被 $\mathfrak m_B^a$ 零化（positivity.tex:309-323）。Tor 误差用两条长正合列合并成显式不等式：$|\lambda\operatorname{Tor}_i^B(P_\epsilon,L)-\tau_i(L)|$ 被 $(r_i+r_{i-1})\lambda(K_\epsilon)+(r_{i+1}+r_i)\lambda(W_\epsilon)$ 控制，$r_i(L)$ 是预先固定的 $B$ 平展分解第 $i$ 项秩（positivity.tex:325-341）。最后下降：$P_\epsilon$ 的有限 $S$ 展示降到某 $S_j$ 模 $P_j$，$P_\epsilon=\Lambda\otimes_{A_j}P_j$，平展性给出 $\operatorname{Tor}_i^B(P_\epsilon,L)=\Lambda\otimes_{A_j}\operatorname{Tor}_i^B(P_j,L)$，再由 §6 的正规化公式得 exactly 的等式 $\lambda\operatorname{Tor}_i^B(P_\epsilon,L)=\operatorname{length}_B\operatorname{Tor}_i^B(P_j,L)/s(j)$，$s(j)=p^{jh}$（positivity.tex:343-359）。对角线取 $\epsilon<1/n$、阶 $j\ge n$，令 $M_n=P_j$、$s_n=s(j)$，就得到 $\operatorname{length}_B(M_n)/s_n\to\lambda(U)$ 与 $\operatorname{length}_B\operatorname{Tor}_i^B(M_n,L)/s_n\to\tau_i(L)$（$L=k,E'$，$i\ge0$），公共消灭子 $\mathfrak m_B^aM_n=0$ 一路保住（positivity.tex:274-292 与 360-369）。生成数界：$i=0,L=k$ 的极限定义为 $\nu_\sigma$，极小生成数写 $\beta_0(M_n)$，满射 $(B/\mathfrak m_B^a)^{\beta_0}\to M_n$ 给 $\operatorname{length}_B(M_n)\le\beta_0\operatorname{length}_B(B/\mathfrak m_B^a)$，除极限得
$$\nu_\sigma\ge\frac{\lambda(U)}{\operatorname{length}_B(B/\mathfrak m_B^a)}>0$$
（positivity.tex:285-291 与 371-380）。整个不等式链条里"正"字只在此处出现一次，后面 §11 全靠它输血。

截断（positivity.tex:383-480）把逼近数据装进 §9 的范畴。取 $M_n$ 的极小自由 $B$ 分解 $F_n^\infty$（同调分次、非负），粗暴截断到 $0$ 到 $l$ 次得 $F_n$。极小性加逼近给出逐次秩估计：$\operatorname{rank}_B F_{n,i}^\infty=O(s_n)$ 全域、$o(s_n)$ 当 $i>l$，因为极小分解的秩恰是 $\operatorname{length}_B\operatorname{Tor}_i^B(M_n,k)$（positivity.tex:394-402）。沿 $B\to E\to E'\xrightarrow{\gamma}E'$ 扩标量记 $F_{n,\gamma}'$，商范畴用 $D$ 侧来的 $s_n$ 正规化；§9 对正整数列 $s_n$ 任意取，因此 $A_D$ 与 $A_E$ 两条参数根塔无需任何识别或相容（positivity.tex:404-415）。支撑验证（positivity.tex:417-447）：$\mathfrak m_B^a$ 的每个元素在 $F_n^\infty$ 上零伦（它零化 $M_n$），把选定的同伦限制到截断，唯一的残错在 $l$ 次，是 $F_{n,l}\to F_{n,l+1}^\infty\to F_{n,l}$ 的复合，即经 $F_{n,l+1}^\infty[l]$ 的链映射因子分解，中项秩 $o(s_n)$、在商里为零；恒等式经 $E'$ 扩张后仍在，不需要对 $B$ 平坦。$\mathfrak BE'$ 准素于 $\mathfrak m_{E'}$，群有限，取统一的 $v$ 使每个 $z_j^v$ 落在 $\mathfrak m_B^a$ 的扩张里，写成有限 $E'$ 线性组合就是商中的零作用。普通赋值算回来：先用 $\operatorname{as:koszul}$ 多项式的普通侧把截断换回全分解（尾部次数至少 $l+1$、逐固定次秩 $o(s_n)$，张 $K(z^v;E')$ 后先取 Koszul 同调、用固定的 $\operatorname{length}_{E'}H_q(z^v;E')$ 界住，逐次 $o(s_n)$，长正合列收尾）；全分解上 $z_j^v$ 零伦，Koszul 张量给出带二项重数的平移直和，其底层同调普通长为 $\operatorname{length}_B\operatorname{Tor}_i^B(M_n,E')$，逐元素施 $\gamma$ 是半线性同构故不变；极限经 $\tau_i(E')=\lambda\operatorname{Tor}_i^R(C,E')$ 认回系数，交错和恰为 $c_\sigma$（positivity.tex:449-480）。引理结论：序列 $(F_{n,\gamma}')_n$ 在该范畴支撑于闭点，普通 Euler 赋值对每个 $\gamma$ 都等于 $c_\sigma$（positivity.tex:417-421）。

## §11 第二次赋值：只剩零次项的正性

同一对象换个系数再算一遍，这次用 $C_E$。先备料：$C_E$ 在 $\mathfrak m_{E'}$ 下的残 quotient 长度
$$0<\eta_E:=\lambda_E(C_E/\mathfrak m_{E'}C_E)<\infty$$
（positivity.tex:490-493）。有限性来自满射 $C_E/q_EC_E\twoheadrightarrow C_E/\mathfrak m_{E'}C_E$，$q_E=(z_1,\ldots,z_l)E'$；正性定量写成 $r_E\le t_E\eta_E$，其中 $r_E=\operatorname{rank}_{A_E}E'$、$t_E=\operatorname{length}_{E'}(E'/q_E)$：把 $E'/q_E$ 的复合列右正合地张 $C_E$，滤过因子是 $C_E/\mathfrak m_{E'}C_E$ 的商，每步注入不必有、只需子模像长不超过原长（positivity.tex:494-507）。

赋值引理（positivity.tex:509-564）的陈述是全程最紧的一条不等式链：$C_E$ 赋值 $b_{\sigma,\gamma}$ 满足
$$b_{\sigma,\gamma}\ge\nu_\sigma\eta_E\ge\frac{\lambda_D(U)}{\operatorname{length}_B(B/\mathfrak m_B^a)}\cdot\frac{r_E}{t_E}>0.$$
证明的削减术我很想复用。看二复形 $K(z^v;E')\otimes_{E'}F_{n,\gamma}'\otimes_{E'}C_E$。先取 Koszul 同调：§6 让正次行长度零，剩下行只占复形次数 $0$ 到 $l$，双复合的正规化同调长在总次数大于 $l$ 时为零。而 §9 的多项式恒等式说这些长生成 $(1+t)^l\sum_ib_it^i$，系数 $b_i$ 全非负；有界性与最低次比较排除负次项；若某个 $b_i>0$（$i>0$），乘 $(1+t)^l$ 会在次数 $i+l>l$ 处留下正系数，矛盾。于是只有 $b_0$ 可非零，Euler 赋值就是 $b_0$（positivity.tex:522-540）。零次的下界是纯生成数论证：二复形零次同调形如 $C_E^{\beta_0(M_n)}$ 模去 $\operatorname{im}(d_1)+(z^v)C_E^{\beta_0}$；$l>0$ 保证 $d_1$ 就是 $M_n$ 的一次展示微分，极小性把它的矩阵元素全塞进 $\mathfrak m_B$，任何扭变下像落在 $\mathfrak m_{E'}$，参数幂也在 $\mathfrak m_{E'}$，故有满射 onto $(C_E/\mathfrak m_{E'}C_E)^{\beta_0(M_n)}$，其正规化长至少 $\beta_0(M_n)\eta_E/s_n$；超滤极限配上 §10 的通常极限 $\beta_0/s_n\to\nu_\sigma$，得 $b_0\ge\nu_\sigma\eta_E$，剩下两条就是定义展开（positivity.tex:541-563）。

收尾（positivity.tex:566-592）把三层拼合。对每个 $\sigma$ 走完上述构造，在 $A_E\subset E'$ 上调用渐近范数比较定理：轨道和两侧分别代入普通赋值 $c_\sigma$（每个共轭同值，§10 末引理）与归一化赋值 $b_{\sigma,\gamma}$（每个严格正，本节），得 $\lvert G_E\rvert c_\sigma=\sum_{\gamma\in G_E}b_{\sigma,\gamma}>0$（positivity.tex:571-580）。回代第一平均：$\lvert G_D\rvert a_Da_E\chi^R(D,E)=\lvert G_E\rvert^{-1}\sum_\sigma\sum_\gamma b_{\sigma,\gamma}>0$（positivity.tex:581-587）。群阶与秩全正，$\chi^R(D,E)>0$，归约把定理证完。末段声明与 §3、§7 呼应：两次比较都不需要 $G_D$、$G_E$ 作用在 $C_D$、$C_E$ 上，也不需要任一正规化长度对扭变不变（positivity.tex:590-592）。

## §12 成品与初稿的差距：记号债与思路债一起结算

现在兑现 §0 挂下的两笔账，再算整条思路的总账。

第一笔，$a^v$ 的逐分量约定。我动笔阶段完全没把它当回事，重读才看到它在两处是承重墙。其一是正规化长度输入定理本身：对每个参数系与每个 $v\ge1$ 逐分量成立的消没与正性（lengths.tex:232-240），逼近环节零化的正 Koszul 行、§11 双复形里先取 Koszul 同调那一步，用的都是逐分量幂版本；若误读成理想幂，$H_q(z_1^v,\ldots,z_h^v;C_D)$ 与 $H_q((z)^v;C_D)$ 根本是两个复形。其二是支撑验证：把每个 $z_j^v$ 单独写成 $\mathfrak m_B^a$ 扩张的 $E'$ 线性组合（positivity.tex:440-447），这要求逐元控制，理想幂层面的包含给不出可用的同伦。

第二笔，"正规化长度允许在非零模上取零"。初稿阶段我觉得这不过是定义域的宽容；成品里它其实是一台消没机器：长度零的直和与滤过余极限仍零（lengths.tex:183-208）、Serre 商按超滤长度零切掉（asymptotic.tex:170-175）、小范畴用 $o(s_n)$ 秩生成（asymptotic.tex:49-51）。整个证明的"零"全部由这一个宽容供给，而"正"只有孤零零一处源头，即 §10 末的 $\nu_\sigma>0$。把成品写成不等式链看：$\chi$ 与轨道和之间全是等式搬运，正性输入只在 $\lambda(U)>0$ 除以 $\operatorname{length}_B(B/\mathfrak m_B^a)<\infty$ 这一步。跟我最初设想的"找正下界再夹逼"相比，方向恰好倒转：先构造一个几乎为纯机器输出的赋值，再证明它有一个不可消没的零次分量。

第三笔，双极限分工。渐近范畴用两套极限，界 $O(s_n)$、$o(s_n)$ 走通常极限，赋值走非主超滤（asymptotic.tex:38-44）。初稿阶段我倾向只用超滤统一到底，但对象性（哪些序列属于范畴、哪些是小的）若由超滤判定，"逐秩 $o(s_n)$ 的自由序列张固定 Koszul 后同调逐次有界因而通常极限为零"这类估计就无从下手；两套极限各守一边，恰好互不打架。[推测] 论文没有解释这个设计的取舍过程，我只能从两处引理各自用到哪套极限来反推，证据就是 asymptotic.tex:38-40 的明文分工声明。

[推测] 还有一处我想替论文补的动机：截断为什么恰好截在 $l$ 次。三组数据在同一处咬合：$\tau_i(L)=0$ 对 $i>l$ 成立（positivity.tex:199-203）给出尾部秩 $o(s_n)$；$C_E$ 侧 Koszul 复形幅值恰为 $0$ 到 $l$（positivity.tex:531-534）；商范畴允许把经 $F_{n,l+1}^\infty$ 的错项当作零。截在别的次数，三者至少坏其一。论文按事实执行了这个选择，没有交代发现过程，所以我的反推标作推测。

谱系上，论文自认两处继承：正规化长度构造与另一份同期预印本（Lech 重数猜想方向）的RELATED工作（lengths.tex:219-223，references.tex:156-161）；下降定理沿用 Land--Tamme 的截断不变量框架（descent.tex:63-86）。引言 164-170 行声明可复用的是两点，带连通代数系数的有限满射下降、以及商掉可忽略秩后的支撑 Euler 赋值构造，并且比较在商后的幂等直和项上证。这跟 §4 我摔过的两个坑严丝合缝地对偶：坑的边界就是论文的卖点。

## §13 推论与外围：定理到手后应用变得便宜

正性定理一落定，第一条推论几乎是白捡的。对分歧混合特征正则局部环 $(R,\mathfrak m)$ 与满足 $\sqrt{P+Q}=\mathfrak m$、$\operatorname{ht}P+\operatorname{ht}Q=\dim R$ 的素理想，Kurano--Roberts 的正性到符号幂定理（introduction.tex:181-192，references.tex:117-122）现在给出包含 $P\cap Q^{(r)}\subseteq\mathfrak m^{r+1}$ 对一切 $r\ge1$ 成立，$Q^{(r)}=Q^rR_Q\cap R$；这里分歧的含义是剩余特征 $p\in\mathfrak m^2$。作者特意注明这只是把他们已证定理作为输入的直用，不含自家新成分，这个诚实度我照抄。

第二条推论更见出路的形状：有限严格变换交汇。设 $(A,\mathfrak m)$ 正则局部、剩余域 $k$，$P,Q$ 素、$A/(P+Q)$ 有限长、维数互补，$T=\operatorname{gr}(A/P)\otimes_{\operatorname{gr}A}\operatorname{gr}(A/Q)$，一切分次环按极大理想滤过，则当 $\dim T\le1$ 时 $\chi^A(A/P,A/Q)\ge e_{\mathfrak m}(A/P)\,e_{\mathfrak m}(A/Q)$，等号当且仅当 $\dim T=0$（introduction.tex:200-214）。证明流程（introduction.tex:216-243）：$\dim A=0$ 平凡；否则取闭点 blow-up $\widetilde X$，$\widetilde Y$、$\widetilde Z$ 为真变换，Skalit 引理 3.5 把 $\widetilde Y\cap\widetilde Z$ 的底集认作 $\operatorname{Proj}T$，于是交点集 $S$ 是例外除子上有限多个闭点，空集恰对应 $\dim T=0$；Fulton 的 blow-up 公式拼 Skalit 的有限支撑计算得差值恒等式
$$\chi^A(A/P,A/Q)-e_{\mathfrak m}(A/P)e_{\mathfrak m}(A/Q)=\sum_{x\in S}\lvert\kappa(x):k\rvert\,\chi^{B_x}(M_x,N_x),$$
其中 $B_x$ 是 $\widetilde X$ 在 $x$ 的局部环、$M_x$、$N_x$ 是两条真变换的茎。每个局部环正则（Jannsen 附录命题 A.4(1)），每条茎非零有限、张量有限长、维数由形式等维与 universally catenary 传递（Skalit 引理 3.8 一路），定理把每项打到严格为正，残域扩张次数正有限，和式非负即得；等号当且仅当 $S$ 空。Dutta 对这种有限支撑设定下下界早有研究（introduction.tex:194-198，references.tex:62-66），本推论等于把"正性输入"这一格补全。

我的感想：这两条推论里主定理只干一件事，把局部交点数从"非负"抬到"严格正或零点为空"。昂贵的全部在定理内部；外围应用薄得像纸。这恰好反过来印证正性猜想的地位，Serre 清单里最难的一条正是其他一切的下限。

## §14 复核点与残留风险

自查环节，把重读时核对过的薄弱点列全。其一，$c_\sigma$ 的每一项要求 $\operatorname{Tor}_i^R(C_D,E')$ 落在 $\lambda_D$ 的定义域，即被 $\mathfrak d$ 的某幂零化；正文没有逐字验证这件事，第一平均引理的证词是靠"取 $E'$ 的有限平展分解扩到 $D'$、由下降引理供给有限正规化同调长"整体打包（positivity.tex:127-134），定义域问题隐含在 ds 引理的适用性里。我把这看作行文压缩，数学上不构成洞，但值得记下。其二，第一平均里"$D'$ 上普通长与 $R$ 上普通长相等"依赖剩余域同为 $k$（positivity.tex:138-140 与 descent.tex:512-513 两处呼应），一旦归约环节放弃代数闭化就会断链，这与 §3 的 $F$ 有限难题互为表里。其三，支撑子商引理的第三步里"$X$ 是 $K_v\otimes X$ 的收缩"要求在 $\mathcal P_S$ 的恒等上取 $v$（asymptotic.tex:147-152），是全证明唯一一处支撑只在商后的实质使用，复核时我专门盯住它没有偷用提升。其四，零长度极限引理不需要迁移单射（lengths.tex:191-194），逼近序列 $M_n$ 之间的映射本来就没有相容性要求，$s_n$ 只来自阶的选取。[推测] 论文没有讨论 $\mathcal U$ 的选取是否影响最终数值；从证明看，所有进入轨道和的极限都先被通常极限控制（asymptotic.tex:38-40 的分工声明），我推测超滤只用于保证有界列极限存在、结果与之无关，但这只是我从文本结构反推的读法，没有独立的正文证据。

残留风险也要登记：论文落款日期 2026 年 9 月 23 日，署名 OpenAI（paper.tex:35-37），本笔记只登记文本内部结构，不对其外部验证状态作任何断言；note.com 那份同范围主张（introduction.tex:30-35）依旧只是主张。数学上我目前能确证的只有：文本内部六个 .tex 文件之间的依赖关系自洽，前向引用、记号、量纲都能对上。

## §15 全证明压缩复盘与数值流向

把整条链压成一段，顺便清点全程真正参与数值的量。归约（positivity.tex:12-58）把定理化到域对 $D=R/P$、$E=R/Q$ 与互补维数 $h+l=d$；正规化基与 Galois 闭包给出 $A_D\subset D'$、$A_E\subset E'$ 与群 $G_D$、$G_E$（positivity.tex:60-96）；lengths 的输入定理给出两个长度代数 $(C_D,\lambda_D)$、$(C_E,\lambda_E)$，各自锚在两侧扩张上（positivity.tex:98-103）；第一平均把 $\chi^R(D,E)$ 化成 $\lvert G_D\rvert a_Da_E$ 除过去的 $c_\sigma$ 轨道和（positivity.tex:120-152）；逼近引理把无限生成的 $U=C_D/I_\sigma C_D$ 换成带公共消灭子 $\mathfrak m_B^a$ 的有限 $B$ 模序列 $M_n$、正规化因子 $s_n=p^{jh}$（positivity.tex:246-381）；截断把极小分解的前 $l+1$ 项装进渐近范畴，支撑引理验证普通赋值在每个共轭上都回到 $c_\sigma$（positivity.tex:383-480）；渐近范数比较把 $c_\sigma$ 换成 $\lvert G_E\rvert$ 个 $b_{\sigma,\gamma}$ 的和（asymptotic.tex:552-584）；赋值引理证明每一项严格为正（positivity.tex:509-564）；拼装收尾（positivity.tex:566-592）。

数值流向的账本可以数得出来。塔的秩 $p^{nh}$（lengths.tex:123-124）决定 $s(j)$（positivity.tex:260-262）；参数长度公式里的重数幂次 $v^h$（lengths.tex:237-239）与契约里的 $v^e r$（descent.tex:385-390）负责将有限长换算成正规化刻度；核估计 $O(q^{-1})$（lengths.tex:303-306）是唯一一处显式误差阶；两个平均的系数 $\lvert G_D\rvert a_Da_E$ 与 $\lvert G_E\rvert$（positivity.tex:122-124、576-579）把轨道和折回目标量；下界链 $\lambda(U)\le$ 分子、$\operatorname{length}_B(B/\mathfrak m_B^a)$ 与 $t_E$ 是分母、$r_E$、$\nu_\sigma$、$\eta_E$ 在分子位（positivity.tex:285-291、494-519）。全文真正的严格正性来源只有三处：$\lambda(U)=e(I_\sigma,D')>0$（positivity.tex:184-188），参数重数本身为正；$\lambda_D(C_D/\mathfrak dC_D)>0$ 经 $e(H,D)\le\operatorname{length}_D(D/H)\lambda_D(C_D/\mathfrak dC_D)$ 转写（lengths.tex:405-413）；以及由它派生的 $\eta_E>0$ 与 $r_E\le t_E\eta_E$（positivity.tex:490-503）。除此之外每一步都是等式搬运或极限保持，没有一个额外正量混进来。这个"正性守恒律"是我复盘时最意外的收获：一个以正性命名的定理，证明里正的源头只有三个点，其余全在搬运。

[推测] 论文通篇没有数值例子，连最小的具体环演算都无，我推测理由有三：正性是结构性断言，不需要有效界；例子的计算量会被 $p^{nh}$ 型的塔阶吓退；以及文本体裁是结果通告式长文，引言把证明策略写到图 1 的粒度已是极限。不足在于素材里没有任何关于省略例子的说明，我无法给出更硬的依据。数值上唯一可验证的自检我做了：把 §11 不等式链的量纲顺一遍，$\nu_\sigma$ 每生成元计数除每秩、$\eta_E$ 每 $C_E$ 残 quotient 长度，乘积落在"每秩长度"刻度上，与 $b_{\sigma,\gamma}$ 作为正规化 Euler 值的刻度一致，没有量纲错配。

## §16 符号台账

以下登记表逐行给出全稿命用符号、其数值或增长规律、真实读取位置、消费方与断点。位置栏全部来自本会话的逐次读取，行号以文件实读为准。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\chi^R(M,N)$ | $\sum_{i=0}^{d}(-1)^i\operatorname{length}_R\operatorname{Tor}_i^R(M,N)$ | introduction.tex:6-9 | 主定理与两层平均的共同对象 | positivity.tex:476-478 认不回 $c_\sigma$ |
| $d$、$h$、$l$ | $h+l=d$ 且 $h,l>0$ | positivity.tex:14-17 与 54-57 | 参数选取、$\tau$ 消没、截断次数 | positivity.tex:240-243 维数账错位 |
| $e(I,D)$ | 参数系 $z$ 的 Hilbert--Samuel 重数 | lengths.tex:216-217 | 参数长度 $v^he((z),D)$ | positivity.tex:184-188 的 $0<\lambda(U)$ 断供 |
| $\overline k$ 扩张 | $\operatorname{length}_{B'}((V\otimes_BB')/\mathfrak b'^a)=\operatorname{length}_B(V/\mathfrak b^aV)$ | lengths.tex:22-26 | 归约的代数闭化与维数保持 | positivity.tex:30-35 Hilbert--Samuel 函数对不上 |
| $k$ | 代数闭、特征 $p>0$ | positivity.tex:18-19 | 正规化基、$D'$ 局部性、长度比对 | positivity.tex:138-140 两侧长度不再相等 |
| 消没定理 | $\dim V+\dim W<d$ 时 $\chi=0$ | positivity.tex:39-44 | 滤过砍因子与余核处理 | positivity.tex:142-151 余核不能清零 |
| $A_D\subset D$ | 有限、一般点可分，$k[[t_1,\ldots,t_h]]$ 或 $W(k)[[t_2,\ldots,t_h]]$ | lengths.tex:89-97 | 塔、$C_D$、两个 Galois 扩张 | positivity.tex:60-67 无从建立 |
| $A_n$、$\Lambda$ | $A[t_1^{1/p^n},\ldots,t_h^{1/p^n}]$ 与其余极限 | lengths.tex:114-117 | $\lambda_\infty$ 与 $s(j)$ 的定义域 | positivity.tex:343-359 的正规化无定义 |
| $p^{nh}$ | $\operatorname{rank}_AA_n$ | lengths.tex:123-124 | 有限阶归一化公式 | positivity.tex:353-357 换算因子错 |
| $\lambda_\infty$ 三性质 | 有限阶、下确界、上确界 | lengths.tex:128-144 | 逼近引理的 $\epsilon$ 构造 | positivity.tex:309-323 选不出 $K_0$ |
| 零长度极限 | 和、直和、滤过余极限保零 | lengths.tex:183-195 | 正 Koszul 行清零、Serre 商 | lengths.tex:335-338 末步断链 |
| $C_D$（特征 $p$） | $D_{\mathrm{perf}}=\bigcup_nD^{1/p^n}$ | lengths.tex:258-261 | 准素商长度识别 | lengths.tex:312-316 无对象可并 |
| 导线 $g$ | $g^{1/q}C_D\subseteq B_q$ | lengths.tex:284-286 | 核的单分母控制 | lengths.tex:299-306 核像等长无处施力 |
| $O(q^{-1})$ | $\lambda_\infty\ker(V_q\to W_q)$ 的阶 | lengths.tex:303-306 | 并集 $W_q$ 收敛 | lengths.tex:312-316 识别偏掉 |
| $e_{\mathrm{HK}}(H,D)$ | $\lambda_D(C_D/HC_D)$ 的取值 | lengths.tex:314-316 | 参数幂的乘法规则 | lengths.tex:344-346 交不了棒 |
| Frobenius 同限定理 | $q^{-h}\operatorname{length}H_i(z^q;D)\to0$（$i>0$） | lengths.tex:329-332 | Koszul 消没 lengths.tex:235-236 | §11 正次行清零断链 |
| $C_D$（混合特征） | $(D\otimes_AA_\infty)_{\mathrm{perfd}}$ | lengths.tex:348-354 | 三个 4.0 系列结果 | lengths.tex:359-369 分支失效 |
| 长度契约 | $\lambda H_i(z^v;C)=0$、$\lambda(C/(z^v)C)=v^er$ | descent.tex:385-390 | 有限性与谱列估计 | asymptotic.tex:238-241 无据 |
| $r\operatorname{length}_A(V)$ | $\lambda_D(V\otimes_AC_D)$ 的值 | lengths.tex:389-392 | 底类 Euler 与有限 Tor 引理 | descent.tex:486-490 行清零错 |
| 残正性 | $\lambda_D(C_D/\mathfrak dC_D)>0$ | lengths.tex:393 与 405-413 | $\eta_E$ 下界的母本 | positivity.tex:512-519 末环归零 |
| 下降谱等价 | $\mathbf K^J(H)_\mathbb Q\simeq(\mathbf K^J(H\otimes_A^{\mathbf L}T)_\mathbb Q)^{hG}$ | descent.tex:42-47 | 渐近范数比较的满射 | asymptotic.tex:573-578 取不到原像 |
| $E(U)$ | $\operatorname{fib}(\mathbf K(U)_\mathbb Q\to\mathbf K(U[1/p])_\mathbb Q)$ | descent.tex:88-93 | 截断性与 $\mathcal L$ 构造 | descent.tex:127-133 纤维识别偏 |
| $\mathcal L(Y)$ | 支撑纤维 $\operatorname{fib}(E(Y;H)\to E(Y\setminus Z_Y;H))$ | descent.tex:116-120 | cdh 下降与有限满射下降 | descent.tex:167-250 两引理无主语 |
| $\tau$ 覆盖 | cdh 加有限忠实平坦两类合成 | descent.tex:213-239 | 非平坦有限满射的下降 | descent.tex:275-280 拉不回底下 |
| 置换不变量 | $\mathcal L(W)^{hG}\simeq\mathcal L(Y)$ | descent.tex:333-343 | 抽象 blow-up 方黏合 | descent.tex:345-358 拉回方断 |
| 轨道和等式 | $\sum_g\chi_T(g^*P)=\sum_g\chi_C(g^*P)$ | descent.tex:441-445 | 第一平均 | positivity.tex:122-124 直接断 |
| $K_0$ 满射 | $K_0^J(H)\otimes\mathbb Q\to(K_0^J(H\otimes_A^{\mathbf L}T)\otimes\mathbb Q)^G$ | descent.tex:49-55 | 不变范数类来自底下 | descent.tex:518-523 下降用不上 |
| 非一致反例 | $T/(z^n)$、$s_n=n$、原始长 $1$ | asymptotic.tex:77-85 | 逼出先提升后延长的顺序 | asymptotic.tex:9-13 施工顺序无据 |
| $\mathcal P_S$ | $(\mathcal D_S/\mathcal N_S)^{\natural}$ | asymptotic.tex:45-56 | 渐近节全部范畴承载 | positivity.tex:435-437 的 $o(s_n)$ 杀不掉 |
| 支撑全忠实 | $\mathcal S_S/(\mathcal S_S\cap\mathcal N_S)\to\mathcal P_S^J$ | asymptotic.tex:98-105 | 同调函子下降与延长 | asymptotic.tex:268-279 取像无主语 |
| 超滤 $\mathcal U$ | 非主，只为有界列取极限值 | asymptotic.tex:38-44 | $b_i$ 系数与 Serre 商 | asymptotic.tex:170-175 长度商无法构造 |
| $b_i$ 系数 | 有限非负、支于公共有界范围 | asymptotic.tex:194-204 | §11 的第二次赋值 | positivity.tex:536-540 零次提取失效 |
| Koszul 多项式 | $(1+t)^e\sum_ib_it^i=\sum_it^i\lim_{n\to\mathcal U}\operatorname{len}H_i(K_v\otimes_AF_n)/s_n$ | asymptotic.tex:208-214 | 截断替换与系数比对 | positivity.tex:449-478 两侧认不回 |
| $H$ 连通 | $H=\operatorname{End}_{\mathcal P_A}(q_AE_A)$ | asymptotic.tex:515-518 | 套用下降定理的入场券 | asymptotic.tex:568-572 谱等价无主语 |
| $B_S$ | $\mathcal D_S\simeq\operatorname{Perf}(B_S)$，$B_S=\prod_nM_{s_n}(S)$ | asymptotic.tex:485-491 | dg 商与平展性验证 | asymptotic.tex:500-505 换基同构偏 |
| 渐近范数 | $\sum_g\chi_{\mathrm{ord}}(gX)=\sum_g\chi_C(gX)$ | asymptotic.tex:559-561 | 第二平均 | positivity.tex:571-579 等式断 |
| $c_\sigma$ | $\sum_{i=0}^{d}(-1)^i\lambda_D(\operatorname{Tor}_i^R(C_D,E'))$ | positivity.tex:113-117 | 第一平均的目标量 | §11 下界对象整个错位 |
| 第一平均 | $\lvert G_D\rvert a_Da_E\chi^R(D,E)=\sum_\sigma c_\sigma$ | positivity.tex:122-124 | 终局拼装 | positivity.tex:581-587 系数无源 |
| $U$、$I_\sigma$ | $0<\lambda(U)=e(I_\sigma,D')<\infty$ | positivity.tex:176-188 | $\nu_\sigma$ 的分子 | positivity.tex:286-291 下界归零 |
| $\mathfrak m_B^a$ | 公共消灭子 | positivity.tex:190-194 | 支撑、生成数、残长三处 | positivity.tex:371-380、424-447、548-556 至少断一处 |
| $\tau_i$ | $\tau_i(L)=0$（$i>l$） | positivity.tex:199-203 | 秩估计与截断 | positivity.tex:398-401 的 $o(s_n)$ 失效 |
| $M_n$、$s_n$ | 逐长度与逐 Tor 收敛 | positivity.tex:274-284 | §10 全部构造 | positivity.tex:472-478 序列赋值全塌 |
| $\beta_0(M_n)$ | $\dim_k(M_n/\mathfrak m_BM_n)$，除 $s_n$ 收敛到 $\nu_\sigma$ | positivity.tex:285-287 | 零次满射的计数 | positivity.tex:553-557 残商幂次无据 |
| $\nu_\sigma$ | $\ge\lambda(U)/\operatorname{length}_B(B/\mathfrak m_B^a)>0$ | positivity.tex:285-291 | 全程唯一正量输入 | positivity.tex:512-519 严格性丢失 |
| $\eta_E$、$r_E$、$t_E$ | $r_E\le t_E\eta_E$ | positivity.tex:490-503 | $b$ 的显式下界 | positivity.tex:513-518 末分数无主 |
| $b_{\sigma,\gamma}$ | $b_{\sigma,\gamma}\ge\nu_\sigma\eta_E>0$ | positivity.tex:509-519 | 第二平均 | positivity.tex:576-580 只得不严格正 |
| 第二平均 | $\lvert G_E\rvert c_\sigma=\sum_\gamma b_{\sigma,\gamma}>0$ | positivity.tex:571-580 | 终局 | positivity.tex:581-587 和式不保正 |
| 符号幂包含 | $P\cap Q^{(r)}\subseteq\mathfrak m^{r+1}$（$r\ge1$） | introduction.tex:186-189 | 下游应用 | introduction.tex:181-192 输入缺位 |
| 切锥下界 | $\chi^A(A/P,A/Q)\ge e_{\mathfrak m}(A/P)e_{\mathfrak m}(A/Q)$ | introduction.tex:209-213 | 下游应用 | introduction.tex:226-242 每项可能为零 |

## 勘误

按类别登记如下；依落盘协议，已落盘正文一律不改写、不搬运、不回滚。

一、块量缺陷：首块实测 14175 字节，低于首块两万字节闸门；写盘通道只有一次机会，此缺口不可原地修补，只能如实登记。后续各次追加均未超单次两万五千字节的顶限。

二、术语残留（英文应落笔即中文，此处漏写，登记备查）：§4 可分性形容词一处；§7 优秀性名词一处（excellence 应作优秀环性质）；§8 吹上算子名词多处与驯顺性形容词一处；§13 吹上算子名词两处与万有链环短语一处；§10 英文副词夹句一处；§11 与 §15 残商名词各一处；§11 满射介词一处；§12 大写关联词一处。以上均属类别登记，交由批次清扫通道处理，本人不做任何就地替换。

三、公式排版残留：§7 正文第一条展示式内混入一个多余算子片段与一处中文注记粘连，紧随其后的文字行已给出无歧义的正确式；落盘片段不回改。

四、协议工件：落盘探针一行保留在 §5 末尾与 §6 标题之间，属写盘通道自检痕迹。

五、结构说明：台账位于 §16，为最后一个编号小节；本勘误为不编号附节，依协议追加在台账之后。编号自 §0 至 §16 连续，物理排布与编号顺序一致，前向引用所指小节均真实存在。

六、勘误补记：类别二尚有四处漏登，登记如下。§3 一处塔名词以英文原词混入正文；§4 一处忠实平坦短语与一处吹上名词以英文原词混入；§4 另有一处转移名词首现夹注原文、对译随后给出，按保守口径一并登记。§0 与 §2 的首现术语对译夹注（写出原词随即定译）按惯例不计入残留，若批次口径不同，请一并扫入。正文文件名定位（如以文件名指称某节）属定位所需，不作残留登记。

七、终数补记：收稿前对全文做了一次分词扫描，类别二按词条的最终计数为，塔名词一处、无挠表达两处、忠实平坦短语三处、吹上名词六处、优秀性名词三处、驯顺形容词一处、英文副词一处、残商名词四处、满射介词一处、大写关联词一处、链环短语一处、首现夹注转移名词一处，合计二十四处。本节第二条与第六条的枚举数偏少（无挠表达与优秀性名词两处口径未列全），以本条扫描数为准；类别与位置口径不变，仍交批次清扫通道按类别处理，正文继续零就地替换。
