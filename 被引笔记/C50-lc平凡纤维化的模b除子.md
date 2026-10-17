# C50 lc平凡纤维化的模b除子（arXiv:math/0308143）

## 0 取证边界

登记对象：Florin Ambro，"The moduli b-divisor of an lc-trivial fibration"，arXiv:math/0308143，发表年月 2003-08-14。API 署名逐字 `Florin Ambro`，素材首行的地址块为 `DPMMS, CMS / University of Cambridge, Wilberforce Road, Cambridge CB3 0WB, UK`（`main.tex:8-10`），邮箱 `f.ambro@dpmms.cam.ac.uk`（`main.tex:11`）。摘要逐字（`main.tex:190-193`）：

> We study positivity properties of the moduli (b-)divisor associated to a relative log pair $(X,B)/Y$ with relatively trivial log canonical class.

素材类名 `amsart`，宏包 `amsthm,amsfonts,amssymb,amscd,euscript` 与 `xy[matrix,arrow]`（`main.tex:1-5`）；正文文件自称 `modbdiv.tex`，末次修改 2003-08-13（`main.tex:203-204`）。章节计数器 `\setcounter{section}{-1}`（`main.tex:201`），故编号从 `\section{Introduction}` 起算，子节编号形如 `\thesection-\Alph{subsection}`（`main.tex:18`），即"1-A、1-B"式；枚举项编号被重定义为罗马括号 `(\roman{enumi})`（`main.tex:15`）。学科分类（`main.tex:216`）Primary 14J10, 14N30，Secondary 14E30。

本语料中引用它的稿号与 bib key（本稿只在此原样登记，不据此反查这些稿）：D307（`AmbroModuli`）、D476（`AmbroCBF`）。

取证边界：唯一取材文件 `被引素材/math_0308143/main.tex`，实测 64189 字节 / 2027 行。全文分块通读十次（同一组行区间读满两轮），单轮行区间依次为 1-400、401-800、801-1200、1201-1600、1601-2000，覆盖正文与全部证明；2001-2027 为参考文献尾部与 `\end{document}`，未作正文取证引用。文中所有定位串均为实读行号，形如 `main.tex:387-398`；未读素材目录内的任何 `.pdf`，未执行任何版本管理命令，未生成排版产物。

记法换算（KaTeX 是唯一宏权威，素材宏一律按其定义展开，下表为本稿实际使用的换算）：

- 数域与字体阶梯：`\C,\Q,\Z,\N,\R,\G` → $\mathbb C,\mathbb Q,\mathbb Z,\mathbb N,\mathbb R,\mathbb G$（`main.tex:27-32`）。
- 花体：`\calO,\calA,\calC,\calE,\calF,\calG,\calI,\calK,\calL,\calM,\calR,\calHom,\calPic,\calPic` → $\mathcal O,\mathcal A,\mathcal C,\mathcal E,\mathcal F,\mathcal G,\mathcal I,\mathcal K,\mathcal L,\mathcal M,\mathcal{Hom},\mathcal{Pic}$（`main.tex:34-44`、`main.tex:102`、`main.tex:115`）。
- 粗体（b-除子专用）：`\bA,\bB,\bD,\bE,\bH,\bK,\bL,\bM,\bN,\bS,\ba,\bb` → $\mathbf A,\mathbf B,\mathbf D,\mathbf E,\mathbf H,\mathbf K,\mathbf L,\mathbf M,\mathbf N,\mathbf S,\mathbf a,\mathbf b$（`main.tex:49-63`）。
- 哥特体：`\fa,\fA,\fC,\fD,\fE,\fF,\fM,\fN,\fP,\fS,\fU,\fX` → $\mathfrak a,\mathfrak A,\mathfrak C,\mathfrak D,\mathfrak E,\mathfrak F,\mathfrak M,\mathfrak N,\mathfrak P,\mathfrak S,\mathfrak U,\mathfrak X$（`main.tex:67-78`）。
- 算子名：`\Alb,\Aut,\Bir,\codim,\CDiv,\Def,\Der,\Div,\Exc,\Ext,\cExt,\Fix,\Gal,\Hom,\im,\ind,\Isom,\Ker,\LCS,\lct,\Mov,\mult,\NEF,\Pic,\Proj,\rank,\Sing,\Spec,\Supp,\trace,\Var,\vol,\WDiv` 一律写作 `\operatorname{...}` 形式，即 $\operatorname{Alb},\operatorname{Aut},\operatorname{lct},\operatorname{NEF},\operatorname{mult},\operatorname{vol}$ 等（`main.tex:85-124`）。
- 其它：`\isoto` → $\overset{\sim}{\to}$（`main.tex:25`），`\hT` → $\widehat T$，`\hh` → $\hat h$，`\wG` → $\widetilde G$，`\ocG` → $\overline{\mathcal G}$（`main.tex:80-83`）。

定理环境的编号规则（`main.tex:131-139`）：`Theorem`、`Lemma`、`Corollary`、`Proposition`、`Criterion`、`Conjecture`、`Definition`、`Example` 等共享按节的计数器 `[section]`，`Main Theorem` 独立计数。因此下文中"命题 3.4""定理 2.1"这类编号是按素材计数器还原，指代同一对象。素材的 `\label`、`\ref`、`\cite` 键名一律不搬入本稿；引用文献在正文中以 `\cite{BP}`、`\cite{sba}`、`\cite{minit}` 等形式出现处，本稿改写为"（素材引 \[BP\]）"式说明并保留行号。

结构承诺：本稿共 8 个正文节（`## 1` 到 `## 8`），末节为接缝节；每节的公式级陈述、推导中间步与具体算例均以素材行号锚定。

## 1 引言的坐标：Kodaira 型分解、两条期望性质与主结果陈述

### 1.1 研究对象与逐字定义

素材开篇把对象定为 "lc-trivial fibrations $(X,B)/Y$"，并给出粗定义："roughly, relative log pairs with relatively trivial log canonical class $K+B$"（`main.tex:218-221`，出处指向素材所引 \[BP\]）。这里的"相对平凡"指 $K+B$ 在底空间方向上的数值/线性类消失，即纤维化 $f\colon X\to Y$ 满足 $K+B\sim_\mathbb{Q} 0/Y$；$B$ 是 $X$ 上的 $\mathbb{Q}$-边界（有效 $\mathbb{Q}$-Weil 除子，系数在 $[0,1]$ 区间），$(X,B)$ 是相对对（relative log pair）。素材紧接着给出这类纤维化的地位判断："These type of fibrations are expected to play a key role in inductive arguments in the (Log) Minimal Model Program"（`main.tex:221-223`）。这是本稿要反复回来的一点：所有后续结论都是"归纳论证的传送带"上的部件，故它们的力量不在于给出新几何，而在于把positivity 从纤维传到底。

### 1.2 分解式与两个名字的分工

给定 lc-trivial fibration $f\colon(X,B)\to Y$，存在典范的 Kodaira 型分解（`main.tex:225-229`）：

$$K+B\sim_\mathbb{Q} f^{*}\bigl(K_{Y}+B_{Y}+M_{Y}\bigr),$$

其中 $B_Y$ 与 $M_Y$ 是 $Y$ 上的 $\mathbb{Q}$-除子，名字分别为判别式（discriminant）与模子（moduli），归属 Kawamata（`main.tex:230-232`，素材引 \[Kaw97,sba\]）。两者的几何分工在 `main.tex:233-236` 逐字交代："The discriminant measures the singularities of the log pair $(X,B)$ over codimension one points of $Y$, whereas the moduli $\mathbb{Q}$-divisor is expected to define the rational map from $Y$ to the moduli space of the generic fibre."

拆开来读：判别式只看 $Y$ 的余维 1 点，即每个素除子 $D\subset Y$ 上的一个有理数，它由generic fibre 上方的奇点强度决定，因此是一个纯局部量；模子则是全局量，它记录族的变化，理论上应当把 $Y$ 双有理地映到一般纤维的模空间。分解式左右两侧的差落在 $f$ 的垂直部分，故 $B_Y+M_Y$ 作为 $\mathbb{Q}$-除子类由 $(X,B)/Y$ 唯一确定，但拆开成 $B_Y$ 与 $M_Y$ 两部分需要一个规范化约定（素材在 §2 用 valuation 语言给出该约定：$B_Y$ 取"最坏"系数、剩余部分归 $M_Y$）。这解释了标题里的 b-除子：$M_Y$ 必须在所有足够高分母上同时给定，才能谈正性。

### 1.3 两条期望性质：伴随反演与（有效）半正性

素材引 \[BP\] 列出两条"对应用来说想要的"性质（`main.tex:237-239`）："Inversion of Adjunction and (Effective) Semi-ampleness."

第一条的状态（`main.tex:240-244`）：Inversion of Adjunction 已在 \[BP\] 中确立，它与 Shokurov 的 BP 猜想等价（素材引 \[Shokurov03\]），内容是"若 $Y$ 在其双有理类中足够高，则 $(X,B)$ 与 $(Y,B_Y)$ 有同类型的奇点"。于是奇点方向的问题已经关账。

第二条的状态（`main.tex:244-250`）：已知的是 $M_Y$ 在足够高模型上 nef（Kawamata，素材引 \[sba\]）；猜想是 $|kM_Y|$ 在 $k$ 充分大且可整除、$Y$ 充分高时无基点。素材用 "Semi-ampleness predicts that in fact the linear system $|kM_Y|$ is free of base points"（`main.tex:247-250`）。nef 与半正之间的差距正是本稿的全部工作面：nef 是交集数不等式，半正要求存在实际截影。素材选择的路径是先把"nef $\mathbb{Q}$-线丛"替换成 b-复形上的正性（上曲率半正、周期映射、行列丛的自交积分），再在附加假设下把正性兑换成线性等价于pullback 的形如 $h^*A$ 的除子。

### 1.4 主结果的两条陈述

`main.tex:252-260` 给出两条"对模子半正性的部分回答"：

(a) 若 $M_Y$ 在足够高的模型上都数值平凡，则 $M_Y$ 是挠 $\mathbb{Q}$-除子（`main.tex:254-255`，对应素材定理 \[torsion\]）。这条的强度在"数值平凡 $\Rightarrow$ 线性平凡（有限阶）"：它把一个双有理不变量的数值零信息兑换成有限覆盖上的平凡化。

(b) 若 $B$ 的水平部分有效且 $Y$ 足够高，则存在收缩 $h\colon Y\to Z$ 到射影簇 $Z$ 以及 $Z$ 上 nef and big $\mathbb{Q}$-除子 $A$，使得 $M_Y\sim_\mathbb{Q} h^{*}A$（`main.tex:256-260`，对应素材定理 \[klglobal\]）。这条是"半正性的近似解"：$M_Y$ 未必半正，但它在某个收缩下来自 $Z$ 上的 nef and big 类，故 $|kM_Y|$ 的基点只在 $h$ 的例外纤维处出现。

水平部分有效的假设不可省：判别式与模子的分离在 $B$ 有水平分量时才会产生负系数风险，素材后续用该假设覆盖周期映射的奇点集。

### 1.5 三条推论级应用

应用一是定理 \[ak\]（`main.tex:267-286`）：设 $(X,B)$ 是带 Kawamata 对数典范奇点的射影对数簇且 $K+B\equiv 0$，则

$$\text{(1) }\exists\, b\in\mathbb{Z}_{>0},\ b(K+B)\sim 0;\qquad \text{(2) }X\to\operatorname{Alb}(X)\ \text{满且连通纤维，并可étale 覆盖平凡化。}$$

第 (2) 条的逐字内容（`main.tex:274-285`）：存在 étale 覆盖 $A'\to\operatorname{Alb}(X)$、射影对数簇 $(F,B_F)$ 与同构

$$(X,B)\times_{\operatorname{Alb}(X)}A'\ \overset{\sim}{\longrightarrow}\ (F,B_F)\times A',$$

且该同构与到 $A'$ 的投影相容（素材此处是一张 `xymatrix` 交换图，`main.tex:280-284`）。这是 Abundance 与 Ueno 的 K-猜想情形（$K+B\equiv 0$ 的最小模型）的对数版本，素材说明它是 Kawamata 结果（引 \[minit\]）的 logarithmic version（`main.tex:262-265`）。

应用二是把 Abundance 猜想约化的陈述（`main.tex:287-292`）：由定理 \[klglobal\] 与 \[ak\].(1)，可把素材前作 \[NM\] 的主结果推广为"在低维的对数极小模型纲领与对数 abundance 假设下，Abundance 猜想归约到最大 nef 维数的对数极小模型情形"（对应素材定理 \[ab\]）。

应用三是 Nakayama（以及 Fujita）结果的推广（`main.tex:293-311`，素材引 \[Nakayama\]、\[fuj3\]）：设 $(X,B)$ 为 klt 射影对数簇，$f\colon X\to Y$ 是到 proper 正规簇的收缩，$\omega$ 是 $Y$ 上 $\mathbb{Q}$-Cartier 除子且

$$K+B\sim_\mathbb{Q} f^{*}\omega,$$

