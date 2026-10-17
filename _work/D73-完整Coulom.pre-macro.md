# D73 广义电离能：我把 $m^{7/3}$ 当靶子，反推整台机器

对象论文：`Generalized ionization energies for full Coulomb atoms`（2026-09-24，OpenAI）。
TeX 源码：`E:\math\preprints\Generalized-ionization-energies-for-full-Coulomb-atoms-September-24-2026\build\`，主文件 `paper.tex` 用 `\input` 引 `sections/01-introduction.tex` … `sections/06-fixed-sectors.tex` 六个分片；同目录的 `foundation-locators.tex`、`glyph-mappings.tex` 是记号与字体支撑文件，我把它们当接口清单读，不当正文。本文行号引用形如 `02:184`，表示 `sections/02-pricing.tex` 第 184 行。
Lean：`E:\math\lean\OAI\Analysis\CoulombIonization\`，607 个 `.lean` 文件、95,362 行，入口 `Main.lean`，被认证的顶层条目是 `OAI.CoulombAtom.generalized_ionization`，comparator 配置 `ComparatorChallenges\CoulombIonization.json`。实测细节全部记在第 15 节。
近邻分界：队列里的 3D 相对论 Vlasov-Maxwell 整体经典解（`D03-VlasovMaxwell整体经典解.md`）与本篇同属 OpenAI 数学发布批次，但它给我的多体标度、速度场紧性、特征线任何东西都接不上，我在本篇写作过程中不引用它的结论。`D27-Fock空间不等式与Laughlin谱隙.md` 涉及费米子多体，可它的机制是填地态谱隙与磁平移，与 Coulomb 大核极限没有共享引理；`D16-径向对势的连续温度奇点.md` 是统计力学相变，与 Thomas-Fermi 泛函的下界技术无重叠。这三篇我只做分界声明，不复述推导。

## 0 我进场时手里有什么

本篇语料落在 `E:\math\preprints\Generalized-ionization-energies-for-full-Coulomb-atoms-September-24-2026`（目录日期后缀照抄论文的 2026-09-24），派单队列第 76 行号，这条来源登记就记在这里。

摘要只给了两句话（`paper.tex:52-56`）：对两自旋态的完整非相对论 Coulomb 原子，证明广义电离猜想的能量部分；当 $m\to\infty$ 且 $Z/m\to\infty$ 时移走 $m$ 个电子所需能量渐近于 $a_{\TF}m^{7/3}$；另外得到两个猜想的迭代极限。我手上还有一个伴生论文 `Foundation`（Uniform excess charge for Coulomb molecules and the outer radius of neutral atoms），本篇大量输入从它借来，`foundation-locators.tex` 把借来的每条编号写成宏：

```tex
\newcommand{\FSectors}{Lemmas~2.1 and~2.4--2.6}
\newcommand{\FGlobalDensity}{Lemma~3.3}
\newcommand{\FNeutralOffset}{Proposition~12.3}
\newcommand{\FLocalization}{Lemma~3.4}
\newcommand{\FLocalField}{Proposition~4.5}
\newcommand{\FAnnularCount}{Corollary~4.9}
\newcommand{\FInnerField}{Lemma~12.1}
\newcommand{\FObservations}{Lemma~5.1}
\newcommand{\FEventTilt}{Lemma~5.2}
\newcommand{\FAveragedTransfer}{Lemma~5.3}
\newcommand{\FFixedOffset}{Proposition~10.1}
\newcommand{\FIntermediate}{Proposition~11.2}
\newcommand{\FNeumann}{Lemma~3.6}
\newcommand{\FInsertion}{Lemma~3.5}
\newcommand{\FCoulomb}{Lemma~3.1}
\newcommand{\FMaximum}{Lemma~5.4}
\newcommand{\FTFPair}{Lemmas~7.1 and~7.2}
\newcommand{\FTFExistence}{Lemma~7.1}
```

这张表我读出了两件事。第一，本篇自己新证的东西集中在两条线上：正价格下的局部密度--场双向比较（`03`）与正价格下的下障碍延拓（`04`），`01:189-190` 那句 "The required positive-price conditional comparisons and barrier propagation are proved in \cref{sec:comparison,sec:barriers}" 就是自我定位。第二，伴生论文里已经有一条固定 offset 的反向比较命题（`\FFixedOffset` = Proposition 10.1），本篇明明知道它存在，却专门写了一句不用它（`03:156-158`），这个"知道有而故意不用"的地方一定是难点所在，我在第 4 节把这条死路先走一遍。

编号条目清点（我把六个分片的 `theorem/lemma/proposition/corollary/definition/remark` 环境全 grep 了一遍，计数器在 `paper.tex:19-25` 定义为按节共享、`\numberwithin{equation}{section}`）：

1. Theorem 1.1（广义电离能，主定理）`01:78`，标签 `thm:main`
2. Theorem 1.2（给定价格下的亏损）`01:129`，标签 `thm:priced-deficit`
3. Lemma 2.1（扇区与能量估计，导入）`02:45`，`lem:sector-inputs`
4. Lemma 2.2（任意 offset 的局部场，导入）`02:107`，`lem:local-field-input`
5. Lemma 2.3（环形屏蔽估计，导入）`02:136`，`lem:screening-inputs`
6. Lemma 2.4（粗亏损界）`02:184`，`lem:priced-rough`
7. Lemma 2.5（一个固定外表尺度的截断）`02:234`，`lem:exterior-cutoff`
8. Lemma 3.1（一次观测事件的代价）`03:81`，`lem:event-tilt`
9. Proposition 3.2（同时的双向反向比较）`03:119`，`prop:inverse-comparison`
10. Proposition 4.1（条件化障碍不变量）`04:30`，`prop:barrier-invariant`
11. Lemma 5.1（唯一衰减奇异轮廓）`05:243`，`lem:singular-profile`
12. Proposition 6.1（固定扇区极限）`06:15`，`prop:fixed-sector-limit`
13. Proposition 6.2（Thomas-Fermi 系数识别）`06:118`，`prop:tf-identification`

编号条目 13 个：2 个定理、5 个引理、6 个命题？我核对过：引理是 `02` 的 5 个加 `03:81` 与 `05:243`，共 7 个；命题是 `03:119`、`04:30`、`06:15`、`06:118` 共 4 个；定理 2 个。7+4+2=13，与 grep 到的环境数一致，`definition` 与 `remark` 环境一个都没实际启用，只有声明。无 corollary。另有四个 `proof` 块本身承担正文功能：`05:306` 的"The charge assertion of Theorem 1.2"、`06:24`、`06:132`、`06:345` 的"Completion of the proof of Theorem 1.1"，这种"证明即结论载体"的写法说明这几条陈述没有单独编号，容易漏读。

关键未编号论证我也列一份，它们才是真正的机器件：`02:243-348` 的外壳测试与逐级吸收（Lemma 2.5 的证明），`03:180-201` 的计数事件 $\mathcal C_j$，`03:203-245` 的普适场上界加次调和升级，`03:276-291` 的尺度阶梯 $b\ll\ell_j\ll t\ll a$，`04:74-168` 的障碍初始化，`04:193-295` 的向外一步与开覆盖，`05:28-45` 的"两个蕴含把 $u$ 挤到 $v$ 附近"（局部 TF 近似），`05:139-157` 的膨胀加 Liouville 给出衰减，`05:159-233` 的带修正势 $L_s$ 的障碍传递，`06:136-149` 的 TF 质量单调性（把缺失质量放到远处 $R^2$ 处的包里）。

## 1 初始动机与猜想的精确形状

我的出发点是一个很不体面的事实：手里只有总能量。Thomas-Fermi 理论给的是 $Z\to\infty$ 时 $E_Z(N)$ 的首阶，Lieb-Simon 把它接到多体 Schrödinger 理论上，`01:10-13` 原文：

```tex
Their energy theorem \cite[Theorem~III.1]{LiebSimon1977} concerns terms of
order $Z^{7/3}$. Subtracting two such total-energy asymptotics does not
control a much smaller ionization energy: the remainder may exceed the
difference being sought.
```

电离能是 $E_Z(Z-m)-E_Z(Z)$，两个 $Z^{7/3}$ 量相减。若每个都有 $o(Z^{7/3})$ 的误差，差就有 $o(Z^{7/3})$ 的误差，而我要的 $I_m(Z)$ 本身量级是 $m^{7/3}$，在 $m=o(Z)$ 的区域里远小于 $Z^{7/3}$。所以误差项吃掉信号，这是纯粹的量级比较，与技术强度无关。我在纸上代了几个数确认这个判断不会因为 Lieb-Simon  later refinements 而松动：即使把误差做到 $O(Z^{5/3})$（Scott 修正猜想的量级，$-\tfrac12 Z^2$ 之后下一项），只要 $m^{7/3}\ll Z^{5/3}$ 仍然无效，而这正是 $m\ll Z^{5/7}$ 的区域，恰好落在我要证的 $Z/m\to\infty$ 内部。

猜想的形状由 Solovej 提出，`01:18-20`：

```tex
Solovej formulated this statement through upper and lower large-$Z$ limits,
followed by a large removed-electron-number limit
\cite[Section~3, Equation~(1)]{Solovej2016}.
```

也就是两层：内层固定 $m$ 取 $Z\to\infty$ 的 $\limsup$ 与 $\liminf$，外层 $m\to\infty$ 再除 $m^{7/3}$。这里我注意到一个量化细节：内层是 $\limsup/\liminf$，论文没有断言 $I_m(Z)$ 在固定 $m$ 下收敛（`01:94-95` 明确写 "No convergence of $I_m(Z)$ at a fixed $m$ is asserted or assumed"）。我要证的目标必须是"不依赖固定 $m$ 收敛性"的形态，这直接决定后面的极限顺序只能靠选择子列来做。

于是我把自己的初始问题写成一句可操作的话：构造一个量，它既是多体能量的函数，又只由原子的外层决定，而且外层在正确标度下收敛到一个经典场论的对象。这句话里的三个"又"我当时全不知道怎么做，尤其第三个：外层怎么会有经典场？量子多体的外层电子是关联态，没有轨道图像。

## 2 我先试的三条死路，以及它们各自卡在哪

**死路一：直接相减两条 TF 渐近。** 上面第 1 节已经算过量级，误差吞掉信号。我停下来的机械点是 `01:10-13` 的那句 remainder may exceed the difference being sought，它说明这条路在信息层面就已经闭合，我做不出任何加强能救它，除非把误差做到比 $m^{7/3}$ 还小，那在 $m$ 远小于 $Z$ 时等于要求完整的次首阶展开，超出当前所有已知技术（Scott 猜想的严格化本身花了十几年）。

**死路二：借用伴生论文的首电离界。** `Foundation` 对同一模型给出 $0<c\le E_Z(Z-1)-E_Z(Z)\le C$ 对所有 $Z\ge1$ 一致（`01:109-110`）。我一开始很自然地想：把 $m$ 个电子一个一个移走，电离能就是 $m$ 个首电离能之和，每个都被 $C$ 夹住，于是 $I_m(Z)\le Cm$，量级 $m$ ，并非 $m^{7/3}$。这个上界方向本身就错得离谱，因为 $m^{7/3}$ 增长快得多，所以 $I_m\le Cm$ 不可能成立；真正的问题在于逐项相加丢失了"外层电子彼此排斥"的信息。我在 `06` 里看到论文的加法是把价格当积分变量，把 $I_m$ 写成对 $t\mapsto$ 亏损的积分（`06:52-60`），亏损 $qt^{3/4}$ 是 $t$ 的非线性函数，积分给出 $t^{7/4}$，这正是 $m^{7/3}$ 的来源。逐项相加等价于把非线性函数用它的端点值代替，指数自然塌成 1。这条路的失败让我明白：必须找一个"一次算多个电子"的变量，而这个变量只能是把粒子数放开、用惩罚项定价。

**死路三：把中性原子理论的黑箱直接搬到正价格。** `Foundation` 里有固定 offset 的反向比较命题 `\FFixedOffset`，形状是"若某态能量离最小 $E$ 不超过某个固定常数，则局部密度与局部场近似满足 TF 关系"。我试着直接把 $D_0=E_n-E$ 当成那个固定常数用。`01:191-194` 把这条路替我堵死了：

```tex
Their offset dependence is essential: a minimizing priced state has
energy at most $E+Cs^{-7}$, so the allowed offset grows as $s\to0$.
A fixed-offset conclusion from the neutral-atom theory cannot by itself
yield \cref{thm:main}.
```

机制我看懂了：价格 $\lambda=s^{-4}$ 越低（$s$ 越小），最小化 $E_n+\lambda n$ 的 $n$ 亏损越大，而 offset $D_0$ 由 `02:212-213` 的不等式 $0\le D_0\le C+s^{-4}(Z-n)$ 钉住，一旦 $Z-n=O(s^{-3})$ 就有 $D_0=O(s^{-7})$。发散。固定 offset 命题的前提在我这里根本不成立。所以本篇必须重做一批引理，让它们对"任意大 offset"成立，代价是把 offset 显式带进每一条估计的右端，这正是 `02:43-180` 那三个"导入"引理的存在理由，也是 `03`、`04` 全部估计都要多写一项 $\sqrt{D_0}$ 的原因。我读到这里意识到论文的组织原则："借来的东西必须先在更大参数范围下重新证明一遍"，这不是洁癖，是硬需求。

## 3 关键转折：给每个电子定价

转折点的技术内容是 Legendre 型变换。固定 $Z$，记 $E_n=E_Z(n)$，引入

```tex
 E=\inf_{n\ge0}E_n,\qquad
 P(\lambda)=\min_{n\ge0}\bigl(E_n+\lambda n\bigr),\qquad\lambda>0
```

（`01:119-120`，`02:21-22` 重复）。我用"定价"这个词是因为它的操作含义：原本我要在 $n=Z-m$ 这个硬约束下取能量，现在把约束换成每电子的罚款 $\lambda$，于是最优点自己根据罚款决定留多少电子。`01:122-125` 给出的理由是"local"：

```tex
Its advantage is local: replacing the exterior electrons by a trial state
need not preserve their number. The price accounts for the change exactly.
At the length scale $s=\lambda^{-1/4}$, the removed charge is of order $s^{-3}$.
```

这一句我停在"替换外层电子态不必保持粒子数"上，因为它是整个证明的支点。后面 `03` 的局部比较要在一个小球里插入一个 TF 型试验态（`03:440-478` 的插入论证），插入的粒子数由局部密度 $\rho$ 的质量决定，是个实数，甚至不能保证是整数。硬约束 $n=Z-m$ 下这种操作非法，价格化之后合法，罚款 $\lambda\int\rho$ 恰好记下了改动，而 `03:469-470` 那句 "the mean price paid by the inserted electrons is $\lambda\Tr\gamma$" 说明误差项里价格项完全抵消，没有留下任何粒子数相关余项。我原来的直觉是"约束变惩罚总会引入对偶间隙"，这里对偶间隙被 `eq:patch-upper-comparison` 与 `eq:patch-lower-comparison` 的配对吸收掉了：上界用插入试验态，下界用 Neumann 立方本征值计数，两侧同首阶系数 $T$，所以价格只以零阶项出现。

为什么尺度是 $s=\lambda^{-1/4}$，这个指数我算了一遍才敢信。TF 关系 $\rho=k(\phi_{\rm eff})^{3/2}$ 里，有效势要满足 $\phi_{\rm eff}=\phi-\lambda$；把势写上场量级 $\lambda$，则密度量级 $k\lambda^{3/2}$。电子亏质量是密度乘体积：$Z-n\sim\lambda^{3/2}s^3$。另一方面外层亏空产生的净电场在半径 $s$ 上应当与价格同量级，即 $(Z-n)/s^2\sim\lambda$。两式联立消去 $Z-n$：$\lambda s^2\sim\lambda^{3/2}s^3$，得 $s\sim\lambda^{-1/2}\cdot\lambda^{-1/2}$？我重算一次：第一式 $d=\lambda^{3/2}s^3$，第二式 $d=\lambda s^2$；令相等：$\lambda^{3/2}s^3=\lambda s^2\Rightarrow s=\lambda^{-1/2}$。与论文的 $s=\lambda^{-1/4}$ 不符，说明我的第一个"密度量级"式子写错在把 $k\lambda^{3/2}$ 当成了整个外区的密度。论文的实际逻辑在 `02:189`（粗亏损 $|Z-n|\le Cs^{-3}$）与 `02:263` 的外壳本征方程 $s^{-4}m_u\le Cu^{-2}N_u+\E\sum_i w_iB_{u/8}(x_i)$：那里 $m_u$ 是壳 $u$ 上的电子期望数，权重为 1 时 $m_u\sim N_u$，右边第一项 $u^{-2}N_u$ 是动能代价，第二项是内场排斥。于是 $\lambda\lesssim u^{-2}+\lambda u^2$？我不硬猜。可靠的做法是照抄论文给出的定义并检查自洽：$\lambda=s^{-4}$ 与 $|Z-n|\le Cs^{-3}$ 联立给出亏损 $Z-n=O(s^{-3})$ 即 $O(\lambda^{3/4})$，而 `05:16` 与 `06:36` 给出的精确值是 $s^3(Z-n)\to q$ 与 $d_{Z,m}(t)\to qt^{3/4}$，即 $Z-n=q\lambda^{-3/4}$。所以"移走的电荷随价格按 $3/4$ 次幂下降"，$t^{3/4}$ 是 TF 关系 $\rho\propto\phi^{3/2}$ 与球体积共同决定的：$\lambda$ 是势的高度，密度阈值 $\sim\lambda^{3/2}$，而外层壳体积 $\sim s^3$，用 $d=\lambda s^2$（电场平衡）替换掉 $s$ 得 $d\propto\lambda^{-1}\cdot$……我停在这里承认自己无法用两行纸面推理复现 $3/4$，只在第 13 节从能量侧用一个我能验证的算法（$\int_0^m q^{3/4}\,$ 反函数积分）确认 $(3/7)q^{-4/3}$ 与 $t^{3/4}$、$t^{7/4}$ 三者的相容性。这个我把握不了两行推导的事，标 [推测]：论文没有给 $s=\lambda^{-1/4}$ 的量纲推导，只把它作为定义写进 asymptotic regime（`02:26-29`）。

## 4 主定理的量化结构，我逐字对齐了一遍

```tex
\begin{theorem}[Generalized ionization energy]\label{thm:main}
For full nonrelativistic Coulomb atoms with two electron spin states,
\begin{equation}\label{eq:joint-limit}
 \frac{I_m(Z)}{m^{7/3}}\longrightarrow a_{\TF}>0
 \quad\text{whenever}\quad m\longrightarrow\infty,
 \qquad \frac Zm\longrightarrow\infty,
\end{equation}
where $Z>m\ge1$ are integers. In particular,
\begin{align}
 \lim_{m\to\infty}
  \frac{\limsup_{Z\to\infty} I_m(Z)}{m^{7/3}}
   &=a_{\TF},\label{eq:iterated-upper}\\
 \lim_{m\to\infty}
  \frac{\liminf_{Z\to\infty} I_m(Z)}{m^{7/3}}
   &=a_{\TF}.\label{eq:iterated-lower}
\end{align}
The inner limits are taken over integer $Z$ with $m$ fixed. No convergence
of $I_m(Z)$ at a fixed $m$ is asserted or assumed.
\end{theorem}
```

（`01:78-96`。）我把联合版本展开成量词：对任意满足 $m_j\to\infty$ 与 $Z_j/m_j\to\infty$ 的整数列（且逐 $j$ 有 $Z_j>m_j\ge1$），有 $I_{m_j}(Z_j)/m_j^{7/3}\to a_{\TF}$。这里 $I_m(Z)=E_Z(Z-m)-E_Z(Z)$（`01:54-55`）是谱下确界之差。联合版本强在：它不需要内层极限存在，也不要求 $Z/m$ 以任何速率趋于无穷。我在第 12 节会看到 `06:345-371` 的迭代极限推导完全只是联合版本的一次选择论证，因此 Theorem 1.1 的第二段实际上是第一段的免费推论，论文的"另得到两个猜想的迭代极限"这句摘要内容强度低于它的字面宣传。

`01:105-106` 有一句很容易被跳过的话，但我认为它是本篇相对 `Foundation` 的真正增量：

```tex
Here the energy is the exact spectral infimum of
\cref{eq:hamiltonian}, with no restriction to Slater determinants.
```

也就是任意关联费米子态都在类里。文献里同样的电离结论分布在三个不同的变分问题里：TFvon-Weizsäcker 的均匀超额电荷界（Benguria-Lieb）、约化 Hartree-Fock（Solovej 1991）、无限制 Hartree-Fock（Solovej 2003），`01:35-42` 点明这些"concern different variational problems"，而到任意关联态需要新的屏蔽估计，来源是条件多体态。这给了我一条自检标准：任何我只在 Slater 行列式上验证的不等式，都不算证完。

## 5 Theorem 1.2：中间结果的两个输出

```tex
\begin{theorem}[Deficit at a prescribed price]\label{thm:priced-deficit}
There is a universal number $q>0$ such that, for every sequence satisfying
\[
 \lambda=s^{-4},\qquad s\longrightarrow0,
 \qquad Zs^3\longrightarrow\infty,
\]
and every choice of $n$ minimizing $E_n+\lambda n$, one has
\[
 s^3(Z-n)\longrightarrow q.
\]
The number $q$ is the exterior Coulomb charge of the unique classical solution, tending uniformly to zero at infinity,
of
\[
 \Delta F=4\pi k\bigl((F-1)_+\bigr)^{3/2}
 \quad\text{on }\R^3\setminus\{0\},
 \qquad k=(5T/3)^{-3/2},
\]
that is bounded above and below by positive multiples of $|x|^{-4}$ near
zero. The density $k((F-1)_+)^{3/2}$ has bounded support, and
$F(x)=q/|x|$ outside that support.
Moreover,
\[
 a_{\TF}=\frac37q^{-4/3}.
\]
\end{theorem}
```

（`01:129-153`。）它有两个输出：一是亏损律 $s^3(Z-n)\to q$，对所有最小化扇区一致（包括同一个价格下多个扇区同时最小化的情形，`01:126-127` 强调 "including at prices where several sectors minimize"）；二是 $a_{\TF}=\frac37q^{-4/3}$。注意"$q$ 是某个经典解的外 Coulomb 电荷"这句话同时承担了存在性、唯一性与正性：存在性由量子侧构造出来（`05:306-332` 的证明末句 "In particular a solution exists, is unique, and is radial"），唯一性由 `05:243-304` 的引理给出。这个安排是我见过的"用中间定理顺带证明极限模型解的存在唯一"的一个干净样本：如果先单独造一个经典解再往回证，就得处理解的正性下界 $c|x|^{-4}$，而这恰是最难的部分（奇异核附近的电荷在多次平均下容易丢），论文把它和量子紧性捆在一起，用障碍不变量同时保住两边。

$k$ 的来历我可以精确定位：它是 TF 关系里的密度系数，$k=(5T/3)^{-3/2}$ 来自把 $T\rho^{5/3}$ 对 $\rho$ 求导并与势平衡：$\tfrac{d}{d\rho}(T\rho^{5/3}-\phi\rho)=\tfrac{5T}{3}\rho^{2/3}-\phi=0$，得 $\rho=(3\phi/5T)^{3/2}=(5T/3)^{-3/2}\phi^{3/2}$。`03:491` 那个展开系数 $\frac{5T}{3}\rho^{2/3}-W$ 就是同一导数，所以 $k$ 与它必须一致，这是常数链条里的一个自洽点，我在第 14 节台账里把它标出来。

## 6 归一化：$7/3$、$\kappa$、$T$、两自旋态

Hamiltonian 与扇区能量（`01:47-56`）：

```tex
 H_{Z,N}
 =\sum_{i=1}^N\left(-\frac12\Delta_i-\frac{Z}{|x_i|}\right)
   +\sum_{1\le i<l\le N}\frac1{|x_i-x_l|}
