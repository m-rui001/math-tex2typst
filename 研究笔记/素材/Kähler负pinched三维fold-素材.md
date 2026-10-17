# Kähler 负 pinched 三维 fold —— 反推思维链素材笔记

> 素材收集 agent 产出，供终端作者写第一人称反推思维链。唯一正文来源是
> `build\main.tex` 与 `build\sections\*.tex` 的 TeX 源码；公式一律 TeX 原文照抄，
> 保留希腊字母与上下标。论文自带 PDF 有口令、不可读，故不引用 PDF。
> Lean 形式化位于 `E:\math\lean\OAI\Geometry\Kahler\`（108 个 `.lean` 文件，
> 约 18,688 行），比对配置在 `E:\math\lean\ComparatorChallenges\PinchedKahler.json`。
> `E:\math\reasoning_traces\` 下**无本论文 summary**（目录内仅其它论文文件），故跳过。

**被否定的问题来源**：Wu 1967 正规族问题(1)、Wu–Yau 2019 双侧实截面版本猜想 4.3。
**主结论**：存在可缩区域 $M\subset\C^3$ 与完备 Kähler 度量，实截面曲率夹在两个有限负常数之间，
但不存在 Jacobian 处处非零的有界全纯坐标 —— 因此不双全等于任何有界区域。

**结构目录**
- 一、定理总览
- 二、逐引理带批注重构（§2 → §9，覆盖论文全部 theorem/lemma/proposition/definition/remark/corollary）
- 三、叙事时间线（论文自述动机、障碍、文献、构造自述逐字）
- 四、Lean 取证（模块清单、依赖拓扑、statement 差异、卡点、常数落地）
- 五、常数与参数账目表

---

# 一、定理总览

## 1.1 被否定 / 被解决的问题的精确陈述（含文献出处）

论文 §1 逐字给出了两个历史问题的表述（TeX 原文照抄）：

早期表述来自 H.~Wu 关于正规族的工作，`\cite[p.~195, question~(1)]{WuNormal1967}`：

> He asks whether a complete simply connected K\"ahler manifold with nonpositive real
> sectional curvature and holomorphic sectional curvature bounded above by a negative
> constant is biholomorphic to a bounded domain.

即：**完备、单连通 Kähler 流形，实截面曲率非正，全纯截面曲率有负上界 ⇒ 是否双全等于有界区域？**

Wu–Yau 陈述了双侧实截面版本，结论换成"有界伪凸区域"，`\cite[Conjecture~4.3, p.~18]{WuYauSurvey2019}`：

> if a simply connected complete K\"ahler manifold has every real
> sectional curvature between two negative constants, must it be
> biholomorphic to a bounded domain in its complex dimension?

即：**单连通完备 Kähler 流形，每条实截面曲率夹在两个负常数之间 ⇒ 是否双全等于同维有界区域？**

论文 §1 还交代了维 1 的正结论作对照：

> In complex
> dimension one, a complete simply connected surface whose curvature is
> bounded above by a negative constant is biholomorphic to the disk. In higher
> dimension, the existence of bounded holomorphic coordinates is a
> separate global analytic requirement.

以及"单位球本身已经太苛刻"这条已知障碍 `\cite{MostowSiu1980}`、`\cite{Deraux2005}`：

> The unit ball is already too restrictive a candidate in higher
> dimension. Mostow and Siu constructed compact negatively curved
> K\"ahler surfaces not covered by the ball \cite{MostowSiu1980}.
> Deraux reviews their construction and obtains three-dimensional
> examples \cite{Deraux2005}.
> Their lifted metrics on the universal covers have two-sided negative
> sectional bounds by compactness. These non-ball results, however, do
> not exclude a biholomorphism to some other bounded domain; that is
> the stronger obstruction sought here.

主定理否定的是 Wu–Yau 猜想 4.3 的双侧版本（同时也落入 Wu 1967 早期问题的假设范围）。

## 1.2 主定理 TeX 原文照抄

来自 §1 `01-introduction.tex`，标签 `\label{main:theorem}`：

```tex
\begin{theorem}\label{main:theorem}
There exist a contractible domain $M\subset\C^3$, a smooth complete
K\"ahler metric $g$ on $M$, and finite constants $0<A\le B$ such that
\[
 -B\le K_g(\sigma)\le -A<0
\]
for every real two-plane $\sigma\subset T_pM$ and every $p\in M$.
No bounded holomorphic map $F:M\to\C^3$ has a nowhere-vanishing Jacobian
determinant. In particular, $M$ is not biholomorphic to a bounded domain
in $\C^3$.
\end{theorem}
```

主定理之后论文逐字澄清了两条"没有被否定"的东西（重要，防止过度解读）：

> The example has two bounded
> nonconstant holomorphic functions, supplied by its base coordinates.
> Its analytic obstruction concerns a fixed triple of bounded functions
> with independent differentials at every point.
> The domain is nevertheless Stein: the construction supplies a smooth
> strictly plurisubharmonic exhaustion (Lemma~\ref{metric:complete}), so Grauert's solution
> of the Levi problem applies \cite[Theorem~2 and Section~3.4]{GrauertLevi1958}.
> Thus the obstruction is to bounded holomorphic coordinates, not to
> holomorphic convexity.

## 1.3 总体构造分层（分几步、每步产出什么、依赖关系）

论文 §2 开头把整个构造拆成"两个输入 + 一段把输入接到有界映射上的短论证"：

> The construction separates a problem about functions on the ball from a
> curvature estimate.  The first input is a strictly plurisubharmonic
> function with controlled derivatives and an obstruction to a prescribed
> holomorphic real-part bound.  The second turns its complex Hessian bounds
> into a complete metric with uniformly negative real sectional curvature.

据此，构造分五层（依赖自底向上）：

**第 0 层 — 归约骨架（§2）**：产出两个命题 `prop base:existence`（受控位势 $\phi$）与
`prop metric:transfer`（Hartogs 度量迁移），以及引理 `lem map:obstruction`
（把"无全纯实部下界"转成"无 Jacobian 非零有界映射"）。定理 `main:theorem` 的
证明就是"取 $\phi$、取 $\lambda$、套引理"。依赖：`main` ⇒ `base:existence` +
`metric:transfer` + `map:obstruction`。

**第 1 层 — 解析原料（§3、§4）**：
- §3 产出：射影分离集 $\mathcal P_k$、齐次峰多项式 $P_k$（式 `peaks:polynomial`）、
  峰的上界（`lem peaks:bounds`）、patch 上的单峰近似（`lem peaks:patches`）、
  径向轮廓 $f,b,R_0$（`lem peaks:profiles`）。
- §4 产出：正的代表密度 $W_j$（递归 `density:recursion`），定理 `thm density:main`
  给逐层一致的正性、导数界与代表性质。
- 依赖：`density:main` ⇒ `peaks:profiles` + `peaks:bounds` + `peaks:patches`。

**第 2 层 — 对数测试（§5、§6）**：
- §5 产出：正则化对数 $U_k$（式 `tests:regularized`），命题 `prop tests:negative`
  （单一尺度上平均为负 $-d_2$），引理 `lem tests:later`（对**后续**密度仍负 $-d_3$）。
- §6 产出：位势 $\phi=\psi+L\sum_j U_{k_j}$（式 `base:potential`），
  引理 `lem base:convergence`（局部 $C^\infty$ 收敛、$h\ge I$）、
  `lem base:minorant`（$L>5\log Q/d_3$ 时无 pluriharmonic 下界）、
  `lem base:chart-estimates`（所有中心化坐标图原点处直到 4 阶导一致有界）。
- 依赖：`base:existence` ⇒ `base:convergence` + `base:minorant` + `base:chart-estimates`
  ⇒ `tests:later` ⇒ `tests:negative` ⇒ `density:main` ⇒ §3。

**第 3 层 — 全局几何（§7）**：引理 `lem metric:complete` 证明 $M_\phi$ 可缩、
$\mathcal K_\lambda$ 给出光滑正定完备 Kähler 度量且是严格 psh exhaustion。依赖：$\phi$ 光滑。

**第 4 层 — 曲率与 pinching（§8、§9）**：
- §8 产出：点态全纯规范下的完整曲率张量分解 `prop curv:tensor`（式 `curv:tensor-identity`），
  实截面曲率写成标量商 `lem curv:real-plane`（式 `curv:sectional`），
  Gram 行列式代数 `lem curv:gram`，误差项收缩 `lem curv:errors`，
  分子表达式 `curv:negative-numerator`。
- §9 产出：混合实平面代数的非负性与等号分类 `lem pinch:algebra`，
  大 $\lambda$ 一致负性 `lem pinch:positivity`，
  最终固定参数下双侧界 `prop metric:transfer`（§9 末尾证明）。
- 依赖：`metric:transfer` ⇒ `pinch:positivity` ⇒ `pinch:algebra`；
  `pinch:positivity` ⇒ `curv:tensor` + `curv:errors`；
  `metric:transfer` ⇒ `metric:complete` + `curv:*`。

整体闭合：`main:theorem` = `base:existence`（第 1–2 层）+ `metric:transfer`（第 3–4 层）+ `map:obstruction`（第 0 层）。

## 1.4 关键常数 / 参数账目

论文里被"固定选择"的量，按选择顺序（这点 §4 末尾与 §6 证明反复强调）：

1. **模型参数 $a$**：区间 $1<a<2$。§3 `lem peaks:profiles` 固定它，$\alpha=\log a$。
   （Lean 里显式取 $a=3/2$，见 `BaseTestSystem.lean:46`；论文未指定具体数值，只要求 $1<a<2$。）
2. **幅度 $s_1$**：满足 $\alpha^2-2s_1(\cosh\alpha-1)<0$，即
   $\dfrac{\alpha^2}{2(\cosh\alpha-1)}<s_1<1$。
3. **径向轮廓 $f,b$ 与 $R_0$**：$\|f\|_\infty<1$，$f=-s_1$ 于 $[0,\alpha]$，
   $\int_0^\infty e^{-y}f\,dy=0$，$b'-b=f$，$b(0)=0$，且在 $[R_0,\infty)$ 邻域内为零。
   $c_0=\dfrac{1-\|f\|_\infty}{4}$。
4. **间隔 $D_0$**：固定 $D_0>\max\{1,2\sqrt{2R_0}\}$（§3/§4）。增大 $D_0$ 改善单峰近似。
5. **次数比 $Q$**：整数，$k_j=Q^j$，$\ell_j=\sum_{l\le j}k_l$。§4 `thm density:main` 给出阈值
   $Q_0$（依赖 $K_*$ 与固定 patch 数据），要求 $Q\ge Q_0$。
6. **导数常数 $K_*$**：只依赖固定轮廓，$K_*>2C_2/c_0$（$C_2$ 是归一化校正估计常数）。
7. **正则化 $\epsilon$、边界容许 $\eta\in(0,1/2)$、间隔阈值 $D_*,k_*,d_2$**：`prop tests:negative`，
   只依赖固定轮廓数据。$d_2=\Delta/(2D_0^2)$，其中 $\Delta=2s_1(\cosh\alpha-1)-\alpha^2$。
8. **$d_3=d_2/2$ 与 Fourier 误差阈值 $Q_*$**：`lem tests:later`。
9. **振幅 $L$**：$L>5\log Q/d_3$（式 `base:amplitude`）。
10. **度量参数 $\lambda$**：`prop metric:transfer` 的 $\lambda_0=\lambda_0(c,C)$，最后选 $\lambda\ge\lambda_0$。

注意"选择顺序"这条论文自述：
> The normalized correction constant $C_2$ depends only on the fixed patch data.  It determines
> $K_*$; this in turn determines $C_1$; finally $Q_0$ is chosen.

以及 §6 证明末尾关于 $\lambda$ 独立性的自述：
> The metric parameter $\lambda$ in Proposition~\ref{metric:transfer} is chosen only afterward from
> these bounds, so none of the choices above depends on $\lambda$.

## 1.5 [推测] 为什么这样选参数 / 为什么走这条路

`[推测]` 以下均为逆向猜想，非论文断言：

- `[推测]` **为何双对数结构 $\lambda\psi-\log(1-e^\phi|w|^2)$**：Calabi 纤维构造（`\cite{Calabi1979}`）
  把"底流形曲率"与"纤维权曲率 $\partial\bar\partial\phi$"解耦，$\lambda$ 充当一个可调"总放大旋钮"，
  使 §9 能用单一参数把曲率压到负。作者很可能先确认 Hartogs 域能给出完备性（§7 只依赖 $\phi$ psh），
  再把"曲率负"这件事彻底归约成对 $\phi$ 的导数界（§8 张量误差按 $c,C$ 计），于是解析部分与几何部分解耦。

- `[推测]` **为何 $k_j=Q^j$ 指数分离次数**：§6 `base:chart-estimates` 需要"低次数在中心化图里几乎常数、
  高次数指数小"。指数分离使 $\sum_{j\le J}\sqrt{Q^j\delta}$ 与 $\sum_{j>J}e^{-cQ^j\delta}$ 都几何收敛，
  给出与图心无关的一致界。若用 $k_j=j$ 之类线性分离，两个几何级数都不收敛。

- `[推测]` **为何用代表测度而非 Jensen 测度**：论文两处 `\cite{Hedenmalm1989}` 明说代表测度不必满足
  对数均值不等式。作者故意绕开 Jensen 结构，改为**逐密度直接证**对数平均为负（§5），
  再用"相位频率分离"（`lem tests:later`）把负性传给后续密度。这暗示作者试过 Jensen 路线并发现它
  对 $W_j\,d\sigma$ 不成立。`[推测]` 候选失败：直接对 $U_k$ 用次调和函数的 Jensen 不等式，会需要
  测度满足 $\log|f(0)|\le\int\log|f|$，而 Hedenmalm 反例说明代表测度做不到。

- `[推测]` **为何 $L>5\log Q/d_3$ 这个形状**：§6 `base:minorant` 里负平均以 $-Ld_3 N$ 线性下降，
  边界容许（$\psi$ 与 $4\log$）以 $5\log(k_N/\eta)=5(N\log Q+\log(1/\eta))$ 线性上升。要压过它必须
  $Ld_3>5\log Q$，正是该式。`[推测]` 系数 5 来自 $\psi+4\log$ 合并后的 $5\log(1/(1-r_N))$。

---

# 二、逐引理带批注重构

> 每条给四段：(a) TeX 原文照抄；(b) 逐步推演证明机制；(c) 每个假设/常数的机械性理由
> （用在哪、去掉断在哪）；(d) `[推测]` 2–3 条候选失败路线及具体失败机制。
> Lean 名字与行号就地标注。行号取自 `E:\math\lean\OAI\Geometry\Kahler\`。

## 2.1 §2　Two inputs and the bounded-map obstruction（`sec:reduction`）

### 定义：中心化坐标图（式 `base:charts`）

(a) TeX 原文：
```tex
Let $\B=\{z\in\C^2:|z|<1\}$ and put
\[
 \psi(z)=-\log(1-|z|^2),\qquad
 I=(\psi_{i\bar j}).
\]
...
\begin{equation}\label{base:charts}
 T=U\circ T_r,\qquad
 T_r(\zeta)=\left(
 \frac{r+\zeta_1}{1+r\zeta_1},
 \frac{\sqrt{1-r^2}\,\zeta_2}{1+r\zeta_1}
 \right).
\end{equation}
These maps are ball automorphisms with $T(0)=z_0$.  The identity
\[
 1-|T_r(\zeta)|^2
 =\frac{(1-r^2)(1-|\zeta|^2)}{|1+r\zeta_1|^2}
\]
shows that $T^*I$ has the same expression in $\zeta$ as $I$ has in $z$:
the additional terms in $\psi\circ T$ are constant or pluriharmonic.
```

控制条件（式 `base:control`、`base:jets`）：
```tex
\begin{equation}\label{base:control}
 c\,\mathrm{Id}\le h^T(0)\le C\,\mathrm{Id}
\end{equation}
\begin{equation}\label{base:jets}
 \left|\partial_k h^T_{i\bar j}(0)\right|
 +\left|\partial_{\bar\ell}h^T_{i\bar j}(0)\right|
 +\left|\partial_k\partial_{\bar\ell}h^T_{i\bar j}(0)\right|
 \le C
 \qquad(i,j,k,\ell\in\{1,2\}).
\end{equation}
```

(b) 机制：$T_r$ 是把 $0$ 送到 $(r,0)$ 的球自同构（沿第一坐标的 1 维 Möbius、第二坐标按 $\sqrt{1-r^2}$ 缩并）。
恒等式 $1-|T_r|^2=\frac{(1-r^2)(1-|\zeta|^2)}{|1+r\zeta_1|^2}$ 说明 $\psi\circ T_r=-\log(1-|T_r|^2)$
等于 $-\log(1-|\zeta|^2)$ 加 $-\log(1-r^2)$（常数）加 $\log|1+r\zeta_1|^2$（pluriharmonic）。
$\partial\bar\partial$ 杀常数与 pluriharmonic，故 $I\circ T_r$ 在 $\zeta$ 里表达式与 $I$ 在 $z$ 里一致；
在原点它等于 $\mathrm{Id}$ 且一阶导为零 —— 这就是 §6、§8 反复利用的"中心化归一"。

(c) 机械理由：
- "$T^*I$ 表达式不变"用在 §8 张量计算把 $I(0)=\mathrm{Id}$、$I$ 一阶导 $=0$ 当免费事实（`prop curv:tensor` 里
  "the centered-chart expression for $\psi$ differs from $-\log(1-|z|^2)$ by a pluriharmonic function and a constant"）。
  去掉它：§6 `base:chart-estimates` 末尾"$\psi\circ T_r$ 的 4 阶内正导一致有界"就不再成立，图心趋边界时导数爆炸。
- $h^T$ 的 1–2 阶导界 `base:jets` 用在 `prop curv:tensor` 式 `curv:component-errors`（$T_3,T_4$ 的范数按 $C_3,C_4$ 计）。
  去掉它：曲率误差项无一致界，`lem pinch:positivity` 的 $C_{\mathrm e}$ 变成 $\infty$。

(d) `[推测]` 失败路线：
- `[推测]` 用固定（非中心化）坐标控制 $\phi$ 导数：球上 $I$ 在边界爆炸，逐点 $C^k$ 界无法一致，
  §8 的"把基方向按 $\lambda$ 归一"会残留 $1/(1-|z|)$ 因子。作者改用自同构拉回正是为了吸收它。

### 命题 `prop base:existence`（A controlled potential）

(a) TeX 原文：
```tex
\begin{proposition}[A controlled potential]\label{base:existence}
There exist $\phi\in C^\infty(\B,\R)$ and a finite constant $C$ for
which \eqref{base:control} and \eqref{base:jets} hold with $c=1$, and
such that no $H\in\mathcal O(\B)$ and $C_H\in\R$ satisfy
\begin{equation}\label{base:no-minorant}
 \operatorname{Re}H(z)
 \le C_H+4\log\frac1{1-|z|}+\phi(z)
 \qquad(z\in\B).
\end{equation}
\end{proposition}
```

(b) 机制：存在性由 §6 末尾 `proof of base:existence` 组装（见 2.5）。核心是 $\phi=\psi+L\sum_j U_{k_j}$，
$c=1$ 来自 $h=\partial\bar\partial\phi\ge\partial\bar\partial\psi=I$（`lem base:convergence`）。
无下界（`base:no-minorant`）来自 `lem base:minorant` 用代表测度平均趋于 $-\infty$。

(c) 机械理由：$c=1$ 是被"钉死"的归一化（$\phi$ 含 $\psi$ 保证 $h\ge I$），$C$ 有限来自 4 阶导一致界。
`4\log\frac1{1-|z|}` 的系数 4 不是随意：它必须与 `lem map:obstruction` 推得的 $\log|d|^2$ 上界里
$4\log\frac1{1-|z|}$（式 `map:determinant-bound`）逐项吻合，两边同系数才能制造矛盾。

(d) `[推测]` 失败路线：
- `[推测]` 若 $\phi$ 不显含 $\psi$，$h\ge cI$ 需另证；作者直接 $\phi\ge\psi$ 让下界免费。
- `[推测]` 若把边界容许写成 $3\log$ 或 $5\log$，与 Jacobian 估计的 $4\log$ 不匹配，矛盾断链。

### 命题 `prop metric:transfer`（Hartogs metric transfer）

(a) TeX 原文：
```tex
\begin{proposition}[Hartogs metric transfer]\label{metric:transfer}
Let $\phi\in C^\infty(\B,\R)$ satisfy \eqref{base:control} and
\eqref{base:jets} for fixed $0<c\le C<\infty$.  There is a finite
$\lambda_0=\lambda_0(c,C)>0$ such that, for every
$\lambda\ge\lambda_0$, the domain $M_\phi$ in
\eqref{metric:domain} is contractible and the tensor
$g_\lambda=2\operatorname{Re}\widehat g_\lambda$ defined by
\eqref{metric:potential} is a smooth geodesically complete K\"ahler
metric.  For this fixed $\lambda$ there are constants
$0<A_\lambda\le B_\lambda<\infty$ such that
\[
 -B_\lambda\le K_{g_\lambda}(\sigma)\le-A_\lambda<0
\]
for every point of $M_\phi$ and every real two-plane $\sigma$ in its
tangent space.
\end{proposition}
```
其中式 `metric:domain`、`metric:potential` 与约定：
```tex
M_\phi=\{(z,w)\in\B\times\C:t(z,w)<1\},
 \qquad t(z,w)=e^{\phi(z)}|w|^2.
\]
\begin{equation}\label{metric:potential}
 \mathcal K_\lambda=\lambda\psi-\log(1-t),\qquad
 \widehat g_\lambda=\partial\bar\partial\mathcal K_\lambda.
