# D205 研究笔记：闭 Ricci 流上标量曲率有界与有限时间全曲率爆炸

## §0 登记与选题背景

这本笔记围绕一篇日期为 2026-09-24 的 preprint 展开，题目是 "A closed Ricci flow with bounded scalar curvature and finite-time curvature blowup"，作者署名 OpenAI。我把它当作正在做这项研究的那个我来重新走一遍思维链：初始动机、走过的弯路、转折点、最终定型的方法、以及方法里那些看起来小、实际上关键的取舍。素材全部来自该论文 `build/` 下的 `.tex`：`paper.tex` 只装配，六个正文节 `sections/01-introduction.tex` 到 `sections/06-barriers.tex` 提供正文内容，`references/bibliography.tex` 只当引用索引使用；`figures/` 里两片 tikz 只是示意图。typst 分片、README、PDF 都没有作为取材来源。

动笔前我在脑子里过了要讲的顺序：猜想是什么、Hamilton 判据与 Sesum 定理给出的强度差距、Bamler 那句 p. 756 表述把赌注压在标量曲率上；我一开始相信猜想成立、试图把 $|R|$ 有界 bootstrap 成 $|\Ric|$ 有界，然后立刻卡住；Wang 的 limsup 下界把 Type I 关掉；Type II 旋转对称家族看着合适但没有可乘之机；Stolarski 的双扭曲积给出外壳，但没有给出 $|R|$ 上界；我最终选择把 Stolarski 的构造作为外部输入 `Proposition 2.1`，只往里面塞两条定量估计。尺度分离、profile bounds、inner barriers、warping 方程、strict inner gap、Ricci-flat cone 近似、radius 尺度与 cap 尺度两次曲率记录、scalar 恒等式与 pole 轨道大小、slope 引理、一维扰动 heat 估计、沿 radial drift 移动的圆柱、reaction matrix 特征值、维度显式的 Ricci supersolution、scalar supersolution、外区比较、maximal time 识别、速率 corollary、维度四的沉默。这些内容我按 §1 到 §25 展开，§26 是台账，编号顺序不再改动。

- 目录：`preprints/A-closed-Ricci-flow-with-bounded-scalar-curvature-and-finite-time-curvature-blowup-September-24-2026`
- 其他队列第 29 行号

## §1 猜想的原始形态：Hamilton 判据、Sesum 定理与 Bamler 表述

出发点很朴素。Hamilton 在 1995 年的奇点综述里给出：闭流形上的光滑 Ricci 流只能在有限时间 $T$ 处停止扩张，如果 $\max_M \lVert \Rm \rVert$ 在 $t\uparrow T$ 时无界（`01-introduction.tex:16-17` 引 Hamilton1995）。这条判据把 "存在性时间是否可延长" 化归到 "全曲率张量是否爆"。全曲率张量有太多独立分量：在 $m+1$ 维里，$\Rm$ 的自由度是 $(m+1)^2 m^2/12$。想要控制它，需要极强的先验界。

\v{S}e\v{s}um 2005 年把可用假设降下来：只要 $\max_M \lVert \Ric \rVert$ 有界就够延长（`01-introduction.tex:20-21` 引 Sesum2005）。这条改进的强度不能低估。Ricci 张量比全曲率张量少了 Weyl 部分，但仍是二阶张量；它的每个分量都可控，$\Rm$ 的爆只能藏在 Weyl 方向。

真正的赌注就在标量曲率 $R=\operatorname{tr}_g \Ric$。标量只是 Ricci 的迹，一个数。Bamler 2018 年那篇收敛性论文的 p. 756 把这个未解问题写作标量曲率延拓猜想（`01-introduction.tex:18-19`）。我最初读到那一句时的直觉是它可能成立：Bamler 那篇论文本身说明 "有界标量曲率" 有相当硬的收敛性内容，把它推成延长定理看起来只差一小步。

猜想我按 Bamler 的意思写成一句话：对维度至少 $4$ 的闭 Ricci 流，若 $T<\infty$ 是极大存在时间，则 $\sup_{M\times[0,T)} \lvert R \rvert=\infty$。这里的维度是流形的维度，写作 $m+1$。论文里 `01-introduction.tex:22-24` 我给自己划了一条纪律：猜想里的 "smooth extension on the original manifold" 是关键词，如果允许通过奇异空间继续走，那是完全不同的结论。我一路都想在原始光滑流形上做延长判据，这样比较能反映问题的本意。

## §2 我最初的直觉与第一条错误路线

顺着 Bamler 的方向走，我第一版思路是这样：从 $(\partial_t-\Delta)R=2 \lVert \Ric \rVert^2$ 出发，若 $\lvert R \rvert \le C$，能不能通过 bootstrap 得到 $\lVert \Ric \rVert \le C'$？这个想法在最初几天看起来很有希望，因为演化方程右边正好是 $\lVert \Ric \rVert^2$，一个非负项。

结果它立刻卡住。第一，从 $\lvert R \rvert \le C$ 得不到 $\lVert \Ric \rVert \le C'$，因为 $R$ 只控制 Ricci 的特征值之和；特征值本身可以是 $(A,-A,0,\dots)$，此时 $R=0$ 而 $\lVert \Ric \rVert$ 任意大。我构造了一个双扭曲模型的代数小例来给自己敲警钟：在两个球因子的乘积上，$\Ric$ 有三个独立方向（沿 $\Sp^p$、沿 $\Sp^q$、法向），把 $\phi/r$ 调到一个特殊比例就能让 $R=0$、$\Ric$ 却非零。这类方向抵消是猜想失败的第一条线索。

第二，$(\partial_t-\Delta)R=2 \lVert \Ric \rVert^2 \ge 0$ 只给下界：$R(\cdot,t) \ge \min_M R(\cdot,0)$（`03-geometry.tex:73-77`）。这条正则只能排除标量往负的方向爆，正的部分完全没锁。

第三，我甚至想过用 Hamilton 的强极大原理去 squeeze $\lVert \Ric \rVert^2$ 的演化。但 $\lVert \Ric \rVert^2$ 的演化方程里出现 $\lVert \Rm \rVert \lVert \Ric \rVert^2$ 这样的三次项，闭合不了。这条路只能带来 $\lVert \Ric \rVert$ 关于 $\lVert \Rm \rVert$ 的先验界，倒过来的信息一条都没有。

第一次彻底放弃 "正证明" 的时刻，是我把 Wang 的不等式完整写下来之后。

## §3 Wang 不等式给我的第一次纠偏

Wang 2012 年关于 Ricci 流延长条件 II 的文章里给出一条 limsup 型下界：若 $T<\infty$ 是奇异时刻，则 $\limsup_{t\uparrow T}(T-t) \cdot \max_M \lVert \Rm \rVert^{1/2} \cdot \max_M \lvert R \rvert^{1/2}$ 严格为正（`01-introduction.tex:26-33` 引 Wang2012 Theorem 3）。

把这条限制到 $\lvert R \rvert \le C$ 的候选反例上，得到 $\limsup_{t\uparrow T}(T-t)^2 \max_M \lVert \Rm \rVert > 0$。这条我读到的第一反应是失望：如果猜想被证伪，反例里的 $\lVert \Rm \rVert$ 至少要沿某个子列以 $\Omega((T-t)^{-2})$ 爆。Type I 的曲率集中率 $(T-t)^{-1}$ 直接被排除掉。我本来打算沿着 Type I 或 parabolic-scale 的 neckpinch 找有界标量的例子，Wang 那条不等式当场把这条路封了。

第二次反应才反应过来：这个 limsup 是 subsequential 的，并不要求每一个足够晚的时刻都达到 $(T-t)^{-1/2}$。也就是说，允许曲线在两次爆之间回落；只要沿某个子列 $\limsup$ 严格正。这给 Type II 型构造留了空间。所谓 Type II 是 $(T-t)\max_M \lVert \Rm \rVert$ 无界（`01-introduction.tex:43-44`）。爆率比 parabolic rate 更快。

`01-introduction.tex:34-38` 那句 "This is a subsequential restriction" 我读了两遍。第一遍把它当作 Wang 定理的技术注脚，第二遍才意识到它正是猜想被证伪的空间所在：如果只有 $\limsup$ 有意义、$\liminf$ 允许为 $0$，那反例的曲率时间曲线可以是锯齿形的，甚至可以在某些时刻远低于 parabolic rate。这种自由度是后面参数选择的底气之一。

## §4 Type II 奇点：Angenent-Kopf、Gu-Zhu、AIK 与 Stolarski 的位置

Type II 在旋转对称的 neckpinch 里有一批成熟构造。Angenent-Kopf 2004 在球上做了旋转对称 neckpinch（`01-introduction.tex:41` 引 AK2004）。Gu-Zhu 2008 给出球上的 Type II 旋转对称奇点（`01-introduction.tex:45-46` 引 GuZhu2008）。Angenent-Isenberg-Knopf 2015 给出退化 neckpinch、带速率的先验界、Bryant 孤子 tip 模型、cylinder 的 parabolic 模型（`01-introduction.tex:46-48` 引 AIK2015）。

我一开始的直觉是：既然 Type II 存在，那能不能直接在它们的家族里挑一个标量有界的？读它们的曲率渐近：这些例子里 $R$ 通常在 neck 或 tip 区域发散；旋转对称把 Ricci 特征值的自由度压得很小，很难让 $R$ 保持有界。这条路看着可行，实际做下去没有可乘之机。

真正的转折点是 Stolarski 2019 的文章。他做双扭曲积上（$\Sp^p$ 与 $\Sp^q$ 两个球因子）的 Ricci 流，构造出带任意快曲率爆炸的锥型奇点，并且在 parabolic 尺度上逼近 Ricci-flat cone（`01-introduction.tex:53-55` 引 Stolarski2019）。他自己识别出 "有界标量曲率" 是这些例子的一个可能特征，但论文本身没有给出 $\lvert R \rvert$ 的上界证明。他原文里的 geometric cap model 属于 B\"ohm 1999 那条 cohomogeneity-one Ricci-flat 的框架（`01-introduction.tex:61-66`）。

我看完他那部分 discussion 时的判断是：外壳已经建好，我需要往里面塞两条估计。一条是 cap 尺度上曲率的上界，另一条是维度显式的 Ricci 反应上界。把两条合起来，就能构造一个有界标量的 supersolution。他原文 Proposition 5.3 里的 scalar sign obstruction 是现成的种子（`01-introduction.tex:114-118`）。

## §5 把 Stolarski 的构造当作输入：`Proposition 2.1`

我最初的想法是 "复现整个构造"，写了几页之后立刻意识到不划算。Stolarski 那篇文章里 Definition 3.1、Definition 3.2、Definition 3.3、Definition 3.5、Definition 4.1、Lemma 3.6、Lemma 3.10、Lemma 3.12、Theorem 1.1、Theorem 4.3、Lemmas 4.5-4.9、Propositions A.10、A.12、A.13、A.19、A.21、Appendix B 这一堆编号，随便一个都够写一整节。复现它意味着我要写一本比原文更长的书，收益是零。

我的取舍：把 Stolarski 那部分当作外部输入 `Proposition 2.1`（`02-construction.tex:25-96`），只把后面所有估计要用到的数据一次性列清楚，剩下的都从这里推。Remark 2.2（`02-construction.tex:149-154`）特别强调，我没有从 Stolarski 那里偷标量上界，也没有偷 cap 尺度的 $\lVert \Rm \rVert$ 有界，也没有偷向某个具体完整 cap 度量的收敛。这三条我要自己证明。这一点我在论文写作时反复回来确认自己没越界。

参数集我按论文写法记下来：$p=2$，$m=p+q$，$A^2=(p-1)/(m-1)$，$B^2=(q-1)/(m-1)$，$d=(m-1-\sqrt{(m-1)(m-9)})/2$，$\nu=k-d/2$，$\sigma=k/d$（`02-construction.tex:8-14`）。流形是 $\Sp^2\times\Sp^{q+1}$，维度 $m+1=q+3$（`02-construction.tex:21`）。$q\ge 10$，$k$ 是足够大的偶正整数。$\nu>0$。尺度：$\delta=T-t$，$\tau=-\log \delta$，$\theta=\delta^\sigma$，$\gamma=r/\sqrt{\delta}$（`02-construction.tex:17-20`）。

这些参数之间的关系我要记牢。$\nu/d=\sigma-1/2$（`02-construction.tex:22-23`）。$\sqrt{\delta}\delta^{\nu/d}=\theta$。这后一条 identity 是后面把 parabolic scale 与 cap scale 互相换用的关键。

`02-construction.tex:31-40` 里 (i) 条说明度量形状：远离两极的 pole orbit 之外，$g=ds^2+\phi^2 g_{\Sp^p}+r^2 g_{\Sp^q}$，$s$ 是每时刻的 arclength，两个球因子的度量 sectional curvature 都是 $1$。每个端点 $\Sp^q$ 因子光滑地塌缩，留下一个 radius 正的 $\Sp^2$ orbit。真正的奇点在剩下的那个 orbit 也开始缩时出现。$r$ 关于极点是奇展开，$\phi$ 关于极点是偶展开，在极点 $r=0$、$r_s=1$、$\phi_s=0$；$\phi>0$ 对所有 $t<T$。半球内 $r_s>0$。这些符号约束后面在比较原理里都要用到。

