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

#align(center)[#text(size: 16pt, weight: "bold")[Critical Center Magnetization \
in the Planar XY Model]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

For an integer $R gt.eq 1$, let $Lambda_R = \[ - R \, R \]^2 ∩ bb(Z)^2$.
  The planar XY model assigns an angle $theta_x in bb(R) \/ \( 2 pi bb(Z) \)$ to each vertex.
  With free boundary conditions and inverse temperature $b > 0$, its probability density is proportional to

$ exp {b sum_({ x \, y } subset Lambda_R\
\| x - y \| = 1) cos \( theta_x - theta_y \)} \, $

relative to product uniform measure. Each undirected edge is counted once, and there are no exterior bonds.
  Write $bb(E)_(R \, b)^(upright("free"))$ for expectation under this law, and define

#[#set math.equation(numbering: n => "(1.1)")
 $ C_b \( r \) = lim_(R arrow.r oo) bb(E)_(R \, b)^(upright("free")) cos \( theta_0 - theta_(r e_1) \) \, wide
   m \( b \) = lim_(r arrow.r oo) - 1 / r log C_b \( r \) \, wide b_c = inf { b > 0 : m \( b \) =
   0 } . $ <eq:intro-threshold>]

The existence of these limits and the fact that $0 < b_c < oo$ with $m \( b_c \) =
  0$ are among the inputs recalled in Section 2.

In $Lambda_n$, now fix $theta_x = 0$ at every boundary vertex and retain every nearest-neighbor bond inside
  $Lambda_n$, including those incident to its boundary. Let $bb(E)_(n \, b)^0$ denote this law. Our observable is

$ a_n = bb(E)_(n \, b_c)^0 cos theta_0 . $

It measures how strongly an aligned boundary influences the center at criticality.
  The power-law exponent alone does not determine its normalization:
  a slowly varying multiplier can remain invisible to fixed-ratio scaling limits.

#thm([Theorem 1.1.])[
  #emph[Using the height, renormalization, and spin-field inputs from #cite(label("B")) #cite(label("X"))
    #cite(label("S")) stated in Section 2, there is a constant $A_(upright("XY")) in \( 0 \, oo \)$ such that
#[#set math.equation(numbering: n => "(1.2)")
 $ a_n = A_(upright("XY")) thin n^(- 1 \/ 8) \( log n \)^(1 \/ 16) \( 1 + o \( 1 \) \) wide \( n arrow.r oo \) .
   $ <eq:main>]

]
] <thm:main>

The dependence on the three companion results is substantive.
  The height limit fixes the critical Gaussian coefficient,
  the local maps supply the analytic renormalization framework,
  and the spin-field results provide a rough positive lower bound and a ratio limit.
  We state the portions used below before beginning the proof.
  In particular, the critical magnetic contraction and the exact cancellation of its scalar factors are proved
  here; they are not asserted as consequences of a low-temperature magnetic-flow theorem.

=== 1.1 Historical context <historical-context>

The critical behavior of two-dimensional systems with continuous symmetry differs from the conventional picture of
  ordering through spontaneous magnetization. Berezinskii’s analysis of the spin-wave regime and the vortex
  picture developed by Kosterlitz and Thouless identified the mechanism behind a phase with algebraic correlations
  #cite(label("Berezinskii1971")) #cite(label("KosterlitzThouless1973")).
  Kosterlitz’s renormalization analysis predicted the critical exponent and the essential singularity of the
  correlation length #cite(label("Kosterlitz1974")). The treatment of vortices and symmetry-breaking perturbations
  by José, Kadanoff, Kirkpatrick, and Nelson made the relation with Coulomb-gas and periodic-field descriptions
  particularly explicit #cite(label("JoseEtAl1977")). These works supply the physical and methodological ancestry
  of the marginal recursion used here.

Rigorous correlation estimates established important parts of this picture without determining the exact critical
  normalization. McBryan and Spencer’s complex-rotation argument gives an algebraic upper bound
  #cite(label("McBryanSpencer1977")). Fröhlich and Spencer proved low-temperature algebraic lower bounds for the
  plane rotator and related models #cite(label("FrohlichSpencer1981")) Theorem C.
  More recently, van Engelenburg and Lis proved the exponential–polynomial dichotomy with a polynomial lower bound
  also at the critical point #cite(label("VanEngelenburgLis2023")) Theorem 1.
  Lammers identified the correlation-length relation between the XY model and its dual height model,
  relating the massless and delocalized phases #cite(label("Lammers2023")) Theorem 1.
  These results concern the transition and quantitative correlation bounds;
  they do not determine the logarithmic factor in (1.2).

The relevance of logarithmic corrections has long been recognized in finite-size scaling.
  For example, Kenna and Irving discuss the renormalization-group prediction $chi_N asymp
  N^(7 \/ 4) \( log N \)^(1 \/ 8)$ for the susceptibility on a periodic square #cite(label("KennaIrving1995")).
  This is a prediction for a different observable, not a proof of the aligned-boundary one-point asymptotic.
  A square-root relation for the root-mean-square spatially averaged magnetization cannot by itself identify the
  center observable studied here.

Rigorous renormalization methods also give more precise information in related models.
  Dimock and Hurd control the ultraviolet-regularized sine-Gordon model at weak coupling with parameter $beta > 8
  pi$ #cite(label("DimockHurd2000")). Falco constructs marginal trajectories of order $1 \/
  j$ for the dilute Coulomb gas and proves multiplicative logarithms for suitable fractional-charge correlations
  #cite(label("Falco2012")) #cite(label("Falco2013")). Those probe observables and their logarithmic exponents are
  not interchangeable with magnetic observables of the nearest-neighbor cosine model.
  The common mathematical feature is that a coupling which decays as $1 \/ j$, when accumulated over scales,
  produces a power of a logarithm.

Our immediate inputs are the three companion manuscripts #cite(label("B")) #cite(label("X")) #cite(label("S")).
  Their roles are different. The local maps and analytic norms come from #cite(label("B"));
  the critical Bessel-height coefficient $8 pi$ and the required mixed-geometry height limits come from
  #cite(label("X")). The spin-field construction in #cite(label("S")) uses the exact center magnetization as its
  normalization and leaves its asymptotic size unspecified. Theorem 1 identifies that size.
  The additional work is to enter the critical maps on finite histories,
  compare those histories without a rate in the height limit,
  and cancel the magnetic scalar factors exactly before estimating terminal errors.
  We do not use the public results for related models as substitutes for these companion inputs.

=== 1.2 Proof strategy <proof-strategy>

The logarithmic factor in (1.2) reflects the marginal coordinate of the critical height recursion.
  The positive finite amplitude requires the finer, summable control described next.

Fourier duality expresses $a_n$ as a ratio of two partition sums for heights in $2 pi bb(Z)$.
  The numerator has a circulation of $2 pi$ around the center, whereas the denominator has zero circulation.
  The proof has two principal difficulties. First, the observation density of the discrete height model cannot
  simply be assumed small in a Gaussian large-field norm. Second,
  entering the recursion in the presence of a circulation defect can create a large normalization factor.
  An estimate of that factor would be an unnecessary additional problem.

We resolve the first difficulty by working on overlapping finite intervals of scales.
  At a large target index $J$, introduce observations on cells of side comparable to $J^3$,
  and remove exceptionally large neighboring observation differences by a smooth cutoff.
  The cutoff error is exponentially small in $J^3$, whereas the finite physical boxes used in this history have
  logarithmic side of order $J$. The resulting interaction is small in the full analytic norm of the height maps.
  This construction is carried out in Sections 3 and 4.

Each history then runs far enough beyond its target interval to determine the critical branch of the recursion.
  Two observables of the original height law, the variance of a long-wave fluctuation and a characteristic
  coefficient of the mean height, compare the coordinates of different histories at a common absolute scale.
  Section 5 proves these comparisons without assuming a rate for the height scaling limit.
  Section 6 combines them with the marginal recursion. Its conclusion for the running gradient coefficient $t_j$,
  at block side $L^j$, is

#[#set math.equation(numbering: n => "(1.3)")
 $ t_j = frac(1, 2 j log L) + O #h(-0.16667em) (frac(log j, j^2)) \, $ <eq:intro-running>]

where $L$ is a fixed, sufficiently large power of two. Sparse changes of history have summable effects on this
  asymptotic.

To resolve the second difficulty, compare squares of side $2 n$ and $2 L
  n$ in the dual height representation using the same history and the same stopping scale.
  Section 7 keeps the circulation insertion linear throughout the exact partition algebra.
  All scalar factors produced near the insertion are identical in the two squares.
  Their size is immaterial because they cancel in the ratio.
  The residual insertion contracts quickly enough that the rough lower bound on $a_n$ makes its contribution
  negligible even relatively.

What remains is a terminal Gaussian calculation. The energy of the circulation produces the leading power
  $n^(- 1 \/ 8)$; its coupling to (1.3) produces the logarithmic correction. Section 8 proves, for $n = L^j \/ 2$,

#[#set math.equation(numbering: n => "(1.4)")
 $ log a_(L n) - log a_n = - frac(log L, 8) + frac(1, 16 j) + O \( j^(- 1 - epsilon.alt) \) $ <eq:intro-ratio>]

for some $epsilon.alt > 0$. Absolute summability, rather than an estimate of the initial magnetic normalization,
  yields the finite positive amplitude. The spin-field ratio limit then transfers the result from these geometric
  sizes to all integers.

== 2 Height conventions and local map inputs <sec:inputs>

The proof combines three inputs: the critical height coefficient from #cite(label("X")),
  the local integration maps of #cite(label("B")), and the identical-nest comparison of #cite(label("S")).
  We first fix their common normalization. We then specify the analytic spaces in which the local maps operate.
  These inputs include finite-graph inequalities, scaling limits, and local activity maps.
  The entry construction for the critical XY model is supplied below.

=== 2.1 Dual heights and finite comparisons <dual-heights-and-finite-comparisons>

For a graph $G$ consisting of retained nearest-neighbor edges,
  choose one orientation of each edge and write $partial v$ for the oriented gradient.
  Its unit-conductance Laplacian is $A_G = partial^(*) partial$, so that

#[#set math.equation(numbering: n => "(2.1)")
 $ chevron.l v \, A_G v chevron.r = sum_({ x \, y } in E \( G \)) \( v_y - v_x \)^2 . $ <inp:energy-convention>]

Thus each undirected edge contributes once. Heights take values in $2 pi bb(Z)$,
  and an edge difference $2 pi k$ has weight

$ p_b \( k \) = e^(- b) I_k \( b \) \, wide sum_(k in bb(Z)) p_b \( k \) e^(t k) = exp { b \( cosh t - 1 \) } . $

An integral connection $l$ is an edge cochain with values in $2 pi bb(Z)$; it replaces $partial h$ by $partial h +
  l$ in the weights. Write $Z_G^l$ for the resulting sum and $F_G^l = Z_G^l \/ Z_G^0$.
  Without observations or absolute pins, a constant translation by $2 pi
  bb(Z)$ is divided out on each free component. If observations confine the constants,
  their translation copies are summed instead. Changing $l$ by an integral gradient is an exact change of height
  variables.

#thm([Lemma 2.1.])[
  (Fixed-boundary duality).  #emph[Work at $b = b_c$. Let $G_M$ be the free graph of the $M^2$ unit square faces
    in $\[ - n \, n \]^2$, where $M = 2 n$. If $l$ has circulation $2
    pi$ around the central primal vertex and zero circulation around all other interior primal vertices, then
$ a_n = F_(G_(2 n))^l > 0 . $

 The graph retains the edges crossing primal bonds incident to the fixed spin boundary.]
] <inp:duality>

#proof[
  This is the fixed-spin duality of #cite(label("S")) Lemma 2.1.
    In its Fourier current expansion, integration imposes current divergence only at interior spin vertices.
    Bonds lying along the boundary have both spins fixed and cancel from the ratio.
    Every other retained primal bond crosses one dual bond, including a bond incident to the boundary.
    Subtract a unit current from the center to the boundary and rotate the remaining divergence-free current.
    It is a height gradient, uniquely modulo one common translation, and the subtracted current gives $l$.
    The factors $e^b$ cancel. All remaining weights are positive. ◻
]

We shall use the following finite-graph rules in exactly this normalization.
  A centered precision means an additional nonnegative quadratic form,
  including a limit enforcing centered linear equalities. A reference cost for a linear statistic $X =
  sum_e w_e partial_e h$ is $cal(R) \( w \) = sum_e w_e^2$.

#thm([Proposition 2.2.])[
  (Finite comparison inputs).  #emph[The comparisons in #cite(label("X")) Lemmas 2.2 and 2.3 hold on every fixed
    primary graph, also with independent Gaussian observation noises.]
  + #emph[Adding centered precision decreases centered covariance and centered real moment generating functions.
    Covariance in an affine sector, including after a real tilt, dominates centered covariance.
    In particular, for a centered inversion-symmetric law, $log bb(E) e^X gt.eq 1 / 2 "Var" \( X \)$.]
  + #emph[A shifted-to-centered partition ratio is at most one and decreases when the same positive precision is
    added in the two sectors. The shifts may be integral connections, prescribed equality values,
    or observation centers. Monotonicity also holds with a fixed real linear statistic in the numerator exponent;
    that tilted ratio need not be at most one. Infinite penalties may impose nonempty affine constraints.]
  + #emph[Invariant centered characteristic coefficients are nonnegative and increase with precision.
    In the finite-graph situations used here they are positive,
    and the Hessian of their logarithm at any phase is at least its Hessian at zero.
    A phase on a free component is invariant whenever its coefficient total is an integer.]
  + #emph[With any extra centered precision, for each fixed integer $r gt.eq 1$ and real $t$,
#[#set math.equation(numbering: n => "(2.2)")
 $ "Var" \( X \) lt.eq C_b cal(R) \( w \) \, wide bb(E) \| X \|^r lt.eq C_(r \, b) cal(R) \( w \)^(r \/ 2) \, wide
   bb(E) e^(t X \/ sqrt(cal(R) \( w \))) lt.eq C_(t \, b) . $ <inp:reference-cost>]

 The last assertion is used for $cal(R) \( w \) > 0$; a zero-cost statistic vanishes.
   One may minimize the cost over flows with the prescribed divergence and grounded vertices.]
] <inp:comparisons>

The finite Gaussian antecedent is the lattice inequality of Regev and Stephens-Davidowitz
  #cite(label("RegevStephensDavidowitz2017")). The required Bessel-weight comparisons are transferred in
  #cite(label("X")) through independent discrete Gaussian chains in series:
  replace a primary edge by $N$ increments with normalized weights $\( b \/ \( 2 N \) \)^(k^2)$,
  impose endpoint and period constraints, and then let $N arrow.r oo$ at fixed graph.
  The physical sum along a chain tends to the law assigning mass $p_b \( k \)$ to $2 pi k$.
  Quadratic observations remain positive forms in the enlarged coordinates.
  This procedure also transfers the parity identities for two Gaussian replicas and the theta comparison used for
  complex observations. For example, the latter bounds the imaginary-to-real partition ratio at a real affine
  shift by the corresponding centered imaginary ratio; see #cite(label("B")) Equation (9.29) and #cite(label("X"))
  Equation (5.26). The uniform bounds used here are the primary costs in (2.2),
  not inverses of the microscopic chain precision.

=== 2.2 The critical Gaussian coefficient <the-critical-gaussian-coefficient>

For the free height square $B_m = { 0 \, dots.h \, m - 1 }^2$, put $g_m \( x \) = x_1 \/ m$.
  The structural coefficient is the limit

$ a \( b \) = lim_(m arrow.r oo) "Var"_(B_m \, b) chevron.l h \, A_(B_m) g_m chevron.r . $

The existence and the following identifications are inputs from #cite(label("X")).

#thm([Proposition 2.3.])[
  (Height and pin inputs).  #emph[For the mass threshold $b_c$ in Theorem 1, $0 < b_c < oo$, $m \( b_c \) = 0$,
    and the primary height coefficient of #cite(label("X")) satisfies
#[#set math.equation(numbering: n => "(2.3)")
 $ a \( b_c \) = 8 pi . $ <inp:critical-coefficient>]

 At a general positive coefficient $a = a \( b \) > 0$, the following statements hold.]
  + #emph[On free rectangles tending after scaling to a fixed nondegenerate rectangle $U$,
    the tests $chevron.l h \, A_(U_N) f \( dot.op \/ N \) chevron.r$, for smooth $f$ near $overline(U)$,
    have joint Gaussian Laplace and moment limits with covariance $a integral_U nabla f dot.op nabla g$,
    where the lattice mesh is $N^(- 1)$. Mean-free density smears have covariance
    $a \( - Delta_(U \, N) \)^(- 1)$; bounded piecewise continuous densities and face smears,
    centered by a volume smear, are allowed.]
  + #emph[In a fixed polygonal geometry made of finitely many rectangular pieces,
    with positive-width passages and box pin regions $p$, the corresponding limits have precision
$ a^(- 1) integral_U \| nabla v \|^2 \, wide v in H^1 \( U \) \, quad v = 0 med upright("on ") p . $

 Free components are taken modulo constants. A fixed finite-rank nonnegative quadratic penalty in box averages
   gives the corresponding Gaussian penalty; if it controls all free constants,
   those constants are integrated in the limit. Bounded-step coherent rounding is permitted.]
  + #emph[The fractional free mean modulo $2 pi$ tends to uniform measure,
    independently of the Gaussian observations. If $u_m$ is the uniform probability on an $m$-square and $t_m$ is
    a zero-total profile of bounded reference cost, then for every fixed nonzero integer $k$,
$ bb(E) e^(i chevron.l h \, k u_m + t_m chevron.r) arrow.r 0 . $

 Writing $macron(rho)_m$ for the average of the four face probabilities and $z_m =
   bb(E) e^(i chevron.l h \, macron(rho)_m chevron.r)$, one has
#[#set math.equation(numbering: n => "(2.4)")
 $ liminf_(m arrow.r oo) z_(G m) / z_m gt.eq c_b G^(2 - a \/ \( 4 pi \)) $ <inp:face-ratio>]

 for sufficiently large fixed integers $G$, with $c_b > 0$ independent of $G$.]
] <inp:height>

These statements are #cite(label("X")) Sections 1.1 and 6, Theorems 2.4, 2.5, and 3.1.
  Here and below all mesh limits precede variation of the fixed geometry.
  We also use the separated-pin Theorem 3.2 of #cite(label("X")) in the following precise form.
  In a centered high law $mu_m$, with penalty $1 / 2 lr(bar.v.double B_m h bar.v.double)^2$ in finitely many
  component-local box averages controlling the constants, let $H \, p$ be positively separated box regions. Then

$ D_m \( H \, p \) & = log frac(mu_m \( h_H = 0 divides h_p = 0 \), mu_m \( h_H = 0 \)) \,\
r_(H \, m) \( b^p \) & = frac(mu_m \( h_H = 0 divides h_p = b^p \), mu_m \( h_H = 0 divides h_p = 0 \)) $

satisfy $D_m gt.eq 0$, $0 < r_(H \, m) lt.eq 1$, and $bb(E)_(mu_m) r_(H \, m) = e^(- D_m)$.
  The quantities have Gaussian limits with precision $a^(- 1) integral \| nabla v \|^2 +
  lr(bar.v.double B v bar.v.double)^2$. For functions of random guard data,
  this means approximation in probability by a sufficiently long fixed list of smooth guard probes,
  whose joint law and function converge to the Gaussian counterparts.
  The probe list is enlarged after the mesh limit. Conditional Laplace transforms and weak laws have this
  approximation as well, including when the data are sampled under a fixed finite real linear tilt.
  The expectation identity just stated refers to the centered law.

Section 3.6 of #cite(label("X")) supplies the restoration bounds used in the entry argument.
  At zero guard data, a centered restoration ratio lies between its value in a free patch and its value with a
  separating guard pinned. If all restored bonds and forms are supported in $H$,
  pinning every primary height in $H$ makes restoration a fixed scalar.
  The free-to-guard multiplicative gap is bounded by

$ frac(mu_m \( h_p = 0 divides h_H = 0 \), mu_m \( h_p = 0 \)) . $

No observation may cross the separating guard in this comparison.

=== 2.3 Comparing center observables at different sizes <comparing-center-observables-at-different-sizes>

The information from #cite(label("S")) that we need is weaker than the asymptotic formula to be proved:
  it permits an arbitrary slowly varying factor. Its sequential form will eventually pass from geometric square
  sizes to all integers.

#thm([Lemma 2.4.])[
  (Center comparison).  #emph[There is $c > 0$ such that $a_n gt.eq c n^(- 1 \/ 2)$ for all $n gt.eq 1$.
    If $n_k \, n'_k arrow.r oo$ are integer sequences and $n'_k \/ n_k arrow.r d in \( 0 \, oo \)$, then
#[#set math.equation(numbering: n => "(2.5)")
 $ a_(n'_k) / a_(n_k) arrow.r d^(- 1 \/ 8) . $ <inp:center-ratio>]

]
] <inp:regular-variation>

#proof[
  Use the identical nests of #cite(label("S")) Section 6.2.
    Fix a rectilinear approximation to the disk with relative error $epsilon$, an annular ratio $lambda > 1$,
    and an initial lattice radius $R_0$. Let $R_j = R_0 lambda^j$.
    In both squares place exactly the same centered lattice nest, including its filled core,
    through the largest $N$ with $R_N lt.eq eta min \( n_k \, n'_k \)$.
    The bare nest ratio $F_(upright("nest")) \( R_N \)$ is identical in the two observables.
  Every subsequence has a further subsequence on which $R_N \/ n_k arrow.r t > 0$; then $R_N \/ n'_k arrow.r
    t \/ d$. At the fixed parameters both radii stay away from zero and are at most $eta$.
    The exterior formula, Equation (13) of #cite(label("S")), gives,
    with $D = \( - 1 \, 1 \)^2$ and $G_D \( z \, w \) = \( 2 pi \)^(- 1) log \| z - w \|^(- 1) + R_D \( z \, w \)$,
  $ log F_(upright("ext")) \( rho \) = - frac(2 pi log \( 1 \/ rho \) + 4 pi^2 R_D \( 0 \, 0 \), 2 a) +
    O \( epsilon + eta \) + o \( 1 \) . $
  Its constants are uniform for the limiting radii in question.
    The proof of the exterior-attachment Lemma 6.3 applies to each of these two exteriors:
    the centered attachment loss depends only on the final annulus,
    and the cut and restored exterior energies have the same regular Green part.
    Their error is $O \( epsilon + eta \)$, independently of the fixed sufficiently large annular ratio.
    Since $N arrow.r oo$, the propagated last-guard density bound also applies.
    Consequently, for any desired accuracy, the logarithm of each center observable is the sum of its bare nest
    logarithm and exterior logarithm, within that accuracy and an $o \( 1 \)$ error.
    Choose $epsilon \, eta$ small, then $lambda$ large for the pin interactions,
    and finally $R_0$ large for the fixed annuli. Subtracting cancels the nest and the regular Green term and gives
  $ log a_(n'_k) - log a_(n_k) = - pi / a log d + o \( 1 \) $
  up to an arbitrarily small error. As $a = 8 pi$, this is (2.5);
    the subsequence argument proves the full sequential assertion.
  For the lower bound, Equations (18)–(19) of #cite(label("S")) give, at fixed parameters,
  $ a_n gt.eq c_1 F_(upright("nest")) \( R_N \) \, wide F_(upright("nest")) \( R_N \) gt.eq
    c_2 lambda^(- N \/ 2) F_(upright("nest")) \( R_0 \) . $
  The core ratio is positive and $lambda^N lt.eq C n$. This proves the bound for large $n$,
    and positivity handles the remaining sizes. ◻
]

=== 2.4 Covariances, blocks, and analytic norms <covariances-blocks-and-analytic-norms>

We now fix the reference $alpha = sqrt(8 pi)$. Its mean-free Gaussian field $psi$ has covariance $A^(+)$,
  the inverse of the primary unit-edge Laplacian on nonconstant modes;
  its common mean is independently uniform modulo $omega = 2 pi \/ alpha$.
  On the plane we use only finite-support covariance formulas. For a dyadic integer $u$, set

#[#set math.equation(numbering: n => "(2.6)")
 $ P_u \( cos z \) = (frac(sin \( u z \/ 2 \), u sin \( z \/ 2 \)))^64 \, wide sans(P)_u =
   P_u \( 1 - A \/ 64 \) . $ <inp:polynomials>]

The apparent singularities in this polynomial are removable.
  The argument $1 - A \/ 64$ is the specialization of $1 - Q \/ 16$ in #cite(label("B")) Equation (9.11):
  for nearest neighbors $Q = A \/ 4$ and $v_J^2 = 1 \/ 4$, so $A_0 = Q \/ v_J^2 = A$.
  At an entry side $m$, and at subsequent sides $u = m L^j$, the covariances are

#[#set math.equation(numbering: n => "(2.7)")
 $ C_(< u) = A^(- 1) \( 1 - sans(P)_u \) \, wide Gamma_u = A^(- 1) \( sans(P)_u - sans(P)_(L u) \) \, wide
   C_(gt.eq u) = A^(+) sans(P)_u \, $ <inp:covariances>]

with $C_(< m)$ integrated at entry. The first two inverses mean polynomial continuation at the zero eigenvalue;
  the last formula acts on nonconstant modes. No independent-variance factor is inserted.
  The same polynomials are used on free squares, with even reflection at their walls.
  Positivity, finite range, and exact local copying apply to the polynomial accumulated and shell covariances:
  their ranges are $O \( u \)$ and $O \( L u \)$, respectively.
  The terminal covariance need not have finite range. These assertions and the derivative bounds follow from
  #cite(label("B")) Lemmas 8.1 and 4.1 with this argument. In particular positive-order shell and terminal
  estimates through the orders used below hold uniformly when $u lt.eq M \/ D_0$,
  with fixed sufficiently large $D_0$; the plane shell diagonal is $\( 2 pi \)^(- 1) log
  L$ with an error that is a negative power of $u$.

Use the block geometry of #cite(label("B")) Lemma 4.3: with $p = 32$,
  an intermediate connectivity radius is $r_0 = 4 p + 20$ and the polymer connectivity radius is $rho = r_0 + 8$.
  These fixed radii may be enlarged for the prescribed test collars.
  Shell covariance ranges are measured in the output blocks of side $L u$,
  whereas the accumulated covariance $C_(< u)$ has range $O \( u \)$.
  The radius $rho$ is distinct from the tile parameter $R$ used in the entry construction.
  Blocks have side $u$ on the plane and torus. On a free square use nested translated grids,
  with possible end rectangles whose side lengths lie in $\[ u \, 2 u \)$.
  A polymer $X$ is a nonempty finite block set connected by steps of sup block-index distance at most $rho$;
  $\| X \|$ counts its blocks. Two polymers are compatible when their mutual block-index distance exceeds $rho$.
  The coarse closure $macron(X)$ consists of the $L u$-blocks meeting $X$.
  The geometry of #cite(label("B")) Lemma 4.3 supplies a fixed $n_0$ such that

$ \| macron(X) \| lt.eq \| X \| \, wide \| X \| > n_0 med arrow.r.double med \| macron(X) \| lt.eq \| X \| \/ 2 \; $

if $\| X \| lt.eq n_0$, the coarse index diameter of $macron(X)$ is at most one.
  The number of size-$p$ polymers through a fixed block is at most $C_rho^p$.

Let $D_u \( X \)$ contain $X$ and all blocks at index distance at most two,
  with the fixed difference stencils and whole observation cells included.
  Activities depend on the field in $X$ and a fixed microscopic collar;
  $D_u \( X \)$ is the larger testing domain. Our activities are locally analytic functions of real fields and are
  periodic under the common shift $psi mapsto psi + omega$.
  Field-even means $K \( X \; - psi \) = K \( X \; psi \)$,
  a different symmetry from the half-period parity used below.
  For $D = D_u \( X \)$, write $E$ for the ambient nearest-neighbor edge set and use the half-edge energy and
  boundary term

$ g_D \( psi \) & = 1 / 2 sum_(v in D) sum_(e in { plus.minus e_1 \, plus.minus e_2 }) \| nabla_e psi \( v \) \|^2 \,\
cal(B)_u \( D \, psi \) & = u sum_({ v \, w } in E\
\| { v \, w } ∩ D \| = 1) \| psi \( v \) - psi \( w \) \|^2 \,\
cal(T)_u \( D \, psi \) & = sum_(B subset D) u^4 max_(v in B \, thin \| a \| = 2) \| nabla^a psi \( v \) \|^2 . $

Physical free-wall stencils are interpreted by even extension. Set

$ U_u \( X \, psi \) = g_D \( psi \) + delta cal(B)_u \( D \, psi \) + cal(T)_u \( D \, psi \) \, wide
  W_u^kappa \( X \, psi \) = e^(kappa U_u \( X \, psi \)) . $

For a direction $f$ define

$ lr(bar.v.double  bar.v.double) f_(u \, D) = max_(v in D) { \| f \( v \) \| \, u \| nabla f \( v \) \| \,
  u^2 \| nabla^2 f \( v \) \| } . $

The analytic point norm, at a real background $psi$, is

#[#set math.equation(numbering: n => "(2.8)")
 $ \| F \|_(u \, X \, psi) = sum_(r gt.eq 0) frac(h_0^r, r !)
   sup_(lr(bar.v.double f_i bar.v.double)_(u \, D_u \( X \)) lt.eq 1) \| D^r
   F \( psi \) \[ f_1 \, dots.h \, f_r \] \| . $ <inp:point-norm>]

The term with $r = 0$ is $\| F \( psi \) \|$. These real derivatives have locally convergent analytic extensions.
  The full derivative sum controls complex translations of test norm less than $h_0$ and obeys the product inequality.

The entry construction needs one additional, homogeneous quadratic regulator.
  Let $B_s$ average over disjoint side-$s$ observation cells. On an open union $D$ of whole cells define

