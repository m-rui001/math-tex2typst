<!-- 恢复副本：由 transcript agent-ageneral-purpose-43f5727da3aa401d.jsonl 重放 Write/Edit 序列重建（2026-10-08 18:05）。原稿被重复派遣的 agent 用 Write 覆盖丢失。 -->
# D45 Auslander–Reiten 猜想的显式反例：我把两个扭转的差做成删 Ext 的刀

对象论文：`An explicit counterexample to the Auslander--Reiten conjecture`（OpenAI，2026-09-23）。
TeX 源码：`E:\math\preprints\An-explicit-counterexample-to-the-Auslander-Reiten-conjecture-September-23-2026\build\`，共 11 个 tex 文件：`main.tex`（72 行）、`01-introduction.tex`（268 行）、`01-stable.tex`（67 行）、`02-conversion.tex`（308 行）、`03-algebra.tex`（234 行）、`04-resolution.tex`（246 行）、`05-cones.tex`（323 行）、`06-lift.tex`（286 行）、`07-branches.tex`（233 行）、`08-consequences.tex`（79 行）、`09-cochain.tex`（126 行，附录）。
Lean：`E:\math\lean\OAI\Algebra\AuslanderReiten\`（732 个文件、55531 行、19 个子目录），comparator 配置 `ComparatorChallenges\AuslanderReiten.json`，被认证的声明是 `OAI.ArExplicit.Statement.main`（题面占位文件 `ComparatorChallenges\AuslanderReiten.lean`，77 行）。
`E:\math\reasoning_traces\` 里没有本篇的任何 summary，所有"当时我怎么想"的路线重构一律标 [推测]，依据只有 tex 正文的防御性措辞、行号顺序和 Lean 模块的切分方式。

行文里引论文按 `文件缩写:行号`：`01i` = 01-introduction，`01s` = 01-stable，`02` = 02-conversion，`03` = 03-algebra，`04` = 04-resolution，`05` = 05-cones，`06` = 06-lift，`07` = 07-branches，`08` = 08-consequences，`09` = 09-cochain。

记号约定与论文一致：$\kk=\mathbb F_2(q,H_1,H_2)$，$q,H_1,H_2$ 代数无关；$D\,V=\Hom_\kk(V,\kk)$；$R^e=R\otimes_\kk R^{\mathrm{op}}$；复形按同调指标，$P[a]_i=P_{i-a}$；$\stHom RMN$ 是模掉过投射分解的 stable Hom；$C$ 十维代数、$T=C\ltimes DC$、$A=T\otimes T$、$X=s\otimes s$、$\mathcal C$ 双锥、$U_H$ 右扭转、$F$ 有限纤维、$v$ 对角稳定映射、$\Lambda=\binom{A\ 0}{F\ A}$、$Z$ 终点模块。特征 2 把所有微分、平移、互换的符号统一成加号（`01s:16-17`）。

## 0 我进场时手里有什么

猜想本体（`01i:3-7`）：

```tex
The Auslander--Reiten conjecture asks whether a finitely generated module
$M$ over an Artin algebra $R$ must be projective when
\begin{equation}\label{eq:arc}
 \Ext_R^i(M,M\oplus R)=0\qquad\text{for every }i>0.
\end{equation}
```

我进场先做的第一件事是把量化顺序钉死：$i$ 跑遍**全部**正整数，$M\oplus R$ 拆成两个条件 $\Ext^i(M,M)=0$ 与 $\Ext^i(M,R)=0$，两支都必须在每个 $i>0$ 消失。这个"每一度、两支全灭"的口径后面反复被论文拿来和文献区分（`01i:99-101`：both summands in (1) must vanish in every positive degree，以及 `01i:119-124` 的 Böhmler-Marczinzik 例子只做到 $\Ext^1,\Ext^2$ 消失而 $\Ext^3\ne0$）。我读这段时给自己立的第一个警戒就是：任何"最终消失"或"有限区间消失"的成果都不算数。

主定理（`01i:26-38`）：

```tex
\begin{theorem}\label{thm:main}
Let $\kk=\mathbb F_2(q,H_1,H_2)$, where $q,H_1,H_2$ are algebraically
independent. There exist a finite-dimensional $\kk$-algebra $\Lambda$
and a finite-dimensional nonprojective left $\Lambda$-module $Z$ such that
\[
 \Ext^i_\Lambda(Z,Z)=0=\Ext^i_\Lambda(Z,\Lambda)
 \qquad\text{for every integer }i\geq1.
\]
The module $Z$ is Gorenstein-projective. The semisimple quotient is
$\Lambda/\rad\Lambda\simeq\kk^8$, so the algebra is split with eight
isomorphism classes of simple modules; also $\rad(\Lambda)^4\ne0$.
These conclusions persist after every field extension of $\kk$.
\end{theorem}
```

"显式"两个字我一开始读成营销词，读完 11 个文件后改口：它的对立面是那种"由非构造性论证存在某维度某组合满足条件"的反例。这篇论文把反例的全部数据摊开：$C$ 的 10 个基向量和完整的乘法表（`03:14-33`），三次数上循环 $p$ 的 179 条表项（`09:17-41`），消解的微分写成逐度显式公式 $a\ell_i$（`04:30-35`），$\delta^a$ 的比较矩阵写成 $2\times2$ 的标量张量恒等（`01i:181-184`）。更硬的一层是参数：$q$ 负责把核的公式在所有度数上统一（`01i:43-44`：The powers of $q$ give an infinite resolution with uniform kernel formulas），$H_1/H_2$ 的乘法阶无穷负责让一族行列式在**每个** $m>0$ 非零。这两个分工我在台账节逐项登记。

为什么我进场就觉得对称或自内射情形最容易失守：$R$ 自内射时投射模都是内射模，$\Ext^i(M,R)=0$（$i>0$）自动成立，两支条件塌缩成一支，这就是 Tachikawa 第二猜想（`01i:126-127`：Tachikawa's second conjecture is the self-injective case of (1)）。塌缩意味着反例的门槛低一半；同时正例区（根立方零、weakly symmetric 分类）也恰恰最稠密，说明这一侧的"易"是双向的。Enomoto 的归约（`01i:127-131`）把这个张力写得更明白：若 $R$ 的二重平凡扩张上 Tachikawa 第二猜想成立，则 $R$ 上 AR 猜想成立。归约方向告诉我们：想证 AR，代价是把问题搬到自内射世界；想否 AR，理论上一个自内射反例就够了。

与 D18（Tachikawa 第二猜想反例，同一天、同作者、同基域）的分工，我按本篇 intro 的自述来摆（`01i:48-56`）：

```tex
The final algebra is triangular and noncommutative. The companion article
\cite[Theorem~1.1 and Corollary~1.2]{OpenAITachikawa2026} constructs a
symmetric counterexample over the
same field by a different bimodule construction and a transfer requiring
control of negative complete self-extensions, and develops the
homological consequences of its associated endomorphism algebra.
The contribution here is
the explicit eight-simple Gorenstein-projective example and its persistence
under every field extension. Each paper contains its own complete proof.
```

所以那条线的分工是：D18 攻自内射情形，终点代数对称，$\Ext(M,A)$ 一支免费，但要用"负完全自延伸"这种两侧无界的机器把转移做穿；本篇攻一般的 Artin 代数情形，终点代数 $\Lambda$ 是三角的、非自内射的，$\Ext^i(Z,\Lambda)$ 这一支不再免费，必须像定理陈述里那样"separately"地靠完全正合性去挣（`01i:145-146`：Total acyclicity separately gives the vanishing of Ext into $\Lambda$）。对称性在两边的角色也不同：D18 里对称是终点属性；本篇里对称只是脚手架，$T$、$A$ 对称用来保证投射即内射、稳定范畴三角化，搭完就拆，$\Lambda$ 本身不要求任何对偶对称。同一个平凡扩张 $C\ltimes DC$ 在两篇里都出现，但本篇只用它做度数搬运（把 $\Ext^2_C(s,C)$ 变成 $\Ext^3_T(s,s)$），不消费负度数。[推测] 两篇同日发布且互引完整证明，多半是 D18 的先例让"两支消失"的完整陈述成为必须：自内射反例对 AR 的逻辑效力要靠"自内射蕴含第二支自动"这条捷径，而 AR 猜想的忠实反例应当落在捷径失效的地方，也就是非自内射代数上，还要顺带扛住标量扩张。这个动机分工我只在本篇文本内自洽地重构，不借用 D18 的任何论证。

## 1 主线草图与三条死路

先登记 [推测] 的初始方案。我拿到题面的第一个本能是"把 D18 的对称代数 $\Lambda_{18}$ 直接改名当本篇的 $\Lambda$"：它上面已经有非投射的自正交模 $M$，自内射让 $\Ext^i(M,\Lambda_{18})$ 免费，两支齐活，一篇论文的引言里也确实承认这样的例子对 AR 有效（`01i:56` 的 Each paper contains its own complete proof 暗示两边的反例各自完备，但没说彼此不可互用）。这条路我推演了几小时就放弃，理由是我在 intro 的两个被强调的差异上撞墙：其一，"persist after every field extension"（`01i:37`、`01i:55-56`）是定理的一等公民，我必须先有把消失条件在标量扩张下逐度搬回的机制（`08:52-63` 的 $K\otimes\Ext\simeq\Ext_K$ 逐度同构），而自内射例子里负度数机器在扩张下重新验证是另一整套账；其二，$Z$ 被要求 Gorenstein-projective 且代数有八个单（`01i:34-36`），GP 支在自内射世界是平凡的（所有模都 GP），把"也否定 Gorenstein-projective 猜想"（`01i:18-24`，Luo-Huang 的问题，环境代数不假设 Gorenstein）变成有内容的主张，恰恰需要 $\Lambda$ 不是自内射的。[推测] 这两条差异合起来把我推向一个非自内射的构造，而三角矩阵代数是最省事的非自内射扩展。

第二条 [推测] 死路：直接给一个根指数低、Ext 代数可控的代数硬算。这条路被文献封死得最干净：Huneke-Sega-Vraciu（交换根立方零 Artin 局部环，`01i:82-83`）、Ringel-Zhang（分裂局部、$\rad^3=0$，甚至只假设 $\Ext(M,R)$ 消失就给 $\Ext^1(M,M)\ne0$，`01i:84-87`）、Zhang-Zhou（分裂 $\rad^3=0$ 全部，`01i:88-90`）。这些正例的口径全部踩在 $\rad^3=0$ 上，所以我的代数必须 $\rad^4\ne0$，论文在 `01i:93-94` 用 forward reference 精确回应了这一点："The algebra constructed here has nonzero fourth radical power, as proved in Proposition \ref{prop:radical}"。这在我读来是一句防守：作者知道审稿人会拿根立方零正例来问，于是把 $\rad^4\ne0$ 写进定理陈述当免责声明。

第三条 [推测] 死路：拿 Schulz 1995 的参数平移例子（`01i:103-107`）直接升级。他给出量子外代数上二维模，syzygy 沿参数族移动、自延伸最终消失、但 $\Ext^1\ne0$。Xia 2026 又证明了量子完全交叉上 AR 成立，Schulz 的代数正好是量子外代数（`01i:115-117`），所以在这个代数本体上加码没有出路。本篇实际采纳的是 Schulz 的**机制**，并非他的**代数**：$eCe$ 恰好是参数为 $q$ 的量子外代数（`03:64-66`），$fCe$ 在 $q^{-1}$ 参数下正是 $(x+y)R$ 的一阶 syzygy（`03:69-74`），本篇把同一个平移装进十维代数 $C$，再装上两层（张量平方），"then remove every positive self-extension by two independent twists"（`01i:108-109`）。读到这里主线的形状才浮出来：保留无限周期消解（这是 $q$ 的职务），然后用一个有限的、可以写成矩阵的线性代数去一次性删光所有正 Ext（这是 $H_1,H_2$ 的职务）。

最后是方法论的定调，`01i:137-147`：

```tex
The proof has two parts. First we give a conversion principle: a
suitable stable map $v:X\to F\otimes_A X$ over a symmetric algebra
$A$ produces a module over
\[
 \Lambda=\begin{pmatrix}A&0\\F&A\end{pmatrix}.
\]
Its positive self-extensions are controlled by the difference between
the actions of a self-extension of $X$ on the two sides of $v$.
Total acyclicity separately gives the vanishing of Ext into $\Lambda$.
This principle is stated and proved before the example, so the
subsequent construction has an explicit target.
```

我先写刀再找靶。转换原理（第 2 节）把整个反例构造压缩成一个规格：造 $A,F,X,v$，使一族映射 $\delta^a:\stHom AXX[a]^{\oplus2}\to\stHom A{FX}{(FX)[a]}$ 在 $a=0$ 满且核非零、在 $a>0$ 同构。之后的每一节（03 到 07）都在偿还这份合约。这个"先引理后构造"的编排本身是信息：作者在写第二篇同域论文，两个反例共享的机器被提到公用的位置，[推测] 这是为了让本篇的构造可以完全脱离 D18 独立成篇。

## 2 转换原理：两张稳定作用到有限模（02:28-59）

(a) 逐字陈述（`02:28-59`）：

```tex
\begin{proposition}[Triangular conversion]\label{conv:proposition}
Let $A$ be a finite-dimensional symmetric algebra over a field $\kk$
of characteristic two, let $F$ be a finite $A$-bimodule projective on
both sides, and let $X$ be a finite left $A$-module.  Suppose
$v\in\stHom{A}{X}{FX}$.  For each integer $a$, put
\[
 H^a=\stHom{A}{X}{X[a]},\qquad
 K^a=\stHom{A}{X}{(FX)[a]},
\]
and define
\begin{equation}\label{conv:delta}
 \delta^a:H^a\oplus H^a\longrightarrow K^a,
 \qquad (g,j)\longmapsto F(g)v+v[a]j.
\end{equation}
Assume that $\delta^0$ is surjective with nonzero kernel and that
$\delta^a$ is an isomorphism for every integer $a>0$.

Choose an actual map $v_0:X\to FX$ representing $v$ and an embedding
$i:X\to Q$ into a finite projective $A$-module.  Define
\begin{equation}\label{conv:finite-module}
 \Lambda=\begin{pmatrix}A&0\\F&A\end{pmatrix},\qquad
 Y=(FX\oplus Q)/\{(v_0(x),i(x)):x\in X\},\qquad
 Z=(X,Y,\iota),
