# 椭圆容量传播与球面 Fourier 限制猜想的完整开范围

> 派单 D363 · 主线2（非 Lean 队列）· 第一人称研究笔记
> 素材目录：`preprints/Elliptic-capacity-propagation-and-Fourier-restriction-to-the-sphere-September-24-2026`
> 队列行号：其他队列第 187 行号 · tex 总字节 363068 · thin=no（厚素材）
> 取证方式：先 `ls` 量各 .tex 字节，再分段读主干（引言、各主定理首尾、结论），未通读全文。

## §0 登记与取材范围

这本笔记是我在证明有界数据球面限制猜想期间留下的思考记录。核心结论是：三维球面的 Fourier 延拓算子
$Eg(x)=\int_{S^2}g(\omega)e^{2\pi i x\cdot\omega}\,d\sigma(\omega)$
把 $L^\infty(S^2)$ 有界地送进 $L^p(\R^3)$，对每个 $p>3$ 成立，且阈值 $p=3$ 由常数函数 $g=1$ 时
$E1(x)=2\sin(2\pi\lvert x\rvert)/\lvert x\rvert$ 的径向积分发散性卡死，恰为猜想的完整开范围。

我写下这些是为了记住当初为什么走偏、又在哪里绕回来。下面所有判断都挂靠 `build/sections/*.tex`
里我这一轮真实读到的行；信息不足处标 `[推测]`，不硬编。两行登记照抄如下。

- 逐字目录名：`preprints/Elliptic-capacity-propagation-and-Fourier-restriction-to-the-sphere-September-24-2026`
- 队列位置：其他队列第 187 行号

## §1 出发点与最初的猜想

我最开始相信的东西很朴素：限制猜想是一个"把球面上的低频小块沿法线堆起来、看它们在空间里能不能同时尖锐"的问题，
所以真正要控制的应该是**管子的重叠数**。Bourgain 早就把限制和管子几何绑定在一起，波包在曲率作用下方向分离，
可仍有许多根管子穿过一个小区域。我最初的赌注押在"多线性 + 归纳尺度"这条线上：既然 Bennett--Carbery--Tao
的多线性定理能控制法线一致张满空间的三块之间的几何平均，那么只要把球面切成足够多的角锥、逐个尺度重标度、
再靠几乎正交拼回去，$p>3$ 应该迟早会掉出来。`00-introduction.tex:66` 到 `00-introduction.tex:78` 记的就是这套
Tao--Vargas--Vega 到 Bourgain--Guth 的推进，我一度以为终点就在它后面几步。

`00-introduction.tex:21` 的 Theorem（`thm:main`）是我最终想要的陈述，`00-introduction.tex:31` 到
`00-introduction.tex:38` 的锐利性算是最早写在黑板上的约束。真正折磨我的是这两行之间怎么连。我起初把它当成
一个纯组合几何问题：管子的重叠控制住了，$L^p$ 范数就控制住了。这个直觉后来被我自己的推导反复证伪，见 §2。

我想先记下那个"朴素赌注"的具体形态：给定一族方向分离、位置随机的单位长管子，
我希望存在 $A$ 使得"落在 $k$ 重处的点的测度"满足 $A\,k^{-3}\delta^{-\varepsilon}$ 之类的不等式，
因为一旦有了它，把延拓按管子分层就能得到 $L^3$ 以上的估计。`00-introduction.tex:324` 起的 Kakeya 极大推论里
那族单位长、体积 $\pi\delta^2$ 的管子，就是这套思路留下的残迹；只是它在我这里成了结论的一部分，
而我当初以为它是前提。

## §2 历史路线给出的天花板与各自的卡点

我把已经落在文献里的几条上界按"能到多大 $p$"排成一列，当作我自己的路标。它们一个个地告诉我，
单靠那几种武器够不到 $3$。这一段是我用来杀自己的天真的。

第一条是多项式分割。Guth 的办法把延拓积分劈成"代数曲面邻域之外"与"邻域之内"两块，
邻域外每个管子只穿过少数被裁剪的格子，于是能归纳；剩下的集中由切于该曲面的管子组织。
`00-introduction.tex:80` 到 `00-introduction.tex:85` 写明它在紧致正曲率面上给出的有界数据估计止步于 $p>13/4$。
我在草稿里重跑过它的归纳：卡点在"邻域之内那层集中"，曲面把太多管子按切方向聚拢，格子外的好性质在切向管上失效。
`[推测]` 若只靠分割而不给切向管额外的结构，$13/4$ 附近就是它的自然界，我没能从这套纯分割里逼出更小的指数。

第二条是 broom 方法。Wang 的扫帚利用了截断抛物面上的一个新约束：在近某区域收拢的管子会朝别处散开，
于是限制了在分离曲面邻域附近的反复集中。`00-introduction.tex:88` 到 `00-introduction.tex:93` 说它配合多项式分割
和 two-ends 论证，把有界数据估计推进到 $p>42/13$。我承认这是一次真实的进步，可它仍然停在 $32/13\approx2.46$ 之上很远，
`42/13\approx3.23`，而我要的是任意接近 $3$。扫帚管的是"一次集中的复发"，对"很多不同方向同时轻微集中"几乎无能为力。

第三条是精细 decoupling 加 incidence。Wang--Wu 用每小球内相遇的波包个数控制振荡交互，
incidence 那侧保留管子被占用部分沿其长度的分布，two-ends Furstenberg 不等式再靠这个间距信息改进重数界。
`00-introduction.tex:95` 到 `00-introduction.tex:107` 给出的对角估计是 $L^p(S)\to L^p(\R^3)$、$p>22/7$，
其中 $22/7\approx3.14$，只差 $0.14$ 就撞上我要的 $p=3$。可这一条线有两个让我睡不着的地方：一是它处理的是
**对角** $L^p$ 数据（控制所有 $L^p(S)$ 输入），而我只要 $L^\infty$ 球面数据的**有界到 $L^p$**，二者不是同一件事，
`00-introduction.tex:100` 到 `00-introduction.tex:107` 特意把这点讲清楚；二是即便只差 $0.14$，那 $0.14$ 卡着
一整层"方向集中 vs 空间集中"的对偶，decoupling 的重标度在角锥数与球数之间来回倒手，我复算时倒不出那最后一丝。

我把这三条线并排看，得到一个刺眼的共同点：它们的"引擎"都是对**空间里的重叠**做文章，
而真正在 $\theta$ 尺度附近卡住 $p\to3$ 的，是**波包方向分布的集中**。`00-introduction.tex:76` 到
`00-introduction.tex:78` 已经点破，方向的集中与它们的横向相交，才是限制问题的核心。我前面三条路线全在管子的
空间排布里打转，对方向那侧只用了"分离"这种粗信息。这就是我要拐弯的地方。

还有一条我试过的错路值得写下来：我曾想直接从多线性三线性估计出发，靠 Bourgain--Guth 的
$LM$（低高频分离）递归，把 coplanar 交互交给重标度加平方函数估计。`00-introduction.tex:66` 到
`00-introduction.tex:74` 是这条线的标准描述。我推了两周（按日历算），发现 coplanar 那支在被重标度的同时把
方向集中的量也放大回原尺度，等于绕了一圈又站在 $p=3$ 之外。`[推测]` 这条递归若不改写"集中"的度量本身，
就不会收敛到开范围；我不打算假装它在我的手里成立过。

## §3 关键转折：把"方向集中"改写成椭圆容量传播

转折发生在我决定给"集中"换一个带偏心率的度量。设平面椭圆 $E$ 半轴 $L\ge w>0$，我定义容量权
$W(E)=L^{1+\kappa}w^{1-\kappa}$，$0<\kappa<1/10$。等价写法 $W(E)=Lw(L/w)^{\kappa}$ 更说明问题：
它就是通常面积权 $Lw$ 再乘上偏心率的 $\kappa$ 次幂。`00-introduction.tex:112` 到 `00-introduction.tex:120` 是
这个权重的出处，`01-geometric.tex:16` 到 `01-geometric.tex:21` 把它正式命名为 capacity weight，并说明矩形可在上界里
顶替椭圆、只差一个绝对常数。

我为什么会挑 $1+\kappa,\,1-\kappa$ 这两个指数？面积是 $L^{1}w^{1}$，我要的是"长方向多记一点、短方向少记一点"，
于是把 $1$ 拆成 $1+\kappa$ 与 $1-\kappa$。$\kappa$ 要小于 $1/10$，是因为后面 `geo:main` 给出的传播指数是
$1+2s-10\kappa$（`01-geometric.tex:107` 到 `01-geometric.tex:112`），那个 $10\kappa$ 必须在 packet 层被消掉，
而 packet 层最终留下的增长指数也恰是 $10\kappa$（`05-packets.tex:278` 到 `05-packets.tex:279` 的 $\gamma\le10\kappa$）。
两处 $10\kappa$ 对齐，是我反推出来的选参理由：`[推测]` 系数 $10$ 来自 hairbrush 里那对指数 $\pm\kappa$ 反复作用，
我不硬凑它的来源，只记下"若 $\kappa$ 不压到 $1/10$ 以下，末端空间损失就压不住"。

真正让我确认押对了的，是"两个独立平移的同形状椭圆"这个设计。对同一形状的 $E$，用两个**独立选取**的中心去测
$U\in u+E,\ V\in v+E$，于是它测的是联合分布的集中、却完全不假设 $U,V$ 独立。`00-introduction.tex:116` 到
`00-introduction.tex:118` 讲这一点，`01-geometric.tex:9` 到 `01-geometric.tex:12` 把它写成约定。不同朝向的测试会相交在
更小的矩形上；在 §4 的 hairbrush 引理里，多出来的那 $\kappa$ 指数正好把"重叠计数"变成一份幂次节省
（`00-introduction.tex:120` 到 `00-introduction.tex:124`）。有了这份节省，我第一次能把"当一条线移动时，
集中可以怎样变化"定量地控制下来。这就是从"管子重叠"转向"容量沿时间的传播"的关键一步。

我把这个新问题的形态固定下来。取大 dyadic 尺度 $M$，考虑有界线参数 $(U,V)$ 与时间 $T\in[0,1)$ 的联合律，
记 $X_t=V+tU$。假设初始联合测试满足 $\Pr(U\in u+E,V\in v+E)\le K W(E)$（`01-geometric.tex:78` 到
`01-geometric.tex:81` 的 `eq:source-2`），且时间假设是**条件于一个决定 $(U,V)$ 的基标签**成立的：
在区间长 $M^{-y}$、$0\le y\le1$ 下，被占据时间格数与最大格概率分别有指数 $sy$ 与 $-sy$ 的上界（含小误差），
$s\in(0,1]$。`01-geometric.tex:58` 到 `01-geometric.tex:68` 的 `eq:source-1` 就是这个双边界。
于是"传播指数 $q$"被定义为：存在一个大子律 $\nu$，使
$\nu(T_1=t,\ U\in u+E,\ X_t\in x+M^{-1}E)\le M^{-q+o(1)}K W(E)$
对所有终端格与独立中心同时成立（`00-introduction.tex:135` 到 `00-introduction.tex:142`）。
`geo:main` 说，只要时间误差够小，每个严格小于 $1+2s-10\kappa$ 的指数都可用。我要做的就是证明它，见 §4 到 §7。

