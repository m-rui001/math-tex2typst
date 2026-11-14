#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The free energy of the Ising random perceptron]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

An Ising perceptron assigns a weight to each configuration $x in { - 1 \,
  1 }^N$ through its projections onto independent random patterns.
  For Gaussian patterns $g^a in bb(R)^N$, a single projection is $g^a dot.op x \/ sqrt(N)$.
  Given a real log-potential $f$, the configuration weight is the product of the factors $exp
  f \( g^a dot.op x \/ sqrt(N) \)$. The logarithm of their uniform average, divided by $N$,
  measures the exponential scale of the weighted configuration space.
  We use the uniform probability prior on the cube and call this normalized log partition function the pressure.
  The number of patterns is proportional to $N$, with fixed density $alpha > 0$.
  Section 2 gives the exact normalization.

This model combines a discrete configuration space with nonlinear random constraints.
  At small density or weak interaction, a single typical overlap can describe the pressure.
  More generally, a formula must retain the distribution of overlaps between two samples from the Gibbs measure.
  The patterns are Gaussian, but a nonlinear sum of their log-potentials is generally not a Gaussian process
  indexed by the spins. Thus the Parisi formula for Gaussian mixed $p$-spin Hamiltonians does not directly
  evaluate this pressure.

=== 1.1 Storage models and rigorous predecessors <storage-models-and-rigorous-predecessors>

The statistical-physics study of random-pattern storage was developed by Gardner #cite(label("gardner1988")) and
  Gardner and Derrida #cite(label("gardnerderrida1988")). The latter work explicitly considered Ising couplings
  alongside spherical ones. Krauth and Mézard #cite(label("krauthmezard1989")) analyzed the binary-coupling model
  and predicted its storage capacity. In a storage problem a pattern factor may be an indicator that a constraint
  is satisfied. At positive temperature, a finite log-potential instead assigns a positive weight to every
  configuration, allowing the pressure to measure both the pattern reward and the number of configurations achieving it.

Talagrand established replica-symmetric formulas in small-density perceptron
  regimes #cite(label("talagrand2000halfspaces")). For Gaussian Ising perceptrons with bounded Borel
  log-potentials, his high-temperature work proved overlap-fluctuation bounds at sufficiently small
  $alpha$ #cite(label("talagrand2002")). Bolthausen, Nakajima, Sun,
  and Xu #cite(label("bolthausen2022gardner")) later gave a new small-density proof of the Gardner formula using
  first and second moments conditional on approximate message passing.
  In their convention the activation is the multiplicative weight $U = e^f$, up to constant rescaling.
  Their Theorem 1.1 treats measurable weights satisfying a Gaussian-reweighted variance bound and
  $bb(E) \[ G U \( G \) \] eq.not 0$; Remark 1.2 discusses the complementary zero-moment case,
  where a direct second-moment argument applies. Their small-density conclusions cover weights bounded above and
  away from zero, in particular those arising from bounded real $f$.
  The density restrictions in these predecessors are substantive and are absent from Theorem 3.

Hard constraints have a distinct, extensive theory. Ding and Sun #cite(label("dingsun2025")) and
  Huang #cite(label("huang2024capacity")) proved matching lower and upper capacity bounds at zero margin under
  their respective explicit analytical conditions. Shmalo #cite(label("shmalo2026capacity")) subsequently reported
  a computer-assisted verification of both conditions, yielding the predicted zero-margin threshold;
  that preprint explicitly describes the verification as a new proof claim not yet independently reproduced or
  peer reviewed. Nakajima and Sun #cite(label("nakajimasun2022")) proved concentration, sharp threshold sequences,
  and disorder universality for broad hard-constraint classes.
  For symmetric interval constraints, Perkins and Xu #cite(label("perkinsxu2024")) obtained entropy concentration
  and freezing under an analytical condition; Abbe, Li, and Sly #cite(label("abbeli2021")) proved a lognormal
  partition-function limit and removed that condition, working with random-sign patterns.
  These results concern specific zero-one weights. Such weights correspond to a log-potential that takes the value
  $- oo$, whereas the theorems here concern finite log-potentials.
  A hard-constraint limit would require additional control of the order of limits.

=== 1.2 The formula and its proof mechanisms <the-formula-and-its-proof-mechanisms>

Theorem 3 evaluates the limiting Gaussian Ising pressure for every fixed positive density and every bounded Borel
  real log-potential. Writing $f = beta phi.alt$ includes every fixed positive inverse temperature $beta$ for a
  bounded activation $phi.alt$. The variational parameter is a nondecreasing overlap quantile $q : \( 0 \, 1 \)
  arrow.r \[ 0 \, 1 \]$. Its pattern contribution is a Gaussian recursion,
  and its entropy contribution is the dual of the one-spin $log cosh$ recursion.
  Section 2 defines these functionals before stating the theorem.
  No symmetry, concavity, or smallness condition is imposed on the activation.

The proof uses the Ghirlanda–Guerra overlap identities #cite(label("gg1998")),
  Panchenko’s ultrametricity mechanism #cite(label("panchenko2013")),
  and Ruelle probability cascades #cite(label("ruelle1987")).
  For Gaussian mixed-spin Hamiltonians, Guerra’s interpolation bound #cite(label("guerra2003")) led to Talagrand’s
  proof of the Parisi formula for even interactions #cite(label("talagrand2006parisi"));
  Panchenko #cite(label("panchenko2014parisi")) subsequently included odd interactions using ultrametricity.
  We supply the array, duplication, and finite-cascade arguments needed here.
  In particular, the changes of measure for the Gaussian marks are proved with the conditioning required later.
  The joint transformation of marks and cascade weights was developed by Panchenko and
  Talagrand #cite(label("panchenkotalagrand2007property")) #cite(label("panchenkotalagrand2007interpolation")).

The hierarchical Gaussian-field enrichment is the construction used by Mourrat and
  Panchenko #cite(label("mourratpanchenko2020")) to extend the Parisi formula along a Hamilton–Jacobi equation.
  Our upper bound implements Mourrat’s contact-point supersolution strategy for nonconvex
  interactions #cite(label("mourrat2021")) Section 4; see also its vector-spin
  extension #cite(label("mourrat2023upper")). In that strategy,
  a quadratic penalty in perturbation parameters gives concentration and overlap identities at deterministic
  contact points. Here the interaction parameter is the Poissonized pattern density,
  whose derivative adds one nonlinear pattern. Joint spin and cascade overlap identities,
  together with the monotone-coupling argument of synchronization #cite(label("panchenko2015multispecies")),
  turn the field variations at a contact point into the tail inequalities needed for this derivative.

The lower bound follows the cavity variational tradition of Aizenman, Sims,
  and Starr #cite(label("aizenmansimsstarr2003")). Its identification of the cavity overlap as a derivative of the
  one-spin recursion is related to the critical-point description developed by Chen and
  Mourrat #cite(label("chenmourrat2025")), and to the critical-point bounds of Chen, Issa,
  and Mourrat #cite(label("chenissamourrat2026")) Section 6.
  Those results concern Gaussian spin-glass Hamiltonians and do not directly evaluate the nonlinear pattern model.
  In the present setting the Gaussian cavity covariance must itself be identified from the bulk model.
  Two restored patterns provide both first and second moments for that identification.

The companion article #emph[The free energy of the spherical random perceptron] #cite(label("spherical")) develops
  the corresponding scalar enrichment and two-pattern cavity strategy for spherical spins.
  Here all necessary arguments are included, and the Ising prior requires its own entropy calculation and cavity
  identity. The required concavity of the field functional is the centered-Ising path-convexity theorem proved by
  Chen, Issa, and Mourrat #cite(label("chenissamourrat2026")) Proposition 2.2 and, by a Parisi PDE argument,
  by Ho #cite(label("ho2026concavity")) Theorem 1.8, with the opposite sign and a change of covariance
  normalization. We include a proof covering repeated field levels and zero initial variance.
  Coordinate exchangeability then identifies the cavity-spin overlap with the bulk overlap.
  In the cascade calculation this identifies the dual subgradient;
  the cited concavity turns this identity into attainment of the entropy supremum.
  The model-specific task is to establish these identities for the nonlinear perceptron.

=== 1.3 Organization of the proof <organization-of-the-proof>

The proof first treats smooth compactly supported log-potentials.
  The two bounds use the variational paths differently. The upper comparison starts from an arbitrary trial
  overlap path. The lower bound must instead use the overlap path and field generated by the bulk model,
  and prove that this field attains the entropy dual at that same overlap path.
  Section 3 proves first variations, the tail order of the pattern functional,
  and the field supporting inequality. Section 4 supplies the overlap-array and cascade laws.
  The remaining stages are as follows.

+ #emph[Upper comparison (Section 5).] Enrich the spins by cascade labels and hierarchical Gaussian fields,
  and Poissonize the number of patterns. If a proposed upper bound fails,
  an affine comparison has a negative minimum in a compact parameter region.
  A quadratic perturbation penalty gives fluctuation control at that deterministic minimum,
  yielding joint Ghirlanda–Guerra identities. These order the spin and label overlaps together.
  Field variations give tail inequalities that contradict the density derivative at the minimum.
+ #emph[Restored covariances (Section 6).] Enforce the overlap identities with two patterns omitted,
  then restore them as independent Gaussian marks. The marked-cascade calculation evaluates first and second
  moments of the empirical gradient covariance. It becomes a deterministic nondecreasing function of the limiting
  spin overlap; its diagonal and the dilation correction become deterministic as well.
+ #emph[Cavity increments (Section 7).] Add a fixed number of Ising coordinates.
  A Taylor expansion and a normalized-measure estimate reduce the increment to a Gaussian cavity field and
  finitely many new patterns. Coordinate exchangeability identifies the entropy subgradient.
  Each limiting increment is bounded below by the variational value, up to the floor error in the pattern count.
  Averaging the perturbation parameters and telescoping then finishes the lower bound.

The array calculations retain independent residual Gaussian noise on every replica visit,
  including two visits to the same cascade leaf. This is needed when the patterns are restored and when
  cavity-spin magnetizations are evaluated; Figure 1 illustrates the construction.

Finally, Section 8 removes smoothness. Deleting one pattern gives a Gaussian-$L^1$ approximation bound uniform in
  dimension; the tilted recursion gives a matching bound uniform in the overlap path.
  These estimates yield the bounded Borel theorem and the separately stated integrable Gaussian extension.
  Entrywise replacement proves random-sign universality under the stated Gaussian-null discontinuity condition.

== 2 The model and the variational formula <sec:model>

Fix a pattern density $alpha > 0$. Let $nu_N$ be the uniform #emph[probability] measure on ${ - 1 \, 1 }^N$,
  let $M_N = floor.l alpha N floor.r$, and let $g^1 \, dots.h \,
  g^(M_N)$ be independent standard Gaussian vectors in $bb(R)^N$.
  For a bounded Borel function $f : bb(R) arrow.r bb(R)$, put

#[#set math.equation(numbering: n => "(2.1)")
 $ b_a \( x \) = frac(g^a dot.op x, sqrt(N)) \, wide Z_N \( f \) =
   integral exp #h(-0.16667em) {sum_(a = 1)^(M_N) f \( b_a \( x \) \)} nu_N \( d x \) \, wide p_N \( f \) = 1 /
   N log Z_N \( f \) . $ <def:pressure>]

The usual inverse temperature and activation are recovered by writing $f = beta phi.alt$, with $beta > 0$.
  Counting measure instead of $nu_N$ adds $log 2$ to the pressure.
  With either convention, physical free energy per spin is the corresponding pressure multiplied by $- 1 \/ beta$.

=== 2.1 Two finite Gaussian recursions <two-finite-gaussian-recursions>

An overlap path is a nondecreasing function $q : \( 0 \, 1 \) arrow.r \[ 0 \, 1 \]$.
  A trial field path is a nonnegative nondecreasing step function $h : \( 0 \, 1 \)
  arrow.r \[ 0 \, oo \)$ with finite values. Paths are identified up to equality almost everywhere;
  all path integrals and $L^1$ norms use Lebesgue measure. Write $cal(Q)$ for the overlap paths and
  $cal(H)_(upright("step"))$ for the trial fields.

A step path is described on a partition

#[#set math.equation(numbering: n => "(2.2)")
 $ 0 = zeta_0 < zeta_1 < dots.h.c < zeta_k = 1 \, wide w_i = zeta_(i + 1) - zeta_i \, quad 0 lt.eq
   i < k . $ <def:partition>]

Its value on $\( zeta_i \, zeta_(i + 1) \)$ carries subscript $i$; repeated path values are allowed.
  For a standard normal random variable $G$, define

#[#set math.equation(numbering: n => "(2.3)")
 $ \( cal(T)_(s \, d) U \) \( x \) =
   cases(delim: "{", d^(- 1) log bb(E) exp { d U \( x + sqrt(s) thin G \) } \, & d > 0 \,, bb(E) U \( x + sqrt(s)
   thin G \) \, & d = 0 \,) wide s gt.eq 0 \, quad 0 lt.eq d lt.eq 1 . $ <def:transform>]

#prodef([Definition 2.1.])[
  (Pattern and field recursions).  For a step overlap path $q$, append $q_(- 1) = 0$ and $q_k = 1$.
    Starting at $U_k = f$, set
  #[#set math.equation(numbering: n => "(2.4)")
   $ U_(i - 1) = cal(T)_(q_i - q_(i - 1) \, zeta_i) U_i quad \( i = k \, k - 1 \, dots.h \, 0 \) \, wide
     V_f \( q \) = U_(- 1) \( 0 \) . $ <def:pattern-recursion>]
  For a step field path $h$, append $h_(- 1) = 0$. Starting instead at $U_(k - 1) \( x \) = log cosh x -
    h_(k - 1) \/ 2$, set
  #[#set math.equation(numbering: n => "(2.5)")
   $ U_(i - 1) = cal(T)_(h_i - h_(i - 1) \, zeta_i) U_i quad \( i = k - 1 \, k - 2 \, dots.h \, 0 \) \, wide
     ell \( h \) = U_(- 1) \( 0 \) . $ <def:field-recursion>]
  The letter $U$ refers to the recursion under discussion.
] <def:recursions>

The initial Gaussian average has coefficient $zeta_0 = 0$.
  The pattern recursion also has a final Gaussian average with coefficient $zeta_k = 1$ and variance $1 -
  q_(k - 1)$; the field recursion has no such extra interval.
  For example, for constant paths $q \( u \) = r$ and $h \( u \) = H$,

#[#set math.equation(numbering: n => "(2.6)")
 $ V_f \( r \) & = bb(E)_G log bb(E)_(G') exp f \( sqrt(r) thin G + sqrt(1 - r) thin G' \) \,\
ell \( H \) & = bb(E) log cosh \( sqrt(H) thin G \) - H \/ 2 \, $ <def:one-level-pattern>]

where $G \, G'$ are independent standard normals.

Subdividing an interval without changing its path value inserts a zero-variance transform,
  so the definitions do not depend on the chosen partition.
  For $f in C_c^oo \( bb(R) \)$, the pattern functional is Lipschitz in the $L^1$ distance between step paths.
  For bounded Borel $f$, it has a unique continuous extension to $cal(Q)$,
  constructed by uniform approximation of the pattern functionals in Lemma 30. We use that extension throughout.
  The field functional is $1 \/ 2$-Lipschitz on step fields and therefore extends to bounded nonnegative
  nondecreasing fields; see Proposition 5.

#prodef([Definition 2.2.])[
  (Ising entropy).  For $q in cal(Q)$, define the extended-valued functional
  #[#set math.equation(numbering: n => "(2.7)")
   $ S_(upright(I)) \( q \) = sup_(h in cal(H)_(upright("step"))) {ell \( h \) + 1 /
     2 integral_0^1 h \( u \) q \( u \) thin d u} . $ <def:entropy-formula>]
  The field partition is independent of the overlap partition.
    In calculations with two step paths, we always pass to a common refinement.
] <def:entropy>

#thm([Theorem 2.3.])[
  (Gaussian Ising perceptron).  #emph[For every $alpha > 0$ and every bounded Borel $f : bb(R) arrow.r bb(R)$,
#[#set math.equation(numbering: n => "(2.8)")
 $ lim_(N arrow.r oo) bb(E) p_N \( f \) = cal(P)_f \( alpha \) := inf_(q in cal(Q)) { alpha V_f \( q \) +
   S_(upright(I)) \( q \) } . $ <thm:formula>]

 Moreover, $p_N \( f \)$ converges to $cal(P)_f \( alpha \)$ in probability. The variational value is finite.
   In particular, the conclusion holds for $f = beta phi.alt$ at every $beta >
   0$ and every bounded continuous activation $phi.alt$, without symmetry, concavity, or a smallness restriction.]
] <thm:main>

The elementary bounds $S_(upright(I)) gt.eq 0$, $S_(upright(I)) \( 0 \) = 0$ and $\| V_f \| lt.eq
  parallel f parallel_oo$ will be proved below. Since $V_f \( 0 \) = log bb(E) e^(f \( G \))$, they give

#[#set math.equation(numbering: n => "(2.9)")
 $ - alpha parallel f parallel_oo lt.eq cal(P)_f \( alpha \) lt.eq alpha log bb(E) e^(f \( G \)) . $ <def:finite-value>]

The proof of Theorem 3 first assumes $f in C_c^oo \( bb(R) \)$.
  The upper bound is Proposition 19, and Proposition 29 gives the matching lower bound.
  Section 8 removes smoothness and proves the remaining convergence claims.
  It also gives extensions to integrable unbounded activations and to independent random-sign patterns.

=== 2.2 Probabilistic conventions <probabilistic-conventions>

A Gibbs measure is a reference probability reweighted by an exponential energy and then normalized.
  Replicas are independent samples from that measure conditional on its disorder and reference data.
  Brackets $chevron.l dot.op chevron.r$ denote replica expectation,
  and $bb(E)$ averages the disorder and any explicitly introduced random data.
  A deterministic perturbation parameter is held fixed under $bb(E)$ unless its averaging is specified.
  The spin overlap is

$ R \( x \, x' \) = N^(- 1) x dot.op x' \, wide R_(a b) = R \( x^a \, x^b \) . $

An array limit means convergence in law of every finite sampled restriction, including disorder averaging.
  All constants may depend on $alpha$ and the fixed smooth activation.
  Dependence on a fixed number of cavity coordinates $L$ is allowed only where indicated;
  the limit in $N$ is always taken before letting $L$ increase.

== 3 Variations, order, and the Ising entropy <var:section>

Let $f in C_c^oo \( bb(R) \)$. The upper bound will use two properties of the variational formula:
  increasing the tail integrals of an overlap path decreases $V_f$,
  and finite step trials with top value below one suffice for the infimum.
  The lower bound needs a different property: concavity of $ell$ turns its first variation into a global
  supporting inequality, which will identify the entropy supremum.
  We establish these properties from the recursions of Definition 1.

Recall their different endpoints: the pattern recursion has $q_(- 1) = 0$, $q_k = 1$, and coefficients $zeta_0 =
  0 \, dots.h \, zeta_k = 1$, whereas the field recursion has terminal value $log cosh \( x \) -
  h_(k - 1) \/ 2$ and stops at level $k - 1$. Inserting a partition point without changing a step value inserts an
  identity transform of variance zero. Consequently either recursion may be computed on any common refinement of
  the partitions in use.

=== 3.1 First variations and the pattern tail order <first-variations-and-the-pattern-tail-order>

For either recursion write $s_i$ for its variance increment and define the probability kernel

#[#set math.equation(numbering: n => "(3.1)")
 $ K_i \( x \, d y \) = exp { zeta_i \( U_i \( y \) - U_(i - 1) \( x \) \) } cal(N) \( x \, s_i \) \( d y \) .
   $ <var:kernel>]

Here $s_i = q_i - q_(i - 1)$, $0 lt.eq i lt.eq k$, in the pattern recursion, and $s_i = h_i - h_(i - 1)$, $0 lt.eq
  i lt.eq k - 1$, in the field recursion. The normalization follows directly from the definition of
  $cal(T)_(s_i \, zeta_i)$; when $zeta_i = 0$ the exponential is one.
  A zero-variance kernel is the point mass at its starting point.
  Let $Z_(- 1) = 0$ and, successively, sample $Z_i$ from $K_i \( Z_(i - 1) \, dot.op \)$.

Two elementary derivative identities will be used repeatedly.
  For a smooth terminal function $U$, put $W = cal(T)_(s \, d)
  U$ and let $K$ denote the corresponding tilted Gaussian kernel.
  Differentiation in $x$ and in a perturbation $U + epsilon A$ gives

#[#set math.equation(numbering: n => "(3.2)")
 $ W' = K U' \, wide frac(d, d epsilon) cal(T)_(s \, d) \( U + epsilon A \)\|_(epsilon = 0) =
   K A . $ <var:transform-derivatives>]

The Gaussian heat equation gives

#[#set math.equation(numbering: n => "(3.3)")
 $ partial_s W = 1 / 2 { W'' + d \( W' \)^2 } = 1 / 2 K { U'' + d \( U' \)^2 } . $ <var:generator>]

For $d > 0$, these identities follow by differentiating $e^(d W) = bb(E) e^(d U \( x + sqrt(s) G \))$; for $d =
  0$ they are the ordinary heat-semigroup identities. In particular,
  $U'_i \( Z_i \)$ is a martingale along the tilted chain, since $K_i U'_i = U'_(i - 1)$.

#thm([Lemma 3.1.])[
  (First variations).  #emph[On a fixed partition with $w_i = zeta_(i + 1) - zeta_i$,
    the first variations along every feasible line segment of step paths are
