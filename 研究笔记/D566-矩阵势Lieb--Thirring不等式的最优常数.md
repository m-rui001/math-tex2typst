# 研究笔记 D566：矩阵势 Lieb--Thirring 不等式的最优常数

## §0 任务设定与登记

这一单的坐标先钉死。素材实测是 build/ 下 11 个 .tex 文件、合计 75,584 字节、共 1,767 行，最大的一条是 build/sections/trace.tex 的 16,095 字节，其次是 build/sections/field.tex 的 14,231 字节与 build/sections/paths.tex 的 12,934 字节；按派单给的厚素材口径办事，先量字节再分段读主干，不整篇顺读。要回答的问题只有一句话：把一维薛定谔算子 $H_W=-d^{2}/dx^{2}-W$ 的势从标量函数换成取值在 $\mathbb{C}^{m\times m}$ 的半正定 Hermite 矩阵值函数 $W$，负谱矩 $\mathrm{Tr}(H_W)_{-}^{\gamma}=\sum_{\lambda_j(H_W)<0}\lvert\lambda_j(H_W)\rvert^{\gamma}$ 对代价 $\int_{\mathbb{R}}\mathrm{tr}(W(x)^{\gamma+1/2})\,dx$ 的最优常数，会不会因为多了"内部分量可以随位置转动"这条自由度而变大。答案在 $1/2<\gamma<3/2$ 这段开区间里：常数纹丝不动，与矩阵阶数 $m$ 无关，$C_{\gamma}$ 仍由单通道那条 Pöschl--Teller 型势取到，见 build/sections/introduction.tex:28--43。

我写这份笔记的目的并非复述定理，是（此处按素材骨架反推）把"我最初为什么会猜错"与"作者被迫在哪一步换工具"这两条线分开。凡素材没有交代的动机，我一律标 [推测] 并说明信息缺口在哪，绝不硬编一条心路历程出来。素材里最刺眼的一处诚实是在引言的历史节：$\gamma=1$ 这一点的锐利矩阵不等式已经被 Read--Schulz 在 2026 年 9 月证走，常数是 $4/(3\sqrt{3}\pi)$，见 build/sections/history.tex:34--36，随后第 37--38 行直说本稿的指数一情形已含在他们的结果里，额外的范围只剩 $1/2<\gamma<3/2$ 且 $\gamma\neq1$。把自己的增量精确到"去掉一个点"的程度，这种写法值得抄进我的习惯里。

参数约定我照抄 build/sections/introduction.tex:96--101：$\sigma=\gamma-\tfrac12\in(0,1)$，$p=1+\sigma$，$q=1+\sigma^{-1}$，$\beta=\sigma-\tfrac12\in(-\tfrac12,\tfrac12)$，于是 $p^{-1}+q^{-1}=1$。这四个字母后面反复出现，特别是 $\beta$ 只以权 $t^{\beta}dt$ 的面目出现，它的两个端点 $-\tfrac12$ 与 $\tfrac12$ 恰好是素材里所有收敛性论证的分水岭：$t\downarrow0$ 时 $\beta-\tfrac12>-1$ 才可用，$t\to\infty$ 时 $\beta-\tfrac32<-1$ 才可用，见 build/sections/trace.tex:16--17 与 build/sections/trace.tex:77--78。我把这条"两个不等式同时成立"的结构记在心里，后面每遇到一个反常积分就先问它落在哪个区间。

登记串两行照抄在下面，作为本节末尾的挂账，正文里凡提到队列位置我都写"其他队列第 389 行号"这个整串，凡提到目录都写完整串、含日期后缀、不改大小写、不截断。素材目录与队列行号是本单唯一的取材依据，我不碰 lean/、不碰 formalization.yaml、不跑任何 git 命令，也不读那张同名 PDF。

preprints/Sharp-one-dimensional-Lieb-Thirring-inequalities-for-matrix-potentials-October-5-2026
其他队列第 389 行号

## §1 素材与取证口径

取证一共 13 次调用：两次用于量目录结构（一次列 build/ 树，一次跑字节统计），十一次用于读 .tex。清单照实登记，字节数全部是 `wc -c` 的实测输出：build/main.tex 982 字节 27 行，build/preamble.tex 1,109 字节 30 行，build/references.tex 4,037 字节 99 行，build/notes/history.tex 2,696 字节 47 行，build/sections/action-framework.tex 2,222 字节 49 行，build/sections/action-limit.tex 4,999 字节 124 行，build/sections/introduction.tex 5,826 字节 107 行，build/sections/spectral.tex 10,453 字节 235 行，build/sections/paths.tex 12,934 字节 286 行，build/sections/field.tex 14,231 字节 361 行，build/sections/trace.tex 16,095 字节 402 行。合计 75,584 字节与派单给的数字逐字吻合，这条吻合本身也证明我没有漏读别的版式：build/source/ 那种版式在这里并不存在，树里只有 build/figures、build/notes、build/sections 三个子目录，图形只有一个 build/figures/half-line-gluing.pdf 与它的 png 伴生物，两者我一律没读。

版式细节值得写一笔。构建入口 build/main.tex:18--25 的 \input 顺序是 introduction、action-framework、trace、field、paths、action-limit、spectral、references，也就是把那条独立痕迹不等式（trace 一节）排在场与路径之前，这个次序本身就说明了依赖关系：没有痕迹比较，场那一节的关键命题就悬空。数学环境按节编号，见 build/preamble.tex:10--17 与第 27 行，正文里所有定理、命题、引理、注记共享同一计数序列，这与我笔记里"同一编号只许出现一次"的纪律是同构的。导言区自定义了一批单字母缩写宏，覆盖实数集、复数集、小迹与大迹、对称矩阵空间、双曲正割、对角矩阵、算子范数与 Hilbert--Schmidt 这几类记号；我转述时一律展开成标准写法（例如把实数集写作 $\mathbb{R}$、把小迹写作 $\mathrm{tr}$、把希尔伯特--施密特范数写作 $\lVert\cdot\rVert_{\mathrm{HS}}$），并且不在任何清单里复写那些宏名本身。

有一处素材自身的笔误我必须登记下来以免照抄：build/sections/action-limit.tex 第 110--111 行那句关于 $\mu_{\delta}(z)=(z+\delta)^{\sigma}-\delta^{\sigma}$ 的行内式，第二个数学定界符缺失，导致该行定界符计数为奇。它不影响数学内容，只影响机械检查，我在转述这条公式时把它写成完整闭合的行内式，同时不去改动素材本体。同类的小瑕疵还有 build/sections/trace.tex:352--358 用了带 align 环境但手工换行的写法，我转述时改成一行的 $\mathcal{D}_{D}(t)=\mathrm{tr}\bigl(R^{-1}+R(tI+D)-2(tI+D)^{1/2}\bigr)\geq0$ 形式。

口径上还有三条硬边界。第一条：素材全篇没有任何 Lean 痕迹，build/ 下没有 .lean 文件被 \input，派单也没给 Lean 行，所以本单不做形式化取证，凡涉及"形式化状态"的判断我一律写 [推测]。第二条：build/sections/history.tex:40--45 与 build/sections/introduction.tex:52--63 反复引用的那份标量同伴稿（标题是 Sharp one-dimensional Lieb--Thirring constants，日期后缀 2026 年 9 月 23 日）不在我的取材目录里，我不许自己跨目录读它，因此凡是"同伴稿的秩至多一约束"这类说法，我只能转述本稿对它的描述，无法核对原文。第三条：typst/ 分片与 README.md 都不作正文素材，后者只用于确认标题与日期。

## §2 初始动机与猜想

我最初的直觉是"常数是会变大的"，这个直觉有具体来源。$\mathrm{Tr}(H_W)_{-}^{\gamma}$ 是全部负特征值的 $\gamma$ 阶矩之和，而势的代价只按 $\mathrm{tr}(W^{p})$ 结算，$p=\gamma+\tfrac12$。当 $W(x)$ 是矩阵时，我脑子里的第一幅图景是：一个粒子在几个通道之间跳，势的特征空间随位置转动，那么把同一份"势的强度预算"分时分配给不同通道，也许能造出比单通道更深的束缚，好比把一枚筹码拆成两半押在两条相关局面上。素材没有写作者是否这样想过，标 [推测]，但这份稿子的整个技术结构恰好是对这一直觉的系统性反驳，所以我把它当作自己要对付的那个默认猜想来写。

反证我的直觉的第一件事，是两个端点早就被矩阵版本拿下且常数没有变大。$\gamma=\tfrac12$ 处锐利常数是 $\tfrac12$，由 Hundertmark--Lieb--Thomas 得到，见 build/sections/history.tex:14--15，其算子值版本由 Hundertmark--Laptev--Weidl 补上，见同一文件第 16--17 行；$\gamma=\tfrac32$ 处的锐利矩阵估计由 Laptev--Weidl 用痕迹恒等式建立并推广到算子值势，见第 18--20 行。也就是说开区间两端的矩阵常数是"标量常数的自然延拓"，中间若真有凸起，那必须是某种只在开区间出现的机制。物理动机同样来自素材的第一句：这类不等式起源于费米子动能与物质稳定性，见 build/sections/history.tex:1--3，而带自旋或多组分的费米子系统正是矩阵势的自然场景，那里最需要的恰恰是"常数与分量数无关"这种稳健形式。

我的第二个直觉来自量纲与缩放，它比第一个更接近正确方向。若 $W$ 换成 $\lambda^{2}W(\lambda\,\cdot)$，则 $H_W$ 的负特征值按 $\lambda^{2}$ 缩放，$\gamma$ 阶矩按 $\lambda^{2\gamma-1}$ 变化，而 $\int\mathrm{tr}(W^{p})$ 也按 $\lambda^{2\gamma-1}$ 变化：$p=\gamma+\tfrac12$ 正是让这个缩放齐次的唯一指数，见 build/sections/introduction.tex:5 与第 32 行的 $\gamma+1/2$。缩放齐次意味着没有任何内禀长度可以帮忙，任何"额外维度带来额外常数"的想法都必须通过纯不等式实现，无法靠调参数绕过。这一点我在 §3 会看到它如何体现在 $c_{\sigma}$ 的定义式 $c_{\sigma}^{-1}=\int_{0}^{\infty}t^{\beta}\bigl(t^{-1/2}-(t+1)^{-1/2}\bigr)dt$ 上，见 build/sections/trace.tex:10--23：那积分本身按 $y^{\sigma}$ 缩放，是整篇论文里所有常数守恒的源头。

我写下的猜想是这样的形式：存在 $C_{\gamma,m}>C_{\gamma}$ 且随 $m$ 单调，因为 $m$ 阶系统包含了 $m-1$ 阶（把多余通道置零即得嵌入），所以"严格增大"是唯一可辩护的方向。素材在 build/sections/introduction.tex:38--42 用一句话把我的猜想打死：常数的最优性由 $W(x)=\mathrm{diag}\bigl((r+1)\mathrm{sech}^{2}(rx),0,\ldots,0\bigr)$、$r=(\gamma-\tfrac12)^{-1}$ 取到，这是一个秩一的、只有一个通道非零的势。等号情形是秩一的，这本身就是极有意思的信息，我在 §18 会回头处理它：等号情形与不等式适用的势类之间的落差有多大，素材没有量化，只给了构造。

## §3 精确陈述

把主定理完整写下来（转述自 build/sections/introduction.tex:28--43）：设 $m\geq1$ 有限，$1/2<\gamma<3/2$，$p=\gamma+\tfrac12$；若可测 Hermite 半正定矩阵值函数 $W:\mathbb{R}\to\mathbb{C}^{m\times m}$ 满足 $\int_{\mathbb{R}}\mathrm{tr}(W(x)^{p})\,dx<\infty$，则
$\mathrm{Tr}(H_W)_{-}^{\gamma}\leq C_{\gamma}\int_{\mathbb{R}}\mathrm{tr}(W(x)^{\gamma+1/2})\,dx$，其中 $C_{\gamma}=\bigl(\tfrac{\gamma-1/2}{\gamma+1/2}\bigr)^{\gamma-1/2}\tfrac{\Gamma(\gamma+1)}{\sqrt{\pi}\,\Gamma(\gamma+3/2)}$；
该常数在每个有限矩阵阶数上都最优，且以 $r=(\gamma-\tfrac12)^{-1}$ 写出的对角势 $\mathrm{diag}((r+1)\mathrm{sech}^{2}(rx),0,\ldots,0)$ 取到等号。

这里有三个容易看漏的点，我先各自钉一个坐标。第一，势类只有可测与半正定两个要求，没有连续性、没有衰减率、没有逐点一致有界；负谱的离散性与有限重数被当作定理来证，位置在 build/sections/spectral.tex:14--27，形式是：$W^{1/2}$ 作为从 $H^{1}(\mathbb{R};\mathbb{C}^{m})$ 到 $L^{2}(\mathbb{R};\mathbb{C}^{m})$ 的乘子算子是紧的，于是零以下只可能有好消息（孤立特征值、有限重数、只在 $0$ 处聚集）。第二，形 $h_W[\psi]=\int_{\mathbb{R}}\lVert\psi'(x)\rVert^{2}dx-\int_{\mathbb{R}}\langle\psi(x),W(x)\psi(x)\rangle dx$ 定义在 $H^{1}(\mathbb{R};\mathbb{C}^{m})$ 上，见 build/sections/introduction.tex:12--16，闭合且有下界的证明要点是 $\lVert\psi\rVert_{\infty}^{2}\leq2\lVert\psi\rVert_{2}\lVert\psi'\rVert_{2}$ 这条一维不等式对向量值同样成立，然后赫尔德与插值给出 $h_W$ 的相对有界性，见 build/sections/spectral.tex:31--44。第三，矩阵幂走谱演算，$\mathrm{tr}$ 是未归一化的普通矩阵迹，见 build/sections/introduction.tex:25--26；这条约定决定了后面所有常数的形状，若换成归一化迹，$C_{\gamma}$ 就要跟着 $m$ 走。