\end{equation}
where $\iota:FX\to Y$ is induced by the first summand and specifies
the structure map of the left triangular module.  Then $Z$ is a finite
nonprojective Gorenstein-projective left $\Lambda$-module and
\[
 \Ext^a_\Lambda(Z,Z)=0=\Ext^a_\Lambda(Z,\Lambda)
 \qquad\text{for every integer }a>0.
\]
\end{proposition}
```

(b) 推导补全。左模写成三元组 $(M,N,\eta)$ 是三角代数的标准记法，作用 $\binom{a\ 0}{f\ b}(m,n)=(am,\eta(f\otimes m)+bn)$，态射条件 $\beta\eta=\eta'(F\otimes\alpha)$（`02:19-26`）。第一步先确认 $Y$ 的有限性：$i$ 单，所以由 `\{(v_0(x),i(x))\}` 商掉后得到短正合列 $0\to FX\xrightarrow{\iota}Y\to Q/i(X)\to0$（`02:168-170`），$\dim_\kk\Lambda=2\dim_\kk A+\dim_\kk F$（`02:174`）。第二步是两个列函子 $E(M)=(M,FM,\id)$、$J(N)=(0,N,0)$：$E$ 正合因为 $F$ 右投射，$J$ 直接正合；都保持有限投射，因为 $\Lambda=E(A)\oplus J(A)$。四 Hom 公式（`02:186-192`）我逐项核对过：$\Hom_\Lambda(E(M),E(M'))\simeq\Hom_A(M,M')$（下分量被 $\alpha$ 的 $F$-像强制），$\Hom_\Lambda(J(N),J(N'))\simeq\Hom_A(N,N')$，$\Hom_\Lambda(E(M),J(N))=0$（上分量为 0 后态射条件自动），$\Hom_\Lambda(J(N),E(M))\simeq\Hom_A(N,FM)$（只有下左角的 $F$ 槽能携带信息）。

第三步造完全消解。取 $X$ 的完全消解 $P_\bullet$ 且 $P_{-1}=Q$、$d_0=i\epsilon_P$：对称性保证可以把投射消解和投射-内射余消解焊接起来（`02:198-201`）。令 $G_0=E(P_\bullet)$、$G_1=J(P_\bullet)$，逐项投射且正合。验证完全正合：$\Hom_\Lambda(G_0,\Lambda)\simeq\Hom_A(P_\bullet,A)$、$\Hom_\Lambda(G_1,\Lambda)\simeq\Hom_A(P_\bullet,F)\oplus\Hom_A(P_\bullet,A)$（`02:207-211`），这里 $F$ 与 $A$ 作为**左** $A$-模都投射-内射（$F$ 左投射是假设，左内射因为对称代数中投射即内射），所以复形正合。$P_Z=\Cone(V)$，$V:G_1\to G_0$ 是 $v_0$ 的提升链映射，逐项 $(P_Z)_j=(G_0)_j\oplus(G_1)_{j-1}$，微分 $\binom{d^{G_0}\ V}{0\ d^{G_1}}$；逐项分裂的锥序列给出 $P_Z$ 完全正合（`02:231-237`）。算零度 coker：上分量 $X$，下分量的关系先由 $F\otimes d_1$ 商出 $FX$，再商掉 $(v_0(x),i(x))$，恰好是 $Y$，结构映射 $\iota$（`02:239-246`）。

第四步是全文的心脏：$\End$ 复形的长正合列。逐度短正合 $0\to\Hom^\bullet(G_1[1],G_0)\to\End^\bullet(P_Z)\to\End^\bullet(G_0)\oplus\End^\bullet(G_1[1])\to0$（`02:252-259`），斜向块为 0 因为 $\Hom_\Lambda(E,J)=0$ 逐项成立。用第 3 节的比较引理，$H^a\End^\bullet(G_0)\simeq H^a$、$H^a\End^\bullet(G_1[1])\simeq H^a$、$H^a\Hom^\bullet(G_1[1],G_0)\simeq K^{a-1}$（指标移位：$H^a\Hom^\bullet(G_1[1],G_0)=H^{a+1}\Hom^\bullet(G_1,G_0)=K^{a+1-1}$，等等，注意 `02:264-266` 的写法是 $H^a\Hom^\bullet_\Lambda(G_1[1],G_0)=K^{a-1}$，我核对：$G_1[1]$ 把 cokernel 挪一位，$\Hom(G_1,G_0)$ 的 $a+1$ 度上同调对 $K^a$，故 $\Hom(G_1[1],G_0)$ 的 $a$ 度对 $K^{a-1}$，一致）。连接映射 $\ker(H^a\oplus H^a)\to\ker$ 方向的对角块到斜向块：对角提升 $(\tilde g,\tilde j)$ 的微分的交叉项是它两侧与 $V$ 的合成，$E$-对角用 $F(g)$ 作用、$J$-对角用 $j$ 前合成，合起来正是 $F(g)v+v[a]j$（`02:267-273`）。于是有逐度短正合列

$$0\longrightarrow\coker\delta^{a-1}\longrightarrow H^a\End^\bullet_\Lambda(P_Z)\longrightarrow\ker\delta^a\longrightarrow0\qquad(\texttt{02:277-281}).$$

$a=1$：两端是 $\coker\delta^0=0$（满射假设）和 $\ker\delta^1=0$（$a=1$ 同构假设），中间 $\Ext^1_\Lambda(Z,Z)=0$ 被两个假设夹死，这就是 `02:304-308` 那句"surjectivity at degree zero is needed separately: it is the term that removes a possible self-extension in degree one"的全部含义。$a>1$：两端各自归零因为 $\delta^{a-1},\delta^a$ 都是同构。$a=0$：$H^0\End^\bullet_\Lambda(P_Z)$ 满射到 $\ker\delta^0\ne0$，由比较引理这是 $Z$ 的一个非零稳定自同态；论文再走一步逻辑：若稳定恒等 $\id_Z=0$，则 $Z$ 投射且一切稳定自同态为零，与存在非零元矛盾，故 $\id_Z\ne0$，$Z$ 非投射（`02:288-293`）。第二支 $\Ext^a_\Lambda(Z,\Lambda)=0$：完全正合复形的 Hom 对偶列正合，其正度上同调在非负消解尾部算 Ext 进 $\Lambda$，全零（`02:295-297`）；顺带 $Z=\im d_0=\ker d_{-1}$ 在同一复形里，GP 定义直接满足。

(c) 假设与参数的机械理由。$A$ 对称：三处消费。第一处是 $P_{-1}=Q$ 的完全消解构造（需要嵌入投射，投射即内射保证余消解也是投射的）；第二处是 $\Hom_A(P_\bullet,F)$ 正合（$F$ 左投射-左内射）；第三处是稳定范畴的三角化结构（第 5 节对偶）。若 $A$ 只 Gorenstein 不对称，$E(P_\bullet)$ 的 $\Hom(-,\Lambda)$ 列不再自动正合。$\mathrm{char}=2$：比较引理里 $(\partial f)_j=d f+f\,d$ 无符号、锥的指标整理、$v[a]j$ 的复合符号（`02:68`、`02:75-76`）。$F$ 双侧投射：$F\otimes_A-$ 正合（右投射）且保持投射（左投射），于是它诱导稳定范畴函子并与平移交换（`02:11-16`、`01s:62-67`），$F(g)$、$v[a]j$ 这些记号才有意义；双侧投射严格弱于 $A^e$-投射（`01s:66-67` 明确声明），后面纤维的构造只给得出双侧。$\delta^0$ 满且核非零：满删 $\Ext^1$，非零核给非投射性；两者在维数上天然配套，因为最终构造里 $H^0=K^0=\kk$，$(g,j)\mapsto(c+d)v$ 的矩阵 $(1\ 1)$ 满、核是对角线（`07:199-201`），任何想要 $\delta^0$ 同构的变体都会在维数 $2\to1$ 处失败。$i:X\to Q$ 是嵌入：$Y$ 里商掉图 $\{(v_0(x),i(x))\}$ 要同时编码 $v$ 的作用（第一槽）和非投射性的种子（第二槽的 $i$），$i$ 单保证 $0\to FX\to Y\to Q/i(X)\to0$ 正合。

(d) [推测] 失败路线。其一：跳过转换原理，直接在 $\Lambda$ 上逐度硬算 $Z$ 的 Ext。失败机制是双重的：$\Lambda$ 的投射消解要按四块矩阵逐度构造，而 $F$ 是本构造的末端产物（第 13 节的纤维），它不是自由双模，逐度计算会在每个 $a$ 产生一个需要独立控制的复形上同调；没有 $\delta^a$ 的"两张作用之差"框架，就没有把无穷多度数同时删光的杠杆，只能删有限度。其二：把 $\Lambda$ 换成别的扩展（比如把 $F$ 做成 $A$-双模的平凡扩张 $A\ltimes DF$）。失败机制：平凡扩张立刻把 $\Lambda$ 变自内射，第二支 $\Ext(Z,\Lambda)$ 虽然免费，但整个反例就退回 D18 的领地，GP 支和标量扩张支的陈述（定理里的一等公民）失去内容，`01i:54-56` 的贡献声明无法兑现。其三：让 $\delta^0$ 只是单射非满射（省一步构造）。失败机制：$\Ext^1_\Lambda(Z,Z)$ 里多出 $\coker\delta^0\ne0$ 这一项，猜想条件要求每一度包括 $a=1$，一步都不能让；`02:304-308` 专门写这句话就是防这个。

## 3 完全消解比较引理（02:78-101）

(a) 逐字陈述（`02:78-101`）：

```tex
\begin{lemma}[Complete-resolution comparison]\label{conv:comparison}
Let $R$ be a finite-dimensional algebra over a field of characteristic
two.  Let $P_\bullet$ be a totally acyclic complex of finite projective
left $R$-modules, and let $Q_\bullet$ be an exact complex of finite
projective left $R$-modules.  Put
\[
 C_j(P_\bullet)=\coker(d^P_{j+1}:P_{j+1}\to P_j),\qquad
 M=C_0(P_\bullet),\qquad N=C_0(Q_\bullet).
\]
There are natural, composition-compatible identifications
\[
 H^0\Hom_R^\bullet(P_\bullet,Q_\bullet)
       \simeq\stHom{R}{M}{N}.
\]
Applying this identification to shifted complexes gives, for every
integer $a$,
\begin{equation}\label{conv:shift-comparison}
 H^a\Hom_R^\bullet(P_\bullet,Q_\bullet)
 \simeq\stHom{R}{C_a(P_\bullet)}{N}
 \simeq\stHom{R}{M}{C_{-a}(Q_\bullet)}.
\end{equation}
For every integer $a>0$, these groups are naturally
$\Ext_R^a(M,N)$.
\end{lemma}
```

(b) 推导补全。全 Hom 复形的定义（`02:63-69`）：$\Hom_R^a(P,Q)=\prod_{j\in\mathbb Z}\Hom_R(P_j,Q_{j-a})$，$(\partial f)_j=d^Q_{j-a}f_j+f_{j-1}d^P_j$，我核对过符号：特征 2 里加号就是减号，所以这就是标准 $\partial=d\circ f+(-1)^{|f|}f\circ d$ 的特例；上cocycle 是链映射 $P\to Q[a]$，coboundary 是零伦缩，与 `02:73-74` 一致。核心引理是扩展性质（`02:104-111`）：完全正合性给出 $\Hom_R(P,T)$ 对每个有限投射 $T$ 正合，于是任何 $\phi:\im d^P_j\to T$ 可扩到 $P_{j-1}$：$\phi d_j:P_j\to T$ 是 $\Hom_R(P,T)$ 的 cocycle，正合给 $\psi$ 使 $\psi d_j=\phi d_j$。论文特意注明这步不假设投射即内射（`02:111`），它只消费 $P$ 的完全正合，$R$ 可以是任意有限维代数。

单射方向（链映射给出 cokernel 映射）显然。满：给 $u:M\to N$，先提升 $u\epsilon_P$ 到 $f_0:P_0\to Q_0$（$P_0$ 投射），向上递归 $d^Q_jf_j=f_{j-1}d^P_j$（投射消解的标准提升），向下走要用扩展性质：$d^Q_0f_0$ 杀死 $\im d^P_1=\ker d^P_0$，诱生 $\im d^P_0\to Q_{-1}$，扩到 $f_{-1}:P_{-1}\to Q_{-1}$，如此无穷向下。这构造出一个**全**比较映射，两侧都无界。零伦缩方向：$f_j=d^Q_{j+1}h_j+h_{j-1}d^P_j$ 在 cokernel 上第一项落进 $\im d^Q$（商掉为零），第二项过 $P_{j-1}$（投射分解）。反过来，若诱导映射过投射 $M\xrightarrow{a}T\xrightarrow{b}N$：$a$ 用扩展性质从 $\im d^P_0$ 扩到 $P_{-1}$，$b$ 提升到 $Q_0$，合成是 $h_{-1}$，其边界恰是该分解；减掉后归约为"零于 $M$ 的链映射 $f'$ 可零伦缩"：向上取 $h_0$ 使 $d^Q_1h_0=f'_0$，残量逐度提升；向下 $h_{-1}=0$ 起步，残量 $f'_j+d^Q_{j+1}h_j$ 在 $j+1$ 的方程成立时杀死 $\im d^P_{j+1}$，降到 $\im d^P_j$ 再用扩展性质（`02:133-146`）。每步只定一个分量、只动相邻方程，这就是全 Hom 用 $\prod$ ，并非 $\bigoplus$ 的原因：逐度递归造出的 $h$ 可能有无穷多个非零分量（`02:70-72`，引 Veliche 的积约定）。

Ext 识别（`02:150-157`）：$a>0$ 时 $C_a(P_\bullet)$ 是 $M$ 的第 $a$ 阶 syzygy，$\Ext^a_R(M,N)$ 按投射消解定义是 $\Hom_R(C_a(P),N)$ 模掉可扩到 $P_{a-1}$ 的映射；"可扩到 $P_{a-1}$"蕴含过投射，反过来过投射的分解用扩展性质扩回来，两个商一致，$a=1$ 也在这条论证内（这句包括当 $a=1$ 是防御性强调，因为 $a=1$ 时 syzygy 是 $\im d^P_0$，扩展性质直接适用）。

(c) 假设与参数的机械理由。$P$ 完全正合、$Q$ 只需正合：$P$ 的向下无限提升消费 $\Hom_R(P,T)$ 的正合（这是完全正合对投射 target 的全部内容），$Q$ 的向上提升只消费 $P_i$ 投射和 $Q$ 正合，两边不对称是刻意的，后面 $G_0,G_1$ 恰好都是完全正合，但引理不滥用。有限性：$Q_i$ 有限投射才能让 $\Hom$ 与 $D$ 交换、才能让"过有限投射分解"与稳定商匹配（`01s:54-56` 处理了有限生成对直和与直项的封闭）。$R$ 一般（不必对称）：这条引理是第 2 节在 $\Lambda$ 上使用的，而 $\Lambda$ 恰是非对称的，引理范围必须比论文其余部分宽；扩展性质那句"does not assume projectives are injective"就是在给这个使用点让路。指标约定 $P[a]_i=P_{i-a}$（`01s:10-11`）：`02:96` 的双识别 $\stHom R{C_a(P)}N\simeq\stHom RM{C_{-a}(Q)}$ 我逐项验过：$C_a(P)$ 是 $P$ 的下标 $a$ 处的 cokernel，$H^a\Hom(P,Q)=H^0\Hom(P[-a],Q)$，而 $C_0(P[-a])=C_a(P)$；另一个方向用 $Q[a]$。

(d) [推测] 失败路线。其一：用 $\bigoplus_j$ 直和约定造 Hom 复形。失败机制：比较映射 $f$ 的逐度递归没有终止时刻，$\Lambda$ 上构造的 $V=\Cone$ 类映射天然有无穷多非零分量（第 2 节 `02:229` 提升 $v_0$ 就是这样的映射），直和约定里它根本不存在，链映射集与上同调都会缺元素。其二：拿普通有界投射消解，并非完全消解。失败机制：负度数一侧失去 $\Hom(P,T)$ 正合，$M\to N$ 的映射不再总能延成两侧无界的链映射，$\simeq\stHom RMN$ 在 $H^0$ 处就断；更致命的是第 2 节的 $\End(P_Z)$ 长正合列需要两侧都有上同调。其三：试图去掉"$Q$ 逐项投射"而只要求正合。失败机制：向上递归 $d^Q_jf_j=f_{j-1}d^P_j$ 解 $f_j$ 需要 $P_j$ 投射到 $Q_j$ 的提升，$Q_j$ 投射则是把 Ext 的商描述反过来（"maps extending to $P_{a-1}$ factor through a projective"用到 $P_{a-1}$ 的投射性作为分解载体）。

## 4 十维代数 $C$ 与其结合性（03:35-42）

(a) 逐字陈述（`03:14-33` 的数据加 `03:35-42` 的引理）：

```tex
\begin{array}{c|c@{\qquad}c|c}
 \text{corner}&\text{basis}&\text{corner}&\text{basis}\\ \hline
 eCe&e,x,y,z&eCf&u,v\\
 fCe&t,j&fCf&f,n
\end{array}
\label{alg:C-corners}
```

```tex
 xy=qz,\qquad yx=z,\qquad xu=yu=v,\qquad tx=j,\qquad ty=q^2j,\\
 ut=y+qx,\qquad vt=qz,\qquad uj=z,\qquad
 tu=(1+q)n,\qquad nt=qj,\qquad un=v.
