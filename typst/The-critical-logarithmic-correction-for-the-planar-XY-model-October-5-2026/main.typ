#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 85.0pt, y: 85.0pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The critical logarithmic correction \
for the planar XY model]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

For an integer $R gt.eq 1$, let

$ Lambda_R = \[ - R \, R \]^2 ∩ bb(Z)^2 \, wide E_R = { { x \, y } subset Lambda_R : \| x - y \| = 1 } . $

The planar XY model at inverse temperature $b > 0$, with free boundary, is the probability measure

#[#set math.equation(numbering: n => "(1)")
 $ 1 / Z_(R \, b) exp {b sum_({ x \, y } in E_R) cos \( theta_x - theta_y \)} product_(x in Lambda_R)
   frac(thin upright(d) theta_x, 2 pi) \, wide theta_x in bb(R) \/ \( 2 pi bb(Z) \) . $ <eq:xy-law>]

Each unordered edge is counted once, and there are no exterior edges.
  Write $bb(E)_(R \, b)^(upright("free"))$ for expectation. For $r in bb(Z)_(> 0)$, with $e_1 = \( 1 \, 0 \)$, set

#[#set math.equation(numbering: n => "(2)")
 $ C_b \( r \) & = lim_(R arrow.r oo\
R gt.eq r) bb(E)_(R \, b)^(upright("free")) cos \( theta_0 - theta_(r e_1) \) \,\
m \( b \) & = lim_(r arrow.r oo) - 1 / r log C_b \( r \) \, wide b_c = inf { b > 0 : m \( b \) =
  0 } . $ <eq:critical-definition>]

The limits exist, $0 < b_c < oo$, and $m \( b_c \) = 0$; see [17] Section 1.1 and Proposition 1.2.
  The thermodynamic limit in the first line is always taken before the separation tends to infinity.

#thm([Theorem 1.1.])[
  #emph[There is a constant $B_(upright("XY")) in \( 0 \, oo \)$ such that
$ C_(b_c) \( r \) = B_(upright("XY")) thin r^(- 1 \/ 4) \( log r \)^(1 \/ 8) \( 1 + o \( 1 \) \)
  wide \( r arrow.r oo \, med r in bb(Z) \) . $

]
] <thm:main>

The power $r^(- 1 \/ 4)$ is the critical decay rate. The logarithm is smaller than every fixed power of $r$,
  but it prevents $r^(1 \/ 4) C_(b_c) \( r \)$ from converging to a finite nonzero limit.
  The theorem establishes this correction and the existence of a positive finite microscopic amplitude for the
  free-box thermodynamic correlation.

=== 1.1 Background and relation to earlier work <background-and-relation-to-earlier-work>

Berezinskii’s spin-wave analysis predicted algebraic correlations for planar spins at low temperature [5].
  Kosterlitz and Thouless described a transition driven by the unbinding of vortex pairs [12],
  and Kosterlitz developed a renormalization-group analysis of the critical behavior of the nearest-neighbor model
  [11]. For the Villain formulation, Janke records the critical prediction, up to a multiplicative constant, as

$ \| x \|^(- 1 \/ 4) \( log \| x \| \)^(1 \/ 8) (1 + O (frac(log log \| x \|, log \| x \|))) \; $

see [10] Section II, Equations (2)–(3). Theorem 1 establishes the leading equivalent,
  with a relative $o \( 1 \)$ error, for the ordinary cosine interaction and the free-box thermodynamic
  correlation in Equation (2).

Rigorous work established the phase picture through correlation bounds and dual representations.
  McBryan and Spencer proved power-law upper bounds for two-dimensional planar-spin correlations [15].
  Fröhlich and Spencer proved a low-temperature algebraic regime for the plane rotator and Villain models through
  a multiscale Coulomb-gas analysis [9] Theorem C. For the cosine XY model,
  van Engelenburg and Lis proved exponential decay below a threshold and the lower bound
  $1 \/ \( 8 \| x - y \| \)$ at and above that threshold in the limit over free boxes [20] Theorem 1.
  These results include sharp information about the phases,
  while their stated bounds do not determine the critical equivalent.

The dual height field provides another route to the transition.
  Aizenman, Harel, Peled, and Shapiro related height depinning to nonsummable spin correlations,
  including the Bessel height interaction dual to the cosine XY model [1].
  Lammers identified an exact relation between the XY and dual-height correlation lengths [13] Theorem 1,
  and proved a localization dichotomy with a universal positive lower bound on logarithmic height fluctuations in
  the delocalized phase [14]. These results constrain the transition through height information.

The lattice-Gaussian inequality of Regev and Stephens-Davidowitz [19] underlies the finite comparisons developed
  in [16] Section 2 and passed to Bessel weights in [17] Lemma 2.2.
  In a related approach, Aizenman, Harel, Peled, and Shapiro extended sublattice monotonicity of height
  moment-generating functions to annealed Gaussian interactions;
  their application to the XY dual uses a representation credited there to Raoufi [1] Lemma 9.6, Section 10.1,
  and Appendix D. Bauerschmidt developed finite-range decompositions of Gaussian fields using functional calculus
  [2]. Bauerschmidt, Park, and Rodriguez obtained Gaussian scaling limits for discrete Gaussian heights at high
  temperature [3,4]. Falco’s critical Coulomb-gas analysis gives a rigorous example in which a marginal recursion
  produces a power law with a multiplicative logarithm [8].
  Its fractional electric-charge observable is different from the magnetic XY insertion considered here.

Theorem 1 sharpens the companion result $C_(b_c) \( r \) = r^(- 1 \/ 4 + o \( 1 \))$ of [17].
  We use from that paper the critical height coefficient $a \( b_c \) = 8 pi$, finite Bessel comparisons,
  fixed-geometry and conditional height limits, and a four-face characteristic estimate.
  The analytic local maps come from [16], and the sector costs for fixed positive holes and annular kernel
  estimates from [18]. The annular argument is adapted to the pinned rim below.
  The cutoff initialization, quantitative coefficient estimate, comparison of different starting histories,
  and extraction of the amplitude are proved here.

=== 1.2 The route to the amplitude <the-route-to-the-amplitude>

Fourier expansion of the spin interactions represents a correlation as a ratio of partition functions for
  integer-valued heights on the dual lattice. The numerator shifts the height increments by a connection whose
  circulation records the spin insertion. This magnetic insertion is not determined by convergence of height
  averages alone.

For an integer $n gt.eq 1$, let

#[#set math.equation(numbering: n => "(3)")
 $ M_n = bb(E)_(n \, b_c)^0 cos theta_0 \, $ <eq:center-definition>]

where $bb(E)_(n \, b_c)^0$ denotes expectation for the measure obtained from Equation (1) on $Lambda_n$ by fixing
  all boundary angles at zero and integrating only the interior angles. The geometric argument proves two comparisons:

$ M_(n') / M_n & arrow.r d^(- 1 \/ 8) &  & upright("if ") n \, n' arrow.r oo upright(" and ") n' \/ n arrow.r
  d in \( 0 \, oo \) \,\
frac(C_(b_c) \( r \), M_r^2) & arrow.r c_(upright("shape")) in \( 0 \, oo \) &  & upright("as ") r arrow.r oo . $

Annular interfaces separate the microscopic insertions from an exterior with holes kept at fixed positive radius.
  The sector and annular-kernel estimates of [18] control these interfaces,
  and the common microscopic factors cancel in the comparisons.
  A pinned-rim argument relates the two-insertion calculation to the free-box thermodynamic correlation.
  The first comparison gives $M_n = n^(- 1 \/ 8 + o \( 1 \))$,
  which will make the cutoff loss negligible relative to the center observable,
  and later extends an asymptotic from geometric sizes to all integers.
  The second reduces the theorem to a center asymptotic.

To compute $M_n$, we cut off differences of noisy cell averages,
  choosing the cell size according to the target square. For the squares used in the analytic comparison,
  the rough center bound makes this change negligible in the center partition ratio.
  After averaging to the associated starting scale, the bulk interaction is small.
  For the center insertion, every expansion term carries one labelled component that retains the source and its
  attached dependencies. The norm of the resulting labelled activity may grow polynomially with the cell size;
  a linear propagation estimate controls it.

Let $L > 1$ be the fixed dyadic block ratio and $j$ the absolute scale index.
  After separating the Gaussian reference with height coefficient $a = 8 pi$,
  the smoothed bulk interaction at block side $L^j$ retains $t_j \/
  2$ times the allocated gradient energy and a fundamental periodic term;
  the linear part of the remaining activity’s evolution contracts.
  Coordinates adapted to the pure Gaussian curve remove its drift and give a gradient coordinate $u_j$ and a
  signed fundamental Fourier coordinate $Z_j$. Their leading recursion is

$ u_(j + 1) - u_j tilde.eq - H Z_j^2 \, wide Z_(j + 1) - Z_j tilde.eq - 2 \( log L \) u_j Z_j \, wide H > 0 . $

Physical torus variance and phase tests keep each finite history near the Gaussian curve.
  A phase lower bound derived from the four-face estimate of [17] prevents the fundamental direction from
  disappearing. Comparing histories through the same finite physical torus tests controls changes of starting
  scale without a rate for the height scaling limit. Together with the recursion,
  these constraints yield the critical balance $H Z_j^2 tilde.op 2 \( log L \) u_j^2$,
  which gives harmonic decay of $u_j$. On the controlled interior ranges of the size-dependent histories used in
  the comparison, the coordinate changes give $t_j = u_j + O \( j^(- 2) \)$.
  The resulting estimate, uniform on each fixed such range, is

$ t_j = frac(1, 2 \( log L \) j) + O (frac(log j, j^2)) . $

Let $g_n$ be the minimum squared edge norm of a connection with the $2
  pi$ circulation of one insertion in the corresponding dual square.
  For $n_0 = L^N$ and $n_1 = L^(N + 1)$, we use the same entry and a common stop $j' = N - O \( log N \)$,
  leaving a number of terminal blocks that grows as a small power of $N$.
  We choose the field-independent factors removed at each step so that their complete contributions to the
  insertion ratio agree between sizes. The source term remaining at the stop is controlled relative to the source
  coefficient already extracted. Integration of the common phase then removes the linear periodic term,
  and a comparison of the terminal Gaussian fields leaves the gradient contribution with a summable error:

$ log M_(n_1) / M_(n_0) = - frac(1 - t_(j'), 2 a) #scale(x: 120%, y: 120%)[\(] g_(n_1) -
  g_(n_0) #scale(x: 120%, y: 120%)[\)] + epsilon.alt_N \, wide sum_N \| epsilon.alt_N \| < oo . $

Here $g_(L^N) = 2 pi \( log L \) N + c_N$ with $c_N$ convergent.
  Substitution of the trajectory estimate gives the constant increment $- \( log L \) \/
  8$ and the correction $1 \/ \( 16 N \)$. The unweighted Green differences $c_(N + 1) - c_N$ telescope,
  and summation by parts treats the differences weighted by $1 \/ N$; the other errors are absolutely summable.
  Summation therefore gives a positive finite center amplitude with logarithmic power $1 \/ 16$.
  The first geometric comparison extends this equivalent to all integer sizes,
  and the bulk comparison squares the logarithmic power to $1 \/ 8$.

== 2 Height representation and critical inputs <sec:heights>

We first pass from spins to Bessel heights, fixing the normalization and the boundary conventions.
  We then record the finite comparisons and critical height limits used in the geometric and analytic arguments.
  These inputs concern the Bessel weights obtained from the XY model.

=== 2.1 Dual partition functions <dual-partition-functions>

Choose one orientation of each edge of a finite nearest-neighbor graph $G = \( V \, E \)$ and put $nabla_e h =
  h_y - h_x$ for $e = \( x \, y \)$. We call these height vertices and edges #emph[primary],
  to distinguish them from the auxiliary subdivisions in the comparison proof;
  #emph[primal] refers to the spin lattice. The height takes values in $2 pi bb(Z)$. Its increment weight is

#[#set math.equation(numbering: n => "(4)")
 $ p_b \( j \) = e^(- b) I_j \( b \) \, wide sum_(j in bb(Z)) p_b \( j \) e^(t j) =
   exp { b \( cosh t - 1 \) } . $ <eq:bessel-weight>]

Here $I_j$ is the modified Bessel function. Thus $p_b$ is the law of the difference of two independent Poisson
  variables of mean $b \/ 2$. An #emph[integral connection] is an antisymmetric edge function $tau : E arrow.r
  2 pi bb(Z)$. The weight in that sector is

$ product_(e in E) p_b (frac(nabla_e h + tau_e, 2 pi)) . $

A connection is flat where its circulation around every contractible cycle is zero.
  Its circulations around the remaining holes are its periods.

We allow nonnegative quadratic penalties in real linear observations, hard pins,
  and prescribed relative height data. Every observation used after a cut is supported in one component.
  A component with no absolute constraint or confining observation is summed modulo a common translation by $2 pi
  bb(Z)$; when its constant is confined, all its translation copies are summed.
  A hard pin fixes that constant instead. Relative translations between cut components are summed again on
  restoration. Write $Z_G^tau$ for a partition function with these conventions and $Z_G^0$ for the same graph,
  cuts, and penalties with all affine data centered.

An integral gauge change replaces $tau$ by $tau + nabla psi$ and the height variable by $h - psi$, where $psi :
  V arrow.r 2 pi bb(Z)$. This is an exact reindexing when every affine datum is changed with the height.
  A penalty $parallel B h - y parallel^2 \/ 2$ then has center $y - B psi$,
  and absolute data $b^p$ on a set $p$ become $b^p - psi \|_p$.
  For relative data $h_z - h_(z_0) = u_z$, the new value is $u_z - psi_z + psi_(z_0)$.
  Thus a hard zero pin is preserved when $psi = 0$ on it, and a constraint requiring all heights on a set to be
  equal is preserved when $psi$ is constant there.

#thm([Lemma 2.1.])[
  (Spin–height duality).  #emph[In a free spin box, the two-point correlation is $Z_G^tau \/
    Z_G^0$ on the dual graph with the exterior face fixed at height zero.
    One may represent that face by separate exterior incident copies, all pinned at zero,
    or identify those copies while retaining every edge. Circulations below are read in the dual with the exterior
    copies identified. The connection has circulations $+ 2 pi$ and $-
    2 pi$ around the two sources and can be supported on the dual bonds crossing a primal current path joining them.]
  #emph[The center magnetization $M_n$ defined in (3) satisfies $M_n =
    bb(E)_(n \, b_c)^(thin 0) e^(i theta_0) > 0$. It is $Z_G^tau \/ Z_G^0$ on the free dual square with $2
    n$ dual vertices on each side, indexed by the primal cells,
    where $tau$ has one circulation $2 pi$ around the center.
    It may be supported on the dual bonds crossing a primal current path from the center to the boundary.]
] <lem:duality>

#proof[
  Expand each spin interaction in its Fourier series,
  $ e^(b cos \( theta_x - theta_y \)) = sum_(j in bb(Z)) I_j \( b \) e^(i j \( theta_x - theta_y \)) . $
  In the fixed-boundary square first cancel the interactions whose two endpoints are fixed boundary spins.
    Integrating each remaining unfixed spin imposes its integer divergence condition.
    Subtract a fixed primal current carrying the inserted charges along the stated path.
    The remaining current is divergence free at every integrated vertex:
    at all vertices in the free spin box and at the interior vertices in the fixed-boundary square.
    Rotation onto dual edges then gives an integral gradient.
    In the free spin box its exterior height is fixed; in the fixed-boundary square it is determined modulo a
    common translation. The factors $e^b$ in (4) cancel in the ratio.
    The numerator and denominator are sums of strictly positive Bessel weights, so the ratios are positive.
    Current reversal identifies each insertion with its conjugate, giving the stated real cosine expectations.
    This is the duality of [17] Lemma 2.1 and [18] Lemma 2.1, with their respective boundary conventions.
    For the classical current and Bessel-height representations, see also [9] Appendix A and [20] Section 2. ◻
]

The reference form on a retained primary graph is the unit-conductance form

#[#set math.equation(numbering: n => "(5)")
 $ chevron.l g \, A_G g chevron.r = sum_({ x \, y } in E) \( g_x - g_y \)^2 . $ <eq:reference-energy>]

It converges under lattice scaling to $integral \| nabla g \|^2$.
  For the four nearest steps this is exactly the operator $A_0$ in [16]. We write $A$ when the graph is understood.

=== 2.2 The critical height inputs <the-critical-height-inputs>

#thm([Proposition 2.2.])[
  (Finite affine comparisons).  #emph[On every fixed primary graph, the Bessel height law has the following properties.]
  + #emph[A shifted-to-centered partition ratio is at most one and decreases when the same nonnegative quadratic
    precision is added to the affine and centered coordinates.
    Affine data may include an integral connection, observation centers, and compatible nonzero equality values.
    The monotonicity remains valid with a fixed real linear statistic in the numerator exponent,
    although the tilted ratio need not be at most one.]
  + #emph[For zero affine data, centered covariances and centered real moment generating functions decrease under
    added centered precision. Centered characteristic coefficients allowed by the constant convention in both laws
    are nonnegative and increase under added precision. They are strictly positive for the finite-graph phases
    used below, whose coefficient total on every unconfined component is an integer.]
  + #emph[If $X = sum_e q_e nabla_e h$ in a centered law, then
$ "Var" X lt.eq C_b sum_e q_e^2 \, wide bb(E) \| X \|^k lt.eq C_(k \, b) (sum_e q_e^2)^(k \/ 2) . $

 More generally, after releasing endpoint, curl, and period constraints while retaining independent primary
   increments, a tilt with $max_e \| q_e \| lt.eq K$ costs at most $exp \( C_(b \, K) sum_e q_e^2 \)$.]
  #emph[The statements include independent Gaussian observation noises.
    Released constants are taken modulo translations or confined;
    a real statistic used in releasing a constant must annihilate it.]
] <prop:comparisons>

#proof[
  The comparison assertions are [17] Lemma 2.2. That lemma replaces each primary bond by a chain of
    lattice-Gaussian bonds, applies the finite affine comparison on the enlarged lattice,
    and passes to the limit at the fixed primary graph. Equality constraints are limits of positive quadratic
    penalties. Thus the same affine statistic is kept when observations or constraints are released.
    Strict positivity for the phases used here follows from the phase-transfer estimate [17] Equation (2.2) and
    its proof: on an unconfined component subtract an integer point charge and interpolate the remaining
    zero-total finite-variance test from zero; on a confined component interpolate directly using its finite
    fixed-graph variance. The finite lattice-Gaussian comparison underlying this argument is developed in [16]
    Lemma 2.1 from the inequality of [19] Theorem 2.1 in the arXiv version.
  For the last assertion, perform these releases before estimating the tilt.
    The independent primary transform is the product of the transforms in (4), with $t = 2 pi q_e$.
    For $\| q_e \| lt.eq K$, $cosh \( 2 pi q_e \) - 1 lt.eq C_K q_e^2$. This gives the last bound.
    Normalize $q$ by $\( sum q_e^2 \)^(1 \/ 2)$ and differentiate bounded exponential moments to obtain the stated
    moment bounds. These are the primary reference-cost bounds of [17] Lemma 2.3;
    no bound on the microscopic Gaussian precision of the subdivided chains is used. ◻
]

The next proposition uses absolute pin data: $h_H = 0$ fixes every primary height in $H$,
  and $b^p$ specifies a compatible absolute height at every primary vertex of $p$.
  Its approximation by finite guard observations is understood in probability, at each prescribed tolerance,
  under the sampled law stated there. The finite list of smooth guard probes is fixed before the lattice limit and
  enlarged afterward to reduce the tolerance.

#thm([Proposition 2.3.])[
  (Critical coefficient and mixed limits).  #emph[For the critical parameter in (2),
    the Bessel height coefficient of [17] is
#[#set math.equation(numbering: n => "(6)")
 $ a = a \( b_c \) = 8 pi . $ <eq:critical-coefficient>]

 At this parameter the following fixed-geometry statements hold.]
  + #emph[Let the fixed geometry belong to the polygonal Lipschitz class of [17] Theorem 3.1:
    it is a finite union of bounded rectangular pieces with nondegenerate faces and widths.
    Pieces in one component are joined along full interfaces, which may be subdivided into segments;
    point contacts do not join components. All passages have positive width.
    Allow free walls and hard pins on the primary vertices in aligned unions of positive-area boxes.
    On each component $U$, fixed bounded, piecewise continuous density smears of the height have Gaussian Laplace
    and moment limits with covariance the inverse of
$ a^(- 1) integral_U \| nabla v \|^2 quad upright("on") quad { v in H^1 \( U \) : v = 0 upright(" on the pin") } . $

 For an unpinned component this is a statement about mean-free smears;
   its fractional mean modulo $2 pi$ becomes independent and uniform.
   Fixed finite-rank nonnegative penalties in box averages give the corresponding Gaussian laws,
   with constants integrated when the penalties confine them.
   The statements hold along every admissible mesh sequence, including bounded rounding of the fixed geometry.
   They include energy-approximable shifts in the sense of [17] Theorem 3.1.]
  + #emph[Start with no hard pins and use the centered law whose component-local box-average penalties confine
    every pre-pin component constant. Let $H \, p$ be positively separated unions of boxes. Put
$ D \( H \, p \) = log frac(bb(P) \( h_H = 0 divides h_p = 0 \), bb(P) \( h_H = 0 \)) \, wide r_H \( b^p \) =
  frac(bb(P) \( h_H = 0 divides h_p = b^p \), bb(P) \( h_H = 0 divides h_p = 0 \)) . $

 Then $D \( H \, p \) gt.eq 0$ converges to the Gaussian pin interaction, $0 < r_H lt.eq 1$,
   and $bb(E)_(upright("cen")) r_H = e^(- D \( H \, p \))$, where the expectation samples the guard data in the
   centered law. For every fixed finite list of these density smears and box averages,
   the conditional Laplace transforms and $r_H$ admit approximations by fixed finite lists of smooth observations
   of the guard data, whose laws and functions converge to their Gaussian counterparts.
   The list is enlarged after the lattice limit. These convergence assertions also hold when the data are sampled
   under a fixed finite real linear tilt; $D$ and $r_H$ retain their centered definitions above.]
] <prop:height-inputs>

#proof[
  Equation (6) is the conclusion of [17] Section 6. The first and second parts are respectively [17] Theorems 3.1
    and 3.2. In the second part, observations are component-local before pins are imposed.
    The finite-observation formulation is part of the theorem;
    it does not assert uniform convergence at every microscopic guard value. ◻
]

We also use the restoration consequence [17] Lemma 3.9. Suppose every endpoint of a restored bond,
  and the support of every restored form, lies in a core $H$ separated from a guard $p$.
  If $r_Delta$ is the conditional restoration factor divided by its value at zero guard data, then $r_H lt.eq
  r_Delta lt.eq 1$. The guard laws in the two topologies transfer events whose probabilities tend to zero in
  either direction, also under a fixed real linear tilt. The finite-observation approximations above concern
  conditional Laplace transforms and $r_H$; no additional limit for $r_Delta$ is asserted.
  In each use, the graph, pin regions, and observation cells are fixed before the lattice limit.

== 3 Fixed-geometry comparison <sec:geometry>

The center magnetization isolates the microscopic cost of one spin insertion.
  We compare boxes by placing the same finite nest of annuli around each corresponding source.
  An attachment calculation separates the ratio of a nest from that of its exterior; the nest ratios then cancel,
  leaving exterior energies at fixed geometry. The first comparison is between square sizes,
  and the second concerns the free-box thermodynamic correlation of two insertions.
  All continuum limits used here keep the holes and every separating region at fixed positive size.

#thm([Proposition 3.1.])[
  (Comparison with center magnetization).  #emph[For integer sequences $n \, n' arrow.r oo$ with $n' \/ n arrow.r
    d in \( 0 \, oo \)$,
#[#set math.equation(numbering: n => "(7)")
 $ M_(n') / M_n arrow.r d^(- 1 \/ 8) . $ <geo:center-ratio>]

 There is a constant $c_(upright("shape")) in \( 0 \, oo \)$ such that
#[#set math.equation(numbering: n => "(8)")
 $ frac(C_(b_c) \( r \), M_r^2) arrow.r c_(upright("shape")) wide \( r arrow.r oo \, med r in bb(Z) \) .
   $ <geo:bulk-ratio>]

 Here $C_(b_c)$ is the thermodynamic limit in (2); that limit precedes $r arrow.r oo$.
   In particular, $M_n = n^(- 1 \/ 8 + o \( 1 \))$.]
] <geo:comparison>

=== 3.1 Separating the insertion from the exterior <separating-the-insertion-from-the-exterior>

For a graph with the boundary and constant conventions of Section 2, write $Phi_G^tau =
  Z_G^tau \/ Z_G^0$ for its bare sector ratio. The fixed-domain sector input evaluates this ratio on a free
  exterior. Let $U$ be a bounded connected rectilinear domain with a simple outer boundary and finitely many
  disjoint simple holes, all with dyadic vertices, positive side lengths, and positive passages.
  Give the height graph free walls. If $theta.alt_0$ is a smooth closed one-form near $overline(U)$ whose periods
  about the holes are prescribed multiples of $2 pi$, set

$ cal(M)_U \( theta.alt_0 \) = inf_(g in H^1 \( U \)) integral_U \| theta.alt_0 + nabla g \|^2 . $

Let $cal(G)_nu \( U \)$ be its nearest-neighbor primary graph at mesh $nu^(- 1)$.
  For integral lattice connections that are flat on the retained graph away from the holes and have these periods,
  the sector theorem of [18] Theorem 3.1 states that

#[#set math.equation(numbering: n => "(9)")
 $ Phi_(cal(G)_nu \( U \))^tau arrow.r exp { - cal(M)_U \( theta.alt_0 \) \/ \( 2 a \) }
   wide \( nu arrow.r oo \) \, $ <geo:free-sector>]

where $a = 8 pi$. The limit holds along every coherent bounded-step rounding of this fixed geometry.
  The energy depends only on the periods. This statement concerns free height walls;
  a pinned exterior will be treated below.

To connect (9) to a microscopic source, use the annular construction of [18] Sections 4 and 5.
  Fix a small $epsilon > 0$ and a rectilinear disk $P$ with dyadic vertices such that

#[#set math.equation(numbering: n => "(10)")
 $ B \( 0 \, 1 - epsilon \) subset P subset B \( 0 \, 1 + epsilon \) . $ <geo:polygon>]

Choose a sufficiently large power of four $lambda$, and an integer $𝜚_0$ aligned so that all relevant array
  divisions lie between rows of dual vertices. Put $𝜚_i = 𝜚_0 lambda^i$.
  The $i$-th annulus has walls $𝜚_(i - 1) P$ and $𝜚_i P$. Write $Q_s = \( - s \, s \)^2$ and $A_lambda =
  lambda P \\ P^compose$. In the reference annulus $A_lambda$,
  the guard is $overline(Q_(2 sqrt(lambda))) \\ Q_(sqrt(lambda))$,
  and the inner and outer end regions are $A_lambda ∩ overline(Q_4)$ and $A_lambda \\ Q_(lambda \/ 4)$,
  respectively. Scale these three regions by $𝜚_(i - 1)$, and call the guard $sans(P)_i$.
  It is a full separating band, and each end contains every endpoint in that annulus of a bond to be restored at
  its wall. These prescribed bands, with positive gaps, are the geometry used in the flat-pin estimate below.

Choose one vertex in $sans(P)_i$. A guard datum records every height difference from that vertex.
  In the annular quotient choose its height to be zero, so the datum specifies every guard height.
  The nearest-neighbor weight then factors between the two sides conditionally on that datum.
  Write $mu_i^tau$ for the guard law in the cut annulus, with its one common constant quotiented out.

A core is a connected finite block filling the first hole; it may carry the source and has no guard data.
  At an interface in this construction, let $T^tau \( u \)$ be the restored partition sum divided by the cut
  partition sum at its incident guard data $u$, and put $d_T = T^0 \( 0 \)$.
  The restored sum includes the relative integer translations of the joined components.
  The same definition applies to one joint interface joining several last annuli to a connected exterior,
  with no direct bonds between distinct incident annuli. Its data are those in the incident annuli,
  while all exterior heights are summed together inside that one kernel.
  For a vertex region $H$, let $\[ H \]$ denote the event that all its heights are equal,
  without prescribing their common value. In a centered cut annulus with guard $sans(P)_i$, put

$ overline(D)_i \( H \, sans(P)_i \) = log frac(bb(P) \( \[ H \] divides \[ sans(P)_i \] \), bb(P) \( \[ H \] \)) . $

The upper kernel bound of [18] Lemma 5.1, its Equation (8), holds for all these interfaces,
  including a core interface. For an annulus–annulus or joint exterior interface,
  its Equation (9) also gives the centered average bound:

#[#set math.equation(numbering: n => "(11)")
 $ 0 < frac(T^tau \( u \), d_T) lt.eq 1 \, wide integral T^0 / d_T product_i thin upright(d) mu_i^0 gt.eq exp {-
   sum_i overline(D)_i \( H_i \, sans(P)_i \)} . $ <geo:kernel-bounds>]

The sum and product use the incident annuli and the appropriate end in each.
  The first bound is pointwise in the data, and the second is an average under independent centered cut annuli.
  The centered divisor $d_T$ therefore works for the shifted kernel as well.
  The flat-pin estimate of [18] Proposition 4.1 makes each interaction on the right arbitrarily small in the mesh
  limit by taking $lambda$ large at fixed $P$.

Two consequences of [18] Proposition 5.3 and Corollary 5.5 control how the averaged loss passes through a whole
  nest. For any $xi in \( 0 \, 1 \/ 64 \)$, one can first take $epsilon$ small, then $lambda$ large,
  and finally the fixed aligned threshold $𝜚_0$ large, so that every interface between successive annuli of these
  radii satisfies

#[#set math.equation(numbering: n => "(12)")
 $ integral (1 - T_i^tau / d_(T_i)) thin upright(d) \( mu_i^tau ⊗ mu_(i + 1)^tau \) lt.eq xi . $ <geo:regular-loss>]

This holds in the centered sector and in either unit-period sector, when restoration introduces no source.
  It follows from the exact sector identity (10) in that proposition and (9);
  it is the normalized estimate (11) there. All late annuli obey the same bound because they refine the same fixed
  geometry. Fix one such core, containing the source in a unit sector,
  and fix its connection once on the increasing family. In a nest of $J$ annuli,
  the law of its last guard then has density at most $2$ with respect to $mu_J^tau$,
  for all sufficiently large $J$. This holds in all three sectors and for identical lattice translates.
  The only lower assumption on the first core kernel is its strict positivity;
  no uniform positive lower bound on that kernel is required.
  This density bound compares the actual last-guard law, after all inner blocks have been joined,
  with the cut law used in the averaged estimate.

It remains to attach the whole nests to their exterior. Let $cal(N)_J$ be the bare sector ratio of one whole free
  nest of depth $J$, with its core and a unit source. Integral gauge changes and reversal of all heights show that
  the same $cal(N)_J$ is obtained from any lattice translate and either sign.
  This is the common factor that will cancel in both comparisons.
  Suppose $k$ such nests, with disjoint closures, attach to a connected exterior.
  The graph of cut blocks, with an edge for each interface, is a tree rooted at the exterior;
  there are no other block adjacencies, in particular no direct bonds between distinct incident last annuli.
  Write $mu_(J \, i)^tau$ for the cut guard law in the $i$-th incident last annulus,
  with its restricted connection. In the following ratio, “joined” means the exterior after joining only the $k$
  last annuli; the holes then have the inner radii of those annuli. Define

#[#set math.equation(numbering: n => "(13)")
 $ frak(q)_(upright("ext"))^tau =
   frac(Phi_(upright("joined"))^tau, Phi_(upright("ext"))^tau product_(i = 1)^k Phi_(upright("last") \, i)^tau) .
   $ <geo:joining-ratio>]

Releasing those interfaces gives $0 < frak(q)_(upright("ext"))^tau lt.eq 1$.
  Exact summation of the interface kernel, which is Equation (10) of [18], gives

#[#set math.equation(numbering: n => "(14)")
 $ integral T_(upright("ext"))^tau / d_(upright("ext")) product_i thin upright(d) mu_(J \, i)^tau =
   (integral T_(upright("ext"))^0 / d_(upright("ext")) product_i thin upright(d) mu_(J \, i)^0)
   frak(q)_(upright("ext"))^tau . $ <geo:kernel-sector-identity>]

Thus a sufficient attachment condition, along the lattice sequence in question, is

#[#set math.equation(numbering: n => "(15)")
 $ sum_i overline(D)_i \( H_i \, sans(P)_i \) lt.eq delta + o \( 1 \) \, wide
   log frak(q)_(upright("ext"))^tau gt.eq - delta - o \( 1 \) \, $ <geo:attachment-condition>]

with $delta > 0$ arbitrarily small. Indeed, (11) and (14) bound the shifted average loss by $1 -
  e^(- 2 delta - o \( 1 \))$, and the centered one by $1 - e^(- delta - o \( 1 \))$.
  This estimate is averaged over the independent cut-annulus laws, without any uniform lower bound at individual data.

The lower thermodynamic comparison below retains a hard pin in the exterior.
  We therefore check that the same reasoning applies when that pin fixes the exterior constant and is kept in both
  the restored and cut graphs. The entire hard constraint remains in the exterior partition sum and joint kernel;
  for the rim below, this includes every equality $h_x = 0$ on the rim.
  Accordingly, $d_(upright("ext")) = T_(upright("ext"))^0 \( 0 \)$ is evaluated with that pin retained.
  Prescribed relative guard data are affine equalities, so Proposition 3,
  with the independent increments on cut bonds, still gives $0 < T^tau \/ d_T lt.eq 1$.
  To prove the centered bound in (11), impose the flat end event $\[ H_i \]$ in each incident annulus and choose
  its representative to be zero on that end. The restored-bond factor now depends on the relative integer
  translations and the exterior heights, and is independent of the guard data.
  Adding these end constraints decreases the data-to-zero ratio,
  giving the product of the annular flat-pin ratios in (11). This proof uses no unpinned exterior law.
  For multiplication, place the exterior, with its full pin constraint, at the root of the tree of cut blocks.
  Its configurations are summed subject to every retained pin equality.
  Once its additive constant is fixed, the remaining block constants are in bijection with the integer differences
  along the tree edges. Conditioning on the full annular guards separates their two sides,
  so the tree multiplication of [18] Lemma 5.2 and the identity (14) follow with this pin retained.

To finish the attachment calculation, let $e_tau$ be the expectation of $T_(upright("ext"))^tau \/
  d_(upright("ext"))$ under the product of the propagated last-guard laws of the whole nests,
  and define $e_0$ in the same way. Their densities relative to the independent cut laws are at most $2^k$,
  so (15) implies $1 - e_tau \, 1 - e_0 lt.eq 2^k \( 1 - e^(- 2 delta - o \( 1 \)) \)$.
  Exact multiplication and cancellation of $d_(upright("ext"))$ give

#[#set math.equation(numbering: n => "(16)")
 $ Phi_(upright("full"))^tau = cal(N)_J^k Phi_(upright("ext"))^tau e_tau / e_0 \, wide
   log Phi_(upright("full"))^tau = k log cal(N)_J + log Phi_(upright("ext"))^tau + O_k \( delta \) +
   o \( 1 \) . $ <geo:attachment-factorization>]

Here $delta$ is small at fixed $k$, and $J arrow.r oo$ with the core, $P \, lambda \, 𝜚_0$ fixed.
  The first identity is exact; the second is the attachment consequence we shall use.

=== 3.2 A pinned comparison for the thermodynamic correlation <a-pinned-comparison-for-the-thermodynamic-correlation>

We first place the desired thermodynamic correlation between two finite height ratios.
  For a large dyadic $R_(upright("out")) gt.eq 8$, let

$ sans(F)_(R_(upright("out"))) = overline(Q_(7 R_(upright("out")) \/ 8)) \\ Q_(3 R_(upright("out")) \/ 4) . $

The region $sans(F)_(R_(upright("out")))$ is a positive-width rim,
  expressible as an aligned union of positive-area boxes with dyadic vertices.
  In lattice units let $G_(R_(upright("out")) \, r)$ be the dual primary array in $r Q_(R_(upright("out")))$,
  with coherent rounding, and let $sans(F)_(R_(upright("out")) \, r)$ be the filled primary boxes representing $r
  sans(F)_(R_(upright("out")))$. Put

$ Phi_(R_(upright("out")) \, r)^(upright("fr")) = Phi_(G_(R_(upright("out")) \, r))^tau \, wide
  Phi_(R_(upright("out")) \, r)^(upright("pin")) =
  Phi_(G_(R_(upright("out")) \, r) \, thin h_(sans(F)_(R_(upright("out")) \, r)) = 0)^tau \, $

where the sources are $0 \, r e_1$, with periods $+ 2 pi \, - 2 pi$.

There is one connection suitable for both comparisons. In the primal lattice take the actual nearest-neighbor path

$ \( 0 \, 0 \) \, \( 1 \, 0 \) \, dots.h \, \( r \, 0 \) $

and give its edges the unit current directed from one source to the other.
  The dual connection is supported on the dual bonds crossing these path edges.
  They lie inside $r Q_(R_(upright("out")) \/ 2)$, for all large $r$,
  so the connection vanishes on every bond meeting the rim or lying outside it.
  Use this connection in every larger free spin box.

For a box $Lambda_R$ containing $r Q_(R_(upright("out")))$ in its interior,
  release the matching equalities for all bonds crossing the boundary of $G_(R_(upright("out")) \, r)$,
  retaining their independent Bessel increments as in the finite comparison.
  The resulting inner height component has a free wall; the connection on the exterior component is zero and its
  ratio cancels. Proposition 3 therefore gives the upper bound by $Phi_(R_(upright("out")) \, r)^(upright("fr"))$.
  For the lower bound add the common hard pin $h_(sans(F)_(R_(upright("out")) \, r)) = 0$ before making any cut.
  Added precision decreases the sector ratio. This filled rim separates the interior from the entire exterior.
  Because the connection is supported on the specified path inside the rim,
  the partition factor for all exterior variables, including the original fixed exterior face,
  is identical in the numerator and denominator. It cancels.
  The same cancellation of the outer collar occurs in $G_(R_(upright("out")) \, r)$ with this rim pinned,
  so the remaining ratio is exactly $Phi_(R_(upright("out")) \, r)^(upright("pin"))$.
  Hence, for every sufficiently large $R$ at each fixed $R_(upright("out")) \, r$,

$ Phi_(R_(upright("out")) \, r)^(upright("pin")) lt.eq bb(E)_(R \, b_c)^(upright("free"))
  cos \( theta_0 - theta_(r e_1) \) lt.eq Phi_(R_(upright("out")) \, r)^(upright("fr")) . $

Taking $R arrow.r oo$ at this point proves

#[#set math.equation(numbering: n => "(17)")
 $ Phi_(R_(upright("out")) \, r)^(upright("pin")) lt.eq C_(b_c) \( r \) lt.eq
   Phi_(R_(upright("out")) \, r)^(upright("fr")) . $ <geo:thermodynamic-bracket>]

The finite comparisons just used are the affine and matching-constraint comparisons of [17] Lemma 2.2;
  the exterior cancellation is why the location of the connection matters.

Figure 1 shows the separation used for the pinned sector estimate.
  In the later annular application, its two holes are those left in the exterior when the two insertion nests are
  removed from the full pinned comparator $Phi_(R_(upright("out")) \, r)^(upright("pin"))$.
  Its retained arc $Gamma$ is the portion of the primal source path between the two hole walls.
  The guard separates the strip bonds from the artificial side boundary of the patch, including at the hole exits;
  the rim lies beyond the patch.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-1.8, -1.8), (1.8, 1.8), stroke: (thickness: 0.8pt, cap: "round", join: "round"))
  compound-path({rect((-1.56, -1.56), (1.56, 1.56), fill: rgb("#dfdfdf"), stroke: none); line((1.56, 1.56), (-1.34, -1.34)); rect((-1.34, -1.34), (1.34, 1.34), fill: rgb("#dfdfdf"), stroke: none)}, fill: rgb("#dfdfdf"), fill-rule: "even-odd", stroke: none)
  rect((-1.56, -1.56), (1.56, 1.56), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, cap: "round", join: "round"))
  rect((-1.34, -1.34), (1.34, 1.34), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, cap: "round", join: "round"))
  content((0, 1.45), [#text(size: 9pt)[$sans(F)$]])
  rect((-0.34, -0.12), (0.34, 0.12), fill: rgb("#f2f2ff"), stroke: none)
  line((-0.72, -0.28), (-0.44, -0.28), (-0.44, -0.18), (-0.34, -0.18), (-0.34, 0.18), (-0.44, 0.18), (-0.44, 0.28), (-0.72, 0.28), (-0.72, 0.18), (-0.82, 0.18), (-0.82, -0.18), (-0.72, -0.18), close: true, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, cap: "round", join: "round"))
  line((0.44, -0.28), (0.72, -0.28), (0.72, -0.18), (0.82, -0.18), (0.82, 0.18), (0.72, 0.18), (0.72, 0.28), (0.44, 0.28), (0.44, 0.18), (0.34, 0.18), (0.34, -0.18), (0.44, -0.18), close: true, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, cap: "round", join: "round"))
  line((-0.34, 0.12), (0.34, 0.12), (-0.34, -0.12), (0.34, -0.12), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round", dash: "dashed"))
  line((-0.58, 0), (0.58, 0), stroke: (paint: rgb("#666666"), thickness: 0.65pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((-0.34, 0), (0.34, 0), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, cap: "round", join: "round", dash: "densely-dashed"))
  circle((-0.58, 0), radius: 0.04233, fill: black, stroke: none)
  circle((0.58, 0), radius: 0.04233, fill: black, stroke: none)
  line((-0.58, 0), (0.58, 0), fill: black, stroke: none)
  content((-0.58, 0.31), [#text(size: 9pt)[$+$]], anchor: "south", padding: 0.1176cm)
  content((0.58, 0.31), [#text(size: 9pt)[$-$]], anchor: "south", padding: 0.1176cm)
  content((0, 0.78), [#text(size: 9pt)[$W$]])
  line((0, 0.65), (0, 0.16), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", length: 0.15cm, fill: rgb("#0000a6"))))
  line((-1.08, -0.72), (-0.7, -0.72), stroke: (paint: rgb("#666666"), thickness: 0.65pt, cap: "round", join: "round", dash: "densely-dotted"))
  content((-0.62, -0.72), [#text(size: 7pt)[full path]], anchor: "west", padding: 0.1176cm)
  line((-1.08, -0.98), (-0.7, -0.98), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, cap: "round", join: "round", dash: "densely-dashed"))
  content((-0.62, -0.98), [#text(size: 7pt)[retained $Gamma$]], anchor: "west", padding: 0.1176cm)
  content((0, 1.92), [#text(size: 9pt)[comparison square $Q_(R_( upright(o) "ut"))$]], anchor: "south", padding: 0.1176cm)
  content((0, -1.94), [#text(size: 9pt)[\(a\) Global arrangement]], anchor: "north", padding: 0.1176cm)
  rect((3.52, -1.55), (4.3, 1.55), fill: rgb("#f0f0f0"), stroke: none)
  rect((4.3, -1.1), (7.8, 1.1), fill: rgb("#f2f2ff"), stroke: none)
  rect((4.3, -0.27), (7.8, 0.27), fill: rgb("#ffeded"), stroke: none)
  merge-path({line((7.8, 0.27), (4.3, 0.27)); line((7.8, 0.39), (4.3, -0.39)); line((7.8, -0.27), (4.3, -0.27))}, close: false, fill: rgb("#ffff9e"), stroke: none)
  rect((4.3, 0.15), (7.8, 0.27), fill: rgb("#ffff9e"), stroke: none)
  rect((4.3, 0.27), (7.8, 0.39), fill: rgb("#ffff9e"), stroke: none)
  rect((4.3, -0.39), (7.8, -0.27), fill: rgb("#ffff9e"), stroke: none)
  rect((4.3, -0.27), (7.8, -0.15), fill: rgb("#ffff9e"), stroke: none)
  rect((4.3, 0.54), (7.8, 0.8), fill: rgb("#bfbfff"), stroke: none)
  line((7.8, 0.8), (4.3, -0.8), fill: rgb("#bfbfff"), stroke: none)
  rect((4.3, -0.8), (7.8, -0.54), fill: rgb("#bfbfff"), stroke: none)
  merge-path({line((7.8, 1.1), (4.3, 1.1)); line((7.8, 1.22), (4.3, -1.22)); line((7.8, -1.1), (4.3, -1.1))}, close: false, fill: rgb("#c4e2c4"), stroke: none)
  rect((4.3, 0.98), (7.8, 1.1), fill: rgb("#c4e2c4"), stroke: none)
  rect((4.3, 1.1), (7.8, 1.22), fill: rgb("#c4e2c4"), stroke: none)
  rect((4.3, -1.22), (7.8, -1.1), fill: rgb("#c4e2c4"), stroke: none)
  rect((4.3, -1.1), (7.8, -0.98), fill: rgb("#c4e2c4"), stroke: none)
  line((4.3, 1.1), (7.8, 1.1), (4.3, -1.1), (7.8, -1.1), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round", dash: "dashed"))
  line((4.3, 0.27), (7.8, 0.27), (4.3, -0.27), (7.8, -0.27), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, cap: "round", join: "round"))
  line((3.52, 0), (4.3, 0), stroke: (paint: rgb("#666666"), thickness: 0.65pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((4.3, 0), (7.8, 0), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, cap: "round", join: "round", dash: "densely-dashed"))
  circle((5.85, 0.27), radius: 0.02822, fill: rgb("#595959"), stroke: none)
  bezier((5.85, 0.27), (4.43, 0.48), (5.15, 0.3), (4.43, 0.34), stroke: (paint: rgb("#595959"), thickness: 0.55pt, cap: "round", join: "round"))
  line((4.43, 0.48), (4.43, 0.85), stroke: (paint: rgb("#595959"), thickness: 0.55pt, cap: "round", join: "round"))
  bezier((4.43, 0.85), (6.24, 1.37), (4.43, 1.12), (5.38, 1.37), stroke: (paint: rgb("#595959"), thickness: 0.55pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", length: 0.14cm, fill: rgb("#595959"))))
  content((6.3, 1.37), [#text(fill: rgb("#4d4d4d"))[#text(size: 7pt)[outside $W$]]], anchor: "west", padding: 0.1176cm)
  line((3.52, 1.55), (4.3, 1.55), (4.3, -1.55), (3.52, -1.55), stroke: (paint: rgb("#000000"), thickness: 0.8pt, cap: "round", join: "round"))
  content((3.88, 0.58), [#text(fill: rgb("#4d4d4d"))[#text(size: 7pt)[hole]]])
  content((3.87, -0.69), [#text(fill: rgb("#4d4d4d"))[#text(size: 7pt)[wall]]], angle: 90deg)
  line((4.2, 1.22), (4.2, 1.55), (4.14, 1.22), (4.26, 1.22), (4.14, 1.55), (4.26, 1.55), (4.2, -1.55), (4.2, -1.22), (4.14, -1.55), (4.26, -1.55), (4.14, -1.22), (4.26, -1.22), stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round"))
  content((4.12, 1.385), [#text(fill: rgb("#595959"))[#text(size: 7pt)[$>0$]]], anchor: "east", padding: 0.1176cm)
  content((4.12, -1.385), [#text(fill: rgb("#595959"))[#text(size: 7pt)[$>0$]]], anchor: "east", padding: 0.1176cm)
  content((7.9, 1.1), [#text(size: 9pt)[$H'$]], anchor: "west", padding: 0.1176cm)
  content((7.9, 0.67), [#text(size: 9pt)[$sans(P)$]], anchor: "west", padding: 0.1176cm)
  content((7.9, 0.27), [#text(size: 9pt)[$H$]], anchor: "west", padding: 0.1176cm)
  line((7.8, 0), (7.96, -0.2), stroke: (paint: rgb("#b20000"), thickness: 0.4pt, cap: "round", join: "round"))
  content((7.96, -0.23), [#text(size: 9pt)[$Gamma$]], anchor: "west", padding: 0.1176cm)
  content((7.9, -1.1), [#text(fill: rgb("#0000a6"))[#text(size: 7pt)[artificial side#linebreak()boundary of $W$]]], anchor: "west", padding: 0.1176cm)
  content((6.1, -0.67), [#text(size: 7pt)[full data $h_( sans(P) )=u$]])
  content((7.8, -1.43), [#text(fill: rgb("#595959"))[#text(size: 7pt)[to the other hole $arrow.r.long$]]], anchor: "east", padding: 0.1176cm)
  content((6, 1.92), [#text(size: 9pt)[plan view at one hole exit]], anchor: "south", padding: 0.1176cm)
  content((6, -1.94), [#text(size: 9pt)[\(b\) The guard meets the wall]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Schematic geometry for the pinned comparison. The dotted primal path includes the portions inside the holes; its red portion $Gamma$ is the retained arc between the walls. At the enlarged exit, both guard bands $sans(P)$ reach the original wall between $H$ and $H'$; conditioning fixes all primary guard heights $h_(sans(P)) = u$. A retained route from a strip interface to the artificial side boundary of $W$ must therefore meet a guard. The red interfaces lie in $H$, and $H'$ straddles that dashed boundary. Endpoint boxes are separate across each cut and lie in their respective components before pins are imposed. The buffers from $H$ to $sans(P)$, from $sans(P)$ to $H'$, and at side corners are positive. The same order continues around bends to the other wall, and the rim $sans(F)$ lies beyond $W$. Distances are schematic. ],
) <geo:pinned-schematic>

To estimate the lower comparator, we need a sector lower bound with the rim pinned.
  The following lemma supplies exactly that bound.

#thm([Lemma 3.2.])[
  (Trial energy with a pinned rim).  #emph[Let $U$ be a bounded connected polygonal Lipschitz domain in the
    fixed-geometry class of Proposition 4. Its outer boundary and the boundaries of its two holes are simple and
    rectilinear, with dyadic vertices and positive side lengths;
    the hole closures are disjoint and strictly inside the outer boundary, leaving positive-width passages.
    Let $sans(F)$ be an aligned union of positive-area boxes with dyadic vertices in $U$,
    permitted as a pin in that fixed geometry. Suppose a simple dyadic rectilinear arc joins interiors of sides of
    the two holes transversely and has a neighborhood at positive distance from $sans(F)$ and all nonincident
    boundaries. Give the holes periods $+ 2 pi \, - 2 pi$. Let $theta.alt =
    d v$ be a smooth closed one-form near $overline(U)$ with these periods,
    with a multivalued primitive whose only jump is across that arc and whose branch is zero on a neighborhood of
    $sans(F)$. Choose the canonical integral connections obtained from the jumps of this branch along a coherent
    rounded discretization of the arc, or connections related to them by integral gauges whose potentials vanish
    on every component of $sans(F)$. Then, along every admissible rounded mesh sequence,
#[#set math.equation(numbering: n => "(18)")
 $ liminf_(nu arrow.r oo) Phi_(cal(G)_nu \( U \) \, thin h_(sans(F)) = 0)^tau gt.eq exp {-
   frac(1, 2 a) integral_U \| theta.alt \|^2} . $ <geo:pinned-sector-bound>]

]
] <geo:pinned-sector>

#proof[
  We adapt the confined-sector argument in the proof of [18] Proposition 3.4, retaining the rim pin.
    A permitted gauge preserves the pin and the ratio, so we use the canonical connection.
    Round the arc within a bounded number of lattice steps and extend its transverse ends to the rounded hole
    walls. Transport the local branches across this rounding, which remains away from $sans(F)$,
    and sample them at the lattice vertices, using a coherent one-sided assignment when the rounded cut meets a
    vertex. Choose the integral jump $tau_e$ on each edge with its matching sign.
    The resulting real lattice values $v_nu$ satisfy
  $ nabla_e v_nu + tau_e = integral_e theta.alt \, wide v_nu = 0 upright(" on the rounded pin ") sans(F) . $
  The identity follows by integrating $d v$ along each edge,
    including its integral jump when the edge crosses or meets the rounded cut.
    The branches differ by integral multiples of $2 pi$, so $tau_e in 2 pi bb(Z)$;
    supported bonds lie within one lattice step of the rounded arc.
    The chosen branch is zero near every component of the pin. These branches are fixed before refining the lattice.
  Isolate a narrow rectilinear strip following the arc between the holes by cutting the bonds across both of its
    sides. Choose a wider strip patch $W$ and full guard bands $sans(P)$ on the two sides of the narrow strip,
    with positive buffers from the restored bonds and from the artificial boundary of $W$.
    The strip and patch meet the hole walls in interiors of sides.
    Choose all their widths and coordinates dyadically and keep $W$ at positive distance from $sans(F)$.
    For every sufficiently fine mesh, the narrow strip contains all bonds supporting $tau$.
    After this cut the strip admits a single-valued lift. The remaining domain excludes that entire support,
    so its lift is the original branch, already zero near every component of $sans(F)$.
    The patch $W$, which is disjoint from the pin, admits a lift both before and after restoring the strip.
    Fix an endpoint region $H$ inside $W$ containing both primary endpoints of every restored strip bond,
    and a region $H'$ containing both endpoints of every bond across the artificial boundary of $W$.
    Choose these as aligned unions of positive-area boxes with dyadic vertices, separated from $sans(P)$.
    At the transverse exits, their intervals on the hole sides follow the same nested order as the strip, guard,
    and patch boundaries, with positive gaps from each other and the side corners.
    The guard bands continue to the original hole walls between the intervals for $H$ and $H'$.
    Hence every path in the retained domain from a restored strip interface to the artificial boundary of $W$
    meets a guard, including paths near the exits. Use separate boxes on the two sides of every pre-pin cut,
    so each box lies in one pre-pin component. The clearance from $W$ to the rim also permits $H'$ to be disjoint
    from $sans(F)$.
  Fix one dyadic cell side $ell > 0$ and one cell partition aligned with the holes, the rim, the strip, $W$,
    and all guard and endpoint bands. At each topology determine its components before imposing pins.
    The restriction of this same partition has every whole observation cell in one such component.
    Using one box average on every cell confines the constant of every pre-pin component,
    including those later fixed by $sans(F)$. On every topology, with $sans(F)$ already pinned, add $1 /
    2 sum_Q \( h_Q - \( v_nu \)_Q \)^2$ in the numerator and $1 / 2 sum_Q h_Q^2$ in the denominator.
    Denote the resulting full graph ratio by $Phi_(nu \, ell)^(tau \, upright("conf"))$; below,
    a topology subscript specifies its cut version. The new observation residuals have the same positive
    precision, and the pin is compatible since $v_nu = 0$ there. Thus
  #[#set math.equation(numbering: n => "(19)")
   $ 0 < Phi_(nu \, ell)^(tau \, upright("conf")) lt.eq Phi_(cal(G)_nu \( U \) \, thin h_(sans(F)) = 0)^tau .
     $ <geo:confinement-below-bare>]
  On a cut component $V$, choose its single-valued lift $v_V$ and sample it at the lattice vertices with $v_V -
    v_nu in 2 pi bb(Z)$ pointwise. Since $nabla_e v_V = integral_e theta.alt$, the integral potential $psi =
    v_nu - v_V$ satisfies $tau + nabla psi = 0$. If $V$ meets $sans(F)$, both lifts use the zero branch there,
    so $psi = 0$ on the pin. Writing $B$ for the cell-average map,
    the gauge rule of Section 2 changes the observation center $B v_nu$ to $B v_nu - B psi = B v_V$.
    The mixed height limit in Proposition 4, at this fixed $ell$,
    and Gaussian completion give for its confined ratio the limit $exp { - I_(ell \, V) \( v_V \) \/ 2 }$, where
  $ I_(ell \, V) \( v_V \) = inf_(u in H^1 \( V \)\
u = 0 med upright("on") med V ∩ sans(F)) {a^(- 1) integral_V \| nabla u \|^2 +
  sum_(Q subset V) \( u_Q - \( v_V \)_Q \)^2} . $
  An empty pin in this display imposes no constraint. The unpinned constant is integrated.
    The converging lattice cell centers can be used in the Laplace limit:
    transforms at nearby fixed arguments give local equicontinuity by Hölder’s inequality.
    Trying $u = v_V$ is allowed, and cell Poincaré gives, for bounded values of the displayed functional,
  $ parallel u - v_V parallel_(L^2 \( V \))^2 lt.eq C ell^2
    (parallel nabla u parallel_2^2 + parallel nabla v_V parallel_2^2 + sum_Q \( u_Q - \( v_V \)_Q \)^2) . $
  Weak compactness and lower semicontinuity therefore show that $I_(ell \, V) \( v_V \) arrow.r
    a^(- 1) integral_V \| nabla v_V \|^2$ as $ell arrow.b 0$.
    This is the single-lift argument using the hard-pin energy space of [17] Theorem 3.1.
  We verify that restoring the strip has a vanishing averaged loss. For full absolute data $u$ on $sans(P)$, let
  $ K^tau \( u \) =
    frac(Z_(upright(o p e n \, sans(F)))^tau \( u \), Z_(upright(c u t \, sans(F)))^tau \( u \)) \, wide d_0 =
    K^0 \( 0 \) \, $
  with the confinement retained. Here $upright("open")$ restores the bonds cut across the two sides of the narrow
    strip, while $upright("cut")$ retains those cuts. The guard separates the restored bonds from the artificial
    side boundary of $W$ and from $sans(F)$. No observation cell crosses a guard division.
    Conditioning on the full guard hence makes $K^tau \( u \)$ exactly the kernel computed on $W$ alone,
    so it is unchanged by the exterior pin. Finite affine comparison gives $0 < K^tau \( u \) lt.eq d_0$.
  Adding the pin on the endpoint region $H$ to the centered data-to-zero comparison makes the restored factor a
    scalar. Bayes’ formula then gives
  $ 1 gt.eq bb(E)_(upright("cut") thin W \, 0) K^0 / d_0 gt.eq e^(- D_(nu \, ell)^W \( H \, sans(P) \)) . $
  Here $D_(nu \, ell)^W$ is the absolute pin interaction in the centered cut patch with its component-local cell
    observations, before either hard pin is imposed. The localization estimate of [18] Lemma 3.2 applies to this
    pre-pin law with no existing hard pins: for every fixed dyadic cut mixed geometry and positively separated
    aligned pin regions that are unions of positive-area boxes with dyadic vertices,
  #[#set math.equation(numbering: n => "(20)")
   $ lim_(ell arrow.b 0) limsup_(nu arrow.r oo) D_(nu \, ell) \( H \, sans(P) \) = 0 . $ <geo:cell-pin-localization>]
  It uses the Gaussian pin limit of [17] Theorem 3.2 for precision $a^(- 1) integral \| nabla u \|^2 +
    sum_Q u_Q^2$; $ell$ decreases through aligned dyadic values after the mesh limit.
    Both topologies of $W$ have the single-lift limit just proved,
    with the same energy since the deleted interfaces have zero area. Consequently the nonnegative patch loss satisfies
  $ L_W^tau & = sum_u frac(Z_(upright("cut") thin W)^tau \( u \), Z_(upright("cut") thin W)^0)
    (1 - frac(K^tau \( u \), d_0))\
 & = Phi_(upright("cut") thin W)^(tau \, upright("conf")) -
   Phi_(upright("open") thin W)^(tau \, upright("conf")) thin bb(E)_(upright("cut") thin W \, 0) K^0 / d_0 arrow.r
   0 wide \( nu arrow.r oo \, upright(" then ") ell arrow.b 0 \) . $
  The centered loss has the same conclusion.
  It remains to pass this loss from $W$ to the whole pinned graph.
    Let $G$ be the current graph with the narrow strip cut, and let $G'$ further cut the bonds across the
    artificial boundary of $W$. At prescribed guard data, finite comparison, with the rim pin retained, gives
  #[#set math.equation(numbering: n => "(21)")
   $ frac(Z_(G \, sans(F))^tau \( u \), Z_(G \, sans(F))^0) lt.eq
     frac(bb(P)_(G \, sans(F) \, 0) \( h_(sans(P)) = 0 \), bb(P)_(G' \, sans(F) \, 0) \( h_(sans(P)) = 0 \))
     frac(Z_(G' \, sans(F))^tau \( u \), Z_(G' \, sans(F))^0) . $ <geo:global-data-comparison>]
  Use the endpoint region $H'$ already chosen around that artificial boundary, separated from $sans(P)$.
    If $R \( u \)$ denotes the centered restoration factor from $G'$ to $G$,
    summation gives the probability ratio in (21) as $R \( 0 \) \/ bb(E)_(G' \, sans(F) \, 0) R$.
    The finite comparison argument in the proof of [17] Lemma 3.9 can be applied with the common rim constraint
    retained: adding the pin on $H'$ fixes both endpoints of each restored bond,
    so its restoration factor becomes independent of the guard data.
    Dividing the data-to-zero ratios and averaging by Bayes’ formula yields
  $ frac(bb(E)_(G' \, sans(F) \, 0) R, R \( 0 \)) gt.eq e^(- D_(nu \, ell)^(sans(F)) \( H' \, sans(P) \)) . $
  To control this conditional interaction by the available unpinned theorem,
    use the centered confined law on the pre-pin graph $G'$ and write all pin events with zero values.
    Bayes’ formula gives exactly
  #[#set math.equation(numbering: n => "(22)")
   $ 0 lt.eq D_(nu \, ell)^(sans(F)) \( H' \, sans(P) \) & :=
     log
     frac(bb(P) \( h_(H') = 0 divides h_(sans(P)) = 0 \, h_(sans(F)) = 0 \), bb(P) \( h_(H') = 0 divides
     h_(sans(F)) = 0 \))\
 & = D_(nu \, ell) \( H' union sans(F) \, sans(P) \) - D_(nu \, ell) \( sans(F) \, sans(P) \)\
 & lt.eq D_(nu \, ell) \( H' union sans(F) \, sans(P) \) . $ <geo:conditional-pin-identity>]
  The first inequality is centered pin monotonicity in the law already pinned on $sans(F)$;
    the last uses the nonnegativity of the unconditional interaction.
    The union $H' union sans(F)$ remains at positive distance from $sans(P)$.
    Its boxes and the observation cells are component-local on $G'$ before pins are imposed.
    Thus (20), applied to this union in that pre-pin geometry,
    makes the last expression tend to zero in the stated order.
    This derives the needed conditional estimate from the unconditional pin theorem.
  Multiply (21) by $1 - K^tau \( u \) \/ d_0 gt.eq 0$ and sum over $u$.
    On $G'$, the part outside $W$ factors off as a confined shifted-to-centered ratio,
    at most one by Proposition 3. The global loss is therefore at most
    $e^(D_(nu \, ell) \( H' union sans(F) \, sans(P) \)) L_W^tau$, and tends to zero.
    The same argument applies in the centered sector. If these two losses, normalized by the centered cut sum,
    are $L_tau \, L_0$, exact summation of the restored sums gives
  $ Phi_(upright("open"))^(tau \, upright("conf")) =
    frac(Phi_(upright("cut"))^(tau \, upright("conf")) - L_tau, 1 - L_0) . $
  The positive scalar $d_0$ has canceled. The losses vanish,
    and the cut components’ single-lift energies add to $integral_U \| theta.alt \|^2$. This proves the ordered estimate
  $ lim_(ell arrow.b 0) limsup_(nu arrow.r oo)
    lr(|Phi_(nu \, ell)^(tau \, upright("conf")) - exp {- frac(1, 2 a) integral_U \| theta.alt \|^2}|) = 0 . $
  For each fixed aligned $ell$, (19) bounds the bare pinned ratio below by this confined ratio.
    Taking its lattice liminf and then letting $ell arrow.b 0$ proves (18).
    The holes, rim, strip, patch, and bands were all fixed before these limits. ◻
]

=== 3.3 The energies outside the nests <the-energies-outside-the-nests>

Let $D = \( - 1 \, 1 \)^2$ be the reference square, and write its Dirichlet Green kernel as

$ G_D \( z \, w \) = frac(1, 2 pi) log frac(1, \| z - w \|) + R_D \( z \, w \) . $

The regular part $R_D$ is smooth across the diagonal on compact subsets of $D times D$.
  This Dirichlet kernel is the stream function for the free-height variational problem:
  rotating the gradient of $2 pi G_D$ gives the unit-period trial field tangent to the outer wall.
  The exterior-energy calculation of [18] Lemma 6.1 gives, for one circular hole of radius $t$ at the center,

#[#set math.equation(numbering: n => "(23)")
 $ cal(M)_(upright("cen")) \( t \) = 2 pi log \( 1 \/ t \) + 4 pi^2 R_D \( 0 \, 0 \) +
   O \( t \) . $ <geo:single-energy>]

More generally, for separated unit charges $sigma_i$ at $z_i$,
  that lemma gives the constant term $4
  pi^2 \[ sum_i R_D \( z_i \, z_i \) + 2 sum_(i < j) sigma_i sigma_j G_D \( z_i \, z_j \) \]$ and the leading term
  $2 pi k log \( 1 \/ t \)$. The error is $O \( t \)$ at each fixed separated configuration.
  It follows by integrating the Green energy on the small circles;
  the regular harmonic part has zero total normal derivative there, so no additional logarithmic error is created.

For the pair $0 \, e_1$ in $Q_(R_(upright("out"))) = R_(upright("out")) D$, put

$ frak(h)_(R_(upright("out"))) = R_(Q_(R_(upright("out")))) \( 0 \, 0 \) +
  R_(Q_(R_(upright("out")))) \( e_1 \, e_1 \) - 2 G_(Q_(R_(upright("out")))) \( 0 \, e_1 \) . $

Green scaling gives $R_(Q_(R_(upright("out")))) \( z \, w \) = \( 2 pi \)^(- 1) log R_(upright("out")) +
  R_D \( z \/ R_(upright("out")) \, w \/ R_(upright("out")) \)$.
  The singular logarithm between $0$ and $e_1$ is zero, so

$ frak(h)_(R_(upright("out"))) = R_D \( 0 \, 0 \) +
  R_D \( e_1 \/ R_(upright("out")) \, e_1 \/ R_(upright("out")) \) -
  2 R_D \( 0 \, e_1 \/ R_(upright("out")) \) arrow.r 0 . $

The $log R_(upright("out"))$ terms have canceled by neutrality. The same exterior formula therefore reads

#[#set math.equation(numbering: n => "(24)")
 $ cal(M)_(upright("pair") \, R_(upright("out"))) \( t \) = 4 pi log \( 1 \/ t \) +
   4 pi^2 frak(h)_(R_(upright("out"))) + O_(R_(upright("out"))) \( t \) . $ <geo:free-pair-energy>]

In both (23) and (24), replacing circular holes by $t P$ changes the right side by $O \( epsilon \)$:
  restrict admissible forms between the exteriors of the circles of radii $t \( 1 - epsilon \)$ and
  $t \( 1 + epsilon \)$, and use their logarithmic terms. The constant in this error is independent of small $t$.
  The same restriction argument on a circular annulus proves, for either unit period,

#[#set math.equation(numbering: n => "(25)")
 $ cal(M)_(lambda P \\ P^compose) \( plus.minus 1 \) = 2 pi log lambda + O \( epsilon \) \, $ <geo:annular-energy>]

with an error independent of large fixed $lambda$. This is also the annular energy estimate in the proof of [18]
  Proposition 5.3.

For the pinned lower bound we exhibit a trial attaining the same pair asymptotics.
  Identify the plane with $bb(C)$, and let

$ Theta \( z \) = arg z - arg \( z - 1 \) . $

Use the branch on $bb(C) \\ \[ 0 \, 1 \]$ that tends to zero at infinity.
  Its gradient has periods $+ 2 pi \, - 2 pi$, and $Theta \( z \) = O \( \| z \|^(- 1) \)$, $nabla Theta \( z \) =
  O \( \| z \|^(- 2) \)$ at infinity. Rotation identifies $nabla Theta$, up to orientation,
  with the gradient of $log \| z \| - log \| z - 1 \|$. Green’s identity on the plane outside the two radius-$t$
  disks gives

#[#set math.equation(numbering: n => "(26)")
 $ integral_(bb(R)^2 \\ \( B \( 0 \, t \) union B \( e_1 \, t \) \)) \| nabla Theta \|^2 = 4 pi log \( 1 \/ t \) +
   O \( t \) . $ <geo:plane-pair-energy>]

Indeed each small circle contributes $2 pi log \( 1 \/ t \) + O \( t \)$.
  The cross logarithm is $log \| e_1 \| = 0$, and the boundary term at infinity vanishes by the displayed decay.
  Harmonicity of each regular part removes a logarithmically amplified error, as in the preceding Green calculation.

Choose a smooth cutoff $chi_(R_(upright("out")))$ equal to one on $Q_(R_(upright("out")) \/ 2)$,
  zero outside $Q_(2 R_(upright("out")) \/ 3)$, and satisfying $\| nabla chi_(R_(upright("out"))) \| lt.eq
  C \/ R_(upright("out"))$. The cut $\[ 0 \, 1 \]$ lies where $chi_(R_(upright("out"))) = 1$.
  Thus $theta.alt_(R_(upright("out"))) = d \( chi_(R_(upright("out"))) Theta \)$ is a well-defined smooth closed
  one-form off the holes: its two branches have the same differential across that cut.
  It has the required periods and a lift identically zero near $sans(F)_(R_(upright("out")))$.
  The energy of both the discarded tail and the cutoff correction is $O \( R_(upright("out"))^(- 2) \)$,
  since on the transition region $\| Theta nabla chi_(R_(upright("out"))) \| + \| nabla Theta \| lt.eq
  C R_(upright("out"))^(- 2)$ and its area is $O \( R_(upright("out"))^2 \)$.
  The polygon inclusions (10) and (26) consequently give

#[#set math.equation(numbering: n => "(27)")
 $ integral_(Q_(R_(upright("out"))) \\ \( t P union \( e_1 + t P \) \)) \| theta.alt_(R_(upright("out"))) \|^2
   lt.eq 4 pi log \( 1 \/ t \) + C #scale(x: 120%, y: 120%)[\(] t + epsilon +
   R_(upright("out"))^(- 2) #scale(x: 120%, y: 120%)[\)] . $ <geo:pinned-trial-energy>]

The constants here are uniform for large $R_(upright("out"))$ and sufficiently small $t \, epsilon$.

We record carefully how these energies apply when the last radius moves with the lattice.
  Suppose $t_nu arrow.r t > 0$. Around each limiting source,
  choose fixed dyadic stair holes lying just inside the disk of radius $\( 1 - 3 epsilon \)
  t$ and just outside the disk of radius $\( 1 + 3 epsilon \) t$.
  Small further perturbations of their dyadic centers and sides give strict eventual inclusions of the rounded
  moving holes $t_nu P$. For the pair, choose exit sides whose interiors meet the fixed source-to-source path
  transversely. All these holes contain the source, remain separated, and leave positive passages.
  Cut comparison brackets the three sector ratios, using restrictions of the one connection chosen before the
  cuts. For the pinned ratios keep exactly the same rim in both brackets; the rim is connected,
  so the integral potential relating two flat representatives with the same periods and zero connection near the
  rim is constant there and can be normalized to zero. Apply (9) to the fixed free exteriors and Lemma 6 to the
  fixed pinned inner bracket. The changes of radius cost $O \( epsilon \)$ in the energy formulas.
  This is the moving-hole argument of [18] Lemma 6.2, with the pin retained in the lower comparison.
  Bounded rounding of the outer arrays and filled rim boxes is included in the fixed mixed limits.
  In particular, every sector limit just invoked has holes of positive radius.

Let $Phi_(upright("cen") \, nu)^(upright("ext")) \( t_nu \)$ denote the free exterior in the reference square $D$,
  with one moving polygonal hole at the center. The preceding argument gives

#[#set math.equation(numbering: n => "(28)")
 $ limsup_(nu arrow.r oo)
   lr(|log Phi_(upright("cen") \, nu)^(upright("ext")) \( t_nu \) + frac(2 pi log \( 1 \/ t \) + 4 pi^2 R_D \(
   0 \, 0 \), 2 a)|) lt.eq C \( epsilon + t \) . $ <geo:center-exterior>]

For the pair exterior in $Q_(R_(upright("out")))$,
  write $Phi_(upright("pair") \, R_(upright("out")) \, nu)^(upright(e x t \, f r)) \( t_nu \)$ for the free-wall
  ratio and $Phi_(upright("pair") \, R_(upright("out")) \, nu)^(upright(e x t \, p i n)) \( t_nu \)$ for the ratio
  with $sans(F)_(R_(upright("out")))$ pinned. Releasing that pin bounds the latter by the former.
  Combining (24), (27), and Lemma 6 shows the following useful uniform statement.
  Given $delta > 0$, first choose $R_(upright("out"))$ sufficiently large,
  then choose a bound $eta > 0$ and $epsilon > 0$ sufficiently small.
  For either boundary choice $star.op in { upright("fr") \, upright("pin") }$ and every sequence $t_nu arrow.r
  t in \( 0 \, eta \]$,

#[#set math.equation(numbering: n => "(29)")
 $ limsup_(nu arrow.r oo)
   lr(|log Phi_(upright("pair") \, R_(upright("out")) \, nu)^(upright("ext") \, star.op) \( t_nu \) + frac(4 pi
   log \( 1 \/ t \), 2 a)|) lt.eq delta . $ <geo:pair-exterior>]

Here one uses $frak(h)_(R_(upright("out"))) arrow.r 0$ and $R_(upright("out"))^(- 2) arrow.r 0$ first,
  then the $O_(R_(upright("out"))) \( t \)$ error. The bound follows for the pinned ratio from its lower trial
  bound and its free upper bound; it asserts no separate pinned sector theorem.
  It is uniform over the stated positive values of $t$ because the energy errors are bounded by
  $C_(R_(upright("out"))) eta + C epsilon$ and $C \( eta + epsilon + R_(upright("out"))^(- 2) \)$.
  For each such value the fixed stair brackets are chosen after its limit has been extracted.

=== 3.4 Cancellation of the microscopic costs <cancellation-of-the-microscopic-costs>

#proof[
  First fix integer sequences $n \, n' arrow.r oo$ with $n' \/ n arrow.r d > 0$.
    Choose a small macroscopic bound $eta$, so nests of outer radius at most $\( 1 + epsilon \) eta
    n$ fit in both squares for all late terms. After fixing the annular parameters, put
  $ J = max { i : 𝜚_i lt.eq eta n } . $
  Then $J arrow.r oo$. Every subsequence has a further subsequence on which $𝜚_J \/ n arrow.r
    t in \[ eta \/ lambda \, eta \]$; in the other square the same physical nest has scaled radius tending to
    $t \/ d$. Both limits are positive with these parameters fixed.
  We check the attachment condition for either square. After joining the last annulus to its exterior,
    the hole radius changes from $t$ to $t \/ lambda$. By (9) and (25), its annular log ratio is $-
    2 pi log lambda \/ \( 2 a \) + O \( epsilon \) + o \( 1 \)$.
    In (28) the two exterior constant terms agree, and the difference of their radius energies is exactly $2 pi
    log lambda$. Thus the leading terms in $log frak(q)_(upright("ext"))^tau$ cancel and its limiting absolute
    error is $O \( epsilon + eta \)$. In the other square the error is $O_d \( epsilon + eta \)$,
    using $t \/ d$ and $t \/ \( d lambda \)$. These bounds hold uniformly for the possible $t$ at large fixed
    $lambda$. The flat-pin interactions can also be made arbitrarily small by choosing $lambda$ large.
    More precisely, for any desired attachment accuracy, choose $epsilon \, eta$ small,
    then $lambda$ large for the flat-pin estimate, and finally the fixed $𝜚_0$ large for (12).
    The inequalities (15) then hold with arbitrarily small $delta$.
  Apply (16) with one nest to each square, using the same $cal(N)_J$. Subtraction cancels this microscopic ratio.
    Formula (28) cancels its regular Green term and gives, up to an arbitrarily small limiting error,
  $ log M_(n') - log M_n = - frac(2 pi, 2 a) log n' / n + o \( 1 \) . $
  The claimed convergence follows because $pi \/ a = 1 \/ 8$.
    For precision, the displayed $o \( 1 \)$ after arbitrary accuracy means the following:
    any subsequence with a fixed positive error would, after choosing that accuracy,
    have a further subsequence with the above limit $t$ and a smaller error. This is impossible.
    The argument proves (7) for the full sequences.
  Taking $n' = 2 n$ and summing logarithms on powers of two gives $log M_(2^i) = - \( i \/ 8 \) log 2 +
    o \( i \)$. The ratios $M_n \/ M_(2^i)$, $2^i lt.eq n < 2^(i + 1)$,
    stay bounded above and below by positive constants for large $i$:
    otherwise a sequence of $n \/ 2^i$ has a convergent subsequence in $\[ 1 \, 2 \]$ contradicting (7).
    This proves $M_n = n^(- 1 \/ 8 + o \( 1 \))$.
  For the bulk comparison, fix an arbitrary small accuracy $delta$.
    Choose $R_(upright("out"))$ large and then $eta \, epsilon$ small so that (29) and (28) have errors as small
    as required in terms of $delta$. Take $eta$ small enough for two disjoint nests about $0 \,
    e_1$ and for the center nest in $D$. Fix $P$, next choose $lambda$ large for the flat-pin interactions,
    and finally choose $𝜚_0$ large for all regular annuli. For $Phi_(R_(upright("out")) \, r)^(upright("fr"))$,
    $Phi_(R_(upright("out")) \, r)^(upright("pin"))$, and $M_r$, use the identical nests of depth $J = max { i :
    𝜚_i lt.eq eta r }$. The connection chosen on the primal source-to-source path restricts to one unit of the
    appropriate sign in each pair nest. Its bare ratio is therefore precisely the same $cal(N)_J$ as the center
    nest’s ratio.
  Along a further subsequence, $𝜚_J \/ r arrow.r t in \[ eta \/ lambda \, eta \]$.
    The pair exterior before and after the last-annulus restoration has radii $t$ and $t \/ lambda$,
    with the same outer wall and, in the lower comparison, the same rim pin. Both are covered by (29).
    The two last annuli are covered by (25). In their joining ratio the leading logarithms cancel exactly:
  $ - frac(4 pi log \( lambda \/ t \), 2 a) + frac(4 pi log \( 1 \/ t \), 2 a) +
    frac(2 \( 2 pi log lambda \), 2 a) = 0 . $
  Its log is at most zero by cut comparison and at least an arbitrarily small negative constant by these exterior
    bounds. This verifies (15) for both pair comparators. The center attachment was already checked.
    The argument with the pinned root following (15) permits its use for
    $Phi_(R_(upright("out")) \, r)^(upright("pin"))$.
  Equations (16), (29), and (28) now give, for either $star.op = upright("fr")$ or $star.op = upright("pin")$,
  $ log Phi_(R_(upright("out")) \, r)^star.op & = 2 log cal(N)_J - frac(4 pi log \( 1 \/ t \), 2 a) +
    O \( delta \) + o \( 1 \) \,\
2 log M_r & = 2 log cal(N)_J - frac(4 pi log \( 1 \/ t \) + 8 pi^2 R_D \( 0 \, 0 \), 2 a) + O \( delta \) +
  o \( 1 \) . $
  The microscopic terms and the radius terms cancel. The same subsequence argument as above makes these bounds
    valid as limiting bounds for the full sequence. Since every quantity is positive, (17) then implies
  $ limsup_(r arrow.r oo) lr(|log frac(C_(b_c) \( r \), M_r^2) - frac(4 pi^2, a) R_D \( 0 \, 0 \)|) lt.eq C delta . $
  The accuracy was arbitrary, so (8) holds with
  #[#set math.equation(numbering: n => "(30)")
   $ c_(upright("shape")) = exp {frac(4 pi^2, a) R_D \( 0 \, 0 \)} in \( 0 \, oo \) . $ <geo:shape-constant>]
  Its finiteness follows from regularity of $R_D$ at the center.
    All mesh limits used a fixed $R_(upright("out")) \, P \, lambda \,
    𝜚_0$ and a positive subsequential radius $t$. The geometric parameters varied only through the final accuracy
    argument, after the thermodynamic limit had already been taken in (17). ◻
]

== 4 A scale-dependent cutoff and entry <sec:entry>

We construct a small local interaction for the critical Bessel heights at a starting side that may increase with
  the size of the square. Away from the magnetic source the construction gives the small activities required by
  the height map. At the source it gives one labelled activity,
  whose norm may grow as a fixed power of the observation-cell side.
  The cutoff that makes these bounds possible has a negligible cost in the finite physical partition functions.

=== 4.1 The averaged interaction and its subset targets <the-averaged-interaction-and-its-subset-targets>

From now on $p = p_(b_c)$, $alpha = sqrt(a)$, and $omega = 2 pi \/ alpha$.
  Let $G$ be a finite retained graph whose primary vertices are partitioned into whole square cells of side $s$;
  the estimates below concern the specified tile and box topologies.
  Let $B_s$ take the average in every retained cell. Introduce independent standard Gaussian noises $e$ and observations

$ y = B_s h + e . $

For prescribed $y$, let $Z_G^tau \( y \)$ include the penalty $exp \( - parallel B_s h - y parallel^2 \/ 2 \)$,
  with every retained observation row. The corresponding unpinned real Gaussian energy is

#[#set math.equation(numbering: n => "(31)")
 $ E_G^tau \( y \) = min_u {a^(- 1) lr(bar.v.double nabla u + tau bar.v.double)_G^2 +
   lr(bar.v.double B_s u - y bar.v.double)^2} . $ <eq:observation-energy>]

On a cut graph the minimum varies every free component constant.
  At fixed $y$, the observation penalty confines those constants in the height sum as well;
  all component translation copies are summed.

We use the reference representation on the connected full graphs:
  a compatible torus in the centered sector, or an aligned free square in its centered or center-unit sector.
  On such a graph choose $v$ so that $eta = nabla v + tau$ is co-closed, including at a free boundary.
  Orthogonality to gradients gives

#[#set math.equation(numbering: n => "(32)")
 $ E_G^tau \( y \) = a^(- 1) lr(bar.v.double eta bar.v.double)_G^2 + E_G^0 \( y - B_s v \) . $ <eq:sector-completion>]

Let $N_(upright(c))$ be the number of observation cells and $cal(Y)_G =
  bb(R)^(N_(upright(c))) \/ \( 2 pi bb(Z) upright(bold(1)) \)$.
  Integrals on this quotient use ambient Lebesgue measure on a fundamental domain.
  Write $Z_G^tau$ without an observation argument for the bare partition sum,
  modulo one common height translation. Summing all height translation copies in $Z_G^tau \( y \)$ and integrating
  their Gaussian penalties gives exactly

$ integral_(cal(Y)_G) Z_G^tau \( y \) thin thin upright(d) y = \( 2 pi \)^(N_(upright(c)) \/ 2) Z_G^tau . $

Let $phi.alt_0$ have covariance $A^(+)$ on the mean-free modes,
  let $theta$ be independent and uniform on $\[ 0 \, omega \)$,
  and let $e$ be independent standard observation noise. Put

$ Y_0 = B_s alpha \( phi.alt_0 + theta upright(bold(1)) \) + e \, wide Y_tau = B_s v + Y_0 . $

Their quotient densities are

$ frac(thin upright(d) mu_G^0, thin upright(d) y) = kappa_G e^(- E_G^0 \( y \) \/ 2) \, wide
  frac(thin upright(d) mu_G^tau, thin upright(d) y) = kappa_G
  e^(- { E_G^tau \( y \) - a^(- 1) parallel eta parallel_G^2 } \/ 2) . $

The same $kappa_G$ includes the common-mean Jacobian and cancels. Consequently the exact reference identity is

#[#set math.equation(numbering: n => "(33)")
 $ Z_G^tau / Z_G^0 = e^(- parallel eta parallel_G^2 \/ \( 2 a \)) frac(bb(E) #h(-0.16667em)
   [e^(E_G^tau \( Y_tau \) \/ 2) Z_G^tau \( Y_tau \)], bb(E) #h(-0.16667em)
   [e^(E_G^0 \( Y_0 \) \/ 2) Z_G^0 \( Y_0 \)]) . $ <eq:noisy-reference>]

The same calculation applies when either observation integrand is multiplied by a function on $cal(Y)_G$ for which
  the integrals are finite, including the cutoff defined below.
  This reference identity uses the connected full graph and its co-closed $v$.
  The cut-graph sums used later instead factor through their confined component observations.

Initialization will be used on compatible tori, in local prescriptions on the plane,
  and on aligned free height squares. The free height grid for $M_n$ has $2
  n$ primary dual vertices on a side and one circulation $2 pi$ at its center.
  Choose a straight primal current path from the center to a side along observation-cell divisions,
  and support $tau$ on the dual bonds crossing that path. Use the same cut direction and grid origins for every
  square. In particular the center is the junction of four observation cells. Let $v_n$ be real vertex values such that

$ eta_n = nabla v_n + tau \, wide chevron.l eta_n \, nabla f chevron.r = 0 quad upright("for every real ") f . $

The latter identity includes the free boundary and characterizes the minimum-energy connection.
  Write $eta_oo$ and $v_oo$ for the corresponding centered plane connection and branch.
  Plane expressions in this section are local prescriptions; there is no infinite-plane sector partition integral.

Here is the exact Gaussian split used in the construction.
  The dyadic ratio $L$ will be fixed in the parameter choice below.
  With the four nearest steps, the notation of [16] Section 8 has $Q = A \/ 4$. For an integral $u gt.eq 1$, put

$ P_u \( cos t \) = (frac(sin \( u t \/ 2 \), u sin \( t \/ 2 \)))^64 \, wide sans(P)_u = P_u \( 1 - A \/ 64 \) . $

The removable values are understood. The split of [16] Equation (9.11), with no independent first piece, is

#[#set math.equation(numbering: n => "(34)")
 $ C_(< u) & = A^(- 1) \( 1 - sans(P)_u \) \,\
Gamma_u & = A^(- 1) \( sans(P)_u - sans(P)_(L u) \) \,\
C_(gt.eq u) & = A^(+) sans(P)_u quad upright("on nonconstant modes") . $ <ent:reference-split>]

The first two quotients use their polynomial continuations at zero.
  They are positive, have ranges $O \( u \)$ and $O \( L u \)$, respectively, and telescope on nonconstant modes.
  Their continued constant modes may be integrated along with the other modes:
  the final common mean is uniform modulo $omega$, so adding an independent Gaussian constant does not change a
  periodic integral. On a free square these operators are the even restrictions of the operators on the doubled torus.

Orient the retained faces between observation cells. If a face $f = \( i \, j \)$ is retained,
  the chosen connection is constant on its microscopic crossing edges; call that value $tau_f$.
  For the observations of (31), set

#[#set math.equation(numbering: n => "(35)")
 $ w_f & = y_j - y_i + tau_f \,\
chi_s \( z \) & =
  frac(integral_(- s)^s exp { - \( z - t \)^2 \/ 2 } thin upright(d) t, integral_(- s)^s exp { - t^2 \/ 2 } thin
  upright(d) t) \,\
hat(Z)_G^tau \( y \) & = Z_G^tau \( y \) product_(f in cal(F) \( G \)) chi_s \( w_f \) . $ <ent:cutoff-definition>]

Here $cal(F) \( G \)$ is the set of retained cell faces. A cut removes its cutoff factor along with its
  microscopic bonds. The function $chi_s$ is entire and even;
  on the real line it lies in $\( 0 \, 1 \]$ and equals one at zero. For $s gt.eq 1$, Gaussian tails give

#[#set math.equation(numbering: n => "(36)")
 $ 1 - chi_s \( x \) & lt.eq C e^(- c s^2) quad \( \| x \| lt.eq s \/ 2 \) \,\
chi_s \( x \) & lt.eq C exp { - 1 / 2 \( \| x \| - s \)^2 } quad \( \| x \| gt.eq s \) . $ <ent:cutoff-tails>]

Fix the connection and collar radii in the block calculus of [16] Section 4.
  At side $u$, a polymer $X$ is a finite collection of blocks connected within that fixed block distance;
  $\| X \|$ denotes its block cardinality. Let $D_u \( X \)$ consist of the sites in the blocks of $X$ and in all
  grid blocks at index distance at most two from $X$, as in [16] Section 4.
  Difference stencils based there remain in a fixed microscopic stencil neighborhood,
  denoted $D_u \( X \)^(+)$ when needed. At the aligned scales used here, block sides are multiples of $s$,
  and the finite grids and clipped end blocks are whole $s$-cell arrays.
  An open energy $E_(D_u \( X \))$ uses the corresponding union of whole observation cells,
  all primary bonds with both endpoints in that union (including intercell bonds),
  and every one of their observation rows; each resulting component constant is free to minimize.
  Compatible polymers have separated collars. For a finite grid $cal(B)_u$, the subset functional is

#[#set math.equation(numbering: n => "(37)")
 $ cal(Z)_u \( K \; phi.alt \) = sum_(V subset cal(B)_u) product_(X in "Comp" \( V \)) K \( X \, phi.alt \) \,
   $ <eq:subset-functional>]

where components use the fixed connection radius and the empty product is one.

At the compatible entry side $m$ selected in (59), define for a graph $cal(G)$ in one of the connected full
  classes just listed the interaction after entry averaging by

#[#set math.equation(numbering: n => "(38)")
 $ cal(H)_(cal(G) \, m)^tau \( psi \) & = bb(E)_(zeta_(< m) \, e)
   [e^(E_(cal(G))^tau \( y \) \/ 2) frac(hat(Z)_(cal(G))^tau \( y \), Z_(cal(G))^0 \( 0 \))]_(thin y = B_s \( v +
   alpha \( psi + zeta_(< m) \) \) + e) \,\
 & #h(18mm)  "Cov" \( zeta_(< m) \) = C_(< m) . $ <ent:averaged-interaction>]

For the centered sector $v = 0$; for a square unit sector $v = v_n$.
  The noises and the Gaussian field are independent. Subsequent integration of $cal(H)_(cal(G) \, m)^tau$ and
  $cal(H)_(cal(G) \, m)^0$ against the remaining covariance $C_(gt.eq m)$ and the uniform common mean gives the
  two expectations in the cutoff version of (33), divided by the same $Z_(cal(G))^0 \( 0 \)$.
  Their ratio therefore represents the cutoff physical sector ratio after multiplication by $exp { -
  parallel eta parallel^2 \/ \( 2 a \) }$, with $eta = eta_n$ in the square unit sector.
  The remaining Gaussian covariance is the same in both sectors.

The construction has an exact algebraic target before any norm is chosen.
  In the centered calculation it will produce a positive field-independent scalar $c_(cal(G) \, m)$ and ordinary
  component activities $K_(cal(G) \, m)^0$ satisfying

#[#set math.equation(numbering: n => "(39)")
 $ cal(H)_(cal(G) \, m)^0 \( psi \) = c_(cal(G) \, m) cal(Z)_m \( K_(cal(G) \, m)^0 \; psi \) . $ <ent:ordinary-subset>]

In the center-unit calculation it will use the same scalar and produce unlabelled component activities
  $K_(cal(G) \, m)^tau$ together with one labelled component $J_(cal(G) \, m)$, so that

#[#set math.equation(numbering: n => "(40)")
 $ cal(H)_(cal(G) \, m)^tau \( psi \) = c_(cal(G) \, m) \[ x \] thin
   cal(Z)_m \( K_(cal(G) \, m)^tau + x J_(cal(G) \, m) \; psi \) . $ <ent:labelled-subset>]

Here $\[ x \]$ selects the coefficient of $x$. The component counted by $J$ contains the compulsory source marker
  and every dependency attached to it; $K^tau$ counts the other components.
  The common scalar cancels between the two sectors of this square.
  Theorem 12 gives the parameter range, makes the ordinary activities small in the norm defined next,
  and permits polynomial growth of the labelled norm. It also identifies the activity prescriptions that copy
  exactly between aligned geometries.

To reach these identities with those bounds, we first obtain a large-field reserve from the cutoff and isolate the
  single circulation cost in the Gaussian energy. The finite expansion then records each component’s complete
  occupied cover. Its real estimate passes from signed differences to positive halo topologies,
  cuts those topologies into bounded pieces, and pays the resulting local Gaussian costs.
  An analytic strip estimate upgrades that real bound to the derivative norm before the connected components are summed.

=== 4.2 The activity norm and the local map <the-activity-norm-and-the-local-map>

The local calculus below uses the exact partition map of [16] Proposition 4.8.
  In a related analytic construction, Bauerschmidt, Park, and Rodriguez begin their high-temperature discrete
  Gaussian analysis with smoothing, then use the successive finite-range Gaussian integrations described by
  Brydges [6] and a localization of the noncontracting terms inspired by Brydges and Slade [7]; see [3] Section 1.5.

The analytic point norm uses all real directional derivatives at a fixed radius $h_0$:

#[#set math.equation(numbering: n => "(41)")
 $ lr(bar.v.double f bar.v.double)_(u \, D) & = max_(x in D) { \| f \( x \) \| \, u \| nabla f \( x \) \| \,
   u^2 \| nabla^2 f \( x \) \| #scale(x: 120%, y: 120%)[}] \,\
\| F \|_(u \, X \, phi.alt) & = sum_(k gt.eq 0) frac(h_0^k, k !)
  sup_(lr(bar.v.double f_i bar.v.double)_(u \, D_u \( X \)) lt.eq 1) \| D^k
  F \( phi.alt \) \[ f_1 \, dots.h \, f_k \] \| . $ <eq:point-norm>]

All fixed difference stencils are included in the padding.
  The ordinary regulator $W_u^kappa \( X \, phi.alt \)$ is the exponential regulator in [16] Equation (4.10):
  it controls the gradient energy on $D_u \( X \)$, its boundary trace, and scaled suprema of second differences.
  At a free side the field is extended evenly. We use exactly that regulator,
  rather than a bound restricted to bounded fields.

Use the accumulated covariance $C_(< u)$ of (34). Above a common absolute side,
  this polynomial split is independent of the chosen entry side.
  Finite-range decompositions by functional calculus have a general antecedent in [2];
  the exact polynomials and boundary conventions here are those of [16].
  For now regard $p_1 \, p_2 \, h_(*)$ as parameters satisfying $1 < p_1 < p_2$ and $0 < h_(*) < 1 \/ p_2$.
  They will be fixed with the strict reserve supplied by (57). With $D = D_u \( X \)$, put

#[#set math.equation(numbering: n => "(42)")
 $ V_u \( X \, phi.alt \) = 1 / 2 sup_(zeta \, e) {h_(*) E_D^0 #scale(x: 120%, y: 120%)[\(] B_s
   alpha \( phi.alt + zeta \) + e #scale(x: 120%, y: 120%)[\)] -
   p_1^(- 1) #scale(x: 120%, y: 120%)[\(] parallel zeta parallel_(C_(< u))^2 +
   parallel e parallel^2 #scale(x: 120%, y: 120%)[\)]} \, $ <eq:observation-regulator>]

where $parallel zeta parallel_(C_(< u))$ is the Cameron norm on the Gaussian Hilbert space,
  including when the covariance is singular. The full norm is

#[#set math.equation(numbering: n => "(43)")
 $ lr(bar.v.double F bar.v.double)_(u \, A_w \, V) = sup_(X \, phi.alt) A_w^(\| X \|)
   frac(\| F \|_(u \, X \, phi.alt), W_u^kappa \( X \, phi.alt \) e^(V_u \( X \, phi.alt \))) . $ <eq:activity-norm>]

When $u = L^j$, we also write $V_j = V_(L^j)$, with $j$ the absolute block index.
  The block weight $A_w$ is distinct from the Laplacian $A$.

The following precise features of the cited calculus will be used.
  They are analytic statements about activity functions and do not assume that the functions came from a discrete
  Gaussian height model.

#thm([Proposition 4.1.])[
  (Local map input).  #emph[Assume every activity has period $omega$ under common field translations,
    and its field dependence lies in the sites of its occupied support $X$ together with a fixed microscopic
    collar of width at most a fixed small fraction of $u$. The norm padding $D_u \( X \)$ is generally larger.
    Call an input small when its connected support has $\| X \| lt.eq n_(upright("sm"))$,
    for the fixed block threshold of the calculus. For a linear direction assume the point bound
$ \| F \|_(u \, X \, phi.alt) lt.eq nu_X W_u^kappa \( X \, phi.alt \) e^(V_u \( X \, phi.alt \)) wide
  upright("for every real ") phi.alt \, $

 with $nu_X < oo$; the resulting estimates are homogeneous in $nu_X$.]
  #emph[For a sufficiently large fixed dyadic $L$, sufficiently large weights $A_w$,
    and a sufficiently small activity ball, shell integration and designated localizations on small linear inputs
    give the exact identity
#[#set math.equation(numbering: n => "(44)")
 $ bb(E)_zeta cal(Z)_u \( K \; phi.alt + zeta \) = product_(B in cal(B)_(L u)) \( 1 + a_B \) thin
   cal(Z)_(L u) \( K' \; phi.alt \) . $ <eq:exact-local-map>]

 The map is analytic in the activities. If the total input size,
   including separately measured singleton coefficients, is $nu$,
   its nonlinear remainder is bounded by $C_(L \, A_w) nu^2$, with the corresponding differentiated bounds.
   A residual from a large input retains its whole coarse closure;
   only a piece from a small linear input can be assigned to a singleton.
   The coefficient $a_B$ is the complete sum of the field-independent pieces designated at $B$.
   Any undesignated constant value of a translated nonconstant piece remains in $K'$.]
  #emph[Write $Gamma_u = C_(< L u) - C_(< u)$ for the shell from $u$ to $L u$.
    For its estimates on the aligned block and observation grids of a finite square or torus of side $M$,
    assume $L u lt.eq M \/ D_0$, with $D_0$ a sufficiently large fixed range buffer.
    The norms (41)–(43) have the shell composition, localization, charge,
    and large-support contractions of [16] Sections 4 and 8, Lemma 9.2.
    In particular, the extra regulator is monotone under enlargement, adds on compatible separated supports,
    and costs $C^(\| X \|)$ under shell averaging. On the full bulk block grid,
    a small neutral input invariant under field negation has gain $C
    L^(- 3)$ after constant and quadratic localization. Removing only the constant gives $C
    L^(- 2)$ for a neutral input invariant under field negation and $C L^(- 1)$ for a general neutral input,
    including at irregular end blocks. For a charge-$k$ component of a small input, $k eq.not 0$,
    the Gaussian charge gain is
$ exp {- #scale(x: 120%, y: 120%)[\(] beta_(upright("sh")) \| k \| alpha - 1 /
  2 beta_(upright("sh"))^2 #scale(x: 120%, y: 120%)[\)] Gamma_u \( v_0 \, v_0 \) + h_0 \| k \| alpha} . $

 Here a charge-$k$ component obeys $F \( phi.alt + c \) = e^(i k alpha c) F \( phi.alt \)$,
   $v_0$ is a reference site in a block of $X$, and $beta_(upright("sh")) > 0$ is the Cameron-shift amplitude.
   The analytic radius must satisfy $h_0 > C_(upright("sh")) beta_(upright("sh"))$,
   where $C_(upright("sh"))$ is the fixed geometric constant for that shift,
   and the parameters are chosen so that $beta_(upright("sh")) Gamma_u \( v_0 \, v_0 \) >
   h_0$ by a uniform fixed margin. The displayed gains are then summable over $k eq.not 0$.
   This is [16] Equation (4.26). Large inputs can be made an arbitrarily small linear contribution by increasing $A_w$.]
] <prop:local-map>

#proof[
  The exact identity and support assertions are [16] Proposition 4.8.
    Its proof first groups compatible inputs by coarse closure,
    then relocates chosen pieces from small linear inputs, retaining their exclusion data,
    and finally multiplies by $\( 1 + a_B \)^(- 1)$ through constant decorations.
    Thus it permits the designated constants in the statement.
    Its convergent multilinear and scalar-inverse series give the analytic bounds.
    The gains are the localizations in [16] Section 4. The observation regulator is [16] Lemma 9.2;
    its fundamental estimate is contraction of the open observation energy by the restricted Gaussian covariance.
    The later free-wall, marked, and growing-terminal-grid uses require the additional verifications given in
    Sections 4 and 6. ◻
]

On a regular block $B$ of side $u$, the two retained bulk singletons are

#[#set math.equation(numbering: n => "(45)")
 $ e_B^0 \( phi.alt \) = 1 / 2 sum_(x in B) sum_(e = plus.minus e_1 \, plus.minus e_2) \| nabla_e
   phi.alt \( x \) \|^2 \, wide c_B^alpha \( phi.alt \) = u^(- 2) sum_(x in B) cos \( alpha phi.alt_x \) .
   $ <eq:singletons>]

Summing $e_B^0$ over the blocks gives the reference energy.
  The weak map of [16] Proposition 8.3 retains $t e_B^0 \/ 2 + z c_B^alpha$;
  Section 5 states its normal coordinates and the estimates used here.

=== 4.3 Reference and cutoff estimates <reference-and-cutoff-estimates>

The source background controls the deterministic cost of translating the reference field.
  The reflected covariance bounds and the prescribed-observation cutoff bound then provide the reserves used at entry.

#thm([Lemma 4.2.])[
  (The centered unit background).  #emph[The branches can be chosen bounded, with a consistent additive constant,
    and for $0 lt.eq r lt.eq 4$ they satisfy, in lattice units,
#[#set math.equation(numbering: n => "(46)")
 $ \| nabla^r eta_n \( e \) \| & lt.eq C_r \( 1 + "dist" \( e \, 0 \) \)^(- 1 - r) \,\
\| nabla^r \( eta_n - eta_oo \) \( e \) \| & lt.eq C_r n^(- 1 - r) wide
  #scale(x: 120%, y: 120%)[\(] "dist" \( e \, 0 \) lt.eq c_0 n #scale(x: 120%, y: 120%)[\)] \, $ <ent:unit-decay>]

 where $c_0 > 0$ is fixed and sufficiently small. The first bound also holds for $eta_oo$.
   Differences at a free side use the reflected stencils of the local calculus.
   On a source-free rectangle with its required collar, there is a single-valued real lift $lambda$ in
   reference-field units satisfying
$ nabla lambda = eta_n \/ alpha . $

 Changing the integral gauge changes this lift by an integer multiple of the common period $omega = 2 pi \/ alpha$.]
] <ent:center-background>

#proof[
  The connection is $2 pi$ times the rotated gradient of the primal Dirichlet Green function with pole at the
    center. Rotation makes it co-closed on the free dual square and gives the prescribed circulation.
    The differentiated Green estimates of [16] Lemma 4.2 give the first bound.
    For the second, use the binary finite-range decomposition in the proof of that lemma.
    In the indicated central region all pieces below a fixed multiple of $n$ agree exactly with their plane
    pieces. A piece of side $t$ contributes at most $C_r t^(- 1 - r)$ to the differentiated rotated gradient;
    the remaining dyadic tail is at most $C_r n^(- 1 - r)$. Odd reflection of the primal potential gives the
    stated free reflected convention for its rotated lift.
  The circulation vanishes on a source-free rectangle, so path integration there gives $lambda$;
    the integral gauge accounts for its period ambiguity. A bounded branch for one centered source can be seen
    directly from the first bound. By reflection, choose its value constant on a reflection ray,
    or centered between the two rows adjacent to that ray. On a square ring of radius $t$,
    the number of increments is $O \( t \)$, while their sizes are $O \( \( 1 + t \)^(- 1) \)$.
    Integration from the ray around each ring is therefore bounded uniformly in $t$.
    The finitely many increments at the source are bounded as well.
    Use the same ray and additive convention in the square and in the plane. ◻
]

#thm([Lemma 4.3.])[
  (Reflected and accumulated regulator bounds).  #emph[At these compatible block and observation sides,
    with strict reserve in the parameters of (42), the shell composition, localization,
    and charge estimates in Proposition 7 apply to $Gamma_u$ in (34) on an aligned free square of side $M$ when $L
    u lt.eq M \/ D_0$, with $D_0$ fixed and sufficiently large, using only internal faces in every open energy.
    The accumulated covariance $C_(< u)$ has the finite-range and open-observation contraction bounds used in
    $V_u$ and the localized entry determinant.]
] <ent:entry-regulator>

#proof[
  The reference part of this assertion is the proof of [16] Lemma 9.2 and Lemma 4.1.
    Restricting one trial field to all components of an open union can only lower its minimized observation
    energy; each component may minimize its constant separately.
    Thus the map from the Gaussian Hilbert coordinates of any accumulated pieces and the noise into that energy
    has operator norm at most one. This is the covariance contraction used to optimize $V_u$.
    The same trial restriction uses just internal faces at a free side.
    Under $L u lt.eq M \/ D_0$, even reflection gives the positive-order bounds for $Gamma_u$ there, so the trace,
    Hölder, and small-support Taylor arguments in that proof apply with the same strict parameter margins. ◻
]

#thm([Lemma 4.4.])[
  (Physical and prescribed-observation bounds).  #emph[There are $c > 0$ and $s_1 < oo$,
    independent of the finite cell topology, such that for every $s gt.eq s_1$, every cut topology used below,
    and its centered sector or the restriction of the aligned unit sector,
#[#set math.equation(numbering: n => "(47)")
 $ frac(hat(Z)_G^tau \( y \), Z_G^0 \( 0 \)) lt.eq exp {- c sum_(f in cal(F) \( G \)) w_f^2}
   wide \( y upright(" real") \) . $ <ent:pointwise-cutoff>]

]
  #emph[For a connected full finite graph, let $cal(P)_G^tau \( F \)$ denote the integral of $F \( y \)
    Z_G^tau \( y \)$ on the observation space modulo $y mapsto y + 2 pi k upright(bold(1))$, $k in bb(Z)$,
    and let $hat(cal(P))_G^tau \( F \)$ use $hat(Z)_G^tau$. For the centered sector take either a uniformly
    bounded function $F$ on this quotient, or $F = ell \( y \)^k
    e^(t ell \( y \))$ times a uniformly bounded function on the quotient,
    where $k$ is a fixed nonnegative integer, $t$ is in a fixed compact subset of $bb(R)$,
    and the mean-free linear observation $ell$ has uniformly bounded primary reference cost and noise variance.
    For the square unit sector take $F = 1$. Then
#[#set math.equation(numbering: n => "(48)")
 $ frac(lr(|cal(P)_G^tau \( F \) - hat(cal(P))_G^tau \( F \)|), cal(P)_G^0 \( 1 \)) lt.eq
   C_F \| cal(F) \( G \) \| e^(- c s^2) . $ <ent:cutoff-loss>]

 In particular, if the logarithm of the side is $O \( N \)$ and $s asymp N$,
   this bound is at most $e^(- c' N^2)$ for some $c' > 0$. The same conclusion holds for the difference of
   normalized centered averages of the stated tests.]
] <ent:cutoff-bounds>

#proof[
  For adjacent cells $i \, j$, transport each site in $i$ straight along its row to its translate in $j$,
    and average these paths. This writes the difference of the two cell averages, with its connection value, as
  $ \( B_s h \)_j - \( B_s h \)_i + tau_f = sum_e Phi_f \( e \) \( nabla_e h + tau_e \) . $
  The flow $Phi_f$ is supported on the two cells, has coefficients at most $C \/ s$,
    and has squared coefficient sum at most $C$. Indeed each of the $s^2$ paths has weight $s^(- 2)$ and length
    $s$, and any primary edge belongs to at most $s$ of them.
    There is bounded overlap among the flows for incident faces. Consequently
  #[#set math.equation(numbering: n => "(49)")
   $ max_e lr(|sum_f t_f Phi_f \( e \)|) lt.eq C s^(- 1) max_f \| t_f \| \, wide
     sum_e lr(|sum_f t_f Phi_f \( e \)|)^2 lt.eq C sum_f t_f^2 . $ <ent:cell-flow>]
  The noise part $sum_f t_f \( e_j - e_i \)$ has variance at most $C sum_f t_f^2$.
  Fix any $k_0 < oo$. The tilted affine comparison of Proposition 3,
    followed by release to independent primary increments, therefore gives
  #[#set math.equation(numbering: n => "(50)")
   $ e^(sum_f t_f w_f) frac(Z_G^tau \( y \), Z_G^0 \( 0 \)) lt.eq exp { C_(k_0) sum_f t_f^2 } \, wide
     max_f \| t_f \| lt.eq k_0 s . $ <ent:face-tilt>]
  Here is how to apply the comparison at a prescribed continuous observation.
    On the chain subdivision in the proof of that proposition use the height and noise coordinates $\( h \, e \)$,
    with the affine equality $e = y - B_s h$. The statistic before releasing this equality is $sum_f
    t_f \[ \( B_s h \)_j - \( B_s h \)_i + tau_f + e_j - e_i \]$; its value on the equality is $sum_f t_f w_f$.
    Release the equalities, then the endpoint, curl, and period constraints,
    always with centered division and this same affine statistic.
    Constants may first be given a vanishing auxiliary mass; the statistic annihilates them and their Gaussian
    copy factors cancel. The independent primary transform is $exp { b_c \( cosh \( 2 pi x \) - 1 \) }$.
    By (49) its arguments are in a fixed bounded interval, where its logarithm is at most $C x^2$.
    The independent noise gives the stated quadratic cost. Passing to the limit at the fixed primary graph proves
    (50). This argument does not use the bare Gaussian variance of the subdivided chains.
  Choose $t_f = delta thin "sgn" \( w_f \) min \( \| w_f \| \, s \)$,
    with $delta > 0$ small compared with the constant in (50).
    Its exponent gives a negative multiple of $w_f^2$ for $\| w_f \| lt.eq 2 s$,
    and a negative multiple of $s \| w_f \|$ beyond that range.
    On the latter faces use the second bound in (36), for which $\( \| w_f \| - s \)^2 gt.eq w_f^2 \/ 4$.
    The bounded prefactors are absorbed by the $s \| w_f \|$ gain once $s gt.eq s_1$.
    On all other faces $chi_s lt.eq 1$. Multiplication gives (47).
  The same release argument before prescribing observations gives the integral version of (50),
    with $cal(P)_G^0 \( 1 \)$ as denominator. Chernoff’s inequality with $\|
    t_f \|$ a small multiple of $s$ bounds the centered-normalized integral of $1_({ \| w_f \| > s \/ 2 })$ by $C
    e^(- c s^2)$, in either sector. On its complement the first bound in (36) applies. Since
  $ 1 - product_f chi_s \( w_f \) lt.eq sum_f \( 1 - chi_s \( w_f \) \) \, $
  this proves (48) for bounded tests and for the unit partition integral.
    For a centered fixed Laplace tilt and its fixed polynomial factors,
    Hölder and the reference-cost exponential bound of Proposition 3 give the same estimate with a smaller $c$;
    the noise variance is included in its cost. The number of faces in a side-$M$ graph is
    $O \( \( M \/ s \)^2 \)$. Thus $log M = O \( N \)$ and $s asymp N$ turn the right side into $e^(- c' N^2)$.
    Finally the centered cutoff partition integral is $1 + O \( \| cal(F) \( G \) \| e^(- c s^2) \)$ times its
    uncut value. Dividing the two centered averages proves the last assertion. ◻
]

=== 4.4 Localizing the energy in face variables <localizing-the-energy-in-face-variables>

The Gaussian proxy in the isolation expansion must still be local when its face values carry the unit circulation.
  A comparison matrix written only in the values $y_i$ does not expose this point.
  We therefore extend the observation minimum to independent real face data.

The entry family in this subsection consists of the free retained graphs produced by the finite tile isolation and
  box cuts below, together with their current patch restrictions.
  Every present observation face is wholly retained or wholly cut, and every present observation row is retained.
  Natural clipped walls and lifted periodic charts are allowed as in that construction.
  A current patch inherits all earlier cuts. Temporary hard primary guards belong only to the finite comparisons
  and are not members of this free-energy family.

Regard the primary sites in each cell as a separate set, joining them only across retained faces.
  If $w in bb(R)^(cal(F) \( G \))$, write $nabla_G^w xi$ for the ordinary difference inside a cell and for $xi_j -
  xi_i + w_f$ on a microscopic edge crossing the oriented face $f = \( i \, j \)$. Define

$ cal(Q)_G \( w \) = min_xi {a^(- 1) parallel nabla_G^w xi parallel^2 + sum_i \| \( B_s xi \)_i \|^2} . $

For physical $w_f = y_j - y_i + tau_f$, the substitution $xi \|_i = u \|_i - y_i$ proves $cal(Q)_G \( w \) =
  E_G^tau \( y \)$. If all four faces incident to a cell vertex $z$ are retained,
  let $sigma_z \( w \)$ be their oriented sum around $z$. There is no such variable at a junction with a cut face.
  Denote the set of full junctions by $cal(V)_4 \( G \)$.

#thm([Lemma 4.5.])[
  (Face energy and changes at cuts).  #emph[For the entry family just described, there is a number $D_s$,
    the same at every full junction, and a symmetric matrix $H_G$ such that
#[#set math.equation(numbering: n => "(51)")
 $ cal(Q)_G \( w \) = D_s sum_(z in cal(V)_4 \( G \)) sigma_z \( w \)^2 +
   sum_(f \, f' in cal(F) \( G \)) H_G \( f \, f' \) w_f w_(f') \, wide 0 lt.eq D_s lt.eq
   C log \( 2 + s \) . $ <ent:face-decomposition>]

 The second matrix need not be positive. In cell distances it has the bounds
#[#set math.equation(numbering: n => "(52)")
 $ \| H_G \( f \, f' \) \| & lt.eq C e^(- c thin d \( f \, f' \)) \,\
\| H_G \( f \, f' \) - H_(tilde(G)) \( f \, f' \) \| & lt.eq C min {e^(- c thin d \( f \, f' \)) \,
  e^(- c thin d \( { f \, f' } \, cal(D) \))} . $ <ent:face-matrix-bounds>]

 In the second line $cal(D)$ contains the cells and faces where the two topologies or their local boundary rules
   differ, enlarged by the fixed stencil radius of the local trial, forcing,
   and constant quadratic coefficients used below. Extend absent entries by zero on the oriented face set of one
   common uncut inclusion $U$, and measure all distances there. The two decays can be combined after decreasing $c$.]
  #emph[For the guarded comparison, let $E$ be the same still-retained local deletion in the current full graph
    and its current patch:
$ G_1 = G_0 \\ E \, wide P_0 = G_0 \|_O \, wide P_1 = G_1 \|_O = P_0 \\ E . $

 These four graphs belong to the stated tile and box family.
   The patch restrictions inherit every earlier cut and every retained observation row and local rule in $O$;
   their only new free wall is at the artificial boundary of $O$. On the common face set define
$ Delta = \( H_(G_0) - H_(G_1) \) - \( H_(P_0) - H_(P_1) \) . $

 Let $K_Delta$ contain both before/after discrepancy sets and let $A_Delta$ contain both full/patch discrepancy
   sets, including all absent exterior cells and faces and the artificial-boundary collar.
   Enlarge both by the same fixed stencil radius. If $d_U \( K_Delta \, A_Delta \) gt.eq r$, then
#[#set math.equation(numbering: n => "(53)")
 $ \| Delta \( f \, f' \) \| lt.eq
   C e^(- c r - c thin d_U \( f \, f' \) - c thin d_U \( { f \, f' } \, K_Delta \)) . $ <ent:guarded-face-error>]

 Shared physical free walls and earlier cuts are common data and do not belong to $A_Delta$.
   Temporary hard primary guards are not among these four free-energy graphs.
   All constants are independent of $s$ and of the containing finite volume.
   For the physical centered or unit data this also gives
#[#set math.equation(numbering: n => "(54)")
 $ E_G^tau \( y \) lt.eq C sum_(f in cal(F) \( G \)) w_f^2 +
   C thin 1_({ upright("unit junction is full in ") G }) log \( 2 + s \) . $ <ent:face-energy-upper>]

]
] <ent:face-localization>

#proof[
  We first give a fixed local trial field linear in $w$. Use cell units and one rooted coordinate and orientation
    convention, also in lifted periodic charts. Fix zero plateaus in the middle of the cells,
    one local cell and quadrant triangulation, and nested junction squares with half-side radii
  $ 0 < rho_0 < rho_1 < rho_2 < 1 \/ 4 . $
  On an oriented retained face $f : i arrow.r j$, prescribe the two central face traces $+
    w_f \/ 2$ in cell $i$ and $- w_f \/ 2$ in cell $j$. Their compensated jump is zero.
    A cut side has an independent zero trace.
  At a junction, the retained incidence mask is a subgraph of the four-cycle.
    If the junction is not full, this graph is a forest. On each connected sector choose the unique mean-zero
    potential $c_z$ with $d c_z = w$ on its retained oriented faces, and set the inner cell values to $- c_z$.
    For an isolated cell set $c_z = 0$. These values have $d xi + w = 0$ on the inner retained edges.
  At a full junction put $sigma = sigma_z \( w \)$, orient its faces cyclically, and write
  $ w = w^(upright("grad")) + w^(upright("circ")) \, wide w_e^(upright("circ")) = sigma \/ 4 \, wide d c_z =
    w^(upright("grad")) \, $
  with $c_z$ again mean-zero. Normalize the fixed plane angular branch of Lemma 8 to circulation one:
  $ eta^(upright("ang")) = nabla v^(upright("ang")) + tau^(upright("ang")) \, wide
    sum_(upright("cycle")) tau_e^(upright("ang")) = 1 . $
  Use the same ray and additive convention at every junction.
    The four spoke jumps $tau^(upright("ang")) - \( 1 \/ 4 \, 1 \/ 4 \, 1 \/ 4 \, 1 \/ 4 \)$ have zero cycle sum.
    Let $k_z$ be the mean-zero quadrant potential satisfying
  $ d k_z = tau^(upright("ang")) - \( 1 \/ 4 \, 1 \/ 4 \, 1 \/ 4 \, 1 \/ 4 \) . $
  The inner field in quadrant $i$ is
  $ xi^(upright("in")) \( x \) = - c_z \( i \) + sigma #scale(x: 120%, y: 120%)[\(] v^(upright("ang")) \( x \) +
    k_z \( i \) #scale(x: 120%, y: 120%)[\)] . $
  It satisfies the exact compensated identity
  $ nabla_G^w xi^(upright("in")) = sigma eta^(upright("ang")) $
  on the inner edges. This identity fixes the sign of the chart changes.
    All choices are real and linear in the incident $w$.
  In each quadrant ring, use the fixed affine triangulation to extend its two constant spoke traces,
    putting their mean at the inner and outer diagonal nodes.
    Call this bounded outer field $xi^(upright("out"))$, and retain $xi^(upright("in"))$ for the inner field.
    Blend them with one geometric cutoff $chi$ on both sides of every retained spoke,
    equal to one through $rho_1$ and zero at $rho_2$. For an oriented microscopic edge $x arrow.r y$, with $w_e =
    0$ inside a cell and $w_e = w_f$ across a retained face, the exact product rule is
  $ d \[ chi xi^(upright("in")) + \( 1 - chi \) xi^(upright("out")) \]_e +
    w_e =  & chi_x \( d xi_e^(upright("in")) + w_e \)\
 &  + \( 1 - chi_x \) \( d xi_e^(upright("out")) + w_e \)\
 &  + \( d chi \)_e \( xi_y^(upright("in")) - xi_y^(upright("out")) \) . $
  On this fixed ring both compensated differences on the right are $O \( s^(- 1) sum \| w_f \| \)$,
    $\| d chi \| lt.eq C \/ s$, and $xi^(upright("in")) - xi^(upright("out"))$ is a bounded linear combination of
    the incident face values. Thus all ring increments have the same $O \( s^(- 1) sum \| w_f \| \)$ bound,
    including the crossing edges. The remaining cell triangulation joins the outer traces and the central face
    traces to the zero plateau. Since $rho_2 < 1 \/ 4$, neighboring endpoint rings are disjoint,
    and their intervening face segment uses the same prescribed trace.
    The cell averages are bounded linear combinations of the local face values.
    Sampling these prescriptions on the lattice gives the trial field on every mask in the entry family,
    including clipped masks. A fixed dihedral average may enforce square symmetry while retaining the common inner
    convention.
  Use the complete symmetric edge set of the inner square of half-side $rho_0$,
    with one fixed boundary-edge convention, and keep the pure angular profile through $rho_1$. Put
  $ D_s = a^(- 1) parallel eta^(upright("ang")) parallel_(upright("inner"))^2 . $
  The plane bound in Lemma 8 gives $0 lt.eq D_s lt.eq C log \( 2 + s \)$,
    and the chosen inner set makes $D_s$ identical at every full junction.
    The gradient part has zero compensated increment on that set.
    Its complement in the pure angular region is at distance at least $c s$ from the junction.
    The remaining trial increments are $O \( s^(- 1) \)$ times local face values on $O \( s^2 \)$ edges per fixed
    stencil, and the cell averages are bounded. Hence all their quadratic coefficients are bounded and have finite
    cell range. The trial already proves
  $ cal(Q)_G \( w \) lt.eq D_s sum_z sigma_z \( w \)^2 + C sum_f w_f^2 . $
  We also need locality after minimization. The quadratic form for a correction to the trial is
  $ T_G = A_G \/ a + B_s^(*) B_s . $
  It is coercive with constants independent of refinement. In fact cell Poincaré gives, for every complete cell $Q$,
  #[#set math.equation(numbering: n => "(55)")
   $ s^(- 2) sum_(x in Q) \| xi_x \|^2 lt.eq C {a^(- 1) sum_(e subset Q) \| nabla_e
     xi \|^2 + \| \( B_s xi \)_Q \|^2} . $ <ent:cell-coercivity>]
  Write $u_G^(upright("tr")) \( w \)$ for the trial just constructed and $C_G \( w \)$ for its energy.
    Expanding that energy after adding a correction $xi$ gives
  $ chevron.l xi \, T_G xi chevron.r + 2 F_G \( w \) \( xi \) + C_G \( w \) . $
  Define its edge and observation coefficient arrays by
  $ r_(G \, f) = partial_(w_f) #scale(x: 120%, y: 120%)[\(] nabla_G^w u_G^(upright("tr")) \( w \)
    #scale(x: 120%, y: 120%)[\)] \, wide b_(G \, f) = B_s partial_(w_f) u_G^(upright("tr")) \( w \) . $
  Then $F_G \( w \) = sum_f w_f F_(G \, f)$, with
  $ F_(G \, f) \( xi \) = a^(- 1) sum_e r_(G \, f) \( e \) nabla_e xi + sum_Q b_(G \, f) \( Q \) \( B_s xi \)_Q . $
  A face affects only its two endpoint templates and the incident cell interpolations.
    Include this fixed decision neighborhood in the forcing and discrepancy stencil.
    Whenever the rooted retained mask, alignment, and local boundary rule agree there, the arrays $r_(G \, f) \,
    b_(G \, f)$ agree exactly. Each functional has that fixed cell stencil and satisfies
  $ \| F_(G \, f) \( xi \) \| lt.eq C parallel xi parallel_(T_G \, upright("stencil")) . $
  For the inner angular part this bound uses co-closure, and this use is essential.
    Choose a cutoff equal to one on its inner square and supported inside the angular prescription.
    The pairing of the compensated angular gradient with the gradient of the cutoff test vanishes by discrete
    co-closure. The remaining product terms lie on the ring, where the angular increments and cutoff differences
    are $O \( s^(- 1) \)$. Cauchy–Schwarz and (55) bound them by the displayed local form norm.
    The observation residuals obey the same bound. Thus the logarithmic inner energy has left no logarithm in the
    dual norm of the forcing. Likewise $C_G \( w \) - D_s sum_z
    sigma_z \( w \)^2$ has bounded finite-range coefficients.
  Minimization now gives
  $ cal(Q)_G \( w \) = C_G \( w \) - chevron.l F_G \( w \) \, T_G^(- 1) F_G \( w \) chevron.r . $
  The inverse in this formula has exponential energy locality for these bounded local functionals.
    To check this directly, let $T_G u = F_(G \, f)$ and test the equation away from its stencil by $chi^2 u$,
    where $chi$ changes over a fixed number of cells and $\| nabla chi \| lt.eq C \/ s$.
    Discrete product differences and Cauchy–Schwarz absorb the outer gradient energy.
    The transition terms are bounded by $s^(- 2) sum \| u \|^2$ on a fixed enlargement of the layer,
    hence by its local energy by (55). Cells in which $chi$ is constant give a nonnegative observation term;
    the observation cross terms in transition cells obey the same local bound.
    The outer energy is consequently at most a fixed constant times the layer energy.
    Increasing the layer by a fixed width reduces the remaining tail by a fixed factor less than one.
    Iteration proves exponential decay. This is the cell-cutoff proof underlying [16] Proposition 3.14,
    now applied to the local face functionals just constructed.
    It uses only retained bonds and whole cells, so it is valid up to a free side.
  For completeness, the same argument compares two topologies.
    Suppose they agree out to cell distance $D$ from a forcing stencil.
    Cut its solution to zero at distance of order $D \/ 2$ inside the agreeing region.
    Its change in the first form norm is $C e^(- c D)$. In the second topology its residual equation has the same
    bound in dual norm: test after multiplication by a second cutoff equal to one on the needed stencils and
    supported in the agreeing region. Multiplication by that cutoff is bounded in local form norm by (55).
    Coercivity in the second topology bounds the difference from its solution by $C e^(- c D)$.
    Pair with another local forcing in the agreeing region. This proves the cut-distance part of (52);
    direct solution-tail decay proves its face-distance part. Entries next to a changed face are bounded directly.
    Taking the geometric mean combines the two bounds with smaller exponents.
  For the four graphs in the guarded comparison, put
  $ a = d_U \( { f \, f' } \, K_Delta \) \, wide b = d_U \( f \, f' \) \, wide h = d_U \( { f \, f' } \, A_Delta \) . $
  Apply (52) first to the two before/after differences and then to the two full/patch differences.
    Together with the pair-distance bound, these give the three global estimates
  $ \| Delta \| lt.eq C e^(- c a) \, wide \| Delta \| lt.eq C e^(- c b) \, wide \| Delta \| lt.eq C e^(- c h) . $
  These statements include absent entries. If a face is absent from a patch, it lies in $A_Delta$, so $h = 0$;
    the pair estimate still controls a pair crossing the patch boundary.
    Choose from ${ f \, f' }$ an endpoint nearest $K_Delta$ and one nearest $A_Delta$.
    The triangle inequality gives $r lt.eq a + b + h$, hence $2 a + 2 b + h gt.eq r + a + b$.
    The weighted geometric mean with weights $2 \/ 5 \, 2 \/ 5 \, 1 \/ 5$ now yields
  $ \| Delta \| lt.eq C e^(- c \( 2 a + 2 b + h \) \/ 5) lt.eq C e^(- c' \( r + a + b \)) \, $
  which is (53) after decreasing $c$. Disconnected inclusion components are direct sums.
    The retained core-distance decay makes summation over deletion positions harmless,
    since cell balls have polynomial volume.
  For physical face data, the oriented sum of the $y$-differences around a full junction is zero.
    The connection has zero circulation except for $2 pi$ at the unit.
    Inserting this in the trial upper bound proves (54). ◻
]

The separated term in (51) is deterministic in every Gaussian integration here. Indeed, if $y = y^0 + B_s v_n$, then

#[#set math.equation(numbering: n => "(56)")
 $ sigma_z #scale(x: 120%, y: 120%)[\(] nabla_(upright(c)) y^0 + nabla_(upright(c)) B_s v_n +
   tau #scale(x: 120%, y: 120%)[\)] = sigma_z \( tau \) \, $ <ent:fixed-circulation>]

where $\( nabla_(upright(c)) y \)_f = y_j - y_i$. It is zero or the fixed number $2 pi$.
  Tile deletions preserve the source junction, so this term cancels exactly in their before-minus-after proxy
  differences. An auxiliary seam used for a bound can remove the junction,
  at a cost $O \( log \( 2 + s \) \)$ once at the source. In (56) neither the high Gaussian field nor the
  observation noise is present on the right. The term therefore has zero Hessian in their coordinates and creates
  no Gaussian determinant. Imaginary field translations have gradient face data as well,
  so the same observation applies to them.

=== 4.5 The initialization statement <the-initialization-statement>

Combining (47) with (54), and decreasing a fixed $c_(*) > 0$ if necessary, gives the large-field reserve

#[#set math.equation(numbering: n => "(57)")
 $ e^(E_G^tau \( y \) \/ 2) frac(hat(Z)_G^tau \( y \), Z_G^0 \( 0 \)) lt.eq
   exp {frac(1 - c_(*), 2) E_G^tau \( y \) + C thin 1_({ upright("unit junction is full in ") G })
   log \( 2 + s \)} . $ <ent:large-field-reserve>]

Indeed the upper bound for $E_G^tau$ bounds a fixed positive multiple of that energy by the face-square sum plus
  the displayed unit term. We may and do take $0 < c_(*) < 1$.
  This is the reserve that replaces the bare discrete-Gaussian large-field estimate in the entry proof of [16].

We specify the parameter order. First fix the interaction, connection, and collar radii of the local calculus,
  and the ordinary regulator parameters with the exponent reserves needed for Hölder. Choose

#[#set math.equation(numbering: n => "(58)")
 $ 1 - c_(*) < h_1 < h_(*) < 1 \/ p_2 \, wide 1 < p_1 < p_2 \, $ <ent:reserve-order>]

leaving room to increase $h_(*)$ and the ordinary regulator exponent slightly.
  These choices are possible because $c_(*) > 0$, and they are made before $R$ or $s$.
  Fix the analytic derivative radius and imaginary strip widths needed for the marginal fundamental frequency
  $alpha = sqrt(8 pi)$, then a sufficiently large fixed dyadic $L$, then sufficiently large block weights $A_w$,
  and finally a sufficiently small activity ball, in the order of [16] Sections 4 and 8.
  We may fix a finite number of such weights and regulators at once.
  In particular we keep an ordinary unmarked weight stronger than the weight used after translating activities by
  a source lift.

Next fix a dyadic coloring period $q$ as in the finite isolation expansion of [16] Section 9.
  Choose $q$ larger than a fixed multiple of the physical proximity, core, open-proxy, guard, testing,
  and skip radii in units of $R$ cells. These dimensionless radii are fixed before $q$ and describe only the local
  isolation comparisons. With $q$ fixed, choose a large dyadic $R$ and put $P = R^5$.
  The period $q$ does not increase with $R$ or $s$. The entry side is

#[#set math.equation(numbering: n => "(59)")
 $ m = q R s = L^(j_0) . $ <ent:entry-side>]

The spatial quantities have the following distinct roles:

#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (center, left,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[$s$
], table.cell(rowspan: 1, colspan: 1)[side of one observation cell, in primary lattice units;
],
  table.cell(rowspan: 1, colspan: 1)[$R$
], table.cell(rowspan: 1, colspan: 1)[fixed local isolation scale, in observation cells;
],
  table.cell(rowspan: 1, colspan: 1)[$P = R^5$
], table.cell(rowspan: 1, colspan: 1)[side of an auxiliary comparison box, in observation cells;
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[fixed coloring period, measured in units of $R$ cells;
],
  table.cell(rowspan: 1, colspan: 1)[$m$
], table.cell(rowspan: 1, colspan: 1)[entry block side, in primary lattice units;
],
  table.cell(rowspan: 1, colspan: 1)[$j_0$
], table.cell(rowspan: 1, colspan: 1)[absolute block index of that entry side.
],
)
]

After $R \, P \, q$ are fixed we choose a finite large-field threshold $U_(upright("big"))$,
  and only then take $s$ sufficiently large among the dyadic values satisfying (59). Such values are arbitrarily large.

The occupied support in the statement records all evaluated coordinates and local rule data,
  together with the complete paths that tag a link’s winding or wall dependence.
  We use its norm padding $D_m \( X \)$ as a sufficient region for the entry copy tests.
  For a torus, say that $D_m \( X \)$ #emph[unwraps] when its sites, bonds, fixed stencils,
  and occupied path incidences admit one injective lift to the aligned plane block grid.
  A square copy test requires that this region, including the fixed stencil neighborhood, miss the wall.
  For a square-to-plane unit copy, identify the cell and block grids by their common center,
  straight cut ray and direction, origins, and additive branch convention,
  and require the local cell and block types on $D_m \( X \)$ to match under that identification.
  The construction below checks these conditions summand by summand.
  Its auxiliary $P$-boxes are containers used for estimates and do not add inputs to an activity.

#thm([Theorem 4.6.])[
  (Cutoff entry with one compulsory component).  #emph[Fix the finite list of map norms and reserves just
    described. There are constants $C \, c > 0$ such that the following holds for every sufficiently large fixed
    dyadic $R$, with $P = R^5$ and the fixed period $q$. For every sufficiently large dyadic $s$ satisfying (59),
    the assertions below hold uniformly in the finite volume.
    The threshold on $s$ may depend on all preceding choices.
    A compatible torus or aligned free square has side at least $s P$;
    for a marked square its side is larger than the fixed multiple of $s
    P$ needed to contain the compulsory region and its collars.
    In the square applications its ratio to $s P$ tends to infinity.]
  + #emph[There are plane activities $K_m^0$ which are real on real fields, negation-even,
    invariant under common translation by $omega$, and covariant under block translations and square symmetries.
    There are centered torus and free-square activities $K_(cal(G) \, m)^0$ with
$ parallel K_m^0 parallel_(m \, A_w \, V) \, med parallel K_(cal(G) \, m)^0 parallel_(m \, A_w \, V) lt.eq C e^(- c R) $

 in each of the fixed norms. On every such finite graph a positive field-independent scalar $c_(cal(G) \, m)$
   makes (39) hold. If $D_m \( X \)$ unwraps in a torus, its activity is exactly the plane activity.
   The same is true in a free square when $D_m \( X \)$ misses the wall.]
  + #emph[In a free square with the center unit there are real periodic activities $K_(cal(G) \, m)^tau$ and
    $J_(cal(G) \, m)$ for which (40) holds with that same scalar. For a constant $C_R < oo$ independent of $s \, n$,
#[#set math.equation(numbering: n => "(60)")
 $ parallel K_(cal(G) \, m)^tau parallel_(m \, A_w \, V) lt.eq C e^(- c R) \, wide
   parallel J_(cal(G) \, m) parallel_(m \, A_w \, V) lt.eq C_R s^(C_R) . $ <ent:label-norm>]

 The sector norm may use the slightly weaker weight and stronger regulator already reserved above.]
    #emph[There is a fixed set $frak(C)_(star.op \, m)$ of at most $C_R$ entry blocks,
      containing the full inflation of a square of side a fixed large multiple of $P$ in observation-cell units
      around the source, such that
#[#set math.equation(numbering: n => "(61)")
 $ J_(cal(G) \, m) \( X \) = 0 quad upright("unless") quad frak(C)_(star.op \, m) subset X . $ <ent:compulsory-support>]

 Every block of $frak(C)_(star.op \, m)$ is occupied in $X$ in the subset functional.
   The full support of each summand of $J \( X \)$ also occupies every padded dependency and the complete
   connecting, winding, or wall-reaching tag of every item in that summand.]
  + #emph[If the rectangle spanned by $D_m \( X \)$ misses the source, then
#[#set math.equation(numbering: n => "(62)")
 $ K_(cal(G) \, m)^tau \( X \, psi \) = K_(cal(G) \, m)^0 \( X \, psi + lambda_X \) \, $ <ent:translated-copy>]

 where $lambda_X$ is its local lift. This assertion uses the finite-square centered prescription if the support is
   near a wall. There are also centered-unit plane prescriptions $K_(oo \, m)^tau$ and $J_(oo \, m)$.
   Whenever $D_m \( X \)$ misses the square wall under the centered aligned identification just specified,
   its prescription is exactly the plane one with background translated by
#[#set math.equation(numbering: n => "(63)")
 $ \( v_n - v_oo \) \/ alpha . $ <ent:plane-background>]

 This identity holds for both the unlabelled and labelled activities.
   The sufficient regions in all three copy statements include the padded supports and all occupied tags.
   The plane centered-unit prescriptions obey the same bounds as in (60), with their local plane norms.]
] <ent:initialization>

The assertions concern arbitrarily late starts, with constants uniform for all sufficiently large admissible $s$.
  They make no uniform claim in temperature and assume no rate for a height scaling limit.
  In particular the smallness can be prescribed in advance by increasing the fixed $R$,
  while the label is only required to obey (60).

=== 4.6 The finite expansion and the occupied cover <the-finite-expansion-and-the-occupied-cover>

We prove Theorem 12 by adapting the finite expansion and pattern estimates in [16] Section 9.
  The theorem there is stated for quadratic discrete Gaussian heights; we use its model-independent algebra,
  Gaussian estimates, and counting, and prove the needed Bessel estimates with the cutoff.
  The strengthened-law entry of [17] Section 5 is not an entry theorem for the present law.
  Its proofs of the bounded-data and analytic estimates will be used with the inputs verified below.

In observation-cell units, start with the square grid of side $R$.
  Remove the square of side $R \/ 2$ centered at each vertex from its incident squares and make each removed
  square a tile. The trimmed squares and these vertex tiles partition the cells.
  At most three tiles meet at a junction, and tiles meeting there share a face segment.
  At a free wall clip complete aligned arrays, terminate the tiles at the wall,
  and use the same rules on every complete neighborhood. All pieces remain unions of whole cells and belong to the
  rectilinear geometries of Proposition 4. The four observation cells meeting the source lie with clearance inside
  a vertex tile. No tile deletion cuts through their unit junction.

Use the finite colors and bounded proximity groups of [16] Section 9, #emph[A finite,
  covariant isolation expansion]. For clarity, the colors specify the tile type and its square-symmetry orbit
  modulo $q$ in units of $R$. The period is greater than the fixed physical proximity, core, open-proxy, guard,
  testing, and skip radii of the isolation step. Each proximity group has a bounded number of members,
  and groups of one color have disjoint enlarged physical neighborhoods used by the isolation comparisons.
  Order the colors. At an event isolate its group of tiles by deleting all still-retained bonds to other tiles,
  and delete the corresponding cutoff faces. Its core, open patch, guard,
  and larger guard-testing patch have the fixed multiples of $R$ and separations in the cited construction.
  The same coloring and grouping apply to clipped wall groups.

Each open patch is a restriction of the current graph and therefore keeps its earlier cuts and retained
  observation rows. Measured by center sup-distance from a group member in cell units,
  the cited construction takes core tiles at distance at most $R$, open-patch tiles at distance at most $5 R$,
  and guard tiles in that patch starting at distance at least $3 R$.
  After the fixed stencil inflation of (53), the core and changed artificial boundary still have separation $c R$,
  including for clipped or disconnected groups. Thus every remaining Gaussian deletion-versus-patch difference
  estimated below is an instance of that four-graph estimate.

If $o_i \, c_i$ are the current open patch before and after event $i$, set

#[#set math.equation(numbering: n => "(64)")
 $ cal(B)_i^tau \( y \) = C_i exp { - 1 / 2 \( E_(o_i)^tau \( y \) - E_(c_i)^tau \( y \) \) } \, wide C_i =
   frac(Z_(o_i)^0 \( 0 \), Z_(c_i)^0 \( 0 \)) . $ <ent:proxy>]

Here $C_i$ is the centered open-patch scalar; only the Gaussian shape depends on the sector.
  Replace the old weight by $cal(B)_i^tau$ times the cut weight plus their difference.
  Selecting the difference marks the event; after a mark skip every later event within the fixed skip radius of
  its group. The radius is larger than the physical core, open-proxy, guard,
  and testing collars of the isolation rules. A later considered patch then misses each earlier marked core and
  guard. Its proxy does not depend on the choice of either signed term inside that earlier difference.
  This is a finite binary identity at the level of the integrand.
  After the last color, all undeleted cross-tile bonds lie in fixed halos of marks.

Let the superscript $0 upright(m)$ denote the path with no marks. Dividing the expansion by

$ product_i cal(B)_i^(tau \, 0 upright(m)) \( y \) product_b Z_b^0 \( 0 \) e^(- E_b^tau \( y \) \/ 2) =
  (product_i C_i^(0 upright(m)) product_b Z_b^0 \( 0 \)) e^(- E_(upright("asm"))^tau \( y \) \/ 2) $

defines the assembled Gaussian energy $E_(upright("asm"))^tau$.
  The index $b$ runs over the isolated tiles on that path. The scalar on the right is positive and is exactly the
  same in the centered and unit calculations. At a real zero centered observation every retained cutoff equals
  one, so these scalar normalizers need no cutoff correction.
  In a marked halo retain the whole signed height factor and every affected proxy.
  Outside the halos expand each isolated factor as one plus

$ T_Q^tau \( y \) - 1 \, wide T_Q^tau \( y \) = frac(hat(Z)_Q^tau \( y \) e^(E_Q^tau \( y \) \/ 2), Z_Q^0 \( 0 \)) . $

Selecting this second term selects an additional tile. In every term of the unit calculation insert one formal
  compulsory marker $I_star.op$ at the source. If the source tile is isolated,
  leave its normalized tile factor unexpanded and attach it to this marker.
  If it lies in a marked halo, the marker carries the factor one and that halo retains its entire signed factor
  and its ordinary marked items. The marker is adjacent to them and hence labels their component.
  In particular, an arbitrarily long chain of attached halos keeps the union of their individual covers;
  it is not hidden inside the fixed primitive cover of $I_star.op$. Every term has exactly one marker.
  Identical proxies and final tile factors off the affected halos cancel exactly, before any estimates are made.

The remaining Gaussian mismatch is $\( E_(cal(G))^tau - E_(upright("asm"))^tau \) \/ 2$.
  Telescope it over the deletions in the no-mark path. The $D_s sigma_z^2$ terms of (51) telescope exactly,
  since a full junction has the same $D_s$ in all graphs in which it persists.
  Lemma 11 therefore expresses the mismatch as a quadratic sum in face values whose coefficients,
  after summing deletion positions, obey

$ C e^(- c R - c thin d \( f \, f' \)) . $

The retained core-distance decay in (53) justifies this summation with a constant independent of volume.
  Enumerate its diagonal and off-diagonal summands as $b_ell w_f w_(f')$,
  with all symmetry factors included in $b_ell$, and expand

#[#set math.equation(numbering: n => "(65)")
 $ e^(\( E_(cal(G))^tau - E_(upright("asm"))^tau \) \/ 2) = product_ell \( 1 + ell_ell \) \, wide ell_ell =
   e^(b_ell w_f w_(f')) - 1 . $ <ent:face-links>]

If $d_ell$ is the full tagged length of the link, then $\| b_ell \| lt.eq C e^(- c \( R + d_ell \))$.
  The elementary inequality $\| e^z - 1 \| lt.eq \| z \| e^(\| z \|)$, followed by $2 \| w_f w_(f') \| lt.eq
  w_f^2 + w_(f')^2$, gives a factor $C e^(- c' \( R + d_ell \))$ times a quadratic exponential with coefficients
  $C e^(- c' \( R + d_ell \))$ on its incident faces. For example choose those coefficients proportional to $\|
  b_ell \|^(1 \/ 2)$, which pays the polynomial prefactor while retaining half the exponential gain.
  Such costs may also be charged on its connecting path. The sum of all reserved coefficients at one face is $C
  e^(- c' R)$, since there are only polynomially many endpoints and path descriptions at a given length.
  At a fixed finite real observation the product in (65) is absolutely convergent;
  the integrated absolute convergence will follow from the estimates below.

We retain the following geometric information in a link. On a torus,
  periodize the columns of the massive observation inverse and retain each displacement image separately.
  This is an exact periodization because the columns have the exponential decay proved above and the local forcing
  and proxy rules are periodic. The link’s path keeps its entire winding.
  In a free square use the plane coefficients between retained faces, with coordinate paths inside the square,
  and put their difference from the square matrix into additional links.
  Give each additional link a path that also reaches a nearest wall.
  The cut-distance bound in (52), together with the direct face-distance and $R$-gains,
  bounds this coefficient by $C e^(- c \( R + d_ell \))$ with the wall path included in $d_ell$.
  The fixed $O \( R \)$ proxy ranges are absorbed by decreasing $c$.
  Average coordinate-order choices and split ties to preserve symmetry.
  Each path has linear length, so its cover uses $O \( 1 + d_ell \/ R \)$ entry blocks;
  no bounding rectangle is filled. This decomposition makes interior copying exact,
  since every term that differs at a wall has a tag reaching that wall.

We now specify the occupied supports in the subset functional.
  For an ordinary mark or selected tile $I$, first choose one fixed physical envelope containing its tile halo and
  every core, open-proxy, guard, testing, and seam-comparison piece used for any allowed translate.
  The envelope has $O \( R^2 \)$ observation cells per item, with a constant that may depend on the fixed $q$;
  every later seam comparison is clipped to this envelope. Some cells in the envelope serve only the estimates;
  occupying them is a fixed conservative choice made before the later box translate is optimized.
  Add all fixed field and Gaussian-averaging collars of the local calculus.
  For a link include its entire chosen connecting path and every winding or wall-reaching tag,
  with the same collars. All these sets are enlarged to whole observation cells.
  Let $"cov"_m \( I \)$ be all $m$-blocks met by this full set.
  The collars include the finite range of $C_(< m)$ where needed for the averaging dependency.
  They are fixed once the map parameters and $q$ are fixed.
  A halo cover has bounded entry-block size, and a link cover has size $O \( 1 + d_ell \/ R \)$.
  The Gaussian-averaging collars can overlap even for events of one color;
  the full-cover adjacency below merges every such dependency.

For the compulsory source item, let the compulsory region be the observation-cell square within a fixed large
  multiple of $P$ of the center. Begin with this region and the local source-tile dependency when that tile factor
  is attached. Apply the same full inflation, including every padded dependency of that local factor and any tag
  assigned to it, and call the resulting set of entry blocks $frak(C)_(star.op \, m)$.
  Choose the multiplier of $P$ large enough that, for any item outside the compatibility neighborhood of this
  cover, every allowed $P$-box containing part of its physical region,
  together with its fixed testing enlargement, misses the source and uses no stencil near it.
  This is possible because such a box and enlargement reach only $O \( P \)$ cells from the item,
  whereas the initial square may use a larger fixed multiple of $P$.
  Its size is at most $C_R$, because $m = q R s$ and $P \, R \, q$ are fixed as $s$ increases.
  It is connected and contains the center.

Declare two items adjacent whenever their full covers are within the fixed connection distance of the subset
  calculus. Its initial choice includes the Gaussian range and the binary expansion’s exclusion rules:
  $C_(< m)$ has range less than $32 m$ for the printed polynomial, and the exclusions have diameter $O \( R s \) =
  O \( m \/ q \)$. Thus one bound chosen before $L$ works for every later $R \, s$.
  This distance is fixed independently of the size of the compulsory cover;
  the large cover occupies more blocks and does not enlarge the connection radius used by subsequent maps.
  For a component $pi$ without the compulsory item, define its occupied support to be the full union

#[#set math.equation(numbering: n => "(66)")
 $ X \( pi \) = union.big_(I in pi) "cov"_m \( I \) . $ <ent:occupied-cover>]

For a component $pi_star.op$ containing the compulsory item, define its occupied support to be exactly

#[#set math.equation(numbering: n => "(67)")
 $ X \( pi_star.op \) = frak(C)_(star.op \, m) med union #h(-0.16667em) union.big_(I in pi_star.op\
I eq.not I_star.op) "cov"_m \( I \) . $ <ent:occupied-label-cover>]

In particular, a summand of $J \( X \)$ is assigned only to $X = X \( pi_star.op \)$.
  The full set $frak(C)_(star.op \, m)$ is occupied even where the source factor is constant in the field.
  Every padded dependency and every tag of an attached item is occupied as well.
  We never replace this set by a root block or by a smaller subcover.
  Items that meet any part of this compatibility neighborhood belong to $pi_star.op$,
  even if their factors would otherwise be independent. Thus their ordinary patterns have not been discarded;
  they are summed in the labelled component.

Separated components now have separated field and noise coordinates and separated Gaussian subvectors below $m$.
  They also have no exclusion constraint between them: every such constraint was included in the adjacency just
  defined. Within a component, skip and validity constraints are functions of its recorded items and local rule
  data. Potentially incompatible exterior items need not lie in $D_m \( X \)$; when selected,
  their exclusion is enforced by subset compatibility rather than consulted as an input to this component’s
  activity. Averaging a pattern in (38) therefore factors over these components.
  The sum over components without the compulsory item defines the ordinary activity;
  the sum over the component $pi_star.op$ defines $J$. All constraints within a component remain in its defining
  sum. This gives the subset algebra (39) and (40), once the absolute convergence below justifies the exchanges
  with Gaussian integration. The common scalar is the positive scalar of the no-mark divisor divided by
  $Z_(cal(G))^0 \( 0 \)$. No independence of the random guards or of the binary marks has been assumed.

In the unit calculation, define $K^tau \( X \)$ by its ordinary pattern sum whenever $X$ can coexist with
  $frak(C)_(star.op \, m)$. Values on supports that cannot coexist do not enter $\[ x \]
  cal(Z)_m \( K^tau + x J \)$, by (67). Set those values to zero,
  except that when the rectangle spanned by $D_m \( X \)$ misses the source,
  set them to the translated centered prescription. This convention is useful for later local maps and does not
  alter the exact identity.

We check the sufficient copy region at the level of each summand assigned to $X$.
  Every evaluated field or noise coordinate and every local isolation or proxy stencil lies in the full cover and
  hence in $D_m \( X \)$. The grid phase and color rule is common under the compatible aligned identification.
  The cover also contains the whole averaging collar for $C_(< m)$, whose range is less than $32 m$.
  It occupies every projected path site, while the summand retains the complete lifted winding and tag data.
  Compatible aligned block identifications preserve these local data and the within-component constraints.
  The optimized $P$-grid, its energy classification, and empty portions of its boxes are used only in the proof of
  the bound; they are not data in the defining activity.

There is one qualification for the numerical link coefficients.
  An untagged coefficient is the fixed universal plane table indexed by its faces and displacement;
  the definition of that table may use the plane inverse. A torus image carries its complete winding path.
  A square-minus-plane coefficient may depend on the whole square,
  but its additional link carries a complete path to the wall.
  Consequently a summand with such an ambient obstruction cannot be assigned to an $X$ whose $D_m \( X \)$
  unwraps, or respectively misses the wall. All contributing rules and coefficients in that case are the common
  plane ones. This proves the centered copy statements.

In a source-free rectangle spanning $D_m \( X \)$, an integral gauge removes $tau$.
  It turns every retained factor in (35) into the ordinary neighbor cutoff and changes the field argument to the
  whole lifted translate $psi + lambda_X$, proving (62). Near a wall the two sectors use the same finite-square
  centered coefficient, including its possible dependence on remote parts of that square.
  Under the centered aligned identification in the theorem, when $D_m \( X \)$ misses the wall,
  the affine energies, cutoff, and source factor are the same plane-unit rules.
  Changing $v_oo$ to $v_n$ translates their argument by (63).
  The full compulsory cover and every attached cover remain occupied under these identifications.
  The artificially filled entries above are either zero or the same translated centered prescription.
  Thus the identities hold for the complete component sums with $D_m \( X \)$ as a sufficient entry copy region.
  The later causal neighborhood in Section 6 tracks the subsequent maps separately.

=== 4.7 Bounds for the pattern sums <bounds-for-the-pattern-sums>

Fix a pattern $pi$. Let $j_1$ be its number of binary marks, $j_2$ its number of additional selected tiles,
  and $d_ell$ the tagged lengths of its links. Let $X$ be the full occupied cover just defined.
  Write $F_pi \( psi \)$ for its signed factor after averaging the noise and the Gaussian pieces below $m$,
  with the common scalar removed. Put

$ cal(C)_pi \( s \) =
  cases(delim: "{", 1 \, & pi upright(" has no compulsory item") \,, C_R s^(C_R) \, & pi
  upright(" has the compulsory item") .) $

The constants $C_R$ in this notation may increase during the proof, but remain independent of $s$ and the volume.

#thm([Lemma 4.7.])[
  (The analytic pattern estimate).  #emph[After the parameter choices in (58) and (59),
    and the threshold choice described below, there is $s_0 < oo$ such that for every admissible $s gt.eq s_0$,
#[#set math.equation(numbering: n => "(68)")
 $ \| F_pi \|_(m \, X \, psi) lt.eq cal(C)_pi \( s \) thin C^(j_1 + j_2) e^(- c R \( j_1 + j_2 \)) product_ell C
   e^(- c \( R + d_ell \)) W_m^kappa \( X \, psi \) e^(V_(j_0) \( X \, psi \)) $ <ent:analytic-pattern-bound>]

 for all real backgrounds $psi$. The point norm on the left is the full derivative sum in (41).
   The constants are uniform in the compatible tori and free squares.]
] <ent:pattern-estimate>

#proof[
  We first obtain a real-field bound, keeping the physical comparison, the finite conditional limits,
    and the Gaussian averaging as separate steps.
  ===== 4.7.1 Centered normalization on the affected halos. <centered-normalization-on-the-affected-halos.>
  Prescribe the primary guard data $b_i^p$ at every marked event.
    Let $K_o^tau \, K_c^tau$ be its two positive interior kernels, including their retained cutoff factors.
    For real observations set
  $ delta_i \( y \, b_i^p \) =
    frac(\| K_o^tau \( y \, b_i^p \) - cal(B)_i^tau \( y \) K_c^tau \( y \, b_i^p \) \|, K_o^tau \( y \,
    b_i^p \) + cal(B)_i^tau \( y \) K_c^tau \( y \, b_i^p \)) lt.eq 1 . $
  Factors outside the guard cancel in this ratio. Conditional integration of a product of differences and the
    triangle inequality give the sum of its positive topologies, with $product_i delta_i$ under their guard laws.
    This is valid with correlated guard data.
  For a positive choice $G$, let $sans(B)_(pi \, G)^tau \( y \)$ denote its nonnegative normalized halo factor
    before the noise and Gaussian entry averaging. It retains the affected proxies and the conditional $delta_i$
    product, and uses the quotient left after cancelling the identical no-mark proxy and tile factors off the
    affected halo union. The intact selected tiles, an intact isolated source tile when present,
    and the links remain separate. The triangle inequality bounds the normalized unaveraged pattern by the finite
    sum of these halo factors times the absolute values of those remaining factors;
    averaging this bound gives a bound for $F_pi \( psi \)$. If there is no halo,
    the single empty halo factor is one. We now estimate one $sans(B)_(pi \, G)^tau$.
  Only a number of centered normalizations proportional to the number of affected halos is charged.
    Here is the finite accounting. In the union of the halos take a further collar beyond every skip and proxy
    radius, and give its artificial boundary a free wall. For either the positive branch or the no-mark branch,
    let $T_e$ be the true centered before-to-after ratio at a deletion in this union:
  $ T_e = frac(Z_(upright("before") \, e)^0 \( 0 \), Z_(upright("after") \, e)^0 \( 0 \)) . $
  These are zero-observation sums with every retained observation row and no temporary hard guard.
    Let $tilde(C)_e$ be the centered zero-observation proxy clipped to the union. Exact telescoping gives
  $ Z_(upright("final"))^0 \( 0 \) product_e tilde(C)_e = Z_(upright("initial"))^0 \( 0 \) product_e tilde(C)_e /
    T_e . $
  The initial zero-observation sum is the same in the two histories.
    They agree near the artificial boundary, so the clipped proxies there and all final components off the
    affected union cancel in the quotient. There are $O \( j_1 \)$ remaining comparisons,
    with a fixed additional number depending on $R$ if the compulsory item is present.
    Each centered restoration is between its open patch value and its value with a separating zero guard.
    The logarithm of this gap is bounded by $D \( H \, p \)$:
    a full primary pin on $H$ containing the restored endpoints makes the restoration a fixed scalar.
    Proposition 3 gives the direction, and Proposition 4 and the Gaussian localization in [16] Section 3 bound the
    gap on each of these finitely many shapes. This is the local double telescoping of [16] Section 9,
    Lemma 9.3 and [17] Equation (4.6), applied to the present centered normalizers.
    No comparison is made over the unaffected volume.
  Apply the identical accounting to the Gaussian shapes. The bounded face matrices in Lemma 11 give $C e^(- c R)
    cal(E)_pi \( w \)$, where $cal(E)_pi$ is the sum of $w_f^2$ on the underlying faces in the original padded
    halos. The singular terms cancel whenever their junction persists.
  For each resulting positive halo topology $G$, we now name the positive factor and its guard law.
    If $p$ is the current set of primary guards and $gamma$ their values, let
  #[#set math.equation(numbering: n => "(69)")
   $ cal(J)_G^tau \( y \, gamma \) & = sum_(h_p = gamma) cal(W)_G^tau \( h \) exp { - 1 / 2 parallel B_s h -
     y parallel^2 } \,\
Z_G^tau \( y \) & = sum_gamma cal(J)_G^tau \( y \, gamma \) \, wide nu_(G \, tau \, y)^p \( gamma \) =
  frac(cal(J)_G^tau \( y \, gamma \), Z_G^tau \( y \)) . $ <ent:joint-density>]
  Here $cal(W)_G^tau$ is the unnormalized product of the retained primary height weights.
    The common Gaussian density constants are omitted. Thus $cal(J)$ is an unhatted joint observation and guard
    density, distinct from the labelled activity $J$. Write $bb(E)_(G \, tau \, y)$ for expectation under this
    guard law. With
  #[#set math.equation(numbering: n => "(70)")
   $ Xi_G^tau \( y \) & = product_(f in cal(F) \( G \)) chi_s \( w_f \) \,\
cal(A)_G^tau \( y \) & = e^(E_G^tau \( y \) \/ 2) frac(hat(Z)_G^tau \( y \), Z_G^0 \( 0 \)) =
  e^(E_G^tau \( y \) \/ 2) Xi_G^tau \( y \) frac(Z_G^tau \( y \), Z_G^0 \( 0 \)) \, $ <ent:positive-factor>]
  the cutoff $Xi_G^tau \( y \)$ depends only on the prescribed observation and does not alter the guard law.
    The centered and Gaussian accounting just proved gives
  #[#set math.equation(numbering: n => "(71)")
   $ sans(B)_(pi \, G)^tau \( y \) lt.eq  & e^(C j_1 + C_R 1_({ star.op }) + C e^(- c R) cal(E)_pi \( w \))\
 & quad  times cal(A)_G^tau \( y \) bb(E)_(G \, tau \, y) product_i delta_i . $ <ent:positive-topology>]
  The factor $cal(A)_G^tau$ is retained in every halo topology.
    In particular it contains any surviving unit self energy there.
    The notation $1_({ star.op })$ means that the pattern has the compulsory item.
  Before making the box cuts, let $D_(upright("phys")) \( pi \)$ consist of the observation cells and original
    pre-deletion faces used by the pattern’s positive halo and selected-tile expressions,
    their affected open proxy patches, and the fixed core, guard, testing,
    and seam collars used in these comparisons, all inside the per-item physical envelopes occupied above.
    Include the original selected-tile region also when that expression takes its constant-one branch,
    and include the local source-tile region when it is attached.
    Each ordinary mark or selected tile contributes $O \( R^2 \)$ cells with these fixed collars;
    the source region contributes only a cost depending on $R$.
    The auxiliary boxes used below are containers only and add no empty cells or faces to
    $D_(upright("phys")) \( pi \)$. The complete link paths and the collars used only for their covariance
    dependence remain in the full occupied cover $X$ and in $D_m \( X \)$.
    Artificial occupancy of the compulsory cover with marker factor one creates no additional physical $Z$-factor.
  ===== 4.7.2 A real cut of the halos into $P$-boxes. <a-real-cut-of-the-halos-into-p-boxes.>
  Cut only the positive halo topology $G$ into boxes of side $P = R^5$ in cell units,
    on a translate of the $R$-grid. This grid clips its physical region inside the fixed envelopes.
    Each resulting graph contains only its actually present cells and faces there;
    the cut never introduces field dependence on a remote part of a $P$-box.
    On a torus remove every bond crossing a lifted box seam, including a bond between two lifted copies of the
    same projected box when the torus side is exactly $s P$. Retain a mark for its conditional gain only if its
    guard and larger guard-testing patch lie deep inside a box.
    Averaging the finitely many translates loses at most $C \( R \/ P \) j_1$ marks.
    For the bounded face matrices, the corresponding average seam cost is at most $C \( R \/ P \)
    cal(E)_pi \( w \)$. To see this, let $Sigma$ be the altered seam with its fixed comparison collar.
    Combine the two decays in (52). The inequality $d \( f \, Sigma \) lt.eq d \( f \, f' \) +
    d \( f' \, Sigma \)$, row summation, and $2 \| w_f w_(f') \| lt.eq w_f^2 + w_(f')^2$ bound the cost by
  $ C sum_(f upright(" in the original padded halos")) e^(- c thin d \( f \, Sigma \)) w_f^2 . $
  The remaining pair-distance decay makes the row sum finite.
    Averaging the $R$-spaced translates of the $P$-grid gives $"avg"_Sigma e^(- c thin d \( f \, Sigma \)) lt.eq
    C R \/ P$ at every such face. Only these existing halo faces are charged.
    The simultaneous Markov bound for the lost marks and this nonnegative quadratic cost selects a translate
    retaining at least half of the marks, for large $R$, with the stated cost multiplied by a fixed constant.
    If a seam removes the unit junction, (56) adds $C log \( 2 + s \)$ once at the compulsory component.
  For the physical comparison, first discard the factors $delta_i lt.eq
    1$ at lost guards and let $p$ denote the retained deep guards.
    Write $G_(upright("cut")) = union.sq.big_b G_b$ for the disjoint union of the actual clipped halo pieces.
    At every real $y$ and every retained guard value $gamma$,
    the affine-to-centered comparison gives the joint-density inequality
  #[#set math.equation(numbering: n => "(72)")
   $ frac(cal(J)_G^tau \( y \, gamma \), cal(J)_G^0 \( 0 \, 0 \)) lt.eq
     frac(cal(J)_(G_(upright("cut")))^tau \( y \, gamma \), cal(J)_(G_(upright("cut")))^0 \( 0 \, 0 \)) .
     $ <ent:seam-joint>]
  Indeed restoring the seam bonds adds the same positive matching precision in the affine and centered height,
    noise, and guard coordinates. Proposition 3 applies to this fiber also when the sector displacement is
    nonzero. The joint densities in (72) contain no cutoff factors.
  Put
  $ sans(p)_G^0 = frac(cal(J)_G^0 \( 0 \, 0 \), Z_G^0 \( 0 \)) \, wide sans(p)_(upright("cut"))^0 =
    frac(cal(J)_(G_(upright("cut")))^0 \( 0 \, 0 \), Z_(G_(upright("cut")))^0 \( 0 \)) . $
  These are the centered zero-guard probabilities at zero observation.
    For each actual halo piece define the complete per-box factor
  #[#set math.equation(numbering: n => "(73)")
   $ Q_b^tau \( y_b \) = cal(A)_(G_b)^tau \( y_b \) thin bb(E)_(G_b \, tau \, y_b)
     product_(i med upright(d e e p med i n) med b) delta_i . $ <ent:box-factor>]
  The expectation is one when there is no retained guard in $b$.
    The energies, cutoff products, centered normalizers, and joint guard sums on $G_(upright("cut"))$ factor over
    its actual pieces. Sum (72) against the unchanged nonnegative product of the retained $delta_i$,
    and multiply by $e^(E_G^tau \( y \) \/ 2) Xi_G^tau \( y \) sans(p)_G^0$. This gives
  #[#set math.equation(numbering: n => "(74)")
   $ cal(A)_G^tau \( y \) bb(E)_(G \, tau \, y) product_(i med upright("retained")) delta_i lt.eq  &
     e^(\( E_G^tau \( y \) - E_(G_(upright("cut")))^tau \( y \) \) \/ 2)
     frac(Xi_G^tau \( y \), Xi_(G_(upright("cut")))^tau \( y \))\
 & quad  times sans(p)_G^0 / sans(p)_(upright("cut"))^0 product_b Q_b^tau \( y_b \) . $ <ent:seam-normalized>]
  The local kernel at a retained guard is unchanged because its testing patch lies inside the box.
    The cutoff quotient in (74) is at most one on real data. Add the zero guards one at a time and bracket each by
    its common open and outer-zero-guard values. The separated testing patches and the same pin-interaction bound
    used above give
  $ sans(p)_G^0 / sans(p)_(upright("cut"))^0 lt.eq e^(C j_1 + C_R 1_({ star.op })) . $
  The optimized shape difference is bounded by the previously calculated $C \( R \/ P \) cal(E)_pi \( w \)$,
    with $C 1_({ star.op }) log \( 2 + s \)$ if the seam removes the unit junction.
    The earlier proxy cost $C e^(- c R) cal(E)_pi \( w \)$ in (71) remains separate.
    This is the sector seam estimate of [16] Equation (9.21), now with its normalization and per-box factors displayed.
  For each real $y$, choose the first qualifying translate in a fixed order of the finite allowed list.
    In the sum over that list, keep the indicator of this $y$-dependent choice until the bounds for retained marks
    and seam costs have been applied. Then discard the indicator, which is at most one,
    and perform the Gaussian integral for each translate. This is a sum over only polynomially many halo cut
    choices. A nonempty ordinary halo pattern pays that polynomial from its retained mark gains,
    and a labelled pattern may also pay it in $C_R$.
  Keep every isolated selected tile $Q$ intact and assign it to its own auxiliary box containing $Q$,
    of side at most $R lt.eq P$. These boxes are independent of the translated halo grid; the entire tile,
    including faces crossed by a halo seam, stays in one group.
    This is the separate isolated-tile grouping of [16] Section 9.
    The actual isolated tile graphs are mutually disjoint and lie outside the actual halo graph $G$,
    even when their comparison or dependency collars overlap.
    If the source tile is isolated and unexpanded, keep it as one intact compulsory group as well.
    When the source lies in a halo, its marker has factor one and adds no second physical group.
    Patterns with only isolated tiles, links, or an isolated source marker need no halo cut choice.
  ===== 4.7.3 Box energies and their classification. <box-energies-and-their-classification.>
  Let $b$ range over the nonempty clipped halo boxes and the auxiliary tile boxes.
    For a halo box, let $cal(E)_b \( w \)$ be the sum of $w_f^2$ on the original pre-deletion faces of its
    physical halo region after clipping to $b$. For the auxiliary box of an isolated tile $Q$, put
  $ cal(E)_b \( w \) = sum_(f in cal(F) \( Q \)) w_f^2 \, $
  using every original face of the intact tile. Define this energy before bounding $T_Q^tau -
    1$ by its positive and constant-one branches, so both branches have the same classification.
    The current halo topology can have fewer faces than its underlying region.
    Neither energy uses empty container cells. A box met solely by a link cover is charged in the separate link
    bounds. A box is good when $cal(E)_b \( w \) lt.eq U_(upright("big"))^2$,
    where $U_(upright("big"))$ is a finite threshold still to be chosen.
    In a pattern containing $I_star.op$, call a box #emph[compulsory] if its fixed testing enlargement meets the
    compulsory region; the intact isolated source tile is compulsory as well.
    There are only a number depending on $R$ of these boxes and of their possible marks and selected tiles.
    Every other box uses the ordinary good or bad rule. In particular,
    an unlabelled unit-sector pattern uses those rules even if a container overlaps the compulsory region.
    Its full cover can coexist with $frak(C)_(star.op \, m)$,
    so the size choice above makes each such box and its testing enlargement source-free.
    Thus every ordinary good box admits the local gauge used next.
  ===== 4.7.4 Ordinary good boxes and their conditional gain. <ordinary-good-boxes-and-their-conditional-gain.>
  In an ordinary good box use an integral gauge on its source-free rectangle.
    Even a pattern that winds globally admits this local lift.
    Translate each component of the underlying pre-deletion graph by a common height period so that one observed
    value is in $\[ - pi \, pi \]$. Paths of length bounded by a polynomial in $P$,
    together with the good-box bound, put all lifted observations in a fixed compact set depending on $R$ and
    $U_(upright("big"))$. There are finitely many box geometries, topologies,
    and mark lists at these fixed parameters. Proposition 4, after convolution with the unit observation noises,
    gives uniformly on these compact sets
  $ cal(A)_(G_b)^tau \( y_b \) arrow.r 1 . $
  Here $G_b$ is an actual clipped halo piece or an intact tile graph, with the local gauge understood.
    The finitely many cutoff logarithms tend uniformly to zero on the compact face data by (36).
    Thus the positive normalized topology alone is bounded by a fixed constant on every ordinary good box for all
    sufficiently large $s$. We next estimate the conditional factor in $Q_b^tau$ for a halo box.
  Fix one retained mark $i$, and write $p = p_i$ for its full primary guard.
    Let $t = o \, c$ be the two complete adjacent box topologies differing only at this core,
    with every other positive choice fixed. Use the same component-period recentering in the two topologies and
    write $y^ell \, gamma$ for the lifted observation and guard data.
    Both topologies keep the same observation rows. In this paragraph $cal(J)_t \( y^ell \, gamma \)$ is the joint
    density (69) in the centered gauge, and $bb(E)_(t \, 0)$ samples the centered full-box law at zero observation. Set
  #[#set math.equation(numbering: n => "(75)")
   $ z_t \( gamma \) & = cal(J)_t \( 0 \, gamma \) \, wide Z_t \( 0 \) = sum_gamma z_t \( gamma \) \,\
L_t \( y^ell \; gamma \) & = bb(E)_(t \, 0) #h(-0.16667em)
  [e^(chevron.l y^ell \, B_s h chevron.r) divides h_p = gamma] \,\
cal(J)_t \( y^ell \, gamma \) & = e^(- parallel y^ell parallel^2 \/ 2) z_t \( gamma \) L_t \( y^ell \; gamma \) \,\
nu_(t \, y^ell)^p \( gamma \) & =
  frac(z_t \( gamma \) L_t \( y^ell \; gamma \), sum_g z_t \( g \) L_t \( y^ell \; g \)) . $ <ent:one-mark-law>]
  The last line is the sampled guard marginal of the centered full-box law tilted by
    $e^(chevron.l y^ell \, B_s h chevron.r)$. The cutoff is a function of the observation only and does not change
    this law. The box normalizers $Z_t \( 0 \)$ in (75) are distinct from the open-patch scalar $C_i =
    Z_(o_i)^0 \( 0 \) \/ Z_(c_i)^0 \( 0 \)$ in (64).
  Define the centered conditional restoration ratio
  $ r_Delta \( gamma \) = frac(z_o \( gamma \) \/ z_c \( gamma \), z_o \( 0 \) \/ z_c \( 0 \)) . $
  Factors exterior to the full guard cancel from the kernel quotient. The exact one-mark identity is
  #[#set math.equation(numbering: n => "(76)")
   $ log frac(K_o^tau \( y \, b_i^p \), cal(B)_i^tau \( y \) K_c^tau \( y \, b_i^p \)) & = c_(i \, s) +
     log r_Delta \( gamma \) + Lambda_(i \, s) \( y \, gamma \)\
 & quad  + log frac(Xi_o^tau \( y \), Xi_c^tau \( y \)) \,\
c_(i \, s) & = log frac(z_o \( 0 \), C_i z_c \( 0 \)) \,\
Lambda_(i \, s) \( y \, gamma \) & = log L_o \( y^ell \; gamma \) - log L_c \( y^ell \; gamma \)\
 & quad  + 1 / 2 #scale(x: 120%, y: 120%)[\(] E_(o_i)^tau \( y \) -
   E_(c_i)^tau \( y \) #scale(x: 120%, y: 120%)[\)] . $ <ent:one-mark-identity>]
  Here $Xi_o^tau \/ Xi_c^tau$ is the quotient of the retained local cutoffs in the two kernels.
    The energy term in $Lambda_(i \, s)$ is $- log \( cal(B)_i^tau \/ C_i \)$.
    The first term $c_(i \, s)$ compares the centered zero-observation,
    zero-guard restoration with the open-patch proxy. The separated pin interaction and its Gaussian localization
    give a nonnegative upper bound
  $ \| c_(i \, s) \| lt.eq d_(i \, s) := D_i \( H \, p \) \, wide d_(i \, s) arrow.r d_(i \, upright(g)) lt.eq
    C e^(- c R) . $
  Here $D_i \( H \, p \)$ is the centered pin interaction for this separated comparison.
    This bounds the restoration gap without asserting a limit for $c_(i \, s)$.
    The local cutoff logarithm is uniformly $o \( 1 \)$ on compact lifted data.
  The $r_H$ of Proposition 4, formed in the centered cut law with a full pin on a core containing the restored
    endpoints and the supports of all restored forms, satisfies $r_H lt.eq r_Delta lt.eq 1$.
    These are centered objects even when the guard is sampled under $nu_(t \, y^ell)^p$.
    Indeed the exact change of the sampled guard law is
  #[#set math.equation(numbering: n => "(77)")
   $ frac(thin upright(d) nu_(o \, y^ell)^p, thin upright(d) nu_(c \, y^ell)^p) \( gamma \) =
     frac(r_Delta \( gamma \) L_o \( y^ell \; gamma \) \/ L_c \( y^ell \; gamma \), bb(E)_(nu_(c \, y^ell)^p) \[
     r_Delta L_o \( y^ell \; dot.op \) \/ L_c \( y^ell \; dot.op \) \]) . $ <ent:tilted-guard-change>]
  At zero observation this reduces to $r_Delta \/ bb(E)_(nu_(c \, 0)^p) r_Delta$.
    For a nonzero observation the Laplace quotient in (77) is retained.
  Here is the quantitative Gaussian estimate for the terms in (76).
    Let $u_c$ be the cut Gaussian harmonic prediction from the guard,
    and let $chi_H$ equal one at the core and vanish before the guard.
    In the gradient-plus-unit- observation energy norm $T$, put $Y_i = parallel chi_H u_c parallel_T$.
    The localized prediction estimate in [16] Equation (9.23) gives, for every $r gt.eq 2$,
  #[#set math.equation(numbering: n => "(78)")
   $ parallel Y_i parallel_(L^r) lt.eq C sqrt(r) thin "poly" \( P \) e^(- c R) \( 1 + sqrt(cal(E)_b \( w \)) \) .
     $ <ent:prediction>]
  It holds under either topology’s Gaussian guard law: restoration decreases the centered guard covariance,
    and the fixed tilt adds a deterministic prediction with the same localized operator bound.
    The negative logarithm of the Gaussian full-core pin ratio is at most $Y_i^2 \/ 2$.
    Subtracting this cutoff prediction also makes the cut minimizer admissible for restoration without changing
    its guard. Orthogonal projection bounds the linear conditional-Laplace discrepancy by $C parallel y^ell
    parallel_2 Y_i$; the conditional quadratic discrepancy from the open-patch proxy is $C e^(- c R) parallel
    y^ell parallel_2^2$. These are finite-energy prediction estimates and require no pointwise continuum trace.
  We spell out the fixed-order passage to the sampled primary guards. The elementary inequality
  $ lr(|frac(x - 1, x + 1)|) lt.eq min \( 1 \, \| log x \| \) \, wide x > 0 \, $
  and $r_H lt.eq r_Delta lt.eq 1$ give the pointwise bound
  $ delta_i & lt.eq Theta_(i \, s) \,\
Theta_(i \, s) & := min (1 \, med d_(i \, s) - log r_H + \| Lambda_(i \, s) \| + lr(|log Xi_o^tau / Xi_c^tau|)) . $
  Fix $R$, $P = R^5$, a finite $U_(upright("big"))$, the finite family of box geometries, topologies, and marks,
    a finite integer $r_max$ at least two and at least every deep-mark count in that family, and $eta > 0$.
    There is a threshold $s_0$, depending on these fixed quantities, such that for all admissible $s gt.eq s_0$,
    all compact lifted good observations, either $t = o \, c$ sampled under $nu_(t \, y^ell)^p$,
    and every integer $2 lt.eq r lt.eq r_max$,
  #[#set math.equation(numbering: n => "(79)")
   $ parallel delta_i parallel_(L^r \( nu_(t \, y^ell)^p \)) lt.eq
     C P^C r^C e^(- c_0 R) \( 1 + cal(E)_b \( w \) \)^C + eta . $ <ent:one-mark-moment>]
  The constants and degrees in the Gaussian term are independent of $U_(upright("big")) \, s \, r$;
    the threshold $s_0$ may depend on every preceding fixed choice.
  To prove this assertion, first fix the smooth guard lists and smooth core penalties in Proposition 4,
    then pass to the lattice limit, and only afterward increase the lists.
    Under centered sampling, $bb(E)_(upright("cen")) r_H = e^(- D \( H \, p \))$,
    the convergence of the pin interaction, and strict positivity of the Gaussian $r_H$ close the approximation to
    the full core pin in probability. The restoration consequence transfers the exceptional events between the
    centered topologies; Hölder with the uniform fixed-tilt exponential moments transfers them to the sampled
    tilted laws. This use of event transfer is consistent with the full density (77).
    On exceptional data use $delta_i lt.eq 1$. Along an admissible sequence with $y_s^ell arrow.r
    macron(y)^ell$ in the compact lifted set, after taking a fixed topology subsequence, this gives
  $ limsup_(s arrow.r oo) bb(E)_(nu_(t \, y_s^ell)^p) delta_i^r lt.eq
    bb(E)_(nu_(t \, upright(g) \, macron(y)^ell)^p) \( Theta_(i \, upright(g))^(upright("up")) \)^r \, $
  where the Gaussian upper envelope is
  $ Theta_(i \, upright(g))^(upright("up")) =
    min (1 \, med d_(i \, upright(g)) - log r_H^(upright(g)) + \| Lambda_i^(upright(g)) \|) . $
  The cutoff logarithm has limit zero. This envelope uses the limiting pin-interaction bound and does not require
    convergence of $c_(i \, s)$. With $parallel y^ell parallel_2 lt.eq
    "poly" \( P \) \( 1 + sqrt(cal(E)_b \( w \)) \)$, the preceding prediction estimate bounds their norm by
  $ parallel Theta_(i \, upright(g))^(upright("up")) parallel_(L^r) & lt.eq C e^(- c R) + 1 /
    2 parallel Y_i parallel_(L^(2 r))^2 + C parallel y^ell parallel_2 parallel Y_i parallel_(L^r) +
    C e^(- c R) parallel y^ell parallel_2^2\
 & lt.eq C P^C r^C e^(- c_0 R) \( 1 + cal(E)_b \( w \) \)^C . $
  Compact subsequences and the uniform exponential moments make this fixed-target conclusion uniform.
    The slack $eta$ gives (79); no rate in $s$, limit of $r_Delta$ or $delta_i$,
    or convergence uniform in all orders is used.
  Choose $eta lt.eq e^(- c_0 R)$ at these fixed parameters and orders.
    Let $j = j_(upright("deep")) \( b \)$ in an ordinary good halo box.
    For each mark, the current positive box topology is one member of its adjacent pair with all other choices
    fixed. Thus every factor is estimated under a marginal of the same current box law in $Q_b^tau$.
    Hölder with order $j$ when $j gt.eq 2$, and order two when $j = 1$, gives
  #[#set math.equation(numbering: n => "(80)")
   $ Q_b^tau \( y_b \) & lt.eq C [C P^C \( j or 2 \)^C e^(- c_0 R) \( 1 + cal(E)_b \( w \) \)^C]^j\
 & lt.eq C exp { - c R j + R^(- 12) cal(E)_b \( w \) } . $ <ent:good-box>]
  For $j = 0$, the separate compact bound $cal(A)_(G_b)^tau lt.eq C$ gives the same result.
    No independence of guards is used. The last inequality follows by maximizing the polynomial factor after
    multiplication by $e^(- R^(- 12) cal(E)_b)$: since $j lt.eq "poly" \( P \)$, the cost is $O \( j log R \)$,
    absorbed by a fixed fraction of $c_0 R j$. This is the good-box argument of [16] Section 9 with the smaller
    allowance in [17] Equation (5.20).
  For an isolated selected tile, $cal(E)_b$ controls its whole observation vector modulo the component period
    because every original tile face is present in that energy.
    Its fixed-tile normalized factor therefore tends uniformly to one on good data, giving $\| T_Q^tau -
    1 \| lt.eq e^(- c R)$ for sufficiently large $s$. There are only finitely many shapes and mark lists at fixed
    $R \, P \, U_(upright("big"))$, so all these bounds hold for every sufficiently large admissible $s$.
    In a compulsory box we discard all good-box gains. Only a number depending on $R$ of gains is lost.
  ===== 4.7.5 Ordinary bad and compulsory boxes. <ordinary-bad-and-compulsory-boxes.>
  If $cal(E)_b \( w \) > U_(upright("big"))^2$, discard the conditional rarity and use (57) for the positive
    factor of a clipped halo piece in (71). For an isolated selected tile $Q$, use $\| T_Q^tau - 1 \| lt.eq
    T_Q^tau + 1$ and apply (57) on the intact graph $Q$. Its full-tile classification is retained on the
    constant-one branch. On an ordinary bad box of either kind insert
  #[#set math.equation(numbering: n => "(81)")
   $ 1 lt.eq exp { epsilon_1 \( cal(E)_b \( w \) - U_(upright("big"))^2 \) } \, $ <ent:threshold-charge>]
  where $epsilon_1 > 0$ is fixed small compared with the gap in (58).
    Every compulsory box, regardless of its energy, uses the broad bound (57) without (81);
    its determinant and lost gains will be a fixed compulsory cost.
    The intact isolated source tile is always handled by this compulsory bound, without a threshold.
    Thus the bad-box coefficient is $1 - c_(*) < h_1$ everywhere a broad energy is used.
    This strict inequality is precisely where the observation cutoff is needed.
  ===== 4.7.6 The local quadratic cost and Gaussian averaging. <the-local-quadratic-cost-and-gaussian-averaging.>
  Write the argument of (38) as
  $ y = y^0 + B_s v_n \, wide y^0 = B_s alpha \( psi + zeta_(< m) \) + e \, wide w =
    nabla_(upright(c)) y^0 + \( nabla_(upright(c)) B_s v_n + tau \) . $
  For the centered sector the deterministic summand is zero.
    First apply quadratic Cauchy–Schwarz to the shifted broad energies and face squares,
    using a fixed small fraction of the gap between $1 - c_(*)$ and $h_1$.
    Reserve a further fraction for the face costs. In the following bound the cost in $y^0$ is the coefficient
    after this split. For each fixed positive branch and box translate,
    the ordinary boxes’ good/bad predicates partition the real observation space into finitely many classes;
    compulsory boxes retain their fixed status. Keep each class indicator through its class-dependent bounds above
    and the split just made. Fix one term of this partition, and let $q_pi \( y^0 \)$ be exactly the sum of the
    positive quadratic costs retained after this split: the centered broad energies on the actual bad and
    compulsory graphs, the good-box allowances, the localized proxy, seam, and link costs,
    and the positive part of (81). Its coefficients are those in the preceding bounds;
    the negative threshold constants and deterministic source costs are kept outside $q_pi$.
    Before the Gaussian integral for this fixed $q_pi$, replace its class indicator by one.
    The finite class count is charged to the existing per-box counting cost below.
    This positive quadratic form satisfies
  #[#set math.equation(numbering: n => "(82)")
   $ q_pi \( y^0 \) lt.eq 1 / 2 h_1 E_D^0 \( y^0 \) \, wide D = D_m \( X \) . $ <ent:dominating-open-energy>]
  Here $D$ is enlarged to whole cells and contains $D_(upright("phys")) \( pi \)$,
    the full link paths and collars, and every support used by the quadratic costs.
    There are two form comparisons behind this statement. Restrict a trial field for $E_D^0$ to all cut halo
    pieces receiving a bad or compulsory bound, all intact selected tiles receiving a bad or compulsory bound,
    and any compulsory isolated source tile. Their actual graphs are disjoint:
    selected tiles are outside $G$ and are mutually isolated.
    Thus their internal edges and observation rows are counted at most once,
    and the sum of their minimized energies is at most $E_D^0$.
    Comparison-only proxy and seam collars can overlap, but they enter through the small face coefficients with
    bounded per-face multiplicity. On two adjacent underlying cells, cell Poincaré and their observation residuals give
  $ \| y_j^0 - y_i^0 \|^2 lt.eq C {a^(- 1) sum_(e upright(" in their union")) \| nabla u \( e \) \|^2 +
    sum_(k = i \, j) \| \( B_s u \)_k - y_k^0 \|^2} . $
  The union in this display includes their common underlying face.
    Sum this with the localized coefficients already bounded per face and minimize over $u$.
    For large $R$ and small $epsilon_1$, these costs fit into the strict gap above the broad coefficient $1 -
    c_(*)$. This proves (82).
  For the remaining deterministic part of the split, trying $v_n$ in a cut energy gives
  $ E_G^tau \( B_s v_n \) lt.eq a^(- 1) parallel eta_n parallel_G^2 . $
  Likewise $\( B_s v_n \)_j - \( B_s v_n \)_i + tau_f = sum_e Phi_f \( e \) eta_n \( e \)$,
    so (49) bounds a deterministic face cost by the energy on its two cells.
    Away from the compulsory neighborhood, (46) makes this at most a fixed constant per halo or selected-tile item
    and per block along a link cover. More precisely, an ordinary physical portion with $O \( R^2 \)$ present
    cells at cell distance at least a fixed multiple of $P$ costs at most $C R^2 \/ P^2$.
    The portions have bounded overlap. This uses the actual cells of a clipped halo or an intact tile,
    without filling its containing box. The exponentially small link coefficients give an even smaller cost,
    or can be paid per block of their linear covers. In a pattern containing $I_star.op$,
    the deterministic energy in the fixed source neighborhood containing its compulsory groups is at most $C_R
    log \( 2 + s \)$, by summing (46) from the source to distance $O_R \( s \)$.
    It is charged to the labelled component. For an unlabelled unit-sector pattern,
    compatibility with $frak(C)_(star.op \, m)$ puts every physical portion at cell distance at least a fixed
    multiple of $P$ from the source, so the preceding ordinary per-item estimate applies to all its deterministic costs.
  Write $y^0 \( z \) = b + sans(S) z$, where $b = B_s alpha
    psi$ and $z$ consists of standard Gaussian/Cameron coordinates on the covariance support for
    $\( zeta_(< m) \, e \)$. The linear map $sans(S)$ includes the observation averaging and noise.
    Define the positive matrix
  $ sans(M)_pi = nabla_z^2 #h(-0.16667em) [p_1 q_pi \( b + sans(S) z \)] . $
  It is the Hessian of the actual localized cost in the $p_1$ Hölder factor,
    rather than the Hessian of the dominating open energy. Form domination in (82) and the covariance contraction
    of Lemma 9 give
  $ 0 lt.eq sans(M)_pi lt.eq p_1 h_1 I < I . $
  The strict inequality follows from $p_1 < p_2$ and $h_1 < h_(*) < 1 \/ p_2$.
    For the current ordinary regulator factor $W$, the chosen Hölder inequality is
  $ bb(E) \[ W e^(q_pi) \] lt.eq #scale(x: 120%, y: 120%)[\(] bb(E) e^(p_1 q_pi)
    #scale(x: 120%, y: 120%)[\)]^(1 \/ p_1) #scale(x: 120%, y: 120%)[\(] bb(E) W^(p_1 \/ \( p_1 - 1 \))
    #scale(x: 120%, y: 120%)[\)]^(\( p_1 - 1 \) \/ p_1) . $
  Gaussian completion in its $p_1$ factor is exactly
  #[#set math.equation(numbering: n => "(83)")
   $ (bb(E)_z e^(p_1 q_pi \( b + sans(S) z \)))^(1 \/ p_1) =  & det \( I - sans(M)_pi \)^(- 1 \/ \( 2 p_1 \))\
 & quad  times exp {sup_z [q_pi \( b + sans(S) z \) - frac(parallel z parallel^2, 2 p_1)]} . $ <ent:entry-completion>]
  The supremum is at most $V_(j_0) \( X \, psi \)$, by (42) and $h_1 < h_(*)$.
    The other Hölder factor is the ordinary regulator with its reserved exponent.
    Thus the completion uses the open energy only to bound the shifted exponential;
    the determinant keeps $sans(M)_pi$ and its localized trace. Its trace is bounded by
  #[#set math.equation(numbering: n => "(84)")
   $ "tr" sans(M)_pi lt.eq  & C P^2 N_(upright("bad")) + C R^(- 12) P^2 N_(upright("good")) +
     C \( R \/ P \) R^2 \( j_1 + j_2 \)\
 & + C sum_ell e^(- c \( R + d_ell \)) "poly" \( d_ell \) + C_R 1_({ star.op }) . $ <ent:entry-trace>]
  Here $N_(upright("bad"))$ and $N_(upright("good"))$ count ordinary bad and good clipped halo boxes and auxiliary
    tile boxes, using their respective energies above; the compulsory boxes are in the last term.
    Boxes met solely by links contribute through the fourth term.
    A tile contributes one auxiliary box even on its constant-one branch.
    Each broad halo energy and its threshold charge have rank at most $C P^2$ in cell observations,
    and the contraction bounds every eigenvalue. For an intact tile the rank is $O \( R^2 \)$,
    hence also at most $C P^2$. The good allowance has coefficient $R^(- 12)$ on at most $C P^2$ face contrasts.
    Each such contrast has bounded variance under the reference Gaussian and noise.
    Indeed, for an underlying face $f = \( i \, j \)$, the flow in Equation (49) and $A^(1 \/ 2) C_(< m)
    A^(1 \/ 2) lt.eq I$ give
  $ "Var" #scale(x: 120%, y: 120%)[\(] \( B_s alpha zeta_(< m) \)_j - \( B_s alpha zeta_(< m) \)_i + e_j -
    e_i #scale(x: 120%, y: 120%)[\)] lt.eq a parallel Phi_f parallel_2^2 + 2 lt.eq C . $
  The contrast annihilates constants. Its underlying face belongs to the full reference graph and the open support
    $D$, even when the positive topology has deleted that face. The same bound applies to the seam and link costs.
    There are $O \( R^2 \)$ present cells per halo for the seam trace.
    At a fixed face, the sum of the reserved coefficients over all possible links is bounded by $C e^(- c R) sum_d
    "poly" \( d \) e^(- c d)$: only polynomially many tagged descriptions of length $d$ meet that face.
    This controls every selected subset of links, independently of its cardinality,
    and gives the fourth trace term. Each marked halo intersects a bounded number of $P$-boxes and each selected
    tile adds one auxiliary box, so $N_(upright("good")) lt.eq C \( j_1 + j_2 \) + C_R 1_({ star.op })$.
    The actual good quadratic remains inside $D$; the $P^2$ count is only an upper bound for its trace.
    These are the trace charges of [16] Equation (9.26) and [17] Equation (5.24) for the same reference forms in $y^0$.
  The unit junction term in (51) does not enter $sans(M)_pi$.
    Equation (56) makes it a constant in these standard Gaussian coordinates,
    so its Hessian is zero even though its coefficient is $O \( log s \)$.
    A cut that changes its presence pays a factor $s^(C_R)$, not a determinant.
    All deterministic source costs were separated before $q_pi$ and remain outside this completion.
    The background $b = B_s alpha psi$ supplies the affine terms in $z$ already included in the supremum.
    In particular no determinant in (84) counts the microscopic primary sites or the subdivision vertices.
  For a positive matrix with norm at most $1 - delta$, $- log det \( I - sans(M)_pi \) lt.eq
    delta^(- 1) "tr" sans(M)_pi$. Thus (84), with the fixed factor $1 \/ \( 2 p_1 \)$ in (83),
    bounds the logarithmic determinant. A bad halo box meets at most a polynomial in $P$ number of original marks,
    and a bad auxiliary tile box carries one selected tile, including its constant-one branch.
    Choose the finite $U_(upright("big"))$, now and before choosing $s$,
    so that the negative constant $epsilon_1 U_(upright("big"))^2$ in (81) pays the $C P^2$ determinant,
    the lost gains of those marks and tiles, and the per-box counting cost,
    with a further $e^(- c R)$ per such item. The link gains remain in their separate trace and counting bounds.
    Since $P = R^5$, both $R^(- 12) P^2$ and $\( R \/ P \) R^2$ are $O \( R^(- 2) \)$.
    They do not consume the remaining ordinary gains. The compulsory boxes pay their whole fixed determinant and
    lost gains in $C_R$, and the deterministic source costs give $s^(C_R)$. We obtain the real estimate
  #[#set math.equation(numbering: n => "(85)")
   $ \| F_pi \( psi \) \| lt.eq cal(C)_pi \( s \) thin C^(j_1 + j_2) e^(- c R \( j_1 + j_2 \)) product_ell C
     e^(- c \( R + d_ell \)) W_m^(kappa_0) \( X \, psi \) e^(V_(j_0) \( X \, psi \)) \, wide
     kappa_0 < kappa . $ <ent:real-pattern>]
  There is strict reserve in both regulators. In particular,
    for a real direction $f$ with $parallel f parallel_(m \, D) lt.eq 1$, replacing the background by $psi +
    x f$ while keeping the regulator evaluated at $psi$ costs at most
  #[#set math.equation(numbering: n => "(86)")
   $ e^(C x^2 \| X \|) . $ <ent:real-translation>]
  This follows by Cauchy–Schwarz in the optimized quadratic form using $h_1 < h_(*)$;
    the direction energy is $chevron.l f \, A_D f chevron.r lt.eq C \| X \|$.
    The ordinary regulator has the same spare exponent.
  ===== 4.7.7 Complex directions and the derivative norm. <complex-directions-and-the-derivative-norm.>
  For real $y \, z$, the finite theta parity inequality on the chain subdivision gives
  #[#set math.equation(numbering: n => "(87)")
   $ frac(\| Z_G^tau \( y + i z \) \|, Z_G^tau \( y \)) lt.eq
     frac(Z_G^0 \( i z \), Z_G^0 \( 0 \)) . $ <ent:complex-comparison>]
  To include the sector, restrict the affine lattice to its parallel span and move its real displacement into the
    real theta tilt. The theta inequality in [16] Equation (9.29) applies to that tilt.
    A displacement normal to the span contributes the same imaginary Gaussian factor on the left and the centered
    right, with a phase of modulus one. This proves (87) on the affine lattice.
    Its dominated limit at the fixed primary graph proves the Bessel version, as in [17] Equation (5.26).
    Every freely translated component is confined by the observations during this comparison.
  The centered imaginary ratio is its Gaussian prefactor times a positive centered characteristic function.
    Centered pinning increases that characteristic function, by Proposition 3.
    Expand the differences into their positive topologies and temporarily discard the $delta_i$ rarity,
    while retaining the link gains. For the halo factors, pin whole strips of width $R \/
    4$ on translates of the $P$-box walls and cut through the middle of these zero strips,
    using only their intersections with the fixed physical envelopes.
    The strips and every auxiliary cut are unions of whole observation cells,
    so no average straddles a guard or a new component. Only the primary heights in the present strip cells are
    pinned; every observation row is retained. On the resulting fixed boxes,
    Proposition 4 gives the Gaussian imaginary ratio uniformly on bounded imaginary arguments after $s$ is
    sufficiently large. For clarity, let $S$ be the present strip cells in a halo graph $G$,
    and let $E_(G \, S)^0$ denote its Gaussian observation energy with those primary cells pinned to zero.
    The unpinned minimizer is $u_z = T_G^(- 1) B_s^(*) z$, with $T_G = A_G \/ a + B_s^(*) B_s$.
    Choose a cell cutoff $chi$ equal to one on $S$ and supported in a fixed cell collar $N_G \( S \)$ inside the
    present graph, with microscopic slopes at most $C \/ s$ on retained edges.
    The trial $\( 1 - chi \) u_z$ is pinned-admissible, and quadratic completion gives
  $ E_(G \, S)^0 \( z \) - E_G^0 \( z \) lt.eq parallel chi u_z parallel_(T_G)^2 lt.eq
    C parallel z parallel_oo^2 thin \| N_G \( S \) \| . $
  The last bound follows from cell coercivity and the exponential locality of the columns $T_G^(- 1) B_s^(*) 1_Q$,
    proved by the same cell-cutoff argument as Lemma 11. It holds on fragmented unions and at free walls because
    it uses only present cells and retained edges. Averaging $\|
    N_G \( S \) \|$ over wall translates therefore bounds the additional Gaussian wall energy by
  $ C parallel z parallel_oo^2 \( R \/ P \) \# { upright("halo observation cells in ")
    D_(upright("phys")) \( pi \) } . $
  This is the imaginary-wall estimate in [16] Equation (9.31);
    it follows from massive locality away from the strips and the bounded energy per cell near them.
    The count uses actual halo cells and their fixed physical comparison regions, with no empty container cells;
    link-only cells stay in the separate link bound. The displayed count costs $O_H \( R^3 \/ P \) =
    O_H \( R^(- 2) \)$ per halo when the imaginary direction is in a fixed strip of height $H$.
  The Gaussian shapes cancel the imaginary Gaussian ratio. In fact the quadratic continuation of their affine form
    obeys exactly
  #[#set math.equation(numbering: n => "(88)")
   $ Re E_G^tau \( y + i z \) = E_G^tau \( y \) - E_G^0 \( z \) . $ <ent:imaginary-shape>]
  The imaginary face data are $nabla_(upright(c)) z$ and have zero circulation,
    so the second term is the centered one also in (51). The bounded matrix errors are the small localized costs
    already charged above.
  For a halo topology, expanding the signed differences has removed only the conditional $delta_i$ expectation.
    After the theta comparison and the Gaussian shape cancellation,
    its physical real factor is still $cal(A)_G^tau \( y \)$, multiplied by the imaginary-wall and cutoff costs.
    Apply the real seam comparison (74) to that factor with the delta product omitted.
    Its per-box factor is then $cal(A)_(G_b)^tau \( y_b \)$ in place of $Q_b^tau \( y_b \)$.
  For an intact isolated tile $Q$, apply (87) on $Q$ itself.
    Its centered imaginary ratio has the fixed-tile Gaussian limit and cancels its Gaussian shape by (88),
    without a $P$-wall strip. The real factor remains $T_Q^tau \( y \)$, so it uses exactly the full-tile good,
    bad, or compulsory bound above; the constant-one branch has no imaginary ratio.
    The same calculation applies to an intact source tile with its compulsory bound.
  On an ordinary good halo piece use the separate compact estimate $cal(A)_(G_b)^tau \( y_b \) lt.eq C$,
    allowing the harmless factor $e^(R^(- 12) cal(E)_b \( w \))$.
    The mark gain $e^(- c R j_(upright("deep")))$ from (80) is unavailable in this rough strip.
    For an intact selected tile, the triangle bound keeps the real terms $T_Q^tau \( y \)$ and $1$ separate and
    likewise uses only their compact bound on good data. Only real bad and compulsory boxes use the broad energy
    bound. Thus their $C P^2$ determinant costs remain confined to those boxes,
    while ordinary good boxes have at most the $R^(- 12) P^2$ trace cost in (84).
    The real rarity gains will be recovered by interpolation from the real boundary.
  The additional cutoff factors satisfy the exact elementary bound
  $ \| chi_s \( x + i t \) \| lt.eq chi_s \( x \) e^(t^2 \/ 2) . $
  For a complex field translation by $\( x + i y \) f$, with $parallel f parallel_(m \, D_m \( X \)) lt.eq
    1$ and $\| y \| lt.eq H$, each imaginary face difference is $O_H \( s \/ m \) = O_H \( R^(- 1) \)$.
    There are $O \( R^2 \)$ faces per halo or intact tile, so these extra squares cost only $O_H \( 1 \)$ per such
    item. The compulsory region has only a fixed additional cost depending on $R \, H$.
    Link costs retain their tagged-length gains. We have therefore obtained the rough bound
  #[#set math.equation(numbering: n => "(89)")
   $ \| F_pi \( psi + \( x + i y \) f \) \| lt.eq  & cal(C)_pi \( s \) exp { o \( R \) \( j_1 + j_2 \) +
     C_H \( 1 + x^2 \) \| X \| }\
 & quad  times product_ell C e^(- c \( R + d_ell \)) W_m^kappa \( X \, psi \) e^(V_(j_0) \( X \, psi \)) \,
   wide \| y \| lt.eq H . $ <ent:rough-strip>]
  The $o \( R \)$ is for fixed $H$ as $R$ increases; it includes the preceding wall and finite per-halo or
    per-tile costs. Finite-graph analyticity follows from absolute summation with the large-field reserve.
    The same bounds justify analyticity after the Gaussian averaging and the absolutely summable links.
  Choose $r_0 > 4 e h_0$ and $H > 4 r_0$ before choosing $R$.
    Apply the three-lines theorem in the upper and lower strips to
  $ F_pi \( psi + z f \) exp { - gamma_H z^2 \| X \| } \, wide gamma_H > C_H . $
  The real boundary uses (85) and (86); the other boundary uses (89).
    On $\| z \| lt.eq r_0$ the harmonic weight of the real boundary is at least $3 \/ 4$.
    The item gains therefore survive with a smaller $c$. Removing the damping costs $e^(C \| X \|)$,
    which is absorbed by the gains and $cal(C)_pi \( s \)$, since
  $ \| X \| lt.eq C \( j_1 + j_2 \) + C sum_ell \( 1 + d_ell \/ R \) + C_R 1_({ star.op }) . $
  Cauchy’s inequality bounds the diagonal derivative of order $k$ by $k !
    r_0^(- k)$ times this recovered pattern bound. Real polarization costs a further $k^k \/ k !$.
    Its contribution to the point norm is thus at most the pattern bound times $\( h_0 \/ r_0 \)^k k^k \/ k !$,
    whose sum converges because $r_0 > 4 e h_0$. This proves (68). ◻
]

#proof[
  #emph[Completion of Theorem 12.] It remains to sum connected patterns and check the norm cost of the freely
    filled translated entries. Assign to each ordinary halo item and link the positive weight given by Lemma 13,
    including its fixed analytic and geometric constants. For every entry block $B$, their placement sum satisfies
  #[#set math.equation(numbering: n => "(90)")
   $ sum_(I : med "cov"_m \( I \) upright(" meets")\
upright("the connection neighborhood of ") B) w \( I \) \( 2 A_w \)^(\| "cov"_m \( I \) \|)
  e^(\| "cov"_m \( I \) \|) lt.eq e^(- c R) = : epsilon.alt_R . $ <ent:placement>]
  A halo has bounded entry-block diameter and only polynomially many observation-cell roots and event labels in a
    block. A link of tagged length $d$ has $O \( 1 + d \/ R \)$ covered blocks and only polynomially many endpoint
    and path choices at that length, including its period images or wall tag.
    Their weights and cover factors are paid by $e^(- c \( R + d \))$.
    These are counts in observation cells, independent of $s$.
    This proves (90) by the connected-placement estimate of [16] Equation (9.34).
  For clarity, root an ordinary connected collection at an item meeting a fixed block and choose a canonical
    spanning tree of its item adjacency graph. If the sum of descendant trees attached at one block is $T$,
    the unordered children of an item with cover $S$ cost at most $e^(\| S \| T)$.
    Starting with depth zero, (90) and its reserved $e^(\| S \|)$ show inductively that $T lt.eq
    epsilon.alt_R < 1$ at every depth. Monotone convergence bounds all finite trees.
    The factor $2^(\| S \|)$ pays the regrouping into occupied subsets.
    This gives the norm bound $C e^(- c R)$ for the ordinary connected sum, uniformly on plane, torus,
    and square covers.
  For a labelled collection the root is the single compulsory cover.
    All of its $\| frak(C)_(star.op \, m) \| lt.eq C_R$ blocks remain occupied.
    They supply at most $C_R$ choices for child attachment and a fixed weight cost depending on $R$;
    the same descendant tree bound sums every attached ordinary item.
    Multiplying by $cal(C)_pi \( s \) = C_R s^(C_R)$ proves (60).
    In particular this summation never drops the padded or tagged part of (67).
    It also proves absolute integrated convergence of (65). On a finite graph one may first sum the finite
    positive topologies, then integrate the noise and high Gaussian, and finally sum the links.
    Tonelli for absolute values and the proved bound justify all exchanges in the signed identity.
  Finally consider an entry of $K^tau$ that was filled by the translated prescription because it cannot coexist
    with the compulsory cover. Put $D = D_m \( X \)$, and let $F_X$ be the actual field and difference-stencil
    support of $K_(cal(G) \, m)^0 \( X \, dot.op \)$. By the local calculus and the full-cover assignment,
    $F_X$ lies in the sites of $X$ plus a fixed microscopic collar of width at most $rho m$,
    with a fixed $rho < 1$. Since the rectangle spanned by $D$ misses the source,
    choose a signed coordinate $t$ for which that rectangle lies in $t > 0$.
    The two padding layers on the source-facing side each have width at least $m$,
    including at irregular end blocks. They cannot be clipped by the source-facing free wall:
    reaching that wall would make the padded rectangle cross the interior source in this coordinate. Consequently
  $ F_X subset { t gt.eq \( 2 - rho \) m - C } subset { t gt.eq m } $
  for all sufficiently large admissible $m$. This separates the actual field inputs from the source even when the
    outer padding $D$ approaches it.
  Choose the physical lift $lambda_X$ on the source-free half-rectangle ${ t gt.eq m \/ 3 }$,
    with its additive period aligned to the lift in (62) on $F_X$.
    Lemma 8 gives uniformly bounded oscillation there, including the possible one-period unwrapping across the
    fixed cut. Choose a constant $c$ so that $\| lambda_X - c \| lt.eq C$ on this half-rectangle.
    Let $chi in C^2 \( bb(R) \)$ be fixed, equal to zero on $\( - oo \, 1 \/ 2 \]$ and to one on $\[ 1 \, oo \)$.
    On the lattice define
  $ lambda_(upright("ext")) = c + chi \( t \/ m \) \( lambda_X - c \) $
  where $t gt.eq m \/ 3$, and continue it as $c$ below that half-rectangle.
    The formulas agree on a neighborhood of their join because $chi = 0$ through $t = m \/ 2$.
    On $F_X$, $lambda_(upright("ext")) = lambda_X$. Locality therefore gives
  $ K_(cal(G) \, m)^0 \( X \, psi + lambda_(upright("ext")) \) = K_(cal(G) \, m)^0 \( X \, psi + lambda_X \) $
  as functions of $psi$, and hence gives equality of all derivatives in (41).
    The exact copy identity retains its physical lift $lambda_X$;
    $lambda_(upright("ext"))$ is a representative for estimating the same activity.
  The bounds in Lemma 8 on $t gt.eq m \/ 3$, the bounded oscillation,
    and the discrete product rules for the fixed cutoff give
  $ \| nabla lambda_(upright("ext")) \| lt.eq C \/ m \, wide \| nabla^2 lambda_(upright("ext")) \| lt.eq C \/ m^2 $
  throughout $D$ and every boundary and stencil neighborhood used by the norm.
    At a free wall normal to $t$, the cutoff is constant in its stencil neighborhood under the volume hypothesis;
    at a perpendicular wall it is independent of the normal coordinate.
    The even reflected convention thus preserves these bounds.
    There are $O \( m^2 \| X \| \)$ sites in $D$, $O \( m \| X \| \)$ boundary edges,
    and $O \( \| X \| \)$ blocks. For the quantities in the ordinary regulator of [16] Equation (4.10),
    these counts give
  $ g_D \( lambda_(upright("ext")) \) + P_m \( D \, lambda_(upright("ext")) \) +
    T_m \( D \, lambda_(upright("ext")) \) lt.eq C \| X \| . $
  Trying $alpha lambda_(upright("ext"))$ in the open observation minimum, with zero observation residual, also gives
  $ E_D^0 \( B_s alpha lambda_(upright("ext")) \) lt.eq C \| X \| . $
  Write $V_m^(\( h \))$ for (42) with coefficient $h$. Quadratic Cauchy–Schwarz and the optimized form of $V$ in
    [16] Equation (9.16), using its open-energy bound from [16] Lemma 9.2, now give
  $ W_m^kappa \( X \, psi + lambda_(upright("ext")) \) & lt.eq e^(C \| X \|) W_m^(kappa') \( X \, psi \) \,\
e^(V_m^(\( h_(*) \)) \( X \, psi + lambda_(upright("ext")) \)) & lt.eq
  e^(C \| X \|) e^(V_m^(\( h'_(*) \)) \( X \, psi \)) $
  for the reserved admissible $kappa' > kappa$ and $h'_(*) > h_(*)$. Common values do not affect either regulator.
    The stronger ordinary weight, fixed before $R$, pays $e^(C \| X \|)$ on passing to the sector weight.
    This proves the small norm bound also on those filled entries.
  The scalar and subset identities, the fully occupied label support,
    and the copy identities were established by the finite construction.
    The estimates now justify their integration and give all claimed norms.
    Increasing the fixed $R$ makes $C e^(- c R)$ smaller than any of the prescribed activity balls.
    The finite threshold is then chosen, and the fixed-geometry limits make the proof valid for every sufficiently
    large admissible $s$. This completes the theorem. ◻
]

== 5 The critical bulk trajectory <sec:trajectory>

We determine the gradient singleton to an error summable in the center calculation.
  The starting scale in Section 4 depends on the target size.
  We therefore first control each finite history by physical torus observables,
  and then compare histories where their absolute scales overlap.

Fix the block ratio $L$, the activity weights, and the regulator reserves as in Section 4.
  Choose the entry parameter $R$ sufficiently large, and put $P = R^5$.
  For a future center observable $M_(L^N)$, use one entry for all integer targets $2^k lt.eq N < 2^(k + 1)$.
  For each sufficiently large $k$, choose a permitted cell side $s_k asymp 2^k$ such that

#[#set math.equation(numbering: n => "(91)")
 $ m_k = q R s_k = L^(j_0 \( k \)) \, wide j_0 \( k \) = O \( k \) . $ <trj:starts>]

The constant in $asymp$ may depend on the fixed parameters.
  The divisibility in the entry construction permits this choice:
  consecutive permitted sides have the fixed ratio $L$. The cell and entry sides $s_k \,
  m_k asymp N$ are lattice lengths; their logarithmic entry index is only $j_0 \( k \) = O \( log N \)$.
  Coordinates with index $j$ live at side $L^j$, and step $j$ sends them to side $L^(j + 1)$.
  Thus $j$ is an absolute index, never reset at $j_0 \( k \)$.
  The useful running indices have $j asymp N$; the center calculation stops at $j' = N - O \( log N \)$,
  after order $N$ steps from the entry.

Write $cal(H)^(\( k \))$ for the plane history obtained by placing the untwisted entry activity wholly in the
  remainder and applying the weak map. Its unbalanced coordinates are
  $\( t_j^(\( k \)) \, z_j^(\( k \)) \, cal(R)_j^(\( k \)) \)$:
  the two singleton terms are $t_j^(\( k \)) e_B^0 \/ 2 + z_j^(\( k \)) c_B^alpha$,
  with the normalization in (45). We abbreviate the norm (43) at side $L^j$,
  using the observation regulator for $s_k$, by $parallel dot.op parallel_(j \, k)$.
  All constants below are uniform over these norms. Norms from two different histories will not be subtracted from
  each other.

#thm([Proposition 5.1.])[
  (Critical trajectory).  #emph[The entry choices can be made so that, for every fixed $0 < c < c' < 3$,
    uniformly for integers $c 2^k lt.eq j lt.eq c' 2^k$ as $k arrow.r oo$,
#[#set math.equation(numbering: n => "(92)")
 $ t_j^(\( k \)) & = frac(1, 2 \( log L \) j) + O #h(-0.16667em) (frac(log \( 2 + j \), j^2)) \,\
z_j^(\( k \)) & = O \( j^(- 1) \) \, wide parallel cal(R)_j^(\( k \)) parallel_(j \, k) =
  O \( j^(- 2) \) . $ <trj:unbalanced-conclusion>]

 The constants may depend on $c \, c'$ and the fixed map parameters.
   In particular the assertion applies at the stop $j' = N - O \( log N \)$ in the history chosen for $2^k lt.eq
   N < 2^(k + 1)$.]
] <trj:trajectory>

=== 5.1 Analytic coordinates and a coefficient estimate <analytic-coordinates-and-a-coefficient-estimate>

We state precisely the analytic part of the companion recursion used here.
  Within one history omit its superscript $k$. Write $Phi_j$ for the complete normalized unbalanced plane weak map
  on the additive coordinates above. It includes the scalar inverse decorations in the partition algebra of [16]
  Proposition 4.8, and $Phi_j \( 0 \) = 0$. At the fixed reference $a = 8 pi$, its linearization is

#[#set math.equation(numbering: n => "(93)")
 $ \( t \, z \, cal(R) \) mapsto #scale(x: 120%, y: 120%)[\(] t + P_j^t cal(R) \, med lambda_j z + P_j^z cal(R) \,
   med sans(C)_j cal(R) #scale(x: 120%, y: 120%)[\)] \, wide parallel sans(C)_j parallel lt.eq
   theta.alt_0 < 1 . $ <trj:triangular>]

The projections are bounded uniformly in $j \, k$; the omitted part is analytic with norm at most
  $C \( \| t \| + \| z \| + parallel cal(R) parallel \)^2$, with its Taylor derivative bounds.
  These statements are [16] Proposition 8.3, applied with the regulator of [16] Lemma 9.2.
  They concern activities at a fixed frequency. For a compatible torus the singleton coefficients copy the plane
  coefficients up to its stop, while its own remainder satisfies the same contraction and analytic bounds.
  No equality between the plane and torus remainders is part of this assertion.

For our polynomial shells, $lambda_j = L^2 e^(- a Gamma_(L^j) \( 0 \, 0 \) \/ 2)$. The continuum value is one.
  The fixed nearest-neighbor estimate in [16] Lemma 8.1 and its proof,
  with the independent microscopic piece omitted as in [16] Equation (9.11), gives

#[#set math.equation(numbering: n => "(94)")
 $ \| lambda_j - 1 \| lt.eq C L^(- c_1 j) \, wide ell_j := product_(h gt.eq j) lambda_h = 1 +
   O \( L^(- c_1 j) \) $ <trj:linear-error>]

after increasing the first absolute scale. Here and below an exponent may be decreased without changing notation.
  Put $sans(C)_(h : j) = sans(C)_(h - 1) dots.h.c sans(C)_j$ for $h > j$ and $sans(C)_(j : j) = I$.
  The balanced coordinates are exactly

#[#set math.equation(numbering: n => "(95)")
 $ T = t + sum_(h gt.eq j) P_h^t sans(C)_(h : j) cal(R) \, wide Z = ell_j z +
   sum_(h gt.eq j) ell_(h + 1) P_h^z sans(C)_(h : j) cal(R) . $ <trj:balance>]

The series have geometric operator tails. These are [16] Equations (8.17)–(8.18) at the marginal eigenvalue one.
  In particular the small linear errors in $lambda_j$ have already been balanced;
  they are not included in a nonlinear activity error. The formulas for the maps and the shells above a common
  absolute side are independent of the entry side. The entry-dependent regulator is used only to bound these formulas.

We use one neutral terminal response both for an exact Gaussian trajectory and for the physical histories below.
  Fix a sufficiently large dyadic $D_0$, exceeding all causal padding radii, and set

#[#set math.equation(numbering: n => "(96)")
 $ n_j = D_0 L^j . $ <trj:stopping-tori>]

For each trajectory used below, a torus stopped at side $L^j$ is initialized separately at its entry side on the
  compatible grid of side $n_j$. It has $D_0^2$ terminal blocks,
  and the fixed buffer makes its singleton coefficients copy the plane coefficients through that stop.
  This construction uses only the local map. The physical cutoff tori introduced below will also have to satisfy
  $n_j gt.eq s_k P$.

On this torus let $A$ be the unit-conductance Laplacian, and let $bb(E)_j^(upright("ter"))$ integrate a mean-free
  Gaussian $psi$ with covariance $C_(gt.eq L^j) = A^(+) sans(P)_(L^j)$ and an independent constant $theta$,
  uniform modulo $omega$; write $phi.alt = psi + theta$. Let $q_n \( x \) = cos \( 2 pi x_1 \/ n \)$,
  with the origin fixed by the compatible grid, and put $F_(n \, gamma) \( w \) = w gamma q_n$.
  Here $gamma$ ranges over a fixed compact subinterval of $\( 0 \, oo \)$.
  Since $n = n_j = D_0 L^j$, the field norms of (41) satisfy $sup_(gamma \, X) parallel gamma q_(n_j)
  parallel_(L^j \, D_(L^j) \( X \)) lt.eq C$. Choose a fixed complex source disk $\| w \| <
  w_(upright("ter"))$ with $w_(upright("ter")) C < h_0$ and a fixed strict margin.
  All energy pairings involving complex sources below are the complex bilinear extensions of the real lattice
  pairing. Thus $chevron.l F_(n \, gamma) \( w \) \, A F_(n \, gamma) \( w \) chevron.r =
  w^2 gamma^2 chevron.l q_n \, A q_n chevron.r$.

At this fixed grid, and for each entry regulator separately,
  let $K$ range over complex local $omega$-periodic analytic activities whose field dependence has the support
  collars in Proposition 7. Write its unbalanced coordinates as $\( t \, z \, cal(R)^(upright("tor")) \)$,
  and use the open complex ball $nu = \| t \| + \| z \| + parallel cal(R)^(upright("tor")) parallel <
  rho_(upright("ter"))$, with the current torus norm for that entry.
  All activity variations below are taken within one such space.
  The finite subset sum and the source Taylor series controlled by $h_0$ make $bb(E)_j^(upright("ter"))
  cal(Z)_(L^j) \( K \; phi.alt + F_(n_j \, gamma) \( w \) \)$ jointly analytic in the activity coordinates and
  $w$. Its absolute expansion on the fixed $D_0^2$-block grid bounds its difference from one by $C D_0^2 nu$,
  uniformly on the source disk. Choose $C D_0^2 rho_(upright("ter")) < 1 \/ 2$.
  Both the shifted and unshifted integrals are then nonzero, so define

#[#set math.equation(numbering: n => "(97)")
 $ cal(W)_j \( K \; F \) =
   log
   frac(bb(E)_j^(upright("ter")) cal(Z)_(L^j) \( K \; phi.alt + F \), bb(E)_j^(upright("ter")) cal(Z)_(L^j) \(
   K \; phi.alt \)) . $ <trj:neutral-response>]

The common phase has the same normalized law in both integrals,
  and the logarithm takes the branch equal to zero at $F = 0$.
  On fixed smaller concentric activity and source domains, joint Cauchy bounds control every fixed input and
  source derivative uniformly in the entry and stop. The tubes below lie in such an inner activity ball;
  its convexity keeps the segments between actual and pure states inside the larger analytic domain.

For the half-period action $\( cal(S) K \) \( X \, phi.alt \) = K \( X \, phi.alt + omega \/ 2 \)$,
  applied to every constituent together, the activity ball is invariant.
  Changing the common phase in both integrals gives $cal(W)_j \( cal(S) K \; F \) = cal(W)_j \( K \; F \)$.
  On the inner domains the terminal expansion gives, with two source derivatives,

#[#set math.equation(numbering: n => "(98)")
 $ cal(W)_j \( K \; F_(n_j \, gamma) \( w \) \) & = t / 2 chevron.l F_(n_j \, gamma) \( w \) \,
   A F_(n_j \, gamma) \( w \) chevron.r + O \( parallel cal(R)^(upright("tor")) parallel + nu^2 \) \,\
partial_w^2 cal(W)_j \( K \; F_(n_j \, gamma) \( w \) \)\|_(w = 0) & = kappa_(n_j \, gamma) t +
  O \( parallel cal(R)^(upright("tor")) parallel + nu^2 \) \,\
kappa_(n \, gamma) & = gamma^2 chevron.l q_n \, A q_n chevron.r =
  2 gamma^2 n^2 sin^2 \( pi \/ n \) asymp 1 . $ <trj:neutral-readout>]

In particular this reads the actual unbalanced gradient $t$.
  To obtain the expansion, retain the terms linear in $K$ in the terminal subset sum.
  The centered Gaussian removes the cross term in the gradient energy,
  and the common phase removes the fundamental singleton even after the shift.
  The linear remainder costs its norm; the remaining terms cost $O \( nu^2 \)$ by the finite block count and the
  regulator reserve. This is the calculation in [16] Equations (10.2)–(10.3), here for the specified first cosine.

For each chosen entry side there is also an exact Gaussian trajectory.
  At side $m$, for every nonempty polymer $X$ connected in the subset convention,
  define the local occupied-component input by

$ g_B \( d \, phi.alt \) = e^(d e_B^0 \( phi.alt \) \/ 2) - 1 \, wide K_m^g \( X \, phi.alt \; d \) =
  product_(B in X) g_B \( d \, phi.alt \) . $

For every occupied set $V$, the product over its components is $product_(B in V) g_B$.
  Hence on each finite grid $cal(Z)_m \( K_m^g \; phi.alt \) = product_B \( 1 + g_B \) =
  exp { d sum_B e_B^0 \( phi.alt \) \/ 2 }$. Use the same local input on the plane and compatible tori.
  With the fixed activity weights, a common sufficiently small $d$-disk makes this an allowed analytic input:
  its linear term is the singleton $d e_B^0 \/ 2$, and its remaining singleton and multi-block terms have norm
  $O \( d^2 \)$. Every factor is invariant under common field translations,
  so the map preserves the vanishing of all charged coordinates.
  Denote the balanced gradient, unbalanced gradient, and unbalanced remainder at scale $j$ by $T_j^g \( d \)$,
  $t_j^g \( d \)$, and $cal(R)_j^g \( d \)$. On a fixed complex disk,
  uniformly in all sufficiently large entry sides and all later steps,

#[#set math.equation(numbering: n => "(99)")
 $ T_j^g \( d \) = d + O \( d^2 \) \, wide Z_j^g \( d \) = 0 \, wide parallel cal(R)_j^g \( d \) parallel lt.eq
   C \| d \|^2 . $ <trj:gaussian-curve>]

The bounds are analytic, the functions $T_j^g$ have inverses on a common smaller disk,
  and the step carries the point with parameter $d$ to the point with that same parameter.
  The fixed-entry curve is [16] Lemma 10.3; we record why its estimates are uniform as the entry side varies.
  For entry side $m$ and each stop $j$, let $K_(j \| j)^(g \, upright("tor")) \( d \)$ be the terminal activity of
  the separately initialized pure torus. Apply the exact local-map identities to $phi.alt + F$, where $F =
  F_(n_j \, gamma) \( w \)$. The field-independent extraction factors cancel in (97).
  The shells from $m$ to $L^j$ and the terminal covariance telescope to $C_(gt.eq m)$ on mean-free modes,
  and $sum_B e_B^0 \( phi.alt \) = chevron.l phi.alt \, A phi.alt chevron.r$ on the torus.
  Gaussian completion thus gives, while the terminal state lies in the readout ball, the exact identity

#[#set math.equation(numbering: n => "(100)")
 $ cal(W)_j \( K_(j \| j)^(g \, upright("tor")) \( d \) \; F \) = d /
   2 chevron.l A^(1 \/ 2) F \, \( I - d A^(1 \/ 2) C_(gt.eq m) A^(1 \/ 2) \)^(- 1) A^(1 \/ 2) F chevron.r .
   $ <trj:pure-response>]

The gradient energy and the mean-free shift are insensitive to the common constant.
  On mean-free modes $A^(1 \/ 2) C_(gt.eq m) A^(1 \/ 2) = sans(P)_m$ lies between zero and $I$.
  For $\| d \| < delta < 1$ the Gaussian determinant is nonzero and cancels in the normalized ratio,
  while the resolvent has norm at most $\( 1 - delta \)^(- 1)$.
  The second source derivative of (100) is consequently $O \( \| d \| \)$, uniformly in the entry and stop.
  These pure tori are available at every stop after their entry; they do not use the physical cutoff sewing.

Before a first exit from a ball of radius $rho$, the bounded map gives every candidate plane and stopped-torus
  state full size at most $C rho$. Choose $rho$ so that these states lie inside the fixed inner readout ball.
  Remainder contraction bounds both the plane and stopped-torus remainders by $C \( \| d \|^2 + rho^2 \)$.
  In this pure case the fundamental coordinate vanishes. Comparing the second derivative in (100) with (98),
  whose multiplier is bounded below and whose scalar is the plane $t_j^g$ by copying, gives

$ \| t_j^g \| lt.eq C #scale(x: 120%, y: 120%)[\(] \| d \| +
  parallel cal(R)_(j \| j)^(g \, upright("tor"))
  parallel + \( \| t_j^g \| + parallel cal(R)_(j \| j)^(g \, upright("tor")) parallel \)^2
  #scale(x: 120%, y: 120%)[\)] lt.eq C \( \| d \| + rho^2 \) . $

The candidate full-size bound makes the squared term $O \( rho^2 \)$.
  The constants are independent of the entry and stage. Choose $rho$ small and then one disk radius $delta >
  0$ so that these bounds exclude every first exit for $\| d \| lt.eq delta$.
  Every finite composition is consequently analytic and uniformly bounded on that common disk.
  The triangular linearization gives $cal(R)_j^g \( 0 \) = \( cal(R)_j^g \)' \( 0 \) = 0$ and $T_j^g \( 0 \) =
  0 \, \( T_j^g \)' \( 0 \) = 1$. Cauchy estimates on a smaller common disk give (99) and its derivative bounds;
  one further shrink gives the common inverse disk. This is the no-exit mechanism in [17] Section 5.4,
  proof of Proposition 5.1, using here only the neutral contraction at the marginal parameter.

Define, for this history,

#[#set math.equation(numbering: n => "(101)")
 $ u_j = \( T_j^g \)^(- 1) \( T_j \) \, wide Q_j = cal(R)_j - cal(R)_j^g \( u_j \) \, wide Q_j = Q_(e \, j) +
   Q_(o \, j) \, $ <trj:normal-coordinates>]

where $Q_e \, Q_o$ are the even and odd parts under the common shift $phi.alt mapsto phi.alt + pi \/ alpha$.
  The pure Gaussian points in these coordinates are $\( u \, 0 \, 0 \)$ with $u$ unchanged by the step.
  Write $Y_j = \| Z_j \|$.

#thm([Lemma 5.2.])[
  (Analytic parity interface).  #emph[There are a fixed small tube, $theta.alt < 1$, and $C < oo$,
    uniform over the entry sides above, on which the exact map satisfies
#[#set math.equation(numbering: n => "(102)")
 $ u_(+) - u =  & - H_j Z^2 +
   O #scale(x: 120%, y: 120%)[\(] \( \| u \| + Z^2 \) \( Z^2 + parallel Q_e parallel \) +
   parallel Q_e parallel^2 + parallel Q_o parallel \( \| Z \| + parallel Q_o parallel \)
   #scale(x: 120%, y: 120%)[\)] \,\
Z_(+) - Z =  & - b_j u Z + O #scale(x: 120%, y: 120%)[\(] \( u^2 + Z^2 + parallel Q_e parallel \) \|
  Z \| + \( \| u \| + Z^2 + parallel Q_e parallel + parallel Q_o parallel^2 \) parallel Q_o parallel
  #scale(x: 120%, y: 120%)[\)] \,\
parallel Q_(e \, +) parallel lt.eq  & theta.alt parallel Q_e parallel + C \( \| Z \| + parallel Q_o parallel \)^2 \,\
parallel Q_(o \, +) parallel lt.eq  & theta.alt parallel Q_o parallel +
  C \( \| u \| + Z^2 + parallel Q_e parallel \) \| Z \| . $ <trj:u-map>]

 The error terms have the differentiated Taylor bounds of the displayed orders.
   The coefficients, independent of the entry side at a common absolute $j$,
   obey fixed positive upper and lower bounds for sufficiently large $j$. Their limits are $H > 0$ and
#[#set math.equation(numbering: n => "(103)")
 $ b_(*) = frac(a, 4 pi) log L = 2 log L . $ <trj:b-value>]

]
] <trj:parity-interface>

#proof[
  This is the analytic consequence of [16] Lemma 10.6 used here.
    That lemma is formulated for the companion’s true-reference histories; its proof uses only (93),
    the bounded changes (95)–(101), and half-period symmetry.
    All those hypotheses hold for the entry activities of Section 4.
    The diagonal balanced linearization removes linear forcing of $Z$ into the remainder.
    The exact Gaussian curve removes every nonlinear term that would remain with $Z = Q = 0$.
    Parity makes the first coordinate even and the second odd;
    it gives the two displayed quadratic terms and the indicated orders for the two remainder parts.
    Terms linear in a remainder with a small coefficient are absorbed in $theta.alt < 1$.
    This recovers precisely (102)–(102) as estimates on the analytic activity map.
    More specifically, $u = T + O \( T^2 \)$ depends only on $T$, $Q = cal(R) + O \( u^2 \)$,
    and $Z$ is unchanged, while the balanced scalar linear rows contain no remainder.
    These substitutions can alter a pure quadratic gradient term but cannot alter the $Z^2$ and $u
    Z$ coefficients. Thus $H_j = - b_j^(z z)$ and $b_j = - b_j^(t z)$ are the balanced map coefficients of [16]
    Proposition 8.5; their signs and limits, and (103), follow there and in [16] Equation (8.22). ◻
]

For the precision in Proposition 14 we need a rate for these two map coefficients.
  The next estimate is a refinement of the finite-depth argument in the proof of the cited proposition.

#thm([Lemma 5.3.])[
  (Rate for the quadratic coefficients).  #emph[For the fixed nearest-neighbor reference and fixed $L$,
    there is $C < oo$ such that, at every sufficiently large absolute index,
#[#set math.equation(numbering: n => "(104)")
 $ \| H_j - H \| + \| b_j - b_(*) \| lt.eq C \( 1 + j \)^(- 2) . $ <trj:coefficient-bound>]

]
] <trj:coefficient-rate>

#proof[
  A quadratic coefficient is the Hessian of the normalized unbalanced map followed by the linear balancing row at
    the output. We make the truncation of that row explicit. Let $pi_t \, pi_z \,
    pi_(cal(R))$ be the coordinate projections, and let $upright(bold(t))_j = \( 1 \, 0 \, 0 \)$,
    $upright(bold(z))_j = \( 0 \, ell_j^(- 1) \, 0 \)$ be the unbalanced inputs corresponding to unit balanced
    scalar directions at zero remainder. All derivatives of $Phi_j$ here are at zero in the additive weak
    coordinates $t e_B^0 \/ 2 + z c_B^alpha + cal(R)$. They include the regrouping by the scalar decorations
    $d_B = \( 1 + a_B \)^(- 1) - 1$ already inside the normalized map;
    the external extracted product is not an additional coordinate row.
    The exponential initialization above is used for the separate Gaussian curve.
    The operators $P_j^t \, P_j^z \, sans(C)_j$ are the three components of $D_(cal(R)) Phi_j \( 0 \)$ in (93).
  For an absolute output index $i$ and $h gt.eq 0$, set
  #[#set math.equation(numbering: n => "(105)")
   $ sans(S)_(i \, h)^t = sum_(r = 0)^(h - 1) P_(i + r)^t sans(C)_(i + r : i) \, wide sans(S)_(i \, h)^z =
     sum_(r = 0)^(h - 1) ell_(i + r + 1) P_(i + r)^z sans(C)_(i + r : i) \, $ <trj:truncated-balance>]
  with empty sums zero. The exact truncated coefficients are
  #[#set math.equation(numbering: n => "(106)")
   $ H_(j \, h) & = - 1 / 2 \( pi_t + sans(S)_(j + 1 \, h)^t pi_(cal(R)) \) D^2
     Phi_j \( 0 \) \[ upright(bold(z))_j \, upright(bold(z))_j \] \,\
b_(j \, h) & = - \( ell_(j + 1) pi_z + sans(S)_(j + 1 \, h)^z pi_(cal(R)) \) D^2
  Phi_j \( 0 \) \[ upright(bold(t))_j \, upright(bold(z))_j \] . $ <trj:truncated-coefficients>]
  Here $D^2 Phi_j \( 0 \)$ is the bilinear Hessian: the $Z^2$ Taylor coefficient has the factor $1 \/ 2$,
    whereas the mixed $T Z$ coefficient does not. The chain rule for the two linear balancing maps,
    followed by the coefficient identification in Lemma 15, gives these formulas from [16] Proposition 8.5.
    At $h = 0$ they retain the direct Hessian row; for $h > 0$ the last future projection is $P_(j + h)$.
    Thus the chain of local $sans(C)$ and $P$ operations uses shell indices $j \, dots.h \, j + h$.
    Each $ell$ is retained as one scalar factor; its infinite product is controlled separately by (94).
  Let $q_(j \, h)$ denote either coefficient in (106), with the same choice throughout.
    The geometric tail of the output row gives $\| q_j - q_(j \, h) \| lt.eq C theta.alt_0^h$.
    For fixed $h$, the finite-depth convergence in the proof of [16] Proposition 8.5 gives $q_(oo \, h) :=
    lim_(j arrow.r oo) q_(j \, h)$. Its termwise continuum evaluation is the comparison used below.
    Taking the fixed-depth limit in the same geometric tail bound gives $\| q_oo - q_(oo \, h) \| lt.eq
    C theta.alt_0^h$, where $q_oo$ is $H$ or $b_(*)$. This definition uses no continuum activity map.
  Evaluate the shells separately along this chain, so only the fixed scale ratio $L$ occurs;
    no kernel estimate at the growing ratio $L^h$ is needed. For a shell at side $L^(j + r)$, $0 lt.eq r lt.eq h$,
    use scaled jets $\( L^(j + r) \)^d nabla^d Gamma_(L^(j + r))$.
    The Fourier proof of [16] Lemma 8.1, with the factor for the independent microscopic piece omitted,
    gives a uniform bound for these jets and an error $C L^(- c_2 j)$ against their continuum jets,
    through order eight. The error is uniform in the spatial arguments:
    the proof bounds the absolute Fourier integral after splitting at a small power of the side.
    The Wick entries below use total difference order at most two,
    so their one further spatial derivative is among these bounded orders.
    The same proof gives (94); hence replacing any balance multiplier $ell_(j + r)$ or its inverse by one costs $C
    L^(- c_2 j)$.
  Here is a bound for the complexity of the truncated expression.
    At Taylor order two in the activity inputs, the exact algebra [16] Proposition 4.8 uses only products of at
    most two singleton inputs and the degree at most two terms of each scalar inverse.
    The resulting supports have a fixed maximum number of blocks.
    Every subsequent propagation in the projection series is linear in that quadratic image.
    A residual keeps its coarse closure and a localized piece is a singleton; $\| overline(X) \| lt.eq \| X \|$.
    The maximum block cardinality therefore remains fixed. At each step, for a prescribed output root,
    there are at most $C_L$ possible shapes, placements, and choices of linear localization.
    This accounts for the block branches even when all pieces in a subtraction are kept separately.
  The field dependence before the first such projection is a polynomial in gradients of degree at most four times
    at most two point characters. Neutral localization evaluates at zero and takes at most two affine derivatives;
    fundamental localization evaluates on a constant and keeps a character.
    Thus propagation either keeps a dependence of this form or replaces it by a scalar,
    a quadratic gradient polynomial, or a character. Gaussian expectations introduce only covariances of these
    jets and covariances with the characters. For example, with $d lt.eq 4$,
    real Gaussian linear forms $L_r zeta$, and a real linear character argument $V$,
  $ bb(E) #h(-0.16667em) [product_(r = 1)^d L_r zeta thin e^(i V)] =
    e^(- "Var" \( V \) \/ 2) sum_pi product_({ r \, s } in pi) "Cov" \( L_r zeta \, L_s zeta \)
    product_(r upright(" unpaired")) i "Cov" \( L_r zeta \, V \) \, $
  where $pi$ ranges over partial pairings. This formula also covers constant and affine backgrounds after
    expansion. It involves no inverse of a covariance matrix.
    Phase integration retains only the charges of the at most two original characters.
    Each step adds a bounded number of polynomial or covariance factors to a term already computed;
    retaining earlier site sums as coefficient indices, a product has at most $C \( h + 1 \)$ factors.
    Distributing all Wick pairings and Taylor choices, as well as the block branches,
    is bounded by $exp { C_L \( h + 1 \)^2 }$. This generous bound also covers repeated expansion of the
    accumulated coefficients. The variance exponentials in the displayed formula have modulus at most one,
    and $\| e^(- v \/ 2) - e^(- w \/ 2) \| lt.eq \| v - w \| \/ 2$ for $v \, w gt.eq 0$.
  All remaining spatial indices are normalized sums on half-open rectangular blocks.
    For the energy singleton write, for example, $sum_x \( nabla phi.alt_x \)^2 =
    L^(- 2 j) sum_x \( L^j nabla phi.alt_x \)^2$, so it has the same area normalization as the character
    singleton. Localization adds sums of that form and bounded block assignments.
    Expressing directions or coordinates from one of the first $h +
    1$ scales in another scale costs at most a fixed power of $L^h$.
    Consequently each unmultiplied entry, and its rectangle-wise Lipschitz bound in one scaled spatial variable,
    is at most $exp { C_L \( h + 1 \) }$. This follows from the jet bounds above for covariance entries,
    and directly for the affine values. A fixed neighbor stencil moves a point by one mesh step;
    its comparison uses the bound for the normalized difference jet and one spatial derivative of the limiting
    jet, rather than a derivative of the lattice error. Rectangular Riemann summation therefore costs one mesh
    step at a boundary or in a Lipschitz estimate. There are at most $C \( h + 1 \)$ successive normalized sums in
    a term, their total masses are bounded by the preceding scale factors, and the smallest side is $L^j$.
  Applying product differences to at most $C \( h + 1 \)$ factors and then performing these Riemann comparisons
    one index at a time proves, for each of the two truncated coefficients,
  #[#set math.equation(numbering: n => "(107)")
   $ \| q_(j \, h) - q_(oo \, h) \| lt.eq L^(- c_3 j) exp { C_L \( h + 1 \)^4 } . $ <trj:finite-depth-error>]
  Indeed the elementary jet or mesh error supplies $L^(- c_3 j)$; the bounds for products, branches,
    coordinate changes, and the finitely many rectangle boundaries just proved are each bounded by an exponential
    of a polynomial of degree at most two in $h + 1$. Their product is bounded by the displayed larger exponent.
    Balance multiplier errors from (94) satisfy the same bound.
  Take $h = ceil.l C_4 log \( 2 + j \) ceil.r$, with $C_4$ large enough that $theta.alt_0^h lt.eq
    C \( 1 + j \)^(- 3)$. The right side of (107) is at most $C \( 1 + j \)^(- 3)$ for all sufficiently large $j$.
    Adding the two geometric tails proves (104), after enlarging $C$ for finitely many indices.
    This argument uses only the explicit Gaussian kernels and the finite-order local algebra.
    No convergence rate for a height scaling limit has been used. ◻
]

=== 5.2 Physical constraints from stopping tori <physical-constraints-from-stopping-tori>

For history $k$, the valid physical stops on the compatible cell and block grids are

#[#set math.equation(numbering: n => "(108)")
 $ cal(J)_k = { j in bb(Z) : j_0 \( k \) lt.eq j lt.eq 4 dot.op 2^k \, med n_j gt.eq s_k P } . $ <trj:valid-stops>]

For every $j in cal(J)_k$, initialize the exact cutoff torus of side $n_j$ separately at $m_k$ and run it to side
  $L^j$. At a stage $j_0 \( k \) lt.eq i lt.eq j$, its scalar coordinates are the plane values $t_i^(\( k \)) \,
  z_i^(\( k \))$, by copying their padded neighborhoods. Write $cal(R)_(i \| j)^(upright(t o r \, \( k \)))$ for
  its own remainder. Its norm is the torus version of $parallel dot.op
  parallel_(i \, k)$ with the same entry regulator. We suppress $k$ while working within one history.
  No torus is continued from a different size. When $n_j < s_k P$ only plane steps are needed.
  There are at most $max { 0 \, ceil.l log_L \( R^4 \/ \( D_0 q \) \) ceil.r }$ of them.
  The bounded map amplifies the entry norm $C e^(- c R)$ by only $R^(O \( 1 \))$ on these steps,
  so increasing $R$ controls them. These are the stopping conventions and the initial estimate in [16] Section 10.1.

Let $bb(E)_n^(upright("tor"))$ denote the original periodic Bessel height law on $\( bb(Z) \/ n bb(Z) \)^2$,
  with its constant modulo $2 pi$. Put $f \( x \) = cos \( 2 pi x_1 \)$ on the unit torus and

#[#set math.equation(numbering: n => "(109)")
 $ frak(g) = chevron.l f \, \( - Delta_(bb(T)^2) \)^(- 1) f chevron.r > 0 \, wide x_n = chevron.l h \,
   n^(- 2) f \( dot.op \/ n \) chevron.r \, wide X_(n \, s) = chevron.l y \, f_(n \, s) chevron.r \, $ <trj:probes>]

where $f_(n \, s) \( Q \) = \( s \/ n \)^2 f \( x_Q \/ n \)$.
  Here $x_Q$ is the arithmetic center of the primary sites of $Q$, in the same coordinates as $q_n$:
  for $Q = v_Q + { 0 \, dots.h \, s - 1 }^2$, $x_Q = v_Q + frac(s - 1, 2) \( 1 \, 1 \)$.
  Both tests have zero total. Also write $chi_(n \, s) = e^(i macron(y))$,
  where $macron(y)$ is the mean of the cell observations, and write $e^(i macron(h))$ for the uniform height character.

#thm([Lemma 5.4.])[
  (Torus height diagnostics for the XY input).  #emph[Along the compatible even tori $n arrow.r oo$,
#[#set math.equation(numbering: n => "(110)")
 $ bb(E)_n^(upright("tor")) e^(w x_n) & arrow.r e^(a frak(g) w^2 \/ 2) \,\
bb(E)_n^(upright("tor")) \[ e^(i macron(h)) e^(w x_n) \] -
  bb(E)_n^(upright("tor")) e^(i macron(h)) thin e^(a frak(g) w^2 \/ 2) & arrow.r 0 . $ <trj:torus-laplace>]

 The first assertion includes convergence of every fixed moment,
   and both assertions are locally uniform in complex $w$. They also hold for $X_(n \, s) \,
   chi_(n \, s)$ when $s \/ n arrow.r 0$. For any prescribed small error in a fixed finite set of these
   diagnostics, one can first take $P$ sufficiently large and then $s$ sufficiently large so that the error is
   small uniformly over compatible $n gt.eq s P$.]
] <trj:physical-torus>

#proof[
  We first prove the mean-free assertion using the XY height inputs.
    For a smooth periodic shift $v$ let $X_n^v = chevron.l h \, A_(bb(T)_n) v \( dot.op \/ n \) chevron.r$,
    the sum of $nabla h thin nabla v \( dot.op \/ n \)$ over primary edges.
    Cut the torus into a fixed array of macroscopic rectangles and keep the internal parts of this test.
    The cross-seam part has $O \( n \)$ edges with coefficients $O \( n^(- 1) \)$,
    with constants depending on the fixed array, and hence has reference cost $O \( n^(- 1) \)$.
    The reference-cost bound and centered comparison of [17] Lemmas 2.2–2.3,
    followed by the free rectangle limits [17] Theorem 2.4, give
  $ limsup_n "Var"_(upright("tor")) X_n^v lt.eq a integral_(bb(T)^2) \| nabla v \|^2 . $
  One can equivalently subdivide further and approximate the internal gradients by constants:
    the additional squared cost is controlled by their modulus of continuity,
    exactly as in the partial-test argument of that theorem. Thus the inequality is a quadratic-form bound for
    every finite list of smooth shifts.
  If $v$ has support compactly contained in an unwrapped rectangle,
    add a positive-width primary pinned rim inside that rectangle, separated from the support and surrounding it.
    The test is supported inside the rim, and the fixed rim separates that part of the law from the rest of the
    torus. Centered pin comparison bounds its original variance from below by the pinned variance.
    The mixed limit [17] Theorem 3.1 gives for the latter $a integral \| nabla v \|^2$:
    in its pinned energy space, the Riesz representative of the weak Laplacian test is $v$ itself.
    Such shifts therefore attain the upper bound. On any convergent finite covariance subsequence,
    the defect from the upper quadratic form is positive semidefinite.
    A vector with zero defect diagonal has zero defect pairing with every vector, by Cauchy–Schwarz for that form.
    A partition of unity expresses any smooth torus shift as a finite sum supported in unwrapped rectangles.
    The upper bound is consequently attained by every smooth shift.
  For the Laplace lower bound use the centered inequality $log bb(E) e^X gt.eq
    "Var" \( X \) \/ 2$ in [17] Lemma 2.2. For the upper bound,
    apply Hölder to the internal and seam parts with a fixed exponent $p > 1$.
    Releasing the seams increases the centered transform of the internal part and makes the rectangle factors
    independent. To apply the free rectangle limits to the internal part,
    fix a further macroscopic subdivision and approximate $nabla v$ by a constant on each rectangle.
    The squared reference cost of the difference is bounded by the squared modulus of continuity of $nabla v$;
    the new seam part again has vanishing cost as $n arrow.r oo$.
    The free rectangle and partial-test Laplace argument in [17] Theorem 2.4 applies to these constant-gradient
    tests. The other Hölder factor tends to one by the primary reference-cost exponential bound and the vanishing
    seam cost. Take the lattice limit first, then let the subdivision mesh tend to zero.
    The upper limit is at most $p a integral \| nabla v \|^2 \/ 2$; finally let $p arrow.b 1$.
    Applying this argument to real linear combinations and using the uniform fixed-argument exponential bounds
    gives Gaussian joint limits and all fixed moments. The sampled cosine is the weak Laplacian of a smooth
    periodic cosine up to a vanishing reference-energy error (or use its exact discrete eigenvalue $4
    sin^2 \( pi \/ n \)$). This proves (110) and its moment assertion.
  For completeness, Gaussian convergence of the mean-free test alone does not imply (110).
    Use the chain subdivision underlying [17] Lemma 2.2 on each fixed primary torus, with pinned representatives.
    For two independent fields put $S = h_1 + h_2$, $D = h_1 - h_2$.
    Given their common parity class modulo $4 pi bb(Z)$, $S \,
    D$ are independent with the same centered quadratic law. With $M$ subdivision bonds on each primary edge,
    write $x_(n \, M)$ for the same test evaluated on the primary heights and $macron(h)_(upright("prim"))$ for
    their uniform mean. Set $frak(F)_(n \, M) \( t \) = bb(E) e^(i macron(h)_(upright("prim")) + i t x_(n \, M))$.
    If $V$ is the conditional second moment of the test of $S$, the replica identity [17] Equation (2.12) gives
  $ bb(E) V = 2 "Var" \( x_(n \, M) \) \, wide "Var" V = 2 kappa_4 \( x_(n \, M) \) . $
  Differentiation in the two original replicas and conditioning give
  $ - 2 { frak(F)_(n \, M) frak(F)''_(n \, M) - \( frak(F)'_(n \, M) \)^2 } =
    2 "Var" \( x_(n \, M) \) frak(F)_(n \, M)^2 + cal(E)_(n \, M) \( t \) \, $
  where on real $t$ the error is bounded by $sqrt(2 kappa_4 \( x_(n \, M) \))$.
    On compact complex sets the same bound has a fixed exponential-moment factor, by Cauchy–Schwarz.
    First pass through the chain limit at this fixed graph, as in the cited identity.
    This gives the analogous bound for $frak(F)_n \( t \) = bb(E)_n^(upright("tor")) e^(i macron(h) + i t x_n)$.
    Then (110) and fourth-moment convergence show that every locally uniform entire subsequential limit $frak(F)$
    satisfies
  $ frak(F) frak(F)'' - \( frak(F)' \)^2 = - a frak(g) frak(F)^2 . $
  The required entire bounds follow from the primary reference costs.
    If $frak(F)$ is not zero identically, solving this equation where $frak(F) eq.not
    0$ and then continuing analytically shows that $frak(F)$ is an exponential quadratic and has no zero.
    Translation by half the torus sends the cosine test to its negative and preserves the mean character;
    hence $frak(F)' \( 0 \) = 0$. We obtain $frak(F) \( t \) = frak(F) \( 0 \) e^(- a frak(g) t^2 \/ 2)$.
    The identically zero limit obeys the same equality. Continuation to $t = - i w$ proves (110).
    This is the replica argument of [16] Lemma 10.1, now justified for the Bessel law by the fixed-graph chain passage.
  Finally, the coefficient difference between the height part of $X_(n \, s)$ and $x_n$ is at most $C n^(- 2) s \/
    n$ at each site and has zero total. Since $parallel A_(bb(T)_n)^(+) parallel_(2 arrow.r 2) lt.eq C n^2$,
    its reference cost is at most $C \( s \/ n \)^2$. The observation-noise variance is also
    $O \( \( s \/ n \)^2 \)$, and its mean character is an independent positive factor
    $e^(- \( s \/ n \)^2 \/ 2)$. Reference-cost exponential bounds and Cauchy–Schwarz control the resulting
    differences of transforms and fixed derivatives on compact sets by a quantity tending to zero with $s \/ n$.
    This proves the assertions for observations. Ordinary convergence in $n$, with $s \/ n lt.eq P^(- 1)$,
    proves the stated order of uniform choices. It asserts no rate for that convergence. ◻
]

For $j in cal(J)_k$, let $hat(bb(E))_(j \, k)$ be the normalized cutoff expectation on the torus (96) in history
  $k$. The cutoff bound of Section 4, summed over the faces of these tori,
  changes bounded phase observables and the fixed smooth Laplace diagnostics by at most

#[#set math.equation(numbering: n => "(111)")
 $ delta_k lt.eq exp \( - c_5 4^k \) \, wide j lt.eq 4 dot.op 2^k \, $ <trj:cutoff-error>]

for large $k$. Indeed their log volume is $O \( 2^k \)$, while $s_k^2 asymp 4^k$.
  The same statement for the fixed source derivatives follows from the tilted estimate and its moment bound.

We now identify the physical Laplace correction with the neutral response (97).
  Let $K_(j \| j)^(upright("tor"))$ be the terminal activity at a valid stop,
  with remainder $cal(R)_(j \| j)^(upright("tor"))$, and set $nu_j = \| t_j \| + \| z_j \| +
  parallel cal(R)_(j \| j)^(upright("tor")) parallel$. On zero-total cell vectors the full reference observation
  covariance is $Sigma_(n \, s)^0 = I + a B_s A^(+) B_s^(*)$, and $v_(n \, s)^0 = chevron.l f_(n \, s) \,
  Sigma_(n \, s)^0 f_(n \, s) chevron.r$ is the reference variance of $X_(n \, s)$.
  Complete the source $w X_(n \, s)$ before the entry averaging.
  It contributes $e^(v_(n \, s)^0 w^2 \/ 2)$ and translates the observation argument of the entire interaction by
  $w Sigma_(n \, s)^0 f_(n \, s)$. Cell translation and reflection symmetry make this a first cell cosine.
  The corresponding microscopic first cosine has a nonzero cell average,
  so choose $F_(n \, s) \( w \)$ with $alpha B_s F_(n \, s) \( w \) = w Sigma_(n \, s)^0 f_(n \, s)$.
  The finite cosine sum shows that $F_(n \, s) \( w \) = w gamma_(n \, s) q_n$,
  with $gamma_(n \, s)$ in a fixed compact subinterval of $\( 0 \, oo \)$ when $n gt.eq s P$,
  after $P$ and the entry threshold are large. Choose the interval in (98) to contain these amplitudes.
  The exact map identities then give, uniformly on a fixed source disk,

#[#set math.equation(numbering: n => "(112)")
 $ log hat(bb(E))_(j \, k) e^(w X_(n_j \, s_k)) - 1 / 2 v_(n_j \, s_k)^0 w^2 & =
   cal(W)_j \( K_(j \| j)^(upright("tor")) \; F_(n_j \, s_k) \( w \) \)\
 & = 1 / 2 t_j chevron.l F_(n_j \, s_k) \( w \) \, A F_(n_j \, s_k) \( w \) chevron.r +
   O \( parallel cal(R)_(j \| j)^(upright("tor")) parallel + nu_j^2 \) . $ <trj:gradient-diagnostic>]

The first equality uses the same extraction scalars in numerator and denominator, so they cancel.
  The estimate includes two source derivatives. The uniform mean integral removes the fundamental term at linear
  order, and $chevron.l F_(n \, s) \( w \) \, A F_(n \, s) \( w \) chevron.r \/ w^2 arrow.r
  a frak(g)$ as $s \/ n arrow.r 0$. This is the physical use of (98); the finite cosine estimates,
  including their errors, are derived in the overlap comparison below.

There is also a mixed phase diagnostic; write $s = s_k$ in this paragraph.
  On the same activity ball and source disk, define the normalized phase functional

#[#set math.equation(numbering: n => "(113)")
 $ cal(C)_j \( K \; F \) =
   frac(bb(E)_j^(upright("ter")) \[ e^(i alpha theta) cal(Z)_(L^j) \( K \; phi.alt + F \) \],
   bb(E)_j^(upright("ter")) cal(Z)_(L^j) \( K \; phi.alt \)) . $ <trj:phase-functional>]

The inserted factor has modulus one, so the same terminal bounds give joint analyticity and uniform Cauchy bounds
  on the fixed inner domains. Changing the common phase by $omega \/ 2$ gives $cal(C)_j \( cal(S) K \; F \) = -
  cal(C)_j \( K \; F \)$; the denominator is invariant. Let $tau_(j \, s)$ be the variance of the integrated high
  mean in height units, including the mean observation noise.
  These means are independent of the retained mean and of the mean-free source.
  The factor $e^(tau_(j \, s) \/ 2)$ and its inverse are bounded.
  For the actual $K = K_(j \| j)^(upright("tor"))$, the completion in (112) identifies the full physical phase
  functional, after removal of the Gaussian prefactor, with $e^(tau_(j \, s) \/ 2)
  cal(C)_j \( K \; F_(n_j \, s) \( w \) \)$. This formula defines its analytic,
  odd extension to the activity ball. Subtracting the value at $w = 0$ gives

#[#set math.equation(numbering: n => "(114)")
 $ & e^(- v_(n_j \, s)^0 w^2 \/ 2) hat(bb(E))_(j \, k) \[ chi_(n_j \, s) e^(w X_(n_j \, s)) \] -
   hat(bb(E))_(j \, k) chi_(n_j \, s)\
 & wide = e^(tau_(j \, s) \/ 2) \[ cal(C)_j \( K \; F_(n_j \, s) \( w \) \) - cal(C)_j \( K \; 0 \) \]\
 & wide = z_j M_(j \, s) \( w \) + O \( parallel cal(R)_(j \| j)^(upright("tor")) parallel + nu_j^2 \) .
   $ <trj:mixed-diagnostic>]

The second equality is the terminal expansion, where

#[#set math.equation(numbering: n => "(115)")
 $ M_(j \, s) \( w \) = p_(j \, s) "ave"_x \( e^(- i alpha F_(n_j \, s) \( w \, x \)) - 1 \) \, wide p_(j \, s) =
   D_0^2 / 2 e^(tau_(j \, s) \/ 2 - a D_(upright("tail") \, j) \/ 2) . $ <trj:phase-multiplier>]

Here $D_(upright("tail") \, j)$ is the diagonal of the remaining mean-free field covariance.
  The average in (115) is over the microscopic torus sites. This is [16] Equation (10.4).
  To see the sign of its high-mean factor, averaging the interaction over an independent Gaussian constant
  multiplies its first Fourier coefficient by $e^(- tau_(j \, s) \/ 2)$.
  The physical mean insertion must undo that averaging, giving $e^(tau_(j \, s) \/ 2)$.
  Both $p_(j \, s)$ and its inverse are bounded. For a fixed small real $w eq.not 0$,
  the average in (115) stays strictly negative when $s \/ n_j$ is small,
  so $\| M_(j \, s) \( w \) \|$ is bounded below. In particular both scalar directions have nonzero diagnostic
  multipliers.

#thm([Lemma 5.5.])[
  (Finite-history confinement and vanishing).  #emph[For every sufficiently small prescribed tube,
    $R$ and the entry threshold can be chosen so that, for all sufficiently large $k$,
    every plane state through $j lt.eq 4 dot.op 2^k$ stays in that tube.
    For each $j in cal(J)_k$, the torus states at all stages $j_0 \( k \) lt.eq i lt.eq
    j$ stay in the corresponding small ball. For every fixed $0 < c < c' < 4$, as $k arrow.r oo$,
#[#set math.equation(numbering: n => "(116)")
 $ sup_(i in bb(Z) \, med j_0 \( k \) lt.eq i\
c 2^k lt.eq i lt.eq c' 2^k) #scale(x: 120%, y: 120%)[\(] \| t_i^(\( k \)) \| + \| z_i^(\( k \)) \| +
  parallel cal(R)_i^(\( k \)) parallel_(i \, k) #scale(x: 120%, y: 120%)[\)] & arrow.r 0 \,\
sup_(i in bb(Z) \, med j in cal(J)_k \, med j_0 \( k \) lt.eq i lt.eq j\
c 2^k lt.eq i lt.eq c' 2^k) #scale(x: 120%, y: 120%)[\(] \| t_i^(\( k \)) \| + \| z_i^(\( k \)) \| +
  parallel cal(R)_(i \| j)^(upright(t o r \, \( k \))) parallel #scale(x: 120%, y: 120%)[\)] & arrow.r
  0 . $ <trj:vanishing-ranges>]

]
] <trj:vanishing>

#proof[
  Write $epsilon$ for the entry norm, and call $\| t_j \| + \| z_j \| +
    parallel cal(R)_j parallel$ the plane full size and $\| t_i \| + \| z_i \| +
    parallel cal(R)_(i \| j)^(upright("tor")) parallel$ the full size at stage $i$ of a torus stopping at $j$.
    Use the first-exit argument of [16] Proposition 10.2 with the physical limits supplied by Lemma 17.
    We give the finite-history details. Before a possible first exit from a tube of radius $rho$,
    the separate remainder on a valid torus satisfies, by (93) and its nonlinear bound,
  $ parallel cal(R)_(j \| j)^(upright("tor")) parallel lt.eq C theta.alt^(j - j_0 \( k \)) epsilon + C rho^2 . $
  Terms linear in a small remainder have been absorbed in a slightly larger $theta.alt < 1$.
    The forcing uses the same previous plane singletons, by copying of their full padded neighborhoods.
    The plane remainder has the analogous bound. At the candidate exit the bounded map still leaves all new sizes
    within a fixed multiple of $rho$. Choose $rho$ so that this multiple lies inside the readout ball.
    The variance derivative of (112) and the mixed diagnostic (115), using their nonzero multipliers,
    then bound the new scalars by $C \( epsilon + rho^2 + delta_(upright("diag")) \)$.
    Here the physical discrepancy $delta_(upright("diag"))$ can be made arbitrarily small on all valid stops by
    taking $P$, then $s_k$, large, by Lemma 17 and (111). Choose $rho$ with $C rho lt.double 1$,
    and then entry and discrepancy smaller than a fixed small multiple of $rho$. This excludes the exit.
    The finitely many invalid early tori were handled after (108).
    The same contraction, driven by the now controlled plane singletons,
    bounds every stage of each later valid torus. Equivalence of the coordinate norms on the small ball gives the
    asserted normal-coordinate tube as well.
  Here is the uniform vanishing argument, for which no quantitative physical convergence is needed.
    Let $q_(*)$ be the supremum, over fixed $0 < c < c' < 4$, of the limsup as $k arrow.r
    oo$ of the largest plane full size or terminal full size (stage equal to stop) on $\[ c 2^k \, c' 2^k \]$,
    with the latter restricted to valid stops. This is at most a fixed multiple of $rho$.
    To estimate remainders on such an interval, start their contraction at $\( c \/ 2 \) 2^k$.
    Its homogeneous term tends to zero exponentially, and the limsup of its forcing is at most $C q_(*)^2$:
    after absorbing terms linear in the small torus remainder,
    that forcing is bounded by $C \( \| t_i \| + \| z_i \| \)^2$, using only the plane singletons.
    This also estimates a torus remainder without identifying it with the plane one.
    The two diagnostics have discrepancy tending uniformly to zero on the interval, since $n_j arrow.r
    oo$ and $s_k \/ n_j arrow.r 0$ there. Their errors and nonzero multipliers therefore give the same $C
    q_(*)^2$ bound for the scalar limsups. Taking the supremum gives $q_(*) lt.eq C q_(*)^2$.
    The tube was chosen below $1 \/ C$, hence $q_(*) = 0$. For a stage $i
    in \[ c 2^k \, c' 2^k \]$ behind any valid stop $j gt.eq i$,
    contract that torus’s own remainder from $floor.l \( c \/ 2 \) 2^k floor.r$,
    which lies after the entry for large $k$. The homogeneous term tends to zero exponentially,
    and the forcing uses the now uniformly vanishing plane singletons on a slightly longer fractional interval.
    The contraction constants are independent of the stop. This proves the second supremum in (116). ◻
]

=== 5.3 The odd signal and comparison of histories <the-odd-signal-and-comparison-of-histories>

The phase diagnostic also gives a lower bound, on the absolute scale,
  which prevents an arbitrarily late entry from losing the odd direction. Let $B_n = { 0 \, dots.h \, n - 1 }^2$.
  For $e in { plus.minus e_1 \, plus.minus e_2 }$, let $rho_(n \, e)$ be the uniform probability on its face with
  outward normal $e$, including the $n$ vertices of that face. Put

$ macron(rho)_n = 1 / 4 sum_e rho_(n \, e) \, wide rho_n^(upright("vol")) = n^(- 2) upright(bold(1))_(B_n) \,\
z_n^(upright("face")) = bb(E)_(B_n)^(h \, upright("free")) e^(i chevron.l h \, macron(rho)_n chevron.r) \, quad
  z_n^(upright("vol")) = bb(E)_(B_n)^(h \, upright("free")) e^(i chevron.l h \, rho_n^(upright("vol")) chevron.r) . $

where $bb(E)_(B_n)^(h \, upright("free"))$ is the free Bessel height law at $b_c$,
  modulo its common $2 pi$ translation. Both profiles have total one,
  and these centered characteristic coefficients are positive.
  The critical face estimate [17] Equation (2.15), using $a = 8 pi$,
  says that for every fixed sufficiently large $G = L^r$,

$ liminf_(n arrow.r oo) z_(G n)^(upright("face")) \/ z_n^(upright("face")) gt.eq c_6 > 0 \, $

where $c_6$ is independent of $r$. Replace it by a smaller number in $\( 0 \, 1 \)$.
  For fixed $r$, iterate the eventual lower bound $c_6 \/ 2$ on the $r$ residue classes of the absolute index in
  $n_j = D_0 L^j$. It follows that

$ limsup_(j arrow.r oo) frac(- log z_(n_j)^(upright("face")), j) lt.eq frac(log \( 2 \/ c_6 \), r) . $

Letting $r arrow.r oo$ proves $- log z_(n_j)^(upright("face")) = o \( j \)$.
  The difference between the face and uniform profiles has bounded primary reference cost.
  Indeed, for one face route each site’s mass $n^(- 2)$ to its projection on that face along a row or column.
  Each of $O \( n^2 \)$ edges carries at most $1 \/ n$, so the squared flow energy is $O \( 1 \)$;
  averaging the four flows gives the same bound for $macron(rho)_n - rho_n^(upright("vol"))$.
  The phase-transfer inequality [17] Equation (2.2) therefore gives

$ \| sqrt(- log z_n^(upright("face"))) - sqrt(- log z_n^(upright("vol"))) #scale(x: 120%, y: 120%)[\|] lt.eq C \, $

and hence $- log z_(n_j)^(upright("vol")) = o \( j \)$. Restoring the periodic bonds increases this centered
  characteristic by [17] Lemma 2.2. We have proved

#[#set math.equation(numbering: n => "(117)")
 $ bb(E)_(n_j)^(upright("tor")) e^(i macron(h)) gt.eq e^(- o \( j \)) . $ <trj:phase-lower>]

This is a statement about one physical torus law at each absolute $j$.
  The noise factor in Lemma 17 is bounded below, and the cutoff error (111) is negligible compared with (117) on
  any fixed-fraction interval. Thus $\| hat(bb(E))_(j \, k) chi_(n_j \, s_k) \| gt.eq e^(- o \( j \))$ uniformly there.

#thm([Lemma 5.6.])[
  (Odd cone and transverse remainders).  #emph[For every fixed $0 < c < c' < 3$, uniformly on $c 2^k lt.eq j lt.eq
    c' 2^k$ for large $k$,
#[#set math.equation(numbering: n => "(118)")
 $ Y_j = \| Z_j \| > 0 \, wide Y_j gt.eq e^(- o \( j \)) \, wide Y_(j + 1) \/ Y_j = 1 + o \( 1 \) \,\
parallel Q_(e \, j) parallel lt.eq C Y_j^2 \, wide parallel Q_(o \, j) parallel lt.eq
  C \( \| u_j \| + Y_j^2 \) Y_j . $ <trj:cone-bounds>]

 All little-oh statements are uniform on the indicated intervals.]
] <trj:cone>

#proof[
  Use a slightly longer fixed-fraction interval behind the one in the statement;
    Lemma 18 makes the tube size on it tend to zero. Fix a small $epsilon.alt > 0$.
    If $parallel Q_o parallel lt.eq epsilon.alt \| Z \|$ and $Z eq.not 0$, (102) gives $Z_(+) \/ Z = 1 +
    o \( 1 \)$ with positive ratio, while (102) gives $parallel Q_(o \, +) parallel lt.eq
    theta.alt epsilon.alt \| Z \| + o \( \| Z \| \)$. For a sufficiently small tube the cone is invariant and the
    sign of $Z$ persists. Outside that cone, $\| Z \| < epsilon.alt^(- 1) parallel Q_o parallel$,
    so (102) contracts $parallel Q_o parallel$ by $theta.alt +
    C delta \/ epsilon.alt < 1$ when the tube has radius $delta$.
    As long as the cone has not been entered this contracts the whole odd pair geometrically. The zero pair stays zero.
  We justify why the latter alternative cannot last for a fractional length of a history.
    In the torus stopping at $j$, let $r_(i \| j)^o$ be the norm of the odd part of its unbalanced remainder at
    stage $i$. The odd part of (95) gives $\| z_i \| lt.eq C \( \| Z_i \| + parallel Q_(o \, i) parallel \)$.
    The torus map has no linear forcing from a singleton into its remainder.
    By parity each nonlinear odd forcing contains an odd factor;
    all terms linear in $r_(i \| j)^o$ with a small coefficient can be absorbed in contraction.
    Hence, in the small tube,
  #[#set math.equation(numbering: n => "(119)")
   $ r_(i + 1 \| j)^o lt.eq theta.alt' r_(i \| j)^o + C \( \| Z_i \| + parallel Q_(o \, i) parallel \) \, wide
     theta.alt' < 1 . $ <trj:torus-odd-convolution>]
  If the plane odd pair were outside the cone (or zero) from $i_0$ to $j$,
    its geometric decay and this convolution would give $\| z_j \| + r_(j \| j)^o lt.eq
    C theta.alt'' ""^(j - i_0)$ for some $theta.alt'' < 1$. The constants are uniform in the torus stop.
    In the terminal integral for $chi$, a term with only even factors vanishes under the half-period shift of the
    uniform mean. The fixed terminal block count, denominator bounded away from zero,
    and analytic terminal bounds therefore imply
  $ \| hat(bb(E))_(j \, k) chi_(n_j \, s_k) \| lt.eq C \( \| z_j \| + r_(j \| j)^o \) . $
  Taking $j - i_0$ to be a fixed positive fraction of $j$ contradicts (117).
    Thus the cone is entered on an earlier fixed-fraction interval and persists throughout the interval of the
    statement; the zero alternative is excluded. This is the needed torus odd-remainder bridge,
    rather than an identification of the plane and torus remainders.
  Divide (102) by the positive lower bound for $\| Z_(+) \|$ in the cone.
    It gives a strict contraction for $parallel Q_o parallel \/ Y$ with a forcing tending uniformly to zero.
    Convolution from the earlier interval proves $parallel Q_o parallel \/ Y = o \( 1 \)$,
    and then (102) proves the slow step ratio in (118). Choose a fixed $r_0 < 1$, as close to one as needed below.
    On the longer interval, eventually $r_0 Y_i lt.eq Y_(i + 1) lt.eq r_0^(- 1) Y_i$.
    Convolving (119) from an earlier fractional index, with $r_0 > theta.alt'$, now gives $r_(j \| j)^o lt.eq
    C Y_j + e^(- c_7 j)$. The preceding terminal bound and (117) imply $Y_j gt.eq e^(- o \( j \))$:
    for every fixed $eta > 0$ the physical bound eventually exceeds $e^(- eta j)$,
    and the homogeneous exponential is smaller if $eta < c_7$.
  Take also $r_0^3 > theta.alt$. Convolution of (102) gives $parallel Q_(e \, j) parallel lt.eq C Y_j^2$,
    since $sum_(d gt.eq 0) theta.alt^d r_0^(- 2 d) < oo$ and the homogeneous exponential is negligible relative to
    $Y_j^2$. Substitution in (102), with $parallel Q_o parallel = o \( Y \)$, gives
  #[#set math.equation(numbering: n => "(120)")
   $ \| u_(i + 1) - u_i \| lt.eq C Y_i^2 . $ <trj:u-drift>]
  For $i lt.eq j$ in the longer interval this yields
  $ \| u_i \| lt.eq \| u_j \| + C sum_(h = i)^(j - 1) Y_h^2 lt.eq \| u_j \| + C r_0^(- 2 \( j - i \)) Y_j^2 . $
  Use this and $Y_i lt.eq r_0^(- \( j - i \)) Y_j$ in the convolution of (102).
    The sums with ratios $theta.alt \/ r_0$ and $theta.alt \/ r_0^3$ are finite,
    giving $parallel Q_(o \, j) parallel lt.eq C \( \| u_j \| + Y_j^2 \) Y_j$.
    Its homogeneous term is negligible relative even to $Y_j^3$, again by the subexponential lower bound.
    This proves all assertions. ◻
]

We next compare two histories through the same physical torus at a common absolute index.
  The following statement quantifies the overlap of their useful windows.

#thm([Lemma 5.7.])[
  (Comparison on an overlap).  #emph[Fix $0 < c < c' < 3$. Uniformly as $min \( k_1 \, k_2 \) arrow.r oo$,
    for every common integer $j$ satisfying $c 2^(k_i) lt.eq j lt.eq c' 2^(k_i)$ for $i = 1 \, 2$,
    put $\( u_i \, Y_i \) = \( u_j^(\( k_i \)) \, \| Z_j^(\( k_i \)) \| \)$. Then
#[#set math.equation(numbering: n => "(121)")
 $ \| u_1 - u_2 \| & lt.eq C \( Y_1^2 + Y_2^2 \) \,\
\| Y_1 - Y_2 \| & lt.eq C sum_(i = 1)^2 \( \| u_i \| + Y_i \) Y_i . $ <trj:overlap-bounds>]

 The constants may depend on $c \, c'$ and the fixed parameters.
   In particular $Y_1 \/ Y_2 arrow.r 1$ uniformly under these conditions.]
] <trj:overlap>

#proof[
  The window conditions make $\| k_1 - k_2 \|$ bounded in terms of $c \, c'$.
    Consequently each cell and entry side is comparable to $j$, and $s \/ n_j \, m \/ n_j lt.eq
    e^(- c_8 j)$ for either history. Both stops are valid for large epochs.
    The strict bounds $0 < c < c' < 3$ also leave fixed earlier fractional intervals for the cone and remainder
    convolutions, within the larger range of Lemma 18.
  We first estimate a stopped torus relative to a moving exact Gaussian curve in its own history.
    For the torus with stop $j$, let $cal(R)_(i \| j)^(g \, upright("tor")) \( d \)$ be its exact pure Gaussian
    remainder at stage $i$, initialized at this history’s side $m$ with parameter $d$.
    Its singleton coefficients copy the pure plane ones. The proof of (99), and the torus contraction,
    give $parallel cal(R)_(i \| j)^(g \, upright("tor")) \( d \) parallel lt.eq C \| d \|^2$,
    with uniform analytic derivatives. Define
  $ Delta_(i \| j)^e = \( cal(R)_(i \| j)^(upright("tor")) \)_e -
    cal(R)_(i \| j)^(g \, upright("tor")) \( u_i \) \, wide
    Delta_(i \| j)^o = \( cal(R)_(i \| j)^(upright("tor")) \)_o . $
  The equality $T_i = T_i^g \( u_i \)$ and the even part of (95) imply
  #[#set math.equation(numbering: n => "(122)")
   $ \| t_i - t_i^g \( u_i \) \| lt.eq C parallel Q_(e \, i) parallel lt.eq C Y_i^2 \, wide z_i =
     ell_i^(- 1) Z_i + O \( \( \| u_i \| + Y_i^2 \) Y_i \) . $ <trj:scalar-from-curve>]
  In the first estimate $t_i^g$ is the unbalanced pure singleton.
    There is no term depending only on $u_i^2$ in that difference.
  We record the torus estimates that accompany (122):
  #[#set math.equation(numbering: n => "(123)")
   $ parallel Delta_(j \| j)^e parallel lt.eq C Y_j^2 \, wide parallel Delta_(j \| j)^o parallel lt.eq
     C \( \| u_j \| + Y_j \) Y_j . $ <trj:moving-torus>]
  Here is the local comparison proving them. Subtract the torus map at
    $\( t_i^g \( u_i \) \, 0 \, cal(R)_(i \| j)^(g \, upright("tor")) \( u_i \) \)$ from that at the actual state.
    At the next stage also subtract the change of the pure remainder from parameter $u_i$ to $u_(i + 1)$.
    Its analytic derivative and (120) bound that change by $C Y_i^2$.
    The derivative of the torus remainder map at zero has no singleton row, by (93).
    Its even nonlinear part contains odd factors in pairs; terms linear in $Delta^e$ with a small coefficient are
    absorbed in its contraction. Initially use the rough convolution (119),
    which gives $parallel Delta_(i \| j)^o parallel lt.eq C Y_i + e^(- c_9 j)$ on the interval in question.
    Together with (122), the even map difference is consequently bounded by
  $ parallel Delta_(i + 1 \| j)^e parallel lt.eq theta.alt' parallel Delta_(i \| j)^e parallel + C Y_i^2 +
    e^(- c_9 j) . $
  Convolving from an earlier fractional interval proves its bound in (123).
    For the odd difference, there is no linear fundamental forcing,
    and every nonlinear term contains an odd factor. The remaining even size is bounded by
    $C \( \| u_i \| + Y_i^2 \)$, using the just proved even bound and the pure $O \( u_i^2 \)$ remainder.
    The analytic quadratic bound, even if one bounds an additional odd factor just by $C Y_i$, therefore gives
  $ parallel Delta_(i + 1 \| j)^o parallel lt.eq theta.alt' parallel Delta_(i \| j)^o parallel +
    C \( \| u_i \| + Y_i \) Y_i . $
  Convolution using (120) and the slow ratios, exactly as in the last paragraph of Lemma 19,
    proves the second bound. All homogeneous terms are negligible by $Y_j gt.eq e^(- o \( j \))$.
    This comparison uses a different pure parameter at each stage;
    using only an $O \( u_i^2 \)$ bound for the whole pure remainder would not prove the first bound in (123).
  The terminal variance functional obtained from (97) is analytic and invariant under $cal(S)$ on the inner
    activity ball. Its first variation in an odd direction at a purely even state is zero.
    Equations (122) and (123) therefore show that the actual cutoff variance differs by $O \( Y_j^2 \)$ from its
    value on the full exact Gaussian curve at $u_j$. We compute that value exactly,
    including the observation prefactor in (112). Let $C_(gt.eq m) =
    A^(+) sans(P)_m$ be the remaining mean-free covariance at the start on this torus.
    Apply (100) at $d = u$ with the physical field shift $F_(n_j \, s) \( w \)$ from (112).
    The logarithmic correction from the remaining field is
  #[#set math.equation(numbering: n => "(124)")
   $ u / 2 chevron.l A^(1 \/ 2) F_(n_j \, s) \( w \) \, \( I - u A^(1 \/ 2) C_(gt.eq m) A^(1 \/ 2) \)^(- 1)
     A^(1 \/ 2) F_(n_j \, s) \( w \) chevron.r . $ <trj:exact-gaussian-response>]
  The resolvent is uniformly bounded for small $u$, because $0 lt.eq A^(1 \/ 2) C_(gt.eq m) A^(1 \/ 2) lt.eq I$;
    the determinants cancel. This is Gaussian completion with the fixed frequency $alpha$, not a change in frequency.
  We make explicit the small discretization errors in this computation.
    The squared reference norm of the difference between the observation cosine and the microscopic cosine was
    bounded by $C \( s \/ n_j \)^2$ in Lemma 17. Hence $v_(n_j \, s)^0 = a frak(g) +
    O \( s \/ n_j + n_j^(- 2) \)$. Cell symmetry makes the observation covariance translate a cell cosine.
    Write $f_Q = f \( x_Q \/ n_j \)$, and use the microscopic cosine $q_n$ fixed with the grid above.
    Since $"ave"_Q f_Q^2 = 1 \/ 2$, symmetry and the definition of $v_(n_j \, s)^0$ give
    $"Cov"_0 \( y \, X_(n_j \, s) \) = 2 v_(n_j \, s)^0 \( f_Q \)_Q$.
    Moreover $B_s q_n = beta_(n \, s) \( f_Q \)_Q$, where $beta_(n \, s) = 1 +
    O \( \( s \/ n_j \)^2 + n_j^(- 2) \)$, by the finite cosine sum.
    Thus $F_(n_j \, s) \( w \) = 2 w v_(n_j \, s)^0 q_n \/ \( alpha beta_(n \, s) \)$.
    Here $chevron.l q_n \, A q_n chevron.r = 2 n_j^2 sin^2 \( pi \/ n_j \)$ and $frak(g) = 1 \/ \( 8 pi^2 \)$.
    These formulas give
  $ chevron.l F_(n_j \, s) \( w \) \, A F_(n_j \, s) \( w \) chevron.r \/ w^2 = a frak(g) +
    O \( s \/ n_j + n_j^(- 2) \) . $
  Finally the cosine eigenvalue of $A^(1 \/ 2) C_(gt.eq m) A^(1 \/ 2) = sans(P)_m$ is $1 +
    O \( \( m \/ n_j \)^2 \)$, directly from the polynomial expansion at zero.
    For the overlapping histories all these errors are $O \( e^(- c_8 j) \)$.
    Thus the variance predicted by the exact curve is, uniformly for small $u$,
  #[#set math.equation(numbering: n => "(125)")
   $ cal(V) \( u \) + O \( e^(- c_8 j) \) \, wide cal(V) \( u \) = a frak(g) + frac(u a frak(g), 1 - u) =
     frac(a frak(g), 1 - u) . $ <trj:common-variance>]
  Its derivative is bounded away from zero.
  Both actual cutoff variances can be compared to the same finite physical variance $"Var"_n^(upright("tor"))
    x_n$. The reference-cost sampling estimate and Cauchy–Schwarz bound the variance difference by $C s \/ n_j$,
    and (111) bounds the cutoff change. Their difference is therefore $O \( e^(- c_8 j) \)$,
    without estimating how close that physical variance is to its limit.
    Comparing (125) for the two histories, and using the nonzero derivative, gives
  $ \| u_1 - u_2 \| lt.eq C \( Y_1^2 + Y_2^2 \) + C e^(- c_8 j) . $
  The exponential is absorbed by the subexponential lower bounds for $Y_1 \, Y_2$. This proves the first line of (121).
  For the second line use the phase signal at zero tilt. The same mean integration that gives (115) gives its
    linear coefficient $p_(j \, s)$ on $z_j$. The phase functional (113) is odd,
    so its value on the pure curve is zero. Expanding about that curve, (122), (123),
    and the terminal analytic bounds give
  #[#set math.equation(numbering: n => "(126)")
   $ hat(bb(E))_(j \, k) chi_(n_j \, s) = p_(j \, s) ell_j^(- 1) Z_j +
     O \( \( \| u_j \| + Y_j \) Y_j \) . $ <trj:phase-on-curve>]
  For example the change of the fundamental derivative from its value at zero activity is $O \( \| u_j \| \)$,
    and every other surviving term has an odd factor. This accounts for every possible linear odd remainder.
  At the same absolute stop, $D_(upright("tail") \, j)$ in (115) is identical for the two histories.
    The polynomial continuations of the high pieces through side $L^j$ telescope to the same zero-mode
    continuation, independently of $m$. The only remaining difference in $tau_(j \, s)$ is the mean-noise variance
    $\( s \/ n_j \)^2$. Consequently $p_(j \, s_1) - p_(j \, s_2) = O \( e^(- c_8 j) \)$,
    while $p_(j \, s_i)$ are bounded away from zero and $ell_j = 1 + O \( e^(- c_1 j) \)$ is common.
    The two left sides of (126) differ from the same physical $bb(E)_n^(upright("tor"))
    e^(i macron(h))$ only by their mean-noise factors and their cutoff errors, again $O \( e^(- c_8 j) \)$.
    Subtracting gives
  $ \| Z_1 - Z_2 \| lt.eq C sum_(i = 1)^2 \( \| u_i \| + Y_i \) Y_i + C e^(- c_8 j) . $
  Absorb the exponential as before and use $\| Y_1 - Y_2 \| lt.eq \| Z_1 - Z_2 \|$.
    Since $\| u_i \| + Y_i arrow.r 0$, the resulting bound is $\| Y_1 - Y_2 \| lt.eq o \( 1 \) \( Y_1 + Y_2 \)$;
    it also proves the ratio assertion. Both overlap comparisons cancel the unknown finite physical diagnostic.
    They require no convergence rate for the height limit. ◻
]

=== 5.4 The recurrence with dyadic changes of history <the-recurrence-with-dyadic-changes-of-history>

We finish the proof of Proposition 14. At absolute index $j$ choose $\( u_j \, Y_j \)$ from $cal(H)^(\( k \))$
  when $2^k lt.eq j < 2^(k + 1)$. These spliced scalars are positive in the second coordinate and tend to zero.
  At a step that stays in one history, Lemmas 15, 16, and 19 give

#[#set math.equation(numbering: n => "(127)")
 $ u_(j + 1) - u_j & = - Y_j^2 { H + O \( \| u_j \| + Y_j + \( 1 + j \)^(- 2) \) } \,\
Y_(j + 1) / Y_j & = 1 - b_(*) u_j + O \( u_j^2 + Y_j^2 + \| u_j \| \( 1 + j \)^(- 2) \) . $ <trj:reduced-u>]

At a crossing $j + 1 = 2^k$, first take the old history’s ordinary step and then replace it at the same absolute
  $j + 1$ by the new history. Lemma 20 adds at most $C Y_j^2$ to (127),
  and at most $C \( \| u_j \| + Y_j \)$ to the ratio in (127).
  Here the slow step ratio and the overlap ratio make the old and new $Y$’s comparable.
  These bounds allow the $C Y_j$ term at a switch before $u_j$ and $Y_j$ are known to be comparable.

We give the barrier argument with these switch errors. Sample the tail at fixed lengths $K$.
  At most one switch occurs in a sampled step when the initial index is sufficiently large.
  For fixed $K$, the slow ratios give $Y_i \/ Y_j = 1 + o \( 1 \)$ throughout the step,
  and its change in $u$ is $O_K \( Y_j^2 \)$. Choose $K$ larger than a fixed multiple of the constant in the
  switch error. Summing (127), then going sufficiently far into the tail, gives, with $+$ now denoting one sampled step,

#[#set math.equation(numbering: n => "(128)")
 $ - C_2 K Y^2 lt.eq u_(+) - u lt.eq - C_1 K Y^2 $ <trj:sampled-u>]

for fixed $C_1 \, C_2 > 0$. The sampled $u$’s decrease to zero, so they are positive.
  Summing the ratio equation and absorbing the possible $C \| u \|$ switch error into its coefficient gives

#[#set math.equation(numbering: n => "(129)")
 $ Y_(+) / Y = 1 - tilde(b) u + cal(E) \, wide C_3 K lt.eq tilde(b) lt.eq C_4 K \, wide \| cal(E) \| lt.eq C_5 Y +
   C_K Y^2 . $ <trj:sampled-y>]

The constants $C_1 \, dots.h \, C_5$ can be fixed for all sufficiently large $K$;
  the tail threshold and $C_K$ may depend on $K$. To justify this form, use $u_i = u +
  O_K \( Y^2 \)$ inside the step and expand the product of its $K$ ratios.
  The coefficient errors $O \( \| u_i \| \( 1 + i \)^(- 2) \)$ sum to $O_K \( u j^(- 2) + Y^2 j^(- 2) \)$,
  since the sampled $u$ is positive and $\| u_i \| lt.eq u + C_K Y^2$.
  Absorb the first part into $tilde(b)$ and the second into $cal(E)$.
  The remaining ordinary errors and products are $O_K \( u^2 + u Y + Y^2 \) = O_K \( u^2 + Y^2 \)$;
  their $u^2$ part changes $tilde(b)$ by $O_K \( u \)$. The switch term splits into a part bounded by $C u$,
  absorbed there as well, and a remainder bounded by $C_5 Y + C_K Y^2$.
  Thus $tilde(b) = K b_(*) + O \( 1 \) + O_K \( u + j^(- 2) \)$.
  Taking $K$ large and then the tail sufficiently late leaves the displayed positive coefficient interval.

Choose $c_(-) > 0$ small. In the region $0 < u lt.eq c_(-) Y$, (128)–(129) imply

$ \( c_(-) Y_(+) - u_(+) \) - \( c_(-) Y - u \) gt.eq { C_1 K - C_4 K c_(-)^2 - C_5 c_(-) - C_K c_(-) Y } Y^2 . $

Choose $c_(-)$ so the quadratic loss is small, take $K$ large for the fixed switch loss,
  and then take the tail large for the last loss. The right side is a positive multiple of $K Y^2$.
  Thus a nonnegative lower gap becomes strictly positive and keeps increasing as long as it is in this region;
  the same inequality keeps it in the region. This contradicts $u \, Y arrow.r 0$.
  Similarly, in the region $u gt.eq c_(+) Y$,

$ \( u_(+) - c_(+) Y_(+) \) - \( u - c_(+) Y \) gt.eq { - C_2 K + C_3 K c_(+)^2 - C_5 c_(+) - C_K c_(+) Y } Y^2 . $

Choose $c_(+)$ sufficiently large, then $K$ and the tail as above.
  The upper gap also increases strictly, again contradicting convergence.
  It follows that $c_(-) Y < u < c_(+) Y$ on the sampled tail.
  The bounds within a sampled step give $u_j asymp Y_j$ at every sufficiently large index.

Increase the fixed $K$ once more if needed so that $C_3 K c_(-) > 2 C_5$.
  Equations (129) and the two barriers then give $Y - Y_(+) asymp K Y^2$ on the sampled steps.
  Their ratios tend to one, so taking reciprocals gives $1 \/ Y_(+) - 1 \/ Y asymp K$.
  Summing over the sampled indices and filling the bounded gaps proves

#[#set math.equation(numbering: n => "(130)")
 $ u_j asymp Y_j asymp j^(- 1) . $ <trj:rough-decay>]

It remains to read the constant with the required error. Put $c_0 = sqrt(H \/ b_(*))$ and $I_j = u_j^2 -
  c_0^2 Y_j^2$. At an ordinary step, (127)–(130) give

$ u_(j + 1) - u_j = - H Y_j^2 + O \( j^(- 3) \) \, wide Y_(j + 1) - Y_j = - b_(*) u_j Y_j + O \( j^(- 3) \) . $

In $I_(j + 1) - I_j$, the leading terms $- 2 H u_j Y_j^2 + 2 c_0^2 b_(*) u_j Y_j^2$ cancel,
  and all remaining terms are $O \( j^(- 4) \)$. At a switch the extra changes in $u \, Y$ are $O \( j^(- 2) \)$,
  so the corresponding bound is $O \( j^(- 3) \)$. Since $I_j arrow.r 0$, summing its increments to infinity gives

$ \| I_j \| lt.eq C sum_(i gt.eq j) i^(- 4) + C sum_(2^k gt.eq j) \( 2^k \)^(- 3) lt.eq C j^(- 3) . $

Together with the positive lower bound for $u_j + c_0 Y_j$ in (130), this yields

#[#set math.equation(numbering: n => "(131)")
 $ u_j = c_0 Y_j + O \( j^(- 2) \) . $ <trj:separatrix-error>]

At ordinary steps the reciprocal form of (127) is now

$ 1 / Y_(j + 1) - 1 / Y_j = b_(*) c_0 + O \( j^(- 1) \) . $

At each switch there is an additional $O \( 1 \)$ error. There are only $O \( log j \)$ switches up to index $j$;
  the ordinary errors also sum to $O \( log j \)$. Thus $1 \/ Y_j = b_(*) c_0 j + O \( log \( 2 + j \) \)$, and

#[#set math.equation(numbering: n => "(132)")
 $ u_j = frac(1, b_(*) j) + O #h(-0.16667em) (frac(log \( 2 + j \), j^2)) . $ <trj:u-asymptotic>]

For an arbitrary history $cal(H)^(\( k \))$ at an interior index,
  compare it with the spliced history at that same $j$. Both indices are interior in their extended ranges.
  The ratio assertion in Lemma 20 and (130) first give $Y_j^(\( k \)) asymp j^(- 1)$;
  its gradient bound then changes (132) by only $O \( j^(- 2) \)$. Finally, (99), (122), and Lemma 19 give

$ t_j^(\( k \)) & = u_j^(\( k \)) + O \( j^(- 2) \) \, wide z_j^(\( k \)) = O \( j^(- 1) \) \,\
parallel cal(R)_j^(\( k \)) parallel_(j \, k) & lt.eq C { \( u_j^(\( k \)) \)^2 + \( Y_j^(\( k \)) \)^2 + \|
  u_j^(\( k \)) \| Y_j^(\( k \)) } = O \( j^(- 2) \) . $

Substituting $b_(*) = 2 log L$ proves Proposition 14. The scale in that conclusion is the absolute $j$;
  no single uniformly valid microscopic start and no quantitative height scaling limit have been assumed.

== 6 The center observable <sec:observable>

We determine the change from $M_(L^N)$ to $M_(L^(N + 1))$.
  The two computations use the same entry scale and the same stopping scale.
  We choose their local maps so that the field-independent factors extracted near the insertion agree exactly.
  After controlling the surviving labelled term, we compare the remaining terminal integrals and read the gradient
  coefficient of Section 5.

Write $eta_n$ for the minimizing unit field in the free dual square corresponding to $M_n$, as in Lemma 8, and put

$ g_n = parallel eta_n parallel^2 . $

All energies in this section count each unoriented edge once.

#thm([Proposition 6.1.])[
  (Consecutive square sizes).  #emph[Fix $0 < epsilon.alt < 1 \/ 10$.
    For all sufficiently large $N$, put $n_0 = L^N$, $n_1 = L^(N + 1)$, and choose a power $m' = L^(j')$ so that
#[#set math.equation(numbering: n => "(133)")
 $ D_N = n_0 / m' asymp N^epsilon.alt \, wide j' = N - O \( log N \) . $ <obs:stop>]

 Use the entry history for $N$ in both squares, and let $t_(j')$ be its unbalanced plane gradient coefficient at
   the stop. Then
#[#set math.equation(numbering: n => "(134)")
 $ log M_(n_1) / M_(n_0) = - frac(1 - t_(j'), 2 a) \( g_(n_1) - g_(n_0) \) +
   O (D_N^4 / N^2 + frac(1, N D_N)) . $ <obs:consecutive-formula>]

 Moreover, for a constant $c_G$,
#[#set math.equation(numbering: n => "(135)")
 $ g_(L^N) = 2 pi \( log L \) N + c_G + o \( 1 \) . $ <obs:green-constant>]

 All constants are independent of $N$.]
] <obs:consecutive>

The term $1 - t_(j')$ separates the Gaussian cost of the unit circulation from the correction read from the height
  interaction. The displayed error is summable for the chosen growth of $D_N$.
  We first prove the reference-energy assertion (135), and then prove the consecutive-size comparison.

===== 6.1 The reference energy. <the-reference-energy.>

The unit field is $2 pi$ times the rotated gradient of the killed primal Green function
  $G_n \( thin dot.op thin \, 0 \)$. The stream identity gives

#[#set math.equation(numbering: n => "(136)")
 $ g_n = 4 pi^2 chevron.l G_n \( thin dot.op thin \, 0 \) \,
   A_n^(upright("kill")) G_n \( thin dot.op thin \, 0 \) chevron.r = 4 pi^2 G_n \( 0 \, 0 \) . $ <obs:stream-energy>]

For the sequence $n = L^N$, choose one sufficiently large fixed dyadic $D_G$, distinct from the growing $D_N$,
  and put $v = n \/ D_G$. For late $N$, $v$ is a dyadic integer.
  Write $sans(P)_t^(upright("kill")) = P_t \( 1 - A_n^(upright("kill")) \/ 64 \)$ for the polynomials of (34).
  Since $sans(P)_1^(upright("kill")) = I$, their exact telescope is

#[#set math.equation(numbering: n => "(137)")
 $ \( A_n^(upright("kill")) \)^(- 1) = sum_(t = 1 \, 2 \, 4 \, dots.h\
t <
  v) \( A_n^(upright("kill")) \)^(- 1) \( sans(P)_t^(upright("kill")) - sans(P)_(2 t)^(upright("kill")) \) + \(
  A_n^(upright("kill")) \)^(- 1) sans(P)_v^(upright("kill")) . $ <obs:green-telescope>]

There is no independent microscopic piece in this identity.
  The quotients use their polynomial continuations when compared with the plane operators.

Choose $D_G$ larger than the fixed range constant. Finite range then makes every center diagonal in the sum in
  (137) equal to its plane diagonal

$ H_t \( 0 \, 0 \) \, wide H_t = A^(- 1) \( sans(P)_t - sans(P)_(2 t) \) $

for the plane nearest-neighbor Laplacian. The fixed-ratio Fourier estimate used in the proof of Lemma 16 applies
  at ratio $2$. To check the omitted microscopic factor in [16] Lemma 8.1,
  its nearest-neighbor kernel contains $1 - gamma Q$, with $Q = A \/ 4$.
  The difference from $H_t$ is $gamma / 4 \( sans(P)_t - sans(P)_(2 t) \)$;
  its plane diagonal is $O \( t^(- 2) \)$, by $hat(sans(P)_t) \( xi \) lt.eq C \( 1 + t \| xi \| \)^(- 64)$.
  This correction and the Fourier power error are summable over dyadic $t$.
  The continuum diagonal is $\( log 2 \) \/ \( 2 pi \)$: if $P \( r \)$ is the limiting radial cutoff, then

$ integral_0^oo #scale(x: 120%, y: 120%)[\(] P \( r \) - P \( 2 r \) #scale(x: 120%, y: 120%)[\)] thin
  frac(thin upright(d) r, r) = log 2 $

because $P \( 0 \) = 1$ and $P$ decays at infinity, and the angular factor is $1 \/ \( 2 pi \)$.
  Thus, including the finitely many early sides,

$ H_t \( 0 \, 0 \) = frac(log 2, 2 pi) + epsilon_t \, wide sum_(t = 1 \, 2 \, 4 \, dots.h) \| epsilon_t \| < oo . $

The sum of the center diagonals in (137) is therefore $\( 2 pi \)^(- 1) log
  v$ plus a convergent constant and $o \( 1 \)$.

The last center diagonal in (137) has a limit for this fixed $D_G$.
  For the normalized positive sine modes $e_(k \, n)$ and their Dirichlet eigenvalues $lambda_(k \, n)$,

$ \| e_(k \, n) \( 0 \) \|^2 lt.eq C n^(- 2) \, wide lambda_(k \, n) gt.eq c \| k \|^2 n^(- 2) \, wide
  sans(P)_v^(upright("kill")) \( k \) lt.eq C min { 1 \, \( \| k \| \/ D_G \)^(- 64) } . $

Its summands are consequently bounded by $C \| k \|^(- 2) min { 1 \, \( \| k \| \/ D_G \)^(- 64) }$,
  a summable function of the positive mode indices when $D_G$ is fixed.
  Each fixed mode converges with its Dirichlet normalization, so dominated convergence gives the limit.
  Since $log v = log n - log D_G$,

$ G_(L^N) \( 0 \, 0 \) = frac(log L, 2 pi) N + c + o \( 1 \) . $

Together with (136), this proves (135). No rate is needed for its convergent remainder.

=== 6.1 The paired local computation <the-paired-local-computation>

Take the entry side $m = L^(j_0) = q R s$ supplied by Theorem 12 for the epoch containing $N$.
  Thus $s asymp N$ and $j_0 = O \( log N \)$. Use this same choice in the two squares,
  with grids centered on the same unit. At absolute index $j$, put $m_j = L^j$. All steps have $j_0 lt.eq j < j'$, so

$ m_(j + 1) lt.eq m' = n_0 / D_N . $

The centered and unit sectors within a square have the same Gaussian covariance;
  their difference is in the activities and in the factor $e^(- g_n \/ \( 2 a \))$ in (33).

Fix the finite set of regulator and weight reserves allowed by Theorem 12.
  Use a stronger norm for the untwisted activities than for their translated unit copies,
  and leave the weakest block weight, denoted $A_w$, large enough for the rooted sums below.
  These choices are fixed before $N$. In a recurrence, $parallel dot.op
  parallel_j$ denotes the chosen norm for that class of activities at side $m_j$,
  with the same choice at successive indices. Define the size of the common plane bulk state by

$ U_j = \| t_j \| + \| z_j \| + parallel cal(R)_j parallel_j . $

Lemma 18 keeps $U_j$ uniformly small throughout the history, and Proposition 14 gives $U_j =
  O \( N^(- 1) \)$ on every fixed-fraction interval ending at $j'$.
  Such an interval is always taken with a slightly longer interval behind it in the same history.

We now specify the exact algebra whose scalars will cancel. For the free dual square $cal(G)_n$, the entry theorem gives

$ cal(H)_(cal(G)_n \, m)^0 \( phi.alt \) = c_(cal(G)_n \, m) cal(Z)_m \( K_m^(0 \, n) \; phi.alt \) \, wide
  cal(H)_(cal(G)_n \, m)^tau \( phi.alt \) = c_(cal(G)_n \, m) \[ x \]
  cal(Z)_m \( K_m^(tau \, n) + x J_m^n \; phi.alt \) . $

Here $K_m^(tau \, n)$ sums unit-sector components without the compulsory source marker,
  while $J_m^n$ sums the component containing that marker. Thus $\[ x \]$ selects exactly one labelled component.
  The positive entry scalar is common to the two sectors of this square; it need not be common to the two square sizes.

Use the exact unbalanced partition map and work in $bb(R) \[ x \] \/ \( x^2 \)$.
  Let $cal(B)_(m_(j + 1))^n$ be the output block grid in square $n$,
  and let $zeta_j^n$ have the shell covariance $Gamma_(m_j)$ there. The unit step has the exact form

#[#set math.equation(numbering: n => "(138)")
 $ & bb(E)_(zeta_j^n) cal(Z)_(m_j) \( K_j^(tau \, n) + x J_j^n \; phi.alt + zeta_j^n \)\
 & quad = product_(B in cal(B)_(m_(j + 1))^n) \( 1 + a_(j B)^(tau \, n) + x dot(a)_(j B)^(tau \, n) \) thin
   cal(Z)_(m_(j + 1)) \( K_(j + 1)^(tau \, n) + x J_(j + 1)^n \; phi.alt \) med \( mod med x^2 \) .
   $ <obs:dual-number-map>]

Use $a_(j B)^(0 \, n)$ for the corresponding centered scalar.
  Each $a$ is the complete sum of designated field-independent pieces assigned to $B$;
  $dot(a)$ is its coefficient in the label direction. Only the unlabelled $a$ must be small, since

$ \( 1 + a + x dot(a) \)^(- 1) = \( 1 + a \)^(- 1) - x dot(a) \( 1 + a \)^(- 2) med \( mod med x^2 \) . $

The nonlinear map is a convergent sum of bounded multilinear maps of degree at least two, so

$ parallel D cal(N) \( K \) J parallel lt.eq C parallel K parallel thin parallel J parallel $

at a small unlabelled input, for every finite-norm direction $J$.
  No small-ball condition on $x J$ at a fixed nonzero $x$ is used.

There are two copying operations. Within a square, an activity away from the source is the untwisted activity at a
  local lift. We keep its translated nonconstant pieces inside the activity and designate the untwisted constant;
  this removes scalar differences away from the source. Between the two squares,
  central unit activities are the same plane-unit prescription at different smooth backgrounds.
  Designating the neutral constant before that background is inserted makes the remaining scalar independent of
  the square size. The central activities themselves retain the background difference.

For the precise support conditions, include in the causal padding $D_(m_j) \( X \)$, its fixed stencils,
  and an additional collar of fixed positive width in current-block units.
  Call a support #emph[wall-free] when its required sites and causal padding stay a fixed number $H_0$ of current
  blocks from the square boundary. Call it #emph[shift-good] when its enclosing rectangle with that padding misses
  the unit; a support failing this condition is a #emph[defect].
  The full norm domain of a shift-good support is then at distance at least $c m_j$ from the unit.
  Choose $H_0$ once to include the shell range, assignment neighborhoods,
  and the geometric sum of all earlier causal padding. Occupied support, norm padding,
  and causal dependence have distinct roles here: every obstruction tag remains occupied in the support;
  the norm padding contains the evaluated coordinates; the causal neighborhood contains the predecessor data used
  by the local operations. The entry copy conditions are those of Theorem 12.
  These classifications are used in the proofs of [16] Propositions 5.5 and 5.7,
  whose stated results concern a decaying Villain flow. We derive the needed estimates for the critical height history.

Fix a constant $H_A$ large enough for the assignments described below.
  In the common centered grid define the geometric set

#[#set math.equation(numbering: n => "(139)")
 $ cal(A)_j = { thin m_(j + 1) upright("-blocks meeting the ") H_A m_(j + 1) upright("-neighborhood of the unit")
   thin } . $ <obs:affected-set>]

This is a set of possible scalar destinations, not the set where a numerical difference happens to be nonzero.
  Its cardinality is bounded by a fixed constant. For late $N$, it lies in both squares because $m_(j + 1) lt.eq
  m' lt.double n_0$.

Let $w_j$ be the maximum over the two squares of the full untwisted norm restricted to supports that are not
  wall-free, and let $d_j$ be the corresponding maximum of the full unlabelled unit norm on defects.
  Write $parallel J_j parallel_j = max_(n in { n_0 \, n_1 }) parallel J_j^n parallel_j$.
  Each norm here is the fixed choice for its class.

#thm([Lemma 6.2.])[
  (Paired local maps).  #emph[The local maps can be chosen in both squares with the following properties.
    Here $theta < 1$ and $C$ depend only on the fixed parameters.]
  + #emph[Untwisted activities on wall-free supports are the exact plane activities, and
#[#set math.equation(numbering: n => "(140)")
 $ w_(j + 1) lt.eq theta w_j + C U_j + C \( U_j + w_j \)^2 . $ <obs:wall-recurrence>]

]
  + #emph[On a shift-good support, $K_j^(tau \, n)$ is the corresponding untwisted activity evaluated at a local
    lift $lambda_n$, with $nabla lambda_n = eta_n \/ alpha$. Near a wall this uses the finite-square untwisted
    activity. On defects,
#[#set math.equation(numbering: n => "(141)")
 $ d_(j + 1) lt.eq theta d_j + C \( U_j + w_j \) + C \( U_j + w_j + d_j \)^2 . $ <obs:defect-recurrence>]

 On a central support whose complete causal neighborhood is wall-free in both squares,
   the unit activity is the common plane centered-unit prescription evaluated at
#[#set math.equation(numbering: n => "(142)")
 $ phi.alt + delta_n \, wide delta_n = frac(v_n - v_oo, alpha) . $ <obs:smooth-background>]

]
  + #emph[The surviving label obeys
#[#set math.equation(numbering: n => "(143)")
 $ parallel J_(j + 1) parallel_(j + 1) lt.eq { theta + C \( U_j + w_j + d_j \) } parallel J_j parallel_j .
   $ <obs:label-recurrence>]

 Every nonzero $J_j^n \( X \)$ has an occupied block within a fixed number of current blocks of the unit.
   Its support may extend farther. It has the same central plane-unit copy property as in (142).]
  + #emph[Choose $H_A$ in (139) sufficiently large. For every output block outside $cal(A)_j$, in either square,
#[#set math.equation(numbering: n => "(144)")
 $ a_(j B)^(tau \, n) = a_(j B)^(0 \, n) \, wide dot(a)_(j B)^(tau \, n) = 0 . $ <obs:factor-outside>]

 For every $B in cal(A)_j$, the complete sums satisfy
#[#set math.equation(numbering: n => "(145)")
 $ a_(j B)^(0 \, n_0) = a_(j B)^(0 \, n_1) \, wide a_(j B)^(tau \, n_0) = a_(j B)^(tau \, n_1) \, wide
   dot(a)_(j B)^(tau \, n_0) = dot(a)_(j B)^(tau \, n_1) . $ <obs:factor-copy>]

 In the fixed small ball, choose $rho < 1$ with $\| a_(j B)^(sigma \, n) \| lt.eq rho$ for $sigma in { 0 \,
   tau }$. Then every output block satisfies
#[#set math.equation(numbering: n => "(146)")
 $ lr(|log frac(1 + a_(j B)^(tau \, n), 1 + a_(j B)^(0 \, n))|) lt.eq
   C \( U_j + w_j + d_j \) . $ <obs:scalar-log-bound>]

]
] <obs:local-estimates>

#proof[
  We first establish the copying and scalar identities at a step for which the unlabelled inputs lie in the small
    ball. The estimates below keep the iterated maps in that ball.
  On a shift-good input use its full translated untwisted expectation.
    Translate also the already assigned fine-site gradient and fundamental functions.
    Thus both $e_B^0 \( phi.alt + lambda_n \)$ and $c_B^alpha \( phi.alt + lambda_n \)$,
    including their values at zero, remain functions inside the interaction.
    Designate only the same field-independent constant as in the untwisted map.
    These choices are exact splittings in [16] Proposition 4.8.
    The weak map assigns its fundamental functions to the fine blocks $B in
    X$ before a support label is moved [16] Section 8.2, before Proposition 8.3.
    A piece that later belongs to a defect output is still that fine-site function,
    so no lift is evaluated at the unit. Lifts on opposite sides of the cut differ by a common integer multiple of
    $omega$; periodicity identifies their resulting functions.
  On a small defect input, designate the neutral constant of the plane centered-unit prescription before the
    background $delta_n$ is included. This also applies coefficientwise to a labelled input.
    In square coordinates it is the neutral shell expectation evaluated at $- delta_n$.
    The initial central copy identity, including its occupied tags and padded dependencies, is in Theorem 12.
    In a central causal neighborhood the shell covariance equals the plane covariance.
    Translation of the entire field argument commutes with convolution and products,
    and the prescribed neutral constant is the plane constant.
    Induction therefore gives (142), also coefficientwise in $x$.
    The same induction gives the untwisted plane copy on wall-free supports.
    Near a wall a shift-good input is instead compared to its finite-square untwisted input and its assigned
    pieces. The iterated causal radius is $O \( m_j \)$, since earlier radii form a geometric sum.
  We next locate every possible scalar difference. Here a small input means $\| X \| lt.eq
    n_(upright("sm"))$ for its full occupied support $X$, with every obstruction tag still occupied;
    the norm padding and causal neighborhood enter the support predicates just defined.
    For a current small linear input $X$, write $c_(j X \, B)^(sigma \, n)$ for the complete designated scalar
    assigned from that input to $B$ in its coarse closure $macron(X)$. The exact algebra of [16] Proposition 4.8 gives
  #[#set math.equation(numbering: n => "(147)")
   $ a_(j B)^(sigma \, n) = sum_(X med upright("small")\
B in macron(X)) c_(j X \, B)^(sigma \, n) \, wide dot(a)_(j B)^(tau \, n) = sum_(X med upright("small")\
B in macron(X)) dot(c)_(j X \, B)^(tau \, n) . $ <obs:scalar-sums>]
  The second sum is the same linear designation in the label direction.
    A large or nonlinear residual is not designated at that step, even if its value happens to be constant;
    it retains its whole coarse closure. It can enter (147) at a later step only after its then-current full
    occupied support is small.
  The shift-good designation is exactly the centered one. Within one square, therefore,
  #[#set math.equation(numbering: n => "(148)")
   $ Delta a_(j B)^n := a_(j B)^(tau \, n) - a_(j B)^(0 \, n) = sum_(X med upright(s m a l l med d e f e c t)\
B in macron(X)) \( c_(j X \, B)^(tau \, n) - c_(j X \, B)^(0 \, n) \) . $ <obs:scalar-difference>]
  Every nonzero summand has a small defect witness. Its fixed connected size and its padded rectangle meeting the
    unit put its entire support and destination within $O \( m_(j + 1) \)$ of the unit.
    This argument does not assign source ancestry to an arbitrary unlabelled defect:
    a large winding support can enclose the unit without occupying a nearby block.
  A labelled input has a different witness. Initially its occupied cover contains the source by Theorem 12.
    A surviving label comes from its fine input or from a labelled normalization decoration.
    A piece can shrink only when it came from a small linear input,
    and such a piece or decoration moves by only $O \( 1 \)$ output blocks.
    The accumulated physical displacement is $O \( m_j \)$. Thus every surviving labelled support has an occupied
    block within a fixed number of current blocks of the unit.
    A small labelled input and its scalar destination are consequently within $O \( m_(j + 1) \)$ of the unit.
    Choosing $H_A$ for both kinds of witness proves (144).
  We must also rule out noncommon numerical data hidden inside a complete scalar at $B in cal(A)_j$.
    For the inverse decoration $frak(d)_(j B)^(sigma \, n) = \( 1 + a_(j B)^(sigma \, n) \)^(- 1) - 1$,
    the exact difference and labelled derivative are
  $ frak(d)_(j B)^(tau \, n) - frak(d)_(j B)^(0 \, n) = -
    frac(Delta a_(j B)^n, \( 1 + a_(j B)^(tau \, n) \) \( 1 + a_(j B)^(0 \, n) \)) \, wide
    dot(frak(d))_(j B)^(tau \, n) = - frac(dot(a)_(j B)^(tau \, n), \( 1 + a_(j B)^(tau \, n) \)^2) . $
  Every other factor in either inverse series is a complete scalar at this same block.
    A decoration at a remote block occupies that block when grouping adds it to the support.
    Large residuals retain their closures; a permitted small relocation keeps its old exclusion information and
    moves a witness only $O \( m_(j + 1) \)$. In units of the new side its distance bound has the form
    $h_(upright("new")) lt.eq C + h \/ L$, so repeated allowed relocations retain a fixed bound.
  The entry construction occupies every wall-reaching or winding obstruction tag.
    If a current unlabelled defect has a wall witness and its padded rectangle meets the unit,
    its occupied extrema in a wall-normal coordinate are separated by $n - O \( m_j \)$.
    Fixed-distance connectivity then gives at least $c n \/ m_j$ occupied blocks.
    The same span bound applies when a support joins an affected inverse witness to a wall-obstruction tag.
    Every noncommon finite-square coefficient correction carries such a tag.
    Through the stop this lower bound is at least $c D_N$, so such a support cannot become a small central input.
    This is why a long span cannot be erased before the smallness decision.
  At a block $B in cal(A)_j$, every contributor to the complete sums in (147) is itself small and lies within
    $O \( m_(j + 1) \)$ of $B$. Its locally evaluated coordinates and rule data are therefore identified in the
    common central region by the causal padding. A noncommon finite-square coefficient correction would carry a
    wall-obstruction tag, contradicting this small central support by the preceding span bound.
    All remaining untagged coefficients use the same universal plane prescription.
    The centered contributions therefore copy term by term between sizes.
    For a central unit input written as $H_n \( phi.alt \) = H_oo \( phi.alt + delta_n \)$,
    its designated neutral constant is $H_n \( - delta_n \) = H_oo \( 0 \)$;
    a shift-good unit input designates the centered constant. The same reasoning holds in the label direction.
    This proves (145) for the complete centered sum, complete unit sum,
    and complete labelled derivative separately. It is stronger than equality merely of $Delta a_(j B)^n$,
    which would not identify their ratios.
  We turn to the analytic estimates. At a free wall, a small untwisted input is invariant under field negation.
    Removing its neutral constant gains $C L^(- 2)$ by [16] Lemma 4.5,
    and there are $O \( L \)$ fine placements at a specified coarse wall block by [16] Corollary 4.7.
    The fundamental charged part has the same $C L^(- 2)$ gain before placements at the present marginal
    frequency. Indeed the plane shell diagonal is
  $ frac(log L, 2 pi) + O \( 1 \) . $
  For a reflected image at distance $d$, binary pieces of side less than a fixed multiple of $d$ vanish.
    A later piece of side $t$ differs from its nonnegative zero-distance value by at most $C d \/ t$,
    using the first-difference kernel bound. Summing over dyadic $t gt.eq c d$ costs $O \( 1 \)$,
    and only a fixed number of images occur through the stop.
    The free diagonal is therefore at least $\( log L \) \/ \( 2 pi \) - C$.
    For each small connected charged input $X$, choose the local anchor $x = v_0$ in one of its occupied blocks,
    and apply the general charge estimate [16] Equation (4.26) with Cameron shift amplitude $alpha$.
    For charge $q$ its diagonal exponent is $- alpha^2 \( \| q \| - 1 \/ 2 \) Gamma \( x \, x \)$.
    Since $alpha^2 = 8 pi$, this gives $C L^(- 2)$ for $\| q \| = 1$,
    and a summable bound with spare powers of $L$ for the other charges.
    The fixed analytic radius contains the nonconstant covariance column; choose $L$ after this radius.
  Large linear supports contract by the block weight. A bulk input feeding a wall output,
    including every piece assigned from it, is bounded in full by $C U_j$;
    this uses no cancellation across a change of boundary kernel.
    The analytic nonlinear estimate [16] Equation (4.30) now gives (140).
  For a shift-good input, (46) bounds the first two differences of its lift on each padded block after
    multiplication by the corresponding powers of $m_j$. Its translated ordinary regulator is bounded by a
    slightly stronger regulator times $e^(C \| X \|)$. For the observation regulator, its positive quadratic form,
    the strict margin in (42), and [16] Equations (9.14) and (9.16) give the same conclusion:
    the internal energy of the lift is $O \( \| X \| \)$, and a fixed increase of $h_(*)$ absorbs the cross term.
    The weight reserve pays $e^(C \| X \|)$. Common lift values cost nothing in the regulators or in the supremum
    over real backgrounds in the activity norm. Contributions from shift-good inputs to a defect output are
    therefore bounded by $C \( U_j + w_j \)$.
  The plane-before-$delta_n$ projection on a small defect is close to ordinary neutral constant localization.
    After removing a common constant,
  $ parallel delta_n parallel_(m_j \, D) lt.eq C m_j \/ n $
  by (46). The mean value theorem in the analytic point norm, with the shell regulator reserve,
    bounds the additional linear remainder by $C_(L \, A_w) \( m_j \/ n \)$ times the input norm.
    This is at most $C_(L \, A_w) \/ D_N$. Ordinary neutral constant localization without negation symmetry gains
    $C L^(- 1)$, and only $O \( 1 \)$ fine defect placements can feed a specified coarse block.
    The charged estimate above, with the local anchor in each small input,
    and the large-support weight bound handle the other linear terms.
    The chosen projection has bounded norm, so the nonlinear bound is still quadratic.
    Taking $N$ large after the fixed map choices absorbs $C_(L \, A_w) \/ D_N$ in the contraction and proves (141).
  The linear label map uses this same neutral projection, the order-one neutral remainder and charged gain on a
    small support with its own local anchor, and the weight gain on a large support.
    The occupied-block location proved above gives $O \( 1 \)$ small labelled placements at each step.
    The differentiated nonlinear estimate following (138) accounts for all ordinary attachments and proves (143)
    for an arbitrary finite label norm.
  Finally, the scalar projections in (147) are bounded in each chosen class norm,
    and the rooted sum over the fixed-threshold small inputs assigned to one block is finite.
    In (148), the unit defect projections cost $C d_j$. The plane-before-$delta_n$ evaluation remains uniformly
    bounded by the preceding projection estimate. Bound the centered counterparts separately in their own norm by
    $C \( U_j + w_j \)$. No difference of norms and no norm of $J_j$ is used. Hence
  $ \| Delta a_(j B)^n \| lt.eq C \( U_j + w_j + d_j \) . $
  On $\| a_(j B)^(sigma \, n) \| lt.eq rho < 1$, the real mean value theorem for $log \( 1 + x \)$ gives
  $ lr(|log frac(1 + a_(j B)^(tau \, n), 1 + a_(j B)^(0 \, n))|) lt.eq frac(\| Delta a_(j B)^n \|, 1 - rho) . $
  This proves (146) and completes the lemma. ◻
]

Choose the entry and bulk tube small enough that the coefficient in (143) is at most a fixed $theta' < 1$.
  The recurrences then keep the actual unlabelled maps in the required small ball. The polynomial entry bound gives

#[#set math.equation(numbering: n => "(149)")
 $ parallel J_(j') parallel_(j') lt.eq C_R s^(C_R) \( theta' \)^(j' - j_0) lt.eq e^(- c N) . $ <obs:label-stop>]

The constant $c > 0$ may decrease between occurrences. Iterating (140) and (141) from an earlier fixed-fraction
  interval, with the quadratic small factors absorbed in the contraction, gives

#[#set math.equation(numbering: n => "(150)")
 $ U_(j') + w_(j') + d_(j') lt.eq C \/ N . $ <obs:unlabelled-stop>]

The same bound holds for the plane centered-unit defect prescriptions.
  More generally, Lemma 18 and these geometric convolutions show that $w_j + d_j =
  o \( 1 \)$ uniformly on every fixed-fraction interior interval.
  Earlier portions of the history contribute exponentially little.

=== 6.2 The stopped identity and terminal integration <the-stopped-identity-and-terminal-integration>

At the stop, write

$ C_(* \, n) = A_n^(+) sans(P)_(m')^n \, wide sans(P)_t^n = P_t \( 1 - A_n \/ 64 \) \, wide
  "Cov" \( zeta_(* \, n) \) = C_(* \, n) $

where $A_n$ is the free-square Laplacian and $A_n^(+)$ is its inverse on the nonconstant modes.
  This is the terminal covariance in (34). The remaining common phase is uniform modulo $omega$.
  For $sigma in { 0 \, tau }$, define the three terminal quantities

#[#set math.equation(numbering: n => "(151)")
 $ T_n^sigma & = 1 / omega integral_0^omega bb(E)_(zeta_(* \, n))
   cal(Z)_(m') \( K_(j')^(sigma \, n) \; zeta_(* \, n) + t \) thin upright(d) t \,\
dot(T)_n^tau & = \[ x \] 1 / omega integral_0^omega bb(E)_(zeta_(* \, n))
  cal(Z)_(m') \( K_(j')^(tau \, n) + x J_(j')^n \; zeta_(* \, n) + t \) thin upright(d) t . $ <obs:terminal-quantities>]

Thus $T_n^tau$ contains no compulsory component, whereas $dot(T)_n^tau$ contains one surviving labelled component.

Let $hat(M)_n$ denote the insertion ratio with the observation cutoff included in both physical sectors.
  Iterating (138), integrating the terminal field, and taking the coefficient of $x$ give the exact stopped identity

#[#set math.equation(numbering: n => "(152)")
 $ hat(M)_n = e^(- g_n \/ \( 2 a \)) D_(upright("ex")) frac(c_(upright("ex")) T_n^tau + dot(T)_n^tau, T_n^0) .
   $ <obs:extraction-identity>]

The common entry scalar cancels within this square. Because the actual local maps remain in their small ball,
  the outside cancellation and complete-scalar copying in Lemma 22 allow us to write the remaining expressions
  exactly as

#[#set math.equation(numbering: n => "(153)")
 $ D_(upright("ex")) = product_(j_0 lt.eq j < j'\
B in cal(A)_j) frac(1 + a_(j B)^(tau \, n), 1 + a_(j B)^(0 \, n)) \, wide c_(upright("ex")) = sum_(j_0 lt.eq j < j'\
B in cal(A)_j) frac(dot(a)_(j B)^(tau \, n), 1 + a_(j B)^(tau \, n)) . $ <obs:extracted-scalars>]

Both are independent of $n in { n_0 \, n_1 }$, although they may depend on the pair.
  Each factor uses the complete scalar assigned to its block.
  All its unlabelled denominators are positive, and $D_(upright("ex")) > 0$.
  We next estimate the terminal quantities in (152) and then justify discarding its last term relatively.

The first estimate is uniform as the number of terminal blocks grows.
  It uses the same observation regulator as the local norms.

#thm([Lemma 6.3.])[
  (Terminal regulator bound).  #emph[With strict reserve in the parameters of (42) ($1 < p_1 < p_2$ and $0 <
    h_(*) < 1 \/ p_2$), let $u$ be a later block side compatible with the fixed entry observation grid.
    Let the square or torus and its $u$-block grid be aligned and compatible, with side $M gt.eq 2 u$.
    Then, with the terminal covariance $C_(gt.eq u)$ from (34),
    for every compatible padded union $X$ of $u$-blocks and sufficiently small $kappa$,
$ bb(E) #scale(x: 120%, y: 120%)[\[] W_u^kappa \( X \, zeta \) e^(V_u \( X \, zeta \))
  #scale(x: 120%, y: 120%)[\]] lt.eq C^(\| X \|) \, wide "Cov" \( zeta \) = C_(gt.eq u) . $

 The terminal Gaussian is on nonconstant modes; the uniform common mean is integrated separately modulo $omega$.
   This bound is uniform as $M \/ u$ increases.]
] <ent:terminal-regulator>

#proof[
  We first prove a positive-order trace estimate. It uses only integral $u$ and $M gt.eq 2 u$,
    independently of the observation-cell grid, so it also applies at the binary tail side used below.
    Stack the differences
  $ #scale(x: 120%, y: 120%)[\(] u^(i - 1) nabla^i zeta \( x \) : 1 lt.eq i lt.eq 4 \, med
    x in D_u \( X \)^(+) #scale(x: 120%, y: 120%)[\)] \, wide "Cov" \( zeta \) = C_(gt.eq u) \, $
  where the superscript $+$ adds the fixed difference stencils.
    For the nearest-neighbor symbol, the covariance multipliers of its diagonal blocks are bounded on the
    fundamental frequency square by
  $ C_i \( u \| xi \| \)^(2 i - 2) \( 1 + u \| xi \| \)^(- 32) . $
  Their suprema are bounded. Their normalized frequency sums are $O \( u^(- 2) \)$ whenever $M gt.eq 2 u$:
    count the $O \( \( M \/ u \)^2 \)$ modes in the disk of radius $u^(- 1)$,
    and sum the convergent outer frequency annuli. The excluded constant mode contributes nothing to a
    positive-order difference. The doubled-torus calculation gives the same estimate after even reflection.
    Positivity bounds the mixed blocks by the diagonal ones. The stacked covariance consequently has bounded
    operator norm and trace at most $C \| X \|$.
  The local discrete Sobolev inequality in the proof of [16] Lemma 4.4 bounds the exponent of $W_u^kappa$ by a
    constant times the squared norm of this stack. Its Gaussian determinant is at most $C^(\| X \|)$ for
    sufficiently small $kappa$. For $V_u$, let $S_(upright(o))$ and $S_(upright(t))$ be the maps from the old
    Gaussian and noise coordinates and from the terminal coordinates into the Hilbert space of the open
    observation energy. Restricting one trial field to all components of an open union can only lower its
    minimized observation energy; each component may minimize its constant separately.
    The same joint trial restriction gives $S_(upright(o)) S_(upright(o))^(*) +
    S_(upright(t)) S_(upright(t))^(*) lt.eq I$. Put $beta = p_1 h_(*) < 1$ and $A_(upright(o)) =
    S_(upright(o)) S_(upright(o))^(*)$. Optimization of the old coordinates leaves,
    in the terminal Gaussian integral of $e^(p_1 V_u)$, the positive matrix
  $ beta S_(upright(t))^(*) \( I - beta A_(upright(o)) \)^(- 1) S_(upright(t)) . $
  Its nonzero spectrum is that of $beta \( I - beta A_(upright(o)) \)^(- 1 \/ 2) S_(upright(t))
    S_(upright(t))^(*) \( I - beta A_(upright(o)) \)^(- 1 \/ 2)$. The latter is bounded above by
  $
    beta \( I - beta A_(upright(o)) \)^(- 1 \/ 2) \( I - A_(upright(o)) \) \( I - beta A_(upright(o)) \)^(- 1 \/
    2) lt.eq beta I \, $
  and its trace is at most $beta \( 1 - beta \)^(- 1) "tr" \( S_(upright(t)) S_(upright(t))^(*) \)$.
    This trace is bounded by
  $ C thin bb(E) E_(D_u \( X \))^0 \( B_s alpha zeta \) lt.eq C thin bb(E) chevron.l zeta \,
    A_(D_u \( X \)) zeta chevron.r lt.eq C \| X \| \, $
  using the same positive-order trace estimate. The fixed spectral gap therefore gives $bb(E) e^(p_1 V_u) lt.eq
    C^(\| X \|)$. Hölder with the reserved parameters combines the two determinants.
    These arguments use no bound on point-value variance; the uniform common mean is integrated separately. ◻
]

#thm([Lemma 6.4.])[
  (Terminal families and translated fields).  #emph[Write
$ W_u^kappa \( X \, phi.alt \) = exp { kappa U_u^(upright("reg")) \( X \, phi.alt \) } . $

 Here $U_u^(upright("reg"))$ is the sum of gradient energy on $D_u \( X \)$, the $u$-weighted boundary trace,
   and the $u^4$-weighted block maxima of squared second differences.
   Its domain contains all boundary endpoints and fixed difference stencils, with even extension at a free wall. Let
$ frak(R)_u^(upright(b)) \( X \, phi.alt \) = W_u^(kappa_(upright(b))) \( X \, phi.alt \)
  e^(V_(u \, h_(upright(b))) \( X \, phi.alt \)) $

 be the regulator used to measure terminal activities, where $V_(u \, h)$ denotes (42) with $h_(*) = h$.]
  #emph[There is a fixed $1 < p_(upright("seg")) < p_1$ with the following property.
    For a support $X$ of $k$ terminal blocks, put $D = D_(m') \( X \)$.
    Suppose a real deterministic field $h_X$, allowed to depend on $n$ and $X$,
    is defined on the full domain just described and satisfies
#[#set math.equation(numbering: n => "(154)")
 $ U_(m')^(upright("reg")) \( X \, h_X \) + chevron.l h_X \, A_D h_X chevron.r lt.eq
   C_(upright("tr")) k $ <obs:terminal-translation>]

 with one uniform constant. Then
#[#set math.equation(numbering: n => "(155)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[]
   frak(R)_(m')^(upright(b)) \( X \, zeta_(* \, n) + h_X \)^(p_(upright("seg"))) #scale(x: 120%, y: 120%)[\]]
   lt.eq C^k . $ <obs:terminal-moment>]

 The same bound holds at every point of a coupled segment between two such endpoints when their local regulator
   forms are identical. A random common anchor may be subtracted at each endpoint after neutral projection.
   The assertion for the segment is a bound on the moment at each parameter value, uniformly in that value.]
  #emph[There are $H_N = O_L \( D_N^2 \)$ terminal blocks in either square.
    Suppose every unlabelled terminal activity has norm at most $nu$ in the weakest norm and put $b_N = C H_N nu$.
    If $b_N = o \( 1 \)$, its terminal partition integral $T$ satisfies
#[#set math.equation(numbering: n => "(156)")
 $ T = 1 + S_1 + O \( b_N^2 \) \, wide \| S_1 \| lt.eq b_N \, wide log T = S_1 + O \( b_N^2 \) \,
   $ <obs:terminal-expansion>]

 where $S_1$ is the sum of single-activity expectations. For a label direction of norm $v$, the derivative obeys
#[#set math.equation(numbering: n => "(157)")
 $ \| dot(T) \| lt.eq C H_N v e^(b_N) . $ <obs:terminal-derivative>]

 These estimates allow the constituent-dependent translations in (154);
   their fixed per-block cost is absorbed by the weight.]
] <obs:terminal-family>

#proof[
  Choose a stronger admissible regulator $frak(R)_u^(upright(s)) =
    W_u^(kappa_(upright(s))) e^(V_(u \, h_(upright(s))))$ from the fixed reserves,
    with $kappa_(upright(s)) > kappa_(upright(b))$ and $h_(upright(b)) < h_(upright(s)) < 1 \/ p_2$.
    Fix a small $epsilon_(upright("tr")) > 0$ with $\( 1 + epsilon_(upright("tr")) \) kappa_(upright(b)) lt.eq
    kappa_(upright(s))$ and $\( 1 + epsilon_(upright("tr")) \) h_(upright(b)) lt.eq h_(upright(s))$.
    The quadratic terms and maxima of squares give
  $ U_u^(upright("reg")) \( X \, phi.alt + h \) lt.eq \( 1 + epsilon_(upright("tr")) \)
    U_u^(upright("reg")) \( X \, phi.alt \) + \( 1 + epsilon_(upright("tr"))^(- 1) \)
    U_u^(upright("reg")) \( X \, h \) . $
  Applying the same quadratic inequality inside the variational definition of $V$,
    while leaving its Cameron penalty unchanged, gives
  $ V_(u \, h_(upright(b))) \( X \, phi.alt + h \) & lt.eq
    V_(u \, \( 1 + epsilon_(upright("tr")) \) h_(upright(b))) \( X \, phi.alt \) +
    C_(epsilon_(upright("tr"))) E_D^0 \( B_s alpha h \)\
 & lt.eq V_(u \, h_(upright(s))) \( X \, phi.alt \) + C_(epsilon_(upright("tr"))) chevron.l h \, A_D h chevron.r . $
  The last inequality tries $alpha h$ in the open observation minimum and uses $alpha^2 = a$.
    Therefore (154) gives the pointwise comparison
  #[#set math.equation(numbering: n => "(158)")
   $ frak(R)_u^(upright(b)) \( X \, phi.alt + h_X \) lt.eq e^(C k) frak(R)_u^(upright(s)) \( X \, phi.alt \) .
     $ <obs:translated-regulator>]
  The internal energy alone would not control the ordinary regulator: its second-difference term also appears in (154).
  Choose $1 < p_(upright("seg")) < p_1$. The matrix estimate in the proof of Lemma 23 gives $bb(E)
    e^(p_1 V_(m' \, h_(upright(s)))) lt.eq C^k$, since $p_1 h_(upright(s)) < 1$.
    Reserve the ordinary determinant at exponent $p_(upright("seg")) kappa_(upright(s))
    p_1 \/ \( p_1 - p_(upright("seg")) \)$. Hölder’s inequality and (158) then prove (155).
    For a compatible family with different $h_X$, apply (158) to each constituent first.
    The product inequality reduces the stronger unshifted regulators to the regulator of their padded union.
    Lemma 23 bounds that union with cost $C^k$. The terminal fields on its constituents need not be independent.
  The actual shifts in this section meet (154). On a shift-good padded block,
    (46) bounds $u \| nabla lambda_n \| + u^2 \| nabla^2 lambda_n \|$ by a fixed constant.
    On both the small wall patches and the central $delta_n$ patches used below, the relevant shift $h_X$ satisfies
  $ u \| nabla h_X \| lt.eq C u \/ n \, wide u^2 \| nabla^2 h_X \| lt.eq C \( u \/ n \)^2 . $
  There are $O \( k u^2 \)$ sites, $O \( k u \)$ boundary edges, and $O \( k \)$ block maxima,
    including holes and fixed stencils. Consequently $U_u^(upright("reg")) + chevron.l h_X \,
    A_D h_X chevron.r lt.eq C k$; on the latter patches the ordinary cost is at most $C
    k \[ \( u \/ n \)^2 + \( u \/ n \)^4 \]$. The regulator is unchanged by a common constant.
    Different lift branches differ by an integer multiple of $omega$,
    so periodicity identifies their activity evaluations.
  For the segment assertion, use the identical local forms at the two endpoints.
    The logarithm of $frak(R)_u^(upright(b))$ is convex: $U_u^(upright("reg"))$ is a sum of positive quadratic
    forms and maxima of squares, and $V_(u \, h_(upright(b)))$ is a positive quadratic form.
    Thus for any coupling and $0 lt.eq r lt.eq 1$,
  $ frak(R)_u^(upright(b)) \( X \, \( 1 - r \) xi_0 + r xi_1 \) lt.eq
    frak(R)_u^(upright(b)) \( X \, xi_0 \)^(1 - r) frak(R)_u^(upright(b)) \( X \, xi_1 \)^r . $
  Hölder applies to the endpoint $p_(upright("seg"))$-moments at each $r$.
    A common anchor removed after neutral projection changes neither the activity nor these regulator energies.
    This proves the stated uniform moment on the segment, without a second moment for $e^V$ or an expectation of a
    supremum over the segment.
  For a compatible family with $h$ constituents and total size $k$,
    the norm and the union bound now give the absolute integral
  $ nu^h \( C \/ A_w \)^k . $
  The rooted count [16] Lemma 4.3 sums one constituent to at most $C H_N nu = b_N$.
    Dropping compatibility enlarges an absolute sum, so unordered families with $h$ constituents cost at most
    $b_N^h \/ h !$. Sum $h gt.eq 2$ and expand the logarithm to obtain (156); in particular $T > 0$ for late $N$.
    Distinguishing one labelled constituent gives $C H_N v$ for it and $e^(b_N)$ for all the others, proving (157). ◻
]

Apply this lemma with $nu = C \/ N$ from (150) and $v lt.eq e^(- c N)$ from (149). Since $D_N^2 \/ N = o \( 1 \)$,

#[#set math.equation(numbering: n => "(159)")
 $ T_n^0 \, T_n^tau = 1 + O \( D_N^2 \/ N \) \, wide \| dot(T)_n^tau \| lt.eq e^(- c N) . $ <obs:terminal-near-one>]

We need a lower bound on $c_(upright("ex"))$ only to discard the last term of (152) relatively.
  It follows from the physical observable and requires no lower bound on the label at entry.
  The cutoff loss in (48) and $M_n = n^(- 1 \/ 8 + o \( 1 \))$ from Proposition 5 give, for the two current sizes,

#[#set math.equation(numbering: n => "(160)")
 $ hat(M)_n = M_n \( 1 + O \( e^(- c N^2) \) \) . $ <obs:cutoff-relative>]

Indeed the unit loss is absolute relative to the uncut centered partition.
  Dividing it by $M_n = e^(- O \( N \))$ still leaves the displayed bound, and the centered loss has the same bound.

Set $Q_n = hat(M)_n e^(g_n \/ \( 2 a \))$. The same rough center asymptotic, (160), and (135) imply

$ Q_n = e^(o \( N \)) > 0 . $

The scalar estimate in Lemma 22 also gives

#[#set math.equation(numbering: n => "(161)")
 $ \| log D_(upright("ex")) \| lt.eq C sum_(j = j_0)^(j' - 1) \( U_j + w_j + d_j \) =
   o \( N \) . $ <obs:scalar-subexponential>]

For the last equality, there are only $O \( 1 \)$ blocks in $cal(A)_j$ at each index.
  The summands are bounded in the small ball and tend uniformly to zero on every fixed-fraction interior interval.
  For fixed $delta > 0$, indices below $delta N$ cost $C delta N + O \( log N \)$; the rest cost $o \( N \)$.
  Let $N arrow.r oo$ and then $delta arrow.b 0$.

Rearranging (152),

$ c_(upright("ex")) T_n^tau = Q_n T_n^0 \/ D_(upright("ex")) - dot(T)_n^tau . $

The first term on the right is positive and at least $e^(- o \( N \))$ by (159) and (161);
  the second is exponentially small. Hence $c_(upright("ex")) > 0$ for late $N$, $c_(upright("ex")) gt.eq
  e^(- o \( N \))$, and $dot(T)_n^tau \/ \( c_(upright("ex")) T_n^tau \) = O \( e^(- c N) \)$.
  Taking logarithms in the two sizes now cancels both $D_(upright("ex"))$ and $c_(upright("ex"))$ exactly.
  With (160), this gives

#[#set math.equation(numbering: n => "(162)")
 $ log M_(n_1) / M_(n_0) = - frac(g_(n_1) - g_(n_0), 2 a) + [log \( T_n^tau \/ T_n^0 \)]_(n_0)^(n_1) +
   O \( e^(- c N) \) \, $ <obs:after-cancellation>]

where $\[ F_n \]_(n_0)^(n_1) = F_(n_1) - F_(n_0)$.

=== 6.3 The terminal energy and the other supports <the-terminal-energy-and-the-other-supports>

By Lemma 24, each terminal logarithm equals its single-activity sum with error $O \( D_N^4 \/ N^2 \)$. We will prove

#[#set math.equation(numbering: n => "(163)")
 $ [log \( T_n^tau \/ T_n^0 \)]_(n_0)^(n_1) = frac(t_(j'), 2 a) \( g_(n_1) - g_(n_0) \) +
   O (D_N^4 / N^2 + frac(1, N D_N)) . $ <obs:terminal-energy>]

The same $t_(j')$ occurs in both computations.

In a single-activity expectation, integration of the common phase replaces an activity $F$ by

$ F_0 \( phi.alt \) = 1 / omega integral_0^omega F \( phi.alt + t \) thin upright(d) t . $

This neutral projection is invariant under every real common constant and has the same norm bound [16]
  Section 4.3, before Lemma 4.5. In particular the fundamental singleton has zero expectation,
  including after a nonconstant lift.

For a single-activity support $X$, let $k = \| X \|$ count its full occupied blocks,
  including all obstruction tags, and put $D_X = D_(m') \( X \)$.
  Choose a fixed small $c > 0$ and use the following disjoint partition:

#[#set math.equation(numbering: n => "(164)")
 $ frak(G)_n & = { X : med X upright(" is wall-free and shift-good") } \,\
frak(W)_n & = { X : med k lt.eq c D_N \, med X upright(" is not wall-free") } \,\
frak(C)_n & = { X : med k lt.eq c D_N \, med X upright(" is wall-free and a defect") } \,\
frak(L)_n & = { X : med k > c D_N \, med X in.not frak(G)_n } . $ <obs:terminal-partition>]

The first class allows every size. These four classes cover every support exactly once.
  This terminal size split is separate from the fixed local-map threshold $n_(upright("sm"))$.
  A support in $frak(W)_n$ is automatically shift-good when $c$ is small:
  if its padded rectangle also met the unit, its occupied extrema in a wall-normal coordinate would span a fixed
  multiple of $n$ minus $O \( m' \)$. Fixed-distance connectivity would then force $k gt.eq c_0 n \/ m'$,
  contradicting $k lt.eq c D_N$. This argument uses no occupied unit block in an unlabelled defect.

Let $cal(I)_n = { B : { B } in frak(G)_n }$ be the singleton blocks in the first class.
  On such a block, the centered and unit activities are the plane activities at $phi.alt$ and $phi.alt +
  lambda_n$. The fundamental singleton vanishes under the phase projection, and the energy singleton contributes exactly

$ t_(j') / 2 bb(E) { e_B^0 \( zeta_(* \, n) + lambda_n \) - e_B^0 \( zeta_(* \, n) \) } = t_(j') /
  2 e_B^0 \( lambda_n \) . $

The cross term vanishes because $zeta_(* \, n)$ is centered.
  On all supports in $frak(G)_n$, the plane remainder has norm $O \( N^(- 2) \)$.
  Its single-activity sum is bounded by the full rooted estimate $O \( D_N^2 \/ N^2 \)$,
  with the weight reserve for the lift. This is an upper bound for the remainder on $frak(G)_n$;
  the other three classes are treated below.

To identify the energy left by these singletons, define an allocation on every terminal block,
  including the omitted ones, directly from the connection:

#[#set math.equation(numbering: n => "(165)")
 $ E_(n \, B) = frac(1, 2 a) sum_(x in B \, med e in { plus.minus e_1 \, plus.minus e_2 }\
{ x \, x + e } upright(" internal to the square")) eta_n \( x \, e \)^2 . $ <obs:endpoint-allocation>]

Each internal unoriented edge is counted at its two endpoints, so

$ sum_B E_(n \, B) = g_n \/ a \, wide E_(n \, B) = e_B^0 \( lambda_n \) quad \( B in cal(I)_n \) $

by (45). Thus the missing central allocations are defined without evaluating a lift at the unit.

For late $N$, the complement of $cal(I)_n$ is a fixed-width strip of terminal blocks at the walls together with
  the same central singleton set in the two centered grids.
  The wall-strip energy in each square is $O \( m' \/ n \) = O \( D_N^(- 1) \)$ by (46).
  On the identical central set, the difference of the two endpoint energy densities is bounded by

$ C (frac(1, n_0 \( 1 + \| x \| \)) + 1 / n_0^2) . $

Write the difference of squares using the plane unit and (46) to obtain this bound.
  Its sum over $\| x \| lt.eq C m'$, with the same internal neighbor stencils, is $O \( m' \/ n_0 \) =
  O \( D_N^(- 1) \)$. Consequently

#[#set math.equation(numbering: n => "(166)")
 $ [sum_(B in cal(I)_n) e_B^0 \( lambda_n \)]_(n_0)^(n_1) = frac(g_(n_1) - g_(n_0), a) +
   O \( D_N^(- 1) \) . $ <obs:energy-allocation>]

Only this two-size difference is asserted; neither omitted central energy is required to be small by itself.
  Since $t_(j') = O \( N^(- 1) \)$, the allocation error contributes $O \( \( N D_N \)^(- 1) \)$ to (163).

For $X in frak(W)_n$, its sites remain a fixed fraction of $n$ from the unit.
  The first two difference bounds in (46), and paths of $O \( k \)$ blocks after one anchor is removed, give

$ parallel lambda_n parallel_(m' \, D_X) lt.eq C \( 1 + k \) \/ D_N . $

The neutral projection of the untwisted wall activity is even under field negation.
  Gaussian symmetry therefore makes the first derivative at zero of $bb(E)
  F_0 \( zeta_(* \, n) + r lambda_n \)$ vanish. Taylor’s formula, the full analytic derivative norm,
  and the moment reserve in Lemma 24 bound its translated expectation difference by

$ frac(\( 1 + k \)^2 C^k, N A_w^k D_N^2) . $

There are $O_L \( D_N \)$ roots near a wall. The rooted shape sum is finite after the fixed weight choice,
  so the total contribution of $frak(W)_n$ is $O \( \( N D_N \)^(- 1) \)$.

For $X in frak(C)_n$, an individual activity can have norm $O \( N^(- 1) \)$ and need not be even.
  A size-$k$ defect has an occupied block within $O \( k + 1 \)$ block distance of the unit:
  its padded rectangle reaches the unit and its block graph is connected within a fixed distance.
  Choose $c$ small enough that every such full padded set, including its stencils,
  lies in a common central fraction of the smaller square. These supports are then the same in the two grids.
  Their unit activities are the common plane prescription at $phi.alt + delta_n$ by (142). Modulo a common constant,

$ parallel delta_n parallel_(m' \, D_X) lt.eq C \( 1 + k \) \/ D_N . $

We compare the terminal fields on this full padded set. Choose a binary side $v = 2^b m' asymp c_2 n_0$,
  with fixed $c_2 > 0$ small enough that the polynomial range through $v$, added to the set and all its stencils,
  remains inside both squares. On nonconstant modes the exact split is

$ A_n^(+) sans(P)_(m')^n = sum_(t = m' \, thin 2 m' \, thin dots.h\
t < v) A_n^(- 1) \( sans(P)_t^n - sans(P)_(2 t)^n \) + A_n^(+) sans(P)_v^n . $

The quotients in the sum use their polynomial continuations at zero.
  Independent Gaussian constants may be added to realize these continuations because $F_0$ is constant-invariant.
  Finite range makes the restrictions of every polynomial piece to the full padded set identical covariance
  matrices in the two squares. For this expectation couple those restrictions identically.
  The unmatched tails $zeta_(upright("long") \, n)$ satisfy, for every fixed $p < oo$ and $1 lt.eq i lt.eq 4$,

$ sup_x parallel nabla^i zeta_(upright("long") \, n) \( x \) parallel_(L^p) lt.eq C_(p \, i) n_0^(- i) . $

This is the positive-order multiplier estimate in the proof of Lemma 23, now at $v asymp n_0$.
  The same local discrete Sobolev estimate applied to $m' nabla zeta_(upright("long") \, n)$ and $\( m' \)^2
  nabla^2 zeta_(upright("long") \, n)$, using two further differences,
  gives their block maxima with bounds $C_p \/ D_N$ and $C_p \/ D_N^2$.
  Paths in an enclosing rectangle of $O \( \( 1 + k \)^2 \)$ blocks control values relative to one anchor.
  Hence the two fields with their backgrounds, after subtracting their respective anchor values, obey

#[#set math.equation(numbering: n => "(167)")
 $ ∥thin parallel xi_1 - xi_0 parallel_(m' \, D_X) thin∥_(L^p) lt.eq
   C_p \( 1 + k \)^C \/ D_N . $ <obs:coupling-direction>]

Here $xi_i$ is the restriction of $zeta_(* \, n_i) + delta_(n_i)$ in the coupling, with its anchor removed.
  The identical short fields cancel on the padded set.

The point norms at these two endpoints have the same local regulator forms.
  To see this precisely, let $M_(D_X)$ be the positive matrix representing the open energy $E_(D_X)^0$ on its
  observation coordinates, and let $L_(D_X)$ be the joint Hilbert map from the old Gaussian and noise coordinates
  to $B_s alpha zeta + e$ on those coordinates. The internal edges and whole observation cells are identical on
  the two padded sets, even when those sets have holes or several components. Thus $M_(D_X)$ is identical.
  The restriction of $C_(< m') = A^(- 1) \( I - sans(P)_(m') \)$ is also identical by its polynomial finite range
  and the wall clearance; the noise law is fixed. Thus $L_(D_X) L_(D_X)^(*)$ agrees.
  The optimized formula [16] Equation (9.16) depends on the Hilbert map only through this covariance,
  as its convergent inverse series shows. Hence $V_(m' \, h_(upright(b)))$ agrees,
  and the ordinary regulator has the same edges and stencils as well.
  This equality is for the local high-mode regulator. The terminal covariances are the different covariances just
  coupled.

Remove the anchor pointwise from the neutral activity and apply the mean value theorem on the segment from $xi_0$
  to $xi_1$. Use (167) in the exponent conjugate to $p_(upright("seg"))$.
  The identical local forms and the endpoint moment (155), with the deterministic backgrounds $delta_n$,
  bound the regulator at each point of this segment. For this support the expectation difference is at most

$ frac(\( 1 + k \)^C C^k, N D_N A_w^k) . $

The same comparison applies to the centered activity, with zero background.
  The location bound for a size-$k$ defect gives only polynomially many possible roots.
  The rooted shape and weight sum absorbs these factors, so $frak(C)_n$ contributes $O \( \( N D_N \)^(- 1) \)$ in
  total.

Finally the supports in $frak(L)_n$ have $k > c D_N$. The absolute rooted bound with the remaining block weight gives

$ C D_N^2 N^(- 1) e^(- c' D_N) = O \( \( N D_N \)^(- 1) \) . $

This includes the large supports reaching both a wall and the unit.
  Large supports in $frak(G)_n$ were already included in its plane remainder estimate.

The partition has now accounted for every single activity:
  the plane energy and the vanishing fundamental on $cal(I)_n$, the plane remainder on $frak(G)_n$,
  and all terms in $frak(W)_n \, frak(C)_n \, frak(L)_n$. Families with at least two constituents contribute the
  separate $O \( D_N^4 \/ N^2 \)$ error from (156). Combining these estimates with (166) proves (163).
  Substitution in (162) proves (134), absorbing the exponentially small error.
  The reference-energy calculation proved (135), completing Proposition 21.

== 7 Summation and the bulk correlation <sec:conclusion>

The preceding comparison gives a convergent amplitude after the leading power and logarithm have been removed.
  The fixed-geometry comparison then transfers that amplitude from center magnetization to the thermodynamic
  correlation.

#proof[
  Put $ell = log L$ and
  $ c_N = g_(L^N) - 2 pi ell N . $
  By (135), $c_N$ converges. The trajectory estimate in Equation (92), used at $j' = N -
    O \( log N \)$ in its valid interior interval, gives
  $ t_(j') = frac(1, 2 ell j') + O (frac(log j', \( j' \)^2)) = frac(1, 2 ell N) + O (frac(log N, N^2)) . $
  Since $c_N$ is bounded, substituting this expression and $g_(L^(N + 1)) - g_(L^N) = 2 pi ell + c_(N + 1) -
    c_N$ into Equation (134) yields
  #[#set math.equation(numbering: n => "(168)")
   $ log M_(L^(N + 1)) - log M_(L^N) =  & - ell / 8 + frac(1, 16 N) - frac(c_(N + 1) - c_N, 16 pi)\
 & + frac(c_(N + 1) - c_N, 32 pi ell N) + rho_N \, wide sum_N \| rho_N \| < oo . $ <eq:magnetization-increment>]
  Here $a = 8 pi$ fixes the two numerical coefficients. The errors are bounded by a constant times
  $ N^(- 2 + 4 epsilon.alt) + N^(- 1 - epsilon.alt) + frac(log N, N^2) \, $
  which is summable for the chosen $0 < epsilon.alt < 1 \/ 10$.
    The term involving the error in $t_(j')$ times $c_(N + 1) -
    c_N$ is included in the last summand because $c_N$ is bounded.
  The unweighted differences of $c_N$ telescope. Their weighted series also converges: for $M gt.eq N_0$,
  $ sum_(N = N_0)^M frac(c_(N + 1) - c_N, N) = c_(M + 1) / M - c_(N_0) / N_0 +
    sum_(N = N_0 + 1)^M c_N (frac(1, N - 1) - 1 / N) . $
  The last sum converges absolutely since $c_N$ is bounded, and the first term tends to zero.
    No bounded-variation assertion about $\( c_N \)$ is needed.
    Finally, $sum_(N < N') N^(- 1) - log N'$ has a finite limit. Summing Equation (168) proves that
  $ log M_(L^N) + frac(ell N, 8) - frac(log N, 16) $
  has a finite real limit. Therefore, for some $b_M in \( 0 \, oo \)$,
  #[#set math.equation(numbering: n => "(169)")
   $ M_(L^N) = b_M \( L^N \)^(- 1 \/ 8) #scale(x: 120%, y: 120%)[\(] log L^N
     #scale(x: 120%, y: 120%)[\)]^(1 \/ 16) \( 1 + o \( 1 \) \) . $ <eq:center-asymptotic>]
  The fixed change from $N^(1 \/ 16)$ to $\( log L^N \)^(1 \/ 16) = \( ell N \)^(1 \/ 16)$ is absorbed into $b_M$.
  This equivalent holds for every integer $n$. Given any sequence $n arrow.r oo$, let $N =
    floor.l log_L n floor.r$. Every subsequence has a further subsequence on which $n \/ L^N arrow.r
    d in \[ 1 \, L \]$. The center ratio (7) in Proposition 5 gives $M_n \/ M_(L^N) arrow.r d^(- 1 \/ 8)$, while
  $ frac(n^(- 1 \/ 8) \( log n \)^(1 \/ 16), \( L^N \)^(- 1 \/ 8) \( log L^N \)^(1 \/ 16)) arrow.r d^(- 1 \/ 8) . $
  Equation (169) therefore holds along that further subsequence. The subsequence criterion proves it along all integers.
  The bulk-to-center limit (8) in Proposition 5 now gives
  $ C_(b_c) \( r \) = c_(upright("shape")) M_r^2 \( 1 + o \( 1 \) \) =
    B_(upright("XY")) thin r^(- 1 \/ 4) \( log r \)^(1 \/ 8) \( 1 + o \( 1 \) \) \, wide B_(upright("XY")) =
    c_(upright("shape")) b_M^2 in \( 0 \, oo \) . $
  The geometric limit concerns the thermodynamic correlation already defined in Equation (2);
    all cutoffs and finite-square computations used only $M_n$.
    Thus the order of limits in the theorem is the prescribed one. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Michael Aizenman, Matan Harel, Ron Peled, and Jacob Shapiro,
  #emph[Depinning in integer-restricted Gaussian Fields and BKT phases of two-component spin models],
  preprint, 2022. #link("https://arxiv.org/abs/2110.09498v3")[arXiv:2110.09498v3].]
#bibitem([2])[Roland Bauerschmidt, #emph[A simple method for finite range decomposition of quadratic forms and
  Gaussian fields], Probability Theory and Related Fields #strong[157] (2013), 817--845.
  #link("https://doi.org/10.1007/s00440-012-0471-y")[doi:10.1007/s00440-012-0471-y].]
#bibitem([3])[Roland Bauerschmidt, Jiwoon Park, and Pierre-François Rodriguez, #emph[The Discrete Gaussian model,
  I. Renormalisation group flow at high temperature], The Annals of Probability #strong[52] (2024), 1253--1359.
  #link("https://doi.org/10.1214/23-AOP1658")[doi:10.1214/23-AOP1658].
  Also #link("https://arxiv.org/abs/2202.02286v2")[arXiv:2202.02286v2].]
#bibitem([4])[Roland Bauerschmidt, Jiwoon Park, and Pierre-François Rodriguez, #emph[The Discrete Gaussian model,
  II. Infinite-volume scaling limit at high temperature], The Annals of Probability #strong[52] (2024),
  1360--1398. #link("https://doi.org/10.1214/23-AOP1659")[doi:10.1214/23-AOP1659].]
#bibitem([5])[V. L. Berezinskii, #emph[Destruction of Long-Range Order in One-Dimensional and Two-Dimensional
  Systems Having a Continuous Symmetry Group. I. Classical Systems], Soviet Physics JETP #strong[32] (1971),
  493--500. #link("https://www.jetp.ras.ru/cgi-bin/dn/e_032_03_0493.pdf")[English translation].]
#bibitem([6])[David C. Brydges, #emph[Lectures on the renormalisation group], in #emph[Statistical Mechanics],
  IAS/Park City Mathematics Series #strong[16], American Mathematical Society, 2009, 7--93.
  #link("https://personal.math.ubc.ca/~db5d/Seminars/PCMILectures/lectures.pdf")[Author-hosted lecture text].]
#bibitem([7])[David C. Brydges and Gordon Slade, #emph[A renormalisation group method. II.
  Approximation by local polynomials], Journal of Statistical Physics #strong[159] (2015), 461--491.
  #link("https://doi.org/10.1007/s10955-014-1164-y")[doi:10.1007/s10955-014-1164-y].
  Also #link("https://arxiv.org/abs/1403.7253v2")[arXiv:1403.7253v2].]
#bibitem([8])[Pierluigi Falco, #emph[Critical exponents of the two dimensional Coulomb gas at the
  Berezinskii--Kosterlitz--Thouless transition], preprint, 2013.
  #link("https://arxiv.org/abs/1311.2237v2")[arXiv:1311.2237v2].]
#bibitem([9])[Jürg Fröhlich and Thomas Spencer, #emph[The Kosterlitz--Thouless transition in two-dimensional
  Abelian spin systems and the Coulomb gas], Communications in Mathematical Physics #strong[81] (1981), 527--602.
  #link("https://doi.org/10.1007/BF01208273")[doi:10.1007/BF01208273].]
#bibitem([10])[Wolfhard Janke, #emph[Logarithmic corrections in the two-dimensional XY model],
  Physical Review B #strong[55] (1997), 3580--3584.
  #link("https://doi.org/10.1103/PhysRevB.55.3580")[doi:10.1103/PhysRevB.55.3580].]
#bibitem([11])[J. M. Kosterlitz, #emph[The critical properties of the two-dimensional XY model],
  Journal of Physics C: Solid State Physics #strong[7] (1974), 1046--1060.
  #link("https://doi.org/10.1088/0022-3719/7/6/005")[doi:10.1088/0022-3719/7/6/005].]
#bibitem([12])[J. M. Kosterlitz and D. J. Thouless, #emph[Ordering,
  metastability and phase transitions in two-dimensional systems], Journal of Physics C:
  Solid State Physics #strong[6] (1973), 1181--1203.
  #link("https://doi.org/10.1088/0022-3719/6/7/010")[doi:10.1088/0022-3719/6/7/010].]
#bibitem([13])[Piet Lammers, #emph[Bijecting the BKT transition], preprint, 2023.
  #link("https://arxiv.org/abs/2301.06905v2")[arXiv:2301.06905v2].]
#bibitem([14])[Piet Lammers, #emph[A dichotomy theory for the height functions of the BKT transition],
  preprint, 2026. #link("https://arxiv.org/abs/2211.14365v4")[arXiv:2211.14365v4].]
#bibitem([15])[Oliver A. McBryan and Thomas Spencer, #emph[On the decay of correlations in $S
  O \( n \)$-symmetric ferromagnets], Communications in Mathematical Physics #strong[53] (1977), 299--302.
  #link("https://doi.org/10.1007/BF01609854")[doi:10.1007/BF01609854].]
#bibitem([16])[OpenAI, #emph[BKT universality for height and planar spin fields],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/BKT-universality-for-height-and-planar-spin-fields-September-24-2026/paper.pdf")[OAI:BKT-universality-for-height-and-planar-spin-fields-September-24-2026],
  2026.]
#bibitem([17])[OpenAI, #emph[The critical correlation exponent of the planar XY model],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-critical-correlation-exponent-of-the-planar-XY-model-September-24-2026/paper.pdf")[OAI:The-critical-correlation-exponent-of-the-planar-XY-model-September-24-2026],
  2026.]
#bibitem([18])[OpenAI, #emph[The Critical Spin Field of the Planar XY Model],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-Critical-Spin-Field-of-the-Planar-XY-Model-October-5-2026/paper.pdf")[OAI:The-Critical-Spin-Field-of-the-Planar-XY-Model-October-5-2026],
  2026.]
#bibitem([19])[Oded Regev and Noah Stephens-Davidowitz, #emph[An Inequality for Gaussians on Lattices],
  SIAM Journal on Discrete Mathematics #strong[31] (2017), 749--757.
  #link("https://doi.org/10.1137/15M1052226")[doi:10.1137/15M1052226].
  Also #link("https://arxiv.org/abs/1502.04796v3")[arXiv:1502.04796v3].]
#bibitem([20])[Diederik van Engelenburg and Marcin Lis, #emph[An Elementary Proof of Phase Transition in the
  Planar XY Model], Communications in Mathematical Physics #strong[399] (2023), 85--104.
  #link("https://doi.org/10.1007/s00220-022-04550-3")[doi:10.1007/s00220-022-04550-3].
  Also #link("https://arxiv.org/abs/2110.09465v2")[arXiv:2110.09465v2].]