再补一个我在初读时误判过的细节：定理左端的 $\mathrm{Tr}$ 与右端的 $\mathrm{tr}$ 大小写不同，前者是算子的迹（对所有负特征值求和），后者是矩阵迹，见 build/sections/introduction.tex:23 与 build/preamble.tex 里那两个算子声明；素材在 build/sections/spectral.tex:176--178 明确交代了"先固定任意有限非空的负特征值列表，再对所有有限和取上确界"这一层，这解释了为什么主定理里允许和式一开始取值无穷。指数向 $\tfrac12$ 与 $\tfrac32$ 两端趋近时 $C_{\gamma}$ 的行为也值得记：$\gamma\to\tfrac12^{+}$ 时因子 $(\tfrac{\gamma-1/2}{\gamma+1/2})^{\gamma-1/2}\to1$，$\Gamma$ 部分给出 $L_{1/2,1}=1/2$，$\gamma\to\tfrac32^{-}$ 时 $\bigl(\tfrac{\gamma-1/2}{\gamma+1/2}\bigr)^{\gamma-1/2}\to\tfrac12$ 并把 $C_{3/2}$ 送到半经典常数，见 build/sections/history.tex:21--24 关于提升维度给出半经典常数的叙述；两个端点连续对接，这是我最终接受"常数的确没变大"的第一个证据。

## §4 错误路线一：逐通道对角化与秩一约束

第一条走不通的路是把 $W(x)$ 逐点对角化，然后对每个对角通道用标量不等式再求和。这条路在标量势场合是无害的，在矩阵势场合立刻露馅：形里的动能项 $\int_{\mathbb{R}}\lVert\psi'\rVert^{2}dx$ 在随位置变化的特征基下会多出联络项，$\psi'=U'v+Uv'$ 展开后 $\langle U'v,U'v\rangle$ 这项非负，于是把它丢掉只可能高估束缚、不可能得到正确的常数方向。更根本的困难在素材自己的口径里：素材在 build/sections/introduction.tex:45--47 强调 $W(x)$ 可以互不相称、可以有任意秩，结论同时关于"变化的内部通道"与"独立的标量通道"。这就是我的路线被否证的落点，我记下它的失败原因有三层：其一，逐点对角化丢掉了协变导数；其二，各通道特征值之和与全部负特征值的矩之间没有单调可比关系，多体耦合可以把矩搬到别的特征值上；其三，即使把通道数取成 $1$，这条路线也无法触及等号情形，因为等号情形是秩一族势，并非对角势。

素材对"从标量到矩阵"的技术缝隙写得极清楚，我照它的原话拆成问题。同伴稿的动作方法里，试函数矩阵 $A(x)=CU(x)$ 只有一列，于是约束"$M_{\delta}(B)=\rho$"里的密度 $\rho=A A^{\mathsf{T}}$ 秩至多为一；矩阵势场合 $\rho$ 可以有任意秩，于是原证明里那条"秩一到秩一"的比较彻底失效，见 build/sections/introduction.tex:65--71。也就是说，缺的不是一个技术引理的加强版，是一个新命题：对任意秩的正矩阵密度控制 $\mathrm{tr}(\rho^{q})$。素材在 build/sections/action-framework.tex:43--47 直说了："必要的新成分是一条关于正矩阵密度、不加秩限制的不等式"。这一句让我确认自己踩在了正确的坑上，因为同伴稿的证明在 $d=1$ 时成立（同文件第 42 行引用其定理形式），把 $d$ 从 $1$ 提到任意值这件事在旧框架里是"看起来只差一个求和"，实际差一整节论文。

我还试过第二条同样直觉的路：把标量试函数与矩阵系数分开处理，也就是取 $n$ 个向量值试函数并假定可以把它们的密度矩阵同时对角化，然后在每个特征方向上做一次 Young 不等式。这条路半通半堵：通的部分是 build/sections/spectral.tex:134--144 的痕迹 Young 估计确实靠"在 $Z$ 的特征基里逐特征值做标量极大化"，堵的部分是它只能处理 $\mathrm{tr}(WZ)-\mathrm{tr}(Z^{q})$ 这种点态形状，无法处理形如 $\mathrm{tr}\bigl(M_{\delta}(B)(K^{2}-B^{2})\bigr)$ 的对象，那里 $K^{2}-B^{2}$ 可以是不定的，见 build/sections/trace.tex:48--51 与 build/sections/field.tex:253--258。不定性这一条后来变成我的判据：任何声称能一步到位的证明，如果它默认了扰动本身半正定，那它必然在这个问题上失败。

## §5 关键转折：把约束换成惩罚，再换成一条独立的痕迹比较

转折发生在两个层次上，素材把它们的分工写得很克制，我把它们还原成动因。第一个层次是方法上的：不要试图直接满足 $M_{\delta}(B)=AA^{\mathsf{T}}$ 这条约束，是把它塞进常微分方程变成惩罚项。具体形式在 build/sections/paths.tex:35--42 那条 $\varepsilon B_{\varepsilon}'=M_{\delta}(B_{\varepsilon})-A_{\varepsilon}A_{\varepsilon}^{\mathsf{T}}$ 加上双端点条件 $B_{\varepsilon}(x_{-})=K$、$B_{\varepsilon}(x_{+})=-K$。惩罚一旦进入动作恒等式，就会以 $-\varepsilon^{-1}\lVert M_{\delta}(B)-AA^{\mathsf{T}}\rVert_{\mathrm{HS}}^{2}$ 的面目出现，见 build/sections/action-limit.tex:41--52，于是"违反约束的程度"自动被压向零，而我需要的非线性项估计只需在约束真正成立的那点（即 $M_{\delta}(B)=AA^{\mathsf{T}}$、此时场半正定）上成立。素材在 build/sections/action-limit.tex:69--72 把这点讲透了：这是全证明里唯一用到场之正性的地方，被构造出来的路径本身并不必正。读到这里我意识到自己一直在求"处处成立"的估计，而定理只需要"在零点成立"的估计，这一松手就把矩阵势的难点集中到了唯一一处。

第二个层次是数学上的：那唯一一处估计被隔离成一条独立的、与矩阵大小无关、与薛定谔算子无关的纯矩阵命题，即 build/sections/trace.tex:25--45 的积分痕迹比较定理。设 $n\geq1$、$B,V\in\mathbb{C}^{n\times n}$ Hermite，且存在 $b>0$ 使 $Y_s=(sI-B)^{2}$、$X_s=Y_s+V\geq bI$ 对每个 $s\in\mathbb{R}$ 成立；令 $R(t)=\tfrac1\pi\int_{\mathbb{R}}(X_s+tI)^{-1}ds$、$P(t)=t^{-1/2}I-R(t)$、$N=c_{\sigma}\int_{0}^{\infty}t^{\beta}P(t)dt$；若 $N\geq0$，则 $\mathrm{tr}(NV)\geq\mathrm{tr}(N^{q})$。它把整篇论文的矩阵困难压进两个假设（符号一致正、$N$ 半正定）与一个结论，而标量情形 $V=v>0$ 通过平移 $s$ 立刻给出 $R(t)=(t+v)^{-1/2}$、$N=v^{\sigma}$，两端精确相等，见 build/sections/trace.tex:47--51。这条定理就是"任意秩"三个字的全部代价，也是本稿真正的新内容，我后面所有节的复述都按它的证明顺序走。

为什么假设要允许 $V$ 不定，素材给了直接答复：$V$ 稍后是从 $K^{2}-B^{2}$ 得来的，那一项天然不定，见 build/sections/introduction.tex:74--78 的"假设容许不定的 $V$，这是把 $V$ 取为 $K^{2}-B^{2}$ 所必需的"。把这两句并排读，就能看出作者如何从失败里学到条件：正性条件必须放在整个符号 $X_s=Y_s+V$ 上，并非放在 $V$ 上。这个挪动是本稿我认为最值得学的一步。它同时解释了注记 build/sections/trace.tex:393--401 的存在：若 $B$ 与 $V$ 交换，符号条件就退化为 $V\geq bI$，联合对角化给出 $N=V^{\sigma}$、$Z=0$，亏量整条消失，等于说"交换情形下没有损失"，一切损失都由非交换的两块非负项承担。

## §6 第一条被证成的路线：两条半轴解给出边界矩阵

痕迹比较定理的第一手计算是解一个常系数方程并把它的半轴衰减解与 $R(t)$ 挂钩。固定 $t>0$，写协变导数 $\nabla=\partial_x-\mathrm{i}B$，考虑 $(-\nabla^{2}+V+tI)\psi=0$，见 build/sections/trace.tex:83--88。引理（build/sections/trace.tex:90--104）说：对每个 $v\in\mathbb{C}^{n}$，该方程在每条半轴上有唯一的 $H^{1}$ 解取边界值 $v$，并且存在 Hermite 矩阵 $S=S(t)$、$T=T(t)$ 使 $\nabla\psi(0+)=-Sv$、$\nabla\psi(0-)=Tv$；它们满足黎卡提型恒等式 $V+tI=S^{2}+\mathrm{i}[B,S]=T^{2}-\mathrm{i}[B,T]$ 与 $(S+T)/2=R(t)^{-1}$；并且 $B+\mathrm{i}S$ 的每个特征值虚部严格为正。证明里我先被两点抓住：一是用强迫项的强制性（形 $a_t$ 的傅里叶符号是 $X_s+tI$，由符号条件与 $s$ 的二次增长给出 $X_s+tI\geq c_t(1+s^{2})I$）把存在性归到 Riesz 表示定理，见 build/sections/trace.tex:106--129；二是 $(S+T)/2=R(t)^{-1}$ 这条最关键的式子来自把左右两个解在 $0$ 处粘起来，粘合后导数跳跃 $-(S+T)v$，于是全直线方程变成 $(-\nabla^{2}+V+tI)\psi=\delta_{0}(S+T)v$，再用正向核 $e^{-\mathrm{i}sx}$ 的傅里叶变换在 $0$ 处反演，得 $v=\tfrac12 R(t)(S+T)v$，见 build/sections/trace.tex:151--168。这条"粘合加反演"的把戏是本节的技术核心，也是素材唯一配了插图的论证，图注在 build/sections/trace.tex:177--188（图文件我按口径没有读，只读了它的 tex 图注）。

有了 $S,T$ 就把它们拆成和的一半与差的一半：$L=\tfrac{S+T}{2}=R(t)^{-1}>0$、$Z=\tfrac{S-T}{2}$，见 build/sections/trace.tex:190--194。黎卡提两式相加相减给出 $V+tI=L^{2}+Z^{2}+\mathrm{i}[B,Z]$ 与 $LZ+ZL+\mathrm{i}[B,L]=0$，后者在 $L$ 的本征基下对角元是 $2L_{jj}Z_{jj}=0$，于是 $\mathrm{tr}Z=0$；再把该式左右同乘 $R=L^{-1}$ 得 $\mathrm{i}[R,B]=-(ZR+RZ)$，用迹的循环性得到 $\mathrm{i}\,\mathrm{tr}(R[B,Z])=-2\mathrm{tr}(RZ^{2})$，最终 $\mathrm{tr}\bigl(R(V+tI)\bigr)=\mathrm{tr}L-\mathrm{tr}(RZ^{2})$，见 build/sections/trace.tex:195--211。这里我读到的是作者的一条路线感：$L$ 承担"积分预解式"本身，$Z$ 承担"非交换误差"，而且误差 $\mathrm{tr}(RZ^{2})=\mathrm{tr}(ZRZ)$ 号是好的（非负），所以它只会加强结论。

$L$ 与 $Z$ 只能给出 $\mathrm{tr}(R(t)\cdot)$ 的积分，而 $N$ 需要带权 $t^{\beta}dt$ 的积分，于是必须找一个 $t$ 的标量函数，它的导数里含 $\mathrm{tr}R(t)$。作者选了行列式的对数，即 $F(t)=\tfrac{\mathrm{tr}V}{\sqrt{t}}-\tfrac1\pi\int_{\mathbb{R}}\log\tfrac{\det(X_s+tI)}{\det(Y_s+tI)}ds$，见 build/sections/trace.tex:219--233。因子化 $X_s+tI=(sI-B+\mathrm{i}S)(sI-B-\mathrm{i}S)$ 把分子写成 $\prod_{j}((s-u_{j})^{2}+v_{j}^{2})$，其中 $u_{j}+\mathrm{i}v_{j}$ 是 $B+\mathrm{i}S$ 的特征值、$v_{j}>0$；分母是同样形状但中心在 $B$ 的特征值、宽度全为 $\sqrt{t}$。平移中心在对称截断下不改变积分值这件事，素材在第 250--266 行用 $h(s)=\log(s^{2}+v^{2})$ 的偶性与 $h'(s)\to0$ 逐字证了一遍，随后用 $\int_{\mathbb{R}}\log\tfrac{s^{2}+v^{2}}{s^{2}+w^{2}}ds=2\pi(v-w)$ 得到 $F(t)=\tfrac{\mathrm{tr}V}{\sqrt{t}}-2\mathrm{tr}(L-\sqrt{t}I)$。我在这一步真正佩服的是"为了一个导数而引入辅助函数"的老手艺：辅助函数不是装饰，$F(t)$ 与第二个函数 $G(t)=\mathrm{tr}(L-2\sqrt{t}I+tR(t))$ 合起来给出恒等式 $\mathrm{tr}(P(t)V)=F(t)+G(t)+\mathrm{tr}(R(t)Z^{2})$，见 build/sections/trace.tex:284--288，而这一条式子同时供应了所有反常积分所需的端点控制。剩下的一环是权 $t^{\beta}$ 的分配，素材用 $tF'(t)=-\tfrac12F(t)-G(t)$ 分部积分换来 $\int_{0}^{\infty}t^{\beta}G\,dt=\sigma\int_{0}^{\infty}t^{\beta}F\,dt$，见 build/sections/trace.tex:302--316，这一步把 $\beta$ 与 $\sigma$ 的关系 $\beta+\tfrac12=\sigma$ 用得非常干净，我在 §13 会看到它如何决定误差项 $E_{\delta}$ 的形状。