则存在 $\mathbb{Q}$-Weil 除子 $B_Y$ 使 $(Y,B_Y)$ 为带 klt 奇点的对数簇且 $\omega\sim_\mathbb{Q} K_Y+B_Y$（`main.tex:308-310`）。它给出的不只是分解，还断言"任意满足 $K+B\sim_\mathbb{Q} f^*\omega$ 的 $\omega$ 都能写成底空间的典范加边界形式"，即模子部分可以被吸收进边界。

### 1.6 技术谱系与特例校验

`main.tex:312-320` 交代方法来源：Fujita（引 \[fujita,fuj2\]）、Viehweg（引 \[wp,wpII\]）与 Kawamata（引 \[koddim,minit\]）。并给出一个可用的校验点：当一般纤维 $X_\eta$ 只有典范奇点且 $B_\eta=0$ 时，定理 \[klglobal\] 可由 \[minit\] 的 Theorem 1.1 直接导出（`main.tex:315-318`，素材另引 Fujino-Mori 的 \[fm,osamu\] 与 \[NM\]）。素材的自我评价是 "we simply extend their methods to deal with the case of varieties with boundary"（`main.tex:319-320`）：全部新工作是把边界 $B$ 带来的奇点与特征标分解处理干净。

致谢（`main.tex:322-326`）提到 Corti、Shepherd-Barron、Shokurov 的讨论，经费来自欧盟 Marie Curie  fellowship。

### 1.7 约定与基域

`main.tex:336-343`：记号与术语沿用 \[BP\]；因使用超越方法，基域取复数域 $k=\mathbb C$；主结果通过 Lefschetz 原理推广到特征零代数闭域。这一句决定了后文一切 Hodge 理论工具（半正曲率、Schmid 扩张定理、周期映射）的可用性。`main.tex:345-348` 声明第 1 节收集 Kawamata（引 \[koddim,minit\]）、Kollár（引 \[big\]）与 Viehweg（引 \[wp,wpII\]）的已有结果并做小改，这些"小改"正是本稿后续各节的技术实体。

## 2 预备件 I：等变消解、对数切丛的推前与一条 Ext 正合序列

### 2.1 Hironaka 等变消解的四条性质

素材第 1-A 小节（`main.tex:353` 标题 "Equivariant resolutions"）先固定环境：$X$ 是复解析空间且 countable at infinity，$Z\supset\operatorname{Sing}(X)$ 是闭复子空间。Hironaka（素材引 \[Hir77\]）给出 proper 态射 $\mu\colon X'\to X$ 满足四条（`main.tex:363-383`）：

1. $X'$ 光滑，且 $\mu$ 诱导同构 $X'\setminus\mu^{-1}(Z)\ \overset{\sim}{\to}\ X\setminus Z$（`main.tex:364-365`）。
2. $\mu^{-1}(Z)$ 是正规交叉支集的除子（`main.tex:366-367`）。
3. 若 $U,V\subset X$ 开、$\alpha\colon U\to V$ 是同构且 $\alpha(Z|_U)=Z|_V$，则存在唯一同构 $\alpha'$ 使 square 交换（`main.tex:368-377`，素材用 `xymatrix` 写为 $\mu^{-1}(U)\xrightarrow{\alpha'}\mu^{-1}(V)$ 与下方 $U\xrightarrow{\alpha}V$）。
4. 记 $\mathcal P$ 为所有满足 (3) 的局部同构构成的 pseudo-group，则 $\mu$ 是可分解为一串闭光滑中心吹上的复合，且每个中心在 $\mathcal P$ 的自然提升下不变（`main.tex:378-382`）。

满足这四条的 $\mu$ 被称为 "an equivariant resolution of $X$ with respect to $Z$"（`main.tex:384-385`）。第 3、4 条是关键：它们给出**局部同构在消解上的典范提升**，因此任何只依赖奇轨迹与给定除子 support 的构造都不会被消解过程破坏。素材在 §1 的末尾与 §3 的覆盖技巧里两次调用这一不变性。

### 2.2 引理 \[eqvlem\] 与对数切丛/对数余切丛的对偶

引理陈述（`main.tex:387-398`）：设 $X$ 正规簇，$R$ 为约化 Weil 除子（可为零），$X\to S$ 为态射，$\mu\colon X'\to X$ 是关于 $\operatorname{Sing}(X)\cup R$ 的等变消解，$E$ 是 $X'$ 上的正规交叉除子且 $R\subseteq\mu_{*}E$，则

$$\mu_{*}T_{X'/S}\langle -E\rangle=\bigl(\mu_{*}\Omega^{1}_{X'/S}\langle E\rangle\bigr)^{\vee}\subseteq T_{X/S}.$$

这里 $\Omega^1_{X'/S}\langle E\rangle$ 是沿 $E$ 允许对数极余的 1-形式层，$T_{X'/S}\langle-E\rangle$ 是沿 $E$ 各分量切向的相对向量场层；两者在 $X'\setminus E$ 上互为对偶，等式说的是这个对偶在推前后仍然成立。

证明的骨架（`main.tex:400-437`）分三步，值得完整记录，因为它是全文唯一把"消解"与"向量场"焊接起来的地方。

第一步（`main.tex:401-406`）：由 $\mu$ birational 得两个包含

$$\mu_{*}T_{X'/S}\langle -E\rangle\subseteq\bigl(\mu_{*}\Omega^{1}_{X'/S}\langle E\rangle\bigr)^{\vee}\subseteq T_{X/S}.$$

于是只需证明反向包含。

