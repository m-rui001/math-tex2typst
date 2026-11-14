#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: false), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)
#show figure.where(kind: table): set block(breakable: true)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[Exact asymptotic moduli in a Daugavet subspace of $L^1$]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <introduction>

How much can two-sided midpoint growth differ from one-sided asymptotic convexity?
  We answer this quantitatively for certain real subspaces of $L^1$. The norm is fixed throughout the computation:
  it is the inherited $L^1$ norm. The obstruction to AUC renorming will require a separate argument that applies
  to every equivalent norm.

For an infinite-dimensional real Banach space $X$, write $B_X$ and $S_X$ for its closed unit ball and unit sphere,
  and $"cof" \( X \)$ for its closed linear subspaces of finite codimension.
  Given a norm $N$, a vector $x$ with $N \( x \) = 1$, and $t > 0$, set

$ H_N \( x \, t \) & = sup_(F in "cof" \( X \)) inf_(y in F\
N \( y \) gt.eq 1) (frac(N \( x + t y \) + N \( x - t y \), 2) - 1) \,\
D_N \( x \, t \) & = sup_(F in "cof" \( X \)) inf_(y in F\
N \( y \) = 1) #scale(x: 120%, y: 120%)[\(] N \( x + t y \) - 1 #scale(x: 120%, y: 120%)[\)] . $

The averaged midpoint modulus $hat(delta)_N \( t \)$ and the one-sided modulus $overline(delta)_N \( t \)$ are
  their respective infima over unit centers. Thus a subspace of finite codimension is chosen for each center
  before the perturbing direction is chosen. The norm $N$ is #emph[asymptotically uniformly convex] (AUC) if
  $overline(delta)_N \( t \) > 0$ for every $t > 0$.

For each fixed $y$, both the average and the maximum of $N \( x + r y \)$ and $N \( x - r y \)$ are even convex
  functions of $r$. Thus unit directions give the same inner infimum in $H_N$ and in its maximum-based
  counterpart. Let $m_N$ be the modulus obtained by replacing the average in $H_N$ by the maximum and then taking
  the infimum over unit centers. It satisfies $1 / 2 m_N \( t \) lt.eq hat(delta)_N \( t \) lt.eq m_N \( t \)$.
  Indeed, the upper bound is immediate; for the lower bound,
  intersect a candidate subspace with the kernel of a norm-one functional norming $x$.
  Both perturbed norms are then at least one, and the average of their excesses is at least half their maximum
  excess. Taking the infima and suprema gives the comparison.
  Positivity of the averaged modulus is therefore the usual asymptotic midpoint uniform convexity (AMUC).

Dilworth, Kutzarova, Randrianarivony, Revalski, and Zhivkov introduced AMUC and asked whether AMUC and AUC are
  equivalent up to renorming #cite(label("DKRRZ2016")) Definition 2.2 and the question in Section 5.
  Baudier answered this question negatively by proving AMUC for subspaces of $L^1$ whose unit balls are relatively
  compact in measure and applying this to the Daugavet example of Kadets and Werner #cite(label("Baudier2026"))
  Theorem 1 and Corollary 1. We calculate both moduli exactly under these two geometric hypotheses.
  Baudier’s proof uses the $L^1$ splitting identity of Brézis and Lieb #cite(label("BrezisLieb1983")) Theorem 1
  along almost-everywhere convergent subsequences. Our lower estimate instead uses a finite net of pointwise
  truncations and the sign functionals attached to that net.

Recall that a Banach space has the #emph[Daugavet property] if $parallel I + T parallel = 1 +
  parallel T parallel$ for every rank-one bounded operator $T$ on the space.
  For functions on a probability space, convergence in measure is induced by the metric

#[#set math.equation(numbering: n => "(1)")
 $ d \( f \, g \) = inf { a > 0 : bb(P) \( \| f - g \| > a \) < a } . $ <eq:measure-metric>]

Total boundedness for this metric means that every positive radius admits a finite covering by balls of that
  radius. The following theorem combines this compactness assumption with the Daugavet property.

#thm([Theorem 1.1.])[
  #emph[Let $E$ be an infinite-dimensional closed real subspace of $L^1 \( Omega \, bb(P) \)$,
    where $bb(P)$ is a probability measure. Suppose its closed unit ball is totally bounded for convergence in
    measure and its inherited norm has the Daugavet property. Then every $x in S_E$ and $t > 0$ satisfy
$ H_E \( x \, t \) = max { t \/ 2 \, t - 1 } \, wide D_E \( x \, t \) = max { 0 \, t - 2 } . $

 Consequently these are also the formulas for $hat(delta)_E \( t \)$ and $overline(delta)_E \( t \)$.
   The space $E$ admits no equivalent AUC norm.]
] <thm:exact>