## §7 正则化场的构造与切线延拓

痕迹比较定理是一条纯矩阵命题，要把它接到动作泛函上，需要造一个定义在实对称矩阵空间 $\mathrm{Sym}_{n}$ 上的场 $M_{\delta}$ 以及它的标量原函数 $J_{\delta}$。素材从 build/sections/field.tex:3--12 起就把目标讲明：固定正对角矩阵 $K=\mathrm{diag}(k_{1},\ldots,k_{n})$、记 $\kappa=\max_{i}k_{i}$，需要的两件事是 $J_{\delta}(-K)-J_{\delta}(K)$ 给出动作论证里的边界贡献，以及对任何使 $M_{\delta}(B)$ 半正定的 $B$ 成立 $\mathrm{tr}\bigl(M_{\delta}(B)(K^{2}-B^{2})\bigr)$ 的下界，后者由 §6 那条定理供应。

标的构件是一个带正则化的标量函数。对 $y\geq0$ 令 $f_{\delta}(y)=\tfrac{c_{\sigma}}{\pi}\int_{0}^{\infty}t^{\beta}\bigl(\tfrac{1}{t+\delta}-\tfrac{1}{t+\delta+y}\bigr)dt$，对 $y<0$ 取切线延拓 $f_{\delta}(y)=f_{\delta}'(0)y$，见 build/sections/field.tex:27--34。求导加换元 $t=(y+\delta)u$ 给出 $f_{\delta}'(y)=a_{\sigma}(y+\delta)^{\beta-1}$，其中 $a_{\sigma}=\tfrac{c_{\sigma}}{\pi}\int_{0}^{\infty}\tfrac{u^{\beta}}{(1+u)^{2}}du>0$，积分收敛的条件正是 $-\tfrac12<\beta<\tfrac12$，见 build/sections/field.tex:35--41。我的读法是：$\delta>0$ 的全部作用在于把 $y\mapsto y^{\beta-1}$ 这个在 $0$ 处可积但无界的奇性抹平，因为 $\beta-1<-\tfrac12<0$，若不搬 $\delta$ 就没有局部的 Lipschitz 性可言；切线延拓的作用是把定义域补满整个实轴，好让谱演算对带负特征值的对称矩阵也有意义，而 $C^{1}$、严格增、凹这三条性质全保住了，见 build/sections/field.tex:42--44。凹性后面是命门：§8 的方向不等式就靠它。

场本身由一个对称截断的反常积分给出：$Q_{s}(B)=s^{2}I-2sB+K^{2}$，$M_{\delta}(B)=\lim_{r\to\infty}\int_{-r}^{r}\bigl(f_{\delta}(Q_{s}(B))-f_{\delta}(s^{2})I\bigr)ds$，见 build/sections/field.tex:46--54。减掉 $f_{\delta}(s^{2})I$ 再对称截断的用意是抵消关于 $s$ 为奇的首阶项。素材在第 70--115 行把这句直觉量化，用的工具是一条我很想学的小引理：若标量函数 $h$ 在包含 Hermite 矩阵 $X$、$Y$ 谱的区间上 Lipschitz，则 $\lVert h(X)-h(Y)\rVert_{\mathrm{HS}}\leq\mathrm{Lip}(h)\lVert X-Y\rVert_{\mathrm{HS}}$，证明就是在两个本征基下逐矩阵元比较 $(h(\lambda_{i})-h(\nu_{j}))\langle e_{i},v_{j}\rangle$ 与 $(\lambda_{i}-\nu_{j})\langle e_{i},v_{j}\rangle$ 再平方求和，见 build/sections/field.tex:71--82。把 $h$ 取成 $h_{s}(y)=f_{\delta}(s^{2}+y)-f_{delta}(s^{2})-f_{\delta}'(s^{2})y$，得 $\sup_{\lvert y\rvert\leq a\lvert s\rvert}\lvert h_{s}'(y)\rvert=O(\lvert s\rvert^{2\beta-3})$，于是分解 $f_{\delta}(Q_{s}(B))-f_{\delta}(s^{2})I=-2sf_{\delta}'(s^{2})B+T_{s}(B)$，余项满足 $\lVert T_{s}(B)\rVert_{\mathrm{HS}}=O(\lvert s\rvert^{2\beta-2})$ 且带同阶 Lipschitz 常数。线性项在 $[-r,r]$ 上积分为零，$2\beta-2=2\sigma-3<-1$ 保证余项在无穷可积，见 build/sections/field.tex:97--112。这里我把"$\sigma\in(0,1)$ 因此 $2\sigma-3<-1$"这条阈值单独记一笔，它是收敛性闸门，与 §6 里 $t^{\beta-3/2}$ 那条是一对。

原函数 $J_{\delta}$ 的构造是我最欣赏的一段：取 $g_{\delta}'=f_{\delta}$，用 $\mathrm{d}\bigl(\mathrm{tr}\,g_{\delta}(X)\bigr)[H]=\mathrm{tr}(f_{\delta}(X)H)$（先对多项式由迹的循环性验证，再用 $C^{1}$ 多项式逼近过渡），于是对 $s\neq0$ 那个表达式 $\tfrac{\mathrm{tr}(g_{\delta}(Q_{s}(B))-g_{\delta}(K^{2}))}{2s}+f_{\delta}(s^{2})\mathrm{tr}B$ 的微分恰好是 $-\mathrm{tr}\bigl((f_{\delta}(Q_{s}(B))-f_{\delta}(s^{2})I)H\bigr)$，见 build/sections/field.tex:117--133。推论是每个有限截断下 $-M_{\delta}$ 沿任何分段光滑闭曲线的积分为零，局部一致收敛把这个恒等式传给极限，再在向量空间 $\mathrm{Sym}_{n}$ 上用路径积分定义 $J_{\delta}$，并由 $M_{\delta}$ 的连续性得到 $J_{\delta}\in C^{1}$，归一化取 $J_{\delta}(0)=0$。这条"先证闭路积分为零再定义势函数"的顺序对我是个提醒：场论式的论证里，恰当性与闭路条件是同一个事实的两面，素材把它们分开写，读起来才不糊。

## §8 方向不等式、坐标恒等式与端点差

场的标量伴生函数是 $\mu_{\delta}(z)=\int_{\mathbb{R}}\bigl(f_{\delta}(s^{2}+z)-f_{\delta}(s^{2})\bigr)ds$，$z\in\mathbb{R}$，见 build/sections/field.tex:144--154。绝对收敛由被积函数及其关于 $z$ 的 Lipschitz 常数都是 $O(\lvert s\rvert^{2\beta-2})$ 提供，$f_{\delta}$ 严格增则把 $\mu_{\delta}$ 也带成严格增，并且 $\mu_{\delta}(0)=0$。对 $z\geq0$ 用托内利定理与 $\tfrac1\pi\int_{\mathbb{R}}(s^{2}+a)^{-1}ds=a^{-1/2}$，得 $\mu_{\delta}(z)=c_{\sigma}\int_{0}^{\infty}t^{\beta}\bigl((t+\delta)^{-1/2}-(t+\delta+z)^{-1/2}\bigr)dt=(z+\delta)^{\sigma}-\delta^{\sigma}$，见 build/sections/field.tex:155--166。这一行等于把 §6 的缩放恒等式 $c_{\sigma}\int_{0}^{\infty}t^{\beta}(t^{-1/2}-(t+y)^{-1/2})dt=y^{\sigma}$ 在 $y=\delta+z$ 与 $y=\delta$ 两处相减，所以场的标量影子就是幂函数 $z^{\sigma}$ 的正则化版本，这一点决定了动作下界最终长成 $\int_{-k_{i}}^{k_{i}}(k_{i}^{2}-s^{2})^{\sigma}ds$ 的形状。

平移积分号这件事素材花了一整段来正当化，见 build/sections/field.tex:168--190，因为单独各项不可积。做法是取 $F_{z}(s)=f_{\delta}(s^{2}+z)$，它是偶函数且 $F_{z}'(s)=O(\lvert s\rvert^{2\beta-1})\to0$；对固定 $a$ 与 $r>\lvert a\rvert$，偶性给出 $\bigl\lvert\int_{-r}^{r}(F_{z}(s-a)-F_{z}(s))ds\bigr\rvert\leq\lvert a\rvert^{2}\sup_{r-\lvert a\rvert\leq u\leq r+\lvert a\rvert}\lvert F_{z}'(u)\rvert$，右边趋于零；素材还举了 $a\geq0$ 的具体证明：差等于 $[r,r+a]$ 上的积分减去 $[r-a,r]$ 上的积分，逐对配对即可。结论是 $\lim_{r\to\infty}\int_{-r}^{r}\bigl(f_{\delta}((s-a)^{2}+z)-f_{\delta}(s^{2})\bigr)ds=\mu_{\delta}(z)$。我把这段当作"对称截断下的平移不变性"的标准样板存下来，它的代价只是一次分部配对，收益是整个 §9 的方向估计。

命题级结论四条，全在 build/sections/field.tex:196--219。其一（方向不等式）：对每个 $B\in\mathrm{Sym}_{n}$ 与每个实单位向量 $e$，$e^{\mathsf{T}}M_{\delta}(B)e\leq\mu_{\delta}\bigl(e^{\mathsf{T}}K^{2}e-(e^{\mathsf{T}}Be)^{2}\bigr)$。其二（坐标恒等式）：若 $Be_{i}=ye_{i}$（$e_{i}$ 为坐标基向量），则 $M_{\delta}(B)e_{i}=\mu_{\delta}(k_{i}^{2}-y^{2})e_{i}$。其三（符号等变性）：若 $S$ 是对角且对角元取 $\pm1$，则 $M_{\delta}(SBS)=SM_{\delta}(B)S$。其四（端点差）：$J_{\delta}(-K)-J_{\delta}(K)=\sum_{i=1}^{n}\int_{-k_{i}}^{k_{i}}\mu_{\delta}(k_{i}^{2}-s^{2})ds$。证明只用三件东西：在 $Q_{s}(B)$ 的本征基里用标量凹性 $e^{\mathsf{T}}f_{\delta}(Q_{s}(B))e\leq f_{\delta}(e^{\mathsf{T}}Q_{s}(B)e)$，注意 $e^{\mathsf{T}}Q_{s}(B)e=(s-a)^{2}+z$ 其中 $a=e^{\mathsf{T}}Be$、$z=e^{\mathsf{T}}K^{2}e-a^{2}$，再用上面的平移不变性；坐标恒等式则是 $e_{i}$ 同时是 $Q_{s}(B)$ 的 eigenvector、对应特征值 $(s-y)^{2}+k_{i}^{2}-y^{2}$；等变性来自 $SK^{2}S=K^{2}$ 给出的 $Q_{s}(SBS)=SQ_{s}(B)S$；端点差是把 $J_{\delta}$ 限制在对角子流形上积分 $\mathrm{d}J_{\delta}=-\sum_{i}\mu_{\delta}(k_{i}^{2}-b_{i}^{2})db_{i}$，从 $(k_{1},\ldots,k_{n})$ 走到 $(-k_{1},\ldots,-k_{n})$。我读完的感受是：四条里没有一条用到了 $n$ 的具体大小，这是后面 $m$ 无关性的真正来源，矩阵阶数的全部作用只体现在求和 $\sum_{i=1}^{n}$ 与常数 $E_{\delta}$ 里的那个因子 $n$。

顺带记一笔方向不等式与坐标恒等式之间的强度差：前者是 "$\leq$"，后者是等式，但后者的前提强得多（要求 $B$ 有一个坐标方向的不变直线）。素材在 §10 的自由性论证里用的正是等式版本，在 §9 的正性推论里用的是不等式版本；同一条引理的两种用法分别支撑拓扑部分与分析部分，我觉得这是本稿结构上最漂亮的一处经济性。

## §9 正性如何吞掉秩的自由度

整个矩阵推广的枢纽是 build/sections/field.tex:259--269 这条命题：对任何使 $M_{\delta}(B)\geq0$ 的 $B$，
$\mathrm{tr}\bigl(M_{\delta}(B)(K^{2}-B^{2})\bigr)\geq\mathrm{tr}\bigl(M_{\delta}(B)^{q}\bigr)-E_{\delta}$，$E_{\delta}=n\bigl(\delta\kappa^{2\sigma}+\delta^{\sigma}(\kappa^{2}+\delta)\bigr)$；
并且固定 $K$ 时 $E_{\delta}\to0$（$\delta\downarrow0$）。证明的链条我逐环抄下自己的理解。第一环：由方向不等式与 $\mu_{\delta}$ 严格增、$\mu_{\delta}(0)=0$，$M\geq0$ 迫使 $e^{\mathsf{T}}K^{2}e\geq(e^{\mathsf{T}}Be)^{2}$ 对每个实单位向量成立，于是 $e^{\mathsf{T}}Q_{s}(B)e=(s-e^{\mathsf{T}}Be)^{2}+e^{\mathsf{T}}K^{2}e-(e^{\mathsf{T}}Be)^{2}\geq0$，见 build/sections/field.tex:271--284。第二环：因为 $B$ 实对称，对 $z=u+\mathrm{i}v$ 有 $z^{*}Q_{s}(B)z=u^{\mathsf{T}}Q_{s}(B)u+v^{\mathsf{T}}Q_{s}(B)v$，所以实半正定自动升级成复半正定，这是全稿里唯一一处把实与复缝起来的小动作，却省掉了一整节。第三环：同一条方向估计加 $\mu_{\delta}$ 的显式公式给出 $0\leq M\leq\mu_{\delta}(\kappa^{2})I\leq\kappa^{2\sigma}I$，用到 $(a+b)^{\sigma}\leq a^{\sigma}+b^{\sigma}$（$a,b\geq0$，$0<\sigma<1$），见 build/sections/field.tex:286--294。

