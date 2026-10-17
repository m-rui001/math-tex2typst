# D350 八维 De Giorgi 猜想的正面解决：把证明倒推回它的发生过程

## §0 派单登记与取材参数

本笔记对应派单 D350。参数行取自 `.tools/wave.txt`：`row=174`，`bytes=345959`，`thin=no`，取材目录照抄如下，日期后缀原样保留：

preprints/De-Giorgis-conjecture-in-dimension-eight-September-26-2026
其他队列第 174 行号

按厚素材协议，先用 `ls` 量出每个 `.tex` 的字节数，再分段读主干。build 下的实测清单：`main.tex` 5,996 字节；`00-introduction.tex` 10,996；`00-classical.tex` 2,878；`01-strategy.tex` 9,283；`01-diffuse.tex` 27,154；`02-finite-density.tex` 39,596；`02-monotone.tex` 25,637；`03-reach.tex` 59,277；`04-interface.tex` 62,240；`05-growth.tex` 48,984；`06-radial.tex` 49,007；`09-dimension-nine.tex` 4,911。`main.tex`、引言、经典节、策略节、几何演绎节、diffuse 节与附录整读；其余五个大文件先以一次结构 grep 定位定理环境行号，再按 offset 分段取读关键命题与证明首尾。

正文素材全部来自上述 `build/` 下的 `.tex`；`typst/` 分片与 `README.md` 未作正文来源；无 Lean 行，未碰 `lean/`。论文标题与作者栏：`A positive resolution of De Giorgi's conjecture in dimension eight`，作者栏 OpenAI，日期 September 26, 2026（`main.tex:107-109`）。

## §1 出发点：De Giorgi 猜想到八维这堵墙

我手里的问题是 Allen--Cahn 方程
$\Delta u=u^3-u$ 在 $\R^n$ 上的有界整解，条件只有一个：存在一个方向，沿它严格单调。De Giorgi 在 1979 年的提问是，这样的解在 $n\le 8$ 时必然平面化，即呈 $g(e\cdot x-c)$ 形，其中 $g(s)=\tanh(s/\sqrt2)$（`00-introduction.tex:9-16`）。

