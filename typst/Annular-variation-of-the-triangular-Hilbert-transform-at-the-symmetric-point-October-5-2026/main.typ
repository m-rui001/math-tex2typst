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

#align(center)[#text(size: 16pt, weight: "bold")[Annular variation of the triangular Hilbert transform \
at the symmetric point]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

For complex functions $F \, G in L^3 \( bb(R)^2 \)$ and $0 < epsilon < R < oo$,
  define the annular triangular Hilbert transform by

#[#set math.equation(numbering: n => "(1.1)")
 $ B_(epsilon \, R) \( F \, G \) \( x \, y \) = integral_(epsilon < \| t \| < R) F \( x + t \, y \)
   G \( x \, y + t \) thin frac(thin upright(d) t, t) . $ <eq:bilinear-truncation>]

The two inputs are translated along different coordinate directions.
  Every finite integral is absolutely convergent outside one common null set;
  we use its usual representative there and set all quantities to zero on the exceptional set.
  Lemma 3 justifies this convention and continuity in the endpoints.

For $r > 2$, its annular variation is

#[#set math.equation(numbering: n => "(1.2)")
 $ V_r \( F \, G \) \( x \, y \) = sup_(J gt.eq 1 thin \, med 0 < t_0 < dots.h.c < t_J\
t_j in bb(Q)) (sum_(j = 1)^J \| B_(t_(j - 1) \, t_j) \( F \, G \) \( x \, y \) \|^r)^(1 \/ r) .
  $ <eq:variation-definition>]

The supremum is pointwise: the partition may depend on $\( x \, y \)$,
  and there is no restriction on the number of endpoints within a dyadic scale interval.
  The use of rational endpoints makes measurability immediate and, by endpoint continuity, does not change the supremum.

#thm([Theorem 1.1.])[
  (Full annular variation).  #emph[For every real $r > 2$ there is a finite constant $C_r$ such that
$ parallel V_r \( F \, G \) parallel_(L^(3 \/ 2) \( bb(R)^2 \)) lt.eq
  C_r parallel F parallel_(L^3 \( bb(R)^2 \)) parallel G parallel_(L^3 \( bb(R)^2 \)) $

 for all complex $F \, G in L^3 \( bb(R)^2 \)$.]
] <thm:variation>

Taking a single increment gives the maximal estimate with the supremum over both hard truncation endpoints.
  In Section 9 we prove that the joint principal value

$ B \( F \, G \) = lim_(epsilon arrow.b 0\
R arrow.t oo) B_(epsilon \, R) \( F \, G \) $

exists almost everywhere and in $L^(3 \/ 2)$. In fact, the supremum of $\| B_(epsilon \, R) \( F \, G \) -
  B \( F \, G \) \|$ over $0 < epsilon < 1 \/ m$, $R > m$, tends to zero in $L^(3 \/ 2)$.

Pairing the bilinear output with a third $L^3$ input gives a scalar form. Its symmetric, or simplex, coordinates are

#[#set math.equation(numbering: n => "(1.3)")
 $ Lambda_(epsilon \, R) \( G_0 \, G_1 \, G_2 \) = integral.triple_(epsilon < \| a + b + c \| < R)
   G_0 \( a \, b \) G_1 \( b \, c \) G_2 \( c \, a \)
   frac(thin upright(d) a thin upright(d) b thin upright(d) c, a + b + c) . $ <eq:intro-simplex>]

The three equal exponents $3$ form the symmetric point of the scalar Hölder relation $1 \/ p_0 + 1 \/ p_1 +
  1 \/ p_2 = 1$. We obtain a uniform bound by $C product_v parallel G_v
  parallel_3$ and the joint scalar principal value for every complex $L^3$ triple.
  Proposition 27 gives the norm-preserving coordinate maps and equality of the optimal constants for the flat and
  simplex scalar formulations. In particular, this proves the symmetric scalar estimate in Thiele’s Problem 13 in
  #cite(label("GrafakosEtAl2017")) Section 9.

=== 1.1 History and related work <history-and-related-work>

The flat operator occurs in Demeter and Thiele’s study of bilinear averages for two commuting transformations
  #cite(label("DemeterThiele2010")) Section 6. The scalar form (1.3) is a basic entangled singular integral:
  each input sees one pair of the three variables, and the pairs form a cycle.
  This dependence differs from the bipartite configurations in many multilinear estimates.
  Kovač, Thiele and Zorin-Kranich established estimates for a Walsh model with two general inputs and a third
  input of specified structure #cite(label("KovacThieleZorinKranich2015")) Theorem 1.7.
  Their paper also records the cyclic trace formulation and the equivalence of the flat and simplex forms.

Quantitative cancellation over a finite range of scales was developed in several stages.
  Tao proved sublogarithmic bounds for one-dimensional multilinear Hilbert transforms
  #cite(label("Tao2016Cancellation")), and Zorin-Kranich obtained sublogarithmic cancellation for simplex Hilbert
  transforms #cite(label("ZorinKranich2017")). Durcik, Kovač,
  Škreb and Thiele proved square-function and norm-variation estimates that yield square-root cancellation for the
  triangular form over finitely many smooth scales #cite(label("DurcikKovacSkrebThiele2019")) Corollary 5.
  Durcik, Kovač and Thiele obtained power-type cancellation for hard truncations
  #cite(label("DurcikKovacThiele2019")) Theorem 1. Permuting and interpolating their $\( 4 \, 4 \, 2 \)$ bounds
  gives a $sqrt(log \( R \/ epsilon \))$ bound at the symmetric tuple.
  These estimates retain a dependence on the scale range. Moreover,
  norm-variation estimates for a fixed list of scales do not place the supremum over output-dependent partitions
  inside the output norm as in (1.2).

Other results gain cancellation by averaging a direction parameter #cite(label("DurcikRoos2021"))
  #cite(label("LinSlavikova2026")) or by introducing curvature #cite(label("ChristDurcikRoos2021"))
  #cite(label("HsuLin2026")). Those mechanisms are distinct from the flat problem considered here.
  The broader role of variation in strengthening maximal estimates and controlling convergence is illustrated by
  Lépingle’s martingale inequality #cite(label("Lepingle1976")), the variational inequalities of Jones,
  Seeger and Wright #cite(label("JonesSeegerWright2008")), and the variation-norm Carleson theorem
  #cite(label("OberlinSeegerTaoThieleWright2012")). These results provide context rather than an input to our proof.

The energy method here is related to telescoping arguments for entangled forms:
  Kovač’s twisted paraproduct and Bellman-function framework #cite(label("Kovac2012Twisted"))
  #cite(label("Kovac2011")), and Durcik’s continuous Gaussian telescoping #cite(label("Durcik2015"))
  #cite(label("Durcik2017")). The obstruction presented by a triangular cycle is discussed in
  #cite(label("Kovac2011")) Section 6.2. We work with the finite matrix energy $"tr" \( P^(3 \/ 2) \)$ for $P
  gt.eq 0$, establish a mixed trace inequality, and compare its heat derivatives at neighboring vertices.
  All matrix and heat estimates required below are proved in this paper.

=== 1.2 The count estimate and the new ingredients <the-count-estimate-and-the-new-ingredients>

The proof reduces variation to a quantitative estimate for finitely many disjoint annuli.
  For an integer $n gt.eq 1$, define

#[#set math.equation(numbering: n => "(1.4)")
 $ cal(S)_n \( F \, G \) = sup {sum_(j = 1)^m \| B_(epsilon_j \, R_j) \( F \, G \) \| : 0 lt.eq m lt.eq n \, quad
   0 < epsilon_j < R_j \, quad epsilon_j \, R_j in bb(Q) \,\
\( epsilon_j \, R_j \) upright(" pairwise disjoint")} . $ <eq:count-definition>]

Intervals may share endpoints, and the empty sum is zero.
  As in the variation, the entire choice is made separately at every output point.

#thm([Theorem 1.2.])[
  (Disjoint-annulus count estimate).  #emph[There is an absolute constant $C$ such that,
    for every integer $n gt.eq 1$ and every complex $F \, G in L^3 \( bb(R)^2 \)$,
#[#set math.equation(numbering: n => "(1.5)")
 $ parallel cal(S)_n \( F \, G \) parallel_(3 \/ 2) lt.eq C sqrt(n) log \( 2 + n \) parallel F parallel_3 parallel
   G parallel_3 . $ <eq:count-bound>]

]
] <thm:count>

Theorem 1 follows by arranging the increments of each partition in decreasing order and grouping their ranks
  dyadically. The resulting series has terms bounded by $C \( 1 + j \) 2^(j \( 1 \/ r - 1 \/ 2 \)) parallel F
  parallel_3 parallel G parallel_3$. The substance of the paper is therefore (1.5).

For smooth annuli, we write the kernel as a scale integral of convolutions of three one-variable Gaussian
  derivative windows. Each convolution is an integral over window centers whose sum is zero;
  with the centers fixed, the three window factors depend separately on $a \, b \, c$.
  On a finite grid the resulting sums are cyclic matrix traces:
  the sampled pairwise inputs supply three matrices, and the window factors supply diagonal insertions.
  We localize the matrices with positive Gaussian weights. At each vertex we place the two incident weighted
  matrices side by side to form a row matrix $R$. The energy $"tr" \( \( R^(*) R \)^(3 \/ 2) \)$ has the same
  degree-three scaling as the trilinear form. A mixed trace inequality bounds the localized trace by quadratic
  costs from the Hessians of these energies. With the matrices fixed,
  heat identities control the accumulated costs by initial energies after integration over centers.
  Those integrated energies are bounded by sums of cubed $L^3$ norms.

There are two different costs in passing from one annulus to many.
  For smooth annuli, entries of the matrix formed from the dual input switch on and off at their chosen endpoints.
  We estimate the energy jumps entrywise, then rescale the dual input to obtain a $sqrt(n)$ bound.
  For hard annuli, estimating each endpoint error separately would give a linear loss.
  We instead group endpoints in dyadic radius intervals. Disjointness gives uniform size and derivative bounds for
  each group even when it has many jumps.

The main additional analytic tool is the frequency-block estimate of Proposition 17.
  It handles modulated Gaussian windows with coefficients depending jointly on scale, frequency,
  and output position. For uniformly bounded coefficients, a pointwise square-integral bound over scales and
  frequencies suffices, uniformly in the frequency size. To obtain that uniformity,
  we narrow one Gaussian variance and average its center shifts.
  This expresses each oscillatory insertion as an average of derivatives of narrower Gaussians.
  Auxiliary heat flows retaining only one input edge control the extra derivative terms.
  A two-dimensional Gaussian estimate then bounds the energy changes at the ends of the scale intervals without a
  loss from the narrow variance. This estimate and the rough-kernel family bound in Proposition 21 are formulated
  separately from the annular application.

=== 1.3 Organization <organization>

Section 2 fixes truncations, coordinates, and line maximal estimates.
  Section 3 proves the finite matrix inequalities; Section 4 develops their Gaussian heat flow.
  Section 5 proves the repeated-mask estimate for smooth annuli.
  Sections 6 and 7 establish the uniform frequency-block estimate and control the hard endpoint errors.
  Section 8 proves Theorems 2 and 1 by linearization, density, and rank summation.
  Section 9 derives the maximal, principal-value, and scalar conclusions.

== 2 Truncations, coordinates, and maximal averages <sec:preliminaries>

We first fix the representatives of all finite truncations and the coordinate convention for their linearizations.
  We also record the one-dimensional maximal estimates that will control changes of the matrix energy.
  Constants denoted by $C$ may change from line to line; their additional dependences are indicated explicitly.
  For an integrable function $f$ and $L > 0$, set

$ "Dil"_L f \( t \) = L^(- 1) f \( t \/ L \) . $

All inputs and matrices may be complex. Scalar forms are complex multilinear,
  so pairings with dual inputs do not include a conjugate.

#thm([Lemma 2.1.])[
  (Finite truncations).  #emph[For $F \, G in L^3 \( bb(R)^2 \)$,
    all finite annular integrals defining $B_(epsilon \, R) \( F \, G \)$ are absolutely convergent outside one
    common null set. On its complement they depend continuously on $\( epsilon \, R \)$ in $0 < epsilon < R < oo$.
    Changing representatives changes this family only on a common null set. Moreover,
#[#set math.equation(numbering: n => "(2.1)")
 $ ∥integral_(epsilon < \| t \| < R) \| F \( x + t \, y \) G \( x \, y + t \) \| thin
   frac(thin upright(d) t, \| t \|)∥_(3 \/ 2) lt.eq 2 log \( R \/ epsilon \) parallel F parallel_3 parallel G
   parallel_3 . $ <eq:finite-annulus-bound>]

]
] <lem:finite-truncations>

#proof[
  For each fixed $t$, Hölder’s inequality and translation invariance bound the $L^(3 \/ 2)$ norm of the product by
    $parallel F parallel_3 parallel G parallel_3$. Minkowski’s integral inequality gives (2.1).
    Apply this estimate to the countably many annuli $1 \/ m < \| t \| < m$, $m gt.eq 2$.
    Their union of exceptional null sets works for every finite annulus.
    Absolute continuity of the integral gives endpoint continuity.
    The same estimate applied to a zero $L^3$ difference proves the assertion about representatives,
    first on those countably many annuli and hence on all finite annuli. ◻
]

In particular, suprema over rational endpoint pairs agree with suprema over all endpoint pairs whenever only
  finitely many endpoints occur in a choice. Rational exhaustion makes the variation and the count quantities in
  the introduction measurable.

=== 2.1 The triangular coordinates <the-triangular-coordinates>

For most of the proof the inputs are smooth and compactly supported. The change of variables

$ x = - a \, wide y = - b \, wide t = a + b + c $

has absolute determinant one. Define

#[#set math.equation(numbering: n => "(2.2)")
 $ G_1 \( b \, c \) = F \( b + c \, - b \) \, wide G_2 \( c \, a \) = G \( - a \, c + a \) . $ <eq:pair-maps>]

Both pair maps preserve $L^3$ norms. With a dual input $G_0 \( a \, b \)$, the expressions to be estimated take the form

#[#set math.equation(numbering: n => "(2.3)")
 $ Lambda_(cal(K)) \( G_0 \, G_1 \, G_2 \) = integral.triple G_0 \( a \, b \) G_1 \( b \, c \) G_2 \( c \, a \)
   cal(K)_(a \, b) \( a + b + c \) thin upright(d) a thin upright(d) b thin upright(d) c . $ <eq:triangular-form>]

The maps in (2.2) are invertible, so estimates for arbitrary smooth compactly supported $G_v$ are equivalent to
  the corresponding dual estimates in the original coordinates.

A #emph[step choice] is a choice from a finite menu that is constant on each cell of a partition of $bb(R)^2$ by
  finitely many horizontal and vertical lines. Unbounded cells are allowed.
  For annular linearizations, each menu item is a list of at most $n$ disjoint radius intervals
  $\( epsilon_j \, R_j \)$, together with coefficients $\| beta_j \| lt.eq 1$.
  At a fixed output point the intervals are disjoint up to endpoints.
  We first prove all estimates for step choices. Values on cell boundaries can be assigned any menu item;
  they do not affect the integrals.

For such choices and smooth compactly supported inputs, finite-mesh estimates pass to (2.3) by ordinary Riemann
  sums. Indeed, choose $T$ so large that all coordinates in the input supports lie in $\[ - T \, T \]$, put $h =
  T \/ N$, and sample at the nodes $u_i = i h$. After any auxiliary frequency integration over a fixed bounded
  block, the finitely many kernels used below are continuous in their scalar variable.
  The resulting integrands on $\[ - T \, T \]^3$ are bounded and continuous off finitely many coordinate planes.
  Their Riemann sums converge, as do the discrete $L^3$ norm sums. No limit of matrix energies is taken.

=== 2.2 Maximal averages on a line <maximal-averages-on-a-line>

For functions on $bb(R)$ and sequences on $bb(Z)$, respectively, let

$ M_(bb(R)) f \( x \) = sup_(r > 0) frac(1, 2 r) integral_(x - r)^(x + r) \| f \( t \) \| thin upright(d) t \,
  wide M_(bb(Z)) f \( j \) = sup_(r in bb(Z)_(gt.eq 0)) frac(1, 2 r + 1) sum_(\| m - j \| lt.eq r) \| f \( m \) \| . $

The discrete operator includes singleton averages. We use these operators on individual coordinates of a function
  or array as well.

#thm([Lemma 2.2.])[
  (Line maximal estimates).  #emph[On either space, the centered maximal operator satisfies
$ mu { M f > rho } lt.eq 3 / rho parallel f parallel_1 \, wide parallel M f parallel_p^p lt.eq
  frac(6 p thin 2^(p - 1), p - 1) parallel f parallel_p^p quad \( 1 < p < oo \) . $

 Let $g_sigma \( t \) = \( 2 pi sigma \)^(- 1 \/ 2) e^(- t^2 \/ \( 2 sigma \))$.
   There is an absolute constant $C$ such that
#[#set math.equation(numbering: n => "(2.4)")
 $ sum_m h g_sigma \( \( m - j \) h \) \| f \( m \) \| & lt.eq C M_(bb(Z)) f \( j \) \, &  & sigma gt.eq h^2 \,\
integral g_sigma \( t \) \| f \( x - t \) \| thin upright(d) t & lt.eq
  C M_(bb(R)) f \( x \) \, &  & sigma > 0 . $ <eq:discrete-gaussian-maximal>]

]
] <lem:line-maximal>

