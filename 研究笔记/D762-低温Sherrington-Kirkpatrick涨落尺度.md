## §0 登记与题目定位

派单给我的目录是 `preprints/The-low-temperature-Sherrington-Kirkpatrick-fluctuation-scale-September-24-2026`，素材总量标为 279,921 字节，实测 `build/` 下 `.tex` 一共 11 个文件、合计约 279,992 字节，量级对得上。壳文件 `paper.tex` 只有 2,194 字节（`paper.tex:36--52` 给出题名、作者栏与七个 `\input` 的顺序），真正承重的是 `sections/` 里的八篇：`introduction.tex` 12,120、`foundations.tex` 43,607、`comparisons.tex` 58,029、`cavity.tex` 49,275、`profile.tex` 40,110、`propagation.tex` 30,238、`fluctuations.tex` 26,913、`companion-interface.tex` 16,255，另有 `figures/proof-order.tex` 1,161 字节只画那张分支图。我按这个顺序取证，但笔记的写法按我自己当时推进的顺序重排。

定理本体很短。零场高斯 Sherrington--Kirkpatrick，`introduction.tex:2--7` 定 $H_n(\sigma)=\frac{\beta}{\sqrt n}\sum_{1\le i<j\le n}g_{ij}\sigma_i\sigma_j$、$Z_n=2^{-n}\sum_{\sigma}$ …… 精确写法是 $F_n=\log Z_n$，自旋求和前的 $2^{-n}$ 只把 $F_n$ 挪去一个确定常数，对中心矩毫无影响（`introduction.tex:8`）。结论是对每个固定 $1<\beta<\infty$ 有 $\operatorname{sd}(F_n)=n^{1/6+o(1)}$ 与 $\operatorname{Var}(F_n)=n^{1/3+o(1)}$，展开成 $\eta$ 语言就是 `introduction.tex:16--19` 的双侧：$n^{1/6-\eta}\le\operatorname{sd}(F_n)\le n^{1/6+\eta}$ 对 $n\ge n_0(\beta,\eta)$ 成立；再加一条典型幅度，$\mathbb P(n^{1/6-\eta}\le|F_n-\mathbb EF_n|\le n^{1/6+\eta})\to1$（`introduction.tex:21--24`）。

我必须先承认这条定理的克制。它只给幂指数：没有极限分布，没有非零常数前置因子，温度固定，$\beta\to1$ 与 $\beta\to\infty$ 都没有一致结论（`introduction.tex:26`）。对自由能密度 $F_n/n$ 而言标准差指数是 $-5/6$、方差指数是 $-5/3$，乘上物理因子 $-1/\beta$ 不改指数。整篇论文的骨架其实是在回答一个问题：一个只有 $o(1)$ 余量的指数断言，最低成本的正确证明路线长什么样。

- 素材目录：`preprints/The-low-temperature-Sherrington-Kirkpatrick-fluctuation-scale-September-24-2026`
- 队列归属：其他队列第 487 行号

## §1 初始动机：物理猜测 $n^{-5/6}$ 与我手里的三块已知地面

驱动力是我一直在用的那份预测谱系。Sherrington--Kirkpatrick 把两件事分开：极限自由能本身，以及它在不同无序样本之间的涨落（`introduction.tex:29--30`）。前者已经被 Parisi 的层级序参量、Guerra 与 Toninelli 的高斯插值、Guerra 变分上界配 Talagrand 的下界、以及 Panchenko 对混合 $p$-自旋（含奇数相互作用）的推广彻底定住（`introduction.tex:31--39`）。那是宏观量，本文的涨落发生在比它低得多的尺度上，这就是我要处理的空档。

尺度预测是另一条独立的历史线。Kondor 在临界温度附近做 replica 展开（`introduction.tex:41--43`），Parisi 与 Rizzo 把它发展成一整套低温稀疏散布计算；Crisanti、Paladin、Sommers、Vulpiani 在 1992 年给出每自旋物理自由能的涨落尺度 $n^{-5/6}$（`introduction.tex:44--46`），固定 $\beta$ 翻译成 $\log Z_n$ 就是 $n^{1/6}$。这里有个我一开始低估的裂缝：`introduction.tex:48--51` 明确说，从稀疏散布计算推出典型涨落要额外一条匹配假设，Parisi--Rizzo 自己把它放在他们第六节讨论。也就是说，物理界给出的是一个"指数正确"的猜测，把它变成定理，缺的是从大偏差量级到标准差量级的合法传递。我第一版计划是直接沿这条路走：先证一个下界侧的大偏差估计，再靠对数凹性把两侧缝起来。

再往回看，我手里能站的地面只有三块。固定高温 $0<\beta<1$ 时是一阶高斯涨落（Aizenman--Lebowitz--Ruelle，`introduction.tex:55--56`）。Chatterjee 的无序混沌与超集中工作给 $\operatorname{Var}(F_n)=O_\beta(n/\log n)$（`introduction.tex:57--59`），他后来的下界方法证到常数尺度的不集中（`introduction.tex:60--61`）。临界点上 Chen 与 Lam 拿到 $(\log n)^2$ 量级的方差上界（`introduction.tex:62--63`），Du 与 Huang 进而证到方差 $\frac16\log n+O(1)$ 且极限是高斯（`introduction.tex:63--65`），临界窗口的一族极限定理处理温度趋于相变的情形（`introduction.tex:66--68`）。这些结论的形态都很漂亮：有常数、有分布。低温区完全没有这种奢侈品，唯一能给的是 A：对足够大的 $n$，$c_\beta n^{4/15}\le\operatorname{Var}(F_n)\le C_\beta n^{7/15}$（`introduction.tex:70--75`）。

$4/15\approx0.267$、$7/15\approx0.467$，而我要的 $1/3\approx0.333$ 落在区间正中。我当时想：既然上下界只差一个幂，把他们的正变换与偏差估计再磨一磨，指数自然夹过去。这个念头是这单里最浪费时间的一步，下一节写它到底卡在哪。顺便把这里的记号约定钉住（`introduction.tex:206`）：所有常数可以依赖固定的 $T=\beta^2$；辅助小指数先选定再对 $n\to\infty$ 冻结；$A\lesssim B$ 表示常数是 $n$-无关的，$A\asymp B$ 表示双侧；"多项式节省"专指因子 $n^{-c}$（$c>0$ 固定），对数损失只允许在这种节省已经拿到之后才被吸收。最后这句顺序规定，正是我第一版计划被否掉的判决依据。

## §2 错路一：把两处层级压力整体换成标量 Parisi 极限

我原本的算盘是这样的。层级上的压力 $f_n(b,h)$ 如果能在两个时钟上都替换成标量 Parisi 泛函的极限，涨落就该由极限泛函在极小元附近的二阶展开决定，剩下的是把 Aronow--Lopatto 的 $7/15$ 与 $4/15$ 收窄。这条路在低温区是可行的（$\beta>1$ 时标量极小元的结构足够好），但精度不够，而且不够的原因很具体。

压力对时钟的响应是确定的：`foundations.tex:149--150` 第一行给 $df_n=-\tfrac14\int_0^1B_u\,db(u)\,du-\tfrac12\int_0^1S_u\,dh(u)\,du$，其中 $B_u=\mathbb E\|\mathbb E[yy^{\mathsf T}\mid\mathcal F_u]\|_{\rm HS}^2$、$S_u=\mathbb E|X_u|^2$（`foundations.tex:76--78`）。同一节 `foundations.tex:166--169` 又给出 Lipschitz 型比较 $|f_n(b,h)-f_n(\widetilde b,\widetilde h)|\le\tfrac14\|b-\widetilde b\|_{L^1}+\tfrac12\|h-\widetilde h\|_{L^1}$，沿两条单调路径的凸线段积分得到（`foundations.tex:198--200`）。这两式合起来说明：压力误差被时钟的 $L^1$ 距离控制，而我要测的涨落尺度只有 $n^{1/6}$ 的幂，全局替换的代价跟被测量同阶。$n^{1/6}$ 是 $n$ 的一个很小的幂，任何"常数乘 $L^1$ 时钟误差"都吞不掉它所需的相对精度。

素材里对这一点写得比我当年诚实：`introduction.tex:134--135` 一句话判死，"把两处层级压力同时换成它们的标量 Parisi 极限，在这个尺度上损失过多"。接着 `introduction.tex:136--142` 给出替代方案：只在短的协方差比较上做替换，比较的分位数在一个非降的重叠分位数上优化，误差由两块组成，重叠方差与该分位数对平均重叠的失配。在质量与重叠可比较（在被测尺度之上）的前提下，投影估计与钉扎矩估计让这些误差在被测的每一阶固定矩里都小，而且多项式节省的取法与那个固定阶数无关。这个"与阶数无关"的细节救了我后面的整条链：我要的正变换窗口对 $s$ 的幂次是固定的，若节省随矩阶衰减，窗口就永远推不到 $n^{-1/6}$ 附近。

错路二紧跟着来，出在空腔那一步。$n$ 个自旋里去掉一个，平均重叠要付一个磁化率修正；我对它逐项取绝对值再求和，得到的是一个比 $n^{1/6}$ 尺度还大的余项，直接压住我要证的符号。`introduction.tex:146--148` 记的就是这次失败："去掉一个自旋产生的磁化率修正，在绝对值逐项控制下太大。"它的出路是引入额外检验副本凑出一个有限恒等式组，靠迭代把修正抵消掉；对已经含观测副本的块，带符号的附着贡献先相加再取绝对值。这里的取舍我纠结了很久：先取绝对值是安全习惯，符号相消要求我早于估计一步看清哪些项在同一种意义下相反。代价是恒等式的规模，而规模的每次增长都要向 $n$-无关这件事交代（`introduction.tex:150--152`：检验因子数与迭代深度在 $n$ 增大时保持固定）。

错路三最短，我在写涨落节之前只花了一个下午。正拉普拉斯变换窗口本身控制不了方差，也控制不了典型幅度：`introduction.tex:196--197` 直接说 "一个正变换单独做不到"，随后按 Aronow--Lopatto 的指数增广思路给 $F_n^c$ 加一个独立的率为 $1$ 的指数变量，再靠规范对称性与 Prékopa 的边缘定理得到对数凹密度，用矩与小球估计把窗口转成标准差与典型幅度（`introduction.tex:198--203`）。我原以为这是收尾的技术处理，实际上它是把"只有指数"这件事合法化的唯一一处结构输入，后面第 §8 节我会回来算它到底吃掉多少余量。

## §3 完成化协方差与两棵时钟：把模型搬进可微的层级

关键转折发生在我很早做的一次格式统一：先把协方差补全，再决定往哪里切。`introduction.tex:94--99` 令 $T=\beta^2$，取一个独立的公共高斯 $D$、方差 $T/2$，写 $H_n^c=H_n+D$、$F_n^c=F_n+D$，于是完成的协方差正好是 $\mathbb E[H_n^c(\sigma)H_n^c(\tau)]=\frac{nT}{2}R(\sigma,\tau)^2$，$R(\sigma,\tau)=\frac{\sigma\cdot\tau}{n}$。原始 $H_n$ 只跑 $i<j$，$\mathbb E H_n(\sigma)H_n(\tau)$ 带一个对角缺失项，展开时每次求导都要单独记账；加一个公共噪声把它抹成纯二次型，加进去的东西在最终一步再删（`introduction.tex:100--102`）。这笔交换我后来反复用：宁可多引一个可移除的随机变量，也不在协方差结构上留残缺。

有了纯二次型，`foundations.tex:17--26` 的特征映射就顺理成章。取 $y(\sigma)=\sigma/\sqrt n$，$\phi_b(\sigma)=\frac{\sigma\sigma^{\mathsf T}}{\sqrt{2n}}$、$\phi_h(\sigma)=\sigma$，两者分别落在维数 $n^2$ 与 $n$ 的欧氏空间里，内积是 $nR^2/2$ 与 $nR$，平方范数是 $n/2$ 与 $n$。$b$-特征用的是全部有序自旋乘积（对角重复也算），`foundations.tex:24--26` 注明"无害，且让协方差实现变得直接"：范数固定为 $n/2$ 才是关键，$\frac12$ 的差别由 $f_n$ 里的 $-\frac{b_L}{4}$ 吸收。到这里，一个相互作用时钟 $b$ 与一个外场时钟 $h$ 的分工就定下来了。

层级本身是 `foundations.tex:28--49`：$b,h$ 取 $(0,1)$ 上非负非降的阶跃函数，公共分划 $0=m_0<m_1<\cdots<m_L<m_{L+1}=1$，在 $m_j\le u<m_{j+1}$ 上 $b=b_j$、$h=h_j$，并约定 $b_{-1}=h_{-1}=0$。$Z_j$ 是相互独立的特征空间高斯向量，第一、第二特征空间的坐标方差各为 $b_j-b_{j-1}$ 与 $h_j-h_{j-1}$，零方差允许。终端配分函数 $F_L(z)=\log(2^{-n}\sum_\sigma e^{z_b\cdot\phi_b(\sigma)+z_h\cdot\phi_h(\sigma)})$，往回递推 $F_{j-1}(z)=\frac1{m_j}\log\mathbb E e^{m_jF_j(z+Z_j)}$，$F_{-1}(0)=\mathbb E F_0(Z_0)$，最后 $f_n(b,h)=\frac1nF_{-1}(0)-\frac{b_L}{4}-\frac{h_L}{2}$。那个算子 $X\mapsto u^{-1}\log\mathbb E e^{uX}$（$u=0$ 处按期望解释）就是 `introduction.tex:108--110` 说的"把质量为 $u$ 的一段积分掉"，我后面所有的比较都在它上面做。