`02-construction.tex:41-68` 里 (ii) 条给出 profile bounds 与两个函数 $\Ut=\log(\phi/((A/B)r))$ 与 $\Zt=z-B^2$（$z=r_s^2$）的加权估计：对 $j=0,1,2$，
\[
\left\lvert \partial_\gamma^j(\Ut - \delta^\nu U_k)\right\rvert
\le \eta_j^U \delta^\nu (\gamma^{-d-j}+\gamma^{2k-d}),
\]
另一条同型；$U_k(\gamma)$ 是 $\gamma^{-d}$ 乘 $\gamma^2$ 的 $k$ 次多项式，两端系数 $c_1,c_2>0$（`02-construction.tex:64-67`）。$Z_k=O_{q,k}(\gamma^{-d})$ 在 $\gamma\downarrow 0$（`02-construction.tex:68`）。

## §6 尺度分离：parabolic $\sqrt{\delta}$ 与 cap $\theta=\delta^\sigma$

两个尺度是我脑子里最早定型的图像。$\sqrt{\delta}$ 是 parabolic 尺度，在这个尺度上度量的 rescaled 版本非常靠近 Ricci-flat cone。$\theta=\delta^\sigma$ 是 cap 尺度，$\sigma>1/2$ 意味着 $\theta=o(\sqrt{\delta})$：cap 尺度远小于 parabolic 尺度。

我一开始把这两个尺度混着用，写出来的界不 sharp，$\theta^{-2}$ 型爆炸和 $\delta^{-1}$ 型爆炸在同一句话里打架。后来我把它们分开：parabolic 尺度上做的是 cone 近似，用来给固定 parabolic 环带上的 Ricci 曲率一个小界；cap 尺度上做的是 pole 邻域的 $r_s\to 1$ 的 slope 控制与 pole 轨道大小的下界。

关键的一点：parabolic 尺度上 Ricci 张量小，并不自动给 cap 尺度上的曲率小界（`01-introduction.tex:108-111`）。原因是 parabolic annuli 上 cone 近似把 $\lVert \Ric \rVert$ 压到 $O(\delta^{\nu-1})$ 量级，但 cap 尺度上 $\theta \ll \sqrt{\delta}$，即使 $r_s$ 距离 $1$ 只差一个 parabolic 小量，$\ell=(1-r_s^2)/r^2$ 也可能爆炸；分母 $r$ 缩到 $\theta$ 级别，曲率对 $\theta^{-2}$ 敏感。

`01-introduction.tex:113-127` 里我把新的两条估计归成两块。第一块：Stolarski 的 strict one-sided comparison with the cone 加上 logarithmic slope 的单调性，配合 ordinary scalar lower bound，控住 cap 大小。曲率 point-picking 之后给出全曲率上界，且不需要向 cap 模型的收敛。第二块：在随主 drift 移动的 radial cylinder 上，一维 parabolic 估计给出带 leading coefficient $2q$ 的 Ricci 反应界；对应的 diffusion coefficient 在 $q$ 大时留下正 margin；得到 $\lVert \Ric \rVert \le C r^{-e}$，$0<e<1$。这个界的平方给有界标量曲率的 supersolution 让路。

尺度之间的换算在 `02-construction.tex:22-23`：$\nu/d=\sigma-1/2$，$\sqrt{\delta}\delta^{\nu/d}=\theta$。$\gamma$ 与 $r$ 之间的换算就是 $\gamma=r/\sqrt{\delta}$；在 cap 区间 $r\le Y_1\theta$ 上，$\gamma\le Y_1 \delta^{\nu/d}$，也就是 profile 区间的下 cutoff。$\gamma$ 与 $\theta$ 之间靠这两个 identity 换。

<!-- 探针：D205 落盘校验行 2026-09-24 队列 29 -->

## §7 profile bounds 与 inner barriers 精读

先把 `Proposition 2.1` 里 (ii) 条的两条 weighted 估计读透（`02-construction.tex:41-68`）。它们的形式：
\[
\left\lvert \partial_\gamma^j (\Ut-\delta^\nu U_k)\right\rvert \le \eta_j^U \delta^\nu(\gamma^{-d-j}+\gamma^{2k-d}),\quad j=0,1,2.
\]
右边有两项，$\gamma^{-d-j}$ 管 $\gamma$ 小的时候（cap 侧），$\gamma^{2k-d}$ 管 $\gamma$ 大的时候（外区）。$\eta_j^U$ 是可调 tolerance，可以在 `Proposition 2.1` 的 (iv) 条里"取足够小"，代价是把 $Y_1$、$Y_2$ 抬高。这一小步骤后面在 dimension estimate 里承担很大作用。

$U_k$ 是 $\gamma^{-d}$ 乘 $\gamma^2$ 的 $k$ 次多项式，两端首系数 $c_1,c_2>0$（`02-construction.tex:61-67`）。这两个正的 boundary 系数决定了我能在两侧各做出什么。$Z_k(\gamma)=O_{q,k}(\gamma^{-d})$ 在 $\gamma\downarrow 0$（`02-construction.tex:68`）。

(iii) 条列出 inner inequalities（`02-construction.tex:70-79`）：$\phi/r\ge A/B$、$0\le f\le 1$、$f_r\ge 0$（$0<r\le Y_1\theta$），$B^2\le z\le 1$（$0<r\le Y_2\theta$）。这里 $f=r u_r$。这几条界在两个 inner interval 上直接给到，比我一开始想要从 profile bounds 逐点推出来更省力。论文写这些区间严格位于赤道之下（`02-construction.tex:78-79`）。

(iv) 条说初始时刻 $\tau_0=-\log T$ 有同样的 weighted 估计，直到 initial outer cutoff $G_{\mathrm{init}}=M_0 e^{\beta_{\mathrm{init}}\tau_0}$，超出这个 cutoff 之外 $\Ut\ge 0$（`02-construction.tex:80-89`）。两个 $\beta$ 之间的关系我原本以为随便，实际上有硬约束：$0<\beta<\nu/(2\nu+1)\le \beta_{\mathrm{init}}<1/2$（`02-construction.tex:86-88`）。它们是两个不同的选择，"任意两个 exponents" 的说法不成立。

`02-construction.tex:99-107` 里我逐条对齐 Stolarski 原文的编号：存在性 Lemma 3.12 与 Theorem 1.1 证明；weighted estimates Definition 3.1；initial family Definition 3.5 与 Lemma 3.6，加上 Definition 3.2 的 outer conditions；inner inequalities 是 Definition 3.3 的 Inner Region Barriers I，Lemmas 4.5 到 4.9 传播过来，在 Theorem 4.3 的证明 p. 25 明确被引用。特别指出，Definition 4.1 的类 $\mathcal P$ 的短列表并不是唯一被使用的信息。这一句是给自己看的：以后有人质疑我为什么用这些不等式，答案在 p. 25，不在 Definition 4.1。

`02-construction.tex:113-130` 里我把 initial weighted bounds 的 upper endpoint 说清楚：它撑到 initial expansion 自己的上端，不止 propagated 端点。lower $U$-modes 在 Definition 3.5 里是 $\gamma^{-d}$ 乘 $\gamma^2$ 的次数低于 $k$ 的多项式；lower $Z$-modes 由 Propositions A.10 与 A.19 说它们为 $\gamma^2$ 乘多项式，growth 指数严格低于 $2k-d$。这些有限个 modes 及其前两阶导都在 profile weight 里被控住。取 initial 系数为 $\epsilon_0\delta^\nu$、$\epsilon_0$ 足够小，就能给到所需 tolerance。这与 Lemma 3.10 的 degree argument 兼容：Lemmas 6.13 到 6.14 的 projection error 后续通过增大 initial rescaled time 减小。Definition 3.5 里的 outer conditions 也从 initial expansion 端点起。initial profile bounds 与 outer sign 在 $G_{\mathrm{init}}$ 相接；$\beta_{\mathrm{init}}$ 与 $\beta$ 不需要识别。它们允许区间之间的关系由 Stolarski Theorem 4.3 证明 p. 26 给出。

`02-construction.tex:132-147` 里记原文符号与本文件的换算：$B^2 \lambda_k=-\nu$、$\alpha_k=\nu/d$、$Y_1=\Upsilon_U$、$Y_2=\Upsilon_Z$；$\sqrt{\delta}Y_i e^{-\alpha_k \tau}=Y_i\theta$；$f=1+\gamma \Ut_\gamma$，$f_r=(\gamma/\sqrt{\delta})(\Ut_{\gamma\gamma}+\Ut_\gamma/\gamma)$；log-radius convexity 就翻成 (iii) 里的 slope 不等式 $f_r\ge 0$。这里的 $k$ 是构造里的 mode index，不是 Stolarski Theorem 1.1 陈述里那个任意的曲率 blowup 指数。

## §8 Warping 方程与几何 heat 算子

Section 3 开始把 metric 与 Ricci 展开。远离极点用 arclength $s$（每时刻），sectional curvatures：
\[
h=-\phi_{ss}/\phi,\quad h_q=-r_{ss}/r,\quad j=(1-\phi_s^2)/\phi^2,\quad \ell=(1-r_s^2)/r^2,\quad \mu=-\phi_s r_s/(\phi r).
\]
（`03-geometry.tex:14-21`）它们分别对应 radial-$\Sp^p$、radial-$\Sp^q$、$\Sp^p$-tangent、$\Sp^q$-tangent 与 mixed plane。Ricci 特征值三条：
\[
\lambda_0=p h+q h_q,\quad \lambda_p=h+(p-1)j+q\mu,\quad \lambda_q=h_q+(q-1)\ell+p\mu.
\]
（`03-geometry.tex:26-30`）

Doubly warped Ricci-flow 演化：
\[
\partial_t\rvert_x r = r_{ss}+ (q-1)(r_s^2-1)/r + p \phi_s r_s/\phi,\quad \partial_t\rvert_x \phi = \phi_{ss}+(p-1)(\phi_s^2-1)/\phi+q r_s\phi_s/r,
\]
交换子 $[\partial_t\rvert_x,\partial_s]=\lambda_0 \partial_s$（`03-geometry.tex:32-37`）。这三条我在推导 slope 方程 $r_s$ 演化的时候要重复使用；论文写它们与 Stolarski Section 2 的通常形式一致（`03-geometry.tex:39-40`）。

我把 $u=\log \phi$、$v=r_s=\sqrt{z}$ 视作 $(r,t)$ 的函数（在 $r_s>0$ 时）。从 $\partial_t\rvert_x$ 减掉 advection $(\partial_t\rvert_x r)\partial_r$ 得到 sideways 方程（`03-geometry.tex:82-90`）：
\[
u_t = z u_{rr}+ \frac{q-1+z}{r}u_r-(p-1)e^{-2u},\quad v_t = z v_{rr}+\frac{q-1-z}{r}v_r + \frac{(q-1)v(1-v^2)}{r^2}-p v^3 u_r^2.
\]
几何 heat 算子 $\mathcal{D} F=(\partial_t-\Delta)F(r,t)$ 作用在 $r>0$ 的 scalar composition 上时化简成
\[
\mathcal{D} F = F_t\rvert_r - z F_{rr} - \frac{q-1+z}{r}F_r.
\]
（`03-geometry.tex:92-96`）这个 identity 是从 $\Delta r = r_{ss}+q r_s^2/r+p\phi_s r_s/\phi$、进而 $r_t-\Delta r = -(q-1+z)/r$ 推出来（`03-geometry.tex:97-98`）。sideways 方程在 radius 单调的坐标里写；$\mathcal{D}$ 是几何的、越过赤道仍成立（`03-geometry.tex:99-101`）。

还有一条 ratio heat identity 值得单挑出来（`03-geometry.tex:102-105`）：
\[
(\partial_t-\Delta)\log(\phi/r)=(q-1)/r^2-(p-1)/\phi^2.
\]
这一条在 Ricci-flat cone 近似与外区 ratio lower bound 里都是核心。$A/B$ 让右边 $=0$，正是 cone 的 balance。

## §9 Lemma 3.1：全局 elementary bounds

这一节看着短，其实每一步都用得上。`03-geometry.tex:42-50` 说：每个 `Proposition 2.1` 里的 flow 上，存在不依赖 $t$ 的 $C$，使得 $r\le C$、$\lvert r_s \rvert+\lvert \phi_s \rvert \le C$；特别地 $r$ 在 $g(t)$ 下一致 Lipschitz；且 $R\ge -C$ 沿整条流。

三条都关键。$r$ Lipschitz 让我在 cap 尺度上能沿径向 integrate；$|r_s|$ 与 $|\phi_s|$ 有界让曲率记录 rescaling 里两个 warping 函数 $F_a$ 的 arclength derivative 有界；$R\ge -C$ 直接由 $(\partial_t-\Delta)R=2 \lVert \Ric \rVert^2$ 与紧致极大原理得到（`03-geometry.tex:73-77`）。

$r$ 的 upper bound 从 $r$ 的 positive maximum 处的演化读出：在正的极大值点，$r_s=0$，演化给出 $r_t\le -(q-1)/r$（`03-geometry.tex:52-54`）。$r_s$ 的演化式（`03-geometry.tex:55-62`）：
\[
\partial_t\rvert_x r_s = (r_s)_{ss} + (p\phi_s/\phi+(q-2)r_s/r)(r_s)_s + [(q-1)(1-r_s^2)/r^2-p\phi_s^2/\phi^2]r_s.
\]
在正的 interior maximum 处，若 $r_s>1$，则 reaction 项负号；在负的 minimum 处若 $r_s<-1$，reaction 项同号正。这样 $|r_s|$ 被 $\max(1, |r_s|_{t=0})$ 控住。$(r,q)$ 与 $(\phi,p)$ 交换，同样的 argument 给出 $|\phi_s|$ 有界（`03-geometry.tex:64-67`）。极点 $r_s=1,-1$、$\phi_s=0$ 让 offending extremum 只在 interior（`03-geometry.tex:68-69`）。argument 先在 compact time slab 上做，端点的径向奇系数不带额外 boundary condition（`03-geometry.tex:69-71`）。