#proof[
  We recall the covering proof of the Hardy–Littlewood estimates #cite(label("HardyLittlewood1930")).
    From any finite family of intervals, repeatedly select one of largest radius and discard those meeting it.
    The selected intervals are disjoint, and the union of the family lies in their triple-radius enlargements.
    Each enlargement has at most three times the original measure, also for integer intervals.
    Apply this to witnessing intervals centered at a finite subset of a discrete level set,
    or to a finite witnessing cover of a compact subset of a continuous level set.
    The latter level set is open because fixed-radius averages are continuous.
    Taking suprema over the finite or compact subsets proves the weak bound.
  For $f in L^p$, split at height $rho \/ 2$. The low part has maximal function at most $rho \/ 2$,
    while the high part is integrable. Thus
  $ mu { M f > rho } lt.eq 6 / rho integral_(\| f \| > rho \/ 2) \| f \| thin upright(d) mu . $
  The distribution formula and Tonelli’s theorem give the strong bound after integrating $p rho^(p - 1) thin
    upright(d) rho$. Truncation of the distribution integral first makes this argument independent of any a priori
    finiteness assertion.
  For (2.4), put $a = sqrt(sigma) \/ h gt.eq 1$. The kernel is $\( sqrt(2 pi) a \)^(- 1)
    e^(- \( m - j \)^2 \/ \( 2 a^2 \))$. Split the sum into $\| m - j \| lt.eq
    a$ and the annuli $2^(l - 1) a < \| m - j \| lt.eq 2^l a$, $l gt.eq 1$.
    The sum of $\| f \|$ in the corresponding ball is at most $3 dot.op 2^l a M_(bb(Z)) f \( j \)$.
    The resulting series is bounded by a constant times $1 + sum_(l gt.eq 1) 2^l e^(- 4^(l - 1) \/ 2)$.
    The same shell argument with integrals proves (2.4). ◻
]

== 3 Dimension-free matrix inequalities <sec:matrix>

The finite-dimensional part of the argument has two tasks:
  to bound a cyclic product by positive quadratic costs, and to keep those costs under control when matrices
  change or are averaged. We give all the needed estimates here,
  including the support and complex-phase arguments required for arbitrary complex input matrices.
  The averaging inequality in Lemma 8 will permit a Gaussian window to be replaced by a probability average of
  narrower windows without paying for their relative widths.

All spaces in this section are finite-dimensional complex Hilbert spaces.
  Matrix inequalities mean inequalities of Hermitian quadratic forms. Set

$ Phi \( P \) = "tr" \( P^(3 \/ 2) \) \, wide "supp" P = \( ker P \)^perp quad \( P gt.eq 0 \) . $

The application uses three spaces $H_v$, indexed by $v in bb(Z) \/ 3 bb(Z)$, and maps $W_v : H_(v + 1) arrow.r
  H_v$. The two matrices incident to vertex $v$ form its #emph[row star]

#[#set math.equation(numbering: n => "(3.1)")
 $ R_v = \[ thin W_v quad W_(v - 1)^(*) thin \] : H_(v + 1) xor H_(v - 1) arrow.r H_v . $ <eq:row-star>]

We use both Gram matrices

#[#set math.equation(numbering: n => "(3.2)")
 $ T_v = R_v^(*) R_v \, wide S_v = R_v R_v^(*) . $ <eq:star-grams>]

Their nonzero eigenvalues agree, including multiplicities, so $Phi \( T_v \) = Phi \( S_v \)$.
  Our eventual objective in this section is to bound the cyclic trace formed from the $W_v$ by second-derivative
  costs of these three energies. We first develop those costs for an arbitrary positive matrix $P$.

A matrix is #emph[supported on $P$] if it vanishes on $ker P$ on both sides.
  The Hilbert–Schmidt inner product is $chevron.l K \, L chevron.r_(upright("HS")) = "tr" \( K^(*) L \)$.
  Write $sans(L)_A \( X \) = A X$ and $sans(R)_A \( X \) = X A$.
  For Hermitian matrices $K \, L$ supported on $P$, define

#[#set math.equation(numbering: n => "(3.3)")
 $ cal(B)_P \( K \, L \) = 3 / 2 "Re" ⟨K \, \( sans(L)_(sqrt(P)) + sans(R)_(sqrt(P)) \)^(- 1)
   L⟩_(upright("HS")) \, wide b_P \( K \) = cal(B)_P \( K \, K \) . $ <eq:hessian-form>]

The inverse is taken on matrices acting on $"supp" P$, where the operator is positive definite.
  If $P = 0$, its only supported direction is zero and these expressions are zero.

=== 3.1 The energy and its quadratic costs <the-energy-and-its-quadratic-costs>

#thm([Lemma 3.1.])[
  (Supported Hessian).  #emph[On the cone of matrices positive definite on a fixed support, $Phi$ is smooth and
$ d Phi_P \( K \) = 3 / 2 "tr" \( sqrt(P) K \) \, wide d^2 Phi_P \( K \, L \) = cal(B)_P \( K \, L \) . $

 In an orthonormal eigenbasis for the positive eigenvalues $p_i$ of $P$,
#[#set math.equation(numbering: n => "(3.4)")
 $ b_P \( K \) = 3 / 2 sum_(i \, j) frac(\| K_(i j) \|^2, sqrt(p_i) + sqrt(p_j)) . $ <eq:hessian-metric>]

 In particular, $cal(B)_P$ is a positive definite symmetric bilinear form on the real space of supported Hermitian
   directions, and
$ \| cal(B)_P \( K \, L \) \| lt.eq b_P \( K \)^(1 \/ 2) b_P \( L \)^(1 \/ 2) . $

]
] <lem:hessian>

#proof[
  Restrict to the support and put $A = sqrt(P)$. The derivative of the squaring map at $A$ is $X mapsto A X +
    X A$; in an eigenbasis, it multiplies entry $\( i \, j \)$ by $sqrt(p_i) + sqrt(p_j) > 0$.
    The inverse function theorem gives a smooth positive square root, whose derivative $X_K$ solves
  $ A X_K + X_K A = K . $
  Multiplying by $A$ and taking traces gives $"tr" \( P X_K \) = 1 / 2 "tr" \( A K \)$.
    Hence differentiation of $Phi \( P \) = "tr" \( P sqrt(P) \)$ yields $d Phi_P \( K \) = 3 / 2 "tr" \( A K \)$.
    Differentiating once more proves the Hessian formula. Formula (3.4) follows by diagonalizing $A$,
    and proves the remaining assertions. This is the square-root case of the classical divided-difference
    calculus #cite(label("Daletskii1957")) Section 1. ◻
]

Both $Phi$ and $cal(B)$ are invariant under simultaneous unitary conjugation of their arguments.
  They are also invariant under extension of every argument by zero:
  their positive eigenvalues and supported entries do not change.
  These facts will let us compare Grams on different subspaces.

#thm([Lemma 3.2.])[
  (Order comparison).  #emph[If $P \, Q gt.eq 0$ on the same space, $a gt.eq 1$, and $P lt.eq a Q$,
    then every Hermitian $K$ supported on $P$ is supported on $Q$, and
#[#set math.equation(numbering: n => "(3.5)")
 $ b_P \( K \) gt.eq a^(- 1 \/ 2) b_Q \( K \) . $ <eq:matrix-order>]

]
] <lem:order>

#proof[
  For $x in ker Q$ we have $0 lt.eq chevron.l P x \, x chevron.r lt.eq a chevron.l Q x \, x chevron.r = 0$,
    so $ker Q subset.eq ker P$. This proves the support assertion.
  We recall the order facts used in the proof. Inversion reverses order for positive definite matrices,
    as follows by conjugating $0 < X lt.eq Y$ by $X^(- 1 \/ 2)$, inverting, and conjugating back. Also
  $ sqrt(X) = 1 / pi integral_0^oo X \( X + t I \)^(- 1) thin frac(thin upright(d) t, sqrt(t)) wide \( X gt.eq 0 \) . $
  Spectral calculus reduces this norm-convergent formula to the scalar integral.
    Since $X \( X + t I \)^(- 1) = I - t \( X + t I \)^(- 1)$,
    inversion order shows that square root preserves order. This is the classical Loewner–Heinz square-root
    monotonicity; see, for example, Kwong #cite(label("Kwong1975")) Theorem 1 and Section 2.
    The supported Hessian comparison below is derived from these order facts here.
  For $eta > 0$,
  $ P + eta I lt.eq a \( Q + eta I \) \, wide sqrt(P + eta I) lt.eq sqrt(a) sqrt(Q + eta I) . $
  If $A lt.eq B$, then $sans(L)_A + sans(R)_A lt.eq sans(L)_B + sans(R)_B$ on Hilbert–Schmidt space:
    the difference has quadratic form $"tr" \( X^(*) \( B - A \) X \) + "tr" \( X^(*) X \( B - A \) \) gt.eq 0$.
    Invert these positive operators to obtain
  $ b_(P + eta I) \( K \) gt.eq a^(- 1 \/ 2) b_(Q + eta I) \( K \) . $
  Let $eta arrow.b 0$. In an eigenbasis, every entry of $K$ meeting the kernel of the corresponding limiting
    matrix is zero. Thus Formula (3.4) gives precisely the supported costs on both sides of (3.5). ◻
]

#thm([Lemma 3.3.])[
  (Inserted Gram bound).  #emph[For a linear map $R : E arrow.r F$ and a Hermitian map $L : F arrow.r F$,
    the matrix $R^(*) L R$ is supported on $R^(*) R$, and
#[#set math.equation(numbering: n => "(3.6)")
 $ b_(R^(*) R) \( R^(*) L R \) lt.eq 3 / 4 lr(bar.v.double L bar.v.double)_(upright("op"))^2 Phi \( R^(*) R \) .
   $ <eq:insertion-bound>]

]
] <lem:insertion>

#proof[
  The insertion is Hermitian and annihilates $ker R = ker \( R^(*) R \)$. If $R = 0$, there is nothing to prove.
    Otherwise let $rho_i > 0$ be the positive singular values of $R$,
    and let $C$ be the compression of $L$ to the corresponding left singular vectors.
    Then $lr(bar.v.double C bar.v.double)_(upright("op")) lt.eq lr(bar.v.double L bar.v.double)_(upright("op"))$ and
  $ b_(R^(*) R) \( R^(*) L R \) = 3 / 2 sum_(i \, j) frac(rho_i^2 rho_j^2, rho_i + rho_j) \| C_(i j) \|^2 . $
  For $x \, y > 0$, $x^2 y^2 \/ \( x + y \) lt.eq \( x y \)^(3 \/ 2) \/ 2 lt.eq \( x^3 + y^3 \) \/ 4$.
    Every row and column of $C$ has squared Euclidean norm at most
    $lr(bar.v.double L bar.v.double)_(upright("op"))^2$. Therefore
  $ b_(R^(*) R) \( R^(*) L R \) lt.eq 3 / 8 sum_(i \, j) \( rho_i^3 + rho_j^3 \) \| C_(i j) \|^2 lt.eq 3 /
    4 lr(bar.v.double L bar.v.double)_(upright("op"))^2 sum_i rho_i^3 \, $
  as required. ◻
]

We next show that averaging a Gram and its inserted direction can only decrease the corresponding cost.
  No uniform lower bound on the positive eigenvalues is required.

#thm([Lemma 3.4.])[
  (Joint convexity under probability averages).  #emph[Let $\( Omega \, nu \)$ be a probability space and $E$ a
    fixed subspace of a finite-dimensional complex Hilbert space.
    Suppose $T_omega gt.eq 0$ and $K_omega = K_omega^(*)$ are measurable matrices, $"supp" T_omega =
    E$ and $K_omega$ is supported on $T_omega$ almost everywhere, and
$ integral_Omega #scale(x: 120%, y: 120%)[\(] lr(bar.v.double T_omega bar.v.double)_(upright("op")) +
  lr(bar.v.double K_omega bar.v.double)_(upright("op")) #scale(x: 120%, y: 120%)[\)] thin thin upright(d)
  nu \( omega \) < oo . $

 Then $overline(T) = integral T_omega thin thin upright(d) nu$ has support $E$, $overline(K) =
   integral K_omega thin thin upright(d) nu$ is supported on $overline(T)$, and
#[#set math.equation(numbering: n => "(3.7)")
 $ b_(overline(T)) \( overline(K) \) lt.eq integral_Omega b_(T_omega) \( K_omega \) thin thin upright(d)
   nu \( omega \) . $ <eq:joint-convexity>]

 The right side may be infinite.]
] <lem:joint-convexity>

#proof[
  If $E = { 0 }$, all matrices and costs vanish. Otherwise restrict every matrix to $E$.
    For every nonzero $x in E$, the positive quantity $chevron.l T_omega x \, x chevron.r$ has positive integral,
    so $overline(T)$ is positive definite on $E$. All averages vanish on $E^perp$, proving the support assertions.
  Put $A_omega = sqrt(T_omega)$ and $A = integral A_omega thin thin upright(d) nu$.
    The integral exists by the stated integrability and Cauchy–Schwarz.
    For every vector $x$, the vector-valued Cauchy–Schwarz inequality gives
  $ lr(bar.v.double A x bar.v.double)^2 lt.eq integral lr(bar.v.double A_omega x bar.v.double)^2 thin thin
    upright(d) nu = chevron.l overline(T) x \, x chevron.r . $
  Consequently $A^2 lt.eq overline(T)$, and square-root order, proved in Lemma 6, implies
  #[#set math.equation(numbering: n => "(3.8)")
   $ sqrt(overline(T)) gt.eq integral sqrt(T_omega) thin thin upright(d) nu . $ <eq:square-root-average>]
  For a positive definite selfadjoint operator $sans(M)$ on a real Hilbert space, completing the square proves
  #[#set math.equation(numbering: n => "(3.9)")
   $ chevron.l K \, sans(M)^(- 1) K chevron.r = sup_X { 2 chevron.l K \, X chevron.r - chevron.l X \,
     sans(M) X chevron.r } . $ <eq:inverse-variational>]
  Apply this identity on Hermitian matrices with real Hilbert–Schmidt inner product.
    The operators $sans(L)_(sqrt(T)) + sans(R)_(sqrt(T))$ preserve that real space.
    By (3.8), for each Hermitian $X$ the expression inside the supremum for $\( overline(T) \, overline(K) \)$ is
    at most the average of the corresponding expressions for $\( T_omega \, K_omega \)$.
    Taking the supremum and then bounding the supremum of an integral by the integral of the pointwise suprema gives
  $ b_(overline(T)) \( overline(K) \) lt.eq integral b_(T_omega) \( K_omega \) thin thin upright(d) nu . $
  Every inverse in this argument is taken on matrices acting on $E$;
    uniform invertibility over $omega$ was never assumed. ◻
]

=== 3.2 Changes that alter the rank <changes-that-alter-the-rank>

The Hessian was defined on a fixed support, but switching matrix entries on or off can change that support.
  The following first-derivative formula remains valid across such changes.
  It is a special case of the gradient formula for unitarily invariant matrix functions #cite(label("Lewis1995"))
  Theorem 3.1.

#thm([Lemma 3.5.])[
  (Rank changes and entrywise derivatives).  #emph[For rectangular complex matrices $R_(-) \,
    R_(+)$ of the same size, set $R \( z \) = \( 1 - z \) R_(-) + z R_(+)$ and $D = R_(+) - R_(-)$. Then
#[#set math.equation(numbering: n => "(3.10)")
 $ Phi \( R_(+)^(*) R_(+) \) - Phi \( R_(-)^(*) R_(-) \) =
   3 integral_0^1 "Re" chevron.l R \( z \) sqrt(R \( z \)^(*) R \( z \)) \,
   D chevron.r_(upright("HS")) thin thin upright(d) z . $ <eq:rank-change-derivative>]

 For every rectangular matrix $R$ and every entry $\( i \, j \)$,
#[#set math.equation(numbering: n => "(3.11)")
 $ \| \( R sqrt(R^(*) R) \)_(i j) \| lt.eq lr(bar.v.double "row"_i R bar.v.double)_2
   lr(bar.v.double "col"_j R bar.v.double)_2 . $ <eq:entry-gradient>]

]
] <lem:rank-change>

#proof[
  For $eta > 0$, Lemma 5 gives
  $ frac(thin upright(d), thin upright(d) z) "tr" \( \( R \( z \)^(*) R \( z \) + eta I \)^(3 \/ 2) \) =
    3 "Re" chevron.l R \( z \) sqrt(R \( z \)^(*) R \( z \) + eta I) \, D chevron.r_(upright("HS")) . $
  Spectral calculus implies $lr(bar.v.double sqrt(R^(*) R + eta I) - sqrt(R^(*) R) bar.v.double)_(upright("op"))
    lt.eq sqrt(eta)$. The matrices $R \( z \)$ stay bounded for $0 lt.eq z lt.eq 1$,
    so the derivatives converge uniformly as $eta arrow.b 0$, and the endpoint energies converge.
    Integrating first and passing to the limit proves (3.10).
  For (3.11), Cauchy–Schwarz in the matrix product bounds the entry by the norm of row $i$ of $R$ times the norm
    of column $j$ of $sqrt(R^(*) R)$. The latter column has squared norm $\( R^(*) R \)_(j j)$,
    also the squared norm of column $j$ of $R$. ◻
]

=== 3.3 The cyclic product <the-cyclic-product>

Return to the three maps $W_v$ and the row stars (3.1)–(3.2).
  The reason for combining the two incident matrices is the following estimate:
  three inserted star costs control the entire cyclic product.

#thm([Lemma 3.6.])[
  (Mixed trace inequality).  #emph[For Hermitian maps $D_v : H_v arrow.r H_v$, put $D_(*) =
    max_v lr(bar.v.double D_v bar.v.double)_(upright("op"))$. Then
#[#set math.equation(numbering: n => "(3.12)")
 $ lr(|"tr" \( D_0 W_0 D_1 W_1 D_2 W_2 \)|) lt.eq 5 / 3 D_(*) sum_(v = 0)^2 b_(T_v) \( R_v^(*) D_v R_v \) .
   $ <eq:mixed-trace>]

 The constant is independent of the dimensions and no Gram is assumed invertible.]
] <lem:mixed-trace>