#[#set math.equation(numbering: n => "(3.4)")
 $ frac(d, d a) V_f \( q + a dot(q) \) & = - 1 / 2 sum_(i = 0)^(k - 1) w_i dot(q)_i thin
   bb(E) \[ U'_i \( Z_i \)^2 \] \,\
frac(d, d a) ell \( h + a dot(h) \) & = - 1 / 2 sum_(i = 0)^(k - 1) w_i dot(h)_i thin
  bb(E) \[ U'_i \( Z_i \)^2 \] . $ <var:pattern-variation>]

 The functions and chains on the right are computed at the current path.
   Endpoint derivatives are understood from within the segment.
   The squared-derivative expectations on the right are continuous on the closed finite-dimensional parameter
   cones. In both recursions these expectations are nonnegative and nondecreasing in $i$. In the field recursion, define
#[#set math.equation(numbering: n => "(3.5)")
 $ rho_h \( u \) = rho_i := bb(E) \[ U'_i \( Z_i \)^2 \] \, wide zeta_i < u < zeta_(i + 1) . $ <var:rho>]

 Then $0 lt.eq rho_h lt.eq 1$, and subdivision does not change this path.]
] <var:variation>

#proof[
  First suppose all variance increments being differentiated are strictly positive.
    Moving $q_i$ lengthens the transition ending at level $i$ and shortens the transition leaving that level.
    By (3.3), the incoming derivative, expressed at level $i$ before propagation through the preceding kernels,
    is ${ U''_i + zeta_i \( U'_i \)^2 } \/ 2$. The outgoing derivative is $- { U''_i +
    zeta_(i + 1) \( U'_i \)^2 } \/ 2$. Their sum is $- w_i \( U'_i \)^2 \/ 2$.
    Formula (3.2) propagates this sum through the kernels ending at levels $i \, i - 1 \, dots.h \, 0$,
    giving $partial_(q_i) V_f = - w_i bb(E) \[ U'_i \( Z_i \)^2 \] \/ 2$.
  The same cancellation applies to $h_i$ for $i < k - 1$. At the last field level the incoming derivative and the
    derivative of the subtraction $- h_(k - 1) \/ 2$ combine to give
  $ 1 / 2 { \( log cosh \)'' + zeta_(k - 1) \( \( log cosh \)' \)^2 - 1 } = - frac(1 - zeta_(k - 1), 2) tanh^2 . $
  This is the same formula with $w_(k - 1) = 1 - zeta_(k - 1)$. Linearity yields both displayed variations.
  For completeness, the differentiations remain valid at degenerate increments.
    A Gaussian transform of either terminal function is smooth in the spatial variable and has bounded derivatives
    of every positive order. This follows inductively by differentiating the tilted expectation:
    the resulting terms are finite sums of tilted moments of products of bounded derivatives of the next-level
    function. The functions themselves are bounded in the pattern case and have at most linear growth in the field
    case. On every compact variance-parameter set, the Gaussian exponential moments therefore dominate all terms
    in these formulas. Coupling the increments as $sqrt(s_i) G_i$ shows continuity as any $s_i$ decreases to zero,
    both for recursion values and for the tilted moments that appear above.
    The heat-equation identity also has this continuous extension because its spatial derivatives do.
    Approximate the endpoints of a feasible segment by interior points on a common partition and integrate the
    already proved derivative formula along the approximating segments.
    Dominated convergence gives the same integral formula on the original segment and its one-sided endpoint
    derivatives.
  Finally, the derivative martingale and conditional Jensen inequality show that its second moments increase with
    the level. The terminal derivative bounds are $parallel f' parallel_oo$ and $1$, respectively;
    the same bounds hold at every earlier level by (3.2). An inserted zero-variance transition repeats the same
    derivative and chain value, so it does not change $rho_h$. ◻
]

#thm([Proposition 3.2.])[
  (Continuity and tail order).  #emph[For step paths on arbitrary partitions,
#[#set math.equation(numbering: n => "(3.6)")
 $ \| V_f \( p \) - V_f \( q \) \| & lt.eq 1 / 2 parallel f' parallel_oo^2 parallel p - q parallel_(L^1) \,\
\| ell \( h' \) - ell \( h \) \| & lt.eq 1 / 2 parallel h' - h parallel_(L^1) . $ <var:lipschitz>]

 Thus $V_f$ extends uniquely and continuously to all nondecreasing $\[ 0 \, 1 \]$-valued paths,
   and $ell$ extends to all bounded nonnegative nondecreasing paths. Moreover,
#[#set math.equation(numbering: n => "(3.7)")
 $ integral_s^1 p \( u \) thin d u gt.eq integral_s^1 q \( u \) thin d u quad
   upright("for every ") s in \[ 0 \, 1 \] quad arrow.r.double quad V_f \( p \) lt.eq V_f \( q \) . $ <var:tail-order>]

]
] <var:continuity-order>

#proof[
  Refine the two partitions and integrate Lemma 4 along the segment joining the paths.
    The terminal derivative bounds give (3.6). Step paths are dense in the indicated classes in $L^1$,
    which gives the extensions.
  For the order assertion on a common partition, set $a_i = w_i \( p_i - q_i \)$ and $A_j =
    sum_(i = j)^(k - 1) a_i$. The hypothesis gives $A_j gt.eq 0$. For every nonnegative nondecreasing sequence $c_i$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ sum_(i = 0)^(k - 1) a_i c_i = c_0 A_0 + sum_(j = 1)^(k - 1) \( c_j - c_(j - 1) \) A_j gt.eq
     0 . $ <var:summation-parts>]
  At each point of the segment from $q$ to $p$, take $c_i = bb(E) \[ U'_i \( Z_i \)^2 \]$ and apply (3.4).
    The derivative along the segment is nonpositive, proving the claim for steps.
  For general paths, replace each by its average on each interval of a common sequence of successively finer
    uniform partitions. These averages are nondecreasing and converge in $L^1$ to the original paths.
    Their tail-integral differences at partition boundaries equal the original differences.
    Between boundaries the differences are affine and hence nonnegative as well. Apply the step result and then (3.6). ◻
]

#thm([Corollary 3.3.])[
  (Finite variational value and reduction to finite trials).  #emph[The entropy in Definition 2 is nonnegative,
    nondecreasing in pointwise path order, and satisfies $S_(upright(I)) \( 0 \) = 0$.
    The variational infimum is finite, and
#[#set math.equation(numbering: n => "(3.9)")
 $ inf_q { alpha V_f \( q \) + S_(upright(I)) \( q \) } = inf_(q upright(" step")\
q_(k - 1) < 1) { alpha V_f \( q \) + S_(upright(I)) \( q \) } . $ <var:step-infimum>]

]
] <var:step-reduction>

#proof[
  The trial $h = 0$ gives $S_(upright(I)) \( q \) gt.eq 0$.
    Each expression in its defining supremum is nondecreasing in $q$ because $h gt.eq 0$.
    Also $ell \( 0 \) = 0$ and (3.4), integrated along $a mapsto a h$, gives $ell \( h \) lt.eq 0$,
    whence $S_(upright(I)) \( 0 \) = 0$. Every transform preserves the range of a bounded terminal function,
    so $\| V_f \( q \) \| lt.eq parallel f parallel_oo$. In fact, the zero path has $V_f \( 0 \) =
    log bb(E) e^(f \( G \))$. These observations bound the infimum below by $-
    alpha parallel f parallel_oo$ and provide a finite upper bound using $q = 0$.
  For any quantile $q$, let $underline(q)_m$ on each interval of the uniform $m$-partition be $\( 1 - 1 \/ m \)$
    times the essential infimum of $q$ on that interval. Then $0 lt.eq underline(q)_m lt.eq q$ almost everywhere,
    $sup underline(q)_m < 1$, and $parallel underline(q)_m - q parallel_(L^1) arrow.r 0$.
    The last assertion follows, for example, from convergence at every continuity point of a monotone
    representative, followed by bounded convergence. Consequently $S_(upright(I)) \( underline(q)_m \) lt.eq
    S_(upright(I)) \( q \)$, while $V_f \( underline(q)_m \) arrow.r V_f \( q \)$.
    Taking a limit superior for each finite-entropy trial $q$ proves the nontrivial inequality in (3.9);
    the other inequality follows from inclusion of the trial classes.
    No continuity assertion for the extended-valued entropy is needed. ◻
]

=== 3.2 Concavity of the field recursion <concavity-of-the-field-recursion>

The supporting inequality below is the property of the centered Ising spin law used in the lower bound.
  Its concavity statement is the path-convexity theorem of Chen, Issa,
  and Mourrat #cite(label("chenissamourrat2026")) Propositions 2.2 and 2.4:
  with their notation and covariance normalization, $ell \( h \) = - psi_compose \( h \/ 2 \)$.
  Ho #cite(label("ho2026concavity")) Theorem 1.8 proves the same path-convexity statement through a concavity
  theorem for the time-changed Parisi PDE. This is convexity along linear interpolations of quantile paths,
  not along affine interpolations of their probability laws.
  The proof below uses the Hessian criterion of Chen, Issa, and Mourrat:
  the negative Hessian has nonpositive off-diagonal entries and nonnegative row sums.
  We derive the off-diagonal signs directly from folded Gaussian kernels and include the extension to repeated or
  zero field levels. The preservation of even functions monotone in absolute value by these transitions is
  classical; see Panchenko #cite(label("panchenko2005question")) Lemma 2(d).
  The next lemma gives a direct proof in the form needed here.

#thm([Lemma 3.4.])[
  (Order preservation by a folded transition).  #emph[Suppose $U : bb(R) arrow.r bb(R)$ is even and convex.
    Let $K$ be its tilted Gaussian kernel with variance $s gt.eq 0$ and coefficient $d gt.eq 0$,
    and assume its normalizer $bb(E) e^(d U \( x + sqrt(s) G \))$ is finite for every $x in bb(R)$.
    If $A$ is bounded, even, and nondecreasing in $\| x \|$, then $K A$ has these properties as well.
    The same statement with “nonincreasing” holds with both monotonicities reversed.]
] <var:folded-kernel>

#proof[
  Evenness follows by reflection, and $s = 0$ is immediate.
    For $s > 0$, the law of the next absolute value $y gt.eq 0$ when the starting point is $x gt.eq
    0$ has density proportional to
  $ e^(- y^2 \/ \( 2 s \)) cosh \( x y \/ s \) e^(d U \( y \)) . $
  For $x_2 gt.eq x_1 gt.eq 0$, the ratio of these normalized densities is a positive constant times
    $cosh \( x_2 y \/ s \) \/ cosh \( x_1 y \/ s \)$. Its logarithmic derivative in $y$ is
  $ x_2 / s tanh \( x_2 y \/ s \) - x_1 / s tanh \( x_1 y \/ s \) gt.eq 0 \, $
  because $x mapsto x tanh \( x y \/ s \)$ is nondecreasing on $\[ 0 \, oo \)$.
    Thus the density ratio $L \( y \)$ is increasing. If $Y \,
    Y'$ are independent with the law corresponding to $x_1$, then
  $ "Cov" \( A \( Y \) \, L \( Y \) \) = 1 /
    2 bb(E) \[ \( A \( Y \) - A \( Y' \) \) \( L \( Y \) - L \( Y' \) \) \] gt.eq 0 . $
  Since $bb(E) L \( Y \) = 1$, this proves $K A \( x_2 \) gt.eq K A \( x_1 \)$.
    Negating $A$ proves the reversed statement. The normalizations are included in $L$ and do not alter its
    monotonicity. ◻
]

#thm([Theorem 3.5.])[
  (Concavity and a supporting field).  #emph[The functional $ell$ is concave on nonnegative nondecreasing step
    paths. For any two such paths, represented on a common partition,
#[#set math.equation(numbering: n => "(3.10)")
 $ ell \( h' \) lt.eq ell \( h \) - 1 / 2 integral_0^1 \( h' \( u \) - h \( u \) \) rho_h \( u \) thin d u .
   $ <var:support>]

 Concavity also holds for its continuous extension to bounded nonnegative nondecreasing paths.]
] <var:concavity>

#proof[
  Fix a partition. We first work in its open cone $0 < h_0 < h_1 < dots.h.c < h_(k - 1)$,
    where all parameter derivatives below exist. Write $m_i = U'_i$ and $rho_i =
    bb(E) m_i \( Z_i \)^2$ as in (3.5). By the first variation, the matrix
  $ A_(i j) = w_i partial_(h_j) rho_i = - 2 partial_(h_j) partial_(h_i) ell $
  is symmetric. We will prove that its off-diagonal entries are nonpositive and its row sums are nonnegative.
    These two properties make $A$ positive semidefinite, as the decomposition (3.15) below shows.
    They correspond to increasing one later field level and to increasing all field levels together, respectively.
  Every $U_i$ is even and convex. Evenness is preserved by the Gaussian transforms.
    To check convexity when $d > 0$, use convexity of $U$ and Hölder’s inequality to obtain, for $0 lt.eq a lt.eq 1$,
  $ bb(E) e^(d U \( a x + \( 1 - a \) y + sqrt(s) G \))
    lt.eq \( bb(E) e^(d U \( x + sqrt(s) G \)) \)^a \( bb(E) e^(d U \( y + sqrt(s) G \)) \)^(1 - a) . $
  Taking logarithms proves convexity of the transform; expectation preserves it when $d = 0$.
    The terminal subtraction is constant in $x$ and does not affect the argument.
    In particular, $m_i$ is odd, $m_i \( x \) gt.eq 0$ for $x gt.eq 0$,
    and $m_i \( x \)^2$ is even and nondecreasing in $\| x \|$.
    All $U_i$ have at most linear growth, so the normalizers in Lemma 7 are finite.
  We first establish the cross-derivative sign
  #[#set math.equation(numbering: n => "(3.11)")
   $ partial_(h_j) rho_i lt.eq 0 wide \( j > i \) . $ <var:cross-sign>]
  Repeat the switch calculation from Lemma 4, but stop its backwards propagation at the function $U_i \( x \)$.
    This gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ partial_(h_j) U_i \( x \) = - w_j / 2 \( K_(i + 1) dots.h.c K_j m_j^2 \) \( x \) \, wide
     j > i . $ <var:later-switch>]
  Lemma 7 says that this function is even and nonincreasing in $\| x \|$.
    Its derivative is therefore nonpositive for $x > 0$ and nonnegative for $x < 0$.
    Since $m_i$ has the opposite signs, the direct derivative of the terminal test in the expression $rho_i =
    K_0 dots.h.c K_i \( m_i^2 \) \( 0 \)$ is pointwise nonpositive:
  $ partial_(h_j) \( m_i^2 \) = 2 m_i \( partial_(h_j) U_i \)' lt.eq 0 . $
  It remains to account for all derivatives of the probability kernels in this expression.
    If $l lt.eq i < j$, the variance of $K_l$ is independent of $h_j$. Put $A_l = partial_(h_j) U_l$.
    Differentiating the normalized kernel at a fixed starting point gives the score
  #[#set math.equation(numbering: n => "(3.13)")
   $ partial_(h_j) log K_l \( x \, d y \) = zeta_l { A_l \( y \) - \( K_l A_l \) \( x \) } . $ <var:kernel-score>]
  Indeed the derivative of $U_(l - 1)$ in its normalizing factor equals $K_l A_l$, by (3.2).
    In the product rule for $K_0 dots.h.c K_i \( m_i^2 \)$, the test at level $l$ is $H_l =
    K_(l + 1) dots.h.c K_i \( m_i^2 \)$, with $H_i = m_i^2$. It is even and nondecreasing in absolute value by
    Lemma 7. On the other hand, $A_l$ is even and nonincreasing in absolute value by (3.12).
    Thus differentiating this kernel contributes, at its starting point,
  $ zeta_l "Cov"_(K_l \( x \, dot.op \)) \( H_l \, A_l \) lt.eq 0 . $
  The sign follows from the same independent-copy covariance identity as in Lemma 7,
    now for two functions of $\| y \|$ with opposite monotonicities.
    Propagation through preceding probability kernels preserves the sign.
    This includes $l = 0$, whose score is zero because $zeta_0 = 0$.
    Together with the direct derivative, these are all terms in the product rule, proving (3.11).
  Next increase every field value by the same number $a gt.eq 0$.
    All increments after level zero remain unchanged. Each $U_i$, $i gt.eq 0$,
    changes only by the additive constant $- a \/ 2$, so its spatial derivative and all kernels $K_l$ for $l gt.eq
    1$ remain unchanged. The sole change in the chain is that its first,
    untilted Gaussian variance increases from $h_0$ to $h_0 + a$.
    The function $K_1 dots.h.c K_i \( m_i^2 \)$ is even and nondecreasing in absolute value.
    Coupling the initial values as $sqrt(h_0 + a) G$ therefore proves
  #[#set math.equation(numbering: n => "(3.14)")
   $ sum_(j = 0)^(k - 1) partial_(h_j) rho_i gt.eq 0 . $ <var:row-sum>]
  We can now apply the matrix criterion. By (3.11) and symmetry every off-diagonal entry of $A$ is nonpositive,
    and (3.14) gives nonnegative row sums. For every $v in bb(R)^k$,
  #[#set math.equation(numbering: n => "(3.15)")
   $ v^(sans(T)) A v = sum_i (sum_j A_(i j)) v_i^2 + sum_(i < j) \( - A_(i j) \) \( v_i - v_j \)^2 gt.eq
     0 . $ <var:psd>]
  Thus the Hessian of $ell$ is negative semidefinite on the open cone.
    Restricting $ell$ to a line segment in that cone proves concavity and,
    using its derivative at the starting point, the inequality (3.10) there.
  For arbitrary field steps $h \, h'$ on this partition, replace $h_i \, h'_i$ by $h_i +
    epsilon \( i + 1 \)$ and $h'_i + epsilon \( i + 1 \)$. Both perturbed paths lie in the open cone and their
    difference remains $h' - h$. Let $epsilon arrow.b 0$. The value and coefficient continuity in Lemma 4 proves
    both concavity and (3.10) on the closed cone. Common refinement handles distinct partitions.
    Finally, approximate any two bounded field paths in $L^1$ by monotone steps on common partitions and use
    Proposition 5 to pass the concavity inequality to their limits. ◻
]

For a step field $h$, the supporting inequality gives the concrete entropy identity

$ S_(upright(I)) \( rho_h \) = ell \( h \) + 1 / 2 integral_0^1 h \( u \) rho_h \( u \) thin d u . $

Indeed, adding $1 / 2 integral h' rho_h$ to (3.10) bounds every trial value by the value at $h$,
  and $h$ itself is admissible. The nonlinear model must still identify its overlap path with this field
  derivative. Section 7 obtains that identity from coordinate exchangeability and passes the same supporting
  inequality to the bounded field produced by the cavity limit.

== 4 Overlap arrays and probability cascades <arr:section>

Fresh Gaussian patterns are determined on finitely many replicas by their overlap covariance matrices.
  This lets us evaluate their contribution from limiting array laws,
  without representing an arbitrary limiting Gibbs measure.
  We first derive the ultrametric structure forced by the Ghirlanda–Guerra identities and realize its finite
  approximations by probability cascades. We then compute how Gaussian marks change when a cascade is reweighted.
  Finally, Lemma 15 expresses the reciprocal normalizers of bounded reweightings as limits of polynomials;
  each polynomial uses only finitely many replicas. Thus disorder-averaged array laws suffice even for these
  normalized expectations.

All array laws in this section include the disorder average.
  In particular, the conditional overlap identities below condition on a sampled array block,
  not on a fixed realization of the disorder.

For a Gibbs probability, replicas are independent samples conditional on its reference data and disorder;
  their conditional expectation is denoted by $chevron.l dot.op chevron.r$.
  The expectation $bb(E)$ also averages the disorder and any additional randomness specified in the construction.
  A symmetric array $B = \( B_(ell m) \)_(ell \, m gt.eq 1)$ is #emph[weakly exchangeable] if its law is invariant
  under every finite permutation of the indices, and is a #emph[Gram array] if every finite restriction is
  positive semidefinite. These properties, and a fixed diagonal,
  pass to limits in distribution of finite restrictions. Bounded arrays admit such subsequential limits.

=== 4.1 Conditional identities, positivity, and duplication <conditional-identities-positivity-and-duplication>

The overlap-mixture identities originate in the work of Ghirlanda and Guerra #cite(label("gg1998")).
  Their occurrence in the present models will be proved by the Gaussian perturbations in the upper and lower bounds.

#prodef([Definition 4.1.])[
  (Ghirlanda–Guerra property).  Let $B$ be a weakly exchangeable array with values in a compact space,
    and write $mu = cal(L) \( B_12 \)$. We say that $B$ has the Ghirlanda–Guerra property if, for every $n gt.eq 2$,
  #[#set math.equation(numbering: n => "(4.1)")
   $ cal(L) #scale(x: 120%, y: 120%)[\(] B_(1 \, n + 1) divides \( B_(ell m) \)_(ell \, m lt.eq n)
     #scale(x: 120%, y: 120%)[\)] = 1 / n mu + 1 / n sum_(ell = 2)^n delta_(B_(1 ell)) . $ <arr:conditional-gg>]
  Equivalently, for every bounded measurable function $F$ of the first $n times
    n$ block and every bounded measurable $psi$,
  #[#set math.equation(numbering: n => "(4.2)")
   $ bb(E) \[ F psi \( B_(1 \, n + 1) \) \] = 1 / n bb(E) \[ F \] bb(E) \[ psi \( B_12 \) \] + 1 /
     n sum_(ell = 2)^n bb(E) \[ F psi \( B_(1 ell) \) \] . $ <arr:gg-tested>]
  The same definition applies to a joint array, with $B_(ell m)$ a tuple of entries.
    By exchangeability the distinguished index $1$ can be replaced by any of the first $n$ indices.
] <arr:gg>

It suffices to establish (4.2) for continuous $F \, psi$:
  the equality then identifies the relevant finite measures, and hence holds for bounded measurable tests.
  This observation also proves that the property passes to weak limits on a compact entry space.
  A measurable entrywise image of a joint array retains the property, with conditioning on its own first block,
  by the conditional-expectation tower rule.