#[#set math.equation(numbering: n => "(2.9)")
 $ E_D \( y \) = inf_v {alpha^(- 2) chevron.l v \, A_D v chevron.r + lr(bar.v.double B_s v - y bar.v.double)^2} \,
   $ <inp:observation-energy>]

with free constants on every component. Here $A_D$ retains only internal bonds;
  it differs at artificial boundaries from the half-edge allocation $g_D$.
  Choose constants $1 < p_1 < p_2$ and $0 < h_(*) < 1 \/ p_2$,
  with the strict reserves required by the entry estimates. At scale $u = m L^j$, put

#[#set math.equation(numbering: n => "(2.10)")
 $ V_j \( X \, psi \) = 1 / 2 sup_(zeta \, e) {h_(*) E_D #scale(x: 120%, y: 120%)[\(] B_s alpha \( psi + zeta \) +
   e #scale(x: 120%, y: 120%)[\)] - p_1^(- 1) #scale(x: 120%, y: 120%)[\(]
   lr(bar.v.double zeta bar.v.double)_(< u)^2 + lr(bar.v.double  bar.v.double) e^2 #scale(x: 120%, y: 120%)[\)]} .
   $ <inp:variational-regulator>]

The Cameron norm $lr(bar.v.double zeta bar.v.double)_(< u)$ belongs to the ambient accumulated covariance
  $C_(< u)$, including the pieces integrated before entry. Only its restriction to $D$ enters the supremum.
  The variable $e$ is the independent unit observation noise, included once.
  For a singular covariance we use its Gaussian Hilbert space, without inverting a null direction.

For a polymer activity $K$ our norm is

#[#set math.equation(numbering: n => "(2.11)")
 $ lr(bar.v.double  bar.v.double) K_(u \, frak(A) \, V) = sup_(X \, psi)
   frac(frak(A)^(\| X \|) \| K \( X \) \|_(u \, X \, psi), W_u^kappa \( X \, psi \) e^(V_j \( X \, psi \))) .
   $ <inp:norm>]

The supremum includes all real fields. The activity weight $frak(A)$ is unrelated to the Laplacian $A$.
  A fixed finite collection of stronger weights, slightly larger regulator coefficients,
  and analytic-radius reserves may be chosen throughout.

#thm([Proposition 2.5.])[
  (Regulator input).  #emph[The regulator in (2.10) is finite, nonnegative, homogeneous quadratic,
    and constant invariant. It is monotone under support enlargement and additive on compatible separated supports, and
$ 0 lt.eq V_j \( X \, psi \) lt.eq C E_D \( B_s alpha psi \) lt.eq C chevron.l psi \, A_D psi chevron.r . $

 The shell and terminal regulator estimates of #cite(label("B")) Lemmas 4.4 and 9.2 hold with $W_u^kappa$ replaced
   by $W_u^kappa e^(V_j)$, at a cost $C^(\| X \|)$. For a small connected input the output retains the
   half-exponent reserve $W_(L u)^(kappa \/ 2)$; the coefficient of the observation regulator is unchanged.
   The localizations and analytic partition map retain their contraction and nonlinear estimates in (2.11).]
] <inp:regulator>

The key covariance bound underlying this input is $A^(1 \/ 2) C_(< u) A^(1 \/ 2) lt.eq I$.
  Restricting to an open support only lowers the minimized energy in (2.9).
  It is therefore the homogeneous energy that is used in (2.10),
  also when measuring activities in a sector with a magnetic connection.

=== 2.5 The exact partition map and its balanced coordinates <the-exact-partition-map-and-its-balanced-coordinates>

At a finite block scale define

#[#set math.equation(numbering: n => "(2.12)")
 $ cal(Z)_u \( K \; psi \) = sum_(cal(C) med upright("compatible")) product_(X in cal(C)) K \( X \; psi \) \,
   $ <inp:partition-function>]

including the empty collection with value one. Equivalently one sums over block subsets and multiplies the
  activities of their $rho$-connected components. A compulsory insertion activity $I$ uses the degree-one functional

#[#set math.equation(numbering: n => "(2.13)")
 $ cal(Z)_u^(\( 1 \)) \( K \, I \; psi \) = sum_X I \( X \; psi \) sum_(cal(C) med upright("compatible")\
Y med upright(c o m p a t i b l e med w i t h) med X med \( Y in cal(C) \)) product_(Y in cal(C))
  K \( Y \; psi \) . $ <inp:insertion-partition>]

It is the coefficient of $tau$ in $cal(Z)_u \( K + tau I \; psi \)$, with $tau^2 = 0$.
  An input polymer is called small when $\| X \| lt.eq n_0$, and large when $\| X \| > n_0$,
  with the geometric threshold fixed above.

#thm([Proposition 2.6.])[
  (Local partition map).  #emph[In the norms above, shell integration and designated local subtractions give an
    exact identity
#[#set math.equation(numbering: n => "(2.14)")
 $ bb(E) cal(Z)_u \( K \; psi + zeta \) = product_(b in cal(B)_(L u)) \( 1 + a_b \)
   cal(Z)_(L u) \( K' \; psi \) \, wide "Cov" \( zeta \) = Gamma_u . $ <inp:exact-map>]

 The map is complex analytic in small activity inputs, uniformly in finite volume,
   and its nonlinear remainder is bounded by $C_(L \, frak(A))
   epsilon^2$ when the activity norm and separately measured singleton coefficients are at most $epsilon$.
   It preserves the common-shift period and all symmetries respected by the localizations.
   The linear map restricted to large supports has arbitrarily small operator norm,
   relative to the input activity norm, after choosing $frak(A)$ sufficiently large at fixed $L$.]
  #emph[For small field-even neutral bulk inputs, subtraction of the constant and quadratic gradient term gives $C
    L^(- 3)$ before counting fine placements. Subtracting only the constant gives $C
    L^(- 2)$ for even inputs and $C L^(- 1)$ without evenness.
    There are respectively $O \( L^2 \)$, $O \( L \)$, and $O \( 1 \)$ placements at a bulk block,
    a specified wall, and a fixed mark. At $alpha^2 = 8 pi$, the fundamental charge has gain $O \( L^(- 2) \)$;
    for field-even bulk inputs, subtraction of its constant-background cosine coefficient gives an additional
    $L^(- 1)$. Higher charges have summable stronger gains.]
] <inp:partition-map>

These are Proposition 4.8, Lemma 4.5, Corollary 4.7, and Proposition 8.3 of #cite(label("B")).
  Before localization, Gaussian integration groups the union of the coarse closures into components connected at
  radius $r_0$. Different such components are beyond the shell covariance range.
  The subtracted pieces are assigned to coarse singletons with their original exclusion information retained.
  Only designated field-independent coefficients enter $a_b$.
  In particular, a translated quadratic polynomial may retain its nonzero value at zero field inside the activity.
  The same algebra applies in degree one in $tau$; no smallness of the vector $I$ is required to apply the
  derivative of the map at a small background. Coefficients copy from the plane whenever their predecessor
  neighborhoods fit inside the domain with the fixed clearance supplied by the covariance range.

For a full bulk block define the two singleton functions

$ e_B^0 \( psi \) = 1 / 2 sum_(v in B) sum_(e in { plus.minus e_1 \, plus.minus e_2 }) \| nabla_e
  psi \( v \) \|^2 \, wide c_B^alpha \( psi \) = u^(- 2) sum_(v in B) cos \( alpha psi \( v \) \) . $

Their coefficients in a general activity are denoted by $t \/ 2$ and $z$:
  the singleton part is $t e_B^0 \/ 2 + z c_B^alpha$. Denote the remaining activity by $cal(R)$.
  The linear map is triangular,

$ \( t \, z \, cal(R) \)_(+) = \( t + P_j^t cal(R) \, lambda_j z + P_j^z cal(R) \, C_j cal(R) \) +
  O #scale(x: 120%, y: 120%)[\(] \( \| t \| + \| z \| + lr(bar.v.double cal(R) bar.v.double) \)^2
  #scale(x: 120%, y: 120%)[\)] \, wide lr(bar.v.double C_j bar.v.double) lt.eq theta < 1 \, $

where $lambda_j = L^2 e^(- alpha^2 Gamma_u \( 0 \, 0 \) \/ 2)$.
  At marginality the product $ell_j = product_(h gt.eq j) lambda_h$ converges.
  Set $C_(h : j) = C_(h - 1) dots.h.c C_j$ for $h > j$ and $C_(j : j) = I$. The balanced coordinates are

#[#set math.equation(numbering: n => "(2.15)")
 $ T & = t + sum_(h gt.eq j) P_h^t C_(h : j) cal(R) \,\
Z & = ell_j z + sum_(h gt.eq j) ell_(h + 1) P_h^z C_(h : j) cal(R) . $ <inp:balance>]

Both projection series have geometric tails. Their linear map is $\( T \, Z \, cal(R) \)
  mapsto \( T \, Z \, C_j cal(R) \)$.

The exact Gaussian curves of #cite(label("B")) Lemma 10.3 are obtained by initializing the interaction

$ exp (d / 2 sum_B e_B^0) $

without a lattice factor. For each fixed entry scale they have $T_j^g \( d \) = d + O \( d^2 \)$, $Z_j^g \( d \) =
  0$, and $cal(R)_j^g \( d \) = O \( d^2 \)$, analytically on a disk independent of the step.
  In the following coordinate formulas $u$ denotes the Gaussian scalar coordinate rather than a physical block
  side. Define

$ u = \( T_j^g \)^(- 1) \( T \) \, wide B = cal(R) - cal(R)_j^g \( u \) . $

Thus $\( u \, 0 \, 0 \)$ is an exact fixed-coordinate Gaussian trajectory.
  Split $B = B_e + B_o$ into its even and odd parts under the half-period shift $psi mapsto psi + pi \/ alpha$.

#thm([Proposition 2.7.])[
  (Balanced parity map).  #emph[For the critical reference and small, even,
    translation- and square-covariant plane activities, the preceding coordinates satisfy
#[#set math.equation(numbering: n => "(2.16)")
 $ u_(+) - u =  & - H_j Z^2 +
   O #scale(x: 120%, y: 120%)[\(] \( \| u \| + Z^2 \) \( Z^2 + lr(bar.v.double B_e bar.v.double) \) +
   lr(bar.v.double B_e bar.v.double)^2 +
   lr(bar.v.double B_o bar.v.double) \( \| Z \| + lr(bar.v.double B_o bar.v.double) \) #scale(x: 120%, y: 120%)[\)] \,\
Z_(+) - Z =  & - b_j u Z + O #scale(x: 120%, y: 120%)[\(] \( u^2 + Z^2 + lr(bar.v.double B_e bar.v.double) \) \|
  Z \| + \( \| u \| + Z^2 + lr(bar.v.double B_e bar.v.double) + lr(bar.v.double B_o bar.v.double)^2 \)
  lr(bar.v.double B_o bar.v.double) #scale(x: 120%, y: 120%)[\)] \,\
lr(bar.v.double B_(e \, +) bar.v.double) lt.eq  & theta_1 lr(bar.v.double B_e bar.v.double) +
  C \( \| Z \| + lr(bar.v.double B_o bar.v.double) \)^2 \,\
lr(bar.v.double B_(o \, +) bar.v.double) lt.eq  & theta_1 lr(bar.v.double B_o bar.v.double) +
  C \( \| u \| + Z^2 + lr(bar.v.double B_e bar.v.double) \) \| Z \| \, wide theta_1 < 1 . $ <inp:parity-equations>]

 The estimates include their differentiated analytic Taylor bounds.
   The coefficients are bounded above and away from zero, and
#[#set math.equation(numbering: n => "(2.17)")
 $ H_j arrow.r H > 0 \, wide b_j arrow.r 2 log L . $ <inp:coefficient-limits>]

 These are the map in Lemma 10.6 and the coefficient calculation in Proposition 8.5 of #cite(label("B")).]
] <inp:balanced-map>

This proposition is a local analytic input, conditional on entry into and continued residence in its small tube.
  The uniformity needed when the entry scale varies, the absence of exit,
  and the quantitative rate in (2.17) are established in the bulk argument below.

Finally, we record the source estimates used with these local maps.
  For the one-center connection $l$ of Lemma 2, let $r$ minimize $lr(bar.v.double partial r + l bar.v.double)^2$
  on the free dual square and put $eta_l = partial r + l$. If $G_n$ is the inverse of the killed unit-edge
  Laplacian on the interior spin vertices, then orthogonal energy minimization gives

#[#set math.equation(numbering: n => "(2.18)")
 $ lr(bar.v.double eta_l bar.v.double)^2 = \( 2 pi \)^2 G_n \( 0 \, 0 \) . $ <inp:connection-energy>]

By #cite(label("B")) Lemmas 4.2 and 5.2,

#[#set math.equation(numbering: n => "(2.19)")
 $ \| nabla^a eta_l \( v \) \| lt.eq C_a \( 1 + "dist" \( v \, 0 \) \)^(- 1 - a) \, wide 0 lt.eq a lt.eq
   5 . $ <inp:source-lifts>]

On a source-free enlarged rectangle the connection is an exact real gradient;
  the assertion includes the reflected stencils at a free wall.
  Plane and finite-square connection gradients have the same local limit.
  The stronger finite-volume difference estimate needed for the magnetic calculation follows there by subtracting
  the common finite-range pieces and summing the positive-order tails.

All norm choices follow a fixed order: geometry and test collars; the observation-regulator reserves; $delta$,
  then $kappa$ with the necessary integration reserves; the analytic radius $h_0$;
  a sufficiently large power-of-two block factor $L$; activity weights; and the small activity tube.
  For the XY entry construction, the observation-regulator choices must also satisfy the stronger reserve
  condition in Proposition 13. This condition is imposed before fixing $L$ and the weights.
  The subsequent tile parameters and observation-cell size are chosen after these map parameters.
  Constants may depend on parameters already fixed, but never on the volume or the running scale unless explicitly
  indicated.

== 3 Observations, affine Gaussian shapes, and isolation <sec:preparation>

We prepare the critical Bessel height law for the local height maps. The preparation has two parts.
  First, an entire cutoff changes the finite-volume quantities under consideration by an exponentially small
  amount. Second, an exact isolation expansion expresses the cutoff interaction in terms of tile errors,
  restoration errors, and exponentially small Gaussian links.
  The affine Gaussian estimates below allow the same construction in the sector with one circulation.
  The next section proves the analytic norm estimates needed to enter the maps.

=== 3.1 Observation cells and the cutoff <prep:geometry>

Set $alpha = sqrt(8 pi)$, and use the nearest-neighbor polynomial covariances and subset algebra specified in the
  inputs. Thus $A$ is the unit-edge height Laplacian, and the covariance integrated below side $m$ is

#[#set math.equation(numbering: n => "(3.1)")
 $ C_(< m) = A^(- 1) \( 1 - sans(P)_m \) \, $ <prep:entry-covariance>]

with polynomial continuation on constants and with the spectral-argument convention fixed there.
  There is no additional independent-variance factor. We use the same polynomials on free dual squares.
  The remaining reference field has a common constant uniform modulo $2 pi \/ alpha$.
  Statements about the plane concern local formulas; no probability law on absolute plane heights is required.
  The block collars, analytic tests, regulators, and compatibility rules are those of #cite(label("B")) Sections
  9, 8, and 4. The tile parameter $R$ below is distinct from the fixed block connection radius $rho$.

For a dyadic integer $s$, partition the microscopic graph into square #emph[observation cells] of side $s$.
  Write $B_s$ for cell averaging, and introduce independent standard Gaussian variables $e_c$, one per cell.
  The observations are

#[#set math.equation(numbering: n => "(3.2)")
 $ y = B_s h + e . $ <prep:observations>]

All cuts and clippings in this section retain whole observation cells.
  In particular a retained observation face consists of all the microscopic bonds joining the two cells on its sides.

In observation-cell units use the tile geometry of #cite(label("B")) Theorem 9.1 and Subsection 9.2.
  Start with squares of side $R$, remove the square of side $R \/
  2$ centered at each grid vertex from the incident squares, and make each removed square a vertex tile.
  The remaining parts of the original squares and the vertex tiles partition the cells.
  Here $R$ is a large dyadic integer, $P = R^5$, $q$ is a fixed dyadic period parameter large enough for all fixed
  collars, and

#[#set math.equation(numbering: n => "(3.3)")
 $ m = q R s . $ <prep:scales>]

The block factor $L$ is a sufficiently large power of two.
  We use square and torus sides compatible with the grids, at least $s P$, and divisible by $s P$.
  Free-wall tiles are the allowed box clips of this construction; their cuts lie between cell layers.

Choose the common square-symmetry origins at grid vertices,
  which are elementary-square centers in site coordinates. In a pierced square put the source at the central grid
  vertex and take the integral connection $l$ along a grid ray.
  Thus $l$ vanishes inside each observation cell and has a constant value $l_f$ on the microscopic edges crossing
  an oriented observation face $f = \( c \, c' \)$. The source lies in the central vertex tile,
  even though four observation cells meet there. Tori in this proof are unpierced and carry ordinary single-valued
  heights.

On every observation face retained in the graph insert

#[#set math.equation(numbering: n => "(3.4)")
 $ chi_T \( d_f \) = integral_(- T)^T 1 / sqrt(2 pi) e^(- \( d_f - x \)^2 \/ 2) thin d x \, wide d_f = y_(c') -
   y_c + l_f \, wide T = sqrt(s) . $ <prep:cutoff-definition>]

The function $chi_T$ is entire. For real arguments it lies in $\( 0 \, 1 \)$, and $1 - chi_T \( d \) lt.eq
  C e^(- c T^2)$ for $\| d \| lt.eq T \/ 2$. Its role is to give the observation law a quadratic large-field
  reserve on the finite scale intervals used later.

#thm([Lemma 3.1.])[
  (Finite-volume cutoff error).  #emph[On a compatible torus or free square of side $M$,
    the absolute change in the partition sum caused by the product of (3.4),
    divided by the centered partition sum without cutoffs, is at most
#[#set math.equation(numbering: n => "(3.5)")
 $ C \( M \/ s \)^2 e^(- c_1 s) . $ <eq:cutoff-error>]

 The assertion includes a free square with the integral connection $l$.
   On a torus it also holds, with a smaller $c_1 > 0$, after inserting a bounded test,
   a fixed power of a smooth mean-free smear, or a fixed real or complex exponential test of such smears.]
] <prep:cutoff>

#proof[
  Consider adjacent cells $c \, c'$. Send the uniform mass on $c$ to its translate in $c'$ along parallel normal
    lattice paths. Every path has length $s$. Giving each starting site mass $s^(- 2)$ produces an edge flow $a_f$ with
  #[#set math.equation(numbering: n => "(3.6)")
   $ chevron.l a_f \, partial h + l chevron.r = \( B_s h \)_(c') - \( B_s h \)_c + l_f \, wide
     max_e \| a_f \( e \) \| lt.eq C \/ s \, wide sum_e a_f \( e \)^2 lt.eq C . $ <prep:two-cell-flow>]
  Indeed at most $s$ starting sites use any given edge, and there are $O \( s^2 \)$ edges in the two cells.
    Each path crosses the common face once, so its affine offset supplies precisely $l_f$.
    Consequently $d_f = chevron.l a_f \, partial h + l chevron.r + e_(c') - e_c$.
  Apply the tilted shifted-to-centered comparison of #cite(label("X")) Lemma 2.2,
    first on the independent Gaussian chains in series. Release their endpoint, cycle, and period constraints,
    and release the independent observation noises. After the fixed-graph series limit the log transform of one
    primary increment at argument $u$ is $b_c \( cosh \( 2 pi u \) - 1 \)$.
    If $\| w \| lt.eq c sqrt(s)$, all arguments $w a_f \( e \)$ are in a fixed bounded interval. Therefore
  $ sum_e b_c #scale(x: 120%, y: 120%)[\(] cosh \( 2 pi w a_f \( e \) \) - 1 #scale(x: 120%, y: 120%)[\)] + 1 /
    2 w^2 lr(bar.v.double upright(bold(1))_(c') - upright(bold(1))_c bar.v.double)^2 lt.eq C w^2 . $
  The comparison gives this bound for the affine numerator normalized by the centered partition sum as well.
    Choosing $w$ proportional to $sqrt(s)$ and applying the exponential Markov inequality to both signs shows that
    the centered-normalized mass of $\| d_f \| > T \/ 2$ is at most $C e^(- c s)$.
  On $\| d_f \| lt.eq T \/ 2$ use the Gaussian tail bound for $1 - chi_T \( d_f \)$;
    on the complement use $0 lt.eq 1 - chi_T lt.eq 1$. Since $1 - product_f chi_T \( d_f \) lt.eq
    sum_f \( 1 - chi_T \( d_f \) \)$ and there are $O \( \( M \/ s \)^2 \)$ faces, this proves (3.5).
    For the asserted torus insertions, Hölder’s inequality separates the rare-event factor from the test.
    The latter has the required higher moments and exponential moments by #cite(label("X")) Lemma 2.3.
    A fixed complex exponential is handled by its real part in the absolute-value bound.
    The Hölder exponent only decreases the positive rate in (3.5). ◻
]

For the pierced square, the input lower bound $a_n gt.eq c
  n^(- 1 \/ 2)$ converts (3.5) into a relative error bound.
  Its use here requires no information about the eventual normalizing amplitude;
  the bound comes from #cite(label("S")) Equations (18)–(19) and the fixed-spin duality of its Section 2.
  In particular a polynomial loss when dividing by the magnetic partition ratio is harmless when $s$ is chosen on
  the finite histories below.

=== 3.2 The affine observation identity and local lifts <prep:gaussian-identity>

Let $G$ be a graph obtained by the cell cuts just described.
  Write $cal(F) \( G \)$ for its retained observation faces.
  Free constants are allowed on every connected component. Define the Gaussian shape energy by

#[#set math.equation(numbering: n => "(3.7)")
 $ E_G^l \( y \) = inf_v {alpha^(- 2) \| partial v + l \|_G^2 + \| B_s v - y \|^2} . $ <eq:shape-energy>]

Write $E_G = E_G^0$. Let $Z_G^l \( y \)$ be the Bessel height sum with observation penalty
  $exp \( - \| B_s h - y \|^2 \/ 2 \)$ and with all component constants summed.
  No cutoff occurs in this definition. More explicitly, apart from the common normalization of the observation
  noise, it is

$ Z_G^l \( y \) = sum_(h in \( 2 pi bb(Z) \)^(V \( G \))) product_(e in E \( G \)) p_(b_c) #h(-0.16667em)
  (frac(partial h \( e \) + l \( e \), 2 pi)) e^(- \| B_s h - y \|^2 \/ 2) . $

Here $E \( G \)$ denotes the set of microscopic edges, each counted once;
  the observation penalty makes the sum over each component constant finite.
  When subsequently integrating observations, one divides out common translations,
  or uses one period for each free constant.

On the full connected graph, let $r$ minimize the unobserved affine energy, and put $eta_l = partial r + l$.
  The minimizer is determined up to a constant and satisfies

$ partial^(*) eta_l = 0 . $

For $v = r + u$, orthogonality gives $\| partial v + l \|^2 = \| eta_l \|^2 + \| partial u \|^2$.
  Gaussian integration and completion of the observation square consequently give the affine Gaussian observation law

#[#set math.equation(numbering: n => "(3.8)")
 $ y = B_s r + B_s alpha psi + e \, wide "cov"' \( psi \) = A^(+) . $ <eq:gaussian-observation>]

The prime omits constants. The constant of $psi$ is uniform modulo $2 pi \/ alpha$,
  and $e$ has the independent standard Gaussian law already specified.
  This calculation may equivalently be made by first summing height translations and then integrating $y$,
  with the common translation divided out.

For clarity, define the interaction on every cut graph by

#[#set math.equation(numbering: n => "(3.9)")
 $ J_G^l \( y \) = e^(E_G^l \( y \) \/ 2) Z_G^l \( y \) product_(f in cal(F) \( G \)) chi_T \( d_f \) .
   $ <eq:interaction>]

On the full graph suppress $G$. Relative to the unpierced Gaussian integral,
  evaluating $J^l$ under (3.8) introduces the scalar

#[#set math.equation(numbering: n => "(3.10)")
 $ e^(- \| eta_l \|^2 \/ \( 2 alpha^2 \)) . $ <prep:magnetic-scalar>]

To see that this is the complete scalar, the Gaussian integral with fixed observations equals a common determinant
  factor times $e^(- E^l \( y \) \/ 2)$. Translating by $r$ makes its determinant exactly the unpierced
  determinant and leaves the constant energy $\| eta_l \|^2 \/ alpha^2$.
  Multiplication by (3.9) cancels the observation shape. Thus no additional factor involving a chosen local
  harmonic lift is present.

We record the lift estimates that determine how the eventual activities copy between the plane and a square.
  They are consequences of #cite(label("B")) Lemmas 4.2 and 5.2, and the duality in Lemma 5.1,
  with the source period rescaled to $2 pi$ in height units.

Extend the chosen integral ray connection $l$ to the plane.
  Let $eta_oo$ be the divergence-free infinite-plane connection obtained as the local limit of the square
  minimizing connections, equivalently the rotated infinite-plane Green gradient normalized to circulation $2
  pi$ at the source and zero circulation elsewhere. Its energy grows logarithmically with the radius;
  no finite total plane energy is assumed. Since $eta_oo - l$ has zero circulation around every lattice plaquette,
  path integration defines a single-valued real height $r_oo$ by

$ partial r_oo = eta_oo - l . $

Use the same ray convention for $r$ and $r_oo$, and align their additive constants at one fixed height vertex
  adjacent to the mark, chosen consistently with the grids.

#thm([Lemma 3.2.])[
  (Local lifts and comparison of squares).  #emph[Let $r$ be the square minimizer at side $M$ and $r_oo$ the plane
    height just defined. If an axis rectangle and its fixed collar avoid the source,
    choose an integral gauge potential $g$ there with $partial g = l$.
    The local real lift is $lambda = \( r + g \) \/ alpha$, and $partial lambda = eta_l \/ alpha$.
    At interior supports meeting the source, the translation from the pierced-plane calculation to the square is
#[#set math.equation(numbering: n => "(3.11)")
 $ gamma_M = \( r - r_oo \) \/ alpha . $ <eq:lift-difference>]

 In lattice units, for the fixed derivative orders used in the maps,
$ \| nabla^a eta_l \( x \) \| lt.eq C_a \( 1 + "dist" \( x \, upright("source") \) \)^(- 1 - a) . $

 In an inner fixed fraction of the square,
#[#set math.equation(numbering: n => "(3.12)")
 $ \| nabla^a gamma_M \| lt.eq C_a M^(- a) \, wide 1 lt.eq a lt.eq 5 . $ <eq:lift-derivatives>]

 The connection estimate includes the reflected stencils at free walls.
   The affine contribution $\( B_s r \)_(c') - \( B_s r \)_c +
   l_f$ to every retained observation difference is bounded uniformly in $s$ and $M$.]
] <prep:lifts>

#proof[
  The minimizing connection is the rotated killed-Green gradient under the crossing correspondence.
    Away from its source its circulation vanishes, so path integration gives the lift on the stated rectangle.
    The positive-order Green estimates in the cited lemmas give the bound on $eta_l$.
    At a free wall, odd reflection of the killed potential makes the rotated normal component odd and the
    tangential component even, which supplies the required reflected lift.
  In a fixed interior fraction of the box, all finite-range polynomial pieces of side below $c
    M$ coincide exactly with their plane pieces. For a derivative of order $a gt.eq 1$,
    each remaining piece is bounded by $C_a t^(- a)$ at its side $t$.
    Summation over dyadic $t gt.eq c M$ gives (3.12); the smoothed terminal piece has the same bound.
    Only positive-order differences of $r - r_oo$ are used, so the additive normalization does not affect this estimate.
  Finally use the two-cell flow from (3.6) with $eta_l$ in place of $partial h + l$.
    For cells within distance $O \( s \)$ of the mark, its absolute value is bounded by
  $ C / s sum_(e : "dist" \( e \, upright("source") \) lt.eq C s) frac(1, 1 + "dist" \( e \, upright("source") \))
    lt.eq C . $
  For a two-cell pair farther away, the same bound is $C s \/ \( 1 + d \) lt.eq C$, where $d gt.eq
    c s$ is its distance from the mark. This includes the few faces adjacent to the pierced vertex. ◻
]

For later copying, a support is called #emph[shift-good] when its spanning axis rectangle,
  enlarged by $H m$ for a sufficiently large fixed $H$, misses the mark.
  On such a support the connection gauges away and the ordinary calculation is evaluated at $psi + lambda$.
  At an interior support near the mark, the pierced-plane calculation is evaluated at $psi + gamma_M$.
  The spanning rectangle in this definition will include the numerical dependencies of links, as specified below.
  Thus these statements apply to the entire calculation on a support, including an insertion,
  and not just to the fields explicitly occurring in a factor.

=== 3.3 A real large-observation bound <prep:large-observations>

The cutoff yields a uniform strict saving in face differences.
  We first prove the estimate for the height sum without the cutoff.
  It is useful on every open patch, including a clipped patch carrying the connection.

#thm([Lemma 3.3.])[
  (Large observations).  #emph[For every preparation graph $G$ and every real observation vector $y$,
#[#set math.equation(numbering: n => "(3.13)")
 $ frac(Z_G^l \( y \), Z_G^0 \( 0 \)) lt.eq exp {- c sum_(f in cal(F) \( G \)\
\| d_f \| lt.eq 2 T) d_f^2} . $ <eq:large-observation>]

 Consequently, with a possibly smaller constant $c > 0$ independent of $R \, P \, s$,
#[#set math.equation(numbering: n => "(3.14)")
 $ frac(Z_G^l \( y \), Z_G^0 \( 0 \)) product_(f in cal(F) \( G \)) chi_T \( d_f \) lt.eq
   e^(- c sum_(f in cal(F) \( G \)) d_f^2) . $ <prep:face-saving>]

]
] <prep:large-field>