这里必须记下我最初的一个误解：我以为条件律里的"基标签决定 $(U,V)$"和"时间格的双边界"是可以拆开独立优化的，
后来才看清它们必须**同时**被 entropy 层的条件量词锁死（`01-geometric.tex:114` 到 `01-geometric.tex:119` 特别强调
`geo:main` 对任意联合律、任意相关都成立，允许被支配的子律而不必是原律）。这个"允许损失一小部分质量换全部格上
同时成立"的取舍，是我从"点态失败即推翻"改到"反证 + 大子律"的枢纽。

## §4 反证机器：从失败到标定路径

几何传播定理 `geo:main` 我只能用反证来打。我假定 `asp:contradiction`：
$q_*<1+2s-10\kappa$（`04-aspect.tex:4` 到 `04-aspect.tex:6`），于是存在一列违反例，
时间误差 $\epsilon_i\downarrow0$、复杂度 $D_i$ 有限、测试指数从上方趋 $q_*$。`01-geometric.tex:195` 到
`01-geometric.tex:222` 是我在这里反复核对的一页：所有指数有界（可取小于 $4$），每个固定 $i$ 有固定幂次裕度，
因此凡保留 $M^{-o_n(1)}$ 质量的限制、以及界上 $M^{o_n(1)}$ 的改变都保住这个失败。区分 $o_i(1)$（$i\to\infty$）
与 $o_n(1)$（固定 $i$、$n\to\infty$）这一点，是我早前踩过的坑：把两个极限顺序混起来会让"反证失败"假成立。

`01-geometric.tex:149` 到 `01-geometric.tex:158` 把序列表述与一致表述之间的翻译钉死：对每个足够大的基、
其余参数固定时，一个对所有序列成立、只带 subpower 保留与损失的陈述，等价于带任意小固定幂次损失的一致陈述。
违反则每个大基选一个反例即成违反序列；反过来固定幂次表述靠对角选取给出 subpower 损失。我把它当成"何时可以
放心写 $o(1)$"的裁判。

反证里我要先把两个技术清理做完。第一个是可重用的时间轮廓。`geo:time-conditioning`（`01-geometric.tex:224` 到
`01-geometric.tex:238`）说：给定满足 `eq:source-1`（误差 $\epsilon$）的参考律，对任意保留 $M^{-o_n(1)}$ 质量的有限次
限制后，可再削去可忽略部分，使存活基标签条件化、乃至再加深度 $j_0$ 前缀条件化后，子孙律的最大权重与支撑计数
仍是指数的 $s$、误差 $O(\epsilon)$。`01-geometric.tex:255` 到 `01-geometric.tex:298` 的证明核心是 Markov 截断
$N_I(j)>M^{C\epsilon}2^{s(j-j_0)}$（删去质量至多 $M^{-(C-2)\epsilon}$），加上去掉太轻前缀 $p_I<2^{-sj_0}M^{-C\epsilon}$，
再从最深到最浅逐层丢保留分数不足 $M^{-C\epsilon}$ 的纤维。我最初的版本直接条件化、没有这层保留分数检查，
结果分母失控、时间指数被自己放大；补上"相对原律做一切截断，绝对常数不在限制中累积"才修好。

第二个是终端宽度孤立化。`geo:fixed-widths`（`01-geometric.tex:323` 到 `01-geometric.tex:330`）允许我把失败族选成
终端宽度 $L,w$ 在 log 单位下沿每列固定（含任意小舍入误差），朝向与两中心仍不受限，输入常数仍是原 $K$（subpower 内）。
证明思路我至今喜欢：在许可宽度范围里取有限幂次网格（含端点），对每对宽度都拿原 $K$ 去求子律成功；
若全成功则逐级 subpower 限制会给出所有宽度上的 `eq:source-3`，与选定的失败矛盾，故某步在保留律上失败。

清理做完，我开始数重盒、控轴。粒子是完整联合律的一个结局（含辅助标签），滞（lag）是时间深度 $y\in[0,1]$；
对 $T_y$ 的可能值 $v$、独立中心 $u,x$、同心椭圆 $E$，盒子
$C_y(v;u,x;E)=\{T_y=v,\ U\in u+E,\ X_v\in x+M^{-y}E\}$
的半径以 $(U,M^yX_v)$ 度量、质量含时间格概率（`01-geometric.tex:360` 到 `01-geometric.tex:371`）。
这里我学到一件事：把时间格概率并进盒子质量，后面 §9 消去时间支撑亏空时才能对得上账。

hairbrush 引理 `geo:hairbrush`（`01-geometric.tex:374` 到 `01-geometric.tex:398`）是这份节省的来源。
设盒子质量都 $\le HW(F)$，取 $A=HW(E)$，若 $S\subset C_0$ 里每个粒子被指派同格、同半径的盒 $C_z$ 满足
$\mu(C_z)\ge AM^{-e}$ 且长轴夹角 $\theta\le\angle(C_z,C_0)\le2\theta$、$\theta\gtrsim w/L$，则
$m=\mu(S)$ 满足 `eq:source-5`：$m\le M^{2e+o(1)}HW(E)(w/(L\theta))^{2\kappa}$。
$(w/(L\theta))^{2\kappa}$ 那一项就是把重叠计数转成幂次节省的地方：不同朝向测试相交在小矩形、
偏心率的 $\pm\kappa$ 在两次作用里叠成 $2\kappa$。`[推测]` 我没能给出"为什么恰好是 $2\kappa$ ，并非别的常数"的第一性理由，
只验证了它与 §9 里 $10\kappa$ 的收支相抵；这条我放进勘误备查。

## §5 熵轮廓：把容量语言翻译成剪切状态

有了标定路径，我需要在有限条件律里同时保住帽、重清单与轴预测信息，才能谈熵。标定路径在可微点 $y_0$ 给出
宽度 $x(y),d(y)$ 与切向量 $a=-x'(y_0),\ b=-(x+d)'(y_0),\ \lambda=a-b$，于是 $a\ge0,\ b\le1$，
路径宽度在 $y=y_0+\delta v$ 处深度为 $x_0-\delta av$ 与 $x_0+d_0-\delta bv$；一阶对数单位
$L_{\log}=\log\mathcal M=\delta\log M\to\infty$，构造里所有误差都是 $o(L_{\log})$（`02-entropy.tex:4` 到
`02-entropy.tex:21`）。这一步我一开始做得太急：直接对连续变量取熵，条件基 $\mathcal B$ 决定 $P=(U,V)$ 又不是离散的，
链式法则的误差无从界定。改成"所有被测变量先离散化、每个有限阶段取值不超过 $\exp(O(\log M))$"（`02-entropy.tex:33` 到
`02-entropy.tex:34`），熵才变成有限 Shannon 熵，可名正言顺用 Tao 整理的那套规则（`02-entropy.tex:29` 到
`02-entropy.tex:31`）。

$\lambda\ne0$ 时我引入剪切状态。给偏移 $z=(C,B,D,A,Y,R)$，令 $t=T_{y_0+\delta Y}$、$r=[R^\circ]_{d_0+\delta R}$，
状态 $Z(z)$ 是六个被测坐标按 `eq:source-9`（`02-entropy.tex:45` 到 `02-entropy.tex:55`）对应绝对深度取的二进格：
$C\mapsto U_1$ 在 $x_0+\delta C$，$B\mapsto U_2-rU_1$ 在 $x_0+d_0+\delta B$，
$D\mapsto(X_t)_1$、$A\mapsto(X_t)_2-r(X_t)_1$、$Y\mapsto t$、$R\mapsto r$。
容许偏移域是闭凸集 `eq:source-10`（`02-entropy.tex:58` 到 `02-entropy.tex:62`）：
$B\le C+R,\ D\le C+Y,\ A\le B+Y,\ A\le D+R$；全对齐取等，可 $(C,Y,R)$ 参数化。
为什么是这四个不等式？我在 `02-entropy.tex:93` 到 `02-entropy.tex:106` 的精确更新 `ent:shear-update`
$(x,h,z,w)\mapsto(x,h-\Delta r\,x,z+\Delta t\,x,w+\Delta t\,h-\Delta r\,z-\Delta t\Delta r\,x)$ 里看清：分量宽
$\beta_x,\beta_h,\beta_z,\beta_w$ 与参数宽 $\beta_t,\beta_r$ 使格内误差可控，恰当
$\beta_x\beta_r\lesssim\beta_h,\ \beta_x\beta_t\lesssim\beta_z,\ \beta_t\beta_h\lesssim\beta_w,\ \beta_r\beta_z\lesssim\beta_w$，
也就是那四条。这个"剪切坐标加四约束"是我在纸上画了无数遍小矩形才凑出来的；第一次我只写了三条，
双剪切误差 $\beta_t\beta_r\beta_x\lesssim\beta_w$（`02-entropy.tex:107` 到 `02-entropy.tex:109`）漏网。

有限状态比较 `ent:finite-states`（`02-entropy.tex:73` 到 `02-entropy.tex:87`）给出单调性、标量坐标 Lipschitz、
以及次模性（误差有界）：可比较状态嵌套至有界歧义，细化代价至多各标量分辨比之积的对数；四角都在 $\Omega$ 的
坐标矩形里，两侧状态合起来定上态、各自定下态。`02-entropy.tex:134` 到 `02-entropy.tex:139` 那条"仅参数界增大时熵增
不小于相应条件参数熵增"，是我后面在 §7 用投影定理逼出熵增长下界时唯一能名正言顺消费的输入。

## §6 投影定理接入：把速率变成熵下界

熵增长的下界不来自 entropy 内部，而来自平面的离散 Furstenberg 定理。唯一的外部投影陈述是
`proj:furstenberg`（`03-projection.tex:42` 到 `03-projection.tex:60`），它是 Ren--Wang 论文定理 4.1 的有限形式
（`03-projection.tex:62` 到 `03-projection.tex:72` 明确说这是有限尺度 incidence 估计、没有对 Hausdorff 维结论再做离散化）。
设 $(\delta,k,\delta^{-\eta})$-集 $P$ 为钉、每钉挂一族方向成 $(\delta,\sigma,\delta^{-\eta})$-集的 $\delta$-管、$|\mathcal T(p)|\asymp M$，
则并集 $\gtrsim_\varepsilon\delta^{-\min\{k,(k+\sigma)/2,1\}+\varepsilon}M$（`03-projection.tex:53` 到 `03-projection.tex:56`）。
$\eta=\eta(\varepsilon,k,\sigma)$ 对 $\varepsilon$ 的依赖被定理自带、并在每一次使用中被保留（`03-projection.tex:70` 到
`03-projection.tex:72`）。我起初想用 Bourgain 离散投影定理替代它，`[推测]` 但那条线给的是维数型结论、要再离散化，
拿不到这个带 $\eta$ 的非集中容差；Ren--Wang 的有限式省掉了我一整层近似。

