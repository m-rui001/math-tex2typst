#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A zero-entropy system without a smooth positive-volume model]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

The smooth realization problem asks which measure-preserving systems can be represented by smooth dynamics on a
  compact manifold. Here a #emph[smooth positive-volume model] of an invertible probability-preserving
  transformation $\( X \, mu \, T \)$ consists of a compact smooth manifold $M$ of finite dimension,
  a smooth positive probability volume $nu$, and a $C^oo$ diffeomorphism $S$ preserving $nu$,
  together with a measure-preserving isomorphism

$ F : X_0 arrow.r M_0 \, wide F compose T = S compose F \, $

on invariant conull measurable sets. Both $F$ and $F^(- 1)$ are measurable; no continuity is required.
  Here smooth positive volume means a probability measure with strictly positive smooth local densities, $d nu =
  f \( x \) \| d x_1 dots.h.c d x_d \|$, where $f > 0$ is smooth.
  The manifold may have a smooth boundary, with these densities smooth up to the boundary.
  No orientation of $M$ or orientation preservation by $S$ is required.
  The manifold and its dimension may depend on the original system.

A standard nonatomic probability space means a probability space isomorphic, modulo null sets,
  to the unit interval with Lebesgue probability.

Finite entropy is a necessary restriction in the smooth realization problem.
  For example, Ruelle’s differentiable entropy inequality #cite(label("Ruelle1978")) Theorem 2 gives finite
  entropy from compact derivative bounds. The question addressed here is whether this entropy restriction suffices
  when the invariant measure must be a smooth positive density.

For invertible ergodic transformations of standard nonatomic probability spaces,
  two positive realization results help locate this restriction.
  Lind and Thouvenot realized finite-entropy ergodic transformations by Lebesgue-preserving homeomorphisms of the
  two-torus #cite(label("LindThouvenot1977")). They also proved that a hyperbolic two-torus automorphism
  represents every such system with measure entropy below the automorphism’s topological entropy,
  using a suitable invariant Borel probability of full support;
  Quas and Soo recall this earlier result in #cite(label("QuasSoo2016")) §1.
  Quas and Soo’s Theorem 2 extends the result to toral automorphisms with no root-of-unity eigenvalue.
  Choosing a sufficiently high iterate of a hyperbolic automorphism therefore gives a smooth model for any
  prescribed finite-entropy system, with an invariant Borel probability of full support.
  Full support does not require a smooth positive density.

The requirement on the invariant measure is essential. A realization with an arbitrary invariant Borel
  probability, which may be singular, does not by itself give a smooth positive-volume model.
  This distinction is part of the classical formulation discussed by Katok and Thouvenot
  #cite(label("KatokThouvenot1997")) pp. 324–326. They developed slow entropy invariants and constructed ergodic
  $bb(Z)^2$ actions having no Lipschitz realization on a compact space of finite box dimension,
  even when the model may carry an arbitrary invariant Borel probability #cite(label("KatokThouvenot1997"))
  Proposition 4 and Corollary 2. The commuting generators must be realized together in that problem;
  its obstruction does not by itself answer the question for one transformation.
  Foreman and Weiss #cite(label("ForemanWeiss2022")) p. 2607 also discuss finite-entropy realization,
  in a formulation allowing an invariant measure merely equivalent to volume.
  Our conclusion concerns the smooth positive-density version;
  we do not assert an obstruction for every equivalent-to-volume invariant measure.
  Their anti-classification theorems concern the complexity of the measure-isomorphism relation among smooth
  transformations, including an ergodic area-preserving torus subclass #cite(label("ForemanWeiss2022"))
  Theorems 1–2 and Corollary 4. They do not assert that a particular abstract finite-entropy system lacks such a
  model. Subsequent anti-classification results treat weakly mixing smooth transformations
  #cite(label("Kunde2024")) Theorem B and mixing zero-entropy smooth transformations
  #cite(label("GerberKunde2025Mixing")) Theorem 2; these too study equivalence inside families of smooth models.

We give a negative answer to the smooth-volume realization question, already among systems of zero entropy.
  For a finite probability vector $p$, its Shannon entropy is

$ H \( p \) = - sum_a p \( a \) log_2 p \( a \) \, wide 0 log_2 0 = 0 . $

The entropy $H_mu \( cal(P) \)$ of a finite measurable partition is the entropy of its atom probabilities;
  the entropy of a finite random variable is likewise the entropy of its law. The Kolmogorov–Sinai entropy of $T$ is

$ h_mu \( T \) = sup_(cal(P)) lim_(n arrow.r oo) 1 / n H_mu #h(-0.16667em) (or.big_(j = 0)^(n - 1) T^(- j) cal(P)) \, $

where $cal(P)$ ranges over finite measurable partitions.

#thm([Theorem 1.1.])[
  #emph[There exists an ergodic invertible measure-preserving transformation $\( X \, mu \, T \)$ of a standard
    nonatomic probability space such that $h_mu \( T \) = 0$ and $\( X \, mu \, T \)$ is not measurably conjugate,
    on invariant conull sets, to any $C^oo$ diffeomorphism of a compact finite-dimensional manifold preserving a
    strictly positive smooth probability density. The manifold may have smooth boundary and need not be orientable.]
] <thm:main>

The proof isolates a property of smooth positive volume that remains useful after an arbitrary measurable change
  of coordinates. At a dyadic time $n = 2^k$, partition the manifold into small cells,
  choose a cell with its volume as probability, and choose two independent points $x \,
  y$ from its normalized volume. On most such pairs, one can find a point $z$ whose future shadows that of $x$ and
  whose past shadows that of $y$. More than the existence of this point is needed:
  the law of $z$ on the retained pairs is bounded by twice the original volume.
  The number of cells is at most $exp \( C B_k n \)$ for a sequence with $sum_k B_k^16 < oo$.
  The precise statement is 7.

This switch estimate is the main analytic ingredient. Its proof begins with a square-summable dyadic estimate for
  stationary diagonal derivative logs, rather than an assumed rate in an ergodic theorem.
  Finite-interval triangular changes of basis give the linear estimates needed to solve a boundary problem joining
  the two orbit halves. A relative exterior-power estimate controls the change in small endpoint minors,
  and a determinant identity and global injectivity control the law of the switch.
  The quantitative summability and the bound on the output measure are the features that will obstruct realization.

We construct the opposing symbolic system from finite sets $cal(W)_i$ of words of lengths $m_i$.
  Each word at the next level is a concatenation of words at the preceding level,
  and the system records their compatible alignment phases. Word labels are nonzero vectors over $bb(F)_2$.
  Certain pairs of labels separated by a power-of-two number of blocks must be orthogonal for a fixed alternating
  form. These constraints coexist with high entropy of short label lists and with a positive symbol-distance
  separation between distinct or misaligned words.

The entropy of the label lists makes two independent lists unlikely to satisfy most of the orthogonality tests.
  A smooth switch would force their phases and most of their labels to agree with the corresponding past and
  future lists of a single legal symbolic point. Those lists do satisfy the tests.
  Summability of the smooth partition cost, together with the growth of the word scales,
  supplies times at which conditioning on a cell loses too little entropy to reconcile the two conclusions.

The order of choices is important: the symbolic system is fixed first.
  Only then is a hypothetical smooth model, with any one finite dimension, considered.
  The scale argument absorbs all constants depending on that model.
  Thus the construction does not select a different counterexample for each dimension.

===== 1.1 Organization. <organization.>

Section 2, Section 3, Section 4 prove the switching estimate. 5 constructs the finite word families.
  6 supplies an ergodic probability on their phase extension and establishes the window entropy and graph
  constraints. 7 compares the two laws of one graph-passing statistic and proves 1.

===== 1.2 Conventions. <conventions.>

Logarithms in entropies and combinatorial estimates are to base $2$; natural logarithms are written $ln$,
  and derivative growth is written with $exp$ or $e$. Total variation distance between finite laws $p \,
  q$ is $"TV" \( p \, q \) = 1 / 2 sum_a \| p \( a \) - q \( a \) \|$.
  For finite random variables, conditional entropy means

$ H \( Y divides Z \) = sum_(z : Pr \( Z = z \) > 0) Pr \( Z = z \) thin H #scale(x: 120%, y: 120%)[\(]
  cal(L) \( Y divides Z = z \) #scale(x: 120%, y: 120%)[\)] . $

Conditional partition entropy uses the same definition for atom labels.
  We write $H_(upright("bin")) \( s \) = - s log_2 s - \( 1 - s \) log_2 \( 1 - s \)$ for binary entropy,
  with the same zero-mass convention at the endpoints. Constants denoted by $C$ may change from line to line.
  In the smooth part they depend only on the fixed smooth data, dimension, and a fixed exceptional-mass tolerance,
  unless otherwise specified. All asymptotic estimates there are uniform over the points, bins,
  and finite-interval frames satisfying the displayed hypotheses. The empty determinant and empty product equal one.

== 2 Stationary estimates for derivative growth <sec:stationary>

The switching construction requires control of derivatives on a long finite orbit segment.
  The accuracy may depend on the length of the segment, but the squared errors must be summable over dyadic
  lengths. We first obtain this summability for an arbitrary bounded stationary process.
  Applying the result to a triangular representation of the derivative then gives large sets of orbit segments
  with the required control.

=== 2.1 Deviation from a dyadic chord <deviation-from-a-dyadic-chord>

Let $\( Y_t \)_(t in bb(Z))$ be a real stationary process with $bb(E) Y_0^2 < oo$.
  Stationarity means that translating all indices in any finite list does not change its joint distribution.
  For $h gt.eq 0$ define the block average and normalized maximal chord deviation by

$ A_h = 2^(- h) sum_(t = 0)^(2^h - 1) Y_t \, wide Z_h = 2^(- h) max_(0 lt.eq u lt.eq 2^h)
  lr(|sum_(t = 0)^(u - 1) Y_t - u A_h|) . $

The maximum is over integer $u$, and an empty sum is zero. In particular $Z_0 = 0$.
  The chord here uses the average on the particular block under consideration;
  it is not a line whose slope is the mean of the stationary process.

#thm([Lemma 2.1.])[
  (Dyadic chord estimate).  #emph[For the process above, put
$ v_l = bb(E) A_(l - 1)^2 - bb(E) A_l^2 \, wide l gt.eq 1 . $

 Then $v_l gt.eq 0$, $sum_(l gt.eq 1) v_l lt.eq bb(E) Y_0^2$, and
#[#set math.equation(numbering: n => "(2.1)")
 $ parallel Z_h parallel_(L^2) lt.eq 1 / 2 sum_(a = 0)^(h - 1) 2^(- a \/ 2) sqrt(v_(h - a)) wide \( h gt.eq 1 \) .
   $ <eq:dyadic-convolution>]

 Consequently
#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(h gt.eq 1) parallel Z_h parallel_(L^2)^2 lt.eq C thin bb(E) Y_0^2 $ <eq:dyadic-square-sum>]

 for an absolute constant $C$. The same estimates hold for a block beginning at any deterministic integer time.]
] <lem:dyadic>

#proof[
  Consider a block of length $2^l$, and let $U$ and $V$ be the averages on its left and right halves.
    Its own average is $W = \( U + V \) \/ 2$. The identity
  $ frac(\( U - W \)^2 + \( V - W \)^2, 2) = frac(U^2 + V^2, 2) - W^2 $
  and stationarity give
  $ v_l = bb(E) frac(\( U - W \)^2 + \( V - W \)^2, 2) = bb(E) \( U - W \)^2 . $
  The last equality also follows pointwise from $V - W = - \( U - W \)$.
    Thus $v_l gt.eq 0$, and telescoping the differences of second moments proves the asserted bound on their sum.
    No independence of the two halves is used.
  We next compare the cumulative-sum polygon on $\[ 0 \, 2^h \]$ with its chord.
    For $a = 0 \, dots.h \, h$, let $F_a$ be the piecewise-linear interpolant that agrees with the cumulative sum
    at the multiples of $2^(h - a)$. Then $F_0$ is the chord and $F_h$ agrees with every integer-time cumulative
    sum. Passing from $F_a$ to $F_(a + 1)$ inserts the midpoint of each of $2^a$ intervals of length $2^(h - a)$.
    If $U_j \, W_j$ are respectively the left-child and parent averages on the $j$th such interval,
    the displacement at its midpoint is $2^(h - a - 1) \( U_j - W_j \)$.
    The difference of the interpolants is linear between the old and new vertices, so
  $ 2^(- h) parallel F_(a + 1) - F_a parallel_oo lt.eq 2^(- a - 1) max_(1 lt.eq j lt.eq 2^a) \| U_j - W_j \| . $
  Bounding a squared maximum by the sum of squares and using stationarity of each interval gives
  $ ∥2^(- h) parallel F_(a + 1) - F_a parallel_oo∥_(L^2) lt.eq
    2^(- a - 1) #scale(x: 120%, y: 120%)[\(] 2^a v_(h - a) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $
  The triangle inequality, first for the polygonal sup norm and then in $L^2$, proves (2.1).
  Extend the sequence $\( sqrt(v_l) \)_(l gt.eq 1)$ by zero to nonpositive indices.
    Its squared $ell^2$ norm is at most $bb(E) Y_0^2$. The right side of (2.1) is its convolution with the
    summable sequence $\( 2^(- a \/ 2 - 1) \)_(a gt.eq 0)$. The triangle inequality for the $ell^2$ norms of its
    translates therefore proves (2.2). Finally, stationarity identifies the distribution of each translated block
    with that of the block just considered. ◻
]

=== 2.2 A stationary triangular derivative representation <a-stationary-triangular-derivative-representation>

Fix a compact smooth manifold $M$ of dimension $d gt.eq 1$, a smooth Riemannian metric,
  a smooth diffeomorphism $S : M arrow.r M$, and an $S$-invariant probability measure $nu$.
  In the switching argument $nu$ will have a smooth positive density.
  That extra assumption is not needed in this section. The constructions also apply to a compact manifold with
  smooth boundary.

The compact frame extension and triangular cocycle have a classical precedent in Oseledets’s proof of the
  multiplicative ergodic theorem #cite(label("Oseledets1968")) §4, pp. 208–209, equations (6)–(10).
  We use the full orthogonal frame bundle and a positive-diagonal upper triangular convention.
  The finite-time estimates below follow from the stationary chord lemma;
  we do not invoke a limiting Lyapunov splitting or a convergence rate in the multiplicative ergodic theorem.

The orthonormal frame bundle $cal(F) M$ consists of the linear isometries $e : bb(R)^d arrow.r T_x M$,
  with bundle projection $pi \( e \) = x$. For each frame there is a unique positive-diagonal QR factorization

#[#set math.equation(numbering: n => "(2.3)")
 $ D S_x compose e = tilde(S) \( e \) thin R \( e \) \, $ <eq:frame-qr>]

where $tilde(S) \( e \)$ is an orthonormal frame at $S x$ and $R \( e \)$ is upper triangular with positive
  diagonal. This is ordinary Gram–Schmidt in the indicated order,
  with the length of each new perpendicular component chosen positive.
  It depends continuously, indeed smoothly, on the frame and the base point.

The map $tilde(S)$ is invertible. If $D S_x e = e' R$, then $\( D S_x \)^(- 1) e' = D \( S^(- 1) \)_(S x) e' =
  e R^(- 1)$, where the inverse linear map has domain $T_(S x) M$ and codomain $T_x M$.
  The matrix $R^(- 1)$ is again upper triangular with positive diagonal.
  Taking positive-diagonal QR after applying the inverse derivative therefore recovers $e$.
  This also proves continuity of the inverse. The construction uses the full orthonormal frame bundle and does not
  require a global frame or an orientation.

There is a $tilde(S)$-invariant probability $tilde(nu)$ whose projection is $nu$.
  To see this, first put the normalized orthogonal-group Haar measure on every fiber over $nu$.
  Orthogonal changes of local trivialization preserve this fiber measure,
  so the resulting probability is defined without choosing a global section.
  Each of its iterates under $tilde(S)$ projects to $nu$. Cesaro averages have a weakly convergent subsequence,
  because $cal(F) M$ is compact. The difference between the pushforward of an average and the average itself tends
  to zero against every continuous function, so its limit is invariant.
  Continuity of $pi$ preserves the marginal $nu$ in the limit.

Compactness and invertibility provide a constant $A_(*) > 1$ such that

#[#set math.equation(numbering: n => "(2.4)")
 $ parallel R \( e \) parallel \, med parallel R \( e \)^(- 1) parallel lt.eq
   A_(*) wide \( e in cal(F) M \) . $ <eq:qr-uniform-bounds>]

In particular $A_(*)^(- 1) lt.eq R \( e \)_(j j) lt.eq A_(*)$. The functions

$ g_j \( e \) = ln R \( e \)_(j j) \, wide 1 lt.eq j lt.eq d \, $

are continuous and bounded, and $\( g_j \( tilde(S)^t e \) \)_(t in bb(Z))$ is stationary under $tilde(nu)$.

#thm([Proposition 2.2.])[
  (Good finite orbit segments).  #emph[For each $eta > 0$ there is a positive sequence $\( b_k \)_(k gt.eq 1)$ with
#[#set math.equation(numbering: n => "(2.5)")
 $ b_k gt.eq 2^(- k \/ 10) \, wide sum_(k gt.eq 1) b_k^2 < oo \, $ <eq:b-summability>]

 and compact sets $tilde(cal(G))_k subset cal(F) M$ and $cal(G)_k = pi \( tilde(cal(G))_k \) subset M$ such that
$ tilde(nu) \( tilde(cal(G))_k \) gt.eq 1 - eta \/ 100 \, wide nu \( cal(G)_k \) gt.eq 1 - eta \/ 100 . $

 For $n = 2^k$, $b = b_k$, and $e in tilde(cal(G))_k$, define
$ A_t = R \( tilde(S)^t e \) quad \( - n lt.eq t < n \) \, wide lambda_j =
  frac(1, 2 n) sum_(t = - n)^(n - 1) ln \( A_t \)_(j j) . $

 Then for every $j$ and every integer $- n lt.eq u lt.eq n$,
#[#set math.equation(numbering: n => "(2.6)")
 $ lr(|sum_(t = - n)^(u - 1) ln \( A_t \)_(j j) - \( u + n \) lambda_j|) lt.eq b n . $ <eq:good-chord>]

 Consequently, on every subinterval $- n lt.eq u lt.eq v lt.eq n$,
#[#set math.equation(numbering: n => "(2.7)")
 $ lr(|sum_(t = u)^(v - 1) ln \( A_t \)_(j j) - \( v - u \) lambda_j|) lt.eq 2 b n . $ <eq:good-subinterval>]

]
] <prop:good-frames>

#proof[
  Apply 2 to each $g_j$. Let $c_(j \, h)$ be the right side of (2.1) for that process, and put $alpha_h^2 =
    sum_(j = 1)^d c_(j \, h)^2$. The lemma gives $sum_h alpha_h^2 < oo$. For example, take
  $ b_k = 40 eta^(- 1 \/ 2) alpha_(k + 1) + 2^(- k \/ 10) . $
  This sequence has the properties in (2.5). The interval $\[ - n \, n \)$ has length $2^(k + 1)$.
    Stationarity and the squared Markov inequality give
  $ tilde(nu) #h(-0.16667em) (max_(1 lt.eq j lt.eq d\