#proof[
  For each face with $\| d_f \| lt.eq 2 T$, insert a real tilt $w_f =
    c_0 d_f$ on the two-cell flow and on the corresponding noise difference.
    At the prescribed observation $y$, the total statistic is the deterministic number $sum_f w_f d_f$.
    The flows have bounded overlap: each is supported on its two cells and each cell meets at most four faces.
    Hence their combined microscopic coefficients $u_e$ and noise coefficients $v_c$ satisfy
  $ max_e \| u_e \| lt.eq C max_f \| w_f \| \/ s \, wide sum_e u_e^2 + sum_c v_c^2 lt.eq C sum_f w_f^2 . $
  We spell out the affine comparison used here. On the Gaussian-chain lattice,
    impose endpoint matches and observations as squared equality penalties.
    Put each prescribed offset, including $l$ and the observation value,
    into an additional coordinate fixed to that value in the numerator and fixed to zero in the denominator,
    with no original energy on that coordinate. The constraints are then the same positive semidefinite additions
    in the affine and centered coordinates. Tilt the affine edge coordinates and the noise variables themselves.
    By #cite(label("X")) Lemma 2.2(ii), adding these common precisions decreases the tilted-to-centered ratio.
    Continuous prescribed observations follow first from finite quadratic penalties and then from the density
    limit. Independent continuous Gaussian variables are allowed in the same comparison,
    or follow by lattice approximation.
  To pass between absolute site heights and relative coordinates,
    one may temporarily retain independent site heights with auxiliary positive precision and send that precision
    to zero. Released tilts involve only edge and noise variables, so the auxiliary factors cancel.
    The constrained quantities in the limit are exactly $Z_G^l \( y \)$ and $Z_G^0 \( 0 \)$,
    with constants summed as defined above. All these limits are at a fixed primary graph.
  Upon releasing the constraints and taking the series limit, the log transform is at most $C sum_f w_f^2$.
    Indeed $max \| w_f \| lt.eq 2 c_0 sqrt(s)$ keeps the edge arguments uniformly bounded,
    and the noise transform is quadratic without restriction. Therefore
  $ e^(sum_f w_f d_f) frac(Z_G^l \( y \), Z_G^0 \( 0 \)) lt.eq e^(C sum_f w_f^2) . $
  Choose the fixed $c_0 > 0$ so small that $c_0 - C c_0^2 > 0$; this proves (3.13).
    For $\| d \| > 2 T$, the Gaussian tail in (3.4) gives $chi_T \( d \) lt.eq e^(- c d^2)$.
    Combining the two ranges proves (3.14). ◻
]

=== 3.4 Localization of the affine shape energy <prep:gaussian-localization>

The Gaussian part of the isolation expansion compares energies on different cut graphs.
  We need these comparisons to be localized in observation-cell distance with constants independent of $s$.
  A nonzero circulation creates a logarithmic energy near a cell junction.
  The next lemma isolates that energy in an exactly local term; the remaining matrix has uniform exponential bounds.

For an observation junction $z$ at which all four faces are retained,
  let $kappa_z \( d \)$ be their oriented circulation. No circulation term is assigned to a junction whose
  retained sectors have tree adjacency. For data $d_f = y_(c') - y_c + l_f$,
  all $kappa_z \( d \)$ vanish except possibly at the source,
  where its absolute value is $2 pi$ if the full star is retained.

#thm([Lemma 3.4.])[
  (Affine shape localization).  #emph[On each open preparation graph there are a quadratic form $L_G$ with a
    fixed-radius stencil in the faces, and a symmetric matrix $N_G$ on those faces, such that
#[#set math.equation(numbering: n => "(3.15)")
 $ E_G^l \( y \) = L_G \( d \) + sum_(f \, g in cal(F) \( G \)) N_G \( f \, g \) d_f d_g \,
   $ <prep:shape-decomposition>]

 where
#[#set math.equation(numbering: n => "(3.16)")
 $ 0 lt.eq L_G \( d \) lt.eq C sum_f d_f^2 + C log \( 2 s \) sum_z kappa_z \( d \)^2 . $ <prep:trial-energy>]

 The forms and matrices may be defined on arbitrary face arrays $d$, without imposing a curl constraint.
   Their nonlocal entries satisfy
#[#set math.equation(numbering: n => "(3.17)")
 $ \| N_G \( f \, g \) \| lt.eq C e^(- c "dist" \( f \, g \)) . $ <prep:matrix-decay>]

 Their dependence on the graph is exponentially localized as well.
   In particular, if faces in a set $D$ are deleted, extend both matrices by zero on missing faces.
   With a fixed stencil enlargement understood in the distances,
#[#set math.equation(numbering: n => "(3.18)")
 $ \| \( N_G - N_(G \\ D) \) \( f \, g \) \| lt.eq C exp {-
   c ("dist" \( f \, g \) + min { "dist" \( f \, D \) \, "dist" \( g \, D \) })} . $ <prep:matrix-cut>]

 The local stencils agree wherever the graphs agree. For the actual one-source data this implies
#[#set math.equation(numbering: n => "(3.19)")
 $ E_G^l \( y \) lt.eq C sum_(f in cal(F) \( G \)) d_f^2 +
   C log \( 2 s \) upright(bold(1))_({ upright("pierced star present") }) . $ <eq:affine-shape-bound>]

]
] <prep:localization>

#proof[
  #emph[Trial extensions.] Subtract $y_c$ from the sites of each cell $c$.
    If $u$ is the resulting site field, then (3.7) becomes
  $ inf_u {alpha^(- 2) \| partial u + j \( d \) \|_G^2 + \| B_s u \|^2} \, $
  where $j \( d \)$ equals $d_f$ on the microscopic edges crossing face $f$ and is zero inside cells.
    Construct a linear trial extension $t \( d \)$ using only a fixed number of cells near each datum.
    Away from face endpoints, put opposite half-jumps on its two sides, with the signs canceling $j \( d \)$,
    and damp these values into the cells at scale $s$. The new differences are bounded by $C \/ s$ times the data size.
  At a vertex with tree adjacency, choose constants on its sectors to cancel the retained jumps.
    At a cyclic vertex, first do this for the part with zero total circulation.
    For the remaining circulation use, inside a disk of radius $c s$, the exact lattice angular field:
    prescribe the affine gradient to be $kappa_z \( d \) \/ \( 2 pi \)$ times the divergence-free infinite-plane
    connection normalized to circulation $2 pi$, obtained by rescaling #cite(label("B")) Lemma 5.2.
    Path integration constructs the sector fields because the prescribed and original circulations agree.
    For unit data its gradient is bounded by $C \/ \( 1 + d \)$ at distance $d$ from the junction.
  The constants can be chosen so that the values used for gluing at radii comparable to $s$ are bounded.
    Integrating along arcs in an annulus of fixed radii ratio gives this assertion;
    successive inner dyadic annuli give, if needed, the sufficient value bound
    $C \( 1 + log^(+) \( s \/ \( 1 + d \) \) \)$. In particular its cell average and its $s^(- 2)$-weighted
    squared site norm are bounded uniformly in $s$. Glue the vertex fields, face strips,
    and zero cell-interior extensions with a partition of unity at scale $s$.
    For example, vertex cutoffs may equal one within sup distance $s \/ 10$ and vanish beyond $s \/ 5$;
    the face strips outside the smaller neighborhoods have width less than $s \/ 10$ and central plateaus.
    On the two sides of a joined face use matching cutoffs, with differences $O \( s^(- 1) \)$.
    At free cuts join only sectors connected by retained faces.
    Averaging the fixed stencils over square symmetries preserves these properties.
  Define
  $ L_G \( d \) = alpha^(- 2) \| partial t \( d \) + j \( d \) \|_G^2 + \| B_s t \( d \) \|^2 . $
  It is exactly local. Its face-strip and gluing energies are bounded by $C sum_f d_f^2$.
    In the inner cyclic neighborhoods, summing $\( 1 + d \)^(- 2)$ over lattice annuli costs $C
    log \( 2 s \)$ times the squared circulation. This proves (3.16).
  #emph[The correction source.] Let $Q_G$ be the homogeneous massive observation form
  #[#set math.equation(numbering: n => "(3.20)")
   $ Q_G \( u \) = alpha^(- 2) \| partial u \|_G^2 + \| B_s u \|^2 \, wide Q_G \( u \, v \) =
     alpha^(- 2) chevron.l partial u \, partial v chevron.r_G + chevron.l B_s u \,
     B_s v chevron.r . $ <prep:massive-form>]
  Cell Poincaré gives, on any union of whole cells,
  #[#set math.equation(numbering: n => "(3.21)")
   $ s^(- 2) sum_c lr(bar.v.double u bar.v.double)_(ell^2 \( c \))^2 lt.eq
     C (sum_c lr(bar.v.double partial u bar.v.double)_(ell^2 \( c \))^2 + sum_c \| \( B_s u \)_c \|^2) .
     $ <prep:cell-poincare>]
  This form controls component constants, including on cut graphs.
  The linear functional produced by the trial field is
  $ q_d \( u \) = alpha^(- 2) chevron.l partial t \( d \) + j \( d \) \, partial u chevron.r_G +
    chevron.l B_s t \( d \) \, B_s u chevron.r . $
  Write $q_d = sum_f d_f q_f$. For each unit face datum, $q_f$ is supported on a fixed number of nearby cells,
    and we claim
  #[#set math.equation(numbering: n => "(3.22)")
   $ \| q_f \( u \) \| lt.eq C Q_G \( u \; U_f \)^(1 \/ 2) . $ <prep:bounded-source>]
  Here $U_f$ is a fixed enlargement of those cells and $Q_G \( u \; U_f \)$ includes their cells and incident
    retained faces. The only issue is the angular gradient, whose full squared norm has the logarithmic bound just
    obtained. Choose a cutoff $xi$ equal to one on its inner disk and supported in a slightly larger disk still
    inside the exact angular region. The connection $eta_oo$ there is divergence-free, so
  $ chevron.l eta_oo \, partial \( xi u \) chevron.r = 0 . $
  Subtract this identity from its pairing with $partial u$.
    All surviving terms lie in an annulus with radii comparable to $s$.
    The connection has bounded squared norm on that annulus. Terms containing $partial xi$ are bounded using $\|
    partial xi \| lt.eq C \/ s$ and (3.21). The other trial pieces have bounded energy,
    and $B_s t$ is bounded as proved above. Cauchy–Schwarz now gives (3.22).
    Thus the logarithmic core energy has not entered the norm of the correction source.
  Let $H_G$ be the positive operator associated with $Q_G$, and let $u_f$ solve $Q_G \( u_f \, v \) =
    q_f \( v \)$. Completing the square around $t \( d \)$ gives
  $ E_G^l \( y \) = L_G \( d \) - q_d \( H_G^(- 1) q_d \) \, wide N_G \( f \, g \) = - q_f \( H_G^(- 1) q_g \) . $
  This proves (3.15); it also shows that the nonlocal matrix is the negative Gram matrix of bounded local sources.
    In particular (3.19) already follows by using the trial field and the stated circulation pattern.
  #emph[Energy decay away from a source.] We give the uniform localization argument because it is also needed for
    graph comparison. A solution $u_f$ is $Q_G$-harmonic outside $U_f$.
    Choose sup-distance boxes in cell units and a cutoff $zeta$ which is zero inside one box,
    one beyond a larger box, and changes on a layer of a fixed large number of cells.
    Interpolate it on sites with $\| partial zeta \| lt.eq C \/ s$ and test the equation with $zeta^2 u_f$.
    The form on cells and joining faces wholly outside the transition layer is the corresponding outside energy.
    Gradient cross terms and mass terms in the transition region are bounded by its energy,
    with one extra layer on either side, using Cauchy–Schwarz and (3.21).
    Consequently, if $F \( k \)$ is the energy outside a box at cell distance $k$,
    there is a fixed width $b_0$ for which
  $ F \( k + 2 b_0 \) lt.eq C #scale(x: 120%, y: 120%)[\(] F \( k - b_0 \) -
    F \( k + 2 b_0 \) #scale(x: 120%, y: 120%)[\)] . $
  Rearranging gives a fixed fractional decrease every $3 b_0$ layers. The total energy is bounded by (3.22), so
  #[#set math.equation(numbering: n => "(3.23)")
   $ Q_G \( u_f \; "dist" \( dot.op \, U_f \) gt.eq k \) lt.eq C e^(- c k) . $ <prep:solution-decay>]
  The proof is unchanged for arbitrary preparation cuts. Intrinsic face distance can also be used:
    assign separate cutoff values to disconnected local sectors and interpolate along retained faces.
    At a joined junction the discrepancies are at most four cell steps, so the same gradient bound applies.
  Applying the local bound (3.22) for $q_g$ to $u_f$ and then (3.23) proves (3.17), after decreasing $c$.
  #emph[Comparison of two graphs.] Suppose two graphs agree in a box of cell radius $k$ about $U_f$.
    Multiply the solution in the first graph by a reversed cutoff,
    equal to one near $U_f$ and zero beyond a transition layer halfway out.
    Transplant it to the second graph and put it equal to zero elsewhere.
    Its equation error against a unit-$Q_G$ test is bounded by $C e^(- c k)$:
    pair the uncut equation with the analogously cut test, and bound the resulting layer terms by (3.21) and the
    square root of the layer energy in (3.23). Coercivity of $Q_G$ bounds the difference from the second solution
    by the same quantity in energy norm. This proves exponentially local dependence of the solution and of the
    matrix entries.
  For a deletion set $D$, each of the two matrices has exponential decay in the entry separation.
    If both entries are far from $D$, their local stencils agree.
    When their separation is small compared with their distance from $D$,
    compare the solutions in a common box as just done. When the separation is larger,
    the separate matrix bounds already give exponential decay in that distance.
    Thus the difference has both a separation bound and a bound in the minimum distance to $D$.
    Taking geometric means of these bounds proves the simultaneous estimate (3.18),
    with smaller exponential constants. Missing rows and columns cause no problem under the zero-extension convention. ◻
]

The same proof supplies the extra estimate used in isolation.
  Compare a true deletion with its calculation on an open patch having clearance of order $R$ from artificial
  boundaries. For entries near the deletion, the graph-comparison argument has a common box of radius $c R$.
  For entries far from it, each deletion change is already exponentially small by (3.18).
  Combining these bounds with separation decay gives, for the error $Delta_i$ at event $i$ with deletion region $D_i$,

#[#set math.equation(numbering: n => "(3.24)")
 $ \| Delta_i \( f \, g \) \| lt.eq C exp {-
   c (R + "dist" \( f \, g \) + min { "dist" \( f \, D_i \) \, "dist" \( g \, D_i \) })} . $ <prep:event-mismatch>]

All local pieces, including the logarithmic circulation terms, cancel exactly in this difference:
  the true and patch calculations have the same retained faces and affine data near the deletion.
  A physical free wall is the same wall on both calculations.
  Enlarging the fixed collars allows the estimate for the bounded groups of simultaneous events used next.
  This is the precise reason that links have an $e^(- c R)$ factor with no additional $log s$ loss.

=== 3.5 Exact isolation and links with numerical dependencies <prep:isolation>

We now apply the finite covariant isolation construction of #cite(label("B")) Subsection 9.2.
  We describe both the scalar normalization and the support labels, because exact copying depends on them.

Color tile centers by their tile type and the square-symmetry orbit of their coordinates modulo $q$,
  in units of $R$. In one color group nearby centers into proximity components,
  with a fixed large proximity radius. Take $q$ greater than sixteen times that radius.
  A square-symmetry orbit has at most eight residue labels.
  If a group contained two distinct centers with the same label,
  choose a shortest proximity path between any such pair. Its interior labels are distinct,
  so the first repeated label occurs within eight steps. Its displacement is therefore less than $q$;
  since its endpoints have the same residue, they must be the same center, a contradiction.
  Thus each label occurs at most once and the group has at most eight centers.
  Distinct groups of the same color have disjoint enlarged neighborhoods.
  Order the finite list of colors, and process groups within a color simultaneously.
  An event isolates every tile in its group, including from the other members of the group,
  deleting a bond only when it is still present.

As in the cited construction, a group’s core contains its tiles and their immediate neighbors,
  its open patch extends a fixed number of tile units farther, and its guard separates core from exterior.
  One may use distances $1$, $5$, and $3$ for core, patch, and start of guard,
  and distances $12$ and $10$ for an enlarged patch and guard when testing pins.
  Enlarge these fixed constants, and first the proximity radius, whenever the fixed collars demand it.
  All distances in this paragraph are in units of $R$ observation cells.

Let $o$ and $c$ denote the current open patch before and after one such deletion. Its proxy is

#[#set math.equation(numbering: n => "(3.25)")
 $ B_i^l \( y \) = frac(Z_o^0 \( 0 \), Z_c^0 \( 0 \)) exp { - 1 /
   2 \( E_o^l \( y \) - E_c^l \( y \) \) } . $ <prep:replacement>]

This is #cite(label("B")) Equation (9.6) with affine shape energies.
  Its constants are always centered and have no cutoff. Delete the physical face cutoff together with that face’s
  microscopic bonds; thus a cutoff is present exactly when its face is retained.

At each considered event write the original local weight as $B_i^l$ times its cut weight plus their difference.
  Selecting the difference marks that event. After a mark skip subsequent events near that group,
  with the fixed skip distance enlarged along with the collars;
  distance $30$ in the preceding geometry suffices before such enlargements. Entire groups are skipped together.
  The resulting binary expansion is an exact finite identity.
  A later considered patch does not meet an earlier marked core or guard,
  so its proxy is independent of the signed choice within the earlier difference.
  The fixed number of batches and the skip rule imply that every remaining cross-tile bond lies in a fixed tile
  halo of a mark. All departures from the path with no marks are confined to these halos.

Let $B_i^(l \, \( 0 \))$ be the proxies on the path with no marked events. Divide the expansion by

#[#set math.equation(numbering: n => "(3.26)")
 $ cal(B)^l \( y \) = product_i B_i^(l \, \( 0 \)) \( y \) product_b Z_b^0 \( 0 \) e^(- E_b^l \( y \) \/ 2) \,
   $ <prep:base>]

where $b$ runs through the isolated tiles. This is the normalization of #cite(label("B")) Equation (9.7),
  again with centered no-cutoff constants and affine energies.
  A marked halo retains its full signed height sum and every affected proxy.
  Outside these halos expand an unused tile factor as

#[#set math.equation(numbering: n => "(3.27)")
 $ frac(e^(E_b^l \( y \) \/ 2) Z_b^l \( y \), Z_b^0 \( 0 \)) product_(f in cal(F) \( b \)) chi_T \( d_f \) = 1 +
   F_b^l \( y \) . $ <prep:tile-factor>]

In the magnetic calculation there is one exception: if the tile containing the source remains unused,
  retain its whole factor rather than expanding it around $1$. It will be the compulsory insertion.
  If the source belongs to a marked halo, that halo supplies the compulsory factor instead.
  Exactly one connected component of every resulting pattern contains the source.

Write $E_0^l$ for the energy appearing in (3.26), so that $cal(B)^l \( y \)$ is a constant times
  $e^(- E_0^l \( y \) \/ 2)$. Combining it with (3.9) leaves the Gaussian factor

#[#set math.equation(numbering: n => "(3.28)")
 $ exp { 1 / 2 \( E^l \( y \) - E_0^l \( y \) \) } . $ <prep:mismatch-factor>]

Telescope the energy changes along the no-mark path. For each event,
  the true change and the open-patch change have identical local parts; their remaining difference is (3.24).
  Summing over events gives a matrix $M$ on face arrays with

#[#set math.equation(numbering: n => "(3.29)")
 $ E^l \( y \) - E_0^l \( y \) = sum_(f \, g) M \( f \, g \) d_f d_g \, wide \| M \( f \, g \) \| lt.eq
   C e^(- c R - c "dist" \( f \, g \)) . $ <prep:link-matrix>]

Before summing, the event localization in (3.24) remains available.
  It makes the sum over event positions uniformly convergent.
  This argument also treats the true free-wall clips, since both paths use the same physical wall.

===== 3.5.1 Telescoping the numerical dependence. <prep:links>

An exponentially small coefficient computed from the whole graph is not yet an exactly local coefficient.
  We resolve it into local calculations before assigning supports.
  For each event and pair of argument faces, take open cell boxes containing the event patch and the two faces.
  The initial radius is a sufficiently large fixed multiple of $R$ plus such a multiple of the largest separation
  among the event and argument faces. Include a fixed $R$-size halo for every numerical tile rule.
  Increase the radius one cell at a time. Let $Delta_i^(\[ D \]) \( f \, g \)$ denote the calculation clipped at
  radius $D$, with the same grids and the same true free walls if one is met.
  Write the exact coefficient as the first clipped calculation plus successive differences

#[#set math.equation(numbering: n => "(3.30)")
 $ Delta_i \( f \, g \) = Delta_i^(\[ D_0 \]) \( f \, g \) +
   sum_(D gt.eq D_0) #scale(x: 120%, y: 120%)[\(] Delta_i^(\[ D + 1 \]) \( f \, g \) -
   Delta_i^(\[ D \]) \( f \, g \) #scale(x: 120%, y: 120%)[\)] . $ <prep:coefficient-telescope>]

On finite squares the sequence becomes exact when the clip contains the graph.
  On the plane it converges by the solution comparison in Lemma 12.
  Every summand depends on a finite box and has exponentially small size in its radius, after weakening constants.
  The first summand has the same bound by (3.24), because its initial radius is controlled by $R$ and the argument
  distances. Subsequent differences have it by comparison on the common interior box.
  In particular the coefficients retain both the $e^(- c R)$ gain and summable decay in the added radius.

On a torus perform the same telescoping only up to a sufficiently small fixed fraction of the period,
  and then use the exact residual as a final term. Give that term a winding label.
  If the initial radius already reaches the threshold, no initial clipped calculation is needed;
  the exact term has exponential decay in the period length because $R$ and the argument distances then control
  that length. Otherwise the last residual has the same decay by graph comparison.
  Include actual winding paths in the support of either kind of terminal term.

Index the bilinear summands resulting from this telescoping by $nu$,
  and write $x_nu \( y \)$ for one-half its coefficient times $d_f d_g$,
  with the chosen symmetric matrix convention. Define the link $ell_nu \( y \) = e^(x_nu \( y \)) - 1$.
  The exact version of #cite(label("B")) Equation (9.10) is now

#[#set math.equation(numbering: n => "(3.31)")
 $ e^(\( E^l \( y \) - E_0^l \( y \) \) \/ 2) = product_nu \( 1 + ell_nu \( y \) \) . $ <prep:link-product>]

At every fixed finite-volume field the coefficient series and this product converge absolutely.
  Their integrated absolute estimates are proved in the entry section.

===== 3.5.2 Support labels and copying. <support-labels-and-copying.>

A link whose numerical box has radius $D'$ in cell units is covered by a path, or a fixed number of paths,
  of total length $O \( R + D' \)$. These paths contain its argument faces and span its numerical dependence.
  Choose paths on the underlying uncut grid; deleted faces do not obstruct a support label.
  Extend them to the coordinate extrema of the dependence box so that their spanning rectangle contains that box.
  When a numerical calculation reaches a free wall, include a path to the wall in its support.
  Equivalently one may always extend the paths to all four sides of the dependence box.
  Include the symmetric image choices to retain square covariance.
  On a torus retain winding lengths and the winding paths specified above.
  The number of $m$-blocks met by such a cover is

#[#set math.equation(numbering: n => "(3.32)")
 $ O \( 1 + D' \/ R \) . $ <prep:link-support-size>]

The support is the blocks on the paths and their prescribed fixed collars;
  the spanning rectangle is used to check the full region on which its numerical coefficient depends.

These rules make copying exact. First telescope on the same cell grids in the plane and in a box.
  Any coefficient whose dependence box and required clearance avoid the physical wall is then the identical local
  calculation in both geometries. A coefficient that does depend on the wall is flagged by a support reaching the
  wall. On a torus, a small unwrapped neighborhood contained in a sufficiently small fixed fraction of the side
  sees precisely the plane terms, since all final residual terms carry winding supports.
  In a simply connected patch avoiding the mark, gauge change turns the face arguments into ordinary differences;
  the numerical rules are unchanged. Near the mark the same construction copies the pierced-plane calculation with
  the translation (3.11). This explains why the spanning rectangle, including its dependence box,
  was required in the definition of shift-good supports.

There are only polynomially many face, event, origin, path,
  and radius labels of a given length above an anchor block.
  The coefficient decay therefore pays the exponential support weights associated with (3.32) when $R$ is large.
  More concretely,

$ \| ell_nu \| lt.eq \| x_nu \| e^(\| x_nu \|) \, wide \| d_f d_g \| lt.eq 1 / 2 \( d_f^2 + d_g^2 \) . $

Assign to each link a small positive face-square cost using these inequalities.
  Summing over every radius and label gives an $O \( e^(- c R) \)$ total coefficient at each face.
  The link fields themselves use only their two argument faces.
  No value of a branch potential along a long covering path is estimated or inserted.
  The enlarged labels are used also for the unmarked calculation and leave the subsequent local maps unchanged.

Finally cover every selected tile and marked event by its required halo,
  and every link by the just specified paths. Average the resulting patterns over $e$ and the Gaussian modes below
  $m$ in (3.8). The covariance (3.1) is positive and has range $O \( m \)$ by #cite(label("B")) Lemma 8.1;
  its shell continuation has the same properties at subsequent scales.
  Choose the fixed connection radius $rho$ large enough to include this range and the activity collars.
  Distinct connected components of a pattern then have independent Gaussian integrations,
  and their numerical choices and field factors separate. Grouping components gives the compatible subset algebra
  of #cite(label("B")) Proposition 4.8. All original exclusions are retained,
  including separation from the component containing the source.
  In the pierced sector exactly that component is the compulsory insertion.
  We have obtained the exact algebraic representation and its copying rules;
  the remaining task is to bound its background and insertion activities in the analytic norm.

== 4 Analytic entry with one magnetic insertion <sec:entry>

The preparation in Section 3 expresses the observed height interaction as an exact sum of local patterns.
  We now estimate that sum in the full analytic norm of (2.11).
  The distinction between an ordinary pattern and a pattern meeting the magnetic source is important:
  ordinary activities will be arbitrarily small, whereas the single activity carrying the source will have a
  polynomial bound in the observation scale. No smallness of that insertion is required.

We use the notation of Section 3. In particular, $s$ is the observation-cell side, $R$ is the tile parameter, $P =
  R^5$, $m = q R s$, and $J_G^l$ is the cutoff interaction associated with the affine observation energy $E_G^l$.
  The polynomial covariance below $m$, its continuation on zero modes,
  and the analytic norm are those fixed in Section 2. The common constant of the reference field is uniform modulo
  $2 pi \/ alpha$.

The regulator must be chosen to accommodate the large-observation saving.
  By (3.14) and (3.19), there is a fixed $h_b in \( 0 \, 1 \)$ such that

$ frac(J_G^l \( y \), Z_G^0 \( 0 \)) lt.eq exp {h_b / 2 E_G^l \( y \) +
  C log \( 2 s \) thin upright(bold(1))_({ upright("pierced star in ") G })} . $

The constants here are independent of $R \, P \, s$. Fix $h_(upright("ent"))$ with $h_b < h_(upright("ent")) < 1$.
  An #emph[entry-admissible reserve] will mean a choice

#[#set math.equation(numbering: n => "(4.1)")
 $ h_(upright("ent")) < h_1 < h_(*) < 1 \/ p_2 \, wide 1 < p_1 < p_2 . $ <eq:entry-admissible-reserve>]

Such choices exist by taking $p_1 \, p_2$ sufficiently close to $1$.
  We make this choice, with room for any fixed finite collection of stronger regulator regimes,
  before choosing $L$ or activity weights. The proof below keeps all actual quadratic charges below
  $h_(upright("ent"))$.

In a pierced square, the #emph[compulsory cover] is the set of entry blocks covering the mark,
  a fixed $C P$-cell neighborhood of it, and the prescribed collars.
  Here $C$ is a sufficiently large fixed geometric constant.
  The cover is declared occupied whether or not an isolation error occurs there,
  and is also called the #emph[token]. Its size can depend on $R$ but not on $s$ or on the square side.

#thm([Proposition 4.1.])[
  (Mesoscopic analytic entry).  #emph[Choose the regulator reserves as in (4.1),
    and fix compatible parameters for the local maps of #cite(label("B")), including the block factor $L$,
    the support geometry, the activity weight $frak(A)$, and the analytic radius.
    A fixed finite collection of stronger weights and entry-admissible regulator regimes may be specified.
    For every $epsilon.alt > 0$, one can choose a fixed dyadic $q$, an arbitrarily large dyadic $R$,
    and then $s_0$, such that the following conclusions hold for every compatible dyadic $s gt.eq s_0$, with $P =
    R^5$ and $m = q R s$.]
  + #emph[In the ordinary case, averaging the observation noise and the reference covariance below $m$ gives local
    activities $K_m$ satisfying
#[#set math.equation(numbering: n => "(4.2)")
 $ lr(bar.v.double K_m bar.v.double)_(m \, frak(A) \, V) lt.eq epsilon.alt . $ <eq:entry-small>]

 This holds on finite plane supports, on compatible tori, and on free squares whose sides are divisible by $s
   P$ and are at least $s P$. Up to a positive field-independent scalar,
   the corresponding subset partition function is exactly the averaged cutoff interaction.
   Activities with their required clearance from a wall or a torus identification are the corresponding plane
   activities. The construction is real, even, and covariant under the block translations and square symmetries
   that preserve the chosen hierarchy.]
  + #emph[In a pierced free square in which the compulsory footprint and its required collars fit,
    the same scalar as in its ordinary counterpart may be extracted. The remaining partition function is
