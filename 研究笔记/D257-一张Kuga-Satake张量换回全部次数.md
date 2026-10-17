# D257 一张 Kuga--Satake 张量换回全部次数：K3 二次轨形笔记

## 0 登记、取材与本稿的读法约束

派单编号 D257，主线2（非 Lean 队列）。派单行给的参数：`row=81`、`bytes=266451`、`thin=no`、
`dir=preprints/Algebraic-Kuga-Satake-correspondences-and-Hodge-conjectures-on-a-K3-quadratic-locus-September-30-2026`。
探目录结构只有 `build/paper.tex` 一个文件，266,451 字节、5,391 行，属于规格里的"厚素材"一档（单文件远超 60,000 字节），
所以我先用 `ls` 量字节，再用 `Read` 的 `offset`/`limit` 分段啃主干：引言、几张主定理的陈述、几条关键引理的证明首尾、结论侧的推论。

我真实读过的行区间（下文所有 `paper.tex:行号` 都落在这几张窗里）：
58-332、330-621、672-911、1208-1457、1485-1724、1794-2008、2380-2609、3277-3576、4175-4424、4701-4965、5132-5391。
我没有读的区间：911-1208（GHC 组装的后半）、1457-1485、1724-1794、2008-2380（八次相加映射与支配命题）、
2609-3277（周期栈、极化收缩、下降、相对规范类、实现与 Hodge 线）、3576-4175（比较定理证明主体）、
4424-4701（自旋生成引理后半与命题 `final:generic`）、4965-5132（目标球内实现的结尾与 `transfer:ample`）。
凡涉及这些未读区间的判断，我在正文里标 `[推测]` 并交代依据主要来自引言 243-310 的策略段与各处交叉引用文字，
不硬编成事实。`typst/` 分片没看作来源，`README.md` 只当索引，PDF 一律没碰，git 命令一条没跑，
Lean 侧因为派单没给 Lean 行所以完全不动。

写作姿态说明：下面各节是"正在做这件事的我"的反推记录，按我实际的思路顺序写，包含走死的路与走死的原因。
教科书的正向铺陈我尽量拆掉；凡是论文里只给结论、没给动机的地方，我把我的重构明确标成重构。

本单的两条登记（逐字）：

- 完整目录名：preprints/Algebraic-Kuga-Satake-correspondences-and-Hodge-conjectures-on-a-K3-quadratic-locus-September-30-2026
- 其他队列第 81 行号

## 1 我为什么会盯上"一张张量"这种说法

起点是很朴素的贪心。K3 曲面幂上的 Hodge 猜想，已知的那部分都靠两端：
一端是endomorphism 域为 CM 时，各次幂的普通 HC 已经被人证掉了（`paper.tex:234-235`，引 Varesco 推论 2.3）；
另一端是 Kuga--Satake 那条对应，Deligne 的理论里它是绝对 Hodge 而且是 motivated 的
（`paper.tex:111-113`）。我当时以为这两个"已知"之间只差一层薄纸：既然 KS 对应是 motivated 的，
motivated 圈里到处是代数性，那把 KS 张量搬成一个真正的圈，多半是走一遍现成机器就到手的事。

这个想法第一天就撞墙。论文开篇把要求写得很硬（`paper.tex:114-116`）：
我们需要的是诱导出**指定** Clifford 映射的那个圈，仅仅有一个非零 Hodge 嵌入进 Abel 簇的上同调是不够的。
同一个区分在文献综述里被点名过：Floccari 与 Fu 明确把"代数嵌入"和"指定的 Kuga--Satake 映射"分成两个猜想
（`paper.tex:214-218`），他们只在伴随奇异 OG6 簇的那族 K3 上证到后者的代数性。
我起初想抄的那条近路，正好是他们没走通的路。

第二条近路也塌了。对这里用的格 $P$，Poon 算过 Clifford 代数并造了到四元数 Abel 八维簇的模形式映射
（`paper.tex:220-222`）；Van Geemen 与 Verra 研究过相关四元数 Prym 八维簇与代数四元数类
（`paper.tex:223-224`）。论文一句话把这条路封住（`paper.tex:225-226`）：
这些模与四元数类的构造本身给不出指定的 K3 到 Abel 的对应。我复盘时把失败原因记成如下三条：

1. 它们提供的是"某个代数 Hodge 类"，而后续所有推导需要一个满足**具体乘法定律**的张量。
   这一点在命题 `ext:conditional` 的证明里被写死：构造用的是 $\eqref{ext:exact\text{-}kappa}$ 里那个确切乘法，
   "$H^2(A^2,\mathbb Q)$ 里一个未指明的 $T$ 的代数副本"推不出关键的赋值恒等式
   $F_k(\alpha)(1)=c_k(\alpha)w^k$（`paper.tex:496`、`paper.tex:512-516`）。
2. 四元数结构只看见自共轭的那一小块，而恢复指定张量需要保留**整个**偶Clifford 模与两个张量朝向
   （`paper.tex:228-229`）。
3. 模映射给的是族层面的对象，Picard 跃升处的纤维上，$T_S$ 会变小，
   用 $T_S$ 当参数无法覆盖"包含所有跃升"的目标（`paper.tex:176-177`）。

贪心的另一面后来变成定理的形状：干脆把假设压到最小。定理 `ext:criterion`（`paper.tex:151-158`）说，
只要存在**一个**有理非零模 $w\in T_S$、**一个**有理极化、**一个**满偶Clifford 实现，
使得 $j_w(v)(a)=vaw$ 的张量由 $\operatorname{CH}^2(S\times A^2)_\mathbb Q$ 里的圈诱导，
那么 $S$ 的每个自幂的每个次数上的有理 HC 与有理 GHC 都成立。
我当时的判断是：这种"一张票换全部"的陈述只可能在两种情况下成立，
一是后面有代数运算把一张票自动扩成无限多张，二是它压根是假的。
前者对应 $\bigwedge^k$ 的交替复合加上一个多项式左逆（`paper.tex:449-465`、`paper.tex:579-587`），
这条我在 §4 里详细复盘。

## 2 精确张量的定义，以及"右因子不必是 Hodge 向量"这个转折

设定：$(T,q)$ 是 K3 型二次空间，Clifford 关系取 $v^2=q(v,v)$；
满偶代数 $W=C^+(T,q)$ 带左侧标准 Kuga--Satake Hodge 结构
（`paper.tex:120-123`）。若 $e_1,e_2$ 是正定向周期平面的标准正交基，$T^{2,0}=\mathbb C(e_1+ie_2)$，
复结构就是左乘 $J=e_1e_2$（`paper.tex:123-126`，八维版本在 `paper.tex:4261-4268`，那里明确写出 $\dim_\mathbb Q W=2^7=128$，
以及 $J^2=-1$、Hodge 圆在 $W_\R$ 上是左乘 $\exp(\theta J)$）。
取 Abel 簇 $A$ 并给定有理 Hodge 识别 $H^1(A,\mathbb Q)=W$。对非零模 $w\in T$，标准映射是

$$
j_w:T(1)\longrightarrow\operatorname{End}(W),\qquad j_w(v)(a)=vaw,
$$

见 `paper.tex:128-132`；这里 $\mathbb Q(1)$ 的权是 $-2$。
我最初卡住的点特别笨：$a\mapsto vaw$ 里右边那个 $w$ 是个固定的有理向量，
它一般没有 $(1,0)$ 或 $(0,1)$ 型，那我凭什么说这个映射是 Hodge 映射？
论文的答复（`paper.tex:133-136`，以及八维处 `paper.tex:4276-4283`）是：
左自旋乘法的共轭作用让它在**每个周期**上都是 Hodge 映射，$w$ 保持固定即可；
具体地，对 $g\in\operatorname{Spin}(U,q)$ 有 $L_gj_w(v)L_g^{-1}=j_w(gvg^{-1})$（`paper.tex:4278-4281`），
所以 Hodge 圆的共轭作用只是把左变量搬动，右因子根本不需要有良好型。
同一处还给出注入性的来源：$w^{-1}=w/q(w,w)$，在 $a=1$ 处取值就看出单射
（`paper.tex:4276-4277`，另见 `paper.tex:499-500`）。

这一步是我思路里的第一个真正转折。它告诉我：不要把"指定张量"理解成一个 Hodge 类的集合，
要理解成**一个满足确切乘法定律的态射**；而该定律的成立不依赖周期，只依赖自旋等变。
于是"在每个周期上都要证一次代数性"这种绝望的逐点任务，被换成"在构造好的周期上证一次，然后靠参数空间机制扩散"
（扩散机制在 §10）。

再补一句右逆因子与极化。给定有理极化 $E$，记 $E^\flat:W\to W^\vee(-1)$，$y\mapsto E(y,-)$；
在 $\operatorname{End}(W)=W\otimes W^\vee$ 的顺序下，先把第二因子扭转 $\mathbb Q(-1)$ 再用 $(E^\flat)^{-1}$，得到指定的张量形式

$$
\iota_{w,E}:T\longrightarrow W\otimes W\subset H^2(A\times A,\mathbb Q),
$$

见 `paper.tex:137-145`，八维重述在 `paper.tex:4285-4296`（那里写作 $I_E=(E^\flat(1))^{-1}$，
并说明 $(\operatorname{id}\otimes I_E)j_w$ 把 $U(1)$ 映到 $(W\otimes W)(1)$，再扭 $\mathbb Q(-1)$）。
"standard"这个形容词在全文里被严格钉在这张具体的映射上，指的并不是"某个非零嵌入"（`paper.tex:146-149`）。
我现在的理解：把术语钉死这一步，本身就是防自己走回头路的护栏，
因为凡是"$H^2(A\times A)$ 里有个代数副本"级别的陈述，都可能在 §4 的赋值恒等式处断链。

主定理 `main:theorem`（`paper.tex:179-198`）因此是这样写的：
设光滑射影复 K3 曲面 $S$ 的带 cup 积形式的超越二次空间 admits 一个有理等距嵌入 $(T_S,q)\hookrightarrow V_P$；
则对任意满偶Clifford 实现 $H^1(A,\mathbb Q)=C^+(T_S,q)$、任意有理非零模 $w\in T_S$、任意该权 1 结构的有理极化 $E$，
存在圈 $\Gamma_S\in\operatorname{CH}^2(S\times A\times A)_\mathbb Q$，它在每个 $x\in T_S$ 上的作用恰好是 $\iota_{w,E}(x)$；
同一陈述在被输运的同源模型上对指定张量同样成立；并且有理 HC 与有理 GHC 对每个 $m\ge1$ 的 $S^m$ 的所有次数成立。

## 3 二次轨形为什么长这样：格 $P$ 与被固定住的八维垂直

轨形选取是我觉得全文最"人为"的地方，所以我要把候选方案一一交代。定义（`paper.tex:165-171`）：
$\mathbb U$ 是 Gram 阵为 $\left(\begin{smallmatrix}0&1\\1&0\end{smallmatrix}\right)$ 的双曲平面，

$$
P=\mathbb U\oplus D_8(-1)\oplus D_4(-1),\qquad
V_P=(\mathbb U\oplus\mathbb U(2)\oplus D_4(-1))_\mathbb Q\simeq\mathbb U_\mathbb Q^{\oplus2}\perp\langle-1\rangle^4,
$$

$\dim=8$，符号差 $(2,6)$（`paper.tex:172`）。"ample $P$-极化"指原始嵌入 $P\hookrightarrow\operatorname{NS}(S)$
且像里含 ample 类；Picard 跃升时固定的垂直仍然八维，只是它这时比 $T_S$ 大（`paper.tex:174-177`）。

我试过的第一种取法：照抄 Varesco 的四维族、通用 Picard 数 16（`paper.tex:239-241`）。
它的优点是普通 HC 已经从 KS 对应代数性推出来了（同处引 Theorem 0.2）。
问题是我要的结论包含 GHC，而且包含 Picard 跃升点；垂直维数在跃升处继续缩，参数只有四维，
没有富余去容纳 §5 那个双覆盖构造里现成的八维 $U$。[推测] 这一点是我的重构，
依据是 `paper.tex:176-177` 对"跃升处垂直仍八维但大于 $T_S$"的强调，以及 §5 的 $U$ 天生八维（`paper.tex:1307`）。

第二种取法：Picard 数 20，$T_S$ 只有二维。那样 Clifford 代数小得几乎没有自旋内容，
§9 里靠 $D_4$ 三重的半自旋筛选（`paper.tex:4401-4418`）会直接失效。

第三种取法才是文中的：八维、符号差 $(2,6)$。它同时满足四件不相干的事，我觉得这是它被选中的真实理由：

1. 判别子粘合算得动。$D_8(-1)$ 与 $D_4(-1)$ 的判别形式各是 $(\Z/2)^2$ 上的分裂型 $u$ 与非分裂型 $v$，
   取值模 $2\Z$ 是整的，故各自同构于自己的负；且 $q_{\mathbb U(2)}=u$。于是
   $(A_P,q_P)\simeq u\oplus v\simeq(A_{T_P},-q_{T_P})$，反等距把 $P\oplus T_P$ 粘成符号差 $(3,19)$ 的偶单模格，
   即 $\Lambda_{\mathrm{K3}}$，两个和因子都原始（`paper.tex:336-348`）。
2. 有理垂直唯一。换一个原始嵌入，用 Witt 延拓定理对 $P_\mathbb Q$ 的两份拷贝作 $\Lambda_{\mathrm{K3},\mathbb Q}$ 的等距把两者互送，
   有理垂直随之互送（`paper.tex:349-352`，引 `Corollary 7.2.8` 见 `paper.tex:350`）。
   再把 $\mathbb U(2)_\mathbb Q$ 的一个各向同性基向量缩放成 $\mathbb U_\mathbb Q$，并用 $D_4$ 的坐标描述得到
   $D_4(-1)_\mathbb Q\simeq\langle-1\rangle^4$（`paper.tex:353-356`）。
   这一步对我极关键：定理假设里的"嵌入进 $V_P$"因此是一个**有理**条件，与整格细节脱钩。
3. 符号差刚好允许 K3 型的周期。$V_P$ 的 $(2,6)$ 意味着周期域是四维型 IV 域，
   §8 的单值与 §5 的周期映射秩 6 都靠这个维数匹配（`paper.tex:1626-1627`、`paper.tex:4897-4898`）。
4. $\dim=8$ 让 $C^+(U,q)$ 的维数是 $2^7=128$，半自旋模 $S_\pm$ 的权是
   $\tfrac12(e_1+e_2+e_3\pm e_4)$，正落在 $D_4$ 根系里可枚举的那三个里
   （`paper.tex:4261`、`paper.tex:4401-4418`）。

最后还有一件我起初以为是必要的、后来发现只是标准件的事：这样的格能作为精确的 Néron--Severi 格出现。
取 $T_P$ 周期域里避开可数多个由不属于 $P$ 的整向量给出的超平面的周期，周期满射给出
$\operatorname{NS}$ 恰为 $P$ 的 K3；因 $P$ 含正类它是射影的，其 ample 锥含 $P$ 中一个原始整类（`paper.tex:359-365`）。
我原来担心"精确 $\operatorname{NS}=P$"要额外造族，其实周期与室内定理直接把这件事打包了（同处引 Huybrechts）。

一个术语上的坑值得记录：这里的几何 $U$ 与双曲平面 $\mathbb U$ 是两个对象；
辅助 K3 记作 $S^0$，双覆盖曲面记作 $X$，最终 K3 记作 $S$（`paper.tex:324-326`）。
我在 §5 与 §7 之间来回换记号时，靠这三行约定救命。
圈的作用约定也一并记下：$Z\in\operatorname{CH}^r(M\times N)_\mathbb Q$ 作用为
$Z_*x=(p_N)_*(\operatorname{cl}(Z)\smile p_M^*x)$，次数移动由对应 Tate 扭转承担；
只用由圈表示的上同调投影，不用"模有理等价幂等"那种说法（`paper.tex:316-323`）。

[探针] 落盘探针行：基线 12980 字节，本行用于确认写入生效。

## 4 把一张张量扩成全部外幂：我算错的两处

### 4.1 先把"代数"这件事本身做成可操作的

我原先把 K3 的动机投影当成一件需要深刻定理的事，结果发现这里只用最土的写法就够了（`paper.tex:381-389`）：
取一点 $o$、$\operatorname{NS}(S)_\mathbb Q$ 的一组基 $D_1,\ldots,D_\rho$、交积矩阵的逆 $(b^{ij})$，则

$$
\pi_0=[o]\times S,\quad \pi_4=S\times[o],\quad
\pi_N=\sum_{i,j}b^{ij}D_i\times D_j,\quad
\pi_T=\Delta_S-\pi_0-\pi_4-\pi_N
$$

在 $\operatorname{CH}^2(S\times S)_\mathbb Q$ 里就是上同调投影。$N$ 上的形式由 Hodge 指标定理非退化，这点被明确写出来（`paper.tex:390-392`）。
$k$ 个 $\pi_T$ 相乘再接交替算子
$\operatorname{Alt}_k=\frac1{k!}\sum_{\sigma}\operatorname{sgn}(\sigma)\sigma$（`paper.tex:399-402`），
得到像为 $\bigwedge^kT\subset H^{2k}(S^k,\mathbb Q)$ 的代数投影 $\pi_{\wedge,k}$（`paper.tex:403-406`）。
它对中交配对自伴，因为转置把置换换成它的逆（`paper.tex:407-409`）；
于是在 $\bigwedge^kT$ 上导出的配对是外积配对的某个非零有理倍数，非退化（`paper.tex:410-411`）。