The direct array argument below uses duplication, the mechanism in Panchenko’s ultrametricity
  proof #cite(label("panchenko2013")) Theorem 4 and Section 3.

#thm([Theorem 4.2.])[
  (Positivity and ultrametricity).  #emph[Suppose $B$ is a bounded, symmetric,
    weakly exchangeable Gram array with constant diagonal $D$ and the Ghirlanda–Guerra property.
    Then, almost surely, for distinct indices,
#[#set math.equation(numbering: n => "(4.3)")
 $ B_(ell m) gt.eq 0 \, wide B_12 gt.eq min { B_13 \, B_23 } . $ <arr:ultrametric-inequality>]

]
] <arr:ultrametric>

#proof[
  First suppose $b = bb(P) \( B_12 < - epsilon \) > 0$ for some $epsilon > 0$.
    On the event that all distinct pairs among the first $n$ indices have overlap below $- epsilon$,
    each of the $n$ links to index $n + 1$ fails this condition with conditional probability $\( 1 - b \) \/ n$,
    by (4.1). A union bound therefore gives conditional probability at least $b$ that all the new links satisfy
    it. Starting with $n = 2$, such blocks have positive probability for every size.
    Their quadratic form on the all-ones vector is at most $n D - n \( n - 1 \) epsilon$,
    contradicting positive semidefiniteness for large $n$. Taking a countable sequence of $epsilon$ proves positivity.
  We next prove a support duplication assertion. If $\( a_(ell m) \)_(ell \, m lt.eq n)$ belongs to the support of
    a finite block, $n gt.eq 2$, there is a supported extension to $n + 1$ such that
  #[#set math.equation(numbering: n => "(4.4)")
   $ a_(i \, n + 1) = a_(i n) quad \( i < n \) \, wide a_(n \, n + 1) lt.eq max_(i < n) a_(i n) . $ <arr:duplication>]
  Fix $b_(*) > max_(i < n) a_(i n)$ and a positive-probability neighborhood event $A$ for the first $n$ indices,
    chosen so that all specified links to $n$ are below $b_(*)$.
    Let $A_0$ impose just the restrictions among the first $n - 1$ indices.
    An index $j gt.eq n$ #emph[matches] if its links to those $n -
    1$ indices belong to the neighborhoods prescribed for $n$. Thus $A = A_0 ∩ { n upright(" matches") }$.
  Suppose that, on $A$, a fresh index cannot both match and have its link to $n$ below $b_(*)$.
    Let $W_B$ be the limiting empirical frequency of matching indices,
    and $W$ the frequency of indices $j > n$ with $B_(n j) gt.eq b_(*)$. These frequencies exist in $L^2$.
    Indeed, for an exchangeable sequence of indicators the second moments of empirical averages and their mixed
    second moments have the same limit, so the averages are $L^2$-Cauchy.
    The limits are unchanged by finite permutations of the relevant unobserved indices.
    The supposition and exchangeability imply $W_B lt.eq W$ on $A$.
  Put $b = bb(P) \( B_12 gt.eq b_(*) \)$. We have $b < 1$, since $A$ has positive probability and specifies links
    below $b_(*)$. Conditional on $A$, the first high link to $n$ has probability $b \/ n$;
    after $j$ consecutive high links the next has probability $\( b + j \) \/ \( n + j \)$.
    Applying (4.1) successively, and then expressing empirical frequency moments by products at distinct fresh
    indices, gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ bb(E) \[ upright(bold(1))_A W^d \] = bb(P) \( A \) product_(j = 0)^(d - 1) frac(b + j, n + j) \, wide d gt.eq
     1 . $ <arr:duplication-moments>]
  The binomial series therefore yields
  #[#set math.equation(numbering: n => "(4.6)")
   $ bb(E) \[ upright(bold(1))_A \( 1 + z W \)^(- n) \] = bb(P) \( A \) \( 1 + z \)^(- b) \, wide
     z > 0 . $ <arr:duplication-transform>]
  Initially the series proves this for $0 < z < 1$. Both sides are real analytic on $\( 0 \, oo \)$,
    the left side by boundedness of $W$ and local power-series domination,
    so the identity holds throughout that interval. It also includes $b = 0$.
  To compare the matching frequency with the high-link frequency, write $I_j =
    upright(bold(1))_({ j upright(" matches") })$. The event $A_0$ uses only the first $n - 1$ indices,
    and $W_B$ is unchanged by every finite permutation of the remaining indices, including index $n$.
    Hence, for every bounded continuous $phi$, exchangeability gives
  $ bb(E) \[ upright(bold(1))_(A_0) I_n phi \( W_B \) \] = bb(E)
    [upright(bold(1))_(A_0) 1 / M sum_(j = n)^(n + M - 1) I_j phi \( W_B \)] arrow.r
    bb(E) \[ upright(bold(1))_(A_0) W_B phi \( W_B \) \] . $
  The limit uses the $L^2$ convergence defining $W_B$; adding index $n$ does not change that frequency.
    Taking $phi \( x \) = \( 1 + z x \)^(- n)$ and using $W_B lt.eq W$ on $A$ now gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ bb(E) \[ upright(bold(1))_A \( 1 + z W \)^(- n) \] & lt.eq bb(E) \[ upright(bold(1))_A \( 1 + z W_B \)^(- n) \]\
 & = bb(E) \[ upright(bold(1))_(A_0) W_B \( 1 + z W_B \)^(- n) \] lt.eq z^(- 1) . $ <arr:duplication-contradiction>]
  The last bound uses $x \/ \( 1 + z x \)^n lt.eq 1 \/ z$. Equations (4.6) and (4.7) contradict $b < 1$ as $z
    arrow.r oo$. Consequently the desired extension event has positive probability.
    Shrinking the neighborhoods and decreasing $b_(*)$ to its target value,
    compactness of the bounded finite-block support proves (4.4).
    Permutation symmetry permits duplication of any chosen index.
  If ultrametricity failed, a supported triple could be chosen with $a_12 < a_13 lt.eq a_23$.
    Repeated duplication makes three groups of $m$ indices, preserving the three cross-group entries $a_12 \,
    a_13 \, a_23$. Within each group all off-diagonal entries stay at most its largest cross-group entry:
    this follows inductively from (4.4). Represent the resulting finite Gram matrix by vectors and let $u_1 \,
    u_2 \, u_3$ be their group averages. Then
  $ parallel u_2 parallel^2 \, parallel u_3 parallel^2 lt.eq D / m + (1 - 1 / m) a_23 \, wide u_2 dot.op u_3 =
    a_23 \, wide parallel u_1 parallel lt.eq sqrt(D) . $
  Hence $parallel u_2 - u_3 parallel^2 lt.eq 2 \( D - a_23 \) \/ m arrow.r 0$,
    whereas $u_1 dot.op \( u_3 - u_2 \) = a_13 - a_12 > 0$. Cauchy–Schwarz gives a contradiction.
    Applying exchangeability to all triples completes the proof. ◻
]

=== 4.2 Finite cascades and their sampling law <finite-cascades-and-their-sampling-law>

The hierarchical weights defined next are finite Ruelle probability cascades #cite(label("ruelle1987")).
  Their complete weights-and-ancestry sampling law was identified by Bolthausen and
  Sznitman #cite(label("bolthausensznitman1998")). We derive the needed sampling and transformation laws from the
  Poisson construction, including repeated visits to the same leaf.

Fix $0 = zeta_0 < zeta_1 < dots.h.c < zeta_k = 1$ and put $w_i = zeta_(i + 1) - zeta_i$.
  On a rooted tree of depth $k - 1$, the outgoing edge weights at each vertex of depth $i -
  1$ are the points of an independent Poisson process on $\( 0 \, oo \)$ with intensity

$ zeta_i x^(- 1 - zeta_i) thin d x \, wide 1 lt.eq i lt.eq k - 1 . $

Children may be indexed in decreasing order of these points.
  If $u_gamma$ is the product of the edge weights on the path to leaf $gamma$, define

#[#set math.equation(numbering: n => "(4.8)")
 $ T = sum_gamma u_gamma \, wide v_gamma = u_gamma \/ T . $ <arr:cascade-weights>]

For depth zero there is one leaf and $T = v_gamma = 1$. Write $gamma and
  eta$ for the depth of the deepest common vertex of two leaves; it ranges from $0$ to $k - 1$,
  including when the leaves are equal. The #emph[shape] of sampled labels records their nested ancestral
  partitions, without the numerical child indices.

#thm([Lemma 4.3.])[
  (Cascade law and finite-level uniqueness).  #emph[The total $T$ in (4.8) is almost surely finite and positive,
    with $bb(E) \[ \( log T \)^2 \] < oo$. For replicas sampled from $\( v_gamma \)$,
    the common-level array satisfies the Ghirlanda–Guerra property and
#[#set math.equation(numbering: n => "(4.9)")
 $ bb(P) \( gamma^1 and gamma^2 = i \) = w_i \, wide 0 lt.eq i lt.eq k - 1 . $ <arr:level-marginal>]

 Conversely, a weakly exchangeable ultrametric scalar array with the Ghirlanda–Guerra property and finitely many
   off-diagonal values has the same off-diagonal law as this cascade,
   with the levels replaced by its ordered values and with $w_i$ their marginal probabilities.
   Values of zero probability are omitted.]
] <arr:cascade>

#proof[
  We give the Poisson and sampling calculations, since the distribution of a descendant tree under sampling
    requires a power bias. If a Poisson process has intensity $C x^(- 1 - b) thin d x$, $0 < b < 1$,
    and its points are multiplied by independent positive marks $X$ with $0 < bb(E) X^b < oo$,
    the image process has intensity $C bb(E) X^b thin x^(- 1 - b) thin d x$.
    More precisely, after this change the attached mark law is biased by $X^b$, independently of the image point.
    This follows by substituting $y = x X$ in the marked intensity.
    Independent marking and mapping follow directly from the Poisson count law on disjoint sets,
    first for simple marks and then by approximation.
  The sum $S$ of points of intensity $C x^(- 1 - b) thin d x$ has Laplace transform
  #[#set math.equation(numbering: n => "(4.10)")
   $ bb(E) e^(- t S) = e^(- c t^b) \, wide c = C Gamma \( 1 - b \) \/ b > 0 . $ <arr:stable-laplace>]
  Indeed the Poisson exponential formula gives the exponent $-
    C integral_0^oo \( 1 - e^(- t x) \) x^(- 1 - b) thin d x = - c t^b$.
    The integral is finite; the formula proves both finiteness and positivity of the sum.
    For $0 < r < b$, integrating $1 - bb(E) e^(- t S)$ against $t^(- 1 - r) thin d t$ gives $bb(E) S^r < oo$.
    For every $r > 0$, the identity
  $ bb(E) S^(- r) = frac(1, Gamma \( r \)) integral_0^oo t^(r - 1) e^(- c t^b) thin d t $
  gives a finite negative moment. These moments imply a finite second moment for $log S$.
    Summing the tree from its last level upward and using the marking calculation proves the assertions about $T$:
    the descendant exponent is strictly larger than the exponent of the edge above it,
    so every required positive fractional moment exists.
  At a parent, let $b$ be the exponent on its outgoing edges. Multiply each edge point by its descendant total.
    The resulting child masses are Poisson points of intensity $C x^(- 1 - b) thin d x$,
    and their attached normalized descendant trees are independent of the points and have law biased by the
    descendant total to power $b$. If the parent tree itself is biased by its total to a power $lambda < b$,
    only the point process is further biased by the $lambda$th power of its sum;
    the conditional descendant description does not change. At the root $lambda = 0$,
    and thereafter $lambda$ is the incoming exponent.
  Here is the resulting partition law. Denote unbiased child masses by $\( X_j \)$ and their sum by $S$.
    Under the bias $S^lambda$, the probability of a specified partition of $m gt.eq
    1$ visits into $d$ nonempty child classes of sizes $m_1 \, dots.h \, m_d$ is
  #[#set math.equation(numbering: n => "(4.11)")
   $ p_lambda \( m_1 \, dots.h \, m_d \) & =
     frac(bb(E) [S^(- m + lambda) sum_(j_1 \, dots.h \, j_d med upright("distinct")) product_(r = 1)^d
     X_(j_r)^(m_r)], bb(E) S^lambda)\
 & = frac(product_(r = 1)^d C Gamma \( m_r - b \), Gamma \( m - lambda \) bb(E) S^lambda) integral_0^oo
   t^(d b - lambda - 1) e^(- c t^b) thin d t . $ <arr:partition-integral>]
  To derive this, insert the Laplace integral for $S^(- m + lambda)$ and use the Poisson exponential formula with
    $d$ distinct point insertions. Each insertion contributes $C integral_0^oo x^(m_r - b - 1) e^(- t x) thin d
    x = C Gamma \( m_r - b \) t^(b - m_r)$. For completeness,
    the insertion rule follows by first restricting to a finite-intensity process,
    summing its Poisson count series, and then letting the truncation grow;
    Tonelli’s theorem applies to the nonnegative integrands.
  The ratio of (4.11) after and before a visit to an existing class $r$ is
  #[#set math.equation(numbering: n => "(4.12)")
   $ frac(m_r - b, m - lambda) . $ <arr:join-child>]
  The complementary probability of creating a new child is $\( d b - lambda \) \/ \( m - lambda \)$.
    Observed deeper shapes do not alter (4.12), because the attached descendant trees are independent of the child
    masses. Equivalently the probabilities of complete shapes factor into the successive partition probabilities.
    Along an existing class at level $i$, these ratios telescope:
    after $n$ replicas, the probability that the next replica enters that class is
  #[#set math.equation(numbering: n => "(4.13)")
   $ frac(m_(*) - zeta_i, n) \, $ <arr:join-level>]
  where $m_(*)$ is its size. At level zero the class is the whole tree and the probability is one.
    With one previous replica, (4.13) gives $bb(P) \( gamma^1 and gamma^2 gt.eq i \) = 1 - zeta_i$, proving (4.9).
    With $n$ previous replicas, applying (4.13) to the class of replica $1$ gives exactly (4.1),
    first for upper-threshold tests and hence for every test on the finite set of levels.
  Conversely, the upper-threshold relations of a finite ultrametric array are nested equivalence relations.
    Conditional on its first $n$ indices, the Ghirlanda–Guerra property gives (4.13) for each existing class,
    using a representative of that class. These probabilities specify the distribution of the deepest existing
    class joined by the new index, and therefore of all its new pair entries.
    They coincide with the cascade probabilities. Induction on $n$, starting from the prescribed two-replica law,
    proves uniqueness. ◻
]

=== 4.3 Quantization and continuity of array laws <quantization-and-continuity-of-array-laws>

#thm([Lemma 4.4.])[
  (Ordered quantization with the original diagonal).  #emph[Let $B$ be nonnegative and ultrametric off the
    diagonal, with constant diagonal $D$ and entries at most $D$.
    Applying any nonnegative nondecreasing finite-valued map to its off-diagonal entries,
    with image contained in $\[ 0 \, D \]$, and retaining diagonal $D$, produces a Gram array.
    If $B$ has the Ghirlanda–Guerra property, its quantized off-diagonal law is the finite cascade law in Lemma 11.]
  #emph[More generally, suppose finitely many desired off-diagonal covariance entries are bounded nonnegative
    nondecreasing functions $a_j \( r \)$ of the scalar entries $r = B_(ell m)$, $ell eq.not m$,
    with $a_j \( r \) lt.eq D_j$. One can choose finite ordered bins of $r$ that approximate $r$ and every
    $a_j \( r \)$ uniformly on their domain, with errors tending to zero,
    while keeping each covariance diagonal equal to $D_j$. All the resulting covariance arrays are Gram.
    The binning can be chosen as a function of $r$ alone, so it never splits an atom of the scalar overlap law.]
] <arr:quantization>

#proof[
  Let the distinct quantized values be $c_0 < dots.h.c < c_s$.
    For a finite replica restriction, let $A_j$ be the matrix indicating that two indices belong to the same
    threshold class at level $c_j$, with diagonal entries one. Every $A_j$ is positive semidefinite:
    its quadratic form is the sum over classes of the squared sum of the coordinates in that class.
    The quantized matrix is
  #[#set math.equation(numbering: n => "(4.14)")
   $ c_0 upright(bold(1)) upright(bold(1))^(sans(T)) + sum_(j = 1)^s \( c_j - c_(j - 1) \) A_j + \( D - c_s \) I .
     $ <arr:gram-decomposition>]
  All coefficients are nonnegative. The Ghirlanda–Guerra property passes through the quantization map by the tower
    rule, so Lemma 11 identifies its law.
  For the joint assertion, bin $r$ and each $a_j \( r \)$ on meshes of size $epsilon$ and take their common
    refinement. Since every coordinate is nondecreasing, the nonempty joint bins are totally ordered.
    Choosing one actual vector $\( r \, a_1 \( r \) \, dots.h \, a_d \( r \) \)$ in each bin gives ordered
    representatives and error at most $epsilon$ in each coordinate.
    Use (4.14) separately for each coordinate, with its own diagonal $D_j$.
    The bins depend only on $r$, including at atoms. If the functions are specified only on a full-measure ordered
    domain, the construction on that domain suffices for every sampled array entry. ◻
]

#thm([Lemma 4.5.])[
  (Uniqueness and bounded-Lipschitz continuity).  #emph[For fixed diagonal $D$,
    the law of a nonnegative ultrametric Ghirlanda–Guerra array with values in $\[ 0 \, D \]$ is determined by its
    two-replica marginal. Such a law exists for every probability marginal on $\[ 0 \, D \]$.
    If the marginal quantiles $q_m \, q$ satisfy $parallel q_m - q parallel_(L^1 \( 0 \, 1 \)) arrow.r 0$,
    then the laws of every fixed finite replica block converge in bounded-Lipschitz distance.]
] <arr:law-continuity>

#proof[
  For uniqueness, round two candidate arrays on increasingly fine finite meshes.
    Their rounded marginals coincide, so Lemma 11 gives identical rounded array laws.
    Uniformly vanishing rounding error then identifies their original finite-block laws.
    For existence, approximate the desired quantile by ordered step functions, use finite cascades,
    and extract a limit of the bounded arrays. Their Gram property follows from (4.14);
    ultrametricity and the Ghirlanda–Guerra property pass to the limit. The limit has the desired marginal.
  If $q_m arrow.r q$ in $L^1$, their marginals converge weakly (in fact,
    coupling them by the same uniform variable bounds their Wasserstein distance by $parallel q_m -
    q parallel_1$). Any subsequential limit of the array laws has the Ghirlanda–Guerra property,
    is nonnegative and ultrametric, and has this limiting marginal.
    Uniqueness identifies it, proving convergence of the whole sequence.
    Weak convergence on the compact space of finite blocks is equivalent to convergence in bounded-Lipschitz
    distance. This is a continuity assertion; no rate independent of the finite-block size is needed. ◻
]

=== 4.4 Poisson displacement and the tilted mark law <poisson-displacement-and-the-tilted-mark-law>

The overlap sampling law does not by itself determine observables of the fresh Gaussian fields after reweighting.
  For example, for smooth $f$, restoring a pattern also changes the sampled values of $f'$.
  We therefore need the joint transformation of cascade weights and marks,
  developed by Panchenko and Talagrand #cite(label("panchenkotalagrand2007property")) Lemmas 2.1 and 3.1;
  see also #cite(label("panchenkotalagrand2007interpolation")) Section 3 for its role in Guerra’s interpolation.
  The following form keeps track of the root law and of independent additive mark components.

Draw root data independently of all Poisson edge processes.
  Conditional on an ancestor’s marked path, give its children independent marks with a common probability kernel,
  independently of the edge points. These kernels may depend on the marked path and its depth,
  but not on numerical child indices or Poisson weights. A shared Gaussian field with covariance levels $0 lt.eq
  b_0 lt.eq dots.h.c lt.eq b_(k - 1)$ is obtained by a common root increment of variance $b_0$ and independent
  vertex increments of variances $b_i - b_(i - 1)$.

#thm([Lemma 4.6.])[
  (Marked cascade transformation).  #emph[Let $X_(k - 1)$ be a terminal log factor depending on the marked path.
    For $i gt.eq 1$, let $bb(E)_i$ integrate the original level-$i$ child-mark kernel,
    conditional on the marked ancestor path through level $i - 1$,
    without averaging the Poisson weights or root data. Define
#[#set math.equation(numbering: n => "(4.15)")
 $ X_(i - 1) = 1 / zeta_i log bb(E)_i e^(zeta_i X_i) \, wide i = k - 1 \, dots.h \, 1 . $ <arr:mark-recursion>]

 Assume these transforms are finite; the bounded log factors and the Gaussian log factors with at most linear
   growth used below satisfy this condition. For $Z = sum_gamma v_gamma e^(X_(k - 1) \( gamma \))$,
#[#set math.equation(numbering: n => "(4.16)")
 $ bb(E) \[ log Z divides upright("root data") \] = X_0 \, wide
   bb(E) \[ \( log Z - X_0 \)^2 divides upright("root data") \] lt.eq 4 bb(E) \[ \( log T \)^2 \] . $ <arr:log-cascade>]

 Here $T$ is the unmarked total in (4.8).]
  #emph[After reweighting by $e^(X_(k - 1))$ and relabeling children,
    the joint law of normalized weights and marks can be generated by first drawing an ordinary unmarked cascade,
    independently of the root data, and then drawing marks on its vertices with kernels of densities
#[#set math.equation(numbering: n => "(4.17)")
 $ e^(zeta_i \( X_i - X_(i - 1) \)) \, wide 1 lt.eq i lt.eq k - 1 \, $ <arr:tilted-kernel>]

 relative to the original kernels, with independent draws on distinct children conditional on ancestor marks.
   Root data retain their original law. In particular, sampling reweighted leaves preserves their shape law;
   conditioning on that shape leaves exactly these mark kernels along the sampled branches.
   Independent mark components remain independent under these kernels when their original kernels factor and the
   terminal log factor is a sum of the separate component log factors.]
] <arr:tilt>

