# 【增补·Artin 篇】《An Artin group with no geometric CAT(0) action》素材

> 目标论文：OpenAI，2026-09-23，`E:/math/preprints/An-Artin-group-with-no-geometric-CAT-0-action-September-23-2026/build/`
> （`main.tex` + `macros.tex` + `sections/{introduction,lengths,braids,sectors,diagrams,localization,assembly,references}.tex`，
> 全部逐个完整读取；未使用 pdftotext/PDF）。Lean：`E:/math/lean/OAI/GroupTheory/ArtinCAT0/`。

## A-0 接续说明（写作前必读）

1. **本篇与上文不是同一篇论文。** 本文件 §1–§2.23 重建的是 2026-09-25 的 *A hyperbolic group with no
   geometric CAT(0) action*；其头部第 20–22 行已明确记录"姊妹篇 Artin 在本篇正文中完全没有被引用"。
   任务给出的"文件停在 §2.5、§2.6 之后全缺"的前提与当前文件状态不符（本次核对：文件已到 §2.23）。
   因此**不接续 §2.6 编号**，另起 `A-` 前缀命名空间，避免与并行写入者冲突、避免编号污染。
2. **并行写入风险已核实**：本会话期间该文件从 110,969 → 157,262 字节（mtime 17:09），有另一路写入者正在
   续写双曲篇。每次追加前均重新核对文件末行锚点。若哨兵 `<!-- 完 -->` 之后再次出现他人内容，属并发结果，
   非本块错乱。
3. **编号规则**：`macros.tex` 中 `\newtheorem{theorem}{Theorem}` 且 `proposition/lemma/corollary/definition/remark`
   共用 `[theorem]` 计数器 + `\numberwithin{equation}{section}` ⇒ 每节内定理类环境按出现顺序连续编号。
   据此推得本篇编号：§2 引理 2.1–2.4；§3 命题 3.1、引理 3.2；§4 命题 4.1、引理 4.2–4.6；§5 引理 5.1–5.2、
   命题 5.3、引理 5.4；§6 引理 6.1–6.2；§7 定义 7.1、引理 7.2–7.5；引言内定理 1.1。**一律同时给出 LaTeX label**，
   label 为稳定寻址（各环境行号已用 grep 逐条确认，见下每条标题的"第 a–b 行"）。
4. **证据等级约定**：(a) 项为 TeX 逐字照抄；(b) 项标 `[补]`，是**按原文证明文本逐步展开的中项补写**，
   允许指出原文省略处但不得引入原文没有的结论；(c) 项 `[机械理由]`；(d) 项 `[推测]` 失败路线，
   必须注明证据来源；凡 tex/Lean 无法直接落地的判断一律加 `[推测]` 或 `[分析]`（后者指本人自行推导的数学事实，
   非论文内容）。`E:/math/reasoning_traces/` 内 10 个 PDF 与 tex 均与本篇无关（`grep -ril artin` 只命中无关文件），
   ⇒ **本篇无一手思维链**，(d) 全部是基于文本证据的重构。
5. **本块（`A-` 命名空间）构成**：A-0 接续说明、A-2 逐引理四段式（定理 1.1 与 §2–§7 全部 27 个编号条目）、
   A-3 叙事时间线、A-4 Lean 取证、A-5 常数与参数总表；块末哨兵 `<!-- 完 -->`（当前实测位于全文件中部，
   其后仍有并行写入者的双曲篇内容与第二个哨兵，见本条开头与第 2 点）。
   两处 `[纠正]` 记录在案：A-4.9 第 6 条（`status.scope` 是仓库级字段）、
   A-2.19(c)（Euler 计数下 girth 阈值 $6$ 是**临界值**，早期"girth $\ge4$ 亦够"的算法属重复替换错误，
   A-3 未述清单第 9 条与 A-5.5 girth 行已同步更正）。

## A-2 逐引理带批注重构（Artin 篇）

### A-2.1 摘要 + 定理 1.1（`thm:main`，`main.tex` 8–12 行 / `introduction.tex` 61–66 行）：116 生成子 Artin 群无几何作用

(a) 原文逐字（摘要）：

```tex
We construct an Artin group on 116 generators that admits no proper,
cocompact isometric action on a nonempty proper CAT(0) space.
This refutes the CAT(0) conjecture for Artin groups.
```

(a) 原文逐字（定理 1.1）：

```tex
\begin{theorem}\label{thm:main}
There is an Artin matrix \(M\) on 116 generators, with every
off-diagonal label in \(\{2,3,\infty\}\), such that \(A_M\) admits no
geometric action.  One explicit matrix is given in
Definition~\ref{def:matrix}.
\end{theorem}
```

紧接其后的两句是**结论强度的自我说明**（逐字）："Thus Theorem~\ref{thm:main} gives a negative resolution of the
CAT(0) conjecture for Artin groups. In particular, the conclusion excludes every nonempty proper CAT(0)
space, regardless of dimension or the choice of a complex or metric."

(b) `[补]` 该定理的形状是"存在性 + 全称否定"：先给出具体的 $M$（§7 定义 7.1），再证
$\forall$（非空真 CAT(0) 空间 $X$，$A_M\curvearrowright X$ 几何作用）$\Rightarrow$ 矛盾。
证明链（自后往前，见 A-2.12/A-2.28）：$M$ 造出 $G=A_M$，$G\cong G_0 *_T (T\times F(d,e))$，
$d,e$ 的哨兵标签使 $C_G(d)\cap C_G(e)=T$；若 $G$ 几何作用于 $X$，引理 7.4 的次水平集交给出
$T$ 在某个闭凸子空间上的几何作用（且稳定长度就是环境稳定长度），于是 §3 的辫子不等式在 $T$ 上成立：
三对 $(ab)^3,(bc)^3,(ca)^3$ 各给出比值 $>1/2$；§4 的六扇区论证把六个比值 $>1/2$ 转成
"总角 $<2\pi$ 的扇区圆盘 + 远离锥点的一致逼近"，§5–§6 用三角图示与局部绕数导出与命题 5.3 的
符号计数矛盾。

(c) `[机械理由]`
- "116" 与 "$\{2,3,\infty\}$" 是**构造性代价**而非概念性阈值：$3+3\cdot37+2=116$（引言逐字），
  每个 40 股辫子块在 $T$ 的三对共享生成子上"多出" 37 个字母；动了 37（缩短块）会削弱比值下界 $143/513$，
  见 A-2.11 的 $k$ 依赖。
- "off-diagonal in $\{2,3,\infty\}$" 保证 $M$ 是合法 Artin 矩阵（对角 1、对称、非对角 $\ge2$ 或 $\infty$），
  且把标签压到最小集合 $\{2,3,\infty\}$：只出现三角辫子关系、交换关系和"无关系"。
- "nonempty proper CAT(0)" 里的 proper 是**空间性质**（闭有界集紧），不是作用性质；见 A-2.2 的四部分定义拆解。

(d) `[推测]` 失败路线：
1. 若把结论写成"不在**二维** CAT(0) 空间上几何作用"，则正如引言对 Brady–Crisp 的评语（逐字）
   "an obstruction must instead survive every dimension"——这类版本可被高维作用绕过；证据来源：引言第 52–59 行
   把 Brady–Crisp 的"最小维数为 3"作为反面教训明确列出。
2. 若 proper（空间）假设缺失，`GeometricAction` 的紧性论证（引理 2.2 证明里 "$(D+1)$-邻域 $K'$ 紧"）失效；
   证据来源：lengths.tex 第 89–91 行显式使用"closed and bounded, hence compact"。
3. `[推测]` 若把 $T$ 的三对标签由 3 改成 2（即 RAAG 化），辫子比值论证整段失效（$B_3$ 关系不再产生
   $Z_3=(s_1s_2)^3$ 的中心配对结构）；证据来源：prop:braid-angle 的结论完全依赖 $s_i s_{i+1}s_i$ 关系。
Lean 对应：`Main.lean` 内 `theorem main` 由 `Assembly.not_geometric` 与三条矩阵合法性引理
（`explicitMatrix_symmetric/diagonal/values`）拼装；比较器入口 `ComparatorChallenges/ArtinCAT0.json`
的 `theorem_names: ["OAI.ArtinCAT0.main"]`、`definition_names: []`——**机器侧把"合法性"作为结论的一部分显式写出**
（四合取），而论文把合法性放在定义 7.1 里当作前提。见 A-4。

### A-2.2 定义首现（`introduction.tex` 1–11 行 Artin 群；13–25 行 "geometric"/CAT(0)/proper 的 definitional boundary）

(a) 原文逐字（Artin 群首现）：

```tex
Let \(S\) be finite and let \(M=(m_{st})_{s,t\in S}\) be symmetric,
with \(m_{ss}=1\) and
\[
 m_{st}\in\{2,3,\ldots\}\cup\{\infty\}\qquad(s\ne t).
\]
The Artin group \(A_M\) has generators \(\sigma_s\), \(s\in S\).
For each finite \(m_{st}\), its defining relation equates the two
alternating words of length \(m_{st}\) starting with \(\sigma_s\) and
\(\sigma_t\).  A label \(\infty\) imposes no relation.
```

(a) 原文逐字（"geometric" 首现，本篇最关键的 definitional boundary）：

```tex
Throughout, an action is called \emph{geometric} if it is an isometric
action on a nonempty proper CAT(0) metric space \(X$, is proper, and is
cocompact.  Here a metric space is proper when its closed bounded subsets
are compact; action properness means that
\[
 \{g:gK\cap K\ne\varnothing\}
\]
is finite for every compact \(K\subset X\); and cocompactness means that
\(GK=X\) for some compact \(K\).  Our CAT(0) convention is the geodesic
triangle-comparison inequality with Euclidean comparison triangles.
The explicit properness assumption on \(X\) also follows from the other
action hypotheses for a length space
\cite[Exercise~I.8.4(1)]{BridsonHaefliger1999}.
```

`[注]` 上行 tex 源码里 `$X$` 处为 `$X$`（本块照抄时因排版手误多出一个反斜杠位置，实际源码为
`on a nonempty proper CAT(0) metric space $X$, is proper, and is cocompact.`）——照抄校订见 `introduction.tex` 13–14 行。

(b) `[补]` "geometric" 被拆成四个**互相独立**的假设，逐条定位其在证明中的用途：
1. **isometric on $X$**：稳定长度 $\ell(g)=\lim d(o,g^no)/n$ 的存在只用到等距 + 次可加（lengths.tex 61–64）；
2. **空间 proper**：引理 2.2（`lem:semisimple`）证明中把 $K$ 的闭 $(D+1)$-邻域当紧集用（89–91 行），
   以及引理 2.4 之后的 Swenson 型论证（A-2.28）需要闭有界紧；
3. **action proper**：同一证明用 "$q_nK'\cap K'\ne\varnothing$ ⇒ 只有有限多个 $q_n$"（91–92 行）与
   "$\ell(g)=0$ ⇒ 稳定子是有限群"（115–117 行）；
4. **cocompact**：把任意点写成 $h_np_n$、$p_n\in K$（87–88 行），这是把"取列"变成"取紧集内列"的唯一凭据。
CAT(0) 约定被明确锁定为**测地三角形比较（Euclidean comparison triangles）**，而不是中点比较或 Busemann 不等式；
末句把"$X$ 是测度空间⇒ proper 可推导"这一事实**外包给 BH 习题 I.8.4(1)**，说明作者知道该假设冗余但仍显式列出。

(c) `[机械理由]`
- 为什么必须"nonempty"：空空间上 CAT(0) 与 cocompact 空洞成立，$\ell$ 无定义。Lean 把 `[Nonempty X]`
  作为**独立的 instance 假设**写出（见 A-2.6 与 A-4），并在 `Main.lean:38` 用 `Classical.choice inferInstance`
  取点——机器侧无法把 nonempty 混进 `GeometricAction` 的定义里，除非改成存在式。
- 为什么"空间 proper"与"作用 proper"必须分开：`{g:gK∩K≠∅}` 有限性在**任何**度量空间都有意义，
  而闭有界紧不是；把两者混写会让引理 2.2 的第一步失去依据。
- CAT(0) 用三角形比较而非"中点比较"：`lem:comparison` 需要**整段测地线唯一性 + 连续依赖**（距离凸性），
  中点版本给不出 $d(\alpha(t),\beta(t))$ 的线性控制；Lean 的 `CAT0` docstring 明确写
  "All geodesic sides, also degenerate ones, are quantified… not a midpoint-only condition"。

(d) `[推测]` 失败路线：
1. 若允许 $X$ 非 proper（Hilbert 空间式完备 CAT(0)），最小位移可能不达到，$\ell$ 与 $\min_x d(x,gx)$ 分离，
   引理 2.2 的 $\ell$-计算（辫子比值）立刻失效；证据来源：lengths.tex 74–83 行把两者等同是引理结论。
2. 若把 CAT(0) 换成 Busemann CAT(0)（或度量树类），`lem:commuting-form` 的平行四边形恒等式
   （来自四边形不等式）不再成立，配对 $\langle\cdot,\cdot\rangle$ 失去双线性；证据来源：lengths.tex 156–170 行
   的推导只用了 `eq:quadrilateral`。
3. `[分析]` 若去掉"空间 proper"而保留另三条，引言自己说仍可推（BH I.8.4(1)，前提 length space）；
   故这不是漏洞而是冗余——Lean 未采纳该冗余化，仍把 `ProperSpace` 作显式假设。
Lean 对应：`Model.lean` 里 `def GeometricAction G X := CAT0 X ∧ (∀ g, Isometry (·•·)) ∧
(∀ K compact, {g | g''K ∩ K ≠ ∅}.Finite) ∧ ∃ compact K covering X`，docstring：
"Properness of the metric space and nonemptiness are separate standing hypotheses"；
`Label := WithTop ℕ`、`abbrev Letters := Fin 116`、`abbrev ArtinGroup M := PresentedGroup (artinRelators M)`，
`alternating` 用 `Fin` 上的交错字构造，$\infty$ 对应 `⊤` 即"不加入关系"。

### A-2.3 引言构造段（`introduction.tex` 73–106、114–140 行，无编号环境）：构造与障碍的一句话因果链

(a) 原文逐字（关键句，节选三段）：

```tex
The small group that detects the obstruction is
\[
 T=\langle a,b,c\mid aba=bab,\ bcb=cbc,\ cac=aca\rangle.
\]
To each of its three cyclic braid pairs we attach a 40-strand braid
group, sharing the first two standard generators of that block with the
pair.  Each attachment adds 37 generators.  Two further generators
\(d,e\), each commuting with \(a,b,c\) and having no other finite
incident labels, make \(T\) their simultaneous centralizer;
Section~\ref{sec:assembly} proves this equality.  This gives \(3+3\cdot37+2=116\) generators.
```

```tex
If these inequalities held on all three pairs in a geometric action of
\(T\), the commuting pairs
\[
 (a^2,(ab)^3),\ (b^2,(ab)^3),\
 (b^2,(bc)^3),\ (c^2,(bc)^3),\
 (c^2,(ca)^3),\ (a^2,(ca)^3)
\]
would give six asymptotically Euclidean sectors, each of angle less than
\(\pi/3\).  Their cyclic union would have total angle less than \(2\pi\).
```

```tex
The main geometric step is to turn this short angular circuit into a
contradiction that remains valid in arbitrary dimension.
```

(b) `[补]` 因果链压缩为四段：①辫子块 ⇒ 比值 $>1/2$ ⇒ 六扇区每角 $<\pi/3$ ⇒ 总角 $\Omega<2\pi$；
②"$\Omega<2\pi$"本身只是**仿射模型**（Digne 坐标）里的陈述，必须搬到未知空间 $X$ 上 ⇒ 用 CAT(0) 测地线
在 $X$ 里造第二个圆盘（`lem:sector-maps`），两者在大规模上分离（`eq:region-separation`）；
③把 $X$ 中的球搬到 9 生成子三角呈现复形上（`lem:controlled-diagrams`，逐点控制）；
④局部绕数非零 vs. 折叠论证给出所有符号重数为 0（`prop:sphere-counts`）⇒ 矛盾。

(c) `[机械理由]`
- 为什么是 $T$（三角群）而不是任意 Artin 群：$T$ 恰好提供**三个**循环对称的辫子对，六扇区需要
  三条边 × 两侧 = 6 个角，且 $T$ 有 $\mathbb Z$ 化把三角三个顶点分开（A-2.18）；
  两对（二面体群）不构成闭环，四对以上需要更高对称性的呈现、图示计数复杂度上升。
- 为什么 $d,e$ 是"哨兵"而不是别的：$m_{qu}=2$（$u\in\{d,e\}$，$q\in\{a,b,c\}$）给出 $d,e\in C_G(T)$，
  而 $m_{de}=\infty$ 保证 $d,e$ 之间无关系 ⇒ 得到 $T\times F(d,e)$ 形式的直积/自由积混合，
  从而中央子群等式可以用 amalgam 正规形**双向**证明（A-2.27）。
- 37 = 40 − 2 − 1：一个 $B_{40}$ 块有 39 个标准生成子，与前两个共享 ⇒ 新增 37。引言把算术写成
  $3+3\cdot37+2$，即 $T$ 的 3 个 + 三块各 37 个 + 哨兵 2 个 = 116。

(d) `[推测]` 失败路线：
1. 若六扇区总角 $\Omega\ge 2\pi$，`lem:outer-cap` 的 $\varepsilon=\frac12(1-\sin(\Omega/4))$ 变号，
   外盖帽长度控制失效 ⇒ 整条几何论证断链（这是全篇最脆弱的单点）；
2. `[分析]` 若把 40 股缩短：本人推导（**非论文内容**）论文自身不等式 $1-\frac{3k-4}{(k-1)(k-2)}>\frac34$
   第一次成立在 $k=14$（即 28 股），此时 $|S|=5+3\cdot25=80$。论文未讨论最优性，也未解释为何取 20；
   `[推测]` 取整到 40 是为了让 $143/513$ 这类常数与 $k=20$ 的"20 个互换了平方"计数好看；
   证据来源：braids.tex 107 行"We retain $l=2k$ with $k\ge3$ until the final arithmetic, where $k=20$"。
3. 若 $d,e$ 的标签改成有限值，$C_G(d)\cap C_G(e)$ 会**大于** $T$，引理 7.4 的 cocompactness 论证
   （次水平集上交）失去可枚举的直积结构。
Lean 对应：`Model.lean` 的 `blockLetter b i`（`i=0→⟨b.val⟩; i=1→⟨(b.val+1)%3⟩; else ⟨5+37*b.val+(i-2)⟩`）
就是这段 $3+3\cdot37+2$ 的机器化；`Sentinel`（`s.val=3∨4 ∧ t.val<3`）与 `Distant`/`Adjacent` 三谓词
定义 `explicitMatrix`。Lean 中 $T$ 不是显式子群类型，而是通过 `SixSector` 模块对三对生成子的比值条件
（`SixSector.no_strict_ratios`）间接出现。

### A-2.4 引理 2.1（`lem:comparison`，`lengths.tex` 14–55 行）：三角形比较的三条即用时推论

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:comparison}
In a CAT(0) space, geodesic segments are unique and depend continuously on
their endpoints.  If $\alpha,\beta:[0,1]\to X$ are geodesics parametrized
proportionally to length, then
\begin{equation}\label{eq:distance-convexity}
 d(\alpha(t),\beta(t))
 \le (1-t)d(\alpha(0),\beta(0))+t d(\alpha(1),\beta(1)).
\end{equation}
If $m$ is the midpoint of $[v,w]$, then
\begin{equation}\label{eq:midpoint-comparison}
 d(z,m)^2\le \frac{d(z,v)^2+d(z,w)^2}{2}
                    -\frac{d(v,w)^2}{4}.
\end{equation}
For any four points $p,q,r,s$,
\begin{equation}\label{eq:quadrilateral}
 d(p,r)^2+d(q,s)^2
 \le d(p,q)^2+d(q,r)^2+d(r,s)^2+d(s,p)^2.
\end{equation}
\end{lemma}
```

(b) `[补]` 证明的三个中项（原文压缩处逐字展开）：
1. **唯一性**：取两条同端点测地线 $\gamma,\eta$，在 $\gamma$ 的任一点 $t$ 处把三角形
   $(x,\gamma(t),y)$ 与 $\eta$ 的对应边比较；比较三角形退化成直线段 ⇒ 比较角为 $0$ 或 $\pi$ ⇒
   $\gamma(t)=\eta(t)$（Lean 里这一步是 `comparison_common_start` `StableLength.lean:28`：
   共起点的两条测地线在参数 $t$ 处距离 $\le t\cdot d(y_1,y_2)$）。
2. **距离凸性**：共起点版 + 共终点版 + 插入 $\alpha(0)\to\beta(1)$ 的段并用三角不等式 ⇒ (2.1)。
   连续依赖由同一估计给出（原文"This bound also proves continuous dependence"）。
3. **四边形不等式**：先由 Euclidean 中线恒等式 + 比较 ⇒ (2.2)；再取 $m$ 为 $[p,r]$ 中点，
   三角不等式与 $(A+B)^2\le 2A^2+2B^2$ 给 $d(q,s)^2\le 2d(q,m)^2+2d(s,m)^2$，
   对右端两项各用一次 (2.2) 并用 $d(p,r)^2$ 吸收中线项 ⇒ (2.3)。
   `[补]` 显式验证：(2.2) 给 $d(q,m)^2\le\frac{d(q,p)^2+d(q,r)^2}{2}-\frac{d(p,r)^2}{4}$，
   $d(s,m)^2\le\frac{d(s,p)^2+d(s,r)^2}{2}-\frac{d(p,r)^2}{4}$；代入得
   $d(q,s)^2\le d(q,p)^2+d(q,r)^2+d(s,p)^2+d(s,r)^2-2d(p,r)^2$，
   移项即 (2.3)——原文省略了这个代数合并步骤。

(c) `[机械理由]` 为什么 (2.3) 是全篇的"发动机"：引理 2.3 的平行四边形**等式**（⇒ $\ell^2$ 是二次型）
与引理 2.4 的 Busemann 差分恒等式，都只是把 (2.3) 作用在特定四点组上再取 $n\to\infty$。
"动了会坏在哪"：若只有 (2.2)（中点版本），取 $n$ 等分点时的误差项无法被 $1/n$ 压掉，
$\ell^2$ 只会得到上/下界之一，得不到等式 ⇒ 配对 $\langle g,h\rangle$ 不成双线性 ⇒ §3 的一切算术消失。

(d) `[推测]` 失败路线：
1. 非完备 CAT(0)（如开区间上的凸度量）里测地线可能不存在 ⇒ 引理首句"segments are unique"落空；
   原文用"在 CAT(0) 空间里"直接假定测地性（约定是 geodesic triangle-comparison，含存在性），
   这是**定义选择**而非定理；Lean 的 `def CAT0` 把 geodesic existence 写进定义（`Segment`）。
2. 若比较三角形用球面而非 Euclidean，(2.2)/(2.3) 的符号翻转 ⇒ 全链条断裂；
3. `[推测]` 作者可能先尝试"平行四边形恒等式直接引 BH II.7.1（Flat Torus Theorem）"，
   因为 lengths.tex 开篇逐字声明 "We derive precisely the length identities needed for the braid calculation
   directly from triangle comparison, **without using a splitting theorem**" —— 这句是"曾走过别的路"的文本痕迹。
证据来源：原文第 11–12 行的自我限定 + 引用 BH 时只作为"标准事实出处"。
Lean 对应：`StableLength.lean` namespace `Comparison`（3–80 行）：`:28 comparison_common_start`、
`:37 segment_unique`、`:43 comparison_convexity`（= `eq:distance-convexity`）、
`:56 midpoint_comparison`、`:65 quadrilateral (p q r s)`。三式均带 `hX : CAT0 X` 显式假设。

### A-2.5 稳定长度段（`lengths.tex` 57–72 行，无编号）：$\ell$ 的定义与三条基本性质

(a) 原文逐字：

```tex
For an isometry $g$ and a base point $o$, define its \emph{stable length} by
\begin{equation}\label{eq:stable-length}
 \ell(g)=\lim_{n\to\infty}\frac{d(o,g^n o)}{n}.
\end{equation}
Here the limit exists: the sequence $a_n=d(o,g^n o)$ is subadditive, and,
for fixed $k$ and $n=qk+r$ with $0\le r<k$,
$a_n\le q a_k+a_r$.  Consequently
$\limsup a_n/n\le a_k/k$ for every $k$, and the limit equals
$\inf_{k\ge1}a_k/k$.  Changing $o$ changes $a_n$ by at most twice the
distance between the two base points.  Thus the length is independent of
$o$, is invariant under conjugation, and satisfies
\begin{equation}\label{eq:length-powers}
 \ell(g^m)=|m|\ell(g)\qquad(m\in\mathbb Z).
\end{equation}
For negative $m$, use $d(o,g^{-n}o)=d(o,g^n o)$; for positive $m$, use the
subsequence indexed by multiples of $m$ in \eqref{eq:stable-length}.
```

(b) `[补]` 逐字展开的中项：
1. 次可加：$a_{m+n}=d(o,g^{m+n}o)=d(g^{-m}o,g^no)\le d(o,g^{-m}o)+\dots$ —— 等距性给
   $a_{m+n}\le a_m+a_n$（原文没写这一步，只断言"subadditive"）。
2. Fekete 型论证：$n=qk+r$ ⇒ $a_n\le qa_k+a_r$ ⇒ $\limsup_n a_n/n\le a_k/k$（令 $n\to\infty$ 时 $a_r$ 固定、
   $q/n\to 1/k$），对一切 $k$ 成立 ⇒ $\lim$ 存在且 $=\inf_k a_k/k$。
3. 基底无关：$|d(o,g^no)-d(o',g^no')|\le 2d(o,o')$（两次三角不等式 + 等距），除以 $n$ 后消失。
4. 共轭不变：$\ell(hgh^{-1})=\ell(g)$，因 $d(o,(hgh^{-1})^no)=d(h^{-1}o,g^n h^{-1}o)$，用上条。
5. $\ell(g^m)=|m|\ell(g)$：$m>0$ 时取 (2.1) 中 $m$ 的倍数列，$m<0$ 时用 $d(o,g^{-n}o)=d(o,g^no)$
   （该式由等距：$d(o,g^{-n}o)=d(g^no,o)$）。

(c) `[机械理由]` (2.1)/`eq:length-powers` 的唯一用途是给引理 2.3 的 $\nu(mv)=|m|\nu(v)$ 与
引理 2.4 的 $t\mapsto g^th$ 参数化提供整数齐性；"为什么必须是稳定长度而非位移 $d(x,gx)$"：
位移依赖于 $x$，而配对需要**函数式**（在 $\mathbb Z^k$ 上的次模函数）才能取平行四边形极限。
Lean 里 `displacement_subadditive`(`:91`)、`stableLength_tendsto`(`:100`)、`displacement_change_base`(`:122`)、
`stableLength_basepoint`(`:129`)、`stableLength_conjugate`(`:157`)、`stableLength_pow`(`:170`) 六条
一一对应上面 1–5 步——**机器侧拆得比论文细**（多了 `stableLength_inv`、`stableLength_one`、`stableLength_mul_le`）。

(d) `[推测]` 失败路线：非等距作用（只假设连续作用）时次可加性不成立，$\ell$ 不收敛；
`[推测]` 若试图用 $\inf_x d(x,gx)$ 直接做双线性（不取 $\ell$），引理 2.2 的"达到最小"是必需的，
而它需要 cocompact + proper——这正是论文把 $\ell$ 与 $\min$ 分开处理的原因（引理 2.2 才把它们等同）。
证据来源：lengths.tex 75–79 行把"$\ell(g)=\min_x d(x,gx)$"写成引理结论而非定义。
Lean 对应：`StableLength.lean:88 noncomputable def stableLengthAt (x : X) (g : G) : ℝ`——
机器版本**以基点为参数**，再用 `stableLength_basepoint` 证明与基点无关；论文定义里 $o$ 是临时选的。

### A-2.6 引理 2.2（`lem:semisimple`，`lengths.tex` 74–119 行）：半单性、轴与有限阶刻画

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:semisimple}
Suppose $G$ acts geometrically on $X$.  Every $g\in G$ attains its minimum
displacement, and
\[
 \ell(g)=\min_{x\in X}d(x,gx).
\]
If this number is positive, $g$ preserves a geodesic line and translates
along it by $\ell(g)$.  Moreover, $\ell(g)=0$ if and only if $g$ has finite
order.
\end{lemma}
```

(b) `[补]` 证明分三段，逐字展开：
1. **达到最小**（85–95 行）：取 $D=\inf_x d(x,gx)$、$x_n$ 使 $d(x_n,gx_n)\to D$；由 cocompact 取紧集 $K$ 覆盖，
   写 $x_n=h_np_n$（$p_n\in K$）；令 $q_n=h_n^{-1}gh_n$，则 $d(p_n,q_np_n)=d(x_n,gx_n)\to D$，
   丢弃有限项后 $d(p_n,q_np_n)\le D+1$。$K'$ = $K$ 的闭 $(D+1)$-邻域，"closed and bounded, hence compact"
   用到**空间 proper**。$p_n,q_np_n\in K'$ ⇒ $q_nK'\cap K'\ne\varnothing$ ⇒ **action proper** ⇒ $q_n$ 只有有限取值；
   取子列 $q_n\equiv q$、$p_n\to p\in K$ ⇒ $d(p,qp)=D$；某个固定的 $h_n$ 把 $p$ 送到 $g$ 的最小点。
   `[补]` 原文省略的中项：$h_np_n=x_n$、$q_n=h_n^{-1}gh_n$ ⇒ $h_nq_n=g h_n$ ⇒
   $d(h_np_n,g h_np_n)=d(h_n q_n p_n, h_n p_n)=d(q_np_n,p_n)$（$h_n$ 等距）。
2. **轴向**（97–113 行）：$x$ 为最小点，$D>0$，$m$ 为 $[x,gx]$ 中点，$gm$ 为 $[gx,g^2x]$ 中点。
   三角形 $(x,gx,g^2x)$ 比较 ⇒ $D\le d(m,gm)\le\frac12 d(x,g^2x)\le D$（左：$m,gm$ 是两点 $x,gx$ 与
   $gx,g^2x$ 的中点，用 (2.2)/距离凸性；右：$\frac12 d(x,g^2x)\le\frac12(d(x,gx)+d(gx,g^2x))=D$）
   ⇒ 夹逼 ⇒ $d(x,g^2x)=2D$。归纳：设 $[x,g^ix]$ 拼接为测地线；三角形 $(x,g^ix,g^{i+1}x)$ 中，
   距 $g^ix$ 为 $D$ 的两边点恰为 $g^{i-1}x$ 与 $g^{i+1}x$，它们距离 $2D$ ⇒ **Euclidean 比较角必须为 $\pi$** ⇒
   $d(x,g^{i+1}x)=(i+1)D$；对所有 $i\in\mathbb Z$ 平移 ⇒ 轴。故 $\ell(g)=D$。
3. **零长度 ⇔ 有限阶**（115–118 行）：$D=0$ ⇒ 最小点被固定 ⇒ 该点稳定子由 action proper（对单点紧集）
   有限 ⇒ $g$ 有限阶；反向显然。

(c) `[机械理由]`
- 半单性在这里不是为了"分类"，而是为了**给引理 2.4 提供 $d(x,g^nx)=nD$**（原文 211 行逐字引用），
  以及给 §3 的 $\ell(Z_r)$ 算术提供"长度即最小位移"的直觉合法性。
- "$D>0$" 的分支是必需的：$D=0$ 时 $b(z)=\lim(d(z,g^nx)-nD)$ 无意义（引理 2.4 用 $D=\ell(g)>0$）。
- 几何作用的四条假设在此引理**各用一次**，是检查"能否弱化假设"的最敏感点：
  cocompact → $x_n=h_np_n$；空间 proper → $K'$ 紧；action proper → $q_n$ 有限；isometric → 共轭不变性。

(d) `[推测]` 失败路线：
1. 若 $X$ 只是完备 CAT(0) 而作用 cocompact 但不 proper（例如非离散群作用），$q_n$ 无限 ⇒ 取不到常值子列；
   `[推测]` 这正是论文坚持"几何作用"而非"半单作用"的原因，注：引言 30–34 行提到
   "A geometric action would make the group's large-scale geometry accessible"。
2. 若改用 Bridson–Haefliger II.6.8(5) 的现成半单定理，仍需其前提（$X$ 完备 + 作用 cocompact），
   原文选择自证；证据来源：lengths.tex 7–10 行的引用只用于"标准事实的出处"，且声明不用 splitting theorem。
3. `[分析]` 该引理在论文里**未被 §3 之后的论证直接引用**（除了 211 行）；真正必需的是
   "$\ell(g)=\min$"与"$d(x,g^nx)=nD$"，因此若有一处只证"存在近似最小点列"则足够——这是可精简处。
Lean 对应：`StableLength.lean:388 finite_movers_of_compact`（action proper 的机器形式）、
`:406 exists_displacement_minimizer [Nonempty X] (hG : GeometricAction G X)`、
`:448 segment_point_eq_of_dist`、`:462 minimizer_displacement_two`（$d(x,g^2x)=2D$）、
`:495 minimizer_displacement_pow`（归纳出 $d(x,g^nx)=nD$）、`:548 stableLength_minimizer`、
`:562 stableLength_finiteOrder`、`:569 finiteOrder_of_fixedPoint`、
`:583 stableLength_eq_zero_iff_finiteOrder [ProperSpace X] [Nonempty X]`。
注意 `:482 extension_numeric {D R N : ℝ} (hN : 0 < N)`：机器版把夹逼的实数不等式单独成引理。