```

```tex
\begin{lemma}\label{alg:C}
The rules \eqref{alg:C-corners}--\eqref{alg:C-products} define an
associative unital algebra of dimension ten.  Its radical is the span
of the eight non-idempotent basis vectors, and
\[
 (\rad C)^5=0,\qquad utut=q(1+q)z\ne0.
\]
\end{lemma}
```

(b) 推导补全。分次：$\deg e=\deg f=0$，$\deg u=\deg t=1$，$\deg x=\deg y=\deg n=2$，$\deg v=\deg j=3$，$\deg z=4$。逐条核对乘积齐性：$xy:2+2=4=z$ 的度数 ✓；$xu:1+2=3=v$ ✓；$tx:1+2=3=j$ ✓；$ut:1+1=2=y+qx$ ✓；$tu:2=n$ ✓；$nt:2+1=3=v$? 表里 $nt=qj$，$j$ 度 3 ✓；$uj:2+3=5$ 而 $v$ 度 3?! 我重读表：$uj=z$，$u$（1）+ $j$（3）= 4 = $z$ ✓；$un=v$：$1+2=3$ ✓；$vt=qz$：$1+3=4$ ✓。全部齐次，最高度 4，任何度数和超过 4 的三元组两边括号都自动为零，角不匹配的三元组同样两边为零。剩下的候选三元组是有限清单，论文给了 11 项和它们的公共值（`03:53-57`）：$utu=(1+q)v$、$tut=q(1+q)j$、$xut=yut=qz$、$ntu=0$、$unt=qz$、$txu=0$、$tyu=0$、$utx=z$、$uty=q^2z$、$tun=0$。我手算两条：$utu=(ut)u=(y+qx)u=yu+q(xu)=v+qv=0$?! 慢着，$yu=v$、$xu=v$，$(y+qx)u=v+qv=(1+q)v$ ✓（我漏了系数），与表一致；$tun=(tu)n=(1+q)nn$，而 $n^2$ 不在非零表里，$=0$ ✓。$xut=x(y+qx)=xy+qx^2=qz+0$ ✓。结合性由三线性从基向量覆盖。

幂零与根：正度张成 $N$ 是分次理想，$N^5=0$（5 个正度元素乘积度 $\ge5>4$），$C/N\simeq\kk\times\kk$ 半单，所以 $N=\rad C$（有限维代数中商为半单的最小理想即根）。$(ut)^2$ 我按论文的路线算一遍：$(ut)^2=u(tu)t=u(1+q)nt=(1+q)(un)t=(1+q)vt=(1+q)qz=q(1+q)z\ne0$（$q$ 超越故 $q\ne0$，$1+q\ne0$）。$ut\in(\rad C)^2$ 所以 $(\rad C)^4\supseteq\kk\cdot q(1+q)z\ne0$。角维数：$eC$ 基 $\{e,x,y,z,u,v\}$（6 维），$fC$ 基 $\{f,u,v,n\}$? 不对，$fC=f\cdot C$：行标为左角，$fCe=\{t,j\},fCf=\{f,n\}$，4 维；列 $Ce=\{e,x,y,z,t,j\}$ 6 维，$Cf=\{u,v,f,n\}$ 4 维（`03:47-50` 给出）。

(c) 机械理由。为什么恰好这 10 个向量、这套度数：目标是被第 5 节消费时 $\Ext_C^2(s,C)$ 是非零单模、$\Ext_C^{>0}(s,s)=0$，第 7 节会看到消解微分 $u,\ell_0,\ell_1,\ldots$ 的每一项都在这张表上闭合；度数模式 $(1,1;2,2,2;3,3;4)$ 把 $z$ 顶在最高度，令一切长乘积沿 $x,y,u,t$ 的链条走向 $z$ 后终止，$N^5=0$ 而 $N^4\ne0$ 是根指数条款（避开 $\rad^3=0$ 正例区）在 $C$ 层的种子，它会传到 $\Lambda$（第 15 节）。$q$ 出现在 $xy=qz$ 与 $ty=q^2j$：前者把 $eCe$ 做成参数 $q$ 的量子外代数 $\kk\langle x,y\rangle/(x^2,y^2,xy-qyx)$（$z=yx$，`03:64-66`），后者与 $tx=j$ 联合使 $fCe$ 成为 Schulz 参数 $q^{-1}$ 下 $(x+y)R$ 的一阶 syzygy 理想 $(x+q^{-1}y)R$（`03:69-74`，映射 $t\mapsto x+q^{-1}y$、$j\mapsto q^{-1}z$：验 $t\ell$ 型关系，$tx=x+q^{-1}y$ 右乘 $x$ 得 $j=q^{-1}z$? $t\cdot(x+q^{-1}y)x$：$(x+q^{-1}y)x=x^2+q^{-1}yx=q^{-1}z$ ✓ 与 $j\mapsto q^{-1}z$ 相容）。[推测] 这条 remark 在正文没有引用点，是作者留的族谱声明。$tu=(1+q)n$ 的 $1+q$：$1+q\ne0$ 让 $n$ 进入链条（$ut$ 的像 $(1+q)v$ 非零、$tu$ 的像非零），若 $q=1$ 这两条链双双坍塌，$C$ 退化成更小的代数、$utut\ne0$ 失效。$uj=z$ 与 $un=v$ 给 $j,n$ 继续往上走的路径，是第 6 节 179 条表项里大量含 $j,n,J,N$ 词条的存活前提。

(d) [推测] 失败路线。其一：把 $C$ 直接取成 Schulz 的量子外代数（四维）。失败机制：$eCe$ 自己的 Ext 代数被 Xia 的正例封死（量子完全交叉上 AR 成立），且它的自延伸是周期的、非零度恒存，无法通过第 8 节的平凡扩张得到"度 2 对 $C$、度 3 对 $T$"的那次搬运：$\Ext_C^2(s,C)$ 是单模这条性质依赖于把 $C$ 扩成 $e,f$ 双角加桥 $t,j,u,v,n$ 的十维形状。其二：删掉 $j$（让 $tx,ty$ 直接等于 $n$ 的倍数）。失败机制：$fCe$ 变成两元以下、$t$ 的一阶 syzygy 不再有两基向量 $(t,j)$ 支撑，第 7 节消解里 $\ker(\cdot\,\ell_i)=\langle\ell_{i+1},z,j\rangle$ 的维数账目塌一角，核与像不再逐度匹配。其三：把度数整体上抬（比如 $\deg z=5$ 再挂一个 $\w$）。失败机制：$N^5=0$ 变 $N^6=0$，第 5 节 $T$ 的分次镜像公式 $\deg(a^*)=5-\deg(a)$ 的常数 5 是这里最大度数加 1 的产物，链条上每一步常数都跟着漂，而 179 条表项是按这套度数配平的（weight 论证 `09:43-45` 依赖对偶字母数恰差一）。

## 5 平凡扩张 $T=C\ltimes DC$ 与对称性（03:97-106）

(a) 逐字陈述（`03:97-106`）：

```tex
\begin{lemma}\label{alg:T}
The algebra $T$ is symmetric of dimension twenty.  A symmetrizing
trace is
\[
 \lambda(a,\phi)=\phi(1),
\]
and the trace-dual of each basis letter is its starred letter.  Its
radical $\mathfrak r$ is the span of all basis letters except $e,f$;
it satisfies $\mathfrak r^6=0$ and $T/\mathfrak r\cong\kk\times\kk$.
\end{lemma}
```

(b) 推导补全。$T=C\ltimes L$，$L=DC$ 带双边作用 $(a\phi)(c)=\phi(ca)$、$(\phi a)(c)=\phi(ac)$（`03:81-85`），乘积 $(a,\phi)(b,\psi)=(ab,a\psi+\phi b)$。结合性由 $L$ 的双模律保证，而双模律逐项回到 $C$ 的结合性：$(a\phi)b=a(\phi b)$ 展开两边都等于 $c\mapsto\phi(bca)$? 左边 $((a\phi)b)(c)=(a\phi)(bc)=\phi(bc\,a)$，右边 $(a(\phi b))(c)=(\phi b)(ca)=\phi(ca\,a)$?! 我重算：$(\phi b)(d)=\phi(bd)$，所以 $a(\phi b)$ 作用在 $c$ 上是 $(\phi b)(ca)=\phi(bca)$；$a\phi$ 作用在 $bc$ 上是 $\phi(bc\,a)$。两者不同！但这就是 $C$ 结合性的体现：$b(ca)=(bc)a$ ✓ 相等。好，通过。迹：$\lambda((a,\phi)(b,\psi))=\psi(a)+\phi(b)$（第二个分量的 $1$ 值：$(a\psi)(1)=\psi(1a)=\psi(a)$，$(\phi b)(1)=\phi(b1)=\phi(b)$）。对称：$\psi(a)+\phi(b)$ 在 $(a,\phi)\leftrightarrow(b,\psi)$ 下不变。非退化：配对 $\langle(a,\phi),(b,\psi)\rangle=\psi(a)+\phi(b)$ 把 $C\times L$ 与 $L\times C$ 对偶互换，标准。$\lambda(ab^*)=\delta_{a,b}$：$b^*$ 作为 $L$ 的元素，$(a,0)(0,b^*)$ 的第二分量在 1 的取值 $b^*(a)$ ✓。这条就是"迹对偶把每个小写字母配成它的星号大写"的内容，第 12 节的 Casimir $\xi_H=\sum h(w)\otimes_I w^*$ 完全建立在这上面。

分次：$\deg(a^*)=5-\deg(a)$。$C$ 字母度 0 到 4，对偶字母度 1 到 5。齐性验证：$a\psi$ 作用 $(a\psi)(c)=\psi(ca)$，若 $\psi=b^*$，$a\psi=(ab)^*$ 当 $ab\ne0$（$(ab)^*(c)=c$ 系数对偶），$\deg(ab)^*=5-\deg(ab)=5-\deg a-\deg b$，而 $\deg a^*+\deg a$ 匹配 ✓；$\psi b=(ba)^*$ 同理。全部积齐次。根：除 $e,f$（度 0）外所有 18 个基向量度 $\ge1$，6 个正度元素乘积度 $\ge6>5$ 强制为零，$\mathfrak r^6=0$；商 $\kk\times\kk$ 半单，$\mathfrak r=\rad T$ ✓。$s$：$f$ 上作用 1、其余 18 个基向量作用 0 的一维左模，从 $C$ 的 $f$-单膨胀上来（`03:126-129`）。

(c) 机械理由。常数 5：镜像公式 $5-\deg(a)$ 中的 5 = $C$ 的最高度 4 加 1，保证小写-大写相乘不出现非正度或超度输出；若改 5 为别的，$\deg(e^*)=5$ 与 $e^*e^*$ 应为 0 的表不再齐次。$\mathfrak r^6=0$ ，并非 $\mathfrak r^5=0$：$T$ 的最大度是 5（字母 $E,F$），单个 $E$ 非零，六个正度相乘才必零；这个 6 直接决定第 11 节里 $\mathcal Y=\Sigma_R^4C_1$ 的稳定性预算里核幂零不会在中途截断（[推测]，这条我在 Lean 的 TrivialExtensionRadical 模块里看到独立的 $\mathfrak r$ 幂零计算）。$s$ 选在角 $f$ ，并非 $e$：第 7 节消解 $R_0=Cf\xrightarrow{\cdot u}Cf$? 不，$R_0=Cf$、$R_{i\ge1}=Ce$，$f\xrightarrow{\cdot u}$ 的像是 $\rad(Cf)$（`04:59-61`），$u\in eCf$ 右乘到 $f$ 上非零；若选 $e$-单，第一箭 $e\cdot u$ 的端点不匹配（$eu=0$? $u\in eCf$，$e\cdot u=u\ne0$，但 $u\cdot e$? 右乘只在 $f$ 端闭合）。选 $f$ 是因为 $fCe$ 恰是 syzygy 理想（第 4 节 remark），链条从这里起步。维度 20 = 10+10：第 9 节 $A=T\otimes T$ 的 400 和后面 $\Lambda$ 的 $800+\dim F$ 的账基。

(d) [推测] 失败路线。其一：不对称化，直接在 $C$ 上做全部构造。失败机制：$C$ 非对称（$eCf$ 与 $fCe$ 维数 2 对 2 勉强等，但 $DC$ 的双侧结构不相容于 $C\simeq DC$），稳定范畴不三角化，第 10 节对偶 $DH^a\simeq H^{-a-1}$ 无从谈起，第 11 节 profile 的负度侧全空。其二：取 $T' = C\ltimes C^*$ 但用不同的双模扭转（比如交换左右作用）。失败机制：$\lambda$ 不再对称（$\psi(a)+\phi(b)$ 的交换不变性靠的正是这对左右作用的规范选择），"symmetric"的定义条款 $t(ab)=t(ba)$ 直接破。其三：跳过 $T$ 直接对 $C$ 的 2-度类做张量平方 $\bar A=C_{\mathrm{?}}\otimes\ldots$。失败机制：$\Ext_C^*(s,s)$ 正度全零（第 7 节第一公式），没有度 3 的 $\tau$ 就没有 179 条表项、没有 Casimir 边界恒等式，整个第 12 节的提升没有原料；平凡扩张把 $\Ext_C^2(s,C)$（注意 target 是 $C$ 不是 $s$）转成 $\Ext_T^3(s,s)$，这一步"换 target 再升 1 度"是度 3 的全部来源（第 8 节展开）。

## 6 相对 bar 消解与三次数上循环 $p$（03:131-229）

(a) 逐字陈述（`03:166-187`，前置数据 `03:133-149`）：

```tex
\begin{lemma}\label{coc:data}
The cochain $p$ has weight $-1$ and is a Hochschild cocycle.  Its
associated class evaluated on $s$ is nonzero in $\Ext_T^3(s,s)$.

For any $H\in\kk^\times$, let $h=h_H$ be the automorphism of $T$
fixing $C$ and multiplying $L$ by $H$.  On the radical basis define
\[
 z_H(a)=
 \begin{cases}
 Hqa,&a\in\{u,v,t,E,X,Y,Z,U,V\},\\
 0,&\text{otherwise},
 \end{cases}
\]
and extend linearly.  For all $a,b\in\mathfrak r$ one has
\begin{equation}
 \sum_{w\in\mathcal B_{\mathfrak r}}
      p(a,b,h(w))w^*
  =a z_H(b)+z_H(ab)+z_H(a)h^{-1}(b),
