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

#align(center)[#text(size: 16pt, weight: "bold")[The Gaussian propeller bound in every dimension]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $gamma_n$ denote the standard Gaussian probability measure on $bb(R)^n$,
  with density $\( 2 pi \)^(- n \/ 2) exp \( - parallel x parallel^2 \/ 2 \)$.
  For a measurable set $A subset.eq bb(R)^n$, its Gaussian first moment is $z \( A \) =
  integral_A x thin d gamma_n \( x \)$. We call this unnormalized vector its #emph[centroid].
  Thus a centroid is not divided by the measure of its cell.
  For positive integers $d \, k$ and a measurable partition $cal(A) = \( A_1 \, dots.h \, A_k \)$ of $bb(R)^d$, define

$ cal(F) \( cal(A) \) = sum_(i = 1)^k parallel z \( A_i \) parallel^2 . $

Partitions are understood up to Gaussian null sets, and empty cells are allowed.
  The cell probabilities are unrestricted. All norms and inner products below are Euclidean.

The propeller conjecture asks whether three planar sectors meeting at angles $2 pi \/ 3$,
  extended by an orthogonal Euclidean factor, maximize this functional whenever $d gt.eq 2$ and $k gt.eq 3$.
  It arose in Khot and Naor’s study of approximate kernel clustering [5],
  where Gaussian first moments govern approximation and Unique Games hardness.
  Their formulation uses $k$ cells in $bb(R)^(k - 1)$, with unused cells permitted.
  They proved that a maximizer can be chosen to be a conical partition in the span of its centroids and determined
  the three-cell value [5] Theorem 1.2 and Corollary 3.4.

Heilman, Jagannath, and Naor proved the bound for every finite partition of $bb(R)^3$ [4] Theorem 1.1.
  Their computer-assisted argument treats the remaining four-cell conical configurations through spherical
  geometry and a finite verification. We use that theorem as an established input.
  The new estimates below show that an extremizer with five or more active cells cannot have value greater than
  $9 \/ \( 8 pi \)$. Here an active cell has positive Gaussian measure.
  This proves the conjecture in all remaining dimensions.

#thm([Theorem 1.1.])[
  #emph[For all positive integers $d$ and $k$, every measurable partition $\( A_1 \, dots.h \, A_k \)$ of
    $bb(R)^d$ satisfies
$ sum_(i = 1)^k ∥integral_(A_i) x thin d gamma_d \( x \)∥^2 lt.eq frac(9, 8 pi) . $

 Empty cells are allowed. The constant is sharp whenever $d gt.eq 2$ and $k gt.eq 3$:
   three planar sectors of angle $2 pi \/ 3$, multiplied by the orthogonal complement of their plane,
   attain equality, with any further cells empty.]
] <thm:main>

=== 1.1 The attaining propeller <sec:example>

The attaining partition illustrates an important feature of the problem:
  in every dimension at least two, only three cells are needed once at least three labels are available.

Consider a sector $P$ in $bb(R)^2$ of opening $2 alpha$, symmetric about the first coordinate axis.
  Polar integration gives

$ integral_P x thin d gamma_2 \( x \) = frac(1, 2 pi) (integral_0^oo r^2 e^(- r^2 \/ 2) thin d r)
  (integral_(- alpha)^alpha \( cos theta \, sin theta \) thin d theta) = frac(sin alpha, sqrt(2 pi)) \( 1 \, 0 \) . $

For $alpha = pi \/ 3$, three such sectors partition the plane and their squared centroid lengths sum to $3
  sin^2 \( pi \/ 3 \) \/ \( 2 pi \) = 9 \/ \( 8 pi \)$. An orthogonal Gaussian factor contributes zero to every
  centroid, so the construction has the same value in every dimension at least two.
  The construction proves the attainment assertion in Theorem 1.
  Figure 1 shows the planar partition and its centroid directions.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (4, -6.928), (4, 6.928), close: true, fill: rgb("#e8e8ff"), stroke: none)
  line((0, 0), (4, 6.928), (-8, 9.797e-16), close: true, fill: rgb("#ffeede"), stroke: none)
  line((0, 0), (-8, 9.797e-16), (4, -6.928), close: true, fill: rgb("#e6f2e6"), stroke: none)
  line((0, 0), (1.085, 1.879), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  line((0, 0), (-2.3, 2.817e-16), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  line((0, 0), (1.085, -1.879), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  line((0, 0), (1.2, 0), stroke: (thickness: 0.8pt, cap: "round", join: "round"), mark: (end: ">"))
  content((1.2, 0.1058), [#text(size: 9pt)[$hat(z)_1$]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (-0.6, 1.039), stroke: (thickness: 0.8pt, cap: "round", join: "round"), mark: (end: ">"))
  content((-0.7058, 1.039), [#text(size: 9pt)[$hat(z)_2$]], anchor: "east", padding: 0.1176cm)
  line((0, 0), (-0.6, -1.039), stroke: (thickness: 0.8pt, cap: "round", join: "round"), mark: (end: ">"))
  content((-0.7058, -1.039), [#text(size: 9pt)[$hat(z)_3$]], anchor: "east", padding: 0.1176cm)
  arc((0.235, -0.407), start: -60deg, stop: 60deg, radius: 0.47, stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((0.91, -0.69), [#text(size: 9pt)[$2 pi"/"3$]])
  content((1.79, 0.6), [#text(size: 9pt)[$S_1$]])
  content((-1.5, 1.32), [#text(size: 9pt)[$S_2$]])
  content((-1.5, -1.32), [#text(size: 9pt)[$S_3$]])
  circle((0, 0), radius: 0.04233, fill: black, stroke: none)
})],
  caption: [Figure 1: The attaining planar partition consists of three unbounded sectors $S_1 \, S_2 \, S_3$ of angle $2 pi \/ 3$; only a finite window is shown. The bold arrows show the unit centroid directions $hat(z)_i = z \( S_i \) \/ parallel z \( S_i \) parallel$. Each unnormalized Gaussian centroid has length $sqrt(3) \/ \( 2 sqrt(2 pi) \)$, so their squared lengths sum to $9 \/ \( 8 pi \)$. In dimension $d gt.eq 2$, use $S_i times bb(R)^(d - 2)$, with any further cells empty. ],
) <fig:propeller-sectors>

=== 1.2 Analytic background and related partition problems <analytic-background-and-related-partition-problems>

The geometric reduction in Khot and Naor’s work is also the starting point here.
  We reprove its needed form, including attainment, the maximal-score description of the cells,
  and the effective dimension. The Gaussian-maximum duality used in this reduction is the normalized vector form
  of their Lemma 3.7. Our estimates then combine the loss on deleting one score with bounds for competition
  against two residual scores.

The one-score estimate uses the Gaussian Minkowski inequality introduced by Ehrhard for convex sets [2].
  Latała extended the inequality when one of the sets is convex [7];
  Borell proved the Borel-set version [1] Theorem 1.1. Van Handel later gave a stochastic-game proof [10].
  We need only the convex case: applied to translates of a cell,
  the inequality makes its inverse-normal Gaussian measure a concave function of the translation parameter.
  The translation direction, derivative, and resulting deletion estimate are derived in Section 3.

A related question asks which partition maximizes the probability that two correlated Gaussian vectors belong to
  the same cell, often with equal cell probabilities prescribed.
  This noise-stability objective is distinct from the unrestricted first-moment functional studied here.
  Heilman [3] Theorem 1.7 obtained a conditional route to the propeller bound for three or four cells in arbitrary
  dimension, assuming an additional stability property of equal-volume noise-stability maximizers.
  That result retains both the stability hypothesis and the restriction to at most four cells.
  The present argument addresses all finite cell counts and imposes no cell-mass constraint.

=== 1.3 The kernel-clustering consequence <the-kernel-clustering-consequence>

The Gaussian constant also determines the identity-target kernel-clustering threshold.
  For a rational symmetric positive semidefinite matrix $A = \( a_(p q) \)_(p \, q = 1)^N$ with $A
  upright(bold(1)) = 0$, this problem asks for an assignment $sigma : \[ N \] arrow.r \[ k \]$ maximizing

$ sum_(p \, q = 1)^N a_(p q) upright(bold(1))_({ sigma \( p \) = sigma \( q \) }) . $

Here $\[ N \] = { 1 \, dots.h \, N }$, $upright(bold(1))$ is the all-ones vector,
  and the indicator is one when its subscripts have the same label. Empty clusters are allowed.
  A loss factor $alpha$ means returning an assignment worth at least $1 \/ alpha$ times the maximum value.
  For fixed $k gt.eq 3$, Khot and Naor’s expected Gaussian rounding guarantee [5] Theorem 2.1 has loss factor

$ alpha_k = frac(8 pi, 9) (1 - 1 / k) . $

Theorem 1 evaluates the Gaussian partition parameter in their hardness analysis.
  Together with their low-influence theorem and the companion paper #emph[The Unique Games Theorem] [9]
  Theorem 1.1, it gives NP-hardness of every deterministic approximation with a fixed loss factor below $alpha_k$.
  Section 6 proves this application on rational inputs and specifies the ideal rounding convention at the
  endpoint. The separate Unique Games input is needed only for the hardness statement.

=== 1.4 Proof strategy <proof-strategy>

The difficulty is to control all measurable partitions while allowing both their shapes and their probabilities to
  vary. We first replace this infinite-dimensional optimization by a finite list of Gaussian linear scores.
  Two different consequences of optimality then constrain that list:
  deleting one score costs a definite amount of expected maximum,
  and competing against two scores constrains a covariance determinant.

Section 2 proves the reduction in full. Norm duality identifies the square root of the largest possible partition
  value with the largest possible expectation of the maximum score over lists of vectors with total squared norm
  one. Compactness gives an extremizer. Among extremizers, choose one with the fewest cells of positive measure.
  Merging two cells shows that its nonzero centroids $z_1 \, dots.h \,
  z_m$ have strictly negative pairwise inner products. Its cells agree almost everywhere with the cones where the
  corresponding score $chevron.l z_i \, x chevron.r$ is largest. The centroids span a space of dimension $m - 1$.
  The theorem of Heilman, Jagannath, and Naor therefore excludes $m lt.eq
  4$ from any counterexample to the desired bound.

For the remaining case $m gt.eq 5$, let $C$ be the optimal value, let $r_i =
  parallel z_i parallel \/ sqrt(C)$ be the normalized centroid lengths, and let $P_i$ be the cell probabilities.
  Then $sum_i r_i^2 = sum_i P_i = 1$. Section 3 bounds each $P_i$ below in terms of $r_i$.
  Halfspace rearrangement gives one such estimate; when $m = 5$,
  spherical rearrangement in the four-dimensional centroid span improves it.
  A further bound comes from removing one score and recentering the remaining vectors.
  The extremal score inequality gives a lower bound for the loss.
  Translations of the deleted score’s winning cone, together with Ehrhard’s inequality, give an upper bound.
  Comparing the two produces a scalar constraint on $P_i$ and $r_i$.

Section 4 uses the cell with the smallest normalized centroid length.
  Projecting the other scores orthogonally to its centroid gives residual Gaussian scores independent of the score
  in that direction. Their integrals over the chosen cell vanish.
  For two residual scores, these identities allow us to estimate a positive-part integral by replacing the joint
  density with its maximum. The denominator of this two-dimensional Gaussian density bound is the square root of
  the residual covariance determinant. The resulting pairwise bound yields two inequalities involving the three
  largest normalized centroid lengths and the smallest one.

Finally, Section 5 combines the scalar probability bounds with the identity $sum_i P_i = 1$.
  The available probability mass forces the third-largest squared length to be too large relative to the smallest
  length, contradicting the determinant bound. This excludes an optimal value above $9 \/ \( 8 pi \)$.
  Appendix 7 gives exact rational enclosures for every finite numerical comparison,
  including the complete interval cover needed for the scalar constraint.
  The geometric proof uses the three-dimensional propeller bound and Ehrhard’s inequality as its external theorem
  inputs; the remaining geometric estimates are proved here.
  Section 6 gives a separate kernel-clustering application.
  Its reduction adapts Khot and Naor’s construction and uses two additional theorem inputs:
  their discrete Fourier estimate and the separate Unique Games theorem in [9].

== 2 Extremal partitions and their centroids <ext:section>

Our goal is to replace an arbitrary measurable partition by an optimal partition described by finitely many
  Gaussian linear scores. We include the extremal reduction of Khot and Naor [5] Theorem 1.2 and Lemma 3.3 in the
  form needed below.

It suffices to prove the upper bound for $n + 1$ cells in $bb(R)^n$ with $n gt.eq 4$.
  Indeed, given $k$ cells in $bb(R)^d$, put $n = max { d \, k - 1 \, 4 }$,
  take their products with $bb(R)^(n - d)$, and append $n + 1 - k$ empty cells.
  Gaussian product decomposition appends zero coordinates to each first moment and preserves the objective.

Fix such an $n$ and put $N = n + 1$. All partitions below are measurable partitions up to Gaussian null sets,
  and empty cells are permitted. Write

$ C = sup_(\( A_1 \, dots.h \, A_N \)) sum_(i = 1)^N ∥integral_(A_i) x thin d gamma_n \( x \)∥^2 \, wide B =
  frac(3, 2 sqrt(2 pi)) . $

The moments exist, and Cauchy–Schwarz on each cell gives $C lt.eq n$.
  We first record the normalized vector form of the Gaussian-maximum description in [5] Lemma 3.7.
  Its proof also gives attainment directly.

#thm([Lemma 2.1.])[
  #emph[If $g$ is a standard Gaussian vector in $bb(R)^n$, then
#[#set math.equation(numbering: n => "(2.1)")
 $ sqrt(C) = max_(sum_(i = 1)^N parallel v_i parallel^2 = 1) bb(E) max_(1 lt.eq i lt.eq N) chevron.l v_i \,
   g chevron.r . $ <ext:dual-formula>]

 The supremum defining $C$ is attained. Moreover, for every $1 lt.eq k lt.eq N$ and every list $v_1 \, dots.h \,
   v_k in bb(R)^n$,
#[#set math.equation(numbering: n => "(2.2)")
 $ bb(E) max_(1 lt.eq i lt.eq k) chevron.l v_i \, g chevron.r lt.eq
   sqrt(C) (sum_(i = 1)^k parallel v_i parallel^2)^(1 \/ 2) . $ <ext:shorter-list>]

]
] <ext:duality>

#proof[
  For a partition with moments $z_i = integral_(A_i) x thin d gamma_n \( x \)$, Euclidean norm duality gives
  $ (sum_i parallel z_i parallel^2)^(1 \/ 2) = max_(sum_i parallel v_i parallel^2 = 1) sum_i integral_(A_i)
    chevron.l v_i \, x chevron.r thin d gamma_n \( x \) . $
  Taking the supremum jointly over partitions and lists, and then first over partitions,
    yields the right side of (2.1). Indeed, for each fixed list the pointwise maximum is attained by assigning $x$
    to a largest score $chevron.l v_i \, x chevron.r$, with ties resolved by the smallest index.
    This gives a measurable partition. The expected maximum is continuous in the list:
    the absolute difference of two maxima is at most $parallel g parallel max_i parallel v_i - w_i parallel$.
    Compactness of the sphere of lists therefore gives a maximizing list.
    Its score partition has moment norm at least its pairing with that list, namely $sqrt(C)$, so it attains $C$.
  For (2.2), let $Q_1 \, dots.h \, Q_k$ be a score partition for the specified list, and put $b_i =
    integral_(Q_i) x thin d gamma_n \( x \)$. Appending $N - k$ empty cells shows that $sum_i parallel b_i
    parallel^2 lt.eq C$. Consequently
  $ bb(E) max_i chevron.l v_i \, g chevron.r = sum_i chevron.l v_i \, b_i chevron.r lt.eq
    (sum_i parallel v_i parallel^2)^(1 \/ 2) (sum_i parallel b_i parallel^2)^(1 \/ 2) \, $
  which proves the assertion. ◻
]

We argue by contradiction and henceforth assume

#[#set math.equation(numbering: n => "(2.3)")
 $ C > B^2 = frac(9, 8 pi) . $ <ext:contradiction>]

Choose an optimal partition with the fewest cells of positive measure, discard its null cells,
  and call the remaining cells #emph[active]. Denote their moments by $z_1 \, dots.h \, z_m$. Thus

#[#set math.equation(numbering: n => "(2.4)")
 $ sum_(i = 1)^m z_i = 0 \, wide sum_(i = 1)^m parallel z_i parallel^2 = C . $ <ext:centroid-identities>]

The following structure statement develops the minimal-cell reduction of [5] Lemma 3.3;
  the rank assertions are proved directly from the Gram matrix.

#thm([Lemma 2.2.])[
  #emph[The centroids satisfy $chevron.l z_i \, z_j chevron.r < 0$ for $i eq.not j$.
    Their span $V$ has dimension $m - 1$, every proper subset of the centroids is linearly independent, and,
    for each fixed $i$, the $m - 1$ vectors $z_i - z_j$, $j eq.not i$, form a basis of $V$.
    The optimal cells have the closed conical representatives
#[#set math.equation(numbering: n => "(2.5)")
 $ K_i = { x in bb(R)^n : chevron.l z_i - z_j \, x chevron.r gt.eq
   0 upright(" for every ") j eq.not i } . $ <ext:cones>]

 Furthermore, $m gt.eq 5$.]
] <ext:structure>

#proof[
  Since $C > 0$, we have $m gt.eq 2$. Merging two cells changes the objective by $2 chevron.l z_i \,
    z_j chevron.r$. A positive product would contradict optimality;
    a zero product would contradict minimality of $m$. Thus every such product is negative,
    and in particular every $z_i$ is nonzero.
  For the original optimal partition, pairing each cell with its own centroid gives
  $ C lt.eq bb(E) max_i chevron.l z_i \, g chevron.r lt.eq C \, $
  where the second inequality is (2.2). The difference between the maximum score and the assigned score is
    nonnegative and has zero integral, so it vanishes almost everywhere.
    The centroids are distinct, and their score ties lie on finitely many Gaussian-null hyperplanes.
    This proves (2.5); overlaps between these closed representatives are immaterial.
  Let $Q = \( chevron.l z_i \, z_j chevron.r \)_(i \, j = 1)^m$ be the Gram matrix. Its row sums vanish by (2.4).
    Hence, for every $a = \( a_1 \, dots.h \, a_m \) in bb(R)^m$,
  #[#set math.equation(numbering: n => "(2.6)")
   $ a^(sans(T)) Q a = sum_(i < j) \( - chevron.l z_i \, z_j chevron.r \) \( a_i - a_j \)^2 . $ <ext:laplacian>]
  All weights are positive, so the kernel of $Q$ consists exactly of constant vectors.
    Its rank is $m - 1$, and the only linear relations among the centroids are multiples of their sum.
    A dependence on a proper subset would have a zero coefficient and therefore must be trivial.
    A relation among $z_i - z_j$, $j eq.not i$, gives a relation among all centroids whose coefficients sum to
    zero; it too must be trivial. This proves the linear-algebra assertions.
  Each $K_i$ depends only on the orthogonal projection onto $V$.
    If $d = dim V$, then orthogonal Gaussian product decomposition identifies $K_i$ with $\( K_i ∩ V \) times
    V^perp$, and its moment is the moment of $K_i ∩ V$ in $V$, extended by zero on $V^perp$.
    If $m lt.eq 4$, then $d lt.eq 3$. Taking the product of this partition of $V tilde.equiv
    bb(R)^d$ with $bb(R)^(3 - d)$ preserves its moment norms.
    The three-dimensional propeller theorem of Heilman, Jagannath, and Naor [4] Theorem 1.1,
    which permits any finite number of cells, would then give $C lt.eq 9 \/ \( 8 pi \)$, contradicting (2.3).
    Thus $m gt.eq 5$. ◻
]

We have reduced a hypothetical counterexample to at least five active cells whose centroid span has dimension one
  less than their number. From now on we work in $V tilde.equiv bb(R)^(m - 1)$, use $K_i$ for the reduced cones,
  and let $g$ be standard Gaussian in this space. Their moments remain exactly $z_i$.
  Inequality (2.2) remains valid for lists in $V$, by embedding them in $bb(R)^n$. Set

#[#set math.equation(numbering: n => "(2.7)")
 $ X_i = chevron.l z_i \, g chevron.r \, wide P_i = gamma_(m - 1) \( K_i \) \, wide r_i =
   frac(parallel z_i parallel, sqrt(C)) . $ <ext:notation>]

Then $P_i > 0$, $r_i > 0$, $sum_i P_i = sum_i r_i^2 = 1$, and $bb(E) max_i X_i = C$.
  Since $sum_i X_i = 0$, a winning score is nonnegative. Thus $K_i subset.eq { X_i gt.eq 0 }$ and

#[#set math.equation(numbering: n => "(2.8)")
 $ P_i lt.eq 1 / 2 wide \( 1 lt.eq i lt.eq m \) . $ <ext:half-probability>]