这段证明我读了三遍。第一遍只看结论，觉得 standard。第二遍才看到 "先 compact slab 再取 limit" 那一步：$r$ 与 $\phi$ 在极点 singular coefficients 出现，直接对整段流做极大原理要小心。第三遍看到 "$|r_s|$ 由 $\max(1,|r_s|_{t=0})$" 里那个 $1$：来自极点 boundary value，我原来写的是 $\max(|r_s|_{t=0})$，被自己敲回来。

## §10 Strict inner gap 与 $\phi/r\ge A/B+\varepsilon_1$

`03-geometry.tex:115-138` 的 `Lemma 3.2` 是 Stolarski Proposition 5.1(2) 的现代表述。我把证明细读了一遍，因为它是后面 cap 大小下界的种子。

取 $\gamma_1=Y_1 \delta^{\nu/d}$。此时 $\delta^\nu \gamma_1^{-d}=Y_1^{-d}$，而 $U_k$ 在 $\gamma\to 0$ 的 leading small-$\gamma$ asymptotics 的相对误差趋于 $0$。选 $\eta_0^U<c_1/4$（`03-geometry.tex:128-131`）。由 profile bounds 得
\[
0< \tfrac{1}{2} c_1 Y_1^{-d} \le \Ut(\gamma_1,\tau)\le C_{q,k,Y_1}
\]
在 late times。这一步同时给出两条结论在 interface $r=Y_1\theta$ 上成立：$\Ut>0$ 意味着 $\phi/r>A/B$；$\Ut$ 的上界乘上 $A/B$ 就是 $\phi(Y_1\theta,t)\le C\theta$。

下界的向内传播用 $\partial_{\log r}\log(\phi/r)=f-1\le 0$（`03-geometry.tex:134-137`）。因为 $f\le 1$ 由 `Proposition 2.1` (iii)，这个 slope 非正，$\log(\phi/r)$ 关于 $\log r$ 递减；所以在 $r\le Y_1\theta$ 上 $\phi/r$ 至少与在 $r=Y_1\theta$ 处一样。$\varepsilon_1$ 的一个 admissible 选择：$(A/B)(\exp(c_1 Y_1^{-d}/2)-1)$ 之下任一正数（`03-geometry.tex:137-138`）。

这一条我一开始写成 "取 $\varepsilon_1$ 为 $c_1 Y_1^{-d}/4$" 之类的更粗暴选择，读了几次才把常数放成"低于某个固定正数就好"。$\varepsilon_1$ 与后面的 $b_0$ 之间的关系我记到台账里。$C$ 允许小、允许依赖 flow（`03-geometry.tex:112-113`）；$\varepsilon_1$ 与 $C$ 都只在 dimension 与 mode 固定之后被使用（`03-geometry.tex:113-114`）。

## §11 Ricci-flat cone 近似与 parabolic annuli 上小 Ricci

`03-geometry.tex:140-176` 是 dimension estimate 用的均匀界 `Lemma 3.3`：$|z-1|\le C_0/q$、$r|u_r|\le 2$、$(p-1)r^2 e^{-2u}\le (q-1)(1+C_0/q)$，$0<r\le\sqrt{\delta}$。$C_0$ 与 $q$、$k$ 都无关（`03-geometry.tex:141-149`）。

证明的思路（`03-geometry.tex:151-176`）：在 $0<\gamma\le 1$ 上，profile 与 error 有 $|\Ut|+\gamma |\Ut_\gamma| \le C_{q,k}\delta^\nu \gamma^{-d}$、$|\Zt|\le C'_{q,k}\delta^\nu\gamma^{-d}$。把 $Y_1$ 抬高再 $Y_2$ 抬高，直到右边在 cutoff 上小于 $1/q$。剩下的 inner 区间由 `Proposition 2.1` (iii) 处理。用 identity
\[
1-B^2=2/(q+1),\quad r u_r=1+\gamma \Ut_\gamma,\quad (p-1)r^2 e^{-2u}=(q-1)e^{-2\Ut},
\]
得到 $|z-1|\le 3/q$、$r|u_r|\le 1+1/q$；$(p-1)r^2 e^{-2u}\le (q-1)e^{2/q}\le (q-1)(1+4/q)$ 对大 $q$。所以 $C_0=4$ 够用（`03-geometry.tex:162-168`）。

这一段有一个 subtle 点：dimension- 或 mode-dependent 的 profile 常数被 cutoff 选择吸收掉了。$\delta^\nu\gamma^{-d}$ 与 $\delta^\nu \gamma^{2k-d}$ 的系数在 $C_{q,k}$ 里，我把 cutoff 抬到足够大，右边压到 $1/q$，$C_{q,k}$ 就不出现在 $C_0$ 里。第一次读的时候我担心这一步不 uniform，第二次读到 "absorbed by the cutoff choices" 就通了（`03-geometry.tex:168-170`）。

`03-geometry.tex:178-222` 是 `Lemma 3.4`（Global ratio 与 parabolic annuli）：$\phi/r\ge c_0>0$ 全局远离极点，且对固定 $0<a_1<a_2<\infty$，late times 上有 $\lVert \Ric \rVert \le C_{a_1,a_2} \delta^{\nu-1}$（$a_1\sqrt{\delta}\le r\le a_2\sqrt{\delta}$）（`03-geometry.tex:181-186`）。

Ratio lower bound 用外区 profile sign 加上 $(\partial_t-\Delta)\log(\phi/r)=(q-1)/r^2-(p-1)/\phi^2$ 的比较（`03-geometry.tex:103-105`、`03-geometry.tex:196-203`）。$U_k$ 大 $\gamma$ 系数为正，加 tolerance 小，$\Ut\ge 0$ 在 $\gamma\ge\Gamma_0$ 上。外区 $\log(\phi/r)$ 与 $\log(A/B)$ 比较，$\log(A/B)$ 是 reaction 项的 exact equilibrium；初值与 lateral 数据符号对；每个 compact time slab 上 reaction 局部 Lipschitz，比较原理可用。两个半球都算，赤道不是 boundary。

Parabolic annuli 上 $\lVert \Ric \rVert$ 界从 rescaled metric 读出：在 fixed $\gamma$-compact 区间内，$\delta^{-1}g$ 写成
\[
\frac{d\gamma^2}{z}+(A/B)^2\gamma^2 e^{2\Ut}g_{\Sp^p}+\gamma^2 g_{\Sp^q},
\]
与 $z=B^2$、$\Ut=0$ 的 Ricci-flat cone（link 是 $A^2 g_{\Sp^p}+B^2 g_{\Sp^q}$）在 $C^2$ 意义下差 $O(\delta^\nu)$（`03-geometry.tex:207-216`）。Curvature 在 fixed annulus 上关于正度量与其一阶二阶导 smooth，rescaled Ricci norm 是 $O(\delta^\nu)$；scaling back 得 $\lVert \Ric \rVert=O(\delta^{\nu-1})$（`03-geometry.tex:217-219`）。任何固定 annulus 最终落在 profile region 内；profile 里 $z>0$ 排除赤道端点（`03-geometry.tex:220-222`）。

## §12 曲率记录 argument 第一次：radius scale 上 $r^2 \lVert \Rm \rVert \le C$

`04-cap.tex:1-11` 里的 `Proposition 4.1` 说：对上面选好参数的 flow，$q$ 足够大时存在一个 $C$（允许依赖 flow），
\[
(r^2+\theta^2)\lVert \Rm \rVert \le C
\]
在 $M\times[0,T)$ 上一致成立。这条界看起来是终点，其实只是中段：$C$ 允许随 $q$ 任意增大；真正给维度选择用的界在 Section 5。

我把 `Proposition 4.1` 拆成两半来证。`04-cap.tex:12-22` 说明 Shi 的曲率导数估计（`Shi1989`、`CaoZhu2006` 定理 1.4.1 与 1.4.2）在这里以两种形式使用：global 与 local。parabolic 邻域上 $\lVert \Rm \rVert$ 的一致界给出稍小邻域上 $\lVert \nabla\Rm \rVert$ 的界；常数依赖维度、曲率界、空间 margin、已流逝时间，不需要 injectivity radius 的下界。每一次使用之前先构造好需要的 parabolic 邻域。

`04-cap.tex:23-33` 里 Stolarski 已经在 inner region 里做过 radius curvature bound（他的 Proposition 5.1(3)）；我先要一个 global 的 radius bound，再给 cap 尺度的界。逻辑上如果 radius bound 失败，两个 sphere 半径 rescaling 都发散、arclength derivatives 保持有界；一个持续非零的 radial sectional curvature 就会强迫其中某个 derivative 有大的变化。cap 尺度那边还需要两个额外材料：pole orbit 的 radius 下界，以及 $r_s$ 在极点邻域趋近 $1$ 的定量 slope。同一条 radial integration argument 在两个尺度都能用。

`04-cap.tex:35-37` 的 `Lemma 4.1`：$r^2 \lVert \Rm \rVert \le C$。反证。取 record 点 $(x_i,t_i)$，$t_i\uparrow T$，$r_i=r(x_i,t_i)>0$，$Q_i=\lVert \Rm \rVert(x_i,t_i)$，$r_i^2 Q_i=\max_{M\times[0,t_i]} r^2\lVert \Rm \rVert\to\infty$（`04-cap.tex:40-44`）。这样点存在来自每个 compact 时间 slab 上的紧性。$r$ 有界给出 $Q_i\to\infty$。

$\Sp^q$ 分量的度量演化给 $|\partial_t\rvert_x r^2| = 2 |\lambda_q| r^2 \le C_m r^2 \lVert \Rm \rVert$；$r^2$ 光滑所以恒等式扩张到极点（`04-cap.tex:46-51`）。固定小 $b>0$，record 定义给出
\[
|r(x,t)^2-r(x,t_i)^2|\le r_i^2/16\quad (t_i-b/Q_i\le t\le t_i)
\]
在每个 fixed manifold point $x$（`04-cap.tex:52-57`）。这些 backward interval 大 $i$ 时都在 flow 里。

按 $Q_i$ rescale 并平移 $t_i$ 到零（`04-cap.tex:60-64`）。以 $x_i$ 为中心 rescaled 半径 $R$ 固定球、时间 $[-b,0]$：$r$ Lipschitz、上式、$r_i\sqrt{Q_i}\to\infty$ 三件事合起来给出 $r\ge r_i/2$。record 界在同样区域给 $\lVert \Rm \rVert/Q_i\le 4$。metric 演化积分让这里 metrics uniformly comparable，长度比较因子 $E$ 与 $R$、$i$ 无关（`04-cap.tex:65-67`）。

选 $R>E+2$。以终值长度不超过 $1$ 的曲线不会离开这个 initial ball：首次出去之前它的 initial 长度至少 $R$，final 长度至少 $R/E>1$。所以 final unit ball 落在 initial ball 内，有固定正 margin。取 $b$ 低于 local derivative estimate 的维度依赖时间阈值。这给出 final rescaled $\lVert \nabla\Rm \rVert$ 在该 ball 上的一致界（`04-cap.tex:68-75`）。

在 final rescaled metric 里 warping 函数 $F_1=\sqrt{Q_i}\phi$、$F_2=\sqrt{Q_i}r$ 由 `Lemma 3.4` 都在中心 $\to\infty$；arclength 导数就是原来的 $\phi_s$、$r_s$，`Lemma 3.1` 有界。$r$ Lipschitz 让到两极 rescaled 距离都 $\to\infty$；因此中心附近有一段固定短 radial interval 在 flow 里；跨赤道不阻碍（`04-cap.tex:77-85`）。

Rescaled tangential curvatures $j,\ell,\mu$ 都趋零。因为 rescaled norm 在中心是 $1$，恒等式
\[
\lVert \Rm \rVert^2=4(ph^2+qh_q^2+\tfrac{p(p-1)}{2}j^2+\tfrac{q(q-1)}{2}\ell^2+pq\mu^2)
\]
（`04-cap.tex:88-91`）说明 radial curvature $-F_a''/F_a$ 的绝对值有维度依赖的正下界。沿 radial geodesic，radial 向量与一个 fixed sphere-tangent 向量除以 warping factor 是平行的。derivative estimate 于是让这条 sectional curvature 保持符号并有正下界。同段 interval 上 $F_a\to\infty$ 一致。积分 $F_a''$ 强迫 $F_a'$ 无界变化，与 slope 界冲突（`04-cap.tex:92-100`）。

这段 argument 里我最开始最没底的是 "$F_a'$ 有界 vs $F_a''$ 有正下界" 的 contradiction。我把它想成一个 1D calculus 类比：一个函数在一区间上一致趋 $\infty$，但它的 derivative 一致有界、它的二阶导符号固定并有正下界，这三件事不可能同时成立。$F_a''$ 有固定符号意味着 $F_a'$ 单调，若再加"长度不超过某常数"，$F_a'$ 只能在一个有限区间里单调变化；$F_a$ 就至多线性增长，与"一致趋 $\infty$"矛盾。这个直觉让我后面在 cap 尺度上也能快速定位类似结构。