第二步（`main.tex:407-424`）：取 $x\in X$ 与解析邻域 $U$ 上的向量场 $\mathfrak a\in H^0(U,(\mu_*\Omega^1_{X'/S}\langle E\rangle)^\vee)\subset H^0(U,T_{X/S})$。引用 \[GK64\] 得到全纯单参数族

$$\Phi\colon\{s\in\mathbb C:\lvert s\rvert<\epsilon\}\times U'\to U,$$

满足三条公理（`main.tex:418-423`）：(a) $\Phi(s_{1},\Phi(s_{2},x))=\Phi(s_{1}+s_{2},x)$（在 $|s_1|,|s_2|,|s_1+s_2|<\epsilon$ 范围）；(b) $\Phi(0,x)=x$；(c) $\mathfrak a_{x}(df)=\frac{d}{ds}f(\Phi(s,x))|_{s=0}$，对 $x\in U'$ 与 $f\in\mathcal O_{X,x}$。这三条正是"局部流与向量场等价"的解析版本，作用是把抽象的对偶元素变成可追踪的微分同胚。

第三步（`main.tex:425-436`）：$\Phi_s$ 保持 $X$ 的奇轨迹；又因 $\mu$ birational 且 $R\subseteq\mu_*E$，$\Phi_s$ 在 $X$ 的大开集上保持 $R$。于是每个 $\Phi_s$ 保持 $\operatorname{Sing}(X)\cup R$，由等变性（性质 3）提升为 $\pi^{-1}(x)$ 邻域上的单参数族。对应向量场 $\tilde{\mathfrak a}$ 切于 $\mu$ 的例外轨迹与 $E$ 的各分量，故 $\tilde{\mathfrak a}$ 是 $T_{X'/S}\langle-E\rangle$ 的截面并提升 $\mathfrak a$，得 $\mathfrak a\in\mu_*T_{X'/S}\langle-E\rangle$。

读法提示：等式 $\mu_*T_{X'/S}\langle-E\rangle=(\mu_*\Omega^1_{X'/S}\langle E\rangle)^\vee$ 的用处在于把"是否存在足够多的水平向量场"翻译成"对数 1-形式的推前是否饱和"。在 §4 中，Kodaira-Spencer 类取值在 $\operatorname{Ext}^1_{Y_s}(\Omega^1_{Y_s}\langle E_s\rangle,\cdot)$，素材需要 $\mu_*\Omega^1$ 与 $\Omega^1_{X/S}$ 之间的对偶控制来比较光滑纤维化与奇异纤维化的变形方向，这就是引理 \[eqvlem\] 的位置。素材在 `main.tex:688-689` 明确声明：所需消解"由引理 \[eqvlem\] 存在"，即要求 $E$ 有 snc 支集且 $\mu_*T_Y\langle-E\rangle$ 自反。

### 2.3 引理 3.3：两个谱序列拼出的五项正合序列

引理陈述（`main.tex:439-447`）：设 $\mu\colon Y\to X$ birational，$B$ 是 $X$ 上的层，$A$ 是 $Y$ 上的无挠层，则存在正合序列

$$0\to\operatorname{Ext}^{1}_{X}(B,\mu_{*}A)\to\operatorname{Ext}^{1}_{Y}(\mu^{*}B,A)\to\operatorname{Hom}_{X}(B,R^{1}\mu_{*}A).$$

证明（`main.tex:449-477`）是标准的"两条路到达同一个 $\operatorname{Ext}$"论证，中间步完整给出：

定义 $\operatorname{Hom}_\mu(B,A)=\operatorname{Hom}_Y(\mu^*B,A)=\operatorname{Hom}_X(B,\mu_*A)$（伴随同构），则有两组谱序列（出处 \[Ran89\]，`main.tex:450-459`）：

$$E_2^{p,q}=\operatorname{Ext}^{p}_{X}(B,R^{q}\mu_{*}A)\Longrightarrow\operatorname{Ext}^{p+q}_{\mu}(B,A),$$

$${}^{\prime}E_2^{p,q}=\operatorname{Ext}^{p}_{Y}(L_{q}\mu^{*}B,A)\Longrightarrow\operatorname{Ext}^{p+q}_{\mu}(B,A),$$

其中 $L_q\mu^*$ 是 $\mu^*$ 的第 $q$ 个导出函子（$\mu^*$ 右正合但不左正合）。第一个谱序列的边缘同态给出五项正合序列（记 $H^i=\operatorname{Ext}^i_\mu(B,A)$，`main.tex:460-467`）：

$$0\to\operatorname{Ext}^{1}_{X}(B,\mu_{*}A)\to H^{1}\to\operatorname{Hom}_{X}(B,R^{1}\mu_{*}A)\to\operatorname{Ext}^{2}_{X}(B,\mu_{*}A)\to H^{2}.$$

第二个谱序列一侧：$\mu$ birational 蕴含 $L_{1}\mu^{*}B$ 是 $Y$ 上的挠层（`main.tex:468-469`）；$A$ 无挠，故

$${}^{\prime}E_2^{0,1}=\operatorname{Hom}_{Y}(L_{1}\mu^{*}B,A)=0,$$

于是 ${}'E_2^{p,q}$ 的 $p+q=1$ 一列只剩 ${}'E_2^{1,0}=\operatorname{Ext}^1_Y(\mu^*B,A)$， filtration 退化，第二个谱序列诱导同构 $\operatorname{Ext}^{1}_{Y}(\mu^{*}B,A)\ \overset{\sim}{\to}\ H^{1}$（`main.tex:472-476`）。把它代回五项正合序列即得结论。

这个引理在全文只出现两次但都是承重点（`main.tex:791-792`，以及后面 §4 的同族用法）：它把"$Y$ 上的扩张类"与"$X$ 上的扩张类加上一段 $R^1\mu_*$ 信息"挂钩，从而允许把 $\operatorname{Ext}^1(\Omega^1\langle E\rangle,\mathcal O)$ 型空间在消解与基座之间搬移，且只需检验一个 $\operatorname{Hom}$ 项。Kawamata-Viehweg 消没负责 $R^i\mu_*$ 的消失，$\mu_*$-零性负责另一侧，这正是下一节证明 (2) 的三件套。

## 3 预备件 II：覆盖技巧、本征层分解与 Griffiths 半正性

### 3.1 覆盖技巧的数据表

第 1-B 小节标题 "The covering trick"（`main.tex:482`）。数据（`main.tex:487-502`）如下：$f\colon X\to S$ 是非奇异簇之间的光滑射影态射；$T$ 是 $X$ 上的 $\mathbb{Q}$-除子，满足 $T\sim_\mathbb{Q} 0$ 且 $T$ 的小数部分关于 $f$ 有正规交叉支集；取有理函数 $\varphi$ 使 $(\varphi)+mT=0$，其中 $m$ 是使该式成立的最小正整数；$\pi\colon\tilde X\to X$ 是 $X$ 在扩张 $k(X)(\sqrt[m]{\varphi})$ 中的正规化；$\nu\colon V\to\tilde X$ 是关于 $\tilde X$ 奇轨迹的等变消解。两条假设：$h\colon V\to S$ 光滑，且 $R^{2}h_{*}\mathbb Z_{V}$ 有全局截面在 $h$ 的每个纤维上给出极化（`main.tex:499-502`）。三层链条（`main.tex:503-507` 的图）：

$$V\xrightarrow{\ \nu\ }\tilde X\xrightarrow{\ \pi\ }X\xrightarrow{\ f\ }S,\qquad h=f\circ\pi\circ\nu .$$

### 3.2 本征层分解与 $\mathcal F^{(i)}$

循环覆盖的 Galois 群 $G\simeq\mathbb Z/m\mathbb Z$ 作用在 $h_*K_{V/S}$ 上，按特征标分解（`main.tex:508-513`）：

$$h_{*}K_{V/S}=\tilde{f}_{*}K_{\tilde{X}/S}=\bigoplus_{i=0}^{m-1}f_{*}\mathcal{O}_{X}\bigl(\lceil K_{X/S}+iT\rceil\bigr).$$

这一步的机理：$\tilde X$ 的函数域由 $\sqrt[m]{\varphi}$ 添加得到，$G$ 的特征标把 $\pi_*\mathcal O_{\tilde X}$ 拆成 $\bigoplus_i\mathcal O_X(\lfloor iT\rfloor)$ 型直和分量；再与相对典范层相乘并取整上界 $\lceil\cdot\rceil$，即得上式。素材把它当作已知事实直接写下，因为它在 Viehweg 与 Kawamata 的原文中已有。

由此得到 $S$ 上的局部自由层（`main.tex:514-517`）：

$$\mathcal{F}^{(i)}:=f_{*}\mathcal{O}_{X}\bigl(\lceil K_{X/S}+iT\rceil\bigr).$$

极化假设的作用是让变化of Hodge 结构 $(R^{d}h_{*}\mathbb C_{V})_{\mathrm{prim}}\otimes\mathcal O_{S}$ 有意义，从而"每个 $\mathcal F^{(i)}$ 上都诱导半正 Hermitian 度量"（`main.tex:518-521`）。

两个关键映射的定义（`main.tex:522-536`）：

$$\sigma^{i}_{s}\colon T_{S,s}\to\operatorname{Hom}\bigl(H^{0}(X_{s},\mathcal{F}^{(i)}_{s}),\operatorname{Ext}^{1}_{X_{s}}(\Omega^{1}_{X_{s}}\langle E_{s}\rangle,\mathcal{F}^{(i)}_{s})\bigr),$$

$$\kappa_{s}\colon T_{S,s}\to\operatorname{Ext}^{1}_{X_{s}}(\Omega^{1}_{X_{s}}\langle E_{s}\rangle,\mathcal{O}_{X_{s}}),$$

其中 $\sigma^i_s$ 由与 $\kappa_s$ 的杯积诱导，$E$ 是 $T$ 的小数部分的支集（`main.tex:535-536`）。注意 $\kappa_s$ 的取值在带对数极的 $\operatorname{Ext}^1$ 中：这是"带边界的 Kodaira-Spencer 类"，即形变方向只允许沿 $E$ 打开。

### 3.3 命题 \[cc\]：四条正性陈述

命题（`main.tex:538-588`）逐条列出，公式级完整登记：

(1) 把 $\mathcal F^{(i)}$ 视为平坦向量丛 $(R^{d}h_{*}\mathbb C_{V})_{\mathrm{prim}}\otimes\mathcal O_{S}$ 的子丛，则 $\mathcal F^{(i)}$ 与 $h_{*}\omega_{V/S}$ 的第二基本形式分别由 $\sigma^{i}$ 与 $\oplus_{i=0}^{m-1}\sigma^{i}$ 表示（`main.tex:541-546`）。

(2) Hermitian 向量丛 $\mathcal F^{(i)}$ 是 Griffiths 半正定的，曲率为

$$\Theta_{i}=-(\sigma^{i})^{*}\!\wedge\,\sigma^{i},$$

其中 $(\sigma^{i})^{*}(v)$ 是 $\sigma^{i}(\bar v)$ 关于诱导 Hodge 度量的伴随（`main.tex:548-555`）。$\det(\mathcal F^{(i)})$ 的曲率 $\operatorname{trace}(\Theta_{i})$ 半正，且 $\operatorname{Ker}(\sigma^{i}_{s})\subset T_{S,s}$ 恰是 $\operatorname{trace}(\Theta_{i})$ 在 $s$ 处不正定的切方向集合（`main.tex:555-565`）。

(3) 映射组 $\sigma_{V_s},\sigma_{\tilde X_s},\oplus_{i=0}^{m-1}\sigma^{i}_{s}$ 之间分别同核；$\kappa_{V_s},\kappa_{\tilde X_s},\kappa_{s}$ 之间分别同核（`main.tex:567-571`）。

(4) 设 $S\subset\bar S$ 为光滑紧化，$\bar S\setminus S$ 是单纯正规交叉除子，且 $R^{d}h_{*}\mathbb C_{V}$ 沿 $\bar S\setminus S$ 的局部单值表示均为幂单，则对 $\mathcal F^{(i)}$ 的 Schmid 扩展 $\bar{\mathcal F}^{(i)}$，$\det(\bar{\mathcal F}^{(i)})$ 是 $\bar S$ 上的 nef 可逆层，且

$$\det(\bar{\mathcal F}^{(i)})^{\dim S}=\int_{S}\Bigl(\tfrac{\sqrt{-1}}{2\pi}\operatorname{trace}(\Theta_{i})\Bigr)^{\dim S}.$$

这一条把解析的曲率积分与代数的自交数画上等号，是全文"nef 之外还能给出正数值"的唯一来源。

### 3.4 证明的中间步

(1) 的证明（`main.tex:590-636`）：收缩 $S$ 使每个 $V_s\to\tilde X_s$ 都是消解。$\tilde X_s$ 有理性奇点（出处 \[Steenbrink77\]），故有 Hodge 结构的包含 $H^{d}(\tilde X_{s},\mathbb C)\subset H^{d}(V_{s},\mathbb C)$ 与 $H^{d,0}(\tilde X_{s})=H^{d,0}(V_{s})$（`main.tex:592-595`）。由此得交换图（`main.tex:598-606`），中间一行是变形函子的吹缩切映射（素材引 \[minit\]）：

$$T_{S,s}\to H^{1}(V_{s},T_{V_{s}})\to\operatorname{Hom}(H^{d,0}(V_{s}),H^{d-1,1}(V_{s}))$$

与

$$T_{S,s}\to H^{1}(\tilde{X}_{s},T_{\tilde{X}_{s}})\to\operatorname{Hom}(H^{d,0}(\tilde{X}_{s}),H^{d-1,1}(\tilde{X}_{s})).$$

再按 Viehweg（素材引 \[wpII\]）的等同

$$H^{1}(X_{s},T_{X_{s}}\langle -E_{s}\rangle)=H^{1}(\tilde{X}_{s},T_{\tilde{X}_{s}})^{G},$$

得第二张交换图 $T_{S,s}\to H^1(\tilde X_s,T_{\tilde X_s})$ 与 $T_{S,s}\to H^1(X_s,T_{X_s}\langle-E_s\rangle)$（`main.tex:615-620`）。结论：与 Kodaira-Spencer 类的杯积保持本征空间，故无穷小周期映射

$$\sigma_{V_{s}}\colon T_{S,s}\to\operatorname{Hom}(H^{d,0}(V_{s}),H^{d-1,1}(V_{s}))$$

分解为 $\sigma_{V_{s}}=\oplus_{i=0}^{m-1}\sigma^{i}_{s}$（`main.tex:621-630`）。由于 $\sigma_{V_s}$ 就是 Gauss-Manin 联络在 $(R^{d}h_{*}\mathbb C_{V})_{\mathrm{prim}}\otimes\mathcal O_{S}$ 上的作用，各 $\sigma^i_s$ 即各 $\mathcal F^{(i)}$ 的第二基本形式（`main.tex:631-635`）。

(2) 未单独证明：它是 (1) 与 Griffiths 对平坦丛子丛曲率的标准符号计算，$\Theta_i=-(\sigma^i)^*\wedge\sigma^i$ 的负号来自 "$A''$ 型第二基本形式给出半正曲率"的约定。素材只在 (2) 里补了一条解析几何含义：$\operatorname{Ker}(\sigma^i_s)$ 与曲率退化方向等同（`main.tex:561-565`），这是后面 §4 判断"周期映射的纤维方向"的根据。

(3) 的证明（`main.tex:637-663`）：先把六个映射成对列出（素材用两组 `gather*`）：

$$\sigma_{V_{s}},\quad\sigma_{\tilde{X}_{s}},\quad\sigma^{i}_{s},\qquad\kappa_{V_{s}},\quad\kappa_{\tilde{X}_{s}},\quad\kappa_{s},$$

其中 $\kappa_s$ 取值在 $H^{1}(X_{s},T_{X_{s}}\langle -E_{s}\rangle)$（`main.tex:648-655`）。(1) 的证明已给出 $\sigma_{V_s},\sigma_{\tilde X_s},\oplus_i\sigma^i_s$ 同核以及 $\kappa_{\tilde X_s},\kappa_s$ 同核；剩下 $\kappa_{V_s}$ 与 $\kappa_{\tilde X_s}$ 的同核由 \[minit\] 的 Lemma 6.2 给出，条件是 $\nu$ 等变（`main.tex:661-663`）。这解释了为什么素材坚持用"等变消解"：一般的消解会在这一步失败。

(4) 的证明（`main.tex:665`）压成一句："This follows from \[koddim\] and \[big\]."，即 Kawamata 的 \[koddim\] 与 Kollár 的 \[big\]：前者提供幂单单值条件下的扩展与 nef 性，后者提供曲率积分与自交数的等式。素材没有重做证明，读者要用的话需要回到那两篇；本稿后续只调用 (4) 的结论形式。

## 4 周期映射：固定设置、命题 \[ky\] 的同核陈述与定理 \[kl\] 的局部平凡化

### 4.1 第 2 节的四条数据

`\section{The period map}`（`main.tex:672`）开头固定四条数据（`main.tex:677-694`），这是全文最常被引用的设置，逐条登记：

- $(X,B)$ 是有 Kawamata 对数典范奇点的对数簇，且 $K+B\sim_\mathbb{Q} 0$（`main.tex:680-681`）。
- $f\colon X\to S$ 是到光滑代数簇 $S$ 的射影收缩（`main.tex:682-683`）。
- $\mu\colon Y\to X$ 是奇点消解，$K_{Y}+B_{Y}=\mu^{*}(K+B)$ 是对数拉回，$E$ 是 $B_{Y}$ 小数部分的支集；假设 $E$ 有单纯正规交叉支集且 $\mu_{*}T_{Y}\langle -E\rangle$ 自反，素材注明"这样的消解由引理 \[eqvlem\] 保证存在"（`main.tex:684-689`）。
- 族 $(Y,E)\to S$ 在 $S$ 的开子集上相对单纯正规交叉，$\kappa_{s}\colon T_{S,s}\to H^{1}(Y_{s},T_{Y_{s}}\langle -E_{s}\rangle)$ 是诱导的 Kodaira-Spencer 类（`main.tex:690-693`）。

`main.tex:696-699` 声明素材只看 $k(S)$ 上诱导的对数簇 $(X_{\eta},B_{\eta})$，因此后文"不另行通知地"把 $S$ 缩到 Zariski 开子集。这一习惯要求读者把 $S$ 上的所有结论理解为"在某个非空开集上成立"，模子 b-除子的双有理不变性正是靠这个自由度实现的。

### 4.2 命题 \[ky\] 的构造与结论

构造（`main.tex:701-733`）：设 $b$ 是使 $b(K+B)\sim_\mathbb{Q} 0$ 在 $S$ 的一般点成立的最小正整数，取有理函数 $\varphi$ 使 $b(K+B)=(\varphi)$。$\pi\colon\tilde Y\to Y$ 是 $Y$ 在 $k(Y)(\sqrt[b]{\varphi})$ 中的正规化，$\nu\colon V\to\tilde Y$ 是等变消解，得三层链条（`main.tex:709-714` 的图）：

$$(Y,B_Y)\xleftarrow{\ \pi\ }\tilde Y\xleftarrow{\ \nu\ }V,\qquad (Y,B_Y)\xrightarrow{\ \mu\ }(X,B)\xrightarrow{\ f\ }S,\qquad h=f\circ\mu\circ\pi\circ\nu .$$

记 $\kappa_{V_s}$ 为 $V\to S$ 的 Kodaira-Spencer 类，并定义两个映射（`main.tex:717-726`）：

$$\sigma_{V_{s}}\colon T_{S,s}\to\operatorname{Hom}(H^{d,0}(V_{s}),H^{d-1,1}(V_{s})),$$

$$\sigma^{1}_{s}\colon T_{S,s}\to\operatorname{Hom}\bigl(H^{0}(Y_{s},\lceil -B_{Y_{s}}\rceil),\operatorname{Ext}^{1}_{Y_{s}}(\Omega^{1}_{Y_{s}}\langle E_{s}\rangle,\mathcal{O}_{Y_{s}}(\lceil -B_{Y_{s}}\rceil))\bigr),$$

它们分别由与 $\kappa_{V_s}$、$\kappa_s$ 的杯积诱导，$d=\dim(X/S)$。收缩 $h$ 在 $S$ 的开子集 $S^{0}$ 上光滑，$\Phi$ 是与变差 $(R^{d}h_{*}\mathbb C_{V})_{\mathrm{prim}}\otimes\mathcal O_{S^{0}}$ 相伴的周期映射（`main.tex:729-733`）。

结论（`main.tex:735-740`）：映射 $\kappa_{s},\sigma^{1}_{s},\kappa_{V_{s}},\sigma_{V_{s}}$ 对一般 $s\in S$ 有相同的核，且该核等于

$$T_{\Phi^{-1}(\Phi(s)),s}\subset T_{S,s}.$$

这条等式是全文的中枢：它说"模子的曲率退化方向"恰好是"周期映射的纤维切方向"，于是把 $M_Y$ 的正性约化为周期映射的双有理几何。

### 4.3 命题 \[ky\] 证明的四步

第 (1) 步（`main.tex:744-761`）：一般纤维 $(X_s,B_{X_s})$ 是 klt，故有同构

$$\mathcal{O}_{X_{s}}\ \overset{\sim}{\longrightarrow}\ \mu_{s*}\mathcal{O}_{Y_{s}}(\lceil -B_{Y_{s}}\rceil).$$

于是包含 $\mathcal O_{Y_s}\to\mathcal O_{Y_s}(\lceil-B_{Y_s}\rceil)$ 在全截面上是同构，把 $\sigma^1_s$ 等同于复合

$$T_{S,s}\to\operatorname{Ext}^{1}_{Y_{s}}(\Omega^{1}_{Y_{s}}\langle E_{s}\rangle,\mathcal{O}_{Y_{s}})\ \overset{\lambda}{\to}\ \operatorname{Ext}^{1}_{Y_{s}}(\Omega^{1}_{Y_{s}}\langle E_{s}\rangle,\mathcal{O}_{Y_{s}}(\lceil -B_{Y_{s}}\rceil)).$$

第 (2) 步（`main.tex:763-794`）给出 $\lambda$ 的核的控制：

$$\operatorname{Ker}(\lambda)\subseteq\operatorname{Ker}\bigl(\operatorname{Ext}^{1}_{Y_{s}}(\Omega^{1}_{Y_{s}}\langle E_{s}\rangle,\mathcal{O}_{Y_{s}})\to\operatorname{Ext}^{1}_{X_{s}}(\mu_{s*}\Omega^{1}_{Y_{s}}\langle E_{s}\rangle,\mathcal{O}_{X_{s}})\bigr).$$

理由是 $\mathcal{O}_{Y_s}(\lceil-B_{Y_s}\rceil)$ 由 Kawamata-Viehweg 消没对 $\mu_{s*}$ 零，$X_s$ 理性奇点使 $\mathcal O_{Y_s}$ 也对 $\mu_{s*}$ 零；自然同态 $\mu_s^*\mu_{s*}\Omega^1_{Y_s}\langle E_s\rangle\to\Omega^1_{Y_s}\langle E_s\rangle$ 诱导 $3\times2$ 交换图（`main.tex:775-789`），底部竖直箭头由引理 3.3 是同构，底部水平箭头由 $\mathcal{O}_{X_s}=\mu_{s*}\mathcal{O}_{Y_s}(\lceil-B_{Y_s}\rceil)$ 是同构。

第 (3) 步（`main.tex:796-875`）建立 $\operatorname{Ker}(\kappa_s)=\operatorname{Ker}(\sigma^1_s)\subseteq\operatorname{Ker}(\kappa_{X_s})$，$E$ 例外时第一个包含取等。$\operatorname{Ker}(\kappa_s)\subseteq\operatorname{Ker}(\sigma^1_s)$ 显然（`main.tex:802-803`）。反向取 $t\in\operatorname{Ker}(\sigma^1_s)$，它诱导 $(Y_s,E_s)$ 的一阶无穷小变形，变形的立方式图在 `main.tex:810-816`（$(\bar Y_s,\bar E_s)\to(Y,E)$、$\bar X_s\to X$、$\operatorname{Spec} k[\epsilon]\to S$）。类 $\kappa_s(t)$ 由短正合列表示（`main.tex:817-824`）：

$$0\to\mathcal{O}_{Y_{s}}\to\Omega^{1}_{\bar{Y}_{s}}\langle\bar{E}_{s}\rangle\otimes\mathcal{O}_{Y_{s}}\to\Omega^{1}_{Y_{s}}\langle E_{s}\rangle\to 0.$$

由第 (2) 步，推前后的列（`main.tex:826-830`）

$$0\to\mathcal{O}_{X_{s}}\to\mu_{s*}\bigl(\Omega^{1}_{\bar{Y}_{s}}\langle\bar{E}_{s}\rangle\otimes\mathcal{O}_{Y_{s}}\bigr)\to\mu_{s*}\Omega^{1}_{Y_{s}}\langle E_{s}\rangle\to 0$$

存在分裂 $u\in\operatorname{Hom}_{X_s}(\mu_{s*}(\Omega^1_{\bar Y_s}\langle\bar E_s\rangle\otimes\mathcal O_{Y_s}),\mathcal O_{X_s})$，于是要把 $u$ 提升到 $Y_s$。按 \[minit\] Lemma 6.1 可设图（`main.tex:842-851`）中水平箭头单、竖直箭头满，涉及四个 $\mathcal Hom$：$\mathcal{Hom}_{\mathcal O_{X_s}}(\mu_{s*}(\Omega^1_{\bar Y_s}\langle\bar E_s\rangle\otimes\mathcal O_{Y_s}),\mathcal O_{X_s})$、$\mathcal{Hom}_{\mathcal O_{X_s}}(\mu_*\Omega^1_Y\langle E\rangle\otimes\mathcal O_{X_s},\mathcal O_{X_s})$、$\mathcal{Hom}_{\mathcal O_X}(\Omega^1_X,\mathcal O_X)$、$\mathcal{Hom}_{\mathcal O_X}(\mu_*\Omega^1_Y\langle E\rangle,\mathcal O_X)$。固定 $x\in X_s$，$u$ 局部提升为 $(\mu_*\Omega^1_Y\langle E\rangle)^{\vee}$ 在 $x$ 附近的截面 $\bar u$；由 $\mu_*T_Y\langle-E\rangle$ 自反有 $\mu_*T_Y\langle-E\rangle=(\mu_*\Omega^1_Y\langle E\rangle)^{\vee}$（引理 \[eqvlem\] 的用武之地），故 $\bar u$ 提升到 $\mu^{-1}(x)$ 邻域上 $T_Y\langle-E\rangle$ 的截面，即 $u$ 在 $\mu^{-1}(x)$ 附近局部分裂 $\kappa_s(t)$；局部提升唯一，粘成全局分裂，得 $t\in\operatorname{Ker}(\kappa_s)$。最后一个包含由 `main.tex:867-875` 的两行交换图给出（把 $\mu_{s*}\Omega^1_{Y_s}\langle E_s\rangle$ 与 $\Omega^1_{X_s}$ 放在同一列比较）。

第 (4) 步（`main.tex:877-895`）：包含链

$$\operatorname{Ker}(\kappa_{s})\subseteq\operatorname{Ker}\bigl(\oplus_{i=0}^{b-1}\sigma^{i}_{s}\bigr)\subseteq\operatorname{Ker}(\sigma^{1}_{s})$$

与命题 \[cc\](3) 一起说明六个映射 $\kappa_s,\kappa_{\tilde Y_s},\kappa_{V_s},\sigma^1_s,\sigma_{\tilde Y_s},\sigma_{V_s}$ 对一般 $s$ 同核。再由夹逼

$$\operatorname{Ker}(\kappa_{V_{s}})\subseteq\operatorname{Ker}(d\Phi_{*})\subseteq\operatorname{Ker}(\sigma_{V_{s}})$$

（`main.tex:890-893`），公共核就是 $\Phi$ 的纤维 $\Phi^{-1}(\Phi(s))$ 在 $s$ 处的切空间。

### 4.4 定理 \[kl\]：把族拉到一个周期映射为双双右理的底上

定理陈述（`main.tex:898-921`）：存在 dominant 态射 $\tau\colon\bar S\to S$（generically finite）与 $\varrho\colon\bar S\to S^{!}$，$\bar S$ 与 $S^{!}$ 光滑，以及带 $K_{X^{!}}+B^{!}\sim_\mathbb{Q} 0$ 的对数簇 $(X^{!},B^{!})$ 和射影收缩 $f^{!}\colon X^{!}\to S^{!}$，构成方框

$$S\ \xleftarrow{\ \tau\ }\ \bar S\ \xrightarrow{\ \varrho\ }\ S^{!},$$

满足：(1) 存在 $\bar S$ 的开稠密子集 $U$ 与同构 $(X,B)\times_S\bar S|_U\ \overset{\sim}{\to}\ (X^{!},B^{!})\times_{S^{!}}\bar S|_U$；(2) $\kappa_{s^{!}}$ 对一般 $s^{!}\in S^{!}$ 单射（`main.tex:910-920`）。

证明的中间步（`main.tex:923-996`）值得逐步记录，因为它把 Hodge 理论的解析结论转成了代数几何的同构：

- 可设 $h\colon V\to S$ 光滑射影；取光滑紧化 $S\subset\bar S$ 边界单纯正规交叉。按 \[Griffiths\]，变差 $(R^{d}h_{*}\mathbb C_{V})_{\mathrm{prim}}\otimes\mathcal O_{S}$ 的周期映射 $\Phi$ 扩张为 $\bar S$ 的开子集上定义的 proper 解析态射（`main.tex:923-931`）。
- 按 \[koddim\]，$\Phi$ 与某有理映射 $\Phi\colon S\to S^{!}$ 双双有理；再缩 $S$ 使 $\Phi$ 处处正则；把 $S$ 换成 étale 开集后可设四条 (a)-(d)（`main.tex:932-949`）：(a) $(Y,E)\to S$ 光滑相对对且每个 $s$ 有 $\mu_{s*}\mathcal O_{Y_s}=\mathcal O_{X_s}$；(b) $\operatorname{Ext}^1_{Y_s}(\Omega^1_{Y_s}\langle E_s\rangle,\mathcal O_{Y_s})$ 与 $\operatorname{Ext}^1_{X_s}(\Omega^1_{X_s},\mathcal O_{X_s})$ 的维数在 $S$ 上恒定；(c) 对每个 $s$ 有 $\operatorname{Ker}(\kappa_s)=T_{\Phi^{-1}(\Phi(s))}$；(d) $\Phi\colon S\to S^!$ 有截面 $i\colon S^!\to S$。
- 沿截面 $i$ 作 base change 得 $S^!$ 上的族 $(X^!,B^!)$、$(Y^!,B_{Y^!})$ 与 $\mu^!$（`main.tex:950-956`）。
- 由命题 \[ky\] 及其证明，$(Y,E)\to S$ 与 $X\to S$ 限制到 $\Phi$ 的纤维上是一阶无穷小平凡的；再由 (a) 与 \[Ran89\]，$S$ 上的映射 $Y\to X$ 也一阶无穷小平凡（`main.tex:957-961`）。按 \[Gr74\] 与 \[Ka78\]，族 $(Y,E)\to X\to S$ 沿 $\Phi$ 的纤维局部平凡（`main.tex:962-967`）。
- 考虑子函子 $\operatorname{Isom}_S(X,X^{!}\times_{S^{!}}S)\times\operatorname{Isom}_S((Y,E),(Y^{!},E^{!})\times_{S^{!}}S)$ 中使显然图交换者；它由 $S$ 上的概形 $I$ 表出，且上面的局部平凡性说明 $I\to S$ 满；把 $S$（并相应地 $S^!$）换成 étale 开集后可设 $I/S$ 有截面，于是有全局同构 $Y\simeq(Y^!,E^!)\times_{S^!}S$ 与 $X\simeq X^!\times_{S^!}S$（`main.tex:968-983`）。
- $(X,B)$ klt 且 $B$ 有效给出 $B=\mu_*E$ 与 $B^{!}\times_{S^{!}}S=(\mu^{!}\times_{S^{!}}1_S)_*(E^{!}\times_{S^{!}}S)$，故 $X\to X^{!}\times_{S^{!}}S$ 实际是结对的同构 $(X,B)\ \overset{\sim}{\to}\ (X^{!},B^{!})\times_{S^{!}}S$（`main.tex:984-993`）。
- 由 (c)，$\kappa_{s^{!}}$ 在 $s^{!}\in S^{!}$ 单（`main.tex:994-995`）。

至此我们有了"把任意 lc-trivial 族改到底上使 Kodaira-Spencer 单射"的装置，下一节据此得出模子的 nef and big 性。

## 5 lc-trivial fibration 的公理、底变换兼容性与定理 \[klglobal\]

### 5.1 三条公理

`\section{Lc-trivial fibrations}`（`main.tex:1002`）先复述定义（出处 \[BP\]，`main.tex:1007-1023`）：lc-trivial fibration $f\colon(X,B)\to Y$ 由正常 proper 簇之间的收缩 $f\colon X\to Y$ 与对数配对 $(X,B)$ 组成，满足

1. $(X,B)$ 在 $Y$ 的一般点上方有 Kawamata 对数典范奇点（`main.tex:1013-1014`）；
2. $\operatorname{rank} f_{*}\mathcal{O}_{X}(\lceil\mathbf A(X,B)\rceil)=1$（`main.tex:1015-1016`），其中 $\mathbf A(X,B)$ 是 disparity 除子，即 $K+B$ 与某个固定 $K_X+B$ 表示之间的差；
3. 存在正整数 $r$、有理函数 $\varphi\in k(X)^{\times}$ 与 $Y$ 上的 $\mathbb{Q}$-Cartier 除子 $D$ 使

$$K+B+\frac{1}{r}(\varphi)=f^{*}D.$$

条件 3 是"相对 $\mathbb{Q}$-线性平凡"的严格形式：它把 $K+B$ 的相对类钉死为主齐性像，同时保留了规范自由度（$\varphi$ 的选取）。条件 2 排除了 $X$ 有非连通一般纤维带来的多余截面。

### 5.2 两个 b-除子与 b-nef 的含义

这样的纤维化诱导 $Y$ 的两个 $\mathbb{Q}$-b-除子 $\mathbf B$ 与 $\mathbf M$，分别叫判别式与模子 $\mathbb{Q}$-b-除子（`main.tex:1025-1028`）。按 \[BP\] Theorem 0.2，模子 $\mathbb{Q}$-b-除子是 b-nef：意思是存在 $Y$ 的某个 proper 双有理模型 $Y'$ 使

$$\mathbf M=\overline{\mathbf M_{Y'}}\quad\text{且}\quad \mathbf M_{Y'}\ \text{是 nef }\mathbb{Q}\text{-Cartier 除子}\;$$

（`main.tex:1029-1033`）。上划线 $\overline{(\cdot)}$ 是 b-除子的标准操作：由 $Y'$ 上的除子在更高模型上取拉回，得到整个模型族上的相容系统。这条"b-nef"就是素材引言中承认的已知部分（Kawamata 的 \[sba\]），素材的全部新东西在它之上。

### 5.3 命题 \[bc\]：模子 b-除子与底变换交换

命题陈述（`main.tex:1035-1049`）：设 $f\colon(X,B)\to Y$ 为 lc-trivial fibration，$\varrho\colon Y'\to Y$ 是正常 proper 簇之间的满态射，$f'\colon(X',B_{X'})\to Y'$ 是底变换诱导的 lc-trivial fibration（方框 $(X,B)\times_Y Y'\to Y'$），$\mathbf M$ 与 $\mathbf M'$ 为各自的模子 $\mathbb{Q}$-b-除子，则

$$\varrho^{*}\mathbf M=\mathbf M'.$$

证明（`main.tex:1051-1079`）分三段。

第 (1) 段处理构造本身：可设 $X'$ 是 $X\times_Y Y'$ 主分支的正规化，且 $X$ 光滑；则存在 $X'$ 上的典范除子 $K_{X'}$ 使

$$A=K_{X'}-\varrho_X^{*}K$$

是 $f'$-垂直的 Weil 除子；定义 $B_{X'}=\varrho_X^{*}B-A$，于是

$$K_{X'}+B_{X'}+\frac{1}{r}\bigl(\varrho_X^{*}\varphi\bigr)=f'^{*}\bigl(\varrho^{*}D\bigr),$$

仍是 lc-trivial fibration 的形式。$\mathbf M'$ 与 $K_{X'}$ 的选取无关，依据 \[BP\] Remark 3.3（`main.tex:1063-1065`）。