== 3 Probability bounds for the cells <sc:section>

Throughout this section, we work with the putative extremizer above:
  $C > B^2$, $m gt.eq 5$, and $B = 3 \/ \( 2 sqrt(2 pi) \)$.
  We will obtain lower bounds for each cell probability in terms of its normalized centroid length.
  Since the probabilities sum to one, these bounds constrain how the normalized centroid lengths can be
  distributed among the cells. Every terminating decimal in the proof denotes an exact rational number. Write

$ phi.alt \( x \) = e^(- x^2 \/ 2) / sqrt(2 pi) \, wide Phi \( x \) =
  integral_(- oo)^x phi.alt \( u \) thin d u \, wide r_i = frac(\| z_i \|, sqrt(C)) \, wide P_i =
  gamma_(m - 1) \( K_i \) . $

The winning cone $K_i$ lies in ${ x : chevron.l z_i \, x chevron.r gt.eq 0 }$, because the scores sum to zero.
  Thus $0 < P_i lt.eq 1 \/ 2$.

#thm([Lemma 3.1.])[
  #emph[Set
$ A = cases(delim: "{", 0.929 \, & m = 5 \,, 0.884 \, & m gt.eq 6 .) $

 For every $i$,
#[#set math.equation(numbering: n => "(3.1)")
 $ r_i lt.eq 2 / 3 \, wide P_i gt.eq A r_i^2 \, wide P_i gt.eq 0.415 r_i + 0.15 r_i^2 . $ <sc:three-bounds>]

]
] <sc:bounds>

=== 3.1 Rearrangement bounds <rearrangement-bounds>

Fix a cell, and temporarily suppress its index. Let $e = z \/ \| z \|$, $x = Phi^(- 1) \( 1 - P \)$, and $H =
  { g : chevron.l e \, g chevron.r gt.eq x }$. Since $gamma_(m - 1) \( H \) = P$,

$ \| z \| - integral_H chevron.l e \, g chevron.r thin d gamma_(m - 1) \( g \) =
  integral \( chevron.l e \, g chevron.r - x \) \( 1_K - 1_H \) thin d gamma_(m - 1) \( g \) lt.eq 0 . $

Consequently $\| z \| lt.eq phi.alt \( x \)$. As $sqrt(C) > B = \( 3 \/ 2 \) phi.alt \( 0 \)$,
  this proves $r < 2 \/ 3$ and

#[#set math.equation(numbering: n => "(3.2)")
 $ P / r^2 gt.eq 9 / 4 e^(x^2) Phi \( - x \) . $ <sc:halfspace-ratio>]

For completeness, the minimum on the right can be localized by a one-dimensional argument.
  Put $M \( x \) = phi.alt \( x \) \/ Phi \( - x \)$. The logarithmic derivative of $f \( x \) = \( 9 \/ 4 \)
  e^(x^2) Phi \( - x \)$ is $2 x - M \( x \)$, and

$ M' \( x \) = 1 - "Var" \( Z divides Z > x \) < 1 $

for a standard normal variable $Z$. Hence $\( log f \)'$ is strictly increasing.
  Its signs at $0.6119$ and $0.6121$ are opposite, so $f$ has a unique global minimum in that interval.
  The elementary bounds in Appendix 7 give

#[#set math.equation(numbering: n => "(3.3)")
 $ min_(x in bb(R)) f \( x \) > 0.8843837 > 0.884 . $ <sc:halfspace-minimum>]

This proves the required quadratic estimate when $m gt.eq 6$.

When $m = 5$, conicality improves the estimate. Work in the four-dimensional span of the centroids and write the
  standard Gaussian as $R U$, where $U$ is uniform on $S^3$ and independent of $R$.
  The coordinate $chevron.l e \, U chevron.r$ has density $\( 2 \/ pi \) sqrt(1 - u^2)$ on $\[ - 1 \, 1 \]$.
  The same threshold comparison as above shows that, among spherical sets of measure $P$,
  an upper cap maximizes the first moment in direction $e$.
  Since $P lt.eq 1 \/ 2$, write its threshold as $x in \[ 0 \, 1 \)$. Its probability is

$ p \( x \) = 1 / 2 - frac(arcsin x + x sqrt(1 - x^2), pi) . $

Using $bb(E) R = 3 sqrt(2 pi) \/ 4$, its Gaussian first moment is

$ bb(E) R thin 2 / pi integral_x^1 u sqrt(1 - u^2) thin d u = phi.alt \( 0 \) \( 1 - x^2 \)^(3 \/ 2) . $

It follows that

#[#set math.equation(numbering: n => "(3.4)")
 $ P / r^2 gt.eq R \( x \) := 9 / 4 frac(p \( x \), \( 1 - x^2 \)^3) . $ <sc:cap-ratio>]

To identify the global minimum, define

$ F \( x \) = 6 x p \( x \) - 2 / pi \( 1 - x^2 \)^(3 \/ 2) \, wide H \( x \) = p \( x \) - x / pi sqrt(1 - x^2) . $

Direct differentiation gives

$ R' \( x \) = 9 / 4 frac(F \( x \), \( 1 - x^2 \)^4) \, wide F' \( x \) = 6 H \( x \) \, wide H' \( x \) =
  frac(4 x^2 - 3, pi sqrt(1 - x^2)) . $