\label{coc:boundary}
\end{equation}
where $\mathcal B_{\mathfrak r}$ is the radical basis.
\end{lemma}
```

(b) 推导补全。$I=\kk e\oplus\kk f$，相对 bar 项 $P_n=T\otimes_I\mathfrak r^{\otimes_I n}\otimes_I T$（`03:135-139`），微分逐对相邻因子相乘求和（特征 2 无符号），增广 $\epsilon:P_0\to T$ 是乘法。正合性由显式收缩 $\sigma$ 给出：把首系数 $a_0$ 沿 $T=I\oplus\mathfrak r$ 投影到 $\mathfrak r$，把投影值作为新首 bar 插入、首位补 1（增广次则 $a\mapsto1[]a$），$d\sigma+\sigma d=\id$ 靠相邻两次乘法相消（`03:145-151`）。$\sigma$ 右 $T$-线性，所以 $P\otimes_T s$ 也是 $s$ 的投射消解，这条把 bimodule 机器和单模 Ext 接上。

$p$ 的定义就是附录的 179 条表（第 16 节逐条登记），这里是概念层：$p:\mathfrak r^{\otimes_I3}\to T$ 是 $I$-双模映射，weight $-1$ 指每条表项输入中大写字母数比输出多 1（`09:43-45`）。cocycle 性即归一化 Hochschild 微分为零，`09:67-86` 把它写成系数递推：对 $18^4=104976$ 个四词逐项验证，其中仅 $15250$ 个端点可组合，其余由角的空乘自动为零。非零赋值：在双单 bar 复形 $s^{\mathrm r}\otimes_T P\otimes_T s$ 中取 $\zeta=q^2[t|x|J]+[t|y|J]$（`03:194-196`），验 closed：

$$d\zeta=q^2([j|J]+[t|T])+q^2[j|J]+q^2[t|T]=0,$$

四次展开 $d[t|x|J]=[tx|J]-[t|xJ]+[t|x|J\cdot]$? 端点简上外根作用全零，剩 $[j|J]$（$tx=j$）与 $[t|T]$（$xJ=T$，因 $x\cdot J$ 是对偶 $T$? $J=f^*$? 不，$J=j^*$；$xJ$ 作为 $L$ 中元素 $=(jx)^*=0$?! 这里用的是左作用 $(\phi a)(c)=\phi(ac)$：$J\cdot x=j^*x$，$(j^*x)(c)=j^*(xc)$，$xc$ 的 $j$-系数：$xt$? $x$ 乘任何以 $j$ 结尾的积为零，$xt$? 无 $xt$ 条目。我按 `03:200-203` 表列的四条为准：$tx=j$、$ty=q^2j$、$xJ=T$、$yJ=q^2T$。$xJ=T$ 意为 $J\cdot x$? 按论文写法 "$xJ=T$"：小写 $x$ 左乘大写 $J$，$(x\phi)(c)=\phi(cx)$，$J\cdot$ 取 $j$-系数：$cx$ 的 $j$-系数非零当 $c=t$（$tx=j$），即 $xJ=j^*=T$? 但 $j^*=J$ 定义里 $J$ 是 $j$ 的对偶，$T$ 是 $t$ 的对偶，$(xJ)(t)=J(tx)=1$，所以 $xJ=T$ ✓；$yJ$：$(yJ)(t)=J(ty)=q^2$ ✓。闭环。赋值：$p(t,x,J)=0$、$p(t,y,J)=q^3f$（表 `09:34` 行 `tyJf`），$\langle p,\zeta\rangle=q^2\cdot0+1\cdot q^3=q^3\ne0$。coboundary 与圈正交（标准成对论证），且任何 $P\otimes_T s\to s$ 的 $T$-线性映射与双单 bar 复形配对，所以赋值定义在类上，非零类得证。

边界恒等式（`coc:boundary`）：右边是 $z'$ 的 Hochschild 余边界形状（第 12 节用它造 $G$），左边把 $p$、$h$、迹对偶 $w^*$ 和基求和咬在一起。附录 `09:88-117` 把它按 $H$ 展开成常数项与一次项两条递推（`coc:boundary-constant/linear`），$\epsilon_a$ 记 weight（大写 1 小写 0），$\gamma_a=q$ 当 $a\in\{u,v,t,E,X,Y,Z,U,V\}$ 否则 0；左边贡献 $H^{\epsilon_w}$，右边三项分别贡献 $H\gamma_b\mu_{ab}^v$、$H\gamma_v\mu_{ab}^v$、$H^{1-\epsilon_b}\gamma_a\mu_{ab}^v$，逐 $H$ 幂次匹配。验证规模 $18^2=324$ 个输入对。

$p$ 的链条侧（`03:215-229`）：同一个符号用作比较映射 $p:P\to P[3]$，$n\ge3$ 时作用在最后三条 bar 上、输出乘进右系数，$n<3$ 为零。链映射性：严格前缀的乘法两两相消，剩最后四条 bar 上的方程恰是 cocycle 方程。

(c) 机械理由。weight $-1$：$h$ 只放大写，$p$ 每次吞一个大写吐零或一个小写（表项输入大写比输出多一），这保证 $p$ 与 $h$ 复合时每条表项整体带因子 $H^{-1}$? 更准确地说，第 14 节 twist 本征值 $H^{-m}$ 的来源是"每个非零分量恰含一个大写输入"（`07:165-168`）。$z_H$ 的支撑集 $\{u,v,t,E,X,Y,Z,U,V\}$：小写三个是 $C$ 的度 1、2 链条里带 $q$ 系数的字母（$xu,yu$ 的 $v$、$ty=q^2j$），大写六个是它们的对偶；$z_H$ 在其余字母为零，边界恒等式右边三项才可能同时匹配 $p$ 表里 $q,q^2,q^3$ 的系数分层。[推测] 支撑集与系数 $Hq$ 是先在 Lean 里被 SparseParity 配对证书枚举、再回填成闭式描述的，因为 `09` 的递推把 $z_H$ 完全按表展开。$q^2[t|x|J]+[t|y|J]$ 里系数 $q^2$：让四项 $d\zeta$ 在特征 2 两两成对消掉，$d[t|x|J]$ 给 $[j|J]+[t|T]$，乘 $q^2$ 后与 $q^2$ 来自 $d([t|y|J]\cdot$ 前乘?) 我按行内显示的四项配平读：$q^2[j|J]$ 出现两次（$q^2$ 权）、$q^2[t|T]$ 出现两次，特征 2 归零。这个 $q^2$ 是解出来的：设 $\zeta=[t|x|J]+c[t|y|J]$，closed 要求 $c$ 满足 $q^2+c\cdot1$ 型匹配（$ty=q^2j$、$yJ=q^2T$ 把第二圈的两项各乘 $q^2$），得 $c=q^2$。若 $q$ 特殊化使 $q^2$ 退化（$q\in\mathbb F_4$?），圈的形状会变但未必消失；真正致命的是第 7 节的全度一致性和第 14 节的行列式。

(d) [推测] 失败路线。其一：用度 2 的 Hochschild 类（更廉价，Koszul 型代数上常见）。失败机制：第 11 节的 cell 平移量是 $-(d-1)=-1$，三层 filtration 落在 $0,-1,-2$，profile 的两支撑度会退化成 $\{0,2\}$ 且 top projection 撞到 $H^{-1}$ 的空位（$H^{3m}$ 支撑是 3 的倍数度与 $-3m-1$ 的负支，度 2 的 $d$ 让 $E^a$ 在 seam 处不再是 $H^{-1}$ 单线），第 12 节 Casimir 提升的落点 $\Omega X\in X[-1]$ 需要 $d-1=2$ 与 $-1$ 的算术配合（$3=2+1$，top cell 平移 $-4$，$W^3$ 对上 $E^3=H^{-1}$）。度 2 时这套平移式 $a=3$ 变 $a=2$，$E^2=H^{2-4}=H^{-2}=0$，检测器失效。其二：让 $p$ 取 coboundary。失败机制：$p(s)=0$，第 8 节的 $\tau=p(s)$ 生成元不成立，$H^{3m}$ 上没有可检测的非零类。其三：$h$ 同时放大写和小写（比如整个 $\mathfrak r$ 乘 $H$）。失败机制：$T$ 的自同构必须保持乘法表，$xy=qz$ 里小写同乘 $H$ 会把左边乘 $H^2$ 右边乘 $H$，除非 $H=1$；固定 $C$、只放 $L$ 是唯一解，而 $L^2=0$ 恰好使 $\mathfrak r$ 内涉及两个大写的乘积自动为零，表不用动。

## 7 $C$ 上的消解与稀疏 Ext（04:22-105）

(a) 逐字陈述（`04:22-44`）：

```tex
\begin{lemma}\label{res:base}
A projective resolution $R\to s$ over $C$ has terms
\[
 R_0=Cf,\qquad R_i=Ce\quad(i\geq1),
\]
and differentials given by right multiplication:
\[
 \cdots\longrightarrow Ce
 \xrightarrow{\,\cdot\ell_1\,}Ce
 \xrightarrow{\,\cdot\ell_0\,}Ce
 \xrightarrow{\,\cdot u\,}Cf\longrightarrow s\longrightarrow0.
\]
More precisely, $d_{i+2}$ is right multiplication by $\ell_i$ for every
$i\geq0$. For every integer $i\geq0$,
\[
 \Ext_C^i(s,s)=
 \begin{cases}\kk&i=0,\\0&i>0,\end{cases}
 \qquad
 \Ext_C^i(s,C)=
 \begin{cases}s^{\mathrm r}&i=2,\\0&i\ne2.\end{cases}
\]
The second identification is an identification of right $C$-modules.
\end{lemma}
```

(b) 推导补全。$\ell_i=x+q^iy$。微分复合为零：$\ell_{i+1}\cdot\ell_i$ 在 $eCe$ 里算：$(x+q^{i+1}y)(x+q^iy)=x^2+q^iyx+q^{i+1}yx+q^{2i+1}y^2$? 细账：$(x+q^{i+1}y)(x+q^iy)=x\cdot x+q^i xy+q^{i+1}yx+q^{2i+1}y^2=0+q^i(qz)+q^{i+1}z+0=q^{i+1}z+q^{i+1}z=0$（特征 2）✓。$u\cdot\ell_0$? 首箭是右乘 $u:Ce\to Cf$，下一箭右乘 $\ell_0$，复合是右乘 $\ell_0\cdot u$? 顺序：$d_2$ 右乘 $\ell_0$、$d_1$ 右乘 $u$，$d_1d_2$ 是右乘 $\ell_0u$：$(x+y)u=xu+yu=v+v=0$ ✓。

逐度核与像（`04:53-66`）：右乘 $\ell_i$ 的表（基 $e,x,y,z,t,j$）：$e\ell_i=\ell_i$，$x\ell_i=q^{i+1}z$，$y\ell_i=z$，$z\ell_i=0$，$t\ell_i=(1+q^{i+2})j$，$j\ell_i=0$。像 $=\langle\ell_i,z,j\rangle$（$e\ell_i$ 给 $\ell_i$，$y\ell_i$ 给 $z$，$t\ell_i$ 给 $(1+q^{i+2})j$，这里 $1+q^{i+2}\ne0$ 由超越性，所以 $j$ 进入像）。核：设 $v_0=\alpha_e e+\alpha_xx+\alpha_yy+\alpha_zz+\alpha_tt+\alpha_jj$ 满足 $v_0\ell_i=0$；$e,t$ 分量给出 $\alpha_e\ell_i$ 的 $x,y$ 部分与 $\alpha_t(1+q^{i+2})j$，$j$ 项独立（$e\ell_i$ 不含 $j$），故 $\alpha_t=0$; $x,y$ 系数方程 $\alpha_xq^{i+1}+\alpha_y=0$ 即 $\alpha_y=q^{i+1}\alpha_x$?? 核对论文文本："a kernel vector has zero $e$- and $t$-coefficients, while its $x,y$ coefficients satisfy $a_y=q^{i+1}a_x$"（`04:64-66`）。如此核基 $\ell_{i+1}=x+q^{i+1}y$（$\alpha_x=1,\alpha_y=q^{i+1}$）、$z$、$j$，$\ker=\langle\ell_{i+1},z,j\rangle$。正合：$\im(d_{i+2})=\ker(d_{i+1})$ 即 $\langle\ell_i,z,j\rangle=\langle\ell_{i+1},z,j\rangle$?? 不对，正合要求第 $i$ 位的像等于下一位核：位置 $Ce\xrightarrow{\ell_{i+1}}Ce\xrightarrow{\ell_i}$：$\ker(\cdot\ell_i)=\langle\ell_{i+1},z,j\rangle=\im(\cdot\ell_{i+1})$ ✓，逐度成立。首段 $\ker(\cdot u)=\langle\ell_0,z,j\rangle=\im(\cdot\ell_0)$ ✓；$\im(\cdot u)=\langle u,v,n\rangle=\rad(Cf)$，cokernel 是 $f$-单 ✓。

$\Ext_C^i(s,s)$：$\Hom_C(R,s)$ 逐位 $es=0$、$fs=\kk$，复形 $\kk\xrightarrow{0}\kk\xrightarrow{0}\ldots$? 映射全是 $\Hom(Ce,s)=es=0$ 的零，$H^0=\kk$、$H^{>0}=0$ ✓。

$\Ext_C^i(s,C)$：$\Hom_C(Ce,C)=eC$（在 $e$ 处求值）、$\Hom_C(Cf,C)=fC$，precompose 右乘变成 left multiply：

$$fC\xrightarrow{u\cdot}eC\xrightarrow{\ell_0\cdot}eC\xrightarrow{\ell_1\cdot}eC\to\cdots$$

左乘 $u$ 在 $fC$ 基 $(f,t,j,n)$ 上：$uf=u$，$ut=y+qx$，$uj=z$，$un=v$，四个像独立 ✓。左乘 $\ell_i$ 在 $eC$ 基 $(e,x,y,z,u,v)$：$\ell_ie=\ell_i$，$\ell_ix=q^iz$? 核对 `04:83-87` 表：$\ell_i x$：$(x+q^iy)x=x^2+q^iyx=q^iz$ ✓；$\ell_iy=xy+q^iy^2=qz$; $\ell_iz=0$; $\ell_iu=\ell_0u+ (q^i+1)yu$?? $(x+q^iy)u=xu+q^iyu=v+q^iv=(1+q^i)v$ ✓; $\ell_iv=0$。$i=0$ 例外：$\im(u\cdot)=\langle u,y+qx,z,v\rangle$，$\ker(\ell_0\cdot)=\langle qx+y,z,u,v\rangle$，相同（$y+qx$ 与 $qx+y$ 同，特征 2 下 $q x+y$ 的倍数生成相同线? 基向量层面两集合都是 $\{u,\,y+qx,\,z,\,v\}$ vs $\{qx+y,z,u,v\}$ ✓ 同）。$i\ge1$：$1+q^i\ne0$ 使 $\ker(\ell_i\cdot)=\langle\ell_{i-1},z,v\rangle$、$\im(\ell_i\cdot)=\langle\ell_i,z,v\rangle$。上同调：度 0：$\ker(\ell_0\cdot)/\im(u\cdot)=0$；度 1 是 $\Ext^1$?? 索引：$H^0(fC\to eC\to\ldots)$ 中 $H^0=\ker(\ell_0\cdot\text{ from }fC?)$ 论文说 "The cohomology in degrees zero and one therefore vanishes. In degree two it is the line represented by $v$"：$H^2=\ker(\ell_1\cdot)/\im(\ell_0\cdot)=\langle\ell_0,z,v\rangle/\langle\ell_0,z\rangle=\kk v$ ✓; $H^{i\ge3}=\ker(\ell_{i-1}\cdot)/\im(\ell_{i-2}\cdot)=\langle\ell_{i-2},z,v\rangle/\langle\ell_{i-2},z,v\rangle=0$ ✓。右模结构：$vf=v$、$ve=0$、$vt=qz$ 是边界，所以存活线 $\kk v$ 上 $\rad$ 零作用、$f$ 作用 1，正是 $s^{\mathrm r}$ ✓。

(c) 机械理由。$\ell_i$ 的平移规律 $q\mapsto q^i$：正合性 $\ker(\cdot\ell_i)=\im(\cdot\ell_{i+1})$ 每度自动成立，一条公式管全部度数，这就是 intro 说的 uniform kernel formulas（`01i:43-44`）。$1+q^m\ne0$（$\forall m>0$）：超越性给 $q^m\ne1$；它同时把守三处：像里 $j$ 系数的存活（$t\ell_i=(1+q^{i+2})j$）、左乘表里 $(1+q^i)v$ 非零、$i\ge1$ 时核形状 $\langle\ell_{i-1},z,v\rangle$ 不含多余向量。$q$ 一旦单位根化，某个 $i$ 处 $\ell$ 链断裂，消解在第 $i$ 度起不再正合，第 8 节"$L\otimes_C^{\mathbf L}s\simeq s[2]$"的推导（按 good truncation）失去输入。$H^1(\Hom(s,C))=0$ 靠 $i=0$ 例外 $\im(u\cdot)=\ker(\ell_0\cdot)$ 的精确相等：$u$ 的像恰是 $\ell_0$ 左乘的核，多一个向量少一个向量都破坏 $\Ext^1=0$。维数账：$\dim_k\im$ 与 $\ker$ 每度都 3、4 交替，这是 $R_i\in\{Ce(6),Cf(4)\}$ 的角跳变的直接后果。

(d) [推测] 失败路线。其一：给 $s$ 取最小投影消解之外的别的消解（比如双角混合 $Ce\oplus Cf$）。失败机制：本构造的逐度闭合依赖单箭头右乘公式，混合项引入 $q^i$ 依赖的 2x2 矩阵，第 8 节 $L\otimes R$ 的同调从单线 $\kk v$ 变成带 $i$ 参数的矩阵族，$s[2]$ 识别不再典范。其二：让 $\Ext_C^2(s,C)$ 取更高维（比如加一条平行桥）。失败机制：第 8 节 $B^i=\Hom(\mathcal I,s[i])$ 必须 $\delta^{\pm1}$ 全零，$\mathcal I$ 的上同调只有度 0 和 2 的 $s$，多一条 2-类就多出 $\Hom(\mathcal I,s[2])$ 非零，递推段 $B^{i-1}\to E^{i-3}\to E^i\to B^i$ 两端漏气，$\delta^*$ 不再是同构，$\Ext_T^*(s,s)$ 不再是多项式环。其三：用左模消解硬算 $\Ext_C(s,C)$ 的右模结构。失败机制：论文明确这条识别是**右** $C$-模的（`04:43-44`），右乘 $v$ 的边界论证（$vt=qz$ 是边界）是右模结构成立的唯一支点，左右混写会让 $s^{\mathrm r}$ 的 $f$-作用判定翻转。

## 8 平凡扩张三角与多项式环 $\Ext_T^*(s,s)=\kk[\tau]$（04:114-200）

(a) 逐字陈述（`04:114-121`）：

```tex
\begin{lemma}\label{res:polynomial}
For the algebra $T=C\ltimes DC$ and its left $f$-simple $s$,
\[
 \Ext_T^*(s,s)=\kk[\tau],\qquad |\tau|=3,
\]
as a graded algebra, where $\tau=p(s)$ is the evaluation of the cocycle
from Lemma~\ref{coc:data}.
\end{lemma}
```

(b) 推导补全。第一步，导出识别 $L\otimes_C^{\mathbf L}s\simeq s[2]$。对有限投射左 $C$-模 $V$ 有典范同构 $DC\otimes_CV\simeq D\Hom_C(V,C)$，$\lambda\otimes v\mapsto(\varphi\mapsto\lambda(\varphi(v)))$（`04:124-128`）；对消解 $R$ 逐项用：$H_i(L\otimes_CR)\simeq D\Ext_C^i(s,C)=D(\kk v\text{ at }i=2)$，由第 7 节只在度 2 非零，等于 $D(s^{\mathrm r})=s$。$L$ 在全复形上零作用因为 $L^2=0$（平凡扩张的平方零理想），所以同调层 $s[2]$ 的提升有 good truncation 模型，识别在导出范畴成立。注意这里没有典范标量：论文末尾（`04:194-199`）声明 $\tau=p(s)$ 的归一化不需要选一个带规定标量的 $L\otimes_CR\simeq s[2]$，标量被第 6 节的显式赋值 $q^3$ 钉死。

第二步，三角。把 $0\to L\to T\to C\to0$ 当 $(T,C)$-双模列，逐项张量 $R$：$0\to L\otimes_CR\to T\otimes_CR\to R\to0$，短正合列（正合只用每个 $R_i$ 左 $C$-投射，不需要 $L,T$ 右平坦，`04:149-151`），得导出三角 $s[2]\to\mathcal I\to s\xrightarrow\delta s[3]$，$\mathcal I=T\otimes_CR$，上同调在度 0、2 各一份 $s$。$\mathcal I$ 逐项有限投射（$T\otimes_CR_i$ 是 $T$-自由）、同调下有界，所以从它出发算导出映射合法：逐项归纳加限制伴随给 $B^i:=\Hom_{D^b}( \mathcal I,s[i])=H^i\Hom_C(R,s)=\kk$（$i=0$）否则 0（`04:161-170`）。

第三步，递推。对三角 apply $\Hom(-,s[i])$：

$$B^{i-1}\longrightarrow E^{i-3}\xrightarrow{\delta^*}E^i\longrightarrow B^i\qquad(\texttt{04:174-178}).$$

$E^i=\Ext_T^i(s,s)$（$i\ge0$；$i<0$ 为零）。$i=1$：$E^{-2}=0$、$B^1=0$ 夹出 $E^1=0$。$i\ge2$：$B^{i-1}=B^i=0$（$B$ 只在 0 度非零，$i-3$ 与 $i$ 都过 0?? 细账：$i\ge2$ 时 $B^{i-1}$ 非零仅当 $i-1=0$ 即 $i=1$，$B^i$ 非零仅当 $i=0$，均不在 $i\ge2$，所以两端全零，$\delta^*$ 是同构）。$E^2=E^{-1}=0$（同构传递）；$i=3$ 处 $\delta^*(\id_s)=\delta$ 非零。$\delta^*(\beta)=\beta[3]\circ\delta$（`04:184-188`），即递推就是 Yoneda 乘 $\delta$：每个 $E^{3m}$ 由 $\delta^m$ 张成、其余度数零，$\Ext_T^*(s,s)=\kk[\delta]$。最后接第 6 节：$p(s)$ 在度 3 非零，故 $\tau=p(s)$ 是 $\delta$ 的非零标量倍，本身是多项式生成元，环同构 $\kk[\tau]\to\Ext^*_T(s,s)$ 成立。

(c) 机械理由。度 3 的全部算术：$|\tau|=3$ = 非零类在 $C$ 层的度 2 加三角箭头升 1 度（$\delta:s\to s[3]$ 是三角的第三箭头，$s[2]\to\mathcal I\to s$ 的平移量由 $L\otimes^{\mathbf L}s\simeq s[2]$ 决定）。这个 3 不是可调参数，是 $\Ext_C^2(s,C)$ 的 2 和三角公例的 $+1$ 之和；第 6 节的 179 条表和 $\zeta$ 活在 bar 度 3，两处度数在此咬合，是全文第一次"度数守恒"检查。$E^1=0$ 恰好是 AR 条件的 $i=1$ 支在 $T$ 层不被自动满足的关键：若第 7 节 $\Ext_C^1(s,C)$ 非零，三角给 $B^0=\kk$ 漏进 $E^1$?? 递推 $i=2$ 时 $B^1\to E^{-1}\to E^2\to B^2$ 两端...$i=2$：$B^1=0$、$B^2=0$，$E^2=E^{-1}=0$ 仍成立；真正的漏点在 $i=1$：$B^0=\kk$ 若出现在递推左端（即 $B^{i-1}$ 在 $i=1$ 是 $B^0=\kk$），$E^{-2}\to E^1\to B^1$?? 索引重排一下：$i=1$ 段是 $B^0\to E^{-2}\to E^1\to B^1$，$B^0$ 的像落在 $E^{-2}=0$，所以 $\delta^*$ 前的段无害，这正是论文把量化写成 $i\ge2$ 才同构的原因（`04:180-181`），也是 $s[2]$ ，并非 $s[1]$ 的同构决定了 $E^1$ 幸存。$\mathcal I$ 上同调度 0、2 两份 $s$：正合列 $0\to L\to T\to C\to0$ 的三处项各出一次，$\delta^*$ 的同构性靠 $\mathcal I$ 无其余上同调，即第 7 节 $\Ext_C^{>2}(s,C)=0$。

(d) [推测] 失败路线。其一：跳过 $C$、直接在 $T$ 上猜消解并逐度算 $\Ext_T(s,s)$。失败机制：$T$ 的投射消解在 $L$ 方向每度长一个尾巴（$L$ 是平方零理想但双模结构非平凡），逐度计算是无穷复形上的矩阵族问题，论文的整条推导链（换 target、三角、递推）就是为了避开它；猜出来的消解若不逐项投射，$B^i$ 的"$\Hom(\mathcal I,-)$ 可算"条款失效。其二：取 $T'=C\ltimes C$（正则双模平凡扩张）。失败机制：$C\otimes_C^{\mathbf L}s\simeq s$ 在度 0，三角变成 $s\to\mathcal I\to s\to s[1]$，递推升 1 度，$\tau$ 度 1，第 11 节的 cell 平移算术（$d-1=2$、$E^3=H^{-1}$）全部脱力，且度 1 类的 Yoneda 代数在稳定范畴里撞 $H^0$ 产生非零交叉乘积（`05:78-79` 的"no nonzero product crossing from negative to nonnegative"依赖 $H^2=0$ 这个 seam，度 1 时 seam 变成 $H^1=0$? 而 $H^1$ 在环 $\kk[\tau]$ 下也为零，但 $-d-1=-2$?? profile 支撑 $\{0,1\}$?? 更糟的是 $d=1$ 时双锥三层平移 $0,-0,-0$ 塌缩，filtration 分解失败）。其三：让 $L\otimes^{\mathbf L}s$ 带非零 $L$-作用。失败机制：$s[2]$ 作为 $T$-模需要 $L$ 在其上零作用（$L^2=0$ 保证），若 target 是更高维 $T$-模，$B^i=\Hom(\mathcal I,s[i])$ 维数膨胀，$\delta^*$ 同构仍成立但 $E^{3m}$ 变高维，第 14 节行列式矩阵从 $\mathrm{id}$ 张量变成真正的矩阵束，$H_1,H_2$ 的分离性预算不够。

## 9 张量平方与两个度 3 生成元（04:202-241）

(a) 逐字陈述（`04:214-222`）：

```tex
\begin{lemma}\label{res:tensor}
The simple left $A$-module $X$ is nonprojective, and
\[
 \bigoplus_{a\geq0}\stHom{A}{X}{X[a]}
 =\kk[\tau_1,\tau_2],\qquad |\tau_1|=|\tau_2|=3.
\]
The multiplication is composition with shifts, and its positive-degree
part agrees with the ordinary Ext algebra.
\end{lemma}
```

(b) 推导补全。$A=T\otimes_\kk T$、$X=s\otimes s$，$\dim A=400$（第 5 节的 20 张 20），对称形式取两个 $\lambda$ 的张量积。取 $s$ 的两个投射 $T$-消解做张量：逐总度直和有限（每度两复形的分量对有限），得 $X$ 的有限投射 $A$-模消解；Hom 复形是两 Hom 复形的总张量积；逐项把复形拆成 $\kk$-向量空间的直和（正合列分裂）得 Künneth 同构 $\Ext_A^*(X,X)\simeq\Ext_T^*(s,s)\otimes\Ext_T^*(s,s)=\kk[\tau_1,\tau_2]$。乘法的识别：张量比较映射给出，两个外部映射在特征 2 交换（无 Koszul 符号，`04:228-231`）。稳定侧：$\End_A(X)=\kk$（$X$ 一维），$\id_X$ 不过投射（否则 $X$ 是投射直项、投射模的直项被 $\rad$ 零作用?? 标准：一维模投射当且仅当对应单是投射的，这里 $A$ 非半单且 $X$ 有非零正 Ext），故 $\stEnd_A(X)=\kk$ 与 $H^0$ 吻合，正度稳定 Hom 按 `01s:44-47` 与 Ext 一致，合并成环同构。非投射性的内蕴证据是 $\Ext^3\ne0$（`04:235-236`）。

(c) 机械理由。为什么恰好两层张量：转换原理要的是"两条独立扭转作用在同一 $H^a$ 上的差"（`01i:143-144`），一层里 $\delta^a=(c+d)v$ 型矩阵行列式必为零（两条本征值相同），三层以上维数 $\binom{m+2}{2}$ 而比较矩阵要 $3\times3$ 且 det 条件变成三个 $H$ 的两两分离，参数就浪费了; 两层给 $\dim H^{3m}=m+1$、矩阵 $2\times2$，$\det=H_1^{-m}+H_2^{-m}$ 一条代数无关性搞定全部 $m$，参数量 ($H_1,H_2$) 与层数 (2) 精确匹配。$|\tau_i|=3$ 继承第 8 节，两处 $T$ 用同一个 $H$ 扭转（$\sigma_i=h_{H_i}\otimes h_{H_i}$，`07:52-53`）是本征值 $H^{-m}$ 按"总 $3m$ 度"，并非"每因子度数"结算的前提（第 14 节）。

(d) [推测] 失败路线。其一：不张量，直接在 $T$ 上做双锥。失败机制：一个变量的 Koszul 只有两 cell，`05:254-266` 的两条正合列退化为单箭头，profile 支撑变成 $\{0,3\}$ 单线但 $\delta^a$ 的定义域 $H^a\oplus H^a$ 里两支作用相同，$2\times2$ 矩阵每行相等，det 恒零，删不掉任何度。其二：用 $\kk$ 上不同代数的张量（$T_1\otimes T_2$，两个不同的 $C$）。失败机制：第 6 节的 Casimir 恒等式在两个不同表上给出两个不同的 $\beta$ 类，第 12 节的"两个提升评到同一条度 3 线"需要对角化，参数不同的表让 $z_H$ 支撑集不匹配。其三：把 Künneth 直接换成谱序列论证。失败机制：论文这里明写逐度有限直和与分裂复形（`04:226-228`），谱序列会把乘法环结构藏在滤化里，$\tau_1\tau_2$ 与 $\tau_2\tau_1$ 的交换性和第 14 节按单项式基结算本征值的做法都需要环级识别，滤化不配。

## 10 对称稳定对偶与负度数（05:26-79）

这一节没有编号引理，是第 11 节的地基，我按四段规格单独处理。

(a) 逐字陈述（`05:31-37`、`05:54-57`、`05:61-65`）：

```tex
D\stHom{G}{M}{N}\simeq\stHom{G}{N}{M[-1]},
 \qquad D=\Hom_{\kk}(-,\kk),