#proof[
  At every edge from level $i - 1$ to $i$, multiply its Poisson point by $e^(X_i - X_(i - 1))$ and reorder
    children. By (4.15), the conditional $zeta_i$th moment of this multiplier is one.
    The marked Poisson mapping calculation in the proof of Lemma 11 therefore leaves the point intensity unchanged
    and changes the attached mark kernel exactly by (4.17).
  The independence assertion requires doing this from the last level upward.
    Inductively, conditional on the path to a child, its transformed unmarked subtree has the ordinary unmarked
    law, independently of that path; its marks follow the transformed descendant kernels.
    Attach the entire transformed subtree as part of the child’s mark in the mapping at its parent.
    The multiplier depends only on the path through that child,
    so the mapping tilts the child kernel while keeping this conditional subtree law.
    This proves at the root that the transformed unmarked tree has its original law independently of root data,
    with marks generated by the stated conditional kernels.
  Products of the edge multipliers telescope. If $T^(*)$ is the transformed raw total, then
  #[#set math.equation(numbering: n => "(4.18)")
   $ Z = e^(X_0) T^(*) / T . $ <arr:raw-total-ratio>]
  Both $T$ and $T^(*)$ have the same conditional law given root data, with finite squared logarithms by Lemma 11.
    Taking the conditional expectation of the logarithm proves the first part of (4.16);
    the elementary square bound proves the second. No independence between $T$ and $T^(*)$ is asserted or required.
  The reweighted normalized masses are precisely the transformed masses,
    up to a relabeling that preserves ancestry. Sampling them consequently gives the ordinary cascade shape law.
    Conditional on the transformed unmarked tree, its mark kernels have the description just proved;
    hence sampling or conditioning on a shape does not further tilt those kernels.
    This independence concerns the transformed tree, not the original weights.
    Finally, factoring the expectations in (4.15) for an additive terminal log factor shows that the transforms
    add and the tilted component kernels factor. ◻
]

===== 4.4.1 Terminal variance and repeated visits. <terminal-variance-and-repeated-visits.>

Suppose a Gaussian mark has true diagonal variance $D$ and shared off-diagonal levels $b_i$, with $b_(k - 1) lt.eq
  D$. The cascade represents the shared field $y_gamma$. On each replica visit introduce an independent residual
  Gaussian of variance $D - b_(k - 1)$. Thus, for a positive leaf factor $A$,
  the factor to use in the cascade recursion is

#[#set math.equation(numbering: n => "(4.19)")
 $ overline(A) \( y \) = bb(E)_eta A #scale(x: 120%, y: 120%)[\(] y +
   sqrt(D - b_(k - 1)) thin eta #scale(x: 120%, y: 120%)[\)] . $ <arr:residual-average>]

After reweighting, a visited residual has density $A \( y + sqrt(D - b_(k - 1)) eta \) \/
  overline(A) \( y \)$ relative to its standard Gaussian law,
  independently on different visits conditional on their shared marks. This is an ordinary coefficient-one tilt.
  In particular, two replicas visiting the same leaf still use two independent residuals.
  Giving a leaf one permanent residual would incorrectly raise their off-diagonal covariance from $b_(k - 1)$ to
  $D$. These statements also hold for independent vector residuals and for additional finite-spin variables
  integrated in the leaf factor. The residual prescription realizes exactly the final diagonal term in (4.14).

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[common root $Z_0$]]])])
  content((-2, -1.25), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[leaf $gamma$: $y_ gamma$]]])])
  content((2, -1.25), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[leaf $eta$: $y_ eta$]]])])
  content((-3.3, -2.6), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[visit $1$: $y_ gamma + epsilon_1$]]])])
  content((-0.1, -2.6), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[visit $2$: $y_ gamma + epsilon_2$]]])])
  content((3.3, -2.6), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[visit $3$: $y_ eta + epsilon_3$]]])])
  line((-0.4938, -0.3086), (-1.469, -0.9181), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.4938, -0.3086), (1.489, -0.9304), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-2.32, -1.582), (-2.984, -2.272), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  line((-1.533, -1.582), (-0.5614, -2.272), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  line((2.308, -1.57), (2.996, -2.285), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: A two-leaf schematic of the Gaussian construction before reweighting. Shared increments belong to tree vertices, while residual noises belong to replica visits. The centered Gaussian residuals $epsilon.alt_1 \, epsilon.alt_2 \, epsilon.alt_3$ are independent and have variance $D - b_(k - 1)$, even though visits $1$ and $2$ have the same leaf label. ],
) <arr:residual-figure>

=== 4.5 Fresh Gaussian fields and passage through array limits <fresh-gaussian-fields-and-passage-through-array-limits>

#thm([Lemma 4.7.])[
  (Bounded reweighting of convergent arrays).  #emph[Let a sequence of random base probabilities have jointly
    convergent arrays of bounded observables and of the conditional covariances of finitely many fresh centered
    Gaussian fields. The fields are sampled independently of the base probability conditional on its data,
    with any specified independence between field components.
    Then the following averages converge, as determined by those limiting arrays:]
  + #emph[bounded continuous functions of the listed observable and field evaluations on finitely many base replicas;]
  + #emph[the same tests after reweighting by a fixed continuous function of the listed evaluations at one
    replica, bounded between two fixed positive constants;]
  + #emph[the expected logarithm of the normalizing integral of that factor.]
  #emph[Independent finite-spin averages may be included. The assertion remains valid at singular limiting
    covariance matrices. If the limiting off-diagonal covariance entries are ordered functions of a scalar
    ultrametric Ghirlanda–Guerra array, its evaluations can be obtained by the quantized cascades of Lemma 12,
    retaining the true diagonal variances and using (4.19), provided the base observables and tests used in the
    evaluation are also approximated by these bins in probability on every finite replica restriction.
    This condition includes constants and continuous tests of the scalar overlap and the quantized covariance
    coordinates.]
] <arr:limit>

#proof[
  On any fixed number of base replicas, the conditional joint Gaussian law is a continuous function of its
    covariance matrix, also on the boundary of the positive semidefinite cone.
    For example, couple it as $C^(1 \/ 2) g$; the nonnegative matrix square root is continuous and the Gaussian
    vector $g$ has fixed dimension. Bounded continuous tests therefore pass to the joint array limit.
  Write the positive reweighting factor as $A$, and let $Z = P \( A \)$ for the base probability $P$.
    If $0 < c lt.eq A lt.eq C$, then $c lt.eq Z lt.eq C$. An $r$-replica reweighted test has expectation
  $ bb(E) [Z^(- r) P^(⊗ r) (F product_(ell = 1)^r A_ell)] . $
  Uniformly approximate $z^(- r)$ on $\[ c \, C \]$ by polynomials.
    Each monomial $Z^j$ is represented by $j$ additional base replicas, evaluated in the same fresh fields.
    The resulting terms are finite-replica tests covered by the first part,
    and the uniform approximation controls the error. Approximating $log
    z$ on the same interval proves the logarithmic assertion.
    Finite-spin variables are simply additional independent base variables in this argument.
  Finally quantize all the ordered covariance coordinates jointly.
    Their finite-replica matrices converge by Lemma 12, and the other observables and tests converge by the
    additional approximation hypothesis. Gaussian continuity and the same polynomial argument therefore apply.
    The shared Gaussian construction with independent residuals has exactly those matrices,
    including on repeated leaf visits. Lemma 11 identifies the quantized shape law,
    and Lemma 14 evaluates its bounded reweightings. Unbounded factors require an additional uniform-integrability
    argument; the cavity calculation below supplies the particular truncation estimate it needs. ◻
]

#thm([Lemma 4.8.])[
  (Evaluation of one fresh pattern).  #emph[Suppose that the limiting spin-overlap array of a sequence of base
    Gibbs probabilities has diagonal one, is Gram, and satisfies the Ghirlanda–Guerra property.
    Let $p$ be the quantile of its off-diagonal two-replica law.
    For a fresh independent Gaussian pattern field $g \( x \)$ with conditional covariance $R \( x \, x' \)$,
    and bounded continuous $f$,
#[#set math.equation(numbering: n => "(4.20)")
 $ lim bb(E) log chevron.l e^(f \( g \( x \) \)) chevron.r = V_f \( p \) \, $ <arr:fresh-pattern-value>]

 whenever $V_f$ is understood through its continuous quantile extension.
   In particular this applies to the smooth potentials used in the proof before the final approximation step.]
] <arr:fresh-pattern>

#proof[
  Theorem 10 gives positivity and ultrametricity. Lemma 15 passes the bounded positive factor through the array
    limit. Round the off-diagonal overlap into levels $p_0 lt.eq dots.h.c lt.eq
    p_(k - 1)$ with probabilities $w_i$, leaving its diagonal one.
    On the corresponding cascade, first integrate the independent variance $1 - p_(k - 1)$ at each visit.
    The terminal shared-field log factor is consequently
  $ U_(k - 1) \( x \) = log bb(E) e^(f \( x + sqrt(1 - p_(k - 1)) G \)) . $
  The remaining branch transforms have coefficients $zeta_(k - 1) \, dots.h \, zeta_1$, by Lemma 14,
    and the common root Gaussian is averaged with coefficient zero.
    These are precisely the defining transforms of $V_f$ on the rounded step quantile:
    its final coefficient is one, and its initial coefficient is zero.
    Sending the rounding error to zero proves (4.20), by Lemma 15 and continuity of the recursion in its quantile.
    For bounded continuous $f$ this also supplies a direct description of that extension:
    Lemma 13 and the bounded reweighting argument show that the cascade values have a unique continuous limit. ◻
]

=== 4.6 Gaussian Gibbs calculus and variance bounds <gaussian-gibbs-calculus-and-variance-bounds>

#thm([Lemma 4.9.])[
  (Gaussian differentiation).  #emph[Let $P$ be a probability reference measure,
    possibly random but independent of the Gaussian fields under consideration.
    For independent centered Gaussian energies with covariances $C_0 \, C_1$, interpolate using $H_t =
    sqrt(1 - t) thin H_0 + sqrt(t) thin H_1$, and put $Delta = C_1 - C_0$. Then
#[#set math.equation(numbering: n => "(4.21)")
 $ frac(d, d t) bb(E) log P \( e^(H_t) \) = 1 / 2 bb(E) chevron.l Delta_11 -
   Delta_12 chevron.r_t . $ <arr:gaussian-log-derivative>]

 For a bounded $r$-replica test $F$ independent of these fields,
#[#set math.equation(numbering: n => "(4.22)")
 $ frac(d, d t) bb(E) chevron.l F chevron.r_t = 1 / 2 bb(E) chevron.l F #scale(x: 300%, y: 300%)[\(] &
   sum_(a \, b = 1)^r Delta_(a b) - 2 r sum_(a = 1)^r Delta_(a \, r + 1)\
 & + r \( r + 1 \) Delta_(r + 1 \, r + 2) - r Delta_(r + 1 \, r + 1) #scale(x: 300%, y: 300%)[\)] chevron.r_t \,
   $ <arr:replica-derivative>]

 so its magnitude is at most $\( 2 r^2 + r \) parallel F parallel_oo parallel Delta parallel_oo$.
   If an independent centered Gaussian field $Y$ of covariance $C$ enters the energy with coefficient $s$,
   Gaussian integration by parts also gives
#[#set math.equation(numbering: n => "(4.23)")
 $ bb(E) chevron.l Y \( 1 \) F chevron.r = s thin bb(E) ⟨F (sum_(a = 1)^r C_(1 a) - r C_(1 \, r + 1))⟩ .
   $ <arr:gaussian-insertion>]

 These formulas hold for finite spin spaces with countably many cascade labels whenever the covariances are
   bounded at the fixed system size. They can be integrated up to the endpoints of covariance segments.]
] <arr:calculus>

#proof[
  For finitely many states, differentiate the coupling $H_t$ and apply ordinary Gaussian integration by parts.
    This contracts one half of the energy Hessian with $Delta$.
    A derivative of a normalized $r$-replica integral inserts the sum over its $r$ sampled states minus $r$ times
    the insertion at one extra replica. A second derivative and contraction give (4.22);
    the sum of its absolute coefficients, including the factor $1 \/ 2$, is $2 r^2 + r$.
    The first derivative of the log partition gives (4.21), and a single integration by parts gives (4.23).
  To pass to countable labels, truncate to increasing finite label sets chosen independently of the added fields
    and renormalize their reference weights. Uniform integrability follows from elementary Gaussian moment bounds.
    For example, if a Gaussian energy has pointwise variance at most $K$, then,
    conditionally on its independent probability reference,
  #[#set math.equation(numbering: n => "(4.24)")
   $ bb(E) Z^p lt.eq e^(p^2 K \/ 2) \, wide bb(E) Z^(- p) lt.eq e^(p^2 K \/ 2) \, wide Z = P \( e^H \) \, quad
     p gt.eq 1 . $ <arr:partition-moments>]
  The first inequality is Jensen’s inequality for $x^p$; the second uses $\[ P \( e^H \) \]^(- p) lt.eq
    P \( e^(- p H) \)$. Cauchy–Schwarz and the same single-state Gaussian moments control polynomial Gaussian
    insertions, and exponentials of sums of absolute values of finitely many such fields.
    Thus Gibbs derivatives, their Gaussian insertions, and the logarithms have uniformly integrable bounds on
    compact coefficient sets. The truncated integrals converge almost surely and in the necessary moments.
    Bounded pattern log factors can be absorbed into the reference; if estimates retain them explicitly,
    their exponential costs are integrable for either a fixed count or an independent Poisson count.
  Integrate the finite-state covariance derivative first and then pass to the limit using its uniform bound.
    Gaussian coupling and the same moment bounds give continuity at segment endpoints.
    Ordinary energy parameter derivatives and (4.23) pass to the limit by the polynomial-insertion bounds.
    This proves the stated extensions. ◻
]

#thm([Lemma 4.10.])[
  (Elementary variance estimates).  #emph[A function of finite standard Gaussian data with Euclidean Lipschitz
    constant $A$ has variance at most $A^2$. A function of independent inputs whose value changes by at most $c_i$
    when input $i$ is replaced has variance at most $sum_i c_i^2$.
    If a function $a$ on the integers has Lipschitz constant $c$ and $K$ is Poisson with mean $lambda$,
    then $"Var" \( a \( K \) \) lt.eq c^2 lambda$.]
] <arr:variance>

#proof[
  For a smooth function of Gaussian data, interpolate two standard Gaussian copies from independent to identical,
    with cross covariance $t I$. Gaussian integration by parts differentiates their product expectation into the
    expectation of their gradient inner product. Integrating from zero to one and using the gradient bound proves
    the first claim. Truncation and smoothing extend it to Lipschitz functions.
    For the second, reveal the independent inputs successively and sum the variances of the martingale
    differences, each bounded by $c_i^2$. For the third, let $K'$ be an independent copy and use
  $ "Var" \( a \( K \) \) = 1 / 2 bb(E) \[ \( a \( K \) - a \( K' \) \)^2 \] lt.eq c^2 /
    2 bb(E) \[ \( K - K' \)^2 \] = c^2 lambda . $
  ◻
]

== 5 The upper bound by enriched affine comparison <upper:section>

We continue to assume $f in C_c^oo \( bb(R) \)$. The upper bound uses a finite cascade as an additional Gibbs
  coordinate. A Gaussian perturbation with vanishing pressure cost forces the joint overlap identities at
  deterministic minimizers of a comparison functional. The field derivatives at those minimizers give precisely
  the tail order needed in Proposition 5. The comparison combines Gaussian interpolation in the tradition of
  Guerra #cite(label("guerra2003")) with Mourrat’s enriched supersolution method #cite(label("mourrat2021"))
  Section 4. In particular, the use of penalized deterministic contact points to obtain overlap identities follows
  the strategy of that work. We give the estimates for the present model,
  where Poisson differentiation of the pattern density replaces the Gaussian interaction derivative.

#thm([Proposition 5.1.])[
  (Upper bound).  #emph[For every nondecreasing $\[ 0 \, 1 \]$-valued path $q$,
#[#set math.equation(numbering: n => "(5.1)")
 $ limsup_(N arrow.r oo) bb(E) p_N lt.eq alpha V_f \( q \) + S_(upright(I)) \( q \) . $ <upper:conclusion>]

 Consequently the limit superior is bounded above by the variational infimum in Theorem 3.]
] <upper:bound>

=== 5.1 The enriched model and its finite-size estimates <the-enriched-model-and-its-finite-size-estimates>

We use the cascade-field enrichment of Mourrat and Panchenko #cite(label("mourratpanchenko2020")):
  the cascade label is an additional Gibbs coordinate, and a hierarchical Gaussian magnetic field probes the spin
  overlap. The diagonal subtraction below uses the same normalization principle.
  The nonlinear patterns act only on the spins.

Fix a step path $q$ on the partition $0 = zeta_0 < dots.h.c < zeta_k = 1$,
  with $q_(k - 1) < 1$ and $S_(upright(I)) \( q \) < oo$. Use the depth-$\( k - 1 \)$ cascade of Lemma 11,
  with leaf weights $v_gamma$ and common level $gamma and eta$.
  When $k = 1$ the cascade has its single root leaf of weight one.
  The reference probability on pairs $\( x \, gamma \)$ is $nu_N \( d x \) v_gamma$. Define

$ R \( x \, x' \) = frac(x dot.op x', N) \, wide T \( gamma \, eta \) = frac(gamma and eta, k) . $

The array $T$ is positive semidefinite: assign independent Gaussian increments of variance $1 \/
  k$ to each edge of the tree and sum them along each root-to-leaf path. The covariance of these sums is $T$.
  Its diagonal is $\( k - 1 \) \/ k$, including the value zero for $k = 1$.

Let $0 lt.eq t lt.eq alpha$ and let $K$ be Poisson with mean $N t$.
  The $K$ independent Gaussian patterns act only on $x$. For a field path $0 lt.eq h_0 lt.eq dots.h.c lt.eq
  h_(k - 1)$, add the energy

$ z \( gamma \) dot.op x - N / 2 h_(k - 1) \, $

where the $N$ coordinates of $z$ are independent centered Gaussian fields on the cascade,
  each with covariance $h_(gamma and eta)$. They are constructed from common root increments of variance $h_0$ and
  independent vertex increments of variances $h_i - h_(i - 1)$ thereafter.

Enumerate the monomials

$ kappa_j \( R \, T \) = R^p T^d \, wide p \, d in { 0 \, 1 \, 2 \, dots.h } \, quad p + d gt.eq 1 \, $

so that every such monomial has a fixed finite index $j$. The convention is $T^0 = 1$, also when $T = 0$.
  There are independent centered Gaussian fields $Y_j \( x \, gamma \)$ with these covariances.
  One explicit construction uses a standard Gaussian tensor contracted with $\( x \/ sqrt(N) \)^(⊗ p)$ to produce
  covariance $R^p$ (a scalar Gaussian for $p = 0$). For $d > 0$,
  place independent copies at the vertices and multiply them by square roots of the increments of
  $\( i \/ k \)^d$; for $d = 0$ use just a common root copy. The resulting covariance is the indicated product.
  This also covers identically zero covariances without exception.

All these fields are independent of the patterns and the field $z$. Set

#[#set math.equation(numbering: n => "(5.2)")
 $ e_N = N^(- 1 \/ 16) \, wide sqrt(N) e_N sum_(j = 1)^N 2^(- j) u_j Y_j \( x \, gamma \) \, wide 1 lt.eq
   u_j lt.eq 2 \, $ <upper:perturbation>]

and add this perturbation to the energy. Denote the random pressure of the resulting model by
  $P_N \( t \, h \, u \)$ and put

#[#set math.equation(numbering: n => "(5.3)")
 $ F_N \( t \, h \, u \) = - bb(E) P_N \( t \, h \, u \) . $ <upper:F>]

Every parameter is held deterministic in this expectation.
  The diagonal and the absolute value of every covariance $kappa_j$ are at most one,
  so the perturbation covariance is bounded by $C N e_N^2$.
  Lemma 17 therefore shows that turning the perturbation on or off changes the expected pressure by at most $C
  e_N^2$, uniformly in these parameters. At the energy scale, however,
  the coefficient of each fixed $Y_j$ grows like $sqrt(N) e_N = N^(7 \/ 16)$;
  this is the scale against which its fluctuations will be compared.

At $t = 0$ with the perturbation removed, spin integration at a leaf gives the product $product_(a = 1)^N cosh
  z_a \( gamma \)$. The independent-coordinate form of Lemma 14 and the diagonal subtraction imply

#[#set math.equation(numbering: n => "(5.4)")
 $ bb(E) P_N \( 0 \, h \, upright("no perturbation") \) = ell \( h \) . $ <upper:initial-value>]

With patterns and perturbations present, one can instead apply that lemma to the complete spin log integral at
  each leaf. Conditional on patterns, count, and common root Gaussian data,
  the remaining vertex marks have exactly the conditional independence required there.
  Hence the sampled label shape has the original cascade law. In particular, for every $N \, t \, h \, u$,

#[#set math.equation(numbering: n => "(5.5)")
 $ bb(E) chevron.l upright(bold(1))_({ gamma^1 and gamma^2 = i }) chevron.r = w_i . $ <upper:label-law>]

#thm([Lemma 5.2.])[
  (Uniform concentration on a field cap).  #emph[For each fixed $H < oo$ there is a constant $C_H$,
    also depending on the fixed partition, $alpha$, and $f$, such that
#[#set math.equation(numbering: n => "(5.6)")
 $ "Var" \( P_N \( t \, h \, u \) \) lt.eq C_H / N $ <upper:variance>]

 whenever $0 lt.eq t lt.eq alpha$, $0 lt.eq h_0 lt.eq dots.h.c lt.eq h_(k - 1) lt.eq H$, and $u in \[ 1 \, 2 \]^N$.]
] <upper:concentration>