Thus $H$ first decreases and then increases. Since $H \( 0 \) = 1 \/ 2$ and $H \( 1 \) = 0$,
  it has exactly one zero in $\( 0 \, 1 \)$; it is negative after that zero.
  Accordingly $F$ first increases and then decreases to $F \( 1 \) = 0$.
  The certified signs $F \( 0.29 \) < 0 < F \( 0.294 \)$ show that $F$ has exactly one interior zero and that this
  zero lies in $\( 0.29 \, 0.294 \)$. It is the unique minimizer of $R$.
  Appendix 7 gives $R \( 0.29 \) > 0.9312526$ and $\| R' \| < 0.03$ on this interval, whence

#[#set math.equation(numbering: n => "(3.5)")
 $ min_(0 lt.eq x < 1) R \( x \) > 0.9311326 > 0.929 . $ <sc:cap-minimum>]

The first two assertions of Lemma 4 follow.

=== 3.2 The loss on removing one score <the-loss-on-removing-one-score>

Rearrangement has supplied the radius bound and the quadratic probability bound.
  To obtain the remaining linear–quadratic estimate in Lemma 4,
  we use the behavior of the winning probability under translation.
  Fix $i$, put $X_j = chevron.l z_j \, g chevron.r$, and set $alpha = m \/ \( m - 1 \)$.
  Removing $z_i$ and recentering the remaining vectors produces $z_j + z_i \/ \( m - 1 \)$, $j eq.not i$,
  whose squared norms sum to $C - alpha \| z_i \|^2$. A common translation of the scores has zero expectation.
  The extremal dual bound therefore gives

$ bb(E) max_(j eq.not i) X_j lt.eq sqrt(C) sqrt(C - alpha \| z_i \|^2) . $

Since $bb(E) max_j X_j = C$, the loss satisfies

#[#set math.equation(numbering: n => "(3.6)")
 $ bb(E) #scale(x: 120%, y: 120%)[\(] X_i - max_(j eq.not i) X_j #scale(x: 120%, y: 120%)[\)]_(+) gt.eq
   C #scale(x: 120%, y: 120%)[\(] 1 - sqrt(1 - alpha r_i^2) #scale(x: 120%, y: 120%)[\)] . $ <sc:loss-lower>]

Here $u_(+) = max \( u \, 0 \)$.

The vectors $z_i - z_j$, $j eq.not i$, form a basis of the centroid span.
  There is therefore a vector $h$ in that span satisfying $chevron.l h \, z_i - z_j chevron.r =
  1$ for every $j eq.not i$. For $u gt.eq 0$, the gap probability is

$ p_i \( u \) := Pr { X_i gt.eq X_j + u upright(" for all ") j eq.not i } = gamma_(m - 1) \( K_i + u h \) . $

Summing the equations defining $h$ gives $chevron.l h \, z_i chevron.r = \( m - 1 \) \/ m = 1 \/ alpha$.
  Differentiation of the translated Gaussian density, justified by Gaussian integrability, yields

#[#set math.equation(numbering: n => "(3.7)")
 $ p'_i \( 0 \) = - integral_(K_i) chevron.l h \, x chevron.r thin d gamma_(m - 1) \( x \) = - chevron.l h \,
   z_i chevron.r = - 1 / alpha . $ <sc:translation-derivative>]

Ehrhard’s inequality states that $Phi^(- 1) compose gamma_(m - 1)$ is concave under Minkowski interpolation of
  convex sets [2]; we use the formulation in [1] Theorem 1.1, which also allows general Borel sets.
  The cone $K_i$ is closed and convex. Its score-difference normals form a basis,
  so it has nonempty interior and is a proper subset of the centroid span.
  Minkowski interpolation of two translates of $K_i$ is the translate with the interpolated displacement.
  Hence $u mapsto Phi^(- 1) \( p_i \( u \) \)$ is concave. All finite translates have measure strictly between
  zero and one, and the derivative at zero exists by (3.7). With $q = Phi^(- 1) \( P_i \)$, the supporting tangent gives

$ p_i \( u \) lt.eq Phi #h(-0.16667em) (q - frac(u, alpha phi.alt \( q \))) wide \( u gt.eq 0 \) . $

Integration, using $\( q Phi \( q \) + phi.alt \( q \) \)' = Phi \( q \)$, gives

#[#set math.equation(numbering: n => "(3.8)")
 $ bb(E) #scale(x: 120%, y: 120%)[\(] X_i - max_(j eq.not i) X_j #scale(x: 120%, y: 120%)[\)]_(+) =
   integral_0^oo p_i \( u \) thin d u lt.eq alpha phi.alt \( q \) #scale(x: 120%, y: 120%)[\(] q Phi \( q \) +
   phi.alt \( q \) #scale(x: 120%, y: 120%)[\)] . $ <sc:loss-upper>]

Define

$ G \( q \) =
  frac(phi.alt \( q \) #scale(x: 120%, y: 120%)[\(] q Phi \( q \) + phi.alt \( q \) #scale(x: 120%, y: 120%)[\)],
  Phi \( q \)^2) . $

Combining (3.6) and (3.8), rationalizing, and canceling $alpha$, we obtain

#[#set math.equation(numbering: n => "(3.9)")
 $ P_i^2 G #scale(x: 120%, y: 120%)[\(] Phi^(- 1) \( P_i \) #scale(x: 120%, y: 120%)[\)] gt.eq
   frac(C r_i^2, 1 + sqrt(1 - alpha r_i^2)) gt.eq frac(B^2 r_i^2, 1 + sqrt(1 - r_i^2)) . $ <sc:loss-constraint>]

=== 3.3 A linear–quadratic probability bound <a-linearquadratic-probability-bound>

The loss constraint is implicit in the cell probability. To extract an explicit lower bound,
  we first prove two monotonicity properties of $G$.

#thm([Lemma 3.2.])[
  #emph[The function $G$ is nonincreasing and satisfies $0 < G \( q \) < 1$. Moreover,
$ P mapsto P^2 G #scale(x: 120%, y: 120%)[\(] Phi^(- 1) \( P \) #scale(x: 120%, y: 120%)[\)] $

 is increasing on $\( 0 \, 1 \/ 2 \]$.]
] <sc:truncated-variance>

#proof[
  Put $lambda = phi.alt \( q \) \/ Phi \( q \)$. Integration of the normal density gives
  $ bb(E) \( Z divides Z lt.eq q \) = - lambda \, wide V \( q \) := "Var" \( Z divides Z lt.eq q \) = 1 -
    q lambda - lambda^2 . $
  Thus $G = 1 - V = lambda \( q + lambda \)$. The distance $U = q - Z$, under this conditioning,
    has positive mean $q + lambda$ and positive variance, proving $0 < G < 1$.
    Its survival function is $S \( u \) = Phi \( q - u \) \/ Phi \( q \)$, $u gt.eq 0$.
    The identity $\( log Phi \)'' \( q \) = - lambda \( q + lambda \) < 0$ shows that $log S$ is concave.
    Its increments therefore satisfy
  $ log S \( u + v \) - log S \( u \) lt.eq log S \( v \) - log S \( 0 \) . $
  Since $S \( 0 \) = 1$, this gives $S \( u + v \) lt.eq S \( u \) S \( v \)$. Integrating over $u \, v gt.eq 0$ gives
  $ 1 / 2 bb(E) U^2 = integral_0^oo #h(-0.16667em) integral_0^oo S \( u + v \) thin d u thin d v
    lt.eq \( bb(E) U \)^2 . $
  Hence $V lt.eq \( q + lambda \)^2$. Direct differentiation now gives
  $ V' \( q \) = lambda #scale(x: 120%, y: 120%)[\(] \( q + lambda \)^2 -
    V \( q \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 \, $
  so $G$ is nonincreasing. Finally, for $q lt.eq 0$, both positive factors of
    $phi.alt \( q \) \( q Phi \( q \) + phi.alt \( q \) \)$ are increasing in $q$, proving the last assertion. ◻
]

We finish the proof of Lemma 4. Set $P_0 \( r \) = \( 0.415 + 0.15 r \) r$ for $0 < r lt.eq 2 \/ 3$.
  Then $P_0 \( r \) lt.eq P_0 \( 2 \/ 3 \) = 103 \/ 300 < 1 \/ 2$. We will prove

#[#set math.equation(numbering: n => "(3.10)")
 $ \( 0.415 + 0.15 r \)^2 G #scale(x: 120%, y: 120%)[\(] Phi^(- 1) \( P_0 \( r \) \)
   #scale(x: 120%, y: 120%)[\)] < frac(B^2, 1 + sqrt(1 - r^2)) . $ <sc:test-probability>]

By Lemma 5 and (3.9), this implies $P_i > P_0 \( r_i \)$, which is stronger than the last assertion of Lemma 4.

Here is a finite interval verification of (3.10). In each row of Table 1,
  $U$ bounds $G \( Phi^(- 1) \( P_0 \( r \) \) \)$ above throughout $\[ a \, b \] ∩ \( 0 \, 2 \/ 3 \]$.
  The first row uses $G < 1$; the other rows follow from monotonicity and the certified quantile bounds in
  Appendix 7. The last column is a strict lower bound for

$ Delta \( a \, b \, U \) := frac(B^2, 1 + sqrt(1 - a^2)) - U \( 0.415 + 0.15 b \)^2 . $

It is positive in every row. The coefficient $\( 0.415 + 0.15 r \)^2$ and the right side of (3.10) are increasing
  in $r$, so these endpoint inequalities cover every point of the intervals, not only their endpoints.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$a$
], table.cell(rowspan: 1, colspan: 1)[$b$
], table.cell(rowspan: 1, colspan: 1)[$U$
], table.cell(rowspan: 1, colspan: 1)[$10^6 Delta \( a \, b \, U \) >$
]),
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0.05
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[542
],
  table.cell(rowspan: 1, colspan: 1)[0.05
], table.cell(rowspan: 1, colspan: 1)[0.14
], table.cell(rowspan: 1, colspan: 1)[0.91
], table.cell(rowspan: 1, colspan: 1)[6173
],
  table.cell(rowspan: 1, colspan: 1)[0.14
], table.cell(rowspan: 1, colspan: 1)[0.24
], table.cell(rowspan: 1, colspan: 1)[0.87
], table.cell(rowspan: 1, colspan: 1)[2976
],
  table.cell(rowspan: 1, colspan: 1)[0.24
], table.cell(rowspan: 1, colspan: 1)[0.33
], table.cell(rowspan: 1, colspan: 1)[0.836
], table.cell(rowspan: 1, colspan: 1)[1328
],
  table.cell(rowspan: 1, colspan: 1)[0.33
], table.cell(rowspan: 1, colspan: 1)[0.41
], table.cell(rowspan: 1, colspan: 1)[0.809
], table.cell(rowspan: 1, colspan: 1)[523
],
  table.cell(rowspan: 1, colspan: 1)[0.41
], table.cell(rowspan: 1, colspan: 1)[0.48
], table.cell(rowspan: 1, colspan: 1)[0.788
], table.cell(rowspan: 1, colspan: 1)[392
],
  table.cell(rowspan: 1, colspan: 1)[0.48
], table.cell(rowspan: 1, colspan: 1)[0.54
], table.cell(rowspan: 1, colspan: 1)[0.771
], table.cell(rowspan: 1, colspan: 1)[1076
],
  table.cell(rowspan: 1, colspan: 1)[0.54
], table.cell(rowspan: 1, colspan: 1)[0.59
], table.cell(rowspan: 1, colspan: 1)[0.756
], table.cell(rowspan: 1, colspan: 1)[2787
],
  table.cell(rowspan: 1, colspan: 1)[0.59
], table.cell(rowspan: 1, colspan: 1)[0.64
], table.cell(rowspan: 1, colspan: 1)[0.743
], table.cell(rowspan: 1, colspan: 1)[4115
],
  table.cell(rowspan: 1, colspan: 1)[0.64
], table.cell(rowspan: 1, colspan: 1)[$2 \/ 3$
], table.cell(rowspan: 1, colspan: 1)[0.73
], table.cell(rowspan: 1, colspan: 1)[8886
],
)
]],
  caption: [Table 1: Bounds proving (3.10). All displayed finite decimals are exact rational numbers. ],
)

== 4 Competition with two other cells <geo:section>

Continue with the minimal-active-cell optimal partition from Lemma 3, satisfying $C > B^2$ and $m gt.eq 5$.
  The scalar estimates constrain one cell at a time. We now use the first-moment identity for the cell with
  smallest centroid norm to obtain constraints on pairs of the other centroids. Relabel the nonzero centroids so that

$ r_1 gt.eq r_2 gt.eq dots.h.c gt.eq r_m = t > 0 \, wide L = r_1^2 + r_2^2 \, wide c = r_3^2 . $

Thus the three largest radii and the chosen smallest radius have distinct indices,
  including when some radii are equal. We will use the centroid identity for this cell to control the joint
  distribution of any two competing scores.

Let $g$ be a standard Gaussian vector in the ambient Euclidean space, and put

$ e = frac(z_m, \| z_m \|) \, wide T = chevron.l e \, g chevron.r \, wide a_j = -
  frac(chevron.l z_m \, z_j chevron.r, \| z_m \|^2) quad \( 1 lt.eq j < m \) . $

Strict negativity of the off-diagonal products and $sum_j z_j = 0$ imply