种植律向前构造（`foundations.tex:55--62`）：先按高斯律抽 $Z_0$，在 $G_{j-1}=\sum_{i<j}Z_i$ 条件下按密度 $\exp\{m_j[F_j(G_{j-1}+Z_j)-F_{j-1}(G_{j-1})]\}$ 相对高斯律抽 $Z_j$，末了在磁场 $G_L$ 里按 Gibbs 律抽 $\sigma$。这些核都是归一化的，所以副本可以在指定分裂处共享前缀、之后各段用条件独立副本；一棵有限确定树就定义一个概率律，即使某些分裂质量相同、某些协方差增量为零（`foundations.tex:62--68`：跳跃处要写明分裂在增量之前还是之后，重复的空步骤把这些约定记进同一分划）。这套"有限树"我一开始当纯形式工具，后来才明白它承担的是把固定次数空腔展开严格化的职责，深度不许随 $n$ 长（`introduction.tex:206` 那句"允许取子列，但绝不允许 $n$-依赖的迭代深度"就是这个约束）。

前缀 $\sigma$-代数 $\mathcal F_u$ 之后的一串记号是全文的工作面：$X_u=\mathbb E[y\mid\mathcal F_u]$、$C_u=\mathbb E[yy^{\mathsf T}\mid\mathcal F_u]-X_uX_u^{\mathsf T}$、$S_u=\mathbb E|X_u|^2$、$B_u=\mathbb E\|\mathbb E[yy^{\mathsf T}\mid\mathcal F_u]\|_{\rm HS}^2$、$D_u^2=B_u-S_u^2$、$L_u=y\cdot X_u-\tfrac12|X_u|^2$（`foundations.tex:73--80`）。$D_u$ 是两个独立延续之间重叠的标准差，$D_u^2=\operatorname{Var}(|X_u|^2)+2\mathbb E[X_u^{\mathsf T}C_uX_u]+\mathbb E\operatorname{tr}C_u^2$（`foundations.tex:100--104`）。这个分解是我后面所有"重叠方差"账目的母式：三项分别是均值范数涨落、均值向量在残余协方差里的二次型、以及残余协方差自身的迹平方。$n^{1/6}$ 这个尺度，最终要从这三项的相对大小里读出来。

## §4 一次比较调用的五个参数，与 $n^{-1/6}$ 的第一次现身

`comparisons.tex:16` 先把全局小指数钉死：取充分小的固定常数 $m>0$，令 $\delta=m/10000$，之后所有渐近陈述都在 $m$、$\delta$ 固定下让 $n\to\infty$。$\delta$ 只用于把约束两侧拉开一个多项式缝隙，它比一切最终指数都小，所以不会改答案，只会让可行集非空。`comparisons.tex:20--29` 把"多项式节省"正式化为因子 $n^{-c}$（$c>0$ 固定），并规定这一节省除非另说都与固定矩阶无关；$n^{o(1)}$ 可以被 $C_\epsilon n^\epsilon$ 吃掉，但 $\epsilon$ 必须在估计里的正幂余量定下来之后才选；记号 $o_{\rm poly}(A)$ 表示绝对值被 $Cn^{-c}A$ 控制，$Y=O_p(A)$ 表示在讨论的每一固定阶有 $\|Y\|_{L^p}\le C_pA$。这套顺序纪律（先定余量、后取 $\epsilon$）就是我 §2 里那条全局替换路线的真正死因：它的余量在选 $\epsilon$ 之前就已经是负的。

一次比较调用的参数写在 `comparisons.tex:32--37`，四件东西一行给全：

\[
 n^{-2/3+m}d\lesssim E\le n^{-1/2}d^2,\qquad a=\frac{\sqrt nE}{d},\qquad u_*=\frac1{nE},\qquad 0<d=O(1).
\]

$E$ 是比较误差预算（只差一个固定幂松弛），$d^2$ 是能移除的协方差强度上限，在这个强度下剖面的换尺度发生在半径 $d$ 附近（`comparisons.tex:38--40`）。$a$ 是随之而来的下侧直接检验尺度，$u_*$ 控制最小质量的约束。于是 `comparisons.tex:43--44` 那行 $d\ge a\gtrsim n^{-1/6+m}$ 就是把两侧夹起来的结果：由 $E\gtrsim n^{-2/3+m}d$ 得 $a=\sqrt nE/d\gtrsim n^{-2/3+m}\sqrt n=n^{-1/6+m}$（此时取 $d$ 的下端），而 $a\le d$ 等价于 $E\le n^{-1/2}d^2$，正好是上侧约束。我第一次读到这儿停了一下：$1/6$ 在这个式子里出现的机制是 $-2/3+1/2=-1/6$，也就是"预算下界除以平方根增益"。这条算术后面在涨落节还会以另一种形态回来，两处必须对得上，对不上就有一处写错。

工作区间是 $[u_0,1]$，其中 $u_0=0$ 或 $u_0=o(a)$，本次调用造成的改动在 $u_0$ 以下恒为零；端点时钟 $b_0,h_0$ 一致有界且在区间上非降（`comparisons.tex:43--46`）。给剖面论证用的端点假设是 `comparisons.tex:48--52` 的

\[
 b_0(u)=T+o(z^2),\qquad h_0(u)=o(z^3)\quad(u\asymp z,\ a\lesssim z\le1),
\]

按序列方式陈述：对每条满足 $u\asymp z$ 的测试序列成立，因此在每个固定可比较质量带上是一致的小 $o$（若一致性失败就挑一个违背点）。注意它给的正是相互作用时钟趋于 $T=\beta^2$、外场时钟三阶消失。低温相里不该有宏观外场，$h_0=o(z^3)$ 就是这个事实的定量替身；$b_0=T+o(z^2)$ 说明到该尺度上协方差已经饱和。这两条我在 §2 的两条错路里都用到过：绝对值逐项控制需要 $h$ 的三阶，全局 Parisi 替换需要 $b$ 的饱和速率。

优化变量是一个递增满射分位数 $r:[u_0,1]\to[r_{\min},1]$，其逆 $\alpha$ 受两侧夹逼（`comparisons.tex:63--72`）：

\[
 k(r)\le\alpha'(r)\le M(\alpha(r)),\qquad k(r)=\frac{n^\delta u_*^2}{(r+n^{2\delta}u_*)^2},\qquad M(u)=n^\delta\left[\frac{u+u_*}{L}+\frac{d^3}{E}(u+u_*)^2\right],
\]

其中 $L=\min\bigl(u_*,\frac{a^3}{d^2}\bigr)$，$r_{\min}=0$（全质量情形）或 $0\le r_{\min}\le u_*/M(u_0)$。这些是关于 Lipschitz 函数的几乎处处约束，且下界严格为正，所以 $\alpha$ 在固定 $n$ 时也 Lipschitz（`comparisons.tex:73--76`）。`comparisons.tex:128--133` 验可行性用的是两股流的插值：$\int_0^1k(r)\,dr\le n^{-\delta}u_*=o(1)$ 说明光靠地板到不了终端质量，$\int_{u_0}^1\frac{du}{M(u)}\le n^{-\delta}L\log\frac{1+u_*}{u_0+u_*}=o(1)$ 说明顶棚流在指定终端半径之前就到了；于是用 $\alpha'=k+w(M(\alpha)-k)$、$0\le w\le1$ 插值旅行时间，Arzel\`a--Ascoli 给紧性，正地板保可逆（`comparisons.tex:134--143`）。我后来把这段当成本节最实用的一页：约束集非空且紧，最小值取得到，我才敢在首次变分上写方程。

被优化的目标在 `comparisons.tex:85--94`：取一个固定的光滑 $f>0$，在原点邻域等于 $1$、大自变量时与 $(1+\log t)/t$ 可比、对数斜率从 $0$ 非降到 $1$，然后令

\[
 e(r)=\lambda f(\lambda r/d^3),\qquad 0\le\lambda\le d^2,\qquad \mathcal F_\lambda(r)=f_n\bigl(b_0-e(r),\,h_0+e(r)r\bigr)+\frac14\int_{u_0}^1e(r(u))r(u)^2\,du,
\]

$\mathcal M_\lambda=\min_r\mathcal F_\lambda(r)$。改动后的时钟是 $b=b_0-e(r)$、$h=h_0+e(r)r$，这与 `profile.tex:31` 完全一致；$p(r)=-re'(r)/e(r)$ 满足 $0\le p<1$，$\partial_{\log\lambda}e=(1-p)e$，$(re)'=(1-p)e\ge0$，所以比较在区间内保持单调（`comparisons.tex:95--99`）。"可调用"要求改动时钟对每个可行分位数都非负非降（含 $u_0$ 跨界），"可扫"要求对扫内每个强度都行、包括 $\lambda=0$；`comparisons.tex:105--108` 还留了一个例外通道：裸端点可以带一个 $u_0$ 处的场跳跃，只在固定正强度修复，此时局部估计只谈该强度下的改动路径，不用裸压力、也不从零扫起。我第一次实现时把这条例外当成漏洞，其实它是给传播节准备的：坏尺度的父节点正是这种裸端点。

## §5 包络的非降性与误差的两块：$B-2rS+r^2=D_u^2+(S_u-r)^2$

`comparisons.tex:110--125` 的包络引理说：$\mathcal M_\lambda$ 局部 Lipschitz、对 $\lambda$ 非降、在 $\lambda=0$ 等于端点压力并且是端点压力的上界；在几乎每个正强度处，任取该强度的极小元，沿 $\log\lambda$ 单位方向的上导数被

\[
 \frac14\int_{u_0}^1e(r(u))\bigl[D_u^2+(S_u-r(u))^2\bigr]\,du
\]

控制（`comparisons.tex:118--122`）。这一式子就是 §2 里那"两块误差"的定量身份：$D_u^2$ 是重叠方差（其母式在 `foundations.tex:100--104`），$(S_u-r)^2$ 是分位数对平均重叠的失配。证明里有一句我认为是全文最漂亮的代数（`comparisons.tex:146--149`）：对固定分位数把移除协方差量从 $0$ 插到 $e$，压力加罚金项的导数是被非负强度增量乘上 $\frac14[B-2rS+r^2]$ 的积分，而 $B=S^2+D^2$，于是

\[
 B-2rS+r^2=\bigl(S^2+D^2\bigr)-2rS+r^2=D_u^2+(S_u-r)^2\ge0.
\]

平方补齐直接给出非负性，从而给出包络的非降性与上界性质；也就是说，"误差正好是这两块"从代数上是被迫的。我最初以为罚金 $\frac14\int er^2$ 是我为了凑非降而人为加的东西，读完这段才明白它是同一个平方补的另一半：$r^2$ 项与 $-2rS$ 配对，$S^2$ 归 $B$，剩下 $D^2$。这个配对还顺带解释了为什么分位数要当优化变量，因为 $r$ 同时出现在时钟与罚金里，只有联合优化才能把两块误差一起压。

`comparisons.tex:156` 补了一句小强度免费：整个 $0\le\lambda\le n^{-10}$ 段只花 $O(n^{-10})$。这条让"从 $0$ 扫起"合法，也让包络在 $\lambda=0$ 的取值有明确意义。首次变分几何在 `comparisons.tex:186--203`：定义

\[
 G(r)=e(r)\bigl[(2-p(r))r-2(1-p(r))S_r-p(r)B_r/r\bigr],
\]

最后一项在 $p=0$ 的邻域按 $0$ 解释，下标 $r$ 表示在质量 $\alpha(r)$ 处揭示。极小元处存在连续绝对连续的势 $H$ 使得 $H'=JG$、$J>0$，并且在 $\{H<0\}$ 上 $\alpha'=M(\alpha)$、在 $\{H>0\}$ 上 $\alpha'=k$；在 $\alpha+u_*$ 变化有界的带上，$J$ 归一化后畸变有界。接触集 $\{H=0\}$ 上几乎处处有 $G=0$、$S'\lesssim n^{o(1)}$、$S\le r$（`comparisons.tex:200--203`）；顶棚支 $\{H<0\}$ 上半径长 $\ell$ 有 $\Delta S\lesssim n^{o(1)}(\ell+r_{\min}\mathbf1_{\rm initial})$、$S\le r+\ell$、$|S-r|^2\lesssim n^{o(1)}(\cdots)$（`comparisons.tex:205--210`）。这套"接触／顶棚／地板"三分正是我把比较当最优控制问题的直接收益：$\alpha'$ 只能贴在两侧约束上跑，$H$ 是那个把时钟选择与 $G$ 的符号联系起来的量。

外正则的定义写在 `comparisons.tex:159--166`：固定 $c,C,C_0>0$，若 $u\ge C_0x$ 时 $cu\le r(u)\le Cu$，就称极小元在 $x$ 之上有一个正则外区；放大截止常数是等价的半径坐标说法 $\alpha(r)\asymp r$，常数与 $n$ 无关，且定义里不含逐点路径导数的界。最后这句对我很重要，我一开始把正则性理解成"导数有界"，于是总想在传播论证里证导数，白跑了很久；真正的定义只是质量与半径的可比较性，它是一个纯几何条件。最终要证的正则性覆盖所有测试尺度

\[
 n^\delta\frac{\sqrt nE}{\sqrt\lambda}\le x\le1
\]

（`comparisons.tex:169--172`），记 $A_\lambda=n^\delta\sqrt nE/\sqrt\lambda$；若 $x\ge A_\lambda$ 则 $x\gtrsim a$ 且 $e(x)x^2\gtrsim n^\delta nE^2$，因为 $\sqrt\lambda\sqrt nE\le d^3$ 使 $f$ 在 $A_\lambda$ 的自变量不超过 $n^\delta$，而 $re(r)$ 递增（`comparisons.tex:176--181`）。局部估计只用到 $x\gtrsim a$、$e(x)x^2\gtrsim nE^2$，外加 $x=o(1)$ 时的外正则（`comparisons.tex:181--182`）。

## §6 标定尺度 $W$：两处尺度的分工与检验因子的收益

`cavity.tex:3--9` 把本节全部估计钉在"改动路径 $\mathcal F_\lambda$ 的极小元 + 一次直接检验"上，并假设在固定倍数的 $x$ 之上外正则成立；假设清单是 $x\gtrsim a$、$e(x)x^2\gtrimes nE^2$、$e(x)\gtrsim x^2$（`cavity.tex:10--13`，与 `profile.tex:20--22` 逐字同形）。由这些直接检验推论得到

