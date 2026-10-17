# D557 四维标度不变理论的零割模化与共形改进重建

## 0 任务设定与登记

这一单是腾位后的补派：编号 D557、素材目录、字节量与队列行号都照上一轮原样执行，不做重新编号，上一轮只被并发上限挡回，稿纸仍是空的，所以本轮从取证第一步重新实测，不复用别的单子得到的任何结论。

研究对象的题目译成中文是《四维操作性量子场论中的标度对称与共形对称》，署名与日期按目录后缀照抄。它宣称：在四维、幺正、正能量、真空同时保持庞加莱对称与连续伸缩的一族场论上，标度对称蕴含局部共形对称。素材合计 429956 字节，分布在同一个 build 目录下的九个 .tex 文件里，最长单文件 88477 字节，属厚档，按主干分段取证，不敢自称通读。

我动笔时有三层动机。第一层是核对这条推理链中最脆的一环：改进标量 $L$ 究竟被假设进去了，还是真被构造出来了。摘要在 main.tex:59-66 里把重建框架放在结论之前，读起来像是有意的顺序安排，我需要确认这个顺序在正文里确实被维持。第二层是把作者如何用模化数据把标量逼出来这条路完整走一遍，记下每一步的代价与牺牲的普适性。第三层是判断结论强度：作者在 main.tex:65-66 与 01-introduction.tex:80-81 两处都强调结论只是局部的，把它读成全局共形作用是我的自由，却是他的否认。

笔记按第一人称研究过程写，覆盖初始猜想、走过的错路、关键转折、被证成的路线，最后写与最初设想的差额。素材抓不到的细节一律标 [推测]，并说明缺口在哪，不做补白；厚素材的分段读法决定了必然存在没读到的证明细节。

本单两条登记逐字照抄派单串，挂在 §0 末尾：

preprints/Scale-and-conformal-symmetry-in-four-dimensional-operational-quantum-field-theory-September-26-2026

其他队列第 380 行号

## 1 素材与取证口径

厚档条款要求先把 build 下的文件与字节数列出来。我用一次目录实测拿到全部数字，两种版式都探了：build 顶层只有一个 main.tex，其余正文在 build/sections/ 下，不存在 build/source/ 这一层，所以本单走的是顶层加子目录的版式。

实测清单（字节数）：build/main.tex 3413；build/sections/01-introduction.tex 17113；02-foundations.tex 65964；03-null-current.tex 43148；04-dispersion.tex 35273；05-charges-cones.tex 70380；06-extraction.tex 47141；07-short-products.tex 59047；08-reconstruction.tex 88477。九项相加 429956，与派单给的字节量吻合，说明我读的是派单指定的那一份，目录没认错。build 下另有 references.bib，同目录之外有 README.md、main.pdf 与 typst 分片，按规格这些都不作正文素材：PDF 一次没打开，typst 分片不算来源，README 只当索引。

取证调用共 15 次，明细照实登记：第 1 次定位目录，第 2 次实测 build 结构与字节数，第 3 次读 main.tex 全文（含摘要 main.tex:50-67），第 4 次读 01-introduction.tex 全文 279 行，第 5 次扫描九个文件的全部节与子节标题行号，第 6 次扫描定理与命题环境的起始位置，第 7 次把环境标题与标签位置压缩重扫一遍以拿到精确行号，第 8 次读 02-foundations.tex:1-175（假设与定义域命题），第 9 次读 02-foundations.tex:1128-1258（泰勒比较、谱比较、法向形式界），第 10 次读 03-null-current.tex:560-840（沃德公式、多项式延拓、测度命题），第 11 次读 04-dispersion.tex:462-707（精确尾、平台估计、零阶比较），第 12 次读 05-charges-cones.tex:1015-1360（残差伸缩荷、锥模化、时间默比乌斯作用），第 13 次读 06-extraction.tex:330-470（可达标量与方向无关性证明），第 14 次读 07-short-products.tex:1120-1250（回归定理），第 15 次读 08-reconstruction.tex:1212-1442（改进张量与局部沃德代数）。第 16 次调用就是本节所在的落盘。

由此可得的口径约束：本笔记引用的行号只可能来自上面这些实测窗口或同一目录的环境扫描，两者都是真实文件内容。02 章的 4.3 节权重选择、03 章的 3.2 节三个截断估计、05 章前一千行、07 章前一千行、08 章 295-1210 行我都没读，涉及它们的判断一律标 [推测]，并在正文里说明缺的是哪一段。台账位置列同理，只写我实测过的 `文件:行`。

## 2 初始动机与猜想

我第一次面对这个问题时，把标度不变理解成一个关于两点函数齐次性的陈述。若 $T^\mu{}_\mu=\partial^\mu V_\mu$，迹是一个散度，伸缩流 $D_\mu=x^\nu T_{\mu\nu}-V_\mu$ 守恒（01-introduction.tex:8，逐字照抄 02-foundations.tex:122-124），那么看起来只差一件事：把 $V_\mu$ 写成某个标量的梯度，$V_\mu=\partial_\mu L$ 一类的形式，迹就自动可移除。这个直觉在自由场例子里对得过分漂亮，以致我一开始把它当成了通用事实。

01-introduction.tex:97-113 给出的自由标量算例是我最初的信心来源。无质量实标量在四维真空福克表示里，取有界定域网全体与维克单项式作原始场，$Q=:\!\phi^2\!:$，正则应力张量与维里场是 $V_\mu=-\tfrac12\partial_\mu Q$，运动方程给出 $(T^{\mathrm{can}})^\mu{}_\mu=-:\!(\partial\phi)^2\!:=\Box(-Q/2)$，于是 $L=-Q/2$ 早已在场代数里，改进就是熟悉的那一项 $\tfrac16(\eta_{\mu\nu}\Box-\partial_\mu\partial_\nu)Q$。例子里标量是"给定的"，我把这一点读漏了。

我的第一个猜想因此是：任何满足正能、幺正、标度不变的场论，其迹的真空极化除以不变质量平方就会给出一个维数为 $2$ 的定域标量。这个猜想的错误形态在 01-introduction.tex:184-190 被作者自己点破：除法造出的只是一个波，即便它量纲与定域性都对，仍然还没有成为物理定域算符，混合积、正性、共同不变域、在原网中的附属性都欠着。

我的第二个猜想是：只要证明"改进问题有解"就够了，具体解在不在原物理场代数里属于技术问题。第二条也错了，错得更值钱。01-introduction.tex:115-125 的反例说明：把无质量标量限制在移位不变维克多项式生成的子理论上，$Q$ 被移掉，维里场变成 $V_\mu=-:\!\phi\partial_\mu\phi\!:$，可用的维数 $3$ 线性场是 $\partial_\mu\partial_\nu\phi$ 一类，其中不含洛伦兹矢量，而求导场的乘积从维数 $4$ 起跳。同一个自由理论，换一个场代数成员规定，标量就不在。成员关系是结论，不是记号问题，这正是全文最费力的一段（08-reconstruction.tex）存在的理由。

于是我最初的两条猜想都得改：改进标量必须被构造，且必须被证明属于给定的物理场代数；而这两件事的可用工具，看起来只能是真空模化数据与正性能量条件。剩下的问题变成：模化能给什么？

## 3 精确陈述：假设清单与主定理

先把假设拆开（02-foundations.tex:23 起，逐条对位）。希尔伯特空间 $\mathcal{H}$ 由原始物理场及其伴随在真空 $\Omega$ 上生成；场按有限分量洛伦兹多重态给出，其有序乘积是定义在共同不变多项式域 $\mathcal{E}$ 上的算符值怀特曼分布，具备非负平移谱、庞加莱协变与定域性，出现费米子时带通常的分级。真空在庞加莱变换与连续伸缩下不变，且明确不断言不变向量唯一（02-foundations.tex:31-32）。度规取 $\eta=\operatorname{diag}(1,-1,-1,-1)$，伸缩约定 $U_D(s)P_\mu U_D(-s)=e^sP_\mu$，$U_D(s)O(x)U_D(-s)=e^{sd}O(e^sx)$（02-foundations.tex:4-10）。

场的标度分解是本类定义的核心。原始场标记空间是代数直和 $\mathcal{F}=\bigoplus_{\Delta\in\Sigma}\mathcal{F}_\Delta$（01-introduction.tex:22 与 02-foundations.tex:59），每个 $A=\sum_{\Delta\in S_A}A_\Delta$ 的指标集 $S_A$ 有限，这就是有限标度支撑；$\Sigma\subset\mathbb{R}$ 离散、下有界、局部有限（02-foundations.tex:64-65），每档 $\mathcal{F}_\Delta$ 是有限维洛伦兹稳定空间，满足 $U_D(s)A_\Delta(x)U_D(-s)=e^{s\Delta}A_\Delta(e^sx)$（02-foundations.tex:69-71）。伴随保持每个实档，协变分布求导把 $\mathcal{F}_\Delta$ 送进 $\mathcal{F}_{\Delta+1}$，缺档按零理解（02-foundations.tex:79-81）。 multiplicity 的算法是把全部洛伦兹分量指标计入并施加线性场恒等式后每档只含有限多个有限分量多重态；不取无穷多标度分量的完备化（02-foundations.tex:82-83）。

域的规定：$\mathcal{D}_{\mathrm{fact}}\subset\mathcal{E}$ 是 $\Omega$ 与所有带紧致支撑因子检验的有限原始真空词的代数张成；对每个有限有序列表 $\mathbf{A}=(A_1,\ldots,A_n)$，$\Psi^{\mathrm{old}}_{\mathbf A}(h)$ 是原始因子检验真空映射对联合核 $h\in\mathcal{S}((\mathbb{R}^4)^n)$ 的连续延拓；$\mathcal{D}_{\mathrm{old}}=\operatorname{span}\{\Omega,\Psi^{\mathrm{old}}_{\mathbf A}(h)\}$（02-foundations.tex:34-45）。它没有希尔伯特或图完备化，不限词长与张量秩；被要求包含的域恰是 $\mathcal{D}_{\mathrm{old}}$（02-foundations.tex:50-52）。02-foundations.tex:144 的命题把"这些延拓存在"从假设变成结论，这是我在读假设清单时最意外的一处：作者把一个通常会被写进公理的事实降级为引理。

网的条款：给定为固定的单调网 $O\mapsto\mathcal{M}(O)$，弱闭的有界物理算符代数，协变于同一物理庞加莱与伸缩表示；类空间隔的代数交换；每个抹平原始场在其定域代数中有闭的附属实现，其伴随也扩张场的伴随（02-foundations.tex:85-91）。其他开区域由二重锥的并取生成（02-foundations.tex:94-97）。物理点场成员关系内禀于这个固定的网，与符号枚举无关（02-foundations.tex:98-99）。重建出的有限齐次场族被接纳当且仅当：定域支撑可缩进任意小二重锥；与自身及每个固定的原始场有限列表在所有有限长度上的联合分布都在含 $\mathcal{D}_{\mathrm{old}}$ 的相容共同不变域上建立；所需的伴随、协变、谱、定域与统计性质成立；在原定域代数中的相容抹平实现已建立（02-foundations.tex:100-113）。该判据不断言任何候选者的存在性，也不因无穷非齐次标度和收敛而接纳点场（02-foundations.tex:114-116）。框架不假设哈格对偶、分割性质、相空间估计或能量的场算符界（01-introduction.tex:52-53，02-foundations.tex:137-141）。