### A-2.7 引理 2.3（`lem:commuting-form`，`lengths.tex` 126–185 行）：交换族上 $\ell^2$ 是半正定二次型 + 配对定义

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:commuting-form}
For pairwise commuting isometries $g_1,\ldots,g_k$ of a CAT(0) space,
the function
\[
 v\longmapsto \ell(g^v),\qquad
 g^v=g_1^{v_1}\cdots g_k^{v_k},\qquad v\in\mathbb Z^k,
\]
extends uniquely to a continuous seminorm on $\mathbb R^k$ whose square
is a positive semidefinite quadratic form.  For commuting $g,h$, put
\begin{equation}\label{eq:pairing-definition}
 \langle g,h\rangle
   =\frac{\ell(gh)^2-\ell(g)^2-\ell(h)^2}{2}.
\end{equation}
These pairings are the bilinear form on every commuting family; in
particular, $\langle g^i,h^j\rangle=ij\langle g,h\rangle$.  Lengths and
pairings are invariant under simultaneous conjugation.
\end{lemma}
```

(b) `[补]` 三段证明的中项：
1. **半范数**：$\nu(u+v)\le\nu(u)+\nu(v)$（交换 + 三角不等式 + $\ell$ 的次可加），
   $\nu(mv)=|m|\nu(v)$（`eq:length-powers`），
   $|\nu(u)-\nu(v)|\le\sum_i|u_i-v_i|\ell(g_i)$（把 $g^v$ 写成 $g^u\cdot(g^{v-u})$，用次可加 + 幂齐性）。
   在 $\mathbb Q^k$ 上定义 $\nu(v/q)=\nu(v)/q$：良定义性来自上一条的齐性；Lipschitz 界给出到 $\mathbb R^k$ 的
   唯一连续扩张；**唯一性**由 $\mathbb Z^k$ 的稠密性（缩放后 $\mathbb Q^k$ 稠密）给出。
2. **平行四边形不等式 → 等式**：把 (2.3) 用四点 $o,\ g^{nu}o,\ g^{n(u+v)}o,\ g^{nv}o$（**该循环顺序**）。
   `[补]` 显式核对：对角线 $d(p,r)=d(o,g^{n(u+v)}o)$、
   $d(q,s)=d(g^{nu}o,g^{nv}o)=d(o,g^{n(v-u)}o)$（用 $g^{nu}$ 的等距性 + 交换性），
   四条边为 $d(o,g^{nu}o),\ d(o,g^{nv}o),\ d(o,g^{nu}o),\ d(o,g^{nv}o)$（各出现两次）。
   除以 $n^2$、$n\to\infty$（$\ell^2$ 版本）：$Q(u+v)+Q(u-v)\le 2Q(u)+2Q(v)$，$Q=\nu^2$。
   再把该不等式用于 $(u+v,\,u-v)$：$Q(2u)+Q(2v)\le 2Q(u+v)+2Q(u-v)$，
   结合 $Q(2u)=4Q(u)$ 与反向不等式 ⇒ 平行四边形恒等式 (eq:parallelogram)。
3. **极化（原文自称"For completeness…elementary algebra"）**：$B(u,v)=(Q(u+v)-Q(u-v))/4$；
   由 (eq:parallelogram) 得 $B(u+w,v)+B(u-w,v)=2B(u,v)$；取 $w=u$ 且用 $B(0,v)=0$ 得 $B(2u,v)=2B(u,v)$；
   取 $u=(a+b)/2,w=(a-b)/2$ 得第一变量可加；整数/有理齐次 + 连续 ⇒ 实双线性；$B(u,u)=Q(u)\ge0$ ⇒ 半正定；
   展开 $Q(u+v)$ 回到 (2.4)/`eq:pairing-definition`。同时共轭不变性由 $\ell$ 的共轭不变性（A-2.5 第 4 步）。

(c) `[机械理由]`
- 为什么必须是"$\ell$ 的**平方**是二次型"而不是"$\ell$ 是范数"：配对 $\langle g,h\rangle$ 的定义 (2.4)
  分母是 $2$、分子是**平方**差；若只有 $\ell$ 的三角不等式，极化给不出双线性。
- 为什么"pairwise commuting"不可省：证明第 2 步用 $g^{n(u+v)}=g^{nu}g^{nv}$（需要交换）；
  非交换族上 $\ell$ 甚至可以完全不连续。
- 半正定性的两处下游用途：(i) 引理 2.4 的 $\ell(g)=0$ 分支（原文 204–208 行）；
  (ii) §3 的两个不等式 `eq:lower-cross-pairing`、`eq:disjoint-centers`（"平方长度 $\ge0$"）。
  动了半正定 ⇒ 常数 $c_0$ 无下界 ⇒ $143/513$ 不存在。
- "$\langle g^i,h^j\rangle=ij\langle g,h\rangle$" 是 §3 中因子 $1/4$（原文 190 行）与 $2N_r\alpha$ 的唯一依据。

(d) `[推测]` 失败路线：
1. 引理前原文逐字写"For commuting isometries of a **complete** CAT(0) space, Rodenhausen
   \cite[Theorem~14.6]{Rodenhausen2013} proves a parallelogram identity for **infimal displacements**.
   The next proof works directly with stable lengths." ⇒ `[推测]` 作者先试过引用 Rodenhausen 的现成定理，
   但那里需要完备性且对象是 $\inf_x d(x,gx)$ 而非 $\ell(g)$，需额外通过引理 2.2 转换，遂改自证；
   证据来源：该段自我对比的位置（紧邻引理前）+ 引理陈述中不再出现 "complete"。
2. `[分析]` 若试图对**非交换**族做同样极化，$Q$ 连二次型都不是；作者把"非交换"的损失在引理 2.4 里
   用 Busemann 函数补回来——两段是**分工**而非重复。
3. `[推测]` 平坦环面定理（BH II.7.1，原文 9–10 行提到"central to the Flat Torus Theorem"）是
   该结论的更强版本；作者声明不用 splitting theorem ⇒ 若改用 Flat Torus 路线，需引入 $\mathbb R^k$ 作用
   与不变平坦子空间，机器化成本更高。
Lean 对应：`StableLength.lean:205 commuting_displacement_quadrilateral`（四边形不等式的交换族特化）、
`:221 length_parallelogram_le`（$\le$ 版）、`:235 length_parallelogram`（等式版）、
`:256 noncomputable def lengthPairing`、`:276 lengthPairing_polarization`、
`:298 lengthPairing_jensen`（即 $Q(u+w,v)+Q(u-w,v)=2B(u,v)$ 那一步的机器形式）、
`:316/:330 lengthPairing_mul_left/right`（可加性）、`:338/:349 lengthPairing_pow_right/left`（$ij$ 齐性）、
`:356 stableLength_product_sq`（$\ell(gh)^2$ 展开式，§3 反复使用）、`:371/:591 zpow$ 版本；
半正定在 `AxialLengths.lengthPairing_zero_of_length_zero:621` 与 `zero_of_int_mul_le:613` 处使用。

### A-2.8 引理 2.4（`lem:centralizer-character`，`lengths.tex` 193–251 行）：中央子群上的特征标

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:centralizer-character}
For a geometric action and a fixed $g\in G$, the function
\[
 C_G(g)\longrightarrow\mathbb R,\qquad h\longmapsto\langle g,h\rangle
\]
is a group homomorphism.  Thus
$\langle g,h_1h_2\rangle=\langle g,h_1\rangle+\langle g,h_2\rangle$
whenever both $h_1$ and $h_2$ commute with $g$.
\end{lemma}
```

引理前的定位句逐字："The following strengthening of bilinearity is crucial.  The elements $h_1,h_2$ in its
statement need not commute with one another. Real translation characters also underlie Bridson's obstruction
to proper semisimple actions on two-dimensional CAT(0) spaces \cite[Proposition~3.1]{Bridson2001}."

(b) `[补]` 五个中项：
1. $\ell(g)=0$ 分支：半正定 ⇒ 整数 $t$（两符号）上 $\ell(g^th)^2=2t\langle g,h\rangle+\ell(h)^2\ge0$ ⇒ 系数 $=0$。
2. $D=\ell(g)>0$：取最小点 $x$（引理 2.2）⇒ $d(x,g^nx)=nD$。定义
   $b(z)=\lim_n(d(z,g^nx)-nD)$。**单调性**：$d(z,g^{n+1}x)-(n+1)D\le d(z,g^nx)+d(g^nx,g^{n+1}x)-(n+1)D
   =d(z,g^nx)-nD$（$d(g^nx,g^{n+1}x)=D$）；**下界** $-d(z,x)$：$d(z,g^nx)\ge d(x,g^nx)-d(z,x)=nD-d(z,x)$。
   ⇒ 极限存在；1-Lipschitz：$|b(z)-b(w)|\le d(z,w)$（逐 $n$ 用 $|d(z,\cdot)-d(w,\cdot)|\le d(z,w)$）。
3. 关键四点组：$p_n=g^nx$、$q_n=h^{-1}g^nx$。$d(p_n,q_n)=d(x,h^{-1}x)$（$g^n$ 等距）**为常数**。
   (2.3) 的两种排序给 $|d(z,p_n)^2+d(w,q_n)^2-d(w,p_n)^2-d(z,q_n)^2|\le d(z,w)^2+d(p_n,q_n)^2$。
   代入 $d(z,p_n)=nD+b(z)+o(1)$、$d(z,q_n)=d(hz,p_n)=nD+b(hz)+o(1)$（这里用到 $h$ 与 $g$ 交换）；
   平方差主项 $(nD+b)^2=n^2D^2+2nDb+O(1)$，$n^2D^2$ 全部相消，除以 $2nD$ ⇒ `eq:busemann-difference`
   $b(hz)-b(hw)=b(z)-b(w)$。
4. $\chi(h)=b(x)-b(hx)$ 是同态：取 $z=kx,w=x$ ⇒ $b(hkx)-b(hx)=b(kx)-b(x)$ ⇒ $\chi(hk)=\chi(h)+\chi(k)$。
   `[补]` $b(x)=0$（$d(x,g^nx)-nD=0$）、$b(gx)=-D$（$d(gx,g^nx)=(n-1)D$）⇒ $\chi(g)=D$。
   Lipschitz 用于 $h^n$：$n|\chi(h)|=|b(x)-b(h^nx)|\le d(x,h^nx)$ ⇒ $|\chi(h)|\le\ell(h)$。
5. 收尾：对 $g^th$ 用上一条并用引理 2.3 展开：$(tD+\chi(h))^2\le t^2D^2+2t\langle g,h\rangle+\ell(h)^2$
   （左边来自 $\chi(g^th)=tD+\chi(h)$ 与 $|\chi|\le\ell$；右边来自 (2.4)），
   消去 $t^2D^2$，$t\to+\infty$ 与 $t\to-\infty$ 双向 ⇒ $D\chi(h)=\langle g,h\rangle$。

(c) `[机械理由]`
- **这是全篇最关键的引理**：§3 的所有"把中心元素的配对拆成生成子配对的和"都要求 $h_1h_2$ **不必交换**
  （$L_j$ 之间虽交换，但 $Z_r$ 展开时用到的是"对每个字母求和"，其合法性只靠每个字母与 $g$ 交换）。
- 为什么必须"几何作用"（而不仅是等距作用）：第 2 步的最小点来自引理 2.2，后者四条假设全用。
- 为什么用**轨道 Busemann 函数**（沿 $g$ 的正半轨）而不是 horofunction 紧化或 Busemann 特征标的现成理论：
  只有 $b(z)-b(w)$ 的差分形式给出 $n^2$ 项相消；现成理论给出的是 $b(hz)=b(z)+$ 常数（需要 $h$ 保持该 Busemann 函数的
  水平集结构），而此处 $h$ 只与 $g$ 交换、不保持 $x$ 的选取。
- $\chi(g)=D$ 与 $|\chi|\le\ell$ 两个归一化把"$\chi$ 是某个特征标"钉成"$\chi=\langle g,\cdot\rangle/D$"。

(d) `[推测]` 失败路线：
1. `[推测]` 原文若走 Bridson 2001 Prop 3.1 的"实平移特征标"路线，会得到**二维**限制
   （引理前那句引用正是把它当作"同型但受维数限制"的对照）；本篇结论要求任意维，故必须自证。
   证据来源：引言 114–115 行"The main geometric step is to turn this short angular circuit into a
   contradiction that remains valid in arbitrary dimension."
2. 若 $D=0$ 分支处理不当（例如直接用 $b$），$b(z)=\lim(d(z,g^nx)-nD)$ 不再是 Lipschitz 的规范化选择，
   $\chi$ 退化；原文用半正定单独处理该分支——这是"为什么先证 $\ell(g)=0$"的机械理由。
3. `[分析]` 若 $g$ 不与 $h$ 交换，$d(z,q_n)=d(hz,p_n)$ 一步失效 ⇒ `eq:busemann-difference` 不成立；
   故结论不能推广到"任意两元素"，配对确实只在交换对上有定义。
Lean 对应：整个 `Pairing.lean`（244 行）就是这条引理：`:14 orbitBusemann`（$b$）、`:17 orbitBusemann_tendsto`
（单调收敛）、`:36 orbitBusemann_lipschitz`、`:44 fourSquares_limit`（平方差相消的实数引理）、
`:61 quadrilateral_difference`（第 3 步的绝对值不等式）、`:71 orbitBusemann_centralizer_difference`
（= `eq:busemann-difference`）、`:107 orbitCharacter`（$\chi$）、`:113 orbitCharacter_mul`、
`:168 orbitCharacter_self`（$\chi(g)=D$）、`:183 orbitCharacter_abs_le`、
`:196 lengthPairing_eq_orbitCharacter`（$D\chi=\langle g,h\rangle$）、
`:217 lengthPairing_centralizer`（最终同态性，带 `[ProperSpace X] [Nonempty X]`）。
`:121` 处出现本目录 4 个 `Classical.choice` 之一（见 A-4）。

### A-2.9 命题 3.1（`prop:braid-angle`，`braids.tex` 12–25 行）：40 股辫子的定量角度约束

(a) 原文逐字：

```tex
\begin{proposition}\label{prop:braid-angle}
Suppose a group acting geometrically on a CAT(0) space contains elements
$s_1,\ldots,s_{39}$ satisfying the $B_{40}$ relations, with
$\ell(s_1^2)>0$.  Then
\begin{equation}\label{eq:braid-angle-bound}
 \left(\frac{\ell((s_1s_2)^3)}{3\ell(s_1^2)}\right)^2
 \ge\frac{143}{513}>\frac14,
\end{equation}
and in particular
\[
 \frac{\ell((s_1s_2)^3)}{3\ell(s_1^2)}
 =\frac{\ell((s_1s_2)^3)}{3\ell(s_2^2)}>\frac12.
\]
\end{proposition}
```

节首两条**限定性说明**逐字（第 8–10 行）："Throughout this section the same notation may denote elements of
another group satisfying these relations. No injectivity or cocompactness of the resulting braid subgroup
is needed for the length estimates."；命题后的注（27–30 行）："For $B_4$, Crisp and Paoluzzi compute
translation components along an axis of a central element under a minimal geometric action
\cite[Proposition~5]{CrispPaoluzzi2005}; minimality means that no proper nonempty closed convex subset is invariant."

(b) `[补]` 结论的形状：$R_3:=\ell(Z_3)^2/(N_3^2D^2)=\ell((s_1s_2)^3)^2/(9\ell(s_1^2)^2)\ge143/513$，
故 (a) 中括号的平方即 $R_3$。$\ell(s_2^2)=\ell(s_1^2)$ 由 `eq:braid-shift` 的共轭（$s_2=\delta s_1\delta^{-1}$）
给出；两个等号与 $>1/2$ 由 $R_3>1/4$ + 非负开方给出。整个命题的**唯一输入**是 39 个元素满足 $B_{40}$ 关系
（相邻三辫 + 距离 $\ge2$ 交换）与 $\ell(s_1^2)>0$，**不需要**辫子群注入或 cocompact——这是原文明确写出的
"不依赖"声明（见 A-3 清单）。

(c) `[机械理由]`
- 为什么是 39 个元素 / $B_{40}$：$\ell=2k$、$k=20$ ⇒ 39 个生成子；$k$ 控制两条约束的强度
  （$c_0\ge-1/(k-1)$ 与 $3R_3\ge1-\frac{3k-4}{(k-1)(k-2)}$）。$k$ 变小则下界跌破 $3/4$，$R_3>1/4$ 失效。
  `[分析]` 本人验算：$1-\frac{3k-4}{(k-1)(k-2)}>\frac34$ 的最小整数是 $k=14$（$k=13$ 时
  $1-35/(12\cdot11)=0.73487<0.75$，$k=14$ 时 $1-38/(13\cdot12)=0.75641>0.75$），
  ⇒ 28 股（27 个生成子）在**不等式层面**已足够，对应 $|S|=5+3\cdot25=80<116$；
  论文未讨论此点，属"论文未述清单"（A-3）。
- 为什么 $\ell(s_1^2)>0$ 而不是 $\ell(s_1)>0$：分母是 $\ell(s_1^2)$；引理 2.2 给出 $\ell=0\Leftrightarrow$ 有限阶，
  故该假设等价于"$s_1^2$ 无限阶"，在 §4 里靠 $T\to\mathbb Z$ 的增广验证（sectors.tex 19–21 行）。
- $143/513$ 的来源：$3R_3\ge143/171$ 除以 3 ⇒ $513=3\cdot171$，$171=19\cdot9$… 精确地
  $1-\frac{3\cdot20-4}{19\cdot18}=1-\frac{56}{342}=\frac{286}{342}=\frac{143}{171}$。
  $\frac{143}{513}>\frac14\iff 572>513$ ⇒ 余量只有 11.5%，是**紧**的算术。

(d) `[推测]` 失败路线：
1. 若 $k$ 取 10：$1-26/(9\cdot8)=0.639<0.75$ ⇒ $R_3$ 只能 $\ge0.16$，六扇区角度上界失去 $<\pi/3$；
   失败机制是 $\Omega<2\pi$ 不再成立（$2\pi$ 恰好对应 6 个 $\pi/3$）。
2. 若用"辫子群本身几何作用于某空间"的更强前提去做（Crisp–Paoluzzi 式最小作用），
   会把结论限制在辫子子群，而 §4 需要的是**环境群**里的关系；原文明确否认需要注入性。
3. `[推测]` 可能曾尝试 $B_4$/Crisp–Paoluzzi 的直接计算（原文该注的位置暗示这条路的终点是"$B_4$ 只知道这些"），
   后被替换成一般 $B_l$ 的递推；证据来源：braids.tex 27–30 行的注紧随命题之后且只讲 $B_4$。
Lean 对应：`Braids.lean:388 braid_forty_squared`（无除法形式 `143 * stableLengthAt x ((s 0)^2)^2 ≤
57 * stableLengthAt x ((s 0*s 1)^3)^2`，docstring "Quantitative braid constraint, in a division-free form."）、
`:441 braid_forty_ratio`（三分合取：$\ge143/513$、$>1/2$、与 $s_1$ 版本相等），
参数是 `hs : BraidRelations 39 s`（0-索引，39 个字母）与 `hD : 0 < stableLengthAt x ((s 0)^2)`。
`[分析]` 机器形式与论文的换算：$57\,\ell(Z_3)^2\ge143\,D^2\iff R_3=\ell(Z_3)^2/(9D^2)\ge143/513$ ✓；
中间引理 `hraw : 572*q ≤ 57*ℓ(braidCenter s 2)^2` 里的 $572=4\cdot143$、$380=2N_{20}$、
$20q+380v\ge0$ 即 `eq:lower-cross-pairing` 在 $k=20$ 的展开（$q=\ell(s_0)^2=D^2/4$、$v=\langle s_0,s_2\rangle=c_0D^2/4$）。

### A-2.10 引理 3.2（`lem:braid-centers`，`braids.tex` 41–104 行）：中心元素的交换性与配对恒等式

(a) 原文逐字（含其前置定义 (3.1)）：

```tex
\begin{equation}\label{eq:braid-centers-definition}
 L_1=1,\qquad L_j=s_{j-1}L_{j-1}s_{j-1},\qquad
 Z_r=L_1\cdots L_r,\qquad N_r=\binom r2.
\end{equation}
Here $2\le j\le l$ and $1\le r\le l$.

\begin{lemma}\label{lem:braid-centers}
The element $L_j$ commutes with $s_i$ for $i\le j-2$, and $Z_r$ commutes
with every $s_i$ for $i<r$.  In particular,
\[
 Z_2=s_1^2,\qquad Z_3=(s_1s_2)^3.
\]
The element $\delta=s_1\cdots s_{l-1}$ satisfies
\begin{equation}\label{eq:braid-shift}
 \delta s_i\delta^{-1}=s_{i+1}\qquad(1\le i\le l-2).
\end{equation}
In any geometric action of the ambient group,
\begin{equation}\label{eq:braid-central-pairing}
 \langle s_i^2,Z_r\rangle=\frac{\ell(Z_r)^2}{N_r}
 \qquad(2\le r\le l,\ 1\le i<r).
\end{equation}
\end{lemma}
```

(b) `[补]` 四段证明：
1. $L_j$ 与 $s_i$（$i\le j-2$）交换：对 $j$ 归纳。$i\le j-3$ 时 $s_{j-1}$ 与 $L_{j-1}$ 都与 $s_i$ 交换；
   $i=j-2$ 时令 $a=s_{j-2},b=s_{j-1},C=L_{j-2}$，$bC=Cb$、$L_j=baCab$，逐字照抄原文链
   $aL_j=abaCab=babCab=baCbab=baCaba=L_ja$（**每一步只用一个关系**：$aba=bab$；$bC=Cb$；再用一次 $aba=bab$；
   $C=L_{j-2}$ 与 $a=s_{j-2}$ 的归纳假设… 实际是 $baCaba=L_ja$ 由 $L_j=baCab$ 右乘 $a$）。
   $j=3$ 时 $C=L_1=1$ 已含；$j=2$ 空。⇒ $L_j$ 两两交换（$L_i$ 只用 $s_1,\dots,s_{i-1}$）。
2. $Z_r$ 与 $s_i$（$i<r$）交换：对 $r$ 归纳；仅剩 $s=s_{r-1}$。$L=L_{r-1}$、$L_r=sLs$，
   由已证的 $L$ 与 $L_r$ 交换得 $LsLs=sLsL$，于是 $s(LL_r)=sLsLs=LsLs^2=(LL_r)s$。
   显式值：$Z_2=L_1L_2=s_1^2$；$Z_3=s_1^2s_2s_1^2s_2=s_1(s_1s_2s_1)s_1s_2=s_1(s_2s_1s_2)s_1s_2=(s_1s_2)^3$。
3. `eq:braid-shift`：在 $\delta s_i$ 中把最右的 $s_i$ 依次左移越过 $s_{i+2},\dots,s_{l-1}$（距离 $\ge2$ ⇒ 交换），
   用 $s_is_{i+1}s_i=s_{i+1}s_is_{i+1}$ 替换，再把新的 $s_{i+1}$ 左移越过 $s_1,\dots,s_{i-1}$ ⇒ $s_{i+1}\delta$。
   指数上界 $l-2$ 在后续使用中被反复核对（原文 129–130、173–174 行两处专门说明）。
4. `eq:braid-central-pairing`：对固定的 $g=s_i^2$ 用引理 2.4 的特征标 $h\mapsto\langle g,h\rangle$；
   相邻辫子关系下取值相等 ⇒ 前 $r-1$ 个 $s_i$ 的 $\langle g,s_i\rangle$ 全相同 $=\alpha/2$；
   $L_j$ 的正字长 $2(j-1)$ ⇒ $Z_r$ 正字长 $2N_r$；
   `[补]` 于是 $\langle g,Z_r\rangle=2N_r\cdot(\alpha/2)=N_r\alpha$，而
   $\ell(Z_r)^2=\langle Z_r,Z_r\rangle=2N_r\alpha$（把 $Z_r$ 的字母逐个展开）⇒ 比值 $=\ell(Z_r)^2/N_r$。
   原文写法是 $\ell(Z_r)^2=\langle Z_r,Z_r\rangle=2N_r\alpha,\ \langle s_i^2,Z_r\rangle=2\alpha$，
   两式相除即得 —— 注意 $2\alpha$ 来自 $s_i^2$ 是**两个字母**。

(c) `[机械理由]`
- $N_r=\binom r2$ 是"度数"而非"字长"：字长是 $2N_r$；$1/2$ 因子正是 (2.4) 分母的 2 与字长 2 的抵消结果。
- "在 ambient group 的任何几何作用中"这句限定是必需的：结论只用到关系，不用群的其余结构（同 A-2.9 的
  "No injectivity … needed"）。
- $Z_3=(s_1s_2)^3$ 是本引理与 §4 的**接口**：扇区里的 $H=z_{uv}=(uv)^3$ 就是这个 $Z_3$。

(d) `[推测]` 失败路线：
1. 若把 $L_j$ 递推改成 $L_j=s_jL_{j-1}s_j$（右移一位），$Z_r$ 与 $s_i$（$i<r$）的交换性失效，
   因为归纳里"$s$ 与 $Z_{r-2}$ 交换"的余量消失 ⇒ `eq:braid-central-pairing` 无从谈起；
2. `[分析]` 若 $B_l$ 换成一般有限型 Artin（$l$ 个生成子带不同标签），第 3 步的 $\delta$ 平移共轭不存在，
   "所有平方等长"（原文 119 行）失效；论文只用型 $A$，是刻意收窄；
3. 若 $\alpha$ 的相等性只对 $s_i^2$ 建立而不对 $s_i$，$2N_r\alpha$ 计数会翻倍出错。
Lean 对应：`Braids.lean:17 braidLoop`（= $L_{j}$，0-索引偏移）、`:21 braidCenter`（= $Z_r$）、
`:25 braidDelta`、`:29/:37/:44 commute_braidLoop/Center/Delta`、`:51 braid_loop_step`（即 $aL_j=L_ja$ 的链）、
`:83 braid_center_step`、`:110/:132 braidDelta_shift/conjugate`、`:142 braidCenter_two`
（`braidCenter s 2 = (s 0*s 1)^3`，即 $Z_3$）、`:208–:257 lengthPairing_braid_equal/constant/braidLoop/
braidCenter`、`:257 braidCenter_length_sq`（$\ell(Z)^2=n(n+1)\langle s_i,Z\rangle$，即 $2N_r$ 形式）、
`:272 braid_generator_length`（$\ell(s_i)=\ell(s_0)$ 的归纳）。
机器索引偏移：Lean 的 `braidCenter s n` = 论文的 $Z_{n+1}$（`braidCenter s 19` = $Z_{20}$）。

### A-2.11 命题 3.1 证明主体（`braids.tex` 106–213 行）：两条约束与 $k=20$ 算术

(a) 原文逐字（四个关键式 + 收尾）：

```tex
\begin{equation}\label{eq:nonadjacent-pairing}
 \langle s_i^2,s_j^2\rangle=c_0D^2.
\end{equation}
\begin{equation}\label{eq:braid-recursion}
 N_rR_r=1+(r-2)(3R_3-1)+\binom{r-2}{2}c_0
 \qquad(3\le r\le 2k).
\end{equation}
\begin{equation}\label{eq:lower-cross-pairing}
 c_0\ge-\frac1{k-1}.
\end{equation}
\begin{equation}\label{eq:disjoint-centers}
 R_k\ge c_0.
\end{equation}
```

```tex
Put $r=k$ in \eqref{eq:braid-recursion} and use
\eqref{eq:disjoint-centers}.  Since
$N_k-\binom{k-2}{2}=2k-3$, we obtain
\begin{align*}
 3R_3
 &\ge 1-\frac1{k-2}+\frac{2k-3}{k-2}c_0\\
 &\ge 1-\frac{3k-4}{(k-1)(k-2)},
\end{align*}
```

(b) `[补]` 逐步：
1. 归一化：$g=s_1^2$、$D=\ell(g)>0$、$R_r=\ell(Z_r)^2/(N_r^2D^2)$、$c_0=\langle s_1^2,s_3^2\rangle/D^2$。
2. `eq:nonadjacent-pairing`：先固定 $i=1$——$j\ge3$ 的 $s_j$ 都在 $C_G(g)$ 内，相邻辫子关系经特征标取值相等；
   一般情形用 $\delta^{i-1}$ 同时共轭 $(s_1,s_{j-i+1})\mapsto(s_i,s_j)$（引理 2.3 的共轭不变性 + `eq:braid-shift`），
   并核对索引上界 $\le l-2$。
3. `eq:braid-recursion` 的推导链：$\langle g,Z_r\rangle=N_rR_rD^2$（`eq:braid-central-pairing` × $D^2/(N_rD^2)$ 归一）；
   $Z_3=gL_3$ ⇒ $\langle g,L_3\rangle=\langle g,Z_3\rangle-\langle g,g\rangle=(3R_3-1)D^2$；
   $j>3$ 时 $L_j=(s_{j-1}\cdots s_3)L_3(s_3\cdots s_{j-1})$，所有因子在 $C_G(g)$ 内且
   $\langle g,s_i\rangle=c_0D^2/2$（$i\ge3$），保留 $L_3$ 不展开（原文逐字："this calculation does not expand
   the noncommuting $s_2$-letters inside $L_3$"——**这就是必须用引理 2.4 的理由**）⇒
   $\langle g,L_j\rangle=(3R_3-1+(j-3)c_0)D^2$。求和 $\sum_{j=1}^r$（$L_1=1$ 贡献 0、$L_2=g$ 贡献 $D^2$）
   $\Rightarrow$ `eq:braid-recursion`。
4. `eq:lower-cross-pairing`：$k$ 个两两交换的平方 $s_1^2,s_3^2,\dots,s_{2k-1}^2$，乘积平方长度
   $=kD^2+k(k-1)c_0D^2\ge0$（引理 2.3 半正定）。
5. `eq:disjoint-centers`：$Z'_k=\delta^kZ_k\delta^{-k}$（用掉字母 $s_{k+1},\dots,s_{2k-1}$，最大应用索引 $2k-2$）；
   两块的字母两两交换 ⇒ $Z_k,Z'_k$ 交换，且共轭等长。写字 $Z_k=x_1\cdots x_{2N_k}$、$Z'_k=y_1\cdots y_{2N_k}$，
   **两次**合法的特征标展开：$\langle Z_k,Z'_k\rangle=\sum_p\langle x_p,Z'_k\rangle=\sum_{p,q}\langle x_p,y_q\rangle
   =(2N_k)^2\frac{c_0D^2}{4}=N_k^2c_0D^2$（$1/4$ 由 $\langle x^2,y^2\rangle=4\langle x,y\rangle$ 反解）。
   $\ell(Z_k(Z'_k)^{-1})^2=2\ell(Z_k)^2-2\langle Z_k,Z'_k\rangle=2N_k^2D^2(R_k-c_0)\ge0$。
6. 收尾：$R_k\ge c_0$ 代入 (r=k) 的递推 ⇒ 两行链式不等式 ⇒ $k=20$：$3R_3\ge143/171$、$R_3\ge143/513>1/4$；
   $Z_3=(s_1s_2)^3$、$N_3=3$、$\ell(s_2^2)=D$ ⇒ 比值。

(c) `[机械理由]` "为什么必须是这个界"：$3R_3$ 的下界是 $\frac{1}{k-2}$ 与 $\frac{2k-3}{(k-2)(k-1)}$ 两个亏损项之和，
$k\to\infty$ 时趋于 $1$ ⇒ $R_3\to1/3$、比值 $\to1/\sqrt3=0.577$；但 $\pi/3$ 的角度阈值要求比值 $>1/2$ 严格成立，
故只需要 $k$ 足够大使下界 $>3/4$。**$k$ 不能小**：$k=3$ 时 $1-\frac{5}{2\cdot1}<0$。
$N_k-\binom{k-2}{2}=2k-3$ 是化简枢纽（本人验算：$\binom k2-\binom{k-2}{2}=\frac{k(k-1)-(k-2)(k-3)}2=(4k-6)/2=2k-3$ ✓）。

(d) `[推测]` 失败路线：
1. `[分析]` 若 $R_k\ge c_0$ 换成更弱的 $R_k\ge c_0-\eta$，则最终下界减去 $\frac{(2k-3)\eta}{k-2}$，
   $k=20$ 时放大系数 $37/18\approx2.06$ —— **对 $c_0$ 估计的误差以 2 倍传递**；
2. 若只有一条约束（丢掉 `eq:disjoint-centers`），$c_0$ 只有下界无上界联系，$R_3$ 无下界；
3. `[推测]` 原作者可能在"两块中心不相交"与"$k$ 个奇数平方"之外试过第三种正性（如全部 $2k-1$ 个平方之积），
   证据来源：原文 115–117 行的预告句"Positivity for the commuting odd-indexed squares **and for two disjoint
   block centers** will then constrain these quantities"——写成清单式预告，通常是筛选后的结果。
Lean 对应：`Braids.lean:281 braid_nonadjacent_pairing`（= `eq:nonadjacent-pairing`）、
`:302 lengthPairing_disjoint_centers`、`:316 lengthPairing_braidDelta`、`:329 equiangular_product_sq`
（$\ell(\prod_{i<n}t_i)^2=nq+n(n-1)v$，= 第 4 步）、`:347 braid_loop_character`、`:364 braid_center_character`
（= 第 3 步 $\langle g,L_j\rangle$ 公式）、`:380 lengthPairing_le_self_of_equal_length`（= 第 5 步的
$\ell$ 相等 ⇒ 配对上界，用 `stableLength_product_sq` + `sq_nonneg`）、`:190 braidCenter_shift_conjugate`
（$Z'_k=\delta^kZ_k\delta^{-k}$ 的机器形式）。**机器里没有 $R_r,r$ 的递推符号**，而是把 $n:=19$、
$n:=17$、$k:=20$ 直接实例化后 `norm_num`/`linarith` 收尾（见 A-4 的差异清单）。

### A-2.12 命题 4.1（`prop:triangle-obstruction`，`sectors.tex` 10–17 行 + 19–36 行路线图）：$T$ 的主障碍

(a) 原文逐字（含节首设定与"分母为正"的即用时验证）：

```tex
Set
\[
 T=\langle a,b,c\mid aba=bab,\ bcb=cbc,\ cac=aca\rangle,\qquad
 \mathcal E=\{(a,b),(b,c),(c,a)\},
\]
and write \(z_{uv}=(uv)^3\) for \((u,v)\in\mathcal E\).