第四环是真正的借力：令 $D=K^{2}-B^{2}$、$V=D+\delta I$、$Y_s=(sI-B)^{2}$，则 $X_s=Y_s+V=Q_s(B)+\delta I\geq\delta I$，正好落进 §6 定理的假设；记它的预解式平均与积分矩阵为 $R(t)$ 与 $N$，断言是 $N=M+\delta^{\sigma}I$，见 build/sections/field.tex:296--306。断言的证明是全套分析技巧的压缩版：先把 $B$ 对角化并用平移不变性（取 $z=0$）把 $f_{\delta}(s^{2})I$ 换成 $f_{\delta}(Y_s)$；此时两个被求逆的矩阵都半正定，于是 $f_{\delta}$ 的积分表达式把差写成 $\tfrac{c_{\sigma}}{\pi}\int_{0}^{\infty}t^{\beta}\bigl((Y_s+(t+\delta)I)^{-1}-(Q_{s}(B)+(t+\delta)I)^{-1}\bigr)dt$；求逆前的差是常矩阵 $D$，预解式恒等式给出范数界 $C\lVert D\rVert_{\mathrm{op}}t^{\beta}(1+t+s^{2})^{-2}$，先在 $s$ 上积掉得到 $t^{\beta}(1+t)^{-3/2}$ 量级，再用 $-1<\beta<\tfrac12$ 说明在 $(0,\infty)$ 可积，于是富比尼定理适用，得 $M=c_{\sigma}\int_{0}^{\infty}t^{\beta}\bigl((t+\delta)^{-1/2}I-R(t)\bigr)dt$，见 build/sections/field.tex:308--335。拿它减 $N$ 的定义并用 $y=\delta$ 的缩放恒等式，断言证毕。

第五环把不等式收口。$N\geq0$ 使 §6 的定理可用，$\mathrm{tr}(NV)\geq\mathrm{tr}(N^{q})$，于是 $\mathrm{tr}(MD)=\mathrm{tr}(NV)-\delta\,\mathrm{tr}M-\delta^{\sigma}\mathrm{tr}V\geq\mathrm{tr}(N^{q})-\delta\,\mathrm{tr}M-\delta^{\sigma}\mathrm{tr}V$。因为 $N=M+\delta^{\sigma}I$，两者共谱基且 $M\geq0$，有 $\mathrm{tr}(N^{q})\geq\mathrm{tr}(M^{q})$；$M$ 的特征值全在 $[0,\kappa^{2\sigma}]$ 给出 $\mathrm{tr}M\leq n\kappa^{2\sigma}$，$V\leq(\kappa^{2}+\delta)I$ 给出 $\mathrm{tr}V\leq n(\kappa^{2}+\delta)$，两项一乘就是 $E_{\delta}$ 的两个加数，见 build/sections/field.tex:337--350。我在这个误差项的结构里读出正则化的定价：$\delta\kappa^{2\sigma}$ 来自减去 $\delta\,\mathrm{tr}M$，$\delta^{\sigma}(\kappa^{2}+\delta)$ 来自减去 $\delta^{\sigma}\mathrm{tr}V$，两者对 $\delta$ 都是正幂，故 $\delta\downarrow0$ 时消失，而在 $\delta$ 固定时它们又是 $\varepsilon\downarrow0$ 那一步的界。素材在这里给出的推论正是我 §4 那条失败路线的替代物：若 $A\in\mathbb{R}^{n\times d}$ 满足 $M_{\delta}(B)=AA^{\mathsf{T}}$，则动作里的非线性项 $\mathrm{tr}\bigl((AA^{\mathsf{T}})^{q}\bigr)$ 被完全控制住，$d$ 可以是任意值，见 build/sections/field.tex:352--360。

## §10 路径方程与端点映射

拓扑那一半的任务在 build/sections/paths.tex:23--52 的命题里：给定 $n,d\geq1$、有界区间 $\Omega=(x_{-},x_{+})$、正对角 $K$，以及满足 $\int_{\Omega}UU^{\mathsf{T}}dx=I_{n}$ 的 $U\in H^{1}_{0}(\Omega;\mathbb{R}^{n\times d})$，则对每个 $\delta>0$、$\varepsilon>0$ 存在下三角 $C_{\varepsilon}\in\mathcal{L}$ 与 $B_{\varepsilon}\in C^{1}(\overline{\Omega};\mathrm{Sym}_{n})$，使 $A_{\varepsilon}=C_{\varepsilon}U$ 满足 $\varepsilon B_{\varepsilon}'=M_{\delta}(B_{\varepsilon})-A_{\varepsilon}A_{\varepsilon}^{\mathsf{T}}$ 且 $B_{\varepsilon}(x_{-})=K$、$B_{\varepsilon}(x_{+})=-K$；并有 $\sup_{x}\lVert B_{\varepsilon}(x)\rVert_{\mathrm{op}}\leq\kappa$ 与 $\sup_{0<\varepsilon\leq1}\lVert C_{\varepsilon}\rVert_{\mathrm{HS}}<\infty$（后一条是对固定 $\delta,K,\Omega$）。开头第 12--17 行把整体策略讲成一句话：初始参数处商掉行符号后恰有一个解；若终端无解，光滑化与保持符号的小扰动会造出一个由有限个圆与区间拼成的商零集，而它只有恰好一个边界点；圆无边界、区间贡献两个边界点，矛盾。

实现策略的第一步是给场截断。取 $\mathrm{Sym}_{n}$ 上非负紧支撑光滑函数 $\chi$，在 $\{B:\lVert B\rVert_{\mathrm{op}}\leq\kappa\}$ 上恒等于 $1$，且在对角符号矩阵的共轭下不变；素材第 57--60 行说明这种 $\chi$ 可以从任何一个邻域截断出发、对有限个符号矩阵取平均得到。截断场 $\widehat{M}_{\delta}(B)=\chi(B)M_{\delta}(B)$ 有界且全局 Lipschitz，这是常微分方程整体可解的通行证。固定 $\varepsilon>0$、$C\in\mathcal{L}$、$0\leq\theta\leq1$，解初值问题 $\varepsilon B'=\theta\widehat{M}_{\delta}(B)-(CU)(CU)^{\mathsf{T}}$、$B(x_{-})=K$，定义端点映射 $\Phi(C,\theta)=B(x_{+})+K$；$\Phi(\cdot,1)$ 的零点就是所需的第二个端点，见 build/sections/paths.tex:69--87。

符号群 $\mathcal{G}$（对角元为 $\pm1$ 的对角矩阵）在 $\mathcal{L}$ 上按 $C\mapsto SC$、在 $\mathrm{Sym}_{n}$ 上按 $B\mapsto SBS$ 作用；由场的等变性、$SKS=K$ 与解的唯一性得 $\Phi(SC,\theta)=S\Phi(C,\theta)S$，见 build/sections/paths.tex:88--97。这条等变性后面用两次：一次证明零点的先验界，一次保证光滑逼近与扰动都能保持等变。零点全部落在有界集这件事来自积分：在零点处把方程在 $\Omega$ 上积分并用 $U$ 的行正交归一性，得 $CC^{\mathsf{T}}=2\varepsilon K+\theta\int_{\Omega}\widehat{M}_{\delta}(B(x))dx$，于是 $\lVert C\rVert_{\mathrm{HS}}^{2}\leq2\,\mathrm{tr}K+n\lvert\Omega\rvert\sup_{B}\lVert\widehat{M}_{\delta}(B)\rVert_{\mathrm{op}}$（对 $0<\varepsilon\leq1$），从而联合零集 $\{(C,\theta):\Phi(C,\theta)=0\}$ 紧，见 build/sections/paths.tex:99--118。

自由性（只有单位符号矩阵固定 $C$）的证明我读了两遍，它靠的是坐标恒等式：若第 $i$ 行为零，则只改该行符号的反射 $S_{i}$ 固定 $C$，等变性加唯一性迫使 $S_{i}B(x)S_{i}=B(x)$，于是 $B(x)e_{i}=y(x)e_{i}$，而坐标恒等式给出标量方程 $\varepsilon y'=\theta\chi(B(x))\mu_{\delta}(k_{i}^{2}-y^{2})$、$y(x_{-})=k_{i}$；$\chi(B(x))$ 是固定的连续系数，$\mu_{\delta}$ 局部 Lipschitz 且 $\mu_{\delta}(0)=0$，唯一性给 $y\equiv k_{i}$，与终端条件 $y(x_{+})=-k_{i}$ 冲突，见 build/sections/paths.tex:120--135。$\theta=0$ 时的端点映射是显式的：$\Phi(C,0)=2K-\varepsilon^{-1}CC^{\mathsf{T}}$，其零点恰为 $C=\mathrm{diag}(d_{1},\ldots,d_{n})$、$d_{i}=\pm\sqrt{2\varepsilon k_{i}}$，共 $2^{n}$ 个且构成 $\mathcal{G}$ 的一个轨道；每个都是正则零点，因为对下三角变分 $H$，导算子的对角元是 $-2\varepsilon^{-1}d_{i}H_{ii}$、下对角元是 $-\varepsilon^{-1}d_{j}H_{ij}$（$i>j$），在维数同为 $\tfrac{n(n+1)}{2}$ 的两个空间之间是同构，见 build/sections/paths.tex:137--155。我在这段里最在意的是"轨道只有一个"这句话：它正是后面商流形边界点数为奇的来源，也是为什么必须先证自由性，没有自由性，商就不是流形。

## §11 光滑化、等变扰动与边界奇偶

反设 $\Phi(C,1)$ 永不为零。紧性允许选一个有界不变开集 $O\subset\mathcal{L}$，包含每个零点的 $C$ 投影，且 $\overline{O}$ 落在"所有行都非零"的开集内；于是在 $(\partial O\times[0,1])\cup(\overline{O}\times\{1\})$ 上 $\lVert\Phi\rVert_{\mathrm{HS}}$ 有正的下界，见 build/sections/paths.tex:166--174。这一步给我的教训是：同调论证需要的不是一个好映射，是一个带间隙的映射族，间隙要能在后续所有逼近下存活。

接下来三次加工，每次都只为了保住那个间隙。第一次是重参数化：取光滑 $\rho:[0,1]\to[0,1]$，在 $0$ 附近恒为 $0$、$\rho(1)=1$，令 $F(C,\theta)=\Phi(C,\rho(\theta))$；这样 $F$ 在初始领口 $\{0\leq\theta\leq a\}$ 上等于显式的 $\Phi(C,0)=2K-\varepsilon^{-1}CC^{\mathsf{T}}$，见 build/sections/paths.tex:175--181。第二次是光滑化并保住等变性：把 $F$ 沿 $\theta$ 常值延拓出去，在有限维变量里用磨光核卷积，再用一个 $\theta$ 的光滑函数在初始领口里把它拼回 $\Phi(C,0)$，最后对群取平均 $\tfrac{1}{\lvert\mathcal{G}\rvert}\sum_{S\in\mathcal{G}}S\Psi_{0}(SC,\theta)S$ 得到等变的光滑映射 $\Psi$，一致逼近可以任意好，所以间隙仍在，见 build/sections/paths.tex:182--194。这里的取舍我很在意：素材特意说明"用光滑映射替换连续的端点映射，因此不需要解流对 $C$ 的可微性"，见同文件第 162--164 行，也就是把可微性从难证的地方（常微分方程的流）搬到容易造的地方（有限维映射的逼近），这是避开一大段依赖定理的正确姿势。

第三次是把零点变成正则零点。$\overline{O}$ 上作用的自由性恰好许可这一步：在任意 $C_{0}\in\overline{O}$ 附近取一个球，使它在不同符号矩阵平移下互不相交，取支撑在该球内、$b(C_{0})=1$ 的光滑突起 $b$；对 $H\in\mathrm{Sym}_{n}$ 令 $V_{H}(C)=\sum_{S\in\mathcal{G}}b(SC)SHS$，它光滑、等变，且 $V_{H}(C_{0})=H$。用 $\mathrm{Sym}_{n}$ 的一组基取 $H$ 就得 $\mathcal{G}$-等变映射 $V_{1},\ldots,V_{N}$，其值在 $\overline{O}$ 每点处张满 $\mathrm{Sym}_{n}$。素材在第 208--211 行补了一句关键的放宽：值空间上的作用无须自由，因为定义域里互不相交的支撑允许在每个轨道代表元处任意指定目标值。随后取光滑 $h:[0,1]\to[0,\infty)$，在 $0$ 附近为零、其后为正、零集含在领口内，令 $\Psi_{\alpha}(C,\theta)=\Psi(C,\theta)+h(\theta)\sum_{j=1}^{N}\alpha_{j}V_{j}(C)$，把 $\alpha$ 限制在原点的小开球里以保间隙，见 build/sections/paths.tex:213--221。

三元映射 $(C,\theta,\alpha)\mapsto\Psi_{\alpha}(C,\theta)$ 的内部零点处微分是满的：$h(\theta)>0$ 时参数方向张满目标，$h(\theta)=0$ 时对 $C$ 的导数是那个已算过的同构。对它在参数球上的投影用 Sard 定理，取正则值 $\alpha$，则 $(C,\theta)\mapsto\Psi_{\alpha}(C,\theta)$ 以 $0$ 为正则值；素材把逻辑写全了：把族微分写成 $(L_{1},L_{2})$，投影微分满意味着对每个 $w$ 有 $v$ 使 $L_{1}v+L_{2}w=0$，故 $\mathrm{ran}\,L_{2}\subset\mathrm{ran}\,L_{1}$，配合 $(L_{1},L_{2})$ 满即得 $L_{1}$ 满，见 build/sections/paths.tex:222--238。Sard 在这里只用来"任意接近零处存在好参数"，这一句我抄进自己的用法清单：奇偶性论证里扰动参数是买保险用的，真正的不可能性来自拓扑。