Abel 侧我也要一件同类工具：若 $\dim A=g$、$a\ge2$，多项式

$$
\pi_1^A=\prod_{\substack{0\le j\le 2g\\ j\ne1}}\frac{[a]^*-a^j\operatorname{id}}{a-a^j}
$$

作用成到 $H^1(A,\mathbb Q)$ 的投影（`paper.tex:413-421`）。这个我一开始想用 Chow 环里的 Künneth  projector，
绕了一圈才发现用乘以 $a$ 的图的转置造多项式最省事，且它天生是圈。

系数扩张那条约定我很看重（`paper.tex:423-435`）：所谓"带 $K\supset\mathbb Q$ 系数的代数类"，
指有理像的标量扩张中的元素，于是有下降恒等式
$H_\mathbb Q\cap(A_\mathbb Q\otimes_\mathbb Q K)=A_\mathbb Q$（`paper.tex:428-431`），
理由是 $H_\mathbb Q/A_\mathbb Q$ 对域张量是忠实的（`paper.tex:432`）。
§4.4 与 §9 里两次要在 $K$ 上算完再落回 $\mathbb Q$，靠的都是这一条，我把它单独记下来当"可复用的护栏"。

### 4.2 交替复合与那个赋值恒等式

命题 `ext:conditional`（`paper.tex:439-467`）是要害：假设那个圈存在，则对每个 $1\le k\le t$，
有单射代数 Hodge 映射 $F_k:\bigwedge^kV\to\operatorname{End}(W)$ 且它在上同调上有代数左逆；
精确地说，取 $Z=A^2$、$n=\dim Z=2g$，存在对应
$\Gamma_k\in\operatorname{CH}^{k+1}(S^k\times Z)_\mathbb Q$ 与 $R_k\in\operatorname{CH}^{n+k-1}(Z\times S^k)_\mathbb Q$，
满足 $(\Gamma_k)_*|_{\wedge^kV}=F_k$、$(R_k)_*F_k=\operatorname{id}$；
并且 $\bigwedge^kV$ 里每个有理 Hodge 类都是 $S^k$ 上余维 $k$ 的有理代数圈之类。

我第一次尝试造 $F_k$ 时想得很粗：把 $j_w$ 复合 $k$ 次，然后说它的符号部分是 $\bigwedge^k$。
错在没看清复合以后落在 Clifford 代数的哪一块。论文的算法（`paper.tex:486-498`）是
**交替地**复合 $k$ 个 $j_w$，结合律直接给出

$$
j_w(v_1)\cdots j_w(v_k)(a)=v_1\cdots v_k\,a\,w^k,
$$

于是若 $c_k:\bigwedge^kT\to C(T,q)$ 是反对称化的 Clifford 乘法，就有
$F_k(\alpha)(1)=c_k(\alpha)w^k$（`paper.tex:495-497`）。
Clifford 的 PBW 分解把 $c_k$ 认成次数 $k$ 的外幂和因子，故 $c_k$ 单射；
又 $w^{-1}=w/q(w,w)$，右乘 $w^k$ 可逆，所以每个次数上 $F_k$ 都单射（`paper.tex:498-501`）。
$k$ 为奇数时左右 Clifford 乘都是奇的，复合仍保 $C^+(T,q)$（`paper.tex:502-504`）。
我复盘自己错在哪：交替这一步不是美化，它是把复合结果**投影到 PBW 的次数 $k$ 分量**的机制，
少了它就没有赋值恒等式，也就没有单射性证明。

同一处还有一句我认为应当抄在笔记扉页的话：这个构造用的是 $\eqref{ext:exact\text{-}kappa}$ 里的确切乘法，
"$H^2(A^2,\mathbb Q)$ 里一个未指明的 $T$ 的代数副本"推不出上面那条赋值式（`paper.tex:512-516`）。
这正好解释 §1 里那两条近路为何走不通。

$F_k$ 作为 Hodge 映射：$j_w$ 对左自旋作用是 Hodge 态射，张量积、复合、交替都保这个性质，
于是有未扭转写法 $F_k:\bigwedge^kT\to B_W(1-k)$（`paper.tex:506-512`），
其中 $B_W=H^1(A,\mathbb Q)\otimes H^1(A,\mathbb Q)\subset H^2(Z,\mathbb Q)$，极化把 $\operatorname{End}(W)$ 认成 $B_W(1)$（`paper.tex:480-484`）。

### 4.3 正向圈的次数账

造 $\Gamma_k$ 的过程（`paper.tex:518-540`）我逐步核对过次数：
先用 $\pi_T$ 与 $\pi_1^A\boxtimes\pi_1^A$ 投影假设里那个圈，取它的 $k$ 次外积，再用 $\pi_{\wedge,k}$ 投影输入；
$\operatorname{End}(W)$ 里的复合要用 $e$ 收缩 $k-1$ 对 $W$-槽位。每次收缩都是代数的，
由 $(\Delta_A)_*(\ell^{g-1})\in\operatorname{CH}^{2g-1}(A^2)_\mathbb Q$ 实现，它把上同调次数降 $2$（`paper.tex:523-529`）。
剩下两个未收缩的槽给出 $Z$；置换一次因子带来的符号被吸进圈的系数（`paper.tex:530-532`）。
最后次数自洽性是这么验的：次数移动 $2-2k$ 恰好等于 $2((k+1)-\dim S^k)$（`paper.tex:538-539`），
输出扭转是 $1-k$（`paper.tex:540`）。我第一遍没留意"$\dim A=g$ 由 ample 类 $\ell$ 定极化
$e(x,y)=\int_A x\cup y\cup\ell^{g-1}$"（`paper.tex:470-474`）就急着算次数，结果把 $2g-1$ 写成 $2g$，
自洽性检查当场报错，这类小账在长证明里最能救命。
另外同一处还提前处理了一个隐患：换有理极化不破坏代数性，
因为在对偶槽上的变化是 $H^1(A,\mathbb Q)$ 的有理 Hodge 自同构，它来自有理系数的 Abel 同态（`paper.tex:475-479`）。

### 4.4 左逆：我从"逆 Lefschetz"这条死路被拽回来

我第二个真正的错误在这里。要证 $(R_k)_*F_k=\operatorname{id}$，我的第一反应是
"把 $\Gamma_k$ 转置，再除以 Lefschetz 算子的幂"，也就是指望存在某个代数圈实现 $L^{-1}$。
这是行不通的，逆 Lefschetz 一般没有代数实现。文中的做法（`paper.tex:542-594`）我逐句读过，
它的聪明处在两点。第一点是把像塞进一个真正被极化的空间：
令 $L=\operatorname{pr}_1^*\ell+\operatorname{pr}_2^*\ell$，展开 $L^{n-1}$ 可见每一项在每个 Abel 因子里的次数都是奇的，
而 $A^2$ 上唯一可能的最高双次数是 $(2g,2g)$，故 $L^{n-1}B_W=0$，即 $B_W$ 对 $L$ 是原始的（`paper.tex:543-551`）。
于是
$Q_Z(x,y)=\int_Z x\cup y\cup L^{n-2}$
在 $B_W$ 上是（差一个定号）极化（`paper.tex:552-557`）。
把 $F_k$ 重新扭转成权 2 的 Hodge 态射 $(\bigwedge^kT)(k-1)\to B_W$，其像就是 $B_W$ 的 Hodge 子结构，
$Q_Z$ 限制到像上非退化（`paper.tex:553-557`）。
第二点是只用"乘 ample 类 + 转置 + 有限维和因子上的多项式逆"：
$G_k$ 依次是乘 $L^{n-2}$、$\Gamma_k$ 的转置、$\pi_{\wedge,k}$，属于 $\operatorname{CH}^{n+k-1}(Z\times S^k)_\mathbb Q$
（`paper.tex:559-569`）。$\pi_{\wedge,k}$ 自伴给出伴随恒等式
$Q_k(G_kF_kx,y)=Q_Z(F_kx,F_ky)$（`paper.tex:570-574`），两边配对都非退化，故 $D_k=G_kF_k$ 在 $\bigwedge^kT$ 上可逆。
其特征多项式常数项非零，Cayley--Hamilton 给出 $P_k\in\mathbb Q[X]$ 使 $P_k(D_k)D_k=\operatorname{id}$，
而 $P_k(D_k)$ 由 $\operatorname{CH}^{2k}(S^k\times S^k)$ 里的圈实现，用 $\pi_{\wedge,k}$ 当该和因子的恒等（`paper.tex:579-586`）。
取 $R_k=P_k(D_k)G_k$ 就有 $R_kF_k=\operatorname{id}$。文中特别写明这"不需要 Lefschetz 算子的代数逆"
（`paper.tex:589-591`），我认为这句话就是替我这种走错路的人写的路牌。
副产品还有：$\Gamma_k\circ R_k$ 是 $Z\times Z$ 上余维 $n$ 的圈，给出到 $F_k(\bigwedge^kT)$ 的上同调投影（`paper.tex:592-594`）。

Hodge 类的代数性收尾只用了一次 Lefschetz $(1,1)$：
$\alpha\in(\bigwedge^kV)^{0,0}_\mathbb Q$ 映到 $B_W$ 里是有理 $(1,1)$ 类，故由 $Z$ 上除子类表示；
再作用 $R_k$ 取回 $\alpha$，得到的圈在 $S^k$ 上余维为 $1+(n+k-1)-n=k$（`paper.tex:596-600`）。
我原来担心"$\alpha$ 有代表除子"这件事会不会依赖 $Z$ 的模结构，其实只需要它在 $Z$ 上是 $(1,1)$。

### 4.5 普通 HC：Zarhin 分组、实数域与 CM 两支

命题只解决了 $\bigwedge^kV$ 里的类。全部张量 Hodge 类要靠 Hodge 群。
先做个体曲面层面的准备（`paper.tex:674-682`）：$T$ 是单的（半单性分裂出子结构，而 $(2,0)$ 只有一维，
别的和因子只能是 $(1,1)$ 型，与 $T$ 的定义和 Lefschetz $(1,1)$ 冲突），
于是 $E=\operatorname{End}_{\mathrm{Hdg}}(T)$ 是除环，它在 $H^{2,0}(S)$ 上的忠实作用把它嵌进 $\mathbb C$，故是数域。
Zarhin 定理（按 `paper.tex:684-686` 所引的两份复述版本）给出两支（`paper.tex:687-699`）：
$E$ 全实时 $\operatorname{Hg}(V)=\operatorname{Res}_{E/\mathbb Q}\operatorname{SO}(T,\phi)$，$q$ 是 $\phi$ 的迹；
$E$ 为 CM、实子域 $E^+$ 时 $\operatorname{Hg}(V)=\operatorname{Res}_{E^+/\mathbb Q}\operatorname{U}(T,\phi)$，$\phi$ 是 Hermitian 型。
这里 $\operatorname{Hg}(V)$ 是由 Hodge 圆生成的有理连通群，其不变张量恰是有理 Hodge 张量（`paper.tex:700-702`）。
取有限 Galois 域 $K/\mathbb Q$ 含 $E$ 的所有嵌入的像，写 $V_K=\bigoplus_\eta V_\eta$（`paper.tex:704-708`）。
实情形各和因子对 $q$ 互相正定且非退化，标量扩张后群变成各满正交群的乘（`paper.tex:709-712`）；
CM 情形 $q$ 把 $V_\eta$ 与 $V_{\bar\eta}$ 完美配对、与其余为正交，群变成每个共轭对上一个 $\operatorname{GL}$（`paper.tex:713-717`）。

全实支的额外生成元是相对体积张量。每条 $\bigwedge^dV_\eta\subset(\bigwedge^dV)_K$ 都被上面的群固定，
而有理代数群的不变量在标量扩张下可交换，故这些线属于 $\bigwedge^dV$ 的有理 Hodge 类空间的标量扩张；
命题 `ext:conditional` 证它们代数（`paper.tex:727-735`）。文中点明这正是 Varesco 认定的
额外正交不变生成元（`paper.tex:736-737`，对 Theorem 2.16）。
把 $\alpha_\eta\otimes\alpha_\eta$ 用 $q$ 收缩 $d-1$ 对槽位，得到
$c_\eta q_\eta^{-1}\in V_\eta\otimes V_\eta$，$c_\eta\in K^*$（`paper.tex:740-745`）。
这里有个我自己验过的小技术：正交基 $u_1,\ldots,u_d$、$q(u_i,u_i)=a_i\ne0$ 时，
剩下的张量是 $\sum_i a_i^{-1}u_i\otimes u_i$ 的非零倍数，其标量含 $\prod_i a_i$，所以收缩不可能为零（`paper.tex:746-751`）。
我第一遍漏看了"不可能为零"这句，把正交投影 $p_\eta$ 的代数性当成显然，
其实它正是靠"把 $q_\eta^{-1}$ 与 $q$ 配对一个槽"来造的，非零性是那一步的前提（`paper.tex:757-759`）。
于是 $a\in E$ 的作用写成 $a=\sum_\eta\eta(a)p_\eta$（`paper.tex:760-763`），
它是有理的，再用下降恒等式（`paper.tex:764-766`）就得到有理代数性。

CM 支里我原本想直接引用"范数元生成 $E$"这类现成话，文中给了完整初等证明（`paper.tex:769-779`）：
有理张成的范数一元子集 $F$ 是含幺子代数故为域；若 $\bar s=-s$，则
$u=\frac{1+s}{1-s}$ 满足 $u\bar u=1$，而 $s=\frac{u-1}{u+1}\in F$，分母非零且 $u+1=2/(1-s)$；
固定这样一个 $s$，任意 $a\in E^+$ 有 $as\in F$，故 $a=(as)/s\in F$，于是 $F=E$。
每个范数一元元素都是 $T$ 的 Hodge 等距，在 $N$ 上延成恒等就是 $H^2(S,\mathbb Q)$ 的有理 Hodge 等距，
由 Buskin 定理代数（`paper.tex:781-784`）；有理线性组合加 $\pi_T$ 投影给出 $E$ 中全部自同构。
取 $E/\mathbb Q$ 的本原元 $b$，则 $p_\eta=\prod_{\tau\ne\eta}\frac{b-\tau(b)\operatorname{id}}{\eta(b)-\tau(b)}$
在 $K$ 系数下实现逐个特征投影（`paper.tex:785-792`），
再对逆度量作用 $p_\eta\otimes p_{\bar\eta}$ 就得到标准的标准--对偶配对张量（`paper.tex:793-794`）。
同处还提醒：需要 CM 的是**endomorphism 域**，不要求 $T$ 在该域上一维（`paper.tex:794-795`）。

不变量生成那一段（`paper.tex:798-816`）我一开始担心经典不变量第一基本定理有稳定范围限制，
文中直接说明张量形式下没有这个限制：正交群由度量与体积张量生成，$\operatorname{GL}$ 由标准--对偶配对生成，
标准槽与对偶槽数目须相等，完全配对收缩张成不变量空间，并给出 Kraft--Procesi 与 Lehrer--Zhang 的出处。
之后按 $V^{\otimes r}$ 逐槽用 $p_\eta$ 分解、逐因子取不变量、再用乘积/置换/$T$ 上代数对偶拼装，
最后用下降回到 $\mathbb Q$，得到 $V^{\otimes r}$ 中每个有理 Hodge 张量在 $S^r$ 上都是余维 $r$ 类（`paper.tex:817-830`）。
Künneth 组装（`paper.tex:832-841`）：对 $S^m$ 每个因子用 $\pi_0,\pi_4,\pi_N,\pi_T$ 投影，
$H^*(S,\mathbb Q)$ 唯一的非 Tate 和因子是二维里的 $T$；若某分量有 $r$ 个超越槽、$a$ 个除子槽、$b$ 个顶次槽，
则次数为 $2r+2a+4b$，构造出的圈余维为 $r+a+2b$，正好对上。
这一算完我承认：整段普通 HC 的 Clifford 输入只有假设里那一个映射，入口是 `ext:conditional`（`paper.tex:844-846`）。

### 4.6 GHC：把子结构塞进固定支撑，靠最高权数外幂个数

支撑侧的引擎是一条极朴素的引理（`paper.tex:613-621`）：若
$C\in\operatorname{CH}^{N+p}(X\times Y)_\mathbb Q$，$\dim X=N$、$\dim Y=D$、$p\ge0$，
则 $C_*$ 的像被 $Y$ 中某个固定的、余维至少 $p$ 的闭集支撑，
特别地 $C_*H^j(X,\mathbb Q)\subset N^pH^{j+2p}(Y,\mathbb Q)$。
于是 GHC 的困难被转移到"要把一个给定的 Hodge 子结构 $H$ 写成多少个外幂的商"。
设定（`paper.tex:859-870`）：$H\subset H^{2d}(S^m,\mathbb Q)$ 单、Hodge coniveau 至少 $p$，
则 $H(d)$ 的 Hodge 水平至多 $2(d-p)$；目标是把每个非平凡的 $H(d)$ 实现为 $c\le d-p$ 个外幂张量积的商，
控制支撑的是**个数** $c$ 外幂次数之和；$c$ 个返回对应再复合一个由普通 HC 实现的商映射，
目标支撑余维至少 $d-c$。