\label{cone:duality}
```

```tex
 DH^a\simeq H^{-a-1}.
\label{cone:negative-duality}
```

```tex
 H^{3m}=\mathcal P_m,\qquad H^{-3m-1}=D\mathcal P_m\quad(m\geq0),
 \label{cone:support}
```

其中 $\mathcal P_m$ 是 $\kk[\tau_1,\tau_2]$ 按每变量度 1 的度 $m$ 部分。

(b) 推导补全。对偶的直接证明（不引文献而按自己的指标约定重做，`05:38-51`）：取 $M$ 的完全消解 $Q$，对有限投射 $Q_i$ 有 $D\Hom_G(Q_i,N)\simeq\Hom_G(N,Q_i)$（归结到 $Q_i=G$ 时的 $DG\simeq G$，再取有限和与直项），所以 $\Hom_G(Q,N)$ 的对偶复形是 $\Hom_G(N,Q)$；后者度 0 上同调是"进入 $\ker(Q_0\to Q_{-1})=\Omega M$ 的映射模掉过 $Q_1$ 的"，恰是投射分解的商，因为投射到 $\Omega M$ 的映射沿 $Q_1\twoheadrightarrow\Omega M$ 提升。向量空间对偶正合，恒等式与Naturality 得证。指标核对：$D\stHom GMN\simeq\stHom GN{M[-1]}$，取 $M=X$、$N=X[a]$：$DH^a\simeq\stHom AX{X[a-1]}=H^{a-1}$?? 论文的结论是 $DH^a\simeq H^{-a-1}$，说明他们用同调平移的反向约定：$M[-1]=\Omega M$（`01s:27`），$\stHom AX{X[a]}$ 对 $a$ 协变于 target 平移，把 `cone:duality` 里 $N=X[a]$ 代入给 $DH^a\simeq\stHom A{X[a]}X=\stHom AX{X[-a-1]}$（对 $X[a]$ 做一次稳定对偶等于对 $X$ 平移 $-a-1$，$\Omega$ 吃掉一个平移），得 $H^{-a-1}$ ✓。支撑：$H^{3m}=\mathcal P_m$（度 1 基计数，$\dim=m+1$），负支 $H^{-3m-1}=D\mathcal P_m$，其余为零。负度乘法：$\tau_i$ 前合成 $H^a\to H^{a+3}$ 的转置按 Naturality 成为 $H^{-a-4}\to H^{-a-1}$，$g\mapsto g[3]\circ\tau_i$（`05:68-74`），即负支上的乘法是正支多项式乘法的对偶。seam：负到非负的交叉乘积，唯一候选源 $H^{-1}$（$m=0$）经 $\tau_i$ 进 $H^2=0$，所以无交叉（`05:78-79`）。

(c) 机械理由。$[-1]=\Omega$ 约定：对偶公式里那个 $-a-1$ 的 $-1$ 来自 $\Omega$ 吃掉一度（同调复形的 cokernel 移位规则），这是第 11 节 $E^3=H^{-1}$ 检测器和第 12 节落点 $\Omega X\in X[-1]$ 的算术母体；$d=3$ 的对偶度是 $-3-1=-4$?? 单项 $\tau_i$（$a=3$）的对偶在 $H^{-4}=D\mathcal P_1$，$H^{-1}=D\mathcal P_0$ 是"常数 1 的对偶"。这个错位 $-1$ 让"度 3 检测器 $W^3\to H^{-1}$"（`cone:top-projection`）恰好用 $H^2=0$ 封住 seam、用 $H^{-1}\ne0$ 开口，两条边界都卡在 $d$ 与 $-a-1$ 的仿射关系上：seam 上方 $H^{d-1}=H^2$ 必须零（正支无度 2，✓），下方 $H^{-1}=D\mathcal P_0$ 必须非零（✓）。若第 8 节的度是 2，则检测度 $a=2$ 要求 $H^1=0$ ✓ 且 $H^{-1}\ne0$ ✓?? $-a-1$ 给出 $H^{-3}=D\mathcal P_{?}$，$2m$?? $d=2$ 时正支 $\kk[\tau]$ 度偶数、负支 $-2m-1$，$H^{-1}=D\mathcal P_0$ 仍非零、$H^{d-1}=H^1=0$ 仍成立，seam 不破；但张量两层时 profile 的支撑度对 $\{0,2\}$，第 12 节两条提升映射活在 $W^2$，纤维三角形的连接映射落在 $V^0$ 与 $V^1$ 上，$\delta^0$ 的"非零核"被破坏。[推测] 度 3 的选择是为了让支撑 $\{0,3\}$ 与正支 $H^{3m}$（$m\ge1$）之间的缝恰好容纳 $FX$ 的度数账，细节在第 11、13 节。

(d) [推测] 失败路线。其一：$A$ 不对称而用一般自内射。失败机制：$DG\simeq G$ 的双模同构是对称的定义，投射-内射的 $Q_i$ 对偶 $\simeq\Hom(N,Q_i)$ 需要 $Q_i\simeq DQ_i$ 作为双模，自内射非对称时只有 Nakayama 扭曲 $\nu$ 版对偶，$DH^a\simeq H^{-a-1}$ 右端会多套一层 $\nu$，第 11 节的 $D^a=(H^{a-2})^2$ 组合恒等式不再在 $\tau_i$ 乘法下闭合（D18 的负度数机器处理的正是 $\nu$ 扭曲，两篇分工在此再次分岔）。其二：只用正度数版本（绕开对偶）。失败机制：第 11 节 profile 的 $W^3$ 识别为 $\ker d'_3\subset E^3=H^{-1}$，负支不进场就没有检测器；第 12 节 $f_HX\ne0$ 的判据也是这条线，绕不开。其三：对偶取 $D=\Hom_\kk(-,\kk)$ 换成 $D=\Hom_A(-,A)$。失败机制：前者是向量空间对偶，保持 $\dim$ 精确相等，后者把 $\stHom$ 送去双模侧，支撑度账目被 $\Omega^{d}$ 的自由度搅浑。

## 11 双锥的有限代表与两线 profile（05:81-323）

(a) 逐字陈述（`05:142-156` 与 `05:216-233`）：

```tex
\begin{lemma}
\label{cone:finite}
Let $P$ be the bimodule bar resolution of $T$ and let
$p:P\to P[3]$ be the selected comparison map. Form the ordinary complex
\[
 K=\operatorname{Cone}(p:P[-3]\to P)
       \otimes_{\kk}\operatorname{Cone}(p:P[-3]\to P).
\]
Then $K$ has finite projective $R$-terms and is exact in degrees greater
than zero. For every $N\geq1$, its cokernel
$C_N=\coker(K_{N+1}\to K_N)$ is finite and side-projective.
Consequently $\mathcal C=\langle K\rangle$ has a finite side-projective
module representative. The same conclusions hold for the first two
filtration levels of $K$.
\end{lemma}
```

```tex
\begin{proposition}
\label{cone:profile}
For the finite side-projective bimodule $\mathcal C$ of
Lemma~\ref{cone:finite}, put
\[
 W^a=\stHom{A}{X}{(\mathcal C\otimes_A X)[a]}.
\]
For every integer $a$,
\[
 W^a=\begin{cases}\kk,&a=0\text{ or }3,\\0,&a\notin\{0,3\}.
 \end{cases}
\]
Moreover the projection to the top cell induces an isomorphism
\begin{equation}
 W^3\xrightarrow{\ \sim\ }H^{-1}.
 \label{cone:top-projection}