#[#set math.equation(numbering: n => "(4.3)")
 $ cal(Z)_m^(\( 1 \)) \( K_m^l \, I_m \; psi \) \, $ <eq:entry-linear-partition>]

 with exactly one insertion activity $I_m$. Its supports contain the mark block and the compulsory cover just
   specified. The background activities $K_m^l$ are arbitrarily small in their prescribed norms, and
#[#set math.equation(numbering: n => "(4.4)")
 $ lr(bar.v.double I_m bar.v.double)_(m \, frak(A) \, V) lt.eq C_R s^(C_R) . $ <eq:entry-insertion>]

 Here and below $C_R$ may also depend on the fixed downstream norm and geometric parameters,
   but not on $s$ or on the square side. Ordinary occupied supports remain separated from the insertion by the
   original compatibility rule.]
  + #emph[A support is called #emph[shift-good] if its spanning rectangle, enlarged by $H m$,
    misses the magnetic mark. The fixed constant $H$ is chosen from the local-map geometry.
    On such supports the pierced background is the ordinary background evaluated at the local lift $psi + lambda$, where
$ partial lambda = eta_l \/ alpha . $

 On interior supports near the mark, including insertion supports,
   the activities are copies of the pierced-plane calculation evaluated at $psi + gamma_M$,
   with $gamma_M$ and its derivative bounds as in (3.11) and (3.12).
   Copying always includes the collars and numerical dependence required by the activity.]
  #emph[The assertions hold simultaneously in the fixed finite collection of reserve regimes.
    Their constants are uniform after the geometric parameters have been fixed.]
] <prop:entry>

We prove the proposition by adapting the real-pattern and analytic estimates of #cite(label("X")) Section 5,
  Lemma 5.4, together with the normalization and connected pattern arguments of #cite(label("B")) Section 9.
  The point of the proof is to check the hypotheses of those arguments for the unstrengthened XY law with cutoffs
  and for its affine magnetic sector. The Gaussian coefficient in every comparison below is $alpha^2 = 8 pi$.

=== 4.1 Bounded observations and conditional restoration <bounded-observations-and-conditional-restoration>

An isolation error has two positive terms: the restoration kernel before a cut,
  and the restoration kernel after the cut multiplied by its Gaussian proxy.
  Denote these kernels by $K_o$ and $K_c$, and the proxy by $B_i$.
  After conditioning on the guard heights and prescribing the observations, its relative absolute error is

#[#set math.equation(numbering: n => "(4.5)")
 $ delta_i = frac(\| K_o - B_i K_c \|, K_o + B_i K_c) lt.eq 1 . $ <eq:entry-relative-error>]

The kernels in this formula include the face cutoffs retained in their respective graphs.
  A cutoff common to both terms cancels from the ratio. In particular,
  inserting these cutoffs does not change the conditional sampling of guard heights at fixed observations.

First suppose that the observations range over a fixed compact set and that the patch has no magnetic source.
  On this set $chi_(sqrt(s)) \( d_f \)$ tends uniformly to $1$, with positive values;
  its logarithm therefore contributes a uniformly vanishing error to (4.5).
  Other positive real factors only decrease when multiplied by cutoffs.
  For a selected isolated tile, whose factor is its normalized interaction minus $1$,
  the same compact convergence applies to that difference.

The remaining convergence inputs are precisely the mixed-smear, separated-pin,
  and conditional-pin limits of #cite(label("X")), with the observation mass retained.
  Core pins and surrounding guards have fixed positive clearance in tile units.
  All cuts follow whole observation cells, and free-wall patches are clipped with the same actual wall.
  These are the mixed polygonal geometries of the cited limits.
  The observation mass controls the constant on each component.
  Compactness of observation data is understood modulo component periods,
  using the joint components of all faces appearing in a restoration test.

For clarity, the conditional-pin input is convergence in probability under the relevant guard laws,
  not convergence uniformly at arbitrary guard values. In the proof of #cite(label("X")) Equation (5.20),
  conditional terms are integrated under either of the two restoration topologies.
  The restoration comparisons of #cite(label("X")) Lemma 3.9 give exactly these changes of sampling law.
  The local-limit inputs required there are smear limits with observation mass,
  separated hard-pin and conditional-pin limits, their versions with fixed observation tilts,
  and the corresponding finite-geometry Gaussian statements.
  For the present unstrengthened law these are supplied directly by #cite(label("X")) Theorem 3.1 and the
  following restoration estimates; the additional averaged-bond precision used in that paper’s strengthened-law
  entry lemma is absent here.

These statements are uniform on the compact observation sets just specified.
  One way to see the needed uniformity is to let the observation data themselves converge in such a compact set.
  Sampling tilts then vary continuously, with uniform integrability supplied by the observation exponential-moment
  bounds. For each finite list of conditional Laplace terms,
  differences at converging arguments tend to zero in probability:
  their derivatives are bounded by conditional moments on a fixed larger compact set.
  The finite Gaussian terms and proxies converge in the same way,
  and the limiting positive normalizers stay bounded away from zero. Compactness now gives the claim.

Here is the quantitative estimate supplied by these limits.
  Let $cal(E)_(upright("box"))$ be the sum of squared affine face differences on the underlying portion of a
  $P$-box in the padded pattern. It may include faces from a patch whose difference is being tested.
  Recenter one observation in each joint component into $\[ - pi \, pi \]$ by a height period.
  Paths within the box then give

$ lr(bar.v.double  bar.v.double) y_2 lt.eq C P^C \( 1 + sqrt(cal(E)_(upright("box")) \( y \)) \) . $

Thus a fixed bound on $cal(E)_(upright("box"))$ gives a compact observation set.
  Call an error #emph[deep] if its core, open patch, and testing guard lie inside the bounding box with the
  prescribed positive clearances. At fixed $R \, P$, there are finitely many box geometries, positive topologies,
  and choices of deep errors, and their number $j_(upright("deep"))$ is at most a fixed polynomial $N_P$ in $P$.

For a deep error $i$, write $cal(D)_i = log \( K_o \/ \( B_i K_c \) \)$.
  Decompose this logarithm into its centered zero-guard value,
  the change of centered restoration normalization with guard data,
  and the two conditional observation Laplace terms minus the proxy energy change.
  The first term is $O \( e^(- c R) \)$ after refinement. The second lies between $log r_(H_i)$ and zero,
  where $r_(H_i)$ is the conditional full-core pin ratio on a neighborhood $H_i$ containing the restored bonds.
  These are the restoration and pin-interaction estimates just cited.

In the limiting Gaussian problem, let $u_(i \, c)$ be the cut harmonic prediction from the guard data.
  Set $epsilon_i = theta.alt_i u_(i \, c)$, where $theta.alt_i$ equals one near $H_i$ and vanishes before the
  guard. The norm $lr(bar.v.double dot.op bar.v.double)_(cal(T))$ is the continuum
  gradient-plus-unit-cell-observation energy norm on the cut patch, with gradient coefficient $alpha^(- 2)$,
  corresponding to (3.20). The guarded localization estimate of #cite(label("B")) Equation (9.23) gives,
  for every $r gt.eq 2$,

#[#set math.equation(numbering: n => "(4.6)")
 $ (bb(E)_(tau \, y)^(upright("Gauss")) lr(bar.v.double epsilon_i bar.v.double)_(cal(T))^(thin r))^(1 \/ r) lt.eq
   C sqrt(r) thin P^C e^(- c R) \( 1 + sqrt(cal(E)_(upright("box")) \( y \)) \) . $ <eq:entry-prediction>]

Here $tau$ may be either restoration topology, and the expectation is over its Gaussian guard law with fixed
  observation tilt $y$. The constants and polynomial degree are independent of $r$.
  Indeed the centered prediction is $sans(A) g$ in the energy Hilbert space,
  where $g$ has identity covariance and $lr(bar.v.double sans(A) bar.v.double)_(upright("HS")) lt.eq
  C P^C e^(- c R)$. Diagonalization and Gaussian moments bound its $L^r$ energy norm by $C sqrt(r) thin
  lr(bar.v.double sans(A) bar.v.double)_(upright("HS"))$. Restoring bonds decreases the guard covariance.
  The observation tilt adds a deterministic prediction bounded by $C P^C e^(- c R) lr(bar.v.double  bar.v.double)
  y_2$, proving (4.6) under both laws.

Subtracting $epsilon_i$ from a cut minimizer makes it admissible for restoration without changing the guard data.
  Orthogonal projection in the energy space gives

$ - 2 log r_(H_i) lt.eq lr(bar.v.double epsilon_i bar.v.double)_(cal(T))^2 $

and bounds the linear conditional-Laplace discrepancy by $C lr(bar.v.double  bar.v.double) y_2
  lr(bar.v.double epsilon_i bar.v.double)_(cal(T))$. The conditional quadratic discrepancy from the open-patch
  proxy is at most $C e^(- c R) lr(bar.v.double  bar.v.double) y_2^2$, by the same guarded localization.
  If restoration joins free faces, first prescribe finitely many smooth guard probes:
  the cut and restored minimizers belong to nested admissible energy spaces,
  and the correction makes the cut minimizer trace-matching.
  Increasing these finite probe lists gives the assertion. Thus the calculation uses finite-energy predictions,
  not pointwise values of a rough continuum trace.

Since $delta_i lt.eq min \( 1 \, \| cal(D)_i \| \)$, these estimates give Gaussian moment bounds of the form

$ lr(bar.v.double delta_i bar.v.double)_(L^r \( tau \, y \)) lt.eq
  e^(- c_0 R) P^C \( 1 + r \)^C \( 1 + cal(E)_(upright("box")) \( y \) \)^C . $

The microscopic conditional approximation transfers these bounded moments under either topology.
  For this transfer use the normalized conditional restoration ratio:
  the conditional expectation of the positive restoration factor in the centered cut law,
  divided by its value at zero guard. This ratio lies between $r_(H_i)$ and $1$,
  and the limiting Gaussian $r_(H_i)$ is strictly positive.
  Exceptional sets therefore have vanishing probability under both tilted laws, and there $delta_i lt.eq
  1$ suffices. The cutoff ratios add only uniformly vanishing logarithms on the compact observation set.

Let $mu_(tau \, y)$ be a positive topology’s conditional guard law in the box at fixed observations,
  and let $cal(I)_(upright("deep"))$ be its retained deep errors.
  Hölder’s inequality, without an independence assumption on these errors, now yields

#[#set math.equation(numbering: n => "(4.7)")
 $ bb(E)_(mu_(tau \, y)) #h(-0.16667em) [product_(i in cal(I)_(upright("deep"))) delta_i] lt.eq C exp {-
   c R j_(upright("deep")) + R^(- 12) cal(E)_(upright("box")) \( y \)} . $ <eq:entry-good-box>]

For $j_(upright("deep")) gt.eq 1$, use moment order $max \( 2 \, j_(upright("deep")) \)$. The polynomial loss is at most

$ \[ P^C \( 1 + j_(upright("deep")) \)^C \( 1 + cal(E)_(upright("box")) \)^C \]^(j_(upright("deep"))) . $

Maximizing its energy-dependent part after multiplication by $e^(- R^(- 12) cal(E)_(upright("box")))$ costs
  $e^(O \( j_(upright("deep")) log R \))$, since $j_(upright("deep")) lt.eq N_P = "poly" \( P \)$ and $P = R^5$.
  Large $R$ absorbs this loss in the exponential rarity. For $j_(upright("deep")) = 0$ the left-hand side is one.
  The remaining quadratic allowance is precisely

#[#set math.equation(numbering: n => "(4.8)")
 $ R^(- 12) cal(E)_(upright("box")) . $ <eq:entry-good-allowance>]

This transfer needs no convergence rate uniform in $R$. Fix $R \, P$ and the real-data threshold first,
  and prove the Gaussian version of (4.7) with a stronger exponential constant.
  Compactness and the finite list of geometries make the refinement errors,
  including exceptional-set probabilities, smaller than any prescribed positive number.
  Choose this number below the finite minimum of the remaining slack for $1 lt.eq j_(upright("deep")) lt.eq N_P$,
  then take $s$ sufficiently large. The prediction constants and exponential gain have already been fixed;
  only the refinement threshold depends on this transfer tolerance.
  For an isolated selected tile the normalized Gaussian interaction is one,
  so the same compact convergence makes its error from one at most $e^(- c R)$.
  These are the event and tile gains used below in the real pattern estimate.

If a simply connected observation box misses the source, the ray connection is removed by an integral gauge
  constant on each observation cell. The preceding argument then applies without change,
  with $d_f^2$ in the bounding face cost. Enlarged guards and counting halos can be increased by fixed factors.
  At an actual free wall, including a corner, the guards are clipped with that wall;
  no periodic replacement of the boundary condition is used.

=== 4.2 Centered constants and cuts into bounded boxes <centered-constants-and-cuts-into-bounded-boxes>

The estimates must retain the centered normalization even in the magnetic calculation.
  In each pattern telescope only the true centered partition ratios in its affected halos.
  These are $Z_G^0 \( 0 \)$ without cutoffs. The restoration and pin-interaction estimates of #cite(label("X"))
  therefore give the same bounded exponential cost per marked event as in #cite(label("X")) Equations (5.16) and
  (5.17). A fixed distinguished halo may have an extra $e^(C_R)$ cost.
  Nothing is telescoped through an unaffected portion of the volume.

After this accounting, each positive topology has the real field factor

#[#set math.equation(numbering: n => "(4.9)")
 $ frac(J_G^l \( y \), Z_G^0 \( 0 \)) = e^(E_G^l \( y \) \/ 2) product_(f in cal(F) \( G \))
   chi_(sqrt(s)) \( d_f \) frac(Z_G^l \( y \), Z_G^0 \( 0 \)) \, $ <eq:entry-topology-factor>]

multiplied by a conditional expectation of products of (4.5) and by the small energy-error factors.
  Here $cal(F) \( G \)$ is the set of observation faces retained in that topology.
  The double telescoping of normalization constants in #cite(label("B")) Lemma 9.3 now uses the affine matrices of
  Section 3. Their local curl terms cancel exactly: the two paths compare the same deletions with the same nearby
  affine data and connection. At artificial boundaries the two paths are clipped identically in the unchanged
  collar. Only the exponentially small coefficients on face squares remain.

To estimate a topology, cut it into observation boxes of side $P$.
  The shifted comparison #cite(label("B")) Equation (9.20) applies with the connection and with prescribed guard
  values by Proposition 3. Its guard probabilities still use centered partition sums.
  Drop the cutoffs on the new box cuts. The conditional kernels at deep errors, and hence their cutoff ratios,
  are unchanged. The Gaussian localization estimate gives, after averaging translates of the cuts, the logarithmic cost

#[#set math.equation(numbering: n => "(4.10)")
 $ C \( R \/ P \) cal(E) \, $ <eq:entry-seam>]

where $cal(E)$ is a face-square cost confined to the original padded support.
  Indeed each face is within the fixed tile-size neighborhood of a seam for a proportion $O \( R \/ P \)$ of the
  translates; the exponentially decaying matrix tails have the same bound after summation.
  A local curl term can add $C log \( 2 s \)$ only in the box containing the magnetic junction.
  No other elementary cell junction has nonzero circulation.

The same averaging retains a fixed positive proportion, for example one half,
  of the deep errors while satisfying (4.10), after increasing its constant.
  One can first separate the common upper charge for the magnetic curl and then apply the ordinary averaging
  argument. This is the only exceptional seam charge associated with the source.

=== 4.3 The compulsory cover and large observations <the-compulsory-cover-and-large-observations>

In the pierced calculation use the compulsory cover defined before Proposition 13.
  Choose its constant $C$ large enough that every bounding box belonging to a component disjoint from this cover
  can be tested away from the source. There is exactly one token in a pattern.

In the token component use the good-box estimates outside the fixed number of boxes meeting the source.
  In those exceptional boxes take only $delta_i lt.eq 1$. They contain at most $"poly" \( P \)$ events,
  and the missing gains can therefore be paid by a constant depending on $R$.
  We next give a bound that applies both to these boxes and to boxes with large observations.

The cutoff large-field estimate and (3.19) give the bound used in choosing $h_b$ above:

#[#set math.equation(numbering: n => "(4.11)")
 $ frac(J_G^l \( y \), Z_G^0 \( 0 \)) lt.eq exp {h_b / 2 E_G^l \( y \) +
   C log \( 2 s \) thin upright(bold(1))_({ upright("pierced star in ") G })} . $ <eq:entry-broad-bound>]

To check the strict inequality $h_b < 1$, combine (3.13) with the Gaussian decay of the cutoff on the remaining
  faces. The logarithm of the right-hand side of (4.9) is at most

$ 1 / 2 E_G^l \( y \) - c sum_(f in cal(F) \( G \)) d_f^2 . $

Since (3.19) bounds $E_G^l$ by a fixed multiple of that face sum plus the displayed curl charge,
  a fixed fraction of $E_G^l \/ 2$ is saved. This fraction is independent of $s \, R \, P$.
  The initial choice of $h_b$ can be made positive by enlarging it while preserving $h_b < 1$.
  For a selected isolated-tile difference the same argument allows the sum of this bound and $1$.

It remains to express these affine costs in the homogeneous energy used in the norm. Write

$ x = y - B_s r \, $

taking $r = 0$ in the ordinary sector, and let $D$ be the underlying padded support.
  Restrictions of a trial field for $E_D \( x \)$ show that the sum of the cut homogeneous observation energies is
  at most $E_D \( x \)$. A quadratic inequality in (3.7), followed by (3.19),
  bounds the affine part from $B_s r$ by $O \( "poly" \( P \) \)$ per broad box,
  and by $O_R \( log \( 2 s \) \)$ for the token calculation.
  Here the affine face differences of $B_s r$ are uniformly bounded by the source estimates of Section 3.
  Choose the quadratic-inequality parameter so that its increase in $h_b$ is less than one quarter of
  $h_(upright("ent")) - h_b$. This is a fixed choice made before $R$;
  its deterministic cost only changes the constants depending on $R$.

Small face costs are handled by the two-cell Poincare estimate.
  Their deterministic affine parts cost their coefficient times the number of faces.
  In particular, (4.10) adds $O \( \( R \/ P \) R^2 \)$ per affected halo,
  and (4.8) adds $O \( R^(- 12) P^2 \)$ per occupied bounding box.
  Link costs have their exponentially small summable coefficients.
  Both large-observation thresholds and the regulators are evaluated on real data.
  If a box is declared large because $cal(E)_(upright("box")) > U_(upright("big"))^2$, insert

#[#set math.equation(numbering: n => "(4.12)")
 $ 1 lt.eq exp { epsilon.alt_1 \( cal(E)_(upright("box")) - U_(upright("big"))^2 \) } \, $ <eq:entry-bad-payment>]

with fixed sufficiently small $epsilon.alt_1 > 0$. Choose it so that its increase in the energy coefficient uses
  less than another quarter of $h_(upright("ent")) - h_b$. Its positive part uses only a further small increase of
  the energy coefficient and $O \( "poly" \( P \) \)$ per such box. Its negative part will pay the lost good-box gains.

The remaining seam, good-box, and link coefficients tend to zero as $R$ increases.
  Choose $R$ so that their sum uses less than the remaining half of $h_(upright("ent")) - h_b$.
  The actual energy coefficient $h_(upright("used"))$ therefore satisfies

$ h_(upright("used")) < h_(upright("ent")) < h_1 < h_(*) < 1 \/ p_2 \, wide 1 < p_1 < p_2 \, $

with the regulator parameters already fixed in (4.1). This ordering is uniform for large $s$ and applies in each
  of the finitely many reserve regimes.

=== 4.4 Gaussian averaging and the real pattern bound <gaussian-averaging-and-the-real-pattern-bound>

We now average the observation noise and the reference modes below $m$.
  This step uses the contraction of the homogeneous observation energy and the localized determinant estimate in
  #cite(label("B")) Lemma 9.2. It is important to apply the trace estimate to the actual quadratic costs before
  replacing them by their common energy majorant. A broad box has only $O \( P^2 \)$ observation coordinates,
  so its contribution has rank $O \( P^2 \)$. This remains true for a box meeting the magnetic source.
  Every Gaussian adjacent-cell difference has bounded variance:
  use the two-cell flow from Section 3, now in the ordinary Gaussian field.
  Hence the remaining trace estimate is exactly the localized trace estimate of #cite(label("X")) Equation (5.24).
  Links retain their exponential path costs.

After fixing norm parameters and then large $R \, P$, choose the finite $U_(upright("big"))$ so that the negative
  term in (4.12) pays the broad-box trace, all polynomial box costs, and all lost item gains.
  Only after this choice do we invoke the compact-data estimates and increase $s$. The identities $P = R^5$ give

$ \( R \/ P \) R^2 = R^(- 2) \, wide R^(- 12) P^2 = R^(- 2) \, $

so the seam and good-box allowances leave strict room for the exponential gains.

For a pattern $pi$, let $j_1$ count its isolation errors and $j_2$ its selected tiles.
  Let $d_ell$ denote the cell-distance parameter of a link, including its numerical dependence radius.
  If $X$ is the covered block support and $F_pi$ its averaged field factor, the resulting real estimate has the form

#[#set math.equation(numbering: n => "(4.13)")
 $ \| F_pi \( psi \) \| & lt.eq C^(j_1 + j_2) e^(- c R \( j_1 + j_2 \)) product_ell C e^(- c \( R + d_ell \))
   W_m^(kappa_0) \( X \, psi \) e^(V_0 \( X \, psi \)) \, wide kappa_0 < kappa . $ <eq:entry-real-pattern>]

For a pattern with the token, multiply the right-hand side by $C_R s^(C_R)$.
  The fixed number of exceptional boxes and the $O_R \( log \( 2 s \) \)$ curl charge are precisely the sources of
  this factor. There is only one such factor. The sum over choices of small- and large-observation boxes costs a
  fixed exponential per ordinary item, or a fixed $C_R$ in the token component.

If a favorable cut translate was selected according to the real argument,
  dominate that selection by the sum over all translates. The number of choices gives at most a polynomial-in-$R$
  factor per error, absorbed in the exponential item gain. No optimized-cut comparison is needed for a pattern
  with no error event; fixed token costs are already permitted.
  In particular, this step never introduces a determinant whose rank grows with the microscopic cell size $s$.

The same regulator argument applies on free squares. Restricting to an open support lowers the homogeneous minimum
  energy. The positive-order covariance estimates for shells and for the terminal field follow from the
  binary-polynomial kernels of #cite(label("B")), with the convention of Section 2 and even reflection at free
  walls. The independent-normal factor from other covariance splits is absent here.
  Enlarge supports only by aligned whole cells. This proves the energy contraction, localized trace,
  and finite-range additivity needed in the free-square estimates.

The strict reserve also allows real translations of the background.
  If $f$ has scaled analytic test norm at most $1$, replacing $psi$ by $psi + x f$ in (4.13) costs at most

#[#set math.equation(numbering: n => "(4.14)")
 $ e^(C x^2 \| X \|) \, $ <eq:entry-real-translation>]

while leaving the final regulator evaluated at $psi$. This is the quadratic completion with reserve in
  #cite(label("B")) Equation (9.28).

=== 4.5 Complex directions and analytic derivatives <complex-directions-and-analytic-derivatives>

The real bound alone does not imply the full analytic norm.
  We obtain a separate estimate on a fixed complex strip and then interpolate.
  Let $z$ be a real observation direction. On the extended Gaussian chain lattice,
  an affine connection and prescribed real observations become a real linear tilt and a scalar after choosing
  coordinates on the underlying centered lattice. The theta parity identity of #cite(label("B")) Equation (9.29)
  therefore gives

#[#set math.equation(numbering: n => "(4.15)")
 $ frac(\| Z_G^l \( y + i z \) \|, Z_G^l \( y \)) lt.eq frac(Z_G^0 \( i z \), Z_G^0 \( 0 \)) .
   $ <eq:entry-complex-comparison>]

The fixed-graph Gaussian-chain limit preserves this inequality.
  The right-hand side is the ordinary centered imaginary ratio for the topology, without cutoffs.
  Its characteristic factor is positive, and centered pinning increases that factor.

Discard the rarity of the errors, expand into positive topologies,
  and apply (4.15) to each whole integrated topology. Use the argument of #cite(label("X")) from its
  complex-comparison Equation (5.26) through its strip estimate (5.27):
  pin whole observation-cell strips of width $R \/ 4$ along translated $P$-box walls.
  The mixed limits on the resulting fixed pinned boxes give their Gaussian imaginary ratios uniformly on each
  fixed compact set of imaginary directions. The limiting ratios are strictly positive.
  The additional imaginary Gaussian wall cost is

#[#set math.equation(numbering: n => "(4.16)")
 $ O_(H_(upright("strip"))) \( R \/ P \) \# { upright("active observation cells") } $ <eq:entry-imaginary-wall>]

on a strip of fixed height $H_(upright("strip"))$. We distinguish this strip height from the geometric clearance
  $H$ in Proposition 13. The homogeneous imaginary quadratics cancel against the same proxy quadratics as in the
  ordinary argument; connection offsets are real.

The cutoff factors need a simpler estimate. For real $a \, v$, their defining Gaussian integral gives

#[#set math.equation(numbering: n => "(4.17)")
 $ \| chi_(sqrt(s)) \( a + i v \) \| lt.eq e^(v^2 \/ 2) chi_(sqrt(s)) \( a \) . $ <eq:entry-complex-cutoff>]

If the field direction has bounded scaled analytic test norm,
  the imaginary part of an adjacent observation difference is $O_(H_(upright("strip"))) \( s \/ m \)$.
  A halo has $O \( R^2 \)$ cells, so the sum of these extra logarithmic costs is
  $O_(H_(upright("strip"))) \( 1 \)$ per halo. It does not require a new wall estimate.
  The real parts of the positive-topology estimates still have the bounds already proved:
  on compact-data boxes use the same comparisons with rarity discarded,
  and on large-data boxes retain their Gaussian completion and payments.
  For a selected tile discard the subtraction from $1$ in this rough bound.
  The token component may again pay its single factor $C_R s^(C_R)$.

Thus, for real $x \, t$ with $\| t \| lt.eq H_(upright("strip"))$ and a direction $f$ of scaled point norm at most $1$,

#[#set math.equation(numbering: n => "(4.18)")
 $ \| F_pi \( psi + \( x + i t \) f \) \| & lt.eq exp { o \( R \) \( j_1 + j_2 \) +
   C_(H_(upright("strip"))) \( 1 + x^2 \) \| X \| } product_ell C e^(- c \( R + d_ell \)) W_m^kappa \( X \, psi \)
   e^(V_0 \( X \, psi \)) . $ <eq:entry-rough-strip>]

A token multiplies this by $C_R s^(C_R)$. The term $o \( R \)$ includes the wall cost:
  per halo (4.16) is $O \( R^3 \/ P \) = O \( R^(- 2) \)$. Absolute Gaussian integration and analyticity follow
  from the broad real estimate with reserve and this strip bound.

Choose $r_(upright("an")) > 4 e h_0$, where $h_0$ is the analytic radius,
  and then $H_(upright("strip")) > 4 r_(upright("an"))$, before choosing $R$.
  Apply the three-lines theorem on both half-strips to

$ F_pi \( psi + z f \) e^(- D_(upright("damp")) z^2 \| X \|) \, $

where the constant $D_(upright("damp")) > C_(H_(upright("strip")))$ is used only in this interpolation.
  The real boundary has (4.13) and (4.14); the outer boundary has (4.18).
  On $\| z \| lt.eq r_(upright("an"))$ the harmonic weight of the real boundary is at least $3 \/ 4$.
  The exponential gains therefore survive, with a smaller positive constant.
  Removing the damping costs $e^(C \| X \|)$, which is absorbed by the item and link gains because

$ \| X \| lt.eq C \( j_1 + j_2 \) + C sum_ell \( 1 + d_ell \/ R \) $

in the ordinary case, with an additional fixed $C_R$ for a token.
  Finally Cauchy’s estimate followed by real polarization bounds the order-$r$ analytic derivative contribution by
  the same pattern bound times

$ \( h_0 \/ r_(upright("an")) \)^r frac(r^r, r !) . $

The series in $r$ converges. We have proved (4.13) in the full analytic point norm,
  with weakened but still positive exponential gains.

=== 4.6 Summation, exact copying, and translated norms <summation-exact-copying-and-translated-norms>

All bounding boxes above use only the underlying portions of the original padded activity supports.
  They are devices for estimating a pattern, not new activity domains.
  A cut crossing a topology may charge underlying faces there,
  so the estimate also controls differences on an error patch.
  All good-error patches tested after cutting are deep in their bounding boxes.
  Choose cut translates on the tile grid and imaginary pin strips on the $R \/ 4$ grid;
  these choices preserve the tile-junction geometry. A group meeting a free wall uses its clipped events and
  patches, with the plane ordering restricted to present tiles.
  Its size and counting bounds, including at corners, are the same bounds used above.

The connected-pattern summation following #cite(label("B")) Equation (9.34) now applies.
  Exponential item gains pay the activity weights, halo covers, and polynomial labels.
  A link with dependence radius $D'$ has a cover of $O \( 1 + D' \/ R \)$ blocks and decay exponential in $R +
  D'$, as proved in Section 3; its gain therefore also pays its cover and radius labels.
  On a torus the last telescoping term uses a winding label with the same bound.
  The finite-range Gaussian averaging factorizes on compatible components with their original exclusions.
  Every ordinary connected component contains an item or a link and hence retains a small factor.
  By increasing $R$, their sum gives (4.2).

The component containing the compulsory cover has the bound (4.4);
  all other components are ordinary background activities. No additional optional token is summed.
  This gives exactly the coefficient partition function (4.3).
  The normalization constants were centered throughout, so the extracted scalar is the ordinary one on the same
  square. The absolute estimates justify every exchange of pattern summation and Gaussian integration.
  In particular these are convergent exact representations, not identities of formal expansions.

Plane objects in this construction are defined on finite supports.
  The tile and link rules can respect all block translations and square symmetries,
  using symmetric spanning paths when necessary. Padding an event cover includes the numerical rules in a
  sufficiently large fixed multiple of its tile-size halo. Link covers also record their numerical dependence.
  Consequently a support with its stated clearance has exactly the same local calculation in the plane and in the
  finite graph.