收口那段是纯拓扑。$\dim\mathcal{L}=\dim\mathrm{Sym}_{n}=\tfrac{n(n+1)}{2}$ 使正则零集是紧光滑一维带边流形；间隙保证 $(\partial O\times[0,1])\cup(\overline{O}\times\{1\})$ 上无零点，领口处映射与 $\theta$ 无关且对 $C$ 导数可逆，所以边界恰由那 $2^{n}$ 个初始零点组成。$\mathcal{G}$ 在流形上自由作用，商仍是紧一维带边流形：每点取与其余非平凡平移不相交的邻域，商就有同样的区间或半区间局部坐标。全部初始零点同轨道，商就恰有一个边界点，而任何紧一维流形都是有限个圆与闭区间的无交并，边界点数必为偶，矛盾，见 build/sections/paths.tex:240--259。素材把它定位为"正则值证奇偶不变性的常规做法，只是先商掉行符号"，并指向 Milnor 讲义第 2--4 节。我最初的设想在这里被彻底推翻：我原以为矩阵情形要多解一个映射度（degree）计算，实际用的是更廉价的奇偶论证，因为轨道唯一性把度自动降成了 $1$ 与 $2$ 的算术。

## §12 俘获：路径留在算子范数球内

拓扑给出的 $B$ 只在截断场下解方程，必须回头证明它没跑到截断区域外，否则 §9 的正性推论不适用。论证在 build/sections/paths.tex:261--285，只用方向不等式。任取实单位向量 $e$，记 $y(x)=e^{\mathsf{T}}B(x)e$；只要 $\lvert y(x)\rvert>\kappa$，方向不等式给 $e^{\mathsf{T}}M_{\delta}(B(x))e\leq\mu_{\delta}(e^{\mathsf{T}}K^{2}e-y(x)^{2})<0$，这里用的是 $\mu_{\delta}$ 严格增、$\mu_{\delta}(0)=0$ 以及 $e^{\mathsf{T}}K^{2}e\leq\kappa^{2}$。因为 $\chi\geq0$ 且 $(CU)(CU)^{\mathsf{T}}$ 半正定，方程立刻给出 $y'(x)\leq0$ 在该集合上成立。两个端点值都落在 $[-\kappa,\kappa]$：一段使 $y>\kappa$ 的连通区间不可能从电平 $\kappa$ 起步且 $y$ 不增，一段使 $y<-\kappa$ 的连通区间不可能在电平 $-\kappa$ 结束且 $y$ 不增；前一种越界被左端点排除，后一种被右端点排除。于是每个方向上 $\lvert e^{\mathsf{T}}B(x)e\rvert\leq\kappa$，由实对称矩阵的 $\lVert B(x)\rVert_{\mathrm{op}}=\sup_{\lvert e\rvert=1}\lvert e^{\mathsf{T}}B(x)e\rvert$ 得 $\lVert B(x)\rVert_{\mathrm{op}}\leq\kappa$ 处处成立，故 $\chi(B(x))=1$，带 $\theta$ 的方程退化为所需方程本身，而 $\lVert C_{\varepsilon}\rVert_{\mathrm{HS}}$ 的一致界由 $\lVert C\rVert_{\mathrm{HS}}^{2}\leq2\,\mathrm{tr}K+n\lvert\Omega\rvert\sup_{B}\lVert\widehat{M}_{\delta}(B)\rVert_{\mathrm{op}}$ 对固定 $\delta$ 直接给出。

我在这段看到一个值得记住的论证形状：要证一条曲线留在某个凸的、由二次型定义的区域里，只需在区域的入口超平面上证单侧微分不等式，然后靠两端点的位置排除两个方向的越界。素材没有明说，但这条"两端夹击"的写法与 §7 里"$t\downarrow0$ 与 $t\to\infty$ 两侧同时可积"的结构是同一习惯，标 [推测] 我认为这是同一作者的固定手法。

## §13 动作恒等式与惩罚极限

命题级的结论在 build/sections/action-framework.tex:22--28：对有界区间 $\Omega=(x_{-},x_{+})$、$n,d\geq1$、$U\in H^{1}_{0}(\Omega;\mathbb{R}^{n\times d})$ 满足 $\int_{\Omega}UU^{\mathsf{T}}dx=I_{n}$、$K=\mathrm{diag}(k_{1},\ldots,k_{n})$ 且各 $k_{i}>0$，动作 $\mathcal{E}(A)=\int_{\Omega}\bigl(\lVert A'\rVert_{\mathrm{HS}}^{2}+\mathrm{tr}(K^{2}AA^{\mathsf{T}})-\mathrm{tr}((AA^{\mathsf{T}})^{q})\bigr)dx$ 满足 $\sup_{C\in\mathcal{L}}\mathcal{E}(CU)\geq\sum_{i=1}^{n}\int_{-k_{i}}^{k_{i}}(k_{i}^{2}-s^{2})^{\sigma}ds$。$\mathcal{E}(A)$ 有限这点素材在第 18 行交代了理由：一维有界区间上的 $H^{1}$ 函数连续。

证明的第一步是把路径方程塞进全导数。固定 $\delta>0$ 与 $0<\varepsilon\leq1$，取 §10 给的 $C_{\varepsilon}$、$A_{\varepsilon}=C_{\varepsilon}U$、$B_{\varepsilon}$；$A\in H^{1}_{0}$、$B\in C^{1}$ 使 $x\mapsto J_{\delta}(B(x))+\mathrm{tr}(A(x)^{\mathsf{T}}B(x)A(x))$ 绝对连续，几乎处处有
$\bigl(J_{\delta}(B)+\mathrm{tr}(A^{\mathsf{T}}BA)\bigr)'=2\mathrm{tr}((A')^{\mathsf{T}}BA)-\mathrm{tr}\bigl((M_{\delta}(B)-AA^{\mathsf{T}})B'\bigr)=2\mathrm{tr}((A')^{\mathsf{T}}BA)-\varepsilon^{-1}\lVert M_{\delta}(B)-AA^{\mathsf{T}}\rVert_{\mathrm{HS}}^{2}\leq\lVert A'\rVert_{\mathrm{HS}}^{2}+\mathrm{tr}(B^{2}AA^{\mathsf{T}})-\varepsilon^{-1}\lVert M_{\delta}(B)-AA^{\mathsf{T}}\rVert_{\mathrm{HS}}^{2}$，
最后一步是 Hilbert--Schmidt 版本的 Cauchy--Schwarz 加 $2ab\leq a^{2}+b^{2}$，见 build/sections/action-limit.tex:20--36。$A$ 在两端消失，积分后整理得 $J_{\delta}(-K)-J_{\delta}(K)\leq\mathcal{E}(A)+\int_{\Omega}\bigl[\mathrm{tr}((AA^{\mathsf{T}})^{q})-\mathrm{tr}((K^{2}-B^{2})AA^{\mathsf{T}})-\varepsilon^{-1}\lVert M_{\delta}(B)-AA^{\mathsf{T}}\rVert_{\mathrm{HS}}^{2}\bigr]dx$，见同文件第 40--52 行。我核对了一处符号：$\mathrm{tr}(B^{2}AA^{\mathsf{T}})$ 与 $\mathrm{tr}((K^{2}-B^{2})AA^{\mathsf{T}})$ 合并正好回到动作里的 $+\mathrm{tr}(K^{2}AA^{\mathsf{T}})$，于是路径 $B$ 的全部作用就是把 $\mathrm{tr}(K^{2}AA^{\mathsf{T}})$ 与 $-\mathrm{tr}((K^{2}-B^{2})AA^{\mathsf{T}})$ 之间的差摊成惩罚。

第二步是令 $\varepsilon\downarrow0$ 的一致界。§12 的界与 $U$ 有界把所有对 $(A_{\varepsilon}(x),B_{\varepsilon}(x))$（$x\in\overline{\Omega}$、$0<\varepsilon\leq1$）关进同一个紧集 $\mathcal{K}_{\delta}\subset\mathbb{R}^{n\times d}\times\mathrm{Sym}_{n}$；在上面定义连续函数 $F(A,B)=\mathrm{tr}((AA^{\mathsf{T}})^{q})-\mathrm{tr}((K^{2}-B^{2})AA^{\mathsf{T}})$ 与 $r_{\delta}(A,B)=\lVert M_{\delta}(B)-AA^{\mathsf{T}}\rVert_{\mathrm{HS}}^{2}$。若 $r_{\delta}(A,B)=0$，则 $M_{\delta}(B)=AA^{\mathsf{T}}\geq0$，§9 给 $F(A,B)\leq E_{\delta}$。素材强调这是全证明里唯一用到场之正性的地方，而构造出的路径本身无须有这个性质，见 build/sections/action-limit.tex:69--72。紧性把这两条合成 $\limsup_{\varepsilon\downarrow0}\sup_{(A,B)\in\mathcal{K}_{\delta}}\bigl(F(A,B)-\varepsilon^{-1}r_{\delta}(A,B)\bigr)\leq E_{\delta}$，反证写法是给 $\eta>0$、$\varepsilon_{j}\downarrow0$、$(A_{j},B_{j})$ 使表达式超过 $E_{\delta}+\eta$；$F$ 有界逼出 $r_{\delta}(A_{j},B_{j})=O(\varepsilon_{j})$，取收敛子列得极限 $(A_{*},B_{*})$ 满足 $r_{\delta}(A_{*},B_{*})=0$ 且 $F(A_{*},B_{*})\geq E_{\delta}+\eta$，与比较矛盾，见同文件第 74--88 行。

第三步是两次取极限的顺序，我把它当作本节的重点。把上界代进动作不等式、用 $\sup_{C\in\mathcal{L}}\mathcal{E}(CU)$ 控制 $\mathcal{E}(A_{\varepsilon})$、令 $\varepsilon\downarrow0$，得 $J_{\delta}(-K)-J_{\delta}(K)\leq\sup_{C\in\mathcal{L}}\mathcal{E}(CU)+\lvert\Omega\rvert E_{\delta}$。素材在第 99--102 行专门说明：前面所有紧性估计都是在固定 $\delta$ 下做的，这就够了，因为右端的上确界与 $\delta$ 无关，剩下的极限只涉及显式端点值与误差项。端点差按 §8 等于 $\sum_{i}\int_{-k_{i}}^{k_{i}}\mu_{\delta}(k_{i}^{2}-s^{2})ds$，而 $z\geq0$ 时 $0\leq\mu_{\delta}(z)=(z+\delta)^{\sigma}-\delta^{\sigma}\leq z^{\sigma}$ 且 $\mu_{\delta}(z)\to z^{\sigma}$（$\delta\downarrow0$），控制收敛把左端送进 $\sum_{i}\int_{-k_{i}}^{k_{i}}(k_{i}^{2}-s^{2})^{\sigma}ds$，同时 $E_{\delta}\to0$，见同文件第 104--123 行。这里"$\varepsilon$ 先、$\delta$ 后"的顺序是硬约束：$\varepsilon$ 的极限要用到以 $\delta$ 为参数的紧集，而 $\delta$ 的极限只用到逐点公式，反过来做会失去一致性。

## §14 谱段的前半：形式域与负谱离散

主定理的谱论前置是 build/sections/spectral.tex:14--27 的引理：$m\geq1$、$p>1$、$W:\mathbb{R}\to\mathbb{C}^{m\times m}$ 可测 Hermite 半正定且 $\int_{\mathbb{R}}\mathrm{tr}(W^{p})<\infty$，则 $h_W$ 闭合有下界，乘子 $W^{1/2}$ 从 $H^{1}(\mathbb{R};\mathbb{C}^{m})$ 到 $L^{2}(\mathbb{R};\mathbb{C}^{m})$ 紧，相应自伴算子在零以下只有有限重数的孤立特征值、只可能在 $0$ 处聚集。证明第一链是把势能项压到 $H^{1}$ 范数上：记 $w(x)=\lVert W(x)\rVert_{\mathrm{op}}$，半正定给出 $w^{p}\leq\mathrm{tr}(W^{p})$，故 $w\in L^{p}(\mathbb{R})$；一维的 $\lVert\psi\rVert_{\infty}^{2}\leq2\lVert\psi\rVert_{2}\lVert\psi'\rVert_{2}$ 对向量值同样成立（对范数函数用标量情形），于是
$\int_{\mathbb{R}}\langle\psi,W\psi\rangle\leq\lVert w\rVert_{p}\lVert\psi\rVert_{2p/(p-1)}^{2}\leq2^{1/p}\lVert w\rVert_{p}\lVert\psi'\rVert_{2}^{1/p}\lVert\psi\rVert_{2}^{2-1/p}\leq\varepsilon\lVert\psi'\rVert_{2}^{2}+C_{\varepsilon}\lVert\psi\rVert_{2}^{2}$，
见同文件第 30--44 行。我做了一个齐次自检：中间项对 $\psi$ 的缩放次数是 $\tfrac1p+(2-\tfrac1p)=2$，与左端二次型一致，末步是 Young 不等式；这也解释了为什么 $\int\mathrm{tr}(W^{p})$ 里的 $p=\gamma+\tfrac12$ 与不等式右端是同一个 $p$，谱段与缩放段在这里对上。