In particular, the averaged modulus has linear growth near the origin,
  whereas the one-sided modulus remains zero up to $t = 2$.
  Baudier also gives a universal linear lower bound for the maximum-based modulus of the Kadets–Werner space
  #cite(label("Baudier2026")) final paragraph. Our refinement determines the exact averaged and one-sided curves
  at every unit center under the two geometric hypotheses. Figure 1 displays the two curves.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (7.673, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.673, 0), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 4.015), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 4.015), [#text(size: 9pt)[modulus]], anchor: "south", padding: 0.1176cm)
  line((1.65, 0.044), (1.65, -0.044), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.65, -0.044), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  line((3.3, 0.044), (3.3, -0.044), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.3, -0.044), [#text(size: 9pt)[$2$]], anchor: "north", padding: 0.1176cm)
  line((4.95, 0.044), (4.95, -0.044), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.95, -0.044), [#text(size: 9pt)[$3$]], anchor: "north", padding: 0.1176cm)
  line((6.6, 0.044), (6.6, -0.044), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.6, -0.044), [#text(size: 9pt)[$4$]], anchor: "north", padding: 0.1176cm)
  line((0.066, 1.1), (-0.066, 1.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.066, 1.1), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  line((0.066, 2.2), (-0.066, 2.2), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.066, 2.2), [#text(size: 9pt)[$2$]], anchor: "east", padding: 0.1176cm)
  line((0.066, 3.3), (-0.066, 3.3), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.066, 3.3), [#text(size: 9pt)[$3$]], anchor: "east", padding: 0.1176cm)
  line((3.3, 0), (3.3, 1.1), stroke: (paint: rgb("#c0c0c0"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, 0), (3.3, 1.1), (7.095, 3.63), stroke: (paint: rgb("#0000b2"), thickness: 1.2pt, miter-limit: 10))
  line((0, 0), (3.3, 0), (7.095, 2.53), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((0.33, 3.575), [#text(fill: rgb("#0000b2"))[#text(size: 9pt)[$hat( delta )_E(t)= max \{t"/"2,t-1\}$]]], anchor: "west", padding: 0.1176cm)
  content((0.33, 2.97), [#text(fill: rgb("#cc6600"))[#text(size: 9pt)[$overline( delta )_E(t)= max \{0,t-2\}$]]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The exact moduli of the original norm on $E$. The averaged midpoint modulus is positive for every positive radius, whereas the one-sided modulus vanishes through radius $2$. Theorem 1 gives both equalities at each unit center. These curves do not describe other equivalent norms. ],
) <fig:moduli>

The existence of such spaces has an older history. Bourgain and Rosenthal constructed an $L^1$ subspace whose unit
  ball is relatively compact in measure although the space fails the Radon–Nikodym property
  #cite(label("BourgainRosenthal1980")). Kadets and Werner refined its finite-dimensional enlargement to obtain
  the Daugavet property #cite(label("KW2004")) Lemma 2.4 and Theorem 2.5.
  We give a complete realization of their enlargement and limiting scheme in Section 6,
  so the existence of an example and the calculation of its moduli form one self-contained argument.

The two assumptions enter different parts of the proof. In Section 2,
  pointwise clipping at height $\| x \| \/ t$ turns the measure-precompact ball into a norm-compact set.
  Finitely many sign functionals then force at least half the $L^1$ mass of every unit direction in their common
  kernel to remain outside the clip, up to an arbitrarily small error. This gives the lower averaged bound.
  Section 3 develops the other input: every weak neighborhood of a unit vector contains points almost at distance
  two from it. This is the needed case of Shvydkoy’s weak-open characterization of the Daugavet property
  #cite(label("Shvydkoy2000")) Lemma 3, obtained from the slice characterization of Kadets, Shvidkoy, Sirotkin,
  and Werner #cite(label("KSSW2000")) Lemma 2.2. In Section 4,
  correcting a finite-dimensional quotient coordinate turns those almost diametral differences into directions in
  any prescribed subspace of finite codimension, giving both upper curves.
  Section 5 uses the same weak-neighborhood property at a near-maximizer of an arbitrary equivalent norm to rule
  out AUC renorming. Section 6 then constructs an increasing sequence of finite-dimensional spaces whose closed
  union has both required properties. At each step, multiplying selected old unit vectors by independent positive
  variables creates new vectors almost at distance two from every old unit vector,
  while averages of the new vectors recover the selected ones.
  A uniform estimate places the entire enlarged unit ball close in measure to the old ball.
  Summable errors preserve total boundedness through the limit,
  and the averaging property gives the Daugavet slice condition.

== 2 Compact clips leave half the mass outside <sec:clips>

In this section, $E$ is an infinite-dimensional closed real subspace of a probability $L^1$ space,
  with its inherited norm. The clipping argument uses only total boundedness of $B_E$ in measure.

For $x in S_E$, $y in E$, and $t > 0$, the real scalar identity $\( \| a + b \| + \| a - b \| \) \/ 2 =
  max { \| a \| \, \| b \| }$ gives

#[#set math.equation(numbering: n => "(2)")
 $ frac(parallel x + t y parallel_1 + parallel x - t y parallel_1, 2) - 1 =
   integral \( t \| y \| - \| x \| \)_(+) thin d bb(P) = t parallel y parallel_1 - integral min { \| x \| \,
   t \| y \| } thin d bb(P) . $ <eq:overlap-identity>]

Here $r_(+) = max { r \, 0 }$. The lower bound therefore amounts to controlling the overlap with $x$.

#thm([Lemma 2.1.])[
  #emph[Let $E$ be an infinite-dimensional closed real subspace of $L^1 \( Omega \, bb(P) \)$,
    where $bb(P)$ is a probability measure. If its unit ball $B_E$ is totally bounded in measure,
    then $H_E \( x \, t \) gt.eq max { t \/ 2 \, t - 1 }$ for every $x in S_E$ and $t > 0$.]
] <lem:clips>

#proof[
  Fix $x$ and $t$. Clip a function $y$ at the pointwise height $\| x \| \/ t$:
  $ C \( y \) = "sgn" \( y \) min { \| y \| \, \| x \| \/ t } . $
  The clipped functions need not belong to $E$. Their norm closure $K =
    overline(C \( B_E \))^(thin L^1)$ is compact. Indeed, every sequence in $B_E$ has a subsequence Cauchy in
    measure. Clipping is pointwise $1$-Lipschitz, so the clipped subsequence is also Cauchy in measure.
    For two of its terms $b_i \, b_j$ and any $a > 0$,
  $ parallel b_i - b_j parallel_1 lt.eq a + integral_({ \| b_i - b_j \| > a }) 2 \| x \| \/ t thin d bb(P) . $
  Choose $a$ small, then use absolute continuity of the integral and the measure-Cauchy property.
    This proves that the subsequence is Cauchy in $L^1$. Completeness proves the compactness assertion.
  Fix $epsilon > 0$ and take a finite $epsilon$-net $b_1 \, dots.h \, b_m$ of $K$. Set $sigma_i = "sgn" \( b_i \)$ and
  $ F = ⋂_(i = 1)^m ker (y mapsto integral sigma_i y thin d bb(P)) subset.eq E . $
  This is a closed subspace of finite codimension. For $y in S_F$, choose $i$ with $parallel C \( y \) -
    b_i parallel_1 < epsilon$. Clipping preserves signs and reduces absolute values, so $parallel y -
    C \( y \) parallel_1 = 1 - parallel C \( y \) parallel_1$. Since $integral sigma_i y = 0$, we obtain
  $ parallel C \( y \) parallel_1 - epsilon lt.eq parallel b_i parallel_1 =
    lr(|integral sigma_i \( b_i - y \) thin d bb(P)|) lt.eq 1 - parallel C \( y \) parallel_1 + epsilon . $
  Thus $parallel C \( y \) parallel_1 lt.eq 1 \/ 2 + epsilon$.
    Equation (2) now gives averaged increment at least $t \/ 2 - t epsilon$ on $S_F$.
    The same bound holds for $parallel y parallel_1 gt.eq 1$ by radial monotonicity.
    Taking the supremum over $F$ and letting $epsilon arrow.b 0$ gives $H_E \( x \, t \) gt.eq t \/ 2$.
    The subspace is allowed to change with $epsilon$; this step does not assert that one subspace attains the
    limiting bound.
  For every $parallel y parallel_1 gt.eq 1$, the triangle inequality also gives
  $ frac(parallel x + t y parallel_1 + parallel x - t y parallel_1, 2) - 1 gt.eq t parallel y parallel_1 - 1 gt.eq
    t - 1 . $
  Combining the two bounds proves the lemma. ◻
]

#prodef([Remark 2.2.])[
  (A separated-sequence proof).  There is also a short contradiction argument giving the same half-mass bound.
    Fix a unit center $x$, a radius $t > 0$, and $0 < a < 1 \/ 2$.
    Suppose no subspace of finite codimension had averaged increment at least $a
    t$ in every direction of norm at least one. By radial monotonicity and Equation (2),
    every subspace of finite codimension would then contain a unit vector $y$ with $parallel y -
    C \( y \) parallel_1 < a$. Inductively choose such $y_j$ in the kernels of norm-one functionals norming the
    preceding vectors. Then $parallel y_i - y_j parallel_1 gt.eq 1$ for $i eq.not j$.
    Compactness of the clipped set gives a subsequence whose clips are Cauchy in norm, whereas along this subsequence
  $ parallel y_i - y_j parallel_1 lt.eq parallel y_i - C \( y_i \) parallel_1 + parallel C \( y_i \) -
    C \( y_j \) parallel_1 + parallel C \( y_j \) - y_j parallel_1 < 2 a + o \( 1 \) < 1 \, $
  a contradiction for sufficiently late pairs. Thus this argument yields $H_E \( x \, t \) gt.eq
    t \/ 2$ by taking the supremum over the corresponding subspaces and then letting $a arrow.t 1 \/ 2$.
    The finite-net proof above identifies an explicit finite family of functionals that removes the overlap.
] <rem:separated>

== 3 Almost diametral points in weak neighborhoods <sec:weak-neighborhoods>

To find almost diametral points subject to finitely many linear constraints,
  we pass from slices to relatively weakly open subsets of the ball.
  These points will supply both the upper bounds for the moduli and the obstruction to AUC renorming.
  A #emph[slice] of $B_X$ is a nonempty set

$ H = { y in B_X : ell \( y \) > alpha } \, wide ell in X^(*) \, quad alpha in bb(R) . $

We first prove the geometric characterization of the Daugavet property due to Kadets, Shvidkoy, Sirotkin,
  and Werner #cite(label("KSSW2000")) Lemma 2.2, also recalled by Kadets and Werner #cite(label("KW2004")) Lemma 1.1.

#thm([Lemma 3.1.])[
  (Daugavet slice characterization).  #emph[A nonzero real Banach space $X$ has the Daugavet property if and only
    if, for every $w in S_X$, every $rho > 0$, and every slice $H$ of $B_X$, there is $y in H$ with $parallel w +
    y parallel gt.eq 2 - rho$.]
] <lem:daugavet-slices>

#proof[
  Suppose first that $X$ has the Daugavet property. If the functional defining $H$ is zero, then $H =
    B_X$ and we may take $y = w$. Otherwise, after dividing the functional and threshold by its norm, write $H =
    { y in B_X : ell \( y \) > alpha }$ with $parallel ell parallel = 1$ and $alpha < 1$.
    Take $0 < eta < min { 1 - alpha \, rho \/ 2 }$. The rank-one operator $T y = ell \( y \) w$ has norm one,
    so there is $y in S_X$ with $parallel y + ell \( y \) w parallel > 2 - eta$.
    Replacing $y$ by $- y$ if necessary makes $ell \( y \) gt.eq 0$ without changing this inequality.
    It follows that $ell \( y \) > 1 - eta > alpha$ and
  $ parallel y + w parallel gt.eq parallel y + ell \( y \) w parallel - \( 1 - ell \( y \) \) > 2 - 2 eta > 2 - rho . $
  Conversely, assume the slice condition and let $T z = ell \( z \)
    v$ be a nonzero rank-one operator with $parallel ell parallel = 1$.
    Set $a = parallel v parallel = parallel T parallel$ and $w = v \/ a$.
    For $0 < eta < 1$, the slice condition provides $y in B_X$ with $ell \( y \) > 1 - eta$ and $parallel w +
    y parallel gt.eq 2 - eta$. A norm-one functional $phi$ norming $w + y$ takes value at least $1 -
    eta$ on each summand. Consequently,
  $ parallel I + T parallel gt.eq parallel y + T y parallel gt.eq phi \( y \) +
    a ell \( y \) phi \( w \) gt.eq \( 1 - eta \) + a \( 1 - eta \)^2 . $
  Let $eta arrow.b 0$ and use $parallel I + T parallel lt.eq 1 + parallel T parallel$.
    The identity is immediate when $T = 0$. ◻
]

The passage from slices to weak neighborhoods uses Bourgain’s lemma on convex combinations of slices (see
  #cite(label("ANP2019")) for the attribution). We give a finite-dimensional proof.
  Its use in passing to weak neighborhoods follows the same pattern as Shvydkoy’s proof of the weak-open
  characterization #cite(label("Shvydkoy2000")) Lemma 3.

#thm([Lemma 3.2.])[
  (Bourgain’s lemma).  #emph[Every nonempty relatively weakly open subset $U$ of a real Banach space’s closed unit
    ball contains a convex combination of nonempty slices of that ball.]
] <lem:slice-combination>

#proof[
  Choose $u in U$, a continuous linear map $T : X arrow.r bb(R)^k$,
    and an open set $O subset.eq bb(R)^k$ such that $u in B_X ∩ T^(- 1) \( O \) subset.eq U$.
    Put $D = overline(T \( B_X \))$. We want to place a convex combination of small slices of $D$ inside $O$ and
    then pull them back to $B_X$. For this it suffices to approximate $T \( u \)$ by convex combinations of
    exposed points, that is, unique maximizers of linear functionals on $D$.
    We first verify that $D$ is the closed convex hull of those points.
    Put $M = max_(q in D) \| q \|$, using a Euclidean norm. For a unit vector $a$ and $R > M$,
    choose $p_R in D$ farthest from $- R a$. Expanding the squares in $\| q + R a \| lt.eq \| p_R + R a \|$ gives
  $ 2 \( p_R + R a \) dot.op \( q - p_R \) lt.eq - \| q - p_R \|^2 wide \( q in D \) . $
  Thus $p_R$ is the unique maximizer of the linear functional with coefficient $p_R + R a$.
    If $q_a$ maximizes $a dot.op q$ on $D$, the same comparison gives
  $ 0 lt.eq a dot.op q_a - a dot.op p_R lt.eq frac(\| p_R \|^2 - \| q_a \|^2, 2 R) lt.eq frac(M^2, 2 R) . $
  The exposed points therefore have the same supremum as $D$ for every linear functional.
    Separation proves the closed-convex-hull assertion, also when $D$ is a singleton.
  Since $T \( u \) in O$, there are exposed points $p_1 \, dots.h \,
    p_l$ and positive weights $lambda_i$ summing to one such that $p = sum_i lambda_i p_i in O$.
    Choose $r > 0$ with the Euclidean ball $B \( p \, r \) subset.eq O$.
    If $a_i dot.op q$ exposes $p_i$, compactness and uniqueness of its maximum give a threshold $beta_i < a_i
    dot.op p_i$ with
  $ { q in D : a_i dot.op q > beta_i } subset.eq B \( p_i \, r \) . $
  The sets $H_i = { y in B_X : a_i dot.op T \( y \) > beta_i }$ are nonempty slices,
    since $T \( B_X \)$ is dense in $D$. For $y_i in H_i$,
  $ lr(|T (sum_i lambda_i y_i) - p|) lt.eq sum_i lambda_i \| T \( y_i \) - p_i \| < r . $
  Their convex combination consequently belongs to $U$. ◻
]

The slice property can now be applied successively within the slices provided by Bourgain’s lemma.
  This gives the following specialization of Shvydkoy’s weak-open result #cite(label("Shvydkoy2000")) Lemma 3.

#thm([Lemma 3.3.])[
  #emph[If $X$ has the Daugavet slice property, then, for every $x in
    S_X$ and every relatively weakly open neighborhood $U$ of $x$ in $B_X$,
$ sup_(v in U) parallel v - x parallel = 2 . $

]
] <lem:diametral>

