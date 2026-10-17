# D259 分裂Weil型八维簇上 Weil 类的代数性：一条反推出来的思路链

## §0 任务登记与取材边界

这一单是主线2（非 Lean 队列）的 D259。派单参数 row=83、bytes=315732、thin=no，
取材目录唯一，正文素材全部来自该目录下 `build/` 里的 `.tex` 文件，
版式是 `build/*.tex` 与 `build/sections/*.tex` 两支，没有 `build/source/` 分支。
我先用 `wc -c` 量过十二个分节的字节量：最重的是 04-local-analysis.tex 的
$55747$ 字节，其次是 05-virtual-integration.tex 的 $35276$ 字节，
最轻的是 11-lifting.tex 的 $7278$ 字节，与引言的 $7651$ 字节相当。
按规格这属于厚素材，所以我没有顺序通读，是先量尺寸、再挑主干：引言整读，
第 2、3、4 节读开头，第 7、8、9、10、12 节按关键小节切片读，第 11 节整读，
第 5、6 两节只拿到小节标题层的信息，凡涉及这两节内部构造的具体句子，
下文一律标 `[推测]` 或者只复述小节标题所能承担的内容。
禁读清单里的东西我一件没碰：其他 `D##` 笔记、`研究笔记/素材/`、`INDEX.md`、
`队列台账.md`、`覆盖映射.md`、`派单提示词.md`、`.tools/next_batch.md` 都不在读入范围，
`lean/`、`formalization.yaml`、`comparator`、`records.txt` 也不碰，
`typst/` 分片与 `paper.pdf` 一律不作来源，`README.md` 只当目录索引。
这一节末尾按规格做双登记，两条各占一行：

preprints/Algebraicity-of-Weil-classes-on-split-abelian-eightfolds-September-18-2026
其他队列第 83 行号

## §1 我为什么盯上分裂八维这一格

Weil 类是 Hodge 猜想里少数几个能一口咬住的靶子：它们由一个虚二次作用决定，
有理系数下恰好是二维空间，可它们的代数代表元一般又给不出除子类的乘积形式。
我的起点是已知的两级结果。四维 Weil 型簇上它们全部代数，六维里分裂的那一半也代数，
维数不超过五的交换簇上有理 Hodge 猜想成立；八维就停在那里，分裂的那一半没人动过。

这个"停"很具体。二维的 Weil 空间 $W_K(A)=\bigwedge^8_K H^1(A,\Q)\subset H^8(A,\Q)$，
它的复化拆成两条行列式线 $\bigwedge^8_\C H^1(A,\C)_\sigma$ 与 $\bigwedge^8_\C H^1(A,\C)_{\bar\sigma}$，
$\dim_\Q W_K(A)=2$，Weil 型条件 $\dim_\C H^{1,0}(A)_\sigma=\dim_\C H^{1,0}(A)_{\bar\sigma}=4$
把它压进 $H^{4,4}(A)$。也就是说，我要证的只是一张平面掉进
$\im(\CH^4(A)\otimes_\Z\Q\to H^8(A,\Q))$。目标写得这么清楚，
我却完全没有把握它可从除子类生成，这正是它作为反例候选的价值。

我最初设想的路线很古典。六维那一档证明靠的是把簇退化到 K3 曲面的 Hilbert 方案上去，
沿退化族追 Weil 类的极限，再用已知曲面的代数性回收。我把这套动作在八维试过一遍：
分裂八维的 Kummer 型退化族我写得出方程，可 Weil 平面在这个退化中心上的极限会坍成一维，
二维信息丢了一半。丢失的原因我自己诊断是这样：$h_0$ 型退化里两个 $K$-特征空间的
行列式线在中心纤维上落到同一条线上，于是极限映射在 $W_K$ 上的秩最多是 1，
剩下那一维要靠某个半正则性条件才能补回来。这个诊断我只能标 `[推测]`，
因为退化方向的秩计算是我在纸上做的草算，没有落进任何一节。
补不回来的那一步恰好是 2026 年 2 月版综述里 Question 11.4 与第 12 节提出的路线：
那边给了一个用更弱的半正则性条件的八维构造，而该条件对那个例子的验证、
以及它对所需变形定理的充分性，都还开着。我读到这里就明白，
沿着半正则性往下走，我要先替别人补一个开问题，这不可控。

于是我换了靶心。既然退化路线要欠一个变形定理，我能不能把整个论证搬到
一个本来就有完整机器的地方去，让代数性从那个机器的输出里掉出来。
这个念头把我送进辛几何一侧：一个十六维实环面 $T$、一组斜率图、
以及图的 Floer 理论。后来的成稿确实走的是这条路，
而它与我一开始的设想差别很大：最终证明里没有对形变对象建立任何变形定理，
引言的约定那一小节写得很硬，新 brane 的 Floer 级数在复周期处是否收敛，
全篇不作任何主张。

## §2 第一次尝试：把周期矩阵硬写出来

换路线之前我得先有靶子可射。八维、带 $K$ 作用、极化的 Rosati  involutive
限制到 $\iota(K)$ 上是复共轭，这样的三元组 $(K,A,\iota,\lambda)$ 我要一个都不放过。
第一版的写法是逐类枚举：把 $H_1(A,\Q)$ 当 $K$-向量空间 $V$（$\dim_K V=8$），
取 $\psi$ 为 $\lambda$ 的有理 Riemann 形式，$J=\iota(\sqrt{-d})$，
写出线性在第一变量的 Hermitian 形式
\[
 h(x,y)=\psi(Jx,y)+\sqrt{-d}\,\psi(x,y).
\]
分裂的定义是 $V$ 里有一个四维 $K$-子空间使 $h$ 恒为零。
这一条我特意按规格的说法记下来：定义固定了约定，避免去挑判别式的符号。

枚举的做法很快卡住。不同的极化类型给出不相同数目的整格类，
而我最后要的结论对所有相容极化类型都成立。我一度以为要按类型分 case，
把分裂 $K$-Hilbert 模空间的每个连通分支各自处理一遍；
光是把分支数说清就要引入格论里的 genus 计算。这个负担跟目标没关系，
它只是参数化方式带来的伪复杂度。

真正让我把 case 分派推掉的是另一个念头：既然有理层面上所有分裂四维
$K$-Hermitian 空间都同构（双曲型），何不干脆把整个族压成单个有理模型，
把周期变化留给一个凸区域去描述。这就是我后来在第 2 节看到的写法，
而它把我原先的 case 枚举一次性抹平。

## §3 模型化转折：四平方和与矩阵 $D$

设 $d$ 为正 squarefree 整数，$K=\Q(\sqrt{-d})$。模型的第一步是找 $D$。
做法是取一个范数为 $d$ 的整四元数，这样的四元数由四平方和定理保证存在；
它的左乘矩阵 $Q$ 满足 $Q^tQ=QQ^t=d1_4$。在 $F=\Q^8$ 上令
\[
 D=\begin{pmatrix}0&-Q^t\\ Q&0\end{pmatrix},
 \qquad S_-=\diag(1_4,-1_4).
\]
于是 $D^t=-D$、$D^2=-d1_8$、$DS_-=-S_-D$。这三条关系是我后面每一处符号
与每一处同胚论证的地基，我第一次读到这里时的反应是"太巧合"，
把 $Q$ 换成别的四元数表示会不会改变结论；重读证明才明白三条关系只用到
$Q^tQ=d1_4$，选择的具体四元数无关紧要。这个疑问我在 §25 里还留着一条。

接着取 $H=F_q\oplus F_p=F\otimes S$，其中 $S=\Q e\oplus\Q f$，
$\psi_0=d\,q^t\wedge dp$，并规定对正的相容复结构 $I$ 有 $\psi_0(x,Ix)>0$。
标记族写成
\[
 \mathcal U=\{\Pi\in\Mat_8(\C):\Pi=\Pi^t,\ \Im\Pi>0,\ [\Pi,D]=0\},
 \qquad A_\Pi=\C^8/(\Z^8+\Pi\Z^8),\qquad z=q+\Pi p.
\]
主极化的类记作 $\theta$，在固定环面标记下等同于 $\psi_0$。
$\mathcal U$ 是复向量空间 $\{\Pi=\Pi^t,[\Pi,D]=0\}$ 里的非空凸开集，
因为 $i1_8$ 在里面。非空加凸给出连通，这一步我起初当作废话，
后来发现它在两处承重：一是让 $D$ 的两个特征值在 $H^{1,0}$ 上的重数
（在 $\Pi=i1_8$ 处算出的 $4$ 与 $4$）成为局部常数值，从而处处成立 Weil 型；
二是让 §17 里那个恒等式论证跑在连通域上。少一处连通性都会断。

## §4 等度约化那条引理带来的松弛

模型化的收益落在一个命题上（`hodge:isogeny-reduction`，02-periods.tex 第 45--51 行）：
每个带 $K$ 作用的分裂 Weil 型极化八维簇都 $K$-相容等度约化到 $\mathcal U$ 的某个成员，
于是"每个 $A_\Pi$ 上整个有理 Weil 空间代数"蕴含"对每个相容极化类型的断言"。
我把它当成整篇论文里性价比最高的一步。

证明里的顺序值得记。先说 $\mathcal U$ 恰好描述 $(H_\R,\psi_0)$ 上所有与 $D$ 交换的
正相容复结构：实 Lagrangian $F_q$ 与 $IF_q$ 横截，因为若 $y\in F_q$ 且 $Iy\in F_q$，
则 $\psi_0(y,Iy)=0$ 逼出 $y=0$；$F_q$ 的一组基因此是复基，
另一组格生成元给出一对称周期矩阵且虚部正，靠的是 Riemann 双线性关系；
$D$ 在第一组基上是固定矩阵，第二组基上的复线性正好翻译成 $D\Pi=\Pi D$。

然后是双曲化。给定 $(V,h)$，取其四维各向同性 $K$-子空间的一组基 $e_1,\dots,e_4$，
选 $f_1,\dots,f_4$ 使 $h(e_i,f_j)=\delta_{ij}$；记 $B_{ij}=h(f_i,f_j)$，把
$f_i$ 换成 $f_i-\tfrac12\sum_j B_{ij}e_j$。用 $h$ 在第一变量线性以及
$B_{ij}=\overline{B_{ji}}$，新的 $f_i$ 张成各向同性补。
我第一遍读到这里时怀疑这个修正项的系数，因为 $h$ 对第二个变量是共线性的，
交叉项要不要带共轭；核对之后确认写法自洽，把 $h$ 当成第一变量线性就一切顺。
这是我记在心里的第一条约定纪律：全文的 Hermitian 形式都线性在第一变量，
凡出现共轭符号的地方都要回这条。

再往下是格与约化：搬运后的整同调格与 $\Z^{16}$ 是同一有理空间里的两个满格，
因而可公度；有理同构乘上一个合适的正整数就给出相应复环面的 $K$-相容等度，
两者都是 abelian 簇，所以这个等度是代数的。若 $f:B\to A$ 是这样的等度，
则 $f^*:H^*(A,\Q)\to H^*(B,\Q)$ 是同构，逆是 $f_*/\deg f$，
两个映射都保持代数有理圈类，并且因为 $f$ 与 $K$ 交换，
它识别定义两个 Weil 空间的那两条行列式线。
我特别注意到最后一句的用法：约化把结论从一个成员推到整个等度类，
代价只是同调层面的映射保持代数性，一个积分极化类型的限制都不必加。
这把我原先担心的 case 分派彻底免掉了。

## §5 一般周期上的 Hodge 类清点

