# D567 稳定Morse数之下循环整系数Floer界的尖锐性

## §0 任务设定与登记

这一单对应派单 D567。三个参数照抄 .tools/wave.txt 里以 D567 起头的那一行：row 字段为 $390$，bytes 字段为 $47937$，thin 字段为 no，dir 字段见本节末两行的逐字登记。我实测该目录 build 之下有六个 .tex 文件（main.tex 加 sections 里的五个分节），合计字节与派单给的 $47937$ 完全一致。wave 标 thin=no，说的是它在派单侧不算薄素材；不过文件数 $6$ 与总字节 $47937$ 同时落进规格里薄素材例外条款的结构判据（文件数不超过 $8$ 或总字节不超过 $60000$），首次落盘窗口因此本可放宽到第 $12$ 次调用起。我仍把首块安排在第 $16$ 次调用，按常规窗口 $16$ 到 $30$ 执行，两头都合规。

写法立场：我扮演正在做这项研究的人，从论文的定理陈述与证明分工反推动笔之前的思维链，用第一人称研究笔记的口吻写。四项内容必须都在：初始动机与猜想、尝试过的错误路线及各自失败原因、关键转折点、最终思路与最初设想的差异。论文没写而我私下的判断，一律标 [推测] 并交代证据缺口在哪，不硬编成论文有的东西。取材硬约束：正文素材只允许来自该目录 build 下的 .tex；README.md 只当目录索引；PDF 一个字都不碰，pdftotext 不执行；git 命令全程不跑；typst 分片不算来源。

落盘协议：Write 全程只用这一次，首块把 §0 到 §6 七节一次排齐；此后一律 Edit 追加，锚点逐字取当时文件最末一段的完整文本；已落盘内容不删不改不重排，写错了只在文末勘误节按类别申报；单笔追加不超过 $25000$ 字节；全文不低于 $71500$ 字节；数学定界符总数不低于 $1000$ 且逐行成对；全文只用单一换行符 LF，行尾不带回车；台账独立成文末一节 §15，表头全文只出现一次，数据行不少于 $30$，每行恰好 $6$ 枚竖线，格内不带裸竖线也不留空格子。取证调用共 $15$ 次，读规格与本稿不计，本次 Write 是第 $16$ 次调用。

preprints/Sharpness-of-the-Cyclic-Integral-Floer-Bound-Below-the-Stable-Morse-Number-October-5-2026
其他队列第 390 行号

## §1 素材与取证口径

取证过程按顺序复盘。第一次调用用 ls -R 量出 build 布局：根下只有 main.tex 与 references.bib，五个分节全部住在 sections 子目录；build/source 那种版式在此目录不存在，两种版式我都实测过才落笔。第二次调用 wc -c 分件量尺寸：main.tex $2175$、construction.tex $9472$、geometry.tex $10136$、introduction.tex $6852$、involution.tex $10698$、morse.tex $8604$。随后 main.tex 与五个分节逐件精读，README.md 与 references.bib 各通读一次（后者只用于核对引用骨架，不作正文素材），再跑三轮 grep 把关键数字的行号钉死，最后一轮补行数统计与两处补充定位。合计 $15$ 次，没有越界。

主干行号锚点逐字钉住如下，后文引用位置一律按这个表。build/sections/introduction.tex 第 $12$ 到 $15$ 行定义 $b(W)=\sum_i \operatorname{rank} H_i(W;\mathbb{Z})$；第 $19$ 到 $21$ 行定义逐度计数 $\lambda(W)=b(W)+2\sum_i d(\operatorname{Tor} H_i(W;\mathbb{Z}))$；第 $21$ 到 $26$ 行按奇偶合并同调 $\overline{H}_{\bar{i}}(W;\mathbb{Z})=\bigoplus_{k\equiv i\ (\mathrm{mod}\ 2)}H_k(W;\mathbb{Z})$ 并定义循环计数 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(W)=b(W)+2\sum_{\bar{i}\in\mathbb{Z}/2}d(\operatorname{Tor}\overline{H}_{\bar{i}}(W;\mathbb{Z}))$；第 $30$ 到 $32$ 行给出例子 $d(\mathbb{Z}/2\oplus\mathbb{Z}/3)=1$ 对照两度分置时的贡献 $2$；第 $33$ 行落定不等式 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(W)\leq\lambda(W)$；第 $36$ 到 $42$ 行给出几何约定下的稳定 Morse 数 $\operatorname{SM}(W)$ 与普通极小值 $\operatorname{Morse}(W)$；第 $44$ 到 $50$ 行固定辛符号约定 $\omega(X_{H_t},\cdot)=dH_t$ 与可缩不动点记号 $\operatorname{Fix}_0$；第 $52$ 到 $67$ 行是主定理陈述。

build/main.tex 第 $42$ 到 $50$ 行是摘要：实维数 $3332$、最小陈数 $1$、不动点恰 $1872232$ 个且全部非退化、稳定 Morse 数 $1872264$、强界恰差 $32$。build/sections/morse.tex 第 $16$ 到 $28$ 行是自由链复形的秩引理，第 $64$ 到 $70$ 行是 $\operatorname{SM}(W)\geq\lambda(W)$ 命题，第 $174$ 到 $186$ 行是 Smale 实现定理。build/sections/involution.tex 第 $14$ 到 $49$ 行是短周期引理，第 $55$ 到 $156$ 行是扰动命题，第 $162$ 到 $236$ 行是曲面 $Y$ 的构造，第 $238$ 到 $264$ 行是实现推论。build/sections/geometry.tex 第 $35$ 到 $140$ 行是双曲型商曲面 $S_p$ 的嵌入与整系数同调，第 $148$ 到 $254$ 行是整系数吹起公式。build/sections/construction.tex 第 $12$ 行定 $N=1664$、$L=1661$，第 $25$ 到 $34$ 行列七个吹起中心，第 $57$ 到 $62$ 行算出 $b(X)=174281$，第 $86$ 到 $99$ 行是挠量型表，第 $129$ 到 $132$ 行给出两个卷积核，第 $246$ 到 $252$ 行收束全部数值。引用素材位置只用文件加行号；素材里的自定义宏我全部展开成标准写法，宏名连分类描述都不写；素材内部的交叉引用字形一律不带进本稿。

## §2 初始动机与猜想

上一篇把哈密顿不动点压到稳定 Morse 数之下的工作收尾之后，留在心里的下一个问题是：那个不动点计数在同调意义下到底踩得有多实？Arnold 不动点问题把辛动力学与 Morse 拓扑对照，Conley--Zehnder 用变分方法解决环面情形，Floer 再用同调把周期轨道数与底流形拓扑拴在一起；整系数精化把挠率也纳进来，Bai--Xu 在一般位置把次数约化到最小陈数的两倍模，我在最小陈数为 $1$ 的场景里读到的界恰好就是 §1 里抄下的 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}$。逐度计数 $\lambda(W)$ 与逐奇偶计数 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(W)$ 的差别只在挠率：自由部分两者一样，混合素数（这里指 $2$ 与 $3$ 两个素数）的循环因子在按奇偶合并后会共享生成元名额，于是 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}\leq\lambda$ 且可以严格。我想追问的是这条严格链上两端各自被谁钉住：右边 $\lambda(M)=\operatorname{SM}(M)$ 由几何侧的 Smale 定理给定，左边则是一个纯粹关于链复形的代数极小值。

最初动机因此可以写成一句话：造一个凯勒流形，让动力学计数正好等于循环整系数界，同时让稳定 Morse 界严格更高，把两界之差以完全可算的形式落出来。猜想层面我一开始押的直觉并不站在反例这边。Golovko 把稳定 Morse 数当作 Arnold 问题的更强基准提出来；Dimitroglou Rizell 与 Golovko 在辛面积类与一陈类都消失于 $\pi_2$ 的流形上证明了稳定 Morse 下界成立。凯勒类比仿射类刚性更强，我起初猜这个方向的界大概成立，反例若存在必须从陈数非零的球面里找出口。这个直觉后来决定了几何选型：整条动力学管线里必须养一条陈数等于一的例外球，$\langle c_1(TM),[E_j]\rangle=1$ 的评估是逃逸口，也是把 DRG 假设条件正面击穿的机关。设计约束我列了三条：流形单连通闭凯勒、最小陈数恰为 $1$、不动点全非退化且轨道回环全可缩。[推测] 这三条约束以这种方式排列是我从前一篇工作直接继承的，论文只交代了改动中心这一个动作，动机的时间线只能算我补的。

还有一个更朴素的动机促使我把目标定在恰好等于：若不动点计数只是低于稳定 Morse 数而高于循环界，别人完全可以辩解说是构造没做到锐、界还留着余量。计数正好踩上循环界，反驳的空间就压缩到"两界之差本身"这一件事上，反例的分量完全不同。这是我把"sharpness"（尖锐性）放进题名的原因。

## §3 精确陈述

先把记号一次配齐，后文所有核算都在这套记号里说话。闭光滑流形 $W$ 上 $b(W)=\sum_i \operatorname{rank} H_i(W;\mathbb{Z})$；有限生成阿贝尔群 $G$ 的最小生成元数记 $d(G)$，约定 $d(0)=0$。逐度计数 $\lambda(W)=b(W)+2\sum_i d(\operatorname{Tor} H_i(W;\mathbb{Z}))$，其中每个度数单独取生成元数再全求和。循环计数 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(W)$ 把同奇偶的所有度数先直和成一个 $\mathbb{Z}/2$ 分次群再取生成元数。差别在合并前后：$d$ 对互素分支是取 $\max$ ，并非取和，$\mathbb{Z}/2\oplus\mathbb{Z}/3$ 合并后 $d=1$，分置两度时按度求和是 $2$，故 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(W)\leq\lambda(W)$，且严格化可以发生。几何约定的稳定 Morse 数 $\operatorname{SM}(W)$ 定义为：所有使得 $F\colon W\times\mathbb{R}^k\to\mathbb{R}$ 在某紧集外恰等于一个非退化二次型（差项精确截断、按范数渐近的控制取最强口径）的 $k\geq 0$ 与 $F$ 的临界点数的最小值；$\operatorname{Morse}(W)$ 是 $k=0$ 时普通 Morse 函数的对应最小值。辛侧：闭辛流形 $(M,\omega)$ 上光滑 $1$ 周期哈密顿量 $H\colon(\mathbb{R}/\mathbb{Z})\times M\to\mathbb{R}$，符号约定 $\omega(X_{H_t},\cdot)=dH_t$，$\phi_H^t$ 是从恒等出发的流；$x$ 为 $\phi_H^1$ 的非退化不动点指 $D\phi_H^1(x)$ 不含特征值 $1$；$\operatorname{Fix}_0(\phi_H^1;H)$ 是轨道回环 $t\mapsto\phi_H^t(x)$ 在 $M$ 内可缩的那部分不动点。