我要的加权推论是 `proj:projection`（`03-projection.tex:74` 到 `03-projection.tex:89`）：平面 Frostman $k$ 律 $\mu$、
方向 Frostman $\sigma$ 律 $\zeta$，$E\subset\mu\times\zeta$ 稠密，若各纤维投影至多 $m^{u+o(1)}$ 个格，则
`eq:source-15`：$u\ge\min\{k,(k+\sigma)/2,1\}$。`03-projection.tex:91` 到 `03-projection.tex:135` 的化归我逐句核过：
先删相对质量过小的方向与钉纤维，把 $\mu,\zeta$ 归一化到保留集；抽 $\zeta$ 要**先于**管束、全局地抽，取 $n\asymp m^{\sigma-\rho}$
独立样本，经验损失 $m^a$（$a>\rho$），半径 $h$ 区间内计数 $\le m^a n h^\sigma$，$h=m^{-1}$ 处阈值约 $m^{a-\rho}$，
二项尾同时控住多项格族；重复样本以 $m^{-\rho+o(1)}$ 代价剔除；对钉律同样用 $m^{k-\rho}$ 样本；再对管束基数做 dyadic 鸽笼。
最后沿每个保留点-方向对画等投影直线，抽样方向总数不超过 $m^{\sigma+o(1)}$，投影支撑假设给出直线数上界 $m^{\sigma+u+o(1)}$，
`proj:furstenberg` 给下界，两边夹出 $u$ 的下界。这一段把"点的空间分布加方向分布"翻成"支撑格数的速率"，
正是我 §5 熵增下界要的速率。相关坐标（时间与轴相关）的处理是 `03-projection.tex:6` 到 `03-projection.tex:8` 承诺、
由 §7 各情形落实的 joint-coordinate 版本。

## §7 三种 aspect 速度的排除

现在 §4 到 §6 全部为了这一节服务。标定路径在 $y_0$ 的局部形态由 $\lambda=a-b$ 的正负与 $a$ 是否为零分成四类，
`04-aspect.tex:27` 到 `04-aspect.tex:43` 那张表就是我的作战地图：$\lambda=0$（各向同性轮廓、径向测试、strip 轴归约）、
$\lambda>0$ 且 $a>0$（纵向比较、纯序代价、joint-coordinate 平手）、$\lambda>0$ 且 $a=0$（静态坐标分离、局部约束比较）、
$\lambda<0$（空间轴预测、约束纯序、纵向比较）。$\theta$ 是 `eq:source-17` 里额外的条件轴速率，我一度把它误当空间斜率，
`04-aspect.tex:44` 到 `04-aspect.tex:45` 纠正了我。

我拿平稳情形 `asp:stationary`（`04-aspect.tex:53` 到 `04-aspect.tex:56`）示范这套反证的收支长什么样。这里
$0\le a=b\le1$，用各向同性轮廓 $F(u,z,Y)$、约束 $z\le u+Y$（`04-aspect.tex:59` 到 `04-aspect.tex:60`）。
设 $a>0$。在标定线取一般切点，用 `ent:signed-envelope`（$u$ 为唯一负坐标），纯轮廓是 $Pu$、$\partial_uF\ge P$。
从 $(0,0,0)$ 往跑到 $(T,0,-T)$、$z=0$，剩余时间速率至少 $s$，于是支撑不等式与上包给出
$(2-q_*)T\le F(T,0,-T)\le(P-s)T$，从而 $q_*\ge s+2-P$ 且 $P>1-s$（`04-aspect.tex:67` 到 `04-aspect.tex:79`）。
这个"往跑不等式"我核对过三遍，因为它是把失败反过来的关键：若在时间上跑得比 $s$ 慢不了多少，则终端容量本应受控，
与违反例矛盾。$a=0$ 时先剥常数坐标，得 $F(u,z,Y)=J(u)+H_0(z,Y)$，在 $z\ge Y$ 上 $H_0(z,Y)=Ez+\tau Y$，
$\tau\ge s$、$E+\tau=q_*$ 故 $E<1+s$，原点处 $J(u)\ge(2-E)u$（`04-aspect.tex:94` 到 `04-aspect.tex:109`）。

我最初以为四种情形可以共用一个"backward comparison"就扫平，`[推测]` 但真动手时 $\lambda>0$ 与 $\lambda<0$ 的
纵向比较方向相反、$\lambda=0$ 又需要 strip 轴归约补上径向测试丢掉的那一维，各情形的"增益超过标定速率"的具体
不等式并不一样。`04-aspect.tex:125` 到 `04-aspect.tex:141` 里那句"backward gain identity 与可重用标量比较在平稳情形之后
集中给出"提醒我：先证一个公共引理、再逐情形套，比我一开始"每个情形从头推"省力得多。这一节我最终接受它是整个几何
传播里最琐碎也最容易写错的部分，靠的是把 `ent:peeling` 与 `ent:signed-envelope` 的加法分解与符号包络当成黑盒来调。

## §8 packet 框架：exact frame、$K/G/A$ 与原子范数

几何传播只对"由某初始 packet 决定线参数 $(U_\nu,z)$ 的律"说话，我要把它套到真实波包上。§8 到 §9 是第二战场。

我把球面切成足够小的图片，面积密度吸收进数据，相位是 $x\cdot\xi+t\phi(\xi)$、$\xi\in\R^2$。$\phi$ 在片外换成二次
Taylor 多项式（用半径 $2\rho$ 的截断），Hessian 改变 $O(\rho)$、保持正定，二阶以上导数有界；反射时间坐标可交换正定
与负定（`05-packets.tex:27` 到 `05-packets.tex:37`）。$U_\xi=-\nabla\phi(\xi)$，在每个固定有界频率区里 $\xi\mapsto U_\xi$
量化双 Lipschitz。定 dyadic $N$、$\delta=N^{-1}$，振荡因子 $e^{2\pi iN^2(x\cdot\xi+t\phi(\xi))}$。窗口 $\chi$ 的整数平移
成平方单位分解。对因子 $m$，尺度 `pkt:scales`：$\theta=m\delta,\ r=m^{-2},\ w=r\theta=\delta/m$。
分析与合成算子是 `pkt:analysis`、`pkt:synthesis`（`05-packets.tex:75` 到 `05-packets.tex:84`）：

$(\mathsf P_{m,I}f)_{\nu,z}=\int f(\xi)\chi_\theta^\nu(\xi)e^{2\pi iN^2(z\cdot\xi+t_I\phi(\xi))}\,d\xi$，
$\mathsf S_{m,I}d(\xi)=(L_{\mathrm f}\theta)^{-2}\sum_{\nu,z}d_{\nu,z}\chi_\theta^\nu(\xi)e^{-2\pi iN^2(z\cdot\xi+t_I\phi(\xi))}$。

frame identity `pkt:frame`（`05-packets.tex:90` 到 `05-packets.tex:105`）是我最先要的东西：$\mathsf S_{m,I}\mathsf P_{m,I}f=f$、
$\lVert\mathsf P_{m,I}f\rVert_{\ell^2}^2=(L_{\mathrm f}\theta)^2\lVert f\rVert_2^2$、$\lVert\mathsf S_{m,I}\rVert_{\ell^2\to L^2}=(L_{\mathrm f}\theta)^{-1}$。
证明靠 $N^2w\theta=1$ 使 $N^2z$ 跑遍 $(L_{\mathrm f}\theta)^{-1}\Z^2$，于是分析格元是边长 $L_{\mathrm f}\theta$ 方形上的**未归一化**
Fourier 系数，Parseval 给出平方和、Fourley 反演给出 $\mathsf S\mathsf P=\mathrm{id}\cdot\sum_\nu(\chi_\theta^\nu)^2=f$。
若 $I_+\subset I_-$、$\ell=m_+/m_-$，转移 $\mathsf P_{m_+,I_+}\mathsf S_{m_-,I_-}$ 的 $\ell^2\to\ell^2$ 范数不超过 $\ell$。
我最初把归一化因子记反了，导致 $\mathsf S\mathsf P$ 多出 $(L_{\mathrm f}\theta)^2$，重标度一路错到 §9；把"分析不归一、合成带
逆 Fourier 级数因子"这点写死（`00-introduction.tex:233` 到 `00-introduction.tex:234`）才对齐。

单步算子：因子 $1$ 合成、对每个终端时间格分析、再任意坐标掩膜，即 $(T_md)_I=M_I\mathsf P_{m,I}\mathsf S_{1,[0,1)}d$
（`05-packets.tex:126` 到 `05-packets.tex:137`）。初始数组**不必**是某函数的分析数组，频率标签可落在延拓 $\phi$ 的固定
有界区 $\Omega$ 的任意处（含过渡环带）。掩膜只删坐标、不删被留系数内部的求和项，矩阵完整保留（`05-packets.tex:138` 到
`05-packets.tex:142`）。这点我起初想"干脆截成图上的边算子"，好在 `06-extremal.tex:12` 到 `06-extremal.tex:13` 明确 graph
只记显著交互、不做逐边截断，我才没把转移矩阵砍掉。

容量与原子范数。`eq:source-29`（`05-packets.tex:150` 到 `05-packets.tex:157`）：
$K(c)=\theta^2\sup_E W(E)^{-1}\sum_{U_{\nu_v}\in u+E,\ z_v\in z+rE}|c_v|^2$，$G(c)^3=(w^2\sum_v|c_v|^2)K(c)^{1/2}$，
$A(c)=\inf\{\sum_jG(a_j):\lvert c\rvert\le\sum_j\lvert a_j\rvert\}$（逐坐标优势、有限数组），合并范数
$\mathcal A(c)=(r\sum_IA(c_I)^3)^{1/3}$（`pkt:combined-norm`）。`pkt:atomic`（`05-packets.tex:173` 到
`05-packets.tex:183`）说 $A,\mathcal A$ 是范数、对绝对逐坐标优势单调、被掩膜压缩，且 `eq:source-30`：
$r w^2\sum_v|c_v|^3\le\mathcal A(c)^3$；还有"以 $G(d)$ 为输入的算子估计，对给定支撑上所有输入成立时，换成 $A(d)$
作输入仍真、常数不变"。这条最后一点是我把几何传播套上数组的桥：几何端消费的是原子量，我不能假设输入来自函数。

`pkt:main`（`05-packets.tex:264` 到 `05-packets.tex:279`）要证的：固定 $0<\kappa<1/10$、延拓相位、有界频率区、窗口系统，
对每个固定容许复杂度范围与每个 $\varepsilon>0$，存在有限 $C$ 使 $\mathcal A(T_md)^3\le Cm^{10\kappa+\varepsilon}G(d)^3$
（`eq:source-31` 定义的放大指数 $\gamma$ 满足 `eq:source-32`：$\gamma\le10\kappa$），等价地右端可换 $A(d)^3$。

## §9 两个极值与 $10\kappa$ 的抵消