承载引理（`paper.tex:872-911`）的证明我读得很慢，因为这里是我先前犯概念错误的地方。
我一度以为要处理旋量表示：$\operatorname{SO}_t$ 的张量幂里会出现半整数权。
文中先一刀切掉（`paper.tex:896-898`）：这里只出现整张量权，标准模的张量幂里没有半整数自旋权。
具体做法是取正定环面坐标使 Hodge 余特征为 $1,0,\ldots,0,-1$；
不可约合成分量以最高权 $\lambda$ 标记（奇数维 $\lambda_1\ge\cdots\ge\lambda_l\ge0$，
偶数维 $\lambda_1\ge\cdots\ge\lambda_{l-1}\ge\lvert\lambda_l\rvert$，`paper.tex:888-894`），
Hodge 余特征在其权集上的最大值是 $\lambda_1$（余特征支配、权落在 Weyl 轨道凸包内），
正交 Weyl 群又给出 $-\lambda_1$，故该分量 Hodge 水平恰为 $2\lambda_1$（`paper.tex:899-904`）。
取 $c=\lambda_1$：奇数维用分拆 $(\lambda_1,\ldots,\lambda_l)$ 的各列，列数正是 $c$，
$c$ 个外幂最高权向量之张量积仍是权 $\lambda$ 的最高权向量，完全可约性给出所需满 Hodge 映射（`paper.tex:906-911`）。
我复盘：我的错误是试图在"中间外幂"这一个复表示里找有理分裂，
而文中的路线（`paper.tex:853-856`）刻意绕开这一点，改用"乘积的幂上的普通 HC 把映射本身代数化"，
所以完全不需要那个分裂。这个取舍是 GHC 部分最关键的转折。

## 5 几何侧：Abel 曲面双覆盖里现成的八维 $U$

### 5.1 我需要什么样的几何对象

抽象侧完成后，剩下的问题很具体：到哪里造出一个 $\operatorname{Hg}=\operatorname{SO}$ 的八维 K3 型结构，
让它的指定 KS 张量被几何地实现成圈。我对候选对象的要求列了三条：
带一个六维族（好和 $V_P$ 的四维周期域加上格本身的方向匹配）、周期映射满秩、
$H^2$ 里有一块天然的 $(j,\delta)$ 特征子空间。文中选的载体是 Abel 曲面的双覆盖（`paper.tex:1211-1215`），
并靠反演商的分辨提供要用到的二次型。

数据（`paper.tex:1219-1225`）：$B$ 是不可分解的 principal 极化 Abel 曲面，$M=\mathcal O_B(H)$ 给出极化的对称线丛，
$\chi\in\operatorname{Pic}^0(B)[4]$ 恰四阶。要用的 theta 事实（`paper.tex:1227-1245`）：
$h^0(B,M\chi)=h^0(B,M\chi^{-1})=1$、$h^0(B,M^2)=4$、这些层上同调更高次消零；
$|M^2|$ 无基点，因为 $H$ 的相反平移之和都在其中，任给一点可选两平移都避开它；
$M^2$ 的规范化对称线性化固定每个截面，例如周期坐标下四个二阶 theta 截面
$\theta[\epsilon;0](2z,2\tau)$，用 $n\mapsto-n-2\epsilon$ 重指标级数即证它们为偶，
不同的 Fourier 同余类给出基。取 $[d]\in\mathbf P H^0(B,M^2)$、$D=(d=0)$，
限制到"$D$ 光滑且避开 $B[2]$"的非空开集（Bertini 加无基点，避开 $B[2]$ 处有限多个求值超平面即可，`paper.tex:1247-1253`）。
每个这样的 $D$ 在反演下不变，参数空间是三维 Abel 数据图上方射影 $3$-空间丛中的开集，维数 $6$。

我一开始担心"选归一化截面"会破坏代数性：文中处理得很干脆（`paper.tex:1255-1264`）。
在秩四截面丛的代数仿射图上平凡化后取非零相对泛函 $\ell$，在 $\ell(d)\ne0$ 上用真的归一化万能截面 $\ell(d)=1$；
单连通多圆盘上两种归一化相差一个无非零点的标量，它有全纯平方根，
用该平方根缩放覆盖坐标就把覆盖、对合、有理特征子空间都认成同一个。
这段读起来像小事，但它决定了后面 $z^2=\pi^*d$ 里 $z$ 的约定是否与 $j$ 相容。

构造（`paper.tex:1265-1289`）：$\pi:B'\to B$ 是对应 $\chi^2$ 的二次同源，$\pi_*\mathcal O_{B'}=\mathcal O_B\oplus\chi^2$；
取 $\pi^*\chi^2$ 的平凡化，令 $L=\pi^*(M\chi)$，
$f:X=\operatorname{Spec}_{B'}(\mathcal O_{B'}\oplus L^{-1})\to B'$，$z^2=\pi^*d$。
$\pi^*\chi$ 二阶故 $L$ 对称；把对称线性化在原点规范化后，
它的平方与 $M^2$ 规范化线性化的拉回在原点相同，而 Abel 簇上线丛的自同构是标量，故处处相同；
于是反演提升为 $X$ 上与 $\delta$ 交换的对合 $j$。要的对象是
$U_X=H^2(X,\mathbb Q)^{j=1,\,\delta=-1}$。

### 5.2 反演商 $Y$ 与那八个 $-4$ 类