主定理（build/sections/introduction.tex 第 $52$ 到 $67$ 行，数值见 build/main.tex 第 $42$ 到 $50$ 行）：存在实维数 $3332$（复维数 $1666$）、单连通闭凯勒、最小陈数为 $1$ 即 $c_1(TM)(\pi_2(M))=\mathbb{Z}$ 的流形 $(M,\omega)$ 与光滑 $1$ 周期 $H$，使 $\phi_H^1$ 的每个不动点非退化，且三个数串成链条：$\#\operatorname{Fix}(\phi_H^1)=\#\operatorname{Fix}_0(\phi_H^1;H)=\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)=1872232$ 与 $\operatorname{SM}(M)=\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)+32=1872264$。结论逐字读：稳定 Morse 型下界对闭辛流形上全体非退化哈密顿微分同胚不可能成立，哪怕把战场缩到单连通凯勒类、再把界缩到它已经踩尖的那个循环整系数界。链条里三个环节各自的角色要分清：$\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)\leq\lambda(M)$ 是纯代数的，$\lambda(M)=\operatorname{SM}(M)$ 是几何的（见 §7），$\#\operatorname{Fix}=4\lambda(C)$ 与 $C$ 上 $\lambda(C)$ 的实现是动力学的（见 §6 与 §8），$4\lambda(C)=\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)$ 则是一个关于有限整数序列的卷积恒等式（见 §10）。定理的全部难度都藏在这四个环节各自的钉法里。

## §4 尝试过的错误路线

第一条走不通的路是原样继承前作的吹起中心。前作已经在混合素数挠率与对合扰动的框架里造出不动点计数低于稳定 Morse 数的例子，我起初的自然念头是：既然框架都对，直接把它的中心清单抄来，把数值代进新公式核对一遍就完事。核对在 $C$ 侧立刻卡住。逐度计数 $\lambda(C)$ 里每个度的生成元数按 $\max((1,1)*a)_j,((1,1)*q)_j$ 取值，前作的中心配置让逐度 $\max$ 在若干度被 $2$ 主部拿下；这些度一旦翻到 $2$ 主侧，$\lambda(C)$ 里就多出一块在奇偶合并后被 $\max$ 吸收掉的多余生成元，于是 $4\lambda(C)$ 严格大于 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)$，尖锐性丢失。失败原因总结成一句：前作只需要严格不等式，界差落在哪里无所谓；这一单要求等式，$C$ 侧每一度的 $\max$ 归属都被等式绑架。论文的对应交代在 introduction.tex 第 $106$ 到 $109$ 行，改动吹起中心正是这一失败的直接后果。

第二条路想在素数结构上偷懒：只用单一素数的挠率。这条被 $d$ 函数的代数性质一刀切断。同一素数的循环因子直和时生成元数可加，$d\bigl((\mathbb{Z}/p)^{v}\oplus(\mathbb{Z}/p)^{w}\bigr)=v+w$；跨度合并因此不损失任何信息，$\beta_{\mathbb{Z}}^{\mathrm{cyc}}(W)=\lambda(W)$ 对单素数挠率恒成立。两界在高维单连通情形又都等于同一个 $\lambda$，反例结构整体塌掉。混合素数的 $\max$ 行为才是两界之差唯一可能的来源，$2$ 与 $3$ 两个素数一个都不能省。这个观察在论文里就是第 $30$ 到 $32$ 行那个三行的例子，我起初嫌它朴素，后来才明白整个反例的生死都在这个 $\max$ 上。

第三条路是绕开对合、直接在 $M$ 上造哈密顿。我最初设想的版本是把 $M$ 上的普通 Morse 函数经切触型提升变成生成函数，指望变分法自动给出恰好 $\lambda(M)$ 个不动点，再靠代数几何把 $\lambda(M)$ 压到循环界。两头都站不住：其一，$\operatorname{SM}(M)=\lambda(M)$ 只保证存在达到 $\lambda$ 的稳定化函数，动力学侧对"恰好"没有任何抓手，多余鞍点无法用全局论证排除；其二，即使做到 $\#\operatorname{Fix}=\lambda(M)$，我需要的方向是严格小于，逐度计数从下面钉不住自己。[推测] 这条路线在论文里没有直接痕迹，是我补的思维链；依据是论文第 $103$ 到 $104$ 行特意声明构造与计数都是有限维的、不碰 Floer 理论，这种声明通常是对照着"有人试过无穷维机器"的语境写的。

第四条弯路是往自由秩里找差额。既然 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)=8b(X)+32Q$ 与 $\lambda(M)=8b(X)+32Q+32$ 的自由部分完全同型，我一度想让吹起中心的自由贝蒂数结构制造差 $32$。这被 §7 的秩不等式堵死：每个度上的自由秩对两个计数贡献相同，差只能来自 $\max$ 的归属分歧，即两条卷积曲线逐点的正部之和。方向因此被代数预先指定，几何只剩"实现序列"一种活可干。

## §5 关键转折

转折点是认出两个计数共用同一条设计管线、但用两种不同的敏感度看它。写清楚：设 $a_j$ 与 $q_j$ 是 $X$ 的两条奇偶度列上 $2$ 主与 $3$ 主挠率的重复度，$\delta_j=a_j-q_j$。乘上 $\mathbb{C}\mathrm{P}^1$ 给 $C$ 时挠率轮廓与核 $(1,1)$ 卷积，乘上 $Y$ 给 $M$ 时与核 $(1,6,1)$ 卷积（两核见 construction.tex 第 $129$ 到 $132$ 行）。$C$ 侧我要每个度都是 $3$ 主拿下 $\max$，即 $(1,1)*\delta$ 处处非正；$M$ 侧我又要有度让 $2$ 主拿下 $\max$，且逐度正超出量总和恰为每奇偶列 $8$，$\lambda$ 的两奇偶列与前置因子 $2$ 联手把 $8+8$ 放大成差 $32$。同一序列让一核压平、另一核放大，唯一的路是让 $\delta$ 的支撑形如：在 $1$ 到 $L$ 上处处取 $-1$，只在 $2$ 与 $L-1$ 处翻正取 $+1$。端点检查：$(1,1)*\delta$ 在正峰处是 $-1+1=0$、在邻位是 $1-1=0$、其余 $-2$，从不严格为正；$(1,6,1)*\delta$ 在 $j=3$ 处是 $-1+6-1=4$，中间权 $6$ 把两侧负谷垫成高台。两核在同一序列上的相反行为是整个反例的发动机。

第二个转折发生在把这件事和几何解耦的时刻。introduction.tex 第 $134$ 到 $136$ 行的原话立场：这套论证完全生活在有限序列里，可以与几何实现分离。我的操作是把设计流程反过来走：先在纸面上解出满足上段轮廓的 $(a_j,q_j)$，再问哪组吹起中心能把它们实现。$f_r(j)$ 计数函数（construction.tex 第 $69$ 到 $73$ 行）给出 $a_j=4f_1(j)$、$q_j=3f_0(j)+2f_2(j)$，对照型表（第 $86$ 到 $99$ 行）读回 $f_0$ 常值 $1$、$f_1$ 从 $\{1,2,2,2,1\}$、$f_2$ 从 $\{1,2,3,2,1\}$。这两条轮廓分别锁定"$2$ 个 $S_2\times\mathbb{C}\mathrm{P}^1$ 中心"与"$2$ 个 $S_3\times\mathbb{C}\mathrm{P}^2$ 中心"再加"3 个 $S_3$ 中心"的清单，中心数、维数和余维数都是被轮廓逼出来的，选完再验证七者能塞进 $\mathbb{C}\mathrm{P}^{1664}$ 的互不相交线性子空间：$2\cdot 90+3\cdot 165+2\cdot 495=1665$ 恰为 $N+1$（第 $40$ 行）。

还有一个小转折值得记：系数巧合。$4\lambda(C)=4(2b(X)+8Q)=8b(X)+32Q=\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)$ 是关于自由秩恒成立的等式，与 $\delta$ 轮廓无关；因子 $4$（固定分量个数）、$2$（$C$ 的自由秩倍率）与 $8$（核 $(1,6,1)$ 权重和 $=b(Y)$ 的秩和）自动配对。于是等式这一半根本不用设计，要设计的只有正部超额，把问题从"凑三个数"降格成"摆一条序列"。认出这一点之前我在三个自由度上同时乱碰，效率极低。

## §6 第一条被证成的路线

先把动力学一侧完全打通，因为它是全篇唯一不动点个数可以被逐点枚举的构造。原料是曲面 $Y$：把 $\mathbb{C}\mathrm{P}^1\times\mathbb{C}\mathrm{P}^1$ 在四个点 $\{0,\infty\}\times\{0,\infty\}$ 吹起，对角圆作用 $\lambda\cdot(z,w)=(e^{2\pi i\lambda}z,e^{2\pi i\lambda}w)$ 提升其上，把凯勒形沿作用平均后由 Cartan 公式与 $H^1(Y;\mathbb{R})=0$ 得矩映射，作用是哈密顿的；半转 $g_Y$ 的不动集恰为四条例外曲线 $E_1$ 到 $E_4$，沿每条曲线切向为恒等、辛法向为负恒等；$Y$ 单连通，$H_2(Y;\mathbb{Z})\cong\mathbb{Z}^6$，其余同调为 $i=0,4$ 处的 $\mathbb{Z}$，且 $\langle c_1(TY),[E_j]\rangle=2-1=1$（见 build/sections/involution.tex 第 $162$ 到 $236$ 行）。任取单连通闭凯勒 $X$，积 $M=X\times Y$ 配积凯勒形，$g=\operatorname{id}_X\times g_Y$ 仍是哈密顿对合，恰有四个闭辛固定分量 $C_\mu=X\times E_\mu$，每个都微分同胚于 $C=X\times\mathbb{C}\mathrm{P}^1$。

扰动原理（involution.tex 第 $55$ 到 $156$ 行）说：对每个固定分量预赋光滑 Morse 函数 $h_\mu$，可把 $h_\mu$ 用不相交管状邻域与截断函数同时延拓、再对 $g$ 平均，得 $g$ 不变的光滑函数 $f$，其限制恰为各 $h_\mu$。$f$ 的哈密顿流 $\psi^s$ 与 $g$ 交换，$\Phi_\epsilon=\psi^\epsilon\circ g$ 满足 $\Phi_\epsilon^2=\psi^{2\epsilon}$。短周期引理（第 $14$ 到 $49$ 行）给 $\tau>0$ 使 $\psi^T(x)=x$、$0<T<\tau$ 推出 $X_f(x)=0$，这是紧流形上 Yorke  Lipschitz 周期界的坐标卡版本：取 $T<\min\{\delta,L^{-1}\}$，由 $\int_0^T v(y(t))\,dt=0$ 与最大模点 $t_0$ 得 $m\leq LTm$，逼 $m=0$。于是 $\epsilon<\tau/2$ 时 $\Phi_\epsilon$ 的不动点集精确等于 $\bigsqcup_\mu \operatorname{Crit}(h_\mu)$，一个不多。非退化性在 $T_xF_j$ 上用 $\omega_x(A_x^+u,v)=\operatorname{Hess}_x(h_j)(u,v)$ 得 $A_x^+$ 可逆，在法向用 $-\exp(\epsilon A_x^-)-I\to -2I$ 得第二个块可逆；临界点有限，单一 $\epsilon$ 全局可用。最后把 $g$ 的哈密顿道路与 $\epsilon f$ 的时间重参数拼接成一个在 $t=0,1$ 附近消失的 $1$ 周期光滑 $H_\epsilon$，$\phi_H^1=\psi^\epsilon\circ g$；$M$ 单连通保证一切不动点回环可缩。

