# 任意箭图的等变上同调 Hikita 猜想：把方案结构守到最后一行的反推笔记

## §0 素材、版式与本单的登记

这一节先把取材面钉死，免得后文哪一句其实是脑补。本单素材目录的实测结构是 build/main.tex 加 build/sections/ 下的八节，另有 build/figures/proof-route.tex 一张流程图，没有 build/source/ 那种分片版式。逐文件字节（ls 复核）：cocharacters.tex 30,098、laurent.tex 20,664、counting.tex 17,921、stable-pairs.tex 17,105、introduction.tex 16,136、correspondences.tex 14,728、preliminaries.tex 13,865、deformations.tex 13,747、main.tex 3,343、figures/proof-route.tex 2,721，合计 150,328 字节，与派单给的总量一致。行数以 wc -l 实测：八节共 3,102 行，main.tex 83 行，proof-route.tex 73 行。

主干位置我先记三条：摘要在 main.tex:48-57，主定理在 sections/introduction.tex:78-89，证明收尾那段在 main.tex:66-80，它把两个同构拼起来并写明所有商环都按方案意义取、幂零元全部保留。proof-route.tex 是被 sections/introduction.tex:290 输入的图，我只把它当"两条任务被分开画"这一点的佐证，不作正文素材来源。

再钉一条口径：本笔记里凡写成 sections/xxx.tex:行号 的位置，都是本会话真的把那些行读进过上下文的内容，落在 main.tex、sections/introduction.tex、sections/preliminaries.tex、sections/cocharacters.tex 以及追加批里读到的几个文件上。sections/counting.tex 与 sections/correspondences.tex 最终没有开窗口，我在 §17 按文件名如实登记未读区间，涉及它们内部机制的句子一律标 [推测]。

登记两条，逐字照抄，日期后缀不动：

- `preprints/The-equivariant-cohomological-Hikita-conjecture-for-arbitrary-quivers-September-24-2026`
- 其他队列第 473 行号

## §1 起点：我把猜想写成"两堆关系相等"之后

最初动心的是 sections/introduction.tex:4-8 那两句：Hikita 的原始形状把一个辛分辨率的上同调，写成对偶侧库仑分支上某个不动子概形的函数环，而方案结构在这里是本质成分，因为即便闭点集很小，它的幂零函数仍然可以装下正次幂的上同调。摘要 main.tex:55-57 把同一句话压缩成"这是共同系数环上的分次代数同构，保留幂零元，并且把空情形也算进去"。我读到这里时的第一反应是：这两句话的分量差得很远。保留幂零元不是修饰，它决定了正次上同调有没有地方住；一旦取约化结构，$H_F^{>0}(X)$ 那部分信息在对侧就没有任何对应物了。

第二个抓手是共同系数环。sections/introduction.tex:9-11 说得很直白：对箭图规范理论，Higgs 侧的张量类与库仑侧的等变参数给出同一个系数环，问题就是这些系数之间的关系是否一致。具体写法在 sections/introduction.tex:65-69：$R=H^*_{G\times F}(\mathrm{pt};\mathbb C)=\mathbb C[\operatorname{Lie}T\oplus\mathfrak f]^{\mathcal W}$，其中 $T\subset G$ 是对角极大环面、$\mathcal W$ 是它的外尔群；Kirwan 映射 $\phi_H:R\to H_F^*(X;\mathbb C)$ 与系数映射 $\phi_C:R\to\mathbb C[Y_{\mathfrak f}^{\nu}]$ 分列猜想两侧。Higgs 侧一个规范 Chern 类映到它那个张量丛的 Chern 类，味参数经 $H_F^*(\mathrm{pt})$ 作用；库仑侧 $R$ 经库仑代数的系数类作用，再取不动概形商。sections/introduction.tex:76 补了一句分次约定：每个线性的规范或味参数都是二次的。

于是我把目标函数换掉了。原来是"造一个同构"，现在变成"证 $\ker\phi_C=\ker\phi_H$，并且两条映射都满"。这个降级并非偷懒：main.tex:76-78 明确写了，一旦 $\phi_H$ 满，$(\alpha\circ\beta)^{-1}$ 就是那个与系数映射相容的唯一同构。也就是说唯一性是从满性掉下来的，我只要把两个核按住。

第三个抓手是允许空。sections/introduction.tex:40 写 "We allow $D$ and $X$ to be empty"，sections/introduction.tex:88 再补"断言含空情形，其环为零环"。我一开始想把空情形推到附录里当退化情况，但这里不行：定理的陈述形态是"两侧商环同构"，空情形那一侧必须是零环，$\ker\phi_C$ 与 $\ker\phi_H$ 都得等于整个 $R$，否则唯一性的那句话在空位上就断了。$v_i=0$ 的顶点可以直接丢掉，而全部 $v_i$ 为零时两侧都是 $H_F^*(\mathrm{pt})$（sections/preliminaries.tex:11-13），这一句给了我把"平凡荷"从主线上摘出去的权利。

## §2 陈述定形：正则稳定、两个理想、两条任务

数据侧的定形在 sections/introduction.tex:23-39：$Q=(Q_0,Q_1)$ 是有限有向箭图，允许圈与重箭；给定 $\dim V_i=v_i$、$\dim W_i=w_i$，写 $G=\prod_{i\in Q_0}\operatorname{GL}(V_i)$ 与 $N=\bigoplus_{a:i\to j}\operatorname{Hom}(V_i,V_j)\oplus\bigoplus_i\operatorname{Hom}(V_i,W_i)$（见 sections/introduction.tex:26-28）。一个代数环面 $F$ 线性作用在 $N$ 上并与 $G$ 交换，记 $\mathfrak f=\operatorname{Lie}F$；它诱导到 $T^*N=N\oplus N^*$ 的作用是中性的，动量映射按 $\langle\mu(s,p),\xi\rangle=\langle p,\xi s\rangle$ 定性（sections/introduction.tex:32-33）。这里"与 $G$ 交换的任意环面"是很宽的许可：我不必把 $F$ 限制成某个标准极大环面，后文所有涉及味参数的步骤都得在这种情况下成立。

正则性假设我抄得很小心（sections/introduction.tex:34-39）：选 $G$ 的一个特征 $\nu$，使 $\mu^{-1}(0)$ 里的 $\nu$-半稳定轨迹恰等于稳定轨迹，并且 $G$ 在其上自由作用，这样的特征叫正则；令 $D=\mu^{-1}(0)^{\nu\text{-stable}}$、$X=D/G$，于是 $X$ 是光滑的 Nakajima  varieties。注意自由性与非空性都被写进假设，后面 §13、§14 的矛盾论证正是靠这两条吃饭。

库仑侧在 sections/introduction.tex:42-48：$\mathcal O=\mathbb C[[t]]$、$\mathcal K=\mathbb C((t))$，Braverman-Finkelberg-Nakajima 三元组空间是 $\mathcal R=\{[g,s]\in G(\mathcal K)\times_{G(\mathcal O)}N(\mathcal O):gs\in N(\mathcal O)\}$，味形变库仑代数是 $A_F=H_*^{G(\mathcal O)\times F}(\mathcal R;\mathbb C)$，$Y_{\mathfrak f}=\operatorname{Spec}A_F$；等价关系 $(g,s)\sim(gh^{-1},hs)$，乘法是 BFN 卷积。本文用不带圈旋转形变参数的交换代数版本（sections/introduction.tex:50-51）。拓扑分次按 $\pi_1(G)=\mathbb Z^{\{i:v_i>0\}}$，它定出环面 $T_{\mathrm{top}}=\operatorname{Hom}(\pi_1(G),\mathbb C^\times)$，而 $\nu$ 给出这个环面的一个余特征。不动概形按方案意义取：若 $(A_F)_m$ 是权 $m$ 子空间，则 $\mathbb C[Y_{\mathfrak f}^{\nu}]=A_F/\langle (A_F)_m:m\ne0\rangle$，紧接着一句"不对这个商取约化"（sections/introduction.tex:57-61）。

任务拆分在 sections/introduction.tex:188-208。定义 $B_F=\mathbb C[Y_{\mathfrak f}^{T_{\mathrm{top}}}]$、$I_{\mathrm{top}}=\ker(R\to B_F)$、$I_H=\ker(R\xrightarrow{\phi_H}H_F^*(X))$（sections/introduction.tex:191-196），其中 $A_F^{(d)}$ 是拓扑荷 $d$ 子空间，它的余特征权是 $\nu\cdot d$。第一条任务是 $I_{\mathrm{top}}=I_H$，第二条任务是 $A_F$ 内部"余特征定义理想与全环面定义理想相等"。这两条彼此独立：第一条把上同调代数认出来，第二条把不动概形从全环面换到稳定余特征。

我在这个拆分上花了不少时间才想通它的必要性。sections/introduction.tex:182-184 给了理由：一个正则特征 $\nu$ 完全可以对某个整数向量 $0<\mathbf b\le\mathbf v$ 满足 $\nu\cdot\mathbf b=0$，于是全环面的计算本身认不出余特征固定商。也就是说，即便我把 $T_{\mathrm{top}}$ 那一侧算得干干净净，仍有非零荷空间落在余特征零权里，第二条任务不是免费的。

支撑这一切的是极小生成元。sections/preliminaries.tex:60-64 把余权 $\lambda$ 叫正极小，若它在所有顶点的所有分量都落在 $\{0,1\}$；负极小则都落在 $\{0,-1\}$，其 $\operatorname{Gr}_G^\lambda$ 是普通格拉斯曼簇的积，闭且光滑。任意余权 $\lambda=(\lambda_{ia})\in X_*(T)$ 的拓扑荷写 $[\lambda]=(\sum_a\lambda_{ia})_i$（sections/preliminaries.tex:21-22）。真正让我敢把"$R$ 满射到 $B_F$"当显然用的是 sections/preliminaries.tex:147-154：每个非平凡极小生成元荷非零，所以系数映射 $R\to B_F$ 满，$B_F$ 非负分次；$\langle A_F^{(d)}:d\ne0\rangle$ 这个理想就由这些极小类生成，杀掉它们之后代数由 $R$ 生成且支在荷零上。结论落到一句可用的话：$B_F$ 里一条系数关系必可写成非零极小生成的元的正长度中性卷积词之和，系数在 $R$ 里。

## §3 历史坐标：前例把边界画在哪里

我读历史段（sections/introduction.tex:96-148）是为了搞清楚"我这次的断言到底是什么强度"。最早的原型是 $A$ 型 Springer 纤维上同调经幂零轨道闭包与 Cartan 子代数的方案意义交来描述，de Concini-Procesi 与 Tanisaki 的工作（sections/introduction.tex:98-101）。在辛对偶的框架里 Hikita 提出用不动概形实现上同调，并在平面点的 Hilbert 概形上建立，附带 $A$ 型 Spaltenstein 与光滑超环面例子；这一段的要点被写在 sections/introduction.tex:105-107：正是不动轨迹的无穷小结构，并非它的点集，才是问题的核心。