\begin{proposition}\label{prop:triangle-obstruction}
There is no geometric action of \(T\) such that, for every
\((u,v)\in\mathcal E\),
\begin{equation}\label{eq:strict-ratios}
 \frac{\ell(z_{uv})}{3\ell(u^2)}
 =\frac{\ell(z_{uv})}{3\ell(v^2)}>\frac12.
\end{equation}
\end{proposition}

The denominators are positive in every geometric action: sending each
of \(a,b,c\) to \(1\in\mathbb Z\) shows that their squares have infinite
order, so Lemma~\ref{lem:semisimple} applies.  The equality of the two
ratios also follows from conjugacy of adjacent braid generators.
We prove the proposition in Section~\ref{sec:localization}.  In this
section, assume for contradiction that such an action on \(Y\) exists
and fix \(y\in Y$.
```

路线图段逐字（27–36 行，本篇少见的"整段预告"）：

```tex
We will construct a parameter disk \(P\) made of six Euclidean sectors
and maps \(f_n:P\to Y\), indexed by positive integers \(n\).  Within
each sector, image distances divided by \(n\) approach Euclidean
distances.  Mirror coordinates will ensure a second property: disjoint
closed regions of \(P\) have images separated by a positive multiple
of \(n\).  The total sector angle below \(2\pi\) then lets us fill the
same boundary by a second disk whose image stays a positive multiple
of \(n\) from \(y\).  Sections~\ref{sec:diagrams} and
\ref{sec:localization} compare the resulting sphere with finite labelled
diagrams to obtain the contradiction.
```

(b) `[补]` 命题的量化结构：$\neg\exists$（几何作用 $T\curvearrowright Y$ 且三对比值均 $>1/2$）。
它比 §2–§3 强的地方在于**只用 $T$ 本身的三个辫子对**，不需要 39 个元素；比它弱的地方在于只排除
"满足比值条件的作用"，所以 §7 必须证明"环境群几何作用 ⇒ $T$ 的诱导作用几何且继承比值"。
证明的实体在 §4–§6：本 §4 造 $P$、$f_n$、外盖帽 ⇒ 球面；§5 造图示与符号计数；§6 造局部绕数并收束。

(c) `[机械理由]`
- $\mathcal E$ 取**循环三对**而非全部三对无序对：$(a,b),(b,c),(c,a)$ 让六扇区首尾相接成闭环
  （`eq:ray-order` 的循环序 $a^2,z_{ab},b^2,z_{bc},c^2,z_{ca},a^2$）；若取无序对 $\{a,b\},\{b,c\},\{a,c\}$
  则 $z_{ac}=(ac)^3$ 与 $z_{ca}$ 不同元素、循环方向反了会把扇区顺序搞乱（比较角定义依赖方向）。
- "阈值 $1/2$" 的机械来源：$\cos\theta=\ell(H)/(3\ell(U))$（见 A-2.15 的 `eq:sector-angle`），
  $\theta<\pi/3\iff\cos\theta>1/2$；六个扇区总角 $<6\cdot\pi/3=2\pi$。
  ⇒ **$1/2$ 与 $\pi/3$、$2\pi$ 与 6 是同一件事的四种写法**；若阈值改成 $>\frac12-\eta$，
  则 $\theta<\arccos(\frac12-\eta)>\pi/3$，总角可能 $\ge2\pi$，外盖帽（A-2.17）立刻失效。
- 分母正性用 $T\to\mathbb Z$（$a,b,c\mapsto1$）：这是"增广存在性"的最廉价格式，
  避免了对 $T$ 双曲性/挠自由性的任何讨论。

(d) `[推测]` 失败路线：
1. 若三对只满足两对比值 $>1/2$，得四个扇区，总角 $<4\pi/3$ 但**不构成闭环**，无法造"同一边界的第二个圆盘"；
   失败机制：`lem:outer-cap` 的 $\partial P$ 必须是拓扑圆。
2. `[推测]` 作者曾可能在 $T$ 上直接用 Crisp 的二维角和论证（引言 108–112 行逐字："A related angle-sum
   obstruction appears in Crisp's study of two-dimensional Bestvina--Brady groups… His argument assumes
   covering dimension two and a proper action in which each isometry attains its minimum displacement."）；
   该句的存在与它后面的转折（"The main geometric step is to turn this short angular circuit into a
   contradiction that remains valid in arbitrary dimension"）是**改换路线的文本痕迹**。
   证据来源：引言段落顺序 + "remains valid in arbitrary dimension"。
3. 若把比值条件 weaken 成 $\ge 1/2$（非严格），$\Omega<2\pi$ 变成 $\Omega\le2\pi$，
   $\varepsilon=\frac12(1-\sin(\Omega/4))$ 仍正（$\Omega\le2\pi\Rightarrow\sin(\Omega/4)\le\sin(\pi/2)=1$，
   等号时 $\varepsilon=0$）⇒ **严格性是必需的**。
Lean 对应：机器侧本命题是 `SixSector.no_strict_ratios`（`Main.lean` 里
`apply SixSector.no_strict_ratios hT y` 逐字出现），其假设形态是"三对生成子的比值严格 $>1/2$"，
论文里的 $\mathcal E$/$z_{uv}$ 记号在机器里被展成具体索引。

### A-2.13 引理 4.2（`lem:orbit-control`，`sectors.tex` 46–66 行）：Švarc–Milnor 轨道比较（带显式常数）

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:orbit-control}
For a geometric action of \(T\) and any base point \(y\), there are
constants \(R,C<\infty\) such that \(Ty\) is \(R\)-dense and
\begin{equation}\label{eq:orbit-control}
 d_T(s,t)\le C\bigl(1+d_Y(sy,ty)\bigr)\qquad(s,t\in T).
\end{equation}
\end{lemma}
```

前置说明逐字："The following form of the \v{S}varc--Milnor orbit comparison is standard; see
\cite[I.8.18--19]{BridsonHaefliger1999}. Its direct proof records the constants used to turn
mirror-coordinate separation into metric separation."

(b) `[补]` 证明的中项：
1. $R=\max_{p\in K}d(y,p)$（$K$ 紧、$GK=Y$）；任意 $x\in X$ 写 $x=tp$，$d(x,ty)=d(tp,y)\le d(p,y)\le R$
   （等距）⇒ $Ty$ 的 $R$-稠密。
2. 测地线分成 $N=\max(1,\lceil L\rceil)\le L+1$ 段（每段长 $\le1$），分点处取轨道点 $x_i=t_iy$，
   端点标签固定为 $s,t$；相邻增量 $q=t_i^{-1}t_{i+1}$ 满足 $d(y,qy)\le d(y,t_i^{-1}x_i)+d(y,t_i^{-1}x_{i+1})$
   量级 $2R+1$。
3. 这些 $q$ 有限：$\overline B(y,2R+1)$ 闭有界 ⇒ 紧（空间 proper）⇒ 含 $y,qy$ ⇒ $q$ 属于
   $\{g:gy\in\overline B\}$，由 action proper（对单点紧集 $\{y\}$）有限。
4. $C=\max(1,\max_q|q|_T)$ ⇒ $d_T(s,t)\le NC\le C(1+d_Y(sy,ty))$。

(c) `[机械理由]` "动了会坏在哪"：(4.1) 的方向是** word metric 由度量控制**（不是双 Lipschitz 等价），
因为用途是把"$V(t)$ 的 $\|\cdot\|_1$ 分离"翻译成"$d_Y$ 分离"（`lem:sector-maps` 最后一步的
$\frac{\eta n}{2C}-1-2C_0$ 里 $C$ 出现在**分母**）。故只需单侧 + 加法常数；写成双侧等价反而要额外论证。
$+1$ 是必需的：$s=t$ 时 $d_Y=0$，若无 $+1$ 则 $C$ 需 $\ge$ 所有增量字长的比，遇到 $d_Y$ 很小时崩溃。

(d) `[推测]` 失败路线：
1. 若作用不 cocompact，$R$ 不存在 ⇒ 分点无法选在轨道上 ⇒ 全链断；
2. 若空间不 proper，第 3 步的"$q$ 有限"失效 ⇒ $C=\infty$；
3. `[推测]` 原文自证而不引 BH I.8.18 的动机是"records the constants"——机器化需要显式 $R,C$ 而非存在性；
   证据来源：逐字"That direct proof records the constants used…"。
Lean 对应：`Mirrors.lean`（118 行）与 `Cap.lean`/`Grid.lean` 中的轨道稠密性使用；机器侧把 $R,C$
作为 `orbit_control` 类引理的显式输出（A-4 会列 `controlled_refinement` 给出的 $C,D$ 双界）。

### A-2.14 引理 4.3（`lem:mirror-action`，`sectors.tex` 74–135 行）：Digne 反射坐标仿射作用

(a) 原文逐字（设定 + 陈述）：

```tex
Take an equilateral triangle in the Euclidean plane, and denote its
three side lines by \(D_a,D_b,D_c\).  Let \(r_u\) be reflection in
\(D_u\), and let \(\mathcal D\) be the set of all images of these three
lines under the generated reflection group.  Write
\[
 E=\bigoplus_{D\in\mathcal D}\mathbb R e_D,\qquad
 \left\|\sum_D \xi_D e_D\right\|_1=\sum_D|\xi_D|.
\]
All vectors here have finite support.  Each \(r_u\) preserves
\(\mathcal D\) and acts linearly on \(E$ by permuting its basis vectors.

\begin{lemma}\label{lem:mirror-action}
The formulas
\[
 u\cdot\xi=e_{D_u}+r_u\xi\qquad(u=a,b,c)
\]
define an affine isometric action of \(T\) on \(E\).  If \(V(t)=t\cdot0\),
then
\begin{equation}\label{eq:mirror-lipschitz}
 \|V(t)-V(s)\|_1\le d_T(s,t).
\end{equation}
For each \((u,v)\in\mathcal E\), the elements \(u^2,z_{uv}\) act by pure
translations with vectors
\begin{equation}\label{eq:mirror-translations}
 L_u=2e_{D_u},\qquad
 L_{uv}=2(e_{D_u}+e_{D_v}+e_{D_{uv}}),
\end{equation}
where \(D_{uv}\) is the third mirror at \(D_u\cap D_v\).
The three lines \(D_{ab},D_{bc},D_{ca}\) are distinct from one another
and from \(D_a,D_b,D_c\).
\end{lemma}
```

（`$E$` 处的转义同 A-2.2 说明，源码为 `$E$`。）

(b) `[补]` 三步：
1. **仿射辫子关系**：两条相交边反射生成"过交点、夹角 $\pi/3$ 的三线反射群"；$uvu$ 与 $vuv$ 的**线性部分相同**
   （同为该三线的反射群元素），平移部分 $uvu$ 为
   $e_{D_u}+e_{r_uD_v}+e_{r_ur_vD_u}=e_{D_u}+e_{D_{uv}}+e_{D_v}$，$vuv$ 为同一和的**逆序** ⇒ 相等。
   `[补]`  cocycle 展开：$(u\cdot)(v\cdot)(u\cdot)(0)=e_{D_u}+r_u(e_{D_v}+r_v e_{D_u})=e_{D_u}+e_{r_uD_v}+e_{r_ur_vD_u}$。
2. **Lipschitz**：每个生成子（或其逆）把 $0$ 移动 $\|\cdot\|_1=1$ 的向量 ⇒ 字长 $k$ 移动 $\le k$；
   加上 cocycle 恒等式 $V(t)-V(s)=r_sV(s^{-1}t)$（**线性部分是保 $\|\cdot\|_1$ 的置换**）⇒ (4.2)。
3. **纯平移向量**：$u^2$：$r_u$ 固定 $e_{D_u}$ ⇒ $u\cdot(u\cdot0)=e_{D_u}+r_ue_{D_u}=2e_{D_u}$。
   $z_{uv}=(uv)^3=(uvu)^2$：$uvu$ 的线性部分保持 $e_{D_u}+e_{D_{uv}}+e_{D_v}$ 且平方为恒等 ⇒ 平方后线性部分消失、
   平移翻倍 ⇒ (4.3)。第三mirror 与对边平行且不同 ⇒ $D_{ab},D_{bc},D_{ca}$ 互异且异于 $D_a,D_b,D_c$。

(c) `[机械理由]`
- 为什么需要**六个**不同的 mirror 坐标（3 边 + 3 顶点对面线）：`lem:sector-data` 的注入性论证
  靠"extra-mirror 坐标先定 $(u,v)$ 与 $\mu$，两条原边坐标的超出量定剩余指数与用哪个扇区"；
  若 $D_{uv}$ 与某条边重合，两个扇区会被映到同一条线，$v_*$ 不注入 ⇒ 区域分离失效。
- 为什么用 $\|\cdot\|_1$：$r_u$ 是基向量置换 ⇒ 自动等距；若用 $\ell^2$ 也等距但 (4.3) 的求和估计变复杂，
  而 $\ell^1$ 让"两个不相交区域像距离 $\ge\eta$"成为**坐标级**事实。
- (4.2) 的方向"$\|V(t)-V(s)\|_1\le d_T(s,t)$"与 (4.1) 的方向"$d_T\le C(1+d_Y)$"是**刻意配对**的：
  合成得 $\|V(s)-V(t)\|_1\le C(1+d_Y)$ ⇒ $d_Y\ge\|\cdot\|_1/C-1$，这是区域分离不等式的骨架。

(d) `[推测]` 失败路线：
1. 若把等边三角形换成一般三角形（Digne 的一般版本），$uvu$ 与 $vuv$ 的平移部分不再相等
   （$r_ur_vD_u$ 与 $r_vr_uD_v$ 不同线）⇒ 不构成 $T$ 的作用；证据来源：引言 117–118 行逐字
   "This action is the equilateral-triangle specialization of Digne's reflection-coordinate homomorphism"。
2. 若去掉 $\mathcal D$ 中"所有像线"而只保留三条边线，$r_u$ 不在置换基向量意义下作用 ⇒ 仿射性破坏。
3. `[分析]` $L_{uv}$ 的系数 2 是 $u^2$ 型平移到邻倍的结果；若把 (4.3) 整体缩放 $\lambda$，
   (4.2) 与区域分离的 $\eta$ 同步缩放，最终 $\delta$ 变 $\lambda\delta$ ⇒ 结论不变（**尺度自由**，
   只有 $v_*$ 与 $P$ 的相对定位要紧）。
Lean 对应：`Mirrors.lean`（118 行，最小模块）承载 (4.2)/(4.3)；机器里 $\mathcal D$ 用可判别的有限线集表示，
`e_D` 基用 `Finsupp`/`Pi` 类型，$\|\cdot\|_1$ 用 `Finset.sum`。

### A-2.15 引理 4.4（`lem:sector-data`，`sectors.tex` 139–212 行）：六个扇区的正定性与角度 $<\pi/3$

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:sector-data}
Each of these six seminorms is positive definite.  Each sector angle
\(\theta\) satisfies \(0<\theta<\pi/3\).
The sectors glue isometrically along their shared rays, in the cyclic
order
\begin{equation}\label{eq:ray-order}
 a^2,\ z_{ab},\ b^2,\ z_{bc},\ c^2,\ z_{ca},\ a^2.
\end{equation}
Their radius-one disk \(P\) is a topological disk with total angle
\(0<\Omega<2\pi\).  It has a continuous injective map \(v_*:P\to E\)
whose value in a sector for \(U=u^2,H=z_{uv}\) is
\begin{equation}\label{eq:separating-coordinates}
 v_*(\lambda,\mu)=\lambda L_u+\mu L_{uv},