- n lt.eq u lt.eq n) lr(|sum_(t = - n)^(u - 1) g_j \( tilde(S)^t e \) - \( u + n \) lambda_j|) > b_k n) lt.eq
  frac(4 alpha_(k + 1)^2, b_k^2) lt.eq eta / 400 . $
  Define $tilde(cal(G))_k$ by the complementary non-strict inequalities.
    These are finitely many continuous inequalities on a compact bundle,
    so this set and its projection are compact. Moreover
  $ pi^(- 1) \( M \\ cal(G)_k \) subset cal(F) M \\ tilde(cal(G))_k . $
  The pushforward identity $pi_(*) tilde(nu) = nu$ gives the asserted base-measure estimate.
    No measurable choice of a frame over each point of $cal(G)_k$ is needed.
    Finally, subtracting the chord error at $u$ from the chord error at $v$ gives (2.7),
    with the same rates $lambda_j$. ◻
]

We call a frame in $tilde(cal(G))_k$ good at scale $k$, and a base point in $cal(G)_k$ good at that scale.
  Every good base point has a good witness frame. The estimates below hold for every such witness;
  witnesses at different points or scales need not be chosen coherently.
  We do not require an individual point to be good at all sufficiently large scales.

The stationary argument has now supplied the summable quantity that will control the cost of switching.
  Fix $eta$ and its sequence $\( b_k \)$, and use the following parameters at scale $n = 2^k$:

#[#set math.equation(numbering: n => "(2.8)")
 $ b & = b_k \, & B & = b^(1 \/ 8) \, & g & = b^(1 \/ 2) \,\
L & = ceil.l b^(1 \/ 4) n ceil.r \, & h_0 & = e^(- B n) \, & r & = e^(- 2 B n) \, & delta & =
  e^(- 3 B n \/ 2) . $ <eq:smooth-scales>]

The parameter $b$ controls the diagonal chord error $b n$;
  $g$ will be the separation margin for the finite-interval rates, $L$ is the short comparison time,
  and $B$ sets the spatial scales and the upper bound $C B n$ for the logarithm of the number of partition cells.
  Here $h_0$ and $r$ will be spatial lengths; $delta$ will be a neighborhood radius for an orbit construction.
  Since $b_k arrow.r 0$ and $b n gt.eq n^(9 \/ 10)$,

#[#set math.equation(numbering: n => "(2.9)")
 $ ln n = o \( b n \) \, quad b n = o \( g L \) \, quad g L = o \( g n \) \, quad g n = o \( L \) \, quad L =
   o \( B n \) . $ <eq:smooth-hierarchy>]

The ceiling in $L$ has no effect on these comparisons. We also have

$ sum_k B_k^16 = sum_k b_k^2 < oo \, wide B n gt.eq n^(79 \/ 80) . $

All subsequent asymptotic estimates are for $k arrow.r oo$.
  Constants may depend on the fixed smooth data, dimension, and $eta$, but not on the point, its good witness,
  or the scale.

== 3 Linear estimates on finite orbit segments <sec:linear>

We now turn the diagonal control of 3 into estimates for the full derivative. There are three steps.
  A finite-interval change of basis separates groups of diagonal rates,
  short derivatives identify nearly the same spaces at nearby base points,
  and a product-expansion estimate controls small perturbations relative to the possibly small exterior volumes.
  These statements will supply the linear data for switching orbit segments.

=== 3.1 Triangular products and separation of rates <triangular-products-and-separation-of-rates>

For invertible matrices $A_t$ indexed by $- n lt.eq t < n$, write

$ A \( t \, s \) = A_(t - 1) dots.h.c A_s quad \( t > s \) \, wide A \( s \, s \) = upright("Id") \, wide
  A \( s \, t \) = A \( t \, s \)^(- 1) . $

All vector norms and exterior-power norms in the next proposition are Euclidean operator norms.
  If $E$ is a $q$-dimensional subspace and $A$ is injective, let

$ J_q \( A \| E \) = parallel \( and.big^q A \) xi parallel \, $

where $xi$ is either unit simple $q$-vector spanning $E$. This is the intrinsic $q$-dimensional volume expansion.
  We set $J_0 = 1$, and the zeroth exterior power is the identity on $bb(R)$.

#thm([Proposition 3.1.])[
  (Finite-interval splitting).  #emph[Fix $d gt.eq 1$ and $A_(*) > 1$.
    There is a constant $C$, depending only on these two quantities, with the following properties.
    Let $n gt.eq 2$, $b > 0$, and $ln \( 2 n + 1 \) lt.eq b n$.
    Suppose that $A_t$, $- n lt.eq t < n$, are upper triangular with positive diagonal and
$ parallel A_t parallel \, med parallel A_t^(- 1) parallel lt.eq A_(*) \, wide
  lr(|sum_(t = - n)^(u - 1) ln \( A_t \)_(j j) - \( u + n \) lambda_j|) lt.eq b n $

 for $- n lt.eq u lt.eq n$ and $1 lt.eq j lt.eq d$, where $lambda_j = \( 2 n \)^(- 1) sum_(t = - n)^(n - 1)
   ln \( A_t \)_(j j)$.]
  #emph[First, order the rates as $lambda_(\( 1 \)) gt.eq dots.h.c gt.eq lambda_(\( d \))$.
    For every $0 lt.eq q lt.eq d$ and every $- n lt.eq s lt.eq t lt.eq n$,
#[#set math.equation(numbering: n => "(3.1)")
 $ lr(|ln parallel and.big^q A \( t \, s \) parallel - \( t - s \) sum_(j = 1)^q lambda_(\( j \))|) lt.eq
   C b n . $ <eq:exterior-rate-comparison>]

 The analogous estimate for $A \( s \, t \)$ uses the $q$ largest members of ${ - lambda_1 \, dots.h \, - lambda_d }$.]
  #emph[Next, suppose that real $gamma$ and $g > 0$ separate all the rates:
    each $lambda_j$ is at most $gamma - g$ or at least $gamma + g$.
    Let $F$ be the set of indices in the second group, let $p = \| F \|$, and put
$ Lambda = sum_(j in F) lambda_j \, wide Omega = - sum_(j in.not F) lambda_j . $

 There are decompositions $bb(R)^d = E_t^s xor E_t^f$, $- n lt.eq t lt.eq n$, invariant under each $A_t$,
   with $dim E_t^f = p$, whose two projections have norm at most $e^(C b n)$.
   For $s lt.eq t$ and $l = t - s$ they satisfy
#[#set math.equation(numbering: n => "(3.2)")
 $ parallel A \( t \, s \) \| E_s^s parallel & lt.eq e^(\( gamma - g \) l + C b n) \, & parallel A \( s \, t \) \|
   E_t^f parallel & lt.eq e^(- \( gamma + g \) l + C b n) \,\
parallel and.big^p A \( t \, s \) parallel & lt.eq e^(Lambda l + C b n) \, & e^(Lambda l - C b n) lt.eq
  J_p \( A \( t \, s \) \| E_s^f \) & lt.eq e^(Lambda l + C b n) \,\
parallel and.big^(d - p) A \( s \, t \) parallel & lt.eq e^(Omega l + C b n) \, & e^(Omega l - C b n) lt.eq
  J_(d - p) \( A \( s \, t \) \| E_t^s \) & lt.eq e^(Omega l + C b n) . $ <eq:split-propagation>]

 If $0 < p < d$ and at least one of $v_1 \, dots.h \, v_p$ belongs to $E_s^s$, then
#[#set math.equation(numbering: n => "(3.3)")
 $ parallel A \( t \, s \) v_1 and dots.h.c and A \( t \, s \) v_p parallel lt.eq
   e^(\( Lambda - 2 g \) l + C b n) product_(j = 1)^p parallel v_j parallel . $ <eq:mixed-exterior>]

 The backward analogue has exterior degree $d - p$, exponent $\( Omega - 2 g \) l + C b n$,
   and at least one factor in $E_t^f$. When a group is empty its space is ${ 0 }$,
   all statements on that space are vacuous, and the exterior-degree-zero conventions apply.]
] <prop:finite-splitting>

#proof[
  #emph[Diagonal normalization.] Write
  $ e_j \( u \) = sum_(t = - n)^(u - 1) #scale(x: 120%, y: 120%)[\(] ln \( A_t \)_(j j) -
    lambda_j #scale(x: 120%, y: 120%)[\)] \, wide D_u = "diag" \( e^(e_1 \( u \)) \, dots.h \, e^(e_d \( u \)) \) . $
  The chord hypothesis gives $parallel D_u parallel \, parallel D_u^(- 1) parallel lt.eq e^(b n)$. The matrices
  $ hat(A)_t = D_(t + 1)^(- 1) A_t D_t $
  are upper triangular with constant diagonal $\( e^(lambda_1) \, dots.h \, e^(lambda_d) \)$ and entries bounded
    by $e^(C b n)$. Since the rates are averages of logarithms of diagonal entries,
  #[#set math.equation(numbering: n => "(3.4)")
   $ \| lambda_j \| lt.eq ln A_(*) . $ <eq:bounded-rates>]
  Their inverse matrices also have entries bounded by $e^(C b n)$.
  We record how triangular products are estimated. If $m$ is fixed and upper-triangular $m$-by-$m$ matrices have
    constant diagonal $e^(alpha_1) \, dots.h \, e^(alpha_m)$, bounded $\| alpha_i \|$,
    and off-diagonal entries at most $e^(C b n)$, a term in any product entry can change its coordinate index
    strictly at most $m - 1$ times. There are at most a fixed constant times $\( 2 n + 1 \)^(m - 1)$ choices for
    those times and the intermediate indices. If the product length is $l$ and a term has $a lt.eq m -
    1$ strict changes, its diagonal factors contribute at most $e^(alpha_max \( l - a \))$.
    The omitted $a$ diagonal factors cost at most a fixed factor $e^(a \| alpha_max \|)$ after $e^(alpha_max l)$
    is factored out. The off-diagonal factors contribute $e^(C_m b n)$.
    The polynomial number of terms is absorbed by $ln \( 2 n + 1 \) lt.eq b n$.
    Thus the product norm is at most $e^(alpha_max l + C_m b n)$.
  Apply this argument to $and.big^q hat(A)_t$ in the coordinate-wedge basis, ordered lexicographically.
    This matrix is upper triangular of fixed dimension $binom(d, q)$,
    and its diagonal entries are $exp \( sum_(j in I) lambda_j \)$ for $q$-element index sets $I$.
    The largest such sum is $sum_(j = 1)^q lambda_(\( j \))$.
    For the reverse inequality, the diagonal of the product indexed by a maximizing set $I$ is exactly
    $exp \( l sum_(j in I) lambda_j \)$; that matrix entry is no larger than the operator norm.
    Converting back multiplies the exterior norms only by the two endpoint gauge bounds. This proves (3.1).
    Applying the same argument to inverse normalized steps in reverse time proves its backward version.
    The cases $q = 0 \, d$ follow as well: the former is the identity, and the latter is the determinant line.
  #emph[Removing entries between the groups.] We next conjugate $hat(A)_t$ by time-dependent upper unitriangular
    matrices to make the two coordinate index groups invariant.
    Process the superdiagonals in increasing order of their distance $j - i$ from the diagonal.
    At a position $i < j$ belonging to different groups, suppose the current entry is $h_t$.
    Use an elementary change $Q_t = upright("Id") + u_t E_(i j)$, where $E_(i j)$ has its only nonzero entry,
    equal to one, in position $\( i \, j \)$. In $Q_(t + 1)^(- 1) hat(A)_t Q_t$ the new entry at this position is
  $ h_t + e^(lambda_i) u_t - e^(lambda_j) u_(t + 1) . $
  To set it to zero, solve
  #[#set math.equation(numbering: n => "(3.5)")
   $ u_(t + 1) = q u_t + f_t \, wide q = e^(lambda_i - lambda_j) \, wide f_t =
     e^(- lambda_j) h_t . $ <eq:shear-recurrence>]
  If $q < 1$, prescribe $u_(- n) = 0$ and solve forward:
  $ u_t = sum_(a = - n)^(t - 1) q^(thin t - 1 - a) f_a . $
  If $q > 1$, prescribe $u_n = 0$ and solve backward:
  $ u_t = - sum_(a = t)^(n - 1) q^(thin t - 1 - a) f_a . $
  In each formula the coefficients have modulus at most one, so $\| u_t \| lt.eq 2 n max_a \| f_a \|$.
    Different groups cannot have $q = 1$. This bound avoids dividing by the possibly small separation of rates.
  Right multiplication by $Q_t$ changes column $j$ by a multiple of column $i$,
    and left multiplication by $Q_(t + 1)^(- 1)$ changes row $i$ by a multiple of row $j$.
    Upper triangularity shows that every affected off-diagonal position has distance at least $j - i$;
    at that distance only $\( i \, j \)$ changes. The possible quadratic cross term is zero because $E_(i j)
    hat(A)_t E_(i j) = \( hat(A)_t \)_(j i) E_(i j) = 0$. Thus a later operation cannot restore an entry on an
    earlier superdiagonal.
  There are at most $d \( d - 1 \) \/ 2$ operations. At each operation the bound above, the current entry bounds,
    and (3.4) bound the shear and its inverse by $e^(C b n)$.
    Multiplying or adding a fixed number of such quantities only changes $C$;
    the factor $2 n$ is absorbed by $ln \( 2 n + 1 \) lt.eq b n$.
    Induction over this fixed number of operations therefore gives matrices $C_t$ with
  #[#set math.equation(numbering: n => "(3.6)")
   $ parallel C_t parallel \, med parallel C_t^(- 1) parallel lt.eq e^(C b n) \, wide B_t =
     C_(t + 1)^(- 1) A_t C_t \, $ <eq:finite-gauge>]
  where $B_t$ is upper triangular, has diagonal $e^(lambda_j)$, and has no entries between the two groups.
    Its entries and those of $B_t^(- 1)$ are bounded by $e^(C b n)$.
    All constants are independent of the length of the interval.
  Let $bb(R)^F$ be the coordinate span with indices in $F$ and $bb(R)^(F^c)$ its coordinate complement. Set
  $ E_t^f = C_t bb(R)^F \, wide E_t^s = C_t bb(R)^(F^c) . $
  These spaces are invariant under the original matrices. Their projections are conjugates by $C_t$ of coordinate
    projections, and hence have norm at most $e^(C b n)$ after changing $C$.
    The two groups may be interlaced in the original coordinate order.
    Each induced block is nevertheless upper triangular in its inherited order;
    a fixed permutation makes the two blocks consecutive if desired.
    The triangular-product estimate within these blocks proves (3.2).
  #emph[Exterior volumes and mixed factors.] The fast rates are exactly the $p$ largest rates.
    The general exterior bound already proves the first inequality of (3.2).
    The normalized fast block has determinant $e^(Lambda l)$ on an interval of length $l$.
    To account explicitly for its possibly oblique basis, define
  $ V_F \( t \) =
    sqrt(det #scale(x: 120%, y: 120%)[\(] \( C_t \|_(bb(R)^F) \)^(*) \( C_t \|_(bb(R)^F) \)
    #scale(x: 120%, y: 120%)[\)]) . $
  For $p = 0$ this Gram determinant is one. The endpoint bounds in (3.6) imply $e^(- C b n) lt.eq
    V_F \( t \) lt.eq e^(C b n)$. The intrinsic volume expansion is exactly
  $ J_p \( A \( t \, s \) \| E_s^f \) = e^(Lambda l) frac(V_F \( t \), V_F \( s \)) . $
  This proves both volume bounds in (3.2). Applying the same argument to the inverse slow block gives (3.2),
    including either sign of $Omega$.
  The normalized block decomposition induces an invariant decomposition of each exterior power according to the
    number of fast and slow factors. In degree $p$, every sector with a slow factor has diagonal rate sum at most
    $Lambda - 2 g$: at least one fast rate has been replaced by a slow rate.
    The triangular-product estimate therefore bounds this entire sector by $e^(\( Lambda - 2 g \) l + C b n)$.
    If one original vector is slow, split each of the other vectors into its fast and slow parts.
    There are only a fixed number of terms, each still having a slow factor.
    The projection norms and endpoint gauges are absorbed into $e^(C b n)$, proving (3.3).
    Reversing time and exchanging the groups gives the backward statement.
    The empty-group cases require none of these mixed-factor assertions and follow from the stated conventions. ◻
]

The estimates concern every subinterval of one good finite trajectory.
  The change of basis is made once on that trajectory; only its values at the two ends of a subinterval enter a
  product estimate. In particular, a gauge loss is not multiplied once for each time step.

For a good frame in 3, the matrices of the derivative in the moving orthonormal frames satisfy the hypotheses
  above for all sufficiently large $k$. The proposition therefore gives tangent spaces $E_t^s \,
  E_t^f subset T_(S^t x) M$ and the corresponding derivative estimates.
  We use this notation also after expressing the spaces in chart coordinates.
  Coordinate maps from a fixed uniformly regular finite atlas conjugate every product only at its endpoints,
  so their bounded norms and inverse norms change the constants in the estimates, but not their form.

=== 3.2 Spaces that can be chosen uniformly in a spatial bin <spaces-that-can-be-chosen-uniformly-in-a-spatial-bin>

We need spaces at nearby starting points to agree much more accurately than their possible small angle.
  The comparison uses short derivative products and the parameters in (2.8).
  Fix a finite family of coordinate charts with smaller relatively compact subcharts covering $M$.
  Their coordinate maps, inverse maps, and the local expressions of $S$ and $S^(- 1)$ have uniform bounds through
  order two on the relevant compact sets. Each spatial bin below is contained in one of the smaller subcharts,
  has coordinate diameter at most $C h_0$, and uses that specified chart to identify its tangent spaces with
  $bb(R)^d$. At a boundary of $M$ use nested half-box charts.

For equal-dimensional subspaces $E \, F subset bb(R)^d$, measure their distance by $parallel Pi_E -
  Pi_F parallel$, where $Pi_E \, Pi_F$ are Euclidean orthogonal projections.
  This distance concerns the subspaces and does not require a choice of bases in them.

#thm([Lemma 3.2.])[
  (Common spaces in a bin).  #emph[For all sufficiently large $k$, each spatial bin $U$ meeting $cal(G)_k$ has a number
$ gamma_U in \[ g \, \( 8 d + 1 \) g \] $

 such that every good witness frame over $U$ has all its rates at most $gamma_U - g$ or at least $gamma_U + g$,
   with the same number $p_U$ in the second group. Apply 4 using this threshold.
   There is $c > 0$, independent of the bin and the witnesses, such that:]
  + #emph[The spaces $E_0^s$ from any two good witnesses over $U$ are within $e^(- c g L)$ of one another in its
    coordinate chart. The same holds for the spaces $E_0^f$.]
  + #emph[For good paths starting in $U$ whose time-$n$ endpoints lie in a common endpoint bin $V$,
    their spaces $E_n^f$ are within $e^(- c g L)$ of one another in the chart of $V$.
    For paths whose time-$\( - n \)$ endpoints lie in a common bin, the same assertion holds for $E_(- n)^s$.]
  #emph[In particular, fix one representative space for each nonempty combination of bins in (ii).
    Orthogonal projection onto it, restricted to any corresponding actual endpoint space,
    is an isomorphism with inverse norm at most $2$. If $p_U = 0$ or $p_U = d$,
    the relevant zero or full spaces agree exactly.]
] <lem:bin-spaces>