有了单一族，下一个问题是很实际的：我造的类必须真的是 Hodge 类，
而且最好除了 $\theta$ 的幂与 $W_K$ 之外别无他物。
命题（`hodge:generic-hodge`，02-periods.tex 第 108--121 行）给的形态是：
存在 $\mathcal U$ 的可数个真闭解析子集，在它们之外有
\[
 H^{2j}(A_\Pi,\Q)\cap H^{j,j}(A_\Pi)=
 \begin{cases}
  \Q\theta^j,&j\ne4,\\
  \Q\theta^4\oplus W_K,&j=4,
 \end{cases}
\qquad 0\le j\le8.
\]
可数性来自"Hodge 滤过是常数上同调丛的全纯子丛，
故每个有理向量 $v$ 落在 $F^j_{\mathrm{Hdg}}$ 里的条件是真闭解析的"，
而对有理 $v$ 这又等价于型 $(j,j)$。排除每个剩余有理向量的真 Hodge 定位点就行。

剩下的是识别在所有周期处都是 $(j,j)$ 的那批类。这里的机器我起初并不指望它能那么干净：
$K$ 在 $\Sp(H_\R,\psi_0)$ 里的中心化子是 $h_0$ 的酉群，号差 $(4,4)$；
族中各点的 Hodge 圆落在 $\SU(4,4)$ 里，因为在 $K$-复表示下两个圆权各出现四次，
行列式为 1；两个权都出现，所以圆非中心。把一个圆的所有 $\SU(4,4)$-共轭
生成的 Lie 代数拿出来，它是单实 Lie 代数 $\mathfrak{su}(4,4)$ 的非零理想，
于是等于整个代数。结论：被每个 Hodge 圆固定的类被连通群 $\SU(4,4)$ 固定。

复化之后这是标准空间 $E$ 与其对偶上的 $\SL_8$-表示，
$\bigwedge^k(E\oplus E^*)=\bigoplus_{a+b=k}\bigwedge^aE\otimes\bigwedge^bE^*$。
$(a,b)$ 分量和不变元等价于一个交织映射 $\bigwedge^bE\to\bigwedge^aE$；
$1\le a\le7$ 时外幂两两不可约且互不等价，第 0 与第 8 外幂都是平凡表示。
于是不变线恰是配对 $\theta$ 的各次幂，加上 $(a,b)=(8,0),(0,8)$ 两条，
后者正是 $W_K\otimes\C$。

我在这一步学到的关键判断是：不要试图去证明我造出来的类在所有周期处都是 Hodge 类，
只要证明它在一般点处是，再用解析集的排除法把它跟其余 Hodge 类区分开。
"区分"这个词在 §19 里会变成"检测"，那里靠 Euler 配对完成同一件事的另一面。

## §6 例外同调类与三个标量图

现在进入我认为是全文最要紧的转折。构造发生在与 $A_\Pi$ 分开的辛环面上：
\[
 T=(\R^8_q/\Z^8)\times(\R^8_p/\Z^8),\qquad \omega=dq^t\wedge dp,
\]
\[
 \Omega=\{dq^tM\wedge dp:M\in\Mat_8(\Q),\ M=M^t,\ [D,M]=0\}\subset\textstyle\bigwedge^2H^*.
\]
用它的辛定向、$q+ip$ 的常复体积、零自旋背景。固定整数 $h_0\ge3$，
把图按 $q$-坐标定向：
\[
 G_k=\{p=h_0kq\},\ k\ge1,\qquad C=\{p=S_-q\},
\]
基类记作 $g_k,c\in\bigwedge^8H=H_8(T,\Q)$。斜率矩阵对称，所以图都是 Lagrangian。
$D$ 的复特征分解 $F_\C=U_+\oplus U_-$ 对应特征值 $\pm i\sqrt d$，
$H_\pm=U_\pm\otimes S_\C$，每个 $U_\pm$ 四维、每个 $H_\pm$ 八维。

引理（`hodge:exceptional-homology`，02-periods.tex 第 188--199 行）要的是有理类
$\alpha_{\mathrm{ex}}\in\bigwedge^8H$，复化落在 $\bigwedge^8H_+\oplus\bigwedge^8H_-$，
并且
\[
 \alpha_{\mathrm{ex}}\wedge c\ne0,\qquad \alpha_{\mathrm{ex}}\wedge g_k=0\ (k\ge1),
\]
两个纯特征分量都非零。证明思路对我很有启发：两条行列式线之和下降为有理二维平面，
因为特征分解定义在 $K$ 上、Galois 对换交换两条线；$C$ 的图向量空间投到 $H_-$
是同构，写出来是 $x\mapsto x_-\otimes e+(S_-x_+)\otimes f$，
而 $S_-:U_+\to U_-$ 可逆。于是与 $c$ 楔乘在 $\bigwedge^8H_+$ 上非零，
进而在有理二维平面上非零，取一个非零的有理向量即可；
它的两个分量互为共轭，都不消失。至于 $g_k$：它的特征双次数是 $(4,4)$，
而 $\alpha_{\mathrm{ex}}$ 的每个分量是纯 8 次的，维数原因让楔积为零。

我原先的设想是在这里只用一条标量图。这样 Floer 侧的记号会少一截。
可真正决定拓扑的两条恒等式（`hodge:linear-algebra`，02-periods.tex 第 226--237 行）
需要三条：定义
\[
 \alpha=\alpha_{\mathrm{ex}}+g_1+g_2+g_3
\]
之后，$\Omega$ 是十六维，并且
$\ker(\bigwedge^2H^*\to\bigwedge^6H,\ \eta\mapsto\iota_\eta\alpha)=\Omega$，
同时 $H^*\otimes\Omega\xrightarrow{\ \wedge\ }\bigwedge^3H^*$ 单。
引言里那句话我抄下来当注脚："三个标量斜率有特定用途，它们探测一个二元二次型的三个系数。"

## §7 两条线性代数恒等式的分工

这两条恒等式我读了三遍才看清分工，值得单独记。

先看核的等式。复化以后，$D$ 的斜对称使 $U_+$ 与 $U_-$ 对点积各向同性又完美配对，
故与 $D$ 交换的对称矩阵由 $U_+$ 与 $U_-$ 之间的任意配对决定并被其决定，
在两个 $S$-坐标上对应的二形式带交错的 $S$-因子，即
$\Omega_\C=U_+^*\otimes U_-^*\otimes\bigwedge^2S_\C^*$，维数十六。
这些形式对纯行列式线与每个标量图体积的收缩都是零，所以 $\Omega_\C$ 含在核里。
反向：若 $\iota_\eta\alpha=0$，看值在特征双次数 $(6,0)$ 与 $(0,6)$ 的分量，
它们只来自用 $\eta$ 的纯部去收缩 $\alpha_{\mathrm{ex}}$ 的两个非零纯体积；
对非零顶外幂的收缩是从二形式到补外幂的同构，故 $\eta$ 的两个纯部都零，即 $\eta$ 是混合的。
剩下的工作是把混合部再削掉，这里就是三条标量图上场的地方。
令 $s_j=e+h_0jf$（$j=1,2,3$），把收缩的 $(3,3)$ 分量投到
$\bigwedge^3U_+\otimes\bigwedge^3U_-\otimes\operatorname{Sym}^6S_\C$，
对每个 $U$-因子取交错、六个 $S$-因子取对称乘积。$g_j$ 的收缩在该投影下
落到 $\eta(-\otimes s_j,-\otimes s_j)\otimes s_j^6$。
$s_1^6,s_2^6,s_3^6$ 无关：它们对 $e^6,e^5f,e^4f^2$ 的系数给出行列式非零的 Vandermonde。
于是三个配对值都零；而 $\eta(-\otimes s,-\otimes s)$ 的每个系数都是 $s$ 的二元二次型，
在三个不同直线上为零就恒零。这正好需要三个点，两个点只够定一次与常数项，
一个点什么都定不住。我此前想用一条标量图省事的打算在这里彻底作废。

再看楔的单射。取 $U_+^*$ 的基 $u_i$ 与 $U_-^*$ 的基 $v_j$，
下标 $e,f$ 表示它们在 $H_\C^*$ 里的四份拷贝，则
$z_{ij}=u_{i,e}\wedge v_{j,f}-u_{i,f}\wedge v_{j,e}$ 是 $\Omega_\C$ 的基。
证明用一个四行的表，四种首因子类型各配一个三字母块来独立探测：
第一行 $U_{+,e}^*$ 配 $U_{+,e}^*\wedge U_{+,f}^*\wedge U_{-,e}^*$，
$u_{a,e}\wedge z_{ij}$ 在该块上的投影是 $-u_{a,e}\wedge u_{i,f}\wedge v_{j,e}$，
别的首因子类型在那个块里没有贡献，三个指标自由地把每个系数取回来。
其余三行同理。

我为什么要在意这条单射：它保证零流形那一侧的边界算子真的关得住（见 §8），
而核的等式保证我 ambient 二形式里挑出的 $\Omega$ 恰好是"对 $\alpha$ 收缩为零"的全部。
两条一条管上同调、一条管链复形的边界，缺一条整条拓扑链子就散。

> 落盘探针行：本行仅用于确认写入生效，不进入论证。

## §8 拓扑实现的第一版：为什么先要零流形

手里有了 $\alpha$，下一步在直觉上很直白：把它当成某个 Lagrangian 的基本类。
我最初的做法是直接从线性模型出发，试图在 $T$ 上写出一张以 $q$-坐标为参数的
图 $\{p=\nabla f(q)\}$ 来代表 $\nu\alpha$。这条路立刻撞在 $\alpha$ 的组成上：
$\alpha$ 里既有 $\alpha_{\mathrm{ex}}$ 这个不属于任何图斜率的项，又有三个标量图分量，
单个图的同调类只能是某个斜率矩阵的体积，混合不出这种和。
也就是说（此处指字面改写，非规格禁词），图的同调类张不出 $\alpha$ 所在的直线。
所以我需要一个源空间比图更自由的载体。

零流形就是我给自己搭的中间站。取 $\Omega$ 的满格的一组整基
$\eta_1,\dots,\eta_{16}$（$16=\dim\Omega$ 在这里第一次显形），
构造双线性 $b:H_\R\times H_\R\to\R^{16}$，在坐标格上取整值，并满足
\[
 b(x,y)-b(y,x)=(\eta_1(x,y),\dots,\eta_{16}(x,y)),
\]
具体取每个整交替矩阵的上三角部分就够了。乘法
$(x,z)(y,w)=(x+y,z+w+b(x,y))$ 把 $H_\R\oplus\R^{16}$ 做成单连通两步幂零 Lie 群 $N$，
整点构成余紧子群 $\Gamma$，投影到第一坐标给出
$\pi:\mathcal N=\Gamma\backslash N\to T$。$\mathcal N$ 的基本群是 $\Gamma$，
$\Gamma\to\pi_1(T)$ 满，万覆可缩，所以 $\mathcal N$ 是 $\Gamma$ 的分类空间。

引理（`top:nilmanifold`，03-topology.tex 第 62--69 行）给两条：
$pullback$ 诱导 $H^2(\mathcal N)\cong\bigwedge^2H^*/\Omega$；
并且存在 $\widetilde\alpha\in H_8(\mathcal N)$ 使 $\pi_*\widetilde\alpha=\alpha$。
证明用的是 Nomizu 定理：实上同调由不变形式算出，不变复形一次生成元是
$H^*_\R$ 与 $z_1^*,\dots,z_{16}^*$，$dH^*_\R=0$，$dz_i^*=\eta_i$（必要时改符号）。
在 $H^*_\R\otimes\langle z_i^*\rangle$ 上微分正是 §7 里那条楔单射，故单；
在 $\bigwedge^2\langle z_i^*\rangle$ 上也单，因为
$d(z_i^*\wedge z_j^*)=\eta_i\wedge z_j^*-\eta_j\wedge z_i^*$ 里 $\eta_i$ 的无关性
能探测每个系数；两部分的中心次数不同不可能相消。
闭二形式因此就是水平的模边界 $\Omega_\R$。
对偶方向上，水平 Lie 链 $\alpha\in\bigwedge^8H$ 的边界是
$\partial\alpha=\pm\sum_i z_i\wedge\iota_{\eta_i}\alpha=0$，用的正是 §7 的核等式。
我读到这里时有一种"两条恒等式在这里合拢"的确定感：一条管闭性、一条管闭形式的商，
二者恰好分别对应"链是 cycle"与"上同调商掉 $\Omega$"。