第 (2) 段（`main.tex:1067-1072`）：$\varrho$ generically finite 时结论成立。birational 情形显然；finite 情形由 \[thesis\] Theorem 3.2 与 \[BP\] Remark 3.3。

第 (3) 段（`main.tex:1074-1078`）：一般情形由 (1) 加上"具有无穷远处幂单局部单值的变差的典范扩张与底变换交换"得出，论证与 \[BP\] Theorem 2.7 的证明相同。此处正是命题 \[cc\](4) 的 Schmid 扩张被派上用场的地方：模子在解析侧就是典范扩张的行列丛，因此代数底变换的相容性由解析侧的相容性给出。

### 5.4 "b-nef and good"的定义

定义（`main.tex:1081-1090`）：$\mathbb{Q}$-b-除子 $\mathbf M$ 称为 b-nef and good，若存在 $Y$ 的 proper 双有理模型 $Y'$ 与收缩 $h\colon Y'\to Z$，使

$$\mathbf M_{Y'}\sim_\mathbb{Q} h^{*}H\quad(H\ \text{是}\ Z\ \text{上 nef and big 的 }\mathbb{Q}\text{-除子}),\qquad \mathbf M=\overline{\mathbf M_{Y'}}.$$

"good" 的强度在于 $\sim_\mathbb{Q}$（线性等价），强于 $\equiv$（数值等价）：它给出实际存在的 $\mathbb{Q}$-线性系统，尽管可能有基点。素材引言里说半正性预测 $\mathbf M$ 应当是"来自某个射影双有理模型的 pullback 型半正除子"，b-nef and good 是这个预测的可证近似版本。