```

作用在 $\bigwedge^N L^2(\R^3;\C^2)$，$E_Z(N)=\inf\sigma(H_{Z,N})$，$E_Z(0)=0$。这里 $\C^2$ 就是"两个自旋态"，Pauli 原则体现为整体对 $(x_i,\sigma_i)$ 反对称，每个空间轨道可被两个自旋占满。

TF 动能系数 $T=\frac3{10}(3\pi^2)^{2/3}$（`01:58`，`02:14`）。我自己推一遍以确保 $(3\pi^2)^{2/3}$ 里的 3 是"两自旋"的产物：均匀自由费米气体，每个自旋占据动量球 $|p|\le p_F$，两自旋总密度 $\rho=2\cdot\frac{1}{(2\pi)^3}\cdot\frac{4\pi}3p_F^3=\frac{p_F^3}{3\pi^2}$，故 $p_F=(3\pi^2\rho)^{1/3}$。动能密度 $2\cdot\frac1{(2\pi)^3}\int_{|p|\le p_F}\frac{|p|^2}2dp=\frac1{(2\pi)^3}\cdot\frac{4\pi p_F^5}{5}=\frac{p_F^5{}}{10\pi^2}$。用 $\rho$ 表示：$p_F^5=(3\pi^2)^{5/3}\rho^{5/3}$，系数 $\frac{(3\pi^2)^{5/3}}{10\pi^2}=\frac3{10}(3\pi^2)^{2/3}\equiv T$，因为 $\frac{(3\pi^2)^{5/3}}{\pi^2}=3(3\pi^2)^{2/3}$。核对：$3\cdot(3\pi^2)^{2/3}=3\cdot 9.5702=28.71$，$(3\pi^2)^{5/3}/\pi^2=29.6088^{5/3}/9.8696=536.5/9.8696=54.36=3\cdot18.12$？我算错了中间值：$29.6088^{5/3}$：$\ln 29.6088=3.388$，$\times5/3=5.647$，$e^{5.647}=283.5$，$283.5/9.8696=28.73$。对，与 $3(3\pi^2)^{2/3}=28.71$ 一致。$T=2.8711$。

如果只有一个自旋态，$\rho=p_F^3/(6\pi^2)$，$T$ 换成 $\frac3{10}(6\pi^2)^{2/3}$，即 $\kappa$ 常数中的 $3\pi^2\to 6\pi^2$；文献里通常写成 $\rho=(3\pi^2)^{2/3}$... 准确说法：$T\propto q^{2/3}$，$q=2$ 是自旋简并度，$q=1$ 时 $T$ 乘以 $2^{-2/3}$。我在第 16 节把这条与 Lieb-Simon 的 $\kappa_{TF}$ 记号对齐。Lean 侧 `Model.lean:53` 写作 `tfKinetic : ℝ := (3 / 10 : ℝ) * (3 * Real.pi ^ 2) ^ (2 / 3 : ℝ)`，与 tex 逐字一致；`FormVector` 的自旋变量是 `Spins N := Fin N → Fin 2`（`Model.lean:13`），这就是"两自旋态"的形式化落点，$\wedge^N L^2(\R^3;\C^2)$ 被写成"自旋标签函数 $\times$ 空间构型函数 $+\,\mathrm{Sign}$-等变条件"（`Model.lean:29-31`），反对称性用排列符号实现。

标度核对，$7/3$ 的第一次出现：$\mathcal T_Z(\rho)$ 三项在 $\rho(x)\mapsto m^2\sigma(m^{1/3}x)$、$Z\mapsto Z/m$ 下同步乘 $m^{7/3}$。我逐项算过：动能 $\int\rho^{5/3}dx=m^{10/3}\cdot m^{-1}\int\sigma^{5/3}=m^{7/3}\int\sigma^{5/3}$；核吸引 $Z\int\rho/|x|=Z\,m^{2}\cdot m^{-1}\cdot m^{1/3}\int\sigma/|y|=m^{7/3}(Z/m)\int\sigma/|y|$；排斥 $D(\rho)=m^{4}\cdot m^{-2}\cdot m^{1/3}D(\sigma)=m^{7/3}D(\sigma)$。三项同时成立的关键是"核电荷与质量一起按 $m$ 缩放"，这就是 `06:333-336` 的

```tex
 E_Z^{\TF}(N)=m^{7/3}E_{Z/m}^{\TF}(N/m),\qquad
 I_m^{\TF}(Z)=m^{7/3}I_1^{\TF}(Z/m).
```

于是 $m^{7/3}$ 的指数完全由"TF 只有一个能量标度 $Z^{7/3}$"这一事实换元得到：把 $Z\to Z/m$ 时的 $Z^{7/3}\to(Z/m)^{7/3}$ 乘回 $m^{7/3}$ 就是 $Z^{7/3}/m^{7/3}\cdot m^{7/3}$... 我更愿意写成可核对的形式：$I_1^{\TF}(Z/m)\to a_{\TF}$（一个纯数极限），故 $I_m^{\TF}(Z)=m^{7/3}I_1^{\TF}(Z/m)\sim a_{\TF}m^{7/3}$。指数的来源就是 $5/3$ 幂的齐次性与三维体积元，没有别的神秘成分。这一点在 `06:325-340` 只用四行写完，我第一次读时以为它省略了什么，二次读确认没有：密度指数 $5/3$ 加空间维数 3 决定 $d=\text{dim}=3$ 时的能量齐次次数 $7/3=(d\cdot\frac53-d\cdot1+... )$，具体地 $m^{2}\cdot m^{5/3}/m = m^{7/3}$ 的质量归一化给出次数 $5/3+1-1/3\cdot$… 我在第 13 节给一个我能完全验证的版本。

另一个必须钉住的量是 $a_{\TF}=\frac37q^{-4/3}$。$7/4$ 与 $7/3$ 之间差一步积分：亏损律 $d(t)=qt^{3/4}$，能量增益 $\mathcal E(t)=\frac37qt^{7/4}$。验证：$\frac{d}{dt}\bigl(\tfrac37qt^{7/4}\bigr)=\tfrac34qt^{3/4}$，而 $\frac{d}{dt}\bigl(\tfrac47qt^{7/4}\bigr)=qt^{3/4}=d(t)$，两项之差正好是 $\tfrac37qt^{7/4}$（`06:71-74` 的 $G+t\,d$ 结构）。$\frac47$ 是"对价格积分"，$\frac37$ 是"减掉 $t\cdot n$ 那一项"，比例 $3:4$ 来自指数 $7/4$ 的 $1/7$ 分解。这个 $\frac37$ 与 $\frac47$ 的分工我第一遍读反了，见第 12 节。

## 7 渐近区域的边界：指数 4 从哪来，$Z/m\to\infty$ 处怎么塌

这是本篇我最想拆开的两处之一。先把 regime 的原文摆出来（`02:26-29`）：

```tex
\begin{equation}\label{eq:scaling-regime}
 \lambda=s^{-4},\qquad s\longrightarrow0,
 \qquad Zs^3\longrightarrow\infty.
\end{equation}
```

### 7.1 为什么罚项的幂是 $-4$

我的第一个反应是"量纲分析给的"，纸面上算一遍发现量纲不够用：原子单位下 $[\lambda]=E$、$[s]=L$，而 $E\sim L^{-2}$（动能主导），于是 $\lambda\sim s^{-2}$ 才是"量纲正确"的选择，论文写 $s^{-4}$，说明 4 来自非线性结构，来自 TF 反应项的自相似指标。我把这个推导做完整：

设外层场在半径 $d$ 上按 $F\sim d^{-\alpha}$ 衰减，要求它是方程 $\Delta F=4\pi k F^{3/2}$ 的一个自相似解。径向 Laplace 算子把次数降 2：$\Delta d^{-\alpha}=\alpha(\alpha+1)d^{-\alpha-2}$（我用 $\alpha=-4$ 时得到 $(-4)(-3)=12$，与 `04:20` 那句 $\Delta b_r=Bd^{-6}(12-20r/8d)$ 的 12 对得上）。反应项次数 $-\tfrac32\alpha$。两者相等给出

$$\alpha+2=\tfrac32\alpha\quad\Longrightarrow\quad \alpha=4 .$$

于是奇异轮廓的自然衰减率是 $|x|^{-4}$，这正是 Theorem 1.2 里"bounded above and below by positive multiples of $|x|^{-4}$ near zero"的来源，也是 `05:252-255` 的 $A_{\rm S}=(12/(4\pi k))^2$ 的来源：把 $F=A|x|^{-4}$ 代入，$12A=4\pi k A^{3/2}$，$A^{1/2}=12/(4\pi k)$。我顺手把这个常数算出来（论文没给数值）：$k=(5T/3)^{-3/2}$，所以 $A_{\rm S}=9k^{-2}/\pi^2=9(5T/3)^3/\pi^2$，用 $T^3=\frac{243}{1000}\pi^4$ 得 $(5T/3)^3=\frac{125}{27}\cdot\frac{243}{1000}\pi^4=\frac98\pi^4$，故 $A_{\rm S}=\frac{81}{8}\pi^2\approx 99.93$。文献里更常见的 144 对应方程 $\Delta\phi=\phi^{3/2}$ 的归一化（$12\cdot144=144^{3/2}=1728$ 成立），差的就是 $4\pi k$ 这个前置系数，我这里核对到的 $\frac{81}{8}\pi^2$ 属于本篇记号，标为我的算术推导。

有了 $F\sim d^{-4}$，剩下的幂全部被固定：

1. 场在尺度 $s$ 上的重标度不变量只能是 $F_s(x)=s^4(\text{field})(sx)$（`05:78` 的定义正是 $F_s(x)=s^4(V-K*\mu_j)(sx)$）。要让极限方程里的罚项写成"$-1$"，必须 $s^4\lambda=1$，即 $\lambda=s^{-4}$。所以 $-4$ 与 $\alpha=4$ 是同一件事的两种写法。
2. 密度是场的 $3/2$ 次幂：$\mu\sim d^{-6}$，重标度不变量是 $\rho_s(x)=s^6\mu_j(sx)$（`05:79`），极限关系 $\rho=k((F-1)_+)^{3/2}$（`05:118`）在 $s^\cdot$ 变量下形式不变。
3. 尺度 $s$ 的球壳里的电子数是 $s^6\cdot s^{-6}\cdot s^3=s^{-3}$，这就是 `01:125` 那句 "the removed charge is of order $s^{-3}$" 与 Lemma 2.4 里 $|Z-n|\le Cs^{-3}$ 的机械来源。

### 7.2 $Zs^3\to\infty$ 的物理读法与两个失败面

$Zs^3$ 是重标度后的核电荷 $Zs^3\delta_0$（`05:83`：$\Delta F_s=-4\pi Zs^3\delta_0+4\pi\rho_s$）。要求它趋于无穷，等价于要求 $s\gg Z^{-1/3}$，也就是价格尺度远大于 TF 原子半径 $Z^{-1/3}$，等价于 $\lambda\ll Z^{4/3}$。用固定扇区变量写更直白：`06:32-33` 取 $s=t^{-1/4}m^{-1/3}$，则

$$Zs^3=t^{-3/4}\frac Zm ,$$

所以在固定价格比 $t$ 下 $Zs^3\to\infty$ 就是 $Z/m\to\infty$。边界 $Z/m=O(1)$ 意味着我在同时移走宏观比例的电子。

失败面一，极限方程变形。若 $Zs^3\to c\in(0,\infty)$，`05:83` 的重标度方程里保留一个强度为 $c$ 的真实点源，`05:117-121` 的极限 PDE 就不再是 $\R^3\setminus\{0\}$ 上的无源方程，`05:243` 的唯一衰减轮廓引理的前提（"classical solution on $\R^3\setminus\{0\}$ 且 $c|x|^{-4}\le F\le C|x|^{-4}$"）与"$F\to0$ at infinity"两条件同时被破坏：带点源的衰减解是通常的有限核 TF 屏蔽问题，其外区电荷依赖于 $c$，$q$ 不再是普适常数。此时正确的答案应当是 TF 形状函数 $\varepsilon(\nu)=E^{\TF}(Z,\nu Z)/Z^{7/3}$ 在 $\nu<1$ 的一段，$I_m$ 量级为 $Z^{7/3}$，与 $m^{7/3}$ 只在 $m\ll Z$ 时相容。我把这条线接到 `01:29-33` 提到的 Ivrii 结果：当 $Z^{5/7}=o(Z-N)$ 且 $Z-N=o(Z)$ 时逐电子电离能与 TF 化学势一致；本篇恰好落在 $Z-N=m$ 为整段求和的区间，两者不重合，那几行原文其实是在替我标注"哪些区域已被别人占据、哪些是本文新增"。

失败面二，障碍初始化失去尺度分离。`04:75` 起的最小尺度是 $r_0=\eps Z^{-1/3}$（即 $Zr_0^3=\eps^3$），初始化全程依赖 $r_0/s\to0$。`04:88-91` 的链条是：把事件 $A_y=\{P_0(y)>0.05Z/r_0\}$ 的原始条件边缘态取出来，它的 unshifted offset 至多 $D_0+Cr_0^{-2.02}\log^5(e/r_0^{40})$，而

```tex
By \cref{eq:rough-deficit}, $D_0\le Cs^{-7}$.  Since $r_0/s\to0$,
the displayed offset is at most $Z^{7/3}$ eventually, with $\eps$ fixed.
```

这一步一旦 $s\sim Z^{-1/3}$ 就变成 $D_0=O(Z^{7/3})$，仍然有界但常数是 $\eps$ 的负幂，随后 `04:102-107` 的 Hölder 估计给出

$$\E[P_0(y)\mid A_y]\le CZ^{7/5}r_0^{1/5}=\eps^{6/5}Z/r_0\quad(\text{原式 }04{:}104\text{-}105),$$

我核对过两端：$Z^{7/5}r_0^{1/5}=Z^{7/5}\eps^{1/5}Z^{-1/15}=\eps^{1/5}Z^{4/3}$，$\eps^{6/5}Z/r_0=\eps^{6/5}Z^{4/3}\eps^{-1}=\eps^{1/5}Z^{4/3}$，两端精确相等，所以这里唯一可调的旋钮是 $\eps^{1/5}$。而 $0.05$ 的目标值来自 $Z/r_0$ 这个核场尺度。若 offset 超过 $Z^{7/3}$，`02:66-68` 的 $\int\rho^{5/3}\le C(Z^{7/3}+\delta)$ 右端就不再是 $CZ^{7/3}$，是 $C\delta$，整个初始化要 $\delta^{3/5}\le\eps^{1/5}Z^{4/3}$ 才够，$\delta\le Cs^{-7}$ 给的却是 $\delta^{3/5}\le Cs^{-21/5}$；把 $s\gg Z^{-1/3}$ 撤掉后 $s^{-21/5}$ 与 $\eps^{1/5}Z^{4/3}$ 不可比，比较失效。这解释了一件我原本想不通的事：为什么 $\eps$ 与 $Z$ 的依赖必须是这种"先固定 $\eps$ 再让 $Z$ 走"的顺序。

失败面三，$m$ 有界。$m$ 固定时 $s=t^{-1/4}m^{-1/3}$ 不再趋于 0，第 9 节的全部 $o(\cdot)$ 误差（例如 `03:513` 那串 $a^{4.98}\log^5, a^{0.1}, a^{2.8}, a^{0.6}, a^{1.6}$）都不再闭合，而 `01:94-95` 明说固定 $m$ 的收敛性既没被断言也没被假定。迭代极限那一侧靠 `06:348-366` 的"先固定 $m_j$ 再任选大 $Z_j$"绕开，代价是只得到 $\limsup/\liminf$ 的外层极限。

## 8 §2 的五个引理：机器件的逐个拆法

### 8.1 Lemma 2.1 扇区与能量估计

(a) 逐字引用（`02:45-69`，环境头 `\begin{lemma}[Sector and energy estimates]\label{lem:sector-inputs}`，中间省略的只有 `\label` 与公式标签行）：

```tex
The sequence $E_n$ is nonincreasing.  If $E_n<E_{n-1}$, there is a normalized
ground state in sector $n$, and $n\le2Z+1\le3Z$.  There is a largest such
index $N_*$, with $Z\le N_*\le3Z$, and
\[
 E=E_{N_*}=E_n\quad(n\ge N_*).
\]
...
\begin{equation}\label{eq:ground-multiplier}
 \langle F\Psi,H_{Z,n}F\Psi\rangle
       -E_n\|F\Psi\|_2^2
       =\frac12\E_\Psi|\nabla F|^2,
\end{equation}
... every unshifted $\delta$-state in a sector $n\le3Z$ satisfies
\begin{equation}\label{eq:global-density-input}
 \int_{\R^3}\rho_\psi^{5/3}\le C(Z^{7/3}+\delta).
\end{equation}
```

(b) 推导。单调性 $E_n\ge E_{n-1}$ 来自把第 $n$ 个电子放到无穷远：取 $\psi\in\wedge^n$ 为基态，把一个轨道推到半径 $R\to\infty$ 的团里，核吸引 $\to0$、排斥 $\to0$，得 $E_{n-1}\le E_n+o(1)$。严格下降 $E_n<E_{n-1}$ 时基态存在，这是 Sigal-Solovej 型的结合性判据，论文把它整个借给 `Foundation` 的 `\FSectors`。$n\le 2Z+1$ 是单电子在 $Z$ 核下的轨道计数上界的一种表述：$\wedge^n L^2(\R^3;\C^2)$ 上若 $n>2Z+1$ 则第 $n$ 个电子必然未结合，我用它来确认 $N_*\ge Z$：中性扇区能量确实严格下降（`eq:neutral-offset` 说 $E_Z(Z)\le E+C$）。乘子恒等式我算过一遍：$\langle F\Psi,H F\Psi\rangle=\frac12\int|\nabla(F\Psi)|^2+\dots$，展开 $|\nabla(F\Psi)|^2=F^2|\nabla\Psi|^2+\Psi^2|\nabla F|^2+2F\Psi\nabla F\nabla\Psi$，交叉项积分 $\int F\Psi\,\nabla F\cdot\nabla|\Psi|^2/2 = \int |\nabla\Psi|^2$ 部分用基态方程 $\sum_j\frac{\delta}{\delta x_j}$ 换掉，最后剩下的正是 $\frac12\E|\nabla F|^2$；论文只写"interpreted as a quadratic form"，因为在 form 域里这不是恒等式，是需要逼近的陈述，`Foundation` 给了证明。

(c) 每个数为什么是这个值。$2Z+1$ 与 $3Z$：后者只是前者的宽松化，$Z\le N_*$ 用中性原子至少结合 $Z$ 个电子这一事实（在 TF 层面 $\int\rho_0=Z$，见 `06:180`）；$\frac12\E_\Psi|\nabla F|^2$ 里的 $\frac12$ 是动能系数 $-\Delta/2$；`eq:global-density-input` 的 $Z^{7/3}$ 就是 TF 首阶能量，$\delta$ 前系数 1 表明"能量超出最小值 $\delta$ 就直接进 $\rho^{5/3}$ 范数"，这正是 Lieb-Thirring $\sum|\lambda_i|_+^{5/2}\lesssim\int\rho^{5/3}$ 的势能版本，`01:163-166` 承认这里只用粗版本。

(d) 候选失败路线。其一，若在 $F$ 无界梯度的截断乘子上用这个恒等式，交叉项的边界项会留下来，机械上是 form 域稠密性不够，`03:276-280` 特意用 $\sqrt{S_u}$ 这种"Lipschitz 包括在零点"的构造就是为了避开；其二，$n\le3Z$ 若被放宽成 $n$ 任意大，`eq:global-density-input` 就控制不了密度，因为多出的电子在无穷远不带能量代价；其三，把 $C(Z^{7/3}+\delta)$ 换成 $CZ^{7/3}$ 会砍掉 $\delta$ 通道，第 10 节的障碍初始化在 offset 达到 $Z^{7/3}$ 时立刻失去可用不等式。这三条我都标 [推测]，论文没有讨论替代方案。

### 8.2 Lemma 2.2 任意 offset 的局部场

(a) 原文（`02:107-127`）关键部分：

```tex
For every normalized unshifted $\delta$-state of finite particle number,
$P_*\le C$.  Fix $y\ne0$ and $C_0\ge1$. ...
\begin{equation}\label{eq:local-field-input}
 \left\|(\E[J_y\mid X])_+\right\|_2
       \le C(C_0)\frac{m_y}{a_y}.
\end{equation}
The constants are independent of $Z$, the sector, the state, $y$, and
$\delta$, apart from the displayed dependence through $m_y$.
```

其中 `02:97-102` 定义了

```tex
 m_y=\max(a_y^{-3},1)+\sqrt{\delta a_y},\qquad
 J_y=V(y)-\sum_{|x_i-y|\ge Aa_y}\frac1{|y-x_i|},
