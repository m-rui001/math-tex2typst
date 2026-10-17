# D19 · Ryser 覆盖猜想反例：把删除线弯成曲线，才挤得死一个覆盖

> 对象：A Counterexample to Ryser's Covering Conjecture（2026-09-23）。
> 主定理：存在 $s_0$，使每个 $s\ge s_0$、$s\equiv2\pmod3$ 的素数与每个足够大的**奇**数 $n$，取 $q=s^n$，都存在交（intersecting）的 $(q+1)$-部 $(q+1)$-一致有限超图 $H$，$\tau(H)=q+1$，交情形 Ryser 上界是 $q$，故被违反。
> 附产品：同样秩处 Gyárfás 的 $r-1$ 棵单色树覆盖猜想的反例。
> Lean：两条目 RyserCovering（∃-变体）+ RyserOddExtensions（∀-全称版，且强于论文文字），零新公理、零 sorry；唯一形式化缺口是树覆盖推论。

## 0. 我要杀死的东西，和我为什么选交情形

Ryser 覆盖猜想：$r$-部 $r$-一致超图满足 $\tau(H)\le(r-1)\nu(H)$。交情形（$\nu=1$）是它最弱、最经典的一角：$\tau\le r-1$。射影平面挖掉一点的经典构造恰好达到等号，$r=q+1$ 部、$\tau=q$、$r-1$ 为素数幂时相等。也就是说：**等号已知可达，我只要在某个秩上把覆盖数再抬一格**。这个格局决定了整个战略：我不需要发明新的组合结构，我需要一个机制，把已知构造的 $\tau$ 从 $r-1$ 推到 $r$，而且是在无穷多个秩上推（否则审稿人会说孤例）。

既有正面结果把小秩全部封死：$r=3$ 有 Aharoni，交情形 rank 4、5 有 Gyárfás、Tuza，Haxell–Scott 把不带交假设的情形压到 $\tau\le(r-\epsilon)\nu$。所以我的反例秩必须很大，大到我可以用一整套只在"秩 $\to\infty$"时才成立的概率机制。这反过来塑造了主定理的形状：$q=s^n$，$n\to\infty$ 走奇数，秩 $r=q+1$ 无穷多。

[推测] 我最初大概想过直接在 $\mathbb F_q$ 上改经典构造（后来姊妹篇 BalancedRyser 对每个大素数 $q$ 真的这么做了，得到每部恰 $q+1$ 个点的平衡版本）。本文走的是另一条路：**小域造构形、大域铺开**，因为平衡版的改动是逐素数独立设计的，而我想要的是一个随 $n$ 无穷多次复用的机制，把一个固定的小域构形 $Y$ 嵌进每个 $\mathbb F_{s^n}$，让概率机制替我处理大域的自由度。

## 1. 起点：射影平面、平行类障碍

标准模型：部 = $\mathbb F_q^2$ 的 $q+1$ 个方向（含无穷远），每部顶点 = 该方向 $q$ 条仿射线；每个点 $x$ 决定一条"点边" $\{x$ 的关联线$\}$。两条点边交于连线，这是交性的来源。但立刻撞上致命障碍：**一个平行类（同一方向全部 $q$ 条线）就是一个大小 $q$ 的覆盖**。$q=r-1$，恰好卡在 Ryser 上界上。经典构造之所以只有 $\tau=q$，就是因为平行类在场。

所以全部问题变成：**在不破坏交性的前提下，废掉所有大小 $\le q$ 的覆盖**。我的方案分两层：

1. 大量保留点边（幸存点 $X$ 的点边），让任何小覆盖在"线"的部分被迫几乎含一个铅笔；
2. 插入例外边（在部分方向换了标签的边），让"几乎铅笔"的缺口填不平。

例外边彼此必须相交（否则交性塌掉），它们的标签又必须和点边相容。这逼出了全文最核心的设计，**双坐标**：删除操作按原坐标记账，例外边的标签按一个非线性变换 $f$ 后的坐标读出。

## 2. 战略骨架与常数引入顺序

整个证明是一条自下而上的链，常数的引入顺序被我自己强制固定（construction.tex 结尾我专门写了一段）：

> $s,Y$ → 选择常数与 $K$ → 删除常数 $D,\delta,\rho$ → 才轮到 $q=s^n\to\infty$。

链的形状：

- **incidence 定理**（绝对常数 $\kappa, Q$）：供给"小覆盖 ⇒ 几乎铅笔"的几何输入；
- **linecover 引理**（任意 $D,\delta,\rho$，删形状族）：应用于两套坐标系；
- **gadget 引理**（$s\equiv2\pmod3$ 的 $Y$ 与 $f(Y)$）：刚度黑箱；
- **selection 定理**（$D\mapsto K$）：从独立池里选相容平移，保证例外边相交；
- **placement**：池级删除估计 + 选定后的确定性转移；
- **hypergraph 装配 + 三情形排除覆盖** ⇒ 主定理。

理解任何一步"为什么是这个常数"，都得回到这个顺序。下面按链展开。

## 3. incidence 定理：一致节省

### 3.1 陈述与角色

```latex
\begin{theorem}[Uniform incidence saving]
There exist absolute constants $\kappa\in(0,1/10)$ and $Q$ …
Suppose that $q\ge Q$ is a prime power and every proper subfield
of $\F_q$ has order at most $q^{1/3}$. If $|P|,|\mathcal L|\le q^{1+\kappa}$,
then $I(P,\mathcal L)\le q^{3/2-\kappa}$.
\end{theorem}
```

注意这是一个要交出绝对常数的定量命题，纯粹的渐近陈述在这一步顶不住。它被 linecover 消费的方式：控制"一个不几乎共点的 $\le q$ 条线的覆盖，其两两交点落在幸存点里的数量"，没有 incidence 节省，低并发情形就推不出"随机抽的线对几乎都交在 $X$ 外"。

### 3.2 四步分解