库仑分支的数学构造这条线：Nakajima 提出三维规范理论的库仑分支构造，Braverman-Finkelberg-Nakajima 建出它的交换卷积代数，上溯到 Bezrukavnikov-Finkelberg-Mirkovic 在仿射格拉斯曼情形搭的卷积框架；对箭图规范理论，对应的 Higgs 商就是 Nakajima 簇（sections/introduction.tex:109-115）。与系数相容的表述形态有明确前身：Kamnitzer-Tingley-Webster-Weekes-Yacobi 记下 Nakajima 在仿射格拉斯曼情形的等变猜想，并通过对张量类相容的要求强化其特化形态；Hilburn-Kamnitzer-Weekes 给出共同系数代数上的等变量子精化；Krylov-Shlykov 把一般箭图的比较陈述成"全拓扑环面不动概形上的系数映射核相等"（sections/introduction.tex:117-126）。本文的路线被这一句钉得很准：先建立那个核相等，再把全环面不动概形与稳定余特征不动概形比较（sections/introduction.tex:127-128）。已证的前例是 Gieseker、也就是带框 Jordan 箭图情形；Dumanski-Krylov 给出本文采用的表述，并比较上同调、等变与 $K$ 理论三个版本，他们的有限型结论含 $A,D,E_6$，在 $E_7,E_8$ 要加框的限制，而他们的一处评注解释了为何早先无限制 ADE 的断言必须收回（sections/introduction.tex:132-138）。另有 Setiabrata 在底仿射余切例上的 Hikita 满射结果，与 Dinkins-Karpov-Krylov 对极小支撑框的 ADE 及 Jordan 箭图的精化量子 Hikita 定理（sections/introduction.tex:139-143）。

边界同样重要，而且它是自我限定的：sections/introduction.tex:144-148 写明本文处理上面所有有限箭图数据的上同调代数，不主张量子化的那条陈述，也不把定理推广到任意约化规范群；在这个范围之外，提议中的 Hikita 型认同可以失败。读到这里我把自己的野心收了一次：不要顺手宣称 $K$ 理论版本、不要宣称量子版本、不要宣称一般约化群，因为这三处都有已知的失败信号或者前例的限定。

工具段的分工也值得抄一份清单（sections/introduction.tex:150-163）：BFN 的 Abel 化把极小卷积类变成显式劳朗表达式，Weekes 的生成定理让这些类对任意箭图够用；McGerty-Nevins 的普通与等变 Kirwan 满射给出 Higgs 侧的张量表示；Hausel 的算术 Fourier 变换公式算出最终决定系数商大小的 Betti 数；特征线性化的几何不变量理论与拓扑的 Kempf-Ness 对应把正则稳定接到平坦的双曲商构造上。消失环/稳定对那条视角与 Nakajima 的原构造以及 Botta-Tamagni 的临界格点、拟映射模型有关，而本文这个稳定对测试只证系数理想的包含，不需要他们整套库仑作用构造（sections/introduction.tex:165-175）。

## §4 错路一：在闭不动点上算，再把参数局部化

我最初以为不动概形上的函数环可以这样拿下来：既然 $T_{\mathrm{top}}$ 作用在 $A_F$ 上，那么固定商就是非零权空间的理想去掉之后的东西，先把闭不动点算清楚、逐点看权，剩下的就是拼分次。这条路在 sections/introduction.tex:6-8 那句话面前站不住：如果固定点集小，正次上同调的信息住在幂零函数里；我一旦用约化结构 $\mathbb C[Y_{\mathfrak f}^{\nu}]_{\mathrm{red}}$，就把要证的东西先杀掉了。sections/introduction.tex:61 那句"No reduction of this quotient will be taken"读起来像提醒，其实是路线声明：商理想 $\langle(A_F)_m:m\ne0\rangle$ 后面的所有步骤都必须按方案意义走，包含 $\S\mathcal 1$、§2 里"极小类生成该理想"这种话也只有在带幂零的商里才有内容。

第二条走不通的尝试是"先局部化，再收回来"。若我把 $R$ 的某个非零元素反演，比如把味参数或根超平面上的因子当单位，则两个核在局部化之后相等，只能在局部化环里给出同构；而 $\ker\phi_H$ 里完全可能有被某个二次元素零除的齐性元素，局部化把它抹掉。sections/introduction.tex:180-182 把这句话说得很硬：无论"在闭不动点上算"还是"反演一般参数后得到同构"，都不能确立那个断言；必须认出在指定映射下的关系，带着分次与幂零，对任意味与每个正则稳定都成立。

我在这条错路上具体卡住的形态是这样的。设 $r\in R$ 非零，$u\in I_{\mathrm{top}}$ 齐性，$ru=0$ 在 $R$ 里成立与否取决于是否有零除子；局部化到 $R[r^{-1}]$ 之后 $u$ 就看不见了。因此"局部化之后两个核相等"给出的只是一个弱得多的信息，它无法区分 $u$ 与 $ru$。我后来才明白 §8 那条"添圈"路线为什么值得走：圈权重恰好把极小 Abel 化里格拉斯曼分母消掉（sections/introduction.tex:236-237），于是分母型零除子的麻烦在一个特化的数据族里被移除，比较可以在多项式系数层面做，而这正是 §11 要用形变把它请回原数据的动机。

还有个我一度忽略的细节：分次口径。sections/introduction.tex:198-200 说 $A_F^{(d)}$ 是拓扑荷 $d$ 的子空间、其余特征权为 $\nu\cdot d$，而这两者都不是用希尔伯特级数的那个上同调分次。我第一版把荷当分次来数，结果所有上界都不对；后来在 sections/preliminaries.tex:130-141 才看到正确的换算：对 $\lambda$ 记 $c_\lambda=\sum_{\beta\in\operatorname{wt}(N)}(-\langle\beta,\lambda\rangle)_+$、$a_\lambda=\dim\operatorname{Gr}_G^\lambda$，则齐性 $p$ 之下的极小类满足 $\deg M_{\lambda,p}=2c_\lambda-2a_\lambda+\deg p$，而裸的无物质环面类 $e^\lambda$ 分次为零。这条换算就是"度数为零的荷不为零"这类错觉的来源，也是我算尺寸时必须带的因子。

## §5 错路二：只证数值等式，或者指望某个未指明同构的特化

第二条错路更隐蔽，我几乎要落进去：先比 Poincaré 多项式。这条路的诱惑在 sections/introduction.tex:242-247：劳朗模型给出 $B_0$ 的一个上界，counting 一节把对应的和识别成 Hausel 的普通 Poincaré 多项式，于是"上界与第一步满射在每个次数上逼出相等"。看第二句很容易以为任务就是在每个次数上比维数。但同一段末尾立刻补了免责：这是在原系数映射下的同构，远不只是一个数值恒等式。我的理解是，数值等式在这里的作用是合上夹紧的两指：第一步的满射 $B_F\twoheadrightarrow H_F^*(X)$ 已经在分次映射的意义下把维数压成一个方向，另一个方向由滤过子商的不变量上界给出；两边咬住才让满射在每个次数上是同构。若我跳过第一步、只报两个 Poincaré 多项式相等，我就根本没有把环结构按住，也认不出系数映射的核。

同一条错路的第二个形态是"特化某个 generic 同构"。sections/introduction.tex:260-262 直接点名了这个做法并把它排掉：loop 消去这一步的内容是齐性论证，未指明的一般同构的特化不算。我一开始的算盘是这样：既然在带 $z$ 参数的形变族上两个系数理想局部化以后相等，那就挑一个使两边都好的一般点，把同构特化回原点。这里的问题有两层。其一是这个"一般同构"我并没有构造出来，只知道某个局部化环里有同构，而特化到零处需要平坦性或者Tor 消失的论证作保；其二是即使能特化，得到的也只是特化后的环同构，与原系数映射是否相容无从说起。真正被采用的论证把目标换掉了：让两个理想在带分次的齐性意义下相等，"在分次原点处的相等就决定它们在整体上相等"（sections/introduction.tex:258-260），这样我不需要任何一般点的同构，只需要一次沿齐性方向的下降。

我在这两条错路上得到的一个共同教训是：本文的每一步都在把"我要证的到底是什么"往回收。数值等式、局部化等式、约化结构上的等式，都比定理陈述弱，而它们看上去都像是可以交差的东西。摘要 main.tex:52-57 的那句"对任意维数与框向量、任意交换味环面、以及半稳定轨迹即稳定且规范作用自由的那个稳定特征"里没有一条是可以省的：loops 与重箭在数据里、任意味在 $F$ 上、每一个正则 $\nu$ 在特征上，而"带幂零、含空情形"在结论里。

## §6 转折一：把卷积词拿去问 $\mathbb P^1$ 上的稳定对

第一个真正的转折是承认一件事：$I_{\mathrm{top}}\subseteq I_H$ 这条包含没法在环的内部证，得把元素拿到几何上去"测"。落点是 sections/stable-pairs.tex:6-14 那个命题：对定理里的每份数据与每个正则稳定，系数映射诱导出分次 $R$-代数满射 $B_F\twoheadrightarrow H_F^*(X)$，也就是 sections/stable-pairs.tex:12 写的那条带双箭头的商映射。整节把 $\mathsf K=G\times F$ 记作等变基（sections/stable-pairs.tex:15），并且沿用对应层一节给的记号 $L$、$E_b$、$S_B$、$f_B$、$i=f_{\mathrm{pt}}$、$\rho_Z$（sections/stable-pairs.tex:16-18），测试里所有上同调都是普通的等边上同调。

为什么这个测试能认出关系？我在 sections/introduction.tex:213-230 那一段反复读了三遍才把逻辑链理顺。要用到的非平凡极小生成元是"带装饰的格修改"，它的余权分量全体落在 $\{0,1\}$ 或全体落在 $\{0,-1\}$，并且拓扑荷非零（sections/introduction.tex:213-216）；一个卷积词就是这些类的有限乘积。由极小生成性，$I_{\mathrm{top}}$ 里的系数关系是若干正长度、总拓扑荷为零的卷积词之和（sections/introduction.tex:217-218，配合 sections/preliminaries.tex:152-154）。关键的一句是 sections/introduction.tex:221-223：稳定特征给每个修改赋予一个加性的次数，于是中性词里这些次数相加为零；把词重新排序之后，第一个修改非平凡且其特征线次数非正，而稳定性把它排除。同一段还补上另一半：在恒等对应上，同一个测试给出朝 $H_F^*(X)$ 的分裂限制，它能检出系数类本身（sections/introduction.tex:225-227）。被测的关系于是在上同调里消失，满射落定。