```

以及 $P_*=\max\bigl(1,\sup_{y\ne0}\E[\#B_y]^2/m_y^2\bigr)$，$L=10^5$、$A=40$、$a_y=|y|/L$、$B_y=B(y,a_y)$。

(b) 推导。$J_y$ 是"核势减去远距离电子势"，即局部有效场的正部来源：把 $|x_i-y|\ge Aa_y$ 的电子剔掉，剩下的排斥用 Jensen 换成条件期望的非正贡献。$m_y$ 的两项分别对应"球 $B_y$ 里的典型电子数"：$\max(a_y^{-3},1)$ 是尺度 $a_y$ 球内的 TF 计数（密度 $\sim a_y^{-6}$ 给体积 $a_y^3$ 内 $a_y^{-3}$，与第 7.1 节的 $\mu\sim d^{-6}$ 一致），$\sqrt{\delta a_y}$ 是 offset 通过屏蔽产生的附加项，来自 `eq:conditional-inner-field` 的 $\sqrt{\delta/u}$ 型估计（`02:154`）。$P_*\le C$ 的论证论文借给 `Foundation`，但 `02:104-105` 先说了它有限是因为计数被扇区粒子数控制而 $m_y\ge1$。截断条件 $D_z^2/(a_zm_z)\le C_0\sqrt{P_*}$ 是"分割产生的动能代价除以可用电子数"的比值有界，`02:116` 的 $\sum_h(|\nabla o_h|^2+|\nabla c_h|^2)\le\sum_zD_z^2a_z^{-2}\ind_{B_z}$ 是把这个代价局部化到可比的 $B_z$ 里。

(c) 常数的机械理由。$a_y=|y|/L$ 与 $L=10^5$：必须 $Aa_y\ll|y|$，即 $A/L=4\times10^{-4}$，才能保证"排除球 $B(y,Aa_y)$ 以外的电子"这个操作不越过原点，从而 $J_y$ 里的核势 $V(y)$ 与远端排斥可比；同时 $L$ 越大 $B_y$ 越小，球内计数越少，估计越接近点态，代价是覆盖 out support 需要的格子数增多，两个效应在 $C(C_0)$ 里平衡。$A=40$ 我找到两处使用点：`02:99` 的排除半径与 `03:342-343` 的包含关系 $B(y,20a)\subset B(z,Aa_z)$，后者要求 $A\ge20+|y-z|/a_z$，而 $z\in B(y,10a)$、$a_z\approx a$ 给出右端 $\le30$，所以 40 是"够用且留一倍余量"的取整。[推测]，论文没写 40 与 20 的对应。$m_y/a_y$ 的量级：$a_y^{-4}$（当 $a_y<1$），与 $V(y)=Z/|y|$ 的场尺度可比。$\delta$ 的任意性是本条的存在理由，`02:130-133` 那句 "it has no restriction that the offset stay bounded along a sequence" 就是在声明这一点。

(d) 失败路线。第一条：若把 $P_*\le C$ 降级为 $P_*<\infty$（每系统有限），$C(C_0)$ 里的 $\sqrt{P_*}$ 就会带上系统依赖，第 9 节的一致比较立刻失效；[推测]这条一致性来自 `Foundation` 的 Lieb-Thirring 型计数，本篇只是引用。第二条：截断条件若写成全局 $\sum|\nabla o_h|^2\le C/u^2$（不带格子分解），`02:111-119` 的可比格子假设破裂，$C(C_0)$ 无法与 $y$ 无关。第三条：$\|\cdot\|_2$ 若换成 $\|\cdot\|_1$，`03:214-216` 的场封顶不等式右端 $\E_Q[J_y-\lambda]$ 就控不住 $b_0$ 的尾部，那一步在概率上是靠 $L^2$ 加 Cauchy-Schwarz 才拿到拉伸指数尾（`03:222` 的 stretched-exponential tail）。

### 8.3 Lemma 2.3 环形屏蔽

(a) 原文（`02:136-158`）：

```tex
 \left\|\#\{i:\alpha u\le|x_i|\le\beta u\}\right\|_2
   \le C_{\alpha,\beta}
           \bigl(\max(u^{-3},1)+\sqrt{\delta u}\bigr).
...
 \left\|\sup_{u/2\le|x|\le4u}
              \bigl(\E[B_{u/8}(x)\mid Y]\bigr)_+\right\|_2
 \le C\left(\frac{\max(u^{-3},1)}u+\sqrt{\frac\delta u}\right).
```

(b) 推导。第一条是"环内计数的二阶矩"，与 $m_y$ 的第一、二项一一对应：$u^{-3}$ 是环内 TF 计数，$\sqrt{\delta u}$ 是 offset 项；$L^2$ ，并非 $L^1$ 是后面用 Cauchy-Schwarz 的准备。第二条里 $B_{u/8}(x)=V(x)-\sum_{|x_i|<u/8}\frac1{|x-x_i|}$ 是"扣掉内区电子后的内场"，取 sup 前先把半径 $u/8$ 的核排除掉，剩下的势在 $u/4<|x|<6u$ 上调和。证明的关键在 `02:166-173`：把 `Foundation` 的级数

```tex
 \frac{\max(u^{-3},1)+\sqrt{\delta u}}u
 +\sum_{j\ge0}
       \frac{\max((2^jh)^{-3},1)+\sqrt{\delta\,2^jh}}
            {\max(u,2^jh)}.
```

在 $h=u/8$ 下几何求和。我实际算了第二项：$j\ge0$ 时 $2^jh\ge h=u/8$，$\max(u,2^jh)$ 在 $2^j<8$ 时是 $u$、之后是 $2^jh$；前一段 $\sum_{j<3}\frac{u^{-3}}{u}\approx u^{-4}$，后一段 $\sum_j\frac{(2^jh)^{-3}}{2^jh}=h^{-4}\sum2^{-4j}\approx u^{-4}$；同一结构对 $\sqrt{\delta\,2^jh}/\max(u,2^jh)$ 给出 $\sqrt{\delta u}/u$ 与 $\sqrt\delta h^{-1/2}\sum2^{-j/2}$... 后者在 $h=u/8$ 时是 $\sqrt{\delta/u}$ 量级 ✓。所以求和后正是右端。`02:174-179` 还补了两件小事：边界球概率为零（一粒子密度绝对连续），以及条件调和版本靠"内源与环一致分离"下的积分号下求导。

(c) $u/8$、$u/4$、$4u$、$6u$ 这些数是嵌套余量：内排除半径 $u/8$ 与屏蔽区 $u/4<|x|<6u$ 之间留一倍距离，使"外区电子对内的排斥"在环内是调和的；sup 区 $u/2\le|x|\le4u$ 严格落在屏蔽区内，两边各留一倍。$\alpha,\beta$ 固定在 $(0,\infty)$ 而 $C_{\alpha,\beta}$ 依赖它们，说明这条估计在环宽趋于 0 时会退化，本篇所有用法（`03:182-199`、`02:330`）都取可比宽度。$1$ 与 $u^{-3}$ 取 max 是为了同时覆盖 $u<1$（原子内部，计数受总粒子数 $Z$ 限制）与 $u>1$（外部，受 TF 密度限制），Lemma 2.4 里 $s<1$，所以 $\max(s^{-3},1)=s^{-3}$ 起作用。

(d) 失败路线：其一，$B_{u/8}$ 的排除半径若与 sup 区重合，调和性失去，`02:176-179` 的积分号下求导失效；其二，若把 $Y$ 的 out support 允许散布在多个不相关环带，`02:148-149` 的"落在 $\{u/4\le|x|\le8u\}$ 且梯度和 $\le C/u^2$"前提破坏，$C$ 依赖固定梯度界的声明（`02:156`）会失控；其三，这两条估计"allow every finite $\delta$"但都不含最小化性质（`02:179` 明说 "No minimizing property is required"），所以若我试图用它们去下界能量、而不只是下界正部场，方向就错了：正部是单边控制，负场在这里完全没有信息，这也是第 9 节必须单独控制 $W_-$（`03:615-636`）的原因。

### 8.4 Lemma 2.4 粗亏损界

(a) 原文（`02:184-192`）：

```tex
\begin{lemma}\label{lem:priced-rough}
The minimum $P(\lambda)$ is attained.  Along \cref{eq:scaling-regime}, every
minimizing index $n$ is eventually nonzero and strictly bound.  For a
normalized ground state $\Psi$ in that sector, put $D_0=E_n-E$.  Uniformly
over all these choices,
\begin{equation}\label{eq:rough-deficit}
 |Z-n|\le Cs^{-3},\qquad 0\le D_0\le Cs^{-7}.
\end{equation}
\end{lemma}
```

(b) 推导。存在性：$E_n$ 在 $n\ge N_*$ 上是常数，加 $\lambda n$ 后严格增，故下确界在前段取到（`02:195-197`）。最小指标若 $n>0$，与 $n-1$ 比较得 $E_{n-1}-E_n\ge\lambda>0$（`02:199-02`），所以该扇区严格结合、有基态、$n\le3Z$。真空排除用一个固定 $Z$ 的氢原子型试验态：`02:203` "A normalized exponential one-electron trial of radius $Z^{-1}$ has energy $-Z^2/2$"，于是 $P(\lambda)\le-Z^2/2+\lambda<0$ 只要 $\lambda<Z^2/2$，而 $\lambda/Z^2=s^2/(Zs^3)^2\to0$（`02:205-207`）。这个不等式我验算：$\lambda/Z^2=s^{-4}Z^{-2}$，令 $u=Zs^3$，则 $s^{-4}Z^{-2}=s^{-4}Z^{-2}\cdot\frac{s^6}{s^6}$... 直接代 $Z=us^{-3}$：$Z^2=u^2s^{-6}$，$\lambda/Z^2=s^{-4}/(u^2s^{-6})=s^2/u^2\to0$ ✓ 正是原文形式。offset 上界：中性扇区可比，$P(\lambda)\le E_Z(Z)+\lambda Z$，减去 $E_n+\lambda n$ 的定义得 $E_n-E\le C+\lambda(Z-n)$，即 `eq:priced-offset`。亏损上界：在 $|x|=s$ 上取 $B_{s/8}$ 的球面平均，`02:215-217` 说它等于 $(Z-\#\{|x_i|<s/8\})/s$，期望 $\ge(Z-n)/s$... 这里我用 Newton 壳层定理验一下：球面平均 $\overline{V-K*\rho}(s)=(Z-N_{<s})/s+\int_{|x|>s}(\frac1s-\frac1{|x|})\rho$，第二项非负，而 $B_{u/8}$ 的定义（扣掉 $|x_i|<u/8$ 的电子）在 $u=s$ 时球面平均正好是 $\bigl(Z-\#\{|x_i|<s/8\}\bigr)/s$ 加上外层贡献；论文取期望后用 Lemma 2.3 的 $\le C(\max(s^{-3},1)/s+\sqrt{\delta/s})$ 控制，得 $Z-n\le C(s^{-3}+\sqrt{D_0s})$（`02:219-02`）。闭合：令 $d=Z-n\ge0$、$z=s^3d$，由 `eq:priced-offset` 有 $D_0s^7\le Cs^7+z$，代入得

$$z\le C\bigl(1+\sqrt{z+Cs^7}\bigr),$$

这是一个 $z$ 的二次根自洽不等式，$z\to\infty$ 时左端线性快于右端 $\sqrt z$，故 $z$ 有一致界 ✓。$d<0$ 时 `eq:priced-offset` 给 $d\ge-C\lambda\cdot s$... 原文是 $d\ge-Cs^4$，来自 $0\le D_0\le C+s^{-4}(Z-n)$ 与 $D_0\ge0$：$s^{-4}(Z-n)\ge-C$ 即 $d=Z-n\ge -Cs^4$ ✓。最后代回 `eq:priced-offset` 得 $D_0\le C+s^{-4}Cs^{-3}=Cs^{-7}$ ✓。

(c) 为什么 $-3$ 与 $-7$。$-3$ 是第 7.1 节里"尺度 $s$ 上密度 $s^{-6}$、体积 $s^3$"的乘积，也是 $\max(u^{-3},1)/u$ 乘 $s$ 后 $s^{-3}$ 的直接读数；$-7=-3-4$ 是 $s^{-4}(Z-n)$ 的乘法结果，即"$-3$ 的亏损乘价格 $\lambda=s^{-4}$"。这两个数是后面所有发散常数的母数：$D_0\le Cs^{-7}$ 出现在 `04:90`、`04:338-340`、`03:15`、`03:190`。$s^2/(Zs^3)^2$ 这个组合说明"真空排除"用的是 $Z s^3\to\infty$，并非 $Z\to\infty$ 单独，因此如果我把 regime 改成 $Z$ 固定、$s\to0$，第一步就崩。

(d) 失败路线：其一，闭合 $z\le C(1+\sqrt{z+Cs^7})$ 依赖亏损的符号；如果 $d=Z-n$ 可能大负（多绑电子），$z$ 的正部估计失效，而论文用 $d\ge -Cs^4$ 单独处理负侧，两侧不对称，$s^4$ 与 $s^{-3}$ 的间距就是"正离子侧信息多、负离子侧几乎没有"的体现。其二，若基态不存在（结合性判据失败），$D_0=E_n-E$ 仍可定义但球面平均论证要用 form 域近似态，`02:187-188` 明确取的是"normalized ground state"。其三，$|Z-n|\le Cs^{-3}$ 只给到 $O(s^{-3})$ 的上界，两侧都无系数；把系数 $q$ 拿出来是整篇 `03`+`04`+`05` 的工作量，这说明粗界与精界之间没有便宜可占。

### 8.5 Lemma 2.5 外区截断

(a) 原文（`02:234-240`）：

```tex
\begin{lemma}\label{lem:exterior-cutoff}
There is a sufficiently large fixed $R_0$ such that, for every sequence of
minimizing sectors and corresponding ground states in
\cref{eq:scaling-regime},
\begin{equation}\label{eq:exterior-cutoff}
 s^3\E_\Psi\#\{i:|x_i|>R_0s\}\longrightarrow0.
\end{equation}
\end{lemma}
```

(b) 推导。这条是"重标度后外区质量趋于零"，它让 `05:127-137` 的极限场在 $|x|>2R_0$ 上调和并给出 $\overline F_\infty(d)=q_*/d$。证明用弱本征方程对壳乘子 $S_u=\sum_i\chi(|x_i|/u)^2$ 测试：第 $i$ 项里其余坐标的能量 $\ge E_{n-1}$，动能部分用 `02:254-258` 的 $\frac12\Re\int\nabla_i\bar\Psi\cdot\nabla_i(w_i\Psi)\ge-\frac14\E\Delta_iw_i$（这是把第 8.1 节乘子恒等式退化到单坐标的版本，代价是丢一个 $\Delta w_i$），只保留 $|x_l|<u/8$ 的排斥，得 `eq:shell-eigen-equation`

$$s^{-4}m_u\le Cu^{-2}N_u+\E\sum_iw_iB_{u/8}(x_i).$$

然后偏置测度：$\Psi_u=\sqrt{S_u/m_u}\,\Psi$，`02:277-284` 用 $|\nabla\sqrt{S_u}|^2\le Cu^{-2}\#\{u/2\le|x_i|\le4u\}$ 与乘子恒等式得偏移 $\delta_u=D_0+Cu^{-2}N_u/m_u$。关键的概率操作在 `02:287-297`：在两个测度里用同一个辅助方形切割，其数据 $Y$ 决定 $S_u$ 与所有正权重位置，于是"用 $Y$-可测变量 $S_u/m_u$ 偏置不改变 $S_u>0$ 上的原始条件律"，两个条件调和场相同，$\E\sum_iw_iB_{u/8}(x_i)\le m_u\E_{\Psi_u}M(Y)$。代入 Lemma 2.3 得 `eq:shell-field-bound`：

$$\E\sum_iw_iB_{u/8}(x_i)\le Cm_u\Bigl(\frac{\max(u^{-3},1)}u+\sqrt{D_0/u}\Bigr)+Cu^{-3/2}\sqrt{m_uN_u}.$$

吸收：$u\ge R_0s$ 时 $s^4\frac{\max(u^{-3},1)}u\le R_0^{-4}+s^4$、$s^4\sqrt{D_0/u}\le C\sqrt{s/u}\le CR_0^{-1/2}$，两项都可小于 $s^{-4}$ 系数的一半（`02:317-323`），于是移项后 $m_u\le Cs^4(u^{-2}+u^{-3/2})N_u$（用 $m_u\le N_u$ 处理混合项）。最后 `02:337-345` 对壳 $u=2^jR_0s$ 求和：

$$s^3\E\#\{|x_i|>R_0s\}\le Cs^7\sum_{j\ge0}(u^{-2}+u^{-3/2})(u^{-3}+1+s^{-7/2}u^{1/2})\le C_{R_0}(s^2+s^{5/2}+s^5+s^{11/2})\to0.$$

我把六个乘积逐项展开核对：$s^7u^{-5}=s^2$、$s^7u^{-7/2}=s^{5/2}$、$s^7u^{-2}=s^5$、$s^7u^{-3/2}=s^{11/2}$、$s^{7-7/2}u^{-3/2}=s^{5/2}$、$s^{7-7/2}u^{-1}=s^{5/2}$。四个不同的幂 $2,\tfrac52,5,\tfrac{11}2$ 全部出现，与原文一致；每个都是 $2^{-j}$ 的负幂求和，收敛，且 $R_0$ 固定即可，"Every power of $u$ in this sum is negative"（`02:346`）就是在说这件事。

(c) $R_0$ 只需"足够大固定"，因为它的作用是把 $R_0^{-4}$、$R_0^{-1/2}$ 压到吸收阈值以下，而 $s^5$ 类项不受它影响；$2$、$\tfrac12$、$4$ 来自 $\chi$ 支撑在 $[1/2,4]$、等于 1 在 $[1,2]$，倍比 $2^j$ 覆盖整个外区不重叠过多。$\sqrt{D_0/u}$ 变成 $s^{-7}$ 代入后给 $C\sqrt{s/u}$，这里用了 $D_0\le Cs^{-7}$，所以 $\sqrt{D_0/u}=\sqrt Cs^{-7/2}u^{-1/2}$，乘 $s^4$ 得 $Cs^{1/2}u^{-1/2}$ ✓。$N_u$ 里的 $s^{-7/2}u^{1/2}$ 项同样来自 `eq:annular-count` 的 $\sqrt{\delta u}$ 取 $\delta=D_0$。

(d) 失败路线。第一条：如果外区质量不消失，`05:92` 的球面平均公式右端第二项 $\int_{|x|>d}(\frac1d-\frac1{|x|})\rho_s$ 无法被 $d^{-1}\times$(尾部质量) 控制，$\overline F_\infty(d)=q_*/d$ 与"$F_\infty$ 在外部调和"两条同时失去，`05:139-157` 的 Liouville 论证就没有可用的衰减边界条件。第二条：偏置态 $\Psi_u$ 的偏移 $\delta_u$ 含 $N_u/m_u$，若某壳上 $m_u$ 很小而 $N_u$ 不小，$\delta_u$ 爆炸，`02:287-303` 用"两个测度共用同一切割、条件场在正权重上一致"绕过了除法；我读到这里想过直接用 $S_u>0$ 条件期望，那会在 $m_u\to0$ 时失去一致常数，论文的处理是把 $m_u=0$ 单列（`02:315`）。第三条：这条引理只处理 $|x_i|>R_0s$，对内区没有任何截断，说明全部信息都集中在"一个尺度 $s$ 的球里"，内区电子的分布由第 9、10 节接管；如果我想在此处直接取 $R_0\to\infty$ 依赖 $s$，$C_{R_0}$ 的那两个吸收项会回来咬人。

## 9 §3 的正价格比较：两个后验律与我第二次走错的地方

第 8 节结束时我手上有亏损的量级 $O(s^{-3})$ 与偏移 $O(s^{-7})$，也确认了外区质量在重标度下消失。缺的是把"密度"与"场"在局部绑起来，也就是要证 $d^6\mu_j\approx k(d^4H'_j)^{3/2}$ 这一 TF 关系。§3 干这件事，而我在读它之前先自己试了一遍，试错了。

我的错法是：既然要看局部，就把观测数据和一次空间切割的信息同时条件化，得到一个"给定全部信息"的条件密度，然后对它做 TF 比较。`01:206-207` 提前替我标了警：

```tex
Two posterior laws occur in this argument; keeping them distinct is
necessary for the Coulomb comparison.
```

机械原因在 `03:318-330` 与 `03:638-662`。密度一侧的后验来自噪声观测塔（$\mathcal F_j$，数组 $j,\dots,J_*-1$ 的信息），能量一侧的后验来自"另做一次方形切割、只按 out 标签切片"得到的 core，其条件律记作在 tilted raw law 里。如果我把两者同时条件化，core 就包含"已知落在 patch 里的电子"以外的全部信息，patch 上的条件场不再是调和的：`03:338-343` 那句 "condition the unshifted field obtained by subtracting only electrons outside $B(y,20a)$; all those electrons belong to the core. This field is harmonic on $B(y,10a)$" 依赖"patch 内没有 core 电子"，而这只有在按 out 数据切片时才成立。调和性被用在两处不可替代的地方：$\sum_{i\,\mathrm{retained}}\Phi(x_i)=\int\Phi\sigma$（`03:482-483`，球面均值把点值换成 smeared 值）和 $\int\Phi\rho$ 替换 $\int\Phi(g_b^2*\rho)$（`03:476-477`）。同时条件化会在这两处各留下一个不可控的短程点势误差，量级恰是 $a^{-4}$，正是我要估计的目标本身。

### 9.1 观测塔与 master 包（未编号，但是全部记号的源头）

原文（`03:22-27`）：

```tex
 r_0=\eps Z^{-1/3},\qquad r_j=2^j r_0,\qquad
 J_* =\max\{j\ge0:r_j\le s\},\qquad
 \ell_j=r_j^{1.01}\quad(0\le j<J_*).
```

在尺度 $j$ 上观测无序数组 $x_i+\ell_jU_{ji}$，$U_{ji}$ 各坐标独立、密度 $\zeta(u)=c_\zeta\exp(-1/(1-u^2))\ind_{\{|u|<1\}}$，每个数组内单独忘记标签；$\mathcal F_j$ 记录数组 $j,\dots,J_*-1$，$\mathcal F_{J_*}$ 平凡。$\sigma$-域随 $j$ 递减，即 $j$ 越大信息越少，第 10 节的归纳"忘记一个观测"就是 $j\to j+1$。

master 包与条件场（`03:47-57`）：

```tex
 D_x^{\mathrm b}&=\max(d_x,r_0),&
 t_x&=c_1D_x^{\mathrm b}\min(D_x^{\mathrm b},s)^w,\\
 \mathcal K_x(y)&=g_{t_x}(y-x)^2,&
 \mu_j(y)&=\E\!\left[\sum_i\mathcal K_{x_i}(y)
                                  \,\middle|\,\mathcal F_j\right],\\
 H'_j(y)&=V(y)-\lambda-(K*\mu_j)(y).