#proof[
  #emph[Short products in common charts.] Choose one reference point in a starting bin.
    Uniform Lipschitz bounds for $S$ and $S^(- 1)$ give, for another point in that bin,
  $ d_M \( S^t x \, S^t y \) lt.eq C A_0^(\| t \|) h_0 wide \( \| t \| lt.eq L \) $
  with a fixed $A_0 > 1$. Since $L = o \( B n \)$, this tends to zero uniformly.
    At each time on either short reference orbit choose a chart whose smaller subchart contains the reference
    point. All nearby orbits then remain in the same larger chart at that time.
    Use the prescribed bin chart at the initial time. The one-step coordinate derivatives and their inverses are
    bounded by a fixed constant, and their differences are at most $C A_0^(\| t \|) h_0$.
    The telescoping product identity consequently gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ parallel P_x^plus.minus - P_y^plus.minus parallel lt.eq e^(- B n + C L) = : zeta_k \, wide
     sigma_min \( P_x^plus.minus \) gt.eq e^(- C L) = : m_k . $ <eq:short-product-comparison>]
  Here $P_x^(+)$ and $P_x^(-)$ denote $D S_x^L$ and $D S_x^(- L)$, respectively,
    in these common initial and terminal charts. For example,
    summing the $L$ terms in the product difference bounds it by $C L A_1^(2 L) h_0$, which has the stated form.
    The inverse product bound gives the minimum stretch. On a manifold with boundary the same proof uses the
    nested half-box charts and uniform one-sided smooth bounds;
    equivalently the finitely many local expressions may be extended to their surrounding boxes.
  The singular values are Lipschitz with respect to operator norm.
    Since $zeta_k \/ m_k arrow.r 0$, (3.7) implies, after increasing the constants if necessary,
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| ln sigma_j \( P_x^(+) \) - ln sigma_j \( P_y^(+) \) \| lt.eq 2 zeta_k \/ m_k . $ <eq:short-log-singular>]
  For completeness, the singular-value Lipschitz bound follows from the min–max characterization,
    because $parallel P v parallel$ and $parallel Q v parallel$ differ by at most $parallel P -
    Q parallel$ on unit vectors. The logarithmic inequality then follows from the lower bound $m_k$.
  #emph[A threshold for every witness.] Let $lambda_(\( j \)) \( e \)$ be the sorted rates of a good witness $e$.
    Subtracting (3.1) for exterior degrees $j$ and $j - 1$ gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ lr(|L^(- 1) ln sigma_j \( P_(pi \( e \))^(+) \) - lambda_(\( j \)) \( e \)|) lt.eq
     C b n \/ L . $ <eq:singular-rate>]
  This argument uses the no-gap part of 4; a threshold has not yet been chosen.
    Fix one good witness $e_(*)$ in $U$. Equations (3.8) and (3.9) show that every good witness in $U$,
    including every other witness over the same point, satisfies
  $ max_j \| lambda_(\( j \)) \( e \) - lambda_(\( j \)) \( e_(*) \) \| lt.eq C b n \/ L +
    2 zeta_k \/ \( m_k L \) = o \( g \) . $
  Consider the $d + 1$ candidate thresholds $\( 1 + 8 j \) g$, $0 lt.eq j lt.eq d$.
    A real number lies within distance $3 g$ of at most one candidate.
    The $d$ representative rates therefore leave a candidate whose distance from all of them is greater than $3
    g$. For large $k$, all the other sorted rate lists differ by less than $g$,
    so this candidate separates every list with a margin greater than $2 g$.
    It has the weaker required margin $g$, and the number of rates above it is constant.
    Fix this candidate as $gamma_U$.
  #emph[Comparison of subspaces using one short map.] Assume first that $0 < p_U < d$ and put $q = d - p_U$.
    Use the single forward short map $P_(*) = P_(pi \( e_(*) \))^(+)$.
    Let $W$ be its bottom $q$ right-singular subspace. Its top $p_U$ singular values are at least
    $exp \( \( gamma_U + g \) L - C b n \)$ by (3.9). If $v$ is a unit vector in the slow space of any good
    witness $e$, then (3.2) and (3.7) give
  $ parallel P_(*) v parallel lt.eq e^(\( gamma_U - g \) L + C b n) + zeta_k . $
  Orthogonality of the images of right-singular vectors implies
  $ parallel Pi_(W^perp) v parallel lt.eq e^(- 2 g L + C b n) + zeta_k e^(- \( gamma_U + g \) L + C b n) lt.eq
    e^(- 2 g L + C b n) + e^(- B n + C L) . $
  In the last bound, constants absorb $\| gamma_U \| = O_d \( g \)$ and the other terms bounded by a constant
    times $L$. This is at most $e^(- c_1 g L)$ for some $c_1 > 0$ and large $k$.
  To pass from this directed estimate to a subspace estimate,
    observe that if $parallel Pi_(W^perp) \| E parallel lt.eq epsilon.alt < 1$ and $dim E = dim W$,
    then $Pi_W \| E$ is an isomorphism. The space $E$ is a graph over $W$ of norm at most $epsilon.alt \/
    sqrt(1 - epsilon.alt^2)$. The corresponding orthogonal projectors differ by at most a fixed multiple of
    $epsilon.alt$ when $epsilon.alt lt.eq 1 \/ 2$. Thus every slow space is within $C
    e^(- c_1 g L)$ of this same $W$; the triangle inequality compares any two slow spaces.
    No continuity assertion about singular vectors or chosen good frames has been used.
  For fast spaces use the single backward short map $P_(pi \( e_(*) \))^(-)$.
    Its bottom $p_U$ right-singular space is the comparison space.
    The top $q$ singular values are at least $exp \( - \( gamma_U - g \) L - C b n \)$,
    whereas a unit fast vector has backward stretch at most $exp \( - \( gamma_U + g \) L + C b n \)$.
    The identical calculation gives the error bound
  $ e^(- 2 g L + C b n) + zeta_k e^(\( gamma_U - g \) L + C b n) lt.eq e^(- 2 g L + C b n) + e^(- B n + C L) . $
  This proves (i) after reducing $c$ to absorb fixed factors.
    In particular, the error is $o \( e^(- C_0 b n) \)$ for every fixed $C_0$, by $b n = o \( g L \)$.
  #emph[Endpoint comparisons.] Keep the threshold of $U$. For paths starting in $U$ and ending at time $n$ in a
    common bin $V$, choose one representative path for this pair of bins.
    Apply the preceding short-product comparison from their time-$n$ points backward for length $L$.
    Their initial closeness for this comparison is supplied by $V$,
    not by propagating the starting-bin closeness for $n$ steps.
    All intervals $\[ n - L \, n \]$ lie inside the good interval,
    and all paths use the same group dimension and threshold.
    In particular, (3.1) applies on each $\[ n - L \, n \]$ with the same full-segment rates,
    so the singular-value comparison and the backward argument just proved compare their fast spaces at $n$.
    At $- n$, the identical all-subinterval estimate for forward short maps on $\[ - n \, - n + L \]$ gives the
    slow-space assertion.
  Finally, if $E$ and its chosen representative $F$ have equal dimension and $parallel Pi_E - Pi_F parallel lt.eq
    epsilon.alt$, then for $v in E$,
  $ parallel Pi_F v parallel gt.eq sqrt(1 - epsilon.alt^2) thin parallel v parallel . $
  The restriction is onto $F$ by equality of dimensions, and its inverse has norm at most
    $\( 1 - epsilon.alt^2 \)^(- 1 \/ 2) lt.eq 2$ for large $k$.
    If one group is empty, the associated spaces are identically zero or the full coordinate space,
    so all comparisons and projection conclusions follow directly. ◻
]

For later use, choose one good witness in each nonempty starting bin and orthonormal bases within each of its two
  spaces at time zero. The matrix having these two bases as columns has norm bounded by a dimension-only constant
  and inverse norm at most $e^(C b n)$, by the projection bounds of 4.
  It gives fixed product coordinates for that bin. Likewise 5 supplies fixed endpoint projections for each
  relevant pair of bins. All these choices are finite at a fixed scale.
  Their constancy within the indicated bins, rather than any continuity of choices between bins,
  is what the switching construction will use.

=== 3.3 Relative stability of exterior products <relative-stability-of-exterior-products>

The bounds on every unperturbed subinterval also control a perturbed long product.
  This must be a relative estimate: a leading volume can be exponentially small,
  so continuity with an absolute error alone is insufficient.

#thm([Lemma 3.3.])[
  (Exterior-product perturbation).  #emph[Fix $d gt.eq 1$ and $K gt.eq 1$.
    Let $0 lt.eq p lt.eq d$, let $m gt.eq 1$, and let $A_0 \, dots.h \, A_(m - 1)$ and $hat(A)_0 \, dots.h \,
    hat(A)_(m - 1)$ be real $d$-by-$d$ matrices such that
$ parallel A_t parallel lt.eq K \, wide parallel hat(A)_t - A_t parallel lt.eq epsilon.alt lt.eq 1 . $

 Use the same product notation as above for nonnegative indices. Suppose $a gt.eq 0$, $sigma in bb(R)$, and
$ parallel and.big^p A \( t \, s \) parallel lt.eq e^(sigma \( t - s \) + a) wide \( 0 lt.eq s lt.eq t lt.eq m \) . $

 There is $C = C \( d \, K \)$ such that
#[#set math.equation(numbering: n => "(3.10)")
 $ ∥and.big^p hat(A) \( m \, 0 \) - and.big^p A \( m \, 0 \)∥ lt.eq
   e^(sigma m + a) [\( 1 + C epsilon.alt e^(a + \| sigma \|) \)^m - 1] . $ <eq:exterior-perturbation>]

 For $p = 0$ the left side is zero.]
  #emph[In particular, use the scales (2.8), take $m lt.eq 2 n$, $a lt.eq C_1 b n$, $\| sigma \| lt.eq C_2$,
    and $epsilon.alt lt.eq C_3 e^(- 3 B n \/ 2)$, with fixed constants.
    Then for every fixed $C_0 > 0$ the left side of (3.10) is
#[#set math.equation(numbering: n => "(3.11)")
 $ o #h(-0.16667em) (e^(sigma m - C_0 b n)) \, $ <eq:relative-exterior-small>]

 uniformly for all matrices satisfying these hypotheses.]
] <lem:relative-exterior>

#proof[
  The exterior power is multiplicative. Multilinearity in its $p$ columns, together with the one-step bound $K +
    1$ for the perturbed matrices, gives
  $ E_t := and.big^p hat(A)_t - and.big^p A_t \, wide parallel E_t parallel lt.eq C epsilon.alt . $
  Expand the product using either the unperturbed exterior matrix or $E_t$ at each time.
    A term with $q gt.eq 1$ insertions has $q + 1$ unperturbed intervals whose total length is $m - q$.
    Allowing empty intervals, the hypothesis bounds that term by
  $ e^(sigma \( m - q \) + \( q + 1 \) a) \( C epsilon.alt \)^q =
    e^(sigma m + a) \( C epsilon.alt e^(a - sigma) \)^q . $
  There are $binom(m, q)$ choices of the inserted positions.
    Sum over $q = 1 \, dots.h \, m$ and use $- sigma lt.eq \| sigma \|$ to prove (3.10).
    This calculation explains why negative $sigma$, as may occur for backward exterior volumes, is harmless:
    each removed time step contributes only the displayed factor $e^(- sigma)$.
  For the final assertion put $u = C epsilon.alt e^(a + \| sigma \|)$ and use $\( 1 + u \)^m - 1 lt.eq
    m u e^(m u)$. After division by $e^(sigma m - C_0 b n)$ the bound is at most
  $ C m epsilon.alt e^(\( 2 C_1 + C_0 \) b n + C_2) exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C m
    epsilon.alt e^(C_1 b n + C_2) #scale(x: 120%, y: 120%)[\)] . $
  The logarithm of its decisive first factor is at most $- 3 B n \/ 2 + O \( b n \) + ln \( 2 n \)$,
    which tends to $- oo$ by (2.9). The quantity in the second exponential tends to zero for the same reason.
    All constants are fixed, proving the uniform little-oh assertion.
    For exterior degree zero the two products are both the identity, so the result holds without an expansion. ◻
]

The lemma applies to forward degree-$p$ products with $sigma =
  Lambda$ and to backward degree-$\( d - p \)$ products with $sigma = Omega$ from 4.
  Together with 5, it supplies uniform linear and relative-volume estimates for orbit segments whose starting
  points occupy one small spatial bin.

== 4 Switching a past and a future with controlled volume <sec:switching>

The finite-interval estimates now give a geometric operation on pairs of nearby points.
  It joins the future of one point to the past of the other.
  We must control the distribution of the resulting point as well as its orbit:
  this requires constructing both complementary joins and estimating their joint Jacobian.

The joining geometry is related to the canonical local-product coordinates of hyperbolic dynamics
  #cite(label("Smale1967")) §I.7. Solving a linear difference equation and then a nonlinear contraction also has a
  standard shadowing precedent #cite(label("ChowLinPalmer1989")) Lemma 3.2 and Proposition 4.1.
  Here the slow group may include zero or positive rates; we prove the finite-interval boundary inverse directly.
  The measure inequality requires the further determinant and injectivity arguments below.

#thm([Theorem 4.1.])[
  (Smooth switching).  #emph[Let $M$ be a compact smooth manifold of positive finite dimension,
    let $nu$ be a smooth positive probability volume in the density sense of 1, and let $S : M arrow.r
    M$ be a smooth diffeomorphism preserving $nu$. Fix a Riemannian distance $d_M$ and $eta > 0$.
    There exist positive numbers $B_k$ with $sum_k B_k^16 < oo$ and a constant $C$ such that the following holds
    for all sufficiently large $k$, with $n = 2^k$.]
  #emph[There is a finite measurable partition $cal(D)_k$ of $M$ with $\# cal(D)_k lt.eq exp \( C B_k n \)$.
    Define the probability measure
#[#set math.equation(numbering: n => "(4.1)")
 $ rho_k = sum_(Q in cal(D)_k\
nu \( Q \) > 0) frac(\( nu \|_Q \) ⊗ \( nu \|_Q \), nu \( Q \)) . $ <eq:pair-law>]

 Thus one first samples a cell with its $nu$-weight and then samples two independent points in that cell.
   There are a measurable set $G_k subset M times M$, with $rho_k \( G_k \) gt.eq 1 - eta$,
   and a measurable map $z_k : G_k arrow.r M$ such that
#[#set math.equation(numbering: n => "(4.2)")
 $ \( z_k \)_(*) \( rho_k \|_(G_k) \) lt.eq 2 nu $ <eq:switch-law>]

 and
#[#set math.equation(numbering: n => "(4.3)")
 $ sup_(\( x \, y \) in G_k)
   [max_(0 lt.eq t lt.eq n) d_M \( S^t z_k \( x \, y \) \, S^t x \) + max_(- n lt.eq t lt.eq 0) d_M \( S^t z_k \(
   x \, y \) \, S^t y \)] arrow.r 0 . $ <eq:switch-shadow>]

 The measure on the left of (4.2) is not normalized after restriction to $G_k$.
   The same conclusions hold if $M$ has a smooth boundary.]
] <thm:switching>

The proof occupies the rest of this section. Its first two steps produce two complementary switches
  $\( z \, w \)$. The last two steps show that their pair map is injective and has volume Jacobian $1 +
  o \( 1 \)$. This is what will give (4.2).

=== 4.1 Grids, retained pairs, and fixed endpoint projections <grids-retained-pairs-and-fixed-endpoint-projections>

We may assume $0 < eta < 1$. Apply 3 with parameter $eta \/ 2$.
  It supplies $b = b_k gt.eq n^(- 1 \/ 10)$, $sum_k b_k^2 < oo$, and a compact set of good base points,
  denoted here by $cal(A)_k$ to distinguish it from the retained pair set,
  with suitable frame paths on $\[ - n \, n \]$, such that $nu \( M \\ cal(A)_k \) < eta \/ 100$. Set

#[#set math.equation(numbering: n => "(4.4)")
 $ B = b^(1 \/ 8) \, quad h_0 = e^(- B n) \, quad r = e^(- 2 B n) \, quad L = ceil.l b^(1 \/ 4) n ceil.r \, quad
   g = b^(1 \/ 2) \, quad delta = e^(- 3 B n \/ 2) . $ <eq:switch-scales>]

Here and below constants depend only on the fixed smooth data, dimension, and $eta$.
  They never depend on a point, bin, frame witness, or $k$. In particular,

#[#set math.equation(numbering: n => "(4.5)")
 $ log n = o \( b n \) \, quad b n = o \( g L \) \, quad g L = o \( g n \) \, quad g n = o \( L \) \, quad L =
   o \( B n \) . $ <eq:switch-scale-order>]

These relations absorb every fixed power of a quantity bounded by $e^(C b n)$ or $e^(C g n)$ at the places where
  it is used below.

Choose a finite system of coordinate patches with smaller coordinate boxes covering $M$,
  each smaller box having closure in its patch. Assign points to the first smaller box containing them.
  This gives disjoint chart regions whose boundaries lie in finitely many smooth coordinate faces.
  The coordinate maps, their inverses, and the chart density of $nu$ have uniform bounds on slightly larger
  compact patches; the density has a uniform positive lower bound.
  Within each region use the grid of coordinate cubes of side $h_0$,
  keeping only cubes whose closures lie in that region. We call these cubes #emph[coarse bins].
  The discarded part has volume $O \( h_0 \)$: it is contained in a fixed multiple of the $h_0$-neighborhood of
  the finitely many region boundaries. All comparisons at a common starting or endpoint bin use its one fixed
  coordinate map.

For a starting bin $Q$ meeting $cal(A)_k$, 5 gives a common threshold $gamma_Q in \[ g \, C g \]$,
  a fast dimension $p_Q$, and reference spaces $E_Q^s \, E_Q^f$ at time zero.
  The spaces of every good frame path beginning in $Q$ are within $e^(- c g L)$ of these spaces.
  Their complementary projections and the inverse of a basis orthonormal within each space have norm at most
  $e^(C b n)$. The threshold and the reference spaces are chosen once for this bin.
  This involves finitely many choices at each scale, not a choice of a frame as a measurable function on $cal(A)_k$.

In the starting chart let $E_Q : bb(R)^(d - p_Q) times bb(R)^(p_Q) arrow.r
  bb(R)^d$ be the matrix with these orthonormal slow and fast columns, respectively.
  Tile the chart by the parallelepipeds $E_Q \( \[ 0 \, r \)^d + r j \)$, $j in bb(Z)^d$,
  and keep the ones whose closures lie in $Q$. Translations of the grid are immaterial.
  These are the #emph[product cells]. Although $parallel E_Q^(- 1) parallel lt.eq e^(C b n)$,
  the forward norm satisfies $parallel E_Q parallel lt.eq sqrt(2)$:
  for $\( a \, b \)$, $\| E_Q \( a \, b \) \| lt.eq \| a \| + \| b \|$.
  Thus every cell has physical diameter at most $C_d r$ and volume at least $e^(- C b n)
  r^d$ up to a fixed factor. The total number of full cells is consequently at most

#[#set math.equation(numbering: n => "(4.6)")
 $ C e^(C b n) r^(- d) lt.eq e^(C B n) . $ <eq:cell-count>]