几何内核在 sections/stable-pairs.tex:20-50。取 $\mathbb P^1$ 上的主 $G$-丛 $\mathcal P$，记 $\mathcal L_\nu$ 为它的特征线丛，约定是：在一个相伴表示的截口上求值一个 $\nu^m$-半不变量，得到 $\mathcal L_\nu^{\otimes m}$ 的一个截口（sections/stable-pairs.tex:24-27），其次数是 $\mathcal P$ 拓扑类的线性函数。引理说的是：若 $\mathcal P$ 在无穷远处带标架，$\sigma$ 是 $\mathcal P\times_G(T^*N)$ 的整体截口，且它在该标架下的值 $\sigma_\infty$ 是 $\nu$-稳定且稳定化子平凡，则 $\deg\mathcal L_\nu\ge0$；等号成立时 $(\mathcal P,\sigma)$ 有唯一与无穷远标架相容的平凡化，使 $\sigma$ 是常截口 $\sigma_\infty$（sections/stable-pairs.tex:34-39）。用格语言写，零次情形的拓扑类为零且 $b=hG(\mathcal O)$，$h\in G(\mathbb C[t^{-1}])$、$h(\infty)=1$（sections/stable-pairs.tex:46-48）。

证明里我最欣赏的是它只用了两条事实。取一个在 $\sigma_\infty$ 处非零的 $\nu^m$-半不变量 $f$（$m>0$），它在 $\sigma$ 上求值给出 $\mathcal L_\nu$ 正次幂的一个在无穷远处非零的整体截口，次数非负立即到手（sections/stable-pairs.tex:53-57）。若次数为零则该截口处处非零，$\sigma$ 处处半稳定，给出态射 $\gamma:\mathbb P^1\to(T^*N)/\!/_\nu G$；每个不变多项式在 $\sigma$ 上求值都是 $\mathbb P^1$ 上的正则函数，故为常数，于是 $\gamma$ 的像落在朝仿射商 $(T^*N)/\!/G$ 的那个投影态射的一根纤维里；充分可除的几何不变量理论极化是相对的 ample，拉回是 $\mathcal L_\nu$ 的正次幂，次数为零迫使 $\gamma$ 为常（sections/stable-pairs.tex:59-72）。常值点是稳定商里由 $\sigma_\infty$ 代表的点，它在半稳定轨迹里的纤维就是单个轨道 $G\sigma_\infty$；$\sigma$ 于是是相伴轨道丛 $\mathcal P\times_G(G\sigma_\infty)$ 的截口，而 $G\sigma_\infty\simeq G$ 作为等变空间成立，这个截口就把 $\mathcal P$ 平凡化了；唯一性来自自由作用（sections/stable-pairs.tex:74-81）。这里我把"自由"二字在正则性假设里的位置又确认了一遍：没有它，平凡化会有多余的自同构，唯一性断言就空了。

紧接着 sections/stable-pairs.tex:90-96 补了一个容易被跳过的接口：$D=\mu^{-1}(0)^{\nu\text{-stable}}$ 的每个点在环境表示 $T^*N$ 里同样是稳定且平凡稳定化子，理由是闭不变子簇上半不变量因约化不变量的正合性提升、轨道闭包留在子簇内，所以仿射的稳定性判据与它的环境限制一致；那个引理因此可以作用在"对"$(s,p)\in D$ 上，这是标题里 stable pairs 的落点。

## §7 有限对应层：把卷积词实现成格上的态射

这一节我要老实交代：sections/correspondences.tex 我最终没有开窗口读，只在目录里量到它 14,728 字节、311 行，从标题行 sections/correspondences.tex:1 与两处小节名（sections/correspondences.tex:10 关于有界格族、sections/correspondences.tex:59 关于有限对应的分解，另有一条评注在 sections/correspondences.tex:297）知道它的分工。下面的描述是按"稳定对一节到底向它借了什么"来反推的，凡涉及内部构造的句子都标 [推测]。

借出来的东西在 sections/stable-pairs.tex:16-18 列了名字：$L$、$E_b$、$S_B$、$f_B$、$i=f_{\mathrm{pt}}$、$\rho_Z$，全部沿用那条分解引理；测试用的截断参数 $l$ 也来自它（sections/stable-pairs.tex:100-101），而"含基格 $1$ 的中性射伯舒特并 $Z$"同样是那边的对象（sections/stable-pairs.tex:211-213）。[推测] 那条分解引理的形态是：把一个有限生成元词实现为一个有界格族 $S_B\to B$ 上的对应，其推前 $f_{B,*}\mathbb C_{S_B}$ 就是该词的卷积类在系数层上的像，从而测试可以逐项做在 $\mathbb C_{S_B}$ 上。这正好对上 sections/introduction.tex:219-220 那句话：把每个总拓扑荷为零的词用有限维格对应实现，并且把所有次数平移保留下来。

次数簿记为什么要紧，我在两处看到提示。sections/preliminaries.tex:142-143 明说"由公共的有限截断带来的额外平移将在对应层一节里显式保留"；sections/laurent.tex:174-178 则规定此后 $q$ 记上同调次数之半，每个多项式变量二次、贡献一个 $q$，对所考虑的一致分次向量空间有 $\operatorname{Hilb}(M;q)=\sum_d\dim(M^{2d})q^d$。也就是说，$B_F$ 的分次是 BFN 同调分次，而它在这条实现路线上等于"多项式系数次数加上一串显式平移"；我在 §4 末尾算错过的那笔度数账，就是靠这里的约定才能重算。[推测] 分解引理之所以要限定"有界"格族，是因为 $A_F$ 的构造本身要经过截断的层格取归纳极限，只有在有界族上，$f_{B,*}$ 的真态射性与基变换才逐层可用，恒等对应上那条"分裂限制"才有确定的意义（sections/introduction.tex:225-227）。

## §8 转折二：先假设每个顶点都有一个圈

第二个转折是加东西，去东西是后面 §11 的事。设定写在 sections/introduction.tex:232-236：暂时假设箭图在每个正规范维数的顶点处都有一个圈，不取味，用行列式稳定 $\nu_{\det}=\prod_i\det_{V_i}$；圈权重把极小 Abel 化里的格拉斯曼分母消掉。我在第一次读到这里时的判断是"这是作弊"，因为它改变了要证的定理。后来才明白它是一次有计划的特化：先把规模比较在一个数据族上做成显式，再用形变把结果请回原数据。

消分母的算法是逐点的。sections/laurent.tex:68-77 写得很具体：对正极小子集 $I$，删掉的那个圈在该顶点贡献 $\prod_{a\in I,\ b\notin I}(x_{ib}-x_{ia})$，而格拉斯曼切空间权正是这些根，差别在一个共同的符号约定；负子集则把根反过来。把它对照 sections/preliminaries.tex:81-87 的极小公式看就清楚了：那里的分式是"分子 $\prod_{\beta\in\operatorname{wt}(N)}\beta^{(-\langle\beta,\lambda'\rangle)_+}$ 除以切空间等变欧拉类 $\operatorname{eu}_T(T_{t^{\lambda'}}\operatorname{Gr}_G^\lambda)$"，加了圈以后 $\operatorname{wt}(N)$ 多出这些根，恰好与分母相消，于是生成元的表达式变成多项式系数乘以劳朗单项式。这条化简是后面一切尺寸估计的前提：没有分母，滤过子商才谈得上是多项式环的商。

我还想记下这个特化为什么和正则性相容：行列式稳定在 $\nu_i$ 全取 $1$ 时就是 $\nu_{\det}$，而它是否正则取决于该维数与框向量下 $\mu^{-1}(0)$ 的半稳定是否等于稳定、作用是否自由；本文是在这个族已知的正则位置上使用它（sections/deformations.tex:151-156 把 $H^*_H(\mathrm{pt})=\mathbb C[z]$、$\deg z=2$ 与 $H=\mathbb C^\times$ 以权 $1$ 作用在新圈上、平凡作用在 $N$ 上这一套写定）。[推测] 之所以选行列式稳定，是因为它对所有顶点同权、与加圈带来的那组同维权重最贴合；这一点我在素材里没有找到明写的理由。

## §9 洛朗模型与按多分拆的滤过

无味库仑代数在 Abel 化嵌入下的形状由 sections/laurent.tex:47-55 给出：$A_0=\left(\bigoplus_{\lambda\in\mathbb Z^\Omega}P\,r_\lambda\right)^{\mathcal W}$，并且这个识别保留系数环 $R_0=P^{\mathcal W}$ 与拓扑分次。这里 $r_\lambda=e^\lambda\prod_{\beta\in\mathcal B'}\beta^{E_\beta(\lambda)}$、$E_\beta(\lambda)=(-\langle\beta,\lambda\rangle)_+$（sections/laurent.tex:29-34），带装饰轨道和写成 $\mathsf S_\lambda(p)=\sum_{w\in\mathcal W/\mathcal W_\lambda}w(pr_\lambda)$（sections/laurent.tex:41-43）。乘积律是 $r_\alpha r_\gamma=r_{\alpha+\gamma}\prod_{\beta\in\mathcal B'}\beta^{E_\beta(\alpha)+E_\beta(\gamma)-E_\beta(\alpha+\gamma)}$，每个指标非负（sections/laurent.tex:59-65），所以右边直和本身是代数、取不变量仍是子代数。

反向包含的证明是我这次读得最慢的一段，因为它把组合不等式塞进了代数生成性的证明里。做法是对 $\lVert\lambda\rVert^2=\sum_{(i,a)\in\Omega}\lambda_{ia}^2$ 强归纳（sections/laurent.tex:84-89）。若 $\lambda$ 有正坐标，令 $f(t)=1_{t>0}$、$g(t)=t-1_{t>0}$，否则 $f(t)=-1_{t<0}$、$g(t)=t+1_{t<0}$，逐坐标写 $\alpha=f(\lambda)$、$\gamma=g(\lambda)$，则两者范数严格变小（sections/laurent.tex:90-101）。两个函数在 $\mathbb Z$ 上单调且相对零符号相容，于是对任意槽位 $d,e$ 有 $(\alpha_d-\alpha_e)(\gamma_d-\gamma_e)\ge0$ 与 $\alpha_d\gamma_d\ge0$（sections/laurent.tex:103-108），这意味着上面那个乘积律里所有指标都是零，$r_\alpha r_\gamma=r_\lambda$。再把每个顶点的槽按 $\lambda$ 坐标排序，重排不等式给出对任意相对匹配 $w\in\mathcal W$ 有 $\lVert\alpha+w\gamma\rVert^2\le\lVert\alpha+\gamma\rVert^2=\lVert\lambda\rVert^2$，等号情形落回 $\lambda$ 的轨道（sections/laurent.tex:114-120）。这一段我读完的感受是：它把"词的乘积里只有最高项留在 $\lambda$ 轨道上"这件事变成了一次纯粹的比较，剩下的都是更小范数的项，交给归纳假设。