```

我逐个问"为什么"。双 clamp 的意义：下 clamp $r_0$ 保证每个包宽度有正下界 $t_x\ge c_1r_0^{1+w}$（`03:61-66`），这是"每个固定系统上 $\mu_j$ 光滑且有确定性导数界"的唯一来源，而第 10 节的条件积分合法性完全靠它（`04:304-319`）；上 clamp $\min(\cdot,s)$ 把远离原点的包宽钉在 $s$，使整个塔只到价格尺度为止。慢幂 $^w$（$w=10^{-5}$）的作用是让 $t_x$ 全局 Lipschitz 且 $\operatorname{Lip}(t)\le c_1(1+w)s^w$，从而 $t_x/t=1+O(s^w)$、$\int\mathcal K_z(y)dz=1+O(s^w)$（`03:59-60`、`03:173-176`）：包几乎归一化，误差是 $s^w$ 这种"几乎不动"的量。$c_1<(10L)^{-1}$ 保证 $|x-y|\le2t$，配合 `03:170-171` 让"包内/包外"的判据与 $J_y$ 的排除半径相容。$H'_j$ 里显式带 $-\lambda$，即"$H'$ 是扣掉价格后的有效场"，而 Theorem 1.2 的极限方程里出现的 "$F-1$" 就是这个 $-1$（`05:84`：$s^4H'_j(sx)=F_s(x)-1$）。观测塔三条恒等式 `03:72-77`：$\E[\mu_j|\mathcal F_{j+1}]=\mu_{j+1}$、$\E[H'_j|\mathcal F_{j+1}]=H'_{j+1}$、$\Delta H'_j=-4\pi\nu+4\pi\mu_j$，第三条在分布意义下成立，且 $H'_j$ 在核外次调和（`03:79`），这是下面把点态 $L^1$ 界升级成一致上界的关键。

### 9.2 Lemma 3.1 一次观测事件的代价

(a) 逐字引用（`03:81-94`）：

```tex
\begin{lemma}[Cost of an observation event]
\label{lem:event-tilt}
Let $j<J_*$ and let $A'\in\mathcal F_j$ have probability $p>0$.
There is a normalized antisymmetric state $\Psi_{A'}$ in the same sector
whose raw law is the raw marginal conditioned on $A'$ and whose form energy
satisfies
\begin{equation}
 \langle\Psi_{A'},H_{Z,n}\Psi_{A'}\rangle
 \leq E_n+C r_j^{-2.02}\log^5(e/p).
 \label{eq:event-tilt-cost}
\end{equation}
The constant is independent of the particle number, the number of observed
arrays, and $D_0$.
\end{lemma}
```

(b) 推导。取 $\Psi_{A'}=\sqrt{p_{A'}(x)/p}\,\Psi$，$p_{A'}(x)$ 是给定原始位置下观测事件发生的概率。乘子对称、保 form 域（`03:100`），代入 Lemma 2.1 的乘子恒等式 `eq:ground-multiplier` 得

$$\langle\Psi_{A'},H\Psi_{A'}\rangle-E_n\|\Psi_{A'}\|^2=\tfrac12\E_\Psi|\nabla\sqrt{p_{A'}/p}|^2 .$$

梯度怎么来的：$\nabla_x\sqrt{p_{A'}}/\sqrt p$ 的平方除以 $p$ 给出 $\frac14|\nabla\log p_{A'}|^2$。事件 $A'$ 由第 $j$ 个数组决定，每个观测点 $x_i+\ell_jU_{ji}$ 关于 $x_i$ 的平移敏感度是 $\ell_j^{-1}$，所以单点梯度 $\lesssim\ell_j^{-1}$，取对数导数后平方给出 $\ell_j^{-2}=r_j^{-2.02}$ ✓。$\log^5(e/p)$ 我核对到两处出现同一幂次（`04:88` 与 `03:264`、`03:215` 的 $\log^{5/2}$ 是其平方根版本，用于 $L^2$ ，并非期望），它来自 `Foundation` 的 `\FEventTilt` 内部：多次数组的联合似然比取对数后按坐标求和，每层贡献一个 $\log(e/p)$，五层给出 $\log^5$。[推测]，具体层数论文没在本篇说明，只借用。

(c) 这里最重要的一件事是"两条 offset 记账"，`03:108-115`：

```tex
Accordingly, the unshifted offset of the tilted state is at most
$D_0+C r_j^{-2.02}\log^5(e/p)$, while its shifted energy is at most
\begin{equation}
 P(\lambda)+C r_j^{-2.02}\log^5(e/p).
 \label{eq:shifted-tilt-cost}
\end{equation}
This distinction is what permits the local comparison below for
$D_0$ up to order $s^{-7}$.
```

机械理由：倾斜发生在扇区 $n$ 内部，代价天然相对 $E_n$ 计量，而 $E_n+\lambda n=P(\lambda)$，$D_0$ 只在"相对全局最小 $E$"的记号里才出现。所以任何以 $P(\lambda)$ 为基准的比较（也就是 patch 的能量比较）只看见 $\delta'=Cr^{-2.02}\log^5$，看不见 $s^{-7}$；而以"unshifted $\delta$-state"为前提的估计（Lemma 2.2、2.3 里的 $m_y$）必须看见 $\delta=D_0+\delta'$。`03:269-272` 的两个不等式 $m_y\le C_Ma^{-3}$、$\delta'=o(a^{-6.98})$ 就是这两种记账各自的使用点：前者用 $D_0$ 吸收进 $m_y$ 的第二项 $\sqrt{\delta a}$ 后仍然被 $a^{-3}$ 支配，后者要求 $\delta'\ll a^{-7}$，即 $r^{-2.02}\log^5\ll r^{-7}$，$7-2.02=4.98>0$ ✓（与 `03:513` 的 $a^{4.98}\log^5(e/a)$ 同一条）。

(d) 失败路线。其一，如果 $\Psi_{A'}$ 要保持在同一扇区以外（比如允许粒子数变化），代价里会多出 $\lambda$ 级别的项，$p$ 很小时立刻压过 $r^{-2.02}$；论文的 "in the same sector" 是硬要求。其二，如果事件 $A'$ 的概率小于 $r^{42}$（`03:251` 的阈值），$\delta'$ 变成 $\gtrsim r^{-2.02}\cdot(42\log(1/r))^5$，虽然仍 $o(r^{-7})$，但后面 `03:579`、`03:688` 的 $a^{.01}$、$a^{.005}$ 余量是给这些对数留的；把阈值降到 $r^{100}$ 也能活，但余量分配要重排。其三，把 $\log^5$ 当成可忽略是危险的：`04:88` 的整条初始化对它的依赖是 $r_0^{-2.02}\log^5(e/r_0^{40})\le Z^{7/3}$，只要 $\eps$ 固定就有富余，但如果我改用 $r_0=Z^{-1/3}(\log Z)^{2}$ 之类的尺度，这一步与 `05:190` 的 net 计数会同时紧张。[推测]。

### 9.3 Proposition 3.2 双向反向比较

(a) 逐字引用（`03:119-148`）：

```tex
\begin{proposition}[Simultaneous inverse comparison]
\label{prop:inverse-comparison}
There is a universal constant $C_{\mathrm{cap}}$ with the following property.
Fix
\[
 M\geq2,\qquad 0<h_l<h_h<\infty,\qquad 0<\xi<h_l/16.
\]
For all sufficiently far systems along \cref{eq:scaling-regime}, at every
$j<J_*$ there is an event $\mathcal G_j\in\mathcal F_j$ such that, with
$r=r_j$,
\[
 \Prob(\mathcal G_j^c)\leq Cr^{25}.
\]
On $\mathcal G_j$, the following assertions hold simultaneously for
$r\leq d_y\leq4Mr$ and $h_l\leq h\leq h_h$:
\begin{equation}
 \begin{split}
 d_y^4H'_j(y)&\leq C_{\mathrm{cap}},\\
 d_y^6\mu_j(y)>kh^{3/2}
       &\quad\Longrightarrow\quad d_y^4H'_j(y)\geq h-\xi,\\
 d_y^6\mu_j(y)<kh^{3/2}
       &\quad\Longrightarrow\quad d_y^4H'_j(y)\leq h+\xi.
 \end{split}
 \label{eq:inverse-comparison}
\end{equation}
```

(b) 完整推导。$h$ 就是归一化场高 $d^4H'$，$kh^{3/2}$ 是同一处对应的归一化密度高 $d^6\mu$，两条蕴含把 TF 关系写成"从两侧夹紧"的形式，允许 $H'$ 在密度小的地方任意负（`03:150-153`）。证明的骨架五步：

第一步，计数事件 $\mathcal C_j$（`03:180-201`）。若第 $j$ 数组在 $[r/4,12Mr]$ 内条目数超过某大阈值 $C_Mr^{-3}$ 且该事件概率 $>r^{40}$，噪声支撑紧（$|U|<1$）迫使任何相容原始构型在 $[r/8,13Mr]$ 内至少那么多点；条件化后用 Lemma 3.1 得到该条件律是一个扇区 $n$ 内 offset 至多 $D_0+Cr^{-2.02}\log^5(e/r^{40})$ 的态，再用 `eq:annular-count`：期望计数 $\le C(\max(r^{-3},1)+\sqrt{\delta r})$，而 `03:190-191` 核对两个余项 $\sqrt{D_0r}\le Cr^{-3}(r/s)^{7/2}\le Cr^{-3}$（用 $r\le s$）与 $r^{-0.51}\log^{5/2}(e/r^{40})=o(r^{-3})$。矛盾给出 $\mathcal C_j$，随后 $\mu_j\le C_Mr^{-6-3w}$、$|\nabla\mu_j|\le C_Mr^{-7-4w}$：一个包值 $\le Ct^{-3}\le Cr^{-3}s^{-3w}\cdot C$……我核对：包 $\mathcal K=g_t^2\le Ct^{-3}$，$t\sim cr\cdot s^w$，条目数 $Cr^{-3}$，故 $\mu_j\le C_Mr^{-6-3w}$ ✓；梯度同理多一个 $t^{-1}$ 与宽度幂 $s^w$ 的组合，得 $r^{-7-4w}$（$-6-3w$ 再乘 $t^{-1}$ 给 $-7-4w$，多出的一个 $w$ 来自 $g^2$ 的梯度与包宽导数两项）✓。

第二步，普适场封顶（`03:203-245`）。条件在 $\{d^4H'_j(y)>b_0\}$（概率 $p$）上，patch 外的包的势用球面平均等于点势，丢掉其余非负包势并用观测塔得 $H'_j(y)$ 的事件均值上界为 tilted 的 $J_y-\lambda$ 之均值，于是 `eq:field-cap-tail`：

```tex
 b_0\leq C+C(d_y/s)^{7/2}-(d_y/s)^4
              +C_Mr^{2.49}\log^{5/2}(e/p).
```

我把三项的来源算清楚：$C$ 来自 $\max(a^{-3},1)/a$ 乘 $d^4$ 后的 $O(1)$（$a=d/L$，$d^4\cdot a^{-4}=L^4$ 是常数）；$(d/s)^{7/2}$ 来自 $\sqrt{\delta/a}\cdot d^4$ 取 $\delta=D_0\le Cs^{-7}$，得 $Cd^{7/2}s^{-7/2}$，这正是 `eq:local-field-input` 与 `eq:rough-deficit` 的复合，指数 $7/2$ 完全是 $s^{-7}$ 开平方加一个 $d$ 的产物；$-(d/s)^4$ 是罚项 $\lambda d^4=s^{-4}d^4$。因为 $4>7/2$，当 $d/s$ 大时负的罚项压过正的屏蔽项，这就是"封顶与波段无关"的原因。剩下 $r^{2.49}\log^{5/2}(e/p)$：来自倾斜代价 $\delta'^{1/2}d^4\cdot$(某几何因子)，`03:215` 写成 $r^{2.49}$ 对应 $r^{-2.02}\times r^{4.51}=r^{2.49}$（即 $L^2$ 范数里 $\delta'$ 的一半幂再乘 $d^4\sim r^4$：$\sqrt{r^{-2.02}\log^5}\cdot r^4/r^3$... 我按 $d\sim r$ 估：$\sqrt{\delta'}\cdot d^{4}/d^{... }$，指数 $-1.01+4=2.99$，原文取 $2.49$，说明还额外用了一次 $r^{-0.5}$ 型几何衰减。[推测]，论文未展开该指数的算术。

对 $p$ 解这个不等式得到拉伸指数尾，积分给 `eq:cap-excess`：$\E(d^4H'_j(y)-C')_+\le C_{P,M}r^P$ 对任意固定 $P$。第三步，次调和升级：在 $3r/4\le d_y\le6Mr$ 取半径 $d_y/10$ 的球，$H'_j(y)\le$ 球面均值，把 $C'd_z^{-4}$ 的均值乘 $d_y^4$ 后是普适常数，剩下 `03:234-235` 的 $Cr^{-3}\int(d^4H'-C')_+$，Markov 给出例外概率 $C_Mr^{40}$，得到同时封顶 `eq:enlarged-field-cap`。

第四步，patch 比较（`03:247-522`），这是最长的机器间。取失败事件（`eq:fixed-point-failures`，两个方向各一条） intersect $\mathcal C_j$、概率 $\ge r^{42}$，其后验 $Q$ 的原始边缘是 Lemma 3.1 的倾斜态。尺度阶梯 `03:276-282`：$\beta=a^{0.2}$、$b=\beta a=a^{1.2}$、$\ell_j=r^{1.01}$、$t\asymp a\,s^w$、$a\asymp_Mr$，声称 $b\ll\ell_j\ll t\ll a$。我逐比验证：$b/\ell_j=a^{1.2}r^{-1.01}\le C(a^{1.2}/a^{1.01})=Ca^{0.19}\to0$；$\ell_j/t\le Ca^{1.01}/(ca\,s^w)=Ca^{0.01}s^{-w}\to0$，因为 $a\le C s$ 给出 $a^{0.01}\le C^{0.01}s^{0.01}\ll s^{10^{-5}}$；$t/a\le Cs^w\to0$ ✓。四个尺度各自的职责写在 `03:283-285`：$b$ 细到让半经典误差小，$t$ 粗到同时吸收这次涂抹与观测位移 $\ell_j$，$t/a\to0$ 允许把场当局部常数比较。

选取 $t_0\in[5a,6a]$ 使 `eq:patch-counts` 两条同时成立：总 out 数被 $B(y,7a)$ 内的原始计数控制，`eq:annular-count` 加 `eq:patch-offsets` 给 $\E n_o^2\le C_Ma^{-6}$ 对一切 $t_0$ 一致；删除粒子落在原裸条 $t_0-7b\le|x_i-y|\le t_0+b$，把平方计数对 $t_0\in[5a,6a]$ 积分，每个有序对贡献长度 $\le8b$，平均后 $\E n_{\rm del}^2\le C_M\beta a^{-6}$，$\beta=b/a$ ✓（`03:311-316`）。

core 与 patch：$e_X^\lambda\ge P(\lambda)$（按定义），$\Phi=V-\lambda-K*\rho_X^c$；`eq:patch-field-envelope` 给 $\Phi\le F$ 于 $B(y,7a)$ 且 $\|F\|_{L^2(Q)}\le C_Ma^{-4}$，用 $B(y,20a)\subset B(z,Aa_z)$（这就是 $A=40$ 的消费点）把逐点界接回 Lemma 2.2。patch 极小 $\rho$ 在 $\Omega=B(y,t_0-4b)$ 上最小化 $\mathcal E_\Phi(f)=T\int f^{5/3}-\int\Phi f+D(f)$，Euler 关系 `eq:patch-euler`：$W=\Phi-K*\rho$，$\rho=kW_+^{3/2}$；质量界 `eq:patch-mass-bound` $\int\rho\le CaF$ 来自 $D(\rho)\ge(\int\rho)^2/(24a)$，其中 $24=2\times12$，$\Omega\subset B(y,6a)$ 直径 $12a$。

能量两侧：下侧 `eq:patch-lower-comparison` 用 Neumann 立方本征值计数（`\FNeumann`，允许任意可测选出的 retained 子集）给 $T_o\ge\E[T\int\sigma^{5/3}-Cb^{-2}(n_o^{4/3}+n_o)]$ 与 out 排斥 $\ge D(\sigma)-Cn_o/b$；上侧 `eq:patch-upper-comparison` 用相干包插入给 $P(\lambda)\le e_X^\lambda+T\int\rho^{5/3}+Cb^{-2}\int\rho-\int\Phi\rho+D(\rho)$。`03:449-478` 把插入细节摊开：对两种自旋积分轨道 $g_b(x-z)e^{ip\cdot x}$，$|p|\le(3\pi^2\rho(z))^{1/3}$，测度 $dz\,dp/(2\pi)^3$，得 $0\le\gamma\le1$、$\Tr\gamma=\int\rho$、$\rho_\gamma=g_b^2*\rho$，动能迹 $=T\int\rho^{5/3}+Cb^{-2}\int\rho$；再按谱截断成有限秩、依特征值独立占据得整电子数行列式、用 direct-minus-exchange 把平均排斥压到直接项之下，最后平均。这里我注意到 $T$ 之所以精确，并非 $\le CT$，正因动量球积分用了两自旋的 $(3\pi^2)$，`03:437-438` 专门强调 "The leading kinetic coefficient here is exactly $T$, for two spin states and kinetic energy $-\Delta/2$"。

相减后凸性留下 `eq:patch-error-budget`：

```tex
 \E_Q\left[D(\sigma-\rho)+\int W_-\sigma\right]
 \leq\delta'+C_M\left(
       \sqrt\beta\,a^{-7}+b^{-1}a^{-3}
                       +b^{-2}(a^{-4}+a^{-3})\right).
```

我逐项除以 $a^{-7}$ 核对 `03:513` 那一行：$\delta'/a^{-7}=a^{4.98}\log^5$、$\sqrt\beta a^{-7}/a^{-7}=\beta^{1/2}=a^{0.1}$、$b^{-1}a^{-3}/a^{-7}=a^{4}/a^{1.2}=a^{2.8}$、$b^{-2}a^{-4}/a^{-7}=a^{3}/a^{2.4}=a^{0.6}$、$b^{-2}a^{-3}/a^{-7}=a^{4}/a^{2.4}=a^{1.6}$ ✓ 五项齐全。于是 `eq:patch-comparison` 的右端 $C_Ma^{-7+.02}$ 成立，$0.1>0.02$ 是余量。

展开式的线性项 $\int(\frac{5T}{3}\rho^{2/3}-W)(\sigma-\rho)=\int W_-\sigma$（`03:490-495`）用 Euler 关系：$\rho>0$ 处系数为 0，$\rho=0$ 处等于 $W_-$，这一行同时告诉我 $\frac{5T}{3}$ 与 $k=(5T/3)^{-3/2}$ 是同一个导数的两种写法。

第五步，把 patch 结论搬回 $\mu_j,H'_j$。密度恢复用 `eq:noisy-array-sandwich` $|\mathcal R\sigma-\mu_j|\le C_Mr^{-3}(\ell_j+b)t^{-4}=o(a^{-6})$，误差比对 $a^{-6}$ 是 $a^{.01-4w}+a^{.2-4w}$（`03:572-575`）；再用库仑对偶（`\FCoulomb`）在好事件 $G=\{D(\sigma-\rho)\le a^{-7+.01}\}$ 上给 $|\mathcal R\rho-\mathcal R\sigma|\le Ca^{-7/2+.005}t^{-5/2}=o(a^{-6})$。场高传递：$W(y)\ge(h-\xi/16)d^{-4}$（高密度侧）与 $W(y)\le(h+\xi/16)d^{-4}$（低密度侧），中间靠 `eq:patch-field-oscillation` 的摆动界 $|W-W(y)|\le C\tau(a^{-4}+W(y)_-)$ 于 $B(y,2t)$，上界 $W\le Ca^{-4}$ 用与 `06:166-172` 同一族的爆破上解 $U=CR^4/(R^2-|x-y|^2)^4$（指数 4 又一次出现，因为它要压住 $W^{3/2}$）。负场单控 `eq:negative-patch-control`：$W(y)_-\le C(a^{-6}t^3)^{-1}\int W_-\sigma+C\tau a^{-4}$，配合 $\E_Q[\ind_{G^c}W_-]=o(a^{-4})$（比值受 $C_Ma^{.02-3w}+Cs^w$ 控制，`03:631-633`），让高密度蕴含能取期望。

最后势匹配 `eq:potential-matching` $\left|\E_Q(H'_j-W)(y)\right|=o(a^{-4})$，靠 `eq:two-posterior-potential-identity` 的四项分解：$(P^{\rm raw}-P^{\rm ms})-P^{\rm del}-(P^{\rm ret}-K*\sigma)+K*(\rho-\sigma)$。我核对了每一项的工具：短程原始势用 Hölder 加密度界得 `eq:raw-short-range-potential` $\le C_Ma^{-4}(u/a)^{1/5}$（指数 $1/5$ 是 $\rho\in L^{5/3}$ 对 $|x|^{-1}\in L^{5/2}_{\rm loc}$ 的对偶）；涂抹差不超过 $2t$ 与 $\sqrt3b$ 内的中心，代入 $u=2t$ 与 $u=\sqrt3b$ 都由 `eq:packet-scale-ratios` 趋于 0；删除项 $\E Q^{\rm del}\le C_Ma^{-4}\sqrt\beta$ 用 `eq:patch-counts`；带符号势用截断核 $\min(|z-y|^{-1},t^{-1})$，其齐次 Sobolev 范数 $O(t^{-1/2})$，库仑对偶给 $C_Mt^{-1/2}a^{-7/2+.01}=o(a^{-4})$（相对增益 $a^{.01}\tau^{-1/2}$）；$\rho$ 的截断损失 $Ca^{-6}t^2$，$\sigma$ 的截断损失 $C_Ma^{-4}((t+\sqrt3b)/a)^{1/5}$。

第六步，网格化（`03:712-756`）。空间网格步长 $r^2$、$O_M(r^{-3})$ 点，高度网格在 $[h_l/2,2h_h]$ 内步长 $\le\xi/64$；排除所有网格对上的定点失败、$\mathcal C_j$ 余集、放大封顶失败，总概率 $O_M(r^{39})+O_M(r^{40})\le Cr^{25}$。密度变化 $C_Mr^{1-4w}=o(1)$，场的变化 `eq:net-field-variation` $C_Mr^{1-3w}+C_Mr\,v(y)_-$，然后分 $v(y)\ge0$ 与 $v(y)<0$ 两种情况都把失败搬到最近的网格点上；$\xi<h_l/16$ 与 $h\ge h_l>16\xi$ 保证高度网格的移位不会跨条。

(c) 常数与指数的账。$25$ 是刻意留余量的（$39$、$40$ 实际更强），第 10 节消费时用到 $\sqrt{r^{25}}$ 与 $r^{19/2-3w}$ 的组合（`04:341-346`），只要 $>6+3w$ 就够，25 让所有 $w$ 修正都无害。$\xi<h_l/16$ 出现在 `03:124` 与 `04:186`（$\xi<\min(\lambda_2,h_l/16)$），$1/16$ 与 `03:597`、`03:609` 的 $\xi/16$ 以及 `03:743-751` 的 $\xi/4,\xi/8,3\xi/4$ 是同一套四分法，保证从网格到点态的两次松弛都落进容差。$M\ge2$ 与 band $r\le d\le4Mr$、放大 band $r/2\le d\le8Mr$ 的成对倍数（$1/2,4,8$）是给球平均与包支撑 $|x-y|\le2t$ 留的余量。$C_{\rm cap}$ 与 band、精度参数无关（`03:145-147`），这条独立性正是第 10 节能把 $C_{\rm inv}$ 一次取定超过它的理由。

(d) 失败路线三条。其一，若沿用 `Foundation` 的固定 offset 反向比较（`\FFixedOffset`），前提 $\delta=O(1)$ 在 $\delta=D_0+\delta'=O(s^{-7})$ 下不成立，而本篇正是为此重做了整节（`03:156-158` 明确拒绝）。其二，若只保留两条蕴含中的一条，`05:33-41` 的"挤逼"论证（把 $u=|y|^4H'_j$ 与 $v=(|y|^6\mu_j/k)^{2/3}$ 相互压到 $|u_+-v|\le h_l+\xi$）只能给单边近似，无法排除 $H'$ 远小于 TF 值的情形，而障碍需要的正是"密度大于反应则场必须不太低"这类双向信息（`04:262-268`、`04:279-285`）。其三，若两个后验律合一，第 9 节开头说明的调和性丧失，$\int\Phi\sigma$ 与 $\int\Phi\rho$ 两处替换各留下 $a^{-4}$ 级误差，正比目标量同阶，比较自指。

## 10 §4 的下障碍：将奇异性穿过一长串平均

`04:3-11` 的动机句我抄下来贴在案头：

```tex
The local density--field comparison in \cref{prop:inverse-comparison} does not by itself
exclude a limiting field which is too small near the nucleus.  We now
carry a positive barrier from the nuclear scale to an arbitrary
intermediate scale.
```

也就是第 9 节的比较只给"$\mu$ 与 $H'$ 相互约束"，一个恒等于 $1$ 附近的平凡极限场（密度全在内部、外层无剩余电荷）同样满足它。要把 $q>0$ 逼出来，必须有一条正的下界从核尺度传到中间尺度。

### 10.1 障碍函数与它的双不等式

(a) 原文（`04:14-28`）：

```tex
f(t)=4\pi k(t_+)^{3/2},\qquad
 b_r(y)=B d^{-4}\left(1-\frac r{8d}\right)\quad(d\ge r),