计数落锤：$h$ 取 $C$ 上的普通 Morse 函数，由 Smale 定理（见 §7）可要求其临界点数恰为 $\lambda(C)$，扰动原理给 $\#\operatorname{Fix}(\phi_H^1)=\#\operatorname{Fix}_0(\phi_H^1;H)=4\lambda(C)$。$X$ 单连通闭凯勒由吹起公式与余维条件保证（见 §9），最小陈数恰 $1$ 由例外球 $\{x\}\times E_j$ 保证。这条路线不需要任何 Floer 机器，把"存在一个恰有指定数量非退化不动点的哈密顿"完全归约成序列设计与代数几何实现两件事，剩下的任务清单因此明确：§7 钉 $\lambda(M)=\operatorname{SM}(M)$，§9 供 $S_p$ 曲面与整系数吹起公式，§10 摆 $\delta$ 轮廓并逐格算出 $1872232$、$1872264$、$32$ 三个数。

## §7 几何侧：稳定下界与 Smale 实现的证明链

秩引理（build/sections/morse.tex 第 $16$ 到 $28$ 行）先记下：有限生成自由阿贝尔链复形 $C_*$，写 $Z_i=\ker\partial_i$、$B_i=\operatorname{im}\partial_{i+1}$，两串短正合列给 $\operatorname{rank} C_i=b_i+\operatorname{rank} B_i+\operatorname{rank} B_{i-1}$；$B_i\subset Z_i$ 的史密斯标准形说明 $\operatorname{Tor}(Z_i/B_i)$ 的非平凡循环因子数不超过 $\operatorname{rank} B_i$，故 $t_i\leq\operatorname{rank} B_i$，求和得总秩下界 $\sum_i\operatorname{rank} C_i\geq\sum_i b_i+2\sum_i t_i$。取等一侧：自由生成元配孤立的 $\mathbb{Z}$ 副本，循环因子 $\mathbb{Z}/n$ 配两期复形 $\mathbb{Z}\xrightarrow{\ n\ }\mathbb{Z}$、成本恰两枚自由生成元，于是任何 prescribed 有限群集合都能被某个自由复形达到下界，$\mathbb{Z}/2$ 分次下同样成立。由此 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(W)$ 被认成实现逐奇偶合并同调的自由分次复形的最小总秩（第 $56$ 到 $59$ 行）；第 $58$ 到 $62$ 行特意提醒：这是代数复形的极小值，没有任何几何实现的断言混在里面，它与 $\lambda(W)$ 的差恰好等于"同奇偶不同度数的循环因子能否共享名额"这一件事。

命题 $\operatorname{SM}(W)\geq\lambda(W)$（第 $64$ 到 $154$ 行）是全篇最费力的一段。设 $F\colon W\times\mathbb{R}^k\to\mathbb{R}$ 在某紧集外等于 $Q(u,v)=-|u|^2+|v|^2$，参数量级取三层：$R_0$ 让一切临界点落进 $W\times\overline{B}_{R_0}$，$A$ 压过该柱体上 $|F|$ 与 $|Q|$ 的最大值，$T>R_0$ 且 $T^2>A$（第 $86$ 到 $92$ 行）。截断不带胞的关键观察：$F$ 在侧壁 $W\times\partial B_T$ 上就是 $Q$，其限制临界值只能是 $\pm T^2$，全在带 $[-A,A]$ 外，所以梯度状场可在侧壁取切向、经项圈扩张后用单位分解与内部场拼接；端点水平集因此满足 $K_\pm=K\cap\{Q\leq\pm A\}$（第 $100$ 到 $102$ 行）。Milnor 附着定理在带边界流形上给出有限相对胞复形，总秩等于 $\#\operatorname{Crit}(F)$、同调等于 $H_i(K_+,K_-;\mathbb{Z})$（第 $115$ 到 $129$ 行）；临界值先靠临界点附近的小扰动分开，端点对与计数都不动（第 $130$ 到 $132$ 行）。把 $v$ 缩到 $0$ 是保持端点对的形变收缩（同时降 $Q$ 与欧氏范数），盘对环面 $(D_T^{\nu},\{u\in D_T^{\nu}:|u|\geq\sqrt{A}\})$ 的整系数相对同调只在 $\nu$ 次有一个 $\mathbb{Z}$，$\nu=0$ 时按 $(\{0\},\varnothing)$ 理解，相对 Künneth 定理交来 $H_i(C_*)\cong H_{i-\nu}(W;\mathbb{Z})$，接上秩引理即得下界；正定、负定、不定三种二次型一次覆盖。备注（第 $156$ 到 $172$ 行）处理约定之争：把"紧集外精确等于"放宽成"$\|dF-dQ\|$ 一致有界"，$\operatorname{SM}$ 的值不动。证明读来舒服：$F=Q+h$、$\|dh\|\leq K$，紧性给 $|h|\leq K_0+K|z|$，非退化给 $\|dQ(z)\|\geq c|z|$，截断 $\chi_R$ 在环带上满足 $\|d(\chi_R h)\|\leq K+C(K_0/R+2K)$，取 $R$ 大到压过 $cR$ 即把 $Q+\chi_R h$ 变成精确口径的admissible 函数。我初读定义时一直担心约定松紧会漏进反例，这条备注是买下的保险。

Smale 实现（第 $174$ 到 $204$ 行）：实维数不小于 $6$ 的单连通闭光滑流形上，存在普通 Morse 函数使每个指标 $i$ 的临界点数恰为 $r_i(W)+t_i(W)+t_{i-1}(W)$，逐项求和给 $\operatorname{Morse}(W)\leq\lambda(W)$；把 $\lambda(W)\leq\operatorname{SM}(W)\leq\operatorname{Morse}(W)\leq\lambda(W)$ 首尾一夹，$\operatorname{SM}(W)=\operatorname{Morse}(W)=\lambda(W)$ 同时落定。本例中 $M$ 与 $C$ 的实维数 $3332$、$3330$ 都越过门槛，单连通各自有出处（见 §8 与 §9），于是 §6 管线要的 $h$ 与定理陈述要的 $\operatorname{SM}(M)=\lambda(M)$ 一次到手。这一步完成后，剩下的一切都是将 $\lambda(M)$、$\lambda(C)$ 摊成 $X$ 的序列核算。

## §8 动力学侧：曲面 Y 与扰动的全套机关

$Y$ 的构造（build/sections/involution.tex 第 $162$ 到 $236$ 行）：把 $\mathbb{C}\mathrm{P}^1\times\mathbb{C}\mathrm{P}^1$ 在 $\{0,\infty\}\times\{0,\infty\}$ 四点吹起，光滑射影曲面自带凯勒形。对角圆作用 $t\cdot(z,w)=(e^{2\pi i t}z,e^{2\pi i t}w)$ 保持四中心、全纯提升；把任一凯勒形沿紧群平均得不变 $\omega_Y$。单连通分两段论证：从四维单连通闭流形去掉四点不伤单连通（道路与收缩圆盘靠一般位置避开点集），而 $Y$ 中任何回路可推离实余维 $2$ 的例外曲线，经吹下在同调 punctured 面上收缩。无穷小生成元 $V$ 满足 Cartan 公式 $d(\omega_Y(V,\cdot))=\mathcal{L}_V\omega_Y=0$，配合 $H^1(Y;\mathbb{R})=0$ 得光滑 $k$ 使 $dk=\omega_Y(V,\cdot)$，于是自洽哈密顿 $k/2$ 在时刻一产出半转 $g_Y$；后面拼装时第一阶段哈密顿可以就取这个自洽函数的拉回（build/sections/construction.tex 第 $242$ 到 $244$ 行）。

不动集结构用吹起的局部模型逐寸算：中心处圆权 $(\alpha,\beta)$ 满足 $\alpha,\beta\in\{1,-1\}$，半转即 $(z_1,z_2)\mapsto(-z_1,-z_2)$；吹起空间是直线与点上向量的对 $(\ell,v)$，提升后的半转映 $(\ell,v)\mapsto(\ell,-v)$，固定集恰为例外零截面，其切向导数为恒等、法线方向为 $-1$，等变吹下排除其余不动点。同调账：每处点吹起把一个四球换成以 $\mathbb{C}\mathrm{P}^1$ 为底、边界同为 $S^3$ 的盘丛，Mayer--Vietoris 给 $H_2$ 添一枚自由生成元而 $H_1$ 不动，从 $(1,2,1)$ 的秩出发、四点吹满得 $H_0\cong\mathbb{Z}$、$H_2\cong\mathbb{Z}^6$、$H_4\cong\mathbb{Z}$；核 $(1,6,1)$ 的中间权重 $6$ 就住在这里。陈数评估：例外曲线法丛 $\mathcal{O}_{\mathbb{C}\mathrm{P}^1}(-1)$，切-法正合列给 $\langle c_1(TY),[E_j]\rangle=\deg T\mathbb{C}\mathrm{P}^1+\deg\mathcal{O}_{\mathbb{C}\mathrm{P}^1}(-1)=2-1=1$，最小陈数恰 $1$ 的逃逸口由此焊死。

扰动原理的线性代数（第 $55$ 到 $156$ 行）：把度量对 $g$ 平均后，不动点处指数映射把 $g$ 与共轭到 $d_xg$ 对齐，固定流形切空间为 $E_x^+=\ker(d_xg-I)$；$(d_xg)^2=I$ 给 $T_xP=E_x^+\oplus E_x^-$，$u\in E_x^+$、$v\in E_x^-$ 时辛不变性写两遍得 $\omega_x(u,v)=-\omega_x(u,v)$，两子块辛正交且各自非退化，固定分量因此是闭辛子流形。$f$ 取 $g$-不变延拓后 $g_*X_f=X_f$，流与 $g$ 交换，$\Phi_\epsilon^2=\psi^{2\epsilon}$；短周期分界把 $\Phi_\epsilon$ 的不动点集精确锁成各 $\operatorname{Crit}(h_j)$ 的并，非退化两块分别看：切向 $\omega_x(A_x^+u,v)=\operatorname{Hess}_x(h_j)(u,v)$ 与 Hesse 非退化给 $A_x^+$ 可逆、差商 $\frac{\exp(\epsilon A_x^+)-I}{\epsilon}\to A_x^+$，法向 $-\exp(\epsilon A_x^-)-I\to -2I$，临界点有限所以单一 $\epsilon$ 全局可用。时间一哈密顿是道路拼接：$(0,1)$ 内两个不相交子区间上的非负单位积分 bump $a$、$b$ 给出 $H_\epsilon(t,x)=a(t)K_{A(t)}(x)+\epsilon b(t)f(x)$，在 $t=0$ 与 $t=1$ 附近消失保证周期延拓光滑（第 $143$ 到 $156$ 行）；$M=X\times Y$ 单连通，一切不动点回环可缩，$\#\operatorname{Fix}$ 与 $\#\operatorname{Fix}_0$ 两行数字因此相等。实现推论（第 $238$ 到 $264$ 行）把这些打包：对任意单连通闭凯勒 $X$ 与任意光滑 Morse 函数 $h$ 于 $C=X\times\mathbb{C}\mathrm{P}^1$，存在光滑 $1$ 周期 $H$ 使 $\#\operatorname{Fix}(\phi_H^1)=\#\operatorname{Fix}_0(\phi_H^1;H)=4\#\operatorname{Crit}(h)$，且 $M$ 单连通凯勒、最小陈数 $1$。