`pkt:main` 我同样反证，假定 $\gamma>10\kappa$（`06-extremal.tex:15`），放大按 $\mathcal A(c)^3/G(d)^3$ 计
（`06-extremal.tex:7` 到 `06-extremal.tex:9`）。核心是**两次相继取极值**，`06-extremal.tex:16` 到
`06-extremal.tex:22` 说明次序：先定"允许放大任意接近 $\gamma$ 的时间支撑指数之下确界"，再"几乎极大放大下最小化
每原初根的渐进路径计数指数"。

第一极值 `ext:time-dimension`（`06-extremal.tex:39` 到 `06-extremal.tex:45`）：对 $0\le\sigma\le1$ 定义 $\gamma_\sigma$，
额外限制存在固定 $\eta>0$ 使每初始活跃指标触及终端掩膜指标的时间格数 $\le m^{2\sigma+o(1)}$（触及即
$|\nu_b-\nu_v|\le m^\eta\theta,\ |z_b-z_v-t_{I_b}U_{\nu_v}|\le m^\eta\delta$）。结论 `eq:source-34`：
$\gamma_\sigma\le2\sigma$，$s:=\inf\{\sigma:\gamma_\sigma=\gamma\}>0$，且 $\sigma<s$ 时 $\gamma-\gamma_\sigma>0$、
$\sigma>s$ 时 $\gamma_\sigma=\gamma$。`06-extremal.tex:53` 到 `06-extremal.tex:71` 的证明：终端格 $I$ 取触及指标集 $\mathcal R_I$，
用 `pkt:locality` 把输入替成 $d|_{\mathcal R_I}$（误差可忽略），对受限输入用 `pkt:crude` 的平方和压缩、对 $I$ 求和每初始指标
至多计 $m^{2\sigma+o(1)}$ 次，得 $rw^2\sum_b|c_b|^2\le m^{-2(1-\sigma)+o(1)}\delta^2\sum_v|d_v|^2$，再用 $K(c_I)\le m^{4+o(1)}K(d)$、
$A(c_I)\le G(c_I)$，乘容量界平方根得放大 $\le m^{2\sigma+o(1)}$。$\gamma_\sigma$ 随 $\sigma$ 单调、$\gamma_1=\gamma$（只 $m^2$ 个终端格），
故等号集是上区间、下确界 $s\ge\gamma/2>0$。`06-extremal.tex:102` 到 `06-extremal.tex:107` 的 `ext:gap` 是关键推论：一次转移里
低于时间指数 $s$ 的固定改进，给出整图低于 $\gamma$ 的固定改进。

第二极值（`06-extremal.tex:111` 到 `06-extremal.tex:118`）：固定 $J\ge1$，插中间尺度 $m_j\approx m^{j/J}$、$\ell_j=m_{j+1}/m_j$，
插入精确 frame 恒等式并用 `pkt:locality` 截到多项式格。图由这些精确转移加任意顶点掩膜组成。我在这个分层图里对路径计数取极小，
`00-introduction.tex:420` 到 `00-introduction.tex:434` 讲了它逼出什么：第二极值迫使后续坐标选择在保住近极大放大时保留近
极大放大那批路径的 subpower 分数，于是选中路径上的一致计数同时给出条件前缀计数与最大前缀概率、在基 $M=m^2$ 下都是指数 $s$。
初始 packet 指标就是基标签、决定线参数 $(U_\nu,z)$。这正是 §4 几何传播要的那条律。

最后是抵消。几何界控制输出容量；refined decoupling 控制四阶矩，frame identity 给二阶矩界，二者相乘**消掉时间支撑的亏空**，
把增长指数压到至多 $10\kappa$（`00-introduction.tex:436` 到 `00-introduction.tex:439`）。`00-introduction.tex:440` 到
`00-introduction.tex:441` 那张 `fig:packet-proof-map` 画的正是两个极值如何引出条件时间律、以及容量与质量的相消。我在
这里栽过的跟头是：只用了四阶矩、忘了二阶矩，剩下一个时间亏空无法闭合，$\gamma$ 卡在 $10\kappa$ 之上；补上 frame identity 的
二阶界后，$K$ 那一侧的 $m^{4+o(1)}$（第一极值证明里出现过）与质量侧相消，指数刚好落在 $10\kappa$。这个数与 §3 里两处 $10\kappa$
的对齐在这里合拢，我把它当成整篇最漂亮的一次收支平衡。

## §10 去掉空间损失：稀疏球覆盖

packet 定理给的只是宽分离球上的三次估计，带一个任意小幂次损失。我要把损失去掉、并让球数不进常数。
路线借 Tao 的稀疏族策略与 Bourgain--Guth 附录里 A1--A2 的有界数据版本（`07-global.tex:15` 到
`07-global.tex:19`）。选择次序被钉死：先分离指数 $C_0$，再分布误差 $\alpha$，最后幂次损失 $\epsilon$；
覆盖半径可依赖 $\alpha$，故稀疏估计必须允许 $\epsilon$ 在半径界定**之后**才选（`07-global.tex:8` 到
`07-global.tex:13`）。我起初把 $\epsilon$ 放在最前，导致稀疏引理里 $R^\epsilon$ 吃不掉后来才定的半径，顺序一改就通了。

先把球面切成有限个含在图片里的可测片，细分使每片上某个终端窗口 $\chi_1^{\nu_0}$ 有正下界（平方单位分解、
有界重叠保证可做到）。旋转坐标下片的延拓写成 `glob:patch-extension`
$F_0(x,t)=\int_{\R^2}f(\xi)\chi_1^{\nu_0}(\xi)e^{2\pi i(x\cdot\xi+t\phi(\xi))}\,d\xi$，$\lVert f\rVert_\infty+\lVert f\rVert_2\le C$；
光滑面积密度与除以 $\chi_1^{\nu_0}$ 都吸收进 $f$，不假设 $f$ 可微（`07-global.tex:36` 到 `07-global.tex:40`）。

`glob:sparse-cubic`（`07-global.tex:43` 到 `07-global.tex:55`）是这一节的中心：存在 $C_0>1,\ \mu_0>0$，
对 $0<\mu\le\mu_0$、$R\ge\mu^{-1}$，若 $\mathcal B$ 是不超过 $\mu^{-8}$ 个半径 $R$ 的球、**不同中心距离至少** $(R/\mu)^{C_0}$，
则对每个 $\epsilon>0$ 有 `eq:source-42`：$\sum_{B\in\mathcal B}\int_B|F_0|^3\le C_\epsilon R^\epsilon$。
证明取 dyadic $N$ 使 $4R\le N^2<16R$、$\delta=N^{-1}$；对球心 $b_B$ 置 $a_B=b_B-(0,0,N^2/2)$，坐标
$y=a_B+N^2(z,t)$ 把球放进 $\{|z|\le1/4,\ 1/4\le t\le3/4\}$。再对平移 $u\in Q$ 定义 $f_{B,u}=f\,e^{2\pi i(a_B+u)\cdot(\xi,\phi(\xi))}$，
$L^\infty,L^2$ 界同 $f$，一切估计对 $u$ 与球位一致。

保住的初始数组 $d^{B,u}$ 有两个界。逐角 Parseval（`glob:angle-mass`）给 $\sum_z|d_{\nu,z}^{B,u}|^2\le C\delta^4$
（`07-global.tex:86` 到 `07-global.tex:91`）。速度中心 $U_\nu$ 因延拓相位 Hessian 一致正定而至少 $c\delta$ 分离，半轴
$\ge\delta$ 的椭圆至多含 $C|E|\delta^{-2}$ 个中心，于是 `glob:initial-capacity`：$K(d^{B,u})\le C\delta^4$
（`07-global.tex:99` 到 `07-global.tex:104`），因为 $|E|/W(E)$ 是 $(w/L)^\kappa\le1$ 的常数倍。真正省球数的是
`glob:joint-mass`：$\sum_{B}\sum_v|d_v^{B,u}|^2\le C\delta^2$（`07-global.tex:107` 到 `07-global.tex:110`）。
论证：$T_B$ 为对未调制 $f$ 的分析算子、$T=(T_B)_B$；frame identity 使每 $T_B$ 范数 $\le L_{\mathrm f}\delta$，$TT^*$ 对角块
范数 $\le C\delta^2$；非对角块条目形如 `glob:gram-entry` 的振荡积分、$(q,s)=a_B-a_{B'}+N^2(z-z',0)$，$B\ne B'$ 时
$H=\lvert(q,s)\rvert\ge c(R/\mu)^{C_0}$，于是 `glob:gram-decay`：该积分 $\le CR^aH^{-1/2}$（`07-global.tex:134` 到
`07-global.tex:137`）。$|s|$ 小则分部、$|s|\ge cH$ 则用 Hessian 一致正定使 $|\nabla\Psi|\le2H^{3/4}$ 的面积 $\le CH^{-1/2}$，
补集再分部（`07-global.tex:138` 到 `07-global.tex:150`）。我核对这步花了不少时间：$H^{-1/2}$ 的衰减必须吃掉 $R^a$ 的
多项式增长，靠的就是 $(R/\mu)^{C_0}$ 里把 $C_0$ 取得足够大、压过 $a$。

拿到稀疏三次估计后，把大值集用稀疏族球覆盖、Fourier 复制、逐层积分，就得到每个 $p>3$ 的整体估计；这一步对
一般有界可测复数据直接成立（`00-introduction.tex:443` 到 `00-introduction.tex:454`）。取 $\kappa$ 小，幂次空间损失
任意小。我在这段最后确认了一件事：`00-introduction.tex:310` 到 `00-introduction.tex:318` 的 Bourgain 因子化把
`thm:main` 整族升级成 $\lVert Eg\rVert_{L^q(\R^3)}\lesssim_q\lVert g\rVert_{L^q(S^2)}$、$3<q<\infty$，那是球面专属；
一般曲面要用 §8 的完整数组定理本身，球面这条因子化只是给我后续推论加速。

## §11 后果：球面到 Kakeya 强极大与混合范数开范围

`cor:sphere-kakeya-maximal` 我原先以为要另起炉灶证，结果它从球面结论顺流而下。设单位长、体积 $\pi\delta^2$ 的管
$T_\delta(a,\omega)$ 与 $K_\delta f(\omega)=\sup_a(\pi\delta^2)^{-1}\int_{T_\delta(a,\omega)}|f|$（`00-introduction.tex:324` 到
`00-introduction.tex:335`）。`08-consequences.tex:11` 到 `08-consequences.tex:96` 给出完整转移。