Every point of a coarse bin at distance greater than $C_d r$ from its walls belongs to a full product cell.
  Hence the partial-cell loss, summed over all coarse bins, is $O \( r \/ h_0 \) = o \( 1 \)$.
  Use one additional cell for all omitted points and for bins not meeting $cal(A)_k$.
  Assign grid boundaries arbitrarily; they are null. This completes the partition $cal(D)_k$ without changing (4.6).

For two points $x = \( x_s \, x_f \)$ and $y = \( y_s \, y_f \)$ in the product coordinates of one cell,
  the ideal exchange

$ z_0 = \( y_s \, x_f \) \, wide w_0 = \( x_s \, y_f \) $

stays in that cell. These points combine the slow coordinate of one input with the fast coordinate of the other.
  For the pairs retained below, we will construct actual orbit joins $z \,
  w$ whose product coordinates differ from $z_0 \, w_0$ by $o \( r \)$.
  Removing thin coordinate strips will therefore keep those joins in their original cell.
  This is why the cells follow the two reference spaces, which need not be orthogonal; see 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (4.32, 0), (5.67, 2.52), (1.35, 2.52), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.9936, 0), (2.344, 2.52), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((3.154, 0), (4.504, 2.52), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0.351, 0.6552), (4.671, 0.6552), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0.945, 1.764), (5.265, 1.764), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((1.939, 1.764), radius: 0.07982, fill: black, stroke: none)
  content((1.914, 1.789), [$x$], anchor: "south-east")
  circle((3.505, 0.6552), radius: 0.07982, fill: black, stroke: none)
  content((3.53, 0.6303), [$y$], anchor: "north-west")
  circle((4.099, 1.764), radius: 0.07982, fill: black, stroke: none)
  content((4.124, 1.789), [$z_0$], anchor: "south-west")
  circle((1.345, 0.6552), radius: 0.07982, fill: black, stroke: none)
  content((1.32, 0.6303), [$w_0$], anchor: "north-east")
  line((0, -0.36), (1.35, -0.36), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.675, -0.36), [slow], anchor: "north", padding: 0.1176cm)
  line((-0.405, 0), (0.045, 0.8397), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-0.18, 0.4199), [fast], anchor: "south-east", padding: 0.1176cm)
})],
  caption: [Figure 1: A two-dimensional schematic of the ideal exchange in a product cell. Dashed lines hold one product coordinate fixed. The two coordinate directions may be oblique. For retained pairs, the actual joins are proved to differ from $z_0 \, w_0$ by $o \( r \)$ in 8. ],
) <fig:ideal-cell-exchange>

Fix a small number $tau > 0$, independent of $k$. The interior of a product cell retained at this stage consists
  of points whose every product coordinate is at least $tau r$ from its two cell faces.
  The discarded coordinate strips have at most $2 d tau$ of its Euclidean volume.
  The constant determinant of $E_Q$ cancels in this fraction.
  Moreover, the ratio between the largest and smallest smooth density on the physical cell is $1 + O \( r \)$,
  uniformly in $Q$. Thus the total smooth volume of these strips is at most $2 d tau + o \( 1 \)$.
  The corresponding strips of width $tau h_0$ in coarse bins have the same bound.
  These are estimates for the original measure $nu$, without conditioning on membership in $cal(A)_k$.

If $M$ has boundary, also exclude points having any iterate at an integer time in $\[ - n \, n \]$ at distance at
  most $c_0 h_0$ from $partial M$, where $c_0 > 0$ is fixed.
  A smooth boundary collar has volume $O \( h_0 \)$, so invariance bounds this loss by $O \( n h_0 \) =
  o \( 1 \)$. The latter limit follows from $B n gt.eq n^(79 \/ 80)$.
  Local coordinate extensions across the boundary may be used for uniform derivative bounds;
  all orbit tubes constructed below lie in the original manifold.

Let $R_k$ be the Borel set of points in $cal(A)_k$ that lie in the retained interiors of full product cells,
  whose two endpoints $S^(plus.minus n) u$ lie in coarse bins at coordinate distance at least $tau
  h_0$ from their faces, and that satisfy the boundary provision when needed.
  Bins not meeting $cal(A)_k$ contain no such point. The preceding estimates and invariance give

#[#set math.equation(numbering: n => "(4.7)")
 $ nu \( M \\ R_k \) lt.eq eta \/ 100 + C_d tau + o \( 1 \) . $ <eq:retained-point-loss>]

Choose $tau$ so that $C_d tau < eta \/ 100$, and then increase $k$ so that the right-hand side is less than
  $eta \/ 4$. Both marginals of (4.1) are exactly $nu$. Consequently, for

#[#set math.equation(numbering: n => "(4.8)")
 $ G_k = \( R_k times R_k \) ∩ union.big_(Q' upright(" a full product cell")) \( Q' times Q' \) \, wide
   rho_k \( G_k \) gt.eq 1 - eta \/ 2 gt.eq 1 - eta . $ <eq:retained-pairs>]

The measure $rho_k$ is supported on pairs in the same partition cell, and $R_k$ meets only full product cells.
  Hence $rho_k \( G_k \) = rho_k \( R_k times R_k \)$, and the two marginal bounds give the displayed estimate.
  No uniform distribution of good points inside individual cells is required.

We next fix the maps that will specify the switch. For each starting bin $Q$ and endpoint bin $U$ reached at time
  $n$ by a point of $cal(A)_k ∩ Q$, choose a representative endpoint fast space.
  Let $P_(Q \, U)^(+) : bb(R)^d arrow.r bb(R)^(p_Q)$ be its orthogonal projection,
  followed by a fixed orthonormal identification with $bb(R)^(p_Q)$.
  Similarly, for an endpoint bin $V$ reached at time $- n$, define $P_(Q \, V)^(-) : bb(R)^d arrow.r
  bb(R)^(d - p_Q)$ from a representative slow space. By the endpoint conclusion of 5,
  these projections restrict to isomorphisms on the actual fast and slow endpoint spaces of every corresponding
  good path, with inverse norm at most $2$ for large $k$. The maps depend only on the displayed bins and the
  starting threshold. They do not depend on a later choice of input in those bins.
  Zero-dimensional projections and determinants have their usual empty space meanings.

For a retained pair $\( x \, y \)$, write $Q$ for its coarse starting bin and $U_x \, V_x \, U_y \,
  V_y$ for the coarse bins of $S^n x \, S^(- n) x \, S^n y \, S^(- n) y$, respectively.
  If $chi_U$ denotes the coordinate map attached to a bin, define the following smooth maps on the open sets where
  the coordinates make sense:

#[#set math.equation(numbering: n => "(4.9)")
 $ F_x \( u \) & = P_(Q \, U_x)^(+) chi_(U_x) \( S^n u \) \, & P_x \( u \) & =
   P_(Q \, V_x)^(-) chi_(V_x) \( S^(- n) u \) \,\
F_y \( u \) & = P_(Q \, U_y)^(+) chi_(U_y) \( S^n u \) \, & P_y \( u \) & =
  P_(Q \, V_y)^(-) chi_(V_y) \( S^(- n) u \) . $ <eq:endpoint-maps>]

The subscripts denote fixed bin labels. We seek $z \, w$ satisfying

#[#set math.equation(numbering: n => "(4.10)")
 $ F_x \( z \) = F_x \( x \) \, quad P_y \( z \) = P_y \( y \) \, wide F_y \( w \) = F_y \( y \) \, quad
   P_x \( w \) = P_x \( x \) . $ <eq:four-switch-equations>]

The next step both solves these equations near the prescribed halves and gives a larger neighborhood in which each
  solution is unique. 2 displays the required exchange of endpoint data.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-3.247, 0.6025), (-2.753, 1.097), [#set text(hyphenate: false); #align(center + horizon)[$x$]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-3.247, -1.097), (-2.753, -0.6025), [#set text(hyphenate: false); #align(center + horizon)[$y$]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.753, 0.6025), (3.247, 1.097), [#set text(hyphenate: false); #align(center + horizon)[$z$]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.753, -1.097), (3.247, -0.6025), [#set text(hyphenate: false); #align(center + horizon)[$w$]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-2.643, 0.85), (2.643, 0.85), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((0, 0.85), [$F_x$], anchor: "south", padding: 0.1176cm)
  line((-2.643, -0.85), (2.643, -0.85), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((0, -0.85), [$F_y$], anchor: "north", padding: 0.1176cm)
  line((-2.656, 0.7527), (2.656, -0.7527), stroke: (paint: rgb("#bf6000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#bf6000"))))
  content((-1.38, 0.391), [$P_x$], anchor: "south", padding: 0.1176cm)
  line((-2.656, -0.7527), (2.656, 0.7527), stroke: (paint: rgb("#bf6000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#bf6000"))))
  content((-1.38, -0.391), [$P_y$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: The endpoint equations for the complementary switches. Solid arrows copy projected future coordinates; dashed arrows copy projected past coordinates. The arrows represent endpoint data, not trajectories in the manifold. ],
) <fig:switch-data>

=== 4.2 A boundary inverse and a nonlinear orbit <a-boundary-inverse-and-a-nonlinear-orbit>

#thm([Lemma 4.2.])[
  #emph[For every sufficiently large $k$ and every $\( x \, y \) in G_k$,
    the first two equations of (4.10) have a solution $z$ with
#[#set math.equation(numbering: n => "(4.11)")
 $ max_(0 lt.eq t lt.eq n) d_M \( S^t z \, S^t x \) + max_(- n lt.eq t lt.eq 0) d_M \( S^t z \, S^t y \) lt.eq
   e^(C g n) r . $ <eq:sharp-shadow>]

 In fixed regular coordinates along these halves the solution is unique among displacement arrays of sup norm at
   most $delta$. The complementary solution $w$ has the analogous properties with $x \, y$ exchanged.
   In the product coordinates of the common cell, if $x = \( x_s \, x_f \)$ and $y = \( y_s \, y_f \)$, then
#[#set math.equation(numbering: n => "(4.12)")
 $ z = \( y_s \, x_f \) + o \( r \) \, wide w = \( x_s \, y_f \) + o \( r \) \, $ <eq:ideal-switch>]

 uniformly over all retained pairs. Both outputs remain in the original product cell,
   and their relevant endpoints remain in the respective four original endpoint bins.]
] <lem:switch-orbits>

#proof[
  #emph[Uniform coordinates.] At each reference location choose one of finitely many slightly larger regular
    patches containing a fixed-radius neighborhood of that location.
    At time zero both strings use $chi_Q$; at the terminal times they use the endpoint charts already specified.
    Shrinking the fixed radius once, the one-step coordinate maps $chi_(t + 1) compose S compose
    chi_t^(- 1)$ and their first two derivatives are uniformly bounded wherever they will be used.
    The inverse one-step maps also have uniform first and second derivative bounds.
    For example, differentiating the inverse identity bounds their second derivatives by a fixed multiple of the
    forward second-derivative bound and the cube of the inverse first-derivative bound.
    This follows from a finite atlas with nested compact patches and smoothness on compact $M$;
    it does not depend on the number of steps. A patch can be chosen separately at each internal time.
    No iterate $S^n$ is assigned a uniform second derivative bound.
  Use displacement variables $v_t^(+)$ about $S^t x$, $0 lt.eq t lt.eq n$, and $v_t^(-)$ about $S^t y$, $- n lt.eq
    t lt.eq 0$. Write $A_t^(+) \, A_t^(-)$ for the derivative steps in these charts.
    Matching the two locations at zero and imposing the terminal equations gives the linear system
  #[#set math.equation(numbering: n => "(4.13)")
   $ v_(t + 1)^plus.minus - A_t^plus.minus v_t^plus.minus & = f_t^plus.minus \,\
v_0^(+) - v_0^(-) & = m \,\
P_(Q \, U_x)^(+) v_n^(+) & = h_(+) \, wide P_(Q \, V_y)^(-) v_(- n)^(-) = h_(-) . $ <eq:linear-boundary-system>]
  The matching datum for the actual problem is $m = chi_Q \( y \) - chi_Q \( x \)$; its norm is $O \( r \)$.
    The actual terminal data are zero.
  #emph[The inverse in weighted coordinates.] Let $gamma = gamma_Q$ and put $tilde(v)_t = e^(- gamma t) v_t$.
    Use the same weighting on equation data, with the step datum at its output time $t + 1$.
    By 4, the weighted propagators on slow spaces forward and fast spaces backward have norm at most $e^(C b n)
    e^(- g \| t - s \|)$. The associated projections have norm at most $e^(C b n)$.
    Geometric sums cost at most $C \/ g lt.eq e^(C b n)$, by (4.5) and the floor on $b$.
  On the future half, prescribe a slow vector $a in E_0^s \( x \)$.
    Variation of constants gives its slow part at every time by propagating $a$ forward and adding the projected
    step data. If $s_n$ is the resulting slow value at time $n$, the fast value there is uniquely
  $ c_n = \( P_(Q \, U_x)^(+) \|_(E_n^f \( x \)) \)^(- 1) \( tilde(h)_(+) - P_(Q \, U_x)^(+) s_n \) . $
  Propagate $c_n$ and the fast step data backward. All forced terms have norm at most $e^(C b n)$ times the sup
    norm of the weighted data. The dependence of the resulting fast value at zero on $a$ is the map
  #[#set math.equation(numbering: n => "(4.14)")
   $ K_(+) = - tilde(A)_x \( 0 \, n \) \|_(E_n^f \( x \)) \( P_(Q \, U_x)^(+) \|_(E_n^f \( x \)) \)^(- 1)
     P_(Q \, U_x)^(+) tilde(A)_x \( n \, 0 \) \|_(E_0^s \( x \)) \, wide parallel K_(+) parallel lt.eq
     e^(- 2 g n + C b n) . $ <eq:future-kernel-graph>]
  Here $tilde(A) \( t \, s \) = e^(- gamma \( t - s \)) A \( t \, s \)$.
    Both decaying factors are present in (4.14); there is no assumption that the endpoint projection annihilates
    the slow space. Thus $tilde(v)_0^(+) = a + K_(+) a + q_(+)$, with $q_(+)$ bounded by the weighted data as above.
  On the past half prescribe $b' in E_0^f \( y \)$, propagate fast backward,
    use the slow endpoint projection to fix the slow value at $- n$, and then propagate slow forward.
    This gives $tilde(v)_0^(-) = b' + K_(-) b' + q_(-)$, where
  #[#set math.equation(numbering: n => "(4.15)")
   $ parallel K_(-) parallel lt.eq e^(- 2 g n + C b n) \, wide parallel q_(-) parallel lt.eq
     e^(C b n) parallel upright("weighted data") parallel_oo . $ <eq:past-kernel-graph>]
  The map $\( a \, b' \) mapsto a - b'$ from $E_0^s \( x \) xor
    E_0^f \( y \)$ to the starting coordinate space has inverse norm at most $e^(C b n)$.
    Indeed the corresponding reference spaces are complementary with this bound,
    and their perturbation is $e^(- c g L)$; multiplication by the reference inverse still gives a perturbation
    tending to zero. The terms $K_(+) a - K_(-) b'$ are smaller still.
    A Neumann series therefore solves the matching equation with inverse cost $e^(C b n)$.
    This proves an $e^(C b n)$ inverse bound for the full weighted system.
    Removing the weights costs at most $e^(2 gamma \( n + 1 \))$, so its unweighted inverse $cal(L)^(- 1)$ satisfies
  #[#set math.equation(numbering: n => "(4.16)")
   $ parallel cal(L)^(- 1) parallel_(oo arrow.r oo) lt.eq Q_k \, wide Q_k = e^(C g n) . $ <eq:boundary-inverse>]
  If a group is empty, omit its variables, propagation formula, and terminal datum.
    The matching map on the remaining spaces and the same bounds apply, including the cases $p_Q = 0 \, d$.
  #emph[Contraction with a larger uniqueness radius.] Taylor expansion of each one-step map gives a residual
    $cal(R) \( v \)$ with
  #[#set math.equation(numbering: n => "(4.17)")
   $ parallel cal(R) \( v \) parallel_oo lt.eq C parallel v parallel_oo^2 \, wide parallel cal(R) \( v \) -
     cal(R) \( u \) parallel_oo lt.eq C delta parallel v - u parallel_oo $ <eq:one-step-remainder>]
  on the sup norm ball of radius $delta$. Every residual coordinate depends on just its one step,
    so the constant has no factor $n$. The matching and terminal equations are affine and have zero nonlinear
    residual. The nonlinear problem is $v = cal(L)^(- 1) \( a_0 + cal(R) \( v \) \)$,
    where $parallel a_0 parallel_oo lt.eq C r$. The scale relations give
  $ C Q_k delta arrow.r 0 \, wide Q_k r \/ delta arrow.r 0 . $
  For large $k$ the displayed map sends the $delta$-ball into its $delta \/
    2$-ball and has Lipschitz constant at most $1 \/ 4$. It has a unique fixed point in the larger ball,
    with $parallel v parallel_oo lt.eq 2 C Q_k r$. The exact one-step equations and the matching equation make
    this array one genuine orbit; call its point at zero $z$. Chart bounds give (4.11).
    In the boundary case its distance from each reference orbit is $o \( h_0 \)$, so it stays inside $M$.
  #emph[Time-zero coordinates and wall margins.] For the linear solution with zero step and terminal data,
    the two initial displacement spaces are the graphs in (4.14) and (4.15).
    In the reference product coordinates they differ from the slow and fast coordinate spaces by at most
    $e^(C b n) \( e^(- c g L) + e^(- 2 g n + C b n) \)$. Solving their matching equation therefore differs from
    ideal exchange of the fast and slow coordinates by at most
  #[#set math.equation(numbering: n => "(4.18)")
   $ e^(C b n) #scale(x: 120%, y: 120%)[\(] e^(- c g L) + e^(- 2 g n + C b n) #scale(x: 120%, y: 120%)[\)] r =
     o \( r \) . $ <eq:linear-switch-error>]
  All basis conversion and matching inverse factors are included in the constant $C$.
    The nonlinear solution differs from the linear one by at most $C Q_k \( 2 C Q_k r \)^2 =
    e^(C g n) r^2$ in ordinary coordinates, and still by $e^(C g n) r^2 = o \( r \)$ in product coordinates.
    This proves (4.12). The proof for $w$ is identical with the two inputs exchanged.
  Increase $k$ so that the error in each product coordinate is less than $tau r \/ 4$.
    The ideal exchanged point has distance at least $tau r$ from every product face because both inputs do.
    Thus $z \, w$ have coordinate margins at least $3 tau r \/ 4$ in their original cell.
    Similarly, (4.11) in the fixed endpoint charts is less than $tau h_0 \/ 4$,
    so each corresponding endpoint retains margin at least $3 tau h_0 \/ 4$ in its original coarse bin.
    These strict margins will recover all labels from the outputs.
    The point obtained does not depend on the auxiliary internal charts or on the frame witnesses used to justify
    the estimates. Two such constructions have the same endpoint equations and sharp radius $e^(C g n) r =
    o \( delta \)$. In either one’s charts both are therefore in its uniqueness ball, and hence coincide. ◻
]

=== 4.3 Relative minors and the joint determinant <relative-minors-and-the-joint-determinant>

We have constructed complementary orbit joins. A single join need not have a convenient Jacobian,
  so we now keep both of them. Their endpoint coordinates are permuted,
  which will cancel the large expansion and contraction factors.

For the fixed labels of a retained pair define