#[#set math.equation(numbering: n => "(4.1)")
 $ a_j > 0 \, wide sum_(j < m) a_j = 1 . $ <geo:coefficients>]

Define the residual vectors and scores by

$ w_j = z_j / sqrt(C) + a_j t e \, wide Y_j = chevron.l w_j \, g chevron.r . $

Each $w_j$ is orthogonal to $e$. Consequently $Y = \( Y_j \)_(j < m)$ is a centered Gaussian vector independent of
  the standard normal variable $T$, and

#[#set math.equation(numbering: n => "(4.2)")
 $ frac(chevron.l z_j \, g chevron.r, sqrt(C)) = - a_j t T + Y_j . $ <geo:decomposition>]

Its covariance matrix $H$ has entries

#[#set math.equation(numbering: n => "(4.3)")
 $ H_(j k) = frac(chevron.l z_j \, z_k chevron.r, C) - a_j a_k t^2 \, wide h_j := H_(j j) = r_j^2 -
   a_j^2 t^2 . $ <geo:covariance>]

Since $sum_(j < m) w_j = 0$, every row of $H$ sums to zero; also $H_(j k) < 0$ for $j eq.not k$.
  For distinct $j \, k < m$, set

$ D_(j k) = sqrt(h_j h_k - H_(j k)^2) . $

These quantities are positive. Indeed, a linear dependence between $w_j$ and $w_k$ would give a dependence between
  $z_j \, z_k \, z_m$, whereas every proper subset of the centroids is linearly independent and $m gt.eq 5$.
  In particular, all $h_j$ are positive.

#thm([Lemma 4.1.])[
  (Two competing scores).  #emph[For every pair of distinct indices $j \, k < m$,
#[#set math.equation(numbering: n => "(4.4)")
 $ D_(j k) lt.eq 3 / pi thin t \( 1 + a_j \) \( 1 + a_k \) . $ <geo:pair-bound>]

]
] <geo:pair>

#proof[
  Let $K$ be the winning cone for the score $chevron.l z_m \, g chevron.r$.
    The partition agrees with its score cones almost everywhere, so $bb(E) \[ upright(bold(1))_K g \] = z_m$.
    The definitions of $T$ and $Y_j$ give
  #[#set math.equation(numbering: n => "(4.5)")
   $ bb(E) \[ upright(bold(1))_K T \] = \| z_m \| = sqrt(C) thin t > B t \, wide
     bb(E) \[ upright(bold(1))_K Y_j \] = chevron.l w_j \, z_m chevron.r = 0 . $ <geo:centroid-identities>]
  The scores sum to zero. Their maximum is therefore nonnegative, and on $K$ we have, by (4.2),
  $ T gt.eq 0 \, wide Y_j lt.eq \( 1 + a_j \) t T quad \( j < m \) . $
  Fix distinct $j \, k < m$ and write
  $ U = frac(Y_j, \( 1 + a_j \) t) \, wide V = frac(Y_k, \( 1 + a_k \) t) . $
  The pair $\( U \, V \)$ is independent of $T$, and its Gaussian density is bounded above everywhere by
  #[#set math.equation(numbering: n => "(4.6)")
   $ M = frac(t^2 \( 1 + a_j \) \( 1 + a_k \), 2 pi D_(j k)) . $ <geo:density-bound>]
  Here the denominator follows by taking the square root of the covariance determinant after the two rescalings.
  For a real number $x$, write $x_(+) = max { x \, 0 }$. Adding the two zero expectations from (4.5),
    taking a positive part, and then enlarging the integration region yields
  $ bb(E) \[ upright(bold(1))_K T \] & = bb(E) \[ upright(bold(1))_K \( T + U + V \) \]\
 & lt.eq
   bb(E) #scale(x: 120%, y: 120%)[\[]
   upright(bold(1))_({ T gt.eq 0 \, med U lt.eq T \, med V lt.eq T }) \( T + U + V \)_(+)
   #scale(x: 120%, y: 120%)[\]] . $
  For a fixed $s gt.eq 0$, within $u lt.eq s$, $v lt.eq s$ the positive integrand is supported on the triangle
    with vertices $\( s \, s \)$, $\( s \, - 2 s \)$, and $\( - 2 s \, s \)$.
    The corresponding unweighted planar integral is
  $ integral_(u lt.eq s) integral_(v lt.eq s) \( s + u + v \)_(+) thin d v thin d u & =
    integral_0^oo integral_0^oo \( 3 s - a - b \)_(+) thin d b thin d a\
 & = integral_0^(3 s) integral_0^(3 s - a) \( 3 s - a - b \) thin d b thin d a = frac(\( 3 s \)^3, 6) \, $
  where $a = s - u$ and $b = s - v$. Figure 2 shows this integration region and its affine integrand.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-2.2, 1.1), (1.1, 1.1), (1.1, -2.2), close: true, fill: rgb("#e6e6ff"), stroke: none)
  line((-2.926, 0), (1.98, 0), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((1.98, 0), [#text(size: 9pt)[$u$]], anchor: "west", padding: 0.1176cm)
  line((0, -2.882), (0, 1.936), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((0, 1.936), [#text(size: 9pt)[$v$]], anchor: "south", padding: 0.1176cm)
  line((-2.2, 1.1), (1.1, 1.1), (1.1, -2.2), close: true, stroke: (thickness: 0.8pt, cap: "round", join: "round"))
  content((-2.2, 1.241), [#text(size: 9pt)[$(-2s,s)$#linebreak() $h_s=0$]], anchor: "south", padding: 0.1176cm)
  content((1.175, 1.175), [#text(size: 9pt)[$(s,s)$#linebreak() $h_s=3s$]], anchor: "south-west", padding: 0.1176cm)
  content((1.175, -2.275), [#text(size: 9pt)[$(s,-2s)$#linebreak() $h_s=0$]], anchor: "north-west", padding: 0.1176cm)
  content((-0.99, 1.206), [#text(size: 9pt)[$v=s$]], anchor: "south", padding: 0.1176cm)
  content((1.206, -0.88), [#text(size: 9pt)[$u=s$]], anchor: "west", padding: 0.1176cm)
  content((-1.122, -0.1191), [#text(size: 9pt)[$u+v=-s$]], anchor: "north", angle: -45deg, padding: 0.1176cm)
  content((0.572, 0.55), [#text(size: 9pt)[$Delta_s$]])
  circle((0, 0), radius: 0.05292, fill: black, stroke: none)
  content((-0.07484, 0.07484), [#text(size: 9pt)[$(0,0)$#linebreak() $h_s=s$]], anchor: "south-east", padding: 0.1176cm)
})
$ integral_(Delta_s) h_s \( u \, v \) thin d u thin d v =
  underbrace(frac(\( 3 s \)^2, 2), upright("area"))
  underbrace(frac(3 s + 0 + 0, 3), upright("mean affine height")) = frac(27 s^3, 6) . $

],
    caption: [Figure 2: For fixed $T = s > 0$, the positive integrand is supported, within $u lt.eq s$ and $v lt.eq s$, on $Delta_s = { \( u \, v \) : u lt.eq s \, med v lt.eq s \, med s + u + v gt.eq 0 }$. Here $h_s \( u \, v \) = s + u + v$ is an affine height, with the displayed values at the vertices and barycenter. The shading marks the integration region, not the support or density of the Gaussian pair $\( U \, V \)$. Multiplying the unweighted integral by the density bound $M$ gives the estimate used in the proof. At $s = 0$ the triangle degenerates and the integral is zero. ],
  ) <fig:residual-score-triangle>
  Using (4.6), independence, and $bb(E) \[ T_(+)^3 \] = 2 \/ sqrt(2 pi)$, we obtain
  $ B t < bb(E) \[ upright(bold(1))_K T \] lt.eq frac(27 M, 6) thin bb(E) \[ T_(+)^3 \] =
    frac(9 t^2 \( 1 + a_j \) \( 1 + a_k \), 2 pi sqrt(2 pi) thin D_(j k)) . $
  Since $B = 3 \/ \( 2 sqrt(2 pi) \)$, this gives (4.4), in fact with a strict inequality. ◻
]

The pairwise inequality becomes useful for the partition problem when we sum it over competitors with the largest
  centroid lengths. The negative off-diagonal covariances prevent all of these pairwise determinants from being
  small simultaneously.

#thm([Corollary 4.2.])[
  (Constraints on the three largest radii).  #emph[The quantities $L \, c \, t$ satisfy
#[#set math.equation(numbering: n => "(4.7)")
 $ \( c - t^2 \) \( L - c - 2 t^2 \) & lt.eq 8 (3 / pi)^2 t^2 \,\
3 / 2 \( c - t^2 \)^2 & lt.eq 10 (3 / pi)^2 t^2 . $ <geo:first-constraint>]

]
] <geo:constraints>

#proof[
  For the first inequality, the signs and row sums of $H$ give
  $ H_31^2 + H_32^2 lt.eq \( \| H_31 \| + \| H_32 \| \)^2 lt.eq h_3^2 . $
  It follows that
  #[#set math.equation(numbering: n => "(4.8)")
   $ D_31^2 + D_32^2 gt.eq h_3 \( h_1 + h_2 - h_3 \) . $ <geo:row-lower>]
  By (4.3) and $0 < a_j lt.eq 1$,
  $ h_3 gt.eq c - t^2 gt.eq 0 \, wide h_1 + h_2 - h_3 gt.eq L - c - 2 t^2 . $
  If $L - c - 2 t^2 gt.eq 0$, these inequalities and (4.8) show that
  $ D_31^2 + D_32^2 gt.eq \( c - t^2 \) \( L - c - 2 t^2 \) . $
  If $L - c - 2 t^2 < 0$, the same conclusion follows from the nonnegativity of the determinant squares.
  On the other hand, Lemma 6 gives
  $ D_31^2 + D_32^2 lt.eq
    (3 / pi)^2 t^2 \( 1 + a_3 \)^2 #scale(x: 120%, y: 120%)[\(] \( 1 + a_1 \)^2 + \( 1 + a_2 \)^2
    #scale(x: 120%, y: 120%)[\)] . $
  Because $a_1 + a_2 lt.eq 1 - a_3$,
  $ \( 1 + a_1 \)^2 + \( 1 + a_2 \)^2 lt.eq \( 2 - a_3 \)^2 + 1 . $
  For $0 lt.eq x lt.eq 1$, the identity
  $ 8 - \( 1 + x \)^2 #scale(x: 120%, y: 120%)[\(] \( 2 - x \)^2 +
    1 #scale(x: 120%, y: 120%)[\)] = \( 1 - x \)^2 \( 3 - x^2 \) gt.eq 0 $
  therefore proves (4.7).
  For the second inequality, let $rho_(j k) = H_(j k) \/ sqrt(h_j h_k)$ for $1 lt.eq j < k lt.eq 3$.
    These correlations belong to $\[ - 1 \, 0 \]$. Since
  $ 0 lt.eq "Var" (sum_(j = 1)^3 Y_j / sqrt(h_j)) = 3 + 2 sum_(1 lt.eq j < k lt.eq 3) rho_(j k) \, $
  we have
  $ sum_(j < k lt.eq 3) rho_(j k)^2 lt.eq sum_(j < k lt.eq 3) \| rho_(j k) \| lt.eq 3 / 2 . $
  Each $h_j gt.eq c - t^2 gt.eq 0$ for $j lt.eq 3$. Thus
  #[#set math.equation(numbering: n => "(4.9)")
   $ sum_(j < k lt.eq 3) D_(j k)^2 = sum_(j < k lt.eq 3) h_j h_k \( 1 - rho_(j k)^2 \) gt.eq 3 /
     2 \( c - t^2 \)^2 . $ <geo:correlation-lower>]
  To bound the sum furnished by Lemma 6, put
  $ s_1 = a_1 + a_2 + a_3 \, wide s_2 = a_1 a_2 + a_1 a_3 + a_2 a_3 \, wide s_3 = a_1 a_2 a_3 . $
  Equation (4.1) implies $0 lt.eq s_1 lt.eq 1$, $0 lt.eq s_2 lt.eq s_1^2 \/ 3 lt.eq 1 \/ 3$, and $s_3 gt.eq 0$.
    Expanding in these elementary symmetric functions gives
  $ sum_(j < k lt.eq 3) \( 1 + a_j \)^2 \( 1 + a_k \)^2 & = 3 + 4 s_1 + 2 s_1^2 + 2 s_1 s_2 +
    s_2^2 - \( 6 + 2 s_1 \) s_3\
 & lt.eq 3 + 4 + 2 + 2 / 3 + 1 / 9 = 88 / 9 < 10 . $
  Squaring (4.4), summing over the three pairs, and combining with (4.9) proves (4.7). ◻
]

== 5 Excluding five or more active cells <elim:section>

We show that the scalar bounds of Lemma 4 and the geometric constraints of Corollary 7 are incompatible.
  We first confine the smallest radius to $.066 < t < .12$, and then prove $c > 2.6 t$,
  contradicting the second determinant constraint. Throughout this section, the radii are ordered as

$ r_1 gt.eq dots.h.c gt.eq r_m = t > 0 \, wide sum_(j = 1)^m r_j^2 = 1 \, wide L = r_1^2 + r_2^2 \, wide c = r_3^2 . $

Set

#[#set math.equation(numbering: n => "(5.1)")
 $ A = cases(delim: "{", .929 \, & m = 5 \,, .884 \, & m gt.eq 6 \,) wide d = A - .15 \, wide s = .415 / d \, wide
   e \( u \) = .415 u - d u^2 . $ <elim:parameters>]

The probability excesses $delta_j = P_j - A r_j^2$ satisfy, by (3.1),

#[#set math.equation(numbering: n => "(5.2)")
 $ delta_j gt.eq max { 0 \, e \( r_j \) } \, wide sum_(j = 1)^m delta_j = 1 - A . $ <elim:budget>]

All terminating decimals below denote exact rational numbers.
  The finite comparisons are recorded with strict lower bounds;
  the rational arithmetic and square-root enclosures that verify them are described in Appendix 7.

=== 5.1 The third radius and the small-minimum case <the-third-radius-and-the-small-minimum-case>

First we obtain a bound that holds for every value of $t$. For $j gt.eq 3$, the inequality $r_j lt.eq sqrt(c)$ gives

$ e \( r_j \) = r_j^2 (.415 / r_j - d) gt.eq r_j^2 (.415 / sqrt(c) - d) . $

Summing these charges in (5.2) yields

$ \( 1 - L \) (.415 / sqrt(c) - d) lt.eq 1 - A . $

If $A = .929$, add $.045 \( 1 - L \)$ to both sides and bound the added right-hand term by $.045$; if $A = .884$,
  no adjustment is needed. Thus in both cases

#[#set math.equation(numbering: n => "(5.3)")
 $ \( 1 - L \) (.415 / sqrt(c) - .734) lt.eq .116 . $ <elim:common-charge>]

Since $r_j lt.eq 2 \/ 3$, we have $L lt.eq 8 \/ 9$. If $sqrt(c) lt.eq .23$,
  the left side of (5.3) exceeds its right side by at least

$ 1 / 9 (.415 / .23 - .734) - .116 = 101 / 34500 > 0 . $

Consequently

#[#set math.equation(numbering: n => "(5.4)")
 $ sqrt(c) > .23 . $ <elim:third-radius>]

Suppose now that $t lt.eq q_0 := .066$. We contradict (4.7), which reads

#[#set math.equation(numbering: n => "(5.5)")
 $ \( c - t^2 \) \( L - c - 2 t^2 \) lt.eq 8 \( 3 \/ pi \)^2 t^2 . $ <elim:first-constraint>]

If $sqrt(c) gt.eq .44$, then $L gt.eq 2 c$, so the left side is at least

$ \( c - t^2 \) \( c - 2 t^2 \) gt.eq \( .44^2 - q_0^2 \) \( .44^2 - 2 q_0^2 \) . $

Both factors here are positive, and

#[#set math.equation(numbering: n => "(5.6)")
 $ \( .44^2 - q_0^2 \) \( .44^2 - 2 q_0^2 \) - 8 \( 3 \/ pi \)^2 q_0^2 > .00321132 . $ <elim:large-third-small-minimum>]

This contradicts (5.5).

For the remaining range $.23 < sqrt(c) < .44$, use the four intervals in Table 2.
  On an interval $\[ a \, b \]$, the denominator $.415 \/ sqrt(c) - .734$ is positive, and (5.3) gives

$ L - c - 2 t^2 gt.eq 1 - frac(.116, .415 \/ b - .734) - b^2 - 2 q_0^2 = : M \( b \) . $

Also $c - t^2 gt.eq a^2 - q_0^2 > 0$. Every $M \( b \)$ is positive,
  and the last column of the table contradicts (5.5). Thus

#[#set math.equation(numbering: n => "(5.7)")
 $ t > .066 . $ <elim:minimum-lower>]

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$\[ a \, b \]$
], table.cell(rowspan: 1, colspan: 1)[Lower bound for $M \( b \)$
], table.cell(rowspan: 1, colspan: 1)[Lower bound for $\( a^2 - q_0^2 \) M \( b \) - 8 \( 3 \/ pi \)^2 q_0^2$
]),
  table.cell(rowspan: 1, colspan: 1)[$\[ .23 \, .30 \]$
], table.cell(rowspan: 1, colspan: 1)[$.72264$
], table.cell(rowspan: 1, colspan: 1)[$.00330237$
],
  table.cell(rowspan: 1, colspan: 1)[$\[ .30 \, .35 \]$
], table.cell(rowspan: 1, colspan: 1)[$.61198$
], table.cell(rowspan: 1, colspan: 1)[$.02063552$
],
  table.cell(rowspan: 1, colspan: 1)[$\[ .35 \, .41 \]$
], table.cell(rowspan: 1, colspan: 1)[$.40621$
], table.cell(rowspan: 1, colspan: 1)[$.01621418$
],
  table.cell(rowspan: 1, colspan: 1)[$\[ .41 \, .44 \]$
], table.cell(rowspan: 1, colspan: 1)[$.24314$
], table.cell(rowspan: 1, colspan: 1)[$.00803616$
],
)
]],
  caption: [Table 2: Strict lower bounds excluding $t lt.eq .066$ when $sqrt(c) < .44$. ],
)