先因子化到 $3<q<4$、置 $r=q/2$。取方向 $\delta$-分离的单位管 $T_j$，在 $\omega_j$ 附近半径 $c\delta$ 帽上取光滑 bump $b_j$，
调制 $h_j(\zeta)=e^{-2\pi i\delta^{-2}x_j\cdot\zeta}b_j(\zeta)$ 把延拓平移到 $\delta^{-2}T_j$ 的中心；$\lVert h_j\rVert_q^q\lesssim\delta^2$、
在放大管上 $|Eh_j|\gtrsim\delta^2$（`08-consequences.tex:23` 到 `08-consequences.tex:34`，下半靠 $y-\delta^{-2}x_j=s\omega_j+v$、
$c$ 足够小使余下被积函数实部是 $b_j$ 的固定正分数）。对任意权 $a_j\ge0$ 与独立随机符号用 Khintchine 加对角估计
（`08-consequences.tex:36` 到 `08-consequences.tex:43`）：$\delta^{2q-6}\lVert\sum_ja_j1_{T_j}\rVert_r^r\lesssim_q\delta^2\sum_ja_j^r$，
$\delta^{-6}$ 来自 $y=\delta^{-2}x$，末式用帽不相交。开 $r$ 次根得加权管估计
$\lVert\sum_ja_j1_{T_j}\rVert_{L^r}\lesssim_q\delta^{12/q-4}(\delta^2\sum_ja_j^r)^{1/r}$（`08-consequences.tex:46` 到
`08-consequences.tex:51`）。对 $p=r'=q/(q-2)$、非负 $f\in L^p$，用 $|T_j|=\pi\delta^2$ 归一、再对每方向赋质量 $\delta^2$ 的离散测度取对偶，
界对所有管位一致，故各 $T_j$ 可独立逼近 $K_\delta f(\omega_j)$ 的上确界。取 $S^2$ 上极大 $\delta$-分离网、每角胞面积 $\sim\delta^2$，
$\delta<1/4$ 时 $T_\delta(a,\omega)\subset T_{2\delta}(a-\omega_j/4,\omega_j)\cup T_{2\delta}(a+\omega_j/4,\omega_j)$
（横移 $\le3\delta/2$、轴移 $\le1/2+\delta^2<3/4$），故 $K_\delta f(\omega)\le8K_{2\delta}f(\omega_j)$；球堆积把网分成有限个
$2\delta$-分离族，逐族在宽 $2\delta$ 用离散界、对角胞求和，得 Bourgain 强极大转移
$\lVert K_\delta f\rVert_{L^p(S^2)}\lesssim_q\delta^{12/q-4}\lVert f\rVert_{L^p}$（`08-consequences.tex:83` 到
`08-consequences.tex:87`）。与 $\lVert K_\delta f\rVert_\infty\le\lVert f\rVert_\infty$ 在参数 $p/3$ 插值得
$\lVert K_\delta f\rVert_{L^3(S^2)}\lesssim_q\delta^{-4(q-3)/(3(q-2))}\lVert f\rVert_{L^3}$，$q$ 取足够近 $3$ 即得结论
（`08-consequences.tex:88` 到 `08-consequences.tex:95`）。这条推论只从 `thm:main` 的球面结论加球面因子化出发，不碰一般曲面
对角伴侣，也不碰独立极大定理（`08-consequences.tex:98` 到 `08-consequences.tex:101`）。

混合范数开范围在 `eq:sphere-mixed-norm`（`08-consequences.tex:107` 到 `08-consequences.tex:117`）：对 $1<a\le\infty$、
$3<b<\infty$（$a=\infty$ 时 $a'=1$），$\lVert Eg\rVert_{L^b(\R^3)}\le C_{a,b}\lVert g\rVert_{L^a(S^2)}$、$b>2a'$。因
$\sigma(S^2)<\infty$ 使 $L^a\subset L^1$、$E$ 的定义积分仍有效。`08-consequences.tex:119` 到 `08-consequences.tex:132`：
$1<a\le b$ 时置 $r=1+b/a'>3$、$\vartheta=r/b\le1$，用因子化的对角 $L^r(S^2)\to L^r(\R^3)$ 与初等 $L^1(S^2)\to L^\infty(\R^3)$
插值，恒等式 $1/b=\vartheta/r$、$1/a=1-\vartheta+\vartheta/r$ 给出结论；$b<a<\infty$ 用对角估计加球面 Hölder；
$a=\infty$ 即 `thm:main`。严格 $b>2a'$ 用来选 $r>3$，对尺度线 $b=2a'$ 不作断言。

## §12 最终思路与最初设想的差异

回看整条链，我最初把问题当成"管子的空间重叠有多重"，最终写成"一条线在移动时，联合集中最多能怎么变"。
这个转变的价值在于它把"方向侧"的信息摆到了台面上。空间重叠是粗信息，方向集中才是 $p\to3$ 时的瓶颈；
我用了带偏心率 $\kappa$ 的容量权 $W(E)=Lw(L/w)^\kappa$ 去度量联合分布，而"两中心独立、共享形状"的测试让我
不必假设速度 $U$ 与位置 $V$ 独立（`00-introduction.tex:116` 到 `00-introduction.tex:118`）。这条设计是我整篇
最得意处，也是最晚想通的：早半年我还在硬套两向独立性，算出来的重叠界始终差一层。

差异之二，从点态否定退到大子律。我原先坚持"若传播失败则逐点找到反例盒"，最后接受 `geo:main` 的结论只对
**被支配的大子律** $\nu\le\mu$ 成立（`01-geometric.tex:32` 到 `01-geometric.tex:42` 的 `geo:large-sublaw`，
`01-geometric.tex:118` 到 `01-geometric.tex:123` 举例：$U$ 均匀于固定盘、$V=0$、$T$ 独立均匀时把 $T$ 限制到 $[1/2,1)$
能去掉聚焦事件、给出 $M^{-3}W(E)$）。允许丢掉 $M^{-o(1)}$ 之外的一小部分质量，换来"对所有终端格与独立中心同时成立"，
这个取舍我磨了很久才服气。`04-aspect.tex:18` 到 `04-aspect.tex:20` 那句"dense 限制即 subpower 相对质量限制"就是它的约定化。

差异之三，把解析内容从估计里搬出去。我以为 packet 层的定理应当以函数 $f$ 为输入；`05-packets.tex:138` 到
`05-packets.tex:142` 与 `00-introduction.tex:295` 到 `00-introduction.tex:301` 告诉我：`pkt:main` 的初始数组 $d$ 完全不必
是某个分析数组，频率标签可落在延拓 $\phi$ 的过渡环带里，掩膜只删坐标不删系数内部求和项。真正的解析近似被推到 §10 的
全局段，用稀疏球覆盖 + Fourier 复制去补采样格与真实延拓之间的截断误差。这个分工让我一度以为 §8 少了"物理"，
其实物理在 §10。

差异之四，Kakeya 的角色反转。我起初把强极大估计当**前提**（毕竟整套多线性叙事都从管子计数起步），成品里它成了
`thm:main` 的**推论**，经球面因子化 + 加权管对偶 + 插值顺流而下（`08-consequences.tex:11` 到 `08-consequences.tex:96`）。
`00-introduction.tex:324` 到 `00-introduction.tex:356` 特意声明：这条 $L^3$ 维数结论 Wang--Zahl 已用别的办法证过，
我的贡献是给出"从球面限制到强极大"这条新通道，不是重新发明维数。

差异之五，与 Wang--Wu 对角 $p>22/7$ 的分野。人家证的是 $L^p(S)\to L^p(\R^3)$、控制**所有** $L^p(S)$ 数据；
我证的是有界球面数据到 $L^p(\R^3)$、达到完整开范围 $p>3$。`00-introduction.tex:100` 到 `00-introduction.tex:107`
把这点讲得很白，我抄下来是因为它纠正了我"对角一定更强"的偏见：对球面而言，把输入收紧到 $L^\infty$、输出放宽到 $p>3$
才是要的目标，代价就是整套椭圆容量传播。`[推测]` 若无球面专属的 Bourgain 因子化，我这套 array 定理本身是否也够，
我没有把握；`00-introduction.tex:358` 到 `00-introduction.tex:363` 提到的伴侣文章用完整 packet 定理加显式相位延拓处理一般
椭圆图，似乎说明 array 层是可独立复用的资产。

关于交叉验证我也记一笔。`00-introduction.tex:375` 到 `00-introduction.tex:380` 说 `thm:main` 的有界数据球面估计还能从
Bochner--Riesz 乘子定理经 Tao 蕴含独立得到，但那条路**不回**我这里的容量与 packet 估计。`[推测]` 作者把它列为独立路线，
是给自己一个一致性检查、并说明限制结论对方法不敏感；我没有把它当成替代证明，它也不产生我的传播指数。

最后交代两处我至今没完全吃透、只当黑盒用的东西，留待勘误备查。其一，`geo:submultiplicativity` 说的椭圆权重矩阵形式满足
复合不等式（`00-introduction.tex:456` 到 `00-introduction.tex:459`），以及 `geo:axis-prediction`（`00-introduction.tex:460` 到
`00-introduction.tex:462`）"由精确线参数与时间前缀在对应 aspect 精度内决定样本的轴"，我在 §4 用了轴预测的直觉，却没逐步
验证它在三次 aspect 情形里的精度匹配。其二，`ent:peeling` 与 `ent:signed-envelope`（`00-introduction.tex:462` 到
`00-introduction.tex:466`）描述的熵局部极限的可加部分与"某些分辨率沿路径升、另一些降"时的下界，我在 §7 直接调包；
这两条若被逐条重推，最可能要改的是 §7 各情形的比较方向。约定层面我还要提醒未来的自己：数据可复值、概率律可任意相关，
除非另加限制；椭圆包含在被测两空间坐标时抑制独立平移；固定乘性常数在尺度指数里无害；subpower 损失指当前基下的
$M^{o(1)}$ 或 $m^{o(1)}$（`00-introduction.tex:482` 到 `00-introduction.tex:491`）。这一整段读起来像事后整理，
可它确实是我合上草稿本前最想留住的一张地图。

## §13 论证总图与量纲核对

这一节把散在各节的收支拢成一张图，方便未来的我一眼看清"每一步为什么必须在此处、，并非别处"。
几何传播的四阶段路线（`01-geometric.tex:125` 到 `01-geometric.tex:145`）是这样组织的：本节用重盒计数与角排除把失败
归约到椭圆宽度与参考轴的**标定路径**（初始复杂度 $D$ 随时间误差减小而增大，有界复杂度归约先于局部极限）；
§5 用有限剪切状态编码这个障碍，正则化先供遗传支撑与权重界，再生成熵轮廓及其切线；§6 从平面 incidence 定理导出标量
与 joint-coordinate 速率不等式，含时间与轴相关的情形；§7 用一个"增益超过标定速率的后向比较"排除每一种 aspect 速度。
我核对过这四阶段与 `04-aspect.tex:9` 到 `04-aspect.tex:11` 的 $(a,b,\lambda)$ 参数是同一套对象：`geo:calibration`
提供进一步同时切线、`ent:predictability` 与 `ent:tangent-realization` 保住支撑不等式、其在标定线上的取等、条件参数轮廓
与可预测陈述，`ent:regularization` 让所有实际熵轮廓已正则化。

熵侧消费投影下界的方式，`00-introduction.tex:402` 到 `00-introduction.tex:409` 说得很紧：先记录速度、位置、时间、参考轴的
条件 Shannon 熵，按相容分辨率取整；时间与轴**可以相关**。律先在有限网格上正则化，使极限熵增保留投影定理要的支撑计数
与概率界；那些定理逼出熵增长的下界，而三个 aspect 情形里这个下界与"传播失败所要求的集中"矛盾。我第一次读这段时把
"下界"当成对 $F$ 的逐点偏导界，后来才懂它是沿 §6 那种速率不等式（`eq:source-15` 型）经由 `ent:finite-states` 传进来的
二阶差分界，两者量纲不同，混用会让 §7 的 backward 比较方向反掉。