#proof[
  By Lemma 5, choose slices $H_i$ and positive weights $lambda_i$ such that $sum_i lambda_i =
    1$ and $sum_i lambda_i H_i subset.eq U$. Fix $0 < eta < 1$ and set $z_0 = - x$.
    At step $i$, apply the slice property at $z_(i - 1) \/ parallel z_(i - 1) parallel$ to choose $y_i in
    H_i$ with $parallel z_(i - 1) \/ parallel z_(i - 1) parallel + y_i parallel gt.eq 2 - eta$.
    A norm-one functional norming this sum takes value at least $1 - eta$ on each of its two summands.
    Therefore, with $z_i = z_(i - 1) + lambda_i y_i$,
  $ parallel z_i parallel gt.eq \( 1 - eta \) \( parallel z_(i - 1) parallel + lambda_i \) > 0 . $
  The induction is well defined and yields
  $ parallel z_l parallel gt.eq \( 1 - eta \)^l + sum_(i = 1)^l lambda_i \( 1 - eta \)^(l - i + 1) gt.eq
    2 \( 1 - eta \)^l . $
  Now $v = sum_i lambda_i y_i in U$ and $z_l = v - x$. Let $eta arrow.b 0$; the reverse bound follows from $v \,
    x in B_X$. ◻
]