紧性靠双向截断：$T_{R,L}\psi=\mathbf{1}_{\{\lvert x\rvert\leq R,\ w(x)\leq L\}}W^{1/2}\psi$，先限制到 $[-R,R]$、用 $H^{1}([-R,R];\mathbb{C}^{m})\hookrightarrow L^{2}([-R,R];\mathbb{C}^{m})$ 的紧嵌入再乘上有界函数，即得 $T_{R,L}$ 紧；若 $T\psi=W^{1/2}\psi$，则 $\|(T-T_{R,L})\psi\|_{2}^{2}\leq C\bigl\lVert w\mathbf{1}_{\{\lvert x\rvert>R\}\cup\{w>L\}}\bigr\rVert_{p}\lVert\psi\rVert_{H^{1}}^{2}$，系数随 $R,L\to\infty$ 趋于零，见同文件第 49--63 行。负谱部分用反证：若 $(-\infty,-a]$ 的谱子空间无穷维，取其中 $L^{2}$ 正交列 $(\psi_{j})$，半下方与谱定理给一致有界的移位形范数、从而一致有界的 $H^{1}$ 范数，弱收敛子列极限必为零（正交列在 $L^{2}$ 中弱趋零），紧性给 $\lVert T\psi_{j}\rVert_{2}\to0$，而 $-a\geq h_{W}[\psi_{j}]=\lVert\psi_{j}'\rVert_{2}^{2}-\lVert T\psi_{j}\rVert_{2}^{2}\geq-\lVert T\psi_{j}\rVert_{2}^{2}$，矛盾，见第 65--78 行。这段是我认为最像教科书的地方，但它存在的理由是主定理允许 $W$ 仅仅可测：没有这条引理，$\mathrm{Tr}(H_W)_-^\gamma$ 这个求和符号本身就无意义，而素材在 build/sections/introduction.tex:17--21 明确把"这些事实正好在势类假设下于 §14 所对应的谱节被证明"写进了引言，前后对应是硬性的。

## §15 谱段的后半：三角系数与痕迹 Young

主定理的证明按 build/sections/spectral.tex:83--89 先处理实对称势：若没有负特征值则不等式显然，否则固定任意有限的负特征值列表（按重数计），由于复共轭保持每个特征空间，可以取到实值的规范正交特征函数 $\phi_{1},\ldots,\phi_{n}$。动作定理要求函数支撑在有界区间上，于是用实的光滑紧支撑函数在 $H^{1}$ 里逼近这些 $\phi_{i}$：Gram 矩阵趋于 $I_{n}$，形矩阵靠势能项的连续性趋于所选特征值组成的对角矩阵（同文件第 91--94 行，并显式引用了 §14 那条带 $\varepsilon$ 的界）；再左乘 Gram 矩阵的逆平方根，把行规范正交化而共同紧支撑不变，形矩阵仍趋于同一对角阵，足够好的逼近下它们负定，用实正交的行变换对角化。

于是取 $U\in H^{1}_{0}(\Omega;\mathbb{R}^{n\times m})$ 行为 $u_{i}$，$\Omega$ 把支撑含在内部，行外延为零后满足 $\int_{\Omega}UU^{\mathsf{T}}=I_{n}$、$h_{W}[u_{i},u_{j}]=-k_{i}^{2}\delta_{ij}$、$k_{1}\geq\cdots\geq k_{n}>0$，其中 $-k_{i}^{2}$ 沿逼近趋于所选特征值（按递增序），记 $K=\mathrm{diag}(k_{1},\ldots,k_{n})$，见同文件第 101--112 行。这里我看到"降序排列"被真正用上的地方：任取实下三角 $C$，$A=CU$ 的第 $i$ 行是 $a_{i}=\sum_{j\leq i}C_{ij}u_{j}$，由行正交归一性 $\lVert a_{i}\rVert_{L^{2}}^{2}=\sum_{j\leq i}C_{ij}^{2}$，于是
$h_{W}[a_{i}]+k_{i}^{2}\lVert a_{i}\rVert_{L^{2}}^{2}=\sum_{j\leq i}C_{ij}^{2}(k_{i}^{2}-k_{j}^{2})\leq0$，
因为 $j\leq i$ 时 $k_{j}\geq k_{i}$，见同文件第 114--119 行。这一条不等式是整个"下三角"设计的唯一用处，也回答了我 §4 里的疑问：为何必须保留嵌套的试验子空间、放弃同时对角化，理由是嵌套性把谱界 $-k_{i}^{2}$ 逐层传递下去，逐点对角化拿不到这种逐层传递。把 $i$ 求和就控制了动作的二次项，再用 $AA^{\mathsf{T}}$ 与 $A^{\mathsf{T}}A$ 有相同非零特征值这条事实，得 $\mathcal{E}(CU)\leq\int_{\Omega}\{\mathrm{tr}(WA^{\mathsf{T}}A)-\mathrm{tr}((A^{\mathsf{T}}A)^{q})\}dx$，见同文件第 120--126 行。

右端需要一个逐点界，而且不能要求那两个矩阵交换。标量极大化给出 $y,z\geq0$ 时 $yz-z^{q}\leq D_{\sigma}y^{p}$，$D_{\sigma}=\tfrac{\sigma^{\sigma}}{(1+\sigma)^{1+\sigma}}$，见同文件第 129--133 行；把它抬到矩阵上，取任意半正定 $Z$ 的规范正交本征基 $(v_{j})$、特征值 $z_{j}$，令 $y_{j}=\langle v_{j},Wv_{j}\rangle$，对 $W$ 的谱测度用 $t\mapsto t^{p}$ 的凸性得 $y_{j}^{p}\leq\langle v_{j},W^{p}v_{j}\rangle$，于是
$\mathrm{tr}(WZ)-\mathrm{tr}(Z^{q})=\sum_{j}(y_{j}z_{j}-z_{j}^{q})\leq D_{\sigma}\sum_{j}y_{j}^{p}\leq D_{\sigma}\mathrm{tr}(W^{p})$，
见同文件第 134--144 行。凸性那一步把"基向量与 $W$ 不共谱"这件事消化成一次 Jensen，我把它记作本稿第二个纯矩阵小引理（第一个是 §7 那条 Hilbert--Schmidt 泛函演算界）。取 $Z=A^{\mathsf{T}}A$ 就得到 $\sup_{C\ \text{下三角}}\mathcal{E}(CU)\leq D_{\sigma}\int_{\mathbb{R}}\mathrm{tr}(W^{p})dx$，且每个 $C$ 的各項有限，因为 $A$ 的行有界、支撑在 $\overline{\Omega}$ 内而 $W$ 局部可积，见第 145--151 行。

## §16 常数的拼装与贝塔函数

反向界由 §13 的动作不等式供应，两边一夹就是主定理。素材的拼装全在 build/sections/spectral.tex:153--178：代 $s=k_{i}t$ 得 $\int_{-k_{i}}^{k_{i}}(k_{i}^{2}-s^{2})^{\sigma}ds=k_{i}^{2\sigma+1}\mathrm{B}(\tfrac12,1+\sigma)=k_{i}^{2\gamma}\mathrm{B}(\tfrac12,1+\sigma)$，注意 $2\sigma+1=2\gamma$ 这条指数换算正是 $\gamma=\sigma+\tfrac12$ 的定义在起作用；于是 $\sum_{i=1}^{n}k_{i}^{2\gamma}\leq\tfrac{D_{\sigma}}{\mathrm{B}(\tfrac12,1+\sigma)}\int_{\mathbb{R}}\mathrm{tr}(W^{p})dx$。系数恒等式我逐字复核过：$\tfrac{D_{\sigma}}{\mathrm{B}(\tfrac12,1+\sigma)}=\tfrac{\sigma^{\sigma}}{(1+\sigma)^{1+\sigma}}\cdot\tfrac{\Gamma(\sigma+3/2)}{\sqrt{\pi}\Gamma(\sigma+1)}=(\tfrac{\sigma}{1+\sigma})^{\sigma}\tfrac{\Gamma(\sigma+3/2)}{\sqrt{\pi}\Gamma(\sigma+2)}=C_{\gamma}$，用 $\Gamma(\sigma+2)=(1+\sigma)\Gamma(\sigma+1)$ 吸收掉 $(1+\sigma)^{1+\sigma}$ 里的一个 $(1+\sigma)$，而 $\mathrm{B}(\tfrac12,1+\sigma)=\tfrac{\Gamma(1/2)\Gamma(1+\sigma)}{\Gamma(\sigma+3/2)}=\tfrac{\sqrt{\pi}\Gamma(\sigma+1)}{\Gamma(\sigma+3/2)}$，见同文件第 166--174 行。

我按三个具体点自算了这条系数，三条都对上了，这是我在 §2 之后第一次真正接受"常数没有变大"。取 $\gamma=1$（即 $\sigma=\tfrac12$）：$(\tfrac{1/2}{3/2})^{1/2}=1/\sqrt{3}$，$\tfrac{\Gamma(2)}{\sqrt{\pi}\Gamma(5/2)}=\tfrac{1}{\sqrt{\pi}\cdot(3\sqrt{\pi}/4)}=\tfrac{4}{3\pi}$，乘积 $\tfrac{4}{3\sqrt{3}\pi}$，与 build/sections/history.tex:34--36 引用的 Read--Schulz 值逐字相同。取 $\gamma\to\tfrac12^{+}$（$\sigma\to0$）：$(\tfrac{\sigma}{1+\sigma})^{\sigma}\to1$，$\tfrac{\Gamma(3/2)}{\sqrt{\pi}\Gamma(2)}=\tfrac{\sqrt{\pi}/2}{\sqrt{\pi}}=\tfrac12$，得 Hundertmark--Lieb--Thomas 的 $\tfrac12$，见 build/sections/history.tex:14--16。取 $\gamma\to\tfrac32^{-}$（$\sigma\to1$）：$(\tfrac12)^{1}=\tfrac12$，$\tfrac{\Gamma(5/2)}{\sqrt{\pi}\Gamma(3)}=\tfrac{3\sqrt{\pi}/4}{2\sqrt{\pi}}=\tfrac38$，乘积 $\tfrac{3}{16}$，与我用相空间计数独立算出的一维 $\gamma=\tfrac32$ 半经典常数 $\tfrac{\Gamma(\gamma+1)}{2\sqrt{\pi}\Gamma(\gamma+5/2)}=\tfrac{3}{16}$ 一致，也和 build/sections/history.tex:18--24 关于 Laptev--Weidl 提升维度得到半经典常数的叙述吻合。三个点两个端线都对齐，说明这条闭式在中段没有多余自由度可让矩阵情形去偷。

主定理剩下的收尾只有一句：逼近收敛后对选定的有限列表证明了界，而全体负特征值矩之和是这些有限和的上确界，故同一界对 $\mathrm{Tr}(H_W)_{-}^{\gamma}$ 成立，并且这个迹有限，见 build/sections/spectral.tex:175--178。我把"先任意有限列表、再取上确界"的顺序单独记下来，因为它同时解决两件事：避免预先假设 $\sum_{j}\lvert\lambda_{j}\rvert^{\gamma}$ 收敛，以及允许重数有限但个数无穷时按有限截断处理。

## §17 实化：把复 Hermite 情形搬到两倍维的实情形

复情形的处理在 build/sections/spectral.tex:180--200，是全套论证里最简短的一段，但逻辑位置很关键，因为 §13 与 §15 都是在实对称的语言里做的：场定义在 $\mathrm{Sym}_{n}$ 上、路径方程里的 $U$ 与 $C$ 都是实的。写法是：设 $W=E+\mathrm{i}F$，$E,F$ 为实矩阵，Hermite 性即 $E^{\mathsf{T}}=E$、$F^{\mathsf{T}}=-F$，于是
$\widetilde{W}=\begin{pmatrix}E&-F\\ F&E\end{pmatrix}$
是实对称的；常值酉矩阵 $\mathcal{U}=\tfrac{1}{\sqrt{2}}\begin{pmatrix}I&\mathrm{i}I\\ I&-\mathrm{i}I\end{pmatrix}$ 满足 $\mathcal{U}\widetilde{W}\mathcal{U}^{*}=W\oplus\overline{W}$，从而 $\widetilde{W}\geq0$ 且 $\mathrm{tr}(\widetilde{W}^{p})=2\,\mathrm{tr}(W^{p})$；又 $\mathcal{U}$ 与求导交换，同一换坐标给出 $H_{\widetilde{W}}\simeq H_W\oplus H_{\overline{W}}$；复共轭在两个和之间建立交织并保持重数，所以 $\widetilde{W}$ 的谱矩恰为 $W$ 的两倍；把实不等式用在 $2m$ 阶势上再两端除以二即得 Hermite 情形。

我把这一段的每一步都按"是否真的需要"检查了一遍。需要 $\widetilde{W}\geq0$：否则实情形的势类假设不成立，而 $\widetilde{W}\geq0$ 恰好由 $W\geq0$ 经酉相似传递。需要实情形对每个有限阶数都成立：这里阶数从 $m$ 变成 $2m$，若实情形只在某几个 $n$ 上被证，这一步就断；回看 §13 的动作不等式，$n,d$ 是任意的，$m$ 无关性由 §8 那四条不依赖 $n$ 的性质保证，链条闭合。需要除以二：谱矩与代价同时翻倍，所以常数是同一个 $C_{\gamma}$，等号情形也不受影响，因为等号势本来就只有一个对角通道非零、自己就是实的。这段读完后我对"为什么作者宁可在实数上做事"有了答案：黎卡提边界矩阵、$L$ 与 $Z$ 的分解、路径的符号等变性都依赖实对称空间上的谱演算与内积 $\mathrm{tr}(BH)$，见 build/sections/introduction.tex:105--106 关于 $\mathrm{Sym}_{n}$ 上内积与复内积第二变量线性的约定；用一次实化换掉一整层复结构的技术负担，是本稿我认为性价比最高的取舍。

## §18 极值势与因子化：等号在哪一点成立