=== 5.2 Bounding the remaining radii <bounding-the-remaining-radii>

We next prove that

#[#set math.equation(numbering: n => "(5.8)")
 $ r_j lt.eq .42 wide \( j gt.eq 4 \) . $ <elim:tail-cap>]

Suppose instead that $r_4 > .42$, and put

$ K = frac(d dot.op .42, s + .42) . $

For every $u gt.eq .42$ we have

#[#set math.equation(numbering: n => "(5.9)")
 $ max { 0 \, e \( u \) } gt.eq K \( s^2 - u^2 \) . $ <elim:clipped-charge>]

Indeed, when $u lt.eq s$, use

$ e \( u \) = frac(d u, s + u) \( s^2 - u^2 \) quad upright("and") quad frac(u, s + u) gt.eq frac(.42, s + .42) . $

When $u > s$, the right side of (5.9) is negative, so nonnegativity proves the inequality.
  Applying this to the first four radii and using the minimum radius on the others gives

$ sum_(j = 1)^4 delta_j gt.eq K (4 s^2 - sum_(j = 1)^4 r_j^2) gt.eq K #scale(x: 120%, y: 120%)[\(] 4 s^2 -
  1 + \( m - 4 \) t^2 #scale(x: 120%, y: 120%)[\)] . $

For $j gt.eq 5$, ordering and normalization give $r_j lt.eq 1 \/ sqrt(5)$.
  By (5.7), these radii lie in $\[ .066 \, 1 \/ sqrt(5) \]$. Concavity of $e$ therefore gives

$ delta_j gt.eq min { e \( .066 \) \, e \( 1 \/ sqrt(5) \) } = e \( .066 \) . $

The last equality follows from Table 3, where $e \( .066 \) = .023996676$ for $A = .929$ and
  $e \( .066 \) = .024192696$ for $A = .884$. Combining the charges and replacing $t$ by $.066$ proves

#[#set math.equation(numbering: n => "(5.10)")
 $ 1 - A gt.eq K #scale(x: 120%, y: 120%)[\(] 4 s^2 - 1 + \( m - 4 \) \( .066 \)^2
   #scale(x: 120%, y: 120%)[\)] + \( m - 4 \) e \( .066 \) . $ <elim:four-charge>]

The right side increases with $m$, with increment $K \( .066 \)^2 + e \( .066 \) > 0$.
  At the smallest permitted $m$, its excess over $1 - A$ is already positive by Table 3.
  This contradiction proves (5.8).

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$A$
], table.cell(rowspan: 1, colspan: 1)[smallest $m$
], table.cell(rowspan: 1, colspan: 1)[Lower bound for $e \( 1 \/ sqrt(5) \)$
], table.cell(rowspan: 1, colspan: 1)[Lower bound for the right side of (5.10) minus $1 - A$
]),
  table.cell(rowspan: 1, colspan: 1)[$.929$
], table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$.02979364$
], table.cell(rowspan: 1, colspan: 1)[$.00092980$
],
  table.cell(rowspan: 1, colspan: 1)[$.884$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$.03879364$
], table.cell(rowspan: 1, colspan: 1)[$.02229774$
],
)
]],
  caption: [Table 3: Strict lower bounds excluding four radii greater than $.42$. ],
)

Put $k = 2$ when $m = 5$ and $k = 3$ when $m gt.eq 6$. There are at least $k$ indices after the first three,
  and their radii belong to $\[ t \, .42 \]$. Their charges are each at least $min { e \( t \) \, e \( .42 \) }$.
  Moreover,

#[#set math.equation(numbering: n => "(5.11)")
 $ k e \( .42 \) - \( 1 - A \) = cases(delim: "{", .0027688 \, & A = .929 \,, .0184672 \, & A = .884 .)
   $ <elim:cap-budget>]

Hence (5.2) forces $k e \( t \) lt.eq 1 - A$. Let $t_0$ be the smaller root of $k e \( u \) = 1 - A$:

#[#set math.equation(numbering: n => "(5.12)")
 $ t_0 = frac(.415 - sqrt(.415^2 - 4 d \( 1 - A \) \/ k), 2 d) . $ <elim:tzero>]

Equation (5.11) places $.42$ strictly between the two roots of this concave quadratic.
  Since $t lt.eq .42$, the larger-root alternative is excluded, and $t lt.eq t_0$. The enclosures

#[#set math.equation(numbering: n => "(5.13)")
 $ .1070554 < t_0 < .1070555 & wide \( A = .929 \) \,\
.1176565 < t_0 < .1176566 & wide \( A = .884 \) $ <elim:tzero-enclosures>]

imply $t_0 < .109$ in the first case and $t_0 < .12$ in both cases.
  Furthermore, $e \( .42 \) > \( 1 - A \) \/ k gt.eq e \( t \)$,
  so each of the $k$ selected indices contributes at least $e \( t \)$.

=== 5.3 The final contradiction <the-final-contradiction>

We claim that

#[#set math.equation(numbering: n => "(5.14)")
 $ c > 2.6 t . $ <elim:third-versus-minimum>]

Otherwise, (5.4) places the third radius in $\[ .23 \, sqrt(2.6 t) \]$.
  It is distinct from the $k$ indices just charged, so concavity of $e$ and (5.2) imply

#[#set math.equation(numbering: n => "(5.15)")
 $ 1 - A gt.eq min { e \( .23 \) \, e \( sqrt(2.6 t) \) } + k e \( t \) . $ <elim:last-budget>]

We check both possible endpoint charges on the entire interval $\[ .066 \, t_0 \]$.

First, $e$ is increasing up to $t_0$, the smaller root in (5.12). Thus

$ e \( .23 \) + k e \( t \) - \( 1 - A \) gt.eq e \( .23 \) + k e \( .066 \) - \( 1 - A \) > 0 \, $

by Table 4. Second, the function

$ F \( t \) = e \( sqrt(2.6 t) \) + k e \( t \) = .415 sqrt(2.6 t) - 2.6 d t + k \( .415 t - d t^2 \) $

is strictly concave for $t > 0$, since

$ F'' \( t \) = - frac(.415 sqrt(2.6), 4 t^(3 \/ 2)) - 2 k d < 0 . $

Its minimum on $\[ .066 \, t_0 \]$ is therefore attained at an endpoint.
  Table 4 gives $F \( .066 \) > 1 - A$ and $2.6 t_0 < s^2$.
  The latter implies $e \( sqrt(2.6 t_0) \) > 0$; since $k e \( t_0 \) = 1 - A$, it also gives $F \( t_0 \) > 1 -
  A$. These inequalities contradict (5.15) and prove (5.14).

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$A$
], table.cell(rowspan: 1, colspan: 1)[Exact value of $e \( .23 \) + k e \( .066 \) - \( 1 - A \)$
], table.cell(rowspan: 1, colspan: 1)[Lower bound for $F \( .066 \) - \( 1 - A \)$
], table.cell(rowspan: 1, colspan: 1)[Lower bound for $s^2 - 2.6 t_0$
]),
  table.cell(rowspan: 1, colspan: 1)[$.929$
], table.cell(rowspan: 1, colspan: 1)[$.031234252$
], table.cell(rowspan: 1, colspan: 1)[$.01522916$
], table.cell(rowspan: 1, colspan: 1)[$.00546157$
],
  table.cell(rowspan: 1, colspan: 1)[$.884$
], table.cell(rowspan: 1, colspan: 1)[$.013199488$
], table.cell(rowspan: 1, colspan: 1)[$.00253590$
], table.cell(rowspan: 1, colspan: 1)[$.01376450$
],
)
]],
  caption: [Table 4: Positive endpoint margins for (5.15). The second column is exact; the last two columns give strict lower bounds. ],
)

Finally, (4.7), (5.14), and $0 < t < .12$ give

$ 10 \( 3 \/ pi \)^2 t^2 gt.eq 1.5 \( c - t^2 \)^2 > 1.5 \( 2.6 - .12 \)^2 t^2 . $

But

$ 1.5 \( 2.6 - .12 \)^2 - 10 \( 3 \/ pi \)^2 > .10667806 > 0 . $

This contradiction rules out $C > B^2$ and completes the upper bound.