### 5.5 主定理 \[klglobal\] 及其证明的骨架

定理陈述（`main.tex:1093-1123`）：设 $f\colon(X,B)\to Y$ 是 lc-trivial fibration，其几何一般纤维 $X_{\overline\eta}=X\times_Y\operatorname{Spec}\overline{k(Y)}$ 是射影簇且 $B_{\overline\eta}$ 有效。则存在方框

$$Y\ \xleftarrow{\ \tau\ }\ \bar Y\ \xrightarrow{\ \varrho\ }\ Y^{!},$$

使得：$f^{!}\colon(X^{!},B^{!})\to Y^{!}$ 是 lc-trivial fibration；$\tau$ generically finite 且满，$\varrho$ 满；存在非空开集 $U\subset\bar Y$ 与同构 $(X,B)\times_Y\bar Y|_U\ \overset{\sim}{\to}\ (X^{!},B^{!})\times_{Y^{!}}\bar Y|_U$；若 $\mathbf M,\mathbf M^{!}$ 是各自的模子 $\mathbb{Q}$-b-除子，则

$$\mathbf M^{!}\ \text{是 b-nef 且 big},\qquad \tau^{*}\mathbf M=\varrho^{*}\bigl(\mathbf M^{!}\bigr).$$

特别地，模子 $\mathbb{Q}$-b-除子 $\mathbf M$ 是 b-nef and good（`main.tex:1121-1122`）。

证明第 (1) 段（`main.tex:1125-1165`）确立一个判据：若 $\kappa_s$ 对充分一般的 $s\in Y$ 单射，则 $\mathbf M$ 是 b-nef and big。做法：取关于 $\operatorname{Sing}(X)\cup\operatorname{Supp}(B)$ 的等变消解 $\mu\colon X'\to X$；$\tilde{X'}\to X'$ 是 $X'$ 在 $k(X')(\sqrt[b]{\varphi})$ 中的正规化；$V\to\tilde{X'}$ 是关于 $\tilde{X'}$ 奇轨迹的等变消解，$f'\colon X'\to Y$ 为诱导态射（图在 `main.tex:1141-1146`）。作 generically finite 底变换后可设 $\mathbf M$ 下降到 $Y$，且 $V/Y$ 与某个有单纯正规交叉退化、余维 1 半稳定的族 $V'/Y$ birational。此时由 \[BP\] Lemma 5.2，$\mathbf M_Y$ 是 nef Cartier 除子且 $\mathcal O_Y(\mathbf M_Y)$ 同构于 Schmid 扩展

$$\bar{\mathcal{F}}^{(1)}=f'_{*}\mathcal{O}_{X'}\bigl(\lceil -B_{X'}+f'^{*}B_{Y}+f'^{*}\mathbf M_{Y}\rceil\bigr)$$

（`main.tex:1152-1158`）。由命题 \[ky\]，$\sigma^{1}_{s}$ 与 $\kappa_{s}$ 同核，故 $\sigma^1_s$ 单；由命题 \[cc\]，$\bar{\mathcal F}^{(1)}$ 有正自交，于是 $\mathbf M_Y$ 是 nef and big 的 Cartier 除子，$\mathbf M=\overline{\mathbf M_Y}$ 是 b-nef and big（`main.tex:1159-1165`）。

证明第 (2) 段（`main.tex:1167-1204`）完成一般情形：可设底 $Y$ 光滑。由定理 \[kl\] 得到满足 (a)-(c) 的方框（`main.tex:1168-1187`）。在 $Y^!$ 上，$\kappa_{s^!}$ 一般单（定理 \[kl\](2)），故 $\mathbf M^{!}$ 由第 (1) 段是 b-nef and big。取 $\bar f\colon\bar X\to\bar Y$ 为同时由 $f$ 与 $f^!$ 双有理诱导的收缩，$(\bar X/\bar Y,B_{\bar X})$ 与 $(\bar X/\bar Y,B^{!}_{\bar X})$ 为底变换诱导的两个 lc-trivial fibration。由 (c)，存在 $\bar Y$ 上的 $\mathbb{Q}$-Cartier 除子 $L$ 使

$$B^{!}_{\bar X}=B_{\bar X}+\bar f^{*}L,$$

故两者有同一个模子 $\mathbb{Q}$-b-除子（素材引 \[BP\] Remark 3.3，`main.tex:1195-1200`）。最后由命题 \[bc\] 得 $\tau^{*}\mathbf M=\varrho^{*}(\mathbf M^{!})$（`main.tex:1201-1204`）。

### 5.6 逻辑链回顾

把 §2 到 §5 串起来：引理 \[eqvlem\] 保证可以选到使 $\mu_*T\langle-E\rangle$ 自反的消解；引理 3.3 保证 $\operatorname{Ext}^1$ 能在消解与基座之间搬运；覆盖技巧把带边界的相对典范层写成有限个本征层 $\mathcal F^{(i)}$；命题 \[cc\] 给出它们的 Griffiths 半正曲率与 $\det$ 的 nef 性；命题 \[ky\] 把曲率退化方向认成周期映射的纤维方向；定理 \[kl\] 沿周期映射把族局部平凡化并得到 $\kappa$ 单射的新底 $S^!=Y^!$；第 (1) 段在 $\kappa$ 单射时用正自交兑换 nef and big；命题 \[bc\] 把结论拉回原底。这条链里每一环都需要前面的假设，缺任一环都退化为已知的 b-nef。

## 6 数值平凡的模子是挠的：命题 \[num\] 与定理 \[torsion\]

### 6.1 命题 \[num\]：直和项、数值平凡与曲率为零

命题（`main.tex:1207-1220`）：设 $f\colon X\to Y$ 是射影流形之间的态射，$\Sigma_{Y}\subset Y$ 是单纯正规交叉除子，满足

1. $f$ 在 $Y\setminus\Sigma_{Y}$ 上光滑（`main.tex:1212`）；
2. $f$ 在 $Y$ 的余维 1 点上半稳定（`main.tex:1213-1214`）。

若 $\mathcal L\subset f_{*}\omega_{X/Y}$ 是一个作为直和项的可逆层且 $\mathcal L\equiv 0$，则存在正整数 $r$ 使 $\mathcal L^{\otimes r}\simeq\mathcal O_{X}$（`main.tex:1216-1219`）。

本稿读法注记：素材此处结论写作 $\mathcal L^{\otimes r}\simeq\mathcal O_{X}$，但 $\mathcal L$ 是 $Y$ 上的线丛（它是 $f_{*}\omega_{X/Y}$ 的直和项），故按上下文应为 $\mathcal O_{Y}$；这是源文件的一处字母笔误，不影响论证，因为后面的证明全程在 $Y$ 上工作。

### 6.2 证明的中间步

证明（`main.tex:1222-1262`）是一次"数值平凡加半正曲率逼迫平坦"的标准论证，逐步登记：

考虑变差

$$H=R^{d}f_{*}\mathbb C_{X^{0}}\otimes\mathcal O_{Y^{0}},\qquad Y^{0}=Y\setminus\Sigma_{Y},\quad d=\dim(X/Y)$$

（`main.tex:1223-1228`）。层 $\mathcal L|_{Y^{0}}\subset f_{*}\omega_{X/Y}|_{Y^{0}}=F^{d}H$ 带诱导 Hermitian 度量 $h$，其曲率形式 $\Theta$ 半正（`main.tex:1229-1234`）。断言：$\Theta$ 平凡。

断言的证明（`main.tex:1234-1249`）：取 $s\in Y^{0}$ 处切向量 $v\in T_{Y,s}$。存在 $Y$ 中的射影曲线 $C$ 使 $T_{C,s}=\mathbb C v$，$\nu\colon C^{\nu}\to C$ 为其正规化。由假设，$H$ 在无穷远的局部单值表示幂单，按 Kawamata（素材引 \[Ka81\]）有

$$\deg(\mathcal L|_{C})=\frac{\sqrt{-1}}{2\pi}\int_{\nu^{-1}(Y^{0})}\nu^{*}\Theta.$$

$\mathcal L$ 数值平凡给出 $\deg(\mathcal L|_C)=0$，而被积形式半正，故 $\nu^{*}\Theta=0$；$\nu$ 在 $s$ 附近是同构，故 $v$ 是 $\Theta$ 的零方向。$v$ 任意，$\Theta$ 平凡。

后半段（`main.tex:1251-1261`）：$\Theta$ 平凡说明 $\mathcal L|_{Y^{0}}\subset H$ 是局部子系统；按 Deligne，存在 $r>0$ 使 $(\mathcal L|_{Y^{0}})^{\otimes r}$ 是平凡局部系统。又由 Kawamata，$f_{*}\omega_{X/Y}$ 是 $f_{*}\omega_{X/Y}|_{Y^{0}}$ 的典范扩张，其直和项 $\mathcal L$ 亦然；局部单值幂单时典范扩张与张量积交换，故 $\mathcal L^{\otimes r}\simeq\mathcal O$。

三条假设各自的位置要说清：光滑性给出 $Y^0$ 上变差的存在；半稳定（在余维 1 处）保证局部单值幂单，这是 \[Ka81\] 的曲率-度数公式与"典范扩张与张量积交换"两者共同的前提；直和项条件保证 $\mathcal L$ 继承 $F^dH$ 上的 Hodge 度量并同时保证扩张仍是直和项。

### 6.3 定理 \[torsion\]：主结果 (a)

定理（`main.tex:1264-1267`）：设 $f\colon(X,B)\to Y$ 是 lc-trivial fibration，若 $\mathbf M$ 是 b-数值平凡的，则

$$\mathbf M\sim_\mathbb{Q} 0 .$$

证明（`main.tex:1269-1281`）四句，每句都指向一个外部装置：

- 论证与 \[BP\] Theorem 0.1 相似（`main.tex:1269-1270`）。
- 作有限底变换（\[BP\] Lemma 5.1，`main.tex:1271-1274`）后可设诱导根纤维化 $h\colon V\to Y$ 在余维 1 上半稳定，且 $\mathbf M$ 下降到 $Y$。
- 按构造，可逆层 $\mathcal O_{Y}(\mathbf M_{Y})\subset h_{*}\omega_{V/Y}$ 是直和项，且 $\mathbf M_{Y}\equiv 0$（`main.tex:1275-1277`）。
- 由命题 \[num\] 得 $\mathbf M_{Y}$ 是挠的，故 $\mathbf M$ 是挠的（`main.tex:1279-1280`）。

"b-数值平凡"这一假设在双有理族上的每层都成立，所以可以在下降后的模型上直接读成 $\mathbf M_{Y}\equiv0$；而 $\mathcal O_Y(\mathbf M_Y)\subset h_*\omega_{V/Y}$ 是直和项这件事，正是 §3 本征层分解在 $T=B_{\bar\eta}$ 情形（$m=b$、$i=1$）的特例。这条定理是引言中承诺的 (a)：它把"数值挠"提升为"线性挠"，方法完全走解析（曲率-度数公式），因此需要底空间是光滑且族半稳定的模型，这正是有限底变换 \[BP\] Lemma 5.1 所提供的环境。

## 7 应用一节：四条结构定理、一个 DuVal 算例与自同构群

`\section{Applications}`（`main.tex:1286`）共八个结果，按素材出现顺序登记。

### 7.1 $\omega\sim_\mathbb{Q} K_Y+B_Y$：模子被边界吸收

定理（`main.tex:1292-1306`）：$(X,B)$ 是带 klt 奇点的射影对数簇，$f\colon X\to Y$ 是到 proper 正常簇的收缩，$\omega$ 是 $Y$ 上 $\mathbb{Q}$-Cartier 除子且

$$K+B\sim_\mathbb{Q} f^{*}\omega,$$

则存在 $\mathbb{Q}$-Weil 除子 $B_Y$ 使 $(Y,B_Y)$ 是带 klt 奇点的对数簇且 $\omega\sim_\mathbb{Q} K_Y+B_Y$。

证明（`main.tex:1308-1347`）的链条：

- 改写假设：可写成 $K+B+\frac1r(\varphi)=f^{*}\omega$（$r>0$，$\varphi\in k(X)^{\times}$），于是 $f\colon(X,B)\to Y$ 是 lc-trivial fibration；记诱导的 different 与 moduli $\mathbb{Q}$-b-除子为 $\mathbf B,\mathbf M$（`main.tex:1308-1314`）。
- 定理 \[klglobal\] 的假设满足，故可找到高分辨 $\sigma\colon Y'\to Y$ 使 $\mathbf M=\overline{\mathbf M_{Y'}}$ 且