== 4 One family of directions gives both curves <sec:curves>

#proof[
  Lemma 2 gives the averaged lower bound. For the one-sided bound,
    choose a norm-one functional $phi$ with $phi \( x \) = 1$. Every $y in S_(ker phi)$ satisfies
  $ parallel x + t y parallel gt.eq 1 \, wide parallel x + t y parallel gt.eq t - 1 . $
  Hence $D_E \( x \, t \) gt.eq max { 0 \, t - 2 }$.
  For the upper bounds, fix any $F in "cof" \( E \)$ and choose a bounded finite-rank projection $P$ with kernel
    $F$. Such a projection is obtained by composing the quotient map with a linear section of $E \/ F$.
    For $0 < epsilon < 1 \/ 2$,
  $ U_epsilon = { v in B_E : parallel P \( v - x \) parallel < epsilon } $
  is a relatively weakly open neighborhood of $x$. The finite-dimensional range of $P$ makes it weak-to-norm
    continuous. By Lemma 6, choose $v_epsilon in U_epsilon$ with $parallel v_epsilon - x parallel > 2 - epsilon$,
    and put
  $ z_epsilon = \( I - P \) \( v_epsilon - x \) \, quad L_epsilon = parallel z_epsilon parallel \, quad
    y_epsilon = z_epsilon \/ L_epsilon in S_F . $
  Then
  $ 2 - 2 epsilon < L_epsilon lt.eq 2 + epsilon \, wide parallel x + z_epsilon parallel lt.eq 1 + epsilon . $
  Thus the directions lie exactly in $F$, their unnormalized lengths tend to two,
    and the translated endpoints remain close to $B_E$.
  For any $t > 0$, set $lambda = min { t \/ L_epsilon \, 1 }$. The identity
  $ x + t y_epsilon = \( 1 - lambda \) x + lambda \( x + z_epsilon \) + \( t - L_epsilon \)_(+) y_epsilon $
  and the triangle inequality give the single bound
  $ parallel x + t y_epsilon parallel lt.eq 1 + epsilon + \( t - L_epsilon \)_(+) . $
  The right-hand side converges to $1 + \( t - 2 \)_(+) = max { 1 \, t - 1 }$.
    Since $parallel x - t y_epsilon parallel lt.eq 1 + t$, the one-sided and averaged increments have upper limits
    at most
  $ \( t - 2 \)_(+) \, wide frac(t + \( t - 2 \)_(+), 2) \, $
  respectively. These are $max { 0 \, t - 2 }$ and $max { t \/ 2 \, t - 1 }$.
    In particular the argument includes $t = 2$, where the two branches meet.
    Each inner infimum for the fixed $F$ is at most the corresponding limit.
    Taking the supremum over $F$ proves the upper bounds. Both formulas hold for every unit center,
    so taking the infimum over centers leaves them unchanged. ◻
]