#proof[
  We put the three costs in one quadratic form, bound a cubic trace,
    and then recover the complex phase of the cyclic product.
  ===== 3.3.1 One quadratic form. <one-quadratic-form.>
  On $H = H_0 xor H_1 xor H_2$, define
  $ M = mat(delim: "(", 0, W_0, W_2^(*); W_0^(*), 0, W_1; W_2, W_1^(*), 0) \, wide D =
    "diag" \( D_0 \, D_1 \, D_2 \) . $
  Both are Hermitian and $lr(bar.v.double D bar.v.double)_(upright("op")) = D_(*)$.
    If $P_v$ is the orthogonal projection onto $H_v$, put $A_v = M P_v M$ and $K_v = M P_v D M$.
    After permuting blocks and extending by zero, these are respectively $T_v$ and $R_v^(*) D_v R_v$.
    The matrix $K_v$ is Hermitian because $P_v$ commutes with $D$. Moreover,
  $ ker A_v = ker \( P_v M \) subset.eq ker K_v \, wide 0 lt.eq A_v lt.eq M^2 . $
  Thus $K_v$ is supported on $A_v$ and on $M^2$. Lemma 6 and the inequality $sum_(v = 0)^2 b \( X_v \) gt.eq 1 /
    3 b \( sum_v X_v \)$ for a positive quadratic form give
  #[#set math.equation(numbering: n => "(3.13)")
   $ cal(E) := sum_v b_(T_v) \( R_v^(*) D_v R_v \) gt.eq sum_v b_(M^2) \( K_v \) gt.eq 1 /
     3 b_(M^2) \( M D M \) . $ <eq:trace-common-metric>]
  ===== 3.3.2 A cubic trace estimate. <a-cubic-trace-estimate.>
  Choose an orthonormal eigenbasis of $M$, with real eigenvalues $m_i$ ordered so that $q_i = \|
    m_i \|$ is nonincreasing. Ties are arbitrary. In that basis Formula (3.4) yields
  #[#set math.equation(numbering: n => "(3.14)")
   $ cal(E) gt.eq 1 / 2 Q \, wide Q := sum_(i \, j : q_i + q_j > 0) frac(q_i^2 q_j^2, q_i + q_j) \| D_(i j) \|^2 .
     $ <eq:trace-Q>]
  Any term with one zero $q_i$ is zero; pairs with both zero are omitted. Write
  $ A_i = q_i^3 \| D_(i i) \|^2 \, quad E_i = q_i sum_(j > i) q_j^2 \| D_(i j) \|^2 \, quad A = sum_i A_i \, quad
    E = sum_i E_i . $
  Hermitian symmetry and $q_j lt.eq q_i$ for $j > i$ imply
  #[#set math.equation(numbering: n => "(3.15)")
   $ Q = A / 2 + 2 sum_(i < j\
q_i + q_j > 0) frac(q_i^2 q_j^2, q_i + q_j) \| D_(i j) \|^2 gt.eq A / 2 + E . $ <eq:trace-AE>]
  Expand
  $ "tr" \( \( D M \)^3 \) = sum_(i \, j \, k) m_i m_j m_k D_(i j) D_(j k) D_(k i) $
  and group triples by the multiplicity of their smallest index $i$. If it occurs once, its three cyclic positions give
  $ 3 m_i sum_(j \, k > i) m_j m_k D_(i j) D_(j k) D_(k i) . $
  The inner sum is $x^(*) D_(> i) x$ for $x = \( m_j D_(j i) \)_(j > i)$,
    where $D_(> i)$ is the corresponding compression of $D$. Since
    $lr(bar.v.double D_(> i) bar.v.double)_(upright("op")) lt.eq D_(*)$,
    this contribution has modulus at most $3 D_(*) E_i$. The argument allows $j = k$ and retains the signs of the $m_j$.
  If the smallest index occurs twice, its contribution is
  $ 3 m_i^2 D_(i i) sum_(k > i) m_k \| D_(i k) \|^2 . $
  By Cauchy–Schwarz and $sum_k \| D_(i k) \|^2 = lr(bar.v.double D e_i bar.v.double)^2 lt.eq D_(*)^2$,
  $ lr(|sum_(k > i) m_k \| D_(i k) \|^2|) lt.eq D_(*) (sum_(k > i) q_k^2 \| D_(i k) \|^2)^(1 \/ 2) . $
  The contribution is therefore at most $3 D_(*) sqrt(A_i E_i)$, also when $q_i = 0$.
    Finally, if all three indices equal $i$, the modulus is at most $D_(*) A_i$. These cases exhaust all triples.
    Summing and using Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(3.16)")
   $ \| "tr" \( \( D M \)^3 \) \| & lt.eq D_(*) #scale(x: 120%, y: 120%)[\(] A + 3 E +
     3 sqrt(A E) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq D_(*) (5 / 2 A + 9 / 2 E) lt.eq 5 D_(*) (A / 2 + E) lt.eq 5 D_(*) Q . $ <eq:trace-cubic>]
  ===== 3.3.3 Recovering the complex phase. <recovering-the-complex-phase.>
  Set $tau = "tr" \( D_0 W_0 D_1 W_1 D_2 W_2 \)$. Since $M$ has zero diagonal blocks,
    every nonzero closed three-step block product visits all three vertices.
    The three starting vertices in one orientation give $tau$, by cyclicity of trace;
    the reverse orientation gives $overline(tau)$, because the $D_v$ are Hermitian. Consequently
  $ "tr" \( \( D M \)^3 \) = 6 "Re" tau . $
  When $tau eq.not 0$, choose $\| z \| = 1$ so that $z tau = \| tau \|$ and replace $W_0$ by $z W_0$.
    This changes the stars by
  $ R_0 mapsto R_0 "diag" \( z I_(H_1) \, I_(H_2) \) \, wide
    R_1 mapsto R_1 "diag" \( I_(H_2) \, overline(z) I_(H_0) \) \, $
  and leaves $R_2$ unchanged. These right multipliers are unitary;
    each conjugates the Gram and its insertion by the same unitary. Thus $cal(E)$ and $D_(*)$ are unchanged.
    Apply (3.14) and (3.16) to the modified matrices, with their own value of $Q$, to obtain
  $ 6 \| tau \| lt.eq 5 D_(*) Q lt.eq 10 D_(*) cal(E) . $
  This is (3.12). The case $tau = 0$ is immediate. ◻
]

In the applications a diagonal insertion may be complex. Write $D_v = D_v^(\( 0 \)) +
  i D_v^(\( 1 \))$ for its real and imaginary diagonal parts, and put $D_(*) =
  max_v lr(bar.v.double D_v bar.v.double)_(upright("op"))$.
  Expanding gives eight products with Hermitian diagonals, each bounded by Lemma 10.
  Both parts have operator norm at most $D_(*)$, and each of their six costs occurs four times in the sum. Thus

#[#set math.equation(numbering: n => "(3.17)")
 $ lr(|"tr" \( D_0 W_0 D_1 W_1 D_2 W_2 \)|) lt.eq 20 / 3 D_(*) sum_(v = 0)^2 sum_(epsilon.alt = 0)^1
   b_(T_v) \( R_v^(*) D_v^(\( epsilon.alt \)) R_v \) . $ <eq:complex-mixed-trace>]

All directions appearing in this bound remain Hermitian.

== 4 Gaussian heat dissipation <sec:heat>

We use Gaussian weights to turn the matrix costs of the preceding section into derivatives of an energy.
  Integration over a plane of Gaussian centers then gives two complementary estimates:
  strict dissipation of the sum of the three star energies when the variances are comparable,
  and single-edge dissipation for arbitrary positive variance rates.
  Both estimates are uniform in the matrix dimension. We retain arbitrary positive rates in the differential
  identities, since both forms of dissipation will be needed below.
  Continuous Gaussian telescoping for entangled forms also appears in Durcik #cite(label("Durcik2015")) Lemma 3
  and Section 3.

Fix $h > 0$, an integer $N gt.eq 0$, and nodes $u_i = i h$, $- N lt.eq i lt.eq N$.
  The vertex index $v$ is taken in $bb(Z) \/ 3 bb(Z)$. For finite complex edge arrays $A_v \( i \, j \)$, put

$ n_v = (sum_(i \, j = - N)^N h^2 \| A_v \( i \, j \) \|^3)^(1 \/ 3) . $

For centers $p_v in bb(R)$ and variances $sigma_v > 0$, define

#[#set math.equation(numbering: n => "(4.1)")
 $ g_sigma \( t \) = \( 2 pi sigma \)^(- 1 \/ 2) e^(- t^2 \/ \( 2 sigma \)) \, wide w_v \( i \) =
   h g_(sigma_v) \( u_i - p_v \) \,\
W_v \( i \, j \) = A_v \( i \, j \) sqrt(w_v \( i \) w_(v + 1) \( j \)) . $ <eq:weights>]

Form the stars and their Grams as in (3.1)–(3.2), and set $e_v = Phi \( T_v \) = Phi \( S_v \)$.
  To distinguish the two blocks of the star, write

$ C_(v \, v + 1) = W_v \, wide C_(v \, v - 1) = W_(v - 1)^(*) \, wide R_v = \[ C_(v \, v + 1) med C_(v \, v - 1) \] . $

The diagonal Gaussian scores and the corresponding inserted Grams are

$ N_v = "diag"_i frac(u_i - p_v, sigma_v) \, wide U_v = R_v^(*) N_v R_v \, wide P_(v \, w) =
  C_(v \, w) N_w C_(v \, w)^(*) quad \( w eq.not v \) . $

Their quadratic costs are

#[#set math.equation(numbering: n => "(4.2)")
 $ V_v = b_(T_v) \( U_v \) \, wide Y_(v \, w) = b_(S_v) \( P_(v \, w) \) \, wide Z_v =
   cal(B)_(S_v) \( P_(v \, v + 1) \, P_(v \, v - 1) \) . $ <eq:heat-costs>]

All these insertions are supported on their respective Grams:
  an inserted Gram $B^(*) D B$ annihilates $ker B$ on both sides.

For $d in bb(R)$, equip the plane $Pi_d = { p_0 + p_1 + p_2 = d }$ with the measure

#[#set math.equation(numbering: n => "(4.3)")
 $ integral_(Pi_d) H thin thin upright(d) pi_d = integral_(bb(R)^2) H \( p_0 \, p_1 \, d - p_0 - p_1 \) thin thin
   upright(d) p_0 thin thin upright(d) p_1 . $ <eq:heat-plane-measure>]

Any pair of centers can be the free coordinates, since the changes between these charts have absolute determinant
  one. Given positive rates $bold(alpha) = \( alpha_0 \, alpha_1 \, alpha_2 \)$,
  we evaluate the weights at $sigma_i = alpha_i s$ and write

$ J_v \( d \, s \) = integral_(Pi_d) e_v thin thin upright(d) pi_d \, wide J \( d \, s \) =
  sum_v J_v \( d \, s \) \, wide Sigma_alpha = sum_i alpha_i . $

The arrays remain fixed whenever a scale derivative is taken.

=== 4.1 Differentiation and the plane identities <differentiation-and-the-plane-identities>

#thm([Lemma 4.1.])[
  (Heat identities).  #emph[For fixed finite arrays and arbitrary positive rates,
    the energies $e_v$ are smooth in the centers and positive variances. For $s > 0$,
#[#set math.equation(numbering: n => "(4.4)")
 $ 2 partial_s e_v & = sum_i alpha_i partial_(p_i)^2 e_v - alpha_v V_v - sum_(w eq.not v) alpha_w Y_(v \, w) \,\
partial_(p_(v + 1)) partial_(p_(v - 1)) e_v & = Z_v . $ <eq:heat-identity>]

 The plane integrals are finite, continuously differentiable in $s$, and twice continuously differentiable in $d$, with
#[#set math.equation(numbering: n => "(4.5)")
 $ 2 partial_s J_v \( d \, s \) & = Sigma_alpha partial_d^2 J_v \( d \, s \) -
   integral_(Pi_d) (alpha_v V_v + sum_(w eq.not v) alpha_w Y_(v \, w)) thin upright(d) pi_d \,\
partial_d^2 J_v \( d \, s \) & = integral_(Pi_d) Z_v thin thin upright(d) pi_d . $ <eq:heat-plane-identities>]

 On compact positive scale intervals, the plane integrals of the absolute values of all derivatives used here grow
   at most polynomially in $\| d \|$.]
] <lem:heat-identities>

#proof[
  We first check that the possible kernels of the Grams cause no differentiability problem. Each star has the form
  $ R_v = D_(upright("row")) R_v^0 D_(upright("col")) \, wide R_v^0 = \[ A_v med A_(v - 1)^(*) \] \, $
  where both diagonal multipliers are positive and invertible.
    With the column parameters fixed, $ker R_v$ is fixed, so $T_v$ has fixed support as the row parameters vary.
    With the row parameters fixed, $"ran" R_v$ is fixed, so $S_v$ has fixed support as either or both column
    parameters vary. For joint smoothness, factor a nonzero $R_v^0$ as $X Y^(*)$ with $X \,
    Y$ of full column rank. Set $X' = D_(upright("row")) X$, $Y' = D_(upright("col")) Y$, $P' = X' ""^(*) X'$,
    and $Q' = Y' ""^(*) Y'$. These last two matrices are positive definite and smooth,
    and the nonzero eigenvalues of $R_v R_v^(*)$ are those of $Q' ""^(1 \/ 2) P' Q' ""^(1 \/ 2)$. Consequently
  $ e_v = Phi \( Q' ""^(1 \/ 2) P' Q' ""^(1 \/ 2) \) $
  is smooth. The rank-zero case is immediate.
  For one Gaussian density $w = h g_sigma \( u - p \)$ and its score $N = \( u - p \) \/ sigma$,
  $ partial_p w = N w \, wide partial_p^2 w = \( N^2 - sigma^(- 1) \) w \, wide 2 partial_sigma w = partial_p^2 w . $
  With the columns fixed, $T_v$ is linear in the row density, and hence
  $ partial_(p_v) T_v = U_v \, wide 2 partial_(sigma_v) T_v = partial_(p_v)^2 T_v . $
  The chain rule on its fixed support and Lemma 5 give
  $ 2 partial_(sigma_v) e_v = partial_(p_v)^2 e_v - V_v . $
  For a column vertex $w eq.not v$, use $S_v$ instead. It is linear in that column density, has fixed support,
    and satisfies $partial_(p_w) S_v = P_(v \, w)$. Thus $2 partial_(sigma_w) e_v = partial_(p_w)^2 e_v -
    Y_(v \, w)$. Taking the variance derivative along $sigma_i = alpha_i s$ proves (4.4).
    The two summands of $S_v = C_(v \, v + 1) C_(v \, v + 1)^(*) +
    C_(v \, v - 1) C_(v \, v - 1)^(*)$ depend on different column densities.
    Its mixed derivative in those two centers is zero; the Hessian term in the chain rule is therefore exactly
    $Z_v$, proving (4.4).
  Before integrating these identities, we give the domination needed for differentiation under the integral.
    Lemma 7 yields
  $ V_v lt.eq 3 / 4 parallel N_v parallel_(upright("op"))^2 e_v \, wide Y_(v \, w) lt.eq 3 /
    4 parallel N_w parallel_(upright("op"))^2 e_v \, wide 2 \| Z_v \| lt.eq Y_(v \, v + 1) + Y_(v \, v - 1) . $
  For the second inequality, apply the insertion bound to $R_v^(*)$,
    padding $N_w$ by zero on the other column block. For any Hermitian $B$ on the row space,
  $ \| "tr" \( sqrt(T_v) R_v^(*) B R_v \) \| lt.eq parallel B parallel_(upright("op")) e_v \, $
  because $R_v sqrt(T_v) R_v^(*)$ is positive and has trace $e_v$.
    The corresponding estimate for a column insertion follows by using $S_v$.
    The Gaussian derivative formulas and the Hessian chain rule therefore bound every first center derivative,
    pure second center derivative, mixed column derivative, and first scale derivative used above by a polynomial
    in the centers times $e_v$, locally uniformly in $s > 0$.
  The energy itself satisfies
  #[#set math.equation(numbering: n => "(4.6)")
   $ e_v lt.eq (parallel W_v parallel_(upright("HS"))^2 + parallel W_(v - 1) parallel_(upright("HS"))^2)^(3 \/ 2)
     lt.eq sqrt(2) (parallel W_v parallel_(upright("HS"))^3 + parallel W_(v - 1) parallel_(upright("HS"))^3) .
     $ <eq:heat-energy-bound>]
  Since the node set is finite, each edge norm cubed is bounded by a Gaussian in its two endpoint centers,
    locally uniformly for positive variances. On $Pi_d$, with $\| d \| lt.eq D$,
    each pair of distinct indices $i \, j$ satisfies
  $ p_0^2 + p_1^2 + p_2^2 lt.eq 4 \( p_i^2 + p_j^2 \) + 3 D^2 . $
  Thus the preceding bounds have integrable majorants in every plane chart, locally uniformly in $\( d \, s \)$.
    Dominated convergence justifies all the asserted derivatives.
    To obtain polynomial growth in $d$, use the two endpoints of each bounding Gaussian as free coordinates;
    the third center is $d$ minus their sum. Integrating a polynomial times that Gaussian leaves at most
    polynomial growth in $\| d \|$. Constants in these differentiability arguments may depend on the fixed arrays,
    mesh, rates, and compact scale interval, but do not enter the estimates below.
  Choosing $p_i$ as the dependent coordinate gives, for each $i$,
  $ partial_d^2 J_v = integral_(Pi_d) partial_(p_i)^2 e_v thin thin upright(d) pi_d . $
  To obtain the mixed derivative, first choose $p_(v + 1)$ dependent and differentiate once.
    Reparametrize the resulting integral with $p_(v - 1)$ dependent and differentiate once more. This gives
  $ partial_d^2 J_v = integral_(Pi_d) partial_(p_(v - 1)) partial_(p_(v + 1)) e_v thin thin upright(d) pi_d =
    integral_(Pi_d) Z_v thin thin upright(d) pi_d . $
  Integrating (4.4) proves the first identity in (4.5). These comparisons concern integrated derivatives;
    no pointwise equality of pure and mixed center derivatives is asserted. ◻
]

=== 4.2 Strict dissipation at comparable variances <strict-dissipation-at-comparable-variances>

The plane identities contain mixed terms $Z_v$ whose signs are not controlled.
  We bound them by column costs and then compare those costs with the row cost at the neighboring vertex.
  The resulting loss is $sqrt(2)$, small enough to leave strict dissipation for the variance ratios we use.

#thm([Lemma 4.2.])[
  (Plane dissipation).  #emph[For fixed finite arrays and arbitrary positive rates,
#[#set math.equation(numbering: n => "(4.7)")
 $ 2 partial_s J \( d \, s \) lt.eq
   integral_(Pi_d) sum_w [- alpha_w + sqrt(2) max { 0 \, Sigma_alpha \/ 2 - alpha_w }] V_w thin thin upright(d)
   pi_d . $ <eq:heat-plane-dissipation>]

 In particular, put $lambda = 11 \/ 10$. For each permutation of $\( 1 \, lambda \, lambda \)$,
#[#set math.equation(numbering: n => "(4.8)")
 $ - partial_s J \( d \, s \) gt.eq c_(*) integral_(Pi_d) sum_w V_w thin thin upright(d) pi_d \,\