装饰的任意性由 sections/laurent.tex:146-160 处理：每个颜色内 $\alpha$ 与 $\gamma$ 的层块在所选排序下是区间，它们的割合起来恰是 $\lambda$ 层块的割，因为 $f(t)+g(t)=t$ 使两个不同值不可能 $f$、$g$ 同值；于是每个 $\lambda$ 块上的幂和是 $\alpha$ 块与 $\gamma$ 块上幂和的组合，逐前缀相减即可得到，再由幂和生成每个对称多项式环，得 $P^{\mathcal W_\lambda}=\langle P^{\mathcal W_\alpha},P^{\mathcal W_\gamma}\rangle$。这样任何指定的首项装饰都能由带装饰轨道和的乘积实现，低项由归纳假设消去，反向包含不反演任何多项式就完成（sections/laurent.tex:161-170）。

滤过由多分拆 indexing：$\mathcal M(\mathbf v)$ 是数组 $m=(m_{i,s})$，$m_{i,s}\in\mathbb Z_{\ge0}$、$\sum_{s\ge1}s\,m_{i,s}=v_i$（sections/laurent.tex:180-184），记 $l_i=\sum_{s\ge1}m_{i,s}$、$|l|=\sum_i l_i$，并写 $D_m=\frac12\sum_{i,j}\sum_{s,t\ge1}c_{ij}\min(s,t)m_{i,s}m_{j,t}$（sections/laurent.tex:185-194）。正槽位是每种类型 $(i,s)$ 的 $m_{i,s}$ 个带标记副本，$P_m=\mathbb C[x_d:d\in\Omega_m^+]$、$\mathcal W_m=\prod_{i,s}S_{m_{i,s}}$、$b_{de}=c_{i(d)i(e)}\min(s(d),s(e))$（sections/laurent.tex:195-203）。对每个非空子集 $S\subseteq\Omega_m^+$ 有割多项式 $q_S=\prod_{d\in S}x_d^{w_{i(d)}}\prod_{d\in S,\ e\notin S}(x_d-x_e)^{b_{de}}$，$J_m$ 由这些生成，$h_m(q)=\operatorname{Hilb}((P_m/J_m)^{\mathcal W_m};q)$；空数组约定 $P_m=\mathbb C$、$J_m=0$、$h_m(q)=1$（sections/laurent.tex:204-218）。最终的上界是 $\operatorname{Hilb}(B_0;q)\le\sum_{m\in\mathcal M(\mathbf v)}q^{C(\mathbf v)-D_m+\mathbf w\cdot(\mathbf v-\mathbf l)}h_m(q)$，且每个出现的指标都是非负整数（sections/laurent.tex:237-246）。构造这个界的具体一步在 sections/laurent.tex:248-264：按颜色把 $l_i$ 个正槽位认成 $v_i$ 个规范槽位中的 $l_i$ 个，其余记 $s(d)=0$ 叫零槽位，令 $(\lambda_m)_d=s(d)-1$；它拓扑荷为零，因为顶点 $i$ 上坐标之和是 $\sum_s s\,m_{i,s}-v_i=0$，稳定化子是 $\mathcal W_{\lambda_m}=\mathcal W_m\times\prod_i S_{v_i-l_i}$。那句"positive 指部分的大小，所以秩三顶点上大小 $(2,1,0)$ 给出余权 $(1,0,-1)$"（sections/laurent.tex:256-257）替我省了不少符号歧义。

## §10 割理想：将上界算成一个生成函数

`sections/laurent.tex:220-235` 给了我一段可以直接抄进本子的图论解释，这也是整条规模估计最容易被略读掉的地方。做法是添一个框顶点 $0$，在每个正槽位 $d$ 与 $0$ 之间放 $w_{i(d)}$ 条边，在每对不同槽位 $d,e$ 之间放 $b_{de}$ 条边。当这张多重图连通时，$J_m$ 就是它的约化关联构形的余回路理想，约化指的是把 $0$ 那一行删掉；一个最小的断开割贡献它的边形式之积，框边给 $x_d$、槽边给 $x_d-x_e$，而每个割多项式都可被某个极小割的积整除。这段话把我前面的 $q_S$ 从一堆公式变成了一件可画出来的东西：$q_S=\prod_{d\in S}x_d^{w_{i(d)}}\prod_{d\in S,\ e\notin S}(x_d-x_e)^{b_{de}}$ 里的两个乘积恰是"割到 $0$ 的边"与"割断图的内部边"。`sections/laurent.tex:233` 又补了一条我一开始没想到的例外：若某个连通分支与 $0$ 不相交，则出现单位割，商直接为零。这类"约定要让空情形自洽"的细节在本文里反复出现，与 §1 那条"允许 $D=\varnothing$"是同一个脾气。

这类理想我认得它的出处：`sections/laurent.tex:229-232` 指出它们在 toric 超 Kahler 上同调里出现过，也在带置换不变量的箭图构造里出现过，两处各给了参考。我读到这里时的判断是：上界的形式并非本文独创，独创的是把 $B_0$ 的希尔伯特级数按多分拆切成这些不变量子商。`sections/laurent.tex:234-235` 明确说下一步是一条直接的可达性计算，它保留 $\mathcal W_m$ 的作用并给出这里需要的递推。

再往后就是我没有开窗口的部分。`sections/introduction.tex:242-244` 的表述是：用可达性分层算出这些商的希尔伯特级数，并把得到的和识别成 Hausel 的普通 Poincaré 多项式；`sections/introduction.tex:157-159` 则交代了这为什么够用：Hausel 的算术 Fourier 变换公式算出最终决定系数商大小的 Betti 数。[推测] 所谓可达性分层，应该是按槽位集合能否沿箭与框边从 $0$ 抵达来切分 $\Omega_m^+$，从而把 $\operatorname{Hilb}((P_m/J_m)^{\mathcal W_m};q)$ 写成由递推控制的和；我把 $h_m(q)$ 只当作符号用，是因为我确实没读到它的计算段。同样只能标 [推测] 的还有两条：结构扫描显示 counting 一节有一条生成函数比值的推论（约在其 185 行附近）与一条关于空情形的评注（约 356 行附近），前者大概是把 $\sum_m q^{C(\mathbf v)-D_m+\mathbf w\cdot(\mathbf v-\mathbf l)}h_m(q)$ 收成闭式，后者大概在处理 $D_m$ 或 $h_m$ 退化的边角；我没有证据说它们就是这么写的，所以不抄内容。

我能确证的是这条路线在证明里承担的角色。`sections/introduction.tex:244-247`：上界与第一步的满射在每个次数上逼出相等，而这是原系数映射下的同构，绝非单纯的数值恒等式；同节 `sections/introduction.tex:246` 的推论标题（结构扫描约在其 368 行）叫 loop-isomorphism，[推测] 陈述应是带圈情形与行列式稳定下的 $B_0\simeq H^*(X)$，因为 §11 恰恰是从这一句起步的。我数了一下这条链上的强度分配：满射由几何（稳定对）给出，上界由组合（割理想）给出，闭式由算术（Hausel 公式）给出。任何一环单独都不构成同构，这也是我在 §5 那条错路上得到的教训的正面版本。

## §11 形变回原数据：局域化到一个点，再沿齐性下降

`sections/deformations.tex:134-141` 把命题写成一句话：对每个有限箭图、每对维数与框向量，在 §10 那条带圈推论所用的行列式稳定下，系数映射诱导出分次 $R_0$-代数同构 $B_0\xrightarrow{\ \sim\ }H^*(X)$。证明的四段结构我按"添圈、两侧各自局域化、比较、下降"来记。

添圈（`sections/deformations.tex:143-156`）：丢掉零秩规范因子，在每个留下的顶点添一个圈，写 $N^+=N\oplus\bigoplus_i\operatorname{End}(V_i)$；令 $H=\mathbb C^\times$ 平凡作用在 $N$ 上、以权 $1$ 作用在每个新圈上，$H^*_H(\mathrm{pt})=\mathbb C[z]$ 且 $\deg z=2$，上标 $+$ 表示 enlarged 理论。在行列式稳定处，带圈情形的同构与味提升引理合起来给出 $B_H^+\xrightarrow{\ \sim\ }H_H^*(X^+)$，作为分次 $R_0[z]$-代数成立。

比较的落点是一个局域化环，不是某个一般点。定义 $\mathfrak m_0\subset R_0$ 为分次原点的极大理想，$\Lambda=R_0[z]_{(\mathfrak m_0,z-1)}$（`sections/deformations.tex:158-162`）。这里的诚实之处写在 `sections/deformations.tex:163-165`：在 $\Lambda$ 上的比较不分上同调次数，只保留拓扑荷，上同调分次要靠后面"两个齐性理想相等"这一步取回。我第一版正是想把 $z=1$ 当作一次普通特化来做，但那需要两侧族平坦；现在的写法是把等式在局域化环上拿到，再用齐性把它拉回整体。

库仑侧的比较（`sections/deformations.tex:167-196`）完全在极小公式上做。取 $P=\mathbb C[x_{ia}]$，对正负极小余权 $\lambda$，新增的分子是 $E_\lambda(x,z)=\prod_i\prod_{a,b=1}^{v_i}(z+x_{ib}-x_{ia})^{(\lambda_{ia}-\lambda_{ib})_+}$；它对 $\mathcal W_\lambda$ 不变，且在 $(x,z)=(0,1)$ 处取值 $1$。关键在于它的逆落在 $P[z]^{\mathcal W_\lambda}\otimes_{R_0[z]}\Lambda$ 里：把 $\Delta_\lambda=\prod_{w\in\mathcal W}wE_\lambda$ 看成 $R_0[z]$ 的元素，$\Delta_\lambda(0,1)=1$，于是 $E_\lambda^{-1}=(\Delta_\lambda/E_\lambda)/\Delta_\lambda$ 是一个不涉及新反演的比值。生成元的装饰于是可以随意装卸：带装饰 $pE_\lambda$ 的放大生成元对应原来的 $M(\lambda,p)$，反过来用 $p/E_\lambda$ 装饰即可在局域化之后还原。因为被反演的元素拓扑度为零，局域化与"对全部非零拓扑度取商"可交换，得 $B_H^+\otimes_{R_0[z]}\Lambda\simeq(B_0\otimes_\mathbb C\mathbb C[z])\otimes_{R_0[z]}\Lambda$。