== 5 Why a different norm cannot be AUC <sec:renorming>

The one-sided modulus vanishes for $0 < t lt.eq 2$, so the inherited norm is not AUC.
  Ruling out all equivalent norms requires the weak-neighborhood property itself.
  The following argument applies to any infinite-dimensional real Banach space in which every relatively weakly
  open neighborhood of a unit vector contains points of the unit ball arbitrarily close to distance two from that
  vector, as in Lemma 6.

#proof[
  Suppose $N$ is an equivalent AUC norm. Choose $a > 0$ with $N \( u \) gt.eq a parallel u parallel$ for all $u$,
    and put $R = sup_(u in B_E) N \( u \) < oo$. Fix, in this order,
  $ t_0 = frac(a, 4 R) \, wide 0 < gamma < overline(delta)_N \( t_0 \) \, wide x_0 in S_E med
    upright("with") med \( 1 + gamma \) N \( x_0 \) > R . $
  The last choice is possible since $R = sup_(u in S_E) N \( u \)$.
    The definition of $overline(delta)_N \( t_0 \)$ at $x_0 \/ N \( x_0 \)$ supplies $F in "cof" \( E \)$ such that
  #[#set math.equation(numbering: n => "(3)")
   $ N \( x_0 + z \) gt.eq \( 1 + gamma \) N \( x_0 \) quad upright("if ") z in F \, quad N \( z \) gt.eq
     t_0 N \( x_0 \) . $ <eq:auc-outside>]
  To justify the entire range of radii, convexity gives, for $N \( w \) = 1$ and $r gt.eq t_0$,
  $ N \( x_0 \/ N \( x_0 \) + r w \) - 1 gt.eq r / t_0 #scale(x: 120%, y: 120%)[\(]
    N \( x_0 \/ N \( x_0 \) + t_0 w \) - 1 #scale(x: 120%, y: 120%)[\)] . $
  Choose $0 < eta < min { \( 1 + gamma \) N \( x_0 \) - R \, a \/ 4 }$. The set
  $ U = { u in B_E : inf_(z in F) N \( u - x_0 - z \) < eta } $
  is a relatively weakly open neighborhood of $x_0$: the infimum is the norm in the finite-dimensional quotient
    $E \/ F$. Equivalent norms have the same continuous functionals, hence the same weak topology.
    For $u in U$, choose $z in F$ with $N \( u - x_0 - z \) < eta$.
    If $N \( z \) gt.eq t_0 N \( x_0 \)$, Equation (3) gives
  $ N \( u \) > \( 1 + gamma \) N \( x_0 \) - eta > R \, $
  contrary to $u in B_E$. Thus
  $ N \( u - x_0 \) < t_0 N \( x_0 \) + eta lt.eq t_0 R + eta < a \/ 2 \, wide parallel u - x_0 parallel < 1 \/ 2 . $
  This contradicts Lemma 6. ◻
]

== 6 Constructing the measure-precompact Daugavet space <kw:section>

The preceding results apply to a space with two rather different properties:
  its unit ball is small for convergence in measure, while its slices contain vectors almost at distance two from
  any prescribed unit vector. We now construct such a space.
  The construction is due to Kadets and Werner #cite(label("KW2004")) Lemma 2.4 and Theorem 2.5,
  who refine the method of Bourgain and Rosenthal #cite(label("BourgainRosenthal1980")).
  We give all the estimates needed for the finite-dimensional enlargement and its iteration.
  The explicit multipliers below and the constants $10$, $54$,
  and $108$ belong to the quantitative realization given here;
  the enlargement and iteration scheme is the credited construction.

The idea is to multiply an old unit vector by a positive random variable which has mean one but is small with high
  probability. Each product has small $L^1$ overlap with every old unit vector,
  so the norm of their sum is almost two. Averaging sufficiently many products recovers the old vector in norm.
  The main additional task is to control every vector in the new unit ball,
  which permits the iteration to preserve precompactness in measure.

Throughout this section,

$ \( Omega \, bb(P) \) = \( \[ 0 \, 1 \]^(bb(N)) \, lambda^(bb(N)) \) \, wide L^1 =
  L^1 \( Omega \, bb(P) \; bb(R) \) \, $

and $lr(bar.v.double dot.op bar.v.double)$ denotes the $L^1$ norm.
  Write $B \( G \)$ and $S \( G \)$ for the closed unit ball and unit sphere of a subspace $G$.
  A space depends on finitely many coordinates if one common finite set of coordinates determines all its elements.

Recall the metric from (1), on measurable functions modulo equality almost everywhere:

#[#set math.equation(numbering: n => "(4)")
 $ d \( f \, g \) = inf { a > 0 : bb(P) \( \| f - g \| > a \) < a } . $ <kw:metric>]

This metric induces convergence in measure. For example, if $bb(P) \( \| f - g \| > a \) <
  a$ and $bb(P) \( \| g - h \| > b \) < b$, the union bound gives $bb(P) \( \| f - h \| > a + b \) < a + b$;
  taking infima proves the triangle inequality. The identity $d \( f \, g \) = 0$ is equivalent to $f =
  g$ almost everywhere, and the convergence assertion follows directly from the thresholds in (4).
  Markov’s inequality also gives $d \( f \, g \) lt.eq lr(bar.v.double f - g bar.v.double)^(1 \/ 2)$,
  so norm convergence implies convergence for $d$.