\end{equation}
Our real metric convention is
$g_\lambda=2\operatorname{Re}\widehat g_\lambda$.
```

(b) 机制：可缩性 + 完备性 = `lem metric:complete`（§7，对任意 $\lambda>0$ 成立，不依赖大 $\lambda$）。
双侧曲率界 = §9 `proof of metric:transfer`：先 `lem pinch:positivity` 得 $\lambda_0$，
取 $\lambda\ge\lambda_0$，再在 $x\in[0,X]$ 用紧性、在 $x\to\infty$ 用rescaling极限张量 $\widetilde R_x=-S_{h+V}+O_\lambda(x^{-1/2})$。
Lean 端 `metric_transfer`（`HartogsTransfer.lean:22`）= `metricThreshold` + 四个成分引理拼接：
`hartogs_contractible`、`hartogsMetric_isKahler`（`MetricCalculus.lean:805`）、
`hartogsMetric_geodesicallyComplete`（`HartogsCompletenessSupport.lean:319`）、
`hartogsMetric_uniform_pinching`（`HartogsPinching.lean:21`）。

(c) 机械理由：$0<c\le C$ 是 $h$ 的椭圆性下界与 $C^2$ 上界：$c$ 用在 `lem pinch:positivity` 式 `curv:D-bounds`
（$G^{-1}$ 界 $\|G^{-1}\|\le1/(\lambda+cx)$），$C$ 用在 $D\le(1+2x)h$ 与特征值 $d\in[c,C]$。
$\lambda_0(c,C)$ 只在 $q/\lambda$ 与 $\lambda/q$ 两 regime 反证时出现（见 2.7）。

(d) `[推测]` 失败路线：
- `[推测]` 若 $c=0$（半正定而非正定），`lem pinch:positivity` 里 $m_D\ge c(1+x)m_I$ 失效，退化平面无法压制。
- `[推测]` 若度量约定用 $\operatorname{Re}\widehat g$ 而非 $2\operatorname{Re}\widehat g$，`lem curv:real-plane`
  的分母 $4a_{\widehat g}$ 与 `curv:sectional` 的 $2a_{\widehat g}$ 全部差因子 2，单位盘常数 $-2$（`lem curv:real-plane` 末）对不上。

### 引理 `lem map:obstruction`（The Jacobian on the zero section）

(a) TeX 原文：
```tex
\begin{lemma}\label{map:obstruction}
Let $\phi\in C^\infty(\B,\R)$ have the nonexistence property in
Proposition~\ref{base:existence}: no holomorphic $H$ and real constant
$C_H$ satisfy \eqref{base:no-minorant}.  Then no bounded holomorphic
map $F:M_\phi\to\C^3$ has a nowhere-vanishing complex Jacobian
determinant.
\end{lemma}
```

(b) 机制（逐步，含常数来源）：
1. 设 $F=(F_1,F_2,F_3)$，取 $B\ge1$ 使 $|F_\ell|\le B$。$d(z)=\det\frac{\partial(F_1,F_2,F_3)}{\partial(z_1,z_2,w)}(z,0)$
   全纯且无零。
2. **基 Cauchy 估计**（式 `map:base-cauchy`）：固定 $z$，$\delta=1-|z|$，圆盘 $\{z+\zeta e_j:|\zeta|<\delta\}$
   含于基球（**只在零截面取**，不需一致纤维半径）。半径 $\to\delta$ 时 Cauchy：
   $|\partial_{z_j}F_\ell(z,0)|\le B\delta^{-1}$。
3. **纤维 Cauchy 估计**（式 `map:fiber-cauchy`）：该 $z$ 上纤维是半径 $e^{-\phi(z)/2}$ 的盘，Cauchy：
   $|\partial_w F_\ell(z,0)|\le B e^{\phi(z)/2}$。
4. 行列式展开 6 项，每项 = 一个基导 $\times$ 一个基导 $\times$ 一个纤维导：
   $|d(z)|\le 6B^3\delta^{-2}e^{\phi(z)/2}$，取对数平方：
   $\log|d(z)|^2\le 2\log6+6\log B+4\log\frac1{1-|z|}+\phi(z)$（式 `map:determinant-bound`）。
   常数核对：$\log(6B^3\delta^{-2}e^{\phi/2})^2=2\log6+6\log B+4\log(1/\delta)+\phi$，逐项吻合。
5. $\B$ 单连通 + $d$ 无零 ⇒ 存在全纯对数 $\ell$（用 $d^{-1}\partial d$ 的原函数）。$H=2\ell$ 使 $\operatorname{Re}H=\log|d|^2$，
   与 `base:no-minorant`（同 $4\log$ 系数）矛盾。

Lean 端逐条对齐 `Obstruction.lean`：`cauchy_direction`（:78）、`jacobian_base_bound`（:136，$B/(1-\|z\|)$）、
`jacobian_fiber_bound`（:165，$B\exp(\phi z/2)$）、`det_bound_columns`（:173，$\|M.\det\|\le6abc$，
显式展开 `Matrix.det_fin_three` 六项三角不等式）、`jacobian_det_bound`（:213）、`jacobian_log_bound`（:228，
右端 `2*log 6 + 6*log B + 4*log(1/(1-‖z‖)) + φ z` 与论文完全一致）、`exists_holomorphic_log`（:50）、
`map_obstruction`（:249，`let B' := max B 1` 处理 $B\ge1$）。

(c) 机械理由：
- "$B\ge1$"用在 `jacobian_log_bound` 的 `hB1 : 1 ≤ B`（取 $\log B$ 需 $B>0$，$B\ge1$ 保证 $\log B\ge0$ 与放缩干净）。
- "无零沿整个零截面"用在第 5 步全局对数存在：Lean `exists_holomorphic_log` 要求 $\forall z\in$ ball, $d z\ne0$
  （`map_obstruction:255` 的 `hzero`）。论文末尾明确："It gives no assertion that a bounded map's determinant
  vanishes identically."
- $6=\det$ 展开项数；$\delta^{-2}$ 来自两列基导。

(d) `[推测]` 失败路线：
- `[推测]` 若在整条纤维（而非零截面）取基 Cauchy，需要一致纤维半径下界，而 $e^{-\phi/2}$ 随 $z$ 变，界会退化。
  论文明说"It is taken entirely on the zero section"正是规避此。
- `[推测]` 若 $d$ 允许在零截面某点为零，全局对数断链，$H$ 造不出 —— 但这恰好是"有界坐标"要排除的，不能放松。

### `proof of Theorem main:theorem`

(a) TeX 原文：
```tex
\begin{proof}[Proof of Theorem~\ref{main:theorem}]
Choose $\phi$ from Proposition~\ref{base:existence}, and then choose
$\lambda$ as in Proposition~\ref{metric:transfer}.  The domain
$M=M_\phi\subset\C^3$ is contractible and carries the asserted smooth
complete K\"ahler metric with two uniform negative real-sectional
bounds.  Lemma~\ref{map:obstruction} excludes a bounded holomorphic
map to $\C^3$ with nowhere-vanishing Jacobian.  A biholomorphism to a
bounded domain would be such a map: the chain rule applied to its
holomorphic inverse makes its Jacobian invertible everywhere.
\end{proof}
```

(b) 机制：三输入直接装配。"反演链式法则 ⇒ Jacobian 处处可逆"是有界坐标障碍到"不双全等于有界区域"的最后一跳。
Lean：`main_of_controlledPotential`（`HartogsTransfer.lean:32`）先证 `1 ≤ C`（用 `hctl 0 ... (EuclideanSpace.single 0 1)`，
:35），再 `metric_transfer 1 C`，再 `hartogs_obstruction`（`HartogsTopologySupport.lean:148`）给 `NoBoundedCoordinates`
与 `¬ BiholomorphicToBoundedDomain`。

(c) 机械理由：Lean 里 `1 ≤ C` 这一步是必需的，因为 `metric_transfer` 签名要求 $0<c\le C$，而
`ControlledPotential` 只给了 `ChartControl φ 1 C`；论文用 $c=1$ 保证。

(d) `[推测]`：无独立失败路线（纯装配）。`[推测]` `no_bounded_realization`（把 Jacobian 非零有界映射 ⟹ 有界实现）
是"链式法则"的 Lean 化，若映射非双全只给 Jacobian 非零（局部双全）则不触发 —— 但 `MapObstruction` 定义
（`Definitions.lean:34`）只否定"处处可逆"，与论文一致。

## 2.2 §3　Separated homogeneous peaks（`sec:peaks`）

### 引理 `lem peaks:mean-criterion`（Representing-mean criterion）

(a) TeX 原文：
```tex
\begin{lemma}[Representing-mean criterion]\label{peaks:mean-criterion}
Let $u$ be a continuous real function on $\mathbb B$.  Suppose there
are radii $0<r_N<1$ and representing probabilities $\mu_N$ on $S$
such that
\[
 \int_S u(r_N\xi)\,d\mu_N(\xi)\longrightarrow-\infty.
\]
Then no holomorphic function $H$ on $\mathbb B$ and constant $C_H$
satisfy $\operatorname{Re}H\le C_H+u$ on $\mathbb B$.
\end{lemma}
```
代表概率定义（式 `peaks:mean-criterion` 之前）："A probability measure $\mu$ on $S$ represents holomorphic
evaluation at zero if $\int_S p(\xi)\,d\mu(\xi)=p(0)$ for every holomorphic polynomial $p$."

(b) 机制：固定 $r_N<1$，$H$ 的 Taylor 多项式在 $r_NS$ 上一致收敛，代表恒等式给出
$\int_S\operatorname{Re}H(r_N\xi)d\mu_N=\operatorname{Re}H(0)$（常数，不依赖 $N$）。
把它代入假设不等式 $\operatorname{Re}H\le C_H+u$ 积分：$\operatorname{Re}H(0)\le C_H+\int u\,d\mu_N\to-\infty$，矛盾。

(c) 机械理由：$u$ 只需连续（不需 psh）；起作用的是"$\mu_N$ 代表全纯均值"。
一致性收敛把代表性质从多项式扩到 $H$。这是整个解析构造的"引擎"：后续一切只为造出满足假设的 $u,\mu_N,r_N$。

(d) `[推测]` 失败路线：
- `[推测]` 若 $\mu_N$ 只是概率而不代表 $0$，$\int\operatorname{Re}H(r_N\xi)d\mu_N$ 无法换成 $\operatorname{Re}H(0)$，
  引擎失效 —— 这正是 §4 要死磕"代表"的原因。
- `[推测]` 若 $u(r_N\xi)$ 的负发散被 $H$ 增长抵消（例如 $u$ 只沿部分方向负），平均不下到 $-\infty$；
  §5 用"每个 patch 都负、总和 $\ge N\cdot(-d)$"保证各向发散（见 2.4）。

### 射影度量与球测度（式 `peaks:sphere-measure`）

(a) TeX 原文（定义段）：
```tex
Identify complex lines in $\mathbb C^2$ with points of
$\mathbb {CP}^1$.  For unit representatives define
\[
 d([\xi],[p])=\sqrt{1-|\langle\xi,p\rangle|^2},
\]
...
This equals the operator norm distance between the rank-one
orthogonal projections onto the two lines: their difference has
trace zero and eigenvalues
$\pm\sqrt{1-|\langle\xi,p\rangle|^2}$.  The triangle inequality
for the operator norm therefore proves that $d$ is a metric.
```
```tex
\begin{equation}\label{peaks:sphere-measure}
 d\sigma=du\,\frac{d\theta}{2\pi}\frac{d\gamma}{2\pi},
 \qquad 0\le u\le1.
\end{equation}
In particular, a projective cap $d(\xi,p)<s$ has measure $s^2$
for $0\le s\le1$.
```

(b) 机制：取酉坐标 $\xi=(e^{i\theta}\cos v,e^{i\gamma}\sin v)$，体积元 $\cos v\sin v\,dv\,d\theta\,d\gamma$，
换元 $u=\cos^2v$ 得 $du=2\cos v\sin v\,dv$，归一化后成 `peaks:sphere-measure`。cap 测度 $s^2$：$d<s$ 即
$\sin^2 v<s^2$ 即 $u=\cos^2 v>1-s^2$，测度 $=\int_{1-s^2}^1du=s^2$。

(c) 机械理由：cap 测度 $s^2$（不是 $s$ 或 $s^3$）是 §3 计数界 `peaks:count` 与局部计数 $C(1+u)^2$ 的来源
（面积 $\propto$ 半径$^2$）；也是 §4 里 patch 测度式 `peaks:patch-measure` 的推手。

(d) `[推测]`：`[推测]` 论文用投影度量而非 chordal/球面度量，是因为 $|\langle\xi,p\rangle|^2=1-d^2$ 让
峰 $|\langle\xi,p\rangle|^k=(1-d^2)^{k/2}\le e^{-kd^2/2}$ 直接给出高斯尾（`lem peaks:bounds` 第 129–132 行）。
`[推测]` 换用其它度量只会多算子范数等价常数。

### 引理 `lem peaks:bounds`（Peak bounds）

(a) TeX 原文：
```tex
\begin{lemma}[Peak bounds]\label{peaks:bounds}
There are absolute constants $C,c>0$, independent of $D_0\ge1$,
such that
\begin{equation}\label{peaks:count}
 \frac{k}{D_0^2}\le N_k\le\frac{4k}{D_0^2}
\end{equation}
and, for every $\xi\in S$ and $u\ge0$,
\begin{equation}\label{peaks:gaussian}
 \sum_{\substack{p\in\mathcal P_k\\\sqrt{k}d(\xi,p)\ge u}}
       |\langle\xi,p\rangle|^k\le Ce^{-cu^2}.
\end{equation}
Consequently,
\begin{equation}\label{peaks:global}
 |P_k(z)|\le C|z|^k\quad(z\in\mathbb C^2),
 \qquad
 \int_S|P_k|\,d\sigma\le\frac{2N_k}{k+2}.
\end{equation}
\end{lemma}
```
峰多项式定义（式 `peaks:polynomial`）：$P_k(z)=\sum_{p\in\mathcal P_k}\langle z,p\rangle^k$，
$\mathcal P_k$ 是 $\mathbb{CP}^1$ 中极大 $D_0/\sqrt k$-分离代表集，$N_k=|\mathcal P_k|$（$k\ge D_0^2$）。

(b) 机制（逐步）：
1. **计数**（`peaks:count`）：$\rho=D_0/\sqrt k\le1$。极大性 ⇒ 半径 $\rho$ 的 cap 覆盖 $S$ ⇒ $1\le N_k\rho^2$
   （用 cap 测度 $\rho^2$）；分离性 ⇒ 半径 $\rho/2$ 的 cap 内点互斥 ⇒ $N_k(\rho/2)^2\le1$。合成 $k/D_0^2\le N_k\le4k/D_0^2$。
2. **局部计数**：距固定线 $\le u/\sqrt k$ 的中心，放半径 $1/(3\sqrt k)$ 的 cap，内点互斥且含于半径 $(u+1/3)/\sqrt k$ 的 cap。
   比较测度得个数 $\le9(u+1/3)^2$（当 $(u+1/3)/\sqrt k\le1$）；否则半径 $>1$，个数 $\le9k\le9(u+1/3)^2$。故一律 $\le C(1+u)^2$。
3. **高斯尾**（`peaks:gaussian`）：$|\langle\xi,p\rangle|^k=(1-d^2)^{k/2}\le e^{-kd^2/2}$。环带
   $n\le\sqrt k d<n+1$ 的贡献 $\le C(n+2)^2e^{-n^2/2}$（局部计数 × 高斯），从 $n=\lfloor u\rfloor$ 求和，
   多项式因子被更弱高斯指数吸收，$0\le u\le2$ 被常数吸收。
4. **全局界**：取 $u=0$ 得 $|P_k(\xi)|\le C$ 于 $S$，齐次性扩到 $\C^2$：$|P_k(z)|\le C|z|^k$。
5. **$L^1$ 界**：$\int_S|\langle\xi,p\rangle|^k d\sigma=\int_0^1u^{k/2}du=\frac2{k+2}$（用 `peaks:sphere-measure`），
   对 $N_k$ 项三角不等式得 $\int_S|P_k|\le\frac{2N_k}{k+2}$。

Lean：`BasePacking.lean`（`ProjectivelySeparated` :20，`exists_separated_cover` :75），
`BasePeakBounds.lean`（计数与高斯），`BaseGaussian.lean`（192 行，高斯尾机器化）。

(c) 机械理由：
- "$C,c$ 与 $D_0$ 无关"是 §4 `lem peaks:profiles` 末"enlarge $D_0$ 改善单峰近似而不改轮廓"的前提；若常数随 $D_0$ 涨就白扩。
- $k\ge D_0^2$（$\rho\le1$）用在覆盖论证（cap 测度公式只在半径 $\le1$ 成立）。
- $L^1$ 界 $\frac{2N_k}{k+2}\sim\frac2{D_0^2}$ 用在 §5 `tests:off-patch`：off-patch 误差 $C_{\rm off}\epsilon^2 N_k/k$
  最终被 $\Delta/(2D_0^2)$ 吸收，靠的就是 $N_k/k\le4/D_0^2$。

(d) `[推测]` 失败路线：
- `[推测]` 若峰用非齐次多项式，全局界 $|P_k(z)|\le C|z|^k$（含球外）不再成立，§6 `base:chart-estimates`
  的"低次数 polydisk $A_k$ 可越界估计"就崩，因为那一步依赖 $P_k$ 是 entire 齐次。
- `[推测]` 若 $\mathcal P_k$ 不取"极大分离"而是稠密网格，$N_k$ 失控（$\sim k$ 无 $D_0^{-2}$ 因子），$L^1$ 界失效。

### 引理 `lem peaks:patches`（Patch estimates）

(a) TeX 原文（含式 `peaks:patch-definition`）：
```tex
\begin{equation}\label{peaks:patch-definition}
 y=-k\log|\xi_1|,\qquad
 \mathcal U_{k,p}=\{\xi\in S:0\le y<R_0\}.
\end{equation}
...
\begin{lemma}[Patch estimates]\label{peaks:patches}
Fix $R_0>0$.  If $D_0>\max\{1,2\sqrt{2R_0}\}$ and
$k\ge\max\{D_0^2,2R_0\}$, the patches $\mathcal U_{k,p}$
are pairwise disjoint.  On each patch,
\begin{equation}\label{peaks:patch-measure}
 d\sigma=\frac2k e^{-2y/k}\,dy\,
             \frac{d\theta}{2\pi}\frac{d\gamma}{2\pi},
\end{equation}
and
\begin{equation}\label{peaks:single-peak}
 |P_k(\xi)-e^{-y}e^{ik\theta}|
 \le C e^{-c(D_0-\sqrt{2R_0})^2}.
\end{equation}
Outside their union,
\begin{equation}\label{peaks:off-patch}
 |P_k(\xi)|\le Ce^{-cR_0}.
\end{equation}
The constants $C,c$ can be chosen independently of $R_0,D_0,k$.
\end{lemma}
```

(b) 机制：
1. patch 射影半径 $\le\sqrt{2R_0/k}$（因 $d=\sqrt{1-|\xi_1|^2}=\sqrt{1-e^{-2y/k}}$，$y<R_0$ 时 $\le\sqrt{2R_0/k}$）；
   中心分离 $D_0/\sqrt k$，条件 $D_0>2\sqrt{2R_0}$ 使两半径和 $<D_0/\sqrt k$ ⇒ 互斥。
2. 测度式 `peaks:patch-measure`：$|\xi_1|^2=e^{-2y/k}$，代入 `peaks:sphere-measure`（$u=|\xi_1|^2$），$du=\frac2k e^{-2y/k}dy$。
3. 单峰近似：$\xi\in\mathcal U_{k,p}$、$p'\ne p$ 时 $\sqrt k d(\xi,p')\ge D_0-\sqrt{2R_0}$（度量三角不等式），
   故其余峰按 `peaks:gaussian`（取 $u=D_0-\sqrt{2R_0}$）被 $Ce^{-c(D_0-\sqrt{2R_0})^2}$ 控制；本峰恰 $e^{-y}e^{ik\theta}$。
4. off-patch：每中心 $kd^2\ge k(1-e^{-2R_0/k})\ge R_0$（用 $k\ge2R_0$ 与 $1-e^{-v}\ge v/2$，$v\le1$），再套 `peaks:gaussian`。

(c) 机械理由：$e^{-c(D_0-\sqrt{2R_0})^2}$ 是 §5 `tests:patch-error` 的第一项误差，靠扩 $D_0$ 压小；
$Ce^{-cR_0}$ 是 `lem peaks:profiles` 里"$aP_k\le1/2$ off patches"的来源（$R_0$ 扩到 $aCe^{-cR_0}\le1/2$）。
$D_0>\max\{1,2\sqrt{2R_0}\}$ 同时保证互斥与 $D_0-\sqrt{2R_0}>0$。

(d) `[推测]`：`[推测]` 若 $R_0$ 太小，`peaks:profiles` 的 $b$ 支撑放不下，`tests:later` 的负平均裕度不够。

### 引理 `lem peaks:profiles`（Radial profiles）

(a) TeX 原文：
```tex
\begin{lemma}[Radial profiles]\label{peaks:profiles}
Fix $1<a<2$ and put $\alpha=\log a$.  One can choose $0<s_1<1$,
smooth real functions $f,b$ on $[0,\infty)$, and $R_0>0$ such that
\begin{equation}\label{peaks:profile-negativity}
 \alpha^2-2s_1(\cosh\alpha-1)<0,
\end{equation}
\begin{equation}\label{peaks:profile-identities}
 \|f\|_\infty<1,\quad f=-s_1\ \text{on }[0,\alpha],\quad
 \int_0^\infty e^{-y}f(y)\,dy=0,\quad
 b'-b=f,\quad b(0)=0.
\end{equation}
Both functions vanish on a neighborhood of $[R_0,\infty)$.
Moreover, $R_0$ can be chosen so that $|aP_k|\le1/2$ off the
patches whenever the hypotheses of Lemma~\ref{peaks:patches} hold.
\end{lemma}
```

(b) 机制（构造顺序，含常数来源）：
1. 严格不等式 $2(\cosh\alpha-1)>\alpha^2$（来自 $\cosh$ 级数：$\cosh\alpha-1=\alpha^2/2+\alpha^4/24+\cdots>\alpha^2/2$）
   允许 $\frac{\alpha^2}{2(\cosh\alpha-1)}<s_1<1$。$a<2$ 保证 $s_1(1-e^{-\alpha})<e^{-\alpha}$。
2. 取小 $\delta$ 与截断 $\chi$（$[0,\alpha]$ 上为 1，$y\ge\alpha+\delta$ 为 0）。$\delta$ 足够小使
   $N=s_1\int_0^\infty e^{-y}\chi(y)dy<e^{-(\alpha+2\delta)}$。