## §9 供给侧：两张双椭圆商曲面与整系数吹起公式

曲面 $S_p$（build/sections/geometry.tex 第 $12$ 到 $29$ 行）：取 $\Lambda_2=\mathbb{Z}+i\mathbb{Z}$、$\Lambda_3=\mathbb{Z}+\zeta_3\mathbb{Z}$、$\zeta_p=e^{2\pi i/p}$、$E_p=\mathbb{C}/\Lambda_p$，自同构 $\sigma_p(z,w)=(z+1/p,\zeta_p w)$ 阶为 $p$，每个非恒等幂在第一因子上的平移都非平凡，作用自由，所以 $S_p=(E\times E_p)/\langle\sigma_p\rangle$ 是光滑紧连通复曲面，分类学里叫双椭圆曲面。嵌入三段式：三次线丛在椭圆曲线上有三维截面空间，Riemann--Roch 扣掉一次或二次有效除数后降到二或一，完整线性系无基点且分点分切向量，曲线嵌入 $\mathbb{C}\mathrm{P}^2$；两因子各嵌再 Segre，得 $\iota_p\colon E\times E_p\hookrightarrow\mathbb{C}\mathrm{P}^8$。把 $\mathbb{C}^9$ 的非零向量视为对偶空间上的线性多项式，轨道 $p$ 个像点的代表元连乘给出 $\sigma_p$ 不变的射影 $p$ 次多项式， descended 映射 $F_p\colon S_p\to\mathbb{P}(\operatorname{Sym}^p\mathbb{C}^9)$；单射靠唯一因子分解从乘积还原无序轨道，浸入靠把恒等式 $\sum_j\dot L_j\prod_{k\ne j}L_k=a\prod_k L_k$ 逐一限制到超平面 $\{L_j=0\}$、用多项式环是无零因子环逼出每个 $\dot L_j$ 与 $L_j$ 成比例；紧性收尾成全纯嵌入。维数 $\dim\operatorname{Sym}^2\mathbb{C}^9=45$、$\dim\operatorname{Sym}^3\mathbb{C}^9=165$ 把 $S_2$、$S_3$ 分别落在 $\mathbb{C}\mathrm{P}^{44}$ 与 $\mathbb{C}\mathrm{P}^{164}$，第 $25$ 到 $34$ 行中心表的向量维 $90$、$165$、$495$ 依此是 $45\cdot 2$、$165$、$165\cdot 3$，后两个来自再乘 $\mathbb{C}\mathrm{P}^1$ 与 $\mathbb{C}\mathrm{P}^2$ 的 Segre。

整系数同调（第 $101$ 到 $139$ 行）：万有覆叠 $\mathbb{C}^2\to S_p$ 的deck 变换群由 $a(z,w)=(z+1/p,\zeta_p w)$、$d(z,w)=(z+i,w)$ 与 $\Lambda_p$ 平移生成，$a^p$ 是第一因子平移 $1$，交换的 $a,d$ 生成 $\mathbb{Z}^2$、对 $\Lambda_p$ 的作用分别是 $\zeta_p$ 与恒等，于是 $\pi_1(S_p)\cong\Lambda_p\rtimes\mathbb{Z}^2$，$H_1(S_p;\mathbb{Z})\cong\mathbb{Z}^2\oplus\Lambda_p/(\zeta_p-1)\Lambda_p$。$p=2$ 时 $\zeta_2-1=-2$，商出 $T_2=(\mathbb{Z}/2)^2$；$p=3$ 时 $\zeta_3-1$ 在基 $(1,\zeta_3)$ 下矩阵为 $\begin{pmatrix}-1&-1\\ 1&-2\end{pmatrix}$，史密斯标准形 $\operatorname{diag}(1,3)$ 给 $T_3=\mathbb{Z}/3$。复定向供整系数庞加莱对偶，$H_3\cong\mathbb{Z}^2$；万有系数定理把挠转进 $H_2$：$\operatorname{Tor}H_2(S_p;\mathbb{Z})\cong T_p$；$p$ 次覆叠给 $\chi(S_p)=0$ 反解 $\operatorname{rank}H_2=2$。汇总 $b(S_p)=8$，且挠群同型地住在度数 $1$ 与 $2$ 两处，吹起位移 $\sum_k$ 因此整齐落进两条奇偶度列，这是 §10 序列设计可施行的第二个前提。

吹起公式（第 $148$ 到 $254$ 行，整系数版可在 Duan--Li 的文里找到）：闭连通凯勒 $A$、复余维 $c\geq 2$ 的闭连通复子流形 $Z$，吹起 $\pi\colon\widehat{A}\to A$ 仍是闭连通凯勒且保单连通，同调分解 $H_i(\widehat{A};\mathbb{Z})\cong H_i(A;\mathbb{Z})\oplus\bigoplus_{j=1}^{c-1}H_{i-2j}(Z;\mathbb{Z})$ 逐度成立。三段论证：局部模型 $(\ell,v)$ 给光滑性与例外除子 $E=\mathbb{P}(\nu)$、其法线丛 $\mathcal{O}_E(-1)$；凯勒性靠把 $\mathcal{O}_E(1)$ 沿射影纤维正定的 Hermite 度量扩到 $\mathcal{O}(-E)$、曲率 $\eta$ 在 $\pi^*\omega_A$ 的核方向（纤维切向）上正、单位切丛紧性把正性铺满，$\pi^*\omega_A+\varepsilon\eta$ 小 $\varepsilon$ 即可；同调分解一侧，整系数 Leray--Hirsch 用纤维基 $1,h,\dots,h^{c-1}$（$h=c_1(\mathcal{O}_E(1))$）拆 $H^k(E)$，不需要 $Z$ 的上同调无挠，Gysin 前推满足 $\iota^*\iota_*(v)=-hv$，校正类 $s_j(u)=-\iota_*(h^{j-1}\rho^*u)$ 在 $E$ 上限制出正幂项 $h^j\rho^*u$；"在 $E$ 上限制为 $\rho^*z$ 的类来自 $\pi^*$"这一断言靠缩除子同胚 $\widehat{A}/E\cong A/Z$ 诱发的相对上同调同构与长正合列 naturality 清账，满射靠逐层减 $s_j$，单射靠 $\deg\pi=1$、$\pi_*[\widehat{A}]=[A]$ 与整系数对偶在挠部也无损。这条公式是把 $T_p$ 搬进单连通流形而不引入任何扩张歧义的唯一机器，正文里"无扩张歧义"五个字的兑现处就在这里。

## §10 两条素数重复度的平衡：逐格核算

参数与中心清单（build/sections/construction.tex 第 $10$ 到 $50$ 行）：$N=1664$、$L=N-3=1661$， ambient 空间 $\mathbb{C}\mathrm{P}^N$。七件中心：两件 $S_2\times\mathbb{C}\mathrm{P}^1$（向量维 $90=45\cdot 2$、余维 $N-3$、自由贝蒂秩合计 $16=2\cdot 8$），三件 $S_3$（向量维 $165$、余维 $N-2$、秩 $8$），两件 $S_3\times\mathbb{C}\mathrm{P}^2$（向量维 $495=165\cdot 3$、余维 $N-4$、秩 $24$）。向量维总和 $2\cdot 90+3\cdot 165+2\cdot 495=1665=N+1$（第 $40$ 行），于是七者可以放进 $\mathbb{C}^{N+1}$ 直和分解的各分量射影化，两两不交；中心复余维依次 $N-3$、$N-2$、$N-4$，都不小于 $2$，§9 公式逐件适用且不互相干扰（未吹者邻域在未动的分量里不变）。$X$ 为七连吹，闭连通凯勒、单连通、复维数 $N$。位移公式（第 $52$ 到 $55$ 行）：中心 $S_p\times\mathbb{C}\mathrm{P}^r$ 往 $H_i(X)$ 加 $\bigoplus_{k=1}^{L-r}H_{i-2k}(S_p\times\mathbb{C}\mathrm{P}^r)$，$r=0,1,2$ 分别给 $L$、$L-1$、$L-2$ 个附加项；自由秩账 $b(X)=(N+1)+2\cdot 16(L-1)+3\cdot 8L+2\cdot 24(L-2)=1665+53120+39864+79632=174281$（第 $57$ 到 $62$ 行）。

轮廓与总和（第 $66$ 到 $106$ 行）：$X$ 的挠度列写成 $1+2j$ 与 $2+2j$ 两条、$j\in\mathbb{Z}$，$f_r(j)=\#\{(k,l)\colon 1\leq k\leq L-r,\ 0\leq l\leq r,\ k+l=j\}$ 数的是同一个 $j$ 能被位移与因子次数分成的方式；$a_j=4f_1(j)$（$2$ 件中心、每件带两枚 $\mathbb{Z}/2$，因子 $4$），$q_j=3f_0(j)+2f_2(j)$（$3$ 件 $S_3$ 与 $2$ 件带 $\mathbb{C}\mathrm{P}^2$ 的 $3$ 主部分）。Künneth 无交叉挠项因 $\mathbb{C}\mathrm{P}^r$ 全自由。逐段读值：$f_0\equiv 1$；$f_1$ 在 $\{1,L\}$ 取 $1$、其余取 $2$；$f_2$ 在 $\{1,L\}$ 取 $1$、$\{2,L-1\}$ 取 $2$、内部取 $3$。于是 $a_j$ 依次 $4,8,8$、$q_j$ 依次 $5,7,9$、$\delta_j=a_j-q_j$ 依次 $-1,1,-1$，支撑恰为 $1$ 到 $L$。总和：$A=\sum_j a_j=2\cdot 4+2\cdot 8+(L-4)\cdot 8=8(L-1)=13280$，$Q=\sum_j q_j=3L+2(3L-6)=9L-12=14937$（论文的写法是 $3L+6(L-2)$，与此恒等），差 $A-Q=4-L=-1657<0$。这两个总和是后一切计算的底盘：奇偶合并后的 $\max$ 由 $3$ 主拿下，正比就在 $Q$ 大。