\[
 W=\max\{x,\sqrt{e(x)}\},\qquad x\le W\lesssim d,\qquad x\longrightarrow0
\]

（`cavity.tex:17`）。正则外区上还假定 $b_0(u)=T+o(u^2)$、$h_0(u)=o(u^3)$，$u\ge C_{\rm reg}x$，在固定可比较质量带上一致（`cavity.tex:21--30`）。这里的取舍：目标尺度 $x$ 与标定尺度 $W$ 分工不同（`cavity.tex:70--80`）。在 $x$ 上，比较只给出重叠误差的积分控制，这远不足以控制去掉一个位点后留下的磁化率修正；当 $W=o(1)$ 时，一个尺度为 $W$ 的正则分裂的中心化重叠在每一固定矩里都是 $n$ 的多项式小，我在那一刻度上检验单点恒等式，每加一个新检验因子就多拿一次这样的节省，固定次数的检验就控住磁化率修正，再靠在尺度 $x$ 上的第二条均值恒等式把控制权传到目标切割。$W$ 有正下界时，积分重叠界直接控制修正。$W=\max\{x,\sqrt{e(x)}\}$ 这个 $\max$ 就是把两种情形缝在一起的装置，我第一次尝试时用了 $\min$，于是标定尺度可能比目标尺度还小，检验因子带来的节省全落到测度之外。

标定用的具体数字在 `cavity.tex:84--96`：在每个固定矩阶上原始界都成立；$W=o(1)$ 时选一个尺度 $W$ 的好切割 $*$，再在足够大的固定倍数处取质量 $U\asymp W$ 的连续切割，两者都正则，中间有一段正则创新区间，好切割可以选在 $x$ 的任意指定固定倍数之上，并且

\[
 S_*\asymp W,\qquad D_*\le n^{-\kappa}\frac{x^2}{W},\qquad \|R_*-S_*\|_p\le C_pn^{-c_2}W,\qquad \int_0^{C_1W}D_u\,du=o(x^2).
\]

$c_2>0$ 与每个固定 $p$ 无关，$\kappa>0$ 允许在有限多次固定阶 H\"older 估计之后调小（`cavity.tex:97--99`）。边界边的代价也在同一页：低分裂在 $x$ 的固定倍数以内或就是 $*$ 时，经尺度 $v\ge U$ 的正则切割之后用重采样改变一个端点，代价是 $C_pn^{-\kappa}z_v$，其中 $z_v=\frac{x^3}{W^{3/2}\sqrt v}$（`cavity.tex:106--112`）；被 $X_*$ 锚定的投影边界更好，为 $C_pn^{-\kappa}\frac{x^3}{Wv}$（`cavity.tex:113--116`）。它的证明路径值得记：先用 `cavity.tex:117--119` 的高切之前、低叉之后的创新区间界 $C_p(\log n)^C\sqrt W/\sqrt{ne(v)v^3}$，再用 $e(v)v\gtrsim W^3$ 与 $n^{-1/2}\ll x^3$（`cavity.tex:120`）。这两条不等式合起来正是 $x$ 处在 $n^{-1/6}$ 附近时才成立的形态，我在核对幂次时发现 $n^{-1/2}\ll x^3$ 等价于 $x\gg n^{-1/6}$，与 §4 的 $a\gtrsim n^{-1/6+m}$ 严丝合缝。未投影的边界边则用同步双支分解（`cavity.tex:121--122`）。删除坐标的重叠在所有陈述里额外带一个 $1/n$（`cavity.tex:102--103`）。

可用检验的定义在 `cavity.tex:138--168`：次数不超过 $N$ 的检验是"中心化边界重叠及其条件投影之积"的有限线性组合；必要时增大 $N$ 以同时控制投影用新副本表示之后的叶数；所有低分裂都是 $*$，除至多一条在切割 $i$ 的初始边。指定目标 $a$ 在其块内在观测检验叶中唯一，它 dependence 是 $Y_a=X_*\cdot y_a-S_*$ 的一个幂（`cavity.tex:147--149`）乘至多一条来自外叶的入射边界边；其他因子不含 $a$。被检验的恒等式里的第二目标 $b$ 在 $*$ 处是新副本且不在检验中出现（`cavity.tex:151--153`）。老块可含若干高亲属，它们的关系只出现在确定标量系数与指定树拓扑里，任何重叠因子都不是切割块内部的（`cavity.tex:154--157`）。单项式的自然尺度：每个星号因子贡献一个 $W$，可能的初始因子贡献一个 $x$；线性组合的 $p_0$ 是这些尺度乘以标量系数绝对界之和（`cavity.tex:161--165`）。次数与叶数都与 $n$ 无关，后面生成的所有检验由初始次数与递归深度控制（`cavity.tex:165--167`）。

`cavity.tex:175--182` 的行改动引理把这些组合真正变成工具：沿一段"一次改一个高斯行、协方差核一致有界"的容许改动，至多 $N$ 叶的非负自旋检验期望至多变 $C_N$ 倍，与阶分划无关。证明是套 Gronwall：`cavity.tex:184--190` 说行核有界、两个新标签测度的全变差被 $N$ 控制，把新叶边缘化后原检验不变，故 $|\partial_t\nu_t[A]|\le C_N\nu_t[A]$，双向 Gronwall 收工；中心化常数取实际路径的、在插值期间固定。这里的实质是我必须允许"改动高斯行"这种非物理操作，而代价只是一个与 $n$ 无关的常数，这全靠检验的自旋限定与次数的固定。

## §7 单点三次闭包：$S_i=\Gamma(K_i)+o(x^3)$

本节的目标就是 `cavity.tex:48--68` 这条一致单点闭包命题。固定 $0<c<C<\infty$，在满足 $r_i\le Cx$ 且 $cx\le u_i\le Cx$ 的目标切割 $i$ 上，沿每条 $D_i=o(x)$ 的序列有

\[
 S_i=\Gamma(K_i)+o(x^3),
\]

若只有 $D_i=O(x)$ 则误差是 $O(x^3)$ 且对带上目标一致；更精确地说，对固定的直接检验序列存在 $\eta_n\to0$、$C_0<\infty$ 与 $\vartheta>0$（与目标无关）使 $\frac{|S_i-\Gamma(K_i)|}{x^3}\le C_0\{\eta_n+(D_i/x)^\vartheta\}$。当 $W=O(x)$ 时，$O(x^3)$ 的结论在每个被省略的下切割也成立，既不要求它的质量下界，也不在那点上要求端点假设；在集中性带内，误差除以 $x^3$ 在归一化 $L^1$ 下于质量与半径两种坐标中都趋于零（`cavity.tex:63--67`）。这里 $\Gamma(K_i)$ 的定义在 `cavity.tex:43--46`：用整条标量 Ising 递归 $K$ 在切割 $i$ 处的第二个条件磁化矩，记号刻意保留对整条路径的依赖，而不只是数 $K_i$。$K=h+bS$ 非负非降（`cavity.tex:41--42`），`profile.tex:34--36` 用同一个写法。

我对这个陈述的第一反应是它太弱：闭包只在三阶精度上成立，$S$ 与 $\Gamma(K)$ 相差 $o(x^3)$，一阶二阶信息全无。读完全文才明白，$x^3$ 恰好是需要的量级：剖面刚性要在 $r(xv)/x$ 的尺度上取极限，把闭包误差除以 $x^3$ 才是"对极限方程有贡献"的自然尺度，而 $D_i=o(x)$ 这个前提正是把重叠涨落压到目标尺度以下；两边匹配之后，剩下的自由度就是一个正常数 $\kappa$，它出现在 `profile.tex:41--46` 的结论里。`cavity.tex:52--62` 的模 $\eta_n+(D_i/x)^\vartheta$ 也是同一件事的另一面：$\vartheta$ 固定、与阶数无关，这样 H\"older 一步就能把 $L^2$ 收敛转成 $L^1$（这个转化在 `profile.tex:113--117` 执行）。我原先想把 $\vartheta$ 优化成 $1$，以省掉一层 H\"older，试了两页就放弃：$\vartheta$ 来自检验迭代的有限深度与行的次数，取到 $1$ 需要额外的对数损失，而 $n^{1/6+o(1)}$ 形式的定理对这种损失完全无感。

## §8 两种坐标同时记账：质量会掩盖半径上的缝

剖面节的做法是把闭包结论搬进两个坐标系里再取极限。`profile.tex:55--60` 一开头就把理由说清：物理质量 $u$ 参数化种植分裂，重叠半径 $r$ 参数化逆分位数 $\alpha$ 及其首次变分；极限要在两种坐标里都取，因为一段地板区间可以有可忽略的质量与非可忽略的半径长度，只有半径侧的估计能察觉那里可能存在的缝。这句话是整节的设计原则，也是我在 §5 读到"地板"这个约束名之后才明白的用处：$\alpha'=k$ 的地板段在质量坐标下几乎是空的，任何只按 $du$ 加权的平均都会把它当成不存在。

带集与闭包引理在 `profile.tex:61--86`。固定 $0<c<C<\infty$，令

\[
 I_n(c,C)=\{r:0\le r\le Cx,\ cx\le\alpha(r)\le Cx\},
\]

端点处可用任一侧约定，$S(r)$、$D(r)$、$K(r)$ 记相应分裂处的量。结论三条：$\frac1{x^3}\int_{I_n(c,C)}D(r)^2\,dr\to0$；半径版本与质量版本同时成立；按

\[
 \rho_n(i)=\frac{S_i-\Gamma_n(K_i)}{x^3}
\]

有带上一致界 $|\rho_n(i)|\le C_{c,C}$，且 $\frac1x\int_{I_n(c,C)}|\rho_n(r)|\,dr\to0$，对应的归一化质量积分也趋于零；一致界包含带上内任意移动的分裂位置，沿任何满足 $D_i=o(x)$  such 序列 $\rho_n(i)\to0$（`profile.tex:68--86`）。

真正付账的是那行反密度损失的链式估计（`profile.tex:92--97`）：

\[
 \frac{\operatorname{Var}(x^{-1}\int_I L\,dr)}{x^2}\lesssim\frac{n^{o(1)}}{ne(x)x^4k(Cx)}\lesssim\frac{n^{1-\delta+o(1)}E^2}{e(x)x^2}\lesssim n^{-\delta+o(1)}.
\]

