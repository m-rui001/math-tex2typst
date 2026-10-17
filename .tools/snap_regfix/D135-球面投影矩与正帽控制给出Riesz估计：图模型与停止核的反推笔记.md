# D135 球面投影矩、正帽支配与 Riesz 估计：图模型与停止核的反推笔记

素材边界（先钉住，后面不再回头）：论文 `Projection moments, positive cap domination, and Riesz estimates on the sphere`，队列行 101；正文唯一来源是 `preprints/Projection-moments-positive-cap-domination-and-Riesz-estimates-on-the-sphere-September-27-2026/build/` 下的 `main.tex`（31 行实读）、`preamble.tex` 与 `sections/` 里 5 个分节；Lean 侧只走 `lean/formalization.yaml` 第 1414-1416 行登记的 `comparator_config: ComparatorChallenges/ProjectionMoments.json`、`declaration: OAI.ProjectionMoments.main`、`file: OAI/Probability/ProjectionMoments/Main.lean`，加上 `lean/OAI/Probability/ProjectionMoments/` 里 25 个 .lean 与那份 340 B 的 json。同族里 yaml 第 1466-1468 行的 `RieszQuantitative.json` 与 `OAI/Analysis/RieszRectifiability/Uniformity/Rectifiability.lean` 属于另一篇高余维 Riesz 可求长性论文，本篇与它在符号 $\alpha$ 上撞车而内容无关，这条分界我只在此说明一次，之后不再引用。

## 0 初始动机与猜想

我最开始的目标只有一个：把 $M=o(d^{2})$ 位内存的噪声无关线性回归样本下界 $T\ge c\,d\log(1/\epsilon)$ 做成可机器检验的东西。那时我以为这是一条引理的三次复读：先证一个投影密度的 $L^{q}$ 矩界，然后按块反向迭代 $\lceil T/k\rceil$ 次，最后把成功概率压成 $\epsilon^{q}$ 量级。我猜三条路线（积分投影矩、正帽支配、固定仿射偏移密度）只是同一个不等式的三种排版差异，常数与停止代价会自然一致。

`main.tex` 第 16 行的这句话一开始被我当作免责声明读过去：

```
The three proofs keep their different stopping and accuracy costs explicit.
```

到第二轮我才承认它是我这篇笔记真正要反推的对象。摘要里三个论断并列（`main.tex` 第 12-15 行 `these estimates give three proofs that uniform-sphere average` / `success at least \(2/3\) at angular accuracy \(0<\epsilon\le1/10\) requires`），而 `introduction.tex` 第 9 行写的是 `We consider three questions.`，三个问句的度量对象根本不同：第一个问 $\int g_P^{q}$ 在整个标记空间上的积分；第二个问一个真实存在的正测度支配；第三个问在指定标号 $Xz+b$ 处的密度值。我最初的猜想把它们合并成"密度矩"一项，合并这一步就是后面所有麻烦的来源。

我还带来一个先入假设：既然要的是下界，那么把矩的阶 $q$ 取得越大越好，因为终端因子形如 $\epsilon^{q}$。这个假设在参数表里立刻被推翻，见第 7 节、第 8 节和第 13 节；论文三处取的 $q$ 各不相同，$k=q=\lfloor d/4\rfloor$（`projection.tex:257`）、$k=p=\lfloor d/16\rfloor$（`projection.tex:292`、`positive-caps.tex:22`）、$k=q=\lfloor d/8\rfloor$（`riesz.tex:14`），而且每个选择都由两条余量同时夹住。

猜想列表我当时写了四条，按后面的结果打分：

1. "一套参数走天下"：失败，$q$ 与 $k$ 必须随路线切换。
2. "停止指标可以当免费信息用"：失败，三条路线对 $\lceil T/k\rceil$ 与 $(T+1)2^{M}$ 的收费方式不同。
3. "$L^{q}$ 积分界足够支撑点态使用"：失败，这是第三个问句存在的理由。
4. "内存 $M$ 最终会被 $o(d^{2})$ 吸收，于是可以在证明里早早丢掉"：部分成立，`projection.tex:531` 的 `dL\le C_1(T+d)\left(1+\frac M{d^2}\right)` 保留了完整依赖，而 `positive-caps.tex` 的路线只能在渐近式里吸收它。

## 1 读法约定：把 tex 当唯一正文，把 Lean 当核对表

我给自己定的规则是：任何断言先落到 `build/sections/*.tex` 的具体行；只有当我需要确认"这个量在形式化里到底有没有被这样用"时，才去 `OAI/Probability/ProjectionMoments/` 对一下声明名。理由是语料的 PDF 加密不可读，而 typst 分片是渲染产物；唯一可靠的正文是 tex。

登记 json 整读只有 14 行，能确认的信息量很有限但关键：`"solution_module": "OAI.Probability.ProjectionMoments.Main"`（`ProjectionMoments.json:3`）、`"theorem_names": [ "OAI.ProjectionMoments.main" ]`（第 4-6 行）、`"permitted_axioms"` 三件 `propext`、`Quot.sound`、`Classical.choice`（第 8-12 行）、`"enable_nanoda": false`（第 13 行）。`definition_names` 是空表（第 7 行），意味着对外只暴露一个定理名，所有中间量都被塞进一个合取式。

`Main.lean` 只有 35 行，而且 `Main.lean` 在目录里确实不是最大文件。它第 1 行 `import OAI.Probability.ProjectionMoments.SphereWeights`，第 14 行 `theorem main : MainStatement.{u} := by`，第 15-24 行用一个 `refine` 把 15 个分量喂给 `MainStatement`，只留一个 `_` 目标给 `K.exists_equivalent_tape hK hd`（第 26 行）。这个形状告诉我：比较器要的是 15 个独立断言的合取，"证明了下界"这句话不对应其中任何一格，分工是 5 个解析引理、6 个代价刻画、2 个渐近式、2 个模型桥接与归约。

于是我把 import 链摊平再决定深入点。链是单线的（每个文件只有一个 `import OAI.Probability.ProjectionMoments.*`）：

```
Model ← Graph ← GaussianDensity ← Frames ← SphereDensity ← FrameMoments
      ← RieszPotential ← Polar ← BallMoments ← Caps ← CapTests ← CapDuality
      ← WeightedCover ← CapDomination ← AllRadii ← Stopping ← BorelRules
      ← Kernels ← Realization ← StoppingKernel ← Streaming ← Seeded
      ← Asymptotics ← SphereWeights ← Main
```

两个入口例外：`Graph.lean:1-2` 同时 `import OAI.Probability.GaussianRegression.Main` 与 `...ProjectionMoments.Model`；`Model.lean:1` 只 `import Mathlib`，它是这条链的叶子，也是 `MainStatement` 的家（`Model.lean:732-739`）。`Main.lean` 不在最大文件之列而 `Graph.lean` 31,011 B、`Model.lean` 30,341 B、`StoppingKernel.lean` 22,259 B、`Streaming.lean` 20,913 B、`Frames.lean` 20,576 B、`BallMoments.lean` 19,279 B 才在，所以我选 `Graph.lean` 与 `StoppingKernel.lean` 深入，对应本笔记标题里的"图模型"与"停止核"。

## 2 图模型：$q$ 点元组先做仿射独立，再做行列式

反推起点是 `projection.tex` 第 128-136 行那段自述，它把"展开 $q$ 次矩"说成一个图：

```
For the integrated estimate, expand the \(q\)th density moment using
\(q\) points of the measure. The collision of their labels is controlled
by the projection of the \(q-1\) differences from the first point.
```

我在纸上做的第一件事是把这个说法写成显式积分。设 $g_{\delta}$ 是标记球的平均密度（`projection.tex:194`），$q$ 次矩按 Tonelli 展开成 $\nu^{\otimes q}$ 上的积分，被积函数是"$q$ 个标号球同时命中"的概率。第一个约束是交集体积：$q$ 个半径 $\delta$ 的 $k$ 球交集至多 $v_k\delta^{k}$，除非对 $i\ge2$ 有 $\lVert P(x_i-x_1)\rVert\le2\delta$（`projection.tex:201`）。这一步把 $q$ 个点塌成 $q-1$ 个差向量，是我在图模型里第一次遇到"锚点选择"的问题：锚在 $x_1$ 上是免费的，因为它只是第一个抽样点。

`projection.tex:117-121` 把行列式与体积挂上钩：

```
The product of the affine heights in \eqref{p:frame-difference-density}
is \(m!\) times the \(m\)-dimensional volume of the simplex spanned by
the points.
```

于是图上的每条边带一个高度 $\delta_i=\dist(x_i,\aff(x_1,\ldots,x_{i-1}))$，整个元组的权重是 $\prod_{i=2}^{q}\delta_i^{-k}$。我原来的直觉是把 $\delta_i$ 用最小距离统一放掉，这样只要一个 tube 估计；读完 `p:affine-inverse` 才意识到必须逐点积分、按 $x_q,x_{q-1},\ldots,x_2$ 逆序做，因为每一层的仿射平面维度不同，而余量 $\beta-j-k\ge1$ 是按维度 $j$ 检查的。

这里有一个我一开始忽略的可行性问题：$\delta_i$ 可能为 $0$。`projection.tex:204-209` 的处理是先用 `p:affine-inverse` 证明遇到的每个仿射平面 $\nu$-质量为零（维度至多 $q-2$，正好落在余量条件里），从而"元组在 $\nu^{\otimes q}$-几乎处处意义下仿射独立"，退化元组集合再在 Tonelli 的非负积分里被赋上界 $+\infty$（`projection.tex:224-225`）。Lean 侧对应的形状我在 `Graph.lean` 里找到了：`gaussian_graph_kernel_bound` 的假设里有 `LinearIndependent ℝ v`（`Graph.lean:40`），结论把界写成 `((∏ i, ‖gramSchmidt ℝ v i‖)⁻¹ ^ m)`（`Graph.lean:45`），也就是 Gram-Schmidt 高度的乘积取负 $m$ 次幂；$m$ 次方来自 $k$ 行的每一行贡献一次 Jacobian。这与我读到的 `projection.tex:111-113` 完全对上：`Right multiplication by \(R\) on \(k\)-by-\(m\) matrices has Jacobian \(\abs{\det R}^k\), one factor for each row.`。

图模型在 Riesz 侧被换了锚点。`riesz.tex:128-131`（`introduction.tex:161-163` 里也有同调表述）：

```
The specified-label argument uses \(q\) vectors anchored at \(z\),
rather than \(q-1\) differences anchored at a sampled point.
```

我第一次读到这里以为只是记号方便；实际差别是奇偶性的：以 $z$ 为锚时，$q$ 个向量 $t_j-z$ 的像在每个 Gaussian 行下是协方差为 anchored Gram 矩阵 $G$ 的中心化 Gaussian 向量（`riesz.tex:177-180`），行列式取负幂的次数是 $q$，而差向量版本只有 $q-1$ 次。`riesz.tex:196-202` 的 `(det G)^{-k/2} =\prod_{j=1}^q \operatorname{dist}( t_j,z+\operatorname{span}(t_1-z,\ldots,t_{j-1}-z) )^{-k}` 把这件事写成等式。锚在采样点上，第一层就没有距离可积；锚在 $z$ 上，第一层也要被 `p:riesz-distance` 吃掉。这个"多出一层"直接解释了为什么 Riesz 路线的 $q$ 只能取 $\lfloor d/8\rfloor$（第 12 节和第 13 节）。

## 3 引理 `p:coordinate-density`：先有的密度公式，后有的方向律

(a) 引用。`geometry-model.tex:26`：

```
 c(D,k)(1-\norm u^2)^{(D-k-2)/2}\1_{\{\norm u<1\}},
```

`geometry-model.tex:28-29`：

```
 c(D,k)=\frac{\Gamma(D/2)}
 {\pi^{k/2}\Gamma((D-k)/2)}.
```

`geometry-model.tex:34`：`law given \(PU\) is uniform.`，即 $\ker P$ 中分量方向在给定 $PU$ 时仍均匀。

(b) 中间步骤。我补的第一件事是"为什么指数写成 $(D-k-2)/2$，那个看上去等价的 $(D-k)/2-1$ 里的 $-1$ 该从哪一步领出来"。证明里（`geometry-model.tex:41-49`）用的是两个独立 gamma：$\lVert G\rVert^{2}/2$ 形状 $k/2$、$\lVert H\rVert^{2}/2$ 形状 $(D-k)/2$，两者之和与占比做变量替换给出 beta 密度 $t^{k/2-1}(1-t)^{(D-k)/2-1}$。之后在 $\R^{k}$ 上做极坐标：$u$ 的球向部分吸收 $\vol(S^{k-1})=2\pi^{k/2}/\Gamma(k/2)$，径向部分把 $t=\lVert u\rVert^{2}$ 换成 $\lVert u\rVert$ 时又产生一个 $\lVert u\rVert^{k-1}$ 与 $2\lVert u\rVert$ 的组合。把这些与 $\Gamma(D/2)/(\Gamma(k/2)\Gamma((D-k)/2))$ 归一化系数乘起来，$\Gamma(k/2)$ 恰好被 $\vol(S^{k-1})$ 里的分母吃掉，剩下的就是 (a) 的显示式。也就是说 $-2$ 来自"极坐标降掉一个球面维度"，它是体积元贡献的残迹。