For the magnetic copying statement, recall that the harmonic energy scalar has already been removed in (3.9).
  The remaining localized preparation, including all links,
  depends on a harmonic solution only through the arguments of its functions.
  The polynomial reference covariances themselves copy with clearance.
  Replacing $r_oo$ by $r$ therefore changes an interior argument precisely by $gamma_M$ from (3.11).
  On a shift-good support an integral gauge removes the connection and gives the ordinary activity at the
  corresponding local lift.

There is one harmless convention needed for background activities at entry.
  A support incompatible with the fixed compulsory token footprint cannot appear in the coefficient partition
  function. Define the background on such a support to be its prescribed ordinary translate if it is shift-good,
  and zero otherwise. This leaves the represented partition function unchanged and preserves the pierced-plane
  copying rule. It also permits choosing $H$ from the fixed map geometry, independently of $P$.
  Use identical positions in the initial hierarchy in every comparison,
  and require the inner supports of the token construction to fit with clearance.
  The square applications have $M \/ \( s P \) arrow.r oo$, so this requirement is satisfied.

Lastly we check the norm convention for lifted backgrounds, rather than merely their pointwise copying.
  On a shift-good support and its collars the lift satisfies

$ m \| nabla lambda \| + m^2 \| nabla^2 lambda \| lt.eq C . $

The ordinary regulator can use a doubled exponent, at a cost $C^(\| X \|)$ on support $X$,
  as in #cite(label("B")) Proof of Proposition 5.7. For the variational regulator,
  increase its parameter $h_(*)$ slightly. The optimized quadratic is bounded by local gradient energy and
  increases at least proportionally with $h_(*)$; applying the quadratic inequality to the translation again costs
  only $C^(\| X \|)$. A stronger untwisted activity weight pays both losses.
  These changes use the finitely many reserve regimes fixed at the start.
  Each downstream contraction may be performed in its own fixed regime,
  with the same regulator at successive steps; no reserve is consumed anew at every iteration.

Choose $h_b \, h_(upright("ent"))$ from the uniform preparation estimates,
  then the analytic translation radii and entry-admissible regulator reserves before $L$,
  take $L$ sufficiently large for the desired local-map contractions,
  and then take the activity weights sufficiently large. Once these downstream parameters are fixed, choose $R \,
  P$, then $U_(upright("big"))$, and finally $s_0$ as above.
  This order proves all assertions of Proposition 13 simultaneously. 0◻

== 5 Finite critical histories and physical readouts <sec:bulk>

The entry construction provides a small interaction at a large scale,
  but its cutoff is useful only on a finite range of larger volumes.
  We therefore work with a family of finite histories. This section proves that these histories stay close to the
  marginal Gaussian reference, and obtains two physical observables that compare histories with different entry
  scales. Section 6 will use those comparisons to determine the gradient coefficient with a summable error.

Throughout this section $a = alpha^2 = 8 pi$, and $L$ is the fixed block factor chosen after the geometric and
  analytic norm parameters. An #emph[absolute index] $k$ refers to the physical side $L^k$,
  rather than to the number of steps since entry. This distinction matters when two histories have different entry
  scales.

=== 5.1 The family of histories and the local maps <the-family-of-histories-and-the-local-maps>

Fix the parameters of Proposition 13, including $R$, $P = R^5$ and $q$, independently of the history length.
  For a large integer $J$, choose a dyadic observation side $s = s_J$ such that

#[#set math.equation(numbering: n => "(5.1)")
 $ J^3 lt.eq s_J < C_L J^3 \, wide q R s_J = L^(i \( J \)) . $ <eq:bulk-entry-scale>]

Such a choice is possible because $q \, R \, L$ are powers of two:
  among any fixed number of successive dyadic choices of $s$, one has the required congruence of exponents.
  In particular $i \( J \) = O_L \( log J \)$. Starting from the unpierced plane activity of Proposition 13,
  run the local maps through absolute index $8 J$, stopping provisionally if the activity leaves the small ball of
  the map theorem. We call this the $J$-history. A superscript $\( J \)$ distinguishes its coordinates when
  necessary. Figure 1 displays the overlap of two such histories and the intervals that will be retained when they
  are joined in Section 6.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10.92, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((10.92, 0), [#text(size: 9pt)[scale index]], anchor: "west", padding: 0.1176cm)
  line((1.3, 0.056), (1.3, -0.056), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.3, -0.056), [#text(size: 9pt)[$J$]], anchor: "north", padding: 0.1176cm)
  line((2.6, 0.056), (2.6, -0.056), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.6, -0.056), [#text(size: 9pt)[$2J$]], anchor: "north", padding: 0.1176cm)
  line((5.2, 0.056), (5.2, -0.056), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.2, -0.056), [#text(size: 9pt)[$4J$]], anchor: "north", padding: 0.1176cm)
  line((10.4, 0.056), (10.4, -0.056), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.4, -0.056), [#text(size: 9pt)[$8J$]], anchor: "north", padding: 0.1176cm)
  line((0.3575, 2.1), (10.4, 2.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.3, 2.1), (2.6, 2.1), stroke: (paint: rgb("#00008c"), thickness: 1.2pt, miter-limit: 10))
  line((0.3575, 2.009), (0.3575, 2.191), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((10.4, 2.009), (10.4, 2.191), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.52, 2.205), [#text(size: 9pt)[$i(J)=O( log J)$]], anchor: "south", padding: 0.1176cm)
  content((5.655, 2.156), [#text(size: 9pt)[history targeted at $J$]], anchor: "south", padding: 0.1176cm)
  line((0.533, 0.7), (10.6, 0.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((2.6, 0.7), (5.2, 0.7), stroke: (paint: rgb("#00008c"), thickness: 1.2pt, miter-limit: 10))
  line((0.533, 0.609), (0.533, 0.791), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.4, 0.756), [#text(size: 9pt)[history targeted at $2J$ \(to $16J$\)]], anchor: "south-east", padding: 0.1176cm)
  line((2.6, 0.14), (2.6, 2.31), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((2.795, 1.946), (2.795, 0.861), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.925, 1.435), [#text(size: 9pt)[compare physical observables]], anchor: "west", padding: 0.1176cm)
  content((5.2, -0.56), [#text(size: 9pt)[Thick segments are retained in the spliced sequence.]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Finite histories overlap well beyond the intervals retained in the spliced sequence. Coordinates are compared at the same absolute scale using observables of the original height law. The picture is schematic near the entry indices; no convergence rate at entry is assumed. ],
) <fig:histories>

We use the singleton and remainder coordinates from Proposition 8.
  The unbalanced coordinates are $\( t \, z \, cal(R) \)$: the first two multiply the gradient singleton $e_B^0 \/
  2$ and the fundamental singleton $c_B^alpha$, respectively.
  The balanced gradient and fundamental coordinates are $\( T \, Z \)$.
  Parametrizing the exact Gaussian curves gives the coordinate $u$,
  and subtracting the corresponding Gaussian remainder gives $B = B_e + B_o$,
  where the subscripts denote the even and odd parts under translation by $pi \/ alpha$.
  In these coordinates an exact Gaussian trajectory is $\( u \, 0 \, 0 \, 0 \)$ with $u$ unchanged by the map.
  The curve depends on its entry index; the reference covariance kernels at a specified absolute index do not.

#thm([Lemma 5.1.])[
  (Uniform maps and the absolute coefficient estimates).  #emph[The coordinate changes and parity-resolved maps of
    Proposition 8 have a common analytic neighborhood and common bounds for all sufficiently large entry indices
    $i \( J \)$. At absolute index $k$, their two scalar quadratic coefficients obey
#[#set math.equation(numbering: n => "(5.2)")
 $ H_k = H + O \( \( 1 + k \)^(- 2) \) \, wide b_k = b_(*) + O \( \( 1 + k \)^(- 2) \) \, wide H > 0 \, quad
   b_(*) = 2 log L . $ <eq:bulk-coefficient-rate>]

 The coefficients $H_k \, b_k$ are independent of the entry index.
   The constants in the parity remainder bounds are uniform in the $J$-history.]
] <lem:bulk-parity>

#proof[
  The balanced projections are the convergent future linear projection series in #cite(label("B")) Equations
    (8.17) and (8.18). Their norms and inverse norms are uniform at every sufficiently large scale.
    The covariance used here is the nearest-neighbor polynomial covariance in the fixed absolute-index convention.
    Consequently its linear maps and future projection series, and hence its balanced quadratic coefficients,
    are functions of the absolute index alone.
  We first check that parametrizing the Gaussian curves does not introduce a dependence of the analytic radius on
    the entry scale. At side $L^i$, initialize the exact partition algebra with the exponential of $d sum_B
    e_B^0 \/ 2$. A fixed small complex disk in $d$ is permitted by the energy reserve in the entry regulator.
    The normalized block energy has the same bound at every entry scale.
    For a smooth terminal source, Gaussian completion involves the inverse of $I - d C^(1 \/ 2) A C^(1 \/ 2)$,
    where $C$ is the reference tail covariance and $A$ is the unit-edge Laplacian.
    Energy contraction bounds this inverse uniformly on a fixed smaller disk.
    The gradient diagnostic and transverse contraction in #cite(label("B")) Lemma 10.3 therefore bound all these
    Gaussian trajectories and their analytic derivatives uniformly.
    Smaller diagnostic tori cause no problem in this argument:
    the Gaussian initialization has no entry sewing operations.
    This is also the uniformity argument used at the end of #cite(label("X")) Section 5.
    The cosine decomposition does not change it, since the pure Gaussian trajectory has zero charged coordinates.
    Its balanced gradient coordinate is $T_k^g \( d \) = d + O \( d^2 \)$, with uniform first derivative,
    and therefore has an inverse on a common disk. The transverse derivative of the Gaussian remainder at $d =
    0$ is zero. The parity estimates of #cite(label("B")) Lemma 10.6 thus hold uniformly after this change of
    coordinates. The change leaves the $Z^2$ and $u Z$ coefficients unchanged.
  The limits and signs in (5.2), with $b_(*) = alpha^2 log L \/ \( 4 pi \) = 2 log L$,
    follow from #cite(label("B")) Proposition 8.5 and Equation (8.21).
    We need a rate in this particular calculation. We give the quantitative version of its finite-depth
    approximation, since qualitative convergence of these coefficients would not suffice below.
  Truncate each future projection series at depth $r$. Uniform contraction of the linear remainder map makes the
    discarded part at most $C theta.alt^r$ for some $theta.alt < 1$.
    Shell eigenvalue errors and the kernel errors in fixed-order scaled differences are power-small in $L^k$,
    by #cite(label("B")) Lemma 8.1 and Equation (8.9). We claim that replacing all kernels in the retained
    depth-$r$ calculation by their continuum kernels has error bounded by
  #[#set math.equation(numbering: n => "(5.3)")
   $ exp { C_L \( 1 + r \)^p } L^(- c k) $ <eq:bulk-finite-depth-error>]
  for fixed $p < oo$ and $c > 0$.
  Indeed, a quadratic image starts with two singleton inputs and has bounded support size.
    Thereafter only linear maps occur. A linear continuation takes block closures, extracts a singleton,
    or subtracts that extraction. Support size consequently remains bounded, and the number of shapes,
    routed blocks and extraction choices through depth $r$ is at most $C_L^(O \( \( 1 + r \)^2 \))$.
    Write singleton energies throughout in scaled differences with their volume-normalized cell sums.
    The original two inputs have bounded polynomial degree. Each subsequent Taylor projection takes at most two
    derivatives on a constant or affine background, with output a quadratic polynomial, a constant,
    or a single phase harmonic. With independent variables for the successive Gaussian shells,
    the resulting Gaussian polynomial-character expectations have at most $C_L \( 1 + r \)$ polynomial or
    derivative slots. Their pairing expansions have at most factorial growth in this number of slots.
    Scale ratios and distances are bounded by $C_L^(1 + r)$. The real character exponential has modulus at most
    one; its change under kernel replacement can be estimated along the line segment between two positive
    covariance matrices. These facts bound the expectation, and its derivative with respect to any covariance
    entry, by the exponential factor in (5.3).
  Only values and fixed-order scaled differences of kernels enter these slots.
    Later Taylor projections differentiate the remaining background field, not previously integrated kernels.
    Converting between the finitely many scales introduces at most $C_L^(O \( \( 1 + r \)^2 \))$.
    The volume-normalized lattice sums satisfy the same bound:
    couple each lattice sample to its mesh cube and use one additional derivative of the smooth continuum shell
    kernel. The block-shape sums are unchanged by this coupling.
    This proves (5.3); in particular it is a bound on the explicit singleton calculation,
    not an assertion of uniform Riemann approximation for arbitrary activities.
  Choose $r = C_0 log \( 2 + k \)$. A sufficiently large $C_0$ makes the projection tail
    $O \( \( 1 + k \)^(- 3) \)$, while $exp { C_L \( 1 + r \)^p } L^(- c k) =
    O \( \( 1 + k \)^(- 3) \)$ for large $k$. Weakening the bound gives (5.2). ◻
]

=== 5.2 Periodic physical diagnostics <periodic-physical-diagnostics>

We now identify observables which test the two nearly marginal coordinates.
  Fix a sufficiently large dyadic $D_0$ and use tori of side

#[#set math.equation(numbering: n => "(5.4)")
 $ N_k = D_0 L^k . $ <eq:bulk-stopping-tori>]

The constant $D_0$ exceeds the causal clearance of the local maps.
  For each admissible stop, the torus has its own exact recursion from the same entry scale as the plane history.
  Its singleton coefficients agree with the plane ones. Its remainder need not agree with the plane remainder and
  will be estimated separately.

Only stops with $N_k gt.eq s P$ are used. Before this condition holds there are at most $O \( 1 + log R \)$ plane
  steps. Their bounded map amplification is $R^(O \( 1 \))$,
  which is absorbed by the exponentially small entry norm when $R$ is increased.
  All stopping tori are compatible with the observation and tile grids.

Let $f$ be the first real horizontal cosine on the unit torus, and put

#[#set math.equation(numbering: n => "(5.5)")
 $ g = \( f \, \( - Delta_(bb(T)^2) \)^(- 1) f \) > 0 \, wide X_N = \( y \, f_N \) \, wide chi_N =
   e^(i macron(y)) . $ <eq:bulk-test-definitions>]

Here $f_N$ is sampled at observation-cell centers and includes the cell-area weights,
  and $macron(y)$ is the uniform mean of the observations. Heights are taken modulo a common translation by $2
  pi$, so $e^(i macron(h))$ is well defined. The expectation in the next lemma is for the periodic Bessel height
  law before inserting the cutoff, together with its independent observation noises.

#thm([Lemma 5.2.])[
  (The two physical limits).  #emph[As $N arrow.r oo$ with $s \/ N arrow.r 0$, locally uniformly for complex $w$,
#[#set math.equation(numbering: n => "(5.6)")
 $ bb(E) e^(w X_N) & arrow.r e^(a g w^2 \/ 2) \,\
bb(E) \( chi_N e^(w X_N) \) - bb(E) chi_N thin e^(a g w^2 \/ 2) & arrow.r 0 . $ <eq:bulk-physical-gradient>]

 All fixed source derivatives converge as well. For $s \/ N lt.eq P^(- 1)$,
   the discrepancies can be made uniformly small by first increasing $R$, hence $P$, and then increasing $s$.
   The same statements hold with the cutoff on every stopping torus of a $J$-history, uniformly up to index $8 J$.]
] <lem:bulk-physical-diagnostics>

#proof[
  We first transfer the height limit in #cite(label("X")) Theorem 2.4 from free rectangles to the periodic graph.
    For a smooth periodic function $v$, test the height by $\( partial h \, partial v_N \)$.
    Cut a fixed macroscopic grid of seams to obtain free rectangles.
    The retained tests depend only on their internal gradients.
    The centered comparison on the independent Gaussian chains therefore bounds their variances and real
    transforms by those on the cut graph. There are $O \( N \)$ seam edges,
    with test coefficients $O \( N^(- 1) \)$. Their squared flow cost is $O \( N^(- 1) \)$,
    so the omitted test tends to zero in reference cost by #cite(label("X")) Lemma 2.3.
    The free rectangle limits give the upper bound $a integral \| nabla v \|^2$ for each subsequential covariance limit.
  For a function $v$ supported in a coordinate rectangle, choose a pinning band outside its support and ground one
    representative height at a point of the band. Adding the hard pin decreases the variance by the finite
    comparisons. The mixed pinned limit in #cite(label("X")) Theorem 3.1 gives the lower bound $a integral \|
    nabla v \|^2$, since $v$ is supported strictly inside the pinning band.
    Hence equality holds for such local functions. The upper-bound defect of any subsequential covariance limit is
    a positive semidefinite form. A vector on which its quadratic form vanishes belongs to its null space,
    by Cauchy–Schwarz for positive semidefinite forms. A smooth partition of unity writes every periodic $v$ as a
    finite sum of these local functions. Equality thus holds for every $v$, including their mixed covariances.
    The comparison argument is valid on the periodic Gaussian-chain approximation at a fixed graph before passing
    to the Bessel limit; no bare inverse-energy bound is transferred.
  The corresponding Laplace limits follow by the same two comparisons.
    For the lower bound, the centered variance comparison used in the proof of #cite(label("X")) Theorem 2.4
    supplies the variance-based lower bound for the transform.
    For the upper bound, cut to the fixed grid of free rectangles and use their Laplace limits.
    Hölder’s inequality separates the omitted seam term; its reference cost tends to zero,
    and the Hölder exponent on the retained term can then be sent to one.
    Uniform exponential bounds from #cite(label("X")) Lemma 2.3 give convergence of every fixed moment and local
    uniform convergence of the complex transforms. Smooth mean-free density tests follow by solving the periodic
    Poisson equation and approximating in reference energy. For the first cosine this also follows directly from
    its discrete Laplacian eigenvalue.
  Cell sampling changes the normalized reference standard deviation of this test by $O \( s \/ N \)$,
    by the periodic Poincaré inequality or the cell flow estimate.
    Its observation-noise standard deviation is also $O \( s \/ N \)$.
    This proves (5.6), including its differentiated version.
  The phase requires more than the marginal Gaussian limit.
    We adapt the replica calculation of #cite(label("B")) Lemma 10.1.
    Remove the independent observation noise temporarily, and write $X_N^(\( h \))$ for the height part of the
    cosine test. We first work at one fixed Gaussian-chain approximation of the size-$N$ graph.
    The pin selects a height representative and its law is invariant under $h mapsto - h$.
    Let $h_1 \, h_2$ be independent copies on the entire subdivided graph, including the chain variables, and put
  $ S = h_1 + h_2 \, wide Delta = h_1 - h_2 . $
  Their common coordinatewise parity class is $cal(P) = S med mod med 4 pi bb(Z) = Delta med mod med 4 pi bb(Z)$.
    If $Q$ denotes the quadratic precision form, the change of variables gives $Q \( h_1 \) +
    Q \( h_2 \) = \( Q \( S \) + Q \( Delta \) \) \/ 2$. Conditional on $cal(P)$, the fields $S \,
    Delta$ are consequently independent and identically distributed. Their conditional laws are centered:
    each parity coset is preserved by sign reversal. This is the replica identity of #cite(label("X")) Equation
    (2.12), in the proof of Theorem 2.5.
  For this fixed approximation write $X \( h \)$ for the cosine test and $mu \( h \)$ for the mean over the
    original sites, both extended as linear forms on the subdivided field.
    Thus $X \( h \)$ approximates $X_N^(\( h \))$ and $mu \( h \)$ approximates $macron(h)$.
    Define the scalar sum and difference tests and their conditional variance by
  $ A & = X \( h_1 \) + X \( h_2 \) = X \( S \) \,\
D & = X \( h_1 \) - X \( h_2 \) = X \( Delta \) \,\
V & = bb(E) \( A^2 divides cal(P) \) = bb(E) \( D^2 divides cal(P) \) . $
  Put $sigma^2 = bb(E) X \( h \)^2$ and $kappa_4 = bb(E) X \( h \)^4 - 3 sigma^4$.
    Conditional independence gives $bb(E) V^2 = bb(E) \( A^2 D^2 \)$.
    Since $A^2 D^2 = \( X \( h_1 \)^2 - X \( h_2 \)^2 \)^2$, independence of the original replicas yields $bb(E)
    V^2 = 2 bb(E) X \( h \)^4 - 2 sigma^4$ and therefore
  #[#set math.equation(numbering: n => "(5.7)")
   $ bb(E) V = 2 sigma^2 \, wide "Var" V = 2 kappa_4 . $ <eq:bulk-replica-variance>]
  For real $t$ define the transform and the difference-character
  $ F \( t \) = bb(E) e^(i mu \( h \) + i t X \( h \)) \, wide Psi_t = e^(i mu \( Delta \) + i t X \( Delta \)) . $
  The character $Psi_t$ depends only on the difference field and has modulus one.
    Conditional independence gives $bb(E) \( A^2 Psi_t \) = bb(E) \( V Psi_t \)$.
    Inversion symmetry of the second replica gives $bb(E) Psi_t = F \( t \)^2$.
    The same sign reversal and differentiation of $F$ give, with primes denoting $t$ derivatives,
  $ bb(E) \( A^2 Psi_t \) = \( - F'' \) F + F \( - F'' \) + 2 \( - i F' \) \( i F' \) = -
    2 #scale(x: 120%, y: 120%)[\(] F F'' - \( F' \)^2 #scale(x: 120%, y: 120%)[\)] . $
  We have thus proved the exact finite-approximation identity
  #[#set math.equation(numbering: n => "(5.8)")
   $ - 2 #scale(x: 120%, y: 120%)[\(] F F'' - \( F' \)^2 #scale(x: 120%, y: 120%)[\)] = 2 sigma^2 F^2 +
     bb(E) #scale(x: 120%, y: 120%)[\[] \( V - 2 sigma^2 \) Psi_t #scale(x: 120%, y: 120%)[\]] \, wide
     t in bb(R) . $ <eq:bulk-weighted-replica>]
  Cauchy–Schwarz and (5.7) bound its last term by $sqrt(2 kappa_4)$.
  Take the chain limit first, at the fixed original graph. The fixed-graph moment convergence passes the second
    and fourth moments, the transforms and their first two derivatives through this limit.
    Consequently, for $F_N \( t \) = bb(E) e^(i macron(h) + i t X_N^(\( h \)))$ in the original Bessel law,
    the absolute difference between the two sides of (5.8) without its last term is at most
    $sqrt(2 kappa_(4 \, N))$, where $kappa_(4 \, N) = bb(E) \( X_N^(\( h \)) \)^4 -
    3 \( bb(E) \( X_N^(\( h \)) \)^2 \)^2$. The Gaussian moment convergence proved above gives $kappa_(4 \, N)
    arrow.r 0$ and $"Var" \( X_N^(\( h \)) \) arrow.r a g$. Uniform exponential bounds on compact complex sets
    permit locally uniform subsequential limits of $F_N$ and all their fixed derivatives.
    For any such limit, denoted again by $F$, (5.8) therefore implies on the real axis,
    and then everywhere by analytic continuation,
  #[#set math.equation(numbering: n => "(5.9)")
   $ F F'' - \( F' \)^2 = - a g F^2 . $ <eq:bulk-replica-ode>]
  Half-wavelength translation preserves $e^(i macron(h))$ and changes the sign of the cosine test.
    Repinning after translation only subtracts a height in $2 pi bb(Z)$, so it leaves this phase unchanged.
    Hence $F' \( 0 \) = 0$. If $F$ is not identically zero, solving the equation where $F eq.not
    0$ and then continuing analytically shows that $F$ is an exponential quadratic without zeros.
    Thus $F \( t \) = F \( 0 \) e^(- a g t^2 \/ 2)$. The identically zero limit has the same factorization.
    Restoring the independent observation noise proves (5.6).
  These arguments also give the asserted order of choices. Compare the cell test to the ordinary sampled cosine
    with an error bounded by $C \/ P$ when $s \/ N lt.eq P^(- 1)$.
    First make this bound small, and then use convergence of the ordinary cosine tests for all $N gt.eq s P$.
    Finally the cutoff error (3.5), including fixed exponential tests and source derivatives,
    is bounded throughout a $J$-history by
  $ C exp { C_L J - c s_J } = O \( e^(- c' J^3) \) . $
  Consequently it changes none of the preceding conclusions. ◻
]

We record the map interpretation of these tests. A source $w
  X_N$ translates the remaining field by a smooth function $F$ satisfying $B_s alpha
  F$ equal to the reference observation covariance applied to the source.
  It can be chosen as a microscopic cosine: translation symmetry makes the observation-cell function a cosine,
  and cell averaging of the corresponding microscopic cosine has a multiplier bounded away from zero.
  Gaussian completion gives

#[#set math.equation(numbering: n => "(5.10)")
 $ \( F \, A F \) = a w^2 g + O_w \( \( s \/ N \)^c + N^(- c) \) $ <eq:bulk-F-energy>]

for a fixed $c > 0$, with uniform scaled derivatives in the point norm.
  One can obtain this error by periodic inverse-energy approximation of the sampled density and the Taylor
  expansion of the first discrete eigenvalue.

At a stop with $D_0^2$ blocks, the analytic terminal expansion of #cite(label("B")) Equations (10.3) and (10.4) gives

#[#set math.equation(numbering: n => "(5.11)")
 $ log bb(E) e^(w X_N) - log bb(E)_a e^(w X_N) & = 1 / 2 t_k \( F \, A F \) +
   O \( lr(bar.v.double cal(R)_k^(upright("tor")) bar.v.double) + nu_k^2 \) \,\
e^(- log bb(E)_a e^(w X_N)) bb(E) \( chi_N e^(w X_N) \) - bb(E) chi_N & = z_k cal(M)_k \( w \) +
  O \( lr(bar.v.double cal(R)_k^(upright("tor")) bar.v.double) + nu_k^2 \) . $ <eq:bulk-map-gradient>]

Here $nu_k = \| t_k \| + \| z_k \| + lr(bar.v.double cal(R)_k^(upright("tor")) bar.v.double)$,
  and $bb(E)_a$ denotes the reference Gaussian observation law.
  For one fixed sufficiently small nonzero real $w$, both displayed linear multipliers are bounded away from zero.
  Explicitly the second multiplier is

#[#set math.equation(numbering: n => "(5.12)")
 $ cal(M)_k \( w \) = D_0^2 / 2 e^(tau_k \/ 2 - alpha^2 D_(upright("tail") \, k) \/ 2)
   "ave"_x \( e^(- i alpha F \( x \)) - 1 \) . $ <eq:bulk-phase-multiplier>]

The tail diagonal $D_(upright("tail") \, k)$ is bounded, and the last average tends to a strictly negative number
  for the fixed $w$. The number $tau_k$ is the variance, in observation units, of the integrated Gaussian means.
  It is bounded because the zero-mode continuation at side $u$ contributes $O \( u^2 \/ N_k^2 \)$.
  The compensating factor $e^(tau_k \/ 2)$ is necessary: insertion of the retained uniform mean gives the physical
  mean-phase insertion times $e^(- tau_k \/ 2)$. This prescription is exact for the cutoff interaction,
  which is periodic in the common mean. Before tilt and subtraction,
  the same formula with spatial factor one is a real positive multiplier bounded above and below.

=== 5.3 No exit and the nonexponential odd sector <no-exit-and-the-nonexponential-odd-sector>

#thm([Lemma 5.3.])[
  (Smallness on the finite horizons).  #emph[For every sufficiently small prescribed tube radius,
    the entry parameters can be chosen so that all $J$-histories, for sufficiently large $J$,
    remain in that tube through index $8 J$. The stopped torus remainders remain in a fixed comparable tube.
    Moreover, for every fixed $0 < c < 8$,
#[#set math.equation(numbering: n => "(5.13)")
 $ sup_(c J lt.eq k lt.eq 8 J) #scale(x: 120%, y: 120%)[\(] \| u_k^(\( J \)) \| + \| Z_k^(\( J \)) \| +
   lr(bar.v.double B_(e \, k)^(\( J \)) bar.v.double) + lr(bar.v.double B_(o \, k)^(\( J \)) bar.v.double)
   #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $ <eq:bulk-window-vanishing>]

 The analogous stopped torus remainder quantities tend to zero.]
] <lem:bulk-window-vanishing>

#proof[
  We use the two diagnostics exactly at the finite stops at which they have just been justified.
    Before a first candidate exit, contraction of the plane remainder,
    and separately contraction of the remainder on each stopping torus, give
  $ lr(bar.v.double cal(R)_k bar.v.double) \, med lr(bar.v.double cal(R)_k^(upright("tor")) bar.v.double) lt.eq
    C theta.alt^(k - i \( J \)) epsilon + C rho^2 . $
  Here $rho$ bounds the coordinates before the candidate exit, $epsilon$ is the entry norm, and $theta.alt < 1$.
    Boundedness of one map keeps the candidate state in a fixed multiple of that tube.
    Equations (5.11) and (5.11) and the nonzero multipliers bound its singleton coordinates by
    $C \( delta_(upright("diag")) + epsilon + rho^2 \)$, where $delta_(upright("diag"))$ bounds the physical
    discrepancies. Choose $rho$ so that the quadratic term is smaller than a fixed small multiple of $rho$;
    next choose $R$ large and the entry norm and diagnostic discrepancies small compared with $rho$.
    Lemma 15 and Proposition 13 permit these choices. For large $J$ the candidate cannot be an exit.
    The finitely many initial plane-only steps were controlled after (5.4).
    The coordinate changes are uniformly bounded by Lemma 14, so this argument applies to either coordinate system.
  For the convergence assertion, take the supremum limiting plane size over sequences with $J arrow.r oo$ and $k -
    i \( J \) arrow.r oo$, $k lt.eq 8 J$. Call it $q_0$. It lies in the small tube,
    and all fixed numbers of preceding steps satisfy the same limiting bound.
    Iterating contraction over $r$ steps and then sending $r arrow.r
    oo$ bounds the limiting plane remainder by $C q_0^2$. The torus remainder has its own contraction with the
    same plane singleton forcing, so the same bound holds at its separate stops.
    The test errors tend to zero because $s \/ N_k arrow.r 0$ on these sequences.
    The diagnostics therefore give $q_0 lt.eq C' q_0^2$. Taking the original tube smaller than $1 \/
    C'$ implies $q_0 = 0$. Every window in (5.13) satisfies $k - i \( J \) arrow.r oo$,
    which proves the stated uniform result. ◻
]

