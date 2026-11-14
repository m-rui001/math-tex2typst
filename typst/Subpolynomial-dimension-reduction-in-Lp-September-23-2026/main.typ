#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Subpolynomial dimension reduction in $L_p$]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

The Johnson–Lindenstrauss lemma places every $n$-point subset of a Hilbert space in $O_D \( log n \)$ Euclidean
  dimensions with any prescribed distortion $D > 1$ [11] Lemma 1.
  Johnson and Lindenstrauss also asked what analogues of their lemma hold in other Banach spaces [11] Problem 3.
  For other $L_p$ spaces, the corresponding finite-metric question must be distinguished both from discretizing an
  entire linear subspace and from requiring the embedding itself to be linear.
  We study the coordinate-target version: the points may be repositioned freely,
  but their images must lie in $ell_p^d$ with the same exponent $p$.
  For the broader dimension-reduction landscape and the distinction between coordinate targets and arbitrary
  subspaces, see Naor [15].

All spaces and maps in this paper are real. For $1 < p < oo$, an integer $n gt.eq 2$, and $D gt.eq 1$,
  let $d_p \( n \, D \)$ be the least integer $d$ such that every $n$-point subset ${ x_1 \, dots.h \,
  x_n }$ of any $L_p$ space admits images $y_1 \, dots.h \, y_n in ell_p^d$ and a number $s > 0$ satisfying

#[#set math.equation(numbering: n => "(1.1)")
 $ s parallel x_i - x_j parallel_p lt.eq parallel y_i - y_j parallel_p lt.eq D s parallel x_i -
   x_j parallel_p wide \( i \, j in { 1 \, dots.h \, n } \) . $ <eq:distortion>]

The maps are unrestricted; in particular, they need not extend linearly to the ambient space.
  Lemma 2 below shows that the same quantity results if the input sets are restricted to finite coordinate spaces
  $ell_p^m$.

#thm([Theorem 1.1.])[
  #emph[Fix $1 < p < oo$, $p eq.not 2$, and put
$ gamma \( p \) = cases(delim: "{", 2 - p \, & 1 < p < 2 \,, 1 - 2 \/ p \, & 2 < p < oo .) $

 For every $D > 1$ there is a constant $C_(p \, D) < oo$ such that, for every integer $n gt.eq 2$,
#[#set math.equation(numbering: n => "(1.2)")
 $ frac(log n, log \( 1 + 2 D \)) lt.eq d_p \( n \, D \) lt.eq
   exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C_(p \, D) \( log n \)^(gamma \( p \))
   #scale(x: 120%, y: 120%)[\)] . $ <eq:main-bounds>]

 For exact embeddings,
#[#set math.equation(numbering: n => "(1.3)")
 $ ⌊frac(n - 1, 4)⌋^2 lt.eq d_p \( n \, 1 \) lt.eq binom(n, 2) wide \( n gt.eq 9 \) . $ <eq:exact-bounds>]

 Consequently,
$ lim_(n arrow.r oo) frac(log d_p \( n \, D \), log n) = cases(delim: "{", 0 \, & D > 1 \,, 2 \, & D = 1 .) $

]
] <thm:main>

The constants in the upper bound depend on the fixed parameters $p \, D$;
  no uniformity as $p$ approaches an endpoint or $D$ approaches $1$ is asserted.
  For $p = 2$, the classical Hilbert result gives the stronger bound $d_2 \( n \, D \) =
  O_D \( log n \)$ for every fixed $D > 1$. The theorem is existential and does not assert an efficient embedding
  algorithm.

=== 1.1 Earlier results and the exact-distortion contrast <earlier-results-and-the-exact-distortion-contrast>

Ball proved the exact-coordinate upper bound $binom(n, 2)$ and its quadratic-order sharpness for $1 lt.eq
  p < 2$ [1]. Lemma 2 recalls the distance-cone and Carathéodory argument for that upper bound.
  The lower bound in (1.3) uses an antipodal row-and-column configuration.
  Its disjoint-support test is the classical equality criterion for the $p$-parallelogram defect [12]
  Corollary 2.1; in particular, the argument includes even integers $p > 2$.

Approximate finite-set bounds and linear-subspace discretization have different dimension parameters.
  Below $2$, Schechtman’s finite-set estimates progressed from $O_D \( n log n \)$ coordinates to
  $O_(p \, D) \( n \)$ [22,23]. The subspace results of Bourgain–Lindenstrauss–Milman and Talagrand instead
  preserve all vectors in a given $r$-dimensional subspace by a linear map [3,25].
  Applying such a theorem to the span of the translated data gives $r lt.eq n - 1$;
  it does not give the present subpolynomial bound in cardinality.
  Bourgain’s embedding of arbitrary finite metrics into Hilbert space allows distortion growing with $n$ [2],
  another different guarantee.

The absence of a linearity requirement is essential: fixed-distortion linear maps on selected $L_p$ configurations
  can require dimension proportional to their cardinality when $p eq.not 2$ [13] Section 3.
  At the endpoint $p = 1$, the obstruction of Brinkman–Charikar applies even to nonlinear maps;
  see also Lee–Naor’s proof [4,14]. For $p > 2$, Naor–Ren’s recent lower bound [16] Section 1.1,
  equation (2) rules out $O_(p \, D) \( log n \)$ coordinate dimension:
  along arbitrarily large cardinalities it requires dimension of order at least
  $\( log n \/ \( log log n \)^2 \)^(p \/ 2)$ at fixed distortion.
  This is compatible with (1.2); neither its upper exponent nor its elementary logarithmic lower bound is asserted
  to be optimal.

The dependence on cardinality also distinguishes this problem from embedding one infinite space into a fixed
  finite-dimensional target. A metric space is #emph[doubling] if every ball can be covered by a fixed number of
  balls of half its radius. A separate construction gives an infinite doubling subset of real Hilbert space with
  no bi-Lipschitz embedding into any finite-dimensional Euclidean space at any finite distortion [17].
  This is compatible with finite-set dimension reduction and is not an input to our proof.

=== 1.2 Method and organization <method-and-organization>

Our starting point is a bounded distribution of scalar images of the input points.
  After dividing each increment by the corresponding original distance,
  we seek nearly equal $p$th moments for every pair. Lemma 3 reduces this simultaneous requirement to a
  weighted-average condition for each strictly positive probability on the pairs.
  Crucially, the common moment $b$ and magnitude bound $K$ are uniform over those probabilities.
  Convex separation produces one distribution working for all pairs;
  independent sampling then supplies the coordinates of a finite embedding.
  This sampling step belongs to Maurey’s empirical method, as presented by Pisier [19].
  A close distance-matrix antecedent is Eskenazis’s use of that method for incompressible sets [6] Sections 1.3
  and 2.1; that theorem controls additive errors, with a bound depending on the incompressibility of the data.
  Here the weighted-moment construction supplies the uniform relative control needed for arbitrary configurations.

The geometric input in Section 4 is a projection onto normalized increments that come from scalar labels on the
  points. It is an $L_2$ contraction for a suitable choice of pair weights,
  and its $L_oo$ norm is $O \( log n \)$. We obtain the latter property by a fixed-point reweighting of the
  electrical-flow localization estimate of Gurel-Gurevich, Nachmias, and Sachdeva [7] Theorem 1.3.
  Their estimate improves the earlier $O \( log^2 n \)$ localization bound of Schild–Rao–Srivastava [24]
  Theorem 1.5, preprint version. Appendix 9 presents the heat-kernel and entropy proof from [7] Sections 2–4 in
  our notation.

After the common homogeneous-increment and signed-Poisson setup,
  the two ranges require different random increments. Section 6 constructs symmetric $p$-stable marginals,
  clips them, and projects back to consistent increments. Stable projections and truncated heavy-tail moments have
  earlier geometric uses, including Indyk’s work [10]; the required marginal construction and tail bounds are
  proved here. For $p > 2$, Section 7 uses overlapping magnitude truncations followed by signed Poisson sampling.
  Their overlap enlarges the input energy relative to the projection error.
  The moment comparison is of Rosenthal type [21,18]; Appendix 10 proves the specific leading coefficient $1 +
  epsilon.alt$ needed for distortion arbitrarily close to one.
  The final main-text section inserts the resulting $b \, K$ into the sampling estimate and proves the packing and
  exact embedding lower bounds.

We use finite-dimensional convexity, Brouwer’s fixed-point theorem, and standard probability;
  the specialized electrical-localization and Poisson-moment arguments are supplied in the appendices.

Throughout, logarithms are natural. Constants $C \, c > 0$ are absolute;
  subscripts indicate the parameters on which a constant may depend. Their values may change from line to line.

== 2 Finite coordinates and normalized increments <finite-coordinates-and-normalized-increments>

#thm([Lemma 2.1.])[
  (Exact discretization).  #emph[Every $n$-point subset of a real $L_p$ space embeds isometrically into
    $ell_p^(binom(n, 2))$. This holds for every $1 lt.eq p < oo$.]
] <lem:exact-upper>