## §13 Scalar 恒等式与 pole orbit 大小

`04-cap.tex:102-116` 的 `Lemma 4.2` 是 cap 尺度的第一块地基：$\phi(0,t)\le C\theta$ 与 $c\theta\le \phi(0,t)$ 在 late times 成立；且 $\phi(r,t)\ge c\theta$ 在 $0\le r\le Y_1\theta$ 上成立。上界从 `Lemma 3.2` 加 $f\ge 0$ 立得；下界要从 $R\ge -C$ 出发，把 `04-cap.tex:118-171` 里那段 scalar 恒等式用满。

恒等式 `04-cap.tex:120-127`：
\[
r^2 R=p(p-1)(r/\phi)^2+q(q-1)(1-z)-pz[(p+1)f^2+(2q-2)f+2rf_r]-(pf+q)rz_r.
\]
推导路径（`04-cap.tex:128-130`）：$\phi_{ss}/\phi=z(u_{rr}+u_r^2)+z_r u_r/2$、$r_{ss}=z_r/2$；代入 $u_r=f/r$ 直接得。这条式子我在草稿纸上重推了两遍，因为它是 Stolarski Proposition 5.3 里 scalar sign obstruction 的现代版本；理解它每一项在几何上代表什么，后面每一步才不会走偏。

反证设 $L_0=\phi(0,t)=o(\theta)$ 沿一串 $t\uparrow T$ 的时刻成立。$r_s\ge B$ 与 $|\phi_s|\le C$ 给 $\phi(L_0,t)/L_0\le 1+C/B$（`04-cap.tex:133-138`）。取 $r_*=(L_0\theta)^{1/2}$。由 $\partial_{\log r}\log(\phi/r)=f-1$ 与上界，
\[
0\le \int_{L_0}^{r_*}(1-f)\frac{dr}{r}\le C.
\]
被积函数非负且非增（因为 $0\le f\le 1$ 与 $f_r\ge 0$）；因此
\[
0\le 1-f(r_*,t)\le C/\log(r_*/L_0)\to 0.
\]
$\log(r_*/L_0)=\tfrac{1}{2}\log(\theta/L_0)\to\infty$ 是这里的驱动力（`04-cap.tex:139-149`）。于是 $f=1+o(1)$ 在 $[r_*,\theta]$ 上一致成立。

在 $f=1$ 处，`04-cap.tex:151-155` 那两行前两项（未对 $z_r$ 求导的项）化简为
\[
p(p-1)/(\phi/r)^2+q(q-1)-m(m-1)z.
\]
它们在 $\phi/r=A/B$、$z=B^2$ 处恰好为 $0$。由 `Lemma 3.2` 的 fixed strict gap $\phi/r\ge A/B+\varepsilon_1$ 与 $z\ge B^2$，它们 $\le -\kappa$，$\kappa>0$ 固定。$f_r$ 项非正。$f=1+o(1)$ 在 flow 与维度固定时不影响符号。

$R\ge -C$ 与上面几项合起来（`04-cap.tex:158-166`）：把 $\kappa$ 略减小可得
\[
(pf+q)rz_r\le -\kappa+C\theta^2\le -\kappa/2\quad (r_*\le r\le \theta).
\]
由 $pf+q\le m$，$rz_r\le -\kappa/(2m)$。积分与 $B^2\le z\le 1$ 冲突，因为 $\log(\theta/r_*)=\tfrac{1}{2}\log(\theta/L_0)\to\infty$。pole 下界证完；$\phi$ 单调把下界扩到整个 inner interval（`04-cap.tex:167-171`）。

我读到这里才真正理解 Stolarski 那句 "bounded scalar curvature 是可能特征" 的定量意味：只要 $R\ge -C$ 有，`Proposition 2.1` (iii) 里那三条 inner inequalities 就把 $r$ 到 $r_*$ 段的 $1-f$ 拉平，剩下 $rz_r$ 只能沿对数区间负漂；$z$ 有界就矛盾。这个 argument 不需要向 cap 模型的收敛，也不需要完整曲率上界；只需要 $R$ 从下方 bounded。这一句我在论文里也强调过（`01-introduction.tex:64-66`）。

## §14 Slope 引理与 cap-scale 上 $r_s$ 趋 $1$

`04-cap.tex:173-205` 的 `Lemma 4.3`：$q$ 足够大、late times 上，
\[
0\le 1-v\le C r/\theta\quad (0\le r\le\theta).
\]
这条界在下面的 cap-scale record argument 里承担 $v\to 1$ 的一致性；它自己是从 `04-cap.tex:181-186` 的 $w=1-v$ 的演化方程出发。用 `03-geometry.tex:87-89` 的 sideways $v_t$ 方程写：
\[
\left(\partial_t - z\partial_{rr}-\frac{q-1-z}{r}\partial_r+\frac{(q-1)v(1+v)}{r^2}\right)w=p v^3 u_r^2\le C\theta^{-2}.
\]
不等式来自 $u_r=\phi_s/(\phi v)$、`Lemma 4.2` 给出 $\phi\ge c\theta$、$B\le v\le 1$（`04-cap.tex:186-189`）。

对 barrier $r/\theta$ 作用这个算子给 `04-cap.tex:190-192`：
\[
\frac{\sigma r}{\delta\theta}+\frac{(q-1)[v(1+v)-1]+z}{r\theta}.
\]
$B(1+B)>1$ 在大 $q$ 成立（$B^2=(q-1)/(q+1)$，$B(1+B)$ 单调趋 $2$）。这个 expression 在 $r\le\theta$ 时下界是 $\theta^{-2}$ 的固定正倍数（`04-cap.tex:193-196`）。取 $r/\theta$ 的足够大倍数就能 dominate 右边的 source、$r=\theta$ 处的 data、以及一段 fixed late starting slice 上的 data。

极点的 comparison 用 polar expansion 处理（`04-cap.tex:199-204`）：在 compact time slab 上 $w=O(r^2)$；所设上 barrier 在 $r=\eta$ 足够小时 dominate。在 $\eta\le r\le\theta(t)$ 上比较再让 $\eta\downarrow 0$。辅助 radius 可以依赖 slab，barrier multiplier 不依赖。这条界就证完。

我一开始担心 $w=O(r^2)$ 的系数依赖时间 slab，可能把 barrier multiplier 拖大。读到 "barrier multiplier does not depend on slab" 时确认了：$r/\theta$ 的固定倍数的 selection 只用 $w=O(r^2)$ 的 $O$ 存在，不用它的量级。$\eta$ 随 slab 变，barrier 不变。这一点在 cap 尺度的 record argument 里让我不用带 slab-dependent 常数往下走。

## §15 曲率记录 argument 第二次：cap-scale $\theta^2\lVert \Rm \rVert$

`04-cap.tex:207-247` 里 `Proposition 4.1` 剩下的一条是 $\theta^2\lVert \Rm \rVert\le C$。反证：取 record 点 $(x_i,t_i)$，$Q_i=\lVert \Rm \rVert(x_i,t_i)$，
\[
\theta_i^2 Q_i=\max_{M\times[0,t_i]}\theta(t)^2\lVert \Rm \rVert(x,t)\to\infty,\quad \theta_i=\theta(t_i).
\]
$\theta$ 递减给 $t\le t_i$ 时 $\lVert \Rm \rVert(x,t)\le \theta_i^2 Q_i/\theta(t)^2\le Q_i$（`04-cap.tex:213-217`）。global derivative estimate 于是给 rescaled 后 $\lVert \nabla\Rm \rVert$ 在终值时刻的一致界。大 $i$ 时某个 fixed 短 backward rescaled interval 在 flow 里（`04-cap.tex:218-222`）。

`Lemma 4.1` 给 $r_i\sqrt{Q_i}\le C$，同时 $\theta_i\sqrt{Q_i}\to\infty$（`04-cap.tex:223-224`）。中心出发 fixed 短 outward radial interval 因此落在 $r\le\theta_i$ 里。这段 interval 上 rescaled first warping function $\sqrt{Q_i}\phi\ge c\sqrt{Q_i}\theta_i\to\infty$（`Lemma 4.2` 的下界）；second warping function 每段 interval 上有上界，arclength 导数由 `Lemma 4.3` 一致趋 $1$（`04-cap.tex:226-233`）。中心若在 pole orbit，任选一条 outward radial ray（`04-cap.tex:234-235`）。

沿 ray 移一个 fixed 小距离。derivative estimate 保持 curvature norm 至少 $1/2$；rescaled radius 下界 fixed 正数。这个新中心三条 tangential curvatures 都 $\to 0$；由 `04-cap.tex:88-91` 的恒等式某个 radial curvature 有非零 magnitude 与固定符号，在一段后续固定 interval 上成立。对 $F=\sqrt{Q_i}\phi$，$F\to\infty$、$F''$ 符号固定、$F'$ 有界，积分冲突；对 $F=\sqrt{Q_i}r$，$F'$ 一致趋 $1$、$F$ 有 fixed 正下界、$F''$ 符号固定，同样冲突（`04-cap.tex:236-247`）。两种都排除，`Proposition 4.1` 证完。

这两次 record argument 的结构完全平行，差别只在下界从哪里来：第一次是 `Lemma 3.4`（parabolic annuli 上 cone 近似给出 $F_a\to\infty$）与 `Lemma 3.1` 的 slope 界；第二次是 `Lemma 4.2`（pole size 下界）与 `Lemma 4.3`（cap slope）。我第一次写完 record argument 就以为可以合并两个 proof，实际上两个下界来源不同、barrier 位置不同、Shi 估计的使用形式不同（前者 local，后者 global）；分开写更清楚。

## §16 一维扰动 heat 估计：`Lemma 5.1`

Section 5 的关键分析引理在 `05-reaction.tex:10-83`。它的定位：cap 尺度的曲率界 $C_*$ 允许随 $q$ 任意增大；这条界后面不能用来选维度。选维度要用的是维度显式的 Ricci 反应界。为了得到这条界，需要一维 interior $L^s$ 估计，$s>3$。

对 $R>0$ 令 $P_R=(-R,R)\times[-R^2,0]$，$y$ 是空间变量、$\rho$ 是时间变量。`Lemma 5.1` 说：存在 $\epsilon_0>0$，若 $H$ 光滑、$H_\rho=a H_{yy}+b H_y+F$、$|a-1|\le\epsilon_0$、$|H|+|b|+|F|\le K$，则 $|H_y|\le C(K)$ 在 $P_1$ 上（包含终值时刻由连续性）；不要求系数导数的任何界；任何 fixed rescaling 之后同结论。

证明骨架我抄下来以免记错：
1. 固定 $s>3$。常系数 heat 估计 $\|V_{yy}\|_{L^s}+\|V_\rho\|_{L^s}\le C_s\|V_\rho-V_{yy}\|_{L^s}$（Krylov 2006 Theorem 5.5，时间反向）。这是热算子的 parabolic Calderón-Zygmund；一维常数（`05-reaction.tex:29-42`）。半无限时刻版本通过把 forcing 在未来延 $0$。
2. $1\le R_1<R_2<2$，$d_R=R_2-R_1$；cutoff $\zeta$ 在 $P_{R_1}$ 上等于 $1$、空间与 past 里在 $P_{R_2}$ 中支撑，$|\zeta_y|\le C d_R^{-1}$、$|\zeta_{yy}|+|\zeta_\rho|\le C d_R^{-2}$。
3. 展开 $V=\zeta H$：$(\partial_\rho-\partial_{yy})V=(a-1)V_{yy}+bV_y+\zeta F+(\zeta_\rho-a\zeta_{yy}-b\zeta_y)H-2a\zeta_yH_y$（`05-reaction.tex:52-56`）。
4. 选 $\epsilon_0$ 使 $C_s\epsilon_0<1/2$，第一项由 heat 估计吸掉。$E(R)=\|H_{yy}\|_{L^s(P_R)}+\|H_\rho\|_{L^s(P_R)}$，剩下项：$E(R_1)\le C(K)d_R^{-1}\|H_y\|_{L^s(P_{R_2})}+C(K)d_R^{-2}$。
5. 空间插值 $\|H_y\|_{L^s(P_R)}\le h\|H_{yy}\|_{L^s(P_R)}+Ch^{-1}\|H\|_{L^s(P_R)}$，$h$ 小、无边界条件（`05-reaction.tex:63-69`）。
6. 取 $h$ 为 $d_R$ 的小倍数：$E(R_1)\le\tfrac{1}{16}E(R_2)+C(K)d_R^{-2}$。
7. 迭代 $R_j=7/4-2^{-j}/4$。误差因子 $4^j$，收缩因子 $16^{-j}$，绝对可和（`05-reaction.tex:74-76`）。$E(R_j)\le E(7/4)<\infty$ 是每个具体光滑函数的 finiteness，非假定的均匀界。得 $E(3/2)\le C(K)$。
8. 插值再控一阶导数范数。parabolic Sobolev embedding（LSU 1968 Ch. II §3 Lemma 3.3，$s>1+2$）在 $P_1$ 上控 $\|H_y\|_{L^\infty}$（`05-reaction.tex:78-82`）。