```

以及

```tex
 \Delta b_r=Bd^{-6}\left(12-\frac{20r}{8d}\right)
       \ge \frac{19}{2}Bd^{-6}.
Thus $\Delta b_r\ge f(b_r)$ whenever
$4\pi k\sqrt B\le19/2$.  If $R=2r$, then
\begin{equation}\label{eq:barrier-gap}
 b_r-b_R\ge\gamma R^{-4}\quad(R\le d\le1.1R),
 \qquad \gamma=\frac{B}{16(1.1)^5}>0.
\end{equation}
```

(b) 与 (c) 合并算。$\Delta(d^{-4})=12d^{-6}$、$\Delta(d^{-5})=20d^{-7}$（用 $\alpha(\alpha+1)$，$\alpha=-5$ 给 $(-5)(-4)=20$ ✓），所以 `04:20` 那行逐字成立，且 $d\ge r$ 时 $12-20r/(8d)\ge12-2.5=9.5=19/2$ ✓。反应项 $f(b_r)=4\pi k b_r^{3/2}\le4\pi kB^{3/2}d^{-6}$，除以 $Bd^{-6}$ 后条件是 $4\pi k\sqrt B\le19/2$ ✓（$\sqrt B$ ，并非 $B$，因 $b_r^{3/2}/(Bd^{-6})=B^{1/2}d^{-6}(1-r/8d)^{3/2}$）。间隙：$b_r-b_R=B(R-r)/(8d^5)=Br/(8d^5)$，取 $R=2r$ 且 $d\le1.1R$ 得 $\ge BR/(16(1.1R)^5)=\gamma R^{-4}$ ✓，$\gamma=B/(16\cdot1.1^5)$ 逐项对得上。这两个不等式是整节的支点：一个是"下障碍真的是 subsolution"，一个是"两个不同尺度的障碍之间有一层 $R^{-4}$ 的间隙，可以塞进移位 $\lambda_iR^{-4}$"。

### 10.2 Proposition 4.1 条件化障碍不变量

(a) 逐字引用（`04:30-57`）：

```tex
\begin{proposition}[Conditional barrier invariant]\label{prop:barrier-invariant}
There are fixed positive constants $\eps,B,C_{\mathrm{inv}}$ and $M>2$
with the following property. ... For every $0\le j\le J_*$ there exist $\mathcal F_j$-measurable
functions $u_j,p_j$ such that, with $r=r_j$,
\begin{equation}\label{eq:barrier-invariant}
 \begin{aligned}
 \Delta u_j&\ge-4\pi\nu
       +4\pi\ind_{\{d<r\}}\mu_j-4\pi p_j
       +\ind_{\{d\ge r\}}f(u_j),\\
 b_r\le u_j&\le C_{\mathrm{inv}}d^{-4}\quad(d\ge r),\\
 u_j&=b_r\quad(d>Mr).
 \end{aligned}
\end{equation}
...
\begin{equation}\label{eq:barrier-error-mass}
 \sup_{0\le j\le J_*}\E\int p_j
 \le C\bigl(r_0^{32}+s^{19/2-3w}\bigr)=o(1).