#proof[
  Let the points be $x_1 \, dots.h \, x_n in L_p \( mu \)$,
    and let $E$ be the set of unordered pairs of distinct indices. Write $N = \| E \|$.
    Choose measurable representatives, finite outside a common null set, and put
  $ q \( t \) = #scale(x: 120%, y: 120%)[\(] \| x_i \( t \) -
    x_j \( t \) \|^p #scale(x: 120%, y: 120%)[\)]_(i j in E) \, wide s \( t \) = sum_(e in E) q_e \( t \) \, wide
    S = integral s thin d mu . $
  The points are distinct, so $0 < S < oo$. Consider the compact set
  $ cal(K) = {#scale(x: 120%, y: 120%)[\(] \| z_i - z_j \|^p #scale(x: 120%, y: 120%)[\)]_(i j in E) :
    z in bb(R)^n \, med z_n = 0 \, med sum_(i j in E) \| z_i - z_j \|^p = 1} subset bb(R)^E . $
  Compactness follows because its defining set of labels is closed and $\| z_i \| lt.eq 1$ for every $i$.
    For $s \( t \) > 0$, the vector $q \( t \) \/ s \( t \)$ belongs to $cal(K)$. Hence
  $ 1 / S integral q \( t \) thin d mu \( t \) = integral_({ s > 0 }) frac(q \( t \), s \( t \)) thin
    frac(s \( t \), S) thin d mu \( t \) in "conv" \( cal(K) \) . $
  Here a barycenter belongs to the convex hull because that convex hull is compact; equivalently,
    this follows by finite-dimensional separation [20] Theorems 11.3 and 17.2.
    The set $cal(K)$ lies in the affine hyperplane whose coordinates sum to one.
    By Carathéodory’s theorem [20] Theorem 17.1, the displayed vector is a convex combination of at most $N$
    points of $cal(K)$. Choose corresponding labels $z^(\( a \))$ and coefficients $theta_a gt.eq
    0$ with $sum_a theta_a = 1$. Then
  $ y_i = #scale(x: 120%, y: 120%)[\(] \( S theta_a \)^(1 \/ p) z_i^(\( a \)) #scale(x: 120%, y: 120%)[\)]_a $
  satisfies $parallel y_i - y_j parallel_p^p = parallel x_i - x_j parallel_p^p$ for every pair. ◻
]

For the upper bound in (1.2), we may therefore fix distinct points $x_1 \, dots.h \,
  x_n in ell_p^m$ for some finite $m$. Give the complete graph on ${ 1 \, dots.h \, n }$ an arbitrary orientation,
  and use $e = i j$ to denote an edge with this ordering. Set

$ delta_e = parallel x_i - x_j parallel_p > 0 \, wide V = {(frac(z_i - z_j, delta_e))_(e = i j in E) :
  z in bb(R)^n} subset bb(R)^E . $

We call elements of $V$ #emph[normalized gradients]. Each such vector determines scalar labels $z_i$ uniquely
  after imposing $z_n = 0$; this choice is linear in the vector.
  Thus a collection of normalized gradients can always be used as the coordinates of one map on the given points.

For a strictly positive probability vector $sigma = \( sigma_e \)_(e in E)$, write

$ parallel f parallel_(2 \, sigma)^2 = sum_(e in E) sigma_e \| f_e \|^2 . $

We first state the moment criterion that our random gradients must satisfy.

== 3 From weighted moments to an embedding <from-weighted-moments-to-an-embedding>

A random normalized gradient gives candidate scalar coordinates.
  We seek one bounded distribution whose $p$th moments are nearly equal on every edge.
  The next lemma shows that it is enough to meet each weighted test separately,
  even though the distribution may change with the test probability.
  The common moment and magnitude bound must remain fixed.

The common moment $b$ below is allowed to grow: multiplying all distances by the same factor does not change
  distortion. This freedom will let us absorb an additive error in the moment estimates.

#thm([Lemma 3.1.])[
  (Weighted moment criterion).  #emph[Let $0 < eta < 1 \/ 3$ and $b \, K gt.eq 1$.
    Suppose that, for every strictly positive probability vector $lambda$ on $E$,
    there is a random normalized gradient $F in V$ such that
#[#set math.equation(numbering: n => "(3.1)")
 $ parallel F parallel_oo lt.eq K quad upright("almost surely") \, wide
   sum_(e in E) lambda_e lr(|bb(E) \| F_e \|^p - b|) lt.eq eta b . $ <eq:weighted-target>]

 The numbers $b$ and $K$ are the same for all $lambda$. Then the points admit an embedding into $ell_p^d$ with
   distortion at most
$ (frac(1 + 3 eta, 1 - 3 eta))^(1 \/ p) \, $

 where
#[#set math.equation(numbering: n => "(3.2)")
 $ d lt.eq ⌈C max {1 \, frac(K^(2 p), eta^2 b^2)} log \( 2 n \)⌉ $ <eq:sampling-dimension>]

 for an absolute constant $C$.]
] <lem:weighted>

#proof[
  Let $cal(C)$ be the convex hull of the compact set
  $ {#scale(x: 120%, y: 120%)[\(] \| f_e \|^p #scale(x: 120%, y: 120%)[\)]_(e in E) : f in V \, med
    parallel f parallel_oo lt.eq K} . $
  It is compact and consists exactly of the moment vectors of distributions of such gradients;
    finite mixtures suffice by Carathéodory’s theorem. We claim that $cal(C)$ meets the open box
  $ cal(B) = { m in bb(R)^E : \| m_e - b \| < 2 eta b upright(" for all ") e } . $
  Otherwise, finite-dimensional separation [20] Theorem 11.3 gives a vector $a eq.not 0$ such that,
    after normalizing $sum_e \| a_e \| = 1$,
  $ sum_e a_e \( m_e - b \) gt.eq 2 eta b wide \( m in cal(C) \) . $
  Apply the hypothesis with $lambda_e = 3 / 4 \| a_e \| + frac(1, 4 \| E \|)$. Its moment vector $m in cal(C)$ satisfies
  $ sum_e a_e \( m_e - b \) lt.eq sum_e \| a_e \| \| m_e - b \| lt.eq 4 / 3 sum_e lambda_e \| m_e - b \| lt.eq 4 /
    3 eta b \, $
  a contradiction. Thus there is one distribution of gradients, still bounded by $K$,
    for which every expected $p$th moment differs from $b$ by less than $2 eta b$.
  For completeness, we prove a Hoeffding-type bounded-sum estimate for the sampling step,
    with constants weaker than the classical bound in [9] Theorem 2, p. 16, equation (2.6).
    If $0 lt.eq X lt.eq K^p$ and $X'$ is an independent copy, Jensen’s inequality and symmetry give
  $ bb(E) e^(t \( X - bb(E) X \)) lt.eq bb(E) e^(t \( X - X' \)) =
    bb(E) cosh #scale(x: 120%, y: 120%)[\(] t \( X - X' \) #scale(x: 120%, y: 120%)[\)] lt.eq e^(t^2 K^(2 p) \/ 2) \, $
  using $cosh u lt.eq e^(u^2 \/ 2)$. Take $d$ independent samples $F^(\( 1 \)) \, dots.h \,
    F^(\( d \))$ from the preceding distribution. Apply this bound to $X = \| F_e \|^p$,
    multiply moment generating functions, and use Markov’s inequality with $t = eta b \/ K^(2 p)$.
    Applying the same argument to the lower tail gives
  $ bb(P) (lr(|1 / d sum_(a = 1)^d \| F_e^(\( a \)) \|^p - bb(E) \| F_e \|^p|) > eta b) lt.eq
    2 exp (- frac(d eta^2 b^2, 2 K^(2 p))) . $
  For the value in (3.2) with $C$ sufficiently large, a union bound over $\| E \| < n^2 \/
    2$ edges is less than one. Choose an outcome for which all empirical moments belong to
    $\[ \( 1 - 3 eta \) b \, \( 1 + 3 eta \) b \]$. Realize each $F^(\( a \))$ by scalar labels $z_i^(\( a \))$, and set
  $ y_i = d^(- 1 \/ p) #scale(x: 120%, y: 120%)[\(] z_i^(\( 1 \)) \, dots.h \,
    z_i^(\( d \)) #scale(x: 120%, y: 120%)[\)] . $
  Then
  $ frac(parallel y_i - y_j parallel_p^p, delta_(i j)^p) = 1 / d sum_(a = 1)^d \| F_(i j)^(\( a \)) \|^p . $
  This proves the assertion, with scale $s = \( \( 1 - 3 eta \) b \)^(1 \/ p)$. ◻
]

== 4 A projection with controlled row sums <sec:projection>

The projection estimate follows from the electrical-flow localization theorem of Gurel-Gurevich, Nachmias,
  and Sachdeva [7] Theorem 1.3. For a matrix $T$, write $\| T \|$ for its entrywise absolute value.

#thm([Lemma 4.1.])[
  (Electrical-flow localization).  #emph[Let $G$ be a connected loopless graph on $n gt.eq 2$ vertices,
    let $B$ be an oriented edge-by-vertex incidence matrix, and let $C = "diag" \( c_e \)$ with $c_e > 0$.
    If $Q$ is the Euclidean orthogonal projection onto $"im" \( C^(1 \/ 2) B \)$, then
#[#set math.equation(numbering: n => "(4.1)")
 $ parallel thin \| Q \| thin #scale(x: 120%, y: 120%)[parallel]_(2 arrow.r 2) lt.eq 2 log n . $ <eq:localization>]

]
] <lem:localization>

The proof is given in Appendix 9.

We now apply this estimate to the normalized-gradient space $V$. Set

#[#set math.equation(numbering: n => "(4.2)")
 $ H = 4 log \( 2 n \) . $ <eq:H>]

#thm([Lemma 4.2.])[
  (Weighted projection).  #emph[For every strictly positive probability vector $lambda$ on $E$,
    there is a probability vector $sigma$ with $sigma_e gt.eq
    lambda_e \/ 2$ such that the orthogonal projection $P$ onto $V$ in $ell_2 \( sigma \)$ satisfies
#[#set math.equation(numbering: n => "(4.3)")
 $ max_(e in E) sum_(f in E) \| P_(e f) \| lt.eq H . $ <eq:projection-row-sums>]

 In particular, $parallel P parallel_(oo arrow.r oo) lt.eq H$, and both $P$ and $I -
   P$ are contractions on $ell_2 \( sigma \)$.]
] <lem:projection>