c_(*) = 1 / 2 min { 1 - 3 / 5 sqrt(2) \, 11 / 10 - 1 / 2 sqrt(2) } > 0 . $ <eq:heat-strict>]

]
] <lem:plane-dissipation>

#proof[
  We first prove the neighbor comparison
  #[#set math.equation(numbering: n => "(4.9)")
   $ Y_(w + 1 \, w) + Y_(w - 1 \, w) lt.eq sqrt(2) thin V_w . $ <eq:heat-neighbors>]
  Write $A = W_w$, $B = W_(w - 1)^(*)$, and $N = N_w$. The elementary inequality $parallel A z +
    B z' parallel^2 lt.eq 2 parallel A z parallel^2 + 2 parallel B z' parallel^2$ gives
  $ T_w lt.eq 2 Q \, wide Q = "diag" \( A^(*) A \, B^(*) B \) . $
  By Lemma 6, $V_w gt.eq 2^(- 1 \/ 2) b_Q \( \[ A med B \]^(*) N \[ A med B \] \)$.
    In a block-preserving eigenbasis of $Q$, the Hessian cost is a sum of nonnegative squared entries.
    Discarding the off-diagonal blocks gives
  $ b_Q \( \[ A med B \]^(*) N \[ A med B \] \) gt.eq b_(A^(*) A) \( A^(*) N A \) + b_(B^(*) B) \( B^(*) N B \) . $
  Now $A^(*) A lt.eq S_(w + 1)$ and $B^(*) B lt.eq S_(w - 1)$;
    the respective insertions are $P_(w + 1 \, w)$ and $P_(w - 1 \, w)$.
    A second use of Lemma 6, with comparison factor one, proves (4.9).
  In (4.5), replace $2 Z_v$ by its upper bound $Y_(v \, v + 1) + Y_(v \, v - 1)$ and sum over $v$.
    The two column costs carrying the score at vertex $w$ have common coefficient $Sigma_alpha \/ 2 - alpha_w$.
    If this coefficient is negative, discard those terms; otherwise apply (4.9). This proves (4.7).
    For the specified rates, $Sigma_alpha = 16 \/ 5$, and the two possible coefficients are $-
    1 + \( 3 \/ 5 \) sqrt(2)$ and $- 11 \/ 10 + \( 1 \/ 2 \) sqrt(2)$. Both are negative, giving (4.8). ◻
]

=== 4.3 Energy bounds and the single-edge case <energy-bounds-and-the-single-edge-case>

The decrease in (4.8) controls the accumulated costs by an initial energy.
  We now bound that energy uniformly once the Gaussian variances are no smaller than the mesh scale.

#thm([Lemma 4.3.])[
  (Initial energy).  #emph[For all $d in bb(R)$ and all variances $sigma_v gt.eq h^2$,
#[#set math.equation(numbering: n => "(4.10)")
 $ integral_(Pi_d) parallel W_v parallel_(upright("HS"))^3 thin thin upright(d) pi_d lt.eq M n_v^3 \, wide M = 1 +
   sqrt(2 \/ pi) \,\
integral_(Pi_d) sum_v e_v thin thin upright(d) pi_d lt.eq 2 sqrt(2) M sum_v n_v^3 . $ <eq:initial-energy>]

 These bounds also hold with the original right-hand sides if any entries are replaced by entries of smaller
   absolute value.]
] <lem:initial-energy>

#proof[
  The Gaussian grid mass obeys
  #[#set math.equation(numbering: n => "(4.11)")
   $ sum_(i = - N)^N h g_sigma \( u_i - p \) lt.eq 1 + frac(2 h, sqrt(2 pi sigma)) . $ <eq:heat-mesh-mass>]
  Indeed, for $u_i gt.eq p + h$ compare the summand with the integral over the preceding interval of length $h$;
    for $u_i lt.eq p - h$, use the succeeding interval. These intervals are disjoint,
    and the at most two remaining nodes contribute at most $2 h sup g_sigma$.
    For $sigma gt.eq h^2$, the right side is at most $M$. Weighted Hölder therefore gives
  $ parallel W_v parallel_(upright("HS"))^3 =
    (sum_(i \, j) \| A_v \( i \, j \) \|^2 w_v \( i \) w_(v + 1) \( j \))^(3 \/ 2) lt.eq
    M sum_(i \, j) \| A_v \( i \, j \) \|^3 w_v \( i \) w_(v + 1) \( j \) . $
  Use $p_v \, p_(v + 1)$ as free coordinates on $Pi_d$. Each density integrates to $h$,
    proving the first estimate in (4.10). Each edge occurs in two stars, so (4.6) proves the second.
    The same upper bounds decrease when the entrywise absolute values decrease. ◻
]

For example, if $h^2 lt.eq s_0 < s_1$ and the rates are a permutation of $\( 1 \, lambda \, lambda \)$,
  these two lemmas imply

#[#set math.equation(numbering: n => "(4.12)")
 $ integral_(s_0)^(s_1) integral_(Pi_d) sum_v V_v thin thin upright(d) pi_d thin thin upright(d) s lt.eq
   frac(J \( d \, s_0 \) - J \( d \, s_1 \), c_(*)) lt.eq frac(2 sqrt(2) M, c_(*)) sum_v n_v^3 .
   $ <eq:heat-fixed-array-integral>]

The first inequality retains the terminal energy, which is essential when arrays are changed at finitely many scales.

For much more unequal variance rates, (4.7) does not guarantee that the summed star energy decreases.
  A single edge nevertheless has no mixed term and retains exact dissipation. We state that consequence separately.

#thm([Lemma 4.4.])[
  (Single-edge energy).  #emph[Fix $v eq.not w$, retain the weighted block $C = C_(v \, w)$,
    and delete the other block of the star at $v$. For arbitrary positive rates, set
$ e_(v \, w)^e & = Phi \( C C^(*) \) \, wide V_(v \, w)^e = b_(C^(*) C) \( C^(*) N_v C \) \, wide Y_(v \, w)^e =
  b_(C C^(*)) \( C N_w C^(*) \) \,\
J_(v \, w)^e \( s \) & = integral.double_(bb(R)^2) e_(v \, w)^e thin thin upright(d) p_v thin thin upright(d) p_w . $

 The plane integrals of $e_(v \, w)^e$, $V_(v \, w)^e$, and $Y_(v \, w)^e$ are independent of $d$. Moreover,
#[#set math.equation(numbering: n => "(4.13)")
 $ - 2 partial_s J_(v \, w)^e \( s \) =
   integral.double_(bb(R)^2) \( alpha_v V_(v \, w)^e + alpha_w Y_(v \, w)^e \) thin thin upright(d) p_v thin thin
   upright(d) p_w . $ <eq:heat-single-edge>]

 If $n_e$ denotes the discrete $L^3$ norm of this edge’s unweighted array, then, whenever $alpha_v s_0 \,
   alpha_w s_0 gt.eq h^2$ and $s_1 > s_0$,
#[#set math.equation(numbering: n => "(4.14)")
 $ integral_(s_0)^(s_1) integral.double_(bb(R)^2) \( alpha_v V_(v \, w)^e + alpha_w Y_(v \, w)^e \) thin thin
   upright(d) p_v thin thin upright(d) p_w thin thin upright(d) s lt.eq 2 M n_e^3 . $ <eq:heat-single-edge-integral>]

 For the original two-block star, $Y_(v \, w) lt.eq Y_(v \, w)^e$.]
] <lem:single-edge-energy>

#proof[
  The three integrands depend only on the two endpoint centers.
    Using these as free coordinates proves independence of $d$.
    In the one-edge star the other column insertion is zero, so $Z_v = 0$.
    After permuting column blocks, its matrices are
  $ R = \[ C med 0 \] \, wide T = "diag" \( C^(*) C \, 0 \) \, wide U = "diag" \( C^(*) N_v C \, 0 \) \, wide S =
    C C^(*) . $
  The Hessian cost is unchanged by zero extension, so its row and column costs are exactly $V_(v \, w)^e$ and
    $Y_(v \, w)^e$. Equation (4.5) now proves (4.13). Also $e_(v \, w)^e lt.eq
    parallel C parallel_(upright("HS"))^3$, so Lemma 13 gives $J_(v \, w)^e \( s_0 \) lt.eq M n_e^3$.
    Integrate (4.13) and discard the nonnegative terminal energy to obtain (4.14).
    Finally $C C^(*) lt.eq S_v$, while $C N_w C^(*)$ is supported on $C C^(*)$.
    Lemma 6 with factor one gives $Y_(v \, w) lt.eq Y_(v \, w)^e$. ◻
]

== 5 Repeated masks and smooth annuli <sec:smooth>

The fixed-array dissipation from Section 4 controls smooth annuli as long as we also pay for changes in the dual
  array. We now allow up to $n$ disjoint intervals at every output point.
  The useful feature of the jump estimate is its dependence on the dual norm:
  every mixed jump term contains that norm twice. A rescaling will then turn the linear switch count into a
  square-root loss.

Define the odd windows and their scale integrals by

#[#set math.equation(numbering: n => "(5.1)")
 $ k_s \( t \) = t / sqrt(s) g_s \( t \) \, wide I_(epsilon \, R) \( t \) =
   integral_(epsilon^2)^(R^2) \( k_s * k_s * k_s \) \( t \) thin frac(thin upright(d) s, s) . $ <eq:smooth-kernels>]

#thm([Proposition 5.1.])[
  (Smooth annuli with repeated choices).  #emph[Let $G_v in C_c^oo \( bb(R)^2 \)$ be complex.
    At each output pair $\( a \, b \)$, make a step choice of at most $n gt.eq
    1$ disjoint radius intervals $\( epsilon_j \, R_j \)$ and coefficients $\| beta_j \| lt.eq 1$. For
$ cal(K)_(a \, b) \( t \) = sum_j beta_j I_(epsilon_j \, R_j) \( t \) $

 one has
$ \| Lambda_(cal(K)) \( G_0 \, G_1 \, G_2 \) \| lt.eq C sqrt(n) product_(v = 0)^2 parallel G_v parallel_3 . $

 The constant is independent of the step partition, the menu of choices, and all endpoints.]
] <prop:smooth-switches>

=== 5.1 The cost of the switches <the-cost-of-the-switches>

Work first on the finite grid of Section 4. Make the stated interval and coefficient choices separately for each
  pair $\( i \, j \)$ and put

#[#set math.equation(numbering: n => "(5.2)")
 $ A_0^s \( i \, j \) = A_0 \( i \, j \) sum_ell beta_ell upright(bold(1))_({ epsilon_ell^2 < s < R_ell^2 }) .
   $ <eq:repeated-mask>]

The sum runs through the list chosen at this particular index pair. Keep $A_1 \, A_2$ fixed.
  Choose a compact positive scale interval $\[ s_(-) \, s_(+) \]$ containing all switch scales in its interior,
  and take $h^2 lt.eq s_(-)$. By disjointness,

#[#set math.equation(numbering: n => "(5.3)")
 $ \| A_0^s \( i \, j \) \| lt.eq \| A_0 \( i \, j \) \| \, wide sum_tau \| A_0^(tau +) \( i \, j \) -
   A_0^(tau -) \( i \, j \) \| lt.eq 2 n \| A_0 \( i \, j \) \| . $ <eq:mask-switch-count>]

The sum is over the distinct switch scales, and one-sided values are used.
  Both inequalities hold for complex coefficients, including simultaneous openings and closings.

#thm([Lemma 5.2.])[
  (Repeated-mask dissipation).  #emph[Use the masked arrays above and variances $sigma_v = alpha_v s$,
    where $bold(alpha)$ is any permutation of $\( 1 \, 11 \/ 10 \, 11 \/ 10 \)$.
    With $n_v$ denoting the norms of the original arrays,
#[#set math.equation(numbering: n => "(5.4)")
 $ integral_(s_(-))^(s_(+)) integral_(Pi_0) sum_v V_v thin upright(d) pi_0 thin upright(d) s lt.eq
   C
   (sum_v n_v^3 + n #scale(x: 120%, y: 120%)[\(] n_0^3 + n_0^2 \( n_1 + n_2 \) #scale(x: 120%, y: 120%)[\)]) .
   $ <eq:repeated-dissipation>]

]
] <lem:repeated-dissipation>

#proof[
  Between switch scales the arrays are fixed, so (4.8) applies. It remains to bound the energy jumps.
    At a switch $tau$, freeze the weights and set $delta A \( i \, j \) = A_0^(tau +) \( i \, j \) -
    A_0^(tau -) \( i \, j \)$. Interpolate all changed entries linearly.
    Their moduli stay bounded by $\| A_0 \|$ by convexity. For fixed centers and $\( i \, j \)$ let
  $ X^2 & = sum_m \| A_0 \( i \, m \) \|^2 w_1 \( m \) \, & Y^2 & = sum_m \| A_0 \( m \, j \) \|^2 w_0 \( m \) \,\
H^2 & = sum_m \| A_2 \( m \, i \) \|^2 w_2 \( m \) \, & Q^2 & = sum_m \| A_1 \( j \, m \) \|^2 w_2 \( m \) . $
  These quantities use the original arrays, and square roots are nonnegative.
    In $R_0 = \[ W_0 med W_2^(*) \]$, the changing entry has row norm at most $sqrt(w_0 \( i \)) \( X + H \)$,
    column norm at most $sqrt(w_1 \( j \)) Y$, and derivative modulus $sqrt(w_0 \( i \) w_1 \( j \)) \| delta
    A \( i \, j \) \|$. The adjoint entry in $R_1 = \[ W_1 med W_0^(*) \]$ instead has row and column bounds
    $sqrt(w_1 \( j \)) \( Y + Q \)$ and $sqrt(w_0 \( i \)) X$. The star $R_2$ is unchanged. Lemma 9 therefore gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ \| Delta e_0 \| + \| Delta e_1 \| lt.eq C sum_(i \, j) w_0 \( i \) w_1 \( j \) \| delta
     A \( i \, j \) \| \( 2 X Y + H Y + Q X \) . $ <eq:switch-entry-bound>]
  The measure $h^(- 2) w_0 \( i \) w_1 \( j \) thin upright(d) pi_0$ is a probability measure.
    Under it, $p_0 \, p_1$ are independent normals with means $u_i \, u_j$ and variances $sigma_0 \, sigma_1$,
    while $p_2 = - p_0 - p_1$. Adding Gaussian variances gives
  $ bb(E) w_0 \( m \) & = h g_(2 sigma_0) \( u_m - u_i \) \,\
bb(E) w_1 \( m \) & = h g_(2 sigma_1) \( u_m - u_j \) \,\
bb(E) w_2 \( m \) & = h g_(sigma_0 + sigma_1 + sigma_2) \( u_m + u_i + u_j \) . $
  Extend all arrays by zero to $bb(Z)^2$. Lemma 4 bounds $bb(E) X^2 \, bb(E) Y^2 \, bb(E) H^2 \,
    bb(E) Q^2$ by constant multiples of, respectively,
  $ X_(*)^2 \( i \, j \) & = M_(bb(Z)) \( \| A_0 \( i \, dot.op \) \|^2 \) \( j \) \, & Y_(*)^2 \( i \, j \) & =
    M_(bb(Z)) \( \| A_0 \( dot.op \, j \) \|^2 \) \( i \) \,\
H_(*)^2 \( i \, j \) & = M_(bb(Z)) \( \| A_2 \( dot.op \, i \) \|^2 \) \( - i - j \) \, & Q_(*)^2 \( i \, j \) & =
  M_(bb(Z)) \( \| A_1 \( j \, dot.op \) \|^2 \) \( - i - j \) . $
  All these majorants are independent of the switch scale. Cauchy–Schwarz under the probability measure controls
    the three products in (5.5). Their square-root majorants have $L^3 \( bb(Z)^2 \, h^2 \)$ norms at most $C
    n_0 \, C n_0 \, C n_2 \, C n_1$. This follows from the $L^(3 \/ 2)$ line maximal inequality,
    applied on slices; the changes $j mapsto - i - j$ or $i mapsto - i - j$ are bijections on the relevant slices.
  Integrate (5.5), sum the jumps using (5.3), and apply Hölder on the grid. The result is
  $ sum_tau lr(|Delta sum_v J_v \( 0 \, tau \)|) lt.eq C n #scale(x: 120%, y: 120%)[\(] n_0^3 +
    n_0^2 \( n_1 + n_2 \) #scale(x: 120%, y: 120%)[\)] . $
  Finally integrate (4.8) between consecutive switches. The resulting sum is bounded by the initial energy plus
    the sum of absolute jumps, after discarding the nonnegative terminal energy.
    Lemma 13 bounds the initial energy by $C sum_v n_v^3$. This proves (5.4). ◻
]

=== 5.2 From the energy to the smooth kernel <from-the-energy-to-the-smooth-kernel>

#proof[
  Put $lambda = 11 \/ 10$ and use base variances $lambda s$ at all vertices.
    In Lemma 10, insert the diagonal matrix with entries $k_s \( u_i - p_v \) \/
    g_(lambda s) \( u_i - p_v \)$ at vertex $v$. It is Hermitian and uniformly bounded:
    the polynomial factor in $k_s$ is absorbed by the extra Gaussian decay relative to $g_(lambda s)$.
  For the cost at vertex $v$, narrow just its row variance to $s$.
    Write $T_v^(upright(b))$ for the base Gram and $T_v^(upright(n))$ for the narrowed-row Gram.
    Directly from the densities,
  $ \( R_v^(upright(b)) \)^(*) D_v R_v^(upright(b)) = sqrt(s) thin U_v^(upright(n)) \, wide T_v^(upright(n)) lt.eq
    sqrt(lambda) thin T_v^(upright(b)) . $
  Invertible row scaling preserves the support. Lemma 6 therefore bounds the base cost by $C s V_v^(upright(n))$.
    The narrowed variances are one of the permutations allowed in Lemma 16.
  Integrate the mixed trace inequality over base centers in $Pi_0$ and over $s$ with measure $thin upright(d) s \/
    s$. Its right side is bounded by (5.4). On the left, the density at each vertex is now $h
    k_s \( u_i - p_v \)$. Integration over the center plane convolves the three windows, giving
  $ h^3 sum_(i \, j \, l) A_0 \( i \, j \) A_1 \( j \, l \) A_2 \( l \, i \)
    sum_(upright("chosen at ") \( i \, j \)) beta thin I_(epsilon \, R) \( u_i + u_j + u_l \) . $
  All signed integrals here are absolutely convergent for fixed arrays on the compact positive scale interval.
  If the original norms are nonzero, apply this bound to arrays normalized to have norms $n^(- 1 \/ 2) \, 1 \, 1$.
    Its right side is bounded by an absolute constant, since $n \( n^(- 3 \/ 2) + 2 n^(- 1) \)$ is bounded.
    Rescaling gives $C sqrt(n) product_v n_v$. The zero-norm case is immediate.
    The Riemann passage described in Section 2 now proves the proposition.
    The finitely many endpoints are fixed before the mesh tends to zero, so its scale restriction causes no loss. ◻
]