$$\mathbf M_{Y'}\sim_\mathbb{Q} h^{*}A,$$

其中 $h\colon Y'\to Z$ 是到正常射影簇的收缩，$A$ 是 $Z$ 上 nef and big 除子（`main.tex:1315-1322`）。
- 沿 $\sigma$ 底变换（图在 `main.tex:1325-1329`）后有

$$\sigma^{*}\omega=K_{Y'}+\mathbf B_{Y'}+\mathbf M_{Y'}.$$

因 $\mathbf M$ 下降到 $Y'$，Inversion of Adjunction 对 $f'$ 成立（\[BP\] Theorem 3.1），故 $(Y',\mathbf B_{Y'})$ 是 klt 对（`main.tex:1330-1334`）。
- 找 $Y'$ 上有效 $\mathbb{Q}$-除子 $E$ 使 $\mathbf M_{Y'}\sim_\mathbb{Q} E$ 且 $(Y',\mathbf B_{Y'}+E)$ 仍 klt（`main.tex:1335-1337`）；令 $B_Y=\sigma_{*}(\mathbf B_{Y'}+E)$，则

$$\sigma^{*}(K_Y+B_Y)=K_{Y'}+\mathbf B_{Y'}+E\sim\sigma^{*}\omega,$$

且 $(Y,B_Y)$ klt（`main.tex:1338-1343`）。素材此行写作 $\sim$（不带下标 $\mathbb{Q}$），按上下文应为 $\sim_\mathbb{Q}$，属笔误。
- 有效性：$B$ 有效蕴含 $\mathbf B_Y=\sigma_{*}\mathbf B_{Y'}$ 有效，故 $B_Y$ 有效，即 $(Y,B_Y)$ 是对数簇（`main.tex:1344-1346`）。

要点：nef and big 的 $h^*A$ 被换成一个有效代表 $E$，同时保持 klt；这一步只用 $A$ 的 big 性（可取有效 $\mathbb{Q}$-线性代表）与 $h$ 的收缩性质，因此整个论证在 $\mathbf M$ 只是 b-nef 时就会断掉。

### 7.2 定理 \[AB0\]：$K+B\equiv 0$ 推出 $K+B\sim_\mathbb{Q} 0$

定理（`main.tex:1350-1354`）：$(X,B)$ 带 klt 奇点的射影对数簇且 $K+B\equiv 0$，则 $K+B\sim_\mathbb{Q} 0$。这是 Abundance 在数值平凡情形的完整解。

证明（`main.tex:1356-1405`）：

- $(X,B)$ klt 蕴含 $X$ 理性奇点，故 Albanese 映射是一个态射（素材引 \[minit\]，`main.tex:1357-1361`）。
- 对 $\dim X$ 归纳。$q(X)=0$ 时数值平凡的 $K+B$ 必为挠除子（`main.tex:1362-1364`）。设 $q(X)>0$，令 $f\colon X\to Y$ 为 Albanese 映射的 Stein 分解。几何一般纤维 $(X_{\bar\eta},B_{\bar\eta})$ 满足同样性质且维数更小，故归纳得 $K_{X_{\bar\eta}}+B_{\bar\eta}\sim_\mathbb{Q} 0$；特别地 $K+B$ 数值平凡且 $\mathbb{Q}$-线性等价于一个 $f$-垂直除子（`main.tex:1365-1374`）。
- 取足够高分辨 $\mu\colon Y'\to Y$ 及底变换方框（`main.tex:1376-1383`），使 $f'\colon(X',B_{X'})\to Y'$ 是 lc-trivial fibration，且 $X'$ 上任何在 $Y'$ 例外的素除子在 $X$ 上也例外。此时有

$$\nu^{*}(K+B)+f'^{*}\bigl(\mathbf B^{-}_{Y'}\bigr)=f'^{*}\bigl(K_{Y'}+\mathbf B^{+}_{Y'}+\mathbf M_{Y'}\bigr),$$

其中 $\mathbf B_{Y'}=\mathbf B^{+}_{Y'}-\mathbf B^{-}_{Y'}$ 是判别式在 $Y'$ 上按正负分量的分解；有效 $\mathbb{Q}$-除子 $f'^{*}(\mathbf B^{-}_{Y'})$ 在 $X$ 上例外，因为它支撑在 $B_{X'}$ 的负部与 $f'$-例外除子上（`main.tex:1384-1398`）。
- 按 \[Ueno\] Theorem 10.3 有 $\kappa(Y',K_{Y'})\ge 0$；因 $\mathbf M$ 是 b-nef and good，有 $\kappa(Y',\mathbf M_{Y'})\ge 0$；于是 $\kappa(X,K+B)\ge 0$，故 $K+B\sim_\mathbb{Q} 0$（`main.tex:1400-1404`）。

这里的推理格式是"将 $K+B$ 的正性从纤维推到底，再用底的 Kodaira 维非负反推回去"；判别式的负部被处理成例外除子，是"足够高分辨"这一自由的典型用法。

### 7.3 定理 \[ab\]：归约到最大 nef 维数

定理（`main.tex:1407-1417`）：$(X,B)$ 带 klt 奇点的射影对数簇，$K+B$ nef，nef 维数为 $n$。假设 $n$ 维的对数极小模型纲领与对数 Abundance 猜想成立，则 $k$ 充分大且可整除时 $|k(K+B)|$ 无基点。

证明只有一句（`main.tex:1419-1423`）：\[NM\] Theorem 5.1 的论证仍然有效，只需把其中的 \[minit\] Theorem 8.2 与 \[NM\] Theorem 4.5 分别替换为本稿的定理 \[AB0\] 与定理 \[klglobal\]。这是全节最直白的"插件式"结论，也解释了引言 1.5 段中"归约到最大 nef 维数"的说法。

### 7.4 命题 \[extend\]：开集上的平凡化沿余维 $\ge2$ 延拓

命题（`main.tex:1430-1448`）：设 $f\colon(X,B)\to Y$ 是正常射影簇之间的 lc-trivial fibration，存在非空开集 $U\subset X$ 与同构

$$\Phi\colon(X,B)|_{U}\ \overset{\sim}{\longrightarrow}\ (F,B_{F})\times U\ \text{ over }\ U,$$

并令

$$Y^{0}=Y\setminus\bigl(\operatorname{Sing}(Y)\cup\operatorname{Supp}(\mathbf B_{Y})\cup f(\operatorname{Supp}(B^{-v}))\bigr),$$

其中 $B^{-v}$ 是 $B$ 的负垂直部分，则 $\Phi$ 延拓为 $Y^0$ 上的同构 $(X,B)|_{Y^{0}}\overset{\sim}{\to}(F,B_F)\times Y^{0}$。

证明（`main.tex:1450-1537`）三段，是全节最易被引用也最难被复述的一段：

第 (1) 段（`main.tex:1451-1468`）：$X$ 上的素除子 $E$ 若满足 $\operatorname{codim}_X(f(E))\ge2$，则 $f(E)\cap Y^{0}=\emptyset$。理由：$\mathbf M\sim_\mathbb{Q} 0$（由命题假设 (ii)），故 $\mathbf M$ 下降到 $Y$，从而 Inversion of Adjunction 对 $f$ 成立（\[BP\] Theorem 3.1）。若 $B$ 在 $E$ 处为负，结论显然；否则 $(X,B)$ 在 $E$ 的一般点的对数 discrepancy 为 $1-\operatorname{mult}_{E}(B)\le1$，由 IA，$(Y,\mathbf B_Y)$ 在 $f(E)$ 的一般点的最小对数 discrepancy 至多为 1；又 $\mathbf B_Y$ 有效而 $f(E)$ 余维至少 2，故它只能落在 $\operatorname{Sing}(Y)$ 或 $\operatorname{Supp}(\mathbf B_Y)$ 中。

第 (2) 段（`main.tex:1470-1501`）：有理映射 $\Phi\colon X|_{Y^0}\dashrightarrow F\times Y^0$ 及其逆在余维 1 处是同构，且 $B|_{Y^0}$ 是水平除子。据此可设 $Y$ 是曲线，只需证每个 $P\in Y\setminus\operatorname{Supp}(\mathbf B_Y)$ 处 $X_P\dashrightarrow F\times P$ 双有理。关键等式是

$$\mathbf A(X,B+f^{*}P)=\mathbf A\bigl(F\times Y,\ B_F\times Y+F\times\mathbf B_Y+F\times P\bigr),$$