3. 取支撑严格在 $\alpha+2\delta$ 之后的光滑 $\nu$（$0\le\nu\le1$），逼近足够长区间指标使
   $P=\int_0^\infty e^{-y}\nu(y)dy>N$。
4. $f=-s_1\chi+(N/P)\nu$：plateau 满足，加权积分为零（$-s_1\int e^{-y}\chi+(N/P)\int e^{-y}\nu=-N+N=0$），
   支撑不交 ⇒ $\|f\|_\infty\le\max\{s_1,N/P\}<1$。
5. $b(y)=e^y\int_0^y e^{-v}f(v)dv$：验证 $b'-b=f$、$b(0)=0$。越过 $f$ 支撑后加权积分为零 ⇒ $b$ 紧支。
   近零 $b(y)=-s_1(e^y-1)$，在半直线边界光滑（不需把 $f$ 零延到负轴）。
6. $R_0$ 取大于两支撑，再扩至 $aCe^{-cR_0}\le1/2$。

(c) 机械理由：
- `profile-negativity`（$\alpha^2-2s_1(\cosh\alpha-1)<0$）：在 §5 `tests:model-sign` 里这个量正是 $I_0(1)=-\Delta$，
  即负平均的"种子"。$\Delta=2s_1(\cosh\alpha-1)-\alpha^2>0$ 后续给 $d_2$。
- 加权抵消 $\int e^{-y}f=0$：§4 `density:recursion` 的 $b'-b=f$ 用它保证校正项对全纯矩**精确**归零（`lem density:moments`）。
- $f=-s_1$ on $[0,\alpha]$：`tests:model-sign` 最后一步"$=α²-2s_1(\cosh α-1)$"要用它把 $\int_0^\alpha$ 提出 $-s_1$。
- $\|f\|_\infty<1$：保证 $c_0=\frac{1-\|f\|_\infty}{4}>0$（§4），进而 §4 `density:Q-conditions` 里
  $F=1-4c_0<1-2c_0$ 让 $Q$ 条件相容。

(d) `[推测]` 失败路线：
- `[推测]` 若 $\int e^{-y}f\ne0$，则 $b$ 在 $f$ 支撑外非零（$b=e^y\cdot\text{const}\ne0$），失去紧支，
  §4 的相位平移归一（"radial moment 归零"）失效，代表性质被破坏。
- `[推测]` 若 $s_1$ 取到使 $\alpha^2-2s_1(\cosh\alpha-1)>0$，则 $I_0(1)>0$，对数平均不负，`prop tests:negative` 崩。
- `[推测]` $1<a<2$ 的上界 $a<2$ 用在 $s_1(1-e^{-\alpha})<e^{-\alpha}$（即 $N<e^{-(\alpha+2\delta)}$ 可满足）；
  若 $a\ge2$，$\alpha\ge\log2$，可能选不到足够小 $N$ 使 $\nu$ 撑出 $P>N$ —— 但论文只用 $a<2$ 一处。

Lean 端把 $f,b,R_0$ 打包成 `structure RadialProfiles (a : ℝ)`（`BaseProfiles.lean:172`），字段与论文逐条对应：
`s`（$=s_1$）:173、`F`（$=\|f\|_\infty$ 上界）:174、`R`（$=R_0$）:175、`cutoff`:176、`f`:177、`b`:178；
字段 `plateau`（:189）= 论文 $f=-s$ on $[0,\log a]$；`cancellation`（:190）= $\int_{\Ioi 0}e^{-y}f=0$；
`ode`（:191）`HasDerivAt b (b y+f y)` = $b'-b=f$；`b_zero`（:192）；`tail`（:193）支撑截止；
`negativity`（:194）= 式 `peaks:profile-negativity`。
存在性 `exists_radialProfiles`（:196）用 `Real.smoothTransition` 构造 `leftCut/rightCut`（:55,57）作 $\chi,\nu$，
`profilePrimitive` 作 $b$。核心严格二次不等式 `cosh_strict_quadratic`（:20，$x^2<2(\cosh x-1)$）
用 `Real.hasSum_cosh` 级数前三项 $\ge1+x^2/2+x^4/24$ 证 —— 与论文"$\cosh$ 级数"一致。
`exists_profile_amplitude`（:26）给 $s$。`profile_transition_width`（:37）是 $s_1(1-e^{-\alpha})<e^{-\alpha}$ 的
机器化（用连续性把 $\delta=0$ 的严格不等式开到小 $\delta$）。

## 2.3 §4　Positive representing densities（`sec:densities`，含 construction 与 estimates 两文件）

### 次数选择（式 `density:degrees`）与递归定义（式 `density:recursion`）

(a) TeX 原文：
```tex
Keep the profiles $f,b,R_0$ from Lemma~\ref{peaks:profiles} fixed,
and put
\[
 c_0=\frac{1-\|f\|_\infty}{4}>0.
\]
Fix any $D_0>\max\{1,2\sqrt{2R_0}\}$.  For an integer $Q\ge2$
large enough that every degree below meets the patch thresholds,
put
\begin{equation}\label{density:degrees}
 k_j=Q^j,\qquad \ell_0=0,\qquad
 \ell_j=\sum_{l=1}^j k_l\quad(j\ge1).
\end{equation}
Thus $\ell_{j-1}<k_j$ and $\ell_j<2k_j$.
```
递归（式 `density:recursion`）：
```tex
\begin{equation}\label{density:recursion}
 \begin{split}
 A_{j,p}(\xi)
 &=e^{2y/k}\operatorname{Re}\left[
     e^{ik\theta}\left(f(y)S_p(\theta)
               -b(y)\frac{S_p'(\theta)}{ik}\right)\right],\\
 W_j&=W_{j-1}+\sum_{p\in\mathcal P_k}A_{j,p},
 \end{split}
\end{equation}
```
其中 $S_p(\theta)=W_{j-1}(e^{i\theta}p)$，校正项在 patch 外零延拓。$T$ 为相位导数，
水平向量 $Z$ = 欧氏单位实切向量且 $\langle Z,\xi\rangle=0$。