#proof[
  #emph[Completion of the proof of Theorem 1.] Section 5 rules out $C >
    9 \/ \( 8 pi \)$ for the supremum defined in Section 2. The product-and-empty-cell reduction at the start of
    that section transfers this bound to every dimension and finite cell count.
    The construction in Section 1.1 attains the bound whenever $d gt.eq 2$ and $k gt.eq 3$. ◻
]

=== 5.4 Gaussian maxima <gaussian-maxima>

The partition bound also gives a sharp inequality for Gaussian maxima.
  The four-score version appears in Heilman, Jagannath, and Naor [4] Theorem 1.2;
  Gaussian partition duality is due to Khot and Naor [5] Lemma 3.7.
  Subtracting the common average score gives the following centered form in every dimension.

#thm([Corollary 5.1.])[
  (Gaussian maxima).  #emph[Let $d \, k$ be positive integers, let $g$ be standard Gaussian in $bb(R)^d$,
    and let $v_1 \, dots.h \, v_k in bb(R)^d$, with $macron(v) = k^(- 1) sum_(i = 1)^k v_i$. Then
$ bb(E) max_(1 lt.eq i lt.eq k) chevron.l v_i \, g chevron.r lt.eq
  frac(3, 2 sqrt(2 pi)) (sum_(i = 1)^k parallel v_i - macron(v) parallel^2)^(1 \/ 2) . $

 The constant is sharp already for three vectors in the plane.]
] <cor:gaussian-maxima>

#proof[
  Put $u_i = v_i - macron(v)$. Subtracting the common score $chevron.l macron(v) \,
    g chevron.r$ leaves the expected maximum unchanged. Partition $bb(R)^d$ according to the largest score
    $chevron.l u_i \, x chevron.r$, resolving ties by the smallest index,
    and let $z_i$ be the Gaussian first moments of these cells. Then Theorem 1 and Cauchy–Schwarz give
  $ bb(E) max_i chevron.l v_i \, g chevron.r = sum_i chevron.l u_i \, z_i chevron.r lt.eq
    (sum_i parallel u_i parallel^2)^(1 \/ 2) (sum_i parallel z_i parallel^2)^(1 \/ 2) lt.eq
    frac(3, 2 sqrt(2 pi)) (sum_i parallel u_i parallel^2)^(1 \/ 2) . $
  For sharpness, take the three centroid vectors of the planar propeller in Section 1.1.
    Their sum is zero, their score cells are the propeller sectors, and both inequalities are equalities. ◻
]

Every finite centered jointly Gaussian vector $\( X_1 \, dots.h \, X_k \)$ can be written as
  $\( chevron.l v_i \, g chevron.r \)_(i = 1)^k$, including when its covariance is singular.
  Thus the corollary also bounds its expected maximum by $3 \/ \( 2 sqrt(2 pi) \)$ times
  $#scale(x: 120%, y: 120%)[\(] sum_i "Var" \( X_i - macron(X) \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)$,
  where $macron(X) = k^(- 1) sum_i X_i$.

== 6 A kernel-clustering application <kc:section>

=== 6.1 The objective and the approximation threshold <the-objective-and-the-approximation-threshold>

This application uses Theorem 1, the kernel-clustering results of Khot and Naor,
  and the companion paper #emph[The Unique Games Theorem]. None of these complexity arguments is used in the proof
  of the Gaussian inequality.

Fix an integer $k gt.eq 3$. An input is an explicitly represented rational symmetric matrix
  $A = \( a_(p q) \)_(p \, q = 1)^N$ satisfying $A succ.curly.eq 0$ and $A upright(bold(1)) = 0$.
  The latter is the centering condition; for a positive semidefinite matrix it is equivalent to $sum_(p \, q)
  a_(p q) = 0$. For a map $sigma : \[ N \] arrow.r \[ k \]$, define

#[#set math.equation(numbering: n => "(6.1)")
 $ "val"_A \( sigma \) = sum_(p \, q = 1)^N a_(p q) upright(bold(1))_({ sigma \( p \) = sigma \( q \) }) \, wide
   "Clust" \( A divides I_k \) = max_(sigma : \[ N \] arrow.r \[ k \]) "val"_A \( sigma \) . $ <kc:value>]

Here $\[ m \] = { 1 \, dots.h \, m }$, and $I_k$ is the $k$-by-$k$ identity target matrix.
  The sum is over ordered pairs and includes the diagonal. Equivalently,
  it is $sum_(i = 1)^k sum_(p \, q in S_i) a_(p q)$ for the cells $S_i = sigma^(- 1) \( i \)$;
  empty cells are allowed. There is no normalization by cell cardinalities.
  Each objective value is nonnegative, since it is a sum of quadratic forms $upright(bold(1))_(S_i)^(sans(T)) A
  upright(bold(1))_(S_i)$.

A deterministic approximation with #emph[loss factor] $alpha gt.eq
  1$ returns an assignment of value at least $"Clust" \( A divides I_k \) \/ alpha$.
  An expected approximation has the same inequality with the returned value replaced by its expectation. Put

$ c_(*) = frac(9, 8 pi) \, wide alpha_k = frac(1 - 1 \/ k, c_(*)) = frac(8 pi, 9) (1 - 1 / k) . $

===== 6.1.1 The matching rounding constant. <the-matching-rounding-constant.>

Khot and Naor’s approximation theorem [5] Theorem 2.1 gives the expected rounding bound

$ bb(E) "val"_A \( sigma \) gt.eq frac("Clust" \( A divides I_k \), alpha_k) $

on the inputs in (6.1). This is their endpoint analytic guarantee using an optimal semidefinite relaxation and
  ideal Gaussian sampling. We quote this rounding guarantee separately from the rational-input hardness statement
  below; an exact finite-bit implementation at the endpoint is not asserted here.

#thm([Theorem 6.1.])[
  (Kernel-clustering hardness).  #emph[For each fixed $k gt.eq 3$ and every fixed $1 lt.eq alpha < alpha_k$,
    it is NP-hard, given a rational symmetric matrix $A succ.curly.eq 0$ with $A upright(bold(1)) =
    0$ and the identity-target objective (6.1), to find $sigma : \[ N \] arrow.r \[ k \]$ such that
$ "val"_A \( sigma \) gt.eq "Clust" \( A divides I_k \) \/ alpha . $

 In particular, such a deterministic polynomial-time approximation would imply $upright(P) = upright("NP")$.]
] <kc:main>

We prove the hardness statement below. It concerns strict improvement over $alpha_k$, not hardness at the endpoint.

For the more general objective $sum_(p \, q) a_(p q) b_(sigma \( p \) sigma \( q \))$ with a fixed positive
  semidefinite target matrix $B = \( b_(i j) \)_(i \, j = 1)^k$,
  Khot and Naor later characterized the Unique Games hardness threshold for approximating the optimal clustering
  value through geometric and Gaussian partition parameters [6] Theorem 1.1.
  Here the target is $I_k$, and the Gaussian constant is supplied by Theorem 1.

=== 6.2 The two external hardness inputs <the-two-external-hardness-inputs>

The Gaussian parameter in Khot and Naor’s theorem is

$ C_k := sup_(\( B_1 \, dots.h \, B_k \)) sum_(i = 1)^k ∥integral_(B_i) x thin d gamma_(k - 1) \( x \)∥^2 . $

The supremum ranges over measurable partitions of $bb(R)^(k - 1)$, with empty cells allowed.
  Since $k gt.eq 3$, Theorem 1 and the attaining example in Section 1.1 give

#[#set math.equation(numbering: n => "(6.2)")
 $ C_k = c_(*) . $ <kc:gaussian-constant>]

We first specify the discrete analytic input. Let $Omega = \[ k \]$ have uniform probability measure.
  Choose a real orthonormal basis $b_0 \, b_1 \, dots.h \, b_(k - 1)$ of functions on $Omega$, with $b_0 = 1$.
  For $r in bb(N)$ and $nu in { 0 \, dots.h \, k - 1 }^r$, write

$ b_nu \( x \) = product_(j = 1)^r b_(nu_j) \( x_j \) \, wide \| nu \| = \| { j :
  nu_j eq.not 0 } #scale(x: 120%, y: 120%)[\|] . $

Every $h : Omega^r arrow.r bb(R)$ has expansion $h = sum_nu hat(h) \( nu \) b_nu$,
  with coefficients computed using uniform probability measure. For real $D gt.eq 0$, set

#[#set math.equation(numbering: n => "(6.3)")
 $ "Inf"_j^(lt.eq D) \( h \) = sum_(\| nu \| lt.eq D\
nu_j eq.not 0) hat(h) \( nu \)^2 . $ <kc:influence>]

Thus a nonintegral cutoff is interpreted by the displayed inequality on the integer $\| nu \|$.
  Let $P_1$ be orthogonal projection onto the span of $b_nu$ with $\| nu \| = 1$, and,
  for $f = \( f_1 \, dots.h \, f_k \)$, put

$ "OBJ" \( f \) = sum_(i = 1)^k parallel P_1 f_i parallel_2^2 . $

All $L_2$ norms in this section use uniform probability measure. Define the closed simplex with slack by

$ Delta_k = { u in bb(R)^k : u_i gt.eq 0 \, med sum_(i = 1)^k u_i lt.eq 1 } . $

#thm([Theorem 6.2.])[
  (Khot–Naor low-influence bound).  #emph[For fixed $k$ and every $eta > 0$, there exists $0 < tau_0 < 1 \/ 2$,
    independent of $r$, such that every $r in bb(N)$ and every $f : Omega^r arrow.r Delta_k$ satisfying
$ "Inf"_j^(lt.eq log \( 1 \/ tau_0 \)) \( f_i \) lt.eq tau_0 quad \( i in \[ k \] \, med j in \[ r \] \) $

 obey $"OBJ" \( f \) lt.eq C_k + eta$.]
] <kc:kn-input>

This is [5] Theorem 3.8, with the same uniform product measure, Fourier degree, simplex,
  and Gaussian normalization. Its proof uses the invariance principle of Mossel, O’Donnell,
  and Oleszkiewicz [8] to compare low-influence functions on product spaces with their Gaussian counterparts.
  The restriction $tau_0 < 1 \/ 2$ is harmless: decreasing the threshold and increasing the degree cutoff
  strengthen the hypotheses. Choose a rational $0 < tau < min { tau_0 \, 1 \/ 2 }$ and set

#[#set math.equation(numbering: n => "(6.4)")
 $ D = max { 1 \, ceil.l log \( 1 \/ tau \) ceil.r } . $ <kc:cutoff>]

Monotonicity of (6.3) in the cutoff gives the useful contrapositive

#[#set math.equation(numbering: n => "(6.5)")
 $ "OBJ" \( f \) > C_k + eta quad arrow.r.double quad "Inf"_j^(lt.eq D) \( f_i \) > tau upright(" for some ") i
   in \[ k \] \, med j in \[ r \] . $ <kc:contrapositive>]

Indeed, if every influence at cutoff $D$ were at most $tau$,
  every influence at the original cutoff would be at most $tau_0$.

The second input is the following exact interface of [9] Theorem 1.1.

#thm([Theorem 6.3.])[
  (Unique Games input).  #emph[For every fixed $epsilon \, delta in \( 0 \, 1 \/ 2 \)$,
    there are an integer $s gt.eq 1$ and a deterministic polynomial-time reduction from $upright(3 S A T)$ to
    explicit unweighted simple bipartite Unique Games instances over $bb(F)_2^s$.
    If the formula is satisfiable the game has a labeling satisfying at least $1 - epsilon$ of its edges;
    if it is unsatisfiable every labeling satisfies at most $delta$ of its edges.
    The edge set is nonempty and each constraint is a translation of the alphabet.
    The alphabet size and the polynomial’s degree and constants depend only on $epsilon \, delta$.]
] <kc:ug-input>

Only ordinary satisfied-edge fractions are asserted here.
  We will use neither regularity nor the stronger condition that almost every left vertex has all its incident
  constraints satisfied.

=== 6.3 A rational centered positive semidefinite matrix <a-rational-centered-positive-semidefinite-matrix>

Let $G = \( V \, W \, E \)$ be a game supplied by Theorem 11, and enumerate its alphabet as $\[ r \]$, where $r =
  2^s$. Reorient constraints if necessary so that the permutation $pi_(v w) : \[ r \]
  arrow.r \[ r \]$ attached to $v w in E$ is satisfied precisely when

$ ell \( v \) = pi_(v w) \( ell \( w \) \) . $

Translations are permutations, so this changes no game value. Delete isolated vertices, put $M = \| E \|$, and write

$ d_v = \| N \( v \) \| \, wide mu \( v \) = d_v / M quad \( v in V \) . $

Choosing $v$ with probability $mu \( v \)$, then a uniform $w in N \( v \)$, chooses an edge uniformly.

To fix the permutation convention, for a permutation $pi$ define

$ \( R_pi x \)_a = x_(pi \( a \)) quad \( a in \[ r \] \) . $

For a scalar table $h : W times Omega^r arrow.r bb(R)$, define

#[#set math.equation(numbering: n => "(6.6)")
 $ \( T_v h \) \( x \) = 1 / d_v sum_(w in N \( v \)) h \( w \, R_(pi_(v w)) x \) \, wide Q \( h \) =
   sum_(v in V) mu \( v \) parallel P_1 T_v h parallel_2^2 . $ <kc:averaging>]