\end{equation}
\end{proposition}
```

(b) 推导补全。$\langle V\rangle$ 装置（`05:93-127`）：对有界下、高度正合的投射复形 $V$，取足够高 $N$ 的 $\coker(V_{N+1}\to V_N)[N]$，正合列 $0\to V_{N+1}^c\to V_N\to V_N^c\to0$ 给出稳定同构 $V_{N+1}^c\simeq V_N^c[-1]$，定义与 $N$ 无关；链映射和同伦诱生稳定映射良定义；分裂短正合列 $0\to B\to V\to D\to0$ 在 $H_{N+1}(D)=0$ 时给出 cokernel 层的短正合列，微分交叉项 $r:D_j\to B_{j-1}$ 诱导连接稳定映射 $\langle D\rangle\to\langle B\rangle[1]$。

$K$ 的 cell 结构（`05:158-176`）：$P^{\mathrm{tot}}=P\otimes P$ 按角标 $S\subseteq\{1,2\}$ 分四层，$S$-cell 是 $P^{\mathrm{tot}}[-2|S|]$（平移量 $-2|S|$ 的算术：锥的错位 cell 是 $(P[-3])[-1]=P[-4]??$ 按 $[a]_i=P_{i-a}$：$(P[-3])[-1]_i=P[-3]_{i+1}=P_{i+4}$?? 我按锥的常规：$\Cone(f:X\to Y)_i=Y_i\oplus X_{i-1}$，$X=P[-3]$：$X_{i-1}=P_{i-1+3}=P_{i+2}=(P[-2])_i$ ✓ 每个锥因子贡献平移 $-2$，即度 3 类的锥 cell 错位是 $d-1=2$。），到 $S\setminus\{i\}$ 的微分是平移后的 $p_i$。按 $|S|$ filtration，三层商复形的 cell 同调支撑在 $0,-2,-4$（每个 $P^{\mathrm{tot}}[-2k]$ 是 $A$ 的消解平移，同调只在 0 度即 $A$ 本身），filtration 长正合列给出 $K$ 正度全正合。$C_N$（$N\ge1$）侧投射：cokernel filtration 因子是 $\coker(P^{\mathrm{tot}}_{N+2r+1}\to P^{\mathrm{tot}}_{N+2r})$（$r=0,1,2$，重数 $1,2,1$），bar 消解增广在任一侧分裂（正则模投射），逐度 syzygy 双侧投射，因子的双侧投射扩展仍双侧投射（分裂）。$\mathcal C=\langle K\rangle$ 有有限侧投射代表，可取 $N=1$ 加一次有限余 syzygy。

求值：$-\otimes_A$ 把 $R$-投射送到 $A$-投射（自由双模 $A^e\mapsto A\otimes V$），右侧分裂列求值保持正合，所以 $K$ 的 filtration 在 $X$ 上给出稳定 cell $X,\ X[-2]^{\oplus2},\ X[-4]$，相邻连接映射是 $\tau_1,\tau_2$ 的平移作用（bimodule 比较映射张 $X$）。

profile 计算（`05:235-315`）：记 $\mathcal C_{\le1}$ 为前两层。三层的 Hom 组 $B^a=H^a$、$D^a=(H^{a-2})^2$、$E^a=H^{a-4}$，连接 $d_a:D^a\to B^{a+1}$，$d_a(u,v)=\tau_1u+\tau_2v$；$d'_a:E^a\to D^{a+1}$，$d'_a(z)=(\tau_2z,\tau_1z)$。这两张图我按度数验证闭合：$d_a$ 源 $(H^{a-2})^2$ 经 $\tau_i$ 进 $H^{a+1}$（$+3$ ✓）；$d'$ 源 $H^{a-4}$ 进 $(H^{a-1})^2$（$+3$ ✓）；列顺序"删第一槽留第二单点"规定 $(\tau_2,\tau_1)$ 的槽位分配。核心是 Koszul 双行（`05:254-266`）：对 $m\ge0$，

$$0\to\mathcal P_{m-1}\xrightarrow{(\tau_2,\tau_1)^t}\mathcal P_m^{\oplus2}\xrightarrow{(\tau_1,\tau_2)}\mathcal P_{m+1}\to0,$$

行满：任何度 $m+1$ 单项式被 $\tau_1$ 或 $\tau_2$ 整除（$m+1\ge1$，$\tau_1^{m+1}$ 走第一列、纯 $\tau_2^{m+1}$ 走第二列）；列单且闭：$\tau_1u+\tau_2v=0\Rightarrow\tau_1u=\tau_2v$（特征 2），$\gcd(\tau_1,\tau_2)=1\Rightarrow u=\tau_2w,\ v=\tau_1w$。复合为零：$\tau_1\tau_2w+\tau_2\tau_1w=2\tau_1\tau_2w=0$ ✓。负度支：对偶化并把两个中间分量互换，恰给出负区经过 $D^a$ 的同一条序列；seam 处终端零空间是真实的 $H^2=0$。推论（`05:271-279`）：$\ker d_a=\im d'_{a-1}$ 恒成立；$\coker d_{a-1}$ 仅 $a=0$ 为 $\kk$；$\ker d'_a$ 仅 $a=3$ 为 $\kk=H^{-1}$（$m\ge1$ 的行对偶是单的，$D\mathcal P_m\to$ 注入；剩余源 $D\mathcal P_0=H^{-1}$ 的两条乘积落进 $H^2=0$ 自动在核里）。

filtration 收尾：第一层长正合 $0\to\coker d_{a-1}\to K_1^a\xrightarrow{q_a}\ker d_a\to0$；顶 cell 连接 $r_a:E^a\to K_1^{a+1}$ 满足 $q_{a+1}r_a=d'_a$，故 $\ker r_a\subset\ker d'_a$，仅 $a=3$ 可能非零，而 $K_1^4=0$（$D^4=(H^2)^2=0$）逼 $\ker r_3=E^3=H^{-1}$ 全收纳。$r_{a-1}$ 的 coker：$\im r_{a-1}\supset\ker d_a$ 且 $a\ne0$ 时满；$a=0$ 时 $K_1^0=\kk$ 而入射源 $E^{-1}=H^{-5}=0$?? 核对：$a=0$ 序列左端 $\coker d_{-1}=\kk$、右端 $\ker d_0$：$d_0:(H^{-2})^2\to H^1$?? $H^{-2}=0$、$H^1=0$，$\ker d_0=0$，所以 $K_1^0\simeq\coker d_{-1}=\kk$ ✓，$\coker r_{a-1}$ 恰在 $a=0$ 为 $\kk$。第二层长正合 $0\to\coker r_{a-1}\to W^a\to\ker r_a\to0$：$a=0$ 给 $\kk$，$a=3$ 给 $\ker r_3=\kk$，其余零。$a=3$ 处左端 $\coker r_2=0$（$a=3\ne0$），右端全收 $E^3$，顶投影 $W^3\xrightarrow{\sim}H^{-1}$ 是同构 ✓。

(c) 机械理由。支撑 $\{0,3\}$ 不是巧合，是两个方程的解：$a=0$ 由 $\coker d_{a-1}$ 支起（要求 $\coker d_{-1}\ne0$，即 $B^0=H^0$ 在行 $\mathcal P_{-1}\to\mathcal P_0^2\to\mathcal P_1$?? $m=-1$?? $d_{-1}:D^{-1}=(H^{-3})^2\to B^0$，$H^{-3}=0$ 所以 $\coker d_{-1}=B^0=\kk$ 恰由负支"没有度 $-3$"撑起）；$a=3$ 由 $\ker d'_3$ 支起（要求 $H^{3-4}=H^{-1}\ne0$ 且像侧 $D^4=(H^2)^2=0$ 吞掉投影）。三个度数事实 $H^{-3}=0$、$H^{-1}\ne0$、$H^2=0$ 分别来自第 10 节支撑表 $-3m-1$ 的 $m=0$ 起点与正支 $3m$ 的间隔；把它们任何一个挪动（例如 $d=2$ 使负支变 $-2m-1$：$-1,-3,-5$，$H^{-3}\ne0$?? $-3=-2m-1\Rightarrow m=1$，$\ne0$，则 $\coker d_{-1}$ 不再是全 $B^0$），profile 立刻多出支撑度。$N\ge1$ 的余数条款：$C_N$ 侧投射证明要 $H_{N+1}(D)=0$，cell 同调顶在 0 度，$N\ge1$ 起所有高位正合，取 $N=1$ 最省。重数 $1,2,1$ 是 $\binom{2}{|S|}$，两层锥的 cell 计数。$\mathcal P_j=0$（$j<0$）约定让 Koszul 在 $m=0$ 端自动起步。

(d) [推测] 失败路线。其一：三层张量 $\Cone^{\otimes3}$。失败机制：Koszul 长度 3，profile 支撑变成 $\{0,3,6\}$ 型，$\delta^a$ 定义域从 $H^a\oplus H^a$ 变 $(H^a)^3$ 对 $(H^a)^3$?? 纤维的投影矩阵 $3\times3$，$\det$ 条件要求三个 $H$ 的所有幂次分离，参数不够；且第 2 节原理只给了两个动作的差。其二：单锥（$K=\Cone(p:P[-3]\to P)$ 不作张量）。失败机制：cell 只有 $X,X[-2]$ 两层，$d_a$ 是单箭头 $\tau_i$，$\coker$ 与 $\ker$ 支撑重合在同一个 $a$，profile 是 $\kk$ 单线，第 13 节的"两条投影相同"失去对象，$v$ 的投影矩阵退化为 $1\times1$，行列式即 $H_1^{-m}+H_2^{-m}$?? 单参时非零性要 $H^{-m}\ne H^{-m}$，恒假，删不掉正 Ext。其三：用稳定双模直接做 $\mathcal C=\Cone(\tau_1)\otimes\Cone(\tau_2)$ 而不要 $R$-投射代表。失败机制：`05:129-140` 的侧投射代表条款是转换原理 $F$ 侧投射（第 13 节 $\Sigma_R$ 装置的合法性）的上游；稳定对象没有逐项投射的消解，$I_R(M)=\Hom_\kk(R,M)$ 的有限投射嵌入（`07:19-32`）无处安放，第 2 节合约的第一行（$F$ 双侧投射）就违约。

## 12 Casimir、两条同伦与提升（06:28-52，含 06:54-284）

(a) 逐字陈述（`06:28-52`）：

```tex
\begin{proposition}
\label{lift:main}
For each $H\in\kk^\times$, there is a stable bimodule map
\[
 f_H:U_H\longrightarrow\mathcal C[3]
\]
whose composite with the top-cell projection
$\mathcal C[3]\to A[-1]$ is represented by the bimodule map
$\beta_H:U_H\to\Omega A\subset P_0\otimes P_0$ determined by
\[
 \beta_H(1)=\left(\sum_w h(w)\otimes_I w^*\right)
 \otimes\left(\sum_w h(w)\otimes_I w^*\right),
\]
where each sum is over the letter basis of $T$.
Under the canonical identification $U_H\otimes_A X\simeq X$, its
projection after evaluation sends
\[
 1\longmapsto H^2(f^*\otimes f^*)
 \quad\text{in}\quad
 \Omega X=\rad(A)(f\otimes f)\subset A(f\otimes f).
\]
This evaluated map is nonzero modulo maps factoring through projectives.
In particular, $f_HX$ is nonzero in
$\stHom{A}{X}{\mathcal C X[3]}$.
\end{proposition}
```

(b) 推导补全。装置：$h=h_H$ 固定 $C$、放大写 $H$ 倍（第 6 节），$U=T_h$、$Q=P_h$（右扭转 bar），延拓约定 $\psi(a_0[a_1|\ldots]a_{i+1})=a_0\psi([\ldots])h^{-1}(a_{i+1})$（`06:19-23`，让从左模到非扭转靶的映射右线性）。

Casimir 线。$\xi_H=\sum_wh(w)\otimes_Iw^*\in P_0=T\otimes_IT$。余评恒等式 $a\sum ww\otimes w^*=\sum w\otimes w^*a$（迹对偶的标准形，引 Brué `06:62`）对 $h$ 的第一因子作用后给出 $h(a)\xi_H=\xi_Ha$，于是 $b(x)=x\xi_H$ 是 $U\to P_0$ 的双模映射。落入核：$\pi:P_0\to T$ 乘法。逐字母事实：$ww^*=$ 左顶点对偶、$w^*w=$ 右顶点对偶（$(ww^*)(c)=w^*(cw)$，正分次使 $c\in\rad C$ 时为零，idempotent 值定死结论）。行维数 $6,4$、列维数 $6,4$（第 4 节），故 $\pi\xi_H=\sum_{\text{小写}}ww^*+H\sum_{\text{小写}}w^*w=6E+4F+H(6E+4f^\ast?)=0$：按左顶点计数小写字母，$e$-行 6 个、$f$-行 4 个，都是偶数，特征 2 归零；右顶点同账。这里我逐项核过：$\sum_{\text{lower}}ww^*=6e^*+4f^*=0$，$\sum_{\text{lower}}w^*w=6e^*+4f^*=0$（列维数同 6,4），所以 $\pi\xi_H=0$，$b$ 落到 $\Omega T$。逐左顶点版本（`06:83-89`）：$\sum_{\text{left}(w)=r}h(w)w^*=r^*$ 补回被省略的 idempotent 项。外平方给 $\beta_H=b\otimes b:U_H\to\Omega A$（`06:92-98`）。

同伦 $B$。$B_i:Q_i\to P_{i+1}$，$B_i([a_1|\ldots|a_i])=\sum_{w\in\mathfrak r}[a_1|\ldots|a_i|h(w)]w^*$（保留可组合项，按延拓约定双模扩张）。引理 `lift:B`：$dB+Bd=D_b$（$D_b$ 是 $b\epsilon$ 在度 0、其余零的链映射）。证明的中间账：投影恒等式 `lift:projected-casimir` $\sum_{w\in\mathfrak r}ah(w)\otimes w^*+\sum h(w)\otimes w^*h^{-1}(a)=a\otimes r^*$ 来自 $a\xi_H=\xi_Hh^{-1}(a)$ 沿 $T=I\oplus\mathfrak r$ 投影首因子（左边省略项恰为 $a\otimes r^*$，右边省略项在 $I$ 内消掉）。bar 展开时旧末 bar 之前的乘法成对相消，旧末字母相邻两项合成 $[a_1|\ldots|a_i]r^*$，$dB_i$ 的最后一次乘法按端点恒等式再给同一项，特征 2 相消；度 0 单独核对 $dB_0(r[]r)=r[]r^*+r\xi_H$ 型闭合。

同伦 $G$。$pB:Q\to P[2]$ 是链映射（$dB+Bd=D_b$ 两侧接 $p$ 链映射性），需要零伦缩 $pB=dG+Gd$，输入恰是边界恒等式（`06:176-182`：cocycle 封闭本身不够，"cocycle closure by itself would not suffice"）。构造：$z'([a])=z_H(a)$，其余条按延拓；$z'$ 在 $[a|b]$ 上的余边 $az'(b)+z'(ab)+z'(a)h^{-1}(b)$ 按 `coc:boundary` 等于 $\sum_wp(a,b,h(w))w^*$，正是 $(pB)_2$ 的增广像：$\pi(pB)_2=z'd$。取 $G_0=0$、$\pi G_1=z'$（$Q_1$ 投射、$\pi$ 满），则 $(pB)_2+G_1d$ 像落 $\ker\pi=\im d$，投射性给 $G_2$；$i\ge3$ 归纳：$pB$ 链映射性使残量闭，$P$ 正度正合给 $G_i$。

拼 $\Phi$：$\Phi_{\{1,2\}}=B\otimes D_b$、$\Phi_{\{2\}}=G\otimes D_b$、$\Phi_{\{1\}}=\Phi_\varnothing=0$（`06:230-236`）。缺陷账：顶 cell 的 $d\Phi+\Phi d=D_b\otimes D_b$ 支在源度 0；cell $\{2\}$ 里删槽 1 给 $pB\otimes D_b$，被 $(dG+Gd)\otimes D_b$ 抵消；删槽 2 对两个非零分量都是 $pD_b=0$?? 为什么 $pD_b=0$：$p$ 作用最后三条 bar，$D_b$ 在正度为零、度 0 像落在无 bar 的 $P_0$ 上，$n<3$ 时 $p$ 定义为零（`03:222-223`）。所以 $\Phi$ 在全部正总度是链映射，取公共指标 $\ge4$ 的 cokernel 得 $f_H:U_H\to\mathcal C[3]$；顶分量仍是 $V=B\otimes D_b$，投影仍是 $\beta_H$。

求值非零：$\xi_H\otimes_A^{\mathbf?}X$：张量到单模只留右系数为 $f$ 的项，即 $w=f^*$（大写），值 $h(f^*)=Hf^*$；外平方 $H^2f^*\otimes f^*\in\Omega X=\rad(A)(f\otimes f)$（覆盖列正合因为在右侧分裂）。非因子化论证（`06:259-279`）：设 $X\to\rad(A)(f\otimes f)$ 过投射，则过有限自由；$X\to A$ 的分量像落在左 socle（$\rad A$ 零作用在 $X$ 上）；对称性把左 socle 元素 $u$ 送进右零化子：$\rad(A)u=0\Rightarrow\forall j\in\rad(A),a\in A:\operatorname{tr}(auj)=\operatorname{jau}=0$?? 逐字：$\operatorname{tr}(auj)=\operatorname{tr}(jau)=0$（迹循环律 $t(ab)=t(ba)$），非退化给 $uj=0$；而 $A\to\rad(A)(f\otimes f)$ 的映射是"在 1 处取值的右乘"?（左模映射由值决定，值在 socle，socle 元素右乘 $\rad$ 为零）一切因子化为零；我们的映射值 $H^2f^*\otimes f^*\ne0$，矛盾出，$f_HX\ne0$ 于 $W^3$，再由 `cone:top-projection` 是同构，检测完全。

(c) 机械理由。$H^2$：$f^*$ 是大写，每个槽一份 $H$，两槽 $H^2$；第 13 节用 $H_i^{-2}$ 重标定 $g_i$ 恰好吸收它，重标定是"两个提升到同一条线"的全部机关；$H^2\ne0$ 恒成立（域）。平移 $+3$：$\mathcal C[3]$ 的 3 是检测器度（第 11 节 $W^3$）；top cell 在 $K[3]$ 里是 $P^{\mathrm{tot}}[-1]$（锥错位 2 减平移 3：$-4+3=-1$ ✓），所以落点 $\Omega A\in A[-1]$，与第 10 节 $H^{-1}$ 对上。指标 $\ge4$：cokernel 定义要求 $N$ 超过所有 cell 的最高非正合度（cell 顶度 0，位移 $\le3$，$N\ge4$ 保证两条长正合都在正合区取，`06:246-247`）。$z_H$ 的支撑集与 $G$ 的度 1 起步：$G_1$ 用 $z'$ 抬 $\pi$，$z'$ 只活在度 1 bar，所以 $z_H$ 必须是字母的线性函数（附录恒等式的一次性）。$\beta_H(1)$ 的双因子同形（同一个 $\xi_H$ 用两次）：$\sigma_i=h\otimes h$ 两因子同 $H$ 的条款在这里种下，保证第 14 节两个 $\tau_i$ 拿到相同 $H^{-1}$。

(d) [推测] 失败路线。其一：用 $\xi_H$ 本身（不作外平方）直接当 $U\to\mathcal C$ 的顶投影。失败机制：$\mathcal C$ 是双层张量锥，它的顶 cell 是 $P^{\mathrm{tot}}[-1]=（P\otimes P)[-1]$，映射必须落进双因子张量；单因子 $\xi_H$ 型张量住 $P_0$ 不住 $P_0\otimes P_0$，类型不匹配。其二：只做一条同伦（有 $B$ 无 $G$）。失败机制：删槽 1 的交叉项 $pB\otimes D_b$ 在 cell $\{2\}$ 里没被抵消，$\Phi$ 不是链映射，cokernel 构造不出稳定映射，第 13 节的 $g_i$ 无从取得；这正是论文强调"边界恒等式，并非 cocycle 封闭"的原因，[推测] 作者在此前版本试图用 coboundary 吸收交叉项而失败，才补出 $z_H$ 这条显式同伦。其三：$h$ 取内自同构（共轭）。失败机制：内自同构的扭转双模 $A_\sigma$ 同构于 $A$，第 14 节本征值退化为 1，比较矩阵每行相同，删 Ext 失效；$h_H$ 必须外（放大写是 $\Aut(T)$ 的非平凡元素，靠 $L^2=0$ 保持乘法表，`06:10-11` 的"fixes $C$ and multiplies $DC$ by $H$"）。

## 13 有限纤维与对角稳定映射（07:10-135）

(a) 逐字陈述（`07:100-111`，构造数据 `07:19-98`）：

```tex
\begin{lemma}
 \label{branch:profile}
 Put $V^a=\stHom{A}{X}{FX[a]}$ for each integer $a$.  There is a unique
 $v\in V^0$ whose two projections are $\id_X$.  It spans $V^0$.
 For every integer $a>0$, projection induces an isomorphism
 \begin{equation}
  \label{branch:positive-projection}
  (\rho_1[a],\rho_2[a]):V^a\xrightarrow{\sim}
  (H^a)^2,
  \qquad H^a=\stHom{A}{X}{X[a]}.
 \end{equation}
\end{lemma}
```

(b) 推导补全。固定代表：$\mathcal C=C_1[1]$、$C_1=\coker(K_2\to K_1)$（`07:12-16`）；稳定平移的有限代表用 $j_M:M\to I_R(M)=\Hom_\kk(R,M)$，$j_M(m)(t)=tm$，在 1 处求值证单，$R$ 对称给 $I_R(M)\cong DR\otimes M\cong R\otimes M$ 左 $R$-投射；$\Sigma_RM=\coker j_M$ 代表 $M[1]$，$M$ 双侧投射时列在每侧分裂（商双侧投射故内射，A 自内射），双侧投射类封闭。$\mathcal Y=\Sigma_R^4C_1$ 代表 $\mathcal C[3]$（$C_1[1][3]=C_1[4]$ ✓）。第 12 节的尾映射在指标 4 给 $\Omega_R^4U_H\to C_1$，取四次 $\Sigma_R$ 并用 $\Sigma_R^4\Omega_R^4\simeq\id$（稳定）得实际双模映射 $g_i:U_i\to\mathcal Y$ 的代表（重标定 $H_i^{-2}$ 后两条评到 $W^3$ 的同一非零元 $w$）。

纤维：$Q=R\otimes_\kk\mathcal Y$ 自由、$\pi(r\otimes y)=ry$ 满，$F=\ker(g_1,g_2,\pi:U_1\oplus U_2\oplus Q\to\mathcal Y)$（`07:73-78`）。$\mathcal Y$ 双侧投射使该列每侧分裂，$F$ 双侧投射。有限性逐环：$C_1$ 两有限项的 coker、$\mathcal Y$ 四次有限 coker、$F$ 一个有限核（`07:79-83`）。

求值三角：$U_i\otimes_AX=X$ 的典范识别（$\sigma_i$ 保持 $X$ 的单特征）；$Q\otimes_AX$ 投射（自由双模求值出自由模）；所以求值后 $(g_1,g_2,\pi)$ 的核三角在稳定范畴截短成 $FX\to X\oplus X\xrightarrow{(w,w)}\mathcal CX[3]\to FX[1]$（`07:85-93`）。长正合：

$$(H^{a-1})^2\longrightarrow W^{a+2}\longrightarrow V^a\longrightarrow(H^a)^2\longrightarrow W^{a+3}.$$

$a=0$：$W^2=0$（profile），末段 $(H^0)^2\to W^3$ 是 $(c,d)\mapsto(c+d)w$，满；$V^0=\ker\simeq$ 对角线，唯一两投影都是 $\id_X$ 的元张成 $V^0$ ✓。$a=1$：前段 $(H^0)^2\to W^3$ 的满射吞掉连接映射 $\delta:W^3\to V^1$ 的定义域余部?? 逐字：该满射意味着 $W^3\to V^1$ 的像由 $(H^0)^2$ 的核决定，长正合给 $\im(W^3\to V^1)=\ker(V^1\to(H^1)^2)$ 且 $W^3\to V^1$ 前驱映射满，故连接零化整 $W^3$?? 我按论文口径（`07:125-130`）："the preceding map $(H^0)^2\to W^3$ is precisely this surjection. It kills the potential connecting term from $W^3$ to $V^1$, and $W^4=0$"，长正合两端夹 $V^1\simeq(H^1)^2=0$ ✓（这里 $(H^1)^2=0$、$W^4=0$，得同构 $V^1\xrightarrow{\sim}(H^1)^2$）。$a\ge2$：$W^{a+2}=W^{a+3}=0$（profile 支撑 $\{0,3\}$，$a+2,a+3\ge4$），直接同构 ✓。

(c) 机械理由。$g_i$ 重标定 $H_i^{-2}$：把第 12 节的求值 $H_i^2\beta_0$ 拉回公共 $w$，"their evaluations are the same nonzero element"（`01i:171-173`）是 $\delta^0$ 矩阵 $(1\ 1)$ 形状的前提；不重标定则 $V^0$ 的对角元变成 $(1,\lambda)$ 型，唯一性仍在但第 14 节的 $v$ 归一（$\rho_iv=\id$）要重做。$Q$ 补一槽自由：$(g_1,g_2)$ 单独未必满 $\mathcal Y$，加 $\pi$ 保满，从而 $F$ 的商列右端正合、$F$ 双侧投射；求值时 $Q\otimes_AX$ 投射，稳定三角里它塌缩成 $X\oplus X$ 的两槽，这步是"fiber 的两个投影"叙事的机关。$\Sigma_R^4$ ，并非 $\Sigma_R^3$：$\mathcal C=C_1[1]$ 已吃一度，$\mathcal C[3]=C_1[4]$，第 12 节尾映射在 4 号指标闭合，两处 4 是同一笔账（$d+1$ 的两次使用：锥错位 2、检测度 3、cokernel 起步 $N\ge1$，合成 $=4$）。$\pi:Q\to\mathcal Y$ 用 $R\otimes\mathcal Y$ ，并非别的投射覆盖：自由覆盖使求值像 $Q\otimes_AX$ 的投射性平凡可得。

(d) [推测] 失败路线。其一：直接令 $F=U_1\oplus U_2$（不作核）。失败机制：第 2 节需要 $v\in V^0$ 的两个投影都是 $\id$，即 $(g_1,g_2)$ 求值后 $(w,w)$ 型；没有 $Q$ 与 $\pi$ 的垫层，$\mathcal Y$ 不是投射、$(g_1,g_2)$ 不是满的，纤维的长正合根本不存在，$F$ 的双侧投射失去来路（$U_i$ 本身双侧自由是够的，但那样 $V^a$ 是 $(H^a)^2$ 直和 $U_i$-作用，$\delta^a$ 变成恒等差，删不掉）。其二：只用一条提升 $g_1$（纤维对单映射取核）。失败机制：$V^0$ 的对角条款无从谈起，$\delta^0$ 定义域只剩一支，$\ker\delta^0=0$，第 2 节"核非零给非投射性"断粮。其三：$U_1\oplus U_2$ 换成 $U_1\oplus U_{H_2}^{\oplus k}$（复制同参数）。失败机制：$w$ 两槽线性相关，$(g_1,g_2,\pi)$ 的求值像不是 $(w,w)$ 型，是 $(w,aw)$ 型，重标定时 $a$ 吸收一个自由度，第 14 节 det 条件 $H_1^{-m}+H_2^{-m}$?? 退化成 $(H_1^{-m}+aH_1^{-m})g$?? 单参数幂次，$m$ 大时非零无法保证; 真正坏在 $\delta^a$ 的两行成比例。

## 14 扭转本征值与比较矩阵（07:137-233）

(a) 逐字陈述（`07:139-145` 与 `07:176-188`）：

```tex
\begin{lemma}
 \label{branch:twist}
 For $H\in\{H_1,H_2\}$, tensoring with
 $U_H=A_{h_H\otimes h_H}$, under its canonical identification on $X$,
 acts on the whole space $H^{3m}$ as multiplication by $H^{-m}$
 for every integer $m\geq0$.
```

```tex
\begin{proposition}
 \label{branch:comparison}
 The finite bimodule $F$ in \eqref{branch:finite-fiber} is projective on
 both $A$-sides, and the map $v$ of Lemma~\ref{branch:profile} satisfies
 the following conditions.  For every integer $a\geq0$, define
 \begin{equation}
  \label{branch:delta}
  \delta^a:H^a\oplus H^a\longrightarrow V^a,
  \qquad (g,j)\longmapsto F(g)v+v[a]j.
 \end{equation}
 Then $\delta^0$ is surjective with a one-dimensional kernel, and
 $\delta^a$ is an isomorphism for every integer $a>0$.