我原本打算用 Schauder 类型的 interior estimate，理由是不需要 $L^s$。这条路卡在系数 $b$ 的 regularity：$b$ 是几何量、我只知道 $|b|\le K$，没有 Hölder 或 $C^1$。Schauder 用不了。Calderón-Zygmund 只要 $a$ 与 $1$ 差一个小常数、其他系数 bounded measurable 就够。Krylov 那篇文章正好处理 VMO 系数；我这里比 VMO 还简单，是"接近常系数"。这一点我在草稿纸上把 Schauder 与 CZ 各写了一遍才确定：CZ 走通，Schauder 走不通。

另一处细节是 "no bounds on derivatives of the coefficients"（`05-reaction.tex:22-23`）。这句话对我很关键，因为后面 $\partial_z z$ 与 $\partial_z u_r$ 的界都要靠 `Lemma 5.2` 出。如果 `Lemma 5.1` 需要系数导数界，就形成循环。这里没有循环。

## §17 沿 radial drift 移动的圆柱：`Lemma 5.2`

`05-reaction.tex:87-184` 是维度显式导数估计：$q$ 足够大、late times 上
\[
|r z_r|\le C q^{-1/2},\qquad r^2|u_{rr}|\le C q^{1/2}\quad (0<r\le \tfrac{1}{8}\sqrt{\delta}),
\]
$C$ 与 $q$、$k$ 都无关（`05-reaction.tex:87-94`）。

对固定 $(r_c,t_c)$ 在区域内取 $h_c=r_c/\sqrt{q}$、$t=t_c+h_c^2\rho$、$r=R_c(t)+h_c y$、$R_c(t)=\sqrt{r_c^2+2(q-1)(t_c-t)}$（`05-reaction.tex:97-103`）。$R_c$ 就是沿 Ricci flow 的 linear heat-type 径向 drift 曲线，$R_c'=-(q-1)/R_c$。在 $P_2$ 上 $1\le R_c/r_c\le 3$。$q\ge 16$ 时 `05-reaction.tex:104-109`：$\tfrac{1}{2}r_c\le r\le \tfrac{7}{2}r_c$；$r^2\le (49/256)\delta_c<\delta(t)$，$\delta_c=T-t_c$；最早时刻 $t_c-\delta_c/(16q)$。选一个 flow 依赖的足够 late threshold 就把所有这种 cylinder 塞进 `Lemma 3.3` 的区域。

`05-reaction.tex:115-119` 里我特意为图写了一段说明：固定半径的 cylinder 会留下一个 size $\sqrt{q}$ 的 uncontrolled coefficient；跟着 $R_c$ 移动把这个 coefficient 在 apply 一维估计之前抵消掉。这是整条 proof 里我最初最容易看漏的一步。我第一版把 cylinder 写成固定中心 $r_c$，代进 sideways $v_t$ 方程后 drift 项就是 $(q-1)h_c(1/r-1/r_c)$，量级 $\sqrt{q}$；`Lemma 5.1` 需要 $|b|\le K$ 常数，$\sqrt{q}$ 直接爆。

用 $H=q(v-1)$ pull back 到这个 moving cylinder。系数（`05-reaction.tex:131-139`）：$a=z$，$b=h_c[(q-1)(1/r-1/R_c)-z/r]$，$F=qh_c^2[(q-1)v(1-z)/r^2-pv^3u_r^2]$。三条 bound：
1. $|H|\le C_0$：$q|v-1|=q|z-1|/(v+1)$，$|z-1|\le C_0/q$ 由 `Lemma 3.3`。$|a-1|\le C_0/q$。
2. Drift 项被抵消：$|h_c(q-1)(1/r-1/R_c)|=(q-1)h_c^2|y|/(rR_c)\le C$（`05-reaction.tex:142-146`）；关键是 $h_c^2=r_c^2/q$，$(q-1)r_c^2/q=O(r_c^2)$，再除 $rR_c=O(r_c^2)$。这个抵消只在 moving center 上成立。
3. Source 项：$qh_c^2=r_c^2$，$(q-1)|1-z|\le C_0$，$r|u_r|\le 2$（后两条由 `Lemma 3.3`）。三条系数与幅度都由一个数值常数 bound；$q$ 增大满足 `Lemma 5.1` 的小性假设。

由 `Lemma 5.1`，$|H_y|\le C$ 在 $P_1$。$|z_r|=(2v/(qh_c))|H_y|\le C/(r_c\sqrt{q})$ 在 $P_1$（`05-reaction.tex:152-155`）。这就是第一条 estimate 的 center 值。

第二条 estimate 是把 $w=u_r$ 求出来。对 sideways $u$ 方程求 $r$ 导（`05-reaction.tex:157-162`）：
\[
w_t=z w_{rr}+[z_r+(q-1+z)/r]w_r+[z_r/r-(q-1+z)/r^2+2(p-1)e^{-2u}]w.
\]
在更小 $P_1$ 上取 $W=r_c w$。Transformed drift $b_W=h_c(q-1)(1/r-1/R_c)+h_c(z_r+z/r)$；zeroth-order $c_W=h_c^2[z_r/r-(q-1+z)/r^2+2(p-1)e^{-2u}]$（`05-reaction.tex:163-170`）。用 `Lemma 3.3`、cylinder inclusion、$z_r$ 界，$|W|$、$|b_W|$、$|c_W|$ 都被数值常数 bound。特别是 $h_c^2(p-1)e^{-2u}\le C$（因为 $(p-1)e^{-2u}\le (q-1)(1+C_0/q)/r^2$ 与 $r\ge r_c/2$）。

把 $c_W W$ 当 bounded source，用 fixed rescaled 的 `Lemma 5.1` 在 $P_1$。在 center 求值：$|W_y(0,0)|=r_c h_c|u_{rr}(r_c,t_c)|\le C$。第二条 estimate 证完（`05-reaction.tex:174-179`）。常数只从数值 $C_0$ 与一维估计进来，$q$ 与 $k$ 都不出现（`05-reaction.tex:180-183`）。

这一段里 "$b_W$ 里的 $z_r/r$ 项 bounded" 我一开始担心。$z_r$ 上界是 $C/(r_c\sqrt{q})$；$h_c z_r/r\approx (r_c/\sqrt{q})\cdot C/(r_c\sqrt{q})/r_c=O(1/(r_c q))$。在 $r_c$ 小的时候这个 term 可以大。回读发现 $h_c^2 z_r/r$（对应 $c_W$）与 $h_c z_r/r$（对应 $b_W$ 里那一项）都在 cylinder 内 $r\ge r_c/2$ 与 $r_c\ge\sqrt{q}\cdot h_c$ 的关系下变成 bounded。$r_c$ 相对 $\sqrt{\delta}$ 有下界 $\tfrac{1}{2}r_c$（cylinder inclusion）；late times 时 $r_c$ 可以小到 $\theta$ 附近，但 $h_c=r_c/\sqrt{q}$ 也同比例小。综合下来 $b_W$、$c_W$ 常数化。

## §18 Reaction matrix 特征值与 $2(q-1)$ 的由来

Section 5 剩下要给出维度显式的 Ricci 反应界。`05-reaction.tex:186-204` 里的 tensor evolution：$(\partial_t-\Delta)\lVert \Ric \rVert^2=-2\lVert \nabla\Ric \rVert^2+4\langle \Rm(\Ric),\Ric\rangle$。逆度量导数在 squared norm 里与 covariant tensor evolution 里的 cubic Ricci term 相消。Kato 不等式在 $\lVert \Ric \rVert>0$ 处给 $(\partial_t-\Delta)\lVert \Ric \rVert\le (2/\lVert \Ric \rVert)\langle \Rm(\Ric),\Ric\rangle$。曲率约定：对角张量 $\langle \Rm(D),D\rangle=\sum_{i,j}R_{ijij}D_iD_j$，$R_{ijij}$ 是 $i\ne j$ 的 sectional curvature（`05-reaction.tex:205-207`）。

$\Ric$ 对角、每个球因子上 scalar。对 entry $(\alpha,\beta^{\times p},\chi^{\times q})$ 用 Euclidean 坐标 $(\alpha,\sqrt{p}\beta,\sqrt{q}\chi)$，范数就是普通 Euclidean 范数。曲率形式 $3\times 3$：
\[
\begin{pmatrix}
0 & \sqrt{p}h & \sqrt{q}h_q\\
\sqrt{p}h & (p-1)j & \sqrt{pq}\mu\\
\sqrt{q}h_q & \sqrt{pq}\mu & (q-1)\ell
\end{pmatrix}.
\]
（`05-reaction.tex:231-236`）Mixed terms 是 $2ph\alpha\beta$、$2qh_q\alpha\chi$、$2pq\mu\beta\chi$，正好 cover 有序 pair 与所有 multiplicity。

用 $r$ 作空间变量，曲率 sideways 形式（`05-reaction.tex:243-248`）：
\[
h=-z(u_{rr}+u_r^2)-\tfrac{1}{2}z_r u_r,\quad h_q=-z_r/(2r),\quad \mu=-z u_r/r,\quad j=e^{-2u}-zu_r^2,\quad \ell=(1-z)/r^2.
\]
`Lemma 3.3` 与 `Lemma 5.2` 说明：乘以 $r^2$ 之后，`05-reaction.tex:231-236` 那矩阵的对角元素上界分别是 $0, q-1+C_0, C_0$；off-diagonal 大小 $O(\sqrt{q}), O(1), O(\sqrt{q})$，数值常数。最大特征值不超过 $q-1+C\sqrt{q}$（`05-reaction.tex:250-255`）。

由此 `Proposition 5.3`（`05-reaction.tex:209-224`）：在 $0<r\le \tfrac{1}{8}\sqrt{\delta}$ 上 late times，reaction quotient $c=2\langle \Rm(\Ric),\Ric\rangle/\lVert \Ric \rVert^2$（在 $\lVert \Ric \rVert>0$ 处）满足两条：
\[
c\le \frac{2(q-1)+C\sqrt{q}}{r^2},\qquad c\le \frac{C_*}{\theta^2}.
\]
$C$ 与 $q,k$ 无关；$C_*$ 依赖整个 flow。第二条在 pole orbit 也成立。全局 $r>0$ 上还有 $c\le D_1/r^2$，$D_1$ 依赖 flow（`05-reaction.tex:215-224`）。

第二条从 `Proposition 4.1` 与 curvature contraction bound 来：$\langle \Rm(\Ric),\Ric\rangle$ 的绝对值被一个维度依赖常数乘 $\lVert \Rm \rVert\lVert \Ric \rVert^2$ bound；`Proposition 4.1` 与 $\theta^2\lVert \Rm \rVert\le C$ 直接给 $c\le C_*/\theta^2$。几何 curvature tensor 在 pole 连续，第二条也在 pole 上成立（`05-reaction.tex:257-261`）。

我读到这里第一次确认 "leading coefficient $2q$" 的具体含义：`05-reaction.tex:217` 那条 $2(q-1)+C\sqrt{q}$ 里的 $2(q-1)$ 就是后面 `Proposition 6.1` 里 supersolution 需要 dominate 的对象。$C\sqrt{q}$ 是 off-diagonal 与对角 $C_0$ 项带来的次级项，$\sqrt{q}/(q-1)\to 0$。选 $a$ 让 $a(q-1)>2(q-1)+C\sqrt{q}$，$a>2$。$a=5/2$ 是 $>2$ 里最小好看的分数。

## §19 内区 Ricci supersolution：$H=\delta^L(r^2+b_0\theta^2)^{-a/2}$

`06-barriers.tex:8-19` 定 barrier 的形式。$H=\delta^L(r^2+b_0\theta^2)^{-a/2}$，$a,L,b_0>0$。$H$ 的 radial diffusion leading coefficient 是 $a(q-1)$（从 $\mathcal{D}(r^2)^{-a/2}$ 里的 $-a(q-1)/D_0$ 项读出）；需要 $a>2$ 才能 dominate 反应主项 $2(q-1)$。

在 cap 尺度上，identity $\delta^L=\theta^{L/\sigma}$ 让 $H$ 大小 proportional to $\theta^{-(a-L/\sigma)}$。我希望这个 exponent 严格在 $0$ 与 $1$ 之间，这样 $\lVert \Ric \rVert^2$ 的平方上界有一个 bounded scalar barrier 能 dominate。这些 choice 顺便让 parabolic annuli 估计给 $H$ 提供 lateral 数据。

具体 selection 见 `06-barriers.tex:23-49`。$a=5/2$；$d\to 2$ 大 $q$，选 $q$ 大到 $2<d<a$、所有 universal threshold 成立、
\[
\mathfrak{m}:=(a-2)(q-1)-C\sqrt{q}-2a^2-1>0
\]
（`06-barriers.tex:26-28`）。再选大 $k$ 偶，$L=k-1$、$e=a-L/\sigma=a-d+d/k$；要求 $0<e<1$、$\nu>1$、$\sigma>1/2$（`06-barriers.tex:29-34`）。三条兼容是因为 $d>2$。

$\xi=\min\{1/8,1/(2\sqrt{L})\}$（`06-barriers.tex:38`）。Section 3 里 tolerance 与 cutoff 都选好，flow 固定；$C_*$、$D_1$ 现在是具体有限数。之后选 $b_0>0$ 让 $b_0 C_*<\mathfrak{m}$（`06-barriers.tex:42-46`）。后面所有常数在这个已固定 flow 上选；每次需要 later starting time 就在这条 flow 上取更晚的 slice，不重做构造也不改参数（`06-barriers.tex:47-50`）。这个纪律我一开始写的时候不确定，读到最后确认：整条 proof 只有一个 flow，parameter order 严格。