卷积与两计数（第 $108$ 到 $229$ 行）：$\mathbb{C}\mathrm{P}^1$ 自由偶部秩列 $(1,1)$、$Y$ 的 $(1,6,1)$，乘子作用把 $X$ 的重复度分别与核 $e_C=(1,1)$、$e_M=(1,6,1)$ 卷积；自由秩 $b(C)=2b(X)$、$b(M)=8b(X)$。对 $v,w\geq 0$ 有 $d((\mathbb{Z}/2)^v\oplus(\mathbb{Z}/3)^w)=\max(v,w)$：下界由模 $2$、模 $3$ 约化，上界由把 $\min(v,w)$ 对因子按中国剩余定理两两配对。合并侧：$M$ 的每一奇偶列把全部度的 $2$ 主与 $3$ 主分别加总为 $8A$ 与 $8Q$，$\max$ 取 $8Q$，两列再乘前置 $2$，$\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)=8b(X)+32Q=1394248+477984=1872232$。逐度侧分两张脸。$C$ 上 $(e_C*\delta)_j=\delta_j+\delta_{j-1}\leq 0$：正峰 $j=2$ 处 $-1+1=0$、峰右邻 $1-1=0$、其余 $-2$，边界处支撑外为零一并验过；故 $C$ 每度 $\max$ 都归 $3$ 主，奇偶列总和 $2Q$，$\lambda(C)=2b(X)+8Q=348562+119496=468058$，乘 $4$ 恰回 $1872232$。$M$ 上 $e_M*\delta$ 的正部只在 $j=3$ 与镜像 $j=L$、值都是 $4$：$(e_M*\delta)_3=\delta_3+6\delta_2+\delta_1=-1+6-1=4$；$\delta_{j-1}=-1$ 处三项和至多 $1-6+1=-4$；$\delta_{j-1}=0$ 处只剩非正的边界项。正部逐度和 $=8Q+8$ 每列，两列乘 $2$：$\lambda(M)=8b(X)+32Q+32=1872264$。差恰 $32$，来源清点：两个正峰 $\times$ 值 $4$ $\times$ 两列 $\times$ 前置 $2$。手算复核：$8\cdot 174281=1394248$，$32\cdot 14937=477984$，$4\cdot 468058=1872232$，$1872264-1872232=32$，全部吻合。

[推测] 记一笔未竟之问：支撑 $\{1,\dots,L\}$ 上把正峰从 $\{2,L-1\}$ 挪到任何满足"每个正峰左右都贴负谷"的位置集，$(1,1)*\delta\leq 0$ 仍成立，而 $(1,6,1)*\delta$ 的正部位置与大小随峰位移动；解空间有多大、差 $32$ 能否调成别的常数，素材没有讨论，我只按用到的数值钉死。

## §11 拼装与验证闭环

定理完成段（build/sections/construction.tex 第 $231$ 到 $255$ 行）把四条线拧在一起。$M$ 与 $C$ 的单连通与维数事先核过：$X$ 复维 $1664$、$Y$ 复维 $2$，$M$ 复维 $1666$、实维 $3332$，$C=X\times\mathbb{C}\mathrm{P}^1$ 实维 $3330$，双双超过 Smale 门槛 $6$。§7 的定理给 $\operatorname{SM}(M)=\lambda(M)$ 并给 $C$ 上恰有 $\lambda(C)$ 个临界点的普通 Morse 函数 $h$；§8 的实现推论给光滑 $1$ 周期 $H$，其不动点恰 $4\lambda(C)$ 个、全非退化、回环全可缩，且 $c_1(TM)(\pi_2(M))=\mathbb{Z}$；§10 的账把 $4\lambda(C)=\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)=1872232$ 与 $\operatorname{SM}(M)=1872264$ 钉死。主定理至此闭合。拼装里还藏一个美观细节：扰动命题第一阶段要的那条从恒等到 $g$ 的哈密顿道路，这里可以直接取 $Y$ 上圆作用矩映射之半 $k/2$ 的拉回，自洽、光滑、周期一恰给半转，全程不需要任何近似论证。

三栏局部图（第 $177$ 到 $216$ 行）值得逐栏读，它把左端点附近的手指运算摊平展示：第一栏 $\delta_j$ 在 $j=0$ 到 $5$ 依次 $0,-1,1,-1,-1,-1$；第二栏 $(e_C*\delta)_j$ 依次 $0,-1,0,0,-2,-2$，正峰 $j=2$ 被 $(1,1)$ 完全压平；第三栏 $(e_M*\delta)_j$ 依次 $0,-1,-5,4,-6,-8$，中间权 $6$ 在 $j=3$ 顶出 $+4$。横坐标是列表指标、不是同调次数，三栏共用纵刻度，右端是镜像图样。这张图就是 §5 那句"同一序列两种敏感度"的原型。

验证闭环清单，我按落笔后的顺序逐条自查：其一，两计数定义中 $d(0)=0$ 的约定被一致使用，空挠不贡献；其二，$\beta_{\mathbb{Z}}^{\mathrm{cyc}}\leq\lambda$ 的一般不等式方向与 §3 陈述一致，反例只松动"逐度 $\max$ 归属交替"这一处；其三，秩部分对两计数恒同（$8b(X)$ 与 $2b(X)$ 的倍率差恰好被固定分量个数 $4$ 吸收），差只能来自正部，§4 第四条弯路据此正式关门；其四，非退化性与可缩性是动力学输出的自带条款，不需要额外微调 $H$；其五，最小陈数为 $1$ 使 Bai--Xu 界在该场景退化为 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}$，"踩尖循环界"这句话才有辛几何意义，否则只是两个代数计数游戏；其六，构造有限维完成，Floer 机器只出现在文献定位段，与计算无关。六条都过，这条路线才算被证成。

## §12 最终思路与最初设想的差异

第一重差异是立场本身。动笔前我押稳定 Morse 猜想在凯勒类成立，理由是 Hodge 理论的刚性加上 DRG 在面积类与一陈类渐近消没条件下的部分正面结果；最终产品却是该类内的反例。出口没在渐近消没附近寻找，钻的洞是一条陈数评估为一的球：$[E_j]$ 在 $M$ 上的辛面积与一陈类双双非零，把正面文献的假设逐字击穿；同一条球同时供应最小陈数恰 $1$，是 Bai--Xu 界退化为循环计数的钉合点。击破猜想所需的几何与让下界保有辛意义的几何是同一条例外曲线，这种巧合完全不在最初设想里，我起初以为要准备两套几何、各干一件坏事。

第二重差异是责任分配。最初设想认为反例必须由动力学留白，不动点数落在两界之间某个说不清的位置；最终形态是不动点数恰好等于循环界，全部反例重量压进 $\lambda(M)-\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)=32$ 这个纯代数差。主语从"哈密顿系统比 Morse 理论允许的更省"改成"两个整系数计数本来就不同"。题目里的尖锐性与此同源：踩尖循环界与击破稳定界是同一枚硬币的两面，做尖一侧的动作恰好让另一侧的差暴露成常数。

第三重差异是搜索方向。最初把七件中心的件数、维数、余维数当作六组待凑的几何自由度，打算连数值目标一起粗格点搜索；最终是 §5 的反序：先在纸上写好 $\delta$ 轮廓，让计数函数 $f_r$ 的线性方程组反解中心清单，$2\cdot 90+3\cdot 165+2\cdot 495=1665$ 的装箱恒等式只是给几何执行器做可行性体检。搜索对象从几何流形缩到有限整数序列，这是全流程里效率跃迁最大的一步。

第四重差异是机器维数。§4 第三条弯路里我想用 Floer 式无穷维机器去全局压制多余不动点；最终全文有限维完成：紧截断、切向梯度状场、块状可逆性核验、Lipschitz 短周期分界，模空间一次没进场的必要。Floer 理论只在概念地图上提供 Bai--Xu 下界的位置，不动点计数钉死全程发生在有限维哈密顿系统内部。

第五重差异是对差的量级预期。最初猜差会随支撑长度 $L$ 增长，或者至少是可以随意调档的旋钮；最终差由正峰个数决定：每个峰在 $M$ 侧贡献值 $4$，经两列与前置 $2$ 放大，本配置两峰定格在 $32$，与 $L$ 无关。把 $N$ 与 $L$ 推大只会同时加厚两个界的质量、摊薄反例的相对幅度，不放大差。这提示差的可调性藏在峰位布局里，见 §13 第一问。

第六重差异是约定的分量。我一度把 $\operatorname{SM}$ 的"紧集外精确二次"与"微分一致渐近"两种口径当作可能影响定理内容的实质选择，§7 备注的截断论证证明二者互吸、数值不动；约定之争就此退场，剩下的只是陈述卫生。

最后一重是写作组织。初想是把四环节焊成一段贯通变分论证；最终拆成几何比较、动力学实现、代数几何供给、序列核算四个各自闭合的模块，而模块切割线恰是"自由部分自动同型"那条恒等式，等式一侧完全不用设计，各模块才可能独立验证。[推测] 这种切法在论文里呈现为天生如此，我认为它是从前一篇框架继承的骨架，动笔顺序素材没有记录，我无从证实。

## §13 遗留问题与推测清单

第一问：差能不能参数化。$32$ 来自两个正峰；若允许 $\delta$ 在支撑上放多个峰、且每峰左右都贴负谷以保证 $C$ 侧 $(1,1)*\delta\leq 0$，则每峰在 $M$ 侧同样顶出 $+4$，差应随峰数线性放大。[推测] 这类多峰轮廓可由同族计数函数反解出成分更多的中心清单，但素材只跑通两峰一例，装箱恒等式在更多成分下是否仍可解我没有验证；这是本单最省力的加深入口。

第二问：上界一侧。本例证伪了稳定 Morse 界的一般形式，没有回答"循环界是否是单连通辛流形上真正的普适下界"。若在非凯勒类中 $\operatorname{SM}$ 与 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}$ 之间还住着第三个计数，本构造的间隙可能被重新解释。素材不碰这一问题，我原样记录知识边界。

第三问：最小例子。维数 $3332$ 被中心维预算 $90$、$165$、$495$ 与位移长度 $L=N-3$ 顶高；轮廓约束实质上只有支撑非空、余维不小于一、峰位可分离三条，把 $N$ 压小、或寻找同调型更低次的商曲面，空间应当存在，[推测] 具体界限无法从素材给出，因为嵌入维数由对称幂预算 $\binom{8+p}{p}$ 锁死。

第四问：更高的最小陈数。Bai--Xu 界在一般位置按 $2N$ 模约化次数，$N>1$ 时合并跨度的自由度更大；中间计数与逐度计数之差能否同样造反例，素材只在引言第 $80$ 到 $86$ 行给了一般位置一句话，未展开。

第五问：非单连通情形。整条管线里 $M$ 单连通被用了两次：$\lambda=\operatorname{SM}$ 需要 Smale 定理的单连通前提，$\#\operatorname{Fix}=\#\operatorname{Fix}_0$ 需要回环自动可缩。若松开单连通，以自由基本群为参数的计数与 $\operatorname{Fix}_0$ 口径都需重议，文献目录里 Damian 的稳定 Morse 数工作与 Poder--Balkeståhl 的简单同伦型方向各咬住一角，本构造与它们没有接触面。

第六问：踩尖的稳健性。把扰动命题的时间窗 bump 换成一般的不变扰动、或允许非自洽第一阶段道路，不动点清单是否仍精确等于临界点集？证明只依赖交换性与短周期分界，答案应当是肯定的，[推测] 无新结构，素材没有对应的多余讨论。

标签清点：本文 [推测] 共七处，§2 动机时间线一处、§4 无穷维路线痕迹一处、§10 轮廓自由度一处、§12 模块继承一处、§13 三处；每处都注明了证据缺口位于素材的哪个空白。