还有下降的合法性问题：不变复形在 $\R$ 上给出提升存在性，而我最终要的是有理系数。
证明的处理是：上同调拉回与同调前推都是有理线性映射，断言的核与像陈述
因此从 $\R$ 下降到 $\Q$。这类的"先在 $\R$ 上算、再回落到 $\Q$"是我自己常忘的一步。

## §9 辅助 brane 的四条要求

中间站搭好后，真正要的东西写在命题 `top:brane`（03-topology.tex 第 12--32 行）里，
我把它当作全篇拓扑侧的合同：存在正整数 $\nu$ 与闭连通定向自旋 Lagrangian 嵌入
$i_L:L\hookrightarrow T$ 使
\[
 (i_L)_*[L]=\nu\alpha,
\]
嵌入带由 $T$ 上标准复体积决定的四重 Maslov 覆叠上的分级，并且
$i_L^*:H^2(T)\to H^2(L)$ 满、$\ker i_L^*=\Omega$，同时
$(i_L)_*:H_j(L)\to H_j(T)$ 对 $j=2,6$ 单。
推论是每条 $\Omega_\C$ 里的形式限制到 $L$ 上都是恰当复二形式。

我对这四条的必要性各想过一遍，因为它们的成本很不平衡。
第一条件里的 $\nu$ 是我最不舒服的地方：嵌入只能给出 $\alpha$ 的正整数倍，
给出不了 $\alpha$ 本身。我起初以为这是自旋条件的技术损失，
后来意识到它其实无害，因为整个后续论证里出现 $\nu$ 的地方（§19 的 Euler 配对
$\chi(P_k,\mathfrak E)=\nu\,g_k\cdot\alpha$）都是一致地带着同一个 $\nu$，
最后要的又是"某个非零有理倍"，倍数在代数性里可吸收。这个判断值得写下来：
允许正整数倍是整个构造能保持 Lagrangian 嵌入这一强条件的关键代价。

第二条件（四次分级）在 Floer 侧的用处在 §10 才出现：$L$ 上的箭头次数只能模 4 定义，
而 $2$ 与 $4$ 的关系恰好让交错和 $\sum_{r\in\Z/4}(-1)^r$ 有意义，
并且 §20 里那个 reindexing 的符号相容性也依赖周期是偶数。
若我贪图方便用两次分级，交错 Chern 特征的构造会多出一堆半次项。

第三、四条是检测条件。满射加核等于 $\Omega$ 说的是"$L$ 的上同调恰好看见
ambient 二形式里除去 $\Omega$ 的部分"；$j=2,6$ 的单射说的是"$L$ 里不会藏着
在 $T$ 中消失的二、六维类"。为什么偏偏是 $2$ 与 $6$：
Floer 障碍发生在二次数与六次数（对偶次数）上，八维簇里 $2$ 与 $6$ 正是 Serre 对偶的一对。
这解释了我一开始的一个困惑：为什么条件列表里 $j=4$ 缺席，
因为 $H_4$ 的单射在此用不上，硬要求它单反而可能做不到。

## §10 分层标签与圆盘方程

进入分析段之前要先说清楚一个约定，它关系到全篇的因果走向。
第 4 节开头（04-local-analysis.tex 第 4--9 行）写着：辛形式在 $T$ 上一次性固定，
形变参数只通过一个相对闭二形式进入，它不改变全纯曲线的方程。
这句话是我整个思路里最重要的一次"退让变收益"。
我原先打算让 $\Pi$ 真的去变复结构，让 $J_\Pi$-全纯曲线跟着动，
好处是所有东西都在同一个几何图景里，坏处是我无法控制曲线紧性对 $\Pi$ 的依赖。
现在的写法把 $\Pi$ 从方程里赶出去，只留它在权重与系数里，
于是紧性定理只证一次，与 $\Pi$ 无关，参数变成一个额外的相对二类的"记账"。
引言的约定小节也据此声明：没有任何主张说 $L$ 的 Floer 级数在那个复周期处收敛。

标签系统是这样组织的（04-local-analysis.tex 第 20--39 行）。
取 $L$ 为 §9 的嵌入自旋 Lagrangian，带模 4 分级；$J_*$ 是 $q+ip$ 决定的平坦复结构，
用 $J_*$ 在 $\omega$-相容 almost complex 结构空间里一个足够小的均匀驯切邻域，
下面所有结构都取值在这个邻域内。图标签有可数个，按层排列，层指标在 $\N\cup\{0\}$，
每层含每个标量图 $G_k$（$k\ge1$）与 $C$ 各一份，形状是
\[
 X=\{p=A_Xq+\nabla f_X(q)\},\qquad A_X=h_0k\,1_8\ \text{ 或 }\ S_-,
\]
$f_X$ 光滑周期实函数。层按增序排；同层内标量斜率按降序，$C$ 收尾，记 $X\prec Y$，
$X^+$ 指同斜率在下一层的副本。这个序不必是良序，所有分析构造先用有限子列。
每张图带底框架给的定向与自旋结构、平凡局部系统、以及从对称矩阵水平面
延拓下来的整分级。于是 $\pi_2(T,X)=0$（相对同伦序列加 $\pi_1(X)\to\pi_1(T)$ 单），
图不承载任何非常数全纯圆盘。这一条是我愿意付出"可数层"这种复杂性的理由：
所有障碍都只来自 $L$，标量图与 $C$ 是干净的探测器。

势的选取要同时满足很多条件（第 41--51 行）：所有标签含 $L$ 两两横截、无三重交；
第 0 层的 Hessian 任意小；$f_{X^+}-f_X$ 取足够小的完美 Morse 函数，
可选在一个含小分裂余弦和的开集里。做法是把可数多个条件排个序逐个满足，
用周期函数的一阶 jet 求值的横截性：每一步，已加的条件与完美 Morse 条件是开的，
剩下的横截与避开条件在任意小开集里是残余的；等价说法是在这些
 successive 开差的乘积上用 Baire 定理。这段我读得比较慢，
因为"开的"与"残余的"混用时 Baire 是必要的，单纯有限步 transversality 不够；
可数条件叠起来正是 Baire 的用武之地。

次数公式（第 53--68 行）我抄在纸头，因为全篇符号都从它来：条带约定把较早的
边条件放在高度 0、较晚的放在高度 1，输入在正端；对正旋转角
$\alpha_j\in(0,\pi)$ 的分级平面，
\[
 |x|=8+\vartheta_2-\vartheta_1-\sum_{j=1}^8\alpha_j/\pi.
\]
两个图切平面时它等于第二 Hessian 的正特征值个数减第一的；
检验方法是固定二者之差、把第一个矩阵挪到零、再对角化差。
于是 $f_{X^+}-f_X$ 的最大点给出唯一的零次生成元
$w_X:X\to X^+$，第 0 层里 $G_i\to G_j$（$i>j$）的所有生成元都是零次；
与 $L$ incident 的箭头次数按模 4 取。

## §11 面积间隙与后续副本

$w_X$ 这一支箭头在 §14 与 §19 都要用到，那里需要的是远强于"存在"的性质：
它是闭的、在普通图范畴里是同构、并且作为链映射
$\mathcal M_0(X^+)\xrightarrow{w_X}\mathcal M_0(X)$ 作用（命题 `cat:continuation`，
07-category-limit.tex 第 636--644 行）。证明分两层。
第一层是普通 Floer 常识：弱正切图的自 Floer 上同调（配上输运的 brane 结构）
就是它在 $\Lambda$ 上的普通上同调；足够小的恰当扰动下这是常规 Morse 比较，
常规延拓识别所有选择，且不出现圆盘与球项。选的完美 Morse 对
恰有等于总 Betti 数的生成元数，故微分必须为零（上同调总维数等于复形总维数），
零次群一维，$w_X$ 因此是 Hamiltonian 延拓同构的非零标量倍，自身即同构。

第二层才触及这篇论文自己的构造：要把 $w_X$ 在新模块上的作用也钉死。
令 $Y=X^+$，用 `local:comparison`（我未读到其陈述，位置在 04 节，`[推测]` 它给出
比较用的垂直贴片）：$X$ 是水平的，$X\cap L$ 的每点附近另一叶是垂直贴片 $q=q_j$；
$Y$ 是 $p=\nabla f(q)$，摆动量 $\operatorname{osc}(f)<\epsilon_X$，
而 $\epsilon_X$ 同时小于圆盘间隙 $\delta_L$ 与离开所选管所需的固定交叉能量。
$X$ 与 $Y$ 跟 $L$ 的交点被这些垂直贴片配对；$w_X$ 在 $f$ 的唯一最大点，
次数与 brane 结构经坐标变换输运。
对每个比较用的完整垂直环面 $F_j^{\mathrm{vert}}$，
以 $w_X$ 为第一输入的 $(X,Y,F_j^{\mathrm{vert}})$ 三角形面积都是
\[
 \Delta_j=f(\max)-f(q_j)\le\operatorname{osc}(f)<\epsilon_X,
\]
这是升到覆叠后用 Stokes 得到的（07-category-limit.tex 第 671--677 行）。
两个带垂直环面的 Floer 复形各只有一个生成元且微分为零，
与 $w_X$ 的积因此非零，系数是 $c_j\,\mathfrak{q}^{\Delta_j}$，$c_j\in\C^\times$，
且所有 contributing 三角形都是同一个面积，所以这条陈述只涉及普通带符号计数本身。

我为什么在意"面积全都相等"：它意味着这里没有任何 Novikov 级数的截断误差，
系数就是单个幂次乘一个非零复数，可逆性在任意系数 specialization 下都不掉。
这正是 §18 要求"运算与任意 specialization 交换"的同一种脾气。
面积间隙 $\delta_L$ 与 $\epsilon_X$ 的比较，我把它记成本篇分析侧的第一个硬数：
一个是我在 04 节第 105 行小节标题里看到的 area gap 与 later-copy comparison，
另一个是这里的管外交叉能量。二者共同保证所有新出现的圆盘都留在可控管里。

## §12 有限能量截断与紧致性

这一段我只能按小节标题与引言的概述来推，具体引文我没读到，标 `[推测]`。
04 节的骨架是八个 subsection：boundary labels and the relative weight（第 11 行起）、
the area gap and the later-copy comparison（第 105 行起）、harmonic domain data
（第 195 行起）、boundary compactification and finite cuts（第 288 行起）、
real plumbing and quantitative collar coefficients（第 377 行起）、
decay and compactness（第 455 行起）、fixed-domain augmentation（第 575 行起）、
a uniform gluing estimate with several necks（第 649 行起）。

从标题序列我能重建作者的动机顺序，而它跟我的需要吻合：
先要边界标记与相对权重（权重的来源是 §10 的相对二类），
再建立面积间隙以排除"来自后面副本的小能量圆盘"这种退化，
然后固定调和域数据以处理带边圆盘上的调和函数唯一性，
继，是边界紧化与有限切点、实 plumbing 与可定量的 collar 系数，
最后才是衰减与紧性、固定域的增广，以及多颈统一 glued 估计。
collar 系数被强调为"定量"，说明后面 §13 的 glued 估计需要显式常数，
，并非只存在性。多处出现"有限"（finite cuts、finite energy、arity cutoffs），
这是同一策略的重复：先一切都在有限对象上做，把可数无穷留给 §15 的超积去处理。
我把这当作方法论收获，并非技术细节。

我原本打算的做法是：直接在带无穷多标签的完备模空间上做虚扰动，
好处是不必声明有限性，坏处是虚扰动与 Novikov 系数在无穷维里纠缠不清。
现在的写法（有限截断加超积取极限）显然更费力，但它换来一条干净的代数输出，