The output matrix will represent $Q$ in the ordinary, unnormalized Euclidean coordinates of the table $h$.

#thm([Lemma 6.4.])[
  #emph[For fixed $k \, r$, one can construct in deterministic polynomial time a rational symmetric matrix $A$,
    indexed by $W times Omega^r$, such that
$ h^(sans(T)) A h = Q \( h \) \, wide A succ.curly.eq 0 \, wide A upright(bold(1)) = 0 . $

 For every $sigma : W times Omega^r arrow.r \[ k \]$, if $F_i \( w \, x \) =
   upright(bold(1))_({ sigma \( w \, x \) = i })$, then
#[#set math.equation(numbering: n => "(6.7)")
 $ "val"_A \( sigma \) = sum_(v in V) mu \( v \) "OBJ" \( F_v \) \, wide
   F_v = \( T_v F_1 \, dots.h \, T_v F_k \) : Omega^r arrow.r Delta_k . $ <kc:objective-identity>]

 All output assignment values lie in $\[ 0 \, 1 \]$.]
] <kc:matrix>

#proof[
  Put $q = k^r$. The projection $P_1$, written as a matrix acting on the counting-coordinate vector
    $\( h \( x \) \)_(x in Omega^r)$, is
  #[#set math.equation(numbering: n => "(6.8)")
   $ \( P_1 \)_(x \, y) = 1 / q sum_(j = 1)^r #scale(x: 120%, y: 120%)[\(] k upright(bold(1))_({ x_j = y_j }) -
     1 #scale(x: 120%, y: 120%)[\)] . $ <kc:projection-matrix>]
  To see this, the centered subspaces of functions of distinct individual coordinates are mutually orthogonal. Hence
  $ \( P_1 h \) \( x \) = sum_(j = 1)^r #scale(x: 120%, y: 120%)[\(] bb(E) \[ h \( X \) divides X_j = x_j \] -
    bb(E) h \( X \) #scale(x: 120%, y: 120%)[\)] \, $
  which is (6.8). This matrix is rational, symmetric and idempotent. The counting-coordinate matrix of $T_v$ has entries
  $ \( T_v \)_(x \, \( w \, y \)) = 1 / d_v upright(bold(1))_({ w in N \( v \) })
    upright(bold(1))_({ y = R_(pi_(v w)) x }) . $
  Define
  #[#set math.equation(numbering: n => "(6.9)")
   $ A = 1 / q sum_(v in V) mu \( v \) T_v^(sans(T)) P_1 T_v . $ <kc:matrix-formula>]
  There are two factors $q^(- 1)$: one in (6.8), and one outside the sum in (6.9) because $L_2$ uses probability
    measure. Symmetry and $P_1^2 = P_1$ give
  $ h^(sans(T)) A h = sum_v mu \( v \) 1 / q parallel P_1 T_v h parallel_(ell_2)^2 = Q \( h \) gt.eq 0 . $
  Also $T_v upright(bold(1)) = upright(bold(1))$ and $P_1 upright(bold(1)) = 0$,
    so (6.9) gives $A upright(bold(1)) = 0$.
  There are $N = \| W \| k^r$ output indices. For fixed $k \, r$ this is polynomial in the explicit game size,
    and the dense matrix can be computed by rational arithmetic in polynomial time.
    Its entries are sums of terms with denominators dividing $M d_v q^2$.
    A common denominator divides $M q^2 product_(v in V) d_v$,
    whose bit length is $O \( log M + sum_v log d_v + log q \)$,
    and the numerators also have polynomial bit length. No irrational Fourier basis needs to be constructed.
  By definition of the ordered sum, $"val"_A \( sigma \) = sum_i F_i^(sans(T)) A F_i$;
    inserting (6.6) proves (6.7). Every $F_v \( x \)$ is an average of coordinate unit vectors,
    so its entries are nonnegative and sum to one. Parseval and orthogonal projection give
  #[#set math.equation(numbering: n => "(6.10)")
   $ 0 lt.eq "OBJ" \( F_v \) lt.eq sum_(i = 1)^k parallel F_(v \, i) parallel_2^2 lt.eq
     bb(E) sum_(i = 1)^k F_(v \, i) = 1 . $ <kc:objective-bound>]
  Since $sum_v mu \( v \) = 1$, the last claim follows. ◻
]

=== 6.4 Completeness and weighted decoding <completeness-and-weighted-decoding>

The next two lemmas compare ordinary edge-value completeness and soundness with the kernel objective.
  They adapt the Khot–Naor reduction [5] Section 3.3 to the precise input of Theorem 11.

#thm([Lemma 6.5.])[
  (Completeness).  #emph[If a labeling of $G$ satisfies at least $1 - epsilon$ of its edges,
    then the matrix of Lemma 12 satisfies
$ "Clust" \( A divides I_k \) gt.eq (1 - 1 / k) \( 1 - epsilon \)^2 . $

]
] <kc:completeness>

#proof[
  Use a witnessing labeling $ell$ to set $sigma \( w \, x \) = x_(ell \( w \))$.
    For $j in \[ r \]$, let $D_j \( x \) = e_(x_j)$, where $e_1 \, dots.h \,
    e_k$ are the coordinate unit vectors in $bb(R)^k$. With
  $ p_(v \, j) = Pr_(w in N \( v \)) { pi_(v w) \( ell \( w \) \) = j } \, $
  the chosen permutation convention gives $F_v = sum_(j = 1)^r p_(v \, j) D_j$.
    For each $i$, the level-one part of the $i$-th component of $D_j$ is $upright(bold(1))_({ x_j = i }) -
    1 \/ k$. These parts for different $j$’s are orthogonal. Moreover,
  $ sum_(i = 1)^k bb(E) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ X_j = i }) -
    1 \/ k #scale(x: 120%, y: 120%)[\)]^2 = 1 - 1 / k . $
  It follows that
  $ "OBJ" \( F_v \) = (1 - 1 / k) sum_(j = 1)^r p_(v \, j)^2 gt.eq (1 - 1 / k) p_(v \, ell \( v \))^2 . $
  The weighted mean $bb(E)_(v tilde.op mu) p_(v \, ell \( v \))$ is exactly the satisfied-edge fraction of $ell$,
    and is therefore at least $1 - epsilon$. Jensen’s inequality and (6.7) prove the claim. ◻
]

#thm([Lemma 6.6.])[
  (Soundness).  #emph[Fix $eta > 0$ with $C_k + 2 eta < 1$, and choose $tau \, D$ as in (6.4) for this $eta$.
    If every labeling of $G$ satisfies at most $delta$ of its edges, where
#[#set math.equation(numbering: n => "(6.11)")
 $ 0 < delta < frac(eta tau^2, 4 k D) \, $ <kc:delta>]

 then $"Clust" \( A divides I_k \) lt.eq C_k + 2 eta$.]
] <kc:soundness>

#proof[
  Suppose an assignment $sigma$ gives a larger value, and use the functions in Lemma 12. Let
  $ V_(upright("good")) = { v : "OBJ" \( F_v \) > C_k + eta } . $
  If its $mu$-mass is $beta$, then (6.10) gives
  $ sum_v mu \( v \) "OBJ" \( F_v \) lt.eq beta + \( 1 - beta \) \( C_k + eta \) lt.eq C_k + eta + beta . $
  The assumed objective therefore forces $beta > eta$.
  For every $v in V_(upright("good"))$, (6.5) supplies $i_v in \[ k \]$ and $j_v
    in \[ r \]$ with $"Inf"_(j_v)^(lt.eq D) \( F_(v \, i_v) \) > tau$.
    Taking the squared norm of the relevant Fourier coefficients in the neighbor average, and using convexity, gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ "Inf"_(j_v)^(lt.eq D) \( F_(v \, i_v) \) lt.eq 1 / d_v sum_(w in N \( v \))
     "Inf"_(pi_(v w)^(- 1) \( j_v \))^(lt.eq D) \( F_(i_v) \( w \, dot.op \) \) . $ <kc:influence-average>]
  The inverse permutation in this formula follows directly from $\( R_pi x \)_a = x_(pi \( a \))$:
    the Fourier indices involving left coordinate $j_v$ come from right coordinate $pi^(- 1) \( j_v \)$.
    Every influence on the right belongs to $\[ 0 \, 1 \]$, by Parseval and $0 lt.eq F_i \( w \, dot.op \) lt.eq
    1$. An average exceeding $tau$ has more than a $tau \/ 2$ fraction of its entries at least $tau \/ 2$:
    otherwise its average is at most $tau \/ 2 + \( tau \/ 2 \) dot.op 1 lt.eq tau$.
  For each $w in W$, form the finite label list
  $ L \( w \) = { a in \[ r \] : "Inf"_a^(lt.eq D) \( F_i \( w \, dot.op \) \) gt.eq
    tau \/ 2 upright(" for some ") i in \[ k \] } . $
  For every scalar $h$, counting how often a Fourier coefficient contributes gives
  $ sum_(a = 1)^r "Inf"_a^(lt.eq D) \( h \) = sum_(\| nu \| lt.eq D) \| nu \| thin hat(h) \( nu \)^2 lt.eq
    D parallel h parallel_2^2 . $
  Consequently
  #[#set math.equation(numbering: n => "(6.13)")
   $ \| L \( w \) \| tau / 2 lt.eq sum_(i = 1)^k sum_(a = 1)^r "Inf"_a^(lt.eq D) \( F_i \( w \, dot.op \) \) lt.eq
     k D \, wide \| L \( w \) \| lt.eq frac(2 k D, tau) . $ <kc:list-size>]
  Label a good $v$ by $j_v$, and other left vertices arbitrarily.
    Independently label each right vertex uniformly from $L \( w \)$ when this list is nonempty,
    and arbitrarily otherwise. For a good $v$, more than a $tau \/
    2$ fraction of its neighbors have $pi_(v w)^(- 1) \( j_v \) in L \( w \)$, by (6.12).
    On each such edge the random label at $w$ satisfies the constraint with probability at least
    $tau \/ \( 2 k D \)$, by (6.13). The expected fraction of satisfied edges is therefore greater than
  $ eta dot.op tau / 2 dot.op frac(tau, 2 k D) = frac(eta tau^2, 4 k D) . $
  Here the weights $mu \( v \) = d_v \/ M$ ensure that this is the uniform-edge fraction.
    Some deterministic labeling attains at least its expectation, contradicting (6.11). ◻
]

=== 6.5 Completing the reduction <completing-the-reduction>

#proof[
  Fix $k gt.eq 3$ and $1 lt.eq alpha < alpha_k$. First choose rational $epsilon \,
    eta > 0$ sufficiently small that $epsilon < 1 \/ 2$, $c_(*) + 2 eta < 1$, and
  #[#set math.equation(numbering: n => "(6.14)")
   $ alpha < frac(\( 1 - 1 \/ k \) \( 1 - epsilon \)^2, c_(*) + 2 eta) . $ <kc:separated-gap>]
  Next choose $tau \, D$ from Theorem 10 and (6.4); these depend on $k \, eta$, not the game size. Choose a rational
  $ 0 < delta < min {1 / 2 \, frac(eta tau^2, 4 k D)} . $
  Apply Theorem 11 with these fixed errors. Only at this stage is the fixed alphabet size $r = 2^s$ determined.
    In particular $k^r$ is a constant with respect to the input formula size,
    although no uniform bound polynomial in the error reciprocals is asserted.
  Compose that deterministic reduction with Lemma 12. Lemmas 13 and 14, together with (6.2), give the gap
  $ phi upright(" satisfiable") & med arrow.r.double med "Clust" \( A_phi divides I_k \) gt.eq
    H := \( 1 - 1 \/ k \) \( 1 - epsilon \)^2 \,\
phi upright(" unsatisfiable") & med arrow.r.double med "Clust" \( A_phi divides I_k \) lt.eq S := c_(*) + 2 eta . $
  The output is a rational symmetric centered PSD matrix with polynomial dimension and bit length.
    By (6.14), $S < H \/ alpha$. Choose a fixed rational $theta$ strictly between these numbers.
    A deterministic loss-factor-$alpha$ algorithm produces value greater than $theta$ on satisfiable formulas;
    every assignment has value less than $theta$ on unsatisfiable formulas.
    The returned value is an exactly computable rational number.
    This would decide $upright(3 S A T)$ in polynomial time. Thus achieving the stated factor is NP-hard. ◻
]

#prodef([Remark 6.7.])[
  (Randomized guarantees).  The quoted Khot–Naor rounding guarantee is in expectation.
    The deterministic hardness conclusion of Theorem 9 does not use $upright(P) eq.not
    upright("NP")$ to exclude randomized algorithms. More precisely,
    a polynomial-time randomized algorithm whose expected value is at least $"Clust" \( A divides I_k \) \/
    alpha$ for some fixed $alpha < alpha_k$ would place $upright(3 S A T)$ in $upright("RP")$.
    Indeed, on the reduction instances its returned value $X$ lies in $\[ 0 \, 1 \]$.
    In the satisfiable case $bb(E) X gt.eq H \/ alpha > theta$; therefore
  $ Pr { X > theta } gt.eq frac(H \/ alpha - theta, 1 - theta) > 0 . $
  This is a fixed positive constant. In the unsatisfiable case $X lt.eq S < theta$ always.
    A fixed number of repetitions gives one-sided success probability at least $1 \/ 2$.
] <kc:randomized>