锐利性在 build/sections/spectral.tex:202--233。取 $r=1/\sigma>1$ 与标量势和函数 $V(x)=(r+1)\mathrm{sech}^{2}(rx)$、$\psi(x)=\mathrm{sech}^{1/r}(rx)$。由 $\psi'/\psi=-\tanh(rx)$ 得 $H_{V}\psi=-\psi$ 且 $\psi\in L^{2}(\mathbb{R})$。整个负谱用标准因子化确定，素材把方法出处指到 Benguria--Loss 那篇的第二、三节，见同文件第 209--211 行：令 $Q=\partial_x+\tanh(rx)$ 作用在 $H^{1}(\mathbb{R})$ 上，直接相乘得 $H_{V}=Q^{*}Q-1$ 与 $QQ^{*}-1=-\partial_x^{2}+(r-1)\mathrm{sech}^{2}(rx)\geq0$。于是 $H_{V}\geq-1$，$-1$ 的特征空间就是 $\ker Q$，由 $\psi$ 张成。若 $\lambda\in(-1,0)$ 是特征值、$u$ 为特征函数，则 $Qu\neq0$；有界势给 $u\in H^{2}$，从而 $Qu\in L^{2}$；交织恒等式 $(QQ^{*}-1)Qu=\lambda Qu$ 在分布意义下成立；伙伴势有界又给 $Qu\in H^{2}$，于是该恒等式与伙伴算子的非负性冲突。故 $-1$ 是唯一负特征值且单重。最后 $\int_{\mathbb{R}}V^{p}dx=\tfrac{(r+1)^{p}}{r}\mathrm{B}(\tfrac12,p)=\tfrac{\mathrm{B}(\tfrac12,1+\sigma)}{D_{\sigma}}=C_{\gamma}^{-1}$，见第 224--230 行。

我验算了等号两侧的数值：左端 $\mathrm{Tr}(H_{V})_{-}^{\gamma}=1^{\gamma}=1$，右端 $C_{\gamma}\int_{\mathbb{R}}V^{p}dx=C_{\gamma}C_{\gamma}^{-1}=1$，两端恰等，这条势确实把不等式打到等号。素材接着说，把 $V$ 塞进一个对角通道、其余通道置零，就在每个矩阵阶数上取到等号，见第 231--233 行。这里有个我认为值得咀嚼的结构：等号势的秩是 $1$，它要对抗的"多通道耦合"直觉恰恰涉及秩大于 $1$ 的势，于是定理内容可以浓缩成一句，任何把势的预算拆给多个通道的做法都在浪费代价。素材没有量化这种浪费，也没给次优常数，我标 [推测]：等号类除平移、缩放（这里的缩放已被规范成特征值恰为 $-1$）与"选哪个对角通道"之外应当没有别的成员，但证明里没有任何唯一性论证，因子化只处理了显式构造出来的那一个势。

顺带钉住 $r$ 与 $\gamma$ 的关系：$r=1/\sigma=(\gamma-\tfrac12)^{-1}$，与 build/sections/introduction.tex:39--41 的写法一致；$\gamma\to\tfrac12^{+}$ 时 $r\to\infty$，势变窄变高，$\gamma\to\tfrac32^{-}$ 时 $r\to1^{+}$，主系数 $(r+1)\to2$ 而伙伴势的耦合 $(r-1)\to0$，恰好退到自由情形，这条极限行为我在 §19 与半经典常数对照着看。

## §19 与已有锐利结果的接缝

历史节把我关心的接缝写得极清楚，我按"谁的常数、谁的势类、谁的指数"三栏整理。起点是 Lieb--Thirring 两篇关于费米子动能与物质稳定性的工作，以及 Keller 1961 的单态变分问题，见 build/sections/history.tex:1--5；一维情形在 $1/2<\gamma<3/2$ 内单态最优常数超出半经典常数，而"把所有负特征值加起来会不会改变那个单态常数"就是标量猜想，本稿的标量同伴稿证明确实不变，见同文件第 5--9 行。两个端点的矩阵版本早已被解决：下端 $\gamma=\tfrac12$ 的锐利常数是 $\tfrac12$（Hundertmark--Lieb--Thomas），算子值形式由 Hundertmark--Laptev--Weidl 补，见第 13--17 行；上端 $\gamma=\tfrac32$ 由 Laptev--Weidl 用痕迹恒等式给出锐利矩阵估计并推广到算子值势，见第 18--20 行；Benguria--Loss 用黎卡提分解与交换给出了上端的另一个证明，见第 25--26 行，本稿 §6 的边界矩阵做法与他们那条路线同源但目标更高，见 build/sections/trace.tex:80--83 的交代。开区间里此前最好的是算子值上界带两倍半经典常数（Hundertmark--Laptev--Weidl），见 build/sections/history.tex:28--30；Dolbeault--Laptev--Loss 在指数 $1$ 处发展了规范正交向量值函数方法，见第 31--33 行；Read--Schulz 在 2026 年 9 月拿下 $\gamma=1$ 的锐利值 $4/(3\sqrt{3}\pi)$ 且含算子值势，见第 34--36 行。

于是本稿的净增量精确到"去掉一个点"：$1/2<\gamma<3/2$ 且 $\gamma\neq1$，同时势类是可测的、无须任何正则性，见 build/sections/history.tex:37--38。我把这条自述当作写作纪律的范例：能与别人结果重合的地方就直说重合，把自己新增的那一部分压到最小可辩护的陈述。方法层面的交代同样直白，见同一文件第 40--45 行：整套动作与延拓框架取自标量同伴稿的定理、命题与第 6 节，而同伴稿的比较只在逐点密度秩至多一时成立，本稿的新解析步骤就是把这条秩限制拿掉，让动作方法能作用于向量值波函数。

## §20 错误路线复盘：三条没能走通的路

第一条已写在 §4，逐点对角化。这里补记它失败的最小说明：协变导数 $\nabla=\partial_x-\mathrm{i}B$ 在 §6 的写法里就是"转动基"的代价，见 build/sections/trace.tex:84，把 $B$ 设为零才能退回普通导数；因此任何丢联络的证法都只能在交换情形有效，注记 build/sections/trace.tex:393--401 正说明交换情形毫无损失、也毫无新意。

第二条我最初以为必须做：在商空间 $\mathcal{L}/\mathcal{G}$ 上直接算映射的度。它失败的原因很具体：商掉符号之后空间有奇点，除非先证自由性，而自由性要靠坐标恒等式与一条标量常微分方程的唯一性（§10 末尾那段，见 build/sections/paths.tex:120--135）。素材的选法是先做紧性与自由性两件事，再靠一维紧流形边界点数为偶这条初等事实收口，见 build/sections/paths.tex:240--259，把度的计算省成奇偶计数。我从中提炼的教训是：当对称群是 $2^{n}$ 阶的有限群时，奇偶论证通常比度论证廉价得多，代价是要造出带等变的扰动，而这一步靠定义域里互不相交的支撑即可完成，见 build/sections/paths.tex:196--211。

第三条更隐蔽，是"处处要正"的强迫症。我一开始假定必须证明沿整条路径 $M_{\delta}(B_{\varepsilon}(x))\geq0$，否则 §9 的比较不能用。素材明确否证了这个假定：$F(A,B)\leq E_{\delta}$ 只在 $r_{\delta}(A,B)=0$ 处被需要，构造出来的路径本身无须有正性，见 build/sections/action-limit.tex:69--72；而正性一旦成立又立刻反推出 $Q_s(B)\geq0$ 与 $M$ 的算子范数界，见 build/sections/field.tex:271--294。也就是说惩罚机制的作用是把"需要估计的地点"自动吸附到"性质成立的地点"，这两处从不重合到重合，是 §5 那次转折的具体实现。还有半条路值得记：想要不用正则化（$\delta=0$）直接造场，会撞到 $f_0'(y)=a_\sigma y^{\beta-1}$ 在 $y=0$ 的无界，从而在 $\mathrm{Sym}_{n}$ 上失去局部 Lipschitz，素材用 $f_\delta$ 与切线延拓同时解决这两件事，见 build/sections/field.tex:27--44。

## §21 缝隙与 [推测] 清单

以下每一条我都说明"素材给了什么、缺什么"。其一，等号的唯一性：素材给出达到等号的秩一对角势，见 build/sections/spectral.tex:231--233，没有任何"只有这类势达到等号"的陈述，我按标量情形类比猜等号类由平移、缩放归一与通道选择组成，标 [推测]，理由是证明里的因子化只处理显式构造。其二，$m=\infty$（算子值势）：本稿通篇写 $\mathbb{C}^{m\times m}$ 且 §15 与 §16 的推理只用有限求和与逐点迹，历史节第 16--20 行说明两个端点都有算子值版本，我推测 §14 的紧性论证需要另做一致估计，标 [推测]，缺口在无穷维迹类与 $\mathrm{tr}$ 的可定义性。其三，$\gamma$ 落在 $[3/2,\infty)$ 与 $(0,1/2]$：素材在第 21--24 行把更大指数归给 Aizenman--Lieb 参数积分与提升维度，本稿范围之外，没有可移植的记号。其四，区间外的 $\sigma$：§7 与 §8 的所有收敛条件都写 "$-\tfrac12<\beta<\tfrac12$"，见 build/sections/field.tex:41 与 build/sections/trace.tex:16--17，我推测越界时整套权重技巧失效，但没有反例。其五，同伴稿的秩一至多命题我无从核对，只能转述 build/sections/history.tex:42--44 的说法，这是本笔记信息完整度的上限。其六，插图 build/figures/half-line-gluing.pdf 只读了 tex 图注（build/sections/trace.tex:177--188），图内可能有的额外符号约定我一律不引用。其七，全稿没有 Lean 痕迹，派单也未给 Lean 行，故本单不做形式化取证，凡"形式化状态"的判断都不写。其八，$E_{\delta}=n(\delta\kappa^{2\sigma}+\delta^{\sigma}(\kappa^{2}+\delta))$ 的阶是否最优，素材没有讨论，我标 [推测]：它由两次减法（$\delta\,\mathrm{tr}M$ 与 $\delta^{\sigma}\mathrm{tr}V$）直接得到，形状是硬的，但改进空间我没查。

## §22 口径复核与自检

本节只写实测，不写自评为零的断言。取证调用 13 次，均在 build/ 目录下的 .tex 内；未跑 pdftotext、未读任何 PDF、未执行 git 命令。探针在正式落盘之前完成：临时文件基线 20 字节，Edit 追加一行后复量 51 字节，判定写入通道可用，随后该临时文件已删除，未留在 研究笔记/ 与仓库根。首次落盘（Write 建本稿）发生在第 17 次调用，落在常规窗口 16 至 30 之内。此后每一节都用 Edit 追加，锚点逐字取自当时文件最末一段，已落盘内容一字未改。

## §23 勘误申报（按类别登记，不复写字形）

连接词反转族：6 处，分布在 §2（1）、§4（2）、§5（2）、§11（1），其中 §2、§4、§11 三处属配对形、§4 一处属"而"接否定词形、§5 两处分别属独立转折形与带否定词的复合形。过渡短语族：1 处，在 §4。长停顿号族：2 处，同在 §10 末行。装饰横线整行：0 处。连续两个逗号：0 处。纯英文术语残留：1 处，在 §1，属一个排版环境的英文名，另有若干人名与文件名按规格保留拉丁写法。异体字：1 处，在 §15，"各项"误作繁体字形。自定义宏泄漏：0 处，素材导言区那批单字母缩写宏一律展开转述。排版命令拼写瑕疵：2 处，均在 §7，一处在下标里把希腊字母命令的反斜杠漏掉、一处在右括号命令末尾多写了一个字母；两者不影响数学定界符成对，只影响渲染。首块体量缺口：Write 落盘时实测 23,118 字节，七节（§0 至 §6）齐全、硬下限 20,000 已过，但低于建议的 28,000 至 31,500 区间，每节约 3,300 字节、低于 4,000 至 4,500 的建议值；按规格此为永久缺口，不做整档重写来补，只在后节把体量做足，全文总量在 §24 之后达标。