#[#set math.equation(numbering: n => "(4.19)")
 $ H_(a b) \( u \) = \( F_a \( u \) \, P_b \( u \) \) \, wide a \, b in { x \, y } . $ <eq:joint-endpoint-map>]

Each target has dimension $p_Q + \( d - p_Q \) = d$ and uses the fixed orthonormal coordinates in the projection ranges.

#thm([Lemma 4.3.])[
  #emph[All four derivatives $D H_(x x) \( x \)$, $D H_(y y) \( y \)$, $D H_(x y) \( z \)$,
    and $D H_(y x) \( w \)$ are nonsingular. Locally the equations (4.10) define a smooth pair map
    $Phi \( x \, y \) = \( z \, w \)$ with
#[#set math.equation(numbering: n => "(4.20)")
 $ J_(nu ⊗ nu) Phi \( x \, y \) = 1 + o \( 1 \) \, $ <eq:pair-jacobian>]

 uniformly on the retained pairs. The conclusion includes empty slow or fast groups.]
] <lem:switch-jacobian>

#proof[
  Put $p = p_Q$. For the future map at $x$, use the actual fast and slow spaces first,
    with orthonormal bases within each. The fast $p$-minor has absolute value at least $e^(Lambda_x n - C b n)$,
    where $Lambda_x$ is the sum of its fast rates. This follows from the fast volume lower bound in 4 and from the
    uniformly invertible restriction of the endpoint projection.
    Every other maximal minor contains a slow starting vector and is at most $e^(\( Lambda_x - 2 g \) n + C b n)$
    when both groups occur. Replacing the actual bases with the common reference basis changes their spaces by
    $e^(- c g L)$. After a change of orthonormal basis within each space,
    multilinearity and the full exterior norm bound show that the leading minor stays nonzero and that all other
    maximal minors are $o \( 1 \)$ times its absolute value. Factors from the inverse of the possibly oblique
    starting basis are at most $e^(C b n)$. Call the resulting leading absolute minor $A_x$.
    More explicitly, when $0 < p < d$, every nonleading maximal future minor $Delta$ in the common reference basis
    satisfies
  $ frac(\| Delta \|, A_x) lt.eq C (e^(- 2 g n + C b n) + e^(- c g L + C b n)) = o \( 1 \) . $
  The first term comes from the mixed-exterior estimate. The second comes from the change of spaces,
    using the full exterior upper bound and the leading-minor lower bound.
    Increasing $C$ includes the oblique-basis factors. If $p = 0$ or $p = d$,
    there are no nonleading maximal future minors, so this comparison is unnecessary.
  Define $A_y$ in the same way for the future of $y$. For the past maps the leading columns are slow,
    and the backward exterior rate is
  $ Omega_x = - sum_(upright("slow at ") x) lambda_j \( x \) . $
  Denote their leading absolute minors by $B_x \, B_y$. They have lower bounds $e^(Omega_x n - C b n)$ and
    $e^(Omega_y n - C b n)$, respectively, and all other maximal minors are relatively negligible.
    No sign is prescribed for $Lambda_x$ or $Omega_x$ in a perturbation estimate.
  We must transfer the future minors from $x$ to $z$ relative to $A_x$, even if this leading quantity is small.
    Use the reference charts along the future of $x$ for both nearby orbits.
    By (4.11), their one-step derivatives differ by at most $C delta$ for large $k$.
    On every unperturbed subinterval the $p$-th exterior product has norm at most $e^(Lambda_x ell + C b n)$.
    Applying 6 gives, for every fixed $C_0$,
  #[#set math.equation(numbering: n => "(4.21)")
   $ ∥and.big^p D \( S^n \)_z - and.big^p D \( S^n \)_x∥ = o #scale(x: 120%, y: 120%)[\(] e^(Lambda_x n - C_0 b n)
     #scale(x: 120%, y: 120%)[\)] \, $ <eq:relative-minor-transfer>]
  where the derivatives are represented in these common starting and endpoint coordinates.
    To see the scale in this application, an expansion term with $q gt.eq 1$ altered factors is bounded by
  $ e^(Lambda_x \( n - q \) + \( q + 1 \) C_1 b n) \( C delta \)^q . $
  The binomial sum, divided by $e^(Lambda_x n - C_0 b n)$, tends to zero because $n delta e^(C b n) arrow.r 0$.
    The bounded factor $e^(q \| Lambda_x \|)$ covers either sign of the rate.
    The same reasoning backward uses $Omega_y$ and $e^(q \| Omega_y \|)$.
    Fixed endpoint projections and the common starting basis preserve (4.21),
    after increasing $C_0$ if an inverse basis factor is needed.
    Hence at $z$ the leading future and past minors are $A_x \( 1 + o \( 1 \) \)$ and $B_y \( 1 + o \( 1 \) \)$,
    with the same relative smallness of all the other minors. At $w$ they are $A_y$ and $B_x$.
  Expand each full determinant along its $p$ future rows. There is one leading product,
    from fast future columns and slow past columns. Every other term has a relatively negligible maximal minor.
    In the common starting basis the four absolute determinants are therefore
  #[#set math.equation(numbering: n => "(4.22)")
   $ upright("map and point") & H_(x x) \( x \) & H_(y y) \( y \) & H_(x y) \( z \) & H_(y x) \( w \)\
upright("absolute determinant") & A_x B_x \( 1 + o \( 1 \) \) & A_y B_y \( 1 + o \( 1 \) \) & A_x
  B_y \( 1 + o \( 1 \) \) & A_y B_x \( 1 + o \( 1 \) \) . $ <eq:four-leading-products>]
  All leading factors are positive. In particular these maps are locally invertible.
    If $p = 0$, future targets and minors are empty and $A_x = A_y = 1$; if $p = d$, the past minors are $B_x =
    B_y = 1$. The same determinants and conclusions apply, without mixed minors of the missing kind.
  The defining equations say that $\( H_(x y) \( z \) \, H_(y x) \( w \) \)$ is a fixed permutation of
    $\( H_(x x) \( x \) \, H_(y y) \( y \) \)$. Differentiation gives the exact identity
  #[#set math.equation(numbering: n => "(4.23)")
   $ \| det D Phi \( x \, y \) \| =
     frac(\| det D H_(x x) \( x \) \| thin \| det D H_(y y) \( y \) \|, \| det D H_(x y) \( z \) \| thin \| det D
     H_(y x) \( w \) \|) . $ <eq:exact-switch-determinant>]
  Each full derivative represented in the common product basis differs from its coordinate derivative by the
    factor $det E_Q$. There are two such factors in the numerator and two in the denominator,
    so they cancel exactly. Substituting (4.22) cancels $A_x \, B_x \, A_y \, B_y$ individually,
    with no comparison between the rates of $x$ and $y$. Thus the coordinate Jacobian is $1 + o \( 1 \)$.
    All four starting points lie in the same cell of diameter $O \( r \)$.
    The ratio of the two output smooth densities to the two input densities is therefore $1 + o \( 1 \)$ as well.
    This proves (4.20). ◻
]

=== 4.4 Measurability, recovered labels, and global injectivity <measurability-recovered-labels-and-global-injectivity>

The Jacobian calculation is local. To convert it into the desired measure inequality we must ensure that no
  multiplicity arises from different choices of bins or local branches.

#thm([Lemma 4.4.])[
  #emph[The map $Phi : G_k arrow.r M times M$, $Phi \( x \, y \) = \( z \, w \)$, is measurable and injective.
    Its restriction to countably many measurable pieces agrees with smooth local diffeomorphisms having the
    Jacobian in (4.20).]
] <lem:switch-injective>

#proof[
  First fix a retained pair. Its cell and four endpoint labels are locally constant among retained inputs near it,
    because of the positive wall margins. By 9, the implicit equations define a smooth local pair branch near its
    outputs. This branch agrees with the constructed switch on nearby retained inputs.
    Indeed, for this fixed $k$, continuity of the finitely many maps $S^t$, $\| t \| lt.eq n$,
    makes their reference halves arbitrarily close when their inputs are close.
    The constructed solutions have sharp radius $e^(C g n) r = o \( delta \)$ about those halves.
    Both the old local implicit branch and the construction for the nearby pair therefore lie in the old
    $delta$-tube, and satisfy the same fixed endpoint equations with the nearby right-hand sides.
    The contraction uniqueness argument identifies them even for these changed data:
    two solutions $u \, v$ in the old ball satisfy $cal(L) \( v - u \) = cal(R) \( v \) - cal(R) \( u \)$,
    so $parallel v - u parallel_oo lt.eq C Q_k delta parallel v - u parallel_oo$ forces equality.
    Both candidate arrays here use the old reference halves. Their matching datum is therefore the same old
    coordinate difference; only the prescribed endpoint values change with the nearby inputs.
    The charts along the old pair may be kept fixed in this neighborhood.
    In particular no regularity of a choice of good frame witnesses is needed.
  The retained set is Borel, and $M times M$ is second countable.
    A countable subcollection of these relative neighborhoods covers it.
    Subtracting earlier members partitions it into countably many Borel pieces.
    On each piece $Phi$ is the restriction of the indicated smooth local diffeomorphism;
    this proves measurability and supplies the pieces for change of variables.
  For injectivity suppose $Phi \( x \, y \) = Phi \( x' \, y' \) = \( z \, w \)$.
    The interiors of product cells are disjoint, and both outputs stayed in the original cell.
    Thus the two input pairs have the same product cell and hence the same starting bin $Q$, threshold,
    and dimensions. The four endpoint-bin labels are recovered from the ordered output pair by
  #[#set math.equation(numbering: n => "(4.24)")
   $ \( U_x \, V_x \, U_y \, V_y \) = #scale(x: 120%, y: 120%)[\(] "bin" \( S^n z \) \, "bin" \( S^(- n) w \) \,
     "bin" \( S^n w \) \, "bin" \( S^(- n) z \) #scale(x: 120%, y: 120%)[\)] . $ <eq:recovered-bin-labels>]
  All four endpoints have positive margins in their bins. Therefore these labels,
    and exactly the four projections and coordinate maps in (4.9), are the same for the competing inputs.
  On the future half, both $x$ and $x'$ are within $e^(C g n) r$ of $z$;
    on the past half both are within that distance of $w$. Consequently their full orbits on $\[ - n \, n \]$ are
    within $2 e^(C g n) r = o \( delta \)$ of each other. Moreover the recovered equations give
  $ F_x \( x' \) = F_x \( z \) = F_x \( x \) \, wide P_x \( x' \) = P_x \( w \) = P_x \( x \) . $
  Apply the boundary uniqueness argument of 8 with both reference halves equal to the true good orbit of $x$.
    It uses $x$’s endpoint projections, zero matching datum, and zero terminal data.
    The orbit of $x$ is one solution. In the same charts the orbit of $x'$ is another solution in its
    $delta$-ball, since its distance is $o \( delta \)$ even after fixed chart conversions.
    Uniqueness gives $x' = x$. The same argument gives $y' = y$.
    Only the true input orbits were required to be good; neither $z$ nor $w$ was required to belong to $cal(A)_k$
    or to $R_k$. ◻
]

#proof[
  The construction above applies for all sufficiently large $k$.
    Equation (4.4) gives $sum_k B_k^16 = sum_k b_k^2 < oo$; any finitely many unused terms can be chosen
    positively. The partition bound follows from (4.6), retention from (4.8), and uniform shadowing from (4.11).
  It remains to prove the output measure bound. On the square of a positive-volume cell $Q'$,
    the original law $rho_k$ has density $1 \/ nu \( Q' \)$ with respect to $nu ⊗ nu$.
    The map $Phi$ sends retained pairs in that square into the same square.
    By 9, its inverse volume Jacobian is at most $2$ for all sufficiently large $k$.
    Apply change of variables on the countably many pieces of 10. Their images are disjoint by global injectivity.
    Summing therefore gives
  $ Phi_(*) \( rho_k \|_(G_k) \) lt.eq 2 rho_k . $
  The factor $1 \/ nu \( Q' \)$ is unchanged. Restriction to endpoint-label pieces or to $G_k$ is never followed
    by normalization, and zero-volume cells contribute nothing.
    Taking first marginals proves (4.2), because the first marginal of $rho_k$ is $nu$.
    The construction already handled the optional smooth boundary. ◻
]

== 5 Words with prescribed relations and recognizable boundaries <sec:words>

We now construct finite families of words that will define the symbolic system.
  At each level, short lists of constituent labels have large entropy,
  although specified pairs of labels satisfy a bilinear relation.
  We also require that a word can be recognized, together with its alignment, from a sufficiently accurate copy.
  The construction in this section is entirely finite at each step; no invariant probability is chosen yet.

Nested-word constructions and probabilistic control of frequencies and shifted comparisons have precedents in
  #cite(label("ForemanRudolphWeiss2011")) §4.1 and Proposition 43.
  Related word and phase frameworks appear in #cite(label("ForemanWeiss2022")) §§4.2.3–4.2.4.
  Our graph constraints and the per-word condition below are proved separately; in particular,
  we do not require every lower-level word to occur in every parent or import unique ergodicity from those
  constructions.

All positions in a finite word are numbered from zero. For a word $u$,
  write $u \[ t \, t + q \)$ for its consecutive subword of length $q$ starting at $t$.
  For two words of the same length, $d_(upright(H)) \( u \, v \)$ denotes the number of coordinates at which they
  differ. Thus this distance counts symbols or constituent labels according to the alphabet being used.
  For probabilities $p \, q$ on a finite set, we use

$ "TV" \( p \, q \) = 1 / 2 sum_a \| p \( a \) - q \( a \) \| . $

Write $cal(L) \( Y \)$ for the distribution of a random variable $Y$.

=== 5.1 Parameters and the four word properties <parameters-and-the-four-word-properties>

Each new word will concatenate words from the preceding family. We control two sampling experiments:
  choosing a word uniformly from its family, and fixing a parent at the next level and choosing one of its
  constituents uniformly. We compare the laws of windows at the same internal offset in these two chosen words.
  Requiring this approximation for every parent will allow arbitrary parent weights in the eventual invariant measure.

The construction first samples constituent lists satisfying the relations inside independent groups.
  It then keeps lists satisfying the per-parent approximation,
  and finally selects a family with the required window distributions and distances.
  The parameters below provide enough groups and candidate words for these selections.

Fix

#[#set math.equation(numbering: n => "(5.1)")
 $ epsilon_i = 2^(- i - 2) \, wide L_i = 2^(2 s_i) - 1 \, wide ell_i = log L_i \, wide K_i =
   floor.l sqrt(ell_i) floor.r \, $ <eq:word-parameters>]

and put

#[#set math.equation(numbering: n => "(5.2)")
 $ N_i = 2^(K_i) \, wide H_i = 2^(floor.l K_i \/ 2 floor.r) \, wide D_i^(*) = 2^(floor.l K_i \/ 8 floor.r) \, wide
   m_1 = 1 \, wide m_(i + 1) = m_i N_i . $ <eq:word-lengths>]

Starting from the integer $s_1$, define $2 s_(i + 1)$ to be the greatest even integer not exceeding

#[#set math.equation(numbering: n => "(5.3)")
 $ X_i := epsilon_i / 100 N_i ell_i . $ <eq:word-recursion>]

The proof below shows that this recursion is well defined at every level if $K_1 gt.eq 256$.
  There is no need to optimize this initial size.

Let $cal(A)_i = bb(F)_2^(2 s_i) \\ { 0 }$. On the full vector space use the nondegenerate alternating form

$ \[ u \, v \]_i = sum_(a = 1)^(s_i) #scale(x: 120%, y: 120%)[\(] u_a v_(s_i + a) +
  u_(s_i + a) v_a #scale(x: 120%, y: 120%)[\)] in bb(F)_2 . $

The fixed symbol alphabet is $cal(A) = cal(A)_1$. Each family $cal(W)_i subset
  cal(A)^(m_i)$ will have $L_i$ members. Once it has been constructed, choose a bijection with $cal(A)_i$;
  this equips its word labels with the form $\[ dot.op \, dot.op \]_i$.
  In particular, a word label and its vector label are identified only through this fixed bijection.

Whenever $w$ is a concatenation of $N_i$ members of $cal(W)_i$, let

$ c_i \( w \) = \( u_0 \, dots.h \, u_(N_i - 1) \) in cal(W)_i^(N_i) $

be its list of constituents. The list is unambiguous because all members of $cal(W)_i$ have the same length and
  are distinct. Here $m_i$ is the symbol length, $L_i$ counts distinct level-$i$ words,
  and $N_i$ counts constituent occurrences in a level-$\( i + 1 \)$ word, with repetitions allowed.
  In the properties below, $H_i$ is the group length and $D_i^(*)$ bounds the window lengths and prescribed
  power-of-two lags; these lengths and lags are measured in level-$i$ constituent positions.
  We fix the approximation tolerance

#[#set math.equation(numbering: n => "(5.4)")
 $ theta.alt = 10^(- 4) . $ <eq:word-tv-tolerance>]

#thm([Proposition 5.1.])[
  (Finite word families).  #emph[Choose $s_1$ so that $K_1 gt.eq 256$, and define the parameters by (5.1)–(5.3).
    There are families $cal(W)_i subset cal(A)^(m_i)$ of cardinality $L_i$, with $cal(W)_1 = cal(A)$,
    such that every $w in cal(W)_(i + 1)$ is a concatenation of $N_i$ members of $cal(W)_i$ and the following
    properties hold.]
  + #emph[#strong[Relations within groups.] Write $c_i \( w \) = \( u_0 \, dots.h \, u_(N_i - 1) \)$.
    For every $0 lt.eq b < N_i \/ H_i$, every $0 lt.eq k lt.eq floor.l K_i \/ 8 floor.r$, and every $0 lt.eq
    r < r + 2^k < H_i$,
$ \[ u_(b H_i + r) \, u_(b H_i + r + 2^k) \]_i = 0 . $

]
  + #emph[#strong[Distance between words and shifted words.] If $v \, w in cal(W)_(i + 1)$ are distinct, then
$ d_(upright(H)) #scale(x: 120%, y: 120%)[\(] c_i \( v \) \,
  c_i \( w \) #scale(x: 120%, y: 120%)[\)] gt.eq \( 1 - epsilon_i \) N_i . $

 For all $v \, w \, z in cal(W)_(i + 1)$, with repetitions allowed, and all $1 lt.eq t < N_i$,
$ d_(upright(H)) #scale(x: 120%, y: 120%)[\(] \( c_i \( v \) c_i \( w \) \) \[ t \, t + N_i \) \,
  c_i \( z \) #scale(x: 120%, y: 120%)[\)] gt.eq \( 1 - epsilon_i \) N_i . $

]
  + #emph[#strong[Distributions of short windows.] Let $U$ be uniform on $cal(W)_(i + 1)$.
    For each $0 lt.eq t lt.eq N_i - D_i^(*)$ there is a probability $Q_(i \, t)$ on $cal(W)_i^(D_i^(*))$ such that