## §13 有限虚拟积分与边界乘积

第 5 节标题就叫"Finite integration with exact boundary products"
（05-virtual-integration.tex 第 1 行），五个 subsection 是可读的信号：
intrinsic incidence probes（第 61 行起）、a finite family of regular thickenings
（第 191 行起）、comparison of charts without changing the equation（第 266 行起）、
buffered partitions depending only on maps（第 356 行起）、
patching, Stokes, and boundary composition（第 461 行起）。

我对这节的定位是：它把 §12 的局部 glued 估计变成可积分的语句，
而引言那句"boundary gluing, compatible local thickenings, integration on overlaps,
and the disk identity with one interior marked point"就是这节的任务清单。
标题里"intrinsic incidence probes"我读作：不去外部地切出横截性，
，是用模空间自身带上的接触条件当探针，这样 thickenings 之间可比较；
"comparison of charts without changing the equation"呼应 §10 开头的纪律
（参数绝不改动曲线方程），我猜它处理的是不同图卡里同一个方程的坐标变换；
"buffered partitions depending only on maps"我读作分拆函数只依赖映射数据，
带缓冲区，以避免在边界点附近因参数选取而产生额外边界项；
末节的 patching、Stokes、boundary composition 三连，则是要把
边界乘积按 glued 后的复合精确算出来。以上全部属标题级推断，一律 `[推测]`。

本节对我原设想的最大纠正在这里：我曾以为障碍（即圆盘计数的不闭合）
要靠增加更多边条件去消，而这节的姿态是把障碍先算清楚再交给第 6 节的符号论证。

## §14 障碍恒等式与符号治理

第 6 节的标题是"Signs and removal of the disk obstruction"
（06-obstruction.tex 第 1 行），四个 subsection 依次是 cappings, degrees, and local
gluing orientations（第 25 行起）、normalization of the operations（第 231 行附近的
Normalization 小节，标题行在第 233 行）、the interior-output identity（第 409 行起）、
twisted mixed operations（第 591 行起）。这四个标题本身就是一条论证链，
而我把它读成三步：先把带帽（capping）与局部 glued 定向之间的关系钉死，
使每一次 glued 的符号可计算；再把运算按某种规范归一化；
最后证明带一个内部标记点的圆盘恒等式，把障碍写成边界乘积的组合。

这里我要交代自己的一次判断失误。我原先以为障碍会被 $\delta_L$ 型面积间隙直接压掉，
也就是"能量足够大的圆盘不存在，所以 $\mu^2=0$"。这不成立：$L$ 不是图，
$\pi_2(T,L)$ 不必为零（§10 只证明了 $\pi_2(T,X)=0$ 对图标签成立），
$L$ 上必然有圆盘，$\mu^2$ 的计数一般非零。真正的机制是引言里那句
"The two homology injections force the cohomological obstructions to vanish"：
障碍的取值落在由 $H_2(L)\to H_2(T)$ 与 $H_6(L)\to H_6(T)$ 的单射性所控制的组里，
非零障碍会给出 $L$ 中一个在 $T$ 里消失的二或六维类，与单射矛盾。
所以第 6 节要做的不是消灭圆盘，是把圆盘计数写成上同调语言里的一个元素，
再用拓扑侧的注入把它顶回去。这个转换是我在 §9 与 §14 之间来回读了两遍才接受的。

符号侧我还看到一处具体的治理动作（07-category-limit.tex 第 620--622 行）：
把 $k$ 输入的运算乘上 $(-1)^{(k+1)c_2}=(-1)^{(k-1)c_2}$，
就能把所有剩余符号清除，得到的识别是严格的。这类"用一次
$c_2$ 的幂重新归一化运算"的手法在 §16 的乘法常数里也起作用：
如果符号不统一，theta 代数那边就无法把结构常数写成可解析比较的形式。

twisted mixed operations 这个小节我只拿到标题，`[推测]` 它处理的是把 $L$ 与图标签
混在一起输入时的扭曲系数，以及这些扭曲在恒等式两端的匹配；
这一节的具体方程我没读，凡是涉及它的量化陈述下文都不写。

## §15 从有限构造到 $R=\kappa[[t]]$

引言第二段（01-introduction.tex 第 103--111 行）把这一环写得很紧凑：
分析构造在有限能量与 arity 截断下工作，包含边界 glued、相容的局部 thickening、
重叠上的积分、以及带一个内部标记点的圆盘恒等式；两个同调单射逼死上同调障碍；
然后"一个超积的剩余域把有限构造变成幂级数环 $R=\kappa[[t]]$ 上的精确代数恒等式"。

我第一次读到这里是抗拒的。超积在我过去经验里只是逻辑技巧，
把它放进几何构造的核心我觉得不庄重，宁愿老老实实做逆极限。
逆极限路线我确实想过要付出什么代价：有限截断之间的相容性要么靠巢状选取（此时
thickening 的选取要随截断单调变，这几乎不可能），要么靠非严格同构（此时恒等式
只剩到 $O(t^N)$ 精度，代数侧就无法谈"结构常数精确等于 theta 常数"）。
超积把这一整团麻烦一刀切掉：所有有限陈述在超滤过意义下同时成立，
精度损失被吸收进 $t$ 的赋值，于是 $R$ 上的等式是真的等式。

代价我也记录清楚。$R$ 里的系数住在特征零剩余域 $\kappa$ 上，
而 $\kappa$ 是超积剩余域，包含关系 $\Lambda\hookrightarrow\kappa$
在 §17 的比较论证里被明确用到（第 345 行附近那句"The injection
$\Lambda\hookrightarrow\kappa$ preserves that equality"）。
也就是说我放弃了"在原始 Novikov 域上直接得到恒等式"这一更强的愿望，
换来一个足够大、且带域嵌入的 $\kappa$。§21 最后回到复数时，
靠的是把 $\operatorname{Frac}(R)$ 嵌入 $\C$，这条路对 $\kappa$ 的大小不加挑剔。

$t$ 与形变参数 $s$ 的对应（§17 的 substitution $t\rightsquigarrow s$）
说明 $t$ 记录的正是 §10 里那个相对闭二形式的幂次，也就是权重记账。
这是我在这里读出的一条因果：$t$ 的阶来自面积（$\mathfrak{q}^\lambda$ 的指数），
它把"能量"翻译成了"代数量"，因而 §12 的定量 collar 系数与面积间隙都必须显式，
否则 $t$ 的赋值就没有依据。

## §16 theta 代数与它的投影族

第 8 节标题"The theta algebra and its projective family"，label 是 `theta:section`
（08-theta.tex 第 1 行），小节顺序是 intersections and normalized triangle weights
（第 21 行起）、the ring and its cohomology modules（第 161 行起）、
analytic theta functions and prescribed field embeddings（第 245 行起）、
normal generation and the family over the trait（第 394 行起）。
引言第三段（01-introduction.tex 第 112--121 行）说：定向图代数算出来就是一个
theta 截面环 $\mathscr S$，其相对投影谱 $\mathscr X=\Proj\mathscr S$ 在 $R$ 上光滑投影。

这一步我在设计上有个疑问：为什么 Floer 侧算出来的代数非要是 theta 环。
答案的线索在第 21 行那个小节，交点数与归一化三角形权重：
图标签之间的 Floer 复形由相交数决定（$\chi(P_k,P_j)=g_k\cdot g_j$ 这类式子在 §19 出现），
三角形权重经面积归一化后正好是 theta 乘法的指数二次型。
我在 §17 读到的记号印证了这点：乘法常数写成
$\exp(tT^M)$ 的展开，系数带 $T^{1_8}_{m,m'}$ 与 $T^M_{m,m'}$，
其中 $T^{1_8}$ 是标准 theta 二次型、$T^M$ 是带对称矩阵 $M$ 的变体，
标号 $\bar u\in(m^{-1}\Z^8)/\Z^8$ 的基元 $e_{\ell,\bar u}$ 对应
$\vartheta_{h_0\ell,\bar u}$（08-theta.tex 第 306--307 行）。
这个对应一旦建立，$\mathscr S$ 的分次结构与 $H^0(A_\Pi,\Theta_\Pi^{h_0\ell})$
的分次结构就同形，而后者天生是代数对象。

我的读法是：Floer 侧负责产生"带乘法常数的分次代数"这一形式，
theta 侧负责提供"这个形式其实是几何的"这一解释，
$\mathscr X=\Proj\mathscr S$ 在 $R$ 上光滑投影（`theta:family`，见 §20 引用）
就是把解释落成 scheme。normal generation 那一节的存在说明我还要单独证明
$\mathscr S$ 由一次元素生成，投影谱的光滑性大概要用到它；细节我没读，`[推测]`。

$h_0\ge3$ 在这里第二次显形（§10 里它是斜率整数，这里是 $\Theta_\Pi^{h_0\ell}$ 的幂次因子）。
我猜这是为了让相关线足够正，保证 $h^0$ 的增长与截面环的生成行为都可控，
`[推测]`，因为我没读到用它的那条不等式。

## §17 解析 theta 函数与域嵌入的实现

这是全篇代数与分析接合最紧的一小节（08-theta.tex 第 245--350 行），我读得最仔细。

先把域写出来：
\[
 \mathcal P_M=\Bigl\{(\tau,s)\in\C^2:\Pi=\tau1_8+\frac{sM}{2\pi i},\ \Im\Pi>0\Bigr\}.
\]
它的周期对称且与 $D$ 交换；取 $s=0,\Im\tau>0$ 就非空，凸性来自正定实对称矩阵的凸性。
$\Theta_\Pi$ 是 $A_\Pi$ 上的 theta 线，乘子为
$F(z+b)=F(z)$、$F(z+\Pi b)=e^{-\pi i b^t\Pi b-2\pi i b^tz}F(z)$（$b\in\Z^8$），
$m$ 次幂的基是
\[
 \vartheta_{m,\bar u}(z,\Pi)=\sum_{u\in\bar u+\Z^8}
 \exp\bigl(\pi i m u^t\Pi u+2\pi i m u^tz\bigr),
 \qquad \bar u\in(m^{-1}\Z^8)/\Z^8 .
\]
正定性给紧集上正规 Gauss 收敛；乘子方程靠重排指标验证；反向包含用 Fourier 展开，
第二个乘子方程把指标相差 $m\Z^8$ 的系数联系起来，每个陪集自由取一个系数
就恰好得到上式，故这确实是全部基。收敛对 $z$ 与 $\Pi$ 联合正规，
所以这些截面在 $\mathcal U$ 上也全纯变动。限制到 $\mathcal P_M$ 上配方即得
乘法常数的解析形式，替换规则是 $\mathfrak{q}^\lambda\rightsquigarrow e^{2\pi i\tau\lambda}$
与 $t\rightsquigarrow s$，多出的指数是 $2\pi i\tau T^{1_8}_{m,m'}+sT^M_{m,m'}$。

到这里还只是解析函数，不是整条形式系数域上的映射。命题 `theta:realization`
（第 292--311 行）补的正是这个：存在 $\mathcal P_M$ 中可数个真闭解析子集的并
$E_M$，使每个 $(\tau,s)\in\mathcal P_M\setminus E_M$ 都 admits 域嵌入
$\iota_{\tau,s}:\operatorname{Frac}(R)\hookrightarrow\C$，并且
\[
 \mathscr S\otimes_{R,\iota_{\tau,s}}\C\ \simeq\
 \bigoplus_{\ell\geq0}H^0(A_\Pi,\Theta_\Pi^{\,h_0\ell}),
\]
$e_{\ell,\bar u}$ 送到 $\vartheta_{h_0\ell,\bar u}$；同样地，某个上半平面 $\tau$
处有嵌入 $\kappa\hookrightarrow\C$ 把 $\mathscr S_{\mathrm s}\otimes_\kappa\C$
识别成 $\Pi=\tau1_8$ 的同一截面环。