上同调侧的比较（`sections/deformations.tex:198-238`）换了战场：它必须处理"商空间里被 $H$ 固定的点，可能要配一个规范变换才真的固定"这一麻烦。做法是直接把预商里真正的 $H$-不动迹取出来做局域化、保留 $G\times H$ 等变性，并且先restrict到 $T\times H$。子群局域化定理说，一个环面空间等变嵌入有限维表示后，朝子环面不动迹的限制在反演有限多个对该子环面非平凡的特征之后成为同构；把它用在 $T\times H$ 与 $H$ 的紧形式以及不变局部闭子集 $D^+\subset T^*N^+$ 上。每个在 $H$ 上非平凡的中心李代数元素取值都不为零，因此限制 $H^*_{T\times H}(D^+)\to H^*_{T\times H}((D^+)^H)$ 在那一点是同构；再取 $\mathcal W$-不变量还原 $G\times H$ 等变性，并且与 $\Lambda$ 上的局域化相容，因为该点是 $\mathcal W$-固定的，任一分母的轨道积仍是一个在该点非零的不变分母。$H$-不动迹的判定很干脆：新圈与它们的余切伙伴的 $H$-权都非零，所以 $(D^+)^H$ 把这些坐标全部置零，放大的动量映射限制回原来的动量映射；稳定性也限制回原来的稳定性，因为在 $G$-等变闭包含之下，一个点及其每一族单参数子群的 Hilbert-Mumford 检验都不变，等价的说法是半不变量因约化性提升、轨道闭包留在闭子簇内。于是 $(D^+)^H=D$，右边 $H$ 平凡作用；稳定作用上的自由性给出 $H_H^*(X^+)\otimes_{R_0[z]}\Lambda\simeq(H^*(X)\otimes_\mathbb C\mathbb C[z])\otimes_{R_0[z]}\Lambda$，而且这一步不需要 $D^+$ 或 $X^+$ 紧致（`sections/deformations.tex:237-238`）。

下降（`sections/deformations.tex:240-259`）是我打算抄进自己工具箱的一段。记 $I_B$、$I_X$ 为 $R_0$ 朝 $B_0$ 与 $H^*(X)$ 的系数映射之核，上面三个同构在同一个 $\Lambda$ 上认出了两个商，故 $I_B\Lambda=I_X\Lambda$。令 $z=1$ 用的是 $\Lambda/(z-1)\Lambda=(R_0)_{\mathfrak m_0}$，得 $(I_B)_{\mathfrak m_0}=(I_X)_{\mathfrak m_0}$。两个理想都齐性：若 $h\in I_B$ 齐性，存在 $s\in R_0$ 使 $s(0)\ne0$ 且 $sh\in I_X$，取这条关系在 $\deg h$ 分量就得到 $s(0)h\in I_X$，故 $h\in I_X$；交换两个理想即得 $I_B=I_X$。`sections/deformations.tex:256-259` 收尾写得明白：这是理想之间的相等，给出商环的分次同构并保留全部幂零元，证明对稳定迹为空的情形一字不改地适用，若无非零规范秩则断言显然。

## §12 味提升：把一个模证为零，并非构造一个逆

我在 §11 拿到无味情形的同构以后，最自然的焦虑是"味参数怎么办"。`sections/deformations.tex:92-100` 那条引理把焦虑收住了：固定一个正则稳定，若系数映射诱导 $B_0\simeq H^*(X)$，则对每个与 $G$ 交换的味环面 $F$，`sections/stable-pairs.tex:12` 那条满射 $B_F\twoheadrightarrow H_F^*(X)$ 已是分次 $R$-代数同构。它的证明只有三十行，是我这次读到最干净的一段论证，值得逐步复述。

令 $S=\mathbb C[\mathfrak f]$、$S_+$ 为其正次理想（`sections/deformations.tex:103`）。Kirwan 满射蕴涵 $H^{\mathrm{odd}}(X)=0$（`sections/deformations.tex:104`）；于是 $X\to EF\times_FX\to BF$ 的 Borel 谱序列第二页是 $H^*(BF)\otimes H^*(X)$，集中在偶总次数，因此退化，且边缘映射到 $H^*(X)$ 是满的（`sections/deformations.tex:105-107`）。提升 $H^*(X)$ 的一个有限齐性基并用 Leray-Hirsch，就得到 $H_F^*(X)$ 是自由 $S$-模，并且 $H_F^*(X)/S_+H_F^*(X)=H^*(X)$；`sections/deformations.tex:113` 特别写明 $X=\varnothing$ 时按零模同样成立。设 $J$ 为那条满射的核。目标自由使 $\operatorname{Tor}_1^S(H_F^*(X),S/S_+)=0$，把它的定义正合列与 $S/S_+$ 张量，得 $0\to J/S_+J\to B_F/S_+B_F\to H^*(X)\to0$（`sections/deformations.tex:115-123`）。此时 `sections/preliminaries.tex:156-165` 的味基变换引理派上用场：它给出 $B_{F'}\otimes_{H^*_{F'}(\mathrm{pt})}H^*_F(\mathrm{pt})\cong B_F$ 且与系数映射、两个分次、卷积都相容，于是中间项与那条映射被认成 $B_0\xrightarrow{\ \sim\ }H^*(X)$，从而 $J=S_+J$（`sections/deformations.tex:124-125`）。最后一步是纯粹的分次论证：$J$ 分次且有下界，因为 $B_F$ 是非负分次环 $R$ 的商；若 $J$ 有最低次的非零齐性元素，$J=S_+J$ 就用更低次的元素表示它，矛盾，故 $J=0$（`sections/deformations.tex:126-129`）。`sections/deformations.tex:130-131` 补了一句边界：正性只用在系数商 $B_F$ 上，库仑代数 $A_F$ 本身是否非负分次从未被假设。

这里我注意到一个方法论上的转变。我原本准备"给 $J$ 造生成元、逐条验证它们在上同调里为零"，实际用的是：先把 $S_+$-约化算清楚，再靠有下界的分次把 Nakayama 型的推理反过来用。$J=S_+J$ 在有下界时分次模上只能由 $J=0$ 实现，这比我原来打算的构造性路线少用了几倍的手艺，而且完全不碰 $A_F$ 的正性，这一点很重要，因为 §4 里我就怀疑过 $A_F$ 上根本没有非负分次可用（`sections/preliminaries.tex:144` 明写不假设这一点）。

全环面定理（`sections/deformations.tex:262-281`）把三条线合起来：在行列式稳定处，loop 消去把 $B_0$ 认出普通上同调，故 $B_0$ 有限维；对任何其他正则稳定，Betti 独立性引理给出同一个总 Betti 数，于是那条分次且与系数相容的满射 $B_0\twoheadrightarrow H^*(X)$ 必为同构；味提升引理把它推到每个交换味环面，一般性由 `sections/preliminaries.tex:30-38` 那条把味作用化成逐箭特征与逐框对角形式的引理供应；若商为空，同一论证给 $B_0=B_F=0$；唯一性来自 $R\to B_F$ 的满性。这里"总 Betti 数相同"的用法我想记牢：满射的像维数不超过源，源 $B_0$ 的维数与数据无关，而在行列式稳定处它等于 $\sum_b\dim H^b(X)$，所以在每个正则位置上两者都相等，一个等维数之间的满射只能是双射。`sections/deformations.tex:11` 那条 Betti 独立性引理（我读到的窗口没覆盖它的正文）[推测] 用的是四元数旋转与紧支撑 Betti 数在正则室里的常值性，因为 `sections/introduction.tex:263-266` 恰好把这两样列在比较所有正则特征的位置上。

## §13 转折三：添一个框顶点，让每个单极子都配上伙伴

第二条任务（$A_F$ 内部两个定义理想相等）与前一条完全独立，这是 `sections/introduction.tex:269-271` 明确写的：它在上同调比较之外，证明自然映射 $\mathbb C[Y_{\mathfrak f}^{\nu}]\to B_F$ 是同构。我在读这一节之前先想过：全环面不动商把每个非零拓扑荷空间都杀掉，余特征不动商只杀 $\nu\cdot d\ne0$ 的那些，所以后者可能更大；要证相等，就得证明那些 $\nu\cdot d=0$ 的非零荷类在余特征商里也已经是零。`sections/cocharacters.tex:489-499` 的命题形态正是如此：若 $\mu^{-1}(0)$ 的每个 $\nu$-半稳定点都稳定且 $G$-稳定化子平凡，则商映射 $A_F/\langle(A_F)_m:m\ne0\rangle\to B_F$（$m$ 记 $\nu$-权）是同构，且这是 $A_F$ 的商之间的相等，保留系数映射与两个分次。

它的证明骨架我按六步记。

第一步化简与记号。`sections/cocharacters.tex:502-505` 允许我设 $F$ 逐箭、逐框行地缩放，并且添删规范平凡余切因子不影响正则性与所有不动商；把特征写成 $\nu((g_i))=\prod_i\det(g_i)^{\nu_i}$（`sections/cocharacters.tex:506-509`）。

第二步添顶点。添一个维数为 $1$ 的顶点 $\infty$ 与 $w_i$ 条 $i\to\infty$ 的箭，保留原有各箭，所得无框箭图记 $\widehat Q$、维数向量记 $\mathbf d=(\mathbf v,1)$；在每个框空间取基之后，它的表示就是原来的 $N$（`sections/cocharacters.tex:510-515`）。于是有群同构 $G\times\mathbb C^\times\to G_{\mathbf d}$、$((g_i),c)\mapsto((cg_i),c)$，第二个因子在 $N$ 上平凡，三元组空间与其卷积随之分裂成 $A_{\widehat Q,\mathbf d,F}\cong A_F\otimes_\mathbb C\mathbb C[\xi,z,z^{-1}]$，其中 $\xi$ 是额外标量的系数参数、$z$ 是它的基本劳朗单极子且上同调次数为零（`sections/cocharacters.tex:517-530`）。`sections/cocharacters.tex:530-531` 特别提醒这个 $z$ 与 §11 里那个二次的加圈质量参数无关，我在第一次读时确实把它们混了。$z$ 在原顶点坐标下拓扑荷为 $\mathbf d$，它把每个规范余权分量、包括 $\infty$ 处分量，平移 $1$（`sections/cocharacters.tex:532-533`）。