**第一步：有限集估计**。Ruzsa 三角不等式（$(d,z)\mapsto(x_d-z,z-y_d)$ 用选定表示注入）、极大不交平移覆盖引理、以及 Plünnecke–Ruzsa 的 **Petridis 极小子集证法**：取 $W\subseteq Y$ 最小化 $\mu=|W+Q_0|/|W|$，核心增长不等式 $|W+Q_0+E_0|\le\mu|W+E_0|$ 按 $E_0$ 逐元素加入、记 $W_i'=\{w:w+e_i\in\bigcup_{j<i}(W+e_j)\}$、新贡献对比 $|W+Q_0|-|W_i'+Q_0|\le\mu(|W|-|W_i'|)$，极小性正是用在 $W_i'\subseteq W$ 上。最后 Ruzsa 三角消掉 $W$ 得 $|uY-vY|\le M^{u+v}|Y|$。

我选 Petridis 证法（，并非原始 Plünnecke 图论）是因为它只用加法群结构。[推测] 这样 Lean 里对任意 abelian 群实现最省事，事后 Lean 目录里确实没有名为 Petridis 的文件，估计被并进了 FiniteSet 系列。

**第二步：同时抽取（Gowers 型共同邻域）**。设 $|A|,|B|,|D|,|J|\le Vn$、$|G|\ge n^2/V$（$D$ 是差集、$J$ 是商集）。关键是**同一批**四步游走 $a,b_1,a_2,b_2,a'$ 同时给加法与乘法两组记账：

- 差：$a-a'=d_1-d_2+d_3-d_4$，固定 $a$ 后四差**唯一确定**游走（依次恢复 $b_1,a_2,b_2,a'$），每个 $S-S$ 元素选一对端点、四差组按交错和不交，故 $|S-S|\le|D|^4\cdot 2^{20}V^{18}/n^3\le2^{20}V^{22}n$；
- 商：$a/a'=j_1j_3/(j_2j_4)$，四商同样恢复游走，同一上界。

游走计数下界 $\frac{|A_0|}{2}(\tau n)^2\ge\frac{n^3}{2^{20}V^{18}}$（$\tau=(512V^8)^{-1}$，坏对筛选后的余集 $|S|\ge\frac34|A_0|\ge\frac{3n}{8V^2}$）。指数 $V^{18}=V^{16}\cdot V^2$ 来自 $\tau^2$ 与 $|A_0|$；外面再乘 $|D|^4$ 的 $V^4$ 得 $V^{22}$。

[推测] Balog–Szemerédi 分解我明确绕开了：假设直接给了 $|G|\ge n^2/V$ 的稠密性，不需要抽子图；若分别对差、商各做一次 BS 分解，两侧得到的子集 $S$ 不同，第四步需要**同一个** $S$ 同时差小、商小，分解误差 $V$ 的指数翻倍后 $K=q^{o(1)}$ 不再成立。这是"同时"二字的全部内容。

**第三步：BKT 标量覆盖的显式操作次数版**。$|B-B|\le K|B|$、$|B-eB|\le2K^3|B|$ 时，$\lambda$ 用 $E$ 中至多 $m$ 次运算表示，则 $\lambda B$ 含于至多 $K^{C_m}$ 个 $B-B$ 平移，$C_{m+1}=3C_m+5$、$C_m=\frac{13\cdot3^m-5}{2}$。归纳按表达式长度：基例用 $|2H-B|=|2B-3B|\le K^5|B|$ 备好 $2H$ 的覆盖（$H=B-B$）；加法代价 $K^{a+b+5}$；**乘法**代价 $K^{b+2a+5}$，左因子 $\lambda$ 作用在整个平移族 $U$ 上还得再膨胀 $\lambda H=(\lambda B-\lambda B)$，这就是 $C_{m+1}=3C_m+5$ 的机械来源：乘法要把左因子的 $C_m$ 级覆盖整个再膨胀一次。

假设里的 "$2K^3$" 是**下游反推上游**的典型痕迹：它恰好是第四步里对重叠集 $Z=S\cap eS$ 用 Ruzsa 三角

$$|S-eS|\le\frac{|S-Z|\,|Z-eS|}{|Z|}\le\frac{(Ks)^2}{s/(2K)}=2K^3s$$

落出来的数。我先有第四步的需求，再回头把第三步的假设定成 $2K^3$。

**第四步：排除中间近似子域**。反设 $|S|=q^{1/2+o(1)}$、$K=q^{o(1)}$、$|S-S|,|S/S|\le K|S|$：

1. 抽取标量覆盖假设：$s^4/|S/S|\ge s^3/K$ 的重叠和、抽列和 $\ge s^2/K$ 的 $b$、至少 $s/(2K)$ 个 $a$ 有 $|S/a\cap S/b|\ge s/(2K)$，令 $E=\{a/b\}$、$B=S/b$；
2. **差之比构成子域**：$R_0=\{(x-x')/(y-y')\}$。对候选 $\lambda$，标量覆盖给 $|E+\lambda E|\le K^{C_9+3}s<t^2$（比值 $4K^{C_9+5}/s\to0$，注意 $C_9$ 是**常数**，$K=q^{o(1)}$ 吸收它），于是 $(x,y)\mapsto x+\lambda y$ 在 $E^2$ 上不单射，碰撞对给 $\lambda\in R_0$；$R_0$ 对加乘逆负封闭，是子域；
3. 真子域禁忌：$|R_0|\ge|E|=q^{1/2+o(1)}>q^{1/3}$，子域假设强迫 $R_0=\mathbb F_q$；
4. 找坏标量：$\frac1q\sum_\lambda N_\lambda=t^2+\frac{t^4-t^3}{q}$，Cauchy–Schwarz 于纤维给某个 $\lambda$ 使 $|E+\lambda E|\ge\frac12\min(t^2,q)=q^{1-o(1)}$，但这个 $\lambda\in R_0=\mathbb F_q$ 有 4 次运算表示，$|E+\lambda E|\le K^{C_4+3}s=q^{1/2+o(1)}$，矛盾。

原文有一句关键注记我特意写进论文：表达式长度**有界**（$C_9$、$C_4$ 都是常数），没有任何域生成迭代，这是 $K=q^{o(1)}$ 能吃掉 $K^{C_m}$ 的唯一原因。

### 3.3 组装：剪枝与四锚点

反证取反例序列 $\kappa_j\to0$，$U=\max(2,q^{\kappa})=q^{o(1)}$。剪枝：度方和 $\le2U^2q^2$；删初始度 $>16U^3q^{1/2}$ 的点、再迭代删度 $<q^{1/2}/(8U^2)$ 的点，各损失 $q^{3/2}/(4U)$，存活集 $I\ge q^{3/2}/(2U)$。**全直线帽**：对任何射影线 $\ell$（含不在 $\mathcal L$ 里的），$|P\cap\ell|\le|\mathcal L|/(d-1)\le16U^3q^{1/2}$，这个"对每条线"的强形式是后面丢锚点线上的见证时需要的；[推测] 若只对 $\mathcal L$ 内的线控制帽，锚点四元组恰好可能掉在 $\mathcal L$ 外的一条线上，见证数清零，论证断在这里。

四锚点：每点 $|N(x)|\ge q/(128U^4)$，$t_\ell(t_\ell-1)(t_\ell-2)\ge\frac29t_\ell^3$ 配 Hölder 给共线三元组计数 $\ge\frac{q^{5/2}}{9\cdot2^{32}U^{20}}$，再配第 4 个点（在线外）合计五元组 $\ge\frac{q^{9/2}}{9\cdot2^{45}U^{28}}$。四元组种群至多 $2^{12}U^{11}q^{7/2}$，抽屉给某个四元组有 $\ge c_0q/U^{39}$ 个见证，$c_0=1/(9\cdot2^{57})$。丢弃共线上及两条连轴上的见证（帽 $3H<\frac{c_0q}{2U^{39}}$ 最终成立），四铅笔即坐标：$p_1,p_2,p_3,p_4$ 归一化后四条连线方程恰编码 $a,b,a-b,a/b$，$|A|,|B|,|D|,|J|\le H$、$|G|\ge c_0q/(2U^{39})$，取 $n=q^{1/2}$、$V=\frac{2}{c_0}U^{39}$，抽取引理给出 $S$，$K=2^{23}V^{24}$，与第四步矛盾。

$\kappa<1/10$ 的出处：下游 linecover 低并发情形需要指数 $D-h(1/2-\kappa/4)<0$，$h=10(D+1)$ 时该式 $=5(D+1)-\frac52(D+1)\kappa-…$，$\kappa<1/10$ 裕量很大，所以 $1/10$ 实际是 incidence 定理里固定后全篇统一使用的数值上界，不是被哪一处精确逼出来的。$q^{1/3}$ 子域界与主定理"奇次数"自洽：奇数 $n$ 的真因子 $d\le n/3$，子域阶 $\le q^{1/3}$。

## 4. Freedman 鞅：稀有性必须从方差里变现

```latex
\Pr\left(\left|\sum Z_i\right|\geq u\right)
 \leq 2\exp\left[-\frac14 \min\left\{u^2/V,\;u/M\right\}\right].
```

$e^z\le1+z+z^2$（$|z|\le1$）配条件均值零给 $\mathbb E(e^{\theta Z_i}|\mathcal A_{i-1})\le e^{\theta^2v_i}$；迭代乘积 + Markov 得 $\exp(\theta^2V-\theta u)$；$\theta=\min\{u/(2V),1/M\}$ 分两个 regime 统一成 $\frac14\min\{u^2/V,u/M\}$。常数 $1/4$ 比 Freedman 原文保守，[推测] 我故意选它，让两个 regime 的衔接只用初等不等式，Lean 里解析不等式代价太高。

为什么必须是条件方差版本：linecover 的 tuple 事件里，单次试验删掉整个 $P_0$ 的最坏情形使增量支撑 $\le2C_0$，Azuma 界里这个最坏情形把信号完全淹没（$n\cdot2C_0\sim Dq\cdot C_0$ 量级），偏差 $\delta t^2/2$ 根本不显著。但删中 $P_0$ 是**稀有事件**（概率 $\le Dt^2/q$），条件方差 $\mathbb E(Z_i^2|\text{past})\le C_0^2Dt^2/q$ 把稀有性变现，总和 $V\le D^2C_0^2t^2$ 才给出 $e^{-c_0t^2}$。[推测] 若把 $v_i$ 换成确定性上界 $C_0^2$，$V\sim DqC_0^2$，$t^2\sim\log q$ 时指数 $(\log q)^2/q\to0$，联合界失效，这是论文自述"we must use that rarity in the variance estimate"的机械内容。

## 5. linecover 引理：随机删除后的小覆盖必几乎共点

### 5.1 设置

形状族 $\mathcal F$：至多 $Dq^D$ 个、每个至多 $Dq$ 点、与任何线至多交 $D$ 点（除非它就是那条线）。至多 $Dq$ 次独立试验，各列至多 $D$ 个形状，列出即删。假设：每点每试验删除概率 $\le D/q$；一致存活 $\Pr(x\in X)=\delta_q\ge\delta$；对每条线 $\ell$，"精确列出 $\ell$ 本身"的概率和 $\le D/q$。结论：w.h.p. (1) 忽略精确 $\ell$ 后每条线存活 $\ge\delta q/2$；(2) 任何 $\le q$ 条线、留 $\le2q$ 点的覆盖含 $\ge(1-\rho)q$ 条共点线。

我特意写明：**单次试验内部删除可以任意相关，独立性只在试验之间**，gadget 应用里一次试验删 $(s-1)^2$ 条线，正是靠这一条放行。

### 5.2 四层证明

**层 1 一致计数**。单试验对 $|X|$ 的暴露至多 $2D^2q$（新旧列表共 $\le2D$ 个形状 × 每个 $Dq$ 点）；用伴生论文附录 A 的暴露界（A.3）与固定时刻集中（A.2），$u=q^{3/2+\epsilon}$ 得 $\exp(-q^{2\epsilon}/(32D^5))$ 型尾。线计数 $|X^\ell\cap\ell|$ 的增量只 $2D^2$（每个形状交线 $\le D$）。精确-$\ell$ 恢复的点期望 $\le D$（假设 3）。$q(q+1)$ 条线联合。

**层 2 tuple 事件**。$t=\lceil A\log q\rceil$ 条线的有序两表，可行 = 跨交点集 $P_0$ 恰 $t^2$ 个不同有限点 + 每个非表线形状交 $P_0\le H_0=2Dh$ 点（$h=10(D+1)$）。断言每个可行 tuple 有 $\ge\delta t^2/2$ 个跨交点幸存。证明就是第 4 节的 Freedman：$\mathbb E Y_0\ge\delta t^2$、$|Z_i|\le2C_0$（$C_0=DH_0$）、$\mathbb E(Z_i^2|\cdot)\le C_0^2Dt^2/q$、$c_0=\min\{\delta^2/(16D^2C_0^2),\delta/(16C_0)\}$ **不依赖 $A$**。联合界 $(q(q+1))^{2t}$ 配 $e^{-c_0t^2}$：对数 $(-c_0A^2+4A+o(1))(\log q)^2$，任意 $A>5/c_0$ 即可。

**层 3 确定性论证（两段并发分析）**。固定实现，从冒犯覆盖删去真的被列为删除形状的线（clean），余集 $L$ 仍盖 $X$ 除 $\le2q$ 点。计数给 $m=q-O(q^{1/2+\epsilon})$、$E_L=\sum_x(n_x-1)_+=O(q^{3/2+\epsilon})$。$2q$ 这个余量是**平衡**出来的：它允许 $E_L$ 的重复计数上界，更小的余量会让低并发的轻点贡献失控。

- **低并发**（$R=\max_p n_p\le q^{1/2+\kappa/4}$）：轻点（$n_x<T=q^{1/2-\kappa/3}$）有序对贡献 $O(q^{2-7\kappa/30})$；重点集 $|P|\le E_L/(T-1)\le q^{1+\kappa}$，incidence 定理压到 $\sum_{x\in P}n_x\le q^{3/2-\kappa}$，贡献 $\le q^{2-3\kappa/4}$。均匀抽 $2t$ 条线，跨对交在 $X$ 的期望 $o(1)$。可行性退化（平行对、三线共点）概率 $O((\log q)^3q^{-1/2+\kappa/4})=o(1)$。形状违反：贪心抽 $h$ 个互不共位置的跨对，种群 $\le mDR$，求和 $O((\log q)^{2h}q^{D-h(1/2-\kappa/4)})=o(1)$，因为 $h=10(D+1)$ 使指数严格负。
- **高并发**：第一表从过 $p$ 的 $R$ 条线抽、第二表从补集（$\ge\rho q/2$ 条）抽。跨对交在 $X$ 的数量至多 $E_L$，占比 $E_L/(RN)=O(q^{-3\kappa/20})=o(1)$。退化 $O((t^2+t^3)/R)$。形状违反 $O((\log q)^{2h}q^{D-h(1/2+\kappa/4)})=o(1)$，这里 $h$ 只需 $>D/4$ 级，比低并发宽裕。

**层 4 矛盾与选择顺序**。两情形都在固定实现内找到可行 tuple，其跨交幸存 $<\delta t^2/2$；但 $L$ 中无线被列为删除形状，忽略其表线不改变实现里的任何删除，与层 2 矛盾。

**选择顺序是整个随机论证合法性的枢纽**，我在原文里专门写了一段：事件先对一切可行 tuple **同时**建立，再暴露删除，再谈覆盖的存在，"Sampling from $L$ is used only to prove the existence of a tuple inside that fixed realization. No concentration estimate is conditioned on the choice of the cover." [推测] 这个结构就是为形式化预备的：Lean 里它对应"概率界无条件成立，应用时再取实现"的规范次序。

### 5.3 [推测] 失败路线

1. 把"试验间独立"放松为"形状间独立"：增量界其实还对，但假设 1–3 的验证需要整体概率计算，真正的死穴是 2.4 selection 需要的"试验内条目独立"不成立处。
2. 若 $\rho$ 依赖 $q$（如 $q^{-\eta}$）：高并发补集 $N\ge\rho q/2$ 太小，$E_L/(RN)$ 指数 $\epsilon-\kappa/4+\eta$ 变正。这就是后来在环境池里把 $\rho=\delta/10$ 定成固定比值的原因。
3. tuple 长度取常数：联合界 $q^{O(1)}$ 对常数尾，无法收敛；$t\gg\log q$ 则退化概率失控，$A$ 固定是真正的约束。

## 6. gadget 引理：$f(x,y)=(x^3,y)$ 的第一性理由

这是全文的刚度黑箱。$Y=\mathbb F_s^2\setminus\bigcup_{d\in\mathbb F_s^*}\ell_d$：在每个非零斜率的平行类里均匀随机删一条线。三组结论：

1. 原坐标：每条非删除线含 $\ge5$ 个 $Y$ 点；
2. 新坐标 $f(x,y)=(x^3,y)$（$s\equiv2\pmod3$ 时 $\gcd(3,s-1)=1$，立方是置换）：每条线含 $\ge s/8$ 个 $f(Y)$ 点；
3. 刚度：$a$ 条线 + $b$ 个单点盖 $f(Y)$ 且 $a+b/2\le s$ 时，必须 $a=s$、$b=0$、线是完整平行类；特别 $\le s$ 条线的覆盖不含两条不平行线。

**$f$ 存在的第一性理由**（这是我事后最想记录的一点）：若直接对 $Y$ 证刚度，原坐标下删除形状就是线，"精确列出 $\ell_d$"的概率是 $1/s$ 量级非零，小覆盖可以是"删掉的那批线附近"的琐碎覆盖，刚度不真。$f$ 的作用正是把删除线**弯成曲线** $F_{d,z}=\{(x^3,dx+z)\}$：曲线与任何线至多交 3 点（竖线由立方双射、水平线由 $d\ne0$、斜线是非零三次多项式方程），于是 linecover 的"精确命中概率"假设在新坐标下自动满足（为 0），刚度才成为可能。同时 $f$ 必须保持水平、竖直两个平行类（例外边同组相交要用），$\deg$ 更大的置换多项式给更高的交线数 $D$，linecover 的指数预算 $D-h(1/2-\kappa/4)$ 有变号风险；线性 $\phi$ 则失去曲线性质。三次是**最简单的同时满足"置换 + 保两轴 + 曲线化"的非常值选择**。

原坐标存活：固定线 $\ell\ne\ell_d$，$\mu=s(1-1/s)^{s-2}$，改一个选择改变幸存数至多 2，暴露鞅 + A.2/A.3 给 $\Pr(Z_\ell<\mu/2)\le\exp(-\Omega(s))$；$\ell_d$ 与 $\ell$ 平行、reinstate 后计数不变。$\ge5$ 对大 $s$ 由 $\mu/2\ge5$。

新坐标存活：形状 $F_{d,z}$ 共 $s(s-1)$ 个、每点删除概率恰 $1/s$，存活率 $\delta_s=(1-1/s)^{s-1}\ge1/4$；linecover（素域 $\mathbb F_s$，子域假设自动成立）取 $D=3$、$\delta=1/4$、$\rho_0=1/100$ 给"每线 $\ge s/8$ 点"（$\frac12\times\frac14$ 两个常数的乘积）与"小覆盖几乎铅笔"。

**几乎铅笔 ⇒ 完整平行类**：共点线 $\ge(1-\rho_0)s$ 条（中心 $p$），预算压到 $b\le2\rho_0s$；若过 $p$ 的某条仿射线缺席，共点线盖它 $\le1$ 点、余下线盖 $\le\rho_0s$、单点资源 $\le2\rho_0s$，合计 $1+3\rho_0s<s/8$，与该线 $\ge s/8$ 点矛盾。故过 $p$ 的仿射线全在场：$p$ 有限要 $s+1$ 条超预算；$p$ 在无穷远恰是完整平行类，预算强迫 $a=s$、$b=0$。

**常数 5 不是任意的**：它被终局"外部点"情形精确消耗，每条删除线释放 5 条未覆盖例外边、每个附加顶点至多盖 5 条，$5(h_p-1)<5h_p$ 差 1 就是矛盾。任何 $\ge1$ 都够，5 给容差。加权 $\frac12$ 的点代价则是使"内部点"情形能用 $2+(h_p-1)\le s$ 的**线数**预算覆盖 $f(Y)$、同时使双组情形的 $a_i+b_i'/2$ 记账能与 $|C\setminus F_p|$ 直接比较，两种记账的最粗公共单位。

存在性兜底：$\equiv2\pmod3$ 的素数无限，两行证明：$3P-1$ 有一个 $\equiv2\pmod3$ 的素因子且不整除乘积 $P$。

## 7. selection 定理：从独立池里选相容平移

### 7.1 陈述与 domination 证书

每组 $i$（$\le Dq$ 个）有 $|W_i|\le D$ 的形状、$\le D$ 的方向表 $D_i$，每方向至多属 $D$ 个 $D_i$；冲突 = 平移后存在 $u,v,d$ 使差落进 $d$。每池独立抽 $K$ 个均匀平移，w.h.p. 能各选一个使全族无冲突，且**一致 over 所有数据**。

核心是 Haxell 型独立横截的弱化版：无独立横截 ⟹ 存在非空 $I$ 与 $|T|\le2(|I|-1)$ 的 $T$ 支配 $\bigcup_{i\in I}A_i$。证明是增长式：包含极小的亏缺子族，反复"取无 $T$ 邻居的新点、在保持旧等式的 $U$ 中最小化邻居交"得新 $Y_{j+1}$；非空性的两个来源（$x_{j+1}\in A_*$ 时直接拼接矛盾；否则其部含 $Y$ 中唯一顶点 $y\in Y_b$，换入 $U'=(U\setminus\{y\})\cup\{x_{j+1}\}$ 后第 $b$ 步的最小化被违反），原文注记"the contradiction uses only the equalities preceding stage $b$; preservation of later equalities is not required"是我写论文时被卡住后想清楚的：交换论证只要保**旧**等式，$b$ 之后的等式反正要重建。

我选 Haxell 路线（，并非直接 LLL）的原因：LLL 的依赖度 $O(DK)$、坏概率 $O(D/q)$ 需要 $ep(DK+1)\le1$ 即 $K=O(1)$，看似可行但给不出"一致 over 所有数据"的收敛率，且 conflict 事件的概率在 $m$ 大时不再独立有界；证书计数给显式联合界，[推测] 也便于 Lean 复现。

### 7.2 两段失败概率

**小范围** $m\le c_1q$：禁忌方程（固定核为 $d$ 的泛函 $\pi_d$）每候选-每目标至多 $C=2D^3$ 条（$|W_i|\cdot|W_j|\cdot|D_i\cup D_j|$ 的三重积，$D^3$ 的出处）；条件在 $T$ 的平移后新平移不可行概率 $\le2Cm/q\le1/2$；支配概率 $\le(2Cm/q)^{(K-2)m}$，配证书计数 $(eDq/m)^m\cdot(C_*K^2)^m$，合并成 $[2CeDC_*K^2\,2^{-(K-3)}]^m\le(1/2)^m$，$K$ 的第一条约束。

**大范围** $m>c_1q$（可行密度）：目标 $\Pr[\sum_{i\in I}|U_i^{\mathrm{fin}}|<\delta_1mq^2]\le\exp(-\Omega_D(q\log q))$，其中 **$\delta_1$ 不依赖 $K$**，这是全文最微妙的常数解耦。机制：$T$ 切成 $J_0=\lceil4D/\alpha+1\rceil$ 个块（$\alpha=1/(2C)$）；块内条目 $e$ 的损失 $Z_e=Z_e^{(1)}+Z_e^{(2)}$，源方向项的方差是切片方差 $V_{i,d}=\frac1q\sum_{\ell\parallel d}(|U_i\cap\ell|-|U_i|/q)^2$，而**仿射二阶矩恒等式** $\sum_dV_{i,d}=|U_i|-|U_i|^2/q^2$（对全部 $q+1$ 个方向、无任何随机性/特征/子域假设，伴生论文 Lemma A.1）把所有方向的方差一次性兜住。能量记账用"每方向至多属 $D$ 个源表"得 $\sum A_e\le KDmq^2$；规则条目（$A_e\le mq^{3/2}$）Chebyshev 给 $B_{D,\gamma}q^{-1/2}$ 的超阈概率（$B_{D,\gamma}$ 不依赖 $K$），块递推 $M'\ge\frac12M-(\alpha+2C)\gamma mq^2$，取 $\gamma$ 使 $2(\alpha+2C)\gamma\le2^{-J_0-1}$，$\delta_1=2^{-J_0-1}$。

**$\delta_1$ 与 $K$ 解耦的理由**：$K$ 要先于 $q$ 固定（selection 的输出 $K$ 是 placement 的输入），而失败概率指数 $K\delta_1$ 必须压过证书计数系数 $A_K=(eD/c_1)C_*K^2$ 的增长。若 $\delta_1$ 隐含依赖 $K$，$A_Ke^{2-K\delta_1}<1/2$ 可能无解。最后"未用候选的指数收益"：$\exp(-(K\delta_1-2)m)$，取 $K$ 满足第二条约束即收。

[推测] 失败路线：若 $|W_i|$ 允许依赖 $q$（本文用法 $s^2$ 固定，$D$ 吸收它），$C$ 不再常数，小范围指数失效；若池大小 $K$ 想依赖 $q$，大范围的 $\exp(O_{D,K}(q))$ 与密度失败的 $\exp(-\Omega(q\log q))$ 同阶，"池固定、次数 $\to\infty$"的渐近结构不可简化。

## 8. 环境放置：陪集组、池性质、确定性转移

### 8.1 组结构

陪集代表 $\Lambda\subseteq\mathbb F_q^*/\mathbb F_s^*$、$\mathcal I=\Lambda\sqcup\{*\}$、组数 $N_q=(q-1)/(s-1)+1=O_s(q)$。普通组 $\lambda$：$M_\lambda(x,y)=(x,\lambda y)$，改动方向 $S_\lambda=\lambda\mathbb F_s^*$（$s-1$ 个）。组 $*$：$M_*=\begin{pmatrix}1&1\\u&v\end{pmatrix}$（$u\ne v\ne0$），其有限斜率像是 $(u+vt)/(1+t)$，把 $s-1$ 个子域斜率**恰好**映到 $S_*=(\mathbb F_s\cup\{\infty\})\setminus\{u,v\}$。于是每个环境方向属一或两个 $S_i$，重复只发生在组 $1$ 与 $*$ 之间。相容用 $D_i=S_i\cup A_i$（$i=1,*$，加两条轴）或 $S_i$，特别 $D_1=D_*=\mathbb P^1(\mathbb F_s)$。

$(u,v)$ 的选取（$u,v\ne0$、$u\ne v$）不是随意的：$M_*$ 退化（不可逆）或 $S_*$ 大小错都会破坏"每方向至多两组"，进而双组终局的轴封口断掉。$u,v$ 从 $S_*$ 剔除、进 $A_*$，使组 $1$ 的轴方向被组 $*$ altered，这是终局 z=2 情形"轴资源不外溢"的前提。

### 8.2 删除清单与池性质

每个候选（组 $i$、平移 $b$）的删除线 = 方向在 $S_i$ 中、含 $Y_{i,k}$ 点的环境线：拉回子域后，方向 $M_i(t)$ 的删除线恰是"截距 $\ne a(t)$"的 $s-1$ 条，故每方向恰 $s-1$ 条、每条 $\ge5$ 个 $Y$ 点（gadget），合计 $(s-1)^2$ 条。

池性质（全池删除的幸存集 $X_{\rm pool}$）：$\delta=\exp(-4K(s-1))$（由 $\log(1-t)\ge-2t$、$N_q\le2q/(s-1)$、$m/q\le1/2$ 链出）、$\rho=\delta/10$；(1) $\le q$ 条线的覆盖含 $\ge(1-\rho)q$ 条共点；(2) 忽略精确 $\ell$ 后每线存活 $\ge\delta q/2$；(3) **5 组性质**：对 $p\notin\ell$，至多 5 个组有候选含 $y\in\ell$ 使 $py$ 方向 $\in S_i$。验证：组级概率 $\le(s-1)s^2/q^2$，6 组联合界 $(KN_q)^6$ 种选择 × 固定 $(p,\ell)$ 概率 $O(q^{-6})$，$(p,\ell)$ 至多 $O(q^4)$ 对，失败 $O(q^{-2})$。

**5 组性质的常数 5 是 gadget 的"每线 5 点"的镜像**，两者必须匹配（见 2.10 外部情形）。[推测] 若组数不是 $O_s(q)$，是更高次（比如对每个仿射子平面都放一组），联合界变 $O(q^7)$ 量级，失败概率不再趋零，陪集分解 $\mathbb P^1(\mathbb F_q)=\bigsqcup S_i$ 恰是极小方案。

### 8.3 转移：先全池、后选择、再包含

selection 给无冲突选择；与池性质**取交**（不需要独立性，"No independence between these events is needed"，两个事件各以概率 $\to1$，交非空）。选中删除线之并 $B$、幸存集 $X$。转移是两个方向的**确定性包含**：

- $X\supseteq X_{\rm pool}$（选中 ⊆ 全池）⇒ 池级"几乎铅笔"对 $X$ 成立；
- 反向：$\ell\notin B$ 时忽略精确 $\ell$ 后每个选中删除线仍是池成员，故 $|X\cap\ell|\ge\delta q/2$。

原文强调包含是确定性的："it holds even if $\ell$ occurs in an unselected candidate and even though the selected shifts depend on the whole pool."[推测] 若把顺序改成"先选择、再对选中集跑 linecover"，删除过程不再是独立试验的乘积律（选中依赖所有平移），假设 1–3 无法验证，这个顺序是唯一自洽的。无冲突性给分离蕴含 (con-separation)：$i\ne j$、$\ell$ 方向 $\in D_i$、$\ell$ 碰 $P_i$ ⟹ $\ell$ 不碰 $P_j$；特别 $P_i$ 两两不交（零差属每个方向）。

## 9. 装配：顶点、边、相交性

顶点：普通 = 环境仿射线本身；特殊 = 组 $i$、方向 $d\in S_i$、子域截距三元组 $v_{i,d,L}$。部 = 方向。普通边 = 幸存点 $x\in X$ 的点边；例外边 $e_{i,w}$（$w\in Y$，基点 $y_{i,w}=b_i+M_iw$）：$d\in S_i$ 时取特殊标签（按 $f(w)$ 所在子域线 $L_{t_i(d)}(f(w))$），$d\notin S_i$ 时取普通标签 $o_{\ell_d(y_{i,w})}$。

**双坐标在这里第一次咬合**（普通×例外款）：例外基点 $y$ 落在每个 $S_i$ 方向的一条删除线上（故 $y\notin X$）；$x\in X$ 与 $y$ 的连线若有方向 $\in S_i$ 就是删除线、含 $x$、矛盾，于是连线是普通线，其普通标签同时属于两边。删除按 $y_{i,w}$ 记账、相交在 $f(w)$ 的标签下读出、普通标签兜底。

同组例外×例外：$f$ 保两轴，连线水平/竖直时原坐标相等、共享 $A_i$ 方向的轴标签；连线斜率 $t$ 有限非零时共享子域线 $L_t(f(w))$ 的特殊标签。这就是 $f$ 必须恰好保持**两条**平行类的最小需求；[推测] 若 $f(x,y)=(x^3,y^3)$（保零条）或任意不保轴的置换，同组相交断裂。跨组：基点不同（con-separation），连线方向避开 $D_i\cup D_j\supseteq S_i\cup S_j$，普通标签兜底。

特殊顶点带**组戳**（$v_{i,d,L}$ 只在同组边出现），这是跨组互异的来源；$|S_i|=s-1\ge2$ 使同组内两个 $S_i$ 方向的特殊标签定出 $f(w)$。$s>5$ 在多处隐式使用（$5$ 点性质、$s/8>1$）。

## 10. label-action 与终局三情形

### 10.1 顶点对小平面坐标的作用

固定组 $i$，"位置"= 例外边的参数 $e_{i,w}\leftrightarrow f(w)\in f(Y)$：特殊顶点（己组）盖一条子域线上的全部位置；$S_i$ 方向的普通顶点盖零个；$A_i$ 轴方向的普通顶点盖一条 $f$-坐标水平/竖直线上的位置；其余方向普通顶点至多盖一个。Lean 里我把论文的三分条款**合并成二分法**：`LineCapable`（线资源）/ 非（点资源，各盖一个 $f$-像），"线型给线、点型给点"正是接上 gadget 加权预算 $a+b/2$ 的接口。

### 10.2 强制引理

反设 $|C|\le q$ 的覆盖。特殊顶点不在任何普通边（`specialVertex_notMem_ordinaryEdge`），普通顶点读作仿射线后盖 $X$，更盖 $X_{\rm pool}$，池性质 (1) 给射影点 $p$ 使 $C$ 中 $\ge(1-\rho)q$ 个顶点过 $p$。强制引理：$p\in\ell$、$\ell\notin B$ ⟹ $o_\ell\in C$。证明：若缺席，过 $p$ 的其余线至多盖 $\ell$ 的 1 点、pencil 外 $\le\rho q$ 个顶点各再盖 1 点，$|X\cap\ell|\le1+\rho q<\delta q/2$（$hgap:1+\rho q<\delta q/2$ 由 $q>\lceil10/\delta\rceil$ 保证），与转移的 (2) 矛盾。记 $F_p$ = 被强制顶点，预算余量 $|C\setminus F_p|\le q-|F_p|$。$F_p$ 不盖任何 $I_d$ 组（$d\in S_i$）的例外边。

### 10.3 情形一：$p$ 在无穷远

$d$ 属于 $I_d=\{i:d\in S_i\}$、$z=|I_d|\in\{1,2\}$（重复只发生在组 $1,*$ 之间）。$|C\setminus F_p|\le z(s-1)$。

- **$z=1$**：该组例外位置被 $\le s-1$ 个附加顶点覆盖；每个顶点效果可并入一条子域线 ⇒ $f(Y)$ 被 $\le s-1$ 条线覆盖，直接违反 gadget。
- **$z=2$**：加权记账。每组的线资源 $a_i$（己组特殊顶点或轴方向普通顶点）、点资源 $b_i'$（各盖一个位置），gadget 给 $a_i+b_i'/2\ge s$。合并：特殊顶点只在己组记账；轴顶点碰 $P_i$ 由 con-separation 不碰 $P_j$、连"作为 $j$ 的点资源"都不可能；其余顶点对每组至多贡献 $1/2$。于是 $2s\le a_1+\frac{b_1'}2+a_*+\frac{b_*'}2\le|C\setminus F_p|\le2(s-1)$，矛盾。

[推测] 若两组的轴方向不落入对方 $D$，轴顶点会被二次计数，不等式少一项、矛盾消失。$(u,v)$ 的安排 + $D_1=D_*=\mathbb P^1(\mathbb F_s)$ 恰好封住这条路，这也是为什么 $S_*$ 剔除的恰好是 $u,v$ ，并非别的斜率。

### 10.4 情形二：$p$ 有限、$p\in P_i$（唯一组）

$h_p$ = 过 $p$ 的选中删除线数；$|F_p|=q+1-h_p$、$|C\setminus F_p|\le h_p-1$（"$-1$"：$q+1$ 个强制顶点 + 预算 $q$；$h_p=0$ 直接爆）。**$h_p\le s-1$**：过 $p$ 的删除线全来自组 $i$（他组删除线若过 $p$，方向属 $D_j$ 而碰 $P_i$，违反 con-separation），且每方向至多一条。强制顶点对该组位置的覆盖落在两条轴线上（$S_i$ 方向普通顶点盖零、位置基点的连线方向 $\in S_i\cup A_i$），$f$ 保两轴 ⇒ 被覆盖位置含于过 $f(w_p)$ 的水平与竖直线。剩余位置由附加顶点并入子域线。于是 $f(Y)$ 被 $\le2+(h_p-1)\le s$ 条线覆盖且含两条不平行坐标线，违反 gadget。轴线的合法性不依赖轴线本身是否被强制："These are legitimate covering resources whether or not their ordinary labels belong to $F_p$."

[推测] 若 $h_p=s$：$2+(h_p-1)=s+1>s$，约束失效。防线是"组内饱和"：$p\in P_i$ 时**任何**过 $p$ 的删除线必属组 $i$，若允许两组的 $P$ 相交，$h_p$ 可达 $2(s-1)$，论证崩溃。con-separation 的两两不交就是为这条防线服务的。

### 10.5 情形三：$p$ 有限、$p$ 在所有 $P_i$ 之外

每组删除线至多一条过 $p$（同组两条则拉回子域得非奇异线性方程组、解在 $\mathbb F_s^2$、$p\in P_i$ 矛盾）；跨组不重合。故 $h_p$ 条删除线来自 $h_p$ 个不同组，每组在其贡献线上取 5 个 $Y_i$ 点 ⇒ $5h_p$ 条互异例外边，且**都不被 $F_p$ 覆盖**（其与 $p$ 的连线恰是本组贡献删除线、方向对该组 altered）。反向收账：每个附加顶点至多盖 5 条，特殊顶点只在己组（至多该组 5 条）；过 $p$ 的普通线一条也盖不到；不过 $p$ 的普通线每组至多碰一条贡献线，而"每组这样的 $y$"被 5 组性质压到 5 个组。预算 $h_p-1$ 个顶点至多盖 $5(h_p-1)<5h_p$，矛盾。

这里有个隐式两分：5 组性质是对 $p\notin\ell$ 成立的；过 $p$ 的覆盖线不适用，但它们已被"唯一连线 = 删除线、方向 altered"单独处理。[推测] 这个分岔我写论文时没有显式列出，是 Lean 的覆盖计数逼我把它说清的。

三种 $p$ 穷尽一切射影点 ⇒ 无 $\le q$ 覆盖 ⇒ $\tau\ge q+1$；任一边是 $q+1$ 元覆盖 ⇒ $\tau=q+1$。对每个合格 $s$ 选一个成功 $Y$，$n_0(s)$ 的存在性靠"每个固定常数要求只吃掉有限门槛"的积累，不给出数值。

## 11. Lean 镜子：形式化暴露了什么

### 11.1 登记与总体

一篇论文、**两个** comparator 条目：A（RyserCovering，`exists_prime_eventually_counterexampleRank`）与 B（RyserOddExtensions，`eventualOddFailures_and_infinite`）。全 Ryser 目录（9 子目录 + 根两文件，200 文件 / 27012 行）grep `^axiom` 为 0、`sorry` 为 0；permitted axioms 恰为 propext / Quot.sound / Classical.choice 三项标准配置。Lean 4 + Mathlib 固定版本。

模块链自底向上：Geometry(13 文件)→Hypergraph(5)→Field(4)→Incidence(28)→LineCover(42)→Probability(9)→Selection(35)+Domination(10)→Construction(64)。对照论文：Incidence 1 节 vs 28 文件、Selection+Domination 1 节 vs 45 文件，细分的轴线恰好沿"论文一句话、展开要一页"的缝。

### 11.2 两条 main 定理的强弱

条目 A 是 **∃-变体**：`∃ p, p.Prime ∧ 5 < p ∧ p % 3 = 2 ∧ ∃ N, ∀ n ≥ N, n.Prime → 2 < n → CounterexampleRank (p^n+1)`，只造**一个**素数、只对**素**次数。否定 Ryser 只需一个秩，这是最小充分版本。条目 B 反而**强于论文文字**：一致素数门槛（$P=Q+N+2048$ 在选素数之前确定）+ 任意**奇**数次 + 输出 `ExplicitFailureAt r` 把违反条款 `(r-1)*matchingNumber < coverNumber` 显式写成定义的一部分（论文只是文字）。

奇次数的关键强化在 `subfield_degree_data_of_odd`：论文对奇数 $n$ 的子域论证是一段文字；Lean 从实际基数等式逐条抽出 $d\mid n$、$3d\le n$、$|S|=p^d$。且 API 两套并存，素数次的 `extensionField_properSubfield_cube_le` 与奇数次的 `..._of_odd`，[推测] 说明形式化先做素数次、后按论文主张加固。

### 11.3 只在 Lean 里暴露的细节（选录）

1. **$\kappa$ 固定为 $10^{-10}$**（`savingExponent := 1/10000000000`），`LargeEnough` 里出现指数 **127942**、527，论文的 $q^{o(1)}$ 吸收在 Lean 里被兑换成显式指数核算：$A U^a(9\cdot2^{58}U^{39})^b(2^{23}(\cdot)^{24})^c$ 化成 $U^{a+39b+936c}$，要求 $\kappa(a+39b+936c)<1/2$；$936=39\times24$ 是抽取-标量-子域三层复合的指数代价。
2. **概率的显式有限模型**：没有测度论，`FiniteLaw Ω` 是权重函数、`pi` 是乘积律，一切 w.h.p. 是对固定 $|F|$ 的显式概率不等式，阈值 $Q$ 由 `Classical.choose` 从实数 eventually 里提出，量词次序被强制规范化为"对每个满足 $Q\le|F|$ 的域逐一成立"。
3. **三个 1/4 的会计**：gadget 与池的存在性都是"三事件各以概率 $\ge3/4$ ⇒ 交非空"（`prob_mono`+`prob_union_le`+`linarith`）；`exists_goodAmbientPool_uniform` 的阈值 $Q=QS+QL+QT+2(s-1)^2+\lceil10/\delta\rceil+1$ 把选择、linecover、池薄三个独立阈值与 gadget 门槛、强制缝隙**加总**，论文只有一句 asymptotic。
4. **2048**：原坐标尾 $\exp(-q/2048)$，$128(s-2)$ 分母的保守化；门槛 `2048 ≤ p` 在素数搜索里与代数门槛**合并**（搜到 $B+Q+N+2048$ 以上）。
5. **`DominationTrace`**：论文的"过程必停"文字论证变成自然数归纳上的长度矛盾（`htraces (Fintype.card V + 1)` vs `length_le_card`），交换论证（Exchange）单列。
6. **可判定相等实例问题**：`hdec : instDecidableEqConfigurationGroup σ = inferInstance := Subsingleton.elim _ _`，顶点类型 `Vertex` 的成员资格命题依赖实例参数，实例不匹配时命题字面不同。**论文完全隐去这一层**。
7. **`two_group_resource_budget_impossible`** 是带 11 个假设参数的纯算术组合引理，论文里它是 "Summing \eqref{con-two-group-lower}, we obtain…" 一行。
8. **`LineCapable` 二分法**替代论文三分条款（第 2、3 条合并）；`lineResources_disjoint_other_of_axis_subset` 需要的 `axes i ⊆ altered j` 由 `shared_groupAltered_axes_subset` 提供，论文一句括号带过，Lean 是 `GroupPlacement.lean` 60 行枚举。
9. **`linecoverFailureBound` 显式公式**：两个尾界加总成一个函数并证趋于 0；论文的 $O_D(\cdot)$ 全部落地（$h=10(D+1)$、$t=\lceil A\log q\rceil$、$c_0'=\text{tupleTailConstant}$）。

### 11.4 缺口与替代

唯一形式化缺口：**树覆盖推论 cor:tree-cover 未形式化**，图染色/连通分量参数计数与超图构造正交，是另一套基础设施。[推测] 若要补，染色侧需要"沿颜色 $i$ 路径 $x_i$ 不变"的抽象图论化。其余全部覆盖：顶点互异性被做进类型（`AffineLine F ⊕ (Σ i, {d // d ∈ altered i} × k)`，`vertexPart` 全函数），论文"all vertices are formal labels"的地方在 Lean 是数据结构设计；`GoodLineCover` 把结论 1 编码进谓词（连体结构 vs 论文的并列两行）；删除形状族两处都用线的全集。

### 11.5 论文 ↔ Lean 差异总评

所有 w.h.p. 被规范化为"显式有限概率律 + 数值阈值 $Q$"；所有 $O(\cdot)$、$o(1)$ 被规范化为显式常数（$\kappa=10^{-10}$、$c_0=2^{-57}/9$、$h=10(D+1)$、$\delta=\exp(-4K(s-1))$、$\rho=\delta/10$、$\rho_0=1/100$、2048、127942、527）。未发现 Lean 陈述弱于论文且论文依赖该强度的地方，反而条目 B 强于论文主定理的文字。潜在弱点逐条对照后全部消失：linecover 清洗后 coverPencil 计数（`cleanLines` 机制）、$\delta_1$ 不依赖 $K$（`densityRate D` 独立常数）、双组轴不外溢（`lineResources_disjoint_other_of_axis_subset` + `shared_groupAltered_axes_subset`）。

## 12. 树覆盖推论（论文侧收尾）

取 $H$，顶点集 = $E(H)$ 成完全图；对超边对 $e,f$ 选一个下标 $i$ 使 $x_i(e)=x_i(f)$（交性保证存在；多部相交只选一色）染色 $i$。沿颜色 $i$ 的路径 $x_i$ 不变，故每个连通单色子图决定一个属于其所有超边的 $V_i$ 顶点；$t$ 个子图盖 $K$ ⟹ $t$ 个超图顶点盖 $H$ ⟹ $t\ge\tau(H)=r$。反方向：固定一个中心，$r$ 个单色星（允许单点）覆盖。最小值恰 $r$，Gyárfás 的 $r-1$ 猜想在这些秩失效，Milićević 有界直径强化与 DeBiasio 等的 $\alpha=1$ 情形同时被否定（$\alpha(K)=1$）。

## 13. 常数总表（按引入顺序）

| 层 | 常数 | 值 | 机械角色 | Lean 落点 |
|---|---|---|---|---|
| 域 | $s,n,q,u,v$ | $s\equiv2(3)$ 大素数；$n$ 大奇数；$q=s^n$；$u\ne v\ne0$ | $\gcd(3,s-1)=1$；子域 $\le q^{1/3}$；组 $*$ 参数 | `5<p, p%3=2, Odd n, exists_distinct_nonzero` |
| gadget | $f,Y,5,s/8,D,\delta,\rho_0,2048$ | $(x^3,y)$；$\mathbb F_s^2\setminus\bigcup\ell_d$；$D=3$；$\delta=1/4$；$\rho_0=1/100$ | 刚度黑箱 | `cubeMap, retainedPoints, OriginalLineDensity, exp(-q/2048)` |
| incidence | $\kappa,c_0,H,d,V,C_m,K$ | $10^{-10}$；$1/(9\cdot2^{57})$；$16U^3q^{1/2}$；$q^{1/2}/(8U^2)$；$\frac{2}{c_0}U^{39}$；$(13\cdot3^m-5)/2$；$2^{23}V^{24}$ | 一致节省 | `savingExponent, witnessConstant, graphScale, expansionScale` |
| linecover | $h,H_0,C_0,t,c_0',2q$ | $10(D+1)$；$2Dh$；$DH_0$；$\lceil A\log q\rceil$；$\min\{\ldots\}$ | 抽样分析 | `10*(D+1), logarithmicSampleSize, tupleTailConstant, linecoverFailureBound` |
| selection | $K,C,c_1,\alpha,J_0,\gamma,\delta_1$ | $K(D)\ge6$；$2D^3$；$1/(4C)$；$1/(2C)$；$\lceil4D/\alpha+1\rceil$；$2^{-J_0-1}$ | 池选择 | `compatible_selection_uniform, densityRate` |
| 放置 | $m,\delta,\rho,5,QF$ | $(s-1)^2$；$\exp(-4K(s-1))$；$\delta/10$；$\lceil10/\delta\rceil+1$ | 池性质 | `deletedLines, ambientDeletionDelta, PoolThin ≤5, QF` |
| 终局 | $hgap,z,h_p,5h_p$ | $1+\rho q<\delta q/2$；$\le2$；$\le s-1$ | 三情形收支 | `hgap, groupAltered_multiplicity_le_two, card_deletedPencil_le_..., not_isCover_of_finite_outside` |

## 14. 可信度审查

- 论文侧罕见的完整：中间量（$c_0$、$2^{20}V^{22}$、$19/4$ 型指数）全部显式，无明显跳步；选择顺序在 linecover、selection、placement 三处重复声明且一致；两个外部依赖（伴生论文附录 A、BKT/Gowers/Haxell）明确引用。
- Lean 侧零公理零 sorry；两条 main 定理组装完成，∀-版含显式违反条款；唯一缺口是树覆盖推论；Lean 陈述全面朝"更规范"方向，条目 B 强于论文文字。
- 我自己的三个疑点对照后：低并发指数 $D-h(1/2-\kappa/4)<0$ 的裕量其实很大（$1/10$ 不是紧界），【存疑已消】；$\delta_1$–$K$ 解耦是最脆弱的环节，Lean 把它做成独立常数后确认成立；情形三的"过 $p$/不过 $p$"两分在 Lean 的覆盖计数里被显式处理。

## 15. 倒推锚点（若我重写这段研究史，悬念布在哪）

1. 平行类障碍，为什么经典构造永远卡在 $r-1$（第 1 节末）。
2. 为什么必须"小域造构形、大域铺开"，并非直接改素平面（第 0 节，[推测] 标注）。
3. $f$ 为什么是三次，曲线化的第一性理由（第 6 节）。
4. $2K^3$ 从哪来，下游反推上游（第 3.2 节）。
5. Azuma 为什么不够，稀有性变现（第 4 节）。
6. 选择顺序为什么是合法性枢纽（第 5.2 节）。
7. $\delta_1$ 与 $K$ 的解耦（第 7.2 节）。
8. $(u,v)$ 的安排封双组的口（第 8.1、10.3 节）。
9. 常数 5 与 5 组性质的镜像匹配（第 6、8.2、10.5 节）。
10. Lean 为什么出现两个条目、为什么 B 强于论文（第 11.2 节）。

## 16. §0 补记：语料精确路径与队列行号

本篇正文唯一来源：`preprints/A-Counterexample-to-Rysers-Covering-Conjecture-September-23-2026`，build 目录 `E:\math\preprints\A-Counterexample-to-Rysers-Covering-Conjecture-September-23-2026\build\` 下五份 `.tex`：`paper.tex`、`incidence.tex`、`linecover.tex`、`selection.tex`、`construction.tex`；`references.bib` 只登记存在性，不进入正文；typst 分片不作来源。日期后缀 `-September-23-2026` 逐字保留。队列行号：`E:\math\.tools\lean_queue.txt` 第 09 行（1-based，`grep -n "Ryser"` 按目录名定位唯一命中本篇）。同一篇判定依据：笔记标题行的对象名与该目录名逐字符对应，日期 2026-09-23 与后缀一致，主定理形状 $q=s^{n}$、$n$ 走大奇数、$\tau(H)=q+1$ 与第 0 节陈述吻合；逐行锚点在后面台账补表按 `文件名:行号` 给出，全部回原文核实。排除候选：preprints 里另有 `Balanced-Counterexamples-to-Rysers-Conjecture-at-Prime-Orders-September-27-2026`，即第 0 节提到的姊妹篇平衡版（每部恰 $q+1$ 点、逐素数独立设计、$q$ 取大素数），与本篇的 $s^{n}$ 奇次数结构和双坐标 gadget 无共享章节，判定为另一篇，排除。

## 17. 起点处的三条死路：被我自己走回去的路线

第 0 节说格局被平行类障碍定死：$\tau=q=r-1$ 已被经典构造达到，我只要把覆盖数再抬一格，且要在 $r=q+1\to\infty$ 的无穷多秩上抬。这一节补记抬格过程中走回去的三条路，论文里只留活着的那条，死路的尸检报告没附在正文，现在补上。

**死路一：在大域上直接随机删线。** 最朴素的想法：对 $\mathbb F_q^{2}$ 的每个非零斜率平行类各随机删一条仿射线，删完保留全部点边。平行类确实被削弱：方向 $d$ 的剩余顶点只有 $q-1$ 个。这条路死在交性上：两点点边 $E_x, E_y$ 的唯一公共顶点是连线 $\overline{xy}$，一旦连线被删，$E_x\cap E_y=\emptyset$，交性当场塌。删线密度为每平行类 $\Theta(1)$ 条时，随机两点连线命中删除集的概率是 $\Theta(1/q)$ 量级，看着小，一联合到 $q^{2}$ 个点对就活：期望被拆的点对约 $q$ 对，一个都不许剩。补救方案"删的线只允许过稀疏点集"立刻把删除总量压到 $o(q)$ 条，废不掉平行类。死结的本质：删除集要够大才能废覆盖，要够稀疏才能保交性，两者在同一坐标系里对同一批线是互斥要求。出路是把两个要求拆到两套坐标系记账：删除按原坐标记账（废覆盖端），交性在 $f$ 像里读标签（保交端），这就是第 6 节双坐标的出身。[推测] "记账分离"的灵感瞬间应发生在把删除线写成 $F_{d,z}=\{(x^{3},\,dx+z)\}$ 之后：同一条线在两套坐标下身份不同，原坐标里它是被删的线，$f$ 像里它是与任何线至多交 $3$ 点的曲线，"够大"与"够稀疏"同时成立。

**死路二：把 $Y$ 取成确定性构形。** 想用代数曲线代替"随机删平行类"：$Y=\mathbb F_s^{2}\setminus C$，$C$ 为某条低次曲线。死在第 6 节结论 1 的定量形式：原坐标要求每条非删除线含 $\ge5$ 个 $Y$ 点，而 $\deg C=D$ 的曲线与任何线的交点由 Bézout 压到 $D$ 个，$D<s$ 时 $C$ 在每条线上都盖不住多数点，$Y$ 几乎没瘦，平行类照旧覆盖；$D\ge s$ 时一条线能整条落进 $C$，但要求"对每条线"同时成立就把 $C$ 逼成若干平行线的并，回到删线方案，随机性只是把每条线的损失从确定式的 $D$ 换成尾概率 $\exp(-\Omega(s))$ 控制的 $1$ 至 $2$ 点波动，第 6 节存活计数的鞅就是为这件事付账。

**死路三：刚度只在原坐标证。** 不弯曲线、直接对 $Y$ 证"任何 $a+b/2\le s$ 的覆盖必为完整平行类"：被删的 $\ell_d$ 本身是覆盖资源，取各平行类里被删的那条线的代表，凑出非铅笔覆盖，预算内刚度为假。这条死路说明 $f$ 的三个职能缺一不可：置换（$f(Y)$ 大小不变，预算 $s$ 才卡得准）、保两轴（同组例外边相交的标签来源）、曲线化（把琐碎覆盖的线资源清零）。第 6 节末尾"三次是最简单同时满足三条的选择"可以加码量化：$x\mapsto x^{k}$ 是 $\mathbb F_s$ 置换当且仅当 $\gcd(k,s-1)=1$；$k=2$ 时对奇素数 $s$ 恒有 $\gcd(2,s-1)=2$，永远不行；$k=3$ 恰好被 $s\equiv2\pmod3$ 放行，素数无限性靠 $3P-1$ 的两行初等论证（第 6 节末）。主定理把 $s\equiv2\pmod3$ 写进假设，档案理由就在这。

关键转折点复盘：最初设想（第 0 节末）是"把一个固定小域构形 $Y$ 嵌进每个 $\mathbb F_{s^{n}}$，让概率机制处理大域自由度"。最终成品比设想多一层：小域端也要概率（$Y$ 本身随机、三事件各以概率 $\ge3/4$ 交非空），大域端 selection 与 placement 各跑一遍概率再取交。两次"概率预算分账"都不在原设想里，是低并发指数 $D-h(1/2-\kappa/4)<0$ 与 $\delta_1$–$K$ 解耦这两处硬约束逼出来的。

## 18. 台账补表

第 13 节的旧表按"层"组织，是给速览用的；这张新表换视角：一行一个量，位置栏精确到 `文件名:行号`（tex 在 `preprints/A-Counterexample-to-Rysers-Covering-Conjecture-September-23-2026/build`，Lean 在 `E:\math\lean\OAI\Combinatorics\Ryser`，yaml 在 `E:\math\lean\formalization.yaml`），消费栏与改动栏按依赖链写。旧表一个字不动，两表视角差异在第 18.2 节勘误。

### 18.1 逐行台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\kappa\in(0,1/10)$ | 绝对节省指数 | incidence.tex:16 | 结论 $I(P,\mathcal L)\le q^{3/2-\kappa}$ (incidence.tex:25) 与低并发指数 (linecover.tex:346) | 越过 $1/10$ 后 linecover.tex:348 的"指数严格负"论证翻号 |
| 子域界 $q^{1/3}$ | 真子域阶至多 $q^{1/3}$ | incidence.tex:17-18 | 第四步 $R_0$ 禁忌 (incidence.tex:458-464)；主定理奇次数 $d\le n/3$ 喂给它 | 放宽到 $q^{1/2}$ 时 incidence.tex:463 的 $\lvert R_0\rvert>t>q^{1/3}$ 不再排除真子域 |
| $2^{20}V^{22}n$ | 差集与商集同时上界 | incidence.tex:164 与 incidence.tex:232-233 | 抽取引理输出的 $K=2^{23}V^{24}$ (incidence.tex:699) | 多一个 $V$ 因子则 $K=q^{o(1)}$ 吃不动 $K^{C_m}$，incidence.tex:701 矛盾消失 |
| $\tau=(512V^8)^{-1}$ | 好对筛选后的游走密度 | incidence.tex:176 | 游走下界 $n^3/(2^{20}V^{18})$ (incidence.tex:212) 与余集 $\lvert S\rvert\ge 3n/(8V^2)$ | $\tau$ 减半则 $2^{20}V^{18}$ 变大，$V^{22}$ 失衡 |
| $C_m=(13\cdot3^m-5)/2$ | 标量覆盖运算代价 | incidence.tex:275 | 碰撞论证 $K^{C_9+3}s$ 与坏标量情形 $K^{C_4+3}s$ (incidence.tex:426-464) | 递推 $C_{m+1}=3C_m+5$ 一动，两侧界同时失效，中间子域排除断 |
| $H=16U^3q^{1/2}$ | 全直线帽上界 | incidence.tex:545 与 incidence.tex:576 | 丢弃共线见证 $3H<c_0q/(2U^{39})$；四铅笔坐标合法化 | 帽再大，锚点四元组的见证池被清空，抽屉原理给不出 $c_0q/U^{39}$ |
| $d=q^{1/2}/(8U^2)$ | 剪枝最小度阈值 | incidence.tex:545 | 存活集 $\sum_{x\in P}\lvert N(x)\rvert$ 的下界链 (incidence.tex:603) | 抬高 $d$ 则删点损失超 $q^{3/2}/(4U)$，$I\ge q^{3/2}/(2U)$ 崩 |
| $q^{3/2}/(2048U^6)$ | 剪枝后交点数下界 | incidence.tex:603 | 四锚点计数 (incidence.tex:614) 的入口 | 此 2048 与 gadget 尾的 2048 数值同源、用途独立（勘误见 18.2） |
| $9\cdot2^{32}U^{20}$ | 共线三元组下界常数 | incidence.tex:614 | 五元组下界 (incidence.tex:626) | $(t-1)(t-2)\ge(2/9)t^3$ 配 Hölder 的落点，换常数则 $U$ 指数漂移 |
| $9\cdot2^{45}U^{28}$ | 五元组下界常数 | incidence.tex:626 | $c_0$ 的合成 (incidence.tex:643) | 与四元组种群 $2^{12}U^{11}q^{7/2}$ 做抽屉，一动 $c_0$ 全变 |
| $c_0=1/(9\cdot2^{57})$ | 见证常数 | incidence.tex:643 | $V=(2/c_0)U^{39}$ (incidence.tex:699 前) 与 $G\ge c_0q/(2U^{39})$ | 抽取引理的 $n=q^{1/2}$ 归一化依赖它，改动传播进 $K$ |
| $K=2^{23}V^{24}$ | 倍增比 | incidence.tex:699 | 中间近似子域排除 (incidence.tex:701) | $24=22+2$ 里多 $2$ 来自 $D^4$ 外乘，降一点假设即不闭合 |
| Freedman 尾 $2\exp[-(1/4)\min\{u^2/V,\,u/M\}]$ | 鞅集中形式 | linecover.tex:43 | 层 2 tuple 事件的 $e^{-c_0t^2}$ | 常数 $1/4$ 是两 regime 衔接处保守化，收紧则需非初等不等式 |
| $\mathbb E(Z_i^2\mid\mathcal A_{i-1})\le v_i$，$\sum v_i\le V$ | 条件方差记账 | linecover.tex:33-37 | 稀有性变现的全部机制 | 换成确定性 $v_i=C_0^2$ 则 $V\sim DqC_0^2$，$t^2\sim\log q$ 时联合界失效 |
| $L=2D^2q$ | 单试验对 $\lvert X\rvert$ 的暴露 | linecover.tex:113-116 | 层 1 尾 $\exp(-q^{2\epsilon}/(32D^5))$ | 旧新列表 $\le 2D$ 个形状乘每个 $Dq$ 点，翻倍则 $D^5$ 变 $D^6$ 层级 |
| $h=10(D+1)$ | 贪心互不共位跨对数 | linecover.tex:172 与 linecover.tex:348 | 低并发 (linecover.tex:346) 与高并发 (linecover.tex:416) 的形状违反 | 高并发只要求 $h>D/4$ 级，低并发要求 $D-h(1/2-\kappa/4)<0$，$h$ 由强者定 |
| $H_0=2Dh$ | 非表线对 $P_0$ 的帽 | linecover.tex:172 与 linecover.tex:180 | 可行 tuple 定义；违反计数 (linecover.tex:321-326) | $H_0$ 放大则 $C_0=DH_0$ 放大，$c_0$ 与 $A$ 的门槛一起恶化 |
| $t=\lceil A\log q\rceil$ | tuple 长度 | linecover.tex:173 | 联合界 $(q(q+1))^{2t}$ 对 $e^{-c_0t^2}$ (linecover.tex:232-235) | $t$ 取常数则指数对数同阶不收，$A$ 不固定则自指 |
| 增量 $2C_0$，单试验方差 $C_0^2Dt^2/q$ | tuple 鞅参数 | linecover.tex:197-216 | $c_0$ 定义 (linecover.tex:224-225) | 删中 $P_0$ 概率 $\le Dt^2/q$ 不稀有时，条件方差退化回 Azuma 死局 |
| $D^2C_0^2t^2$ | 方差总和 | linecover.tex:218 | $e^{-c_0t^2}$ 的 $V$ | $(\log q)^2$ 预算对 $(\log q)^2$ 联合界，多一个 $\log$ 即平账 |
| $c_0=\min\{\delta^2/(16D^2C_0^2),\,\delta/(16C_0)\}$ | tuple 尾常数 | linecover.tex:224-225 | 任意 $A>5/c_0$ (linecover.tex:235) | 若依赖 $A$ 则门槛自指；依赖 $D,\delta,\rho$ 是合法下限 |
| $2q$ | 覆盖允许漏点数 | linecover.tex:91 与 linecover.tex:248 | $E_L=O(q^{3/2+\epsilon})$ 重复计数预算 (linecover.tex:258) | 收紧余量则轻点贡献失控，低并发均值 $o(1)$ 不成立 |
| 退化概率 $(\log q)^3q^{-1/2+\kappa/4}$ | 平行对与三线共点 | linecover.tex:314（低并发）与 linecover.tex:397（高并发） | 可行性保持 | $t$ 与 $R$ 的比值落点，$R\le q^{1/2+\kappa/4}$ 一动即变号 |
| $f(x,y)=(x^3,y)$ | 双坐标读标签 | construction.tex:27 | 例外边标签与刚度陈述 | 换任意次 $k$：$\gcd(k,s-1)=1$ 才置换，$k=2$ 恒废，$k=3$ 吃 $s\equiv2\pmod3$ |
| $Y=\mathbb F_s^2\setminus\bigcup_{d\in\mathbb F_s^*}\ell_d$ | 小域删除构形 | construction.tex:21 | 三组刚度结论的宿主 (construction.tex:14 起) | 试验内删除相关、试验间独立 (construction.tex:52)，改成完全独立则 $(s-1)^2$ 条删除线无法生成 |
| 每线五点 | 原坐标存活 $\ge 5$ | construction.tex:24 与 construction.tex:74 | 终局 $5h_p$ 收支 | $\mu=s(1-1/s)^{s-2}$ (construction.tex:59) 与尾 (construction.tex:64 引 A.2--A.3) 落点；降到 $1$ 仍够但无容差 |
| $\delta_s=(1-1/s)^{s-1}\ge1/4$ | 新坐标存活率 | construction.tex:91 | 每线 $\ge s/8$ (construction.tex:109) | $(1/2)\times(1/4)$ 两常数乘积，$\delta_s$ 若依赖 $s$ 下界则 linecover 假设 2 失效 |
| $D=3,\ \delta=1/4,\ \rho_0=1/100$ | gadget 用 linecover 的参 | construction.tex:106 | 几乎铅笔到完整平行类的压缩 | 三次曲线交线 $\le3$ 点 (construction.tex:83, construction.tex:100)：竖线靠立方双射、斜线靠非零三次方程；$D$ 升高威胁低并发指数 |
| $N_q=(q-1)/(s-1)+1$ | 组数 | construction.tex:202 | 池性质 (1)(2)(3) 的联合界规模 $O_s(q)$ | 陪集枚举 $\mathbb P^1(\mathbb F_q)=\bigsqcup S_i$ (construction.tex:196-201) 是极小方案，组数升次则五组联合界 $O(q^7)$ 级 |
| $S_*=(\mathbb F_s\cup\{\infty\})\setminus\{u,v\}$ | 组 $*$ 改动方向 | construction.tex:219（$u,v$ 选取在 construction.tex:214） | 每方向至多两组；$S_1\cap S_*=\mathbb F_s^*\setminus\{u,v\}$ (construction.tex:248) | $M_*$ 的像 $(u+vt)/(1+t)$ (construction.tex:230) 恰好映子域斜率进 $S_*$，换参数则轴封口断 |
| $\delta=\exp(-4K(s-1))$，$\rho=\delta/10$ | 池存活与铅笔缺口 | construction.tex:376-379（陈述在 construction.tex:328-329） | 强制引理缝隙 $1+\rho q<\delta q/2$ | $\rho$ 若随 $q$ 缩小，高并发 $E_L/(RN)$ 指数变正（5.3 死路 2 的镜像） |
| 常数引入顺序 | $s,Y$ 先，选常数与 $K$ 次，$D,\delta,\rho$ 再次，$q=s^n$ 最后 | construction.tex:467-472 | selection 的 $\delta_1$ 不依赖 $K$ 与全文渐近结构 | 颠倒次序则"池固定、次数趋于无穷"失效，construction.tex:188 的同句呼应 |
| con-separation | 方向 $\in D_i$ 且碰 $P_i$ 则不碰 $P_j$ | construction.tex:433 | 跨组互异 (construction.tex:575)、双组轴隔离 (construction.tex:731)、$h_p$ 上界 (construction.tex:762)、情形三不重合 (construction.tex:812) | 一处失效则跨组例外边共享标签断裂或 $h_p\le s-1$ 抬到 $2(s-1)$ |
| 例外边标签两分支 | $d\in S_i$ 取特殊、$d\notin S_i$ 取普通 | construction.tex:512 与 construction.tex:521 | 相交性三验证（普通乘例外、同组、跨组） | 单坐标记账回到 17 节死路一：够大与够稀疏互斥 |
| $F_p$ 与 $z\le2$ | 强制顶点集与方向重复数 | construction.tex:682-698 | 无穷远情形的预算 $\lvert C\setminus F_p\rvert\le z(s-1)$ | $z$ 依赖"重复只在组 $1,*$"，construction.tex:248 封住 |
| $2s\le\lvert C\setminus F_p\rvert\le2(s-1)$ | 双组加权收支 | construction.tex:739（下界来自 gadget $a_i+b_i'/2\ge s$） | 情形一 $z=2$ 的矛盾 | 轴顶点若能二次计数则左边少一项，矛盾消失，construction.tex:731 的隔离是防线 |
| $h_p$，$\lvert C\setminus F_p\rvert\le h_p-1$ | 有限内情形预算 | construction.tex:746-757（$h_p=0$ 直接爆） | 内部收支 $2+(h_p-1)\le s$ (construction.tex:789) | $h_p\le s-1$ (construction.tex:767) 依赖他组删除线不过 $p\in P_i$，con-separation 供保 |
| $5h_p$ 条例外边 | 外部情形释放量 | construction.tex:800-817 | 预算 $5(h_p-1)<5h_p$ 的差 1 矛盾 | construction.tex:800 明写"用删除线的五点，不用组帽"，五点与五组性质 (construction.tex:346) 必须同值 |
| 主定理 | $s_0$，$s\equiv2\pmod3$ 素数，$n_0(s)\ge3$，奇 $n$，$\tau(H)=q+1$ | paper.tex:115-126 | 全文终点；交情形 Ryser 式 (paper.tex:63) 被否 | paper.tex:125 以下注明结果是渐近式、不给数值门槛 |
| 树覆盖推论 | 单色树最小覆盖数恰 $r$ | paper.tex:168-176（Gyárfás 猜想的陈述在 paper.tex:160-162） | 附产品 | 唯一未进 Lean 的条款（染色侧基础设施正交） |
| 伴生论文附录 A | 二阶矩恒等式与暴露两引理 | paper.tex:143-144；引用点 linecover.tex:23 与 construction.tex:64 | selection 大范围方差与 gadget 存活 | 外部依赖全部在此，正文其余自含 |
| yaml 书目与登记 | 两条目 RyserCovering 与 RyserOddExtensions | formalization.yaml:52 与 54（书目），formalization.yaml:1470-1476（登记） | 声明 `OAI.RyserCoveringCounterexample.exists_prime_eventually_counterexampleRank` 落在 Construction/Main.lean:14，`OAI.RyserOdd.eventualOddFailures_and_infinite` 落在 OddExtensions.lean:132 | 命名空间前缀按 `file:` 路径为 `OAI.Combinatorics.Ryser`，与目录名同族 |
| Lean `savingExponent` | $1/10^{10}$ | Incidence/Parameters.lean:13 | `densityScale` (Incidence/Parameters.lean:16) 起的全部数值核算 | 论文 $\kappa\in(0,1/10)$ 存在式在 Lean 兑换成具体小数 |
| Lean $K^{127942}$ | 显式指数核算 | Incidence/ExtractedContradiction.lean:13-24（$32V^2K^{127942}<3r$） | `LargeEnough` 型假设的落地形式 | 论文 $K=q^{o(1)}$ 吸收在此变成 $127942$ 与 $527$ 的算术 |
| Lean `ambientDeletionDelta` | $\exp(-4K(s-1))$ | Construction/AmbientDeletionNumerics.lean:15-16 | `hgap` 假设 (Construction/ActualHypergraph.lean:22-23) | tex construction.tex:376 的闭式在 Lean 有正性引理 (AmbientDeletionNumerics.lean:18) 兜底 |
| Lean $2048$ | 尾与素数搜索合并 | Construction/GadgetOriginalDensity.lean:20-24（尾 $\le q^2e^{-q/2048}$），GadgetExistence.lean:23, 27, 32（门槛 $B+Q+N+2048$） | gadget 三事件交非空 | 素数搜索把代数门槛与数值门槛合并，拆开会多一次 Bertrand 型调用 |
| Lean `densityRate` | 与 $K$ 解耦的密度率 | Selection/DensityConstants.lean:22 与 40-41，消费于 Selection/CertificateBounds.lean:16 | selection 大范围失败的 $\exp(-\text{densityRate}\cdot q\log q)$ | 对应 selection.tex:246 的 $\delta_1$ 只依赖 $D$ 主张 |
| Lean `tupleTailConstant` | $c_0$ 的具名化 | LineCover/GoodTuples.lean:31, 46 与 LineCover/Main.lean:17（$10(D+1)$ 内联） | linecover 层 2 尾 | 与 linecover.tex:224 的 $\min$ 式逐项对应，$h=10(D+1)$ 在 Main.lean:17 可见 |

### 18.2 与第 13 节旧表的视角差异勘误

旧表把 $2048$ 记在 gadget 行。tex 里 $2048$ 出现两处且用途无关：incidence.tex:603 是剪枝后交点数下界的分母，construction.tex 一侧的尾在 Lean 是 GadgetOriginalDensity.lean:20-24；两处的数值同源（同为 $2^{11}$ 的保守化）但链条独立，旧表一行装不下。旧表 selection 行写"$K(D)\ge6$"：tex 的"for $K\ge6$" (selection.tex:207) 只是证书计数引理的适用条件，$K$ 的真实约束是 selection.tex:238 的小范围几何衰减与 selection.tex:515 的 $A_Ke^{2-K\delta_1}<1/2$，三件事在旧表被压成一行。旧表"PoolThin 不超过 5"记在放置层：五组性质的 tex 原文在 construction.tex:346，Lean 侧承担该界名的文件族叫 PoolThin 系列，而终局消费它的引理叫 offPencilThin_of_groupPoolThin（Construction/ActualHypergraph.lean:64），命名族与消费点不同文件，登记时以 `file:` 路径为准的教训在这再次应验。旧表终局行写"$h_p\le s-1$"落在 construction.tex，本表给出精确行 construction.tex:767。旧表域行的 Lean 落点 `5<p, p%3=2, Odd n, exists_distinct_nonzero` 是声明内假设名，本表补充：`exists_distinct_nonzero` 对应 $u,v$ 的选取自由，tex 侧 construction.tex:214 只要求 $u\ne v$ 均非零，两侧一致。

## 19. 规范重述：把散在代码体与行话里的陈述换成数学模式

第 11 节与第 13 节里大量陈述当时是随手以反引号代码体或行话落下的，数学内容没有进 `$...$`。这一节把关键几条全部重述一遍，符号系统与前文对齐，旧文字原样保留，以本节为准。

（一）主定理（对应第 0 节题注与 paper.tex:115-126）：存在 $s_{0}$，对每个素数 $s\ge s_{0}$ 满足 $s\equiv2\pmod3$，存在整数 $n_{0}(s)\ge3$，使得对每个奇整数 $n\ge n_{0}(s)$，令 $q=s^{n}$，存在有限的交 $(q+1)$-部 $(q+1)$-一致超图 $H$ 满足 $\tau(H)=q+1$。交情形 $\nu(H)=1$ 时 Ryser 右端为 $(r-1)\nu(H)=q$，违反式即 $q<q+1$。

（二）条目 A（旧文以 Lean 代码体书写，规范形）：存在素数 $p$ 满足 $5<p$ 且 $p\equiv2\pmod3$，且存在 $N$，对所有满足 $n\ge N$ 且 $2<n$ 的素数 $n$，$\mathrm{CounterexampleRank}(p^{n}+1)$ 成立。注意它只要求单素数 $p$ 与素次数，弱于（一）的"每个合格素数、每个大奇次数"。

（三）条目 B（旧文代码体 `eventualOddFailures_and_infinite`，规范形）：存在一致门槛 $P=Q+N+2048$（在选素数之前固定），对每个素数 $p\ge P$ 与 $p\equiv2\pmod3$，存在 $n_{0}$，对所有 $n\ge n_{0}$ 的奇数 $n$，$\mathrm{ExplicitFailureAt}(p^{n}+1)$ 成立，其中违反条款以 $(r-1)\nu(H)<\tau(H)$ 显式入定义，且反例秩集合无穷。声明文件：Construction/Main.lean:14 与 OddExtensions.lean:132，登记在 formalization.yaml:1470-1476。

（四）Freedman 尾（旧文代码块）：鞅差 $Z_i$ 对滤链 $\mathcal A_{i-1}$ 满足 $\mathbb E(Z_i\mid\mathcal A_{i-1})=0$、$\lvert Z_i\rvert\le M$、$\mathbb E(Z_i^{2}\mid\mathcal A_{i-1})\le v_i$、$\sum_{i}v_i\le V$ 时，$\Pr\bigl(\bigl\lvert\sum_i Z_i\bigr\rvert\ge u\bigr)\le 2\exp\bigl[-\tfrac14\min\{u^{2}/V,\,u/M\}\bigr]$（linecover.tex:43 逐字）。

（五）linecover 结论（旧文行话"w.h.p. (1)(2)(3)"）：以概率趋于 $1$，(1) 对每条射影线 $\ell$，忽略精确列出 $\ell$ 的事件后 $\lvert X\cap\ell\rvert\ge\delta q/2$；(2) 任何线集 $L$ 若覆盖 $X$ 至多漏 $2q$ 个点且 $\lvert L\rvert\le q$，则存在射影点 $p$ 使 $L$ 含至少 $(1-\rho)q$ 条过 $p$ 的线。参数出处 linecover.tex:63-91，池侧版本 construction.tex:326-346。

（六）刚度黑箱（旧文散文）：若 $a$ 条线与 $b$ 个单点覆盖 $f(Y)$ 且 $a+b/2\le s$，则 $a=s$、$b=0$，且线集是完整仿射平行类。等价推论：$\lvert L\rvert\le s$ 的覆盖不含两条不平行线。三组结论的宿主引理在 construction.tex:14-130。

（七）selection 输出（旧文行话"$D\mapsto K$"）：对每组 $\le Dq$ 个候选、每候选 $\le D$ 形状与 $\le D$ 方向表的族，存在只依赖 $D$ 的 $K$（两条显式约束见 selection.tex:238 与 selection.tex:515），使每池独立抽 $K$ 个均匀平移后，可各选一个实现全族无冲突，失败概率对一切满足假设的数据一致趋于 $0$。

（八）终局收支（旧文混排）：情形一 $z=1$：$\lvert C\setminus F_p\rvert\le s-1$ 与 gadget 矛盾；情形一 $z=2$：$2s\le a_1+\frac{b_1'}{2}+a_*+\frac{b_*'}{2}\le\lvert C\setminus F_p\rvert\le2(s-1)$；情形二：$2+(h_p-1)\le s$；情形三：$5(h_p-1)<5h_p$。行锚点全表见 18.1。

（九）绝对值与范数记法约定：本节起，模长、基数、偏差一律写 $\lvert\cdot\rvert$，集合族大小写 $\lvert\mathcal F\rvert$，不再用裸竖线；这与台账表的单元格纪律一致。

## 20. 外部文献锚点与联网核实状态

第 3 节的四步分解踩在若干外部结果上，旧文只给了名字，这里补齐可核对状态。已联网核实的公开锚点：Ryser 猜想的已知正面结果版图（$r=3$ 的 Aharoni 定理、交情形 $r=4,5$ 的 Gyárfás 与 Tuza、Haxell–Scott 的 $\tau\le(r-\epsilon)\nu$ 型进展）可在 Wikipedia 的超图匹配词条（https://en.wikipedia.org/wiki/Matching_in_hypergraphs ）核对到陈述层级；A. Scott 的近期组合覆盖方向论文列表在其主页 https://people.maths.ox.ac.uk/scott/ 可查。Plünnecke–Ruzsa 的 Petridis 极小子集证法与 BKT（Bourgain–Catlin–Tao 路线的 sum-product 排除中间子域）两项，本次两轮检索未命中可直接核对的原始条目链接（检索词分别为 Petridis 论文标题与 Haxell–Scott 关键词，结果均为二级引用页），故不硬编 arXiv 号，状态记为：待核。tex 侧对 sum-product 输入的实际引用形态以 `references.bib` 登记存在性为准（本笔记不展开其内容，不作正文来源）；正文唯一自含依赖是伴生论文附录 A 的三条初等估计（paper.tex:143-144，行内引用点 linecover.tex:23 与 construction.tex:64）。若后续补齐 Petridis 与 BKT 的一次文献链接，应更新本节，第 3 节论证本身不因此变动：incidence 定理在论文内是自含证明，外部名字只说明技术血统。

## 21. 最终思路与最初设想的全量差异清单

第 17 节已给死路三条，这里把"出厂配置"与"最初图纸"逐项对账，全部量化：

1. 设想里概率只在大域端出现一次（池删除），成品出现三次：gadget 的 $Y$ 随机（三事件各 $\ge3/4$，construction.tex:14 一侧）、selection 的平移池、placement 的全池删除（construction.tex:326 一侧）。每一次都是被一处指数约束逼出来的。
2. 设想里 $f$ 只是"换个标签"，最终 $f$ 承担三重职能（置换、保两轴、曲线化，见 17 节死路三），且次数被锁死在 $3$：$x\mapsto x^{k}$ 置换等价于 $\gcd(k,s-1)=1$，$k=2$ 恒不行，$k=3$ 需要 $s\equiv2\pmod3$。
3. 设想里删除清单直接来自概率抽线，最终每个方向要恰 $s-1$ 条、每条带 $\ge5$ 个 $Y$ 点（construction.tex:303），删除量 $(s-1)^2$ 与"五点"必须同时成立，后者是给情形三 $5h_p$ 预留的，前者是给组内 $h_p\le s-1$ 预留的（construction.tex:767）。
4. 设想里 $2K^{3}$、$1/4$、$1/100$ 这些是"证明里长出来的数"，最终确认它们全部是下游反推上游的固定合同：$2K^{3}$ 喂 linecover.tex:180 的帽界，$\rho_0=1/100$（construction.tex:106）喂"几乎铅笔到完整平行类"的 $1+3\rho_0s<s/8$ 缝隙。
5. 设想里渐近记号够用，Lean 一照，$q^{o(1)}$ 兑换成 $K^{127942}$ 的显式算术（Incidence/ExtractedContradiction.lean:13-24），$o(1)$ 联合界兑换成 `linecoverFailureBound` 型显式函数；渐近是账本，显式是流水，两本都要。
6. 设想里"奇次数"是技术副产品，最终它同时喂两处：子域界 $q^{1/3}$（奇数 $n$ 的真因子 $d\le n/3$）与条目 B 的强化陈述；论文文字与 Lean 在这一点上 Lean 更强。

最终思路与第 0 节"小域造构形、大域铺开"的战略完全相容，差别在实现深度：原图纸是一层概率加一个几何引理，成品是三层概率、一个刚度黑箱、一个支配证书，外加一套把 w.h.p. 兑换成显式门槛的会计制度。这套会计制度在 Lean 里是 `Classical.choose` 从实数 eventually 提取 $Q$ 的量词规范化，在论文里是 construction.tex:467-472 那段常数引入顺序声明，两者是同一件事的两种语言。

## 22. 反事实推演：每个零件抽掉一根销子，链条在哪一环先响

做研究时我只验证了"装得上"，收稿前应该再验证"拆得散"。逐个抽销子，预测断裂点，再回原文核对断裂是否真的发生：

（一）$f(x,y)=(x,y^{3})$，立方放错坐标。同组例外边相交的标签机制要求：两基点连线水平时共享竖直轴标签、竖直时共享水平轴标签。$f$ 不保水平类时，连线水平的两点 $f$ 像横坐标不再相等，共享标签要改走 $A_i$ 方向的轴顶点，而轴顶点资源在情形一 $z=2$ 的记账 $a_i+\frac{b_i'}{2}\ge s$ 里已被占用（construction.tex:739），双组收支多出 $\frac{b}{2}$ 项，$2s\le 2(s-1)$ 不再闭合。预测断裂在装配节同组相交验证，核对成立：construction.tex:27 把立方钉在第一坐标正是为此。

（二）$\rho_0$ 从 $1/100$ 放宽到 $1/8$。几乎铅笔推完整平行类用的缝隙是 $1+3\rho_0 s<s/8$，即 $\rho_0<\frac18-\frac{1}{3s}$，放宽到 $1/8$ 恰好在临界外，不等号反噬，缺席平行线不再被逐出覆盖。这条销子证明 $\rho_0=1/100$（construction.tex:106）的余量需求真实存在，只是被取整到 $2$ 的幂倒数。

（三）$h$ 从 $10(D+1)$ 降到 $4(D+1)$。低并发形状违反概率 $O((\log q)^{2h}q^{D-h(1/2-\kappa/4)})$（linecover.tex:346）中，$\kappa<1/10$ 给出 $1/2-\kappa/4>2/5$，指数 $D-\frac{2}{5}h$ 在 $h=4(D+1)$ 时 $=D-\frac{8}{5}(D+1)<0$ 仍负，看似没事；但贪心跨对抽取要求 $h$ 个互不共位位置全部可行，每步失败概率累加需要 $h\ge 5(D+1)$ 级才能把 $(\log q)^{2h}$ 之外的可行性退化项压成 $o(1)$，$h=4(D+1)$ 时 linecover.tex:321-326 的 $H_0=2Dh$ 帽界同步缩小，violation 事件与退化事件此消彼长，账合不上。预测：断裂在层 3 低并发段的可行性预算，核对结论：$10(D+1)$ 里有 $H_0$ 与 $h$ 的自反依赖（$H_0$ 随 $h$ 长、violation 概率随 $H_0$ 涨），系数 $10$ 是这个不动点问题的粗解。[推测] 系数 $5$ 应也能闭合，$10$ 是留双份保险。

（四）先固定平移选择、再对选中集跑 linecover。删除过程失去乘积律：选中依赖全体池平移，假设 1（每点每试验删除概率 $\le D/q$）需要对随机选中的平移族做一致性验证，而 selection 定理只给无冲突性，给不了删除概率的上界搬运。预测断裂在 linecover 假设验证，核对成立：construction.tex:467 一侧的顺序声明与此互为镜像，"先全池、后选择、再包含"的包含转移（10 节 8.3）是唯一能保住两条池性质的次序。

（五）$K$ 在 $q$ 之后选。selection 大范围失败项 $\exp(-(K\delta_1-2)m)$（selection.tex:483）与证书系数 $A_K=\frac{eD}{c_1}C_*K^{2}$（selection.tex:499）的可行性判据 $A_K\exp(2-K\delta_1)<\frac12$（selection.tex:515）要求 $\delta_1$ 先于 $K$ 存在（selection.tex:246 明写 $\delta_1$ 只依赖 $D$）。若 $K$ 依赖 $q$，$J_0=\lceil 4D/\alpha+1\rceil$ 与 $\delta_1=2^{-J_0-1}$ 的链条仍不含 $K$，看似自由；死点在池性质 $\delta=\exp(-4K(s-1))$：$K$ 随 $q$ 增长则 $\delta$ 随 $q$ 衰减，强制缝隙 $1+\rho q<\delta q/2$ 要求 $q>\lceil 10/\delta\rceil$ 变成 $q$ 的超越不等式，解集可能为空。预测断裂在 placement 门槛闭合，核对成立：construction.tex:376 的 $\delta$ 定义把 $K$ 锁在小域常数上。

（六）去掉组 $*$。方向覆盖 $\mathbb P^1(\mathbb F_q)$ 的陪集分解只剩 $\lambda\mathbb F_s^{*}$ 族，两条轴方向 $0,\infty$ 不属于任何 $S_\lambda$，例外基点的轴向连线全部按普通标签兜底，同组相交的轴标签机制（第 9 节）失去输入；且情形一 $z$ 的重复结构改变，$S_1\cap S_*$（construction.tex:248）提供的轴隔离消失，$z=2$ 情形的矛盾链断裂。预测断裂在装配与终局两处，核对成立：construction.tex:201 的 $\mathcal I=\Lambda\sqcup\{*\}$ 声明里"$\sqcup\{*\}$"即为此设。

这六个反事实的共同形状：每个看似多余的零件（轴保置换、组 $*$、$K$ 的时序、$\rho_0$ 的余量、$10$ 的系数、包含转移的次序）都在某一处收支表里占一个不可替代的符号位。第 15 节的倒推锚点清单可以据此再加一条：11. 反事实推演六件套，销子与收支位的对偶（本节）。