流的条件：原始场含对称守恒应力张量 $T_{\mu\nu}$，带平移与轨道洛伦兹沃德恒等式，另有定域维里场 $V_\mu$，满足 $D_\mu=x^\nu T_{\mu\nu}-V_\mu$，$\partial^\mu D_\mu=0$，$T^\mu{}_\mu=\partial^\mu V_\mu$；荷沃德恒等式按包围插入的紧致柯西薄层理解，并经求导法则扩到多项式乘积（02-foundations.tex:118-131）。

主定理（01-introduction.tex:56-72 逐字对照）：设上述假设成立，则物理应力张量容许一个定域、对称、守恒的改进，平移与洛伦兹沃德荷不变，迹为零。更精确地，取仿射沃德恒等式选出的厄米维数 $4$ 分量 $T^{(4)}$ 与维数 $3$ 分量 $V^{(3)}$，存在厄米物理标量场 $L$，维数为 $2$，使 $\partial^\mu V^{(3)}_\mu=\Box L$，且 $t_{\mu\nu}=T^{(4)}_{\mu\nu}+\frac13(\partial_\mu\partial_\nu-\eta_{\mu\nu}\Box)L$ 对称、守恒、无迹；对共形基灵向量场 $X$，流 $X^\nu t_{\mu\nu}$ 在物理场代数上满足未破缺的定域沃德恒等式，扩张其庞加莱与伸缩作用（01-introduction.tex:66-71）。

两处限定我必须抄进自己的记录：其一，被保留的物理数据是希尔伯特空间、有界定域网、$\mathcal{D}_{\mathrm{old}}$ 上的原始多项式场以及它们的平移与洛伦兹荷，共同域按重建的真空词扩大，这并不把新的附属扩张与原先选定的闭算符在其更大域上等同（01-introduction.tex:74-79）。其二，无界场的弱交换不足以提供证明所用的有界定域性，规范描述则在选定的规范不变定域代数内进行（01-introduction.tex:83-87）。$T^{(4)}$ 与 $V^{(3)}$ 的选取细节在 02-foundations.tex:358 的子节，我没有读进去，具体权重条件标 [推测]。

## 4 第一条错误路线：把逆波算子当成定域算符

我最自然的动作是直接解 $\Box L=T^\mu{}_\mu$。动量空间里这一步毫无阻力：把迹的真空分布除以 $-p^2$ 再作傅里叶反演，形式上得到一个量纲为 $2$ 的标量分布。01-introduction.tex:167-169 记下了这条路线的历史版本（米仓的逆波算子构造），并且诚实说明它需要交叉对称与动量空间解析性作为假设。

我在纸面上撞到的第一堵墙在 $p=0$。除以 $p^2$ 在质量壳上有极点，而四维标度不变的谱既允许无质量单粒子也允许连续谱，如何绕极点就成了一个选择，任何选择都改变结果的定域性。第二堵墙是定域：即便我把测试函数限制在某二重锥内，反演得到的分布也带一个余维 $1$ 的光锥尾巴，它作用在真空上生成的向量并不能由该锥内的有界代数产生。第三堵墙最要命：这个构造给出的对象没有混合积，没有正性，没有共同域，也就进不了 02-foundations.tex:100-113 的成员判据。

01-introduction.tex:11 还给了我一条方法论上的教训：充分的改进条件确实是一个定域标量满足 $T^\mu{}_\mu=\Box L$，可一般的改进问题允许张量势，所以证明若要用标量条件就必须把它推出来，不能把它作为待证结论的一部分预设。我当时写下的第一个"证明"恰好违反这条：我把 $V_\mu=\partial_\mu L$ 写成了假设，再从它导出无迹。这不是循环，只是虚假：它假设的正是定理的内容。

第二条错路是从散射出发的。我试过沿 $\alpha$ 定理的思路走：科马尔戈茨基与施维默的反常匹配加正伸缩子色散关系（01-introduction.tex:143-145），卢蒂、波尔钦斯基与拉塔齐把它推广到受扰控制与对非微扰标度不变理论的限制（01-introduction.tex:146-149），迪马尔斯基、科马尔戈茨基、施维默与泰森把振幅为零的论证磨尖但保留了红外正规化假设（01-introduction.tex:150-154）。作者对这条路的判语写在 01-introduction.tex:149-150：从壳上伸缩子约束到壳下定域迹恒等式之间有一段没被 bridge 的路。兹博夫斯基与斯肯德里斯展示了半局部项可以在壳上振幅全为零时仍携带标度反常（01-introduction.tex:156-158），迪马尔斯基、法恩斯沃思、科马尔戈茨基、卢蒂与普里莱皮纳进一步说明：没有合适的维数 $2$ 标量时反常规则排除广义自由迹，有该标量时或者改进是共形的、或者可选一个非广义自由的改进迹，后一支仍留改进问题（01-introduction.tex:159-165）。这条路对我毫无用处，因为它处理的探针是壳上的，而我要的 $L$ 是定义域上的算符。

第三条错路更算术些：我试过用弗雷登哈根与赫尔特尔那类多项式能量界把点场从局部代数里内禀地恢复出来（01-introduction.tex:181-184 提到了这条前史），但本框架明确不假设这类界（01-introduction.tex:52-53）。工具不足时硬用工具，结果是空的。三条错路把我推到同一个问题上：定域性与正性只能从真空模化数据里榨出来。

## 5 关键转折：零割面上的模化响应

转折发生在我放弃问"标量在哪"、改问"零割面的模化生成元告诉我们什么"的那一刻。做法是：给每个有界光滑轮廓 $g\colon\mathbb{R}^2\to\mathbb{R}$ 造一个楔形零割区域 $W_g$，取出它的物理模化生成元，写成 $H_g=b\,h_g$（03-null-current.tex:592）。这里的 $b$ 是纵向动量标度，$h$ 是一个横向的、待识别的正自伴形式。关键一步是证明 $g\mapsto H_g$ 实线性，并且对紧致支撑或施瓦茨轮廓有界轮廓沃德公式（03-null-current.tex:591-605）：$\langle C\Omega,H_gA\Omega\rangle=\int_{\mathbb{R}^2}\int_{\mathbb{R}}g(y)\rho(v)\,\mathcal{C}_\epsilon(T_{vv}(0,y,v)\Omega,CA\Omega)\,\mathrm{d}v\,\mathrm{d}^2y$，其中 $\rho$ 是任一光滑台阶，其导数落在该平面与两条因果交线之间的 $v$ 缺口里；表达式是真空向量分布配一个光滑向量，不是未抹平的算符积分。

线性一旦到手，正向的顺序就反过来了：正性、规范化与横向平移协变性给出一个正的算符值博尔测度 $\mu$，值两两交换，$H_g=b\int g(Y+z)\mu(\mathrm{d}z)$，$\mu(\mathbb{R}^2)=\mathbf{1}$，且测度与 $h$ 以及外部变量 $b,Y$ 交换（03-null-current.tex:776-800）。它的二阶矩 $\kappa=\int\lvert z\rvert^2\mu(\mathrm{d}z)$ 是递增闭形式极限，正自伴，并且 $\kappa\le h$（03-null-current.tex:791-795），组合 $K_n=b(\lvert Y\rvert^2+\kappa)$。命题明确不说 $\mu$ 是谱测度、也不说 $\kappa=h$，这个克制是后面几处论证能站住的前提。

我原本的期待是把 $\kappa$ 认成横向自由哈密顿量，作者只证明了序关系，因为普通形式序不够。真正的强度来自带形解析性得到的谱比较：02-foundations.tex:1173-1228 的标量谱比较给出 $\mathbf{1}_{(\lambda,\infty)}(h)\mathbf{1}_{[0,\lambda]}(h_\nu)=0$ 与 $\lVert h^s\psi\rVert\le\lVert h_\nu^s\psi\rVert$（$s>0$，含域包含），并有有界轮廓的版本 $\mathbf{1}_{(\lambda,\infty)}(h_f)\mathbf{1}_{(-\infty,\lambda]}(h_g)=0$（02-foundations.tex:1184-1187）。03-null-current.tex:754-773 接着用这个谱支撑比较把交换性从序里抬出来：取 $A=h_g$、$B=h_f$、$\varepsilon=\lVert f\rVert_\infty/s$，若 $r<t$ 且 $2\varepsilon<t-r$，则 $\mathbf{1}_{(-\infty,r]}(A)(A+B/s)\mathbf{1}_{[t,\infty)}(A)=0$，同型项也零，故 $B$ 的这块矩阵元为零，变 $r,t$ 得 $B$ 与 $A$ 的一切谱投影交换。这一段是我读到的最漂亮的算子引理。

第二个转折是泰勒比较（02-foundations.tex:1141-1170）：$g$ 有界光滑且黑塞有界时 $\lvert h_g-g(Y)\rvert\le C h$，$C=\frac12\sup_y\lVert g''(y)\rVert$，证明用抛物线割面的包含与富田对合的模数序，再在可数稠密中心集上先取不等式、逐共同谱叶让 $z$ 趋于 $Y$。它把"轮廓的曲率误差"精确折算成 $h$ 的一次幂，是我后来理解为何只要求 Lipschitz 常数的入口。

第三个转折是承认障碍只有一个具体形状。维数 $2$ 的标量比较要从二阶提到零阶，唯一残敌是所谓临界尾。04-dispersion.tex:495-541 的精确尾引理说：在汉克尔对角化 $\mathcal{H}_\nu F(M)=\int_0^\infty J_\nu(Mv)F(v)v\,\mathrm{d}v$（04-dispersion.tex:484）下，若 $F\in C_c^\infty(0,R)$，则 $\mathcal{U}(c\mathcal{H}_0F)(\lambda)=\left(\int_0^\infty vF(v)\,\mathrm{d}v\right)\lambda^{-2}d_c$ 对几乎每个 $\lambda>R$ 成立，$c=l,j_z,s_z$，且 $d_{j_z}=-d_l$，$d_{s_z}=-d_l/3$（04-dispersion.tex:503-506）。贝塞尔递推 $J_2(x)=2J_1(x)/x-J_0(x)$ 给出转移式 $(\mathcal{H}_2\mathcal{H}_0F)(v)=\frac{2}{v^2}\int_0^v rF(r)\,\mathrm{d}v-F(v)$，一阶径向矩为零的测试被压回支撑内，于是外尾必过单一泛函 $F\mapsto\int vF(v)\,\mathrm{d}v$，齐次性把系数钉成 $\lambda^{-2}$：这是精确尾，不只是渐近阶。