`Proposition 6.1`（`06-barriers.tex:70-80`）：$C$ 使 late times 上
\[
\lVert \Ric \rVert\le C\delta^L(r^2+b_0\theta^2)^{-a/2}\quad (0\le r\le\xi\sqrt{\delta}),
\]
特别是 $\lVert \Ric \rVert\le C r^{-e}$。

证明用 $D_0=r^2+b_0\theta^2$，$\theta_t=-\sigma\theta/\delta$，`03-geometry.tex:92-96` 的 $\mathcal{D}$ 表达式。直接求微分（`06-barriers.tex:88-95`）：
\[
\frac{\mathcal{D}H}{H}=-\frac{L}{\delta}+\frac{a\sigma b_0\theta^2}{\delta D_0}+\frac{a(q-1)+2az}{D_0}-\frac{a(a+2)zr^2}{D_0^2}\ge -\frac{L}{\delta}+\frac{a(q-1)-a^2z}{D_0}.
\]
第一行 extra time term 非负；$r^2\le D_0$ 给第二行。identity 由连续性扩到 pole；看似有 $r^{-1}H_r$ 的 term 在 pole 有 finite limit（`06-barriers.tex:96-98`）。

区域内大 $q$ 时 $z\le 2$，$LD_0/\delta\le L\xi^2+Lb_0\delta^{2\sigma-1}\le 1$（late times）（`06-barriers.tex:100-103`）。$\lVert \Ric \rVert>0$ 且 $r>0$ 时 `Proposition 5.3` 两条界相加：
\[
cD_0=c r^2+b_0 c\theta^2\le 2(q-1)+C\sqrt{q}+b_0 C_*.
\]
两不等式即使 $c$ 负也能相加。在 pole，第二条反应界单独给同样上界。因此
\[
\frac{\mathcal{D}H}{H}-c\ge \frac{-1+a(q-1)-2a^2-2(q-1)-C\sqrt{q}-b_0 C_*}{D_0}>0
\]
（`06-barriers.tex:104-117`）由 $\mathfrak{m}>0$ 与 $b_0C_*<\mathfrak{m}$。

Moving lateral boundary $r=\xi\sqrt{\delta}$ 上 $H=\delta^{L-a/2}(\xi^2+b_0\delta^{2\sigma-1})^{-a/2}\asymp\delta^{L-a/2}$。`Lemma 3.4` 与 $\nu=k-d/2$ 给 $|\Ric|/H\le C\delta^{\nu-1-(L-a/2)}=C\delta^{(a-d)/2}$，late times 有界（`06-barriers.tex:119-130`）。$a-d>0$ 是这里的驱动力，与 $\nu-1=L-a/2+(a-d)/2$ 相合。

选足够 late fixed $t_0$。$H$ 在 starting slice 的 cap 上有正 min，$H$ 的单一倍数严格 dominate 初始与 lateral 数据。首次接触 $|\Ric|$ 与这条 positive barrier 时 $\Ric$ norm 非零、附近光滑；`05-reaction.tex:202-203` 的 Kato 与 $\mathcal{D}H/H-c>0$ 通过极大原理排除接触。argument 在 pole 也适用（pole 是 interior）。得到整条 $t_0\le t<T$ 上一条 multiplier（`06-barriers.tex:131-141`）。

最后 $\delta^L=\theta^{L/\sigma}=\theta^{a-e}$，$a-e>0$。$r\ge\theta$ 时 $H\le\theta^{a-e}r^{-a}\le r^{-e}$；$0<r\le\theta$ 时 $H\le b_0^{-a/2}\theta^{-e}\le b_0^{-a/2}r^{-e}$。合起来给 $\lVert \Ric \rVert\le C r^{-e}$（`06-barriers.tex:143-152`）。

## §20 参数选择的严格顺序与 margin

这一节我把上面 selection 里最容易漏顺序的地方单写出来，因为这里最容易出 circular reasoning。

维度与 mode 的选择是两步骤，中间不能交换。第一步选 $q$：`06-barriers.tex:23-28` 里所有 threshold 都不依赖 $k$；$2<d<a$、$\mathfrak{m}>0$ 是纯粹 $q$ 的条件。这一步固定之后，$C$（`Proposition 5.3` 里的）与 $\mathfrak{m}$ 都成具体数。第二步选 $k$：$0<e<1$、$\nu>1$、$\sigma>1/2$ 三条随 $k$ 大同时成立，因为 $d>2$（`06-barriers.tex:29-35`）。

Corollary 6.2 里这条顺序被反过来用：先固定一个满足条件的 $q$，然后任意 large even $k$ 都可以（`06-barriers.tex:302-308`）。这给"一 fixed 维度里 unbounded discrete exponents"提供结构：$k$ 变化不影响 $q$ 的门槛，只影响 $\sigma=k/d$、$\theta=\delta^{k/d}$、$e=a-d+d/k$ 具体值。

Tolerance 与 cutoff 选择也严格。`02-construction.tex:90-94` 里：先 "tolerance 依 $q,k$ 足够小"，再 "inner cutoff $Y_1$ 抬高"，再 "$Y_2$ 抬高"，最后 "initial rescaled time 抬高"。每一步只受构造自己 lower-size requirement 约束。这条顺序我在 `Lemma 3.3` 的证明里也用到（先抬 $Y_1$ 再抬 $Y_2$，直到右边在 cutoff 上 $\le 1/q$）。

$b_0$ 与 $C_*$ 的关系：$C_*$ 是 `Proposition 5.3` 里第二条反应界 `05-reaction.tex:219`，依赖整条 flow。$b_0$ 在 $C_*$ 固定之后才选（`06-barriers.tex:42-46`）：$b_0 C_*<\mathfrak{m}$。这一点我第一版写成"$b_0$ 与 $C_*$ 独立取小"，实际上 $C_*$ 早就是具体数，$b_0$ 是"在这个 $C_*$ 之下选一够小"。

Starting time 每一步往后 push。`06-barriers.tex:47-50` 明确说：整条 proof 只有一条 flow；每次需要 later starting time 就在 flow 上取更晚 slice，不重做构造、不改参数。我第一版没注意这条纪律，把 `Lemma 3.4` 与 `Proposition 6.1` 分别写了不同的 starting time，被自己敲回来。最后合并成一条 flow 上的一个共同 $t_0$。

$\Gamma$ 与 $\xi$ 的顺序也重要：$\xi$ 在 $L$ 定了之后就选（$\min\{1/8,1/(2\sqrt{L})\}$）；$\Gamma>\xi$ 是后面外区 barrier 里的具体数，`06-barriers.tex:52-54` 图注 $\Gamma$ 在 `06-barriers.tex:233` 才选。这里 $\Gamma$ 只依赖 $b_1$ 与 $q$，$b_1$ 依赖 $D_1$，$D_1$ 是 flow 固定后的常数。参数顺序是 $a\to q\to k\to\{\varepsilon_1, C_0, C_*, D_1\}\to\xi\to b_0\to b_1\to\Gamma$。

## §21 Scalar supersolution：$S_\varepsilon=C_1-C_2 r^{\ell_0}+\varepsilon r^{-1}$

有了 $\lVert \Ric \rVert\le C r^{-e}$，标量演化方程 $(\partial_t-\Delta)R=2\lVert \Ric \rVert^2$ 让 $\lVert \Ric \rVert^2$ 变成 source，需要给 $R$ 找一个上界 supersolution。`06-barriers.tex:155-220` 的 `Proposition 6.2`：在 $0\le r\le\xi\sqrt{\delta}$ 上 late times 一致有 $R\le C$。

先要 power 的 $\mathcal{D}$ 计算。对实数 $\alpha$：$\mathcal{D}(r^\alpha)=-\alpha(q-1+\alpha z)r^{\alpha-2}$（`06-barriers.tex:164-167`）。$\alpha=-1$ 时 $\mathcal{D}(r^{-1})=(q-1-z)r^{-3}$。$\alpha=\ell_0=2-2e\in(0,2)$ 时 $\mathcal{D}(-r^{\ell_0})=\ell_0(q-1+\ell_0 z)r^{-2e}$（`06-barriers.tex:168-172`）。这两条 identity 是我第一次读的时候容易写错符号，$-\alpha$ 与 $\alpha z$ 的分配我抄在纸上确认。

写 $\lVert \Ric \rVert\le K_R r^{-e}$（`Proposition 6.1` 给）。选 $C_2\ge 2K_R^2/(\ell_0(q-1))$。因为 $0\le z\le 2<q-1$，每个函数 $S_\varepsilon=C_1-C_2 r^{\ell_0}+\varepsilon r^{-1}$ 满足 $\mathcal{D}S_\varepsilon\ge 2\lVert \Ric \rVert^2$ 在 inner region 正半径上（`06-barriers.tex:173-184`）。

选一个 late starting time $t_0$，$\rho_0=\xi\sqrt{T-t_0}$。Smoothness 在 starting slice 上把 $R$ bounded by $K_0$。Moving lateral 边界上 `Lemma 3.4` 与 $\nu>1$、$\lvert R \rvert\le\sqrt{m+1}\lVert \Ric \rVert$ 给 uniform upper bound $K_\partial$。选 $C_1>\max\{K_0,K_\partial\}+C_2\rho_0^{\ell_0}$ 就 dominate 初始与 lateral 数据（`06-barriers.tex:186-196`）。

固定 $\varepsilon>0$ 与 $t_1<T$。$R$ 在 compact slab $[t_0,t_1]$ 上 bounded。$\eta$ 足够小时 level $r=\eta$ 在 regular inner region 里，$\varepsilon/\eta$ 让 $S_\varepsilon$ dominate 那里的 data。对 $R-S_\varepsilon$ 在 $\{(x,t):t_0\le t\le t_1,\eta\le r(x,t)\le\xi\sqrt{T-t}\}$ 上用比较。Moving outer boundary 在 monotone inner region 中 regular；initial 与 lateral 边界都控住，usual interior first-maximum argument 成立。$\eta\downarrow 0$ 给 $R\le S_\varepsilon$ 在 slab 上正半径（`06-barriers.tex:198-209`）。

Slab 扩到 $T$、$\varepsilon\downarrow 0$ 逐点得 $R\le C_1-C_2 r^{\ell_0}\le C_1$。在每个 fixed $t<T$ 由连续性同一 bound 也在 pole orbit（`06-barriers.tex:210-219`）。论文强调：没用到 $r^{\ell_0}$ 在 pole 的光滑性，也没用到 $t=T$ 上的均匀 regularity（`06-barriers.tex:218-219`）。这两点我原本担心：$\ell_0<2$ 让 $r^{\ell_0}$ 在 pole 不可 $C^2$；$\varepsilon r^{-1}$ 在 pole 奇异。解答：$\eta>0$ excision 让 pole 不在 region 内，$\eta\to 0$ 只让 bound 传递到 pole；$\varepsilon\to 0$ 只在最终 bound 里去掉 singular term。整个过程每一步 region 都是正的 $r$。

我原本写这一段的时候试图一步到位让 $\varepsilon=0$，结果在 $r=\eta$ 边界上 $\mathcal{D}S_0$ 与 $R$ 之间的比较没有 strict 不等式撑住。加上 $\varepsilon r^{-1}$ 之后在 $r=\eta$ 上 $S_\varepsilon$ 可以任意大，boundary 数据自动 dominate。$\varepsilon\to 0$ 只是"最后把 auxiliary singular term 抹掉"。这一层 trick 我第一次读到觉得 over-engineered，第二次才明白是必要的。

## §22 外区 Ricci 界与 maximal time 识别

`06-barriers.tex:222-256` 是 `Proposition 6.3`：$C$ 使 $r\ge\xi\sqrt{\delta}$ 时 late times 上 $\lVert \Ric \rVert\le C$。这条界在整条 flow 上把内区 barrier 补完；论文把 outer barrier 选成 $H_o=1-b_1\delta/r^2$ 这一形状，$r^{-\text{something}}$ 类型没有被采用，理由是外区要 dominate 的只是 global reaction $c\le D_1/r^2$。

选 $b_1>2D_1+1$，$\Gamma>\xi$、$\Gamma^2\ge\max\{2b_1,4(q-1)\}$（`06-barriers.tex:230-233`）。在几何外区 $r\ge\Gamma\sqrt{\delta}$ 上 $H_o=1-b_1\delta/r^2$，$1/2\le H_o\le 1$，跨过赤道 smooth。$\mathcal{D}H_o=(b_1/r^2)[1-(2(q-1)-4z)\delta/r^2]\ge b_1/(2r^2)>D_1 H_o/r^2$（`06-barriers.tex:238-242`）。这里只用到 $z\ge 0$；不需要 global smallness of $z-1$（`06-barriers.tex:243-244`）。这一点很重要，因为 global $z$ 小性只在 $r\le\sqrt{\delta}$ 区域由 `Lemma 3.3` 给；外区 $r$ 到 $\Gamma\sqrt{\delta}$ 之外，$z$ 只是非负。

固定 $\Gamma$ 最终落在 `Lemma 3.4` 的 annulus 里。Annular 估计与 $\nu>1$ 在 moving lateral boundary 上 bound $\lVert \Ric \rVert$。晚 starting slice 上紧性与 $H_o\ge 1/2$ 让一个 multiplier dominate 初始数据。与 `Proposition 6.1` 相同 first-contact argument 给 $\lVert \Ric \rVert\le C H_o\le C$。两个半球都算，赤道 interior。剩下 fixed annulus $\xi\le r/\sqrt{\delta}\le\Gamma$ 直接用 `Lemma 3.4`（`06-barriers.tex:245-256`）。