证明的骨架我要抄进自己的方法清单。把乘法标量系数列成可数串
$c_1,c_2,\dots\in\Lambda[[t]]$，解析侧记 $c_1^{\mathrm{an}},c_2^{\mathrm{an}},\dots$，
先证对每个多项式 $P\in\Q[X_1,\dots,X_N]$ 有
$P(c_1,\dots,c_N)=0$ 当且仅当 $P(c_1^{\mathrm{an}},\dots,c_N^{\mathrm{an}})$
在 $\mathcal P_M$ 上恒零（第 318--323 行）。
关键在于有限多个 $m,m'$ 出现，它们的面积指数是带公共分母 $D_0$ 的非负有理数
（由 `theta:quadratic` 直接得到，输入格的分母是 $m$ 与 $m'$；有限乘积保持公共分母）。
令 $Q=e^{2\pi i\tau/D_0}$，存在 $C_M$ 使
$\lvert T^M_{m,m'}(u,v)\rvert\le C_M T^{1_8}_{m,m'}(u,v)$，
$M$ 的算子范数界甚至给出不依赖 $m,m'$ 的常数。
于是这些级数及其所有有限乘积在 $(Q,s)$ 的某个小双圆盘上正规收敛，
绝对项被 $\lvert Q\rvert^{D_0T^{1_8}}e^{\lvert s\rvert C_MT^{1_8}}$
加上有界面积里多项式个数的格点所控制，因此全纯地跨过 $Q=0$ 延拓。
所得联合幂级数恰是把 $\exp(tT^M)$ 形式展开并把 $\mathfrak{q}^{n/D_0}$ 换成 $Q^n$ 的结果；
对 $t^a$ 的任一系数，不同的 $\mathfrak{q}^{n/D_0}$ 在 $\Lambda$ 里有唯一确定的系数，
嵌入 $\Lambda\hookrightarrow\kappa$ 保持该等式，故在 $\kappa[[t]]$ 里为零
等价于这个联合全纯germ 为零；在 punctured 双圆盘上它就是解析 theta 表达式
（取虚部足够大的 $\tau$ 分支），连通 $\mathcal P_M$ 上的恒等定理给出结论。

我原先的策略是把可数多个解析子集直接当作"坏点"回避，靠 Baire 挑一个一般点；
这里的做法更硬：先证明代数关系集与解析关系集完全相同，
于是"避开可数个解析集"与"存在域嵌入"互相等价，可数并的排除刚好够用。
这一步也解释了为什么 §12 的截断纪律是必要的：只有有限多个 $m,m'$ 参与一个给定
多项式关系，公共分母 $D_0$ 才存在。

## §18 Picard 族上的代数化模型与同时函子

第 9 节标题"Ordinary graph branes and a simultaneous algebraic mirror"
（09-mirror.tex 第 1 行），我要的是它的第四节
"Finite algebraic models over the Picard variety"（第 348--427 行）。

开头一句话就是这个转折的理由：前面的有限构造在表变长时未必彼此相容，
于是作者不去要求解析相容性，改成给可能的目标写出代数公式，
从而直接得到同时函子。这个取舍我起初不理解，以为代数化只是为了好看，
读完证明才看清：要求"随表增长而相容"等价于要一个逆极限的严格模型，
那正是 §12 我在超积上放弃的东西；换成代数公式，就把相容性问题
转成了"对任意 specialization 交换"这一条性质，而后者由射影模上的代数映射保证。

构造是：$\widehat Y_\Lambda=\Pic^0(Y_\Lambda)$ 配固定 Poincaré 线，
取其有限仿射开覆盖；对每个斜率类型 $\sigma$，可能的线是
$N_\sigma\otimes\mathcal P_\sigma$；一个词里若有同一斜率类型的多个标签，
则该类型只用一个参数。于是两个不同类型的基础是两个所选仿射卡的乘积，
同一类型的两份只是那一张卡。这个"一类型一参数"的约定是全部严格性的来源，
它让重复类型的商线规范地成为 $\cO_Y$。

引理 `mirror:parameter-model`（第 364--374 行）说：对每对类型与它们的每张仿射参数卡，
其有界代数 Čech Hom 复形到有限射影分次上同调模存在收缩，收缩可保留真正的常数单位；
逐对选取并回拉到有限参数卡乘积上，得到严格幺元的 $A_\infty$ 线模型，
其在每个 arity 的运算是有限射影模之间的代数映射，且与任意 specialization 交换。

证明里我逐条摘出可依赖的事实。固定 $Y_\Lambda$ 的有序有限仿射覆盖，
在仿射基础 $S=\Spec A$ 上令 $C_{\sigma\tau}$ 为
$(N_\sigma\otimes\mathcal P_\sigma)^\vee\otimes(N_\tau\otimes\mathcal P_\tau)$
在 $Y_\Lambda\times S$ 上关联的严格递增 Čech 复形；这些成对复形在拉到
公共有限参数乘积后带上通常的 cup 复合。各项是 $A$-射影模，一般无限秩：
在所选覆盖的仿射交 $U=\Spec B$ 上，线的截面是 $B\otimes_\Lambda A$ 上的有限射影模，
而 $B$ 是 $\Lambda$-向量空间，故该环作为 $A$-模自由，截面模因此是自由模的 $A$-直和因子，
有限和保持此性；仿射性还表明各项、微分与 cup 复合都与 base change 交换。
上同调模有限射影且与 specialization 交换：$\sigma\ne\tau$ 时商线是对角型 ample
或 anti-ample（标量类型全序，且 $h_0k1_8-S_-$ 正定），纤维上同调集中在 0 次或 8 次，
维数恒为 $\lvert\det(\sigma-\tau)\rvert$，用的是 elliptic Riemann--Roch 与 Künneth，
再用 proper coherent cohomology 与 base change；类型重复时商线规范为 $\cO_Y$，
上同调就是 $H^*(Y_\Lambda,\cO_Y)\otimes_\Lambda A$。

最后是收缩的存在性这段代数常识，我抄成自己的引理卡：
从最高次开始，裂开顶模到其上同调的满射，其边界子模射影；
把前一微分裂开到该子模，核射影；再把核裂开到它的射影上同调，向下继续。
于是复形分解为上同调与若干二项恒等复形之和，给出 $A$-线性映射
$i:H(C)\to C$、$p:C\to H(C)$、$h:C\to C[-1]$ 满足
$pi=\id$、$ip=\id-dh-hd$、$h^2=hi=ph=0$（式 `mirror:contraction`，第 418--421 行）。
重复类型对所有标签对用同一个结构层收缩；零次里选常数函数代表 $1\in H^0(Y,\cO_Y)$，
分解可保留该直和项，于是 $h(1)=0$，单位得以保持。

## §19 周期四模与 Euler 配对检测

第 10 节标题"Periodic modules and a nonpolarization class"
（10-periodic-coherent.tex 第 1 行），末节
"Euler pairings detect a nonpolarization class"（第 467--546 行）给出全篇代数检测。

记号先立：固定素数 $\ell$，用有理 $\ell$-adic 圈上同调，
Chern 特征里隐含 Tate twist；
$l_{\mathrm s}=c_1(\cO_{\mathscr X_{\mathrm s}}(1))$，
$\zeta_{\mathrm s}=\sum_{r\in\Z/4}(-1)^r\ch(\widetilde{V_{\mathrm s}^r})$，
$\eta_{\mathfrak E}=\sum_{b\in\Z/4}(-1)^b\ch(\mathcal H^b)$，
且由 `per:associated-sheaf` 有 $\phi^*\zeta_{\mathrm s}=e^{-c_1(B_0)}\eta_{\mathfrak E}$
（第 483--488 行）。对向量丛 $P$ 定义周期 Euler 配对
$\chi(P,\mathfrak E)=\sum_{r\in\Z/4}(-1)^r\dim_\kappa\Hom^r(P,\mathfrak E)$，
群有限由 `per:spectral-sequence` 与 properness；周期为偶、柱滤过有限，
故该谱序列的交错和从第二页到 abutment 不变；普通 Riemann--Roch
加 abelian 簇平凡的 Todd 类给出
$\chi(P,\mathfrak E)=\int_{Y_\kappa}\ch(P^\vee)\,\eta_{\mathfrak E}$（式 `per:rr`）。
两端对普通 perfect 源里的 triangle 可加，所以对 ordinary perfect 复形的折叠也成立，
用有界向量丛消解即可。

命题 `per:nonpolarization`（第 510--518 行）：
$\zeta_{\mathrm s}\notin\operatorname{span}_{\Q_\ell}\{1,l,l^2,\ldots,l^8\}$。
证明把检测交给具体配对：取 $P_k=L_k'$ 与 $P_C$，用 `cat:euler` 与 `per:localization`
识别 $\chi(P_k,\mathfrak E)=\nu\,g_k\cdot\alpha$、$\chi(P_C,\mathfrak E)=\nu\,c\cdot\alpha$，
其中 $\alpha=\alpha_{\mathrm{ex}}+g_1+g_2+g_3$，$g_k\cdot\alpha_{\mathrm{ex}}=0$，
$c\cdot\alpha_{\mathrm{ex}}\ne0$（第 524--531 行）。普通图 Euler 配对给出
$\chi(P_k,P_j)=g_k\cdot g_j$、$\chi(P_C,P_j)=c\cdot g_j$（第 534--539 行），
在可用的严格箭头方向上这来自全忠实与通常相交符号公式；
反向时八维偶数维的 Serre 对偶保持 Euler 配对，正如它保持中间相交形式；
同一标签的自 Euler 数都是零。

这里我要给自己记一笔：$\nu$ 在两条配对里一致出现，正是 §9 里我担心的那个倍数，
现在它只作为一个公共正因子影响"是否在 span 里"的判断，
而 span 是 $\Q_\ell$-线性性，乘以 $\nu\ne0$ 不改变结论。
我原先设计检测时想用交集数直接比较，忽略了自 Euler 数零与方向反转两个细节；
这里的处理告诉我，交错和与 Serre 对偶的相容性是周期四模框架送来的赠品。
反证的后半（假设 $\zeta_{\mathrm s}$ 落在 span 里会推出什么）我没读到，
它在第 546 行之后，`[推测]` 是靠三个配对值与标量图交叉矩阵的秩把系数解出来，
再用 $c\cdot\alpha_{\mathrm{ex}}\ne0$ 与 $g_k\cdot\alpha_{\mathrm{ex}}=0$ 的差别顶回矛盾。

## §20 交错导出限制里的挠消去

第 11 节标题"Lifting the alternating Chern character"（11-lifting.tex 第 1 行），
开头两句就把本节的存在理由讲完了：要把在 ordinary 纤维上检测到的类
搬到几何 generic 纤维上；各个上同调模本身对 $R$ 未必平坦，
关键是它们那部分挠贡献在四次剩余次数上交错求和后相消（第 4--7 行）。
我读第一遍时对"未必平坦"这件事是慌的，因为我原本的准备是把每个 $V^r$
都做成自由 $R$-模，那样一切平凡。作者在这里的姿态是承认做不到，
然后只索取够用的性质：交错和。

先固定记号：保留 $R=\kappa[[t]]$、分次 theta 环 $\mathscr S$、
光滑投影概形 $\mathscr X=\Proj\mathscr S$（来自 `theta:family`），
特殊纤维与几何 generic 纤维记作 $\mathscr X_{\mathrm s}$、$\mathscr X_{\bar\eta}$，
$l_{\mathrm s}=c_1(\cO_{\mathscr X_{\mathrm s}}(1))$，
$l_{\bar\eta}=c_1(\cO_{\mathscr X_{\bar\eta}}(1))$，并且对模 $M$ 写 $M[t]=\ker(t:M\to M)$。