第四个转折是把 $\log L$ 从误差里请出来当探针。04-dispersion.tex:552-560 取平台测试 $g_L(z')=\lvert z'\rvert^2\eta_L(\log\lvert z'\rvert)$，支撑在 $(0,\log L)$，规范化常数由 $c_*=6\int_0^\infty t^3K_0(t)\,\mathrm{d}t=24$ 给出且不为零（04-dispersion.tex:600-602）。04-dispersion.tex:663-670 的零阶标量比较因此得到 $\mathbf{1}_{(s,\infty)}(\kappa)\mathbf{1}_{[0,s]}(h_0)$ 在 $l$ 通道上为零。读到此处我意识到，我最初想要的标量条件 $\partial^\mu V_\mu=\Box L$ 并不是被构造出来的，它是先被测度与矩"承认"的。

## 6 第一条被证成的路线：从割面到可达标量

这条路线的技术起点是极限次序（03-null-current.tex:567-572）：先 $S\to\infty$，再在固定 $R$ 下 $\delta\downarrow0$，最后 $R\to\infty$。带形项、帽形项与全通量项依次消失，法向面给出平面表达式，其中 $g$ 的依赖在最后极限之前是线性的，这就把 $H_g$ 的线性在这些定域向量上确立，随后由形式估计 $\lvert\langle\xi,H_g\eta\rangle\rvert\le\lVert g\rVert_\infty\lVert b^{1/2}\xi\rVert\lVert b^{1/2}\eta\rVert$（03-null-current.tex:580-583）扩到整个形式域。图的稠密性由对固定二重锥内赖什-施利德逼近作小平滑紧致平移卷积得到：卷积把希尔伯特范数送到 $b^{1/2}$ 的图范数，逼近恒等在后者中成立。

多项式延拓（03-null-current.tex:617-743）分三段，值得逐段记：第一段极化截断。对厄米的因子化多项式词 $A$，由所属单场实现之和的闭包得闭附属算符 $T$，$T\upharpoonright_{\mathcal{D}_{\mathrm{old}}}=A$，$T^*\uphook$ 给出反向伴随；取 $E_L=\mathbf{1}_{[0,L]}(\lvert T\rvert)$、$T_L=TE_L$、$A_L=\frac12(T_L+T_L^*)$，则 $\lVert(T-T_L)\psi\rVert\le L^{-2m}\lVert\lvert T\rvert^{2m+1}\psi\rVert$（03-null-current.tex:650-655），右侧是多项式域上的有限范数，故 $A_L\psi-A\psi=O(L^{-N})$ 对任意预设 $N$，且不需要本质自伴。第二段群卷积：绝不许对尖锐谱投影 $E_L$ 求导，先用固定紧致光滑核 $f$ 在时空群下卷积 $A_L$，群导数全落到 $f$ 上；乘积收敛显式写作 $\lVert C_L(s)A_L(r)\Omega-C(s)A(r)\Omega\rVert\le LC_NL^{-N}+C_N'L^{-N}$，对紧群参数一致。第三段检验函数稠密：把紧致支撑分片成乘积补丁，用有限和张量核逼近联合核，原始的联合分布界给出每个固定 $k$ 的 $\lVert(1+P^0)^k(\Psi_A(\varphi_{A,j})-\Psi_A(\varphi_A))\rVert\to0$；正平移谱让这些范数控制 $b^{1/2}$ 图范数与所用的一切实定平移索博列夫范数。

测度命题的证明里我特别留意规范化与紧性。$g\mapsto h_g$ 正、在 $\sup$ 范下收缩、$h_{\mathbf 1}=\mathbf 1$，与 $Y,h,b$ 强交换且与 boost 无关；在 $Y$ 表示里写 $h_g=M_{F_g}$，横向协变性 $\widetilde F_g(y)=\mathcal{L}(\tau_yg)$ 逐点成立，从而 $\mathcal{L}(g)=\widetilde F_g(0)$ 定义一个正收缩的内禀泛函（03-null-current.tex:803-824）。对无界 $h$ 的不等式先在 $h$ 的有界谱带上验证、再穷尽带。黎斯表示给出正算符值测度，交换性经有界单调逼近传到博尔值。真正的额外工作是排除无穷远质量：取径向 $\chi_0\in C_c^\infty(\mathbb{R}^2)$，$0\le\chi_0\le1$，原点附近为一且沿射线不增（03-null-current.tex:836-840），紧性论证单列。我读到这里才理解为什么作者说正规化需要一个独立的紧性论证。

路线的另一头是把这些形式量翻译成真实对称。05-charges-cones.tex:1029-1046 把未来时间锥按 $u<R$ 截、过去锥按 $u>-R$ 截，得到比较生成元 $T_R^\pm=D+Q\mp\frac{K}{2R}$（05-charges-cones.tex:1041）在指定域 $\mathscr{D}$ 上，谱测度二阶矩一致有界，且 $T_R^\pm\xi\pm K\xi/(2R)$ 是与 $R$ 与符号无关的希尔伯特向量。05-charges-cones.tex:1058 的命题宣告残差伸缩荷 $Q$ 在所有物理多项式向量上为零。05-charges-cones.tex:1235 的定理接着说：真空对真实未来与过去锥代数循环且分离，其模化生成元按本文约定恰为 $D$ 与 $-D$。05-charges-cones.tex:1300 再把线二重菱形的真实模化群拼成每个时间方向上的正能量时间默比乌斯表示。至此我确信，第一步被证成的路线不是"找到 $L$"，是"找到能定义 $L$ 的那类真实定域操作"。

## 7 提取阶段：从 $S_e$ 家族到方向无关的标量

有了真实时间默比乌斯作用，提取才有一个可操作的入口。06-extraction.tex:337 起是方向无关性的证明，06-extraction.tex:339 的命题给出的结论我抄成自己的话：对每个未来类时单位矢量 $e$ 造出的波 $S_e$ 全部相等，共同值记为 $S$，它是纯类时的洛伦兹标量、维数 $2$、带物理实定域性，具备规范的零向特殊共形作用，可以被放进辅助表示与 06-extraction.tex:31 的投影定域引理里。

作者把这一段的困难拆成三项，我在笔记里保留这个三分法，因为它比我原先的二分法更准：类时谱密度的形状、可能存在的无质量成分、真实零向生成元在所得标量上的作用。联结三者的是投影恒等式 $\langle u_F,u_{S_e}\rangle=\langle u_F,u_l\rangle$（06-extraction.tex:462 在能量片 $P_e=1$ 的乘重叶上逐字成立），它把归一化与方向依赖同时钉住。我这里注意到一个量纲约束：维数 $2$ 且带物理实定域的波，其真实权重至多为 $2$，$u_l$ 的真实权重是 $2,3,\ldots$（06-extraction.tex:458-460）。

二点断言的形状是：$S_e$ 家族与 $l$ 的联合谱测度的类时项都是通常测度 $\mathrm{d}^4p$ 在未来类时锥上的常数倍，没有任何密度被预设。证明路径我先复述再评。写 $\mu_{ee'}$ 为含 $l$ 作额外标记的联合谱项，对应的对易分布是 $C_{ee'}(x)=\int e^{\mathrm{i}p\cdot x}\,\mathrm{d}\mu_{ee'}(p)-\int e^{-\mathrm{i}p\cdot x}\,\mathrm{d}\mu_{e'e}(p)$（06-extraction.tex:362-363）。每个不变质量投影都与楔形富田数据交换，楔形分离与实性给出投影到任意紧致质量区间后的因果支撑；对 $l$，实富田数据就是 02 章已识别的规范标量数据，不需要物理点场成员身份。

齐次性把类时测度分解为 $M^3\,\mathrm{d}M\,\mathrm{d}\nu(p/M)$，$\nu$ 是单位双曲面上多项式有界测度（06-extraction.tex:373-374）。检验任意质量区间可知壳对易子对几乎每个质量有因果支撑，再伸缩就得到参照壳的同一陈述。作者特别注明这是对分布作分解，预设固定质量壳上的场是不允许的。壳对易子解克莱因-戈登方程，它在零时的位移与法向导数柯西数据支撑在空间原点，因而有限多个 $\delta$ 导数；该柯西问题的傅里叶解把壳测度表成通常对易测度乘一个 $p/M$ 的多项式，模去 $p^2=M^2$。这一步顺手证明了绝对连续性，预设绝对连续性是不行的。

自配对时壳多项式在 $p\mapsto-p$ 下为偶。取模壳关系后次数最小的代表，若最高次为 $k$，该齐次项在零方向的开集上非零，否则被 $p^2$ 整除就能降次。固定非零能量、$M\downarrow0$ 时它对 $\mathrm{d}^4p$ 密度的贡献是阶 $M^{-k}$，横向质量积分是 $M\,\mathrm{d}M$，正性与局部有限因此要求 $k<2$（06-extraction.tex:388-394）。偶性只留常数。矩阵测度的正性把每个交叉密度用自密度的几何平均控制，双曲面上的多项式有此全局界便由同一最高次论证成为常数，于是所有类时密度项都是常数，协变性让 $S_e$ 的自常数与 $e$ 无关。

我在这一段的收获是个方法性的：密度形状是被正性与齐次性夹出来的，任何"由对称性可知它是某个不变测度"的说法在这里都算作弊。$k<2$ 这种硬不等式才是可用的论证货币。

## 8 无质量分支：正性不够时的排除手法

正性允许无质量成分，所以必须单独排除。作者的处理让我停了很久，值得写细。设 $\rho=\sqrt{-W_\mu W^\mu}$ 为无质量泡利-卢班斯基长度，把整个洛伦兹族投影到紧致带 $0<a\le\rho\le b<\infty$（06-extraction.tex:402-405）。该投影与楔形模化数据交换，它的对易子是因果无质量解；前一段的点支撑柯西数据论证让它们成为无质量对易子的导数，四维下支撑在光锥上。

取该投影族的复循环张成，令 $X_+$ 与 $X_-$ 为未来锥与过去锥生成的实空间。平移谱唯一性使两者复循环：对某开锥上的抹平正交的向量，经管唯一性对全部平移也正交。惠更斯支撑给出 $X_-\subset X_+'$，故 $X_+$ 是标准的。洛伦兹变换保持它，从而与它的模化群交换；每个未来平移把它映进自身，正生成元的模化平移关系于是在该模化群下把所有 $P_\mu$ 同乘一个非平凡指数；洛伦兹生成元与该群交换，故 $\rho$ 也被同一因子伸缩。含在 $[a,b]$ 内的任何非零谱都不可能对一切这样的伸缩不变，投影空间为零；穷尽正带就排除了非零泡利-卢班斯基长度（06-extraction.tex:410-424）。

剩下的无质量表示其小群平移作用平凡，按螺旋度分解。关于 $e$ 的旋转标量只有螺旋度 $0$，因为同时固定 $e$ 与一个无质量动量的空间旋转在其波上作用平凡。用标量无质量不变测度，伸缩的内部部分在标量乘重上是动量无关的酉群 $W$，维数 $2$ 与洛伦兹协变把振幅写成 $S_e(p)=(p\cdot e)W(\log(p\cdot e))\beta$（06-extraction.tex:430-434）。两个方向时，对易子论证让交叉密度成为齐次二次壳多项式；在零壳上对固定 $e,e'$ 的旋转不变的二次标量是 $(p\cdot e)^2$、$(p\cdot e)(p\cdot e')$、$(p\cdot e')^2$ 的线性组合，于是 $\varphi(u)=\langle\beta,W(\log u)\beta\rangle$、$u=(p\cdot e')/(p\cdot e)$ 在可达区间上是 $u^{-1},1,u$ 的线性组合；相对快度增大时这些区间穷尽 $(0,\infty)$，系数在重叠上一致，又因 $\lvert\varphi(u)\rvert\le\lVert\beta\rVert^2$，两个非常数系数必须为零。交叉密度只能是 $c(p\cdot e)(p\cdot e')$，$c=\lVert\beta\rVert^2\ge0$（06-extraction.tex:436-449）。

这一支最后被能量片比较掐死：这个标量密度随 $e$ 与 $e'$ 的相对快度增长，与有界类时交叉密度不兼容；06-extraction.tex:457-459 明说下一步计算要带精确归一化来做这个比较。我读到这里回头看 06-extraction.tex:331 的先验估计 $\lVert e^{-\epsilon P_e}S_e(0)\rVert=O(\epsilon^{-2})$，才理解作者为何强调这类加权界同时供出全部时空检验界：$\lvert\boldsymbol{P}\rvert\le P_e$。

## 9 二阶矩升到零阶：平台测试的取舍

现在回到 04 章的收尾。零阶标量比较（04-dispersion.tex:663-671）要证的是 $\mathbf{1}_{(s,\infty)}(\kappa)\mathbf{1}_{[0,s]}(h_0)$ 限制在 $l$ 通道上为零，对所有 $s\ge0$。证明在正 $\lambda$ 谱上定义 $A_L(\lambda)=\lambda^{-2}\mu(g_L)$ 与 $B_{i,L}(\lambda)=\lambda^{-1}\mu(\partial_i g_L)$（04-dispersion.tex:676-677）。矩条件给出 $0\le A_L\le\mathbf{1}$ 与 $\lVert B_{i,L}\rVert\le C$ 一致有界：$\lvert\partial_i g_L(z')\rvert\le C\lvert z'\rvert$，正测度的柯西-施瓦茨把它的积分界成 $C\sqrt{\kappa}$。尺度协变性把每叶中 $z'/\lambda$ 的律认成乘重空间 $\mathcal{K}$ 上一个固定的正测度，均值为零、迹二阶矩为 $\mathbf{1}$，于是对每个固定乘重向量有 $A_L(\lambda)\to\mathbf{1}$、$B_{i,L}(\lambda)\to0$，条件是 $\lambda\to\infty$ 且 $L/\lambda\to\infty$（04-dispersion.tex:687-692）。第一个极限用可积权重 $\lvert z'/\lambda\rvert^2$，第二个用 $\lvert z'/\lambda\rvert$ 与一阶矩为零，极限处被积导数是 $2z'_i/\lambda$；有界收敛给出强收敛，无须一致速率。

$\ker\kappa$ 的处理是我最欣赏的小心：那里二阶矩为零，测度集中在 $z'=0$，轮廓 $g_L$ 与 $\partial_i g_L$ 在该点附近消失，此谱子空间对配对毫无贡献（04-dispersion.tex:702-705）。这类"零谱叶"若被含糊带过，正算符值测度的非乘性就会咬人。

平台尾公式（04-dispersion.tex:580-584）给出 $\lambda\mathcal{U}(cf_L)=c_*\mathbf{1}_{(1,L)}(\lambda)\lambda^{-1}d_c+E_{c,L}$，误差在 $L^2(\lambda\,\mathrm{d}\lambda;\mathcal{K})$ 中为 $O(1)$，$c=s_z,j_z$。为了不去给单个零矩以外的测试指派发散的形范数，作者用差 $c_*\mathcal{H}_0(F-L^{-2}F(\cdot/L))(M)=c_*(G(M)-G(LM))$ 替代 $f_L$，$G=\mathcal{H}_0F$，$\int vF(v)\,\mathrm{d}v=1$（04-dispersion.tex:629-634）。$G(0)=1$ 且快速下降，此差有与 $f_L$ 相同的平台与一致的边缘估计，误差 $e_L$ 满足 $\lVert\sqrt{h_2}e_L\rVert^2=\int_0^\infty(\lvert\mathscr{D}e_L\rvert^2+4\lvert e_L\rvert^2)\,\mathrm{d}M/M=O(1)$，$\mathscr{D}=M\partial_M$。两个 $\lambda^{-2}$ 尾在较大支撑半径之上精确相消，因为它们的矩都是 $1$；$G(LM)$ 在 $L^2(M\,\mathrm{d}M)$ 中的范数是 $L^{-1}\lVert G\rVert$，故其加权范数在 $CL$ 以下对固定 $C$ 为 $O(1)$。作者特意补了一句：用两个伸缩测试之差在此处是本质的，单个发散加权尾不许被指派任何估计（04-dispersion.tex:655-659）。

显式核也值得留在台账里：$f_L(M)=6\int_0^\infty t^3K_0(t)\eta_L(\log t-\log M)\,\mathrm{d}t$，$u_L(M)=-4\mathrm{i}\int_0^\infty t^2K_1(t)(2\eta_L+\eta_L')(\log t-\log M)\,\mathrm{d}t$（04-dispersion.tex:591-594），对数变量下是与可积且一阶矩有限核的卷积；改变傅里叶方向只改第二式的固定相位。远离位置原点存活的径向与矢量核是 $6M^4/(\lvert r\rVert^2+M^2)$ 与 $8M^3r_i/(\lvert r\rVert^2+M^2)$，经二维有质量格林变换得 $M^4K_0(M\lvert z'\rvert)$ 与 $M^4\widehat{z}'_iK_1(M\lvert z'\rvert)$ 的固定虚数倍（04-dispersion.tex:465-470）。标量项与横向无迹项对径向测试及其一阶角谐波导数无贡献，这一点在 04-dispersion.tex:470-472 被明确记下，是我一开始漏算的来源。

## 10 荷、域与三种群作用的分层

$Q=0$ 的证明我用到的技巧最多，逐层记。第一步对数平均：把 $T_R^\pm$ 的谱测度在 $S<\log R<2S$ 上按归一化勒贝格测度平均，取 $S\to\infty$ 的共同弱极限点，可先在紧化实直线上检验连续函数；稠密向量上的一致二阶矩消掉无穷远质量，极限是归一化正算符值测度，不断言谱值（05-charges-cones.tex:1064-1070）。伸缩把 $\log R$ 平移固定量，边界贡献 $O(S^{-1})$，故极限与 $D$ 交换，并有与 $D$ 谱测度的联合正测度 $E(\mathrm{d}d,\mathrm{d}s)$。作者把平均与矩的作用分得很清：对数平均只为与已知自伴算符 $D$ 交换，一致二阶矩只为弱极限里不丢一阶矩，两者都不把极限正算符值测度变成谱测度（05-charges-cones.tex:1079-1083）。

带形恒等式 $e^{-\pi D}\xi=e^{\mathrm{i}\pi\alpha}O(f^-)\Omega$、$f^-(x)=f(-x)$（05-charges-cones.tex:1094）来自维数 $\alpha$ 的厄米标度分量与实紧致未来锥支撑检验；$e^zx$ 在 $0<\operatorname{Im}z<\pi$ 有向前类时虚部，内锥紧致支撑加分部积分给出两端希尔伯特边界值。滤波伴随范数 $\lVert p(D)e^{-\pi D}\xi\rVert=\lVert p^{\#}(D)\xi\rVert$、$\lVert p^{\#}(D)\eta\rVert=\lVert p(D)\xi\rVert$（05-charges-cones.tex:1109）由反射格朗日恒等式得，$p^{\#}(D)=\sum_j\overline{c_j}U_D(s_j)$，实参数不动。比较富田伙伴的范数恰是这两个范数，且有限个伸缩支撑仍紧致落在各锥内，无须要求复滤波保持实空间。于是两个琴生型不等式 $\int\lvert p(d)\rvert^2e^{-2\pi s}\,\mathrm{d}\langle E^+\rangle_\xi\le\lVert p(D)e^{-\pi D}\xi\rVert^2$ 与 $\int\lvert p(d)\rvert^2e^{-2\pi d}e^{2\pi s}\,\mathrm{d}\langle E^-\rangle_\xi\le\lVert p(D)\xi\rVert^2$（05-charges-cones.tex:1122-1126）成立，截断加单调论证容许无界指数检验。

拆射 $\mu_\xi(\mathrm{d}d)\nu_d^\pm(\mathrm{d}s)$ 后条件一阶矩 $m_\pm(d)$ 几乎处处相等，而两不等式给出 $\int e^{-2\pi s}\nu_d^+(\mathrm{d}s)\le e^{-2\pi d}$ 与 $\int e^{2\pi s}\nu_d^-(\mathrm{d}s)\le e^{2\pi d}$，琴生给 $m_+(d)\ge d\ge m_-(d)$；均值相等逼出两者皆为 $d$，严格凸性逼出两个条件律都是 $\delta_d$（05-charges-cones.tex:1158-1161）。取 $p(d)=1+z e^{\mathrm{i}td}$ 对 $z\in\mathbb{C}$ 极化，说明两个测度傅里叶变换相同故相等，这是条件均值的相等，强过对 $d$ 的积分相等（05-charges-cones.tex:1144-1147）。正性再给每个可测集的柯西-施瓦茨：与 $s=d$ 不相交的可测集在 $\xi$ 上二次值为零，对 $\xi$ 的一切混合值也为零，交叉测度集中在对角线上，其一阶矩即 $D$ 的混合谱测度矩，与来自 $T_R^\pm=D+Q\mp K/(2R)$ 的一致可积一阶矩极限相减得 $\langle Q\phi,\xi\rangle=0$（05-charges-cones.tex:1176-1178）。

复检验拆实虚部、复齐次场写成 $O_\Delta=\frac12(O_\Delta+O_\Delta^\dagger)+\frac{\mathrm{i}}{2}(O_\Delta-O_\Delta^\dagger)$（05-charges-cones.tex:1186-1187），伴随保持实档故同档，线性扩到每个齐次原始场；$O=\sum_{\Delta\in S_O}O_\Delta$ 用有限标度支撑求和结论，作者着重声明这步只求和结论，不给非齐次场指派单一带形相位，也不把琴生用到跨档交叉项上（05-charges-cones.tex:1192-1195）。从单场到乘积靠插入 $\delta_QO(y)$：对 $J(y+r)$ 的对易子按 $r$ 中紧致通量截分，守恒与定域把通量收缩；该插入对物理场相对定域、按有序谱 temper，极端真空值对一切物理多项式为零；先对两个集体平移加阻尼，在光滑未来锥单场检验上消去右矢阻尼，再按分布消去左矢阻尼，平移协变去掉未来锥支撑限制，把插入移到类时开集的极端位置，有序管唯一性把零等式变全局。求导法则是相邻单插入对易子的望远镜，不是给 $J$ 或 $L$ 的新算符公理（05-charges-cones.tex:1198-1222）。

三种群作用的分层我要单独记牢，因为它们极易被混用：辅助共形作用定义在单场空间 $\Pi$ 上，由初级两点核固定，供给定域性与谱比较，零矩后来被证明按这种方式作用（01-introduction.tex:240-243，定理位置 05-charges-cones.tex:868）；真实时间默比乌斯作用在原 $\mathcal{H}$ 上，用锥与菱形模化群，搬运线菱形内有界操作并提取 $S$（01-introduction.tex:244-247，定理位置 05-charges-cones.tex:1300）；对偶空间 $\mathcal{H}_{\le2}$ 上的共形表示由短积沃德恒等式与四点正性构造，供给证明 $l=S$ 的径向估计（01-introduction.tex:248-251，命题位置 07-short-products.tex:585）。$\Pi$ 是标量通道 $l$、守恒矢量通道 $J$、无迹张量通道 $t$ 真空波的闭和，$\mathcal{H}_{\le2}$ 由真空与 $L,S,J,t$ 的一插入、二插入管向量张成（01-introduction.tex:230-233）。锥模化的证明里，$T_R^\pm\psi\to D\psi$ 在 $\mathscr{D}$ 上、$\mathscr{D}$ 是 $D$ 的芯，自伴芯收敛判据给强预解收敛与实酉群的强收敛；紧致子区域两个有界操作的真空向量与伴随真空向量落在比较标准空间及其复化所需的富田域里，标准空间二向量恒等式给出 $\langle B^*\Omega,e^{\mathrm{i}tT_R^+}A\Omega\rangle$ 到 $0\le\operatorname{Im}z\le2\pi$ 的标量全纯延拓，宽度 $2\pi$ 靠给每个向量分至多 $\pi$ 的虚演化并用 $e^{-\pi T_R^+}=J_RS_R$，比较对合从显示的边界公式里消失，分裂向量配对只用 $\operatorname{Dom}e^{-\pi T_R^+}$，不需要任何向量 $e^{-2\pi T_R^+}A\Omega$（05-charges-cones.tex:1242-1277）。

## 11 短积阶段：残差 $\ell=l-S$ 被逐条夹零

07 章的题目是短积与回到可达标量（07-short-products.tex:1）。它的骨架我从实测窗口的尾部倒推，中段（07:1-1120 的绝大部分）没读，涉及中段的机制一律标 [推测]。01-introduction.tex:205-211 的第四步给了合法的路标：真实的菱形模化变换从物理维里场提取维数 $2$ 的标量波 $S$，$S$ 有实定域性与原网中的有界逼近；形式迹波 $l$ 起初未必等于 $S$；到长度四的希尔伯特积在对偶空间上给出共形表示；该表示的径向正性与归一化流荷通量逼残差 $l-S$ 消失。

我读到的尾部是这套论证的最终一击，值得逐式抄下。残差已经与 $JL$、$JJ$、$LL$ 三点函数解耦：$\partial_y$ 混合二导把 $W(\ell_\infty L(y)L(z))$ 逼成零，平移协变让它成为 $y-z$ 的函数且黑塞为零，次数 $-2$ 排除仿射函数，于是 $W(\ell_\infty LL)=0$（07-short-products.tex:1120-1128）。要测它自己的标量范数，还需要一条含应力张量的恒等式，作者分两步：先用中心化特殊通量把允许的 $Jt$ 张量结构拆掉，再对剩下的 $Lt$ 函数用中心化伸缩通量。

$Jt$ 的拆法我读得很仔细，因为它是全篇最像共形场论教科书的一处，却又是算符级的。写 $R=\lvert z-y\rvert$、$n=(z-y)/R$，由旋转与尺度协变、$\rho,\sigma$ 对称、以及非零宇称奇对称张量的不存在，一般形状是 $W(\ell_\infty J_\mu(y)t_{\rho\sigma}(z))=R^{-5}[A n_\mu\delta_{\rho\sigma}+B(n_\rho\delta_{\sigma\mu}+n_\sigma\delta_{\rho\mu})+Dn_\mu n_\rho n_\sigma]$（07-short-products.tex:1140-1145）。取迹给 $4A+2B+D=0$；矢量散度给出 $R^{-6}\delta_{\rho\sigma}$ 与 $R^{-6}n_\rho n_\sigma$ 的系数分别为 $-2A+2B$ 与 $-2D-12B$，于是 $A=B=\gamma$、$D=-6\gamma$（07-short-products.tex:1147-1150），且此形状也满足张量散度。取以 $y$ 为中心的特殊向量场 $X_\alpha^\sigma=2(z-y)_\alpha(z-y)^\sigma-R^2\delta_\alpha{}^\sigma$，其角向部分与上述张量的收缩等于 $-\delta_{\alpha\mu}-2n_\alpha n_\mu$（07-short-products.tex:1163-1168），球面平均是 $-3\delta_{\alpha\mu}/2$，因为 $\langle n_\alpha n_\mu\rangle=\delta_{\alpha\mu}/4$；向量场供 $R^2$、面积供 $R^3$，与 $R^{-5}$ 相消，通量为 $-3\gamma\lvert S^3\rvert\delta_{\alpha\mu}/2$。中心化特殊变换湮灭初级场 $J$，由 $\ell_\infty$ 的共形通量性质该通量为零，故 $\gamma=0$（07-short-products.tex:1158-1176）。

回归定理（07-short-products.tex:1179-1186）断言 $l=S$、$\ell=0$。证明把 $W(\ell_\infty V(y)T(z))=0$（可达解耦的一条情形）按欧氏恒等式展开，$Jt$ 项刚消失，含 $L$ 导数的项由 $\partial_y$ 型恒等式与 $W(\ell_\infty LL)=0$ 消掉，剩下 $\partial_yW(\ell_\infty L(y)t(z))=0$；平移协变与次数 $-4$ 齐次性逼该函数为零，围绕 $L$ 的中心化伸缩通量给出 $0=2c\,W(\ell_\infty L)$，$c\ne0$（07-short-products.tex:1188-1201）。方向无关性命题排除无质量贡献后给出 $D(e)=B(e,e)=b$，于是 $S$ 与 $l-S$ 的常数两点密度为零：标量波通道正交，正交性不止在单个时间片上的标记层面。因此 $W(\ell_\infty L)$ 等于标量两点系数 $W(\ell_\infty\ell)$，后者是非负径向范数 $\lVert\lvert\ell\rangle\rVert^2$，对非零标量波严格正，通量等式逼它为零，故 $l=S$（07-short-products.tex:1202-1210）。

我在笔记里给这一节记两条评注。第一条：$\lVert\lvert\ell\rangle\rVert^2$ 这种"将残差当作一个径向范数来测"的写法，是本框架把正性用到算符层的唯一时机，前面所有谱比较都在单场空间里。第二条：通量等式里 $c\ne0$ 是被 04-dispersion.tex:600-602 的显式常数 $c_*=24$ 撑住的，一个纯拓扑的归一化论证在这里不够用。中段那两条未被读到的引理（07-short-products.tex:851 的低径向能量、07-short-products.tex:930 的外部麦克斯韦检验）与这里的径向演算显然同族，具体形状我只能标 [推测]。

## 12 有界逼近、全纯积与边界拉回

06 章后半提供短积得以存在的载体：有界逼近。06-extraction.tex:559 的子节标题是可达波的有界逼近，其命题在 06-extraction.tex:571；06-extraction.tex:676 处理全纯积、结与去抹平，命题在 06-extraction.tex:700；06-extraction.tex:849 给边界拉回法则，引理在 06-extraction.tex:856。这三段正文我没有读，机制描述只能依 01-introduction.tex:212-214 的第五步路标复述，属 [推测] 级：有界逼近供给每一有限长度的解析积；环境微分恒等式控制纯标量积；因果波动方程与特征高斯检验把 temper 性与谱支撑穿过含齐次原始槽位的混合排序传播；有限多重线性把标量与希尔伯特值边界扩到每个固定原始场列表，配同一联合检验核。

我读到的一处相邻事实值得记：06-extraction.tex:182 起处理真实与辅助时间权重，06-extraction.tex:200 的引理标题是区间佩利正则性与权重选取，同族权重界我实测到的是 $\lVert e^{-\epsilon P_e}S_e(0)\rVert=O(\epsilon^{-2})$ 以及 $\lvert\boldsymbol{P}\rvert\le P_e$ 供出全部时空检验界（06-extraction.tex:330-333）。这些界说明"实际权重至多 $2$"是提取 $S$ 的入场券：维数 $2$ 的波若真实权重超过 $2$，投影配对 $\langle u_F,u_{S_e}\rangle=\langle u_F,u_l\rangle$ 在能量片上就不成立。

我原本指望有界逼近直接给出一个强收敛的场算符序列，读到 08 章的附属性论证才明白作者的野心小得多也强得多：逼近只用来产生联合核上的收敛，算符身份要靠共同域的构造与交换性。这条区分我在 §14 再写。

## 13 重建：混合积、共同不变域与在原网中的附属

08 章题目是实轴重建与物理共形流（08-reconstruction.tex:1）。混合积定理在 08-reconstruction.tex:34，其后有标度与管谱引理（08-reconstruction.tex:98）、纯标量积命题（08-reconstruction.tex:149）、边界值与分布判据（08-reconstruction.tex:295）与傅里叶积分算子型判据（08-reconstruction.tex:343）、单合并面的定量边界估计（08-reconstruction.tex:412，引理位置 08-reconstruction.tex:470）、因果歧义与错误零质量支上的恢复（08-reconstruction.tex:604，系数分布引理 08-reconstruction.tex:650）、全局增长与谱及混合积的完成（08-reconstruction.tex:765）、共同域与在给定网中的附属（08-reconstruction.tex:934，交换子扩张引理 08-reconstruction.tex:1010，附属性命题 08-reconstruction.tex:1062）。这些区间的正文我都没读，只能按标题与 01-introduction.tex:212-222 的路标组织，机制细节标 [推测]；我实测到的是 08-reconstruction.tex:1212-1442 这一段收尾。

那段开头一句极要紧：记号 $L$ 自此表示在 $\mathcal{D}$ 上所得的物理厄米维数 $2$ 标量（08-reconstruction.tex:1213-1214）。前面 01-introduction.tex:276 的符号表已经警告过，$L$ 起初只是标量插入记号，其物理场实现要等混合积定理、共同域构造与附属性命题全部通过才成立。我把这条纪律称作记号卫生：同一个字母在证明的四五个阶段承担四种身份，任何把它们混用的推理都会看起来自动成立。

混合检验核上的附属性我读到的论证是这样的。紧致多项式插入有相容的附属实现：因子化的词取上面构造的单场实现的自然域乘积，有限多项式取自然和；它们的域包含 $\mathcal{D}$，伴随在其中包含反向伴随多项式，故可闭；每个交换子酉元及其逆保持它们的自然图，于是闭包附属，此处不需要无界因子之间任何交换（08-reconstruction.tex:1256-1264）。对联合检验核，把紧致支撑分成乘积补丁，在光滑检验拓扑下用有限和张量核逼近，得到因子化多项式 $P_j$；对每个固定的 $\mathcal{D}$ 词尾append，混合积定理给出 $P_j\psi\to P\psi$ 与 $P_j^\dagger\phi\to P^\dagger\phi$ 按希尔伯特范数收敛（08-reconstruction.tex:1268-1275）；因子化闭包的附属性提供与交换子酉元的交换，进而对 $C\in\mathcal{M}(O)'$ 的一切线性组合成立，有界性把 $C$ 传到极限，即 $\langle\phi,CP\psi\rangle=\langle P^\dagger\phi,C\psi\rangle$（08-reconstruction.tex:1276-1283）。反向伴随多项式满足反向交换恒等式。交换子扩张引理以 $A=P$、$A^\sharp=P^\dagger$ 供出每个紧致定域邻域的相容附属扩张，作者强调这是带所需伴随的扩张，不主张最小闭包或因子化闭包的极限；其极化截断是原网中有界操作，在 $\mathcal{D}$ 上连同伴随一起收敛，此处所有交换子都是原网的交换子（08-reconstruction.tex:1284-1292）。

我在这一节学到的教训与 §4 的第三条错路正好对上：除法造出的波与场之间的距离，全部由混合积、共同域、附属性三项填平，缺一项都只得到分布。02-foundations.tex:137-141 那句"有界定域性与原网附属是两个独立假设，场的弱交换限制与大得多的相对定域网中的附属都不提供它们"在这里变成可检验的记账条目。中心化场与相容族的两条命题（08-reconstruction.tex:1443、08-reconstruction.tex:1482、08-reconstruction.tex:1604）我同样没读正文，只知道它们把改进与沃德作用扩到每个被共同接纳的有限族，对应 01-introduction.tex:50 的预告。

## 14 改进张量与局部沃德代数

改进的最终形状在 08-reconstruction.tex:1219-1223：在 $\mathcal{D}$ 上定义 $t_{\mu\nu}=T_{\mu\nu}+\frac13(\partial_\mu\partial_\nu-\eta_{\mu\nu}\Box)L$，它是物理对称守恒张量，算符层迹恒等式给出 $t^\mu{}_\mu=0$。对仿射庞加莱基灵向量 $X$，其荷与 $T$ 的差是反对称超势的散度 $\frac13\partial^\lambda(X_\lambda\partial_\mu L-X_\mu\partial_\lambda L+(\partial_\lambda X_\mu)L)$（08-reconstruction.tex:1228-1232），紧致对易通量为零，故平移荷与洛伦兹荷一致。若初始应力张量需要 02 章的权重替换，还要加上被选张量与初始张量之间的局域差，该差对称、守恒、仿射荷为零（08-reconstruction.tex:1234-1238）。

沃德作用被定义成通量，并非荷：对实共形基灵场 $X$ 置 $j_{X,\mu}=t_{\mu\nu}X^\nu$、$\sigma_X=(\partial\cdot X)/4$，守恒与无迹给 $\partial^\mu j_{X,\mu}=0$，再定义 $\delta_XA=\mathrm{i}[q_X,A]$ 为包围插入的紧致对易通量（08-reconstruction.tex:1294-1301）。作者的措辞值得照抄进我的记录：这是 $\mathcal{D}$ 上的算符插入，不假设每个态上存在整体无界荷。具体做法是用相对坐标中的紧致核抹平两个场、用合并坐标抹平目标检验；帽形带同样的一通量归一化与定向；相对坐标里对易流无散且支撑在因果位置，两个归一化包围帽之差在那里是一个紧致梯度，加上类时外截断项；守恒与定域允许在保持目标被包围的前提下作精确形变或收缩；所得表达式是有限个联合抹平乘积之和，合并两个动量保持其余槽位的有序锥；$X$ 的多项式系数只给检验核的有限导数，不破坏这些性质（08-reconstruction.tex:1302-1314）。

对紧联合定域在 $O$ 内的目标，分成乘积补丁并在其定域余量内选相对帽；围绕一个词的通量是围绕其各槽位通量的有限和，故这些代表属于 $\mathfrak{P}_c(O)$；检验商掉零算符时，取一个绝对归一化紧致帽包围多项式代表的全部目标投影之并，它可以在 $O$ 外，形变把每个槽位帽认作该帽，代数对易子法则在因子检验上把它认作 $\mathrm{i}[Q_X,P]$，同一联合希尔伯特连续性把恒等式传到联合核；$Q_X$ 与 $P$ 都保持 $\mathcal{D}$，故 $P\upharpoonright_{\mathcal{D}}=0$ 时它消失（08-reconstruction.tex:1316-1327）。于是这些局域求导在 $\mathfrak{P}_c(O)$ 上良定并保持它，迭代是有限联合多项式，前面的交换论证供出它们的相容原网附属扩张。

真空通量在紧联合积上为零，依据是低能估计与其后的二进位荷估计（05-charges-cones.tex:529 与 08-reconstruction.tex:1331-1337）：新的紧多项式向量具备刚证明的楔形实性，流的真空波是同一个纯类时、平移光滑的波，质量带估计一致，低能与高能二进位界可和且不变。由此 $\sum_{i=1}^n W(A_1,\ldots,\delta_XA_i,\ldots,A_n)=0$（08-reconstruction.tex:1339-1342）。求导保持伴随；它在原始场上的平移、洛伦兹与伸缩部分是物理作用：超势处理前两条，残差伸缩荷命题消掉第三条里可能的守恒维里荷；先在旧真空腿上证明的恒等式经定域性、旧多项式稠密与有序边界唯一性扩到 $\mathcal{D}$（08-reconstruction.tex:1343-1349）。

初级恒等式有两条：$\delta_XL=X^\lambda\partial_\lambda L+2\sigma_XL$ 与 $\delta_Xt_{\mu\nu}=X^\lambda\partial_\lambda t_{\mu\nu}+(\partial_\mu X^\lambda)t_{\lambda\nu}+(\partial_\nu X^\lambda)t_{\mu\lambda}+2\sigma_Xt_{\mu\nu}$（08-reconstruction.tex:1354-1360）。它们的返回路径我按原文梳理：所有短解析积现在与联合温特积一致，先在分离真空波积上一致、再由延拓到处一致，于是球面与帽形的比较命题可直接用于物理联合对边界；对平移与目标 $T$，洛伦兹帽差就是物理平移沃德恒等式，其球面版本有那里固定的共同非零归一化；$L$ 的平移球面恒等式已证，在固定包围面上求导得 $\partial_\mu L,\partial_\nu L$ 类型的项，故对目标 $t$ 也成立。接着在正的对偶表示中（初级目标含 $L$ 与 $t$）共轭这些平移恒等式，搬运周围球面与其全纯基灵系数，得到对每个共形基灵场的球面恒等式；再按同样的平均柱体回到洛伦兹对易子，时间帽由联合温特边界定理收敛，两侧有固定类空间距并随厚度消失；$X$ 的维克拉回在这些紧曲面上全纯，故次数 $0$、$1$、$2$ 系数同一论证可用，归一化处处是平移归一化（08-reconstruction.tex:1362-1387）。两条恒等式在真空上成立，其差是相对定域插入，把Such插入移到类时开集极端位置，旧多项式稠密与有序唯一性给出真空消零即在 $\mathcal{D}$ 上消零，故它们是那域上的算符插入恒等式（08-reconstruction.tex:1388-1393）。

李代数闭合在最后：紧致通量沃德求导实现共形李代数，取主动作用约定 $[\delta_X,\delta_Y]=-\delta_{[X,Y]}$，并满足真空沃德恒等式、扩张原场代数上的仿射沃德求导（08-reconstruction.tex:1396-1404）。证明要点：取沃德变分时保持乘场的坐标固定；用初级 $t$ 恒等式、共形基灵方程与守恒直接微分得 $\delta_Xj_{Y,\mu}=\partial^\lambda(X_\lambda j_{Y,\mu}-X_\mu j_{Y,\lambda})-j_{[X,Y],\mu}$（08-reconstruction.tex:1410-1414），展开散度得 $4\sigma_Xj_{Y,\mu}+X\cdot\partial j_{Y,\mu}-(\partial^\lambda X_\mu)j_{Y,\lambda}$，减去 $j_{[X,Y]}$ 消掉 $Y$ 的导数，$\partial_\lambda X_\mu+\partial_\mu X_\lambda=2\sigma_X\eta_{\lambda\mu}$ 给出余下两个指标项与那个 $2\sigma_X$。选一个紧致通量 $Q_Y(F)$ 实现 $\delta_Y$，用更大的紧致通量实现 $\delta_X$ 作用在 $Q_Y(F)$ 与这些插入上，联合域上的求导法则给 $[\delta_X,\delta_Y]A=\mathrm{i}[\delta_XQ_Y(F),A]$；右端第一项是反对称散度，环绕紧插入的对易通量为零，分部积分只剩外边界，定域性容许在那里去掉截断；第二项给 $-\mathrm{i}[Q_{[X,Y]}(F),A]=-\delta_{[X,Y]}A$。此算式中所有乘积与迭代插入都由 $\mathcal{D}$ 上的紧联合核定义（08-reconstruction.tex:1424-1440）。

读到这里我才承认自己最初的问题问错了形式。我要的是一个标量算符，作者给的是一个由紧致通量定义的导子代数加上一个域上的记号实现；改进张量 $t_{\mu\nu}$ 只是这两者的联合产物。

## 15 与最初设想的差额

我把 §2 的两条猜想与最终架构并排放在一张表里，差额比我预期的大，逐条写清楚对我下次做同类问题有用。

第一条差额在定理的形式。我期待结论写成"存在算符 $L$"，实际结论写成两件事的合取：$\mathcal{D}$ 上有一个厄米维数 $2$ 标量的实现（08-reconstruction.tex:1213-1214），以及一族由紧致通量定义的导子 $\delta_X$ 满足 $[\delta_X,\delta_Y]=-\delta_{[X,Y]}$（08-reconstruction.tex:1396-1404）。改进公式本身 $t_{\mu\nu}=T_{\mu\nu}+\frac13(\partial_\mu\partial_\nu-\eta_{\mu\nu}\Box)L$ 只在证明的最后两页出现（08-reconstruction.tex:1219-1223），占 429956 字节素材的比重极小。我原先估计重建与沃德代数部分至多是附录，实测 08 章单文件 88477 字节，约占全文 $0.206$ 的比例，是九章里最长的一章，它的功能是把一个记号变成成员。

第二条差额在关键工具的归属。我以为标度到共形的枢纽是维数簿记：迹 $\partial^\mu V_\mu$ 是维数 $3$ 的散度，所以移除它需要维数 $2$ 的标量。这套簿记在 §2 里看起来无懈可击，它却只回答了"该有什么量纲"。实测的枢纽是谱序的解析来源：02-foundations.tex:1173-1228 用带形解析性把 $\mathbf{1}_{(\lambda,\infty)}(h)\mathbf{1}_{[0,\lambda]}(h_\nu)=0$ 与 $\lVert h^s\psi\rVert\le\lVert h_\nu^s\psi\rVert$ 证出来，再由 03-null-current.tex:754-773 把谱支撑比较抬成交换性，最后才有 $\kappa\le h$ 与 $K_n=b(\lvert Y\rvert^2+\kappa)$。维数簿记在这里只是让比较的两侧同量纲，起作用的是解析性。

第三条差额在模化被用来做什么。我原本只把模化当定域性机器，用它判断某个向量属于某个锥的实空间。实测显示模化还干了识别荷的活：$T_R^\pm=D+Q\mp K/(2R)$ 里那个未知的 $Q$，靠对数平均与琴生不等式、靠条件均值 $m_+(d)\ge d\ge m_-(d)$ 被逼成零（05-charges-cones.tex:1041-1178）；$Q=0$ 之后，真空对真实锥代数循环且分离、模化生成元恰为 $\pm D$（05-charges-cones.tex:1235），再由半单模包含与三子群积分判据把线菱形模化群拼成时间默比乌斯表示（05-charges-cones.tex:1300-1360，那里引的积分判据出处写在 05-charges-cones.tex:1341-1345）。荷的识别不是定域性的副产品，它是另一条独立的论证。

第四条差额在反例的来源。我期待反例来自某个具体理论（比如极限环或非平凡不动点），实测的反例来自同一理论内场代数成员规定的改变：无质量标量取全部维克单项式时 $L=-Q/2$ 在场代数内，限制到移位不变维克多项式时维里场变成 $V_\mu=-:\!\phi\partial_\mu\phi\!:$，可用的维数 $3$ 线性场 $\partial_\mu\partial_\nu\phi$ 中不含洛伦兹矢量（01-introduction.tex:115-121）。作者还补了一句要紧的话：从原始名单里删掉一个名字并不排除在同一网中可重建的场（01-introduction.tex:124-125）。这解释了为何成员判据被写成 02-foundations.tex:100-116 那种长格式。

第五条差额在障碍的具体程度。我以为"标度反常残留"是一类模糊的可能性，实测它是一个数：汉克尔泄漏系数 $d_l$，形状被齐次性钉成 $\lambda^{-2}d_l$，关系是 $d_{j_z}=-d_l$ 与 $d_{s_z}=-d_l/3$（04-dispersion.tex:503-506），消除它靠平台测试 $g_L(z')=\lvert z'\rvert^2\eta_L(\log\lvert z'\rvert)$ 与显式常数 $c_*=6\int_0^\infty t^3K_0(t)\,\mathrm{d}t=24$（04-dispersion.tex:556-560、04-dispersion.tex:600-602）。一个模糊的障碍与一个带系数的障碍，前者无法被消灭。

第六条差额在正性的用法。我原本以为正性只用来排除鬼态，实测它出现在三处彼此独立的位置：类时谱密度形状里逼最高次 $k<2$（06-extraction.tex:393）、交叉密度用自密度的几何平均界、以及回归定理把残差认成非负径向范数 $\lVert\lvert\ell\rangle\rVert^2$（07-short-products.tex:1206-1210）。

## 16 遗留问题与我不替作者补的空

我把不敢加强作者结论的地方列成清单，每条注明素材依据或取证缺口。

局部到全局的问题被作者自己两次写在显眼位置：摘要有"整体有界网上的全局共形作用仍是一个单独问题"（main.tex:66-67），引言又重复一次（01-introduction.tex:80-81）。我在 §14 读到的全部构造都是通量级与域级的，$\delta_X$ 甚至被刻意定义成插入运算，避免宣称每个态上有无界荷（08-reconstruction.tex:1299-1301）。要积分成整体作用，需要域不变性与荷的自伴性同时到位，我没有在实测窗口里找到这两件事被建立。

$\mu$ 是否谱值、$\kappa$ 是否等于 $h$，两处都被论文明确否认或悬置（03-null-current.tex:798-799）。这不是保守，是必要：03-null-current.tex:802-834 的构造只用正性与收缩性，黎斯表示给出的博尔值只在乘重空间内交换。若把 $\mu$ 强行谱值化，就会得到一个与 $h$ 交换的投影值分解，那已经接近把结论当作假设。

真空唯一性没被假设（02-foundations.tex:31-32）。我猜这意味着整套论证对每个标度不变真空分别成立，不同真空给出各自的 $L$ 与 $t_{\mu\nu}$；素材里我没读到关于超选择或真空结构的讨论，此条标 [推测]，缺口在 02 章前半我没读的行区间。

幺正界与谱条件在本框架下没被假设，$\Sigma$ 只要求离散、下有界、局部有限且每档有限维。我原先期待这个定理的假设会包含维数下界（比如标量档 $\Delta\ge1$），实测假设清单里没有它，由此我怀疑分数维数谱与含边界的场论是否被这套方法覆盖，答案不在我读到的区间里，标 [推测]。

规范描述只在选定的规范不变定域代数内进行（01-introduction.tex:86-87），我与作者一样不把它读成对规范理论的完整处理。

取证缺口我照实登记：02-foundations.tex:358 起的权重选择子节、03-null-current.tex:280 起的三个截断估计、05-charges-cones.tex 的前一千行、07-short-products.tex 的前一千行、08-reconstruction.tex:295-1210 整段，都不在我的实测窗口里。因此 §3 的假设清单可能不完整，$\ell_\infty$ 这一残差边界形式的定义位置我只能猜在 07-short-products.tex:487 起的欧氏延拓子节（[推测]），单合并面定量边界估计的具体形式（08-reconstruction.tex:412-470）我也只能按标题推它是傅里叶积分算子型判据的量化版（[推测]）。这些缺口不影响我写下的主链，但影响任何"我把全文假设都抄全了"的说法。

我留给自己的两个追问：一，$\Pi$ 上的辅助共形作用与真实时间默比乌斯作用在 05-charges-cones.tex:868 的定理之外是否有更强的等价关系；二，04-dispersion.tex:495 的精确尾若换成更高阶贝塞尔指标，泄漏是否仍受单一天然泛函控制。两条我在实测材料里都没找到答案。

## 17 自检与越界申报

取证调用 15 次，明细在 §1；首次落盘在第 16 次调用。首块（§0 到 §6）实测 24055 字节，低于规格的目标带下沿，高于硬下限，我按规则不回头重写，只在此处如实登记为永久缺口。此后各笔追加的字节增量依次为：§7 到 §10 一笔 15404 字节，§11 到 §14 一笔 16200 字节，均在单笔上限之内；本节与台账各一笔，也均在上限之内。全文小节编号自 $0$ 起连续，物理排布与编号同序。

违禁串申报按类别计数，不做就地替换。连接词反转族命中 2 处：一处落在 §6 末段的否定呼应句，一处落在 §14 第四段"定义成通量"与"荷"之间的转折短语，两处均为已落盘内容，我只在此登记，不动本体。长停顿号族命中 0 处。装饰横线命中 0 处。连续两个逗号命中 0 处。纯英文术语残留命中 6 处，分布是 §3 一个表示重数的名词、§4 一个表示架桥义的动词、§5 一个德文人名形容词（修饰常数）、§6 一个表示快度的物理参量名、§13 两个（一个附加义动词、一个指示形容词）。上述六处同样只登记不动本体。

自定义宏的处理口径：素材前言里那批单字母与缩写式记号我在本稿一律写成展开形式，正文与本申报都不出现其宏名；被删改的旧记法残留一处非法宏名（§6，形似上钩箭头的旧限制记法），另有一处同类写法在 §14 使用了标准写法，未受影响。数学定界符配对缺陷申报 2 处，集中在 §9 同一句里，绝对值开符误配了范数闭符；这两处不是孤立定界符的奇偶问题，我没有做任何补偿性添加。交叉引用错位申报 1 处：§12 末尾声明要另写的节号写成后一节，实际讨论在 §13。行号范围偏移申报 1 处：§0 首段引摘要局域性断言的区间应向后延伸一行。以上全部只登记，等本体侧机械处理。

数学定界符总数与台账行数在文末实测报告里给出，本段不抄表头字形，也不抄任何禁串原文。全文换行符单一，行尾无回车符；素材只取自指定目录的 build 下 .tex 文件，未打开 PDF，未读 typst 分片作来源，未执行版本控制命令，未修改任何其他笔记文件。探针环节我按规格做了基线复量：首块落盘后先量字节，确认字节增长后才继续追加，未出现探针失败。

## 18 数值台账

本表逐行来自 §1 登记的实测窗口，位置列一律是真实读到的文件与行号；被谁消费列指本笔记的节或素材内的论证，改动后果按证明链顺序写。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\Sigma$ | 离散、下有界、局部有限 | 02-foundations.tex:64-65 | §3 场空间分解 | 跨档求和失效，$Q=0$ 只能逐场成立 |
| $\mathcal{F}_\Delta$ | 每档有限维洛伦兹稳定 | 02-foundations.tex:66-67 | 多重性算法与记号分层 | 两点核无法按档分类 |
| $U_D(s)$ | $U_D(s)P_\mu U_D(-s)=e^sP_\mu$ | 02-foundations.tex:8 | 全部齐次性约定 | 量纲簿记整体错位 |
| $\mathcal{D}_{\mathrm{fact}}$ | 紧致因子检验词的代数张成 | 02-foundations.tex:34-35 | 场标记的等价关系 | 等价定义失去测试域 |
| $\mathcal{D}_{\mathrm{old}}$ | 含全部联合施瓦茨核，无完备化 | 02-foundations.tex:42-48 | 成员判据要求包含的域 | 接纳条件无法表述 |
| $\Psi^{\mathrm{old}}_{\mathbf A}(h)$ | 联合核上的连续延拓 | 02-foundations.tex:38-39 | 旧域命题的构造 | 多项式向量不再稠密 |
| $\eta_{\mu\nu}$ | $\operatorname{diag}(1,-1,-1,-1)$ | 02-foundations.tex:4 | 迹与改进项的符号 | 系数 $\frac13$ 变号 |
| $T_{\mu\nu}$ | 对称、守恒、维数 $4$ | 02-foundations.tex:118-119 | 主定理的改造对象 | 无仿射荷可保持 |
| $V_{\mu}$ | 维数 $3$，$T^\mu{}_\mu=\partial^\mu V_\mu$ | 02-foundations.tex:124 | 待移除的迹 | 标量条件无左端 |
| $D_\mu$ | $D_\mu=x^\nu T_{\mu\nu}-V_\mu$ | 01-introduction.tex:8 | 伸缩流守恒 | 结论失去比较基线 |
| $T^{(4)}$ | 仿射沃德选出的维数 $4$ 分量 | 01-introduction.tex:61-62 | 改进公式的右端 | $T\mapsto T^{(4)}$ 的荷不变性无据 |
| $V^{(3)}$ | 维数 $3$ 厄米分量 | 01-introduction.tex:61 | $\partial^\mu V^{(3)}_\mu=\Box L$ | 无对象可供提取 |
| $L$ | 厄米、维数 $2$ | 01-introduction.tex:63-64 | 改进与初级恒等式 | 整条重建链作废 |
| $c_*$ | $6\int_0^\infty t^3K_0(t)\,\mathrm{d}t=24\neq0$ | 04-dispersion.tex:600-602 | 平台首项与回归通量 | 零阶比较首项可湮灭 |
| $\mathcal{H}_\nu$ | $(\mathcal{H}_\nu F)(M)=\int_0^\infty J_\nu(Mv)F(v)v\,\mathrm{d}v$ | 04-dispersion.tex:483-484 | 精确尾引理 | 外尾不再过单一天然泛函 |
| $\lambda^{-2}d_c$ | 泄漏系数、$c\in\{l,j_z,s_z\}$ | 04-dispersion.tex:499-500 | 两视界比较 | 只剩渐近阶，无法定号 |
| $d_{j_z}$ | $-d_l$ | 04-dispersion.tex:505 | 矢量通道与标量通道相消 | $l$ 通道残尾逃出比较 |
| $d_{s_z}$ | $-d_l/3$ | 04-dispersion.tex:505 | $\Pi$ 的三分量结构 | 通道耦合断裂 |
| $g_L$ | $\lvert z'\rvert^2\eta_L(\log\lvert z'\rvert)$ | 04-dispersion.tex:555-556 | 对数配对 | 首项 $\log L$ 落不进误差分离 |
| $e_L$ | $\lVert\sqrt{h_2}\,e_L\rVert^2=O(1)$ | 04-dispersion.tex:639-641 | 平台尾估计 | 差测试的加权界丢失 |
| $\kappa$ | $\int\lvert z\rvert^2\mu(\mathrm{d}z)\le h$ | 03-null-current.tex:791-793 | 二阶矩到零阶比较 | 谱序链中断 |
| $\mu(\mathbb{R}^2)$ | $\mathbf{1}$，且不断言谱值 | 03-null-current.tex:784-799 | 测度规范化 | 需另建紧性论证 |
| $H_g$ | $b\,h_g$，实线性于 $C_b^\infty(\mathbb{R}^2)$ | 03-null-current.tex:592 | 割面沃德公式 | 交换性无法由序升级 |
| $b^{1/2}$ | $\lvert\langle\xi,H_g\eta\rangle\rvert\le\lVert g\rVert_\infty\lVert b^{1/2}\xi\rVert\lVert b^{1/2}\eta\rVert$ | 03-null-current.tex:581-583 | 延拓到整个形式域 | 线性失去闭性 |
| $E_L$ | $\mathbf{1}_{[0,L]}(\lvert T\rvert)$，尾部 $O(L^{-N})$ | 03-null-current.tex:643-660 | 多项式延拓第一段 | 截断误差不再任意快衰减 |
| $C$ | $\frac12\sup_y\lVert g''(y)\rVert$ | 02-foundations.tex:1144-1146 | 泰勒比较 | 轮廓曲率误差无法折算 |
| $h_\nu$ | $\mathbf{1}_{(\lambda,\infty)}(h)\mathbf{1}_{[0,\lambda]}(h_\nu)=0$ | 02-foundations.tex:1177-1178 | 标量谱比较 | 只剩普通形式序 |
| $s>0$ | $\lVert h^s\psi\rVert\le\lVert h_\nu^s\psi\rVert$ | 02-foundations.tex:1179 | 幂界与域包含 | 域的嵌套关系断 |
| $K_n$ | $b(\lvert Y\rvert^2+\kappa)$ | 03-null-current.tex:794 | 锥比较生成元 | $T_R^\pm$ 写不出 |
| $T_R^\pm$ | $D+Q\mp\frac{K}{2R}$ | 05-charges-cones.tex:1041 | 残差荷证明 | 两锥一阶矩无从相等 |
| $Q$ | 在全部物理多项式向量上为零 | 05-charges-cones.tex:1058-1060 | 锥模化与荷识别 | 模化生成元含未知残项 |
| $e^{-\pi D}\xi$ | $e^{\mathrm{i}\pi\alpha}O(f^-)\Omega$ | 05-charges-cones.tex:1094 | 带形恒等与琴生界 | 两符号的测度不可比 |
| $m_\pm(d)$ | $m_+(d)\ge d\ge m_-(d)$，两均值相等 | 05-charges-cones.tex:1158-1161 | 条件律塌成 $\delta_d$ | 交叉测度不支撑在对角线 |
| $\mathcal{M}(O)$ | 弱闭有界、类空交换、协变 | 02-foundations.tex:85-88 | 附属实现与成员判据 | 重建场无归属代数 |
| $S_e$ | 对一切未来类时 $e$ 相同、维数 $2$ | 06-extraction.tex:339-342 | 提取与 $l=S$ | 标量残留时间方向依赖 |
| $O(\epsilon^{-2})$ | $\lVert e^{-\epsilon P_e}S_e(0)\rVert=O(\epsilon^{-2})$ | 06-extraction.tex:331 | 时空检验界 | 真实权重不超过 $2$ 失据 |
| $k<2$ | 壳多项式最高次约束 | 06-extraction.tex:388-394 | 类时密度为常数 | 允许非常数壳多项式 |
| $\rho$ | $0<a\le\rho\le b<\infty$ 紧致带投影 | 06-extraction.tex:402-405 | 无质量分支排除 | 无质量成分残留 |
| $\lVert\beta\rVert^2$ | 标量无质量交叉密度系数 $c$ | 06-extraction.tex:448-449 | 快度增长矛盾 | 唯一残余无质量支不被排除 |
| $W(\ell_\infty LL)$ | $=0$ | 07-short-products.tex:1124-1127 | 残差自耦合消除 | 回归定理少一条恒等式 |
| $\gamma$ | $A=B=\gamma$、$D=-6\gamma$、通量逼 $\gamma=0$ | 07-short-products.tex:1147-1176 | $Jt$ 张量结构消除 | $\ell_\infty Vt$ 展开留有残项 |
| $\langle n_\alpha n_\mu\rangle$ | $\delta_{\alpha\mu}/4$，球面平均 $-3\delta_{\alpha\mu}/2$ | 07-short-products.tex:1170-1171 | 中心化特殊通量 | 通量不再为零 |
| $2c\,W(\ell_\infty L)$ | 最终通量等式 $0=2c\,W(\ell_\infty L)$ | 07-short-products.tex:1198-1201 | 回归定理 | 残差范数得不到上界 |
| $\lVert\lvert\ell\rangle\rVert^2$ | 非负径向范数，非零波时严格正 | 07-short-products.tex:1206-1210 | $l=S$ | 正性论证整体失效 |
| $\mathfrak{P}_c(O)$ | 紧联合核多项式插入的商 | 08-reconstruction.tex:1246-1254 | 沃德求导的良定义 | 商结构与求导法则不兼容 |
| $t_{\mu\nu}$ | $T_{\mu\nu}+\frac13(\partial_\mu\partial_\nu-\eta_{\mu\nu}\Box)L$，无迹 | 08-reconstruction.tex:1219-1225 | 主定理结论 | 迹无法移除 |
| $\sigma_X$ | $(\partial\cdot X)/4$ | 08-reconstruction.tex:1296-1297 | 初级恒等式的 $2\sigma_X$ 项 | 场的共形维数错乱 |
| $[\delta_X,\delta_Y]$ | $-\delta_{[X,Y]}$ | 08-reconstruction.tex:1399-1401 | 共形李代数实现 | 局域沃德代数不闭合 |
| $\Box^{-1}T^\mu{}_\mu$ | 逆波算子形式解，需交叉对称假设 | 01-introduction.tex:167-170 | §4 第一条错路的史版 | 定域性靠外部假设输入 |
| $\bigoplus_{\Delta\in\Sigma}\mathcal{F}_\Delta$ | 代数直和，每词支撑 $S_A$ 有限 | 01-introduction.tex:22 | 有限标度支撑定义 | 非齐次场无法拆档 |
| $\mathbf{1}_{(\lambda,\infty)}(h_f)\mathbf{1}_{(-\infty,\lambda]}(h_g)$ | $f\le g$ 时的带空隙为零 | 02-foundations.tex:1185-1186 | 轮廓间的谱序 | 交换性升级失去依据 |
| $W(\lambda\xi)$ | $\lambda^{-\sum_i\Delta_i}W(\xi)$，$\lambda>0$ | 02-foundations.tex:170 | 旧真空分布的 temper 性 | 联合核延拓无界 |
| $\mathbf{1}_{(-\infty,r]}(A)(A+B/s)\mathbf{1}_{[t,\infty)}(A)$ | $2\varepsilon<t-r$ 时为零 | 03-null-current.tex:767-769 | 全部 $h_g$ 两两交换 | 测度值不再交换 |
| $J_WX(W_{-g})$ | 含于 $X(W_g)'$，且 $H_g\ge-H_{-g}$ | 02-foundations.tex:1133-1134 | 反射序与泰勒比较 | 下端不等式无反手 |
| $S,\delta,R$ | 极限次序 $S\to\infty$，$\delta\downarrow0$，$R\to\infty$ | 03-null-current.tex:568-572 | 割面通量的三项消失 | 次序调换则帽形项不消 |
| $(\mathcal{H}_2\mathcal{H}_0F)(v)$ | $\frac{2}{v^2}\int_0^v rF(r)\,\mathrm{d}v-F(v)$ | 04-dispersion.tex:513-515 | 零矩测试压回支撑 | 外尾因子化论证断裂 |
| $A_L(\lambda)$ | $\lambda^{-2}\mu(g_L)$，$0\le A_L\le\mathbf{1}$ | 04-dispersion.tex:676-681 | 体元极限 $\to\mathbf{1}$ | 零阶比较缺主项 |
| $B_{i,L}(\lambda)$ | $\lambda^{-1}\mu(\partial_i g_L)$，范数 $\le C$ | 04-dispersion.tex:677-682 | 一阶矩湮灭给 $B\to0$ | 角谐波误差失控 |
| $\mathbf{1}_{(s,\infty)}(\kappa)$ | 与 $\mathbf{1}_{[0,s]}(h_0)$ 在 $l$ 上互抑 | 04-dispersion.tex:667-670 | 临界尾消除 | 标量比较停在二阶 |
| $\operatorname{diag}(1,-1,-1,-1)$ | 度规与 $P\cdot x$ 约定 | 02-foundations.tex:4-5 | 全文符号一致性 | 迹与散度符号全反 |
| $\lVert h_g-g(Y)\psi\rVert$ | $\le C\lVert h\psi\rVert$，$\psi\in\operatorname{Dom}h$ | 02-foundations.tex:1148 | 抛物割面逼近 | 轮廓替换在域上不收敛 |
| $\theta(p^0)\delta(p^2)$ | 无质量不变测度 | 06-extraction.tex:467-468 | 能量片显式配对 | 无质量支的界无法算 |
| $u_l$ | 真实权重 $2,3,\ldots$ | 06-extraction.tex:459-460 | 投影配对的条件 | 维数 $2$ 波的权重界失去对照 |
| $A=(z-a)\partial_z$ | 三字段 $A,B_t,C$ 的仿射关系 | 05-charges-cones.tex:1323-1327 | 时间默比乌斯积分 | 三子群判据的前提不成立 |
| $\operatorname{span}\{A_L,A_L^*\}$ | $\lVert A_L\rVert\le L$，$A_L\psi-A\psi=O(L^{-N})$ | 03-null-current.tex:644-661 | 极化截断段 | 有界逼近不能替换无界词 |
| $R^{-5}$ | $\ell_\infty Jt$ 三点函数的齐次阶 | 07-short-products.tex:1141 | 通量的 $R^2\cdot R^3$ 相消 | 球面积分不归零 |
| $\delta_\alpha{}^\sigma$ 项 | $X_\alpha^\sigma=2(z-y)_\alpha(z-y)^\sigma-R^2\delta_\alpha{}^\sigma$ | 07-short-products.tex:1160 | 中心化特殊通量 | 角向收缩式不成立 |
| $\partial^\mu j_{X,\mu}$ | 守恒由无迹与基灵方程得 | 08-reconstruction.tex:1296-1297 | 沃德导子的存在 | 导子不保交换子结构 |
| $\sigma_X L$ | 系数 $2\sigma_X$ 的初级标量律 | 08-reconstruction.tex:1354 | 李括号闭合与 $c\neq0$ 通量 | 回归定理的通量常数错 |

补记一条申报，写在表后不动表体：本表 $R^{-5}$ 那一行的位置列写成 07-short-products.tex:1141，齐次阶实际出现在 1142 行，属行号引用偏移，与 §17 已登记的那一处合起来共两处，请本体侧按类别处理。此外本表只收录我实测窗口内的行号，[推测] 级判断一律没有进表，表里没有占位空格，也没有任何限制算符用竖线字形书写。全文实测字节、数学定界符总数、本表数据行数与小节数在交付报告里逐项给出，本节不复述任何禁串字形与表头字形。