Theorem 1.1 的收尾在 `06-barriers.tex:258-281`。取 `§20` 里 selected 那条 flow。`Proposition 6.2` 与 `Proposition 6.3` 在 $M$ 上 late times 给 $R$ 的一致上界。所需的 starting time 限制只有有限条，每条参数与常数已经 fixed，所以共同 such time 存在。更晚时刻在 compact smooth interval 上给 finite bound。`Lemma 3.1` 给 $R\ge -C$。$\sup_{M\times[0,T)}\lvert R \rVert<\infty$。

`Lemma 4.2` 给 $\phi(0,t)\le C\theta(t)\to 0$。Pole orbit 上 smoothness 让 $\phi_s=0$。$p=2$，切于 $\Sp^p$ orbit 的 2-plane 的 sectional curvature $j(0,t)=\phi(0,t)^{-2}\to\infty$（`06-barriers.tex:270-272`）。$\max_M \lVert \Rm \rVert\to\infty$。同 compact manifold 上光滑延长会在 $T$ 附近 compact 时间邻域里 bound 曲率，不可能。所构造 flow 每个 $t<T$ 光滑；闭流形上唯一性把 $T$ 认作其光滑 initial metric 的 maximal existence time。$\Sp^2\times\Sp^{q+1}$ 闭、连通、维度 $q+3\ge 4$（`06-barriers.tex:278-280`）。

这里我读到一个自己曾经以为 trivial 的点：$p=2$ 不是随手挑。$j(0,t)=\phi(0,t)^{-2}$ 是切 $\Sp^p$ 的 plane 的 sectional curvature；$p$ 若 $\ge 3$ 时 $j$ 依然是 $\phi^{-2}$（`03-geometry.tex:17`），但 `§20` 里 $d$ 的极限、cone link 里 $A^2$ 的具体数值都变；`Lemma 4.2` 里的 scalar 恒等式 `04-cap.tex:122-126` 里第一项 $p(p-1)(r/\phi)^2$ 与 cone 平衡的 $A^2=(p-1)/(m-1)$ 一起作用。$p=2$ 让 $A^2=1/(q+1)$、$1-B^2=2/(q+1)$ 都最简；`Lemma 3.3` 证明里 $C_0=4$ 具体化。$p=2$ 是技术选择里最省力的一条。

## §23 速率 corollary：fixed dimension 里 unbounded discrete exponents

`06-barriers.tex:283-320` 是 `Corollary 6.4`。对每足够大 $q$，$d_q=(q+1-\sqrt{(q+1)(q-7)})/2$；对每足够大偶 $k$（threshold 允许依赖 $q$），$\Sp^2\times\Sp^{q+1}$ 上有光滑 Ricci flow，finite maximal time $T$、uniformly bounded scalar curvature，$0<c\le C<\infty$ 使
\[
c(T-t)^{-2k/d_q}\le\max_M \lVert \Rm \rVert(\cdot,t)\le C(T-t)^{-2k/d_q}
\]
在 late times。特别是 fixed 维度容纳 unbounded discrete set 的 power-law Type II exponents。flow、$T$、常数允许依赖 $q$、$k$。

证明骨架（`06-barriers.tex:302-320`）：§20 里选 $q$ 的每条 threshold 都与 $k$ 无关；fixed 这样的 $q$，所有足够大偶 $k$ 满足 `eq:barrier-exponents` 里的要求；`Proposition 2.1` 允许剩下的选择。前面的比较对每条 resulting flow 都成立，常数允许依赖具体 flow。

$d=d_q$ 与 $\theta=(T-t)^{k/d_q}$。`Proposition 4.1` 给 $\max_M \lVert \Rm \rVert\le C\theta^{-2}$。Pole orbit 上 `Lemma 4.2` 给 $\phi(0,t)\le C\theta$，tangential sectional curvature $j(0,t)=\phi(0,t)^{-2}$；因此 $\max_M \lVert \Rm \rVert\ge c\theta^{-2}$。合起来给两条 power-law bound。$2k/d_q>1$ 且随 $k$ 趋 $\infty$；这些 flow 是 Type II，指数无界（$q$ fixed）。

我读到这里第一反应是：$2k/d_q$ 与 $\theta^{-2}$ 之间的换算容易搞混。$\theta=(T-t)^{k/d_q}$ 让 $\theta^{-2}=(T-t)^{-2k/d_q}$。指数就是 $-2k/d_q$。这里的 $k$ 是构造里的 mode index（`02-construction.tex:144-146` 强调），不是 Stolarski 原文 Theorem 1.1 陈述里那个 arbitrary curvature blowup exponent；两者恰好可以对应起来。这个 mode-to-rate 的对应关系我在最初读的时候混淆过一次，回读时才区分。

$d_q\to 2$ 大 $q$（`06-barriers.tex:24`）。fixed 大 $q$，$d_q$ 接近 $2$；指数 $2k/d_q$ 接近 $k$。所以 exponent 是"任意正整数级"的离散集。这条 discrete-ness 来自 $k$ 必须偶；如果允许任意正整数 $k$，exponent 就是连续区间。这一点我原本以为是技术细节，读到 `02-construction.tex:15` 与 `06-barriers.tex:30-31` 才确认：$k$ 偶是构造需要的（$U_k$ 多项式在两端首系数正），exponent 集合因此是离散的。

## §24 与已有工作的对照：这个反例真正证明了什么

回到 §1 里那句猜想："对维度至少 $4$ 的闭 Ricci flow，若 $T<\infty$ 是极大存在时间，则 $\sup\lvert R \rVert=\infty$。" Theorem 1.1 的证伪范围我按 `01-introduction.tex:80-84` 记下来："Theorem 1.1 refutes this conjecture in its unrestricted all-dimensions formulation"，即断言"每一维都有 $|R|$ 无界"这一 unrestricted 版本被否定。反例在足够高维度，$q+3\ge 13$；论文没有给维度四的结论。

这条证伪与我最初预期的 "反例应该给一个具体的最小维度" 不同。我原本想构造 dim 4 或 dim 5 的反例，读到 `01-introduction.tex:82-84` 才明白：猜想只要有一个维度的反例就崩，具体维度是次要的。这不影响数学内容，但影响我怎么向自己解释这篇论文的意义。

与 Bamler 2018 的关系需要小心。Bamler 那篇论文讨论 "bounded scalar curvature 下的收敛"（`bibliography.tex:17-22`），有具体的额外假设（例如 Kähler 或 symmetric 类）；猜想里 "extension" 是光滑延长到 $T$ 之后一段时间。反例只处理光滑延长这一支。`01-introduction.tex:23-24` 里论文强调 "The question concerns smooth extension on the original manifold; continuation through a singular space is a different conclusion"。我一开始把两条混为一谈，读到这句才区分：Bamler 类定理可能仍然给出通过奇异空间的收敛，这与我这里的光滑延长无关。

与 Sesum 2005 的关系：`01-introduction.tex:20-21` 说 $\lVert \Ric \rVert$ 的一致界够延长。Theorem 1.1 只说 $\lvert R \rvert$ 有界，$\lVert \Ric \rVert$ 无界；这条 gap 正是猜想的空间。`Proposition 6.1` 那条 $\lVert \Ric \rVert\le Cr^{-e}$ 在 $r\to 0$ 时确实爆；$e\in(0,1)$ 让 $L^2$ 或更弱的范数有界，$\lVert \Ric \rVert_{L^\infty}$ 无界。Sesum 用不了。

与 Wang 2012 的关系：Wang 只给 subsequential 下界。Theorem 1.1 里的 flow 满足 $\limsup (T-t)^2\max\lVert \Rm \rVert>0$（`01-introduction.tex:31-34` 里的直接推论）；具体 rate 在 `Corollary 6.4` 是 $2k/d_q$，比 $2$ 大很多。Wang 不等式与 `Corollary 6.4` 相容。

与 Stolarski 2019 的关系：论文把 Stolarski 的构造作为存在输入。我上面 `§5` 里已经强调 `Proposition 2.1` 不含标量上界、不含 cap 尺度曲率界、不含向具体 cap 度量的收敛。`01-introduction.tex:57-66` 也说明：Stolarski 的 discussion 只识别有界标量作为"可能特征"，construction 并未 supply 这条 bound。Theorem 1.1 补上这条 bound，方法是在他的 quantitative profile estimates 之上做两条新估计。

与 AIK 2015、Gu-Zhu 2008、Angenent-Kopf 2004 的关系：那些是 Type II 旋转对称 neckpinch 家族；`01-introduction.tex:41-51` 说明这些构造建立 "full curvature 可以比 parabolic scale 更快集中"，但没有给 Theorem 1.1 需要的标量界。

## §25 未尽事项与维度四的沉默

猜想被证伪的方式让一些子问题悬而未决。我列一下我自己最在意的：

第一，维度四。`01-introduction.tex:83-84` 明确说 no dimension-four conclusion asserted。$q\ge 10$ 是 selection 里的门槛，$\mathfrak{m}>0$ 需要 $q$ 大到 $(a-2)(q-1)>C\sqrt{q}+2a^2+1$；$a=5/2$ 时大约要 $q\ge 10$。降 $q$ 到小值，$\mathfrak{m}$ 变负，`Proposition 6.1` 断链。dim 4 是否有反例，这篇论文没答。我在 `§19` 里试过 $a$ 更激进地大（例如 $a=5$），让 $\mathfrak{m}$ 大 $q$ 时更宽；但 $a$ 变大后 $2<d<a$ 与 $e=a-d+d/k$ 兼容区间变窄，$\nu>1$、$\sigma>1/2$ 都吃紧。这一族 trade-off 我没有走完，标 `[推测]`：小 $q$ 里可能存在另一组 $(a,\xi,b_0)$ 让整条 flow 的估计跑起来，也可能不存在；论文里的选择不足以判。

第二，$k$ 的偶性要求。$U_k$ 两端首系数正、$Z_k$ 在 $\gamma\downarrow 0$ 有 $O(\gamma^{-d})$（`02-construction.tex:61-68`）都建在 $k$ 偶。如果 $k$ 允许奇数，`Corollary 6.4` 里 exponent 集合就从 discrete 变成半网格。这桩事不影响 Theorem 1.1，只影响 `Corollary 6.4` 的 exponent 分布。我没有在 Stolarski 原文里翻到允许奇 $k$ 的说法；这一句我按 `[推测]` 标：`02-construction.tex:15` 的偶 $k$ 更像构造技术要求，`§23` 里的 exponent 离散性由此而来。

第三，$\liminf$。Wang 的 $\limsup$ 约束只说 subsequential；`01-introduction.tex:34-38` 强调不 assert 每个足够晚时刻的下界。`Corollary 6.4` 里的 rate 是"每个足够晚时刻都有 $\lVert \Rm \rVert$ 上下界"，比 Wang 强。这桩强化的技术原因在 `Proposition 4.1` 与 `Lemma 4.2`：cap 尺度上 $\theta^2\lVert \Rm \rVert$ 一致上界与 $j(0,t)=\phi(0,t)^{-2}$ 一致下界都是全时区间的，不依赖 subsequential 挑点。这条强化能不能推广到更一般的 Type II 例子？我没有在论文里找到讨论，标 `[推测]`。

第四，标量下界。论文用的是 `Lemma 3.1` 里 $R\ge -C$。这条下界是 $(\partial_t-\Delta)R=2\lVert \Ric \rVert^2$ 与 compact maximum principle 的直接推论（`03-geometry.tex:73-77`）；对任何闭 Ricci flow 都成立。所以真正的技术难点在 $R\le C$ 的上界。这一点我在 `§2` 里已经吃过教训：下界 trivial，上界才需要 barrier。

第五，$\lVert \nabla \Rm \rVert$、$\lVert \nabla^2 \Rm \rVert$ 等高阶导的 rate。`§12` 到 `§15` 用了 Shi 局部与 global 导数估计，但没有给具体 rate；`Corollary 6.4` 只写 0 阶。我原本想问 rescaled curvature 是否有 converging limit；论文里 `04-cap.tex:16-22` 强调 Shi 常数依赖维度、曲率界、空间 margin 与已流逝时间，不需要 injectivity radius 下界。这条 dependency 让高阶 rescaled 界不 sharp；`[推测]` 说：`Proposition 4.1` 里 $\theta^2\lVert \Rm \rVert$ 上界是 sharp 的，$\theta^3\lVert \nabla\Rm \rVert$ 之类的一阶 rescaled 界论文没写。