第三步延拓特征。令 $\widehat\nu_i=\nu_i$（$i\in Q_0$）、$\widehat\nu_\infty=-\sum_i\nu_iv_i$，则 $\widehat\nu\cdot\mathbf d=0$，并且在上述群同构下 $\widehat\nu$ 在 $G$ 上就是 $\nu$、在额外标量上平凡；故 $\xi$ 与 $z^{\pm1}$ 的 $\widehat\nu$-权都为零，取余特征固定商得 $(A_{\widehat Q,\mathbf d,F})_{\mathrm{fix},\widehat\nu}\cong(A_F)_{\mathrm{fix},\nu}\otimes_\mathbb C\mathbb C[\xi,z,z^{-1}]$，而且这个扩张是忠实平坦的（`sections/cocharacters.tex:535-553`）。忠实平坦是我原本会漏掉的强度：它保证后面在放大型里推出去的零化关系能拉回原代数。

第四步是这条路线的心脏：陪极单极子恒等式。取 $A_F$ 的一个非平凡正极小生成元 $M^+_{\mathbf b',p}$，令 $\mathbf b=(\mathbf b',0)$；若 $\widehat x_{ia}$ 是放大后的规范 Chern 根，群同构把原根认成 $x_{ia}=\widehat x_{ia}-\xi$，$p^\uparrow$ 表示按这些替换得到的多项式（味参数一个不动），原生成元就是正极小类 $M^+_{\mathbf b,p^\uparrow}$。中心平移接着把它写成互补负极小余权的形式：$M^+_{\mathbf b,p^\uparrow}=z\,M^-_{\mathbf d-\mathbf b,p^\uparrow}$（`sections/cocharacters.tex:555-569`）。两个余权有同一个外尔稳定化子，所以同一个 $p^\uparrow$ 在两侧都是容许装饰，它未必只依赖互补负极小余权挑出的那些变量，`sections/cocharacters.tex:572-574` 用根的荷生成那条引理（结构扫描显示它在 `sections/cocharacters.tex:294`）允许全部稳定化子不变的装饰。恒等式本身直接来自极小公式：所有物质权与中心余权的配对都是平凡的，而中心平移认出极小轨道及其等变切丛；等价的说法是与可逆的中心类做卷积，因此它连同基本类的约定一起成立，重新规极小生成元只改一个非零常数（`sections/cocharacters.tex:575-581`）。

## §14 自由性矛盾的落点：一对正交分解造出多余环面

第五步把"存活"这个假设逼成一份整数分解。设 $M^+_{\mathbf b,p^\uparrow}$ 在余特征固定商里的像非零。任何含非零 $\widehat\nu$-权因子的词在该商中消失，所以非零像要求存在分解 $\mathbf b=\sum_a\boldsymbol\alpha_a$，其中每个 $\boldsymbol\alpha_a\in\Delta_{\widehat Q}$ 且 $\widehat\nu\cdot\boldsymbol\alpha_a=0$（`sections/cocharacters.tex:583-595`）。因为 $z$ 是该商里一个权为零的可逆元，陪极恒等式迫使 $M^-_{\mathbf d-\mathbf b,p^\uparrow}$ 同样存活，对同一条引理的负半边再用一次，得 $\mathbf d-\mathbf b=\sum_b\boldsymbol\beta_b$，$\boldsymbol\beta_b\in\Delta_{\widehat Q}$、$\widehat\nu\cdot\boldsymbol\beta_b=0$（`sections/cocharacters.tex:596-606`）。两个和都非空：$\mathbf b\ne0$，而它的 $\infty$ 分量为零，$\mathbf d$ 的那一个分量是 $1$（`sections/cocharacters.tex:607-608`）。

第六步是把分解翻成不稳定点。以上两份分解合起来把 $\mathbf d$ 表成至少两个非零维数向量 $\boldsymbol\gamma_1,\dots,\boldsymbol\gamma_k\in\Delta_{\widehat Q}$ 之和，每个都正交于 $\widehat\nu$（`sections/cocharacters.tex:610-613`）。对每个加项取根的荷那条力矩引理给出的点，实中心参数选 $\widehat\nu$；用顶点空间上的正交分解取这些点的直和。动量映射在直和上分块对角，因此所得点满足 $\mu_{\mathbb C}=0$、$\mu_{\mathbb R}=\tau_{\widehat\nu}$（`sections/cocharacters.tex:614-622`），而它的稳定化子包含 $k$ 个独立的分块标量圆（`sections/cocharacters.tex:623`）。那条力矩引理的正文我在 `sections/cocharacters.tex:417` 之后的区间没有读到，只读到它结论在这里被使用的方式；[推测] 它给出的是：对每个与 $\widehat\nu$ 正交的根荷 $\boldsymbol\gamma$，在实中心水平 $\tau_{\widehat\nu}$ 上存在一个以 $\boldsymbol\gamma$ 为拓扑类的半稳定点，其分块标量作用留在稳定化子里。`sections/cocharacters.tex:480-482` 那句"一次旋转把这个值送到 $(\tau_{\boldsymbol\theta},0,0)$"（引 HKLR 87 §3(D)）说明非空性是靠四元数旋转在三个动量水平之间搬动得到的。

关键的相消在 `sections/cocharacters.tex:625-629`：放大后的约化恰是原来的带框约化，因为额外对角标量在各箭空间及其对偶上作用无效、它的动量方程冗余、而 $\widehat\nu$ 在其上平凡；除掉这个标量之后，稳定化子仍含一个维数为 $k-1>0$ 的环面。于是特征层的仿射 Kempf-Ness 对应说：所得点在原复动量零纤维 $\mu^{-1}(0)$ 中是 $\nu$-半稳定的（`sections/cocharacters.tex:630-632`），这与假设的自由作用矛盾。`sections/cocharacters.tex:633-635` 补了我最容易忽略的一句：当稳定迹为空时论证同样适用，因为它会在本来不该有半稳定点的地方造出一个来。我把这两行当成整节对我原先理解的纠正：正则性假设里"半稳定即稳定"与"作用自由"这两条不是我为了 $X$ 光滑而付的代价，它们是这条矛盾论证的全部弹药。

第七步是理想的夹逼。既然每个非平凡正极小生成元都在余特征固定商里消失，负极小者由 $M^-_{\mathbf b,p^\uparrow}=z^{-1}M^+_{\mathbf d-\mathbf b,p^\uparrow}$ 与把两半交换的同一论证也消失（`sections/cocharacters.tex:637-641`）。由 `sections/preliminaries.tex:149-151`，这些极小类生成的正是非零全拓扑荷空间生成的理想，故它含于非零 $\nu$-权空间生成的理想；反过来，对 $m\ne0$，权空间 $(A_F)_m$ 是若干非零拓扑荷空间之和，给出反向包含（`sections/cocharacters.tex:642-646`）。两理想相等即命题；全部规范秩为零时没有这类生成元，结论显然（`sections/cocharacters.tex:648-649`）。

## §15 收尾：一个交换三角形把两条任务缝起来

`main.tex:66-80` 只有十五行，但它要求前面每一件事都以"分次 $R$-代数"的形态交付。它写下两条同构 $\mathbb C[Y_{\mathfrak f}^{\nu}]\xrightarrow[\ \sim\ ]{\beta}B_F\xrightarrow[\ \sim\ ]{\alpha}H_F^*(X)$，并要求 $(\alpha\circ\beta)\circ\phi_C=\phi_H$（`main.tex:70-74`）。由是 $\ker\phi_C=\ker\phi_H$；$\alpha\circ\beta$ 的逆就是主定理里那个同构；$\phi_H$ 的满性使它成为与系数映射相容的唯一同构；所有商环都按方案意义取，幂零元保留（`main.tex:76-79`）。

我把这个三角形条件单独想了一会儿。它不是锦上添花：若我手里有 $B_F\simeq H_F^*(X)$ 却认不出它是否与 $\phi_C$、$\phi_H$ 交换，那我证明的东西与猜想陈述不是一件事，因为在 $R$ 上的代数结构才是"等变"的意思。这里的顺序也值得留意：先有 $I_{\mathrm{top}}=I_H$（经由 $B_F\twoheadrightarrow H_F^*(X)$ 那条满射），再有 $\mathbb C[Y_{\mathfrak f}^{\nu}]\to B_F$ 是同构，两者在 $A_F$ 内部相互独立，缝合处只有 $R$ 的ACTION。[推测] 之所以强调独立性，是因为第一条用了稳定对与上同调、第二条只在库仑代数内部与动量水平上做文章，若第二条反过来依赖第一条的结论，§14 那条矛盾论证就要预先知道 $H_F^*(X)$ 的结构，而它恰恰是要求的东西。

还有一处我确认过：分次的口径在三角形里不会错位。$H_F^*(X)$ 用普通上同调分次，$B_F$ 用 BFN 同调分次，主定理的陈述把两边各自的分次写清楚（`sections/introduction.tex:87`），而味提升一节里那条"$S_+$-约化保持分次"（`sections/deformations.tex:120-123`）与味基变换引理里"尊重两个分次"（`sections/preliminaries.tex:164`）是保证 $\alpha$、$\beta$ 都是分次映射的两处接口。

## §16 与最初设想的差异：八条自我更正

第一条差异在对象上。我一开始把"不动概形的函数环"想成"不动点加上切方向的重数"，读完 §13、§14 才知道本文全程在操作一个理想：$\langle(A_F)_m:m\ne0\rangle$ 与 $\langle A_F^{(d)}:d\ne0\rangle$ 是否相等（`sections/cocharacters.tex:642-646`）。点集层面的直觉在这里连辅助作用都算不上。

第二条在同构的来源。我原打算显式构造一个由卷积算子给出的映射，实际拿到的是两条满射加两次夹逼：几何给单向（`sections/stable-pairs.tex:6-14`），组合给反向的维数（`sections/laurent.tex:237-246`），算术把维数钉成 Hausel 的多项式（`sections/introduction.tex:242-244`），唯一性由满射自动落定（`main.tex:76-78`）。

第三条在味参数的地位。我以为味是最后加上的装饰，实际 `sections/deformations.tex:92-132` 把任意味归约成"一个有下界的分次模满足 $J=S_+J$"，而 `sections/preliminaries.tex:30-38` 先把任意交换环面化成逐箭特征、逐框对角的形状。味的处理是结构件。

第四条在圈。我原把圈当作要靠假设排除的病态数据（本文反而明示允许，`sections/introduction.tex:23-24`），实际加圈是证明的发动机：`sections/laurent.tex:68-77` 靠它消掉格拉斯曼分母，`sections/deformations.tex:143-238` 再靠子群局域化把它拆回去。同一个字母 $z$ 在 §13 里还是可逆的单极子参数，与那里的二次质量参数互不相干（`sections/cocharacters.tex:530-531`）。

第五条在正则性假设。我以为它是为了让 $X$ 光滑的技术条件，实际"作用自由"是 §14 那个矛盾的靶心（`sections/cocharacters.tex:623-635`），"半稳定即稳定"保证 $\mu_{\mathbb R}=\tau_{\widehat\nu}$ 造出的点确实落在被讨论的纤维里。光滑性是副产品。