(b) 机制：设计动机在 §4 construction 第 30–43 行讲透：相位模式 $e^{is\theta}$（$|s|\le\ell_{j-1}$）
乘 $e^{ik\theta}$ 移到频率 $m=k+s>0$，其共轭可与全纯单项式 $\xi_1^m=e^{-my/k}e^{im\theta}$ 配对。
消去表面测度因子 $e^{-2y/k}$ 后，若系数为 $b'-\frac mk b$ 则该径向矩归零，因为
$e^{-my/k}(b'-\frac mk b)=\frac d{dy}(e^{-my/k}b)$，而 $b(0)=b(R_0)=0$。
恒等式 $f=b'-b$ 于是把该模式系数规定为 $f-\frac sk b$，求和即 `density:recursion`。

(c) 机械理由：
- $\ell_{j-1}<k_j$（即 $m=k+s>0$）：保证配对频率全正，§4 `density:moments` 里 $l=n=0$ 情形"$\theta$ 平均给零"成立。
- $\ell_j<2k_j$：用在 `lem tests:later` 把频率下界 $(Q-2)k_{\nu-1}$ 算出来。
- $c_0=\frac{1-\|f\|_\infty}{4}$：§4 完成证明时 $K_*>2C_2/c_0$ 与 $Q^{-1/2}\le c_0/2$ 都要它为正且够小。

(d) `[推测]`：`[推测]` 若 $k_j$ 不取 $Q^j$ 而取任意递增，$\ell_{j-1}<k_j$ 未必成立，模式配对可能落到非正频率，
矩归零论证断。`[推测]` 系数里 $-b\cdot S_p'/(ik)$ 那一项专为消 $s\ne0$ 的相位漂移；若删它只有 $s=0$ 模式归零，
代表性质只剩常数多项式。

Lean 端：`density`（`BaseDensityDefinitions.lean:38`）用匹配 `| 0 => fun _ => 1`、`| j+1 => ... + ∑ p ∈ P (Q^(j+1)), densityCorrection ...`。
`densityCorrection`（:35）用 `if Real.exp (-R/k) < ‖bracket z p‖ then ... else 0` 编码"patch 支撑内、外零延拓"
（$y=-k\log|\xi_1|<R$ 等价 $|\xi_1|>e^{-R/k}$）。`densityCorrectionRaw`（:28）显式拆实部为
`(phase^k).re`、`(phase^k).im` 与 `phaseDerivative`（:20，$=$ $T$），与 $f S_p-b S_p'/(ik)$ 对齐。

### 引理 `lem density:smooth`（Smoothness of the corrections）

(a) TeX 原文：
```tex
\begin{lemma}[Smoothness of the corrections]\label{density:smooth}
Every $W_j$ defined by \eqref{density:recursion} is a smooth real
function on $S$.
\end{lemma}
```

(b) 机制：归纳。$W_0=1$ 光滑。在 patch 中心圆用光滑坐标 $(\theta,\zeta)\mapsto(e^{i\theta}\sqrt{1-|\zeta|^2},\zeta)$，
$y=-\frac k2\log(1-|\zeta|^2)$；`density:recursion` 各项在此坐标（含 $\zeta=0$）光滑，且不依赖横向极角 $\gamma$
（后者在 $\zeta=0$ 奇异）。外边界处 $f,b$ 在 $R_0$ 邻域为零 ⇒ 校正在 patch 边界邻域恒零 ⇒ 零延拓光滑。有限求和保光滑。

(c) 机械理由："各项不依赖 $\gamma$"是关键 —— 否则 $\gamma$ 在中心圆无法定义，$e^{ik\theta}$ 关于 $\theta$ 虽周期
但 $y$ 关于 $\zeta$ 的 $\log$ 需 $\zeta\ne0$。不依赖 $\gamma$ 让中心圆光滑。"$f,b$ 在 $R_0$ 邻域为零"用在零延拓 $C^\infty$。

(d) `[推测]`：`[推测]` 若 $f,b$ 只紧支到 $R_0$ 而非在其邻域恒零，零延拓只 $C^0$，§5 对 $U_kW_j$ 积分
求导（Fourier 系数 $B_\epsilon$ 界需 $V''$ 有界）会缺光滑性。

### 定理 `thm density:main`（Uniform representing densities）

(a) TeX 原文：
```tex
\begin{theorem}[Uniform representing densities]\label{density:main}
There is a constant $K_*>0$, depending only on the fixed profiles
$f,b$ and $R_0$, with the following property.  For every fixed
$D_0>\max\{1,2\sqrt{2R_0}\}$ there is an integer threshold $Q_0$
such that, for every integer $Q\ge Q_0$ and every choice of the
separated sets above, the recursion \eqref{density:recursion}
has the following properties for all $j\ge1$:
\begin{enumerate}
\item $W_j$ is smooth and strictly positive, and $W_j\,d\sigma$
represents holomorphic evaluation at zero.  In particular it is
a probability measure.
\item Under global phase rotation, $W_j$ has frequencies only
between $-\ell_j$ and $\ell_j$, and its mean on every phase orbit
is exactly one.
\item At every point of $S$,
\begin{equation}\label{density:uniform-bounds}
 \begin{gathered}
 c_0W_{j-1}\le W_j\le2W_{j-1},\\
 |ZW_j|\le K_*\sqrt{k_j}\,W_j,
 \qquad |TW_j|\le K_*k_jW_j
 \end{gathered}
\end{equation}
for every unit horizontal vector $Z$.
\end{enumerate}
The threshold $Q_0$ may also be enlarged to impose any fixed lower
threshold on the degrees $k_j$.
\end{theorem}
```

(b) 机制：分两部分证 —— `lem density:moments`（精确矩与频率，先于正性成立）+ §4 estimates 的
`Completion of the proof of Theorem density:main`（正性与导数界，用一次归纳）。
归纳核心：假设到 $j-1$ 成立，则 `density:central-derivatives`（$\frac{|S_p'|}{kS_p}\le\frac{K_*}Q$，
$\frac{|S_p''|}{k^2S_p}\le\frac{C_1}{Q^2}$）+ 水平比较 `density:central-comparison`（比值夹在
$e^{\pm K_*D_R/\sqrt Q}$）建立 `lem density:normalized-patch` 的归一假设，得 $|A_{j,p}|\le(1-2c_0)W_{j-1}$。
每点至多一个 patch 非零 ⇒ $2c_0W_{j-1}\le W_j\le(2-2c_0)W_{j-1}$（正性 + 乘性比较）。导数：
$|YW_j|\le(C_2+K_*/\sqrt Q)W_{j-1}\le K_*c_0W_{j-1}\le K_*W_j$（用 $K_*>2C_2/c_0$）。

(c) 机械理由（选择顺序，论文明示）：$C_2$（`lem density:normalized-patch`，只依赖固定 patch 数据 $R_0,D_R,F,B,F_1,B_1$）
→ 定 $K_*>2C_2/c_0$ → 定 $C_1$（`density:central-derivatives`，依赖 $K_*,c_0,\chi$）→ 定 $Q_0$。
式 `density:Q-conditions`：
```tex
 \begin{gathered}
 Q\ge2,\qquad H(Q)\le2,\qquad
 K_*/Q\le1,\qquad C_1/Q^2\le1,\qquad
 Q^{-1/2}\le c_0/2,\\
 H(Q)(F+BK_*/Q)\le1-2c_0.
 \end{gathered}
```
$H(Q)=\exp(K_*D_R/\sqrt Q+2R_0/Q)\to1$，$F=\|f\|_\infty=1-4c_0<1-2c_0$，故 $Q$ 充分大时全相容。
"至多一个 patch 非零"来自 `lem peaks:patches` 的互斥（$D_0>2\sqrt{2R_0}$）。

(d) `[推测]` 失败路线：
- `[推测]` 若先固定 $Q$ 再定 $K_*$ 会循环依赖：$K_*$ 进 $H(Q)$，$H(Q)$ 进正性界，$Q$ 进 $C_1$。
  论文用"$C_2\to K_*\to C_1\to Q_0$"的严格顺序破环。若顺序颠倒则 $Q_0$ 不存在（各条件无法同时满足）。
- `[推测]` 若无 $\ell_{j-1}<k_j$（$Q\ge2$ 且指数增长），`density:moments` 的"频率不含 0"失效，
  轨道均值不再为 1，$W_jd\sigma$ 不再是概率。
- `[推测]` 若 $\|f\|_\infty$ 逼近 1（$c_0\to0$），$1-2c_0$ 与 $H(Q)(F+BK_*/Q)$ 的间隙消失，正性归纳断。

Lean：`uniform_representing_densities`（`BaseDensityTheorem.lean:20`）给 `∃ c K, 0<c∧0<K∧ ∀ D, 2√(2p.R)<D → ...`
其中 $c=c_0$、$K=K_*$；结论用 `structure DensityStage`（`BaseDensityInduction.lean:20`）打包四项：
`positive`、`horizontal`（`HorizontalBound`，$|ZW_j|\le K\sqrt{Q^j}W_j$）、`phase`（$|TW_j|\le K Q^jW_j$）、
`step`（$cW_i\le W_j\le2W_i$）。归纳机器化在 `density_induction`（:26），其前提 `hH/hsmall/hphase/hsecond/hderH/hderT`
正是 `density:Q-conditions` 的 Lean 版（:37–41）。`Represents`（`BaseMeans.lean:25`）用 `MvPolynomial` 表达
"对每个多项式 $\int p\,d\mu=p(0)$"。`IsProbabilityMeasure` 与 `Represents` 由
`densityMeasure_probability`/`densityMeasure_represents`（`BaseDensityTheorem.lean:60,62`）从
`density_mass_one`/`density_polynomial_moment` 得到。

### 引理 `lem density:moments`（Moment preservation）

(a) TeX 原文：
```tex
\begin{lemma}[Moment preservation]\label{density:moments}
For every stage of \eqref{density:recursion}, the phase bandwidth
of $W_j$ is at most $\ell_j$, its orbitwise mean is one, and
\begin{equation}\label{density:representing}
 \int_S p(\xi)W_j(\xi)\,d\sigma(\xi)=p(0)
 \quad\text{for every holomorphic polynomial }p.
\end{equation}
Each individual correction has zero integral against every such
polynomial, including the constant polynomial.
\end{lemma}
```

(b) 机制（精确矩计算）：归纳。设到 $j-1$ 成立，$k=k_j$。中心限制 $S_p(\theta)=\sum_{|s|\le\ell_{j-1}}\widehat S_p(s)e^{is\theta}$，
$\widehat S_p(0)=1$。因 $b'-b=f$，`density:recursion` 括号内 $=\sum_s\widehat S_p(s)(b'-\frac{k+s}k b)e^{is\theta}$。
全 $m=k+s>0$。patch 与 $y$ 在全局相位旋转下不变、$\theta$ 增加旋转角 ⇒ 校正在频率集
`density:bandwidth` $=[k-\ell_{j-1},k+\ell_{j-1}]\cup[-k-\ell_{j-1},-k+\ell_{j-1}]$，不含 0。
矩：用适配单项式 $\xi_1^n\xi_2^l$。$l>0$ 由 $\gamma$ 平均给零；$l=n=0$ 由 $\theta$ 平均给零（$m>0$）。
$l=0,n\ge1$：$A_{j,p}=\frac{e^{2y/k}}2\sum_s(\widehat S_p(s)e^{i(k+s)\theta}+\overline{\widehat S_p(s)}e^{-i(k+s)\theta})(b'-\frac{k+s}k b)$，
$\xi_1^n=e^{-ny/k}e^{in\theta}$，仅 $k+s=n$ 的共轭频率幸存：
```tex
 \int_{\mathcal U_{k,p}}\xi_1^n A_{j,p}\,d\sigma
 =\frac{\overline{\widehat S_p(n-k)}}{k}
   \int_0^{R_0}e^{-ny/k}\left(b'-\frac nk b\right)dy
 =\frac{\overline{\widehat S_p(n-k)}}{k}
   \left[e^{-ny/k}b(y)\right]_0^{R_0}=0.
```
表面测度 $2/k$ 与实部 $1/2$ 合成 $1/k$；两端 $b(0)=b(R_0)=0$。酉坐标变换保全纯多项式，故对原坐标每一项校正归零。

(c) 机械理由：$b(R_0)=0$（由 `peaks:profiles` 加权抵消 + 紧支）与 $b(0)=0$ 是矩归零的**唯一**支点 ——
分部积分全坍成两端点值。$\widehat S_p(0)=1$（轨道均值一）保证 $n=k$ 时系数正确但仍归零。

(d) `[推测]`：`[推测]` 若校不含 $-bS_p'/(ik)$ 项，$m\ne k$ 的模式 $(f)$ 系数不是全导数，矩不为零，代表性质崩。
这正是 `density:recursion` 里那第二项存在的全部理由。

### 引理 `lem density:orbit-growth`（Growth along phase orbits）

(a) TeX 原文：
```tex
\begin{lemma}[Growth along phase orbits]\label{density:orbit-growth}
Suppose \(Q\ge2\), \(k_j=Q^j\), and the positive functions
\(W_0=1,W_1,\ldots,W_n\), with \(n\ge1\), satisfy
\[
 c_0W_{j-1}\le W_j\le2W_{j-1},
 \qquad |TW_j|\le K_*k_jW_j
 \quad(1\le j\le n).
\]
Put \(R=\frac2{c_0}\), \(\beta=\log_2R\). For every \(p\in S\), the function
\(S_p(\theta)=W_n(e^{i\theta}p)\) satisfies
\begin{equation}\label{density:orbit-growth-bound}
 S_p(\theta+u)
 \le e^{K_*}R(1+k_n|u|)^\beta S_p(\theta),
 \qquad |u|\le\pi.
\end{equation}
In particular, the constants in this bound are independent of \(Q,n,p\).
\end{lemma}
```

(b) 机制：取最大 $l\le n$ 使 $k_l|u|\le1$（无则 $l=0$）。逐步比较给
$\frac{W_n(e^{i(\theta+u)}p)}{W_n(e^{i\theta}p)}\le R^{n-l}\frac{W_l(e^{i(\theta+u)}p)}{W_l(e^{i\theta}p)}$。
$l\ge1$ 时对数微分 + $|TW_l|\le K_*k_l|u|$ 使末比 $\le e^{K_*k_l|u|}\le e^{K_*}$；$l=0$ 时为 1。
若 $l<n$，最大化性给 $k_n|u|>Q^{n-l-1}\ge2^{n-l-1}$ ⇒ $R^{n-l}\le R(1+k_n|u|)^\beta$（$\beta=\log_2R$ 把 $2^{n-l-1}$ 折成 $k_n|u|$ 的 $\beta$ 次幂）。

(c) 机械理由：$\beta=\log_2R$ 精确匹配 $R^{n-l}\le R\cdot(2^{n-l-1})^\beta$ 因为 $R=2^\beta$。
"$R,C$ 与 $Q,n,p$ 无关"是要喂给 `lem density:weighted-derivative` 的 $A,\beta$（须与 $q$ 无关）。

(d) `[推测]`：`[推测]` 若 $Q<2$（次数不翻倍），$k_n|u|>Q^{n-l-1}\ge2^{n-l-1}$ 不成立，幂律 $\beta$ 界证不出，
只能用指数 $(n-l)$，随 stage 发散。

Lean：`BaseOrbitGrowth.lean`（107 行）。

### 引理 `lem density:weighted-derivative`（A weighted derivative bound）

(a) TeX 原文：
```tex
\begin{lemma}[A weighted derivative bound]\label{density:weighted-derivative}
Fix \(A\ge1\) and \(\beta\ge0\).  Let \(q\ge1\) be an integer,
and let \(s\) be a positive trigonometric polynomial of degree at most
\(2q\).  Suppose that \(s(\theta+u)\le A(1+q|u|)^\beta s(\theta)\).
There is a constant \(C(A,\beta)\), independent of \(q,s\), such that
\(|s''(\theta)|\le C(A,\beta)q^2s(\theta)\).
\end{lemma}
```

(b) 机制：取 $\chi$ 等于 1 于 $[-2,2]$、紧支，$K_q(u)=\sum_{h\in\Z}\chi(h/q)e^{ihu}$。频率假设 ⇒ $s''=s*K_q''$。
核衰减 `density:kernel-decay`：$|K_q''(u)|\le C_Nq^3(1+q|u|)^{-N}$。
证明：$K_q''$ 系数 $a_h=-h^2\chi(h/q)=q^2g(h/q)$，$g(v)=-v^2\chi(v)$。$O(q)$ 个非零系数各 $O(q^2)$ ⇒ 直和 $\le Cq^3$。
$h$ 的 $N$ 阶差分是 $q^2g(v/q)$ 的 $N$ 阶导的迭代积分 ⇒ $\le C_Nq^{2-N}$，仅 $O_N(q)$ 个非零 ⇒ 绝对和 $\le C_Nq^{3-N}$。
乘 $(1-e^{iu})^N$ 产生差分，$|1-e^{iu}|\ge2|u|/\pi$ ⇒ $|K_q''(u)|\le C_Nq^{3-N}|u|^{-N}$。两者合并。
取 $N>\beta+1$，卷积：$|s''|\le AC_Nq^3s\int(1+q|u|)^{\beta-N}\frac{du}{2\pi}\le C(A,\beta)q^2s$。

(c) 机械理由：$s$ 正性用在把 $s(\theta-u)$ 换成 $A(1+q|u|)^\beta s(\theta)$ 时保留 $s(\theta)$ 因子提出。
次数 $\le2q$ 保证 $s''=s*K_q''$（频带截断）。$N>\beta+1$ 保证 $\int(1+q|u|)^{\beta-N}du$ 收敛并给出 $q^{-1}$ 净余（使 $q^3\to q^2$）。

(d) `[推测]`：`[推测]` 若无正性只用 $|s|$ 界，卷积核 $\int|K_q''|$ 发散（$q^3\cdot q^{-1}$ 只在带 $(1+q|u|)^{-N}$ 下有限），
得不出 $q^2$ 缩放，$S_p''$ 界退化。这是为何 `density:orbit-growth` 必须先给正函数的乘性增长。

Lean：`BaseWeightedDerivative.lean`（199 行，机器化核对 $K_q''$ 衰减与卷积）。

### 引理：归一化校正估计（Normalized correction estimate）

(a) TeX 原文：
```tex
\begin{lemma}[Normalized correction estimate]
\label{density:normalized-patch}
Write \(F=\|f\|_\infty,\quad B=\|b\|_\infty,\quad
 F_1=\|f'\|_\infty,\quad B_1=\|b'\|_\infty\).
On a degree-\(k\) patch suppose \(W_{j-1}>0\), \(S_p>0\), and
\[
 \frac{e^{2y/k}S_p}{W_{j-1}}\le2,\qquad
 r_1=\frac{|S_p'|}{kS_p}\le1,\qquad
 r_2=\frac{|S_p''|}{k^2S_p}\le1.
\]
For the correction \(A_{j,p}\) in \eqref{density:recursion},
\[
 |YA_{j,p}|\le C_2W_{j-1},
 \quad Y=Z/\sqrt{k}\ \hbox{or}\ T/k,
 \qquad
 C_2=2D_R\bigl[4(F+B)+F_1+B_1\bigr].
\]
In particular, \(C_2\) is independent of \(K_*,Q,j,p\).
\end{lemma}
```
方向界 `density:patch-directions`：$|Yy|\le D_R$，$|Y\theta|\le D_R/k$，$|Y(e^{ik\theta})|\le D_R$。

(b) 机制：对 `density:recursion` 求 $Y$ 导并取绝对值：
$|YA_{j,p}|\le D_R e^{2y/k}S_p[(1+2/k)(F+Br_1)+F_1+B_1r_1+Fr_1+Br_2]$，$k\ge1$ 且归一假设 ⇒ 结论。
$D_R$ 的直接验证：$|Zc|\le\sqrt{1-|c|^2}\le\sqrt{2R_0/k}$、$|c|\ge e^{-R_0/k}$（$c=\langle\xi,p\rangle$），
微分 $y=-k\log|c|$、$\theta=\arg c$；径向弧 $u\mapsto(e^{i\theta}\cos u,e^{i\gamma}\sin u)$ 单位速、复水平，长 $\le D_R/\sqrt k$。

(c) 机械理由：$C_2$ **只依赖固定 patch 数据** $R_0,F,B,F_1,B_1,D_R$，与 $K_*,Q$ 无关 —— 这是选择顺序
$C_2\to K_*$ 能启动归纳的根因（$K_*>2C_2/c_0$ 用 $C_2$ 定 $K_*$，若 $C_2$ 含 $K_*$ 则循环）。

(d) `[推测]`：`[推测]` 若假设 $e^{2y/k}S_p/W_{j-1}\le2$ 被削弱到无上界（例如 $W_{j-1}$ 可任意小），
$C_2W_{j-1}$ 界失去，正性归纳断。这由 `density:central-comparison` 用 $H(Q)\le2$ 保证。

## 2.4 §5　Regularized logarithmic tests（`sec:tests`）

### 正则化对数（式 `tests:regularized`、`tests:hessian`）

(a) TeX 原文：
```tex
For $\epsilon>0$, define
\begin{equation}\label{tests:regularized}
 F_\epsilon(v)=
 \log\frac{|1-av|^2+\epsilon^2}{1+\epsilon^2},
 \qquad U_k(z)=F_\epsilon(P_k(z)).
\end{equation}
In particular $F_\epsilon(0)=U_k(0)=0$.  The function $U_k$ is smooth
and plurisubharmonic on $\mathbb C^2$, since
\begin{equation}\label{tests:hessian}
 (U_k)_{i\bar j}
 =\frac{a^2\epsilon^2}
        {(|1-aP_k|^2+\epsilon^2)^2}
   (P_k)_i\overline{(P_k)_j}.
\end{equation}
...
\begin{equation}\label{tests:lipschitz}
 |F_\epsilon(v)|\le C_{\epsilon,A}|v|
 \qquad (|v|\le A).
\end{equation}
```

(b) 机制：$U_k(0)=F_\epsilon(0)=\log\frac{1+0}{1+0}\cdot$(检查 $P_k(0)=0$ 因 $k\ge1$ 齐次)=0。
`tests:hessian` 是对 $F_\epsilon(|1-aP_k|^2+\epsilon^2)$ 求 $\partial\bar\partial$：链式法则给出秩一半正定
$\propto(P_k)_i\overline{(P_k)_j}$，故 $U_k$ psh。Lipschitz：$\epsilon$ 固定、$|v|\le A$ 时 $F_\epsilon$ 光滑且
$F_\epsilon(0)=0$ ⇒ 中值定理 $|F_\epsilon(v)|\le C|v|$。

(c) 机械理由：正则化 $\epsilon^2$ 让 $\log$ 不再 $-\infty$，使 $U_k$ 光滑可求导（§6 `base:convergence` 逐项
求导、`base:chart-estimates` 4 阶导都需光滑）。$U_k(0)=0$ 保证 $\phi(0)=\psi(0)+L\sum U_{k_j}(0)=0$。
`tests:hessian` 半正定用在 `base:convergence` 的 $h\ge I$。

(d) `[推测]`：`[推测]` 若不正则化（$\epsilon=0$），$U_k$ 在 $aP_k=1$ 处奇，不能作光滑位势；`tests:averaging`
里 $V''$ 无界，`lem tests:later` 的 Fourier 尾界 $B_\epsilon/m^2$ 失效。

### 引理 `lem tests:averaging`（Exact averaging）

(a) TeX 原文：
```tex
\begin{lemma}[Exact averaging]\label{tests:averaging}
Let $k=k_j=Q^j$, where $Q$ satisfies the hypotheses of
Theorem~\ref{density:main}.  For $0\le r\le1$,
\begin{equation}\label{tests:averaging-identity}
 \int_S U_k(r\xi)W_j(\xi)\,d\sigma
 =
 \int_S U_k(r\xi)\,d\sigma
 +\sum_p\int_{\mathcal U_{k,p}}
     U_k(r\xi)e^{2y/k}f(y)\cos(k\theta)\,d\sigma.
\end{equation}
\end{lemma}
```

(b) 机制：全局相位 $\xi\mapsto e^{i\omega}\xi$ 下 $P_k(e^{i\omega}\xi)=e^{ik\omega}P_k(\xi)$（齐次）⇒ $U_k(r\xi)$
只含 $k\Z$ 频率。$W_{j-1}$ 频带 $\ell_{j-1}<k$、轨道常数系数 1 ⇒ $U_kW_{j-1}$ 相位平均只剩 $U_k$ 自身（`tests:averaging-identity` 第一项）。
patch 内校正频率 $\pm(k+s)$，$|s|\le\ell_{j-1}<k$，与 $k\Z$ 配对仅 $s=0$ 幸存，$\widehat S_p(0)=1$、$S_p'$ 零常系数
⇒ 幸存部分恰 $e^{2y/k}f(y)\cos(k\theta)$（第二项）。

(c) 机械理由：把 $\int U_kW_j$ 化简为"背景 $\int U_k d\sigma$ + patch 内 $f(y)\cos(k\theta)$ 模型积分"，
后者正是 `prop tests:negative` 里 $I_\epsilon(\rho)$ 的形状。$f(y)\cos(k\theta)$ 直接来自 `density:recursion`
的 $s=0$ 模式 $f(y)$（因 $S_p$ 常数 1、$S_p'$ 无贡献）。

(d) `[推测]`：`[推测]` 若 $k$ 与 $\ell_{j-1}$ 不严格分离（$k\le\ell_{j-1}$），多个 $s$ 模式配对 $k\Z$，
幸存项不再是纯 $f(y)\cos(k\theta)$，模型积分对不上。

Lean：`logarithmicTests_exact_averaging`（`BaseTestAveraging.lean` / `BaseLogTests.lean`，`BaseTestSystem.lean:98` 调用它）。

### 命题 `prop tests:negative`（Negative averages at one scale）

(a) TeX 原文：
```tex
\begin{proposition}[Negative averages at one scale]\label{tests:negative}
There exist $\epsilon>0$, $\eta\in(0,1/2)$ and $D_*\ge1$, depending
only on the fixed profile data, with the following property.
For every $D_0\ge D_*$ there are $k_*>0$ and $d_2>0$ such that, for
every integer $Q$ satisfying the density theorem and $Q\ge k_*$,
\begin{equation}\label{tests:one-scale-negative}
 \int_S U_{k_j}(r\xi)W_j(\xi)\,d\sigma\le-d_2
 \qquad
 \bigl(j\ge1,\quad 1-\eta\le r^{k_j}\le1\bigr).
\end{equation}
The constants $k_*,d_2$ may depend on $D_0$, but are independent of
$j$ and of further increases in $Q$.
\end{proposition}
```

(b) 机制（含模型积分算尽）：
令 $\Delta=2s_1(\cosh\alpha-1)-\alpha^2>0$。单峰模型积分（式 `tests:model`）
$I_\epsilon(\rho)=\int_0^{R_0}\int_0^{2\pi}\log\frac{|1-a\rho e^{-y}e^{it'}|^2+\epsilon^2}{1+\epsilon^2}(1+f(y)\cos t')\frac{dt'}{2\pi}dy$。
$\rho=1$：未正则对数唯一奇点 $(y,t')=(\alpha,0)$，$|1-e^{\alpha-y+it'}|^2\asymp(y-\alpha)^2+(t')^2$ 局部可积；
正则对数负部 $\le$ 未正则负部 $+\log2$ ⇒ 控制收敛适用。
圆周矩：$q<1$ 时 $\log|1-qe^{it'}|^2$ 均值 0、余弦矩 $-q$；$q>1$ 时提 $q^2$ 得均值 $2\log q$、余弦矩 $-q^{-1}$。
用抵消 $\int_0^{R_0}e^{-y}f=0$：
```tex
 I_0(1)
 =\alpha^2-\int_0^\alpha f(y)e^{y-\alpha}\,dy-\int_\alpha^{R_0}f(y)e^{\alpha-y}\,dy
 =\alpha^2+\int_0^\alpha f(y)(e^{\alpha-y}-e^{-(\alpha-y)})\,dy
 =\alpha^2-2s_1(\cosh\alpha-1)=-\Delta.
```
最后一步用 $f=-s_1$ on $[0,\alpha]$。比较 `tests:averaging-identity`：
- off-patch：$|aP_k|\le1/2$，$|F_\epsilon(v)-\log|1-av|^2|\le C\epsilon^2|P_k|$，未正则对数相位均值 0 ⇒
  总贡献 $\le C_{\rm off}\epsilon^2 N_k/k$（式 `tests:off-patch`）。
- on-patch：`peaks:patch-measure` 把贡献写成 $\frac2k\int F_\epsilon(\rho P_k)(e^{-2y/k}+f(y)\cos(k\theta))$，
  用单峰近似 + $e^{-2y/k}\to1$，误差 $\le\frac2k C_{\epsilon,R_0}(e^{-c(D_0-\sqrt{2R_0})^2}+\frac1k)$（式 `tests:patch-error`）。
选 $\epsilon$ 使 $|I_\epsilon(1)+\Delta|\le\Delta/8$、$C_{\rm off}\epsilon^2\le\Delta/8$；选 $\eta$ 使 $\rho\in[1-\eta,1]$ 时
$I_\epsilon(\rho)\le-3\Delta/4$；选 $D_*$、$k_*$ 压小两误差各 $\le\Delta/16$（在 $2/k$ 因子里）。求和：
$\int U_kW_jd\sigma\le-\frac\Delta2\frac{N_k}k\le-\frac\Delta{2D_0^2}$，即 $d_2=\Delta/(2D_0^2)$。

(c) 机械理由：
- $1-\eta\le r^{k_j}\le1$：保证 $\rho=r^k$ 落在模型积分 $I_\epsilon(\rho)\le-3\Delta/4$ 的 $\rho$-区间（连续性选 $\eta$）。
  §6 `base:minorant` 取 $r_N=1-\eta/k_N$ 用 Bernoulli 使 $r_N^{k_j}\ge1-\eta$（$j\le N$）恰配此处。
- "$d_2$ 与 $j$、与进一步增大 $Q$ 无关"：让 §6 求和 $\sum_{j\le N}(-d_2)=-d_2N$ 线性发散。
- $N_k/k\le4/D_0^2$ 但这里用 $\ge1/D_0^2$（`peaks:count`）使 $d_2>0$。

(d) `[推测]` 失败路线：
- `[推测]` 若 off-patch 误差 $C_{\rm off}\epsilon^2N_k/k$ 不被 $\epsilon^2$（先于 $D_0$ 选）压住，正背景项可能盖过负 patch 项。
  论文明说"chooses the regularization before the spacing"正是为此。
- `[推测]` 若单峰近似误差 $e^{-c(D_0-\sqrt{2R_0})^2}$ 不 $\le\Delta/16$，patch 内模型对不上，$-3\Delta/4$ 变号。
- `[推测]` 直接对 $U_k$ 用 Jensen 不等式（$\log|U_k(0)|=0$）会得 $\ge0$，与 $-d_2$ 矛盾 —— 说明 Jensen 方向反了，
  作者改逐密度直证（Hedenmalm 反例背书：代表测度不满足对数不等式）。

### 引理 `lem tests:later`（Negative averages against later densities）

(a) TeX 原文：
```tex
\begin{lemma}[Negative averages against later densities]\label{tests:later}
Fix $\epsilon,\eta,D_0,k_*,d_2$ as in
Proposition~\ref{tests:negative}, and put $d_3=d_2/2$.
There is a threshold $Q_*$ such that, for every integer $Q\ge Q_*$,
the densities satisfy
\begin{equation}\label{tests:later-negative}
 \int_S U_{k_j}(r\xi)W_N(\xi)\,d\sigma\le-d_3
 \qquad
 \bigl(N\ge j\ge1,\quad1-\eta\le r^{k_j}\le1\bigr).
\end{equation}
\end{lemma}
```

(b) 机制：$W_N-W_j=\sum_{\nu>j}(W_\nu-W_{\nu-1})$，每增量频率在 $\pm k_\nu$ 的 $\ell_{\nu-1}$ 邻域，
$\ell_{\nu-1}\le2k_{\nu-1}$ ⇒ 每频率绝对值 $\ge(Q-2)k_{\nu-1}\ge(Q-2)k_j$。
把 $U_{k_j}(r\xi)$ 按相位频率展开成 $c_m(\xi)$（$c_m$ 频率 $mk_j$，$U_{k_j}=\sum_m c_m$）。
$V(t')=\log\frac{|1-Ae^{it'}|^2+\epsilon^2}{1+\epsilon^2}$，$A=ar^{k_j}P_{k_j}(\xi)$，$|A|\le aC_P$，
$\|V''\|_\infty\le B_\epsilon=\frac{2aC_P}{\epsilon^2}+\frac{4a^2C_P^2}{\epsilon^4}$。两次分部积分 ⇒ $m$ 阶 Fourier 系数 $\le B_\epsilon/m^2$。
截断 $|m|\le Q-3$：误差 $\le2B_\epsilon/(Q-3)$，且保留频率绝对值 $<(Q-2)k_j$ —— 与 $W_N-W_j$ 频率无交 ⇒
相位平均使截断对 $W_N-W_j$ 积分为零。$\|W_N-W_j\|_{L^1}\le2$（两正概率）⇒
$|\int U_{k_j}(W_N-W_j)|\le4B_\epsilon/(Q-3)$。选 $Q_*$ 使 $\le d_2/2$，套 `prop tests:negative`（$-d_2$）得 $-d_3=-d_2/2$。

(c) 机械理由：$Q\ge4$、$Q_*$ 含 $Q\ge k_*$ 与密度定理阈值 —— 频率间隙 $(Q-2)k_j$ 与截断 $Q-3$ 全靠 $Q$ 大。
$d_3=d_2/2$ 留一半给 Fourier 尾误差。$B_\epsilon$ 依赖 $\epsilon^{-4}$（因 $V''$ 有 $\epsilon^2,\epsilon^4$ 分母）——
这决定 $Q_*$ 可多大，但不影响存在性（$\epsilon$ 已固定）。

(d) `[推测]` 失败路线：
- `[推测]` 若频率间隙不建立（$Q$ 不够大），$U_{k_j}$ 的低频部分能与 $W_N-W_j$ 共振，$\int U_{k_j}W_N$ 的负性被污染。
- `[推测]` 若不用 Fourier 截断而直接估 $\sum_m c_m$，$c_m$ 只对 $\xi$ 依赖，$m$-级数一致收敛才可行（靠 $B_\epsilon/m^2$），
  去掉 $m^{-2}$ 衰减（即 $\epsilon\to0$）则级数不绝对收敛，交换积分/求和断。

Lean：`BaseLogTests.lean`（168 行）、`BaseLaterNegative.lean`（60 行）、`BaseLaterMoments.lean`、
`BaseLaterComparison.lean`、`BaseOffPatchMean.lean`。`logarithmicTest_later_threshold` 与
`logarithmicTest_later_comparison` 在 `BaseTestSystem.lean:59,102` 被调用组装成 `TestSystem.negative`。

## 2.5 §6　The controlled base potential（`sec:base-potential`）

位势定义（式 `base:potential`）：
```tex
 \phi(z)=\psi(z)+L\sum_{j=1}^\infty U_{k_j}(z).
```

### 引理 `lem base:convergence`（Smooth convergence）

(a) TeX 原文：
```tex
\begin{lemma}[Smooth convergence]\label{base:convergence}
For every finite $L>0$, the series in~\eqref{base:potential}
converges locally in $C^\infty(\mathbb B)$.  Its sum is smooth,
satisfies $\phi(0)=0$, and has complex Hessian $h\ge I$.
\end{lemma}
```

(b) 机制：固定 $r_0<r_1<1$，$|z|\le r_0$ 附近复多圆盘半径 $(r_1-r_0)/(2\sqrt2)$ 含于 $|z|<r_1$。
Cauchy 估计 + `lem peaks:bounds` 给 $\sup_{|z|\le r_0}|D^mP_k(z)|\le C_{m,r_0,r_1}r_1^k$（$k=Q^j$ 指数衰减）。
$P_k$ 值落在固定有界盘，$F_\epsilon(P_k)$ 的正阶导是含至少一个 $P_k$（或其共轭）正阶导的乘积之和 ⇒
$D^mU_k$ 同指数界；$m=0$ 用 `tests:lipschitz`。$\sum_j r_1^{Q^j}<\infty$ ⇒ 每局部 $C^m$ 收敛。
逐项 $\partial\bar\partial\phi=I+L\sum_j\partial\bar\partial U_{k_j}\ge I$（用 `tests:hessian` 半正定 + $\partial\bar\partial\psi=I$）。

(c) 机械理由：$\phi(0)=0$ 因 $\psi(0)=-\log1=0$ 且 $U_{k_j}(0)=0$。$h\ge I$ 提供 `base:existence` 的 $c=1$。
局部 $C^2$ 收敛保证逐项求 $\partial\bar\partial$ 合法。$L$ 有限即可（不需小），发散靠 $Q^j$ 指数。

(d) `[推测]`：`[推测]` 若 $Q=1$（次数不增），$r_1^{Q^j}=r_1^j$ 几何但次数不分离，与 `density:main` 的 $Q\ge2$ 冲突；
若级数只 $C^0$ 收敛则 $\partial\bar\partial\phi\ge I$ 无定义，$c=1$ 断。

Lean：`basePotential`（`BaseLogTests.lean:30`）、`basePotential_contDiffOn`（`BasePotentialSmooth.lean`，
:85 用 `choose C hC hb`，即 $C^\infty$ 收敛的机器化，此处触发 `Classical.choice`）、`testSeries_contDiffOn`。

### 引理 `lem base:minorant`（Absence of a pluriharmonic minorant）

(a) TeX 原文：
```tex
\begin{lemma}[Absence of a pluriharmonic minorant]\label{base:minorant}
If
\begin{equation}\label{base:amplitude}
 L>\frac{5\log Q}{d_3},
\end{equation}
there are no $H\in\mathcal O(\mathbb B)$ and $C_H\in\mathbb R$
satisfying~\eqref{base:no-minorant}.
\end{lemma}
```
半径选择（式 `base:radii`）：$r_N=1-\dfrac{\eta}{k_N}$。

(b) 机制：$j\le N$ 时 Bernoulli 不等式给 $r_N^{k_j}=(1-\eta/k_N)^{k_j}\ge1-\eta k_j/k_N\ge1-\eta$
（全满足 `tests:later-negative` 假设）。$j=N+m>N$ 时 $r_N^{k_j}\le e^{-\eta k_j/k_N}=e^{-\eta Q^m}$。
尾和（式 `base:tail`）：$\sum_{j>N}\sup_S|U_{k_j}(r_N\xi)|\le C_\epsilon\sum_{m\ge1}e^{-\eta Q^m}=:C_{\rm tail}<\infty$
（与 $N$ 无关，用 `tests:lipschitz` + 均匀多项式界）。$W_N$ 是正概率 ⇒ 同界控加权尾（不需 $W_N$ 一致点界）。
底位势只贡献一个对数：$\psi(r_N\xi)=-\log(1-r_N^2)\le\log\frac1{1-r_N}=\log(k_N/\eta)$。合并（式 `base:negative-means`）：
```tex
 \int_S\left(\phi(r_N\xi)+4\log\frac1{1-r_N}\right)W_N\,d\sigma
 \le 5\log(k_N/\eta)+L(-d_3N+C_{\rm tail})
 = N(5\log Q-Ld_3)+5\log(1/\eta)+LC_{\rm tail}\longrightarrow-\infty.
```
最后一式因 $Ld_3>5\log Q$（式 `base:amplitude`）系数 $5\log Q-Ld_3<0$，$N\to\infty$ 发散到 $-\infty$。
套 `lem peaks:mean-criterion`（$u=\phi+4\log(1/(1-|z|))$，$\mu_N=W_Nd\sigma$，$r_N$）得无下界。

(c) 机械理由：
- $L>5\log Q/d_3$：系数 $5\log Q-Ld_3$ 的符号，是"负平均压过边界容许"的精确门槛。系数 5 来自
  $\psi$ 的 1 个 $\log(k_N/\eta)$ 与 $4\log$ 合并成 $5\log$。
- $r_N=1-\eta/k_N$：同时保证前 $N$ 模式落入 $[1-\eta,1]$（用 `lem tests:later`）与尾指数小。
- $C_{\rm tail}$ 与 $N$ 无关：靠 $Q^m$ 几何衰减；它进常数项 $LC_{\rm tail}$（不随 $N$ 涨），不破坏发散。
- "$W_N$ 正概率控加权尾不需一致点界"：因为正概率测度总质量 1，$\int(\text{tail})W_N\le\sup|\text{tail}|\cdot1$。

(d) `[推测]` 失败路线：
- `[推测]` 若 $d_3$ 太小（被 `lem tests:later` Fourier 尾吃太多），$L$ 需超大才 $>5\log Q/d_3$，但 $L$ 大不影响
  收敛（`base:convergence` 对任意有限 $L$），故 $L$ 可任意大 —— 真正的约束在 $d_3>0$ 而非 $L$ 上界。
- `[推测]` 若尾和 $C_{\rm tail}$ 随 $N$ 增长（例如 $Q$ 不够大使 $e^{-\eta Q^m}$ 衰减慢），发散被抵消。
- `[推测]` 若用 Jensen 而非逐密度：$\phi+4\log$ 的负平均要 $\mu_N$ 代表全纯均值（已建）+ 对数不等式（Hedenmalm 说没有），
  所以必须走 `lem peaks:mean-criterion` 这条只用"代表"不用"Jensen"的路线。

Lean：`TestSystem.noMinorant`（`BaseMinorant.lean:65`），前提 `hamp : 5*Real.log S.Q < L*S.d`（即 `base:amplitude`）。
`series_mean_bound`（:20）给 $\int(\sum_j\text{logarithmicTest})d\mu\le -d\cdot N + T$（$T$ = `C_tail`）。
`testRadius`（`BaseRadii.lean`）= $r_N$；`psi_radial_le`（:60 附近）给 $\psi\le5\log$ 前的单 $\log$；
主不等式靠 `(S.representing N).analytic_mean hH hrc`（`∫ H dμ = H 0`）+ `integral_mono` + `exists_nat_gt` 取
$N>(C-5\log\eta+LT-(H0).re)/(Ld-5\log Q)$ 使右端被负系数拖穿（`hbound N` 的线性 $\le$ 与 `hd:0<L*S.d-5*log Q`）。

### 引理 `lem base:chart-estimates`（Uniform chart estimates）

(a) TeX 原文：
```tex
\begin{lemma}[Uniform chart estimates]\label{base:chart-estimates}
For every fixed finite $L>0$, the potential~\eqref{base:potential}
has uniformly bounded positive-order derivatives through order four
at the origins of all centered ball charts.  Consequently its
complex Hessian satisfies~\eqref{base:control} and
\eqref{base:jets}, with $c=1$ and a finite constant $C$.
\end{lemma}
```

(b) 机制（分两区间，$k\delta$ 为标度，$\delta=1-r$，$\rho=1/16$）：
- **高次 $k\delta>1$**：球自同构恒等式给 $1-|T_r(\zeta)|^2\ge\frac{1-2\rho^2}{(1+\rho)^2}\delta$
  ⇒ $1-|T_r|\ge c\delta$ ⇒ $|P_k(T_r(\zeta))|\le C_Pe^{-ck\delta}$；固定多圆盘 Cauchy ⇒ 各阶（含 0 阶）$\le C_me^{-ck\delta}$。
- **低次 $k\delta\le1$**：原坐标多圆盘 $A_k=\{|z_1-r|<1/k,|z_2|<1/\sqrt k\}$（可越界但 $P_k$ entire）
  上 $|z|^2\le1+4/k$，$|P_k|\le C_Pe^2$；半多圆盘 Cauchy 给 $|\partial_1P_k|\le Ck$、$|\partial_2P_k|\le C\sqrt k$。
  图位移 $|T_r^1-r|\le\frac{2\rho}{1-\rho}\delta$、$|T_r^2|\le\frac{\sqrt2\rho}{1-\rho}\sqrt\delta$（系数 $<1/2$），
  $\delta\le1/k$ 使图像落在 $A_k$ 内 ⇒ 沿直线段积分梯度 $|P_k(T_r)-P_k(r,0)|\le C\sqrt{k\delta}$。
  Cauchy 于全纯差 $P_k\circ T_r-P_k(r,0)$ ⇒ 正阶导 $\le C_m\sqrt{k\delta}$（0 阶不主张）。
- **合成**：两区间 $P_k\circ T_r$ 值落固定盘；对 $1\le m\le4$，`base:scale-jets`：
  $|D^m(U_k\circ T_r)(0)|\le C_{\epsilon,m}\{\sqrt{k\delta},k\delta\le1;e^{-ck\delta},k\delta>1\}$。
- **求和**：$J$ = 最大使 $Q^J\delta\le1$。低次 $\sum_{j\le J}\sqrt{Q^j\delta}\le\frac1{1-Q^{-1/2}}$；
  高次 $\sum_{j>J}e^{-cQ^j\delta}\le\sum_{m\ge0}e^{-cQ^m}<\infty$。均与图心无关。
- **底位势变换**：$\psi\circ T_r=-\log(1-|\zeta|^2)-\log(1-r^2)+\log|1+r\zeta_1|^2$，正阶导（4 阶内）一致有界，
  末项 pluriharmonic ⇒ $h$ 分量及其 1、2 阶导（2、3、4 阶）有界，合 $h\ge I$。

(c) 机械理由：
- 只需 4 阶：`prop metric:transfer` 的 `base:jets` 只到 $\partial_k\partial_{\bar\ell}h$（$h$ 的 2 阶 = $\phi$ 的 4 阶）。
- $\rho=1/16$ 固定：保证位移系数 $<1/2$ 使图像落入 $A_k$；换更大 $\rho$ 位移越界。
- 低次"几乎常数"($\sqrt{k\delta}\to0$ 当 $k\delta\to0$)、高次"指数小" —— 两区间互补覆盖所有 $j$。

(d) `[推测]` 失败路线：
- `[推测]` 若用非中心化图，$k\delta$ 标度不存在（$\delta$ 不控 $|P_k|$ 的边界行为），一致界无从谈起。
- `[推测]` 若低次用整体 Cauchy 而非"$P_k\circ T_r-P_k(r,0)$ 差"，会带上 0 阶值 $|P_k(r,0)|$ 无衰减，$\sum_{j\le J}$ 发散
  （论文特意"We make no such assertion for the zeroth-order value in this range"）。

### `proof of Proposition base:existence`

(a) TeX 原文（选择顺序，关键）：
```tex
\begin{proof}[Proof of Proposition~\ref{base:existence}]
Choose $a,\alpha,s_1,f,b,R_0$ as in Lemma~\ref{peaks:profiles}.
Proposition~\ref{tests:negative} first chooses $\epsilon,\eta$ and
then permits any sufficiently large spacing $D_0$.  Fix such a
$D_0$ and its degree threshold $k_*$, and fix $d_3=d_2/2>0$.  The density theorem holds for every $Q$ above a
threshold depending only on the fixed patch data and spacing.
Its derivative constant $K_*$ is fixed before that threshold is
chosen.  We may therefore choose one integer $Q$ satisfying the
density threshold, $Q\ge k_*$, and the Fourier-error threshold of
Lemma~\ref{tests:later}.
Now fix a finite amplitude $L$ satisfying~\eqref{base:amplitude}.
...  The metric parameter $\lambda$ in
Proposition~\ref{metric:transfer} is chosen only afterward from
these bounds, so none of the choices above depends on $\lambda$.
\end{proof}
```

(b) 机制：全局选择链 $a\to s_1\to f,b,R_0\to\epsilon,\eta\to D_0\to k_*,d_2\to d_3\to K_*\to Q\to L$。
$Q$ 一次同时满足密度阈值、$Q\ge k_*$、Fourier 阈值 $Q_*$（都是下界，可取 max）。$L$ 只依赖 $Q,d_3$。
$\lambda$ 完全不进这条链（属 §9）。

(c) 机械理由：链的每个箭头都是"前者只依赖已固定的量"（见 1.4）。$K_*$ 在 $Q_0$ 之前固定是 `density:main` 归纳的要求。

(d) `[推测]`：`[推测]` 若 $\epsilon$ 在 $D_0$ 之后选，单峰近似误差无法用扩 $D_0$ 压（因 $C_{\epsilon,R_0}$ 已定但 $F_\epsilon$
导数随 $\epsilon$ 变），`prop tests:negative` 的 $\Delta/16$ 精度选不出。论文"regularization before the spacing"对应此处。

Lean：`controlled_potential`（`Main.lean:23`）装配 `basePotential ... L := (5*log S.Q)/S.d+1`（:25，即 $L=5\log Q/d+1$，
自动满足 `base:amplitude`），`hamp : 5*log Q < L*S.d`（:29 用 `add_mul,div_mul_cancel₀` 验 $5\log Q<5\log Q+d$）。
`basePotential_chart_control`（`BasePotentialControl.lean`）给 `ChartControl φ 1 C` 与 `ChartJets φ C`。

## 2.6 §7　The global Hartogs metric（`sec:hartogs`）

### 引理 `lem metric:complete`

(a) TeX 原文：
```tex
\begin{lemma}\label{metric:complete}
Let $\phi$ be a smooth real plurisubharmonic function on $\B$, and let
$\lambda>0$.  The domain $M_\phi$ in \eqref{metric:domain} is
contractible, and the complex Hessian of
$\mathcal K_\lambda=\lambda\psi-\log(1-e^\phi|w|^2)$ defines a smooth
geodesically complete K\"ahler metric
$g=2\operatorname{Re}\widehat g$ on $M_\phi$.
Moreover, $\mathcal K_\lambda$ is a smooth strictly plurisubharmonic
exhaustion of $M_\phi$.
\end{lemma}
```

(b) 机制（四段）：
1. **域与光滑正度量**：$M_\phi=\{t<1\}$ 开。$(z,w)\mapsto(z,e^{\phi/2}w)$ 是 $M_\phi\to\B\times\D$ 光滑实微分同胚
   （逆 $(z,u)\mapsto(z,e^{-\phi/2}u)$）⇒ 可缩，不需全纯平凡化。写 $h=\partial\bar\partial\phi$、$x=\frac t{1-t}$、
   $G=\lambda I+xh$、$\vartheta=dw+w\partial\phi$：
   ```tex
   \widehat g
   =G+\frac{e^\phi}{(1-t)^2}\,
         \vartheta\otimes\overline{\vartheta}.
   ```
   $h\ge0$ ⇒ $G\ge\lambda I$ 控水平投影；$u_z=0$ 时第二项 $u_w\ne0$ 正 ⇒ 正定。零截面 $\widehat g|_{(z,0)}=\lambda I+e^\phi dw\otimes d\bar w$。
   远离零截面用 $s=\log t$、$q=x(1+x)$：$\widehat g=\lambda I+xh+q\partial s\otimes\overline{\partial s}$（式 `metric:log-form`，供曲率用）。
2. **两函数有界梯度**：约定 $|\nabla f|_g^2=2|\partial f|_{\widehat g^{-1}}^2$（式 `metric:gradient-convention`）。
   $|\partial[-\log(1-t)]|^2=t$（coframe 分块对角算出，含 $w=0$），$|\partial\psi|_{I^{-1}}^2=|z|^2$，$G\ge\lambda I$ ⇒
   $|\nabla[-\log(1-t)]|_g^2=2t<2$，$|\nabla\psi|_g^2\le2/\lambda$（式 `metric:gradient-bounds`）。
3. **度量球紧含**：沿路径积分梯度界，$d_g(p,q)\le R$ ⇒ $-\log(1-t(q))\le a_R$、$\psi(q)\le b_R$ ⇒ $t\le\tau_R<1$、$|z|\le\rho_R<1$，
   $|w|^2\le e^{-m_R}\tau_R$ ⇒ 球含于紧集 $K_R$（式 `metric:compact-containment`），不需极小测地线。
   同样 $\mathcal K_\lambda\le R$ 次水平集紧 ⇒ 严格 psh exhaustion。
4. **测地完备**：单位速测地线有限最大时间 $T$ ⇒ 像含于紧 $K_T$，度量有欧氏正下界 ⇒ 欧氏速有界；Christoffel 于 $K_T$ 有界 ⇒
   加速度有界 ⇒ 位置速度有极限（在 $K_T\subset M_\phi$）⇒ 局部存在延拓，矛盾。逆向同理。

(c) 机械理由：$\phi$ psh（$h\ge0$）用在 $G\ge\lambda I$ 正定；$\lambda>0$（任意）用在 $|\nabla\psi|^2\le2/\lambda$ 有限。
本引理**不需 $h\ge cI$ 或大 $\lambda$**（只 $h\ge0$），与 `prop metric:transfer` 分工：完备性对任何 $\lambda$ 成立。
梯度界是完备性核心（把 $g$-距离换成 $t,\psi$ 的显式界）。

(d) `[推测]` 失败路线：
- `[推测]` 若试图用 Hopf–Rinow（需先证度量空间完备）会绕回测地延拓；作者直接测地线方程延拓更初等。
- `[推测]` 若零截面处理不当（$\vartheta=dw+w\partial\phi$ 在 $w=0$ 退化），$\widehat g$ 正定性断；论文特意用
  `metric:smooth-form`（$\vartheta\otimes\bar\vartheta$ 系数 $e^\phi/(1-t)^2$ 在 $w=0$ 仍正）而非 $q\partial s\otimes\bar\partial s$
  跨 $w=0$ 定义度量。

Lean：`hartogsMetric_isKahler`（`MetricCalculus.lean:805`）、`hartogsMetric_geodesicallyComplete`
（`HartogsCompletenessSupport.lean:319`，175 行支持）、`chartControl_psh`（`HartogsTransferTools.lean:53`）、
`hartogs_contractible`（`HartogsTopologySupport.lean`）。完备性机器化里 `choose γ hγ0 hγ`（`HartogsCompletenessSupport.lean:201`）
与 `choose r hr ε hε H`（:133）触发 `Classical.choice`（在 permitted_axioms 内）。

## 2.7 §8　Curvature on real two-planes（`sec:curvature`）

### 点态全纯规范（式 `curv:gauge`）与张量块

(a) TeX 原文：
```tex
Fix a point with $w\ne0$, choose centered ball coordinates at its base
point, and choose a local branch of $\log w$.  Put
\[
 s=\log t=\phi+\log w+\overline{\log w},\qquad
 x=\frac{t}{1-t},\qquad q=x(1+x).
\]
...
Remove the first
and pure second derivatives of the weight by the holomorphic fiber change
\[
 P(z)=\sum_i\phi_i(0)z_i+
       \frac12\sum_{i,k}\phi_{ik}(0)z_i z_k,
 \qquad v=\log w+P(z).
\]
...
\begin{equation}\label{curv:gauge}
 s_i=s_{ik}=0,\qquad s_v=s_{\bar v}=1,\qquad
 s_{i\bar j}=h_{i\bar j}.
\end{equation}
All higher derivatives of $s$ involving a vertical index vanish.
```
坐标曲率公式（式 `curv:coordinate-formula`）：
```tex
 R_{a\bar b c\bar d}
 =-\mathcal K_{ac\bar b\bar d}
   +\widehat g^{p\bar e}
       \mathcal K_{ac\bar e}\mathcal K_{p\bar b\bar d}.
```
对称张量（式 `curv:symmetric-tensor`）：$(S_P)_{a\bar b c\bar d}=P_{a\bar b}P_{c\bar d}+P_{a\bar d}P_{c\bar b}$。

(b) 机制：$F(s)=-\log(1-e^s)$ 直接求导给 $F'=x,F''=q,F'''=q(1+2x),F''''=q(1+6x+6x^2)$。
基 $\psi$ 中心化表达式与 $-\log(1-|z|^2)$ 差 pluriharmonic+常数 ⇒ $(2,1)$ 型导数在中心为零、$(2,2)$ 型为 $S_I$。
规范 $v=\log w+P(z)$ 把权重的一阶、纯二阶导清掉（$P$ 恰吸收 $\phi_i(0),\phi_{ik}(0)$），不改 $h$ 及其中心坐标导数。
度量分块 $\widehat g=\begin{pmatrix}G&0\\0&q\end{pmatrix}$，竖直向量归一为 $q^{-1/2}\partial_v$（指标 0），度量为 $G+V$。

(c) 机械理由：清一阶、纯二阶导是为了让 `curv:third-derivatives`/`curv:fourth-derivatives` 表里大量项为零
（"All other terms contain a vanished first or pure second horizontal derivative"）；$s_i=s_{ik}=0$ 是分解
$R=-\lambda S_I-qS_h-S_V-\cdots+T_4+T_3$ 只剩 $T_3,T_4$ 误差的根因。约定 `curv:coordinate-formula` 是 Kähler 几何标准
（$-\mathcal K_{ac\bar b\bar d}+g^{-1}*\mathcal K*\mathcal K$），Lean `curvature`（`Definitions.lean:62`）逐字实现。

### 命题 `prop curv:tensor`（Full curvature tensor）

(a) TeX 原文：
```tex
\begin{proposition}\label{curv:tensor}
In the frame just described, define the horizontal Hermitian form
\[
 D=(1+2x)h-qhG^{-1}h.
\]
The full curvature tensor is
\begin{equation}\label{curv:tensor-identity}
 R=-\lambda S_I-qS_h-S_V
    -(S_{D+V}-S_D-S_V)+T_4+T_3,
\end{equation}
where $T_j$ has exactly $j$ horizontal indices.  Its nonzero
components, up to the K\"ahler symmetries and conjugation, are
\begin{align}
 (T_4)_{i\bar j k\bar l}
   &=-x h_{i\bar j,k\bar l}
      +x^2G^{p\bar e}h_{i\bar e,k}h_{p\bar j,\bar l},\\
 (T_3)_{i\bar j k\bar0}
   &=\sqrt q\bigl(-h_{i\bar j,k}
           +xG^{p\bar e}h_{i\bar e,k}h_{p\bar j}\bigr).
\end{align}
Measured by the Euclidean component norms in this frame, uniformly
for $\lambda\ge1$,
\begin{equation}\label{curv:component-errors}
 \|T_4\|\le C_4x,\qquad \|T_3\|\le C_3\sqrt q.
\end{equation}
If $\lambda$ is at least the uniform upper bound for the eigenvalues
of $h$ at centered-chart origins, then
\begin{equation}\label{curv:D-bounds}
 (1+x)h\le D\le(1+2x)h.
\end{equation}
\end{proposition}
```

(b) 机制（导数表 → 代入公式）：三阶 $(2,1)$ 型（未归一，式 `curv:four-horizontal-error` 来源）
$\mathcal K_{ik\bar j}=xA_{ik\bar j}$、$\mathcal K_{iv\bar j}=qh_{i\bar j}$、$\mathcal K_{vv\bar v}=q(1+2x)$。
四阶 $(2,2)$ 型：$\mathcal K_{ik\bar j\bar l}=\lambda(S_I)+xB_{ik\bar j\bar l}+q(S_h)$、
$\mathcal K_{ik\bar j\bar v}=qA_{ik\bar j}$、$\mathcal K_{iv\bar j\bar v}=q(1+2x)h_{i\bar j}$、$\mathcal K_{vv\bar v\bar v}=q(1+6x+6x^2)$。
链式法则 + `curv:gauge` 核对完备性（四水平导里两配对给 $qS_h$，第三配对 $s_{ik}s_{\bar j\bar l}=0$）。
代入 `curv:coordinate-formula`：四水平误差 $T_4=-xB+x^2G^{-1}AA$、三水平 $T_3=\sqrt q(-A+xG^{-1}Ah)$。
剩余块（式 `curv:remaining-blocks`）：$R_{i\bar j0\bar0}=-D_{i\bar j}$、$R_{i\bar0k\bar0}=0$、$R_{0\bar00\bar0}=-2$
（未归一 $-q(1+6x+6x^2)+q(1+2x)^2=-2q^2$，四个竖直归一因子积 $q^{-2}$）。
误差界：$h\ge cI$ ⇒ $\|G^{-1}\|\le1/(\lambda+cx)$、$x^2\|G^{-1}\|\le x/c$；配 `base:jets` 的导数界得 `curv:component-errors`。
$D$ 界：$G=\lambda I+xh$ 与 $h$ 交换，$h$ 特征值 $d$ 方向上 $D/h=1+2x-\frac{x(1+x)d}{\lambda+xd}$，减去分数非负且
$\lambda\ge d$ 时 $\le x$ ⇒ `(1+x)h\le D\le(1+2x)h`。

(c) 机械理由：
- $\lambda\ge1$（本节全程）用在 $x^2\|G^{-1}\|\le x/c$ 与误差界"与 $\lambda\ge1$ 无关"。
- $\lambda\ge h$ 特征值上界（即 $\lambda\ge C$）用在 `curv:D-bounds` 上界"$\le(1+2x)h$"——`lem pinch:positivity` 里
  正是先把 $\lambda_0$ 抬到 $\max(1,C)$ 来启用它。
- $T_3$ 带 $\sqrt q$、$T_4$ 带 $x$ 的权重是 §9 两 regime 误差消失的定量依据。

(d) `[推测]` 失败路线：
- `[推测]` 若不清一阶/纯二阶导（不用 $P(z)$ 规范），三阶表里多出 $s_{ik}$ 项，$T_4$ 里出现本不该有的 $qS_{(\text{pure }2)}$ 项，
  `curv:D-bounds` 失去。
- `[推测]` 若约定用 $\widehat g$ 而非 $2\operatorname{Re}\widehat g$，`curv:remaining-blocks` 的 $R_{0\bar00\bar0}=-2$ 变 $-1$，
  §8 末"取 $u_2=iu_1$ 给实曲率 $-2$"对不上盘模型。

### 引理 `lem curv:real-plane`（Real curvature and Gram determinants）

(a) TeX 原文：
```tex
\begin{lemma}\label{curv:real-plane}
For the metric convention $g=2\operatorname{Re}\widehat g$ and
the curvature convention \eqref{curv:coordinate-formula},
\begin{equation}\label{curv:sectional}
 K_g(\operatorname{span}_{\mathbb R}\{U_1,U_2\})
       =\frac{\mathcal H_R}{2a_{\widehat g}}.
\end{equation}
Define the matrix
\begin{equation}\label{curv:xi-definition}
 \Xi^{a\bar b}=u_1^a\overline{u_2^b}
                   -u_2^a\overline{u_1^b}.
\end{equation}
For every tensor $T$ with the K\"ahler symmetries and Hermitian
conjugation symmetry,
\begin{equation}\label{curv:xi-contraction}
 \mathcal H_T=-\frac12
 T_{a\bar b c\bar d}\Xi^{a\bar b}\Xi^{c\bar d}.
\end{equation}
For every Hermitian form $P$,
\begin{equation}\label{curv:S-contraction}
 \mathcal H_{S_P}=a_P+3b_P^2.
\end{equation}
\end{lemma}
```
量定义（式 `curv:gram-quantities`）：$a_P=P(u_1,u_1)P(u_2,u_2)-(\operatorname{Re}P(u_1,u_2))^2$、
$b_P=\operatorname{Im}P(u_1,u_2)$、$m_P=a_{P+V}-a_P-a_V$；$\mathcal H_T=T_{u_1\bar u_1u_2\bar u_2}-\operatorname{Re}T_{u_1\bar u_2u_1\bar u_2}$。

(b) 机制：实面积平方 $=4a_{\widehat g}$（因 $g=2\operatorname{Re}\widehat g$）。展开 $R^\R(U_1,U_2,U_2,U_1)=A-B-\bar B+A=2\mathcal H_R$
（$A=R_{u_1\bar u_1u_2\bar u_2}$、$B=R_{u_1\bar u_2u_1\bar u_2}$），除实面积得 `curv:sectional`。`curv:xi-contraction`：$\Xi$ 展开给同一
$A-\operatorname{Re}B$。`curv:S-contraction`：$c_P=P(u_1,u_2)$，直接缩 `curv:symmetric-tensor`：
$\mathcal H_{S_P}=P(u_1,u_1)P(u_2,u_2)+|c_P|^2-2\operatorname{Re}(c_P^2)=a_P+3b_P^2$（用 $|c|^2-2\operatorname{Re}c^2$ 与 $\operatorname{Re}^2$ 关系）。

(c) 机械理由：$a_{\widehat g}>0$ 由实线性无关保证分母正。$u_2=iu_1$ 特例给盘曲率 $-2$ 定标准化。$\mathcal H_{S_P}$ 公式
让 §9 能把 $-\mathcal H_R$（式 `curv:negative-numerator`）逐项写成 $a$、$b$、$m$。

(d) `[推测]`：`[推测]` 若忽略 $3b_P^2$ 项（误把 $\mathcal H_{S_P}=a_P$），`prop curv:tensor` 里 $\lambda(a_I+3b_I^2)$ 少一项，
§9 `pinch:algebra` 的 $a_h+3b_h^2$ 结构对不上，非负性证不出。

### 引理 `lem curv:gram`

(a) TeX 原文：
```tex
\begin{lemma}\label{curv:gram}
For a positive semidefinite Hermitian form $P$,
$a_P\ge b_P^2$.  For the vertical form $V$ one has $a_V=b_V^2$.
If $P$ is horizontal and positive semidefinite, $m_P$ is nonnegative,
linear and monotone in $P$, and
\begin{equation}\label{curv:mixed-gram}
 m_P\ge2\sqrt{a_Pa_V}.
\end{equation}
When $a_Pa_V>0$, equality in \eqref{curv:mixed-gram} holds exactly
when the two real Gram matrices of the pair for $P$ and $V$ are
proportional.
\end{lemma}
```

(b) 机制：复 Cauchy–Schwarz $P(u_1,u_1)P(u_2,u_2)\ge|P(u_1,u_2)|^2$ ⇒ $a_P\ge b_P^2$；$V$ 复秩 1 ⇒ 等号。
$A,B$ 为两实 Gram 阵：$a_P=\det A$、$a_V=\det B$、$m_P=\operatorname{tr}(\operatorname{adj}(A)B)$。正定 $A$ 时 $C=A^{-1/2}BA^{-1/2}$，
$m_P=(\det A)\operatorname{tr}C$、$\sqrt{a_Pa_V}=(\det A)\sqrt{\det C}$，$\operatorname{tr}C\ge2\sqrt{\det C}$（二元 AM–GM 于特征值）⇒ `curv:mixed-gram`；
半正定用连续性。等号 ⇔ $C$ 标量阵 ⇔ 两 Gram 成比例。$m_P$ 线性于 $P$ 元；半正定时非负 ⇒ 单调。

(c) 机械理由：$m_D\ge2\sqrt{a_Da_V}$ 用在 §9 `pinch:algebra` 与 `pinch:positivity`；单调性用在 $D\ge(1+x)h$ ⇒ $m_D\ge(1+x)m_h$。
$V$ 复秩 1（$\dim_\C$ 纤维 $=1$）用在 $a_V=b_V^2$（否则 $a_V-b_V^2$ 残项无法消）。

(d) `[推测]`：`[推测]` 若纤维维 $>1$，$a_V=b_V^2$ 失，`pinch:algebra` 的等号分类（要求混合块全零）不再成立 ——
这或许是本构造卡在三维（纤维 1 维）而非高维的原因之一（论文未明说，`[推测]`）。

### 引理 `lem curv:errors` 与分子表达式

(a) TeX 原文：
```tex
\begin{lemma}\label{curv:errors}
For every real linearly independent tangent pair,
\begin{equation}\label{curv:contracted-errors}
 |\mathcal H_{T_4}|\le Cx a_I,\qquad
 |\mathcal H_{T_3}|\le C\sqrt q\,\sqrt{a_I m_I}.
\end{equation}
More explicitly, the three-horizontal error satisfies
\begin{equation}\label{curv:mixed-error}
 |\mathcal H_{T_3}|
   \le C\sqrt q\,\|\Xi_{HH}\|\,
                         \|\Xi_{\mathrm{mix}}\|.
\end{equation}
\end{lemma}
```
```tex
 -\mathcal H_R={} &\lambda(a_I+3b_I^2)+q(a_h+3b_h^2)
        +4a_V+m_D+6b_Db_V\\
       &-\mathcal H_{T_4}-\mathcal H_{T_3}.
\end{aligned}
```

(b) 机制：$\Xi$ 块范数（式 `curv:xi-norms`）：$\|\Xi_{HH}\|^2=2(a_I+b_I^2)\le4a_I$、$\|\Xi_{H\bar0}\|^2=m_I+2b_Ib_V$、
$\|\Xi_{\rm mix}\|^2=2(m_I+2b_Ib_V)\le4m_I$（用 $|b_Ib_V|\le\sqrt{a_Ia_V}\le m_I/2$）。$T_4$ 配对两个 $\Xi_{HH}$ ⇒ Cauchy–Schwarz
$|\mathcal H_{T_4}|\le Cx\|\Xi_{HH}\|^2\le Cxa_I$；$T_3$（恰三水平指标）配对 $\Xi_{HH}$ 与 $\Xi_{\rm mix}$ ⇒ `curv:mixed-error`。
$\mathcal H_{S_V}=4a_V$、$\mathcal H_{S_{D+V}-S_D-S_V}=m_D+6b_Db_V$（用 $a_V=b_V^2$），合并 `curv:tensor-identity` 得 `curv:negative-numerator`。

(c) 机械理由：`curv:xi-norms` 的 $\|\Xi_{\rm mix}\|\le\sqrt{4m_I}$ 把 $T_3$ 与"混合块"绑定 —— §9 正是在混合块趋零的退化平面上
用 `pinch:vanishing-error` 拿到额外消失阶。$6b_Db_V$ 可正可负是 §9 必须整组处理 `pinch:algebra` 的原因（论文 `curv:negative-numerator` 末
"The mixed term $6b_Db_V$ can have either sign"）。

(d) `[推测]`：`[推测]` 若用 $\|\Xi_{HH}\|\le C\sqrt{a_I}$ 但放弃 $m_I$ 结构，$T_3$ 界无法在退化平面（$m_I\to0$ 同时 $a_I$ 不趋零）拿到
额外消失，§9 的 $o(x^{-1/2})$ 断。

Lean：曲率张量恒等在 `HartogsCurvature.lean`（627 行）与 `HartogsModelBridge.lean`（273 行，`normalCurvature_model`）；
Gram/平面代数在 `PinchingCompact.lean` 的 `PlaneAlgebra`（`metricArea`、`H`、`Symmetries`、`Supported`、`componentNorm`）。
`horizontalPart`（4/3 水平投影）在 `HartogsErrorBounds.lean`。

## 2.8 §9　Uniform pinching on real two-planes（`sec:pinching`）

### 引理 `lem pinch:algebra`（The mixed real-plane algebra）

(a) TeX 原文：
```tex
\begin{lemma}\label{pinch:algebra}
Let \(h\) be a positive definite horizontal Hermitian form, let \(E\) be
another horizontal Hermitian form with \(E\ge h\), and let \(u_1,u_2\)
be real-linearly independent vectors in \(\mathbb C^2\oplus\mathbb C\).
Define
\[
 P_h(E)=a_h+3b_h^2+4a_V+m_E+6b_Eb_V.
\]
If \(a_ha_V=0\), then \(P_h(E)>0\).
If \(a_ha_V>0\), put \(\tau=|b_h|/\sqrt{a_h}\).
For every real \(\beta\) such that \(E\le(2-\beta)h\),
\begin{equation}\label{pinch:square}
 P_h(E)\ge
 \left(\sqrt{a_h+3b_h^2}-2\sqrt{a_V}\right)^2
 +2\beta(1+\tau)\sqrt{a_ha_V}.
\end{equation}
In particular, \(h\le E\le2h\) implies \(P_h(E)\ge0\).
If equality holds in this last conclusion, then
\[
 a_h=a_V>0,\qquad |b_h|=\sqrt{a_h},\qquad b_Eb_V<0,
\]
and both mixed blocks \(\Xi^{i\bar0}\) and \(\Xi^{0\bar i}\) vanish.
\end{lemma}
```
退化平面代数模型（引理前）：$h=I$、$E=2I$、$u_1=(e_1,1)$、$u_2=(ie_1,-i)$，代入给
$a_h+3b_h^2+4a_V+m_E+6b_Eb_V=4+4+4-12=0$、$\Xi_{\rm mix}=0$（水平与竖直投影复定向相反）。

(b) 机制：
1. 零面积情形：$a_V=0\Rightarrow b_V=0$（纤维维 1）；$a_h=0\Rightarrow$ 水平投影实相关 ⇒ 任 Hermitian 配对实 ⇒ $b_E=0$。
   故 $a_ha_V=0\Rightarrow b_Eb_V=0$，$P_h(E)\ge a_h+4a_V+m_h\ge a_{h+V}>0$。
2. $A=a_h,U=a_V>0$：Hermitian Gram 给 $0\le\tau\le1$。实基变换使水平投影 $u_H,v_H$ 对 $h$ 实标准正交（比 $|b_h|/\sqrt{a_h}$、
   $|b_E|/\sqrt{a_h}$ 不变）。$u_H\pm iv_H$ 的 $h$-范数平方 $=2(1\pm\tau)$，其 $E$-范数平方绝对差 $=4|b_E|$。一上一下比：
   ```tex
   \frac{|b_E|}{\sqrt A}
   \le\frac{(2-\beta)(1+\tau)-(1-\tau)}2
   =\frac{1+3\tau}2-\frac{\beta(1+\tau)}2
   \le\sqrt{1+3\tau^2}-\frac{\beta(1+\tau)}2.
   ```
   末步用 $1+3\tau^2-((1+3\tau)/2)^2=\frac34(1-\tau)^2\ge0$（等号仅 $\tau=1$）。此论证不需 $\beta\ge0$。
3. `curv:mixed-gram` + Hermitian Gram：$m_E\ge2\sqrt{a_EU}\ge2|b_E|\sqrt U$；$U=b_V^2$ 使 $P_h(E)\ge A+3b_h^2+4U-4|b_E|\sqrt U$
   $=(\sqrt{A+3b_h^2}-2\sqrt U)^2+2\beta(1+\tau)\sqrt{AU}$（配方），证 `pinch:square`。
4. 等号（$h\le E\le2h$，即 $\beta=0$）：$P_h(E)\ge(s-2\sqrt U)^2+4\sqrt U(s-B)\ge0$（$s=\sqrt{A+3b_h^2}$、$B=|b_E|$）。
   等号逼 $s=2\sqrt U$、$B=s$、各不等式取等 ⇒ $\tau=1$（`pinch:imaginary-bound` 严格性）⇒ $U=A$、$B=2\sqrt A$、$b_Eb_V<0$、$m_E=2B\sqrt U$。
   $a_E\ge B^2$、$m_E\ge2\sqrt{a_EU}$ ⇒ $a_E=B^2$ 且 `curv:mixed-gram` 取等 ⇒ 水平 $E$-Gram 与竖直 Gram 成比例。
   $\tau=1$ 给水平投影形如 $u_H,\sigma iu_H$；$b_Eb_V<0$ 选反定向给竖直投影 $y,-\sigma iy$ ⇒
   $\Xi^{i\bar0}=u_H^i\overline{-\sigma iy}-(\sigma iu_H^i)\bar y=0$，另一混合块同。任意基变换下 $\Xi$ 乘行列式 ⇒ 原基亦零。

(c) 机械理由：$E\ge h$（下界）用在 $P_h(E)\ge a_h+4a_V+m_h+\cdots$ 的零面积情形与配方基线；$E\le(2-\beta)h$（上界）用在第 2 步
"从上面比一个范数"。$\beta$ 允许负是 `pinch:positivity` 里 $\beta=c_1\frac x{\lambda+x}-\frac{C_1}{x^2}$ 可能为负的关键（论文"In particular ... including when $\beta<0$"）。
混合块 $\Xi_{\rm mix}=0$ 的结论被 §9 `pinch:vanishing-error` 用来给 $T_3$ 额外消失阶。

(d) `[推测]` 失败路线：
- `[推测]` 若纤维维 $\ge2$，$a_V=b_V^2$ 失，第 1 步 $b_V=0$ 与第 4 步 $U=b_V^2$ 断，$P_h$ 非负性证不出。
- `[推测]` 若 $E$ 无上界 $2h$，$|b_E|/\sqrt A$ 无界，配方 $-4|b_E|\sqrt U$ 可压倒正项，$P_h<0$ 可能。
- `[推测]` 模型 $h=I,E=2I$ 恰好 $P=0$ 说明"$E\le2h$"的常数 2 不可改大 —— 这是 `curv:D-bounds` 给 $D\le(1+2x)h$
  且 $\sqrt q\sim x$ 时 $E=D/\sqrt q\le2h$ 的紧界，任何松弛都使等号分类失效。

### 引理 `lem pinch:positivity`（Uniform negativity for large $\lambda$）

(a) TeX 原文：
```tex
\begin{lemma}\label{pinch:positivity}
Fix \(0<c\le C<\infty\) and \(0\le C_{\mathrm e}<\infty\).
There is a finite \(\lambda_0=\lambda_0(c,C,C_{\mathrm e})>0\) with the following
property.
Let \(\lambda\ge\lambda_0\), \(x\ge0\), and let \(h\) be a horizontal
Hermitian form with \(cI\le h\le CI\).  Put
\[
 q=x(1+x),\qquad G=\lambda I+xh,\qquad
 D=(1+2x)h-qhG^{-1}h.
\]
Let \(T_4,T_3\) be tensors with the Kähler symmetries and reality
condition, supported respectively on components with four and with
three horizontal indices, and satisfying
\[
 \|T_4\|\le C_{\mathrm e}x,\qquad
 \|T_3\|\le C_{\mathrm e}\sqrt q.
\]
Define
\[
 R=-\lambda S_I-qS_h-S_V-(S_{D+V}-S_D-S_V)+T_4+T_3.
\]
Then \(\mathcal H_R<0\) on every real two-plane.
\end{lemma}
```

(b) 机制（反证 + 两 regime）：先抬 $\lambda\ge\max(1,C)$ 启用 `curv:D-bounds` $(1+x)h\le D\le(1+2x)h$。
若假，有序列 $\lambda\to\infty$ 使 $F=-\mathcal H_R\le0$，$F$ 由 `curv:negative-numerator` 给（式 `pinch:leading-numerator`）。
- **Regime $q/\lambda\to0$**：单调性给 $m_D\ge c(1+x)m_I$，$|b_D|\le\sqrt{a_D}\le C'(1+x)\sqrt{a_I}$。丢正项：
  $F\ge\lambda a_I+4a_V+c(1+x)m_I-C'((1+x)\sqrt{a_Ia_V}+xa_I+\sqrt q\sqrt{a_Im_I})$。第一积项吸收进 $2a_V$，末项吸收进
  $\frac c2(1+x)m_I$（用 $q/(1+x)=x$）：$F\ge[\lambda-C''((1+x)^2+x)]a_I+2a_V+\frac c2(1+x)m_I$。
  $(1+x)^2+x=O(1+q)=o(\lambda)$ ⇒ 系数终正，而 $a_I+a_V+m_I=a_{I+V}>0$ ⇒ 矛盾。
- **Regime $\lambda/q$ 有界**（$x\to\infty$）：把水平分量乘 $q^{1/4}$ 平衡 $qS_h$（四水平槽）与 $S_V$（系数 1），
  在 $\operatorname{Re}(I+V)$ 实标准正交基下取 rescaled pairs（固定紧 Stiefel 流形，$a_{I+V}=1$）。rescaled 主部
  ```tex
   L_x=\frac{\lambda}{q}(a_I+3b_I^2)+P_h(E),\qquad E=\frac D{\sqrt q}.
  ```
  rescaled 误差 $\|\widetilde T_4\|\le C'x/q=O(x^{-1})$、$\|\widetilde T_3\|\le C'q^{-1/4}=O(x^{-1/2})$（每水平槽供 $q^{-1/4}$）。
  $E\ge h$；特征值 $d\in[c,C]$ 上 $E/h=\frac{1+2x}{\sqrt q}-\frac{\sqrt q\,d}{\lambda+xd}$，用 $\frac{1+2x}{\sqrt q}=\sqrt{4+1/q}\le2+C_1/x^2$、
  $\frac{\sqrt q\,d}{\lambda+xd}\ge c_1\frac x{\lambda+x}$ ⇒ `pinch:E-bounds` $h\le E\le(2+C_1/x^2-c_1\frac x{\lambda+x})h$。
  取子列收敛，极限 $h\le E\le2h$，误差趋零，`lem pinch:algebra` 给两和项非负 ⇒ 都须为零 ⇒ $P_h(E)=0$ ⇒ $a_h,a_V>0$ 且极限混合块零。
  $c^2a_I\le a_h\le C^2a_I$ ⇒ $a_I,a_h,a_V$ 沿子列正下界。
  **改进误差**：三水平张量只能配一 $\Xi_{HH}$ + 一 $\Xi_{\rm mix}$，而 $\Xi_{\rm mix}\to0$ ⇒ `pinch:vanishing-error`
  $|\mathcal H_{\widetilde T_3}|\le C'q^{-1/4}\|\Xi_{HH}\|\|\Xi_{\rm mix}\|=o(x^{-1/2})$（显式 $q^{-1/4}$ 因子制造额外阶，
  不需平面收敛速率）。
  取极限前用 `pinch:square`（$\beta=c_1\frac x{\lambda+x}-\frac{C_1}{x^2}$，可负）：`pinch:positive-gap`
  $L_x\ge c_2(\lambda/q+\frac x{\lambda+x})-C_2/x^2$。$x\ge1$ 时若 $\lambda\ge x^{3/2}$ 则 $\lambda/q\ge1/(2\sqrt x)$；
  若 $\lambda\le x^{3/2}$ 则 $\frac x{\lambda+x}\ge1/(\sqrt x+1)\ge1/(2\sqrt x)$。故 $L_x\gtrsim x^{-1/2}>$ 误差 $o(x^{-1/2})$ ⇒ $F>0$，矛盾。

(c) 机械理由：
- $C_{\rm e}<\infty$ 是给 $T_3,T_4$ 的一致界前提（来自 `base:jets`）；去掉（$C_{\rm e}=\infty$）则 rescaled 误差不趋零。
- $cI\le h\le CI$：$c$ 用在 $m_D\ge c(1+x)m_I$ 与 $c^2a_I\le a_h$；$C$ 用在 $|b_D|\le C'(1+x)\sqrt{a_I}$ 与 $a_h\le C^2a_I$。
- $\lambda_0$ 依赖 $(c,C,C_{\rm e})$：第一 regime 要 $\lambda\gg(1+x)^2$，第二 regime 要 $x^{-1/2}$ 间隙压过误差 —— 两下界合成 $\lambda_0$。
- 关键"退化平面上 $T_3$ 额外消失"：`pinch:algebra` 等号 ⇒ 混合块零 ⇒ `pinch:vanishing-error` 的 $o(x^{-1/2})$，
  这是论文 §1 自述"cancellation gives stronger error control near the degenerate planes"的实现处。

(d) `[推测]` 失败路线：
- `[推测]` 若 $\beta$ 必须 $\ge0$（`pinch:algebra` 不允许负），当 $c_1\frac x{\lambda+x}<C_1/x^2$ 时无法选合法 $\beta$ 造正间隙，
  退化平面 $L_x$ 可能仅 $O(x^{-1})$，被 $T_3$ 的 $O(x^{-1/2})$ 误差压倒。`pinch:algebra` 的"不需 $\beta\ge0$"正是为救这一路。
- `[推测]` 若不用 $q^{1/4}$ rescale，直接 $\lambda/q$ 界，$qS_h$ 与 $S_V$ 系数失衡，$x\to\infty$ 时主部 $L_x$ 无紧化子列。
- `[推测]` 若 $\Xi_{\rm mix}$ 不趋零（即没先证 $P_h(E)=0\Rightarrow$ 混合块零），$T_3$ 只有 $O(x^{-1/2})$ 非 $o(x^{-1/2})$，
  与 $L_x\gtrsim x^{-1/2}$ 同阶无法严格 $F>0$。

### `proof of Proposition metric:transfer`（§9 末尾：固定参数双侧界）

(a) TeX 原文要点（紧性 + 边界极限）：
```tex
Choose any finite \(\lambda\ge\lambda_0\).
Then \(-\mathcal H_R>0\) for every point and every real two-plane.
...
First restrict \(x\) to a bounded interval \([0,X]\).
Normalize the pairs for \(\operatorname{Re}(I+V)\).
... This set is compact.
The formulas for \(G,D,R\) are continuous on it.
...
\widetilde R_x=-S_{h+V}+O_\lambda(x^{-1/2})
...
K=-\frac12\left(1+
     3\frac{b_{h+V}^2}{a_{h+V}}\right)
 \in[-2,-1/2].
```

(b) 机制：
- $\lambda\ge\lambda_0$ 用 `lem pinch:positivity` 得逐点 $-\mathcal H_R>0$。
- **有界 $x\in[0,X]$**：归一化后，$(x,h,T_4,T_3,\text{pair})$ 落在有限维闭有界集（约束 $cI\le h\le CI$、分量型与对称、
  $C_{\rm e}x$/$C_{\rm e}\sqrt q$ 闭范数界）⇒ 紧。$G,D,R$ 连续 ⇒ $-\mathcal H_R$ 有严格正最小与有限最大；$G+V$ 一致正定有界
  ⇒ $a_{G+V}$ 上下有界 ⇒ `curv:sectional` 给 $0\le x\le X$ 双侧界。
- **$x\to\infty$**：rescale，固定 $\lambda$ 下 $D/\sqrt q\to h$（`pinch:D-limit`，$=O_\lambda(x^{-1})$；注意此处 $\lambda$ 固定，
  与 `pinch:positivity` 反证里 $D/\sqrt q$ 可趋 $[h,2h]$ 任意值不同）。度量极限 $\widetilde g_x=G/\sqrt q+V$（`pinch:metric-limit` $=O_\lambda(x^{-1})$）。
  张量极限 `pinch:tensor-limit` $\widetilde R_x=-S_{h+V}+O_\lambda(x^{-1/2})$。极限度量 $h+V$、张量 $-S_{h+V}$ 给
  $K=-\frac12(1+3b_{h+V}^2/a_{h+V})\in[-2,-1/2]$（$a_{h+V}\ge\min(c,1)^2$ 下界、紧族 ⇒ 一致收敛）。
  足够大 $X_\lambda$ 使 $x\ge X_\lambda$ 时 $-3\le K_g\le-1/4$。合并有界段 ⇒ $0<A\le B$。零截面 $x=0$ 由 `curv:zero-section` 光滑延拓覆盖。

(c) 机械理由：$-2,-1/2$ 来自 $b_{h+V}^2/a_{h+V}\in[0,1]$（Hermitian Gram $a\ge b^2$）—— 纤维维 1 使 $b_V^2=a_V$，
极限曲率区间 $[-2,-1/2]$ 与盘模型 $-2$ 吻合。$O_\lambda(x^{-1})$ vs $O_\lambda(x^{-1/2})$：前者度量、后者张量，
一致收敛靠 `pinch:metric-limit`--`pinch:tensor-limit`。$X_\lambda$ 依赖固定 $\lambda$（$O_\lambda$ 记号）。

(d) `[推测]` 失败路线：
- `[推测]` 若 $x\to\infty$ 极限 $D/\sqrt q$ 不趋 $h$（例如 $\lambda$ 也随 $x$ 变），则极限张量不是 $-S_{h+V}$，$K$ 区间无定，
  上界 $B_\lambda$ 可能 $=\infty$。论文区分"固定 $\lambda$（此处）"与"$\lambda\to\infty$（反证）"正为此。
- `[推测]` 若有界段闭性不够（例如 $C_{\rm e}x$ 界不闭合），紧性失，最小值可能 $=0$（$-\mathcal H_R$ 不严格正），下界 $A$ 断。

Lean：`pinchingThreshold`（`PinchingCompact.lean:591`，`max(C+1, max(18C²+errorCoefficient+1, max(2·(5C²/4)+1, ...)))`）、
`errorCoefficient`（:586，$E+E^2/(2c)$）、`thresholdGap`（:588，$c^3/(8(2(errorCoefficient+1)+C))$）、
`metricErrorConstant`（`HartogsFrame.lean:97`，$=9(C+4C^2/c)$）、
`metricThreshold`（:98，$=\text{pinchingThreshold } c C\,(162\cdot\text{metricErrorConstant } c C)$）—— **162 是 Lean 落地论文 $C_{\rm e}$ 的具体放大器**；
`curvatureModel_uniform_pinching`（:2814，签名 `pinchingThreshold c C (162*Ce) ≤ lam`）、
`compact_uniform_all_planes`、`hartogsMetric_uniform_pinching`（`HartogsPinching.lean:21`）。
两 regime 的机器化在 `PinchingCompact.lean`（2889 行）与 `HartogsCurvature.lean`。

# 三、叙事时间线

> 只写论文里有的自述；其余一律标 `[推测]`。逐字引用 TeX 原文，保留 `\cite`。

## 3.1 动机（论文自述，§1 首段）

> A bounded domain in $\C^n$ has bounded holomorphic coordinate functions
> whose differentials are independent everywhere. The negatively curved
> uniformization problem asks whether curvature and completeness can
> force a complex manifold to possess such coordinates. In complex
> dimension one, a complete simply connected surface whose curvature is
> bounded above by a negative constant is biholomorphic to the disk. In higher
> dimension, the existence of bounded holomorphic coordinates is a
> separate global analytic requirement.

术语约定（§1 自述）：
> Here and throughout, sectional curvature refers to the underlying real
> Riemannian metric, and completeness means geodesic completeness. A
> bounded holomorphic map is a holomorphic map with bounded image in its
> Euclidean target.

## 3.2 已知障碍（论文自述）

**障碍 1 — 单位球太苛刻**（§1）：Mostow–Siu 紧负曲率 Kähler 曲面不被球覆盖 `\cite{MostowSiu1980}`，
Deraux 复习并得三维例子 `\cite{Deraux2005}`：
> These non-ball results, however, do
> not exclude a biholomorphism to some other bounded domain; that is
> the stronger obstruction sought here.

**障碍 2 — 内在度量比较给不出固定 tuple**（§1.1"Intrinsic metrics and bounded functions"）：
Greene–Wu Bergman 度量下比较 `\cite{GreeneWu1979}`，Wu–Yau 补上界 `\cite[Theorems~4 and~6]{WuYauInvariant2020}`，
并比较 Bergman、Kobayashi–Royden、完备负 Kähler–Einstein、原度量 `\cite[Corollary~7]{WuYauInvariant2020}`：
> These comparisons
> do not supply a fixed tuple of bounded holomorphic functions with
> independent differentials everywhere. Applied to the example in
> Theorem~\ref{main:theorem}, they show that all these intrinsic metrics
> can be complete and mutually comparable while no such tuple exists.

**障碍 3 — "存在非常值有界全纯函数"是另一问题**（§1.1 末，与姊妹论文对照）：
> The companion paper
> \cite[Theorem~1.1]{OpenAIOneSided2026} constructs, in a sufficiently
> large fixed finite complex dimension, a domain diffeomorphic to
> Euclidean space with a complete K\"ahler metric of real sectional
> curvature at most $-1$ and only constant bounded holomorphic functions.
> Its curvature is unbounded below. Here both curvature bounds are
> finite and uniform, while the two bounded base coordinates remain.
> The two constructions and their proofs are independent.

`[推测]` 此段是作者刻意划界：本文与 `\cite{OpenAIOneSided2026}` 都反 uniformization，但一个"双侧有限曲率 + 保留两个基坐标"、
一个"单侧曲率下无界 + 只有常数有界函数"，二者是互补反例。`[推测]` 说明作者考虑过"能不能合并"，答案是构造与证明都独立。

**障碍 4 — 已有盘丛曲率结果覆盖不到本例**（§1.2）：Hao–Chen–Wang 在"丛曲率决定底度量"时给 pinching
`\cite[Theorems~1 and~2]{HaoChenWang2025}`，Hao–Chen–Wang–Zhang 在 KE 盘丛下 `\cite[Sections~4.2--4.3]{HaoChenWangZhang2026}`：
> The estimate needed here concerns all real two-planes when the base
> form $\lambda\partial\bar\partial\psi$ and the fiber-weight curvature
> $\partial\bar\partial\phi$ are independent. We assume upper and lower
> bounds for the latter form and bounds for the component derivatives
> needed for curvature, expressed in centered ball coordinates. No curvature sign for the metric
> $\partial\bar\partial\phi$ is assumed. We derive and estimate the
> full curvature tensor under precisely these hypotheses.

`[推测]` 作者明说自己的曲率估计在"底形式与纤维权曲率独立、且不假设 $\partial\bar\partial\phi$ 的曲率符号"下进行 ——
这是相对前面文献的增量。

**障碍 5 — 代表测度不必满足对数不等式**（§1.2 + §5）：Hedenmalm 显式反例 `\cite[Theorem~3.7]{Hedenmalm1989}`：
> The probabilities preserve
> holomorphic evaluation at the origin, but such
> measures need not preserve the logarithmic mean inequality for
> holomorphic functions: Hedenmalm gives an explicit example of this
> distinction \cite[Theorem~3.7]{Hedenmalm1989}.

（§5 再引："Here we need smooth logarithmic tests and negative bounds that persist through all later density corrections. We prove these properties directly for the densities of Theorem~\ref{density:main}."）

## 3.3 相关文献逐条（bib 核对，含精确出处）

以下全部来自 `references.bib` 与正文 `\cite`，逐条核对：
- `WuNormal1967`：Wu, H., *Normal families of holomorphic mappings*, Acta Math. **119** (1967) 193–233；问题(1) 在 p.195。
- `WuYauSurvey2019`：Wu, Damin; Yau, Shing-Tung, *Some negatively curved complex geometry*, ICCM 手稿 2019；Conjecture 4.3 在 p.18。
- `WuYauInvariant2020`：同作者, *Invariant metrics on negatively pinched complete Kähler manifolds*, JAMS **33**(1) (2020) 103–133；Theorems 4、6，Corollary 7。
- `MostowSiu1980`：Mostow, Siu, *A compact Kähler surface of negative curvature not covered by the ball*, Ann. of Math. **112**(2) (1980) 321–360。
- `Deraux2005`：Deraux, *A negatively curved Kähler threefold not covered by the ball*, Invent. Math. **160**(3) (2005) 501–525。
- `GreeneWu1979`：Greene, Wu, *Function Theory on Manifolds Which Possess a Pole*, LNM **699**, Springer 1979。
- `GrauertLevi1958`：Grauert, *On Levi's problem and the imbedding of real-analytic manifolds*, Ann. of Math. **68**(2) (1958) 460–472；Theorem 2 与 §3.4。
- `Calabi1979`：Calabi, *Métriques kählériennes et fibrés holomorphes*, Ann. Sci. ENS **12**(2) (1979) 269–294；§3 式 (3.1)–(3.2)。
- `HwangSinger2002`：Hwang, Singer, *A momentum construction for circle-invariant Kähler metrics*, Trans. AMS **354**(6) (2002) 2285–2325。
- `RyllWojtaszczyk1983`：Ryll, Wojtaszczyk, *On homogeneous polynomials on a complex ball*, Trans. AMS **276**(1) (1983) 107–116；§2 与 Lemma 2.7（p.112）。
- `Hedenmalm1989`：Hedenmalm, *Closed ideals in the ball algebra*, Bull. LMS **21**(5) (1989) 469–474；Theorem 3.7。
- `HaoChenWang2025`：Hao, Chen, Wang, *On the negatively pinched properties of the disc bundles...*, arXiv:2509.04179v1；Theorems 1、2。
- `HaoChenWangZhang2026`：Hao, Chen, Wang, Zhang, *The curvature estimation of the complete Kähler–Einstein metrics on the disk bundles*, arXiv:2609.14482v1；§4.2–4.3。
- `Aleksandrov1983`：Aleksandrov, *The existence of inner functions in the ball*, Math. USSR-Sb. **46**(2) (1983) 143–159；Lemmas 2–3。
- `OpenAIOneSided2026`：OpenAI, *One-sided negative sectional curvature and the holomorphic Liouville property*, OAI preprint 2026；Theorem 1.1（姊妹论文）。

`[推测]` 谱系判断：构造骨架来自 Calabi（1979）位势 + Hwang–Singer（2002）动量形式；
解析峰与幂和来自 Ryll–Wojtaszczyk（1983）与 Aleksandrov（1983）；对数测试的"反 Jensen"姿态来自 Hedenmalm（1989）；
问题本身来自 Wu（1967）与 Wu–Yau（2019/2020）。`[推测]` Hao–Chen–Wang 系列是作者明确"要超越其独立性假设"的近邻工作。

## 3.4 构造自述逐字（§1.2"Construction and proof strategy"）

域与度量的自述：
> We construct $M$ as a family of discs over the unit ball
> $\B=\{z\in\C^2:|z|<1\}$. A smooth real function $\phi$ on $\B$ determines
> \[
>  M_\phi=\{(z,w)\in\B\times\C:e^{\phi(z)}|w|^2<1\}.
> \]
> Thus the disc above $z$ has radius $e^{-\phi(z)/2}$. Put
> $\psi(z)=-\log(1-|z|^2)$. Our metric is the complex Hessian of
> \[
>  \lambda\psi(z)-\log\bigl(1-e^{\phi(z)}|w|^2\bigr),
> \]
> with the real-metric convention specified in
> Section~\ref{sec:reduction}. This is a specialization of Calabi's
> construction from a base potential and a radial function of a Hermitian
> fiber norm \cite[Section~3, equations~(3.1)--(3.2)]{Calabi1979}.

解析任务的自述（代表测度 + 负平均）：
> The analytic task is to choose $\phi$ so that it has these derivative
> bounds but cannot dominate a holomorphic real part, even after adding
> the logarithmic boundary allowance forced by Cauchy's estimate for a
> Jacobian. To do this, we construct radii $r_N\uparrow1$ and positive
> probabilities $\mu_N$ on the unit sphere $S\subset\C^2$ such that
> \[
>  \int_S\left(\phi(r_N\xi)+4\log\frac1{1-r_N}\right)
>                   \,d\mu_N(\xi)\longrightarrow-\infty,
> \]
> while $\int_S\operatorname{Re}H(r_N\xi)\,d\mu_N(\xi)
> =\operatorname{Re}H(0)$ for every holomorphic $H$ on $\B$.

构造分层的自述：
> The construction proceeds at degrees $k_j=Q^j$ for one fixed large
> integer $Q$. At each degree we sum homogeneous peaks centered on a
> separated set of complex lines. The projective packing and power-sum
> estimate have a direct antecedent in Ryll and Wojtaszczyk
> \cite[Section~2]{RyllWojtaszczyk1983}. A radial correction around each
> peak annihilates every holomorphic moment exactly. Separation of the
> degrees makes the corrections compatible with positivity at every
> stage. Regularized logarithms built from the peak polynomials then have a
> fixed negative average, which survives all subsequent corrections.
> Summing these logarithms with a sufficiently large fixed coefficient
> makes their negative averages dominate the boundary allowance.
> Low degrees vary little
> in a centered chart, while high degrees are exponentially small;
> this gives the uniform derivatives through order four needed for
> curvature.

几何任务的自述（退化平面上的消失 —— §1 与 §9 呼应）：
> The geometric task has its own delicate point. To prove negative
> curvature, we must show that its negated numerator is positive on every
> real two-plane. After rescaling the base directions, the leading
> expression is nonnegative but can vanish on planes with nonzero base
> and fiber projections. On these limiting planes the contribution of the
> potentially largest error term vanishes as well. This cancellation gives stronger error
> control near the degenerate planes and proves strict negativity for
> one sufficiently large base parameter $\lambda$.
> With $\lambda$ fixed, compactness on bounded
> fiber ranges and a uniform limiting tensor at the fiber boundary give
> both finite curvature bounds.

§1.2 末尾论文自述的行文路线（sections 导览，逐字）：
> Section~\ref{sec:reduction} states the two precise ingredients and derives
> Theorem~\ref{main:theorem} from them by Cauchy estimates for a putative
> Jacobian. Sections~\ref{sec:peaks}--\ref{sec:densities} construct the
> peaks and positive representing densities;
> Sections~\ref{sec:tests}--\ref{sec:base-potential} establish their
> logarithmic tests and the controlled potential.
> Section~\ref{sec:hartogs} proves completeness.
> Sections~\ref{sec:curvature}--\ref{sec:pinching} compute the curvature
> and prove the two-sided estimate, including the limiting planes just
> described.

## 3.5 零截面论证的两处"免责声明"（§2 末，逐字）

> The logarithm argument uses nonvanishing along the entire zero section.
> It gives no assertion that a bounded map's determinant vanishes
> identically.  Nor are all bounded holomorphic functions constant:
> $z_1$ and $z_2$ are nonconstant bounded holomorphic functions on $M_\phi$.

## 3.6 [推测] 时间线重建（论文未述）

`[推测]` 以下按论证依赖反推作者的思考顺序（非论文明说）：
1. `[推测]` 先确立"归约骨架"：意识到 Cauchy 估计给 Jacobian 上界 $\le C\delta^{-2}e^{\phi/2}$，
   取对数平方后必是 $4\log\frac1{1-|z|}+\phi+$ 常数形式 ⇒ 反推需要"无 pluriharmonic 下界"的 $\phi$，且下界里的
   $4\log$ 系数被 Cauchy 逼定（不是自由选择）。这一步决定后续 $u=\phi+4\log$。
2. `[推测]` 再发现"代表测度 + 负平均"引擎（`lem peaks:mean-criterion`）足够把"无下界"翻译成可构造条件；
   并确认 Hedenmalm 反例意味着不能用 Jensen，得逐密度硬做。
3. `[推测]` 设计峰多项式（借 Ryll–Wojtaszczyk 的射影 packing + 幂和），发现需要 patch 内径向校正消全纯矩 ——
   $b'-b=f$ 与加权抵消是为此而生。
4. `[推测]` 为让负对数平均"活过后续密度修正"，构造 $k_j=Q^j$ 指数分离次数，使频率间隙 $(Q-2)k_j$ 可控
   （`lem tests:later`）。
5. `[推测]` 几何侧先建 Hartogs 度量与完备性（§7，独立于大 $\lambda$），再算张量（§8），最后逼出
   "退化平面 $T_3$ 额外消失"这一 pinching 关键引理（§9 `pinch:algebra` 等号分类）。
6. `[推测]` 维度 3 的选择：纤维 1 维 + 基 2 维使 $a_V=b_V^2$（复秩 1）成立，是 `pinch:algebra` 等号分类与
   $K\in[-2,-1/2]$ 极限区间的结构前提。更高纤维维可能失效（论文未述，`[推测]`）。

# 四、Lean 取证

### 4.1 模块清单与行数

对应 `formalization.yaml:112`（标题条目）与 1378–1380（`PinchedKahler.json` / `OAI.PinchedHartogs.main_theorem` / `OAI/Geometry/Kahler/Main.lean`）；`ComparatorChallenges\PinchedKahler.json` 三个目标定理 = `main_theorem`、`controlled_potential`、`metric_transfer`，`definition_names: []`，`permitted_axioms: ["propext","Quot.sound","Classical.choice"]`，`enable_nanoda: false`。整个 `OAI/Geometry/Kahler/` 共 36 个 `.lean`、约 6000 行，全部 `sorry`-free（`grep sorry` 无命中）。按论文构件归类：

| 论文构件 | Lean 文件（行数） | 关键定义/定理 |
|---|---|---|
| 主定理 | `Main.lean` (44) | `theorem controlled_potential : ControlledPotential` (:23)、`theorem main_theorem : MainTheorem` (:38) |
| 定义（M_φ、curvature、pinching、NoBoundedCoordinates、BiholomorphicToBoundedDomain、MainTheorem、centeredChart、ChartControl/ChartJets、ControlledPotential、MetricTransfer） | `Definitions.lean` (158) | `hartogs` (:18)、`sectional` (:66)、`IsNegativelyPinched` (:86)、`MainTheorem` (:100)、`ControlledPotential` (:142)、`MetricTransfer` (:146) |
| 障碍引理 map:obstruction | `Obstruction.lean` (273) | `map_obstruction` (:249)、`jacobian_det_bound` (:213)、`jacobian_log_bound` (:228)、`exists_holomorphic_log` (:50)、`simplyConnected_ball` (:22) |
| §3 peaks | `BasePeaks.lean` (186)、`BaseSets.lean` (377) | `homogeneousPeak`/`meanCriterion`/`projectivelySeparated`/`patchSet` |
| §3 profiles peaks:profiles | `BaseProfiles.lean` (295) | `RadialProfiles` (:172)、`cosh_strict_quadratic` (:20)、`exists_profile_amplitude` (:26)、`exists_radialProfiles` (:196) |
| §4 density density:main | `BaseDensityDefinitions.lean` (56)、`BaseDensityInduction.lean` (285)、`BaseDensityTheorem.lean` (157)、`BaseSeparation.lean` (254) | `density` 递归 (:38)、`DensityStage` (:20)、`density_induction` (:26)、`uniform_representing_densities` (:20) |
| §5 tests | `BaseLogTests.lean` (137)、`BaseMeans.lean` (45)、`BaseModelParameters.lean` (54)、`BaseTestSystem.lean` (127) | `TestSystem` (:20)、`exists_testSystem` (:44)、`Represents` (:25)、`modelGap` (:29) |
| §6 base | `BaseMinorant.lean` (181)、`BaseChartEstimates.lean` (209) | `TestSystem.noMinorant` (:65)、`series_mean_bound` (:20) |
| §7–§8 Hartogs 度量的 Kahler/完备性/曲率 | `MetricCalculus.lean` (1513)、`HartogsCompletenessSupport.lean` (356)、`HartogsMetric.lean` (218) | `hartogsMetric_isKahler` (:805)、`hartogsMetric_geodesicallyComplete` (:319) |
| §8 局部框架/误差 | `LocalFrame.lean` (594)、`LocalFrameTools.lean` (317)、`ErrorTerms.lean` (111)、`MetricError.lean` (92)、`HartogsGaugeTransfer.lean` (89) | `curvature_tensor_decomposition`、`metric:errors` 常数 |
| §9 pinching 代数 | `PinchingAlgebra.lean` (311)、`PinchingCompact.lean` (2889)、`PinchingEstimates.lean` (301)、`PinchingLimit.lean` (94) | `pinchingThreshold` (:591)、`errorCoefficient` (:586)、`thresholdGap` (:588)、`curvatureModel_uniform_pinching` (:2814) |
| §2 metric:transfer | `HartogsTransfer.lean` (49)、`HartogsTransferTools.lean` (74)、`HartogsFrame.lean` (138)、`HartogsPinching.lean` (90)、`HartogsCurvatureContinuity.lean` (60)、`HartogsCharts.lean` (119) | `metric_transfer` (:22)、`main_of_controlledPotential` (:32)、`metricErrorConstant` (:97)、`hartogsMetric_uniform_pinching` (:21) |
| §2 base:existence→主定理闭环 | `HartogsTopologySupport.lean` (355)、`BaseRealPair.lean` (61)、`BaseBiholomorphism.lean` (33) | `hartogs_obstruction` (:148) |

### 4.2 依赖拓扑（import DAG，按论文构件分层）

底座（§3–§6）与度量（§7–§9）两条链在 `Main.lean` 汇合。内部 import 边（已剔除 Mathlib）：

- **底座链**：`BaseRealPair → ∅`；`BaseSets → {}`；`BasePeaks → {BaseRealPair, BaseSets}`；`BaseProfiles → {}`；`BaseDensityDefinitions → {BasePeaks, BaseDensityTheorem, BaseRealPair, BaseProfiles}`；`BaseDensityInduction → {BaseDensityDefinitions, BaseDensityTheorem, BaseMeans, BasePeaks, BaseRealPair, BaseSeparation, BaseSets}`；`BaseSeparation → {BasePeaks, BaseRealPair, BaseSets}`；`BaseDensityTheorem → {BaseDensityDefinitions, BaseDensityInduction, BaseMeans, BasePeaks, BaseRealPair, BaseSeparation, BaseSets}`（注：存在 `BaseDensityDefinitions ↔ BaseDensityTheorem` 与 `BaseDensityInduction ↔ BaseDensityTheorem` 的双向 import，Lean 允许同层互相引用只要无循环定义）；`BaseMeans → {BaseDensityDefinitions, BaseDensityTheorem, BaseRealPair}`；`BaseLogTests → {BaseDensityDefinitions, BaseDensityTheorem, BaseMeans, BasePeaks, BaseProfiles, BaseRealPair, BaseSets, HartogsTransferTools}`；`BaseModelParameters → {BaseLogTests, BaseMeans, BasePeaks, BaseProfiles, BaseRealPair, BaseSets}`；`BaseChartEstimates → {BaseDensityDefinitions, BaseDensityTheorem, BaseMeans, BasePeaks, BaseProfiles, BaseRealPair, BaseSets}`；`BaseTestSystem → {BaseChartEstimates, BaseDensityDefinitions, BaseDensityTheorem, BaseModelParameters, BaseMeans, BasePeaks, BaseProfiles, BaseRealPair, BaseSets}`；`BaseMinorant → {BaseDensityDefinitions, BaseDensityTheorem, BaseLogTests, BaseModelParameters, BaseMeans, BasePeaks, BaseProfiles, BaseRealPair, BaseTestSystem}`；`BaseBiholomorphism → {BaseRealPair}`。
- **度量链**：`ErrorTerms → {}`；`MetricError → {ErrorTerms}`；`LocalFrameTools → {}`；`LocalFrame → {ErrorTerms, LocalFrameTools, MetricError}`；`PinchingAlgebra → {}`；`PinchingEstimates → {LocalFrameTools, PinchingAlgebra}`；`PinchingLimit → {PinchingAlgebra}`；`PinchingCompact → {LocalFrameTools, PinchingEstimates}`；`HartogsMetric → {}`；`HartogsCharts → {MetricError}`；`HartogsTransferTools → {LocalFrame}`；`MetricCalculus → {HartogsCharts, HartogsMetric, LocalFrame, LocalFrameTools, MetricError, PinchingAlgebra, PinchingCompact, PinchingEstimates, PinchingLimit}`；`HartogsCompletenessSupport → {HartogsMetric}`；`HartogsCurvatureContinuity → {MetricCalculus, MetricError, PinchingCompact}`；`HartogsGaugeTransfer → {HartogsMetric, HartogsTransferTools, LocalFrame, LocalFrameTools, MetricCalculus, MetricError}`（注：跨到 `BaseMinorant`）；`HartogsFrame → {HartogsMetric, HartogsTransferTools, LocalFrame, MetricCalculus, MetricError, PinchingAlgebra, PinchingCompact}`；`HartogsPinching → {HartogsCompletenessSupport, HartogsCurvatureContinuity, HartogsGaugeTransfer, HartogsMetric, MetricCalculus, MetricError}`；`HartogsTransfer → {Definitions, HartogsFrame, HartogsPinching, PinchingCompact}`。
- **汇合**：`Definitions → {HartogsMetric, LocalFrame}`；`Obstruction → {Definitions}`；`HartogsTopologySupport → {Definitions, Obstruction}`；`Main → {BaseMinorant, BaseProfiles, BaseTestSystem, Definitions, HartogsTransfer, HartogsTopologySupport, LocalFrame}`。

**两条跨接缝边**：`BaseLogTests → HartogsTransferTools`（底座 §5 借用度量侧的叶状/转移工具）、`HartogsGaugeTransfer → BaseMinorant`（度量侧 §8 规引回底座 §6 的 noMinorant）。这两条正是论文"基底构造 ⇄ 度量计算"耦合的镜像。

### 4.3 formalization.yaml 与 ComparatorChallenges 目标

`formalization.yaml` 登记 `OAI.PinchedHartogs.main_theorem`，命名空间 `PinchedHartogs`（"Hartogs"点明构造载体）。`PinchedKahler.json` 的 permitted_axioms 三件套里 **`Classical.choice` 是被显式许可的**——这解释了取证中大量非构造性 `choose`（见 4.5）。`enable_nanoda: false` 说明该定理未走 DaS 自动战术，全部人工证明。

### 4.4 形式陈述 vs 论文措辞差异

1. **`MainTheorem`（Definitions.lean:100）比论文多三处显式合取**：论文主定理只写"$M$ 微分同胚 $\R^6$ 的开子集、度量完备负 pinched、双全纯排除"；Lean 版把几何对象拆成 `IsOpen M ∧ M.Nonempty ∧ ContractibleSpace M ∧ IsKahlerMetric g ∧ GeodesicallyComplete g ∧ IsNegativelyPinched ... ∧ NoBoundedCoordinates ∧ ¬BiholomorphicToBoundedDomain` 八个分量。`ContractibleSpace M`（可缩）代替"$\C^3$ 中可缩区域"，`¬BiholomorphicToBoundedDomain` 需单独证明（经 `BaseBiholomorphism`），不像论文那样当作"显然"。
2. **`NoBoundedCoordinates`（:90）**：论文"$F$ 每点非零 Jacobian"= Lean `∀ p ∈ M, jacobian F p ≠ 0`，其中 `jacobian`（:28）用 `fderiv ℝ` 的实 Frechet 导数取 `LinearMap.det`，与论文复 Jacobian 等价但走实映射行列式。
3. **`sectional`（:66）与 `curvature`（:62）**：因子 2 约定被硬编进定义——`sectional = ((tensorValue R u u v v).re - (tensorValue R u v u v).re)/(2*realArea (g p) u v)`，与论文 $K=(R_{1\bar1 1\bar1}g_{2\bar2}+...)/(...)$ 的 $K=\mathcal H_R/(2a_{\widehat g})$ 完全对齐。`IsNegativelyPinched`（:86）用 `LinearIndependent ℝ ![u,v]`（实线性无关）表达"$u,v$ 张成实 2 平面"，对应论文"任意实 2 平面 $\sigma$"。
4. **`ControlledPotential`（:142）把 $c$ 钉死为 1**：论文 `base:existence` 有 $(c,C)$ 两个参数，Lean 把 $c=1$（经 `BaseChartEstimates` 的归一化），只剩 $C$ 与幅度 $L$ 的自由度——见 Main.lean:25 `let L := (5*Real.log (S.Q:ℝ))/S.d+1`，用 `+1` 保证严格 $5\log Q<Ld$。
5. **`MetricTransfer`（:146）**：论文 `metric:transfer` 陈述"$\exists B,A$ 使 $-B\le K\le -A$"是存在式；Lean 版把 $A,C$ 作为输入（`1 ≤ C` 后调用 `metric_transfer 1 C`），$B$ 由 `metricThreshold`/`pinchingThreshold` 显式给出。
6. **`noMinorant`（BaseMinorant.lean:65）**：论文"$U$ 不承认任何全纯实部下界"= 一个 `∀` 否定式关于 `AnalyticOnNhd` 的实部下界，Lean 用 `∀ ε>0, ∃ ...` 序列平均 $-dN+T$（`series_mean_bound`:20）逼近。

### 4.5 卡点与非常规编码

- **非构造选择（Classical.choice 许可下）**：`BaseTestSystem.lean:78` `choose P hP using hex`（projectivelySeparated 的选点 $\mathcal P_k$）、`HartogsCompletenessSupport.lean:133` `choose r hr ε hε H`、:201 `choose γ hγ0 hγ`（测地线 $\gamma$ 的存在）、`PinchingEstimates.lean:257` 与 `PinchingLimit.lean:76` 各一处 `choose`、`Obstruction.lean:60` 一处。这些把论文的"取一列""存在单位分解""存在 $\mathcal P_k$"落成 choice 公理。
- **唯一 `Subsingleton.elim`（HartogsCharts.lean:116）**：`exact (hij (Subsingleton.elim _ _)).elim`——把"某个 chart jet 等式在两个定义上成立"经 subsingleton（证明唯一性）消去一个 proof-irrelevant 的参数不等。这是全模块仅有一处依赖命题外延/证明不相关性的地方，对应论文里"该估计对所有等价写法一致"的省略。
- **可缩性**：`simplyConnected_ball := convex_ball.contractibleSpace`（Obstruction.lean:22），直接调用 Mathlib 的球可缩实例，绕开论文"$\B$ 可缩"的显然断言。
- **`sorry`-free**：36 文件零 `sorry`；难点集中在 `PinchingCompact.lean`（2889 行，纯代数不等式机器）与 `MetricCalculus.lean`（1513 行，曲率张量分解）。
- **常数的 Lean 落地**（详见 §五账目）：
  - `a := 3/2`（BaseTestSystem.lean:46），$\alpha=\log a$ 只在 BaseProfiles 的不等式 $f\ge(\alpha^2-2s_1(\cosh\alpha-1))b$ 里出现，无需显式 $\alpha$。
  - `Q := max Q₀ (max nD (M+3))`（BaseTestSystem.lean:63）、`D := max D_star (2*sqrt (2*pr.R)+1)`（:52）、`modelGap a p := 2*p.s*(Real.log a^... )`（BaseModelParameters.lean:29，即论文 $\Delta=\Delta_{s_1}(\alpha)$）。
  - `metricErrorConstant c C := 9*(C + 4*C^2/c)`（HartogsFrame.lean:97）；`metricThreshold c C := pinchingThreshold c C (162*metricErrorConstant c C)`（:98）——注意 **162 这个放大器**（=2×81，来自 `pinch:algebra` 的 81 倍误差吸收 ×2 的实截面分母）在 Lean 里是硬编码字面量。
  - `errorCoefficient c E := E + E^2/(2*c)`（PinchingCompact.lean:586）、`thresholdGap c C E := c^3/(8*(2*(errorCoefficient c E + 1) + C))`（:588）、`pinchingThreshold := max (C+1) (max (18*C^2+errorCoefficient+1) (max (2*(5*C^2/4)+1) (2*(errorCoefficient+1)*((errorCoefficient+1)/thresholdGap+1))))`（:591）——四档 max 的闭式，正对应论文 $\lambda_0$ 的分层定义。
  - `Main.lean:29` `hamp`：`5*Real.log (S.Q:ℝ) < L*(S.d:ℝ)`，由 `L = (5logQ)/d + 1` 与 `d>0` 自动得出，是论文 `base:amplitude` $L>5\log Q/d_3$ 的可执行版。

### 4.6 额外假设与缺失假设

- **额外**：`ControlledPotential` 要求 `ChartControl` 携带 `centeredChart` 的显式表达式（论文只说"存在全纯坐标到 4 阶"）；Lean 里 $C^4$ 范数以 `baseHessian` 等辅助函数具体化，比论文更强地固定了坐标中心。
- **缺失（Lean 侧省略）**：论文 `peaks:profiles` 的 $C^4$ 正则性与"径向 profile 具体构造"在 Lean 里以 `Real.smoothTransition`（BaseProfiles.lean:55,57 左右 cut）+ `ContDiffOn ℝ 4` 公理化给出，不再重述 $f,b$ 的解析式；`density:main` 的微分算子 $A_{k,\mathcal P}$ 正定性由 `DensityStage.positive` 直接假设化，未从 Fourier 展开重建。这两处是"论文构造 ↔ Lean 公理"的最大语义间隙。

# 五、常数与参数账目表

| 对象 / 常数 | 值（论文） | 来源（论文位置） | 用途 | Lean 落地 |
|---|---|---|---|---|
| $M_\phi$（模型 Hartogs 域） | $\{(z,w)\in\B\times\C:e^{\phi(z)}|w|^2<1\}$ | §2 定义 / `Definitions.lean:18 hartogs` | 承载度量的几何域 | `hartogs φ` |
| $\phi=\psi+L\sum_j U_{k_j}$ | 基底势 | §6 定义（base:minorant 前） | 定义 $M_\phi$ 与 metric 势 | 经 `BaseMinorant` |
| $\psi=-\log(1-|z|^2)$ | Bergman 型基势 | §3 / §6 | 提供负 pinched 骨架、$\alpha\psi$ 项 | — |
| $a$（peak 直径比） | $3/2$ | §5 选取（"fix $a>1$"） | 决定 $\alpha=\log a$、$\Delta$ | `BaseTestSystem.lean:46 a:=3/2` |
| $\alpha=\log a$ | $\log(3/2)$ | §3 peaks:profiles | 出现在 negativity 与 $f$ 下界 | 隐式于 `modelGap` |
| $s_1$ | 剖面一阶矩 $>0$ | §3 `peaks:profiles` | 决定 $\Delta$ 大小 | `RadialProfiles.s` |
| $\Delta=2s_1(\cosh\alpha-1)-\alpha^2$ | $>0$ | §3 negativity $\alpha^2-2s_1(\cosh\alpha-1)<0$ | 每个测试函数负平均的"预算" | `BaseModelParameters.lean:29 modelGap`（正性 = `p.negativity`） |
| $R_0,f,b$（径向剖面） | $b'-b=f,\ \int e^{-y}f=0$ | §3 `peaks:profiles` | 构造 $U_k$ 的径向因子，保证取消性与负性 | `RadialProfiles`（:172，字段 f/b/R/cancellation/ode/negativity） |
| $c_0=(1-\|f\|_\infty)/4$ | $>0$ | §3 profile 归一 | patch 支撑宽度的下界 | — |
| $D_0$ | 代表测子的导数常数 | §4 `density:main` | 把测试函数平均误差限成 $O(1/D)$ | `uniform_representing_densities` 中的 $K$/$D$ |
| $k_j=Q^j,\ \ell_j=\sum_{l\le j}k_l$ | 次数阶梯 | §4 递归 | 带宽隔离：新 $k_j$ 项不被旧 $W$ 干扰 | `density` 递归里 `Q^(j+1)` |
| $Q$ | $\max(Q_0,\max(nD,M+3))$ | §5 `tests:negative`/`tests:later` | 频率间隔，锁死带宽，保负平均存活 | `BaseTestSystem.lean:63 Q:=max Q₀(max nD (M+3))` |
| $K_+$ | 轨道增长常数 | §4 `density:orbit-growth` | 控制 $\sum_p A_{j,p}$ 规模 | `DensityStage.step` 上下界 $cW_i\le W_j\le 2W_i$ |
| $C_2=2D_{\mathcal R}[4(F+B)+F_1+B_1]$ | patch 导数界 | §4 `density:weighted-derivative` | 使 $f,b,R$ 及加权导数可控 | `density_induction` 的 hderH/hderT |
| $\epsilon,\eta$ | $\epsilon\le\sqrt{\Delta/(8\kappa)},\ \eta<1/2$ | §5 规整化 | 令 $\kappa\epsilon^2\le\Delta/8$、modelMean $\le-(3/4)\Delta$ | `model_regularization_parameters`（:48 min(δ/4,1/2,√(Δ/(8κ)))） |
| $D^\star,k^\star$ | 均值判据阈值 | §5 `tests:averaging` | 保证代表测子足够"锐" | `D:=max D_star (...)` :52 |
| $d_2=\Delta/(2D_0^2)$ | 中间负平均率 | §5 `tests:negative` | 单位 patch 平均 $\le-d_2$ | `TestSystem.d` 相关 |
| $d_3=d_2/2$ | 稳定负平均率 | §5 `tests:later` | 抗后续密度的负平均下限 | `TestSystem.d` |
| $U_k=F_\epsilon(P_k),\ P_k=\sum_{p\in\mathcal P_k}\langle z,p\rangle^k$ | 齐次峰复合 | §3/§5 | 提供负实部测试函数 | `homogeneousPeak`（BasePeaks） |
| $L$（振幅） | $>5\log Q/d_3$ | §6 `base:amplitude` | 让峰项压过 $\psi$，逼出 $-\infty$ 平均、排除实部下界 | `Main.lean:25 L:=(5*log Q)/d+1`；`hamp`(：29) `5*log Q < L*d` |
| $\lambda$（$=\lambda_0$ 阈值） | `metricThreshold c C` | §8/§9 `pinch:algebra` | 高 $\lambda$ 保证近 $q=0$ 时 pinching | `HartogsFrame.lean:98` |
| $q$（fiber 系数） | $\mathcal K_\lambda=\lambda\psi-\log(1-t)$ 中的 $-q$ 权重 | §8 metric:transfer | 两 regime 之一（$q/\lambda\to0$、$\lambda/q$ 有界） | `MetricCalculus` |
| $C_e$（度量误差常数） | `metricErrorConstant c C` | §8 `curv:errors` | 乘 162 得 pinching 输入误差 | `HartogsFrame.lean:97 9*(C+4*C^2/c)` |
| 放大器 $162$ | $2\times 81$ | §9 `pinch:algebra`（81 倍误差吸收 ×2 实截面分母） | 把局部框架误差压进阈值 | `metricThreshold` 硬编码 `162*metricErrorConstant` |
| $\operatorname{errorCoefficient}(\lambda_0,\lambda_1,E)$ | $E+E^2/(2\lambda_0)$ | §9 `pinch:algebra` | 阈值公式组件 | `PinchingCompact.lean:586 errorCoefficient c E` |
| $\operatorname{thresholdGap}$ | $\lambda_0^3/[8(2(\operatorname{ec}+1)+\lambda_1)]$ | §9 | 矛盾论证中 pinching 的"余量" | `PinchingCompact.lean:588 thresholdGap` |
| $\lambda_0$ | 四档 max 闭式 | §9 `pinch:algebra` | pinching 成立的势参数门限 | `PinchingCompact.lean:591 pinchingThreshold` |
| $P_h(E)$（非负多项式） | $a_h+3b_h^2+4a_V+m_E+6b_Eb_V$ | §8 `pinch:positivity` | 非负性 + 等号 ⇒ $\Xi_{\rm mix}=0$ 刚性 | `PinchingAlgebra.lean` |
| $K$（极限截面曲率） | $\in[-2,-1/2]$ | §9 极限张量 $\widetilde R_x=-S_{h+V}+O_\lambda(x^{-1/2})$ | 建立 $-B\le K\le -A$ 的具体 $A=1/2,B=2$ 型钳制 | `curvatureModel_uniform_pinching :2814` |
| 实截面约定因子 2 | $K=\mathcal H_R/(2a_{\widehat g})$ | §8 `curv:real-plane` | 全篇 $g=2\operatorname{Re}\widehat g$ | `sectional`（Definitions.lean:66 分母 `2*realArea`） |
| $B$（pinching 上界） | `pinchingThreshold`-型存在式 | §9 `metric:transfer` | $-B\le K$ | `metric_transfer 1 C` |
| $A$（pinching 下界） | $=1$（$c$ 归一后） | §9 | $K\le -A$ | `Main.lean:34 1 ≤ C` |
| $C$（chart-jet 界） | `ControlledPotential` 输出 | §6 `base:chart-estimates` | 流入 `metricErrorConstant` | `ChartControl`/`ChartJets`（:131/:136） |

<!-- 完 -->