#proof[
  Let $B$ be the incidence matrix of the oriented complete graph fixed above.
    For a strictly positive probability vector $sigma$, denote the weighted orthogonal projection by
    $P \( sigma \)$, and put
  $ D_sigma = "diag" \( sqrt(sigma_e) \) \, wide C_sigma = "diag" \( sigma_e \/ delta_e^2 \) . $
  Then $Q \( sigma \) = D_sigma P \( sigma \) D_sigma^(- 1)$ is the Euclidean orthogonal projection onto
    $"im" \( C_sigma^(1 \/ 2) B \)$. Define $R_e \( sigma \) = sum_f \| P \( sigma \)_(e f) \|$.
    Since $parallel sqrt(sigma) parallel_2 = 1$, Lemma 4 gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ sum_e sigma_e R_e \( sigma \)^2 = parallel thin \| Q \( sigma \) \| sqrt(sigma) thin
     #scale(x: 120%, y: 120%)[parallel]_2^2 lt.eq \( 2 log n \)^2 . $ <eq:average-row-sums>]
  To control every row, we choose weights that allocate more mass to rows with large absolute sums.
    Consider the compact convex set
  $ Sigma = {sigma : med sum_e sigma_e = 1 \, med sigma_e gt.eq lambda_e \/ 2} . $
  The weighted projection, and hence every $R_e$, depends continuously on $sigma in Sigma$:
    in a fixed basis of $V$, its formula involves the inverse of a positive definite Gram matrix. Set
  $ u_e \( sigma \) = frac(sigma_e R_e \( sigma \)^2, 2 \( 2 log n \)^2) \, wide Phi_e \( sigma \) =
    u_e \( sigma \) + (1 - sum_f u_f \( sigma \)) lambda_e . $
  By (4.4), $sum_e u_e \( sigma \) lt.eq 1 \/ 2$. Thus $Phi$ is a continuous self-map of $Sigma$,
    and Brouwer’s theorem [8] Corollary 2.15 provides a fixed point.
    At that fixed point $u_e \( sigma \) lt.eq sigma_e$; since $sigma_e > 0$, this gives
  $ R_e \( sigma \) lt.eq 2 sqrt(2) log n lt.eq H . $
  The remaining assertions follow from the row-sum formula for the $ell_oo$ operator norm and orthogonality in
    $ell_2 \( sigma \)$. ◻
]

For the rest of the upper-bound argument, fix $D > 1$ and choose $0 < eta < 1 \/ 6$ so that

#[#set math.equation(numbering: n => "(4.5)")
 $ (frac(1 + 3 eta, 1 - 3 eta))^(1 \/ p) lt.eq D . $ <eq:eta-choice>]

For each strictly positive test probability $lambda$, we will use $sigma$ and $P$ from Lemma 5.
  It suffices to construct $F$ with weighted error at most $eta b \/ 2$ under $sigma$, since $lambda lt.eq
  2 sigma$ coordinatewise. The parameters $b$ and $K$ will depend only on $p \, eta \, n$.

== 5 Homogeneous increments and signed Poisson sampling <homogeneous-increments-and-signed-poisson-sampling>

The following measure gives every normalized increment the same magnitude distribution.
  On $Omega = \( 0 \, oo \) times { 1 \, dots.h \, m }$, set

$ d nu \( r \, t \) = p r^(- p - 1) thin d r quad upright("on each copy indexed by ") t \, wide g_e \( t \) =
  frac(x_i \( t \) - x_j \( t \), delta_e) \, wide v_e \( r \, t \) = r g_e \( t \) . $

For every $\( r \, t \)$, the vector $v \( r \, t \)$ belongs to $V$.
  Since $sum_(t = 1)^m \| g_e \( t \) \|^p = 1$, direct integration gives

#[#set math.equation(numbering: n => "(5.1)")
 $ nu \( \| v_e \| > a \) = a^(- p) wide \( a > 0 \) . $ <eq:powerlaw>]

More generally, for every nonnegative measurable function $phi.alt : \( 0 \, oo \) arrow.r \[ 0 \, oo \]$,

#[#set math.equation(numbering: n => "(5.2)")
 $ integral_({ v_e eq.not 0 }) phi.alt \( \| v_e \| \) thin d nu =
   p integral_0^oo phi.alt \( u \) u^(- p - 1) thin d u . $ <eq:magnitude-density>]

In particular, $nu \( max_e \| v_e \| > a \) lt.eq \| E \| a^(- p)$.
  The measure $nu$ is not a probability measure. The second moment of the small jumps is finite precisely when
  $p < 2$; for $p > 2$, the useful finite second moment is instead in the large jumps.
  This leads to two different uses of the same homogeneous increments.

We record the elementary sampling facts used in both ranges.
  On a measurable region of finite mass $M$, #emph[signed Poisson sampling] of a vector function $h$ means

$ W = sum_(j = 1)^N epsilon_j h \( omega_j \) \, $

where $N$ has Poisson law of mean $M$, the $omega_j$ are independent with law $nu \/ M$ restricted to the region,
  and the $epsilon_j$ are independent uniform signs. All these choices are independent.
  For $M = 0$ the sum is zero. Sampling on disjoint regions is independent:
  indeed, subdividing a Poisson number of independent samples gives independent Poisson counts,
  as is seen from their joint probability generating function.
  In particular, sampling a $V$-valued function produces a vector in $V$.

#thm([Lemma 5.1.])[
  (Signed Poisson formulas).  #emph[Let $h$ be a bounded real function supported on a region of finite
    $nu$-measure, and let $S$ be its signed Poisson sum. Then
#[#set math.equation(numbering: n => "(5.3)")
 $ bb(E) e^(i t S) & = exp (integral \( cos \( t h \) - 1 \) thin d nu) \,\
bb(E) e^(t S) & = exp (integral \( cosh \( t h \) - 1 \) thin d nu) \,\
bb(E) S & = 0 \, wide bb(E) S^2 = integral h^2 thin d nu . $ <eq:poisson-cf>]

 The characteristic-function identity also holds for unbounded $h$ on a finite-measure region.]
] <lem:poisson>

#proof[
  Conditioning on the Poisson count proves the first two formulas:
    the expectation for one signed sample is respectively the average of $cos \( t h \)$ or $cosh \( t h \)$,
    and the Poisson generating function is $bb(E) z^N = exp \( M \( z - 1 \) \)$.
    The variance formula follows by conditioning as well. ◻
]

== 6 The range $1 < p < 2$ <sec:below>

Fix $1 < p < 2$. We construct the random normalized gradient required by Lemma 3, with $eta$ as chosen in (4.5).

=== 6.1 A common heavy-tailed marginal <a-common-heavy-tailed-marginal>

We first construct a random vector $Y in V$ by symmetric Poisson sampling of the vector $v$ against the intensity
  $nu$. On the region ${ parallel v parallel_oo > 1 }$, this is an ordinary signed compound Poisson sum:
  the region has measure at most $\| E \|$ by (5.1). For each $j gt.eq 0$, independently sample the region

$ A_j = { 2^(- j - 1) < parallel v parallel_oo lt.eq 2^(- j) } \, $

and denote its signed compound Poisson sum by $Y^(\( j \))$.
  Each $A_j$ has finite measure, at most $\| E \| 2^(p \( j + 1 \))$. These are centered independent vectors.
  For every edge $e$,

$ sum_(j gt.eq 0) bb(E) \| Y_e^(\( j \)) \|^2 = integral_(0 < parallel v parallel_oo lt.eq 1) \| v_e \|^2 thin d
  nu lt.eq integral_(0 < \| v_e \| lt.eq 1) \| v_e \|^2 thin d nu = frac(p, 2 - p) . $

Consequently $sum_(j gt.eq 0) Y^(\( j \))$ converges in $L_2$ with values in the finite dimensional space
  $bb(R)^E$. Adding the sum on ${ parallel v parallel_oo > 1 }$ defines $Y$.
  Every partial sum belongs to $V$; since $V$ is closed, $Y in V$ almost surely.

The compound Poisson formula and convergence in probability give

#[#set math.equation(numbering: n => "(6.1)")
 $ bb(E) e^(i theta Y_e) =
   exp (integral #scale(x: 120%, y: 120%)[\(] cos \( theta v_e \) - 1 #scale(x: 120%, y: 120%)[\)] thin d nu) =
   exp
   (p integral_0^oo #scale(x: 120%, y: 120%)[\(] cos \( theta u \) - 1 #scale(x: 120%, y: 120%)[\)] u^(- p - 1)
   thin d u) . $ <eq:below-characteristic>]

The integrals converge absolutely: near zero the integrand is $O_theta \( u^(1 - p) \)$,
  and at infinity it is $O \( u^(- p - 1) \)$. The second equality follows from (5.2) and the evenness of cosine.
  In particular, uniqueness of characteristic functions [5] Theorem 3.3.11 shows that all the $Y_e$ have the same
  distribution, depending only on $p$.

For later use we prove directly that

#[#set math.equation(numbering: n => "(6.2)")
 $ c_p a^(- p) lt.eq bb(P) \( \| Y_e \| > a \) lt.eq C_p a^(- p) wide \( a gt.eq 1 \) . $ <eq:below-tail>]

Fix $e$ and $a gt.eq 1$. By Poisson splitting, or by the characteristic function (6.1),
  $Y_e$ has the distribution of an independent sum $B_a + S_a$.
  Here $B_a$ is the signed compound Poisson sum on ${ \| v_e \| > a }$,
  whose number $N_a$ of jumps is Poisson with mean $a^(- p)$,
  while $S_a$ is the $L_2$ limit of the small-jump sums on ${ 0 < \| v_e \| lt.eq a }$. Thus

$ bb(E) S_a = 0 \, wide bb(E) \| S_a \|^2 = integral_(0 < \| v_e \| lt.eq a) \| v_e \|^2 thin d nu =
  frac(p, 2 - p) a^(2 - p) . $

Chebyshev’s inequality gives

$ bb(P) \( \| Y_e \| > a \) lt.eq bb(P) \( N_a gt.eq 1 \) + bb(P) \( \| S_a \| > a \) lt.eq
  (1 + frac(p, 2 - p)) a^(- p) . $