=== 5.3 The hard endpoint errors <the-hard-endpoint-errors>

The smooth annuli differ from the hard Hilbert annuli by a difference of two localized odd kernels.
  We record the exact identity because the next two sections must estimate their sum,
  rather than pay a constant separately for each of the up to $2 n$ endpoints.

Put

$ psi = k_1 * k_1 * k_1 = - g'''_3 \, wide P \( v \) = 2 integral_0^v psi \( z \) thin upright(d) z
  quad \( v gt.eq 0 \) \, wide c_0 = P \( oo \) = 2 g''_3 \( 0 \) eq.not 0 . $

The function $P$ has a smooth even extension and vanishes to second order at zero. For $rho > 0$ define

#[#set math.equation(numbering: n => "(5.6)")
 $ E_rho \( t \) = frac(P \( \| t \| \/ rho \) - c_0 upright(bold(1))_({ \| t \| > rho }), t) \, $ <eq:endpoint-kernel>]

with the continuous value zero at $t = 0$. Gaussian scaling and the substitution $z = \| t \| \/
  sqrt(s)$ in (5.1) yield, away from endpoint values,

#[#set math.equation(numbering: n => "(5.7)")
 $ I_(epsilon \, R) \( t \) = frac(P \( \| t \| \/ epsilon \) - P \( \| t \| \/ R \), t) = c_0 /
   t upright(bold(1))_({ epsilon < \| t \| < R }) + E_epsilon \( t \) - E_R \( t \) . $ <eq:hard-smooth>]

Here $k_1 = - g'_1$, so convolution gives $psi = - g'''_3$;
  integrating this derivative gives the stated value of $c_0$.
  Each $E_rho$ is an odd dilate of a kernel with Gaussian decay and two jumps.
  The next section proves a frequency-block estimate that can accommodate many such jumps without a linear loss in
  their number.

== 6 A uniform frequency-block estimate <sec:frequency>

The rough kernels arising from hard truncation will be decomposed into frequency blocks.
  The estimate in this section permits their coefficients to depend on the output point and on frequency.
  Its decisive hypothesis is a pointwise square-sum bound over scales and frequencies;
  no sum of frequency suprema is required.

Fix $q > 0$, let $D gt.eq 1$, and let $Xi_D$ be a measurable subset of $\[ - 2 D \, 2 D \]$,
  equipped with the measure $thin upright(d) gamma \( xi \) = thin upright(d) xi \/ D$.
  Thus $gamma \( Xi_D \) lt.eq 4$. Define

#[#set math.equation(numbering: n => "(6.1)")
 $ ell_xi \( z \) = D^(- 1) frac(thin upright(d), thin upright(d) z) #scale(x: 120%, y: 120%)[\(] g_q \( z \)
   e^(i xi z) #scale(x: 120%, y: 120%)[\)] \, wide H_xi = ell_xi * ell_xi * ell_xi . $ <eq:frequency-windows>]

The parameters $q \, D$ are suppressed in this notation. Constants below may depend on $q$, but not on $D$.

#thm([Proposition 6.1.])[
  (Frequency-block estimate).  #emph[Let $cal(I) subset bb(Z)$ be finite and nonempty, and set $L_k = 2^k$.
    Let $A_0 \, A_1 \, A_2$ be finite arrays on the lattice $u_i = i h$,
    with the norms $n_v$ defined in the heat-flow preliminaries.
    Suppose that measurable coefficients $mu_(i j \, k) : Xi_D arrow.r bb(C)$ satisfy
#[#set math.equation(numbering: n => "(6.2)")
 $ \| mu_(i j \, k) \( xi \) \| lt.eq C_1 \, wide sum_(k in cal(I)) integral_(Xi_D) \| mu_(i j \, k) \( xi \) \|^2
   thin thin upright(d) gamma \( xi \) lt.eq C_1^2 $ <eq:frequency-coefficient-condition>]

 for every output index pair $\( i \, j \)$, with the first inequality holding almost everywhere. If
#[#set math.equation(numbering: n => "(6.3)")
 $ h^2 lt.eq frac(q min_(k in cal(I)) L_k^2, 16 D^2) \, $ <eq:frequency-mesh>]

 then
#[#set math.equation(numbering: n => "(6.4)")
 $
   lr(|h^3 integral_(Xi_D) sum_(k in cal(I)) sum_(i \, j \, l) A_0 \( i \, j \) mu_(i j \, k) \( xi \) A_1 \( j \,
   l \) A_2 \( l \, i \) "Dil"_(L_k) H_xi \( u_i + u_j + u_l \) thin thin upright(d) gamma \( xi \)|) lt.eq
   C \( q \, C_1 \) product_(v = 0)^2 n_v . $ <eq:frequency-finite-estimate>]

]
] <prop:frequency-block>

There are two reasons for refining one Gaussian variance in the proof.
  First, a window oscillating at frequency $D$ becomes an average of score insertions at variance comparable to
  $D^(- 2) s$. Second, the boundary energy produced by changing the output array can still be estimated uniformly
  at this small variance. More precisely, the refined row scores will be controlled by the heat identity through
  single-edge energies and the changes of star energy at slab boundaries.
  Such a change contains the square of the changing edge norm times the norm of the unchanged edge.
  We isolate a uniform estimate for that mixed term before beginning the main proof.

#thm([Lemma 6.2.])[
  (A uniform mixed boundary estimate).  #emph[Fix distinct vertices $v \, w in { 0 \, 1 }$, so that ${ v \, w } =
    { 0 \, 1 }$. Let the edge joining $v \, w$ have array $B$,
    indexed in the original endpoint order $\( 0 \, 1 \)$, and let the edge joining $v \, 2$ have array $E$,
    indexed in the order $\( v \, 2 \)$.
    Use variances $\( sigma_v \, sigma_w \, sigma_2 \) = \( theta s \, s \, s \)$, where $0 < theta lt.eq
    1 \/ 16$ and $h^2 lt.eq theta s$. Write $thin upright(d) nu_s \( d \) =
    g_(\( 1 - theta \) s) \( d \) thin thin upright(d) d$. There is a nonnegative array $cal(H)_E \( i \, j \)$,
    independent of $s \, theta$, such that
#[#set math.equation(numbering: n => "(6.5)")
 $ & integral_(bb(R)) integral_(Pi_d) parallel C_(v \, w) parallel_(upright("HS"))^2 parallel C_(v \, 2)
   parallel_(upright("HS")) thin thin upright(d) pi_d thin thin upright(d) nu_s \( d \) lt.eq
   C sum_(i \, j) h^2 \| B \( i \, j \) \|^2 cal(H)_E \( i \, j \) \,\
 & (sum_(i \, j) h^2 cal(H)_E \( i \, j \)^3)^(1 \/ 3) lt.eq
   C (sum_(m \, l) h^2 \| E \( m \, l \) \|^3)^(1 \/ 3) . $ <eq:frequency-boundary-mixed>]

 Here $\( i \, j \)$ are always in the original order of the endpoints of edge $0$; $i_v \,
   i_w$ denote the same two indices in the order $\( v \, w \)$.
   The input arrays $B \, E$ are extended by zero to $bb(Z)^2$.]
] <lem:frequency-boundary>

#proof[
  Expand the square of the first Hilbert–Schmidt norm. For each pair $\( i \, j \)$, the measure
  $ h^(- 2) w_v \( i_v \) w_w \( i_w \) thin thin upright(d) pi_d thin thin upright(d) nu_s \( d \) $
  is a probability measure. Indeed, with $p_v \, p_w$ as the free coordinates on $Pi_d$, it makes $p_v \, p_w \,
    d$ independent normal variables with respective means $u_(i_v) \, u_(i_w) \, 0$ and variances $theta s \,
    s \, \( 1 - theta \) s$. The remaining center is $p_2 = d - p_v - p_w$.
  Under this probability measure, the expectation of $h^(- 2) w_v \( m \)
    w_2 \( l \)$ is a bivariate Gaussian density, evaluated at $\( u_m \, u_l \)$.
    Its mean is $\( u_(i_v) \, - u_(i_v) - u_(i_w) \)$, and its covariance matrix is
  $ s mat(delim: "(", 2 theta, - theta; - theta, 3) . $
  Call this covariance matrix $Sigma$. The bounds $Sigma lt.eq 4 s "diag" \( theta \, 1 \)$ and $det Sigma =
    theta \( 6 - theta \) s^2$ show, directly from the Gaussian density formula, that
  #[#set math.equation(numbering: n => "(6.6)")
   $ bb(E) \[ w_v \( m \) w_2 \( l \) \] lt.eq C h^2 g_(C' theta s) \( u_m - u_(i_v) \)
     g_(C' s) \( u_l + u_(i_v) + u_(i_w) \) \, $ <eq:frequency-covariance-domination>]
  where $C$ is absolute and one may take $C' = 4$.
  Let $M_(bb(Z))^(\( 1 \))$ and $M_(bb(Z))^(\( 2 \))$ be the discrete line maximal operators in the two
    coordinates. By Lemma 4, we can take
  #[#set math.equation(numbering: n => "(6.7)")
   $ cal(H)_E \( i \, j \)^2 = C #scale(x: 120%, y: 120%)[\(] M_(bb(Z))^(\( 1 \)) M_(bb(Z))^(\( 2 \)) \| E \|^2
     #scale(x: 120%, y: 120%)[\)] \( i_v \, - i_v - i_w \) . $ <eq:frequency-boundary-majorant>]
  In fact, (6.6) and $h^2 lt.eq theta s$ show that $bb(E) parallel C_(v \, 2) parallel_(upright("HS"))^2 lt.eq
    cal(H)_E \( i \, j \)^2$. Cauchy–Schwarz under this probability measure now proves (6.5).
    The map $\( i \, j \) mapsto \( i_v \, - i_v - i_w \)$ is a bijection of $bb(Z)^2$.
    The $ell^(3 \/ 2)$ bounds for the two line maximal operators, applied to $\| E \|^2$, prove (6.5). ◻
]

#proof[
  We may discard a common null set of frequencies so that all pointwise bounds in (6.2) hold. Set
  #[#set math.equation(numbering: n => "(6.8)")
   $ B_(0 \, k)^xi \( i \, j \) = A_0 \( i \, j \) mu_(i j \, k) \( xi \) \, wide a_k = q L_k^2 \, wide theta =
     frac(1, 16 D^2) . $ <eq:frequency-slabs>]
  For each $xi$, use $B_(0 \, k)^xi$ on the open slab $2 a_k < s < 3 a_k$,
    and use the zero array on edge $0$ outside these slabs. The slabs are pairwise disjoint because $a_(k + 1) =
    4 a_k$. The other two arrays remain $A_1 \, A_2$ throughout. All scale integrals below are over
  $ \[ s_(-) \, s_(+) \] = \[ min_(k in cal(I)) a_k \, 4 max_(k in cal(I)) a_k \] . $
  The mesh hypothesis gives $h^2 lt.eq theta s$ on this entire interval.
  We first turn the oscillatory windows into refined row scores.
    We then bound the integrated row scores by telescoping the star energies, using Lemma 18 at every slab boundary.
  ===== 6.1 Refining a row variance. <refining-a-row-variance.>
  Fix a slab, put $L = L_k$, $a = a_k$, and $omega = xi \/ L$. The window at each vertex is
  #[#set math.equation(numbering: n => "(6.9)")
   $ f_(xi \, k) \( u \) := "Dil"_L ell_xi \( u \) = L / D frac(thin upright(d), thin upright(d) u)
     #scale(x: 120%, y: 120%)[\(] g_a \( u \) e^(i omega u) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:frequency-scaled-window>]
  Initially give all three vertices the variance $s$. The diagonal insertion with entries
    $f_(xi \, k) \( u_i - p_v \) \/ g_s \( u_i - p_v \)$ has operator norm at most $C \( q \)$,
    uniformly on $2 a < s < 3 a$. Indeed, $\| L omega \/ D \| lt.eq 2$,
    and the remaining factor is bounded using Gaussian decay in $g_a \/ g_s$.
    Split this diagonal into its real and imaginary parts before applying Lemma 10.
    The resulting eight terms involve only Hermitian insertions of uniformly bounded norm.
  Consider the cost belonging to the row star $R_v$. Replace its row variance $s$ by $b' = theta s$,
    leave both column variances equal to $s$, and shift the row center from $p_v$ to $p_v + d$.
    Denote the refined Gram and score insertion by $T_v^d$ and $U_v^d$. Addition of Gaussian variances gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ T_v = integral_(bb(R)) T_v^d thin thin upright(d) nu_s \( d \) \, wide thin upright(d) nu_s \( d \) =
     g_(s - b') \( d \) thin thin upright(d) d . $ <eq:frequency-gram-average>]
  All these Grams have a common support: changing a strictly positive row density amounts to invertible row
    scaling and leaves the kernel of the row matrix unchanged.
  To represent the inserted Gram in the same way, put $omega' = a omega \/ \( a - b' \)$.
    Since $b' < a \/ 2$, completing the square gives the exact identity
  #[#set math.equation(numbering: n => "(6.11)")
   $ g_a \( u \) e^(i omega u) = exp #h(-0.16667em) (frac(omega^2 a b', 2 \( a - b' \))) integral_(bb(R))
     g_(b') \( u - d \) e^(i omega' d) g_(a - b') \( d \) thin thin upright(d) d . $ <eq:frequency-modulated-gaussian>]
  The exponential prefactor is at most $C \( q \)$, because $omega^2 b' lt.eq C \( q \)$. Also
  $ g_(a - b') \( d \) lt.eq C g_(s - b') \( d \) \, wide L / D lt.eq C \( q \) sqrt(theta s) . $
  Differentiate (6.11) in $u$. The derivative of the first Gaussian supplies the negative refined row score
    $- \( u - d \) \/ b'$. Consequently, for either the real or the imaginary diagonal insertion,
    its inserted Gram $K_v$ has the form
  $ K_v = integral_(bb(R)) alpha \( d \) U_v^d thin thin upright(d) nu_s \( d \) \, wide alpha \( d \) =
    "Re" c \( d \) quad upright("or") quad "Im" c \( d \) \, $
  where the scalar coefficient is explicitly
  $ c \( d \) = - L / D exp #h(-0.16667em) (frac(omega^2 a b', 2 \( a - b' \))) e^(i omega' d)
    frac(g_(a - b') \( d \), g_(s - b') \( d \)) . $
  The preceding bounds give $\| alpha \( d \) \| lt.eq C \( q \) sqrt(theta s)$.
    The averaged matrices are integrable, since the finite-array Gaussian weights dominate the polynomial score
    factors. By (6.10), Lemma 8, and the quadratic homogeneity of $b_T$ in its second argument,
  #[#set math.equation(numbering: n => "(6.12)")
   $ b_(T_v) \( K_v \) lt.eq C \( q \) theta s integral_(bb(R))
     V_v \( p_0 \, dots.h \, p_v + d \, dots.h \, p_2 \; s \) thin thin upright(d) nu_s \( d \) .
     $ <eq:frequency-score-refinement>]
  The cost on the right uses variances
  #[#set math.equation(numbering: n => "(6.13)")
   $ sigma_v = theta s \, wide sigma_w = s quad \( w eq.not v \) . $ <eq:frequency-anisotropic-variances>]
  Thus the factor $theta$ in the refined score is gained at exactly the scale needed to accommodate the oscillation.
  ===== 6.2 Integrated refined scores. <integrated-refined-scores.>
  Fix $v$ and use (6.13) for the rest of this part of the proof.
    All stars, energies, and costs refer to the slab-dependent edge $0$ just defined.
    Dependence on $xi$ is suppressed until frequency integration is needed. For a center-dependent cost $Q$, write
  $ tilde(Q) \( s \) = integral_(bb(R)) integral_(Pi_d) Q \( p \, s \) thin thin upright(d) pi_d thin thin
    upright(d) nu_s \( d \) \, wide tilde(J)_v \( s \) = integral_(bb(R)) J_v \( d \, s \) thin thin upright(d)
    nu_s \( d \) . $
  On each open interval where the arrays are fixed, the heat identities (4.5) give
  #[#set math.equation(numbering: n => "(6.14)")
   $ 2 partial_s tilde(J)_v = 3 tilde(Z)_v - theta tilde(V)_v -
     sum_(w eq.not v) tilde(Y)_(v \, w) . $ <eq:frequency-averaged-heat>]
  Here the coefficient $3$ has a useful interpretation. The original plane second derivative has coefficient $2 +
    theta$. Differentiating $nu_s$, applying its heat equation, and integrating twice by parts adds $1 - theta$.
    The second heat identity identifies the averaged plane second derivative with $tilde(Z)_v$.
  For fixed arrays on a compact positive scale interval, Lemma 11 bounds the plane integrals of the energies,
    costs, and relevant absolute derivatives by polynomials in $\| d \|$.
    The density $nu_s$ and its derivatives have Gaussian decay.
    These bounds justify differentiation under the integral and the two integrations by parts in $d$,
    and give the required one-sided limits at slab boundaries.
    Their constants may depend on the mesh and $theta$; they justify the identities and do not enter the estimates.
  The metric Cauchy–Schwarz inequality gives $2 Z_v lt.eq sum_(w eq.not v) Y_(v \, w)$. Hence
  #[#set math.equation(numbering: n => "(6.15)")
   $ theta tilde(V)_v lt.eq - 2 partial_s tilde(J)_v + 1 / 2 sum_(w eq.not v) tilde(Y)_(v \, w) .
     $ <eq:frequency-score-differential>]
  The column costs in this inequality can be paid for by individual edges.
    Indeed, $S_v gt.eq C_(v \, w) C_(v \, w)^(*)$, so the order comparison of Lemma 6 yields
  #[#set math.equation(numbering: n => "(6.16)")
   $ Y_(v \, w) lt.eq b_(C_(v \, w) C_(v \, w)^(*)) \( C_(v \, w) N_w C_(v \, w)^(*) \) = :
     Y_(v \, w)^e . $ <eq:frequency-edge-cost>]
  The inserted matrix is supported on the single-edge Gram,
    so this comparison also applies if the larger star Gram has a larger support.
    Define the integrated single-edge energy
  $ J_(v \, w)^e \( s \) = integral.double_(bb(R)^2) Phi \( C_(v \, w) C_(v \, w)^(*) \) thin thin upright(d) p_v
    thin thin upright(d) p_w . $
  The integral of $Y_(v \, w)^e$ over $Pi_d$ is independent of $d$, because only the two endpoint centers occur.
    With just this edge present, the heat identities give
  #[#set math.equation(numbering: n => "(6.17)")
   $ - 2 partial_s J_(v \, w)^e \( s \) gt.eq integral.double_(bb(R)^2) Y_(v \, w)^e \( p \, s \) thin thin
     upright(d) p_v thin thin upright(d) p_w . $ <eq:frequency-edge-dissipation>]
  The coefficient of this column cost is $1$; the remaining row cost is nonnegative.
    Thus the estimate is independent of the small variance ratio $theta$.
  If the edge is unchanged throughout $\[ s_(-) \, s_(+) \]$,
    integration of (6.17) and Lemma 14 bound its total cost by $C \( n_1^3 + n_2^3 \)$.
    If it is edge $0$, apply the same argument separately on its slabs. The result is bounded by
  $ C sum_(k in cal(I)) sum_(i \, j) h^2 \| B_(0 \, k)^xi \( i \, j \) \|^3 . $
  After integration in $xi$, this is at most $C \( C_1 \) n_0^3$, since
  #[#set math.equation(numbering: n => "(6.18)")
   $ sum_k integral_(Xi_D) \| B_(0 \, k)^xi \( i \, j \) \|^3 thin thin upright(d) gamma lt.eq
     C_1 \| A_0 \( i \, j \) \|^3 sum_k integral_(Xi_D) \| mu_(i j \, k) \( xi \) \|^2 thin thin upright(d) gamma
     lt.eq C_1^3 \| A_0 \( i \, j \) \|^3 . $ <eq:frequency-cubic-summation>]
  We have therefore controlled all column terms in (6.15). The remaining issue is the boundary energy of the stars.
  ===== 6.3 Summing the slab boundaries. <summing-the-slab-boundaries.>
  Before the first slab, edge $0$ is zero. By Lemma 13, $tilde(J)_v \( s_(-) \) lt.eq C \( n_1^3 + n_2^3 \)$.
    The star at vertex $2$ has no jumps. For $v in { 0 \, 1 }$, let $w$ be the other vertex of edge $0$.
    At either boundary of a slab, write $C_(upright("sw")) = C_(v \, w)$ for the slab-side weighted block and
    $C_(upright("fix")) = C_(v \, 2)$ for the unchanged weighted block.
    The absolute change in the pointwise star energy is at most
  #[#set math.equation(numbering: n => "(6.19)")
   $ C #scale(x: 120%, y: 120%)[\(] parallel C_(upright("sw")) parallel_(upright("HS"))^3 +
     parallel C_(upright("sw")) parallel_(upright("HS"))^2 parallel C_(upright("fix")) parallel_(upright("HS"))
     #scale(x: 120%, y: 120%)[\)] . $ <eq:frequency-pointwise-jump>]
  To verify this bound,
    integrate the derivative of
    $Phi \( C_(upright("fix")) C_(upright("fix"))^(*) + t C_(upright("sw")) C_(upright("sw"))^(*) \)$ for $0 < t
    lt.eq 1$. Its support is fixed there, and the derivative is
  $ & 3 /
    2 "tr"
    #scale(x: 120%, y: 120%)[\(] \( C_(upright("fix")) C_(upright("fix"))^(*) + t C_(upright("sw"))
    C_(upright("sw"))^(*) \)^(1 \/ 2) C_(upright("sw")) C_(upright("sw"))^(*) #scale(x: 120%, y: 120%)[\)]\
 & wide lt.eq 3 / 2 #scale(x: 120%, y: 120%)[\(] parallel C_(upright("fix")) parallel_(upright("HS")) +
   parallel C_(upright("sw")) parallel_(upright("HS")) #scale(x: 120%, y: 120%)[\)] parallel C_(upright("sw"))
   parallel_(upright("HS"))^2 . $
  Continuity gives the endpoint at $t = 0$. Removing the edge has the same absolute change as adding it.
  The integrated cubic term in (6.19) is bounded by the cube of the norm of $B_(0 \, k)^xi$, by Lemma 13.
    Summing both boundaries of every slab and using (6.18) gives $C \( C_1 \) n_0^3$ after frequency integration.
  For the mixed term, let $A^(\( v \, 2 \))$ be the fixed unweighted array on the edge joining $v \, 2$,
    indexed in that order. Apply Lemma 18 with this array and denote its majorant by $cal(H)_v$.
    It is independent of $k \, xi \, s$, and its cube norm is at most $C \( n_1 + n_2 \)$.
    Both boundaries together consequently contribute at most a constant times
  $ & sum_(i \, j) h^2 \| A_0 \( i \, j \) \|^2 cal(H)_v \( i \, j \) sum_k integral_(Xi_D) \|
    mu_(i j \, k) \( xi \) \|^2 thin thin upright(d) gamma\
 & #h(25mm)  lt.eq C \( C_1 \) n_0^2 \( n_1 + n_2 \) \, $
  by (6.2) and Hölder’s inequality. This is the point at which averaging coefficient squares over frequency is
    essential. Taking a separate supremum in frequency for each scale would not give this bound.
  Integrate (6.15) on the intervals between consecutive boundaries and telescope.
    The final energy is nonnegative and may be discarded. The initial energy and the absolute jumps just
    estimated, together with the single-edge costs, give
  #[#set math.equation(numbering: n => "(6.20)")
   $ integral_(Xi_D) integral_(s_(-))^(s_(+)) theta tilde(V)_v \( s \) thin thin upright(d) s thin thin upright(d)
     gamma \( xi \) lt.eq C \( C_1 \) sum_(j = 0)^2 n_j^3 . $ <eq:frequency-integrated-score>]
  Here we absorbed $n_0^2 \( n_1 + n_2 \)$ by Young’s inequality.
    Values at the finitely many boundaries are immaterial. All integrands are measurable in $xi$:
    the arrays are measurable, and the finite-matrix energies and supported quadratic forms are Borel functions of
    their entries. The latter can also be obtained as limits of positive-definite regularizations.
    Thus every nonnegative frequency integration above is justified by Tonelli’s Theorem,
    without any regularity assumption on the coefficient functions beyond measurability.
  ===== 6.4 Recovering the frequency-block form. <recovering-the-frequency-block-form.>
  Return to the equal-variance stars and apply Lemma 10 to the real and imaginary parts of the three window
    insertions. Integrate the bound over base centers on $Pi_0$.
    Shifting the row center in (6.12) maps this plane to $Pi_d$;
    using the two column centers as free coordinates shows that its Jacobian is $1$.
    The integrated cost at vertex $v$ is therefore at most $C \( q \) theta s tilde(V)_v \( s \)$.
    Integrate over every slab with $thin upright(d) s \/ s$, and then over $Xi_D$ with $thin upright(d) gamma$.
    The sum of the resulting bounds is controlled by (6.20).
  On the other side, multiplying the three weighted windows in the trace and integrating the centers gives exactly
  $ h^3 sum_(i \, j \, l) B_(0 \, k)^xi \( i \, j \) A_1 \( j \, l \) A_2 \( l \, i \) "Dil"_(L_k)
    H_xi \( u_i + u_j + u_l \) . $
  This is the convolution identity on $Pi_0$: the three arguments of the windows sum to $u_i + u_j + u_l$.
    The expression is independent of $s$ within its slab, whose logarithmic length is $integral_(2 a_k)^(3 a_k)
    thin upright(d) s \/ s = log \( 3 \/ 2 \)$. All signed center integrations are absolutely convergent by
    Gaussian decay. We have proved (6.4) with its right side replaced by $C \( q \, C_1 \) sum_v n_v^3$.
  Finally, if all $n_v$ are nonzero, apply this estimate to $A_v \/ n_v$.
    The coefficients and mesh hypothesis are unchanged, and trilinearity gives the product bound claimed in the
    Proposition. If any norm is zero, the form is zero. ◻
]