#thm([Theorem 6.1.])[
  (Kadets–Werner construction).  #emph[There is an infinite-dimensional closed real subspace $E subset.eq
    L^1$ such that $B \( E \)$ is totally bounded for $d$ and has the following slice property:
    for every $w in S \( E \)$, every nonempty slice
$ H = { y in B \( E \) : ell \( y \) > alpha } \, wide ell in E^(*) \, quad alpha in bb(R) \, $

 and every $rho > 0$, there is $y in H ∩ S \( E \)$ such that $lr(bar.v.double w + y bar.v.double) gt.eq 2 - rho$.
   In particular, $E$ has the Daugavet property.]
] <kw:existence>

=== 6.1 The finite-dimensional enlargement <the-finite-dimensional-enlargement>

We need the new unit vectors to be almost additive in norm with every old unit vector,
  and their averages to approximate selected old vectors. The third conclusion below keeps the entire new unit
  ball close, in measure, to the old unit ball.

#thm([Lemma 6.2.])[
  #emph[Suppose $G eq.not { 0 }$ is a finite-dimensional subspace of $L^1$ depending on finitely many coordinates,
    $m gt.eq 1$, $u_1 \, dots.h \, u_m in S \( G \)$, and $0 < h < 1$.
    There are a finite-dimensional $G' supset.eq G$ depending on finitely many coordinates, an integer $n gt.eq
    1$, and vectors $v_(k j) in S \( G' \)$ $\( 1 lt.eq k lt.eq m \, med 1 lt.eq j lt.eq n \)$ such that
#[#set math.equation(numbering: n => "(5)")
 $ lr(bar.v.double w + v_(k j) bar.v.double) & gt.eq 2 -
   h &  & \( w in S \( G \) \, med k lt.eq m \, med j lt.eq n \) \,\
lr(bar.v.double u_k - 1 / n sum_(j = 1)^n v_(k j) bar.v.double) & lt.eq h &  & \( k lt.eq m \) \,\
upright("for every ") g in B \( G' \) upright(" there is ") psi_0 in B \( G \) & upright(" with ")
  d \( g \, psi_0 \) lt.eq h . $ <kw:enlarge-a>]

]
] <kw:enlargement>

To prove the lemma, we will use independent positive multipliers whose mean is one and whose mass is concentrated
  near zero. The next estimate controls their linear combinations;
  this is what the whole-ball conclusion requires beyond control of the selected vectors themselves.

=== 6.2 A heavy-tail estimate <a-heavy-tail-estimate>

The following variable has mean one for every $p > 1$, although it converges to zero in probability as $p arrow.b
  1$. The estimate for differences will control arbitrary linear combinations in an enlarged unit ball.

#thm([Lemma 6.3.])[
  #emph[Let $1 < p lt.eq 3 \/ 2$, $s = \( p - 1 \) \/ p$, and $f = s V^(- 1 \/ p)$,
    where $V$ is uniform on $\( 0 \, 1 \)$. Let $Y_1 \, dots.h \, Y_n$ be independent variables,
    each distributed as the difference of two independent copies of $f$.
    For real scalars $a_1 \, dots.h \, a_n$, put $A = \( sum_(j = 1)^n \| a_j \|^p \)^(1 \/ p)$ and $Z =
    sum_(j = 1)^n a_j Y_j$. Then $bb(E) f = 1$ and
#[#set math.equation(numbering: n => "(6)")
 $ bb(P) \( \| \| Z > u \) lt.eq 10 \( s A \/ u \)^p quad \( u > 0 \) \, wide bb(E) \| \| Z gt.eq
   A \/ 54 . $ <kw:heavy-bounds>]

]
] <kw:heavy-tail>

The lower estimate bounds $A$ from an $L^1$ bound on $Z$;
  the upper estimate then gives concentration in probability uniformly in $n$.

#proof[
  Direct integration gives $bb(E) f = s p \/ \( p - 1 \) = 1$,
    and $bb(P) \( f > u \) = \( s \/ u \)^p$ for $u gt.eq s$.
    For all $u > 0$ the same expression is an upper bound. If $Y = f - f'$ for independent copies,
    then $Y$ is symmetric and $bb(P) \( \| \| Y > u \) lt.eq 2 \( s \/ u \)^p$.
    For fixed $u > 0$, the variables $X_j = a_j Y_j upright(bold(1))_({ \| a_j Y_j \| lt.eq u })$ are independent
    and centered, and
  $ bb(E) X_j^2 lt.eq integral_0^u 2 v thin bb(P) \( \| a_j Y_j \| > v \) thin d v lt.eq
    frac(4 \( s \| a_j \| \)^p u^(2 - p), 2 - p) . $
  Except on the event that some $\| a_j Y_j \| > u$, the sums $Z$ and $sum_j X_j$ agree.
    The union bound and Chebyshev’s inequality therefore give
  $ bb(P) \( \| \| Z > u \) lt.eq (2 + frac(4, 2 - p)) \( s A \/ u \)^p lt.eq 10 \( s A \/ u \)^p . $
  For the lower bound, when $u gt.eq s$, the event ${ f > u + 2 s \, med f' lt.eq 2 s }$ gives
  $ bb(P) \( \| \| Y > u \) gt.eq (frac(s, u + 2 s))^p \( 1 - 2^(- p) \) gt.eq 1 / 18 \( s \/ u \)^p . $
  Here $u + 2 s lt.eq 3 u$, $1 - 2^(- p) gt.eq 1 \/ 2$, and $3^p lt.eq 9$.
    Suppose $A > 0$ and omit zero coefficients. Since $\| a_j \| lt.eq A$, independence implies, for $u gt.eq s A$,
  $ bb(P) (max_j \| a_j Y_j \| > u) & gt.eq 1 - exp (- 1 / 18 \( s A \/ u \)^p)\
 & gt.eq 1 / 36 \( s A \/ u \)^p . $
  The last inequality uses $1 - e^(- v) gt.eq v \/ 2$ for $0 lt.eq v lt.eq 1$.
    Adjoin independent signs $epsilon_j in { - 1 \, 1 }$ of equal probability.
    For each fixed realization of the terms, averaging first over the sign of a term of largest absolute value gives
  $ bb(E)_epsilon \| sum_j epsilon_j a_j Y_j \| gt.eq max_j \| a_j Y_j \| \, $
  because $\( \| b + c \| + \| b - c \| \) \/ 2 gt.eq \| \| c$.
    The signed sum has the same law as $Z$, by independence and symmetry. Consequently,
  $ bb(E) \| \| Z gt.eq bb(E) max_j \| a_j Y_j \| gt.eq 1 / 36 integral_(s A)^oo \( s A \/ u \)^p thin d u =
    frac(A, 36 p) gt.eq A / 54 . $
  If $A = 0$, both assertions are immediate. ◻
]