For the reverse inequality, condition on $N_a = 1$, the magnitude $u > a$ of its jump, and $S_a = s$.
  At least one of $\| s + u \|$ and $\| s - u \|$ exceeds $a$, and the jump’s two signs are equally likely. Therefore

$ bb(P) \( \| Y_e \| > a \) gt.eq 1 / 2 bb(P) \( N_a = 1 \) = 1 / 2 a^(- p) e^(- a^(- p)) gt.eq frac(1, 2 e) a^(- p) . $

This proves (6.2).

=== 6.2 Clipping and projection <clipping-and-projection>

Let $lambda$ be a strictly positive probability on $E$, and choose $sigma$ and $P$ from Lemma 5.
  Thus $sigma gt.eq lambda \/ 2$, and $P$ has absolute row sums at most $H$.
  For $T > 1$, let $\[ Y \]_T$ denote coordinatewise clipping to $\[ - T \, T \]$, and set

$ F = P \[ Y \]_T . $

Then $F in V$ and $parallel F parallel_oo lt.eq H T$ almost surely.
  Since $Y = P Y$ and $p > 1$, integration of (6.2) yields

#[#set math.equation(numbering: n => "(6.3)")
 $ bb(E) \| Y_e - F_e \| & lt.eq sum_(f in E) \| P_(e f) \| thin bb(E) #scale(x: 120%, y: 120%)[\(] \| Y_f \| -
   T #scale(x: 120%, y: 120%)[\)]_(+)\
 & lt.eq C_p H T^(1 - p) . $ <eq:below-first-error>]

Orthogonal contraction, together with the same tail bound, gives

#[#set math.equation(numbering: n => "(6.4)")
 $ sum_e sigma_e bb(E) \| F_e \|^2 & lt.eq sum_e sigma_e bb(E) min { \| Y_e \| \, T }^2\
 & lt.eq C_p T^(2 - p) . $ <eq:below-second-moment>]

We compare moments below a second level $a$. The Lipschitz comparison will cost $H \( a \/ T \)^(p - 1)$,
  while the quadratic estimate for the remaining tail will cost $\( T \/ a \)^(2 - p)$.
  Balancing these gives $a = T \/ H$. Suppose $a gt.eq 2$, and define the common capped moment

$ b = bb(E) min { \| Y_e \| \, a }^p . $

The common marginal law makes $b$ independent of $e$ and $lambda$. Moreover, the layer-cake formula and (6.2) imply

#[#set math.equation(numbering: n => "(6.5)")
 $ b = p integral_0^a t^(p - 1) bb(P) \( \| Y_e \| > t \) thin d t gt.eq c_p log a . $ <eq:below-b>]

The function $h_a \( t \) = min { \| t \| \, a }^p$ is $p a^(p - 1)$-Lipschitz. Hence (6.3) implies, for every $e$,

$ \| bb(E) h_a \( F_e \) - b #scale(x: 120%, y: 120%)[\|] lt.eq C_p a^(p - 1) H T^(1 - p) = C_p H^(2 - p) . $

The part above this cap is controlled in weighted average. Since $p < 2$, for every real $t$ we have

$ 0 lt.eq \| t \|^p - h_a \( t \) lt.eq a^(p - 2) \| t \|^2 . $

Using (6.4), we obtain

$ sum_e sigma_e bb(E) #scale(x: 120%, y: 120%)[\(] \| F_e \|^p - h_a \( F_e \) #scale(x: 120%, y: 120%)[\)] lt.eq
  C_p a^(p - 2) T^(2 - p) = C_p H^(2 - p) . $

Combining the two estimates proves

#[#set math.equation(numbering: n => "(6.6)")
 $ sum_e sigma_e \| bb(E) \| F_e \|^p - b #scale(x: 120%, y: 120%)[\|] lt.eq
   C_p H^(2 - p) . $ <eq:below-weighted-error>]

Choose

$ T = exp #scale(x: 120%, y: 120%)[\(] A_(p \, eta) H^(2 - p) #scale(x: 120%, y: 120%)[\)] \, wide K = H T \, $

where $A_(p \, eta)$ is sufficiently large. Since $log H = o \( H^(2 - p) \)$,
  for all sufficiently large $n$ we have $a gt.eq 2$ and

$ b gt.eq c_p log \( T \/ H \) gt.eq frac(c_p A_(p \, eta), 2) H^(2 - p) gt.eq 1 . $

By (6.6) and $lambda lt.eq 2 sigma$, increasing $A_(p \, eta)$ if necessary ensures

$ sum_e lambda_e \| bb(E) \| F_e \|^p - b #scale(x: 120%, y: 120%)[\|] lt.eq eta b . $

Both $b$ and $K$ are independent of the test probability $lambda$. Finally,

$ log K = log H + A_(p \, eta) H^(2 - p) = O_(p \, eta) #scale(x: 120%, y: 120%)[\(] \( log n \)^(2 - p)
  #scale(x: 120%, y: 120%)[\)] . $

These are the parameters required by Lemma 3 in this range.

== 7 The range $2 < p < oo$ <sec:above>

Fix $p > 2$, with $eta$ as in (4.5). For a strictly positive test probability $lambda$, obtain $sigma gt.eq
  lambda \/ 2$ and $P$ from Lemma 5. Write

$ gamma = 1 - 2 / p \, wide rho = sigma ⊗ nu . $

All function norms below are taken with respect to $rho$, unless another measure is indicated.
  The projection acts only in the edge variable.

=== 7.1 A ramp of truncations <a-ramp-of-truncations>

The overlapping truncations below create a triangular multiplicity profile of height $ell$.
  We will show that its $p$-energy is of order $ell^(p + 1)$,
  whereas the $p$th power of the projection error is at most $C_p H^(p - 2) ell$.
  This gain determines the choice of $ell$.

For $a > 0$, let $v_(lt.eq a)$ denote the vector obtained by replacing $v_e$ by $v_e
  upright(bold(1))_({ \| v_e \| lt.eq a })$ at each edge; put $v_(> a) = v - v_(lt.eq a)$.
  For an integer $ell gt.eq 1$, to be chosen below, set

#[#set math.equation(numbering: n => "(7.1)")
 $ u = sum_(k = 0)^(ell - 1) #scale(x: 120%, y: 120%)[\(] v_(lt.eq 2^(k + ell)) -
   v_(lt.eq 2^k) #scale(x: 120%, y: 120%)[\)] \, wide Z = P u . $ <eq:above-ramp>]

Thus $u_e$ is $v_e$ multiplied by the number of intervals $\( 2^k \, 2^(k + ell) \]$, $0 lt.eq k < ell$,
  containing $\| v_e \|$. The successive nonzero multiplicities on the dyadic magnitude intervals are

$ 1 \, 2 \, dots.h \, ell - 1 \, ell \, ell - 1 \, dots.h \, 2 \, 1 . $

The magnitude-density identity (5.2) therefore gives the same $p$-energy at every edge:

#[#set math.equation(numbering: n => "(7.2)")
 $ b := integral \| u_e \|^p thin d nu = p log 2 (ell^p + 2 sum_(j = 1)^(ell - 1) j^p) \, wide
   c_p ell^(p + 1) lt.eq b lt.eq C_p ell^(p + 1) . $ <eq:above-energy>]