第六条在空情形。我原打算把 $D=\varnothing$ 单独立一小节，实际它散在四处：味提升里"按零模成立"（`sections/deformations.tex:113`）、loop 消去里"论证一字不改地适用"（`sections/deformations.tex:258-259`）、矛盾论证里"在不存在处造点"（`sections/cocharacters.tex:633-635`）、定理陈述里"其环为零"（`sections/introduction.tex:88`）。

第七条在分次。拓扑荷 $d$、余特征权 $\nu\cdot d$、上同调次数、$q$ 记的上同调次之半，四者在我脑子里起初是一件事（`sections/introduction.tex:198-200`、`sections/laurent.tex:174-178`）。$\deg M_{\lambda,p}=2c_\lambda-2a_\lambda+\deg p$（`sections/preliminaries.tex:135`）是把这些换算清楚的那条式子。

第八条在证明的边界。`sections/introduction.tex:144-148` 明确不主张量子化陈述、不推广到任意约化规范群，并指出范围之外此类认同可以失败；这与它把"所有有限箭图数据"当作射程的态度是配套的。我现在写研究计划时会把"哪些断言我不做"当成正文的一部分，并非脚注。

## §17 取证窗口与未读区间的清单

把这次读过的窗口逐条列出来，字节按各文件平均每行字节折算，量级可靠、个位不必当真。第 1 次调用是全目录结构扫描，取 build 下十个 .tex 的小节标题与定理环境行号；第 2 次读 `main.tex:1-83`，全文 3,343 字节；第 3、4 两次把 `sections/introduction.tex` 的 290 行按 1-130 与 130-290 分窗读完，约 7,200 与 8,900 字节；第 5 次读 `sections/preliminaries.tex:1-200`，约 10,900 字节；第 6 次读 `sections/cocharacters.tex:480-650`，约 7,900 字节；第 7 次落首块；第 8 次读 `sections/stable-pairs.tex:1-230`，约 10,100 字节；第 9 次读 `sections/deformations.tex:92-281`，约 9,300 字节；第 10 次读 `sections/laurent.tex:28-272`，约 10,900 字节。每个窗口都在 12,000 字节以内，取证调用共 10 次封顶，没有越界。

未读区间如实列出。`sections/counting.tex`（17,921 字节、387 行）与 `sections/correspondences.tex`（14,728 字节、311 行）整节未开窗口，我对它们的了解全部来自 `sections/introduction.tex:219-220`、`sections/introduction.tex:242-247`、`sections/laurent.tex:220-235` 与 `sections/stable-pairs.tex:16-18` 这几处接口，加上结构扫描里见到的节题与定理行号；这两节里凡我在 §7、§10 写过机制的地方都带 [推测] 标记。`sections/preliminaries.tex:200-254` 是正则稳定局部常值性那条引理的正文，我只读到它的标题行；`sections/stable-pairs.tex:230-390` 覆盖中性分支二次标准形的后半与那条满射命题的证明主体，未读；`sections/laurent.tex:1-27` 与 `sections/laurent.tex:272-467` 未读，前者是记号约定段、后者是滤过证明的后半与边界情形评注；`sections/cocharacters.tex:1-479` 未读，里面有不可分解荷上的生成性、多项式单极子映射、根的荷生成、不可分解元与中心力矩值四个小节，我只在 `sections/cocharacters.tex:480-482` 读到其中一处结论的尾巴；`sections/deformations.tex:1-91` 未读，含 Betti 独立性引理与形变设定。`build/figures/proof-route.tex`（2,721 字节）按 §0 的口径只当图示，不作正文素材；`references.bib` 不是素材。

由此产生的三个薄弱判断我要提前说清。第一个是 §10 里那条生成函数比值推论的内容；第二个是 §7 里分解引理的具体形态；第三个是 §12 里 Betti 独立性引理到底用了四元数旋转还是紧支撑上同调的常值性。这三处我在正文里都标了 [推测]，并且没有把它们当作已证事实用来推后面的结论。

## §18 自查口径与本稿的写作纪律

这一节记下我自己定的三条检查，以及它们在写完 §17 时的实测值；台账落盘后另有一次复量，数字以交付报告为准。

第一条是定界符。全文行内数学一律成对写，跨行只用 `\[` 与 `\]`，我禁止自己在行末留开口；写到这里的实测是数学定界符累计 1,048 枚、逐行奇偶检查无异常行。第二条是台账。五列台账的表头行与带空格的分隔行全文各只出现一次，数据行每行恰好六枚竖线，格内凡涉及绝对值、范数、限制一律用成对的命令写法，我在 §9 写 $\lVert\lambda\rVert^2$ 与在 §16 写 $\mathbf w\cdot(\mathbf v-\mathbf l)$ 时就是照这条走的；需要竖线做"在某子环上限制"这类意思时用 `\upharpoonright`，需要绝对值时用 `\lvert` 与 `\rvert`。第三条是取材。正文里每个 `文件:行` 都对应本会话真的读过的行号区间，未读区间只在 §17 里按文件名登记，不冒充位置引用。

还有两条写作纪律值得记。其一是我不把素材里的自定义宏名沿用过来：素材的序言定义了一批缩写记法，本稿一律展开成标准写法，比如把常数域写成 $\mathbb C$、把形式幂级数环写成 $\mathbb C[[t]]$、把洛朗级数域写成 $\mathbb C((t))$、把格拉斯曼簇写作 `\operatorname{Gr}`、把欧拉类写作 `\operatorname{eu}`、把希尔伯特级数写作 `\operatorname{Hilb}`；素材里那几个由自定义命令承担的重音字母地名，我在 §3 用不加重音的拉丁拼写代替。其二是我不抄素材的定理编号与交叉引用记法，所有指向都用行号；这一条在 §15 尤其重要，那里我只引了 `main.tex:70-74` 与 `sections/introduction.tex:87`，没有借用素材自己的编号体系。

顺带记一条读法上的教训：素材的摘要与引言把整个证明写成了四段提纲（`sections/introduction.tex:210-288`），我起初以为读完提纲就可以动笔，结果 §9 的归纳论证里那句重排不等式（`sections/laurent.tex:114-120`）逼我回头把正文读了两遍。提纲能给路线，给不了不等号的方向。

## §19 勘误与违例申报

已落盘的内容一个字不回改，以下按类别申报，交本体侧机械清理。

首块体量：首次落盘发生在第 7 次调用，落盘 17,903 字节，落在 15,000 至 30,000 的合规带内，但低于 20,000 的目标下限，按规格在此申报；落盘后没有等待取证读完，随即连续追加，取证在第 10 次调用终止。本单是新建批，按规格只允许一次建立动作，因此没有执行写探针那一步（无既有文件可量基线）。

违例字符串命中三类，均不做就地改写。第一类是转折替代式的连接写法，共 3 处，分别在第 3 节讲无穷小结构那一句、第 12 节的小节标题、第 16 节第八条末句。第二类是套话式的替换连接短语，1 处，在第 1 节末段讲"唯一性从满性掉下来"那一句的开头。第三类是行内数学定界符里的一段无意义内容，1 处，在第 4 节中段讲取约化结构那一句，本意是写"以及第 2 节"，误写成控制序列与花括号数字的组合；该行定界符成对、奇偶无误，仅内容废。

英文残留另有 15 处，分布在第 2 节 1 处（簇名的复数形式）、第 5 节 1 处（圈一词的复数）、第 6 节 2 处（一个形容线丛性质的形容词、一个短语名词）、第 9 节 2 处（分拆名与形容词各 1）、第 10 节 3 处（环面形容词、人名拼写、以及一处素材内部记法名）、第 11 节 2 处（扩大一词与限制一词）、第 12 节与第 13 节与第 16 节各 1 处（同一短语，指圈消去步骤）、第 15 节 1 处（一个全大写的动作名词）。其中第 10 节那处素材记法名同时违反"不抄素材内部标签"的口径，一并申报。

格式类偏差两项。其一是位置引用的包裹形态不统一：第 0 节至第 9 节的位置串按裸写形式落在正文里，自第 10 节起改为一对包裹符的形态，需要统一处理；台账列内一律用包裹形态。其二是裸竖线 1 处，在第 9 节的求和记号里把一个绝对值写成了同形字符对，该行不在台账内、不影响台账每行六枚分隔符的判定，但仍属禁用形态。

内容类缺陷两项。第 13 节末句有一处动词漏字（"重新规"后缺"格化"二字），语义仍可读，不做回填。第 10 节与第 12 节各有对未读文件内容的机制性猜测，正文里都带了 [推测] 标记并在第 17 节集中列出，未把猜测用作后续结论的前提；除此以外本稿没有把未读区间写成已读事实的地方。

取材面自查：本单只从该目录 build 下的 .tex 取正文素材，未使用任何文本抽取工具，未打开任何 PDF，未执行版本控制命令，未读取规格文件以外的工具目录文件，未读取任何笔记成品与清单文件，未在工具目录留下临时文件；探针与检查命令的输出只落在标准输出。

## §20 台账