$ "TV" #scale(x: 120%, y: 120%)[\(] cal(L) \( c_i \( U \) \[ t \, t + D_i^(*) \) \) \,
  Q_(i \, t) #scale(x: 120%, y: 120%)[\)] lt.eq theta.alt . $

 Moreover, for $1 lt.eq d' lt.eq D_i^(*)$, any distinct positions $0 lt.eq r_1 < dots.h.c < r_(d') < D_i^(*)$,
   and any prescribed labels $v_1 \, dots.h \, v_(d') in cal(W)_i$,
#[#set math.equation(numbering: n => "(5.5)")
 $ Q_(i \, t) { u : u_(r_j) = v_j upright(" for ") 1 lt.eq j lt.eq d' } lt.eq
   2 (2^(2 K_i) / L_i)^(d') . $ <eq:word-sublist>]

]
  + #emph[#strong[Approximation in each individual word.] Suppose $i gt.eq 2$.
    For every fixed $w in cal(W)_(i + 1)$, write $c_i \( w \) = \( u_0 \, dots.h \, u_(N_i - 1) \)$ and let $J$ be
    uniform on ${ 0 \, dots.h \, N_i - 1 }$. If $U$ is uniform on $cal(W)_i$, then for each $0 lt.eq t lt.eq
    N_(i - 1) - D_(i - 1)^(*)$,
$ "TV"
  (cal(L) #scale(x: 120%, y: 120%)[\(] c_(i - 1) \( u_J \) \[ t \, t + D_(i - 1)^(*) \)
  #scale(x: 120%, y: 120%)[\)] \, cal(L) #scale(x: 120%, y: 120%)[\(] c_(i - 1) \( U \) \[ t \, t + D_(i -
  1)^(*) \) #scale(x: 120%, y: 120%)[\)]) lt.eq theta.alt . $

 The first law averages the constituents of the single fixed word $w$; it does not average over $cal(W)_(i + 1)$.]
] <prop:words>

Property ((5.5)) compares the two sampling experiments described above.
  The following elementary estimate controls empirical laws both within each parent and across the selected family.

#thm([Lemma 5.2.])[
  (Averages of probability vectors).  #emph[Let $Y_1 \, dots.h \,
    Y_q$ be independent random probability vectors on a set of cardinality $A$, all with mean $p$. Then
$ bb(E) thin "TV" (1 / q sum_(b = 1)^q Y_b \, p) lt.eq 1 / 2 sqrt(A / q) . $

 Coordinates within an individual vector need not be independent.]
] <lem:word-tv>

#proof[
  For $hat(p) = q^(- 1) sum_b Y_b$, independence between vectors gives
  $ sum_a "Var" \( hat(p) \( a \) \) = 1 / q^2 sum_(b \, a) "Var" \( Y_b \( a \) \) lt.eq 1 /
    q^2 sum_b bb(E) sum_a Y_b \( a \)^2 lt.eq 1 / q . $
  Apply the inequality $bb(E) \| Z \| lt.eq \( bb(E) \| Z \|^2 \)^(1 \/ 2)$ coordinatewise and then Cauchy–Schwarz
    to the sum over the $A$ coordinates. ◻
]

#proof[
  #emph[Growth of the fixed parameters.] Whenever $X_i gt.eq 6$, rounding in (5.3) gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ X_i - 3 < ell_(i + 1) lt.eq X_i \, wide ell_(i + 1) gt.eq X_i / 2 = epsilon_i /
     200 2^(K_i) ell_i . $ <eq:word-rounding>]
  Indeed, $X_i - 2 < 2 s_(i + 1) lt.eq X_i$, and $2 s_(i + 1) -
    1 < log \( 2^(2 s_(i + 1)) - 1 \) < 2 s_(i + 1)$ when $2 s_(i + 1) gt.eq 2$. We claim inductively that
  #[#set math.equation(numbering: n => "(5.7)")
   $ K_i gt.eq 256 \, wide epsilon_i K_i gt.eq 32 thin 2^(i - 1) \, wide K_(i + 1) gt.eq 2^(K_i \/ 3) gt.eq
     K_i^2 gt.eq 4 K_i . $ <eq:word-growth>]
  The first two inequalities hold at $i = 1$. If they hold at level $i$, then $ell_i gt.eq K_i^2$ implies
  $ X_i gt.eq 8 / 25 K_i 2^(K_i) gt.eq 6 \, wide ell_(i + 1) gt.eq 4 / 25 K_i 2^(K_i) gt.eq 2^(K_i) . $
  Consequently $K_(i + 1) gt.eq 2^(K_i \/ 2) - 1 gt.eq 2^(K_i \/ 3) gt.eq K_i^2 gt.eq 4 K_i$.
    These elementary inequalities hold for every $K_i gt.eq 256$; for example, $K \/ 3 -
    2 log K$ is increasing there and is positive at $256$. Since $epsilon_(i + 1) = epsilon_i \/ 2$,
    the second bound in (5.7) propagates as well. In particular, all parameters are positive and defined,
    $H_i$ divides $N_i$, and $D_i^(*) lt.eq H_i$.
  #emph[Sampling the relations.] Suppose that $cal(W)_i$ and its vector labeling have been fixed.
    Generate a list $\( U_0 \, dots.h \, U_(N_i - 1) \)$ in independent consecutive groups of $H_i$ positions.
    Within each group, proceed from left to right. Choose each new label uniformly among the nonzero vectors
    orthogonal to all earlier labels at the lags $2^k$, $0 lt.eq k lt.eq floor.l K_i \/ 8 floor.r$,
    that stay inside the group. There are at most $floor.l K_i \/ 8 floor.r + 1 lt.eq K_i$ linear equations.
    Their common kernel has codimension at most $K_i$, whether or not the equations are independent.
    As $2 s_i gt.eq ell_i gt.eq K_i^2$, the number of nonzero choices is at least
  #[#set math.equation(numbering: n => "(5.8)")
   $ 2^(2 s_i - K_i) - 1 gt.eq 2^(2 s_i - K_i - 1) gt.eq L_i / 2^(2 K_i) . $ <eq:word-choices>]
  Denote this unconditioned law on $cal(W)_i^(N_i)$ by $P_i^0$.
    Every sampled list satisfies the relations in Property (Proposition 5.1).
  For later use, set $zeta_i = 2^(2 K_i) \/ L_i$ within this proof.
    The conditional probability of any specified label at any position, given all preceding positions,
    is at most $zeta_i$. If $r_1 < dots.h.c < r_(d')$ are specified positions,
    conditioning first at $r_(d')$ and then successively at the earlier specified positions gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ P_i^0 { U_(r_j) = v_j upright(" for all ") j } lt.eq zeta_i^(d') . $ <eq:word-raw-sublist>]
  All unspecified labels are integrated out. This argument does not require independence within a group.
  Each individual $U_r$ nevertheless has a uniform marginal on $cal(W)_i$.
    To see this, the group of linear maps preserving the alternating form acts transitively on its nonzero
    vectors. Given such a vector $v$, nondegeneracy provides $w$ with $\[ v \, w \]_i = 1$;
    the plane spanned by $v \, w$ is nondegenerate, and its orthogonal complement carries a nondegenerate
    alternating form of dimension two less. Induction extends $v \, w$ to a symplectic basis,
    proving transitivity by mapping one such basis to another.
    The sequential rule is equivariant under these maps, including its uniform choices,
    so each marginal is invariant under a transitive action and hence uniform.
  #emph[Imposing the approximation in each word.] For $i gt.eq 2$ and an offset $0 lt.eq t lt.eq N_(i - 1) -
    D_(i - 1)^(*)$, let
  $ f_t \( u \) = c_(i - 1) \( u \) \[ t \, t + D_(i - 1)^(*) \) \, wide u in cal(W)_i \, $
  and let $p_t$ be its law under uniform choice of $u$. For each of the $q_i =
    N_i \/ H_i$ independently sampled groups, form the empirical probability vector of the $H_i$ values
    $f_t \( U_r \)$ in that group. Its mean is $p_t$ by the uniform one-label marginals just proved.
    The average of these independent vectors is exactly the law of $f_t \( U_J \)$ when $J$ is uniform over the
    entire sampled list. The alphabet of $f_t$ has cardinality at most $A_i = L_(i - 1)^(D_(i - 1)^(*))$.
    Thus 12, Markov’s inequality, and a union over at most $N_(i - 1)$ offsets bound the probability of violating
    any requirement in Property ((5.5)) by
  #[#set math.equation(numbering: n => "(5.10)")
   $ F_i := theta.alt^(- 1) N_(i - 1) sqrt(frac(L_(i - 1)^(D_(i - 1)^(*)), N_i \/ H_i)) . $ <eq:word-filter-budget>]
  Below we verify $F_i < 1 \/ 2$ at every level $i gt.eq 2$.
  Let $cal(E)_i$ be the event that all these requirements hold, and let $P_i =
    P_i^0 \( thin dot.op divides cal(E)_i \)$. For $i = 1$, take $cal(E)_1$ to be the whole sample space and
    $P_1 = P_1^0$. In all cases $P_i^0 \( cal(E)_i \) gt.eq 1 \/ 2$, so (5.9) yields
  #[#set math.equation(numbering: n => "(5.11)")
   $ P_i { U_(r_j) = v_j upright(" for all ") j } lt.eq 2 zeta_i^(d') . $ <eq:word-filtered-sublist>]
  The factor two is paid once for the whole conditioning event.
    No uniform marginal or independence between groups is asserted for $P_i$.
    The relations hold on its support, as does Property ((5.5)) for each individual list.
  #emph[Selecting the finite family.] Put $M_i = L_(i + 1)$ and sample $M_i$ independent complete lists with law
    $P_i$. For each offset $0 lt.eq t lt.eq N_i - D_i^(*)$, let $Q_(i \, t)$ be the law under $P_i$ of the
    length-$D_i^(*)$ window at $t$. It satisfies (5.5) by (5.11).
    The empirical window law of the $M_i$ samples is an average of independent point-mass probability vectors on
    an alphabet of size $L_i^(D_i^(*))$. A second application of 12 and Markov’s inequality,
    now with a union over at most $N_i$ offsets, bounds the probability of violating any required window
    approximation by
  #[#set math.equation(numbering: n => "(5.12)")
   $ E_i := theta.alt^(- 1) N_i sqrt(L_i^(D_i^(*)) / L_(i + 1)) . $ <eq:word-window-budget>]
  We will have $E_i < 1 \/ 4$ at every level.
  It remains to impose the distances, including comparisons in which some of the sampled-word indices coincide.
    First use the reference law in which the $N_i$ labels in each distinct indexed list are independent and
    uniform. Consider one pairwise comparison between distinct indices,
    or one comparison of a target list with a shifted window from two source lists.
    In the latter case write $t$ for its offset, with $1 lt.eq t < N_i$; any of the three indices may coincide.
  For a specified set of matching positions, form a multigraph whose vertices are variables (sample index,
    position) and whose edges are the asserted equalities. Every target position occurs once.
    The source positions also occur once: they use $t \, dots.h \, N_i - 1$ in the first source and $0 \,
    dots.h \, t - 1$ in the second, disjoint ranges even if the source indices agree.
    The degree is therefore at most two, counting repeated edges. There is no loop.
    In a pairwise comparison the indices are distinct, and in a shifted comparison the source position differs
    from the target position by $t$ modulo $N_i$.
  A connected component with $v$ vertices requires $v - 1$ independent equalities and has probability
    $L_i^(- \( v - 1 \))$ under the reference law. A path has one fewer edge than vertices;
    a cycle has equally many, with at least two edges. Thus every component imposes at least half as many
    independent equalities as edges, including a pair of parallel edges.
    If $e$ positions are specified to match, their probability is at most $L_i^(- e \/ 2)$.
    Failure of a distance requirement entails at least $ceil.l epsilon_i N_i ceil.r$ matching positions.
    Summing over their possible sets, of which there are at most $2^(N_i)$, gives the bound
  #[#set math.equation(numbering: n => "(5.13)")
   $ 2^(N_i) L_i^(- epsilon_i N_i \/ 2) . $ <eq:word-reference-distance>]
  By (5.8), a complete list under $P_i^0$ has likelihood ratio at most $2^(2 K_i N_i)$ relative to the reference
    law, and under $P_i$ at most $2 thin 2^(2 K_i N_i)$. Each comparison uses at most three distinct sampled
    lists, so its probability under the actual sampling law is at most $\( 2 thin 2^(2 K_i N_i) \)^3$ times
    (5.13). Repeated indices do not introduce an additional independent list.
    There are fewer than $4 N_i M_i^3$ pairwise and shifted comparisons in total.
    Their union failure probability is consequently at most
  #[#set math.equation(numbering: n => "(5.14)")
   $ T_i := 32 N_i L_(i + 1)^3 thin 2^(\( 6 K_i + 1 \) N_i) L_i^(- epsilon_i N_i \/ 2) . $ <eq:word-distance-budget>]
  We will verify $T_i < 1 \/ 4$.
  These estimates address separate requirements: the first sampling law enforces the relations,
    conditioning enforces the approximation in each individual word,
    and the final independent samples provide the window laws and distances.
    We now check that the fixed initial size makes all three probability bounds hold at every step.
  #emph[Uniform bounds from one initial choice.] For $K gt.eq 256$, set
  $ B_0 \( K \) = 14 + K + 1 / 2 thin 2^(K \/ 8) \( K + 1 \)^2 . $
  The elementary inequalities $14 + K lt.eq 2^(K \/ 8)$ and $\( K + 1 \)^2 lt.eq
    2^(K \/ 8)$ hold at $256$ and persist thereafter, as the ratios of their left sides to their right sides
    decrease. Hence
  #[#set math.equation(numbering: n => "(5.15)")
   $ B_0 \( K \) lt.eq 2^(K \/ 4) lt.eq 1 / 8 thin 2^(K \/ 3) . $ <eq:word-common-bound>]
  We also have $log \( theta.alt^(- 1) \) < 14$ and $K_i^2 lt.eq ell_i < \( K_i + 1 \)^2$.
    For the first probability bound, put $K = K_(i - 1)$ and use $log \( N_i \/ H_i \) gt.eq K_i \/ 2$ to obtain
  $ log F_i lt.eq B_0 \( K \) - K_i / 4 lt.eq - 1 / 8 thin 2^(K \/ 3) . $
  For the second, put $K = K_i$. Since $ell_(i + 1) gt.eq 2^K$,
  $ log E_i lt.eq B_0 \( K \) - ell_(i + 1) / 2 lt.eq 2^(K \/ 4) - 2^K / 2 lt.eq - 2^K / 4 . $
  Finally (5.6) and $epsilon_i ell_i gt.eq epsilon_i K_i^2 gt.eq 32 K_i$ give
  $ log T_i & lt.eq 5 + K_i + N_i (6 K_i + 1 - 47 / 100 epsilon_i ell_i)\
 & lt.eq 5 + K_i - 9 K_i 2^(K_i) lt.eq - K_i 2^(K_i) . $
  It follows that
  #[#set math.equation(numbering: n => "(5.16)")
   $ F_i lt.eq 2^(- 2^(K_(i - 1) \/ 3) \/ 8) < 1 / 2 quad \( i gt.eq 2 \) \, wide E_i lt.eq
     2^(- 2^(K_i) \/ 4) < 1 / 4 \, wide T_i lt.eq 2^(- K_i 2^(K_i)) < 1 / 4 . $ <eq:word-uniform-budgets>]
  All right sides are decreasing functions of their $K$ argument.
    They apply simultaneously at every level by (5.7); no later adjustment of $s_1$ is made.
  The conditioning event thus has positive probability. Under the conditioned law the two subsequent failures have
    total probability less than $1 \/ 2$, so a tuple satisfying every requirement exists.
    Its pairwise distance requirement is imposed on distinct sample indices and has a positive lower bound.
    Equal sampled words would have distance zero, so the tuple has exactly $L_(i + 1)$ distinct members.
    Flatten their constituent lists to form $cal(W)_(i + 1)$.
    The empirical distribution is now exactly the uniform distribution on this set,
    without deduplication or a change of weights. It therefore has all four asserted properties.
    Choose its bijection with $cal(A)_(i + 1)$ and continue the induction. ◻
]

=== 5.2 Recognition at every symbol offset <recognition-at-every-symbol-offset>

The distances in 11 concern constituent labels. The next consequence converts them into distances in the fixed
  alphabet $cal(A)$, including shifts that do not respect any lower-level boundary.
  In coding terminology the two conclusions below are a positive minimum distance and a positive #emph[comma-free
  index]: the latter measures distance from every nontrivial splice of two legal words.
  This is the synchronization notion described in #cite(label("Tonchev2003")) §1;
  the recursive lower bound here is proved directly.

#thm([Lemma 5.3.])[
  (Recognition of words and alignment).  #emph[For the families in 11, put
$ d_i = product_(j = 1)^(i - 1) \( 1 - epsilon_j \) \, wide d_(*) = product_(j = 1)^oo \( 1 - epsilon_j \) > 0 . $

 Distinct $v \, w in cal(W)_i$ satisfy
$ d_(upright(H)) \( v \, w \) gt.eq d_i m_i gt.eq d_(*) m_i . $

 For all $v \, w \, z in cal(W)_i$ and every $1 lt.eq t < m_i$,
$ d_(upright(H)) #scale(x: 120%, y: 120%)[\(] \( v w \) \[ t \, t + m_i \) \, z #scale(x: 120%, y: 120%)[\)] gt.eq
  d_i m_i gt.eq d_(*) m_i . $

 These distances count symbols in $cal(A)$, and repeated source words are allowed.]
] <lem:recognition>

#proof[
  The finite products are bounded below by $1 - sum_(j gt.eq 1) epsilon_j = 3 \/ 4$, proving that $d_(*) > 0$.
    At level one, distinct one-symbol words have distance one and the offset assertion is vacuous.
  Suppose both assertions hold at level $i$. Distinct level-$\( i + 1 \)$ words differ in at least
    $\( 1 - epsilon_i \) N_i$ constituent labels by 11, Property (Proposition 5.1).
    Each unequal constituent pair contributes at least $d_i m_i$ symbol mismatches,
    giving the bound $d_(i + 1) m_(i + 1)$.
  Now consider a nonzero offset $t < m_(i + 1)$ in two concatenated level-$\( i + 1 \)$ words,
    compared with a third such word. If $m_i$ divides $t$, the offset $t \/ m_i$ lies between $1$ and $N_i - 1$.
    The constituent-label offset requirement gives at least $\( 1 - epsilon_i \) N_i$ unequal pairs,
    and the preceding distinct-word bound again gives $d_(i + 1) m_(i + 1)$ symbol mismatches.
    If $m_i$ does not divide $t$, each of the $N_i$ aligned target constituents faces a length-$m_i$ source window
    with the same nonzero offset modulo $m_i$. That source window crosses exactly two consecutive legal level-$i$
    words. The inductive offset assertion therefore gives at least $d_i
    m_i$ mismatches on each target constituent. It applies also when the two source constituents lie on opposite
    sides of the join of the two larger source words. Adding over the disjoint target constituents gives $d_i
    m_(i + 1) gt.eq d_(i + 1) m_(i + 1)$, completing the induction. ◻
]

=== 5.3 The number and size of the available scales <the-number-and-size-of-the-available-scales>

The word construction must retain enough label information across levels to compete with the summable
  smooth-switching costs. The following estimates are the quantitative input for that comparison.

#thm([Lemma 5.4.])[
  (Word rates).  #emph[Let $R_i = ell_i \/ m_i$. Every $m_i$ is a power of two, with
$ log m_i = sum_(j < i) K_j . $

 The rates satisfy
#[#set math.equation(numbering: n => "(5.17)")
 $ R_(i + 1) lt.eq epsilon_i / 100 R_i \, wide R_i arrow.r 0 . $ <eq:word-rate-decay>]

 They also have the lower bound