## §14 自检与勘误

本节申报对已落盘的 §0 到 §13 生效；全文终值在 §15 落盘后于交付报告中如实汇报，勘误不就地改写任何已落盘字符。

永久缺口申报：首块落盘实测 $19723$ 字节，比硬下限 $20000$ 差 $277$ 字节，属构造七节时每节体量估瘦，按规格申报为永久缺口；未整档重写，补齐全部走文末追加。

禁串按类别申报。连词反转族命中 $1$ 处：§3 讲互素分支生成元数行为的一句里，"而"字之后紧跟否定字符构成两字禁形；同族的其余形态零命中。纯英文术语残留族命中 $9$ 处，分布在 §7 两处、§8 三处、§9 三处、§10 一处，均为动笔时漏改的原文语汇，字形不复写；人名与文件路径的拉丁拼写不在本族计数。聊天残留与排版瑕疵族申报 $1$ 处：§6 谈 Lipschitz 周期界的一句里两个拉丁词之间出现连续双空格。长停顿号族零命中；装饰性横线与整行横线零命中；连续双逗号族零命中；装饰性加粗列表零命中；对勾与箭头类校验符号零命中。素材内部引用形态与自定义宏名全文零转录，素材宏一律展开为标准写法。

结构自检：小节编号 §0 到 §15 连续且物理排布依编号；文内前向引用只出现 §5、§6、§7、§8、§9、§10、§12、§13、§15 这些目标，各指向真正讨论它的节；台账表头全文仅在 §15 出现一次，补录数据行不再抄表头；每行行尾只有单一换行符、无回车；§0 到 §11 已落盘部分逐行数学校界符成对核验通过，总数终值见交付报告。

事实自检：所有位置引用出自本会话对 build 的逐件精读与 grep 行号复核；主数值 $1872232$、$1872264$、$32$ 与辅量 $174281$、$13280$、$14937$、$468058$ 以及恒等式 $2\cdot 90+3\cdot 165+2\cdot 495=1665$、$8(L-1)=13280$、$9L-12=14937$、$4\cdot 468058=1872232$ 逐条手算复核；取证调用 $15$ 次，首次落盘在第 $16$ 次调用；§0 末尾两条登记各占一行且逐字完整。

## §15 素材行号索引与再读路径

这一节把全文用到的素材位置按证明流向重排一遍，供下次再读时直接跳进原文。动力学线的读序：build/sections/involution.tex 第 $14$ 到 $49$ 行短周期引理，第 $55$ 到 $156$ 行扰动原理，第 $162$ 到 $236$ 行曲面 $Y$，第 $238$ 到 $264$ 行实现推论；配套的符号约定在 build/sections/introduction.tex 第 $44$ 到 $50$ 行，约定选择 $\omega(X_{H_t},\cdot)=dH_t$ 影响 $\operatorname{Hess}$ 配对式的正负号读法。几何比较线的读序：build/sections/morse.tex 第 $16$ 到 $28$ 行秩引理、第 $64$ 到 $154$ 行稳定下界命题、第 $156$ 到 $172$ 行约定备注、第 $174$ 到 $204$ 行 Smale 实现；命题证明内部最绕的是第 $104$ 到 $114$ 行"截断不带胞"一段，再读时先画出侧壁 $W\times\partial B_T$ 与带 $[-A,A]$ 的位置图，第 $T^2>A$ 一层含义立即自明，我第一遍读了三回才把单位拼接那句话看顺。代数供给线的读序：build/sections/geometry.tex 第 $12$ 到 $140$ 行两张商曲面、第 $148$ 到 $254$ 行整系数吹起公式；嵌入部分的 $\operatorname{Sym}^p\mathbb{C}^9$ 构造在第 $66$ 到 $99$ 行，浸入检验那步"限制到 $\{L_j=0\}$"的论证在第 $88$ 到 $93$ 行，这是全篇初读最易误判为跳步的地方，其关键是无零因子性，写手在页边补一句即可复原。序列核算线的读序：build/sections/construction.tex 第 $10$ 到 $64$ 行中心与 $b(X)$、第 $66$ 到 $106$ 行两条重复度、第 $108$ 到 $229$ 行卷积与差、第 $231$ 到 $255$ 行定理完成；三栏图及其说明在第 $177$ 到 $216$ 行，数值复核建议从第 $103$ 行的 $A$、$Q$ 出发重推 $a_j$ 与 $q_j$ 的逐段取值，我复推的中间结果是 $f_1$ 支撑 $\{1,\dots,L\}$、$f_2$ 支撑同而高度多一级，两处都以第 $86$ 到 $99$ 行的表为准。

再读路径之外，记四条"第一次读会误会"的清单，都是我自己踩过的。误会一：$\lambda(W)$ 与 $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(W)$ 的记号长得像同族变体，实际一个逐度取 $d$、一个并度取 $d$，误会点在读第 $19$ 到 $26$ 行时把两个求和号的作用域看反，解药是第 $30$ 到 $32$ 行的两行例。误会二：$\operatorname{SM}(W)$ 的几何约定里 $k\geq 0$ 全放开，容易读成只在高 $k$ 才有意思，其实本例里 $k=0$ 一支经 Smale 定理就是全部。误会三：扰动原理的 $\epsilon$ 看似自由小参数，实际受短周期阈值 $\tau$ 与非退化可用范围双重钳制，读第 $111$ 到 $141$ 行时要同时盯着两处。误会四：吹起公式的位移下标 $j$ 与序列支撑指标 $j$ 是两种东西，construction.tex 第 $9$ 行前后与 geometry.tex 第 $157$ 到 $159$ 行的 $j$ 不同义，我把后者读成前者时曾把 $L-r$ 的项数算错一项，回到第 $52$ 到 $55$ 行用位移公式重数才对上。四条误会都与记号复用有关，这也解释为什么本笔记坚持在 §1 把行号锚点先钉死再动笔。

## §16 勘误与补充申报

本节按类别补正 §14 的申报，已落盘文字一律不动。结构类一处：§14 里"台账表头全文仅在 §15 出现一次"一句中，台账节号应读作本文实际存放台账的最后一节，因 §15 之后又追加了勘误与台账两节，编号顺延，前向引用随之指向顺延后的节号，不涉及内容搬动。申报修正类两处：其一，纯英文术语残留族的分布申报需更正，§7 两处、§8 两处、§9 三处、§10 一处、§13 一处，共九处，此前写成"§8 三处"是把 §13 的一处误记入 §8，总数不变；其二，聊天残留与排版瑕疵类的双空格一处，位置申报 §6 无误，但同一句中相邻词距在后续节里另有一处类似形态，一并计入本类共两处，字形不复写。计数复核类一处：§14 声明 [推测] 共七处，逐节再点后确认为七处，分布 §2 一处、§4 一处、§10 一处、§12 一处、§13 三处，前文"标签清点"段把 §12 的一处漏列在清点句首、总数仍按含 §12 计，表述自相矛盾之嫌在此消除：§12 末段确有一处 [推测]，清点以七处为准。其余 §14 各条申报经复查维持原样。追加本节的全部字节都来自文末，未触碰任何先前字符；本节后文只剩台账一节。

## §17 台账