The preceding lemma gives convergence to the Gaussian fixed point.
  To determine the approach rate we must also rule out exponential decay in the odd direction.
  The relevant lower bound is a statement about the original periodic model at absolute side $N_k$;
  it therefore does not depend on the entry history.

#thm([Lemma 5.4.])[
  (Positive odd coordinate and contracted remainders).  #emph[On every fixed window $c J lt.eq k lt.eq 8 J$,
    $0 < c < 8$, and for large $J$, the period convention may be kept unchanged and
#[#set math.equation(numbering: n => "(5.14)")
 $ Z_k^(\( J \)) > 0 \, wide - log Z_k^(\( J \)) = o \( J \) \, wide
   lr(bar.v.double B_(e \, k)^(\( J \)) bar.v.double) lt.eq C \( Z_k^(\( J \)) \)^2 \, wide
   lr(bar.v.double B_(o \, k)^(\( J \)) bar.v.double) lt.eq C #scale(x: 120%, y: 120%)[\(] \|
   u_k^(\( J \)) \| + \( Z_k^(\( J \)) \)^2 #scale(x: 120%, y: 120%)[\)] Z_k^(\( J \)) . $ <eq:bulk-odd-estimates>]

 The $o \( J \)$ and the constants are uniform on the window.]
] <lem:bulk-odd>

#proof[
  Let $Y_k = bb(E) e^(i macron(h)_(N_k))$ for the original periodic height law. We first show
  #[#set math.equation(numbering: n => "(5.15)")
   $ Y_k > 0 \, wide - log Y_k = o \( k \) . $ <eq:bulk-phase-lower>]
  For free squares let $z_n^(upright("face"))$ be the positive characteristic ratio of the averaged four-face
    profile in #cite(label("X")) Equation (2.15). At $a = 8 pi$ there is $c_0 > 0$,
    independent of the fixed sufficiently large integer $r$, such that
  $ liminf_(n arrow.r oo) z_(L^r n)^(upright("face")) / z_n^(upright("face")) gt.eq c_0 . $
  Replace $c_0$ by a smaller number in $\( 0 \, 1 \)$. For each fixed $r$,
    iterate the eventual bound $c_0 \/ 2$ on the $r$ residue classes of the absolute index. This gives
  $ limsup_(k arrow.r oo) frac(- log z_(N_k)^(upright("face")), k) lt.eq frac(log \( 2 \/ c_0 \), r) . $
  Sending $r arrow.r oo$ proves subexponential decay of this free characteristic.
    The difference of the face profile and the uniform profile has bounded reference cost.
    The phase transfer inequality #cite(label("X")) Equation (2.2),
    or its application in #cite(label("B")) Lemma 10.7, changes a logarithmic loss $o \( k \)$ by at most
    $O \( 1 + sqrt(o \( k \)) \)$. Periodic edge restoration increases the positive characteristic by
    #cite(label("X")) Lemma 2.2. This proves (5.15). Observation noise multiplies it by $exp { -
    O \( \( s \/ N_k \)^2 \) }$, and the cutoff changes it by $O \( e^(- c J^3) \)$ on the windows under
    consideration. Both changes are negligible compared with (5.15).
  Fix a slightly larger window starting at a smaller positive fraction of $J$.
    By Lemma 16 all coordinates there tend uniformly to zero. For a fixed small $epsilon.alt > 0$, consider the cone
  $ lr(bar.v.double B_o bar.v.double) lt.eq epsilon.alt \| Z \| . $
  The parity map makes it forward invariant once the window is sufficiently late.
    Indeed inside the cone its scalar equation gives $\| Z_(+) \/ Z - 1 \| = o \( 1 \)$ uniformly,
    whereas its odd remainder equation gives $lr(bar.v.double B_(o \, +) bar.v.double)
    lt.eq \( theta.alt epsilon.alt + o \( 1 \) \) \| Z \|$. In particular the sign of $Z$ cannot change inside the cone.
  While the trajectory lies outside the cone, $\| Z \| lt.eq epsilon.alt^(- 1) lr(bar.v.double B_o bar.v.double)$;
    the odd remainder equation then contracts $B_o$ with some factor $theta.alt' < 1$.
    It gives the same geometric upper bound on $Z$ until the cone is entered.
    This alternative cannot persist for a positive fraction of $J$.
    To see this with the physical observable, the stopped mean-phase expectation has an odd factor under the
    common-mean integral. It is bounded by the plane odd singleton and the stopped torus odd remainder.
    The balance relations bound the unbalanced plane odd variables by $\| Z \| +
    lr(bar.v.double B_o bar.v.double)$. The torus odd remainder satisfies a geometric convolution of these plane
    odd inputs, plus a geometric transient: every nonlinear odd-sector term contains an odd factor.
    An interval of length proportional to $J$ outside the cone would therefore make the phase exponentially small
    at its last stop, contradicting (5.15). Taking successively enlarged windows gives cone entrance strictly
    before the desired window.
  Inside the cone, the adjacent $\| Z \|$ ratios tend uniformly to one.
    For any prescribed small $delta > 0$, the preceding convolution is thus bounded by $C \| Z_k \| +
    C e^(- c J)$, since earlier inputs are at most $\( 1 + delta \)^r \|
    Z_k \|$ after $r$ backward steps and $theta.alt \( 1 + delta \) < 1$.
    Equation (5.15) consequently implies $\| Z_k \| gt.eq e^(- o \( J \))$ throughout the desired window.
    In particular all homogeneous contraction transients are negligible relative to every fixed positive power of
    $\| Z_k \|$.
  Iterate the even remainder equation with these adjacent ratio bounds.
    Its forcing is $O \( Z^2 \)$, and the transient is negligible,
    so $lr(bar.v.double B_(e \, k) bar.v.double) lt.eq C Z_k^2$.
    The scalar equation then gives $\| u_(k + 1) - u_k \| lt.eq C Z_k^2$.
    For $r$ steps backward within an enlarged window,
  #[#set math.equation(numbering: n => "(5.16)")
   $ \| Z_(k - r) \| lt.eq \( 1 + delta \)^r \| Z_k \| \, wide \| u_(k - r) \| lt.eq \| u_k \| +
     C r \( 1 + delta \)^(2 r) Z_k^2 . $ <eq:bulk-backward-u>]
  Using these bounds in the odd contraction gives
  $ lr(bar.v.double B_(o \, k) bar.v.double) lt.eq C sum_(r gt.eq 0)
    theta.alt^r \( \| u_k \| + C \( 1 + r \) \( 1 + delta \)^(2 r) Z_k^2 \) \( 1 + delta \)^r \| Z_k \| lt.eq
    C \( \| u_k \| + Z_k^2 \) \| Z_k \| \, $
  where $delta$ is chosen so that $theta.alt \( 1 + delta \)^3 < 1$.
    The finitely truncated convolution has only a negligible transient. This proves the norm bounds.
  Finally the untilted mean-phase expansion, with its positive linear multiplier described after (5.12),
    is $M_k Z_k + o \( \| Z_k \| \) + O \( e^(- c J) \)$, where $M_k$ is bounded positively above and below.
    The torus odd remainder has the sharper bound just obtained by the same contraction argument.
    The physical phase is positive by (5.15), and its cutoff error is negligible.
    Thus $Z_k > 0$ in the unchanged period convention. Since the coordinates also tend to zero,
    the lower bound $Z_k gt.eq e^(- o \( J \))$ is exactly the logarithmic assertion in (5.14). ◻
]

=== 5.4 Readouts common to different entry scales <readouts-common-to-different-entry-scales>

The estimates obtained so far do not yet identify a single trajectory:
  each $J$-history uses different observation cells and different cutoffs.
  We now compare their coordinates using observables of the same original periodic model.

Let $tilde(X)_(N_k)$ be the ordinary microscopic sampled cosine, without observation averaging or noise, and define

#[#set math.equation(numbering: n => "(5.17)")
 $ U_k = frac("Var" \( tilde(X)_(N_k) \), g) \, wide Y_k = bb(E) e^(i macron(h)_(N_k)) . $ <eq:bulk-common-observables>]

Both quantities depend only on the absolute index $k$.

#thm([Proposition 5.5.])[
  (Common readouts).  #emph[For every $0 < c < 8$, uniformly on $c J lt.eq k lt.eq 8 J$,
#[#set math.equation(numbering: n => "(5.18)")
 $ U_k & = frac(a, 1 - u_k^(\( J \))) + O \( \( Z_k^(\( J \)) \)^2 \) + O \( e^(- c' J) \) \,\
Y_k & = M_k Z_k^(\( J \)) + O #scale(x: 120%, y: 120%)[\(] \( \| u_k^(\( J \)) \| + \( Z_k^(\( J \)) \)^2 \)
  Z_k^(\( J \)) #scale(x: 120%, y: 120%)[\)] + O \( e^(- c' J) \) . $ <eq:bulk-U-readout>]

 Here $c' > 0$ may depend on $c$, and $M_k$ is bounded above and below by positive constants and is common to all
   histories, up to an exponentially small error which is included in the display. The coordinate changes also give
#[#set math.equation(numbering: n => "(5.19)")
 $ t_k = u_k + O \( u_k^2 + Z_k^2 \) \, wide z_k = ell_k^(- 1) Z_k + O \( \( \| u_k \| + Z_k^2 \) Z_k \) \, wide
   lr(bar.v.double cal(R)_k bar.v.double) lt.eq C \( u_k^2 + Z_k^2 \) \, $ <eq:bulk-coordinate-conversion>]

 where $ell_k$ is the absolute-index fundamental balancing factor and is bounded above and below positively.]
] <prop:bulk-readouts>

#proof[
  At step $k$ compare the plane activity with the exact Gaussian trajectory having parameter $d = u_k$.
    The even balanced remainder has size $O \( Z_k^2 \)$ by Lemma 17;
    the odd remainder has size $O \( \( \| u_k \| + Z_k^2 \) Z_k \)$.
    Undoing the linear balance, using its parity, gives a difference $O \( Z_k^2 \)$ in the gradient coordinate and
  #[#set math.equation(numbering: n => "(5.20)")
   $ z_k = ell_k^(- 1) Z_k + O \( \( \| u_k \| + Z_k^2 \) Z_k \) . $ <eq:bulk-z-conversion>]
  The Gaussian remainder is $O \( u_k^2 \)$. These facts prove (5.19).
  The stopped torus requires a separate comparison, since its remainder need not copy the plane.
    Run its own exact map from entry, comparing at intermediate index $r$ with its Gaussian trajectory at
    parameter $u_r$. Gaussian torus trajectories and their first parameter derivatives are bounded uniformly:
    this follows from the same energy completion and contraction argument as Lemma 14.
    Changing the comparison parameter from $u_r$ to $u_(r + 1)$ costs $O \( Z_r^2 \)$ by (5.16).
    The remainder forcing has zero linear singleton derivative at zero.
    First the odd torus contraction gives $O \( Z_r \)$. Its even forcing from odd inputs is then $O \( Z_r^2 \)$.
    Comparing even components with the Gaussian curve and iterating contraction gives $O \( Z_r^2 \)$ in the even
    difference. Returning to the odd equation improves its forcing to $O \( \( \| u_r \| + Z_r^2 \) \| Z_r \| \)$:
    pure odd terms beyond linear have at least three odd factors,
    and every other such term has an even factor of size $O \( \| u_r \| + Z_r^2 \)$.
    The adjacent-ratio bounds and (5.16) justify the same geometric convolutions as in Lemma 17.
    Initial transients are $O \( e^(- c' J) \)$ on the stated window.
  All terminal integrations are analytic on a uniform neighborhood,
    with a fixed number $D_0^2$ of blocks and regulator reserve.
    In the variance diagnostic a term odd under half-period shift has zero first derivative at the Gaussian
    trajectory. Hence the difference from that trajectory is $O \( Z_k^2 \) + O \( e^(- c' J) \)$.
    It remains to compute the Gaussian value in the coordinate $u$,
    rather than approximate a Gaussian trajectory in activity norm.
  Hold its initial parameter $d$ fixed. Let $C_i$ be the reference tail covariance at the entry side $L^i$.
    Direct completion of the initial quadratic exponential gives, beyond the reference source prefactor,
    the log transform
  #[#set math.equation(numbering: n => "(5.21)")
   $ d / 2 #scale(x: 120%, y: 120%)[\(] A^(1 \/ 2) F \, \( I - d A^(1 \/ 2) C_i A^(1 \/ 2) \)^(- 1) A^(1 \/ 2) F
     #scale(x: 120%, y: 120%)[\)] . $ <eq:bulk-Gaussian-readout>]
  On the first mode the operator $A^(1 \/ 2) C_i A^(1 \/ 2)$ has eigenvalue $1 + O \( \( L^i \/ N_k \)^2 \)$,
    by the low-pass polynomial formula. Together with (5.10),
    two source derivatives therefore give normalized variance $a \/ \( 1 - d \) +
    O \( \( L^i \/ N_k \)^c + \( s \/ N_k \)^c + N_k^(- c) \)$.
    On a fixed positive-fraction window these errors are $O \( e^(- c' J) \)$.
    Set $d = u_k$ and compare the cell test to the original sampled cosine in reference energy.
    Removing its noise and cutoff has the same error. This proves (5.18).
  For the mean-phase diagnostic the purely even terms integrate to zero.
    Expanding in the odd difference from the Gaussian trajectory, using (5.20) and the odd remainder bound,
    gives (5.18). The coefficient at zero activity is the untilted terminal fundamental multiplier times
    $ell_k^(- 1)$. It is real positive and uniformly bounded above and below.
    Finally we verify its independence from the history. Its high-mean variance includes all Gaussian shells below
    the stop, including those integrated at entry below $L^(i \( J \))$.
    These variances telescope to the same absolute-index sum for every entry choice.
    The remaining tail variance and $ell_k$ also depend only on $k$.
    Observation noise contributes only $O \( \( s \/ N_k \)^2 \)$ to the exponent.
    Thus a single sequence $M_k$ can be used in (5.18), absorbing the exponentially small noise correction into
    its error. The cutoff removal is again exponentially smaller still. ◻
]

We have proved three facts about every long interior window of a finite history:
  its state tends to zero, its odd coordinate is positive and only subexponentially small,
  and its two scalar coordinates can be read from physical observables independent of entry.
  These are the inputs for the trajectory argument that follows.

== 6 Joining finite histories and determining the critical trajectory <sec:trajectory>

The bulk estimates provide a small trajectory on each finite scale window.
  The histories have different entry scales, so they need not agree as activity families on their overlaps.
  Their physical readouts nevertheless determine the two marginal coordinates accurately enough to compare them.
  We first use those comparisons to form one infinite sequence, and then determine its leading coefficient.
  The coefficient of the gradient activity obtained at the end of this section is the one needed in the magnetic
  terminal calculation.

=== 6.1 An abstract lemma for sparse changes of history <an-abstract-lemma-for-sparse-changes-of-history>

An ordinary evolution step increases the scale index by one.
  A change of history takes place at a fixed scale index and does not count as an additional evolution step.
  The following notation keeps these two operations distinct.
  We write $\( u_j \, Z_j \)$ for the state used to start the ordinary step at index $j$,
  and $\( tilde(u)_(j + 1) \, tilde(Z)_(j + 1) \)$ for the output of that step.
  At an index where no change of history occurs, the tilded state is $\( u_(j + 1) \, Z_(j + 1) \)$.
  At a change of history, it is the state immediately before the change.

#thm([Lemma 6.1.])[
  (A trajectory with geometrically separated jumps).  #emph[Let $H \, b > 0$, let $j_0 gt.eq 1$,
    and let $cal(Q)$ be a set of integers larger than $j_0$. Suppose that the increasing enumeration $\( q_r \)$
    of $cal(Q)$ satisfies
$ q_(r + 1) gt.eq rho q_r wide upright("for some fixed ") rho > 1 . $

 The set $cal(Q)$ may also be finite or empty. For every integer $j gt.eq j_0$,
   let $\( u_j \, Z_j \)$ and $\( tilde(u)_(j + 1) \, tilde(Z)_(j + 1) \)$ be real states with positive second
   coordinates. Assume that both coordinates of every state tend to zero as its scale index tends to infinity.
   Suppose that the ordinary evolution satisfies
#[#set math.equation(numbering: n => "(6.1)")
 $ tilde(u)_(j + 1) - u_j & = - H_j Z_j^2 + O #scale(x: 120%, y: 120%)[\(] \( \| u_j \| + Z_j^2 \) Z_j^2
   #scale(x: 120%, y: 120%)[\)] \,\
tilde(Z)_(j + 1) / Z_j & = 1 - b_j u_j + O \( u_j^2 + Z_j^2 \) \,\
H_j & = H + O \( j^(- 2) \) \, wide b_j = b + O \( j^(- 2) \) . $ <eq:trajectory-ordinary-u>]

 For $q > j_0$ with $q in.not cal(Q)$, assume $\( u_q \, Z_q \) = \( tilde(u)_q \, tilde(Z)_q \)$.
   At every $q in cal(Q)$, assume instead
#[#set math.equation(numbering: n => "(6.2)")
 $ \| u_q - tilde(u)_q \| & lt.eq C tilde(Z)_q^2 \,\
\| Z_q - tilde(Z)_q \| & lt.eq C #scale(x: 120%, y: 120%)[\(] \| tilde(u)_q \| +
  tilde(Z)_q^2 #scale(x: 120%, y: 120%)[\)] tilde(Z)_q . $ <eq:trajectory-jump-u>]

 All constants in these hypotheses are uniform in the scale index. Then, with $x_(*) = \( H \/ b \)^(1 \/ 2)$,
#[#set math.equation(numbering: n => "(6.3)")
 $ u_j / Z_j & = x_(*) + O \( j^(- 1) \) \,\
1 / Z_j & = b x_(*) j + O \( log j \) \,\
u_j & = frac(1, b j) + O (frac(log j, j^2)) \, wide Z_j = frac(1, sqrt(b H) thin j) +
  O (frac(log j, j^2)) . $ <eq:trajectory-ratio>]

 The same estimates hold for the states immediately before jumps.]
] <lem:trajectory-sparse-splice>

#proof[
  We first obtain positive, comparable coordinates without assuming a rate of convergence.
    We then derive the rate $j^(- 1)$, and finally identify its coefficient by solving the equation for $u \/
    Z$ backwards.
  ===== 6.1.1 Grouping a jump with preceding evolution. <grouping-a-jump-with-preceding-evolution.>
  Fix an integer $K$, whose size will be chosen below. Discard finitely many initial indices so that the intervals
    $\[ q - K \, q \]$, $q in cal(Q)$, are disjoint. This is possible because the gaps between consecutive
    elements of $cal(Q)$ tend to infinity. Replace the $K$ ordinary steps from $q -
    K$ to the state immediately before $q$, together with the jump at $q$, by one grouped transition.
    Retain every other ordinary step. Thus consecutive retained indices have difference either $1$ or $K$.
    A grouped transition of length $K$ still contains exactly $K$ ordinary evolution steps.
  Write $\( u \, Z \)$ for the state at the beginning of such a transition.
    For fixed $K$, induction in the ordinary recurrence gives, at each of its intermediate ordinary states,
  $ Z_(upright("int")) \/ Z = 1 + o \( 1 \) \, wide u_(upright("int")) = u + O_K \( Z^2 \) . $
  The errors are uniform along the tail. More precisely, immediately before the jump the $K$ ordinary steps give
  #[#set math.equation(numbering: n => "(6.4)")
   $ tilde(u)_q - u & = - K H Z^2 + O_K #scale(x: 120%, y: 120%)[\(] \( \| u \| + Z^2 + j^(- 2) \) Z^2
     #scale(x: 120%, y: 120%)[\)] \,\
tilde(Z)_q \/ Z & = 1 - K b u + O_K \( u^2 + Z^2 + j^(- 2) \| u \| \) \, $ <eq:trajectory-k-u>]
  where $j = q - K$. To see these estimates, use the first recurrence to bound the change in $u$ by
    $O_K \( Z^2 \)$, and substitute this bound in the second recurrence.
    Multiplying its $K$ ratios creates only terms bounded by $O_K \( u^2 + Z^2 \)$.
    Substitution back into the first recurrence then gives (6.4).
  The jump changes the right side of (6.4) by at most $\( C + o \( 1 \) \) Z^2$.
    Its contribution to (6.4) has absolute value at most $\( C + o \( 1 \) \) \| u \| + O_K \( Z^2 \)$.
    Here the leading constant $C$ is a constant from the jump hypotheses, independent of $K$;
    the terms caused by $tilde(u)_q - u$ are included in $O_K \( Z^2 \)$.
    Any error bounded by $C_1 \| u \| + C_K Z^2$ can be written as a coefficient of $u$,
    of absolute value at most $C_1$, plus an $O_K \( Z^2 \)$ term.
    This remains true at $u = 0$, when the first term is zero.
  Choose $K$ sufficiently large compared with the jump constants and with $H^(- 1) \, b^(- 1)$.
    After moving farther along the tail, every retained transition therefore satisfies
  #[#set math.equation(numbering: n => "(6.5)")
   $ u^(+) - u = - alpha Z^2 \, wide Z^(+) / Z = 1 - beta u + r \, wide \| r \| lt.eq C_K Z^2 \,
     $ <eq:trajectory-grouped>]
  where
  #[#set math.equation(numbering: n => "(6.6)")
   $ 0 < alpha_(-) lt.eq alpha lt.eq alpha_(+) < oo \, wide 0 < beta_(-) lt.eq beta lt.eq
     beta_(+) < oo . $ <eq:trajectory-grouped-bounds>]
  The bounds also hold for a retained single ordinary step.
    The coefficients $alpha \, beta$ may vary from one transition to another; no regularity of that dependence is used.
  ===== 6.1.2 Positivity and the two comparison cones. <positivity-and-the-two-comparison-cones.>
  At retained nodes, $u$ strictly decreases, because $Z > 0$.
    Its limit is zero by hypothesis, so $u > 0$ at every node of this tail.
    We next show that this positive coordinate is comparable to $Z$.
  Choose $c_(-) > 0$ so small that $c_(-)^2 beta_(+) < alpha_(-) \/ 2$. Whenever $u lt.eq c_(-) Z$, (6.5) gives
  $ \( u^(+) - c_(-) Z^(+) \) - \( u - c_(-) Z \) = - alpha Z^2 + c_(-) beta u Z - c_(-) r Z lt.eq - 1 /
    4 alpha_(-) Z^2 $
  on a sufficiently late tail. Consequently the region $u - c_(-) Z lt.eq 0$ is forward invariant,
    and once it is entered the quantity $u - c_(-) Z$ becomes strictly negative and then decreases.
    This contradicts its convergence to zero. Thus $u > c_(-) Z$.
  Choose $c_(+) > 0$ so large that $c_(+)^2 beta_(-) > 2 alpha_(+)$.
    Whenever $u gt.eq c_(+) Z$, the same computation gives
  $ \( u^(+) - c_(+) Z^(+) \) - \( u - c_(+) Z \) = - alpha Z^2 + c_(+) beta u Z - c_(+) r Z gt.eq h Z^2 $
  for some $h > 0$ on a sufficiently late tail. This region is also forward invariant.
    Entry would make $u - c_(+) Z$ strictly positive and increasing, again contradicting convergence to zero.
    We have proved
  #[#set math.equation(numbering: n => "(6.7)")
   $ c_(-) Z < u < c_(+) Z $ <eq:trajectory-cones>]
  at all sufficiently late retained nodes.
  ===== 6.1.3 The first rate estimate. <the-first-rate-estimate.>
  Put $x = u \/ Z$ at a retained node. From (6.5) and (6.7),
  $ 1 / Z^(+) - 1 / Z = frac(beta u - r, Z \( 1 - beta u + r \)) = beta x + O \( Z \) . $
  This increment is bounded above and bounded away from zero.
    Its sum is therefore comparable to the number of retained transitions.
    The physical scale index increases by either $1$ or $K$ at each such transition,
    so that number is comparable to the scale index. It follows that $Z asymp j^(- 1)$ and $u asymp
    j^(- 1)$ at retained nodes. The intermediate estimates preceding (6.4), together with the jump bounds,
    extend these comparisons to every ordinary state and every state before a jump. In particular,
  #[#set math.equation(numbering: n => "(6.8)")
   $ Z_j asymp j^(- 1) \, wide u_j asymp j^(- 1) \, wide 0 < c lt.eq u_j \/ Z_j lt.eq C \, $ <eq:trajectory-first-rate>]
  and the corresponding tilded bounds hold as well.
  We now know the order of both coordinates. The remainder of the proof identifies their leading coefficient.
    For this purpose we return to the original ordinary steps and keep each jump as a separate event at its actual
    scale index.
  ===== 6.1.4 Backward determination of the ratio. <backward-determination-of-the-ratio.>
  For an ordinary step, division of (6.1) by (6.1), using (6.8), gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ tilde(u)_(j + 1) / tilde(Z)_(j + 1) - u_j / Z_j & = \( b x_j^2 - H \) Z_j + O \( j^(- 2) \)\
 & = b \( x_j + x_(*) \) \( x_j - x_(*) \) Z_j + O \( j^(- 2) \) \, wide x_j = u_j / Z_j . $ <eq:trajectory-ratio-step>]
  At a jump, direct division and (6.2)–(6.2) yield
  #[#set math.equation(numbering: n => "(6.10)")
   $ lr(|u_q / Z_q - tilde(u)_q / tilde(Z)_q|) lt.eq C q^(- 1) . $ <eq:trajectory-ratio-jump>]
  List all ordinary steps and all jumps in their chronological order, and put $y = x -
    x_(*)$ at every state in this list. An ordinary step has the form
  $ y^(+) = \( 1 + a \) y + e \, wide a = b \( x + x_(*) \) Z \, wide c \/ j lt.eq a lt.eq C \/ j \,
    wide \| e \| lt.eq C j^(- 2) . $
  A jump has the same form with $a = 0$ and $\| e \| lt.eq C \/ q$.
    For two positions $s < t$ in this event list, let $P_(s \, t)$ be the product of the factors $1 +
    a$ between them. The factors are at least one, and $P_(s \, t) arrow.r oo$ as $t arrow.r oo$ for fixed $s$,
    because there is one ordinary step at every integer scale and $sum_j j^(- 1) = oo$.
    Iterating the equation and solving for the earlier value gives
  $ y_s = y_t / P_(s \, t) - sum_(r = s)^(t - 1) e_r / P_(s \, r + 1) . $
  The values $y_t$ are bounded by (6.8). Letting $t arrow.r oo$, and bounding the denominators below by one,
    therefore shows, for a state at scale $j$,
  $ \| y_s \| lt.eq C sum_(k gt.eq j) k^(- 2) + C sum_(q in cal(Q)\
q gt.eq j) q^(- 1) lt.eq C / j . $
  The last bound uses geometric separation: if $q$ is the first jump at or after $j$,
    the remaining reciprocals sum to at most $q^(- 1) \/ \( 1 - rho^(- 1) \)$.
    This proves (6.3) at every state, including those before jumps.
  ===== 6.1.5 Counting ordinary time. <counting-ordinary-time.>
  For an ordinary step we now have
  $ 1 / tilde(Z)_(j + 1) - 1 / Z_j & = b_j u_j / Z_j + O \( j^(- 1) \) = b x_(*) + O \( j^(- 1) \) . $
  At a jump, (6.2) and (6.8) give
  $ lr(|1 / Z_q - 1 / tilde(Z)_q|) lt.eq C . $
  There are $O \( log j \)$ jumps up to scale $j$. Telescoping from a fixed initial index to $j$ counts exactly
    one ordinary increment for each increase of the scale index by one.
    The sum of the ordinary errors is $O \( log j \)$, and the sum of jump errors has the same bound.
    Hence (6.3) holds. Inverting that estimate and using (6.3) proves (6.3), since $x_(*) \/ \( b x_(*) \) =
    1 \/ b$. A final jump changes $u$ and $Z$ by $O \( j^(- 2) \)$,
    so these conclusions also hold for the states before jumps. ◻
]

=== 6.2 Application to the bulk histories <application-to-the-bulk-histories>

For a dyadic integer $J$, attach a superscript $\( J \)$ to the coordinates of the history whose entry index is
  $i \( J \)$ and whose last index is $8 J$. The entry estimate gives $i \( J \) = O \( log J \)$.
  Thus, for every fixed $c > 0$, the interval $\[ c J \, 8 J \]$ lies after entry when $J$ is large.
  The estimates below are uniform on such intervals, with constants allowed to depend on $c$.

#thm([Lemma 6.2.])[
  (Comparison at a common scale).  #emph[Consider two bulk histories with comparable window parameters $J \, J'$.
    At an index $j$ belonging to fixed positive-fraction windows of both histories,
    write $\( u \, Z \)$ and $\( u' \, Z' \)$ for their balanced marginal coordinates.
    For all sufficiently large indices,
#[#set math.equation(numbering: n => "(6.11)")
 $ \| u' - u \| lt.eq C Z^2 \, wide \| Z' - Z \| lt.eq C \( \| u \| + Z^2 \) Z . $ <eq:trajectory-overlap>]

 The constants are uniform when the comparison factors for the two windows are fixed.]
] <lem:trajectory-overlap>