\end{equation}
```

(b) 推导分五段。

初始化（`04:74-168`）。目标是在 $r_0\le|y|\le1.1r_0$ 上把内区密度产生的势 $P_0=K*(\ind_{\{d<r_0\}}\mu_0)$ 压到 $0.1Z/r_0$ 以下。逐点 $y$ 看事件 $A_y=\{P_0(y)>0.05Z/r_0\}$：若 $\Prob(A_y)>r_0^{40}$，用 Lemma 3.1 把该条件边缘态取出来，offset $\le D_0+Cr_0^{-2.02}\log^5(e/r_0^{40})$，由 $r_0/s\to0$ 与 `eq:rough-deficit` 知它最终 $\le Z^{7/3}$，于是 `\FGlobalDensity` 适用，$\int\rho_{A_y}^{5/3}\le CZ^{7/3}$；只有 $|x|<2r_0$ 的包中心对 $P_0$ 有贡献，截断包的势不超过全包势，径向涂抹再压到 $K(y-x)$，Hölder 得 $\E[P_0(y)|A_y]\le CZ^{7/5}r_0^{1/5}=\eps^{6/5}Z/r_0$（我在第 7.2 节验证过两端恒等），取 $\eps$ 使系数 $<0.05$ 即矛盾，故 $\Prob(A_y)\le r_0^{40}$。梯度界来自最小包宽 $c_1r_0^{1+w}$：$\|\nabla P_0\|_\infty\le CZr_0^{-2-2w}$；$r_0^2$ 网格 $O(r_0^{-3})$ 点，联合失败 $O(r_0^{37})$，插值误差除以 $Z/r_0$ 是 $O(r_0^{1-2w})$，合并成原文 $Cr_0^{35}$（第 8.1 到 8.5 的记号余量）。取好事件 $G_0$，令 $\mu^{\rm in}=\ind_{G_0}\ind_{\{d<r_0\}}\mu_0$、$p_0=\ind_{G_0^c}\ind_{\{d<r_0\}}\mu_0$，则 $\E\int p_0\le n\Prob(G_0^c)\le Cr_0^{-3}\cdot Cr_0^{35}=Cr_0^{32}$ ✓，这就是 $32$ 的出处：被 $Z\sim r_0^{-3}$ 吃掉三阶。

分支 $v=V-K*\mu^{\rm in}-0.7Z/r_0+C_3(Z/r_0)^{3/2}d^2$。$C_3$ 满足 $6C_3\ge4\pi k2^{3/2}$，$\eps$ 再缩使 $4C_3\eps^{3/2}\le0.05$；因为 $Zr_0^3=\eps^3$，二次项在 $d<2r_0$ 上 $\le0.05Z/r_0$ ✓（我核对：$C_3(Z/r_0)^{3/2}d^2\le C_3(Z/r_0)^{3/2}4r_0^2=4C_3Z^{3/2}r_0^{1/2}=4C_3(Zr_0^3)^{1/2}/r_0\cdot$... $Z^{3/2}r_0^{1/2}=(Zr_0^3)^{1/2}r_0^{-1}=\eps^{3/2}/r_0$ ✓ 原文形式）。于是 $\Delta v=-4\pi\nu+4\pi\mu^{\rm in}+6C_3(Z/r_0)^{3/2}$，且在 $r_0\le d<2r_0$ 上 $v\le2Z/r_0$，故 $f(v)\le4\pi k(2Z/r_0)^{3/2}=8\pi k(Z/r_0)^{3/2}\le6C_3(Z/r_0)^{3/2}$ ✓ 这就是 $6C_3\ge4\pi k2^{3/2}$ 的算术（$2^{3/2}=2.828$，$4\pi\cdot2.828=35.54$，$6C_3\ge35.54\cdot k$）。下拼接处 $r_0\le d<1.06r_0$：$v\ge(1/1.06-0.1-0.7)Z/r_0>0.14Z/r_0$ ✓（$0.9434-0.8=0.1434$）；上拼接处 $1.9r_0<d<2r_0$：$v\le(1/1.9-0.7+0.05)Z/r_0<0$ ✓（$0.5263-0.65=-0.1237$）。这两个区间决定了 $u_0$ 的三段定义在重叠区相容，并且 $v$ 单独在 $d=r_0$ 附近活跃，供给两条源不等式。$C_{\rm inv}\ge\max(B,32\eps^3)$：$32\eps^3$ 是把 $d^{-4}$ 上限换算成 $Z/r_0$ 记号所需的 $(Zr_0^3)=\eps^3$ 因子乘 $2^4=16$ 再留一倍。

常数一次取定（`04:170-191`）：$C_{\rm inv}$ 提到超过 $C_{\rm cap}$；$0<\lambda_2<\lambda_1<\gamma/2$，$M>2$，$C_{\rm inv}M^{-4}<\lambda_2$；$0<h_l<B/4$、$h_h>C_{\rm inv}$；`eq:barrier-parameters` 三条 $2e_0(2M)^4<B/4$、$16\xi+2e_0<\lambda_1-\lambda_2$、$\xi<\min(\lambda_2,h_l/16)$。我读到这行才确认 $\lambda_1,\lambda_2$ 与电子价格 $\lambda$ 无关（`04:178-179` 特别声明），这是记号冲突的自觉预防。$\lambda_i<\gamma/2$ 让两条移位分支都落在 $b_r$ 与 $b_R$ 之间；$C_{\rm inv}M^{-4}<\lambda_2$ 保证远区封顶后两条分支都低于 $b_R$。

向外一步（`04:193-295`）。好数据上用 $v_1=u-\lambda_1R^{-4}$、$v_2=H'_j-\lambda_2R^{-4}$；$\widetilde u$ 按 `eq:barrier-open-cover` 三行开覆盖定义（$d<1.08R$ 取 $\max(v_1,v_2)$；$1.04R<d<2MR$ 取三者最大；$d>MR$ 取 $b_R$），坏数据省略 $v_2$，并把 $r\le d<R$ 上的密度加进误差：`eq:barrier-added-error` $\widetilde p=p_j+\ind_{\rm bad}\ind_{\{r\le d<R\}}\mu_j$。开覆盖的三个数 $1.08,1.04,2M$ 都小于 $4M$（比较 band 上限），且两两重叠以便相容性检查。

不等式的证法是本节我最想学的动作。先在开邻域上取"留在最大值 $e_0R^{-4}$ 之内"的分支族（`04:236-243`），连续性保证存在一个邻域使被弃分支严格低于某个留下的极大者，且留下的每条都满足 `eq:retained-branches` $\widetilde u-v<2e_0R^{-4}$；然后逐条验证共同不等式 `eq:common-branch-inequality`，最后用 `\FMaximum` 弱最大原理把分支不等式搬到 $\widetilde u$ 上，再用单位分解从局部搬到整体。为什么要绕这一圈：$\max$ 的分布 Laplacian 在分支切换面上有测度项，直接算会把界面两侧的源混在一起，界面恰好可能穿过 $d=R$（反应项开关处），那里 $\ind_{\{d\ge R\}}f(v)$ 与 $\ind_{\{d<R\}}4\pi\mu_j$ 的分配会被界面测度污染。`01:213-215` 那句 "so no derivative is restricted to an activity interface" 就是这个意思。

两条分支各自的反证。$v_1$ 侧（`04:258-268`）：好数据下 $v_2$ 是候选，故 $H'_j\le u-(\lambda_1-\lambda_2-2e_0)R^{-4}$；若 $4\pi\mu_j>f(u)$，由 `eq:inverse-comparison` 的高密度蕴含在高度 $h=d^4u$（此时 $h_l<7B/8\le d^4u\le C_{\rm inv}<h_h$）给 $H'_j\ge u-\xi d^{-4}\ge u-16\xi R^{-4}$（这里 $d\le4Mr$... 我用原文逻辑：$d$ 在 band 内，$d^{-4}\le(1.1R)^{-4}$ 一类，$16\xi$ 是粗记数），与 $16\xi+2e_0<\lambda_1-\lambda_2$ 矛盾，故 $4\pi\mu_j\le f(u)$。$v_2$ 侧（`04:270-285`）：若 $4\pi\mu_j<f(v_2)$，低密度蕴含给 $H'_j\le v_2+\xi d^{-4}<v_2+\lambda_2R^{-4}=H'_j$，字面上的自相矛盾。两个方向用的是 `eq:inverse-comparison` 里两条相反的蕴含，这正是 `04:206-207` 那句 "The opposite inverse implications ... together with the unequal shifts" 的内容：移位不相等（$\lambda_1>\lambda_2$）是反证不等式能闭合的原因。

忘记一个观测（`04:297-329`）。$u_{j+1}=V+\E[\widetilde u-V|\mathcal F_{j+1}]$、$p_{j+1}=\E[\widetilde p|\mathcal F_{j+1}]$。条件积分的合法性靠最小包宽 $c_1r_0^{1+w}$ 给出的确定性局部 Lipschitz 界（对固定系统），减常数、取有限最大、在固定开覆盖上粘贴都保持这种界；$b_R$ 那一段离原点有距离，其相对 $V$ 的偏移光滑。$f$ 凸（$t\mapsto t^{3/2}$ 在 $t\ge0$ 上凸），Jensen 给 $\E[f(\widetilde u)|\mathcal F_{j+1}]\ge f(V+\E[\widetilde u-V|\mathcal F_{j+1}])$，方向正确，这正是反应项能穿过平均的原因；同时 $\mu_{j+1}=\E[\mu_j|\mathcal F_{j+1}]$ 由观测塔给出，成为新的内区密度。

总误差（`04:331-351`）。$\|\mu_j(y)\|_{L^2(\Prob)}\le Cr^{-3-3w}(r^{-3}+\sqrt{D_0r})\le Cr^{-6-3w}$（第 9.1 节里 $\mathcal C_j$ 的同一算法）；坏 band 事件概率 $\le Cr^{25}$；Cauchy-Schwarz 加 band 体积 $r^3$ 给 $\E\int\ind_{\rm bad}\ind_{\{r\le d<R\}}\mu_j\le Cr^{25/2+3-6-3w}=Cr^{19/2-3w}$；对几何尺度列求和被首项控制得 $Cs^{19/2-3w}$。所以 `eq:barrier-error-mass` 的两项分别是初始化（$r_0^{32}$）与传播（$s^{19/2-3w}$），都 $\to0$。$19/2=9.5>3w+3$ 保证 $p_j$ 的期望质量真的消失。

(c) 每个数为何是这个值，我用一句话总结：$f$ 的指数 $3/2$ 同时提供了 subsolution 条件里的 $\sqrt B$ 与 Jensen 的凸性；$b_r$ 的 $d^{-4}$ 提供间隙 $\gamma R^{-4}$ 与远区封顶 $C_{\rm inv}d^{-4}$，两者同次才能相减；$M$ 出现在 $(2M)^4$ 里是因为上拼接要跨过 $d\le2MR$ 的最远点，四次幂来自高度归一化 $d^4u$。

(d) 三条候选失败路线。其一，把障碍做成调和函数（不带 $f$ 反应项）：调和中函数不能有不为零的下间隙，`eq:barrier-gap` 型的 $R^{-4}$ 分离在纯调和族里只能靠 Harnack 常数，$\lambda_1-\lambda_2$ 的可用余量会退化到 $M$ 的幂次，`04:176` 的 $C_{\rm inv}M^{-4}<\lambda_2$ 无法同时满足。[推测]。其二，去掉误差密度 $p_j$、试图在每条轨迹上逐点成立：Prop 3.2 只给 $1-Cr^{25}$ 概率，逐点版本要求把 $r^{25}$ 的余集从不等式里彻底删掉，而删掉之后 $\mu_j$ 在该余集上的质量无处安放，`04:37-45` 的第一行不等式在该处直接假（密度项在，反应项不在）。其三，把"忘记观测"放在最后一次性做（先归纳完 $J_*$ 步再取 $\E[\cdot|\mathcal F_{J_*}]$）：归纳的每一步都要求 $u_j$ 是 $\mathcal F_j$-可测的，才能在其上使用 Prop 3.2（事件 $\mathcal G_j\in\mathcal F_j$）；一次性忘记会让 $u_j$ 依赖被忘记的数组，比较命题立即不适用。论文里 `04:297-329` 与 `05:6-8`（"The barrier is available at every intermediate observation scale, before all observations are forgotten"）共同指向这一条。

## 11 §5：极限场、它的球面均值与唯一的奇点轮廓

§5 里没有新的编号机器（只补了一个 Lemma 5.1），它干的事情是把 §3、§4 造出的有限系统量压成一个极限对象，再证明这个对象只可能有一个。我先按顺序过它的四个无编号机件，再拆 Lemma 5.1。

### 11.1 机件一：选择条件数据（`05:10-72`）

开场（`05:12-23`）：

> "Take an arbitrary sequence in \cref{eq:scaling-regime}, with an arbitrary minimizing index $n$ in each system.  By \cref{eq:rough-deficit}, after passing to a subsequence we may suppose \[ q_s:=s^3(Z-n)\longrightarrow q_*. \] Choose integers $l\to\infty$ sufficiently slowly and a scale $j<J_*$ such that \[ \frac1{2l}\le a_*:=\frac{r_j}{s}\le\frac1l. \] This is possible because $r_0/s\to0$ and the radii are dyadic."

我验了 $a_*$ 的可行性：$r_j$ 倍步进，故 $r_j/s$ 相邻比 2，目标区间 $[1/(2l),1/l]$ 宽度比恰为 2，必落入一个；$j<J_*$ 由 $r_0/s\to0$ 保住下标余量。`05:44-45` 那句 "The spatial range is covered because $4Mr_j\ge2ls$" 代入 $M=l^2$ 与 $a_*\ge1/(2l)$：$4l^2r_j=4l^2sa_*\ge2ls$ ✓，只此一步。

局部 TF 逼近（`eq:local-tf-approximation`，`05:28-32`）：$|\mu_j(y)-k(H'_j(y)_+)^{3/2}|\le l^{-8}|y|^{-6}$，范围 $r_j\le|y|\le ls$。它的证明是双向挤压（`05:33-41`）：令 $u=|y|^4H'_j(y)$，$v=(|y|^6\mu_j(y)/k)^{2/3}$，则 $u=v$ 恰好就是密度律 $\mu_j=k(H'_j)_+^{3/2}$ 的代数改写。上端点用 $u$ 的帽排除 $v$ 达到或越过它；$v$ 高于下端点时用两个方向的蕴含把 $u$ 夹到 $v$ 的容差内；$v$ 不高于下端点时只给 $u$ 上界。结论 $|u_+-v|\le h_l+\xi$，两者都在 $[0,h_h+1]$，"this uses no lower bound on $u$"。我最初想在这一段证出 $u$ 的双向控制，卡在缺下界这条上；正号 $(\cdot)_+$ 正好吸收这条不对称，所以原文只需要单侧信息。

选中数据（`eq:selected-data`，`05:55-60`）：$\int p_j\le1$（由 `eq:barrier-error-mass` 的期望界一次 Markov），$s^3\int_{|y|>2R_0s}\mu_j\le\eta_s\to0$（母弹头在 $|x|\le R_0s$ 时整体落进 $|y|\le2R_0s$，再用条件塔与 `eq:exterior-cutoff`，然后 Markov 取确定性阈值）。之后 `05:69-70` "Choose a point in their intersection where all the conditional identities and barrier inequalities hold." 这一步是纯确定性选取，只需三事件交为正概率。末句 `05:71-72`："every selected density still has total mass exactly $n$"，提醒后面每条积分恒等式都吃 $\int\mu_j=n$ 的恰等质量；"至多 $M$" 的松弛到 §6 才出现。

### 11.2 机件二：归一化、球面均值与紧性（`05:74-125`）

$F_s(x)=s^4(V-K*\mu_j)(sx)$，$\rho_s(x)=s^6\mu_j(sx)$，于是 $\Delta F_s=-4\pi Zs^3\delta_0+4\pi\rho_s$，$s^4H'_j(sx)=F_s(x)-1$（`05:76-85`）。原文紧接着承认麻烦："The total rescaled electron mass need not be bounded."（`05:86`）因为 $\int\rho_s=s^3n$，而 $n\asymp Z\gg s^{-3}$，所以质量发散，任何靠总质量控制的势估计都不可用。它改用 Newton 球面均值恒等式（`eq:spherical-mean`，`05:89-93`）：

> " \overline F_s(d)=\frac{q_s}{d}+\int_{|x|>d}\left(\frac1d-\frac1{|x|}\right)\rho_s(x)\,dx. "

括号项非负，故 $\overline F_s(d)\ge q_s/d$，这一步只用到 $\int\mu_j=n$ 与 Newton 定理，不需要质量的界。局部 $L^1$ 界用了一个我一开始没想到的恒等式（`05:100-101`）：$|F_s|=2(F_s)_+-F_s$，先对球面积分再对半径积分。紧性是补势法（`05:105-113`）：避开原点取球，把 $\rho_s$ 限制在稍大球上的 Coulomb 势加给 $F_s$，和为调和；补势及其梯度用 $|x-y|^{-1},|x-y|^{-2}$ 对 bounded 密度的积分一致控制；内调和估计给一致界与等度连续；对角 Arzelà–Ascoli 给出局部一致收敛子列 $F_\infty$。极限 PDE（`eq:limit-pde`）$\Delta F_\infty=4\pi k((F_\infty-1)_+)^{3/2}$，加上帽 $F_\infty\le1+C_{\rm cap}|x|^{-4}$；经典性由"有界局部源给局部 Hölder，反应再 Hölder，内 Poisson 正则"三段闭合（`05:122-125`）。

### 11.3 机件三：无穷远处的衰减（`05:127-157`）

选中的尾部界说 $\int_{|x|>2R_0}\rho_s\to0$，于是 $F_\infty$ 在 $|x|>2R_0$ 调和，且 `eq:limit-exterior-mean`：$\overline F_\infty(d)=q_*/d$（$d>2R_0$）。衰减（`eq:limit-decay`）用膨胀加 Liouville：大环面归一后，正部被帽控制、负部被球面均值的积分控制，得 $F_\infty$ 在外区绝对一致界；对任意 $R_i\to\infty$，$F_\infty(R_ix)$ 的子列极限在有孔空间上是有界调和，零点奇性可去，Liouville 给常数，球面均值为零故常数为零；若衰减失败，就在触怒半径列上膨胀取单位方向子列，矛盾。原文特意加了 "Here no positivity has yet been assumed."（`05:142`），因为正的障碍要到下一机件才出现。

### 11.4 机件四：把正障碍搬过来（`05:159-233`）

目标 `eq:limit-positive-barrier`：$F_\infty(x)\ge B|x|^{-4}$。原文先强调一句 `05:165-166`："The field in this assertion is the field without the subtracted price.  This distinction permits the reaction comparison below." 这一句解释了为什么 §3 要保留"未移位/移位"两套偏移记账：反应 $f$ 单调只在同一个 $-1$ 移位下才可比。取 $U_s(x)=s^4u_j(sx)$；$a_*$ 以内，$U_s$ 的分布不等式与 $F_s$ 的方程有同样的点核与同样的 $\rho_s$ 项；$a_*$ 以外由局部 TF 逼近（$l>S$）给 $\rho_s\le k((F_s-1)_+)^{3/2}+l^{-8}|\cdot|^{-6}$。两项误差打包进非负修正势 `eq:barrier-correction`：$L_s=K*(s^6p_j(s\cdot)+l^{-8}|\cdot|^{-6}\ind_{\{a_*\le|\cdot|\le S\}})$，减掉 $F_s$ 的方程并用 $\Delta K=-4\pi\delta_0$ 得 `eq:barrier-transfer-inequality`：$\Delta(U_s-F_s-L_s)\ge\ind_{\{|x|\ge a_*\}}[f(U_s)-f(F_s-1)]$。取 $c>(C_{\rm inv}S^{-4}-\min_{|x|=S}F_\infty)_+$，边界上 $U_s-F_s-L_s\le c$，整球上也成立：用 $(U_s-F_s-L_s-c)_+$ 检验，正集上 $U_s>F_s+L_s+c>F_s-1$，反应差非负，于是 $\int_{B(0,S)}|\nabla(\cdot)_+|^2\le0$。检验合法性的理由在 `05:209-215`：$U_s-F_s$ 的核奇性相消，剩下移位连续且局部 $H^1$，$L_s$ 对固定系统是 bounded 紧支撑密度的势，且在 $|x|<a_*$ 反应项为零故右端局部有界。最后逐点 $L_s(x)\to0$：第一个密度质量 $\le s^3$（`eq:selected-data`）支撑在 $|x|\le a_*$；第二个质量 $\le Cl^{-8}a_*^{-3}\le Cl^{-5}$，在固定非零点处密度 $O_x(l^{-8})$，把势积分拆成小球与其补。取极限、$c$ 降到容许端点、$S\to\infty$ 并用衰减，得 `eq:limit-positive-barrier`。

### 11.5 Lemma 5.1（唯一衰减奇点轮廓）四段拆法

(a) 逐字（`05:243-258`）：

> "\begin{lemma}[Unique decaying singular profile]...There is at most one classical solution $F$ of \[ \Delta F=4\pi k\bigl((F-1)_+\bigr)^{3/2}\quad\text{on }\R^3\setminus\{0\} \] which tends uniformly to zero at infinity and satisfies $c|x|^{-4}\le F(x)\le C|x|^{-4}$ near zero for some $c,C>0$. Every such solution has the uniform singular asymptotic \[ |x|^4F(x)\longrightarrow A_{\mathrm S}:=\left(\frac{12}{4\pi k}\right)^2\qquad(|x|\downarrow0). \] If a solution exists, it is radial."

(b) 全推导。设 $a,b$ 为 $|x|^4F(x)$ 在零点的下、上限，假设给 $0<a\le b<\infty$。取点列趋于上极限，半径记 $t$，令 $u_t(x)=t^4F(tx)$，则 $\Delta u_t=4\pi k((u_t-t^4)_+)^{3/2}$。膨胀规则：$\Delta(F(t\cdot))(x)=t^2\Delta F(tx)=t^2\cdot4\pi k((F(tx)-1)_+)^{3/2}$，而 $u_t=t^4F(tx)$，故 $(F(tx)-1)_+=(t^{-4}u_t-1)_+=t^{-4}(u_t-t^4)_+$，右端成 $4\pi k t^{-6}((u_t-t^4)_+)^{3/2}$，左端乘 $t^{6}$ 后正好平衡，得上面的方程。$u_t$ 在紧环面上被 $|x|^{-4}$ 的正倍上下控制，用 11.2 的补势加调和紧性取经典极限 $u$：价格 $t^4\to0$ 使 $(u_t-t^4)_+\to u$（在 $u>0$ 处），故 $\Delta u=4\pi ku^{3/2}$。由 $b$ 的定义 $u\le b|x|^{-4}$ 处处成立；再取单位方向子列使等号在某个单位点成立。该差在此点取局部极大，故 $\Delta u\le\Delta(b|\cdot|^{-4})$ 在该点，即 $4\pi k u^{3/2}\le b\cdot(-4)(-3)|x|^{-6}=12bx^{-6}$，在该点 $u=b$，得 $4\pi kb^{3/2}\le12b$。下极限同理，$a$ 的膨胀从上方触 $a|x|^{-4}$，不等号翻转得 $4\pi ka^{3/2}\ge12a$。两常数正，故 $b\le(12/(4\pi k))^2\le a$，配合 $a\le b$ 得 $a=b=A_{\rm S}$。唯一性：$\alpha>1,\delta>0$，$G=\alpha F_1+\delta$ 是上比较函数，$\Delta G=\alpha4\pi k((F_1-1)_+)^{3/2}\le4\pi k((G-1)_+)^{3/2}$，理由分两支：$F_1\le1$ 时两边皆零；否则 $G-1\ge\alpha(F_1-1)$ 且 $\alpha^{3/2}\ge\alpha$。同一奇异系数使 $G$ 在所有足够小球面上支配 $F_2$；一致衰减加 $\delta>0$ 支配大球面；中间环面用 $(F_2-G)_+$ 检验加反应单调得 $F_2\le G$。令 $\delta\downarrow0,\alpha\downarrow1$ 并互换，得相等。旋转保持方程与两侧边界条件，唯一性给径向性。

(c) 机械原因。为什么是 $|x|^{-4}$：设 $F\sim r^{-\alpha}$，则 $\Delta F\sim r^{-\alpha-2}$，右端 $\sim F^{3/2}\sim r^{-3\alpha}$，$\alpha+2=3\alpha$ 给 $\alpha=4$，与 §3 的价格自相似指数是同一个方程。为什么出现 12：三维径向 Laplacian 对 $r^{-4}$ 给 $(-4)(-3)r^{-6}=12r^{-6}$，纯粹是 $\alpha(\alpha+1)$ 在 $\alpha=-4$ 的值，与 $k$ 无关。为什么 $A_{\rm S}$ 是平方：$4\pi kA^{3/2}=12A$ 消一个 $A$ 得 $A^{1/2}=12/(4\pi k)$。我算的闭式（tex 未写）：$A_{\rm S}=(12/(4\pi k))^2=9/(\pi^2k^2)$，代 $k=(5T/3)^{-3/2}$ 得 $A_{\rm S}=(125/3)T^3/\pi^2$，再用 $T^3=(27/1000)(3\pi^2)^2=243\pi^4/1000$，得 $A_{\rm S}=(81/8)\pi^2\approx99.9$。$T,k$ 的值取自 `01:58` 与 `02:15`，小数是我自己算的，原文只写 $(12/(4\pi k))^2$，这条要标 [推测] 吗？不标，因为闭式推导完全由 tex 的 $T,k$ 定义决定；但 tex 未给数值，我保留"数值来自我的算术"这一句。反力单调与正部：$\alpha>1$ 那一步用 $\alpha^{3/2}\ge\alpha$，如果写成 $\alpha^{3/2}\ge1$ 就不够，因为左端还有个 $\alpha$ 因子。为什么假设里要下界 $c|x|^{-4}$：接触论证在 $a=0$ 时失效，$4\pi ka^{3/2}\ge12a$ 对 $a=0$ 是 $0\ge0$，取不到信息；下界由 11.4 的障碍提供。为什么假设里要一致衰减：它保证大球面上的支配和球面均值常数唯一，若只给逐点衰减则 $\overline F_\infty$ 的极限论证有洞 [推测]。

(d) 备选路线与卡点。路线一：直接做 ODE 相平面分析（ Sommerfeld 的经典 $|x|^{-4}$ 展开是自治 ODE 的不动点）。卡点：引理不许设径向性，径向性是结论，相平面只能处理径向解；原文用膨胀加比较，绕开了这一点（`05:284-285` "The contact argument does not assume radiality."）。路线二：用极大值原理直接比 $F$ 与 $A_{\rm S}|x|^{-4}$。卡点：$A_{\rm S}|x|^{-4}$ 不是解（它的 $-\Delta$ 是 $12|x|^{-6}$ 而右端是 $4\pi kA_{\rm S}^{3/2}|x|^{-6}$，只在 $A_{\rm S}$ 处两侧同号，等号才成立），所以只能得到不等式方向的单侧比较，取不到系数。路线三：把唯一性交给 $\alpha,\delta$ 之外再加一个下扰动 $F_1-\delta$。卡点：$F_1-\delta$ 是下解需要反力单调朝另一方向，$(\cdot)_+$ 在跨 $1$ 时破坏它，原文只证上比较然后互换两解，正好避开。

### 11.6 电荷断言：$q$ 在这里才被定义（`05:306-332`）

这一段是"proof of Theorem 1.2"，并非编号引理。$F_\infty$ 满足 Lemma 5.1 假设（由 `eq:limit-pde,eq:limit-decay,eq:limit-positive-barrier`），故解存在、唯一、径向；外均值唯一确定 $q_*$（`eq:limit-exterior-mean`）；任取 $d>2R_0$，$q_*/d=\overline F_\infty(d)\ge Bd^{-4}>0$，"Denote this uniquely determined positive number by $q$."（`05:316`）反应密度在 $2R_0$ 外消失，径向加外均值给 $F_\infty(x)=q/|x|$。最后一步是所有子列的论证：任一系统序列与任一最小化指标都使缩放亏损有界（`eq:rough-deficit`），每个收敛子列构造出同一唯一轮廓故同一 $q$，于是整列 $s^3(Z-n)\to q>0$。$q$ 全文只被定义为这个数，没有任何数值。

## 12 §6：把定价积分回固定扇区，再认出 TF 系数

### 12.1 Proposition 6.1 四段

(a) 逐字（`06:15-22`）："Let $q$ be the deficit coefficient in \cref{thm:priced-deficit}. For every sequence of integers $Z>m\ge1$ such that $m\to\infty$ and $Z/m\to\infty$, \[ \frac{E_Z(Z-m)-E_Z(Z)}{m^{7/3}}\longrightarrow\frac37q^{-4/3}. \]"

(b) 全推导。固定 $t>0$，任取使 $E_n+tm^{4/3}n$ 最小的 $n_t$，记 $d_{Z,m}(t)=(Z-n_t)/m$，$G_{Z,m}(t)=m^{-7/3}[P(tm^{4/3})-tm^{4/3}Z-E_Z(Z)]$。取 $s=t^{-1/4}m^{-1/3}$，则 $Zs^3=t^{-3/4}Z/m\to\infty$，落在 `eq:scaling-regime` 内，Thm 1.2 的亏损断言给 $d_{Z,m}(t)\to qt^{3/4}$（`eq:priced-scaled-deficit`），且对最小化指标的任意选择成立。割线双侧（`eq:quantum-secants`，`06:42-46`）：$-d(t)\le(G(t)-G(v))/(t-v)\le-d(v)$，上界来自在价格 $t$ 处用 $n_v$ 做竞争，下界来自在价格 $v$ 处用 $n_t$ 做竞争；不需要可微，也不需要在某价格处最小扇区唯一。固定分割 $v=t_0<\cdots<t_r=t$ 求和，两端 Riemann 和夹住增量，先在有限个分割点用 $d\to qt^{3/4}$ 再细分，$qt^{3/4}$ 连续，得 `eq:quantum-price-increments`：$G(t)-G(v)\to-\frac47q(t^{7/4}-v^{7/4})$。积分常数由零价格端钉住（`eq:quantum-zero-endpoint`）：$-Cm^{-7/3}-v\,d(v)\le G(v)\le0$，上界是中性格 $n=Z$ 做竞争给 $G\le0$，下界用 `eq:neutral-offset` 的 $E_{n_v}\ge E\ge E_Z(Z)-C$。故 $\limsup|G(v)|\le qv^{7/4}$（此处用了 $d(v)\to qv^{3/4}$，乘 $v$ 得 $qv^{7/4}$），令 $v\downarrow0$ 得 $G(t)\to-\frac47qt^{7/4}$，再用 tex 自己写出的恒等式（`06:72-74`）$\frac{E_{n_t}-E_Z(Z)}{m^{7/3}}=G_{Z,m}(t)+t\,d_{Z,m}(t)$ 得 $\frac{E_{n_t}-E_Z(Z)}{m^{7/3}}\to\frac37qt^{7/4}$。这条恒等式我单独验了一遍：$P(\lambda)=E_{n_t}+\lambda n_t$、$\lambda=tm^{4/3}$，故 $G=m^{-7/3}[E_{n_t}-E_Z(Z)-\lambda(Z-n_t)]=m^{-7/3}[E_{n_t}-E_Z(Z)]-t\,d_{Z,m}(t)$，移项即得。夹逼：取固定 $0<t_-<q^{-4/3}<t_+$，则 $d(t_-)<m<d(t_+)$ 最终成立，即 $n_{t_-}>Z-m>n_{t_+}$；扇区单调给 $E_{n_{t_-}}-E_Z(Z)\le E_Z(Z-m)-E_Z(Z)\le E_{n_{t_+}}-E_Z(Z)$；套上式并令两价格趋于 $q^{-4/3}$，$\frac37q(q^{-4/3})^{7/4}=\frac37q\cdot q^{-7/3}=\frac37q^{-4/3}$。原文补一句 "Thus no assertion about the convergence of the priced minimizers as $t\downarrow0$ was needed."（`06:76-77`）。

(c) 机械原因。$\frac47$ 与 $\frac37$ 的关系就是 Legendre 变换在幂次上的算术：亏损 $\sim qt^{3/4}$ 积分给 $q\cdot t^{7/4}/(7/4)=\frac47qt^{7/4}$，而能量加价格乘扇区差 $t\cdot qt^{3/4}=qt^{7/4}$，两式相减 $(1-\frac47)=\frac37$。$s=t^{-1/4}m^{-1/3}$ 的来历是 $\lambda=s^{-4}=tm^{4/3}$ 与 $m=s^{-3}$ 两式联立：$s^{-4}=tm^{4/3}\Rightarrow s=t^{-1/4}m^{-1/3}$，$s^{-3}=t^{3/4}m$ 意味着被移除的电荷是 $s^{-3}$ 量级，即 $m=t^{-3/4}s^{-3}$，与 $d\to qt^{3/4}$ 一致。$q^{-4/3}$ 出现在夹逼中心是因为 $d(t)=qt^{3/4}=m$ 解出 $t=(m/q)^{4/3}$，归一化后中心即 $q^{-4/3}$，同时 $dI_m/dm$ 应等于该价格，与 $a_{\TF}=\frac37q^{-4/3}$ 求导验证一致：$\frac{d}{dm}(\frac37q^{-4/3}m^{7/3})=q^{-4/3}m^{4/3}$。只用单调不用凸性（`06:7-10` 的开场说明）是这节的结构性选择：扇区能量 $E_n$ 无凸性知识，割线双侧只用端点最小性，与凸无关。

(d) 备选路线。路线一：证 $P$ 可微或用次微分单调性直接反演 $n(t)$。卡点：无法排除平台（同一价格多个最小扇区），原文 `06:49-50` 明说不等式不需要可微。路线二：先固定 $m$ 再让 $Z\to\infty$。卡点：Thm 1.1 的内极限在固定 $m$ 处本无收敛性保证，本节也刻意不假设（`06:368-370`）。路线三：把夹逼换成中值选择 $t=q^{-4/3}$ 精确命中。卡点：$n_t$ 是整数，$Z-m$ 落在两个扇区之间，只有不等式没有等号，必须两侧价格。

### 12.2 我在 3/7 与 4/7 之间的第二次读错

我在 §6 的正文里承诺记下这次：我第一次推 `eq:quantum-price-energy` 时把 $G(t)\to-\frac47qt^{7/4}$ 直接当成了能量差，于是写下 $\frac{E_{n_t}-E_Z(Z)}{m^{7/3}}\to\frac47qt^{7/4}$，接着在夹逼中心得到 $\frac47q^{-4/3}$，与 Prop 6.2 的 $\frac37q^{-4/3}$ 冲突，我以为两节用了不同约定。机械原因：我漏了 Legendre 那一步 $+t\,d$。$P(\lambda)=E_{n}+\lambda n$，而 $G$ 里减掉了 $\lambda Z$，故 $G=P-\lambda Z-E=E_n-E-\lambda(Z-n)$，能量差是 $G+\lambda(Z-n)$ ，并非 $G$，符号差一项、系数差 $\frac47\to\frac37$。核对方式很简单：把 `06:72-74` 的中间等式 $\frac{E_{n_t}-E_Z(Z)}{m^{7/3}}=G_{Z,m}(t)+t\,d_{Z,m}(t)$ 抄下来逐项代，$-\frac47qt^{7/4}+qt^{7/4}=\frac37qt^{7/4}$。这也解释了为什么两节里都写 $\frac47$ 在 $G$、$\frac37$ 在能量：约定统一，是我读错。

### 12.3 Proposition 6.2 四段

(a) 逐字（`06:118-130`）："With the two-spin coefficient $T$ fixed above, \[ \lim_{Z\to\infty}\bigl[E_Z^{\TF}(Z-1)-E_Z^{\TF}(Z)\bigr]=\frac37q^{-4/3}. \] The limit holds through real charges $Z>1$. Consequently \cref{eq:tf-constant} holds for every fixed real $m>0$, with \[ a_{\TF}=\frac37q^{-4/3}>0. \]"

(b) 全推导，按原文六个 paragraph。

单调性（`06:136-149`）：$E_Z^{\TF}(M)$ 关于 $M$ 不增，不用达成假设。做法是把质量 $M_1$ 的容许密度截断到大球 $B(0,R)$ 内（丢掉球外那部分），动能、核项、直项都随 $R\to\infty$ 收敛回原值；若 $M_2\ge M_1$，把缺少质量 $a$ 放在直径 $\sim R$、中心距 $R^2$ 的光滑非负弹头里。该弹头动能 $O(a^{5/3}R^{-2})$：尺度 $R$ 的函数梯度 $\sim R^{-1}$，$\int|\nabla\sqrt\sigma|^2\sim a R^{-2}$ 再乘 $\sigma^{2/3}$ 齐次给 $a^{5/3}R^{-2}$；直项 $O(a^2R^{-1})$：两点距 $\sim R$。核项与对固定截断密度的互作用随 $R\to\infty$ 趋零（距离 $R^2$、$V\sim|y|^{-1}\sim R^{-2}$，质量 $a$ 有界）。顺序是 $R\to\infty$、再截断半径 $\to\infty$、再把原能量降到其下确界。同论证给"恰等质量"与"至多质量"同一确界。

零价格最小子是中性（`06:151-187`）：对单点正源 $Z\delta_0$ 用 Foundation 的 `\FTFPair`，$L^{5/3}\cap(\dot H^1)^*$ 上无约束问题有唯一最小 $\rho_0$，质量 $\le2Z$，场 $\phi_0=V-K*\rho_0$ 满足 `eq:tf-neutral-field`：$\rho_0=k(\phi_0)_+^{3/2}$，$\Delta\phi_0=-4\pi Z\delta_0+4\pi\rho_0$，$c\min(Z/|x|,|x|^{-4})\le\phi_0(x)\le C|x|^{-4}$。上界与 $Z$ 无关这一步是原文自补的：在 $B(x,R)$、$R=|x|/2$ 上比 $v(y)=CR^4/(R^2-|y-x|^2)^4$；我验了这个 super-solution：令 $\sigma=R^2-|y-x|^2$，$\Delta\sigma=-6$，$\nabla\sigma=-2(y-x)$，$\Delta(CR^4\sigma^{-4})=CR^4(20\sigma^{-6}|\nabla\sigma|^2-4\sigma^{-5}\cdot6)\le20CR^4\cdot4R^2\sigma^{-6}$（在球内 $|\nabla\sigma|\le2R$），而 $v^{3/2}=C^{3/2}R^6\sigma^{-6}$，故 $\Delta v\le80R^{-2}C^{-1/2}v^{3/2}\le4\pi kv^{3/2}$ 只要 $C$ 足够大 universal ✓（原文只说 "direct differentiation gives"，未给指数 20 与 80，我的算术要标为自补）。唯一性给 $\rho_0,\phi_0$ 径向；Newton 球面均值加有限质量给 $Z-\int\rho_0=\lim_{d\to\infty}d\phi_0(d)=0$（末号由 $|x|^{-4}$ 衰减），故 $\int\rho_0=Z$，`eq:tf-neutral-minimum`：$E_Z^{\TF}(Z)=\min_{\rho\in\mathcal X}\mathcal T_Z(\rho)$，两个变分类别在此无差。

单位价格最小（`06:189-204`）：最小化 $\mathcal T_Z(\rho)+\int\rho$。从 $V\le1$ 区域抽掉密度不减泛函：动能非负、那里 $\int(1-V)\rho\ge0$、被抽掉的直项非负，故可限制在 $B(0,Z)$（$V(x)=Z/|x|>1$ 只在 $|x|<Z$）。$V\in L^{5/2}(B(0,Z))$ 给强制性，$L^{5/3}$ 弱下半连续给存在，动能严格凸给唯一。非负变分加正密度上的双侧乘性变分给 `eq:tf-priced-euler`：$\rho_Z=k((\phi_Z-1)_+)^{3/2}$。全局成立：$B(0,Z)$ 外 $\phi_Z\le V\le1$。

价格比较（`06:206-225`）：`eq:tf-price-comparison` $\phi_0\le\phi_Z\le\phi_0+1$。第一式在 $\phi_0-\phi_Z-\eta$ 的正集上检验，两个反应项之差非负（因 $(\phi_0)_+\ge(\phi_Z-1)_+$ 在该正集上），平方梯度界非正故检验为零；势在无穷远趋零使检验可紧支。第二式因 $\phi_0+1$ 在共同点源之外解同一单位价格方程。原点处奇异相消，剩余势连续局部 $H^1$、源密度局部 $L^{5/3}$，$H^1$ 逼近使紧检验合法。$\eta\downarrow0$。

外区与 $Q_Z$（`06:227-247`）：$Q_Z=Z-\int\rho_Z$。由比较 $\phi_Z\ge0$，$\rho_Z\le k\phi_0^{3/2}\le C|x|^{-6}$。Newton：`eq:tf-priced-mean` $\phi_Z(d)=Q_Z/d+\int_{|y|>d}(1/d-1/|y|)\rho_Z$。有限质量给 $Q_Z=\lim d\phi_Z(d)\ge0$；$d=1$ 给 $Q_Z\le\phi_Z(1)\le C+1$；用 $C|y|^{-6}$ 的外区积分得 `eq:tf-uniform-exterior` $0\le\phi_Z(d)\le Cd^{-1}+Cd^{-4}$；取固定足够大 $R$，$\phi_Z<1$ 在 $d>R$ 对所有 $Z$ 成立，故那里 $\rho_Z=0$、$\phi_Z=Q_Z/d$。

极限电荷（`06:249-268`）：$Z\to\infty$ 通过实数，紧环面上上下界加源界给局部 Poisson 估计与收敛子列，极限 $\phi_\infty$ 满足 `eq:limit-pde` 与 $c|x|^{-4}\le\phi_\infty\le1+C|x|^{-4}$，`eq:tf-uniform-exterior` 给无穷远衰减，由 Lemma 5.1 唯一性这就是 §5 构造的同一场，外电荷即 $q$；$Q_Z=d\phi_Z(d)\to d\phi_\infty(d)=q$，子列极限唯一给 `eq:tf-unit-charge` $Q_Z\to q$。

其它价格（`06:270-323`）：$\rho_{Z,t}$ 最小化 $\mathcal T_Z+t\int$，限制到 $B(0,Z/t)$。取 $b=t^{-1/4}$，变换 $\tilde\rho(x)=b^6\rho_{Z,t}(bx)$，$\tilde\phi(x)=b^4(V-K*\rho_{Z,t})(bx)$ 给出核电荷 $b^3Z$ 的单位价格最小与场，因为 $\mathcal T_{b^3Z}(\tilde\rho)+\int\tilde\rho=b^7(\mathcal T_Z(\rho_{Z,t})+t\int\rho_{Z,t})$。质量乘 $b^3$，故 `eq:tf-price-scaling` $Q_Z(t)=t^{3/4}Q_{t^{-3/4}Z}\to qt^{3/4}$。定义 $\Pi_Z,G_Z^{\TF}$，同样的端点最小割线与 $-vQ_Z(v)\le G_Z^{\TF}(v)\le0$（这里零价格是恒等式 `eq:tf-neutral-minimum`，比量子端强，没有 $-C$ 项）给 `eq:tf-priced-energy` $G_Z^{\TF}(t)\to-\frac47qt^{7/4}$，$\mathcal T_Z(\rho_{Z,t})-E_Z^{\TF}(Z)\to\frac37qt^{7/4}$。每个价格最小在它自己的质量上也是最小；固定 $t_-<q^{-4/3}<t_+$ 使两质量在 $Z-1$ 两侧（大 $Z$），质量单调加 `eq:tf-priced-energy` 再 $t_\pm\to q^{-4/3}$ 给 `eq:tf-unit-deficit`。

固定移除质量（`06:325-340`）：密度缩放 $\rho(x)=m^2\sigma(m^{1/3}x)$。我逐项验了齐次度：质量 $\int\rho=m^2\cdot m^{-1}\int\sigma=m\int\sigma$；动能 $\int\rho^{5/3}=m^{10/3}\cdot m^{-1}\int\sigma^{5/3}=m^{7/3}\int\sigma^{5/3}$；核项 $Z\int\rho/|x|=Zm^2\cdot m^{-1}\cdot m^{1/3}\int\sigma/|y|=m^{7/3}(Z/m)\int\sigma/|y|$；直项 $m^4\cdot m^{-2}\cdot m^{1/3}=m^{7/3}$。四者一致故 `eq:tf-mass-scaling` $E_Z^{\TF}(N)=m^{7/3}E_{Z/m}^{\TF}(N/m)$，$I_m^{\TF}(Z)=m^{7/3}I_1^{\TF}(Z/m)$。固定实 $m>0$，$Z/m\to\infty$，套 `eq:tf-unit-deficit` 即 `eq:tf-constant` 与 $a_{\TF}$ 的值。

(c) 机械原因。$b^7$ 与 $b=t^{-1/4}$ 的耦合：动能/直项/核项统一乘 $b^{7}$（密度尺度 $b^6$、势尺度 $b^4$），质量乘 $b^3$；要让"加价格 $t$"变成"加价格 1"，需 $b^7\bigl(t\int\rho\bigr)=1\cdot\int\tilde\rho=b^3\int\rho$，故 $t=b^{-4}$，即 $b=t^{-1/4}$。这是 $b^4t=1$ 的唯一来源，也是 §3 里 $\lambda=s^{-4}$ 的同一算子。为什么核电荷必须变 $b^3Z$：$\tilde\phi=b^4V(b\cdot)$ 的点核项是 $b^4Z/(b|x|)=b^3Z/|x|$，即 $\Delta$ 与 $\delta_0$ 在膨胀下的权重 $b^{-2}\cdot b^3=b$ 一致。$t^{3/4}$ 出现在 $Q_Z(t)$：$Q$ 是无量纲质量差，按定义 $Q_Z(t)=Z-\int\rho_{Z,t}$ 而 $\tilde\rho$ 的质量是 $b^3\int\rho_{Z,t}$，核电荷是 $b^3Z$，故 $Q_{b^3Z}(1)=b^3Z-b^3\int\rho_{Z,t}=b^3Q_Z(t)$，即 $Q_Z(t)=b^{-3}Q_{b^3Z}(1)=t^{3/4}Q_{t^{-3/4}Z}$ ✓ 与原文 `06:289` 同式。$\rho_Z\le C|x|^{-6}$ 是 $|x|^{-4}$ 势的 $3/2$ 次幂，这个指数链把 $Q_Z$ 的外区积分收敛性钉住（$\int^\infty r^{-6}r^2dr$ 收敛），若换成 $|x|^{-4}$ 势给 $|x|^{-6}$ 密度正好是临界可积，这与 §3 用 $\mu\sim d^{-6}$ 同源。为什么需要 $V\in L^{5/2}(B(0,Z))$：$|x|^{-1}\in L^{5/2}_{\rm loc}$ 且 $L^{5/2}$ 是 $L^{5/3}$ 的对偶指标（$2/5+3/5=1$），恰好让核项连续，强制性与弱下半连续都靠它。为什么允许实电荷：`\FTFPair` 的假设是任意正点源（`06:267-268`）。

(d) 备选路线。路线一：直接对 TF 能量差 $E_Z^{\TF}(Z-1)-E_Z^{\TF}(Z)$ 做 Euler–Lagrange 一阶扰动，把 $-1$ 当小质量。卡点：中性最小子的化学势在 $V=1$ 处不为零，一阶扰动跨相边界（$\phi_0$ 的正部边缘），需要的是"至多一"的变分，并非可微扰动。路线二：用 Lieb–Simon 的 TF 极限 $N=Z\to\infty$ 直接给 $I_1$。卡点：TF 极限给的是 $E^{\TF}$ 的整数量级，不给单位移除的 $O(1)$ 精度，且 `06:99-104` 明确把经典弱电离归给 Bénilan–Brezis 与 Lieb–Simon 的化学势积分，本节要做的是在同一归一里对齐 $q$。路线三：把 $Q_Z\to q$ 换成凸对偶（$P$ 的次微分在 $t=1$ 处）。卡点：TF 泛函对质量的严格凸不给出扇区 $E^{\TF}_Z(N)$ 的凸性，仍须端点最小割线。

### 12.4 迭代极限的收尾（`06:343-371`）

设沿无界 $m_j$ 内上极限超出 $a_{\TF}$ 固定 $\eta>0$，由 limsup 定义对每个 $j$ 可选任意大 $Z_j>m_j$，特别 $Z_j/m_j\ge j$，使归一能量 $>a_{\TF}+\eta/2$，与 `eq:joint-limit` 矛盾；内上极限无限时同法。内下极限低于 $a_{\TF}-\eta$ 同理。于是 $\limsup_m(\limsup_ZI_m)/m^{7/3}\le a_{\TF}$ 且 $\liminf_m(\liminf_ZI_m)/m^{7/3}\ge a_{\TF}$；内下不超过内上，故两外极限存在并等于 $a_{\TF}$。原文钉死一句：`06:368-370` "The construction always chooses $Z$ only after $m$ is fixed; no convergence in $Z$ at a fixed $m$ has been assumed." 这就是为什么 joint 结果比两个迭代极限强，而我最初以为要先证固定 $m$ 的 $Z$ 极限存在，那条路是多余的。

## 13 把 7/3 一次算到底

链条五环，我在前面各节已分别核过，这里串成一条并给出每环的算术。

第一环，TF 齐次。$E^{\TF}_Z(N)=m^{7/3}E^{\TF}_{Z/m}(N/m)$（`06:334`），指数 $7/3$ 是 $d=3$ 与动能 $p^2$ 的产物：密度尺度 $m^2$、动量尺度 $m^{1/3}$ 给 $m^{2\cdot5/3-1}=m^{7/3}$，与核项 $m^{7/3}\cdot(Z/m)$、直项 $m^{7/3}$ 同时成立。若把维数与动能次数换掉，齐次度会跟着换，本篇只用到 $d=3$、二次动能这一组，我不引入一般形式 [推测]。

第二环，把 $N=Z$ 换成 $N=m$。$I_m(Z)=E_Z(Z-m)-E_Z(Z)$，在 $Z/m\to\infty$ 区域里外层电荷尺度是 $Z$，移除数 $m$ 是内层，$m^{7/3}$ 出现的机制：定价里 $m=s^{-3}$（`06:32` 的 $s=t^{-1/4}m^{-1/3}$ 即 $s^{-3}=t^{3/4}m$），于是"电荷减少 $m$"对应 TF 齐次的自变量减少 $m$，齐次度 $7/3$ 直接把 $m$ 提到前面。

第三环，价格积分。亏损 $d(t)\to qt^{3/4}$，Legendre 给能量差 $(3/7)qt^{7/4}$，夹逼中心 $t=q^{-4/3}$，故 $I_m/m^{7/3}\to\frac37q^{-4/3}=a_{\TF}$。求导自检：$d(\frac37q^{-4/3}m^{7/3})/dm=q^{-4/3}m^{4/3}=\lambda^*$，即在最优移除数处的边际价格正是 $q^{-4/3}$（归一后），两环自洽。

第四环，$q$ 的来源与 $A_{\rm S}$。$q$ 是 §5 唯一衰减轮廓的外电荷；该轮廓在近零是 $A_{\rm S}|x|^{-4}$，$A_{\rm S}=(12/(4\pi k))^2=(81/8)\pi^2\approx99.9$（闭式与小数由我算，tex 只写 $(12/(4\pi k))^2$）。$q$ 与 $A_{\rm S}$ 的关系是边值问题：$F_\infty$ 从 $A_{\rm S}|x|^{-4}$ 出发、穿过反应饱和区、在 $|x|>2R_0$ 变成 $q/|x|$；$q$ 由唯一轮廓决定，故与 $Z,m,s$ 无关，只与 $k$（即 $T$，即自旋简并）有关。

第五环，自旋 1/2 只进 $T$。两自旋态的自由 Fermi 气：数密度 $\rho=g\frac{4\pi p_F^3/3}{(2\pi)^3}=\frac{g}{6\pi^2}p_F^3$，动能密度 $g\frac{4\pi}{(2\pi)^3}\frac{p_F^5}{10}=\frac{g}{20\pi^2}p_F^5$。$g=2$ 时 $\rho=p_F^3/(3\pi^2)$，即 $p_F=(3\pi^2\rho)^{1/3}$，动能密度 $=\frac1{10\pi^2}(3\pi^2\rho)^{5/3}=\frac3{10}(3\pi^2)^{2/3}\rho^{5/3}=T\rho^{5/3}$ ✓ 与 `01:58` 完全一致；一般 $g$ 时 $T_g=g^{-2/3}(6\pi^2)^{5/3}/(20\pi^2)$，故 $T\propto g^{-2/3}$，$k=(5T/3)^{-3/2}\propto g$，$A_{\rm S}\propto k^{-2}\propto g^{-2}$，$q$ 与 $a_{\TF}$ 随之数值变化，但 $7/3$、$4$、$3/4$、$7/4$、$3/7$ 全部不动。这就是"two electron spin states"进入定理的唯一通道。

## 14 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $T$ | $\frac3{10}(3\pi^2)^{2/3}\approx2.87$ | 01:58 | 动能下界 Prop 3.2、密度律 $k\phi_+^{3/2}$、$k$ 的定义 | $k,A_{\rm S},q,a_{\TF}$ 全变，$7/3$ 不变；自旋简并由此进 |
| $k$ | $(5T/3)^{-3/2}\approx0.0955$ | 02:15；01:144 | 密度律、$4\pi k\sqrt B\le19/2$、$A_{\rm S}=(12/(4\pi k))^2$ | 改 $k$ 需同改 $B$ 上界，否则 04:21 的下解不等式翻向 |
| $Z,m$ | $m\to\infty$，$Z/m\to\infty$ | 01:80-84；02:26-29 | 定价 regime、`eq:rough-deficit`、$D_0\le Cs^{-7}$ | 若 $Z/m$ 有界则 05:33-41 的 $l^{-8}$ 容差压不住 [推测] |
| $s,\lambda$ | $\lambda=s^{-4}$，$s\to0$，$Zs^3\to\infty$ | 02:26-29；06:32 | 所有 rescale $F_s,\rho_s,U_s$；$s=t^{-1/4}m^{-1/3}$ | 指数 4 改则 $b^4t=1$ 与 $b=a^{1.2}$ 阶梯同时断 |
| $r_j,\ell_j$ | 倍半径阶梯；$\ell_j=r_j^{1.01}$ | 03:22-25 | 观测塔、事件倾斜代价 $r^{-2.02}$ | 1.01 改 1 则 2.02 变 2，对数幂 $\log^5$ 无处吸收 [推测] |
| $L,A$ | $L=10^5$，$A=40$ | 03:39 | 母弹头半径 $a_y=\lvert y\rvert/L$、帽常数、$r^{40}$ 事件概率 | $A$ 变小则 03:191 的 $o(r^{-3})$ 失败，壳层计数失效 |
| $w,c_1$ | $w=10^{-5}$，$0<c_1<(10L)^{-1}$ | 03:44 | $t_x=c_1D^{\rm b}\min(D^{\rm b},s)^w$；$s^{19/2-3w}$ | $w$ 增大则 $19/2-3w$ 逼近 $\le3$ 时外区质量界断 |
| $b$ | $a^{1.2}$ | 03:510 | 壳尺度与补丁尺度之间的空档 | 1.2 若 $\le1$ 则 $b\ge a$，03:527 的 $B(y,4a)$ 内 TF 界不适用 |
| $\delta'$ | $Cr^{-2.02}\log^5(e/r^{42})$ | 03:264 | 补丁误差预算四项 | 改 $\log$ 幂则 03:513 预算表 $a^{4.98}\log^5$ 溢出 |
| 场帽 | $C+C(d/s)^{7/2}-(d/s)^4+C_Mr^{2.49}\log^{5/2}(e/p)$ | 03:203-245 | Lemma 3.1、$C_{\rm cap}$、局部 TF 上界 | 去掉负四次项则 05:98 的 $F_s\le1+C_{\rm cap}\lvert x\rvert^{-4}$ 断 |
| $D_0$ | $\le Cs^{-7}$ | 02:184-230 | 偏移记账、$C_{R_0}$ 壳层和 | $s^{-7}$ 变大则 02:234-348 的 $s^2$ 主项被吞 |
| $\eps$ | 固定小，$Zr_0^3=\eps^3$ | 04:135 | 初始化 $v>(0.14)Z/r_0$ | 0.05 阈值与 $4C_3\eps^{3/2}$ 冲突则 04:152 无法取 $B\le0.1\eps^3$ |
| $C_3$ | $6C_3\ge4\pi k2^{3/2}$，$4C_3\eps^{3/2}\le0.05$ | 04:133-134 | 障碍初始化 | 改系数则 04:144 的 $0.14$ 变号，$u_0$ 起点不成立 |
| $B$ | $0<B\le0.1\eps^3$ 且 $4\pi k\sqrt B\le19/2$ | 04:24, 04:152 | $b_r$、$C_{\rm inv}\ge\max(B,32\eps^3)$、$F_\infty\ge B\lvert x\rvert^{-4}$ | $B$ 大则 04:21 的 $\frac{19}{2}Bd^{-6}$ 不再支配反应，整个障碍断 |
| $\gamma$ | $B/(16(1.1)^5)$ | 04:26-27 | 外步间隙 $\lambda_1<\gamma/2$（04:175） | 间隙 $\le\lambda_1$ 则归纳的两支比较失去矛盾 |
| $C_{\rm inv}$ | $\ge\max(B,32\eps^3)$ | 04:165 | 不变障碍、$c>(C_{\rm inv}S^{-4}-\min F_\infty)_+$ | 取小则 05:195-200 边界不等式无法起步 |
| $p_j$ 质量 | $\sup_j\E\int p_j\le C(r_0^{32}+s^{19/2-3w})$ | 04:53；04:167；04:346 | `eq:selected-data`、$L_s\to0$ | $r_0^{32}$ 若降为 $r_0^{3}$ 则 Markov 选取无正概率交 |
| $a_*$ | $r_j/s\in[1/(2l),1/l]$ | 05:20-22 | 障碍传递的分界；$l^{-5}$ 质量界 | 区间宽度比若 $<2$ 则倍半径无法命中，选取断 |
| $l,M$ | $l\to\infty$ 慢；$M=l^2$ | 05:25-27 | Prop 3.2 高低端点、$4Mr_j\ge2ls$ | $M$ 改小则 05:44-45 覆盖断，$l^{-8}$ 无容差 |
| $L_s$ | 质量 $\le s^3+Cl^{-5}$ | 05:180-227 | 障碍传递的修正势 | 支撑跨 $a_*$ 外则 $L_s(x)\to0$ 的逐点论证断 |
| $R_0$ | 固定外半径 | 05:58；05:131 | 外区截断、$F_\infty$ 在 $\lvert x\rvert>2R_0$ 调和 | $R_0$ 随 $s$ 变则尾部质量 $\to0$ 的界不适用 [推测] |
| $A_{\rm S}$ | $(12/(4\pi k))^2=(81/8)\pi^2\approx99.9$（小数为我算） | 05:252-255 | 接触论证 $4\pi kA^{3/2}=12A$、$q$ 与近零强度 | 12 换成 $\alpha(\alpha+1)$ 一般式则 $\alpha\ne4$ 时不等号方向断 |
| $q$ | 唯一正值，无数值 | 05:306-332 | $a_{\TF}=\frac37q^{-4/3}$、$d(t)\to qt^{3/4}$ | tex 未跟踪其数值，[推测]：与 $k$ 单调相关但无显式界 |
| $a_{\TF}$ | $\frac37q^{-4/3}\approx0.4286q^{-4/3}$ | 06:128 | Thm 1.1、Thm 1.2、TF 特征 | 系数 $3/7$ 若改 $4/7$ 则与 $G$ 的定义冲突（见 12.2） |
| $t_\pm$ | $0<t_-<q^{-4/3}<t_+$ 固定 | 06:80-82 | 夹逼 $n_{t_-}>Z-m>n_{t_+}$ | 若 $t_\pm$ 随 $m$ 变则 Riemann 和论证失序 |
| $7/3,7/4,3/4$ | 齐次度、积分度、亏损度 | 06:59；06:74；06:36 | $m^{7/3}$ 归一、$a_{\TF}$ | $\frac47+\frac37$ 关系断则 Prop 6.1 与 6.2 系数不同源 |
| $F_\infty$ 方程 | $\Delta F_\infty=4\pi k\bigl((F_\infty-1)_+\bigr)^{3/2}$，$F_\infty(x)\le1+C_{\rm cap}\lvert x\rvert^{-4}$ | 05-limit.tex:113-120 | 极限场唯一性、$q_*$ 的提取、外区 $F_\infty=q_*/\lvert x\rvert$ | 指数 $3/2$ 改动则 05:141 的 $\lvert x\rvert\to\infty$ 衰减与 05:163 的下界同时断 |
| $H_{Z,N}$ | $\sum_{i=1}^N\left(-\frac12\Delta_i-\frac{Z}{\lvert x_i\rvert}\right)+\sum_{1\le i<l\le N}\frac1{\lvert x_i-x_l\rvert}$ 作用于 $\bigwedge^N L^2(\R^3;\C^2)$ | 01-introduction.tex:47-52 | $E_Z(N)=\inf\sigma(H_{Z,N})$、$I_m(Z)$、两自旋态 $g=2$ 进定理的唯一入口 | $\C^2$ 降为一自旋则 $T$ 变、$k$ 变，05-limit.tex:118 的 $4\pi k$ 与 $a_{\TF}$ 整链换数 |
| $I_m(Z)$ | $I_m(Z)=E_Z(Z-m)-E_Z(Z)$，$E_Z(0)=0$，整数 $Z>m\ge1$ | 01-introduction.tex:53-56 | Thm 1.1 的 $I_m(Z)/m^{7/3}$、06-fixed-sectors.tex:25-31 的价格 $tm^{4/3}$ | 若放开 $m=Z$ 则 01-introduction.tex:94-95 的固定 $m$ 内极限失去对象 |
| $\mathcal T_Z(\rho)$ | $T\int\rho^{5/3}-Z\int\rho/\lvert x\rvert+\frac12\iint\rho(x)\rho(y)/\lvert x-y\rvert$ 三项 | 01-introduction.tex:60-68 | $E_Z^{\TF}(N)$ 的 inf、06 节全部 TF 侧恒等式 | 直次项系数 $\frac12$ 改 $1$ 则 06-fixed-sectors.tex:199 的定价欧拉方程与 $Q_Z(t)$ 标度同时换数 |
| $I_m^{\TF}(Z)$ | $\lim_{Z\to\infty}I_m^{\TF}(Z)=a_{\TF}m^{7/3}$（固定实 $m>0$） | 01-introduction.tex:69-74 | 常数 $a_{\TF}$ 的刻画方式、06-fixed-sectors.tex:118-125 的识别目标 | 右端写成 $m^{5/3}$ 则与 06-fixed-sectors.tex:18-21 的量子极限 $\frac37q^{-4/3}$ 不同源 |
| $CZ^{20/21}$ | 中性原子首个电离能的旧上界，note added in proof 改进后的指数 | 01-introduction.tex:26-28 | §1 的 regime 对照，说明 01-introduction.tex:21-23 的 joint 极限未被旧结果覆盖 | 把它当本篇输入则 06-fixed-sectors.tex:18-21 的 $m^{7/3}$ 渐近被误认为含于 $Z^{20/21}$ [推测]，推测原因：tex 只引它作文献事实 |
| $N_*$ | 最大下降指标，$n\le2Z+1\le3Z$，$E=E_{N_*}=E_n$（$n\ge N_*$） | 02-pricing.tex:45-51 | 扇区塔的截断、$E_n$ 非增性、$\delta$-态密度界的适用范围 | $3Z$ 换成 $2Z$ 则 02-pricing.tex:48 的 $Z\le N_*\le3Z$ 断，后续 $n\le3Z$ 的预算失去载体 |
| $C,Z_0$（中性偏移） | $E_Z(Z)\le E+C$（$Z\ge Z_0$） | 02-pricing.tex:52-54 | 06-fixed-sectors.tex:64-66 的零价格端点、$G_{Z,m}(v)$ 的双边夹 | 偏移量若随 $Z$ 增长则 06-fixed-sectors.tex:67-68 的 $\limsup\lvert G_{Z,m}(v)\rvert\le qv^{7/4}$ 失效，积分常数定不下来 |
| $\int\rho_\psi^{5/3}$ | $\le C(Z^{7/3}+\delta)$，对任意未平移 $\delta$-态与扇区 $n\le3Z$ | 02-pricing.tex:66-67 | $D^{\rm b}$ 定价、偏移记账、壳层质量的动能预算 | 幂 $7/3$ 降为 $5/3$ 则 $D_0\le Cs^{-7}$ 的同次性对不上 [推测]，推测原因：tex 未给该界的饱和例子 |
| $\chi$ | 光滑截断，$\operatorname{supp}\chi\subset[1/2,4]$，在 $[1,2]$ 上恒等于 $1$ | 02-pricing.tex:244-245 | $w_i=\chi(\lvert x_i\rvert/u)^2$、$S_u$、$m_u$、$N_u$ 壳层四件套 | 支撑收窄到 $[1,2]$ 则 $N_u$ 与 $m_u$ 的环带比失去缓冲，壳层不等式右端的 $u^{-2}N_u$ 吸收不了边界质量 |
| $m_u,N_u$ | $s^{-4}m_u\le Cu^{-2}N_u+\E\sum_iw_iB_{u/8}(x_i)$，输入是 $E_{n-1}-E_n\ge s^{-4}$ | 02-pricing.tex:262-265 | 外区截断 $s^3\E_\Psi\#\{i:\lvert x_i\rvert>R_0s\}\to0$（02-pricing.tex:238-239）的壳层求和 | 能隙下界 $s^{-4}$ 改 $s^{-2}$ 则截断不再给 $o(1)$，05-limit.tex:113 的极限场取不出子列 |
| $f(t)$ | $f(t)=4\pi k(t_+)^{3/2}$，配合 $b_r(y)=Bd^{-4}\left(1-\frac r{8d}\right)$（$d\ge r$） | 04-barriers.tex:14-17 | 障碍不变式的反应项、$\Delta b_r\ge f(b_r)$ 的起步条件 | 指数 $3/2$ 改动则 $4\pi k\sqrt B\le19/2$ 不再成立，障碍与 $F_\infty$ 的比较整体翻向 |
| $u_j$ | $\Delta u_j\ge-4\pi\nu+4\pi\mathbf 1_{\{d<r\}}\mu_j-4\pi p_j+\mathbf 1_{\{d\ge r\}}f(u_j)$，$b_r\le u_j\le C_{\rm inv}d^{-4}$，$u_j=b_r$（$d>Mr$） | 04-barriers.tex:31-44 | 障碍在 $\mathcal F_j$ 上的可测传递、$M>2$ 的外侧钉扎 | $M$ 若 $\le2$ 则 $d>Mr$ 与 $d\ge r$ 两支重叠，归纳里 $u_j$ 与 $b_r$ 的边界比较失去一致 |
| $G_{Z,m}(t)$ | $m^{-7/3}\left[P(tm^{4/3})-tm^{4/3}Z-E_Z(Z)\right]$，$n_t$ 极小化 $E_n+tm^{4/3}n$ | 06-fixed-sectors.tex:25-31 | 量子割线不等式与分区 Riemann 和（06-fixed-sectors.tex:42-45,52-56） | 归一 $m^{-7/3}$ 改 $m^{-4/3}$ 则增量右端多出 $m$ 的幂，夹不到 $-\frac47q\left(t^{7/4}-v^{7/4}\right)$ |
| $d_{Z,m}(t)$ | $(Z-n_t)/m\longrightarrow qt^{3/4}$，对每个固定 $t>0$ 与每个极小指标 | 06-fixed-sectors.tex:35-38 | Riemann 和的两端（06-fixed-sectors.tex:52-56）、$G_{Z,m}(t)$ 的割线斜率 | 幂 $3/4$ 改 $\beta$ 则 $\frac47$ 变 $\frac1{1+\beta}$，$a_{\TF}=\frac37q^{-4/3}$ 的 $3/7$ 系数不同源 |
| $Q_Z$ | $Q_Z=d\phi_Z(d)\longrightarrow d\phi_\infty(d)=q$，子列极限唯一给出整列收敛 | 06-fixed-sectors.tex:262-265 | $q$ 的 TF 侧同一性、eq:tf-unit-deficit 的 $\frac37q^{-4/3}$ | 若 $d\phi_\infty(d)$ 随 $d$ 变则 $q$ 不成其为常数，$\frac37q^{-4/3}$ 无定义 [推测]，推测原因：与 $d$ 无关只写在子列唯一性论证里 |
| $Q_Z(t)$ | $Q_Z(t)=t^{3/4}Q_{t^{-3/4}Z}\longrightarrow qt^{3/4}$，靠 $b=t^{-1/4}$ 的 $\widetilde\rho(x)=b^6\rho_{Z,t}(bx)$ 与 $\widetilde\phi=b^4(V-K*\rho_{Z,t})(bx)$ | 06-fixed-sectors.tex:274-291 | $b^7$ 齐次、$\Pi_Z(t)$ 的定价泛函、量子侧 $d_{Z,m}(t)$ 的对照 | $b^6$ 与 $b^4$ 若同改则质量倍数不再是 $b^3$，$t^{3/4}$ 前因子与量子侧的 $qt^{3/4}$ 极限对不上 |

依赖链。$Z,m$ 决定 $s$（$m\asymp s^{-3}$，$\lambda=s^{-4}$），$s$ 决定 $r_j$ 阶梯与 $\ell_j=r_j^{1.01}$、$b=a^{1.2}$、$t_x\asymp as^w$ 这套尺度；$\eps$ 与 $r_0$ 由 $Zr_0^3=\eps^3$ 绑定，决定 $B\le0.1\eps^3$、$C_{\rm inv}$、$\gamma$，从而决定障碍能否起步；$D_0\le Cs^{-7}$ 与壳层和 $C_{R_0}(s^2+s^{5/2}+s^5+s^{11/2})$ 一起进入偏移记账，误差密度 $p_j$ 的期望质量 $C(r_0^{32}+s^{19/2-3w})$ 是这一切的汇总；汇总后 $l^{-8}$、$\delta'$、$r^{2.49}\log^{5/2}$ 三类容差决定 05 的选取能否同时成立；选取成立后 $F_\infty$ 唯一、$q$ 定出；$q$ 通过 $d(t)\to qt^{3/4}$、$\frac47qt^{7/4}$、$\frac37qt^{7/4}$、$t_\pm\to q^{-4/3}$ 四步给出 $a_{\TF}=\frac37q^{-4/3}$；$a_{\TF}$ 的数值再只通过 $k$（即 $T$、即自旋简并 $g=2$）回连到物理输入。截断尺度与误差阶全部由 $s\to0$ 的幂次语言书写，$w=10^{-5}$ 与 2.02、2.49 这类小数是刻意留下的空档，用来吸收 $\log$ 幂。

## 15 Lean 取证

命令与实测（只在本篇条目定位到的目录内跑）。`formalization.yaml`：1668 行 / 75,593 字节；论文条目在 387-389 行，formalization 条目在 1066-1068 行，`comparator_config: ComparatorChallenges/CoulombIonization.json`，`declaration: OAI.CoulombAtom.generalized_ionization`，`file: OAI/Analysis/CoulombIonization/Main.lean`；全 yaml `grep -c axioms` 得 0。

模块 `E:/math/lean/OAI/Analysis/CoulombIonization/`：607 个 `.lean` 文件、95,362 行。顶层 2 个文件 150 行（`Main.lean` 54、`Model.lean` 96）。子目录（文件数/行数）：Fermionic 36/5,729；FieldAnalysis 93/14,204；FormDomain 49/8,027；Ionization 29/3,980；Localization 79/12,507；RadialBounds 154/24,381；ThomasFermi 64/9,500；Variational 101/16,884（合计 605/95,212，加顶层 2/150）。最大三个文件：`Ionization/IntegratedStability.lean` 655 行、`ThomasFermi/Pairing.lean` 500、`Ionization/SharpEventLawJointComparisonCell.lean` 472。

顶层声明计数（`grep -r -h -E` 行首匹配求和）：`theorem` 665、`lemma` 4056、`def` 769、`noncomputable def` 1、`abbrev` 44、`instance` 39、`structure` 20、`inductive` 1、`example` 0、`mutual` 0、`axiom` 0；`namespace` 行 1340、`import` 行 1634。`sorry` 出现行数 0，`admit` 0，模块内声明公理 0。

策略词频（`grep -r -o -h -E "\b<词>\b"` 全模块求和）：`by` 12249、`have` 9898、`rw` 4556、`exact` 3667、`apply` 2887、`simp` 2415、`intro` 1902、`let` 1264、`positivity` 1180、`norm_num` 1061、`ring` 847、`filter_upwards` 812、`obtain` 717、`dsimp` 635、`calc` 607、`nlinarith` 564、`continuous` 532、`simp_rw` 469、`show` 397、`congr` 332、`mono` 328、`funext` 245、`field_simp` 216、`ext` 207、`classical` 205、`constructor` 134、`exact_mod_cast` 82、`gcongr` 76、`rcases` 69、`omega` 66、`cases` 54、`decide` 45、`induction` 33、`push_cast` 29、`ring_nf` 9、`aesop` 1。这是词出现次数，含注释与字符串，属粗测，方法与局限一并记下。

环境与许可。`lean-toolchain` 为 leanprover/lean4:v4.34.1；mathlib 固定到 commit `d13f23b723b8a846827a245b89c10fc7d3f11612`；`.lake/build` 为空目录，所以我无法跑 `#print axioms`，源码里也没有 `#print axioms` 文本（grep 命中 0）。`ComparatorChallenges/CoulombIonization.json`（349 字节）声明 challenge_module `ComparatorChallenges.CoulombIonization`、solution_module `OAI.Analysis.CoulombIonization.Main`、theorem_names 只一个 `OAI.CoulombAtom.generalized_ionization`、definition_names 为空、permitted_axioms 为 `propext, Quot.sound, Classical.choice`、`enable_nanoda false`。