本表是 D567 全篇被消费数值的总账，逐行给出符号、数值、素材位置、下游消费者与断链后果；位置均为本会话实测的 build 下文件与行号，格内数学一律行内写法，限制与绝对值都不产生裸竖线形态。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)$ | $1872232$ | build/sections/construction.tex:250 | 主定理等式链、摘要数值、§11 闭环第一条 | 尖锐等式失效，题名的踩尖对象悬空 |
| $\operatorname{SM}(M)$ | $1872264$ | build/sections/construction.tex:251 | 摘要与引言的反例收束句 | 反例数值无法闭合，稳定界失败无落点 |
| $\operatorname{SM}(M)-\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)$ | $32$ | build/sections/construction.tex:226 | §4 核心差、§12 量级预期、本表前两行 | 反例退化为单纯的循环界锐化推论 |
| $\dim_{\mathbb{R}}M$ | $3332$ | build/main.tex:44 | §7 维数门槛核验与 §11 拼装 | Smale 定理越界，$\lambda=\operatorname{SM}$ 无出处 |
| $\dim_{\mathbb{C}}X$ | $1664$ | build/sections/construction.tex:253 | 维数簿记与 §13 第三问 | $M$ 实维不再是 $3332$，摘要口径断裂 |
| $N$ | $1664$ | build/sections/construction.tex:12 | 七中心的装箱恒等式所在 ambient 维 | 中心无法两两不交地放入射影空间 |
| $L$ | $1661$ | build/sections/construction.tex:12 | $\delta$ 支撑长度与位移项数 | $A$、$Q$ 分段计数与峰位全部错位 |
| $b(X)$ | $174281$ | build/sections/construction.tex:60 | 两计数的自由部分公共来源 | 两个界同时偏差十万量级，等式不复成立 |
| $A$ | $13280$ | build/sections/construction.tex:103 | 合并侧 $Q>A$ 判据 | $\max$ 翻向 $2$ 主，循环式改写为 $8b(X)+32A$ |
| $Q$ | $14937$ | build/sections/construction.tex:103 | $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)=8b(X)+32Q$ 的主导项 | 尖锐等式与差同时按 $32$ 倍偏差走 |
| $A-Q$ | $4-L$ | build/sections/construction.tex:103 | 合并侧符号判定的总账 | $3$ 主支配方向存疑，§10 全节重审 |
| $\lambda(C)$ | $468058$ | build/sections/construction.tex:249 | 不动点计数放大基 $4\lambda(C)$ | 不动点数踩不上循环界，锐化丢失 |
| $4\lambda(C)$ | $1872232$ | build/sections/construction.tex:161 | 动力学输出与代数界的会师等式 | §6 管线产物与 §10 账本分道扬镳 |
| $\lambda(M)$ | $8b(X)+32Q+32$ | build/sections/construction.tex:226 | 差的右端点与 Smale 实现的落点 | 差不再是常数，§12 第五重差异失效 |
| $e_C$ | $(1,1)$ | build/sections/construction.tex:130 | $C$ 侧压平 $\delta$ 的卷积核 | 峰位 $\max$ 翻向 $2$ 主，$4\lambda(C)$ 超过循环界 |
| $e_M$ | $(1,6,1)$ | build/sections/construction.tex:130 | $M$ 侧正峰的卷积核来源 | 正峰无处生，差 $32$ 归零，反例失败 |
| $(e_M*\delta)_3$ | $4$ | build/sections/construction.tex:168 | 逐度正部合计每列 $8Q+8$ | $\lambda(M)$ 塌回循环界，两界不再分家 |
| $\delta_j$ 分段值 | $-1$、$1$、$-1$ | build/sections/construction.tex:96 | 两核相反行为的公共底 | 压平与放大不能同时成立 |
| $a_j$ 分段值 | $4$、$8$、$8$ | build/sections/construction.tex:94 | $\delta$ 构造与总和 $A$ | 峰形改变，正峰个数不再逼出 $32$ |
| $q_j$ 分段值 | $5$、$7$、$9$ | build/sections/construction.tex:95 | $\delta$ 构造与总和 $Q$ | $3$ 主支配动摇，合并侧等式换轨 |
| $2\cdot 90+3\cdot 165+2\cdot 495$ | $1665$ | build/sections/construction.tex:40 | 七中心直和装箱可行性 | 中心相交，逐次吹起的独立性论证作废 |
| 中心复余维 | $N-3$、$N-2$、$N-4$ | build/sections/construction.tex:29 | 吹起公式适用条件与位移项数 | 单连通性或挠率搬运机制被砍断 |
| $e_M$ 权重和 | $1+6+1=8$ | build/sections/construction.tex:130 | 秩倍率 $b(M)=8b(X)$ 的同步来源 | $4\lambda(C)$ 与 $8b(X)$ 的自动同型破裂 |
| $b(C)$ | $2b(X)$ | build/sections/construction.tex:133 | $\lambda(C)=2b(X)+8Q$ 的自由项 | 固定分量侧的自由秩核算失效 |
| $\dim\operatorname{Sym}^2\mathbb{C}^9$ | $45$ | build/sections/geometry.tex:96 | $S_2$ 嵌入 $\mathbb{C}\mathrm{P}^{44}$ | 中心向量维 $90$ 失去出处 |
| $\dim\operatorname{Sym}^3\mathbb{C}^9$ | $165$ | build/sections/geometry.tex:97 | $S_3$ 嵌入 $\mathbb{C}\mathrm{P}^{164}$ | 向量维 $165$ 与 $495$ 两行同时断 |
| $b(S_p)$ | $8$ | build/sections/geometry.tex:50 | 中心表自由秩 $16$、$8$、$24$ 之根 | $b(X)$ 公式系数结构改写 |
| $\operatorname{Tor}H_1(S_2;\mathbb{Z})$ | $(\mathbb{Z}/2)^2$ | build/sections/geometry.tex:45 | $a_j=4f_1(j)$ 因子 $4$ 的来源 | $2$ 主总重复度减半，$A$ 与峰形重算 |
| $\operatorname{Tor}H_1(S_3;\mathbb{Z})$ | $\mathbb{Z}/3$ | build/sections/geometry.tex:45 | $q_j=3f_0(j)+2f_2(j)$ 主来源 | $Q$ 总和重写，$Q>A$ 判定动摇 |
| $\pi_1(S_p)$ | $\Lambda_p\rtimes\mathbb{Z}^2$ | build/sections/geometry.tex:115 | $H_1$ 计算的群论轨道 | 挠群结论无出处，$T_p$ 无来源 |
| 史密斯标准形 | $\operatorname{diag}(1,3)$ | build/sections/geometry.tex:126 | $T_3=\mathbb{Z}/3$ 推导关键一步 | 循环因子数若变，$q_j$ 全表作废 |
| 吹起同调分解 | 求和指标 $1$ 到 $c-1$ | build/sections/geometry.tex:157 | $X$ 的素数轮廓整套搬运机制 | 位移公式与 $f_r$ 计数无从谈起 |
| 吹起余维下限 | $c\geq 2$ | build/sections/geometry.tex:151 | 单连通保持的前提 | $X$ 可能带回 $\pi_1$，Smale 适用中断 |
| 整系数纤维基 | $1$、$h$ 到 $h^{c-1}$ | build/sections/geometry.tex:205 | 分解无扩张歧义的机制 | 挠率在分解中可被扩张藏住，账目失真 |
| $H_2(Y;\mathbb{Z})$ | $\mathbb{Z}^6$ | build/sections/involution.tex:174 | 核 $e_M$ 中间权 $6$ 的几何根 | 正峰失去中间权支点，差 $32$ 无源 |
| 吹下前秩列 | $(1,2,1)$ | build/sections/involution.tex:228 | $Y$ 秩列 $(1,6,1)$ 的起点 | $H_2$ 倍率核算断链 |
| $\langle c_1(TY),[E_j]\rangle$ | $1$ | build/sections/involution.tex:178 | 最小陈数恰 $1$ 与主定理首式 | 循环界失去辛几何身份，Bai--Xu 退化无落点 |
| 固定分量个数 | $4$ | build/sections/involution.tex:166 | 实现推论的放大因子输入 | $4\lambda(C)$ 结构式变形，会师等式断 |
| 不动点输出式 | $4\#\operatorname{Crit}(h)$ | build/sections/involution.tex:246 | §6 与 §11 的计数方程形态 | 不动点数无法用 $\lambda(C)$ 表述 |
| 短周期阈值 | $T<\min(\delta,L^{-1})$ | build/sections/involution.tex:48 | 扰动命题的不动集锁死 | 不动点清单混入额外短回环轨道 |
| $\Phi_\epsilon^2$ | $\psi^{2\epsilon}$ | build/sections/involution.tex:113 | 不动点方程的两次应用归约 | 短周期分界够不着 $\Phi_\epsilon$，清单失控 |
| Hesse 配对式 | $\omega_x(A_x^+u,v)=\operatorname{Hess}_x(h_j)(u,v)$ | build/sections/involution.tex:131 | 非退化性的切向块核验 | 不动点可能退化，定理假设当场矛盾 |
| $H_\epsilon$ 拼接式 | $a(t)K_{A(t)}(x)+\epsilon b(t)f(x)$ | build/sections/involution.tex:149 | 周期延拓的光滑性与时间一映射 | $1$ 周期 $H$ 的口径失效，流定义断裂 |
| $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(W)\leq\lambda(W)$ | 恒成立不等式 | build/sections/introduction.tex:33 | §3 链条与 §14 方向性自查 | 差的方向翻转，反例陈述语义倒置 |
| $\lambda(W)$ 定义 | $b(W)+2\sum_i d(\operatorname{Tor}H_i(W;\mathbb{Z}))$ | build/sections/introduction.tex:19 | 差的左端点与逐度计数全体 | 被比较对象未定义，全篇无从落笔 |
| $\beta_{\mathbb{Z}}^{\mathrm{cyc}}(W)$ 定义 | 逐奇偶合并计数 | build/sections/introduction.tex:23 | 尖锐等式的右端 | 题名里的循环界所指消失 |
| $d(0)=0$ 约定 | 空群生成元数约定 | build/sections/introduction.tex:17 | §11 闭环第一条的口径 | 无挠段的贡献核算歧义 |
| $\operatorname{SM}(W)$ 约定 | 全 $k\geq 0$ 稳定的临界点极小 | build/sections/introduction.tex:37 | 反例所击败的 Golovko 型基准 | 击败的是另一种约定，定理错位 |
| $\operatorname{Fix}_0$ 口径 | 可缩回环全体 | build/sections/introduction.tex:49 | 主定理两行等式的左边 | 可缩性条款失去定义，§8 输出无处安放 |
| 符号约定 | $\omega(X_{H_t},\cdot)=dH_t$ | build/sections/introduction.tex:45 | Hesse 配对式的正负方向 | §8 非退化核验的符号读反 |
| $d(\mathbb{Z}/2\oplus\mathbb{Z}/3)$ | $1$ | build/sections/introduction.tex:30 | §4 第二条路线的最小机制例 | 混合素数支配机制的讲解失去锚点 |
| $\operatorname{rank}C_i$ 下限 | $b_i+t_i+t_{i-1}$ | build/sections/morse.tex:21 | 总秩不等式的逐度输入 | $\#\operatorname{Crit}(F)\geq\lambda(W)$ 无复形可用 |
| $\operatorname{SM}(W)\geq\lambda(W)$ | 所有闭光滑 $W$ | build/sections/morse.tex:68 | $\lambda(M)=\operatorname{SM}(M)$ 的夹逼中段 | 几何等式单边化，§11 数值断链 |
| 盘环移位式 | $H_i(C_*)\cong H_{i-\nu}(W;\mathbb{Z})$ | build/sections/morse.tex:147 | 下界证明的最后一环 | 相对同调认不出 $W$，秩引理空转 |
| 逐指标实现数 | $r_i+t_i+t_{i-1}$ | build/sections/morse.tex:179 | $h$ 存在与 $\lambda(C)$ 可取到 | 不动点计数只能给上界，踩尖谈不成 |
| 三重等式 | $\operatorname{SM}=\operatorname{Morse}=\lambda$ | build/sections/morse.tex:184 | §11 拼装的几何等式件 | $\operatorname{SM}(M)$ 值不可算，摘要第二数断 |
| 截断参数组 | $T>R_0$ 且 $T^2>A$ | build/sections/morse.tex:91 | 紧截断与切向场构造的前提链 | 侧壁临界值混入能带，截断多带胞腔 |
| $\#\operatorname{Fix}(\phi_H^1)$ | $1872232$ 个且全非退化 | build/main.tex:46 | 摘要对 Conley--Zehnder 型推广的反驳句 | 主定理的非退化假设句失去支撑 |
| $b(W)$ 定义 | $\sum_i \operatorname{rank} H_i(W;\mathbb{Z})$ | build/sections/introduction.tex:14 | 两计数的公共自由底座 | 自由部分核算整体无法落笔 |
| $\overline{H}_{\bar{i}}(W;\mathbb{Z})$ | 同奇偶度数直和 | build/sections/introduction.tex:21 | 循环计数的合并对象 | 合并无从定义，$\beta_{\mathbb{Z}}^{\mathrm{cyc}}$ 落空 |
| $d(G)$ 定义 | 最小生成元数 | build/sections/introduction.tex:16 | 两计数共用的群论映射 | $\max$ 那一步的语义消失 |
| $\operatorname{Morse}(W)$ | 普通 Morse 的极小点数 | build/sections/introduction.tex:41 | §7 三重等式的右端 | Smale 夹逼失去上界一侧 |
| 非退化判据 | $D\phi_H^1(x)$ 不含特征值 $1$ | build/sections/introduction.tex:48 | 主定理假设条款 | 计数对象的合法范围含糊 |
| $\operatorname{Tor}H_2(S_p;\mathbb{Z})$ | 与 $T_p$ 同构 | build/sections/geometry.tex:134 | $a_j$、$q_j$ 第二度列的来源 | 奇偶双列同型的前提断 |
| $\chi(S_p)$ | $0$ | build/sections/geometry.tex:137 | 反解 $\operatorname{rank}H_2=2$ | $b(S_p)=8$ 的结论不闭合 |
| $\sigma_p$ 阶与自由性 | 阶 $p$，非平凡幂自由作用 | build/sections/geometry.tex:22 | 商曲面 $S_p$ 的光滑性 | 中心不是流形，下游全断 |
| 乘积嵌入 | $E\times E_p\hookrightarrow\mathbb{C}\mathrm{P}^8$ | build/sections/geometry.tex:63 | 对称幂映射 $F_p$ 的公共舞台 | 轨道连乘构造没有坐标可依 |
| $F_p$ 的目标 | 射影化对称幂空间 | build/sections/geometry.tex:76 | 单射与浸入双重核验 | 嵌入维数预算 $45$、$165$ 悬空 |
| 例外除子法丛 | $\mathcal{O}_E(-1)$ | build/sections/geometry.tex:172 | Gysin 关系式 $\iota^*\iota_*(v)=-hv$ 的符号 | 校正类 $s_j$ 符号翻转，单射论证断 |
| 缩除子同胚 | $\widehat{A}/E\cong A/Z$ | build/sections/geometry.tex:222 | 满射断言的相对同构 | 扩张歧义的清除机制停摆 |
| 一度前推 | $\pi_*[\widehat{A}]=[A]$ | build/sections/geometry.tex:246 | $\pi^*$ 整系数单射 | 挠部可能被拉回杀死，分解式失真 |
| $\zeta_2-1$ 的作用 | $-2I$ | build/sections/geometry.tex:121 | $T_2=(\mathbb{Z}/2)^2$ 推导第一步 | $2$ 主重复度失去算术出处 |
| 半转提升 | $(\ell,v)\mapsto(\ell,-v)$ | build/sections/involution.tex:216 | 不动集恰为四条例外曲线 | 固定分量个数不再是 $4$，放大因子断 |
| 矩映射存在性 | 依赖 $H^1(Y;\mathbb{R})=0$ | build/sections/involution.tex:205 | 圆作用的哈密顿性 | $g_Y$ 不是哈密顿对合，整条管线断 |
| 临界点输出量 | $\lambda(C)=468058$ 个 | build/sections/construction.tex:249 | $4\lambda(C)$ 的单点计数输入 | 不动点与循环界的等式断 |
| 三明治链条 | $\lambda(W)\leq\operatorname{SM}(W)\leq\operatorname{Morse}(W)$ | build/sections/morse.tex:201 | 实现定理的夹逼形态 | 三重等式退化为单向估计 |
| 自由复形取等 | 任意 prescribed 同调可达下界 | build/sections/morse.tex:26 | $\beta_{\mathbb{Z}}^{\mathrm{cyc}}$ 的最小总秩解读 | 代数极小值这层意义失效 |
| 侧壁临界值集 | 只可能取 $\pm T^2$ | build/sections/morse.tex:108 | 切向梯度状场的可行性 | 带截断引入额外胞腔，总秩等式破 |
| 端点对形变收缩 | 缩 $v$ 保 $K_\pm$ 不变 | build/sections/morse.tex:135 | 化到盘环对的合法性 | 相对同调无法识别成 $W$ 的移位 |
| 约定吸收估计 | $\lVert d(\chi_R h)\rVert \leq K+C(K_0/R+2K)$ | build/sections/morse.tex:165 | 备注的两种口径一致 | 两约定变成两个定理，反例引用翻倍  |
| 交换性 | $g_*X_f=X_f$ | build/sections/involution.tex:102 | $\Phi_\epsilon^2=\psi^{2\epsilon}$ 的前提 | 两次应用归约当场断 |
| 不变函数平均 | $f=\tfrac12(\widetilde f+\widetilde f\circ g)$ | build/sections/involution.tex:99 | 各 $h_j$ 的同时延拓 | 预赋 Morse 函数进不了哈密顿管线 |
| 因子空间自由 | $\mathbb{C}\mathrm{P}^r$ 同调无挠 | build/sections/construction.tex:74 | $a_j$、$q_j$ 公式的整洁形态 | 挠交叉项毁掉整条轮廓 |
| 端点消失条款 | $H_\epsilon$ 在 $t=0,1$ 附近消失 | build/sections/involution.tex:153 | 周期延拓的光滑 | 光滑 $1$ 周期口径非法 |
| 回环可缩保证 | 靠 $M$ 单连通 | build/sections/involution.tex:155 | $\#\operatorname{Fix}_0$ 那一行计数 | 等式链第二环失效 |
| 平凡束化简 | $\langle c_1(TM),[\{x\}\times E_j]\rangle=1$ | build/sections/involution.tex:261 | 最小陈数一在 $M$ 上的落地 | 主定理首条显示式悬空 |
| $\operatorname{Tor}H_{1+2j}(X)$ 型 | $(\mathbb{Z}/2)^{a_j}\oplus(\mathbb{Z}/3)^{q_j}$ | build/sections/construction.tex:79 | 两素数重复度的账本全体 | 卷积与 $\max$ 无操作对象 |
| $f_r$ 支撑范围 | $1\leq j\leq L$ | build/sections/construction.tex:84 | 边界指标的分类讨论 | 端点峰的抵消判断出错 |
| $e_M*\delta$ 正峰 | 只在 $j=3$ 与 $L$、值 $4$ | build/sections/construction.tex:166 | 正部合计每列 $8$ 的全部来源 | 差 $32$ 的推导断链 |
| 负部上界分类 | 至多 $1-6+1=-4$ | build/sections/construction.tex:171 | 排除其余正部的那一步 | 正部合计被低估，差式不成立 |
| 中国剩余配对 | 配掉 $\min(v,w)$ 对 | build/sections/construction.tex:140 | $\max$ 公式的上界侧 | 两计数共同依赖的代数事实塌 |
| 模约化下界 | 模 $2$ 与模 $3$ 各给下界 | build/sections/construction.tex:140 | $\max$ 公式的下界侧 | 生成元数的合法下限悬空 |
| $b(M)$ | $8b(X)$ | build/sections/construction.tex:133 | 两计数的公共自由项 | 差 $32$ 的抵消结构不可见 |
| 实维对 | $M$ 为 $3332$，$C$ 为 $3330$ | build/sections/construction.tex:116 | §7 门槛与摘要维数句 | 门槛核验断，$h$ 存在性无保 |
| 中心总件数 | $7$ | build/sections/construction.tex:25 | 中心表的行数核对 | $f_r$ 计数函数的组合系数重算 |
| 逐次吹起独立性 | 未吹中心邻域不变 | build/sections/construction.tex:46 | 吹起公式可七次连用 | 分解式不能迭代，$b(X)$ 整体作废 |
| 同奇偶分置与合并之差 | 分置贡献 $2$、合并 $1$ | build/sections/introduction.tex:31 | §4 路线二的机制见证 | 两计数严格性的最小例消失 |
| $R_0$ 条款 | $F=Q$ 于界外且临界点受控 | build/sections/morse.tex:86 | 截断区域的定义域 | 端点对 $K_\pm$ 的交换无据 |
| 中心三维族 | $S_p\times\mathbb{C}\mathrm{P}^r$ 族形 | build/sections/construction.tex:29 | 中心表的三族形态 | $f_0$、$f_1$、$f_2$ 失去几何代号 |
| 前作承袭 | 混合素数与对合扰动框架 | build/sections/introduction.tex:107 | §4 路线一与 §12 的继承关系 | 改动中心的对象失去参照 |
| Bai--Xu 界形态 | 次数按最小陈数二倍模约化 | build/sections/introduction.tex:81 | 循环计数与该界的同一化 | 踩尖该界的辛几何含义悬空 |
| 目标不等式串 | $4\lambda(C)=\beta_{\mathbb{Z}}^{\mathrm{cyc}}(M)<\lambda(M)$ | build/sections/introduction.tex:123 | §5 逆向工程的全部蓝图 | 设计目标方程从流程里消失 |
| 卷积定义 | $(e*v)_j=\sum_t e_t v_{j-t}$ | build/sections/construction.tex:123 | §10 全节的符号契约 | 核的运算语义含糊，账本无法读 |
| $\delta$ 补零约定 | 支撑外恒为零 | build/sections/construction.tex:152 | 边界指标的分类核验 | 端点峰的对消检查失去依据 |
| $f_2$ 最高档 | $3$ | build/sections/construction.tex:93 | $q_j$ 中段值 $9$ 的构成 | 中段 $3$ 主重复度塌陷 |
| $\operatorname{rank}H_2(S_p)$ | $2$ | build/sections/geometry.tex:139 | $b(S_p)=8$ 的最后一格 | 中心自由秩 $8$、$16$、$24$ 连锁改 |
| $H_3(S_p;\mathbb{Z})$ | $\mathbb{Z}^2$ | build/sections/geometry.tex:47 | 奇数度自由列 | 奇偶双列的位移对齐断 |
| $\zeta_3-1$ 矩阵 | 二阶整矩阵 | build/sections/geometry.tex:124 | 史密斯标准形的输入 | $T_3=\mathbb{Z}/3$ 无从验算 |
| 度量平均与指数引理 | 把 $g$ 共轭到 $d_xg$ | build/sections/involution.tex:77 | 固定流形光滑性的来源 | 不动集不是子流形，分量计数断 |
| 辛正交式 | $\omega_x(u,v)=-\omega_x(u,v)$ | build/sections/involution.tex:90 | 两子块各自辛非退化 | 固定分量不再闭辛 |
| 法向极限式 | $-\exp(\epsilon A_x^-)-I\to -2I$ | build/sections/involution.tex:137 | 非退化第二块的invertibility | 不动点可能在法向退化 |
| 时间重参数 | $A(t)=\int_0^t a(u)\,du$ | build/sections/involution.tex:148 | 道路拼接的速度控制 | 时间一映射不再是复合形 |
| $Y$ 端点度同调 | $i=0$ 与 $4$ 处为 $\mathbb{Z}$ | build/sections/involution.tex:172 | 核 $(1,6,1)$ 的两端权重 | 卷积两端移位断，峰位重算 |
| 实现适用域 | 单连通且实维不小于 $6$ | build/sections/morse.tex:175 | $h$ 与 $\operatorname{SM}(M)$ 的入场券 | §11 拼装两大几何等式同断 |
| 假设击穿句 | 例外球排除渐近消没条件 | build/sections/introduction.tex:95 | 反例与 DRG 正面结果的接缝 | 反例看似违反已知定理，可信度断 |
| 正峰对负谷核验 | 每峰左右各贴一负项 | build/sections/construction.tex:151 | $C$ 侧压平的逐点论证 | 合并侧等式与踩尖同时动摇 |