## §26 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $p$ | 固定 $2$ | `02-construction.tex:7` | $m=p+q$、$A^2=(p-1)/(m-1)$、cone link、$\Sp^p$ orbit sectional $j=\phi^{-2}$ | $p$ 若变，`Lemma 4.2` 里 $p(p-1)$ 与 $m(m-1)$ 平衡变，strict gap 传导链断 |
| $q$ | $\ge 10$ | `01-introduction.tex:69` | 流形维 $q+3$、$\mathfrak{m}>0$、$d>2$、$B(1+B)>1$ 大 $q$ | $q<10$ 时 $d$ 复、构造整体崩 |
| $m$ | $m=p+q$，流形维 $m+1=q+3$ | `02-construction.tex:10`、`02-construction.tex:21` | $A^2$、$B^2$、$d$、$m+1$ 维声明 | $m$ 与 $q$ 分离会失去 cone link 与 $1$-sided cone gap 一致性 |
| $A^2$ | $(p-1)/(m-1)=1/(q+1)$ | `02-construction.tex:10` | Ricci-flat cone link 度量系数、$A/B$、strict gap $\phi/r\ge A/B+\varepsilon_1$ | $A$ 变破坏 cone 的 Ricci-flatness |
| $B^2$ | $(q-1)/(m-1)=(q-1)/(q+1)$ | `02-construction.tex:10` | $z$ 的 cone 值 $z-B^2=\Zt$、slope 引理里 $B(1+B)>1$、$1-B^2=2/(q+1)$ | $B$ 变破 pole 处 $r_s^2=B^2$ 平衡 |
| $d$ | $(m-1-\sqrt{(m-1)(m-9)})/2$ | `02-construction.tex:11` | $\nu=k-d/2$、$\sigma=k/d$、profile weight $\gamma^{-d-j}+\gamma^{2k-d}$ | $d$ 变破 $\nu/d=\sigma-1/2$ |
| $d$ 的极限 | $d\to 2$ 大 $q$，且 $d_q=(q+1-\sqrt{(q+1)(q-7)})/2$ | `06-barriers.tex:24`、`06-barriers.tex:286` | $2<d<a$、$0<e<1$ 的兼容条件、`Corollary 6.4` 指数 $2k/d_q$ | $d$ 若远离 $2$ 变慢，$\mathfrak{m}$ 门槛升高 |
| $k$ | 足够大偶正整数 | `02-construction.tex:15` | $U_k$ 多项式次数、$\nu$、$\sigma$、rate 集合离散性 | $k$ 非偶则 $U_k$ 端点首系数符号失 |
| $\nu$ | $k-d/2$ | `02-construction.tex:12` | profile 幅度 $\delta^\nu$、annulus $\lVert\Ric\rVert\le C\delta^{\nu-1}$、$e=(a-d)/2$ lateral | $\nu$ 若 $\le 1$ 则 annulus 上无衰减 |
| $\sigma$ | $k/d$，$>1/2$ | `02-construction.tex:12` | $\theta=\delta^\sigma$、$\sqrt{\delta}\delta^{\nu/d}=\theta$、$H$ 上 $\delta^L=\theta^{L/\sigma}$ | $\sigma\le 1/2$ 时 cap 尺度不小，尺度分离崩 |
| $\delta$ | $T-t$ | `02-construction.tex:18` | parabolic scale $\sqrt{\delta}$、$\tau=-\log\delta$、$H=\delta^L D_0^{-a/2}$ | $T$ 变 flow 变 |
| $\theta$ | $\delta^\sigma$ | `02-construction.tex:19` | cap 尺度、$c\theta\le\phi(0,t)\le C\theta$、$\theta^2\lVert\Rm\rVert\le C$、$c\le C_*/\theta^2$ | $\theta=\sqrt{\delta}$ 尺度合流，反例失效 |
| $\gamma$ | $r/\sqrt{\delta}$ | `02-construction.tex:19` | profile 变量、$Y_1,Y_2$ cutoff、lateral $r=\xi\sqrt{\delta}$ | 定义变 $Y_1,Y_2$ 全重挑 |
| $f$ | $f=r u_r$ | `02-construction.tex:70` | inner slope $0\le f\le 1$、$f_r\ge 0$、$\partial_{\log r}\log(\phi/r)=f-1$ | $f$ 破 $\le 1$ 时 pole size 反证积分失 |
| $\Ut$ | $\log(\phi/((A/B) r))$ | `02-construction.tex:43` | profile $\Ut\approx\delta^\nu U_k$、$\phi/r\ge A/B+\varepsilon_1$ | $\Ut$ 破正时 strict gap 失 |
| $\Zt$ | $z-B^2$ | `02-construction.tex:44` | profile $\Zt\approx\delta^\nu Z_k$、$z\approx B^2$ 锥平衡 | $\Zt$ 破时 $z$ 靠近 $1$ 与 slope 都断 |
| $\eta_j^U,\eta_j^Z$ | tolerance, 足够小 | `02-construction.tex:45` | profile bound 幅度、$Y_1,Y_2$ cutoff | tolerance 太大则 strict gap 与 cone 近似同失 |
| $Y_1,Y_2$ | $1<Y_1\le Y_2$ 大 fixed | `02-construction.tex:46` | profile 下 cutoff $Y_1\theta,Y_2\theta$、inner interval radius | cutoff 不抬则 $C_0$ 里带 $q,k$ |
| $G_{\mathrm{init}}$ | $M_0 e^{\beta_{\mathrm{init}}\tau_0}$ | `02-construction.tex:82` | initial outer cutoff，$\Ut\ge 0$ 外 sign | 破则 initial 与 propagated 端点失接 |
| $\beta$ | $0<\beta<\nu/(2\nu+1)\le\beta_{\mathrm{init}}<1/2$ | `02-construction.tex:87` | propagated 上 cutoff $M_0e^{\beta\tau}$ | $\beta$ 越界则 profile 覆盖不到大 $r$ |
| $c_1,c_2$ | $U_k$ 端点首系数 $>0$ | `02-construction.tex:66` | $\Ut$ 正负号、inner gap、$\Gamma_0$ 外 sign | 某端负则 cone 近似失 |
| $C_0$ | $4$，与 $q,k$ 无关 | `03-geometry.tex:168` | dimension estimate $\lvert z-1 \rvert\le C_0/q$、$(p-1)r^2e^{-2u}\le(q-1)(1+C_0/q)$ | $C_0$ 若依赖 $q$ 则反应主项被污染 |
| $\varepsilon_1$ | $(A/B)(\exp(c_1 Y_1^{-d}/2)-1)$ 之下任一正数 | `03-geometry.tex:137` | strict inner gap $\phi/r\ge A/B+\varepsilon_1$ | gap 丢则 scalar 恒等式首两项不 $\le -\kappa$ |
| $\kappa$ | fixed $>0$，由 strict gap 诱导 | `04-cap.tex:158` | $R\ge -C$ 时 $r z_r\le -\kappa/(2m)$ 的驱动力 | $\kappa=0$ 时 pole size 反证积分矛盾失 |
| $r_*$ | $r_*=(L_0\theta)^{1/2}$，$L_0=\phi(0,t)$ | `04-cap.tex:138` | pole size 反证里 $\log(\theta/r_*)\to\infty$ | $r_*$ 定错则 log 区间不发散 |
| $H$ | $H=\delta^L(r^2+b_0\theta^2)^{-a/2}$ | `06-barriers.tex:10` | 内区 Ricci supersolution | $H$ 若缺 $b_0\theta^2$ 项则 pole 处奇异 |
| $D_0$ | $D_0=r^2+b_0\theta^2$ | `06-barriers.tex:83` | $H=D_0^{-a/2}\delta^L$，$cD_0$ 相加 | $D_0$ 定义变则 $\mathcal{D}H/H$ 主项变 |
| $a$ | $5/2$，需 $a>2$ 且 $2<d<a$ | `06-barriers.tex:23` | diffusion leading $a(q-1)$ 减去反应 $2(q-1)$ | $a=2$ 反应打平无 margin |
| $L$ | $L=k-1$ | `06-barriers.tex:32` | $H$ 幅度 $\delta^L$、$\xi$ 定义 $1/(2\sqrt{L})$ | $L$ 若为 $k$ 或 $k+1$ 则 $e$ 表达式变 |
| $e$ | $e=a-L/\sigma=a-d+d/k$ | `06-barriers.tex:32` | $\lVert\Ric\rVert\le C r^{-e}$、$\ell_0=2-2e$、$\theta^{a-e}=\delta^L$ | $e\notin(0,1)$ 时 scalar supersolution 崩 |
| $\xi$ | $\min\{1/8,1/(2\sqrt{L})\}$ | `06-barriers.tex:38` | 内区半径 $r\le\xi\sqrt{\delta}$、$LD_0/\delta\le 1$ | $\xi$ 太大则 $LD_0/\delta$ 越界 |
| $\mathfrak{m}$ | $\mathfrak{m}=(a-2)(q-1)-C\sqrt{q}-2a^2-1$ | `06-barriers.tex:27` | $\mathcal{D}H/H-c>0$ 的正下界 | margin 非正则比较原理反向 |
| $b_0$ | 满足 $b_0 C_*<\mathfrak{m}$ | `06-barriers.tex:45` | $D_0$ 里的 cap scale mixing | $b_0$ 若 $\ge\mathfrak{m}/C_*$ 则 pole 反应爆 |
| $C_*$ | flow-dep, $c\le C_*/\theta^2$ | `05-reaction.tex:220` | pole 上 $cD_0$ 相加上界 | $C_*$ 破则 pole barrier 无定义 |
| $D_1$ | flow-dep, $c\le D_1/r^2$ 全局 | `05-reaction.tex:222-223` | 外区 $b_1>2D_1+1$ 选择 | $D_1$ 变则 $H_o$ supersolution 需重挑 |
| $b_1$ | $>2D_1+1$ | `06-barriers.tex:230` | $H_o=1-b_1\delta/r^2$ | $b_1\le 2D_1+1$ 则 $\mathcal{D}H_o$ 与 $D_1H_o/r^2$ 打平 |
| $\Gamma$ | $\Gamma>\xi$、$\Gamma^2\ge\max\{2b_1,4(q-1)\}$ | `06-barriers.tex:233` | 外区起算半径、$\mathcal{D}H_o$ 下界正性 | $\Gamma$ 不够大则 $\mathcal{D}H_o$ 变号 |
| $H_o$ | $H_o=1-b_1\delta/r^2$ | `06-barriers.tex:236` | 外区 $\lVert\Ric\rVert\le C H_o\le C$ | $H_o$ 若变 $r^{-\text{pow}}$ 类型则跨赤道奇异 |
| $\ell_0$ | $2-2e\in(0,2)$ | `06-barriers.tex:168` | scalar supersolution $r^{\ell_0}$ 项、$\mathcal{D}(-r^{\ell_0})=\ell_0(q-1+\ell_0 z)r^{-2e}$ | $\ell_0\notin(0,2)$ 时 $r^{\ell_0}$ 与 $\mathcal{D}$ 计算失 |
| $C_1$ | $>\max\{K_0,K_\partial\}+C_2\rho_0^{\ell_0}$ | `06-barriers.tex:192-194` | scalar supersolution 常数、initial 与 lateral dominate | $C_1$ 若小则 lateral 数据过不了 |
| $C_2$ | $\ge 2K_R^2/(\ell_0(q-1))$ | `06-barriers.tex:176` | $S_\varepsilon$ 里 sink 强度，$2\lVert\Ric\rVert^2$ 上界 | $C_2$ 若小则 $\mathcal{D}S_\varepsilon<2\lVert\Ric\rVert^2$ |
| $K_R$ | 使 $\lVert\Ric\rVert\le K_R r^{-e}$ | `06-barriers.tex:173` | $C_2$ 与 $S_\varepsilon$ 的构造 | $K_R$ 若依赖 $t$ 则 barrier multiplier 也依赖 |
| $S_\varepsilon$ | $S_\varepsilon=C_1-C_2 r^{\ell_0}+\varepsilon r^{-1}$ | `06-barriers.tex:180` | 内区 $R\le S_\varepsilon$，$\varepsilon\downarrow 0$ 得 $R\le C_1$ | $\varepsilon$ 项去掉则 $r=\eta$ lateral 数据 dominate 不了 |
| $\rho_0$ | $\rho_0=\xi\sqrt{T-t_0}$ | `06-barriers.tex:188` | late start lateral radius | $\rho_0$ 变则 $C_1$ 也变 |
| $j(0,t)$ | $j(0,t)=\phi(0,t)^{-2}\to\infty$ | `06-barriers.tex:272` | Theorem 1.1 里 $\max\lVert\Rm\rVert\to\infty$ 的下界 | $\phi(0,t)\not\to 0$ 则曲率爆失败 |
| $\lVert\Rm\rVert$ 上界 rate | $\theta^{-2}=(T-t)^{-2k/d_q}$ | `06-barriers.tex:293-295` | `Corollary 6.4` 上界与下界两侧 | 上界失 rate 不 sharp；下界失则 Type II 不成立 |
| Wang 下界 | $\limsup (T-t)^2\max\lVert\Rm\rVert>0$ | `01-introduction.tex:31-34` | 排除 Type I 反例，逼出 Type II | 若 Type I 反例存在则 Wang 定理失效 |
| $\mathcal{D}R$ 演化 | $(\partial_t-\Delta)R=2\lVert\Ric\rVert^2$ | `03-geometry.tex:74` | $R\ge -C$ 下界 | 演化方程错则 §13 反证与 §21 supersolution 全断 |
| $\mathcal{D}$ 表达式 | $\mathcal{D}F=F_t\rvert_r-zF_{rr}-((q-1+z)/r)F_r$ | `03-geometry.tex:94-96` | 所有 barrier 的 $\mathcal{D}$ 计算 | $\mathcal{D}$ 若写错则 §19 与 §21 全断 |
| $\log(\phi/r)$ heat | $(\partial_t-\Delta)\log(\phi/r)=(q-1)/r^2-(p-1)/\phi^2$ | `03-geometry.tex:103-105` | 外区 ratio lower bound 与 global ratio bound | identity 失则 cone 平衡与 §22 外区 barrier 同失 |