=== 6.3 Proof of the enlargement <proof-of-the-enlargement>

The scalar estimates now let us control all linear combinations in the new space.
  We prove the three conclusions of Lemma 8 in the order that permits the number of multipliers to be chosen last.

#proof[
  We first fix the distribution of the new multipliers and prove the first and third conclusions uniformly in
    their number. Only then will we choose the number of multipliers to obtain the averaging conclusion.
  #emph[Parameter choices.] Choose $c in \( 0 \, h \/ 4 \)$, and then $r \, q > 0$ sufficiently small that
  #[#set math.equation(numbering: n => "(7)")
   $ m q < 1 \, wide m q + h^(- 1) #scale(x: 120%, y: 120%)[\(] 2 m r + \( 1 - m q \)^(- 1) -
     1 #scale(x: 120%, y: 120%)[\)] < h . $ <kw:rq-choice>]
  With $s = \( p - 1 \) \/ p$, choose $1 < p lt.eq 3 \/ 2$ close enough to $1$ that
  #[#set math.equation(numbering: n => "(8)")
   $ s < c \, wide 2 #scale(x: 120%, y: 120%)[\(] \( s \/ c \)^p + c #scale(x: 120%, y: 120%)[\)] < h \, wide
     10 \( 108 s \/ r \)^p < q . $ <kw:p-choice>]
  These choices are possible because $s arrow.r 0$ as $p arrow.b 1$.
    We fix $p$ now; the integer $n$ will be chosen last.
  #emph[Near-additivity with the old space.] For any prospective $n$,
    take $m n$ independent copies $f_(k j)$ of the variable $f$ in Lemma 9, each on a fresh coordinate, and put
  $ v_(k j) = u_k f_(k j) \, wide G'_n = "span" #scale(x: 120%, y: 120%)[\(] G union { v_(k j) : k lt.eq m \, med
    j lt.eq n } #scale(x: 120%, y: 120%)[\)] . $
  Independence from the old coordinates gives $lr(bar.v.double v_(k j) bar.v.double) = 1$. For every $w in S \( G \)$,
  $ lr(bar.v.double w + v_(k j) bar.v.double) & gt.eq 2 - 2 bb(E) min \( \| \| w \, \| u_k \| f_(k j) \)\
 & gt.eq 2 - 2 #scale(x: 120%, y: 120%)[\(] bb(P) \( f > c \) + c #scale(x: 120%, y: 120%)[\)] > 2 - h . $
  Indeed, on ${ f_(k j) > c }$ bound the minimum by $\| \| w$, and on its complement by $c \| u_k \|$;
    independence then gives the last bound. Thus (5) holds for every $n$.
  #emph[Approximation of the whole unit ball.] We next prove (5), also uniformly in $n$.
    Fix $g in B \( G'_n \)$ and choose any representation
  $ g = x + sum_(k = 1)^m u_k z_k \, wide x in G \, quad z_k = sum_(j = 1)^n a_(k j) f_(k j) . $
  Fix $k$. On an auxiliary product probability space resample all the variables in the $k$th group,
    leaving the old coordinates and all other groups unchanged.
    Write $z'_k$ for the resampled sum and $g^(\( k \))$ for the resulting function.
    The new variables are independent copies, so $g^(\( k \))$ has the same law as $g$, and
  $ bb(E) \| z_k - z'_k \| = bb(E) \| u_k \( z_k - z'_k \) \| = bb(E) \| g - g^(\( k \)) \| lt.eq 2 . $
  The first equality uses $lr(bar.v.double u_k bar.v.double) = 1$ and independence of the old coordinates.
    Lemma 9, applied to the differences of the paired copies, therefore gives
  #[#set math.equation(numbering: n => "(9)")
   $ A_k = (sum_j \| a_(k j) \|^p)^(1 \/ p) lt.eq 108 \, wide bb(P) \( \| z_k - z'_k \| > r \) lt.eq
     10 \( 108 s \/ r \)^p < q . $ <kw:coefficient-bound>]
  In particular, the bound does not depend on $n$ or on the chosen representation of $g$.
  The estimate for $z_k - z'_k$ says that $z_k$ is concentrated near some constant.
    Indeed, averaging the conditional probability over $z'_k$ gives a deterministic $c_k in
    bb(R)$ with $bb(P) \( \| z_k - c_k \| > r \) < q$. These constants may depend on $g$;
    no simultaneous choice is needed. Set
  $ psi = x + sum_(k = 1)^m c_k u_k in G \, wide D = ⋂_(k = 1)^m { \| z_k - c_k \| lt.eq r } . $
  The event $D$ depends only on the fresh coordinates, has probability at least $1 - m q$,
    and on $D$ we have $\| g - psi \| lt.eq r sum_k \| u_k \|$. Its independence from the old coordinates gives
  $ 1 gt.eq bb(E) \( \| \| g upright(bold(1))_D \) gt.eq
    bb(P) \( D \) \( lr(bar.v.double psi bar.v.double) - m r \) \, wide lr(bar.v.double psi bar.v.double) lt.eq
    m r + \( 1 - m q \)^(- 1) . $
  At this point $psi$ need not belong to the old unit ball.
    Set $psi_0 = psi \/ max { 1 \, lr(bar.v.double psi bar.v.double) } in B \( G \)$.
    The cost of this normalization is bounded by
  $ lr(bar.v.double psi - psi_0 bar.v.double) lt.eq m r + \( 1 - m q \)^(- 1) - 1 . $
  Markov’s inequality restricted to $D$ and the bound on its complement now yield
  $ bb(P) \( \| g - psi_0 \| > h \) & lt.eq m q + h^(- 1) #scale(x: 120%, y: 120%)[\(] m r +
    lr(bar.v.double psi - psi_0 bar.v.double) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq m q + h^(- 1) #scale(x: 120%, y: 120%)[\(] 2 m r + \( 1 - m q \)^(- 1) - 1 #scale(x: 120%, y: 120%)[\)] < h . $
  This proves (5) for every $n$.
  We have now proved both near-additivity and whole-ball approximation without placing an upper bound on $n$.
  #emph[Recovering the old vectors by averages.] It remains to choose $n$ for (5).
    For independent copies $f_1 \, dots.h \, f_n$ of the fixed integrable variable $f$, write $f^M = min { f \,
    M }$. Truncating, centering, and applying the variance bound to the bounded independent copies gives
  #[#set math.equation(numbering: n => "(10)")
   $ bb(E) \| 1 / n sum_(j = 1)^n f_j - 1 \| lt.eq 2 bb(E) \( f - f^M \) + sqrt("Var" \( f^M \) \/ n) . $ <kw:lln>]
  The first term tends to zero as $M arrow.r oo$; after $M$ is fixed the second tends to zero as $n arrow.r oo$.
    Choose $n$ so that the left side is at most $h$. All groups have the same law, and independence gives
  $ lr(bar.v.double u_k - 1 / n sum_j v_(k j) bar.v.double) = bb(E) \| 1 - 1 / n sum_j f_(k j) \| lt.eq
    h wide \( k lt.eq m \) . $
  Taking $G' = G'_n$ completes the proof. This space uses just finitely many additional coordinates;
    the earlier two conclusions persist because their estimates held for every finite $n$. ◻
]