#proof[
  Write $L_N = N P_N$. Put the patterns, their count, and all common root Gaussian variables into the root data.
    Apply Lemma 14 to the leaf spin log integral. If $X_0$ is the resulting recursion value at the root,
    that lemma gives
  $ bb(E) \[ L_N divides upright("root data") \] = X_0 \, wide
    bb(E) \[ \( L_N - X_0 \)^2 divides upright("root data") \] lt.eq C_zeta . $
  The second assertion can also be seen directly: $L_N - X_0$ is the difference between the logarithms of the
    transformed and original unnormalized cascade totals. Each total has the original conditional law,
    whose logarithm has finite second moment depending only on the fixed cascade.
    The two totals need not be independent for this bound.
  Conditional on $K$, the norm of the coefficient vector of the common Gaussian variables in the energy at any
    fixed state is at most $C_H sqrt(N)$. Indeed its squared norm is the sum of the common variances,
    bounded by $N H + C N e_N^2$. The spin log integral has the same Lipschitz constant in these variables:
    the difference of two log integrals is bounded by the supremum of the difference of their energies.
    Every subsequent log-exponential transform preserves such a uniform change bound.
    Thus $X_0$ has Gaussian variance at most $C_H N$ by Lemma 18.
    Replacing one of the $K$ patterns changes $X_0$ by at most $2 parallel f parallel_oo$,
    because this bound holds for every leaf energy and is preserved by each recursion.
    The independent-input variance bound therefore adds at most $C K$. Combining these independent blocks gives
  $ "Var" \( X_0 divides K \) lt.eq C_H N + C K . $
  The conditional mean $bb(E) \[ X_0 divides K = m \]$ changes by at most $parallel f
    parallel_oo$ between $m$ and $m + 1$, by adding one pattern under a coupling.
    If $K'$ is an independent copy, the independent-copy variance formula bounds the variance of this conditional
    mean by $parallel f parallel_oo^2 bb(E) \( K - K' \)^2 \/ 2 = parallel f parallel_oo^2 N t$.
    The total variance of $L_N$ is consequently $O_H \( N \)$. Division by $N^2$ proves (5.6). ◻
]

#thm([Lemma 5.3.])[
  (Derivatives of the comparison function).  #emph[The function $F_N$ is continuous on the parameter region above.
    For every nonnegative nondecreasing direction $lambda$ on the fixed partition,
    its right directional derivative in $h$ is
#[#set math.equation(numbering: n => "(5.7)")
 $ partial_(h \, lambda) F_N = 1 / 2 bb(E) chevron.l R_12 lambda_(gamma^1 and gamma^2) chevron.r .
   $ <upper:field-derivative>]

 For $t > 0$, its time derivative is
#[#set math.equation(numbering: n => "(5.8)")
 $ partial_t F_N = - bb(E) log ⟨exp f \( hat(g) dot.op x \/ sqrt(N) \)⟩ \, $ <upper:time-derivative>]

 where $hat(g)$ is an independent standard Gaussian pattern.]
] <upper:derivatives>

#proof[
  Increasing $h$ by $a lambda$ adds an independent Gaussian energy with covariance
  $ a N R \( x \, x' \) lambda_(gamma and eta) . $
  It also changes the deterministic subtraction by $- a N lambda_(k - 1) \/ 2$.
    The diagonal covariance term in Lemma 17 cancels this subtraction,
    proving (5.7) after reversing the pressure sign. Poisson differentiation gives
  $ frac(d, d t) bb(E) L_N \( K \) = N bb(E) \[ L_N \( K + 1 \) - L_N \( K \) \] \, $
  whose increment is the logarithm in (5.8). Its absolute value is bounded by $parallel f parallel_oo$,
    so differentiating the Poisson series and passing to its limits are justified.
    Continuity in $t$ follows also by coupling Poisson counts.
    Continuity in $h$ follows by coupling the vertex increments and the Gaussian interpolation estimates,
    including at zero increments; continuity in $u$ follows from ordinary Gaussian-coupling differentiation.
    The countable label set is handled by the field-independent finite truncations and moment bounds in Lemma 17. ◻
]

=== 5.2 Deterministic minimizers and their overlap identities <deterministic-minimizers-and-their-overlap-identities>

The quadratic penalty and concentration argument at the minimizing parameters implement the contact-point
  construction in Mourrat #cite(label("mourrat2021")) Section 4, in particular equations (4.19)–(4.28).
  The proof is included because the pattern contribution and its concentration estimates differ from those of the
  Gaussian bipartite Hamiltonian treated there.

Suppose, contrary to the step version of (5.1), that for some $eta > 0$ and an infinite sequence of dimensions,

$ bb(E) p_N gt.eq S_(upright(I)) \( q \) + alpha V_f \( q \) + eta . $

Couple $floor.l alpha N floor.r$ patterns to a Poisson count of mean $N alpha$ by using the same initial rows.
  The pressure change in expectation is at most

$ frac(parallel f parallel_oo, N) bb(E) \| K - floor.l alpha N floor.r \| = O \( N^(- 1 \/ 2) \) . $

Choose $delta > 0$ with $alpha delta < eta \/ 4$. On the compact parameter region

$ 0 lt.eq t lt.eq alpha \, quad 0 lt.eq h_0 lt.eq dots.h.c lt.eq h_(k - 1) lt.eq H \, quad u in \[ 1 \, 2 \]^N \, $

minimize the continuous function

#[#set math.equation(numbering: n => "(5.9)")
 $ J_N \( t \, h \, u \) =  & F_N \( t \, h \, u \) - 1 / 2 sum_(i = 0)^(k - 1) w_i q_i h_i +
   S_(upright(I)) \( q \) + t { V_f \( q \) + delta }\
 & + sum_(j = 1)^N 2^(- j) \( u_j - 3 \/ 2 \)^2 . $ <upper:objective>]

The fixed field cap $H$ will now be chosen.

#thm([Lemma 5.4.])[
  (The field cap is coercive).  #emph[For the fixed partition,
#[#set math.equation(numbering: n => "(5.10)")
 $ ell \( h \) lt.eq \( bb(E) \| G \| \) sqrt(h_0) + C_zeta - 1 /
   2 sum_(i = 0)^(k - 1) w_i h_i . $ <upper:field-growth>]

 For sufficiently large fixed $H$, every sufficiently large dimension in the violating sequence has a minimizer of
   (5.9) satisfying $t > 0$ and $h_(k - 1) < H$.]
] <upper:coercive>

#proof[
  Start from $log cosh x lt.eq \| x \|$. For $d > 0$,
  $ cal(T)_(s \, d) \( \| dot.op \| + c \) \( x \) lt.eq \| x \| + c + frac(d s, 2) + frac(log 2, d) \, $
  because $e^(d \| x + sqrt(s) G \|) lt.eq e^(d \( x + sqrt(s) G \)) + e^(- d \( x + sqrt(s) G \)) lt.eq
    e^(d \| x \|) \( e^(d sqrt(s) G) + e^(- d sqrt(s) G) \)$ after taking expectations.
    Propagate this bound through levels $k - 1 \, dots.h \, 1$ and then average $\| sqrt(h_0) G \|$ at the root.
    The variance-dependent constant is
  $ - h_(k - 1) / 2 + 1 / 2 sum_(i = 1)^(k - 1) zeta_i \( h_i - h_(i - 1) \) = - 1 / 2 sum_(i = 0)^(k - 1) w_i h_i \, $
  which proves (5.10), with $C_zeta = sum_(i = 1)^(k - 1) \( log 2 \) \/ zeta_i$; the sum is zero if $k = 1$.
  Adding the patterns changes pressure by at most $alpha parallel f parallel_oo$ in expectation,
    and the perturbation cost is $O \( e_N^2 \)$. Thus
  $ F_N \( t \, h \, u \) gt.eq - ell \( h \) - alpha parallel f parallel_oo - O \( e_N^2 \) . $
  Since $S_(upright(I)) \( q \) gt.eq 0$, $\| V_f \( q \) \| lt.eq parallel f parallel_oo$,
    and the quadratic penalty is nonnegative, on $h_(k - 1) = H$ this gives the uniform lower bound
  #[#set math.equation(numbering: n => "(5.11)")
   $ J_N \( t \, h \, u \) gt.eq frac(w_(k - 1) \( 1 - q_(k - 1) \), 2) H - \( bb(E) \| G \| \) sqrt(H) - C_zeta -
     2 alpha parallel f parallel_oo - O \( e_N^2 \) . $ <upper:cap-bound>]
  The linear coefficient is strictly positive, so choose $H$ large enough that this lower bound is positive for
    all large $N$. At $t = 0$, the entropy definition and (5.4) instead give $J_N \( 0 \, h \, u \) gt.eq -
    O \( e_N^2 \)$. Finally, testing $t = alpha$, $h = 0$, and $u_j = 3 \/ 2$ gives $J_N lt.eq -
    eta \/ 2$ for all sufficiently large dimensions in the violating sequence, by the Poisson coupling,
    the choice of $delta$, and the perturbation bound. Hence a minimizing triple lies on neither of the excluded
    faces. ◻
]

Choose a deterministic minimizing triple $\( t_N \, h_N \, u_N \)$ for each such dimension.
  Comparing it with the same $\( t_N \, h_N \)$ and all $u_j = 3 \/ 2$ shows that

#[#set math.equation(numbering: n => "(5.12)")
 $ sum_(j = 1)^N 2^(- j) \( u_(N \, j) - 3 \/ 2 \)^2 = O \( e_N^2 \) \, wide u_(N \, j) = 3 \/ 2 +
   O_j \( e_N \) quad upright("for fixed ") j . $ <upper:penalty>]

Indeed any two allowed perturbations have expected pressures within $O \( e_N^2 \)$ of the unperturbed model.
  In particular, each fixed coordinate of $u_N$ is eventually interior.

#thm([Lemma 5.5.])[
  (Joint identities at deterministic minimizers).  #emph[Every subsequential limit of the sampled joint arrays
    $\( R \, T \)$ at these deterministic minimizing triples satisfies the joint Ghirlanda–Guerra identities of
    Definition 9.]
] <upper:gg>

#proof[
  Fix $j$. All derivatives in this proof hold $\( t_N \, h_N \)$ and the other perturbation coordinates fixed.
    Abbreviate $a_(N \, j) = sqrt(N) e_N 2^(- j)$ and $g \( v \) =
    bb(E) P_N \( t_N \, h_N \, u_1 \, dots.h \, v \, dots.h \, u_N \)$. Ordinary Gibbs differentiation gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ partial_(u_j) P_N & = frac(e_N 2^(- j), sqrt(N)) chevron.l Y_j chevron.r \,\
g'' \( u_(N \, j) \) & = e_N^24 ""^(- j) bb(E) chevron.l \( Y_j - chevron.l Y_j chevron.r \)^2 chevron.r .
  $ <upper:u-derivatives>]
  The random function $P_N$ is convex in $u_j$, since it is a log integral of an energy affine in that coordinate.
    We first control the Gibbs fluctuation of $Y_j$ around $chevron.l Y_j
    chevron.r$ by the curvature at the minimum. We then control the disorder fluctuation of $chevron.l Y_j
    chevron.r$ by finite differences. Both estimates hold at the chosen deterministic coordinate $u_(N \, j)$,
    without averaging it.
  Interior minimality of $J_N$ implies $g' \( u_(N \, j) \) =
    2 dot.op 2^(- j) \( u_(N \, j) - 3 \/ 2 \)$ and $g'' \( u_(N \, j) \) lt.eq 2 dot.op 2^(- j)$. Consequently
  #[#set math.equation(numbering: n => "(5.14)")
   $ bb(E) chevron.l \| Y_j - chevron.l Y_j chevron.r \| chevron.r lt.eq C_j e_N^(- 1) . $ <upper:thermal>]
  For the disorder fluctuation, use minimality over an interval around $u_(N \, j)$.
    Cancellation of the linear term gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ 0 lt.eq g \( u_(N \, j) plus.minus s \) - g \( u_(N \, j) \) minus.plus s g' \( u_(N \, j) \) lt.eq
     2^(- j) s^2 $ <upper:taylor>]
  whenever both displaced coordinates lie in $\[ 1 \, 2 \]$. The first inequality uses convexity of $g$.
  For any differentiable convex random function, its derivative at a point lies between the backward and forward
    difference quotients. Apply this fact to $P_N$ with step $s$, and subtract $g' \( u_(N \, j) \)$.
    The mean quotient errors are at most $2^(- j) s$ by (5.15).
    Replacing each of the three random function values by its expectation costs at most $C_H \/ \( s sqrt(N) \)$
    in $L^1$, by Lemma 20. Taking the positive and negative parts therefore yields
  #[#set math.equation(numbering: n => "(5.16)")
   $ bb(E) \| partial_(u_j) P_N - g' \( u_(N \, j) \) \| lt.eq C_j s +
     frac(C_H, s sqrt(N)) . $ <upper:derivative-fluctuation>]
  By (5.12), $s = N^(- 1 \/ 4)$ is eventually allowed. Then the right side is $O_j \( N^(- 1 \/ 4) \) =
    o \( e_N^2 \)$. Multiplying by $sqrt(N) \/ \( e_N 2^(- j) \)$ in (5.13), and adding (5.14), gives
  #[#set math.equation(numbering: n => "(5.17)")
   $ bb(E) chevron.l \| Y_j - bb(E) chevron.l Y_j chevron.r \| chevron.r =
     o \( sqrt(N) e_N \) . $ <upper:Y-concentration>]
  Explicitly, the two contributions are $O_j \( N^(1 \/ 16) \)$ and $O_j \( N^(5 \/ 16) \)$,
    whereas $sqrt(N) e_N = N^(7 \/ 16)$. All assertions concern one fixed $j$ at a time;
    no bound uniform in $j lt.eq N$ is needed.
  Let $D$ be a bounded continuous function of the first $n times n$ joint overlap block, $n gt.eq 2$.
    Gaussian integration by parts in the field $Y_j$ gives
  #[#set math.equation(numbering: n => "(5.18)")
   $ bb(E) chevron.l Y_j \( 1 \) D chevron.r = a_(N \, j) u_(N \, j) thin bb(E) ⟨D
     (sum_(l = 1)^n kappa_j \( R_(1 l) \, T_(1 l) \) - n kappa_j \( R_(1 \, n + 1) \, T_(1 \, n + 1) \))⟩ .
     $ <upper:ibp>]
  The overlap test has no direct dependence on the Gaussian coordinates of $Y_j$, so Lemma 17 applies.
    By (5.17), the left side equals $bb(E) chevron.l Y_j chevron.r bb(E) chevron.l D chevron.r +
    o \( sqrt(N) e_N \)$. The single-replica version of (5.18) reads
  $ bb(E) chevron.l Y_j chevron.r = a_(N \, j) u_(N \, j) { kappa_j \( 1 \, \( k - 1 \) \/ k \) -
    bb(E) chevron.l kappa_j \( R_12 \, T_12 \) chevron.r } . $
  Substitute this expression and cancel the constant diagonal. After division by $n a_(N \, j) u_(N \, j)$, one obtains
  $ bb(E) chevron.l D kappa_j \( R_(1 \, n + 1) \, T_(1 \, n + 1) \) chevron.r =  & 1 /
    n bb(E) chevron.l D chevron.r bb(E) chevron.l kappa_j \( R_12 \, T_12 \) chevron.r\
 & + 1 / n sum_(l = 2)^n bb(E) chevron.l D kappa_j \( R_(1 l) \, T_(1 l) \) chevron.r + o \( 1 \) . $
  Pass to a joint array subsequence, which exists because the entries range over a compact set.
    The identity holds for every fixed monomial and hence, by linearity and uniform polynomial approximation,
    for every continuous function of a pair $\( R \, T \)$. Continuous tests of the finite block determine its
    measures, so the same identities hold with every bounded measurable block test.
    This is the full conditional-law formulation in Definition 9. ◻
]

=== 5.3 Ordered supports and the derivative contradiction <ordered-supports-and-the-derivative-contradiction>

The no-crossing argument below is the monotone-coupling mechanism in spin-glass synchronization;
  compare Panchenko #cite(label("panchenko2015multispecies")) Section 4, Lemma 2.
  Its input here is the joint identity already proved for the spin and tree overlaps.

#thm([Lemma 5.6.])[
  (Ordered coupling of the spin and tree overlaps).  #emph[In any joint array limit from Lemma 23,
    the two-replica law of $\( R_12 \, T_12 \)$ is supported on a set ordered in both coordinates.
    If $p$ is the quantile of $R_12$, the conditional law of $R_12$ given $T_12 =
    i \/ k$ is the law of $p \( U \)$ for $U$ uniform on $\( zeta_i \, zeta_(i + 1) \)$.]
] <upper:synchronization>

#proof[
  The arrays $R$ and $R + T$ are Gram arrays of constant diagonal,
    and their scalar identities follow from the joint identities.
    Theorem 10 therefore makes both arrays ultrametric and makes the off-diagonal entries of $R$ nonnegative.
    They are at most one by its Gram diagonal. The tree array $T$ is already ultrametric.
  Suppose the two-replica support contained two strictly crossed points.
    Choose small neighborhoods $A \, B$ of these points so that every $\( r \, t \) in A$ and $\( r' \, t' \) in
    B$ satisfy $r < r'$ and $t > t'$. Both neighborhoods have positive two-replica probability.
    The joint conditional law with $n = 2$ then gives
  $ bb(P) #scale(x: 120%, y: 120%)[\(] \( R_12 \, T_12 \) in A \, \( R_13 \, T_13 \) in B
    #scale(x: 120%, y: 120%)[\)] gt.eq 1 / 2 bb(P) \( \( R_12 \, T_12 \) in A \)
    bb(P) \( \( R_12 \, T_12 \) in B \) > 0 . $
  On this event, ultrametricity of $R$ forces $R_23 = R_12$:
    the inequalities for edges $12$ and $23$ give the two opposite inequalities once $R_12 < R_13$ is used.
    Likewise, ultrametricity of $T$ forces $T_23 = T_13$. It follows that $R_23 +
    T_23$ is strictly smaller than both $R_12 + T_12$ and $R_13 + T_13$, contradicting ultrametricity of $R + T$.
    Hence such support points cannot exist.
  By (5.5), the successive values $i \/ k$ of $T_12$ have masses $w_i$.
    The conditional spin-overlap supports at these levels are ordered:
    every value at an earlier level is at most every value at a later level.
    Thus sorting their mixture simply concatenates these conditional laws in blocks of lengths $w_i$.
    This is exactly the claimed quantile description, including any atoms shared by adjacent conditional supports. ◻
]

The ordered conditional laws identify field directional derivatives with weighted block averages of the
  spin-overlap quantile. Directions that select a tail of the partition give the comparisons required by Proposition 5.

#proof[
  Continue along the violating sequence and its minimizing triples.
    Extract a joint array limit and let $p$ be the spin-overlap quantile given by Lemma 24.
    For any nonnegative nondecreasing step direction $lambda$ on the fixed partition,
    sufficiently small positive displacements of $h_N$ are feasible, since $h_(N \, k - 1) < H$.
    Minimality and (5.7) yield
  $ bb(E) chevron.l R_12 lambda_(gamma^1 and gamma^2) chevron.r gt.eq sum_(i = 0)^(k - 1) w_i q_i lambda_i . $
  Pass to the joint array limit and use its ordered conditional laws to obtain
  #[#set math.equation(numbering: n => "(5.19)")
   $ integral_0^1 p \( u \) lambda \( u \) thin d u gt.eq integral_0^1 q \( u \) lambda \( u \) thin d u .
     $ <upper:cone-inequality>]
  Choose successively $lambda_i = upright(bold(1))_({ i gt.eq j })$, $0 lt.eq j lt.eq k - 1$. This gives
  $ integral_(zeta_j)^1 p \( u \) thin d u gt.eq integral_(zeta_j)^1 q \( u \) thin d u
    wide \( 0 lt.eq j lt.eq k \) \, $
  where $j = k$ is equality. The function $s mapsto integral_s^1 p \( u \) thin d u$ is concave,
    because its almost-everywhere derivative is the nonincreasing function $- p \( s \)$.
    On each partition interval the corresponding tail integral of $q$ is affine.
    Concavity places the first tail above the chord joining its endpoint values,
    which in turn lies above the second tail. Therefore the tail inequalities hold for every $s in \[ 0 \, 1 \]$.
    By Proposition 5,
  #[#set math.equation(numbering: n => "(5.20)")
   $ V_f \( p \) lt.eq V_f \( q \) . $ <upper:V-comparison>]
  At every minimizing triple $t_N > 0$, a small displacement to the left in time is feasible, even if $t_N =
    alpha$ or $t_N arrow.b 0$. Thus the derivative of $J_N$ with respect to $t$ at that triple is nonpositive.
    On the other hand, the fresh pattern in (5.8) has covariance $R$ and diagonal one.
    Lemma 16, applied to the marginal limiting spin-overlap array, gives
  $ partial_t J_N \( t_N \, h_N \, u_N \) arrow.r - V_f \( p \) + V_f \( q \) + delta gt.eq delta > 0 . $
  This contradicts the required sign at the minimizers and proves (5.1) for every step trial with $q_(k - 1) <
    1$ and finite entropy. Infinite-entropy trials give no restriction.
    Taking the infimum over finite step trials and using Corollary 6 proves the claimed bound for the full
    variational infimum, and hence for every admissible $q$. ◻
]

== 6 The perturbed bulk and restoration of two patterns <bulk:section>

Throughout this section and Section 7, fix $f in C_c^oo \( bb(R) \)$ and use the fixed pattern count $M_N =
  floor.l alpha N floor.r$. All constants may depend on $f$ and $alpha$.
  A further dependence on a fixed cavity size $L$ will be indicated.
  For each $1 lt.eq j lt.eq N$, let $Y_j$ be a centered Gaussian field on the hypercube with covariance