主链位置：`Model.lean:13` `abbrev Spins (N : ℕ) := Fin N → Fin 2`（两自旋态）；`:22-35` `FormAdmissible`（含置换反号、归一、Coulomb 可积）；`:37-44` `formEnergy`（$-\Delta/2$）；`:46-48` `energy Z N = if N=0 then 0 else sInf`；`:50-51` `ionization (m Z : ℕ) := energy Z (Z-m) - energy Z Z`；`:53` `tfKinetic := (3/10)*(3*Real.pi^2)^(2/3)`；`:72-74` `TFCharacterization`；`:76-81` `JointLimit`；`:83-87` `IteratedLimits`；`:89-90` `MainStatement := ∃ a, 0<a ∧ TFCharacterization a ∧ JointLimit a ∧ IteratedLimits a`。`Main.lean` 用 `classical` 造 `actual_quantum_jointLimit`（`N (j t) := Classical.choose (quantum_exists_priceMinimizes ...)`，`fixedSectorScale t m := t^(-1/4)*m^(-1/3)`），末尾 `generalized_ionization : MainStatement := ⟨actualTFCoefficient, actualTFCoefficient_pos, tf_actual_characterization, actual_quantum_jointLimit, iteratedLimits_of_jointLimit actual_quantum_jointLimit⟩`。关键定义：`Ionization/ActualTFCoefficient.lean:74` `actualTFCoefficient := (3/7)*tfResidualCharge^(-4/3)`；`ThomasFermi/TfInfiniteFieldDominatesDilation.lean:148` `tfSupportRadius := TFUnitData.chargeCap 1 + 2`、`:210` `tfResidualCharge := tfSupportRadius * tfInfiniteRadial tfSupportRadius`、`:212` `tfResidualCharge_pos`；`Ionization/PricedSubsequence.lean:89` `actual_priced_deficit_limit`（结论 `Tendsto (s^3*((Z:ℝ)-(N:ℝ))) atTop (𝓝 tfResidualCharge)`，用 `real_tendsto_of_subsequences`）；`Ionization/IntegratedStability.lean:429` `PriceMinimizes`、`:499` `scaledDeficit`、`:591` `fixed_sector_limit_of_priced_deficit`、`:647` `quantum_exists_priceMinimizes`；`FormDomain/FullSpectral.lean:77` `spectralEnergy_eq_energy`；`Variational/DiffuseSeed.lean:337` `quantum_energy_antitone`；`ThomasFermi/SommerfeldCoefficient.lean:184` `sommerfeldCoefficient d := (12/d)^2`、`:365` `singular_profile_unique`、`:417/422` 旋转不变与径向。