用法是把 `foundations.tex:147--158` 的三元组取质量权 $k_u=\mathbf1_I(r(u))/(x\alpha'(r(u)))$，再配上时钟不等式 $H_u\succeq cxC_u$ 与 $k(Cx)\gtrsim n^\delta u_*^2/x^2$（`profile.tex:98--101`）。我核对过这个权重的代价：$\alpha'(r(u))$ 在分母上，正对应"半径质量密度越小、半径积分越贵"，而地板 $k$ 恰好在最坏处给出下界 $\alpha'\ge k$，于是分母换成 $k(Cx)$ 是合法的放大。$k(r)$ 的具体形状 `comparisons.tex:66` 已经写好，代入 $u_*=\frac1{nE}$ 后 $k(Cx)\asymp n^\delta u_*^2/x^2$ 正是我需要的形式，这一步也解释了 §4 里 $u_*$ 这个参数为何要以 $1/(nE)$ 出现。

`profile.tex:101--105` 说，把这条估计与积分迹估计合起来，靠 `comparisons.tex` 里那条有序侧平均论证（我在 `fluctuations.tex:352--370` 读到它的实例化：$I_v^-=[s-v,s-v/2]$、$I_v^+=[s-v/2,s-v/4]$，$\overline L_v=\frac1{|I_v^+|}\int_{I_v^+}L_j\,dj$，先用 $2\mathbb E_uL_j=\mathbb E_u|X_j|^2\ge|X_u|^2$（$j\ge u$）得 $|X_u|^2\le2\mathbb E_u\overline L_v$，再用 $p=2$ 的钉扎矩不等式与 $\mathbb EW_j\le\frac2s\mathbb E\operatorname{tr}H_j^2$ 得 $\operatorname{Var}(\overline L_v)\le\frac{Ca_L\log n}{n\theta c_Lr_0sv}$），于是即便在 $\alpha'=k$ 占满大部分半径区间的地方结论仍然成立。条件 Jensen 只用在这条无条件估计之后（`fluctuations.tex:371`），顺序反了就会把一个 $n$-依赖的常数放进条件期望里。剩下的收尾很干净：原始界给 $D_i=O(x)$ 一致（`profile.tex:107`），闭包命题给固定 $\vartheta>0$ 与 $\eta_n\to0$ 使 $|\rho_n(i)|\le C\{\eta_n+(D_i/x)^\vartheta\}$（`profile.tex:108--112`），对 $du/x$ 或 $dr/x$ 任一味测度，带上测度有界、$D/x$ 在 $L^2$ 中趋零且一致有界，H\"older 把 $\int(D/x)^\vartheta$ 也压向零（`profile.tex:113--119`）。这一处是全文我最满意的一小段：所有精度都是三阶的商，模 $\eta_n+(D/x)^\vartheta$ 一次同时给出一致界与两种坐标的 $L^1$ 极限，包括地板区间上的半径极限。

## §9 小尺度刚性：势的非负、严格曲率与 $\kappa$ 的存在

标量化之后一切都写在一个热方程里。`profile.tex:124--146` 固定一条完整标量协方差路径 $K$，$\Gamma(k)$ 是它在协方差值 $k$ 处的标量矩曲线（对 $k$ 求导时保持整条路径、从而标量时间里的质量剖面不动）；标量时间 $q=k/T$ 下 $\alpha_K(q)=|\{u\in(0,1):K_u/T\le q\}|$，$K$ 的跳跃用它的常数质量填满、初始空时钟用质量 $0$ 填。延续 $V$ 与最优扩散是

\[
 V_q=-\frac T2\bigl(V_{zz}+\alpha_K(q)V_z^2\bigr),\qquad dZ_q=T\alpha_K(q)V_z(q,Z_q)\,dq+\sqrt T\,dB_q,\qquad Z_0=0,
\]

终端函数 $\log\cosh z$；加一个质量 $1$ 的终端时钟只把 $V$ 改成一个 $z$ 的常数，不动它的正阶空间导数（`profile.tex:140--142`）。记 $\widehat\Gamma(q)=\Gamma(Tq)=\mathbb E V_z(q,Z_q)^2$（`profile.tex:143--146`）。`profile.tex:148--152` 说明这批矩恒等式是 Auffinger--Chen 那篇命题 3 的 SK 特化，也见 Jagannath--Tobasco 引理 8.4，作者选择自己给出扩散推导，理由是还要一条四阶导数的一致界。

`profile.tex:154--170` 的引理给：总方差有界的标量时钟下，每个固定阶的正阶空间导数一致有界，对标量时间绝对连续，且每个固定空间阶的几乎处处时间导数一致有界；$V$ 对 $z$ 偶、$V_{zz}>0$，并且

\[
 \widehat\Gamma'(q)=T\mathbb E V_{zz}(q,Z_q)^2,\qquad \widehat\Gamma''(q)=T^2\mathbb E\bigl[V_{zzz}(q,Z_q)^2-2\alpha_K(q)V_{zz}(q,Z_q)^3\bigr],
\]

还有只依赖 $T$ 与总时钟界的常数 $c,C>0$ 使 $c\le V_{zz}(0,0)\le C$（`profile.tex:167--170`）。$\widehat\Gamma'$ 是正的期望平方，这条单调性我是当作"势的非负变分来源"来用的：$G=0$ 的接触条件（`comparisons.tex:200--203`）把 $S$ 与 $r$ 绑在一起，而 $\Gamma$ 的严格曲率阻止剖面出现平台。$\widehat\Gamma''$ 那一项里 $V_{zzz}^2$ 与 $-2\alpha_KV_{zz}^3$ 的符号相反，所以二阶信息必须靠三阶项压制，这正是 `profile.tex:151--152` 强调"还要一条四阶导数一致界"的原因；我第一次读时以为那只是一句技术补充，其实它是极限斜率存在的前提。

刚性定理本体在 `profile.tex:38--51`。前提是直接检验假设（`profile.tex:17--30`：数据满足 `comparisons.tex` 的那组参数条件、$r=r_n$ 在指定正强度处最小化 $\mathcal F_\lambda$、$x=x_n\to0$ 且 $x\gtrsim a$、$e(x)x^2\gtrsim nE^2$、$e(x)\gtrsim x^2$；存在固定 $C_0,c_0,C_1>0$ 使 $c_0u\le r(u)\le C_1u$ 对 $C_0x\le u<1$；被省略的质量（若存在）是 $u_0=o(x)$；初始半径服从那组夹逼；矩阵与场时钟总量由固定常数界住；这些正是直接检验矩命题的假设，并且蕴含 $x=O(d)$。$K_u=h_u+b_uS_u$ 非负非降）。结论是每条序列都有子列，使某个 $\kappa$ 满足

\[
 \frac{r(xv)}{x}\longrightarrow\frac v\kappa\quad\text{在 }v\in(0,\infty)\text{ 上局部一致},\qquad 0<c\le\kappa\le C<\infty,
\]

其中 $\kappa$ 的界只依赖 $T$ 与总时钟界；对被省略下组的比较，只要它的改动路径与首次变分里用到的受约束竞争者容许，同一结论成立（`profile.tex:41--51`）。剖面在这个尺度上是线性的，斜率的倒数 $\kappa$ 由闭包 $S=\Gamma(K)$ 与 $K=h+bS$ 共同定出；$x^3$ 阶的闭包误差正好落在"不影响斜率、但决定斜率存在"的位置上。$\kappa$ 的界与 $n$ 无关这件事是传播节的燃料：所有可能的斜率都被夹在固定正上下界之间（`propagation.tex:20--24`）。

顺带记一笔我在 §6 结尾提到的量级校验：`profile.tex:28--30` 的 $x=O(d)$ 与 `cavity.tex:17` 的 $x\le W\lesssim d$ 是同一条信息，而 `cavity.tex:120` 用到的 $n^{-1/2}\ll x^3$ 就是 $x\gg n^{-1/6}$。三条式子指向同一个下限，我在纸上把它们排成一列才算说服自己 $1/6$ 没有算错。

## §10 宏观起点：剖面在正下界尺度上认出了 Parisi 极小元

`profile.tex:3--8` 交代了本节两句话的第二句：尺度趋于零处，单点闭包加比较的首次变分逼出线性化重叠分位数；尺度被正下界界住处，极小元收敛到标量 Parisi 极小元。后者给宏观起始剖面，前者给传播所能到达的更小尺度。这个分工我一开始读反了，以为宏观结论是收尾的装饰，实际它是整条归纳的地面：传播从大尺度往下走，第一级必须有可依赖的剖面。

支撑它的是极小元结构这一串结果。`introduction.tex:79--92` 列出：Auffinger 与 Chen 建立原点支撑与正则性性质，并用随机控制表示证唯一性；Jagannath 与 Tobasco 发展变分支撑与自洽条件；Zhou 得到临界温度附近的区间支撑；Lopatto 在每个固定 $\beta>1$ 处建立区间支撑 $[0,q_\beta]$ 与相应密度结构。本文用 Lopatto 那条定理加上那里的支撑自洽引理，然后在剖面节里从标量扩散恒等式与一条严格的四阶导数估计推出本文需要的严格正初始密度（`introduction.tex:88--92`）。这段依赖关系解释了为什么 §9 要把 $V_{zz}(0,0)$ 的上下界单独写成一条引理：初始密度的正性来自 $z=0$ 处的曲率，而 $V$ 对 $z$ 偶（`profile.tex:160`）把原点曲率变成全局信息的入口。

`propagation.tex:19--24` 给出本文实际消费的形式：在宏观尺度上相应的结论是同一条刚性陈述的宏观版本，小尺度极限里可能的斜率有固定的正上下界，宏观极限分位数相对质量也有同一类界，这些界只依赖 $T$ 与总时钟的一致界。也就是说，传播论证从不关心剖面的具体值，只关心它被夹住这件事。这是我最想留下的一条经验：一个"识别到 Parisi 极小元"的强结论，在下游只被用作"有固定正界"的弱性质；定理里那部分力气花在了让归纳的基例合法，花在了证明手法必须与 Auffinger--Chen 的严格凸性方法同源（`introduction.tex:161--163`）。

[推测] 我没有把宏观命题证明的中间段读进这份笔记（取证窗口在 §9 那两条引理处截断），所以本节关于宏观极限如何与唯一极小元对接的具体步骤不写细节，只记它被下游消费的方式。若后续要复核这一点，入口在 `profile.tex` 后半部分的宏观命题与其后的控制论证。

## §11 正则性传播：跟着一个假想的失败走，直到预算耗尽

前面每一节的局部论证都带一条外正则假设（§5 定义、§6 使用、§9 使用）。传播节负责把这条假设从结论里删掉，`propagation.tex:3--9` 立题：固定 $T>1$ 与充分小的 $m>0$，$\delta=m/10000$，$n\to\infty$ 时这些参数冻结；常数可依赖 $T$、$m$、总协方差时钟的固定界，以及下面指定的有限递归深度；本节没有任何陈述对 $m=m(n)$ 的一致版本。这个"深度在 $n\to\infty$ 之前固定"的纪律与 `introduction.tex:206` 那条一致，也是 §3 里我抱怨过的束缚，到这里才知道它换来什么。

两个输入在 `propagation.tex:10--33`：剖面刚性（小尺度用 §9 的定理，宏观用 §10 的命题），以及条件化的比较误差。后者说，若极小元在 $A(\lambda)=n^\delta\sqrt nE/\sqrt\lambda$ 之上有一个正则外区，则 §5 那条沿 $\log\lambda$ 的上导数被 $n^{10\delta}E$ 界住，对 $\lambda\ge n^{-10}$ 成立；若 $A(\lambda)$ 被正下界界住，这条误差界就不需要剖面假设；被省略的初始区间在两种说法里都容许（`propagation.tex:24--33`）。对比 `comparisons.tex:156` 的"整个 $0\le\lambda\le n^{-10}$ 只花 $O(n^{-10})$"，$\lambda\ge n^{-10}$ 这个门槛是把免费段排除在外以免包络导数失去意义。

机制写在 `propagation.tex:35--48`，我读三遍才敢复述：沿着一个假定的失败走。在选定的坏父尺度上，父节点有正则外区；足够的局部强度已经被直接的剖面检验排除；剩下的情形里构造一个更强的局部比较。若它的误差界成立，就与父节点一致；当 $x\to0$ 时这给子节点提供外正则、从而可用直接剖面检验，当 $x$ 有正下界时宏观直接结论可用。两种情形下子剖面反传回去，与父节点失败矛盾。所以子误差必须失败；这次失败选出另一个强度与极小元，给出一个新的坏剖面。构造使每一步把 $E$ 至少抬 $n^{\delta/4}$，而数据把 $E_j$ 关在依赖层级的固定倍数的 $n^{-5/6+2m}$ 与 $n^{-1/2}$ 之间；于是在 $n\to\infty$ 前固定的深度就够用。`propagation.tex:47--48` 补一句：更早的有限次数空腔递归（§6--§7 那套检验因子）已经完成了，两者是不同的"有限"。这个区分我特意记下来，因为两条递归都叫"有限步"，一个随 $n$ 冻结在次数 $N$ 与深度上，一个冻结在预算 $E$ 的可达区间长度上。

子代数据的引理在 `propagation.tex:105--126`。设父比较的数据成立、其最优分位数在 $x$ 之上有正则外区，且

\[
 A(\lambda)\le x\le1,\qquad e(x)=o(x^2).
\]

取与 $n$ 无关的固定 $c_0>0$，令

\[
 d'=c_0x,\qquad E'=\min\{n^{-1/2}d'^2,\ n^{-100\delta}e(x)x^3\},\qquad a'=\frac{\sqrt nE'}{d'},
\]

则对充分大的 $n$，子数据在同一 $m$ 下满足 `comparisons.tex:32--37` 那组条件，并且 $E'\ge n^{\delta/4}E$、$a'\ge a$；把改动后的父路径当子的裸端点用，它在所有需要的测试尺度上满足端点假设；长度 $u_0=o(a)$ 的省略区间仍是 $o(a')$（`propagation.tex:118--126`）。`propagation.tex:128--133` 解释两个上界的分工：$n^{-1/2}d'^2$ 让子留在参数范围里，另一个上界让成功的子误差相对父子分离的代价 $e(x)x^3$ 可忽略，而两者仍允许 $E'$ 比 $E$ 大一个固定幂。$e(x)x^3$ 这个代价是 §7 那个三阶闭包的直接反映：分位数尺度错了 $x$，压力就错 $e\cdot x\cdot x^2$。

证明里的算术我逐步核过（`propagation.tex:135--160`）。数据条件先给出 $d\ge a\gtrsim n^{-1/6+m}$、$E\gtrsim n^{-5/6+2m}$、$nEa\gtrsim n^{3m}$；强度剖面服从 $e(t)\gtrsim\min(\lambda,d^3/t)$ 且 $te(t)$ 递增；由 $x\ge A(\lambda)$ 与 $\sqrt\lambda\sqrt nE\le d^3$ 得 $x\ge n^\delta a$ 以及 $e(x)x^2\gtrsim\min(\lambda x^2,d^3x)\gtrsim n^{1+\delta}E^2$，无论 $x$ 趋于零还是宏观（`propagation.tex:141--149`）。再记 $E'_{\rm c}=n^{-1/2}c_0^2x^2$、$E'_{\rm s}=n^{-100\delta}e(x)x^3$，两条下界比值分别是 $\frac{E'_{\rm c}}{n^{-2/3+m}d'}=c_0n^{1/6-m}x\gtrsim c_0n^\delta$ 与 $\frac{E'_{\rm s}}{n^{-2/3+m}d'}\gtrsim c_0^{-1}n^{3m-99\delta}$（`propagation.tex:151--159`）。注意第一条里又冒出 $n^{1/6}$：它是 $x\ge n^\delta a\gtrsim n^{-1/6+\delta+m}$ 代入的结果，与 §4、§6 的两处校验同源。$c_0$ 既能任意大又能任意小，说明父尺度到子尺度的缩放量级 $d'=c_0x$ 不受约束，$c_0$ 只出现在常数里；这是我以为需要精细调参而实际不需要的地方。

容许族的定义（`propagation.tex:52--94`）把这套迭代合法化：$P_r=(b_0-e(r)\mathbf1_I,\ h_0+e(r)r\mathbf1_I)$、$\mathcal P_e(r)=\frac14\int_Ie(r)r^2\,du$、$\mathcal V(\lambda)=\min_r\{f_n(P_r)+\mathcal P_e(r)\}$；普通族要求裸端点容许且对每个可行 $r$ 与 $0\le\lambda\le d^2$ 都容许，固定强度族只要求在指定正强度处容许、裸系数自身可以定义不出容许协方差路径。加一个与 $r$ 无关的项不改极小元也不改剖面结论，但 $\mathcal V(\lambda)$ 始终指未加该项的值，所有误差界与强度导数都相对这个值，于是依赖 $\lambda$ 的项必须在每个强度先减掉再套界（`propagation.tex:67--72`）。这条约定我踩过：$\theta$ 的墙罚金与 $\log\lambda$ 导数不在同一侧，忘记先减就会把一个正项当成误差。还要求 $d^2\le T-\rho$（$\rho\in(0,T)$ 固定），子系数 $c_0$ 总取 $c_0^2\le T-\rho$ 以保证后裔保持此假设（`propagation.tex:73--76`）；递归比较要么在全部质量上作用且有正的下界裸矩阵协方差，要么只在 $I$ 上作用、$I$ 上有正矩阵协方差且在 $u_0$ 处有正矩阵跳跃；高段族之后可以接全质量族，一旦改动做完所有后续后裔都在全质量上作用（`propagation.tex:77--86`）。`propagation.tex:96--103` 那句"沿着整条有限链，每次花掉的都少于每个这种界的一半"，就是这条链不会把协方差预算烧光的记账理由，与图 `figures/proof-order.tex` 里的"协方差预算保容许、误差预算递增耗尽"两件事对应。

## §12 将目标改写成一个正窗口，并把 $s$ 定在 $n^{-1/6}$ 上方

`fluctuations.tex:3--26` 把符号复位。用均匀自旋先验，$H_n^{\rm off}(\sigma)=\frac\beta{\sqrt n}\sum_{i<j}g_{ij}\sigma_i\sigma_j$、$F_n=\log(2^{-n}\sum_\sigma e^{H_n^{\rm off}(\sigma)})$；$D$ 是独立的中心高斯、方差 $T/2$，$F_n^c=F_n+D$。事实核对：$\mathbb E H_n^{\rm off}(\sigma)H_n^{\rm off}(\tau)=\frac{nT}2R(\sigma,\tau)^2-\frac T2$，所以完成的哈密顿量协方差正是 $f_n$ 定义所要求的 $nTR^2/2$；完成把方差恰好改变 $T/2$，独立性给出中心变换的精确修正

\[
 \log\mathbb E e^{t(F_n^c-\mathbb EF_n^c)}=\log\mathbb E e^{t(F_n-\mathbb EF_n)}+\frac{Tt^2}{4},
\]

而把均匀先验换成计数测度只是加上确定常数 $n\log2$，对中心涨落无影响（`fluctuations.tex:19--26`）。这条精确修正是我在 §3 里"宁可多引一个可移除变量"那个直觉的兑现：加噪声的代价是一个 $t^2$ 的确定项，删掉它不需要任何估计。

参数选择是全部戏剧性的地方（`fluctuations.tex:28--36`）：固定 $m$ 满足 $0<m<1/300$，$\delta=m/10000$，下面所有断言对充分大的 $n$ 成立、常数与阈值可依赖 $T$ 与 $m$，选取顺序重要、$m$ 在 $n\to\infty$ 之前冻结。令

\[
 s=n^{-1/6+5m},\qquad p(\varepsilon)=f_n(T-\varepsilon\mathbf1_{\{u<s\}},0),\qquad 0\le\varepsilon\le T.
\]

$\varepsilon=0$ 端点把所有矩阵无序积分在质量 $0$，$\varepsilon=T$ 端点把它积分在质量 $s$；两端自校正都是 $T/4$，于是 $p(0)=\frac1n\mathbb EF_n^c-\frac T4$、$p(T)=\frac1{ns}\log\mathbb E e^{sF_n^c}-\frac T4$，而

\[
 K_n(s):=\log\mathbb E e^{s(F_n^c-\mathbb EF_n^c)}=ns\,[p(T)-p(0)].
\]

目标是窗口 $c_{T,m}n^{20m}\le K_n(s)\le C_{T,m}n^{100m}$（`fluctuations.tex:39--48`）。我读到这里才真正明白 $1/6$ 是解出来的：$p$ 的增量至多是 $\frac14\int_0^sB_u\,du\le\frac s4$（`fluctuations.tex:51--56` 由 `foundations.tex:149` 的求导公式得到，顺带说明 $p$ 递增），所以 $K_n(s)\le ns\cdot\frac T4\cdot s/s$ 这类粗界给的是 $K_n(s)=O(ns\cdot s)=O(ns^2)$；要让下界为正、上界不炸，就必须把 $s$ 定在临界处。把 §13 那条下界 $p(\varepsilon)-p(0)\ge c\varepsilon s^3$ 代进去，

\[
 K_n(s)\ \ge\ ns\cdot c\varepsilon s^3=c\,\varepsilon n s^4,\qquad \varepsilon=n^{-1/3},\ s=n^{-1/6+5m}\ \Rightarrow\ \varepsilon n s^4=n^{20m},
\]

即 $n^{-1/3}\cdot n\cdot n^{-2/3+20m}=n^{20m}$。$s=(n\varepsilon)^{-1/4}$ 这个关系把 $1/6$ 从 $-\frac13+1=-\frac23$ 再除以 $4$ 直接给出，与 §4 里 $-2/3+1/2=-1/6$ 是同一条算术的两副面孔。我原来的写法是"$s$ 超过 $n^{-1/6}$ 一个任意小的固定幂"（`introduction.tex:104--107`），到这里具化成 $5m$；上界窗口 $n^{100m}$ 与下界 $n^{20m}$ 的不对称也来自 $m$ 在链里被乘的次数不同，与结论的指数无关。

## §13 下比较：弦不等式，以及 $\varepsilon s^3$ 如何胜过误差

先记下本节通用的插值形态（`fluctuations.tex:65--72` 的弦比较引理）。设 $(b,h)$ 与 $(b+a,h-c)$ 是有界容许路径，$a\ge0$，且 $c=0$ 在 $a=0$ 处；若 $c^2/a$ 可积（在 $a=c=0$ 处商取 $0$），则

\[
 f_n(b+a,h-c)\le f_n(b,h)+\frac14\int_0^1\frac{c(u)^2}{a(u)}\,du.
\]

证明沿线段 $(b+ta,h-tc)$ 求导：$-\frac14\int aB\,du+\frac12\int cS\,du\le\frac14\int(-aS^2+2cS)\,du\le\frac14\int\frac{c^2}{a}\,du$，用到 $B\ge S^2$ 与配方（`fluctuations.tex:74--86`）。又是配方，§5 的 $D^2+(S-r)^2$ 与这里的 $c^2/a$ 是同一枚硬币：前者给误差结构，后者给两点之间的最优代价。假设只谈它的两个端点路径，两个容许时钟的逐点差不必还是递增时钟（`fluctuations.tex:60--63`），这条提醒是我后来才看懂的，因为 §14 的高段场墙恰恰要用一个非单调的差去套弦引理。

下比较取 $\varepsilon=n^{-1/3}$，把短比较作用在定义 $p(\varepsilon)$ 的端点上、全质量、

\[
 d=s=n^{-1/6+5m},\qquad E=n^{-2/3+2m}d=n^{-5/6+7m}.
\]

此时 $a=\sqrt nE/d=n^{-1/6+2m}$ 且 $\varepsilon=o(a^2)$，于是 `comparisons.tex` 的参数条件与端点假设都成立；所有矩阵路径保持一致正（`fluctuations.tex:88--96`）。末强度剖面有 $e(r)=d^2f(r/d)$ 与 $n^\delta\frac{\sqrt nE}{d}=n^{-1/6+2m+\delta}=o(s)$，因此 §11 得到的正则性在 $s/2\le u\le s$ 上给 $r\asymp s$，特别地那里 $e(r)\asymp s^2\gg\varepsilon$（`fluctuations.tex:96--104`）。$d=s$ 这个取法值得停一下：它让 `comparisons.tex:32--37` 的两侧约束同时贴边，$n^{-2/3+m}d\le E\le n^{-1/2}d^2$ 变成 $n^{-5/6+m}\le n^{-5/6+7m}\le n^{-5/6+10m}$，三处 $-5/6$ 全同，靠 $m$ 的系数 $1<7<10$ 撑开缝隙。我第一次自己凑这组数时试图让 $d>s$，结果 $o(s)$ 那条失效，正则性在测试尺度上落不到 $[s/2,s]$，整段下界变成空话。

设 $P$ 为这条改动路径、$\mathcal P_e=\int er^2/4$ 为其罚金。比较误差给 $f_n(P)+\mathcal P_e\le p(\varepsilon)+n^{20\delta}E$；用残差矩阵协方差 $e+\varepsilon\mathbf1_{\{u<s\}}$ 与残差场 $er$ 套弦引理，把 $p(0)$ 从上方由同一个改动压力加相应弦罚金界住。两式相减得（`fluctuations.tex:106--123`）

\[
 p(\varepsilon)-p(0)\ge\frac14\int_0^s\frac{\varepsilon e(r)}{e(r)+\varepsilon}\,r^2\,du-n^{20\delta}E\ge c_{T,m}\varepsilon s^3,
\]

最后一步的理由是 $[s/2,s]$ 上的积分被常数倍的 $\varepsilon s^3=n^{-5/6+15m}$ 界住，而误差是 $n^{-5/6+7m+20\delta}$（`fluctuations.tex:124--126`）。两个 $-5/6$ 相减，胜负只在 $m$ 的系数：$15m$ 对 $7m+20\delta$，由 $\delta=m/10000$ 得 $7m+20\delta<15m$，赢 $8m$ 的余量。于是 $K_n(s)\ge ns[p(\varepsilon)-p(0)]\ge c_{T,m}n^{20m}$（`fluctuations.tex:127--129`）。分式 $\frac{\varepsilon e}{e+\varepsilon}$ 的形状是弦引理与短比较联合的产物：它同时给出"弱端点损失"与"强端点收益"的调和，若 $\varepsilon\gg e$ 退化到 $e$、若 $\varepsilon\ll e$ 退化到 $\varepsilon$，而我们的区域是后者。

[推测] 上比较与高段墙的细节我只读到 `fluctuations.tex:131--175` 与 $[\,\varepsilon_0,T)$ 上的墙构造，后面那段低场扫与最终标准差转换（指数增广、Prékopa 与小球估计）没有逐行读，§15 那节的相关陈述取自 `introduction.tex:195--203`，我按引言的口径写，具体常数留在原处不假造。

## §14 上比较与低场墙：把 $\varepsilon$ 从 $\varepsilon_0$ 推到 $T$ 的每一段代价

初始上比较（`fluctuations.tex:131--156`）先把 $\varepsilon_0$ 定下来：

\[
 d_H=n^{-1/6+15m},\qquad d_N=n^{-1/6+25m},\qquad \varepsilon_0=d_Hd_N=n^{-1/3+40m}.
\]

对定义 $p(0)$ 的端点用全质量短比较，取 $d=d_N$、$E=n^{-2/3+2m}d_N$。在末强度下，由 `comparisons.tex:169--172` 的测试尺度范围与单调性，在质量 $s$ 以下有 $r\le Cd_N$；$f$ 在有界区间上为正，故那里 $e(r)\ge cd_N^2$。因为 $\varepsilon_0/d_N^2=n^{-10m}$，残差矩阵协方差 $e-\varepsilon_0\mathbf1_{\{u<s\}}$ 对大 $n$ 为正，于是可以套弦引理：

\[
 p(\varepsilon_0)-p(0)\le\frac14\int_0^s\frac{\varepsilon_0e(r)}{e(r)-\varepsilon_0}\,r^2\,du+n^{20\delta}E\le Cs\varepsilon_0d_N^2+n^{20\delta}E\le C_{T,m}\bigl(n^{-5/6+95m}+n^{-5/6+27m+20\delta}\bigr).
\]

我逐项验过幂：$s\varepsilon_0d_N^2=n^{-1/6+5m}\cdot n^{-1/3+40m}\cdot n^{-1/3+50m}=n^{-5/6+95m}$，$n^{20\delta}E=n^{20\delta}\cdot n^{-2/3+2m}\cdot n^{-1/6+25m}=n^{-5/6+27m+20\delta}$。这两处就是上界本身：$K_n(s)\le Cn^{100m}$ 除以 $ns=n^{5/6+5m}$ 给出 $p(T)-p(0)\lesssim n^{-5/6+95m}$ 量级的要求，$95m$ 对 $100m$ 留 $5m$ 给后面。分式 $\frac{\varepsilon_0e}{e-\varepsilon_0}$ 在 $e\gg\varepsilon_0$ 时趋于 $\varepsilon_0$，比值 $n^{-10m}$ 就是这个"远大于"的定量形式。`fluctuations.tex:156` 一句"只剩下更大的 $\varepsilon$ 间隔"，说明后面是把 $[\varepsilon_0,T)$ 分段推过去。

高段比较作用在 $A=[s,1]$ 上（`fluctuations.tex:158--175`）。固定 $\varepsilon\in[\varepsilon_0,T)$，取

\[
 q=\frac14\min(\varepsilon,T-\varepsilon),\qquad c_L=2q,\qquad d=d_H,\qquad E=n^{-2/3+10m}d,
\]

在 `comparisons.tex:63--72` 的约束下用 $u_*=(nE)^{-1}$、$r_{\min}=\frac{u_*}{2M(s)}$、$r_0=\frac{d^2r_{\min}}{2\varepsilon}$，末强度仍是 $e(r)=d^2f(r/d)$。低场由墙给出：取 $\tau=n^{-10}$ 与

\[
 \psi(u)=\frac{\log\bigl((s+\tau)/(s-u+\tau)\bigr)}{\log\bigl((s+\tau)/\tau\bigr)},\qquad 0\le u\le s,
\]

于是 $\psi(0)=0$、$\psi(s)=1$、$\psi$ 递增，且当 $s-u\ge\tau$ 时 $\psi'(u)\ge\frac{c}{(s-u)\log n}$（`fluctuations.tex:176--181`）。这个对数墙是我在本节觉得最不自然、事后又觉得最必然的构造：它要在 $u\to s$ 时把场的导数放大到 $(s-u)^{-1}$ 量级，同时保持总量 $O(1)$；$\tau=n^{-10}$ 是让墙在末端不炸的截断。为什么需要这么陡：磁化率不等式要对场导数积分，$\psi'$ 的下界直接把 $\int\mathbb E\operatorname{tr}H_u^2\,du$ 压成 $\frac{Ca_Lv\log n}{n\theta c_Lr_0}$（`fluctuations.tex:339--344`），墙的陡峭就是方差账本里的分母。

对 $0\le\theta\le1$ 关于高段分位数最小化

\[
 J_\theta(r)=f_n\bigl(T-\varepsilon\mathbf1_{\{u<s\}}-\theta c_L\mathbf1_{\{u<s\}}-e(r)\mathbf1_A,\ \theta c_Lr_0\psi\mathbf1_{\{u<s\}}+e(r)r\mathbf1_A\bigr)+\frac14\int_Ae(r)r^2\,du+\frac{\theta c_L}{4}\int_0^sr_0^2\psi(u)^2\,du,
\]

$J_\theta^*$ 记其最小值；此后所有 $S,B,D,K$ 都指实际的极小改动路径、不指未改的低场系数（`fluctuations.tex:183--198`）。容许性与墙剖面的引理（`fluctuations.tex:200--254`）给出一串代入值：$a=n^{-1/6+10m}$、$u_*=L=n^{-1/6-25m}$、$M(s)\asymp n^{30m+\delta}$、$r_{\min}\asymp n^{-1/6-55m-\delta}$，从而 $s=o(a)$、$d^2=o(\varepsilon_0)$、$r_{\min}/d\to0$。$f$ 在零附近等于 $1$，所以初始高场恰为 $d^2r_{\min}$；低群上的场至多 $c_Lr_0\le\frac\varepsilon2\cdot\frac{d^2r_{\min}}{2\varepsilon}=\frac{d^2r_{\min}}4$，因此 $s$ 处没有向下的场跳跃，两条场路径在各自区间上递增；低矩阵系数至少 $(T-\varepsilon)/2\ge0$，墙处高低系数之差 $\varepsilon+\theta c_L-d^2>0$；$e$ 递减使高矩阵路径递增（`fluctuations.tex:219--230`）。这些正是墙均匀性推论的墙数据（取 $\varphi=\psi$），固定协方差余量也一致：$\varepsilon<T/4$ 时低协方差至少 $5T/8$、高协方差至少 $T-d^2$，$\varepsilon\ge T/4$ 时高到低之差至少 $T/4-d^2$（`fluctuations.tex:234--238`）。$J_\theta$ 里的低段罚金与高段分位数无关，故不改极小元、并在推论用到的移动不等式里相消（`fluctuations.tex:242--245`）；末强度截断是 $A_{d^2}=n^\delta a=n^{-1/6+10m+\delta}=o(d)$，所以外正则恰好在尺度 $d$ 上可用（`fluctuations.tex:249--253`）。

低群均值的压制（`fluctuations.tex:256--305`）是墙论证的收获：对每条极小改动路径、对低群分裂一致地，

\[
 S_u=\frac{K_u}{T}+O(d^3),\qquad S_u\le\frac{Cd^3}{\varepsilon}=:a_L,\qquad K_u=h_u+b_uS_u,\quad 0\le u<s.
\]

理由分三段。在尺度 $x=d$ 上末强度满足 $e(d)\asymp d^2$，所以 $W\asymp d$；上面的截断在那里给外正则；其余直接检验不等式来自 $d/a=n^{5m}$、$\frac{nE^2}{e(d)d^2}\asymp n^{-10m}$，并且 $ne(d)d^4\asymp n^{90m}\to\infty$（`fluctuations.tex:268--276`）。正则高带投影与原始界给 $K_u=O(d)$、$D_u=O(d)$，于是省略组的 $O(x^3)$ 版闭包给 $S_u=\Gamma(K_u)+O(d^3)$，其假设只要容许改动路径与省略质量 $s=o(d)$、不要求省略分裂处的端点假设（`fluctuations.tex:277--283`）。再取 $C$ 使所有低群时钟落在 $[0,Cd]$，低时钟线性化引理在 $x=d$、省略质量 $u_0=s=o(d)$ 处给出 $\sup_{0\le K\le Cd}|\Gamma(K)-K/T|=O(d^3)$（`fluctuations.tex:284--292`）。这一步是 §9 那个"斜率倒数 $\kappa$"在这里的具体值：$\kappa=T$。最后，低群上 $b_u=T-\varepsilon-\theta c_L$、$0\le h_u\le d^2r_{\min}/4=O(d^3)$，故 $(\varepsilon+\theta c_L)S_u=h_u+O(d^3)\le Cd^3$（`fluctuations.tex:296--301`）。

墙的扫动代价（`fluctuations.tex:309--327`）把 $\theta:0\to1$ 的变化折成压力增量：一致地对 $\varepsilon_0\le\varepsilon<T$，

\[
 J_1^*-J_0^*\le C\Bigl[c_Ls(a_L^2+r_0^2)+\frac{a_L(\log n)^3}{nr_0s}+n^{-10}\Bigr],
\]

从而

\[
 p(\varepsilon+q)-p(\varepsilon)\le n^{20\delta}E+C\Bigl[s\frac{d^6}{\varepsilon_0}+\frac{d}{nsr_{\min}}(\log n)^3+n^{-10}\Bigr].
\]

我用 §7 的 $a_L\le Cd^3/\varepsilon_0$ 验了第一项：$c_Lsa_L^2\le\frac\varepsilon2 s\frac{Cd^6}{\varepsilon^2}\le Cs\frac{d^6}{\varepsilon_0}$，正是右式的形态；再代 $d=d_H$、$s$、$\varepsilon_0$ 得 $n^{-1/6+5m}\cdot n^{-1+90m}\cdot n^{1/3-40m}=n^{-5/6+55m}$，比目标 $n^{-5/6+95m}$ 多出 $40m$ 的余量。第二项是 $n^{-1/6+15m-1+1/6-5m+1/6+55m+\delta}(\log n)^3=n^{-5/6+66m+\delta}(\log n)^3$，同样在目标之内。中间那步用了配对区间 $I_v^-=[s-v,s-v/2]$、$I_v^+=[s-v/2,s-v/4]$ 上的侧平均与 $p=2$ 的钉扎矩不等式，得到 $\mathbb E|X_u|^4\le4\mathbb E\overline L_v^2$ 这一类控制（`fluctuations.tex:329--375`）。

[推测] 把这段逐 $\varepsilon$ 的增量沿 $q=\frac14\min(\varepsilon,T-\varepsilon)$ 的几何步长跑完、从而得到 $p(T)-p(0)$ 的上界收尾求和，我没有读到原文那几页；上面三项每一项都低于 $n^{-5/6+95m}$，$\varepsilon$ 从 $\varepsilon_0$ 推到 $T$ 需要 $O(\log\frac T{\varepsilon_0})=O(\log n)$ 步，对数损失被 $m$ 的余量吸收，这与 `fluctuations.tex:39--48` 申报的 $n^{100m}$ 上界一致。

## §15 从窗口到标准差：正变换为什么单独不够，以及辅助变量的删除

引言把最后一步写得很克制（`introduction.tex:195--203`）：把得到的比较作用起来得到正 Laplace 窗口；一个正变换本身不控制方差、也不控制典型幅度；按 Aronow--Lopatto 的指数增广论证，往 $F_n^c$ 上再加一个独立的率为 $1$ 的指数变量；规范对称性与 Prékopa 的边缘定理给出一条对数凹密度；它的矩估计与小球估计把窗口转成标准差断言与典型幅度断言；最后把加进去的指数变量与高斯变量删掉，证明完成。

我把这段拆成三件必须的事。第一件，$K_n(s)\in[cn^{20m},Cn^{100m}]$ 只是变换在一点 $s$ 的值，方差是二阶矩信息，而单一点上的对数矩生成函数两侧都定不住它：一个在尺度上远大于 $n^{1/6}$ 的稀疏事件也能造出同样的 $K_n(s)$。第二件，对数凹性是把这些散点信息缝成整体形态的唯一入口；加指数变量正是让密度成为某个对数凹函数的一维边缘，Prékopa 保证边缘仍对数凹，而规范对称性（自旋整体翻转让 $F_n$ 的分布不动）提供单峰方向；$F_n^c=F_n+D$ 里的高斯噪声在这一步也顺手，它把可能存在的原子抹成密度。第三件，对数凹密度下小球概率与矩之间有双向控制，这就是"矩估计与小球估计"的具体作用。§12 那条精确修正 $\log\mathbb E e^{t(F_n^c-\mathbb EF_n^c)}=\log\mathbb E e^{t(F_n-\mathbb EF_n)}+\frac{Tt^2}{4}$（`fluctuations.tex:21--24`）说明删 $D$ 只花一个 $t^2$ 的确定项，删指数变量只改常数倍；两者都不动 $n$ 的幂，这正是"用辅助随机变量换结构、最后再删"能成立的原因。

这里也有一个我一开始不肯接受的取舍。给 $F_n$ 加噪声会让方差变大 $T/2$（`companion-interface.tex:19--21` 明确写 $\operatorname{Var}F_n^c=s_n(\beta)^2+T/2$），在 $n^{1/3}$ 量级面前这个 $T/2$ 无害，若目标是极限分布或常数前置因子，它就是不可原谅的污染。本文用对数凹技巧换来的东西，代价是把结论限制在"只有幂指数"这一档。这与我 §1 里那条"缺的是从大偏差量级到标准差量级的合法传递"呼应：传递拿到了，手段是定理本身放弃极限形态。

## §16 附录接口：哪些估计可以外交给极限分布那一篇文章

`companion-interface.tex:1--12` 说明这节的存在理由：给同作者的极限分布文章圈定可用估计的范围，且提醒有限树微积分、渐近比较结论、以及"用这些结论的证明"三者假设不同；在下列规范化下这些假设继续有效；每一个标签数、多项式次数、导数阶、矩阶与递归深度都在系统尺寸趋于无穷之前固定，常数与尺寸阈值可以依赖这些固定选择。最后那句把我 §3 里那条束缚变成了可交接的合同条款。

涨落规范化（`companion-interface.tex:14--24`）：那边用 $s_n(\beta)^2$ 表示计数先验、非对角对数配分函数的方差，那个自由能等于本文的 $F_n+n\log2$，所以主定理直接给出 $s_n(\beta)=n^{1/6+o(1)}$；层级比较用的完成变量满足 $\operatorname{Var}F_n^c=s_n(\beta)^2+T/2$；指数定理既不给极限分布也不给方差前置因子，那两条是那边文章的独立结论。

物理尺寸的规范化（`companion-interface.tex:26--46`）：$[0,\ell]$ 上的层级（$1\le\ell\le4$、终端延续 $\ell^{-1}\log(2^{-n}\sum_\sigma e^{\ell H(\sigma)})$）由

\[
 u=v/\ell,\qquad \widetilde b(u)=\ell^2b(\ell u),\qquad \widetilde h(u)=\ell^2h(\ell u),\qquad \widetilde F=\ell F
\]

得到，正归一化转移律在变量替换后不变；自校正取 $-\ell[b(\ell-)/4+h(\ell-)/2]$ 时压力满足 $f_n^{[0,\ell]}(b,h)=\ell^{-1}f_n(\widetilde b,\widetilde h)$；条件均值、协方差与重叠不变，归一化源的黑塞满足 $H_v=\ell\widetilde H_{v/\ell}$，于是 $vC_v\preceq H_v\preceq\ell C_v$，压力公式在 $dv$ 积分下仍保系数 $-\frac14$ 与 $-\frac12$；终端重合权重变成 $\ell$，边与叉的权重是 $-dv$ 与 $-(d-1)v$。这条质量区间伸缩我在 §3 的递推里就见过影子（$F_{j-1}=\frac1{m_j}\log\mathbb Ee^{m_jF_j}$），附录把它写成可以用 $\ell$ 参数的形态，可见它是为那边的多段拼接准备的。

环境尺寸与删点（`companion-interface.tex:48--61`）：当 $N/2\le n\le3N$ 时可用环境的二进参数 $N$，固定幂或对数尺度的比较只差有界因子；物理 $n$ 仍留在高斯协方差、重叠分母与创新估计里。删去 $j$ 个固定位点时，被删重叠保留原分母 $n$、未删的高斯协方差全部不动；若把保留系统按它自己的尺寸 $p=n-j$ 与重叠 $R_p$ 写，矩阵时钟是 $(p/n)b$、场时钟是 $h$；把被删重叠换成完整重叠至多花 $j/n$；固定时钟下的尺寸模板在每个模板项里用同名路径、切割与外尺度参数。最要紧的一句：$n$ 与 $N$ 可比这条事实既不会放松直接检验的截断，也不会去掉那组参数条件里的固定正指数松弛。

钉扎矩的适用范围（`companion-interface.tex:63--73`）是我最想抄进自己备忘的一条：源与压力陈述允许一个公共确定源，自旋矩不等式却只能在零确定外场、确定权重、完整无条件单路径种植律下用，中心化的常数就是该律下的期望；它对任意条件化前缀、或对该边缘做自旋依赖的重加权都不是一个钉扎不等式。同一证明给出多项式形态（`companion-interface.tex:75--83`）：固定次数、有界确定系数、对 $u$ 可测的 $P_u$ 与确定 $k\in L^2$，在零确定场下

\[
 \left\|\int k_u\bigl(P_u(L_u)-\mathbf EP_u(L_u)\bigr)\,du\right\|_p^2\le c_p\left\|\int k_u^2P_u'(L_u)^2W_u\,du\right\|_{p/2},\qquad 2\le p<\infty,
\]

$c_2=1$、$c_p\le1+p^2/3$（与 `foundations.tex:153--159` 同一组常数）。理由是 $P_u(L_u)$ 的驱动梯度是 $P_u'(L_u)g_u$，正块黑塞论证给出同一个逆黑塞能量界，$J=\int k_u^2P_u'(L_u)^2W_u\,du$；坐标规范对称同时保住可观测量与这个能量，并使它们的条件律与所钉自旋无关（`companion-interface.tex:84--90`）。$L_u$ 的有界性把结果从有界确定权重传到 $L^2$ 权重，§16 开头的质量伸缩给出 $[0,\ell]$ 上同一公式。固定正扩张树的用法有严格次序（`companion-interface.tex:94--103`）：先把某个单路径因子未用到的分支全部边缘化，对该完整边缘用单路径不等式，再用无条件 H\"older 把保留因子合起来，最后才对确定带符号分配测度的全变分积分；别的分支上的随机因子不得代入单路径不等式里的确定权重；整个过程不需要任何联合自旋钉扎对数凹断言。

投影与条件场（`companion-interface.tex:105--130`）：投影陈述适用的条件是，在决定外锚与共享前缀的数据之后，所选分支保留它完整的归一化种植未来律；锚可以用叉之后的一个独立外部延续，绝可以用所选延续里未揭示的变量。长为 $\Delta h$ 的场时钟区间之后，在质量至少 $v>0$ 处，质量 $\ell$ 规范化给出

\[
 \|V\cdot(y-X_{\rm end})\|_p\le C_p\frac{(\log n)^2\|V\|_p}{v\sqrt{n\Delta h}},
\]

固定偶数 $p$，质量与长度由 $n$ 的固定逆幂下界；条件 Jensen 允许后续投影，独立条件重采样用两次这样的替换；总时钟按 $\log n$ 的固定幂增长时证明同样适用（那是给那边文章的），更一般地多项式有界的场区间让初始到创新的比值在矩迭代里保持多项式有界。耦合陈述里的条件场 $\mathcal G$ 恰好是：到该切割指定揭示为止的完整公共前缀、该切割之后受影响后裔子树之外的老支实现、以及确定的老拓扑所生成的 $\sigma$-代数，不含别处信息。这一句"恰好"的强度我很有体会，我早年把 $\mathcal G$ 写得更大，结果独立重采样的合法性全部塌掉。

## §17 与 Aronow--Lopatto 幂次的对照：从 $4/15$ 与 $7/15$ 到 $1/3$

已知地面是 $c_\beta n^{4/15}\le\operatorname{Var}(F_n)\le C_\beta n^{7/15}$（`introduction.tex:70--75`），$4/15\approx0.267$、$7/15\approx0.467$，目标 $1/3$ 居中。`introduction.tex:76--77` 说他们的正变换与偏差估计是本文论证的直接前驱，`introduction.tex:122--126` 把方法拆开：钉扎 Brascamp--Lieb 方差估计、优化的协方差插值、正矩，三件合起来（他们的命题 2.2 到 2.3 与第 3 节）。本文在此之外新证的四件写在 `introduction.tex:126--129`：成对的相互作用与场时钟、局部比较、固定高阶矩、以及在涨落尺度上的分组副本检验。逆黑塞连续不等式归 Brascamp 与 Lieb，钉住一个终端自旋构型之后的应用证在基础节，得到的矩估计是对完整无条件种植路径的，对一个任意固定前缀并不成立（`introduction.tex:129--132`）；附录那一段（`companion-interface.tex:69--73`）就是这条界说的正式登记。

把两处的幂次账放在一起看最有收获。他们的上界 $7/15$ 与下界 $4/15$ 都是"全局一次比较"的产物：优化插值给出一个误差预算，正矩把它折成变换的上下界，两边各吃一个 $L^1$ 时钟代价与一个矩放大。本文 §12 那条临界关系 $\varepsilon n s^4\asymp1$ 说明，一旦尺度可以定在 $s$、且比较只在质量 $[0,s]$ 与 $[s,1]$ 上分段作用，同一个代数就锁死指数：$s=n^{-1/6+5m}$、$\varepsilon=n^{-1/3}$ 时 $ns[p(\varepsilon)-p(0)]$ 落在 $[n^{20m},n^{100m}]$。要拿到这个锁定，前提是 $r\asymp s$ 在 $[s/2,s]$ 上成立（`fluctuations.tex:96--104`），这条来自传播节；没有它，短比较的分位数可以贴地板或顶棚乱跑，$\int_0^s\frac{\varepsilon e}{e+\varepsilon}r^2\,du$ 的下界就只能用 $r$ 的最小可能值估，损失恰好是把 $8m$ 的赢面换成一个不可忽略的幂。

[推测] 我没有从素材里读到作者对"$4/15$ 与 $7/15$ 各自卡在哪一步"的评论，所以这一段是我按上面的幂账反推的解释，作为记笔记的取舍登记在此。可核对的客观差异有三条：他们只有一个协方差时钟（本文有 $b,h$ 两棵，`foundations.tex:28--37`）；他们的矩估计是方差级（$p=2$，本文 `foundations.tex:153--159` 是任意固定 $2\le p<\infty$、$c_p\le1+p^2/3$）；他们的比较在全局强度上做，本文在短比较与分位数优化上做（`comparisons.tex:16--17` 把 $\delta=m/10000$ 这种细松弛引入约束集）。这三条里我最看重第二条：固定高阶矩才是"多项式节省与矩阶无关"（`comparisons.tex:20--22`）能成立的原因，而 §12 的正窗口需要把 $s$ 定在超过 $n^{-1/6}$ 一个固定幂，靠的正是那种无关性。

对数凹这一手也有出处：`introduction.tex:198--203` 明写指数增广按他们的命题 5.1，Prékopa 的边缘定理负责密度层面。也就是说，本文与 $4/15$ 到 $7/15$ 那篇的分界在结构侧（空腔闭包、剖面刚性、传播）与尺度侧（短比较、参数松弛），增广与正变换的用法是一脉相承的。

## §18 与最初设想的差异，以及我没有解决的清单

三条差异值得留档。第一条是结论形态：我进场时想做"低温涨落的极限分布"，出场时只有一条指数断言 $\operatorname{sd}(F_n)=n^{1/6+o(1)}$（`introduction.tex:10--25`），并且 `introduction.tex:26` 明确它既不给极限律也不给非零前置因子，温度固定、$\beta\to1$ 与 $\beta\to\infty$ 无一致结论。这不是退让，是分诊：指数结论的整个证明链都靠"固定深度、固定次数、固定矩阶"这三件，而 $n$-依赖的松弛一旦允许，§11 的预算耗尽与 §6 的检验因子都失效。极限律那部分被切给另一篇（`companion-interface.tex:5--24`），接口条款在 §16 抄过。

第二条是路线：我原以为核心难点是矩估计与插值的技术打磨（毕竟 $4/15$ 与 $7/15$ 的差就是幂次），读完素材我认为真正的承重墙在两个地方，一个是从去掉一个位点的恒等式里造出三次闭包 $S_i=\Gamma(K_i)+o(x^3)$（`cavity.tex:52--53`），一个是把小尺度剖面钉成线性 $r(xv)/x\to v/\kappa$（`profile.tex:41--46`）。前者的关键技巧是带符号附着贡献先求和再取绝对值（`introduction.tex:148--150`），后者靠势的非负变分与两种坐标同时记账（`profile.tex:55--60`）。幂次计算 $-2/3+1/2=-1/6$（`comparisons.tex:32--37`、`fluctuations.tex:88--95`）在两处都出现，但它是被这些结构结论喂出来的。

第三条是手段的来源：标量 Parisi 那一侧的输入（区间支撑 $[0,q_\beta]$、密度结构、支撑自洽、严格凸性唯一性）全部来自别人的定理（`introduction.tex:79--92`），本文自证的与之相邻的部分是严格正初始密度，从标量扩散恒等式与一条四阶导数严格估计推出（同一段末尾，`profile.tex:148--170` 是它的技术形态）。我进场时把这理解为"借用一个唯一定理"，实际是借一组结构性质再用一条曲率下界把它们接上本文的极小元序列。

遗留清单（这些是我读完全文仍然没有答案的）：

1. $\beta$ 的一致版本：所有常数依赖固定 $T$（`introduction.tex:206`），$\beta\downarrow1$ 时 $\kappa$、$c$、$C$ 的退化率不明。
2. 常数前置因子：$\operatorname{Var}(F_n)=n^{1/3+o(1)}$ 里的 $n^{o(1)}$ 无法换成具体常数，因为 $m$ 的余量链（下界 $n^{20m}$、上界 $n^{100m}$，`fluctuations.tex:39--48`）在两端都留着幂松弛。
3. 深度与次数：传播的层级数与检验次数 $N$ 都被证明存在但被写成"固定"，我没有在已读的窗口里看到显式数值，$m<1/300$（`fluctuations.tex:28`）是唯一落到纸面的具体小常数。
4. 稀疏散布与典型涨落的匹配假设（`introduction.tex:48--51`）：本文证的是典型涨落的指数，大偏差那一侧与物理计算的对接仍然开着。
5. 临界点与临界窗口：那里的答案是带常数与带分布的（`introduction.tex:62--68`），低温区这条 $n^{1/6}$ 的结论能否与它们在一个统一的尺度族里连续起来，素材没有讨论。
6. 混合 $p$-自旋：全文在 SK 二次型上做，两棵时钟 $b,h$ 正是为二次协方差设计（`foundations.tex:17--26`），奇数相互作用需要新的特征映射，我没有可用的现成结构。

## §19 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\operatorname{sd}(F_n)$ | $n^{1/6+o(1)}$ | `introduction.tex:13` | 主定理与 §15 的转换 | 改动 $s$ 的取法则 §12 两端同失 |
| $\operatorname{Var}(F_n)$ | $n^{1/3+o(1)}$ | `introduction.tex:13` | §15 与 §17 的幂账 | 窗口幂一变动，对数凹转换即断 |
| $\eta>0$ | 双侧松弛指数 | `introduction.tex:16--18` | 主定理陈述与 §15 | 去掉 $\eta$ 需给出非零前置因子 |
| $\mathbb P\{n^{1/6-\eta}\le\lvert F_n-\mathbb EF_n\rvert\le n^{1/6+\eta}\}$ | 趋于 $1$ | `introduction.tex:21--24` | §15 的小球估计 | 缺它则典型幅度那半条结论无据 |
| $-5/6$ | 密度侧标准差指数 | `introduction.tex:26` | §1 与物理预测对照 | 换归一化就要重做 §12 的 $1/n$ 记账 |
| $n^{-5/6}$ | 每自旋涨落尺度的猜测 | `introduction.tex:44--46` | §1 的动机 | 本文只证指数，改常数即越界 |
| $O_\beta(n/\log n)$ | 高温侧方差上界 | `introduction.tex:58--59` | §1 的已知地面 | 它在 $\beta>1$ 无对应物，替换失败 |
| $c_\beta n^{4/15}$ | 低温方差已知下界 | `introduction.tex:73--74` | §17 对照 | 无剖面刚性时退回到它 |
| $C_\beta n^{7/15}$ | 低温方差已知上界 | `introduction.tex:73--74` | §17 对照 | 缺 §11 的传播即卡在它 |
| $[0,q_\beta]$ | 标量极小元的区间支撑 | `introduction.tex:85--87` | §10 的宏观基例 | 支撑一变，$\kappa$ 的上下界即失 |
| $\frac{nT}{2}R(\sigma,\tau)^2$ | 完成后的协方差 | `introduction.tex:97--98` | §3 的特征映射 | 去掉 $D$ 则对角缺失项回到每次求导 |
| $T/2$ | 公共高斯 $D$ 的方差 | `introduction.tex:100--101` | §12 与 §15 的删除步 | 它决定 $\operatorname{Var}F_n^c$ 与 $s_n^2$ 之差 |
| $\frac{Tt^2}{4}$ | 中心变换的精确修正 | `fluctuations.tex:22--24` | §12 的窗口定义 | 写成不等式则删噪声失去等号 |
| $\phi_b(\sigma)=\frac{\sigma\sigma^{\mathsf T}}{\sqrt{2n}}$ | 矩阵特征映射 | `foundations.tex:20` | §3 的协方差实现 | 改成无序对则范数不为 $\frac n2$ |
| $\frac{n}{2}$ 与 $n$ | 两特征的平方范数 | `foundations.tex:24--25` | §3 的自校正 $-\frac{b_L}{4}$ | 校正项随范数比而变 |
| $F_{j-1}(z)=\frac1{m_j}\log\mathbb Ee^{m_jF_j(z+Z_j)}$ | 层级递推 | `foundations.tex:43--44` | §3 与 §13 的短比较 | 质量 $m_j$ 一负就非凸，包络失效 |
| $f_n(b,h)=\frac1nF_{-1}(0)-\frac{b_L}{4}-\frac{h_L}{2}$ | 压力定义 | `foundations.tex:49` | §4 的目标泛函 | 两个系数变了 §13 的罚金不再配平 |
| $uC_u\preceq H_u\preceq C_u$ | 归一化源的黑塞夹逼 | `foundations.tex:92` | §8 的半径估计用 $H_u\succeq cxC_u$ | 失去因子 $u$ 则创新估计放大 |
| $D_u^2=B_u-S_u^2$ | 重叠的标准差 | `foundations.tex:78` | §5 的误差分解 | 它一旦不等于两块之和即断 |
| $\operatorname{Var}(\lvert X_u\rvert^2)+2\mathbb E[X_u^{\mathsf T}C_uX_u]+\mathbb E\operatorname{tr} C_u^2$ | $D_u^2$ 的三分 | `foundations.tex:101--103` | §3 §6 §14 的账目 | 任一项换界都会丢多项式余量 |
| $c_p\le1+p^2/3$ | 钉扎矩不等式常数 | `foundations.tex:159` | §14 的侧平均与 §17 | 依赖 $p$ 则节省不再与阶无关 |
| $W_u=(y-X_u)^{\mathsf T}H_u(y-X_u)$ | 矩不等式的能量核 | `foundations.tex:155` | §14 的方差上界 | 换成 $C_u$ 则失去黑塞正性 |
| $\partial_rS_u\ge n\,\partial_rh\,\mathbb E\operatorname{tr} H_u^2$ | 磁化率不等式 | `foundations.tex:151--152` | §14 的墙导数 | 它失效则 $\psi'$ 的陡峭白费 |
| $\frac14\int_0^1B_u\,db(u)\,du+\frac12\int_0^1S_u\,dh(u)\,du$ | 压力对时钟的变分 | `foundations.tex:149--150` | §2 否证全局替换 | 全局误差与 $n^{1/6}$ 同阶 |
| $\frac14\lVert b-\widetilde b\rVert_{L^1}+\frac12\lVert h-\widetilde h\rVert_{L^1}$ | 两路径的压力差 | `foundations.tex:166--168` | §2 §5 的连续性 | 去掉它则极小元不存在 |
| $0<m<1/300$ | 唯一写出的小常数 | `fluctuations.tex:28` | 全链的幂松弛 | 放大 $m$ 则 §14 的对数损失吃不进 |
| $\delta=m/10000$ | 二级松弛 | `comparisons.tex:16` | §4 的约束缝隙 | 令 $\delta$ 与 $m$ 同阶则可行集可能空 |
| $n^{-2/3+m}d\lesssim E\le n^{-1/2}d^2$ | 调用参数条件 | `comparisons.tex:33` | §4 §11 §13 的可行性 | 任一侧改幂即断，$1/6$ 由它产生 |
| $a=\frac{\sqrt nE}{d}$ | 下侧直接检验尺度 | `comparisons.tex:34` | §6 §13 §14 的 $a$ | 换定义则端点假设失去意义 |
| $u_*=\frac1{nE}$ | 最小质量约束尺度 | `comparisons.tex:34` | §4 的地板与 §8 的 $k$ | 它变则 $L$ 与 $\int k$ 的估计同变 |
| $d\ge a\gtrsim n^{-1/6+m}$ | $1/6$ 的第一次现身 | `comparisons.tex:43--44` | §4 §9 §17 | 不等号反向则下比较落不到测试尺度 |
| $b_0(u)=T+o(z^2)$ 与 $h_0(u)=o(z^3)$ | 端点假设 | `comparisons.tex:49` | §6 §9 §14 | 三阶改二阶则磁化率修正压不住 |
| $k(r)=\frac{n^\delta u_*^2}{(r+n^{2\delta}u_*)^2}$ | 分位数地板 | `comparisons.tex:66` | §8 的反密度损失 | 地板变小则 $k(Cx)$ 的界失效 |
| $M(u)=n^\delta\bigl[\frac{u+u_*}{L}+\frac{d^3}{E}(u+u_*)^2\bigr]$ | 分位数顶棚 | `comparisons.tex:67--68` | §4 可行性与 §14 | 顶棚变小则 $\int\frac{du}{M}$ 不再 $o(1)$ |
| $L=\min\bigl(u_*,\frac{a^3}{d^2}\bigr)$ | 质量下界尺度 | `comparisons.tex:69` | §4 的 $M$ | 换 $\min$ 为 $\max$ 则顶棚爆炸 |
| $e(r)=\lambda f(\lambda r/d^3)$，$0\le\lambda\le d^2$ | 强度剖面 | `comparisons.tex:87` | §4 §13 §14 的改动时钟 | $d^3$ 改 $d^2$ 则 $re(r)$ 单调性失 |
| $p(r)=-\frac{re'(r)}{e(r)}\in[0,1)$ | 对数斜率 | `comparisons.tex:97--98` | §9 的 $G(r)$ | 越界 $1$ 则比较破坏单调 |
| $\frac14\int_{u_0}^1e(r(u))\bigl[D_u^2+(S_u-r(u))^2\bigr]du$ | 误差的两块 | `comparisons.tex:119--121` | §5 §7 §13 | 任一块丢失即无下界胜利 |
| $A_\lambda=n^\delta\frac{\sqrt nE}{\sqrt\lambda}$ | 需正则的下界尺度 | `comparisons.tex:176` | §5 §11 §13 | 它若不低于 $s$ 则 §13 用不到 $r\asymp s$ |
| $G(r)=e(r)\bigl[(2-p(r))r-2(1-p(r))S_r-p(r)B_r/r\bigr]$ | 首次变分的核 | `comparisons.tex:188` | §9 的接触条件 $G=0$ | 系数配错则势 $H$ 的符号失效 |
| $n^{10\delta}E$ | 条件化比较误差 | `propagation.tex:24--27` | §11 的子误差判别 | 余量小于 $n^{\delta/4}$ 则归纳不终止 |
| $E'\ge n^{\delta/4}E$ | 每层预算增幅 | `propagation.tex:121` | §11 的有限深度 | 增幅退成对数则深度依赖 $n$ |
| $E_j$ 界在 $\frac{}{}n^{-5/6+2m}$ 与 $n^{-1/2}$ 之间 | 预算可达区间 | `propagation.tex:45--46` | §11 的终止性 | 区间宽度若为 $o(\delta\log n)$ 即不断 |
| $d'=c_0x$，$E'=\min\{n^{-1/2}d'^2,n^{-100\delta}e(x)x^3\}$ | 子代数据 | `propagation.tex:113--117` | §11 的父子衔接 | 去掉 $e(x)x^3$ 上界则子误差不再可忽略 |
| $W=\max\{x,\sqrt{e(x)}\}$ | 标定尺度 | `cavity.tex:17` | §6 §14 的检验因子 | 改 $\min$ 则标定尺度落到目标尺度之下 |
| $S_\ast\asymp W$，$D_\ast\le n^{-\kappa}\frac{x^2}{W}$ | 好切割处的矩 | `cavity.tex:92--93` | §6 §7 的迭代收益 | $\kappa$ 退化为 $0$ 则修正无法抵消 |
| $z_v=\frac{x^3}{W^{3/2}\sqrt v}$ | 边界边的改动代价 | `cavity.tex:111` | §6 的树的账 | 指数 $\frac32$ 变 $1$ 则求和发散 |
| $n^{-1/2}\ll x^3$ | 投影界可用的条件 | `cavity.tex:120` | §6 §8 §9 的幂校验 | 它等价于 $x\gg n^{-1/6}$，破了全链断 |
| $S_i=\Gamma(K_i)+o(x^3)$ | 单点三次闭包 | `cavity.tex:52--53` | §7 §8 §14 | 阶升到 $x^2$ 则斜率 $\kappa$ 不定 |
| $\frac{\lvert S_i-\Gamma(K_i)\rvert}{x^3}\le C_0\{\eta_n+(D_i/x)^\vartheta\}$ | 闭包的模 | `cavity.tex:60--61` | §7 §8 的一致界 | $\vartheta$ 归零则 H\"older 一步失效 |
| $x^{-3}\int_{I_n(c,C)}D(r)^2\,dr\to0$ | 半径坐标集中 | `profile.tex:71` | §8 的两种坐标 | 只有质量版则地板区间的缝看不见 |
| $\frac{n^{o(1)}}{ne(x)x^4k(Cx)}\lesssim n^{-\delta+o(1)}$ | 反密度损失链 | `profile.tex:93--96` | §8 的半径估计 | 任一环改幂则 $L^2$ 收敛失去 |
| $\rho_n(i)=\frac{S_i-\Gamma_n(K_i)}{x^3}$ | 归一化闭包误差 | `profile.tex:76--77` | §8 的 $L^1$ 极限 | 除以 $x^2$ 则极限不为零 |
| $V_q=-\frac T2\bigl(V_{zz}+\alpha_K(q)V_z^2\bigr)$ | 标量延续方程 | `profile.tex:136` | §9 §14 的 $\Gamma$ | 系数 $\frac T2$ 变则 $\kappa=T$ 不再成立 |
| $dZ_q=T\alpha_K(q)V_z(q,Z_q)dq+\sqrt T\,dB_q$ | 最优扩散 | `profile.tex:137` | §9 的矩恒等式 | 噪声 $\sqrt T$ 变则与 SK 特化脱钩 |
| $\widehat\Gamma'(q)=T\mathbb EV_{zz}(q,Z_q)^2$ | 矩曲线严格增 | `profile.tex:162` | §9 §14 的线性化 | 非严格则剖面可有平台 |
| $c\le V_{zz}(0,0)\le C$ | 原点曲率界 | `profile.tex:168--170` | §9 §10 的正初始密度 | 下界失则初始密度正性无从可证 |
| $\frac{r(xv)}{x}\to\frac v\kappa$，$0<c\le\kappa\le C$ | 小尺度线性刚性 | `profile.tex:42--45` | §9 §11 §13 | 界若依赖 $n$ 则传播的基例不成立 |
| $n^{-1/6+5m}$ | 窗口参数 $s$ | `fluctuations.tex:33` | §12 §15 | 幂若偏离 $-\frac16$ 则 $\varepsilon ns^4$ 失衡 |
| $K_n(s)=ns\,[p(T)-p(0)]$ | 窗口的定义式 | `fluctuations.tex:44--45` | §12 §13 §14 | 自校正 $\frac T4$ 不一致即失去等号 |
| $[c_{T,m}n^{20m},C_{T,m}n^{100m}]$ | 正窗口区间 | `fluctuations.tex:48` | §12 §15 的输入 | 下界若为 $O(1)$ 仍可用，上界不可丢 |
| $\varepsilon=n^{-1/3}$ 与 $E=n^{-5/6+7m}$ | 下比较的取数 | `fluctuations.tex:88--92` | §13 的胜利余量 | $7m$ 若超过 $15m$ 则误差吞掉主项 |
| $n^{-5/6+15m}$ 对 $n^{-5/6+7m+20\delta}$ | 主项与误差之比 | `fluctuations.tex:124--126` | §13 的最后一步 | 两幂相等即无余量 |
| $\varepsilon_0=n^{-1/3+40m}$ | 上比较的起点 | `fluctuations.tex:135--137` | §14 的正残差 | 它若不小于 $d_N^2$ 则弦引理不可用 |
| $\psi'(u)\ge\frac{c}{(s-u)\log n}$ | 墙的对数陡峭 | `fluctuations.tex:179--180` | §14 的磁化率积分 | 去掉 $\log n$ 则墙不够陡 |
| $S_u=\frac{K_u}{T}+O(d^3)$ | 低群线性化 | `fluctuations.tex:260--261` | §14 的均值压制 | $T$ 改他值则 §9 的 $\kappa$ 冲突 |
| $a_L=\frac{Cd^3}{\varepsilon}$ | 低群均值上界 | `fluctuations.tex:261` | §14 的扫动代价 | 它进 $a_L^2$ 则 $sd^6/\varepsilon_0$ 失衡 |
| $s\frac{d^6}{\varepsilon_0}=n^{-5/6+55m}$ | 扫动的首项 | `fluctuations.tex:322--325` | §14 的上界求和 | 余量 $55m$ 若超 $95m$ 则和式出格 |
| $\operatorname{Var}F_n^c=s_n(\beta)^2+\frac T2$ | 接口处的方差关系 | `companion-interface.tex:20--21` | §16 的外交条款 | 加噪超过 $o(n^{1/3})$ 则那边文章失效 |
| $\frac{(\log n)^2\lVert V\rVert_p}{v\sqrt{n\Delta h}}$ | 投影的重采样代价 | `companion-interface.tex:114--115` | §16 与 §6 的界 | $\Delta h$ 多项式小则创新比失控 |
| $\ell^{-1}f_n(\widetilde b,\widetilde h)$ | 质量区间 $\mathopen[\mathclose0,\ell]$ 的压力 | `companion-interface.tex:39--40` | §16 的尺寸规范化 | $\ell$ 超出 $[1,4]$ 则系数不保 |

## §20 缺陷申报与取证交代

已落盘内容不做任何回改，以下按类别登记，交本体侧的机械通道处理。

一、词面类。§5 段中与 §10 段中各有一处规格禁用的四度过渡短语（同一字形，两次命中）；§13 末段括号之后有一处成对的长停顿号（两个同形字符连写），属机械可清类。

二、语种残留类。§7 末段句中夹了一个英文名词（应为"依赖"）；§8 第三段中"沿任何满足……的序列"里多打了一个英文限定词。两处都在行文中，不涉及公式。

三、数学书写类。§6 第二段复述直接检验假设时，把一个比较宏打成了错字（形如 `\gtrimes`），它不在素材的宏表里，编译会报错；台账中有两行数值书写不当，一行的行内数学里含未闭合的花括号（形如 `n^{-5/6+15m` 后直接收口），另一行写了空分子空分母的分数宏（形如 `\frac{}{}`）。四处都不影响逐行定界符的偶性，只影响渲染。

四、体量与节奏类。首块（§0 到 §3）实测 13,203 字节，低于规格给的 15,000 下限，属"节数达标、单节偏短"的缺口；落盘后立即续写了 §4 到 §7，共 16,181 字节追回。首次落盘发生在本会话第 11 次调用，在 6 到 12 的窗口内。追加各笔的字节差依次为 16,181、10,110、12,726、9,607、23,443，均未超过 25,000。

五、节序与位置类。规格要求台账为文末一节；本稿台账在 §19，其后只有本节这一处申报。节号从 §0 起连续到 §20，物理排布与编号一致，无重号、无错位插入。所有"见 §N"的前向引用都指向真实存在的节。

六、取证范围类。素材读取全部取自 `build/` 下的 `.tex`，共 10 个读取窗口，顺序为 `paper.tex` 全文、`introduction.tex` 全文、`foundations.tex` 前 200 行、`profile.tex` 前 170 行、`cavity.tex` 前 190 行、`comparisons.tex` 前 210 行、`fluctuations.tex` 的两个窗口（前 175 行与 176 到 375 行）、`propagation.tex` 前 160 行、`companion-interface.tex` 前 130 行，触及预算上限，故以下四段未读入且已在正文标注：`profile.tex` 后半部的宏观命题证明（见 §10 末的标注）、`fluctuations.tex` 375 行之后的收尾求和与指数增广（见 §14 末的标注）、`cavity.tex` 190 行之后的检验迭代细节、`comparisons.tex` 210 行之后的条件误差命题。§17 中关于两篇幂次差异的解释是我按幂账反推的，已标注为推测。未读 PDF、未跑任何版本管理命令、未读 `.tools/` 下除规格外的文件、未读任何其他笔记。

七、结构取舍类。§12 里有一处粗界书写带了冗余的因子（同除同乘），数学上成立但行文啰嗦；§15 与 §18 对同一处取舍（辅助随机变量与"只有指数"的代价）说了两遍，第二遍是清单形式，我判断保留比删去更有用，因为它是 §1 那条裂缝的闭环。