$ bb(E) Y_j \( x \) Y_j \( x' \) = R \( x \, x' \)^j . $

Such a field is obtained by contracting an independent standard Gaussian $j$-tensor with
  $\( x \/ sqrt(N) \)^(⊗ j)$. The fields are independent of one another and of all patterns.
  For a deterministic parameter sequence $v = \( v_j \)_(j gt.eq 1) in \[ 1 \, 2 \]^(bb(N))$, add the energy

#[#set math.equation(numbering: n => "(6.1)")
 $ H_N^v \( x \) = s_N sum_(j = 1)^N 2^(- j) v_j Y_j \( x \) \, wide s_N = N^(3 \/ 8) \, wide xi_N^v \( r \) =
   sum_(j = 1)^N 4^(- j) v_j^2 r^j . $ <bulk:perturbation>]

Its covariance is $s_N^2 xi_N^v \( R \)$. Let $Z_N^v$ be the resulting partition function with probability prior
  $nu_N$, and let $G_N^v$ be its Gibbs probability. Except when a parameter integral is displayed,
  every expectation keeps $v$ fixed. Write $pi$ for product uniform probability on $\[ 1 \, 2 \]^(bb(N))$ and set

#[#set math.equation(numbering: n => "(6.2)")
 $ cal(F)_N = integral bb(E) log Z_N^v thin pi \( d v \) . $ <bulk:averaged-free-energy>]

Because $sup_(N \, v \, \| r \| lt.eq 1) \| xi_N^v \( r \) \| < oo$, covariance interpolation from Lemma 17 gives,
  uniformly in $v$,

#[#set math.equation(numbering: n => "(6.3)")
 $ \| bb(E) log Z_N^v - N bb(E) p_N \| lt.eq C s_N^2 = C N^(3 \/ 4) . $ <bulk:perturbation-cost>]

In particular $cal(F)_N \/ N - bb(E) p_N = O \( N^(- 1 \/ 4) \)$.

The next section expands the energy after adding $L$ spin coordinates.
  The Gaussian field acting on each new coordinate has the empirical covariance $B_N$ below;
  the mean quadratic term and the rescaling of the old pattern arguments together contribute $L C_N \/ 2$:

#[#set math.equation(numbering: n => "(6.4)")
 $ B_N \( x \, x' \) & = 1 / N sum_(a = 1)^(M_N) f' \( b_a \( x \) \) f' \( b_a \( x' \) \) \,\
C_N \( x \) & = 1 / N sum_(a = 1)^(M_N) #scale(x: 120%, y: 120%)[\(] f'' \( b_a \( x \) \) -
  b_a \( x \) f' \( b_a \( x \) \) #scale(x: 120%, y: 120%)[\)] . $ <bulk:B>]

We will sample these observables from the full perturbed probability $G_N^v$.
  Compact support makes both uniformly bounded. The kernel $B_N$ is positive semidefinite,
  but its diagonal and $C_N$ need not be constant at finite $N$.
  Our task is to show that in every suitable array limit the off-diagonal covariance is a deterministic
  nondecreasing function of the spin overlap, while the diagonal and $C_N$ are deterministic constants.

=== 6.1 Uniform good parameters for the omitted system <uniform-good-parameters-for-the-omitted-system>

To identify these limits, we need both first and second moments of the empirical row averages.
  One restored pattern will determine their conditional means;
  two independently restored patterns will determine the corresponding squares and eliminate the remaining
  variance. Delete the last two patterns, retaining precisely the perturbation (6.1),
  and denote the resulting Gibbs expectation by $chevron.l dot.op chevron.r_compose$.
  This definition is used for all sufficiently large $N$ that $M_N gt.eq 2$.

#thm([Lemma 6.1.])[
  (Overlap identities on uniform good parameter sets).  #emph[There are measurable sets $cal(G)_N
    subset \[ 1 \, 2 \]^(bb(N))$ with $pi \( cal(G)_N \) arrow.r 1$ such that the following holds.
    For every deterministic sequence $v \( N \) in cal(G)_N$,
    every subsequential limit of the omitted system’s sampled overlap array satisfies the Ghirlanda–Guerra
    identities of Definition 9.]
] <bulk:good-parameters>

#proof[
  Let $P_N^compose$ be the omitted system’s random normalized log partition function.
    Uniformly when each parameter lies in $\[ 1 \/ 2 \, 5 \/ 2 \]$, we have
  #[#set math.equation(numbering: n => "(6.5)")
   $ "Var" \( P_N^compose \) lt.eq C / N . $ <bulk:concentration>]
  Indeed, replacing one pattern changes its unnormalized log partition function by at most $2 parallel f
    parallel_oo$. Conditional on the patterns, its Lipschitz constant in the independent Gaussian tensors defining
    the perturbation is at most $s_N \( sum_j 4^(- j) v_j^2 \)^(1 \/ 2) lt.eq C s_N$.
    The conditional Gaussian variance bound and the bounded-difference bound for the conditional mean therefore
    give $"Var" \( log Z_N^compose \) lt.eq C \( N + s_N^2 \) lt.eq C N$. Both bounds are instances of Lemma 18.
  Fix $j$, with $N gt.eq j$, and put $t_j = s_N 2^(- j)$. Finite-dimensional Gaussian integration by parts and
    differentiation of the spin sum give
  #[#set math.equation(numbering: n => "(6.6)")
   $ partial_(v_j) P_N^compose & = t_j / N chevron.l Y_j chevron.r_compose \,\
partial_(v_j) bb(E) P_N^compose & = frac(t_j^2 v_j, N) #scale(x: 120%, y: 120%)[\(] 1 -
  bb(E) chevron.l R_12^j chevron.r_compose #scale(x: 120%, y: 120%)[\)] \,\
partial_(v_j)^2 bb(E) P_N^compose & = t_j^2 / N bb(E) chevron.l \( Y_j - chevron.l Y_j chevron.r_compose \)^2
  chevron.r_compose . $ <bulk:parameter-derivative>]
  These operations are legitimate since the state space is finite and Gaussian exponential moments control all
    derivatives on a compact parameter interval. Formula (6.6) is bounded in absolute value by $C t_j^2 \/
    N$ on the enlarged interval. Integrating (6.6) from $1$ to $2$ consequently yields
  #[#set math.equation(numbering: n => "(6.7)")
   $ integral_1^2 bb(E) chevron.l \( Y_j - chevron.l Y_j chevron.r_compose \)^2 chevron.r_compose thin d v_j lt.eq
     C . $ <bulk:thermal-integral>]
  The other parameters remain arbitrary throughout this estimate.
  For completeness, the concentration estimate needed for the quenched mean of $Y_j$ follows from integrated
    convexity, without selecting a parameter in advance. Let $F = bb(E) P_N^compose$ and $0 < eta < 1 \/ 4$.
    The forward and backward difference quotients bracket $partial_(v_j) P_N^compose$.
    Replacing each random function value in these quotients by its expectation costs at most
    $C \/ \( eta sqrt(N) \)$ in expected absolute value, by (6.5).
    For the mean function, the forward error is bounded by $F' \( v_j + eta \) - F' \( v_j \)$,
    and the backward error by $F' \( v_j \) - F' \( v_j - eta \)$.
    Integrating these differences over $\[ 1 \, 2 \]$ leaves intervals of total length at most $4
    eta$ at the ends. Since $F'$ is bounded by $C t_j^2 \/ N$, this proves
  #[#set math.equation(numbering: n => "(6.8)")
   $ integral_1^2 bb(E) \| partial_(v_j) P_N^compose - partial_(v_j) bb(E) P_N^compose \| thin d v_j lt.eq
     C_j eta s_N^2 / N + frac(C, eta sqrt(N)) . $ <bulk:convex-fluctuation>]
  Choose $eta = N^(- 1 \/ 8)$. Both terms are $O_j \( N^(- 3 \/ 8) \)$, whereas $s_N^2 \/ N = N^(- 1 \/ 4)$.
    Combining (6.6), (6.7), and Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ & integral bb(E) chevron.l \| Y_j - bb(E) chevron.l Y_j chevron.r_compose \| chevron.r_compose thin pi \( d v \)\
 & wide lt.eq C + N / t_j thin O_j \( N^(- 3 \/ 8) \) = O_j \( N^(1 \/ 4) \) =
   o \( s_N \) . $ <bulk:integrated-deviation>]
  Here and below $j$ is fixed before $N arrow.r oo$.
  Set
  $ a_(j \, N) \( v \) = s_N^(- 1) bb(E) chevron.l \| Y_j -
    bb(E) chevron.l Y_j chevron.r_compose \| chevron.r_compose . $
  By (6.9), choose integers $J_N lt.eq N$ increasing to infinity sufficiently slowly that
  $ e_N := sum_(j lt.eq J_N) integral a_(j \, N) thin d pi arrow.r 0 . $
  With $delta_N = sqrt(e_N) + N^(- 1)$, define
  $ cal(G)_N = {v : sum_(j lt.eq J_N) a_(j \, N) \( v \) lt.eq delta_N} . $
  Markov’s inequality gives $pi \( cal(G)_N^c \) lt.eq e_N \/ delta_N arrow.r 0$,
    and each fixed $a_(j \, N)$ tends to zero uniformly on $cal(G)_N$.
  To obtain the identities, let $D$ be a bounded continuous test of the first $n times n$ overlap block, $n gt.eq
    2$. Integration by parts gives
  $ bb(E) chevron.l Y_j \( x^1 \) D chevron.r_compose = t_j v_j bb(E) ⟨D
    (sum_(l = 1)^n R_(1 l)^j - n R_(1 \, n + 1)^j)⟩_compose . $
  The left side differs from $bb(E) chevron.l Y_j chevron.r_compose thin bb(E) chevron.l D
    chevron.r_compose$ by at most $parallel D parallel_oo s_N a_(j \, N) \( v \)$.
    Using the corresponding one-replica integration-by-parts identity and $R_11 = 1$ therefore gives
  $ & bb(E) chevron.l D R_(1 \, n + 1)^j chevron.r_compose - 1 /
    n bb(E) chevron.l D chevron.r_compose bb(E) chevron.l R_12^j chevron.r_compose - 1 /
    n sum_(l = 2)^n bb(E) chevron.l D R_(1 l)^j chevron.r_compose = o \( 1 \) \, $
  uniformly on $cal(G)_N$ for each fixed $j \, n \, D$. Polynomial approximation on $\[ - 1 \, 1 \]$,
    followed by determination of finite measures by continuous tests,
    gives the full identities in every array limit. This proves the stated quantifier for arbitrary deterministic
    choices from the good sets. ◻
]

=== 6.2 Restored gradient covariances <restored-gradient-covariances>

#thm([Proposition 6.2.])[
  (Deterministic covariance and cavity correction).  #emph[Start with any deterministic good parameter sequence,
    on any subsequence of dimensions. Pass to a further subsequence on which the omitted overlap array converges
    and the full system’s joint sampled arrays $\( R_(l m) \, B_N \( x^l \, x^m \) \, C_N \( x^l \) \)$ converge.
    Let $mu$ be the omitted limit’s two-replica overlap law. The full limiting overlap array has the same law as
    the omitted one. There are deterministic constants $a_(upright(d)) \,
    c$ and a deterministic nondecreasing function $a$, defined on a $mu$-full ordered subset of $\[ 0 \, 1 \]$,
    such that almost surely
#[#set math.equation(numbering: n => "(6.10)")
 $ B_(l m) = a \( R_(l m) \) quad \( l eq.not m \) \, wide B_(l l) = a_(upright(d)) \, wide C_l = c \, wide
   0 lt.eq a lt.eq a_(upright(d)) lt.eq alpha parallel f' parallel_oo^2 . $ <bulk:deterministic-covariances>]

 Moreover,
#[#set math.equation(numbering: n => "(6.11)")
 $ c + a_(upright(d)) = integral r thin a \( r \) thin mu \( d r \) . $ <bulk:ibp-balance>]

]
] <bulk:restoration>

#proof[
  The required subsequences exist by boundedness and diagonal extraction.
    Lemma 25 and Theorem 10 show that the omitted limiting overlap array is nonnegative and ultrametric.
  ===== 6.2.1 Restoration preserves the overlap law. <restoration-preserves-the-overlap-law.>
  The two deleted rows are, conditionally on the omitted system, independent fresh Gaussian fields $b_1^(*) \,
    b_2^(*)$ with covariance $R$ and diagonal variance one. Restoring both rows means multiplying the omitted
    probability by $exp { f \( b_1^(*) \) + f \( b_2^(*) \) }$ and normalizing.
    This factor is bounded above and away from zero. Lemma 15 thus evaluates every limiting full-system
    expectation of bounded continuous tests of finitely many overlaps and these fresh field evaluations.
  Apply finite ordered roundings to the limiting off-diagonal overlaps, leaving the diagonal equal to one.
    Lemmas 12 and 11 represent each rounded calculation by a finite cascade with the rounded two-replica law.
    Its fresh pattern field consists of the shared Gaussian tree field and an independent final Gaussian residual
    on #emph[each replica visit], including repeated visits to one leaf.
    Gaussian covariance continuity and the polynomial normalizer argument of Lemma 15 show that the rounded
    calculations converge to the unrounded ones. The two-row tilt preserves the cascade label shape law by
    Lemma 14. Therefore, letting the rounding error vanish shows that the full limiting overlap array has exactly
    the omitted array’s law.
  ===== 6.2.2 First and second moments of the restored marks. <first-and-second-moments-of-the-restored-marks.>
  For a fixed rounding, let $d_i$ be the tilted conditional mean of $f' \( b_1^(*) \( x^1 \) \)
    f' \( b_1^(*) \( x^2 \) \)$ given that the two labels have common level $i$.
    Let $cal(A)_i$ contain the mark path through that level and let $M_i$ be the conditional tilted mean of the
    terminal observable $f'$. The two continuations below the common level are conditionally independent,
    with separately sampled final residuals. Consequently
  $ d_i = bb(E) M_i^2 \, wide 0 lt.eq d_i lt.eq d_(i + 1) lt.eq d_(upright(d)) lt.eq parallel f' parallel_oo^2 \, $
  where $d_(upright(d))$ is the single-visit tilted mean of $f' ""^2$.
    The inequalities follow because $\( M_i \)$ is a conditional-expectation martingale.
    The tilted kernels depend on the mark path and its level, and not on the label names.
    Since the two restored mark components have independent root variables and additive terminal log factors,
    Lemma 14 also makes their tilted path kernels independent conditional on the sampled shape.
    Thus the corresponding product of the two pair observables has conditional mean $d_i^2$.
  Likewise, after averaging the tilted mark path, including its common root with its original law,
    the one-visit means of $f' ""^2$ and of $g \( z \) = f'' \( z \) -
    z f' \( z \)$ conditional on the sampled shape are constants.
    Denote them by $d_(upright(d))$ and $e$, respectively. Independence of the two restored components then gives
    product means $d_(upright(d))^2$ and $e^2$. The conditioning here concerns the transformed tree’s sampled
    shape, not the original numerical label ranks; the common root receives no additional tilt.
  View the values $d_i$ as a bounded nondecreasing function $d_m \( r \)$ on the bins of the $m$th rounding,
    extending it monotonically across empty bins. A subsequence of these functions converges $mu$-almost
    everywhere: bounded monotone selection gives convergence at all continuity points of a monotone limit,
    and a further diagonal selection at the at most countably many atoms of $mu$ handles atoms at its possible
    discontinuities. Extract convergence also of $d_(upright(d) \, m)$ and $e_m$. Define
  $ a \( r \) = alpha lim_m d_m \( r \) \, wide a_(upright(d)) = alpha lim_m d_(upright(d) \, m) \, wide c =
    alpha lim_m e_m . $
  These are deterministic quantities from the limiting averaged array law.
    Their stated order and bounds follow from those of the finite rounded quantities.
    Dominated convergence applies in every integral against $mu$.
  ===== 6.2.3 Identification of the empirical observables. <identification-of-the-empirical-observables.>
  The mark moments now identify the full array, rather than only its conditional means.
    Set $A_a = f' \( b_a \( x^1 \) \) f' \( b_a \( x^2 \) \)$.
    Pattern exchangeability in the full system gives, for bounded continuous $D$,
  $ bb(E) chevron.l D \( R_12 \) B_N \( x^1 \, x^2 \) chevron.r & = M_N /
    N bb(E) chevron.l D \( R_12 \) A_(M_N) chevron.r \,\
bb(E) chevron.l B_N \( x^1 \, x^2 \)^2 chevron.r & = frac(M_N \( M_N - 1 \), N^2) bb(E) chevron.l A_(M_N - 1)
  A_(M_N) chevron.r + O \( N^(- 1) \) . $
  The repeated-row contribution is $O \( N^(- 1) \)$ because $A_a$ is uniformly bounded.
    The restored-mark calculations just proved therefore imply
  $ bb(E) \[ D \( R_12 \) B_12 \] = integral D \( r \) a \( r \) thin mu \( d r \) \, wide bb(E) B_12^2 =
    integral a \( r \)^2 thin mu \( d r \) . $
  Continuous tests determine the conditional mean, so $bb(E) \[ B_12 divides R_12 \] = a \( R_12 \)$.
    Subtracting its second moment from the displayed second moment gives $bb(E) \( B_12 - a \( R_12 \) \)^2 = 0$.
    Applying the identical first- and second-moment calculation to $f' \( b_a \( x^1 \) \)^2$ and
    $g \( b_a \( x^1 \) \)$ proves that $B_11 = a_(upright(d))$ and $C_1 = c$ almost surely.
    Replica exchangeability and a countable intersection give all assertions in (6.10) simultaneously.
    This argument requires no continuity of $a$ at an overlap atom.
  Finally, for any pattern $a$, Gaussian integration by parts in its coordinates,
    with the derivative of the normalized Gibbs density included, yields
  $ bb(E) chevron.l b_a \( x^1 \) f' \( b_a \( x^1 \) \) chevron.r = bb(E) chevron.l f'' \( b_a \( x^1 \) \) +
    f' \( b_a \( x^1 \) \)^2 - R_12 f' \( b_a \( x^1 \) \) f' \( b_a \( x^2 \) \) chevron.r . $
  The perturbation is independent of this row and has no derivative in this calculation.
    Summing over $a$ and dividing by $N$ gives the exact finite-size identity
  $ bb(E) chevron.l C_N \( x^1 \) + B_N \( x^1 \, x^1 \) chevron.r =
    bb(E) chevron.l R_12 B_N \( x^1 \, x^2 \) chevron.r . $
  Boundedness permits passage to the joint array limit and proves (6.11). ◻
]

== 7 Cavity increments and attainment of the entropy dual <cav:section>

Adding finitely many coordinates follows the cavity variational method of Aizenman, Sims,
  and Starr #cite(label("aizenmansimsstarr2003")). For the perceptron,
  the new coordinates first produce the gradient covariance identified in Section 6.
  The purpose of this section is to evaluate that increment and prove that its field attains the Ising entropy dual.

Fix an integer $L gt.eq 1$. All limits and error terms in this section keep $L$ fixed until the final limit after
  telescoping. For every deterministic $v in \[ 1 \, 2 \]^(bb(N))$ define the unnormalized increment

#[#set math.equation(numbering: n => "(7.1)")
 $ Delta_(N \, L) \( v \) = bb(E) log Z_(N + L)^v - bb(E) log Z_N^v \, wide d = d_(N \, L) = M_(N + L) -
   M_N . $ <cav:increment-definition>]

The same infinite parameter sequence is used in both dimensions.
  Notice that $d$ is bounded at fixed $L$ and $\| d - alpha L \| lt.eq 1$.

=== 7.1 A uniform finite-size cavity comparison <a-uniform-finite-size-cavity-comparison>

Write a spin in dimension $N + L$ as $\( x \, z \)$ with prior $nu_N ⊗ nu_L$,
  and split each pattern vector as $\( g^a \, y_a \)$. The blocks are independent standard Gaussians,
  with $y_a in bb(R)^L$. The larger pattern argument is

$ lambda_N b_a \( x \) + frac(y_a dot.op z, sqrt(N + L)) \, wide lambda_N = sqrt(frac(N, N + L)) \, $

where $b_a \( x \) = g^a dot.op x \/ sqrt(N)$, also for the $d$ new patterns.

First replace the larger system’s perturbation by exactly the bulk perturbation $H_N^v \( x \)$.
  To justify this replacement, write

$ R^(+) \( \( x \, z \) \, \( x' \, z' \) \) = frac(N R \( x \, x' \) + z dot.op z', N + L) . $

Then $\| R^(+) - R \| lt.eq 2 L \/ N$. The series $xi_N^v$ and their first derivatives are bounded uniformly on
  $\[ - 1 \, 1 \]$, and the omitted series tail is $O \( 4^(- N) \)$. Consequently

#[#set math.equation(numbering: n => "(7.2)")
 $ & sup_(x \, x' \, z \, z' \, v) lr(|s_(N + L)^2 xi_(N + L)^v \( R^(+) \) - s_N^2 xi_N^v \( R \)|)\
 & wide lt.eq C_L (N^(- 1 \/ 4) + N^(3 \/ 4) 4^(- N)) = o \( 1 \) . $ <cav:perturbation-comparison>]

Lemma 17, conditionally on all patterns, controls by this bound both the expected unnormalized log partition
  function and the disorder-averaged Gibbs expectation of any fixed bounded finite-replica spin test independent
  of the perturbing fields.

Conditionally on the full size-$N$ bulk data, introduce the vector Gaussian field

#[#set math.equation(numbering: n => "(7.3)")
 $ cal(Y) \( x \) = 1 / sqrt(N) sum_(a = 1)^(M_N) f' \( b_a \( x \) \) y_a . $ <cav:linear-field>]

Its $L$ coordinates are conditionally independent centered Gaussian fields of covariance $B_N$,
  independent also of the $d$ new bulk pattern fields. Define