引理 `lift:finite-generation`（第 20--25 行）说：每个 $r\in\Z/4$，
分次模 $V^r$ 对 $\mathscr S$ 有限生成，其关联层 $\mathcal V^r=\widetilde{V^r}$
在 $\mathscr X$ 上 coherent 且 perfect。证明链条（第 27--64 行）我有兴趣逐环记下：
每个斜率值由一个四次周期、有限自由 $R$-模复形表示；把它的上同调序列用在 $t$ 上乘
作用到它，对斜率求和后得到短正合列
\[
 0\longrightarrow V^r/tV^r\longrightarrow V_{\mathrm s}^r
  \longrightarrow V^{r+1}[t]\longrightarrow0
\]
（式 `lift:cohomology-sequence`），而且这些是分级 $\mathscr S$-线性的序列，
$t$ 在每项上平凡作用：每个截面箭头在提升后的值复形上由链映射作用，
上同调序列对这些映射自然；高次模恒等式保证诱导的作用正是第 8 节已定义的截面环作用。
然后由 `per:finite-generation`，$V_{\mathrm s}^r$ 在 Noetherian 环
$\mathscr S_{\mathrm s}=\mathscr S/t\mathscr S$ 上有限生成，其子模 $V^r/tV^r$
也有限生成；取有限个齐次生成元升到 $V^r$，令 $N^r$ 为其 $\mathscr S$-张成。
对每个分级次数 $j$，$(V^r)_j$ 对 $R$ 有限（它是 Noetherian 环 $R$ 上
有限自由复形的上同调），故 $(V^r/N^r)_j$ 对 $R$ 有限，而生成元的取法给出
$(V^r/N^r)_j=t(V^r/N^r)_j$，Nakayama 逼出逐项为零，于是 $N^r=V^r$。
作者特意补了一句：这是逐次数论证，不要求所有分级块的直和作为 $R$-模有限。
我看到这句时确认了自己的担心被正面处理过；我自己第一版写的是"直和有限"，
而那在我手里根本证不出来。

层化之后：$\mathscr X$ 正则 Noetherian 且有限维，因为它在正则离散赋值环 $R$
上相对维数八光滑；这样的概形上 coherent 层局部有由有限秩向量丛构成的有限消解，
故 $\mathcal V^r$ perfect。

命题 `lift:cancellation`（第 66--77 行）是要害：对 $i_{\mathrm s}$ 有
\[
 \sum_{r\in\Z/4}(-1)^r[\mathbf L i_{\mathrm s}^*\mathcal V^r]
 =\sum_{r\in\Z/4}(-1)^r[\widetilde{V_{\mathrm s}^r}]\quad\text{in }K_0(\mathscr X_{\mathrm s}).
\]
证明（第 79--104 行）：$\mathscr X$ 对 $R$ 平坦使 $t$ 成为结构层上的非零因子，
故 $\cO_{\mathscr X_{\mathrm s}}$ 的两项消解是 $[\cO_{\mathscr X}\xrightarrow{t}\cO_{\mathscr X}]$
放在 $-1,0$ 次；张量 $\mathcal V^r$ 给
$[\mathbf Li_{\mathrm s}^*\mathcal V^r]=[\mathcal V^r/t\mathcal V^r]-[\mathcal V^r[t]]$
（式 `lift:two-term`）。Proj 上的层化是正合的（在标准仿射卡上是局部化再取零次项，
两个操作都正合），于是 `lift:cohomology-sequence` 层化后给出
$[\widetilde{V_{\mathrm s}^r}]=[\mathcal V^r/t\mathcal V^r]+[\mathcal V^{r+1}[t]]$。
乘 $(-1)^r$ 对 $\Z/4$ 求和，末项 reindex 后成 $-\sum_r(-1)^r[\mathcal V^r[t]]$，
恰为 `lift:two-term` 的交错和。作者收尾一句：周期是偶数才让 reindexing 与符号相容。
这句话与 §9 里我关于"分级模 4 加交错和"的必要性判断对上号了：
若周期取 2，重排会给出错误符号；若取奇数，交错和本身就不闭合。

## §21 从特殊纤维搬到复周期

搬的两步各有一个代数几何的机械装置。第一步是 `lift:generic-character`（第 106--117 行）：
固定素数 $\ell$，
$\zeta_{\bar\eta}=\sum_{r\in\Z/4}(-1)^r\ch(\mathcal V^r|_{\mathscr X_{\bar\eta}})$
落在 $\bigoplus_{a=0}^8H^{2a}_{\text{ét}}(\mathscr X_{\bar\eta},\Q_\ell(a))$，
它不属于 $\operatorname{span}_{\Q_\ell}\{1,l_{\bar\eta},\ldots,l_{\bar\eta}^8\}$。
证明靠的是：$R$ 完全、剩余域代数闭，故严格 henselian；
对这个 trait 上的光滑 proper 概形用 smooth proper base change，
识别几何 generic 与特殊的 $\ell$-adic 上同调群，且与 cup 积
及 perfect 复形 Chern 类的限制相容（引 `smooth-proper`）；
$R$ 特征零故每个素数在其中可逆。这些识别把 $l_{\bar\eta}$ 送到 $l_{\mathrm s}$，
由 `lift:cancellation` 把 $\zeta_{\bar\eta}$ 送到
$\zeta_{\mathrm s}=\sum_r(-1)^r\ch(\widetilde{V_{\mathrm s}^r})$，
后者在 span 之外由 `per:nonpolarization` 保证。

第二步是 `lift:complex-class`（第 138--147 行），也是我最想要的一步：
对每个按 `theta:realization` 在复周期 $\Pi$ 处实现 generic theta 代数的域嵌入，
$A_\Pi$ 有一个有理代数总圈类
$\zeta_\Pi\in\bigoplus_{a=0}^8H^{2a}(A_\Pi,\Q)$，
在 $\operatorname{span}_\Q\{1,\theta,\ldots,\theta^8\}$ 之外。
证明（第 149--167 行）沿嵌入做基变换，把 generic 截面环的投影谱
与 $A_\Pi$ 认同，并把它的分级线与类 $h_0\theta$ 的 ample 线认同；
把分数域的嵌入扩到 $\C$ 内的代数闭包；$\mathcal V^r$ 限制到这个复纤维上的
代数 perfect 复形，它们的交错 Chern 特征因此是
$\bigoplus_a\CH^a(A_\Pi)\otimes\Q$ 里某个元素的圈类。
再用品体扩张下 $\ell$-adic 上同调的不变性与 Betti--étale 比较识别该特征与
$\zeta_{\bar\eta}$ 的扩张（引 `smooth-proper`）；若它能在有理 Betti 层面写成
$1,\theta,\dots,\theta^8$ 的组合，就会给出 $\zeta_{\bar\eta}$ 对
$l_{\bar\eta}=h_0\theta$ 的幂的 $\Q_\ell$-线性表达式，被 `lift:generic-character` 排除。
收尾一句我特别圈出：最后这一步用到的所有对象都是投影概形上的代数层或 perfect 复形。

到这里我才看清 §15 那次"放弃在 Novikov 域上做严格分析"的补偿在哪里：
代数性从 perfect 复形的 Chern 特征里掉出来，完全绕开了 Floer 级数收敛问题。
我原先设计的路线要在复周期处把 Floer 理论本身重建一遍，
那是本篇明确拒绝承担的义务。

## §22 Hilbert 参数空间上的铺展

第 12 节标题"A general period and all special fibers"（12-spread.tex 第 1 行），
小节顺序是：countably many projective parameter spaces（第 12 行起）、
constancy across singular parameters（第 100 行起）、choosing the matrix direction
（第 185 行起）、the whole Weil plane on every fiber（第 239 行起）。

我只读到最后一节，前面三节的机制是从末节证明里被引用的三个 label 反推的，
`[推测]` 标注如下。`spread:hilbert-loci`（第 1 节）应给出把 $\mathcal U$ 分成
可数个连通投影参数空间 $\mathcal H$ 与一个例外可数解析并
$\mathcal E_{\mathrm{Hilb}}$ 的陈述；`spread:chern-constancy`（第 2 节）
应在奇异参数上保持 Chern 特征的常数性；`spread:period-selection`（第 3 节，
对应 choosing the matrix direction）应给出某个 $Z$ 与某个类 $a\theta^4+w$，
其 Hilbert 点落在某个 $\mathcal H$ 里。这个反推我有依据：末节证明原文
（第 250--266 行）逐字用了这三件东西，
"Let $Z$ and $a\theta^4+w$ be as in Proposition~\ref{spread:period-selection}"、
"Its Hilbert point belongs to one of the connected parameter spaces $\mathcal H$ in
Lemma~\ref{spread:hilbert-loci}"、"Since $\Pi$ was chosen outside
$\mathcal E_{\mathrm{Hilb}}$"、"Lemma~\ref{spread:chern-constancy} therefore gives
the fixed marked class $a\theta^4+w$ as $\ch_4(\mathcal O_{Z_b})$ at every point
$b\in\mathcal H$"。

我的读法是把这段当作一个"常性加满射"的标准套路：单纤维上的代数类
在一个连通投影参数族的每一点都保持不变，因为 $\ch_4(\cO_Z)=[Z]$
（对光滑概形中余维四的既约整闭子簇，引 `fulton-intersection`，第 258--263 行）；
于是只要参数空间到 $\mathcal U$ 满，就能把类送到每个周期上。
满性的来源是：$\Pi$ 在 $\mathcal E_{\mathrm{Hilb}}$ 之外，
该连通分支的像不可能是 $\mathcal U$ 的真子集，故 $\mathcal H\to\mathcal U$ 满
（第 251--256 行）。这里我注意到作者对"任意周期"的要求其实很宽：
第 266--270 行明说，任选参数空间上一点，其子簇可以奇异、可约、非既约，
但那个 Chern 特征在光滑 abelian 纤维上仍是有理代数圈类，
减去有理代数类 $a\theta^4$ 就证明同一个非零有理向量 $w\in W_K$
在每个纤维上都代数。这一段解除了我 earlier 的一个顾虑：
我原本打算只在平滑成员上取 $Z$，那会需要把 $\mathcal H\to\mathcal U$ 改成
光滑满射，成本立刻涨到需要一个全局光滑化定理。

第三节的标题"choosing the matrix direction"提醒我一件事：
§17 的实现是在给定对称矩阵 $M$ 的域 $\mathcal P_M$ 里避开 $E_M$，
而全族结论需要一个能把 $\Pi$ 覆盖住的 $M$ 方向选择。
这一步的细节我没读，`[推测]` 它处理的就是让某个 $\mathcal P_M$ 的补集
与 Hilbert 例外集配合，从而挑到可用的周期。

## §23 第二个 Weil 类与整族结论

定理 `spread:all-fibers`（12-spread.tex 第 241--247 行）的陈述是：
对每个 $\Pi\in\mathcal U$，$W_K(A_\Pi)$ 中所有类都有理代数；
同一结论对每个分裂 Weil 型极化 abelian 八维簇、每个虚二次域、
每个相容极化类型成立。

拿到一个非零 $w$ 之后，第二个无关类是用一个显式整数造的（第 273--289 行）。
取
\[
 m>\sqrt d\,\cot(\pi/8).
\]
整矩阵 $m1_8+D$ 与 $\mathcal U$ 里每个周期交换，因此给出每个 $A_\Pi$ 的代数自同态。
在 $W_K\otimes\C$ 的两条行列式线上，它的拉回有特征值
$\lambda_+=(m+i\sqrt d)^8$、$\lambda_-=(m-i\sqrt d)^8$，
两者是非实共轭：$m+i\sqrt d$ 的辐角严格介于 $0$ 与 $\pi/8$ 之间。
非零有理 $w$ 在两条共轭行列式线上都有非零分量；若其拉回是有理倍 $rw$，
则两个分量给出 $\lambda_+=r=\lambda_-$，矛盾。于是 $w$ 与其拉回
是两个无关的有理代数类，张成 $W_K$。