#prodef([Remark 6.8.])[
  (Inputs to the application).  The Gaussian proof supplies only (6.2).
    Khot and Naor supply the expected rounding guarantee [5] Theorem 2.1 and the analytic low-influence bound [5]
    Theorem 3.8. Their reduction in Section 3.3 is the model for Lemmas 12–14;
    the degree weights and the squared completeness loss explicitly accommodate the ordinary edge-value,
    possibly nonregular instances from [9] Theorem 1.1. No stronger Unique Games promise is assumed.
    The separate Unique Games theorem is a formal dependency only of this hardness application.
    The algorithmic endpoint is quoted in its ideal rounding formulation;
    this section supplies no finite-precision endpoint implementation.
] <kc:dependencies>

== 7 Elementary certificates for the numerical inequalities <cert:arithmetic>

This appendix gives rational enclosures for the numerical comparisons used in the proof.
  All finite decimals denote exact rationals. The formulas below and the tables suffice to reproduce the
  comparisons; no numerical optimization or numerical quadrature is needed.

=== 7.1 Enclosure formulas <enclosure-formulas>

We use

#[#set math.equation(numbering: n => "(7.1)")
 $ 3.14159 < pi < 3.14160 . $ <cert:pi>]

For example, these bounds follow from $pi = 16 arctan \( 1 \/ 5 \) -
  4 arctan \( 1 \/ 239 \)$ by bounding each arctangent between its alternating-series partial sums through indices
  7 and 6. All square-root enclosures may be obtained using rational numbers $l \, u gt.eq 0$ with $l^2 lt.eq
  x lt.eq u^2$. An explicit rule, if desired, is to set $D = 10^35$ and use

$ frac(floor.l sqrt(floor.l x D^2 floor.r) floor.r, D) lt.eq sqrt(x) lt.eq
  frac(floor.l sqrt(floor.l x D^2 floor.r) floor.r + 1, D) . $

For an interval of possible $x$, apply the lower rule to its lower endpoint and the upper rule to its upper
  endpoint. Thus only rational operations and integer square roots are required.

For $y gt.eq 0$, let

$ E_N \( y \) = sum_(j = 0)^N frac(\( - y \)^j, j !) . $

Taylor’s integral remainder gives

#[#set math.equation(numbering: n => "(7.2)")
 $ E_15 \( y \) lt.eq e^(- y) lt.eq E_14 \( y \) . $ <cert:exponential>]

This conclusion does not require the initial terms of the series to be decreasing. Integrating the same bounds, set

$ J_N \( x \) = sum_(j = 0)^N frac(\( - 1 \)^j x^(2 j + 1), 2^j j ! \( 2 j + 1 \)) \, wide x gt.eq 0 . $

Then

#[#set math.equation(numbering: n => "(7.3)")
 $ 1 / 2 + frac(J_15 \( x \), sqrt(2 pi)) lt.eq Phi \( x \) lt.eq 1 / 2 + frac(J_14 \( x \), sqrt(2 pi)) \, wide
   Phi \( - x \) = 1 - Phi \( x \) . $ <cert:normal>]

Together with (7.1) and the square-root rule, these are rational enclosures for both $phi.alt$ and $Phi$ at every
  argument used below. Interval addition, subtraction, multiplication,
  and division by intervals avoiding zero preserve the enclosures.

For the cap calculation, put

$ Q \( x \) = sum_(j = 0)^4 frac(binom(2 j, j), 4^j \( 2 j + 1 \)) x^(2 j + 1) . $

The binomial series has positive coefficients at most one.
  Its tail starting in degree 10 is bounded by $x^10 \/ \( 1 - x^2 \)$; after integration this gives, for $0 lt.eq
  x < 1$,

#[#set math.equation(numbering: n => "(7.4)")
 $ Q \( x \) lt.eq arcsin x lt.eq Q \( x \) + frac(x^11, 11 \( 1 - x^2 \)) . $ <cert:arcsine>]

=== 7.2 The two rearrangement minima <the-two-rearrangement-minima>

Write $f \( x \) = \( 9 \/ 4 \) e^(x^2) Phi \( - x \)$ and $D_f \( x \) = 2 x - phi.alt \( x \) \/ Phi \( - x \)$,
  as in (3.2). Substitution into (7.2)–(7.3) gives the following strict enclosures:

$ - 0.000131 & < & D_f \( 0.6119 \) < - 0.000126 \,\
0.000120 & < & D_f \( 0.6121 \) < 0.000124 \,\
- 0.000430 & < & D_f \( x \) < 0.000424 quad \( 0.6119 lt.eq x lt.eq 0.6121 \) \,\
0.884383832 & < & f \( 0.612 \) . $

For the third row, use the whole rational interval $\[ 0.6119 \, 0.6121 \]$ in the elementary interval operations;
  $phi.alt \( x \)$ decreases and $Phi \( - x \)$ decreases there, so endpoint enclosures give both factors.
  Thus $\| D_f \| < 0.001$ throughout that interval. The minimizer lies within $0.0001$ of $0.612$, and so

$ min f gt.eq f \( 0.612 \) e^(- 10^(- 7)) > 0.884383832 \( 1 - 10^(- 7) \) > 0.8843837 . $

For $p \, F \, H \, R$ from (3.4) and its following calculation, (7.4) gives

$ - 0.0047010 & < & F \( 0.29 \) < - 0.0046981 \,\
0.0007683 & < & F \( 0.294 \) < 0.0007712 \,\
0.9312526 & < & R \( 0.29 \) \,\
0.22198 & < & p \( 0.294 \) - 0.294 \/ pi . $

For $0.29 lt.eq x lt.eq 0.294$, the last row implies

$ H \( x \) = p \( x \) - frac(x sqrt(1 - x^2), pi) gt.eq p \( 0.294 \) - 0.294 / pi > 0 . $

Therefore $F$ is increasing throughout the interval, and the first two rows imply $\| F \( x \) \| <
  0.004702$ there. Consequently

$ \| R' \( x \) \| < frac(\( 9 \/ 4 \) 0.004702, \( 1 - 0.294^2 \)^4) < 0.015189 < 0.03 . $

This proves the derivative bound on the entire interval. The minimum therefore exceeds $0.9312526 -
  0.03 \( 0.004 \) = 0.9311326$.

=== 7.3 Quantiles and the interval probability bounds <quantiles-and-the-interval-probability-bounds>

For $P_0 \( a \) = \( 0.415 + 0.15 a \) a$, Table 5 gives a rational $q_a$ satisfying $Phi \( q_a \) <
  P_0 \( a \)$, and a strict upper bound on $G \( q_a \)$. Each entry follows by substituting the displayed
  rational argument into (7.2)–(7.3) and the definition of $G$. Since $G$ is nonincreasing,

$ G #scale(x: 120%, y: 120%)[\(] Phi^(- 1) \( P_0 \( r \) \) #scale(x: 120%, y: 120%)[\)] lt.eq
  G \( q_a \) wide \( r gt.eq a \) . $

In each row the listed upper bound is strictly below the value of $U$ in Table 1.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$a$
], table.cell(rowspan: 1, colspan: 1)[$q_a$
], table.cell(rowspan: 1, colspan: 1)[$10^6 \( P_0 \( a \) - Phi \( q_a \) \) >$
], table.cell(rowspan: 1, colspan: 1)[$G \( q_a \) <$
]),
  table.cell(rowspan: 1, colspan: 1)[0.05
], table.cell(rowspan: 1, colspan: 1)[-2.033
], table.cell(rowspan: 1, colspan: 1)[98
], table.cell(rowspan: 1, colspan: 1)[0.887728
],
  table.cell(rowspan: 1, colspan: 1)[0.14
], table.cell(rowspan: 1, colspan: 1)[-1.548
], table.cell(rowspan: 1, colspan: 1)[228
], table.cell(rowspan: 1, colspan: 1)[0.854397
],
  table.cell(rowspan: 1, colspan: 1)[0.24
], table.cell(rowspan: 1, colspan: 1)[-1.238
], table.cell(rowspan: 1, colspan: 1)[381
], table.cell(rowspan: 1, colspan: 1)[0.826606
],
  table.cell(rowspan: 1, colspan: 1)[0.33
], table.cell(rowspan: 1, colspan: 1)[-1.024
], table.cell(rowspan: 1, colspan: 1)[366
], table.cell(rowspan: 1, colspan: 1)[0.803691
],
  table.cell(rowspan: 1, colspan: 1)[0.41
], table.cell(rowspan: 1, colspan: 1)[-0.860
], table.cell(rowspan: 1, colspan: 1)[470
], table.cell(rowspan: 1, colspan: 1)[0.783737
],
  table.cell(rowspan: 1, colspan: 1)[0.48
], table.cell(rowspan: 1, colspan: 1)[-0.728
], table.cell(rowspan: 1, colspan: 1)[452
], table.cell(rowspan: 1, colspan: 1)[0.766006
],
  table.cell(rowspan: 1, colspan: 1)[0.54
], table.cell(rowspan: 1, colspan: 1)[-0.621
], table.cell(rowspan: 1, colspan: 1)[539
], table.cell(rowspan: 1, colspan: 1)[0.750456
],
  table.cell(rowspan: 1, colspan: 1)[0.59
], table.cell(rowspan: 1, colspan: 1)[-0.535
], table.cell(rowspan: 1, colspan: 1)[739
], table.cell(rowspan: 1, colspan: 1)[0.737150
],
  table.cell(rowspan: 1, colspan: 1)[0.64
], table.cell(rowspan: 1, colspan: 1)[-0.450
], table.cell(rowspan: 1, colspan: 1)[684
], table.cell(rowspan: 1, colspan: 1)[0.723262
],
)
]],
  caption: [Table 5: Rational enclosures certifying the quantile and $G$ bounds. ],
)

Finally, for each row $\( a \, b \, U \)$ of Table 1, replace $pi$ by its upper bound in $B^2 = 9 \/ \( 8 pi \)$,
  enclose $sqrt(1 - a^2)$ from above, and subtract the exact rational $U \( 0.415 + 0.15 b \)^2$.
  This gives the lower bounds in that table’s last column. The same rational and square-root rules apply to the
  finite comparisons in the numerical elimination section.

#heading(level: 1)[References]
#bibitem([1])[C.~Borell, #emph[The Ehrhard inequality], C. R. Acad. Sci. Paris, Sér.
  I #strong[337] (2003), no.~10, 663--666.
  #link("https://doi.org/10.1016/j.crma.2003.09.031")[doi:10.1016/j.crma.2003.09.031].]
#bibitem([2])[A.~Ehrhard, #emph[Symétrisation dans l'espace de Gauss], Math. Scand. #strong[53] (1983), 281--301.
  #link("https://doi.org/10.7146/math.scand.a-12035")[doi:10.7146/math.scand.a-12035].]
#bibitem([3])[S.~Heilman, #emph[Hyperstable sets with voting and algorithmic hardness applications],
  preprint (2022), #link("https://arxiv.org/abs/2209.11216v1")[arXiv:2209.11216v1].]
#bibitem([4])[S.~Heilman, A.~Jagannath, and A.~Naor, #emph[Solution of the Propeller Conjecture in $bb(R)^3$],
  Discrete Comput. Geom. #strong[50] (2013), no.~2, 263--305.
  #link("https://doi.org/10.1007/s00454-013-9530-0")[doi:10.1007/s00454-013-9530-0].]
#bibitem([5])[S.~Khot and A.~Naor, #emph[Approximate kernel clustering], Mathematika #strong[55] (2009), no.~1--2,
  129--165. #link("https://doi.org/10.1112/S002557930000098X")[doi:10.1112/S002557930000098X].]
#bibitem([6])[S.~Khot and A.~Naor, #emph[Sharp kernel clustering algorithms and their associated Grothendieck
  inequalities], Random Structures Algorithms #strong[42] (2013), no.~3, 269--300.
  #link("https://doi.org/10.1002/rsa.20398")[doi:10.1002/rsa.20398].]
#bibitem([7])[R.~Latała, #emph[A note on the Ehrhard inequality], Studia Math.
  #strong[118] (1996), no.~2, 169--174.
  #link("https://doi.org/10.4064/sm-118-2-169-174")[doi:10.4064/sm-118-2-169-174].]
#bibitem([8])[E.~Mossel, R.~O'Donnell, and K.~Oleszkiewicz,
  #emph[Noise stability of functions with low influences: Invariance and optimality], Ann. of Math.
  (2) #strong[171] (2010), no.~1, 295--341.
  #link("https://doi.org/10.4007/annals.2010.171.295")[doi:10.4007/annals.2010.171.295].]
#bibitem([9])[OpenAI, #emph[The Unique Games Theorem], OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-Unique-Games-Theorem-September-23-2026/paper.pdf")[OAI:The-Unique-Games-Theorem-September-23-2026], 2026.
  Theorem~1.1.]
#bibitem([10])[R.~van Handel, #emph[The Borell--Ehrhard game], Probab.
  Theory Related Fields #strong[170] (2018), 555--585.
  #link("https://doi.org/10.1007/s00440-017-0762-4")[doi:10.1007/s00440-017-0762-4].]