下面把本稿反复使用的那些量与它们的落点列成一张表，位置一栏只写本会话真读过的行区间；最后一列记的是我若把该量改动后证明会在哪一步断开。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| `$X=D/G$` | 光滑 Nakajima 簇，允许 $D=\varnothing$ | `sections/introduction.tex:37-40` | 主定理左侧与 $I_H$ | 空情形失去零环约定，唯一性那步断 |
| `$G=\prod_i\operatorname{GL}(V_i)$` | $\dim V_i=v_i$，$\dim W_i=w_i$ | `sections/introduction.tex:26` | $N$、$A_F$、$R$ 三处 | 拓扑荷定义改变，滤过指标全偏 |
| `$N=\bigoplus_a\operatorname{Hom}(V_i,V_j)\oplus\bigoplus_i\operatorname{Hom}(V_i,W_i)$` | 双基本表示与框同态之和 | `sections/introduction.tex:26-28` | 动量映射与极小类分子 | 权重集变动，消分母那步失效 |
| $\langle\mu(s,p),\xi\rangle=\langle p,\xi s\rangle$ | 余切动量映射的定性式 | `sections/introduction.tex:32-33` | $D$ 的定义与第 14 节造点 | 稳定性判据换掉，矛盾不再成立 |
| $\nu$ 正则 | 半稳定即稳定且 $G$ 作用自由 | `sections/introduction.tex:34-36` | 满射与固定方案命题 | 自由性一失，多余环面不构成矛盾 |
| `$\mathcal R$` | $\{[g,s]\in G(\mathbb C((t)))\times_{G(\mathbb C[[t]])}N(\mathbb C[[t]])\}$ | `sections/introduction.tex:45` | $A_F$ 的构造 | 卷积无从定义 |
| `$A_F$` | $H_*^{G(\mathbb C[[t]])\times F}(\mathcal R;\mathbb C)$ | `sections/introduction.tex:47` | 两个固定商 | 商理想无处安放 |
| `$T_{\mathrm{top}}$` | $\operatorname{Hom}(\pi_1(G),\mathbb C^\times)$，$\pi_1(G)=\mathbb Z^{\{i:v_i>0\}}$ | `sections/introduction.tex:53-54` | $B_F$ 的定义 | 全环面商与余特征商混同 |
| `$\mathbb C[Y_{\mathfrak f}^{\nu}]$` | $A_F/\langle(A_F)_m:m\ne0\rangle$，不取约化 | `sections/introduction.tex:57-61` | 主定理右侧 | 幂零一丢，正次上同调无对应物 |
| `$R$` | $\mathbb C[\operatorname{Lie}T\oplus\mathfrak f]^{\mathcal W}$ | `sections/introduction.tex:66-68` | $\phi_C$ 与 $\phi_H$ 的共同源 | 交换三角形的条件无从谈起 |
| 参数分次 | 线性规范参数与味参数皆为二次 | `sections/introduction.tex:76` | 希尔伯特级数的换算 | 以 $q$ 记半次数的约定错位 |
| 主定理断言 | 两核相等且两映射皆满 | `sections/introduction.tex:78-89` | 收尾一节 | 减弱成数值等式即非猜想形态 |
| 前例射程 | 有限型结论含 $A$、$D$、$E_6$，$E_7$、$E_8$ 另加框限制 | `sections/introduction.tex:135-137` | 本文的边界声明 | 无限制的 ADE 断言须收回 |
| `$\nu\cdot\mathbf b=0$` | 存在整数向量 $0<\mathbf b\le\mathbf v$ | `sections/introduction.tex:182-184` | 第二条任务的动机 | 若不存在则任务二自动成立 |
| `$B_F$` | $A_F/\langle A_F^{(d)}:d\ne0\rangle$ | `sections/preliminaries.tex:24-26` | $I_{\mathrm{top}}$ 与那条满射 | 与余特征商失去区分 |
| `$I_{\mathrm{top}}$、$I_H$` | 两条系数映射之核 | `sections/introduction.tex:194-196` | 任务一的全部 | 包含方向反转则满射无源 |
| 极小余权 | 分量全在 $\{0,1\}$ 或全在 $\{0,-1\}$ | `sections/preliminaries.tex:60-62` | 生成性与稳定对测试 | 词类缩小，中性词覆盖不了关系 |
| `$M_{\lambda,p}$` | 轨道和乘 $\prod_{\beta}\beta^{(-\langle\beta,\lambda'\rangle)_+}$ 除切空间欧拉类 | `sections/preliminaries.tex:81-89` | 洛朗模型与陪极恒等式 | 圈权重对不上分母 |
| `$\deg M_{\lambda,p}$` | $2c_\lambda-2a_\lambda+\deg p$ | `sections/preliminaries.tex:134-136` | 滤过的平移因子 | 次数账目整体偏移 |
| $R\to B_F$ 满 | 非平凡极小类的荷非零 | `sections/preliminaries.tex:147-151` | 唯一性与 $J=0$ 论证 | 同构的唯一性失据 |
| 味基变换 | $B_{F'}\otimes_{H^*_{F'}(\mathrm{pt})}H^*_F(\mathrm{pt})\cong B_F$ | `sections/preliminaries.tex:156-165` | 味提升 | $J/S_+J$ 的识别断裂 |
| 平凡直加因子 | 可设味逐箭与逐框对角 | `sections/preliminaries.tex:30-38` | 两条任务的一般性 | 任意交换环面失去归约路 |
| 满射形态 | $B_F\twoheadrightarrow H_F^*(X)$ 分次且与系数相容 | `sections/stable-pairs.tex:6-14` | 全环面定理 | 单向包含断，夹逼失去一源 |
| `$\deg\mathcal L_\nu$` | 非负，等号时截口为常 | `sections/stable-pairs.tex:34-39` | 支撑引理 | 词首因子的排除失效 |
| `$b=hG(\mathbb C[[t]])$` | $h\in G(\mathbb C[t^{-1}])$，$h(\infty)=1$ | `sections/stable-pairs.tex:46-48` | 中性分支上的限制 | 零次情形无平凡化 |
| `$W$` | $\operatorname{Res}(\langle p+y,n\rangle-\langle y,s\rangle)$ | `sections/stable-pairs.tex:111-116` | 测试函子 | 两侧延伸条件读不出来 |
| `$\mathsf T$` | $R\Gamma_{\mathsf K}(\widetilde L,\Phi_W\operatorname{pr}_L^*\mathcal F)$ | `sections/stable-pairs.tex:129-135` | 关系的检出 | 测试不再对 $R$ 线性 |
| `$\Sigma_B=\varnothing$` | 非零拓扑分支且特征线次数非正 | `sections/stable-pairs.tex:176-178` | 关系在上同调中消失 | 首因子不再被排除 |
| `$r=l\dim N$` | $E_b$ 在中性 $Z$ 上的秩 | `sections/stable-pairs.tex:213-215` | 二次标准形 | 平移 $[-2r]$ 错位 |
| `$A_0$` | $(\bigoplus_{\lambda\in\mathbb Z^\Omega}Pr_\lambda)^{\mathcal W}$ | `sections/laurent.tex:47-55` | 滤过与上界 | 分母残留，界无从谈起 |
| `$r_\lambda$` | $e^\lambda\prod_{\beta\in\mathcal B'}\beta^{E_\beta(\lambda)}$ | `sections/laurent.tex:29-34` | 乘积律 | 指标的非负性断链 |
| 乘积指标 | $E_\beta(\alpha)+E_\beta(\gamma)-E_\beta(\alpha+\gamma)$ 非负 | `sections/laurent.tex:59-65` | 直和的代数性 | 右边不再是子代数 |
| 消分母机制 | 圈贡献 $\prod_{a\in I,b\notin I}(x_{ib}-x_{ia})$ 与切权重同集 | `sections/laurent.tex:68-77` | 多项式系数模型 | 劳朗式退回分式 |
| 范数比较 | $\lVert\alpha+w\gamma\rVert^2\le\lVert\lambda\rVert^2$ | `sections/laurent.tex:114-120` | 首项的唯一性 | 低项无法交给归纳假设 |
| 装饰生成 | $P^{\mathcal W_\lambda}=\langle P^{\mathcal W_\alpha},P^{\mathcal W_\gamma}\rangle$ | `sections/laurent.tex:156-160` | 任意首项装饰的实现 | 反向包含缺生成元 |
| `$\mathcal M(\mathbf v)$` | $\sum_{s\ge1}s\,m_{i,s}=v_i$ | `sections/laurent.tex:180-184` | 上界的求和范围 | 滤过缺项 |
| `$D_m$` | $\frac12\sum_{i,j}\sum_{s,t\ge1}c_{ij}\min(s,t)m_{i,s}m_{j,t}$ | `sections/laurent.tex:192-194` | 幂平移因子 | 每档次数偏移半个格子 |
| `$q_S$` | $\prod_{d\in S}x_d^{w_{i(d)}}\prod_{d\in S,e\notin S}(x_d-x_e)^{b_{de}}$ | `sections/laurent.tex:206-211` | $h_m(q)$ | 分支不含 $0$ 时单位割丢失 |
| `$\operatorname{Hilb}(B_0;q)$` | 不超过 $\sum_m q^{C(\mathbf v)-D_m+\mathbf w\cdot(\mathbf v-\mathbf l)}h_m(q)$ | `sections/laurent.tex:237-246` | 与 Hausel 公式合成夹逼 | 上界失，等维数论证断 |
| `$\Lambda$` | $R_0[z]_{(\mathfrak m_0,z-1)}$ | `sections/deformations.tex:158-162` | 三处局域化 | 齐性下降不成立 |
| `$E_\lambda(x,z)$` | $\prod_i\prod_{a,b}(z+x_{ib}-x_{ia})^{(\lambda_{ia}-\lambda_{ib})_+}$ | `sections/deformations.tex:170-176` | 库仑侧比较 | 装卸装饰那步断链 |
| `$\Delta_\lambda(0,1)=1$` | 不变分母在该点取非零值 | `sections/deformations.tex:180-184` | 取逆的落点 | 局域化环之外无法取逆 |
| `$(D^+)^H=D$` | 新圈与其余切伙伴的 $H$-权非零 | `sections/deformations.tex:221-230` | 上同调侧比较 | 不动迹过大，比较断 |
| 齐性下降 | 由 $s(0)h\in I_X$ 得 $h\in I_X$ | `sections/deformations.tex:253-256` | $I_B=I_X$ | 只在局域化处相等，整体不等 |
| `$J=S_+J\Rightarrow J=0$` | $J$ 分次且有下界 | `sections/deformations.tex:115-129` | 味提升 | 任意味的情形失 |
| 总 Betti 数 | 与所选正则稳定无关 | `sections/deformations.tex:271-277` | 全环面定理 | 等维数的满射推不出同构 |
| 陪极恒等式 | $M^+_{\mathbf b,p^\uparrow}=z\,M^-_{\mathbf d-\mathbf b,p^\uparrow}$ | `sections/cocharacters.tex:566-569` | 存活性的双向分解 | 负半边用不上 |
| `$\widehat\nu_\infty$` | $-\sum_i\nu_iv_i$，使 $\widehat\nu\cdot\mathbf d=0$ | `sections/cocharacters.tex:536-544` | 忠实平坦扩张 | 中心因子破坏权的计算 |
| 分裂式 | $A_{\widehat Q,\mathbf d,F}\cong A_F\otimes_\mathbb C\mathbb C[\xi,z,z^{-1}]$ | `sections/cocharacters.tex:522-527` | 余特征固定商 | 放大型与原型的商不可比 |
| `$k-1>0$` | 除掉无效标量后的稳定化子环面维数 | `sections/cocharacters.tex:623-629` | 与自由性的矛盾 | 矛盾消失，命题不可证 |
| 理想相等 | $\langle A_F^{(d)}:d\ne0\rangle=\langle(A_F)_m:m\ne0\rangle$ | `sections/cocharacters.tex:642-647` | 收尾的缝合 | 右侧环换不成 $B_F$ |
| 交换条件 | $(\alpha\circ\beta)\circ\phi_C=\phi_H$ | `main.tex:70-74` | 主定理的形态 | 相容性失，证到的不是猜想 |
| 收尾满性 | $\phi_H$ 满使其逆唯一 | `main.tex:76-79` | 定理陈述 | 唯一性的断言无据 |