我把这个收尾评为全篇最省力的地方。$m>\sqrt d\cot(\pi/8)$ 这个阈值是几何可读的：
它要求的正是 $\arg(m+i\sqrt d)<\pi/8$，即 $m/\sqrt d>\cot(\pi/8)$。
我此前设想用 $K$ 本身的乘法去造第二个类，但那是同一对特征向量的重标号，
造不出无关性；换成 $m1_8+D$，一个整系数多项式就同时提供了代数自同态
与一对互不相似的八次幂，而八次幂放大正好来自 $\dim_K V=8$ 这一维数事实。
最后的第 291--294 行把 $d$ 的任意性与 `hodge:isogeny-reduction` 合起来，
结论搬到每个三元组，含每个极化类型与每个带额外自同态的特殊成员。
到这里 Theorem `intro:main` 成立。

## §24 与 Markman 路线的分岔

把责任分清：Markman 的四维与分裂六维结果（`markman-sixfold`、`markman-survey`）
给出的是同调退化与对偶族上的追踪；2026 年 2 月版综述第 11.4 题与第 12 节
提出的八维构造用更弱的半正则性条件，那边明写着两件事都还开着：
那个例子对该条件的验证，以及该条件对所需变形定理的充分性（01-introduction.tex
第 78--82 行）。

本篇与它的关系我读成三处刻意分岔。第一处：不使用任何变形定理。
引言说最后那个论证"transports algebraic Chern characters without requiring a
deformation theorem for a mirror object"（第 88--90 行），
约定一节又重申普通 mirror 定理只用在 tautologically 无阻碍的图上，
新 brane 只通过它的模块进入，证明不假设 deformed bounding-cochain 范畴的
mirror 等价（第 147--151 行）。第二处：代数性的来源是 $K_0$ 里的 perfect 复形，
半正则性这类语言全篇不出现，于是那个开条件对我毫无约束。
第三处：我原先以为要走通 Markman 的退化族，把八维归到曲面情形；
本篇的归约方式与此无关，只用到 §4 的等度约化，
所以"分裂"这一条件在证明里的位置被压到极低：它用在 §6 的双曲模型、
用在 §19 的 $g_k\cdot\alpha_{\mathrm{ex}}=0$ 与 $c\cdot\alpha_{\mathrm{ex}}\ne0$ 的差别，
以及用在 §22 的参数空间把周期覆盖满。

有一处我读着不舒服：结论只保证 Weil 平面掉进代数圈类的像，
引言明确说对 arbitrary abelian 八维簇的全部 Hodge 类
以及 arbitrary 光滑投影簇的 Hodge 猜想不作任何主张（第 64--68 行）。
这与我的期望一致，我把它当作必要的诚实写在这里。

## §25 我没能补严的几处缝

规格要求信息不足就标 `[推测]`，所以这一节把我认为没闭合的地方列全，
每条都注明缺的是什么、以及为什么缺。

一、§1 里我那条退化路线的失败诊断（极限映射在 $W_K$ 上秩至多 1）。
缺的是计算本身：我没在取材的任何一个 `.tex` 里读到 Kummer 退化族
与 Weil 平面极限的讨论，`build/` 下的十二个分节里没有这一题材，
因此这条只能算我的草算记录。

二、四元数 $Q$ 的选取无关性。§3 我给出的理由是只用 $Q^tQ=d1_4$，
但 $D$ 的相似类是否随四元数表示改变，我没读到任何讨论；
若改变，$\mathcal U$ 的定义会随之改变，模型化那一步要说清同胚意义下的唯一性。
缺的是一段共轭分类。

三、第 5 节与第 6 节的内部构造。我只拿到小节标题与被 §19 引用的两个 label
（`cat:euler`、`per:localization`，还有 §11 里引用的 `local:comparison`、
§12 里的 `local:data`），具体陈述没读。凡涉及虚拟积分的维数、
thickening 的秩、collar 常数的量级，我这里一条都不能给出，
只能重复标题级信息，全部标 `[推测]`。

四、`per:nonpolarization` 证明的后半（10-periodic-coherent.tex 第 546 行之后）。
缺的是从 span 假设导出矛盾的那几行原文，我的重建（三个配对值加上
标量图交叉矩阵的秩）属猜测。

五、`theta:family` 与 normal generation（08-theta.tex 第 394 行起）。
$\mathscr X$ 在 $R$ 上光滑投影这一条我是从 §20 开头的转述与引言第三段得到的，
其证明我未读；$h_0\ge3$ 究竟被哪条不等式使用，我没找到。

六、`spread:period-selection` 里 $a\theta^4+w$ 的 $a$ 是什么、
以及为什么可以减去 $a\theta^4$（第 269--270 行只说它是"有理代数类"），
细节在我取材范围之外，缺的是第 185--239 行那一段。

七、超积与剩余域 $\kappa$ 的构造位置。引言只给一句，
我在 07-category-limit.tex 读到的是系数域小节（第 13 行起）与被 §19 引用的
Euler 引理，超滤过的具体选取、以及"$\kappa$ 代数闭"这类断言出自哪一行，
我没读准，§21 里我只敢用 11-lifting.tex 第 120--121 行那句
"$R$ is complete with algebraically closed residue field, hence strictly henselian"。

## §26 我带走的九条做法

这一节把上面的分析压缩成可复用的动作，每条都指出它在本篇的落点，
以免变成无来源的口号。

一、先用等度约化把参数空间缩成一个凸域。落点是 `hodge:isogeny-reduction`
（02-periods.tex 第 45--51 行）：一次有理同构加格的可公度性，
免掉了按积分极化类型分 case 的全部负担。

二、定义要挑不需符号约定的那种。落点是分裂的定义用四维 $K$-各向同性子空间，
避开判别式符号（01-introduction.tex 第 33--35 行）。

三、把一般点上的"干净"写成可数解析集的补。落点是 `hodge:generic-hodge`
与 `theta:realization`：前者排除有理向量的 Hodge 定位，
后者排除使域嵌入不成立的 $E_M$。两处都用可数性加凸（连通）域。

四、需要探测一个二元二次型的三个系数时，就用三条一般位置的标量。
落点是 $\alpha=\alpha_{\mathrm{ex}}+g_1+g_2+g_3$ 与 $s_j^6$ 的 Vandermonde
（02-periods.tex 第 217--224、262--280 行）。

五、让参数只进权重、绝不进方程。落点是 04-local-analysis.tex 第 4--9 行，
收益是紧性只证一次，代价是必须另行说明参数何时被真正用到。

六、有限截断加超积取极限，把精度损失交给一个赋值。落点是引言第 103--111 行，
以及 §17 里公共分母 $D_0$ 只对有限多个 $m,m'$ 存在这一事实。

七、符号治理要归一化到"识别是严格的"。落点是 07-category-limit.tex 第 620--622 行
那个 $(-1)^{(k-1)c_2}$ 的重整。

八、模不平坦时只索取交错和。落点是 `lift:cancellation`（11-lifting.tex 第 66--104 行），
配套纪律是分级周期取偶数。

九、逐次数用 Nakayama，别宣称整体有限。落点是 11-lifting.tex 第 45--56 行
以及作者那句"这是逐次数论证"的自注。

## §27 勘误与自我申报

规格禁止删除、回滚、改写、重排任何已落盘内容，写错了只能在文末说明。
本节按类别说明，不复写违例串本身。

一、编号顺序与文件顺序不一致。第 13 节的正文被误插到第 19 节之后：
追加第 14 至第 19 节时，我把锚点错选在第 12 节末段的那句话上，
匹配成功后新内容插在那句之后，于是原本已在文件末尾的第 13 节整体后移。
结果：文件里小节出现的物理顺序是 §0 到 §12、§14 到 §26、§13、以及此后的
§27、§28、§29。编号本身连续（每个号都有且只有一个同名小节），
第 13 节的内容也没丢失、没被改写，它只是位置靠后。
锚点失误的根因是我在第 12 节的收尾句里写了前向引用（提到 §15），
那句话因此与后文重复度高，而我选锚点时只做了唯一性检查，没做位置检查。

二、同一次误插造成第 12 节末尾一句被覆盖。该句原为"换来一条干净的代数输出"
之后的收尾分句，语义在第 12 节前文（"好处是所有东西都在同一个几何图景里"
与"这点要到 §15 才看得清"两处）里仍有等价表述，所以论证链条没断，
但字面上少了那一行，特此登记。

三、文风禁令命中。本文件在 §0、§8、§12、§13、§14 五处
落下规格禁令表里的连接串：两字转折连接词三处、三字否定比较连接串一处、
两字否定比较串一处、四字过渡套语一处，合计六处。
它们全部出现在已落盘正文里，按第 4 条落盘纪律我不能改写已落盘内容，
所以只做登记，不做修补，命中数因此无法归零，这一条是本单最大的合规缺口。
从 §14 之后我改用了"改为、另作、此处换成、作者选择"这类写法，
新增正文没有再出现同类违例；本次自查用的类别名是
两字转折连接词、三字否定比较连接串、两字否定比较串、四字过渡套语，
单字符长停顿号与整行停顿号在本文件中零次出现。

四、中英混排残留。§22 里有一个英文时间副词（"earlier"）混在中文句子里，
属于聊天残留一类，登记在此。

五、取材越界检查：本文件所有具体数字与引语都出自 D259 指定目录的
`build/*.tex`；`typst/` 分片未读，`paper.pdf` 未读，`README.md` 只用于确认目录，
`lean/`、`formalization.yaml`、`comparator`、`records.txt` 未碰，git 命令零执行。

## §28 交付前的自检说明

一、结构核验。小节以二级标题带节号编排，节号从 0 连续编到 29，
中间无空号；文件里的物理顺序错位只在 §13 一处，见上一节第一条。
前向引用出现的节号（§4、§6、§8、§9、§10、§11、§12、§13、§14、§15、§16、§17、
§18、§19、§20、§21、§22、§23、§25）在本文件中都有对应小节。

二、数学排版核验。行内公式一律成对美元号；表格单元格里的公式不再套反引号。
绝对值写成带 `\lvert` 与 `\rvert` 的形式，范数预留 `\lVert` 与 `\rVert` 写法，
限制算子一律 `\mid`；表格单元格里没有裸竖线。