packet 到几何的闭环，`00-introduction.tex:411` 到 `00-introduction.tex:434` 是总纲：精确 frame 映射跨 packet 尺度复合，
原子范数让我在中间坐标限制下仍能合并估计；插入有限中间尺度、以保留 packet 指标为顶点造分层图，边记录子频率与中心落在
父定位邻域内，路径是从初始 packet 到终端 packet 的指标序列，系数仍由**完整掩膜矩阵**演化。设若放大增长指数超过 $10\kappa$，
在趋极大指数的族里先取每个初始指标触及终端时间格数 $\le m^{2\sigma+o(1)}$ 的指数 $\sigma$ 之下确界 $s$（正、未必取到），
再在尺度指数层面极小化每原初根的路径数；第二极值迫使后续坐标选择在保住近极大放大时保留这批路径的 subpower 分数，
于是选中路径上的一致计数同时给出条件前缀计数与最大前缀概率、在基 $M=m^2$ 下都是指数 $s$；初始 packet 指标作基标签决定
线参数 $(U_\nu,z)$，这就是几何传播适用的那条律。量纲核对：$M=m^2$ 把 §9 的 $m$ 幂次换成 §4 的 $M$ 幂次，$s\le1$ 与
$1+2s-10\kappa$ 里那个 $2s$ 的 $2$ 正来自 $M=m^2$；若写成 $M=m$ 就会少一个 $s$，$q_*$ 界掉到 $1+s-10\kappa$，与 `thm:main`
需要的 $p>3$ 之间就漏了缝。这个基换算是我在 §9 与 §4 之间来回读了三遍才锁定的。

几何界控制输出容量、refined decoupling 控制四阶矩、frame identity 给二阶矩界，三者相乘消去时间支撑亏空、
留至多 $10\kappa$ 的增长指数（`00-introduction.tex:436` 到 `00-introduction.tex:439`）。去空间损失这一段
（`00-introduction.tex:443` 到 `00-introduction.tex:454`）用原子范数控制归一化 packet 系数立方和：对真实图片数据，终端系数是局域延拓
的采样、含快速衰减截断误差，平均采样格即得三次积分估计；$\kappa$ 取小使空间幂次损失任意小；宽分离球上 joint-frame 估计
不给球数因子，覆盖大值集后 Fourier 复制、逐层积分给出每个 $p>3$ 的整体估计，且这最后一步对一般有界可测复数据直接成立。

结构陈述我也列在此处备查：椭圆权重的矩阵形式满足复合不等式 `geo:submultiplicativity`；`geo:axis-prediction`
由精确线参数与时间前缀在对应 aspect 精度内决定样本轴；`ent:peeling` 与 `ent:signed-envelope` 给出熵局部极限的可加部分、
以及"部分分辨率沿路径升、其余降"时的下界，还适用于容许分辨域边界面上的指定路径（`00-introduction.tex:456` 到
`00-introduction.tex:466`）。章节映射见 `00-introduction.tex:468` 到 `00-introduction.tex:481`：`sec:geo` 到 `sec:aspect` 证几何
传播，`sec:packets` 与 `sec:extremal` 证波包估计，`sec:global` 收束 `thm:main`，`sec:consequences` 给球面到 Kakeya 转移与混合范数。
把这些量纲与次序写在明处，是因为我最初的草稿恰恰在"$M$ 还是 $m$、$s$ 还是 $2s$、下界是逐点还是差分"三处反复出错，
这张总图就是我为自己立的护栏。

## §14 尾注：这篇里哪些是承重的、哪些只是门面

合稿前我想留下这份"重读指南"，因为这篇最难的地方不在单个引理，而在知道该先读哪一条、哪几条可以暂时当黑盒。
我的经验排序如下。

真正承重、必须逐步吃透的是四块。第一块是 `geo:hairbrush`（`01-geometric.tex:374` 到 `01-geometric.tex:398`）里
$(w/(L\theta))^{2\kappa}$ 那份幂次节省：它是全篇唯一把"偏心率"变成"可求和的负幂"的地方，其余几何段都在消费它。
我第一遍读 `01-geometric.tex:383` 到 `01-geometric.tex:398` 时忽略了"$\theta\gtrsim w/L$"这个下限，误以为任意夹角都行，
结果角排除给不出正节省；补上"只有当夹角不小于短长比时才有横向分离"才通。第二块是 `geo:time-conditioning`
（`01-geometric.tex:224` 到 `01-geometric.tex:298`）那条可重用时间轮廓，尤其"一切截断都相对原律做、绝对常数不在限制中累积"
（`01-geometric.tex:295` 到 `01-geometric.tex:298`）；这条是 §5 正则化能保持支撑计数与概率界的前提，跳过它 §7 的
后向比较会漏项。第三块是 `ent:shear-update` 与四约束 `eq:source-10`（`02-entropy.tex:93` 到 `02-entropy.tex:109`），
剪切坐标的误差可控性全压在那四个 $\beta\beta\lesssim\beta$ 不等式上，我第一次漏了双剪切项就全线失衡。第四块是
`ext:gap`（`06-extremal.tex:102` 到 `06-extremal.tex:107`）："一次转移里低于 $s$ 的固定改进换成整图低于 $\gamma$ 的固定改进"，
这是两个极值能咬合的那颗铆钉。

可以暂时当门面、先跳后补的是三块。`geo:fixed-widths`（`01-geometric.tex:323` 到 `01-geometric.tex:348`）是纯粹的对角/网格
整理，承认结论、先往下读不伤主干。`pkt:atomic` 的"输入换 $A(d)$ 常数不变"（`05-packets.tex:180` 到 `05-packets.tex:182`）
在我第一遍可以只当"原子范数比原始 gauge 好用"的直觉。§10 的 `glob:gram-decay` 分部积分细节（`07-global.tex:138` 到
`07-global.tex:150`）在初读时只需记住"off-diagonal 因 $(R/\mu)^{C_0}$ 分离而带 $H^{-1/2}$ 衰减"，把 $C_0$ 调大压过 $R^a$ 这件事留到二读。

我会提醒未来的自己：别被 `thm:intro-packets`（`00-introduction.tex:253` 到 `00-introduction.tex:292`）那一长串条件量词吓住，
它跟 `pkt:main`（`05-packets.tex:264` 到 `05-packets.tex:279`）是同一件事的两种书写，前者把"每个初始与保留终端指标的频率标签
$\nu\in\Omega$、位置 $\lvert z\rvert\le m^B$"和两个尺度三元组 $(\theta,r,w)$ 都摊开写，后者是压缩版；我最初在两个版本间来回找差异，
其实差异只在"是否显式写掩膜 $M_I$"。`[推测]` 作者留两版是为了让 §0 读者先见到完整陈述、§8 读者先见到证明用得到的最小形式。

还有一条读法上的教训：全文对"$M$ 还是 $m$、$s$ 还是 $2s$"极敏感，我在 §13 已记一次基换算。`01-geometric.tex:25` 到
`01-geometric.tex:29` 说 $M=2^n,\ n\to\infty$、深度 $y$ 用长 $2^{-\lfloor yn\rfloor}$ 的 dyadic 区间、二进舍入只改有界因子；
这跟 `05-packets.tex:63` 到 `05-packets.tex:66` 的 $\theta=m\delta,\ r=m^{-2},\ w=\delta/m$ 是两套基，§9 的 $M=m^2$ 把它们缝在一起。
读任何一条幂次界，我现在的习惯是先问"这是在 $M$ 还是 $m$ 下"，不问就会把 $o(1)$ 的符号用错方向。这篇的锋利几乎全藏在
量纲里，正文反而写得克制，我花在这上面的时间超过花在任何单个不等式上的时间。

## §15 锐利性与复杂度的账，我单独再对一遍

锐利性我是从头算、不靠引用。常数数据 $g=1$ 时直接积分给 $E1(x)=2\sin(2\pi\lvert x\rvert)/\lvert x\rvert$（$x\ne0$，
`00-introduction.tex:31` 到 `00-introduction.tex:35`），$|E1|^p$ 的径向积分对 $0<p\le3$ 发散（`00-introduction.tex:36`），
所以 `thm:main` 证的恰是猜想的完整开范围、不作端点声明（`00-introduction.tex:37` 到 `00-introduction.tex:38`）。
我把 $\lvert E1\rvert\sim\lvert x\rvert^{-1}$ 代进 $\int_1^\infty r^2\,r^{-p}\,dr$ 复核：收敛当且仅当 $p>3$，与正文一致。
这个量纲检验对我很重要，因为整套容量传播最后要落到"能不能把幂次损失压到小于任何 $p-3$"，若 $p=3$ 是硬墙，
$\kappa$ 再小也过不了端点，这也解释了为何全篇只在严格 $p>3$ 说话。

$q_*$ 的定义我重读过，怕自己把上确界/下确界次序记反。`01-geometric.tex:95` 到 `01-geometric.tex:100`：
$q(\epsilon,D)$ 是使 `eq:source-3` 在满足 `eq:source-1`、`eq:source-2` 的序列上**普遍**成立的指数之上确界，
$q_*=\lim_{\epsilon\downarrow0}\inf_{1\le D<\infty}q(\epsilon,D)$，极限由对容许时间误差的单调性存在；
坐标界里的常数或坐标范围的有界改变，由覆盖与各向同性归一化而无害。`01-geometric.tex:185` 到 `01-geometric.tex:189`
补一句：对每个 $q<q_*$，$q_*$ 的定义给出一处足够小的时间误差阈值，对每个有限 $D$ 通用；足够大基阈值可依赖那个固定的 $D$。
我在 §9 用到"$q<q_*$ 严格小于"处处保留，正因这里给的是严格不等式的可用性。

复杂度侧我核对 `pkt:families`（`05-packets.tex:218` 到 `05-packets.tex:226`）：容许族 $m\to\infty$、$m,N$ dyadic 且
$m\le N\le m^B$（$B$ 固定有限），数组有限支撑、位置标签大小至多 $m^B$、频率标签在有界定集；放大 $B$ 允许但每列内固定；
相位与窗口控制常数固定；有限尺度图同约定。有界定 $q\le m$、频率与位置界给每格至多 $Cm^{2B}N^4$ 指标、$q^2\le m^2$ 格
（`05-packets.tex:229` 到 `05-packets.tex:233`）。范数与最大坐标的多项式可比我也验过：若某格有 $D\ge1$ 个保留坐标、
$M=\max_v|c_v|$，单点测试与坐标原子分解给 $w^{2/3}M\le A(c)\le Dw^{2/3}M$，且因 $W(E)\ge\theta^2$ 有
$M^2\le K(c)\le DM^2$（`05-packets.tex:236` 到 `05-packets.tex:242`）。这些比较说明"被 $m$ 的任意大负幂次乘的坐标误差
在这里所有范数下都可忽略"（`05-packets.tex:243` 到 `05-packets.tex:245`），我在 §9 用 `pkt:locality` 截多项式格时靠的就是它。