#thm([Corollary 6.3.])[
  (Continuous frequency-block estimate).  #emph[Let $q \, D \, Xi_D \, cal(I)$ be as in Proposition 17.
    Suppose that $mu_(a \, b \, k) \( xi \)$ is constant in $\( a \, b \)$ on every cell of one finite rectangular
    partition, independent of $xi$ and common to all $k$. Suppose its values on these cells are bounded measurable
    functions of $xi$, and that
#[#set math.equation(numbering: n => "(6.21)")
 $ \| mu_(a \, b \, k) \( xi \) \| lt.eq C_1 \, wide sum_k integral_(Xi_D) \| mu_(a \, b \, k) \( xi \) \|^2 thin
   thin upright(d) gamma \( xi \) lt.eq C_1^2 . $ <eq:frequency-continuous-condition>]

 Define
#[#set math.equation(numbering: n => "(6.22)")
 $ cal(K)_(a \, b) \( t \) = integral_(Xi_D) sum_(k in cal(I)) mu_(a \, b \, k) \( xi \) "Dil"_(L_k) H_xi \( t \)
   thin thin upright(d) gamma \( xi \) . $ <eq:frequency-continuous-kernel>]

 Then, for complex $G_v in L^3 \( bb(R)^2 \)$,
#[#set math.equation(numbering: n => "(6.23)")
 $ \| Lambda_(cal(K)) \( G_0 \, G_1 \, G_2 \) \| lt.eq C \( q \, C_1 \) product_(v = 0)^2 parallel G_v
   parallel_3 . $ <eq:frequency-continuous-estimate>]

]
] <cor:frequency-continuum>

#proof[
  First take smooth compactly supported $G_v$. Within any fixed step choice,
    the kernel in (6.22) is continuous in $t$: the frequency block is bounded,
    the coefficients are bounded and measurable, and the Gaussian formulas supply a common majorant for dominated
    convergence. After performing the frequency integration, the trilinear integral is therefore the limit of its
    lattice Riemann sums. The finitely many rectangular step boundaries have measure zero.
    The mesh condition (6.3) holds for all sufficiently fine lattices,
    and the discrete norms converge to $parallel G_v parallel_3$. Proposition 17 proves (6.23) for these inputs.
  To pass to general $L^3$ inputs, note that for the fixed finite block and scale set there is an integrable
    majorant $k_(*) \( t \)$ with $\| cal(K)_(a \, b) \( t \) \| lt.eq k_(*) \( t \)$,
    uniformly in $\( a \, b \)$. One may take a constant times the finite sum of the dilates of
    $sup_(xi in Xi_D) \| H_xi \|$, which has Gaussian decay. For every integrable nonnegative $k$,
  $ integral.triple \| G_0 \( a \, b \) G_1 \( b \, c \) G_2 \( c \, a \) \| k \( a + b + c \) thin thin
    upright(d) a thin thin upright(d) b thin thin upright(d) c lt.eq
    parallel k parallel_1 product_v parallel G_v parallel_3 . $
  Indeed, set $t = a + b + c$, apply Hölder’s inequality in $\( a \, b \)$ for fixed $t$,
    and use the determinant-one changes of variables for the other two edge functions.
    Thus the defining integral is absolutely convergent and continuous in the three $L^3$ inputs.
    Smooth approximation completes the proof. The final constant comes from the Proposition and remains
    independent of $D$, the number of scales, and the particular step choices. ◻
]

== 7 Rough kernels and the annular endpoint errors <sec:rough>

The comparison (5.7) leaves one error kernel at each annular endpoint.
  Estimating these kernels separately would cost the number of endpoints.
  We instead collect endpoints at comparable scales. Disjointness of the annuli gives a Gaussian bound for each
  resulting kernel, independent of the number of its discontinuities.
  The frequency estimate from the preceding section then controls the groups with few discontinuities;
  the remaining groups are few enough to estimate pointwise.

=== 7.1 A pointwise Gaussian estimate <a-pointwise-gaussian-estimate>

For a locally integrable function on $bb(R)^2$, let $M_x$ and $M_y$ denote the centered Hardy–Littlewood maximal
  operators in the first and second coordinates. For $F \, G in L^3 \( bb(R)^2 \)$, put

#[#set math.equation(numbering: n => "(7.1)")
 $ cal(M)_(F \, G) \( x \, y \) = #scale(x: 120%, y: 120%)[\(] M_x \( \| F \|^(5 \/ 2) \) \( x \, y \)
   #scale(x: 120%, y: 120%)[\)]^(2 \/ 5) #scale(x: 120%, y: 120%)[\(] M_y \( \| G \|^(5 \/ 2) \) \( x \, y \)
   #scale(x: 120%, y: 120%)[\)]^(2 \/ 5) . $ <eq:rough-maximal-envelope>]

The one-dimensional maximal inequality on $L^(6 \/ 5)$, followed by Hölder’s inequality on $bb(R)^2$, gives

#[#set math.equation(numbering: n => "(7.2)")
 $ parallel cal(M)_(F \, G) parallel_(3 \/ 2) lt.eq C parallel F parallel_3 parallel G parallel_3 .
   $ <eq:rough-maximal-norm>]

#thm([Lemma 7.1.])[
  (Gaussian envelope).  #emph[Suppose that $c > 0$ and that a measurable kernel $f$ satisfies $\| f \( z \) \|
    lt.eq e^(- c z^2) w \( z \)$, where $w gt.eq 0$ and $parallel w parallel_5 lt.eq delta$. Then, for every $L > 0$,
#[#set math.equation(numbering: n => "(7.3)")
 $ integral_(bb(R)) \| F \( x + t \, y \) G \( x \, y + t \) \| thin \| "Dil"_L f \( t \) \| thin thin upright(d)
   t lt.eq C_c delta thin cal(M)_(F \, G) \( x \, y \) $ <eq:gaussian-envelope>]

 at every point where the right side is finite. In particular, a bound $\| f \( z \) \| lt.eq
   A e^(- c z^2)$ gives (7.3) with $C_c delta$ replaced by $C_c A$.]
] <lem:gaussian-envelope>

#proof[
  After setting $t = L z$, apply Hölder’s inequality with exponents $5 \/ 2 \, 5 \/ 2 \, 5$ to
  $ \| F \( x + L z \, y \) \| e^(- c z^2 \/ 2) \, wide \| G \( x \, y + L z \) \| e^(- c z^2 \/ 2) \, wide
    w \( z \) . $
  The first resulting integral is $integral \| F \( x + L z \, y \) \|^(5 \/ 2) e^(- 5 c z^2 \/ 4) thin thin
    upright(d) z$. Splitting $bb(R)$ into $\| z \| lt.eq 1$ and $2^j < \| z \| lt.eq
    2^(j + 1)$ bounds it by $C_c M_x \( \| F \|^(5 \/ 2) \) \( x \, y \)$, uniformly in $L$.
    The second integral has the corresponding bound with $G$ and $M_y$. This proves the first assertion.
    For the last assertion, retain half the Gaussian decay in $w$, whose $L^5$ norm is then at most $C_c A$. ◻
]

We will use this estimate inside the triangular form. Recall that $G_1 \( b \, c \) =
  F \( b + c \, - b \)$ and $G_2 \( c \, a \) = G \( - a \, c + a \)$,
  and that these changes of coordinates preserve the $L^3$ norms.
  With $t = a + b + c$, the absolute value of the $c$-integral is bounded by $C_c delta
  cal(M)_(F \, G) \( - a \, - b \)$. Consequently, integrating against $\| G_0 \( a \, b \) \|$ costs at most $C_c
  delta product_(v = 0)^2 parallel G_v parallel_3$. The kernel, its dilation,
  and its envelope may depend on $\( a \, b \)$: the same assertion holds whenever the bound for $delta$ is uniform.

=== 7.2 Families with a controlled number of jumps <families-with-a-controlled-number-of-jumps>

The next proposition turns the frequency estimate into an estimate for piecewise smooth kernels.
  The pointwise bound on the number of jumps at one scale and the bound on their total number play different
  roles: they will give, respectively, the uniform bound and the square-sum bound for the frequency coefficients.

#thm([Proposition 7.2.])[
  (Rough kernel families).  #emph[Fix $A gt.eq 1$ and $c > 0$.
    Let $n gt.eq 1$, and let $cal(I) subset bb(Z)$ be finite.
    For $k in cal(I)$, let $K_(a \, b \, k) : bb(R) arrow.r bb(C)$ and $m_(a \, b \, k) in { 0 \, 1 \, 2 \,
    dots.h }$ be finite-valued step choices in $\( a \, b \)$, with $K_(a \, b \, k) =
    0$ whenever $m_(a \, b \, k) = 0$. When $m_(a \, b \, k) gt.eq 1$,
    suppose that $K_(a \, b \, k)$ is $C^1$ outside a set of at most $A m_(a \, b \, k)$ points and that,
    outside that set,
#[#set math.equation(numbering: n => "(7.4)")
 $ \| K_(a \, b \, k) \( z \) \| + \| K'_(a \, b \, k) \( z \) \| lt.eq A e^(- c z^2) . $ <eq:rough-family-decay>]

 Assume also that
#[#set math.equation(numbering: n => "(7.5)")
 $ integral_(bb(R)) z^ell K_(a \, b \, k) \( z \) thin thin upright(d) z = 0 quad \( ell = 0 \, 1 \, 2 \) \, wide
   sum_(k in cal(I)) m_(a \, b \, k) lt.eq A n \, quad m_(a \, b \, k) lt.eq A sqrt(n) . $ <eq:rough-family-hypotheses>]

 For
$ cal(K)_(a \, b) \( t \) = sum_(k in cal(I)) "Dil"_(2^k) K_(a \, b \, k) \( t \) \, $

 and smooth compactly supported $G_0 \, G_1 \, G_2$, one has
#[#set math.equation(numbering: n => "(7.6)")
 $ \| Lambda_(cal(K)) \( G_0 \, G_1 \, G_2 \) \| lt.eq C_(A \, c) sqrt(n) log \( 2 + n \) product_(v = 0)^2
   parallel G_v parallel_3 . $ <eq:rough-family-bound>]

]
] <prop:rough-family>