In particular, $b gt.eq p log 2 > 1$, and $b$ is independent of both the input points and $lambda$.
  Figure 1 illustrates this energy calculation for four overlapping intervals.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.696, 4.968), [#text(size: 9pt)[Overlapping magnitude intervals: $ell =4$]], anchor: "west", padding: 0.07056cm)
  content((-0.696, 4.462), [#text(size: 9pt)[$I_k=(2^k,2^(k+4)]$]], anchor: "west", padding: 0.07056cm)
  line((0, 0), (0, 4.186), stroke: (paint: rgb("#d1d1d1"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((1.16, 0), (1.16, 4.186), stroke: (paint: rgb("#d1d1d1"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((2.32, 0), (2.32, 4.186), stroke: (paint: rgb("#d1d1d1"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((3.48, 0), (3.48, 4.186), stroke: (paint: rgb("#d1d1d1"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((4.64, 0), (4.64, 4.186), stroke: (paint: rgb("#d1d1d1"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((5.8, 0), (5.8, 4.186), stroke: (paint: rgb("#d1d1d1"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((6.96, 0), (6.96, 4.186), stroke: (paint: rgb("#d1d1d1"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((8.12, 0), (8.12, 4.186), stroke: (paint: rgb("#d1d1d1"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  content((-0.29, 4.002), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[$I_0$]]], anchor: "east", padding: 0.07056cm)
  line((0, 4.002), (4.64, 4.002), stroke: (paint: rgb("#00008c"), thickness: 1.4pt, miter-limit: 10))
  circle((0, 4.002), radius: (0.0522, 0.0414), fill: rgb("#ffffff"), stroke: (paint: rgb("#00008c"), thickness: 1.4pt, miter-limit: 10))
  circle((4.64, 4.002), radius: (0.0522, 0.0414), fill: rgb("#00008c"), stroke: none)
  content((-0.29, 3.542), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[$I_1$]]], anchor: "east", padding: 0.07056cm)
  line((1.16, 3.542), (5.8, 3.542), stroke: (paint: rgb("#00008c"), thickness: 1.4pt, miter-limit: 10))
  circle((1.16, 3.542), radius: (0.0522, 0.0414), fill: rgb("#ffffff"), stroke: (paint: rgb("#00008c"), thickness: 1.4pt, miter-limit: 10))
  circle((5.8, 3.542), radius: (0.0522, 0.0414), fill: rgb("#00008c"), stroke: none)
  content((-0.29, 3.082), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[$I_2$]]], anchor: "east", padding: 0.07056cm)
  line((2.32, 3.082), (6.96, 3.082), stroke: (paint: rgb("#00008c"), thickness: 1.4pt, miter-limit: 10))
  circle((2.32, 3.082), radius: (0.0522, 0.0414), fill: rgb("#ffffff"), stroke: (paint: rgb("#00008c"), thickness: 1.4pt, miter-limit: 10))
  circle((6.96, 3.082), radius: (0.0522, 0.0414), fill: rgb("#00008c"), stroke: none)
  content((-0.29, 2.622), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[$I_3$]]], anchor: "east", padding: 0.07056cm)
  line((3.48, 2.622), (8.12, 2.622), stroke: (paint: rgb("#00008c"), thickness: 1.4pt, miter-limit: 10))
  circle((3.48, 2.622), radius: (0.0522, 0.0414), fill: rgb("#ffffff"), stroke: (paint: rgb("#00008c"), thickness: 1.4pt, miter-limit: 10))
  circle((8.12, 2.622), radius: (0.0522, 0.0414), fill: rgb("#00008c"), stroke: none)
  line((0, 1.748), (8.468, 1.748), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: ">"))
  line((0, 1.693), (0, 1.803), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 1.803), [#text(size: 9pt)[$0$]], anchor: "south", padding: 0.07056cm)
  line((1.16, 1.693), (1.16, 1.803), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.16, 1.803), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.07056cm)
  line((2.32, 1.693), (2.32, 1.803), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.32, 1.803), [#text(size: 9pt)[$2$]], anchor: "south", padding: 0.07056cm)
  line((3.48, 1.693), (3.48, 1.803), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.48, 1.803), [#text(size: 9pt)[$3$]], anchor: "south", padding: 0.07056cm)
  line((4.64, 1.693), (4.64, 1.803), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.64, 1.803), [#text(size: 9pt)[$4$]], anchor: "south", padding: 0.07056cm)
  line((5.8, 1.693), (5.8, 1.803), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.8, 1.803), [#text(size: 9pt)[$5$]], anchor: "south", padding: 0.07056cm)
  line((6.96, 1.693), (6.96, 1.803), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.96, 1.803), [#text(size: 9pt)[$6$]], anchor: "south", padding: 0.07056cm)
  line((8.12, 1.693), (8.12, 1.803), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.12, 1.803), [#text(size: 9pt)[$7$]], anchor: "south", padding: 0.07056cm)
  content((5.51, 2.254), [#text(size: 9pt)[$log_2|v_e|$]], anchor: "west", padding: 0.07056cm)
  rect((0, 0), (1.16, 0.3128), fill: black, stroke: (thickness: 0.5pt, miter-limit: 10))
  content((0.58, 0.1564), [#text(size: 9pt)[$1$]])
  rect((1.16, 0), (2.32, 0.6256), fill: black, stroke: (thickness: 0.5pt, miter-limit: 10))
  content((1.74, 0.4692), [#text(size: 9pt)[$2$]])
  rect((2.32, 0), (3.48, 0.9384), fill: black, stroke: (thickness: 0.5pt, miter-limit: 10))
  content((2.9, 0.782), [#text(size: 9pt)[$3$]])
  rect((3.48, 0), (4.64, 1.251), fill: black, stroke: (thickness: 0.5pt, miter-limit: 10))
  content((4.06, 1.095), [#text(size: 9pt)[$4$]])
  rect((4.64, 0), (5.8, 0.9384), fill: black, stroke: (thickness: 0.5pt, miter-limit: 10))
  content((5.22, 0.782), [#text(size: 9pt)[$3$]])
  rect((5.8, 0), (6.96, 0.6256), fill: black, stroke: (thickness: 0.5pt, miter-limit: 10))
  content((6.38, 0.4692), [#text(size: 9pt)[$2$]])
  rect((6.96, 0), (8.12, 0.3128), fill: black, stroke: (thickness: 0.5pt, miter-limit: 10))
  content((7.54, 0.1564), [#text(size: 9pt)[$1$]])
  content((-0.2552, 0.6716), [#text(size: 9pt)[multiplicity#linebreak()$m_4(|v_e|)$]], anchor: "east", padding: 0.07056cm)
  content((4.06, -0.184), [#text(size: 9pt)[$u_e=m_4(|v_e|) thin v_e ("before" "projection")$]], anchor: "north", padding: 0.07056cm)
})],
  caption: [Figure 1: The overlapping truncations for $ell = 4$. The intervals $I_k = \( 2^k \, 2^(k + 4) \]$, $0 lt.eq k < 4$, give multiplicities $1 \, 2 \, 3 \, 4 \, 3 \, 2 \, 1$ on $\( 2^j \, 2^(j + 1) \]$, $j = 0 \, dots.h \, 6$, and zero outside $\( 1 \, 128 \]$. Thus $u_e = m_4 \( \| v_e \| \) v_e$ before projection. By the magnitude-density identity, a bin of multiplicity $m$ contributes $p log 2 thin m^p$ to $integral \| u_e \|^p thin d nu$. ],
) <fig:truncation-ramp>

The same identity gives

$ integral \| v_e \|^2 upright(bold(1))_({ \| v_e \| > a }) thin d nu = frac(p, p - 2) a^(2 - p) . $

The triangle inequality in $L_2 \( nu \)$, applied to (7.1), consequently yields

$ (integral \| u_e \|^2 thin d nu)^(1 \/ 2) lt.eq (frac(p, p - 2))^(1 \/ 2) sum_(k = 0)^(ell - 1)
  2^(\( 1 - p \/ 2 \) k) lt.eq C_p . $

Using the contraction of $P$ in $ell_2 \( sigma \)$ and its row-sum bound, we obtain

#[#set math.equation(numbering: n => "(7.3)")
 $ parallel Z parallel_(L_2 \( rho \))^2 lt.eq C_p \, wide sup_e integral \| Z_e \|^2 thin d nu lt.eq C_p H^2 \,
   wide sup_(e \, r \, t) \| Z_e \( r \, t \) \| lt.eq H 2^(2 ell) . $ <eq:above-basic-bounds>]

In particular, the coordinatewise quadratic estimate follows from

$ (integral \| Z_e \|^2 thin d nu)^(1 \/ 2) lt.eq sum_f \| P_(e f) \| (integral \| u_f \|^2 thin d nu)^(1 \/ 2)
  lt.eq C_p H . $

For the supremum bound in (7.3), each summand defining $u_e$ has magnitude at most $2^(k + ell)$,
  and their sum is less than $2^(2 ell)$.

=== 7.2 The projection error <the-projection-error>

We claim that

#[#set math.equation(numbering: n => "(7.4)")
 $ parallel Z - u parallel_(L_p \( rho \))^p lt.eq C_p H^(p - 2) \( ell + 1 \) . $ <eq:above-projection-error>]

For $0 lt.eq k < 2 ell$, define the pointwise vector function

$ A_k = \( P - I \) v_(lt.eq 2^k) . $

Although $v_(lt.eq 2^k)$ need not belong to $L_2 \( rho \)$, the identity $P v =
  v$ holds pointwise and gives $A_k = - \( P - I \) v_(> 2^k)$. Thus $A_k$ does belong to $L_2 \( rho \)$, and

#[#set math.equation(numbering: n => "(7.5)")
 $ parallel A_k parallel_oo lt.eq 2 H 2^k \, wide parallel A_k parallel_(L_2 \( rho \)) lt.eq
   C_p 2^(\( 1 - p \/ 2 \) k) . $ <eq:above-cutoff-bounds>]

Here the second inequality uses the $ell_2 \( sigma \)$ contraction of $I - P$ and the preceding tail integral.
  Moreover,

$ Z - u = sum_(k = ell)^(2 ell - 1) A_k - sum_(k = 0)^(ell - 1) A_k . $

Summing the two bounds in (7.5) separately shows that this signed sum has $L_2 \( rho \)$ norm at most $C_p$ and
  supremum norm at most $C H 2^(2 ell)$.

For a level $tau gt.eq 16 H$, split the sum at $2^k lt.eq tau \/ \( 16 H \)$.
  The sum of the supremum norms of these smaller terms is at most $tau \/ 2$.
  By geometric decay, the remaining terms have total $L_2 \( rho \)$ norm at most
  $C_p \( tau \/ H \)^(1 - p \/ 2)$. Chebyshev’s inequality,
  together with the global $L_2$ bound for smaller levels, gives

$ rho #scale(x: 120%, y: 120%)[\(] \| Z - u \| > tau #scale(x: 120%, y: 120%)[\)] lt.eq
  cases(delim: "{", C_p tau^(- 2) \, & 0 < tau < 16 H \,, C_p H^(p - 2) tau^(- p) \, & tau gt.eq 16 H .) $

This tail vanishes for $tau > C H 2^(2 ell)$. Integrating it against $p tau^(p - 1) thin d tau$ proves (7.4):
  the smaller levels contribute $C_p H^(p - 2)$, and the larger levels contribute at most $C_p H^(p - 2) \( ell + 1 \)$.

Since $parallel u parallel_(L_p \( rho \))^p = b$, the pointwise power-difference inequality and Hölder’s
  inequality imply

#[#set math.equation(numbering: n => "(7.6)")
 $ sum_e sigma_e lr(|integral \| Z_e \|^p thin d nu - b|) & lt.eq p parallel Z -
   u parallel_(L_p \( rho \)) #scale(x: 120%, y: 120%)[\(] parallel u parallel_(L_p \( rho \)) + parallel Z -
   u parallel_(L_p \( rho \)) #scale(x: 120%, y: 120%)[\)]^(p - 1) . $ <eq:above-energy-error>]

By (7.2) and (7.4),

#[#set math.equation(numbering: n => "(7.7)")
 $ frac(parallel Z - u parallel_(L_p \( rho \)), b^(1 \/ p)) lt.eq C_p H^gamma / ell . $ <eq:above-relative-error>]

Choose

#[#set math.equation(numbering: n => "(7.8)")
 $ ell = ⌈L H^gamma⌉ \, $ <eq:above-length>]

where $L gt.eq 1$ depends only on $p \, eta$ and will be enlarged once more below.
  First choose it large enough that (7.6) is at most $eta b \/ 8$.

=== 7.3 Poisson sampling <poisson-sampling>

We need the leading coefficient in the next estimate to be arbitrarily close to one,
  since the desired distortion $D$ may be arbitrarily close to one.

#thm([Lemma 7.1.])[
  (Nearly additive Poisson moments).  #emph[Let $h$ be a bounded real function supported on a region of finite
    $nu$-measure, and let $S$ be its signed Poisson sum. For $q > 2$ and $epsilon.alt > 0$,
#[#set math.equation(numbering: n => "(7.9)")
 $ integral \| h \|^q thin d nu lt.eq bb(E) \| S \|^q lt.eq \( 1 + epsilon.alt \) integral \| h \|^q thin d nu +
   C_(q \, epsilon.alt) (integral h^2 thin d nu)^(q \/ 2) . $ <eq:poisson-moments>]

]
] <lem:poisson-moments>

A proof using independent symmetric sums is given in Appendix 10.

The function $Z$ vanishes outside

$ S = { \( r \, t \) : max_e \| v_e \( r \, t \) \| > 1 } \, wide nu \( S \) lt.eq \| E \| \, $

because $u$ vanishes there. Hence we may take the signed Poisson sum $W$ of $Z$ on this finite-measure region.
  Every summand is in $V$, so $W in V$ almost surely.

Write $m_e = integral \| Z_e \|^p thin d nu$ and $a_e = integral \| Z_e \|^2 thin d nu$.
  Lemma 7 gives, for every $epsilon.alt > 0$,

$ 0 lt.eq bb(E) \| W_e \|^p - m_e lt.eq epsilon.alt m_e + C_(p \, epsilon.alt) a_e^(p \/ 2) . $

The two quadratic estimates in (7.3) imply

#[#set math.equation(numbering: n => "(7.10)")
 $ sum_e sigma_e a_e^(p \/ 2) lt.eq (max_e a_e)^(p \/ 2 - 1) sum_e sigma_e a_e lt.eq
   C_p H^(p - 2) . $ <eq:above-variance-error>]

Set $epsilon.alt = eta \/ 32$. The projection estimate gives $sum_e sigma_e m_e lt.eq \( 1 + eta \/ 8 \) b$,
  so the averaged $epsilon.alt m_e$ term is at most $eta b \/ 16$. Further,

$ H^(p - 2) / b lt.eq C_p H^(p - 2) / ell^(p + 1) lt.eq C_p L^(- \( p + 1 \)) H^(- gamma) lt.eq
  C_p L^(- \( p + 1 \)) . $

Enlarge $L$, still depending only on $p \, eta$, until the contribution of (7.10),
  including its constant $C_(p \, epsilon.alt)$, is at most $eta b \/ 16$. We have proved

#[#set math.equation(numbering: n => "(7.11)")
 $ sum_e sigma_e lr(|bb(E) \| W_e \|^p - b|) lt.eq frac(eta b, 8) + frac(eta b, 16) + frac(eta b, 16) =
   frac(eta b, 4) . $ <eq:above-poisson-error>]

=== 7.4 A bounded random gradient <a-bounded-random-gradient>

Choose a constant $C'_p$ so that

$ J = C'_p H 2^(2 ell) gt.eq 1 $

dominates both $sup_(e \, r \, t) \| Z_e \( r \, t \) \|$ and $sup_e a_e^(1 \/ 2)$.
  The exponential-moment formula for signed Poisson sums gives

$ bb(E) exp \( plus.minus W_e \/ J \) =
  exp (integral #scale(x: 120%, y: 120%)[\(] cosh \( Z_e \/ J \) - 1 #scale(x: 120%, y: 120%)[\)] thin d nu) lt.eq
  e^(C_0) \, $

where $C_0$ is absolute: use $cosh s - 1 lt.eq C_0 s^2$ for $\| s \| lt.eq 1$ and $a_e lt.eq J^2$.
  Consequently, for $z gt.eq 0$,

#[#set math.equation(numbering: n => "(7.12)")
 $ bb(P) \( \| W_e \| > J z \) lt.eq 2 e^(C_0 - z) \, wide bb(E) \| W_e \|^(2 p) lt.eq
   C_p J^(2 p) . $ <eq:above-poisson-tail>]

Set

$ K = 8 J log \( 2 n \) \, wide cal(B) = { max_e \| W_e \| > K } \, wide F = W upright(bold(1))_(cal(B)^c) . $

Discarding the entire vector on a bad event preserves membership in $V$,
  so $F in V$ and $parallel F parallel_oo lt.eq K$. By the union bound and (7.12),

$ bb(P) \( cal(B) \) lt.eq 2 \| E \| e^(C_0) \( 2 n \)^(- 8) lt.eq C n^(- 6) . $

For every edge, Cauchy–Schwarz therefore gives

#[#set math.equation(numbering: n => "(7.13)")
 $ 0 lt.eq bb(E) \| W_e \|^p - bb(E) \| F_e \|^p lt.eq \( bb(E) \| W_e \|^(2 p) \)^(1 \/ 2)
   bb(P) \( cal(B) \)^(1 \/ 2) lt.eq C_p J^p n^(- 3) . $ <eq:above-truncation-error>]

By (7.8),

$ log J = O_(p \, eta) \( H^gamma \) = o \( log n \) . $

Thus the last bound in (7.13) tends to zero uniformly over the input points and $lambda$.
  Since $b gt.eq 1$, it is at most $eta b \/ 4$ for all sufficiently large $n$,
  with the threshold depending only on $p \, eta$. Combining this with (7.11) and $lambda lt.eq 2 sigma$ yields

$ sum_e lambda_e lr(|bb(E) \| F_e \|^p - b|) lt.eq 2 sum_e sigma_e lr(|bb(E) \| F_e \|^p - b|) lt.eq eta b . $

The parameters $b gt.eq 1$ and $K gt.eq 1$ are independent of $lambda$ and of the input points,
  as required by Lemma 3. Finally,

$ log K = O_(p \, eta) \( H^gamma \) = O_(p \, eta) #scale(x: 120%, y: 120%)[\(] \( log n \)^(1 - 2 \/ p)
  #scale(x: 120%, y: 120%)[\)] . $

These are the parameters required by Lemma 3 in this range.

== 8 Dimension bounds and exact embeddings <dimension-bounds-and-exact-embeddings>

Table 1 summarizes the common parameters supplied by the two constructions.
  The target moment and magnitude bound are fixed before the test probability $lambda$ varies;
  the projection and the joint law of the random gradient may depend on that probability.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (center, center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Range
], table.cell(rowspan: 1, colspan: 1)[Common moment $b$
], table.cell(rowspan: 1, colspan: 1)[Magnitude bound $K$
]),
  table.cell(rowspan: 1, colspan: 1)[$1 < p < 2$
], table.cell(rowspan: 1, colspan: 1)[$bb(E) min { \| Y_e \| \, T \/ H }^p$
], table.cell(rowspan: 1, colspan: 1)[$H T$
],
  table.cell(rowspan: 1, colspan: 1)[$p > 2$
], table.cell(rowspan: 1, colspan: 1)[$p log 2 #scale(x: 120%, y: 120%)[\(] ell^p +
  2 sum_(1 lt.eq j < ell) j^p #scale(x: 120%, y: 120%)[\)]$
], table.cell(rowspan: 1, colspan: 1)[$8 J log \( 2 n \)$
],
)
]],
  caption: [Table 1: The weighted-moment contract for sufficiently large $n$. Here $T = exp \( A_(p \, eta) H^(2 - p) \)$, $ell = ceil.l L H^(1 - 2 \/ p) ceil.r$ in their respective ranges, and $J = C'_p H 2^(2 ell)$. All these choices are independent of the input points and pair weights. ],
)

=== 8.1 Completion of the upper bound <completion-of-the-upper-bound>

In Sections 6 and 7, the constructed parameters satisfy $b \, K gt.eq 1$, the weighted moment condition (3.1), and

$ log K lt.eq C_(p \, eta) \( log n \)^(gamma \( p \)) $

for all sufficiently large $n$, with a threshold depending only on $p \, eta$.
  Lemma 3 and (4.5) give an embedding of distortion at most $D$. Since $b gt.eq 1$, its dimension satisfies

$ log d lt.eq C_(p \, eta) + 2 p log K + log log \( 2 n \) lt.eq C_(p \, D) \( log n \)^(gamma \( p \)) . $

This proves the upper bound in (1.2) for sufficiently large $n$.
  For the remaining finitely many values of $n$, enlarge $C_(p \, D)$ and use Lemma 2.

=== 8.2 The packing bound <the-packing-bound>

The coordinate unit vectors in $ell_p^n$ form an equilateral set.
  After translating and scaling any distortion-$D$ image in $ell_p^d$,
  its points are $1$-separated and lie in the ball of radius $D$ about the first point.
  Their open balls of radius $1 \/ 2$ are disjoint and lie in the ball of radius $D + 1 \/ 2$ about that point.
  Comparing $d$-dimensional Lebesgue volumes gives

$ n \( 1 \/ 2 \)^d lt.eq \( D + 1 \/ 2 \)^d \, wide upright("hence") wide n lt.eq \( 1 + 2 D \)^d . $

This proves the lower bound in (1.2).

=== 8.3 A quadratic obstruction to exact embeddings <a-quadratic-obstruction-to-exact-embeddings>

For real $a \, b$, define

$ Delta_p \( a \, b \) = \| a + b \|^p + \| a - b \|^p - 2 \| a \|^p - 2 \| b \|^p . $

If $a b = 0$, this is zero. If $a b eq.not 0$, it has strictly the sign of $p - 2$.
  To verify this, apply convexity for $p > 2$, or concavity for $p < 2$,
  to the two numbers $\( a + b \)^2$ and $\( a - b \)^2$ raised to the power $p \/ 2$.
  Their average is $a^2 + b^2$. Next use the strict inequality

$ \( a^2 + b^2 \)^(p \/ 2)
  cases(delim: "{", > \| a \|^p + \| b \|^p \, & p > 2 \,, < \| a \|^p + \| b \|^p \, & p < 2 .) $

Thus, for $u \, v in ell_p^d$ and $p eq.not 2$,

#[#set math.equation(numbering: n => "(8.1)")
 $ parallel u + v parallel_p^p + parallel u - v parallel_p^p = 2 parallel u parallel_p^p +
   2 parallel v parallel_p^p quad arrow.l.r.double quad "supp" \( u \) ∩ "supp" \( v \) =
   diameter . $ <eq:disjointness>]

Indeed, the difference of the two sides is $sum_(a = 1)^d Delta_p \( u_a \, v_a \)$,
  whose nonzero summands all have the same sign.

Fix $k gt.eq 2$. Index the coordinates of $ell_p^(k^2)$ by ${ 1 \, dots.h \, k }^2$.
  Let $r_i$ be the indicator of row $i$, and $c_j$ the indicator of column $j$. Consider the $4 k + 1$ distinct points

$ cal(X)_k = { 0 } union { r_i \, - r_i : 1 lt.eq i lt.eq k } union { c_j \, - c_j : 1 lt.eq j lt.eq k } . $

Suppose that $cal(X)_k$ embeds with distortion one into $ell_p^d$.
  Translate and rescale to obtain an isometry $f$ with $f \( 0 \) = 0$. Strict convexity of $ell_p^d$ implies

#[#set math.equation(numbering: n => "(8.2)")
 $ f \( - x \) = - f \( x \) wide \( x in cal(X)_k \) . $ <eq:antipodes>]

In fact, $parallel f \( x \) - f \( - x \) parallel_p = 2 parallel x parallel_p$ and both $parallel f \( x \)
  parallel_p$ and $parallel f \( - x \) parallel_p$ equal $parallel x parallel_p$,
  so equality in the triangle inequality forces the two vectors $f \( x \)$ and $- f \( - x \)$ to coincide.

By (8.2), the expression in (8.1) is determined by distances among the given points and is preserved by $f$.
  Distinct rows have disjoint supports, so the supports of $f \( r_1 \) \, dots.h \,
  f \( r_k \)$ are pairwise disjoint. The same holds for $f \( c_1 \) \, dots.h \, f \( c_k \)$.
  In contrast, each row and column intersect in exactly one coordinate. Their defect is

$ parallel r_i + c_j parallel_p^p + parallel r_i - c_j parallel_p^p - 2 parallel r_i parallel_p^p -
  2 parallel c_j parallel_p^p = 2^p - 4 eq.not 0 . $

Consequently $"supp" \( f \( r_i \) \)$ meets $"supp" \( f \( c_j \) \)$ for every $\( i \, j \)$.
  A single coordinate can belong to at most one row support and at most one column support,
  so it can account for at most one of these $k^2$ intersections. It follows that $d gt.eq k^2$.

For $n gt.eq 9$, take $k = floor.l \( n - 1 \) \/ 4 floor.r$ and add distinct points if necessary to obtain an
  $n$-point set. Any exact embedding of that set restricts to one of $cal(X)_k$, proving the lower bound in (1.3).
  The upper bound is Lemma 2. Finally, $0 < gamma \( p \) < 1$,
  so the logarithmic limits in Theorem 1 follow from the stated bounds.

== 9 Electrical-flow localization <app:localization>

The following proof follows the heat-kernel and entropy argument of Gurel-Gurevich, Nachmias,
  and Sachdeva [7] Sections 2–4, in the symmetric projection notation used here.

#proof[
  Fix a strictly positive edge vector $w$, and define a vertex probability measure and its diagonal matrix by
  $ mu_i = frac(sum_(e in.rev i) w_e^2, 2 parallel w parallel_2^2) \, wide M = "diag" \( mu_i \) . $
  Connectivity implies $mu_i > 0$. Put
  $ L = B^T C B \, wide S = M^(- 1 \/ 2) L M^(- 1 \/ 2) \, wide K_t = M^(- 1 \/ 2) e^(- t S) M^(- 1 \/ 2) . $
  Writing $A = C^(1 \/ 2) B M^(- 1 \/ 2)$, we have $S = A^T A$ and $"im" A = "im" \( C^(1 \/ 2) B \)$.
    Spectral decomposition therefore gives the convergent matrix integral
  #[#set math.equation(numbering: n => "(9.1)")
   $ Q = integral_0^oo C^(1 \/ 2) B K_t B^T C^(1 \/ 2) thin d t . $ <eq:projection-heat-integral>]
  Indeed, the integrand is $A e^(- t A^T A) A^T$, whose integral is the orthogonal projection onto $"im" A$.
  For a vertex $v$, set $h_s = K_s upright(bold(e))_v$, where $upright(bold(e))_v$ is the $v$-th coordinate
    vector. The identity
  $ K_s = e^(- s M^(- 1) L) M^(- 1) $
  shows that $h_s$ has strictly positive coordinates for $s > 0$:
    the matrix $- M^(- 1) L$ has nonnegative off-diagonal entries,
    and after adding a sufficiently large multiple of the identity,
    its exponential is strictly positive by connectivity and the power series for the exponential. Moreover,
  $ mu^T h_s = 1 \, wide h_s arrow.r upright(bold(1)) quad \( s arrow.r oo \) \, wide h_0 =
    mu_v^(- 1) upright(bold(e))_v . $
  Mass conservation follows from $upright(bold(1))^T L = 0$;
    the limit follows from the spectral decomposition of $S$,
    whose kernel is spanned by $M^(1 \/ 2) upright(bold(1))$, a unit vector.
  For a positive vertex vector $h$, define
  $ cal(I) \( h \) = sum_(e = i j) c_e \( h \( i \) - h \( j \) \) \( log h \( i \) - log h \( j \) \) . $
  Using $partial_s h_s = - M^(- 1) L h_s$ and mass conservation, we obtain
  $ frac(d, d s) sum_i mu_i h_s \( i \) log h_s \( i \) = - h_s^T L log h_s = - cal(I) \( h_s \) . $
  Integrating first over a compact subinterval of $\( 0 \, oo \)$ and then taking the endpoints to $0$ and $oo$ gives
  #[#set math.equation(numbering: n => "(9.2)")
   $ integral_0^oo cal(I) \( h_s \) thin d s = log \( 1 \/ mu_v \) . $ <eq:heat-entropy>]
  Here $0 log 0 = 0$, so continuity gives the entropy at time $0$ as $log \( 1 \/ mu_v \)$,
    whereas its limit at infinity is $0$.
  For $a \, b > 0$, with the continuous interpretation when $a = b$,
  $ frac(a - b, log a - log b) = integral_0^1 a^u b^(1 - u) thin d u lt.eq frac(a + b, 2) . $
  Cauchy–Schwarz and $mu^T h_s = 1$ consequently yield
  #[#set math.equation(numbering: n => "(9.3)")
   $ #scale(x: 120%, y: 120%)[\(] w^T C^(1 \/ 2) \| B h_s \| #scale(x: 120%, y: 120%)[\)]^2 & lt.eq
     cal(I) \( h_s \) sum_(e = i j) w_e^2 frac(h_s \( i \) + h_s \( j \), 2)\
 & = cal(I) \( h_s \) parallel w parallel_2^2 . $ <eq:heat-cauchy-schwarz>]
  Since $K_(2 s) = K_s M K_s$, substituting $t = 2 s$ in (9.1), expanding $K_s M K_s$ into column outer products,
    and applying the triangle inequality gives
  $ w^T \| Q \| w & lt.eq 2 sum_v mu_v integral_0^oo #scale(x: 120%, y: 120%)[\(] w^T C^(1 \/ 2) \| B K_s
    upright(bold(e))_v \| #scale(x: 120%, y: 120%)[\)]^2 thin d s\
 & lt.eq 2 parallel w parallel_2^2 sum_v mu_v log \( 1 \/ mu_v \) lt.eq 2 parallel w parallel_2^2 log n \, $
  by (9.2) and (9.3). Continuity extends this bound to nonnegative $w$.
    Finally, $\| Q \|$ is symmetric and entrywise nonnegative, so for every real vector $x$,
  $ \| x^T \| Q \| x #scale(x: 120%, y: 120%)[\|] lt.eq \| x \|^T \| Q \| \| x \| lt.eq
    2 log n thin parallel x parallel_2^2 . $
  This proves (4.1). ◻
]

== 10 The Poisson moment inequality <app:poisson>

#proof[
  We prove the moment bounds first for a sum of independent symmetric real random variables $X_1 \, dots.h \,
    X_N$ with finite $q$th moments. For real $a \, b$,
  #[#set math.equation(numbering: n => "(10.1)")
   $ frac(\| a + b \|^q + \| a - b \|^q, 2) gt.eq \| a \|^q + \| b \|^q . $ <eq:scalar-lower>]
  Indeed, convexity of $u mapsto u^(q \/ 2)$ first bounds the left side below by $\( a^2 + b^2 \)^(q \/ 2)$,
    which is at least $\| a \|^q + \| b \|^q$. Iterating (10.1) proves the lower moment bound.
  For every $epsilon.alt' > 0$ there is $C_(q \, epsilon.alt')$ such that
  #[#set math.equation(numbering: n => "(10.2)")
   $ frac(\| a + b \|^q + \| a - b \|^q, 2) lt.eq \| a \|^q + \( 1 + epsilon.alt' \) \| b \|^q +
     C_(q \, epsilon.alt') \| a \|^(q - 2) \| b \|^2 . $ <eq:scalar-upper>]
  To see this, the case $a = 0$ is immediate. Otherwise divide by $\| a \|^q$ and put $u = b \/ a$.
    Near $u = 0$, Taylor’s theorem bounds the left side minus $1$ by $C_q u^2$.
    For sufficiently large $\| u \|$, the left side divided by $\| u \|^q$ is at most $1 + epsilon.alt'$.
    On the remaining compact set, enlarge the coefficient of $u^2$.
  Let $S_j = X_1 + dots.h.c + X_j$ and $M_q = bb(E) \| S_N \|^q$.
    Each $S_j$ is the conditional expectation of $S_N$ given $X_1 \, dots.h \, X_j$, so $bb(E) \| S_j \|^q lt.eq
    M_q$. Independence, symmetry, and (10.2) give
  $ M_q lt.eq \( 1 + epsilon.alt' \) sum_(j = 1)^N bb(E) \| X_j \|^q +
    C_(q \, epsilon.alt') M_q^(1 - 2 \/ q) sum_(j = 1)^N bb(E) \| X_j \|^2 . $
  Young’s inequality bounds the last term by $theta M_q +
    C_(q \, epsilon.alt' \, theta) \( sum_j bb(E) \| X_j \|^2 \)^(q \/ 2)$.
    Choose $epsilon.alt' \, theta > 0$ so that $\( 1 + epsilon.alt' \) \/ \( 1 - theta \) lt.eq 1 + epsilon.alt$,
    and absorb $theta M_q$. This proves the asserted independent-sum bounds.
  To pass to a Poisson sum on a region of mass $M > 0$, take $N > M$ independent trials,
    each equal to an independent signed sample with probability $M \/ N$ and zero otherwise.
    The sums of their $q$th and second moments are exactly $integral \| h \|^q thin d nu$ and $integral h^2 thin d
    nu$. Their activation count converges in law to a Poisson variable of mean $M$.
    Conditional on that count, their nonzero samples have the desired law. If $B_N$ is the activation count, then
  $ bb(E) e^(B_N) = (1 + frac(M \( e - 1 \), N))^N lt.eq e^(M \( e - 1 \)) . $
  Since $h$ is bounded, these exponential bounds give uniform integrability of the $q$th powers of the sums.
    Weak convergence followed by truncation therefore gives convergence of their $q$th moments;
    see also [5] Sections 3.2 and 4.6 for these standard convergence principles.
    The independent-sum bounds therefore imply (7.9). The case $M = 0$ is immediate. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Keith Ball. Isometric embedding in $l_p$-spaces.
  #emph[European Journal of Combinatorics], 11(4):305--311, 1990.
  #link("https://doi.org/10.1016/S0195-6698(13)80131-X")[doi:10.1016/S0195-6698(13)80131-X].]
#bibitem([2])[Jean Bourgain. On Lipschitz embedding of finite metric spaces in Hilbert space.
  #emph[Israel Journal of Mathematics], 52(1--2):46--52, 1985.
  #link("https://doi.org/10.1007/BF02776078")[doi:10.1007/BF02776078].]
#bibitem([3])[Jean Bourgain, Joram Lindenstrauss, and Vitali Milman. Approximation of zonoids by zonotopes.
  #emph[Acta Mathematica], 162:73--141, 1989. #link("https://doi.org/10.1007/BF02392835")[doi:10.1007/BF02392835].]
#bibitem([4])[Bo Brinkman and Moses Charikar. On the impossibility of dimension reduction in $ell_1$.
  #emph[Journal of the ACM], 52(5):766--788, 2005.
  #link("https://doi.org/10.1145/1089023.1089026")[doi:10.1145/1089023.1089026].]
#bibitem([5])[Rick Durrett. #emph[Probability: Theory and Examples].
  Author-posted manuscript, Version 5, January 11, 2019. #link("https://sites.math.duke.edu/~rtd/PTE/PTE5_011119.pdf").]
#bibitem([6])[Alexandros Eskenazis. $epsilon$-isometric dimension reduction for incompressible subsets of $ell_p$.
  #emph[Discrete & Computational Geometry], 71:160--176, 2024.
  #link("https://doi.org/10.1007/s00454-023-00587-w")[doi:10.1007/s00454-023-00587-w].]
#bibitem([7])[Ori Gurel-Gurevich, Asaf Nachmias, and Sushant Sachdeva.
  #emph[A Tight Bound on Localization of Electrical Flows]. arXiv:2605.24130v1, 2026.
  #link("https://arxiv.org/abs/2605.24130v1")[arxiv.org/abs/2605.24130v1].]
#bibitem([8])[Allen Hatcher. #emph[Algebraic Topology]. Cambridge University Press, Cambridge, 2002.
  #link("https://pi.math.cornell.edu/~hatcher/AT/AT.pdf").]
#bibitem([9])[Wassily Hoeffding. Probability inequalities for sums of bounded random variables.
  #emph[Journal of the American Statistical Association], 58(301):13--30, 1963.
  #link("https://doi.org/10.1080/01621459.1963.10500830")[doi:10.1080/01621459.1963.10500830].]
#bibitem([10])[Piotr Indyk. Stable distributions, pseudorandom generators, embeddings,
  and data stream computation. #emph[Journal of the ACM], 53(3):307--323, 2006.]
#bibitem([11])[William B. Johnson and Joram Lindenstrauss. Extensions of Lipschitz mappings into a Hilbert space.
  In #emph[Conference in Modern Analysis and Probability], Contemporary Mathematics, volume 26, pages 189--206.
  American Mathematical Society, Providence, RI, 1984.
  #link("https://doi.org/10.1090/conm/026/737400")[doi:10.1090/conm/026/737400].]
#bibitem([12])[John Lamperti. On the isometries of certain function-spaces.
  #emph[Pacific Journal of Mathematics], 8(3):459--466, 1958.
  #link("https://doi.org/10.2140/pjm.1958.8.459")[doi:10.2140/pjm.1958.8.459].]
#bibitem([13])[James R. Lee, Manor Mendel, and Assaf Naor. Metric structures in $L_1$:
  dimension, snowflakes, and average distortion. #emph[European Journal of Combinatorics], 26(8):1180--1190, 2005.
  #link("https://doi.org/10.1016/j.ejc.2004.07.002")[doi:10.1016/j.ejc.2004.07.002].]
#bibitem([14])[James R. Lee and Assaf Naor. Embedding the diamond graph in $L_p$ and dimension reduction in $L_1$.
  #emph[Geometric and Functional Analysis], 14(4):745--747, 2004.
  #link("https://doi.org/10.1007/s00039-004-0473-8")[doi:10.1007/s00039-004-0473-8].]
#bibitem([15])[Assaf Naor. Metric dimension reduction: a snapshot of the Ribe program.
  In #emph[Proceedings of the International Congress of Mathematicians---Rio de Janeiro 2018], volume I,
  pages 759--837. World Scientific, 2018. #link("https://arxiv.org/abs/1809.02376v1")[arXiv:1809.02376v1].]
#bibitem([16])[Assaf Naor and Kevin Ren. #emph[A threshold phenomenon for embeddings of Euclidean snowflakes and
  impossibility of dimension reduction]. arXiv:2609.01079v1, 2026.
  #link("https://arxiv.org/abs/2609.01079v1")[arxiv.org/abs/2609.01079v1].]
#bibitem([17])[OpenAI. #emph[A doubling Hilbert subset with no finite-dimensional bi-Lipschitz embedding].
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/A-doubling-Hilbert-subset-with-no-finite-dimensional-bi-Lipschitz-embedding-September-25-2026/main.pdf")[OAI:A-doubling-Hilbert-subset-with-no-finite-dimensional-bi-Lipschitz-embedding-September-25-2026],
  2026.]
#bibitem([18])[Iosif Pinelis. Exact Rosenthal-type bounds.
  #emph[The Annals of Probability], 43(5):2511--2544, 2015.
  #link("https://doi.org/10.1214/14-AOP942")[doi:10.1214/14-AOP942].]
#bibitem([19])[Gilles Pisier. Remarques sur un résultat non publié de B. Maurey.
  #emph[Séminaire d'analyse fonctionnelle], 1980--1981, Exposé no.~5, pages 1--12.
  École Polytechnique, Palaiseau, 1981. #link("https://numdam.org/item/SAF_1980-1981____A5_0/").]
#bibitem([20])[R. Tyrrell Rockafellar. #emph[Convex Analysis]. Princeton Mathematical Series, volume 28.
  Princeton University Press, Princeton, NJ, 1970; second printing, 1972.]
#bibitem([21])[Haskell P. Rosenthal. On the subspaces of $L^p$ $\( p > 2 \)$ spanned by sequences of independent
  random variables. #emph[Israel Journal of Mathematics], 8:273--303, 1970.
  #link("https://doi.org/10.1007/BF02771562")[doi:10.1007/BF02771562].]
#bibitem([22])[Gideon Schechtman. More on embedding subspaces of $L_p$ in $l_r^n$.
  #emph[Compositio Mathematica], 61(2):159--169, 1987. #link("https://numdam.org/item/CM_1987__61_2_159_0/").]
#bibitem([23])[Gideon Schechtman. #emph[Dimension reduction in $L_p$, $0 < p < 2$]. arXiv:1110.2148v1, 2011.
  #link("https://arxiv.org/abs/1110.2148v1")[arxiv.org/abs/1110.2148v1].]
#bibitem([24])[Aaron Schild, Satish Rao, and Nikhil Srivastava. Localization of electrical flows.
  In #emph[Proceedings of the Twenty-Ninth Annual ACM-SIAM Symposium on Discrete Algorithms],
  pages 1577--1584, 2018. #link("https://doi.org/10.1137/1.9781611975031.103")[doi:10.1137/1.9781611975031.103].
  Preprint version: #link("https://arxiv.org/abs/1708.01632v1")[arXiv:1708.01632v1].]
#bibitem([25])[Michel Talagrand. Embedding subspaces of $L_p$ in $ell_p^N$.
  In #emph[Geometric Aspects of Functional Analysis], Operator Theory:
  Advances and Applications, volume 77, pages 311--326. Birkhäuser, Basel, 1995.
  #link("https://doi.org/10.1007/978-3-0348-9090-8_26")[doi:10.1007/978-3-0348-9090-8\_26].]