#[#set math.equation(numbering: n => "(7.4)")
 $ W \( x \, z \) & = exp {z dot.op cal(Y) \( x \) + L / 2 C_N \( x \) +
   sum_(a = M_N + 1)^(M_N + d) f \( b_a \( x \) \)} \,\
Q \( x \, z \) & = frac(1, 2 N) sum_(a = 1)^(M_N) f'' \( b_a \( x \) \)
  #scale(x: 120%, y: 120%)[\(] \( y_a dot.op z \)^2 - L #scale(x: 120%, y: 120%)[\)] . $ <cav:W>]

Here $B_N \, C_N$ are the full bulk observables in (6.4)–(6.4).

#thm([Lemma 7.1.])[
  (Cavity comparison for increments and replica laws).  #emph[Let
#[#set math.equation(numbering: n => "(7.5)")
 $ G_0 = G_N^v ⊗ nu_L $ <cav:untilted-base>]

 be the size-$N$ bulk Gibbs probability times the independent cavity-spin prior,
   #emph[before] multiplication by $W$. There is a deterministic $kappa_L > 0$ such that $G_0 \( W \) gt.eq
   kappa_L$ for every realization and all sufficiently large $N$. Uniformly over all allowed $v$,
#[#set math.equation(numbering: n => "(7.6)")
 $ Delta_(N \, L) \( v \) = bb(E) log G_0 \( W \) + o \( 1 \) . $ <cav:finite-increment>]

 The size-$\( N + L \)$ Gibbs expectations of any fixed bounded finite-replica spin test are likewise
   approximated, after the above coupling, by the measure $W thin d G_0 \/ G_0 \( W \)$,
   with disorder-averaged error $o \( 1 \)$ times the test’s bound.
   In particular this applies to bounded continuous functions of $R_12^(+)$ and their products with $z_1^1 z_1^2$;
   inside such continuous tests one may also replace $R_12^(+)$ by $R_12$.
   Finally, $Delta_(N \, L) \( v \) gt.eq - C_L$ uniformly for large $N$.]
] <cav:finite-comparison>

#proof[
  Compact support makes all scale derivatives needed below bounded.
    Uniformly in $s in bb(R)$, Taylor expansion in the scale parameter therefore gives
  $ f \( lambda_N s \) & = f \( s \) - frac(L, 2 N) s f' \( s \) + O_L \( N^(- 2) \) \,\
f^(\( j \)) \( lambda_N s \) & = f^(\( j \)) \( s \) + O_L \( N^(- 1) \) \, wide j = 1 \, 2 . $
  For example, derivatives of $f \( lambda s \)$ with respect to $lambda$ are $s^r f^(\( r \)) \( lambda s \)$,
    uniformly bounded when $lambda$ stays near one. Next expand the translation by $\( y_a dot.op z \) \/
    sqrt(N + L)$ through second order, and replace its denominators by $sqrt(N)$ and $N$.
    Its third-order remainder is bounded by $C_L N^(- 3 \/ 2) \| y_a \|^3$, uniformly over $x \, z$.
    The scale and denominator replacements add terms bounded by
    $C_L \( N^(- 2) + N^(- 3 \/ 2) \| y_a \| + N^(- 2) \| y_a \|^2 \)$.
    Summing over the $M_N = O \( N \)$ old rows thus gives an expected uniform error $O_L \( N^(- 1 \/ 2) \)$.
  The deterministic part of the quadratic term is $L sum_a f'' \( b_a \( x \) \) \/ \( 2 N \)$;
    together with the dilation term it is $L C_N \( x \) \/ 2$.
    The remaining quadratic term is precisely $Q$, and the linear term is $z dot.op cal(Y) \( x \)$.
    Each new row can be replaced by $f \( b_a \( x \) \)$: its expected uniform cost is at most
    $C_L \( N^(- 1) + N^(- 1 \/ 2) bb(E) \| y_a \| \)$. Since there are only $d = O_L \( 1 \)$ new rows,
    this is $o \( 1 \)$ in total. We have proved that, after the perturbation comparison, the energy equals
  #[#set math.equation(numbering: n => "(7.7)")
   $ sum_(a = 1)^(M_N) f \( b_a \( x \) \) + H_N^v \( x \) + log W \( x \, z \) + Q \( x \, z \) +
     "rem"_N \( x \, z \) \, wide bb(E) sup_(x \, z) \| "rem"_N \( x \, z \) \| = o \( 1 \) . $ <cav:taylor>]
  The elementary log-partition bound by the uniform energy difference removes this remainder.
    Differentiating a normalized $r$-replica expectation along the energy segment bounds its change by $2 r
    parallel D parallel_oo sup \| "rem"_N \|$, so the same removal applies to the asserted tests.
  Put $A \( x \) = L C_N \( x \) \/ 2 + sum_(a > M_N) f \( b_a \( x \) \)$.
    Uniformly, $\| A \( x \) \| lt.eq C_L$. Since the cavity prior is a product of symmetric signs,
  $ G_0 \( W \) = G_N^v (e^(A \( x \)) product_(i = 1)^L cosh \( cal(Y)_i \( x \) \)) gt.eq e^(- C_L) = : kappa_L . $
  This bound concerns the #emph[untilted] probability (7.5); it will control all subsequent normalizations.
  It remains to remove $Q$, which need not be uniformly small over all spin states.
    For each fixed $x \, z$ and fixed bulk data, the variables $y_a dot.op
    z$ are independent $N \( 0 \, L \)$ random variables. Thus
  #[#set math.equation(numbering: n => "(7.8)")
   $ bb(E)_y Q \( x \, z \)^2 lt.eq C_L / N \, wide bb(E)_y e^(t \| Q \( x \, z \) \|) lt.eq
     C_(L \, t) quad \( t > 0 \) \, $ <cav:Q-moments>]
  uniformly for large $N$. To check the second assertion directly, put $c_a = f'' \( b_a \( x \) \) \/ \( 2 N \)$.
    For fixed $t$ and sufficiently large $N$,
  $ log bb(E)_y e^(t c_a \( \( y_a dot.op z \)^2 - L \)) = - t L c_a - 1 / 2 log \( 1 - 2 t L c_a \) =
    O_(L \, t) \( c_a^2 \) . $
  The linear terms cancel. Summing over $a$ is $O_(L \, t) \( N^(- 1) \)$; using $e^(t \| Q \|) lt.eq e^(t Q) +
    e^(- t Q)$ proves the claim. Also
  #[#set math.equation(numbering: n => "(7.9)")
   $ bb(E)_y e^(t z dot.op cal(Y) \( x \)) lt.eq C_(L \, t) \, $ <cav:linear-moments>]
  because its conditional variance is $L B_N \( x \, x \) lt.eq C_L$.
  Write $P_W = W thin d G_0 \/ G_0 \( W \)$ for the normalized approximation. The bounds just proved imply
  #[#set math.equation(numbering: n => "(7.10)")
   $ bb(E) P_W \( \| Q \| \) + bb(E) P_W \( \| e^Q - 1 \| \) lt.eq C_L N^(- 1 \/ 2) . $ <cav:Q-under-tilt>]
  Indeed $G_0 \( W \) gt.eq kappa_L$ and the non-linear-field part of $W$ is bounded.
    For the second term, use $\| e^Q - 1 \| lt.eq \| Q \| e^(\| Q \|)$ and Cauchy–Schwarz to bound its fixed-state
    $y$ expectation by
  $ \( bb(E)_y Q^2 \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] bb(E)_y e^(2 z dot.op cal(Y) \( x \) + 2 \| Q \|)
    #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq C_L N^(- 1 \/ 2) . $
  A further Cauchy–Schwarz inequality controls the last exponential by (7.8) and (7.9).
    This uses no independence between $Q$ and $cal(Y)$.
  Jensen’s inequality and $log t lt.eq t - 1$ now give
  $ - P_W \( \| Q \| \) lt.eq log P_W \( e^Q \) lt.eq P_W \( \| e^Q - 1 \| \) \, $
  so removing $Q$ changes the expected log partition by $o \( 1 \)$.
    For normalized tests, the following elementary bound avoids any additional lower bound for $P_W \( e^Q \)$.
    For every probability $P$ and positive integrable $Y$, writing $m = P \( Y \) > 0$,
  #[#set math.equation(numbering: n => "(7.11)")
   $ P lr(|Y / m - 1|) lt.eq P lr(|Y / m - Y|) + P \| Y - 1 \| = \| 1 - m \| + P \| Y - 1 \| lt.eq 2 P \| Y -
     1 \| . $ <cav:normalized-comparison>]
  Apply this with $P = P_W \, Y = e^Q$ and then use the product-measure bound for a fixed number of replicas.
    Together with (7.2) and (7.7), this proves (7.6) and all the claimed sample comparisons.
    Uniform continuity on $\[ - 1 \, 1 \]$ handles the replacement of $R^(+)$ by $R$.
    The deterministic denominator lower bound proves the final uniform lower bound for the increments. ◻
]

=== 7.2 Evaluation of an arbitrary good subsequence <evaluation-of-an-arbitrary-good-subsequence>

Take an arbitrary deterministic good parameter sequence, possibly already along a subsequence of dimensions.
  Extract further as in Proposition 26, and also so that $d_(N \, L)$ is constant, say equal to $d$.
  Let $p$ be the nondecreasing quantile of $mu$ and put

#[#set math.equation(numbering: n => "(7.12)")
 $ h \( u \) = a \( p \( u \) \) \, wide 0 < u < 1 . $ <cav:field-path>]

This is a bounded nonnegative nondecreasing path, and its values are measurable with respect to the completed
  sigma-algebra generated by $p$. Values on null sets may be chosen arbitrarily.
  The limiting conditional field covariances in $W$ are $a \( R_(l m) \)$ off the diagonal and $a_(upright(d))$ on
  the diagonal for each linear-field component, and $R_(l m)$ with diagonal one for each new pattern.
  The remaining base observable $C_N$ converges to the constant $c$.

The covariance and cavity-correction limits will give the increment $L { ell \( h \) + 1 / 2 integral_0^1 p h } +
  d V_f \( p \)$. The remaining issue is whether its field contribution attains $S_(upright(I)) \( p \)$,
  rather than merely being bounded above by it. We first evaluate the increment by finite ordered approximations
  of $\( p \, h \)$. Coordinate exchangeability will then show that the derivative paths of these finite field
  recursions converge to $p$. This is the identity that turns the supporting inequality of Theorem 8 into entropy
  attainment.

To justify passage through the overlap limit despite the unbounded linear field, let $\[ t \]_D =
  max \( - D \, min \( t \, D \) \)$ and define

$ W_D \( x \, z \) = exp { \[ z dot.op cal(Y) \( x \) \]_D + A \( x \) } . $

Symmetry under $z mapsto - z$, and oddness of clipping, give $G_0 \( W_D \) gt.eq
  kappa_L$ with the same constant as before. For a centered Gaussian $T$ of variance at most $C_L$,

$ sup_("Var" \( T \) lt.eq C_L) bb(E) #scale(x: 120%, y: 120%)[\[] e^(\| T \|) upright(bold(1))_({ \| T \| > D })
  #scale(x: 120%, y: 120%)[\]] arrow.r 0 . $

For example, on $\| T \| > D$ the integrand is at most $e^(- D) e^(2 \| T \|)$,
  whose expectation is uniformly bounded. Hence

#[#set math.equation(numbering: n => "(7.13)")
 $ sup_(N \, v) bb(E) G_0 \( \| W - W_D \| \) arrow.r 0 wide \( D arrow.r oo \) . $ <cav:truncation-error>]

The denominator bounds control the expected log difference by

$ kappa_L^(- 1) bb(E) G_0 \( \| W - W_D \| \) . $

The $L^1$ distance between the normalized measures is at most $2 kappa_L^(- 1) G_0 \( \| W - W_D \| \)$,
  and the analogous bound with a factor $r$ applies to $r$ replicas.
  Thus bounded replica tests have the same uniform truncation control.

For fixed $D$, the factor $W_D$ itself is bounded above and away from zero and is continuous in the finite field
  evaluations and in $C_N$. Lemma 15 applies: finite-dimensional Gaussian covariance continuity,
  followed by polynomial approximation of reciprocal normalizers and logarithms,
  expresses the limit through finitely many base replicas. This applies jointly to all field components and the
  bounded continuous overlap tests under consideration. The same truncation estimate holds for each limiting
  finite cascade because its true diagonal field variance is still $a_(upright(d))$.
  Clipping is performed on the full field, including its residual, before any tilt.
  We may therefore evaluate unclipped finite cascade expressions and then pass to their limit,
  by first fixing $D$, taking the array and rounding limits, and finally sending $D$ to infinity.

To make the latter calculation precise, bin the ordered pair $\( r \, a \( r \) \)$ jointly on successively finer
  meshes of $\[ 0 \, 1 \] times \[ 0 \, a_(upright(d)) \]$.
  Retain the bins of positive $mu$-probability and choose representatives ordered in both coordinates.
  The resulting step paths will be denoted $\( macron(p)_m \, macron(h)_m \)$.
  They converge to $\( p \, h \)$ in $L^1$, and their values approximate both coordinates on the sampled
  off-diagonal entries. Leave all diagonal variances equal to $1$ and $a_(upright(d))$.
  This construction is a finite nondecreasing function of $r$, so Lemmas 12 and 11 apply.
  It never divides an interval on which $p$ is constant. This last restriction is important for entropy
  attainment: tests of the spin overlap identify only a conditional mean of the field derivative.
  Keeping the derivative paths measurable as functions of $p$ will let those tests identify the entire limiting path.

Write $macron(h)_(m \, upright("top"))$ for the last step value of $macron(h)_m$.
  In such a finite cascade, the linear-field residual on each visit has coordinate variance $a_(upright(d)) -
  macron(h)_(m \, upright("top"))$. Averaging its exponential against a spin $z$ contributes the constant

$ L / 2 \( a_(upright(d)) - macron(h)_(m \, upright("top")) \) $

to the leaf log factor, since $\| z \|^2 = L$. Averaging over the cavity spins then gives a sum of $L$ independent
  $log cosh$ factors for the shared fields. The field recursion of Definition 1 subtracts
  $macron(h)_(m \, upright("top")) \/ 2$, so these shared factors contribute
  $L \( ell \( macron(h)_m \) + macron(h)_(m \, upright("top")) \/ 2 \)$.
  Each of the $d$ independent pattern components contributes $V_f \( macron(p)_m \)$,
  including its final coefficient-one residual average. The deterministic bulk factor contributes $L c \/ 2$.
  The additive-component assertion of Lemma 14 therefore evaluates the expected log integral as

$ L (ell \( macron(h)_m \) + frac(c + a_(upright(d)), 2)) + d V_f \( macron(p)_m \) . $

The continuity established in Section 3, together with (6.11), proves the following exact subsequential limit:

#[#set math.equation(numbering: n => "(7.14)")
 $ lim_N Delta_(N \, L) \( v \( N \) \) = L (ell \( h \) + 1 / 2 integral_0^1 p \( u \) h \( u \) thin d u) +
   d V_f \( p \) . $ <cav:increment-limit>]

=== 7.3 Coordinate exchangeability and the conjugate field <coordinate-exchangeability-and-the-conjugate-field>

The identity established here is the perceptron analogue of the critical relation identifying an overlap path with
  the derivative of the one-spin cascade transform. Such relations are central to Chen and
  Mourrat #cite(label("chenmourrat2025")) Propositions 7.2 and 7.3 and Chen, Issa,
  and Mourrat #cite(label("chenissamourrat2026")) Theorem 6.1.
  We do not apply their Gaussian spin-glass theorems to this nonlinear Hamiltonian:
  the restored covariance and coordinate exchangeability supply the identity here.
  Once it is established, the centered-Ising concavity credited in Theorem 8 gives the supporting inequality that
  proves attainment of the dual supremum.

#thm([Proposition 7.2.])[
  (The cavity field attains the entropy dual).  #emph[For every subsequential pair $\( p \, h \)$ just constructed,
#[#set math.equation(numbering: n => "(7.15)")
 $ S_(upright(I)) \( p \) = ell \( h \) + 1 / 2 integral_0^1 p \( u \) h \( u \) thin d u . $ <cav:entropy-identity>]

 The right side uses the continuous extension of $ell$ to bounded nondecreasing fields.]
] <cav:dual-attainment>

#proof[
  We identify the field-recursion derivative using one distinguished cavity coordinate.
    For a fixed rounding $\( macron(p)_m \, macron(h)_m \)$, let $rho_(macron(h)_m)$ be the bounded nondecreasing
    derivative path of Section 3; on level $i$ it equals $bb(E) \[ U'_i \( Z_i \)^2 \]$ for the field recursion.
  Under the cavity tilt, the conditional mean of $z_1^1 z_1^2$ given pair level $i$ is precisely
    $\( rho_(macron(h)_m) \)_i$. To verify this statement including the residual noise,
    fix the shared leaf field $t$ for coordinate one. If $eta$ is the independent residual with variance
    $a_(upright(d)) - macron(h)_(m \, upright("top"))$, then
  $ bb(E)_eta e^(z_1 \( t + eta \)) = e^(z_1 t) e^(\( a_(upright(d)) - macron(h)_(m \, upright("top")) \) \/ 2) . $
  The second factor is independent of $z_1$, so after residual averaging the spin magnetization is $tanh t$.
    Two visits, even to the same leaf, use separate residuals and separate spin draws.
    Below their shared level their mark paths are conditionally independent.
    Propagating the leaf magnetization backwards along the tilted kernels therefore gives the conditional mean
    $U'_i$ at level $i$, by the spatial derivative martingale for the field recursion.
    The conditional product mean is its averaged square. All other coordinates and all new pattern marks have
    separate kernels by the additive-component property. The shape law itself is unchanged by the tilt.
  At finite size the disorder law of the original $\( N + L \)$-spin model,
    including its perturbation at fixed $v$, is invariant under all coordinate permutations.
    Thus for every bounded continuous $D_0 : \[ - 1 \, 1 \] arrow.r bb(R)$,
  #[#set math.equation(numbering: n => "(7.16)")
   $ bb(E) chevron.l D_0 \( R_12^(+) \) z_1^1 z_1^2 chevron.r_(N + L) =
     bb(E) chevron.l D_0 \( R_12^(+) \) R_12^(+) chevron.r_(N + L) . $ <cav:coordinate-identity>]
  Indeed the left side is unchanged if the distinguished coordinate is replaced by any of the $N + L$ coordinates,
    and their average product is $R_12^(+)$. This symmetry is used before the cavity approximations.
    Lemma 27, the truncation passage above, and the finite cascade calculation then imply
  #[#set math.equation(numbering: n => "(7.17)")
   $ lim_(m arrow.r oo) integral_0^1 D_0 \( macron(p)_m \( u \) \) rho_(macron(h)_m) \( u \) thin d u =
     integral_0^1 D_0 \( p \( u \) \) p \( u \) thin d u . $ <cav:rho-test>]
  For the right side, the unclipped cascade tilt preserves the rounded overlap law by Lemma 14.
    The truncation estimates above transfer this evaluation to the finite-size limit,
    whose overlap law has quantile $p$.
  The paths $rho_(macron(h)_m)$ take values in $\[ 0 \, 1 \]$ and are nondecreasing.
    Bounded monotone selection and dominated convergence give a subsequence converging in $L^1 \( 0 \, 1 \)$ to a
    function $rho$. Every $rho_(macron(h)_m)$ is measurable with respect to the same completed sigma-algebra
    $sigma \( p \)$: the bins were formed from $\( p \, a \( p \) \)$ and hence are functions of $p$,
    with no splitting of its flat intervals. The subspace of $sigma \( p \)$-measurable functions is closed in
    $L^1 \( 0 \, 1 \)$. Explicitly, conditional expectation on the Lebesgue probability space $\( 0 \, 1 \)$ onto
    $sigma \( p \)$ is an $L^1$ contraction, so
  $ parallel rho - bb(E) \[ rho divides sigma \( p \) \] parallel_1 lt.eq 2 parallel rho -
    rho_(macron(h)_m) parallel_1 arrow.r 0 . $
  Thus $rho$ itself is $sigma \( p \)$-measurable.
  Pass to this subsequence in (7.17). Uniform continuity of $D_0$ and the $L^1$ convergence of $macron(p)_m$
    justify replacing $D_0 \( macron(p)_m \)$ by $D_0 \( p \)$. We obtain
  $ integral_0^1 D_0 \( p \( u \) \) \( rho \( u \) - p \( u \) \) thin d u = 0 quad
    upright("for every continuous ") D_0 . $
  Continuous tests determine finite signed measures on $\[ 0 \, 1 \]$.
    Therefore the conditional expectation of $rho - p$ given $p$ is zero.
    Since $rho - p$ is already $sigma \( p \)$-measurable, it follows that $rho = p$ almost everywhere.
    In particular, along this subsequence,
  #[#set math.equation(numbering: n => "(7.18)")
   $ rho_(macron(h)_m) arrow.r p quad upright("in ") L^1 \( 0 \, 1 \) . $ <cav:rho-convergence>]
  Apply the supporting inequality (3.10) with base $macron(h)_m$ and an arbitrary fixed nonnegative nondecreasing
    field step $h'$, refining the partitions if necessary:
  $ ell \( h' \) lt.eq ell \( macron(h)_m \) - 1 / 2 integral_0^1 \( h' - macron(h)_m \) rho_(macron(h)_m) . $
  The fields $macron(h)_m$ are uniformly bounded and converge to $h$ in $L^1$.
    Using (7.18) and continuity of $ell$, we may pass to the limit to get
  $ ell \( h' \) + 1 / 2 integral_0^1 h' p lt.eq ell \( h \) + 1 / 2 integral_0^1 h p . $
  Taking the supremum over all allowed field steps gives the upper bound in (7.15).
    Conversely, approximate the bounded nondecreasing $h$ in $L^1$ by nonnegative nondecreasing step functions.
    Continuity of $ell$ and boundedness of $p$ show that their dual values converge to the right side of (7.15).
    The definition of $S_(upright(I))$ gives the reverse inequality. ◻
]