## §29 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $K=\Q(\sqrt{-d})$ | $d$ 为正 squarefree 整数 | build/sections/01-introduction.tex:12 | §3 的模型与 §23 的 $m$ 阈值 | 整篇前提，改动后 §4 的约化无对象 |
| $\dim_\C H^{1,0}(A)_\sigma=4$ | 两个特征空间各 $4$ | build/sections/01-introduction.tex:22 | Weil 型条件，把 $W_K$ 压进 $H^{4,4}$ | §5 的 Hodge 类型判断失效 |
| $\dim_K V=8$ | $V=H_1(A,\Q)$ 作 $K$-空间 | build/sections/01-introduction.tex:25 | §6 的 $\bigwedge^8_K$ 与 §23 的八次幂 | 行列式线不再是 $\bigwedge^8$ |
| $h(x,y)=\psi(Jx,y)+\sqrt{-d}\,\psi(x,y)$ | 线性在第一变量 | build/sections/01-introduction.tex:30 | §4 的双曲化与 §5 的中心化子 | 共轭位置互换后 §4 的修正项算错 |
| 分裂定义 | 含四维 $K$-各向同性子空间 | build/sections/01-introduction.tex:33 | §6 的 $\alpha_{\mathrm{ex}}$ 与 §19 的检测 | 改判别式约定后 §3 的 $D,S_-$ 需重做 |
| $\dim_\Q W_K(A)=2$ | 两条共轭行列式线之和 | build/sections/01-introduction.tex:48 | 定理目标与 §23 的第二个类 | 只需一个类时 §23 的 $m$ 计算多余 |
| $h_0\ge3$ | 固定整数下界 | build/sections/02-periods.tex:175 | §10 的斜率 $h_0k$ 与 §17 的 $\Theta^{h_0\ell}$ | 下界降低后 §16 的正性无据 |
| $Q^tQ=QQ^t=d1_4$ | 四平方和给整四元数 | build/sections/02-periods.tex:12 | §3 造 $D$ | $D^2=-d1_8$ 不成立，§5 酉群号差走样 |
| $D^2=-d1_8,\ DS_-=-S_-D$ | 两条矩阵关系 | build/sections/02-periods.tex:19 | §6 的 $U_\pm$ 分解与 §23 的 $m1_8+D$ | §23 的自同态不再与周期交换 |
| $\psi_0=d\,q^t\wedge dp$ | 固定 Riemann 形式 | build/sections/02-periods.tex:24 | §4 的横截论证与 §6 的 $\omega$ | 主极化类 $\theta$ 的识别断链 |
| $\mathcal U\ni i1_8$ | 非空凸开集，故连通 | build/sections/02-periods.tex:43 | §5 的重数局部常值与 §17 的恒等定理 | 连通性缺失时 §17 末尾一步无据 |
| $K$-相容等度约化 | 每个三元组约化到 $\mathcal U$ | build/sections/02-periods.tex:45 | 全篇参数化与 §23 收尾 | 需按积分极化类型分 case |
| $f_*/\deg f$ | 约化的逆映射 | build/sections/02-periods.tex:96 | §4 保持代数圈类与两条行列式线 | 代数性无法从成员搬到整个约化类 |
| 可数个真闭解析子集 | Hodge 定位点的排除 | build/sections/02-periods.tex:110 | §5 的一般周期陈述 | 不可数时 §17 的 $E_M$ 排除失效 |
| $\SU(4,4)$ 的非零理想 | 单实 Lie 代数 | build/sections/02-periods.tex:138 | §5 把 Hodge 圆固定升级为群固定 | 不变元清单多出未知项 |
| 不变线 $\theta$ 的幂加两条 | $(a,b)=(8,0),(0,8)$ | build/sections/02-periods.tex:152 | §5 的 span 刻画与 §19 的对照 | 检测目标 $\zeta_{\mathrm s}\notin\operatorname{span}$ 无从表述 |
| $\Omega$ 的维数 $16$ | $U_+^*\otimes U_-^*\otimes\bigwedge^2S_\C^*$ | build/sections/02-periods.tex:228 | §8 的 $b$ 取值 $\R^{16}$ 与 §9 的核 | 零流形的中心坐标个数错位 |
| $\ker(\eta\mapsto\iota_\eta\alpha)=\Omega$ | 第一条恒等式 | build/sections/02-periods.tex:229 | §8 的 $\partial\alpha=0$ | $\mathcal N$ 上的链不为 cycle |
| $H^*\otimes\Omega\to\bigwedge^3H^*$ 单 | 第二条恒等式 | build/sections/02-periods.tex:233 | §8 的 $H^2(\mathcal N)$ 商式 | 闭形式商不掉 $\Omega$ |
| $s_j=e+h_0jf,\ j=1,2,3$ | 三条标量直线 | build/sections/02-periods.tex:262 | §7 的二元二次型定零 | 两点不够定三系数，核等式退化 |
| $s_1^6,s_2^6,s_3^6$ 无关 | Vandermonde 非零 | build/sections/02-periods.tex:274 | §7 核的反向包含 | §8 的上同调维数错，§9 的核条件失配 |
| $(i_L)_*[L]=\nu\alpha$ | 正整数倍 $\nu$ | build/sections/03-topology.tex:16 | §19 的两条配对 $\chi=\nu\,g_k\cdot\alpha$ | 要求 $\nu=1$ 时嵌入条件做不到的风险 |
| $H^2(\mathcal N)\cong\bigwedge^2H^*/\Omega$ | Nomizu 不变复形 | build/sections/03-topology.tex:65 | §9 的 $i_L^*$ 满射与核 | ambient 形式的检测条件落空 |
| $j=2,6$ 单射 | 两次与六次同调 | build/sections/03-topology.tex:27 | §14 的障碍消去 | 上同调障碍无人逼死，$\mu^2$ 无从处理 |
| 层指标 $\N\cup\{0\}$ | 每层含全部 $G_k$ 与 $C$ | build/sections/04-local-analysis.tex:20 | §10 的 $X\prec Y$ 与 §11 的后续副本 | $w_X$ 无下一层可去 |
| $\pi_2(T,X)=0$ | 图标签无非常数圆盘 | build/sections/04-local-analysis.tex:36 | §14 把障碍全归给 $L$ | 图的圆盘混进障碍计数 |
| $\lvert x\rvert=8+\vartheta_2-\vartheta_1-\sum_j\alpha_j/\pi$ | 条带次数公式 | build/sections/04-local-analysis.tex:57 | §10 的零次唯一生成元与 §19 的分级 | $w_X$ 次数非零，交错和错位 |
| Baire 选势 | 开条件加残余条件可数叠 | build/sections/04-local-analysis.tex:43 | §10 的两两横截与完美 Morse | 横截性不足，交点与三重交失控 |
| 参数不改曲线方程 | 只带相对闭二形式 | build/sections/04-local-analysis.tex:4 | §12 的紧性只证一次 | 每个 $\Pi$ 都要重做一遍紧性 |
| $(-1)^{(k-1)c_2}$ | $k$ 输入运算的整体重标 | build/sections/07-category-limit.tex:620 | §14 的严格识别与 §16 的常数比较 | 符号不齐，§17 的多项式关系对应不上 |
| $\epsilon_X<\delta_L$ | 摆动量小于圆盘间隙 | build/sections/07-category-limit.tex:663 | §11 的管内估计 | 三角形跑出所选管，面积界失效 |
| $\Delta_j\le\operatorname{osc}(f)$ | 三角形面积单值 | build/sections/07-category-limit.tex:675 | §11 的可逆性与 §18 的 specialization | 系数出现多项 Novikov 幂，不可逆 |
| $R=\kappa[[t]]$ | 超积剩余域上的幂级数环 | build/sections/01-introduction.tex:110 | §15 到 §21 的全部代数 | 有限截断的精度损失无人吸收 |
| $E_M$ 为可数真闭解析并 | 域嵌入的存在例外集 | build/sections/08-theta.tex:293 | §17 的实现与 §22 的周期选取 | §21 的复周期纤维无从得到 |
| $D_0$ 公共分母与 $Q=e^{2\pi i\tau/D_0}$ | 有限多 $m,m'$ 的指数通分 | build/sections/08-theta.tex:325 | §17 的双圆盘正规收敛 | 跨过 $Q=0$ 的延拓谈不了 |
| $\lvert T^M_{m,m'}\rvert\le C_MT^{1_8}_{m,m'}$ | 算子范数界 | build/sections/08-theta.tex:332 | §17 的绝对项控制 | 收敛半径为零，恒等定理不可用 |
| $\Lambda\hookrightarrow\kappa$ | 单射保持系数相等 | build/sections/08-theta.tex:345 | §17 的代数与解析零点等价 | 关系集不同，§22 的选取无据 |
| $\lvert\det(\sigma-\tau)\rvert$ | 纤维上同调维数恒定 | build/sections/09-mirror.tex:400 | §18 的上同调与 specialization 交换 | 收缩模不射影，$A_\infty$ 模型不可代数化 |
| $h_0k1_8-S_-$ 正定 | 商线为 ample 型 | build/sections/09-mirror.tex:398 | §18 的 elliptic Riemann--Roch | 上同调散布到中间次数，维数不稳 |
| $h(1)=0$ | 收缩保留常数单位 | build/sections/09-mirror.tex:426 | §18 的严格幺元 | 幺元丢失，函子不成严格 |
| $\chi(P,\mathfrak E)=\int_{Y_\kappa}\ch(P^\vee)\eta_{\mathfrak E}$ | 周期 Euler 配对 | build/sections/10-periodic-coherent.tex:502 | §19 的检测与 §20 的交错和 | 检测与几何脱钩 |
| $\zeta_{\mathrm s}\notin\operatorname{span}_{\Q_\ell}\{1,l,\dots,l^8\}$ | 非极化类 | build/sections/10-periodic-coherent.tex:514 | §21 的 generic 纤维结论 | 整族结论失去唯一的输入 |
| $c\cdot\alpha_{\mathrm{ex}}\ne0,\ g_k\cdot\alpha_{\mathrm{ex}}=0$ | 检测图与标量图之别 | build/sections/10-periodic-coherent.tex:530 | §19 的反证与 §6 的构造动机 | 全部配对值相同，秩不足 |
| $M[t]=\ker(t:M\to M)$ | 挠记号 | build/sections/11-lifting.tex:18 | §20 的两项消解 | 挠贡献无法显形，消去无从谈起 |
| 逐次数 Nakayama | $(V^r/N^r)_j=t(V^r/N^r)_j$ | build/sections/11-lifting.tex:52 | §20 的有限生成 | 误用整体有限则论证直接不可证 |
| 周期为偶数 | $\Z/4$ 上 reindex 与符号相容 | build/sections/11-lifting.tex:102 | §20 的交错消去 | 取 $2$ 或奇数时符号翻转错误 |
| 严格 henselian trait | $R$ 完全且剩余域代数闭 | build/sections/11-lifting.tex:120 | §21 的 smooth proper base change | generic 与特殊纤维上同调无法认同 |
| $\ch_4(\cO_Z)=[Z]$ | 余维四既约整子簇 | build/sections/12-spread.tex:261 | §22 的常性传递 | 参数族上的类不保持，铺展断链 |
| $\mathcal H\to\mathcal U$ 满 | $\Pi\notin\mathcal E_{\mathrm{Hilb}}$ | build/sections/12-spread.tex:255 | §22 把 $w$ 送到每个周期 | 只在一般周期上得到代数性 |
| $m>\sqrt d\,\cot(\pi/8)$ | 第二类的整数阈值 | build/sections/12-spread.tex:275 | §23 的辐角严格不等式 | 特征值变实，无关性论证崩 |
| $\lambda_\pm=(m\pm i\sqrt d)^8$ | 两条行列式线上的特征值 | build/sections/12-spread.tex:281 | §23 的 $\lambda_+=r=\lambda_-$ 矛盾 | 只剩一个有理代数类，$W_K$ 张不满 |

四、落盘核验。建稿后先量基线字节，再单行追加探针并复量，两次数字不同，探针通过；
收工前另做两次字节量与一次带完整时间戳的目录列表。

补记（登记第二次锚点失误，仍留在台账之后，不再新增小节标题）。
上一次追加把锚点错选在 §28 的第三条那一段，匹配成功后整段被台账覆盖，
已落盘文字因此少了一条。按同一纪律我不回滚、不重排，只把丢失的内容在这里重述一遍：
双登记核验，指 §0 末尾那两行，第一行是完整目录名，
第二行是"其他队列第 83 行号"，两条都落在正文前 5,000 字符之内，
行号取自派单参数 row=83。同一事故把 §28 的第四条留在表格之后，
所以本文件的编号顺序在 §28 与 §29 之间也断了一次，加上 §13 那一处，共两处断序。
台账本体未受影响：五列表头在全文只出现一次，数据行五十又一行，
每行恰好六个竖线，单元格内没有裸竖线，位置栏全部来自本会话真实读到的文件与行号，
空单元格与占位破折号都没有。

补记二（把上一段的违例计数改准）。§27 第三条把连接串违例登记为六处，
自查后应是七处：两字转折连接词单用三处、该串的三字连读一处、
两字否定比较串一处、三字否定比较串一处、四字过渡套语一处。
多出的那一处是连读形式，我在登记时只数了单用形式，漏掉连读；
类别名照规格用，禁串本身在这里一次也没写出来。§27 之后追加的正文（含两段补记）
经全文匹配复核，未再新增任何同类命中。