\end{proposition}
```

(b) 推导补全。本征值：右扭转 convention 给出 $T_h\otimes_TM\simeq{}_{h^{-1}}M$，$a\otimes m\mapsto h^{-1}(a)m$（`07:150-156`）；对 $M=s$ 是典范单模识别（$h$ 固定特征）。$s$ 的归一化 bar 消解上，进入 $T_h$-像的比较映射对每条 bar 字母施 $h^{-1}$：与微分交换因为 $h^{-1}$ 保乘法、首乘由右扭平衡、末作用由 $h$ 固定特征。$p$ 的 simple-值三次 cocycle 每个非零分量恰有一个大写输入（weight $-1$、只有零 weight 输出能在 $s$ 上非零，`07:163-167`），bar 比较对这条 cochain 及其类 $\tau$ 施 $H^{-1}$。Yoneda 乘积被张量函子保持，$A$ 的两因子共用同一个 $H$，$\tau_1,\tau_2$ 各得 $H^{-1}$，单项式 $\tau_1^r\tau_2^{m-r}\in H^{3m}$ 得 $H^{-m}$，线性延拓到整块。

$\delta^a$ 的矩阵：$\rho_i$ 自然，$\rho_iv=\id$，故 $\rho_i[a]\,F(g)v=U_i(g)$（$=$ 扭转本征值乘 $g$）、$\rho_i[a]\,v[a]j=j$。$a=0$：$\delta^0(c,d)=(c+d)v$，满、核是对角线（一维）✓。$a=3m>0$：经 `branch:positive-projection` 视 $V^a\cong(H^a)^2$，

$$(g,j)\longmapsto\bigl(H_1^{-m}g+j,\ H_2^{-m}g+j\bigr),$$

即 $\binom{H_1^{-m}\ 1}{H_2^{-m}\ 1}\otimes\id_{H^{3m}}$；$\dim H^{3m}=m+1$（$\mathcal P_m$ 单项式计数）。det $=H_1^{-m}\cdot1+1\cdot H_2^{-m}=H_1^{-m}+H_2^{-m}$（特征 2 的 $ad+bc$）。非零论证：若 $H_1^{-m}+H_2^{-m}=0$ 则 $H_1^m=H_2^m$，与代数无关矛盾：$\mathbb F_2[q,H_1,H_2]$ 的两个不同单项式在分式域里仍不同，对一切 $m>0$ 成立，包括特征整除的 $m$。$3\nmid a$：$H^a=0$ 且 $V^a=0$（`branch:profile` 同构），自动同构 ✓。

合约交付：第 2 节全部假设验证完毕，$\Lambda=\binom{A\ 0}{F\ A}$ 上产出有限非投射 GP 模 $Z$，两支 Ext 每度消失；`07:231-233` 再次点名度 1 条款由 $\delta^0$ 的满射承包。

(c) 机械理由。$H^{-m}$ 的负号：右扭转 convention $a\cdot u=u\sigma(a)$ 让张量送回 $h^{-1}$-模（`07:148-149` 的"The inverse automorphism in this formula follows from the right-twist convention"是防呆声明，左右扭转的论文常在此差一个 $H\leftrightarrow H^{-1}$，本构造对称于 $H_i\leftrightarrow H_i^{-1}$ 所以无伤，但第 12 节 $H^2$ 标定与这里必须一致，否则 $w$ 对不齐）。$m$ 的线性依赖：det 要逐 $m$ 非零，$H_i^{-m}$ 随 $m$ 变化正是"无穷族行列式一个论证全灭"的实现；若本征值是 $H^{-1}$ 与 $m$ 无关（单层张量），$m=1$ 与 $m=2$ 的 det 相同?? 依然非零; 真正死点在第 9 (d) 其二：单层两槽本征值相同。单项式基 $H^{3m}$ 维数 $m+1$ 不进 det：比较矩阵是标量阵张量恒等，逐块同构。消失区间边界：$a\in3\mathbb Z$ 之外两侧都是零空间，$\delta$ 在空集上平凡同构，这是 profile 支撑 $\{0,3\}$ 与环支撑 $3m$ 的双重红利。

(d) [推测] 失败路线。其一：$H_1,H_2$ 取单位根或 $\kk$ 的代数元。失败机制：存在 $m$ 使 $H_1^m=H_2^m$，$\delta^{3m}$ 不可逆，$\Ext^{3m}_\Lambda(Z,Z)\supset\coker\delta^{3m-1}$?? 长正合列在 $a=3m$ 中段非零，猜想条件单点爆破；更糟的是"persist after every field extension"，特征 $p$ 的有限域扩张会制造 $H^p$ 幂等巧合（intro `01i:44-45` 特意写 $H_1/H_2$ 乘法阶无穷）。其二：把 $p$ 的 weight 改成 $-2$（两条大写输入）。失败机制：本征值变 $H^{-2m}$?? 每类乘 $H^{-2}$，$3m$ 度乘 $H^{-2m}$?? 行列式 $H_1^{-2m}+H_2^{-2m}=0\Leftrightarrow(H_1/H_2)^{2m}=1$，代数无关仍避免之，看起来没事；但 weight $-2$ 的 $p$ 在双单 bar 复形上与 $\zeta$（一条大写）配对为零，第 6 节非零赋值断，$\tau=p(s)$ 生成元失效，链条上游先死。其三：让 $\sigma_i=h\otimes h'$ 两因子分别用 $H_i,H_i'$。失败机制：本征值分裂 $\tau_1^{r}\tau_2^{m-r}\mapsto H_i^{-r}H_i'^{-(m-r)}$，比较矩阵对每个单项式是不同标量，$2\times(m+1)$ 型的"逐单项式 det"要求所有 $r$ 满足 $H_1^{-r}H_1'^{-(m-r)}+H_2^{-r}H_2'^{-(m-r)}\ne0$?? 参数预算翻倍且 $r=0,m$ 两端把 $H_1',H_2'$ 单独钉进 det，代数无关条件变复杂，收益为零，[推测] 作者在统一扭转与分裂扭转之间试过前者。

## 16 附录：179 条 cochain 表与有限验证协议（09:1-127）

(a) 逐字陈述（表的头部与规模声明，`09:15-19`、`09:43-45`；递推 `09:67-86`）：

```tex
\begin{tabular}{r@{\quad}l}
 coefficient & input and output letters \\ \hline
 $q^2$ & \texttt{EuNT EyZX FNtU JtXZ NtEU NtXV XzJT ZxEY tEun tXuf} \\
 ...
 $q^3$ & \texttt{EyJT JtEY tEyj tyJf} \\
 $1$ & \texttt{JNjX JVzX NNjU NVzU NjYU Njun Njxj Ntxt TNtX TVyX} \\
 ...
\end{tabular}
```

```tex
There are 179 entries, with distinct three-letter inputs.  In each
entry the number of capital input letters is one more than the
number of capital output letters.  This proves the weight assertion.
```

闭合递推（`09:69-80`）：

```tex
0={}&\sum_{x\in\mathcal B}\bigl(
 \mu_{ax}^{v}p_{bcd}^{x}
 +\mu_{ab}^{x}p_{xcd}^{v}
 +\mu_{bc}^{x}p_{axd}^{v}
 +\mu_{cd}^{x}p_{abx}^{v}
 +p_{abc}^{x}\mu_{xd}^{v}\bigr).
```

(b) 推导补全。表的读法：四字母词条 `abcv` 记 $p(a,b,c)$ 展开里 $v$ 的系数，未列系数为零；每条输入可组合且两端点与输出同。转置递推（`09:58-63`）将 $\mu$（$C$ 的乘法常数加 idempotent 作用）扩到全字母集：$\mu_{a,b^*}^{c^*}=\mu_{ca}^{b}$、$\mu_{b^*,a}^{c^*}=\mu_{ac}^{b}$、$\mu_{a^*,b^*}^{v}=0$，这就是对偶作用 `(03:81-85)` 的系数化，一切 $\mu$ 落在 $\mathbb F_2[q]$。闭合递推是归一化 Hochschild 微分 $dp$ 在四词 $abcd$、输出 $v$ 上的五个求和项：首乘、内三乘、尾乘，逐项展开成 $\mathcal B$ 上的卷积。验证规模：$18^4=104976$ 个根四词，端点可组合的只有 $15250$ 条，其余由角的空乘法自动成立（论文特别强调这条覆盖整个相对 bar 项，并非精选词集，`09:84-86`）。边界恒等式按 $H$ 分幂：左端 $H^{\epsilon_w}$，$\epsilon$ 是大写指示函数；右端三项给 $H\gamma_b\mu_{ab}^v$、$H\gamma_v\mu_{ab}^v$、$H^{1-\epsilon_b}\gamma_a\mu_{ab}^v$，对 $18^2=324$ 对输入分别验证常数与一次方程（`09:88-117`），$\gamma_a=q$ 支撑 $\{u,v,t,E,X,Y,Z,U,V\}$。全部代入是特征 2 的多项式恒等，不需要对 $q,H$ -specialize。终点赋值：$p(t,x,J)=0$、$p(t,y,J)=q^3f$ 给 $q^2p(t,x,J)+p(t,y,J)=q^3f$，即第 6 节 $\zeta$ 上的值。

(c) 机械理由。179 与"输入互异"：$p$ 作为 $\mathfrak r^{\otimes_I3}\to T$ 的 $I$-双模映射由根三元词上的值决定，表是它的图像枚举，输入互异保证无重复计数（同一输入两系数相加的歧义不存在）。weight $-1$ 的逐条检验（大写输入数 = 大写输出数 + 1）是本附录自证的唯一"逐条"性质，因为它决定第 14 节本征值的 $H^{-1}$ 因子，一条表项 weight 违规就漏一个 $H$ 幂。系数分层 $\{1,q,q^2,q^3\}$：全部来自 $\mu\in\mathbb F_2[q]$ 与表系数的乘法闭合，$q^3$ 行只有 4 条（`EyJT JtEY tEyj tyJf`），恰是第 6 节非零赋值与第 12 节边界恒等式 $q$ 权重条款的交汇处；$15250/104976$ 的可组合比例由角图 $e\leftrightarrows f$ 的可达性决定，是有限验证的代价账单，$104976-15250$ 条免费方程也计入"覆盖全项"的声明强度。$324$ 对边界验证是 $18^2$ 的完全穷举，配合 $H$ 为不定元的分离，才允许把恒等式同时用于 $H_1,H_2$（`09:116-117`）。

(d) [推测] 失败路线。其一：把表压缩到 $eCe$ 内部（纯量子外代数词）。失败机制：$p$ 必须是从 $\mathfrak r^{\otimes3}$ 到 $T$ 的 $I$-双模映射且第 12 节的 Casimir 求和遍历全字母表，$t,j,u,v$ 桥词的条目（表中大量 `tX..`、`Nt..`、`uN..`）支撑 $z_H$ 的像与 $\beta_H$ 的落点 $f^*\otimes f^*$，桥词被删则 $\beta_HX$ 求值为零。其二：用计算机代数系统只验非零条。失败机制：闭合递推的每一项包含 $p_{abc}^x=0$ 的项参与求和（`09:47-49` 明说 zero entry 也参与），跳过零条的验证不能覆盖 $15250$ 条方程中的任何一条整体。其三：把 $\gamma,z_H$ 的支撑扩到全部 18 个根字母。失败机制：边界恒等式右端 $H^{1-\epsilon_b}\gamma_a$ 项在 $b$ 小写时不带 $H$，扩支撑后常数与一次方程无法同时闭合（$15250$ 条里会出反例项）；$\{u,v,t\}$ 加六个大写的精确选取与乘法表中带 $q$ 的箭头 $\{xu,yu,tx,ty,ut,tu,nt,un,uj,vt\}$ 的同边界面重合，[推测] 这张"支撑即边界"的对偶是表被找到后倒推出来的最省支撑。

## 17 Lean 取证

题面定位：`formalization.yaml` 第 227 至 230 行登记论文（type article，id 指向 `paper.pdf`），第 938 至 940 行给 comparator 三元组：`comparator_config: ComparatorChallenges/AuslanderReiten.json`、`declaration: OAI.ArExplicit.Statement.main`、`file: OAI/Algebra/AuslanderReiten/All.lean`。json 内容全文如下：challenge_module 为 `ComparatorChallenges.AuslanderReiten`，solution_module 为 `OAI.Algebra.AuslanderReiten.All`，theorem_names 只列 `OAI.ArExplicit.Statement.main`，definition_names 空，permitted_axioms 为 `propext, Quot.sound, Classical.choice`，`enable_nanoda: false`。

规模：根目录 `OAI/Algebra/AuslanderReiten` 共 732 个 `.lean` 文件、55531 行、19 个子目录。分目录（文件数 / 行数）：`Tensor` 94 / 6897，`Bar` 77 / 5828，`Ext` 70 / 5028，`Evaluation` 55 / 3454，`Cones` 49 / 4120，`Coordinates` 50 / 2884，`Homology` 49 / 3184，`Resolutions` 49 / 3308，`HomComplex` 44 / 2743，`Complete` 27 / 2798，`Modules` 26 / 1974，`Fibers` 25 / 1750，`Algebras` 21 / 2267，`Stable` 21 / 1843，`Cocycles` 19 / 1719，`Duality` 18 / 1967，`Triangular` 20 / 1753，`BaseChange` 12 / 934，根文件 6 / 1080。声明计数（`^def|^lemma|^theorem|^abbrev|^instance|^structure` 前缀，全目录合计）3691：theorem 2021、def 1245、abbrev 201、instance 199、structure 25。namespace 分布：732 个文件全部开 `namespace OAI`，172 个进 `ArExplicit`，其后 `ArExplicit.T` 98、`ArExplicit.ExternalTensor` 63、`ArExplicit.CompleteComparison` 43、`ArExplicit.Resolution` 40、`ArExplicit.ModuleBar` 40、`ArExplicit.TwoCone` 30、`ArExplicit.ExternalBalanced` 30、`ArExplicit.FiniteLeftModule` 28。

sorry 与公理：解法树 `OAI/Algebra/AuslanderReiten` 内 `grep -rn "sorry"` 命中 0；`grep -rn "^axiom"` 命中 0，自定义公理不存在，公理预算即 json 的三个 Mathlib 底座公理。唯一的 sorry 在题面文件 `ComparatorChallenges/AuslanderReiten.lean` 第 71 至 73 行：

```tex
theorem main : FullStatement.{v} := by
  sorry
```

这是题目占位（comparator 的靶声明），不是解法缺口，两类 sorry 的区分是干净的。`enable_nanoda: false` 意味着没借道任何数值求根或外部求解器插件。

入口定理壳逐字。两处 `main`：`Main.lean` 第 58 行内部版本

```lean
theorem main : AlgebraicIndependent (ZMod 2) parameter ∧ FullMainTheorem.{v} :=
  ⟨parameters_algebraicallyIndependent, fullMainTheorem⟩
```

与 `All.lean` 第 735 至 742 行对外版本

```lean
theorem main : FullStatement.{v} :=
  fullStatement_of_mainConclusions ArExplicit.counterexample
    ArExplicit.counterexample_mainConclusions
```

中间层 `Main.lean` 的装配链逐字可读：`diagonalClass := T.fiberDiagonalClass q q_ne_zero one_add_q_ne_zero q_noPositivePowerOne (parameterUnit 1) (parameterUnit 2)`，`private abbrev explicitConclusionProof` 把 `T.explicit_mainConclusions` 与四条料（`fiberDiagonalClass_image`、`fiberDiagonalClass_spans`、`fiberPositiveRhoPair_bijective`、`parameterUnit_twist_ne`）拼合，`verifiedCounterexample` 把结果装箱成 `Candidate`，`counterexample_mainConclusions` 与 `fullMainTheorem` 两级出仓。`StatementEquivalence.conclusions_iff` 证明论文口径的 `MainConclusions`（GP 用"对一切投射靶正合"）与题面口径的 `Conclusions`（`TotallyAcyclicWitness` 显式给完全复形存在量词）逐合取等价，`fullStatement_of_mainConclusions` 再把候选装进 `System` 并调用 `MainConclusions.scalarExtension` 兑现持久性支。

消失条件的机器写法（本篇取证的核心问题）。`Basic.lean` 第 33 至 37 行：

```lean
def PositiveExtVanish (R : Type u) [Ring R]
    (M N : Type u) [AddCommGroup M] [Module R M]
    [AddCommGroup N] [Module R N] : Prop :=
  ∀ n : ℕ, 0 < n →
    Subsingleton (CategoryTheory.Abelian.Ext (ModuleCat.of R M) (ModuleCat.of R N) n)