#proof[
  We first obtain Fourier estimates for a single kernel $K = K_(a \, b \, k)$; write $m = m_(a \, b \, k)$.
    All constants below depend only on $A \, c$. There is nothing to prove for $m = 0$, so suppose that $m gt.eq 1$.
  ===== 7.2.1 A Gaussian-weighted primitive. <a-gaussian-weighted-primitive.>
  We seek a representation $K = \( g_(3 q) f \)'''$ for a suitable fixed $q$:
    the Fourier modes of $f$ then produce exactly the differentiated Gaussian windows controlled by Corollary 19. Define
  $ U \( z \) = 1 / 2 integral_(- oo)^z \( z - u \)^2 K \( u \) thin thin upright(d) u . $
  The three moment conditions imply, for $j = 0 \, 1 \, 2$,
  $ U^(\( j \)) \( z \) = - frac(1, \( 2 - j \) !) integral_z^oo \( z - u \)^(2 - j) K \( u \) thin thin
    upright(d) u . $
  Use the defining integral when $z lt.eq 0$ and this tail integral when $z gt.eq 0$.
    Gaussian tail estimates give $\| U^(\( j \)) \( z \) \| lt.eq C e^(- c_1 z^2)$ for $j = 0 \, 1 \, 2$,
    with $c_1 > 0$ fixed. Moreover, $U''' = K$ as a weak derivative.
    Choose $q > 0$ sufficiently large, depending only on $A \, c$, and put
  $ f \( z \) = frac(U \( z \), g_(3 q) \( z \)) . $
  The quotient and product rules, with a slight reduction in the Gaussian exponent, give
  #[#set math.equation(numbering: n => "(7.7)")
   $ \| f^(\( j \)) \( z \) \| lt.eq C e^(- c_2 z^2) quad \( 0 lt.eq j lt.eq 3 \) . $ <eq:rough-f-decay>]
  Here and below derivatives of order three are weak derivatives, or their almost-everywhere representatives.
    The functions $f \, f' \, f''$ are continuous. Between the exceptional points,
    the same calculation using $K'$ bounds the classical derivative of $f'''$ by $C e^(- c_2 z^2)$.
    Its jumps are bounded by $C$, and there are at most $A m$ of them. Thus, for $0 lt.eq j lt.eq 3$,
  #[#set math.equation(numbering: n => "(7.8)")
   $ parallel f^(\( j \)) parallel_oo lt.eq C \, wide "Var" \( f^(\( j \)) \) lt.eq C m . $ <eq:rough-f-bv>]
  The same bounds hold with zero right sides when $m = 0$.
  ===== 7.2.2 Fourier bounds. <fourier-bounds.>
  Use the normalization $hat(f) \( xi \) = \( 2 pi \)^(- 1) integral f \( z \) e^(- i xi z) thin thin upright(d) z$. Let
  $ Xi_1 = { xi : \| xi \| < 2 } \, wide Xi_D = { xi : D lt.eq \| xi \| < 2 D } quad \( D = 2 \, 4 \, 8 \, dots.h \) . $
  We claim that
  #[#set math.equation(numbering: n => "(7.9)")
   $ sup_(xi in Xi_D) \| D^3 hat(f) \( xi \) \| lt.eq frac(C m, D) \, wide
     integral_(Xi_D) \| D^3 hat(f) \( xi \) \|^2 thin thin upright(d) xi lt.eq
     frac(C m, D) . $ <eq:rough-fourier-bounds>]
  For $D gt.eq 2$, the distributional derivative of $f'''$ is a finite measure of total variation at most $C m$.
    Taking its Fourier transform gives $\| xi \|^4 \| hat(f) \( xi \) \| lt.eq C m$, proving the first bound.
    For the second, the translation inequality for functions of bounded variation gives
  $ parallel f''' \( thin dot.op + D^(- 1) \) - f''' parallel_1 lt.eq frac(C m, D) . $
  Indeed, integrate the absolute derivative measure over each traversed interval and apply Fubini’s theorem.
    By the uniform supremum bound in (7.8), the squared $L^2$ norm of this difference is also at most $C m \/ D$.
    Plancherel’s identity and $hat(f''') \( xi \) = \( i xi \)^3 hat(f) \( xi \)$ now yield the second bound,
    since $\| e^(i xi \/ D) - 1 \| gt.eq 2 sin \( 1 \/ 2 \)$ on $Xi_D$.
    When $D = 1$, both assertions follow from (7.7) and $m gt.eq 1$.
  ===== 7.2.3 A finite frequency cutoff. <a-finite-frequency-cutoff.>
  Choose $chi in C_c^oo \( bb(R) \)$ supported on $\[ - 2 \, 2 \]$ and equal to one on $\[ - 1 \, 1 \]$, and set
  $ P_(*) = \( 2 + n \)^8 \, wide hat(f_(*)) \( xi \) = hat(f) \( xi \) chi \( xi \/ P_(*) \) \, wide
    K_(*) = \( g_(3 q) f_(*) \)''' . $
  We show that this replacement has a summable pointwise error.
    Let $eta$ be the Schwartz convolution kernel of the multiplier $chi$, normalized so that $integral eta = 1$,
    and let $eta_(P_(*)) \( z \) = P_(*) eta \( P_(*) z \)$. For $0 lt.eq j lt.eq 3$, $f_(*)^(\( j \)) =
    f^(\( j \)) * eta_(P_(*))$. The translation inequality gives
  $ parallel f^(\( j \)) - f_(*)^(\( j \)) parallel_1 lt.eq
    "Var" \( f^(\( j \)) \) integral \| u \| thin \| eta_(P_(*)) \( u \) \| thin thin upright(d) u lt.eq
    frac(C m, P_(*)) . $
  Their supremum norms are uniformly bounded, by (7.8) and the $L^1$ norm of $eta$. Interpolation therefore gives
  $ parallel f^(\( j \)) - f_(*)^(\( j \)) parallel_5 lt.eq C \( m \/ P_(*) \)^(1 \/ 5) . $
  Since every derivative of $g_(3 q)$ is bounded by a constant times a slightly wider Gaussian,
    the product rule shows that
  #[#set math.equation(numbering: n => "(7.10)")
   $ \| K \( z \) - K_(*) \( z \) \| lt.eq e^(- c_3 z^2) w \( z \) \, wide parallel w parallel_5 lt.eq
     C \( m \/ P_(*) \)^(1 \/ 5) \, $ <eq:rough-cutoff-error>]
  for a nonnegative $w$. This calculation also holds for weak derivatives,
    so no additional terms occur at the jumps of $K$.
  Apply this construction separately to every $K_(a \, b \, k)$.
    By (7.5), $\( m_(a \, b \, k) \/ P_(*) \)^(1 \/ 5) lt.eq C \/ n$ whenever $m_(a \, b \, k) eq.not 0$,
    and at each $\( a \, b \)$ there are at most $A n$ such indices.
    Lemma 20 bounds the sum of all replacement errors pointwise by $C
    cal(M)_(F \, G) \( - a \, - b \)$ after integration in $c$.
    Their contribution to $Lambda_(cal(K))$ is consequently at most $C product_v parallel G_v parallel_3$.
  ===== 7.2.4 Applying the frequency estimate. <applying-the-frequency-estimate.>
  It remains to estimate the kernels $K_(*)$. For each dyadic $D$ use the kernels from Corollary 19, namely
  $ ell_xi \( z \) = D^(- 1) frac(thin upright(d), thin upright(d) z) #scale(x: 120%, y: 120%)[\(] g_q \( z \)
    e^(i xi z) #scale(x: 120%, y: 120%)[\)] \, wide H_xi = ell_xi * ell_xi * ell_xi . $
  Gaussian convolution and modulation give
  $ \( g_(3 q) \( z \) e^(i xi z) \)''' = D^3 H_xi \( z \) . $
  For the block $Xi_D$, the contribution to $K_(a \, b \, k \, *)$ is therefore
  $ integral_(Xi_D) c_(a \, b \, k) \( xi \) H_xi \( z \) thin thin upright(d) xi \, wide
    c_(a \, b \, k) \( xi \) = D^3 hat(f)_(a \, b \, k) \( xi \) chi \( xi \/ P_(*) \) . $
  Set $mu_(a \, b \, k) \( xi \) = D c_(a \, b \, k) \( xi \) \/ sqrt(n)$. The two estimates in (7.9) give precisely
  $ \| mu_(a \, b \, k) \( xi \) \| lt.eq frac(C m_(a \, b \, k), sqrt(n)) lt.eq C \, wide
    sum_k integral_(Xi_D) \| mu_(a \, b \, k) \( xi \) \|^2 frac(thin upright(d) xi, D) lt.eq
    C sum_k m_(a \, b \, k) / n lt.eq C . $
  All transformations were applied separately to finitely many kernel values.
    The coefficients $mu_(a \, b \, k)$ therefore remain step choices on a common finite rectangular refinement of
    the original partitions. The block kernel is $sqrt(n) integral_(Xi_D) mu_(a \, b \, k) \( xi \) H_xi thin thin
    upright(d) xi \/ D$. Thus Corollary 19, with measure $thin upright(d) xi \/ D$,
    bounds this block by $C sqrt(n) product_v parallel G_v parallel_3$.
    Only $O \( log \( 2 + n \) \)$ blocks meet the support of the cutoff.
    Summing their bounds and adding the replacement error proves (7.6). ◻
]

=== 7.3 Removing the first moment of an odd kernel <removing-the-first-moment-of-an-odd-kernel>

The endpoint kernels are odd but need not have vanishing first moment.
  A short dilation identity reduces them to the preceding proposition.

#thm([Corollary 7.3.])[
  (Odd kernel families).  #emph[Proposition 21 remains valid if the three moment conditions in (7.5) are replaced
    by the assumption that every $K_(a \, b \, k)$ is odd almost everywhere.]
] <cor:odd-family>

#proof[
  Choose a real, smooth, compactly supported odd function $phi$ with $integral z phi \( z \) thin thin upright(d)
    z = 1$. Put
  $ u_(a \, b \, k) = integral z K_(a \, b \, k) \( z \) thin thin upright(d) z . $
  These coefficients are uniformly bounded and vanish when $m_(a \, b \, k) = 0$.
    The kernels $K_(a \, b \, k) - u_(a \, b \, k) phi$ satisfy all three moment conditions and the other
    hypotheses of Proposition 21, with enlarged fixed constants and unchanged counts.
    It remains to bound the subtracted terms.
  Define $Psi = phi - 2^(- 1) "Dil"_2 phi$. Oddness gives its zeroth and second moments,
    and its first moment is $1 - 2^(- 1) dot.op 2 = 0$. For every integer $J gt.eq 1$,
  $ "Dil"_(2^k) phi = sum_(j = 0)^(J - 1) 2^(- j) "Dil"_(2^(k + j)) Psi + 2^(- J) "Dil"_(2^(k + J)) phi . $
  For each fixed $j$, apply Proposition 21 to the shifted scales $k +
    j$ with kernels $u_(a \, b \, k) Psi$ and the same shifted counts $m_(a \, b \, k)$.
    The constants are independent of $j$, and the outer coefficients $2^(- j)$ are summable.
    The remainder contributes at most $C 2^(- J) n product_v parallel G_v parallel_3$ by Lemma 20,
    since there are at most $A n$ nonzero counts at any output point. Letting $J arrow.r oo$ proves the claim. ◻
]

=== 7.4 Grouping the endpoint errors <grouping-the-endpoint-errors>

We now verify that the errors in (5.7) have the structure just proved. Recall