#[#set math.equation(numbering: n => "(5.18)")
 $ R_i gt.eq R_1 thin 200^(- \( i - 1 \)) 2^(- \( i - 1 \) \( i + 4 \) \/ 2) gt.eq
   R_1 thin 2^(- \( i - 1 \) \( i + 20 \) \/ 2) \, $ <eq:word-rate-lower>]

 and
#[#set math.equation(numbering: n => "(5.19)")
 $ sum_(i = 1)^oo K_i R_i^16 = oo . $ <eq:word-rate-divergence>]

]
] <lem:rates>

#proof[
  The formula for $m_i$ follows from $m_1 = 1$ and $N_i = 2^(K_i)$. Dividing (5.6) by $m_(i + 1) = N_i m_i$ gives
  $ epsilon_i / 200 R_i lt.eq R_(i + 1) lt.eq epsilon_i / 100 R_i . $
  Since $epsilon_i lt.eq 1 \/ 8$, the upper bound implies $R_i lt.eq 800^(- \( i - 1 \)) R_1 arrow.r 0$,
    proving (5.17). Iterating the lower bound and using $sum_(j < i) \( j + 2 \) = \( i - 1 \) \( i + 4 \) \/
    2$ prove the first inequality in (5.18); the second uses $log 200 < 8$.
    Also (5.7) implies $K_i gt.eq K_1^(2^(i - 1))$. Hence
  $ log \( K_i R_i^16 \) gt.eq 2^(i - 1) log K_1 + 16 log R_1 - 8 \( i - 1 \) \( i + 20 \) arrow.r oo . $
  In particular the terms in (5.19) do not tend to zero, and the series diverges. ◻
]

The families are now fixed. Their per-word approximation transfers short-window entropy to any invariant measure
  on the resulting sequence space, while 13 recovers block labels and phases from small symbol errors.
  We next construct that space and prove the required measure-theoretic statements.

== 6 An invariant process and its window laws <sec:process>

We now turn the finite word families of 11 into one ergodic system.
  The probability on that system need not assign uniform frequencies to the different words.
  The per-word frequency condition in the construction is what will make the window estimates valid for every
  invariant probability.

=== 6.1 The compact phase extension <the-compact-phase-extension>

Let $cal(A) = cal(W)_1$, regarded as an alphabet, and let

$ Omega = cal(A)^(bb(Z)) times product_(i gt.eq 1) bb(Z) \/ m_i bb(Z) $

with its compact product topology. Write a point as $\( omega \, a \)$,
  where $omega = \( omega_t \)_(t in bb(Z))$ and $a = \( a_i \)_(i gt.eq 1)$.
  Define $X subset Omega$ by the following conditions:

+ $a_(i + 1) equiv a_i med \( mod med m_i \)$ for every $i$;
+ whenever $t equiv - a_i med \( mod med m_i \)$, the word $\( omega_t \, dots.h \, omega_(t + m_i - 1) \)$
  belongs to $cal(W)_i$.

The coordinate $a_i in { 0 \, dots.h \, m_i - 1 }$ records the index of the origin in its level-$i$ word. Let

$ T \( omega \, a \) = \( omega' \, a' \) \, wide omega'_t = omega_(t + 1) \, quad a'_i = a_i +
  1 med \( mod med m_i \) . $

The defining conditions are closed, and $T$ is a homeomorphism of $X$.
  For each $j$, repeat a word of $cal(W)_j$ bi-infinitely with its level-$j$ boundary at zero.
  Since higher-level words are concatenations of lower-level ones,
  this sequence with zero phases satisfies all conditions through level $j$.
  The finite-level closed sets are nested and nonempty. Compactness proves that $X$ is nonempty.

The invariant-measure facts used here are the standard compact-system ones;
  see #cite(label("DajaniDirksin2008")) Theorems 6.1.4–6.1.6.
  We give the construction together with the checks specific to the phase extension.

#thm([Proposition 6.1.])[
  #emph[There is a $T$-invariant ergodic Borel probability $mu$ on $X$.
    Every $T$-invariant Borel probability on $X$ is nonatomic, is standard modulo null sets,
    and has zero Kolmogorov–Sinai entropy.]
] <prop:system>

#proof[
  For any $x in X$, weak limits of $n^(- 1) sum_(j = 0)^(n - 1) delta_(T^j x)$ are invariant probabilities.
    Indeed, the difference between the integrals of $f compose
    T$ and $f$ against these averages tends to zero for each continuous $f$.
    The set $cal(M)_T \( X \)$ of invariant probabilities is nonempty, compact, and convex.
  Here is an explicit way to select an extreme point. Choose a countable uniformly dense family $\( f_j \)$ in the
    continuous real functions on $X$. Starting from $cal(M)_T \( X \)$,
    successively restrict to the compact face on which $integral f_j thin d mu$ is maximal.
    The nested intersection is nonempty and contains only one measure,
    because the integrals of every $f_j$ are then fixed and determine a probability.
    An intersection of faces is a face, so this measure is extreme.
    If it had a $T$-invariant measurable set of mass strictly between zero and one,
    normalized restriction to that set and its complement would express it as a nontrivial convex combination of
    invariant probabilities. Thus it is ergodic. The same argument applies to invariant sets modulo null sets
    after taking Borel representatives.
  For any invariant probability, $a_i$ is uniform on $bb(Z) \/ m_i bb(Z)$,
    because $T$ cyclically permutes its level sets. If a measurable atom had mass $c > 0$,
    then for each $i$ it would be contained, modulo null sets, in one of these level sets.
    Hence $c lt.eq 1 \/ m_i$ for every $i$, which is impossible since $m_i arrow.r oo$.
  The space $X$ is a compact metrizable subspace of a countable product of finite discrete sets.
    For completeness, its nonatomic probability is standard in the precise sense needed here.
    Encode the finite coordinates into successive disjoint blocks of ternary digits $0 \, 2$;
    this gives a continuous injective map of $X$ into a compact subset of $\[ 0 \, 1 \]$.
    Let $lambda$ be the image law and $F \( t \) = lambda \( \[ 0 \, t \] \)$ its continuous distribution
    function. Define the measurable quantile
  $ Q \( u \) = inf { t : F \( t \) gt.eq u } \, wide 0 < u < 1 . $
  Continuity gives $F \( Q \( u \) \) = u$, and ${ u : Q \( u \) lt.eq t }$ has Lebesgue measure $F \( t \)$,
    so $Q_(*) "Leb" = lambda$ and $F_(*) lambda = "Leb"$. Moreover $Q \( F \( x \) \) lt.eq
    x$ for $lambda$-almost every $x$; both sides have law $lambda$.
    Their nonnegative difference has zero integral, and therefore $Q \( F \( x \) \) = x$ almost surely.
    After restricting to measurable conull sets, $F$ and $Q$ are inverse isomorphisms.
    Composing with the coordinate embedding establishes the assertion.
    Passing to completed sigma fields does not change it.
  It remains to check the entropy of the entire phase extension.
    A partition depending on finitely many coordinates is refined by one that records $omega_(- r) \, dots.h \,
    omega_r$ and $a_I$ for some fixed $r \, I$. Compatibility determines all the lower phases from $a_I$,
    and the phase evolves deterministically. Fix any $j gt.eq I$.
    The initial phase $a_j$ determines $a_I$ and the boundaries of all level-$j$ words.
    The symbol interval $\[ - r \, n - 1 + r \]$ used in an $n$-step name meets at most $ceil.l \( n + 2 r \) \/
    m_j ceil.r + 1$ such words, each in $cal(W)_j$. Consequently the number of names is at most
  $ m_j L_j^(ceil.l \( n + 2 r \) \/ m_j ceil.r + 1) . $
  Keeping $j$ fixed and sending $n arrow.r oo$ bounds the entropy rate by $R_j = \( log L_j \) \/ m_j$.
    By 14, $R_j arrow.r 0$. Only now let $j arrow.r oo$: every finite-coordinate partition has entropy rate zero.
    This count uses no assumption about word frequencies.
  Let $cal(P)$ be any finite measurable partition with $A$ atoms.
    Cylinder sets generate the Borel sigma field, and their algebra is dense in measure.
    Thus the atom label of $cal(P)$ can be approximated by an $A$-valued finite-coordinate label $cal(Q)$ with
    mismatch probability $s$ arbitrarily small. Completion of the measure only adds null-set changes.
    The chain rule and conditioning give
  $ H \( cal(P)^n \) lt.eq H \( cal(Q)^n \) + sum_(t = 0)^(n - 1) H \( T^(- t) cal(P) divides T^(- t) cal(Q) \) =
    H \( cal(Q)^n \) + n H \( cal(P) divides cal(Q) \) \, $
  where $cal(P)^n = or.big_(t = 0)^(n - 1) T^(- t) cal(P)$. Recording first whether the two labels differ shows that
  $ H \( cal(P) divides cal(Q) \) lt.eq H_(upright("bin")) \( s \) + s log A . $
  Entropy rates exist by subadditivity. Divide by $n$, take the limit, and then let $s arrow.b 0$.
    This proves $h_mu \( T \) = 0$. ◻
]

Fix henceforth an ergodic probability supplied by 15. The next estimates use only invariance,
  so their validity is unaffected by this choice.

=== 6.2 What alignment does to the sampling law <what-alignment-does-to-the-sampling-law>

For $x = \( omega \, a \) in X$, let $V_i \( x \) in cal(W)_i$ be the word containing the origin,
  namely the symbol string beginning at $- a_i \( x \)$. Set

$ A_i = { x : a_i \( x \) = 0 } \, wide mu_i = m_i thin mu \|_(A_i) . $

The law $mu_i$ is a probability. It describes a point observed at a level-$i$ boundary;
  it is not asserted to give uniform word frequencies.

For an integer $t$, let

$ r_i \( x \, t \) = \( - a_i \( T^t x \) \) med mod med m_i in { 0 \, dots.h \, m_i - 1 } . $

The first level-$i$ boundary at or after $t$ is $t + r_i \( x \, t \)$. For an integer $D gt.eq 2$, define the vector

#[#set math.equation(numbering: n => "(6.1)")
 $ cal(L)_(i \, D) \( x \, t \) = #scale(x: 120%, y: 120%)[\(] V_i \( T^(thin t + r_i \( x \, t \) + j m_i) x \)
   #scale(x: 120%, y: 120%)[\)]_(j = 0)^(D - 2) . $ <eq:aligned-list>]

All its words lie in $\[ t \, t + D m_i \)$, since $r_i + \( D - 1 \) m_i lt.eq D m_i$.

#thm([Lemma 6.2.])[
  #emph[The law of (6.1) under $mu$ is the law under $mu_i$ of the first $D -
    1$ level-$i$ words beginning at zero. Under $mu_i$, the index $J = a_(i + 2) \/ m_i$ is uniform on ${ 0 \,
    dots.h \, N_i N_(i + 1) - 1 }$ and is independent of $V_(i + 2)$.
    More precisely, for each such $j$ and $v in cal(W)_(i + 2)$,
#[#set math.equation(numbering: n => "(6.2)")
 $ mu_i \( J = j \, V_(i + 2) = v \) = frac(mu_(i + 2) \( V_(i + 2) = v \), N_i N_(i + 1)) . $ <eq:parent-slot-law>]

]
] <lem:aligned-law>

#proof[
  Invariance first allows us to take $t = 0$. On the phase class $a_i = r$,
    the map $T^(\( - r \) med mod med m_i)$ sends the normalized restriction of $mu$ bijectively and
    measure-preservingly onto $mu_i$. The first assertion follows by applying this separately on all $m_i$ phase
    classes.
  For the second assertion, $T^(j m_i)$ maps ${ a_(i + 2) = 0 \, V_(i + 2) = v }$ onto ${ a_(i + 2) = j m_i \,
    V_(i + 2) = v }$. It does not change the containing parent word because $0 lt.eq j m_i < m_(i + 2)$.
    These sets have the same $mu$-mass. Multiply by $m_i$, and use $m_(i + 2) \/ m_i = N_i N_(i + 1)$,
    to obtain (6.2). ◻
]

The identity is the reason that a deterministic condition on every parent word suffices.
  At a fixed internal offset in a parent, the slot being sampled is uniform even when the parent itself is not
  uniformly distributed.

=== 6.3 Entropy of short label lists <entropy-of-short-label-lists>

We use two elementary entropy bounds. The second is the standard maximal-coupling and mismatch-flag entropy
  argument; compare #cite(label("Sason2013")) Theorems 1–3. We include the weaker form needed here.
  If a law on a finite set has every atom at most $M$, its entropy is at least $log \( 1 \/ M \)$.
  If two laws $P \, Q$ on an $A$-point set have $"TV" \( P \, Q \) lt.eq s$, then

#[#set math.equation(numbering: n => "(6.3)")
 $ H \( P \) gt.eq H \( Q \) - 1 - s log A . $ <eq:tv-entropy>]

Indeed, couple their labels with mismatch probability at most $s$.
  The mismatch flag and the chain rule bound either conditional entropy by $1 + s log A$.
  We use this simple bound rather than an optimized continuity estimate.

#thm([Proposition 6.3.])[
  #emph[For all sufficiently large $i$, for every power of two $2 lt.eq D lt.eq D_i^(*)$, and every integer $t$,
#[#set math.equation(numbering: n => "(6.4)")
 $ H_mu \( cal(L)_(i \, D) \( thin dot.op thin \, t \) \) gt.eq .996 \( D - 1 \) ell_i \, wide ell_i =
   log L_i . $ <eq:window-entropy>]

 The large-$i$ threshold is independent of $D \, t$ and of the invariant probability on $X$.]
] <prop:window-entropy>

#proof[
  Write $q = D - 1$. By 16 we work under $mu_i$. Decompose its uniform parent-slot index as
  $ J = h N_i + u \, wide 0 lt.eq h < N_(i + 1) \, quad 0 lt.eq u < N_i . $
  Conditional on the parent $v = V_(i + 2)$ and the internal offset $u$,
    the slot $h$ is uniform among the $N_(i + 1)$ constituent $cal(W)_(i + 1)$ words of $v$.
    Call $u$ admissible if $u + D_i^(*) lt.eq N_i$. Its failure probability is
  $ beta_i = frac(D_i^(*) - 1, N_i) lt.eq D_i^(*) / N_i . $
  For every fixed $v$ and admissible $u$, 11, Property ((5.5)), applied at level $i + 1$,
    puts the law of the $D_i^(*)$ labels at this offset within $10^(- 4)$ of their law in a uniform word of
    $cal(W)_(i + 1)$. 11, Property (Proposition 5.1), applied at level $i$,
    puts that law within a further $10^(- 4)$ of a law whose every specified $q$-coordinate atom is at most
  $ M_i = 2 (2^(2 K_i) / L_i)^q . $
  Restriction to the first $q$ entries cannot increase total variation.
    The comparison law may depend on $u$, but this atom bound does not.
  It follows from (6.3), with $s = 2 dot.op 10^(- 4)$ and alphabet size $L_i^q$,
    that the actual $q$-list conditional on $v \, u$ has entropy at least
  $ q ell_i - 2 K_i q - 1 - \( 1 + s q ell_i \) = q #scale(x: 120%, y: 120%)[\(] \( 1 - s \) ell_i -
    2 K_i #scale(x: 120%, y: 120%)[\)] - 2 . $
  Entropy is concave. Mixing over all $v$ and admissible $u$ preserves this lower bound;
    adding the remaining offsets loses at most their fraction, since entropy is nonnegative. Thus
  #[#set math.equation(numbering: n => "(6.5)")
   $ H \( cal(L)_(i \, D) \) gt.eq \( 1 - beta_i \) {q #scale(x: 120%, y: 120%)[\(] \( 1 - s \) ell_i -
     2 K_i #scale(x: 120%, y: 120%)[\)] - 2} . $ <eq:window-entropy-explicit>]
  Here $beta_i arrow.r 0$, $2 K_i \/ ell_i arrow.r 0$, and $2 \/ ell_i arrow.r 0$.
    Once each of these three quantities is at most $.0005$, division by $q ell_i$, with $q gt.eq 1$,
    gives a coefficient at least
  $ \( 1 - .0005 \) \( 1 - .0002 - .0005 - .0005 \) > .996 . $
  This proves the uniform assertion. ◻
]

Only the two indicated levels of the construction enter this argument.
  There is no accumulation of total variation errors over all ancestors,
  and no independence assumption on the sequence of adjacent words.

=== 6.4 The graph relation across two windows <the-graph-relation-across-two-windows>

Two level-$i$ labels $u \, v in cal(W)_i$ pass the graph test when $\[ u \, v \]_i = 0$,
  using their fixed vector identification. The same alignment law gives a quantitative bound on the one exception
  to the graph test: crossing a group boundary.

#thm([Lemma 6.4.])[
  #emph[Let $2 lt.eq D lt.eq D_i^(*)$ be a power of two and set $n = m_i D$.
    For all sufficiently large $i$, with $mu$-probability at least
$ 1 - alpha_(i \, D) \, wide alpha_(i \, D) = frac(2 D - 2, H_i) \, $

 all corresponding entries of $cal(L)_(i \, D) \( x \, - n \)$ and $cal(L)_(i \, D) \( x \, 0 \)$ pass the
   level-$i$ graph test simultaneously. In particular $sup_(D lt.eq D_i^(*)) alpha_(i \, D) arrow.r 0$.]
] <lem:graph-windows>

#proof[
  Because $n$ is a multiple of $m_i$, the advance to alignment is the same in the two windows. Denote it by $q_0$.
    The entry starts are
  #[#set math.equation(numbering: n => "(6.6)")
   $ - n + q_0 + j m_i quad upright("and") quad q_0 + j m_i \, wide 0 lt.eq j lt.eq D - 2 . $ <eq:two-list-starts>]
  Corresponding entries are separated by exactly $D$ level-$i$ positions.
    The first start through the last start span $2 D - 1$ such positions,
    including the unused intervening position. 3 illustrates these positions and their common lag when $D = 4$.
  By 16, the first boundary has the boundary-start law. Its position modulo $H_i$ is uniform:
    its position in a $cal(W)_(i + 1)$ parent is uniform modulo $N_i$, and $H_i$ divides $N_i$.
    Once $2 D - 1 lt.eq H_i$, exactly $2 D - 2$ residues have a span that crosses an $H_i$-group boundary.
    All parent boundaries are already group boundaries. On every other residue all the labels in (6.6) belong to
    one of the prescribed groups. 11, Property (Proposition 5.1),
    applies because $D$ is an allowed power-of-two lag. Finally $2 D_i^(*) \/ H_i arrow.r 0$ by the definitions. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (0.92, 0.55), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((0.92, 0), (1.84, 0.55), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((1.84, 0), (2.76, 0.55), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((2.76, 0), (3.68, 0.55), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((3.68, 0), (4.6, 0.55), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((4.6, 0), (5.52, 0.55), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((5.52, 0), (6.44, 0.55), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.46, 0.275), [$U_0$])
  content((4.14, 0.275), [$V_0$])
  bezier((0.46, 0.65), (4.14, 0.65), (1.791, 1.188), (2.809, 1.188), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.38, 0.275), [$U_1$])
  content((5.06, 0.275), [$V_1$])
  bezier((1.38, 0.65), (5.06, 0.65), (2.711, 1.188), (3.729, 1.188), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.3, 0.275), [$U_2$])
  content((5.98, 0.275), [$V_2$])
  bezier((2.3, 0.65), (5.98, 0.65), (3.631, 1.188), (4.649, 1.188), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.22, 0.275), [$-$])
  line((0, -0.12), (2.76, -0.12), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.38, -0.3317), [past list], anchor: "north", padding: 0.1176cm)
  line((3.68, -0.12), (6.44, -0.12), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.06, -0.3317), [future list], anchor: "north", padding: 0.1176cm)
  content((3.22, 1.55), [each arrow has lag $D=4$])
})],
  caption: [Figure 3: The two aligned lists of one legal symbolic point when $D = 4$, writing $U_j \, V_j$ for their corresponding past and future entries. Each has $D - 1$ entries. The single unused block between them does not alter the lag between corresponding entries. Their span has $2 D - 1$ block positions, which explains the group-boundary error in 18. ],
) <fig:lists>