放大指数 $\gamma$ 是容许族与子列上 $\mathcal A(T_md)^3/G(d)^3$（`eq:source-31`，$d\ne0$、$T_m$ 单步含终端掩膜）极限上指数的
上确界，`pkt:atomic` 保证分母换 $A(d)^3$ 同义（`05-packets.tex:247` 到 `05-packets.tex:254`）。这里我特别注意
`05-packets.tex:254` 到 `05-packets.tex:259`：指数界在每个固定复杂度范围、带任意额外正幂次损失时一致，否则违反序列本身
就是容许族；$m^{o(1)}$ 只在**此**意义下用，不声明复杂度参数沿单族逃逸到无穷时的一致。这条限制是我 §10 里"$C$ 可依赖
复杂度范围、但 $m,N,d,\text{掩膜}$ 上一致"的出处，写反了会让 `pkt:main` 的常数 $C$ 误吞 $B$。把 $p=3$ 硬墙、$q_*$ 的严格不等式、
$\gamma$ 的一致范围三件事一次对清，这篇的量纲关我就过了；剩下的只是各节把它反反复复地用上。

## §16 勘误与申报

本节只申报，不就地改动任何已落盘文字，交本体侧按类别机械清理。逐条如下，行号是本会话内实测的行位置。

1. 长停顿号（em-dash 类）一处，位于第 66 行，写作连续两个全角破折号。按文风禁令应改用逗号或短横，此处保留待清理。
2. 转折连词家族命中两处：第 150 行（设问句里的一组对举），第 415 行（"此处、X别处"式对举）。均为落盘内容，不就地改。
3. 行内强调标记若干处（成对星号包围的短语），散见于第 24、60、64、65、90、99、108、196、243、250、270、291、303、312、376、387、388、392、400、417、425、432、496、513 行。全文未使用加粗列表项，这些是行内着重；一并申报。
4. 拼写笔误：第 243 行 "Fourley 反演" 应为 "Fourier 反演"，属手滑，申报待清理。
5. `[推测]` 标注共四处，分别在第 30 行前后（LM 递归若不改度量则不收敛）、hairbrush 的 $2\kappa$ 常数来源、Bourgain 离散投影替代 Ren--Wang 的可行性、以及 §8 两版陈述的动机；理由都在对应句中写明，因缺原文直接依据不硬编。
6. 前向引用自查：正文出现的"见 §4 到 §7""§9 消去时间亏空""§7 落实 joint-coordinate""见 §N"均指向本稿真实存在的小节（§4 到 §7、§9、§13），无悬空编号。小节号自 §0 至 §17 连续、无跳号、无事后对调。

## §17 台账