命题 `geom:structure`（`paper.tex:1293-1328`）给出三件事：
存在光滑二重覆盖 $Y\to K=\operatorname{Km}(B')$；
(i) 反不变格 $V=H^2(Y,\Z)^{\delta=-1}$（去挠）偶、符号差 $(2,14)$、判别群 $2$-初等，固定 $(B,M,\chi)$ 时单值在其上平凡；
(ii) 有八个两两正交的代数反不变类 $a_1,\ldots,a_8$，每个平方 $-4$，其垂直
$U=\langle a_1,\ldots,a_8\rangle^\perp\subset V_\mathbb Q$ 是符号差 $(2,6)$ 的 Hodge 结构，
用从 $Y$ 继承的交积形式时理性等距于 $V_P$；
(iii) 分辨拉回给出平坦 Hodge 同构 $\beta:U\xrightarrow{\sim}U_X$ 且 $(\beta x,\beta y)_X=2(x,y)_Y$；
代数投影 $e=\frac14(\Delta_X+\Gamma_j-\Gamma_\delta-\Gamma_{j\delta})\in\operatorname{CH}^2(X\times X)_\mathbb Q$
在二维里像为 $U_X$，在其他次数为零。

证明里我最欣赏"符号账"。写 $B=\mathbb C^2/\Lambda$、$\chi$ 由恰四阶特征 $c:\Lambda\to\mu_4$ 表示，
$B'=\mathbb C^2/\Lambda'$、$\Lambda'=\ker(c^2)$；取 $\lambda\in\Lambda\setminus\Lambda'$，$k=\lambda\bmod\Lambda'\in\ker\pi$。
平移 $k$ 把 $B'[2]$ 的十六个点配成对。$\pi^*M$ 在 $x$ 与 $x+k$ 符号相同（像在 $B$ 中相同），
而平坦因子的符号变化是 $\frac{c(2v+2\lambda)}{c(2v)}=c(2\lambda)=-1$，
所以 $L$ 在每对里符号相反：八正八负（`paper.tex:1331-1345`）。
分支曲线在这十六点附近缺席。正号点处 $j$ 保每张局部叶且 $(u,v)\mapsto(-u,-v)$，
商有两个常节点，分辨给出 $K$ 上对应例外曲线之上的两条不相交 $(-2)$ 曲线；
负号点处 $j$ 交换两叶，商光滑，映射到 $B'/\{\pm1\}$ 局部是 $\mathbb C^2\to\mathbb C^2/\{\pm1\}$，
分辨光滑源点给出沿 $K$ 例外曲线分支的二重覆盖（`paper.tex:1347-1356`）。

拓扑账（`paper.tex:1358-1380`）：$D'=\pi^{-1}D$ 光滑连通、$(D')^2=16$、亏格 $9$；
反演在 $D'$ 上自由，故商亏格 $5$；$Y\to K$ 的分支是那个商加上负号对应的八条例外曲线，
于是 $e(Y)=2e(K)-((2-2\cdot5)+8\cdot2)=48-8=40$。
由覆盖代数、Serre 对偶与 ample 消零得 $H^1(B',L^{-1})=0$，从而 $H^1(X,\mathbb Q)=f^*H^1(B',\mathbb Q)$，
反演在此空间上是 $-1$，取商不变量（并用中间分辨下 $H^1$ 的不变性）得 $q(Y)=0$。
$H^{2,0}(X)=H^{2,0}(B')\oplus H^0(B',L)$，$H^0(B',L)=H^0(B,M\chi)\oplus H^0(B,M\chi^{-1})$；
第一因子对两个对合都不变，反演把 $\chi$ 换成 $\chi^{-1}$，而所用 $\pi^*\chi^2$ 平凡化有非平凡 deck 特征，
故它交换 $H^0(B',L)$ 里那两个一维和因子，它们是叶反不变的，于是 $p_g(Y)=2$。
由此 $b_2(Y)=38$，Hodge 指标给 $H^2(Y)$ 上符号差 $(5,33)$。
叶不变有理上同调是 $H^2(K,\mathbb Q)$ 的拉回（配对乘 $2$），符号差 $(3,19)$，其垂直 $V_\mathbb Q$ 为 $(2,14)$。
$K_Y$ 不变且对 $v\in V$ 有 $v\cdot K_Y=0$，Wu 特征公式 $v^2\equiv v\cdot K_Y\pmod2$ 说明 $V$ 偶
（`paper.tex:1382-1391`）。我第一遍在这里想用"整除性"糊过去，其实文中给的是标准引用（Milnor--Stasheff 定理 11.14 与问题 14-B）。

整条（`paper.tex:1393-1408`）：记 $\mathcal H=H^2(Y,\Z)/$torsion、$\mathcal H^+$ 为不变格。
整 Poincaré 对偶使 $\mathcal H$ 单模；两个特征子格都原始且 $2x=(x+\delta x)+(x-\delta x)$，
故 $\mathcal H/(\mathcal H^+\oplus V)$ 被 $2$ 零化，单模粘合把它同时认成 $A_{\mathcal H^+}$ 与 $A_V$，
判别群 $2$-初等；固定 $B'$ 时从分辨 Kummer 曲面拉回让不变有理上同调逐点常定，
其整格与判别群随之固定，粘合识别是等变的，故单值在 $A_V$ 上平凡。

八个 $a_i$ 来自正号点上两条互相被 $\delta$ 交换的例外曲线：$a_i=[E_i^+]-[E_i^-]$，$a_i^2=-4$，
两两正交；平行移动可换指标或交换两曲线但保其张成，故垂直 $U$ 平坦；
分支经过正号点的退化附近，两个标号由一个标量平方根支配，局部作用把 $a_i$ 变号（`paper.tex:1410-1420`）。
同一批局部模型认出 $U$ 与 $U_X$ 相同：正号点处两个商节点只添一个叶反不变例外方向即 $a_i$，
负号点处 blowup 只添叶不变方向；公共分辨上 $U$ 中类的拉回与所有 $X$ 上例外类正交，故来自 $H^2(X,\mathbb Q)$，
像恰为 $(j,\delta)=(1,-1)$ 特征子空间；二次投影公式给出那个因子 $2$（`paper.tex:1422-1435`）。
我一开始想找"$U$ 与 $U_X$ 的等距是哪来的"，其实是分辨几何自动给的，代价是形式差一个倍数 $2$；
这个 $2$ 在后面 §8 与 §9 被反复引用，文中也声明全程保留 $Y$ 配对（`paper.tex:1434-1435`）。

判别式账（`paper.tex:1444-1456`）：$\mathcal H^+$ 含有限指标的拉回格 $H^2(K,\Z)(2)$，指标必为 $2$ 的幂；
后者绝对行列式 $2^{22}$，故 $\lvert\det\mathcal H^+\rvert$ 在 $\mathbb Q^*/\mathbb Q^{*2}$ 中是平方；
单模粘合给 $V$ 同样绝对行列式，$V$ 负指数十四故行列式为正；
剥掉八条平方 $-4$ 的正交直线得 $\det U=1$ 于 $\mathbb Q^*/\mathbb Q^{*2}$。
这一步加上下文（我没读完的 1457-1485 区间，`[推测]` 处理奇 $p$ 处的局部正交性与 Hasse 不变量，
依据是同段开头那句"对奇素数 $p$，投影 $(1\pm\delta)/2$ 分裂……"，`paper.tex:1456-1457`）
才能把八维 $(2,6)$ 型且判别为 $1$ 的形式认成 $V_P$。

### 5.3 周期微分为何就是乘 $\theta$

引理 `geom:twisted-hodge`（`paper.tex:1487-1506`）：令 $E=T_B(-\log D)$，则
$U_X^{p,q}\simeq H^q(B,\Omega_B^p(\log D)\otimes M^{-1}\chi)$（$p+q=2$），特别 $U_X^{2,0}=H^0(B,M\chi)$ 一维；
固定平移不变体形式 $\Omega$、$\theta\in H^0(B,M\chi)$ 表示该线，则周期微分是
$E\xrightarrow{\ \theta\ }E\otimes M\chi\simeq\Omega_B^1(\log D)\otimes M^{-1}\chi$
在 $H^1$ 上诱导的映射；
Kodaira--Spencer 把整个六维族 $(B,M,\chi,[d])$ 的切空间认成 $H^1(B,E)$。

证明的两条支柱我都重推过。第一条是特征子空间的直接读法（`paper.tex:1509-1541`）：
取平凡化 $\chi$ 的循环四阶同源 $\alpha:\widetilde B\to B$、生成元 $g$，以及无扭转双覆盖 $Z\to B$、$w^2=d$；
在 $\widetilde X=Z\times_B\widetilde B$ 上 $\delta$ 变 $w$ 号、$g$ 通过同源作用，
则 $X=\widetilde X/\langle\delta g^2\rangle$。叶反不变上同调里 $\delta g^2$ 不变恰好挑出 $g$ 特征值 $i,-i$；
反演把 $g$ 共轭成 $g^{-1}$ 并交换这两个特征子空间，故向其中之一投影就把其 $j$-不变部分认成该特征子空间（复数上）。
局部直接算：$D=(x=0)$、$w^2=x$ 时叶奇全纯形式由 $w;\ w\,dy,\ w\,\frac{dx}{x};\ w\,\frac{dx}{x}\wedge dy$ 生成，
奇生成元的转移律是 $M^{-1}$ 的，于是叶奇的 $p$-形式直像是 $\Omega_B^p(\log D)M^{-1}$，选特征再张 $\chi$；
其对数平坦微分有局部项 $\frac12d\log x$ 加上 $\chi$ 的平坦联络。

第二条是"切空间真的是 $H^1(B,E)$、维数真是 $6$"（`paper.tex:1543-1620`）。
无穷小变化给出对数向量场的 Čech 上循环；局部上满足 $v(f)=af$ 的对数字段在 $w^2=f$ 上提升为
$v+\frac a2 w\partial_w$，且唯一（保持 $w^2=f$ 的竖直无穷小变化系数 $b$ 满足 $2b=0$）。
与叶奇二维形式缩并算出 Hodge 线上的 Kodaira--Spencer 作用，上面的局部生成元把这个缩并认出是乘 $\theta$；
所用丛同构是秩二行列式恒等式 $E\otimes\mathcal O_B(D)\simeq\Omega_B^1(\log D)$，$\mathcal O_B(D)=M^2$。
我承认这里最容易算错的是切空间维数。我最初按 $(B,D)$ 的变形计数得 $4+3=7$，
文中的账（`paper.tex:1561-1595`）是这样：保持 $D$ 的无穷小平移为零（其流会落在 $\mathcal O_B(D)$ 的稳定子里，
即极化同源的有限核），故 $H^0(E)=0$；正合序列给出
$0\to H^0(K_D)/H^0(T_B)\to H^1(E)\to\ker(H^1(T_B)\to H^1(K_D))\to0$，
其中 $h^0(K_D)=5$、$h^0(T_B)=2$、$h^1(T_B)=4$；由 $0\to\mathcal O_B\xrightarrow{\ d\ }M^2\to K_D\to0$
把 $H^1(K_D)$ 认成 $H^2(\mathcal O_B)$，两个边界映射都是与 $c_1(D)$ 缩并（局部标架验证写在 `paper.tex:1585-1592`），
该缩并非零且其三维核恰为 $B$ 的极化变形切空间，故 $h^1(E)=3+3=6$。
剩下的是确认附加数据不添方向：扩 $M$ 施加同一条件（$c_1(M)=\frac12c_1(M^2)$），
对称代表在无穷小扩张中唯一（差组成 $H^1(\mathcal O_B)$-torsor，反演在其上作 $-1$），
四阶点与同源唯一扩展（相对 Picard 簇的扭元有限étale）；
截面方向 $H^0(M^2)/\langle d\rangle$ 的像恰为整个商 $H^0(K_D)/H^0(T_B)$，
因为 $v\mapsto v\mathbin{\lrcorner}c_1(D)$ 是 $H^0(T_B)\to H^1(\mathcal O_B)$ 的同构（$D$ ample）。
于是完整的 Kodaira--Spencer 映射是同构（`paper.tex:1616-1620`）。

### 5.4 满秩与"$\operatorname{Hg}=\operatorname{SO}$"

命题 `geom:period`（`paper.tex:1625-1630`）：$U$（等价地 $U_X$）的周期映射在六维参数空间的非空 Zariski 开集上秩 $6$；
很一般的参数处有理 Hodge 结构单、无非零有理 $(1,1)$ 类、Hodge 群为 $\operatorname{SO}(U)$。
证明的主干（`paper.tex:1632-1724`，读到 1724 处未完）我记这几笔：
$F=(\theta=0)$ 是 $B$ 的 theta 曲线的平移，故是亏格 $2$ 光滑曲线且 $\operatorname{Jac}(F)\simeq B$；
不可分解在这里被真实用到（`paper.tex:1635-1646`）：奇 theta 曲线归一化亏格至多 $1$ 就生成不出 Abel 曲面，
theta 因子若不可约则由 ample 与平方 $2$ 逼出两条一次相交的椭圆分支进而乘积分极化，两种都被排除；
亏格 $2$ 由伴随给出，而限制配对（与主 theta 类 cup 积）单模，等维的 Jacobi 映射即同构。
置 $K=K_F$、$\eta=\chi^{-2}|_F$；$\operatorname{Pic}^0(B)\to\operatorname{Pic}^0(F)$ 同构故 $\eta$ 非平凡二阶；伴随给出
$(M\chi)|_F=K$、$M^2|_F=K^{\otimes2}\otimes\eta$。横向 $D$ 时乘 $\theta$ 给出
$0\to E\to E\otimes M\chi\to(E\otimes M\chi)|_F\to0$（`paper.tex:1655-1658`），
只要证明最后那个层对一般 $d$ 无截面，就得到周期微分在全部六方向单射。
$Z=D\cap F$ 是四次约化除子；限制正合后张 $K$ 得切触矩阵
$A_d:H^0(F,K)^{\oplus2}\to H^0(Z,(K^{\otimes3}\otimes\eta)|_Z)$，$v\mapsto(v\mathbin{\lrcorner}dd)|_Z$（`paper.tex:1667-1674`），
核即 $H^0(F,(E\otimes M\chi)|_F)$，源与靶都四维。
我原先担心"$A_d$ 依赖局部标架"，文中一句"在零点处对截面求导是内在的"就解决（`paper.tex:1674-1675`）。
其后用限制满射 $H^0(B,M^2)\twoheadrightarrow H^0(F,K^{\otimes2}\otimes\eta)$，核由 $\theta\theta'$ 生成，
$t=\theta'|_F$ 是 $K\otimes\eta$ 的非零截面（沿 $F$ 消失会给非平凡平坦丛 $\chi^{-2}$ 的截面）；
$K^{\otimes2}\otimes\eta$ 无基点，可取一般的 $s=d|_F$，四个零点皆单且避开 $t$ 的零点。
把 $d$ 换成 $d+\lambda\theta\theta'$ 保持 $s,Z$ 而把 $A_d$ 换成 $A_d+\lambda A'$；
平移不变向量场 $v_1,v_2$ 的法向导数 $\theta_i=(v_i\mathbin{\lrcorner}d\theta)|_F$ 给出 $H^0(F,K)$ 的基，
于是 $A'(a,b)=t(a\theta_1+b\theta_2)|_Z$；亏格 $2$ 典范铅笔给出 $\operatorname{Sym}^2H^0(K)\simeq H^0(K^{\otimes2})$，
而 $K^{\otimes2}(-Z)\simeq\eta$ 无截面故限制到 $Z$ 单射，故 $\operatorname{im} A'=t\,H^0(K^{\otimes2})|_Z$、$\operatorname{rank} A'=3$，
核由斜梯度 $k=(\theta_2,-\theta_1)$ 张成（`paper.tex:1690-1712`）。
在 $T_F\otimes K\simeq\mathcal O_F$ 下 $k$ 是常值 $c\ne0$，按 $\Res(\Omega/h)$ 的伴随约定 $c=-\Omega(v_1,v_2)$，
于是 $A_d(k)=c\,d_Fs|_Z$，剩下要证这向量不在 $\operatorname{im} A'$（`paper.tex:1714-1724`，此处我读到序列
$0\to\eta\xrightarrow{\cdot s}K^{\otimes2}\to K^{\otimes2}|_Z\to0$ 就断了，后面未读）。
[推测] 我按引言 261-268 与 1659-1662 的意图认定：这一步用 $d_Fs|_Z$ 的非零类把 $\operatorname{rank} A_d$ 抬到 $4$，
从而 $H^0(F,(E\otimes M\chi)|_F)=0$，得满秩。

## 6 相干半和：把曲面支配问题换成曲线问题

### 6.1 我原本想要的支配方式以及它为什么不成

目标是把 $U_X$ 代数地塞进 $H^1(C_1,\mathbb Q)\otimes H^1(C_2,\mathbb Q)$，这样就能用曲线上除子的代数性。
我最初的做法很直白：在 $X$ 上找两条曲线，令其乘积映射到 $X$。
这在一般的 $X$ 上没有根据，$X$ 是 Kummer 型曲面的双覆盖，里面并没有现成的曲线乘积。
文中路线（`paper.tex:1797-1804`）是：$D$ 的一般 Gauss 纤维由四个相反点对组成；
**相干地**从每对里取一点求半和，得到两条映到 $B$ 的曲线；证明它们的相加映射总次数为 $8$，
且把 $D$ 拉回成偶除子；再对这两条曲线各自作覆盖，就得到到 §5 那个 $X$ 的态射。
这个想法的源头被点明为 Donagi 四角形构造里的选择覆盖与符号奇偶分解（`paper.tex:1926-1931`），
但下面的论证要在给定的 $B$ 里造相容半和，并把相加映射经曲线覆盖提升到 $X$。

### 6.2 一般 Gauss 铅笔的五个事实

引理 `geom:gauss-generic`（`paper.tex:1808-1913`）的结论我按要点抄：
在非空 Zariski 开集上 $D$ 无非平凡平移稳定子；$C=D/\{\pm1\}$ 是光滑亏格 $3$ 曲线，
连通étale 覆盖 $D\to C$ 由非平凡 $\epsilon\in\operatorname{Pic}^0(C)[2]$ 定义；
Gauss 映射是复合 $D\to C\xrightarrow{|K_C\otimes\epsilon|}\mathbf P^1$，次数分别 $2$ 与 $4$；
四次映射没有哪个纤维的重数全为偶；把 theta、扭元、level 那些有限选择加上后，
所得每个连通分支上这个好开仍非空。

证明里我逐条复核了维数与"一般性"。$D$ 连通（由除子序列与 $H^1(\mathcal O_B(-D))=0$）故不可约；
伴随给 $2g(D)-2=D^2=8$；避开 $B[2]$ 保证反演自由，Riemann--Hurwitz 给 $g(C)=3$；
覆盖连通故 $\epsilon$ 非平凡。$D$ 生成 $B$（落在真 Abel 子簇的平移里会使其为平方零的椭圆曲线），
故 $J(D)\to B$ 满、不变一次形式限制单射；它们在反演下反不变，张成二维的 $H^0(C,K_C\otimes\epsilon)$
（维数来自 Riemann--Roch），且在 $D$ 上无公共零点（$D$ 的切线是 $T_0B$ 的非零子空间），
于是给出无基点四次铅笔 $|K_C\otimes\epsilon|$，与切方向射影线认同后即 Gauss 映射（`paper.tex:1824-1842`）。

"这些 $(C,\epsilon)$ 是一般对象"那段是我读得最费劲处，因为它要靠可数性论证（`paper.tex:1844-1872`）：
$|2H|$ 中光滑曲线的开射影丛在三维 level 模空间上方，维数 $6$，代数地映到
带非零二扭元的亏格三曲线模空间 $\mathcal R_3$；纤维可数，理由为固定 $(C,\epsilon)$ 就固定 $D$，
而该曲线到 Abel 曲面的任何映射都是 $J(D)$ 的同源再接一次平移；
满同态（到目标同构为止）成可数集：连通核由 $H_1(J(D),\mathbb Q)$ 的有理子空间决定，
再多的有限同源选择也可数；固定同态后要求象上的反演等于 $D$ 上给定的对合，
对平移 $b$ 施加 $2b=$ 常数，仅有限解；极化离散，$[D]=2[H]$ 固定数值类，余下对称 theta 与 level 选择有限。
可数纤维的有限型态射在 $\mathbb C$ 上维数 $0$；$\mathcal R_3$ 不可约且六维，故在每个六维源分支上满。
$\mathcal R_3$ 不可约来自非零二扭元上辛单值的传递单值。曲线 Torelli（带整主极化）
给出 Jacobian 映射 $\mathcal R_3\to\mathcal A_3[\epsilon\ne0]$ 零维纤维，
后者不可约六维（Siegel 空间的商，辛群在非零模 $2$ 向量上传递），故 Jacobian 映射满。

"全偶纤维"这个坏条件我原以为很难处理，文中的判据很漂亮（`paper.tex:1874-1891`）：
取 theta 特征 $\kappa$，$\Theta_\kappa=\{\alpha\in J(C):h^0(C,\kappa\otimes\alpha)>0\}$ 由 Riemann theta 定理
认成对称 theta 除子；$|K_C\otimes\epsilon|$ 里有全偶成员当且仅当存在 $2\alpha=\epsilon$ 落在 $\Theta_\kappa$ 上
（有效除子 $E$ 使 $2E\in|K_C\otimes\epsilon|$ 对应 $\alpha=\mathcal O_C(E)\kappa^{-1}$）；
此条件与 $\kappa$ 无关（theta 除子按二扭元平移只是置换那六十四个半元）；
它是 $\mathcal A_3[\epsilon\ne0]$ 上闭的（有限 theta level 覆盖上 theta 除子与有限多半截面都定义好，
与每个截面的关联是闭的，有限并可下推）。
真性用三椭圆乘积验证（`paper.tex:1893-1899`）：每个因子取非零 $\epsilon$，则每个半元坐标都是四阶，
而对称乘积 theta 除子是二扭点处的坐标除子之并，没有半元落在其上。
由此得该非空开与满的 Jacobian 轨迹相交，回溯到参数空间的非空开。
最后，$B$ 上四阶 $\chi$ 的选取与 $D,C,\epsilon$ 无关，有限étale 扭元/level 覆盖的每个连通分支满射到连通底，
故每个分支上同一开仍非空（`paper.tex:1900-1903`）。
平移稳定子部分（`paper.tex:1905-1912`）：保持 $D$ 的平移属于有限核 $K(M^2)=B[2]$；
每个非零元在 $\mathbf P H^0(B,M^2)$ 上非平凡作用，否则它与 theta 群所有元的交换子平凡，
与 theta 群配对非退化矛盾；不动集真，避开有限多个这种轨迹即得每层截纤维上的非空开。

### 6.3 相干半和与奇偶分解

引理 `geom:halves`（`paper.tex:1933-1996`）给代数映射 $h:\mathcal S\to B$ 满足
$2h(s)=\sum_{p\in s}p$、$h(s[p])=h(s)-p$；选择按符号改变次数的奇偶整体分裂成两个八次覆盖
$\mathcal S_+\sqcup\mathcal S_-$；其光滑射影完备化 $C_\pm$（可不连通）承载 $h$ 的扩张 $a_\pm:C_\pm\to B$；
微分非零处，两映射都与参数在 $\mathbf P^1$ 里记录的 Gauss 方向相切。

我的重构：这一段真正难的是"相干"两字，即局部选择要能粘成全局代数映射。
证明先固定一个正则纤维：相容赋值由一个选择 $s_0$ 与其和的一半 $b$ 唯一决定，
$h(s)=b-\sum_{p\in s_0\setminus s}p$，于是相容赋值组成常数群 $B[2]$ 下的 torsor（`paper.tex:1946-1954`）。
该 torsor 在 $R$ 上代数且有限étale：从满足 $2b=\sum_{p\in s}p$ 的对 $(s,b)$ 的覆盖出发，
把 $(s,b)$ 与 $(s[p],b-p)$ 认同；étale 局部给四对贴上标号后，翻转可交换、是对合，等价类十六个元素，
所得有限étale 商即赋值 torsor；平行移动与常数 $B[2]$ 作用交换，故单值只作平移（`paper.tex:1955-1963`）。
关键一手是绕每个被略去的值（含 $\infty$）取小圆盘（`paper.tex:1965-1977`）：
中心纤维每对选一点、取其 specializes 到该点的整簇，并集是 punctured 圆盘上单值不变的**选择**，
其和全纯扩张到圆盘；$B$ 上乘 $2$ 是étale，故在单连通圆盘上和有一个全纯半；
对应相容赋值被局部单值固定；torsor 有不动点则平移作用为恒等。
于是赋值 torsor 绕每个 puncture 单值平凡，étale 地扩张到 $\mathbf P^1$ 且平凡，任一整体截面即 $h$。
奇偶两类给出 $R$ 上二阶étale 覆盖，同样的不变选择固定两类，故它也étale 扩张到 $\mathbf P^1$ 且平凡，
贴标号得全局覆盖 $\mathcal S_\pm$；$B$ 的真性把映射唯一扩张到光滑射影完备化（`paper.tex:1979-1985`）。
切方向（`paper.tex:1986-1995`）：对 $\eqref{geom:coherent}$ 求导并用 $B$ 的不变切空间得
$da_\pm=\frac12\sum_{i=1}^4\sigma_i\,dx_i$，$\sigma_i\in\{1,-1\}$；所有 $dx_i$ 在同一 Gauss 方向，
其和只要非零仍在该方向，连续性把结论带到被略值处。

同一赋值下有个我用来自查的精确恒等式（`paper.tex:1998-2008`）：对同一正则值的两个选择
$h(s)+h(t)=2h(s)-\sum_{p\in s\setminus t}p=\sum_{p\in s\cap t}p$，特别 $h(s^c)=-h(s)$；
公共赋值按 $b_0\in B[2]$ 改变时左边变 $2b_0=0$，故恒等式与选择无关。
我拿它验算过一个具体纤维，若相加映射次数不是 $8$，这个恒等式在奇偶两类之间会自相矛盾。

[推测] 八次相加映射把 $D$ 拉回成偶除子、以及由 $C_\pm$ 到 $X$ 的覆盖提升，
在 `paper.tex:2069-2372`（"八次相加映射"与"逐次一般选择"两小节），我没有读到。
依据是命题 `geom:domination` 在 `paper.tex:4216-4227` 处被引用时的用法：
当 $U_{X_b}$ 无非零有理 $(1,1)$ 类时，它提供曲线 $C_1,C_2$、态射 $g:C_1\times C_2\to X_b$
与对应 $Z_X=(\pi_1^{C_1}\boxtimes\pi_1^{C_2})\circ{}^t\Gamma_g\circ e\in\operatorname{CH}^2(X_b\times C_1\times C_2)_\mathbb Q$，
其在 $U_{X_b}$ 上的作用是 $g^*$，像全在 $H^1(C_1,\mathbb Q)\otimes H^1(C_2,\mathbb Q)$ 里。
引言 268-272 也写了这个注入成立的条件。我因此只把这条当结论使用，不假装知道其内部构造。

## 7 将 $U$ 实现到辅助 K3 铅笔上：格扩张与单值控制

### 7.1 我要的成果形态

命题 `pencil:realization`（`paper.tex:2386-2403`）：选好 Abel 数据与铅笔 $d_t=d_0+td_1$
（在引理 `geom:genericity` 的一般集里），存在非空代数开 $O\subset\AA^1_t$ 与光滑射影 K3 族 $S^0\to O$，
使有理 Hodge 变分有平坦等距嵌入 $U\hookrightarrow R^2(S^0/O)_*\mathbb Q$，此处 $U$ 上的形式取自 $Y$ 的 cup 积形式；
很一般的 $t$ 处该和因子就是 $H^2(S^0_t,\mathbb Q)$ 的超越部分；
对 $\AA^1_s$ 某个非空 Zariski 开集中的每个 $s$，由 $t=s+u^2$ 得到的整体族的每个光滑射影模型都是 uniruled；
K3 族定义在原来的 $t$ 线上，结论**不含**额外未指明的有限底变化。

最后那句对我是个提醒。我一开始打算"随便作个有限覆盖把单值杀死"，那样 §5 的六维族与 §6 的
Gauss 铅笔都要重新对齐，支配构造会失去与原始参数的绑定。文中的处理是
用有理双点不正规 K3 曲面实现周期（`paper.tex:2380-2384`），它们的极小收缩保留足够的下降数据，
使事情仍在原来的参数曲线上进行；光滑 K3 族只在该曲线更小的开集上取。
$U$ 上的二次型始终取从 $Y$ 继承的那个（`paper.tex:2383-2384`、`paper.tex:2396`），
这样才能与 §5.2 里 $2$ 倍因子的事分开处理。

### 7.2 格扩张：把判别长度压到 Nikulin 判据以下

引理 `pencil:lattice`（`paper.tex:2411-2474`）：$V$ 是符号差 $(2,14)$ 的偶格，判别群初等 $2$-群，
$G\subset O(V)$ 在判别群上平凡；则存在偶有限指标 overlattice $M$、原始嵌入 $M\hookrightarrow\Lambda_{\mathrm{K3}}$、
本原向量 $h\in M^\perp$ 且 $(h,h)>0$，使 $G$ 的作用扩展到 $\Lambda_{\mathrm{K3}}$ 并在 $M^\perp$ 上为恒等。

我以为要用 Nikulin 的整套嵌入定理机器，其实压缩判别长度的论证非常初等（`paper.tex:2421-2448`）：
在 $A_V\simeq\mathbf F_2^n$ 上 $\beta=2b$ 取值 $\Z/2\Z$、非退化对称；
令 $E=\ker(x\mapsto\beta(x,x))$，$\dim E\ge n-1$，$\beta|_E$ 交错；
其辛商中 Lagrangian 的原像是 $E$ 中全各向子空间，维数
$\frac{\dim E+\dim\operatorname{rad}(\beta|_E)}2\ge\lfloor\frac{n-1}2\rfloor$；
在其上 $b(x,x)=0$ 使 $q(x)$ 模 $2\Z$ 整，且 $q(x+y)-q(x)-q(y)=2b(x,y)=0$ 模 $2\Z$，
故 $q$ 限制成取 $\mathbf F_2$ 值的线性泛函；$n\ge5$ 时该子空间维数至少 $2$，泛函有非零各向向量。
贴上它对应的各向元即得新偶格，判别形式为 $H^\perp/H$（$H$ 由该二元子群生成），
判别长度降 $2$ 而有理二次空间不变；重复得 $\ell(A_M)\le4$。
每次扩张都是 $G$-稳定的，因为 $G$ 在前一判别群上平凡，在新判别群上仍平凡。
我漏看过的细节：$q$ 在 $E$ 上是**线性**这件事全靠 $\beta|_E$ 交错，不然二次性会把各向向量集合搞乱。
Nikulin 充分判据的数值（`paper.tex:2450-2455`）我特意核对：$3>2$、$19>14$、$22-16=6\ge\ell(A_M)+2$；
补空间符号差 $(1,5)$ 故含本原正整向量 $h$（`paper.tex:2456-2459`）；
补空间在单模 K3 格中本原故 $h$ 也在 $\Lambda_{\mathrm{K3}}$ 中本原；
单模粘合把 $M$ 与 $M^\perp$ 的判别形式认成相反号，于是 $M$ 上一个在 $A_M$ 上平凡的等距
配上 $M^\perp$ 上的恒等就唯一扩展到 $\Lambda_{\mathrm{K3}}$，且尊重复合（`paper.tex:2460-2463`）。

同段末尾我还想引用它一次（`paper.tex:2465-2473`）：$V$ 中的根 $r$（$r^2=-2$）在整个构造里保持整根，
反射 $s_r(x)=x+(x,r)r$ 在每个考虑的偶 overlattice 与 $\Lambda_{\mathrm{K3}}$ 上都整、在 $M^\perp$ 上恒等；
只要单值算子是这些反射的乘积，其扩展就是同样的 K3 根反射之积。
这条把 §7.3 的局部计算与"下降能否实现"接上了。
[推测] 保留**较大**的整反不变格 $V$（不直接用八维 $U$）的真实动机是这两处：
控制消失根（上面这段）与下降（`paper.tex:2790-3107` 我没读）。
依据是引言 274-276 那句"保留较大的整反不变格以控制消失根与下降"。

### 7.3 局部单值：有限点全是正交根反射，无穷远是 $-\operatorname{id}$

引理 `pencil:monodromy`（`paper.tex:2487-2494`）：这个一般铅笔的每个有限奇异参数处，$V$ 上的单值
是两两正交的整 $(-2)$-根反射之积，这些根垂直于极限 Hodge 线；杀死这些有限单值后周期扩张为内部周期；
无穷远处 $V$ 上的单值是 $-\operatorname{id}$。
文中还预告"替换 $t=s+u^2$ 会杀死后者"（`paper.tex:2484-2485`）。
我对"无穷远是 $-\operatorname{id}$"起初感到突兀，直到看见它是截面丛里 $t$ 的一次性带来的：
$z^2=\pi^*d_0+t\,\pi^*d_1$ 绕 $\infty$ 半圈相当于 $z\mapsto -z$，即叶交换。

可能的奇异成员（`paper.tex:2498-2525`）：$|2H|$ 定义的态射经反演因子实现为经典四次 Kummer 曲面，
对偶射影空间中一般直线与判别轨迹相碰只有两种方式：光滑点处的简单 Lefschetz 接触，
或过单个常 Kummer 节点的超平面。文中把所用的横截性说清（`paper.tex:2503-2516`）：
含每个 Kummer 节点的超平面在对偶空间中成平面，该平面的一般点避开其余节点且与该点二次切触锥横截；
光滑轨迹的余法相关系到对偶簇的投影一般可分；像维数小于 $2$ 则一般直线避开它，
像维数为 $2$ 则其一般光滑点代表唯一接触（接触点作为对偶簇的切超平面被复原）；
可分性使二次接触非退化；光滑接触分支不可能是节点平面（biduality）。
更高接触、这些判别分支的交与它们的奇点集在对偶空间中余维至少 $2$，一般直线避开并横向碰到其余分支。
铅笔基点在每个成员上光滑，因 $d_0,d_1$ 的微分在那里无关。拉到 $B'$ 得这些事件的分离副本，再看反演商。

三种事件我逐个核对（`paper.tex:2527-2582`）：
被交换的一对（不在不动点处）：$K$ 上分支曲线获一个常节点，局部双曲面 $z^2=xy+t$，
消灭球平方 $-2$ 且 deck $\delta$ 取负，故给 $V$ 的整根与其 Picard--Lefschetz 反射。
正号不动点：局部 upstairs 模型可等变取坐标使 $z^2=x^2+y^2+t$、$j(x,y,z)=(-x,-y,z)$
（分支方程对 $(x,y)$ 为偶，对偶二次系数矩阵非退化的全纯 Morse 引理保持该奇偶性；
参数换成局部常项，它是坐标因为判别被横向碰到）。在底商图的 $a=x^2,\ v=y/x$ 上
$z^2=a(1+v^2)+t$；$t=0$ 时分支是例外曲线 $a=0$ 加一条与之在 $v=i,-i$ 相交的剩余曲线，
每个交点处方程是 $z^2=ab+t$，故有两个分离常节点平滑化与两个正交整反不变根，局部单值为其积。
文中还专门警告：两个非分支例外曲线提升之差（平方 $-4$）不必被此单值固定，它**没有**被当作单个根使用
（`paper.tex:2555-2557`）。这句显然是写给像我这样会误用它的人。
负号不动点：$j(x,y,z)=(-x,-y,-z)$ 在实消灭球 $S^2$ 上对径，故在二维类上作 $-1$，
$j$-不变商上同调里没有消灭类；分辨率方面，$t\ne0$ 时 $(0,0,\pm\sqrt t)$ 被 $j$ 交换，商为一个光滑点，
在近所选平方根的图上诱导叶对合 $(x,y)\mapsto(-x,-y)$，blowup 得逐点被 $\delta$ 固定的 $\mathbf P^1$，
其类的 $\delta$-不变；更明白地，Kummer 分辨图 $a=x^2,\ v=y/x$ 上令 $\eta=xz$，
有限双覆盖模型是 $\eta^2=a(a(1+v^2)+t)$、$\delta(\eta)=-\eta$；$t\ne0$ 时 $a=0$ 的原像是那条分枝曲线，
平方为 $-1$（底例外曲线平方 $-2$），它是此点唯一新增分辨类，故该事件对 $V$ 的负特征空间无贡献。

整体算子（`paper.tex:2584-2609`）：上述根都在近旁光滑 $Y$ 上整；Milnor 邻域分离故两两正交，单值逐个取负。
要证再无别的单值，用 $V_\mathbb Q=U\oplus\langle a_1,\ldots,a_8\rangle_\mathbb Q$ 的正交分解（`paper.tex:2589-2592`）。
$X$ 上除去分离节点邻域后局部拓扑平凡，Picard--Lefschetz 给相应可交换反射之积；
被交换的一对给 $j$-不变消灭空间一维，正号不动点在 $U_X$ 上贡献一维（$j$ 在消灭球上度 $+1$），
负号不动点贡献零维；差直线 $\mathbb Q a_i$ 中恰在受影响正号不动点处被 $\sqrt t\mapsto-\sqrt t$ 交换两标号，其余固定。
于是 $V_\mathbb Q$ 上整体算子是对合，其负特征空间每交换一对有一维、每正号不动点有两维，
恰是上面找到的正交根个数，故它们张成负特征空间，算子就是这些反射之积；同一论证包含单个事件经同源的全部分离提升。
我读这段的体会是：文中把"没有多余单值"的证法完全建立在**维数计数**上，
所以 §5.2 的八条 $a_i$ 与 $U$ 的分解在这里兑现了第二次，缺一条就无法排除额外单值。

## 8 两次平方替换：整篇最意外的工程

### 8.1 我要的只是一条二维对应，却要绕三维

设定（引言 `paper.tex:273-277`）：§7 已在原铅笔线上实现 $U$（带 $Y$ 形式）为辅助 K3 族 $S^0$ 的一块，
剩下要办的是让指定的比较 $U\to U_X$ 成为代数。我在 §6 已经拿到曲线注入，但文中明确说
**仅有曲线支配做不到这件事**（`paper.tex:276-277`）。我起初的路线是试图直接在纤维层面造
$\Theta_b\in\operatorname{CH}^2(S_b\times X_b)$：曲面之间的 Hodge 映射一般不代数，
这条路需要的是某种"二维情形的 Lefschetz $(1,1)$"，而它恰恰是未知的。

文中的解法我现在理解为一次"次数搬家"：把二维的困难嵌进三维，因为三维上有一条无条件可用的代数性定理
（uniruled 三维簇的 $H^3$）。定理 `comp:twosquares`（`paper.tex:3290-3325`）的假设我逐条抄：
(1) 给定极化有理子变分 $\mathscr U\subset R^2f_*\mathbb Q$ 为 K3 型、限制的 cup 积非退化、
周期映射非常值、除可数个 $t\in O$ 外 $U_t$ 单；
(2) 有交换的对合 $j,\delta$ 使 $e=\tfrac14(1+j)(1-\delta)$ 消灭 $R^qg_*\mathbb Q$（$q\ne2$），
并有有理 Hodge 变分的同构 $\varphi:\mathscr U\xrightarrow{\sim}eR^2g_*\mathbb Q$；
(3) 对 $\AA^1$ 某个非空 Zariski 开集中的 $s$，两个曲面族经 $t=s+u^2$ 拉回后的总体有光滑射影 uniruled 三维模型。
结论：存在非空 Zariski 开 $G\subset O$ 与可数集 $E\subset G$，使每个 $b\in G\setminus E$ 有
$\Theta_b\in\operatorname{CH}^2(S_b\times X_b)_\mathbb Q$ 在 $U_b$ 上诱导 $\varphi_b$；$G$ 与选 $b$ 之前用的所有辅助对应
都可对给定铅笔事先固定。
另有两句约定（`paper.tex:3327-3333`）：$\varphi$ 是**指定**的变分同构，不要求保两个 cup 积形式；
曲面到四维的余维三柱面给出 $H^2(-)(-1)\to H^4(-)$，其转置给 $H^4(-)\to H^2(-)(-1)$。

### 8.2 三维上为什么无条件代数

引理 `comp:uniruled`（`paper.tex:3337-3406`）：光滑射影 uniruled 三维簇 $Z$ 的 $H^3(Z)$
是有限多个 $H^1(C_i)(-1)$ 之和的直和因子，分裂的两个映射都由代数对应诱导；
因而两个这样的三维簇的三维上同调之间每个有理 Hodge 映射都代数。

证明我完整核对过，其中三处细节容易走错。
第一，uniruled 给二维有理曲线族支配 $Z$，必要时对参数曲面作有限变更以平凡化一般有理曲线，
得到 $T\times\mathbf P^1\dashrightarrow Z$；有理映射的基理想在光滑乘积上射影 blowup（中心光滑）后标准化（Włodarczyk），
得态射 $a:\widetilde{T\times\mathbf P^1}\to Z$，恒等式 $a_*a^*=(\deg a)\operatorname{id}$ 给出代数分裂（`paper.tex:3345-3356`）。
第二，乘积与 blowup 公式：$H^3(T\times\mathbf P^1)=H^3(T)\oplus H^1(T)(-1)$，沿曲线的 blowup 添加其 $H^1(-)(-1)$，
点 blowup 三维无贡献；乘积投影代数，完整 blowup 分解由代数投影给出（Li 附录 A 公式 (9) 与命题 A.1，Fulton 6.7 节）。
唯一新和因子的符号我算错过：$\pi:\widetilde Z\to Z$ 沿光滑曲线 $C$ blowup，例外除子 $j:E\hookrightarrow\widetilde Z$、
$q:E\to C$；包含是 $j_*q^*$，收缩是 $-q_*j^*$，因为
$q_*j^*j_*q^*y=q_*(c_1(\mathcal O_E(-1))\smile q^*y)=-y$（`paper.tex:3367-3376`）。
少了这个负号，$H^3$ 上的投影就不是幂等的，我第一遍正是在这里卡住。
第三，曲面层面的分裂只用除子类（`paper.tex:3380-3400`）：取光滑 ample 曲线 $i:C\hookrightarrow T$，
Hard Lefschetz 说乘 $[C]$ 是 $H^1(T)(-1)\to H^3(T)$ 的同构，它是 $i_*i^*$，
故 $i^*$ 单、$i_*$ 满；极化给出 $i^*$ 的 Hodge 收缩 $r$ 与 $i_*$ 的 Hodge 截面 $s$；
Poincaré 对偶把它们的张量认成
$H^1(C)\otimes H^1(T)(1)$ 与 $H^1(T)\otimes H^1(C)(1)$ 中型 $(0,0)$ 的有理类，
底层的未扭转类在 $C\times T$ 与 $T\times C$ 上是 $(1,1)$ 型，Lefschetz $(1,1)$ 给有理除子代表。
最后两个有限和 $H^1(C_i)(-1)$ 之间的 Hodge 映射由曲线乘积上的除子对应给出，复合分裂得 $\operatorname{CH}^3(Z\times Z')_\mathbb Q$ 里的圈（`paper.tex:3402-3405`）。

### 8.3 系数投影：先在原曲线定好，之后不再重做

引理 `comp:affine`（`paper.tex:3417-3451`）：光滑仿射复曲线 $B$ 上，
(1) 局部系统上同调只在偶次有非零的有界复形，有唯一分解成各上同调层的平移和，且在每层上诱导恒等；
(2) 一般有界复形 $A$ 有典范正合列
$0\to H^1(B,\mathcal H^{n-1}A)\to\mathbb H^n(B,A)\to H^0(B,\mathcal H^nA)\to0$，
态射对左项的作用由它在 $\mathcal H^{n-1}$ 上的作用决定。
理由：仿射复曲线同伦型是一维 CW，局部系统间 $\operatorname{Ext}^r_B(L,M)=H^r(B,L^\vee\otimes M)=0$（$r>1$）；
分开两个不同偶次数 $i<j$ 时，障碍在 $\operatorname{Ext}^{j-i+1}$、歧义在 $\operatorname{Ext}^{j-i}$，次数至少 $3$ 与 $2$ 故都消（`paper.tex:3437-3447`）。

这段我起初觉得是范畴论的装饰，读完才懂它是"选择次序"的载体：
在 K3 族上得 $Rf_*\mathbb Q\simeq\mathbb Q\oplus(R^2f_*\mathbb Q)[-2]\oplus\mathbb Q(-2)[-4]$（`paper.tex:3455-3458`），
在另一侧群代数幂等只有一个非零上同调层故 $eRg_*\mathbb Q\simeq(eR^2g_*\mathbb Q)[-2]\simeq\mathscr U[-2]$（`paper.tex:3463-3465`）。
**这个分裂是在原仿射曲线 $O$ 上做的**，之后所有底变化只是拉回；
用限制 cup 积写 $p:R^2f_*\mathbb Q\to\mathscr U$ 为正交投影，
拉回 $\eqref{comp:k3split}$ 再接 $p$、以及 $\eqref{comp:xsplit}$ 再接 $\varphi^{-1}$，
定义了任何底变化后的系数投影；它们是复形态射，
用在曲面底上既不要求在那里重做导出分裂，也**不要求投影 $p$ 代数**（`paper.tex:3466-3473`）。
这最后一句解掉我的一个心结：我原先以为必须先把 $\mathscr U$ 的补投影代数化，那等于回到 §8.1 的死路。

### 8.4 由 Hodge 类造 Hodge 映射，暂时不要代数性

引理 `comp:hodgelift`（`paper.tex:3482-3541`）：给定 $a:R^2h_{S*}\mathbb Q\to eR^2h_{X*}\mathbb Q$ 为有理 Hodge 变分的态射，
两个光滑射影紧化 $Z^S,Z^X$ 把映射扩张到 $\overline I$ 的光滑射影紧化上，则在 $I$ 之外保持不变，
存在有理 Hodge 映射 $c:H^3(Z^S)\to H^3(Z^X)$ 满足
$e\operatorname{res}_X(cz)=H^1(I,a)(\operatorname{res}_S z)$。

造法（`paper.tex:3504-3540`）：令 $R=E^S\times_IE^X$，分辨 $\overline R$ 为 $Z^S\times_{\overline I}Z^X$ 之闭包的分辨且保 $R$，
得光滑射影五维簇带真态射 $\pi_S,\pi_X$。每纤维上 Poincaré 对偶把 $a$ 表示为
$H^4(R_t)$ 的 $H^2(E^S_t)\otimes H^2(E^X_t)$ 分量中那个具有对应作用的唯一张量；
这些张量组成 $R^4(R/I)_*\mathbb Q$ 的平坦有理截面 $\alpha$、型 $(2,2)$。
全局不变圈定理（Deligne Hodge II 定理 4.1.1）把 $H^4(\overline R)\to H^4(R_t)$ 的像认成单值不变元；
限制是极化纯 Hodge 结构的态射，像因此含 $\alpha_t$，半单性给出型 $(2,2)$ 的有理提升 $\widetilde\alpha$
（文中给的例子：把限制按 Hodge 映射分裂到像上，对 $\alpha_t$ 作用该分裂）；
该提升在每纤维的限制就是 $\alpha$，因两者都是平坦截面。定 $c(z)=(\pi_X)_*(\widetilde\alpha\smile\pi_S^*z)$，
cup 升四次、真前推降四次，故这是 $H^3$ 到 $H^3$ 的有理 Hodge 映射。
它在 $I$ 上的限制是由 $\widetilde\alpha|_R$ 给的相对上同调对应；
拉回、cup、沿光滑真相对曲面投影积分给出 $Rh_{S*}\mathbb Q\to Rh_{X*}\mathbb Q$ 的态射，二维层上正是 $a$。
源侧 $R^3h_{S*}\mathbb Q=0$、投影靶侧 $eR^3h_{X*}\mathbb Q=0$，于是 `comp:affine`(ii) 取 $n=3$
把源与投影靶的整个 $H^3$ 认成典范的 $H^1(R^2)$ 项，函子性说明 $c$ 的开限制作用恰是 $H^1(I,a)$。
最要紧的一句（`paper.tex:3540`）：这一步**完全不声称** $\widetilde\alpha$ 代数。
我把这看成整个 §8 的力学结构：先用拓扑工具（不变圈定理）拿到一个 Hodge 映射，
再用 §8.2 的 uniruled 定理把"这个 Hodge 映射"变成圈，两次都不需要二维代数性。

### 8.5 相容射影模型与那条圆锥

引理 `comp:models`（`paper.tex:3549-3568`）对两个曲面族都会用，而且它**在选 $b$ 与相对对应之前**
先把第一次紧化定下来。内容：光滑射影曲面族 $\mathcal Y\to O$ 的一次平方拉回有在 $\AA^1_s$ 上射影的模型 $Z$
与非空开 $G\subset O$ 使 $Z_G\to G$ 光滑，且可额外要求：每个 $b\in G$ 有光滑射影四维簇 $M_b$
带态射到 $\mathbf P^1_t$ 与 $\mathbf P^1_v$，其在 $V_0\subset\mathbf P^1_v$ 与 $O\subset\mathbf P^1_t$ 上的逆像分别是
$Z_G\times_GV_0$（$V_0\to G$ 为 $v\mapsto b+v^2$，$V_0=\{v\in\AA^1:b+v^2\in G\}$）与
$\mathcal Y\times_OQ_b$，其中圆锥
$Q_b=\{u^2+v^2=(t-b)w^2\}\subset O\times\mathbf P^2$（`paper.tex:3558-3563`）。
两个识别在交集上一致，两个指定空间都作为真的开子簇被保留；在选 $b$ 之前缩 $G$ 保持这些结论。
证明从 $\overline{\mathcal Y}\to\mathbf P^1_t$ 开始（`paper.tex:3570-3576`，此处截断）。

这里就是那两个替换的物理位置：$t=s+u^2$ 负责造 uniruled 三维模型（假设 (3)），
$s=b+v^2$ 负责在 $t=b$ 处让圆锥裂成两分支。[推测] 关于证明主体（`paper.tex:3644-4144`，未读）我依据
引言 `paper.tex:282-290` 与定理假设中的次序约定重构如下：两次代入的具体机制是
第一代入给出两侧的 uniruled 三维模型，其三维上同调经带 Tate 扭的曲线分解代数地分裂，
于是所需三维 Hodge 比较代数；第二代入在 $t=b$ 处给出一个两分支圆锥，
两分支之差定义一个柱面，把这个比较送回曲面纤维，其类落在由三维上同调控制的 Leray 项中；
因为第一个模型与对应都在 $b$ 变动之前固定，被舍弃边界的 Hodge 结构随之固定，
于是非常值的简单周期把边界误差排除。推论 `comp:surface` 在 `paper.tex:4213-4215` 被引用为给出 $\Theta_b$。

## 9 半自旋生成：从"有一个曲线源"到"有指定那张张量"

### 9.1 差距到底在哪里

引理 `final:curves`（`paper.tex:4196-4236`）：在 `geom:genericity` 的一般 Abel 数据与铅笔里，
再在公共好开中取 $b$ 避开该引理与 `comp:surface` 的可数个例外集，
则有光滑射影曲线 $C_1,C_2$ 与有理代数对应 $Z\in\operatorname{CH}^2(S_b^0\times C_1\times C_2)_\mathbb Q$，
其在 $U_b$ 上限制为注入 $f:U_b\to H^1(C_1,\mathbb Q)\otimes H^1(C_2,\mathbb Q)$，
此处 $U_b=T_{S^0_b}$ 且 $\operatorname{Hg}(U_b)=\operatorname{SO}(U_b)$。
构造是 $Z=Z_X\circ\Theta_b$，作用为 $f=g^*\varphi_b$；
复合穿过曲面 $X_b$，故余维是 $2+2-2=2$（`paper.tex:4228-4233`）。
链子写清楚是（`paper.tex:4238-4253`）
$(U_b=T^0_b,q_Y)\xrightarrow{\varphi_b}(U_{X_b},q_X)\xrightarrow{g^*}H^1(C_1)\otimes H^1(C_2)$，
分辨拉回满足 $\varphi_b^*q_X=2q_Y$，即第一个映射是带二倍形式的代数 Hodge 识别，而下面用的有理等距针对 $q_Y$。

我原先以为到这里就结束了：有了代数注入，把 $U$ 的 KS 张量"拉回"即可。
错在方向：指定张量 $\iota_{w,E}:U\to W\otimes W$ 的目标是**满偶Clifford 模的张量平方**，
而 $f$ 给的是 $W_i=H^1(C_i)$ 的张量积；从 $U\to W_1\otimes W_2$ 到 $U\to W\otimes W$ 需要
$\operatorname{Hom}_{\mathrm{HS}}(W_i,W)$ 里的映射，而且要把**两个张量朝向**与**指定的右因子 $w$**都拿到。
文中把这件事写成一段坦率的说明（`paper.tex:4178-4192`）：比较与曲线支配给出的代数注入
尚未实现 `ext:criterion` 要的标准张量，桥是"其与两曲线因子上的有理 Hodge 映射的复合、
再加上这两个因子的交换，张成进入满偶Clifford 张量平方的每个 Hodge 映射"。

### 9.2 生成引理的陈述

引理 `final:spin`（`paper.tex:4307-4341`）：$(U,q)$ 是八维带极化有理 Hodge 结构、K3 型、符号差 $(2,6)$、
$\operatorname{Hg}(U)=\operatorname{SO}(U,q)$；$W_1,W_2$ 是带极化的有效权 1 Hodge 结构（只有型 $(1,0)$ 与 $(0,1)$，`paper.tex:4304-4305`），
$W=C^+(U,q)$ 带 KS 结构。对每个非零 Hodge 映射 $f:U\to W_1\otimes W_2$，置
$\mathcal H=\operatorname{Hom}_{\mathrm{HS}}(W_1,W)\otimes_\mathbb Q\operatorname{Hom}_{\mathrm{HS}}(W_2,W)$，
$\tau:W\otimes W\to W\otimes W$ 为通常翻转，则有理线性映射
$\Phi:\mathcal H\oplus\mathcal H\to\operatorname{Hom}_{\mathrm{HS}}(U,W\otimes W)$，
$\Phi(a\otimes b,0)=(a\otimes b)\circ f$、$\Phi(0,a\otimes b)=\tau\circ(a\otimes b)\circ f$ 满。
并且：若 $U\subset H^2(M,\mathbb Q)$、$W_i=H^1(C_i,\mathbb Q)$、$W=H^1(A,\mathbb Q)$，且 $f$ 是某个从 $M$ 到 $C_1\times C_2$
的余维二代数对应的限制，则 $\Phi$ 值域中每个映射都由 $\operatorname{CH}^2(M\times A\times A)_\mathbb Q$ 中的圈诱导。

我读这个陈述时的第一反应是"满射凭什么"，因为 $\mathcal H$ 看着小。答案在权 1 有效性把可能性砍到三种：
文中先孤立有理正交李代数（`paper.tex:4353-4387`）。令 $G=\operatorname{Hg}(W_1\oplus W_2\oplus W)$；
极化权 1 结构的任何有理不变子空间都有由极化给出的 Hodge 补，补仍 $G$-不变，
故忠实表示完全可约、$G$ 约化（`paper.tex:4358-4363`）。
指定嵌入把 $U(1)$ 实现于 $\operatorname{End}(W)$，Tate 扭转不改 Hodge 圆作用，故得 $G$ 在 $U$ 上保 $q$ 的表示；
$G$ 连通故像落在 $\operatorname{SO}(U,q)$，又含 $U$ 的 Hodge 圆，故包含 $\operatorname{Hg}(U)=\operatorname{SO}(U,q)$，映射满（`paper.tex:4365-4370`）。
写 $\mathfrak g=\Lie(G)$；其导出李代数是有理单理想直和，而 $\mathfrak{so}(U,q)$ 绝对单，
恰有一个理想非平凡地映到它（两个的话就是同一非交换单代数的两份交换拷贝），
该非零映射是同构，其余理想与中心组成核，得有理李理想分拆
$\mathfrak g=\mathfrak s\oplus\mathfrak k$，$\mathfrak s\xrightarrow{\sim}\mathfrak{so}(U,q)$，
$\mathfrak k=\ker(\mathfrak g\to\mathfrak{so}(U,q))$（`paper.tex:4371-4383`）。
$\mathfrak s$ 积成一个连通有理正规半单子群；文中声明这里不怕有限中心核，
也没把自旋表示与 $\operatorname{SO}(U,q)$ 的表示混同（`paper.tex:4384-4387`），这句是我差点犯的错。

允许的权 1 成分（`paper.tex:4389-4423`）：把复化的无穷小 Hodge 圆生成元 $D$ 规范化使权 1 上特征值 $\pm1$；
它在 $U$ 上的特征值是 $2,0,\ldots,0,-2$。按分拆写 $D=D_{\mathfrak s}+D_{\mathfrak k}$；
$W_{i,\mathbb C}$ 的每个 $\mathfrak s_\mathbb C$-同型分量形如 $R_\lambda\otimes M$，交换算子 $D_{\mathfrak k}$ 只作用在 $M$ 上；
半单元素 $D$ 的两个投影都半单，故特征值在同时特征空间上相加（`paper.tex:4390-4399`）。
把 $\mathfrak s_\mathbb C$ 根系认成 $D_4$（根 $\pm e_i\pm e_j$），取 Cartan 使 $D_{\mathfrak s}$ 与权配对为 $2e_1$；
支配最高权 $\lambda_1\ge\lambda_2\ge\lambda_3\ge\lvert\lambda_4\rvert$，坐标全整或全半整；
其 Weyl 轨道给出 $D_{\mathfrak s}$ 的特征值 $\pm2\lambda_1$，
任何交换因子特征值的平移都缩小不了这个跨度，故权 1 有效给出 $4\lambda_1\le2$；
可能性只有平凡表示与两个半自旋 $S_\pm$，最高权
$\tfrac12(e_1+e_2+e_3+e_4)$ 与 $\tfrac12(e_1+e_2+e_3-e_4)$，权为相应奇偶的全体符号选择 $\tfrac12(\pm e_1\pm e_2\pm e_3\pm e_4)$；
每个半自旋都有 $D_{\mathfrak s}$-特征值 $1,-1$，若 $\mu$ 是其多重空间上 $D_{\mathfrak k}$ 的特征值，
则 $\mu+1,\mu-1$ 都须在 $\{1,-1\}$ 中，故 $\mu=0$，半单性给出 $D_{\mathfrak k}$ 在该多重空间上为零。

这段是我全文最喜欢的压缩：一个不等式 $4\lambda_1\le2$ 就把整个表示论可能性压成"$S_+$、$S_-$、平凡"三种。
[推测] 我没读的部分（`paper.tex:4424-4700`）应是把这三类成分与
$\operatorname{Hom}_{\mathrm{HS}}(W_i,W)$ 的同空间计算接上，再借有理 Hodge-Hom 下降把复数上的满射降到 $\mathbb Q$，
并在 $M$ 情形验证每个 $\Phi$-值由圈诱导；依据是引言 `paper.tex:296-298` 那句
"在非平凡成分中，权 1 有效性只剩两个半自旋表示；用同空间计算与有理 Hodge-Hom 下降恢复指定张量"，
以及本节开头 `paper.tex:4300-4303` 的自述。
命题 `final:generic`（在 `paper.tex:4704` 被追认）在构造周期处造出指定对应。

## 10 把一件事从"某处周期"推到"每个周期"

### 10.1 我在跃升处先撞了一次墙

我的本能是：让源随 $T_S$ 一起变，$T_S$ 变小时对应自动跟着。这在 Picard 跃升处坏掉：
$T_S$ 缩小，而 `main:theorem` 要覆盖**所有**跃升点，于是每个跃升都得重做一遍曲线支配与半自旋论证。
文中的取舍写在 §8 开头（`paper.tex:4706-4708`）：为达到 Picard 跃升目标，
**固定 $P$ 的垂直**，让源不动、随周期一起动的只是那个固定的八维空间。
命题 `specialization:ambient`（`paper.tex:4709-4721`）因此这样陈述：
$S$ 有 ample 本原 $P$-极化，置 $U_P=P_\mathbb Q^\perp\subset H^2(S,\mathbb Q)$，
则存在满偶Clifford 实现 $W_U=C^+(U_P,q)=H^1(A_U,\mathbb Q)$、有理极化 $E_0$、非零模有理 $w_0\in U_P$
与圈 $\Gamma_U\in\operatorname{CH}^2(S\times A_U^2)_\mathbb Q$，其**整个二次作用**在每个 $x\in U_P$ 上恰好是 $\iota_{w_0,E_0}(x)$；
该陈述涉及固定的整个八维空间，包括 Picard 跃升处它的有理 $(1,1)$ 类。

这句话我要读第二遍才安心：指定张量在跃升处对 $(1,1)$ 方向也成立，
所以它不能被"Hodge 结构只剩超越部分"之类的论证削弱。

### 10.2 成功集的解析结构：一个可数并的杠杆

引理 `final:hilbert`（`paper.tex:4730-4887`）是我认为全篇最实用的部件。
设定：$f:\mathcal Z\to B$ 是连通坐标球上纯相对维数 $n$ 的光滑真全纯族，带闭相对嵌入
$\mathcal Z\subset\mathbf P^N\times B$；固定 $0\le r\le n$、$B$ 上有理局部系统 $\mathcal V$、
局部系统态射 $L:R^{2r}f_*\mathbb Q\to\mathcal V$ 与平坦截面 $\tau$。
则"存在有理余维 $r$ 代数圈 $Z_b$ 使 $L_b(\operatorname{cl}(Z_b))=\tau_b$"的那些 $b$ 组成 $B$ 的可数个闭解析子集之并，
每个这样的子集是某个真解析参数空间的像，该参数空间携带一个固定的万能平法子概形的有理组合，
其上每点都给出满足条件的圈。若成功集含非空开，则它等于 $B$；
若对每个可数个真闭解析子集之并都存在一个不在其中的成功点，结论同样成立。

证明的技术选择让我改变了思路（`paper.tex:4756-4887`）。
第一层：嵌入参数。设 $R$ 为纤维 Hilbert 多项式（平坦故常）；对固定多项式 $Q$ 写 $K_Q=\Hilb^Q(\mathbf P^N)$，
投影概形带平坦万能子概形（Grothendieck Hilbert 定理 3.2）。用关联空间
$H_Q=\{(b,z)\in B\times K_Q^{\mathrm{an}}:\mathcal U_z\subset\mathcal Z_b\}$。
要看出它闭解析：取 $\mathcal Z$ 在 $\mathbf P^N\times B$ 中的理想 $\mathcal J$，
固定多项式 $R,Q$ 给出一致正则性上界，选 $k$ 使 $\mathcal J(k)$ 相对生成、直像局部自由且基变换相容、
$Q$ 的万能子概形有相应消零与基变换；在 $B\times K_Q^{\mathrm{an}}$ 上限制给出
从 $\mathcal J(k)$ 的截面到 $\mathcal O_{\mathcal U}(k)$ 的截面的全纯向量丛映射，其零点集恰为 $H_Q$（`paper.tex:4768-4780`）。
$K_Q^{\mathrm{an}}$ 紧致故 $H_Q\to B$ 真；万能子概形在 $H_Q$ 上平坦（万能 Hilbert 族的拉回）。
**不要求 $B$ 或 $f$ 代数**（`paper.tex:4780-4781`），这句是关键，因为 §10.3 里 $B$ 是周期球。

第二层：奇点参数上的 ambient Betti 类。对次数 $n-r$ 的多项式，把万能纤维配上其 $n-r$ 维基本圈
（结构层的通用长度作重数）。断言：它在 $H_Q$ 上（含奇异与非约化 Hilbert 参数）局部常。
文中给的细节（`paper.tex:4790-4844`）：同一高位理想构造给出分类映射 $B\to\Hilb^R(\mathbf P^N)^{\mathrm{an}}$
（$k$ 次理想丛给出到 Hilbert 概形 Grassmann 实现的映射），像在光滑纯 $n$ 维纤维的开集 $K_R^{\mathrm{sm}}$ 中；
在其上取万能光滑族 $\mathfrak Z\to K_R^{\mathrm{sm}}$ 与相对 Hilbert 概形 $\mathfrak H_Q$，则 $H_Q$ 及其万能对是
该代数万能对的解析拉回。在 $\mathfrak Z\times\mathfrak H_Q$ 上万能结构层 $\mathcal F$ 对 $\mathfrak H_Q$ 平坦且是 ambient 上 perfect 复形：
在拟射影 ambient 上对 $\mathcal F$ 及其核逐次取局部自由满射，所有核仍对 $\mathfrak H_Q$ 平坦；
ambient 纤维正则维数 $n$，故至多 $n$ 层 syzygy 后逐纤维核局部自由，局部平坦性判据使该核在 ambient 上局部自由，
于是得到即使 $\mathfrak H_Q$ 奇异也有界向量丛分解；对参数空间的平坦性还说明分解在每个 ambient 纤维上限制成
通常结构层的分解。于是拓扑陈特征满足前导恒等式
$\ch_r(\mathcal F)|_{\mathcal Z_b}=\operatorname{cl}([\mathcal U_z]_{n-r})\in H^{2r}(\mathcal Z_b,\mathbb Q)$（`paper.tex:4814-4820`），
它由 GRR 加上剥离（dévisage）以及代数与拓扑陈类的比较得到（Fulton 定理 15.2、例 15.2.16(a)、命题 19.1.2）；
精确形态是：去掉余维至少 $r+1$ 的子集，dévisage 归到光滑余维 $r$ 支撑上的通用长度，
那里正则嵌入情形的 GRR 给出其基本圈作前导项；被去掉部分在 $2r$ 次上无贡献，
因其带支集上同调在 $2r+2$ 以下消零（Fulton 19.1 节公式 (3) 与引理 19.1.1），
这同时解释了低维嵌入分量何以无害（`paper.tex:4821-4834`）。
拉回的光滑真族总空间上的类限制到纤维上为平坦截面：局部平凡化可微分族再拉回，
沿路径的纤维包含同伦；复解析空间局部道路连通，幂零元不改拓扑（`paper.tex:4836-4841`）。

第三层：成功分支与像。取每个有限多项式表 $Q_1,\ldots,Q_s$（次数 $n-r$）与每个系数表
$c_1,\ldots,c_s\in\mathbb Q$，作 $H_{\boldsymbol Q}=H_{Q_1}\times_B\cdots\times_BH_{Q_s}$ 与
$\mathcal Z_{\boldsymbol c,z}=\sum_ic_i[\mathcal U_{i,z}]_{n-r}$，空表代表零圈（`paper.tex:4846-4853`）。
这些空间在 $B$ 上真，万能组合在每个连通分支上 ambient Betti 类常；$B$ 单连通故 $L,\tau$
在局部系统平凡化下常，于是条件在每个分支上要么处处成立要么处处不成立（`paper.tex:4854-4859`）。
只留成功分支：多项式与系数表可数、分支可数（所有参数空间第二可数局部连通，故分支开且闭）；
每个保留分支是 $B$ 上真的闭解析子空间，其像由 Remmert 真映射定理闭解析（Grauert §7.1 Satz 1 用于约化，
Demailly 第 II 章 8.2 节定理 8.8 作教科书版本；约化不改点也不改像）（`paper.tex:4861-4870`）。
纤维上每个有理代数圈都是整子簇的有限有理和，故出现在表中；反过来保留像上每点之上都有真的万能纤维组合，
其在射影纤维中的支撑由 Chow 定理代数，故基本圈代数（`paper.tex:4871-4879`）。
收尾是拓扑杠杆：连通球中真闭解析子集无处稠密，若并可含非空开，Baire 迫使某像有内部，
解析恒等原理使该像为整个 $B$；若该并逃出每个可数个真闭解析子集之并，同样结论成立，
否则成功像自身就是这样一个并可（`paper.tex:4881-4886`）。
我复盘：我原先想用"代数圈在族中形变"来处理所有周期，那是死路（一般族里圈不形变）；
正确姿势是不让任何圈形变，只让**参数空间**在周期球上真地投影，然后靠 Baire 与恒等原理一次拿下整个球。

### 10.3 有理密性与目标球内的实现

引理 `specialization:rational-density`（`paper.tex:4896-4916`）：符号差 $(2,n)$ 的有理二次空间 $(V,q)$，
$O(V)(\mathbb Q)$ 在 $O(V_\R)$ 中稠密，且型 IV 周期域中任一点的有理轨道碰到该域的每个非空开集。
证明用 Cartan--Dieudonné：每个实正交变换是有理向量上有限多个非各向同性向量反射之积
（反射 $r_v(x)=x-\frac{2q(x,v)}{q(v,v)}v$ 在非各向开集上连续依赖 $v$，有理 $v$ 时有理，
近似有限多个向量即得稠密）；实正交群在定向正二维平面上传递并交换两个连通分支，
稠密即给出轨道结论（标准反射定理见 `paper.tex:4915`）。
我最初担心"有理轨道在实周期域里怎么可能到处碰到开集"，答案正是二次型理论里最有用的那一条反射定理，
它把正交群生成得极其粗糙，粗到有理点就够。

命题 `specialization:ambient` 的证明（`paper.tex:4918-4965`，我读到 4965）我先记下固定次序：
取目标的标记与 $P$ 中整 ample 类 $h$；局部 K3 周期定理给过 $S$ 的六维标记形变球 $B$，
其上 $P$ 保持代数，并可认成 $U_P$ 周期域中的开；$h$ 局部提升为线丛，缩 $B$ 使其相对 ample
且某幂射影嵌入族 $\mathcal S\to B$；**只让 $P$ 保持代数，不追求目标整个 Picard 群**，
故 $U_P$ 即使在跃升处也是固定的非退化有理 Hodge 子变分（`paper.tex:4919-4927`）。
接着固定张量本身：任取 $q(w_0,w_0)\ne0$ 的有理 $w_0\in U_P$，$W_U=C^+(U_P,q)$。
在选定的周期分支上左侧 Clifford Hodge 结构只有一个有理交错型极化，而文中给的是连同特征一起固定的造法
（`paper.tex:4931-4949`）：令 $x^*$ 为反序、$B_C(x,y)=\scal(x^*y)$，
取该分支内正定向积为 $\beta$ 的两个正有理向量，则（差整体符号）$E_0(x,y)=B_C(x,y\beta)$。
反序把 $\beta$ 送到 $-\beta$，标量部分的循环不变性证交错；左自旋乘法保 $E_0$，因 $g^*g=1$。
在所选平面写 $\beta=cJ$、$c>0$；含两个正生成元中 $a$ 个的偶正交单项式满足 $B_C(x,x)$ 符号 $(-1)^a$、
$Jx\beta=(-1)^{a+1}cx$，故一次整体取号后 $E_0(x,Jx)$ 定号；连通实旋群在该分支上传递，
给出全分支正性。这就是标准 Kuga--Satake 极化（`paper.tex:4949`）。
$(1,0)$ 空间是 $\ker L_\sigma$（$\sigma$ 为周期向量）且全纯变动；
$E_0$ 的有理辛基与其自对偶整格给出更小 $B$ 上带此固定有理 $H^1$ 的极化全纯 Abel 族 $\mathcal A\to B$
（Siegel 空间上的环面构造加相对 theta 丛，缩小后有相对射影嵌入）；
张量 $\tau=\iota_{w_0,E_0}$ 是固定的有理线性映射 $U_P\to W_U\otimes W_U$，
且由 $j_{w_0}$ 的自旋等变性在每个周期处都是 Hodge 映射（`paper.tex:4951-4959`）。

到这里，`final:hilbert` 的输入齐了：$L$ 取到常局部系统的映射、$\tau$ 平坦截面，成功集在球 $B$ 上。
[推测] 剩下的部分（`paper.tex:4965-5132`，未读）按引言 `paper.tex:299-307` 与 §10.3 开头
`paper.tex:4891-4894` 的说法是：在周期与支配同时正则的开集里取一个几何数据（`paper.tex:4962-4964`），
在局部标记上取有理等距 $\theta:U\simeq U_P$（`paper.tex:4964-4965`）；
有理改换周期坐标把构造放进任何局部 ample-$P$ 目标球而不动那些代数铅笔；逐次选择给出 $\operatorname{NS}=P$ 的种子目标，
Buskin 定理把辅助曲线源搬到那里，半自旋论证实现固定的目标张量；
真的圈参数再把同一作用在整个八维垂直上、在整个球内扩张（含二次目标情形）；
直到这之后才压缩到 Picard 跃升处实际的 $T_S$。
把"压缩"放到最后这件事是文中刻意安排的顺序（`paper.tex:306-309`），我把它当作一条纪律记着：
先在有富余的固定八维空间上拿到作用，再往小空间收缩，反过来会失去跃升处的 $(1,1)$ 方向。

## 11 回到实际的 $T_S$：转移、压缩与推论

引理 `transfer:period`（`paper.tex:5138-5169`）：若 $S$ 有有理等距嵌入 $\iota:T_S\hookrightarrow V_P$，
则存在 ample $P$-极化 K3 $R$ 与整个二次上同调的有理 Hodge 等距
$\Phi:H^2(S,\mathbb Q)\xrightarrow{\sim}H^2(R,\mathbb Q)$，$\Phi(T_S)=T_R$，双向都由代数对应诱导。
做法（`paper.tex:5148-5168`）：用 `main:lattice` 的本原嵌入与其提供的精确 $\operatorname{NS}=P$ 曲面；
取整 ample $h\in P$ 与该曲面附近的标记 $P$-极化周期片 $\Omega$（缩到 $h$ 保持 ample），
它是 $V_P$ 周期域中真的像开，含 Picard 跃升纤维；$z=\iota(H^{2,0}(S))$ 是该周期域中一点，
密性引理给 $g\in O(V_P)(\mathbb Q)$ 使 $gz\in\Omega$，选周期恰为 $gz$ 的纤维 $R$；
则 $g\iota:T_S\to H^2(\R)$ 把全纯线送到 $R$ 的全纯线。两侧整个二次空间都有有理 K3 形式，
Witt 延拓把它扩成整体有理等距 $\Phi$；它保全纯线、由有理保其共轭、并保正交补（即 $(1,1)$ 空间），
故为 Hodge；Lefschetz $(1,1)$ 给 $\Phi(\operatorname{NS}(S)_\mathbb Q)=\operatorname{NS}(R)_\mathbb Q$，故 $\Phi(T_S)=T_R$；
Buskin 定理代数化 $\Phi$ 及其逆，它既不要求整性也不要求保 ample 类。
最后两句我觉得是作者替读者挡掉的坑：密性只用来"进入那片"，
比较用的是真的实现周期（`paper.tex:5167-5168`）。

命题 `transfer:tensor`（`paper.tex:5171-5201`）：在 `main:theorem` 的等距嵌入假设下，
$T_S$ 上精确张量 $\iota_{w,E}$ 对每个指定的 $w$、$E$ 与输运的同源偶Clifford 模型都代数。
关键是把等距送到 Clifford 代数上：$\phi=\Phi|_{T_S}$ 诱导出分式代数同构
$c_\phi:C^+(T_S,q)\xrightarrow{\sim}C^+(T_R,q)$，$c_\phi(vaw)=\phi(v)c_\phi(a)\phi(w)$；
它把定义左乘的定向周期二向量送到 $R$ 的对应二向量，故是权 1 Hodge 同构
（更一般的 Hodge 相似 functoriality 见 Varesco 命题 3.1 与引理 3.5，此处乘数为一，
右因子按上式输运，`paper.tex:5184-5189`）。用 `transfer:ample` 得 $T_R$ 上对 $\phi(w)$ 与输运极化的标准张量，
其圈前复合 $\Phi$ 的对应、两个 Abel 槽用 $c_\phi^{-1}$ 输运，
这些 $H^1$ 上的有理 Hodge 映射由 `transfer:compression` 代数（`paper.tex:5190-5194`）。
那句自述很值得引用：上面写出的 Clifford 恒等式证明的是"与指定张量相等"，
，并非"与某个抽象 Hodge 嵌入同构"（`paper.tex:5195-5196`）；
源与一次槽投影隔离其全部作用，所有运算在中间因子上保次数，故所得圈余维为二（`paper.tex:5197-5200`）。
同一代数输运处理指定的同源模型（`paper.tex:5200`）。

`main:theorem` 的证明（`paper.tex:5203-5212`）就此完成：`transfer:tensor` 在有理等距嵌入假设下
给出精确标准张量断言（含指定右向量、极化与输运模型），任取其中一个张量套 `ext:criterion`，
得每个自幂所有次数的有理 HC 与 GHC；ample $P$-极化曲面情形由 `main:lattice`
把实际超越空间看成固定垂直 $U_P\simeq V_P$ 的非退化子空间而包含进来。

推论 `transfer:moduli`（`paper.tex:5216-5255`）：对满足嵌入假设的 $S$，每个 $n,r\ge1$，
$(S^{[n]})^r$ 的所有次数上有理 HC 与 GHC 成立；更一般地，$\alpha\in\Br(S)$，
$M$ 为 Gieseker 稳定 $\alpha$-扭转层的射影模空间，或 $D^b(S,\alpha)$ 中一般 Bridgeland 稳定 $\sigma$-稳定对象的射影模空间，
则 $M^r$ 所有次数成立；$M$ 超 Kähler 时，与 $M$ 双有理的每个光滑射影超 Kähler 簇及其所有自幂亦然。
证明（`paper.tex:5233-5254`）：零维 $M$ 显然；写 $h(-)$ 为有理系数 Chow 动机，
de Cataldo--Migliorini 定理 6.2.1 把 $h(S^{[n]})$ 表成 $S$ 的幂的动机之 Tate 扭转和因子的和
（对称积对应的因子由有理平均投影截出），Bülles 定理 0.1 对两类模空间给出
$h(M)$ 是有限多个 $h(S^k)$ 的 Tate 扭转之和的直和因子；张量这些分裂对应得每个自幂的类似分裂；
于是这些簇在 Arapura 意义下由 $S$ 动机生成，用主定理与 Arapura 转移引理（引理 4.2，保留几何 coniveau 及其 Tate 位移）
得两种猜想对每个幂成立；Rieß 的双有理光滑射影超 Kähler 特异化对应（定理 3.2 与 3.3 节，
如 Bülles 命题 1.4 那样表述为 Chow 动机同构）给出最后一断言。
我读到这里意识到：动机分解在这里只做"传导器"，全部实质仍在主定理；
所以那条"固定八维垂直再压缩"的纪律一旦坏掉，这条推论会跟着坏。

## 12 最终思路与我最初设想的差别

把上面几节合起来看，我最初的那套想法有六处被替换掉了，我把替换本身记清楚，因为下次做类似题目时
真正能带走的就是这些替换。

第一处，输入的形状。我最初打算假设"整族 KS 对应都代数"，即对某个生成集的每个元素给圈；
定理 `ext:criterion` 只要求一个有理非零模 $w$、一个有理极化、一个满偶Clifford 实现所确定的那一张量
（`paper.tex:151-158`）。这个假设的强度差别极大，而让它够用的机关是 $w^{-1}=w/q(w,w)$ 带来的右乘可逆
（`paper.tex:499-500`）加 PBW 单射（`paper.tex:498`）。我原本以为需要无限多输入，实际只需一条乘法定律。

第二处，代数性的含义。我一开始把"$T$ 代数地嵌进 $H^2(A^2,\mathbb Q)$"当成结论；
文中反复强调那不够，必须实现确切赋值式 $F_k(\alpha)(1)=c_k(\alpha)w^k$（`paper.tex:495-497`、`paper.tex:512-516`）。
这条区分贯穿 §9：最后一步也是靠 Clifford 恒等式把"抽象 Hodge 嵌入"升级为"与该张量相等"
（`paper.tex:5195-5196`）。

第三处，左逆的来源。我指望"逆 Lefschetz"，实际用的是极化性加 Cayley--Hamilton 的多项式逆
（`paper.tex:552-557`、`paper.tex:579-587`），全程只乘 ample 类、转置、投影。

第四处，GHC 的入口。我想在一个中间外幂的复表示里找有理分裂；
实际路线是"乘积的幂上的普通 HC 代数化商映射"加"用最高权第一坐标数外幂个数"
（`paper.tex:853-856`、`paper.tex:896-911`），并且刻意声明不需要那个分裂。

第五处，几何载体的角色。我以为曲线支配本身就是结论的一半；
文中把曲线支配定位成"注入的来源"，而指定比较的代数性要靠两次平方替换绕道三维（`paper.tex:276-290`、`paper.tex:3280-3288`）。
我在这个替换里学到的最重要一点是：先造一个只依赖拓扑（全局不变圈定理）的 Hodge 映射，
再用 uniruled 的 $H^3$ 定理把它变圈，两个阶段都不碰二维代数性（`paper.tex:3540`）。

第六处，"所有周期"的获得方式。我想让圈随周期形变；
实际做法是让真解析参数空间的像去覆盖周期球，再用 Baire 与恒等原理把"含一个开"升级为"整个球"
（`paper.tex:4744-4753`、`paper.tex:4881-4886`），并且全程固定 $U_P$ 不随 $T_S$ 缩小（`paper.tex:4706-4708`）。

还有一个心态层面的差别值得一提：这篇的"二次轨形"假设（有理等距嵌入 $(T_S,q)\hookrightarrow V_P$）
看起来像人为挑一个有利位置，但 `main:lattice` 把它翻译成"固定 $P$ 的垂直的有理形状"
（`paper.tex:333-334`、`paper.tex:349-356`），于是假设只谈实际超越二次空间与其 cup 积形式（`paper.tex:201-202`）。
我最初把它读成"特殊族上的一个例子"，读完 §11 才承认它是一个轨形层面的条件，
ample $P$-极化族（含所有 Picard 跃升）只是它的一个具体切片（`paper.tex:200-201`、`paper.tex:5210-5211`）。

## 13 遗留的缺口与我认为下一步该验的地方

缺口清单（都是我没读到、只按交叉引用与引言重构的地方）：

1. GHC 组装的后半，`paper.tex:911-1208`，即偶数维承载构造的收尾与支撑余维 $d-c$ 的具体对应计算。
   我只看到 `paper.tex:861-870` 的目标陈述。
2. 判别式在奇素数处的局部论证，`paper.tex:1457-1485`。
3. 周期映射满秩的收尾，`paper.tex:1724-1794`。
4. 八次相加映射与曲线支配命题，`paper.tex:2008-2380`，包括 `geom:domination`、`geom:genericity` 的陈述。
5. 周期栈、极化收缩、下降与相对规范类、实现与 Hodge 线，`paper.tex:2609-3277`。
   这是我重构里最薄的一环：`pencil:realization` 的"K3 实现"到底如何用掉 §7.2 的格扩张与 §7.3 的单值控制，
   我只能从引言 `paper.tex:273-277` 与 `paper.tex:2380-2384` 的自述推。
6. 比较定理证明主体与推论 `comp:surface`，`paper.tex:3576-4175`。
7. 半自旋生成引理的后半与命题 `final:generic`，`paper.tex:4424-4700`。
8. 目标球内实现的结尾与命题 `transfer:ample`、引理 `transfer:compression` 的证明，
   `paper.tex:4965-5132`（后者在 `paper.tex:478-479` 被指向）。

我会优先补 (5) 与 (8)：前者决定 §7 的整格工作是否真的只服务于"下降"和"消失根"，
后者决定 `transfer:tensor` 里那两个 Abel 槽的输运是否有我认可的理由。
另一个我想独立验的数值问题是 §5.2 的 $2$ 倍因子与 §8.5 柱面"显式因子 $-4$"之间的关系
（`paper.tex:3283-3284` 提到 $-4$）：$-4$ 与 $(\beta x,\beta y)_X=2(x,y)_Y$（`paper.tex:1317`）
以及圆锥两分支之差是否构成同一个 $2$ 的幂次账，我目前只有间接证据（`paper.tex:1422-1433` 的分支讨论），
不足以写成结论，故留空。

### 13.1 就地修正记录

本节记录我在自查里就改动过的位置，全部属于文风与拼写合规修正，没有改动任何论证内容、小节编号或顺序：

1. 单字符长停顿号：在 §6.2、§7.2、§9.2、§10.1、§10.2、§10.3 各一处，把它们换成冒号、分号或逗号。
   这些位置原来的作用只是插入语，改写后句意不变。
2. 四字过渡套语与两字转折连接词：全文复查命中数为零，未做额外替换。
3. 误混进正文的英文碎片与半角下划线残迹：在 §3（一处格名后）、§5.1（一处动词）、§6.2（两处连接短语）、
   §7.2（一处名词）、§9.1（一处记号）、§10.3（一处限定语）、§11（一处术语）、§12（一处副词）、
   §14 表末一行（一处英文词）各一次，均换成中文等价写法，未改数值、行号引用或论证方向。
4. 需要申报的一处遗留排版瑕疵：§4.2 与 §2 里我引用论文公式标签时写成了带转义连字符的 LaTeX 形式，
   显示上略冗长，但标签本身对应论文里的 `ext:exact-kappa`，读时无歧义，故保留不动。
5. 行号区间收紧两处（§7.1 正文与 §13 未读清单第 5 条）：原先写 `paper.tex:2378-2384`，
   而我的取证窗口自 2380 行开始，为避免把未取证的行号算进已读范围，统一改为 `paper.tex:2380-2384`。
   此处只收窄引用范围，句子内容与相邻的 `paper.tex:2383-2384`、`paper.tex:2396` 两注未动。

除以上条目外，本稿没有删除、回滚或重排任何先前落盘的文字。

## 14 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $j_w$ | $j_w(v)(a)=vaw$，$w$ 固定 | paper.tex:131 | 命题 ext:conditional 的定义式 paper.tex:446 | 赋值恒等式 paper.tex:496 失去来源 |
| $\iota_{w,E}$ | $T\to W\otimes W\subset H^2(A\times A,\mathbb Q)$ | paper.tex:143 | main:theorem 的结论式 paper.tex:191 | §10.2 里 $\tau$ 与 $L_b$ 无从写 |
| $w^{-1}$ | $w/q(w,w)$，右乘可逆 | paper.tex:500 | $F_k$ 单射 paper.tex:501 | 外幂全部注入 paper.tex:451 断 |
| $c_k$ | PBW 次数 $k$ 分量单射 | paper.tex:498 | paper.tex:499 单射性论证 | 左逆 paper.tex:577 的非退化失 |
| $\pi_{\wedge,k}$ | 由 $\pi_T$ 与 $\operatorname{Alt}_k$ 给的自伴代数投影 | paper.tex:403 | 配对非退化 paper.tex:410 | 伴随恒等式 paper.tex:573 失据 |
| $\Gamma_k$ | 属于 $\operatorname{CH}^{k+1}(S^k\times Z)_\mathbb Q$ | paper.tex:458 | 次数自洽检验 paper.tex:538 | GHC 支撑余维 paper.tex:866 计数断 |
| $R_k$ | 属于 $\operatorname{CH}^{n+k-1}(Z\times S^k)_\mathbb Q$ | paper.tex:459 | $(R_k)_*F_k=\operatorname{id}$ paper.tex:464 | 多项式逆 paper.tex:585 无处安放 |
| $L^{n-1}B_W$ | 恒为 $0$，各因子次数为奇 | paper.tex:551 | $Q_Z$ 是极化 paper.tex:552 | paper.tex:570 的像上非退化失 |
| $Q_Z$ | $\int_Z x\cup y\cup L^{n-2}$ | paper.tex:550 | 伴随恒等式 paper.tex:573 | $D_k$ 可逆 paper.tex:577 断 |
| $P_k$ | Cayley--Hamilton 给的 $\mathbb Q[X]$ 中多项式 | paper.tex:581 | $R_k=P_k(D_k)G_k$ paper.tex:585 | 左逆存在性 paper.tex:464 断 |
| $\pi_1^A$ | 乘以 $a$ 的图的多项式投影 | paper.tex:417 | $\Gamma_k$ 构造里的槽投影 paper.tex:520 | Abel 侧一次因子隔离失败 |
| 下降恒等式 | $H_\mathbb Q\cap(A_\mathbb Q\otimes_\mathbb Q K)=A_\mathbb Q$ | paper.tex:429 | 实乘法代数性 paper.tex:764 与不变量落地 paper.tex:828 | 有理代数性回收 paper.tex:829 断 |
| $\operatorname{Hg}(V)$ 全实支 | $\operatorname{Res}_{E/\mathbb Q}\operatorname{SO}(T,\phi)$ | paper.tex:693 | 各向正交分解 paper.tex:709 | 正交 FFT 使用 paper.tex:800 断 |
| $\operatorname{Hg}(V)$ CM 支 | $\operatorname{Res}_{E^+/\mathbb Q}\operatorname{U}(T,\phi)$ | paper.tex:698 | 共轭对配对 paper.tex:713 | 标准对偶张量 paper.tex:793 断 |
| $V_K$ | $\bigoplus_\eta V_\eta$ 的 Galois 分解 | paper.tex:707 | 体积张量收缩 paper.tex:740 | 投影 $p_\eta$ 代数 paper.tex:758 断 |
| 收缩张量 | $c_\eta q_\eta^{-1}$，$c_\eta\in K^*$ 非零 | paper.tex:743 | 正交投影 $p_\eta$ paper.tex:758 | $a=\sum_\eta\eta(a)p_\eta$ paper.tex:762 断 |
| 范数一元张成 | $F=E$ 的初等证明 | paper.tex:769 | Buskin 代数化 paper.tex:783 | CM 支配对生成 paper.tex:793 断 |
| Hodge 水平 | 恰为 $2\lambda_1$ | paper.tex:903 | 取 $c=\lambda_1$ paper.tex:906 | 支撑界 paper.tex:866 与 GHC 断 |
| $c\le d-p$ | 控制支撑的外幂个数 | paper.tex:864 | $c$ 个返回复合商映射 paper.tex:866 | 目标支撑余维 $d-c$ paper.tex:867 断 |
| 次数与余维账 | $2r+2a+4b$ 对 $r+a+2b$ | paper.tex:839 | 普通 HC 的 Künneth 收尾 paper.tex:840 | 指定余维上的类取不全 |
| $P$ | $\mathbb U\oplus D_8(-1)\oplus D_4(-1)$ | paper.tex:168 | main:lattice paper.tex:329 | 整个 §11 的轨形假设失去格 |
| $V_P$ | $\mathbb U_\mathbb Q^{\oplus2}\perp\langle-1\rangle^4$ | paper.tex:170 | transfer:tensor paper.tex:5173 | 有理嵌入 paper.tex:5140 无从写 |
| $T_P$ | $\mathbb U\oplus\mathbb U(2)\oplus D_4(-1)$ | paper.tex:332 | 反等距 paper.tex:344 | 单模粘合 paper.tex:346 断 |
| 判别形式账 | $(A_P,q_P)\simeq u\oplus v\simeq(A_{T_P},-q_{T_P})$ | paper.tex:344 | 偶单模 $(3,19)$ 格 paper.tex:347 | 精确 $\operatorname{NS}=P$ 曲面 paper.tex:361 断 |
| 符号差 | $V_P$ 为 $(2,6)$，维 $8$ | paper.tex:172 | 周期域型 IV paper.tex:4897 | 半自旋三分类 paper.tex:4412 失 |
| $\chi$ 的阶 | 恰 $4$ | paper.tex:1223 | $\pi_*\mathcal O=\mathcal O\oplus\chi^2$ paper.tex:1268 | 纤维符号账 paper.tex:1342 断 |
| $h^0(M\chi)$ | $1$ | paper.tex:1230 | $H^{2,0}(X)$ 分解 paper.tex:1372 | $p_g(Y)=2$ paper.tex:1379 断 |
| $\mathbf P H^0(M^2)$ | 射影三维，$h^0=4$ | paper.tex:1230 | 参数空间维数 paper.tex:1253 | 六维族与秩 $6$ 不配 |
| $(D')^2$ | $16$，$g(D')=9$ | paper.tex:1358 | 商亏格 $5$ paper.tex:1361 | $e(Y)=40$ paper.tex:1364 断 |
| $e(Y)$ | $40$ | paper.tex:1364 | $b_2(Y)=38$ paper.tex:1380 | 符号差 $(2,14)$ paper.tex:1384 断 |
| $a_i^2$ | 八条 $-4$ 且两两正交 | paper.tex:1305 | $\det U=1$ 于 $\mathbb Q^*/\mathbb Q^{*2}$ paper.tex:1455 | $U\simeq V_P$ paper.tex:1312 断 |
| 拉回因子 | $(\beta x,\beta y)_X=2(x,y)_Y$ | paper.tex:1317 | 形式继承声明 paper.tex:2396 | $\varphi_b^*q_X=2q_Y$ paper.tex:4249 断 |
| $e$ | $\frac14(\Delta_X+\Gamma_j-\Gamma_\delta-\Gamma_{j\delta})$ | paper.tex:1321 | $Z_X$ 的构造 paper.tex:4221 | 曲线注入 paper.tex:4207 无从投影 |
| $h^1(B,E)$ | $6$ | paper.tex:1595 | 周期映射秩 $6$ paper.tex:1626 | 满秩单射 paper.tex:1661 断 |
| $\operatorname{rank} A_d$ 相关 | 源与靶各 $4$，$\operatorname{rank} A'=3$ | paper.tex:1707 | 排除 $A_d(k)$ 落在像内 paper.tex:1721 | 周期微分单射 paper.tex:1661 断 |
| $g(C)$ | $3$，覆盖度 $2$ | paper.tex:1811 | Gauss 复合次数 $2$ 与 $4$ paper.tex:1817 | 十六个选择 paper.tex:1922 断 |
| 选择覆盖度 | $16$，按奇偶分裂为 $8+8$ | paper.tex:1938 | 求导式 $da_\pm$ paper.tex:1989 | 相干半和的扩张 paper.tex:1985 断 |
| $\ell(A_M)$ | 压到 $\le4$ | paper.tex:2446 | Nikulin 判据 paper.tex:2454 | $G$ 扩展与下降 paper.tex:2461 断 |
| 判据余量 | $22-16=6\ge\ell(A_M)+2$ | paper.tex:2454 | 补空间 $(1,5)$ paper.tex:2456 | 本原正向量 $h$ paper.tex:2458 断 |
| 无穷远单值 | 在 $V$ 上为 $-\operatorname{id}$ | paper.tex:2494 | 由 $t=s+u^2$ 消去 paper.tex:2485 | 比较定理假设 (3) paper.tex:3313 失 |
| 局部根个数 | 正号不动点给两正交根 $z^2=ab+t$ | paper.tex:2553 | 负特征空间维数计数 paper.tex:2607 | 全单值即反射积 paper.tex:2608 断 |
| $\dim_\mathbb Q W$ | $2^7=128$ | paper.tex:4261 | $D_4$ 权账 paper.tex:4401 | $4\lambda_1\le2$ paper.tex:4412 失 |
| 半自旋筛选 | 只剩 $S_+$、$S_-$ 与平凡 | paper.tex:4414 | $\Phi$ 满射 paper.tex:4324 | 指定张量恢复 paper.tex:4289 断 |
| $\Phi$ | $\mathcal H\oplus\mathcal H$ 到 Hodge 映射空间的满射 | paper.tex:4324 | 命题 final:generic paper.tex:4704 | 两个张量朝向之一缺 |
| $\Theta_b$ | $\operatorname{CH}^2(S_b\times X_b)_\mathbb Q$ 诱导 $\varphi_b$ | paper.tex:3320 | $Z=Z_X\circ\Theta_b$ paper.tex:4229 | 曲线注入 paper.tex:4207 断 |
| $Q_b$ | $u^2+v^2=(t-b)w^2$ 的两分支圆锥 | paper.tex:3562 | 模型保留开子簇 paper.tex:3560 | 柱面回送与边界排除断 |
| $E_0$ | $B_C(x,y\beta)$，$\beta=cJ$、$c>0$ | paper.tex:4939 | 极化 Abel 族 paper.tex:4953 | $\tau=\iota_{w_0,E_0}$ 的 Hodge 性 paper.tex:4957 断 |
| 有理密性 | $O(V)(\mathbb Q)$ 在 $O(V_\R)$ 中稠密 | paper.tex:4898 | 取 $g$ 使 $gz\in\Omega$ paper.tex:5156 | 进入周期片 paper.tex:5157 断 |
| $c_\phi$ | $c_\phi(vaw)=\phi(v)c_\phi(a)\phi(w)$ | paper.tex:5182 | 与指定张量相等 paper.tex:5195 | transfer:tensor paper.tex:5173 断 |
| 成功集结构 | 可数个真闭解析子集之并 | paper.tex:4744 | Baire 与恒等原理 paper.tex:4881 | 整个球上的作用 paper.tex:4753 断 |
| 前导陈类 | $\ch_r(\mathcal F)$ 等于基本圈类 | paper.tex:4817 | 纤维上常性 paper.tex:4842 | 每分支处处或不成立 paper.tex:4858 断 |