#proof[
  The two readouts in Proposition 18 concern the same microscopic observables at scale $j$.
    Consequently their values can be written using either history as
  $ U_j & = frac(a, 1 - u) + O \( Z^2 \) + O \( e^(- c_0 min \( J \, J' \)) \) \,\
Y_j & = M_j Z + O #scale(x: 120%, y: 120%)[\(] \( \| u \| + Z^2 \) Z #scale(x: 120%, y: 120%)[\)] +
  O \( e^(- c_0 min \( J \, J' \)) \) \, $
  and likewise with primes. Here $a > 0$ is fixed, and $M_j$ is common to the two histories and bounded above and
    below by positive constants. An exponentially small discrepancy in $M_j$ can be included in the displayed error.
  By Lemmas 16 and 17, the coordinates tend uniformly to zero, $Z \, Z' > 0$, and $- log Z \, - log Z' =
    o \( min \( J \, J' \) \)$. The exponential errors are therefore negligible relative to every fixed positive
    power of either $Z$ or $Z'$. The second readout first implies $Z' asymp Z$:
    its error relative to its own leading term tends to zero on each history. Comparing the first readout now gives
  $ lr(|frac(a, 1 - u') - frac(a, 1 - u)|) lt.eq C Z^2 . $
  The derivative of $a \/ \( 1 - u \)$ is bounded below positively near zero, so $\| u' - u \| lt.eq C Z^2$.
    Substitute this estimate and $Z' asymp Z$ back into the second readout.
    After division by the positive lower bound on $M_j$, it gives the second bound in (6.11). ◻
]

#thm([Proposition 6.3.])[
  (The bulk trajectory throughout an overlap window).  #emph[Fix the block factor $L$ and the other parameters
    chosen for the bulk maps. For every sufficiently large dyadic $J$,
    uniformly in the $J$-history at integer indices $J \/ 2 lt.eq j lt.eq 3 J$,
    its unbalanced gradient coordinate $t_j$, fundamental coordinate $z_j$, and plane remainder $cal(R)_j$ satisfy
#[#set math.equation(numbering: n => "(6.12)")
 $ t_j = frac(1, 2 j log L) + O (frac(log j, j^2)) \, wide \| z_j \| = O \( j^(- 1) \) \, wide
   parallel cal(R)_j parallel = O \( j^(- 2) \) . $ <eq:trajectory-bulk-window>]

 The remainder norm is the unbalanced plane activity norm.]
] <prop:bulk-window>

#proof[
  Select a dyadic $J_0$ large enough for the preceding estimates, and use the $J$-history on $J lt.eq j < 2 J$,
    for $J = J_0 \, 2 J_0 \, 4 J_0 \, dots.h$. At the index $2 J$,
    first evolve the $J$-history through its ordinary step from $2 J - 1$ to $2 J$.
    Regard that output as the state before the change, and then replace it by the state of the $2
    J$-history at the same index. Both states lie in the available positive-fraction windows.
    Lemma 20 gives (6.2)–(6.2) for this replacement.
  Lemma 16 makes all selected states and all states before changes tend to zero.
    Lemma 17 provides $Z > 0$ and the balanced remainder estimates
  $ parallel B_(e \, j) parallel lt.eq C Z_j^2 \, wide parallel B_(o \, j) parallel lt.eq
    C \( \| u_j \| + Z_j^2 \) Z_j . $
  Inserting them into the bulk recurrences, with the parity structure of Lemma 14, gives (6.1)–(6.1) with
  $ H > 0 \, wide b = 2 log L . $
  The jumps occur at $2 J_0 \, 4 J_0 \, 8 J_0 \, dots.h$, so they satisfy the geometric-separation hypothesis with
    $rho = 2$. Lemma 19 consequently gives on the selected path
  #[#set math.equation(numbering: n => "(6.13)")
   $ u_j = frac(1, 2 j log L) + O (frac(log j, j^2)) \, wide Z_j = O \( j^(- 1) \) \, wide
     parallel B_(e \, j) parallel = O \( j^(- 2) \) \, wide parallel B_(o \, j) parallel =
     O \( j^(- 2) \) . $ <eq:trajectory-balanced-window>]
  The displayed odd bound is sufficient here; its stated forcing estimate in fact gives $O \( j^(- 2) \)$ directly
    from $u_j \, Z_j = O \( j^(- 1) \)$.
  These estimates must also hold on histories not selected at a given index.
    Fix a $J$-history and $J \/ 2 lt.eq j lt.eq 3 J$. Let $J'$ be the dyadic parameter selected at $j$,
    so $J' lt.eq j < 2 J'$. Then $J$ and $J'$ are comparable,
    and $j$ belongs to fixed positive-fraction windows of both histories.
    Apply Lemma 20 with the selected state as the unprimed state.
    Since that state has $u \, Z = O \( j^(- 1) \)$, the two $u$ coordinates differ by $O \( j^(- 2) \)$,
    and so do the two $Z$ coordinates. Lemma 17 then gives the same remainder bounds on the $J$-history.
    Thus (6.13) holds throughout every window asserted in the proposition, with uniform constants.
  Finally undo the balance transformations and the subtraction of the analytic Gaussian curve used to define $u \,
    B_e \, B_o$. The coordinate relations in (5.19) give
  $ t & = u + O \( u^2 + Z^2 \) \, wide \| z \| lt.eq C \| Z \| \,\
parallel cal(R) parallel & lt.eq C #scale(x: 120%, y: 120%)[\(] u^2 + Z^2 + parallel B_e parallel +
  parallel B_o parallel #scale(x: 120%, y: 120%)[\)] . $
  The quadratic order in the last line includes the remainder of the Gaussian curve,
    whose constant and linear gradient terms have already been separated.
    Applying these relations to (6.13) proves (6.12). ◻
]

The argument uses uniform convergence on positive-fraction windows and the common physical readouts with their
  stated nonlinear errors. The additional errors from entry-scale smoothing and cutoff removal are exponentially
  small on those windows. No rate of convergence in the height scaling limit was used to obtain the coefficient
  $1 \/ \( 2 log L \)$.

== 7 The magnetic recursion in two squares <sec:magnetic>

The bulk trajectory controls activities far from the boundary and the source.
  We now extend that control to the free walls and the magnetic mark.
  The purpose of the extension is to compare two squares using exactly the same scalar normalization at the mark.
  The insertion at entry can have a polynomially large norm; its residual part will contract,
  while its extracted scalar will cancel in the comparison.

Fix a large integer $j$, put $M = L^j$, and consider the free dual squares of sides $Q = M$ and $Q = L M$,
  with their common center at the mark. Choose the $J$-history of Proposition 21,
  where $J$ is a power of two and $J lt.eq j < 2 J$. Its entry scale is $m = L^i = q R s$,
  with $s asymp_L J^3$ and $i = O \( log J \)$. In both squares stop at the same scale

#[#set math.equation(numbering: n => "(7.1)")
 $ v = L^h \, wide j - h = ⌈log_L \( j^(1 \/ 10) \)⌉ \, wide D = M / v . $ <eq:mag-common-stop>]

Thus $j^(1 \/ 10) lt.eq D < L j^(1 \/ 10)$ and $M \/ \( P s \) arrow.r oo$.
  In particular the entry footprint and every fixed number of blocks about the mark fit strictly inside both
  squares at all scales used.

We use the blocks, compatibility relation, analytic activity norms,
  and covariance shells of the preceding sections. Write $cal(Z)_k \( K \; phi.alt \)$ for the subset partition
  functional at scale $L^k$: it sums products of the activities $K \( X \; phi.alt \)$ over compatible collections
  of nonempty connected supports, including the empty collection.
  Thus $cal(Z)_k$ is the functional $cal(Z)_(L^k)$ of Section 2, indexed here by its absolute scale.
  For another activity family $I$, define

#[#set math.equation(numbering: n => "(7.2)")
 $ cal(I)_k \( K \, I \; phi.alt \) = frac(d, d epsilon) cal(Z)_k \( K + epsilon I \; phi.alt \)\|_(epsilon = 0) .
   $ <eq:mag-first-variation>]

Each term on the right has exactly one $I$ factor; the original exclusions between that factor and the background
  factors are retained. The entry representation of Proposition 13 has this form in the pierced square:
  in its notation, $cal(I)_i \( K \, I \; phi.alt \) = cal(Z)_m^(\( 1 \)) \( K \, I \; phi.alt \)$.

For every support $X$ at scale $L^k$, let $"Rect"_k \( X \)$ be its axis-parallel spanning rectangle,
  and let $"Rect"_k^H \( X \)$ be that rectangle enlarged by $H L^k$ in each coordinate direction.
  In a square, call $X$ #emph[bulk-good] if $"Rect"_k^H \( X \)$ lies strictly inside the square,
  and a #emph[wall support] otherwise. Independently, call $X$ #emph[shift-good] if $"Rect"_k^H \( X \)$ misses
  the mark, and a #emph[defect support] otherwise. These predicates apply to supports of every size;
  they specify both the full wall and defect norms below and the terminal support decomposition.

The constant $H$ is fixed before $L$, independently of the entry box parameter $P$.
  It is large enough for the testing and assignment radii and for the geometric sum of predecessor-dependence
  radii used in copying. The same definition at an output scale uses $H$ #emph[coarse] blocks.
  It does not require a bulk-good fine input to be clear of its entire shell,
  whose range can be of order $L$ fine blocks. The entry convention for unused background supports inside the
  compulsory footprint allows $H$ to remain independent of $P$.

Figure 2 shows the geometry of the common stop. The local computations determining the marked scalars take place
  in the same interior region; the wall contributions remain in the terminal activities.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-2.88, -2.88), (2.88, 2.88), fill: rgb("#f4f4f4"), stroke: none)
  rect((-2.64, -2.64), (2.64, 2.64), fill: rgb("#ffffff"), stroke: none)
  rect((-2.88, -2.88), (2.88, 2.88), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-1.92, -1.92), (1.92, 1.92), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-1.696, -1.696), (1.696, 1.696), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((-0.464, -0.464), (0.464, 0.464), fill: rgb("#ebebff"), stroke: none)
  rect((-0.464, -0.464), (0.464, 0.464), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$2 pi$]], anchor: "south-west", padding: 0.1176cm)
  line((0.464, 0.464), (3.28, 1.44), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.28, 1.44), [#box(width: 4.235cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Common interior data#linebreak()within distance $O(v)$#linebreak()determine extracted scalars.]])], anchor: "west")
  line((1.904, -1.2), (3.28, -0.56), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.28, -0.56), [#box(width: 4.235cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #text(size: 9pt)[Wall terms remain in#linebreak()the terminal comparison.]])], anchor: "west")
  line((-1.92, -2.2), (1.92, -2.2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((0, -2.2), [#box(inset: 0.3333em, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$M$]]])])
  line((-2.88, -3.2), (2.88, -3.2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((0, -3.2), [#box(inset: 0.3333em, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$"LM"$]]])])
  content((0, 3), [#text(size: 9pt)[$v=L^h, D=M"/"v arrow.r.long infinity$]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 2: Two concentric dual squares are stopped at the same block side $v$. The marked scalar computations use identical interior data, whereas the remaining backgrounds are compared by terminal integration. The common interior region has radius $O \( v \)$, much smaller than $M$. The squares and collars are schematic and not drawn to scale. ],
) <fig:common-core>

Let $K_(k \, Q)^0$ and $K_(k \, Q)^l$ denote the ordinary and pierced background activities.
  On a shift-good support the local lift $lambda_Q$ satisfies $partial lambda_Q =
  eta_l \/ alpha$ and is defined up to a constant multiple of the field period.
  On interior supports meeting the mark, the comparison with the pierced plane calculation instead uses the smooth field

$ gamma_Q = \( r_Q - r_oo \) \/ alpha . $

The lift estimates and entry copying established earlier apply in these field units.

#thm([Proposition 7.1.])[
  (Common magnetic normalization).  #emph[For all sufficiently large $j$,
    the exact maps from entry scale $i$ to stop $h$ can be chosen with the following properties.]
  + #emph[At the stop, in the fixed norm regimes for the ordinary and defect activities,
#[#set math.equation(numbering: n => "(7.3)")
 $ max_(Q in { M \, L M }) #scale(x: 120%, y: 120%)[\(] lr(bar.v.double K_(h \, Q)^0 bar.v.double) +
   lr(bar.v.double K_(h \, Q)^l bar.v.double) #scale(x: 120%, y: 120%)[\)] lt.eq C / j . $ <eq:mag-small-backgrounds>]

 The bulk copies satisfy the sharper conclusion of Proposition 21.
   On shift-good supports, pierced activities are exactly ordinary activities evaluated at the local lift.
   Interior pierced activities copy the plane calculation at the translate $gamma_Q$,
   whenever their required clearance holds.]
  + #emph[Let $a_(k \, Q \, b)^nu$ be the designated scalar coefficient at coarse block $b$ in step $k$, for $nu =
    0 \, l$, and set
#[#set math.equation(numbering: n => "(7.4)")
 $ P_Q^nu = product_(k = i)^(h - 1) product_b \( 1 + a_(k \, Q \, b)^nu \) . $ <eq:mag-background-products>]

 All factors are real and positive. The ratios agree exactly:
#[#set math.equation(numbering: n => "(7.5)")
 $ P_M^l / P_M^0 = P_(L M)^l / P_(L M)^0 = : rho_j . $ <eq:mag-common-background-ratio>]

 For every fixed $epsilon.alt_2 > 0$, the initial smallness choices can be made so that $\| log rho_j \| lt.eq
   epsilon.alt_2 j$ for all sufficiently large $j$.]
  + #emph[There are a real scalar $sigma_Q$ and residual insertion activities $I_(h \, Q)$ such that integration
    of the entry insertion over all shells below $v$ gives the exact field identity
#[#set math.equation(numbering: n => "(7.6)")
 $ bb(E)_(i : h) cal(I)_i \( K_(i \, Q)^l \, I_(i \, Q) \; phi.alt \) =
   P_Q^l {sigma_Q cal(Z)_h \( K_(h \, Q)^l \; phi.alt \) + cal(I)_h \( K_(h \, Q)^l \, I_(h \, Q) \; phi.alt \)} .
   $ <eq:mag-insertion-identity>]

 Here $bb(E)_(i : h)$ denotes successive shell integration, with the remaining field $phi.alt$ held fixed.
   The scalar is common to the two squares,
#[#set math.equation(numbering: n => "(7.7)")
 $ sigma_M = sigma_(L M) = : sigma_j \, $ <eq:mag-common-insertion-scalar>]

 and every support of $I_(h \, Q)$ contains the designated mark block. Moreover,
#[#set math.equation(numbering: n => "(7.8)")
 $ lr(bar.v.double I_(h \, Q) bar.v.double) lt.eq C_R s^(C_R) L^(- 2 \( h - i \) \/ 3) \, wide Q in { M \,
   L M } . $ <eq:mag-insertion-bound>]

]
  #emph[The products in (7.4) contain only the RG extraction factors.
    They do not include the common entry scalar or the harmonic-energy factor of the Gaussian sector law.]
] <prop:magnetic>

We prove the proposition in four steps. The localizations and placement estimates are those of the exact partition
  map in #cite(label("B")) Section 4. The wall and lifted-copy constructions follow the method of its Propositions
  5.5 and 5.7. Their low-temperature conclusions are not inputs here:
  the marginal charge estimate, critical forcing, and insertion contraction needed for the present proposition are
  established below.

=== 7.1 The wall estimate at the marginal frequency <the-wall-estimate-at-the-marginal-frequency>

A small support means one in the small linear-input class of the partition map.
  Its fine-block size is bounded by the fixed threshold $n_0$,
  and its coarse closure has index diameter at most one. In an ordinary square use the plane localization,
  including the fundamental harmonic localization, on small bulk-good inputs.
  On small wall inputs extract only the neutral constant. Since a small support has bounded diameter,
  the latter inputs lie within a fixed number of fine-block layers of a wall.
  A small bulk-good input still uses the plane prescription if its shell convolution can see the wall;
  its contribution to a wall output is treated as forcing. In contrast,
  the $H$ coarse-block clearance of a bulk-good output ensures that every predecessor needed for copying lies in
  the interior with its required shell and numerical dependence.

Ordinary activities are even in the field. After neutral constant subtraction,
  the localization lemma of #cite(label("B")) Lemma 4.5 gives a factor $C L^(- 2)$ for a small wall input.
  There are $O_H \( L \)$ fine placements at a prescribed coarse block along a wall,
  and only $O_H \( 1 \)$ at a corner. It remains to check the charged part at $alpha^2 = 8 pi$.

Let $Gamma$ be the shell covariance from side $m'$ to side $L m'$, and let $x$ lie on a small wall support.
  The binary kernel estimates, with even reflection at a free wall, give

#[#set math.equation(numbering: n => "(7.9)")
 $ Gamma \( x \, x \) gt.eq frac(log L, 2 pi) - C \, wide
   lr(bar.v.double Gamma \( thin dot.op thin \, x \) - Gamma \( x \, x \) bar.v.double)_(m' \, X) lt.eq
   C . $ <eq:mag-wall-shell>]

Both constants are independent of $L$ after the geometric radii are fixed.
  For the diagonal estimate, the direct image supplies the plane value.
  An image contribution vanishes at binary scales smaller than a fixed multiple of its separation,
  by finite range. At scales larger than a sufficiently large fixed multiple of that separation it is nonnegative:
  the positive plane binary diagonal and the derivative estimate give this assertion.
  Only boundedly many intermediate binary scales can contribute negatively, and each is bounded.
  At a corner the same argument applies to the finite set of reflected images.
  Other walls are beyond the shell range in the applications where this description is used.
  Positive-order binary estimates summed over the shell prove the second bound in (7.9).

Apply the charge-contour estimate of #cite(label("B")) Equations (4.26) and (8.14), with shift amplitude $a =
  alpha$. For nonzero integer charge $q$, its exponential gain is bounded by

$ C exp { - alpha^2 \( \| q \| - 1 \/ 2 \) Gamma \( x \, x \) + h_0 alpha \| q \| } . $

Using (7.9), the fundamental charges have gain $C L^(- 2)$,
  and the higher charges form a summable series with stronger powers of $L^(- 1)$.
  The analytic radius $h_0$ is chosen before $L$ to allow the fixed nonconstant imaginary shift.
  The observation regulator is admissible in this estimate by #cite(label("B")) Lemma 9.2 and its free-square
  version verified at entry. Thus the charged wall terms have the same $C
  L^(- 2)$ bound required for the placement count.

Let $p_k$ be the full ordinary plane activity norm, and let $w_k$ be the full norm restricted to ordinary wall
  supports as defined above, without a small-size restriction.
  Large linear inputs have arbitrarily strong weight contraction after the activity weight is chosen sufficiently
  large. The analytic nonlinear bound of the partition map and the preceding small-input estimates give

#[#set math.equation(numbering: n => "(7.10)")
 $ w_(k + 1) lt.eq theta_1 w_k + C_L p_k + C_L \( w_k + p_k \)^2 \, wide theta_1 < 1 . $ <eq:mag-wall-recursion>]

Here $C_L p_k$ includes plane inputs and assigned pieces that reach a wall output.
  Their field evaluations occur on their original fine blocks with the prescribed collars,
  so no wall cancellation is needed to bound them. All norm regimes, including their regulator reserves,
  are fixed once; the wall contraction does not consume another reserve at each step.

=== 7.2 Defect localization and exact copying <defect-localization-and-exact-copying>

On a small shift-good input in the pierced square, use exactly the localization pieces of its ordinary
  counterpart, evaluated at the lifted field. Designate exactly the same scalar for extraction.
  In particular a translated quadratic may have a nonzero value at zero field,
  but that value remains part of the quadratic piece; it is not extracted as an additional scalar.

For a small defect input $F_Q$, let

$ \( F_Q \)_0 \( phi.alt \) = frac(alpha, 2 pi) integral_0^(2 pi \/ alpha) F_Q \( phi.alt + t \) thin d t $

be its neutral projection. In the plane extract $bb(E) \( F_oo \)_0 \( zeta \)$,
  where $zeta$ is the current shell. In the square extract instead

#[#set math.equation(numbering: n => "(7.11)")
 $ c_Q \( F_Q \) = bb(E) \( F_Q \)_0 \( zeta - gamma_Q \) . $ <eq:mag-backtranslated-extraction>]

The neutral projection is invariant under constant field shifts,
  so the alignment constant in $gamma_Q$ does not affect this definition. Every small defect input is interior:
  its bounded fine-block diameter and its failure to be shift-good place it within $O_H \( L^k \)$ of the mark,
  while $L^k lt.eq v \/ L = M \/ \( D L \)$ for every input to a step before the stop.

The changed subtraction has the same contraction as ordinary neutral constant subtraction.
  Indeed the latter gives $C L^(- 1)$ without evenness. On a small fine support at side $m' = L^k$,
  the nonconstant part of $gamma_Q$ has fine test norm at most $C m' \/ Q$.
  By the analytic derivative bound with its fixed regulator reserve,

#[#set math.equation(numbering: n => "(7.12)")
 $ lr(|c_Q \( F_Q \) - bb(E) \( F_Q \)_0 \( zeta \)|) lt.eq C m' / Q lr(bar.v.double F_Q bar.v.double) lt.eq C /
   L lr(bar.v.double F_Q bar.v.double) . $ <eq:mag-extraction-change>]

The last inequality holds uniformly through the chosen stop for large $j$.
  Charged small defect inputs have gain $C L^(- 2)$ by the same contour argument,
  now with the interior shell estimates. At a prescribed output there are only $O_H \( 1 \)$ small fine defect
  placements. Consequently their total residual norm is at most $C L^(- 1)$ times their input norm.

Translations of shift-good inputs use the norm reserves fixed at entry.
  On the relevant fine collars, $m' \| nabla lambda_Q \|$ and $\( m' \)^2 \| nabla^2 lambda_Q \|$ are bounded.
  The quadratic inequality therefore permits a fixed increase in the ordinary regulator exponent,
  and a fixed increase in the coefficient of the variational observation regulator.
  Each costs at most $C^(\| X \|)$ on a support $X$, absorbed by the reserved activity weight.
  A localized piece that is assigned to a coarse singleton is still evaluated on the fine block where its lift is
  defined. This applies to both gradient pieces and fundamental harmonics;
  a deterministic real phase does not enlarge the analytic norm of the latter.
  Thus pieces reaching defect outputs have controlled norm without evaluating a lift at the singular core.

Let $d_k$ be the full defect norm, in this fixed reserved regime.
  The same multilinear partition-map estimates as for the wall,
  with the large-input weight gain in the defect norm, give

#[#set math.equation(numbering: n => "(7.13)")
 $ d_(k + 1) lt.eq theta_1 d_k + C_L \( p_k + w_k \) + C_L \( d_k + w_k + p_k \)^2 \, wide
   theta_1 < 1 . $ <eq:mag-defect-recursion>]

The forcing term includes the translated ordinary pieces just described.
  This proves the analytic estimate needed near the mark. We next verify the numerical equality that will make its
  scalar normalization disappear between the two squares.

Suppose an output support has the stated clearance. Every fine input, assigned singleton piece,
  and scalar normalization entering that output then fits in its enlarged neighborhood.
  On a shift-good output they share a common lift. Products and Gaussian convolution commute with this
  deterministic translation, and the identical localizations preserve the translated-copy identity.
  For an interior defect output use instead

#[#set math.equation(numbering: n => "(7.14)")
 $ F_Q \( phi.alt \) = F_oo \( phi.alt + gamma_Q \) . $ <eq:mag-pierced-copy>]

The shell kernels agree there by finite range, and (7.11) gives the exact equality

$ c_Q \( F_Q \) = bb(E) \( F_oo \)_0 \( zeta \) . $

It follows inductively that both activities and designated coefficients copy the corresponding plane calculation.

This induction includes numerical, as well as field, dependence.
  In the exact map, predecessor dependence from relocation and singleton normalizers extends by at most a fixed
  multiple of the current scale. Over earlier steps these distances sum to a geometric series.
  The link construction at entry records any numerical dependence reaching a wall in its support,
  so the same argument starts at entry. Enlarging $H$ by a fixed amount pays these causal radii.
  A support that still reaches a wall cannot become a small marked input before the stop:
  the distance from the mark to the wall, in stop blocks, tends to infinity.
  Large inputs do not supply scalar extractions. Thus neither a long entry link nor a large insertion support can
  introduce a hidden wall dependence into the local constants at the mark.

The only differences between pierced and ordinary designated constants arise from small defect inputs,
  so they occur at $O_H \( 1 \)$ blocks per step. At each of these blocks both the pierced and ordinary constants
  are the same plane constants in the two squares. All other factors cancel in the pierced-to-ordinary product
  within each square. This proves (7.5) exactly.

=== 7.3 Scalar extraction with one insertion <scalar-extraction-with-one-insertion>

For clarity, we record the scalar algebra before estimating the insertion. Write one exact background map as

#[#set math.equation(numbering: n => "(7.15)")
 $ bb(E) cal(Z)_k \( K \; phi.alt + zeta \) = p_k \( K \) cal(Z)_(k + 1) \( cal(F)_k \( K \) \; phi.alt \) \, wide
   p_k \( K \) = product_b \( 1 + a_(k \, b) \( K \) \) . $ <eq:mag-one-map>]

Here the $a_(k \, b)$ are the designated coefficients of small linear inputs.
  Extend the same exact splitting algebra to coefficients in $bb(R) \[ epsilon \] \/ \( epsilon^2 \)$.
  Its degree-zero terms use the background localization; its degree-one terms use the marked localization and
  allocation specified below. Write

$ a_(k \, b) \( epsilon \) = a_(k \, b) + epsilon a'_(k \, b) \, wide K_(+) = cal(F)_k \( K \) \, wide
  K_(+) \( epsilon \) = K_(+) + epsilon cal(T)_k \( K \) I . $

Thus $cal(T)_k \( K \)$ is the linear map in the insertion slot of this extended construction.
  It need not be the derivative of the unmarked map $cal(F)_k$,
  since the two slots have different localization prescriptions. Put

$ I_(+) = cal(T)_k \( K \) I \, wide beta_k = sum_b frac(a'_(k \, b), 1 + a_(k \, b)) . $

The coefficient of $epsilon$ in the exact identity is

#[#set math.equation(numbering: n => "(7.16)")
 $ bb(E) cal(I)_k \( K \, I \; phi.alt + zeta \) = p_k \( K \) {beta_k cal(Z)_(k + 1) \( K_(+) \; phi.alt \) +
   cal(I)_(k + 1) \( K_(+) \, I_(+) \; phi.alt \)} . $ <eq:mag-differentiated-map>]

This is differentiation of the partition identity with the stated degree-dependent splittings.
  No finite nonzero perturbation by the possibly large $I$ is required.

If an earlier step has already produced a scalar $sigma$, linearity applied to $sigma cal(Z)_k \( K \) +
  cal(I)_k \( K \, I \)$ gives

#[#set math.equation(numbering: n => "(7.17)")
 $ sigma_(+) = sigma + beta_k \, wide I_(+) = cal(T)_k \( K \) I . $ <eq:mag-scalar-recursion>]

In particular the earlier scalar is kept outside the later map. It is not put back into the activity as $sigma K$.
  This elementary identity is important because $sigma$ need not be small,
  whereas the operator controlling $I_(+)$ only sees the small background $K$.

We also specify how the mark is preserved in the exact algebra.
  Use (7.11) for small insertion inputs, and assign their extracted constant to the coarse block containing the
  designated fine mark block. This assignment lies in their coarse closure, as required by the partition map.
  A residual input keeps its closure label, including the mark.
  In the scalar normalization step the decoration at block $b$ is

$ d_b = \( 1 + a_b \)^(- 1) - 1 \, wide d'_b = - frac(a'_b, \( 1 + a_b \)^2) . $

Only a small marked input can give $a'_b eq.not 0$, and its designated block is the mark block.
  Hence a differentiated decoration is also supported at the mark.
  Every term in a differentiated product contains either an insertion input or such a decoration;
  its final connected support therefore contains the mark. Original exclusions remain attached to relocated
  pieces, exactly as in #cite(label("B")) Proposition 4.8. The differentiation does not turn a compatible
  collection into an unrestricted product.

At zero background, the complete residual insertion map after scalar extraction is the subtracted small linear map
  together with the unchanged large linear map. The small-input bound just proved is $C \/ L$,
  with boundedly many marked placements. By increasing the large-support weight after fixing $L$,
  its remaining linear contribution is as small as desired.
  The multilinear bounds for the exact partition map give
  $lr(bar.v.double cal(T)_k \( K \) - cal(T)_k \( 0 \) bar.v.double) lt.eq
  C_L lr(bar.v.double K bar.v.double)$ on the fixed small background ball, and hence

#[#set math.equation(numbering: n => "(7.18)")
 $ lr(bar.v.double I_(+) bar.v.double) lt.eq (C / L + delta_A + C_L lr(bar.v.double K bar.v.double))
   lr(bar.v.double I bar.v.double) \, $ <eq:mag-insertion-operator>]

where $delta_A$ tends to zero as the weight is increased.
  For this degree-one map the background and insertion may have different designated localizations:
  the exact splitting algebra is linear in each input, and its multilinear estimates use the same bounds on these
  designated pieces. Thus (7.18) applies to the prescribed marked splitting as well.
  It imposes no smallness assumption on $lr(bar.v.double I bar.v.double)$ itself.

Choose $L$ so that $C \/ L < 1 / 3 L^(- 2 \/ 3)$, the weight so that $delta_A < 1 / 3 L^(- 2 \/ 3)$,
  and then the background tube so that $C_L lr(bar.v.double K bar.v.double) < 1 / 3 L^(- 2 \/ 3)$ at every step.
  Iteration and the entry insertion bound give (7.8).