我补的第二件事是 $\ker P$ 方向的独立性用在哪里。`positive-caps.tex:153-156` 说：对每个正交 $k$-frame $P$，此引理给出 $P_{\#}\sigma\ll dz$；又因 $h\mu_{c,r}\ll\sigma$，其投影也绝对连续，仿射伸缩 $P((s-c)/r)=(Ps-Pc)/r$ 保持这个结论。整个正帽路线的绝对连续假设只靠这句话过关；一旦我只需要"$PU$ 的密度"而不需要"$U$ 在补空间里的方向均匀"，就会在条件化到标记值时失去方向均匀性。方向律是给"给定 $PU$ 后仍均匀"用的，也就是给仿射独立性与几乎处处论证用的。

(c) 假设、常数、指数的机械理由。$D\ge2$ 与 $1\le k<D$（`geometry-model.tex:22`）：$k<D$ 保证 $(D-k)/2>0$，否则 gamma 分母发散；$D\ge2$ 保证 $S^{D-1}$ 非退化且 $\ker P$ 非零。指示集 $\{\lVert u\rVert<1\}$ 是因为 $PU$ 是单位向量在 $k$ 维子空间的投影。$c(D,k)$ 里的 $\pi^{k/2}$ 只在 $k$ 维极坐标归一化中出现，与 $D$ 无关；这决定了后面每次出现 $(C\sqrt d)^{k}$ 时的 $k$ 次方来源。全篇用它三处：`projection.tex:76-82` 的逐列条件密度 $c(d-j,k)(\det S_j)^{-1/2}(1-z^{\mathsf T}S_j^{-1}z)^{(d-j-k-2)/2}$、`geometry-model.tex:259-265` 说明每个 $(X_t,\inner{X_t}{S})$ 对 $\lambda=\gamma_d\,dy$ 绝对连续（这是 Borel 化引理的可行性前提）、`riesz.tex:225-227` 说明 $P_{\#}\sigma$ 绝对连续。$H=0$ 事件是零测（`geometry-model.tex:56`），我特意检查它，因为如果补空间维度 $D-k=1$，方向 $\pm1$ 仍均匀，只是零事件写法略变；论文用 $k+m+1\le d$ 之类余量把这情形推开。

(d) 失败路线（我自己的尝试，标 `[推测]`）：

1. `[推测]` 用现成的 beta 分布表直接抄密度、跳过极坐标推导。风险在归一化：后续每一步都要 $c(d-j,k)\le(C\sqrt d)^{k}$（`projection.tex:105-106`），而这个界来自 $k/2$ 次 gamma 矩的 Cauchy-Schwarz 估计；抄表会丢掉可追溯的 $\pi^{-k/2}$，$C$ 的定义就会在 Lean 里无处落地。
2. `[推测]` 把方向均匀性当成"给定 $\lVert PU\rVert$ 时均匀"来用。真实陈述是给定整个 $PU$（含方向）后补空间方向仍均匀，差别在条件化的信息量；弱化版会让仿射独立论证需要额外的正则选择。
3. `[推测]` 在 $k=D$ 边界上贪心取满。此时 $\Gamma((D-k)/2)$ 是 $\Gamma(0)$，公式直接不存在；$q$ 与 $k$ 的余量条件（如 $k+m+1\le d$）本质就是这个引理的定义域约束。

## 4 两条尺度引理：$v_k$ 的上界与帽质量的双边

反推过程中我发现，全文最廉价的两条引理其实是常数能收敛成 $C^{d}$ 的唯一原因。它们都住在 `geometry-model.tex` 的前 130 行里，却分别在四处被消费。

### 4.1 引理 `p:unit-ball-volume`

(a) 引用。`geometry-model.tex:70`：

```
 v_k\le(2\pi e/k)^{k/2}.
```

证明在 `geometry-model.tex:79-81`：

```
 e^{-k/2}k^{k/2}v_k
 \le\int_{\R^k}e^{-\norm z^2/2}\,dz=(2\pi)^{k/2},
```

(b) 中间步骤。我把它的三次消费补齐。`projection.tex:333-337` 的推理是

```
Use the unit-ball volume estimate \eqref{p:unit-ball-volume}.
Since \(k\ge d/32\) for sufficiently large \(d\),
\[
 v_k^{1-1/p}(C\sqrt d)^{k(1-1/p)}\le C^d.
```

这里缺的一步是把两个因子合成一个：$v_k^{1-1/p}(\sqrt d)^{k(1-1/p)}\le\bigl((2\pi e/k)^{1/2}\sqrt d\bigr)^{k(1-1/p)}=\bigl(\sqrt{2\pi e\,d/k}\bigr)^{k(1-1/p)}$。$k\ge d/32$ 使 $d/k\le32$，于是底数被绝对常数钉住，指数 $k(1-1/p)\le k\le d$，整体就是 $C^{d}$。$p\ge2$ 保证 $1-1/p>0$，不等号方向才不反。同一条合成在 `projection.tex:426-429` 以 $C_0^{d}$ 出现（那里 $k\ge d/8$），在 `riesz.tex:444-446` 以第三种形态出现：

```
Indeed, the unit-ball volume estimate \eqref{p:unit-ball-volume} gives
$v_k\le(2\pi e/k)^{k/2}$. Since \(d/k\le16\),
\(v_k(D_0j\sqrt d\,\rho)^k\le C^d j^k\rho^k\).
```

这第三次消费把 $d/k\le16$（来自 $k=\lfloor d/8\rfloor$）与 $(D_0\sqrt d)^{k}\le(C'\sqrt{d/k})^{k}\le C^{d}$ 合成，得到半径 $k$ 次方与 $j^{k}$ 的显式分离，供后面的分箱求和使用。

(c) 机械理由。为什么证法是"在半径 $\sqrt k$ 的球上比 Gaussian 积分"：$e^{-\lVert z\rVert^{2}/2}$ 在该球上至多点处取值 $e^{-k/2}$，给出下界 $e^{-k/2}k^{k/2}v_k$；全空间积分是 $(2\pi)^{k/2}$，与 $k$ 无关地干净。选 $\sqrt k$ 是把 Gaussian 质量集中半径当尺子，一步就把 Stirling 型信息压成 $(2\pi e/k)^{k/2}$；若改用 Stirling 展开会多出一串 $1+O(1/k)$ 项，而三处消费都要的是"一个绝对底数的 $C^{d}$"。约束 $k\ge1$（`geometry-model.tex:68`）让 $k^{k/2}$ 有意义，且 $v_1=2\le(2\pi e)^{1/2}\approx4.13$ 也不破。

(d) 失败路线。

1. `[推测]` 用精确公式 $v_k=\pi^{k/2}/\Gamma(k/2+1)$ 直接代入。可行，但 $C^{d}$ 的底会依赖 $k\bmod 2$；三处消费合不成同一形如 $\exp(Cd)$ 的量，`Model.lean` 里那类"存在 $C\ge1$ 使……"的陈述就得改写。
2. `[推测]` 把 $v_k^{1-1/p}$ 与 $(\sqrt d)^{k(1-1/p)}$ 分别界成 $\le1$ 与 $\le d^{k/2}$。丢掉体积因子的收益，剩下 $d^{k/2}$，而 $k\asymp d$ 时 $d^{d/2}$ 无法被 $C^{d}$ 吸收，矩界多出 $\exp(\tfrac12 d\log d)$，直接顶掉 $T\ge c\,d\log(1/\epsilon)$ 的主项。
3. `[推测]` 只证下界不证上界。$v_k$ 在 $k$ 大时趋于 $0$；若只有 $v_k\le1$，`projection.tex:421-424` 的 Hölder 前置因子 $(v_kR^{k})^{1-1/q}$ 退化成 $R^{k(1-1/q)}$，与 $g_w$ 的 $R^{\beta-k(1-1/q)}$ 相乘仍给 $R^{\beta}$，看似无损；但半径之外还要 $(C\sqrt d)^{k(1-1/q)}$，$C_0^{d}$ 就没了来源。

### 4.2 引理 `p:cap-mass`

(a) 引用。`geometry-model.tex:89`：

```
 (ar)^n\le \sigma\bigl(B(c,r)\bigr)\le\min\{1,r^n\}.
```

`geometry-model.tex:93`：

```
 \sigma\bigl(B(z,r)\bigr)\le\min\{1,(2r)^n\}.
```

`geometry-model.tex:95-97`：`An output direction independent of the signal has probability at most \(\epsilon^n\) of angular error at most \(\epsilon\), averaged over \(\sigma\).`

(b) 中间步骤。上界靠"球面作为 $c^{\perp}$ 上图的面积元至多两倍 Lebesgue 测度"与"投影落在半径 $r$ 的 $n$ 球内"（$r\le1$），$r>1$ 由总质量 $1$ 接上；下界在 `geometry-model.tex:109-116` 走极角：角半径 $2\arcsin(r/2)\ge r$，帽质量写成 $\sin^{n-1}\theta$ 的积分比值，用 $\sin\theta\ge2\theta/\pi$ 与分母 $\le\pi$，再用 $n\le2^{n-1}$ 得 $(r/\pi)^{n}$，最后 `geometry-model.tex:115-116` 把它统一成 $a=1/(2\pi)$：

```
For \(1\le r\le2\), monotonicity therefore gives the
lower bound with \(a=1/(2\pi)\).
```

我把两处消费对齐着看。`positive-caps.tex:36-39` 复述成 $(ar)^{n}\le\sigma(B(c,r))\le(A_0r)^{n}$ 并写明 `a=(2\pi)^{-1},\ A_0=1`；于是比值 $(A_0/a)^{n}=(2\pi)^{n}\le\exp(Cd)$，这个 $\exp(Cd)$ 就是 `positive-caps.tex:143`、`positive-caps.tex:338`、`positive-caps.tex:353` 三处 $\exp(Cd)$ 的真身。另一处在 `projection.tex:467-472`：终端函数 $h$ 满足 $\int_{B(z,R)}h\,d\sigma\le C^{d}\min\{R^{n},\epsilon^{n}\}\le C^{d}\epsilon^{q}R^{\beta}$，其中 $\beta=n-q$；$R\le\epsilon$ 时用 $\epsilon^{n}\le\epsilon^{q}R^{\beta}$，$R\ge\epsilon$ 时用 $R^{n}\le R^{\beta}$ 再靠 $\min\{1,\cdot\}$（`geometry-model.tex:107`）兜住 $R$ 大的情形。

(c) 机械理由。$n=d-1$（`geometry-model.tex:86`）是球面维度，帽质量的自然幂次；$0<r\le2$ 是弦距的直径上限；$0<\epsilon\le1/10$ 保证弦距与角距换算 $2\sin(\theta/2)\le\theta$ 之后的 $\epsilon$-帽估计够用（`geometry-model.tex:121-123`），也保证后面 $\log(1/\epsilon)\ge\log10$（`riesz.tex:535`）。$a$ 只在下界出现、$A_0$ 只在比值出现，说明论文只消费 $(A_0/a)^{n}$；这解释了 `positive-caps.tex:38` 为什么把两个值同时写出来。

(d) 失败路线。

1. `[推测]` 用高斯集中不等式直接给 $\sigma(B(c,r))$ 的指数形式。它给的是 $1-\exp(-cr^{2}n)$ 型，小 $r$ 时退化成 $cr^{2}n$ ，并非 $r^{n}$；帽支配路线要的是精确幂律 $(\rho/r)^{n-\alpha}$（`positive-caps.tex:142-143`），指数 $n-\alpha$ 会被污染。
2. `[推测]` 把 $a$ 与 $A_0$ 都吸进同一个 $C^{d}$。可行，但字典权重 $b_i=(r/\rho_i)^{\alpha}$ 与每层 $2^{\alpha j}$（`positive-caps.tex:110`、`positive-caps.tex:113`）要靠 $a,A_0$ 显式核对 $b_{*}=1$，隐式吸收会让紧性论证里的尾部估计失去可核对的形状。
3. `[推测]` 对随机化输出直接用"独立方向的错误概率至多 $\epsilon^{n}$"当作逐信号下界。`geometry-model.tex:123-124` 只给了均匀先验平均版本，而 `geometry-model.tex:192-193` 明说 `All three proofs use the average guarantee itself.`。

## 5 引理 `p:affine-inverse`：tube 覆盖决定余量 $\beta-j-k\ge1$

(a) 引用。假设与结论分别在 `projection.tex:134-141`：

```
 \nu(B(b,t))\le Kt^\beta
```

```
If \(F\) is an affine \(j\)-plane, \(k\ge1\) is an integer, and
\(\beta-j-k\ge1\), then \(\nu(F)=0\) and
\begin{equation}\label{p:affine-inverse-bound}
 \int\dist(x,F)^{-k}\,d\nu(x)\le C^d K R^{\beta-k},
\end{equation}
```

tube 估计 `projection.tex:154`：

```
 \nu\{\dist(x,F)\le t\}\le 3^j2^\beta K R^j t^{\beta-j}.
```

(b) 中间步骤。我把三个隐藏因子拆开。第一，packing：半径 $t/2$ 的 $j$ 球互不相交且都落在 $F$ 上半径 $3R/2$ 的球内，于是极大 $t$-分离集基数 $\le(3R/t)^{j}$（`projection.tex:148-150`），$j=0$ 时一点即可。第二，覆盖：与 $F$ 距离 $\le t$ 的点其投影落在该 $t$-网内，因此被半径 $2t$ 的 ambient 球覆盖，逐球用球质量假设给 $K(2t)^{\beta}$，乘起来得 (a) 的 $3^{j}2^{\beta}KR^{j}t^{\beta-j}$。第三，分层：在 $2^{-h-1}R<\dist(x,F)\le2^{-h}R$ 上把 $\dist^{-k}$ 用 $(2^{h+1}/R)^{k}$ 放掉，得 `projection.tex:162` 的

```
 3^j2^{\beta+k}KR^{\beta-k}\,2^{-h(\beta-j-k)}.
```

我核对了这个 $h$ 求和：$\sum_{h\ge0}2^{-h(\beta-j-k)}\le2$ 当且仅当 $\beta-j-k\ge1$，这是那条余量的唯一用途；而 $\nu(F)=0$ 只需 $\beta-j>0$（连续性从上，`projection.tex:156`），比 $\beta-j-k\ge1$ 弱。同一层论证里有两个强度不同的条件，论文用最严的那个一次覆盖两者。

(c) 机械理由。$0<\beta\le d$、$K\ge0$、$R>0$（`projection.tex:132`）：$\beta\le d$ 是让 $C^{d}$ 覆盖 $\beta,j,k\le d$ 三个指标（`projection.tex:164-165`）；$K\ge0$ 允许 $K=0$，配合 `p:frame-moment` 证明开头的 `When \(K=0\), the measure is zero`（`projection.tex:191`）。条件 $j,k\le d$（`projection.tex:143`）只在"$C^{d}$ 吸收"这一步被消费。$R^{\beta-k}$ 的量纲检查：$\dist^{-k}$ 量纲 $[\text{长度}]^{-k}$、$\nu$ 总质量量纲 $[\text{长度}]^{\beta}$，结果是 $R^{\beta-k}$；$\beta<k$ 时它在 $R\to0$ 发散，与直觉一致。

消费点三处：`projection.tex:205`（仿射平面零质量，保证元组仿射独立）、`projection.tex:228-229`（逐层积分，每层给 $C^{d}KR^{\beta-k}$）、以及 `riesz.tex:73-83` 的孪生引理 `p:riesz-distance`。后者把 $KR^{\beta}$ 换成 $V(h)\rho^{\alpha}$（`riesz.tex:90` 的 `\int_{B_r(c)}h\,d\sigma\le V(h)r^\alpha`），把 $\beta$ 换成 $\alpha$、$j$ 换成 $\ell\le q-1$，tube 变成 `riesz.tex:104` 的 $3^{\ell}2^{\alpha}V(h)\rho^{\ell}r^{\alpha-\ell}$，收敛条件变成 `riesz.tex:119` 的 $\alpha-\ell-k\ge\alpha-(q-1)-k\ge2$。两条引理同构，实质差别只有锚点：$F$ 必须过 $z$（`riesz.tex:76-77`），否则 $B_{\rho}(z)$ 里的 $\rho^{\ell}$ 就不闭合。

(d) 失败路线。

1. `[推测]` 把 tube 覆盖换成到 $F$ 距离的分布函数的解析表达（柱坐标）。柱坐标只在 $F$ 过原点且 $\nu$ 与半径相容时干净；这里 $\nu$ 支撑在 $B(z,R)$、$F$ 位置任意，坐标分离失败，最后仍要回到网覆盖。
2. `[推测]` 用 $\beta-j-k>0$ 代替 $\ge1$。级数仍收敛，但界变成 $C^{d}/(\beta-j-k)$ 型，$C$ 就要显式依赖该余量。三套参数里它分别是 $d+1-3\lfloor d/4\rfloor$（`projection.tex:281`）、$\frac{d-1}{2}-2\lfloor d/16\rfloor+2\ge\frac{3d}{8}+\frac32$（`projection.tex:322-324`）、$\alpha-(q-1)-k$（`riesz.tex:119`），全靠 $O(d)$ 下界活着；写成 $\ge1$ 是让形式化里不用携带这个分数。
3. `[推测]` 在 $j=q-1$ 与 $k$ 同时取大时跳过零质量论证，直接把退化元组集合算零测。$\nu(F)=0$ 正是退化集零测的来源；跳过它，`projection.tex:233` 的 $C^{d(q-1)}K^{q}R^{q\beta-k(q-1)}$ 就缺 $q-1$ 层求和的可测性依据，`projection.tex:224-225` 那句"退化元组是零测、可赋上界 $+\infty$"也失去根据。

## 6 定理 `p:frame-density`：望远镜消去所有中间行列式

(a) 引用。精确密度 `projection.tex:42-46`：

```
 \left(\prod_{j=0}^{m-1}
 \frac{\Gamma((d-j)/2)}
 {\pi^{k/2}\Gamma((d-j-k)/2)}\right)
 \det(I_k-ZZ^{\mathsf T})^{(d-k-m-1)/2}
 \1_{\{I_k-ZZ^{\mathsf T}>0\}}.
```

差向量版本 `projection.tex:59`：

```
 (C\sqrt d)^{km}\prod_{i=2}^{m+1}\delta_i^{-k}.
```

(b) 中间步骤。逐列条件密度在 `projection.tex:80-82`：

```
 c(d-j,k)(\det S_j)^{-1/2}
 (1-z^{\mathsf T}S_j^{-1}z)^{(d-j-k-2)/2}
```

其中 $S_j=I_k-Z_jZ_j^{\mathsf T}$、$S_0=I_k$。我自己重算一遍乘积：$m$ 个条件密度相乘，归一化常数给出 (a) 的 $\prod_{j=0}^{m-1}$；$\det S_j$ 的 $-1/2$ 次幂逐层出现，括号项 $(1-z^{\mathsf T}S_j^{-1}z)$ 的指数是 $(d-j-k-2)/2$。关键恒等式是 `projection.tex:88`：

```
 \det S_{j+1}=\det S_j(1-z^{\mathsf T}S_j^{-1}z)
```

据此每层的括号项换成 $\det S_{j+1}/\det S_j$，分子分母逐层相消：第 $j$ 层从 $-1/2$ 得到 $\det S_j$ 的贡献、从自己的括号项得到 $\det S_{j+1}$ 的贡献，中间所有 $\det S_{1},\ldots,\det S_{m-1}$ 的净指数为 $0$，只剩 $\det S_m$ 上的 $(d-k-m-2)/2-1/2$，即 (a) 显示的 $(d-k-m-1)/2$。`projection.tex:93` 补上合法性：`Its exponent is nonnegative and \(0<\det S_m\le1\).`，靠 $k+m+1\le d$。

归一化常数的尺度我按 `projection.tex:97-103` 重做：对形状 $a=(d-j-k)/2>0$ 的单位尺度 gamma 变量 $G$，$\Gamma((d-j)/2)/\Gamma((d-j-k)/2)=\E G^{k/2}\le(\E G^{k})^{1/2}=\bigl(\prod_{i=0}^{k-1}(a+i)\bigr)^{1/2}\le d^{k/2}$。Cauchy-Schwarz 把半次矩换成整次矩，整次矩用 gamma 递推展开成 $k$ 个因子，每个 $\le d$。

(c) 机械理由。$k+m+1\le d$（`projection.tex:39`）有三重作用：使 $a=(d-j-k)/2>0$ 对 $j\le m-1$ 成立、使指数 $(d-k-m-1)/2\ge0$、使事件 $\{I_k-ZZ^{\mathsf T}>0\}$ 非空。$(C\sqrt d)^{km}$ 里 $km$ 是 $PE$ 的自由度：$km$ 个 $c(d-j,k)$ 各贡献 $(C\sqrt d)^{k}$（`projection.tex:105-106`）。差向量版本的 $\prod\delta_i^{-k}$ 来自右乘上三角 $R$ 的 Jacobian $\abs{\det R}^{k}$ 与 $\abs{\det R}=\prod_{i=2}^{m+1}\delta_i$（`projection.tex:110-112`）。

(d) 失败路线。

1. `[推测]` 直接引用 Jiang 的经典公式（`projection.tex:32-35` 已指出来源）而不重导。省几十行，代价是 $c(d-j,k)$ 的显式形式消失；`projection.tex:34-35` 那句 `We include its derivation to retain the dimensional normalization.` 就是我后来承认自己走错的捷径。
2. `[推测]` 用 $d\times d$ Haar 正交矩阵块的教科书联合密度。我们的对象只是 $k\times m$ 块，$k$ 行共享同一个 $S_j$；套全块公式要额外边缘化，边缘化后的常数与 (a) 等价但读不出 $(C\sqrt d)^{km}$。
3. `[推测]` 跳过正定性检查，把 $(\det S_j)^{-1/2}$ 当可积奇点处理。$S_j$ 退化时该因子是 $\infty$；`projection.tex:85` 用的是严格不等式 $z^{\mathsf T}S_j^{-1}z<1$ 蕴含 $S_{j+1}>0$ 几乎必然，丢掉这条，telescoping 在零测集上不可写。

## 7 定理 `p:frame-moment`：矩的阶与余量互相牵着走

(a) 引用。参数条件 `projection.tex:172-175`：

```
\begin{equation}\label{p:frame-margins}
 k+q\le d,\qquad 0<\beta\le d,\qquad
 \beta-k-(q-2)\ge1.
\end{equation}
```

结论 `projection.tex:182-186`：

```
 \left(\int_{\mathcal V_{d,k}}\int_{\R^k}g(P,u)^q\,du\,
 d\vartheta_{d,k}(P)\right)^{1/q}
 \le C^d(C\sqrt d)^{k(1-1/q)}
 K R^{\beta-k(1-1/q)}.
```

支撑性质 `projection.tex:187`：`For every \(P\), this version vanishes when \(\norm{u-Pz}>R\).`

(b) 中间步骤。证明的骨架我按六步复现。第一步把不存在的密度换成平均量：`projection.tex:194` 定义

```
 g_\delta(P,u)=\frac{\nu\{x:\norm{Px-u}\le\delta\}}{v_k\delta^k}.
```

这一步我一开始觉得多余，后来明白它同时解决三件事：$g_\delta$ 天然联合可测、$L^{q}$ 积分有限（被 $\nu^{q}$ 的紧支撑控制）、以及它是密度在 Lebesgue 微分意义下的逼近。第二步按 Tonelli 展开 $g_\delta^{q}$，用 $q$ 个点 $x_1,\ldots,x_q$；交集体积给出 `projection.tex:200-201` 的两个事实：交集体积至多 $v_k\delta^{k}$，且除非 $\lVert P(x_i-x_1)\rVert\le2\delta$（$i\ge2$）交集为空。第三步用 `p:affine-inverse` 把退化元组集合归零，从而 `projection.tex:209` 能对几乎每个元组套 `p:frame-density`（$m=q-1$），并说 `the condition \(k+q\le d\) is exactly its determinant condition`。第四步把 $q-1$ 个不等式的概率界写成 `projection.tex:213-215`：

```
 (C\sqrt d)^{k(q-1)}
 \prod_{i=2}^q\delta_i^{-k}
 \bigl[v_k(2\delta)^k\bigr]^{q-1}.
```

第五步体积相消：分子里的 $[v_k(2\delta)^{k}]^{q-1}$ 与 $g_\delta$ 定义里的 $(v_k\delta^{k})^{q}$ 约掉 $q-1$ 个，剩下一个 $v_k\delta^{k}$ 正好是 $u$ 积分的体积；$2^{k(q-1)}$ 被吸进 $C$，得 `projection.tex:220-223` 的

```
 \int\!\!\int g_\delta^q\,du\,d\vartheta_{d,k}
 \le (C\sqrt d)^{k(q-1)}
 \int\prod_{i=2}^q\delta_i^{-k}\,d\nu^{\otimes q}.
```

第六步逆序积分：先 $x_q$ 再 $x_{q-1}$ 直到 $x_2$，每层 $C^{d}KR^{\beta-k}$，第一点质量 $\le KR^{\beta}$，合起来 `projection.tex:233` 的 $C^{d(q-1)}K^{q}R^{q\beta-k(q-1)}$。对 $\delta$ 一致，取 $\liminf$ 后用 Fatou（`projection.tex:238-243`）。我核对指数的合成：$(q\beta-k(q-1))^{1/q}=\beta-k(1-1/q)$，与 (a) 右端一致；$(C\sqrt d)^{k(q-1)/q}=(C\sqrt d)^{k(1-1/q)}$ 同理。$C^{d(q-1)\cdot1/q}=C^{d}$ 的写法是把 $q-1\le q$ 折进一个 $d$ 的幂。

(c) 机械理由。$\beta-k-(q-2)\ge1$ 的来历是第 $i$ 层积分里 $F=\aff(x_1,\ldots,x_{i-1})$ 的维度 $j\le q-2$，最坏情形 $j=q-2$；$k+q\le d$ 是 $k+m+1\le d$ 在 $m=q-1$ 时的写法。$q\ge2$ 保证至少一层距离；$k\ge1$ 保证投影非平凡。假设 $P_{\#}\nu\ll du$ 对 $\vartheta_{d,k}$-几乎每个 $P$ 成立（`projection.tex:178-179`）只在最后取 $\liminf$ 时被消费，前面所有估计都不用绝对连续性；这正是"$g_\delta$ 先行"策略的价值：它让解析部分与极限部分解耦。

(d) 失败路线。

1. `[推测]` 先验地证明密度存在再估它的范数。绝对连续性对几乎每个 $P$ 成立是假设，若想在 $K$ 型增长条件下直接推出它，需要额外的维度论证（$k<\beta$ 一类），而论文要处理的是 $\beta$ 可以小于 $k$ 的参数区。$g_\delta$ 路线绕开了这个方向。
2. `[推测]` 用 $q$ 个点的两两距离对称化，把 $\prod_{i}\delta_i^{-k}$ 换成 Vandermonde 型的 $\prod_{i<j}\lVert x_i-x_j\rVert^{-k/(q-1)}$。Gram-Schmidt 的三角结构就没了，逆序积分失效，每一层都要面对其他所有点构成的并集，$C^{d(q-1)}$ 会变成关于 $\binom{q}{2}$ 的更差幂。
3. `[推测]` 令 $\delta\to0$ 时直接逐 $P$ 用微分定理。密度在 $(P,u)$ 乘积的可测版本无法由逐点微分自动得到；`projection.tex:238` 显式取 $\liminf_{j\to\infty}g_{1/j}$，再靠 `projection.tex:240` 引用的 Tao 微分定理逐 $P$ 认同，可测性是显式构造出来的。

## 8 两套参数：`p:frame-n30` 与 `p:frame-positive` 的分叉

(a) 引用。第一套 `projection.tex:256-258`：

```
 n=d-1,\qquad k=q=\lfloor d/4\rfloor,\qquad \beta=n-q.
```

它的界 `projection.tex:268-271`：

```
 \norm g_{L^q(\vartheta_{d,k}\,du)}
 \le C^d(C\sqrt d)^{k(1-1/q)}
 K R^{\beta-k(1-1/q)}.
```

第二套 `projection.tex:291-292` 与增长假设 `projection.tex:304-305`：

```
 k=p=\lfloor d/16\rfloor,\qquad \lambda=(d-1)/2.
```

```
 \nu(B(b,t))\le D^d t^\lambda
```

归一化结论 `projection.tex:312`：

```
 \E_X\int g_X(z)^p\,dm_k(z)\le \exp(C_Ddp).
```

(b) 中间步骤。第一套的余量我按 `projection.tex:280-282` 逐项验算：

```
 k+q=2\lfloor d/4\rfloor\le d,\qquad
 \beta-k-(q-2)=d+1-3\lfloor d/4\rfloor\ge d/4+1.
```

把 $\beta=n-q=d-1-q$、$k=q$ 代入 $\beta-k-(q-2)=d-1-2q-q+2=d+1-3q$，$q=\lfloor d/4\rfloor$ 给 $3q\le 3d/4$，故 $\ge d/4+1$。行列式指数 `projection.tex:285` 也顺手记下来：$(d-k-q)/2=(d-2\lfloor d/4\rfloor)/2\ge0$。绝对连续性用 `p:coordinate-density`：对每个 frame $P$ 有 $P_{\#}\sigma\ll du$，限制在 $E=B(z,R)$ 上乘 $f$ 后仍成立。

第二套的关键是参考测度换人。这里密度 $g_X$ 相对 $dm_k=dz/v_k$ 定义（`projection.tex:309-310`），于是 $\E_X\int g_X^{p}\,dm_k=v_k^{-1}\int\int\ell^{p}\,dz\,d\vartheta$ 与 $\norm\ell_{L^{p}}^{p}$ 差一个 $v_k$；`projection.tex:330-332` 写的是

```
 \left(\E_X\int g_X^p\,dm_k\right)^{1/p}
 =v_k^{1-1/p}\norm\ell_{L^p(\vartheta_{d,k}\,dz)}.
```

我独立推导确认：$g_X=v_k\ell$ 时 $\int g_X^{p}\,dm_k=v_k^{-1}\int(v_k\ell)^{p}dz=v_k^{p-1}\norm\ell_{L^{p}}^{p}$，取 $1/p$ 次即上式。$X$ 的右旋转不变性把 $P=H^{-1}X$ 的法变成 $\vartheta_{d,k}$（`projection.tex:317-318`），$H$ 的依赖在此完全消失。余量 `projection.tex:321-324`：

```
 k+p=2\lfloor d/16\rfloor\le d,\qquad
 \lambda-k-(p-2)
 =\frac{d-1}{2}-2\lfloor d/16\rfloor+2
 \ge\frac{3d}{8}+\frac32.
```

最后一步我用 $2\lfloor d/16\rfloor\le d/8$，$\frac{d-1}{2}-\frac{d}{8}+2=\frac{3d}{8}+\frac32$，成立。取 $K=D^{d}$、$R=1$、$q=p$、$\beta=\lambda$ 后 `projection.tex:339` 给出 $\exp(C_Dd)$ 的 $p$ 次范数界，即 (a) 的 $\exp(C_Ddp)$。

(c) 机械理由。$\lambda=(d-1)/2$ 是被 $p=\lfloor d/16\rfloor$ 逼出来的：余量要求 $\lambda\ge k+p-2+1=2p-1\approx d/8$，而帽支配需要 $\alpha=\lambda$ 同时满足 $\alpha<n=d-1$ 与 $n-\alpha>0$（`positive-caps.tex:142`），$(d-1)/2$ 是这两端最对称的取法。增长常数取 $D^{d}$（比 $D$ 多出一层 $d$ 次幂）的理由在 `positive-caps.tex:124`：那里 $D\ge1$ 是绝对常数，写成 $D^{d}$ 让 `Model.lean` 的 `NormalizedUnitBallMoment` 能只用一个指数型常数。$\exp(C_Ddp)$ 中 $dp\asymp d^{2}/16$ 是正帽路线代价 $[\exp(Cd)2^{M/p}]^{b}$ 能成立的前提，见第 11 节。

(d) 失败路线。

1. `[推测]` 把两套参数统一成 $k=q=\lfloor d/16\rfloor$。余量都够，但第一套的终端因子从 $\epsilon^{q}$ 变成 $\epsilon^{d/16}$，`projection.tex:531` 的 $dL\le C_1(T+d)(1+M/d^{2})$ 里 $qL$ 那一档变弱 4 倍而 $b=\lceil T/k\rceil$ 变 4 倍，最终 $T$ 的下界常数不变但 $C^{d}N_{*}^{1/q}$ 的 $1/q$ 变大，$M$ 前面的系数会顶到 $d^{2}$ 之外。
2. `[推测]` 在第二套里保留 $dz$ 参考测度。界会多出 $v_k^{-1/p}$ 的正幂，而 $v_k^{1-1/p}$ 与 $(\sqrt d)^{k}$ 相消这一步（`projection.tex:335-337`）就没有可用因子；这正是 `p:unit-ball-volume` 在此被消费的原因。
3. `[推测]` 令 $\nu$ 依赖 $X$。定理明写 `fixed independently of \(X\)`（`projection.tex:301-302`）；一旦 $\nu$ 由数据决定，$\vartheta_{d,k}$ 上的矩界与 $\E_X$ 不能交换，`positive-caps.tex:152-154` 那句 "the test, parent cap, and measure are fixed before the fresh matrix $X$ is drawn" 就是这条假设的用场。

## 9 反向传播：`p:haar-block`、`p:radial-factor` 与块内停止指标

(a) 引用。径向分解 `projection.tex:355-357`：

```
 X=HP,\qquad H=(XX^{\mathsf T})^{1/2},\qquad P=H^{-1}X.
```

```
The frame \(P\) has law \(\vartheta_{d,k}\) and is independent of \(H\).
```

单块传播 `projection.tex:393-395`：

```
 \int_{B(z,R)}f_{\mathrm{in}}\,d\sigma
 \le C^dN^{1/q}K R^\beta
 \qquad(z\in\R^d,\ R>0).
```

成功界 `projection.tex:454-455`：

```
 \Prob\{\text{success}\}\le
 C^d\epsilon^q\bigl[C^dN_*^{1/q}\bigr]^b.
```

(b) 中间步骤。`p:radial-factor` 的证明只用右不变性与传递性：对任意独立均匀正交 $O$，$\E[\phi(H)\psi(P)]=\E[\phi(H)\int\psi(PO)d\mu(O)]$，内层积分与 $P$ 无关（`projection.tex:371-374`），于是期望因子化。这一步我在 Lean 侧对应的 `Frames.lean`（20,576 B，链上位于 `GaussianDensity` 之后）里没有展开细读，因为 `Model.lean:665` 的 `let k := d/4` 已经说明形式化里 $H$ 是被 $\E_H$ 平均掉的，逐点控制在形式化里没有对应位置。

`p:haar-block` 的推导里最容易被跳过的一步是 `projection.tex:416-419`：在 $\lVert u-Pz\rVert\le R$ 上，相对"frame 概率 $\times$ 标记 Lebesgue $\times$ $w$ 计数"的、以 $\tau_w$ 为密度的测度总质量至多 $v_kR^{k}$。有了它，Hölder 给出

```
 \int_E f_{\mathrm{in}}\,d\sigma
 \le (v_kR^k)^{1-1/q}
 \left(\sum_w\int\!\!\int\tau_w g_w^q\,du\,d\vartheta_{d,k}\right)^{1/q}
 \le (v_kR^k)^{1-1/q}N^{1/q}\max_w\norm{g_w}_{L^q}.
```

代入 `p:frame-n30` 的界，半径幂相加 $(1-1/q)+\beta-k(1-1/q)$，$k=q$ 使其等于 $\beta$；`projection.tex:426-429` 用 $k\ge d/8$ 与 `p:unit-ball-volume` 把 $v_k^{1-1/q}(C\sqrt d)^{k(1-1/q)}$ 收成 $C_0^{d}$。

终端系数 `projection.tex:473-475` 给 $K_0=C^{d}\epsilon^{q}$；块划分与计费在 `projection.tex:484-488`：目的状态要么下一边界处的延续状态（至多 $2^{M}$ 个），要么带局部停止指标 $0,1,\ldots,k$ 的终端状态（至多 $(k+1)2^{M}$ 个），合计 $N_{*}=(k+2)2^{M}$（`projection.tex:450`）。我特别核对 `projection.tex:490-491`：`The global stopping index is determined by the fixed block start and this local index, so the terminal output retains its full allowed dependence on time.`，也就是全局指标 $=$ 块起点 $+$ 局部指标，因此输出对时刻的合法依赖没有被计费过程削弱；代价是每个终端目的多带 $\log(k+1)$ 位，被吸进 $N_{*}$ 的 $k+2$。

最后一步算术在 `projection.tex:524-534`：取 $L=\log(1/\epsilon)$，$2/3$ 成功给

```
 qL\le (b+1)d\log C
       +\frac bq\bigl(M\log2+\log(k+2)\bigr)
       +\log(3/2).
```

$b\le8T/d+1$、$\log(k+2)/q$ 有界、$q=k\ge d/8$，合成 `projection.tex:531` 的 $dL\le C_1(T+d)(1+M/d^{2})$；`projection.tex:533` 强调 `No bound on \(M\) was used.`，再由 `p:haar-linear` 的 $T>d/8$ 得 $T+d<9T$。$M(d)=o(d^{2})$ 只在 `projection.tex:538` 用来把 $1+M/d^{2}\le2$。

(c) 机械理由。$b=\lceil T/k\rceil$ 与"最后一块用被规则忽略的独立行补齐"（`projection.tex:477-478`）是配套的：块长固定成 $k$ 才能用一次性的 `p:haar-block`。$N_{*}$ 里的 $+2$ 覆盖 $k+1$ 个局部指标再加一个余量，使 $\log N_{*}$ 在 $M=0$ 时仍为正。`p:haar-linear` 的 $d/8$ 与 $5/8$ 是纯信息论端点：`geometry-model.tex:312-313` 给 $\E\lVert u\rVert^{2}=T/d$ 与 $\Prob\{\lVert u\rVert^{2}\ge1/2\}\le2T/d$，`geometry-model.tex:315-318` 用 $\lVert u\rVert^{2}<1/2$ 时两个相反残差方向距离 $>2\epsilon$ 给条件成功 $\le1/2$，合起来 `geometry-model.tex:321-324` 的 $\tfrac12+\tfrac Td\le\tfrac58$。

(d) 失败路线。

1. `[推测]` 先对 $H$ 逐点界 $Q_w$ 再平均。$Q_w$ 可能任意依赖 $H$ 的全部元素（甚至用到 $H$ 的奇异性来编码信息），逐点界会把 $H$ 的信息当成额外内存；`projection.tex:400-403` 的次序是先保留完整径向依赖、再定义 $\tau_w(P,u)=\E_HQ_w(HP,Hu)$ 把这份依赖平均进路由权重。
2. `[推测]` 把 $b$ 取成 $\lceil T/k\rceil$ 之外的更细划分（比如每块 $k/2$）。每块系数 $C^{d}N_{*}^{2/q}$ 中的 $N_{*}$ 会随块数重算，$b$ 翻倍而 $1/q$ 不变，指数上净亏。
3. `[推测]` 用全局停止指标当作额外状态存进内存。那样要为 $T+1$ 个取值多付 $\log(T+1)$ 位，`projection.tex:526` 的 $\log(3/2)$ 项就要换成 $b$ 相关的项；论文的写法是每个终端目的只带 $\le k+1$ 个局部值，全局指标由块起点免费决定。

## 10 正帽支配 `p:cap-domination`：从对偶约束到一个真实的正测度

(a) 引用。参数 `positive-caps.tex:21-24`：

```
 n=d-1,\qquad k=p=\lfloor d/16\rfloor,\qquad
 \alpha=\lambda=\frac n2,\qquad \theta=1-\frac1p.
```

结论 `positive-caps.tex:87-91`：

```
 f_w\mu_{c,r}\le\sum_i a_i\mu_{c_i,\rho_i},
 \qquad
 \sum_i a_i(r/\rho_i)^\alpha\le\exp(Cd)q_w^\theta.
```

参考概率 `positive-caps.tex:73-75`：

```
 f_w(s)&=\E_X K_w(X,Xs),\\
 q_w&=\E_X\int K_w(X,Xc+rHz)\,dm_k(z).
```

(b) 中间步骤。这一段我拆成四个动作，顺序很要紧。

动作一：建字典。`positive-caps.tex:102-105` 取 $\rho_j=r2^{-j}$ 与每层有限的 $\rho_j/2$-网 $N_j$，字典由父帽（指标 $*$）与全部 $B(c',\rho_j)$ 组成；`positive-caps.tex:108-113` 定义

```
 \phi_i=\frac{\1_{B(c_i,\rho_i)}}{\sigma(B(c_i,\rho_i))},
 \qquad b_i=(r/\rho_i)^\alpha.
```

并记下 $\phi_{*}\,d\sigma=\mu_{c,r}$、$b_{*}=1$、第 $j$ 层权重 $2^{\alpha j}$。动作二：把对偶约束变成球质量。若 $0\le h\in L^{\infty}$ 满足 `positive-caps.tex:116` 的 $\int h\phi_i\,d\sigma\le b_i$，令 $\nu$ 为 $h\mu_{c,r}$ 在 $s\mapsto(s-c)/r$ 下的像，则要证 `positive-caps.tex:126-127` 的 $\nu(D(b,t))\le D^{d}t^{\lambda}$。$0<t\le1/4$ 时取 $j=\lfloor\log_2\frac1{4t}\rfloor$（`positive-caps.tex:133`），于是 $4rt\le\rho<8rt$；网点的覆盖条件写成 `positive-caps.tex:137-138` 的 $2rt+\rho/2\le\rho$，比值估计 `positive-caps.tex:141-143` 给

```
 &\le(A_0/a)^n(\rho/r)^{n-\alpha}
 \le(A_0/a)^n(8t)^\lambda.
```

我核对指数：$\sigma(B_i)/\sigma(B)\le(A_0\rho)^{n}/(ar)^{n}=(A_0/a)^{n}(\rho/r)^{n}$，再乘约束值 $b_i=(r/\rho)^{\alpha}$，得 $(A_0/a)^{n}(\rho/r)^{n-\alpha}$；$n-\alpha=n/2=\lambda$，$\rho\le r$ 使 $(\rho/r)^{\lambda}\le(8t)^{\lambda}$。$t>1/4$ 用质量 $\le1$ 与 $1\le4^{\lambda}t^{\lambda}$（`positive-caps.tex:146`）。

动作三：用矩定理估计测试。$\nu$ 满足 `p:frame-positive` 全部假设后（`positive-caps.tex:151-164`），Hölder 与 $0\le K_w\le1$ 给出 `positive-caps.tex:172-177`：

```
 \int h f_w\,d\mu_{c,r}
 &=\E_X\int K_w(X,Xc+rHz)g_X(z)\,dm_k(z)\\
 &\le\left(\E_X\int g_X^p\,dm_k\right)^{1/p}
 \left(\E_X\int K_w(X,Xc+rHz)^{p'}\,dm_k\right)^{1/p'}\\
 &\le\exp(Cd)q_w^\theta,\qquad p'=p/(p-1).
```

这里 $q_w^{\theta}$ 的 $\theta=1-1/p$ 就是 $1/p'=1-1/p$，而 $K_w^{p'}\le K_w$ 把它降成一次幂，指出的 $q_w$ 因此是一次齐次。

动作四：把测试不等式变成真的支配。`positive-caps.tex:187-192` 取 $K=\exp(Cd)q_w^{\theta}$（$q_w=0$ 时 $h=1$ 可行，直接给 $f_w\mu_{c,r}=0$）并在 $L^{1}(\sigma)$ 里定义

```
 \mathcal C_K=\left\{\sum_{i\in I}a_i\phi_i:
 a_i\ge0,\ \sum_i a_ib_i\le K\right\}.
```

$L^{1}$ 收敛由 $b_i\ge1$、$\lVert\phi_i\rVert_{L^{1}}=1$ 给出。紧性我按两层补：系数在对角子列下逐指标收敛（$0\le a_i\le K/b_i$），尾部由 `positive-caps.tex:201-203`

```
 \left\|\sum_{j>J}\sum_{i\text{ at level }j}a_i\phi_i\right\|_{L^1}
 =\sum_{j>J}\sum_{i\text{ at level }j}a_i
 \le K2^{-\alpha(J+1)}.
```

注意等号成立的理由是每项 $\phi_i\ge0$ 且 $\lVert\phi_i\rVert_{1}=1$，所以 $L^{1}$ 范数就是系数和。$2^{-\alpha(J+1)}$ 来自 $\sum_{j>J}2^{\alpha j}\cdot2^{-\alpha(j+1)}$ 型比较：第 $j$ 层每个 $i$ 的 $b_i=2^{\alpha j}$，故该层系数和 $\le K2^{-\alpha j}$，对 $j>J$ 求和取几何级数。向下闭包 $\mathcal D_K$（`positive-caps.tex:213`）凸、含所有非正 $L^{1}$ 函数、范数闭（`positive-caps.tex:216-221`）。若 $F=f_w\phi_{*}\notin\mathcal D_K$，紧单点与闭凸集严格分离（`positive-caps.tex:223-225`），得 $\ell(u)=\int hu\,d\sigma$（$h\in L^{\infty}$，靠 localizable 与 $L^{1}$-$L^{\infty}$ 对偶，`positive-caps.tex:230-232`）；$h\ge0$ 由 $-t\1_E\in\mathcal D_K$ 逼出；`positive-caps.tex:237-242` 定义 $S_h=\sup_i\frac{\int h\phi_i d\sigma}{b_i}$ 并给 $\sup_{\mathcal D_K}\int hu\,d\sigma=KS_h$，上界来自代价约束、下界来自单项 $(K/b_i)\phi_i$ 且不需上确界达到。$S_h=0$ 与 $S_h>0$ 两支都由动作三矛盾，故 $F\in\mathcal D_K$。

(c) 机械理由。$\alpha=\lambda=n/2$ 必须同时满足两件事：$(\rho/r)^{n-\alpha}$ 里 $n-\alpha>0$（否则 $(8t)^{\lambda}$ 那一步的方向反了）与 `p:frame-positive` 的增长指数 $\lambda$ 兼容，$n/2$ 是唯一被两边同时容许的对称取法。$\theta=1-1/p$ 完全由 $p'=p/(p-1)$ 决定。`positive-caps.tex:60` 的 $\lambda-(p-2)-k\ge3d/8$ 是 `projection.tex:322-324` 的余量在此参数下的重述。$0<\rho_i\le r$（`positive-caps.tex:86`）来自 $\rho_j=r2^{-j}$ 与 $j\ge0$，它保证 $b_i\ge1$，进而保证 $L^{1}$ 收敛与尾部估计。$C$ 与父帽、核无关（`positive-caps.tex:94`）是前向迭代能线性叠加的前提。

(d) 失败路线。

1. `[推测]` 用 Hahn-Banach 在测度空间的对偶里直接分离，绕开 $L^{1}$ 紧性。测度全变差范数下单位球在无穷维非紧；$L^{1}$ 路线的价值恰在 `positive-caps.tex:199-208` 那句"每层有限个帽 + 权重代价使细尺度尾部消失"，换成测度范数就没有可用的逐层有限性。
2. `[推测]` 把字典取成所有半径连续统。那 $I$ 不可数、对角子列论证失效，$\sum_i a_ib_i\le K$ 也无法定义成级数；`positive-caps.tex:105` 的 `Repetitions may have separate indices.` 说明作者刻意让 $I$ 是可数指标集，宁可重复也要保住可数性。
3. `[推测]` 直接用 $q_w$ 作支配系数而不引入 $K$。$\mathcal C_K$ 就会随 $q_w$ 缩放，$\mathcal D_K$ 的闭性与分离常数都要重做；把 $K$ 固定为 $\exp(Cd)q_w^{\theta}$ 后，代价 $\exp(Cd)q_w^{\theta}$ 是结论里读出来的量。

## 11 前向迭代：`p:cap-forward-step`、`p:cap-terminal` 与固定停止指标

(a) 引用。块代价 `positive-caps.tex:279-281`：

```
 \mathcal P'\le\mathcal P\exp(Cd)2^{M/p}.
```

终端帽均值 `positive-caps.tex:327`：

```
 \int h_Q\,d\mu_{c,r}\le\exp(Cd)(\epsilon/r)^\alpha.
```

固定停止指标 `positive-caps.tex:352-355`：

```
 \Prob\{\mathsf T=t\text{ and }\arccos\inner{\widehat S}{S}\le\epsilon\}
 \le\exp(Cd)(\epsilon/2)^\alpha
       \left[\exp(Cd)2^{M/p}\right]^{\lceil t/k\rceil}.
```

(b) 中间步骤。$2^{M/p}$ 的来源我按 `positive-caps.tex:295-300` 复算：对固定父帽，$\sum_wq_{v,i,w}\le1$ 与 $|\mathcal W|\le2^{M}$ 给

```
 \sum_wq_{v,i,w}^{\theta}
 \le\abs{\mathcal W}^{1/p}\left(\sum_wq_{v,i,w}\right)^\theta
 \le2^{M/p}.
```

这一步是 $\ell^{1}$-$\ell^{p}$ 型 Hölder（指数 $p$ 与 $p'=p/(p-1)$，$\theta=1/p'$），也就是"目的状态个数"以 $1/p$ 次幂进入代价。半径换算在 `positive-caps.tex:303-308`：$(2/\rho_j)^{\alpha}=(2/r_{v,i})^{\alpha}(r_{v,i}/\rho_j)^{\alpha}$，于是父帽的代价因子被逐层继承。

终端一步我按 `positive-caps.tex:331-343` 核对：固定输出 $z$ 时角成功蕴含 $\lVert s-z\rVert=2\sin(\vartheta/2)\le\epsilon$；$\epsilon<r$ 用帽质量比值 $(A_0/a)^{n}(\epsilon/r)^{n}\le\exp(Cd)(\epsilon/r)^{\alpha}$（这里 $(\epsilon/r)^{n}\le(\epsilon/r)^{\alpha}$ 靠 $\epsilon/r\le1$ 与 $n\ge\alpha$）；$\epsilon\ge r$ 用概率 $\le1$ 与 $(\epsilon/r)^{\alpha}\ge1$。

`p:cap-fixed-stop` 的构造我复述成三步。第一步切块：前 $t$ 个指标分成 $b=\lceil t/k\rceil$ 块，短块用被忽略的独立 Gaussian 行补齐（`positive-caps.tex:373-374`）。第二步只保留"未停且可继续"的路径，末块只保留"恰在 $t$ 停止"的路径，这些是被丢弃其余路径后的 Borel 核，和至多 $1$（`positive-caps.tex:368-372`）。第三步用未归一化的联合测度 $\eta_v(E)=\Prob\{S\in E,\ \text{路径在状态 }v\ \text{被计数}\}$，初始 $\eta_v^{\xi}=\pi_\xi(v)\sigma$、$B(c,2)=S^{d-1}$、$\mu_{c,2}=\sigma$（`positive-caps.tex:385-392`），所以初始代价恰为 $1$（`positive-caps.tex:394-395`）。迭代 $b$ 次后乘终端估计，每项 $a$ 半径 $r$ 贡献 $\exp(Cd)(\epsilon/2)^{\alpha}a(2/r)^{\alpha}$（`positive-caps.tex:402-404`），求和即 (a)。$t=0$ 单独走初始支配加终端估计。

渐近吸收在 `positive-caps.tex:417-420`：$M(d)=o(d^{2})$ 蕴含最终 $M(d)\le d^{2}$，$p\ge d/32$ 使 $\log 2^{M/p}\le32(\log2)d$，被 $\exp(Cd)$ 吞掉，得 `positive-caps.tex:359` 的 $\exp(Cd(1+\lceil t/k\rceil))(\epsilon/2)^{\alpha}$。总成功 `positive-caps.tex:434-437` 用不相交停止事件求和：

```
 \Prob\{\text{success}\}
 \le(T+1)\exp(C_1d+C_2T-dL/3).
```

其中 $(\epsilon/2)^{\alpha}\le\exp(-dL/3)$ 靠 $\alpha\ge d/3$（`positive-caps.tex:432`，$n/2=(d-1)/2\ge d/3$）与 $\log2$ 折入常数；$\lceil t/k\rceil\le t/k+1$ 与 $k\ge d/32$ 给 $C_2T$。取对数后用 $\log(T+1)\le T$（`positive-caps.tex:445`），再借 `p:haar-linear` 的 $T>d/8$ 得 $T\ge1$，合成 `positive-caps.tex:449` 的 $dL\le3(8C_1+C_2+2)T$。

(c) 机械理由。$q_w$ 与 $f_w$ 在 `positive-caps.tex:71-76` 成对出现，参考律 $Xc+rHz$ 里的 $H$ 是必要的：核 $K_w$ 可以读取完整矩阵 $X$，而 $Xs=Xc+rHPu$（`positive-caps.tex:167-168`）说明父帽上的信号经 $H$ 与 $P$ 分解后落在以 $Xc$ 为心、由 $rHz$ 撑开的标记体内；参考概率与真实分布只差把 $Pu$ 换成均匀 $z$。$\exp(Cd)$ 与 $2^{M/p}$ 分离的原因是前者来自解析（维度）、后者来自组合（状态数），在 `Model.lean:688-689` 里两者也分别写成 `Real.exp (C*d)` 与 `(2:ℝ)^((M:ℝ)/k)`。$(\epsilon/2)^{\alpha}$ 里的 $2$ 是初始帽半径 $r=2$ 的残留。

(d) 失败路线。

1. `[推测]` 把 $\eta_v$ 归一化成条件概率再传播。归一化会在每块引入除法，而 $\eta_v(S^{d-1})$ 可能为 $0$；`positive-caps.tex:317-318` 明说 `The state measures here remain unnormalized joint measures; the argument never divides them by their total masses.`，正线性叠加正是靠这一点。
2. `[推测]` 对随机停止指标做可选停时论证。那样要核 $\mathsf T$ 关于过滤的可停性与代价的可积性；论文的写法是对每个固定 $t$ 单独证 `p:cap-fixed-stop`，再对 $0\le t\le T$ 求和，代价换来 $(T+1)$ 因子，而它被 $dL/3$ 的负项吃掉。
3. `[推测]` 用 $\exp(Cd(1+b))$ 直接统一三套路线的代价。这一支在 $M$ 上的依赖只剩 $2^{M/p}$ 的渐近吸收，$T\ge c\,d\log(1/\epsilon)/(1+M/d^{2})$ 那样的显式权衡就得由 `p:haar-success` 提供；`introduction.tex:66-69` 那句说明底层界保留对任意 $M$ 的显式依赖，两条路线互补。

## 12 势与锚定距离：`p:riesz-potential-finite`、`p:riesz-distance`、`p:riesz-density`

(a) 引用。参数 `riesz.tex:12-14`：

```
Throughout this section, fix an integer $d\ge16$ and put
\begin{equation}\label{p:riesz-parameters}
 k=q=\lfloor d/8\rfloor,\qquad \alpha=d/2.
\end{equation}
```

它们给出的余量 `riesz.tex:18-19`：

```
 q\ge2,\qquad d/16\le k=q\le d/8,\qquad
 \alpha-k-q\ge1,\qquad d-1-\alpha\ge1.
```

势的定义 `riesz.tex:29-31`：

```
 V(h)=\sup_{z\in\R^d}
       \int_{S^{d-1}}\frac{h(s)}{\norm{s-z}^{\alpha}}\,d\sigma(s).
```

两条基本界 `riesz.tex:44` 与 `riesz.tex:51`：

```
 \sigma(B_r(z))\le C^d r^{d-1}.
```

```
 \le C^d\epsilon^{d-1-\alpha}.
```

锚定引理结论 `riesz.tex:82`：

```
 \le C^d V(h)\rho^{\alpha-k}.
```

密度引理结论 `riesz.tex:147-148` 与支撑 `riesz.tex:152-155`：

```
 \left(\E_X R(X,Xz+b)^q\right)^{1/q}
 \le C^d V(h)\rho^{\alpha-k}.
```

```
 R(X,y)=0
 \quad\hbox{if}\quad
 \norm{y-Xz}>\norm X_{\mathrm{op}}\rho .
```

(b) 中间步骤。$V(h)<\infty$ 我按 `riesz.tex:55-66` 复现：外层半径 $\epsilon$ 逐层减半，第 $m$ 壳贡献 $(2/r_m)^{\alpha}C^{d}r_m^{d-1}$，$\sum_{m\ge0}2^{-m(d-1-\alpha)}\le2$ 靠 $d-1-\alpha\ge1$；$B_{1/10}(z)$ 之外的核用 $10^{\alpha}$ 放掉。这两处合起来给出 $\sup_hV(h)<\infty$（$0\le h\le1$ 一致）。

`p:riesz-distance` 里我把覆盖链写全：$F$ 过 $z$ 时 $B_{\rho}(z)$ 中点到 $F$ 的正交投影仍在 $F\cap B_{\rho}(z)$ 内（`riesz.tex:96-97`），极大 $r$-分离集基数 $\le(1+2\rho/r)^{\ell}\le(3\rho/r)^{\ell}$（`riesz.tex:93`），半径 $2r$ 的 ambient 球覆盖距离 $\le r$ 的部分，势的质量控制 `riesz.tex:90` 给 $\int_{B_r(c)}h\,d\sigma\le V(h)r^{\alpha}$，于是 tube 界 `riesz.tex:104`：

```
 \le 3^\ell2^\alpha V(h)\rho^\ell r^{\alpha-\ell}.
```

我核对 $\ell=0$ 的分支（`riesz.tex:106`：`This includes $\ell=0$, with a one-point net.`），单点网使 $3^{\ell}\rho^{\ell}=1$，公式仍对。逐壳求和的收敛条件是 $\alpha-\ell-k\ge\alpha-(q-1)-k\ge2$（`riesz.tex:118-120`），剩余常数用 $\ell\le d/8$、$\alpha=d/2$、$k\le d/8$ 收进 $C^{d}$（`riesz.tex:121-122`）。$F\cap B_{\rho}(z)$ 零质量只需 $\alpha-\ell>0$。

`p:riesz-density` 的构造我一步步重做。先用球平均代替密度（`riesz.tex:165-167`）：

```
 R_\eta(X,y)=
 \frac{1}{\operatorname{vol}_k(B_\eta^k)}
 \int \mathbf1_{\{\norm{Xt-y}\le\eta\}}\,d\mu(t).
```

按 Tonelli 展开 $R_\eta(X,Xz+b)^{q}$，$q$ 个点 $t_1,\ldots,t_q$ 取自 $\mu$。列向量 $X(t_j-z)$ 的 $k$ 行是独立中心化 Gaussian，协方差为 anchored Gram 矩阵 $G=(\inner{t_i-z}{t_j-z})$（`riesz.tex:178-180`）；$G$ 非奇异时联合密度处处 $\le(2\pi)^{-kq/2}(\det G)^{-k/2}$（`riesz.tex:181`）。奇异元组零质量：第一个线性相关的 $t_j-z$ 使 $t_j$ 落在维数 $\le q-1$、过 $z$ 的仿射空间内，由 `p:riesz-distance` 归零，逐 $j$ 用 Fubini（`riesz.tex:186-191`）。Gram-Schmidt 给出 `riesz.tex:197-201` 的

```
 (\det G)^{-k/2}
 =\prod_{j=1}^q
 \operatorname{dist}\!\left(
 t_j,z+\operatorname{span}(t_1-z,\ldots,t_{j-1}-z)
 \right)^{-k}.
```

从这里逆序积分，每层吃一个 $C^{d}V(h)\rho^{\alpha-k}$，共 $q$ 层，$(C^{d}V(h)\rho^{\alpha-k})^{q}$；球体积相消、Gaussian 前置因子 $\le1$。最后取 `riesz.tex:220` 的 $R(X,y)=\liminf_{m\to\infty}R_{1/m}(X,y)$，逐满秩 $X$ 用 $X=DP$（$D=(XX^{\mathsf T})^{1/2}$）与微分定理认同密度，再对每个固定 $b$ 单独 Fatou。支撑性用 `riesz.tex:243-247`：$\lVert y-Xz\rVert>\lVert X\rVert_{\mathrm{op}}\rho$ 时 $H$ 中所有 $Xt$ 到 $y$ 的距离有正下界，平均值最终为 $0$。

(c) 机械理由。$\alpha=d/2$ 与 $q=\lfloor d/8\rfloor$ 的耦合是被 $\alpha-k-q\ge1$（`riesz.tex:19`）逼出来的：$q$ 层积分里最坏一层是 $\ell=q-1$，条件 $\alpha-(q-1)-k\ge2$ 即 $\alpha-k-q\ge1$，代 $\alpha=d/2$、$k=q$ 得 $d/2-2q\ge1$，$q\le d/8$ 恰好。$d\ge16$（`riesz.tex:12`）保证 $q\ge2$。$\rho^{\alpha-k}$ 的量纲：$\dist^{-k}$ 对 $h\,d\sigma$ 积分，后者被 $V(h)\rho^{\alpha}$ 控制，故 $\rho^{\alpha-k}$。$R$ 对全部 $b$ 只用一个函数（`riesz.tex:150`：`The same function \(R\) is used for all \(b\).`）是这条路线的存在理由，`riesz.tex:250-255` 我原文引用：

```
The explicit choice \eqref{p:riesz-density-version} is the feature
needed for the next step. A density chosen only up to a
Lebesgue-null set in $y$ for each $X$ would not justify the moment
estimate at the matrix-dependent point $Xz+b$.
```

(d) 失败路线。

1. `[推测]` 把 `p:frame-moment` 的积分界直接当点态使用。`riesz.tex:254-255` 说得很清楚：$\int\!\!\int$ 型界只控制到乘积零集，而图 $y=Xz+b$ 的乘积测度为零，密度在其上的取值完全没被约束。我最初以为可以在 $b$ 上取可数稠密集再靠连续性延伸，$R(X,\cdot)$ 作为 $\liminf$ 无连续性，此路不通。
2. `[推测]` 对 $X$ 逐样本用 Radon-Nikodym 导数。每个 $X$ 的导数只在 Lebesgue 零集意义下确定，矩阵相关的点 $Xz+b$ 恰落在无法控制的位置；构造 $R_\eta$ 再取 $\liminf$ 是为了让"对每个满秩 $X$ 都是密度"与"联合 Borel"同时成立。
3. `[推测]` 让 $H$ 与 $q$ 相同以多积分一层。$H$ 在这里被完整保留在 $X=DP$ 里参与标记，而层数由 $q$ 决定；若把 $q$ 提到 $\lfloor d/4\rfloor$，$\alpha-k-q\ge1$ 立刻破，锚定引理的级数发散。

## 13 壳层与分箱：`p:riesz-shell`、`p:riesz-success` 与那段参数论证

(a) 引用。单壳界 `riesz.tex:371`：

```
 \le C^d W^{1/q}V_i.
```

待证递推 `riesz.tex:483`：

```
 V_{i-1}\le C^d\epsilon^{d-1-\alpha}
          +C^d(1+L)W^{1/q}V_i .
```

分箱与尾概率 `riesz.tex:402-408`：

```
 E_1=\{\norm X_{\mathrm{op}}\le D_0\sqrt d\},\qquad
 E_j=\{D_0(j-1)\sqrt d<\norm X_{\mathrm{op}}\le D_0j\sqrt d\}
 \quad(j\ge2).
```

```
 \P(E_j)\le \exp\bigl(-4(j-1)^2d\bigr)\qquad(j\ge2).
```

成功界 `riesz.tex:281-282`：

```
 B=C_0^d\epsilon^{\,d/2-1},\qquad
 J=1+C_0^d(1+L)W^{1/q}.
```

(b) 中间步骤。`p:riesz-shell` 的推导我按 `riesz.tex:376-462` 复现，中间有四处我原本漏了。第一处：`(2/\rho)^\alpha` 来自 $H_\rho(z)$ 上 $\lVert s-z\rVert^{-\alpha}\le(2/\rho)^{\alpha}$。第二处：推进到标记空间后用 `riesz.tex:389-390` 的支撑条件把积分区限制到 $\lVert y-Xz\rVert\le\lVert X\rVert_{\mathrm{op}}\rho$，并把 $\sum_wK^{(i)}_{v,w}R_w$ 换成 $\max_wR_w$，靠的是概率向量性质。第三处：区域依赖随机变量 $\lVert X\rVert_{\mathrm{op}}$，必须先分箱才能与 $\E_X$ 交换，`riesz.tex:398-399` 那句 `We need a deterministic integration region after averaging over $X$.` 就是这个动机；每个 $E_j$ 上的界由 Hölder 与 `p:riesz-density-bound` 合成 `riesz.tex:429-433`：

```
 \E_X\!\left[\mathbf1_{E_j}\max_wR_w(X,Xz+b)\right]
 &\le \P(E_j)^{1-1/q}
       \left(\sum_w\E_X R_w(X,Xz+b)^q\right)^{1/q}\\
 &\le \P(E_j)^{1-1/q}W^{1/q}
       C^dV_i\rho^{\alpha-k}.
```

第四处：固定 $E_j$ 内的矩阵后平移 $y=Xz+b$，区域成确定球 $\lVert b\rVert\le D_0j\sqrt d\,\rho$，体积至多 $C^{d}j^{k}\rho^{k}$（`riesz.tex:444-446`），求和用 `riesz.tex:449-452`：

```
 \sum_{j\ge1}j^k\P(E_j)^{1-1/q}
 \le 1+\sum_{j\ge2}
       \exp\bigl(k\log j-2(j-1)^2d\bigr)
 \le 2 .
```

我核对 $1-1/q\ge1/2$（$q\ge2$）把 $\exp(-4(j-1)^{2}d)$ 变成 $\exp(-2(j-1)^{2}d)$，再用 $k\log j\le(d/8)(j-1)^{2}$（$j\ge2$，`riesz.tex:454-456`）压成 $\exp(-(15/8)(j-1)^{2}d)$ 型几何级数。半径幂在 `riesz.tex:460-462` 精确相消：

```
 \rho^{-\alpha}\rho^{\alpha-k}\rho^k=1.
```

算子范数尾概率 `riesz.tex:419-421` 我按 `riesz.tex:410-418` 重做：$1/4$-网基数 $\le9^{d}$、$9^{k}$，$\lVert X\rVert_{\mathrm{op}}$ 至多是两个网点上双线性型最大绝对值的 $2$ 倍，每个型是标准 Gaussian，$\Prob\{\lvert g\rvert>s\}\le2e^{-s^{2}/2}$ 与 union bound 给 $2\cdot9^{d+k}\exp(-t^{2}/8)$（系数 $8$ 来自 $2$ 倍与网误差吸收），代 $t=D_0(j-1)\sqrt d$ 并增大 $D_0$ 得 (a) 的分箱界。

壳计数在 `riesz.tex:466-476`：$B_\epsilon(z)$ 外用 $2^{m}\epsilon<\lVert s-z\rVert\le2^{m+1}\epsilon$，$\lVert z\rVert\le3$ 时距离 $\le4$，壳数 $\le\lceil\log_2(4/\epsilon)\rceil$；$\lVert z\rVert>3$ 时距离落在 $[\lVert z\rVert-1,\lVert z\rVert+1]$，比值 $<2$，只有有数个 dyadic 壳能命中，故总量 $\le C(1+L)$（`riesz.tex:471`）。$B_\epsilon(z)$ 内用 $h_{i-1}\le1$ 与 `p:riesz-inner`。取 $\sup_z$、$\max_v$ 得 (a) 的递推。$U_i=\max\{V_i,B\}$ 把递推收成 $U_{i-1}\le JU_i$、$U_N=B$，故 $V_0\le BJ^{N}$ 含 $N=0$。$z=0$ 时核在单位球面上为 $1$，$\int h_0(v,s)\,d\sigma\le V_0$（`riesz.tex:493-494`）。

参数论证我按 `riesz.tex:509-567` 复算。先算标签计数版打包界 `riesz.tex:521-522`：$p_{\mathrm{succ},\mathrm{rule}}\le WC^{d}\epsilon^{d-1}$，$W=(T+2)2^{M}$（`riesz.tex:270`）来自 $2^{M}$ 个活状态与 $(T+1)2^{M}$ 个终端标签（`riesz.tex:304-306`）。$T\ge dL$ 时结论自动成立，剩下 $T<dL$：取对数得 $(d-1)L\le M\log2+\log(T+2)+d\log C+\log(3/2)$，用 $M\le d^{2}$、$\log(T+2)\le\log(2d)+L$（$L\ge\log10$），得 `riesz.tex:543` 的 $L\le Cd$ 与 $\log W\le Cd^{2}$。于是 `riesz.tex:547-549`：

```
 \log J
 \le \log2+d\log C_0+\log(1+L)+\frac{\log W}{q}
 \le Cd ,
```

用 $q\ge d/16$。最后 `riesz.tex:556-561`：

```
 (d/2-1)L
 \le d\log C_0+N\log J+\log(3/2)
 \le Cd(1+N)+\log(3/2)
 \le C'(d+T),
```

$N=\lceil T/k\rceil\le16T/d+1$，`p:haar-linear` 给 $T>d/8$ 从而 $d\le8T$，$d\ge4$ 时左系数 $\ge d/4$。

(c) 机械理由。$\epsilon^{d/2-1}$ 中 $d/2-1=d-1-\alpha$ 就是 `p:riesz-terminal` 的指数（`riesz.tex:339`），终端势的阶决定 $B$ 的阶。$J$ 里 $(1+L)$ 只可能来自壳计数，$W^{1/q}$ 只可能来自 $\max_w$ 与 Hölder 的 $q$ 次矩，两者在 `riesz.tex:289-292` 被作者点名：`The factor \(1+L\) in \eqref{p:riesz-success-bound} counts the distance shells and remains in the final parameter argument.`。$1+$ 前缀保证 $J>1$，让 $U_{i-1}\le JU_i$ 在 $V_i$ 很小时仍单调，且 $W=0$（不可能）或 $L=0$（$\epsilon=1$，被 $\epsilon\le1/10$ 排除）都不破式。$\alpha=d/2$ 让 $d/2-1>0$，即 $B\to0$，这是整个下界能收敛的符号要求。

(d) 失败路线。

1. `[推测]` 用精确的 Marchenko-Pastur 或 Gordon 估计替换网覆盖尾概率。常数会更漂亮，但 `riesz.tex:406-408` 的分箱界要的只是 $\exp(-c(j-1)^{2}d)$ 的形状与一个能自由增大的 $D_0$；引入谱分布反而要把 $k/d$ 的比值写进常数，与 `riesz.tex:423` 那句 `after increasing $D_0$, since $k\le d/8$` 的粗糙吸收不兼容。
2. `[推测]` 把分箱换成对 $\lVert X\rVert_{\mathrm{op}}$ 直接取 $L^{q}$ 矩。 Hölder 之后需要 $\E\lVert X\rVert_{\mathrm{op}}^{k(1-1/q)}$ 型量与 $\rho^{k}$ 的球体积同时有限，体积随半径 $k$ 次方增长而尾概率只给 Gaussian 衰减，指数对不上；分箱把两者按 $j$ 配对，才出现 $j^{k}\exp(-2(j-1)^{2}d)$ 的可求和形式。
3. `[推测]` 把 $1+L$ 壳因子吸进 $C_0^{d}$。$L$ 可以大到 $Cd$ 之外（$\epsilon$ 极小时），$\log(1+L)$ 无法被 $d$ 的固定倍数吸收；论文的处置是在 $T<dL$ 分支里先证 $L\le Cd$，再声明 `riesz.tex:552` 的 `the shell-count term has been bounded rather than removed.`，也就是有意识地让它先被限制再被吸收。

## 14 尝试过的错误路线及其失败原因

这一节把散在各引理 (d) 分支里的弯路合并记账，只收我自己真走过、并且能在 tex 里找到对应"防御句"的路线。

路线一，把三个问句合并成一条密度矩不等式。我以为 $\bigl(\int\!\!\int g^{q}\,du\,d\vartheta\bigr)^{1/q}$ 一旦有界，在任何"我用得上"的点上都能取值。失败原因写在 `riesz.tex:254-255`：`An integrated $L^q(dX\,dy)$ estimate controls a density only up to product-null sets, while the graph $y=Xz+b$ has zero product measure.`。图的乘积测度为零，所以积分界对 $g(P,Xz+b)$ 完全不设限；这是第三节问句独立存在的理由，也是我第一次被迫承认"矩的类别"需要分开。

路线二，让 $\nu$ 依赖数据。$g_\delta$ 与 $\ell$ 的界都要求测度在抽 $X$ 之前固定，`projection.tex:301-302` 的 `fixed independently of \(X\)` 与 `positive-caps.tex:152-154` 的 `the test, parent cap, and measure are fixed before the fresh matrix $X$ is drawn` 是同一条件的两处防御。数据相关的测度会让 $\E_X$ 与 $\nu$ 的积分次序无法交换，`p:riesz-density` 里"先固定 $H$、$h$ 再抽 $X$"（`riesz.tex:137-138`）也是同一约束。

路线三，先证绝对连续性再估密度。`p:frame-moment` 把绝对连续性列为假设（`projection.tex:178-179`），只在取 $\liminf$ 时用一次；我最初尝试从 $\nu(B(b,t))\le Kt^{\beta}$ 直接推 $P_{\#}\nu\ll du$，这在 $\beta<k$ 时是错的（投影可以落在低维集上），而正帽路线之所以能验这条假设，靠的是 $h\mu_{c,r}\ll\sigma$ 加上 `p:coordinate-density` 对每个 frame 给出的 $P_{\#}\sigma\ll dz$（`positive-caps.tex:153-156`），跟增长指数无关。

路线四，用 Vandermonde 型对称化替代 Gram-Schmidt 三角结构。见第 7 节 (d) 第 2 条，失败在逆序积分不可用。

路线五，在测度全变差范数下做凸分离。失败在无穷维单位球非紧；`positive-caps.tex:199-208` 的紧性是 $\sum_i a_ib_i\le K$ 与 $b_i=2^{\alpha j}$ 共同制造的，尾部 `positive-caps.tex:203` 的 $K2^{-\alpha(J+1)}$ 一旦被换成全变差代价就没有对应量。

路线六，把 $\eta_v$ 归一化。$\eta_v(S^{d-1})$ 可以为 $0$；`positive-caps.tex:317-318` 明确拒绝除法。归一化还会让"丢弃路径"这件事在每块改变分母，前向迭代的线性叠加（`positive-caps.tex:285-291`）就散架。

路线七，用可选停时定理处理 $\mathsf T$。代价是要证适应性与可积性；`positive-caps.tex:349-355` 选的固定 $t$ 版本把 $2^{M/p}$ 的计数缩到 $t\le T$ 之内，之后 `positive-caps.tex:434` 才求和，多出 $(T+1)$，而它被 $\exp(-dL/3)$ 吃掉。这是"用一个大因子换掉整套可选机制"的取舍，我起初以为是技术不足才这么做。

路线八，把全局停止指标塞进内存再迭代。`projection.tex:490-491` 的块内指标写法与 `riesz.tex:304-306` 的 $(T+1)2^{M}$ 标签写法是两种收费；若统一按标签收费，$N_{*}$ 从 $(k+2)2^{M}$ 涨到 $(T+2)2^{M}$，$N_{*}^{1/q}$ 的指数 $\frac1q\log(T+2)$ 在 $T\asymp dL$ 时会多带 $\frac{L}{q}\log d$ 型项，与 `riesz.tex:547-549` 的 $\log J\le Cd$ 勉强相容但 `p:haar-success` 的显式 $M/d^{2}$ 权衡会被污染。

路线九，把 $a=1/(2\pi)$、$A_0=1$ 隐进 $C^{d}$。`positive-caps.tex:38` 之所以要把两值显式写出，是因为 $b_{*}=1$ 与 $B(c,2)=S^{d-1}$（`positive-caps.tex:385`）要给出初始代价恰为 $1$（`positive-caps.tex:394-395`）；隐式化后初始代价只剩 $\le\exp(Cd)$，$[\exp(Cd)2^{M/p}]^{b}$ 会多一个 $\exp(Cd)$ 的外层幂，$\exp(C_1d+C_2T-dL/3)$ 的形式改变。

路线十，用 Marchenko-Pastur 或 Gordon 型精确谱尾。失败点在第 13 节 (d) 第 1 条：要的是形状 $\exp(-c(j-1)^{2}d)$ 与可自由增大的 $D_0$。

路线十一，早期吸收 $M$。$M(d)=o(d^{2})$ 若在证明开头就用掉，就拿不到 `projection.tex:531` 的 $1+M/d^{2}$ 显式权衡，`p:finite-memory-tradeoff`（`geometry-model.tex:196-206`）这一条断言会消失；`Model.lean:660-668` 的 `HaarStreamingCost` 里 $M$ 是以 `((k:ℝ)+2)*2^M` 的形态进入指数的，形式化侧同样要求保留。

路线十二，把三条路线的终端指数统一。$\epsilon^{q}$（`projection.tex:475`）、$(\epsilon/2)^{\alpha}$（`positive-caps.tex:353`）、$\epsilon^{d/2-1}$（`riesz.tex:281`）来自三种不同的度量：全球质量、帽均值、势。硬推成同一个会让至少一条路线的推导链断裂。

## 15 关键转折点

转折点一，承认度量对象有三种。触发点是 `introduction.tex:30-42` 里那句关于"指定标号"的限定：

```
This qualification matters:
an integrated density norm is unchanged by modifications on a
matrix-dependent graph, so it cannot by itself assign or bound the values
on that graph.
```

在此之前我把第三个问句当作前两节的注脚。此后我重排阅读顺序，把 `riesz.tex` 的解析部分（第 127-260 行）与学习部分（第 262 行起）当成两篇文章读。

转折点二，锚点从采样点换到指定中心。`introduction.tex:161-163` 的 "$q$ vectors anchored at $z$" 让我意识到层数从 $q-1$ 变 $q$，进而理解 $q=\lfloor d/8\rfloor$ 与 $q=\lfloor d/4\rfloor$ 的分裂由 $\alpha-k-q\ge1$ 对 $\beta-k-(q-2)\ge1$ 决定。`riesz.tex:197-201` 与 `projection.tex:57-59` 是同一台机器的两种接线。

转折点三，把密度当成构造出来的函数。$R(X,y)=\liminf_{m}R_{1/m}(X,y)$（`riesz.tex:220`）与 $g(P,u)=\liminf_{j}g_{1/j}(P,u)$（`projection.tex:238`）写法一样，用途不同：前者要"对每个满秩 $X$ 是密度"且"对每个固定 $b$ 有矩界"，后者只要乘积几乎处处。逐 $b$ 的 Fatou（`riesz.tex:240-242`）是这条路线能点态用的唯一入口。

转折点四，分箱把随机区域变确定区域。`riesz.tex:398-399` 那一句把我原先"对 $\lVert X\rVert_{\mathrm{op}}$ 取矩"的想法换成"$j$ 参数化的一列确定球"，随后 $j^{k}$ 与 $\P(E_j)^{1-1/q}$ 才能逐项配对求和。

转折点五，$L^{1}$ 紧性加严格分离。`positive-caps.tex:183-184` 那句 `The geometric estimate is complete; the remaining step uses only the dictionary and its test bound.` 标记了解析部分结束；后面全是凸分析。$S_h$ 的定义（`positive-caps.tex:237`）与 `positive-caps.tex:244-246` 的"上界由代价、下界由单项"是分离论证的两根支柱。

转折点六，保留完整径向信息再平均。`projection.tex:400-403` 与 `projection.tex:430-432` 的 `The original \(Q_w\) could use all entries of \(H\); only after that dependence was retained did we average it into \(\tau_w\).` 教我：内存模型里"learner 能看到什么"必须先在证明里给足，再由不变性收回去。

转折点七，参考概率 $q_w$ 的引入。`positive-caps.tex:71-76` 的 $q_w$ 与 $f_w$ 成对，用 $Xc+rHz$ 这个混合标签把 $m_k$ 上的积分变成可 Hölder 的数；$q_w$ 只出现在代价里、$f_w$ 只出现在函数里，这个分工是正帽路线能前向传播的原因。

转折点八，`p:haar-linear` 作为公共端点。三条路线全部依赖它去掉 $T+d$ 里的 $d$：`projection.tex:534`、`positive-caps.tex:446`、`riesz.tex:563-564`。它不含任何内存假设（`geometry-model.tex:294-295`），所以纯信息论部分与解析部分在这里干净分离。

转折点九，读 `Main.lean` 的第 15-24 行。`refine` 一次性给出 15 个分量、只留 `?_` 给 `K.exists_equivalent_tape hK hd`（第 26 行），逼我按 `Model.lean:732-739` 的 `MainStatement` 逐条回表：`IntegratedFrameMoment`、`NormalizedUnitBallMoment`、`AllRadiiSphereMoment`、`PositiveCapDomination`、`DeterministicOffsetDensity`、`AllRadiiBlockBound`、`HaarStreamingCost`、`RieszStreamingCost`、`CapFixedStoppingCost`、`CapTotalStoppingCost`、`CapFixedStoppingAsymptotic`、`CapTotalStoppingAsymptotic`、`KernelModelBridge`、`SubquadraticMemoryWithPointwise`、`FixedQuadraticMemory`。我原先以为形式化只锁一个下界；实际它锁住了三条路线的全部中间代价，任何一条被简化都会在合取式里缺一块。

## 16 最终思路与最初设想的差异

参数选择。我原以为一套 $k,q$ 够用，最终是三套：$(k,q)=(\lfloor d/4\rfloor,\lfloor d/4\rfloor)$ 服务反向积分路线，$(k,p)=(\lfloor d/16\rfloor,\lfloor d/16\rfloor)$ 同时服务正帽路线与归一化矩定理，$(k,q)=(\lfloor d/8\rfloor,\lfloor d/8\rfloor)$ 服务 Riesz 路线。约束来源可逐条写：$\beta-k-(q-2)\ge1$ 配 $\beta=n-q=d-1-q$ 给 $d+1-3q\ge1$，即 $q\le(d)/3$ 量级，取 $d/4$ 留裕度（`projection.tex:281`）；$\alpha-k-q\ge1$ 配 $\alpha=d/2$ 给 $q\le d/4$ 更紧的形式（`riesz.tex:19`），取 $d/8$；正帽路线要 $n-\alpha>0$ 与 $\lambda\ge2p-1$ 同时成立，只能 $p\approx d/16$（`positive-caps.tex:60`）。

密度的角色。最初我以为"密度"是一个对象，最终有三个：$\vartheta_{d,k}\,du$ 上的 $L^{q}$ 类（`projection.tex:181-186`）、相对 $m_k$ 的归一化 $g_X$（`projection.tex:308-311`）、以及联合 Borel 的 $R$（`riesz.tex:140-149`）。三者的可测性与唯一性强度互不相同。

停止指标的收费。最初我以为它是免费的（`geometry-model.tex:147-148` 说样本索引不需存进状态）。最终有三本账：反向路线按块内局部指标收费，进 $N_{*}=(k+2)2^{M}$（`projection.tex:450`）；正帽路线对固定 $t$ 完全不收状态费（`positive-caps.tex:409-410`：`only the at most $2^M$ states at each ending boundary were counted. No additional state is charged for the value of $t$.`），代价换成 $(T+1)$ 求和；Riesz 路线把状态与终端标签合并进 $W=(T+2)2^{M}$（`riesz.tex:270`），代价换成 $W^{1/q}$。

内存 $M$ 的位置。显式保留在 `projection.tex:531` 的 $1+M/d^{2}$；渐近吸收在 `positive-caps.tex:417-420`；指数化吸收在 `riesz.tex:547-549` 的 $\log J$。三处对应三条路线对 $M$ 的敏感度：$M/q$、$M/p$、$(\log W)/q$。

精度损失的形式。最终是 $qL$ 对 $(b+1)d\log C$（`projection.tex:524-526`）、$dL/3$ 对 $C_1d+C_2T$（`positive-caps.tex:441-443`）、$(d/2-1)L$ 对 $Cd(1+N)$（`riesz.tex:556-558`）。差别源于终端因子的阶：$\epsilon^{q}$ 给 $qL$、$(\epsilon/2)^{\alpha}$ 给 $\alpha L$、$\epsilon^{d/2-1}$ 给 $(d/2-1)L$。

壳与块的角色。最初我预期"块数"是唯一的额外组合因子。最终 Riesz 路线多带一个 $(1+L)$，来源 `riesz.tex:471` 的壳计数；反向路线不带它，因为 $\int_{B(z,R)}$ 的半径是单个 $R$ ，并非壳分解。

Lean 侧的形状。我原以为 `Main.lean` 会是一行 `exact`。实际它用一次 `refine` 摊开 15 个分量、再单独证 `KernelModelBridge` 的等价带子（第 25-26 行）。`Model.lean` 把每条路线的界写成 $\exists C\ge1$ 加显式维数门槛（`16 ≤ d` 见 `Model.lean:661`、`Model.lean:671`；`32 ≤ d` 见 `Model.lean:682`、`Model.lean:693`、`Model.lean:705`、`Model.lean:717`），这些门槛与 tex 里"for sufficiently large $d$"的说法逐条对得上，其中 $32\le d$ 只出现在 $k=d/16$ 的两条正帽代价上。$M$ 与 $T$ 在 Lean 里是 $\mathbb N$、$\varepsilon$ 是带 $0<\varepsilon\to\varepsilon\le1/10$ 假设的实数，块数写成自然数除法 `(T+k-1)/k`（`Model.lean:668`、`Model.lean:678`、`Model.lean:689`），也就是 $\lceil T/k\rceil$ 的整型表示。我读到这里确认：$\lceil\cdot\rceil$ 在三条路线里都必须显式存在，形式化无法把它藏进常数。

## 17 图模型与停止核在 Lean 里的形状

图模型的机器是 `Graph.lean` 的 `gaussian_graph_kernel_bound`（`Graph.lean:39-45`）：

```
lemma gaussian_graph_kernel_bound {n : ℕ} (v : Fin n → E)
    (hv : LinearIndependent ℝ v) (m : ℕ)
    (φ : (Fin m → ℝ) → ℝ≥0∞) (hφ : Measurable φ)
    (hφ1 : ∫⁻ y, φ y = 1) (b : Fin m → ℝ) :
```

它的结论（`Graph.lean:43-45`）把 $\int^{\sim}\!\!\int$ 型界写成 `ENNReal.ofReal ((∏ i, ‖gramSchmidt ℝ v i‖)⁻¹ ^ m)`。我逐字核对过三件事。第一，$m$ 是行数、$n$ 是 replica 个数，与 tex 的 $k$ 与 $q$ 对应；`^ m` 就是 `projection.tex:111-113` 的"每行一个因子"。第二，`b : Fin m → ℝ` 是自由参数且出现在被积函数 `fun j => b j - ⟪v i, A j⟫` 里，说明形式化里的锚点是 $z$ 一侧（差向量 $t_j-z$ 与固定偏移 $b$），对应 `p:riesz-density`。第三，`hφ1 : ∫⁻ y, φ y = 1` 把 $\varphi$ 当概率核，于是 $R_\eta$ 的球核只是特例：`Graph.lean:107-113` 给出 `ballKernel m η` 的可测性与 `∫⁻ y, ballKernel m η y = 1`，与 `riesz.tex:165-167` 的归一化一致。往上一层是 `vectorSmoothing_graph_moment`（`Graph.lean:75-84`），假设形如 `HasLocalMassBound ν a`、`ν.support ⊆ Metric.closedBall 0 1`、余量 `(q : ℝ) + m ≤ a`，结论是 `(replicaConstant ν a m) ^ q`。这里的 $a$ 是整指数的局部质量阶，而 tex 的两条余量分别写作 $\beta\ge k+q-1$（`projection.tex:173-174` 的 $\beta-k-(q-2)\ge1$）与 $\alpha\ge k+q+1$（`riesz.tex:19` 的 $\alpha-k-q\ge1$）。

我的读法是：Lean 把"级数可和"这件事从假设里搬进了 `replicaConstant` 的定义内部，而假设只留下 `ae_replica_linearIndependent` 需要的 $a\ge q+m$（`Graph.lean:100-101` 用 `le_trans (le_add_of_nonneg_right (Nat.cast_nonneg m)) hmargin` 把 `hmargin` 喂给它）。`replicaConstant`、`replicaWeight`、`sqrt_det_gram`、`replica_integral_bound` 的定义住在 `OAI.Probability.GaussianRegression.Main`（`Graph.lean:1` 导入），在我的允许读集之外，所以这条比较我按 `[推测]` 记：形式化用一个更弱的显式余量换取常数量内部的严格不等式，代价是维数门槛要写成 $a$ 的下界。

停止核在 `StoppingKernel.lean`。它的第一个非平凡陈述 `capWeight_mass_mixed`（`StoppingKernel.lean:15-18`）把终端帽均值写成

```
lemma capWeight_mass_mixed (y : E) {ε : ℝ} (hε : 0 < ε) (hε1 : ε ≤ 1)
    (a : ℕ) {b : ℝ} (hb : 0 ≤ b) (hab : (a:ℝ)+b ≤ (Module.finrank ℝ E-1:ℕ)) :
    PolynomialMass ((ambientSphereLaw (E := E)).withDensity (capWeight y ε)) a
      (ENNReal.ofReal ((3 : ℝ)*4^Module.finrank ℝ E) * ENNReal.ofReal (ε^b)) := by
```

我最初的解读是"这就是 `p:cap-terminal`"，读完第 $a+b$ 的结构才改口：tex 的写法是把 $\min\{R^{n},\epsilon^{n}\}$ 拆成 $\epsilon^{q}R^{\beta}$ 且 $q+\beta=n$（`projection.tex:467-471`），而 Lean 保留了一个自由实数 $b$ 与一个自然数 $a$，只要求 $a+b\le d-1$。也就是说形式化把"$\epsilon$ 的幂与半径的幂怎么分"变成一个可调参数，三条路线各自实例化：反向路线取 $b=q$、$a=\beta$，正帽路线取 $a=\alpha$、$b$ 为余量，Riesz 路线取 $a$ 为势的阶。常数 `(3 : ℝ)*4^finrank` 是 $(2\pi)^{n}$ 型比值的粗化，`ENNReal.ofReal` 包住说明全程走 $\mathbb R_{\ge0}\cup\{\infty\}$ 的积分。

沿链往上：`continuation_mixed_integral_bound`（`StoppingKernel.lean:49-56`）给延续函数的球质量界，形如 $(3\cdot4^{\operatorname{finrank}})\epsilon^{b}\cdot\texttt{streamFactor}\ q^{\ ((k+q-1)/q)}$，假设里出现 `hq : 2 ≤ q` 与 `hqa : 2*q ≤ a`，与 `p:haar-success-proposition` 的 $k=q\ge2$、$2q\le d$ 对齐；`route_mixed_bound`（`StoppingKernel.lean:69-77`）把它改写成"信号与整块 Gaussian 行的乘积测度下，成功事件 $\operatorname{dist}\le\epsilon$"的界，也就是把逐点延续换成一条真实的路由测度。

真正的停止构造从 `namespace Learner` 开始。`haltShift`（`StoppingKernel.lean:116-118`）把 `TaggedState M k` 的 `inr (t,j)` 分支送进 `t.succ`：

```
def haltShift {k : ℕ} : TaggedState M k → TaggedState M (k+1)
  | .inl j => .inl j
  | .inr (t,j) => .inr (t.succ,j)
```

`haltRoute`（`StoppingKernel.lean:120-126`）在块长 $k+1$ 上递归：读第一对 $(X.1\ 0,\ X.2\ 0)$，若停则打 `⟨1, _⟩`，否则对 `Fin.tail` 递归再 `haltShift`。于是 `TaggedState M k = State M ⊕ (\operatorname{Fin}k × State M)`：左分支是在用状态、右分支是"局部停止指标加终端状态"。我在 tex 里找它的对应物，落到 `projection.tex:486-488`：

```
The possible local stopping indices are \(0,1,\ldots,k\), including an
immediate stop. There are at most \((k+1)2^M\) terminal destinations and
\(2^M\) continuing destinations, hence at most \(N_*\) in total.
```

`Fin k` 与 $\{0,\ldots,k\}$ 的差一被 `Nstar : ℝ := ((k:ℝ)+2)*2^M`（`Model.lean:666`）里的 $+2$ 吸收，这解释了 tex 里那个看似多余的 $+2$。配套的 `taggedWeight`（`StoppingKernel.lean:310`）、`stoppedContinuation`（`StoppingKernel.lean:153`）、`stopped_route_mixed_bound`（`StoppingKernel.lean:369`）三件，对应 `p:riesz-shell` 里 $\max_w$ 与 $K^{(i)}_{v,w}$ 的组合：先给带标签的目的赋权，再把"已停"的延续常数地忽略后续样本，正是 `riesz.tex:303-306` 的保留标签并忽略更多样本的写法。

`Model.lean` 的最后三段是模型桥接。`KernelModelBridge`（`Model.lean:725-730`）要求每个 `FiniteKernelLearner d M T` 在 `3 ≤ d` 时等价于一个 `Tape M T` 上的 `Learner`，且 `uniformSuccess` 与 `uniformFixedSuccess` 逐点相等；`Main.lean:25-26` 留下的唯一目标是 `K.exists_equivalent_tape hK hd`，也就是这一条的构造。`MainStatement`（`Model.lean:732-739`）把 15 个断言连成合取，`SubquadraticMemoryWithPointwise` 与 `FixedQuadraticMemory` 收尾（`Model.lean:738-739`），对应 `p:regression` 与 `p:finite-memory-tradeoff` 两种内存假设。读到这里我给第 1 节的读法约定一个交代：`Graph.lean` 提供锚定行列式这台机器，`StoppingKernel.lean` 提供把"停止"编成可计费标签的那只手，两者合起来才让 `Main.lean` 的一句 `refine` 站得住。

## 18 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $n=d-1$ | 球面维数 | geometry-model.tex:86 | `p:cap-mass` 的双边界 | $n-\alpha=\lambda$ 的指数核对失效 |
| $a=(2\pi)^{-1}$ | 帽质量下界常数 | positive-caps.tex:38 | $(A_0/a)^n=(2\pi)^n$ | 初始代价不再恰为 $1$ |
| $A_0=1$ | 帽质量上界常数 | positive-caps.tex:38 | `p:cap-test-ball-bound` | 球质量比值失去来源 |
| $v_k\le(2\pi e/k)^{k/2}$ | 单位球体积上界 | geometry-model.tex:70 | `projection.tex:336` | $(C\sqrt d)^{k(1-1/p)}\le C^d$ 破 |
| $c(D,k)=\dfrac{\Gamma(D/2)}{\pi^{k/2}\Gamma((D-k)/2)}$ | beta 归一化 | geometry-model.tex:28-29 | `p:frame-density` 的乘积式 | 每列 $(C\sqrt d)^k$ 失去来源 |
| $(D-k-2)/2$ | 投影密度指数 | geometry-model.tex:26 | 极坐标降维 | 望远镜残差指数错 |
| $k+m+1\le d$ | 行列式条件 | projection.tex:39 | `p:frame-density-exact` | 指数转负、正定事件空 |
| $\delta_i=\operatorname{dist}(x_i,\aff(x_1,\ldots,x_{i-1}))$ | 仿射高度 | projection.tex:53 | `p:frame-difference-density` | Jacobian $\lvert\det R\rvert^{k}$ 无定义 |
| $\beta-j-k\ge1$ | tube 级数余量 | projection.tex:140 | `p:affine-inverse-bound` | 分层级数发散 |
| $3^{j}2^{\beta}KR^{j}t^{\beta-j}$ | 仿射 tube 质量 | projection.tex:154 | 分层求和首项 | $C^d$ 吸收失败 |
| $C^{d(q-1)}K^{q}R^{q\beta-k(q-1)}$ | 逆序积分积 | projection.tex:233 | `p:frame-moment-bound` | 取 $q$ 次根后指数错位 |
| $g_\delta(P,u)=\nu\{\lVert Px-u\rVert\le\delta\}/(v_k\delta^k)$ | 平均密度 | projection.tex:194 | 体积相消 | 交集体积界无从约掉 |
| $k=q=\lfloor d/4\rfloor$ | 反向路线的阶 | projection.tex:257 | `p:haar-success` | $d+1-3q\ge1$ 失去裕度 |
| $d+1-3\lfloor d/4\rfloor\ge d/4+1$ | 逆距离余量 | projection.tex:281 | `p:frame-n30` | 第 $q-1$ 层积分发散 |
| $k=p=\lfloor d/16\rfloor$ | 归一化矩阶 | projection.tex:292 | `p:frame-positive` | 帽路线无 $\alpha$ 可取 |
| $\lambda=(d-1)/2$ | 增长指数 | projection.tex:292 | `p:frame-positive-bound` | $\exp(C_Ddp)$ 变号 |
| $\exp(C_Ddp)$ | 归一化 $p$ 次矩界 | projection.tex:312 | `p:cap-dual-test` | $\theta$ 次幂估计失效 |
| $\theta=1-1/p$ | Hölder 共轭比 | positive-caps.tex:23 | $q_w^{\theta}$ | $2^{M/p}$ 计数无来源 |
| $\alpha=\lambda=n/2$ | 帽代价指数 | positive-caps.tex:23 | $\sum_i a_i(r/\rho_i)^{\alpha}$ | $(\rho/r)^{n-\alpha}$ 方向反 |
| $\sum_wq_{v,i,w}\le1$ | 参考概率归一 | positive-caps.tex:293 | `p:cap-cost-multiplier` | $2^{M/p}$ 换成 $2^{M}$ |
| $N_{*}=(k+2)2^{M}$ | 块内目的计数 | projection.tex:450 | `p:haar-success` | 局部指标 $k+1$ 溢出 |
| $b=\lceil T/k\rceil$ | 反向块数 | projection.tex:449 | $[C^{d}N_{*}^{1/q}]^{b}$ | 补齐行与块长不符 |
| $K_0=C^{d}\epsilon^{q}$ | 终端全半径系数 | projection.tex:475 | 反向归纳 | $T\ge c\,dL$ 的主项变弱 |
| $T\le d/8$ 与 $5/8$ | 全信息端点 | geometry-model.tex:298-300 | 去掉 $T+d$ 的 $d$ | $T+d<9T$ 失去依据 |
| $\E\lVert u\rVert^{2}=T/d$ | 投影能量 | geometry-model.tex:312 | $\Prob\{\lVert u\rVert^{2}\ge1/2\}\le2T/d$ | 条件成功 $\le1/2$ 不成立 |
| $\rho_j=r2^{-j}$ | 字典半径列 | positive-caps.tex:102 | 每层权重 $2^{\alpha j}$ | 尾部估计失去几何衰减 |
| $K2^{-\alpha(J+1)}$ | $L^1$ 细尺度尾部 | positive-caps.tex:203 | $\mathcal C_K$ 的紧性 | 序列紧推不出紧 |
| $S_h=\sup_i(\int h\phi_i\,d\sigma)/b_i$ | 分离泛函归一 | positive-caps.tex:237 | $\sup_{\mathcal D_K}\int hu\,d\sigma=KS_h$ | 严格分离无法矛盾 |
| $\exp(Cd)2^{M/p}$ | 单块前向代价 | positive-caps.tex:280 | `p:cap-fixed-stop` | 指数里 $M$ 前系数放大 |
| $(\epsilon/2)^{\alpha}$ | 终端帽因子 | positive-caps.tex:353 | `p:cap-total-success` | $\exp(-dL/3)$ 的常数变 |
| $k=q=\lfloor d/8\rfloor,\ \alpha=d/2$ | Riesz 参数 | riesz.tex:14 | $\alpha-k-q\ge1$ | $q$ 层逆距离积分发散 |
| $(3\rho/r)^{\ell}$ | 锚定仿射网基数 | riesz.tex:93 | `p:riesz-tube` | $\rho^{\ell}r^{\alpha-\ell}$ 失去 $\ell$ |
| $\alpha-\ell-k\ge2$ | 锚定壳余量 | riesz.tex:119 | `p:riesz-distance-bound` | 级数和不为 $2$ 控制 |
| $2\cdot9^{d+k}\exp(-t^{2}/8)$ | 算子范数尾概率 | riesz.tex:419-420 | `p:riesz-bins` | 分箱概率形状变 |
| $\P(E_j)\le\exp(-4(j-1)^{2}d)$ | 分箱概率 | riesz.tex:408 | $\sum_j j^{k}\P(E_j)^{1-1/q}\le2$ | 半径幂相消后仍发散 |
| $W=(T+2)2^{M}$ | 状态与终端标签合计 | riesz.tex:270 | $J$ 中的 $W^{1/q}$ | $\log W\le Cd^{2}$ 失去依据 |
| $J=1+C_0^{d}(1+L)W^{1/q}$ | 势递推乘子 | riesz.tex:282 | $V_0\le BJ^{N}$ | $N\log J\le CdT$ 断裂 |
| $B=C_0^{d}\epsilon^{d/2-1}$ | 终端势尺度 | riesz.tex:281 | $U_N=B$ | $\epsilon^{d-1-\alpha}$ 阶不符 |
| $L\le Cd$ | 短程分支结论 | riesz.tex:543 | $\log J\le Cd$ | 壳因子限制失败 |
| `(T+k-1)/k` | 块数的整型写法 | Model.lean:668 | `HaarStreamingCost` | 与 $\lceil T/k\rceil$ 失配 |
| `((k:ℝ)+2)*2^M` | `Nstar` 的形式化 | Model.lean:666 | `HaarStreamingCost` | $\operatorname{Fin}k$ 与 $0,\ldots,k$ 差一 |
| `(a:ℝ)+b ≤ finrank-1` | 终端帽的分摊余量 | StoppingKernel.lean:16 | `capWeight_mass_mixed` | $\epsilon^{q}R^{\beta}$ 拆分不自由 |
| $(\prod_i\lVert\texttt{gramSchmidt}\ v_i\rVert)^{-m}$ | 锚定行列式界 | Graph.lean:45 | `vectorSmoothing_graph_moment` | 每行一个 Jacobian 因子丢失 |
| $(q:ℝ)+m\le a$ | 图模型余量 | Graph.lean:78 | `ae_replica_linearIndependent` | 退化元组集零测失去依据 |
| 15 个合取分量 | `MainStatement` 规模 | Model.lean:732-739 | `OAI.ProjectionMoments.main` | 任一条断言缺失即无处安放 |