而 $(F\times Y,B_F\times Y+F\times P)=(F,B_F)\times(Y,P)$ 在 $F\times P$ 附近有对数典范奇点，且 $F\times P$ 是 $P$ 上方唯一的 lc place。因 $\mathbf B_Y=0$ 在 $P$ 附近，$(X,B+f^*P)$ 在 $X_P$ 附近 lc 且 $F\times P$ 是唯一 lc place；$B$ 在 $X_P$ 的各分量有效，故 $X_P$ 是约化素除子、$\Phi$ 给出 $X_P\dashrightarrow F\times P$ 的双有理映射，并且 $B$ 在 $X_P$ 处重数为 0。

第 (3) 段（`main.tex:1503-1536`）：取 $X|_{Y^0}$ 与 $F\times Y^0$ 的大开集 $V_1,V_2$ 与其上同构 $\Phi\colon V_1\overset{\sim}{\to}V_2$；固定 $Y^0$ 中一点及局部坐标卡 $(\Delta;t_1,\dots,t_n)$。截面 $p^{*}\frac{\partial}{\partial t_i}\in H^0(F\times\Delta,(p^{*}\Omega^{1}_{Y})^{\vee})$ 提升为向量场

$$\mathfrak a_{i}\in H^0(F\times\Delta,T_{F\times Y}).$$

层 $T_X$、$T_{F\times Y}$、$(p^{*}\Omega^{1}_{Y})^{\vee}$、$(f^{*}\Omega^{1}_{Y})^{\vee}$ 均自反，故 $\Phi$ 诱导向量场 $\mathfrak a'_{i}\in H^0(X|_{\Delta},T_X)$ 提升 $f^{*}\frac{\partial}{\partial t_i}$。按 \[GK64\]，这些向量场在固定纤维邻域内定义单参数自同构群，从而给出 $f$ 在该纤维附近的平凡化；$\mathfrak a_i$ 与 $\mathfrak a'_i$ 的单参数群经 $\Phi$ 相容，故 $\Phi$ 在该纤维附近是同构。边界的处理：$B|_{Y^0}$ 在 $Y^0$ 上水平，$\Phi$ 在 $Y^0$ 的一般点上方保持边界，故 $\Phi(B)=B_F\times Y^0$。

本稿评注：第 (3) 段是引理 \[eqvlem\] 思想在"自反性允许向量场跨余维 2 延拓"这一层面的复用；这也是 §2 花大力气建立对数切丛等式的原因。

### 7.5 DuVal 曲面算例：两个 b-除子都零而映射不是同构

算例（`main.tex:1539-1544`）：设 $Y$ 是带 DuVal 奇点的曲面，则极小消解 $f\colon X\to Y$ 是 lc-trivial fibration，且

$$\mathbf B_{Y}=0,\qquad \mathbf M=0,$$

而它只在 DuVal 奇点之外是同构。

本稿把它当作必查算例来读，理由有三条。第一，它给出"$\mathbf B_Y=\mathbf M=0$ 不蕴含 $f$ 是同构"的具体反例，说明命题 \[extend\] 与定理 \[str\] 中"底光滑"或"取覆盖"的假设不可省略：这里失败点恰在余维 2（曲面奇点是孤立点），而 \[extend\] 的结论只在挖掉 $\operatorname{Sing}(Y)$ 之后成立。第二，它说明判别式的定义只探测余维 1 信息：$K_X=f^{*}K_Y$（DuVal 即有理二重点，Gorenstein 且 discrepancy 全为 0），故对每个素除子 $D\subset Y$ 都没有正系数出现，$\mathbf B_Y=0$；例外纤维是 $(-2)$-曲线树，它们对 $\mathbf B_Y$ 完全不可见。第三，模子为零来自平凡性：$X\setminus f^{-1}(\mathrm{pt})\to Y\setminus\mathrm{pt}$ 是同构，族没有变化，周期映射是常值，故 $\mathbf M$ 数值平凡，再由定理 \[torsion\] 是挠，在归一化选择下即为 0。

### 7.6 命题 \[aut\]：$\operatorname{Aut}^0(X,B)$ 是 Abelian 簇

命题（`main.tex:1546-1555`）：$(X,B)$ 是带 klt 奇点的 proper 对数簇且 $\kappa(X,K+B)\ge0$。记

$$\operatorname{Aut}(X,B)=\{\sigma\in\operatorname{Aut}(X);\ \sigma_{*}(B)=B\}$$

的单位连通分支为 $\operatorname{Aut}^{0}(X,B)$，则 $\operatorname{Aut}^{0}(X,B)$ 是 Abelian 簇。

证明（`main.tex:1557-1614`）是反证加轨道分解：

- 按 \[FGA,MO\]，$\operatorname{Aut}^0(X)$ 是代数群，其闭子群 $\operatorname{Aut}^0(X,B)$ 也是代数群。反设它含线性代数群，则含一维连通线性群 $G=\mathbb G_m$ 或 $\mathbb G_a$（\[Ros56\]，`main.tex:1557-1563`）。
- 闭子集 $\operatorname{Sing}(X)\cup\operatorname{Supp}(B)$ 是 $G$-不变的。按 \[Ros56\] Theorem 10，存在 $G$-不变开集 $U\subset X\setminus(\operatorname{Sing}(X)\cup\operatorname{Supp}(B))$ 与 $G$-不变同构

$$U\ \overset{\sim}{\longrightarrow}\ G\times V,$$

其中 $G$ 只通过平移作用在第一因子；特别地 $V$ 非奇（`main.tex:1565-1575`）。
- 取紧化 $V\subset Y$ 使 $Y\setminus V$ 为单纯正规交叉除子；由 Hironaka 消解得到下图（`main.tex:1580-1591`）：$X'$  proper 光滑，$f\colon X'\to X$ 在 $U$ 上是同构，$g\colon X'\to\mathbb P^{1}\times Y$ 在 $G\times V$ 上是同构，且

$$f^{-1}(X\setminus U)=g^{-1}(\mathbb P^{1}\times Y\setminus G\times V)=\sum E_{i}$$

是 $X'$ 上的单纯正规交叉除子。
- 令 $f^{*}(K+B)=K+B_Y$，$B_Y^{+}$ 为其正部。klt 给出 $\lfloor B_Y^{+}\rfloor=0$；$B$ 有效给出

$$\kappa(X',K_{X'}+B_Y^{+})=\kappa(X,K+B)\ge 0,$$

特别地 $\kappa(\mathbb P^{1}\times Y,g_{*}(B_Y^{+}))\ge0$（`main.tex:1592-1598`）。
- 但有

$$\bigl(\mathbb P^{1}\times Y,\ g_{*}(B_Y^{+})\bigr)=(\mathbb P^{1},B_{\mathbb P^{1}})\times(Y,B_Y),$$

其中 $B_{\mathbb P^{1}}$、$B_Y$ 分别支撑在 $\mathbb P^{1}\setminus G$ 与 $Y\setminus V$ 上。于是 $\kappa(\mathbb P^{1},K_{\mathbb P^{1}}+B_{\mathbb P^{1}})\ge0$；因 $B_{\mathbb P^{1}}$ 是边界，这逼迫 $G=\mathbb G_m$ 且 $B_{\mathbb P^{1}}$ 是两个点的约化和，与 $\lfloor B_Y^{+}\rfloor=0$ 矛盾（`main.tex:1601-1613`）。

计数依据：$\deg(K_{\mathbb P^1}+B_{\mathbb P^1})=-2+2=0$，所以只有 $\mathbb G_m$（$\mathbb P^1\setminus\mathbb G_m$ 恰为两点）能通过；$\mathbb G_a$ 情形 $\mathbb P^1\setminus\mathbb G_a$ 是一个点，$\kappa<0$。这正是素材那句"因此 $G=\mathbb G_m$ 且 $B_{\mathbb P^1}$ 是两点的约化和"的内容。

### 7.7 定理 \[str\]：有限 Galois 覆盖上的平凡化与一个 1-cocycle

定理（`main.tex:1616-1629`）：设 $f\colon(X,B)\to Y$ 是 lc-trivial fibration，$X_{\bar\eta}$ 射影，$B$ 在 $Y$ 的大开集上方有效，且

$$\mathbf B_{Y}=0,\qquad \mathbf M\sim_\mathbb{Q} 0 .$$

则存在有限 Galois 覆盖 $\tau\colon Y'\to Y$ 使得：(i) $\tau$ 在余维 1 处 étale；(iii) 存在非空开集 $U\subset Y'$ 与 $U$ 上方的同构 $(X,B)\times_YY'|_U\ \overset{\sim}{\to}\ (F,B_F)\times Y'|_U$。素材的枚举只有 (i) 与 (iii)，条目 (ii) 缺号（`main.tex:1623-1627`），属源文件的编号疏漏；下文第 (3) 段证明里出现的"由 (ii)"其实指本定理假设 $\mathbf M\sim_\mathbb{Q}0$。

证明五段，逐段登记（`main.tex:1631-1752`）：

第 (1) 段：$f$ 的纤维在 $Y$ 的大开集上是约化的。可设 $Y$ 是曲线，$P\in Y$，$f^{*}P=\sum_i m_iE_i$，则

$$1=1-\operatorname{mult}_{P}(\mathbf B_{Y})\le\min_{i}\frac{1-\operatorname{mult}_{E_i}(B)}{m_i}\le\frac{1}{m_i}.$$

左端等号用 $\mathbf B_Y=0$，右端不等式用 $B$ 在 $E_i$ 处系数非负且 $\le1$；于是所有 $m_i=1$，纤维约化（`main.tex:1631-1639`）。进而存在大开集 $Y^0\subset Y$ 使 $B$ 在 $Y^0$ 上水平、$f\colon X|_{Y^0}\to Y^0$ 在大开集上光滑（`main.tex:1640-1643`）。

第 (2) 段：由 $\mathbf M\sim_\mathbb{Q}0$ 与定理 \[klglobal\]，存在 generically finite 态射 $\tau\colon W\to Y$（$W$ 光滑 proper）与非空开 $U\subseteq W$，使 $(X,B)\times_YW|_U$ 与 $(F,B_F)\times W|_U$ 在 $U$ 上同构；可设域扩张 $k(W)/k(Y)$ 是 Galois 的，$G=\operatorname{Gal}(k(W)/k(Y))$ 正则作用在 $W$ 上；缩 $Y^0$ 使 $W^0:=\tau^{-1}(Y^0)\to Y^0$ 是有限平坦 Galois 覆盖。取 $X'\to X\times_YW$ 为正规化（`main.tex:1645-1659`）。断言：$X'\to X\times_YW$ 在 $W^0$ 上方是同构。理由：限制到 $Y^0$ 上 $f$ 在大开集光滑、$\tau'$ 有限，故 $X\times_YW|_{W^0}\to W^0$ 在大开集光滑；$W$ 光滑故 $X\times_YW|_{W^0}$ 的奇轨迹余维至少 2；又 $X\times_YW|_{W^0}\to X|_{Y^0}$ 有限平坦且 $X$ 满足 $S_2$（素材引 \[Matsumura\] 21.B Theorem 50），故纤维积本身 $S_2$；余维 2 的奇点在 $S_2$ 下无法阻止正规化成为同构（`main.tex:1661-1670`）。