$ E_rho \( t \) = frac(P \( \| t \| \/ rho \) - c_0 upright(bold(1))_({ \| t \| > rho }), t) \, wide P \( v \) =
  2 integral_0^v psi \( u \) thin thin upright(d) u \, wide psi = - g'''_3 . $

We take the continuous extension at $t = 0$; values at the jump points do not affect any integral.

#thm([Proposition 7.4.])[
  (Endpoint errors).  #emph[At each $\( a \, b \)$, choose at most $n$ pairwise disjoint open radius intervals
    $\( epsilon_j \, R_j \)$ with $0 < epsilon_j < R_j < oo$,
    and complex coefficients $beta_j$ with $\| beta_j \| lt.eq 1$.
    Suppose that these choices form a finite-valued step function of $\( a \, b \)$. Then the kernel
$ cal(E)_(a \, b) \( t \) = sum_j beta_j #scale(x: 120%, y: 120%)[\(] E_(epsilon_j) \( t \) -
  E_(R_j) \( t \) #scale(x: 120%, y: 120%)[\)] $

 satisfies
#[#set math.equation(numbering: n => "(7.11)")
 $ \| Lambda_(cal(E)) \( G_0 \, G_1 \, G_2 \) \| lt.eq C sqrt(n) log \( 2 + n \) product_(v = 0)^2 parallel G_v
   parallel_3 $ <eq:endpoint-error-bound>]

 for smooth compactly supported inputs.]
] <prop:endpoint-errors>

#proof[
  Place each endpoint $rho$ in the unique half-open dyadic interval $\[ L_k \, 2 L_k \)$, where $L_k = 2^k$.
    Let $m_(a \, b \, k)$ count these endpoints, with multiplicity,
    and collect their contributions into $"Dil"_(L_k) K_(a \, b \, k)$.
    Thus $K_(a \, b \, k)$ is a linear combination of
  #[#set math.equation(numbering: n => "(7.12)")
   $ e_alpha \( z \) = frac(P \( \| z \| \/ alpha \) - c_0 upright(bold(1))_({ \| z \| > alpha }), z) \, wide
     1 lt.eq alpha < 2 \, $ <eq:dimensionless-endpoint>]
  with coefficient $beta_j$ at a lower endpoint and $- beta_j$ at its upper endpoint.
    Every kernel is odd, its possible jump points are the $plus.minus alpha$, and
  #[#set math.equation(numbering: n => "(7.13)")
   $ sum_k m_(a \, b \, k) lt.eq 2 n . $ <eq:endpoint-count>]
  The important assertion is the uniform bound
  #[#set math.equation(numbering: n => "(7.14)")
   $ \| K_(a \, b \, k) \( z \) \| + \| K'_(a \, b \, k) \( z \) \| lt.eq C e^(- c z^2) $ <eq:paired-endpoint-bound>]
  away from at most $2 m_(a \, b \, k)$ points, with constants independent of $m_(a \, b \, k)$.
    Fix $\( a \, b \)$ and $k$. Pair the two endpoints of every annulus whose endpoints both lie in
    $\[ L_k \, 2 L_k \)$. After scaling, its contribution is $beta_j \( e_(alpha_j) - e_(gamma_j) \)$ with $1
    lt.eq alpha_j < gamma_j < 2$. The intervals $\( alpha_j \, gamma_j \)$ are disjoint, so
  #[#set math.equation(numbering: n => "(7.15)")
   $ sum_j \( gamma_j - alpha_j \) lt.eq 1 . $ <eq:paired-length>]
  There are at most two unpaired endpoint contributions. Their intervals must satisfy, respectively,
  $ epsilon_j < L_k lt.eq R_j < 2 L_k \, wide upright("or") wide L_k lt.eq epsilon_j < 2 L_k lt.eq R_j . $
  Disjointness allows at most one interval of each type. An interval with $epsilon_j < L_k$ and $R_j gt.eq
    2 L_k$ has no endpoint in this group. Figure 1 illustrates the decomposition.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((1, -0.25), (8, 1.55), fill: rgb("#f2f2f2"), stroke: none)
  line((0, 0), (9, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((9, 0), [$rho$], anchor: "west", padding: 0.1176cm)
  line((1, -0.25), (1, 0.93), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((8, -0.25), (8, 0.93), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((1, 0), [$L_k$], anchor: "north", padding: 0.1176cm)
  content((8, 0), [$2L_k$], anchor: "north", padding: 0.1176cm)
  line((0.25, 0.55), (1.65, 0.55), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((2.3, 0.55), (3.55, 0.55), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((4.15, 0.55), (4.8, 0.55), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((5.45, 0.55), (6.4, 0.55), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((7.15, 0.55), (8.75, 0.55), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0.25, 0.55), radius: 0.05292, fill: black, stroke: none)
  circle((1.65, 0.55), radius: 0.05292, fill: black, stroke: none)
  circle((2.3, 0.55), radius: 0.05292, fill: black, stroke: none)
  circle((3.55, 0.55), radius: 0.05292, fill: black, stroke: none)
  circle((4.15, 0.55), radius: 0.05292, fill: black, stroke: none)
  circle((4.8, 0.55), radius: 0.05292, fill: black, stroke: none)
  circle((5.45, 0.55), radius: 0.05292, fill: black, stroke: none)
  circle((6.4, 0.55), radius: 0.05292, fill: black, stroke: none)
  circle((7.15, 0.55), radius: 0.05292, fill: black, stroke: none)
  circle((8.75, 0.55), radius: 0.05292, fill: black, stroke: none)
  line((2.3, 0.88), (6.4, 0.88), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.35, 1.04), [paired endpoints], anchor: "south", padding: 0.1176cm)
  content((1.05, 1.03), [#text(size: 9pt)[one unpaired]], anchor: "south", padding: 0.1176cm)
  content((7.95, 1.03), [#text(size: 9pt)[one unpaired]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 1: Endpoint grouping inside one dyadic interval. Intervals with both endpoints in the group contribute differences; their total length is at most $L_k$. Only intervals reaching a boundary of the dyadic interval can leave unpaired endpoints. The picture is schematic. ],
  ) <fig:endpoint-pairing>
  For $\| z \| lt.eq 3$, first consider the smooth term $s_alpha \( z \) =
    P \( \| z \| \/ alpha \) \/ z$ in (7.12). The function $P$ has a smooth even extension and vanishes
    quadratically at zero. Hence $s_alpha$ extends smoothly across $z = 0$, and
  $ sup_(\| z \| lt.eq 3\
1 lt.eq alpha lt.eq 2) #scale(x: 120%, y: 120%)[\(] \| partial_alpha s_alpha \( z \) \| + \| partial_z
  partial_alpha s_alpha \( z \) \| #scale(x: 120%, y: 120%)[\)] < oo . $
  The fundamental theorem of calculus in $alpha$, followed by (7.15),
    bounds the sum of the paired smooth terms and their $z$-derivatives independently of their number.
    For the hard terms, the paired difference is
  $ - c_0 / z #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ \| z \| > alpha_j }) -
    upright(bold(1))_({ \| z \| > gamma_j }) #scale(x: 120%, y: 120%)[\)] . $
  Away from endpoints, at most one such difference is nonzero at any fixed $\| z \|$,
    because the intervals $\( alpha_j \, gamma_j \)$ are disjoint.
    On its support $\| z \| gt.eq 1$, so its size and its classical derivative are uniformly bounded.
    The at most two unpaired terms have the same bounds on this compact range.
  For $\| z \| > 3$, all indicators in (7.12) equal one, and
  $ P \( \| z \| \/ alpha \) - c_0 = - 2 g''_3 \( \| z \| \/ alpha \) . $
  Consequently $e_alpha$, $partial_z e_alpha$, $partial_alpha e_alpha$,
    and $partial_z partial_alpha e_alpha$ are bounded by $C e^(- c z^2)$, uniformly for $1 lt.eq alpha lt.eq 2$.
    The paired-length estimate and the two unpaired contributions prove the same bound for their sum.
    Combining the compact and tail estimates proves (7.14).
  We finish by separating the groups according to their counts.
    At each output point, (7.13) implies that there are at most $2 sqrt(n)$ indices with $m_(a \, b \, k) >
    sqrt(n)$. The uniform Gaussian bound (7.14) and Lemma 20 bound all these groups together,
    after integration in $c$, by $C sqrt(n) cal(M)_(F \, G) \( - a \, - b \)$.
    Their trilinear contribution is at most $C sqrt(n) product_v parallel G_v parallel_3$.
  Set the kernels and counts of those groups to zero. The remaining family satisfies (7.4), has odd kernels,
    and has counts satisfying $sum_k m_(a \, b \, k) lt.eq 2 n$ and $m_(a \, b \, k) lt.eq sqrt(n)$.
    Corollary 22 applies and proves (7.11). Every grouping and deletion is made at the output point,
    so the proof imposes no common choice of endpoints or dyadic groups at different output points. ◻
]

== 8 From the count estimate to full variation <sec:completion>

We now assemble the smooth estimate and the endpoint estimate, remove the restrictions on choices and inputs,
  and sum the count bounds to obtain the full variation. No selection of a common partition for different output
  points is made in this argument.

#proof[
  First let $F \, G in C_c^oo \( bb(R)^2 \)$, use the pair maps (2.2), and take $G_0 in C_c^oo \( bb(R)^2 \)$.
    For step choices of disjoint annuli and coefficients, the identity (5.7) writes the hard linearization,
    multiplied by $c_0 eq.not 0$, as its smooth linearization minus its endpoint errors.
    Propositions 15 and 23 therefore give
  #[#set math.equation(numbering: n => "(8.1)")
   $
     lr(|integral.triple G_0 \( a \, b \) G_1 \( b \, c \) G_2 \( c \, a \) sum_j frac(beta_j upright(bold(1))_({
     epsilon_j < \| a + b + c \| < R_j }), a + b + c) thin upright(d) a thin upright(d) b thin upright(d) c|)
     lt.eq C sqrt(n) log \( 2 + n \) product_v parallel G_v parallel_3 . $ <eq:hard-linearized-bound>]
  The interval list and coefficients in the sum may vary with $\( a \, b \)$.
  Fix a finite menu of such choices. Its measurable choice sets can be approximated in measure on a compact set by
    finite unions of rectangles. To see this, approximate each of the finitely many sets using Lebesgue regularity
    and then refine all rectangle boundaries to one coordinate partition.
    Resolve overlaps by a fixed ordering of the menu; the total mismeasured set remains bounded by the sum of the
    approximation errors. Assign any menu item on the remaining cells.
    For the fixed menu, the annuli are uniformly bounded away from zero,
    and the integrals against the smooth inputs are bounded on the compact support needed for $G_0$.
    Consequently the corresponding linearized integrals converge.
    Thus (8.1) holds for arbitrary measurable choices from a fixed finite menu.
  Now fix a finite collection of lists of disjoint rational annuli, each of length at most $n$.
    The maximum of their sums of absolute increments is measurable.
    Choose a maximizing list measurably by resolving ties in a fixed order.
    For each of its increments choose a coefficient from ${ 1 \, - 1 \, i \, -
    i }$ whose product with that increment has real part at least half its modulus.
    These choices are again measurable and range over a finite menu.
    Testing (8.1) against nonnegative smooth compactly supported $G_0$ shows, by $L^3$ duality,
    that this finite maximum has $L^(3 \/ 2)$ norm at most $C sqrt(n) log \( 2 + n \) parallel F parallel_3
    parallel G parallel_3$. The reflection $\( x \, y \) = \( - a \, - b \)$ preserves that norm.
    Exhausting the countable family of all rational lists and applying monotone convergence proves the count bound
    for smooth inputs.
  For general complex $F \, G in L^3$, choose smooth compactly supported approximants $F_m \, G_m$.
    For every fixed annulus, bilinearity and (2.1) give convergence of $B_(epsilon \, R) \( F_m \, G_m \)$ in
    $L^(3 \/ 2)$. For a fixed finite collection of lists, the difference of the two finite maxima is bounded by a
    finite sum of such truncation differences. It therefore converges in $L^(3 \/ 2)$.
    Pass the estimate to the limit for this finite maximum, then exhaust the rational lists once more.
    Lemma 3 supplies the common representatives required in the definition of $cal(S)_n$. ◻
]

#proof[
  For any finite rational partition, arrange the absolute annular increments in nonincreasing order,
    denoting them by $d_1 gt.eq d_2 gt.eq dots.h.c gt.eq 0$. Whenever the index $2^j$ exists,
    the corresponding largest increments are a permissible list in $cal(S)_(2^j)$, so
  $ d_(2^j) lt.eq 2^(- j) cal(S)_(2^j) \( F \, G \) . $
  The group of indices $2^j lt.eq l < 2^(j + 1)$ has at most $2^j$ members.
    Bounding the full $ell^r$ norm by the sum of the group norms yields, uniformly in the chosen partition,
  #[#set math.equation(numbering: n => "(8.2)")
   $ V_r \( F \, G \) lt.eq sum_(j gt.eq 0) 2^(j \/ r - j) cal(S)_(2^j) \( F \, G \) quad
     upright("almost everywhere") . $ <eq:rank-variation>]
  Theorem 2 and Minkowski’s inequality now imply
  $ parallel V_r \( F \, G \) parallel_(3 \/ 2) lt.eq C parallel F parallel_3 parallel G parallel_3
    sum_(j gt.eq 0) \( 1 + j \) 2^(j \( 1 \/ r - 1 \/ 2 \)) . $
  The series converges for every $r > 2$. In particular, neither a bound on the number of increments nor a
    restriction to dyadic endpoints survives in the conclusion. ◻
]

== 9 Maximal estimates and principal values <sec:consequences>

The counting estimate already contains the maximal estimate, by taking a single annulus.
  We first record its continuity with respect to the inputs,
  then use that continuity to transfer joint principal-value convergence from smooth functions to all complex
  $L^3$ inputs. Throughout this section, write $p = 3 \/ 2$.

#thm([Corollary 9.1.])[
  (The hard maximal operator).  #emph[For complex $F \, G in L^3 \( bb(R)^2 \)$, define
$ B_(*) \( F \, G \) \( x \, y \) = sup_(0 < epsilon < R < oo) \| B_(epsilon \, R) \( F \, G \) \( x \, y \) \| $

 on the common full-measure set of Lemma 3, and set it to zero elsewhere.
   This function is measurable, and there is an absolute constant $C_M$ such that
#[#set math.equation(numbering: n => "(9.1)")
 $ parallel B_(*) \( F \, G \) parallel_p lt.eq C_M parallel F parallel_3 parallel G parallel_3 .
   $ <eq:hard-maximal-bound>]

 The supremum includes both finite hard truncation endpoints.
   Moreover, $B_(*)$ is a continuous map from $L^3 \( bb(R)^2 \) times
   L^3 \( bb(R)^2 \)$ to $L^p \( bb(R)^2 \)$ and is the unique continuous extension of its values on compactly
   supported smooth pairs.]
] <cor:maximal>

#proof[
  Endpoint continuity in Lemma 3 identifies the supremum with its restriction to rational endpoint pairs.
    Consequently it is measurable and equals $cal(S)_1 \( F \, G \)$.
    Theorem 2 gives (9.1), with its absolute factor $log 3$ absorbed into $C_M$.
  For two pairs of inputs, bilinearity of each finite truncation gives, almost everywhere,
  #[#set math.equation(numbering: n => "(9.2)")
   $ \| B_(*) \( F \, G \) - B_(*) \( f \, g \) \| lt.eq B_(*) \( F - f \, G \) +
     B_(*) \( f \, G - g \) . $ <eq:maximal-continuity>]
  Taking $L^p$ norms and using (9.1) proves continuity. Density of compactly supported smooth functions gives the
    asserted uniqueness. ◻
]

#thm([Corollary 9.2.])[
  (Joint bilinear principal values).  #emph[For every complex $F \, G in L^3 \( bb(R)^2 \)$, the joint limit
$ B \( F \, G \) = lim_(epsilon arrow.b 0\
R arrow.t oo) B_(epsilon \, R) \( F \, G \) $

 exists almost everywhere and in $L^p \( bb(R)^2 \)$, and
$ parallel B \( F \, G \) parallel_p lt.eq C_M parallel F parallel_3 parallel G parallel_3 . $

 More precisely, the entire tail converges in the maximal sense
#[#set math.equation(numbering: n => "(9.3)")
 $ ∥sup_(0 < epsilon < 1 \/ n\
R > n) \| B_(epsilon \, R) \( F \, G \) - B \( F \, G \) \|∥_p arrow.r 0 . $ <eq:maximal-tail-convergence>]

 The operator $B$ is the unique bounded complex bilinear extension of the principal-value operator on compactly
   supported smooth inputs.]
] <cor:bilinear-pv>

#proof[
  For compactly supported smooth $f \, g$ and fixed $\( x \, y \)$, put $h \( t \) =
    f \( x + t \, y \) g \( x \, y + t \)$. Then
  $ B_(epsilon \, R) \( f \, g \) \( x \, y \) = integral_epsilon^R frac(h \( t \) - h \( - t \), t) thin thin
    upright(d) t . $
  The numerator is $O \( t \)$ at zero and vanishes for large $t$, so the joint limit exists at every point.
  For general $F \, G$, define the tail oscillation
  $ Omega_n \( F \, G \) = sup_(0 < epsilon \, epsilon' < 1 \/ n\
R \, R' > n) \| B_(epsilon \, R) \( F \, G \) - B_(epsilon' \, R') \( F \, G \) \| . $
  These functions are measurable by endpoint continuity, decrease with $n$, and satisfy $0 lt.eq
    Omega_n \( F \, G \) lt.eq 2 B_(*) \( F \, G \)$. Choose compactly supported smooth $f_m arrow.r
    F$ and $g_m arrow.r G$ in $L^3$. Take a common full-measure set for the pairs $\( F \, G \)$,
    $\( f_m \, g_m \)$, $\( F - f_m \, G \)$, and $\( f_m \, G - g_m \)$, for all $m$. On this set, bilinearity gives
  $ Omega_n \( F \, G \) lt.eq Omega_n \( f_m \, g_m \) + 2 B_(*) \( F - f_m \, G \) + 2 B_(*) \( f_m \, G - g_m \) . $
  The smooth joint convergence implies $Omega_n \( f_m \, g_m \) arrow.r 0$ pointwise.
    Thus, writing $Omega_oo = lim_n Omega_n \( F \, G \)$, we obtain
  $ parallel Omega_oo parallel_p lt.eq 2 C_M #scale(x: 120%, y: 120%)[\(] parallel F -
    f_m parallel_3 parallel G parallel_3 + parallel f_m parallel_3 parallel G -
    g_m parallel_3 #scale(x: 120%, y: 120%)[\)] . $
  Letting $m arrow.r oo$ shows that $Omega_oo = 0$ almost everywhere.
    This is the joint Cauchy criterion for the two endpoints,
    and hence defines $B \( F \, G \)$ almost everywhere. Taking, for example,
    the cofinal sequence $\( epsilon \, R \) = \( 1 \/ \( 2 n \) \, 2 n \)$ shows that the limit is measurable;
    its magnitude is at most $B_(*) \( F \, G \)$. Define it to be zero on the remaining null set.
  Letting $\( epsilon' \, R' \)$ tend jointly to $\( 0 \, oo \)$ in the definition of $Omega_n$ gives
  $ sup_(0 < epsilon < 1 \/ n\
R > n) \| B_(epsilon \, R) \( F \, G \) - B \( F \, G \) \| lt.eq Omega_n \( F \, G \) . $
  The supremum is measurable, again by endpoint continuity.
    Dominated convergence applies because $Omega_n \( F \, G \) lt.eq 2 B_(*) \( F \, G \) in L^p$,
    proving (9.3) and therefore joint norm convergence. The norm bound follows from $\| B \( F \, G \) \| lt.eq
    B_(*) \( F \, G \)$. Passing to the $L^p$ limit in the bilinear identities for finite truncations proves
    complex bilinearity. The bound and density then prove uniqueness. ◻
]

=== 9.1 Flat and simplex scalar forms <flat-and-simplex-scalar-forms>

For complex $F_0 \, F_1 \, F_2 in L^3 \( bb(R)^2 \)$, let

$ cal(L)_(epsilon \, R) \( F_0 \, F_1 \, F_2 \) = integral.triple_(epsilon < \| t \| < R) F_0 \( x \, y \)
  F_1 \( x + t \, y \) F_2 \( x \, y + t \) thin thin upright(d) x thin thin upright(d) y thin
  frac(thin upright(d) t, t) . $

No input is conjugated in this scalar form.

#thm([Corollary 9.3.])[
  (Flat scalar principal values).  #emph[For every complex $L^3$ triple,
    each finite flat truncation is absolutely integrable, and
$ sup_(0 < epsilon < R < oo) \| cal(L)_(epsilon \, R) \( F_0 \, F_1 \, F_2 \) \| lt.eq
  C_M product_(v = 0)^2 parallel F_v parallel_3 . $

 Its joint scalar principal value exists and equals $integral_(bb(R)^2) F_0 B \( F_1 \, F_2 \)$.
   This limiting form is the unique bounded complex trilinear extension of its compactly supported smooth definition.]
] <cor:scalar-pv>

#proof[
  Hölder’s inequality in $\( x \, y \)$ bounds the integral of the absolute value by $2 log \( R \/ epsilon \)
    product_v parallel F_v parallel_3$. Fubini’s Theorem therefore identifies the finite form with $integral F_0
    B_(epsilon \, R) \( F_1 \, F_2 \)$. Corollary 24 gives its uniform bound,
    and pairing the joint $L^p$ limit in Corollary 25 with $F_0$ gives the scalar principal value.
    The limiting form is bounded and complex trilinear; density proves uniqueness. ◻
]

In simplex coordinates the corresponding scalar form is

$ Lambda_(epsilon \, R) \( G_0 \, G_1 \, G_2 \) = integral.triple_(epsilon < \| a + b + c \| < R) G_0 \( a \, b \)
  G_1 \( b \, c \) G_2 \( c \, a \) thin
  frac(thin upright(d) a thin thin upright(d) b thin thin upright(d) c, a + b + c) . $

The equivalence of the flat and simplex formulations, including their optimal constants,
  is described in #cite(label("KovacThieleZorinKranich2015")) Appendix B.1.
  We record the norm-preserving maps to track both hard endpoints and their joint limit.

#thm([Proposition 9.4.])[
  (Scalar equivalence).  #emph[For every complex $G_0 \, G_1 \, G_2 in L^3 \( bb(R)^2 \)$,
    each finite simplex truncation is absolutely integrable, and
$ sup_(0 < epsilon < R < oo) \| Lambda_(epsilon \, R) \( G_0 \, G_1 \, G_2 \) \| lt.eq
  C_M product_(v = 0)^2 parallel G_v parallel_3 . $

 Its joint scalar principal value exists and is the unique bounded complex trilinear extension of its compactly
   supported smooth definition. The optimal constants in the uniform finite flat and simplex scalar estimates are
   equal.]
] <prop:flat-equivalence>

#proof[
  Use the determinant-one change of variables
  $ x = - a \, wide y = - b \, wide t = a + b + c \, wide a = - x \, quad b = - y \, quad c = t + x + y . $
  For flat inputs set
  $ G_0 \( u \, v \) & = F_0 \( - u \, - v \) \,\
G_1 \( u \, v \) & = F_1 \( u + v \, - u \) \,\
G_2 \( u \, v \) & = F_2 \( - v \, u + v \) . $
  Each pair map has determinant one. The inverse formulas are
  $ F_0 \( r \, s \) & = G_0 \( - r \, - s \) \,\
F_1 \( r \, s \) & = G_1 \( - s \, r + s \) \,\
F_2 \( r \, s \) & = G_2 \( r + s \, - r \) . $
  These maps preserve $L^3$ norms, compact smoothness, and the Schwartz class.
    Direct substitution identifies both the integrands and the finite truncation regions.
    Absolute integrability, the uniform bound, and joint scalar convergence therefore follow from Corollary 26.
    The inverse maps realize every simplex triple, so the optimal constants are equal.
    Density proves uniqueness of the bounded trilinear extension. ◻
]

For completeness, let $C_S$ denote this common optimal scalar constant.
  It is also the optimal constant for the uniform family of individual bilinear bounds

$ parallel B_(epsilon \, R) \( F \, G \) parallel_p lt.eq C_S parallel F parallel_3 parallel G parallel_3 . $

Indeed, Hölder’s inequality gives one direction. For the other, if $U in L^p$ is nonzero, then

$ H = frac(overline(U), \| U \|) thin frac(\| U \|^(1 \/ 2), parallel U parallel_p^(1 \/ 2)) \, $

defined to be zero where $U = 0$, satisfies $parallel H parallel_3 = 1$ and $integral H U =
  parallel U parallel_p$. Apply this duality formula to each finite bilinear truncation.
  In particular, the optimal pointwise maximal constant is at least $C_S$;
  equality of the scalar constants does not assert equality with the maximal or variation constants.

#bibliography("refs.bib", style: "ieee", title: [References])