We now have a fixed ergodic system with zero entropy, uniformly large list entropy,
  and a graph relation across adjacent windows. These properties are compatible:
  the information per symbol in a level-$i$ list is of order $R_i$, which tends to zero.
  The many available test scales will compensate for this decreasing rate.
  The remaining task is to compare that relation with the conditional independence in a smooth switch.

== 7 The obstruction to a smooth volume model <sec:obstruction>

Fix the ergodic system constructed in 6. The final argument concerns a single statistic of a pair of points:
  the fraction of corresponding past and future labels that pass the graph test.
  We define that statistic before restricting the pair experiment.
  Its upper and lower bounds will therefore refer to the same probability law.

=== The quantitative interface <the-quantitative-interface>

The smooth and symbolic constructions meet through the quantities in 1.
  At $n = 2^k$, write $cal(D)_k$ for the smooth partition, $rho$ for its cell-weighted pair law,
  $G$ for the retained pairs, and $z$ for the switch. The exceptional-mass tolerance $eta >
  0$ is fixed before these objects are chosen. On the symbolic side, $L_i = \# cal(W)_i$,
  $R_i = \( log L_i \) \/ m_i$, and $K_i = floor.l sqrt(log L_i) floor.r$. Every $m_i$ is a power of two.
  The symbolic tests have length $n = m_i D$, where $D$ is a power of two and $2^(ceil.l K_i \/ 16 ceil.r) lt.eq
  D lt.eq 2^(floor.l K_i \/ 8 floor.r)$. In a window of $D m_i$ symbols we use the $D -
  1$ full words beginning at the first level-$i$ boundary. Each input initially uses its own alignment.
  The compact system recording the symbol sequence and all compatible alignment phases has zero entropy for every
  invariant probability, by 15.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Interface
], table.cell(rowspan: 1, colspan: 1)[Smooth conclusion
], table.cell(rowspan: 1, colspan: 1)[Symbolic use
]),
  table.cell(rowspan: 1, colspan: 1)[Dyadic cost
], table.cell(rowspan: 1, colspan: 1)[$sum_k B_k^16 < oo$ and $\# cal(D)_k lt.eq
  exp \( C B_k 2^k \)$ at every sufficiently large scale
], table.cell(rowspan: 1, colspan: 1)[$sum_i K_i R_i^16 =
  oo$ gives tests at which cell conditioning costs $o \( \( D - 1 \) log L_i \)$ bits.
],
  table.cell(rowspan: 1, colspan: 1)[Original pair law
], table.cell(rowspan: 1, colspan: 1)[Choose a cell with its volume weight,
  then two independent normalized volume points; retain mass at least $1 - eta$
], table.cell(rowspan: 1, colspan: 1)[Window entropy holds for the chosen invariant measure,
  with arbitrary parent-word weights. Independence is used only for the two inputs conditional on the cell and a
  fixed entry.
],
  table.cell(rowspan: 1, colspan: 1)[Shadowing
], table.cell(rowspan: 1, colspan: 1)[The switch follows one input for $0 lt.eq t lt.eq n$ and the other for $-
  n lt.eq t lt.eq 0$, with error tending uniformly to zero
], table.cell(rowspan: 1, colspan: 1)[Positive symbol-distance recognition recovers the common phase and most
  labels, preserving the original entry pairing.
],
  table.cell(rowspan: 1, colspan: 1)[Output measure
], table.cell(rowspan: 1, colspan: 1)[$z_(*) \( rho \|_G \) lt.eq 2 nu$, without normalizing the retained law
], table.cell(rowspan: 1, colspan: 1)[Compact symbol cores and the simultaneous graph-window law transfer to the
  switched point with controlled exceptional mass.
],
)
]],
  caption: [Table 1: The exact internal interface between 7 and the fixed symbolic system. All smooth constants are chosen only after a model is proposed. The final comparison retains the original pair law $rho$. ],
)

=== 7.1 Choosing times with a negligible partition cost <choosing-times-with-a-negligible-partition-cost>

#thm([Lemma 7.1.])[
  #emph[Let $\( B_k \)_(k gt.eq 1)$ be any positive sequence with $sum_k B_k^16 < oo$.
    There exist levels $i arrow.r oo$ and powers of two $D$ satisfying
$ 2^(ceil.l K_i \/ 16 ceil.r) lt.eq D lt.eq 2^(floor.l K_i \/ 8 floor.r) $

 such that, for $n = m_i D$,
#[#set math.equation(numbering: n => "(7.1)")
 $ B_(log n) / R_i arrow.r 0 \, wide R_i = ell_i / m_i . $ <eq:relative-cost>]

 In particular any partitions with $log \# cal(D)_k lt.eq C B_k 2^k$ obey
#[#set math.equation(numbering: n => "(7.2)")
 $ log \# cal(D)_(log n) = o \( \( D - 1 \) ell_i \) $ <eq:cheap-partition>]

 on this sequence, for every fixed $C$.]
] <lem:cheap-scales>

#proof[
  The lengths $m_i$ are powers of two. Put $b'_i = log m_i$, so $b'_(i + 1) = b'_i + K_i$. The integer sets
  $ J_i = { b'_i + j : ceil.l K_i \/ 16 ceil.r lt.eq j lt.eq floor.l K_i \/ 8 floor.r } $
  are disjoint and, for large $i$, contain at least $K_i \/ 32$ integers.
    If the ratios in (7.1) were bounded below by some $c > 0$ on all sufficiently late tests, then
  $ sum_k B_k^16 gt.eq c^16 sum_(i med upright("large")) \| J_i \| R_i^16 gt.eq c^16 /
    32 sum_(i med upright("large")) K_i R_i^16 = oo \, $
  contrary to the hypothesis and 14. Thus one can select successively later tests with ratio tending to zero.
    Since $B_(log n) n = \( B_(log n) \/ R_i \) D ell_i$ and $D \/ \( D - 1 \) lt.eq 2$, (7.2) follows. ◻
]

Suppose for a contradiction that a smooth volume model $\( M \, nu \, S \)$ exists.
  Its dimension is positive because a zero-dimensional compact manifold is finite and cannot carry a nonatomic
  probability. Apply 7 with $eta = .01$. The model is now fixed,
  so all its constants and its sequence $\( B_k \)$ are fixed. Use 19 for this sequence.
  In what follows, $i \, D \, n$ run through the selected tests and are taken sufficiently large for every stated
  eventual estimate.

We use the measurable isomorphism to regard every finite symbolic observation as a measurable observation on $M$.
  The original domain can be replaced by the intersection of all its integer translates,
  so all orbit identities hold on an invariant conull set. Extend the observations arbitrarily on its null
  complement. For each test let $C$ be the cell sampled in the switching experiment,
  and let $rho$ be the original law of $\( x \, y \)$. Its two marginals are exactly $nu$,
  and its conditional law given $C$ is the product of normalized volume on that cell.

=== 7.2 The independent upper bound <the-independent-upper-bound>

Let

$ U = cal(L)_(i \, D) \( y \, - n \) \, wide V = cal(L)_(i \, D) \( x \, 0 \) \, wide q = D - 1 . $

Each list uses its own input’s alignment advance. Both are defined on every pair before a switch is selected.
  Under the identification of $cal(W)_i$ with the nonzero vectors of $bb(F)_2^(2 s_i)$,
  write $\[ thin dot.op thin \, thin dot.op thin \]_i$ for the alternating form from the word construction, and set

#[#set math.equation(numbering: n => "(7.3)")
 $ Z \( x \, y \) = 1 / q sum_(j = 0)^(q - 1) upright(bold(1))_({ \[ U_j \, V_j \]_i = 0 }) . $ <eq:passing-statistic>]

For each fixed cell and each fixed $j$, the laws of $U_j$ and $V_j$ are independent.

Apart from the diagonal pairs, the orthogonality relation gives the classical binary symplectic graph;
  see #cite(label("Seidel1973")) Definition 3.3 and Theorem 3.4 for its finite-geometric description and spectral
  scale. We include the character calculation, keeping the diagonal pairs,
  and pass from average Shannon entropy to the required graph bound by a heavy–light split of each law.

#thm([Lemma 7.2.])[
  #emph[Let $L = 2^(2 s) - 1$ and equip the nonzero vectors of $bb(F)_2^(2 s)$ with a nondegenerate alternating
    form. Suppose a family of pairs of laws $\( p_xi \, q_xi \)$ on these vectors is indexed by a probability space, and
$ bb(E)_xi H \( p_xi \) gt.eq .99 log L \, wide bb(E)_xi H \( q_xi \) gt.eq .99 log L . $

 For all sufficiently large $L$, independent samples from the two laws, followed by averaging over $xi$,
   pass the test $\[ u \, v \] = 0$ with probability at most $.62$.]
] <lem:graph-independent>

#proof[
  For a law $p$, put $A_p = { u : p \( u \) > L^(- .8) }$ and $theta_p = p \( A_p \)$.
    The set $A_p$ has at most $L^.8$ elements. Splitting entropy according to this set gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ H \( p \) lt.eq 1 + .8 theta_p log L + \( 1 - theta_p \) log L =
     1 + \( 1 - .2 theta_p \) log L . $ <eq:heavy-entropy>]
  The same formula, with the usual zero-mass conventions, covers empty sets. The entropy hypotheses imply
  $ bb(E)_xi theta_(p_xi) \, med bb(E)_xi theta_(q_xi) lt.eq .05 + frac(5, log L) lt.eq .055 $
  once $log L gt.eq 1000$.
  Let $A$ be the matrix $A_(u v) = \( - 1 \)^(\[ u \, v \])$ on nonzero vectors.
    On the full vector space, the rows of the same matrix are orthogonal:
    for $u eq.not w$, nondegeneracy makes $v mapsto \[ u + w \, v \]$ a nonzero linear functional,
    so $sum_v \( - 1 \)^(\[ u + w \, v \]) = 0$. Every row has squared norm $L + 1$.
    The full operator norm is therefore $sqrt(L + 1)$, and restriction to the nonzero rows and columns has no
    larger norm.
  The light subprobability $p^(upright(l)) = p thin upright(bold(1))_(A_p^c)$ satisfies
  $ parallel p^(upright(l)) parallel_2^2 lt.eq L^(- .8) sum_u p^(upright(l)) \( u \) lt.eq L^(- .8) . $
  Hence
  $ lr(|sum_(u \, v) p^(upright(l)) \( u \) A_(u v) q^(upright(l)) \( v \)|) lt.eq sqrt(L + 1) thin L^(- .8) = :
    beta_L . $
  The passing mass of the light product is at most $\( 1 + beta_L \) \/ 2$.
    All pairs with at least one heavy coordinate have total mass at most $theta_p + theta_q$.
    After averaging, and taking $L$ large enough that $beta_L lt.eq .02$, the passing probability is at most
  $ .055 + .055 + frac(1 + .02, 2) = .62 . $
  The matrix includes its diagonal entries, so the automatic relations $\[ u \, u \] =
    0$ require no separate exclusion. ◻
]

By the two original marginals and 17,

$ H_rho \( U \) \, H_rho \( V \) gt.eq .996 q ell_i . $

Conditioning each vector on the sampled cell loses at most $H \( C \) lt.eq log \# cal(D)_(log n) =
  o \( q ell_i \)$. Conditional subadditivity consequently gives

#[#set math.equation(numbering: n => "(7.5)")
 $ 1 / q sum_(j = 0)^(q - 1) H \( U_j divides C \) gt.eq .99 ell_i \, wide 1 /
   q sum_(j = 0)^(q - 1) H \( V_j divides C \) gt.eq .99 ell_i $ <eq:entry-entropies>]

for late tests. Apply 20 with index $xi = \( C \, j \)$, assigning $j$ uniform weight independently of the cell.
  Independence is used conditional on this full index: equivalently, first fix $j$,
  use the product law conditional on $C$, and then average.
  No product assertion conditional only on $C$ after mixing over a shared random $j$ is needed. We obtain

#[#set math.equation(numbering: n => "(7.6)")
 $ bb(E)_rho Z lt.eq .62 . $ <eq:passing-upper>]

=== 7.3 From geometric shadowing to symbol agreement <from-geometric-shadowing-to-symbol-agreement>

Let $d_(*) > 0$ be the symbol-distance constant in 13. It is fixed by the word construction.
  Let $f : M arrow.r cal(A)$ be the transported symbol at time zero.
  We first choose compact cores for this one fixed finite partition, rather than for the growing level-$i$ label sets.

#thm([Lemma 7.3.])[
  #emph[For all sufficiently large dyadic times in the smooth switching estimate, the retained pairs for which
#[#set math.equation(numbering: n => "(7.7)")
 $ \# { 0 lt.eq t < n : f \( S^t z \) eq.not f \( S^t x \) } & < d_(*) n \/ 100 \,\
\# { - n lt.eq t < 0 : f \( S^t z \) eq.not f \( S^t y \) } & < d_(*) n \/ 100 $ <eq:future-symbol-match>]

 have original $rho$-mass at least $.96$.]
] <lem:symbol-matching>

#proof[
  Choose $kappa < d_(*) \/ 20000$. Inner regularity of the smooth probability gives disjoint compact sets $K_a
    subset f^(- 1) \( a \)$, for $a in cal(A)$, with
  $ nu (M \\ union.big_(a in cal(A)) K_a) < kappa . $
  Measurable atoms may first be replaced by Borel representatives modulo null sets.
    There are finitely many cores, and the distance between any two nonempty distinct cores is positive.
    If there is only one nonempty core, the following equal-symbol implication is automatic.
    Otherwise take the positive minimum of these distances. Uniform shadowing is smaller than this fixed
    separation at all large scales. Therefore two compared iterates both in the cores have the same symbol.
  Write $G$ for the retained set and $sigma = z_(*) \( rho \|_G \)$.
    The switching theorem gives $sigma lt.eq 2 nu$. For every integer $t$,
  $ \( S^t \)_(*) sigma lt.eq 2 \( S^t \)_(*) nu = 2 nu . $
  The $x$ and $y$ time marginals under the original law are $nu$.
    At each future comparison time, the $rho$-mass within $G$ where either $x$ or $z$ misses the cores is at most
    $kappa + 2 kappa = 3 kappa$. The same holds for the past comparison with $y$.
  The integrals over $G$ of the fractions of mismatches on either half are therefore at most $3 kappa$.
    Markov’s inequality at threshold $d_(*) \/ 100$, on each half,
    bounds their combined failure mass by $600 kappa \/ d_(*) < .03$.
    Since $rho \( G \) gt.eq .99$, the simultaneous success mass is at least $.96$.
    This is an estimate in the original law, without dividing by $rho \( G \)$.
  The input marginals and $sigma lt.eq 2 nu$ give zero mass to the complement of the invariant conjugacy domain.
    Thus the symbol strings and all orbit identities used in the argument are defined outside a $rho$-null set. ◻
]

=== 7.4 Recognition preserves the original entry pairing <recognition-preserves-the-original-entry-pairing>

Consider a pair in the success event of 21. If the phases of $z$ and $x$ modulo $m_i$ differed, take the $D -
  1$ full level-$i$ blocks of $x$ beginning at its first aligned boundary in $\[ 0 \, n \)$.
  At each such interval, the symbol string of $z$ is a window of length $m_i$ cut at a nonzero offset across two
  consecutive legal level-$i$ words. This remains true if those words are equal or if one extends beyond the
  observed window. By 13, each of the $D - 1$ disjoint intervals contributes at least $d_(*) m_i$ mismatches.
  Their total is at least

$ d_(*) \( D - 1 \) m_i gt.eq d_(*) n \/ 2 \, $

contradicting (7.7). The same reasoning in the past gives

#[#set math.equation(numbering: n => "(7.8)")
 $ a_i \( z \) = a_i \( x \) = a_i \( y \) . $ <eq:phase-recovery>]

Here $a_i \( S^(- n) u \) = a_i \( u \)$ for every $u$ in the conjugacy domain, since $n$ is a multiple of $m_i$.

Let $q_0$ be the common advance to alignment. The already defined entries $U_j \, V_j$ occupy,
  in the symbolic orbit of $z$, the positions

$ - n + q_0 + j m_i \, wide q_0 + j m_i \, wide 0 lt.eq j lt.eq D - 2 . $

Their difference is exactly $n = D m_i$. The index $j$ has not been changed after selecting the switch.
  When one of these entries differs in label from the corresponding word of $z$,
  distinct-word separation in 13 costs at least $d_(*) m_i$ mismatches.
  Consequently fewer than $D \/ 100$ entries on each side can differ.

Let $E_(i \, D) subset X$ be the group-boundary exception from 18,
  transported to $M$ and extended arbitrarily on its null complement.
  Its original measure is at most $alpha_(i \, D) lt.eq 2 D_i^(*) \/ H_i arrow.r 0$,
  uniformly over the chosen tests. The retained switch has

$ rho { \( x \, y \) in G : z \( x \, y \) in E_(i \, D) } lt.eq 2 alpha_(i \, D) . $

Take a late test for which $2 alpha_(i \, D) lt.eq .01$. On a subset of the original pair space of mass at least
  $.96 - .01$, the symbol-matching event holds and the two $z$-lists satisfy every graph relation.
  Removing the fewer than $D \/ 100$ wrong entries on each side gives

$ Z \( x \, y \) gt.eq 1 - frac(2 D, 100 \( D - 1 \)) gt.eq .96 . $

The statistic is nonnegative elsewhere, so

#[#set math.equation(numbering: n => "(7.9)")
 $ bb(E)_rho Z gt.eq \( .96 - .01 \) dot.op .96 = .912 . $ <eq:passing-lower>]

This contradicts (7.6).

#proof[
  #emph[Completion of the proof of 1.] 15 supplies a standard nonatomic ergodic invertible probability-preserving
    system of zero entropy. If it had a smooth volume model, 7 and 19 would supply the tests above.
    The original pair law at each late test would satisfy both (7.6) and (7.9), which is impossible.
    The dimension and all smooth constants were arbitrary but fixed after construction of the system.
    Thus no model in any finite dimension exists. ◻
]

#prodef([Remark 7.4.])[
  The role of smooth positive volume is quantitative. It gives a switch whose unnormalized output law is
    controlled by the original invariant measure. That control allows a measurable symbol observation to be
    compared along shadowing orbits, despite the absence of regularity in the conjugacy.
    The proof makes no analogous assertion for models carrying only a singular measure or a nonsmooth density
    equivalent to volume.
]

#bibliography("refs.bib", style: "ieee", title: [References])