第 (3) 段：有限底变换给出 lc-trivial fibration $g\colon(X',B_{X'})\to W$，其判别式为 $\mathbf B_W$、模子为 $\mathbf M'\sim_\mathbb{Q}\tau^{*}\mathbf M\sim_\mathbb{Q}0$；令 $B':=B_{X'}-g^{*}(\mathbf B_W)$，则

$$g(\operatorname{Supp}(B'))\cap W^{0}=\emptyset,\qquad \mathbf B'_{W}=0,$$

于是 $g\colon(X',B')\to W$ 满足命题 \[extend\] 的假设，得到 $W^0$ 上方的同构 $\Phi\colon(X',B_{X'})|_{W^0}\overset{\sim}{\to}(F,B_F)\times W^0$。$G$ 正则作用在 $W^0$ 上，且 $X'|_{W^0}=X|_{Y^0}\times_{Y^0}W^0$、$g$ 是 $G$-不变的，故 $G$ 在 $(F,B_F)\times W^0$ 上有诱导作用使 $\Phi$ 为 $G$-不变同构（`main.tex:1672-1692`）。

第 (4) 段：核心。设 $H\le G$ 由所有分歧群 $I(P)$（$P$ 取遍 $W^0$ 的素除子）生成，则对 $\sigma\in H$ 有

$$\sigma'=\mathrm{id}_{F}\times\sigma,$$

其中 $\sigma'$ 是 $\sigma$ 在 $(F,B_F)\times W^0$ 上诱导的自同构。论证：$\sigma'\circ(\mathrm{id}_F\times\sigma)^{-1}$ 是 $(F,B_F)\times W^0$ 在 $W^0$ 上的自同构，诱导态射

$$s_{\sigma}\colon W^0\to\operatorname{Aut}(F,B_F).$$

对 $\sigma\in I(P)$ 有 $s_{\sigma}(P)=\{\mathrm{id}_F\}$，故 $s_\sigma$ 把 $W^0$ 映入单位连通分支 $\operatorname{Aut}^{0}(F,B_F)$（`main.tex:1694-1713`）。又有作用恒等式

$$s_{\sigma}(w)\cdot\varphi(x\times_Y\sigma^{-1}w)=\varphi(x\times_Yw),\qquad \Phi(x\times_Yw)=(\varphi(x\times_Yw),w),$$

截面满足

$$s_{\sigma\eta}(w)=s_{\sigma}(w)\circ s_{\eta}(\sigma^{-1}w),\qquad \sigma,\eta\in H,\ w\in W^{0},$$

故它们给出 1-cocycle

$$\xi=\{s_{\sigma}\}_{\sigma\in H}\in H^{1}\bigl(H,A(W^{0})\bigr),$$

其中 $A(W^0)$ 是 $\operatorname{Aut}^{0}(F,B_F)\times W^0$ 在 $W^0$ 上的截面群。$\operatorname{Aut}^{0}(F,B_F)$ 作为 $H$-模是交换的（命题 \[aut\]），故按 \[Serre\] 该 cocycle 有限阶；改变平凡化后可设每个 $\sigma\in H$ 的 $s_\sigma$ 都平凡（`main.tex:1715-1737`）。

第 (5) 段：取 $W'=W^0/H$，得底变换方框，$W'\to Y^0$ 是 étale Galois 覆盖，$\operatorname{Gal}(W'/Y^0)$ 在 $W'$ 与 $(F,B_F)\times W'$ 上的作用无不动点；$Y$ 在域 $k(W')$ 中的正规化即满足要求的 $Y'$（`main.tex:1739-1751`）。

### 7.8 收尾定理：Albanese 映射的有限 étale 平凡化

定理（`main.tex:1754-1767`）：$(X,B)$ 带 klt 奇点的射影对数簇且 $K+B\sim_\mathbb{Q}0$，则

- (i) Albanese 映射 $X\to\operatorname{Alb}(X)$ 是满的、纤维连通的态射；
- (ii) 存在 étale 态射 $A'\to\operatorname{Alb}(X)$、射影对数簇 $(F,B_F)$ 与 $A'$ 上方的同构

$$(F,B_F)\times A'\ \overset{\sim}{\longrightarrow}\ (X,B)\times_{\operatorname{Alb}(X)}A'.$$

证明（`main.tex:1769-1822`）。(i)：设 $\alpha_X$ 的 Stein 分解为 $X\overset f\to Y\overset\pi\to A=\operatorname{Alb}(X)$。$f$ 是收缩且 $K+B\sim_\mathbb{Q}0$，故 $f\colon(X,B)\to Y$ 是 lc-trivial fibration 且

$$K_{Y}+\mathbf B_{Y}+\mathbf M_{Y}\sim_\mathbb{Q} 0.$$

$\pi$ 在像上有限，故 $Y$ 的任何消解有非负 Kodaira 维（\[Ueno\] Theorem 10.3），于是 $K_Y$ 与某个有效 $\mathbb{Q}$-Weil 除子 $\mathbb{Q}$-线性等价；$\mathbf B_Y$ 因 $B$ 有效而有效；$\mathbf M_Y$ 因 $\kappa(\mathbf M)\ge0$ 而 $\mathbb{Q}$-线性等价于有效 $\mathbb{Q}$-Weil 除子。三者之和 $\mathbb{Q}$-线性等价于 0 且各项有效，故

$$K_{Y}\sim_\mathbb{Q} 0,\qquad\mathbf B_{Y}=0,\qquad\mathbf M_{Y}\sim_\mathbb{Q} 0,$$

第三式加上"$\mathbf M$ b-nef and good"给出 $\mathbf M\sim_\mathbb{Q}0$（`main.tex:1769-1791`）。由 Inversion of Adjunction，$Y$ 有 klt 奇点且 $K_Y\sim_\mathbb{Q}0$；index one cover $\tilde Y\to Y$ 有典范奇点且 $K_{\tilde Y}\sim0$，故按 \[Ueno\] Theorem 10.3，$\tilde Y$（从而 $Y$）映到 $A$。$\pi$ 在余维 1 处 étale，因为分歧除子满足

$$0\le R=K_{Y}-\tau^{*}(K_{A})\sim_\mathbb{Q} 0,$$

素材在此处把 $\pi$ 写作 $\tau$（`main.tex:1798-1800`），是字母混用；由于分歧除子既有效又 $\mathbb{Q}$-线性等价于 0，它必须为 0。$A$ 光滑故 $\pi$ 处处 étale，于是 $Y$ 是 Abelian 簇，按 Albanese 映射的泛性质 $\pi$ 是同构（`main.tex:1800-1804`）。

(ii)：$\alpha_X\colon(X,B)\to A$ 是 lc-trivial fibration 且 $\mathbf B_A=0$、$\mathbf M\sim_\mathbb{Q}0$。定理 \[str\] 给出在余维 1 étale 的有限态射 $\tau\colon A'\to A$，使 $(X,B)\times_AA'$ 在 $A'$ 的一般点上方与 $(F,B_F)\times A'$ 同构；$A$ 光滑故 $\tau$ 处处 étale；再由 $\mathbf B_A=0$ 与 $A'$ 光滑，命题 \[extend\] 把同构扩到整个 $A'$（`main.tex:1806-1821`）。

### 7.9 文献表中的关键前作

素材参考文献（`main.tex:1829-2000`）里，被反复调用的三篇作者前作逐字为：\[thesis\] "The Adjunction Conjecture and its applications"，preprint math.AG/9903060（`main.tex:1834-1838`）；\[BP\] "Shokurov's boundary property"，preprint math.AG/0210271（`main.tex:1840-1843`）；\[NM\] "Nef dimension of minimal models"，preprint math.AG/0301305（`main.tex:1845-1848`）。此外 \[minit\] 是 Kawamata 的 J. Reine Angew. Math. 363 (1985) 论文，\[koddim\] 是 J. Fac. Sci. Univ. Tokyo 30 (1983)，\[sba\] 是 Amer. J. Math. 120 (1998) 的 subadjunction II（`main.tex:1920-1941`）。本稿判断：定理 \[klglobal\] 与 \[torsion\] 的"可移植部件"是命题 \[cc\] 与命题 \[num\]，后续文献若要把结论推广到基域为正特征或非代数闭情形，卡点在 \[Ka81\]、\[Griffiths\]、Schmid 扩张这三处超越工具。

## 8 与本语料的接缝

本语料中引用本文的稿号与 bib key 在 §0 已原样登记，此处给出对接表：左列是本语料的稿号与 key，中列是该类引用通常会调用的本文结论，右列是本稿中该结论的公式级位置与需要复核的假设。本稿没有去读这些稿，中列内容按 key 的语义与本文定理的对应关系给出，说明的是"引用方应当从本文取走什么"。

| 稿号 | bib key | 可取用的本文结论 | 本稿位置 | 复核点 |
| --- | --- | --- | --- | --- |
| D307 | `AmbroModuli` | 定理 \[klglobal\]：几何一般纤维射影且 $B_{\bar\eta}$ 有效时 $\mathbf M$ 是 b-nef and good，即在某个收缩 $h\colon Y'\to Z$ 下 $\mathbf M_{Y'}\sim_\mathbb{Q} h^*A$（$A$ nef and big） | §5.5（`main.tex:1093-1205`） | 需要"几何一般纤维射影"与"$B_{\bar\eta}$ 有效"两条同时成立；引用为"$\mathbf M$ 半正"是过度陈述，本文只给 b-nef and good |
| D307 | `AmbroModuli` | 定理 \[torsion\]：b-数值平凡的模子是挠，$\mathbf M\sim_\mathbb{Q}0$ | §6.3（`main.tex:1264-1281`），核心是 §6.1 的命题 \[num\] | 使用需先经 \[BP\] Lemma 5.1 的有限底变换把族做成半稳定，再取 $\mathcal O_Y(\mathbf M_Y)\subset h_*\omega_{V/Y}$ 的直和项结构 |
| D307 | `AmbroModuli` | lc-trivial fibration 的三条件定义与 $\mathbf B,\mathbf M$ 的存在性、b-nef 性（Kawamata \[sba\]、\[BP\] Theorem 0.2） | §5.1-§5.2（`main.tex:1007-1033`） | 分解式 $K+B\sim_\mathbb{Q} f^*(K_Y+B_Y+M_Y)$ 与 b-除子记法 $\overline{\mathbf M_{Y'}}$ 的约定 |
| D476 | `AmbroCBF` | 命题 \[bc\]：模子 b-除子与底变换交换，$\varrho^*\mathbf M=\mathbf M'$ | §5.3（`main.tex:1035-1079`） | 该命题对任意满态射 $\varrho\colon Y'\to Y$ 成立，包含非 generically finite 情形，依据是典范扩张与底变换交换；若引用方需要"对有限覆盖取迹"的版本，须另查 \[thesis\] Theorem 3.2（`main.tex:1070-1072`） |
| D476 | `AmbroCBF` | 定理 \[ak\] 型推论与 §7.1 的 $\omega\sim_\mathbb{Q} K_Y+B_Y$；§7.2 的 $K+B\equiv0\Rightarrow K+B\sim_\mathbb{Q}0$；§7.8 的 Albanese 有限 étale 平凡化 | §1.5、§7.1、§7.2、§7.8 | 这三条都把 $\mathbf M_Y$ 换成有效代表 $E$ 并要求 $\mathbf M$ 已下降到所取的模型；若引用方只知 b-nef 而未固定下降模型，论证会断 |
| D476 | `AmbroCBF` | 命题 \[aut\]：$\kappa(X,K+B)\ge0$ 时 $\operatorname{Aut}^0(X,B)$ 是 Abelian 簇；定理 \[str\]：$\mathbf B_Y=0$ 且 $\mathbf M\sim_\mathbb{Q}0$ 时在余维 1 étale 的有限 Galois 覆盖上平凡化 | §7.6、§7.7（`main.tex:1546-1752`） | 定理 \[str\] 的纤维约化论证 $1\le\min_i\frac{1-\operatorname{mult}_{E_i}(B)}{m_i}\le\frac1{m_i}$ 只在曲线底上成立，搬到高维底需先用 §7.7 第 (1) 段的"大开集"处理 |

三条读法提示。第一，本文全部正性结论的解析源头是命题 \[cc\](2) 与 (4)（§3.3）：$\Theta_i=-(\sigma^i)^*\wedge\sigma^i$ 给出 Griffiths 半正，Schmid 扩展给出 $\det$ 的 nef 性与自交积分；引用方若改用其它半正性来源（例如直接对 $f_*\omega$ 用 curvature formula），必须复核本征分解是否仍存在。第二，命题 \[ky\] 的同核等式 $\operatorname{Ker}(\kappa_s)=T_{\Phi^{-1}(\Phi(s)),s}$（§4.2）是把"模子退化"翻译成"族在周期纤维上局部平凡"的唯一通道，引用定理 \[kl\] 时若底空间本身已给定、不允许再作 generically finite 底变换，则只能得到 $\bar Y$ 上的结论，这是 b-除子语言存在的原因。第三，§7.5 的 DuVal 曲面算例是检验任何"两个 b-除子都零则映射是同构"式断言的标准反例，引用方若把定理 \[str\] 的结论写成"$X$ 双有理于乘积"，应连同 $\tau$ 在余维 1 étale 且底光滑时处处 étale 这两条一起搬。

### 8.1 更正与登记

本稿自查与制作过程中的登记事项，逐条列出：

1. 素材自身的四处笔误已在正文就近标注，本稿不改写源文：命题 \[num\] 结论中的 $\mathcal O_X$ 按上下文应为 $\mathcal O_Y$（`main.tex:1218`，§6.1）；§7.1 证明里 $\sigma^*(K_Y+B_Y)=K_{Y'}+\mathbf B_{Y'}+E\sim\sigma^*\omega$ 的不带下标 $\sim$ 应为 $\sim_\mathbb{Q}$（`main.tex:1340`）；定理 \[str\] 的条目编号跳过 (ii)（`main.tex:1623-1627`），其第 (3) 段中"由 (ii)"实际指假设 $\mathbf M\sim_\mathbb{Q}0$；§7.8 证明里把 Stein 分解的 $\pi$ 写作 $\tau$（`main.tex:1798-1800`）。
2. §0 首次落盘时把取证通读轮次写作"五次"，实际为十次（同一组行区间读满两轮，单次不超过 400 行），已就地更正；其余登记数据（arXiv id、原题名、作者、发表年月、素材字节与行数、引用稿号与 key）与派单一致，未改。
3. 本稿正文的记法已全部换算到 KaTeX 词表：素材宏 `\Q,\Z,\C,\calO,\bB,\bM,\Aut,\Alb,\Sing,\Supp,\mult,\Ext,\Hom,\Ker,\Gal,\codim,\trace,\rank,\Spec,\Isom,\lct,\NEF` 等在正文中一律写作展开形式，素材原宏名只在 §0 的换算表与反引号代码段中出现。
4. 素材的 `\label`、`\ref`、`\cite` 键名未搬入正文；定理与命题以 \[klglobal\]、\[torsion\]、\[cc\]、\[ky\] 这类带方括号的素材标签缩写作指代，均已在 §0 说明编号还原规则。