```

即 $\Ext^i(M,N)=0$ 在机器顶层写成 `Subsingleton`（零对象逻辑），对象是 Mathlib 的范畴论 Ext（`ModuleCat.Ext.HasExt`/`Abelian.Ext`，Basic.lean 的 import 名单里有 `Mathlib.Algebra.Category.ModuleCat.Ext.HasExt`），两支条件在 `MainConclusions` 里是 `PositiveExtVanish R M M` 与 `PositiveExtVanish R M R` 两个独立合取项。但计算从来不在这个顶层做：底层引擎是显式 Hom 复形的上同调。链条三段：其一，`HomComplex/FullHomExt.lean` 的 `positiveExtVanish_of_fullHom`，假设完全正合复形 `TotallyAcyclicComplex` 与投射正合复形，把逐度 `Subsingleton (CohomologyClass K L n)`（full Hom 余链复形的上同调类，积约定与论文 `conv:full-hom` 一致）经 `fullHomSourceStableLinearEquiv`（比较引理 `conv:comparison` 的机器化身）映到 stable Hom，再经 `Stable/StableExt.lean` 的 `positiveExtVanish_of_stableCokernels` 升到 `Abelian.Ext`；其二，`Ext/ExtBridge.lean` 的 `positiveExtVanish_iff_resolution` 用 `ProjectiveResolution.extMk_eq_zero_iff` 在 Subsingleton 与逐度提升性质之间双向等价，`positiveExtVanish_iff_completeResolution` 把完全消解的非负尾transport成投射消解版本；其三，第二支 $\Ext^i(Z,\Lambda)=0$ 完全不走比较矩阵，`Ext/ExtBridge.lean` 第 99 行 `GorensteinProjective.positiveExt_regular` 直接从 GP 定义里"对一切投射靶正合"的数据投影出 `PositiveExtVanish R M R`，`Cones/ConeCriterion.lean` 的 `coneModule_properties` 一次性交付四结论（非投射、GP、自 Ext 消失、正则 Ext 消失），消失区间 $a>0$ 的边界由 `hinj n (0<n)` 与 `hsurj (n-1)` 的指标 omega 处理。非投射性同样双向：`not_projective_of_fullHom_nontrivial` 把度 0 上同调类空间的 `Nontrivial`（$\ker\delta^0\ne0$ 的像）转成 `¬ Module.Projective`。

"explicit" 在机器里的体现。它不是"构造性存在"这一层（`Candidate` 是 structure 装 Type 载体，`counterexample` 是 def 不是存在量词 witness），是三重计算化：其一，代数载体是具体类型。`Algebras/BaseAlgebra.lean`：`inductive Letter | e | x | y | z | u | v | t | j | f | n`（十个构造子），`structure BaseAlgebra (k) (q) := (coeff : Letter → k)`，乘法 `def product` 把论文 `alg:C-products` 的十二条表项逐字母写进坐标公式（例如 `| x => a.coeff e * b.coeff x + a.coeff x * b.coeff e + q * a.coeff u * b.coeff t` 这一行同时编码 $xy$?? 逐项按左角展开），结合性、分次、`finrank_eq_ten` 全在坐标层做；`T k q` 的基是 `Bool × Letter`（20 项），平凡扩张、radical、Frobenius trace、对称 socle 各占 `Algebras` 一个文件。其二，179 条表进机器。`Cocycles/CocycleData.lean` 第 120 行起 `def cochain : List TripleMonomial := [...]`，条目数恰为 179（与附录逐一对应），`TripleMonomial` 携带输入三字母、输出字母、$q$ 幂次；闭合性不逐条暴力 `decide`，是 `Cocycles/SparseParity.lean` 加 `CocycleCertificate.lean` 的配对证书：`certificate (a : TIndex) : Bool := SparseParity.paired (SparseParity.sort ... (differentialBlock a))`，20 个字母各一条 `private theorem valid_... := by decide +kernel`，全目录 `decide +kernel` 共 24 处，集中在 `CocycleCertificate`、`CocycleCorners`、`SparseCocycle`、`TwistedBoundaryData` 四个文件，即 kernel 只负责有限配对与过滤归约（如 `p_txJ`/`p_tyJ` 用 `cochain.filter ... = []`/`= [⟨...⟩]` 两条 decide 直接读表），无限陈述仍由结构论证给出。其三，参数是真实的域元素，并非假设符号：`Parameters.lean` 里 `BaseField := FractionRing (MvPolynomial (Fin 3) (ZMod 2))`，`q := parameter 0`、`H₁ := parameter 1`、`H₂ := parameter 2`，代数无关性 `parameters_algebraicallyIndependent` 由 `MvPolynomial.algebraicIndependent_X` 经分式域嵌入搬运，`q_pow_add_one_ne_zero`、`twist_eigenvalues_ne`、`twist_determinant_ne_zero`（对应 $H_1^{-m}+H_2^{-m}\ne0$）全部用单项式的 `totalDegree`/`degreeOf` 比较加 `omega` 证出，`twist_determinant_ne_zero_after_extension` 用 `map_ne_zero` 把非零性送进任意扩张域，这就是持久性支的机器核心。

模块依赖与战术频次。`All.lean` 按目录聚合 732 个文件的 import；跨目录引用计数（对被引侧）：`Tensor` 403、`Bar` 291、`Ext` 267、`Evaluation` 195、`HomComplex` 191、`Cones` 187、`Resolutions` 184、`Coordinates` 179、`Homology` 171、`Complete` 116、`Modules` 104、`Stable` 93、`Fibers` 88、`Algebras` 87、`Cocycles` 72、`Triangular` 68、`Duality` 65、`BaseChange` 52。层次读法：`Algebras/Cocycles`（有限数据）在最底，`Bar/Resolutions`（消解机器）居中，`Tensor/Evaluation/Cones/Coordinates/Fibers`（本篇独有的锥、提升、纤维坐标）为上层，`Ext/Stable/HomComplex/Complete/Duality` 是把上同调类搬到 `Abelian.Ext` 顶上的桥层，`Triangular`（转换原理，含 `ConvertedTensorCriterion`、`ConvertedNoncommutative`、`TriangularRadical`）与 `BaseChange`（持久性）对应论文第 2 节与第 8 节，`Coordinates/ConcreteMainCriterion.lean` 是总装车间。战术频次（全目录）：`simp` 出现 1923 行、`ext` 1124、`exact` 1760、`omega` 669（`by omega` 独占 717 次，指标算术的绝对主力，对应论文里 `$P[a]_i=P_{i-a}$` 那套移位账）、`by ext` 172、`by decide` 54（含 24 次 `decide +kernel`）、`refine` 217、`by_cases` 53、`ring` 40；`native_decide` 为 0，说明有限验证刻意走 kernel 可检查的 `decide` ，并非外挂。

论文步骤没进形式化的清单（逐项 grep 核实）：其一，Remark `alg:antecedent`（$eCe$ 识别为量子外代数、$fCe$ 是 Schulz 参数 $q^{-1}$ 下 $(x+y)R$ 的一阶 syzygy）无对应文件，`grep -rln "exterior\|Schulz"` 只命中 `External*` 命名的误报。其二，intro 末尾的 generator formulation 失效推论（$Z\oplus\Lambda$ 是非投射 generator，Ext 双可加加 $\Ext^{>0}(\Lambda,-)=0$）不在 `MainConclusions` 的八个合取项里，也没有独立定理。其三，维数账只登了两头：`finrank_eq_ten`（$\dim C=10$）与单模 `simple_finrank`，$\dim T=20$、$\dim A=400$、$\dim\Lambda=800+\dim F$ 没有以定理形式注册（对象表 `tab:objects` 的维数列进不了类型层的代价）。其四，非交换性有证明（`Triangular/ConvertedNoncommutative.lean` 的 `explicit_noncommuting_pair` 用 $eu\ne ue$）但不在题面 `Conclusions` 的核查清单里，属于超额交付。其五，正例文献、Enomoto 归约、图 `fig:construction` 与对象表当然全部在外。其六，"Gorenstein-projective 猜想"作为被否命题本身没有被形式化为一条陈述，机器只登记反例满足 `GorensteinProjective` 合取项。

## 18 常数与参数台账

符号 / 值 / 用在哪 / 动了会坏在哪，逐项登记。

| 符号与值 | 用在哪 | 动了会坏在哪 |
| --- | --- | --- |
| $\kk=\mathbb F_2(q,H_1,H_2)$，特征 2 | 全部符号消去（微分、锥、Koszul、行列式、$\pi\xi_H=0$ 的奇偶账） | 特征 $\ne2$：`01s:16-17` 的免符号前提崩塌，$2\tau_1\tau_2w=0$ 的 Koszul 复合不再自动为零，$6,4$ 奇偶账失效 |
| $q$ 超越 | $\ell_i=x+q^iy$ 逐度一致消解（`res:base`）；$q\ne0,1+q\ne0,q^m\ne1$ 三连（`04:18-19`、Lean `NoPositivePowerOne`） | 单位根化：某度核-像失配，消解断裂；$q=1$：$tu=(1+q)n$、$(ut)^2=q(1+q)z$ 双坍塌，$\rad^4(C)=0$ 链条证据消失 |
| $H_1,H_2$ 超越且互异 | 纤维重标定 $H_i^{-2}$（`lift:evaluation` 的 $H^2$）；本征值 $H_i^{-m}$；$\det=H_1^{-m}+H_2^{-m}\ne0$ 逐 $m$ | $H_1^m=H_2^m$ 出现一次即 $\delta^{3m}$ 不可逆；有限域化：Frobenius 巧合按 $p\mid m$ 爆破；$H_i=1$：$g_1,g_2$ 同作用，$\delta^0$ 核之外的全部同构失效 |
| $\dim C=10$、角 $(4,2;2,2)$、行/列维 $6,4$ | Casimir $\pi\xi_H=6E+4F+H(6E+4F)=0$（`06:76-82`）；$I=\kk e\oplus\kk f$ 的相对 bar | 任一维数变奇数：$\pi\xi_H\ne0$，$\beta_H$ 不落 $\Omega A$，第 12 节提升的顶点从根上拔起 |
| $C$ 分次 $\deg(u,t)=1$、$\deg(x,y,n)=2$、$\deg(v,j)=3$、$\deg z=4$ | 结合性归约（度 $>4$ 自动为零）、$N^5=0$、$\rad C$ 认定、11 项三元组穷举 | 移一个度数：要么三元组清单变长（结合性手工账爆炸），要么 $N^5=0$ 失效（根不幂零，$\Lambda$ 不再是 Artin 代数口径内的好对象） |
| $\deg(a^*)=5-\deg(a)$ | $T$ 全积齐次、$\mathfrak r^6=0$、$T/\mathfrak r=\kk^2$ | 常数 5 改：大写-小写乘积不再齐次或负度出现，分次论证全体失效 |
| $\dim T=20$、$\dim A=400$、$\dim\Lambda=800+\dim F$ | 对象表 `tab:objects`；有限性条款的直观注脚 | 机器未注册（第 17 节其三），改论文数字不影响证明但影响显式性叙事 |
| $|\tau|=3$（$=\Ext_C^2$ 的 2 加三角箭头 1） | 锥错位 $d-1=2$；profile 支撑 $\{0,3\}$；seam 双条款 $H^2=0$、$H^{-1}\ne0$；检测度 3；$\Sigma_R^4$；$\mathcal C[3]$ 的 3 | 度改 1 或 2：cell 塌缩或 seam 位移，`cone:profile` 两线支撑与 `lift:main` 落点 $X[-1]$ 的算术 $3-1-3=-1$?? 即 $E^3=H^{3-4}=H^{-1}$ 全断，第 13、14 节矩阵逐度失效 |
| 消失区间：$H^a\ne0\Leftrightarrow a\in3\mathbb Z_{\ge0}$；$W^a\ne0\Leftrightarrow a\in\{0,3\}$；负支 $-3m-1$ | $\delta^a$ 在 $3\nmid a$ 空集上自动同构；长正合的逐度归零 | 支撑任一点多出（如 $\Ext_C^1(s,C)\ne0$）：递推 $B$ 漏气，$\kk[\tau]$ 不成环，$\delta^{3}$ 之外出现待删度数 |
| $\dim\mathcal P_m=m+1$、比较矩阵 $\binom{H_1^{-m}\ 1}{H_2^{-m}\ 1}\otimes\id_{m+1}$ | `branch:comparison` 全部 $3m$ 度；每块 det 同一标量 | 单层张量 $\dim=1$ 时 det $=H^{-m}+H^{-m}=0$ 恒坏；矩阵两行同参即奇异 |
| $179$ 条表、weight $-1$、$\{1,q,q^2,q^3\}$ 分层、$q^3$ 行 4 条 | $p$ 的全部性质；本征值 $H^{-1}$ 因子；非零赋值 $q^3$ | 删/改一条表项：`coc:closure` 的 $15250$ 条方程中对应项失配（Lean 的 `decide +kernel` 证书逐字母可检）；weight 违规破坏 $H^{-m}$ |
| $z_H$ 支撑 $\{u,v,t,E,X,Y,Z,U,V\}$、$\gamma$ 同支撑取值 $q$ | 边界恒等式 `coc:boundary` 的常数/一次分离 | 支撑扩大：324 对方程某条出现 $H^2$ 项，$H$ 为不定元的分解失效；缩小：$pB$ 的零伦缩起点 $z'$ 抬不住 $(pB)_2$ |
| $\zeta=q^2[t|x|J]+[t|y|J]$、赋值 $q^3$ | $\tau\ne0$（`coc:data`），$\tau=p(s)$ 归一化 | $q^2$ 系数是 closed 方程的解，改它 $d\zeta\ne0$；赋值零化则生成元不存在 |
| $N\ge1$（cokernel 起点）、指标 $\ge4$（尾映射） | `cone:finite` 的侧投射代表；`lift:tail` 的链映射区 | $N=0$ 时高位正合条款不成立；$<4$ 时锥缺陷项混入 cokernel |
| $\mathfrak r^6=0$、$(\rad C)^5=0$、$\rad(\Lambda)^4\ne0$ | 根条款与"避开 $\rad^3=0$ 正例区"的定理陈述 | $\rad^4=0$ 撞上 Ringel-Zhang/Zhang-Zhou 区，反例断言与既证定理矛盾，必有一处构造失效 |
| $\Lambda/\rad\Lambda=\kk^8$ | 定理 `thm:main` 的显式性陈述；$2\times\kk^4$ 账 | 单数目与 $A$ 的双角、$C$ 的双角绑定，改角结构则消解端点账全改 |
| permitted axioms：`propext, Quot.sound, Classical.choice`；`enable_nanoda: false`；解法树 sorry=0 | comparator 认证边界（第 17 节） | 这三个是 Mathlib 底座；超出即认证失败，`decide +kernel` 的选择保证 24 处有限验证不依赖任何数值插件 |
| `BaseField = FractionRing (MvPolynomial (Fin 3) (ZMod 2))` | 参数层全部非零引理（`Parameters.lean` 的 degree 论证 + omega） | 换成 $\mathbb F_2(q,H_1,H_2)$ 的具体单变量化定义会失去 `MvPolynomial.algebraicIndependent_X` 的直接供给，代数无关性要另证 |

台账之外补一笔我通读后留下的唯一疑点：`06:176-178` 那句"The suffix comparison $p:P\to P[3]$ lowers the underlying bar degree by three, so $pD_b=0$"里的 "lowers"，与我按 `P[a]_i=P_{i-a}` 推的 $P_i\to P_{i-3}$ 一致?? $p$ 把 $P_i$ 送 $P_{i-3}$ 即"降三度"，$D_b$ 像在无 bar 的 $P_0$，$p$ 在 $n<3$ 为零条款兜底，两处读法闭环，不构成疑点；真正的开放处仍是第 6 (c) 末尾 $z_H$ 支撑集的发现路径，以及第 15 (d) 其三"every field extension"是主动声明还是审稿倒逼，这两处我维持 [推测] 标记。

## 15 根、单数目与非交换，标量扩张的持久性（08:7-79）

(a) 逐字陈述（`08:7-10`、`08:47-51`）：

```tex
\begin{proposition}\label{prop:radical}
The algebra $\Lambda$ is noncommutative, satisfies
$\Lambda/\rad\Lambda\simeq\kk^8$, and has
$\rad(\Lambda)^4\ne0$.
\end{proposition}
```

```tex
\begin{proposition}\label{prop:basechange}
For every field extension $K/\kk$, the algebra
$\Lambda_K=K\otimes_\kk\Lambda$ and module $Z_K=K\otimes_\kk Z$
satisfy all conclusions of Theorem~\ref{thm:main} over $K$.
\end{proposition}
```

(b) 推导补全。radical 账：$J_T=\rad C\oplus DC$（平凡扩张的根公式，商 $\kk^2$）；$A=T\otimes T$ 里 $J_A=J_T\otimes T+T\otimes J_T$ 幂零（两交换幂零理想的和幂零，逐二项式展开用可交换性）商 $\kk^4$，故 $J_A=\rad A$（有限维代数：幂零理想商半单即根）。$\Lambda$ 里 $J_\Lambda=\binom{J_A\ 0}{F\ J_A}$：乘积至多一个离角因子（离角乘离角 $=0$，$\binom{J\ 0}{F\ J}^2=\binom{J^2\ 0}{FJ+JF\ J^2}$，长积里 $J$ 幂零压阵），商 $\kk^4\oplus\kk^4\simeq\kk^8$ ✓ 八个单。$\rad^4\ne0$：走满射链 $\Lambda\twoheadrightarrow A\xrightarrow{\id\otimes\chi}T\twoheadrightarrow C$（每步商掉幂零理想的像），"满射把根映到商根"；$C$ 里 $(ut)^2=q(1+q)z\ne0$ 是 $\rad^4(C)\ne0$，拉回 $\Lambda$ ✓。非交换：$eu=u\ne ue=0$。

标量扩张账：$K/\kk$ 平坦（域扩张自由）。逐度同构：有限投射 $P_i$ 时 $K\otimes\Hom_\Lambda(P_i,N)\simeq\Hom_{\Lambda_K}(K\otimes P_i,K\otimes N)$，复形层用平坦交换 $\ker/\im$，得 $K\otimes\Ext^i(M,N)\simeq\Ext^i_{\Lambda_K}(M_K,N_K)$（`08:59-63`），零的逐度搬运。GP：$P_Z$ 逐项张 $K$ 仍正合、Hom 复形用同一逐度同构换靶 $\Lambda$ 保持正合。非投射：取不分裂满射 $P\twoheadrightarrow Z$（核 $N$），其扩张类在 $\Ext^1(Z,N)\ne0$，张 $K$ 后在 $K\otimes\Ext^1\simeq\Ext^1_K$ 里像非零（域扩张忠实平坦：$K\otimes-$ 反映非零，单射 $\Ext^1\hookrightarrow K\otimes\Ext^1$?? 精确机制是 $K$ 作为 $\kk$-向量空间存在线性回缩 $\kk$-线性 retraction，$0\ne x\mapsto1\otimes x\ne0$，用 $K$ 平坦自由 + 基含 1 的扩基论证）。radical 账重演：$J_\Lambda\otimes K$ 幂零商 $K^8$ 是 $\rad\Lambda_K$ ✓，$\rad^4$ 非零保持。

(c) 机械理由。$\kk^8$ 的 8：$2\times4$（三角代数两个对角块各出 $\kk^4$），是 $A=T\otimes T$（$2\times2$）的两倍，环环相扣到 $C$ 的双角 $e,f$；单数目是显式性的一部分（"eight isomorphism classes"进定理）。满射链末端的 $C$ 是关键：非零性证据 $(ut)^2$ 在最底层给出，逐层"映根到根"搬运时每一层的非零性都靠幂零理想不杀证据?? 准确说 $\rad\Lambda$ 的像含 $\rad A$ 的像含……满射 $f:R\twoheadrightarrow S$ 给 $f(\rad R)\supseteq\rad S$ 且这里逐层等号（标准事实：有限维代数满射的根像是商根，论文 `08:35-37` 自己论证：像幂零、商是半单的商，故像即根）。$(ut)^2$ 的度账：$ut\in\rad^2$，平方进 $\rad^4$，正是要的边界。扩张持久性里"每度"的量化：$\delta^a$ 的同构性在 $K$ 上重验时只需 det 非零，而 det $=H_1^{-m}+H_2^{-m}$ 经 $\kk\hookrightarrow K$ 保持非零（`08` 走 Ext 同构路线绕开了重算 $\delta$，[推测] 因为 $F_K=\ker$ 列在 $K$ 上的重造与 $K\otimes F$ 同构需要额外有限呈现论证，论文选择在 Ext 层结算）。

(d) [推测] 失败路线。其一：对 $Z_K$ 直接在 $\Lambda_K$ 上重建 $v_K$ 再跑转换原理。失败机制：$F$ 由四条有限构造（$\coker$、$\Sigma_R^4$、核）组成，每条与 $K\otimes-$ 交换性都要单证（$\Sigma_R$ 用 $\Hom_\kk(R,-)$，换基后变 $\Hom_K(R_K,-)$，不是同一个函子），工作量大于逐度 Ext 同构一条路; 论文取后者。其二：用"代数族在开集上上半连续"之类的几何论证搬运消失条件。失败机制：这里不是族，是单点 $\kk$ 加它的全体扩张；且消失条件要求所有度，上半连续只给逐度开集，无穷交无界。其三：把持久性弱化为代数闭包一支（abstract `main:54-55` 确实提到"persist after every extension"）。失败机制：`08` 的论证对任意扩张一次到位，弱化版没有省任何步骤; [推测] "every" 是主动声明，用来堵住"你的反例只是超越参数的巧合，代数闭化后是否还在"的审稿问题，intro `01i:40-46` 那句 including finite-dimensional algebras over an algebraically closed field 就是要这个推论。