=== 6.4 Passage to the closed space <passage-to-the-closed-space>

We apply the enlargement to finer and finer nets of the old unit sphere.
  The summable errors keep the eventual unit ball precompact in measure;
  the approximation by averages ensures that every slice eventually contains one of the new unit vectors.

#proof[
  Start with $G_1 = "span" { 1 }$ and put $h_b = 2^(- b)$. Given $G_b$, choose a finite $h_b$-net ${ u_(b \, k) :
    1 lt.eq k lt.eq m_b }$ of $S \( G_b \)$ in norm and apply Lemma 8 with $h = h_b$.
    Denote the resulting space by $G_(b + 1)$ and its new unit vectors by $v_(b \, k j)$, $1 lt.eq j lt.eq n_b$.
    All stages depend on finitely many coordinates, so the construction continues on $Omega$. Set
  $ E = overline(union.big_(b gt.eq 1) G_b)^(thin lr(bar.v.double dot.op bar.v.double)) subset.eq L^1 . $
  Each inclusion $G_b subset.eq G_(b + 1)$ is strict: if any $v_(b \, k j)$ belonged to $G_b$, substituting $w = -
    v_(b \, k j)$ in (5) would give $0 gt.eq 2 - h_b$. Thus $E$ is infinite-dimensional.
  #emph[The entire unit ball is totally bounded in measure.] The union $union.big_b
    B \( G_b \)$ is norm dense in $B \( E \)$: if $x_j$ in the algebraic union tends to $x in B \( E \)$,
    then $x_j \/ max { 1 \, lr(bar.v.double x_j bar.v.double) }$ also tends to $x$.
    Repeated use of (5) gives, for $a > b$ and $g in B \( G_a \)$,
  $ inf_(psi in B \( G_b \)) d \( g \, psi \) lt.eq sum_(l = b)^(a - 1) h_l lt.eq sum_(l = b)^oo h_l = 2^(1 - b) . $
  The bound is automatic for $a lt.eq b$. Distance to a fixed nonempty set is a $1$-Lipschitz function for $d$,
    so norm density and (4) extend it to every $g in B \( E \)$.
    The set $B \( G_b \)$ is norm compact and therefore $d$-compact.
    Given $epsilon > 0$, choose $b$ with $2^(1 - b) < epsilon \/ 2$ and a finite $epsilon \/
    2$-net of $B \( G_b \)$ for $d$. The preceding distance estimate shows that this is an $epsilon$-net of $B \( E \)$.
  #emph[The Daugavet slice property.] Now fix $w \, H \, ell \, alpha \, rho$ as in Theorem 7.
    There is $u in S \( E \)$ with $ell \( u \) > alpha$: the supremum of a linear functional over the ball equals
    its supremum over the sphere, including when the functional is zero.
    Normalizing approximants from the increasing union gives $u^(\( b \)) \,
    w^(\( b \)) in S \( G_b \)$ with $u^(\( b \)) arrow.r u$ and $w^(\( b \)) arrow.r w$ in norm.
    Choose a net point $u_(b \, k_b)$ with $lr(bar.v.double u_(b \, k_b) - u^(\( b \)) bar.v.double) lt.eq h_b$ and set
  $ a_b = 1 / n_b sum_(j = 1)^(n_b) v_(b \, k_b j) . $
  By (5), $lr(bar.v.double a_b - u bar.v.double) lt.eq 2 h_b +
    lr(bar.v.double u^(\( b \)) - u bar.v.double) arrow.r 0$.
    Thus $ell \( a_b \) > alpha$ for all sufficiently large $b$,
    and for each such $b$ at least one summand $v_(b \, k_b j)$ lies in $H$. For every summand, (5) also gives
  $ lr(bar.v.double w + v_(b \, k_b j) bar.v.double) gt.eq 2 - h_b - lr(bar.v.double w - w^(\( b \)) bar.v.double) . $
  Take $b$ large enough that the last two error terms sum to less than $rho$.
    The summand in $H$ is the required unit vector.
  Finally, Lemma 4 turns this slice property into $lr(bar.v.double I + T bar.v.double) = 1 +
    lr(bar.v.double  bar.v.double) T$ for every rank-one operator $T$ on $E$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