已知的地形图是这样摆的。$n=2$ 归 Ghoussoub 与 Gui，$n=3$ 归 Ambrosio 与 Cabr\'e；Savin 把结果推进到八维，代价是一个额外假设：沿单调方向的两个端点极限逐点成立，$\lim_{t\to-\infty}u(x',t)=-1$、$\lim_{t\to+\infty}u(x',t)=1$ 对每个横向 $x'$ 都要有（`00-introduction.tex:44-50`）。反面，del Pino、Kowalczyk 与 Wei 在 $n\ge9$ 每个维度都造出了非平面的严格单调解，它们是大的非仿极小图的大膨胀附近的扰动（`00-introduction.tex:52-54`）。八维处在两边都知道答案的位置：正面结果缺端点极限，反面结果从九维才开始。猜想本身在八维悬空，悬空的恰好是"端点极限可不可以不要"。

八维这道墙的位置有经典出处。相变能量的 $\Gamma$ 极限是界面周长（Modica--Mortola），于是 Allen--Cahn 的问题与极小超曲面的 Bernstein 问题配对。极小曲面这一侧有两个著名的维度差：非平的面积最小化锥第一次出现在环境维八（Bombieri--De Giorgi--Giusti），并非仿的整极小图第一次出现在环境维九（Simons）。所以八维正好卡在"最小化锥可能开始奇异、但奇异集被维数压缩钉死"的那一格；九维开始，奇异锥与奇异线都活了，DPKW 的反例正是寄生在这条缝里。

我最初的猜想路线因此非常自然：单调解放大（blow-down）应当给出一个带方向的极小锥，八维的奇异性定理说奇异集至多一个点，锥的伸缩不变性把这个点也排除掉，剩下超平面。这条路要跑通，至少要还两笔债。第一笔：$u$ 得先是最小化子，才有资格用最小化边界理论，而手里只有单调性；Savin 的端点极限假设正是用来造上下障碍的，去掉它之后障碍从哪里来？第二笔：blow-down 的测度极限与周长测度的等式要逐字成立，否则密度无法确定，后面回不到方程。两笔债在论文里分别由七维稳定解的分类与一个修补技术还清。这个"为还一笔债先去证一个更大的定理"的动作，是整篇论文结构的根，也是我从成稿反推思维链时最先要交代的地方。

## §2 演绎地图：三个定理和它们的依赖边

论文有三个刚性定理，成稿的部次安排把它们错开摆放，我把依赖边理顺后是这样。

定理一（八维单调刚性，`thm:monotone`，`00-introduction.tex:59-70`）：$u\in C^2(\R^8,(-1,1))$ 解 $\Delta u=u^3-u$ 且 $\partial_8u>0$，则 $u$ 是平面 heteroclinic，且法向 $e$ 满足 $e_8>0$。假设里没有能量增长，也没有最小化；这两样后来都成了结论。

定理二（七维稳定刚性，`thm:stable`，`00-introduction.tex:103-112`）：$v\in C^2(\R^7,[-1,1])$ 稳定解 $\Delta v=v^3-v$，则 $v\equiv\pm1$ 或平面 heteroclinic，同样无能量增长假设。

定理三（有限密度稳定刚性，`thm:finite`，`00-introduction.tex:197-207`）：$4\le n\le7$，稳定且 $M_\infty<\infty$ 的整解只能是常数井或平面解，其中
$M_R(y)=\mathcal E(v;B_R(y))/(s_0\omega_{n-1}R^{n-1})$，$M_\infty=\sup_{R>0}M_R(0)$。

依赖方向：定理二推出定理一（Part I，`02-monotone.tex`）；定理二本身由定理三加"七维稳定解的密度自动有限"推出（Part II--IV，`01-diffuse`、`02-finite-density`、`03-reach`、`04-interface`、`05-growth`、`06-radial`）。定理三在 Part II 内部独立证明，并且它的局部版本（任一足够大球上的密度界即给正则性，见 §13）反过来喂给无密度界部分。

定理一到定理二的通道里有一个标准但关键的观察：$\partial_8u>0$ 意味着 $h=\partial_8u$ 满足线性化方程 $(-\Delta+3u^2-1)h=0$，正解 $h$ 立刻把 $u$ 抬进稳定类；再取平移列的极限，两个端点剖面 $v_\pm$ 继承稳定性，落到七维。于是定理一的全部难度转移到"分类七维稳定解"。这里我看到的思维转折是：与其对单调解本身继续加码，不如承认端点剖面是更自由的对象（它们允许是平面 heteroclinic，端点假设本来就是为了把剖面钉成常数井），然后去证一个只依赖稳定性的定理。稳定性比最小化弱（`00-introduction.tex:94-96` 明确说了这一点），所以定理二在逻辑上覆盖单调情形的一切来源，而代价是需要全新的估计。

尖锐性对照也记一下：Pacard 与 Wei 在八维造出有界稳定非平面解（`00-introduction.tex:115-116`），所以七维这个端点是维度意义的最后一格；最近 Liu、Luo、Wang、Juncheng Wei、Yong Wei 与 Wu（LLWWW）证三维稳定刚性、四维单调刚性，Chan、Fern\'andez-Real、Figalli、Florit-Simon 与 Serra（CFFFS）独立得到同样结论，Florit-Simon 与 Serra（FSS）在四维带能量密度假设证稳定刚性（`00-introduction.tex:118-124`）。本文相对它们多出两件事：维度更高，以及把密度假设拿掉，正文里明说这两件事由不同的分析部件承担。

还有一个几何平行值得存档：六维流形到 $\R^7$ 的双边稳定极小浸没的 stable Bernstein 定理（Hong--Li--Wang，无体积增长假设）与定理二同形；论文特意声明该定理不是它的输入（`00-introduction.tex:33-38`）。我在读到这里时的判断是：稳定极小曲面一侧的对应物在六维可行，正是因为 $|A|^2$ 的 Simons 型积分恰好把维度推到临界；Allen--Cahn 侧的界面维 $m=6$ 同样卡在 $m-4$ 权重的边界上（见 §17），两条线的"八/九"墙其实是同一堵。

## §3 两件经典工具：Modica 梯度界与能量单调性

两条演绎路线都先花一节把两个经典估计在本规范化下重证（`00-classical.tex`），这是全文符号一致性的锚。

第一件，Modica 梯度界 $\frac12|\nabla v|^2\le W(v)$（`00-classical.tex:19-20`）。整解版本的证明很短：设 $P=\frac12|\nabla v|^2-W(v)$，由 $\nabla P=\nabla^2v\nabla v-W'(v)\nabla v$ 与 $\Delta P=|\nabla^2v|^2-W'(v)^2$，在 $\nabla v\neq0$ 处有 $\Delta P\ge\frac{2W'(v)}{|\nabla v|^2}\nabla v\cdot\nabla P$。若 $\sup P>0$，平移极大化序列取局部光滑极限，$P$ 在一个 $\{\nabla v\neq0\}$ 分量上取正最大，强极值原理使 $P$ 在该分量上为常数；该分量又闭（$|\nabla v|^2\ge2\sup P>0$），故它是全空间。最后一步是我觉得漂亮的：$\nabla v$ 整体有界，其向前流完备，沿流 $v$ 以至少 $2\sup P$ 的速率增长，与 $v$ 有界矛盾。一个动力系统收尾，纯 PDE 的论证到此合上。

第二件，能量单调性。记 $e(v)=\frac12|\nabla v|^2+W(v)$，$M_r(y)=\frac1{s_0\omega_mr^m}\int_{B_r(y)}e(v)$。应力张量 $e(v)\Id-\nabla v\otimes\nabla v$ 散度自由，对 $x-y$ 的导数作缩并再散度定理，得
$r\int_{\partial B_r(y)}(e(v)-|\partial_rv|^2)=\int_{B_r(y)}((m+1)e(v)-|\nabla v|^2)$，进而
$M_r'(y)=\frac1{s_0\omega_m}\{r^{-m-1}\int_{B_r(y)}(W(v)-\frac12|\nabla v|^2)+r^{-m}\int_{\partial B_r(y)}|\partial_rv|^2\}\ge0$（`00-classical.tex:48-60`）。平移球包含关系给出 $y$ 无关性：$M_r(y)\le M_\infty$。全程不碰稳定性，也不碰密度假设，这两件事后面各自在别处进场。

这里我把两个常数分开记牢：表面张力 $s_0=\int_{-1}^1\sqrt{2W}=\frac{2\sqrt2}{3}$（`00-introduction.tex:147-151`），法向平均权 $\sigma=\int_\R G^2=\frac{4\sqrt2}{3}=2s_0$，其中 $G(s)=1-g(s)^2$。引言约定 $s_0$ 与 $\sigma$ 始终分用，全文一切密度、界与系数比较都挂在这两个数上。



## §4 从单调性到全局最小：端点剖面、标定与滑动

Part I 的第一块砖是端点剖面引理（`lem:monotone-ends`，`02-monotone.tex:37-102`）。设定：$u\in C^2(\R^8,(-1,1))$，$\partial_8u>0$。要得到的东西：光滑稳定解 $v_-,v_+$ 使 $u(x',t+s)\to v_\pm(x')$ 于一切 $C^k_{\rm loc}$，且 $v_-<u<v_+$ 处处成立，而它们对第八坐标的延拓在 $\R^8$ 里是全局最小化子。

反推这一步的动机，我读出来的顺序是这样。内椭圆估计先把 $u$ 抬到光滑与逐阶一致界；单调有界给出每条竖线的逐点极限；平移列的紧致性把逐点升级成 $C^k_{\rm loc}$。关键是稳定性怎么传下去。地面态恒等式：$h=\partial_8u>0$ 满足线性化方程，于是对任何紧支 $C^1$ 的 $\eta$，
$\int_{\R^8}(|\nabla\eta|^2+(3u^2-1)\eta^2)=\int_{\R^8}h^2|\nabla(\eta/h)|^2\ge0$（`02-monotone.tex:58-64`）。除法合法因为 $h$ 在 $\eta$ 的支集上有正的最小值。这个恒等式把 $u$ 的稳定性一次拿到手。然后从八维降到七维：取 $\eta(x',t)=\varphi(x')\zeta(t/L)$，除以 $L\int\zeta^2$，得到七维二次型带一个 $-\frac1{L^2}\frac{\int|\zeta'|^2}{\int\zeta^2}$ 的误差，令 $L\to\infty$（`02-monotone.tex:74-82`）。长柱测试是标准手法，但值得记下误差是 $L^{-2}$ 阶，这说明任何 $o(L^{-2})$ 级别的修改都无损论证。

严格不等式 $u(x',t)<u(x',t+1)\le v_+(x')$ 一行就完成（`02-monotone.tex:83-84`），下界对称。这一段是我说的"端点假设被内化"的位置：Savin 需要逐点极限假设，这里只需要 $v_\pm$ 存在且被 $u$ 严格夹住，而极限由方程自己给。

延拓剖面是全局最小化的检验走了另一条线：势原函数 $\Phi(a)=\int_{-1}^a\sqrt{2W(b)}\dd b$，标定不等式
$\frac12|\nabla w|^2+W(w)\ge\sqrt{2W(w)}\,\partial_ew=\partial_e\Phi(w)$（`02-monotone.tex:90-95`），$w=g(e\cdot x-c)$ 时取等（$g'=\sqrt{2W(g)}$），右边积分只依赖边界迹。平面 heteroclinic 与常数井 $\pm1$（零能量）都因此在一侧被标定为最小化子；七维剖面按 $e_8=0$ 延拓进 $\R^8$，标定不分维度。这里我要诚实记录一次读时的犹豫：$v_\pm$ 允许是剖面，并非常数井，会不会破坏后面的滑动比较？读完 §4.1 才明白不会，滑动只用 $a_-<u<a_+$ 的严格夹逼，剖面井一视同仁。

第二块砖是最小化障碍与紧滑动引理（`lem:monotone-minimizer`，`02-monotone.tex:126-194`），它在任意维 $N\ge2$ 成立。直接方法取球 $B$ 内同迹极小 $w$，截断至 $[-1,1]$；先用下界 $a_-$ 剪：Sobolev 格恒等式
$\mathcal E(\max\{w,a_-\};B)+\mathcal E(\min\{w,a_-\};B)=\mathcal E(w;B)+\mathcal E(a_-;B)$，边界上 $u>a_-$ 使 $\min$ 项与 $a_-$ 同迹，$a_-$ 的最小性给出 $\mathcal E(w_1;B)\le\mathcal E(w;B)$，而 $\max$ 项仍同迹 $u$；再用 $a_+$ 剪上去，得夹在两者之间的无约束极小 $\widetilde w$。强比较把不等号变严格：$a_-<\widetilde w<a_+$ 于 $\overline B$（差满足带零阶有界系数的线性方程 $-\Delta(b-c)+(b^2+bc+c^2-1)(b-c)=0$）。然后竖移 $u$ 的两族列 $u_s$ 从上方与下方逼近 $\widetilde w$，各自取下确界/上确界接触参数，正的接触参数在边界严格不等式加强比较下不可能，于是 $\widetilde w=u$，$B$ 任意。

这个滑动是 Jerison--Monneau 定理的重演，论文把对位交代得很清楚：端点剖面之间的受约束比较出自 Alberti--Ambrosio--Cabr\'e，无约束最小化的推出是 Jerison--Monneau 的经典定理，他们用全局 $C^{1,1}$ 势假设，本文验证三次势的延拓
$\widetilde W(s)=(s+1)^2$（$s<-1$）、$W(s)$（$-1\le s\le1$）、$(s-1)^2$（$s>1$）恰好满足：在井点处值、一阶、二阶导都衔接，$\widetilde W'$ 全局 Lipschitz（`02-monotone.tex:112-124`）。我核对过这个衔接：$W(s)=\frac14(1-s)^2(1+s)^2$，在 $s=1$ 附近主部正是 $(s-1)^2$，所以延拓是"自然的"，四次势与抛物势在井边同阶，这条观察让我确信 Jerison--Monneau 的框架在此零成本可调用；换双阱势生长阶不同就要重做。

能量增长在同引理内顺手得到：取截断 $\eta_R$ 在 $B_{R-1}(y)$ 内为 0、近 $\partial B_R(y)$ 为 1、$|\nabla\eta_R|\le C$，竞争者 $1+\eta_R(u-1)$ 在内球零能量、在壳层密度有界（用 $|u|\le1$ 与单位尺度内梯度估计），壳体积 $O(R^{N-1})$，于是 $\mathcal E(u;B_R(y))\le C_NR^{N-1}$ 对一切 $y$、一切 $R\ge2$（`02-monotone.tex:186-193`）。注意方向：增长是结论，先有最小化再有比较者，顺序不能反。

## §5 精确周长极限：把多余弥散能量逐字杀死

下面这一步在成稿里被特别标注了动机，我从它反推当时真正怕什么。命题（`prop:monotone-exact-limit`，`02-monotone.tex:242-373`）：整全局最小化子 $u:\R^N\to[-1,1]$ 带 $\mathcal E(u;B_R)\le CR^{N-1}$，取 $R_j\to\infty$、$\eps_j=R_j^{-1}$、$u_j(x)=u(R_jx)$，则 subsequentially 有有限周集 $E$ 使 $u_j\to2\mathbf1_E-1$ 于 $L^1_{\rm loc}$，且能量测度
$(\frac{\eps_j}2|\nabla u_j|^2+\frac{W(u_j)}{\eps_j})\dd x\rightharpoonup s_0|D\mathbf1_E|$
作为局部 Radon 测度逐字相等；$E$ 对紧扰动局部周长最小（`02-monotone.tex:249-260`）。

相位收敛与测度下半连续只白送一边：$\mu\ge s_0|D\mathbf1_E|$（`02-monotone.tex:288-292`）。差的来源是可能的额外弥散能量，比如相边界上多出来的过渡层质量。论文对它的担心写得直白：引言里"这一等式需要一条与原解粘合的重建序列；仅有相位收敛会把额外能量的可能性留着不关"（`00-introduction.tex:155-158` 的中译）。

反向不等式的机器我逐步拆开。固定球 $B_r(y)$ 与 $\delta>0$，取有限周集 $F$ 在放大球 $B_{r+\delta}(y)$ 内、在环带 $A=B_{r+\delta}\setminus\overline{B_r}$ 上与 $E$ 一致（$F=E$ 允许），在放大球上取 Modica--Mortola 重建序列 $w_j$。二者在 $A$ 上都收敛到同一相位，$\int_A|u_j-w_j|^2\le2\int_A|u_j-w_j|\to0$。把 $A$ 除去一小余量切成 $L_j=\lfloor\delta/\eps_j\rfloor-1\ge\delta/(2\eps_j)$ 个厚度 $\eps_j$ 的径向层；单层 $S$ 上用 $|\nabla\chi|\le C/\eps_j$ 的插值 $z_j=(1-\chi)w_j+\chi u_j$，势的凸性估计 $W((1-\chi)a+\chi b)\le C(W(a)+W(b)+|a-b|^2)$ 给出单层代价
$\mathcal E_j(z_j;S)\le C(\mathcal E_j(u_j;S)+\mathcal E_j(w_j;S))+\frac C{\eps_j}\int_S|u_j-w_j|^2$。对互不相交的层平均，选到好层 $S_j$，其代价
$C\frac{\eps_j}{\delta}(\mathcal E_j(u_j;A)+\mathcal E_j(w_j;A))+\frac C\delta\int_A|u_j-w_j|^2=o_j(1)$（`02-monotone.tex:327-334`）。要点我圈出来：平均消掉了单层里 $\eps_j^{-1}$ 乘失配的爆炸因子，因此对 $L^1$ 收敛不需要任何速率；$\delta$ 在 $j\to\infty$ 之前固定。然后把 $w_j$、层内插值、$u_j$ 三段拼成 $u_j$ 的容许紧修改，最小性给 $\mathcal E_j(u_j;B_r(y))\le\mathcal E_j(w_j;B_{r+\delta}(y))+o_j(1)$，于是对满足 $\mu(\partial B_r(y))=0$ 的半径有 $\mu(B_r(y))\le s_0P(F;B_{r+\delta}(y))$。

收尾是两段取极限：先 $F=E$，在 $\mu$ 与周长的公共连续半径（每个中心至多可数个坏半径）上令 $\delta\downarrow0$，与 $\mu\ge s_0|D\mathbf1_E|$ 夹逼，差测度 $\mu-s_0|D\mathbf1_E|$ 非负且在邻域基的球上为零，故 $\mu=s_0|D\mathbf1_E|$，"不再有多余的过渡层质量"。再对 $F\mathbin\triangle E$ 紧含于某开球的情形，选球内球外的连续半径，$\delta\downarrow0$ 给 $P(E;B_r)\le P(F;B_r)$，周长最小性到手。整段论证先于多重一几何理论使用，测度等式因此不是从 varifold 理论借的，是从重建序列挣来的；这个顺序在 `02-monotone.tex:238-240` 被明写。

## §6 带方向的极小锥与零法向分支

把锥的生成写全：对任意 $R_j\to\infty$ 用上一命题，在连续半径上有 $P(E;B_r)=\omega_7r^7M_\infty$（`02-monotone.tex:392-399`），夹逼到一切 $r$。中心面积比恒常，单调性的等号情形逼出 $\operatorname{supp}|D\mathbf1_E|=C$ 是顶点在原点的锥，非空、含原点、多重一（权重是周长测度）。竖直单调也过界：对非负 $\psi$，$-\int u_j\partial_8\psi=\int(\partial_8u_j)\psi\ge0$，取 $L^1$ 极限得 $\partial_8\mathbf1_E\ge0$ 作为分布乃至测度，即 $\nu_E\cdot e_8\ge0$ 在正则部分（`02-monotone.tex:409-420`）。

锥平坦引理（`lem:monotone-flat-cone`，`02-monotone.tex:422-504`）是八维吃第一口维数的地方，证明分两半。

前半：奇异集维数至多 $N-8=0$。若存在非零奇异点，伸缩不变性（每个膨胀是保持 $C$ 的周围环境微分同胚）沿该射线生成整条奇异射线，矛盾；故 $\operatorname{Sing}C\subset\{0\}$，link $\Lambda=C\cap\mathbb S^7$ 是 $\mathbb S^7$ 中光滑紧嵌入极小超曲面（可能多分支）。定向法向在正则边界连续；切法线在膨胀下不变、选侧只有两值且连续，故沿每条正则射线常值：$f=\nu_E\cdot e_8\ge0$ 零次齐次。法向是平移的 Jacobi 场：$\Delta_Cf+|A_C|^2f=0$；锥度量 $\dd r^2+r^2g_\Lambda$、$|A_C|^2=r^{-2}|A_\Lambda|^2$ 化简为 $\Delta_\Lambda f+|A_\Lambda|^2f=0$（`02-monotone.tex:455-465`）。在某分支上 $f\not\equiv0$ 则强极值原理给 $f>0$，紧流形上积分得 $\int|A_\Lambda|^2f=0$，该分支全测地，于是是整赤道 $\mathbb S^6$。其余分支若存在须落入开半球，而闭的六维极小超曲面在 $\mathbb S^7$ 中的带符号坐标函数 $\ell$ 满足 $\Delta_\Lambda\ell+6\ell=0$、积分应为零，开半球内却定号严格，矛盾；故无其余分支，$C$ 是赤道之上的超平面。

后半是我读时最惊喜的：$f\equiv0$ 在一切分支上为零的情形，成稿特意说"我们把这一情形也包含进来"（`00-introduction.tex:166-168`）。此时周长测度不给可数奇点以质量，$\partial_8\mathbf1_E=0$ 在全 $\R^8$ 的分布意义成立；一个方向的分布导数为零的局部可积函数沿该方向平移不变（磨光、光滑情形断言、回到 $L^1_{\rm loc}$ 极限三步）。于是每个竖直平移保持 $\mathbf1_E$ 的等价类，也保持周长测度、$C$ 与奇点集；若 0 奇异，整条竖直轴奇异，与 $\operatorname{Sing}C\subset\{0\}$ 矛盾，故原点正则。锥在顶点光滑则等于其切超平面：向原点膨胀时锥不动，光滑局部图收敛到切平面。两分支都平坦，且权重 $\cH^7\llcorner C$，多重一。

这一节我反推出的教训是：经典有向锥论证（Schnuerer 的记录被引用，`02-monotone.tex:431-432`）默认法向分量正；$f$ 恒零的退化在极小曲面文献里可能被一句话带过，这里因为源头是分布不等式 $\partial_8\mathbf1_E\ge0$，退化分支是活的，必须用平移不变性对拓扑奇点集的作用闭合。

## §7 回到方程：单位密度、Wang 定理与剖面回收

平坦支撑本身不决定弥散能量密度；把 $M_\infty=1$ 钉死靠的是 §5 的测度等式：$P(E;B_r)=\omega_7r^7M_\infty$ 对超平面给出 $M_\infty=1$（`02-monotone.tex:506-514`，论文明说"精确测度收敛在此是必需的；仅有平坦支撑定不出弥散能量密度"）。

随后一步是外包的：Wang 的近单位密度定理（`02-monotone.tex:518-527`，引 Wang 2017 Theorem 11.1）称，任何维 $N$ 中非常数有界整 Allen--Cahn 解，满足 Modica 界且 $\lim_{R\to\infty}\mathcal E(u;B_R)/(s_0\omega_{N-1}R^{N-1})\le1+\delta_N$，则一维。我们的 $u$ 三项都齐（值域、Modica、§5 的 $M_\infty=1$），故 $u(x)=h(e\cdot x)$。

最后一小段论文选择直接重做而不外包：$u_8=e_8h'>0$ 给 $e_8\ne0$，调向使 $e_8>0$、$h'>0$。两端极限 $a_\pm\in[-1,1]$ 不同；平移紧致性对方程 $h''=h^3-h$ 说明 $a_\pm^3-a_\pm=0$ 且 $h'\to0$。首次积分 $\frac12h'^2-W(h)=\text{const}$ 两端取极限得 $W(a_-)=W(a_+)$；驻定根 $\{-1,0,1\}$ 中互异且等势的数对只剩 $(-1,1)$（$W(\pm1)=0$，$W(0)=\frac14$）。于是 $h'=\frac{1-h^2}{\sqrt2}$，$h(s)=\tanh\frac{s-c}{\sqrt2}$。定理一证毕。反向验证一行也给了：此式值域严格在 $(-1,1)$ 内、$g''=g^3-g$、$u_8=e_8g'>0$。

至此 Part I 的债务全部结清。我停下来核对最初的两笔债：第一笔（无端点假设的最小化）由地面态+降维稳定+标定+滑动清偿；第二笔（能量与周长的逐字等式）由分层平均的重建序列清偿。两条债的清偿都不吃维度，维度只在 §6 的奇异射线排除与附录的九维对照里进场，这一点决定了 Part I 几乎可以逐字搬到任何维，真正的高维障碍全在定理二。这个观察直接把我引向 Part II--IV。

## §8 解析主线的入场：密度记号与七维约化

Part II 开场把记号钉死（`00-introduction.tex:186-192`、`02-finite-density.tex:6-15`）：$\omega_m$ 是 $\R^m$ 单位球体积，$n=m+1$，
$M_r(y)=\frac1{s_0\omega_mr^m}\int_{B_r(y)}e(v)$，$M_\infty=\sup_{r>0}M_r(0)$。单个平面过渡的极限密度是 1。解析部分的第一块定理是有限密度刚性（定理三，$4\le n\le7$）。七维稳定定理剩下的任务被约化成一句话：证明 $M_\infty$ 有限。约化后的图景（`00-introduction.tex:209-219`）我按原文的顺序复述，因为它就是 Part III--IV 的目录：受罚 reach 同时度量零叶的弯曲与它到其他叶的距离；有限密度定理在几乎这个尺度上供给局部正则性；reach 几何与稳定性结合，控制四阶曲率矩与平方缺陷，从而控制零集难以被平面逼近的区域；再把 reach 不等式与用叶片上同一径向振幅构造的环境稳定测试比较；连接相邻振幅的代价足够小，留下严格正裕度，与无界密度强行要求的面积量矛盾。

策略节（`01-strategy.tex`）是给分析读者的地图，它开头声明可跳过、定义在 `sec:diffuse` 重起。我按"写作者为什么单开这一节"来读：正文四个 Part 的记号复用极重，作者把两条互相独立的入口（几何读者从 Part I、分析读者从 §8）在引言里明说（`00-introduction.tex:176-181`），策略节再把"哪些部件在哪里被消费"排成时间序。这种结构通常是被写作过程中的依赖爆炸逼出来的，我把它当作本论文可移植的工程经验存档。

## §9 弥散变量与精确稳定恒等式

`01-diffuse.tex` 的目标一句话：用偏离平面过渡的缺陷控制零层的平均曲率，且系数要锐到够有限密度刚性使用。全节三步：精确稳定恒等式、除以小缺陷后仍一致的估计、规范化极限里正函数的分类。

变量选择是本节第一个决策点。$|v|<1$ 下设
$q=1-v^2$，$U=g^{-1}(v)$，$p=\nabla U$，$T=\nabla^2U$，$D=1-|p|^2$（`01-diffuse.tex:51-54`）。Modica 界在此读作 $U$ 是 1-Lipschitz，故 $0\le D\le1$；平面过渡等价于 $U$ 仿射、$D\equiv0$。直接代入得三条方程（`01-diffuse.tex:56-62`）：
$\Delta U=-\sqrt2\,vD$；$\mathcal LD=2|T|^2$，$\mathcal L=-\Delta+2\sqrt2\,vp\cdot\nabla+2q|p|^2$；$(-\Delta+3v^2-1)q=-q^2D$。能量密度被改写为 $e(v)=\frac14q^2(2-D)$，势差 $W(v)-\frac12|\nabla v|^2=\frac14q^2D$（`01-diffuse.tex:63-67`），于是单调性公式里两个非负项在弥散变量下各有名字。

我反推这个变量替换的动机：$v$ 的方程非线性在势上，平面解 $g$ 是扭曲的；用 $g^{-1}$ 拉直后，"偏离平面"这件事的唯一残量就是 $D$，且它是非负的、被 $\mathcal L$ 控制成子解。更重要的是稳定测试的形态：取 $\zeta=q\eta$ 代入 $Q_v$，交叉项与 $|\nabla q|^2$ 项和势项合并成 $\int q\eta^2(-\Delta+3v^2-1)q$，用 $q$ 的方程得精确恒等式
$0\le Q_v(q\eta)=\int_{\R^n}(q^2|\nabla\eta|^2-q^3D\eta^2)\dd x$（`01-diffuse.tex:88-93`）。右边第二项以 $q^3D$ 探测缺陷，在零集附近 $q\approx1$ 有效，深入相区 $q$ 指数衰减使积分天然收敛。整个 Part II--IV 的稳定测试都是这一恒等式的变奏；论文注明该表述与测试也出现在 LLWWW 的引理 2.1（`01-diffuse.tex:95-96`），本文在自己的维度独立推导。

两个补充观察也留在本节：$\mathcal L$ 的零阶系数非负，故 $D$ 在一点为零就恒为零（强极小原理），随后 $T\equiv0$、$U$ 仿射，平面解从方程里自己掉出来。这条等号情形后面在 §19 收尾时又被消费一次。常数解 $v=0$ 不稳定：$B_R$ 内为 1、$B_{2R}$ 外为 0、梯度 $O(R^{-1})$ 的截断给出大 $R$ 时 $Q_0<0$（`01-diffuse.tex:97-99`）。$U$ 的各阶导数一致界有个小技术：不能假设 $v$ 离井一致近，作者在每个球上减去 $U$ 的中心值，用 $|p|\le1$ 得一致有界，再对 $\Delta U=-\sqrt2\,g(U)(1-|\nabla U|^2)$ 走内 Schauder 归纳（`01-diffuse.tex:68-76`），$g$ 的一切平移导数一致有界是关键。

## §10 标度族与两个指数率

要比较相距远的两个零层，需要除以 $D$ 不丢一致性的估计。引理（`lem:diffuse-local`，`01-diffuse.tex:109-134`）给三件套：
$|T(x)|^2\le CD(x)$；$|\nabla D(x)|\le CD(x)$；$D(y)\le C_\gamma e^{(2\sqrt2+\gamma)|y-z|}D(z)$。外加规范化界 $\|D/D(z)\|_{C^k(B_R(z))}+\|T/\sqrt{D(z)}\|_{C^k(B_R(z))}\le C_{R,k}$ 与增长显式版 $|\nabla^kD|\le C_{k,\gamma}e^{\kappa|x-z|}D(z)$、$|\nabla^kT|\le C_{k,\gamma}e^{\kappa|x-z|/2}\sqrt{D(z)}$，$\kappa=2\sqrt2+\gamma$。

证明链我拆成四段。定球控制：对非负子解 $\mathcal LD\ge0$ 在 $B_{20}(z)$ 用弱 Harnack，常数主部加有界低阶项允许指数大于一，Hölder 给 $\int_{B_4(z)}D\le CD(z)$；带截断测试 $\mathcal LD=2|T|^2$ 得 $\int_{B_3}|T|^2\le CD(z)$。弯曲控制：$b=2\sqrt2vp$，对 $U$ 求二阶、三阶、四阶导并代 $D_i=-2(Tp)_i$、$D_{ij}=-2p_k\partial_kT_{ij}-2(T^2)_{ij}$，得显式系统
$(\Delta-b\cdot\nabla)T_{ij}=-qDT_{ij}+\sqrt2vqDp_ip_j-q(p_iD_j+p_jD_i)+2\sqrt2v(T^2)_{ij}$（`01-diffuse.tex:163-166`），右端范数被 $C(D+|T|)$ 控制，于是 $F_0=D^2+|T|^2$ 满足 $(-\Delta+b\cdot\nabla)F_0\le CF_0$，局部均值估计加 $\int|T|^2$ 界加 $D^2\le D$ 收成逐点 $|T|^2\le CD$。$|\nabla D|\le CD$ 则把 $D$ 方程当有界势的齐次线性方程，Harnack 给局部可比性，再对内 $W^{2,r}$（$r>n$）用 $\mathcal LD$ 的源 $2|T|^2$。

指数率 $2\sqrt2$ 的出处我要单独记下，因为它在全文以三种面孔出现。对 $r=|x-y|$，$\mathcal L(e^{-\kappa r})\le e^{-\kappa r}[-\kappa^2+\frac{(n-1)\kappa}r+2\sqrt2\kappa|v|+2(1-v^2)]$；$|v|\in[0,1]$ 时后两项最大 $2\sqrt2\kappa<\kappa^2$，故 $r\ge R_\gamma$ 时为负。Harnack 链固定次数给 $a_\gamma D(y)e^{-\kappa r}\le D(x)$（在 $r=R_\gamma$），减去 $\epsilon$ 保持子解（位势非负），环带比较、$\epsilon\downarrow0$，得全局双边指数可比（`01-diffuse.tex:184-201`）。面孔一：缺陷 $D$ 的传播率 $2\sqrt2+\gamma$。面孔二：相内清除率。引理（`lem:diffuse-phase`，`01-diffuse.tex:242-248`）证零集非空并给 $q(x)\le C_\gamma e^{-(\sqrt2-\gamma)\dist(x,\Sigma)}$：非空用大球上一侧特征函数清除，$\lambda_1(B_R)=R^{-2}\lambda_1(B_1)$，取 $c\phi_R$ 升至与 $v$ 接触，内点接触与边界接触各被严格不等式与 $v>0$ 排除；衰速可任意接近 $\sqrt2$，靠 $w=1-v$ 满足 $\Delta w=(2-3w+w^2)w$，远离相边界处 $\Delta w\ge k^2w$（$k=\sqrt2-\gamma/2$），球面均值障碍 $A_k(r)=\frac1{|\mathbb S^{n-1}|}\int_{\mathbb S^{n-1}}e^{kr\theta_1}\dd\theta\ge c_kr^{-(n-1)/2}e^{kr}$（角半径 $r^{-1/2}$ 的帽）收尾。$\sqrt2$ 是井边线性化的谱率，$2\sqrt2$ 是 $G\sim e^{-\sqrt2|s|}$ 平方后的率，两者在 §12 的端点缺陷估计里相乘出 2。面孔三：§14 里 $E=e^{-\kappa d}$ 取 $\kappa=\sqrt2/G_1$，那是把率适配到 reach 惩罚平台后的版本。

还有一条边角我记在 §10 末尾：若某点的全部零都躺在它的切平面里，相衰减给能量 $\le Ce^{-c\dist(x,T_z\Sigma)}$，密度有限（`03-reach.tex:152-154`）。所以"无界密度"的情形自动排除共面退化，reach 的每个竞争对手都真实携带角度信息。

## §11 极限极值与锐系数 $\frac1{2\sqrt2}$

本节是全文我认为最"意外"的一段：平均曲率的锐系数问题被归约成一个一维 Schrödinger 算子正极值函数的分类，再归约到一条凸不等式。

第一步，约定与吹放。正则零点上 $\nu=p/|p|$，$A=\dd\nu|_{T\Sigma}$，$H=\tr A$。由 $\Delta U=0$（在零上）、$\Delta U=T(\nu,\nu)+|p|H$、$\partial_\nu D=-2|p|T(\nu,\nu)$ 得
$H=\frac{\partial_\nu D}{2|p|^2}$（`01-diffuse.tex:305-311`）。取 $D(z_j)\to0$ 的解列，平移旋转后吹放：$U_j\to s$，$D_j/\epsilon_j\to\mathcal D>0$，$T_j/\sqrt{\epsilon_j}\to\mathcal T$，其中 $\mathcal T$ 只有切向分量、与 $s$ 无关、无迹、对 $x'$ 调和；$F=G(s)\mathcal D$ 满足
$\mathcal L_0F=2G(s)|\mathcal T(x')|^2$，$\mathcal L_0=-\Delta+2-G(s)$；且 $H_j(0)/\epsilon_j\to\frac12F_s(0)$（`01-diffuse.tex:315-337`）。共轭用 $G'/G=-\sqrt2g$、$G''=(3g^2-1)G$。

第二步，正分解。源 $2G|\mathcal T|^2$ 对 $s$ 偶。引理（`lem:diffuse-positive`，`01-diffuse.tex:374-408`）：$F\ge0$、$\mathcal L_0F=S\ge0$ 偶，则 $F=E+h$，$E,h\ge0$，$\mathcal L_0E=S$，$\mathcal L_0h=0$，$E$ 偶，故 $E_s(x',0)=0$、$\nabla'E_s(x',0)=0$。偶 Dirichlet 解在增大球列上单调收敛得到 $E$；$h$ 的部分需要分类锥 $\mathcal K=\{h\ge0:\mathcal L_0h=0,\ h(0)=1\}$ 的极值点。手法我逐层剥：水平平移经 Harnack 链给出 $h(\cdot+t)\le C_th$；极值性迫使每个平移成比例；比例因子是 $\R^{n-1}$ 的连续乘性特征，必为 $e^{b\cdot t}$；于是 $h(x',s)=e^{b\cdot x'}f(s/\sqrt2)$，$f$ 解 Pöschl--Teller 型方程 $-f''-2\sech^2y\,f=-(4-2|b|^2)f$。地面态恒等式用 $\sech y$ 的紧支撑逼近代入，得 $4-2|b|^2\ge1$，故 $a=\sqrt{4-2|b|^2}\in[1,2]$。显式基 $f_a^\pm(y)=e^{\pm ay}(a\mp\tanh y)$ 由两端渐近行为定系数非负，极值性排除双系数同正；$a=1$ 时降序得基 $\sech y$ 与 $\sech y\int_0^y\cosh^2$，后者两端反号占优，正解只剩 $\sech y$ 的倍数。

第三步，锐常数是算出来的。对 $f_a^+$（未归一）：质量 $\frac1\sigma\int_\R G(s)^2f_a^+(s/\sqrt2)\dd s=\frac{3a}4M(a)$，$M(a)=\frac34\int_\R e^{ay}\sech^4y\dd y$；导数 $|\frac{\dd}{\dd s}f_a^+(s/\sqrt2)|_{s=0}|=\frac{a^2-1}{\sqrt2}$；比值（半个导数比质量）为 $\frac{\sqrt2}3\frac{a-1/a}{M(a)}$（`01-diffuse.tex:480-493`）。$M$ 凸。在 $a=2$ 处不用特殊函数：换元 $t=\frac{1+\tanh y}2$，$M(2)=6\int_0^1t^2\dd t=2$，$M'(2)=3\int_0^1t^2\log\frac t{1-t}\dd t=\frac32$（两个对数积分分别 $-\frac19$ 与 $-\frac{11}{18}$，差为 $\frac12$）。凸切线不等式给 $M(a)\ge\frac32a-1\ge\frac43(a-1/a)$，第二个不等式的差是 $\frac{(a-2)(a-4)}{6a}\ge0$。比值 $\le\frac1{2\sqrt2}$，端点 $a=2$ 取到。

这里我要记下读时的一个体会：锐性来源不是 PDE，是一维显式计算的凸性。$1/(2\sqrt2)\approx0.3536$。它后面有两道闸门：有限窗口需要严格放松（下一步），以及 §12 里 $\sqrt2$ 与 $\frac{3c_*}{4}(m-2)$ 的对撞要求 $c_*<\frac{\sqrt2}3\approx0.4714$。窗口 $(\frac1{2\sqrt2},\frac{\sqrt2}3)$ 非空，这条非空性恰好支撑到 $m=6$ 为止，维度余量只有 $0.118$。

第四步，Krein--Milman 与有限窗。全长质量对局部光滑拓扑不连续，作者不直接引用全长不等式，先固定一个有限窗：归一化族 $f_a^\pm/a$（含 $a=1$）紧，且 $\sech^4y\cdot f_a^\pm/a\le Ce^{-2|y|}$，全长加权质量有严格正的一致下界。于是对每个 $c>\frac1{2\sqrt2}$ 存在单一 $P=P(c)$，使 $\pm\frac12h_s(0)\le\frac c\sigma\int_{-P}^PG(s)^2h(0,s)\dd s$ 对一切极值点成立；两边是局部光滑拓扑下的连续线性泛函，Krein--Milman 把不等式从极值点扩张到闭凸包，即整个 $\mathcal K$，再齐次扩到一切非负齐次解（`01-diffuse.tex:510-534`）。注记（`rem:diffuse-truncation`，`01-diffuse.tex:537-543`）声明严格放松不可省：$a=2$、$b=0$ 时全长比值恰为 $\frac1{2\sqrt2}$，任何有限截断严格减小正的分母，靠局部收敛保端点常数的想法定价失败。这句注记在我读来就是作者自报的一条死路：先试了全长加局部收敛，被截断的单调性坑回来。

## §12 法向平均 $I_P$ 与平均曲率控制

把极限不等式搬回原解。正则零点 $z$、有限 $P$，定义法向平均
$I_P(z)=\frac1\sigma\int_{-P}^Pq(z+t\nu(z))^3D(z+t\nu(z))\dd t$（`01-diffuse.tex:549-552`），归一化取 $\sigma^{-1}$ 是为了极限质量恰为 $\sigma^{-1}\int G^2F$。引理（`lem:diffuse-mean`，`01-diffuse.tex:559-599`）：每个 $c>\frac1{2\sqrt2}$ 有 $P=P(c)$ 与 $\delta=\delta(n,c)\in(0,\frac12]$，使 $0<D(z)<\delta$ 时 $|H(z)|\le\frac c\sigma\int_{-P}^Pq^3D$；点 $z$ 正则、法向由 $p$ 定向；更大区间自动兼容（被积非负）。可特设 $\frac1{2\sqrt2}<c_*<\frac{\sqrt2}3$ 得 $P_*,\delta_*$，供有限密度论证消费（`01-diffuse.tex:570-574`）。



## §13 有限密度反证架构：临界整数密度与对数间隙对撞

定理三（$4\le n\le7$）的证明在 `02-finite-density.tex`，开场把作战计划写全（`02-finite-density.tex:23-31`）：假设定理失败，文献约化给出一个临界解，零集在稀疏集外由 $K\ge2$ 个整数层组成；对最近的层间隙做两种估计，Green 测试用平均曲率控制间隙均值，§12 的平均曲率界加 Hardy 测试控制这个曲率代价；相邻过渡取向相反迫使几乎全部间隙呈对数大；先要一个粗的平方根间隙测试，之后更锐的近线性测试才能在不丢最终系数的前提下让间隙拉普拉斯的梯度误差可吸收。

我逐步核读。第一层是约化的两条正则性输入（`02-finite-density.tex:55-84`），论文把两者并列陈述的理由很实际：临界解在定理尚未让"每个有限阈值都亚临界"成立之前，就要先用第二条。sheeting 假设是对 $B_r\cap\{|v|\le0.9\}$ 要求 $|\nabla v|\ge C^{-1}$ 与 $\mathcal A_v\le C/r$，其中 $\mathcal A_v=|\nabla(\nabla v/|\nabla v|)|$ 是完整环境导数，论文明说单给切向曲率界不构成该假设。FSS 的 Theorem 3.2 在 $M_r\le K_f+\delta$、$r^{-1}\le\delta$、$K_f$ 亚临界时给出它；独立的 good-ball 结果 Theorem 3.4 只假设 $M_r\le C_0$、$r\ge r_0$ 加局部广义曲率质量 $\int_{B_1(x)}\mathcal A_v^2|\nabla v|^2<\delta_{\rm bad}$，也给 sheeting。曲率密度几乎处处写成 $\mathcal A_v^2|\nabla v|^2=|\nabla^2v|^2-|\nabla|\nabla v||^2$。

第二层，sheeting 供给什么（`02-finite-density.tex:85-112`）：图的分解与 Wang--Wei 过渡层估计（后者容许 $n\le10$），先把规范化转过去：$\widehat W=W/2$、$\widehat v(y)=v(y/\sqrt2)$，则 $\widehat W''(\pm1)=1$，稳定在变量替换下保持，长度乘 $\sqrt2$；这固定换算只改常数。薄板夹逼下（FSS 的 Theorem 4.8 与 Lemmas 4.9--4.10）给任意小斜率、密度与整数图数的比较、每个固定窗内逼近平面 heteroclinic，内椭圆估计升级到光滑局部收敛。

第三层，临界解引理（`lem:finite-critical`，`02-finite-density.tex:115-130`）：若定理在固定维 $4\le n\le7$ 失败，存在非平面整稳定解，整数密度 $M_\infty=K\ge2$，配非空闭稀疏集 $Z$；$s(x)=\dist(x,Z)$ 时，对 $y\in Z$ 一致地 $M_r(y)\to K$、$r^{2-m}|B_1(Z)\cap B_r(y)|\to0$，且 $B_1(Z)$ 换成任意固定厚邻域 $B_h(Z)$ 结论不变；$\Sigma$ 中 $s$ 大的点附近有一致模与常数 $c,C$ 控制的叶结构。亚临界数的定义（`02-finite-density.tex:48-53`）顺带把"有界整解值域自动含于 $[-1,1]$"也处理了：对上确确与下确确取平移极限代入方程。

第四层，间隙的双侧估计。我读到的完成段（`02-finite-density.tex:730-849`）显示机器全速运转的样子。上侧：取 $\psi(l)=l+\log l$、$w=\min\{T_0,\psi(l)\}$，$l\to\infty$ 使 $\psi'\le1+\delta$，且 $-\psi''/\psi'=1/(l(l+1))$、$l(l+1)/s\to0$，Green 引理的系数 $L\le1+\delta$ 存活。均值曲率经 §12 换 $|H|\le\frac{c_*}{\sigma}I_P$，注意来源项贡献一次曲率积分、目标脚点经多重性引理至多两次，管雅可比与径向权重改相对 $1+C\delta$；收尘为
$\limsup_{R}\frac L{\log R}\int_{\Sigma_S\cap\{R_0<r<2R\}}r^{2-m}(|H(z)|+|H(\pi(z))|)\dd S\le(1+C\delta)\,3c_*Km\omega_m\frac{(m-2)^2}4$（`02-finite-density.tex:776-781`）。下侧先证端点缺陷：两端法向取向相反、$D=o(1)$ 给 $|p(z)-p(\pi(z))|\ge c>0$；沿弦两半用率 $2\sqrt2+2\gamma$ 的指数可比，$|\nabla p|\le C\sqrt D$ 从端点积分到中点，平方得
$D(z)+D(\pi(z))\ge c_\gamma e^{-(\sqrt2+\gamma)l(z)}$（`02-finite-density.tex:789-806`）。取 $\gamma$ 使 $\beta=(\sqrt2+\gamma)(\sqrt2-\delta)<2$，例外集 $E_R=\{R/2<r<2R,\ l<T_0\}$ 的面积被 $CR^\beta$ 乘缺陷积分再 $CR^{m-2+\beta}=o(R^m)$ 压死；支撑余下部分 $l\ge T_0$，$w=T_0$，得
$\liminf\frac{R^{-m}}{\log R}\int_\Sigma w\chi F(r/R)\dd S\ge(\sqrt2-\delta)(Km\omega_m(m-2)-\delta)$。对撞：先固定 $\delta$，再固定 $P,S$（均值曲率、管、凹性、质量四件），再固定 $R_0$，$R\to\infty$，然后 $R_0\to\infty$ 去掉 $(\sqrt2-\delta)\eta(R_0)$，$\delta\to0$，消去正因子 $Km\omega_m(m-2)$，得
$\sqrt2\le\frac{3c_*}4(m-2)$，对 $3\le m\le6$ 不可能，右端至多 $3c_*<\sqrt2$。论文明写：端点 $m=6$ 时 §12 的严格不等号 essential。我对此的复盘：$\frac{3c_*}4\cdot4=3c_*$，$c_*$ 的可取区间 $(\frac1{2\sqrt2},\frac{\sqrt2}3)$ 上半恰好让 $3c_*<\sqrt2$，两个section在 $\sqrt2/3$ 处咬合，§11 的窗口非空性原来是为这一颗牙留的。

推论（`cor:finite-subcritical`，`02-finite-density.tex:858-877`）：分类完成后每个有限阈值都亚临界，于是任一整稳定解只要在一个大半径球上有 $M_r(z)\le K_f$（不需要全局密度界！），就在 $B_{cr}(z)\cap\{|v|\le0.9\}$ 上有 $|\nabla v|\ge C^{-1}$、$|\nabla(\nabla v/|\nabla v|)|\le C/r$，薄板内还有有序图、$\|\nabla^2f_i\|_\infty+r^{1/2}[\nabla^2f_i]_{C^{1/2}}\le C'/r$、$|H_i|\le C'_\iota r^{-2+\iota}$。这条"单球密度界即正则"正是 Part III 在 reach 尺度找到的窗口要消费的接口，我把它叫全文最容易被读者漏掉、却牵动最多下游的一行。

## §14 受罚 reach：几何定义与密度窗口

Part III 开场把战场收缩到唯一剩余情形：$v:\R^7\to(-1,1)$ 整稳定、$D>0$、能量密度无界，界面维 $m=6$（`03-reach.tex:3-5`）。通篇记分板是 $K(R)=1+\sup_{x\in\R^7}M_R(x)$，单调性与被积一致界给 $1\le K(R)\le1+CR$、$K(R)\to\infty$（`03-reach.tex:32-40`）。所有常数对解与平移中心一致，惩罚参数依赖以 $C_\Gamma$ 标注，$K$ 的依赖一律显式。

reach 的裸对象是弦比：不同零点 $z,y$（$z$ 正则），$\ell=|y-z|$，$e=(y-z)/\ell$，$s=|\nu(z)\cdot e|$；$s>0$ 时 $\ell/s$ 是过 $y$ 的法向切球直径的两倍，$y$ 沿主方向趋 $z$ 时它趋两倍倒主曲率（`03-reach.tex:44-51`，`03-reach.tex:134-146` 的引理与 `01-strategy.tex:104-112` 都陈述了这两重身份）。对弦取下确界就同时量弯曲与逼近。可 $\Gamma_0(s)=1/s$ 在近法向（$s=1$）处导数行为坏，作者做了一个外科手术：惩罚函数 $\Gamma$ 在 $s<1-\delta_1$ 保持 $1/s$，在 $s\ge1-\delta_2$ 常值 $G_1$，中间光滑过渡，性质（`03-reach.tex:91-120`）：
$s^{-1}\le\Gamma(s)\le(1+C\delta_1)s^{-1}$，$1\le G_1\le\Gamma(s)$，$-(1-\delta_1)^{-2}\le\Gamma'(s)\le0$，$0\le(1-s)\Gamma''(s)\le\eps_1$；构造用单调截断 $\chi$ 与双层小参数：先压 $\delta_1$ 再抬 $L$（$\delta_2=\delta_1e^{-L}$），$G_1-1$ 与 $\eps_1$ 均可任意小，一切选择在任何大 reach 或穷竭极限之前完成。平台的作用我在策略节找到设计意图："平台的常值段让第二接触点法用于弦，这正是符号转移所许"（`01-strategy.tex:84-90` 与 `03-reach.tex:82-89` 两处呼应）；过渡区带权二阶导小，微分代价任意小。

定义 $d(z)=\inf_{y\in\Sigma\setminus\{z\}}\ell\Gamma(s)$（`03-reach.tex:122-127`），$s=0$ 的竞争者记 $+\infty$；active contact 指达到下确界的竞争点或对角极限（第二点贴向基点）。初等弦界引理（`lem:reach-small-defect`，`03-reach.tex:134-146`）：$d$ 在正则部分有限且正；$d\max_i|\lambda_i|\le2$；$|(y-z)\cdot\nu(z)|\le C_\Gamma|y-z|^2/d(z)$；每 $J<\infty$ 有一致 $\delta(J)>0$ 使 $D(z)<\delta(J)$ 推 $d(z)>J$；每个正则基点两侧有半径 $c_\Gamma d(z)$ 的切零自由球。证明里我注意到"对角极限也合法"：短弦时第二点在同一局部图上，$\nu(z)\cdot(y-z)$ 与 $|y-z|^2$ 同二阶小，消去 $t^2$ 后分支光滑延拓过 $t=0$（详细论证在 `03-reach.tex:866-887`，属 §15）。

无全局密度界时唯一的局部正则来源是：先在近似 reach 尺度找到一个有界密度窗（`lem:reach-density-window`，`03-reach.tex:199-201`，用延迟单调性论证），推论（§13 的单球版）随即在其中隔出单叶；此外法向算子有正半轴障碍（`lem:reach-half-line-barrier`，`03-reach.tex:295`），隔离叶上经平移模投影改进均曲率导数（`lem:reach-isolation`，`03-reach.tex:342`），一侧切相球在远接触点控制带号均曲率（`lem:reach-phase-ball`，`03-reach.tex:634`）。这四件事我仅从结构图与命题标题段读到，正文细证未取，属于 [推测] 范围：我按策略节的自述把它们排成 reach 不等式的两个局部输入（叶上改进加切球控制）。

## §15 弱 reach 不等式与脚点电荷转移

核心命题（`prop:reach-calculus`，`03-reach.tex:814-851`）。给定 $\eta_0>0$，惩罚参数按序选好后，对充分大 $d$：$d$ 在 $\Sigma_{\rm reg}$ 上局部半凹，分布面拉普拉斯的奇异部分非正；几乎处处
$|\nabla_\Sigma d|\le C_\Gamma\exp\{C_\Gamma\sqrt{\log(K(d)+1)}\}$；
非平台或对角接触处
$\Delta_\Sigma d\le(1+\eta_0+C_\Gamma d^{-\gamma})a^2d+B\frac{|\nabla_\Sigma d|^2}d$，$B\le1+C_\Gamma d^{-\gamma}$，$ad$ 小时可改用 $B\le\eta_0+C_\Gamma ad+C_\Gamma d^{-\gamma}$ 且此时 $|\nabla_\Sigma d|\ge c_\Gamma>0$；
平台接触（$s\ge1-\delta_2$）处
$\Delta_\Sigma d\le G_1(|H(z)|+H_{N_y}(y)_+)+\eta_0\frac{|\nabla_\Sigma d|^2}d$，$N_y=-e$；
对这类接触的任意可测选择，正脚点电荷可以以多重性至多一转移到 $y$，面积因子
$J_{y\to z}=\frac{|\det(\Id+\ell A_{N_y}(y))|}s\le C_\Gamma$，且 $d(y)\le d(z)=G_1\ell$，$a(y)+D(y)\le C_\Gamma/d(z)$；$a(y)\ell$ 小固定常数内时有精化 $J_{y\to z}\le1+C\delta_2+Ca(y)\ell$。常数与大 reach 阈值先于一切缺陷阈值、领口尺度、穷竭半径固定。

证明前半建立弱解释，手法是半凹性的参数族论证：紧坐标片上 $0<c\le d\le C$（局部图曲率给下界，一个固定的正角离对角竞争者给上界）；值 $\le2C$ 的竞争弦长有界；长 $\ge\varepsilon$ 的弦有角下界 $s\ge\varepsilon/(2C)$，固定第二脚时是基点的光滑分支、一致 $C^2$；短弦走同一局部图的对角延拓；每个分支减去固定二次函数变凹，下确界保凹，半凹成。Alexandrov 二阶展开点处，光滑主动上分支共享一阶导、其上界控制绝对连续拉普拉斯；奇异部分由半凹性是非正测度。后半（未整读）从"[未取证的细部，推测按策略节自述：切相球的带号控制加平台法向性给转移符号]"的框架走，我核对到命题陈述级为止；证明 903 行起的"每个第二脚处的切相球"段确认零自由区 $\{z+\ell'e':N\cdot e'>0,\ \ell'\Gamma(N\cdot e')<d\}$ 的边界在原点附近与球面 $|x|^2=x_n$ 重合（那里 $\Gamma=1/s$），其余部分是光滑正径向图 $1/\Gamma$，有固定正内滚球，这正是脚点曲率控制的来源。

这一节的设计感最强的地方：$B\le1$ 那个"1"。半凹、奇异部分非正、梯度方项系数 $\le1$，三条合起来让 §18 的 Young 吸收刚好卡在临界；策略节说 reach 与稳定性结合"留住严格正裕度"，裕度就从这些 $\le1$、$\le\eta_0$、$\le C_\Gamma$ 的钉死系数里出。

## §16 强化面稳定性：把弥散质量搬到叶上

`04-interface.tex` 的任务：环境测试推向叶面，并把 §12 的法向平均 $I_P$ 原封搬进面不等式。命题（`prop:interface-strengthened-stability`，`04-interface.tex:240-342`）：每 $\eps>0$ 先按 sharp means 引理取充分大 $P$，存在 $\delta>0$，使 $\{D<\delta\}$ 上一切紧支 Lipschitz $\psi$ 满足
$(1-\eps)\int_\Sigma\frac{a^2+I_P}2\psi^2\dd S\le\int_\Sigma|\nabla_\Sigma\psi|^2\dd S$。 lifted 计算里梯度系数可任意接近 $\sigma$，负系数任意接近 $\frac\sigma2(a^2+I_P)$，同一批选择同时做到。

证明三条流水。其一，度量和雅可比：提升 $\beta$ 的拉回切度量与面度量差 $O(\alpha)$；$|\nabla\beta|\le C_\alpha(1+|s|)$；含 $\beta$ 导数的项 Young 之后被 $C_\alpha e^{-c_\alpha/a}\psi^2$ 吃掉，而 $a^2\le CD$ 使它一致 $o(D)$。其二，曲率侧：$J$ 的初等对称展开加偶性给 $-\int\beta^2J_sGG'\dd s=\frac\sigma2(H^2-a^2)+o(D)$，常数项 $H$ 积分為零、线性项 $(H^2-a^2)s$、$-\int sGG'=\frac\sigma2$、$sA$ 的二阶以上要么奇要么 $Ca^3=o(D)$；$H^2=o(D)$ 由 cap 误差控制。其三，位势增益，我认为这是全命题的钱袋：$U(z)=0$、$|\nabla U|\le1$ 给 $|U(z+s\nu)|\le|s|$、$v(z+s\nu)^2\le g(s)^2$；两侧法向射线 $U_\pm(r)=\pm U(z\pm r\nu)$ 满足 $r-U_\pm(r)\ge\frac12\int_0^rD(z\pm t\nu)\dd t$（$U_\pm'\le\sqrt{1-D}\le1-D/2$）；固定段上 $|p(z+s\nu)-\nu|+|U(z+s\nu)-s|\le C_PD(z)$， Gronwall 来自 $|T\nu|\le C_PD(z)+C_P\sqrt{D(z)}|p-\nu|$ 与 $Tp=-\nabla D/2$。规范化极限里位势增益 $3(g^2-v^2)G^2$ 至少 $-\frac12(G^3)'(s)\int_0^s\mathcal D(0,t)\dd t$，两半轴非负，Tonelli 收总质量 $\frac12\int G^3\mathcal D\dd s$。有限窗的显式排序：先固定 $P$、置 $h_P(s)=\int_0^s\mathbf1_{|t|\le P}\mathcal D$，$Q\ge P$ 分部积分恰得 $\frac12\int_{-P}^PG^3\mathcal D$ 减损失 $\frac{G(Q)^3}2\int_{-P}^P\mathcal D$；局部 Harnack 一致界住后项，$Q$ 随 $P$ 取大、阈值随 $Q$ 缩小保证 $\beta=1$。最终 $\int3(g^2-v(\Phi)^2)G^2\beta^2J\dd s\ge(1-\eta)\frac\sigma2I_P$（`04-interface.tex:329-333`），用 $I_P\ge cD$ 吸收 $o(D)$ 项。顺序纪律：$P$、更大的抽取区间 $Q$、缺陷阈值，依次固定，后期任何面领口或面测试振幅都不许插手。

对照策略节里较弱的版本（`01-strategy.tex:54-68`）："当相互作用主导曲率时，该不等式只留住 $I_P$ 约一半的质量"；本节命题把 $(a^2+I_P)/2$ 的整体系数推到 $1-\eps$。我读到的差异来源：策略版是逐叶提升，多叶叠合处取平方和再开根，方差项非负但分配损失；本节的加强靠位势增益的符号性把 $I_P$ 全额请回不等式左端。这为 §18 的"留住近九成"埋了第一级台阶。

## §17 四阶矩增长：坏集记账与 $R^4$ 的净赚

`05-growth.tex` 把 §14--§16 的局部几何积分成全局预算。设定照旧：$v:\R^7$ 整稳定、$D>0$、密度无界、$m=6$。新记号三个（`05-growth.tex:11-14`）：
$K(R)=1+\sup_xM_R(x)$，$\kappa=\frac{\sqrt2}{G_1}$，$E=e^{-\kappa d}$。目标标度 $K(R)R^{m-4}$：相对加权面积标度 $K(R)R^m$ 净赚四个 $R$ 的幂，即使 $K(R)$ 增长任意慢也够 §18 付粗糙区域与曲率误差的账。分块记分：$X=\{z\in\Sigma:D(z)\ge\delta\}$（坏零点），$\Sigma_g=\Sigma\setminus X$，$\mathcal X\subset X$ 任一极大单位分隔网，权重 $\chi_{R,x_c}(x)=\exp(-\frac{\sqrt{1+|x-x_c|^2}}R)$，$N_R=\sum_{x\in\mathcal X}\chi(x)^2$，$S_0=\frac{a^2+I_P}2$。奇异零点处 $D=1$，故必属 $X$；$N_R$ 用网点对坏集记账，避开对坏集要求光滑性。

命题（`prop:growth-fourth-order`，`05-growth.tex:47-65`）：惩罚按 §14 规格取得足够近，$\eta_0<10^{-4}$、$G_1-1$ 与 $(1-\delta_2)^{-1}-1$ 均 $<10^{-3}$（必要时按 §18 再压），则存在有限 $P$、正 $\delta$、常数 $R_0,C$，对每个解、每个中心 $x_c$、每个极大网、每个 $R\ge R_0$：
$\mathcal Y_R:=\int_{\Sigma_g}\chi^2(a^4+D^2+E^2)+N_R\le CK(R)R^{m-4}$。
常数依赖固定惩罚与容差（含 $\delta$），对解、中心、网、$R$ 一致。

阈值 $\delta$ 必须随空间半径增长期间保持不动，否则坏集与其网随 $R$ 漂移；选择序（`05-growth.tex:67-88`）：先惩罚与不依赖阈值的常数 $C_D$，曲率估计的小系数依 $C_D$，再定面容差（含引理 gluing 的 $\tau\le.001$）、法向深度 $P$、所需下阈值 $t_{\min}$，然后才缩 $\delta$ 使面估计在 $\Sigma_g$ 上成立且 $d\ge t_{\min}$。因此在整个剩余证明里预算成立：
$I:=I_P\ge.999a^2$，$c_ID\le I\le C_PD$，$|H|\le(\frac1{2\sqrt2}+\eps_H)I$，$\eps_H\le.001$，还可以压到 $|H|\le.355I$（`05-growth.tex:77-82`）。$\delta$ 定后再选领口宽 $L_0$；领口上 reach 有界，紧区间 $[t_{\min},t_*]$ 覆盖其全部 reach 值，后测试振幅 $f(d)$ 在其上取一；衰减段与拼接参数最后定，全部先于穷竭与 $R\to\infty$。

面积与领口两条初等账（`05-growth.tex:90-110`）：$K(t)\le C\frac tRK(R)$（$t\ge R\ge1$，$R$ 球盖 $t$ 球再除 $t^m$）；$\int_{\Sigma_g}\chi^2\le CK(R)R^m$（好零点正规小图把面积压进固定扩大球的能量，有界重叠覆盖加指数权环带）；领口计数 $\int_{\Sigma_g\cap\{\dist(\cdot,X)\le s\}}\chi^2+\int_{\{\dist(\cdot,X)\le s\}}\chi^2\dd x\le C(1+s)^ne^{C(1+s)/R}N_R$（极大性把 $X$ 装进网点单位球，每个扩大球面积体积 $\le C(1+s)^n$，移权代价 $e^{C(1+s)/R}$）。这三条同时给后文一切积分的有限性背书。

三步机器的骨架我按策略节的自述对齐（`01-strategy.tex:139-148`）：Simons 恒等式加 Schoen--Simon--Yau 曲率方法把四阶曲率矩削成小倍数的缺陷平方（`05-growth.tex:112` 起，曲率引理 122 行"以小的缺陷代价换曲率"）；一个环境稳定测试同时供面质量与坏零点附近的质量，gluing 引理（271 行）处理多叶叠合与到 $q$ 的衔接；reach 乘子（711 行的长平台权重引理）给该测试的导数代价定价，积分 reach 不等式并"付脚点的账"（829 行起），闭合于 1012 行。与 LLWWW 三维路线的分工论文自己画了线（`01-strategy.tex:152-164`）：他们用面不等式、Gauss--Bonnet 与对数截断；这里的六维界面需要 reach 不等式、四阶增长与最后的径向比较；两处"衔接"操作目的也不同，一处在环境到大面的转换，处在有缺陷零点附近，另一处在相邻叶间插值振幅。

## §18 径向测试与最终对撞：小数点上的战争

`06-radial.tex` 是全文的钱袋所在。构件清单（各引理只取陈述定位）：公共振幅与待证比较（18 行起）、权重恒等式（`lem:radial-weight`，136 行）、粗糙区域移除与误差可和（`lem:radial-errors`，235 行）、积分 reach 预算（`lem:radial-reach-budget`，367 行）、插值区域的局部几何（`lem:radial-clean-geometry`，493 行）、物理空间单一紧支测试（569 行起）、法向切换代价（`lem:radial-switch-cost`，619 行）。设计逻辑我从策略节末段（`01-strategy.tex:166-190`）抄近道：同一个径向 reach 权重同时进几何不等式与环境测试；生长估计控制正规叶描述失败的区域；剩余区域上面振幅沿法向延伸、在相邻叶的固定宽窄带内（位于它们的对数间隙之中）插值；衔接代价正比两振幅平方差，相等时为零；把切换带的每份面积记到未切割振幅较大的那个基点名下，在该基点的最近间隙上 reach 比较让振幅比趋一，归一损失消失，两侧之中只有另一侧可能吃固定正损失；最终稳定估计留住 $\int_\Sigma I_P\psi^2\dd S$ 的约九成，而 $\int_\Sigma|\nabla_\Sigma\psi|^2\dd S$ 的系数留在 1 附近。

对撞段（`06-radial.tex:806-948`）的密度是全文最高，我把系数链逐笔抄下。交叉项对 $h$ 精确移除：$\int_\Sigma|\nabla(hm_c\sqrt{W_*})|^2=\int_\Sigma\phi|\nabla(m_c\sqrt{W_*})|^2-\int_\Sigma h\Delta h\,m_c^2W_*$，$-\frac{\Delta h}h=\frac{4+8T_r-2Hz\cdot\nu}{\rho^2}$；$H$ 项是 $o_R(1)\mathcal L$；$m_c$ 导数代价可忽略；Young 只在另一梯度项上花任意小相对损失。比较 (R7) 前的小数检查：$.73(1.005)/.895<.820$，配合 $\nabla\log W_*=\lambda\nabla(c\tau-b(d))-\frac\vartheta d\nabla d$，$.73\mathcal L$ 被 $.835$ 乘方括号项界住（`06-radial.tex:829-843`）。梯度平方用 $|a-b|^2\le1.5|a|^2+3|b|^2$：$.835\cdot\frac{1.03}4\cdot1.5\lambda^2\le.70955\lambda<.72\frac\lambda{b'}$（$0<\lambda\le2.2$，$0<b'\le1$）；另一支 $.835(1.03)3\vartheta^2/(4d^2)$ 大 $R$ 时一致小于 $.012/d$；$\lambda=0$ 处第一比较免用。常数径向项 $.835\cdot4=3.34<3.44$。$T_r$ 项用 $\mathcal F/W_*\ge1/(2.2+o_R(1))$：$24\frac{\mathcal F}{W_*}-.835\cdot8\ge(24-.835\cdot8(2.2+o_R(1)))\frac{\mathcal F}{W_*}\ge5\frac{\mathcal F}{W_*}$。相减、弃其余非负残项，得
$\int_\Sigma\phi m_c^2\mathcal F\frac{T_r}{\rho^2}\dd S\le o_R(\mathcal A)+o_{B\to\infty;R}(1)$（`06-radial.tex:864-867`）。每一步吸收 $o_R(1)\mathcal L$ 都在有限 $B$ 内做、系数对 $B$ 一致，穷竭不预设 $\mathcal L$ 有有限极限。

面积的份（`lem:radial-area`，`06-radial.tex:877-933`）：集合 $\{z\in\Sigma\cap B_{2R}:m_H(z)=1,\ d(z)\le L/2\}$ 面积至少 $cK(R)R^m$。路线：$B_R$ 能量 $\ge cK(R)R^m$（中心选择）；固定尺度网上每零点固定小球有固定正能量，打包给网点数 $|{\mathcal Z}\cap B_{R+j+2}|\le CK(R)R^m(1+j/R)^{m+1}$；距 $\Sigma$ 超 $P_0$ 的能量被 $\sum_j(1+j/R)^{m+1}(j+2)^ne^{-c_1j}$ 压成小分数（相衰减加 Modica）；粗领口能量也可忽略（体积 $O(K(R)R^{m-4+2\alpha+n\beta_0})$，四阶增长在这里付账）；余点贴着 $m_H=1$ 的零点，其法向管雅可比有界、能量按底面积控制。大 reach 部分用共同单射管（`03-reach.tex:175` 的注记，阈值 $L/2$）：$\operatorname{area}\{d>L/2\}\le CR^{m+1}/L=CK(R)R^m/\sqrt{K(R)}=o(K(R)R^m)$，因 $L\le R$ 且 $L/\sqrt{K}$ 型选取。最后取 $B>3R$：该集合上 $m_c=1$、$\rho\le\sqrt5R$、$T_r\ge1/5$，$d\le L/2$、$f_*(c\tau)=1$ 给
$\mathcal F(\tau,d)\ge\int_{L/2}^Lt^{-\vartheta}\dd t=\frac{1-2^{-(1-\vartheta)}}{1-\vartheta}L^{1-\vartheta}$，且 $\phi T_r/\rho^2\ge cR^{-m}$，左端 $\ge cK(R)L^{1-\vartheta}=c\mathcal A$。先 $B\to\infty$（$R$ 固定）再 $R\to\infty$，与上式矛盾；密度无界情形不成立。

## §19 定理 stable 的收口与一张选择序清单

收口段（`06-radial.tex:950-965`）把情形树走完：达到 $\pm1$ 者强极值原理成常数；剩下 $v\equiv0$ 被大尺度截断的不等式 $Q_0(\chi_R)=R^5\int|\nabla\chi|^2-R^7\int\chi^2<0$（大 $R$）判不稳定；值在 $(-1,1)$ 的非常数稳定解，若 $D$ 在某点为零，§9 的等号情形给平面 heteroclinic；否则 $D>0$ 处处成立，中心密度有界则定理三（§13），无界则 §14--§18 的矛盾。定理二证毕，Part I（§4--§7）随即把定理一带出。

全篇读毕，我把"先固定再取极限"的纪律汇总成一张单，因为它是这篇论文在方法论上最值得偷的东西：§3 单调性公式对几乎处处 $r$ 成立再积分到一切半径对；§5 环带平均中 $\delta$ 先于 $j\to\infty$；§12 窗 $P$ 先于阈值 $\delta$；§14 惩罚内序（$\eps_1$、$\delta_1$、$L$、$\delta_2$）先于一切几何量；§15 常数与大 reach 阈值先于缺陷阈值、领口、穷竭；§16 中 $P$、$Q$、阈值依次；§17 惩罚、$C_D$、$\tau$、$P$、$t_{\min}$、$\delta$、$L_0$、衰减参数八级阶梯；§18 每次吸收 $o_R(1)$ 在有限 $B$ 内、系数对 $B$ 一致，末段 $B\to\infty$ 后 $R\to\infty$；§13 完成段 $\delta$、$P,S$、$R_0$、$R\to\infty$、$R_0\to\infty$、$\delta\to0$。每条都是"若改动断在哪一步"的答案，我在台账里挑了代表挂行。

## §20 九维附录：机器为什么恰好停在八维

附录（`09-dimension-nine.tex` 全读）把九维 DPKW 构造牵来与本文机器对表。论文的维度敏感点只有两个：端点剖面分类用了七维的定理二；锥论证用了八维无奇异射线。九维里奇异集界允许维数一，竖直圆柱悬在奇异最小锥之上不再被排除，而 DPKW 恰好实现这个可能性（`09-dimension-nine.tex:4-9`）。

对表细节：他们的 Theorem 1 给 $\R^9$ 中有界整光滑解 $u_\alpha$，对 $x_9$ 严格增，伴随非仿整极小图 $\Gamma_\alpha=\{(p,\alpha^{-1}F(\alpha p))\}$，$|u_\alpha(x)|\to1$ 当 $\dist(x,\Gamma_\alpha)\to\infty$。图来自 BDG 血统：$p=(\xi,\zeta)\in\R^4\times\R^4$，$(|\xi|,|\zeta|)=(r\cos\theta,r\sin\theta)$，$F_0=r^3g_{\rm BDG}(\theta)$ 在扇区 $\pi/4<\theta<\pi/2$ 正，$F_0\le F\le F_0+Cr^{-\beta}\min\{F_0,1\}$，$F$ 对换 $\xi,\zeta$ 反号（`09-dimension-nine.tex:26-41`）。推演链条我按原文逐步核：固定 $p$、$t$，$Rp+O(1)$ 保持在正扇区紧子区间，得 $F_\alpha(Rp+O(1))\ge c_{p,\alpha}R^3$；距零点 $(Rp,h_\alpha(Rp))$ 在 $D_\alpha+1$ 内的图点底坐标 $Rp+O(1)$，故 $h_\alpha(Rp)/R\to+\infty$，$u_\alpha(Rp,Rt)\to-1$（$0<|\xi|<|\zeta|$），反扇区 $+1$；等号集与坐标轴零测，有界收敛给局部 $L^1$ 收敛到两相函数，界面
$\mathcal C_9=\{(\xi,\zeta):|\xi|=|\zeta|\}\times\R$（`09-dimension-nine.tex:86-90`）。这锥的奇异集恰是整条竖直轴，竖直平移不变，正则部分法向竖直分量为零，正是 §6 里被 $\operatorname{Sing}C\subset\{0\}$ 排除的分支的九维化身。同一批解由 §4 引理（常端剖面版）自动是最小化子，带 $O(R^8)$ 能量增长，与推导性质无冲突；其非平面相极限排除一维性；按额外坐标常延拓覆盖一切 $N>9$（新增二阶导消失，$x_9$ 严格增保持），但不供八维反例。附录还顺手校准了版本编号（出版文 Theorem 1 对 arXiv 0806.3141v2 的 1.1 与 3.1），这种对表是防引用漂移的例行卫生。

## §21 重建的错误路线与转折点

成稿是光滑的，反推思维链必须把毛边找回来。以下每条都注明我是从哪个文本伤口读出它的；读不出的一律标 [推测]。

（一） Blow-down 只给相位收敛时的多余能量漏洞。文本伤口是引言那句"该等式需要一条与原解粘合的重建序列；仅有相位收敛会把额外能量的可能性留着不关"（`00-introduction.tex:155-158`）与 §5 证明标题级强调"精确性"。可合理推测（[推测]，中等置信）：作者先做过普通 $\Gamma$ 收敛或仅用下半连续的版本，撞见"平锥定了、密度没定"的僵局，才补环带分层平均。$L^1$ 失配的 $\eps_j^{-1}$ 放大与"平均不需要收敛速率"那句（`02-monotone.tex:336-339`）读起来就是事后庆幸的语气。

（二） 端点假设的执念。Savin 的逐点极限假设沿用二十年，路线惯性是把极限钉成常数井再滑障；本文的第一步转折是接受 $v_\pm$ 可为平面剖面（`02-monotone.tex:8-10`："端点剖面最初允许是平面 heteroclinic"）。这句"最初允许"的让步语气，我读成作者对旧假设的一次公开卸载。标定对两类剖面同样生效，卸载免费。

（三） 有向锥论证的漏分支。$f\equiv0$ 情形被单独声明"我们包含该情形"（`00-introduction.tex:166-168`）。经典文献（Schnuerer 的记录）处理的是正分量情形；[推测]，高置信：作者按旧文献抄第一段时被附录的九维圆柱提醒，回头补了平移不变性论证，因为它恰好也是九维反例的运作原理。

（四） 全长锐常数的截断陷阱。`rem:diffuse-truncation` 是全文最直白的一条自败记录：有限窗无法保端点常数，因为截断严格减小正分母；所以必须 $c>\frac1{2\sqrt2}$ 严格放松，再由 §13 的 $3c_*<\sqrt2$ 说明放松付得起。我推测（[推测]，中等置信）初版想用 $c=\frac1{2\sqrt2}$ 的极限形式配局部收敛论证，被这条注记否掉。

（五） 先粗后锐的间隙测试。`02-finite-density.tex:29-31` 明写"平方根间隙粗测试必须先于更锐的近线性测试：它使间隙拉普拉斯的梯度误差可吸收而不丢最终系数"。这是标准的"先降级再升级"工艺；粗测试存在的必要性被写进计划段，说明锐测试单独跑通过一次失败。失败长什么样 [推测]：$\psi'$ 逼近 1 时 $-\psi''/\psi'$ 的误差乘曲率积分，超过 $\frac{3c_*}4(m-2)$ 的预算。

（六） 面稳定性只留半质量的版本。`01-strategy.tex:64-68`："当相互作用主导曲率时，此不等式只留住约一半的 $I_P$ 质量；最终环境测试对特别选取的径向振幅留住几乎全部。这一改进正是七维最终比较的决定性。"半质量版是中间产品，撑不起七维（六维界面对数系数不够），才有 §16 的位势增益全额回收与 §18 的九成保留。我在此读到全文最贵的一次迭代：从逐叶提升的方差项处理，到切换带按"较大未切振幅"归属记账（`01-strategy.tex:173-180`），这一笔把损失从 50% 压到 10% 以内。

（七） reach 的惩罚平台。裸 $1/s$ 在 $s=1$ 附近不可微分比较；平台 $G_1$ 让接触法化、转移带号（§14、§15）。策略节自述目的在 `01-strategy.tex:110-113`。惩罚与 $\kappa=\sqrt2/G_1$ 的联动（§17 第 13 行）说明几何量与交互率必须共享同一个 $G_1$，这是"一个参数两处消费"的账，任何一侧改动都逼另一侧重调，容差 $10^{-3}$、$10^{-4}$ 的分级由此而来。

（八） 初始设想与终稿的换位。开局我推测（[推测]，高置信，因引言自述结构支持）作者想的是"单调解直接大伸缩、正则性收尾"的短打；终稿却是四部曲，重心全在无密度界的七维稳定分类。换位的因果链在文本里可指认：短打的闭环需要 $M_\infty$ 有限与端点剖面最小性，前者把问题推给定理二，后者把问题推给定理三的无界版。De Giorgi 猜想在八维的解决最终挂在一个更抽象定理上，这与历史上多个 Bernstein 型问题的解决路径同构。

（九） 与并行工作的竞合。引言给 LLWWW 与 CFFFS 的独立同期结果各一句（`00-introduction.tex:118-122`），§9 又两处承认变量表述与 LLWWW 引理 2.1 同源、本文独立推导。时间压力下保留共同技术、独占维度推进，是这类论文的常规自保动作；写作层面表现为凡借力处必点名行号（FSS 的具体定理号、Wang--Wei 的手稿日期"9 October 2019"、Wang 2017 的页码 3036），这种超精确对表通常是被审稿或自我审计逼出来的。[推测]。

## §22 台账

参数与常数的消费链清单如下，位置栏均为本会话真实读出的 `文件:行`。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $g(s)=\tanh(s/\sqrt2)$ | 一维过渡 | build/sections/00-introduction.tex:9 | 全部平面化结论 | 定理目标失锚 |
| $W(s)=\frac14(1-s^2)^2$ | 四次双井 | build/sections/00-introduction.tex:21 | 标定与 $\widetilde W$ 延拓 | Jerison--Monneau 假设破 |
| $s_0=\frac{2\sqrt2}{3}$ | 表面张力 | build/sections/00-introduction.tex:150 | 一切密度归一 | $M_\infty=1$ 无意义 |
| $\sigma=\frac{4\sqrt2}{3}=2s_0$ | 法向平均权 | build/sections/01-diffuse.tex:36 | $I_P$ 定义 | 曲率界系数错位 |
| $\frac12\lvert\nabla v\rvert^2\le W(v)$ | Modica 界 | build/sections/00-classical.tex:19 | $U$ 为 1-Lipschitz | $D\ge0$ 失、变量崩 |
| $M_r'(y)\ge0$ | 单调性 | build/sections/00-classical.tex:57 | 锥生成与密度窗 | 极限边界非锥 |
| $v_-<u<v_+$ | 严格夹逼 | build/sections/02-monotone.tex:45 | 滑动接触参数 | 首碰可发生在边界 |
| $-\Delta+3u^2-1$ 的地面态 | $h=u_8$ | build/sections/02-monotone.tex:58 | $u$ 稳定性 | 稳定测试无从谈起 |
| $L^{-2}$ 误差 | 降柱测试 | build/sections/02-monotone.tex:80 | 七维稳定继承 | 端点剖面未必稳定 |
| $\widetilde W$ 三分支延拓 | $C^{1,1}$ 势 | build/sections/02-monotone.tex:113 | 引用经典滑动定理 | 无约束最小化断 |
| $\mathcal E(u;B_R)\le C_NR^{N-1}$ | 面阶增长 | build/sections/02-monotone.tex:136 | 大伸缩局部有界 | 测度极限不存在 |
| $\mu=s_0\lvert D\mathbf1_E\rvert$ | 精确等式 | build/sections/02-monotone.tex:255 | 锥密度身份 | $M_\infty$ 不定 |
| $P(E;B_r)=\omega_7r^7M_\infty$ | 面积比恒常 | build/sections/02-monotone.tex:396 | 单调性等号 | 锥结构缺 |
| $\nu_E\cdot e_8\ge0$ | 有向性 | build/sections/02-monotone.tex:418 | Jacobi 试验函数 | link 平坦论证断 |
| $\operatorname{Sing}C\subset\{0\}$ | 奇异维数 $\le0$ | build/sections/02-monotone.tex:439 | 奇异射线排除 | 九维漏洞渗入 |
| $\Delta_Cf+\lvert A_C\rvert^2f=0$ | Jacobi | build/sections/02-monotone.tex:457 | 分支全测地 | $f>0$ 推不动 |
| $\Delta_\Lambda\ell+6\ell=0$ | 坐标函数 | build/sections/02-monotone.tex:477 | 半球分支排除 | 多分支锥漏网 |
| $M_\infty(u)=1$ | 单位密度 | build/sections/02-monotone.tex:509 | Wang 定理输入 | 回不到方程 |
| $1+\delta_N$ | 近单位阈 | build/sections/02-monotone.tex:524 | 一维化 | 剖面定不出 |
| $Q_v(q\eta)=\int q^2\lvert\nabla\eta\rvert^2-q^3D\eta^2$ | 精确恒等 | build/sections/01-diffuse.tex:89 | 全解析段测试 | 缺陷探测失明 |
| $\mathcal LD=2\lvert T\rvert^2$ | 子解结构 | build/sections/01-diffuse.tex:58 | Harnack 标度 | 除 $D$ 失一致 |
| $e(v)=\frac14q^2(2-D)$ | 能量改写 | build/sections/01-diffuse.tex:65 | 单调性双非负项 | 分项使用断 |
| $\lvert T\rvert^2\le CD$、$\lvert\nabla D\rvert\le CD$ | 相对标度 | build/sections/01-diffuse.tex:113 | 吹放紧致性 | 极限引理缺 |
| $e^{(2\sqrt2+\gamma)\lvert y-z\rvert}$ | 缺陷传播率 | build/sections/01-diffuse.tex:114 | 端点缺陷与 $E$ 权 | 层距下界失效 |
| $q\le Ce^{-(\sqrt2-\gamma)\dist(x,\Sigma)}$ | 相内清除 | build/sections/01-diffuse.tex:247 | 零集非空、面积转换 | 临界约化断链 |
| $H=\frac{\partial_\nu D}{2\lvert p\rvert^2}$ | 符号约定 | build/sections/01-diffuse.tex:307 | 极限 $\frac12F_s(0)$ | 系数差因子 2 |
| $\mathcal L_0=-\Delta+2-G(s)$ | 极限算子 | build/sections/01-diffuse.tex:330 | 极值分类 | Pöschl--Teller 失 |
| $a=\sqrt{4-2\lvert b\rvert^2}\in[1,2]$ | 极值参数 | build/sections/01-diffuse.tex:401 | 质量计算 | 锐窗变窄 |
| $M(2)=2$，$M'(2)=\frac32$ | 切线两值 | build/sections/01-diffuse.tex:497 | 凸不等式 | 比值上界退化 |
| $\frac{1}{2\sqrt2}$ | 锐比值 | build/sections/01-diffuse.tex:493 | $c_*$ 下限 | 有限密度可存活 |
| $\frac1{2\sqrt2}<c_*<\frac{\sqrt2}3$ | 严格窗 | build/sections/01-diffuse.tex:572 | $m=6$ 闭合 | 对撞变恒等 |
| $M_\infty=K\ge2$ 整数 | 临界密度 | build/sections/02-finite-density.tex:118 | 分层与间隙 | 反证素材缺 |
| $\psi(l)=l+\log l$ | 近线性测试 | build/sections/02-finite-density.tex:742 | 系数 $L\le1+\delta$ | 粗界白做 |
| $T_0=(\sqrt2-\delta)\log R$ | 对数帽 | build/sections/02-finite-density.tex:787 | 下界质量 | 例外集压不住 |
| $\beta=(\sqrt2+\gamma)(\sqrt2-\delta)<2$ | 指数拼合 | build/sections/02-finite-density.tex:809 | 例外面积 $o(R^m)$ | 下界被稀释 |
| $\sqrt2\le\frac{3c_*}{4}(m-2)$ | 不可能链 | build/sections/02-finite-density.tex:843 | 定理三矛盾 | 需另源补 $m=6$ |
| $d(z)=\inf\ell\Gamma(s)$ | 受罚 reach | build/sections/03-reach.tex:124 | 微分不等式 | 弯曲交互难并计 |
| $1\le G_1\le\Gamma(s)$ | 平台值 | build/sections/03-reach.tex:108 | 接触法向化 | 平台转移式失效 |
| $d\max_i\lvert\lambda_i\rvert\le2$ | 主曲率界 | build/sections/03-reach.tex:138 | 管雅可比 | 面积因子失控 |
| $K(R)=1+\sup_xM_R(x)$ | 增长记分 | build/sections/03-reach.tex:34 | 预算右端 | 各估计失一致 |
| $\exp\{C_\Gamma\sqrt{\log(K(d)+1)}\}$ | 梯度率 | build/sections/03-reach.tex:822 | 权重导数代价 | 可和性断 |
| $B\le1+C_\Gamma d^{-\gamma}$ | 临界系数 | build/sections/03-reach.tex:828 | Young 吸收 | 梯度方项溢出 |
| $J_{y\to z}\le C_\Gamma$ | 转移面积因 | build/sections/03-reach.tex:843 | 脚点多重性一 | 正电荷重复计 |
| $(1-\eps)\int\frac{a^2+I_P}{2}\psi^2\le\int\lvert\nabla_\Sigma\psi\rvert^2$ | 强面稳定 | build/sections/04-interface.tex:247 | 系数对撞 | 交互控制对折 |
| $\ge(1-\eta)\frac\sigma2I_P$ | 位势增益 | build/sections/04-interface.tex:332 | $I_P$ 全额回收 | 半质量版本起用 |
| $\kappa=\frac{\sqrt2}{G_1}$、$E=e^{-\kappa d}$ | 交互率 | build/sections/05-growth.tex:13 | 四阶矩权 | 率与 reach 错位 |
| $\eta_0<10^{-4}$，$G_1-1<10^{-3}$ | 容差分级 | build/sections/05-growth.tex:50 | 裕度累加 | 径向比较崩 |
| $\mathcal Y_R\le CK(R)R^{m-4}$ | 四阶增长 | build/sections/05-growth.tex:58 | 粗区扣减 | 面积矛盾缺粮 |
| $I\ge.999a^2$，$\lvert H\rvert\le.355I$ | 预算 | build/sections/05-growth.tex:78 | $Hz\cdot\nu$ 吸收 | $o_R(1)\mathcal L$ 过大 |
| $.73\mathcal L$ 对 $.835$ | 系数链 | build/sections/06-radial.tex:829 | 严格比较 | 裕度归零 |
| $3.34<3.44$、余量 $5\mathcal F/W_*$ | 径向项 | build/sections/06-radial.tex:855 | 不等式 (R8) | 反证拿不起 |
| $cK(R)R^m$ 面积在 $d\le L/2$ | 下界 | build/sections/06-radial.tex:880 | 左端 $\ge c\mathcal A$ | 无矛盾 |
| $Q_0(\chi_R)=R^5\int\lvert\nabla\chi\rvert^2-R^7\int\chi^2$ | 零不稳 | build/sections/06-radial.tex:956 | 情形树收口 | 常数解悬空 |
| $F_0=r^3g_{\rm BDG}(\theta)$ | BDG 三次增长 | build/sections/09-dimension-nine.tex:33 | 下界比较 | 九维对表失据 |
| $\mathcal C_9=\{\lvert\xi\rvert=\lvert\zeta\rvert\}\times\R$ | 界面锥 | build/sections/09-dimension-nine.tex:87 | 奇异线实现 | 八维尖锐性缺证 |

## §23 勘误

以下条目按落盘协议只做追加声明，不动已落盘正文。

（一）补录被误删段落。§16 末段的原稿在一次追加操作中被当作定位锚吞掉，属操作事故。该段全文补录如下（其中一处公式定界符笔误一并在此修正）：本节其余两个大构件，精确指数率比较（`prop:interface-exact-comparison`，见 `04-interface.tex:360` 起，含半空间逆引理）与锐常数对数窗（`prop:interface-sharp-gaps`，见 `04-interface.tex:1153` 起），我只取到命题定位与标题，内文细证 [未取读]；从 `05-growth.tex:13` 与 `01-strategy.tex:140-148` 的引用关系看，前者供出交互率 $\kappa=\sqrt2/G_1$ 的指数比较，后者供出间隙在对数帽下的锐系数，两者分别被 §17、§18 消费。

（二）前向引用编号订正三处。§10 段末"两者在 §12 的端点缺陷估计里相乘出 2"应指 §13；同段"面孔三：§14 里"应指 §17（$E=e^{-\kappa d}$ 定义于 `05-growth.tex:13`，属 §17 内容）。§11 末段"以及 §12 里 $\sqrt2$ 与 $\frac{3c_*}4(m-2)$ 的对撞"应指 §13。所指内容都存在，仅编号错位；动笔前排的目录里有限密度一节应为 §13，我执笔时把两处早期草稿句的编号按旧序留了下来。

（三）文风命中申报。正文有两处出现"转折连词与否定副词相邻"这一违禁双字组的偶然连读：一处在第 21 行（讲九维起点的整极小图那句，语义为本意"而+非仿的"，即转折字后接的是形容词词头）；一处在第 68 行（§4 讲端点剖面取舍那句，语义为对比用法）。按协议我不回改已落盘字节，也不在此处把违禁字组照写出来；两处交外部机械清理处理，申报见交付报告。其余闸门自查结果：长破折号零、整行分隔线零、五套过渡套语零、加粗装饰零、对勾与表情符号零。

（四）遗留的自我标注说明。§15 末段与 §16 末段各有一处"[未取证/未取读]"标注，是有意保留的信息边界，按规格不硬编；§21 各条已逐条注明推测置信度。§16 中"积分為零"的"為"为异体字笔误，不影响任何含义，一并在此声明。