论文陈述与 Lean 陈述的错位，我逐条记下八条。(1) tex 的 $E_Z(N)=\inf\sigma(H_{Z,N})$ 是谱下确界，Lean 的 `energy` 是对 `FormVector` 二次型的 sInf，两者靠 `spectralEnergy_eq_energy` 一座桥连，桥的另一侧（算子与型的一致性）不在本篇目录里。(2) tex 里 $q$ 是量子极限唯一衰减轮廓的外电荷（05:306-332），Lean 里 `tfResidualCharge` 完全在 TF 一侧用围捕 `tfSupportRadius := TFUnitData.chargeCap 1 + 2`（即先定支撑半径再加 2）构造，定义顺序与论文相反：论文"先有解再取电荷"，Lean"先给编码再乘场值"。(3) 最小化扇区在 Lean 里由 `Classical.choose` 选出，故 `Classical.choice` 真实被用，与 permitted_axioms 一致；但因 `.lake/build` 空，我无法用 `#print axioms` 验证，只能从 `Main.lean` 的 `classical` 块与 choose 调用推断。(4) `ionization` 用 ℕ 减，靠 `JointLimit` 假设里的 `∀ j, 1 ≤ m j ∧ m j < Z j` 保住非负，tex 的 $m<Z$ 是同一条但写成区间条件。(5) `energy`/`tfEnergy` 里 $Z$ 是 `ℝ`，而定理量词是 `ℕ → ℕ`，tex §6 允许实电荷正好对上这一层，§1 的整数电荷需一次嵌入。(6) 全模块没有 $q$ 或 $a_{\TF}$ 的任何数值，`actualTFCoefficient` 停在 `(3/7)*tfResidualCharge^(-4/3)`，与 tex 一致。(7) 收敛性走 `real_tendsto_of_subsequences`（子列原理），对应 tex 的"所有子列给同一 $q$ 故整列收敛"。(8) `JointLimit` 与 `eq:joint-limit` 内容逐字对应；`IteratedLimits` 在 Lean 里由 `iteratedLimits_of_jointLimit`（`Ionization/IteratedReduction.lean:63`）机械导出，对应 `06:343-371`。另外 Lean 体量与 tex 的对应关系值得记一句：607 个文件里最大子目录是 RadialBounds（154 文件 / 24,381 行），而 tex 里障碍一节只有 353 行，形式化的重心明显压在近端界与奇异性传递上。

## 16 我查到的外部文献线（口径独立于论文正文）

以下都是我自己检索所得，用来定位这篇预印本在文献里的位置，任何一条都不能当作论文结论引用。

论文自身的 `references.bib` 列了 Foundation、Solovej2016（"A new look at Thomas-Fermi theory"，Molecular Physics）、Solovej2003（Annals，Hartree-Fock 电离）、LiebSimon1973/1977、LiebThirring1975、Rumin2011、Lieb1981RMP、Thomas1927、Fermi1927、Solovej1991、BenguriaLieb1985、SecoSigalSolovej1990（$CZ^{20/21}$ 上界）、Ivrii2017、Bénilan–Brezis 2004。这些是从 tex 读到的，属论文事实。

检索结果：我找到 Hundertmark、Pattakos、Schulz 2025（arXiv:2504.18487）的过剩电荷界 $N_c(Z)<1.1185Z+O(Z^{1/3})$，这是目前与"每原子可束缚多少电子"最直接相关的定量结果；另有一篇 Springer 的 Scott 猜想大型 Coulomb 系统综述（2023）。我没能通过检索确认 Fefferman 问题清单的原文条目、Solovej 电离猜想架构的分层细节、Solovej–Ziegler 的 $Z^{7/5}$ 束缚上界、Graf–Schenker 的 $Z\alpha$ 系列结果：这些我只能标 [推测]，并说明它们是 tex 引文之外的传闻线索，与本篇证明无关。`06:99-104` 把经典弱电离律明确归给 Bénilan–Brezis 的推论 5 与 Lieb–Simon 的化学势积分论证，这条既是 tex 事实也是文献事实，两者在此重合。TF 理论中 $g=2$ 自旋简并给出的 $(3\pi^2)^{2/3}$ 我在 13 节按自由 Fermi 气重推了一遍，与 Lieb–Simon 及 `01:58` 一致。

## 17 与近邻笔记的边界

D03（Vlasov–Maxwell 整体经典解）：同为 Coulomb 型长程相互作用，但它是单粒子分布函数层面的动力学，本篇是量子多体基态能量差。两者的量（分布函数对 $L^\infty$ 与特征函数）不同，D03 的结论不作为本篇输入，我也不引用它的任何估计。

D16（径向对势的连续温度奇点）：那里的问题是径向对势在热力学极限下的奇性；本篇出现径向性两处，Lemma 5.1 的 $F_\infty$ 与 TF 的 $\phi_0,\phi_Z$。边界在于：本篇的径向性是"由唯一性导出"的副产品，D16 的奇点分析对唯一性没有提供工具，我不借用。

D27（Fock 空间不等式与 Laughlin 谱隙）：与 Landau Levels 型动能不等式有关，而本篇动能是完整 Coulomb 哈密顿量的谱下确界加 Lieb–Thirring 型下界（`01:155-194` 的先例段与 Prop 3.2 的量子动能界）。边界在于 D27 的有限维 Fock 截断在本篇没有任何对应，本篇的截断是母弹头与观测塔的几何尺度，两者不可互换。

## 18 我留下来没解决的疑点

一，$q$ 没有任何数值或界。整个定理的常数被 $q$ 吸收，而 $q$ 是一个非线性奇异边值问题的外电荷，tex 未给单调性、渐近或上下界。我能说的是 $q$ 只依赖 $k$（见 13 第五环），故它是绝对常数 [推测]，但"绝对"这一步我没有证明链上的 Lean 依据，Lean 也只到 `tfResidualCharge_pos`。

二，$l\to\infty$ 的"足够慢"没有量化。`05:47-52` 只说 slow diagonal choice；三件事（容差、覆盖、阈值 eventually）各需什么速度，我没能从 tex 里读出显式不等式，因此 §5 的可选性我只能整体接受 [推测]。

三，`eq:barrier-error-mass` 的 $r_0^{32}$ 与 $s^{19/2-3w}$ 的幂次余量太大，说明作者留了吸收空间；哪些步骤是真临界的，我从 tex 看不出。02 的 $s^2$ 主项与 04 的 $19/2$ 之间的量级差近 8 个幂，我怀疑真正的瓶颈在 03 的场帽 $r^{2.49}$ 与 $-r^4$ 之间的竞争 [推测]，无法证实。

四，Foundation 那一份前置文献在本篇以 `\FTFPair` 等 18 个宏引用内部编号，我只看到宏名映射（`foundation-locators.tex`），未看到被引内容本身，因此 §6 里"$\rho_0$ 质量 $\le2Z$、下界 $c\min(Z/|x|,|x|^{-4})$"这两条我只能当作外部黑箱接受。

五，Lean 与 tex 的 $q$ 定义顺序相反（第 15 节第 (2) 条），我无法判断这是形式化过程中的必要妥协还是等价重排，也无法验证 `tfResidualCharge` 与量子极限外电荷在数学上相等的那一步是否已在别的文件里闭合（我 grep 到的只有 `TFUnitData.deficit_eq`，:219）。

自认最薄的三节：§15 里我对 Foundation 黑箱的处理（只列宏名，未查被引内容）、§11.3 之后对"一致衰减 vs 逐点衰减"差异的判断（我用了 [推测] 但没给出反例）、§16 外部文献（多数条目检索失败，标 [推测] 的比例高）。