=== 7.4 Uniform increments and telescoping <uniform-increments-and-telescoping>

#thm([Proposition 7.3.])[
  #emph[For $f in C_c^oo \( bb(R) \)$,
$ liminf_(N arrow.r oo) bb(E) p_N gt.eq inf_q { S_(upright(I)) \( q \) + alpha V_f \( q \) } . $

]
] <cav:lower-bound>

#proof[
  Write $cal(P) = inf_q { S_(upright(I)) \( q \) + alpha V_f \( q \) }$,
    a finite number by the elementary bounds for the variational functional.
    The limit (7.14) and Proposition 28 give, on every subsequence constructed above,
  $ lim_N Delta_(N \, L) \( v \( N \) \) = L { S_(upright(I)) \( p \) +
    alpha V_f \( p \) } + \( d - alpha L \) V_f \( p \) gt.eq L cal(P) - parallel f parallel_oo . $
  We used $\| V_f \( p \) \| lt.eq parallel f parallel_oo$ and $\| d - alpha L \| lt.eq 1$.
    Crucially, the starting good parameter sequence was arbitrary. Consequently
  #[#set math.equation(numbering: n => "(7.19)")
   $ liminf_(N arrow.r oo) inf_(v in cal(G)_N) Delta_(N \, L) \( v \) gt.eq L cal(P) -
     parallel f parallel_oo . $ <cav:uniform-liminf>]
  For otherwise a fixed positive violation could be selected at successive dimensions with deterministic
    $v \( N \) in cal(G)_N$; compactness would supply the array and constant-$d$ subsequence above,
    contradicting its evaluated limit.
  The uniform all-parameter lower bound of Lemma 27 controls the complement of $cal(G)_N$.
    Specifically, for every $epsilon > 0$ and all large $N$, the parameter integral is at least
  $ pi \( cal(G)_N \) \( L cal(P) - parallel f parallel_oo - epsilon \) - C_L pi \( cal(G)_N^c \) . $
  The use of the same product probability in both dimensions gives the exact identity
  $ integral Delta_(N \, L) \( v \) thin pi \( d v \) = cal(F)_(N + L) - cal(F)_N . $
  No good-parameter condition in dimension $N + L$ is imposed or needed. We conclude that
  $ liminf_N \( cal(F)_(N + L) - cal(F)_N \) gt.eq L cal(P) - parallel f parallel_oo . $
  For fixed $L$ and $epsilon > 0$, telescope the eventual bound on these increments separately in each of the $L$
    residue classes modulo $L$. The finitely many initial terms in each class vanish upon division by $N$, so
  $ liminf_N cal(F)_N / N gt.eq cal(P) - frac(parallel f parallel_oo + epsilon, L) . $
  First let $epsilon arrow.b 0$ and then let $L arrow.r oo$.
    Finally (6.3) transfers the result to the unperturbed pressure.
    Together with the upper bound this proves the variational formula for smooth compactly supported $f$. ◻
]

== 8 General activations and random-sign patterns <sec:extensions>

The upper and lower bounds prove the Gaussian pressure formula for $f in C_c^oo \( bb(R) \)$.
  We now remove smoothness by estimates uniform in the dimension and in the overlap path.
  For bounded activations, Gaussian patterns permit approximation in Gaussian $L^1$ alone;
  the random-sign extension also uses Gaussian-almost-everywhere continuity to pass from discrete fields to
  Gaussian fields. Let $gamma$ denote standard Gaussian probability on $bb(R)$.

=== 8.1 Bounded Borel activations <bounded-borel-activations>

#thm([Lemma 8.1.])[
  (Uniform approximation of the pattern functional).  #emph[If $f \,
    g$ are bounded Borel functions with $\| f \| \, \| g \| lt.eq K$, then
#[#set math.equation(numbering: n => "(8.1)")
 $ \| bb(E) p_N \( f \) - bb(E) p_N \( g \) \| & lt.eq alpha e^(2 K) parallel f - g parallel_(L^1 \( gamma \)) \,\
sup_(q upright(" step")) \| V_f \( q \) - V_g \( q \) \| & lt.eq e^(2 K) parallel f -
  g parallel_(L^1 \( gamma \)) . $ <ext:pressure-distance>]

 Consequently, for each bounded Borel $f$, the pattern functional $V_f$ extends uniquely and continuously in $L^1$
   from step paths to $cal(Q)$, and the bound in (8.1) holds on all of $cal(Q)$.]
] <ext:path-approx>

#proof[
  Interpolate linearly between $f$ and $g$. The derivative of the expected pressure is a sum of Gibbs averages of
    $\( g - f \) \( b_a \( x \) \)$, divided by $N$. For each summand, remove pattern $a$.
    Restoring it changes a nonnegative Gibbs average by a factor at most $e^(2 K)$,
    because the removed log factor lies in $\[ - K \, K \]$. Conditional on every other pattern and on a sampled
    spin $x$, the fresh field $g^a dot.op x \/ sqrt(N)$ has law $gamma$.
    Hence the absolute derivative is at most $\( M_N \/ N \) e^(2 K) parallel g - f parallel_(L^1 \( gamma \))$.
    Integration proves (8.1).
  For a fixed step path, terminal interpolation in the recursion propagates $g -
    f$ by its tilted Gaussian kernels. This differentiation requires only bounded terminal functions:
    it follows directly by differentiating the finite expectations.
    In the notation of the pattern recursion, the density of the entire tilted path relative to its independent
    Gaussian increments has logarithm
  #[#set math.equation(numbering: n => "(8.2)")
   $ sum_(i = 0)^k zeta_i #scale(x: 120%, y: 120%)[\(] U_i \( Z_i \) -
     U_(i - 1) \( Z_(i - 1) \) #scale(x: 120%, y: 120%)[\)] = f_t \( Z_k \) -
     sum_(i = 0)^(k - 1) w_i U_i \( Z_i \) \, wide f_t = \( 1 - t \) f + t g . $ <ext:telescoped-density>]
  All the functions on the right take values in $\[ - K \, K \]$, so the density is at most $e^(2 K)$.
    Without the tilt, $Z_k$ is standard normal, since the total variance is $q_k - q_(- 1) = 1$.
    This proves (8.1), uniformly over partitions and path values.
  Choose $f_j in C_c^oo \( bb(R) \)$ with $\| f_j \| lt.eq K$ and $parallel f_j -
    f parallel_(L^1 \( gamma \)) arrow.r 0$. Such approximations follow by spatial truncation,
    approximation on compact intervals, and mollification with a nonnegative smooth kernel.
    Each $V_(f_j)$ is continuous in $L^1$ by Proposition 5. Estimate (8.1) makes them uniformly Cauchy on the
    dense set of step paths and hence on $cal(Q)$. Their uniform limit is continuous and agrees with the original
    finite recursion on every step path. Density also proves uniqueness.
    The elementary bound $\| V_f \| lt.eq parallel f parallel_oo$ persists. ◻
]

#thm([Proposition 8.2.])[
  (Completion of the bounded case).  #emph[Theorem 3 holds for every bounded Borel activation.]
] <ext:bounded>

#proof[
  Use the approximants from Lemma 30. Since the entropy functional is the same for every activation,
  $ \| cal(P)_f \( alpha \) - cal(P)_(f_j) \( alpha \) \| lt.eq alpha sup_(q in cal(Q)) \| V_f \( q \) -
    V_(f_j) \( q \) \| arrow.r 0 . $
  Together with the uniform pressure estimate, the already proved smooth formula gives convergence of $bb(E)
    p_N \( f \)$ to $cal(P)_f \( alpha \)$.
  Changing a single whole pattern vector changes $log Z_N \( f \)$ by at most $2 parallel f parallel_oo$.
    The independent-input variance bound of Lemma 18 therefore gives
  #[#set math.equation(numbering: n => "(8.3)")
   $ "Var" \( p_N \( f \) \) lt.eq frac(4 M_N parallel f parallel_oo^2, N^2) = O \( N^(- 1) \) . $ <ext:concentration>]
  Chebyshev’s inequality proves convergence in probability. ◻
]

=== 8.2 An integrable unbounded class <an-integrable-unbounded-class>

The factor $e^(2 K)$ in the bounded approximation estimate is not useful when the clipping level tends to
  infinity. Instead, we control the two tails separately: integrability of $f$ controls the lower tail,
  while integrability of $e^f$ controls the upper tail after a fixed lower clip.
  This is why the limits below are taken in the stated order.

#thm([Theorem 8.3.])[
  (Integrable activations).  #emph[Suppose $f : bb(R) arrow.r bb(R)$ is Borel and
#[#set math.equation(numbering: n => "(8.4)")
 $ bb(E) \| f \( G \) \| + bb(E) e^(f \( G \)) < oo . $ <ext:moments>]

 For $J \, K > 0$, let $f_(J \, K) = min { K \, max { - J \, f } }$. The uniform limit
#[#set math.equation(numbering: n => "(8.5)")
 $ V_f = lim_(J arrow.r oo) lim_(K arrow.r oo) V_(f_(J \, K)) quad upright("on ") cal(Q) $ <ext:unbounded-V>]

 exists and is continuous in $L^1$. With this definition, the variational formula (2.8) is finite and holds in
   expectation and in probability.]
] <ext:integrable>

#proof[
  We establish estimates uniform in both the dimension and the step path.
    Let $P$ be the base probability for one fresh pattern, and let $t$ be the value of $f$ on its field.
    In the spin model, $P$ is the Gibbs measure with that whole pattern omitted, independent of the fresh row.
    For a step path, let $\( v_lambda \)$ be the cascade weights and let $\( y_lambda \)$ be the Gaussian field
    built from shared tree increments, independent of those weights and with variance $q_(k - 1)$ at each leaf.
    Use the product probability and scalar function
  $ P = sum_lambda v_lambda delta_lambda ⊗ gamma \, wide t \( lambda \, eta \) =
    f #scale(x: 120%, y: 120%)[\(] y_lambda + sqrt(1 - q_(k - 1)) thin eta #scale(x: 120%, y: 120%)[\)] . $
  Thus the residual $eta$ is an integration coordinate of $P$, as in Lemma 16.
    For a bounded Borel terminal function, integrating $eta$ gives the coefficient-one transform, and Lemma 14,
    followed by the root Gaussian average, evaluates the expected log integral as its pattern recursion.
    This identity uses measurability and boundedness, not the continuity needed for an array limit.
    Zero residual variance and repeated covariance levels are allowed.
    In the spin case, the fresh field at each fixed state is standard normal.
    In the cascade case the same marginal results after both averaging $y_lambda$ and integrating $eta$.
    Independence of the weights and the shared field, followed by Tonelli’s theorem, therefore gives,
    for every nonnegative Borel $F$,
  #[#set math.equation(numbering: n => "(8.6)")
   $ bb(E) P \[ F \( t \) \] = bb(E) F \( f \( G \) \) . $ <ext:fresh-marginal>]
  Here the expectation includes the independent pattern and any base data.
    The log integral $log P \( e^t \)$ is finite almost surely and integrable:
    Jensen bounds it below by $P \( t \)$, while its positive part is bounded by $P \( e^t \)$.
    These are integrable by (8.4) and (8.6). Adding the rows successively also proves integrability of the
    finite-volume pressure.
  Put $t_J = max \( t \, - J \)$ and $r = \( - J - t \)_(+)$. The nonnegative lower-clipping error satisfies
  #[#set math.equation(numbering: n => "(8.7)")
   $ 0 lt.eq log P \( e^(t_J) \) - log P \( e^t \) & = - log frac(P \( e^(t_J) e^(- r) \), P \( e^(t_J) \)) lt.eq
     frac(P \( e^(t_J) r \), P \( e^(t_J) \)) lt.eq P \( r \) . $ <ext:lower-clip>]
  The bound by the tilted mean of $r$ is Jensen’s inequality under the $e^(t_J)$ tilt.
    For the last inequality, $e^(max \( t \, - J \))$ is increasing in $t$,
    while $\( - J - t \)_(+)$ is decreasing. Their covariance under $P$ is nonpositive.
    This follows also by expanding the expectation of $\( a \( t \) - a \( t' \) \) \( b \( t \) - b \( t' \) \)
    lt.eq 0$ for two independent $P$ samples.
  After the lower clip, the upper-clipped exponential is at least $e^(- J)$.
    The inequality $log \( 1 + x \) lt.eq x$ gives
  #[#set math.equation(numbering: n => "(8.8)")
   $ 0 lt.eq log P \( e^(t_J) \) - log P \( e^(min \( t_J \, K \)) \) lt.eq
     e^J P \[ \( e^t - e^K \)_(+) \] . $ <ext:upper-clip>]
  Define
  $ epsilon_(J \, K) = bb(E) \( - J - f \( G \) \)_(+) + e^J bb(E) \( e^(f \( G \)) - e^K \)_(+) . $
  Replacing one pattern at a time in the finite spin system,
    allowing the other factors to be arbitrary existing clipped or unclipped factors, yields
  #[#set math.equation(numbering: n => "(8.9)")
   $ bb(E) \| p_N \( f \) - p_N \( f_(J \, K) \) \| lt.eq alpha epsilon_(J \, K) . $ <ext:unbounded-pressure-error>]
  The omitted factor is independent of that base probability at each replacement, so (8.6) continues to apply.
    The same argument for the single cascade log integral yields
  #[#set math.equation(numbering: n => "(8.10)")
   $ sup_(q upright(" step")) \| V_f^(upright("cas")) \( q \) - V_(f_(J \, K)) \( q \) \| lt.eq
     epsilon_(J \, K) \, $ <ext:unbounded-path-error>]
  where $V_f^(upright("cas")) \( q \)$ denotes its integrable expected log value.
  At fixed $J$, the upper-clipping bound compares each bounded recursion uniformly on step paths with the cascade
    value for $max \( f \, - J \)$; its error tends to zero as $K arrow.r oo$.
    Hence these bounded continuous functionals are uniformly Cauchy on the dense set of step paths and therefore
    on $cal(Q)$. Their uniform limit is continuous. For $J' gt.eq J$,
    apply the lower-clipping bound with $f$ replaced by $max \( f \, - J' \)$.
    The difference between the corresponding limits is at most $bb(E) \( - J - f \( G \) \)_(+)$,
    which tends to zero as $J arrow.r oo$. This proves the ordered uniform limit (8.5).
    It agrees with $V_f^(upright("cas"))$ on step paths, and (8.10), with $V_f$ on the left,
    passes to all paths by density.
  Two applications of Jensen’s inequality to the same cascade integral give
  $ bb(E) f \( G \) lt.eq V_f \( q \) lt.eq log bb(E) e^(f \( G \)) . $
  The bounds hold first for step paths and then for every $q in cal(Q)$.
    At $q = 0$ the upper bound is an equality. Since $S_(upright(I)) gt.eq 0$ and $S_(upright(I)) \( 0 \) = 0$,
    the variational value is finite, with
  $ alpha bb(E) f \( G \) lt.eq cal(P)_f \( alpha \) lt.eq alpha log bb(E) e^(f \( G \)) . $
  Estimate (8.10) also bounds the difference between the clipped and unclipped variational infima by $alpha
    epsilon_(J \, K)$.
  Apply Proposition 31 to $f_(J \, K)$ and then (8.9). This proves convergence in expectation.
    For convergence in probability, Markov’s inequality controls $p_N \( f \) -
    p_N \( f_(J \, K) \)$ uniformly in $N$; convergence for the bounded model handles the middle term.
    Take $N arrow.r oo$, then $K arrow.r oo$ at fixed $J$, and finally $J arrow.r oo$.
    No variance estimate for the unbounded model is required. ◻
]

#prodef([Remark 8.4.])[
  (Why some activation restriction is needed).  Wholly unrestricted real activations need not have finite limiting
    pressure. For $f \( s \) = s^4$, choose $x_i = "sign" \( g_i^1 \)$.
    The law of large numbers gives $b_1 \( x \) = N^(- 1 \/ 2) sum_i \| g_i^1 \| tilde.op sqrt(2 \/ pi)
    sqrt(N)$ in probability. All other pattern contributions are nonnegative,
    and the probability weight of this one state is $2^(- N)$.
    Thus $p_N \( f \) gt.eq b_1 \( x \)^4 \/ N - log 2 arrow.r oo$ in probability.
] <ext:growth>

=== 8.3 Universality for random-sign patterns <universality-for-random-sign-patterns>

Disorder universality has also been established for broad hard-constraint Ising perceptron classes by Nakajima and
  Sun #cite(label("nakajimasun2022")). The following result concerns finite bounded log-potentials and records the
  continuity assumption used in the sign-to-Gaussian passage.

#thm([Theorem 8.5.])[
  (Random-sign patterns).  #emph[Replace the Gaussian pattern entries by independent uniform signs in ${ - 1 \,
    1 }$. If $f$ is bounded Borel and its discontinuity set has Gaussian measure zero,
    then its expected pressure and its pressure in probability converge to the same value $cal(P)_f \( alpha \)$
    as in Theorem 3. In particular, this holds for every bounded continuous activation.]
] <ext:sign>

#proof[
  First let $f in C_c^oo \( bb(R) \)$. We use the coordinate-replacement form of the Lindeberg principle;
    see Chatterjee #cite(label("chatterjee2006lindeberg")) Theorem 1.1.
    Regard normalized pressure as a function of a single pattern entry.
    Three differentiations of the finite spin sum give a uniform bound $C_f
    N^(- 5 \/ 2)$ for its third derivative. Indeed, each derivative of the pattern argument supplies $x_i \/
    sqrt(N)$, and the normalized log partition supplies the factor $1 \/ N$;
    the remaining terms are bounded Gibbs moments and cumulants of $f' \, f'' \, f'''$.
    Taylor expansion through degree two and matching of the first two Gaussian and sign moments therefore bound
    each entry replacement by $C_f N^(- 5 \/ 2)$. There are $M_N N = O \( N^2 \)$ entries,
    so replacing them one at a time gives an expected-pressure error $O_f \( N^(- 1 \/ 2) \)$.
  For a general $f$ as in the statement, take smooth approximants $f_j$ with $\| f_j \| \, \| f \| lt.eq
    K$ and $parallel f_j - f parallel_(L^1 \( gamma \)) arrow.r 0$.
    The omitted-pattern argument from Lemma 30 still applies.
    Conditional on any hypercube state, however, the fresh sign field now has the common law
  $ X_N = N^(- 1 \/ 2) sum_(i = 1)^N epsilon.alt_i \, wide bb(P) \( epsilon.alt_i = 1 \) =
    bb(P) \( epsilon.alt_i = - 1 \) = 1 \/ 2 . $
  Consequently,
  #[#set math.equation(numbering: n => "(8.11)")
   $ \| bb(E) p_N^(upright("sign")) \( f \) - bb(E) p_N^(upright("sign")) \( f_j \) \| lt.eq
     alpha e^(2 K) bb(E) \| f \( X_N \) - f_j \( X_N \) \| . $ <ext:sign-approx>]
  The same third-order replacement calculation on smooth compactly supported tests, together with $bb(E) X_N^2 =
    1$, proves $X_N arrow.r.double G$. The bounded function $\| f -
    f_j \|$ is continuous outside a Gaussian-null set. The usual bounded almost-everywhere-continuous test
    criterion for weak convergence therefore gives
  $ bb(E) \| f \( X_N \) - f_j \( X_N \) \| arrow.r bb(E) \| f \( G \) - f_j \( G \) \| . $
  Take $N arrow.r oo$ in (8.11) for fixed $j$, use the smooth replacement result and the Gaussian formula,
    and then take $j arrow.r oo$. This proves expected-pressure convergence.
    The bounded-pattern variance bound (8.3) holds for independent sign rows as well,
    which proves convergence in probability. ◻
]

#prodef([Remark 8.6.])[
  (The regularity condition in sign universality).  One cannot replace the hypothesis of Theorem 34 by arbitrary
    bounded Borel measurability. Take $f = upright(bold(1))_(bb(Q))$.
    For Gaussian patterns, every field at every state is irrational almost surely,
    since there are only finitely many states and rows at each size; hence $p_N = 0$.
    For sign patterns and square $N$, every field is rational, so $p_N = M_N \/ N$.
    For odd nonsquare $N$, the numerator of each field is a nonzero odd integer while $sqrt(N)$ is irrational,
    so $p_N = 0$. The two subsequences give distinct limits. This function is discontinuous everywhere and is
    excluded by Theorem 34.
] <ext:sign-scope>

=== 8.4 Normalization checks <normalization-checks>

For $f = c$ constant, $V_f = c$ and $inf_q S_(upright(I)) \( q \) = 0$, so (2.8) gives $alpha c$,
  as the partition function does directly. A second check exercises both the diagonal shift and the duality.
  For $f \( s \) = t s$, condition (8.4) holds, and the finite Gaussian recursion gives

$ V_f \( q \) = t^2 / 2 (1 - integral_0^1 q \( u \) thin d u) . $

Set $H = alpha t^2$. The constant field $h = H$ is an admissible trial,
  so every variational objective is at least $H \/ 2 + ell \( H \)$.
  For the constant path $q_(*) = bb(E) tanh^2 \( sqrt(H) thin G \)$,
  the supporting inequality (3.10) shows that the entropy supremum is attained at that constant field.
  Equality follows, giving

$ cal(P)_(t s) \( alpha \) = H \/ 2 + ell \( H \) = bb(E) log cosh \( sqrt(H) thin G \) . $

This is also the direct answer: the linear activation produces independent Gaussian coordinate fields with
  variances $t^2 M_N \/ N arrow.r H$, and the Ising partition function factors into their $cosh$ terms.

#bibliography("refs.bib", style: "ieee", title: [References])