台账补录申报一条：本表补录块内"约定吸收估计"一行的范数写法采用了成对的竖线形数学符号，属于台账格内成对裸竖线一类，共一对，按协议不做就地改字，留盘交由本体侧机械通道处理；本表其余各行均无同类形态，补录数据行未再抄写表头，全部行连续。

全文终账申报补记一段：纯英文术语残留族的计数在此收口。正文各节九处维持此前申报不动；台账首块与两块补录行内另有普通英文借词残留三处，分别落在描述空间环境的借词、指定度量口径的借词与可逆性名相的借词形态上；合并核点全文共十二处，该族字形一律不复写，留待本体侧机械通道处置，本节申报仅作类别计数。

其余类别收口复点：连词反转族一处，落在精确陈述小节取最大值的短语内；长停顿号族零处；装饰横线族零处；连续两个逗号族零处；聊天残留空格一处；台账格内成对裸竖线一类一处成对，已在上一段单独申报。首块落盘低于两万字节硬下限二百七十七字节，此缺口为永久留账，依协议不回滚、不重写、不重排，只在勘误小节挂号。

取证与收工口径备案：取证调用合计十五次，不含读本稿与取参数；首次落盘位于第十六次调用，落在十六至三十次许可窗口之内。数学定界符总量逾千且逐行成对，行尾回车零枚，全文单一换行符。台账表头全文仅出现一次，其后连续数据块一百一十七行，每行六枚竖线，格内无裸竖线无空格。本段之后不再改动任何已落盘文字。
