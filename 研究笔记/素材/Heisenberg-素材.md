# Heisenberg 铁磁体自旋磁化——第一人称研究思维链复盘素材（带批注的证明重构级深度）

**论文**：OpenAI, *Spontaneous magnetization in the quantum Heisenberg ferromagnet*, September 24, 2026。
**源码**：`E:\math\preprints\Spontaneous-magnetization-in-the-quantum-Heisenberg-ferromagnet-September-24-2026\build\source\`（main.tex + sections/00–07）。
**思维 summary**：`E:\math\reasoning_traces\spontaneous-magnetization-quantum-heisenberg-ferromagnet.pdf`（6 页）。
**说明**：方括号标注的[推测]为本复盘中构造的反事实失败路线，非论文原文；其余陈述与公式均按 tex 原样转写。

---

## 一、定理总览

### 1.1 模型与主定理（精确陈述）

固定整数 $d\ge3$、自旋 $S\in\{\frac12,1,\frac32,\ldots\}$。每个格点 $x$ 处取 $\C^{2S+1}$，基 $e_m$（$m=-S,\ldots,S$），
$$S^z e_m=m\,e_m,\qquad S^+e_m=\sqrt{S(S+1)-m(m+1)}\,e_{m+1},\qquad S^+e_S=0,$$
$S^-=(S^+)^*$，$S^{x,y}$ 按 $(S^+\pm S^-)/2,(S^+-S^-)/(2\mathrm i)$。有限立方体 $\Lambda\subset\Z^d$、自由边界、耦合 $J=1$：
$$H_\Lambda=-\sum_{\{x,y\}\subset\Lambda,\ |x-y|_1=1}\sum_{a\in\{x,y,z\}}S_x^aS_y^a. \tag{1.1}$$
拟局部代数 $\mathcal A$ 为有限点矩阵代数之并的范数完备化；无穷体积动力学 $\tau_t$ 由沿增大盒子 $e^{\mathrm itH_\Lambda}Ae^{-\mathrm itH_\Lambda}$ 的局部算子范数极限定义（Lieb–Robinson 局部性 + Nachtergaele–Ogata–Sims [Thm 2.2, 2006] 保证存在性与盒子无关）。$\beta$-KMS 条件按 Haag–Hugenholtz–Winnink：对每对 $A,B$ 存在闭条带 $0\le\mathrm{Im}z\le\beta$ 上有界、内部解析的 $F_{A,B}$，使 $F_{A,B}(t)=\omega(A\tau_t(B))$，$F_{A,B}(t+\mathrm i\beta)=\omega(\tau_t(B)A)$。

**Theorem 1.1（主定理）**：对每个 $d\ge3$、每个 $S\in\{\frac12,1,\frac32,\ldots\}$，存在有限 $\beta_0(d,S)>0$，使得对每个有限 $\beta\ge\beta_0(d,S)$，(1.1) 关联的动力学存在平移不变的 $\beta$-KMS 态 $\omega$ 满足
$$\omega(S_0^z)\ge S/4.$$

要点：零外场、态可选方向（不必旋转不变平均保持磁化）、磁化下界显式为 $S/4$、对任意半整数自旋一致成立。

### 1.2 历史定位

- **Mermin–Wagner (1966)**：$d\le2$ 有限程各向同性海森堡模型排除正温铁磁序——这是 $d\ge3$ 限制的严格根据。
- **Fröhlich–Simon–Spencer (1976)**：经典连续自旋模型红外界给出 $d\ge3$ 低温有序 [Thm 3.1]。
- **Dyson–Lieb–Simon (1978, Thm 6.2)**：量子**反**铁磁对 $S\ge1$（大 $d$ 时含 $S=1/2$）低温有序。关键工具是反射正性导出的 Duhamel 红外界；同一方法对**铁磁**失效——DLS 自己在 pp. 339–340 说明铁磁方向得不到所需的 Duhamel 红外界。这是本论文必须绕开的第一个大坑。
- **Kennedy–Lieb–Shastry (1988)**：$d=3$ 立方格 $S=1/2$ 反铁磁基态 Néel 序。
- **概率表示路线**：Powers (1976) 把各向同性模型与置换群随机游走联系；Conlon–Solovej (1991) 随机游走表示 + $S=1/2$ 低温自由能上界；**Tóth (1993)** 交换环（random stirring）表示改进压强下界；Nachtergaele (1994) 一般自旋对称槽表示；Björnberg–Fröhlich–Ueltschi (2020, §3.2) 给出对称槽 + 端点置换表述（但其结果限于完全图，归一化不同）。**正环权重本身不给出序**：所需的额外估计是"内部环有多少次避开边界 pin"——这正是全文的核心新估计。
- **Correggi–Giuliani–Seiringer (2015, Thm 2.1)**：$d=3$ 固定自旋低温自由能的旋波渐近；其界 (2.6)–(2.8) 还控制温度依赖的有限长度尺度 $\sim\beta^{5/4}$ 上的关联。Klippel (2026) 把自由能渐近做到 $d=2$。这些都是热力学/有限尺度推进，不给出固定正温的有序态——summary 第一页即点明"free-energy control alone does not supply the required order parameter"。
- **问题来源**：Lieb (1999, Problem A) 明确提出量子铁磁有序问题；Seiringer (2025, Oberwolfach 报告) 用体积平均有限体积二点序参量记录该开放问题。本论文的结论是**单点态断言** $\omega(S_0^z)\ge S/4$，并明确说明所引 account 中的有限体积关联判据是另一种表述、本证明不使用。

### 1.3 副产品：$S=1/2$ 硬核玻色子 ODLRO

Matsubara–Matsuda (1956) 对应：$S=\frac12$ 时 $b_x=S_x^-$，$n_x=b_x^\dagger b_x=S_x^z+\frac12$，(1.1) 变为
$$H_\Lambda=-\frac12\sum_{\{x,y\}}(b_x^\dagger b_y+b_y^\dagger b_x)-\sum_{\{x,y\}}(n_x-\tfrac12)(n_y-\tfrac12)$$
（粒子–空穴对称的吸引硬核跳跃模型）。把定理 1.1 的态旋转到 $x$ 方向得 $\nu$：$\nu(b_x)=r\ge1/8$（$r$ 为原平均自旋矢量长），$\nu(n_x)=1/2$，破坏 $U(1)$ 对称 $b_x\mapsto e^{-i\theta}b_x$。由 $\nu(B_\Lambda^\dagger B_\Lambda)\ge|\nu(B_\Lambda)|^2\ge|\Lambda|^2/64$ 得
$$\frac1{|\Lambda|^2}\sum_{x,y\in\Lambda}\nu(b_x^\dagger b_y)\ge\frac1{64},\qquad \nu(a_\Lambda^\dagger a_\Lambda)\ge\frac{|\Lambda|}{64},$$
即**平均意义下的 ODLRO** $\nu\ge1/8$（对角贡献仅 $1/(2|\Lambda|)$）；均匀模占据至少期望粒子数的 $1/32$。注意：这是关于所选无穷体积态的限制，不是有限体积 Gibbs 态。

### 1.4 机制一句话

把自旋 $S$ 拆成 $\ell=2S$ 个 $1/2$ 自旋槽（对称投影，端点均匀置换实现），环权重 2（两种颜色）化作"pin 定色"；边界槽全时段 pin + 稳定多项式同时 pin 测试（BBL 负相关）把"$m$ 个测试点全部落在避 pin 环上"压到 $(2r)^m$；外幂恒等式 $\mathbb E[\wedge^k\Pi]=\wedge^k\mathbb E\Pi$（Dereziński–Liang–Mahoney 行列式保持框架）+ Schur 补把条件化后的下次命中一阶矩识别为单粒子 Markov 游走返回概率；稀疏障碍（向下归纳输入）+ 局部 Nash 扩散 + 绕障碍壳层的有限能量流把二次损失 $\langle f,(I-U)f\rangle$ 抬到 $\approx m$，得 $\varepsilon(p)=o(p)$，向下归纳闭合；最后谱尾 $\mathbb P_0(M/|\Lambda|\ge S/2)\ge\frac12e^{-C|\partial\Lambda|}$ + 小场 $h_N=N^{-1/2}$ 倾斜选态 + 平移平均 + 双条带边界验证 KMS。

## 二、逐引理带批注重构（按论文八节）

### §1 槽、环与 pin（01-loops.tex）

**1.1 Lemma 1.1（对称槽实现）**
(a) 每点取 $\ell=2S$ 个 $1/2$ 槽，$\widehat S_x^a=\sum_j s_{(x,j)}^a$ 限制在对称子空间 $\mathrm{Sym}^\ell(\C^2)$ 上等于自旋 $S$ 矩阵；对称投影 $\mathcal S_x=\frac1{\ell!}\sum_{\kappa\in\mathfrak S_\ell}\mathcal U_{\kappa,x}$；且
$$\widehat H_\Lambda=-\frac12\sum_{\{i,j\}\in\mathcal E_\Lambda}\mathcal U_{(ij)}+\frac{q_\Lambda}4I. \tag{1.2}$$
(b) 机制：对称基 $\psi_k$（$k$ 个朝上槽的归一化和）下 $\widehat S^+\psi_k=\sqrt{(\ell-k)(k+1)}\,\psi_{k+1}$，代入 $m=k-S$ 得系数平方 $=S(S+1)-m(m+1)$——与物理 $S^+$ 完全吻合。二槽恒等式 $\sum_a s_i^as_j^a=\frac12\mathcal U_{(ij)}-\frac14 I$ 对槽边求和即 (1.2)，系数 $1/2$ 决定后面交换过程的 Poisson 速率。批注：证明特别强调"单个跨槽对换不必与 $\mathcal S_x$ 交换，但 $\ell^2$ 个槽对的完整集合在 $\mathcal S_x$ 共轭下重排"——这是表示在投影子空间上自洽的关键代数事实，也是端点置换合法性的根源。
(c) 常数理由：速率 $1/2$ 由 $s^i\cdot s^j=\mathcal U/2-I/4$ 机械地决定，不可调。
(d) [推测]失败路线一：若只保留每条格边一个槽对（即不取全部 $\ell^2$ 对），对称性破坏、$S_x^a$ 不再限制到对称子空间——表示失效。失败路线二：若改用不对称投影（如固定占据数），$M_\Lambda$ 与环表示对角化关系破裂，谱定律 (1.4) 拿不到，小场倾斜那一步无谱可倾。

**1.2 Proposition 1.2（精确自旋–环表示）**
(a) 分拆函数与全谱定律：
$$Z_\Lambda(\beta)=e^{\beta q_\Lambda/4}\,\mathbb E_{\mathrm b}2^{c(\omega)}, \tag{1.3}$$
$$\frac{\Tr(e^{-\beta H_\Lambda}\Phi(M_\Lambda))}{Z_\Lambda(\beta)} =\frac{\mathbb E_{\mathrm b}\sum_{\varepsilon\in\{\pm1\}^{\text{cycles}}}\Phi\!\left(\frac12\sum_C\varepsilon_Ca_C\right)}{\mathbb E_{\mathrm b}2^{c(\omega)}}. \tag{1.4}$$
其中 $a_C$ 为环 $C$ 在时间零切口的槽数，$\Phi$ 是 $M_\Lambda$ 有限谱上任一函数——不只是矩，是**整个谱分布**。
(b) 机制：Poisson 展开得 $\mathbb E_{\mathrm b}\mathcal U_{\varphi_\beta}=\exp\{\frac\beta2\sum_{\{i,j\}}(\mathcal U_{(ij)}-I)\}=e^{-\beta q_\Lambda/4}e^{-\beta\widehat H_\Lambda}$；对独立端点置换取平均得 $\mathbb E_{\mathrm b}\mathcal U_{\pi_\omega}=e^{-\beta q_\Lambda/4}\mathcal S_\Lambda e^{-\beta\widehat H_\Lambda}$。谱迹的计算：$\mathcal U_{\pi_\omega}$ 在 up/down 张量基 $\eta$ 上的对角元当且仅当 $\eta$ 在每条环上恒定时为 1；$M_\Lambda$ 特征值即 $\frac12\sum_C\varepsilon_Ca_C$。权重 $2^{c(\omega)}$ 来自每条环两种颜色的二选一。**为什么需要全谱**：末节小场倾斜 $\mathrm d\mu_{N,h}\propto e^{\beta hm}\mu_N(\mathrm dm)$ 是对谱定律本身的操作，只有矩界不够。
(c) 假设理由：$\Phi$ 任意（不限多项式）依赖 $\mathcal U_{\pi_\omega}$ 与 $\widehat M_\Lambda$ 交换（后者是全槽同一可观测之和，与一切置换交换）。
(d) [推测]若试图只对 $\Phi(t)=t^2$ 建立表示再外推矩，红外界路线会退回 DLS 失败区——这正是本文明确不走的路。若在端点置换处不用均匀分布（例如可积权重），(1.2) 的投影恒等式失效，环权重不再是 $2^{c}$。

**1.3 Pin 律与稠密边界极限（Lemma 1.3 dense pins）**
(a) 对确定性 pin 集 $D\subset V_\Lambda\times(\R/\beta\Z)$，令 $n_D(\omega)=\#\{C:C\cap D=\varnothing\}$，$w_D=2^{n_D}$，$Z_D=\mathbb E_{\mathrm b}w_D$，pin 律 $\mathbb P_D(\mathrm d\omega)=\frac{w_D}{Z_D}\mathbb P_{\mathrm b}(\mathrm d\omega)$。$\mathcal B_D$=避 $D$ 的环上的槽时点全集。连续边界 pin 集 $D_0=\partial\Lambda\times\{1,\ldots,\ell\}\times(\R/\beta\Z)$。稠密极限引理：对递增切口时刻族 $\mathcal C_n$ 并稠密，$D_{0,n}$ 只在切口时刻 pin 边界，则对 $\mathbb P_{\mathrm b}$-几乎每个图存在 $n_*(\omega)$ 使 $n\ge n_*$ 时 $w_{D_n}=w_D$、$\mathcal B_{D_n}=\mathcal B_D$；且 $\mathbb P_{D_n}\to\mathbb P_D$ 全变差。
(b) 机制：一个周期内 Poisson 标记几乎必然有限且时刻互异；环访问边界格点必占正时长区间（端点置换不动格点、跨槽标记不重合），故稠密切口必然探测到每次边界访问；环只有有限条，取最晚探测切口即可。归一化用 $w_{D_n}\downarrow w_D$ + 控制收敛。批注：证明结尾明确"支配常数依赖固定体积，不断言任何一致于体积的环权重上界"——体积一致化全部推迟到末节的表面阶代价。
(c) 理由：直接对连续 $D_0$ 做 Poisson 运算是病态的，稠密有限近似把"边界访问"化为可数的切口事件。
(d) [推测]若切口族不以 $0$ 为元或不覆盖跨时间缝的访问，环可在缝处瞬时进出边界而不被探测，$w_{D_n}\to w_D$ 失败。

**1.4 Lemma 1.4（阶乘测度控制）**
(a) 对任意 pin 律 $\mathbb P_D$、$n\ge1$、非负 $F$：
$$\mathbb E_D\sum_{(u_1,\ldots,u_n)\in(\omega_{\mathrm m})^n_\ne}F\le2^n\int_{X_\Lambda^n}F\prod_j\mu(\mathrm du_j). \tag{1.5}$$
（$X_\Lambda=\mathcal E_\Lambda\times[0,\beta)$，$\mu(\{e\}\times\mathrm dt)=\frac12\mathrm dt$；约束到任意时段与时间顺序仍成立。）
(b) 机制：**插入手术**——往图中插入一个跨槽对换，把两条有向线剪断重接：异环则合并（避 pin 环数不增），同环则一分为二（避 pin 环数至多增一：避 $D$ 的环给出两个避 $D$ 的子环，遇 $D$ 的环至少有一个后代仍遇 $D$）。故逐图 $w_D(\omega+\sum\delta_{u_j})\le2^nw_D(\omega)$，权重比 $2^n$ 即 (1.5) 中系数。再用迭 Mecke 公式（Poisson 展开的阶乘形式，Last–Penrose Thm 4.4）把有序 $n$ 元组求和换成 $n$ 重乘积强度积分。批注：证明强调混合（实际+新鲜）标记列表也满足相应乘积界——实际标记贡献 $2\mu$、新鲜标记贡献 $\mu$——并声明"不作任何固定路径暴露下的条件阶乘控制断言"。
(c) 常数理由：$2^n$ 是手术比值的机械产物；约束时间区间/顺序后逐字成立，因为 Mecke 恒等式对强度测度的任意子集成立。
(d) [推测]失败路线一：若环合并时避 pin 数可能增加（例如加权环模型的任意正权重），逐图控制断裂，(1.5) 失效。失败路线二：试图在**固定暴露** $\mathcal H$ 下对条件测度用阶乘控制（即把 (1.5) 条件化）会失败——实际标记在给定暴露下不再独立，这正是 summary 第 4 页反复强调的区分点。

### §2 同时 pin 测试（02-pin-test.tex）

**2.1 Proposition 2.2（同时 pin 测试，核心不等式）**
(a) 设 $E$ 为 pin 集（有限或有限 $\cup D_0$），$T$ 为与 $E$ 不交的单时刻有限测试集，$m=|T|$，$P=E\cup T$。对 $i\in T$，$\mathcal R_i(E,T)$=事件"从 $i$ 出发的线（同一图逐周期重复）在到达 $E$ 之前于严格正流逝时间再次到达 $T$"。$r=\frac1m\sum_i\mathbb P_P(\mathcal R_i)$。则
$$\mathbb P_E(T\subseteq\mathcal B_E)\le(2r)^m. \tag{2.1}$$
(b) 机制分三步。第一步（事件等价）：定义下次 pin 置换 $\sigma$（把每个 pin 映到其有向环上严格正流逝时间的下一个 pin），则 $\{T\subseteq\mathcal B_E\}=\{\sigma(T)=T\}=\{T\subseteq\sigma(T)\}$，且 $mr=\mathbb E_P|T\cap\sigma(T)|$（双射性使返回起点数=输出落在 $T$ 中的数）。第二步（稳定子集生成多项式）：证明 $\mathbb E_P\prod_{j\in\sigma(T)}y_j$ 稳定，由 BBL 强 Rayleigh 框架的子集存在性推论得 $\mathbb P_P(T\subseteq\sigma(T))\le\prod_{j\in T}\mathbb P_P(j\in\sigma(T))\le r^m$。第三步（两律比较）：逐图 $w_P\le w_E\le2^mw_P$（删 $T$ 的 $m$ 个 pin，遇 $T$ 避 $E$ 的环数在 $[0,m]$ 之间），故 $\mathbb P_E(H)\le2^m\frac{Z_P}{Z_E}\mathbb P_P(H)\le(2r)^m$。因子 $2^m$ 即"环闭合贡献 2"在测度比较侧的化身。连续边界情形由稠密切口 + 有界收敛 + 返回事件的有限地平线单调极限通过。
(c) 假设/常数理由：$T$ 必须是**单时刻**集——这样返回事件的"严格正时间"约定排除起点自身，且周期结构保证返回发生在整数个周期后；$E$ 可以是有限 $\cup D_0$，证明最后一段专门处理 $D_0$ 的稠密极限，且"只把标量概率与有界权重传给极限，不需要无穷变元的稳定多项式"。
(d) [推测]失败路线一：若 $T$ 跨多个时刻，$\sigma(T)$ 大小可变，$\{T\subseteq\sigma(T)\}$ 与 $\{T\subseteq\mathcal B_E\}$ 不再等价，$r$ 的子集解释破裂。失败路线二：若在 $E$ 律下直接对 $\sigma$ 做稳定性论证（跳过 $P$ 律），删 pin 比较消失，但 $\mathbb P_E$ 下 $\sigma$ 的输出分布不满足外幂/稳定框架——$2^m$ 因子正是把 $E$ 律换成更可分析的 $P$ 律的代价。失败路线三：试图用 $\mathbb P_E$ 的负相关直接压事件——summary 明确记录"signed minors do not directly control the positive event"，符号 minors 控制不了正事件 $\{T\subseteq\mathcal B_E\}$。

**2.2 Lemma 2.3（稳定性闭包运算）**
(a) 系数极限（公共次数界）、变元取实值、偏导数、**两变元等同**——都保持稳定（至零多项式）。特别地：等同两变元为 $t$ 后取 $t$ 的线性系数保持稳定。
(b) 机制：系数极限用复线 + Rouché/辐角原理；实值特化是 $a+\mathrm i/n$ 的极限；求导用 Gauss 分解 $\partial_tF/F=\sum_j1/(t-\zeta_j)$ 在上半平面虚部严格负故无零点；"等同后取线性系数"= 先对 $t$ 求导再令 $t=0$。
(c) 理由：这三件闭包正好是后文删非 pin 顶点（等同 $x_q=y_q=t$ 取线性系数）、取子集生成多项式（求导 + 置零）所需的全部代数操作——工具按用途定制。
(d) [推测]若改用"除以 $(1+u)$ 归一化"等操作，BBL 意义下不保稳定（summary 第 4 页：Eliminating a cycle produces weight two; dividing that bias away need not preserve stability）。

**2.3 Lemma 2.4（部分对称化）**
(a) $F$ 稳定多仿射，$\tau$ 交换两个变元，$0\le u\le1$，则 $(1-u)F+u\tau F$ 稳定多仿射。
(b) 机制：固定其余变元于上半平面，写二元截面 $q(z,w)=a+bz+cw+ezw$。稳定性给出虚部判据 $N(z)=\mathrm{Im}((a+bz)\overline{(c+ez)})\ge0$（$w$-根不能在上半平面）；交换截面给出 $N^\tau\ge0$。直接展开：
$$\mathrm{Im}((a+b_uz)\overline{(c_u+ez)})=(1-u)N(z)+uN^\tau(z)+u(1-u)|b-c|^2\mathrm{Im}z. \tag{2.2}$$
$0<u<1$、$b\ne c$ 时右边严格正，故混合截面 $w$-根严格在下半平面。批注强调：系数是复的——其余变元已固定在上半平面，证明未用任何实性假设。
(c) 理由：$u=\frac12$（即 Bernoulli 对换的符号平均）正是 (2.3) 中"Bernoulli transposition 的符号"操作；恒等式 (2.2) 的 $u(1-u)|b-c|^2\mathrm{Im}z$ 项是把严格正性从端点情形拉到内部的全部来源。
(d) [推测]若对**三个以上**变元做迭代对称化而中间某步允许 $u\in\{0,1\}$ 之外退化，只要 $b=c$ 会失去严格正性但结论仍由端点情形覆盖——真正的风险是试图把 (2.2) 推广到非多仿射（次数 $>1$）情形，$w$-根线性依赖的论证失效。

**2.4 Lemma 2.5（稳定交换符号）**
(a) 有限个独立 Bernoulli 对换与确定性置换之积的置换 $\pi$，其符号 $\mathbb EF_\pi$（$F_\pi=\prod_{i\in V}(x_i+y_{\pi(i)})$）稳定；任意极限亦然。且有限时间 Poisson 交换置换、指定子集上的均匀置换、确定性置换的有限独立积都有这种极限表示。
(b) 机制：恒等置换的符号是 $\prod(x_i+y_i)$，上半平面和的乘积无零；Bernoulli 平均恰是 2.3 的操作；确定性置换只重标变元。Poisson 用时间切片逼近（每片至多一个总标记时耦合成功，失败概率 $\le C\lambda^2(t+\delta)\delta$）；均匀置换用正速率全对 Poisson 对换跑单位时间——转移矩阵有公共均匀分量 $M\eta$，距离以 $1-M\eta$ 每步收缩到均匀律。
(c) 理由：Bernoulli 任意概率 $u\in[0,1]$ 的自由度对应交换速率 $1/2\times$时长切片后"至少一个标记"的概率；极限闭包（2.3 第一条）负责从有限积过渡到真 Poisson/均匀律。
(d) [推测]若切片内固定顺序应用对换而两标记发生在同一片同一边，耦合与实际过程不同——失败概率项 $C\lambda^2(t+\delta)\delta$ 正是控制这一点；若尝试对**无限**体积直接取符号极限，次数不公共、系数收敛不保证——所以本节一切都在固定有限体积内。

**2.5 Lemma 2.6（splice 与输出提取）**
(a) 从分层符号 $F_V(\boldsymbol x,\boldsymbol y)=\mathbb E_{\mathrm b}\prod_{i\in V}(x_i+y_{\pi(i)})$（$V$=把时间圆在每个 $P$-时刻切开后的所有层之并）出发，对每个 $q\in V\setminus P$ 置 $x_q=y_q=t$、取 $t$ 线性系数，得
$$F_P(\boldsymbol x,\boldsymbol y)=\mathbb E_{\mathrm b}\Big[2^{n_P(\pi)}\prod_{i\in P}(x_i+y_{\sigma(i)})\Big]. \tag{2.3}$$
且 $G_T(\boldsymbol y)=\mathbb E_P\prod_{i\in T}y_{\sigma(i)}=\frac1{Z_P}\big(\prod_{i\in P\setminus T}\partial_{x_i}\big)F_P\big|_{x_i=0}$ 稳定。
(b) 机制（splice 的两个中间步骤）：对确定性 $\pi$，非固定点 $q$（前驱 $i$、后继 $j$）的两个因子 $(x_i+t)(t+y_j)$ 的线性系数是 $x_i+y_j$——即**合并被消顶点的两变元、提取线性系数，把有向边 $i\to q\to j$ 拼接为 $i\to j$**（含二环 $i=j$ 情形）；固定点因子 $x_q+y_q=2t$ 贡献一个因子 2——**避 $P$ 的环最终变成固定点，每条贡献恰一个 2，这就是"环闭合贡献 2"的代数形态**。线性性把逐图恒等式升级为期望恒等式 (2.3)。取 $G_T$：对 $i\in P\setminus T$ 求 $x_i$ 导数选中 $x_i$ 项，再令**所有**剩余 $x$ 变元（含 $T$ 的）为零，从每个剩余因子选出 $y_{\sigma(i)}$。
(c) 理由：切口处"端点置换已应用"约定使时间 0 切口带后完成约定；层间变元不相交使 $F_V$ 是稳定区间符号之积（输出变量循环重标），稳定性由 2.4/2.5 保证。
(d) [推测]失败路线一：取 $t$ 的**常数**系数而非线性系数——splice 不发生、环不断，得不到 $\sigma$。失败路线二：对 $q\in V\setminus P$ 逐一置 $t$ 但**先**取线性系数再删下一个顶点与顺序相反的做法等价（线性代数上无差），但若在删除过程中试图除以 $2^{n_P}$ 归一化，稳定性的零多项式排除（靠非负系数 + 在全 1 点取正值的论证）会被破坏——除法不是保稳定操作。

**2.6 Lemma 2.7（存在概率 / 负相关）**
(a) 随机子集 $A\subseteq I$，生成多项式 $G(\boldsymbol y)=\mathbb E\prod_{j\in A}y_j$ 稳定，则对一切 $J\subseteq I$：
$$\Pr(J\subseteq A)\le\prod_{j\in J}\Pr(j\in A), \tag{2.4}$$
且在条件 $B\subseteq A$ 下（$I\setminus B$ 上）同样成立。
(b) 机制：条件化后的生成多项式 $\frac{(\prod_{j\in B}\partial_{y_j})G|_{y_j=1}}{\Pr(B\subseteq A)}$ 仍稳定（2.3 闭包）。只留两变元 $z,w$、其余特化为 1，得实系数 $a,b,c,e\ge0$、$a+b+c+e=1$ 的稳定式；实系数虚部判据给 $bc\ge ae$，而存在指示子的协方差恰 $=ae-bc\le0$——**负协方差**。沿 $J$ 的序逐个去条件、乘条件概率即 (2.4)。
(c) 理由：这里只用 BBL 的二元截面（Liggett 的初等证明路线），避免引入完整强 Rayleigh 理论；条件版是后文向下归纳里"在更老 pin 存在时继续测试"所需的形态。
(d) [推测]若随机子集不是 $\sigma(T)$ 而是比如 $\sigma^{-1}(T)\cap T$ 之类的交，生成多项式不再是子集型（重复变元），(2.4) 无从谈起。

### §3 暴露路径与单粒子返回恒等式（03-exposure.tex）

**3.1 Proposition 3.2（暴露路径分解 / exposure disintegration）**
(a) 固定 $P$，$\mathbb P_P$ 下暴露"避 $P$ 环的初始标记、一周期轨迹与端点映射"（$\sigma$-域 $\mathcal H$，暴露值 $\mathbf a$）；暴露后未被占的槽叫**洞**（所有 pin 在其时刻都是洞；边界槽全程是洞）。对固定暴露定义独立完成律 $\mathbb Q_{\mathbf a}$：两端为洞的槽边上放独立速率 $1/2$ Poisson 交换；暴露标记跳进洞时把洞反向搬运（强制双射）；周期末用独立均匀双射补全。令 $G_P$=事件"剩余图的每条环都遇到 $P$"，$g_P(\mathbf a)=\mathbb Q_{\mathbf a}(G_P)$。则 $\mathbb P_P$ 下条件律为 $\mathbb Q_{\mathbf a}(\cdot\mid G_P)$，且对确定性初始标记集 $A$ 的分支：
$$\mathbb E_P\Phi=\frac1{Z_P}\sum_{A\subseteq V_\Lambda}\int_{F_A}2^{c_A(\mathbf a)}\,\mathbb E_{\mathbb Q_{\mathbf a}}[\1_{G_P}\Phi]\,\mu_A(\mathrm d\mathbf a),\qquad \text{暴露边缘}=\frac1{Z_P}\1_{F_A}2^{c_A}g_P\,\mu_A. \tag{3.1}$$
其中 $F_A$=$A$ 的路径闭合、避开 $P$，$c_A$=$A$ 端点置换的环数。
(b) 机制：每条槽边放**两个**独立速率 $1/2$ 时钟 $N^{(1)},N^{(2)}$——$N^{(1)}$ 在至少一端有 $A$ 标记时接受，$N^{(2)}$ 在两端都无 $A$ 标记时接受；叠加时钟条件下的接受/拒绝结构与固定乘积分布独立（迭条件 + Poisson 分裂），故合成后的接受过程就是原交换律——**两族时钟分解**：第一族决定暴露轨迹，第二族在确定化的可用区间上运行，恰好是 $\mathbb Q_{\mathbf a}$ 的独立交换。端点处：给定 $A$ 标记的像后，剩余双射恰有唯一的均匀扩张（每个源–目标限制的扩张数相同），故补全均匀。点状恒等式 $2^{n_P}=\sum_A\1_{F_A}2^{c_A}\1_{G_P}$——每个底图恰有一个 $A$ 同时满足两要求——把不相交分支求和成 pin 权重。
(c) 理由：$g_P(\mathbf a)>0$ a.s. 保证除法合法；边界 pin 的"避开"是有限跳路径的可测性质，无需稠密近似即可处理（区别于 §2 那里需要稠密切口探测）。
(d) [推测]失败路线一：若不引入第二时钟族而直接"条件化原 Poisson 过程"，条件分布下剩余槽边的交换不再独立（暴露的轨迹与剩余交换有公共时钟），$\mathbb Q_{\mathbf a}$ 的独立性（外幂恒等式的输入）崩溃。失败路线二：若把暴露定义成"避 $P$ 环的完整路径"而非"初始标记+轨迹+端点映射"，分支 $\{F_A\}$ 不再对每个图恰好选出一个 $A$，(3.1) 的分支求和重数出错。

**3.2 Lemma 3.3（条件化前的外幂矩）**
(a) 若随机置换矩阵 $\Pi$ 的律是 Bernoulli 对换与确定性置换有限积律的极限，则 $K=\mathbb E\Pi$ 满足
$$\mathbb E[\wedge^k\Pi]=\wedge^k K\qquad(0\le k\le|V|). \tag{3.2}$$
特别地，对每个暴露 $\mathbf a$，$\mathbb Q_{\mathbf a}$ 下洞层并集上的分层置换满足 (3.2)。
(b) 机制（rank-one 论证）：$T_{ij}-I=-(e_i-e_j)(e_i-e_j)^*$，含两列秩一扰动的行列式为零，故 $\wedge^k((1-u)I+uT_{ij})=(1-u)\wedge^kI+u\wedge^kT_{ij}$——单个 Bernoulli 对换外幂矩是仿射的；独立因子时 $\mathbb E\wedge^k(AB)=\mathbb E\wedge^kA\,\mathbb E\wedge^kB$ 乘性拼接，归纳到有限积；一致有界连续性过极限。洞图的乘积结构：各切口层区间映射作用在分离的层块上、直和后接固定的层循环移位。
(c) 理由：这一条属于 Dereziński–Liang–Mahoney (2020, Def. 4 / Ex. 2 / Lemma 4) 的行列式保持性质——期望 minors 等于均值的 minors，且在独立矩阵乘积下保持；本文给出 rank-one 论证与到交换律的过渡。
(d) [推测]若对条件律 $\mathbb Q_{\mathbf a}(\cdot\mid G_P)$ 直接用 (3.2)，会失败——条件化（要求每条剩余环遇 $P$）破坏外幂恒等式；这正是 §3.4 前置声明"Only the independent law $\mathbb Q_{\mathbf a}$ will enter the linear-algebra calculation"的原因，也是 summary 反复强调"exterior-power calculation comes before this condition"的机制。

**3.3 Proposition 3.5（条件下次 pin 一阶矩 / 任意 W 恒等式）**
(a) $V=J\sqcup Q$，$\Pi$ 满足 (3.2)，$K=\mathbb E\Pi$，$G_J$=每条环遇 $J$。在 $G_J$ 上 $\Sigma$=沿环下次访问 $J$ 的列前向置换矩阵。则
$$\mathbb P(G_J)=\det(I-K_{QQ}), \tag{3.3}$$
若为正则 $K_{QQ}$ 瞬时（transient）且
$$\mathbb E[\Sigma\mid G_J]=H:=K_{JJ}+K_{JQ}(I-K_{QQ})^{-1}K_{QJ}, \tag{3.4}$$
更强地，对任意复 $J\times J$ 矩阵 $W$：
$$\mathbb E[\det(I-W\Sigma)\mid G_J]=\det(I-WH). \tag{3.5}$$
时间齐次单 pin 情形下 (3.3) 即 Alon–Kozma (2013) 的单环公式。
(b) 机制（"外幂恒等式 $\det(I-B)=\sum_k(-1)^k\mathrm{tr}\wedge^kB$ + 提取线性系数拼接"的完整链条）：第一步，取 $D=\mathrm{diag}(W,I_Q)$，$\mathbb E\det(I-D\Pi)=\sum_k(-1)^k\mathrm{Tr}(\wedge^kD\,\mathbb E\wedge^k\Pi)=\det(I-DK)$（(3.2) 把期望移入）。第二步，逐图分块消去：若某环完全落在 $Q$ 内，其指示向量 $v$ 满足 $D\Pi v=v$（对**任意** $W$），行列式为零；在 $G_J$ 上 $\Pi_{QQ}$ 幂零，$\det(I-D\Pi)=\det(I-\Pi_{QQ})\det(I-W[\Pi_{JJ}+\Pi_{JQ}(I-\Pi_{QQ})^{-1}\Pi_{QJ}])=\det(I-W\Sigma)$，其中 (i) $\det(I-\Pi_{QQ})=1$，(ii) 预解式的 $j$ 次幂项沿置换走指定步数的中间非 pin——**置换被"拼接"成下次 pin 映射 $\Sigma$**。第三步，得 $\mathbb E[\1_{G_J}\det(I-W\Sigma)]=\det\begin{pmatrix}I-WK_{JJ}&-WK_{JQ}\\-K_{QJ}&I-K_{QQ}\end{pmatrix}$；在 $W=0$ 处无任何可逆性假设地得 (3.3)；条件概率为正 $\Rightarrow I-K_{QQ}$ 可逆（否则 $Q$ 内有闭类使列和为 1、特征值 1）；Schur 补 + 除以正行列式得 (3.5)。第四步，$\det(I-tWA)=1-t\,\mathrm{Tr}(WA)+O(t^2)$ 的**线性系数**给出 $\mathrm{Tr}(W\,\mathbb E[\Sigma\mid G_J])=\mathrm{Tr}(WH)$ 对一切 $W$，取矩阵单位得逐项 (3.4)——"提取线性系数"在此第二次出现（§2.5 中它拼接置换，这里提取均值）。瞬时性定量：某正概率路径必离开 $Q$（有限步内一致下界 $\varepsilon$），$\|K_{QQ}^{kn}\|_{1\to1}\le(1-\varepsilon)^k$，$(I-K_{QQ})^{-1}=\sum_jK_{QQ}^j$。
(c) 假设/常数理由：为何需要**任意** $W$——返回测试允许线从 $i\in T$ 到**另一个** $T$ 点，返回数是 $\sum_{i,j\in T}\Sigma_{ji}$ 而非迹；对角矩恒等式不够，任意 $W$ 恢复均值的每个矩阵元。批注：Markov 解释中 $K$ 的每次应用**重采样**相应区间转移，不重复同一个采样置换——这个区分允许返回计算用固定暴露环境里的一粒子热流。
(d) [推测]失败路线一：若 $J=\varnothing$（无 pin）则 (3.3) 退化、$H$ 无定义——测试必须非空。失败路线二：试图把 (3.5) 升级为"$\Sigma$ 的条件分布 = Markov 游走的路径律"——失败：只有一阶矩（更准确地 det–minors 全层级）被识别，summary 第 3 页明确"identifies a conditional first moment, without identifying the full path law"。失败路线三：对无穷图/连续时间直接取 (3.3) 的极限，$Q$ 有限性（有限切口）是幂零论证的前提，必须先做稠密有限切口。

**3.4 Lemma 3.6（新鲜转弯游走与稠密边界 pin 下的返回恒等式）**
(a) 给定 $g_P(\mathbf a)>0$ 的暴露，定义**新鲜转弯游走**（fresh-turn walk）：周期化洞集/强制搬运/端点限制，其间以速率 $1/2$ 跳过每个可用槽边；强制搬运处照走；端点完成处用独立均匀补全；**每一轮用新鲜的 Poisson 交换与补全选择**。则对 $\mathbb P_P$-几乎每个暴露、$i\in T$：
$$\mathbb P_P(\text{下次 pin 在 }T\mid\mathcal H)=\mathbb P_{\mathbf a}^{\mathrm{walk}}(\tau_T^+<\tau_E). \tag{3.6}$$
(b) 机制：稠密切口 $\mathcal T_n$，$G_n\uparrow G_P$ a.s.（洞图周期内标记有限、访问正时长、故边界访问必被稠密切口探测；$g_n\uparrow g_P>0$），无早期下标可逆性要求。有限切口时 (3.4) 的 Markov 链恰是有限切口观测的新鲜转弯游走（"区间选择独立，包括后 passes 经过同一区间"），故 $\frac{\mathbb Q_{\mathbf a}(G_n\cap A_n)}{g_n}=\mathbb P^{\mathrm{walk}}(\tau_T^+<\tau_{E_n})$。两侧分别取极限：图侧 $\1_{A_n}\downarrow A$（环有限周期内必回 $T$）；游走侧用单条未删节的轨迹、$\tau_T^+$ 不依赖 $n$，事件交恰为 $\{\tau_T^+<\tau_E\}$（正时长驻留保证稠密切口能探测任何边界先行访问）。批注（对应 summary）：**比较游走每圈刷新其补随机性，不重复实际条件化后的环轨迹**——恒等式是一阶矩层面的，不是路径律层面的。
(c) 理由：把 (3.4) 的矩阵 $K$ 从有限切口过渡到连续边界 pin，需要正时长驻留论证；两侧行为的对称单调结构（左递增右递减）使极限可交换。
(d) [推测]失败路线一：若游走各轮**复用**同一批 Poisson 标记（不是新鲜随机），Markov 链解释（每次应用 $K$ 重采样）失效，(3.4) 与游走的联系断裂。失败路线二：若允许瞬时边界访问（比如把端点置换改成可动格点的操作），"稠密切口探测一切边界访问"失败，$G_n\uparrow G_P$ 断裂。

**3.5 Lemma 3.8（最小命中函数与返回能量）**
(a) 把停止规则中除 $D_0$ 外的 $E$-pin 全部忽略（只能增大返回概率），$U$=边界杀死的单周期列前向转移矩阵。存在最小非负解 $f$：
$$f=1\text{ 于 }T,\qquad U^*f=f\text{ 于 }T\text{ 之外}, \tag{3.7}$$
$f$ 在 $T$ 外=未来某轮在杀灭前到达 $T$ 的概率；$0\le f\le1$、边界上为 0；且
$$\langle f,(I-U)f\rangle=\sum_{i\in T}(1-(U^*f)_i),\qquad m(1-r)\ge\mathbb E_P\langle f,(I-U)f\rangle. \tag{3.8}$$
(b) 机制：有限地平线迭代 $f_{n+1}=\1_T+\1_{H_\theta\setminus T}U^*f_n$，单调有界收敛到命中概率；最小性由归纳（任何非负解 $h\ge f_n$）。（3.8）第一式的推导：$T$ 在模周期下是单时刻，正返回发生在整数个周期后，条件首周期得松弛返回概率 $(U^*f)_i$；由 (3.6) 真条件概率 $q_i\le(U^*f)_i$；再由 $U^*f=f$（$T$ 外）把 $\langle f,(I-U)f\rangle=\langle(I-U^*)f,f\rangle$ 化成 $\sum_{i\in T}(1-(U^*f)_i)\le\sum_{i\in T}(1-q_i)$。批注：**无"必被边界吸收"假设**——永不达 $T$ 的闭类上 $f=0$；同一 $U$、$f$ 在期望里是同一暴露的函数，外律是 (3.1) 的暴露边缘（含 $g_P$ 因子）。
(c) 伴随分解 $R_+FR_-$ 保序（$(R_+FR_-)^*=R_-F^*R_+$）与子置换收缩（行列和 $\le1$、$\ell^2$ 收缩）在 (3.9) 记录：
$$C_{ij}\ge0,\quad\textstyle\sum_iC_{ij}\le1,\quad\sum_jC_{ij}\le1,\quad\|Cv\|_2\le\|v\|_2. \tag{3.9}$$
批注明确："固定暴露下的陈述，不主张 $U$ 对称或暴露律时间反演不变。"
(d) [推测]失败路线一：若不松弛停止规则（保留全部 $E$-pin），命中函数依赖全部内部 pin，热流估计无从在固定环境中运行。失败路线二：若用**列和**做点值控制而不用行和（或反之），$0\le Av\le1$ 与 $\|Av\|_1\le\|v\|_1$ 两个方向各需其一边——summary 第 3 页的"mass and pointwise control"之辨：killed 转移写成部分双射的平均恰好同时供给两边。
(e) 尺度结论：$\eta=\1_T$，$g=f-\eta$，$0\le g\le1$、$\langle\eta,g\rangle=0$、边界零；$\mathbb E_P\langle f,(I-U)f\rangle\ge m(1-\varepsilon)\Rightarrow r\le\varepsilon$。**目标就是二次损失 $\approx m$**。

### §4 稀疏障碍与局部扩散（04-sparse-geometry.tex）

**4.1 稀疏性与归纳断言**
(a) 参数 $\alpha=\frac1{100}$，$\nu=\frac1{100d}$，$a=\frac{11}{10}$。集 $A$ 稀疏：$\#\{i:x_i\in B_h(z)\}\le L(1+h)^\alpha$（一切 $z,h$）。尺度 $s=p^{-a}$，$R=\lceil C_*s\rceil$，$\beta\ge5s$，时间网格步长 $\le p^{4d}$。归纳断言 $\mathsf I_p(D)$：对每个非空稀疏单网格时刻测试 $A\subseteq\mathcal V_{\mathcal G}\setminus D$，$\mathbb P_D(A\subseteq\mathcal B_D)\le p^{|A|}$。向下归纳（pin 越多断言越弱、越易成立；全 pin 时空洞成立），步中只用 $\mathsf I_p(P)$，**不假设 $\mathsf I_p(E)$**。
(b) 机制：障碍（blocked）格点=$\ell$ 个槽全非洞；把环境延拓到 $\mathbb Z^d$（外部全可用；边界因 $D_0\subseteq P$ 全可用），故 $\mathcal O_t$ 有限且离内边界有距。网格时刻处 $\mathsf I_p(P)\Rightarrow\mathbb P_P(A\subseteq\mathcal O_q)\le p^{|A|}$（每点选固定槽作测试）。
(c) 理由：稀疏性双用途——(i) 大障碍路径给出满足 (4.1) 的分离点列，使限制版归纳假设仍能探测大障碍；(ii) 测试点的次线性增长使后文流的重叠可和。$L\ge\max\{2d,\ell,4\}$ 保证 $2d$-点集稀疏、槽数计入、见证计数够用。
(d) [推测]若允许非稀疏测试（如整条线），$2^m$-枚举与"每半径 $L(1+h)^\alpha$ 点"的可和性都失败；流的能量界 (5.6) 右端 $CmR^\alpha$ 无界。

**4.2 Lemma 4.2（确定性时刻的障碍）**
(a) $\mathsf I_p(P)$ 下，任意确定性时刻 $t$：
$$\mathbb P_P(A\subseteq\mathcal O_t)\le C_0p^{2d}\ (|A|=2d);\qquad \mathbb P_P(A\subseteq\mathcal O_t)\le(C_0\sqrt p)^{|A|}\ (A\text{ 非空稀疏}). \tag{4.2}$$
(b) 机制：上一网格时刻 $q$ 与 $I=(q,t]$（$|I|\le p^{4d}$）；点内置换不改洞数，故 $t$ 时刻被挡 $\Rightarrow$ $q$ 时刻已挡 或 该点星内有标记。$2d$ 点情形：并界 $p^{2d}+Cp^{4d}$。稀疏 $n$ 点情形：至少 $\lceil n/2\rceil$ 个在 $q$ 已挡（子集求和 $\le2^np^{\lceil n/2\rceil}$）或至少 $\lceil n/2\rceil$ 个星内有标记——取同色（parity）格点至少 $\lceil n/4\rceil$ 个、星不相交，$\prod N_z$ 数不同标记的选择，阶乘界给 $(2d\ell^2|I|)^k$，$4d\lceil n/4\rceil\ge dn\ge n/2$ 化到 $(C_0\sqrt p)^n$。
(c) 理由：parity 论证（同色星不相交）是免独立性的关键——证明明确"这些是分开的事件界、用并界合并；旧的挡与介入标记间**不需要独立性**"。
(d) [推测]失败路线一：若网格步长不是 $p^{4d}$ 而是常数，标记项 $(Cp^{4d})^{\lceil n/4\rceil}$ 不再 $\sqrt p$-小。失败路线二：星计数若不取 $\prod N_z$（恰数不同标记的选择）而用 $\prod\1_{N_z\ge1}$，Mecke/阶乘界用不上。

**4.3 Lemma 4.3（一致分量尾）**
(a) 存在 $p_0$ 与 $c,C,\gamma>0$（只依赖 $d,\ell$ 与固定的稀疏性选择），使 $p\le p_0$、$\mathsf I_p(P)$ 时
$$\mathbb P_P(z\in\mathcal O_t,\ \mathrm{rad}_z\mathcal C_t(z)\ge h)\le C\exp(-ch^\gamma),\qquad \gamma=\log_b2. \tag{4.3}$$
常数在 $p_0$ 固定时一次定死，对一切 $p\le p_0$ 同时有效（**bootstrap 安全**：之后继续降 $p$ 不恶化尾常数）。
(b) 机制（二元树见证）：邻接=sup 距 $\le8$。深度 $j$ 的可容许见证 = 有序二元树上逐点赋格点，子分离条件 $\mathrm{dist}_\infty(\mathcal L_{w0},\mathcal L_{w1})\ge h_k/4$。被挡的跨越产生可容许见证：父跨越在首次出距 $h_j$ 处截断，第二个子起点取首个距 $\ge h_j/2$ 的点，两子球距 $\ge h_j/4$，递归。见证叶集自动稀疏（直径 $<h_k/4$ 的球每分裂至多吃 $2^{k-1}$ 叶，$L(2b^{k-1})^\alpha\ge2^{k-1}$ 靠 $b^\alpha>4$）。见证计数 $A_j\le(C_dh_j)^dA_{j-1}^2\Rightarrow A_j\le C_b^{2^j}$（$2^{-j}\log A_j$ 的几何加权和有界）。叶全被挡概率 $\le(C_0\sqrt p)^{2^j}$；取 $p_0$ 使 $C_bC_0\sqrt{p_0}\le e^{-2}$，得 $\exp(-2\cdot2^j)$，换底 $2^j\ge(h/16b)^\gamma$。
(c) 理由：$b>100$ 且 $b^\alpha>4$（$\alpha=1/100$）保证分离条件与稀疏覆盖在所有尺度同时成立；尺度列 $h_j=16b^j$ 与 $\gamma=\log_b2$ 是纯机械选择。
(d) [推测]失败路线一：若见证分离条件取 $\ge h_k/2$，截断几何（$h_j/2-2(h_{j-1}+8)$）变负，见证不再可容许。失败路线二：若对一般（非稀疏）测试点列证 (4.3)，叶计数与稀疏覆盖矛盾，$p_0$ 无法一次定死——bootstrap 闭环（引理注释明说"uniform even as the bootstrap parameter is subsequently decreased"）断裂。

**4.4 Definition 4.4 + Proposition 4.5（正则锚与失正则概率）**
(a) 时刻 $t$ 对锚 $x$ 在尺度 $R$ 正则 = (i) 每 $z\in B_{11R}(x)$：$\#(\mathcal O_t\cap B_{M_*}(z))<2d$；(ii) 每 $z\in\mathcal O_t\setminus B_{10R}(x)$：$\mathrm{rad}_z\mathcal C_t(z)\le(1+|z-x|_\infty)^\nu$。则
$$\mathbb P_P(t\text{ 对 }x\text{ 不正则})\le\delta:=CR^dp^{2d}+Ce^{-cR^\xi},\qquad \xi=\nu\gamma. \tag{4.4}$$
(b) 机制：条件 (i) 用 (4.2) 小情形 + $CR^d$ 个中心并界；条件 (ii) 用 (4.3) 对距离 $n$ 求和，径计数 $C(1+n)^{d-1}$ 被指数一半吸收。批注：只用 prescribed 时刻与时间积分，不断言逐时刻独立或全时刻同时正则。
(c) 理由：$11R/10R$ 的 1-gap 给绕流构造（§5）留位移余量；$M_*\ge\max\{16d,\rho(d,K_{\mathrm{conn}})+2\}$、$K_{\mathrm{conn}}=8(2d-2)+12$ 是把局部连通半径 (4.5) 嵌进正则条件的机械要求。
(d) [推测]若 (i) 只在 $B_R(x)$ 内要求而流需延伸到 $B_{10R}$ 之外，源的局部连通与远处路由的接缝失去正则保护。

**4.5 Lemma 4.6（一致局部连通）**
(a) $d\ge2$、$K\ge1$：存在 $\rho=\rho(d,K)\ge K+1$，使得若 $|u-v|_\infty\le K$、$u,v\notin F$、$\#(F\cap B_\rho(u))<2d$，则存在避 $F$ 的最近邻路径，在 $B_\rho(u)$ 内、长 $\le(2\rho+1)^d$。
(b) 机制：全格少于 $2d$ 个删除点时 $\mathbb Z^d\setminus F$ 连通——无有限分量：有限分量的首个各向出口必是 $2d$ 个互异删除点。一致半径：反证 + 紧性（$F_n$ 指示子点态收敛到 $|F_\infty|<2d$ 的极限集，有限路径对大 $n$ 稳定）。局部版对 $F'=F\cap B_\rho(u)$ 应用后去环。
(c) 理由：$2d$ 这个阈值不可降——$2d$ 个邻居恰好可以围死一点；这也是正则条件 (i) 里 $<2d$ 的来源。
(d) [推测]若 $d=1$（补集断开），引理失效——与 Mermin–Wagner 的 $d\ge3$ 要求相互呼应（此处 $d\ge2$ 起步，$d\ge3$ 在 $2k>d$ 处再次出现）。

**4.6 Proposition 4.7（局部 Nash 不等式）**
(a) 正则锚（$R\ge M_*+K_{\mathrm{conn}}+3$）下，非负 $v$ 支于 $B_R(x)$ 上方槽：
$$\|v\|_2^{2+4/d}\le C\mathcal D_t(v)\|v\|_1^{4/d}. \tag{4.5}$$
(b) 机制（Dirichlet 形式路径比较，Diaconis–Saloff-Coste）：三段。(i) **提升到格**：每幸存格点取 $\max v$ 为 $V(z)$；被挡点（$B_{R+3}$ 内必有余邻居，否则其 $2d$ 邻居违反条件 (i)）复制邻居值，$B_{R+3}$ 外置 0；范数代价 $\|v\|_2^2\le\ell\|w\|_2^2$、$\|w\|_1\le(2d+1)\|v\|_1$。(ii) **能量比较**：非零端点的格边端点属 $B_{R+2}$，对应幸存点 $u,u'$ 距 $\le3$，Lemma 4.6 给固定长度幸存路径；抬升到最大值槽，telescoping + Cauchy–Schwarz 得 $(w(z)-w(z'))^2\le$ 固定常数 × 路径上 $(v_i-v_j)^2$ 之和；每条槽边只被固定半径内的格边使用（congestion 有界），求和得 $\mathcal E_{\Z^d}(w)\le C\mathcal D_t(v)$。(iii) **格上 Nash**：平移平均 $A_kw$，telescoping 给 $\|w-A_kw\|_2^2\le C_dk^2\mathcal E$，卷积给 $\|A_kw\|_2^2\le k^{-d}\|w\|_1^2$；选 $k=\lceil(4\|w\|_1^2/\|w\|_2^2)^{1/d}\rceil$，吸收得 $\|w\|_2^{2+4/d}\le C_d\mathcal E\|w\|_1^{4/d}$。
(c) 理由：Dirichlet 杀死的零延拓必须显式——能量 $\mathcal D_t$ 含入零值边界的边；"每个幸存点至多 $\ell$ 个槽"保证范数转移的 $\ell$ 因子。
(d) [推测]失败路线一：被挡点若无幸存邻居（$2d$ 邻居全挡），$w$ 的定义失效——正则条件 (i) 恰好排除这一点，且证明把它用在 $B_{R+3}$ 内逐点。失败路线二：若槽边的 congestion 无界（提升路径反复穿过同一条槽边），(4.5) 的常数爆掉——固定半径内格边数有限是控制 congestion 的全部机制。

### §5 绕障碍的流（05-flows.tex）

**5.1 Lemma 5.1（凸包拓扑与间隙）**
(a) $C$ 取 $\mathcal Z$ 的（sup-8）分量；$A_C=\{\mathrm{dist}(z,C)\le4\}$，$H_C=\Z^d\setminus U_C$（$U_C$ 为补的无穷最近邻分量，唯一），$S_C$=$H_C$ 的外点边界。则：$A_C$ 两两不交、连通；$H_C$ 有限、连通、补连通、含于 $A_C$ 的坐标包围盒；两个凸包（hull）不交或一个含另一个（层叠性）。每条 $u\in H_C,v\notin H_C$ 的边有 $\mathrm{dist}(u,C)=4$、$\mathrm{dist}(v,C)=5$（两端幸存）。$S_C$ 由 sup 步长 $\le1$ 的步连通，每步可换成幸存格点的最近邻路径（含于包围盒的一格扩张）。
(b) 机制：半径 4 加厚两两不交（分量间距离 $\ge9$）且逐点相交连通；填口袋保连通。**层叠性**：第二加厚落在第一补的有限分量则 $U_C\subset U_{C'}\Rightarrow H_{C'}\subset H_C$；否则互相落入无穷分量、凸包不交。**边界连通**（Timár 的格情形，plaquette 证明免平面分离论证）：切边按初等方片相连；每个方片与切边集相遇偶数次；每分量分别与每个有限闭格走相遇偶数次（模 2 下闭走=方片之和）；若切边集有两个分量，取各一条边、内侧沿 $H_C$、外侧沿 $U_C$ 连接得恰用两条切边的闭走——矛盾。sup 步插值：逐坐标改变，中间点距 $C\ge4$、距其他分量 $\ge3$，全部幸存。
(c) 理由：4/5 的间隙与 8-邻接、$D_{\mathrm{loc}}=8(2d-2)+8$ 的局部 hull 直径等常数互相锁定，都是给 (5.2) 的位移界留机械余量。
(d) [推测]失败路线一：若不加厚（$A_C=C$），路由无间隙、替换路径可接触障碍本身。失败路线二：若用平面式 Jordan 论证，$d\ge3$ 无分离曲面可用——plaquette 模 2 论证是对任意维数的正确替代。

**5.2 Proposition 5.2（路由单元流的衰减）**
(a) 正则锚 $x$、$R$ 充分大时，对每个注入槽 $a$（$y\in B_R(x)$ 上方）存在流 $J_a$：
$$\mathrm{div}\,J_a=\1_{\{a\}},\qquad |J_a(e)|\le C(1+\mathrm{dist}(e,y))^{-k},\qquad k=d-1-d\nu. \tag{5.1}$$
特别地 $\sum_eJ_a(e)^2<\infty$（等价地：流向无穷的单位流）。
(b) 机制分四步。**第一步（hull 尺寸）**：遇 $B_{10R}(x)$ 的分量少于 $2d$ 点（否则连通探索在 $M_*$ 球内找到 $2d$ 个分量点违反正则 (i)），直径 $\le8(2d-2)$，局部 hull 直径 $\le D_{\mathrm{loc}}$；远处分量在极小化者处用正则 (ii)：$\mathrm{diam}\,H_C\le2(1+b_C)^\nu+8$，$\nu<1$ 保证加厚后 $\le b_C/10$。**第二步（路由位移）**：保留含入极大 hull 族 $\mathfrak H$，顶点映射 $\rho$（一次应用！代表元可在另一 hull 内，不设 $\rho(r_H)=r_H$），邻 hull 边的带号路由 $r_H\to v\to u\to r_{H'}$（中段反向走原边），去环成简单路径；位移界
$$\text{route}(e)\text{ 距 }e\le C(1+\mathrm{dist}(e,y))^\nu. \tag{5.2}$$
**第三步（显式正交象限流）**：水平集质量 $a_N=\binom{N+d-1}{d-1}^{-1}$、向第 $j$ 方向送比例 $(n_j+1)/(N+d)$；进入质量核对 $a_{N-1}\frac{N}{N+d-1}=a_N$（此处出现 $(k+d-1)$ 选 $(d-1)$ 个非负合成——summary 第 6 页的"(k+d−1 choose d−1) nonnegative compositions"），$\mathrm{div}F_y=\1_{\{y\}}$，$|F_y(e)|\le C(1+\mathrm{dist}(e,y))^{1-d}$。**第四步（提升 + 求和合法性 + 散度核对）**：先证局部有限——用 $f$ 的原始边至多 $C(1+h)^{d\nu}$ 条（displacement 比较 $|h-t|\le C(1+t)^\nu+C$、$\nu<1\Rightarrow1+t\asymp1+h$）——**然后**才做散度计算：
$$\mathrm{div}\,J_a^0(b)=\sum_{e=(u,v)}F_y(e)(\1_{\{\psi(u)=b\}}-\1_{\{\psi(v)=b\}})=\sum_{z:\psi(z)=b}\mathrm{div}F_y(z)=\1_{\{\psi(y)=b\}}.$$
（每条原始边一个固定取向、带号路由恒从 $\psi(u)$ 到 $\psi(v)$，符号在邻 hull 中段靠反向穿越自动正确。）最后加固定长度连接器 $Q_a$：$J_a=J_a^0+\1_{Q_a}$。能量：$2k>d$（$d\ge3$：$2(d-1-d\nu)>d\iff d>2d\nu+2\iff d(1-2\nu)>2$，$\nu=\frac1{100d}$ 成立），半径 $h$ 处槽边数 $\le C(1+h)^{d-1}$，平方可和。
(c) 假设/常数理由：**有限原像不等于可交换求和**——证明明确"Localization must first show…This establishes local finiteness before the divergence calculation"（summary 第 4 页同样记录）；$\nu<1$ 是一切 $\asymp$ 比较的枢纽。
(d) [推测]失败路线一：若对 $\rho$ 迭代到不动点（hull 代表元可能落入另一 hull），位移界 (5.2) 失控、congestion 爆炸——"map applied once"是刻意设计。失败路线二：若无局部有限性先证就形式上交换无穷和，散度计算的 Fubini 非法——这正是 summary 记录的"Finite preimages alone, however, do not justify exchanging sums in an infinite flow"。失败路线三：若正则 (ii) 的指数取 $\nu\ge1$，远处 hull 尺寸与 $b_C$ 不可比，(5.2) 失效且 $2k>d$ 不再成立。

**5.3 Lemma 5.3（两流重叠）**
(a) 两流满足包络（中心 $y,y'$，指数 $k\in(d/2,d)$）则
$$\sum_e|J(e)J'(e)|\le C(1+|y-y'|_\infty)^{-(2k-d)}. \tag{5.3}$$
(b) 机制：两心附近区（另一包络 $\le CH^{-k}$、近端包络和 $\le CH^{d-k}$）各出 $CH^{d-2k}$；中间区两距离可比，二进环 $2^jH$ 每环 $C(2^jH)^{d-2k}$、$2k>d$ 可和。
(c) 理由：靠衰减而非路径不相交——批注"Their decay, rather than a disjointness property of their routes, controls their total energy"；$d/2<k<d$ 是可和性与 (5.1) 的相容窗口（$k=d-1-d\nu$，$d\ge3$ 时 $k>d/2\iff d-2>2d\nu$）。
(d) [推测]若试图证明路由**不相交**再求能量，会失败——不同源的路径共享目标边是常态，congestion 只能控制在 $C(1+h)^{d\nu}$ 水平。

**5.4 Proposition 5.4（任意亚单位注入的能量）**
(a) $T$ 稀疏（$m$ 个锚槽），$I\subset T$ 为对该图正则的锚子集，$\mu_i$ 为支于 $B_R(x_i)$ 上方、总质量 $\le1$ 的任意非负质量。存在流 $J$：
$$\mathrm{div}\,J=\sum_{i\in I}\mu_i,\qquad \sum_eJ(e)^2\le C|I|R^\alpha\le CmR^\alpha, \tag{5.4}$$
从而对一切有限支撑 $g$：
$$\Big|\Big\langle\sum_{i\in I}\mu_i,g\Big\rangle\Big|\le\big(CmR^\alpha\mathcal D(g)\big)^{1/2}. \tag{5.5}$$
常数一致于 $I$ 与质量的选择。
(b) 机制：逐质量原子取 (5.1) 的单元流，$J=\sum\mu_i(a)J_{i,a}$。令 $q=2k-d=d-2-2d\nu>\alpha$。两流重叠界 (5.3)：$|x_i-x_j|_\infty>4R$ 时注入点距 $\ge\frac12|x_i-x_j|$；否则用一致常数界。质量 $\le1$ 给
$$\sum_eJ(e)^2\le C\sum_{i\in I}\Big[\#\{j:|x_j-x_i|\le4R\}+\sum_{j:|x_j-x_i|>4R}(1+|x_j-x_i|)^{-q}\Big]\le CLR^\alpha+C,$$
第一项用稀疏性 $LR^\alpha$，第二项二进环 $\sum_j(2^jR)^{\alpha-q}\le C$（$q>\alpha$）。最后有限支撑 $g$ 允许无边界项的分部求和：$\langle\sum\mu_i,g\rangle=\sum_eJ(e)(g(e^-)-g(e^+))$，Cauchy–Schwarz 得 (5.5)。
(c) 理由：构造在**单一时间片**上是确定性的——质量与正则锚集可依赖整个暴露环境；配对界既不要独立性也不要流随时间连续的选择（summary 第 4 页："The flow estimate is applied at the same time as the energy it absorbs, without requiring all-time regularity"）。
(d) [推测]失败路线一：若 $\mu_i$ 质量不设 $\le1$ 上界（比如 $\|f\|_\infty$ 未用），能量界失 $|I|$ 系数。失败路线二：若注入不支于 $B_R(x_i)$，(5.1) 的"锚在 $B_R(x)$ 内"前提失效，远处注入的位移比较不可用。

### §6 热流渗漏与 pin 自举（06-leakage.tex）

**6.1 Lemma 6.2（周期两端的渗漏）**
(a) 固定暴露环境，热区间生成元 $(L_tv)_k=\frac12\sum_{j:\{j,k\}\text{可用}}(\widetilde v_j-v_k)$（边界洞值零、含逃逸率），瞬时变化处 killed 因子 $R_+FR_-$（伴随保序）。$U=BMA$，$A=C_{2s}$、$B^*=C_{2s}^{\mathrm{rev}}$。对边界零值 $v$、$\beta\ge4s$：
$$\langle v,(I-U)v\rangle\ge\tfrac12\big(\|v\|_2^2-\|C_{2s}v\|_2^2+\|v\|_2^2-\|C_{2s}^{\mathrm{rev}}v\|_2^2\big), \tag{6.1}$$
且 $\|C_uv\|_2$、$\|C_u^{\mathrm{rev}}v\|_2$ 非增。
(b) 机制：全因子是计数 $\ell^2$-收缩，$\langle v,Uv\rangle=\langle B^*v,MAv\rangle\le\|B^*v\|_2\|Av\|_2\le\frac12(\|B^*v\|_2^2+\|Av\|_2^2)$（AM–GM）。$\beta=4s$ 时共享切口的跳按约定只记一次、中段取恒等。反向传播 = 同一环境逆序读出，具备同样的解析性质；**不主张暴露律的时间反演不变**。
(c) 理由：为什么必须**两端**——$U$ 不必自伴，单端估计控制不了 $\langle v,Uv\rangle$（summary 第 5 页："Both end portions remain necessary because $U$ need not be self-adjoint"）。约定细节：反向传播的伴随完成是逆时间方向第一个因子，恰记一次（含 $u=0+$ 的收缩跳）。
(d) [推测]若试图只用前向端 + $\|U\|\le1$ 的粗界，得 $\langle v,Uv\rangle\ge-\|v\|^2$，(6.1) 退化为无信息不等式——非自伴性使交叉项 $2\langle\eta_u,g_u\rangle$ 无法单端吸收。

**6.2 损耗恒等式**
(a) $\eta=\1_T$、$g=f-\eta$、$\mathcal L(u)=\|f\|_2^2-\|C_uf\|_2^2$、$\Delta_g(v)\ge0$ 为跳处 $g$ 范数损失。精确恒等式：
$$\mathcal L(u)=m-\|\eta_u\|_2^2-2\langle\eta_u,g_u\rangle+2\int_0^u\mathcal D_{t(v)}(g_v)\,\mathrm dv+\sum_{v\in\mathcal J(u)}\Delta_g(v). \tag{6.2}$$
(b) 机制：跳间 $\frac{\mathrm d}{\mathrm du}\|g_u\|_2^2=-2\mathcal D_{t(u)}(g_u)$（内–内边贡献 $-(g_j-g_k)^2$、内–边界边贡献 $-g_j^2$，归一化核对）；展开 $\|\eta_u+g_u\|_2^2$。舍去 $\Delta_g$ 得下界——必要，即使完成是唯一非平凡瞬时操作（完成双射**不**产生损失：它是双射的均值，$\Delta_g=0$；但保留下界方向安全）。
(c) 理由：$\mathcal L$ 非降（收缩性），故 $\mathcal L(2s)\ge$ 任意加权平均——这是最后一步"取 $\mathcal L(2s)$"的合法性来源。
(d) [推测]若把 $\Delta_g$ 的求和写成对数式并界到 $\int\mathcal D$（把瞬时损失当作连续损失的近似），在完成切口的跳处 $\mathcal D$ 可以是零而 $\Delta_g>0$ 的情形不存在——但反向不等式（把损失记到 $\mathcal D$ 上）非法，恒等式会变成双向都错。

**6.3 Lemma 6.3（pin 律平均下的局部化）**
(a) $\eta_{i,u}$=从 $i$ 出发、附加"离开 $B_R(x_i)$ 即杀"规则的传播；$\zeta_u=\sum_i\eta_{i,u}\le\eta_u\le1$。存在 $C_*(d,\ell)$ 使 $s\ge1$、$R=\lceil C_*s\rceil$、$\beta\ge5s$ 时
$$\mathbb E_P\|\eta_u-\zeta_u\|_1\le Cme^{-cs}\qquad(0\le u\le2s), \tag{6.3}$$
双向传播均成立。
(b) 机制（**双族标记的混合阶乘计数**）：先采 $\mathbb P_P$ 的实际图并暴露；条件其上，用**新鲜**速率 $1/2$ Poisson 时钟实现未条件化单粒子传播（新鲜标记仅当两端为洞时接受；强制移动用实际图标记；补全只在点内换槽）。逃出 $B_R$ 需 $R$ 步最近邻空间步，前 $R$ 步给出**时间序标记列表**（实际或新鲜）：$2s<\beta$（$\beta\ge5s$）故时间段在时间圆上的像不复用实际标记；新鲜标记天然互异。用 $k$ 个实际、$R-k$ 个新鲜标记的源选择：Lemma 1.4 给实际族阶乘界 $2^k\times$ 底强度，新鲜族独立，混合测度 $\le1^k(1/2)^{R-k}\mathrm dt_1\cdots\mathrm dt_R$；同一有序单纯形 $u^R/R!$；每步至多 $2d\ell^2$ 个（点,边）选择。合计
$$(2d\ell^2)^R(1+1/2)^R\frac{u^R}{R!}\le\frac{(2Ks)^R}{R!},\qquad K=3d\ell^2. \tag{6.4}$$
$R!\ge(R/e)^R$，取 $C_*>4eK$ 得 $\le2^{-R}\le e^{-cs}$。对 $i\in T$ 求和得 (6.3)；转置只是倒序时间表，反向同理。
(c) 假设/常数理由（关键声明）：**"No factorial bound conditional on a fixed exposure has been used"**——被计数的列表不必可实现为游走历史（存在性 ≤ 计数），暴露施加的限制在上界中全部忽略；实际图在原始律 $\mathbb P_P$ 下的阶乘界（Lemma 1.4 的无条件下）覆盖实际标记族。$\beta\ge5s$ 保证 $2s<\beta$（不复用标记）、且给 §6.4 留 $[s,2s]$ 窗口。
(d) [推测]失败路线一：若试图在固定暴露下做条件阶乘界（实际标记在给定暴露下不独立），(6.4) 的推导非法——summary 第 5 页原话"In particular we do not assume negative dependence under the path exposure"的同族区分。失败路线二：若 $\beta$ 只 $\ge4s$，时间段可跨时间缝两次、同一实际标记被复用，互异性失败。

**6.4 Lemma 6.4（足够正则时间后的衰减）**
(a) $\mathsf I_p(P)$、$p$ 低于初阈值时，$s\le u\le2s$：
$$\mathbb E_P\|\eta_{i,u}\|_2^2\le C(s^{-d/2}+\delta)\ (i\in T);\qquad \mathbb E_P\|\eta_u\|_2^2\le Cm\big[e^{-cs}+R^\alpha(s^{-d/2}+\delta)\big]. \tag{6.5}$$
(b) 机制：局部化传播全是收缩，$q_i(u)=\|\eta_{i,u}\|_2^2$ 非增；正则光滑时刻用 Nash (4.5) + $\|\eta_{i,u}\|_1\le1$：
$$q_i'(u)=-2\mathcal D(\eta_{i,u})\le-c\,q_i(u)^{1+2/d}, \tag{6.6}$$
故 $q_i^{-2/d}$ 在正则时间以固定速率增（其他时刻/跳处不降）；$[0,s]$ 内正则时间 $\ge s/2\Rightarrow q_i\le Cs^{-d/2}$。失正则时间期望 $\le s\delta$（(4.4) + Fubini），Markov 给超 $s/2$ 的概率 $\le2\delta$。总界：在 $z$ 上方槽只可能由 $x_i\in B_R(z)$ 的锚贡献，至多 $L(1+R)^\alpha\le CR^\alpha$ 个（稀疏性！），Cauchy–Schwarz 给 $\|\zeta_u\|_2^2\le CR^\alpha\sum_iq_i$；再由 $0\le\zeta_u\le\eta_u\le1$，$\|\eta_u\|_2^2-\|\zeta_u\|_2^2\le2\|\eta_u-\zeta_u\|_1$，接 (6.3)。
(c) 理由：指数 $d/2$ 的来源——Nash 差分 $q^{1+2/d}$ 的积分衰减；$\delta$ 只以未加权形式进入（被 $R^\alpha\delta$ 吸收）。
(d) [推测]失败路线一：若正则时间积分测度用全时段 $[0,\beta]$ 的平均而非 $[0,s]$ 窗口，Fubini 的 Markov 步失效（$\delta$ 是逐时刻概率，无独立性的逐点积分只有窗口内可用）。失败路线二：若不用稀疏性而把 $\sum_iq_i$ 直接按 $m$ 界，丢掉 $R^\alpha$ 因子，$\varepsilon(p)$ 的幂次核算 (6.10) 不再 $o(p)$。

**6.5 Proposition 6.5（期望渗漏，误差精化）**
(a) 常数按序固定、$p$ 足够小时：
$$\mathbb E_P\big[\|f\|_2^2-\|C_{2s}f\|_2^2\big]\ge m[1-\varepsilon(p)],\qquad \varepsilon(p)=C\big[e^{-cs}+R^\alpha(s^{-d/2}+\delta+s^{-1})\big],\quad \delta=CR^dp^{2d}+Ce^{-cR^\xi}. \tag{6.7}$$
(b) 机制（把 overlap 吸入梯度耗散的完整链条）：$\mu_u=\sum_{i:\,t(u)\text{ 正则}}\eta_{i,u}$；弃质量配对 $\mathbb E_P\langle\eta_u-\mu_u,g_u\rangle\le Cm(e^{-cs}+\delta)$（只用点界，$g_u$ 同环境无妨）。正则片上对 $\mu_u$ 用流 (5.4)：分部求和 + Cauchy–Schwarz 给**同时刻**确定性配对界
$$|\langle\mu_u,g_u\rangle|\le\big(A\mathcal D_{t(u)}(g_u)\big)^{1/2},\qquad A=CmR^\alpha. \tag{6.8}$$
只需每时刻存在某个流——不等式只含可测的传播向量与能量，不需可测/连续的流选择。**三角时间加权**：$w(u)=\frac{2(2s-u)}{s^2}$，$W(u)=\frac{(2s-u)^2}{s^2}$（末端线性消失，尾权二次消失，使 Young 余项在末端可积）；$\mathcal L$ 非降故 $\mathcal L(2s)\ge\int_sw\mathcal L$；Tonelli 把正能量项化为 $2\int_s^{2s}W(u)\mathcal D_{t(u)}(g_u)\mathrm du$。加权 Young：
$$2w\sqrt{A\mathcal D}\le2W\mathcal D+\frac{Aw^2}{2W}, \tag{6.9}$$
余项积分 $\int_s^{2s}\frac{w^2}{W}\mathrm du=\frac4s$（商在 $[s,2s)$ 恒为 $4/s^2$，端点零测）。合并：$m-Cm[e^{-cs}+R^\alpha(s^{-d/2}+\delta)]-Cm(e^{-cs}+\delta)-CmR^\alpha/s$，$R\ge1$ 允许未加权 $\delta$ 并入 $R^\alpha\delta$。
(c) 常数理由：$A$ 里的 $m$ 使 Young 余项 $\propto mR^\alpha/s$——这正是 (6.7) 中 $s^{-1}$ 项的出处；三角权使该余项有限而不需时间正则的流。
(d) [推测]失败路线一：用常数权 $w=1/s$ 平均，余项 $\int A/(2W)$ 在 $u\to2s$ 处 $W\to0$ 爆炸——末端线性消失是唯一修复。失败路线二：若先取期望再分部求和，$J$ 对环境的依赖使 Cauchy–Schwarz 与期望不可交换——证明刻意保持"逐片确定性、最后才取期望"的顺序。

**6.6 Theorem 6.6（一致 pin 估计 / 自举闭合）**
(a) 存在 $L$ 与 $p_*\in(0,1/4)$：$p\le p_*$、$\beta\ge5p^{-11/10}$、网格步长 $\le p^{4d}$、$E=D_0\cup$ 网格 pin 子集时，每个非空稀疏单时刻网格测试 $T$ 满足 $\mathbb P_E(T\subseteq\mathcal B_E)\le p^{|T|}$。特别地 $p=p_*$、$\beta_0=5p_*^{-11/10}$ 时对一切 $\beta\ge\beta_0$、每个内部槽 $j$：
$$\mathbb P_{D_0}(j\in\mathcal B_{D_0})\le p_*.\qquad\text{(单点结论)} \tag{6.10}$$
(b) 机制（向下归纳闭合）：对缺失网格点数归纳；步中 $\mathsf I_p(P)$ 由归纳假设供给（$P=E\cup T$ 缺更少），喂给 Prop 4.5 与 Prop 6.5；两端渗漏 + (6.1) 给 $\mathbb E_P\langle f,(I-U)f\rangle\ge m(1-\varepsilon(p))$；Lemma 3.8 得 $r\le\varepsilon(p)$；同时 pin 测试 (2.1) 得 $\mathbb P_E\le(2\varepsilon(p))^m\le p^m$——**向下归纳闭合**。
(c) 误差的幂次核算（为何 $\varepsilon(p)=o(p)$）：$R\asymp s=p^{-a}$ 后三个非指数误差
$$p^{a(1-\alpha)}=\tfrac{1089}{1000}>1,\qquad p^{a(d/2-\alpha)}\ge\tfrac{1639}{1000}>1,\qquad p^{2d-a(d+\alpha)}\ge\tfrac{2689}{1000}>1,$$
末两个用 $d\ge3$、随 $d$ 递增；两个指数项小于一切固定幂。选常数顺序（机械）：$d,\ell,\alpha,\nu,a\to$ 见证尺度 $b$、$L$ $\to$ 连通半径、$M_*$ $\to$ 初阈值 $p_0$ $\to$ $C_*$ $\to$ 最后降 $p$ 满足半径与 $2\varepsilon(p)\le p$。**组件尾常数用 $p_0$ 一次定死，不用最终 $p$ 重算**——这是 bootstrap 不自噬的关键。
(d) [推测]失败路线一：若 $\varepsilon(p)$ 只有 $O(p)$ 而非 $o(p)$，$2\varepsilon\le p$ 需要常数 $<1/2$，但 $\alpha=1/100$ 的富余正是为此——若 $\alpha$ 接近 1，$a(1-\alpha)$ 幂次不足。失败路线二：若归纳按 pin 数**向上**走（从少 pin 到多 pin），$\mathsf I_p(P)$（更多 pin、更易）喂不出 $\mathsf I_p(E)$（更少 pin、更难）——方向反了。

### §7 从 pinned 环到磁化平衡态（07-kms.tex）

**7.1 Lemma 7.1（边界染色与谱尾）**
(a) 零场标记–染色律中令 $G_N$=事件"每条遇 $D_0$ 的环染朝上"。存在 $C_{\beta,d,S}<\infty$：
$$\Pr(G_N)\ge\exp\{-C_{\beta,d,S}|\partial\Lambda_N|\},\qquad \mu_N([SV_N/2,\infty))\ge\tfrac12\exp\{-C_{\beta,d,S}|\partial\Lambda_N|\}, \tag{7.1}$$
且 $G_N$ 条件下未染色图恰为 $\mathbb P_{D_0}$ 律、避 $D_0$ 的环仍有独立公平颜色。
(b) 机制：$n_0$=遇 $D_0$ 的环数。每条这样的环要么含时间零边界槽、要么用一条边界关联的跨槽标记（无零槽时边界访问必以空间跳开始；点内置换不动格点）；每标记两条线至多见证两条环，逐图 $n_0\le\ell|\partial\Lambda_N|+2J_N$；一阶阶乘界（无 pin）给 $\mathbb E n_0\le(\ell+4d\beta\ell^2)|\partial\Lambda_N|$；逐图 $\Pr(G_N|\text{图})=2^{-n_0}$，Jensen 得第一式（$C=(\log2)(\ell+4d\beta\ell^2)$）。谱尾：权重 $2^{\#\mathrm{cycles}}\times2^{-n_0}$ 恰为避 $D_0$ 环的权重（因子 2 精确相消）；条件均值自旋 $\frac12(1-\mathbb P_{D_0}(i\in\mathcal B_{D_0}))\ge\frac12(1-p_*)$（单点结论 (6.10)；边界槽为零）对 $\ell V_N$ 个槽求和得 $\mathbb E[M_N/V_N|G_N]\ge S(1-p_*)$；由 $M_N/V_N\le S$，$S(1-p)\le Sq+\frac S2(1-q)$ 给 $q\ge1-2p_*>\frac12$，乘 $\Pr(G_N)$ 用谱解释。
(c) 理由：**表面阶**代价 $|\partial\Lambda_N|$ 而非 $V_N$——pin 只加在边界；$H_N$ 未被改动（"The boundary event has not changed the Hamiltonian"），谱尾是自由 Gibbs 态里的事件。
(d) [推测]失败路线一：若改 pin"所有环朝上"，代价是体积阶 $2^{-V_N}$，无法被 $h_NV_N\sim N^{d-1/2}$ 的场压过。失败路线二：若 $G_N$ 的定义依赖有限切口近似，Jensen 的逐图概率 $2^{-n_0}$ 无从定义——这里用的是 (1.4) 的全谱表示（这正是 §1 需要全谱而非矩的原因）。

**7.2 Proposition 7.2（显式消失场极限）**
(a) $h_N=N^{-1/2}$，$K_N=H_N-h_NM_N$，$\rho_N^{\mathrm{in}}(\cdot)=\Tr(e^{-\beta K_N}\cdot)/\Tr(e^{-\beta K_N})$，外部乘归一化迹延拓为 $\rho_N$，平移平均 $\omega_N(A)=\frac1{V_N}\sum_{x}\rho_N(T_xA)$。存在子列 $N_j$ 使 $\omega_{N_j}\to\omega$ 点态；每个这样的极限平移不变且
$$\omega(S_0^z)\ge S/4. \tag{7.2}$$
(b) 机制：$[H_N,M_N]=0$（逐项 $\mathbf S_x\cdot\mathbf S_y=S_x^zS_y^z+\frac12(S_x^+S_y^-+S_x^-S_y^+)$ 与端点 $z$ 自旋和交换）。场倾斜的谱定律 $\mu_{N,h}(\mathrm dm)\propto e^{\beta hm}\mu_N(\mathrm dm)$。分子在 $m<SV_N/4$ 上界、分母只留 $m\ge SV_N/2$：
$$\mu_{N,h}\big((-\infty,SV_N/4)\big)\le2\exp\big\{C|\partial\Lambda_N|-\tfrac{\beta hS}4V_N\big\}, \tag{7.3}$$
$h=h_N$ 时负项 $O(N^{d-1/2})$ 压过正项 $O(N^{d-1})$（比值 $\sim N^{1/2}\to\infty$），$q_N\to0$。谱界 $|M_N/V_N|\le S$ 给 $\rho_N^{\mathrm{in}}(M_N/V_N)\ge\frac S4-\frac{5S}4q_N$。子列选取：可数稠密集对角 + 范数逼近；平移不变性由 $|(\Lambda_N+y)\triangle\Lambda_N|/V_N\to0$。**$S/4$ 的出处**：磁化下界是 $\frac S4(1-q_N)-Sq_N$ 的极限——低尾 $S/4$ 与高尾 $S$ 的 $q_N$-加权。
(c) 理由：$h_N=N^{-1/2}$ 是"场体积分 $\beta h SV_N/4\sim N^{d-1/2}$ 压过表面代价 $\sim N^{d-1}$"的最简选择；任意慢于 $N^{-(d-1)/d+1/4}$ 量级亦可，但显式序列足够。
(d) [推测]失败路线一：取固定 $h>0$ 再令 $h\to0$，极限态可能旋转不变（各方向混合）——必须先体积 $\to\infty$ 后 $h\to0$ 的对角选取。失败路线二：若谱尾只有 $e^{-cV_N^{1/d}}$ 之类次表面代价，(7.3) 的指数差为正，$q_N\not\to0$。

**7.3 Lemma 7.4（深平移盒中的一致动力学逼近）**
(a) 对局部 $B$、含 $\mathrm{supp}B\cup\{0\}$ 的有限 $L$、$T<\infty$：
$$\lim_{r\to\infty}\sup_{\mathrm{dist}_\infty(L,\Gamma^c)\ge r}\sup_{|t|\le T}\|\tau_t^\Gamma(B)-\tau_t(B)\|=0,$$
且对 $I_N=\{x\in\Lambda_N:\mathrm{dist}(x,\Lambda_N^c)\ge\lfloor\sqrt N\rfloor\}$（$|\Lambda_N\setminus I_N|/V_N\to0$）：
$$\lim_{N\to\infty}\sup_{x\in I_N}\sup_{|t|\le T}\|\alpha_t^N(T_xB)-T_x(\tau_tB)\|=0. \tag{7.4}$$
(b) 机制：固定 $t$ 用反证 + 递增盒序列与 $\tau_t$ 定义矛盾；时间一致性用 $\|[H_\Gamma,B]\|\le c_B$ 的 Lipschitz + 有限网格。带场公式：$[H_N,M_N]=0$ 与平移给出精确恒等式
$$T_{-x}\big(\alpha_t^N(T_xB)\big)=\tau_t^{\Lambda_N-x}\big(\gamma_{-h_Nt}^L(B)\big), \tag{7.5}$$
其中 $\gamma_\theta^L$ 是局部 $z$-旋转；旋转效应 $\le h_N|t\|\,[\sum_{u\in L}S_u^z,B]\|$，用 $\tau_t^\Gamma$ 等距 + (7.4)。
(c) 理由：**同一子列**通过全部 KMS 条件、不许按对 $(A,B)$ 再取子列——证明开头即固定 $N_j$；$I_N$ 的 $\sqrt N$ 层舍弃与 $h_N=N^{-1/2}$ 匹配（$O(N^{-1/2})$ 体积分数）。
(d) [推测]失败路线一：若 $h_N$ 衰减快于动力学逼近误差，旋转项不消失、(7.4) 失败。失败路线二：若不对深盒一致化而用固定盒逼近，平移平均 (7.6) 的近边界项贡献不可忽略。

**7.5 Lemma 7.5（有界条带极限）**
(a) $F_n$ 在闭条带 $\mathcal S_\beta$ 连续、内部解析、各自有界；若 $|F_n|\le C$ 在两条水平边上，则 $|F_n|\le C$ 全条带（三线/最大原理 + Gauss 衰减压竖边：对 $e^{-\varepsilon z^2}F_n$ 在 $[-R,R]+i[0,\beta]$ 用最大原理，$R\to\infty$、$\varepsilon\downarrow0$）。若两边界序列局部一致收敛到 $f_0,f_\beta$，则 $F_n$ 在闭条带局部一致收敛到有界 $F$，$F(t)=f_0(t)$、$F(t+\mathrm i\beta)=f_\beta(t)$。
(b) 机制：$G_n=e^{-z^2}F_n$ 的水平边控制 $Ce^{-t^2+y^2}$ 使 $(G_n)$ 在两条边一致 Cauchy；对 $G_n-G_m$ 用最大原理，竖边 $2Ce^{-R^2+\beta^2}\to0$，得全条带一致收敛；乘 $e^{z^2}$ 还原。
(c) 理由：先建立**公共**条带界 $|F_N^{A,B}(z)|\le\|A\|\|B\|$（用 $W=0$ 前的有限界 $\|A\|\|B\|e^{2\beta\|K_N\|}$ 过第一部分，再得 (7.7)）——顺序不可颠倒。
(d) [推测]若只假设内部逐点有界而无水平边一致界，三线定理的前提缺失，全条带界不成立。

**7.6 主定理完成**
(a) 条带函数
$$F_N^{A,B}(z)=\frac1{V_N}\sum_{x\in\Lambda_N}\rho_N\big(T_xA\,\alpha_z^N(T_xB)\big), \tag{7.6}$$
迹循环性给出**两条边**恒等式 $F_N^{A,B}(t)=\frac1{V_N}\sum_x\rho_N(T_xA\,\alpha_t^N(T_xB))$ 与 $F_N^{A,B}(t+\mathrm i\beta)=\frac1{V_N}\sum_x\rho_N(\alpha_t^N(T_xB)T_xA)$——含平移支集越界的情形（在更大的代数上 $K_N\otimes I$ 的 Gibbs 密度 + 同一生成元 + 有限维迹循环性）。沿固定子列，(7.4) + 等距 + 紧集上的一致点态收敛（有限范数网）给两条边局部一致极限 $\omega(A\tau_tB)$、$\omega(\tau_tB A)$；Lemma 7.5 给 $F_{A,B}$，$\sup_{\mathcal S_\beta}|F_{A,B}|\le\|A\|\|B\|$。全代数：局部逼近 $A_n,B_n$，双线性 + 一致界给 Cauchy 列、极限与逼近列无关、两条边恒等式经范数逼近一致地传给 $A,B\in\mathcal A$——完整 $\beta$-KMS 条件对零场动力学 $\tau$ 成立，$\omega$ 平移不变、$\omega(S_0^z)\ge S/4$。
(b) 机制批注：条带极限用的是**完整态子列**，故 $F_{A,B}$ 的双线性结构从有限 $N$ 直接传递；"The state construction is checked on both KMS strip boundaries"（summary 第 3 页）对应这里两条边恒等式分别核验。
(c) 理由：外延 $\rho_N$ 用乘积归一化迹，保证 $F_N$ 定义在整个 $\mathcal A$ 上；$\rho_N$ 不是 $\tau$ 的 KMS 态（有场），但深平移处场效应 $O(h_N)$ 消失。
(d) [推测]失败路线一：若外延不用乘积迹而用周期延拓，迹循环性在越界支集上的恒等式失去"同一 $K_N$"结构。失败路线二：若只验证底边（热极限的常规做法），顶边 $\omega(\tau_tB A)$ 无法得到，KMS 条件只有一半。

## 三、summary 时间线（6 页逐段：失败路线 → 卡点原文 → 救活观察 → 映射）

### 第 1 页：从比较尝试到"同时 pin 测试"

- **起点与难度定位**：推理从长交换环、关联、场导数与"次广延自由能代价的磁化事件"开始。Seiringer 的 account 与 Correggi–Giuliani–Seiringer 的旋波自由能结果把难度点透：**"free-energy control alone does not supply the required order parameter"**——热力学控制不供给所需序参量（映射：§7 必须另造谱尾 + 场选取）。
- **失败路线 1：中点亲和比较（midpoint-affinity comparison）**。想法是"平均许多归一化的修改"而不是为一条长路径付费；Benjamini–Pemantle–Peres 的不可预测路径提供了相关几何想法 [BPP 1998]。卡点：两种比较都不给出蕴含海森堡序的定理。→ 救活观察：几何直觉保留为"稀疏见证 + 不可预测的返回"（后成 Lemma 4.3 的二元树见证）。
- **失败路线 2：Tóth 重建**。助手重建了 Tóth 的交换表示 [Tóth 1993]——$S=1/2$ 的 random stirring。卡点：单模/单色框架对一般自旋与谱定律不够。→ 救活：对称槽 + 端点置换的一般自旋版本（Nachtergaele 1994；BFU 2020 §3.2）承载全谱定律（论文 §1 重derive）。
- **失败路线 3：Nishimori 型无序比较**。临时性的比较，未闭合下界。→ 无直接后继。
- **失败路线 4：Elboim–Sly 无权重 interchange**。把高维无权重交换过程中的无穷环结果 [arXiv:2211.17023] 与此处的环加权模型比较。卡点：权重 2 的环模型不是无权重 interchange；无穷环定理不能移植。→ 救活：保留"环结构决定一阶矩"的想法，但改由外幂恒等式实现（§3）。
- **失败路线 5：Aizenman–Nachtergaele / Ueltschi 广义环框架** [1994; 2013]。卡点：正环权重本身不建立序。→ 救活：所需的额外估计=内部环避开边界 pin 的频率（论文引言原话："Positive loop weights alone do not establish ordering: the needed additional estimate controls how often an interior cycle avoids pins on the boundary"）。
- **失败路线 6：复旋转与经典 octopus 不等式**（McBryan–Spencer [1977] / Caputo–Liggett–Richthammer [2010] 关联的经典下界技术）。卡点：同样不能闭合下界论证。→ 放弃。
- **失败路线 7：植入路径（planting paths）**——指数颜色代价；**current shifts**——撞上有界自旋容量；**小平均亏损密度允许 trap walls（陷阱墙）**。
- **失败路线 8：平均连通性恒等式**。原文：
  > VERBATIM: "p relation yields self-consistency with arbitrary phase fraction! Can't bootstrap away because domain walls cost"
  自洽方程对任意相分数都有解，无法自举排除——域墙有代价使两个解都局部稳定。→ 救活：放弃平均量自洽，改**逐事件指数小**的同时 pin 测试（Prop 2.2），彻底绕开自洽方程。
- **转向符号化**：删标记 → 剩余槽上的条件单粒子核（holes）；rank-one 对换 → 外幂恒等式与行列式消去。卡点原文：
  > VERBATIM: "signed minors do not directly control the positive event that many test sites lie on internal cycles"
  符号 minors 控制不了"许多测试点落在内环上"这个**正事件**。→ 救活：外幂只用于**一阶矩识别**（§3.3），正事件由**稳定多项式负相关**（§2.6）处理——两个代数工具各管一头，不混用。

### 第 2 页：通过几何与热渗漏的拟定证明

- **构造陈述**：$\ell=2S$ 个 $1/2$ 槽 + 对称投影；$s^i\cdot s^j=\mathcal U_{ij}/2-I/4$ 给速率 $1/2$ 交换；点内均匀置换实现投影；pin 律下避 pin 环权重 2；$\mathcal B_D$ 为避 $D$ 环之并；$D_0$=全时边界槽。→ 映射：Lemma 1.1、Prop 1.2、§1.2。
- **同时 pin 测试（first statement）**：老 pin $E$、同时刻测试集 $T$、$P=E\cup T$、$\nu=|T|$；稳定化论证给出
  $$\mathbb P_E(T\subseteq\mathcal B_E)\le(2r)^\nu,\qquad r=\text{（}\mathbb P_P\text{ 下）}T\text{ 中下次 pin 仍在 }T\text{ 的平均比例}.$$
  → 映射：Prop 2.2，$(2r)^m$ 的 $2^m$ 因子 = 两律比较（$w_E\le2^mw_P$）。
- **常数首次出现**：α=1/100、ν=1/(100d)、$a=p^{-11/10}$（即 $s=p^{-a}$）、$R\ge s$、$\beta\ge5s$（summary 的 mojibake 对应 (4.1)/(4.2)）；Mark 插入界：第 $k$ 个阶乘测度 $\le2^k\times$ 底值（Lemma 1.4）；稀疏分支见证控制大被挡分量（Lemma 4.3）；正则时刻局部 detour 给 Nash 不等式（Prop 4.7）；加厚+填充远处分量允许流绕其壳层（Lemma 5.1、Prop 5.2）。
- **返回二次型**：边界杀死周期核 $U$；命中函数 $f$=1 于 $T$、$U^*f=f$ 于其余；$m(1-r)\ge\mathbb E^P\langle f,(I-U)f\rangle$（Lemma 3.8 原型）；写 $f=\1_T+g$，Nash 平滑传播的测试质量、三角时间平均把与 $g$ 的 overlap 吸入梯度耗散；残余项（mojibake 对应 $R^\alpha s^{-d/2}$、$R^{\alpha+d}p^{2d}$、$R^\alpha/s$）全部 $O(p)$ 级小 → 闭合归纳。→ 映射：Prop 6.5 的雏形，误差精化 (6.7) 在第 6 页定型。
- **结尾**：边界向上色条件有表面阶代价、供给磁化谱尾、允许小场选态 + 平移平均的 KMS 极限。→ 映射：Lemma 7.1、Prop 7.2。

### 第 3 页：把暴露与条件一阶矩分离

- **分支展开**：确定性初始标记集 $A_0$，$F_{A_0}$（路径闭合且避 $P$）与 $G_{A_0}$（每条补环遇 $P$）的合取唯一确定暴露集；加权测度按 $\sum_{A_0}\1_{F_{A_0}}2^{\#\mathrm{cycles}(A_0)}\1_{G_{A_0}}$ 展开。→ 映射：Prop 3.2 的分支恒等式 (3.1)（$2^{n_P}=\sum_A\1_{F_A}2^{c_A}\1_{G_P}$）。
- **两族时钟**：与指定标记的交换 vs 洞之间的交换分开；前者定暴露轨迹，后者在确定性可用区间上运行；期末揭示指定映射留均匀补全。补环条件 $G_{A_0}$ 仍须施加。→ 映射：Prop 3.2 证明的双时钟构造。
- **分层置换恒等式**：条件施加前，$\mathbb E\wedge^k\Pi=\wedge^k\bar K$（$\bar K$=均值）；任意矩阵 $W$ 的行列式展开中，完全限于非 pin 顶点 $Q$ 的环给零；Schur 补与 $W$ 的线性项识别条件均值下次 pin 核：
  $$\bar K_{J'J'}+\bar K_{J'Q}(I-\bar K_{QQ})^{-1}\bar K_{QJ'}.$$
  $J'$ 保留测试 pin 与有限边界切口。正的条件概率供可逆性；否则非 pin 中有闭类 → 矛盾 → 有限非 pin 块瞬时。稠密切口过渡到连续边界 pin，暴露数据固定。→ 映射：Lemma 3.3 + Prop 3.3（(3.2)–(3.5)）。
- **关键自我警告**：这识别的是**条件一阶矩**，不是完整路径律；比较游走每圈刷新补随机性、不重复实际条件化环轨迹。→ 映射：Lemma 3.6 证明中的声明。
- **质量 vs 点值控制**：killed 转移算子 $C_t$ 的列和界质量，但 $0\le C_t\1\le1$ 还需行和；把 killed 转移描述为部分双射的平均同时供给两者；不规则锚在期望中**逐个**付费，避免对全测试集取并；流估计与它吸收的能量**同时**使用，不要全时段正则性。→ 映射：(3.9) 行列双和 + Prop 5.4 + Prop 6.5。
- **几何细节**：幸存点的代表元在跨越被路由的边时必须一致，散度才能相消（对应 §5.2 的 canonical slot 提升）；态构造在 KMS 条带**两条边**上都核验。→ 映射：§5.2 与 §7.6。

### 第 4 页：把路由与停止规则精确化

- **过证测试（would inadvertently prove more）**：消一条环产生权重 2，**把偏差除掉不必保稳定**（"dividing that bias away need not preserve stability"——对应 Lemma 2.3 只保留安全闭包）；pin 输出集的负相关 ≠ 平衡自旋关联的正相关；反射盒中的常函数与把质量重新集中的搬运是反例测试 → 边界杀死与扩散中的范数损失是应答的本质部分。→ 映射：Lemma 3.8 的 (3.9) 与 Lemma 6.2。
- **停止规则澄清**：忽略内部 pin = 放宽**同一**游走的停止准则，保持暴露环境及其律固定，只刷新补随机性；二次型界中的期望对暴露环境取平均；**所有辅助常数在选小参数 $p$ 之前固定**。→ 映射：Lemma 3.8 + §6.6 的常数顺序。
- **流的局部有限性**：每个被路由使用的槽位选一个幸存代表、短局部连接把源转到代表；**有限原像不足以交换无穷流中的求和**——必须先证"距 $h$ 的目标边至多被 $d(1+h)^\nu$ 量级的原始边使用"（mojibake 对应 $C(1+h)^{d\nu}$），然后才做散度计算并保持组合能量界 $dp\,\nu^\alpha$（对应 $CmR^\alpha$）。→ 映射：Prop 5.2 证明第四步。
- **逃逸估计**：实际 $\mathbb P_P$ 图供强制跳、新鲜独立时钟供洞运动；离开 $\nu$-球（对应 $R$-球）需要来自两族的 $\nu$（对应 $R$）个时间序空间标记；短于一个周期的区间不复用实际标记（跨时间切缝也是）；有序选择计数给 $d\,\nu^d(2\nu)^d/d!$（mojibake 对应 $\le(2Ks)^R/R!$），指数衰减；反向传播用 killed 路径矩阵的伴随，不用逆扩散。→ 映射：Lemma 6.3。
- **磁化论证**：条件概率（下次 pin 在 $T$）的 $S/2$ 阈值在表面代价比较**之前**显式化。→ 映射：Lemma 7.1 中 $q\ge1-2p>1/2$ 的推导顺序。

### 第 5 页：用陷阱与关联检验构造

- **负相关 vs 铁磁关联**：区分"开放的 incoming/output 实验"（pin 输出集）与"闭合的自旋–颜色平衡分布"（(1.4) 的染色律）。现有限制的重申：
  > VERBATIM: "In particular we do not assume negative dependence under the path exposure."
  → 映射：§2.6 负相关只在完整 $P$-律的子集生成多项式上使用；固定暴露下（3.1）的外律不主张任何负依赖（论文 §1.4 注释同源："it makes no conditional factorial-domination assertion at a fixed path exposure"）。
- **条件化重建**：对有限跳轨迹的每个确定性 $A_0$ 分支分别重建；行列式计算直接绑定 $\det(I-B)=\sum_k(-1)^k\mathrm{tr}\wedge^kB$，独立区间块 + 固定层重标；稠密切口过渡保持暴露固定；杀死含边界起点。目的声明：防止条件一阶矩被当作**路径律等式**使用。→ 映射：Prop 3.2/3.3 的全部使用边界。
- **时变陷阱问题**：强制搬运能否不断把扩散掉的质量送回源？——置换不能恢复扩散已损失的平方范数；宽谐和平台上，同时刻流估计把持续 overlap 记到梯度能量上；两端都必要，因为 $U$ 不必自伴。→ 映射：Lemma 6.2 与 Prop 6.5。
- **路由检查**：允许 hull 代表元位于另一 hull 内；映射**只应用一次**而非迭代到不动点；散度从原始原像计算；公共规范槽 + 局部源校正保相消；overlap 估计拆成各中心附近贡献 + 收敛二进尾，用 $d-2-2d\nu>\alpha$（mojibake "d−2−2dp>α"）。→ 映射：Lemma 5.1 后的 $\rho$ 定义、Lemma 5.3、Prop 5.4。
- **三角权**：$\psi(v)$（对应 $\mathcal D$）、$\Phi(v)$（对应 $W$）满足 $2(2p-v)\psi(v)=p^2$、$(2p-v)^2\Phi(v)=p^2$、$\int_p^{2p}\Phi=p$——mojibake 对应 $w(u)=2(2s-u)/s^2$、$W(u)=(2s-u)^2/s^2$、$\int_s^{2s}W=s$；Young 给所需 $dm\,\nu^\alpha/p$（对应 $CmR^\alpha/s$）代价，不需时间正则的流选择。→ 映射：(6.9)、(6.4/weight-integral)。

### 第 6 页：闭合估计与选态

- **条件律的显式依赖**：暴露历史的边缘被 $\mathbb P(G_{A_0})$（未条件化概率）加权；给定历史，剩余图=条件于 $G_{A_0}$ 的独立完成律；**外幂计算在该条件之前**。pin 时刻模 $\beta$ 取（mojibake "modulo 5p" 对应取模周期）；正时长格点访问支持稠密边界切口的探测。→ 映射：(3.1) 暴露边缘含 $g_P$；Lemma 3.6。
- **稀疏见证在每个半径核对**；有界复制重数（bounded copying multiplicity）与有界 congestion 控制局部 Nash 比较；全局流用命名端点构造处理连接两 hull 的边；层 $k$ 处 $(k+d-1)$ 选 $(d-1)$ 个非负合成解释外向格流的衰减（=正交象限流质量 $a_N=\binom{N+d-1}{d-1}^{-1}$）。只需被平均的传播量可测。→ 映射：Lemma 4.3、Prop 4.7、Prop 5.2。
- **归纳误差统一**：
  $$\varepsilon(p)=d\big[e^{-cs}+\nu^\alpha(s^{-d/2}+\delta+s^{-1})\big]=O(p),\qquad 2\varepsilon(p)\le p\ \text{闭合归纳，}\ \beta_0=5p^{-11/10}$$
  （mojibake "δ = d ν^d p^{2d} + d e^{-cν^ξ}" 对应 $\delta=CR^dp^{2d}+Ce^{-cR^\xi}$，固定 $\xi>0$）。稳定性论证还把 Poisson 逼近与端点置换分开，后者收敛到均匀由正的公共均匀部分解释（Lemma 2.5 的 $M\eta$ 论证）。→ 映射：(6.7)、Theorem 6.6。
- **谱尾与选态**：$\varpi=\sum_{x\in\Lambda}S_x^z$（对应 $M_N$），零场谱律 $\mathbb P_0$ 满足 $\mathbb P_0(\varpi/|\Lambda|\ge S/2)\ge\frac12\exp(-C_{\beta,d,S}|\partial\Lambda|)$；用 $e^{h\varpi}$ 倾斜，固定 $h>0$ 时体积增长下低于 $S/4$ 的磁化被压制；增长盒与 $h\to0$ 对角选取，再对平移取平均；每条固定 KMS 条带上，局部实时收敛给出两个边界值；Gauss 阻尼与最大原理给解析极限、经范数逼近延拓。最终结论：每个足够低正温有平移不变零场 KMS 态带正磁化；**$S/4$ 出现在场选取估计中**。→ 映射：Lemma 7.1、Prop 7.2、Lemma 7.4/7.5、§7.6。

**时间线→引理映射总表**：中点亲和/BPP/octopus（弃）→ 二元树见证 (4.3)；Tóth 重建 → 对称槽环 (1.1–1.2)；平均连通性自洽失败 → 逐事件 pin 测试 (2.2)；符号 minors 失败 → 稳定多项式 (2.6) 管正事件、外幂 (3.3) 管一阶矩；无权重 interchange 失败 → 权重 2 的 pin 律 + 阶乘控制 (1.4)；trap walls → hull 加厚/填充 (5.1)；"除以偏差不保稳定" → 闭包运算白名单 (2.3)；"负依赖不假设于路径暴露下" → 外律 (3.1) 与 $P$-律稳定性的分工；"$U$ 不自伴" → 双端渗漏 (6.2)；"有限原像≠换序" → 先局部有限后散度 (5.2)。

---

## 四、常数与参数表

| 符号 | 值/定义 | 首现 | 作用 |
|---|---|---|---|
| $\ell=2S$ | 槽数/点 | §1 | 对称子空间维数 |
| 交换速率 | $1/2$ | (1.2) | $s^i\cdot s^j=\mathcal U_{(ij)}/2-I/4$ 机械决定 |
| 环权重 | $2^{n_D}$ | (1.5) | 避 $D$ 环各贡献 2（两色） |
| $D_0$ | $\partial\Lambda\times\{1..\ell\}\times(\R/\beta\Z)$ | (1.6) | 连续边界全 pin |
| $(2r)^m$ | pin 测试界 | (2.1) | $2^m$=两律比较因子，$r^m$=负相关界 |
| $\alpha$ | $1/100$ | (4.1) | 稀疏增长指数 |
| $\nu$ | $1/(100d)$ | (4.1) | 远处 hull 半径指数（$<1$ 是比较枢纽） |
| $a$ | $11/10$ | (4.1) | $s=p^{-a}$ |
| $s,R$ | $s=p^{-a}$，$R=\lceil C_*s\rceil$ | (4.2) | 定位/正则尺度 |
| $\beta$ | $\ge5s$；$\beta_0=5p_*^{-11/10}$ | (4.2)、Thm 6.6 | $2s<\beta$ 保证标记不复用 |
| 网格步长 | $\le p^{4d}$ | (4.2) | 障碍引理的标记项指数 |
| $L$ | $\ge\max\{2d,\ell,4\}$ | (4.1) | 稀疏常数（$2d$-点集稀疏） |
| $b,\gamma$ | $b>100$，$b^\alpha>4$；$\gamma=\log_b2$ | L 4.3 | 见证尺度比与尾指数 |
| $h_j$ | $16b^j$ | L 4.3 | 见证尺度列 |
| $\xi$ | $\nu\gamma$ | P 4.5 | 失正则指数尾 $e^{-cR^\xi}$ |
| $K_{\mathrm{conn}}$ | $8(2d-2)+12$ | (4.6) | 局部连通分离半径 |
| $M_*$ | $\ge\max\{16d,\rho(d,K_{\mathrm{conn}})+2\}$ | (4.6) | 正则条件 (i) 的球半径 |
| $\delta$ | $CR^dp^{2d}+Ce^{-cR^\xi}$ | (4.7) | 失正则概率 |
| $C_*$ | $>4eK$，$K=3d\ell^2$ | (6.5) | $R!\ge(R/e)^R$ 吸收逃逸计数 |
| $p_*$ | $\in(0,1/4)$ | Thm 6.6 | 最终 pin 参数 |
| $\varepsilon(p)$ | $C[e^{-cs}+R^\alpha(s^{-d/2}+\delta+s^{-1})]$ | (6.7) | 渗漏误差，$o(p)$ |
| 幂次核算 | $a(1-\alpha)=1089/1000$；$a(d/2-\alpha)\ge1639/1000$；$2d-a(d+\alpha)\ge2689/1000$ | §6.5 | 三项全 $>1$ ⟹ $\varepsilon=o(p)$ |
| $w(u),W(u)$ | $\frac{2(2s-u)}{s^2}$，$\frac{(2s-u)^2}{s^2}$ | P 6.5 | 三角权，$\int w^2/W=4/s$ |
| $A$ | $CmR^\alpha$ | (6.8) | Young 权系数（$s^{-1}$ 项来源） |
| $k$（流衰减） | $d-1-d\nu$ | (5.1) | 单元流包络指数 |
| $q$ | $2k-d=d-2-2d\nu>\alpha$ | P 5.4 | 重叠衰减指数（$d\ge3$ 用在此） |
| $D_{\mathrm{loc}}$ | $8(2d-2)+8$ | P 5.2 | 局部 hull 直径 |
| $a_N$ | $\binom{N+d-1}{d-1}^{-1}$ | P 5.2 | 正交象限流水平集质量 |
| congestion | $C(1+h)^{d\nu}$ | (5.4) | 用 $f$ 的原始边数 |
| $2^m$（手术比） | (1.5) 因子 | L 1.4 | 插入标记的权重比 |
| $C_{\beta,d,S}$ | $(\log2)(\ell+4d\beta\ell^2)$ | L 7.1 | 表面代价常数（Jensen） |
| $h_N$ | $N^{-1/2}$ | P 7.2 | 选态场强（$N^{d-1/2}$ vs $N^{d-1}$） |
| $S/4$ | 磁化下界 | (7.2) | $\frac S4(1-q_N)-Sq_N$ 的极限 |
| $1/8,\ 1/64,\ 1/32$ | ODLRO 常数 | §1.4 | $r\ge S/4\Rightarrow\nu(b_x)\ge1/8$ 等 |
| $I_N$ | $\mathrm{dist}(x,\Lambda_N^c)\ge\lfloor\sqrt N\rfloor$ | L 7.4 | 深盒层（体积分数 $O(N^{-1/2})$，与 $h_N$ 匹配） |

**主要文献映射**：Powers 1976（置换群表示）、Tóth 1993（$S=1/2$ 交换环）、Nachtergaele 1994 + BFU 2020 §3.2（一般自旋对称槽/端点置换）、BBL 2009（稳定多项式/负相关，Thm 4.9/4.20 对应 §2.6/2.4）、Dereziński–Liang–Mahoney 2020（行列式保持/外幂矩）、Alon–Kozma 2013（单环公式特例）、Mecke 1967/Last–Penrose 2017（阶乘 Mecke）、Nash 1958 + Diaconis–Saloff-Coste 1993/1996（Nash 与形式比较）、Timár 2013（边界连通）、Doyle–Snell 1984（电网络流）、Sznitman 2012（级联事件类比）、Lieb–Robinson 1972 + Nachtergaele–Ogata–Sims 2006 Thm 2.2（动力学）、Mermin–Wagner 1966 / FSS 1976 / DLS 1978 / KLS 1988（历史定位）、CGS 2015 + Klippel 2026（自由能渐近）、Lieb 1999 Problem A + Seiringer 2025（问题来源）、Matsubara–Matsuda 1956、Griffiths 1966（场–磁化关系）；summary 中出现而论文正文未用的比较对象：BPP 1998、Elboim–Sly 2022、McBryan–Spencer 1977、Caputo–Liggett–Richthammer 2010、Aizenman–Nachtergaele 1994、Ueltschi 2013、Nishimori 型无序比较。