## §24 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\gamma$ | $1/2<\gamma<3/2$ | build/sections/introduction.tex:5 | 主定理与 $C_\gamma$ 闭式的定义域 | 取到端点即与已证情形重叠、中段失去自由度 |
| $m$ | 任意有限正整数 | build/sections/introduction.tex:29 | 势的阶数与等号的对角嵌入 | 若要 $m=\infty$ 需先补 §9 里 $n$ 的一致界 |
| $p$ | $1+\sigma=\gamma+\tfrac12$ | build/sections/introduction.tex:5 | 代价 $\int_{\mathbb{R}}\mathrm{tr}(W^{p})dx$ | 改指数即破坏缩放齐次、两端不再同阶 |
| $q$ | $1+\sigma^{-1}$ | build/sections/introduction.tex:99 | 动作里的 $-\mathrm{tr}((AA^{\mathsf{T}})^{q})$ | $p$ 与 $q$ 不共轭则 §15 的 Young 界失锐利 |
| $\sigma$ | $\gamma-\tfrac12\in(0,1)$ | build/sections/introduction.tex:98 | $D_\sigma$、$\mu_\delta$、$E_\delta$ 的公共参数 | $\sigma\ge1$ 使 $(a+b)^{\sigma}\le a^{\sigma}+b^{\sigma}$ 失效 |
| $\beta$ | $\sigma-\tfrac12\in(-\tfrac12,\tfrac12)$ | build/sections/introduction.tex:100 | 权 $t^{\beta}dt$ 的收敛域 | 越界则 §6 两端反常积分同时发散 |
| $C_\gamma$ | $(\tfrac{\gamma-1/2}{\gamma+1/2})^{\gamma-1/2}\tfrac{\Gamma(\gamma+1)}{\sqrt{\pi}\Gamma(\gamma+3/2)}$ | build/sections/introduction.tex:34--36 | 主定理上界与 §18 的锐利性 | 任一处改动则 §16 的三点验算全对不上 |
| $c_\sigma$ | $\bigl[\int_{0}^{\infty}t^{\beta}(t^{-1/2}-(t+1)^{-1/2})dt\bigr]^{-1}$ | build/sections/trace.tex:11--13 | $N$、$f_\delta$、$\mu_\delta$ 共用同一归一化 | 归一化偏差使 $\mathrm{tr}(NV)\ge\mathrm{tr}(N^{q})$ 常数走形 |
| $y^{\sigma}$ | 缩放恒等式右端 | build/sections/trace.tex:20--22 | 断言 $N=M+\delta^{\sigma}I$ | 该式失则 §9 的第五环断裂 |
| $b$ | $X_s=Y_s+V\ge bI$ | build/sections/trace.tex:28--30 | $R(t)>0$ 与 $F$、$G$ 的非负性 | 丢一致下界则 §14 的势类假设无从套用 |
| $O(t^{-1/2})$ | $t\downarrow0$ 处 $\lVert P(t)\rVert$ 的阶 | build/sections/trace.tex:69--71 | $N$ 的绝对收敛 | 阶变坏则要求 $\beta>-\tfrac12$ 更严 |
| $O(t^{-3/2})$ | $t\to\infty$ 处 $\lVert P(t)\rVert$ 的阶 | build/sections/trace.tex:71--73 | 同一收敛性在无穷一端 | 与 $\beta<\tfrac12$ 配套使用、缺一即散 |
| $S,T$ | 两条半轴的 Hermite 边界映射 | build/sections/trace.tex:93--97 | 全部黎卡提恒等式 | 解的唯一性失则 $S$ 与 $T$ 不定义 |
| $R(t)^{-1}$ | 等于 $(S+T)/2$ | build/sections/trace.tex:101 | $L>0$ 的唯一来源 | 反演因子 $\tfrac12$ 错则 $L$ 与 $R$ 脱钩 |
| $\mathrm{i}[B,S]$ | 黎卡提恒等式的非交换余项 | build/sections/trace.tex:100 | $V+tI=S^{2}+\mathrm{i}[B,S]$ | 该项归零就退回标量情形 |
| $\mathrm{Im}\,z>0$ | $B+\mathrm{i}S$ 特征值的虚部 | build/sections/trace.tex:103 | 行列式因子化与 $\sum_{j}v_{j}=\mathrm{tr}L$ | 虚部非正则 $\log\det$ 比值的积分不成 |
| $\mathrm{tr}Z=0$ | 由 $2L_{jj}Z_{jj}=0$ 求得 | build/sections/trace.tex:200--201 | $F(t)$ 的显式取值 | 残留迹会污染 $\mathrm{tr}V/\sqrt{t}$ 那一项 |
| $\mathrm{tr}(RZ^{2})$ | 非负误差项 | build/sections/trace.tex:209--211 | 亏量公式的第一加数 | 号一反整条比较失去方向 |
| $F(t)$ | $\mathrm{tr}V/\sqrt{t}-2\mathrm{tr}(L-\sqrt{t}I)\ge0$ | build/sections/trace.tex:268--282 | 加权平衡与端点边界项 | 非负失则 $t^{\beta+1}F(t)$ 的极限不为零 |
| $G(t)$ | $\mathrm{tr}(L-2\sqrt{t}I+tR(t))\ge0$ | build/sections/trace.tex:274--277 | 对偶式里的加权积分 | 逐特征值平方形式坏则 §6 收口失败 |
| $\mathcal{D}_{D}(t)$ | $\lVert R^{-1/2}-R^{1/2}(tI+D)^{1/2}\rVert_{\mathrm{HS}}^{2}$ | build/sections/trace.tex:353--357 | 亏量公式的第二加数 | 无交换假设的展开一旦写错正性不明 |
| $E_\delta$ | $n(\delta\kappa^{2\sigma}+\delta^{\sigma}(\kappa^{2}+\delta))$ | build/sections/field.tex:265--266 | §13 的 $\limsup$ 与 $\delta\downarrow0$ | 不随 $\delta$ 归零则动作下界带残余项 |
| $a_\sigma$ | $\tfrac{c_\sigma}{\pi}\int_{0}^{\infty}u^{\beta}(1+u)^{-2}du>0$ | build/sections/field.tex:37--39 | $f_\delta'$ 的显式表达式 | 其收敛条件正是 $-\tfrac12<\beta<\tfrac12$ |
| $2\beta-2$ | 等于 $2\sigma-3<-1$ | build/sections/field.tex:103--112 | 余项 $T_s(B)$ 在无穷远的可积性 | 若不小于 $-1$ 则 $M_\delta(B)$ 的极限不存在 |
| $\mu_\delta(z)$ | $(z+\delta)^{\sigma}-\delta^{\sigma}$（$z\ge0$） | build/sections/field.tex:158--163 | 端点差与方向不等式 | 失去 $\delta\downarrow0$ 趋 $z^{\sigma}$ 则下界缩水 |
| $\kappa$ | $\max_{i}k_{i}$ | build/sections/field.tex:4 | 紧集 $\lVert B\rVert_{\mathrm{op}}\le\kappa$ 与 $0\le M\le\kappa^{2\sigma}I$ | 界失则 §12 的俘获论证失效 |
| $\chi$ | 符号共轭不变的截断函数 | build/sections/paths.tex:57--60 | 使 $\widehat{M}_\delta$ 有界且全局 Lipschitz | 不等变则等变光滑化造不出来 |
| $n\lvert\Omega\rvert$ | $\lVert C\rVert_{\mathrm{HS}}^{2}$ 上界里的因子 | build/sections/paths.tex:110--114 | 联合零集的紧性 | 无上界则同调论证失去紧性 |
| $2^{n}$ | $\theta=0$ 时初始零点个数 | build/sections/paths.tex:143--149 | 商零集的边界点数 | 若分成多条轨道则奇偶矛盾消失 |
| $\tfrac{n(n+1)}{2}$ | $\dim\mathcal{L}=\dim\mathrm{Sym}_{n}$ | build/sections/paths.tex:151--155 | 正则零点与一维零集的维数 | 两维数不等则零集维数不为 $1$ |
| $\varepsilon^{-1}$ | 惩罚系数、趋于无穷 | build/sections/action-limit.tex:31--35 | 把残差 $r_\delta$ 压向零 | 去掉惩罚则约束 $M_\delta(B)=AA^{\mathsf{T}}$ 无从强制 |
| $\mathcal{E}(A)$ | $\int_{\Omega}(\lVert A'\rVert_{\mathrm{HS}}^{2}+\mathrm{tr}(K^{2}AA^{\mathsf{T}})-\mathrm{tr}((AA^{\mathsf{T}})^{q}))dx$ | build/sections/action-framework.tex:14--17 | §13 两侧夹逼的中间量 | 三项任一改号则上下界断开 |
| $\mathrm{B}(\tfrac12,1+\sigma)$ | 端点积分的因子 | build/sections/action-framework.tex:36--38 | 谱指数关系 $2\sigma+1=2\gamma$ | 因子错则 §16 的 $C_\gamma$ 拼装错位 |
| $D_\sigma$ | $\sigma^{\sigma}(1+\sigma)^{-1-\sigma}$ | build/sections/spectral.tex:131--132 | 痕迹 Young 与上界系数 | 极大点偏移即失去锐利常数 |
| $2\,\mathrm{tr}(W^{p})$ | 实化后的代价 | build/sections/spectral.tex:192--193 | §17 里除以二那一步 | 系数错则复情形常数整整翻倍 |
| $C_\gamma^{-1}$ | $\int_{\mathbb{R}}V^{p}dx$ 的值 | build/sections/spectral.tex:226--229 | §18 的锐利性验证 | 不等于 $C_\gamma^{-1}$ 则 $C_\gamma$ 并非最优 |
| $r$ | $1/\sigma$ | build/sections/spectral.tex:202--204 | 极值势 $(r+1)\mathrm{sech}^{2}(rx)$ | $r$ 错则 $H_{V}\psi=-\psi$ 不再成立 |
| $4/(3\sqrt{3}\pi)$ | $\gamma=1$ 的已知锐利常数 | build/sections/history.tex:34--36 | §16 的第三点验算 | 与闭式不符说明整条系数错 |
| $3/16$ | $\gamma\to\tfrac32^{-}$ 的极限 | build/sections/introduction.tex:34--36 | 与半经典常数的对照 | 不符则与 Laptev--Weidl 端点脱节 |
| $1/2$ | $\gamma\to\tfrac12^{+}$ 的极限 | build/sections/history.tex:14--16 | 与 Hundertmark--Lieb--Thomas 对照 | 不符则下端失去连续对接 |
| $11$ | build 下 .tex 文件数 | build/main.tex:18--25 | §1 的取证清单 | 计数不符说明有文件未读或版式漏探 |

## §25 勘误补记与收工登记

§23 之后又发现两类落笔问题，按同一纪律在文末追加登记，不回改任何已落盘内容。其一，过渡短语族在 §20 还有一处，与该节 §4 的那一处同类，合并计数为 2 处，此前登记为 1 处，属漏报。其二，纯英文术语残留在 §8 还有一处，是一个线性代数记号名词在正文里用了拉丁原文（同节其余处已写作"本征向量"），与此前登记的排版环境名合并计数为 2 处。其余类别复量结果与 §23 一致：连接词反转族 6 处，长停顿号族 2 处，装饰横线整行 0 处，连续两个逗号 0 处，自定义宏泄漏 0 处，异体字 1 处，排版命令拼写瑕疵 2 处。

结构侧的实测数字留在这里供对账，全部由本会话的机械检查得出。全文小节 25 个，编号从 §0 连续到 §24（本补记为第 26 个小节位置之外的追加节，编号 25，仍与前一节连续）。台账表头与分隔行各只出现 1 次，数据行 41 行，每行恰好 6 枚竖线，无空格子、无占位符；单元格里的范数一律写成 $\lVert\cdot\rVert_{\mathrm{HS}}$ 与 $\lVert\cdot\rVert_{\mathrm{op}}$、绝对值一律写成 $\lvert x\rvert$，因此没有裸竖线。数学定界符逐行成对，奇数行数为 0，逐行计数全部为偶；正文里凡提到该字符都写作"数学定界符"四个字。换行符全篇为单一形式，行尾无回车。前向引用涉及的编号都在 §0 至 §24 之间真实存在，例如 §6 末提到 §13、§18 末提到 §19、§15 提到 §14 与 §16，均落到真正讨论它的节。

写这份笔记的过程里，我自己的最大收获与素材的结论是同一句话：额外自由度只在你能把它写成一条独立矩阵命题时才不是负担。$\mathrm{tr}(NV)\geq\mathrm{tr}(N^{q})$ 这条式子的价值在于它把 $\mathrm{tr}(R(t)Z(t)^{2})$ 与 $q\,\mathcal{D}_{N^{1/\sigma}}(t)$ 这两块非负项显式摆出来，于是"矩阵带来的损失"是可测量的，亏量公式见 build/sections/trace.tex:383--388；等号何时成立也顺带可读，交换时两项同时为零，见 build/sections/trace.tex:393--401。我最初的猜想（常数为 $m$ 严格增）之所以错，是因为它默认了"更多自由度只能提高上确界"，而这里上确界由下三角的嵌套试验空间给出，见 build/sections/spectral.tex:114--119，嵌套把多通道的耦合折成了同一族单调的 $k_{1}\geq\cdots\geq k_{n}$，代价函数 $\int_{\mathbb{R}}\mathrm{tr}(W^{p})dx$ 又对逐点酉变换不变，两头都不给额外空间。这条观察对本单而言是结论，对我下一篇要写的东西而言是工具。

## §26 一处表述缺陷的更正

§25 第二段开头那句话把节数与编号写在同一句里，读起来自相矛盾，是我的表述缺陷，登记为 1 处，性质属"能力声明与口径混写"这一类，不属禁串族，因此不改字形、只在此说明：本补记落盘之后，节号从 §0 一直排到 §26，物理排布与编号顺序一致，台账那一节仍在中间偏后位置、其后只有 §25 与 §26 两节。此前那句里"25 个"是 §24 落盘时的瞬时计数，"连续到 §24" likewise 是当时的状态，两者都不再是终态，特此更正。判据层面我只保留可复量的事实：编号连续、无重复节号、表头与分隔行各 1 次、数据行竖线数为 6、逐行数学定界符成对、$E_{\delta}$ 与 $\mathrm{tr}(RZ^{2})$ 等关键量的位置行号未经任何事后改动。

## §27 英文残留的合并申报与终止说明

纯英文术语残留一族的计数在 §23 记为 1 处、在 §25 增记为 2 处，现按逐行复量结果合并为 3 处，落点依次在 §1（一个排版环境的名词）、§8（一个线性代数记号的名词）、§26（一个英文副词）。除这三处外，正文里的拉丁字形只出现在文件路径、人名与数学命令名之内，路径形如 build/sections/field.tex:158--163，人名形如 Hundertmark--Laptev--Weidl，命令名一律处于数学定界符内部，例如 $\mathrm{sech}$、$\Gamma$、$\mathcal{D}$。

同类合并申报的还有：连接词反转族 6 处（§2、§4 两处、§5 两处、§11），过渡短语族 2 处（§4、§20），长停顿号族 2 处（同在 §10 末行），装饰横线整行 0 处，连续两个逗号 0 处，异体字 1 处（§15），排版命令拼写瑕疵 2 处（§7），自定义宏泄漏 0 处，表述缺陷 1 处（§25，已在 §26 更正）。首块体量缺口 1 处（Write 时 23,118 字节，低于 28,000 至 31,500 的建议区间，已过 20,000 硬下限），申报后未以任何整档重写或就地替换的方式补足，全文总量靠后续七次 Edit 追加达成，单笔均低于 25,000 字节的限额。

本节写到这里即终止：已落盘内容一字未改，全部修正都走文末追加这条路径。留给下一位读者的两条最实用的线索是，第一，凡遇到"$M\geq0$ 才能用"的估计，先问它是否只需在某个零点成立，参照 build/sections/action-limit.tex:69--72；第二，凡需要带权 $t^{\beta}$ 的反常积分，先检查 $\beta\in(-\tfrac12,\tfrac12)$ 是否同时压住 $t\downarrow0$ 与 $t\to\infty$ 两端，参照 build/sections/trace.tex:16--17 与 build/sections/field.tex:41。这两条判据各自换掉了本稿一整个技术章节的复杂度。