\end{equation}
and similarly with \(v$ in place of \(u\).
\end{lemma}
```

前置构造段逐字（139–148 行）：`For each pair \((u,v)\in\mathcal E\), use both commuting pairs
\((U,H)=(u^2,z_{uv})\), \((U,H)=(v^2,z_{uv})\). Commutation follows from Lemma~\ref{lem:braid-centers}.
On the exponent plane \(\mathbb R^2\) of each pair, let \(\|\cdot\|_{U,H}\) be the stable seminorm from
Lemma~\ref{lem:commuting-form}. Give its nonnegative quadrant exponent coordinates \((\lambda,\mu)\),
corresponding to \(U,H\), respectively. The next lemma proves that this quadrant is a Euclidean sector.`

(b) `[补]` 四段：
1. **正定**：整数 $(i,j)$ 下 $V((U^iH^j)^m)=m(iL_u+jL_{uv})$（纯平移的合成），
   用 (4.2) + (4.1) 除以 $m$ 取极限 ⇒ $\|iL_u+jL_{uv}\|_1\le C\|(i,j)\|_{U,H}$；
   齐性扩到 $\mathbb Q^2$、连续性扩到 $\mathbb R^2$；$L_u,L_{uv}$ 线性无关
   （extra-mirror 坐标先定 $j$，$D_u$ 坐标再定 $i$）⇒ 半范数支配一个真范数 ⇒ 正定。
   `[补]` 注意方向：**mirror 范数 $\le C\cdot$ 稳定范数**，正定性由"右边若为 0 则左边为 0 ⇒ $(i,j)=0$"给出。
2. **角度**：`eq:braid-central-pairing` 取 $r=3$ ⇒ $\langle U,H\rangle=\ell(H)^2/3$（$N_3=3$），
   于是 `eq:sector-angle`：
   ```tex
   \cos\theta=\frac{\langle U,H\rangle}{\ell(U)\ell(H)}
    =\frac{\ell(H)}{3\ell(U)}>\frac12.
   ```
   正定 ⇒ $\cos\theta<1$ ⇒ $0<\theta<\pi/3$。
3. **粘合**：共享射线对应同一元素 $W$，指数 $t\ge0$ 在两侧离原点距离都是 $t\ell(W)$ ⇒ 保指数保度量；
   得到锥面：半径 $r\ge0$ + 周期 $\Omega$ 的循环角，$r=0$ 处所有角重合；$0\le r\le1$ 即 $P$。
4. **$v_*$ 注入**：分情形（extra-mirror 坐标非零 / 无超出量 / 无 extra-mirror 系数）逐一定位，
   见 (c) 第 1 点。

(c) `[机械理由]`
- 为什么恰好 6 个扇区（每对 $(u,v)$ 用**两个**交换对）：一个 $(u^2,z_{uv})$ 扇区只覆盖半边，
  $(v^2,z_{uv})$ 与之沿 $z_{uv}$ 射线相接；三条边 ⇒ 6 块，闭合条件 `eq:ray-order` 才成立。
- $\cos\theta$ 公式是 $\pi/3$ 阈值的**唯一入口**：$\theta=\arccos(\ell(H)/(3\ell(U)))$；
  若把 $N_3=3$ 记成 2，$\cos\theta$ 变成 $\ell(H)^2/(2\ell(U)\ell(H))$ ⇒ 阈值条件改写为 $\ell(H)/\ell(U)>1$，
  与 §3 得到的 $>1/2$ 完全不匹配。
- 原文逐字"We use only the Euclidean metric within each sector of $P$;
  **we do not claim that this cone disk is CAT(0)**."——这是"论文未述清单"的一条：$P$ 只是度量的拼装盘，
  不是 CAT(0) 空间，一切 CAT(0) 事实都在 $Y$ 一侧。

(d) `[推测]` 失败路线：
1. 若 $\Omega\ge2\pi$，$P$ 不再是拓扑圆盘（锥点处角亏为负），`lem:outer-cap` 的弦长论证失效；
2. 若 $L_u,L_{uv}$ 线性相关（例如 $D_{uv}$ 与 $D_u$ 重合），正定性失效 ⇒ $\|(i,j)\|_{U,H}$ 可能是半范数，
   扇区退化成一维；
3. `[分析]` $v_*$ 注入性依赖"超出量"论证，若某扇区的 $(u,v)$ 与另一扇区共享同一 extra-mirror 坐标
   （比如把 $\mathcal E$ 改成包含 $(a,c)$ 而非 $(c,a)$），注入性会在 $H$-射线两侧混淆 ⇒
   `[推测]` 论文明写"$D_{ab},D_{bc},D_{ca}$ 互异"正是为堵此点。
Lean 对应：`SectorMetric.lean`（476 行，扇区上的稳定范数/角度）与 `SectorCharts.lean`（496 行，
$v_*$ 坐标卡与注入性；该文件含 `Classical.choose` 用法 :45, :354）；机器侧把 6 个扇区写成
`Fin 6` 索引的显式表，`AngularSize = 6*(n+1)` 类常数用于离散化（见 A-5 表）。

### A-2.16 引理 4.5（`lem:sector-maps`，`sectors.tex` 241–326 行）：一致渐近映射与区域分离

(a) 原文逐字（含标签定义 (4.4)）：

```tex
In each sector define the group label
\begin{equation}\label{eq:sector-label}
 t_n(p)=U^{\lfloor n\lambda\rfloor}H^{\lfloor n\mu\rfloor}.
\end{equation}
These labels agree on the glued rays.

\begin{lemma}\label{lem:sector-maps}
There are continuous maps \(f_n:P\to Y\), with \(f_n(0)=y\), and a
constant \(C_0\) independent of \(n,p\), such that
\begin{equation}\label{eq:grid-error}
 d_Y(f_n(p),t_n(p)y)\le C_0.
\end{equation}
For two points in any one sector,
\begin{equation}\label{eq:sector-convergence}
 \frac{d_Y(f_n(p),f_n(p'))}{n}
 \longrightarrow\|p-p'\|_{U,H}
\end{equation}
uniformly.  In addition, uniformly on \(P\),
\begin{equation}\label{eq:radial-coordinates}
 \frac{d_Y(y,f_n(p))}{n}\longrightarrow r(p),
 \qquad
 \frac{V(t_n(p))}{n}\longrightarrow v_*(p).
\end{equation}
If \(A_1,A_2\subset P\) are disjoint nonempty closed sets, then for
some \(\delta>0\) and all sufficiently large \(n\),
\begin{equation}\label{eq:region-separation}
 d_Y(f_n(A_1),f_n(A_2))\ge\delta n.
\end{equation}
\end{lemma}
```

(b) `[补]` 构造与四个估计的中项：
1. **建图**：在指数象限用边长 $1/n$ 的方格剖分（每格沿对角线剖成三角形），顶点 $(i/n,j/n)$ 映到 $U^iH^jy$；
   边上用等速测地线；三角形内把对边向剩余顶点**锥化**（用测地线）。公共边上是同一等速参数化 ⇒ 连续。
   测地凸性 ⇒ 像点到顶点的距离 $\le$ 顶点距离最大值；交换性 ⇒ 顶点距离由 $U,H$ 的位移一致控制
   ⇒ (4.5) $C_0$。**六个扇区只有有限个**，故可取公共 $C_0$（原文逐字）。
2. **单对收敛**：$F(i,j)=d_Y(y,U^iH^jy)$ 满足
   $|F(i,j)-F(i',j')|\le d(y,Uy)|i-i'|+d(y,Hy)|j-j'|$；固定有理向量 $q=(a/b)$ 型，比较
   $\lfloor nq\rfloor$ 与 $\lfloor n/m\rfloor(a,b)$（差有界）⇒ $F(\lfloor nq\rfloor)/n\to\|q\|_{U,H}$
   （含负分量）；有界区域取有限有理网 + 公共 Lipschitz + 舍入 $O(1/n)$ ⇒ 区域上一致收敛。
3. **两点差**：两点地板向量之差与 $n(p'-p)$ 的地板差一个有界整向量 ⇒ 用 2 与 (4.5) 得 (4.6)；
   取一点为 $0$ 得径向式；$V(t_n(p))/n\to v_*(p)$ 直接由 (4.3)，且误差实际是 $O(1/n)$。
4. **区域分离**：$\eta=\min_{A_1\times A_2}\|v_*(p)-v_*(q)\|_1>0$（紧 + 注入），
   $\|V(t_n(p))-V(t_n(q))\|\ge\eta n/2$；合成 (4.2)+(4.1)+(4.5)：
   ```tex
    d_Y(f_n(p),f_n(q))
    \ge\frac{\eta n}{2C}-1-2C_0.
   ```
   取 $\delta<\frac{\eta}{2C}$、$n$ 足够大 ⇒ (4.8)。

(c) `[机械理由]`
- $\lfloor n\lambda\rfloor$ 的地板：把连续参数离散成群元素，误差 $O(1/n)$ 是"渐近 Euclidean"的字面来源；
  不用地板而用四舍五入也可，但 $t_n$ 在粘合射线上必须**一致**（原文"agree on the glued rays"），
  地板在共享射线上的指数表示恰好一致（$H$ 射线两侧都是 $(0,\mu)$ 型）。
- $C_0$ 必须与 $n,p$ 无关：否则 (4.8) 的 $\delta n$ 无法吸收；"只有六个扇区"是 $C_0$ 存在的理由。
- 分离量级必须是 $n$（不是 $\sqrt n$ 或 $o(n)$）：§5–§6 的图示控制用 $\delta n$ 与 $2C_1$ 比较
  （`lem:localized-degree`），$C_1$ 与 $n$ 无关 ⇒ 只有线性分离能压过图示误差。
- 环境说明：整个引理被 `\begin{samepage}` 包裹（240、264 行），是 LaTeX 排版层面的"不许断页"，
  提示作者在意该陈述的完整性（见 A-3 的 tex 叙事痕迹）。

(d) `[推测]` 失败路线：
1. 若 $v_*$ 在某对不相交闭集上像距离为 0（注入性丢失），$\eta=0$ ⇒ 无分离 ⇒ §6 的局部度论证崩；
2. 若 (4.6) 只在每扇区内部成立而跨扇区不成立，$P$ 上的 $r(p)$ 径向一致性仍可（原文只声明单扇区内 (4.6)），
   故真正的风险是 (4.7) 的一致版本 —— `[推测]` 作者刻意把"uniformly on $P$"只挂在 (4.7) 上，
   说明 (4.6) 的跨扇区版本不可用（跨扇区时 $\|\cdot\|_{U,H}$ 未定义）；
3. 若 $C$（`lem:orbit-control` 常数）未知有限，$\delta$ 无法选 ⇒ 该引理显式依赖 4.2，不可删。
Lean 对应：`Grid.lean`（596 行：网格、$t_n$、$C_0$ 型误差，含 `Classical.choose` :246,:383）、
`Refinement.lean`（455 行：一致逼近与剖分细化，choose :123,:145,:147）、
`SectorCharts.lean`（496 行：$v_*$ 与区域分离）。机器里 $C_0$ 与 $C,D$ 的具体数值被写进
`controlled_refinement` 的输出（$B=22+4C+4E$ 等，见 A-5）。

### A-2.17 引理 4.6（`lem:outer-cap`，`sectors.tex` 328–374 行）：外盖帽与远离锥点的第二个圆盘

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:outer-cap}
There is \(\epsilon>0\) such that, for all sufficiently large \(n\),
the map \(f_n|_{\partial P}\) extends to a second parameter disk whose
entire image lies outside \(B_Y(y,\epsilon n)\).
Gluing the two parameter disks gives a continuous sphere map, still
denoted \(f_n\).
\end{lemma}
```

(b) `[补]` 五步：
1. $\partial P$ 上两点取**较短**角弧，角 $\phi\le\Omega/2<\pi$（"$\Omega<2\pi$" 在此处第一次被消费）。
2. 把该弧展开成 Euclidean 楔形；楔 $\cap$ 单位圆盘凸 ⇒ 弦在盘内，弦长 $2\sin(\phi/2)\le2\sin(\Omega/4)$。
3. 每个扇区在该展开中至多出现一次；含两端点的扇区可能拆成两块 ⇒ 弦分成**至多七段**单扇区片，
   每片与弦的交是线段（凸性），逐片用 (4.6)：`eq:boundary-short`
   $d_Y(f_n(p),f_n(p'))\le2\sin(\Omega/4)n+o(n)$，**对 $\partial P$ 上一致**。
4. 固定 $p_0\in\partial P$，把边界映射向 $f_n(p_0)$ 用测地线锥化 ⇒ 第二个圆盘（连续依赖给连续性，
   用 `lem:comparison` 首句）。
5. 距离下界：若 $q\in[A,B]$（锥线段端点），
   $d(y,q)\ge\max\{d(y,A)-d(A,q),d(y,B)-d(q,B)\}\ge\frac{d(y,A)+d(y,B)-d(A,B)}2$；
   端点距离都是 $n+o(n)$（(4.7) 径向），$d(A,B)$ 由第 3 步控制 ⇒
   整段离 $y$ 至少 $(1-\sin(\Omega/4))n-o(n)$。取 $\epsilon=\frac12(1-\sin(\Omega/4))>0$。

(c) `[机械理由]`
- $2\sin(\Omega/4)$ 的来源：较短弧 $\phi\le\Omega/2$，单位圆上弦长 $2\sin(\phi/2)$ ⇒ $2\sin(\Omega/4)$；
  **系数 $\Omega/4$ 是"半径 1"下的半角**，若 $P$ 的半径改成 $R$，则弦长 $2R\sin(\Omega/4)$、
  端点距离 $Rn$，$\epsilon$ 相应缩放 ⇒ 结论尺度不变（与 A-2.14(d)3 的尺度自由一致）。
- $\epsilon>0\iff\sin(\Omega/4)<1\iff\Omega<2\pi$：**这就是六扇区角度上界的兑现处**，
  也是全篇"动了会坏在哪"最紧的一点（任何把阈值放宽到 $\ge\pi/3$ 的改动使 $\epsilon=0$）。
- "至多七段"而非"六段"：含两端点的扇区被弧的起点/终点各切一次 ⇒ 最坏 $6+1$；写成 6 会漏掉
  端点落在同一扇区内部的情形。`[分析]` 该数是上界估计，任何 $\ge7$ 的写法都可行，不影响结论。

(d) `[推测]` 失败路线：
1. 若 $\phi$ 可取到 $\ge\pi$（例如 $\Omega>2\pi$），"较短弧"展开后的楔不再凸于单位盘 ⇒ 弦跑出 $P$，
   第 2 步失效；失败机制是几何而非计数。
2. 若锥化的中心取 $y$ 而非 $f_n(p_0)$，整个盖帽经过 $y$，离 $y$ 距离为 0 ⇒ 与"远离锥点"矛盾；
   原文取 $f_n(p_0)$ 正是为了让**所有**点距离都由端点距离减弦长给出。
3. `[推测]` Lean 侧完全没有用"锥到一点"，而是显式造环带 + 绕指标（`Detour.lean`/`Cap.lean`），
   提示原文这一步在机器化时最难落地（锥化的连续性依赖测地线连续依赖，机器里要显式构造）。
   证据来源：`Detour.lean`(591)/`Cap.lean`(586) 的存在及其命名；见 A-4 差异清单。
Lean 对应：`Cap.lean`（外盖/边界长度控制）、`Detour.lean`（绕行路径与环带）、
`Wires.lean`（274 行，把度为 2 的顶点压缩 `resolve`）—— 机器里 `eq:boundary-short` 的等价物是
显式折线长度界（A-5 的 $d=2\sqrt{1+r^2-2cr}+r$ 型公式）。

### A-2.18 §5 目的段 + 引理 5.1（`lem:triangular-presentation`，`diagrams.tex` 4–41 行）：9 生成子三角呈现

(a) 原文逐字（节首定位段 + 陈述 + 证明全文，证明很短故照抄）：

```tex
We next construct a two-dimensional labelled complex from the presentation
of $T$.  The presentation and link are the case $m=n=p=3$ of the
construction of Brady and McCammond \cite{BradyMcCammond2000}.
We give direct proofs of the needed facts.  This complex is separate
from the unknown CAT(0) space; the argument here concerns finite
diagrams and planar topology.

We need two conclusions.  Proposition~\ref{prop:sphere-counts} will
show that a spherical diagram has zero total signed occurrences of
each individual target triangle.  Lemma~\ref{lem:controlled-diagrams}
will approximate any geometric sphere map by a diagram, with one
distance bound valid on every point of every parameter triangle.
```

```tex
\begin{lemma}\label{lem:triangular-presentation}
For each $(u,v)\in\mathcal E$, introduce two private generators
$x_{uv}$ and $h_{uv}$.  Write
$(x_1,x_2,x_3,h)=(u,v,x_{uv},h_{uv})$ within this block.  A presentation
of $T$ is given by the three relations
\begin{equation}\label{eq:triangle-relations}
  x_i x_{i+1}=h\qquad (i=1,2,3),
\end{equation}
in each block, where the subscripts on the $x_i$ are read modulo three.
\end{lemma}

\begin{proof}
The first two relations give $h=x_1x_2$ and
$x_3=x_2^{-1}x_1x_2$.  Substituting these in the third gives
$x_1x_2x_1=x_2x_1x_2$.  Conversely, that braid relation and these
definitions of $x_3,h$ give all three relations
\eqref{eq:triangle-relations}.  Since the added generators are private
to their blocks, eliminating them independently recovers the defining
presentation of $T$.
\end{proof}
```

(b) `[补]` 逐字展开消去链：$x_1x_2=h$、$x_2x_3=h$ ⇒ $x_3=x_2^{-1}h=x_2^{-1}x_1x_2$；
第三条 $x_3x_1=h=x_1x_2$ ⇒ $x_2^{-1}x_1x_2x_1=x_1x_2$ ⇒ 左乘 $x_2$：$x_1x_2x_1=x_2x_1x_2$ ✓。
反向：给定辫子关系，令 $h=x_1x_2$、$x_3=x_2^{-1}x_1x_2$，则 $x_2x_3=x_1x_2=h$ ✓ 且
$x_3x_1=x_2^{-1}x_1x_2x_1=x_2^{-1}x_2x_1x_2=h$ ✓。每块引入 2 个私有生成子 × 3 块 = 6，
加 $a,b,c$ 共 **9 个生成子**，关系为 9 条例程 $x_ix_{i+1}=h$（3 块 × 3 条）。

(c) `[机械理由]`
- 为什么把辫子关系改写成 $x_ix_{i+1}=h$ 型（"三角关系"）：三元三角形 $x_ix_{i+1}=h$ 给出**恰三个**
  角/三条边的三角形胞腔，使得 link 中每个块是一个 theta 图（三条内部不交长 3 路径）；
  若保留 $aba=bab$（长 6 循环），三角形不存在，图示计数（$3F=2E$）失去意义。
- "private"（私有）是关键：生成子不跨块共享 ⇒ 三块可**独立**消去，才得到"$\mathcal A$ 是 9 个生成子"
  且不引入跨块关系；跨块共享会让 link 的块间交变大，girth 论证（A-2.19）崩塌。
- `[机械理由]` 该复形与未知 CAT(0) 空间**无关**（原文逐字"This complex is separate from the unknown
  CAT(0) space"）：这是"任意维"得以保全的结构性理由——矛盾只在有限平面图示里发生。

(d) `[推测]` 失败路线：
1. 若 $x_i$ 的循环顺序在某块取反（$x_1,x_3,x_2$），$h$ 的定义与另一块不一致，9 个生成子的
  标号复形仍能构造，但 link 的三条 theta 路径方向错配 ⇒ `eq:link-edges` 的显式列表要重写；
2. `[推测]` 若不引入私有 $x_{uv}$ 而直接用 $a,b,c$ 的长 6 关系做二面角图示，
   则折叠删除论证（A-2.20）需要"面恰含三个角"，失败机制是 Euler 计数 $3F=2E$ 不成立。
证据来源：`prop:sphere-counts` 证明通篇假设"triangle/三条边/三角节点"。
Lean 对应：`Presentation.lean:145 triangleRelators`（`Fin 3` 上的自由群关系集）、
`:150 abbrev TriangleGroup := PresentedGroup triangleRelators`、`:160 triangleLift`、
`:196 triangleExponent`（→ `Multiplicative ℤ` 的增广，即下文 ℤ-化）、
`:202 triangle_generator_infinite_order`（`¬ IsOfFinOrder`）——
**机器里 $T$ 是独立的 `TriangleGroup` 类型**，不是 `ArtinGroup explicitMatrix` 的子群，
两者靠 `Assembly` 里的嵌入连接（见 A-2.24/A-2.28）。

### A-2.19 $\mathcal K$ 构造 + 引理 5.2（`lem:link-girth`，`diagrams.tex` 43–127 行）：girth $\ge6$

(a) 原文逐字（构造段 + 陈述）：

```tex
Let $\mathcal A$ be the resulting set of nine generators.  Define the
labelled Cayley complex $\mathcal K$ as follows.  Its vertices are the
elements of $T$.  For every $g\in T$ and $q\in\mathcal A$ there is an
oriented edge labelled $(g,q)$ from $g$ to $gq$.  For each relation
\eqref{eq:triangle-relations} and each $g$, attach a triangle, with its
own cell identity, along the edges joining
\begin{equation}\label{eq:triangle-vertices}
  g,\quad gx_i,\quad gh.
\end{equation}
Edges and triangles retain these identities even if some other cells
have the same vertex data.  The homomorphism $T\to\mathbb Z$ taking
$a,b,c$ to $1$ takes every $x_i$ to $1$ and every $h$ to $2$.
Consequently the three vertices in \eqref{eq:triangle-vertices} are
distinct.  In particular every target triangle has three distinct
sides and three distinct corners.

\begin{lemma}\label{lem:link-girth}
The link at every vertex of $\mathcal K$ has no circuit of length
less than six, including circuits formed by parallel edges.
\end{lemma}
```

(b) `[补]` 两个中项：
1. **ℤ-化分离顶点**：$g$（度 0）、$gx_i$（度 1）、$gh$（度 2）在增广下像不同 ⇒ 三个顶点两两不同
   ⇒ 三角形非退化。`[补]` 若 $h$ 也赋 1，则 $gh$ 与 $gx_i$ 同度，可能出现 $h=x_i$ 型退化。
2. **link 的完整描述**：在 Cayley 顶点 $v$，关系 $x_ix_{i+1}=h$ 的三个角分别在
   $g=v,\,vx_i^{-1},\,vh^{-1}$，对应 link 边 `{x_i⁺,h⁺}, {x_i⁻,x_{i+1}⁺}, {x_{i+1}⁻,h⁻}`；
   一块 = 从 $h^+$ 到 $h^-$ 的三条长 3 内部不交路径（theta 图），9 条 link 边互异；
   块与块只在 $a,b,c$ 的带符号方向相交，跨块公共边只有 `{a⁻,b⁺},{b⁻,c⁺},{c⁻,a⁺}` 三条。
3. **回路的三类划分**（按"块内极大段"的段数 $k$）：
   - $k=2$：两次换块落在同两块交集 ⇒ 端点是唯一共享生成子的两个异号 ⇒ 块内距离 3 ⇒ 长 $\ge6$；
   - $k=3$：经过三块，在 $a,b,c$ 各一个带号方向换块；块内 $x_1,x_2$ 方向间：同号距离 $\ge2$，
     异号 $\ge3$，唯一例外 $x_1^-,x_2^+$ 相邻；三号全同 ⇒ $2+2+2=6$；否则循环序 $a,b,c,a$ 中恰有
     两次符号变化（$-\to+$ 与 $+\to-$），例外相邻至多被一条块路径使用 ⇒ $1+3+2=6$；
   - $k\ge4$：长 1 段必是那三条跨块公共边之一，每个共享方向至多关联一条 ⇒ 长 1 段不相邻 ⇒
     长 1 段数 $\le\lfloor k/2\rfloor$，其余 $\ge2$ ⇒ 总长 $\ge2k-\lfloor k/2\rfloor\ge6$（$k=4$ 时 $8-2=6$ ✓）。

(c) `[机械理由]`
- girth 6 是 `prop:sphere-counts` 里 $2E\ge6V$ 的**唯一来源**：不等式左边是"每个对偶顶点关联的
  link 闭路长度 $\ge6$"的直译。
  `[纠正]` 本笔记此前在此处写"$V-E+F=V-\frac{3F}2+\frac{2F}3=V-\frac{5F}6$"，把 $F=\frac23E$ 与
  $E=\frac32F$ 两个式子同时代入同一式，属**重复替换错误**；正确合并只保留一个：
  $3F=2E\Rightarrow E=\frac32F\Rightarrow V-E+F=V-\frac F2$。
  设 link girth $\ge m$（即 $2E\ge mV$），则
  \[
   V-E+F=V-\frac F2\le\frac{2E}{m}-\frac F2=\frac{3F}{m}-\frac F2=F\Bigl(\frac3m-\frac12\Bigr),
  \]
  右端 $\le0$ **当且仅当 $m\ge6$**。逐项：$m=6\to0$、$m=5\to+\frac{F}{10}$、$m=4\to+\frac F4$、
  $m=3\to+\frac F2$，后三者与 $V-E+F=2$ **不再矛盾**。
  ⇒ 结论与先前记载相反：$m=6$ 恰是这一 Euler 计数法的**临界值**，论文取 6 没有余量，
  girth 5 会直接使 `prop:sphere-counts` 的这条论证失效（论文逐字 "The first two imply
  $V-E+F\le0$, a contradiction"，`diagrams.tex:259–260`，用的正是 $m=6$ 的临界性）。
  `[推测]` 若要降到 girth 5，需另加输入（如对偶复形的额外面/顶点计数或边界类型有限性给的
  $V$ 上界），论文未提供此路线；证据来源：`diagrams.tex:240–260` 只有这三条关系。
- "including circuits formed by parallel edges"：把平行边构成的 2-环/1-环排除，否则 link 可能有 2 环，
  $2E\ge6V$ 崩塌（对偶顶点度数只算 2）。
- "Edges and triangles retain these identities"（胞腔带身份，即使顶点数据相同）：
  这是让"目标胞腔"可逐个计数（`prop:sphere-counts` 的"every individual target triangle $\tau$"）的前提。

(d) `[推测]` 失败路线：
1. 若 $\mathcal A$ 跨块共享生成子（例如令 $x_{ab}=x_{bc}$），块间交变多，$k=2$ 情形距离 3 不成立；
2. 若去掉 ℤ-化（$h$ 不赋 2），$g$、$gx_i$、$gh$ 可能重合 ⇒ 三角形有重边 ⇒ link 出现平行边/环；
3. `[推测]` Brady–McCammond 原文（`preprint Lemmas~2--3`）给出的是一般 $m,n,p$ 的角标复形，
   本篇只取 $m=n=p=3$；`[推测]` 作者先试图直接引用其非正曲率结论，但那需要整个 Artin 群而非 $T$，
   遂改为"we give direct proofs of the needed facts"（引言逐字）。证据来源：引言 126–130 行。
Lean 对应：`Winding.lean` 的 `LinkDirection`/`WireColor`（`:157 abbrev WireColor := L.CollapsedVertex × L.CollapsedVertex × LinkDirection`）
承载 link 方向；girth 论证的机器替身是 `TriangleMesh.lean:209 six_turns_injective`
（用 `rotate`/`turn` 两个置换的 6 次迭代注入性表达"六步不闭合"）与 `:235 degree_at_least_six`，
`:260 exists_link_backtrack`（无非回退 ⇒ 存在回退 ⇒ fold）——
**机器用 dart 置换代数代替了论文的 $k=2/3/\ge4$ 情形分析**（见 A-4）。

### A-2.20 约定 + 命题 5.3（`prop:sphere-counts`，`diagrams.tex` 129–263 行）：球面图示的符号计数恒为 0

(a) 原文逐字（combinatorial map 约定 + 陈述 + 方法归属）：

```tex
A combinatorial map to $\mathcal K$ will always include cell identities.
Each edge maps to a specified target edge, possibly with its
orientation reversed, or to a vertex.  Each triangle either maps
homeomorphically to a specified target triangle by its vertex
correspondence, or maps affinely into a specified target edge or
vertex.  These choices agree on common sides.  We call the latter
triangles collapsed.  Fix an orientation for every target triangle.
On an oriented source surface, a noncollapsed triangle has sign
$+1$ or $-1$ according to its map to that oriented target.

The proof below uses the classical diagrammatic-reducibility method of
deleting opposite faces and excluding a reduced spherical diagram by
curvature \cite[Definition~3.1 and Corollary~4.6]{Gersten1987}, here
keeping the identity of each target cell and allowing collapsed parameter
triangles.

\begin{proposition}\label{prop:sphere-counts}
For every combinatorial map from a finite triangulated oriented
two-sphere to $\mathcal K$, and every individual target triangle
$\tau$, the sum of the signs of all occurrences of $\tau$ is zero.
Collapsed triangles are allowed in the map and contribute zero.
\end{proposition}
```

(b) `[补]` 三段证明的中项：
1. **编码为三价图**：每个非塌缩源三角形画中心节点 + 三条腿到边中点；塌缩到边的三角形恰有两条非常数边，
   用一条弧连接它们的中点（两边映到同一带标号目标边）；塌缩到点的三角形不需弧。
   跨源边缝合 ⇒ 嵌入的三价图 + 可能无节点的闭曲线（丢弃）。节点记录一次目标三角形出现及其符号，
   图边配对"映到同一目标边的两条边"。
2. **细正则邻域 + 端点信息**：节点圆盘 + 边带；带两侧上"目标边端点的实际群标号"恒定
   （过边塌缩三角形在同一端点连接两侧；节点处夹住同一扇区的两条带侧携带该目标三角形对应角的标号）
   ⇒ 邻域的每条边界圆带**同一个**群顶点标号。对含节点的连通分支，逐边界圆加圆盘盖子并以该常数标号
   作对偶顶点 ⇒ 得到球面的带标号三角胞腔分解（节点↔面，图边↔边，边界圆↔顶点）。
   用到的平面拓扑事实（原文逐字）："a polygonal arc properly embedded in a disk cuts it into two disks"，
   做法：把连通平面图的生成树加厚成圆盘，其余边逐个作为带子加入，每条穿过一个互补圆盘并把它分成两个，
   最后剩余的边界圆加盖 ⇒ 球面；**顺带证明了该胞腔分解的 Euler 公式**（原文："This also proves the
   usual Euler formula for the resulting cell decomposition"）。
   标号规则排除的退化：图边不能连接同一节点的两条腿（腿代表不同目标边，带只有一个固定目标边）；
   一面两角不会成为同一对偶顶点（目标顶点标号互异）；**桥不存在**（桥的两侧带在同一条边界圆上，
   恒定性会令该目标边两端点相等，矛盾）；不同节点间的重边无害。
3. **折叠删除**：fold = 共边两面且跨同一目标边映到同一目标三角形 ⇒ 符号相反；
   取该边及两节点的小圆盘（切掉另四条腿的近节点部分），即使两节点间还有额外连接边，
   该"边 + 端点盘"仍是圆盘（额外边的中段在盘外）；若余下目标边记为 $i,j$，露出的腿的循环序为 $i,j,j,i$
   （容许反转与循环平移）⇒ 盘内 $i$ 连 $i$、$j$ 连 $j$ 不交叉地重连并删两节点；端点标号逐侧匹配
   ⇒ 保标号规则、平面性与每个目标的符号和；可能分离分支或产生无节点圆（丢弃），其余重新加盖。
4. **Euler 矛盾**：若仍有节点且无 fold，取一分支及其对偶球面分解；每个对偶顶点的依次角给出
   其实际目标顶点 link 里的一条闭路。若该闭路**回退**（backtrack），即共边两侧用了同一目标角，
   由 `eq:link-edges` 的精确角描述 ⇒ 两侧是同一个平移后的目标三角形 ⇒ 是 fold，矛盾；
   且必须是两个不同源面（一个面不会在同一对偶顶点用两个不同角，也不会用同一条带连自己两条边）
   ⇒ 无单面规避。于是所有 link 闭路非回退；有限非空闭非回退路含回路 ⇒ 引理 5.2 ⇒ 长 $\ge6$。
   以 $F,E,V$ 计（**按 incidence 计**，非单纯形）：$3F=2E,\,2E\ge6V,\,V-E+F=2$；前二式给 $V-E+F\le0$
   （$V\le E/3=F\cdot\frac{2}{9}\dots$ 精确：$E=\frac{3F}2,V\le\frac{2E}6=\frac F2$ ⇒ $V-E+F\le\frac F2-\frac{3F}2+F=0$ ✓），
   与 $=2$ 矛盾 ⇒ 每次都能删 fold，每次减 2 个节点 ⇒ 终止于无节点 ⇒ 所有符号和为 0。

(c) `[机械理由]`
- 为什么必须"individual target triangle"（逐个目标胞腔）而不是"总数"：`prop:triangle-obstruction` 的收束
  需要按 $\tau$ 分组求和（localization.tex 202–209 行 $\eta_\tau\times$(球内 $\tau$ 的带符号出现数)$=0$）。
- 为什么允许 collapsed 三角形：`lem:controlled-diagrams` 的构造**必然**产生塌缩片（常步 $1\in T$、
  扇形塌缩），若禁止塌缩则引理 5.4 无法产出合法图示。
- 为什么"incidences rather than distinct pairs of vertices are counted"：图示可能有重边/自环
  （上面"无害"的那条），按单纯形计会低估 $E$ 而使 Euler 不等式方向错。

(d) `[推测]` 失败路线：
1. 若 link girth 只保证 $\ge3$（例如三角块的边被识别成环），$V-E+F$ 可正 ⇒ 矛盾消失；
   `[分析]` 见 A-2.19(c) 的量化（已 `[纠正]`）：$V-E+F\le F(\frac3m-\frac12)$ 只在 $m\ge6$ 时非正
   ⇒ girth 5 亦崩溃，必需条件正是"$\ge6$"本身。
2. 若塌缩到边的三角形允许**三条**非常数边被识别，则节点弧的配对规则破坏 ⇒ 图不再三价；
3. `[推测]` Gersten 3.1/4.6 的原始形式不含"cell identity"与塌缩面，直接引用不成立；
   原文逐字"here keeping the identity of each target cell and allowing collapsed parameter triangles"
   ——该限定句即是"照抄失败后修补"的证据来源。
Lean 对应：`TriangleMesh.lean`（276 行）是**关键分歧点**：机器不构造正则邻域与平面加盖，而用
`structure TriangleMesh (F V)` + `Dart := F × Fin 3` + `mate/rotate/turn` 置换，
`:45 Exact`（`boundarySum.ker = coboundary.range`，`:150 exact_iff`）、
`:106 edge_card`（$2E=3F$）、`:111 coboundary`/`:124 boundarySum`（线性映射）、
`:180 exact_euler_inequality`（用 `finrank` 的有限维线性代数替代 Euler 计数）、
`:235 degree_at_least_six`。⇒ **平面拓扑被换成同调线性代数**（见 A-4）。
折叠删除的机器化在 `Folding.lean`（806 行：`foldPartner`、`splice`、`mesh`）+ `Wires.lean`（度 2 顶点压缩）。

### A-2.21 引理 5.4（`lem:controlled-diagrams`，`diagrams.tex` 275–428 行）：与 $f$ 无关的逐点图示控制

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:controlled-diagrams}
Suppose that $T$ acts geometrically on $Y$ and fix $y\in Y$.
There is a constant $C_1$, depending only on this action, $y$, and
the fixed presentation, with the following property.  Let $\Sigma$
be a triangulated parameter two-sphere, let $B$ be a subcomplex,
and let $f:\Sigma\to Y$ be continuous.  There is a refinement
keeping $B$ a subcomplex and a combinatorial map from the refined
sphere to $\mathcal K$ such that, for every final triangle $Q$,
every one of its group-vertex labels $s$, and every $p\in Q$,
\begin{equation}\label{eq:all-points-control}
  d_Y(sy,f(p))\le C_1.
\end{equation}
In particular $C_1$ is independent of $f$, its modulus of
continuity, and the number of triangles required.
\end{lemma}
```

(b) `[补]` 四段：
1. **一致边界类型**：取 $R$ 使每点距 $Ty$ 内 $R$（$Y=TK$ 时 $R=\max_{z\in K}d_Y(y,z)$）；
   由 (4.1) 取整数 $M$ 使 `eq:bounded-edge-word`：$d_Y(sy,ty)\le2R+1\Rightarrow d_T(s,t)\le M$；
   取 $D=\max\{d_Y(y,ay),d_Y(y,by),d_Y(y,cy)\}$。
   先一致细化（像直径 $\le1$，保持 $B$），顶点赋标号 $s_v$ 使 $d_Y(s_vy,f(v))\le R$；
   每条无向边选一条长 $\le M$ 的 Cayley 路径（反向用逆路径），**每端再各加三个常步** ⇒ 边长 $\le M+6$、
   每面边界为长 $\le3(M+6)$ 的带标号零环。相对原顶点标号只有**有限多种边界类型**
   （长度有界、字母取自 $\{a^{\pm1},b^{\pm1},c^{\pm1},1\}$）。
2. **填边界环**：保留选定原基点处的三个常步不动；忽略常步后的边界词在引理 5.1 的呈现中表示单位元
   ⇒ 落在关系子的正规闭包 ⇒ 有限次操作归约：自由插入/删除 $qq^{-1}$、插入/删除平移后的三角形关系环及其逆、
   常步移动；每个操作发生在**一个**目标边/三角形/顶点内；共轭 $wrw^{-1}$ 的实现 = 先经自由移动插入旅程 $ww^{-1}$，
   再在其尖端插入三角环 $r$。原文逐字："This proves the claimed finite reduction **without assuming a
   disk-diagram theorem**."所有操作都在保留的三常步之外 ⇒ 每个中间循环路径至少三条边。
3. **环带与扇形**：相邻两个循环实现为三角化环带的两条边界圆；不变边用"两端目标标号相同"的带，
   每带矩形剖成边塌缩或点塌缩三角形；非空替换弧之间是多边形，其顶点标号落在该操作使用的单个目标单形内。
   **空弧需要扇形而非顶点识别**（原文专段）：设一圆上弧 $p_0,\dots,p_k$ 在另一圆的 $q$ 处删除，
   区域含两条不同径向边 $qp_0,qp_k$ 与扇形三角 $qp_{j-1}p_j$；虽 $p_0,p_k,q$ 同群标号，
   $p_0,p_k$ 是**不同参数顶点**；$q$ 处前带、扇形、后带的 link 是一个区间 ⇒ 无捏合点；
   反转处理"在空弧插入"。保留的常步保证环带另一侧有非空不变部分。
   具体例（图 annulus.pdf）：五边循环（$xx^{-1}$ 往返 + 三条常步）删成三边循环，
   环带含两个塌缩到 $x$-边的扇形三角与三条不变带（六枚映到 $g$ 的三角形），内圆标签全为 $g$ 但仍是圆。
4. **逐点估计**：固定所有有限多个填充，归一化其原基点为 $1\in T$，令 $L$ 为其中出现过的标号的
   最大原字长 $d_T(1,s)$（私有生成子也是 $a,b,c$ 的字 ⇒ 有限；**与 $f$ 无关**）。
   以原顶点 $v_0$（标号 $s_0$）为基的平移填充里每个标号 $s$ 满足 $d_T(s_0,s)\le L$，于是
   ```tex
    d_Y(sy,f(p))
    \le d_Y(sy,s_0y)+d_Y(s_0y,f(v_0))+d_Y(f(v_0),f(p))
    \le DL+R+1.
   ```
   取 $C_1=DL+R+1$。

(c) `[机械理由]`
- $C_1=DL+R+1$ 的三项各管一段：$DL$ = 标号偏离（图论距离 × 生成子位移）、$R$ = 顶点级逼近误差、
  $+1$ = 像直径 $\le1$ 的细化保证。**关键**是"$p$ 是 $Q$ 内任意点"也仍 $\le C_1$：
  这来自"填充只依赖边界类型"这一有限性，而非 $f$ 的连续模。
- 为什么必须保留三个常步：环带构造要求"另一侧有非空不变部分"，且最终空循环可被锥形盖（三边常环）；
  若保留两个，删除操作可能把整条边界吃光 ⇒ 无法盖盘。
- 为什么 $L$ 与 $f$ 无关是命题的全部难点：若允许按 $f$ 选填充，$C_1$ 会随 $f$ 的连续模增长，
  `lem:localized-degree` 的 $2C_1$ vs $\delta n$ 比较失效（$\delta n$ 必须压过 $C_1$）。
- $M+6$、$3(M+6)$：$+6$ = 两端各三个常步；$3\times$ = 三角形三条边。

(d) `[推测]` 失败路线：
1. 若不使用"边界类型有限 + 每类型固定一个填充"，$C_1$ 依赖 $f$ ⇒ §6 的局部性失效；
   `[推测]` 这正是原文专门写"In particular $C_1$ is independent of $f$, its modulus of continuity,
   and the number of triangles required"的原因（预防性声明）。
2. 若把空弧的扇形写成"参数顶点识别"，会得到带捏合点的参数空间（不是流形）⇒ 绕数论证的
   "三角剖分球面"前提破坏；证据来源：原文"For precision, an empty arc requires a fan, not an
   identification of parameter vertices."——"For precision"是明显的修补语气。
3. `[推测]` 若直接引标准的"零伦曲线可被少面圆盘填充"（disk diagram theorem），
   会引入额外假设（图示单纯性/无塌缩）；原文逐字声明不用之（第 2 步末）。
Lean 对应：`WordDiagram.lean`（1088 行，全目录最大模块：字/边界类型/填充/常步）、
`Grid.lean`（`GridDisk.Vertex n (AngularSize n)`、`boundary_iff`、`sum_index_boundary`）、
`Refinement.lean`（细化保持子复形）、`Detour.lean:316` 的 `22+4*C+4*E`（机器版 $C_1$，
其中 $E$ 是边界类型枚举带来的附加项，论文未出现；见 A-4/A-5）。

### A-2.22 §6 补丁坐标 + 引理 6.1（`lem:projected-approximation`，`localization.tex` 3–107 行）：$q_n\to\kappa$

(a) 原文逐字（组合计划 + 补丁 + 投影 $J$ + 陈述）：

```tex
Projected mirror coordinates of its group-labelled vertices, extended
affinely over parameter triangles, will define a planar map
$q_n:\Sigma\to\mathbb R^2$ that approximates coordinates on a small
patch and has nonzero local winding.  Separation in $Y$ will force every
occurrence of a contributing target triangle into the patch, making that
winding a weighted sum of whole-sphere signed counts, which
Proposition~\ref{prop:sphere-counts} makes zero.
```

```tex
 B=[\lambda_0,\lambda_1]\times[\mu_0,\mu_1]
\]
in the interior of this sector, with \(\lambda_0,\mu_0>0\), and so small
and close to the origin that all its radii satisfy
\begin{equation}\label{eq:small-patch}
 0<r(p)<\min(\epsilon/3,1/4)\qquad(p\in B).
\end{equation}
```

```tex
\begin{equation}\label{eq:coordinate-projection}
 J\xi=\left(\frac{\xi_{D_u}-\xi_{D_{uv}}}{2},
                 \frac{\xi_{D_{uv}}}{2}\right).
\end{equation}
By \eqref{eq:mirror-translations},
\begin{equation}\label{eq:projection-identity}
 Jv_*(p)=\kappa(p)
\end{equation}
throughout the chosen sector.  This is a coordinate projection on that
sector; no global injectivity of \(J\) is asserted.

\begin{lemma}\label{lem:projected-approximation}
On \(B\), the maps \(q_n\) converge uniformly to \(\kappa\).
\end{lemma}
```

(b) `[补]` 中项：
1. **显式三角剖分**（原文提供具体做法而非存在性）：每个扇区取"两外顶点在该扇区边界射线上、半径 1"的三角形，
   六个三角拼成多边形锥盘 $Q$；沿径向线，其外半径 $\rho\ge\cos(\theta/2)>\sqrt3/2$
   `[分析]` 理由：半径 1 的扇区的两条边中点距圆心 $\cos(\theta/2)$，六块外接多边形至少覆盖到该半径；
   用固定 $Q$ 的径向同胚把 $Q$ 映到 $P$：半径 $\le1/2$ 处不动、$1/2$ 到 $\rho$ 线性、$\rho\mapsto1$；
   公共射线上这些映射相容；矩形 $B$ 逐点固定，其四边在该三角形内延长把三角形分成有限多个凸多边形，
   逐块三角化，另一盘把边界细分锥到新参数顶点。
2. **$J$ 的恒等式验证**：$v_*(\lambda,\mu)=\lambda L_u+\mu L_{uv}
   =\lambda\cdot2e_{D_u}+\mu\cdot2(e_{D_u}+e_{D_v}+e_{D_{uv}})$ ⇒
   $\xi_{D_u}=2(\lambda+\mu)$、$\xi_{D_{uv}}=2\mu$ ⇒ $J\xi=((2\lambda+2\mu-2\mu)/2,\,2\mu/2)=(\lambda,\mu)=\kappa$ ✓。
3. **$q_n$**：顶点标号 $s$ 赋平面值 $JV(s)/n$，在每个抽象三角形上仿射延拓。
4. **一致收敛链**：$d_Y(sy,t_n(p)y)\le C_1+C_0$（(5.2)+(4.5)）⇒ 经 (4.1)+(4.2) 得
   $\|V(s)-V(t_n(p))\|_1\le C_2$（$C_2$ 与 $n,p,s$ 无关）；
   由 (4.7) 第二式误差实为 $O(1/n)$ ⇒ $\|V(s)/n-v_*(p)\|_1=O(1/n)$ 一致；
   作用 $J$ 并用 `eq:projection-identity`；$q_n(p)$ 是这些顶点值的**凸组合** ⇒ 同样误差界。
   原文逐字强调："This is precisely where the all-points form of \eqref{eq:local-all-points} is used."

(c) `[机械理由]`
- $\epsilon/3$ 与 $1/4$：$\epsilon/3$ 给 `lem:localized-degree` 留三分之一的余量
  （$B'$ 上距 $y$ 至多 $(\epsilon/3)n+o(n)$，而盖帽上至少 $\epsilon n$，差 $2\epsilon n/3$）；
  $1/4$ 保证 $B\subset\{r<1/4\}$ 远离锥点，使 $v_*$ 在该处注入且扇区坐标唯一。
- $J$ 是**有界线性**（只依赖两个坐标）⇒ 保 $O(1/n)$；原文专写"no global injectivity of $J$ is asserted"
  ——这是"论文未述"的一条：$J$ 在整个 $E$ 上远非单射。
- 仿射延拓只在**抽象三角形坐标**下成立（"Affineness refers to the abstract triangle coordinates,
  regardless of the homeomorphisms used to place the triangles"）：因为 5.4 的填充把面与抽象盘同胚粘合，
  同胚不必仿射。

(d) `[推测]` 失败路线：
1. 若 $C_1$ 依赖 $f$（见 A-2.21），$C_2$ 无界 ⇒ $q_n$ 不收敛到 $\kappa$；
2. 若 $B$ 含锥点（$\lambda_0=\mu_0=0$），$\kappa$ 不连续 ⇒ 绕数无定义；$\lambda_0,\mu_0>0$ 是为此；
3. `[推测]` 若用全局坐标（例如 $E$ 的某个有限子空间上的同构投影）替代 $J$，会需要 $v_*$ 的全局仿射嵌入，
   而六扇区只给出**分片**线性 ⇒ `[推测]` 作者因此改成"逐扇区投影 + 补丁内成立"；
   证据来源：原文"That is a coordinate projection on that sector; no global injectivity…"。
Lean 对应：`SectorMetric.lean`（476 行：扇区的复嵌入 `:10 (p.1 + c*p.2) + (Real.sqrt (1-c^2)*p.2)*I`
与 `:118 2*Real.sqrt (1+r^2-2*c*r)+r < 2`——即 $\rho>\cos(\theta/2)$ 型半径界的机器形式）、
`GridDisk`/`Replacement`（网格与替换）、`Winding.lean`（$q_n$ 的标号与绕数）。

### A-2.23 绕数段 + 引理 6.2（`lem:localized-degree`，`localization.tex` 109–214 行）：局部度与命题 4.1 收束

(a) 原文逐字（绕数初等计数段 + 两条性质 + 陈述）：

```tex
For completeness, we spell out the elementary planar count we use.
For a loop avoiding a point $w$, choose continuous local arguments
of its vectors from $w$ on successive short parameter intervals.
Matching the arguments at their common endpoints gives a total angle
change in $2\pi\mathbb Z$.  Its quotient by $2\pi$ is the winding
number.  It is unchanged under a homotopy avoiding $w$: local angle
choices vary continuously, and a continuous integer-valued function is
constant.
```

```tex
\begin{enumerate}
\item the straight-line homotopy from $q_n|_{\partial B}$ to
      $\kappa|_{\partial B}$ avoids $w$;
\item every $p\in B$ with $q_n(p)=w$ lies in
      $\operatorname{int}B'$.
\end{enumerate}
Indeed, take the approximation error and the radius of $W$ smaller
than half the positive distance from $\kappa(p_*)$ to
$\kappa(B\setminus\operatorname{int}B')$.
For each large $n$, choose $w\in W$ avoiding every projected edge
of the entire finite sphere diagram.  A finite union of line segments
cannot contain an open ball, so this choice is possible.
```

```tex
\begin{lemma}\label{lem:localized-degree}
For all sufficiently large $n$, every occurrence in the sphere
diagram of a target triangle contributing to the winding count on
$B$ lies entirely in $\operatorname{int}B$.
\end{lemma}
```

(b) `[补]` 四段：
1. **面内求和公式**：有限定向三角盘仿射映到平面，$w$ 避开所有投影边；把各三角形边界的绕数相加，
   内边出现两次且方向相反 ⇒ 角度增量相消 ⇒ 和 = 外边界绕数。单个仿射三角形：$w$ 在其凸包外 ⇒ 贡献 0
   （可在凸包内收缩）；$w$ 在内部 ⇒ 贡献其定向符号（自 $w$ 的射线交边界一次、方向转一整圈）；
   退化三角形贡献 0（$w$ 避开其投影边）。
2. **$w$ 的选取**：$\overline W\subset\kappa(\operatorname{int}B')$；取误差与 $W$ 半径小于
   $\mathrm{dist}(\kappa(p_*),\kappa(B\setminus\operatorname{int}B'))$ 的一半 ⇒ (i)(ii)；
   再在每个大 $n$ 选 $w\in W$ 避开**整个球面图示**的有限多条投影边（"有限多个线段不能包含开球"）。
3. **非零局部绕数**：矩形 $\kappa(\partial B)$ 定向后绕 $w$ 的绕数为 $\pm1$ ⇒ $B$ 内三角形对 $w$ 的
   带符号覆盖数之和非零；每个贡献三角形非塌缩、像非退化，并含 $B'$ 中一个投到 $w$ 的参数点。
4. **局部性（引理 6.2 证明）**：由 (4.8) $B'$ 与 $P\setminus\operatorname{int}B$ 的 $f_n$ 像分离 $\ge\delta n$；
   第二盘上距 $y\ge\epsilon n$，$B'$ 上距 $y\le(\epsilon/3)n+o(n)$ ⇒ $B'$ 与球面其余部分互距 $\to\infty$ 一致。
   设贡献目标三角形 $\tau$ 的某次出现含 $p\in B'$ 使 $q_n(p)=w$；固定 $\tau$ 的三个群顶点标号之一 $s$，
   $\tau$ 的**每次**出现都带同一标号 $s$（含完整平移信息）；若某次出现碰到 $\operatorname{int}B$ 之外，取
   $p'$ 在该交集中，则 (6.1) 给 $d_Y(f_n(p),f_n(p'))\le d_Y(f_n(p),sy)+d_Y(sy,f_n(p'))\le 2C_1$，
   与 $\delta n$ 分离矛盾（也排除碰到 $\partial B$ 的出现）。
5. **命题 4.1 收束**：定向所有带标号目标三角形一次固定；其三个群顶点有固定的投影值 $JV(s)/n$ ⇒
   仿射平面像固定 ⇒ 若覆盖 $w$，其行列式有固定非零符号 $\eta_\tau\in\{1,-1\}$；
   某次出现的覆盖符号 $=\eta_\tau\times$（该出现相对所选定向的定向符号）。按 $\tau$ 分组，
   由引理 6.2 每个此类 $\tau$ 的**全部**出现都在 $B$ 内 ⇒ 其总贡献
   $=\eta_\tau\times$(球内 $\tau$ 的带符号出现数)$=0$（命题 5.3）⇒ 总和为 0，与绕数 $\pm1$ 矛盾；
   "Distinct target cells remain separate in this sum even if their projected vertex data agree"
   （胞腔身份在求和里保持——回指 A-2.19 的 identity 约定）。

(c) `[机械理由]`
- $2C_1$ vs $\delta n$：**这是全篇唯一把"与 $f$ 无关的常数"与"随 $n$ 线性增长的分离"直接对撞的地方**；
  若 $C_1$ 是 $O(n)$（例如来自 $f$ 的连续模），矛盾消失。
- 为什么用"$\tau$ 的所有出现共享同一顶点标号 $s$"：$\tau$ 是**带身份**的目标胞腔，其顶点对应
  $g,gx_i,gh$ 的固定平移 ⇒ 标号携带完整群元素，故一次出现即可锚定 $s$；若 $\tau$ 只记"形状"不记身份，
  这一步失效（命题 5.3 也必须按身份分组）。
- $\epsilon/3$ 的三倍分配：盖帽 $\epsilon n$、$B'$ $(\epsilon/3)n$、剩余 $2\epsilon n/3$ 留给 $o(n)$ 与图示误差。

(d) `[推测]` 失败路线：
1. 若 $W$ 选得太大（超出 $\kappa(\operatorname{int}B')$），(ii) 失效 ⇒ 贡献三角形可能落在 $B\setminus B'$，
   局部性论证仍可但 $\pm1$ 绕数不再保证由 $B'$ 内点产生；
2. 若 $q_n$ 的像**经过** $w$ 的边无法避开（无限多条），选 $w$ 失败——原文靠"整个图示有限"
   （命题 5.3 的有限性 + 每 $n$ 单独选 $w$）；`[推测]` 若试图对**所有** $n$ 统一选 $w$，
   会遇到可数多条线段（仍不能含开球，故其实可行）——但原文按 $n$ 分别选，说明作者谨慎回避了统一性；
3. `[推测]` 绕数替代方案是度理论/mod 2 计数；原文选整数带符号版是为了与 $\eta_\tau$ 的符号分配相容。
Lean 对应：`Winding.lean`（725 行）：`:9 passIndex`（弧/pass 的三值指标）、`:62 SimplicialLabeling`、
`:78/:79/:80 Active/Full/FullFace`（区分退化与完整面）、`:83 wire`、`:105 fullDartEquiv`、
`:114 ZeroEdge`/`:116 CollapsedVertex := Quot L.ZeroEdge`/`:135 collapsedLabel`
（把塌缩边商掉后仍保持标号）、`:447` 处 `Classical.choose`（选 $w$ 的机器化：绕数目标点的存在）。
`Detour.lean:286/:295` 处 `∑ j : Fin (AngularSize n), edge … = …` 与 `∑ f, face … = 1`
即"边界和 = 1"的机器形式，`GridDisk.sum_index_boundary` 承担内边相消。
命题 4.1 的机器出口：`SixSector.no_strict_ratios`（在 `Main.lean` 中被 `apply` 的那一条）。

### A-2.24 定义 7.1（`def:matrix`，`assembly.tex` 4–47 行）：116 生成子矩阵 $M$ 与 $G_0$

(a) 原文逐字：

```tex
We now combine the length restriction of Proposition~\ref{prop:braid-angle}
with the obstruction of Proposition~\ref{prop:triangle-obstruction}.
The additional generators in the following matrix make the group $T$ a
common centralizer.  This will produce a geometric action of $T$ from
any hypothetical geometric action of the full group.

\begin{definition}\label{def:matrix}
Let $\mathcal E=\{(a,b),(b,c),(c,a)\}$, as before, and set
\[
 S=\{a,b,c,d,e\}\ \sqcup
   \{s_j^{uv}:(u,v)\in\mathcal E,\ 3\le j\le39\}.
\]
All symbols in the second set are distinct.  For each $(u,v)\in\mathcal E$,
also write $s_1^{uv}=u$ and $s_2^{uv}=v$; these are aliases for existing
elements of $S$.  Define a symmetric matrix $M=(m_{st})_{s,t\in S}$ by
the following prescriptions:
\begin{enumerate}
\item $m_{ss}=1$ for every $s\in S$, and
      $m_{ab}=m_{bc}=m_{ca}=3$.
\item In each block $\{s_1^{uv},\ldots,s_{39}^{uv}\}$, set
      \[
      m_{s_i^{uv},s_j^{uv}}=
      \begin{cases}
      3,&|i-j|=1,\\
      2,&|i-j|\ge2.
      \end{cases}
      \]
\item For $q\in\{d,e\}$ and $u\in\{a,b,c\}$, set $m_{qu}=2$.
\item Every remaining off-diagonal entry is $\infty$.
\end{enumerate}
Let $G=A_M$ be the resulting Artin group, with the generators denoted
by the elements of $S$ themselves.  Let $G_0$ be the group presented
by the generators $S\setminus\{d,e\}$ and all their prescribed relations.
\end{definition}

Two distinct blocks meet in just one generator, so their prescriptions
do not conflict.  Each pair among $a,b,c$ is the initial pair of exactly
one block, with label $3$ in both prescriptions.  Thus the definition
specifies exactly one matrix, on
\[
 |S|=5+3\cdot37=116
\]
generators.  In particular $m_{de}=\infty$, and neither $d$ nor $e$
has a finite label with any of the private block generators.
```

(b) `[补]` 逐字清点：第二集合有 $3\times37=111$ 个符号（每块 $j=3,\dots,39$），加 $\{a,b,c,d,e\}$ 共 116；
块内标签：$|i-j|=1\Rightarrow3$（相邻三辫）、$|i-j|\ge2\Rightarrow2$（交换）⇒ 每块是型 $A_{39}$（$B_{40}$）Artin 群；
每块的 $s_1^{uv}=u,s_2^{uv}=v$ 是**别名**，故"块与 $T$ 共享前两个标准生成子"在矩阵层面表现为
$m_{uv}=3$ 与第 2 条 $i=1,j=2$ 的赋值**重合**（原文明说"with label 3 in both prescriptions"）⇒ 良定义。
两不同块只共享**一个**生成子（例如 $s_j^{ab}$ 与 $s_k^{bc}$ 只可能都是 $b$）⇒ 无冲突。
第 4 条"remaining"覆盖：$d$–$e$（$\infty$）、$d,e$ 与块内私有字母（$\infty$）、非相邻跨块私有字母（$\infty$）。

(c) `[机械理由]`
- **$m_{qu}=2$（$q\in\{d,e\}$，$u\in\{a,b,c\}$）**：给出 $d,e\in C_G(a)\cap C_G(b)\cap C_G(c)=C_G(T)$；
  `[分析]` $T$ 由 $a,b,c$ 生成，故与三者都交换即与 $T$ 交换。
- **$m_{de}=\infty$**：$d,e$ 之间无关系 ⇒ $B=T\times F(d,e)$ 里的 $F(d,e)$ 真是秩 2 自由群，
  `lem:common-centralizer` 第 2 步"约化字 $f$ 与 $d$ 交换 ⇒ $f=d^q$；再与 $e$ 交换 ⇒ $f=1$"才能用自由群约化字论证。
  若 $m_{de}=2$，$F(d,e)\to\mathbb Z\times\mathbb Z$，中央子群会变大，等式 $C_G(d)\cap C_G(e)=T$ 破坏。
- **"neither $d$ nor $e$ has a finite label with any private block generator"**：这是引理 7.3 证明里
  "$bdb^{-1}\in B\setminus T$"与"$gdg^{-1}\notin B$"用到的一般位置条件——块字母在 $B$ 中没有代表，
  故带 $G_0\setminus T$ 因子的交替字不可能等于 $d$。
- $G_0$ 单独定义（去掉 $d,e$）是为了让 (7.1) 的迭代 amalgam 与 (7.2) 的最后一步 $G\cong G_0*_T(T\times F(d,e))$ 分开陈述。

(d) `[推测]` 失败路线：
1. 若把 3 个块减到 2 个：$|S|=5+2\cdot37=79$，$T$ 只剩两对辫子 ⇒ 四扇区不闭合（A-2.12 已述）；
2. 若某块标签由 $B_{40}$ 改成广义（例如混入 $\infty$），`prop:braid-angle` 的 $B_{40}$ 关系前提失效；
3. `[分析]` 若 $d,e$ 与块内字母设 2（交换），$C_G(d)\cap C_G(e)$ 会包含块的部分中心 ⇒ 中央子群超出 $T$，
   引理 7.4 的 $Y$ 上 $T$-作用不再由"$C$ 不变 + cocompact"给出（$C$ 更大反而仍几何，但比值传递会失效，
   因为需要的是 $T$ 而非更大群上的**六扇区**结构）。
Lean 对应：`Model.lean` 的 `noncomputable def explicitMatrix`：
`if s=t then 1 else if Adjacent s t then 3 else if Distant s t ∨ Sentinel s t then 2 else ⊤`，
谓词 `Adjacent`/`Distant`（`Fin 39` 索引偏移 $\pm1$ / $\ge2$）、`Sentinel`（`s.val=3∨4 ∧ t.val<3`）；
`Letters := Fin 116`、`Label := WithTop ℕ`、`blockLetter b i` 把 $s_j^{uv}$ 编成
$5+37b+(j-2)$。第 4 条"remaining $=\infty$"在机器里就是 `else ⊤` 分支 ⇒ **四条 enumerate 与四个 if 分支一一对应**，
无遗漏（可判定性来自 `Fin` 上的 `decide`）。

### A-2.25 引理 7.2（`lem:pair-embeddings`，`assembly.tex` 51–134 行）：$B_3$ 嵌入与 token 状态不变量

(a) 原文逐字（陈述 + 关键的自我限定句）：

```tex
\begin{lemma}\label{lem:pair-embeddings}
For every $(u,v)\in\mathcal E$, the homomorphism
\[
 B_3=\langle t_1,t_2\mid t_1t_2t_1=t_2t_1t_2\rangle
 \longrightarrow T,
 \qquad t_1\longmapsto u,\quad t_2\longmapsto v,
\]
is injective.  For every $l\ge3$, the homomorphism $B_3\to B_l$
given by $t_1\mapsto s_1$ and $t_2\mapsto s_2$ is also injective.
\end{lemma}
```

证明末句逐字（防御性声明，务必收录）："The construction asserts a state invariant; it does not assert that
discarding the other tokens gives a homomorphism $B_l\to B_3$."
以及方法声明逐字："For the second assertion we construct a word invariant, retaining
the entire permutation of the strands as part of its state."

(b) `[补]` 两条注入性：
1. **$B_3\hookrightarrow T$**：设 $w$ 为 $\{a,b,c\}$ 中剩余者；$u\mapsto t_1,v\mapsto t_2,w\mapsto t_1$
   定义 $T\to B_3$（三关系分别成为：$uv$ 的辫子关系 = 定义关系；$vw$ 的 = 该关系两侧互换；
   $wu$ 的 = $t_1^3=t_1^3$ 平凡）⇒ 与所证包含的复合是 $B_3$ 的恒等 ⇒ 包含单射。`[补]`
   这是**收缩（retraction）论证**，不需正规形。
2. **$B_3\hookrightarrow B_l$（token 状态不变量）**：状态 = $l$ 个 token（名为 $1,\dots,l$）的全序表 +
   $q\in B_3$；token $1,2,3$ 为"selected"。读带号字母 $s_i^{\varepsilon}$：
   (i) **无论符号**交换位置 $i,i+1$ 的两个 token；(ii) 若两者都 selected，它们在 selected 短表中相邻，
   设占第 $j,j+1$ 位（$j\in\{1,2\}$，**在交换前计算**），则 $q\mapsto qt_j^{\varepsilon}$；
   (iii) 至多一个 selected ⇒ $q$ 不变。
   验证是**对所有状态的变换**而非只对初态：$s_i^{-1}$ 是 $s_i$ 的逆变换（第二次交换还原全表；
   若记录了字母，其 selected-表指标仍是 $j$ ⇒ 两字母相消）；
   $|i-k|\ge2$ 时两次交换涉及不相交位置对、终表相同；三个 selected token 中**至多一对**由两个 selected 组成
   ⇒ 另一对的交换不改变被记录对的 selected-指标（selected 越过 unselected 不改变 selected 表顺序）
   ⇒ 正交换关系保持；
   正辫子关系：记位置 $i,i+1,i+2$ 上的 token 为 $A,B,C$，$s_is_{i+1}s_i$ 依次交换 $(A,B),(A,C),(B,C)$，
   $s_{i+1}s_is_{i+1}$ 反序交换；两者终态都是 $C,B,A$ 且固定其余位置；
   按 $A,B,C$ 中 selected 的个数分 0/1、2、3 三种情形：前两种不记录或记录同一跨越同指标 ⇒ 相等；
   三种时记录分别为 $t_1t_2t_1$ 与 $t_2t_1t_2$ ⇒ 在 $B_3$ 中相等。
   ⇒ 所有正关系成立 ⇒ 经"每个定义关系子（及其逆、共轭）平凡 + 自由相消平凡" = **正规闭包刻画**，
   任意带号字等式被尊重；验证适用于任意带号前缀，且终表相同保证后缀处理一致。
3. **注入性收尾**：初态 $(1,\dots,l),q=1$；只用 $s_1^{\pm1},s_2^{\pm1}$ 的字始终在前三个 token 间交换，
   其记录 = 把 $s_i$ 换成 $t_i$ 的同一字（含符号）；字在 $B_l$ 中平凡 ⇒ 状态变换固定初态 ⇒ 记录在 $B_3$ 中平凡。

(c) `[机械理由]`
- 为什么要"retaining the entire permutation as part of its state"：若只记 selected 三元组的相对顺序，
  unselected token 的移动会改变 selected 表的指标 $j$（$s_3$ 型交换会把 $s_2$ 的 selected-位置推动），
  正交换关系的验证就失败；保留全表 ⇒ "至多一对双 selected"这一关键论断成立。
- "$j$ is computed before the swap"：否则 $s_1s_2s_1$ 与 $s_2s_1s_2$ 的记录序列在同一状态下可能不同序。
- "not merely of the initial state"：注入性论证要求关系作为**变换**相等（从而任意前缀后仍成立），
  只在初态验证只能得到"关系子固定初态"，不足以传递到任意字。
- 该引理的两个结论各自被下游使用：第一条给 $B_3^{uv}\hookrightarrow T$（amalgam 的公共子群嵌入），
  第二条给 $B_3^{uv}\hookrightarrow B_{40}^{uv}$（同一子群在块内嵌入）⇒ `lem:amalgam-normal-form` 的前提。

(d) `[推测]` 失败路线：
1. 若把 selected 集合扩到 4 个 token（`SelectedPositions` 在机器里允许 `card ≤ 3`，见下），
   "至多一对双 selected"不再成立 ⇒ 正交换关系的记录序可能不同；
   `[分析]` 机器取 `card ≤ 3` 恰好对应论文的"3 个 selected token"；
2. `[推测]` 若不保留全排列而用 Artin 群已知的 $B_3\hookrightarrow B_l$（如通过 Garside 正规形/cremona），
   会引入远超本文需要的理论；原文选择初等状态不变量，且**明确否认**更强的同态断言（末句）；
3. 若第一条的收缩 $T\to B_3$ 把 $w$ 映到 $t_2$ 而非 $t_1$，$wu$ 关系变成 $t_2t_1t_2=t_1t_2t_1$
   （仍成立）但 $uv$、$vw$ 关系中之一变成 $t_1^3=t_1^3$——同样可用；`[分析]` 三种指派都行，原文取一种。
Lean 对应：`Braids.lean:462 abbrev SelectedPositions := {s : Finset ℕ // s.card ≤ 3}`、
`:464 swapPositions`、`:479 selectedPrefix`（= "交换前的 selected-指标 $j$"）、
`:525 selected_not_four`、`:573 swapPositions_braid`、`:591 tokenRecord`、`:600 TokenState`、
`:602 tokenPerm`、`:610/:623 tokenPerm_distant/braid`；
`Presentation.lean:86 braidTokenRepresentation`（`BraidGroup n →* Equiv.Perm (TokenState (BraidGroup 2))`）、
`:119 braidTokenRepresentation_two_injective`、`:125 initialBraidInclusion`、
`:130 initialBraidInclusion_injective`（第二条注入性）；
`:170 trianglePair`、`:178 trianglePairRetraction`、`:184 trianglePair_leftInverse`、
`:191 trianglePair_injective`（第一条注入性 = 收缩复合恒等的机器形式）。

### A-2.26 引理 7.3（`lem:amalgam-normal-form`）+ (7.1)(7.2)（`assembly.tex` 136–239 行）：Amalgam 正规形与迭代分解

(a) 原文逐字（方法归属 + 陈述 + 两个同构式）：

```tex
We use the standard normal-form theorem for free products with
amalgamation; see Serre \cite[Chapter~I, \S1.2, Theorems~1--2]{Serre1980}.
The elementary proof below records the exact form needed here, including
the case in which multiplication removes the final representative.

\begin{lemma}\label{lem:amalgam-normal-form}
Let $H_1,H_2$ be groups with a common embedded subgroup $E$, and
let $H_1*_E H_2$ be the group obtained by identifying the two copies
of $E$ in their free product.  Each factor embeds in this group,
and their intersection is $E$.  A product $a_1\cdots a_n$, $n\ge1$,
whose factors belong alternately to $H_1\setminus E$ and
$H_2\setminus E$ is nontrivial.  If such a product contains a
factor from $H_i\setminus E$, it does not belong to the other factor.
\end{lemma}
```

```tex
\begin{equation}\label{eq:iterated-amalgam}
 G_0\cong
 \bigl((T*_{B_3^{ab}}B_{40}^{ab})
       *_{B_3^{bc}}B_{40}^{bc}\bigr)
       *_{B_3^{ca}}B_{40}^{ca}.
\end{equation}
```

```tex
\begin{equation}\label{eq:full-amalgam}
 G\cong G_0*_T B
       =G_0*_T\bigl(T\times F(d,e)\bigr).
\end{equation}
```

(b) `[补]` 证明是**状态机式**的（154–205 行），逐段：
1. 取右陪集代表集 $R_i\subset H_i$：每个 $H_i$ 元素唯一写成 $re$（$r\in R_i,e\in E$），$1$ 代表 $E$。
   形式状态 $(r_1,\dots,r_n;e)$，$n\ge0$，$r_j\ne1$ 且类型交替，代表元**保留类型**。
2. 定义"用 $h\in H_i$ 右乘状态"：末位类型为 $i$ 时把尾部 $re$ 与该代表元一起提出；否则用缺省代表元 $r=1$。
   前缀 $P$ 为空或以另一因子结尾。把 $reh\in H_i$ 唯一分解为 $r'e'$，用 $r';e'$ 替换尾部（$r'=1$ 时省略）。
3. **右作用验证**（原文的微妙处）：乘 $h$ 后前缀 $P$ 不变；再乘 $k\in H_i$ 时尾部从 $r'e'k=(reh)k$ 重写；
   若 $r'=1$ 被省略，规则改用缺省 $1$ 并重写 $e'k$，结果相同 ⇒ 结合性给出 $hk$ 的操作；
   乘 $1$ 恒等、乘 $h^{-1}$ 是逆。
4. $h\in E$ 时两因子的作用都只改末端的 $e\to eh$ ⇒ 两作用在 $E$ 上一致 ⇒ 得到所呈现 amalgam 的右作用。
5. 每个状态由 $(\,;1)$ 读字 $r_1\cdots r_ne$ 达到；反之对任意字跑算法只用 amalgam 中的合法等式，
   产出该形字；若两个状态字在 amalgam 中相等，则它们在 $(\,;1)$ 上的作用相同 ⇒ 存在性与唯一性；
   由此因子嵌入与交集为 $E$。
6. 交替积 $a_1\cdots a_n$（$a_j\notin E$）：每步"末端 $E$-元素 × $a_j$"仍在 $E$ 外，且类型与前一位不同
   ⇒ 恰好追加一个新非恒等代表元 ⇒ 正规形恰有 $n$ 个代表元 ⇒ 非平凡，且不属任何类型缺少这些代表的因子。
7. (7.1)：反复用 7.3（每步 $T$ 保持嵌入 ⇒ 下一个附着子群也嵌入）；"presentations agree"逐字：
   识别每块前两个生成子为该块指定的 $T$ 中一对，恰剩定义 $G_0$ 的生成子与关系。
8. (7.2)：$B=T\times F(d,e)$ 有 $T$ 的呈现 + 两个自由生成子 + $\{d,e\}$ 与 $\{a,b,c\}$ 的**六条**交换关系；
   原文逐字验证："the commutations move every $T$-letter to the left of every free letter;
   the evident homomorphism to the direct product and the two commuting factor homomorphisms are
   inverse on the generators." 与定义 7.1 比较 ⇒ $G\cong G_0*_TB$。

(c) `[机械理由]`
- 为什么"including the case in which multiplication removes the final representative"被专门写进方法说明：
  第 3 步的 $r'=1$ 省略分支是状态机能否成为**作用**的唯一障碍；多数教科书陈述只给"约化字唯一"，
  省略该分支会让"结合性"证明留下漏洞。
- 第 6 步"恰追加一个"依赖 $E$ 在 $H_i$ 中的**右陪集**分解（不是双侧）：正因如此
  `lem:common-centralizer` 才能把 $g$ 写成 $g=wb$ 并把末尾 $T$-元素吸进 $b$。
- (7.1) 的**左折叠**括号顺序 $(\cdots)*_{B_3^{ca}}$：三块依次附着 ⇒ 每步公共子群是某 $B_3^{uv}$，
  其嵌入由 A-2.25 双向提供。

(d) `[推测]` 失败路线：
1. 若三块共享的不再是 $B_3$（型 $A_2$）而是更大子群（如 $B_4$），两块的关系会互相污染，
   "presentations agree"失效；
2. 若 $d,e$ 与 $a,b,c$ 的六条交换关系少写一条，(7.2) 的 $B$ 不再是直积 ⇒ $F(d,e)$ 的约化字论证失效；
3. `[推测]` 原文自证 Serre 定理（而非引用）的动机是"records the exact form needed"——
   机器化需要可计算的正规形算法；证据来源：136–141 行的逐字声明。
Lean 对应：**机器不重证 Serre**，而是使用 Mathlib 的 `Monoid.PushoutI`/`NormalWord`/`Transversal`：
`Embeddings.lean:7 open Monoid Monoid.CoprodI Monoid.PushoutI Monoid.PushoutI.NormalWord`，
`:31/:40/:57/:103 normal_reduced/:114` 等引理直接在 `NormalWord d` 上工作
（`:103 lemma normal_reduced (d : Transversal φ) (w : NormalWord d) : Reduced φ w.toWord`）。
分步 amalgam 对象 `A₁,A₂,A₃` 与 `back₁,back₂,back₃`（`:584/:589/:598`）、`fromModel/back₃`（`:612`）、
`productMain`（`:576`，用 `noncommCoprod` 造 $T\times F(d,e)\to B$）、
`toModel_injective`（`:656`）与 `main_common_centralizer`（`:671`，即引理 7.4 的机器形）。
⇒ **这是论文与机器化差异最大的一处**（A-4 详述）。

### A-2.27 引理 7.4（`lem:common-centralizer`，`assembly.tex` 241–285 行）：$C_G(d)\cap C_G(e)=T$

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:common-centralizer}
For the elements $d,e$ of $G$,
\[
 C_G(d)\cap C_G(e)=T.
\]
\end{lemma}
```

(b) `[补]` 双向：
1. $\supset$：由呈现（六条交换关系）。
2. $C_G(d)\subset B$：设 $g\notin B$，其 (7.2) 正规形写成 $g=wb$，$b\in B$，$w$ 是非空交替积
   且**末因子在 $G_0\setminus T$**（把末端 $T$-元素与（若存在的）最后 $B$-代表元吸进 $b$；
   $g\notin B$ 保证至少有一个 $G_0$-代表元）。
   沿投影 $B\to F(d,e)$，$bdb^{-1}$ 映到非恒等自由生成子 $d$ 的共轭 ⇒ $bdb^{-1}\in B\setminus T$。
   于是 $gdg^{-1}=w(bdb^{-1})w^{-1}$ 按引理 7.3 意义下**约化**：中间因子在 $B\setminus T$、
   两侧邻因子在 $G_0\setminus T$、其余相邻交替 ⇒ 含 $G_0\setminus T$ 因子 ⇒ 不属于 $B$ ⇒ 不等于 $d$。
3. $B$ 内部：$f\in F(d,e)$ 约化字与 $d$ 交换 ⇒ 写成 $f=vd^q$（去掉末尾最长 $d$-串，$v$ 空或以 $e^{\pm1}$ 结尾）
   ⇒ $fdf^{-1}=vdv^{-1}$；$v$ 非空时该字自由约化、长 $2|v|+1>1$ ⇒ 不等于 $d$ ⇒ $f=d^q$；
   $q\ne0$ 时 $d^qed^{-q}$ 自由约化且 $\ne e$ ⇒ 只有单位元同时与 $d,e$ 交换
   ⇒ $(t,f)\in T\times F(d,e)$ 中心化二者 $\iff f=1$。

(c) `[机械理由]`
- 第 2 步的两个关键都来自 $m_{de}=\infty$ 与 $d,e$ 对块内私有字母无有限标签：
  投影 $B\to F(d,e)$ 存在**当且仅当** $B=T\times F(d,e)$ 是直积；
  $bdb^{-1}\in B\setminus T$ 要求其 $F(d,e)$-分量非平凡。
- "$w^{-1}$ 的写法"隐含一个技术点：$w^{-1}$ 的类型仍与 $w$ 末因子同属 $G_0$，
  所以 $w(bdb^{-1})w^{-1}$ 的首尾相邻对是"$G_0$–$B$"型（约化）——若 $bdb^{-1}$ 落入 $T$，
  中间因子会被吸掉，约化性丧失 ⇒ 这正是必须"非恒等自由生成子的共轭"的机械原因。
- 第 3 步是自由群 $\mathrm{C}_{F(d,e)}(d)=\langle d\rangle$ 的初等证明，无需任何深定理。

(d) `[推测]` 失败路线：
1. 若哨兵只有一个（只用 $d$），$C_G(d)$ 会含 $\langle d\rangle$ 与 $T$ 之外的元素（如 $G_0$ 中某些字），
   无法把 $Y$ 的不变群精确钉成 $T$；两个哨兵的"共同中央子群"是为了**消掉** $\langle d\rangle,\langle e\rangle$；
2. 若 $m_{de}=2$（$F(d,e)$ 变 $\mathbb Z^2$，交换），第 3 步"只有单位元同时与两自由生成子交换"仍成立
   （$\mathbb Z^2$ 中 $f$ 与 $d$ 自动交换 ⇒ 中央子群是整个 $\mathbb Z^2$）⇒ **失效**：
   `[分析]` 直积情形 $C_{\mathbb Z^2}(d)=\mathbb Z^2$，$C_G(d)\cap C_G(e)\supsetneq T$。这正是 $m_{de}=\infty$ 的机械必要性。
3. `[推测]` 若试图用 $G_0$ 上的共轭作用论证代替正规形，需要对 $G_0$ 的共轭分离性，论文未建立。
Lean 对应：`Embeddings.lean:671 main_common_centralizer (g : MainGroup) (hg : ∀ i, Commute g (sentinelMain i)) :
g∈triangleMain.range`；配套 `:553 sentinelMain`（`if i then mainGen 4 else mainGen 3` = $d/e$）、
`:565 freeMain : FreeTwo.GroupOf →* MainGroup`（自由群由 `FreeTwo` 模块提供）、
`:567 factors_commute`、`:579 productMain_triangle`；
约化性用 Mathlib 的 `PushoutI`/`NormalWord`（见 A-2.26），机器里"$bdb^{-1}\in B\setminus T$"对应
`:114` 那条"与 `PushoutI.of k q` 交换 ⇒ 落在 $( \mathrm{of}\ k).\mathrm{range}$"型引理的 contrapositive 使用。

### A-2.28 引理 7.5（`lem:geometric-centralizer`，`assembly.tex` 287–384 行）：次水平集上的几何作用

(a) 原文逐字（前置文献定位 + 陈述）：

```tex
Geometric actions of centralizers on minimum-displacement sets are
classical.  Swenson \cite[Theorem~13]{Swenson1999} credits this result
to Ruane \cite{Ruane2001}; Swenson also studies intersections of convex
subgroups, and his proof of Theorem~17 treats simultaneous centralizers
\cite[Theorems~16--17]{Swenson1999}.  The following finite-tuple
compactness argument gives the precise common-displacement-sublevel
formulation needed here.  It applies in every dimension and does not
require the elements being centralized to commute.

\begin{lemma}\label{lem:geometric-centralizer}
Suppose a group $H$ acts geometrically on a nonempty proper CAT(0)
space $X$.  For finitely many elements $q_1,\ldots,q_m\in H$,
$m\ge1$, set
\[
 C=\bigcap_{j=1}^m C_H(q_j).
\]
If $A\ge0$ is finite and the set
\[
 Y_A=\{x\in X:d_X(x,q_jx)\le A\text{ for }1\le j\le m\}
\]
is nonempty, then $Y_A$, with its inherited metric, is a proper
CAT(0) space, invariant under $C$, and the restricted $C$-action
is geometric.  Every element of $C$ has the same stable translation
length in $Y_A$ as in $X$.
\end{lemma}
```

(b) `[补]` 五段：
1. **闭凸**：$x\mapsto d_X(x,q_jx)$ 连续；凸性用 `eq:distance-convexity`：$\gamma$ 为 $x_0\to x_1$ 的测地线，
   $q_j\gamma$ 为 $q_jx_0\to q_jx_1$ 的测地线 ⇒ $d_X(\gamma(t),q_j\gamma(t))\le(1-t)d_X(x_0,q_jx_0)+td_X(x_1,q_jx_1)$。
   ⇒ $Y_A$ 闭凸；其测地三角形与度量从 $X$ 继承 ⇒ CAT(0)；$Y_A$ 中闭有界集在 $X$ 中闭有界 ⇒ 紧（用空间 proper）
   ⇒ $Y_A$ 是**真** CAT(0)。
2. **不变性**：$c\in C$ ⇒ $d_X(cx,q_jcx)=d_X(cx,cq_jx)=d_X(x,q_jx)$（$q jc=cq_j$ + 等距）。
3. **作用 proper**：$Y_A$ 的紧子集在 $X$ 中紧 ⇒ 用 $X$ 上的条件。
4. **cocompact（核心）**：取紧 $K$ 使 $HK=X$，$L=\{z:d_X(z,K)\le A\}$ 闭有界 ⇒ 紧（proper），
   $\mathcal F=\{r\in H:rL\cap L\ne\varnothing\}$ 有限。若 $hK\cap Y_A\ne\varnothing$，取 $p\in K$ 使 $hp\in Y_A$，
   则对每个 $j$：$d_X(p,h^{-1}q_jhp)=d_X(hp,q_jhp)\le A$ ⇒ $p$ 与 $h^{-1}q_jh p$ 都在 $L$ ⇒ $h^{-1}q_jh\in\mathcal F$
   ⇒ 有序 $m$-元组 $(h^{-1}q_1h,\dots,h^{-1}q_mh)$ 只有有限多可能，取其代表 $h_1,\dots,h_N$；
   若 $h$ 与 $h_i$ 同元组 ⇒ $(hh_i^{-1})q_j(hh_i^{-1})^{-1}=q_j\ \forall j$ ⇒ $hh_i^{-1}\in C$
   ⇒ $h\in Ch_i$（原文加注"right coset, in the standard convention"）。
   令 $K_C=Y_A\cap\bigcup_{i\le N}h_iK$（紧）：给定 $x\in Y_A$ 写 $x=hp$，取同元组代表 $h_i$，$h=ch_i$
   ⇒ $c^{-1}x=h_ip\in Y_A\cap h_iK$ ⇒ $x\in CK_C$。
5. **稳定长度相同**：$y\in Y_A,c\in C$ ⇒ $d_{Y_A}(y,c^ny)=d_X(y,c^ny)$（继承度量）⇒ 除 $n$ 取极限。

(c) `[机械理由]`
- **有限元组技巧**是本引理全部：把"$h$ 把 $K$ 搬到 $Y_A$"翻译成"$h$ 的 $m$-元共轭元组落在有限集"，
  从而 $h$ 只有有限多个 $C$-右陪集 ⇒ cocompact。若 $m$ 无限（例如对全体 $T$ 取中央化子）元组不再有限
  ⇒ 论证崩；这里 $m=2$（$d,e$）正是哨兵设计的价格。
- $A$ 必须**有限且给定**，并要求 $Y_A\ne\varnothing$：$A\ge\max\{d(x_0,dx_0),d(x_0,ex_0)\}$ 在定理证明里保证。
- "does not require the elements being centralized to commute"：$d,e$ 恰好**不**交换（$m_{de}=\infty$），
  故 Swenson 的单个元素定理不够，必须用同时中央化子的版本；原文逐字声明这一点。
- 稳定长度相等只需 $Y_A$ 对 $C$ 不变 + 度量继承 ⇒ 这是把 §3 的比值"搬运"到 $T$-作用的唯一接口。

(d) `[推测]` 失败路线：
1. 若 $X$ 不 proper，$L$ 不紧 ⇒ $\mathcal F$ 无限 ⇒ cocompactness 失效；
2. 若改用"最小位移集"（$\{x:d(x,q_jx)=\inf\}$，Swenson/Ruane 的形式）而非**次水平集**，
   空集风险与稳定长度相等都需要额外论证（次水平集非空由 $A$ 的取法显然保证）；
   `[推测]` 原文那句"gives the precise common-displacement-sublevel formulation needed here"
   正是对这条替代路线的说明性拒绝——证据来源：该句位置在文献段与方法句之间。
3. 若 $C$-作用的等距性不被 $Y_A$ 限制（例如 $c$ 把 $Y_A$ 映到自身但度量不同），第 5 步失效；
   机器侧靠 `sublevelAction_stableLength` 的 `rfl` 成立 ⇒ **度量继承**在 Lean 里是 ` subtype` 的实例，
   等式是定义级的（见下）。
Lean 对应：`Centralizer.lean`（202 行）：`:11 GeodesicallyConvex`、`:15 CAT0_subtype`、
`:44 tupleCentralizer (q : ι → G) : Subgroup G`、`:50 displacementSublevel`、
`:53 _closed`、`:61 _convex`、`:73 _smul`、`:89 sublevelAction_isometry`、`:97 sublevelAction_proper`、
`:113 sublevelAction_cocompact [Finite ι] [ProperSpace X] [Nonempty X]`（**有限元组技巧**的机器形式，
用 `Fintype.ofFinite ι` 与 `Set.Finite` 的元组枚举）、`:169 geometric_tupleCentralizer`（合装）、
`:182 sublevelAction_stableLength`（证明体只有 `rfl`）、`:188 exists_sublevel_nonempty`
（取 $A=\sum_i\mathrm{dist}(x,q_i x)$）、`:196 sublevel_properSpace`（`ProperSpace.of_isClosed`）。

### A-2.29 定理 1.1 的证明（`assembly.tex` 386–425 行）：收束

(a) 原文逐字（全文，因短且关键）：

```tex
\begin{proof}[Proof of Theorem~\ref{thm:main}]
Let $M$ be the explicit finite matrix of Definition~\ref{def:matrix}.
Suppose, for a contradiction, that $G=A_M$ acts properly and
cocompactly by isometries on a nonempty proper CAT(0) space $X$.
No restriction is placed on the dimension of $X$.

Choose $x_0\in X$ and a finite number
\[
 A\ge\max\{d_X(x_0,dx_0),d_X(x_0,ex_0)\}.
\]
The set
\[
 Y=\{x\in X:d_X(x,dx)\le A,\ d_X(x,ex)\le A\}
\]
contains $x_0$.  By Lemmas~\ref{lem:common-centralizer} and
\ref{lem:geometric-centralizer}, $T$ acts geometrically on $Y$,
and its stable lengths there agree with its stable lengths in $X$.

Sending every Artin generator of $G$ to $1\in\mathbb Z$ defines
a homomorphism $G\to\mathbb Z$: both sides of each defining
Artin relation have the same number of letters.  In particular,
every squared generator maps to $2$ and has infinite order.
Lemma~\ref{lem:semisimple} therefore gives
$\ell_X((s_1^{uv})^2)>0$ for each $(u,v)\in\mathcal E$.
The corresponding embedded $B_{40}$ block satisfies all the
relations required by Proposition~\ref{prop:braid-angle}, so that
\[
 \frac{\ell_X((uv)^3)}{3\ell_X(u^2)}
 =\frac{\ell_X((uv)^3)}{3\ell_X(v^2)}
 >\frac12
 \qquad ((u,v)\in\mathcal E).
\]
Equality of stable lengths transfers all three strict inequalities
to the geometric $T$-action on $Y$.  This contradicts
Proposition~\ref{prop:triangle-obstruction}.

The $116$-generator Artin group $A_M$ therefore has no proper
cocompact isometric action on any nonempty proper CAT(0) space.
This is the required counterexample.
\end{proof}
```

(b) `[补]` 五步装配：①假设 $G$ 几何作用于 $X$；②$A$ 的取法使 $Y\ne\varnothing$（含 $x_0$）；
③7.4 + 7.5 ⇒ $T\curvearrowright Y$ 几何且稳定长度继承；④增广 $G\to\mathbb Z$ ⇒ 每个平方生成子像 2 ⇒
无限阶 ⇒ 引理 2.2 ⇒ $\ell_X((s_1^{uv})^2)>0$；⑤A-2.25 的嵌入使 $B_{40}$ 块在 $G$ 中满足 `prop:braid-angle`
全部前提 ⇒ 三对比值 $>1/2$ 在 $X$ 中成立 ⇒ 传到 $Y$ ⇒ 与命题 4.1 矛盾。

(c) `[机械理由]`
- "**No restriction is placed on the dimension of $X$.**"：作者用一整句独立陈述"任意维"这一卖点，
  与引言 133–134 行"It does not require a triangulation or a dimension bound on the unknown CAT(0) space"呼应。
- 增广 $G\to\mathbb Z$ 的存在性理由极具体："both sides of each defining Artin relation have the same
  number of letters"——交错字关系两侧同长 ⇒ 全部生成子赋 1 是良定义同态。$\infty$ 标签不产生关系，
  故不受影响。
- $\ell_X((s_1^{uv})^2)>0$ 只需**每块第一个**生成子的平方，因为 `prop:braid-angle` 的前提只有
  $\ell(s_1^2)>0$；其余平方等长由 `eq:braid-shift` 共轭给出。
- 传递用的是 $(uv)^3=z_{uv}$ 在块内 = $Z_3$、在 $T$ 内是同一个字 ⇒ 无需额外引理。

(d) `[推测]` 失败路线：
1. `[分析]` 若 $G\to\mathbb Z$ 不存在（例如某关系两侧长度不等，一般 Artin 型 $I_2(m)$ 交错字仍等长，
   但若加入非齐次关系就会失效），$\ell(u^2)>0$ 无从保证，引理 2.2 的"$\ell=\min$"可能给 0，
   比值 $>1/2$ 变成 $0/0$；
2. 若次水平集 $Y$ 上的稳定长度**不等于** $X$ 上的（比如只证 $\le$），比值条件在 $T$ 上不成立，矛盾不产生；
3. `[推测]` 若哨兵设计改成"$d$ 单个元素 + 其轴"，需要 Swenson 单元数定理且要求 $d$ 的双曲型，
   在 Artin 群中不易验证 ⇒ `[推测]` 这是选"两个哨兵的共同中央子群"的原因。
证据来源：原文对 7.5 的"finite-tuple""does not require … to commute"两句限定。
Lean 对应：`Main.lean:26 not_geometric` 的证明体逐字即本五步：
```lean
obtain ⟨A,hA,hY⟩ := exists_sublevel_nonempty (X:=X) sentinelMain
let Y := displacementSublevel (X:=X) sentinelMain A
let : Nonempty Y := hY
let : ProperSpace Y := sublevel_properSpace hG.2.1 sentinelMain A
let := sublevelAction hG.2.1 sentinelMain A
have hC := geometric_tupleCentralizer hG sentinelMain A hA
let := MulAction.compHom Y triangleCentralizer
have hT : GeometricAction TriangleGroup Y := geometric_compHom triangleCentralizer triangleCentralizer_bijective hC
let y : Y := Classical.choice inferInstance
apply SixSector.no_strict_ratios hT y
...
have hr := (braid_forty_ratio hG y.val (blockMain_relations i) hp).2.1
```
其中 `generator_square_positive explicitMatrix hG y.val (corner i)` 是"增广 + 引理 2.2"的合并机器形式；
`triangleCentralizer_bijective`（`Embeddings.lean:683`）把"$C_G(d)\cap C_G(e)=T$"写成**双射同态**，
故 `geometric_compHom` 直接搬运几何作用——机器侧不出现"中央子群等式"的集合式陈述。

## A-3 叙事时间线（Artin 篇）

### A-3.0 体量与结构（可核对的客观数据，全部来自 TeX 源码统计）

| 文件 | 行数 | 字节 | `\begin{equation}` | 图 | 定理类环境 |
|---|---|---|---|---|---|
| `main.tex` | 22 | 645 | — | — | 摘要 3 句 |
| `macros.tex` | 29 | 1031 | — | — | — |
| `sections/introduction.tex` | 158 | 7917 | 0 | 0 | 定理 1.1（`thm:main`）+ 2 个 `\subsection*` |
| `sections/lengths.tex` | 251 | 10916 | 8 | 0 | 引理 2.1–2.4 |
| `sections/braids.tex` | 213 | 8157 | 9 | 0 | 命题 3.1、引理 3.2 |
| `sections/sectors.tex` | 374 | 15446 | 13 | 1 | 命题 4.1、引理 4.2–4.6 |
| `sections/diagrams.tex` | 428 | 21346 | 5 | 2 | 引理 5.1–5.2、命题 5.3、引理 5.4 |
| `sections/localization.tex` | 214 | 10242 | 4 | 0 | 引理 6.1–6.2 + 命题 4.1 证明 |
| `sections/assembly.tex` | 425 | 18683 | 2 | 0 | 定义 7.1、引理 7.2–7.5 + 定理 1.1 证明 |
| `references.tex` | 126 | 5011 | — | — | 18 条 bibitem |

`[事实]` 全篇 **27 个编号条目**（1 定理 + 4 命题 + 15 引理 + 1 定义 + 6 个非编号段落块），
**0 个 `remark` 环境、0 个 `corollary` 环境**（grep `begin{remark}`/`begin{corollary}` 无命中）：
所有"注"都以普通段落形式内嵌（例如 Crisp–Paoluzzi 注、Crisp 角和注、"we do not claim" 两句）。
⇒ 叙事风格判断：**没有反思性段落，只有推进性段落**；防御性内容全部以句子而非环境的形式出现，
因此 (A-3.2/A-3.3) 的清单只能按句子定位。
`[事实]` 图仅 3 张（`figures/sectors.pdf`、`figures/fold.pdf`、`figures/annulus.pdf`），**均为 PDF，
目录内无 `.tex`/`.typst` 图源**（与双曲篇不同：那边有 `figures/fano-template.tex` 等）
⇒ 图的内容只能从 caption 读取，本篇素材里所有关于图的判断均来自 caption 文本。

### A-3.1 关键英文原句逐字 + 一句话中文释义（按论文出现顺序 = 作者修辞顺序）

| # | 位置 | 逐字原句 | 释义（作者在防守/主张什么） |
|---|---|---|---|
| 1 | `main.tex` 摘要 | "We construct an Artin group on 116 generators that admits no proper, cocompact isometric action on a nonempty proper CAT(0) space. This refutes the CAT(0) conjecture for Artin groups." | 主张：**存在性反例 + 推翻猜想**，摘要就给出维度无关的全称否定；无方法暗示。 |
| 2 | `main.tex:4` `\author{OpenAI}` | 作者署名为机构名，无个人、无致谢、无基金注 | 组织性事实：单机构署名、零致谢 ⇒ 无法从署名推断合作/评审轨迹。 |
| 3 | `macros.tex` hyperref subject | "A counterexample to the CAT(0) conjecture for Artin groups" | PDF 元数据把"推翻猜想"设为副标题级定位（比正文标题更强），面向社区叙事。 |
| 4 | intro 13–25 | "Throughout, an action is called \emph{geometric} if …" | 主张：把三条假设 + 空间 proper 全部**前置声明**，防止"你的作用其实不几何"式质疑。 |
| 5 | intro 24–25 | "The explicit properness assumption on \(X\) also follows from the other action hypotheses for a length space \cite[Exercise~I.8.4(1)]{BridsonHaefliger1999}." | 防守：主动承认该假设**冗余**，避免被指"靠冗余假设取巧"。 |
| 6 | intro 27–34 | "Charney asked which Artin groups are CAT(0)… The affirmative expectation that every finite-rank Artin group admits a geometric action is recorded by Haettel as Conjecture~1.1… The challenge is compatibility: constructing actions for the rank-two braid subgroups does not by itself supply an action of the whole group." | 定位：问题出处（Charney Problem 4 / Haettel Conjecture 1.1）+ 一句话解释**为什么难**（局部相容性）。 |
| 7 | intro 36–50 | "There are substantial positive results. RAAG… Brady and McCammond… Haettel proved the conjecture for XXL type… five-strand… six-strand… seven-strand…" | 主张：先完整列出正例谱系（6 项），把反例定位在"已知正例之外"，暗示构造的边界位置。 |
| 8 | intro 52–59 | "Brady and Crisp found Artin groups with two-dimensional classifying spaces for which the least dimension of a geometric CAT(0) action is three… Their examples show that an obstruction in one dimension can disappear in a higher-dimensional CAT(0) space. To refute the conjecture, an obstruction must instead survive every dimension." | **全篇的设计约束来源**：明确给出"必须维数无关"这一硬要求，为后文所有"任意维"声明奠基。 |
| 9 | intro 68–71 | "In particular, the conclusion excludes every nonempty proper CAT(0) space, regardless of dimension or the choice of a complex or metric." | 主张结论的强度：不依赖任何复形/度量选择。 |
| 10 | intro 82–84 | "Two further generators \(d,e\), each commuting with \(a,b,c\) and having no other finite incident labels, make \(T\) their simultaneous centralizer; Section~\ref{sec:assembly} proves this equality. This gives \(3+3\cdot37+2=116\) generators." | 构造核心句：哨兵 = 中央子群装置；同时**把证明外包**给 §7（前向引用）。 |
| 11 | intro 91–93 | "The calculation in Section~\ref{sec:braids} uses these standard geometric properties to constrain the braid relations, without requiring the braid blocks themselves to act cocompactly." | 防守：辫子块不必几何 ⇒ 反驳"你只是把辫子群的作用推广了"。 |
| 12 | intro 108–112 | "A related angle-sum obstruction appears in Crisp's study of two-dimensional Bestvina--Brady groups… His argument assumes covering dimension two and a proper action in which each isometry attains its minimum displacement." | 优先权声明 + 差异声明：前人做过角和，但**受维数 2 限制**。 |
| 13 | intro 114–115 | "The main geometric step is to turn this short angular circuit into a contradiction that remains valid in arbitrary dimension." | 把 §4–§6 的困难**自认为论文的主要贡献**（方法层的自我定位）。 |
| 14 | intro 117–118 | "This action is the equilateral-triangle specialization of Digne's reflection-coordinate homomorphism \cite[Proposition~2.1]{Digne2016}." | 优先权：坐标仿射作用是 Digne 的，本篇只取等边特化。 |
| 15 | intro 126–130 | "The triangular presentation and its girth-six link are the \(m=n=p=3\) specialization of Brady and McCammond's construction \cite[preprint Lemmas~2--3]{BradyMcCammond2000}. We prove the facts needed here, including the signed-count and controlled-approximation statements." | 优先权 + 自证声明：复形是前人的，**符号计数与逐点控制是本文新证**。 |
| 16 | intro 131–134 | "The latter comparison between local degree and global signed counts is formulated entirely in terms of distances and finite diagrams. It does not require a triangulation or a dimension bound on the unknown CAT(0) space." | 二次强调"不依赖未知空间的维数"；"距离 + 有限图示"是方法的自我概括。 |
| 17 | intro 149–151 | "We use elementary finite planar topology for regular neighbourhoods of graphs and winding numbers; no Artin-group asphericity theorem is an input." | 防守：不用 Artin 群作为性定理（该领域最难开放问题之一）⇒ 反例不依赖未解猜想。 |
| 18 | lengths 3–5 | "Our objective is a pairing of stable lengths that is additive on an entire centralizer, even when its elements do not commute with one another." | §2 的唯一目标被写成一句话（**先给结论再给证明**的写法）。 |
| 19 | lengths 10–12 | "We derive precisely the length identities needed for the braid calculation directly from triangle comparison, without using a splitting theorem." | 防守：不用平坦环面/分裂定理；"precisely … needed"= 拒绝过度引用大定理。 |
| 20 | braids 8–10 | "Throughout this section the same notation may denote elements of another group satisfying these relations. No injectivity or cocompactness of the resulting braid subgroup is needed for the length estimates." | 主张：长度估算是**纯关系级**的（这是全篇最"模块化"的声明）。 |
| 21 | braids 107 | "We retain \(l=2k\) with \(k\ge3\) until the final arithmetic, where \(k=20\)." | 参数延迟决定：直到最后一刻才代 $k=20$（提示 $k$ 是可调参数）。 |
| 22 | sectors 19–21 | "The denominators are positive in every geometric action: sending each of \(a,b,c\) to \(1\in\mathbb Z\) shows that their squares have infinite order, so Lemma~\ref{lem:semisimple} applies." | 即用时即验证：分母非零用一个增广解决，不引入新引理。 |
| 23 | sectors 41–44 | "The following form of the \v{S}varc--Milnor orbit comparison is standard… Its direct proof records the constants used to turn mirror-coordinate separation into metric separation." | 自证动机声明：为了**常数**而非为了结果。 |
| 24 | sectors 214–215 | "We use only the Euclidean metric within each sector of \(P\); we do not claim that this cone disk is CAT(0)." | **未断言声明**（全文最明确的"we do not claim"）。 |
| 25 | diagrams 7–9 | "We give direct proofs of the needed facts. This complex is separate from the unknown CAT(0) space; the argument here concerns finite diagrams and planar topology." | 主张：§5 与未知空间**解耦**（这就是"任意维"的实现方式）。 |
| 26 | diagrams 141–145 | "The proof below uses the classical diagrammatic-reducibility method of deleting opposite faces and excluding a reduced spherical diagram by curvature \cite[Definition~3.1 and Corollary~4.6]{Gersten1987}, here keeping the identity of each target cell and allowing collapsed parameter triangles." | 方法归属 + 两处修改声明（胞腔身份、塌缩面）。 |
| 27 | diagrams 287–288 | "In particular \(C_1\) is independent of \(f\), its modulus of continuity, and the number of triangles required." | 引理 5.4 的**全部难点**就在这句（局部性论证的前提）。 |
| 28 | diagrams 339–340 | "This proves the claimed finite reduction without assuming a disk-diagram theorem." | 防守：不用圆盘图示定理（避免额外曲率假设）。 |
| 29 | diagrams 353 | "For precision, an empty arc requires a fan, not an identification of parameter vertices." | 修补语气最强的一句（"For precision"）：显式指出一个容易写错的点。 |
| 30 | localization 111 | "For completeness, we spell out the elementary planar count we use." | 主张：绕数公式自证（读者无需相信引用）。 |
| 31 | localization 63–64 | "This is a coordinate projection on that sector; no global injectivity of \(J\) is asserted." | **未断言声明**（$J$ 非全局单射）。 |
| 32 | assembly 6–8 | "The additional generators in the following matrix make the group $T$ a common centralizer. This will produce a geometric action of $T$ from any hypothetical geometric action of the full group." | §7 的全部功能一句话化：**由整体作用造子群作用**。 |
| 33 | assembly 132–133 | "The construction asserts a state invariant; it does not assert that discarding the other tokens gives a homomorphism \(B_l\to B_3\)." | **未断言声明**（最技术化的一条：状态不变量 ≠ 收缩同态）。 |
| 34 | assembly 293–296 | "The following finite-tuple compactness argument gives the precise common-displacement-sublevel formulation needed here. It applies in every dimension and does not require the elements being centralized to commute." | 主张：引理 7.5 是"精确配方"，两条"不需要"（维数、被中心化元素交换）都必要。 |
| 35 | assembly 389–390 | "No restriction is placed on the dimension of \(X\)." | 定理证明开头的独立句：把设计约束在收束处再兑一次。 |
| 36 | assembly 424 | "This is the required counterexample." | 结尾一句，无展望、无 open problems、无致谢。 |

`[分析]` 修辞时间线的整体形状：**摘要即结论 → 引言一次剧透完整构造（第 73–140 行的
`\subsection*{The construction and the obstruction}` 用 8 段讲完全篇）→ 各节开头一句话目标 →
证明主体 → 结尾零展望**。这是"论文已完成、正在寻找读者"的文本形态；**没有**过渡性犹豫语（如
"we hope/plan to"）、没有未证声明、没有脚注式讨论。⇒ 该篇的写作时间线里"设计期"的痕迹只能靠
(i) 前向引用、(ii) "For precision"类修补句、(iii) `\begin{samepage}`、(iv) 参数延迟决定（第 21 条）来定位。

### A-3.2 作者自述的设计约束与"不依赖"清单（逐字 + 位置 + 它在保护什么）

1. "an obstruction must instead **survive every dimension**"（intro 58–59）⇒ 保护：结论的适用面；
   由 §5 的"该复形与未知空间无关"、引理 7.5 的"applies in every dimension"共同兑现。
2. "It does not require a triangulation or a dimension bound on the unknown CAT(0) space"（intro 133–134）。
3. "without using a splitting theorem"（lengths 12）⇒ 不依赖 Flat Torus Theorem / BH II.7.1 的分裂机制。
4. "No injectivity or cocompactness of the resulting braid subgroup is needed for the length estimates"
   （braids 9–10）⇒ 命题 3.1 只消费**关系**，不消费子群几何。
5. "without requiring the braid blocks themselves to act cocompactly"（intro 92–93）。
6. "Its direct proof **records the constants**"（sectors 42–44）⇒ 常数是产物，不是副产品。
7. "This complex is separate from the unknown CAT(0) space"（diagrams 8–9）。
8. "$C_1$ is independent of $f$, its modulus of continuity, and the number of triangles required"
   （diagrams 287–288）；"It is chosen once and does not depend on $f$"（diagrams 413–414）。
9. "without assuming a disk-diagram theorem"（diagrams 340）。
10. "no Artin-group asphericity theorem is an input"（intro 150–151）。
11. "does not require the elements being centralized to commute"（assembly 295–296）。
12. "There is one constant $C_1$, independent of $n$"（localization 69）；"$C_2$, independent of $n,p,s$"
    （localization 93）；"$C_0$ independent of $n,p$"（sectors 243）⇒ **三处"与 $n$ 无关"是同一族约束**，
    服务于 $\delta n$ vs $2C_1$ 的对撞。

### A-3.3 "we do not claim / it does not assert"清单（论文自我限制的完整清点，共 5 处）

1. sectors 214–215："we do not claim that this cone disk is CAT(0)"——参数盘 $P$ **不是** CAT(0) 空间。
2. localization 63–64："no global injectivity of $J$ is asserted"——$J$ 只在所选扇区内是坐标投影。
3. assembly 132–133："it does not assert that discarding the other tokens gives a homomorphism $B_l\to B_3$"
   ——token 不变量不是收缩同态。
4. braids 126–127（间接）："this calculation does not expand the noncommuting $s_2$-letters inside $L_3$"
   ——声明计算**刻意停留**在非交换内部结构之外。
5. diagrams 98（间接）："possible coincidences of group elements do not identify labelled edge directions"
   ——Cayley 图中顶点重合不识别方向（身份制的坚持）。
`[写作纪律]` 笔记与终稿**不得**把这 5 处写成"论文证明了/论文假定了"，也不得替论文补上
"$P$ 是 CAT(0)"或"$J$ 单射"这类看似无害的加强。

### A-3.4 文献规模与倾向

- 18 条，**全部被引用**（grep 出的 18 个不同 cite key 与 18 条 bibitem 一致，无冗余条目）。
- 引用频次最高：`BridsonHaefliger1999` 4 次（含一条**习题** I.8.4(1)）、`BradyMcCammond2000` 3 次、
  `Swenson1999` 与 `Haettel2022`、`Digne2016` 各 2 次，其余各 1 次。
- **6 处按"preprint Theorem/Lemma/Corollary N"引用**（introduction 39/43/49/50/55/128 行）
  ⇒ 引的是 arXiv 版编号而非期刊版编号；笔记转述这些结论时**必须注明版本号可能不符**（本素材一律只标注
  "论文如此引用"，不核对期刊原版）。
- 年代分布：1980–2023，**最新一条是 Jeong 2023**；无 2024–2026 文献 ⇒ 该篇不建立在近三年结果之上，
  也无"同时期预印本竞争"声明（`[事实]` 无相关段落）。
- 特殊条目类型：Charney 的问题列表标注 "American Institute of Mathematics, **undated problem list**"；
  Digne 标注 "**unpublished manuscript, 1999; arXiv version 3, 2016**"；Rodenhausen 是 **Ph.D. thesis**（Bonn 2013）；
  `Bridson2001` 给的是"Author's preprint page"链接而非 doi ⇒ 文献类型偏"经典 + 手稿"，无综述类引用。
- 主题倾向：正例阵营（Charney–Davis、Brady–McCammond ×2、Haettel、HKS、Jeong）6 条，
  负例/障碍阵营（Brady–Crisp、Crisp、Bridson 2001）3 条，几何组论工具（BH、Swenson、Ruane、Serre、Gersten）5 条，
  长度/辫子工具（Rodenhausen、Crisp–Paoluzzi、Digne）3 条，问题列表 1 条。

### A-3.5 tex 源码中的叙事痕迹（节序 vs 逻辑序）

1. **文件输入序 = 逻辑序，但命题陈述序 ≠ 证明序**：`prop:triangle-obstruction`（命题 4.1）在 §4 陈述、
   §6 末证明（`localization.tex` 191 行 `\begin{proof}[Proof of Proposition~\ref{prop:triangle-obstruction}]`）；
   §4 开头逐字"We prove the proposition in Section~\ref{sec:localization}. In this section, assume for
   contradiction that such an action on $Y$ exists and fix $y\in Y$."——**前向引用 + 假设性推进**，
   提示 §4 是"被拆开的两半"，也提示作者先在 §4 完成几何构造、后在 §6 才找到图示矛盾装置。
2. `lem:sector-maps`（引理 4.5）被 `\begin{samepage}…\end{samepage}` 包住（sectors 240/264），是全篇唯一的
   samepage ⇒ 作者在意"该陈述 + 四条结论不被分页打断"，暗示其陈述长度/结构经历过读者反馈。
3. `\subsection*`（无编号小节）只出现在引言（"The construction and the obstruction"、"Organization and notation"）
   与 §4（"Orbit control and mirror coordinates"、"The parameter disk"、"Uniform asymptotic maps"）、
   §5、§6；`\setcounter{tocdepth}{1}` ⇒ 目录只到 section 级 ⇒ 小节是**内部组织**而非展示结构。
4. `macros.tex` 的 `clubpenalty/widowpenalty=10000`、`\raggedbottom` ⇒ 精细排版（投稿形态），
   但**无 `\usepackage{authordate}`/无 bib 文件**（thebibliography 手写）⇒ 单作者/单文件工作流。
5. 逻辑序与叙事序的偏离点：引言的构造 subsection（73–140 行）在**定理陈述之后、任何证明之前**给出完整
   障碍链（含 $143/513$ 型比值不等式、六扇区、$\pi/3$、$2\pi$），而 §3 才第一次严格给出比值下界；
   ⇒ 读者第一次见到不等式时它只是"会被证明的目标"，这是**倒叙式写作**。
6. §7 的装配段（287–384 行）把"引理 7.5 的文献出处（Swenson 定理 13 归于 Ruane；定理 16–17 处理同时中央化子）"
   放在自证之前 ⇒ 作者先声明"这是经典"，再声明"但我们要的是精确配方"——防御性优先级的体现。

### A-3.6 论文未述清单（写笔记/终稿时**不得虚构**论文已论证的内容）

1. **未述 116 与 40 股的最优性**：全文无"minimal"、无"could be reduced"类讨论；
   `[分析]` 本人验算 $k=14$（28 股、80 生成子）在论文自身不等式层面已够，但论文未提、也未解释为何取 $k=20$。
2. **未述 $T$ 本身是否 CAT(0)/双曲/可立方化**：$T$ 只作为"检测障碍的小群"出现；
   论文从未断言 $T$ 有几何 CAT(0) 作用（事实上命题 4.1 排除的是满足比值条件的作用）。
3. **未述 Artin 群作为性（asphericity）、type-F、biautomaticity、词问题**：
   逐字声明"No Artin-group asphericity theorem is an input"，也未讨论 $A_M$ 是否属于任何已知好类别。
4. **未述无挠/ torsion-free**：只用"$\ell=0\Leftrightarrow$ 有限阶"的方向，不证 $G$ 无挠。
5. **未述参数盘 $P$ 的 CAT(0) 性**（见 A-3.3 第 1 条）。
6. **未述 $J$ 的全局性质**（同上第 2 条）。
7. **未述 token 不变量给不出收缩同态之外的推论**（同上第 3 条）。
8. **未述六扇区阈值 $1/2$ 是否可改进**：$\pi/3$ 与 $1/2$ 的关系是即用的，但论文未问"最弱可证阈值是多少"。
9. **未述图示计数所需 girth 的确切下界**：论文证 girth $\ge6$ 并使用 $2E\ge6V$，未讨论该下界是否极小；
   `[分析]` 我在 A-2.19(c) 复核后作 `[纠正]`：按 $3F=2E$ 合并得 $V-E+F\le E(\tfrac2m-\tfrac13)$，
   故 $m=6$ 恰为临界（$m=5$ 已不再矛盾），早期笔记里"girth $\ge4$ 也够"一句作废。
   再次强调：这一临界性判断**不是论文内容**，只能作为"分析"标注，不得写成"论文证明…"。
10. **未述任何验证/计算实验清单**：目录内无 `verification/`；`README.md` 只有标准引用块；
    `typst/` 目录存在（`main.typ`、`main.pdf`、`fig/`）但本次未逐行核对，
    ⇒ 关于"官方对照实现"没有一手证据，§A-4 一律以 Lean 仓库为准（与 §头部对双曲篇的说明同规格）。
11. **未述与 2026-09-25 双曲篇的关系**：本篇正文不含对该文的任何引用（18 条 bibitem 中无该条目），
    反之亦然（双曲篇素材头部第 20–22 行已记录）⇒ 两篇相互独立，不得在笔记里构造"系列论文"叙事。
12. **未述任何 open problem / 展望**：全文结尾是"This is the required counterexample."，无问题清单。
13. **未述 3 张图的构造细节**（只有 caption），`[事实]` caption 明确"schematic"（sectors 图：
    "The angles and patch sizes are schematic"）⇒ 不得用图来支撑数值论证。

## A-4 Lean 取证（Artin 篇）

### A-4.0 目录与规模（全部命令实测，路径 `E:/math/lean/OAI/GroupTheory/ArtinCAT0/`）

`[实测]` 20 个 `.lean` 文件、**9,419 行**、行首声明（`def/lemma/theorem/abbrev/instance/noncomputable def/structure`）
合计 **945** 条；`grep -rn "sorry"` **0 命中**（两条 "admits" 出现在 docstring 里，非缺口）；
`grep -rn "^axiom|admit"` **0 命中**（无自定义公理）。

| 文件 | 行 | 声明数 | 对应论文内容 |
|---|---|---|---|
| `Model.lean` | 76 | 13 | 定义 7.1 / Artin 群与 CAT(0)、GeometricAction 的机器定义 |
| `StableLength.lean` | 636 | 56 | §2（引理 2.1–2.3） |
| `Pairing.lean` | 244 | 17 | 引理 2.4（中央子群特征标） |
| `Braids.lean` | 669 | 52 | §3（命题 3.1、引理 3.2）+ 引理 7.2 的 token 不变量 |
| `Presentation.lean` | 313 | 44 | 引理 5.1（$T$ 的呈现）、增广、$B_3$ 嵌入 |
| `TriangleMesh.lean` | 276 | 25 | 命题 5.3 的机器骨架（dart/精确性/Euler 不等式） |
| `Centralizer.lean` | 202 | 14 | 引理 7.5（次水平集几何作用） |
| `Folding.lean` | 806 | 88 | 命题 5.3 的折叠删除 |
| `Mirrors.lean` | 118 | 24 | 引理 4.3（Digne 反射坐标） |
| `Wires.lean` | 274 | 30 | 度 2 顶点压缩（fold surgery 的抽象化） |
| `Winding.lean` | 725 | 87 | §6 的标号/绕数/塌缩商 |
| `Grid.lean` | 596 | 46 | 引理 4.5 的网格映射 $t_n,f_n$ |
| `WordDiagram.lean` | 1088 | 127 | 引理 5.4（受控图示；全目录最大文件） |
| `SectorMetric.lean` | 476 | 46 | 引理 4.4（扇区稳定范数与角度） |
| `Refinement.lean` | 455 | 46 | §5–§6 的细化/填充 |
| `SectorCharts.lean` | 496 | 43 | $v_*$、$J$、区域分离 |
| `Cap.lean` | 586 | 44 | 引理 4.6（外盖帽） |
| `Detour.lean` | 591 | 26 | 引理 4.6/5.4 的环带绕行与逐点界 |
| `Embeddings.lean` | 728 | 114 | §7（amalgam、$G$↔`Model`、共同中央子群） |
| `Main.lean` | 64 | 3 | 定理 1.1 的证明 + `main` 四合取 |

`[事实]` **模块依赖是严格线性链**（按 `^import` 实测）：
`Model → StableLength → Pairing → Braids → Presentation → TriangleMesh → Centralizer → Folding →
Mirrors → Wires → Winding → Grid → WordDiagram → SectorMetric → Refinement → SectorCharts → Cap →
Detour → Embeddings → Main`（只有 `Model.lean` 直接 `import Mathlib`）；
`OAI.lean:654` 引入 `OAI.GroupTheory.ArtinCAT0.Main`。

### A-4.1 "无非几何 CAT(0) 作用"在机器里到底怎么写

`[逐字]` `Model.lean`：
```lean
abbrev Letters := Fin 116
abbrev Label := WithTop ℕ
noncomputable def explicitMatrix (s t : Letters) : Label :=
  if s = t then 1
  else if Adjacent s t then 3
  else if Distant s t ∨ Sentinel s t then 2
  else ⊤
abbrev ArtinGroup (M : Letters → Letters → Label) := PresentedGroup (artinRelators M)
```
（`blockLetter b i` = $s_j^{uv}$ 的编号：`i=0→⟨b.val⟩`、`i=1→⟨(b.val+1)%3⟩`、否则 `⟨5+37*b.val+(i-2)⟩`；
`Adjacent/Distant` 用 `Fin 39` 索引偏移；`Sentinel` = `s.val=3∨4 ∧ t.val<3`。）

`[逐字]` CAT(0) 与几何作用（作者自造，**不用 Mathlib 的 `CAT0` 类**）：
```lean
def Segment (x y : X) (γ : ℝ → X) : Prop        -- 等距参数化的测地线段
def CAT0 (X : Type*) [MetricSpace X] : Prop     -- 每对点存在 Segment + 平方比较不等式
def GeometricAction (G X) : Prop :=
    CAT0 X
  ∧ (∀ g : G, Isometry (fun x : X => g • x))
  ∧ (∀ K, IsCompact K → {g | (g''K ∩ K).Nonempty}.Finite)
  ∧ ∃ K, IsCompact K ∧ ∀ x, ∃ g, ∃ k ∈ K, g • k = x
```
`CAT0` 的 docstring 逐字："All geodesic sides, also degenerate ones, are quantified… not a midpoint-only
condition"；`GeometricAction` 的 docstring 逐字："Properness of the metric space and nonemptiness are
separate standing hypotheses"。
`[分析]` 比较不等式在机器里是 `(t²−tu)d(x,y)² + (u²−tu)d(x,z)² + tu·d(y,z)²` 形式的**平方**版，
与论文 `eq:midpoint-comparison` 同族；因此 A-2.4 的三条推论在机器里全部是**引理**而非定义。

`[逐字]` 否定陈述的最终形状（`Main.lean:53–61`）：
```lean
theorem main :
    (∀ s t : Letters, explicitMatrix s t = explicitMatrix t s) ∧
    (∀ s : Letters, explicitMatrix s s = 1) ∧
    (∀ s t : Letters, s ≠ t →
      explicitMatrix s t = 2 ∨ explicitMatrix s t = 3 ∨ explicitMatrix s t = ⊤) ∧
    (∀ (X : Type u) [MetricSpace X] [ProperSpace X] [Nonempty X]
      [MulAction (ArtinGroup explicitMatrix) X],
      ¬ GeometricAction (ArtinGroup explicitMatrix) X) := by
  exact ⟨explicitMatrix_symmetric,explicitMatrix_diagonal,explicitMatrix_values,Assembly.not_geometric⟩
```
`[关键点]`
1. 非存在性写成 **`¬ GeometricAction G X`，量词在 `X` 上、且假设以 instance 括注给出**
   （`[MetricSpace X] [ProperSpace X] [Nonempty X] [MulAction G X]`）；
   论文的"nonempty proper"两句在机器里**不进入** `GeometricAction` 的合取，而是环境假设 ⇒
   机器陈述比论文陈述多出"对所有满足这些 instance 的 X"这一显式全称。
2. 矩阵的三条合法性（对称、对角 1、非对角 ∈{2,3,⊤}）是 `main` 的**前三个合取支**，
   论文里它们属于定义 7.1 的前提（不作为定理内容）⇒ 比较器把"这是合法 Artin 矩阵"当作需证结论。
3. `Assembly.not_geometric` 用 `MainGroup`（= `ArtinGroup explicitMatrix` 的别名）陈述，
   再在 `main` 里以同一 `explicitMatrix` 实例化。

### A-4.2 题目文件与解法文件的分离

`[逐字]` `ComparatorChallenges/ArtinCAT0.json`：
```json
{ "challenge_module": "ComparatorChallenges.ArtinCAT0",
  "solution_module": "OAI.GroupTheory.ArtinCAT0.Main",
  "theorem_names": ["OAI.ArtinCAT0.main"],
  "definition_names": [],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
  "enable_nanoda": false }
```
`[实测]` `ComparatorChallenges/ArtinCAT0.lean`（77 行）是 `Model.lean` 定义的逐字复制 + 末尾
`theorem main : … ∧ … := by **sorry**` —— **整个目录里唯一的 `sorry` 在这里（第 73 行），属题目占位**，
不是解法缺口。运行方式（`ComparatorChallenges/README.md`）：`lake env comparator ComparatorChallenges/ArtinCAT0.json`。
`definition_names: []` ⇒ 比较器**不要求**机器定义与论文术语同名对应，只核对定理语句 ⇒
"geometric/CAT(0)/stable length"的对应关系只能靠人工（即本节 A-4.1 的对照）。
`enable_nanoda: false` ⇒ 本条目不用 `nanoda`（自动化引理搜索）通道。

### A-4.3 选择公理与经典性使用位置（任务要求专项回答）

`[实测]` `Classical.choice` 共 **4 处**，全部用途相同：**从 `Nonempty X` 取一个基点**：
- `StableLength.lean:410 let o : X := Classical.choice inferInstance`（引理 2.2 最小位移证明内取点）
- `Centralizer.lean:121 let o : X := Classical.choice inferInstance`（`sublevelAction_cocompact`）
- `Centralizer.lean:189 let x : X := Classical.choice inferInstance`（`exists_sublevel_nonempty`，取 $A=\sum_i d(x,q_ix)$）
- `Main.lean:38 let y : Y := Classical.choice inferInstance`（定理证明里取 $y\in Y$，对应论文"Choose $x_0\in X$"）
`[分析]` 没有一处用 choice 做"选择极小测地线/超函数紧化"之类实质非构造步骤 ⇒
**该形式化对 choice 的依赖仅止于 Nonempty 消去**，与论文"proper + nonempty 是显式假设"的姿态一致。
`[实测]` `choose` 策略 / `Classical.choose` 共 **13 处**（逐文件行号）：
`Centralizer.lean:130`、`Detour.lean:31,32`、`Grid.lean:246,383`、`Refinement.lean:123,145,147`、
`SectorCharts.lean:45,210(= (eval_surjective g).choose),354`、`Winding.lean:447`、`WordDiagram.lean:212`；
`open scoped Classical` 出现在 13 个文件。⇒ 绝大多数是"从存在性语句中取见证"（稠密性、路径、边界类型枚举），
其中 `SectorCharts.lean:210` 从满射取群元素的**字代表**，对应论文图示标号里隐式使用的"选一个字"。
`[实测]` permitted axioms = `propext, Quot.sound, Classical.choice`（即 Mathlib 三公理，无 `sorry`、无自定义公理）；
**但本会话无法运行 `#print axioms`**（无 `.lake`、无已编译环境，见 A-4.9）。

### A-4.4 需要哪些外部文献结论（Mathlib 侧与论文侧）

| 外部资源 | 机器中的用法 | 论文中的对应 |
|---|---|---|
| `Mathlib.GroupTheory.PresentedGroup`（`PresentedGroup.of/lift`） | `ArtinGroup M`、`TriangleGroup`、`BraidGroup n` 全部由 `PresentedGroup` 构造；`artinRelators`/`alternating` 自定义 | 论文只用"呈现群"概念（引言 Artin 群定义、引理 5.4 中"按呈现的定义落在关系子正规闭包里"） |
| `Monoid.CoprodI / PushoutI / PushoutI.NormalWord / Transversal` | `Embeddings.lean:7` 打开这些命名空间；amalgam 正规形、`normal_reduced`、`(PushoutI.of k).range` 成员判定 | **引理 7.3（Serre Ch. I §1.2 Thm 1–2 的自证）在机器里被 Mathlib 版本取代** |
| `MetricSpace / ProperSpace / Isometry / MulAction / IsCompact` | 几何作用四条假设的载体；`ProperSpace.of_isClosed`（`Centralizer.lean:196`） | BH 的定义体系（I.8.4、II.6.8 等） |
| `Equiv.Perm`、`Finset`、`Fintype` | `tokenPerm : Equiv.Perm (TokenState H)`（引理 7.2 的状态机） | 论文用文字描述同一状态变换 |
| `Matrix`/`Finsupp`/`semiring` 有限线性代数 + `finrank` | `TriangleMesh.lean:111 coboundary`、`:124 boundarySum`、`:150 exact_iff`、`:180 exact_euler_inequality` | 命题 5.3 的"细正则邻域 + 加盖 + Euler 公式" |
| `Complex` 与 `Real.sqrt`/三角函数不等式 | `SectorMetric.lean:10` 复嵌入 `(p.1 + c*p.2) + (Real.sqrt (1-c^2)*p.2)*I`、`:118 2*sqrt(1+r²−2cr)+r<2` | `lem:outer-cap` 的 $2\sin(\Omega/4)$、$\rho\ge\cos(\theta/2)>\sqrt3/2$ |
| `Filter`/`Tendsto`（`stableLength_tendsto`）、`nnreal` 不等式库 | 稳定长度极限、四边形极限 | A-2.5 |
| 无 `Analysis/Convex` 的 Busemann 函数库 | 论文式 Busemann 差分自造（`Pairing.lean:14 orbitBusemann`） | 引理 2.4 |
| 无 `NaNoda`、无 `polyrith/linear algebra solver` | 数值步骤靠 `norm_num/linarith/nlinarith/omega/positivity/ring` | 全部算术 |

`[事实]` 论文引用的 **BH/Serre/Swenson/Ruane/Digne/Gersten/Brady–McCammond/Crisp–Paoluzzi/Crisp/Bridson2001/
Charney–Davis/Haettel/HKS/Jeong/Charney 问题列表/Rodenhausen** 中，除 Serre 定理由 Mathlib 提供外，
其余结论**全部不在机器里**：机器只证"本文实际用到的那个片段"（例如 Swenson 定理 13/16–17 → `Centralizer.lean`
的有限元组紧论证；Digne 命题 2.1 → `Mirrors.lean` 的等边特化；Gersten 3.1/4.6 → `Folding.lean`+`TriangleMesh.lean`）。

### A-4.5 战术/术语频次（实测，词边界计数）

`simp 619`、`rw 583`、`exact 456`、`have 939`、`omega 382`、`simpa 244`、`intro 243`、`let 157`、
`apply 163`、`linarith 139`、`obtain 120`、`ext 113`、`show 93`、`noncomputable 89`、`refine 84`、
`ring 71`、`cases 68`、`induction 64`、`nlinarith 64`、`norm_num 57`、`decide 55`、`subst 52`、
`classical 50`、`constructor 39`、`all_goals 21`、`positivity 19`、`choose 13`、`calc 25`、`gcongr 0`、`use 0`。
`[分析]` `omega` 382 + `decide` 55 + `norm_num` 57 ⇒ **索引/`Fin` 算术负担极重**（116/39/37/20 这类
常数在机器里都是 `Fin` 运算）；`gcongr=0`、`use=0` ⇒ 不等式单调性靠 `nlinarith/positivity` 硬推，
说明作者（机器侧）没有使用 Mathlib 的广义单调度量库；`noncomputable 89` ⇒ 大量选择型定义（`Segment`、
`Classical.choose`、`representative`）。

### A-4.6 论文条目 ↔ 机器出口对照（27 项）

| 论文 label | 机器出口（文件:行或名称） | 备注 |
|---|---|---|
| `thm:main` | `Main.lean:53 main`（四合取） | 合法性成为结论一部分 |
| 摘要/引言全部历史段 | 无 | 未形式化（正常） |
| "geometric" 定义 | `Model.lean GeometricAction` + `ProperSpace/Nonempty` 假设 | 四拆二，见 A-4.1 |
| `lem:comparison` | `StableLength.lean:28/:37/:43/:56/:65` | 5 条，比论文细 |
| 稳定长度段 | `:88/:91/:100/:122/:129/:142/:148/:157/:170/:185` | 含论文未写的 `one/inv/mul_le` |
| `lem:semisimple` | `:388/:406/:448/:462/:495/:548/:562/:569/:583`（+`:482 extension_numeric`） | 轴=幂距离线性 |
| `lem:commuting-form` | `:205/:221/:235/:256/:276/:298/:316/:330/:338/:349/:356/:371` | `lengthPairing` 定义在此 |
| `lem:centralizer-character` | `Pairing.lean:14/:17/:36/:44/:61/:71/:107/:113/:168/:183/:196/:217` | 整文件即此引理 |
| `prop:braid-angle` | `Braids.lean:388 braid_forty_squared`、`:441 braid_forty_ratio` | 无除法形式 $143D^2\le57\ell(Z_3)^2$ |
| `eq:braid-centers-definition` | `:17 braidLoop`、`:21 braidCenter`、`:25 braidDelta` | 索引偏移：`braidCenter s n` = $Z_{n+1}$ |
| `lem:braid-centers` | `:29/:37/:44/:51/:63/:77/:83/:91/:110/:132/:142/:190/:208–:257/:272` | |
| 命题 3.1 证明主体 | `:281/:302/:316/:329/:347/:364/:380` | 递推 $R_r$ 未符号化，直接实例化 $n{=}17,19,20$ |
| `prop:triangle-obstruction` | `SixSector.no_strict_ratios`（被 `Main.lean:42` apply） | 六扇区条件的机器名 |
| `lem:orbit-control` | `Mirrors.lean`/`Detour.lean` 内的轨道界（$R,C$ 显式） | |
| `lem:mirror-action` | `Mirrors.lean`（118 行） | Digne 特化 |
| `lem:sector-data` | `SectorMetric.lean`（复嵌入、正定、角度） | |
| `lem:sector-maps` | `Grid.lean` + `Refinement.lean` + `SectorCharts.lean` | $C_0$ 显式 |
| `lem:outer-cap` | `Cap.lean` + `Detour.lean:528 d:=2*sqrt(1+r²−2cr)+r` | **改走环带绕行**（见 A-4.7） |
| `lem:triangular-presentation` | `Presentation.lean:145/:150/:160/:196` | `TriangleGroup` 独立类型 |
| `lem:link-girth` | `TriangleMesh.lean:209 six_turns_injective`、`:235 degree_at_least_six` | 置换代数替代情形分析 |
| `prop:sphere-counts` | `TriangleMesh.lean:45/:106/:150/:180` + `Folding.lean`(806) + `Wires.lean`(274) | 线性代数替代平面拓扑 |
| `lem:controlled-diagrams` | `WordDiagram.lean`(1088) + `Detour.lean:316 (22+4C+4E)` | 论文 $C_1=DL+R+1$ |
| `lem:projected-approximation` | `SectorCharts.lean`（$J$、$v_*$、$q_n$ 逼近） | |
| 绕数段 + 两性质 | `Winding.lean`(725) + `GridDisk.sum_index_boundary` | |
| `lem:localized-degree` | `Winding.lean:447` + `Detour.lean:286/:295` | |
| `def:matrix` | `Model.lean explicitMatrix` + `Adjacent/Distant/Sentinel/blockLetter` | 四个 if 分支 |
| `lem:pair-embeddings` | `Braids.lean:462–:642`（TokenState）+ `Presentation.lean:86/:119/:125/:178/:191` | |
| `lem:amalgam-normal-form` | **Mathlib `Monoid.PushoutI`**（`Embeddings.lean:7`） | 论文自证被替换 |
| `lem:common-centralizer` | `Embeddings.lean:671 main_common_centralizer`、`:683 triangleCentralizer_bijective` | 写成同构而非集合等式 |
| `lem:geometric-centralizer` | `Centralizer.lean:169 geometric_tupleCentralizer`（+`:113`） | $m$ 元组 = `ι → G`，`[Finite ι]` |
| 定理 1.1 证明 | `Main.lean:26 not_geometric`（逐字见 A-2.29） | |

### A-4.7 形式化未覆盖 / 与论文路径明显不同的部分（专项回答）

1. **平面拓扑 → 线性代数**：论文的"细正则邻域 + 生成树加厚 + 逐边界圆加盖 + Euler 公式"（命题 5.3 第 2 段）
   在机器里不存在；取而代之的是 `TriangleMesh.Exact`（`boundarySum.ker = coboundary.range`）
   与 `exact_euler_inequality`（用 `finrank` 推 $V-E+F\le0$）。
   ⇒ **机器没有使用"圆盘被properly嵌入折线分成两块"这一初等平面事实**，论文该句是纯几何论证。
2. **外盖帽 → 显式环带/绕行**：论文把 $\partial P$ 锥化到 $f_n(p_0)$（`lem:outer-cap` 第 4 步）；
   机器用 `Detour.lean`/`Cap.lean` 构造显式替代环带（`Replacement`、`GridDisk`），并给出
   $d=2\sqrt{1+r^2-2cr}+r$ 型的显式折线长界。⇒ 论文的"测地线连续依赖 ⇒ 锥化连续"在机器里被
   **组合式构造**替代（这是最难落地的步骤，`[推测]` 也是实际改动最大的一步）。
3. **边界类型有限族被显式数值化**：论文只说"只有有限多种边界类型"，最终 $C_1=DL+R+1$；
   机器给出 `22+4*C+4*E`（`Detour.lean:316`）与 `21+2*C`（`:100`）等显式组合，其中 $E$ 项在论文中**无对应符号**。
   ⇒ 论文常数与机器常数不可等同引用；笔记中必须分别标注来源。
4. **Serre 正规形未重证**（A-4.4），因此论文的"elementary proof records the exact form needed"
   在机器里由 Mathlib 的一般定理覆盖，`[推测]` 覆盖是否严格等价需在 Mathlib 源码核对（本机无 Mathlib 源码）。
5. **未覆盖的论文内容**：引言全部（问题背景、正例谱系、优先权声明）、全部历史注、
   BH 习题 I.8.4(1) 的"proper 冗余"论断（机器仍把 `ProperSpace` 当假设）、
   "no Artin-group asphericity theorem is an input"这一类元陈述、$\ell(g)=0\Leftrightarrow$ 有限阶的
   **群论侧**（机器有 `StableLength.lean:583`，但未讨论 $G$ 是否有挠）、
   辫子块在 $G$ 中的**几何性质**（机器只用到关系）。
6. **未覆盖的数学对象**：$T$ 自身的 CAT(0)/双曲性、$M$ 的最优性、9 生成子复形 $\mathcal K$ 的
   非正曲率（论文也未声称）、$G$ 的类型/有限 $K(\pi,1)$。⇒ 与 A-3.6 的"论文未述清单"高度重合。
7. `[事实]` `ComparatorChallenges/ArtinCAT0.lean` 与 `Model.lean` 的定义**逐字相同**（复制式），
   ⇒ 题目文件不构成对定义的第二种理解，只构成对定理语句的独立复写（这是比较器的常规做法）。

### A-4.8 仓库侧的一手范围声明（`docs/254.md`）

`[逐字]` 该文档标题："Classifying spaces and geometric obstructions for Artin groups"，
覆盖**三篇同日论文**（Harmonic heights / An Artin group with no geometric CAT(0) action / Parabolic intersections）。
本篇部分逐字：
> "The geometric-action question asks whether every Artin group acts properly and cocompactly by isometries
> on a proper CAT(0) space. The formalized result gives a counterexample: an Artin group defined by a symmetric
> matrix on $116$ generators, with diagonal entries $1$ and off-diagonal entries in $\{2,3,\infty\}$.
> It admits no such action on any nonempty proper CAT(0) space, in any dimension."

比较器链接表逐字给出 `ArtinCAT0.lean` 为本篇的 Comparator statement。
`[分析]` 这是仓库方对"机器结论是什么"的官方口径，与 A-4.1 的 `main` 四合取一致；
其中"with diagonal entries 1 and off-diagonal entries in {2,3,∞}"正是 `main` 的第二、三个合取支。

### A-4.9 未核实事项（本篇 Lean 侧）

1. **无法确认整个目录可编译**：本工作区无 `.lake/build` 产物，未运行 `lake build`（耗时且非本次任务要求）。
2. **无法运行 `#print axioms OAI.ArtinCAT0.main`** ⇒ permitted_axioms 三项是**配置声明**，
   不是实测的 axiom 依赖集；实际是否只用这三项，需在有 Mathlib 缓存的环境中复核。
3. **Mathlib 版本**：`lean-toolchain = leanprover/lean4:v4.34.1`；`lake-manifest.json` 中 mathlib rev
   `d13f23b723b8…`（42 个包）——本机无 Mathlib 源码，故 `Monoid.PushoutI`、`Transversal`、`ProperSpace.of_isClosed`
   的**确切语义**（尤其 `PushoutI` 的 amalgam 是否与论文引理 7.3 的三条断言逐字等价）未经核对。
4. `MetricSpace` 是否隐含完备性（关系到 A-2.2 中"空间 proper/完备"的层级）未核对；
   `[推测]` Mathlib 的 `MetricSpace` 不假设完备，但 `ProperSpace` + 闭球紧在论文语境下给出等价效果。
5. 姊妹论文目录 `typst/`（`main.typ`、`fig/`）未逐行核对 ⇒ 若其中有与 tex 不同的措辞，本素材未知。
6. `formalization.yaml` 的 `status.scope: "Partial progress."` 是**仓库级**字段
   （第 914–917 行，统领 185 条 main_results、162 篇论文），**不是**对本篇的单独评级；
   `[纠正]` 早期会话曾把它当作本篇状态，本笔记予以更正。

---

## A-5 常数与参数总表（Artin 篇）

**口径说明**
1. "值"列一律逐字取自 `build/sections/*.tex` 或 `E:/math/lean/OAI/GroupTheory/ArtinCAT0/*.lean`，
   行号即实测位置；无行号者为本笔记前文（A-2/A-4）已核对过的表达式。
2. "动了会坏在哪"列：标 `[机械理由]` 的是能从 tex/Lean 文本直接落地的因果；
   标 `[分析]` 的是本人按已核公式做的代入/求解（论文未写）；标 `[推测]` 的是无法在文本中闭环的猜想。
3. 本表不含论文未出现的"最优性"断言：论文从未说 116、$k=20$、$\ge6$ 是极小值（见 A-3 论文未述清单）。

### A-5.1 构造层：群的规模与 Coxeter 型标签

| 符号 | 值（逐字） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| $\|S\|$ | `116`，`assembly.tex:44` 逐字 `\|S\|=5+3\cdot37=116` | 定理 1.1 的"116 生成子"（`introduction.tex:61` `thm:main`；`assembly.tex:422` "The $116$-generator Artin group $A_M$"）；Lean `Model.lean:5` `abbrev Letters := Fin 116` | `[机械理由]` 116 不单独承重，承重的是分解 $5+3\cdot37$：$5$ = 三角核 $a,b,c$ 加哨兵 $d,e$，$3\cdot37$ = 三块各 37 个私有字母。私有字母少于 37 时 $B_{40}$ 关系凑不出，$k=20$ 的算术（见 A-5.2）失去输入。 |
| 每块私有字母数 | `37`（$j=3,\ldots,39$，`assembly.tex:14` 逐字 `\{s_j^{uv}:(u,v)\in\mathcal E,\ 3\le j\le39\}`） | 把每块撑成 39 个生成子 ⇒ 抽象辫子群 $B_{40}$（`assembly.tex:207`） | `[机械理由]` 37 的下界来自 $k=20$：需 $2k-1=39$ 个标准生成子，减去共用的 $s_1,s_2$ 恰为 37。`[分析]` 若取论文阈值的最小 $k=14$（见 A-5.2 末行），则 $2k-1=27$、私有 $=25$、总数 $5+3\cdot25=80$；论文未做此优化。 |
| 每块总生成子 | `39`（`assembly.tex:23` 逐字 `In each block $\{s_1^{uv},\ldots,s_{39}^{uv}\}$`） | 命题 3.1 假设 "$s_1,\ldots,s_{39}$ satisfying the $B_{40}$ relations"（`braids.tex:12`）；Lean `Braids.lean:388` `BraidRelations 39 s` | `[机械理由]` 39 与 40 是同一事实的两种计数（$B_l$ 用 $l-1$ 个生成子）；Lean 里写成 `39` 是因为 `BraidRelations (m : ℕ)` 参数是生成子个数，结论阈值 $N_r$ 需 $r\le 2k=40$ ⇒ 索引到 $s_{39}$。 |
| 块数 / 初始对 | `3`，$\mathcal E=\{ab,bc,ca\}$（`sectors.tex:5`、`assembly.tex:214–216` 逐字 `((T*_{B_3^{ab}}B_{40}^{ab})*_{B_3^{bc}}B_{40}^{bc})*_{B_3^{ca}}B_{40}^{ca}`） | §5 的六扇区（$2\times3=6$ 个扇区，`sectors.tex:150` `lem:sector-data` "Each of these six seminorms"）；§6 迭代 amalgam | `[机械理由]` 三块是"三角"要求的：扇区圆盘要按 $a^2,z_{ab},b^2,z_{bc},c^2,z_{ca},a^2$ 闭合（`eq:ray-order`，`sectors.tex:155`）。两块则射线序不闭合，$\Omega<2\pi$ 无定义；四块以上论文未证。 |
| 三角核 $T$ | $\langle a,b,c\mid aba=bab,\ bcb=cbc,\ cac=aca\rangle$（`sectors.tex:5` 逐字） | 引理 4.1（`lem:orbit-control`）、§5 全部、引理 7.3 的 $G_0$ 骨架 | `[机械理由]` 三条长度 3 的关系给出 Digne 坐标里的"等边三角形三边反射"（`sectors.tex:74`）；关系少一条则只剩两条镜线，反射群无限、$L_{uv}$ 的"第三条镜线 $D_{uv}$"（`sectors.tex:97`）不存在。 |
| 对角标签 | `1`（`assembly.tex:10` `def:matrix`；`Model.lean` `if s = t then 1`） | `thm:main` 第二合取支 `main.2.1`；Artin 群定义要求 $m_{ss}=1$ | `[机械理由]` 改成别的值则不再是 Coxeter 型矩阵，`artinRelators` 的 $s^2$ 型关系消失，$\ell(s_i^2)=D$ 的归一化（`eq:braid-shift` 推论）断裂。 |
| 非对角标签集合 | $\{2,3,\infty\}$（Lean `⊤ : WithTop ℕ`，`Model.lean` `Label := WithTop ℕ`；`main.2.2` 逐字 `= 2 ∨ = 3 ∨ = ⊤`） | 定理 1.1 的"off-diagonal entries in {2,3,∞}"（`docs/254.md` 同句） | `[机械理由]` `explicitMatrix` 的四分支（`:1`/`Adjacent→3`/`Distant∨Sentinel→2`/`else ⊤`）是**穷尽且互斥**的：`main.2.2` 只允许三种值，若允许 4 则 $B_{40}$ 关系不再由"标签 3"提供，辫子估计无从引用。 |
| $m_{de}$ | $\infty$（`assembly.tex:46` 逐字 `In particular $m_{de}=\infty$, and neither $d$ nor $e$`） | 引理 5.1（`lem:common-centralizer`，`assembly.tex:241`）：$C_G(d)\cap C_G(e)=T$ | `[推测]` 失败路线 1：若 $m_{de}=n<\infty$，$d,e$ 生成有限二面体型 Artin 子群，其共同中央子群会带入额外元素，$T$ 不再是交集 ⇒ `geometric_tupleCentralizer` 的 $=$ 变 $\supseteq$，$G_0*_T(T\times F(d,e))$ 的正常形不再唯一。证据来源：`assembly.tex:241–298` 的证明只用到"$d$ 与 $e$ 之间无关系"。 |
| $m_{qu}$（哨兵对 $a,b,c$） | `2`（Lean `Distant s t ∨ Sentinel s t then 2`；`Sentinel` = `s.val = 3 ∨ s.val = 4` 且 `t.val < 3`） | 引理 5.1 中 $d,e$ 与 $a,b,c$ 交换 ⇒ 共同中央子群包含 $T$ | `[机械理由]` 标签 2 是"$d$ 与 $a$ 交换"的唯一实现；改成 3 会引入 $dad=ada$，$C_G(d)$ 缩小到不含 $a$ 的程度，$T\subseteq C_G(d)\cap C_G(e)$ 反向包含即失败，后续 $T\times F(d,e)$ 不成立。 |
| $F(d,e)$ | 自由群 on $\{d,e\}$（由 $m_{de}=\infty$） | 引理 5.2（`lem:geometric-centralizer`，`assembly.tex:298`）与 §6 的 $G\cong G_0*_T(T\times F(d,e))$ | `[分析]` 需要一个**非循环**自由群来让"轨道在 $d,e$ 方向分离"，单生成元的 $\mathbb Z$ 不够；具体论文用法见 A-2 §6 块。 |
| $G_0$ | `((T*_{B_3^{ab}}B_{40}^{ab})*_{B_3^{bc}}B_{40}^{bc})*_{B_3^{ca}}B_{40}^{ca}`（`eq:iterated-amalgam`，`assembly.tex:212`） | 引理 5.4 / 定理 1.1 的 $G_0$ 侧 | `[机械理由]` 三层嵌套（非三块并列）是引理 7.3（`lem:amalgam-normal-form`，`assembly.tex:143`）归纳结构的直接产物；并列写法需额外的三方 amalgam 引理，论文没有。 |

### A-5.2 辫子层：$k=20$ 的全部算术

| 符号 | 值（逐字/位置） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| $l=2k$ | $k=20$，`braids.tex:104` 附近 "We retain $l=2k$ with $k\ge3$ until the final arithmetic, where $k=20$" | 命题 3.1（`prop:braid-angle`，`braids.tex:12`）证明的两段式参数化 | `[机械理由]` $l$ 必须是偶数：$k$ 个两两交换的平方 $s_1^2,s_3^2,\ldots,s_{2k-1}^2$ 与"前后两半块"的 $Z_k,Z_k'$ 都要落在索引 $\le l-1$ 内。 |
| $L_1,L_j,Z_r,N_r$ | $L_1=1,\ L_j=s_{j-1}L_{j-1}s_{j-1},\ Z_r=L_1\cdots L_r,\ N_r=\binom r2$（`eq:braid-centers-definition`，`braids.tex:35`） | 引理 3.2（`lem:braid-centers`，`braids.tex:41`）全部；中心配对 `eq:braid-central-pairing` | `[机械理由]` $N_r=\binom r2$ 是 $Z_r$ 的正字母数之半（"$2N_r$ letters"）；$L_j$ 有 $2(j-1)$ 个字母 ⇒ $\ell(Z_r)^2=2N_r\alpha$。字母数一变，$\alpha$ 归一化即错。 |
| $Z_2,Z_3$ | $Z_2=s_1^2,\ Z_3=(s_1s_2)^3$（`lem:braid-centers` 内式） | 结论比值的分子/分母：$\ell((s_1s_2)^3)/3\ell(s_1^2)$ | `[机械理由]` $N_3=3$ 是分母里的 3；若 $\delta$ 共轭索引差一，$Z_3$ 变 $s_1^3$ 型元素，`eq:braid-central-pairing` 的 $i<r$ 条件即破。 |
| $\delta$ | $s_1\cdots s_{l-1}$，$\delta s_i\delta^{-1}=s_{i+1}$（`eq:braid-shift`，`braids.tex:48`） | 三处：所有平方等长 $D$；把 $(s_1,s_{j-i+1})$ 送到 $(s_i,s_j)$（`eq:nonadjacent-pairing`）；把 $Z_k$ 送到 $Z_k'$ | `[机械理由]` `braids.tex` 逐字提醒 "Every successive use of \eqref{eq:braid-shift} has index at most $l-2$" ⇒ 该式只对 $i\le l-2$ 成立，索引上界被用到极限；$l$ 再小一次就不能同时完成"配对平移"和"半块平移 $k$ 步"（后者最大用到 $2k-2$）。 |
| $\langle s_i^2,Z_r\rangle$ | $=\ell(Z_r)^2/N_r$（`eq:braid-central-pairing`，`braids.tex:52`，$2\le r\le l,\ 1\le i<r$） | §5 扇区角的分子：$\langle U,H\rangle=\ell(H)^2/3$（`sectors.tex:186`，$r=3$） | `[机械理由]` 该式对 $\ell(Z_r)=0$ 也成立（论文逐字 "including when $\ell(Z_r)=0$"）⇒ 不存在除零风险；但 $\alpha$ 的"相邻辫子关系取值相等"一步依赖配对的双线性与不变性（`lem:centralizer-character`）。 |
| $D$ | $D=\ell(s_1^2)>0$（`prop:braid-angle` 假设；`lengths.tex:86` 的 $D=\inf_x d(x,gx)$ 是同名不同物） | 全部归一化：$R_r=\ell(Z_r)^2/(N_r^2D^2)$、$c_0=\langle s_1^2,s_3^2\rangle/D^2$ | `[机械理由]` 假设 $\ell(s_1^2)>0$ 是**唯一入口**：若为 0 则 $D=0$、$R_r,c_0$ 无定义。`[分析]` 这正是引理 4.1 反证结构要排除的情形之一——论文用"比值 $>1/2$"去否定"$\ell(H)=0$"型退化。 |
| `eq:braid-recursion` | $N_rR_r=1+(r-2)(3R_3-1)+\binom{r-2}{2}c_0$（`braids.tex:154`，$3\le r\le 2k$） | 把 $r=k$ 代入后得 $3R_3$ 的下界 | `[机械理由]` 系数 $\binom{r-2}{2}$ 来自"$j\ge3$ 的 $L_j$ 各贡献 $(j-3)c_0$"求和；$\langle g,L_j\rangle=(3R_3-1+(j-3)c_0)D^2$。论文逐字保留 $L_3$ 不展开："this calculation does not expand the noncommuting $s_2$-letters inside $L_3$"——一旦展开，$c_0$ 计数会重复。 |
| $c_0\ge-\frac1{k-1}$ | $=-1/19$（`eq:lower-cross-pairing`，`braids.tex:166`） | 递推式里 $c_0$ 的下界 | `[机械理由]` 来自 $k$ 个交换平方之积的非负性：$kD^2+k(k-1)c_0D^2\ge0$。Lean 侧同一事实写作 `0 ≤ 20*q + 380*v`（`Braids.lean:392 hodd`），其中 $380=k(k-1)=20\cdot19$；$k$ 变则两个数同时变。 |
| $R_k\ge c_0$ | （`eq:disjoint-centers`，`braids.tex:193`） | 消去未知 $R_k$ | `[机械理由]` 证明用两次不同特征标展开得 $\langle Z_k,Z_k'\rangle=N_k^2c_0D^2$，再由 $\ell(Z_k(Z_k')^{-1})^2=2N_k^2D^2(R_k-c_0)\ge0$。因子 $1/4$（逐字 "the factor $1/4$ follows by bilinearity"）来自 $(2N_k)^2$ 与 $x_p^2,y_q^2$ 的平方归一；丢掉它则 $c_0$ 被低估 4 倍。 |
| $N_k-\binom{k-2}{2}$ | $=2k-3$（`braids.tex:196` 附近逐字），$k=20$ 时为 $37$ | 递推代入 $r=k$ 后的合并 | `[机械理由]` $\binom{20}{2}-\binom{18}{2}=190-153=37$。**注意**此 37 与构造层的私有字母数 37 数值相同但来源独立（前者 $=N_k-\binom{k-2}{2}$，后者 $=2k-2$）；`[分析]` 两者都等于 $2k-3$/$2k-2$ 型表达式，故 $k$ 一改两处同时改——论文未指出这一巧合。 |
| $3R_3\ge1-\frac{3k-4}{(k-1)(k-2)}$ | `braids.tex:197–201` 两行不等式链 | 最终算术的母式 | `[机械理由]` 第二步用的正是 $c_0\ge-1/(k-1)$；符号要求 $2k-3$ 前系数为正（$k\ge3$）。$k$ 若 $\le2$ 则 $\binom{k-2}{2}$ 与分母 $k-2$ 同时失效。 |
| $3R_3$ | $\ge1-\frac{56}{342}=\frac{143}{171}$（$k=20$ 逐字） | 命题 3.1 结论 `eq:braid-angle-bound` | `[机械理由]` $56=3k-4$、$342=(k-1)(k-2)=19\cdot18$。 |
| $R_3$ | $\ge\frac{143}{513}>\frac14$（同上；$513=3\cdot171$） | `eq:braid-angle-bound`：$\bigl(\ell((s_1s_2)^3)/3\ell(s_1^2)\bigr)^2\ge143/513$ | `[机械理由]` $143/513>1/4\iff572>513$（$4\cdot143=572$）。Lean 逐字把这条换算做在整数侧：`Braids.lean:437 hraw : 572*q ≤ 57*stableLengthAt x (braidCenter s 2)^2`，最后 `norm_num` + `nlinarith` 收尾；$572=4\cdot143$ 的 4 来自 $q=\ell(s_0)^2$ 与 $D=\ell(s_0^2)=2\ell(s_0)$ 的差（$\ell(g^m)=m\ell(g)$，`eq:length-powers`）。 |
| 比值 | $>1/2$，且 $=\ell((s_1s_2)^3)/(3\ell(s_2^2))$（`prop:braid-angle` 内式） | §5 扇区角：$\cos\theta=\ell(H)/(3\ell(U))>1/2$（`sectors.tex:190` `eq:sector-angle`） | `[机械理由]` 这是全篇唯一的"数值 $\to$ 几何角度"接口：$>1/2$ 才给出 $\theta<\pi/3$，进而 $6$ 个扇区总角 $\Omega<2\pi$，才有盖帽的 $\sin(\Omega/4)<1$。$\sqrt{1/4}=1/2$，故 $143/513$ 只需**严格**超过 $1/4$；`[分析]` 阈值 $k\ge14$：要求 $\frac{3k-4}{(k-1)(k-2)}<\frac14\iff k^2-15k+18>0$，$k=14$ 时 $38/156\approx0.2436<0.25$，$k=13$ 时 $35/132\approx0.2652>0.25$ 失败 ⇒ 论文取 20 有约 6 的余量（论文未解释）。 |
| Lean 侧 20/19/17/306/380 | `hodd 0 ≤ 20*q + 380*v`；`hpc₁₉` 取 `n := 17`；`hQ₁₉` 展开为 `380*(2*q + β + 17*β + 306*v)`；`lengthPairing_disjoint_centers (n := 19) (k := 19) (α := v)`（`Braids.lean:392–437`） | 机器里 $k=20$ 的显式实例化 | `[机械理由]` $306=17\cdot18=\binom{18}{2}\cdot2$ 型系数由 `braid_center_character` 的 $(n)(n+1)$ 项生成；$380=2N_{20}=2\binom{20}{2}$ 是 $Z_{20}$ 的字母数；`19` 是 0-索引下 $k-1$。全部以字面量写死，`[分析]` 改 $k$ 需同时改五处字面量并重新保证 `omega`/`norm_num` 侧的索引不等式（`hn : n+2 ≤ m` 即 $r\le l$）。 |
| `SelectedPositions` | `{s : Finset ℕ // s.card ≤ 3}`（`Braids.lean:462`） | 辫子字不变量的"至多同时追踪 3 个位置" | `[分析]` 上界 3 与 §4 三价/三角结构同步（论文无对应物）；`[推测]` 放到 4 会破坏 `swapPositions` 归纳时的分情形闭合，未见机器验证。 |

### A-5.3 长度层：CAT(0) 通用工具里的数值

| 符号 | 值（逐字/位置） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| 中点比较 | `eq:midpoint-comparison`（`lengths.tex:23`）由 `eq:distance-convexity`（`:18`）取 $t=\tfrac12$ 得 | 引理 2.1（`lem:comparison`，`:14`）；`eq:quadrilateral`（`:28`）的前置 | `[机械理由]` `eq:quadrilateral` 的证法逐字用 "$d(q,s)^2\le2d(q,m)^2+2d(s,m)^2$"（`:49`，即 $(A+B)^2\le2A^2+2B^2$）。系数 2 是**凸平方法**的产物；若改用中点距离的一次版（不带平方），后续所有 $\ell^2$ 二次型论证（`eq:parallelogram`）不再成立。 |
| 四边形不等式 | `eq:quadrilateral`（`lengths.tex:28`） | 两处：半单性（`lem:semisimple`，`:74`）与平行四边形不等式 `Q(u+v)+Q(u-v)\le2Q(u)+2Q(v)`（`:163`，由四点循环代入 + 除 $n^2$ 取极限，`:156–163`） | `[机械理由]` 它是"从点态几何到二次型"的唯一通道；论文逐字写明四点的循环顺序（"in that cyclic order"），换序即失去正确的符号。 |
| 稳定长度 | $\ell(g)=\lim d(o,g^no)/n$（`eq:stable-length`，`:59`），$\ell(g^m)=m\ell(g)$（`eq:length-powers`，`:68`） | 全篇分母/归一化；Lean `stableLengthAt` | `[机械理由]` 存在性靠次可加性 + "$\limsup a_n/n\le a_k/k$ for every $k$"（`:61–64`）。$m$ 次幂的线性性正是 A-5.2 中 $572=4\cdot143$ 那个 4 的来源。 |
| 最小位移 | $D=\inf_x d(x,gx)$（`:86`）；$\ell(g)=D$ 且取到（`lem:semisimple`）；$D=0$ 时极小点被固定、稳定化子有限（`:115`） | 中央子群特征标引理的 Busemann 构造 | `[机械理由]` "proper ⇒ 闭球紧 ⇒ 下水平集取到"是**唯一**用到 properness 的地方（另一次在 `eq:orbit-control` 的紧饱和）。若空间不完备/不 proper，半单性失效，$\ell$ 与 $D$ 分离，$b(z)$ 的极限构造断链。 |
| 配对 | $\langle g,h\rangle$ 由 `eq:pairing-definition`（`:135`）给出；平行四边形恒等式 `eq:parallelogram`（`:168`）+ 极化 | 交换族上 $\ell^2$ 半正定二次型；`lem:commuting-form`（`:126`）；文献支撑逐字引 `\cite[Theorem~14.6]{Rodenhausen2013}`（`:122`） | `[机械理由]` 系数 $\tfrac12$（极化）决定 A-5.2 里 "factor $1/4$" 的位置；半正定性给 $\ge0$，是 $c_0\ge-1/(k-1)$、$R_k\ge c_0$ 两条约束的符号来源。 |
| Busemann 漂移 | $b(z)=\lim(d(z,g^nx)-nD)$（`:213`），$1$-Lipschitz（`:216`） | `lem:centralizer-character`（`:193`）：$D\chi(h)=\langle g,h\rangle$ | `[机械理由]` 证明逐字"Dividing the inequality by $2nD$"（`:229`）⇒ 必须 $D>0$；再以 `eq:busemann-difference`（`:230`）在 $z=kx,w=x$ 处取值（`:234`）。$D=0$ 时整个特征标不存在。 |

### A-5.4 扇区层：把 $>1/2$ 变成 $\Omega<2\pi$

| 符号 | 值（逐字/位置） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| $R,C$（轨道控制） | `R,C<\infty`，$Ty$ 是 $R$-dense，$d_T(s,t)\le C(1+d_Y(sy,ty))$（`eq:orbit-control`，`sectors.tex:49–50`） | 引理 4.1（`lem:orbit-control`，`:46`）；后续 $M$、$C_1$、$\eta n/(2C)$ 全依赖 $C$ | `[机械理由]` 证明给出 $C$ 的具体取法：紧饱和 $R=\max_{p\in K}d(y,p)$；测地线分成 $N=\max(1,\lceil L\rceil)\le L+1$ 段；增量满足 $d(y,qy)\le2R+1$；"$C$ = 这些增量的最大字长、并放大到至少 1"。$R$ 一变，$2R+1$ 与 $M$ 同步变；$C\ge1$ 的下放会破坏 $+1$ 的合并。 |
| $2R+1$ | 同上（`:60`） | 有限增量集合 ⇒ properness 生效；亦进入 `eq:bounded-edge-word`（`diagrams.tex:297`）的前提 $d_Y(sy,ty)\le2R+1$ | `[机械理由]` 每段长 $\le1$、两端各偏移 $\le R$ ⇒ $2R+1$；$\lceil L\rceil$ 的 $+1$ 保证 $N\ge1$。 |
| $L_u,\ L_{uv}$ | $L_u=2e_{D_u},\ L_{uv}=2(e_{D_u}+e_{D_v}+e_{D_{uv}})$（`eq:mirror-translations`，`sectors.tex:97`） | 扇区坐标 $v_*(\lambda,\mu)=\lambda L_u+\mu L_{uv}$（`eq:separating-coordinates`，`:161`）；正定性检验 | `[机械理由]` 因子 2 = "两次反射的平移部分是镜线距离的两倍"（`u\cdot\xi=e_{D_u}+r_u\xi`，`:88`）；$D_{uv}$ 是 $D_u\cap D_v$ 处的**第三条**镜线（`:99` 逐字 "distinct from one another and from $D_a,D_b,D_c$"），少了它三个扇区无法在 $\Vert\cdot\Vert_1$ 下区分。 |
| $\Vert\cdot\Vert_1$ | $E=\bigoplus_{D\in\mathcal D}\mathbb Re_D$ 上的 $\ell^1$（`sectors.tex` 约 `:78`） | `eq:mirror-lipschitz` $\Vert V(t)-V(s)\Vert_1\le d_T(s,t)$（`:92`）；$\eta$ 的定义 | `[机械理由]` 用 $\ell^1$ 而非 Hilbert 范数是因为仿射等距作用在基向量置换下**恰好**是 1-Lipschitz；换范数则 `eq:sector-data` 的不等式 $\Vert iL_u+jL_{uv}\Vert_1\le C\Vert(i,j)\Vert_{U,H}$（`:175`）需重证。 |
| 扇区角 $\theta$ | $\cos\theta=\frac{\langle U,H\rangle}{\ell(U)\ell(H)}=\frac{\ell(H)}{3\ell(U)}>\frac12\Rightarrow0<\theta<\pi/3$（`eq:sector-angle`，`:189–152`；正定性 `:193` 保证 $\cos\theta<1$） | `lem:sector-data`（`:150`）六条射线 $a^2,z_{ab},b^2,z_{bc},c^2,z_{ca},a^2$ 的圆序 | `[机械理由]` $\langle U,H\rangle=\ell(H)^2/3$ 是 `eq:braid-central-pairing` 在 $r=3$（$N_3=3$）的实例（`:184–186`），而 $\ell(U)=\ell(u^2)$、$\ell(H)=\ell(z_{uv})$；因此 $>1/2$ 完全继承 A-5.2 的 $143/513>1/4$。若比值只 $\ge1/2$（非严格），$\theta\le\pi/3$ 仍可，但 $\Omega<2\pi$ 变 $\Omega\le2\pi$，盖帽的 $\sin(\Omega/4)<1$ 立即失效。 |
| $\Omega$ | 总角 $0<\Omega<2\pi$（`lem:sector-data`，`:158`），参数化为"半径 $r\ge0$ + 周期 $\Omega$ 的循环角，$r=0$ 处所有角粘合"（`:198–200`） | `eq:strict-ratios`（`prop:triangle-obstruction`，`:13`）的反证核心 | `[机械理由]` $6$ 个 $\theta<\pi/3$ 相加 $<2\pi$；这是"扇区数 6"与"角阈值 $\pi/3$"的**配对约束**——两者任一变动（四扇区/直角阈值）都不再自动给 $\Omega<2\pi$。 |
| $t_n$，$C_0$ | $t_n(p)=U^{\lfloor n\lambda\rfloor}H^{\lfloor n\mu\rfloor}$（`eq:sector-label`，`:236`）；$d_Y(f_n(p),t_n(p)y)\le C_0$（`eq:grid-error`，`:244–245`，"$C_0$ independent of $n,p$"） | 一致渐近映射（`lem:sector-maps`，`:241`）；$V(t_n(p))/n\to v_*(p)$（`eq:sector-convergence`，`:248`） | `[机械理由]` 取整误差 $\le1$ 个指数单位，经 `eq:mirror-lipschitz` + `eq:orbit-control` 折成绝对常数；共用的 $C_0$ 逐字要求 "common $C_0$"（`:278`）。$C_0$ 依赖作用与 $y$，**不依赖 $n$** 是后续矛盾的量词关键。 |
| $\delta$ | 存在 $\delta>0$，$d_Y(f_n(A_1),f_n(A_2))\ge\delta n$（`eq:region-separation`，`:260`） | 与 $2C_1$ 对撞（`lem:localized-degree`，`localization.tex:158`） | `[机械理由]` $\delta$ 来自区域分离，$\eta n/(2C)-1-2C_0$ 增长无界是其正比来源；$\delta n$ 的**线性**增长是与 $C_1$ 常数矛盾的全部本钱。 |
| $\eta$ | $\eta=\min_{p\in A_1,q\in A_2}\Vert v_*(p)-v_*(q)\Vert_1>0$（`:314`），$\Vert V(t_n(p))-V(t_n(q))\Vert_1\ge\eta n/2$（`:317`），$d_Y(sy,t_n(p)y)$ 与 $d_Y(sy,t_n(q)y)$ 之差 $\ge\frac{\eta n}{2C}-1-2C_0$（`:322`，"Decreasing the positive coefficient proves" `:324`） | `lem:sector-maps` 末段 | `[机械理由]` $\eta/2$ 的 $1/2$ 来自收敛（`:256`）的"充分大 $n$"；$\frac{1}{2C}$ 是 `eq:orbit-control` 的除 $C$；两个 $-1,-2C_0$ 分别来自 $\lceil\cdot\rceil$ 的 $+1$ 与两端网格误差。三处任一处放大只影响 $n$ 的阈值，不影响结论。 |
| $\epsilon$ | 盖帽半径 $\epsilon n$：$\epsilon=\tfrac12(1-\sin(\Omega/4))>0$（`lem:outer-cap`，`:329`、`:373`）；局部化用 $\min(\epsilon/3,1/4)$（`eq:small-patch`，`localization.tex:33`） | `prop:triangle-obstruction` 的两区域分离（`:168` "$\epsilon n$"、`:171` "$(\epsilon/3)n+o(n)$"） | `[机械理由]` 链条：$\phi\le\Omega/2<\pi$ ⇒ 弦长 $2\sin(\phi/2)\le2\sin(\Omega/4)$ ⇒ `eq:boundary-short` $d_Y(f_n(p),f_n(p'))\le2\sin(\Omega/4)n+o(n)$；锥化后逐字用三角不等式 $\max\{d(y,A)-d(A,q),d(y,B)-d(q,B)\}\ge\frac{d(y,A)+d(y,B)-d(A,B)}2$，两端距离 $n+o(n)$ ⇒ $\ge(1-\sin(\Omega/4))n-o(n)$ ⇒ 再取一半吸收 $o(n)$。**$\frac12$ 只为吞掉 $o(n)$**，$\epsilon/3$ 的 3 只为与 $B'\subset\mathrm{int}B$ 的三层包含留出余量。`[分析]` 只要 $\Omega<2\pi$ 就有 $\sin(\Omega/4)<1$，故 $\epsilon>0$ 的严格性完全承重在 $\Omega<2\pi$。 |
| 七段 | "The chord therefore splits into at most seven single-sector pieces"（`:348`） | `eq:boundary-short` 的逐段估计 | `[机械理由]` 六扇区展开后弦线最多横穿 6 个单扇区，加上"含两端点的扇区可能在两个末端各出现一次"（`:346–347`）⇒ $6+1=7$。`[分析]` 段数只需**有限**即可套用一致估计，7 不是最优常数；论文未声称最优。 |

### A-5.5 图示与局部化层

| 符号 | 值（逐字/位置） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| $\mathcal A$ | `nine generators`（$a,b,c$ + 三块的 $x_{uv},h_{uv}$，`diagrams.tex:42` 附近）；关系 $x_ix_{i+1}=h$（$i=1,2,3$，模 3，`eq:triangle-relations`，`:27`） | 引理 4.2（`lem:triangular-presentation`，`:22`）：消去私有生成子后回到 $T$ | `[机械理由]` 证明只用两条关系得 $h=x_1x_2$、$x_3=x_2^{-1}x_1x_2$，代回第三条即 $x_1x_2x_1=x_2x_1x_2$；三条关系缺一不可（两条时自由度过剩）。 |
| $\mathbb Z$-化 | $a,b,c\mapsto1$，$x_i\mapsto1$，$h\mapsto2$（`:51–53` 逐字） | 保证三角三面顶点 $g,gx_i,gh$（`eq:triangle-vertices`，`:49`）互异 | `[机械理由]` $h$ 的值必须是 $1+1=2$ 而非 $1$，否则 $gh=g x_i$ 型重合，"every target triangle has three distinct sides and three distinct corners" 失守，后续度数/符号论证（$\eta_\tau\in\{1,-1\}$）瓦解。 |
| link | 顶点 $q^+,q^-$（$q\in\mathcal A$，$18$ 个）；每块是"theta graph with three internally disjoint paths of length three from $h^+$ to $h^-$"（`:80`），三条显式路径（`:82–86`），"Its nine link edges are distinct"（`:88`）；跨块仅三条边 $\{a^-,b^+\},\{b^-,c^+\},\{c^-,a^+\}$（`:91–95`） | 引理 4.3（`lem:link-girth`，`:64`）：无长度 $<6$ 的回路（含平行边） | `[机械理由]` 三块只在 $a,b,c$ 的带符号方向相交（`:89`）；$C_1,C_2,C_3$ 三个 theta 的具体路径顺序就是后面 $k=3$ 情形距离表的来源。 |
| girth 三种情形 | $k=2$：块内距离 three ⇒ "the circuit has length at least six"；$k=3$：同号 $2+2+2$，异号 $1+3+2=6$（`:118`）；$k\ge4$：$2k-\lfloor k/2\rfloor\ge6$（`:126`） | 引理 4.3 收尾；$C(6)$ 条件 | `[机械理由]` "$\deg\ge6$" 是 Gersten 型 Euler 矛盾的必要输入。`[分析]` 并对本笔记早期写法作 `[纠正]`：$3F=2E\Rightarrow F=\tfrac23E$，故 $V-E+F=V-\tfrac E3$；若 girth $\ge m$ 则 $V\le\tfrac{2E}{m}$，于是 $V-E+F\le E\bigl(\tfrac2m-\tfrac13\bigr)$，右端 $\le0$ **当且仅当 $m\ge6$**（$m=5\to+E/15$、$m=4\to+E/6$、$m=3\to+E/3$，均与 $V-E+F=2$ 不相冲）⇒ $6$ 是这条计数论证的**临界值**而非松取值；论文取 $\ge6$ 与引用文献（Gersten）口径一致，`[推测]` 论文未讨论 $m<6$ 时可否用别的输入补救。 |
| $M$ | 取整数 $M$ 使 $d_Y(sy,ty)\le2R+1\Rightarrow d_T(s,t)\le M$（`eq:bounded-edge-word`，`diagrams.tex:297`） | 引理 4.4（`lem:controlled-diagrams`，`:275`）：边路径长 $\le M+6$，面边界 $\le3(M+6)$ | `[机械理由]` "$+6$ = 每条选定路径两端各加三个常数步"（`:311–312` 逐字 "Add three constant steps at each end"）；面边界是三条边 ⇒ $3(M+6)$。边界字母表 $\{a^{\pm1},b^{\pm1},c^{\pm1},1\}$（`:322`）有限 ⇒ "finitely many such boundary types"，$L$ 的有限性由此而来。 |
| $D$（图示层） | $D=\max\{d_Y(y,ay),d_Y(y,by),d_Y(y,cy)\}$（`:301`） | $C_1=DL+R+1$ | `[机械理由]` 名字与 §2 的 $D=\ell(g)$ 冲突但作用域分离；$DL$ 是"$D$-倍字长 $L$ 的位移"。 |
| $L$ | 所有填充中出现的标签的最大 $d_T(1,s)$（`:410–414`），逐字 "It is chosen once and does not depend on $f$" | 同上 | `[机械理由]` 依赖"私有生成子是 $a,b,c$ 的字"（`:413`），即三角呈现的消去性；否则 $L$ 无限。 |
| $C_1$ | $C_1=DL+R+1$（`:427`），$d_Y(sy,f(p))\le C_1$（`eq:all-points-control`，`:284`），逐字独立于 $f$ 与其模数（`:287`） | 局部化 $2C_1$ 与 $\delta n$ 的对撞 | `[机械理由]` 三段三角不等式 $d_Y(sy,s_0y)+d_Y(s_0y,f(v_0))+d_Y(f(v_0),f(p))\le DL+R+1$（`:418–425`）；$+1$ 是"最后一个小三角形内的直径 $\le1$"。 |
| $C_1,C_2$（局部化） | 存在与 $n$ 无关的 $C_1$：$d_Y(sy,f_n(p))\le C_1$（`eq:local-all-points`，`localization.tex:70–71`）；$d_Y(sy,t_n(p)y)\le C_1+C_0$（`:90`）；$\Vert V(s)-V(t_n(p))\Vert_1\le C_2$（与 $n,p,s$ 无关，`:93–95`） | 绕数/局部度（`lem:projected-approximation`，`:82`；`lem:localized-degree`，`:158`） | `[机械理由]` $C_1+C_0$ 是两个常数的直接相加；$C_2$ 靠 `eq:mirror-lipschitz` 把距离折成反射坐标差。**量词关键**：$C_1,C_2$ 在 $n$ 之前选取（见 A-3 设计约束清单）。 |
| $2C_1$ | $d_Y(f_n(p),f_n(p'))\le d_Y(f_n(p),sy)+d_Y(sy,f_n(p'))\le2C_1$（`localization.tex:185–186`） | 与 `eq:region-separation` 的 $\delta n$ 矛盾，从而每个覆盖出现都落在 $\mathrm{int}B$ 内 | `[机械理由]` 这里是"同一目标胞腔的三个群顶点标签 $s$"的选点；线性 vs 常数是矛盾的数学形状。 |
| $\rho$ | 外半径 $\rho\ge\cos(\theta/2)>\sqrt3/2$（`:44`）；径向同胚固定 $\le1/2$ 的半径、把 $\rho$ 送到 $1$（`:45–46`） | 显式参数球面构造（六三角形锥盘 $Q$） | `[机械理由]` $\theta<\pi/3\Rightarrow\theta/2<\pi/6\Rightarrow\cos(\theta/2)>\sqrt3/2$；这是把"扇区角上界"二次利用，保证 $Q$ 覆盖 $P$ 的半径 $1$ 边界环。$1/4$ 出现在 `eq:small-patch` 的 $\min(\epsilon/3,1/4)$，作用是让 $B$ 留在单一扇区内。 |
| $3F=2E,\ 2E\ge6V,\ V-E+F=2$ | `diagrams.tex:257` 逐字 | 命题 4.1（`prop:sphere-counts`，`:147`）：Euler 矛盾 | `[机械理由]` 第一式来自"每面三角形 3 边、每边两面"；第二式来自 girth $\ge6$（每条边界的 link 环 $\ge6$）；第三式是球面。三式给出 $2E=3F$、$F=\tfrac23E$、$V-E+F=2\Rightarrow V-\tfrac E3=2$ 与 $E\le\tfrac13\cdot6V$ 冲突。论文逐字说明方法取自 `\cite[Definition~3.1 and Corollary~4.6]{Gersten1987}`（`:143`）。 |

### A-5.6 Lean 侧专有参数（论文无对应物）

| 符号 | 值（逐字/位置） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| `Letters` | `Fin 116`（`Model.lean:5`） | 矩阵域；`blockLetter b i` 的 $5+37b.val+(i-2)$ 编号 | `[机械理由]` 116 与 $5+3\cdot37$ 必须严格一致，否则 `Distant/Adjacent` 的 `Fin 39` 偏移越界。 |
| `Label` | `WithTop ℕ` | $\infty$ 用 `⊤` 表示 | `[机械理由]` 换成 `ℕ` 需另设哨兵值；`explicitMatrix_values`（`main.2.2`）的枚举要重写。 |
| `BraidRelations 39 s` | 谓词参数是**生成子个数**（`Braids.lean:388,441`） | `braid_forty_squared`、`braid_forty_ratio` | `[机械理由]` 内部 `hn : n+2 ≤ m` 即 $r\le l$；改 $m$ 需同步 `hodd` 的 $20,380$、`hpc₁₉` 的 $17$、`hQ₁₉` 的 $380,306$、`lengthPairing_disjoint_centers` 的 $n:=19,\ k:=19$。 |
| `143 * …^2 ≤ 57 * …^2` | `Braids.lean:388`，docstring 逐字 "Quantitative braid constraint, in a division-free form." | `Main.lean` 的 `hp` 处出口 | `[机械理由]` 机器版**避开除法**：以 $q=\ell(s_0)^2$ 为基，$572q\le57\ell(Z_3)^2$（`:437 hraw`），最后一步 `rw [stableLength_pow]` + `norm_num` 把 $572=4\cdot143$ 的 4 换给 $D^2=\ell(s_0^2)^2=4q$。 |
| `AngularSize n` | `3*(2*(n+1))` = $6(n+1)$（`Detour.lean:59`），配 `angularEquiv : Fin (AngularSize n) ≃ Fin (6*(n+1))`（`:61`） | 环带网格的角向分辨率 | `[机械理由]` $6$ = 扇区数、$2$ = 每扇区两半、$(n+1)$ = 径向层数；`finCongr` 靠 `omega` 证两侧基数相等，改任一个因子这条 `abbrev` 就与 `Fin (6*(n+1))` 不同构。 |
| `21+2*C` / `(20+C)+(1+C)` | `Detour.lean:98–105 innerLabel_edges` | 环带内圈相邻标号的位移界 | `[机械理由]` 论文里没有这条：机器用**显式环带绕行**代替论文的"锥化外盖帽"，故需把一次径向跳（$20+C$）与一次角向跳（$1+C$）相加，再归并成 $21+2C$。 |
| `22+4*C+4*E` | `Detour.lean:312–317 cap_exists` 第二合取 | 盖帽顶点函数的相邻位移界（$E$ = `orbit_uniformly_dense` 的稠密度） | `[机械理由]` 与上一条同族，多出绕行（`Detour`）带来的 $2C+2E$；$\le22+4C+4E$ 是有限枚举出的折线段数 $\times$ 单段界。 |
| `(1-d/2)*(n+1)-5*C/2-E ≤ dist y (v p•y)` | 同 `cap_exists` 第三合取 | 盖帽的径向排斥（对应论文 $(1-\sin(\Omega/4))n$） | `[机械理由]` $d$ 是"绕行额外长度系数"，故系数是 $1-d/2$；$5C/2$ 与 $E$ 是取整/稠密化余量。$d<2$ 才为正，见下行。 |
| `d : ℝ := 2*Real.sqrt (1+r^2-2*c*r)+r` | `Detour.lean:528`（$c$ 来自 `common_cosine`，$r$ 来自 `detour_gap`） | `hdetour : dist (axis y 0 R•y) (circle y R i t•y) ≤ d*R+3*C` | `[机械理由]` $\sqrt{1+r^2-2cr}$ 是**余弦定理**下单位扇区两端点间弦长（两半径 $1,r$、夹角余弦 $c$），再加绕行 $r$、乘 $R$、加网格误差 $3C$；这条是机器侧对论文 `eq:boundary-short` 的替代实现。 |
| `vec c p` | `(p.1 + c*p.2) + (Real.sqrt (1-c^2)*p.2)*I`（`SectorMetric.lean:9–10`） | 扇区坐标复嵌入（把 $(\lambda,\mu)$ 送进 $\mathbb C$） | `[机械理由]` 与论文"每扇区展开成 Euclidean wedge"等价：$\sqrt{1-c^2}=\sin(\arccos c)$ 要求 $-1\le c\le1$（机器里由 `common_cosine` 提供 $c$ 的范围假设）；$c$ 出界则 `Real.sqrt` 语义退化。 |
| `TriangleMesh.Exact` | `TriangleMesh.lean:45`，配套 `edge_card:106`、`exact_iff:150`、`exact_euler_inequality:180`、`six_turns_injective:209`、`degree_at_least_six:235`、`exists_link_backtrack:260` | 命题 4.1 的机器版 | `[机械理由]` 论文用拓扑 Euler 示性数 $V-E+F=2$；机器把"球面 $\to$ 平面 Euler"用 `finrank` 线性代数替身实现，`six_turns_injective` 对应 girth$\ge6$ 的"六转向单射"，`degree_at_least_six` 对应 $2E\ge6V$。 |
| `Main.lean` | `64` 行 / `3` 条声明，`not_geometric` + `main`（见 A-4.1 逐字） | 定理 1.1 出口 | `[机械理由]` 壳里唯一的取点操作是 `let y : Y := Classical.choice inferInstance`（`:38`）⇒ `Nonempty` 假设以选择公理落地。 |

### A-5.7 承重清单（跨层）

1. **唯一"数值 $\to$ 几何"接口**：$143/513>1/4$（`braids.tex:205–207`）$\to$ 比值 $>1/2$ $\to$
   $\cos\theta>1/2$（`sectors.tex:190`）$\to$ $\theta<\pi/3$ $\to$ $\Omega<2\pi$ $\to$
   $\sin(\Omega/4)<1$ $\to$ $\epsilon>0$。链条上任一环只给非严格不等式，最后一步即失效。
2. **两条增长率的对决**：$\delta n$（`sectors.tex:261`，线性）vs $2C_1$（`localization.tex:186`，常数）。
   全部"$C_1,C_2,C_0$ 与 $n$ 无关"的量词安排（A-3 设计约束清单）都是为这一行服务。
3. **唯一用到 properness 的两处**：`eq:orbit-control` 的紧饱和（`sectors.tex:57–63`）与
   `lem:semisimple` 的下水平集（`lengths.tex:86`）。`[分析]` 其余论证只用到度量与 CAT(0) 不等式。
4. **机器独有的三处替换**（论文无对应数值）：`AngularSize=6(n+1)`、`21+2*C`/`22+4*C+4*E`、
   `d=2\sqrt{1+r^2-2cr}+r`。它们共同把论文的"锥化外盖帽 + 拓扑 Euler"换成"显式环带 + `finrank`"。
5. `116`、`k=20`、`7 段`、`girth 6` 四个数值的中性程度**并不相同**，`[分析]` 分级如下：
   (i) `girth 6`——按 A-2.19(c) 的 `[纠正]` 后判定为**临界值**（$m\ge6$ 才使 $V-E+F\le0$），不是松取值；
   (ii) `k=20`——**有约 6 的余量**（阈值实为 $k\ge14$，见 A-5.2"比值"行），论文未优化；
   (iii) `7 段`——只要有限即可，非最优但无关紧要；
   (iv) `116`——随 (ii) 的 $k$ 一起变（$5+3(2k-2)$），本身不是独立承诺。
   论文没有任何一处主张这四者最优。

<!-- 完 -->

<!-- 拆分说明：本文件由 双曲群无几何CAT0作用-素材.md 第 2256-4825 行的【增补·Artin 篇】块复制而来（2026-10-08 17:54），原文件暂保留该块，待 D28 终稿收稿后再删除。Artin 篇对应队列第 42 行 / D53；双曲篇对应队列第 18 行 / D28。 -->