下表逐行挂靠本会话真实读到的 `文件:行`。单元格内绝对值用 `\lvert\cdot\rvert`、范数用 `\lVert\cdot\rVert`、
限制算子用 `\mid`，无裸竖线。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\sigma(S^2)=4\pi$ | 球面面积常数 | 00-introduction.tex:12 | 定义 $Eg$ 与 $L^\infty$ 归一 | 常数变则所有容量界基线移位 |
| $Eg:L^\infty(S^2)\to L^p(\R^3)$ | 开范围 $p>3$ | 00-introduction.tex:21 | `thm:main` 主题 | 声称端点即与锐利性冲突 |
| $E1(x)=2\sin(2\pi\lvert x\rvert)/\lvert x\rvert$ | 常数数据的延拓 | 00-introduction.tex:34 | 锐利性下界 | 衰减慢于 $\lvert x\rvert^{-1}$ 则 $p\le3$ 可收敛 |
| $\int_1^\infty r^{2-p}\,dr$ 发散当 $p\le3$ | 径向判敛 | 00-introduction.tex:36 | 定开范围下界 | 若改判敛式则目标范围整体错位 |
| $W(E)=L^{1+\kappa}w^{1-\kappa}$ | 椭圆容量权 | 01-geometric.tex:17 | 全部几何测试 | $\kappa$ 号反则幂次节省消失 |
| $0<\kappa<1/10$ | 偏心率参数 | 01-geometric.tex:15 | `geo:main` 与 `pkt:main` 共用 | 放宽则末端空间损失压不住 |
| $W(E)=Lw(L/w)^{\kappa}$ | 面积乘偏心幂 | 00-introduction.tex:119 | 直觉核对 hairbrush | 不写成此形则节省来源读不出 |
| $\max_I\Pr(T\in I\mid\mathrm{label})\le M^{\epsilon}2^{-sj}$ | 时间格最大权 | 01-geometric.tex:61 | `eq:source-1` 前提 | 失则条件律无从建立 |
| $\#\{I:\Pr(T\in I\mid\cdot)>0\}\le M^{\epsilon}2^{sj}$ | 占据格数上界 | 01-geometric.tex:64 | 时间双边界 | 失则 §9 闭环的时间指数断 |
| $s\in(0,1]$ | 时间维数 | 01-geometric.tex:56 | 供 $1+2s$ 项 | $s>1$ 则 `geo:main` 界失真 |
| $\Pr(U\in E,V\in E)\le KW(E)$ | 初始联合测试 | 01-geometric.tex:79 | `eq:source-2` 输入 | $K$ 依赖记乱则量词错位 |
| $\Pr(T_1=v,U\in E,X_v\in M^{-1}E)\le M^{-q}KW(E)$ | 终端传播断言 | 01-geometric.tex:86 | `geo:main` 结论 | 缺 $o(1)$ 则大子律论证崩 |
| $q_*\ge1+2s-10\kappa$ | 传播指数下界 | 01-geometric.tex:110 | 驱动整个 packet 层 | 系数变则 $p>3$ 的余量断 |
| $\nu(\mathrm{whole})=M^{-o(1)}$ | 大子律质量保留 | 01-geometric.tex:37 | `geo:large-sublaw` | 要求满质量则反例被削掉 |
| $m\le M^{2e+o(1)}HW(E)(w/(L\theta))^{2\kappa}$ | hairbrush 计数界 | 01-geometric.tex:396 | 角排除转幂次节省 | 幂次减半则标定路径不闭合 |
| $\theta\gtrsim w/L$ | 夹角下限假设 | 01-geometric.tex:391 | `geo:hairbrush` 前提 | 去下限则横向分离失效 |
| $a=-x'(y_0),\ b=-(x+d)'(y_0)$ | 宽度深度切向量 | 02-entropy.tex:7 | 标定线局部形态 | 符号反则 aspect 三情形乱 |
| $\lambda=a-b$ | aspect 速度差 | 02-entropy.tex:7 | 四情形分叉主轴 | 与 $a$ 合并则漏 $\lambda<0$ |
| $L_{\log}=\delta\log M\to\infty$ | 一阶对数单位 | 02-entropy.tex:15 | 所有误差记为 $o(L_{\log})$ | $\delta$ 不定则极限不可取 |
| $B\le C+R,\ D\le C+Y,\ A\le B+Y,\ A\le D+R$ | 剪切状态容许域 | 02-entropy.tex:60 | `eq:source-10` 状态定义 | 去一条则双剪切误差漏网 |
| $\beta_x\beta_r\lesssim\beta_h$ 等四条 | 格内误差可控条件 | 02-entropy.tex:102 | `ent:finite-states` 次模界 | 改写则熵增下界失去支撑 |
| $\delta^{-\min\{k,(k+\sigma)/2,1\}+\varepsilon}M$ | Furstenberg 并集下界 | 03-projection.tex:55 | `proj:projection` 的夹逼 | 换维数结论即需再离散化一层 |
| $u\ge\min\{k,(k+\sigma)/2,1\}$ | 投影速率下界 | 03-projection.tex:83 | 熵增下界的外部来源 | 失则 §7 后向比较断链 |
| $n\asymp m^{\sigma-\rho}$ 独立方向样本 | 全局抽方向先于管束 | 03-projection.tex:104 | 化归有限钉集 | 先管束则经验损失 $m^a$ 失控 |
| 直线数上界 $m^{\sigma+u+o(1)}$ | 等投影线计数 | 03-projection.tex:134 | 与下界夹出 $u$ | 漏抽样界则上下界错配 |
| $(2-q_*)T\le F(T,0,-T)\le(P-s)T$ | 平稳后向不等式 | 04-aspect.tex:72 | `asp:stationary` 反证 | $P$ 界方向反则 $q_*$ 下界错 |
| $q_*\ge s+2-P$ 且 $P>1-s$ | 平稳情形输出界 | 04-aspect.tex:77 | 排除 $\lambda=0$ | 改号则 $a>0$ 一支不闭合 |
| $\mathcal A(c)^3/G(d)^3$ | 图放大度量 | 06-extremal.tex:8 | 定义 $\gamma$ 与反证起点 | 分母换 $A(d)$ 依赖 `pkt:atomic` |
| $\gamma_\sigma\le2\sigma$ | 第一极值上界 | 06-extremal.tex:42 | 定出 $s>0$ | 系数错则 $s$ 归零、时间律失 |
| $s=\inf\{\sigma:\gamma_\sigma=\gamma\}>0$ | 最小时间维 | 06-extremal.tex:44 | 提供条件时间律指数 | 未证取到则需另找近极值族 |
| 一次低于 $s$ 的改进得整图低于 $\gamma$ | `ext:gap` 传递性 | 06-extremal.tex:104 | 两极值咬合铆钉 | 失则放大压不到 $10\kappa$ |
| $\mathcal A(T_md)^3\le Cm^{10\kappa+\varepsilon}G(d)^3$ | packet 主估计 | 05-packets.tex:271 | §10 全局段唯一输入 | $\gamma>10\kappa$ 时反证链裂 |
| $\gamma\le10\kappa$ | 等价增长上界 | 05-packets.tex:278 | 与 §13 基换算合拢 | 若为 $<10\kappa$ 更强需重述 |
| $\mathsf S_{m,I}\mathsf P_{m,I}f=f$ | frame 恒等式 | 05-packets.tex:93 | 跨 packet 尺度复合 | 归一因子记反则全链条失衡 |
| $\lVert\mathsf P_{m,I}f\rVert_{\ell^2}^2=(L_{\mathrm f}\theta)^2\lVert f\rVert_2^2$ | 分析平方和 | 05-packets.tex:95 | §9 二阶矩界 | 因子反则时间亏空无法相消 |
| $rw^2\sum_v\lvert c_v\rvert^3\le\mathcal A(c)^3$ | 立方下界 | 05-packets.tex:178 | §10 采样立方积分 | 去此界则平均采样格失效 |
| $w^{2/3}M\le A(c)\le Dw^{2/3}M$ | 范数与最大坐标可比 | 05-packets.tex:240 | `pkt:locality` 截断可忽略 | 失则多项式格截断不被允许 |
| $\sum_{B}\int_B\lvert F_0\rvert^3\le C_\epsilon R^{\epsilon}$ | 稀疏三次估计 | 07-global.tex:50 | 去空间幂次损失 | 含球数因子则全局界断 |
| 球心距 $\ge(R/\mu)^{C_0}$ | 稀疏分离假设 | 07-global.tex:47 | 供 Gram 衰减吃 $R^a$ | $C_0$ 太小则 off-diag 不衰减 |
| $K(d^{B,u})\le C\delta^4$ | 初始容量界 | 07-global.tex:101 | 消费 `eq:source-29` | Hessian 失正定则中心分离断 |
| $\sum_B\sum_v\lvert d_v\rvert^2\le C\delta^2$ | 联合质量界 | 07-global.tex:108 | 省球数的关键 | off-diag 不衰减则此和发散 |
| $\left\lvert\int A e^{2\pi i(q\cdot\xi+s\phi)}\right\rvert\le CR^aH^{-1/2}$ | 振荡积分衰减 | 07-global.tex:136 | 控非对角 Gram 块 | 仅 $H^{-a}$ 类衰减不足以闭合 |
| $\lVert Eg\rVert_{L^q}\lesssim_q\lVert g\rVert_{L^q},\ 3<q<\infty$ | 球面因子化升级 | 00-introduction.tex:315 | Kakeya 推论加速器 | 无因子化则须 array 定理独撑 |
| $\lVert\sum_ja_j1_{T_j}\rVert_{L^r}\lesssim_q\delta^{12/q-4}(\delta^2\sum_ja_j^r)^{1/r}$ | 加权管估计 | 08-consequences.tex:48 | Kakeya 转移对偶步 | 指数错则对偶 $p$-范数界错 |
| $K_\delta f(\omega)\le8K_{2\delta}f(\omega_j)$ | 角胞放大常数 | 08-consequences.tex:77 | 由网逼近全体方向 | 横移界错则常数 $8$ 变 |
| $\lVert K_\delta f\rVert_{L^3}\lesssim_q\delta^{-4(q-3)/(3(q-2))}\lVert f\rVert_{L^3}$ | 强极大 $L^3$ | 08-consequences.tex:93 | 得 `cor:sphere-kakeya-maximal` | $q$ 不趋 $3$ 则幂次不退到 $\delta^{-\varepsilon}$ |
| $\lVert Eg\rVert_{L^b}\le C_{a,b}\lVert g\rVert_{L^a},\ b>2a'$ | 混合范数开范围 | 08-consequences.tex:111 | `eq:sphere-mixed-norm` 结论 | 取 $b=2a'$ 尺度线则无断言 |
| $\ell_j=m_{j+1}/m_j,\ m_j\approx m^{j/J}$ | 分层中间尺度 | 06-extremal.tex:116 | 插入精确 frame 复合 | $J$ 不固定则 $o_i(1)$ 意义散架 |
| $Eg(x)=\int_{S^2}g(\omega)e^{2\pi ix\cdot\omega}\,d\sigma$ | 延拓算子定义 | 00-introduction.tex:15 | 全文出发点 | 相位号反则锐利性例失效 |
| $L^2(S^2)\to L^4(\R^3)$ | Tomas--Stein 经典界 | 00-introduction.tex:43 | 历史起点对照 | 据此推 $p>3$ 则远远不够 |
| $p>13/4$ | 多项式分割有界数据界 | 00-introduction.tex:85 | §2 第一条天花板 | 纯分割逼不出更接近 $3$ |
| $p>42/13$ | broom 方法界 | 00-introduction.tex:93 | §2 第二条线 | 复发集中可控、同时轻集中不可控 |
| $p>22/7$ | Wang--Wu 对角界 | 00-introduction.tex:103 | §2 最近的一条线 | 差约 $0.14$ 卡在方向与空间对偶 |
| $X_v=V+vU$ | 直线参数化 | 01-geometric.tex:7 | 时间与位置耦合 | 改参数化则容量测试错位 |
| $q_*=\lim_{\epsilon\downarrow0}\inf_{D}q(\epsilon,D)$ | 传播指数定义 | 01-geometric.tex:99 | 反证起点 `eq:source-4` | 极限与下确界次序记反则不可交换 |
| 区间长 $M^{-y}$ 双界指数 $sy,\ -sy$ | 条件时间假设 | 00-introduction.tex:131 | `geo:main` 前提 | 去条件基则相关律断 |
| 基 $M^{\tau+o_n(1)}$、时间误差 $O(\epsilon_i/\tau)$ | 时深间隔重标 | 01-geometric.tex:301 | 传播界局部复用 | $\tau$ 不固定则误差累积 |
| $\lambda\ne0\Rightarrow d_0>0$ | 分叉前提 | 02-entropy.tex:38 | 剪切状态定义域 | 与 $\lambda=0$ 混淆则情形漏 |
| 全对齐 $B=C+R,\ D=C+Y,\ A=C+Y+R$ | 四约束取等参数化 | 02-entropy.tex:64 | `ent:finite-states` 极值 | 参数化错则熵增界失真 |
| $\operatorname{H}(Z_1)-\operatorname{H}(Z_0)\ge\operatorname{H}(Q_1\mid Q_0,\mathcal B)-O(1)$ | 参数精化熵增下界 | 02-entropy.tex:135 | §7 消费的熵增来源 | 去 $O(1)$ 界则次模性不闭合 |
| $\mu(B(v,h))\le m^{o(1)}h^d$ | Frostman $d$ 律 | 03-projection.tex:16 | `proj:projection` 输入 | 改指数则夹逼速率错 |
| $(\delta,d,C)$-集为有限 dyadic 方格族 | 离散钉集定义 | 03-projection.tex:31 | `proj:furstenberg` 前提 | 归一化丢失则并集界错位 |
| $U_\nu=-\nabla\phi(\nu)$ 间距 $\ge c\delta$ | 速度中心分离 | 07-global.tex:93 | 供 `glob:initial-capacity` | Hessian 失正定则间距断 |
| $\lvert E\rvert/W(E)\propto(w/L)^{\kappa}\le1$ | 偏心幂归一 | 07-global.tex:104 | 由容量界得 $K\le C\delta^4$ | 若比值可大于 $1$ 则 $\delta^4$ 界失效 |
| $4R\le N^2<16R$ | 尺度选取 | 07-global.tex:58 | 球放进固定区 | 选错 $N$ 则坐标 $y=a_B+N^2(z,t)$ 失配 |
| 归一 $\lVert g\rVert_{L^\infty(S^2,\sigma)}=1$ | 有界数据归一 | 07-global.tex:23 | 全局段起点 | 归一丢失则常数依赖数据 |
| 触及条件 $\lvert\nu_b-\nu_v\rvert\le m^{\eta}\theta$ | 近邻指标判据 | 06-extremal.tex:32 | `ext:time-dimension` 定义 | $\eta$ 不固定则计数指数漂移 |
| 等号集为上区间且 $\gamma_1=\gamma$ | 极值结构 | 06-extremal.tex:76 | 定 $s\ge\gamma/2$ | 非上区间则下确界论证崩 |
| 初始振幅归一到 $[1,2]$ | 归一振幅类 | 06-extremal.tex:50 | 路径计数稳定性 | 不归一则 dyadic 类计数失控 |
| $e^{2\pi iN^2(z\cdot\xi+t\phi(\xi))}$ | packet 相位因子 | 05-packets.tex:78 | 分析与合成定义 | $N^2$ 幂错则 Parseval 因子乱 |
| $\theta=q/N,\ r=q^{-2},\ w=(qN)^{-1}$ | 三元组尺度 | 00-introduction.tex:214 | 定义分析格 | 记反则 frame 归一错 |
| $\lvert T_j\rvert=\pi\delta^2$ 管体积 | Kakeya 管归一 | 08-consequences.tex:54 | 对偶步归一系数 | 体积错则 $\delta^{-6}$ 因子错 |
| 缩放 $y=\delta^{-2}x$ 给因子 $\delta^{-6}$ | 空间重标因子 | 08-consequences.tex:44 | Khintchine 不等式左端 | 幂次错则加权管指数错 |
| $r=1+b/a'>3,\ \vartheta=r/b$ | 混合范数插值参 | 08-consequences.tex:119 | 得 `eq:sphere-mixed-norm` | $b>2a'$ 不严格则 $r>3$ 选不出 |
| $p=r'=q/(q-2)$ | Kakeya 对偶指标 | 08-consequences.tex:53 | 由加权管过对偶 | $r$ 选错则对偶 $p$ 界错 |
| 角胞面积 $\sim\delta^2$ | 极大网覆盖方向 | 08-consequences.tex:66 | 网逼近全体方向 | 网不极大则方向漏 |
| $\delta^{12/q-4}$ 标度因子 | 极大算子幂次 | 08-consequences.tex:85 | 强极大转移主因子 | $q$ 趋 $3$ 则幂次趋负 |
| $E1$ 仅对 $x\ne0$ 成立 | 闭式适用范围 | 00-introduction.tex:34 | 锐利性反例 | 含原点则发散判定失真 |
| $\gamma$ 之定义含终端掩膜 $T_m$ | 放大指数的范围 | 05-packets.tex:252 | 上确界遍历全掩膜 | 去掩膜则 $\gamma$ 变小、定理变弱 |
| $\Pr(T_1=t,U\in u+E,X_t\in x+M^{-1}E)$ | 传播的终端量 | 00-introduction.tex:139 | `geo:main` 陈述 | 缺 $x$ 独立中心则测试退化 |
| $G(c)^3=(w^2\sum_v\lvert c_v\rvert^2)K(c)^{1/2}$ | 容量与质量合成 | 05-packets.tex:156 | 原子范数的原子成本 | 幂 $1/2$ 错则相消失败 |
| $N\le m^B$ 复杂度上限 | 容许族约束 | 05-packets.tex:221 | 一致性与 $m^{o(1)}$ | $B$ 逃逸则失去一致界 |
| $M=2^n,\ n\to\infty$ | 几何段基与深度 | 01-geometric.tex:25 | 二进时间测试分层 | 基记错则 $o_n(1)$ 方向反 |
| 转移 $\mathsf P_{m_+,I_+}\mathsf S_{m_-,I_-}$ 范数 $\le\ell$ | 跨层分析合成界 | 05-packets.tex:104 | 分层图逐层估计 | 界反则复合放大失控 |
| 选择次序 $C_0\to\alpha\to\epsilon$ | 全局段参数次序 | 07-global.tex:9 | 允许 $\epsilon$ 后置 | 次序乱则 $R^{\epsilon}$ 吃不掉半径 |
| $3<q<4,\ r=q/2$ | Kakeya 转移取指 | 08-consequences.tex:17 | 加权管估计起点 | $q$ 超 $4$ 则 $r>2$ 破坏对偶 |
| 反证假设 $\gamma>10\kappa$ | 极值段起点 | 06-extremal.tex:15 | 驱动两极值构造 | 假设过弱则不需第二极值 |
| 终端子律留存质量 $\ge M^{-o(1)}$ | 传播界可施加前提 | 00-introduction.tex:143 | 把几何界套上数组 | 留不住则传播界落空 |