Finally every summand in $beta_k$ depends only on a small marked input and the background normalizer at its
  assigned block. The copying argument in the preceding subsection makes both its numerator and denominator
  identical in the two squares. This also holds for the insertion activities by induction through (7.16).
  At entry the compulsory footprint fits with clearance in both squares;
  a support too small to contain it has insertion coefficient zero in both.
  Starting with $sigma_i = 0$, Equation (7.17) therefore gives $sigma_M = sigma_(L M)$.
  This equality does not require a bound or a sign for the accumulated scalar.

=== 7.4 Completion of the background bounds <completion-of-the-background-bounds>

#proof[
  The constructions above give the exact identities and the copying assertions.
    We complete the uniform estimates and the parameter choices.
    Fix the kernel and assignment radii, the clearance $H$, and the finite list of norm regimes with their
    translation and integration reserves. Choose $L$ and then the activity weights as in the local estimates.
    The constants in the small-support bounds before placement counting are independent of $L$.
    After these choices take the bulk diagnostic tube sufficiently small.
    Proposition 13 supplies arbitrarily small entry backgrounds in all of these fixed regimes,
    and the bulk analysis keeps the plane activities in the prescribed tube.
  The two recursions (7.10) and (7.13) now keep the wall and defect backgrounds small throughout the history.
    More explicitly, by decreasing the tube the quadratic terms can be absorbed into a slightly larger contraction
    $theta_2 < 1$ and a constant multiple of their forcing terms.
    Iteration first for $w_k$ and then for $d_k$ proves the assertion.
    On the last positive-fraction window, Proposition 21 gives $p_k lt.eq C \/ j$.
    The geometric convolutions in the two recursions therefore give $w_h + d_h lt.eq C \/ j$;
    the earlier part of each convolution is exponentially small in $j$.
    This proves (7.3), including its uniformity for $Q = M$ and $Q = L M$.
  All coefficients and localizations are real. Their scalar coefficients are bounded by a fixed map constant times
    the small background tube, so $\| a_(k \, Q \, b)^nu \| < 1 \/ 2$ and every extracted factor is positive.
    Only boundedly many factors per step differ between the pierced and ordinary maps. Since
  $ \| log \( 1 + a \) - log \( 1 + a' \) \| lt.eq 2 \| a - a' \| wide \( \| a \| \, \| a' \| < 1 \/ 2 \) \, $
  their cumulative ratio has logarithm at most $epsilon.alt_2
    j$ in absolute value after the tube is decreased in terms of the prescribed $epsilon.alt_2$.
    This decrease is made after the fixed map constants and remains compatible with the preceding choices.
  The same smallness gives the insertion operator bound chosen after (7.18).
    Iterating (7.16), keeping the scalar outside each subsequent map as in (7.17), proves (7.6).
    The equality of its scalar between the two squares and the norm bound have already been established.
    This proves all parts of the proposition. ◻
]

== 8 Terminal integration and the normalization constant <sec:terminal>

We now compare two squares using the same finite history.
  The comparison removes all scalar contributions from the microscopic magnetic core.
  What remains is a deterministic energy difference and a small terminal partition function.
  The accuracy of the latter comparison, rather than an estimate on the core amplitude,
  will give a convergent normalization.

Let $M = L^j$, $n = M \/ 2$, and use the history with $J lt.eq j < 2 J$ as in Proposition 22.
  For $Q in { M \, L M }$, the subscript $Q$ will indicate the free dual square of side $Q$.
  Both calculations stop at the scale in (7.1):

#[#set math.equation(numbering: n => "(8.1)")
 $ v = L^h \, wide j - h = ⌈log_L \( j^(1 \/ 10) \)⌉ \, wide D = M \/ v . $ <eq:terminal-stop>]

In particular,

#[#set math.equation(numbering: n => "(8.2)")
 $ j^(1 \/ 10) lt.eq D < L j^(1 \/ 10) \, wide h = j - O_L \( log j \) . $ <eq:terminal-stop-size>]

There are $O_L \( D^2 \)$ terminal blocks in either square.
  All constants below may depend on the parameters fixed before choosing the history, including $L$, but not on $j$.

Write $bb(E)_(* \, Q)$ for expectation under the remaining reference Gaussian field in the square of side $Q$,
  together with its common constant, which is uniform modulo $2 pi \/ alpha$. Recall that $alpha^2 = 8 pi$.
  For $epsilon in { 0 \, l }$, define

$ cal(Z)_Q^epsilon = bb(E)_(* \, Q) cal(Z)_h \( K_(h \, Q)^epsilon \; psi \) \, wide cal(J)_Q =
  bb(E)_(* \, Q) cal(I)_h \( K_(h \, Q)^l \, I_(h \, Q) \; psi \) . $

Here $cal(Z)_h$ is the compatible-support partition polynomial,
  and $cal(I)_h$ is its part with exactly one marked activity, as in Proposition 22.
  In particular, $cal(J)_Q$ does not include the separately extracted scalar $sigma_Q$.

=== 8.1 Uniform terminal integration <uniform-terminal-integration>

The fact that $D$ grows is useful: it separates the magnetic core from the wall at the terminal scale.
  It also requires a terminal estimate whose constants do not depend on the total number of blocks.

#thm([Lemma 8.1.])[
  (Terminal partition expansion).  #emph[For the backgrounds of Proposition 22,
#[#set math.equation(numbering: n => "(8.3)")
 $ cal(Z)_Q^epsilon & = 1 + O_L \( D^2 \/ j \) \,\
log cal(Z)_Q^epsilon & = sum_X bb(E)_(* \, Q) K_(h \, Q)^epsilon \( X \; psi \) +
  O_L \( D^4 \/ j^2 \) . $ <eq:terminal-partition-small>]

 They are real and positive for all sufficiently large $j$. Moreover,
#[#set math.equation(numbering: n => "(8.4)")
 $ \| cal(J)_Q \| lt.eq C_L D^2 parallel I_(h \, Q) parallel . $ <eq:terminal-insertion>]

 These estimates hold with the fixed regulator and activity-weight reserves used in the magnetic construction.]
] <lem:terminal-partition>

#proof[
  The terminal regulator estimate in Proposition 6 gives
  #[#set math.equation(numbering: n => "(8.5)")
   $ bb(E)_(* \, Q) product_(a = 1)^p cal(G)_h \( X_a \; psi \) lt.eq
     C^(\| X_1 \| + dots.h.c + \| X_p \|) $ <eq:terminal-regulator>]
  for compatible supports, with any one of the fixed reserved regulators $cal(G)_h$ used here.
    The constant in this bound is independent of $Q \/ v$. To recall why the terminal estimate has this
    uniformity, the positive-order differences of the remaining covariance are bounded at scale $v$,
    and its energy form is bounded by the full reference form.
    The blockwise Gaussian quadratic estimates in the regulator proof therefore have uniformly bounded operator
    norm and trace proportional to the number of blocks being tested.
    Their exponential moments cost at most $C^(\| X \|)$ on a support $X$.
    Neither estimate uses an upper bound on the number of blocks in the entire square.
    Regulator composition and monotonicity apply the same estimate to the union of compatible supports.
    The common constant causes no additional cost, since the activities are periodic and the regulators depend
    only on nonconstant fields. These are the terminal bounds of #cite(label("B")) Sections 9 and 4;
    their kernel hypotheses hold equally at the earlier stop (8.1).
  Proposition 22 bounds each background by $C \/ j$ in the activity norm.
    Sum first over supports through a specified anchor block and then over the $O_L \( D^2 \)$ anchors.
    The exponential cost in (8.5) is absorbed by the reserved activity weight.
    It follows that the absolute sum of terms of degree $p$ in the terminal partition polynomial is bounded by
  $ \( C_L D^2 \/ j \)^p . $
  Since $D^2 \/ j arrow.r 0$, the terms of degree at least two have total size $O_L \( D^4 \/ j^2 \)$.
    The constant term is one and the degree-one term is the sum in (8.3).
    This proves (8.3); expanding $log \( 1 + x \)$ proves (8.3).
    Reality follows from the real-coefficient construction, and closeness to one then gives positivity.
    The same calculation with one distinguished marked factor bounds the sum by
  $ C_L D^2 parallel I_(h \, Q) parallel sum_(p gt.eq 0) \( C_L D^2 \/ j \)^p . $
  Absorbing this convergent series proves (8.4). ◻
]

=== 8.2 Cancellation of the magnetic scalar <cancellation-of-the-magnetic-scalar>

Let $hat(a)_(Q \/ 2)$ denote the ratio with the observation cutoffs used for this history.
  This notation depends on the chosen history; only the two squares under simultaneous comparison use it below. Set

$ E_Q = parallel eta_(l \, Q) parallel^2 \, wide H_Q = exp { - E_Q \/ \( 2 alpha^2 \) } . $

The common preparation scalar cancels between the two sectors. The exact identities (7.4) and (7.6) therefore give

#[#set math.equation(numbering: n => "(8.6)")
 $ hat(a)_(Q \/ 2) = H_Q rho_j frac(sigma_j cal(Z)_Q^l + cal(J)_Q, cal(Z)_Q^0) \, wide rho_j = P_Q^l /
   P_Q^0 > 0 . $ <eq:terminal-exact-ratio>]

Both $rho_j$ and $sigma_j$ are exactly the same for $Q = M$ and $Q = L M$.
  The equality of $sigma_j$ is algebraic; its sign has not been assumed.

#thm([Lemma 8.2.])[
  (Relative removal of the residual insertion).  #emph[There is $c > 0$ such that, for all sufficiently large $j$,
    $sigma_j > 0$ and
#[#set math.equation(numbering: n => "(8.7)")
 $ log a_(Q \/ 2) = - frac(E_Q, 2 alpha^2) + log rho_j + log sigma_j + log cal(Z)_Q^l - log cal(Z)_Q^0 +
   O \( e^(- c j) \) $ <eq:terminal-log-ratio>]

 for both $Q = M$ and $Q = L M$.]
] <lem:terminal-scalar>

#proof[
  The bounds on $s$, the entry index $i$, and the terminal index $h$ give $s = O_L \( j^3 \)$, $i =
    O_L \( log j \)$, and $j - h = O_L \( log j \)$. By (7.8) and (8.4),
    the marked term in the physical ratio (8.6) is bounded by
  #[#set math.equation(numbering: n => "(8.8)")
   $ lr(|H_Q rho_j cal(J)_Q / cal(Z)_Q^0|) lt.eq "poly" \( j \) L^(- 2 j \/ 3) e^(epsilon.alt_2 j) .
     $ <eq:terminal-physical-residual>]
  Here $H_Q lt.eq 1$, the denominator is bounded below by Lemma 23,
    and Proposition 22 gives $\| log rho_j \| lt.eq epsilon.alt_2 j$.
    The positive number $epsilon.alt_2$ may be chosen arbitrarily small by shrinking the background tube after
    fixing the map constants. Choose $epsilon.alt_2 < \( log L \) \/ 6$.
  Lemma 5 gives $a_(Q \/ 2) gt.eq c_L L^(- j \/ 2)$. Consequently,
    (8.8) is exponentially small relative to $a_(Q \/ 2)$. The cutoff error is even smaller:
    the preparation bound has the form
  $ C \( Q \/ s \)^2 e^(- c_1 s) = exp { - c_1 s + O_L \( j \) } \, $
  and $s gt.eq c_L j^3$. The ordinary cutoff denominator is $1 +
    o \( 1 \)$ after division by its uncut partition function, so the same bound, with a changed constant,
    controls the error in the ratio. Dividing by the crude lower bound again shows that $hat(a)_(Q \/ 2) =
    a_(Q \/ 2) \( 1 + O \( e^(- c j) \) \)$.
  The exact identity (8.6) now implies
  $ H_Q rho_j sigma_j cal(Z)_Q^l / cal(Z)_Q^0 = a_(Q \/ 2) \( 1 + O \( e^(- c j) \) \) . $
  Every factor on the left except $sigma_j$ is positive. Thus $sigma_j > 0$ for large $j$,
    and taking logarithms proves (8.7). This argument uses neither positivity of individual activities nor an a
    priori lower bound on the extracted insertion scalar. ◻
]

The two scalar logarithms in (8.7) cancel when the square is enlarged.
  It remains to compute the difference of the terminal background terms to a summable accuracy.

=== 8.3 The first-order magnetic difference <the-first-order-magnetic-difference>

Define the first-order term

$ F_Q^epsilon = sum_X bb(E)_(* \, Q) K_(h \, Q)^epsilon \( X \; psi \) $

and its magnetic double difference

$ Delta_j = \( F_(L M)^l - F_(L M)^0 \) - \( F_M^l - F_M^0 \) . $

The word “double” here refers simply to taking first a difference between the magnetic and ordinary sectors and
  then a difference between the two square sizes.

#thm([Lemma 8.3.])[
  (First-order terminal comparison).  #emph[With the running gradient coordinate $t_h$ of Proposition 21,
#[#set math.equation(numbering: n => "(8.9)")
 $ Delta_j = frac(t_h, 2 alpha^2) \( E_(L M) - E_M \) + O_L (D^2 / j^2 + frac(1, D j)) . $ <eq:terminal-first-order>]

]
] <lem:terminal-first-order>

#proof[
  We split the supports into shift-good bulk supports, shift-good wall supports,
    and the remaining supports near the mark. These are the same support classifications used for the copying
    prescriptions in Proposition 22. For a support of size $p$,
    all the enlarged rectangles and test collars used below have diameter at most $C_L p v$.
    Polynomial factors in $p$ are harmless in sums with the reserved exponential activity weight.
  First discard supports with $p > c_2 D$, where $c_2 > 0$ is a sufficiently small fixed constant depending on the
    geometry. Their full norm is $O \( 1 \/ j \)$, so their total integrated contribution in either square is
  $ O_L \( D^2 j^(- 1) e^(- c D) \) . $
  This is smaller than $1 \/ \( D j \)$ for all sufficiently large $j$.
    We can therefore assume $p lt.eq c_2 D$ throughout the local comparisons.
  #emph[Shift-good bulk supports.] The pierced activity is the ordinary plane activity evaluated at $psi +
    lambda_Q$, where the local lift satisfies $partial lambda_Q = eta_(l \, Q) \/ alpha$.
    The remainder after the running gradient and fundamental singletons has norm $O \( j^(- 2) \)$ by
    Proposition 21. Its translated norm has the same bound with the fixed reserves,
    and summing over the $O_L \( D^2 \)$ possible anchors costs $O_L \( D^2 \/ j^2 \)$.
  The fundamental singleton has zero expectation, before and after the translation,
    because integration over the common constant annihilates every nonzero charge.
    For the gradient singleton, the cross term has zero Gaussian expectation.
    Its translated-minus-untranslated expectation is therefore exactly the deterministic gradient energy of
    $lambda_Q$, with coefficient $t_h \/ 2$. The energy allocations $e_B^0$ in the bulk map partition this energy.
    Summing the bulk singleton contributions gives the corresponding portion of $t_h E_Q \/ \( 2 alpha^2 \)$.
  We may complete this portion to the full energy when taking the difference of squares.
    The omitted wall positions occupy a strip of width $O_L \( v \)$ and length $O_L \( Q \)$.
    The source bounds in Equation (2.19) give $\| eta_(l \, Q) \| lt.eq C_L \/ M$ there,
    hence an omitted energy $O_L \( v \/ M \) = O_L \( D^(- 1) \)$.
    The positions omitted near the mark can be chosen identically relative to the center in the two squares.
    Their energies individually need not be small. Their #emph[difference], however, is small.
    On their region of radius $O_L \( v \)$, the square-to-plane alignment estimate (3.12), together with (2.19), gives
  $ \| eta_(l \, L M) - eta_(l \, M) \| lt.eq C_L \/ M \, wide \| eta_(l \, L M) \| + \| eta_(l \, M) \| lt.eq
    frac(C_L, 1 + "dist" \( dot.op \, 0 \)) . $
  Thus, summing over lattice annuli,
  $ sum_("dist" \( e \, 0 \) lt.eq C_L v) \| \| eta_(l \, L M) \( e \) \|^2 - \| eta_(l \, M) \( e \) \|^2
    #scale(x: 120%, y: 120%)[\|] lt.eq C_L (v / M + v^2 / M^2) = O_L \( D^(- 1) \) . $
  The same estimate covers the allocation collars and half-edge conventions.
    Since $t_h = O \( 1 \/ j \)$, the resulting error is $O_L \( 1 \/ \( D j \) \)$.
  #emph[Shift-good wall supports.] For these supports one must use the full $O \( 1 \/ j \)$ activity norm;
    it is not a bulk remainder. The support is a macroscopic distance from the source.
    Subtracting a constant from the local lift, which has no effect after common-mean integration,
    gives scaled test norm at most $C_L p \/ D$ on its testing neighborhood.
    The source derivative bounds, with the reflection stencils at a free wall,
    give this estimate also for the derivatives required in that norm.
  Let $K$ be the corresponding ordinary wall activity and let $lambda$ be this constant-subtracted lift. The function
  $ f \( u \) = bb(E)_(* \, Q) K \( psi + u lambda \) $
  is even in $u$: the ordinary activity is even in the field and the Gaussian field,
    including its uniform constant, is invariant under sign reversal. Consequently $f' \( 0 \) = 0$.
    Taylor’s formula, the analytic derivative bound, and terminal regulator integration give
  $ \| f \( 1 \) - f \( 0 \) \| lt.eq frac(C_L p^2, D^2) thin 1 / j times upright("the summable support weight") . $
  Choose $c_2$ small enough that the translation stays inside the fixed analytic radius;
    the reserved regulators handle its real part. There are $O_L \( D \)$ wall anchors,
    with at most additional polynomial factors in $p$ from the collars.
    The weighted sum is therefore $O_L \( 1 \/ \( D j \) \)$.
    This estimate explains why a bound by the absolute wall activity norm would lose the required accuracy.
  #emph[Supports near the mark: deterministic translation.] For a support which is not shift-good and has $p lt.eq
    c_2 D$, the enlarged support lies in the interior of both squares.
    The magnetic activities copy a common pierced-plane activity after translation by $gamma_Q$,
    and the ordinary activities copy the ordinary-plane activity.
    The change $gamma_(L M) - gamma_M$, after subtraction of a constant,
    has local scaled test norm at most $C_L p \/ D$ by Equation (3.12).
    The first derivative estimate therefore bounds the effect of changing this deterministic translation by $C_L
    p \/ \( j D \)$ times a summable support weight. Such a support has only polynomially many possible anchor
    positions in $p$ near the mark. Its weighted sum is $O_L \( 1 \/ \( D j \) \)$.
  #emph[Supports near the mark: terminal covariance.] The preceding comparison must also change the terminal
    Gaussian law. We give this step explicitly. Average each activity over its common constant first,
    so the resulting function is invariant under addition of any constant to the field.
    Continue the polynomial covariance decomposition from scale $v$ to a fixed sufficiently small dyadic fraction
    $c_3 M$ of the smaller square. With $c_3$ and then $c_2$ chosen using the interior clearance,
    all these polynomial pieces agree on the enlarged support in the two squares, modulo common constants.
    This is the exact finite-range copying property, including polynomial continuation on the zero mode.
    Common constants are invisible to the mean-averaged activity.
  We can consequently realize the restrictions of the two fields as a common Gaussian part plus respective
    independent tails. Anchor each tail at a fixed point in the enlarged rectangle.
    The positive-order terminal covariance estimates at scale $c_3 M$ imply, for every fixed $r gt.eq 2$,
  #[#set math.equation(numbering: n => "(8.10)")
   $ parallel upright("anchored tail") #scale(x: 120%, y: 120%)[parallel]_(L^r \( upright("scaled test norm") \))
     lt.eq frac(C_(L \, r) "poly" \( p \), D) . $ <eq:terminal-tail>]
  For completeness, the difference estimates through order five bound the scaled differences of orders one and two
    in supremum on each $v$-block by the rescaled discrete Sobolev estimate used in the regulator proof.
    Summing the first differences along paths from the anchor bounds the field value itself.
    The enclosing rectangle has block dimensions $O_L \( 1 + p \)$,
    so these sums introduce only a polynomial factor in $p$. Gaussian moment estimates give the stated $L^r$
    bounds. The factor $v \/ M = D^(- 1)$ comes from the first positive-order tail estimate.
  Interpolate each tail separately to zero, keeping the common part fixed.
    The fundamental theorem of calculus and the first derivative activity bound reduce the difference of
    expectations to (8.10). Hölder’s inequality with a fixed terminal regulator reserve bounds the accompanying
    regulator. Along this interpolation the covariance on gradients is no larger than the original one,
    so the terminal integration estimate remains valid. The deterministic alignment translations cost only another
    exponential-in-$p$ factor. The local variational regulator agrees in the two squares by finite-range copying
    on the open testing support; all remaining exponential factors are absorbed by the reserved weights.
    Summing the $O \( 1 \/ j \)$ full activity norms, polynomially many anchors,
    and exponentially weighted shapes gives $O_L \( 1 \/ \( D j \) \)$.
  This compares covariances only through the small smooth tails that the activity can detect.
    No comparison of microscopic-dimensional Gaussian densities is needed.
    Combining the bulk, wall, and near-mark estimates proves (8.9). ◻
]

=== 8.4 The deterministic energy increment <the-deterministic-energy-increment>

We next compute the constant in the leading energy increment. Its normalization is important:
  the Laplacian here counts each undirected unit edge once.

#thm([Lemma 8.4.])[
  (Square Green-function increment).  #emph[Let $G_n$ be the Green function of the unscaled Laplacian killed on
    the boundary vertices of the spin square $Lambda_n$. For the connections in the dual squares of sides $M =
    2 n$ and $L M$, there is $c_4 > 0$ such that
#[#set math.equation(numbering: n => "(8.11)")
 $ E_(L M) - E_M = 2 pi log L + O_L \( n^(- c_4) \) . $ <eq:terminal-energy>]

]
] <lem:terminal-green>

#proof[
  The orthogonal energy minimization and crossing correspondence in Equation (2.18) give the exact identity
  #[#set math.equation(numbering: n => "(8.12)")
   $ E_M = \( 2 pi \)^2 G_n \( 0 \, 0 \) . $ <eq:terminal-green-energy>]
  We verify the accuracy needed for the Green increment:
  #[#set math.equation(numbering: n => "(8.13)")
   $ G_(L n) \( 0 \, 0 \) - G_n \( 0 \, 0 \) = frac(log L, 2 pi) +
     O_L \( n^(- c_4) \) . $ <eq:terminal-green-increment>]
  Write $M = 2 n$, fix a sufficiently small dyadic stop fraction $rho$, and use the low-pass multiplier
  $ q_t \( lambda \) = P_t \( 1 - lambda \/ 64 \) $
  from Equation (2.6), now applied to the killed Laplacian.
    Odd reflection gives the same binary decomposition and multiplier estimates in this geometry,
    as in #cite(label("B")) Lemmas 4.1 and 4.2. Let $d_t$ be the plane diagonal at the origin of the polynomial
    covariance $A^(- 1) \( q_t \( A \) - q_(2 t) \( A \) \)$, with polynomial continuation at zero,
    and let $T_Q$ be the smoothed terminal diagonal at the center of the square of side $Q$,
    stopped at scale $rho Q$. All preterminal pieces at the center are plane pieces by their finite range.
    Their common terms cancel exactly, giving
  #[#set math.equation(numbering: n => "(8.14)")
   $ G_(L n) \( 0 \, 0 \) - G_n \( 0 \, 0 \) = sum_(r = 0)^(log_2 L - 1) d_(2^r rho M) + T_(L M) -
     T_M . $ <eq:terminal-green-telescope>]
  The plane diagonal estimate for each of these $log_2 L$ terms is $log
    2 \/ \( 2 pi \)$ with an error bounded by a negative power of its scale.
    This is the continuum kernel estimate in #cite(label("B")) Lemma 8.1;
    the value of the limiting diagonal is the radial integral
  $ frac(1, 2 pi) integral_0^oo frac(P \( r \) - P \( 2 r \), r) thin d r = frac(log 2, 2 pi) \, $
  where $P$ is the continuum low-pass multiplier, $P \( 0 \) = 1$, and $P \( r \) arrow.r 0$ at infinity.
    Since their scales are comparable to $n$, their total contribution is $log L \/ \( 2 pi \) + O_L \( n^(- c) \)$.
  The two smoothed terminal diagonals have the same continuum limit, with power accuracy.
    We verify this stronger quantitative assertion directly. The eigenvalues of the killed square are
  $ lambda_(k \, M) = 4 sin^2 frac(pi k_1, 2 M) + 4 sin^2 frac(pi k_2, 2 M) \, wide 1 lt.eq k_1 \, k_2 lt.eq M - 1 . $
  The smoothed terminal diagonal at the center is consequently
  #[#set math.equation(numbering: n => "(8.15)")
   $ T_M = 4 / M^2 sum_(k_1 \, k_2 = 1)^(M - 1) sin^2 frac(pi k_1, 2) sin^2 frac(pi k_2, 2)
     frac(q_(rho M) \( lambda_(k \, M) \), lambda_(k \, M)) . $ <eq:terminal-sine-sum>]
  The elementary eigenvalue bounds and the multiplier estimate give
  $ M^2 lambda_(k \, M) gt.eq c \| k \|^2 \, wide \| q_(rho M) \( lambda_(k \, M) \) \| lt.eq
    C_rho min { 1 \, \| k \|^(- 2 p) } \, $
  where $p$ is the fixed power in the kernel construction. Thus the part of (8.15) with $\| k \| >
    B$ is bounded by $C_rho B^(- c)$ for some $c > 0$, uniformly in $M$.
  For $\| k \| lt.eq B$, one has $M^2 lambda_(k \, M) = pi^2 \| k \|^2 + O \( B^4 \/ M^2 \)$.
    In the sine formula for $q_(rho M)$, the rescaled numerator argument and denominator converge to their
    continuum values with errors bounded by a polynomial in $B$ times $M^(- 1)$.
    The ratio is interpreted continuously at zero. Its fixed power, the reciprocal eigenvalue,
    and the $O \( B^2 \)$ terms in the sum therefore have combined error at most $C_rho B^(C') \/
    M$ for a fixed $C' > 0$. This is a deliberately weaker bound than the eigenvalue Taylor error,
    and suffices here. The limiting sum depends on $rho$ but not on $M$.
    Taking $B = n^delta$ with a sufficiently small fixed $delta > 0$ makes both errors negative powers of $n$.
    The stop fractions are the same in the two squares, so their limiting terminal sums cancel.
    This proves (8.13). Multiplying it by $\( 2 pi \)^2$ in (8.12) proves (8.11). ◻
]

=== 8.5 A summable ratio and the full limit <a-summable-ratio-and-the-full-limit>

All quantities involving the microscopic magnetic core have now cancelled.
  The universal logarithmic correction comes from the running gradient coefficient in Lemma 25.

#thm([Proposition 8.5.])[
  (Summable enlargement ratio).  #emph[For $n_j = L^j \/ 2$, there exists $epsilon.alt > 0$ such that
#[#set math.equation(numbering: n => "(8.16)")
 $ log a_(n_(j + 1)) - log a_(n_j) = - frac(log L, 8) + frac(1, 16 j) +
   O_L \( j^(- 1 - epsilon.alt) \) . $ <eq:terminal-ratio>]

]
] <prop:ratio>

#proof[
  Subtract the two identities in Lemma 24. The common $log rho_j$ and $log sigma_j$ cancel exactly.
    Lemmas 23 and 25 give
  $ log a_(L n) - log a_n = - frac(1 - t_h, 2 alpha^2) \( E_(L M) - E_M \) +
    O_L (D^4 / j^2 + frac(1, D j) + e^(- c j)) . $
  Use $alpha^2 = 8 pi$ and Lemma 26 to obtain
  #[#set math.equation(numbering: n => "(8.17)")
   $ log a_(L n) - log a_n = - frac(log L, 8) + t_h frac(log L, 8) +
     O_L (D^4 / j^2 + frac(1, D j) + n^(- c_5)) $ <eq:terminal-ratio-before-flow>]
  for some $c_5 > 0$. Proposition 21 and (8.2) imply
  $ t_h = frac(1, 2 h log L) + O_L (frac(log h, h^2)) = frac(1, 2 j log L) + O_L (frac(log j, j^2)) . $
  Finally $D^4 \/ j^2 = O_L \( j^(- 8 \/ 5) \)$ and $1 \/ \( D j \) = O \( j^(- 11 \/ 10) \)$.
    Substitution in (8.17) proves (8.16), for example with any fixed $0 < epsilon.alt lt.eq 1 \/ 10$. ◻
]

#proof[
  For $n > 1$, define
  $ B \( n \) = log a_n + 1 / 8 log n - 1 / 16 log log n . $
  Because $log n_j = j log L - log 2$,
  $ log log n_(j + 1) - log log n_j = 1 / j + O_L \( j^(- 2) \) . $
  Proposition 27 therefore implies $B \( n_(j + 1) \) - B \( n_j \) = O_L \( j^(- 1 - epsilon.alt) \)$.
    The increments are absolutely summable. Each $B \( n_j \)$ is a finite real number by positivity of $a_(n_j)$,
    so there is a finite real limit $B_oo$ along this geometric sequence.
  It remains to remove the restriction on the side lengths.
    For an arbitrary integer $n$ tending to infinity, let $n_j$ be the preceding geometric size, so $n_j lt.eq
    n < n_(j + 1)$. From any sequence of such $n$, extract a subsequence on which $n \/ n_j arrow.r
    d in \[ 1 \, L \]$. Lemma 5 gives
  $ log a_n - log a_(n_j) arrow.r - 1 / 8 log d . $
  On this subsequence, $log n - log n_j arrow.r log d$ and $log log n - log log n_j arrow.r 0$.
    Hence $B \( n \) - B \( n_j \) arrow.r 0$. Every sequence admits such a subsequence,
    and the same argument applies to every subsequence; thus $B \( n \) arrow.r B_oo$ along all integers.
    Setting $A_(upright("XY")) = e^(B_oo)$ proves the claimed asymptotic.
    The finiteness of $B_oo$ gives both $A_(upright("XY")) > 0$ and $A_(upright("XY")) < oo$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
