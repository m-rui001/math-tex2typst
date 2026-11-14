#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[Tangent-flow-uniqueness-2026-09-24]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A tangent flow describes the geometry of a mean curvature flow at a singularity after magnifying space and time.
  Compactness produces such limits along subsequences; uniqueness asks whether every magnification sequence gives
  the same limiting motion, including its placement in the fixed ambient frame.
  We prove this uniqueness at the first singular time of every smooth closed embedded surface in three-dimensional
  Euclidean space.

Let $M_0 subset bb(R)^3$ be a smooth compact connected embedded surface without boundary,
  and let $\( M_t \)_(0 lt.eq t < T)$ be its maximal smooth mean curvature flow.
  The normal velocity is the trace mean curvature vector. For a singular point $\( x_0 \, T \)$ and a scale
  $lambda > 0$, define

#[#set math.equation(numbering: n => "(1.1)")
 $ M_s^lambda = lambda #scale(x: 120%, y: 120%)[\(] M_(T + lambda^(- 2) s) - x_0 #scale(x: 120%, y: 120%)[\)] \,
   wide s < 0 \, $ <intro:rescalings>]

whenever the original time belongs to $\[ 0 \, T \)$. Write $mu_s^lambda =
  cal(H)^2 #h(-0.16667em) corner.l.b M_s^lambda$ for its multiplicity-one area measure.
  The center $x_0$ and the ambient coordinates stay fixed throughout.

We use the following precise convention for the weak-flow consequence.
  A #emph[backward integral Brakke tangent] is a weakly measurable Radon family $\( mu_s \)_(s < 0)$ with the
  following properties. For almost every $s$, $mu_s$ is the weight of an integral $2$-varifold $V_s$ with
  measurable generalized mean curvature $upright(bold(H))_mu$ and first variation $delta V_s = -
  upright(bold(H))_mu mu_s$ on compactly supported vector fields.
  The family satisfies the local integrability and all-endpoint conditions (2.1)–(2.2), and some $lambda_i arrow.r
  oo$ gives local spacetime weight convergence

$ mu_s^(lambda_i) thin d s med harpoon.rt med mu_s thin d s quad upright("on ") bb(R)^3 times \( - oo \, 0 \) . $

The all-endpoint condition allows compact tests nonzero at either endpoint and requires the inequality for every
  time pair. This is the endpoint/test clause used in #cite(label("BK2024")) Section 2.1;
  the weak-flow framework is due to Brakke #cite(label("Brakke1978")).
  An extraction with locally weak slice-weight convergence for almost every time and uniform local mass bounds on
  compact time intervals implies the displayed premise. The area-ratio bounds here supply that domination.
  In particular, an extraction that also has local varifold convergence for almost every time,
  or has the stronger slice-weight convergence at every time,
  is included when its representative satisfies the all-endpoint condition.

#thm([Theorem 1.1.])[
  #emph[Let $M_0 subset bb(R)^3$ be a smooth compact connected embedded surface without boundary,
    and let $\( M_t \)_(0 lt.eq t < T)$ be its maximal smooth mean curvature flow.
    At every singular point $\( x_0 \, T \)$ at its first singular time there is a smooth properly embedded
    self-shrinker $S$ such that, as $lambda arrow.r oo$, the full family (1.1) converges locally smoothly in space
    and with multiplicity one to $sqrt(- s) thin S$, uniformly for $s$ in compact subintervals of
    $\( - oo \, 0 \)$. The convergence is in the original ambient coordinates,
    including the axes and position of the limit. Every backward integral Brakke tangent in the stated convention
    therefore equals the area-measure flow of $sqrt(- s) thin S$ at every negative time.]
] <thm:main>

There is no mean-convexity assumption and no prescribed tangent model.
  The entropy and genus bounds used in the proof are automatic for the compact initial surface.
  The theorem concerns a fixed center and the smooth evolution before the first singular time;
  moving-center rescalings and continuations through a singularity are different questions.

=== 1.1 Geometric background and preceding uniqueness results <geometric-background-and-preceding-uniqueness-results>

Huisken’s monotonicity formula identifies self-shrinking solutions as the natural models for parabolic blowups
  #cite(label("Huisken1990")). In the normalization used here, a self-shrinker $S$ satisfies $upright(bold(H)) +
  X^perp \/ 2 = 0$ and generates the motion $sqrt(- s) thin S$. It is a critical point of the Gaussian area

$ F \( S \) = integral_S e^(- \| X \|^2 \/ 4) thin d mu . $

Ilmanen’s work establishes smoothness of tangent supports at the first singular time of closed embedded surface
  flows in $bb(R)^3$ #cite(label("Ilmanen1995")) Theorems 1 and 2.
  Smooth support alone does not settle multiplicity or imply smooth convergence of the approximating flows.
  Lu Wang proved that each end of a noncompact properly embedded self-shrinker in $bb(R)^3$ of finite topology
  approaches a regular cone under dilations, smoothly on compact sets away from the vertex,
  or a round cylinder under translations, smoothly on compact sets #cite(label("Wang2016")) Theorem 1.1.
  The multiplicity-one theory of Bamler–Kleiner #cite(label("BK2024")),
  together with their tangent structure and end theorem, directly gives the geometric input used here:
  a smooth properly embedded tangent section with finitely many separated conical and round cylindrical ends.
  3 states that input and checks its vanishing-density-drop hypothesis.
  The passage to smooth local convergence uses the local Brakke-regularity consequence recorded by Schulze
  #cite(label("Schulze2014")) Lemma 2.1; see also White #cite(label("White2005")).

Several major classes of tangent models already have uniqueness theorems.
  Schulze treats a smooth compact embedded multiplicity-one shrinker,
  in arbitrary dimension and codimension #cite(label("Schulze2014")) Corollary 1.2.
  Colding–Minicozzi prove uniqueness for multiplicity-one round cylindrical hypersurface tangents,
  including their axes #cite(label("CM2015")) Theorem 0.2. Chodosh–Schulze establish uniqueness for
  multiplicity-one asymptotically conical hypersurface tangents #cite(label("CS2021")) Theorem 1.1.
  These conclusions determine the ambient placement of the limiting model,
  including its axis in the cylindrical case. In the same first-time surface setting,
  Bernstein–Wang also obtained a uniqueness statement modulo rotations for planar, spherical,
  and cylindrical models, allowing higher multiplicities #cite(label("BW2015")) Theorem 1.1.
  Recent alternative approaches in the cylindrical class include Ghosh’s comparison-flow method
  #cite(label("Ghosh2026")) Theorem 1.1 and Sections 4 and 6 and the quantitative PDE–ODI method of Bamler–Lai
  #cite(label("BamlerLai2026")) Corollary 5.97.

A shrinker with cylindrical ends need not have been identified as an exact round cylinder.
  The finite-end structure theorem therefore leaves a stationary analysis involving all its conical and
  cylindrical ends at once. This distinction is also visible in Haslhofer’s formulation of the cylinder-rigidity
  and tangent-uniqueness problems #cite(label("Haslhofer2025")) Section 5.1, Problem 5.1 and Conjecture 5.2.
  1 establishes the negative-time part of that fixed-center uniqueness assertion at the first singular time,
  without using cylinder rigidity.

=== 1.2 The stationary obstruction <the-stationary-obstruction>

Gradient inequalities connect small stationary defect to finite length of the rescaled flow.
  Simon developed this analytic convergence method for nonlinear geometric equations #cite(label("Simon1983"));
  its application to compact tangent flows is explicit in #cite(label("Schulze2014")) Section 3.
  The Gaussian compactness, finite-dimensional kernel augmentation,
  and analytic reduction used in this approach have close predecessors in Chodosh–Schulze #cite(label("CS2021"))
  Sections 3.4 and 4. For the present end geometry, the obstacle is a Jacobi field that grows quadratically along
  a cylindrical end. It changes the type of the end. Although Gaussian area is analytic on suitable spaces of
  decaying graphs, that fact does not establish analyticity in the opening directions.
  We instead retain finite Taylor jets.

The relevant scale is already visible in the circular comparison.
  If $beta < 0$ is its quadratic opening coefficient, then $R_c \( z \)^2 =
  2 \( 1 + beta z^2 \)$ reaches zero at $z = \( - beta \)^(- 1 \/ 2)$.
  The Gaussian factor there is $exp \( - 1 \/ \( 4 \| beta \| \) \)$.
  Thus the geometry changes by order one at a distance where the action records effects smaller than every power
  of the opening. The stationary argument compares those effects while keeping only finite Taylor information at
  each step.

Finite-order obstruction estimates have a close precedent in Zhu’s study of exact product shrinkers with a closed
  simply nonintegrable cross-section #cite(label("Zhu2024")) Section 1.3.
  His finite-dimensional model eliminates variables complementary to the kernel and derives a power bound from a
  uniform leading obstruction at finite order. For the exact products,
  the geometric argument establishes a second-order obstruction in the Jacobi directions complementary to
  rotations. The argument below obtains its required finite order by ruling out formal curves of critical points
  with nonzero openings and applying real-algebraic certificates.

We choose compactly supported linear observations of a graph and solve the stationary equation subject to their
  prescribed values. The constraints introduce finitely many multipliers supported on the observation core;
  outside that core the resulting surfaces are exact shrinkers. Their parameters split as $\( b \, x \)$.
  The analytic family at $x = 0$ preserves end types, while $x$ has one quadratic opening coordinate for each
  cylindrical end. Successive linear solves define a formal Gaussian action $cal(F) \( b \, x \)$ whose
  coefficients are analytic in $b$. A formal critical arc is a tuple of real formal power series
  $\( b \( s \) \, x \( s \) \)$, with zero constant terms,
  satisfying $nabla cal(F) \( b \( s \) \, x \( s \) \) = 0$ coefficient by coefficient.

The central stationary assertion is that every such arc has $x \( s \) equiv 0$.
  Otherwise, two normalized stationary surfaces can be constructed on complex contours passing on opposite sides
  of the zero radius of a circular comparison profile. These are complex coefficients on real spatial parameter
  domains; an arbitrary smooth graph is never continued to a complex spatial argument.
  The two actions have a common formal expansion with Gevrey bounds:
  factorial control of coefficients and of the remainder at every order.
  A finite-dimensional implicit replacement of the formal arc and a sector argument make the difference of each
  action from the base critical value, as well as its gradient,
  exponentially small at its own selected parameters. Taylor transport compares both actions at common parameters
  with a strict exponential margin.

The relation between Gevrey expansions and exponentially small sectorial differences is classical;
  Malgrange–Ramis describe the corresponding flatness and sectorial uniqueness principles #cite(label("MR1992"))
  Sections 1.3–1.6. Nonlinear Stokes theory for analytic ordinary differential equations provides a related
  asymptotic framework #cite(label("Costin1998")). Here the required estimates are proved for the stationary
  surface equations, including their compact constraints, prescribed contours, and endpoint errors.

The competing lower bound comes from the collapsing end. Height coordinates reduce its exterior limit to the
  radial translator equation. This is the same scalar equation whose real asymptotics are analyzed by
  Clutterbuck–Schnürer–Schulze #cite(label("CSS2007")) Section 2.
  We prove that its complex lateral solutions have a nonzero Stokes difference and compute the Gaussian action
  jump by boundary momentum. A second-order mean calculation determines the exponential phase to constant order.
  Distinct negative-power Laurent principal parts separate at a generic nearby angle;
  ends with the same entire principal part have positive limiting relative weights.
  Their contributions cannot cancel. This contradicts the action upper bound,
  including for even-order real arcs evaluated at complex parameters.

=== 1.3 Finite jets, localization, and convergence <finite-jets-localization-and-convergence>

The formal real Nullstellensatz, in the arc formulation of Aschenbrenner–Srhir #cite(label("AS2024"))
  Corollary 4.8, turns the exclusion of opening arcs into finite real-radical certificates for the gradient ideal.
  Artin’s approximation theorem #cite(label("Artin1968")) Theorem 1.2 converts the required finite quotients into
  analytic certificates. A single exponent then controls the openings by the gradient of every sufficiently high
  fixed truncation of $cal(F)$. We choose one such truncation and apply the ordinary finite-dimensional analytic
  gradient inequality #cite(label("Lojasiewicz1993")) Section IV.9;
  convergence of the full opening series is unnecessary.

A shifted Gaussian inverse compares a finite stationary Taylor graph with an actual flow slice.
  This comparison retains both the compact multiplier and the spatial cutoff,
  including when there are no opening variables. It yields a localized gradient inequality with the Gaussian tail
  measured at the scale of the gradient norm. Elliptic improvement,
  graphical pseudolocality #cite(label("INS2019")) Theorem 1.5,
  and positive-time graphical smoothing #cite(label("EckerHuisken1991")) propagate complete graphs with an
  increasing radius. Choosing each radius from all preceding energy drops makes the localization errors summable.
  Finite rescaled length then closes the compact-core bootstrap and gives convergence at every intermediate
  rescaled time in the original ambient frame.

=== 1.4 Organization <organization>

2 fixes the geometric inputs and normalization. 3 constructs the normalized family, its formal action,
  and the real finite-Taylor comparison from Gaussian and infinite-end estimates.
  4 introduces the lateral contours, proves the finite-path gauge and inverse estimates,
  and constructs the action arrays and their exponential upper bound.
  Section 5, Section 6 compute the nonzero jump, determine its phase, and exclude a critical opening arc.
  7 derives the finite-power inequality. 8 proves the localized gradient inequality,
  and 9 uses it to obtain finite rescaled length, full smooth convergence,
  and equality of every negative-time tangent measure.

== 2 Geometric input and normalization <sec:geometry>

We use established regularity and structure theorems for surface mean curvature flow in their stated scope.
  We record precisely the consequences required below.

The endpoint and test clause in the following lemma is the integrated one used in #cite(label("BK2024"))
  Section 2.1. We state separately the local integrability assumptions needed for compact tests.

#thm([Lemma 2.1.])[
  (Equality of all-endpoint Brakke representatives).  #emph[Let $I subset \( - oo \, 0 \)$ be an open interval,
    let $S$ be a smooth properly embedded self-shrinker without boundary, and put $nu_s =
    cal(H)^2 #h(-0.16667em) corner.l.b \( sqrt(- s) thin S \)$.
    Let $\( mu_s \)_(s in I)$ be a weakly measurable family of Radon measures.
    Suppose that for almost every $s$, $mu_s$ is the weight of a rectifiable $2$-varifold $V_s$ with measurable
    generalized mean curvature $upright(bold(H))_mu$ and first variation $delta V_s = -
    upright(bold(H))_mu mu_s$ on compactly supported vector fields.
    Suppose also that for every compact $K subset bb(R)^3$ and compact interval $J subset.double I$,
#[#set math.equation(numbering: n => "(2.1)")
 $ integral_J #h(-0.16667em) integral_K \( 1 + \| upright(bold(H))_mu \|^2 \) thin d mu_s thin d s < oo .
   $ <geo:representative-integrability>]

 Assume that for every $a < b$ in $I$ and every nonnegative $phi in C_c^1 \( bb(R)^3 times \[ a \, b \] \)$,
#[#set math.equation(numbering: n => "(2.2)")
 $ mu_b \( phi \( dot.op \, b \) \) - mu_a \( phi \( dot.op \, a \) \)\
lt.eq integral_a^b #h(-0.16667em) integral #scale(x: 120%, y: 120%)[\(] partial_s phi +
  nabla phi dot.op upright(bold(H))_mu - phi \| upright(bold(H))_mu \|^2 #scale(x: 120%, y: 120%)[\)] thin d mu_s
  thin d s . $ <geo:all-endpoint-brakke>]

 The test is defined on the closed slab and may be nonzero at its temporal endpoints,
   and $partial_s$ is taken at fixed ambient position. Both $a$ and $b$ are arbitrary,
   including exceptional times. If $mu_s = nu_s$ as Radon measures for almost every $s in I$, then $mu_s =
   nu_s$ for every $s in I$.]
] <geo:representative>

#proof[
  The local mass and curvature bounds in (2.1) make every compact-test integrand in (2.2) locally integrable;
    the mixed term follows by Cauchy–Schwarz. The smooth reference has the analogous local bounds and the
    compact-test transport identity. Indeed, if $J subset.double \( - oo \, 0 \)$ is a compact interval and a
    compact spatial set lies in $B_R$, the preimage of its spacetime track under $\( p \, s \)
    mapsto \( sqrt(- s) thin p \, s \)$ lies in
  $ #scale(x: 120%, y: 120%)[\(] S ∩ overline(B)_(R \/ min_(s in J) sqrt(- s)) #scale(x: 120%, y: 120%)[\)] times J . $
  This set is compact by properness of $S$. Smoothness on that compact set bounds the local area and curvature
    integrals and justifies the usual transport formula for compact tests on $J$.
    No finite global unweighted area or global integrability of $upright(bold(H))$ is required.
  At almost every time where $mu_s = nu_s$, their associated rectifiable varifolds also agree:
    a rectifiable weight determines its approximate tangent plane almost everywhere.
    Their first variations, and hence their generalized mean curvature densities, agree at those times.
    Write $upright(bold(H))_nu$ for the mean curvature vector of the smooth surface $sqrt(- s) thin S$.
    Fix a nonnegative $phi.alt in C_c^2 \( bb(R)^3 \)$ and write
  $ beta_phi.alt \( s \) = integral #scale(x: 120%, y: 120%)[\(] nabla phi.alt dot.op upright(bold(H))_nu -
    phi.alt \| upright(bold(H))_nu \|^2 #scale(x: 120%, y: 120%)[\)] thin d nu_s . $
  The preceding local transport identity gives, for every $a < b$ in $I$,
  $ nu_b \( phi.alt \) - nu_a \( phi.alt \) = integral_a^b beta_phi.alt \( s \) thin d s . $
  Apply (2.2) to the time-independent test $phi \( X \, s \) = phi.alt \( X \)$.
    Its integrand equals $beta_phi.alt$ almost everywhere, so
  $ mu_b \( phi.alt \) - mu_a \( phi.alt \) lt.eq nu_b \( phi.alt \) - nu_a \( phi.alt \) wide \( a < b \) . $
  Thus $h_phi.alt \( s \) = mu_s \( phi.alt \) - nu_s \( phi.alt \)$ is a finite nonincreasing function and
    vanishes almost everywhere. For any $s in I$, choose times $a < s <
    b$ in the full-measure set where $h_phi.alt = 0$. Then
  $ 0 = h_phi.alt \( a \) gt.eq h_phi.alt \( s \) gt.eq h_phi.alt \( b \) = 0 . $
  Nonnegative smooth compact tests determine Radon measures, proving the assertion.
    The two-sided choice of good times is why the lemma asserts equality at interior times;
    every $s < 0$ is interior when $I = \( - oo \, 0 \)$. ◻
]

#thm([Proposition 2.2.])[
  (Tangent section and ends).  #emph[A backward tangent flow of the flow in 1 has multiplicity one and is the
    homothetic motion $sqrt(- s) thin S$, $s < 0$, of a smooth properly embedded self-shrinking surface.
    Its time slices have uniform quadratic local area bounds.
    The surface $S$ has bounded geometry and finite genus. Outside a compact set it is the disjoint union of
    finitely many ends, each either smoothly asymptotic to a regular cone under dilations or a cylindrical tail
    whose translates centered at points receding outward along a ray from the origin converge smoothly on compact
    sets to the full round cylinder of radius $sqrt(2)$. The corresponding links and cylindrical directions are
    separated on the unit sphere.]
] <geo:tangent>

#proof[
  The smooth flow with compact slices lies in the almost-regular-flow framework of Bamler–Kleiner by their
    Theorem 1.1. It is bounded in their terminology, and their Theorems 1.2 and 1.7(b) give the applicable
    multiplicity-one and compactness statements, including tangents at the finite endpoint of the smooth time
    interval #cite(label("BK2024")). We use the v3 formulations.
    Fix the scales extracting a tangent in the convention of 1.
    On every fixed interval $\( a \, b \) subset.double \( - oo \, 0 \)$ these rescalings have uniform entropy and
    genus bounds. Apply Theorem 1.7(b) first to extract, on a subsequence, an associated almost-regular limit.
    The Gaussian density drop between the endpoints tends to zero,
    since both endpoint densities tend by monotonicity to the same density at $\( x_0 \, T \)$.
    Lemma 2.13(b) of #cite(label("BK2024")), including its genus conclusion in equation (2.16),
    therefore characterizes the weights of that limit as those of a smooth properly embedded homothetic shrinker
    of finite genus on the interval; Theorem 1.2 supplies multiplicity one.
    By Theorem 1.7(b), this same subsequence converges locally smoothly at every regular time of its associated
    almost-regular limit. Those times have full measure by Definition 2.6(1),
    and Lemma 2.7 identifies the associated slice weights with the areas of their regular surfaces.
    Hence the slice weights converge locally weakly for almost every time.
    The uniform local area bounds and dominated convergence give the local spacetime weight of this smooth
    homothetic flow. The original extracted scales already have the spacetime weight of the specified tangent.
    Uniqueness of the local weak Radon limit identifies those spacetime measures.
    Testing by a countable determining family of smooth compact spatial functions times arbitrary compact time
    functions then identifies the slice weights for almost every time.
    Lemma 2 gives equality at every interior time of the interval.
    The homothetic descriptions therefore agree on overlapping intervals and assemble to the asserted motion on
    all $s < 0$. Applying the same compactness and density-drop argument to any scale sequence on an exhaustion of
    $\( - oo \, 0 \)$, taking a diagonal subsequence, and using the resulting smooth homothetic flow as its
    representative, also shows that the tangent class in the stated convention is nonempty:
    smoothness supplies its local curvature and all-endpoint transport conditions,
    and the preceding convergence gives its spacetime weight.
    Their Theorem 1.10 gives the finite conical/cylindrical end decomposition.
    Huisken’s monotonicity formula supplies quadratic area ratios from the finite entropy of the compact initial
    surface #cite(label("Huisken1990")); the density monotonicity statement is also recorded in
    #cite(label("White2005")) Section 2.9. Bounded geometry on fixed spatial scales follows from the smooth plane
    or cylinder limits at points escaping to infinity in the proof of the end theorem #cite(label("BK2024"))
    Claim 7.6, together with the smooth compact core. The higher end estimates in logarithmic coordinates used
    below will be derived from the stationary equation. ◻
]

Lu Wang’s end theorem gives the conical/cylindrical alternative for noncompact properly embedded self-shrinkers in
  $bb(R)^3$ of finite topology #cite(label("Wang2016")) Theorem 1.1.
  Here the Bamler–Kleiner theorem in 3 supplies the end decomposition directly for the tangent class;
  finite genus alone would not imply Wang’s finite-topology hypothesis.
  We use neither a rigidity theorem for an arbitrary shrinker with a cylindrical end nor the tangent-flow
  uniqueness that is to be proved.

Translate $\( x_0 \, T \)$ to $\( 0 \, 0 \)$ and write the original flow on $t < 0$. Its rescaled form is

#[#set math.equation(numbering: n => "(2.3)")
 $ M \( tau \) = e^(tau \/ 2) M_(- e^(- tau)) . $ <geo:rescaled>]

We omit the inessential constant prefactor in the Gaussian area and put

#[#set math.equation(numbering: n => "(2.4)")
 $ F \( M \) = integral_M e^(- \| X \|^2 \/ 4) thin upright(d) mu \, wide Phi = upright(bold(H)) + 1 / 2 X^perp \,
   wide d \( tau \)^2 = integral_(M \( tau \)) \| Phi \|^2 e^(- \| X \|^2 \/ 4) thin upright(d) mu . $ <geo:action>]

Then $- partial_tau F \( M \( tau \) \) = d \( tau \)^2$. Fix one tangent section $S$ from 3.
  Along a corresponding subsequence, convergence is smooth on compact subsets in the interior of negative time.
  Indeed, the approximating smooth integral Brakke flows have bounded area ratios and converge locally in measure
  to a smooth multiplicity-one flow, so the local Brakke-regularity consequence recorded in
  #cite(label("Schulze2014")) Lemma 2.1 applies after shrinking each compact spacetime cylinder;
  see also #cite(label("White2005")). Quadratic area bounds make Gaussian tails uniformly small, so

#[#set math.equation(numbering: n => "(2.5)")
 $ cal(E) \( tau \) = F \( M \( tau \) \) - F \( S \) arrow.br 0 . $ <geo:energy>]

The letter $E$ below is reserved for the small coefficient of radial diffusion,
  and is distinct from the energy $cal(E)$.

For complex stationary graphs, $X^2$ means the complex bilinear product $X dot.op X$, without conjugation.
  Metric inverses, curvature, and area elements are complexified in the same way.
  Branches are continued from the positive real area element.
  The independent spatial parameters remain real; no holomorphic continuation of an arbitrary smooth spatial graph
  is assumed. The compact observations used in the normalized stationary equation are kept in fixed real graph charts.

All constants associated with one fixed end list, a fixed angular regularity order,
  or a fixed contour-size parameter may depend on those choices.
  Constants asserted uniform in an opening scale do not. A small loss in a spatial radius may be divided among
  finitely many cutoffs; this convention will always be used after the relevant exponents have been fixed.

== 3 A normalized family and its formal Gaussian action <sec:linear>

The stationary argument begins with a family that preserves the types of all ends.
  Compact observations make its Gaussian linearization invertible,
  while separate infinite-end estimates identify the allowed cylindrical and conical behavior.
  The resulting analytic family is the base for successive polynomial opening jets and their formal Gaussian
  action. This section constructs that family and the finite real comparison used later.
  The additional estimates on finite complex contours are developed with the lateral actions in 4.

Gaussian Fredholm theory and finite-dimensional analytic reduction have precedents in #cite(label("CS2021"))
  Sections 3.4 and 4. The end estimates here also accommodate cylindrical opening jets,
  whose coefficients need not form a convergent series.

Throughout this section, $S$ is a smooth properly embedded shrinker with finitely many smooth conical and round
  cylindrical ends. The cylindrical radius is $sqrt(2)$. The end structure gives bounded curvature,
  bounded $X^perp$, bounded geometry, and polynomial area growth.
  Constants may depend on $S$, on a fixed finite number of derivatives of its end charts,
  and on the fixed angular differentiability order. They do not depend on the length of an exhausted end.
  Dependence on other parameters will be specified explicitly.

Put $rho_G = exp \( - \| X \|^2 \/ 4 \)$, $d gamma = rho_G thin d A_S$, and

$ L = Delta_S - 1 / 2 X^top dot.op nabla_S + 1 / 2 + \| upright("II") \|^2 . $

All complexifications below are bilinear complexifications of the real geometric formulas.
  Hermitian products are used only in estimates. An observation means a real continuous linear functional $P_i u =
  chevron.l u \, chi_i chevron.r_(L_G^2)$ with $chi_i in C_c^oo \( S \)$.
  The observations are defined in fixed graph coordinates on their common compact support.

=== 3.1 The Gaussian domain and compact observations <the-gaussian-domain-and-compact-observations>

#thm([Lemma 3.1.])[
  (Gaussian realization).  #emph[Let $H_G^2$ be the completion of $C_c^oo \( S \)$ for
$ parallel u parallel_(H_G^2) = sum_(i = 0)^2 parallel nabla^i u parallel_(L_G^2) . $

 The self-adjoint realization of $L$ has domain $H_G^2$, compact resolvent, and
#[#set math.equation(numbering: n => "(3.1)")
 $ parallel u parallel_(H_G^2) + parallel \| X \| nabla u parallel_(L_G^2) +
   parallel \| X \|^2 u parallel_(L_G^2) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel L u parallel_(L_G^2) +
   parallel u parallel_(L_G^2) #scale(x: 120%, y: 120%)[\)] . $ <lin:gaussian-estimate>]

 In particular its kernel $K$ is finite dimensional and consists of smooth functions.]
] <lin:gaussian>

#proof[
  The shrinker identities imply $"div"_S X^top = 2 - \| X^perp \|^2 \/ 2$.
    Weighted integration of $"div"_G \( u^2 X^top \)$ therefore gives
  $ 1 / 2 integral_S \| X \|^2 u^2 thin d gamma = 2 integral_S u^2 thin d gamma +
    2 integral_S u X^top dot.op nabla u thin d gamma . $
  Cauchy’s inequality proves $parallel \| X \| u parallel_G lt.eq
    C \( parallel nabla u parallel_G + parallel u parallel_G \)$.
    The same calculation applied to the norm squared of $nabla u$ gives $parallel \| X \| nabla u parallel_G lt.eq
    C \( parallel nabla^2 u parallel_G + parallel nabla u parallel_G \)$.
    Applying the first inequality to $\( 1 + \| X \|^2 \)^(1 \/ 2) u$ then controls $\| X \|^2 u$.
    These calculations initially use compact supports, and pass to the completion.
  For completeness the domain can also be read from an ordinary Schrödinger operator.
    The unitary map $U u = rho_G^(1 \/ 2) u$ satisfies
  #[#set math.equation(numbering: n => "(3.2)")
   $ - U L U^(- 1) = - Delta_S + frac(\| X \|^2, 16) + frac(\| X^perp \|^2, 16) -
     1 - \| upright("II") \|^2 . $ <lin:half-density>]
  Indeed, for $phi.alt = \| X \|^2 \/ 4$ one has $nabla phi.alt = X^top \/ 2$ and $Delta phi.alt =
    1 - \| X^perp \|^2 \/ 4$. The last three terms in (3.2) are bounded.
    If $q = \| X \|^2 \/ 16$, direct integration by parts yields
  $ parallel \( - Delta + q \) w parallel_2^2 = parallel Delta w parallel_2^2 + parallel q w parallel_2^2 +
    2 integral q \| nabla w \|^2 - integral \( Delta q \) \| w \|^2 . $
  Here $Delta q$ is bounded. The Bochner identity and bounded Ricci curvature control $nabla^2 w$ by $Delta
    w$ and lower derivatives. It follows that the closed form realization has domain
  $ { w : nabla^2 w \, med \| X \| nabla w \, med \| X \|^2 w \, w in L^2 \( S \) } \, $
  with equivalent graph norm. Cutoffs and local elliptic regularity show that compactly supported smooth functions
    are a core. Conjugating back, and using the moment estimates just proved,
    identifies this domain with the derivative-defined $H_G^2$ and proves (3.1).
    Finally $q arrow.r oo$ on every end. The $parallel q w parallel_2$ bound makes the $L^2$ tails uniformly
    small, and Rellich compactness on compact subsets gives compactness of the domain inclusion. ◻
]

#thm([Lemma 3.2.])[
  (Symmetric enlargement).  #emph[There is a finite list of compact observations for which
#[#set math.equation(numbering: n => "(3.3)")
 $ cal(A) \( u \, lambda \) = #scale(x: 120%, y: 120%)[\(] L u + P^(*) lambda \,
   P u #scale(x: 120%, y: 120%)[\)] : H_G^2 xor bb(R)^m arrow.r L_G^2 xor bb(R)^m $ <lin:augmented>]

 is an isomorphism. Moreover, let $u_1 \, dots.h \, u_a in H_G^2$ have smooth compactly supported $L u_j$.
   The list can be enlarged while preserving this isomorphism so that each $u_j$ occurs among the derivatives of
   the normalized homogeneous solution family $L u + P^(*) lambda = 0$ obtained by varying $P u$.]
] <lin:observations>

#proof[
  Choose $k = dim K$ compact smooth functions $chi_i$ whose pairings with a basis of $K$ form a nonsingular
    matrix. For this initial list, projection of the first equation of (3.3) onto $K$ determines $lambda$.
    Inversion of $L$ on $K^perp$ determines the component of $u$ in $K^perp$, and $P u$ determines its component in $K$.
  Let $G = \( L \|_(K^perp) \)^(- 1)$ and $cal(V) = C_c^oo \( S \) ∩ K^perp$. This space is dense in $K^perp$:
    approximate by compact functions and remove their finitely many kernel pairings using the initial $chi_i$.
    The symmetric form
  $ Q \( f \, g \) = chevron.l G f \, g chevron.r_G \, wide f \, g in cal(V) \, $
  is nondegenerate. If $Q \( f \, g \) = 0$ for all $g in cal(V)$, density gives $G f = 0$ and hence $f = 0$.
    The sources $q_j = L u_j$ lie in $cal(V)$, by self-adjointness.
  Every finite subspace $V subset cal(V)$ has a finite nondegenerate enlargement for $Q$.
    To see this, split off a nondegenerate part of $V$ and let $r_1 \, dots.h \, r_s$ span its radical.
    Nondegeneracy on $cal(V)$ supplies vectors $w_i$ with $Q \( r_i \, w_j \) = delta_(i j)$.
    Subtract their projections to the already nondegenerate part.
    On $"span" \( r_i \, w_i \)$ the matrix is $mat(delim: "(", 0, I; I, C)$ and is invertible.
    Apply this construction to the span of the $q_j$ and add the resulting compact functions as observation duals.
  For the enlarged homogeneous block, kernel projection first forces the original $k$ multipliers to vanish.
    Its other multipliers vanish by the nondegeneracy of $Q$ on the added space;
    the original observations then kill the remaining kernel component of $u$.
    The same decomposition solves the inhomogeneous equations and proves bijectivity.
    Finally $L u_j = q_j in "range" P^(*)$, so $u_j$ is the normalized solution associated with the observation
    value $P u_j$ and a suitable multiplier vector. No positivity of $Q$ is required. ◻
]

We use the sign convention in which a normalized stationary graph satisfies

#[#set math.equation(numbering: n => "(3.4)")
 $ Phi \( u \) + sum_i lambda_i chi_i \( u \) = 0 \, wide P \( u \) = q . $ <lin:normalized-equation>]

Here the compact functions $chi_i \( u \)$ include the smooth density and normal-velocity factors converting the
  fixed observation into its variational dual. The equation is written in scalar normal-velocity units,
  identifying $Phi$ with its component in the chosen normal direction.
  Thus $d F \( u \) \[ v \] = sum_i lambda_i thin d P_i \( u \) \[ v \]$ on a normalized solution.
  At $\( u \, lambda \) = \( 0 \, 0 \)$ the derivative of (3.4) is (3.3).
  Exterior scalar variables and drift normalizations below also identify the range:
  whenever an equation is multiplied by a nonsingular scalar factor, its source is multiplied by the same factor.
  These are compatible local descriptions of the geometric normalized block,
  not an alteration of its compact variational normalization.

=== 3.2 Cylindrical strip estimates, traces, and separated rates <cylindrical-strip-estimates-traces-and-separated-rates>

On a round end write $z = e^t$, $mu = e^(- t)$, and use the radius $R \( t \, theta \)$ as graph variable.
  The curvature numerator in these coordinates is

$ g^(z z) R_(z z) + 2 g^(z theta) \( R_(z theta) - R_z R_theta \/ R \) +
  g^(theta theta) \( R_(theta theta) - R - 2 R_theta^2 \/ R \) \, wide g = "diag" \( 1 \, R^2 \) + d R ⊗ d R . $

The support-function term is $\( R - z R_z \) \/ 2$. At $R = sqrt(2)$,
  minus twice the linearized radial graph velocity is the drift-normalized operator

#[#set math.equation(numbering: n => "(3.5)")
 $ cal(L)_(upright("cyl")) v = v_t - 2 mu^2 \( v_(t t) - v_t \) - v_(theta theta) - 2 v . $ <lin:cylinder-operator>]

In particular the limiting slow rates are $sigma_j = 2 - j^2$, $j in bb(Z)$.
  In circular data the equation with the axial diffusion omitted is $R_t - R + 2 \/ R = 0$,
  and the angular diffusion coefficient is $2 \/ R^2$.

Fix an integer $h gt.eq 4$. On a unit strip $I times S^1$,
  with the diffusion scale $E \( t \)$ comparable to $E_I in \( 0 \, E_(*) \]$, define

#[#set math.equation(numbering: n => "(3.6)")
 $ N_(E_I \, h) \( v \; I \)^2 =  & parallel v parallel_(L^2 H^h)^2 + parallel v_t parallel_(L^2 H^h)^2 +
   parallel v_(theta theta) parallel_(L^2 H^h)^2\
 & + E_I^2 parallel v_(t t) parallel_(L^2 H^h)^2 + E_I parallel v_(t theta) parallel_(L^2 H^h)^2 . $ <lin:strip-norm>]

Second derivatives in this definition are bulk $L^2$ quantities.
  The traces used below are traces of the function and its first derivatives, and do not include a trace of $v_(t t)$.

#thm([Lemma 3.3.])[
  (Strip and boundary estimates).  #emph[Consider
#[#set math.equation(numbering: n => "(3.7)")
 $ cal(L) v = v_t - a \( t \) v_(t t) - 2 b \( t \) v_(t theta) - c \( t \) v_(theta theta) + d_1 \( t \) v_t +
   d_2 \( t \) v_theta + d_0 \( t \) v $ <lin:admissible-operator>]

 on an interval of real $t$ coordinates. Suppose
$ "Re" a gt.eq c_(*) E \, quad \| a \| lt.eq C_(*) E \, quad "Re" c gt.eq c_(*) \, quad \| c \| lt.eq C_(*) \,
  quad \| b \| lt.eq epsilon_(*) sqrt(E) \, $

 the normalized derivatives of these coefficients are bounded, $\| d_1 \| lt.eq C_(*) E$, and $d_0 \,
   d_2$ and their required derivatives are bounded. The leading coefficients are independent of $theta$.
   Sufficiently small operator-norm perturbations from the strip domain to $L_t^2 H_theta^h$ are allowed.
   The constants below depend only on these bounds and a fixed strict accretivity margin.]
  #emph[There is a patch estimate
#[#set math.equation(numbering: n => "(3.8)")
 $ N_(E_I \, h) \( v \; I \) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel cal(L) v
   parallel_(L^2 \( I^(+) \; H^h \)) + parallel v parallel_(L^2 \( I^(+) \; H^h \))
   #scale(x: 120%, y: 120%)[\)] \, $ <lin:patch>]

 where $I^(+)$ is a fixed enlargement. The corresponding boundary estimate holds with homogeneous entrance
   Dirichlet or outgoing derivative data. Moreover
#[#set math.equation(numbering: n => "(3.9)")
 $ sup_(t in I) #scale(x: 120%, y: 120%)[\(] parallel v \( t \) parallel_(H^h) +
   parallel v_theta \( t \) parallel_(H^h) + sqrt(E_I) parallel v_t \( t \) parallel_(H^h)
   #scale(x: 120%, y: 120%)[\)] lt.eq C N_(E_I \, h) \( v \; I^(+) \) . $ <lin:first-traces>]

 For inhomogeneous boundary data one can use the spaces
#[#set math.equation(numbering: n => "(3.10)")
 $ parallel phi parallel_(cal(T)_(E \, h)^D)^2 & =
   sum_(j in bb(Z)) \( 1 + j^2 \)^h \( 1 + j^2 \) \( 1 + sqrt(E) \| j \| \) \| phi_j \|^2 \,\
parallel psi parallel_(cal(T)_(E \, h)^N)^2 & = E sum_(j in bb(Z)) \( 1 + j^2 \)^h \( 1 + sqrt(E) \| j \| \) \|
  psi_j \|^2 . $ <lin:dirichlet-trace>]

 They are bounded by the bulk norm for $phi = v \|_(partial I)$ and $psi = v_t \|_(partial I)$.
   In particular an outgoing derivative lift has norm at most $C sqrt(E) parallel psi parallel_(H^(h + 1))$.]
] <lin:strip>

#proof[
  Freeze $a \, c$ and first omit the small mixed coefficient.
    For real $xi$ and integer $j$, accretivity and then the imaginary part give
  #[#set math.equation(numbering: n => "(3.11)")
   $ 1 + \| i xi + a xi^2 + c j^2 \| gt.eq c #scale(x: 120%, y: 120%)[\(] 1 + \| xi \| + E xi^2 + j^2 +
     sqrt(E) \| j xi \| #scale(x: 120%, y: 120%)[\)] . $ <lin:symbol>]
  Indeed the real part controls $E xi^2 + j^2$, their imaginary parts have size at most a constant times that
    quantity, and $2 sqrt(E) \| j xi \| lt.eq E xi^2 + j^2$. The mixed term is absorbed by choosing $epsilon_(*)$
    small. Fourier transformation in $t$ and Fourier series in $theta$ give the interior estimate.
    The bounded normalized derivatives allow freezing on intervals of fixed sufficiently small length.
    Commutators with a cutoff contain $a chi' v_t$ and $\( chi' - a chi'' \) v$,
    so interpolation absorbs the derivative term and leaves precisely the lower norm in (3.8).
  For the boundary estimate add a fixed positive zeroth-order shift $K$. The characteristic roots satisfy
  $ a lambda^2 - lambda - c j^2 - K = 0 . $
  There is one root in each open half-plane, and, with labels $+$ and $-$,
  #[#set math.equation(numbering: n => "(3.12)")
   $ "Re" lambda_(+) asymp \| lambda_(+) \| & asymp E^(- 1) \( 1 + sqrt(E) \| j \| \) \,\
- "Re" lambda_(-) asymp \| lambda_(-) \| & asymp frac(1 + j^2, 1 + sqrt(E) \| j \|) . $ <lin:roots>]
  To verify the half-plane assertion, an imaginary root would make the real part of the equation equal to $-
    "Re" a thin xi^2 - "Re" c thin j^2 - K < 0$. Continue from positive real coefficients.
    For $sqrt(E) \| j \|$ small the roots have the two asserted scales by the quadratic formula;
    for this quantity large they are asymptotic to $plus.minus j sqrt(c \/ a)$,
    whose real parts have a uniform angle margin. The intervening scaled compact set,
    together with the preceding exclusion of imaginary roots, gives uniform constants.
    These arguments also cover the bounded transition between the two scales.
  At an entrance the correction to a whole-line particular solution is $phi_j e^(lambda_(-) t)$.
    At an exit, written as $t = 0$ with $t < 0$ inside, the derivative lift is $psi_j lambda_(+)^(- 1)
    e^(lambda_(+) t)$. Integrating their five squared norms in (3.6) gives, respectively, (3.10) and (3.10),
    up to uniform constants. This constructs the boundary parametrices.
    Freezing and absorption as above give the variable-coefficient boundary estimate;
    removing $K$ only restores the lower norm in (3.8).
  The simpler traces follow by product integration, in particular from
  $ partial_t parallel v_theta parallel_(H^h)^2 = - 2 "Re" chevron.l v_t \, v_(theta theta) chevron.r_(H^h) \,
    wide partial_t parallel v_t parallel_(H^h)^2 = 2 "Re" chevron.l v_(t t) \, v_t chevron.r_(H^h) . $
  For the stronger Dirichlet trace apply the same argument in each mode also to $sqrt(E) \| j \|^3 \| v_j \|^2$;
    its derivative is bounded by a constant times $\| j^2 v_j \| thin \| sqrt(E) j v_(t \, j) \|$.
    For the Neumann trace set $w = v_(t \, j)$ and apply the one-dimensional trace inequality on length $ell =
    E \( 1 + E j^2 \)^(- 1 \/ 2)$. Multiplication by $E sqrt(1 + E j^2)$ bounds its right hand side by
  $ C #scale(x: 120%, y: 120%)[\(] \( 1 + E j^2 \) parallel v_(t \, j) parallel_2^2 +
    E^2 parallel v_(t t \, j) parallel_2^2 #scale(x: 120%, y: 120%)[\)] . $
  Summing proves the assertions. Thus the additional angular regularity in a convenient smooth-data lift is
    imposed on prescribed data, not lost from the unknown. A derivative trace supplied by another solution already
    belongs to the natural space (3.10). ◻
]

For a positive weight $rho$ with bounded logarithmic derivatives, set

#[#set math.equation(numbering: n => "(3.13)")
 $ parallel v parallel_(X_(rho \, h)) = sup_nu rho \( t_nu \)^(- 1) N_(E_nu \, h) \( v \; I_nu \) \, wide
   parallel f parallel_(Y_(rho \, h)) = sup_nu rho \( t_nu \)^(- 1) parallel f parallel_(L^2 \( I_nu \; H^h \)) .
   $ <lin:weighted-strip>]

The intervals have length one and uniformly bounded overlap.
  Equivalently one can put $rho^(- 1) v$ inside $N_(E_nu \, h)$.
  If $\( log rho \)' = d$ is a sufficiently large fixed positive number and $E_(*) d$ is sufficiently small,
  the entrance Dirichlet/outgoing derivative problem satisfies

#[#set math.equation(numbering: n => "(3.14)")
 $ parallel v parallel_(X_(rho \, h)) lt.eq
   C
   (parallel v \( t_0 \) parallel_(cal(T)_(E \( t_0 \) \, h)^D) + parallel cal(L) v parallel_(Y_(rho \, h)) +
   rho \( T \)^(- 1) parallel v_t \( T \) parallel_(cal(T)_(E \( T \) \, h)^N)) \, $ <lin:forward>]

where $rho \( t_0 \) = 1$ and the constant is independent of $T$.
  Here and below the logarithmic rate must exceed the needed propagation rate by a fixed positive buffer.

To prove (3.14), put $v = rho w$. For constant rate $d$ the new mass is $d - a d^2 + d_0 + d d_1$.
  Integration against $macron(w)$ controls $E \| w_t \|^2 + \| w_theta \|^2 +
  d \| w \|^2$ if $d$ exceeds the bounded lower terms and $E_(*) d$ is small.
  Imaginary drift terms cost $epsilon E \| w_t \|^2 + C_epsilon E d^2 \| w \|^2$;
  the small mixed term has the same bound with an additional small angular energy term.
  Normalized coefficient derivatives cost only absorbable derivative energies and bounded multiples of $\|
  w \|^2$. For the boundary, the condition is $w_t + d w = 0$ at $T$.
  The principal terminal radial and drift contributions sum to

$ d "Re" a thin \| w \( T \) \|^2 + 1 / 2 \( 1 - 2 d "Re" a \) \| w \( T \) \|^2 = 1 / 2 \| w \( T \) \|^2 . $

The $d_1$ term adds $1 / 2 "Re" d_1 \( T \) \| w \( T \) \|^2$,
  which preserves this favorable sign for sufficiently small $E_(*)$. Entrance Dirichlet data are first lifted.
  Combining this coercive estimate with Lemma 6 controls the complete bulk norm.
  For the uniformly local version center at any strip and insert an additional smooth weight comparable to
  $exp \( - epsilon.alt \| t - t_nu \| \)$. Its derivatives use less than the strict rate buffer.
  The squared source integrals are bounded by $sum_k e^(- c epsilon.alt \| k - nu \|) parallel f \/ rho
  parallel_(L^2 \( I_k \; H^h \))^2$. The geometric sum is independent of $T$.
  This proves (3.14) without a factor depending on the number of strips.
  Smooth bounded interpolations between two admissible fixed rates add $- a \( log rho \)''$,
  which is handled in the same estimate. Finite entrance-Dirichlet/outgoing-derivative problems have index zero;
  the estimate therefore also proves their solvability. Exhaustion and local compactness give the infinite
  exterior inverse. Uniqueness in the weighted uniformly local domain follows by the same localized coercive
  estimate: remote cutoff terms vanish in the additional exponentially decaying localization weight.
  In particular no fast outward homogeneous mode is admitted in that domain.

#thm([Lemma 3.4.])[
  (Radial coefficient estimates).  #emph[In the cylindrical radius variable,
    the normalized stationary operator is analytic from a sufficiently small strip graph neighborhood,
    with the norm (3.6) and traces (3.9), to $L_t^2 H_theta^h$. Its coefficient variables are
$ R \, quad R_theta \, quad mu R_t \, $

 and it is affine in the bulk second-derivative variables
$ mu^2 \( R_(t t) - R_t \) \, quad mu R_(t theta) \, quad R_(theta theta) . $

 The graph neighborhood keeps the radius and metric denominators away from zero and retains the strict principal
   accretivity margins. If $v = R - sqrt(2)$ is small in the unweighted uniformly local strip norm,
   the mean-value factorization
$ cal(E)_(upright("rad")) \( v \) = \( cal(L)_(upright("cyl")) + Q_v \) v \, wide Q_v =
  integral_0^1 #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] D cal(E)_(upright("rad")) \( s v \) -
  D cal(E)_(upright("rad")) \( 0 \) #scale(x: 120%, y: 120%)[\)] thin d s \, $

 of minus twice the radial graph velocity obeys
$ parallel Q_v w parallel_(Y_(rho \, h)) lt.eq C_(rho \, h) parallel v parallel_(X_(1 \, h)) parallel w
  parallel_(X_(rho \, h)) $

 for every fixed weight $rho$ with bounded logarithmic derivatives.
   The same coefficient rule applies after fixed real translations or angular commutations when the corresponding
   graph norms are controlled.]
] <gauge:radial>

#proof[
  Put $R_z = mu R_t$ and $D = R^2 \( 1 + R_z^2 \) + R_theta^2$.
    Direct inversion of $g = "diag" \( 1 \, R^2 \) + d R ⊗ d R$ gives
  $ g^(z z) = frac(R^2 + R_theta^2, D) \, wide g^(z theta) = - frac(R_z R_theta, D) \, wide g^(theta theta) =
    frac(1 + R_z^2, D) . $
  These are analytic functions of the displayed first-derivative variables while $D$ is a unit.
    In the curvature numerator above, $R_(z z) = mu^2 \( R_(t t) - R_t \)$ and $R_(z theta) = mu R_(t theta)$;
    the remaining terms have only the same first variables and $R_(theta theta)$.
    The support term $\( R - R_t \) \/ 2$ is affine. Thus every highest second derivative remains in its $L_t^2
    H_theta^h$ slot, while its coefficient is in $L_t^oo H_theta^h$ by (3.9). The product estimate
  $ parallel A B parallel_(L_t^2 H_theta^h) lt.eq C_h parallel A parallel_(L_t^oo H_theta^h) parallel B
    parallel_(L_t^2 H_theta^h) $
  and analytic inversion of the unit denominator prove the map assertion.
    In its derivative, a coefficient variation is estimated in the first trace norm and multiplies a background
    second derivative in the bulk norm. This proves the stated small mean-value bound, strip by strip;
    division by $rho$ gives the weighted version. Fixed translations preserve the factors $mu^2 \, mu$,
    and angular commutations use the same algebra and module estimate. ◻
]

#thm([Lemma 3.5.])[
  (Separated cylindrical rates).  #emph[For (3.5), and for perturbations satisfying the normalized decay condition
    below, a weight $e^(alpha t)$ with $alpha in.not { 2 - j^2 : j in bb(Z) }$ gives separated end estimates.
    Slow data of rate below $alpha$ are prescribed at the entrance;
    slow data of rate above $alpha$ are prescribed at infinity (or at the appropriate finite exit).
    Finite intervals have logarithmic length at least a fixed $ell_(*) > 0$,
    with constants allowed to depend on $ell_(*)$. Crossing a rate changes the solution space by exactly the
    corresponding angular modes. Estimates hold with every fixed number of log-coordinate derivatives when the
    source has the corresponding regularity, with an arbitrarily small loss in a stated polynomial power.]
  #emph[Here the second-order differential perturbation $Q = cal(L) -
    cal(L)_(upright("cyl"))$ retains the strict principal accretivity of Lemma 6, with $E asymp e^(- 2 t)$, and,
    for the chosen $0 < eta < 1$, has the following gain on every fixed weight used in the assertion:
#[#set math.equation(numbering: n => "(3.15)")
 $ parallel Q v parallel_(Y_(e^(\( beta - 2 + eta \) t) \, h)) lt.eq
   C_(beta \, h \, eta) parallel v parallel_(X_(e^(beta t) \, h)) . $ <lin:normalized-decay>]

 The analogous bound is required after the fixed translations and commutations used to obtain derivative
   estimates. Thus the changes of the radial, mixed, and angular principal coefficients are measured in their
   respective units $E$, $sqrt(E)$, and $1$; lower coefficient terms may instead be measured in the corresponding
   coefficient–module operator norm. Ordinary absolute decay of the radial coefficient is not the condition in (3.15).]
  #emph[Consequently, on each cylindrical end and for every small $eta > 0$,
#[#set math.equation(numbering: n => "(3.16)")
 $ R - sqrt(2) = O \( z^(- 2 + eta) \) \, wide J = c z^2 + z \( ell dot.op e_r \) + O \( z^eta \) $ <lin:end-expansion>]

 for a Gaussian Jacobi solution with compact source. If $c = 0$,
   subtracting the exact infinitesimal rotation with tilt $ell$ leaves $O \( z^(- 2 + eta) \)$.
   End solutions with arbitrary prescribed $c \, ell$ exist, and their inward cutoffs have compact Jacobi source.]
] <lin:rates>

#proof[
  High Fourier numbers satisfy the coercive estimate after any fixed shift $alpha$,
    so only finitely many angular modes need separate treatment. In such a mode the equation is
  $ v_t - 2 mu^2 \( v_(t t) - v_t \) - sigma_j v = f . $
  Write $a = 2 mu^2$, $q = v_t$, $k = \( 1 + a \) \/ a$, and
  $ H \( t \, s \) = exp #h(-0.16667em) (- integral_t^s k \( zeta \) thin d zeta) \,
    wide \( sans(A)_T w \) \( t \) = integral_t^T a \( s \)^(- 1) H \( t \, s \) w \( s \) thin d s . $
  Solving the first-order equation for $q$ backward gives the exact formula
  $ q \( t \) = H \( t \, T \) q \( T \) + sans(A)_T \( sigma_j v + f \) \( t \) . $
  The kernel has bounded mass, width $O \( mu \( t \)^2 \)$,
    and an adjacent-strip tail bounded by $C exp \( - c \| s - t \| \/ mu \( t \)^2 \)$. Its finite mass is
  $ sans(A)_T 1 & = 1 - H \( t \, T \) - integral_t^T frac(a \( s \), 1 + a \( s \)) k \( s \) H \( t \, s \) thin d s\
 & = 1 - H \( t \, T \) + O \( a \( t \) \) . $
  In particular the infinite average has mass $1 + O \( a \( t \) \)$,
    whereas the finite one has a terminal layer. On its last strip $parallel H \( dot.op \, T \) parallel_(L^2)
    lt.eq C sqrt(a \( T \)) = C mu \( T \)$. Translation across the kernel and the fundamental theorem of calculus
    therefore give, for $rho = e^(alpha t)$,
  #[#set math.equation(numbering: n => "(3.17)")
   $ parallel \( sans(A)_T - I \) v parallel_(Y_(rho \, h)) lt.eq  & C sup_(t gt.eq t_0) mu \( t \) thin parallel
     v_t parallel_(Y_(rho \, h)) + C sup_(t gt.eq t_0) mu \( t \)^2 thin parallel v parallel_(Y_(rho \, h))\
 & + C mu \( T \) rho \( T \)^(- 1) parallel v \( T \) parallel_(H^h) . $ <lin:fast-average>]
  One may equivalently retain $- H \( t \, T \) v \( T \)$ as part of the terminal lift;
    replacing $v \( t \)$ by $v \( T \)$ in that layer costs the first term above.
    For the finitely many modes under consideration, the one-dimensional $H^1$ trace on a terminal interval of
    length $min \( 1 \, ell_(*) \)$ bounds the last term by $C sup
    mu \( parallel v parallel_(Y_(rho \, h)) + parallel v_t parallel_(Y_(rho \, h)) \)$.
    At an infinite exit the layer is absent. The estimate thus retains a small factor at every permitted finite
    exit, with no additional angular trace requirement. Keep this average on $f$.
    The remaining first-order operator $partial_t - sigma_j$ is inverted by integration from the entrance if
    $sigma_j < alpha$, and by integration from the right if $sigma_j > alpha$.
    Its weighted kernel has mass at most $\| alpha - sigma_j \|^(- 1)$.
    Taking $t_0$ large absorbs the displayed averaging error. The equation then controls $v_t$ and $mu^2 v_(t t)$.
    This constructs the separated inverse, including finite exits.
    Variation of constants shows that crossing $sigma_j$ adds one solution for each vector of its angular
    eigenspace, with that vector times $e^(sigma_j t)$ as leading term.
    Condition (3.15) makes the perturbation norm on a far tail arbitrarily small at each fixed weight;
    the Neumann series and the same variation-of-constants formulas then give the asserted perturbation and
    crossing statements.
  For the first assertion of (3.16), we first need small-coefficient invertibility,
    without a coefficient decay hypothesis. Put $v = R - sqrt(2)$, $a = 2 mu^2$,
    and let $K$ denote the exact curvature numerator preceding (3.5). Stationarity gives
  $ q := v_t = z R_z = R + 2 K arrow.r 0 \, wide a v_(t t) = 2 \( R_(z z) + R_z \/ z \) arrow.r 0 \, wide
    sqrt(a) thin v_(t theta) = sqrt(2) R_(z theta) arrow.r 0 . $
  Indeed spatial convergence gives $K arrow.r - 1 \/ sqrt(2)$;
    angular differentiation gives the same assertions at every fixed angular order.
    Together with $v \, v_(theta theta) arrow.r 0$, these identities prove that the actual graph has small tail
    norm in $X_0 := X_(1 \, h)$, with all five slots of (3.6). No unweighted bound for $v_(t t)$ has been used.
    The homogeneous term of the model fast derivative inverse is proportional to $exp \( t + e^(2 t) \/ 4 \)$ and
    is excluded by $q = z R_z = o \( e^t \)$.
  Fix $0 < eta < 1$, set $alpha = - 2 + eta$, and write $X_beta =
    X_(e^(beta \( t - t_0 \)) \, h)$ and similarly $Y_beta$. For both $beta = 0$ and $beta = alpha$,
    the model construction above has the same entrance projection $S = P_({ \| j \| gt.eq 2 })$ and gives
  $ parallel u parallel_(X_beta) lt.eq C_(eta \, h) #scale(x: 120%, y: 120%)[\(] parallel cal(L)_(upright("cyl"))
    u parallel_(Y_beta) + parallel S u \( t_0 \) parallel_(cal(T)_(a \( t_0 \) \, h)^D) #scale(x: 120%, y: 120%)[\)] . $
  The other slow channels use their backward integrals at infinity; every fast outward channel is excluded.
    For the finitely many low modes the integral kernel is bounded by the inverse spectral gap.
    For $\| j \| gt.eq 2$, conjugation by $e^(beta \( t - t_0 \))$ gives interior energy
  $ integral #h(-0.16667em) [a \| w_t \|^2 + { j^2 - 2 + beta - a \( 1 + beta + beta^2 \) } \| w \|^2] . $
  Here $a' = - 2 a$ and the leading mass is at least $eta$.
    Homogeneous outgoing derivative data give terminal coefficient $\( 1 - a \( T \) \) \/ 2 > 0$.
    The strip estimate supplies the remaining slots, and localization as in (3.14) gives a uniformly local
    constant independent of the terminal section. Finite problems and exhaustion therefore construct this inverse
    on each space, with the natural entrance trace (3.10).
  Lemma 7 supplies the nonlinear coefficient estimate in these same strip norms,
    with the first-derivative traces and the strict principal margins just established.
  Factor the actual equation as $\( cal(L)_(upright("cyl")) + Q \) v =
    0$ by integrating its derivative along $s v$, $0 lt.eq s lt.eq 1$.
    The radial coefficient variables $R \, R_theta \, mu R_t$, the first traces (3.9),
    and the coefficient–module rule of Lemma 7 give $parallel Q parallel_(X_beta arrow.r Y_beta) lt.eq
    delta \( t_0 \) arrow.r 0$ for these two weights. Background second derivatives stay in their bulk slots;
    no log derivative of a coefficient is needed here. If $H_beta$ lifts the stable entrance value and $K_beta$ is
    the zero-entrance model inverse, solve
  $ u_beta = H_beta S v \( t_0 \) - K_beta Q u_beta $
  by a Neumann series, choosing $C_(eta \, h) delta \( t_0 \) < 1 \/ 2$.
    The constructed $u_alpha$ lies in $X_0$, as does the actual $v$.
    Uniqueness in $X_0$ with the same stable data gives $v = u_0 = u_alpha$.
    This proves the domain upgrade and the first bound in (3.16); it does not assume that bound when estimating $Q v$.
  To obtain log regularity, use the nonlinear equation itself.
    Replace its explicit $mu \( t \)$ by $e^(- tau) mu \( t \)$ on the fixed tail and prescribe stable entrance
    data $S v \( t_0 + tau \)$. The coefficient–module formulas make this a smooth family of maps $X_alpha arrow.r
    Y_alpha$, whose derivative in the unknown is a small perturbation of the same invertible model.
    The implicit function theorem constructs its smooth local solution family.
    The shifted actual graph is small in $X_0$ and has these data.
    The same mean-value estimate gives uniqueness of small nonlinear solutions in $X_0$,
    identifying it with that family without assuming translation differentiability in $X_alpha$.
    Differentiating the explicit coefficients preserves the factors $mu^2$ and $mu$ on second derivatives.
    Iteration, at a sufficiently large fixed angular order, gives $partial_t^k v in X_alpha$ for each fixed $k$;
    a small extra loss may be allowed in $eta$. Consequently the normalized coefficient differences and their
    required log derivatives decay like $O \( e^(- \( 2 - eta \) t) \)$.
    Only at this point do we use the decaying-coefficient assertion for the sharper Jacobi asymptotics.
  We also explain why the Gaussian condition permits use of polynomial weights.
    Local elliptic estimates on spatial balls of radius $\( 1 + \| X \| \)^(- 1)$ and the Gaussian $L^2$ bound
    give, for a homogeneous exterior solution, a pointwise bound by a polynomial times
    $exp \( \| X \|^2 \/ 8 + o \( \| X \|^2 \) \)$. Choose $alpha_0$ strictly between $1 \/ 8$ and $1 \/ 4$.
    Direct differentiation gives
  $ L e^(alpha_0 \| X \|^2) = #scale(x: 120%, y: 120%)[\(] \( 4 alpha_0^2 - alpha_0 \) \| X \|^2 +
    O \( 1 \) #scale(x: 120%, y: 120%)[\)] e^(alpha_0 \| X \|^2) . $
  Likewise $L \( 1 + \| X \|^2 \)^(M \/ 2)$ is negative on a far end for sufficiently large fixed $M$,
    and dominates a given polynomial source. Compare the real and imaginary parts with a fixed multiple of this
    power plus $epsilon e^(alpha_0 \| X \|^2)$. The latter dominates the remote boundary;
    after exhausting the end, let $epsilon arrow.b 0$. The comparison principle is justified by division by the
    positive supersolution, which makes the zeroth-order coefficient nonpositive.
    Thus Gaussian solutions of polynomial-source equations have polynomial growth.
    For a nonsmooth source in an exterior range space, first subtract a cutoff of the exterior particular
    solution; the same argument applies to the homogeneous remainder.
  Starting with that polynomial bound, descend through weights above $2$, then through $2$ and $1$.
    The resulting coefficients are $c$ and $ell$ in (3.16). Coefficient errors multiplying $c
    z^2$ have size $O \( z^eta \)$, explaining the remainder stated there.
    When $c = 0$, subtract an exact rotation field, whose leading term is $z \( ell dot.op e_r \)$.
    No remaining slow rate lies between $0$ and $- 2 + eta$, giving the sharper remainder.
    Conversely prescribe each slow coefficient in the variation-of-constants construction on the tail and multiply
    the resulting exact end solution by an inward cutoff. It has polynomial growth and compact source.
  Finally log regularity does not require holomorphic spatial charts.
    Pull the operator back by a small real translation of $t$, cut off near the fixed entrance.
    Its coefficients are differentiable in the translation parameter in the same mapping norms.
    Invert the differentiated equation and use uniqueness to identify its derivative with $partial_t v$.
    Iteration, increasing the fixed angular order if needed, proves the asserted fixed-order log estimates. ◻
]

=== 3.3 Infinite conical ends <infinite-conical-ends>

On a conical end use a link graph on the unit sphere and $z = e^t$.
  Its scalar variable $v$ is a link displacement; a bounded $v$ gives an ambient normal displacement of size
  $O \( z \)$. Division by the normal velocity coefficient of link change gives

$ v_t - mu^2 #scale(x: 120%, y: 120%)[\(] A^(i j) \( t \, theta \, v \, D v \) D_(i j) v +
  B \( t \, theta \, v \, D v \) #scale(x: 120%, y: 120%)[\)] \, wide mu = e^(- t) . $

Thus all lower terms other than $v_t$ carry $mu^2$. The coefficients of the real reference equation and their
  required log and angular derivatives are bounded, and the diffusion matrix is uniformly positive definite.
  Smooth conical asymptotics give these bounds.

#thm([Lemma 3.6.])[
  (Conical energy, traces, and exhaustion).  #emph[Let
#[#set math.equation(numbering: n => "(3.18)")
 $ cal(C) v = v_t - mu^2 \( a v_(t t) + 2 b v_(t theta) + c v_(theta theta) + d v_t + q v_theta + e v \) .
   $ <lin:conical-operator>]

 Assume the real symmetric matrix $mat(delim: "(", a, b; b, c)$ is at least $c_(*) I$,
   and the coefficients and their required derivatives are uniformly bounded.
   There is $t_(*)$ depending only on these bounds such that, for $t_0 gt.eq t_(*)$,
   the entrance Dirichlet problem on $\[ t_0 \, oo \) times S^1$ is an isomorphism in the spaces
#[#set math.equation(numbering: n => "(3.19)")
 $ parallel v parallel_(X_h^(upright("con"))) =  & sup_(t gt.eq t_0) #scale(x: 120%, y: 120%)[\(] parallel
   v \( t \) parallel_(H^(h + 1)) + parallel v_t \( t \) parallel_(H^h) #scale(x: 120%, y: 120%)[\)] +
   parallel mu^(- 1) v_t parallel_(L^2 H^h) + parallel mu D^2 v parallel_(L^2 H^h) \,\
parallel f parallel_(Y_h^(upright("con"))) =  & parallel mu^(- 1) f parallel_(L^2 H^h) . $ <lin:conical-norm>]

 More explicitly,
#[#set math.equation(numbering: n => "(3.20)")
 $ parallel v parallel_(X_h^(upright("con"))) lt.eq C_h #scale(x: 120%, y: 120%)[\(] parallel cal(C) v
   parallel_(Y_h^(upright("con"))) + parallel v \( t_0 \) parallel_(H^(h + 3 \/ 2)) #scale(x: 120%, y: 120%)[\)] .
   $ <lin:conical-estimate>]

 The same bound holds on $\[ t_0 \, T \]$, $T gt.eq t_0 + 2$, with $v_t \( T \) = 0$, uniformly in $T$.
   For the entrance term the constant may depend on the fixed $t_0$.
   Small complex perturbations in the full domain-to-range operator norm preserve these assertions.]
] <lin:conical>

#proof[
  First take real data, zero entrance value, and a finite interval with zero terminal time derivative. Put
  $ U = parallel mu^(- 1) v_t parallel_2 \, quad V^2 = parallel mu v_(t theta) parallel_2^2 +
    parallel mu v_(theta theta) parallel_2^2 \, quad F_0 = parallel f \/ mu parallel_2 \, quad mu_0 = e^(- t_0) \,
    quad ell = d v_t + q v_theta + e v . $
  Multiplication of $cal(C) v = f$ by $- v_(theta theta)$, followed by one integration in $t$ and one in $theta$
    for the $a$ term, gives
  #[#set math.equation(numbering: n => "(3.21)")
   $ & 1 / 2 parallel v_theta \( T \) parallel_2^2 + integral
     mu^2 \( a v_(t theta)^2 + 2 b v_(t theta) v_(theta theta) + c v_(theta theta)^2 \)\
 & quad = - integral f v_(theta theta) - integral mu^2 a_theta v_t v_(t theta) +
   integral \( mu^2 a \)_t v_t v_(theta theta) - integral mu^2 ell v_(theta theta) . $ <lin:conical-first>]
  The boundary term suppressed in this identity is $- \[ integral mu^2 a v_t v_(theta theta) \]_(t_0)^T$.
    It vanishes because $v_(theta theta) \( t_0 \) = 0$ and $v_t \( T \) = 0$.
  The second multiplier is $mu^(- 2) v_t$. Integrating the $a$ term in time and the mixed term in angle gives
  #[#set math.equation(numbering: n => "(3.22)")
   $ U^2 + 1 / 2 integral_(S^1) a \( t_0 \) v_t \( t_0 \)^2 =  & integral \( f \/ mu \) \( v_t \/ mu \) +
     integral c v_(theta theta) v_t + integral ell v_t\
 & - integral \( 1 / 2 a_t + b_theta \) v_t^2 . $ <lin:conical-second>]
  In particular the entrance term is favorable and is generally nonzero.
    The cross term $integral c v_(theta theta) v_t$ is bounded directly by $C U V$.
    Integrating it in time would unnecessarily introduce an unweighted $c_t v_theta^2$ term;
    no integrability of $c_t$ is assumed.
  Let $H_0 = parallel mu \( q v_theta + e v \) parallel_2$. The two identities imply
  $ c_(*) V^2 lt.eq F_0 V + C mu_0^2 U V + H_0 V \, wide U^2 lt.eq F_0 U + C U V + C mu_0^2 U^2 + H_0 U . $
  Product integration, using the zero entrance value, gives
  $ sup_t parallel v_theta \( t \) parallel_2^2 lt.eq 2 U V \, wide
    sup_t parallel v \( t \) parallel_2 lt.eq \( integral_(t_0)^oo mu^2 \)^(1 \/ 2) U = mu_0 U \/ sqrt(2) . $
  Consequently $H_0 lt.eq C mu_0 sqrt(U V) + C mu_0^2 U$. Add a sufficiently small fixed multiple of the second
    energy inequality to the first, and then choose $mu_0$ sufficiently small.
    Young’s inequality absorbs the cross terms and yields $U + V lt.eq C F_0$ with a constant independent of $T$.
    The equation recovers the missing derivative:
  $ a mu v_(t t) = mu^(- 1) v_t - 2 b mu v_(t theta) - c mu v_(theta theta) - mu ell - f \/ mu . $
  Thus $W = parallel mu v_(t t) parallel_2 lt.eq C F_0$. Since $v_t \( T \) = 0$,
    product integration also gives $sup_t parallel v_t \( t \) parallel_2^2 lt.eq 2 U W$.
    These are all the zeroth-angular-order norms in (3.19).
  Commute with $partial_theta^j$ and keep the same principal operator on the left.
    After division of the new source by $mu$, the new highest terms are
  $ mu \( partial_theta^k A^(r s) \) D_(r s) partial_theta^(j - k) v \, wide 1 lt.eq k lt.eq j . $
  Each involves a strictly lower angular commutation of the already controlled second derivatives.
    Induction in $j$ therefore proves (3.20) at every fixed $h$, without a time derivative of $f$.
    Nonzero entrance data are removed by an extension on the first fixed unit collar.
    A Fourier extension $phi_j e^(- \( 1 + \| j \| \) \( t - t_0 \))$, with a fixed cutoff,
    has commuted $H^2$ norm controlled by $parallel phi parallel_(H^(h + 3 \/ 2))$;
    its forcing in (3.19) has the same bound with a constant depending on $t_0$.
  For each finite $T$ this is a scalar elliptic problem with entrance Dirichlet and transverse outgoing derivative
    boundary conditions. Its index is zero, as follows by deforming the positive principal matrix to the identity
    and the lower terms to zero on the finite domain. The estimate excludes a kernel,
    so the problem is surjective. Exhaustion, weak compactness in the weighted bulk spaces,
    and local elliptic compactness give an infinite-end solution with the same bound.
  For uniqueness on the infinite end it is necessary to justify removal of terminal terms for an arbitrary element
    of (3.19). Indeed
  $ integral_(t_0)^oo lr(|frac(d, d t) parallel v_t \( t \) parallel_(H^h)^2|) d t lt.eq
    2 parallel mu^(- 1) v_t parallel_(L^2 H^h) parallel mu v_(t t) parallel_(L^2 H^h) < oo . $
  The weighted $L^2$ condition forces the limiting derivative trace to be zero. Also, after angular integration,
  $ integral mu^2 a v_t v_(theta theta) = - integral mu^2 a v_(t theta) v_theta - integral mu^2 a_theta v_t v_theta . $
  Choose terminal sections tending to infinity where $parallel mu v_(t theta) parallel_(H^h) arrow.r 0$.
    The other factors have bounded traces, so this boundary term vanishes along those sections.
    The terminal angular energy in (3.21) remains nonnegative.
    The same two-energy argument now proves the estimate and uniqueness on the infinite domain.
    Finally all second derivatives, including $mu v_(t t)$, have been controlled;
    a small complex change is therefore a small bounded perturbation of the full isomorphism and is inverted by a
    Neumann series. ◻
]

#thm([Lemma 3.7.])[
  (Gaussian solutions on a conical tail).  #emph[Let $J in H_G^2 \( S \)$ solve $L J =
    f_c$ with $f_c in L_G^2$ compactly supported. On a conical tail outside that support,
    its link displacement belongs to $X_h^(upright("con"))$ for every fixed $h$,
    and obeys the entrance estimate (3.20). The same conclusion holds after a conical source in
    $Y_h^(upright("con"))$ has first been removed by its zero-entrance particular solution.
    These assertions concern the real reference operator and its complex-valued solutions.]
] <lin:gaussian-conical>

#proof[
  Fix a far entrance and write $z = e^t$. The normal component of link change is $z a_n \( t \, theta \)$,
    where $a_n$ is a real smooth unit with bounded inverse and bounded fixed log and angular derivatives.
    The scalar normalization of the conical equation gives another such unit $c_n$ for which, on the tail,
  $ L \( z a_n v \) = z c_n cal(C) v . $
  The functions $a_n \, c_n$ include the normal-speed and drift factors;
    they multiply the source as well as the unknown. This identity follows by differentiating the prescribed link
    graph equation, whose coefficient of $v_t$ is a nonzero unit before its drift normalization.
  Local elliptic regularity makes the trace $v_0 = J \/ \( z a_n \)$ at the entrance smooth.
    Solve $cal(C) v = 0$ with this trace by Lemma 9. The normal lift $tilde(J) =
    z a_n v$ is in the Gaussian $H^2$ domain on the tail. Indeed smooth conical coordinates give $d A asymp z^2 d
    t thin d theta$ and
  $ \| nabla tilde(J) \| lt.eq C \( \| v \| + \| D v \| \) \, wide \| nabla^2 tilde(J) \| lt.eq
    C z^(- 1) \( \| D^2 v \| + \| D v \| + \| v \| \) . $
  The highest Gaussian integral is bounded by
  $ integral e^(- z^2 \/ 4) \| D^2 v \|^2 thin d t thin d theta lt.eq
    C integral z^(- 2) \| D^2 v \|^2 thin d t thin d theta \, $
  and the other terms follow from the traces and weighted bulk terms in (3.19).
    A fixed collar extension at the entrance preserves this conclusion.
  The difference $J - tilde(J)$ is therefore a Gaussian exterior $L$-solution with zero Dirichlet trace at the
    entrance. Local elliptic estimates give the pointwise bound used in the proof of Lemma 8,
    namely a polynomial times $exp \( \| X \|^2 \/ 8 + o \( \| X \|^2 \) \)$.
    For $1 \/ 8 < alpha_0 < 1 \/ 4$ the positive function $e^(alpha_0 \| X \|^2)$ satisfies $L
    e^(alpha_0 \| X \|^2) < 0$ on a sufficiently far tail. On each finite tail,
    divide the equation by this function and apply the maximum principle to both signs of the real and imaginary
    parts. The entrance value is zero, and for each $epsilon > 0$ the remote value is bounded by $epsilon
    e^(alpha_0 \| X \|^2)$ once the remote section is sufficiently far out.
    Exhaustion and then $epsilon arrow.b 0$ give $J = tilde(J)$.
    Thus the conical estimate applies after, rather than before, identification of its domain.
  For $f in Y_h^(upright("con"))$, its physical source $z c_n f$ belongs to $L_G^2$, because
  $ integral z^4 \| f \|^2 e^(- z^2 \/ 4) thin d t thin d theta lt.eq C integral z^2 \| f \|^2 thin d t thin d theta . $
  Solve the conical particular problem with zero entrance, cut its lift off on a fixed collar, and subtract it.
    The remaining source is compact and the preceding argument applies.
    The maximum principle is used only for the real operator $L$;
    analytic perturbations in complex parameters will be taken later on fixed real-coordinate function spaces. ◻
]

=== 3.4 Compact norms and coefficient maps <compact-norms-and-coefficient-maps>

The infinite-end problems are joined to the Gaussian core on fixed collars.
  We keep the commuted compact norms explicit so that the nonlinear map and the cutoff sources use the same domain
  and range.

Here is a fixed convention on the core and chart overlaps.
  Choose a finite family $cal(Z)$ of smooth vector fields that spans the tangent bundle on the core,
  contains the angular field on each end collar, and reduces to angular fields sufficiently far out.
  At least one field is nonzero on every patch used in the transition. On a compact set $K$ put

#[#set math.equation(numbering: n => "(3.23)")
 $ C_h^2 \( u \; K \) = sum_(\| alpha \| lt.eq h) parallel Z^alpha u parallel_(H^2 \( K \)) \, wide
   C_h^0 \( f \; K \) = sum_(\| alpha \| lt.eq h) parallel Z^alpha f parallel_(L^2 \( K \)) . $ <lin:compact-norm>]

The sums include words in the fields and the empty word. Nested compact collars are fixed once and for all.
  Their elliptic estimates control the entrance traces in Lemmas 6 and 9;
  there is no artificial boundary at a change of graph gauge.
  For a smooth reference operator, $\[ L \, Z \]$ has order two with bounded coefficients on these fixed sets.
  Thus $\[ L \, Z^alpha \] u$ is controlled by the commuted $H^2$ norms of strictly smaller commutation order.
  Interior estimates applied inductively to $Z^alpha u$ justify the claimed commuted estimates without loss of a
  derivative of the source.

#thm([Lemma 3.8.])[
  (One graph chart across compact overlaps).  #emph[Let $theta.alt$ denote the finite end-rotation parameters.
    After fixing real coordinate identifications on the compact overlaps,
    the core and prescribed end graphs can be represented by one fiber map
$ Gamma_theta.alt \( y \, s \) \, wide Gamma_0 \( y \, 0 \) = X \( y \) \, $

 over the fixed real base atlas of $S$. It is smooth in $y$ and analytic in $\( theta.alt \, s \)$.
   It agrees with the fixed core graph map on the common observation support, independently of $theta.alt$,
   and with the prescribed rotated radius or link map sufficiently far on each end.
   On the compact overlaps, $\( y \, s \) mapsto Gamma_theta.alt \( y \, s \)$ is a local diffeomorphism for small
   real $\( theta.alt \, s \)$. Its scalar derivative supplies the linear graph-unit identifications on those overlaps.]
] <gauge:fiber-atlas>

#proof[
  Pull the core and end fiber maps once by the fixed real coordinate identifications,
    so that their ambient values are functions of the same base point $y$.
    At $\( theta.alt \, s \) = \( 0 \, 0 \)$ all these values equal $X \( y \)$.
    Orient their scalar variables so that the normal component of each scalar derivative is positive.
    On each fixed compact overlap interpolate the ambient fiber maps pointwise with a smooth partition of unity in
    $y$. At the reference, the base derivatives of the interpolated map are $D_y X$,
    and its scalar derivative still has positive normal component.
    The full derivative in $\( y \, s \)$ is therefore invertible.
    Compactness preserves this transversality for small parameters.
    Choose the partition to select the core map on the observation support and the relevant end map outside the
    overlap collars. Because its cutoffs depend only on the real base point,
    the interpolation is analytic in the finite variables and invokes no parameter-dependent spatial composition.
    The far tail charts retain their already stated scaled domains and units. ◻
]

#thm([Lemma 3.9.])[
  (Conical and compact coefficient maps).  #emph[The normalized conical stationary operator is analytic from a
    sufficiently small link-graph ball in $X_h^(upright("con"))$ to $Y_h^(upright("con"))$.
    On a sufficiently small neighborhood in fixed compact graph charts,
    the stationary operator is analytic from the commuted $H^2$ norm (3.23) to its commuted $L^2$ range.
    The exact fiber chart of Lemma 11 gives the compact transitions.
    The fixed family of commutations can span the core and reduce to angular commutations sufficiently far out
    without loss of derivatives.]
] <gauge:compact>

#proof[
  After dividing the conical output by $mu$, its equation is
  $ mu^(- 1) v_t - mu #scale(x: 120%, y: 120%)[\(] A^(i j) \( t \, theta \, v \, D v \) D_(i j) v +
    B \( t \, theta \, v \, D v \) #scale(x: 120%, y: 120%)[\)] . $
  The norm (3.19) gives uniformly bounded first-derivative algebra traces,
    which multiply $mu D^2 v$ in $L_t^2 H_theta^h$. The lower terms have the integrable factor $mu$.
    Analytic composition on a small trace neighborhood and the same algebra–module estimate as in Lemma 7
    therefore prove the conical map assertion. For example the trace of $v_t$ follows from product integration of
    $mu^(- 1) v_t$ with $mu v_(t t)$ on neighboring strips.
  For completeness consider a compact flow box $\( s \, y \)$ of one nonvanishing commuting field,
    straightened to $partial_s$. Include $partial_s^j u$ in $H^2$ for $0 lt.eq j lt.eq h$,
    and use overlapping flow boxes for the finite field family.
    In a differentiated coefficient $A \( u \, D u \)$, the sole potentially highest factor $partial_s^h D
    u$ has $L_y^oo L_s^2$ control by its $y$ derivative and product integration.
    The other factor $D^2 u$ has $L_y^2 L_s^oo$ control by one additional $s$ derivative.
    Their product is in $L_(s \, y)^2$, since
  $ parallel f g parallel_(L_(s \, y)^2) lt.eq parallel f parallel_(L_y^oo L_s^2) thin parallel g
    parallel_(L_y^2 L_s^oo) . $
  When all commutations fall on $D^2 u$, the coefficient has its ordinary uniform first-derivative bound.
    Intermediate distributions obey the one-dimensional Sobolev product inequality in $s$,
    followed by this same inequality in $y$. Iterating the analytic coefficient expansion covers any number of
    first-derivative factors. Smooth changes of boxes and cutoffs only create lower commutations.
    This proves the required product map on the compact transitions,
    including at a place where only one of the retained fields is nonzero. ◻
]

=== 3.5 The analytic family preserving end types and its opening jets <the-analytic-family-preserving-end-types-and-its-opening-jets>

We now use the Gaussian and infinite-end inverses to separate changes that preserve end types from quadratic
  cylindrical openings. Analyticity is asserted for the former parameters only.
  Successive inversion constructs each coefficient in the latter parameters,
  and Gaussian integration gives its action coefficient; convergence of the opening series is not required.

#thm([Proposition 3.10.])[
  (Normalized family and polynomial jets).  #emph[Let $kappa$ be the number of cylindrical ends.
    The observations can be chosen so that their values are $q =
    sans(P) \( p \)$ in analytic reduced coordinates $p = \( b \, x \) in bb(R)^(m - kappa) times bb(R)^kappa$,
    with the following properties.]
  + #emph[At $x = 0$ there is a real analytic family $S_b$ of normalized solutions of (3.4).
    It has the same end types as $S$, permits independent end tilts,
    and permits changes of its conical links within the normalized family.
    Outside the fixed observation support it is an exact shrinker.
    Its cylindrical remainder after rotating the end is $O \( z^(- 2 + eta) \)$ for every fixed $eta > 0$,
    on a parameter neighborhood that may depend on this choice. On each conical end its link graph satisfies
#[#set math.equation(numbering: n => "(3.24)")
 $ v_b \( t \, theta \) = v_(b \, oo) \( theta \) + O \( e^(- 2 t) \) $ <lin:family-conical-asymptotics>]

 in every fixed log and angular derivative, with $v_(b \, oo)$ analytic in $b$.
   These bounds and their fixed parameter derivatives are uniform on a closed small parameter ball.]
  + #emph[There is a unique formal normalized solution in $x$,
$ u \( b \, x \) tilde.op sum_(alpha in bb(N)^kappa) u_alpha \( b \) x^alpha \, wide
  lambda \( b \, x \) tilde.op sum_alpha lambda_alpha \( b \) x^alpha \, $

 based at $S_b$, whose coefficients in the prescribed graph charts have polynomial growth and are analytic in $b$.
   For real $b$, their coefficientwise conversions to normal graph jets are smooth in $b$ and have uniform
   polynomial bounds at every fixed derivative order. After removal of the first-order tilt,
   the term homogeneous of degree one in $x$ on cylindrical end $j$ is
#[#set math.equation(numbering: n => "(3.25)")
 $ sqrt(2) / 2 thin beta_j \( b \, x \) z^2 + O \( \| x \| z^eta \) \, wide beta \( b \, x \) = M \( b \) x \,
   $ <lin:opening-coefficient>]

 where $M \( b \)$ is an analytic invertible $kappa times kappa$ matrix.
   In particular $beta$ is exactly homogeneous linear in $x$ for fixed $b$.]
  + #emph[Integrating the Gaussian action coefficient by coefficient defines $cal(F) in bb(R) { b } \[ \[ x \] \]$, with
#[#set math.equation(numbering: n => "(3.26)")
 $ nabla_p cal(F) = \( D_p sans(P) \)^(sans(T)) lambda . $ <lin:action-multipliers>]

 Every fixed truncation of the prescribed graph series and every fixed number of its parameter or spatial
   derivatives has uniform polynomial end bounds on a sufficiently small complex $b$ neighborhood.
   The real normal truncations have the analogous smooth bounds for real parameters.
   This neighborhood may depend on the fixed truncation and derivative orders.]
  #emph[When the limiting links and cylindrical directions are separated, as for the tangent section in 3,
    the real family on a closed sufficiently small ball has the following additional geometry.
    Its smooth rescaled conical annuli, the rotated cylindrical tails,
    and the compact core have uniform bounded geometry. There is a uniform positive normal tubular radius;
    on a sufficiently far conical annulus of radius $r$ the tubular radius is at least $c r$.
    In the prescribed parametrizations $\| partial_b X_b \| lt.eq
    C \( 1 + \| X \| \)$ and its physical first derivative is bounded.
    These statements concern the real surfaces; complex parameter continuation is taken in the prescribed
    coordinates on a fixed real atlas.]
] <lin:family>

#proof[
  #emph[The type-preserving inverse and the reference family.] For each end,
    Lemma 8 constructs Jacobi solutions with its opening and two tilt coefficients prescribed independently.
    Extend them inward by cutoffs. They lie in $H_G^2$ and have compact Jacobi sources.
    Apply Lemma 5 to these functions. The map from the enlarged observation values to the $kappa$ opening
    coefficients of the homogeneous normalized linear solution is surjective.
    Split the observation space into its kernel $V_b$ and a fixed $kappa$-dimensional complement $V_x$ on which
    this map is an isomorphism.
  The type-preserving domain consists of the compact graph variables,
    cutoff end rotations together with cylindrical remainders of weight $- 2 + eta$,
    and the conical link variables of (3.19). Its range has the corresponding cylindrical source weight,
    conical source norm, and compact norms. Impose only the $V_b$ components of the observations,
    while retaining the full multiplier vector. We verify that the linearization is an isomorphism in these
    spaces. For a general exterior source, first solve a cylindrical particular problem with zero slow
    coefficients at infinity and zero stable entrance data in Lemma 8,
    and a conical particular problem with zero entrance value.
    Cut their normal lifts off inside fixed far end collars where the retained fields $cal(Z)$ have reduced to
    angular commutations. Choose these collars outside the common compact observation and multiplier-source
    support, so the cutoff lifts vanish on that support and have zero observations.
    Their Gaussian norms and those of their lifted sources are controlled:
    this follows from their polynomial cylindrical bounds and from the lift estimates in Lemma 10.
  The remaining source is compact. Solve the Gaussian normalized block with the required $V_b$ observations and
    arbitrary $V_x$ observations, then vary the latter uniquely until all opening coefficients vanish.
    The finite-dimensional inverse used here is the opening map just constructed.
    Lemma 8 gives the resulting rotations and decaying cylindrical remainders.
    Enlarge the compact source set to include the common multiplier-source support,
    and choose the later trace collars outside this set. Lemma 10, applied at such an entrance,
    identifies the conical link component with the solution in $X_h^(upright("con"))$.
    These estimates give a bound in the full type-preserving norm directly for the stated range spaces.
    On the core, the commuted compact elliptic estimate bounds the $C_h^2$ norm by the Gaussian $H_G^2$ norm,
    the commuted compact source norm, and the multiplier norm;
    the source columns are fixed smooth compact functions. The end inverses accept their full sources;
    after the cutoffs the Gaussian source is compactly supported in $L_G^2$.
    Near a farther fixed entrance its Gaussian solution is homogeneous and therefore smooth,
    so the entrance trace estimates apply there even for the original rough source.
    A homogeneous element of this domain lifts to $H_G^2$; if its $V_b$ observations and its openings vanish,
    the $V_x$ observations also vanish. The Gaussian block then kills the element and its multipliers.
    This proves the asserted isomorphism.
  In prescribed graph coordinates the stationary equation is affine in the highest second derivatives,
    with coefficients analytic in position and first derivatives.
    The denominator units are bounded away from zero near the reference.
    The trace and product rules above make it an analytic map between precisely these domain and range spaces.
    On a conical end, for example, the divided range expression is $mu^(- 1) v_t -
    mu \( A^(i j) D_(i j) v + B \)$: bounded analytic coefficients of the first-derivative traces multiply $mu D^2
    v$ in $L^2$, and lower terms have the integrable factor $mu$.
    The cylinder uses $R \, R_theta \, mu R_t$ as coefficient variables and the second-derivative slots in (3.6);
    compact transitions use (3.23). End rotations are prescribed ambient rotations with a fixed cutoff on the
    core. They are analytic in their finite parameters without requiring analytic spatial charts.
    The analytic implicit function theorem gives $S_b$ and its multiplier vector $lambda_b$ on one parameter ball.
    Write its full observation value as $q_0 \( b \)$ and set
  #[#set math.equation(numbering: n => "(3.27)")
   $ sans(P) \( b \, x \) = q_0 \( b \) + V_x x . $ <lin:flattened-observations>]
  This is a local analytic coordinate system for the observation values.
    Write the preceding solution on the fixed atlas as $X_b \( y \) =
    Gamma_(theta.alt \( b \)) \( y \, u_b \( y \) \)$, and center its scalar chart by
  #[#set math.equation(numbering: n => "(3.28)")
   $ Psi_b \( y \, s \) = Gamma_(theta.alt \( b \)) \( y \, u_b \( y \) + s \) \, wide Psi_b \( y \, 0 \) =
     X_b \( y \) . $ <lin:centered-fiber>]
  This is the exact chart for subsequent prescribed graphs.
    The low-space family makes it analytic in the fixed-coordinate Banach spaces;
    the local bootstrap below supplies every fixed spatial derivative.
    On the observation support the core fiber map remains fixed and each $chi_i$ is evaluated at the same real
    $y$. The variational source columns there therefore acquire only the pointwise analytic density and
    normal-speed units. No spatial coordinate is composed with a $b$-dependent map.
    For any smaller fixed cylindrical loss $eta_0 > 0$, repeat this same type-preserving inverse and implicit
    construction with weight $- 2 + eta_0$. Its solution lies in the original weaker domain and has the same $V_b$
    observations. Small uniqueness in that weaker domain identifies it with $S_b$.
    After shrinking the parameter ball for this fixed loss and angular order,
    the same family is therefore analytic in the stronger weight.
    The same real-translation argument supplies its fixed log derivatives there.
    This justifies every fixed choice of the cylindrical remainder loss used below.
  #emph[Uniform regularity of the real family.] The preceding construction supplies the small conical norm,
    but the smooth geometry required below also uses the stationary equation.
    Write the full link equation on a fixed tail as
  $ cal(C)^(upright("nl")) \( v \) = v_t - mu^2 { A^(i j) \( t \, theta \, v \, D v \) D_(i j) v +
    B \( t \, theta \, v \, D v \) } = 0 . $
  In the preceding construction choose one extra fixed entrance collar,
    and analyze the tail starting at a later $t_0$. On a fixed larger entrance collar,
    local parameter-dependent elliptic bootstrap for this already constructed low-norm family gives every fixed
    spatial Sobolev norm uniformly on a closed inner complex $b$-ball.
    The coefficients and compact sources are smooth there and their ellipticity is uniform.
    The usual commuted local estimates prove the bounds successively;
    testing against smooth functions and using the low-space holomorphy then gives holomorphy in each of these
    locally bounded higher Sobolev norms. In particular the entrance data used below are smooth in their real
    translation parameters into $H^(h + 3 \/ 2)$, uniformly on that ball. This is a fixed-collar statement.
  For small real translations $\( tau \, sigma \)$ of the log and periodic angular coordinates,
    prescribe on the fixed tail
  $ cal(C)_(tau \, sigma)^(upright("nl")) \( w \) = w_t - e^(- 2 tau) mu \( t \)^2 { &
    A^(i j) \( t + tau \, theta + sigma \, w \, D w \) D_(i j) w\
 & + B \( t + tau \, theta + sigma \, w \, D w \) } \,\
w \( t_0 \, theta \) & = v_b \( t_0 + tau \, theta + sigma \) . $
  All explicit reference functions and the angular frame are shifted in this formula.
    The bounded reference derivatives and the conical coefficient–module rule make it a $C^oo$ family of maps from
    one fixed low $X_h^(upright("con"))$, $h gt.eq 4$, to $Y_h^(upright("con"))$, holomorphic in $b$.
    Its derivative in $w$ is a uniformly small perturbation of the conical entrance isomorphism.
    The implicit function theorem therefore gives one joint solution family,
    smooth in $\( tau \, sigma \)$ and holomorphic in $b$.
  The actual translated graph remains in the same small domain,
    even though strong continuity of translation in the supremum part of that norm has not been assumed.
    On the enlarged tail,
  $ parallel mu^(- 1) v_(b \, t) \( thin dot.op + tau \) parallel_2 lt.eq
    e^(\| tau \|) parallel mu^(- 1) v_(b \, t) parallel_2 \, wide
    parallel mu D^2 v_b \( thin dot.op + tau \) parallel_2 lt.eq e^(\| tau \|) parallel mu D^2 v_b parallel_2 \; $
  the supremum bounds are unchanged up to restriction, and angular translation is an isometry.
    Small nonlinear uniqueness identifies the actual translate with the implicit family.
    Differentiating that one family gives $partial_t^k partial_theta^j v_b in
    X_h^(upright("con"))$ for every fixed $j \, k$. Constants may depend on $j \, k$,
    but these derivatives are taken on one translation neighborhood and one closed inner $b$-ball.
  The resulting first traces bound every fixed second log derivative pointwise.
    The equation now yields $parallel partial_t v_b \( t \) parallel_(H^h) lt.eq C_h e^(- 2 t)$,
    and its differentiated versions give the same factor for every fixed log, angular,
    and parameter derivative of $partial_t v_b$. Integration to infinity proves (3.24), with
  $ v_(b \, oo) = v_b \( t_0 \) + integral_(t_0)^oo v_(b \, t) \( t \) thin d t . $
  The integrable uniform estimates justify differentiation in $b$, so the limiting link is analytic.
    For the cylinder, the translation argument in Lemma 8 also permits the angular translation $sigma$:
    its stable projection onto $\| j \| gt.eq 2$ commutes with angular rotations.
    Shift the explicit coefficients, angular frame, and stable entrance data together,
    and use the same low-space uniqueness comparison with the rotated family.
    One joint translation family then gives all its fixed mixed derivative bounds on a closed small parameter ball.
  For real $b$, write a conical parametrization as $X_b = r omega_b \( t \, theta \)$.
    The preceding estimates give uniformly smooth rescaled annuli, $\| upright("II")_b \| lt.eq C \/ r$,
    their fixed physical derivative bounds, and $\| X_b^perp \| lt.eq C \/ r$ because $omega_(b \, t) =
    O \( r^(- 2) \)$. The normalized metrics and their fixed derivatives vary by $O \( \| b \| \)$.
    For the separated end data in the final assertion, the embedded limiting links remain embedded and separated
    on a small closed ball. Their tubular radii on the unit sphere are uniformly positive.
    Scaling gives a tube of radius $c r$ on each far conical annulus;
    the annular asymptotics and separated end directions prevent other ends from entering that tube.
    The rotated cylindrical tails have a fixed positive tube,
    and compact embeddedness gives one on the core and the fixed transition collars.
    Taking the minimum proves the asserted global positive tubular radius.
    A conical parameter variation is $r partial_b omega_b$ and a cylindrical tilt also has size $O \( r \)$;
    their physical first derivatives are bounded. This proves the final parameter-variation assertion.
    In particular, on a region of radius $R$, normal conversion between nearby real family members costs at most
    $C \( 1 + R \) \| b' - b \|$ in height and slope while that quantity is within the tube.
  #emph[The augmented Gaussian inverse about the family.] We establish this inverse before solving any opening
    coefficient. Use the prescribed rotations and radial conical charts to pull all differential expressions to
    the fixed real atlas of $S$. Put $r = \| X \|$ there, and let
  $ cal(D)_G = { w : nabla^2 w \, med \( 1 + r \) nabla w \, med \( 1 + r^2 \) w in L^2 \( S \) } $
  with its sum norm. This is the half-density domain in Lemma 4.
    For real $b$, let $F_b : S arrow.r S_b$ be the prescribed parametrization and $J_b$ its area Jacobian.
    Pull back the scalar component in the unit normal frame of $S_b$;
    if a prescribed graph variable is used to compute that component,
    first multiply by its known graph-speed factor. Multiply the resulting physical normal scalar by $J_b^(1 \/ 2)
    exp \( - \( 1 + delta \) \| F_b \|^2 \/ 8 \)$. This is the usual Gaussian half-density identification for real
    $b \, delta$.
  For complex $b$, take the analytic bilinear expressions for $F_b dot.op F_b$, $J_b^(1 \/ 2)$,
    and the normalized normal frame on this same real atlas, and define the conjugated differential expression by
    their chain rules. The branches are fixed from $b = 0$. This defines an analytic operator
    $tilde(cal(A))_(b \, delta) : cal(D)_G xor bb(C)^m arrow.r L^2 \( S \) xor bb(C)^m$;
    it does not define a positive measure on a complex surface or evaluate a spatial function at a complex point.
    The uniform geometry just proved puts its coefficient difference from $tilde(cal(A))_(0 \, 0)$ on the three
    domain terms
  $ o \( 1 \) \| nabla^2 w \| + o \( 1 \) \( 1 + r \) \| nabla w \| + o \( 1 \) \( 1 + r^2 \) \| w \| . $
  For the complex coefficient bound, use the preceding joint translated family as a holomorphic Banach-valued map
    at every fixed translated order. The required first-trace maps are bounded;
    Cauchy’s estimate on a closed inner complex ball therefore gives $O \( \| b \| \)$ differences for all
    normalized coefficient derivatives used here. These are the analytic estimates behind the real geometric
    interpretation. Indeed normalized metric differences and their physical derivatives are $O \( \| b \| \)$;
    differentiating the half-density contributes at most one factor of $r$ in first-order coefficients and two in
    zeroth-order coefficients. The measure-Jacobian derivatives have the bounded-geometry scales.
    Changing $delta$ contributes $O \( \| delta \| \) \( \( 1 + r \) \| nabla w \| + \( 1 + r^2 \) \| w \| \)$.
    The derivative of the base multiplier term $sum_i lambda_(b \, i)
    chi_i \( u \)$ is retained and is a small compactly supported operator,
    as are the observation and source-column changes. Consequently
  #[#set math.equation(numbering: n => "(3.29)")
   $ parallel \( tilde(cal(A))_(b \, delta) - tilde(cal(A))_(0 \, 0) \) \( w \, lambda \) parallel lt.eq
     epsilon \( b \, delta \) \( parallel w parallel_(cal(D)_G) + \| lambda \| \) \, wide
     epsilon \( b \, delta \) arrow.r 0 . $ <lin:gaussian-perturbation>]
  The Gaussian block at $\( 0 \, 0 \)$ is invertible. A Neumann series therefore gives a uniform inverse for small
    parameters, holomorphic in complex $b$, on these fixed spaces.
  For real $b \, delta$, its domain is also the derivative-defined Gaussian $H^2$ domain on $S_b$ and controls the
    two moment terms. To see this directly, the compactly supported defect $Phi_b = upright(bold(H))_b +
    X^perp \/ 2$ gives the following divergence for the weight $e^(- \( 1 + delta \) \| X \|^2 \/ 4)$:
  $ "div"_(G \, b \, delta) X^top = 2 - frac(1 + delta, 2) \| X \|^2 + delta / 2 \| X^perp \|^2 +
    Phi_b dot.op X^perp . $
  The last two terms are uniformly bounded. The moment integrations in Lemma 4 therefore hold uniformly for this
    density. Together with (3.29) and its half-density domain,
    they identify the domain and give its $\| X \| nabla u$ and $\| X \|^2 u$ bounds.
    This establishes the real shifted estimate recorded after this proof,
    with the derivative of the nonzero base multiplier included.
  #emph[The mixed inverse for a fixed opening degree.] Fix $h gt.eq 4$ and a cylindrical rate $gamma > 2$.
    Choose the tail entrances far enough for this pair of parameters,
    absorbing the intervening finite collars into the compact norms.
    On the fixed real atlas let $cal(X)_(gamma \, h)$ consist of the compact norm (3.23),
    the cylindrical norms $X_(e^(gamma \( t - t_0 \)) \, h)$,
    and the original conical norms $X_h^(upright("con"))$, with the linear graph-unit identifications obtained by
    differentiating (3.28) on fixed collars. Let $cal(Y)_(gamma \, h)$ have the corresponding compact,
    cylindrical, and conical source norms. The full augmented derivative about $S_b$,
    written in these units and including the base compact multiplier derivative, satisfies
  #[#set math.equation(numbering: n => "(3.30)")
   $ cal(A)_b : cal(X)_(gamma \, h) xor bb(C)^m arrow.r cal(Y)_(gamma \, h) xor bb(C)^m quad
     upright("is an isomorphism for small ") b upright(", with analytic inverse.") $ <lin:mixed-polynomial-inverse>]
  The parameter neighborhood and its inverse bound may depend on $gamma \, h$.
    All spaces in this assertion are fixed real-coordinate spaces; the conical part is the bounded-link domain,
    not a growing-link space.
  Here is the proof. At $b = 0$, solve a zero-entrance exterior particular problem on each cylinder using Lemma 8
    at $gamma > 2$, where every slow channel is an entrance channel.
    Solve the original zero-entrance problem of Lemma 9 on each cone.
    Cut their normal lifts off on fixed far collars where $cal(Z)$ contains only the retained angular
    commutations, and denote the result by $u_(upright("ext"))$.
    Let $f_(upright("phys"))$ be the prescribed source in physical normal units,
    with the graph and row factors applied, and put $r_c = f_(upright("phys")) - L u_(upright("ext"))$.
    The exterior estimates and the fixed cutoff product estimates give
  $ parallel u_(upright("ext")) parallel_(cal(X)_(gamma \, h)) + parallel u_(upright("ext")) parallel_(H_G^2) +
    parallel r_c parallel_(C_h^0 \( K \)) + parallel r_c parallel_(L_G^2) + \| P u_(upright("ext")) \| lt.eq
    C_(gamma \, h) parallel f parallel_(cal(Y)_(gamma \, h)) \, $
  where $K$ is one fixed compact set containing the remainder support and the common compact observation and
    multiplier-source support. The Gaussian observation datum is the prescribed observation datum minus $P
    u_(upright("ext"))$. The Gaussian lift bounds on cylinders follow by summing their polynomial strip bounds
    against the Gaussian, and the conical lift and source bounds are those proved in Lemma 10.
    Solve this remaining compact source and the remaining observations by the Gaussian augmented block.
    Its solution $\( J_G \, lambda_G \)$ is bounded in $H_G^2 xor bb(C)^m$.
    On fixed nested compacts containing $K$, the commuted elliptic estimate applied to $L J_G = r_c -
    P^(*) lambda_G$ gives
  $ C_h^2 \( J_G \; K_(upright("core")) \) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel J_G parallel_(H_G^2) +
    parallel r_c parallel_(C_h^0 \( K \)) + \| lambda_G \| #scale(x: 120%, y: 120%)[\)] . $
  The smooth compact source columns account for the last term, which the Gaussian inverse already controls.
    On nested fixed collars outside $K$, the commuted local elliptic estimates bound the cylindrical $cal(T)^D$
    entrance traces and conical $H^(h + 3 \/ 2)$ entrance traces by
    $C \( parallel J_G parallel_(H_G^2) + parallel r_c parallel_(C_h^0 \( K \)) \)$.
    The polynomial Gaussian barrier and the separated estimate at $gamma >
    2$ now bound the entire cylindrical component by those traces; equivalently its expansion is (3.16).
    On a cone, Lemma 10 identifies $J_G$ with the conical entrance solution,
    whose full norm is bounded by its trace. These inequalities give the claimed real inverse bound for the full
    source spaces. In particular the cutoff source may be only compactly supported $L_G^2$;
    homogeneity near the farther entrance is what gives the smooth traces.
    Conversely an element of $cal(X)_(gamma \, h)$ has polynomial cylindrical local Sobolev bounds,
    and its conical normal lift lies in $H_G^2$ by Lemma 10’s lift calculation.
    Its Gaussian norm is finite, so the Gaussian block proves injectivity.
  For complex $b$ close to zero, keep exactly the same link displacement as domain variable on each conical tail.
    The full drift normalization is already part of $cal(C)^(upright("nl"))$,
    so its derivative at $v_b$ is directly a small analytic bounded perturbation from the fixed
    $X_h^(upright("con"))$ to $Y_h^(upright("con"))$. No global multiplication of the conical domain by a
    graph-speed factor is made. A further scalar row factor, if used,
    acts only on $Y_h^(upright("con"))$ and is an analytic bounded $L_t^oo H_theta^h$ multiplier.
    The factors $z a_n$ were used for the real Gaussian lift above,
    and on fixed collars their conversions are bounded in the compact norms.
    On each cylinder the prescribed rotation removes the tilt,
    and the small decaying remainder gives the same small normalized coefficient–module perturbation on the fixed
    weight $gamma$. The constant can depend on that weight. The cylindrical row and graph-speed ratios used to
    identify the $b$ and $0$ equations, and the scalar identifications on fixed collars,
    are analytic bounded multiplication maps in their strip or compact modules;
    all spatial coordinates remain the fixed real ones. On the compact support, the coefficients,
    base multiplier derivative, source columns, and observation maps are analytic bounded maps in their fixed
    commuted norms. It follows that
  $ b mapsto cal(A)_b in cal(B) \( cal(X)_(gamma \, h) xor bb(C)^m \, cal(Y)_(gamma \, h) xor bb(C)^m \) $
  is holomorphic in the full operator norm, including both finite-dimensional rows and columns,
    and $parallel cal(A)_b - cal(A)_0 parallel lt.eq C_(gamma \, h) \| b \|$ on a smaller ball.
    A Neumann series proves (3.30), including its analytic complex parameter dependence.
    This step supplies a polynomial norm for the coefficients;
    Gaussian-space analyticity alone would not supply that norm.
  At degree one, choose $gamma = 2 + epsilon.alt$ with $epsilon.alt >
    0$ small and apply this inverse to the prescribed $V_x$ observations.
    On a cylindrical tail write its equation as $cal(L)_(upright("cyl")) u_1 = - Q_b u_1$,
    where the normalized gain (3.15) for the rotated family is holomorphic in $b$ in its full operator norm.
    Choose its loss $eta_0 > 0$ so that $epsilon.alt + eta_0 < 1$,
    using the corresponding stronger realization of $S_b$ on its smaller parameter ball.
    Then $Q_b u_1$ belongs holomorphically to $Y_(e^(\( epsilon.alt + eta_0 \) \( t - t_0 \)) \, h)$.
    The fixed model variation-of-constants splitting is a bounded linear map from this source and the entrance
    trace of $u_1$ to the rate-$2$ coefficient, the two rate-$1$ coefficients,
    and a remainder of rate $epsilon.alt + eta_0$. Every fast outward mode is excluded by the polynomial domain.
    The trace map is bounded on $cal(X)_(gamma \, h)$, so this splitting proves analytic dependence of the opening
    and tilt coefficients without assuming them in advance. The two small losses can be chosen below any specified
    remainder loss in (3.25). At $b = 0$ the resulting opening matrix is the isomorphism on $V_x$,
    so it stays invertible. With the normalization $c_j = beta_j \/ sqrt(2)$ it is $M \( b \)$ in (3.25).
    Removing the first-order tilt gives the displayed remainder.
  Now suppose all opening coefficients of degree below $n$ have been constructed in prescribed charts.
    Their cylindrical source is controlled directly by the weighted coefficient–module rule,
    before any pointwise regularity bootstrap. On a strip put
  $ cal(J)_1 v = \( v \, v_theta \, mu v_t \) \, wide cal(J)_2
    v = \( mu^2 \( v_(t t) - v_t \) \, mu v_(t theta) \, v_(theta theta) \) . $
  For $v in X_(rho \, h)$ the first tuple has algebra trace norm at most $C rho parallel v
    parallel_(X_(rho \, h))$, and the second has bulk norm at most the same quantity.
    Each formal coefficient of the radial equation is a finite sum of products of first tuples and at most one
    second tuple, with bounded analytic background coefficients.
    The product rule therefore puts a monomial with input weights $rho_1 \, dots.h \,
    rho_j$ in the source weight $rho_1 dots.h.c rho_j$, with norm bounded by the product of the input norms.
    The lower terms use one first-derivative factor in bulk and obey the same bound.
    Choose a fixed $gamma > 2$ above the finitely many resulting power exponents,
    allowing a small extra power for logarithms. On a conical end, keep every coefficient in the link variable.
    The conical source at degree $alpha_0$ is a finite sum of terms
  #[#set math.equation(numbering: n => "(3.31)")
   $ - frac(1, j !) D^j cal(C)^(upright("nl")) \( v_b \) \[ v_(alpha_1) \, dots.h \, v_(alpha_j) \] \, wide
     j gt.eq 2 \, quad alpha_1 + dots.h.c + alpha_j = alpha_0 \, quad \| alpha_i \| gt.eq
     1 . $ <lin:conical-jet-source>]
  The analytic map $cal(C)^(upright("nl")) : X_h^(upright("con")) arrow.r
    Y_h^(upright("con"))$ has bounded multilinear derivatives on a small ball.
    Every term in (3.31) therefore belongs to $Y_h^(upright("con"))$,
    with a bound by the product of the lower $X_h^(upright("con"))$ norms, and is analytic in $b$.
    The compact source has the analogous finite Taylor bound.
    Equation (3.30), with the prescribed coefficient of (3.27), now gives the unique coefficient of degree $n$.
    In particular its conical link coefficient again belongs to $X_h^(upright("con"))$.
    The chosen cylindrical weight and the small complex $b$-ball may change with $n$.
    This is precisely the coefficientwise analyticity required by $bb(R) { b } \[ \[ x \] \]$.
  The following local argument closes the derivative part of this induction at each degree.
    Cylindrical bounds follow from the commuted separated estimates,
    increasing the weight and angular order by a fixed amount when needed.
    On a conical unit log strip at height $z$, the $X_h^(upright("con"))$ norm initially bounds the local second
    derivatives by a fixed multiple of $z$, and bounds the first traces.
    After division by $mu^2$, a coefficient equation has uniformly elliptic principal matrix and a first-order
    drift of size $O \( z^2 \)$; all fixed derivatives of its other coefficients are bounded by the family
    regularity already proved. Commuted local elliptic estimates on nested fixed log patches,
    with interpolation to absorb the first-order term, therefore have constants bounded by a fixed power of $z$ at
    every fixed order. This follows inductively because each commutation differentiates a coefficient a finite
    number of times, and the only growing coefficient and its derivatives are $O \( z^2 \)$.
    The source at degree $n$ is a finite product of lower-degree derivatives.
    Starting from the preceding local $H^2$ bound, induction on degree and on the local elliptic order gives
    polynomial local Sobolev bounds for every fixed derivative.
    Sobolev embedding gives the corresponding pointwise bounds.
    These bounds are uniform on a closed smaller degree-dependent complex $b$-ball;
    fixed coordinate differentiation and locally bounded holomorphy give the same statement for parameter derivatives.
  The conversion to normal jets is coefficientwise. On a real scaled annulus choose a local projection branch and
    use its normal chart to write the equality between the prescribed graph parametrization and a normal graph
    with an unknown real tangential displacement. At $x = 0$ this displacement is zero.
    At a fixed $x$ degree, expand that equality at the identity using only the finitely many spatial derivatives
    of the lower jets and of $S_b$ which occur at that degree.
    The pointwise matrix formed by the tangent vectors and the normal is invertible.
    On a conical annulus, scale the ambient and normal variables by its radius;
    the matrix and its inverse are then uniformly bounded in the two link coordinates.
    On a cylindrical tail the axial and angular tangent scales are different in log coordinates:
    the axial tangent has size comparable to $z$ and the angular tangent has size comparable to one.
    The prescribed cylinder charts therefore give an inverse with at most a fixed polynomial factor in $z$;
    on compact charts it is uniformly bounded. Solving this matrix equation gives the tangential coefficient and
    the normal coefficient at that degree. The local polynomial bounds just proved give polynomial bounds for
    these coefficients and all fixed derivatives. Differentiating the finite real identities in $b$ gives the same
    fixed-order polynomial bounds for their parameter derivatives.
    For real parameters the ordinary smooth implicit function theorem and Taylor’s theorem on the chosen
    projection branch identify these finite coefficients and the corresponding remainder with the actual normal
    conversion. More quantitatively, let $v_M^(upright("pres")) \( b \, x \)$ be the finite prescribed graph
    polynomial through degree $M$, let $v_M^(upright("nor")) \( b \, x \)$ be its coefficientwise normal
    polynomial, and write $frak(n)_b$ for the actual normal-height conversion for real parameters.
    Wherever its scalar values lie in the chart domain, the first polynomial represents the exact immersion $y
    mapsto Psi_b \( y \, v_M^(upright("pres")) \( b \, x \) \( y \) \)$;
    its fixed-overlap identifications agree exactly by (3.28).
    For the separated family, work on an inner patch whose inverse projection stays in a controlled larger collar
    on the chosen branch. Suppose that throughout this larger collar, for every parameter on the segment ${ t x :
    0 lt.eq t lt.eq 1 }$, the physical graph displacement stays within a fixed fraction of the local tubular
    radius and its first derivative is correspondingly small in the reference metric.
    Then the projection derivatives through any chosen finite order have at most a fixed polynomial cost in
    $r = \| X \|$. Taylor’s theorem in the finite variable $x$, applied to the smooth real projection equation,
    therefore gives for every fixed spatial order $j$
  #[#set math.equation(numbering: n => "(3.32)")
   $
     lr(|nabla_(S_b)^j #scale(x: 120%, y: 120%)[\(] frak(n)_b \( v_M^(upright("pres")) \( b \, x \) \) -
     v_M^(upright("nor")) \( b \, x \) #scale(x: 120%, y: 120%)[\)]|) lt.eq C_(M \, j) \| x \|^(M + 1) \( 1 +
     r \)^(D_(M \, j)) . $ <lin:normal-conversion-remainder>]
  The constants are uniform on a closed smaller real $b$-ball and on such inner patches with the stated collar and
    tubular controls. The complex parameter assertions are made for the prescribed-coordinate jets,
    where they were proved by the mixed inverse; the action is computed in those coordinates.
  #emph[The formal action.] Each fixed action coefficient is a polynomially bounded combination of the finite
    graph jets and their first derivatives times the Gaussian.
    On a sufficiently small degree-dependent complex $b$-ball,
    the prescribed tilted and conical immersions satisfy $"Re" \( F_b dot.op F_b \) gt.eq c r^2 - C$.
    Gaussian domination permits coefficientwise integration and differentiation in $b$.
    In the formal first variation on exhausted domains, the boundary terms are polynomially bounded times a
    Gaussian and tend to zero. The plus normalization in (3.4) gives $d cal(F) = lambda dot.op d sans(P)$,
    proving (3.26). The same bounds control every fixed truncation.
    The augmented coefficient equations are unique in the mixed spaces.
    To see uniqueness among all formal solutions with polynomial growth,
    take the first degree at which two such solutions differ.
    Their lower sources and observation coefficients agree, so the difference solves the homogeneous full
    augmented derivative about $S_b$. At this degree its prescribed graph difference converts linearly to a
    polynomially growing physical normal scalar on the fixed real atlas.
    Local elliptic estimates for the homogeneous equation give polynomial bounds for its first two derivatives as
    well. After the analytic half-density conjugation it belongs to $cal(D)_G$, also for small complex $b$.
    The full augmented Gaussian inverse proved before the jets kills this difference and its multiplier.
    Induction proves uniqueness in the stated polynomial class.
    For real parameters the finite normal-coordinate identities above identify the same geometric jets;
    their action coefficients are those computed in the prescribed charts. ◻
]

#thm([Corollary 3.11.])[
  (Uniform shifted Gaussian comparison).  #emph[Let $L_b^(upright("norm"))$ denote the derivative of (3.4) about
    $S_b$, including derivatives of its compact multiplier terms.
    For real $b$ sufficiently small and real $\| delta \|$ sufficiently small, put $d gamma_(b \, delta) =
    exp \( - \( 1 + delta \) \| X \|^2 \/ 4 \) d A_(S_b)$. There is a constant independent of these parameters such that
#[#set math.equation(numbering: n => "(3.33)")
 $ parallel u parallel_(H_(G \, b \, delta)^2) + \| lambda \| lt.eq
   C (∥L_b^(upright("norm")) u + sum_i lambda_i chi_(i \, b)∥_(L_(G \, b \, delta)^2) + \| D P_b u \|) .
   $ <lin:shifted-estimate>]

 The domain also controls $\| X \| nabla u$ and $\| X \|^2 u$ in this weight.
   For complex $b$, the corresponding inverse is the analytic inverse on the fixed pulled-back half-density spaces
   described in the proof of Proposition 13.]
] <lin:shifted-gaussian>

#proof[
  The inverse was established before the opening-jet construction in (3.29).
    For real parameters its half-density identification is unitary in the displayed positive measure,
    and the moment calculation there identifies its domain with $H_(G \, b \, delta)^2$ and gives the two
    additional moment bounds. Conjugating that inverse back proves (3.33).
    All parameter perturbations are fixed before any later localization radius is allowed to increase. ◻
]

=== 3.6 Finite Taylor graphs and a real normalized comparison <finite-taylor-graphs-and-a-real-normalized-comparison>

The formal opening family has two later uses. Real stopped surfaces must have the same action coefficients,
  and actual flow slices must be compared with a fixed truncation.
  Both uses follow from the same local augmented estimate. We give it here,
  after the inverse on the reference family has been established.

For this subsection take the separated end list of 3. The real family then has the uniform normal tubular
  neighborhood supplied by the family construction. This is the geometry used by both later applications.

Write $p = \( b \, x \)$ for the reduced coordinates and $q = sans(P) \( p \)$ for the compact observation values.
  The observation functional on a graph is still denoted by $P$. On a real normal graph of height $v$ over $S_b$, put

$ cal(N)_b \( v \, lambda \) = cal(Q)_b \( v \) + cal(C)_b \( v \) lambda . $

Here $cal(Q)_b$ is the scalar pullback of the shrinker defect and $cal(C)_b \( v \)$ is its compact variational
  source map. Thus this is the sign convention of (3.4). Put $lambda_b = lambda \( b \, 0 \)$, $A_b =
  D_v cal(N)_b \( 0 \, lambda_b \)$, and $C_b = cal(C)_b \( 0 \)$.
  In particular $A_b$ includes the derivative of the compact source at the generally noncritical member $S_b$.

For $a$ sufficiently close to $1$, let $L_a^2 \( S_b \)$ use $e^(- a \| Y \|^2 \/ 4) d A_(S_b)$ and set

#[#set math.equation(numbering: n => "(3.34)")
 $ parallel v parallel_(cal(H)_a^2)^2 =
   integral_(S_b) (\| nabla^2 v \|^2 + \( 1 + \| Y \| \)^2 \| nabla v \|^2 + \( 1 + \| Y \| \)^4 \| v \|^2)
   e^(- a \| Y \|^2 \/ 4) d A_(S_b) . $ <ref:weighted-H2>]

Corollary 14 gives, uniformly on a fixed small closed real $b$-neighborhood,

#[#set math.equation(numbering: n => "(3.35)")
 $ cal(A)_b \( v \, ell \) & = \( A_b v + C_b ell \, D P_b v \) \,\
parallel v parallel_(cal(H)_a^2) + \| ell \| & lt.eq C parallel cal(A)_b \( v \, ell \)
  parallel_(L_a^2 times bb(R)^(dim q)) . $ <ref:augmented-comparison>]

The normal charts and the observation support are fixed on every compact set involved below.

#thm([Lemma 3.12.])[
  (Finite Taylor graphs).  #emph[For every fixed $M gt.eq 1$,
    let $v^(\( M \)) \( b \, x \)$ be the coefficientwise real normal-height polynomial through degree $M$ in the
    opening variables, let $lambda_M$ be the multiplier polynomial,
    and let $f_M$ be the same truncation of $cal(F)$. On a smaller closed real $b$-neighborhood,
    each fixed spatial and real parameter derivative of the normal coefficients is bounded by a fixed polynomial
    in $1 + \| Y \|$. The multiplier and action polynomials retain the analytic $b$ dependence of the
    prescribed-coordinate jets. For real parameters, $lambda_M - lambda_b = O \( \| x \| \)$.]
  #emph[On every region where the absolute sum of the finite nonconstant height terms and their first two spatial
    derivatives is sufficiently small, the normalized equation of $v^(\( M \))$ has an $L_a^2$ remainder at most
    $C_M \| x \|^(M + 1)$. When the region contains the observation support,
    its observation error is at most $C_M \| x \|^(M + 1)$. The corresponding local area integral differs by at
    most $C_M \| x \|^(M + 1)$ from the integral of the normal-coordinate density coefficients determined by those
    finite normal jets through degree $M$ on that region. Their complete integrals sum to $f_M$ for real
    parameters, and these normal density coefficients have Gaussian tails bounded by $C_M \( 1 + r \)^(d_M)
    e^(- c_M r^2)$ outside $\| Y \| lt.eq r$.]
  #emph[There is also a globally small real normal graph $T_M$,
    with height $tilde(v)_M$ obtained by cutting off $v^(\( M \))$ at a radius $\| x \|^(- sigma_M)$,
    and with $T_M = S_b$ when $x = 0$, for which
#[#set math.equation(numbering: n => "(3.36)")
 $ parallel cal(N)_b \( tilde(v)_M \, lambda_M \) parallel_(L_a^2) & lt.eq C_M \| x \|^(M + 1) \,\
\| P \( T_M \) - sans(P) \( p \) \| + \| F \( T_M \) - f_M \( p \) \| & lt.eq C_M \| x \|^(M + 1) \,\
\| nabla_p f_M \( p \) - J \( p \)^(sans(T)) lambda_M \( p \) \| & lt.eq C_M \| x \|^M \, wide J =
  D_p sans(P) . $ <ref:taylor-equation>]

 Its normal height has $C^2$ norm $O \( \| x \|^(1 \/ 2) \)$.
   The finitely many weights $a$ and spatial orders needed in an application are fixed before $sigma_M$ is chosen.]
] <ref:finite-taylor>

#proof[
  The coefficient equations and their polynomial bounds are those of Proposition 13,
    including its coefficientwise conversion to normal graph variables.
    The stated absolute smallness keeps every intermediate finite polynomial at $\( b \, t x \)$, $0 lt.eq t lt.eq
    1$, in the same normal graph neighborhood. On such a region,
    Taylor’s formula for the pointwise geometric graph formula leaves $\|
    x \|^(M + 1)$ times a fixed polynomial in $1 + \| Y \|$. That formula is analytic in height and first
    derivatives and affine in the highest second derivatives,
    so the local coefficient–module estimates apply to the same derivatives as in the formal equations.
    The compact observation and source maps after the real graph conversion need only be smooth:
    their bounded derivatives through the fixed order $M + 1$ give the corresponding finite Taylor remainders on
    their fixed support. Gaussian integration proves the equation estimate,
    and the compact Taylor formula proves the observation estimate.
  Expand the normal-coordinate graph area density, including its Gaussian, in the finite opening variables.
    Every fixed coefficient is a polynomially bounded function times a Gaussian, by the family estimates.
    The finite formal change of variables between the prescribed and normal coordinates identifies their complete
    coefficient integrals: on an exhaustion, the change of local density contributes the corresponding boundary
    divergence, whose polynomial Gaussian boundary terms vanish at infinity.
    The resulting complete normal-coordinate integrals are the coefficients of $f_M$.
    The local Taylor comparison uses these normal-coordinate densities and their own tails.
    On a real small normal graph its Taylor remainder is again $\|
    x \|^(M + 1)$ times a fixed polynomial and a slightly weaker Gaussian.
    This proves the local area assertion and the coefficient-tail bound.
    This assertion concerns the density coefficients on the complete $S_b$;
    it does not treat an uncut polynomial graph as a complete immersed surface.
  Choose $D_M$ to bound the growth of the finite height coefficients and all their derivatives through order two,
    and any higher fixed orders used in the application. Take $sigma_M D_M < 1 \/ 2$ and cut off at $\| Y \|
    asymp \| x \|^(- sigma_M)$. Every nonconstant term and these derivatives are then $O \( \| x \|^(1 \/ 2) \)$.
    The cutoff commutators are supported at that polynomial radius and have Gaussian norm smaller than every fixed
    power of $\| x \|$. The interior Taylor estimates just proved give (3.36) and (3.36).
    Coefficientwise first variation in (3.26) gives (3.36); an $x$ derivative can lower the remainder degree by
    one. No differentiation of the cutoff with respect to $x$ is used,
    and the cut-off graph is not asserted to be analytic in $x$. ◻
]

#thm([Lemma 3.13.])[
  (Localized comparison of real normalized graphs).  #emph[Fix $M$, an admissible weight $a$,
    and $0 < theta.alt < 1$, and take real $\( b \, x \)$ in the stated neighborhood with $\|
    x \|$ sufficiently small. Let $R$ be large enough that the observation support lies in $\| Y \| < theta.alt
    R$, and let $chi_R$ equal one there and on $\| Y \| lt.eq theta.alt R$, vanish before $\| Y \| = R$,
    and satisfy derivative bounds $C_(j \, theta.alt) R^(- j)$.
    Let $u$ be a smooth real normal graph over $S_b$ on $\| Y \| < R$, with sufficiently small height and slope.
    Let $v$ be either $v^(\( M \))$ in the coefficientwise smallness regime of Lemma 15 or the height of $T_M$,
    and require its $C^2$ norm there to be sufficiently small. For an arbitrary real multiplier $lambda_U$, put
$ r_U = cal(N)_b \( u \, lambda_U \) \, wide e_P = P \( u \) - sans(P) \( p \) \, wide w = chi_R \( u - v \) \,
  wide ell = lambda_U - lambda_M \, $

 and define the annular error
$ frak(a)_R = ∥\( 1 + \| Y \| \) \| nabla \( u - v \) \| + \( 1 + \| Y \| \)^2 \| u -
  v \|∥_(L_a^2 \( { theta.alt R < \| Y \| < R } \)) . $

 Then
#[#set math.equation(numbering: n => "(3.37)")
 $ parallel w parallel_(cal(H)_a^2) + \| ell \| lt.eq C_(M \, theta.alt)
   (parallel chi_R r_U parallel_(L_a^2) + \| e_P \| + \| x \|^(M + 1) + frak(a)_R) . $ <ref:real-comparison-estimate>]

 The constants are uniform for $b$ in the fixed closed real neighborhood.
   In particular, a polynomial bound for the height and its first derivative on the annulus makes $frak(a)_R lt.eq
   C \( 1 + R \)^d e^(- c R^2)$, where one may take any $c < a theta.alt^2 \/ 8$ after absorbing the polynomial factor.]
  #emph[Suppose also that the graph represents the entire part of a real surface $U$ used inside $\| Y \| lt.eq
    theta.alt R$, and that the absolute action of its omitted part is at most $tau_(theta.alt R)$. Then
#[#set math.equation(numbering: n => "(3.38)")
 $ \| F \( U \) - f_M \( p \) \| lt.eq C_M (parallel w parallel_(cal(H)_a^2) + \| x \|^(M + 1)) +
   tau_(theta.alt R) + C_(M \, theta.alt) \( 1 + R \)^(d_M) e^(- c_(M \, theta.alt) R^2) . $ <ref:real-action-estimate>]

 For this last conclusion $a$ is chosen so that $a < 2 c$ for a Gaussian exponent $c$ retained by the small real
   graph densities.]
] <ref:real-comparison>

#proof[
  Write $r_M = cal(N)_b \( v \, lambda_M \)$. Before linearization, the exact subtraction is
  $ & cal(Q)_b \( u \) - cal(Q)_b \( v \) + \( cal(C)_b \( u \) - cal(C)_b \( v \) \) lambda_b + C_b ell\
 & quad = r_U -
   r_M - \( cal(C)_b \( u \) - C_b \) ell - \( cal(C)_b \( u \) - cal(C)_b \( v \) \) \( lambda_M - lambda_b \) . $
  Subtract $A_b \( u - v \)$ from the first line. In the quasilinear principal part retain the coefficients
    evaluated on $u$ on the second derivatives of $u - v$. Their difference from the coefficients of $A_b$ is
    small by the height and slope tolerance. The remaining coefficient differences multiply the second derivatives
    of $v$, and their bound is small because $v$ is $C^2$-small.
    The lower terms are controlled in the weighted slots of (3.34).
    This arrangement uses no bound for the second derivatives of $u$.
  On the compact source support, $cal(C)_b \( u \) - C_b$ is a small bounded map,
    so its product with the unknown $ell$ is absorbed in (3.35).
    The last term in the identity is a small map on $u - v$, since $lambda_M - lambda_b = O \( \| x \| \)$.
    This argument does not need an a priori bound for $lambda_U$.
    The observation equation, with $chi_R = 1$ on its support, gives
  $ \| D P_b w \| lt.eq \| e_P \| + C_M \| x \|^(M + 1) + epsilon parallel w parallel_(cal(H)_a^2) . $
  Multiplication by $chi_R$ creates only height and first-derivative commutators on its annulus.
    The coefficients of the normal graph equation and its drift have at most the polynomial growth measured by
    $frak(a)_R$. Apply (3.35), use Lemma 15 for $r_M$, and absorb all the small terms. This proves (3.37).
  For the action assertion, interpolate the real graphs $v + tau w$, $0 lt.eq tau lt.eq 1$, on $\| Y \| < R$;
    the variation $w$ is compactly supported there. In the normal tubular neighborhood,
    the derivative of their area density obeys
  $ \| D cal(L)_(v + tau w) \[ w \] \| lt.eq C \( 1 + \| Y \| \)^d
    e^(- c \| Y \|^2 \/ 4) \( \| w \| + \| nabla w \| \) . $
  The uniform bound for $Y^perp$ on the real family and the small height and slope give the retained exponent $c$
    and the polynomial prefactor. Gaussian Cauchy–Schwarz with $a < 2 c$ bounds its integral by $C parallel w
    parallel_(cal(H)_a^2)$. This direct density estimate does not use stationarity of either graph.
    On $\| Y \| lt.eq theta.alt R$ the interpolated endpoint is $u$;
    on the transition annulus all three small graph densities have Gaussian tails.
    Compare the other endpoint with the integrated finite coefficient densities by Lemma 15,
    and add their full-surface tail and the omitted action $tau_(theta.alt R)$ of $U$. The result is (3.38). ◻
]

== 4 Two lateral stationary actions <sec:arrays>

For the tangent section fixed in 2, use the normalized family and its polynomial-growth jets from Proposition 13.
  The reduced coordinates are $p = \( b \, x \)$, and the compact observation values are $q = sans(P) \( p \)$,
  with invertible Jacobian $J = D_p sans(P)$. A normalized surface has compact-source multiplier $lambda$.
  Thus its interior first variation is $lambda dot.op d q$, and the formal action satisfies

$ d cal(F) \( p \) = lambda_(upright("formal")) dot.op d sans(P) \( p \) \, wide nabla_p cal(F) =
  J^(sans(T)) lambda_(upright("formal")) . $

All pairings and induced metrics in the complex construction are bilinear.
  Square roots are continued from the positive real area element.
  The observation charts remain fixed on the support of the observations.

Suppose, for a contradiction to the obstruction to be proved below, that there is a real formal arc

#[#set math.equation(numbering: n => "(4.1)")
 $ hat(p) \( s \) = \( hat(b) \( s \) \, hat(x) \( s \) \) \, wide nabla cal(F) \( hat(p) \( s \) \) = 0 \, wide
   hat(x) \( s \) = s^k v + O \( s^(k + 1) \) \, quad v eq.not 0 \, quad k gt.eq 1 . $ <arr:critical-arc>]

Its center is $0$. Formal differentiation shows also that $cal(F) \( hat(p) \( s \) \) = cal(F) \( 0 \)$.
  Put $a = s^k$, retaining a continuous argument of $s$, and put $B = \| a \|^(- 1 \/ 2)$.
  There is no assertion of single-valuedness in $a$. Here $beta_j \( b \, x \)$ is the first-jet opening
  coefficient, homogeneous linear in $x$ for fixed $b$, with analytic $b$-dependent coefficients.
  The leading coefficients along the arc are $beta_j \( hat(p) \( s \) \) = c_j a + o \( a \)$,
  with $c_j in bb(R)$. At least one $c_j$ is nonzero.

On a chosen evaluation ray, call an end #emph[adverse] when its leading opening $c_j a$ is negative real,
  so the circular profile $R_c \( z \) = sqrt(2 \( 1 + beta_j z^2 \))$ reaches radius zero at a positive leading
  squared height $Z_(j \, upright("lead"))^2 = \( - c_j a \)^(- 1)$.
  Nearby complex rays retain the same adverse end list. On all these rays define the positive leading action scale by

#[#set math.equation(numbering: n => "(4.2)")
 $ A_(upright("lead")) = min_(upright("adverse") med j) frac(\| Z_(j \, upright("lead")) \|^2, 4) . $ <arr:A0>]

The construction uses three actual objects. Real stopped actions $F_H$ are holomorphic on full shrinking parameter
  disks and identify the Gaussian formal action through a telescoping estimate and the real comparison above.
  The two lateral actions $G_(+)$ and $G_(-)$ come from normalized solves on opposite bypasses of the adverse zero
  radius. Finally, regular implicit operations select parameters $p_(+)$ and $p_(-)$ that realize the formal
  critical constraints to exponential accuracy. Endpoint comparison and Taylor transport put the two actions at
  one common parameter, with the upper bound in 31. The collapsing-end calculation will give a conflicting lower bound.

Here is the order of the stationary choices. Fix the arc and a continuous argument of $s$;
  both lateral evaluations use the same $s$-sheet. When all nonzero $c_j$ are positive,
  the adverse evaluation starts at $arg s = pi \/ k$, including even $k$.
  Prescribe a finite required accuracy $K$, then choose the contour constant $D$ sufficiently large.
  Its excess angle $delta = eta D^(- 1 \/ 2)$ and strict margins are held fixed as $s arrow.r 0$;
  a larger $K$ may require a new $D$. The relevant statements are Lemma 4.1, Lemma 4.14 and (4.55).

=== 4.1 Strict contours and their homotopies <sec:contours>

The circular comparison profile on a cylindrical end is

$ R_c \( z \) = sqrt(2 \( 1 + beta z^2 \)) . $

After division by the drift coefficient, the leading radial and angular diffusion coefficients on a parametrized
  path have positive real parts precisely when, with fixed strict margins,

#[#set math.equation(numbering: n => "(4.3)")
 $ "Re" d \( z^2 \) > 0 \, wide d log lr(|frac(z^2, 1 + beta z^2)|) > 0 . $ <arr:path-signs>]

Indeed, with real path parameter $tau$, those coefficients are $D_r = 2 \/ \( z z_tau \) =
  4 \/ \( z^2 \)_tau$ and $D_theta = 2 z_tau \/ \( z R_c^2 \)$.
  The logarithmic derivative in (4.3) is $2 "Re" D_theta$. The exact circular axial-slope coefficients differ by
  $O \( B^(- 2) \)$ on fixed nondegenerate scaled bands, and preserve the strict signs.
  These statements concern the drift-normalized equation on a real parameter interval,
  not continuation of unknown smooth spatial data.

#thm([Lemma 4.1.])[
  (Admissible contour families).  #emph[Fix the finite list of nonzero leading opening coefficients.
    For every sufficiently large fixed $D$, there are upper and lower families of contours on sectors of the
    $a$-cover containing, respectively, the argument intervals $\[ 0 \, pi \]$ and $\[ - pi \, 0 \]$,
    with excess angle $delta = eta D^(- 1 \/ 2)$, where $eta > 0$ is fixed sufficiently small.
    The contours start on the real axis, satisfy (4.3) strictly, avoid $1 + beta z^2 = 0$, and end at $"Re" z^2 =
    D \/ \| a \|$. They obey $\| a \| \| z \|^2 lt.eq C_D$. Their normalized derivatives and the inverse diffusion
    margins are bounded by constants depending on $D$.]
  #emph[The families can be chosen smooth in sector parameters.
    As geometric paths they admit shortening, deformation before an adverse pole to a common real contour with
    endpoint at three quarters of the leading squared pole height,
    and deformation beyond that pole to the height turns used in the jump calculation.
    The bounded scaled part of these homotopies can be kept in $\| R_c \| gt.eq r_(*)$ for a fixed $r_(*) > 0$.
    The homothetic turns with shrinking $\| R_c \|$ retain the displayed geometric signs,
    but their solutions will be constructed in the separate height norms of 5.
    Boundary data are specified by the solve statements below, not by this geometric lemma.
    These assertions persist in sufficiently small polynomial-radius complex balls about any fixed high-order
    polynomial approximation to $hat(p)$.]
] <arr:contours>

#proof[
  Scale $z^2$ by $\| a \|$ and the absolute leading coefficient so that the leading pole is $p_(*)$,
    with $\| p_(*) \| = 1$. For the lower bypass write $u = h - i Y \( h \)$, $h' > 0$, and choose real $c \,
    d$ by $"Re" \( u \/ p_(*) \) = c h + d Y$; thus $c^2 + d^2 = 1$. Put $Q = h^2 + Y^2$. The exact identity
  $ frac(\| u - p_(*) \|^2, \| u \|^2) = 1 - 2 H \, wide H = frac(c h + d Y - 1 / 2, Q) \, $
  shows that the second condition in (4.3) is $H' > 0$. Direct differentiation gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ Q^2 H' = N = c A + d J + h + Y Y' \, quad A = Y^2 - h^2 - 2 h Y Y' \, quad J = \( h^2 - Y^2 \) Y' -
     2 h Y . $ <arr:contour-numerator>]
  The first condition is simply $d h > 0$.
  Near the adverse direction let $e = 4 delta$, $0 < e lt.eq 0.1$, and take the positive branch
  $ \| d \| lt.eq e \/ 2 \, wide c = sqrt(1 - d^2) gt.eq sqrt(1 - e^2 \/ 4) . $
  Join the origin to $\( h_0 \, Y_0 \) = \( 1 \/ 4 \, thin 0.6 \/ e \)$ by the ray $Y = m h$, $m = 2.4 \/ e$.
    On this ray
  $ N = \( 1 + m^2 \) h { 1 - \( c + d m \) h } . $
  For $c lt.eq 1$ and $\| d \| lt.eq e \/ 2$, its worst endpoint projection is $1 \/ 4 + 0.3 = 0.55 < 1$.
    From $\( h_0 \, Y_0 \)$ follow the larger positive root of
  #[#set math.equation(numbering: n => "(4.5)")
   $ K \( h^2 + Y^2 \) = h + e Y - 1 / 2 \, wide K = frac(0.35, 0.0625 + 0.36 \/ e^2) . $ <arr:circle>]
  Here $0.970 < K \/ e^2 < 0.973$, and
  $ Y' = frac(1 - 2 K h, 2 K Y - e) > 0 quad upright("for ") quad 1 \/ 4 lt.eq h lt.eq 0.01 \/ e^2 . $
  The denominator is positive at the starting point and remains positive on this branch.
    If $h lt.eq 1$, then $Y gt.eq 0.6 \/ e gt.eq 6 > h$. If $h gt.eq 1$, the circle identity implies
  $ K Y^2 gt.eq h - 1 / 2 - K h^2 gt.eq 0.49 h \, wide Y / h gt.eq sqrt(frac(0.49, K h)) > 7 . $
  Consequently $J < 0$. The circle has $N \( 1 \, e \) = 0$;
    eliminating $A$ from (4.4) gives the decisive exact identity
  #[#set math.equation(numbering: n => "(4.6)")
   $ N \( c \, d \) = \( 1 - c \) \( h + Y Y' \) + \( d - c e \) J > 0 . $ <arr:circle-strict>]
  Both terms are nonnegative and the second is positive, since $c e > d$.
    Thus a level circle for the auxiliary parameters gives strict increase for every actual pole parameter under
    consideration.
  If the absolute nonzero leading coefficients are $b_j > 0$, the required horizontal endpoint is $h = b_j D$.
    The choice
  $ 16 eta^2 max_j b_j < 0.01 $
  places every such endpoint in the circle interval. This proves the claimed $D^(- 1 \/ 2)$ angular reach.
    Constants such as the imaginary height are allowed to depend on the now fixed $D$.
  We give the blending argument, since endpoints alone do not suffice for subsequent action comparisons.
    On the circle define
  $ Q_c = c Y^2 + \( 1 - 2 c h \) Y Y' . $
  Equation (4.5) gives
  $ Q_1 = frac(Y { e Y + 2 K h \( h - 1 \) }, 2 K Y - e) > 0 \, wide Q_c = c Q_1 + \( 1 - c \) Y Y' > 0 . $
  For $h lt.eq 1$, use $e Y gt.eq 0.6$ and $2 K h \( h - 1 \) gt.eq - K \/ 2$; for $h gt.eq
    1$ positivity is immediate. At $d = 0$, replacing $Y$ by $t Y$, $t gt.eq 1$,
    changes the numerator to $h \( 1 - c h \) + t^2 Q_c$, which is positive at $t = 1$ and increases.
    On the favorable overlap $d lt.eq - delta \/ 2$, the extra contribution $d J_t$ is positive.
    Hence arbitrary fixed magnification of $Y$ preserves admissibility.
    On a fixed compact interval write a magnified profile as $Y = M f \( h \)$.
    Interpolate $f$ to a positive increasing ray profile, keeping both $f$ and $f'$ bounded below.
    The favorable contribution is
  $ \| d \| M^3 f^2 f' + O \( M \) \, $
  while the remaining terms are $O \( M^2 \)$. A sufficiently large fixed $M$ makes the entire interpolation
    admissible. Initial pieces may already be rays. Away from the adverse direction,
    a ray with $"Re" d u > 0$ and $"Re" \( u \/ p_(*) \) < 0$ works:
    for $p_(*) = e^(i phi)$, $0 < phi < pi$, take $u = h \( 1 - i m \)$ with $cos phi - m sin phi < 0$.
    This joins the favorable overlap. Reflection supplies the other family.
    At every join the strict conditions are linear in the tangent vector at the point,
    so smoothing corners preserves them. Near $u = 0$ the logarithmic condition reduces to increasing modulus,
    and the start can be made real.
  For a real leading adverse pole, set $V = Y^2$. Formula (4.4) becomes
  #[#set math.equation(numbering: n => "(4.7)")
   $ N \( V \) = h \( 1 - h \) + V + \( 1 / 2 - h \) V' . $ <arr:affine-homotopy>]
  On $0 < h lt.eq 3 \/ 4$, scaling $V$ to $t V$, $0 lt.eq t lt.eq 1$,
    gives $N \( t V \) = \( 1 - t \) h \( 1 - h \) + t N \( V \) > 0$.
    This is an actual common-real-contour homotopy. Beyond the pole,
    convex interpolation of two admissible $V$-profiles with a common horizontal endpoint preserves the inequality
    and avoids the pole provided both profiles are positive at $h = 1$.
    Any zero-height portion lies strictly before the pole, where the positive real-ray margin permits smoothing
    the square-root parametrization in both variables.
  For clarity, the required small-radius turn can be written explicitly. In $q = r^2$, take
  $ q \( theta.alt \) = rho e^(\( - sigma_(upright("sp")) + i \) theta.alt) \, wide 0 lt.eq theta.alt lt.eq
    2 pi \/ 3 \, wide sigma_(upright("sp")) = 1 \/ 4 . $
  Its modulus decreases and
  $ frac(d, d theta.alt) "Re" q = - \| q \| \( sigma_(upright("sp")) cos theta.alt + sin theta.alt \) < 0 . $
  Under $u = 1 - q \/ 2$, the exact other sign is
  $ frac(d, d theta.alt) log lr(|frac(u, 1 - u)|) = "Re" frac(sigma_(upright("sp")) - i, 1 - q \/ 2) > 0 $
  for small fixed $rho$. The terminal real part is $- \| q \| \/ 2$.
    Scale $rho$ to obtain the homothetic shrinking turns. A small preliminary phase correction has the form $q =
    q_0 e^(- t + i psi \( t \))$; when $psi \, psi'$ are small,
  $ "Re" frac(d log r, d t) = - 1 / 2 \, wide "Re" #scale(x: 120%, y: 120%)[\(] Z^2 q'
    #scale(x: 120%, y: 120%)[\)] = - \| Z \|^2 \| q \| { cos alpha + psi' sin alpha } < 0 \, quad alpha =
    2 arg Z + psi . $
  This permits alignment of the final translating coordinate.
    The affine interpolation above joins these turns to the original bypasses after shortening at a common
    endpoint beyond the pole.
  All remaining contour pieces form a compact collection of normalized intervals for fixed $D$.
    Its strict inequalities survive small changes in the leading coefficients and higher-order parameter terms.
    Smaller-order openings have $beta z^2 = o \( 1 \)$ and may use the real path.
    Choosing the complex parameter ball to be a sufficiently high fixed power of $\| s \|$ preserves every margin. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.19, 0), (5.89, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((5.89, 0), [$"Re" u$], anchor: "west", padding: 0.1176cm)
  line((0, -1.9), (0, 1.9), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((0, 1.9), [$"Im" u$], anchor: "south", padding: 0.1176cm)
  line((2.137, -1.615), (2.137, 1.615), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((2.137, 0.114), [$3"/"4$], anchor: "south-west", padding: 0.1176cm)
  circle((2.85, 0), radius: 0.07056, fill: black, stroke: none)
  content((2.85, 0), [pole $1$], anchor: "north", padding: 0.1176cm)
  line((0.285, 0), (0.95, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((0.95, 0), (2.85, 1.235), (1.615, 0.1425), (1.71, 1.235), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((2.85, 1.235), (5.32, 0.855), (3.99, 1.235), (4.465, 0.855), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  bezier((0.95, 0), (2.85, -1.235), (1.615, -0.1425), (1.71, -1.235), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((2.85, -1.235), (5.32, -0.855), (3.99, -1.235), (4.465, -0.855), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  line((0.285, 0), (2.137, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  circle((2.137, 0), radius: 0.0635, fill: black, stroke: none)
  content((1.615, 1.71), [common stop], anchor: "south", padding: 0.1176cm)
  line((1.615, 1.71), (2.137, 1.615), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((5.32, 0.855), radius: 0.0635, fill: black, stroke: none)
  content((5.32, 0.855), [exit], anchor: "west", padding: 0.1176cm)
  circle((5.32, -0.855), radius: 0.0635, fill: black, stroke: none)
  content((5.32, -0.855), [exit], anchor: "west", padding: 0.1176cm)
  content((4.37, 1.52), [upper bypass])
  content((4.37, -1.52), [lower bypass])
})],
  caption: [Figure 1: Schematic only: the two bypasses can be curtailed and deformed to the thick real segment ending at the common pre-pole stop. The two artificial exits are marked. The drawn curves are not the quantitative circle profiles; their admissibility is proved by (4.6) and (4.7). ],
) <arr:contour-schematic>

Figure 1 shows the role of the common pre-pole segment: curtailing both contour problems to that segment allows
  uniqueness of the normalized solve to compare their actions.

=== 4.2 Prescribed finite graph gauges <sec:gauges>

The reference-family construction used the radial, conical, and compact coefficient maps.
  The lateral paths additionally change between radius and height variables and pass through long height charts
  near a collapsing circular profile. The estimates below retain each highest second derivative in its bulk norm
  while controlling its coefficient by first-derivative traces.

All complex geometric expressions below use the complex bilinear extension of Euclidean products.
  The parameters of a surface chart remain real. A complex contour is specified in its reference functions;
  it does not mean that an unknown smooth function has been continued to a complex spatial argument.
  Square roots of area elements are continued from the positive real branch.
  The compact observation charts and their cutoffs remain fixed.

For an interval $I$ of length between two fixed positive constants, set

#[#set math.equation(numbering: n => "(4.8)")
 $ parallel v parallel_(cal(X)_h \( E \; I \)) =  &
   parallel \( v \, v_t \, v_(theta theta) \, E v_(t t) \, sqrt(E) v_(t theta) \)
   parallel_(L^2 \( I \; H^h \( bb(S)^1 \) \))\
 & + parallel \( v \, v_theta \, sqrt(E) v_t \) parallel_(L^oo \( I \; H^h \( bb(S)^1 \) \)) \, wide
   parallel f parallel_(cal(Y)_h \( I \)) = parallel f parallel_(L^2 \( I \; H^h \( bb(S)^1 \) \)) . $ <gauge:norm>]

Here and below $h gt.eq 4$ is fixed. The trace terms are supplied by Lemma 6;
  one can equivalently include them in the norm. On overlapping intervals the weights $E$ are comparable,
  with bounded normalized derivatives. A uniformly local weighted norm is the supremum of the strip norms after
  division by the chosen growth weight. All estimates in this subsection hold at any fixed larger angular order as well.

#thm([Lemma 4.2.])[
  (Mixed prescribed gauges).  #emph[Let $B gt.eq 1$ and, on a bounded interval,
    prescribe smooth circular reference functions and transverse coefficients
#[#set math.equation(numbering: n => "(4.9)")
 $ X \( t \, theta \) = \( B zeta \( t \, theta \) \, R \( t \, theta \) e_r \( theta \) \) \, quad zeta =
   zeta_0 + c_1 u \, wide R = R_0 + c_2 u . $ <gauge:immersion>]

 Assume that $R_0$, $zeta'_0$ and $c_2 zeta'_0 - c_1 R'_0$ are bounded away from zero,
   that their required fixed derivatives are bounded, and that the circular reference has the strict ellipticity
   margins of Lemma 6 after division by its drift. Constants may depend on these fixed margins.
   Then the scalar stationary operator divided by the normal component of $X_u$ is an analytic map from a
   sufficiently small $cal(X)_h \( B^(- 2) \)$ ball to $cal(Y)_h$.
   If $parallel u parallel_(cal(X)_h \( B^(- 2) \)) lt.eq W$ and $B W$ is sufficiently small,
   its nonlinear remainder satisfies
#[#set math.equation(numbering: n => "(4.10)")
 $ parallel cal(Q) \( u \) - cal(Q) \( 0 \) - D cal(Q) \( 0 \) u parallel_(cal(Y)_h) lt.eq
   C_h \( B W^2 + B^2 W^3 \) . $ <gauge:mixed-bound>]

 On that ball its Lipschitz constant, after subtraction of the linear part, is at most $C_h \( B W + B^2 W^2 \)$.
   Averaging the equation in these prescribed coordinates gives the same bound for the defect of the circular mean
   curve. These statements include all angular commutations through order $h$.]
] <gauge:mixed>

#proof[
  Write $a = zeta_t$, $b = R_t$ and
  #[#set math.equation(numbering: n => "(4.11)")
   $ D = c_2 a - c_1 b = c_2 zeta'_0 - c_1 R'_0 + \( c_2 c'_1 - c_1 c'_2 \) u . $ <gauge:transverse>]
  In particular $D$ contains neither $u_t$ nor $u_theta$. The tangent vectors give
  #[#set math.equation(numbering: n => "(4.12)")
   $ g_(t t) & = B^2 a^2 + b^2 = : A \, & g_(t theta) & = \( B^2 a c_1 + b c_2 \) u_theta \, & g_(theta theta) & =
     R^2 + \( B^2 c_1^2 + c_2^2 \) u_theta^2 \,\
J := det g & = R^2 A + B^2 D^2 u_theta^2 \, & g^(t t) & = frac(R^2 + \( B^2 c_1^2 + c_2^2 \) u_theta^2, J) \,\
g^(t theta) & = - frac(\( B^2 a c_1 + b c_2 \) u_theta, J) \, & g^(theta theta) & = A / J . $ <gauge:metric>]
  The cancellation in the determinant is exact. In particular,
    a term $B^2 zeta_theta^2$ cannot be estimated independently of the off-diagonal square in the determinant.
    For $E = B^(- 2)$, $d = a^2 + E b^2$, $L = c_1 a + E c_2 b$ and $T = R^2 d + D^2 u_theta^2$,
    the same identities become
  #[#set math.equation(numbering: n => "(4.13)")
   $ g^(t t) = E / d + frac(L^2 u_theta^2, d T) \, wide g^(t theta) = - frac(L u_theta, T) \, wide
     g^(theta theta) = d / T \, wide g^(t t) - frac(\( g^(t theta) \)^2, g^(theta theta)) = E / d . $ <gauge:schur>]
  This is the exact Schur complement identity.
  An unnormalized normal, sufficient for taking normal components, is
  #[#set math.equation(numbering: n => "(4.14)")
   $ N = (- b \/ B \, med a e_r + frac(b zeta_theta - a R_theta, R) e_theta) . $ <gauge:normal>]
  It satisfies $N dot.op X_t = N dot.op X_theta = 0$ and $N dot.op X_u = D$.
    Consequently the stationary equation is precisely
  #[#set math.equation(numbering: n => "(4.15)")
   $ cal(Q) \( u \) = g^(i j) frac(N dot.op X_(i j), D) + frac(N dot.op X, 2 D) = 0 . $ <gauge:operator>]
  No connection term remains in $N dot.op X_(i j)$. Direct differentiation yields
  #[#set math.equation(numbering: n => "(4.16)")
   $ frac(N dot.op X_(t t), D) & = u_(t t) + C_(t t) \, & C_(t t) & =
     frac(a \( R''_0 + c''_2 u + 2 c'_2 u_t \) - b \( zeta''_0 + c''_1 u + 2 c'_1 u_t \), D) \,\
frac(N dot.op X_(t theta), D) & = u_(t theta) + C_(t theta) u_theta \, & C_(t theta) & =
  frac(a c'_2 - b c'_1, D) - b / R \,\
frac(N dot.op X_(theta theta), D) & = u_(theta theta) - frac(a R, D) -
  frac(2 c_2 u_theta^2, R) \, & frac(N dot.op X, D) & = frac(R a - zeta b, D) . $ <gauge:numerators>]
  Thus the complete operator is affine in the second derivatives.
    $C_(t t)$ is at most quadratic in $u_t$ and $C_(t theta)$ at most affine in $u_t$,
    with coefficients analytic in $u$. Moreover
  #[#set math.equation(numbering: n => "(4.17)")
   $ R a - zeta b =  & R_0 zeta'_0 - zeta_0 R'_0 + \( c_2 zeta'_0 + R_0 c'_1 - c_1 R'_0 - zeta_0 c'_2 \) u\
 & + \( R_0 c_1 - zeta_0 c_2 \) u_t + \( c_2 c'_1 - c_1 c'_2 \) u^2 . $ <gauge:support>]
  The terms $u u_t$ cancel. The normalized support function is affine in $u_t$.
    At circular data, irrespective of its speed,
  #[#set math.equation(numbering: n => "(4.18)")
   $ g^(t t) = A^(- 1) = O \( B^(- 2) \) \, wide g^(t theta) = 0 \, wide g^(theta theta) =
     R^(- 2) . $ <gauge:circular-cancellation>]
  In particular the circular angular curvature term is $- a \/ \( D R \)$, which is affine in $u_t$;
    it has no unsuppressed quadratic speed term.
  Here is a full coefficient estimate. Use the Banach algebra $cal(A) =
    L^oo \( I \; H^h \( bb(S)^1 \) \)$ and its module $cal(Y)_h$. By (4.8),
  #[#set math.equation(numbering: n => "(4.19)")
   $ parallel \( u \, u_theta \) parallel_(cal(A)) lt.eq W \, wide parallel u_t parallel_(cal(A)) lt.eq B W \,\
parallel \( u_t \, u_(theta theta) \) parallel_(cal(Y)_h) lt.eq W \, wide
  parallel u_(t theta) parallel_(cal(Y)_h) lt.eq B W \, wide parallel u_(t t) parallel_(cal(Y)_h) lt.eq
  B^2 W . $ <gauge:slots>]
  The functions $R \, D \, d \, T$ are analytic units in this algebra when $B W$ is small.
    Equations (4.13)–(4.16) partition the entire operator into the following classes:
  + The circular radial coefficient is $E$ times an analytic function of $\( u \, u_t \)$.
    Its change multiplies $u_(t t)$ with bound $C E \( W + B W \) B^2 W lt.eq C B W^2$.
    Its Taylor terms on bounded reference derivatives satisfy this bound too.
  + Every extra radial coefficient has two factors $u_theta$, by (4.13).
    Its product with $u_(t t)$ is bounded by $C B^2 W^3$.
  + The mixed coefficient has a factor $u_theta$ and analytic dependence on $\( u \, u_t \, u_theta \)$.
    Its product with $u_(t theta)$ is $O \( B W^2 \)$; any additional speed factor costs at most $B W$.
  + The angular coefficient equals $R^(- 2)$ plus a term divisible by $u_theta^2$.
    Its change multiplying $u_(theta theta)$ is $O \( W^2 \) + O \( W^3 \)$,
    with analytic speed factors uniformly bounded.
  + The remaining terms are exactly the lower terms in (4.16) and (4.17).
    Pure speed squares in $C_(t t)$ retain the factor $E$; all other pure speed dependence at $u_theta =
    0$ is affine. Terms with angular tilt retain its one or two explicit factors.
    A product containing only first derivatives is estimated with one factor in $cal(Y)_h$,
    so even $u_t^2$ costs $B W^2$, rather than $B^2 W^2$.
  This list exhausts the three inverse-metric contractions and the support term.
    Every further Taylor factor is small in $cal(A)$, being bounded by $C \( W + B W \)$.
    The convergent analytic series therefore sum to (4.10). Differencing a product gives the asserted Lipschitz
    estimate. The multiplication inequality $parallel f g parallel_(H^h) lt.eq
    C_h parallel f parallel_(H^h) parallel g parallel_(H^h)$ proves these statements with all $h$ angular
    commutations, keeping exactly one second derivative in $L^2$; none is put into a trace.
  For the last assertion let $U = chevron.l u chevron.r_theta$ and $cal(N) \( u \) = cal(Q) \( u \) -
    cal(Q) \( 0 \) - D cal(Q) \( 0 \) u$. The linearized coefficients are independent of $theta$, whence
  #[#set math.equation(numbering: n => "(4.20)")
   $ cal(Q) \( U \) = cal(N) \( U \) - chevron.l cal(N) \( u \) chevron.r_theta quad
     upright("if ") cal(Q) \( u \) = 0 . $ <gauge:averaging>]
  The circular curve is exactly $\( B \( zeta_0 + c_1 U \) \, R_0 + c_2 U \)$.
    If instead one expands about $U$, its second derivatives need not have uniform traces:
    split them into reference derivatives and perturbation derivatives and keep the latter in the same $L^2$ slot.
    The coefficient Taylor remainder then costs at most $B^2 W^3$.
    This proves the claim also for a varying circular mean. ◻
]

#thm([Lemma 4.3.])[
  (Long polar height charts).  #emph[Prescribe the polar height chart
$ X = \( Z g \( r \, theta \) \, r e_r \( theta \) \) $

 on real parameters along a fixed complex $r$ contour. Let $\| Z \| asymp B$, $t = - log r$,
   and assume a uniformly bounded circular reference $g_0$ satisfies $\| \( g_0 \)_t \| asymp \| r \|^2$,
   with its fixed log derivatives of this size. Assume $\| B r \| gt.eq
   Y_0$ and put $E = \| B r \|^(- 2)$ on each strip. The reference conditions include the full real pullback and
   drift division. More precisely, if $t = t \( xi \)$ on the real outward parameter and $J = t_xi$, assume $J \,
   J^(- 1)$ and their required fixed derivatives are bounded.
   Let $cal(F)_t \( g \)$ denote the left side of the log-normalized equation (4.28) below,
   including its graph-dependent $H_1$ division. Write its circular linearization in the log coordinate as
$ D cal(F)_t \( g_0 \) v = \( 1 + d_(upright("ref")) \) v_t - a_(upright("ref")) v_(t t) -
  c_(upright("ref")) v_(theta theta) + q_(upright("ref")) v . $

 Its full pulled drift is $Delta_(upright("ref")) = 1 + d_(upright("ref")) + a_(upright("ref")) J_xi \/ J^2$.
   Assume this is a bounded unit and that, after division by it,
$ "Re" frac(a_(upright("ref")), J Delta_(upright("ref"))) gt.eq c E \, quad
  lr(|frac(a_(upright("ref")), J Delta_(upright("ref")))|) lt.eq C E \, quad
  "Re" frac(J c_(upright("ref")), Delta_(upright("ref"))) gt.eq c \, quad
  lr(|frac(J c_(upright("ref")), Delta_(upright("ref")))|) lt.eq C . $

 The normalized coefficient derivatives and lower terms satisfy the bounds of Lemma 6.
   All metric and graph denominators in $cal(F)_t$ remain bounded analytic units in their normalized scales on the
   graph neighborhood. These are algebraic hypotheses on the prescribed reference,
   checked for the collapsing paths below. Let $"pb"_J$ mean the algebraic pullback obtained by replacing
   $partial_t$ with $J^(- 1) partial_xi$ and reading all prescribed coefficients along the real path.
   We use the fixed circular row
#[#set math.equation(numbering: n => "(4.21)")
 $ cal(F)_(upright("norm")) \( g \) = Delta_(upright("ref"))^(- 1) J thin "pb"_J cal(F)_t \( g \) . $ <gauge:fixed-row>]

 In particular $Delta_(upright("ref"))$ is held fixed when this map is linearized at the possibly nonexact profile
   $g_0$. This circular row depends only on $xi$, so it preserves mean and oscillatory projections.
   All strip norms use the real parameter $xi$ after this pullback. Take $Y_0$ large.
   The map $cal(F)_(upright("norm"))$ is analytic whenever
#[#set math.equation(numbering: n => "(4.22)")
 $ frac(E^(- 1 \/ 2), \| r \|^2) \( W_m + W_o \) lt.double 1 \, wide
   frac(E^(- 1 \/ 2), \| r \|^2) W_o lt.double 1 \, $ <gauge:height-small>]

 where $v = g - g_0$ has mean and oscillation of $cal(X)_h \( E \)$ sizes $W_m \, W_o$ respectively.
   Writing $W = W_m + W_o$, its remainder $cal(N) \( v \) = cal(F)_(upright("norm")) \( g_0 + v \) -
   cal(F)_(upright("norm")) \( g_0 \) - D cal(F)_(upright("norm")) \( g_0 \) v$ obeys
#[#set math.equation(numbering: n => "(4.23)")
 $ parallel cal(N) \( v \) parallel_(cal(Y)_h) lt.eq
   C_h (frac(E^(- 1 \/ 2), \| r \|^2) W^2 + frac(E^(- 1), \| r \|^4) W_o^2 W) . $ <gauge:height-bound>]

 With $A_r = E^(- 1 \/ 2) \/ \| r \|^2$ and $C_r = E^(- 1) \/ \| r \|^4$,
   its mean and oscillatory outputs satisfy, respectively,
#[#set math.equation(numbering: n => "(4.24)")
 $ parallel chevron.l cal(N) \( v \) chevron.r parallel_(L_xi^2) & lt.eq C_h { A_r \( W_m^2 + W_o^2 \) +
   C_r W_o^2 W } \,\
parallel cal(N) \( v \) - chevron.l cal(N) \( v \) chevron.r parallel_(cal(Y)_h) & lt.eq C_h { A_r W_o W +
  C_r W_o^2 W } . $ <gauge:height-projections>]

 The corresponding multilinear difference estimates hold. These estimates are uniform at each fixed angular order.]
] <gauge:height>

#proof[
  The physical slopes in the polar orthonormal frame are $p = - Z g_t \/ r$, $q = Z g_theta \/ r$.
    With $H = 1 + p^2 + q^2$, the curvature matrix has entries
  #[#set math.equation(numbering: n => "(4.25)")
   $ A = frac(1 + q^2, H) \, wide D_theta = frac(1 + p^2, H) \, wide C = - frac(p q, H) . $ <gauge:polar-matrix>]
  The stationary equation, multiplied by $r^2 \/ Z$, is exactly
  #[#set math.equation(numbering: n => "(4.26)")
   $ A \( g_(t t) + g_t \) + D_theta \( - g_t + g_(theta theta) \) - 2 C \( g_(t theta) + g_theta \) = - 1 /
     2 r^2 \( g_t + g \) . $ <gauge:polar-equation>]
  Complex tangent factors on a prescribed contour are included by the chain rule in (4.21).
    Its row is the fixed circular unit, including the $J_xi$ term;
    the graph-dependent $H_1$ normalization remains inside $cal(F)_t$ and its linearization.
    The preceding normalized inequalities retain the required strict margins.
  Set $p_0 = - Z \( g_0 \)_t \/ r$, $e = p_0^(- 2)$, $s = \( p - p_0 \) \/ p_0$ and $q = p_0 v_1$.
    Then $\| e \| asymp E$, $s = v_t \/ \( g_0 \)_t$ and $v_1 = - v_theta \/ \( g_0 \)_t$,
    and the exact coefficient formulas read
  #[#set math.equation(numbering: n => "(4.27)")
   $ A = frac(e + v_1^2, e + \( 1 + s \)^2 + v_1^2) \, quad D_theta =
     frac(e + \( 1 + s \)^2, e + \( 1 + s \)^2 + v_1^2) \, quad C = -
     frac(\( 1 + s \) v_1, e + \( 1 + s \)^2 + v_1^2) . $ <gauge:relative-coefficients>]
  For an explicit check of the drift division, write instead $P = g_t \/ r^2$, $Q = g_theta \/ r^2$,
    $e_1 = \( Z r \)^(- 2)$ and
  $ H_1 = \( 1 - r^2 \/ 2 \) P^2 - \( 1 + r^2 \/ 2 \) Q^2 - r^2 e_1 \/ 2 . $
  Equation (4.26) becomes
  #[#set math.equation(numbering: n => "(4.28)")
   $ g_t - a_1 g_(t t) - b_1 g_(theta theta) + 2 c_1^(*) g_(t theta) + 2 c_1^(*) g_theta - d_1 g = 0 \,
     $ <gauge:polar-normalized>]
  where
  $ a_1 = frac(e_1 + Q^2, H_1) \, wide b_1 = frac(e_1 + P^2, H_1) \, wide c_1^(*) = frac(P Q, H_1) \, wide d_1 =
    frac(r^2 \( e_1 + P^2 + Q^2 \), 2 H_1) . $
  Here $P$ is a bounded unit at the reference. Put $frak(p) = E^(- 1 \/ 2) W \/ \| r \|^2$ and $frak(q) =
    E^(- 1 \/ 2) W_o \/ \| r \|^2$. In the angular algebra these exact normalized coefficients satisfy
  #[#set math.equation(numbering: n => "(4.29)")
   $ frac(parallel a_1 - a_(1 \, 0) parallel, E) + frac(parallel b_1 - b_(1 \, 0) parallel, E) +
     frac(parallel d_1 - d_(1 \, 0) parallel, \| r \|^2 E) lt.eq C \( frak(p) + frak(q)^2 \) \, wide
     frac(parallel c_1^(*) parallel, sqrt(E)) lt.eq C frak(q) . $ <gauge:relative-normalized>]
  In particular at zero tilt the speed variation of $b_1$ retains a factor $E$,
    and that of $d_1$ a factor $r^2 E$; their remaining variations have two tilt factors.
    Drift division introduces no unweighted radial-speed term.
  Consequently $A - A_0 = O \( E s \) + O \( v_1^2 \)$, $D_theta - 1 = -
    v_1^2 \/ \( e + \( 1 + s \)^2 + v_1^2 \) = O \( v_1^2 \)$, and $C = O \( v_1 \)$,
    as analytic algebra estimates. Every pure radial-speed variation in $A$ retains the factor $E$;
    angular changes of $A$ have two tilt factors. The condition that the mixed coefficient be small relative to
    $sqrt(E)$ is precisely the second smallness condition in (4.22).
  For the full map, assign the traces of $v \, v_theta$ size $W$, the trace of $v_t$ size $E^(- 1 \/ 2) W$,
    and the bulk sizes of $v_(t t) \, v_(t theta) \, v_(theta theta)$ respectively $E^(- 1) W \, E^(- 1 \/ 2) W \,
    W$. A pure speed change in $A$ times $v_(t t)$ is bounded by $E \|
    r \|^(- 2) \( E^(- 1 \/ 2) W \) \( E^(- 1) W \) = A_r W^2$.
    A mixed tilt times $v_(t theta)$ costs $A_r W_o W$. The two-tilt part of $A$ times $v_(t t)$ costs $C_r W_o^2
    W$. The angular coefficient costs less. These are all second derivative terms in (4.26).
    For a coefficient Taylor remainder on a background derivative, use its size $O \( \| r \|^2 \)$.
    The pure speed part has the factor $E$, and use one $v_t$ in bulk rather than trace.
    For instance $E \| r \|^(- 4) v_t^2 O \( \| r \|^2 \)$ has bound $E^(1 \/ 2) \| r \|^(- 2) W^2 lt.eq A_r W^2$.
    Tilt squares have bound $\| r \|^(- 2) W_o^2 lt.eq A_r W_o^2$.
    For the normalized zeroth-order term $d_1 g_0$, use the factor $r^2 E$ in (4.29) and $g_0 = O \( 1 \)$,
    giving these same bounds; it is not necessary to assign $g_0$ the derivative size $O \( r^2 \)$.
    All lower terms are already displayed in (4.26); the support term before division is affine in $g \, g_t$.
    The analytic $H_1$ division already included in $cal(F)_t$ preserves these bounds by its unit expansion.
    The fixed row in (4.21) and its bounded chain-rule coefficients preserve them as well.
    Higher powers are absorbed using (4.22).
  Finally rotation of $theta$ commutes with the equation. At a circular input,
    its linearization has circular coefficients. A mean output therefore has no term linear in the oscillation,
    and an oscillatory output has no term containing only mean inputs.
    Applying the preceding multilinear estimates with these absent terms gives (4.24).
    Analytic composition in $H^h$ and the single highest-derivative bulk slot prove every angular commutation and
    every difference estimate asserted above. ◻
]

=== 4.3 A uniform normalized inverse on finite contours <sec:finite-linear>

The infinite-end estimates now have to be combined with the long prescribed paths.
  Compact observations remove the Gaussian kernel; the weighted end estimate must also prevent an approximate
  kernel from escaping toward a receding endpoint. We use the compact norms and coefficient maps of 12,
  and the finite graph calculations of Lemma 4.2, Lemma 4.3.
  The end weights are retained until the final conversion to physical graph bounds.

Here is the geometry behind the parameters in the next proposition.
  The large number $B$ measures axial distance along a cylindrical end;
  in the later application it is the inverse square root of the opening scale.
  The fixed number $D$ bounds the size of a contour after division of axial distances by $B$.
  A polar height chart writes the surface as $X = \( Z g \( r \, theta \) \, r e_r \( theta \) \)$,
  with $\| Z \| asymp B$ and $e_r \( theta \) = \( cos theta \, sin theta \)$.
  Its scalar variable $g$ is height divided by $Z$, and $r_0$ is its entrance radius;
  decreasing $r$ corresponds to increasing $log \( r_0 \/ r \)$.
  A prescribed complex path is given by $r = r \( s \)$ on a real outward parameter interval.
  The complex quantity $log \( r_0 \/ r \( s \) \)$ occurs only through its coefficients and chain rule;
  it is not a new spatial domain. An outgoing derivative condition prescribes the first derivative of this scalar
  graph variable at the terminal section of that interval. The proposition states the precise analytic hypotheses
  independently of any particular contour construction.

#thm([Proposition 4.4.])[
  (Weighted normalized inverse).  #emph[Fix an angular order $h$, a finite geometric parameter $D$,
    a cylindrical weight rate $alpha_(upright("cyl")) > 2.1$, and the compact observations from Lemma 5.
    Consider surfaces of parameter size $B arrow.r oo$, obtained by replacing far cylindrical pieces by
    real-parameter paths with complex coefficients, optionally followed by height charts of length
    $O \( log B \)$. The conical ends may remain infinite. The following are the hypotheses on the linear
    operators and prescribed charts.]
  + #emph[On each fixed compact subset, the coefficients, compact multiplier sources,
    and observations converge smoothly to (3.3), or to a member of a sufficiently small uniformly invertible
    perturbation of that block.]
  + #emph[From a fixed entrance to $z = c B$, the cylindrical operator is a sufficiently small perturbation of
    (3.5). Choose $c > 0$ so that a propagation rate $2.1$ is available.
    Beyond that point, bounded bands of length depending on $D$ satisfy Lemma 6.
    A height chart is the real-parameter pullback of $tau = log \( r_0 \/ r \)$,
    with $E asymp \( B \| r \| \)^(- 2)$, ending with $B \| r \| gt.eq Y_0$.
    Its coefficients obey the same accretivity, derivative, lower-term, and small-perturbation bounds.]
  + #emph[Each modified cylindrical end has one ordered real outward interval $\[ s_0 \, T_B \]$,
    equal to the original log coordinate on its long real part.
    Local real outward coordinates on overlaps are $t_i = chi_i \( s \)$ with $0 < c lt.eq chi'_i lt.eq
    C$ and bounded required fixed derivatives; the real angular coordinate is unchanged.
    There is a positive scale $E_B \( s \)$ comparable to the local scales with bounded logarithmic derivatives.
    The prescribed scalar variables are descriptions of one scalar variable through transition factors
    $A_i \( s \, theta \)$ on fixed overlap bands. The functions $A_i \,
    A_i^(- 1)$ and their ordinary real-coordinate derivatives through the required fixed orders are bounded.
    Choose this scalar variable to agree with each prescribed long-chart variable off those bands and with the
    prescribed exit variable near $T_B$. After these changes,
    the normalized reference operators and their source rows are smooth restrictions of one operator on the
    interval; any additional terms from the actual backgrounds satisfy the bounded lower-term and small
    domain-to-range perturbation hypotheses in (ii). These requirements exclude distributional seams.
    The coefficients on conical ends satisfy Lemma 9, up to a small domain-to-range perturbation.]
  + #emph[For each fixed $B$ and sufficiently remote finite stops on the conical ends,
    fixed domain and range isomorphisms identify the actual stopped operator with an operator connected to a real
    coercive scalar elliptic problem by an operator-norm continuous homotopy on the fixed compact $H^2$ domain
    with homogeneous boundary conditions and range $L^2$. Its coefficients and boundaries are smooth,
    its symbols are properly elliptic, and its boundary conditions are complementing throughout.
    The equal-dimensional compact observation and multiplier augmentation is retained.
    This is only an index hypothesis: the uniform estimates in the preceding items are required for the actual
    operators, not for the artificial operators along the homotopy.]
  #emph[For clarity, the coefficient requirement in (iii) includes the tangent of every prescribed complex log
    path. If $t = t \( s \)$ is such a log and $H = t_s$ is its complex tangent, independent of $theta$,
    then the chain rule on the real $s$ interval gives
#[#set math.equation(numbering: n => "(4.30)")
 $ H cal(L) =  & partial_s - a / H partial_(s s) - 2 b partial_(s theta) - H c partial_(theta theta)\
 & + (d_1 + frac(a H_s, H^2)) partial_s + H d_2 partial_theta + H d_0 \, $ <lin:complex-log-pullback>]

 and the source is multiplied by $H$. Thus $H \, H^(- 1)$ and its required fixed derivatives, including $H_s$,
   must be bounded. If the full drift is divided out, its divisor is $delta_H = 1 + d_1 + a H_s \/ H^2$,
   and the actual inequalities in (ii) are
$ "Re" frac(a, H delta_H) gt.eq c E_B \, quad "Re" frac(H c, delta_H) gt.eq c \, quad
  lr(|frac(a, H delta_H)|) lt.eq C E_B \, quad lr(|frac(H c, delta_H)|) lt.eq C \, quad lr(|b / delta_H|) lt.eq
  epsilon_(*) sqrt(E_B) . $

 The divided source is $H f \/ delta_H$. A nonzero divisor alone does not imply these real-part inequalities.
   If $delta_H = 1 + O \( E_B \)$, its closeness to one preserves previously fixed strict margins.]
  #emph[Choose a weight $rho_B$ with rate $alpha_(upright("cyl"))$ on the long real cylinder,
    a sufficiently large fixed rate $d_D$ on the bounded modified bands,
    and a sufficiently large fixed rate $d_(upright("cap"))$ on a height chart,
    retaining its value at the entrance of each new chart. All rates exceed their propagation rates by fixed
    positive margins, are at least $alpha_(upright("cyl"))$, and their interpolations occupy fixed overlap bands
    where the adjacent coefficient estimates both hold. Choose $Y_0$ after these rates so that $d_(upright("cap"))
    sup E$ is sufficiently small; take $B$ large only after these choices.]
  #emph[Here $u$ denotes the scalar unknown in each prescribed chart:
    normal height on the core, radius on cylindrical charts, relative height on cap charts,
    and link displacement on conical charts. The corresponding source uses the same change of graph units and
    drift normalization. Let $X_B$ consist of the compact norm (3.23), the cylindrical and height norms (3.13),
    the conical norms (3.19), and the Euclidean norm of the compact multiplier vector.
    Let $Y_B$ consist of the corresponding compact and end source norms and the Euclidean observation norm.
    Homogeneous outgoing graph-derivative conditions are included in the domain. Then
#[#set math.equation(numbering: n => "(4.31)")
 $ parallel \( u \, lambda \) parallel_(X_B) lt.eq
   C_(D \, Y_0 \, h \, alpha_(upright("cyl"))) ∥#scale(x: 120%, y: 120%)[\(] L_B u +
   sum_i lambda_i chi_(i \, B) \, P_B u #scale(x: 120%, y: 120%)[\)]∥_(Y_B) \, $ <lin:global-estimate>]

 and this normalized operator is onto. At a true terminal section define $g =
   u_s \( T_B \)$ for the prescribed scalar variable in the real outward coordinate.
   If $t = t \( s \)$ is a local log coordinate, this means $g = H u_t \( T_B \)$ with $H = t_s$.
   For this prescribed exit derivative the right hand side is augmented by $rho_B \( T_B \)^(- 1) parallel g
   parallel_(cal(T)_(E \( T_B \) \, h)^N)$ at each terminal section;
   the sum over the fixed finite list of exits is understood.
   The thresholds and constant may depend on the fixed rate,
   but are independent of $B$ and of the lengths of the exhausted conical ends.
   Removing $rho_B$, or converting a relative height to physical height on a cap,
   costs at most a fixed power of $B$. The preliminary construction uses $alpha_(upright("cyl")) = 2.2$;
   a source with a fixed higher Taylor growth rate is permitted by choosing $alpha_(upright("cyl"))$ equal to or
   larger than that rate. The strict buffer is above the propagation rate,
   so equality with the source growth rate is allowed in the uniformly local source norm.]
] <lin:global>

#proof[
  We first prove one exterior estimate on the real interval in (iii).
    This avoids imposing boundary data at changes of graph gauge.
    For a scalar change $u = A tilde(u)$, conjugate the source by $A^(- 1)$.
    The principal coefficients of (3.7) are unchanged, while the lower coefficients become
  $ tilde(d)_1 & = d_1 - 2 a A_s \/ A - 2 b A_theta \/ A \,\
tilde(d)_2 & = d_2 - 2 b A_s \/ A - 2 c A_theta \/ A \,\
tilde(d)_0 & = d_0 + \( 1 + d_1 \) A_s \/ A + d_2 A_theta \/ A - a A_(s s) \/ A - 2 b A_(s theta) \/ A -
  c A_(theta theta) \/ A . $
  The $a$ contribution to $tilde(d)_1$ is $O \( E_B \)$; the $b$ contribution is $O \( epsilon_(*) sqrt(E_B) \)$
    and is an allowed small strip operator perturbation. The remaining additions are bounded lower terms.
    In particular $A_s \/ A$ must have an ordinary bounded derivative norm,
    since it occurs without an $E_B$ factor in the mass. The transition is taken in the prescribed reference
    frames; the coefficient–module bounds control the rougher actual backgrounds.
    For the one-dimensional real coordinate changes in (iii), the chain rule is (4.30) with positive real $H$.
    Their bounded factors preserve the radial, mixed, and angular units.
  The fixed-radius radial-to-height transition illustrates why these requirements hold for the later circular
    overlap. Write $z = Z_0 phi \( r \)$ with $\| Z_0 \| asymp \| Z \| asymp B$ and $phi^2 = 1 - r^2 \/ 2$,
    and put $H_r = \( log \( r_0 \/ r \) \)_s$. Then
  $ \( log z \)_s = frac(r^2, 2 phi^2) H_r \, wide u_(upright("rel")) = - frac(z_s, Z r_s) u_(upright("radius")) =
    Z_0 / Z frac(r, 2 phi) u_(upright("radius")) . $
  Here $u_(upright("rel"))$ is relative height, so the factor follows by equating the two variations’ normal
    components. The last factor and its inverse have bounded fixed derivatives when $\| r \| asymp r_0 >
    0$ and $phi$ is a unit. They need not do so at $\| r \| asymp B^(- 1)$,
    so the transition is made on that fixed-radius overlap. In the common real parameter,
    the circular radial and angular diffusions, before the small axial-curvature correction to the drift, are
  $ frac(4, Z_0^2 r^2 H_r \( 1 + 4 phi^2 \/ \( Z_0^2 r^2 \) \)) \, wide H_r / phi^2 . $
  These have the polar units $E_B asymp \( B \| r \| \)^(- 2)$ and $1$.
    Equivalently, in the mixed gauge of Lemma 18, the angular-curvature and support terms have slow drift $-
    phi^2 \/ \( r^2 H_r \)$, independent of the prescribed transverse direction.
    The formulas follow from $r_s = - r H_r$, $z_s = Z_0 r^2 H_r \/ \( 2 phi \)$ and the metric in (4.12).
    The remaining axial drift is $O \( E_B \)$ on this overlap.
    On a long height chart (4.30) and the strict margins in (ii) are checked with its own scale
    $\( B \| r \| \)^(- 2)$, including the tangent derivatives.
    No uniformly bounded conversion to physical normal height along the whole cap is needed here.
  Trivialize on the fixed overlap bands as in (iii), keeping the prescribed exit variable.
    Put $u = rho_B w$ on the entire interval and $d = \( log rho_B \)_s$.
    On the long real cylinder the model shifted mass at $d = alpha_(upright("cyl"))$ is
  $ d - 2 - 2 mu^2 \( d^2 - d \) . $
  It has a strict positive buffer for a far entrance depending on this fixed rate; at $d =
    2.2$ the limiting buffer is $0.2$. The small full operator-norm perturbation in (ii) preserves this estimate
    by absorption; decay of that perturbation is not needed on the interval $z lt.eq c B$.
    Raise the rate on a fixed band while this margin still holds,
    before entering a region whose lower terms require $d_D$, and similarly enter the height rate.
    On the other bands the algebraic mass is
  $ \( 1 + tilde(d)_1 \) d - a \( d^2 + d_s \) + tilde(d)_0 . $
  The chosen rate exceeds the bounded reaction costs, and $E_B d lt.double
    1$ controls both the quadratic term and the smooth interpolation term.
    The coefficient–module perturbations are absorbed with the strict local margins.
    Perform the integration in the proof of (3.14) once on this whole interval,
    including the same additional exponentially decreasing localization centered at an arbitrary strip.
    There are only the true entrance and terminal boundary terms.
    The exit variable is unchanged there, so its conjugated condition is $w_s + d w =
    rho_B \( T_B \)^(- 1) g$ and has the favorable terminal sign already computed.
    The geometric strip sum is uniform in the interval length.
    Local patch estimates recover every bulk term across the smooth overlap bands. We obtain
  #[#set math.equation(numbering: n => "(4.32)")
   $ parallel u parallel_(X_B \( upright("exterior") \)) lt.eq
     C
     (C_h^2 \( u \; K_(upright("collar")) \) + parallel L_B u parallel_(Y_B \( upright("exterior") \)) + parallel
     g \/ rho_B \( T_B \) parallel_(cal(T)_(E \( T_B \) \, h)^N)) . $ <lin:exterior-global>]
  The overlap constants depend only on the prescribed fixed data and $D$.
    Lemma 9 supplies the conical part of this estimate. The compact multiplier sources are absent on all
    sufficiently far collars.
  Interior elliptic estimates on nested fixed collars, including the commutations in (3.23), now yield
  #[#set math.equation(numbering: n => "(4.33)")
   $ parallel \( u \, lambda \) parallel_(X_B) lt.eq
     C (parallel cal(A)_B \( u \, lambda \) parallel_(Y_B) + parallel u parallel_(L^2 \( K' \)) + \| lambda \|)
     $ <lin:compact-remainder>]
  for a fixed compact $K'$. In particular the estimate has been proved in the weighted norm,
    before any power of $B$ is spent.
  For a fully stopped problem write $T$ for the smallest logarithmic stopping coordinate on the conical ends.
    If there are no conical ends, omit $T$. Suppose there were no thresholds $B_0 \,
    T_0$ and constant $C$ giving (4.31) whenever $B gt.eq B_0$ and $T gt.eq T_0$.
    We could then choose a failing sequence with $B arrow.r oo$ and every conical stop tending to infinity.
    Normalize its unknowns to have $X_B$ norm one and its output to tend to zero.
    Interior compactness and finite dimensionality of the multipliers give a local limit
    $\( u_oo \, lambda_oo \)$. On every fixed cylindrical interval the weight is eventually
    $e^(alpha_(upright("cyl")) \( t - t_0 \))$. Consequently $u_oo$ has at most polynomial growth there.
    On conical ends its ambient normal height has at most linear growth, by (3.19).
    The derivative estimates give $u_oo in H_G^2$. It solves the homogeneous limiting normalized block and hence
    vanishes, together with its multipliers. Local elliptic estimates upgrade this convergence sufficiently to
    make the compact terms in (4.33) vanish. The latter inequality contradicts the normalization.
    This is the exclusion of escape along a long end: it uses the fixed strict buffer in (4.32),
    and would not follow by normalizing an unweighted estimate with a factor $B^q$.
    The contradiction gives one bound on the entire quadrant $B gt.eq B_0$, $T gt.eq T_0$.
    Thus the subsequent conical exhaustion may fix any $B gt.eq B_0$ before sending the conical stops to infinity.
  Surjectivity is a separate argument. Stop all ends, including the conical ends, at remote finite sections.
    At each fixed $B$ and each fixed conical stopping radius,
    the compact scalar boundary problem is realized from its homogeneous mixed-boundary $H^2$ domain to $L^2$.
    The full boundary-data map is Fredholm by the complementing-boundary theorem #cite(label("NP1994")) Chapter 1,
    Section 1, subsection 3, Theorem 1.1, localized in surface charts.
    Entrance Dirichlet and transverse derivative conditions occur on disjoint boundary components $Gamma_D \,
    Gamma_N$. To pass to the stated homogeneous realization, let $cal(B)$ be the boundary trace map into $cal(T) =
    H^(3 \/ 2) \( Gamma_D \) xor H^(1 \/ 2) \( Gamma_N \)$ and choose its bounded right inverse $R$ from fixed
    smooth collars. The decomposition $u = v + R g$, $v in ker cal(B)$,
    identifies the full map with $\( v \, g \) mapsto \( L_B v + L_B R g \, g \)$.
    A bounded triangular change in the range reduces it to $"diag" \( L_B \|_(ker cal(B)) \, I_(cal(T)) \)$,
    so the homogeneous realization is Fredholm with the same index.
    Hypothesis (iv) identifies its index with that of a real coercive problem, hence zero.
    Continuity of the index and invariance under finite-rank perturbations are the Banach-space facts in
    #cite(label("Kato1995")) Chapter IV, Sections 5.2–5.3, Theorems 5.17 and 5.26.
    Adding equally many multiplier variables and observation equations first gives $"ind"
    "diag" \( L_B \, 0_(bb(C)^m) \) = "ind" L_B$. The off-diagonal observation and source maps are finite rank,
    so the augmented block still has index zero.
  Apply the already proved weighted a priori estimate to the actual stopped operator.
    Its constants are independent of the conical stopping radii by Lemma 9 and the compact-limit argument above.
    For sufficiently remote stops and large $B$ it excludes a kernel:
    elliptic boundary regularity #cite(label("NP1994")) Chapter 1, Section 1, subsection 3,
    Theorem 1.5 first makes every kernel element smooth, so the commuted estimate applies.
    The stopped augmented operator is therefore bijective on this $H^2$–$L^2$ realization.
    For smooth sources its solution is smooth; the actual commuted estimates then bound it in $X_B$ by the source
    in $Y_B$. Approximation by smooth sources extends this inverse to the stated angularly commuted spaces,
    with the same uniform bound. Thus no identification of those spaces with an isotropic higher Sobolev scale is
    needed. Let the conical stops tend to infinity, keeping $B$ fixed.
    The uniform conical estimates, weak compactness in their weighted bulk spaces,
    and local elliptic compactness pass these solutions to the infinite-conical domain.
    The prescribed compact observations and finite cylindrical or height exits pass to the limit as well.
    This proves surjectivity of the actual operator with the asserted bound.
  Only compact stopped problems enter the artificial index homotopy.
    No uniform inverse along that homotopy, no geometric realization of its intermediate operators,
    and no deformation of an infinite conical boundary problem are required.
    Fixed-parameter elliptic Fredholm theory supplies the index;
    the weighted estimates for the actual geometric operators supply uniformity in $B$ and in the conical exhaustion.
  Finally the real-cylinder weight is at most $C B^(alpha_(upright("cyl")))$,
    and bounded bands cost a fixed factor depending on $D$. By the stated length hypothesis and the bounded real
    pullbacks, a cap has $s$-length at most $C_(upright("par")) log B + C_(upright("par"))$,
    with $C_(upright("par"))$ fixed before $B$. Thus $sup rho_B lt.eq
    C_(D \, Y_0 \, alpha_(upright("cyl"))) B^(alpha_(upright("cyl")) + C_(upright("par")) d_(upright("cap")))$.
    Conversions of the prescribed height units and any fixed number of their derivatives add only fixed powers.
    This proves the last assertion without altering the uniform weighted estimate. ◻
]

#thm([Lemma 4.5.])[
  (Exponential backward shielding).  #emph[On a fixed log-length overlap suppose the hypotheses of Lemma 6 hold
    with $E asymp B^(- 2)$. A solution of the homogeneous difference equation with zero entrance value and
    polynomially bounded farther data is, on every fixed earlier band separated from those data, bounded by
#[#set math.equation(numbering: n => "(4.34)")
 $ C B^M exp \( - c B^2 \) $ <lin:shielding-estimate>]

 in the strip norm, with every fixed number of admissible derivatives.
   The assertion is stable under the small coefficient perturbations in the same shifted domain-to-range norms.
   It holds with actual outgoing derivative data as well as with a farther Dirichlet trace.
   For holomorphic finite-parameter derivatives, the solution and the displayed bound are assumed on an outer
   parameter ball and the derivatives are evaluated on an inner ball whose distance from the outer boundary is at
   least $c B^(- q)$ for fixed $c \, q > 0$. For smooth contour derivatives,
   the pulled-back differentiated operators and data must separately obey the corresponding shifted bounds,
   with a fixed separation of the two bands.]
] <lin:shielding>

#proof[
  Put $Z = B$, $d = c_1 Z^2$, $D = partial_t + d$, and $v = e^(d \( t - T \)) w$,
    with $d$ constant on the overlap. Choose $c_1 > 0$ after the reference margins so that $d sup E$ is small.
    All bulk norms below mean $L_t^2 H_theta^h$ on the fixed overlap, or on a fixed enlarged patch.
    The shifted reference energy has mass $d - O \( E d^2 \) gt.eq c d$;
    the symbol and boundary argument of (3.14) control
  $ N_d \( w \) := d parallel w parallel + parallel D w parallel + parallel w_(theta theta) parallel +
    parallel E D^2 w parallel + parallel sqrt(E) D w_theta parallel . $
  Mixed and imaginary terms use the small derivative energies exactly as in that argument.
    For clarity the first traces also have constants independent of $Z$.
    With $E$ replaced by its comparable patch value, product integration gives
  $ E parallel D w parallel_(L^oo H^h)^2 & lt.eq C #scale(x: 120%, y: 120%)[\(] \( E + E d \) parallel D w
    parallel^2 + parallel D w parallel thin parallel E D^2 w parallel #scale(x: 120%, y: 120%)[\)] \,\
parallel w_theta parallel_(L^oo H^h)^2 & lt.eq C parallel w_(theta theta) parallel
  #scale(x: 120%, y: 120%)[\(] \( 1 + d \) parallel w parallel + parallel D w parallel #scale(x: 120%, y: 120%)[\)] . $
  The ordinary product identity supplies the $w$ trace. Hence $\( w \, w_theta \, sqrt(E) D w \)$ is bounded by $C
    N_d \( w \)$ in $cal(A) = L_t^oo H_theta^h$. The term $d parallel w parallel$ is retained in this estimate;
    no second derivative has a trace.
  Explicitly, for a perturbation $delta a D^2 + 2 delta b D partial_theta + delta c partial_theta^2 + p D +
    q partial_theta + r$, a sufficient coefficient–module norm is
  $ frak(M) = parallel delta a \/ E parallel_(cal(A)) + parallel delta b \/ sqrt(E) parallel_(cal(A)) +
    parallel delta c parallel_(cal(A)) + E^(- 1 \/ 2) parallel p parallel + parallel q parallel +
    parallel r parallel . $
  The last three norms are bulk norms: the preceding traces give the operator bound $C frak(M) N_d \( w \)$.
    Bounded lower coefficients may also be estimated directly on their bulk slots.
  Here is the shifted perturbation check for the geometric difference operators used below.
    In the mixed prescribed gauges of Lemma 18, suppose the two background perturbations have norm at most $W$ in
    (4.8), and set $epsilon = Z W lt.double 1$. Relative to the circular reference, (4.13) and (4.19) give,
    uniformly along the averaged segment,
  $ parallel delta g^(t t) parallel_(cal(A)) lt.eq C E \( epsilon + epsilon^2 \) \, quad
    parallel delta g^(t theta) parallel_(cal(A)) lt.eq C sqrt(E) epsilon \, quad
    parallel delta g^(theta theta) parallel_(cal(A)) lt.eq C \( W + W^2 \) . $
  Analytic drift division preserves the corresponding normalized bounds.
    Applying these coefficients to $D^2 w \, D w_theta \, w_(theta theta)$ costs at most
    $C \( epsilon + epsilon^2 \) N_d \( w \)$. Keeping $D$ intact includes the terms with $d^2 w$ and $d w_theta$.
  The averaged Jacobian also differentiates the coefficients multiplying a background second derivative.
    Keep that derivative in its original unshifted $L^2$ slot.
    From (4.13)–(4.19), the resulting coefficients of $D w \, w_theta \,
    w$ have respective $L_t^2 H_theta^h$ bounds $C W$, $C \( epsilon + epsilon^2 \)$, and $C W$.
    For example differentiating the circular radial coefficient costs $C E$, and $parallel u_(t t) parallel lt.eq
    C Z^2 W$; differentiating its two-tilt correction costs $C W$, giving $C Z^2 W^2$ in the angular slot.
    Use $parallel D w parallel_(cal(A)) lt.eq C Z N_d \( w \)$ and the other first traces to bound all these
    module products by $C \( epsilon + epsilon^2 \) N_d \( w \)$. The lower terms are precisely (4.16) and (4.17):
    pure speed squares retain $E$, and the circular angular and support terms are affine in speed.
    They obey the same bound. Thus the full difference operator satisfies
  $ parallel e^(- d \( t - T \)) \( L_(*) - L_(upright("ref")) \) e^(d \( t - T \)) w parallel_(L^2 H^h) lt.eq
    C \( epsilon + epsilon^2 \) N_d \( w \) . $
  This is a module estimate, not pointwise control of every lower coefficient.
    In a pure radial chart the variables in Lemma 7 give the same argument,
    with any small circular opening included in the reference.
    The reference margins and this shifted smallness are checked before applying the lemma:
    smallness of the opening alone does not assert $Z W lt.double 1$ for the correction relative to that reference.
  Keep the actual exit condition throughout:
  #[#set math.equation(numbering: n => "(4.35)")
   $ v_t \( T \) = g quad arrow.l.r.double quad D w \( T \) = g . $ <lin:robin>]
  For a reference fast root the lift denominator is $\( lambda_(+) - d \) + d = lambda_(+)$,
    so the natural norm (3.10) retains its gain. For homogeneous data the principal terminal coefficient is $d
    "Re" a + \( 1 - 2 d "Re" a \) \/ 2 = 1 \/ 2$; $d_1 = O \( E \)$ adds only $O \( E \)$.
    The full perturbation is inverted on this same Robin domain by a Neumann series once its displayed relative
    norm is sufficiently small. No trace of a rough lower coefficient is introduced.
    A scalar conversion $v = A \( t \) tilde(v)$ changes both the interior operator and the exit to
    $\( partial_t + d + A_t \/ A \) tilde(w) = g \/ A$. Bounded invertible $A$ with the prescribed derivative
    bounds gives equivalent shifted domains. Returning to ordinary derivatives costs only fixed powers of $Z$;
    commuted versions use the corresponding differentiated coefficient–module bounds.
  One may alternatively take the farther actual trace as Dirichlet data,
    or cut off the solution near the far side and impose zero data beyond the cutoff.
    The resulting source is supported a fixed distance to the right of the band being estimated.
    The factor $e^(d \( t - T \))$ suppresses its effect there by $e^(- d thin upright("gap"))$.
    The shifted estimates have only polynomial losses, which proves (4.34).
    All operations occur in prescribed charts. On the inner parameter ball in the statement,
    Cauchy’s estimate for a derivative of order $j$ costs at most $C_j B^(q j)$, which preserves the exponential.
    A ball’s radius by itself gives no estimate at points arbitrarily close to its boundary.
    Smooth contour parameters instead require differentiation of the equation and its prescribed real-domain
    pullback. When those differentiated coefficients and data have the stated polynomial bounds and their sources
    remain on the farther side, the same shifted estimate applies to each differentiated equation. ◻
]

#prodef([Remark 4.6.])[
  The uniform weighted inverse and its polynomial physical version have different uses.
    A refined exterior nonlinear problem must first be solved in its own mean and angular-oscillation weights,
    using the corresponding small Lipschitz constants. If its entrance agrees with a preliminary normalized
    solution, Lemma 21 makes a splice residual exponentially small.
    Proposition 20 can then correct that residual even after all fixed polynomial losses.
    Applying a coarse $B^q$ inverse directly to the original exterior power-sized error would require a separate
    smallness argument and is not an implication of the proposition.
] <lin:two-inversions>

=== 4.4 Exact normalized solves and their action <exact-normalized-solves-and-their-action>

We state precisely the earlier analytic estimates used here.
  Lemma 6 controls, on unit evolution strips and at a fixed sufficiently high angular order,

$ u \, med u_t \, med u_(theta theta) \, med E u_(t t) \, med sqrt(E) thin u_(t theta) quad
  upright("in ") L_t^2 H_theta^h \, wide u \, med u_theta \, med sqrt(E) thin u_t quad upright("as traces") . $

The coefficients must have radial and angular diffusion comparable to $E$ and $1$,
  strictly positive normalized real parts, bounded normalized derivatives,
  and mixed coefficient $o \( sqrt(E) \)$. Proposition 20 supplies an invertible augmented block including the
  compact observations and multipliers, in uniformly local growth-weighted versions of these norms.
  On a cylindrical piece the weight has a rate strictly above $2$,
  with a positive buffer above the propagation rate; bounded terminal bands use a fixed larger rate if necessary.
  The conical norms are those of 9, with the compact commutations used in 20.
  The inverse constant is uniform in $B$ with these weights retained.
  Its physical norm, and any fixed number of contour or finite-parameter derivatives,
  may have fixed polynomial losses. Exits are pure graph charts with the outgoing derivative trace prescribed.
  The fast Neumann lift gains $O \( sqrt(E) \)$ in strip size relative to smooth fixed angular-order derivative
  data. Under conjugation the exit is the corresponding Robin condition, as in Lemma 21.

Finally, Lemmas 18 and 12 give analyticity of the complete prescribed-gauge map,
  including the compact transition charts. On a bounded scaled band, for strip size $W$ and $E asymp B^(- 2)$,
  its nonlinear remainder and difference are bounded by

#[#set math.equation(numbering: n => "(4.36)")
 $ C \( B W^2 + B^2 W^3 \) \, wide C \( B W + B^2 W^2 \) parallel u - tilde(u) parallel . $ <arr:tame-interface>]

Second derivatives remain in the strip $L^2$ factor and first derivatives in the available traces;
  these estimates hold at the full fixed angular order. Thus they are estimates for the full operator.
  On height bands the corresponding estimate is Lemma 19. In the present preliminary construction only bounded
  scaled gauge changes are needed.

Here is the exit-data class for that construction. Let $g_(upright("app"))$ be the outgoing derivative of its
  comparison graph in the prescribed pure exit variable, after the fixed graph-unit conversion.
  If $T$ is the exit and $rho_B$ the growth weight of 20, permit exactly the data satisfying

#[#set math.equation(numbering: n => "(4.37)")
 $ rho_B \( T \)^(- 1) parallel g - g_(upright("app")) parallel_(cal(T)_(E \( T \) \, h)^N) lt.eq
   c_(upright("exit")) B^(- 4) . $ <arr:allowed-traces>]

For fixed $s$ and contour parameters, use the prescribed real pullbacks to identify each exit with a fixed
  boundary circle, and choose the reference scales $E \( T \)$ and $rho_B \( T \)$ independently of $p$ on the
  outer parameter ball. The varying geometric scales are uniformly comparable there.
  Let $frak(T)_B$ be the product of these complex trace spaces,
  with norm the maximum of the left-hand norms in (4.37), and write $delta
  g = \( g - g_(upright("app")) \)_(upright("exits"))$. The fixed constant $c_(upright("exit"))$ is chosen for the
  finite collection of homotopies under consideration, with a fixed factor of room in the contraction
  construction. Along a smooth contour homotopy the same bound holds for its values,
  while each required derivative of its normalized coefficients and data has a fixed polynomial bound.
  The natural trace norm is part of the inverse, so no unproved angular trace is used in lifting these data.

We also fix the parameter reserve used below. For constants $0 < c_(upright("in")) <
  c_(upright("out"))$ and an exponent $L$, put

#[#set math.equation(numbering: n => "(4.38)")
 $ cal(B)_s^(upright("out")) = { \| p - p_0 \( s \) \| < c_(upright("out")) \| s \|^L } \, wide cal(B)_s =
   { \| p - p_0 \( s \) \| < c_(upright("in")) \| s \|^L } . $ <arr:parameter-reserve>]

Solves are constructed on the outer ball and all uniform fixed parameter derivatives are evaluated on the inner
  ball. Cauchy’s estimate then costs only a fixed power of $\| s \|^(- 1)$ at each fixed order.
  The finitely many later ball and sector restrictions are chosen at once;
  their sectors retain an excess $delta_(upright("use")) = theta.alt_delta delta asymp
  D^(- 1 \/ 2)$ for one fixed $0 < theta.alt_delta < 1$.

#thm([Proposition 4.7.])[
  (Preliminary normalized arrays).  #emph[Fix $D$, the bounded scaled portions of the contour families of
    Lemma 17, and a fixed lower radius $r_(*) > 0$. Let $p_0 \( s \)$ be a sufficiently high polynomial truncation
    of $hat(p) \( s \)$. For some fixed $L$ and outer ball in (4.38),
    for every $p in cal(B)_s^(upright("out"))$ and every choice of outgoing data in (4.37) at the artificial
    exits, the normalized stationary problem on either contour family has a unique solution in the perturbative
    neighborhood. For each fixed contour, the solution operator is jointly holomorphic in $p$ and an independent
    complex trace remainder $delta g in frak(T)_B$ for $p in cal(B)_s^(upright("out"))$ and $parallel delta g
    parallel_(frak(T)_B) < c_(upright("hol")) B^(- 4)$, with a fixed $c_(upright("hol")) > c_(upright("exit"))$.
    Hence a chosen $p$-dependent datum gives a holomorphic solution when $delta
    g \( p \)$ is holomorphic into that fixed trace space and remains in the stated trace ball on
    $cal(B)_s^(upright("out"))$. Smooth contour families with smooth prescribed data give smooth solution
    families. Every allowed solution lies in the growth-weighted augmented ball
$ parallel \( u \, lambda \) - \( u_(upright("app")) \, lambda_(upright("app")) \) parallel_(X_B) lt.eq
  C_(upright("pre")) B^(- 4) \, $

 where the fixed $C_(upright("pre"))$ is chosen before $B$. In the preceding strip norms its correction satisfies
#[#set math.equation(numbering: n => "(4.39)")
 $ W \( z \) lt.eq C_D B^(- 4) \( 1 + \| z \| \)^2.2 . $ <arr:preliminary-bound>]

 Its compact and conical correction is $O \( B^(- 4) \)$. In particular on $\| z \| asymp
   B$ its discrepancy from circular data is $O \( B^(- 1.8) \)$.
   The same conclusions hold in one such neighborhood along curtailment, path,
   and exit-data homotopies that retain the fixed lower radius and (4.37),
   with the just stated regularity of the data for the corresponding family-regularity conclusion.
   This includes the first fixed-radius height turn, but not the subsequent shrinking height turns.
   Fixed finite parameter derivatives on $cal(B)_s$ and the prescribed smooth contour derivatives have only
   polynomial losses in $B$ and $\| s \|^(- 1)$.]
] <arr:preliminary-solves>

#proof[
  Use the exact family $S_b$ as base, with its multiplier and the first multiplier jet in the comparison pair.
    Remove the first-order transverse tilt by analytic rotations of the individual ends,
    cut off on fixed compact collars. On the real incoming part add the linear opening jet and the nonlinear part
    of $R_c$, starting the latter beyond a fixed end entrance.
    Before changing the spatial contour, cut off the small noncircular remainders on a bounded logarithmic band
    and use $R_c$ alone on the complex part. All cutoffs are prescribed functions on the real parameter domain.
    They are never evaluated at an unknown complex spatial argument.
  Here is the size of the residual. On the compact and conical pieces the constant and linear terms have been
    solved, so it is $O \( B^(- 4) \)$, including the observation error.
    On a cylindrical piece the no-axial-derivative circular equation vanishes exactly on $R_c$.
    The base error is $O \( z^(- 2 + eta) \)$; the nonleading part of the first opening jet is
    $O \( B^(- 2) z^eta \)$. Their interactions beyond first order have size at most $C
    B^(- 4) \( 1 + \| z \| \)^(2 + eta')$. The axial curvature terms carry $z^(- 2)$;
    expansion where $\| beta z^2 \|$ is small gives the same bound. Choose the fixed losses so that $eta' < 0.06$.
    On the final bounded logarithmic bands, direct differentiation of $R_c$ and of the prescribed cutoff gives
    $O \( B^(- 2 + eta') \)$. Thus the output residual is bounded by
  $ C_D B^(- 4) \( 1 + \| z \| \)^2.06 . $
  Small compact corrections enforce the observations exactly.
    The exit derivative is that of the comparison profile, so its initial derivative residual is zero.
  Apply Proposition 20 with rate $2.2$, keeping the strict buffer above $2.06$,
    and with the bounded-band weights specified above. Its hypotheses hold:
    before the bounded outer part the coefficients are small perturbations of the cylindrical family;
    on that part Lemma 17 gives the diffusion signs, and the reference remains transverse with nonsingular drift.
  We verify the index hypothesis separately, using a homotopy of operators on fully stopped domains.
    Straightening an adverse geometric bypass would cross the pole of the circular profile;
    the following argument does not do so.
  Fix $B$ and finite conical stopping sections, and pull every chart back to its prescribed real parameter domain.
    The scalar graph variations and scalar normal sources describe the same complex normal line of the reference
    immersion. Identifying a graph variable with its normal component multiplies the unknown and the source by the
    same nonzero graph-speed factor. This is conjugation of the operator and changes only lower-order terms.
    Its principal tensor is therefore a single geometric tensor $A$.
    The local drift divisions give smooth nonzero row multipliers $m_i$ for which $"Re" \( m_i A \)$ is positive
    definite, with the sign chosen for minus the second-order part.
    This is the strict radial and angular accretivity and small mixed coefficient on the cylindrical and height
    charts. It follows from closeness to the real reference on the core and its collars,
    and from Lemma 9 on conical pieces. The spatial coordinate changes on the pulled-back domains are real,
    so transform the tensors by real congruence and preserve positivity.
  Choose a nonnegative real partition of unity $chi_i$ subordinate to these charts and define $m =
    sum_i chi_i m_i$. Then, for every nonzero real covector $xi$,
  $ "Re" #scale(x: 120%, y: 120%)[\(] m A \( xi \, xi \) #scale(x: 120%, y: 120%)[\)] =
    sum_i chi_i "Re" #scale(x: 120%, y: 120%)[\(] m_i A \( xi \, xi \) #scale(x: 120%, y: 120%)[\)] > 0 . $
  Consequently $m$ is nonzero everywhere. Multiplication of the entire source row,
    including the compact multiplier columns, by $m$ is a range isomorphism and produces one globally accretive
    principal tensor. This avoids imposing an unsupported common phase on the different local normalizing factors.
  The graph-unit identification may write an actual exit condition as $\( partial_t + q \) u = 0$.
    Choose a smooth function $F$ supported in a collar of that exit, with $F_t = - q$ on its boundary,
    and put $u = e^F v$, multiplying the source by $e^(- F)$ as well.
    The boundary condition becomes exactly $v_t = 0$, while the principal tensor is unchanged.
    Disjoint collars allow this at every exit; entrance Dirichlet data stay zero.
    Fix all these isomorphisms before the homotopy. For the compact index calculation take the ordinary $H^2$
    domain with these homogeneous boundary conditions and range $L^2$,
    together with the finite multiplier and observation spaces. These spaces remain fixed along the homotopy.
    Positive smooth weights at a fixed stop give equivalent norms at this order;
    they do not identify the higher angularly commuted spaces with an isotropic higher Sobolev scale.
  Choose a real Riemannian metric which is a product in the exit collars,
    so that $partial_t$ there is a nonzero multiple of its normal derivative.
    Convexly interpolate the globally normalized principal tensor to its positive inverse metric,
    and interpolate the lower coefficients to those of $- Delta + 1$.
    Every intermediate principal tensor has positive real part.
    The scalar boundary symbol has one decaying normal root for each nonzero real tangential covector.
    This root cannot be zero, since the tangential quadratic form has positive real part.
    Thus the fixed transverse derivative condition stays complementing; so does Dirichlet data.
    The endpoint $- Delta + 1$ with these mixed Dirichlet/Neumann conditions is invertible by its coercive
    variational form and boundary regularity, and has index zero.
    Keep the transformed compact observations and multiplier columns fixed along this homotopy.
    Their equal-dimensional augmentation has index zero too.
  This proves the required index assertion on the actual fully stopped domains.
    Boundary regularity makes its kernel smooth, so the weighted estimate applies at the actual geometric operator
    and gives bijectivity on the compact $H^2$–$L^2$ realization.
    For smooth data the solution obeys the full angularly commuted target estimates;
    smooth approximation then gives the inverse from $Y_B$ to $X_B$, with the same bound.
    Exhaustion of the conical ends then proceeds exactly as in Proposition 20;
    the artificial compact homotopy is not used on the infinite ends.
  The resulting linear correction satisfies (4.39). On every outer strip its nonlinear Lipschitz factor is at most
  $ C_D \( B W + B^2 W^2 \) = O_D \( B^(- 0.8) \) \, $
  and on earlier strips the local axial scale is at most $C_D B$, so the factor is no larger.
    Fixed compact and conical pieces have the ordinary small perturbation factors.
    For $B$ large the correction map therefore preserves a fixed multiple of (4.39) and contracts there.
    This proves existence and uniqueness in that neighborhood.
  This application needs the uniform weighted inverse. A merely polynomial bound for the original correction would
    not imply the small factor just displayed. Polynomial losses are used only after the exact perturbative
    solution has been constructed.
  The construction is uniform over the compact collections of normalized contours for fixed $D$ and fixed lower
    radius. The outgoing lift of (4.37) has $X_B$ size at most $C c_(upright("exit")) B^(- 4)$.
    Choose a fixed $c_(upright("hol")) > c_(upright("exit"))$ and $C_(upright("pre"))$ to include that larger
    trace ball; the same contraction then works on an open neighborhood of the stated closed data class for large
    $B$. The full stops use $g = g_(upright("app"))$. Curtailment and smoothing use the comparison derivative of
    the same local reference at their moving exit; at the common pre-pole endpoint both problems have the same
    path, scalar exit unit, and comparison derivative. The real stopped family below checks the consecutive-stop
    data separately. At the initial fixed-radius height transition,
    34 verifies the natural trace size $O \( B^(- 2.8) \)$, below the available outer strip size $B^(- 4)
    rho_B \( T \) asymp B^(- 1.8)$, and places the solve in the same preliminary ball.
    Its separate refined inverse covers the later shrinking paths and their trace interpolations.
    For each fixed contour, choose a bounded complex-linear outgoing trace lift on the identified spaces,
    supported outside the observation core. After subtracting this lift, the unknown has homogeneous exits,
    and its equation is jointly analytic in the unknown, $p$, and the independent remainder $delta g$.
    Uniform contraction on the larger trace ball gives the asserted joint Banach-space holomorphy.
    The actual full-stop and curtailment data are comparison derivatives of the analytic reference profiles at
    prescribed real path parameters; their remainders, and affine interpolations with coefficients independent of
    $p$, are holomorphic in $p$. The consecutive real stops have the same property.
    Proposition 34 checks it for the fixed-radius comparison interpolation and for the later actual shorter traces
    in the refined solver. Cauchy estimates on $cal(B)_s$ cost $C_D \|
    s \|^(- L j)$ at each fixed derivative order $j$. Differentiating a smooth contour homotopy uses the same
    linearized inverse and the stipulated differentiated coefficient and data bounds.
    This proves the final derivative assertion.
  There is no requirement that $b = O \( B^(- 2) \)$: typically $b = O \( s \) = O \( B^(- 2 \/ k) \)$.
    It belongs to a fixed small analytic neighborhood of $S_b$, which is an exact base family.
    Only the openings have size $O \( B^(- 2) \)$. ◻
]

Let $G_plus.minus \( s \, p \)$ be the Gaussian action integrated all the way to the indicated artificial exits of
  these solves. The $s$ argument records the contour and exit prescription;
  it is distinct from the holomorphic finite parameter $p$.

#thm([Lemma 4.8.])[
  (Endpoint first variation).  #emph[At fixed compact observation values,
    a differentiable family of the preceding exact normalized solves satisfies
$ frac(d G, d tau) = sum_(upright("exits")) upright("boundary position and momentum terms") . $

 This algebraic identity holds for prescribed artificial Neumann data satisfying (4.37),
   and for the refined class later proved in 34. No natural boundary condition or vanishing boundary momentum is
   required. For the preliminary fixed-radius, bounded-scaled families,
   if the moving exits satisfy $"Re" z^2 gt.eq H$, and the normalized shapes,
   exit data and their derivatives have polynomial bounds in $B$, then,
   after any fixed finite parameter differentiations,
#[#set math.equation(numbering: n => "(4.40)")
 $ lr(|frac(d G, d tau)|) lt.eq C_D B^M e^(- H \/ 4 + o \( B^2 \)) . $ <arr:endpoint-estimate>]

 Consequently, on slightly smaller parameter balls and sectors,
#[#set math.equation(numbering: n => "(4.41)")
 $ \| macron(partial)_s partial_p^alpha G_plus.minus \( s \, p \) \| lt.eq
   C_(alpha \, D) \| s \|^(- M_alpha) e^(- D \/ \( 5 \| a \| \)) $ <arr:dbar>]

 for each fixed $alpha$.]
] <arr:first-variation>

#proof[
  Write the pulled-back area density as $cal(L) \( X \, D X \) = e^(- X dot.op X \/ 4) sqrt(det g)$.
    For a domain with moving boundary, differentiation and one integration by parts give
  $ delta G = integral_Omega cal(Q) \( X \) dot.op delta X + integral_(partial Omega) Pi_nu dot.op delta X +
    integral_(partial Omega) cal(L) thin v_(partial Omega) \, wide Pi_nu = cal(L)_(D X) nu . $
  The equation and the compact constraints turn the interior term into $lambda dot.op delta sans(P) \( p \)$.
    Tangential changes contribute only to the boundary: algebraic reparametrization covariance gives
    $cal(Q) \( X \) dot.op D X = 0$. These identities continue bilinearly to the prescribed complex charts.
    The observation charts are fixed on their compact support,
    so no moving-coordinate term is hidden in $delta sans(P)$. At fixed $p$ the interior term is zero.
    Prescribed Neumann data determine a solve; they do not set $Pi_nu$ equal to zero,
    and the displayed boundary terms are retained.
  For those preliminary families, the area and momentum prefactors,
    endpoint velocities and solution variations have polynomial bounds by Proposition 23.
    Along these fixed scaled contours, $"Re" \( X dot.op X \) = "Re" z^2 + o \( B^2 \)$;
    bounded transverse radii and the small relative graph corrections account for the error. This proves (4.40).
    At the full stop $H = D B^2$, absorb the polynomial factors and the $o \( B^2 \)$ loss into the strict margin
    from $1 \/ 4$ to $1 \/ 5$. Variation of $s$ at fixed $p$ changes only the domain, contour and exit data.
    Applying the identity to its two real derivatives gives (4.41).
    Finite $p$-derivatives follow by Cauchy estimates on the slightly larger ball.
    The same reasoning treats changes of exit prescriptions at fixed observations.
    The refined family uses the same algebraic identity, with its separate shape and Gaussian-height estimates in
    36; its trace class alone is not used to infer (4.40). ◻
]

In particular, on a real evaluation ray the adverse leading poles
  $Z_(j \, upright("lead"))^2 = \( - c_j a \)^(- 1)$ are positive,
  and the scale (4.2) is their minimum divided by four. Curtail the two contours at $"Re" z^2 = 3 /
  4 Z_(j \, upright("lead"))^2$ and use (4.7) to make their boundary problems identical.
  Their solutions then agree by perturbative uniqueness. Integration of (4.40), with fixed polynomial losses, proves

#[#set math.equation(numbering: n => "(4.42)")
 $ \| partial_p^alpha \( G_(+) - G_(-) \) \( s \, p \) \| lt.eq
   C_(alpha \, D) \| s \|^(- M_alpha) e^(- \( 0.7 - o \( 1 \) \) A_(upright("lead"))) .
   $ <arr:fixed-parameter-comparison>]

Here and below the notation permits replacing $0.7 - o \( 1 \)$ by any slightly smaller fixed number for all
  sufficiently small $s$. The actual endpoint exponent tends to $0.75$.
  Nonadverse and smaller-order openings may retain common farther exits.
  For parameters real to leading order only, the same argument has $1 +
  o \( 1 \)$ errors in the leading Gaussian heights and remains valid.
  It does not require that the two arrays be conjugates.

=== 4.5 Full-disk approximants and Gevrey remainders <full-disk-approximants-and-gevrey-remainders>

The exact contour solves already have small endpoint errors.
  We next relate their actions to the formal action, with estimates at every Taylor order.
  Real contours stopped at increasing radii give holomorphic approximants on shrinking parameter disks.
  Their exponentially small successive differences are what produce the factorial bounds below.
  The relation between Gevrey remainders and exponential flatness is classical #cite(label("MR1992"))
  Sections 1.3–1.6; the proof here constructs the required approximants for these normalized stationary problems.

#thm([Lemma 4.9.])[
  (Real stopped polydiscs).  #emph[There are a fixed small complex $b$-neighborhood, $d_0 > 0$,
    and $H_0$ with the following property. For every independent stop length $H gt.eq H_0$,
    stop each cylindrical end on its real path at height comparable to $H$, leaving the conical ends infinite. For
$ b upright(" in that neighborhood") \, wide \| x \| < d_0 H^(- 2) \, $

 the normalized comparison problem has a solution $U_H \( b \, x \)$, holomorphic in these finite parameters.
   In the analogue of $X_B$ with $B$ replaced by $H$, its correction from the base-plus-first-jet comparison pair
   is at most $C H^(- 4)$. Thus the cylindrical strip bound is $C
   H^(- 4) \( 1 + z \)^2.2$ and the compact and conical correction is $O \( H^(- 4) \)$.
   The paths and cutoffs are real and independent of the finite parameters,
   and the outgoing comparison derivatives are holomorphic in them. For real parameters the stopped surface is real.]
  #emph[Let $F_H \( b \, x \)$ be its Gaussian action. It is holomorphic and uniformly bounded on a fixed smaller
    polydisc. If $H lt.eq H' lt.eq Lambda H$ for fixed $Lambda$, then on the common smaller polydisc
#[#set math.equation(numbering: n => "(4.43)")
 $ \| F_(H') - F_H \| lt.eq C_Lambda e^(- c_Lambda H^2) . $ <arr:real-stop-difference>]

 For every fixed $0 < nu < 1$, the real $U_H$ is a small normal graph over $S_b$ on $\| Y \| lt.eq
   2 H^nu$ for large $H$. Its action outside the part over $\| Y \| lt.eq H^nu$ is at most $C H^d e^(- c H^(2 nu))$.]
] <arr:real-stops>

#proof[
  The length $H$ is a parameter of this boundary problem, not $\| s \|^(- k \/ 2)$.
    Since $beta \( b \, x \)$ is linear in $x$ with bounded coefficients,
    choosing $d_0$ small keeps $\| beta \| H^2$ uniformly small.
    For real parameters the chosen circular branch has positive radius.
    On the complex polydisc it remains in a fixed small neighborhood of that positive real comparison,
    so its denominator units and the strict normalized diffusion bounds on the real path persist throughout the
    stop. Use the same base, first opening jet, and prescribed outer cutoff as in 23.
    On the outer cutoff band the base noncircular remainder is $O \( H^(- 2 + eta) \)$,
    and the nonleading first jet is $O \( H^(- 2 + eta) \)$. With $eta < 0.06$,
    their cutoff residual is bounded by $C H^(- 4) \( 1 + z \)^2.06$ there.
    Before that band the solved constant and linear terms give the same bound;
    on the compact and conical pieces it is $O \( H^(- 4) \)$.
    The weighted inverse and contraction from the preliminary proof therefore apply with $H$ in place of $B$.
    This argument includes $x = 0$. In that case the stopped base can differ from $S_b$ because the noncircular
    tail was cut off before the exit.
  The data and the operator are analytic in $\( b \, x \)$ on the displayed polydisc,
    and uniform contraction gives the asserted holomorphy. For consecutive stops move the real endpoint and always
    use the comparison derivative in its current pure graph coordinate.
    Any interpolation needed to identify the two outer cutoffs changes a smooth derivative by
    $O \( H^(- 2 + eta) \)$. Its natural Neumann norm is $O \( H^(- 3 + eta) \)$,
    since $sqrt(E) asymp H^(- 1)$ there. This is below the permitted trace size $H^(- 4) rho_H \( T \) asymp
    H^(- 1.8)$, so the whole homotopy consists of exact normalized solves.
    Along it $Re \( X dot.op X \) gt.eq c H^2$ at the exit, and all position, momentum,
    and variation factors grow at most polynomially. Endpoint first variation proves (4.43);
    changing $c$ absorbs the polynomial factors and the fixed ratio $Lambda$.
    On the conical ends the small complex link graphs retain $Re \( X dot.op X \) gt.eq c \| Y \|^2 - C$,
    and their first traces give polynomial area bounds. The resulting integrable Gaussian dominates the
    holomorphic density uniformly on a smaller parameter polydisc.
    Differentiation under that integral gives holomorphy of $F_H$ and its uniform action bound.
  For the final assertion take real parameters. On $z lt.eq
    3 H^nu$ the opening displacement is $O \( H^(- 2) z^2 \)$, an end tilt contributes $O \( H^(- 2) z \)$,
    and the correction is $O \( H^(- 4) \( 1 + z \)^2.2 \)$ in the strip and first-trace norms.
    These quantities and their physical first derivatives tend to zero for $nu < 1$.
    On a conical end the first opening jet with compact exterior source belongs to the conical entrance domain by
    the inverse identification in the family proof. Its link displacement is $O \( H^(- 2) \)$,
    and the correction has link norm $O \( H^(- 4) \)$. The conical first-derivative traces therefore give the
    same smallness on $\| Y \| lt.eq 3 H^nu$. This larger region remains inside every cylindrical stop for large
    $H$, since $nu < 1$; the conical ends are infinite. Choose the real projection branches there.
    Their inverse projections over $\| Y \| lt.eq 2 H^nu$ stay in the larger region,
    because the graph displacements and slopes tend to zero while the radial margin is $H^nu$.
    The uniform real tubular neighborhood of $S_b$ then puts the graph descriptions in a common normal graph on
    $\| Y \| lt.eq 2 H^nu$. On the remaining real cylindrical pieces $\| X \| asymp
    z$ and the area density has polynomial bounds from the first traces;
    on the conical pieces $\| X \|$ is comparable to their radial coordinate and their area density is polynomial.
    Integrating the Gaussian on those tails proves the claimed action bound. ◻
]

#thm([Lemma 4.10.])[
  (Geometric telescoping).  #emph[For any sufficiently high real-coefficient polynomial path $p_0 \( s \)$ with
    the specified opening jet and any sufficiently large fixed $ell$,
    the arrays $G_plus.minus \( s \, p_0 \( s \) + s^ell h \)$, uniformly for $h$ in a fixed complex ball,
    have the formal stationary expansion of Gevrey order $1 \/ k$.
    More precisely, if that expansion is $sum_(n gt.eq 0) f_n \( h \) s^n$, then
#[#set math.equation(numbering: n => "(4.44)")
 $ parallel f_n parallel & lt.eq C A^n Gamma \( 1 + n \/ k \) \,\
∥G_plus.minus \( s \, p_0 \( s \) + s^ell h \) - sum_(n < N) f_n \( h \) s^n∥ & lt.eq
  C A^N Gamma \( 1 + N \/ k \) \| s \|^N quad \( N gt.eq 0 \) . $ <arr:gevrey-coeff>]

 The norm is the supremum on a fixed smaller $h$-ball. These statements hold also after any fixed finite number of
   parameter derivatives. The constants can depend on $D$.]
] <arr:gevrey>

#proof[
  Take the real stopped problems of Lemma 25 with $R_j = R_0 Lambda^j$, $Lambda > 1$, and set
  $ F_j \( s \, h \) = F_(R_j) \( p_0 \( s \) + s^ell h \) . $
  There are full complex $s$-disks
  $ \| s \| lt.eq r_j = d R_j^(- 2 \/ k) $
  on which this construction is holomorphic in $\( s \, h \)$, uniformly for $h$ in a fixed complex ball.
    Indeed $ell$ is chosen at least $k$, so $x = O \( s^k \) = O \( R_j^(- 2) \)$,
    and $b$ remains in the fixed neighborhood. Choose $d$ small enough for the stopped polydisc.
    The independent length formulation includes the center $s = 0$;
    it does not substitute an infinite value for $B$ there.
  For consecutive radii the common disk is the smaller one. Equation (4.43) gives
  $ parallel F_j - F_(j - 1) parallel_(\| s \| lt.eq r_j) lt.eq C e^(- c R_j^2) \; $
  the fixed ratio of successive radii has merely changed $c$. Polynomial factors are absorbed by decreasing $c$.
    Set $D_j = F_j - F_(j - 1)$ for $j gt.eq 1$, and $D_0 = F_0$. Cauchy’s estimate yields
  $ parallel \[ s^n \] D_j parallel lt.eq C e^(- c R_j^2) d^(- n) R_j^(2 n \/ k) . $
  For $t_j = R_j^2$, reserve $e^(- c t_j \/ 2)$ for the convergent geometric-scale sum,
    and maximize the remaining expression:
  $ sup_(t > 0) t^(n \/ k) e^(- c t \/ 2) = (frac(2 n, c k e))^(n \/ k) . $
  It follows that
  #[#set math.equation(numbering: n => "(4.45)")
   $ sum_(j gt.eq 1) e^(- c R_j^2) R_j^(2 n \/ k) lt.eq C A^n Gamma \( 1 + n \/ k \) . $ <arr:moment-sum>]
  Thus $tilde(f)_n = \[ s^n \] F_0 + sum_(j gt.eq 1) \[ s^n \]
    D_j$ exists as a holomorphic function of $h$ and satisfies the coefficient bound in (4.44).
    At this point it is the coefficient series of the stopped telescope; its identification is proved below.
  For the all-orders remainder, fix $0 < theta.alt < 1$ and take $J = J \( s \)$ maximal with $\| s \| lt.eq
    theta.alt r_J$. Then $R_J^2 asymp \| s \|^(- k)$. Writing $T_(N - 1)$ for the Taylor polynomial through degree
    $N - 1$, the exact identity is
  #[#set math.equation(numbering: n => "(4.46)")
   $ F_J - sum_(n < N) tilde(f)_n s^n = sum_(j = 0)^J \( D_j - T_(N - 1) D_j \) -
     sum_(j > J) T_(N - 1) D_j . $ <arr:telescoping-remainder>]
  For $j lt.eq J$, the Taylor remainder is at most
  $ frac(C e^(- c R_j^2), 1 - theta.alt) \| s \|^N r_j^(- N) \, $
  with the ordinary analytic bound for $D_0$. For $j > J$, put $x_j = \| s \| \/ r_j > theta.alt$.
    For every $N gt.eq 1$,
  $ sum_(n < N) x_j^n lt.eq N theta.alt^(- N) x_j^N . $
  Use (4.45) on both sums in (4.46), absorbing $N theta.alt^(- N)$ into $A^N$.
    This proves the stated remainder for every $N$, including orders beyond optimal truncation.
  We now identify the coefficient series using only real graph comparisons.
    Fix an order $n$ and choose $M$ with $k \( M + 1 \) > n$.
    Choose $0 < nu_M < 1$ so small that the degree-$M$ polynomial height and its first two derivatives are
    $o \( 1 \)$ on $\| Y \| lt.eq 2 H^(nu_M)$ whenever $\| x \| lt.eq C H^(- 2)$.
    This is possible by its fixed polynomial growth; for example, if that growth has degree $D_M$,
    take $nu_M D_M < 1 \/ 2$. On real parameters Lemma 25 puts $U_H$ in the same small normal graph there.
    Its normalized residual and observation error vanish: the real change of graph variable transforms the scalar
    source row with the graph speed, while the compact observations and the multiplier $lambda_H$ retain their
    fixed variational normalization. Fix the real Gaussian exponent $a_G = 1$.
    The small graph neighborhood can be chosen with retained density exponent $c_G > 1 \/ 2$, so $a_G < 2 c_G$.
    In the reference comparison lemmas use their weight $a = a_G$.
    Applying Lemma 3.13, Lemma 3.12 with outer radius $R = 2 H^(nu_M)$ and $theta.alt = 1 \/ 2$ gives
  $ parallel chi_R \( u_H - v^(\( M \)) \) parallel_(cal(H)_(a_G)^2) + \| lambda_H - lambda_M \| lt.eq
    C_M \| x \|^(M + 1) + H^(d_M) e^(- c_M H^(2 nu_M)) . $
  Here the annular commutator is controlled by the real first-trace bounds and the $C^2$-small Taylor graph.
    The real action-tail bound of Lemma 25 and (3.38) then yield
  #[#set math.equation(numbering: n => "(4.47)")
   $ \| F_H \( p \) - f_M \( p \) \| lt.eq C_M \| x \|^(M + 1) +
     H^(d_M) e^(- c_M H^(2 nu_M)) . $ <arr:stopped-taylor-value>]
  The Taylor graph in this comparison is used only on the inner domain.
    The full $f_M$ is the integral of its finite polynomial coefficient densities,
    whose tails were included in the estimate. Thus the argument neither requires a global uncut polynomial
    immersion nor changes real normal graphs by a complex spatial reparametrization.
  Apply (4.47) with $H = R_(J \( s \))$ on $s > 0$ and $h$ in a fixed smaller real ball.
    The balance $H^2 asymp s^(- k)$ and $\| x \| = O \( s^k \)$ make the right side $O \( s^(k \( M + 1 \)) \)$
    plus a function smaller than every power of $s$, uniformly on this real ball.
    For the fixed $M$, the function $f_M \( p_0 \( s \) + s^ell h \)$ is an ordinary analytic function of
    $\( s \, h \)$ on a sufficiently small neighborhood. The formal composition of $cal(F)$ has the same
    coefficients through order $n$: every omitted $x$ monomial has formal $s$-valuation at least $k \( M + 1 \)$.
    This valuation statement does not assign a numerical bound to the omitted formal tail.
  The already proved telescoping remainder, with $N = n + 1$, is uniform on the smaller complex $h$-ball,
    even though $J \( s \)$ jumps. Compare it with the ordinary Taylor expansion of
    $f_M \( p_0 \( s \) + s^ell h \)$ and (4.47). Inductively subtract the lower identified powers,
    divide by $s^n$, and let $s arrow.b 0$. This identifies $tilde(f)_n \( h \)$ with the coefficient
    $f_n \( h \)$ of the formal stationary composition on the real ball.
    Both sides are holomorphic in $h$, so the identity extends to the complex ball.
    Since $n$ was arbitrary, the stopped coefficient series is exactly the formal stationary action.
    The weaker cutoff exponential in (4.47) is used only for this identification;
    the $e^(- c R_j^2)$ endpoint telescope supplies all Gevrey bounds.
  The sector array and $F_J$ can be curtailed to a common inner real-path region at radius $c_D B$.
    Their boundary problems are connected by the homotopies already constructed, at fixed observations.
    Endpoint first variation gives
  $ parallel G_plus.minus - F_J parallel lt.eq C_D e^(- b_D \/ \| s \|^k) \, wide b_D > 0 . $
  For every $N$,
  $ e^(- b_D \/ \| s \|^k) lt.eq (frac(N, b_D k e))^(N \/ k) \| s \|^N lt.eq
    C A_D^N Gamma \( 1 + N \/ k \) \| s \|^N . $
  This transfers the all-orders remainder. Finally, Cauchy’s estimate on nested fixed $h$-balls gives these bounds
    for derivatives in the scaled variable $h$. Derivatives in the original parameter $p$ additionally require
    fixed division; their proof is given after Lemma 27, in (4.49).
    The gamma weight is equivalent, up to exponential factors in $N$, to $\( N ! \)^(1 \/ k)$. ◻
]

#thm([Lemma 4.11.])[
  (Fixed divisions and regular implicit operations).  #emph[The class of arrays in Lemma 26,
    with their full-disk exponentially telescoping approximants, is stable under finite sums, products,
    analytic operations on a fixed bounded neighborhood, and regular finite-dimensional implicit solution.
    It is also stable under division by a fixed power $s^q$ when its first $q$ formal coefficients vanish
    identically on the parameter ball. Division means the quotient of actual sector values.
    A formally zero result satisfies $C e^(- c \/ \| s \|^k)$ for some $c > 0$.]
] <arr:division>

#proof[
  Sums, products and a fixed analytic operation preserve exponential telescoping by their bounded derivatives on
    slightly smaller fixed neighborhoods. For division the exact remainder identity is
  $ R_N \( s^(- q) F \) = s^(- q) R_(N + q) \( F \) . $
  The ratio of gamma weights with the fixed shift $q$ has at most polynomial growth in $N$,
    which is absorbed in a larger exponential base.
  The disk approximants need a correction: formal vanishing of the limiting coefficients does not make $F_j \/
    s^q$ holomorphic. Use instead
  #[#set math.equation(numbering: n => "(4.48)")
   $ tilde(F)_j = frac(F_j - T_(q - 1) F_j, s^q) . $ <arr:low-jet-subtraction>]
  On a fixed smaller disk their differences are bounded by
  $ C r_j^(- q) e^(- c R_j^2) lt.eq C e^(- c' R_j^2) . $
  Each removed low coefficient has limit zero and is therefore an exponentially small tail of the coefficient
    telescoping sum. At $J \( s \)$, its value after division by $s^q$ has only a fixed polynomial loss,
    so remains exponentially small. Thus (4.48) approximates the actual quotient with the required accuracy.
    Uniform formal vanishing on the whole parameter ball is essential in this argument.
  For implicit solution suppose the normalized equation is $H \( s \, z \) = 0$,
    with leading equation $H_0 \( z \) = 0$, root $z_0$, and invertible $A = D_z H_0 \( z_0 \)$.
    Take the corrected disk approximants $H_j$. Their centered telescoping gives, for any fixed $0 < theta.alt < 1$,
  $ parallel H_j \( s \, dot.op \) - H_0 parallel_(\| s \| lt.eq theta.alt r_j) lt.eq C r_j + C e^(- c' R_j^2) . $
  In fact the constant-coefficient tail is exponentially small,
    while the nonconstant parts are bounded by $\| s \|$ times the convergent sum $sum_(nu gt.eq 1) e^(- c R_nu^2)
    r_nu^(- 1)$, together with the fixed initial analytic term.
    Cauchy’s estimate on a smaller $z$-ball gives the same convergence for the first $z$-derivative.
    Shrink that fixed ball and the disks so that
  $ Psi_(j \, s) \( z \) = z - A^(- 1) H_j \( s \, z \) $
  is a contraction with a common constant $q_(*) < 1$ and maps that ball into itself.
    Its roots $z_j \( s \)$ are holomorphic, and subtraction of their equations gives
  $ parallel z_j - z_(j - 1) parallel lt.eq frac(parallel A^(- 1) parallel, 1 - q_(*)) thin parallel H_j -
    H_(j - 1) parallel . $
  They therefore telescope exponentially on full disks. Lemma 26 supplies their coefficient and all-orders
    remainder bounds. The same contraction estimate compares the actual sector root with the stopped approximant.
    This proves implicit closure with remainders. If every formal coefficient is zero, choose $N =
    floor.l c_0 \| s \|^(- k) floor.r$ in the remainder bound, where $c_0 > 0$ is small.
    Stirling’s bound gives $C e^(- c \/ \| s \|^k)$. ◻
]

===== 4.5.1 Unscaled parameter derivatives. <unscaled-parameter-derivatives.>

To complete the derivative assertion of Lemma 26, fix a multi-index $alpha$, put $q = ell \| alpha \|$, and write

$ F \( s \, h \) = G \( s \, p_0 \( s \) + s^ell h \) \, wide H = partial_h^alpha F =
  s^q \( partial_p^alpha G \) \( s \, p_0 \( s \) + s^ell h \) . $

Only the undifferentiated Gevrey statement is used initially.
  Cauchy’s estimate on nested fixed $h$-balls gives the all-orders bounds for $H$,
  and exponential telescoping and sector comparison for $H_j = partial_h^alpha F_j$.
  The ordinary formal jet $cal(F) in bb(R) { b } \[ \[ x \] \]$ has no negative powers after substitution:
  every occurrence of $h$ carries $s^ell$. Thus, if $hat(F) = sum f_n \( h \) s^n$,
  then $partial_h^alpha f_n equiv 0$ for $n < q$, identically on the whole parameter ball.
  This includes mixed base and opening derivatives, and follows from the formal chain rule,
  independently of any unscaled derivative bound.

Apply the fixed-division part of Lemma 27. The holomorphic disk approximants for the actual quotient $s^(- q) H$ are

$ K_j = frac(H_j - T_(q - 1) H_j, s^q) \, wide parallel K_j -
  K_(j - 1) parallel_(\| s \| lt.eq theta.alt r_j) lt.eq C_alpha r_j^(- q) e^(- c R_j^2) lt.eq
  C'_alpha e^(- c' R_j^2) \, quad 0 < c' < c . $

For $q = 0$ no subtraction is made. To check the actual sector values,
  uniform formal vanishing gives $\[ s^m \] H_J = - sum_(j > J) \[ s^m \] \( H_j - H_(j - 1) \)$ for $m < q$.
  At the balanced index $theta.alt r_(J + 1) < \| s \| lt.eq theta.alt r_J$, these finitely many tails and $H -
  H_J$ have a common positive exponential decay constant $b$, and therefore give

$ parallel s^(- q) H - K_J parallel lt.eq \| s \|^(- q) parallel H - H_J parallel +
  sum_(m < q) \| s \|^(m - q) parallel \[ s^m \] H_J parallel lt.eq C_alpha e^(- b' \/ \| s \|^k) \, wide 0 < b' < b . $

The decreased exponent absorbs only fixed powers of $\| s \|^(- 1)$;
  individual stopped approximants were not assumed divisible.
  Finally, with $R_N$ denoting the remainder after degree $N - 1$,

#[#set math.equation(numbering: n => "(4.49)")
 $ parallel R_N \( s^(- q) H \) parallel = \| s \|^(- q) parallel R_(N + q) \( H \) parallel lt.eq
   C_alpha A_alpha^N Gamma \( 1 + N \/ k \) \| s \|^N quad \( N gt.eq 0 \) . $ <arr:unscaled-remainder>]

Indeed $Gamma \( 1 + \( N + q \) \/ k \) \/ Gamma \( 1 + N \/ k \) lt.eq C_(q \, k) \( N + 1 \)^(q \/ k)$;
  a larger fixed exponential base absorbs this ratio. The coefficient bound follows by the same fixed shift.
  This proves the assertion for every order, including beyond optimal truncation,
  using a division proof that requires no unscaled derivative closure.

=== 4.6 Replacing a divergent critical arc <replacing-a-divergent-critical-arc>

The formal critical arc need not converge, so it cannot simply be substituted into an actual contour action.
  We select finitely many equations with maximal rank, approximate their free coordinates by polynomials,
  and solve for the remaining coordinates. The next lemma shows algebraically why this replacement retains every
  original formal constraint; the proposition after it performs the actual sector solve.

#thm([Lemma 4.12.])[
  (Maximal rank and adic substitution).  #emph[Let $f_0 = cal(F) - cal(F) \( 0 \)$ and $f_i =
    partial_(p_i) cal(F)$. There are finitely many expressions $g_1 \, dots.h \, g_r$,
    each obtained from these formal series and coordinates by finitely many partial differentiations and
    polynomial operations, such that the following holds. After choosing coordinates $p = \( u \, v \)$,
    $g_u$ has a minor $Delta$ nonzero along $hat(p)$. Replacing the free coordinates $v$ by sufficiently accurate
    polynomial approximations and solving $g = 0$ formally preserves all the equations $f_i = 0$.
    The substitution converges adically despite possible divergence of $hat(p)$.]
] <arr:formal-replacement>

#proof[
  Let $cal(A) subset bb(R) \[ \[ p \] \]$ be the full differential polynomial algebra generated by the $f_i$ and
    all coordinate functions. Let
  $ I = { f in cal(A) : f \( hat(p) \( s \) \) = 0 } \, wide K_s = bb(R) \( \( s \) \) . $
  Choose $g_1 \, dots.h \, g_r in I$ with maximal gradient rank over $K_s$.
    Although the closure $cal(A)$ is infinite, each selected expression is finite and $r lt.eq dim p$.
    Split $p = \( u \, v \)$ so $A = g_u$ is invertible along the arc, and put $Delta = det A$ and $m =
    "ord"_s Delta \( hat(p) \) < oo$. For each free coordinate set
  $ D_j = Delta partial_(v_j) - #scale(x: 120%, y: 120%)[\(] "adj" \( A \) g_(v_j) #scale(x: 120%, y: 120%)[\)]
    dot.op partial_u \, wide E_j = Delta^(- 1) D_j . $
  The operators $D_j$ preserve $cal(A)$, and $D_j g_i = 0$ identically.
    For every $f in I$, maximality implies $d f \( hat(p) \) in "span"_(K_s) { d g_i \( hat(p) \) }$.
    Hence $D_j f \( hat(p) \) = 0$, or $D_j I subset I$. Ordinary partial differentiation need not preserve $I$;
    it is this cofactor tangency that does.
  The denominators of iterated intrinsic derivatives admit an explicit bound. For $n gt.eq 1$ and $h in cal(A)$,
  #[#set math.equation(numbering: n => "(4.50)")
   $ E_(j_1) dots.h.c E_(j_n) h = P_n / Delta^(2 n - 1) \, wide P_n in cal(A) . $ <arr:denominator>]
  The first denominator is $Delta$, and the induction is
  $ E_j \( P \/ Delta^q \) = frac(Delta D_j P - q P D_j Delta, Delta^(q + 2)) . $
  If $h in I$, all numerators remain in $I$. Thus every iterated intrinsic derivative of every original constraint
    vanishes along the arc.
  Translate to $hat(p) \( s \)$ and apply formal implicit inversion over $K_s$ to obtain a graph in $eta = v -
    hat(v) \( s \)$. On that graph $E_j$ is differentiation in $eta_j$.
    Apply (4.50) also to the coordinate functions $u_i$. Each coefficient of total $eta$-degree $n$ has
    $s$-valuation at least $- \( 2 n - 1 \) m$. If $"ord"_s eta gt.eq N > 2 m$,
    its degree $n$ contribution therefore has valuation at least
  $ n N - \( 2 n - 1 \) m = m + n \( N - 2 m \) arrow.r oo . $
  The substitution is adically convergent and the dependent displacement has order at least $N - m$.
    All original constraints have zero intrinsic Taylor coefficients, so remain zero after substitution.
    Both free and dependent displacements have positive valuation;
    the same bound justifies rearranging their formal evaluations.
    This is not an evaluation of a divergent numerical series.
    If $r = 0$, take $Delta = 1$ and all coordinates free; the same argument says all relevant Taylor coefficients
    vanish. If there are no free coordinates, no substitution is necessary. ◻
]

#thm([Proposition 4.13.])[
  (A regular implicit solve in each array).  #emph[For the $g_i$ selected above,
    form actual expressions $g_(plus.minus \, i) \( s \, p \)$ by applying the same finite differentiations and
    polynomial operations to
$ G_plus.minus \( s \, p \) - cal(F) \( 0 \) \, wide nabla_p G_plus.minus \( s \, p \) . $

 There are parameter functions $p_plus.minus \( s \)$ on the two sectors,
   obtained by regular analytic implicit operations after fixed-power rescaling,
   for which $g_plus.minus \( s \, p_plus.minus \) = 0$. They have the same formal expansion,
   with real coefficients. For every original constraint
$ e_(plus.minus \, 0) = G_plus.minus \( s \, p_plus.minus \) - cal(F) \( 0 \) \, wide e_(plus.minus \, i) =
  partial_(p_i) G_plus.minus \( s \, p_plus.minus \) \, $

 there is $c_2 \( D \) > 0$ such that
#[#set math.equation(numbering: n => "(4.51)")
 $ \| e_(plus.minus \, i) \| lt.eq C_D e^(- c_2 \( D \) \/ \| a \|) \,
   wide \| macron(partial)_s e_(plus.minus \, i) \| lt.eq C_D \| s \|^(- M) e^(- D \/ \( 6 \| a \| \)) .
   $ <arr:initial-flatness>]

]
] <arr:regular-implicit>

#proof[
  First fix the inner evaluation ball of (4.38), with exponent $L_0$,
    and the finite derivative orders occurring in the selected $g_i$.
    Its polynomial distance from the outer solve ball fixes all Cauchy bounds and possible polynomial losses
    before any further rescaling. Let $m$ be the valuation of the selected minor.
    If the second derivatives needed below are bounded, choose
  $ ell gt.eq max { L_0 + 1 \, m + 1 } . $
  If they have a previously fixed loss $\| s \|^(- M_0)$, choose instead $ell > max { L_0 \, m + M_0 }$.
    In either case enlarge $ell$ to the fixed threshold required in Lemma 26, in particular $ell gt.eq k$,
    and then set $N = ell + m + 1$. Increase $N$ and the polynomial approximation order if needed to preserve all
    finite derivatives and leading minor coefficients. Take a real polynomial center $p_0 = \( u_0 \, v_0 \)$
    agreeing with $hat(p)$ modulo $s^N$, and freeze $v = v_0$.
    In either array put $J_0 \( s \) = g_u \( s \, p_0 \( s \) \)$.
    The finite-order expansion and the nonzero formal minor give
  $ g \( s \, p_0 \) = O \( s^N \) \, quad det J_0 = s^m \( d_0 + O \( s \) \) \, quad d_0 eq.not 0 \, quad
    parallel J_0^(- 1) parallel = O \( \| s \|^(- m) \) . $
  Allowing a larger fixed order for the center makes these statements unchanged when a fixed derivative loss is present.
  Set $u = u_0 + s^ell h$, and consider the actual equation
  #[#set math.equation(numbering: n => "(4.52)")
   $ H \( s \, h \) = s^(- ell) J_0 \( s \)^(- 1) g \( s \, u_0 + s^ell h \, v_0 \) = 0 . $ <arr:normalized-implicit>]
  Taylor’s formula in $u$ is the exact identity
  $ H = h + s^(- ell) J_0^(- 1) g \( s \, p_0 \) + s^ell J_0^(- 1) integral_0^1 \( 1 - t \)
    g_(u u) \( s \, u_0 + t s^ell h \, v_0 \) \[ h \, h \] thin d t . $
  Thus $H \( s \, 0 \) = O \( s \)$ and
  $ H_h = I + O \( \| s \|^(ell - m - M_0) \) $
  on a fixed $h$-ball, with $M_0 = 0$ in the bounded case. It is a uniformly regular implicit problem,
    and contraction gives $h = O \( s \)$. Since $ell > L_0$,
    the whole fixed $h$-ball used in this equation lies strictly inside the previously chosen inner evaluation
    ball for small $s$. The physical displacement of its root is the still smaller $O \( s^(ell + 1) \)$.
    Free coordinates have been approximated more accurately than the allowed dependent displacement;
    this pays the amplification by $s^(- m)$.
  We check the divisions needed for Gevrey closure uniformly in $h$. Write
  $ H = #scale(x: 120%, y: 120%)[\(] s^(- m) det J_0 #scale(x: 120%, y: 120%)[\)]^(- 1) s^(- \( ell + m \))
    "adj" \( J_0 \) g \( s \, u_0 + s^ell h \, v_0 \) . $
  The first factor is the inverse of a unit. The numerator of the second quotient has zero formal coefficients
    below order $ell + m$, identically in $h$: the constant term has order $N > ell + m$,
    the linear term is $det J_0 thin s^ell h$, and the quadratic term starts at order $2 ell gt.eq ell + m$.
    Hence Lemma 27, with its low-Taylor subtractions for the disk approximants, applies to these actual quotients.
    Their leading equation is $H_0 \( h \) = h$. The regular implicit roots have the Gevrey expansion given by
    formal inversion. Lemma 28 identifies it with the substituted formal arc and proves that every original
    constraint has zero formal expansion. This gives the first estimate in (4.51).
  For the antiholomorphic estimate differentiate the exact selected equations.
    Holomorphy in $p$ and the polynomial nature of $v_0$ give
  #[#set math.equation(numbering: n => "(4.53)")
   $ macron(partial)_s u = - g_u \( s \, p \( s \) \)^(- 1) macron(partial)_s g \( s \, p \( s \) \) \, wide
     macron(partial)_s f \( s \, p \( s \) \) = macron(partial)_s f +
     f_u thin macron(partial)_s u . $ <arr:antiholomorphic-chain>]
  Here $H_h = J_0^(- 1) g_u$ is uniformly invertible, so the actual $g_u^(- 1)$ has only the fixed loss
    $O \( \| s \|^(- m) \)$. Every selected $g_i$ uses finitely many parameter derivatives and polynomial
    operations, so (4.41) bounds its fixed-parameter antiholomorphic derivative with only further fixed powers.
    The chain rule therefore loses only powers of $\| s \|^(- 1)$.
    For fixed $D$ these are absorbed between the constants $D \/ 5$ and $D \/ 6$, proving the second bound.
    The constants and the ball radius $c_D \| s \|^(L_0)$ may depend on $D$; no exponentially small ball is used. ◻
]

=== 4.7 Improving flatness on the evaluation ray <improving-flatness-on-the-evaluation-ray>

At this point each action’s difference from the base critical value, and its gradient,
  are exponentially small at their separately selected parameters,
  but the decay constant is not yet large enough for the jump comparison.
  Their much smaller antiholomorphic derivatives allow the sector argument below to improve that constant.
  We then move both actions to one common parameter value.

#thm([Lemma 4.14.])[
  (Almost-holomorphic exponential improvement).  #emph[Suppose an error $e \( w \)$ on an exterior sector
$ \| w \| > R \, wide \| arg w \| < pi \/ 2 + delta $

 satisfies
$ \| e \( w \) \| lt.eq C_D e^(- c_2 \( D \) \| w \|) \, wide \| macron(partial)_w e \( w \) \| lt.eq
  C_D \( 1 + \| w \| \)^M e^(- D \| w \| \/ 6) \, quad c_2 \( D \) > 0 . $

 Then on the ray $arg w = pi \/ 2$,
#[#set math.equation(numbering: n => "(4.54)")
 $ \| e \( w \) \| lt.eq C'_D exp { - D sin \( delta \/ 2 \) \| w \| \/ 8 } . $ <arr:improved-exponent>]

 In particular, if $delta gt.eq c D^(- 1 \/ 2)$, the obtainable decay coefficient tends to infinity with $D$.]
] <arr:flatness-upgrade>

#proof[
  Put $A = \( D \/ 8 \) e^(- i delta \/ 2)$. Choose $epsilon.alt > 0$ so small that
  $ epsilon.alt < delta \/ 2 \, wide D sin epsilon.alt \/ 8 < c_2 \( D \) \/ 2 . $
  For each fixed $D$ both conditions can be met, regardless of how small $c_2 \( D \)$ is. The sector between the rays
  $ alpha = delta \/ 2 - pi \/ 2 + epsilon.alt \, wide beta = delta \/ 2 + pi \/ 2 - epsilon.alt $
  has opening $pi - 2 epsilon.alt < pi$, lies within the available sector,
    and contains the evaluation ray strictly. On its two sides $"Re" \( A w \) = \( D \/ 8 \) \| w \| sin
    epsilon.alt$, so $H = e^(A w) e$ is bounded. It also has at most order-one exponential growth and is bounded
    on the finite inner circular boundary. Its antiholomorphic source satisfies
  $ \| accent(partial H, ‾) \| lt.eq C_D \( 1 + \| w \| \)^M e^(- D \| w \| \/ 24) . $
  Extend this source, not $H$, by zero to the plane, calling the extension $Q$. It belongs to $L^1 ∩ L^oo$.
    The Cauchy transform
  $ V \( w \) = 1 / pi integral_(bb(C)) frac(Q \( zeta \), w - zeta) thin d A \( zeta \) $
  is bounded. Indeed the contribution from $\| w - zeta \| < 1$ is at most $2 parallel Q parallel_oo$,
    and the complement is at most $pi^(- 1) parallel Q parallel_1$.
    Distributionally $accent(partial V, ‾) = Q$; hence $H - V$ is holomorphic in the exterior sector,
    has bounded boundary values including the inner arc, and has order at most one.
  For completeness the required Phragmén–Lindelöf step follows from the maximum principle. Choose
  $ 1 < rho < frac(pi, pi - 2 epsilon.alt) . $
  With sector center $theta_0 = delta \/ 2$, the real part of $\( e^(- i theta_0) w \)^rho$ is positive on the
    closed sector. Multiply $H - V$ by $exp { - tau \( e^(- i theta_0) w \)^rho }$, $tau > 0$.
    Its outer-circle values tend to zero as the radius tends to infinity, since $rho > 1$;
    its side and inner-arc values are bounded by the original boundary bound.
    The maximum principle on truncated sectors followed by the limits at infinity and then $tau arrow.b
    0$ shows $H - V$ bounded. Since $V$ is bounded, so is $H$.
    At $arg w = pi \/ 2$, $"Re" \( A w \) = D \| w \| sin \( delta \/ 2 \) \/ 8$, which proves (4.54). ◻
]

For the upper array use $w = i \/ a = i \/ s^k$. Its retained sector has the geometry of the lemma with excess
  $delta_(upright("use")) gt.eq c D^(- 1 \/ 2)$; changing from $s$ to this branch of $w$ adds only a polynomial
  factor to the antiholomorphic derivative. Apply Lemma 30 to each error in (4.51).
  The lower array is treated by reflection of the sector variable.
  Thus, for any prescribed finite $K > 0$, first choosing $D$ sufficiently large and then $s$ sufficiently small gives

#[#set math.equation(numbering: n => "(4.55)")
 $ \| G_plus.minus \( s \, p_plus.minus \) - cal(F) \( 0 \) \| + \| nabla_p
   G_plus.minus \( s \, p_plus.minus \) \| lt.eq C_K e^(- K \/ \| a \|) $ <arr:arbitrary-flatness>]

on the evaluation ray. The $D$-dependent constants do not affect this order of limits.

#thm([Proposition 4.15.])[
  (The common-parameter action upper bound).  #emph[The formal critical arc (4.1) implies that there are common
    parameters $p \( s \)$, having a formal expansion with real coefficients, such that
#[#set math.equation(numbering: n => "(4.56)")
 $ G_(+) \( s \, p \( s \) \) - G_(-) \( s \, p \( s \) \) =
   O \( e^(- 1.25 A_(upright("lead"))) \) . $ <arr:upper-estimate>]

 Here $A_(upright("lead"))$ is the minimum leading adverse action scale in (4.2).
   If there is a negative real leading opening, the evaluation is on positive real $s$.
   If all nonzero leading openings are positive, the evaluation is at $a <
   0$ with the two continuations taken on the same sheet in $s$; the common parameters may then be complex.
   In particular this conclusion includes even $k$. After a sufficiently small fixed generic change of evaluation
   angle the same assertion holds with $1.2$ in place of $1.25$, using $A_(upright("lead")) =
   min \| Z_(j \, upright("lead")) \|^2 \/ 4$.]
] <arr:action-upper>

#proof[
  Use the same polynomial center and the same free coordinates for the two regular implicit solves.
    The finite expressions defining $g_plus.minus$, the selected inverse minor and all rescalings have only
    polynomial losses. Apply (4.42) on their common inner evaluation ball and then subtract the two uniformly
    contracting normalized equations. It follows that
  #[#set math.equation(numbering: n => "(4.57)")
   $ \| p_(+) \( s \) - p_(-) \( s \) \| lt.eq C_D \| s \|^(- M) e^(- \( 0.7 - o \( 1 \) \) A_(upright("lead"))) .
     $ <arr:parameter-comparison>]
  Their midpoint $p = \( p_(+) + p_(-) \) \/ 2$ lies in the same ball,
    with room provided by the fixed-$h$ inclusion proved above.
    When the data and evaluation parameter are real, choose conjugate contours and prescriptions;
    uniqueness gives $p_(-) = overline(p_(+))$, so the midpoint is real. The estimate itself uses no conjugacy.
  The Hessians of the actions have polynomial bounds on the common ball.
    Taylor expansion from each $p_plus.minus$ to $p$, with (4.55), gives
  $ \| G_plus.minus \( s \, p \) - cal(F) \( 0 \) \| lt.eq C_K e^(- K \/ \| a \|) + C_K e^(- K \/ \| a \|) \| p -
    p_plus.minus \| + C_D \| s \|^(- M) \| p - p_plus.minus \|^2 . $
  Since $A_(upright("lead")) lt.eq C_A \/ \| a \|$ for a fixed $C_A$, choose $K > 1.4 C_A$,
    so $K \/ \| a \| > 1.4 A_(upright("lead"))$. The last term has exponent $\( 1.4 - o \( 1 \) \)
    A_(upright("lead"))$; the fixed powers are absorbed in the margin between $1.4$ and $1.25$.
    Subtracting the two estimates proves (4.56). The common formal parameter series has real coefficients because
    the selected formal equations and the polynomial free path are real and formal implicit inversion is unique.
  If all nonzero $c_j$ are positive, changing the sign of real $s$ does not solve the problem when $k$ is even.
    Instead choose the continuous argument with $arg a = pi$, so $arg s = pi \/ k$.
    Use the two argument intervals $\( - delta_(upright("use")) \, pi + delta_(upright("use")) \)$ and
    $\( pi - delta_(upright("use")) \, 2 pi + delta_(upright("use")) \)$ for $a$,
    taking $arg s = \( arg a \) \/ k$ continuously on both. Their overlap therefore gives the same value of $s$
    near $arg s = pi \/ k$, not values differing by $2 pi \/ k$.
    Equivalently, all the preceding constructions are made on a fixed local covering chart in the $s$-plane;
    $a$ only labels its leading scale. The effective opening coefficients are now negative real to leading order.
    Higher terms need not be real. Strict contour margins persist under these $o \( 1 \)$ changes,
    and the common-curtailment estimate has only $1 + o \( 1 \)$ changes in its Gaussian heights.
    The flatness-upgrade variable is rotated accordingly. Thus (4.57) and the same midpoint Taylor estimate hold
    with complex $p$. No identification of the two arrays by conjugation,
    and no reality of their actual subleading parameters, has been assumed.
  Finally fix $D$, all contour margins, and a decay constant in (4.55) with room to spare.
    A sufficiently small fixed change of evaluation angle stays inside the sectors and preserves the positive
    multiplier gain in Lemma 30. The endpoint Gaussian real parts change continuously by a small relative amount.
    The preceding $1.4$ quadratic margin therefore still gives exponent $1.2$.
    This is the open range of angles available for the later separation of distinct Laurent principal parts. ◻
]

== 5 The collapsing end and its action jump <sec:jump>

We compute the difference of the two stationary actions at the same parameter $p = \( b \, x \)$,
  hence at the same compact observation value $sans(P) \( p \)$ in the notation of 4.
  The two actions are evaluated on solutions of the complexified stationary equation.
  In particular, the translator that appears below is a limit of exterior complex boundary problems;
  no translating cap in the mean curvature flow is assumed.

Write $B = \| a \|^(- 1 \/ 2)$, and fix the contour constants before letting $B arrow.r oo$.
  An adverse end has opening coefficient $beta$ and

#[#set math.equation(numbering: n => "(5.1)")
 $ Z_0 = \( - beta \)^(- 1 \/ 2) \, wide \| Z_0 \| asymp B \, wide r^2 \/ 2 = 1 - z^2 \/ Z_0^2 . $ <jump:pole>]

The branch of $Z_0$ is near the positive real axis. A sufficiently small fixed change of the parameter’s
  evaluation angle is permitted. All constants below are uniform under that change and on the finite set of
  adverse ends. Squares, inner products and square roots are complex bilinear,
  with branches continued from the positive real area element.

The leading pole square in (4.2) is $\( - c_j a \)^(- 1)$, whereas (5.1) uses the actual first-jet square $-
  1 \/ beta_j \( p \( s \) \)$ at the common parameters. Their ratio is $c_j a \/ beta_j \( p \( s \) \) = 1 +
  o \( 1 \)$ on the fixed admissible ray and finite adverse end list.
  This relative comparison preserves strict margins in rates proportional to $B^2$;
  it does not identify their Gaussian exponentials up to a relative $1 + o \( 1 \)$ factor.
  The mean-matching radius $Z$ and shifted exterior radius $Z_(*)$ are distinct again, defined in (5.4) and (5.5) below.

We use the following precise interfaces from the preceding sections.
  The preliminary normalized solutions of 23, for the holomorphic comparison-data families used here,
  have discrepancy $O \( B^(- 1.8) \)$ in the strip and trace norms on fixed scaled bands,
  and are holomorphic in the finite parameters on balls of fixed power radius.
  The contours of 17 have strict diffusion margins and allow shortening and the height turns described below.
  The estimates in Lemma 3.3, Lemma 4.5, Proposition 4.4 provide, respectively,
  local strip and boundary estimates, exponential suppression of far boundary data on a fixed overlap,
  and the normalized global inverse with growing weights retained until the final estimate.
  Finally, Lemma 4.2, Lemma 4.3 apply to the full commuted nonlinear operators in the prescribed mixed and height
  gauges. We spell out the weights and the small quantities needed in each application;
  an unweighted polynomial inverse is used only for an exponentially small residual.

We first synchronize the complete nonadverse boundary problems at the full stop $Re z^2 = D B^2$.
  On the chosen evaluation ray every nonzero nonadverse leading pole is on the favorable side,
  so in the normalized coordinate of 17 its direction $p_(*)$ satisfies $Re \( 1 \/ p_(*) \) < 0$,
  with a fixed margin on the nearby rays in use. The favorable part of that proof first deforms each profile to an
  admissible ray. A ray $u = h \( 1 - i m \)$ is admissible there when $Re \( \( 1 - i m \) \/ p_(*) \) < 0$;
  this inequality is affine in $m$. Interpolating its slope to $m =
  0$ therefore keeps the strict inequality and the same horizontal stop.
  The initial real collars are held fixed, and the strict tangent conditions permit the stated smoothing at their
  joins. Smaller-order openings already use the real path. First, on each original fixed path,
  interpolate any permitted remainder datum linearly to zero in its normalized natural trace ball (4.37),
  which is convex. Then deform the path while prescribing the outgoing derivative of its varying comparison
  profile. Both arrays consequently reach the same nonadverse path and the same comparison-profile outgoing
  derivative on each end. All these normalized data and path derivatives have fixed polynomial bounds.

This synchronization is an actual change of the normalized actions.
  Write $G_plus.minus^(upright("syn"))$ for the resulting actions.
  Preliminary uniqueness supplies the normalized homotopies, and 24 gives

#[#set math.equation(numbering: n => "(5.2)")
 $ \| G_plus.minus - G_plus.minus^(upright("syn")) \| lt.eq C_D B^M e^(- D B^2 \/ 5) . $ <jump:nonadverse-sync>]

The estimate retains boundary-height variations caused by the data change, even at a fixed exit.
  Increase $D$, before choosing $B$, so that $D \/ 5 > max_(j med upright("adverse")) \( 4 \| c_j \| \)^(- 1)$
  with a fixed margin. The pole comparison and (5.4)–(5.5) below give $Z_(* \, j)^2 \/
  Z_(j \, upright("lead"))^2 = 1 + o \( 1 \)$, so the right side of (5.2) is then negligible relative to each
  absolute adverse action scale. Below the starting arrays are these synchronized ones.
  Their nonadverse paths, exit sections, and outgoing derivative prescriptions remain fixed and identical through
  all subsequent shortening and terminal-data homotopies. Their boundary heights need not agree,
  so the corresponding far boundary momenta will still be retained in the action estimate.

=== 5.1 Prescribed height charts and the matched phase <prescribed-height-charts-and-the-matched-phase>

First shorten the adverse contours while their exits satisfy $Re \( z^2 - Z_0^2 \) gt.eq c B^2$.
  They can then follow the shrinking circular profile to a small fixed radius and turn above or below zero in
  $r^2$, ending near $arg r^2 = plus.minus 2 pi \/ 3$. On a turn require

#[#set math.equation(numbering: n => "(5.3)")
 $ Re thin d log r < 0 \, wide Re #scale(x: 120%, y: 120%)[\(] Z^2 d \( r^2 \) #scale(x: 120%, y: 120%)[\)] < 0 .
   $ <jump:turn>]

The inequalities have fixed margins after parametrization.
  They say that the angular diffusion advances and that the real fast exponent increases.
  One obtains them by starting with a radial decrease, turning on a slightly contracting spiral,
  and stopping before phase $pi$ in $r^2$. The homotopies from the original contours are those of 17;
  at a real adverse pole their defining inequality is affine in $Y^2$ and $\( Y^2 \)'$ for $z^2 \/ Z_0^2 = h +
  i Y$. Strictness persists under the fixed small phase change.
  Thus this deformation costs, by 24, at most a fixed power of $B$ times $exp \( - Re Z_0^2 \/ 4 - c B^2 \)$ in action.

Choose a shared real incoming section $r = r_0$, with $r_0 > 0$ small and fixed.
  On fixed overlaps use one prescribed transverse parametrization

$ X \( t \, theta \) =
  #scale(x: 120%, y: 120%)[\(] B \( zeta_0 \( t \) + c_1 \( t \) u \) \, \( R_0 \( t \) + c_2 \( t \) u \)
  e_r \( theta \) #scale(x: 120%, y: 120%)[\)] . $

The reference determinant $c_2 zeta'_0 - c_1 R'_0$ stays away from zero;
  the terminal gauge is pure relative height. Coefficients and cutoffs are prescribed on the real parameter
  interval. This is a single quasilinear graph problem, and does not require inversion of an unknown complex
  spatial coordinate.

Fix a real interval $0 lt.eq t lt.eq T_(upright("pre"))$ beyond $r_0$, with $t =
  log \( r_0 \/ r \)$ and $T_(upright("pre")) > 0$ fixed, and reserve inside it a joining band separated by fixed
  positive gaps from both endpoints. Use a common preliminary solution stopped at $T_(upright("pre"))$,
  with the frozen nonadverse paths and data just specified, at exactly the given parameter $p$.
  All these choices precede the phase match. Define $Z$ by

#[#set math.equation(numbering: n => "(5.4)")
 $ frac(1, 2 pi) integral_(bb(S)^1) z \( r_0 \, theta \) thin d theta = Z phi.alt \( r_0 \) \, wide
   phi.alt \( r \) = sqrt(1 - r^2 \/ 2) . $ <jump:matching-Z>]

Then $Z \/ Z_0 = 1 + O \( B^(- 1.8) \)$. The relative-height discrepancy at this section has zero mean and strip
  and trace size $O \( B^(- 1.8) \)$. Define $d_0$ and $Z_(*)$ by

#[#set math.equation(numbering: n => "(5.5)")
 $ \( r^(- 1) - r \/ 2 \) d'_0 + d_0 \/ 2 & = - phi.alt'' \/ \( phi.alt' \)^2 \, wide d_0 \( r_0 \) = 0 \,\
d_0 \( r \) & = 2 log r + d_(*) + O \( r^2 \( 1 + \| log r \| \) \) \,\
Z_(*) & = Z + Z^(- 1) #scale(x: 120%, y: 120%)[\(] d_(*) - 2 log \( Z \/ 2 \) #scale(x: 120%, y: 120%)[\)] \,\
y & = Z_(*) r \/ 2 \, wide h = \( Z_(*) - z \) Z_(*) \/ 2 . $ <jump:d0>]

Logarithms are continued from positive real numbers. There is no existence issue in (5.5): direct differentiation gives

#[#set math.equation(numbering: n => "(5.6)")
 $ (d_0 / phi.alt)' = frac(2, r phi.alt^4) \, wide d_0 \( r \) =
   phi.alt \( r \) integral_(r_0)^r frac(2 thin d s, s phi.alt \( s \)^4) . $ <jump:d0-integral>]

Expanding the integrand at zero proves (5.5), with $d_(*)$ real for the fixed real matching section.
  It also controls every fixed number of logarithmic derivatives on the chosen branches.

The leading comparison profile on the height chart is

#[#set math.equation(numbering: n => "(5.7)")
 $ g_c \( r \) = phi.alt \( r \) + Z^(- 2) d_0 \( r \) \, wide g = z \/ Z . $ <jump:height-profile>]

Its derivative is prescribed at the exit. Changing to that prescription on a fixed scaled bypass is allowed by the
  fast boundary lift below.

For a radial graph at this finite scale, put $l = h_y$. Its radial area form, continued from the positive real one, is

$ 2 pi r thin e^(- \( r^2 + z^2 \) \/ 4) sqrt(1 + z_r^2) thin d r . $

Substituting $r = 2 y \/ Z_(*)$ and $z = Z_(*) - 2 h \/ Z_(*)$ gives exactly

#[#set math.equation(numbering: n => "(5.8)")
 $ frac(8 pi, Z_(*)^2) e^(- Z_(*)^2 \/ 4) y e^h exp (- frac(h^2 + y^2, Z_(*)^2)) sqrt(1 + l^2) thin d y .
   $ <jump:physical-action>]

Thus one adverse end carries the exact action factor $Z_(*)^(- 2) e^(- Z_(*)^2 \/ 4)$.
  A relative $1 + o \( 1 \)$ approximation of $Z_(*)^2$ does not determine this exponential to relative $1 +
  o \( 1 \)$ accuracy. Finite relative end weights require $Z_(*)^2$ through an additive $o \( 1 \)$ error.
  The absolute expansion in 41 and the full-principal-part comparison in 42 supply that information after the
  local jump has been computed.

#thm([Proposition 5.1.])[
  (Universal action jump).  #emph[Let $G_(+)$ and $G_(-)$ be the two array actions at a common parameter $p$ in
    the inner parameter ball, and hence at common compact observation values,
    for a nonempty finite adverse end list with the same ordering of the bypasses on every end.
    Starting from these arrays, make the nonadverse synchronization (5.2) and use the single normalized
    preliminary solution stopped at $T_(upright("pre"))$ above.
    Match $Z_(* \, j)$ from that solution by (5.4)–(5.5). The adverse continuations use the canonical profile
    $g_c$ and outgoing remainder derivatives
$ psi = partial_s \( g - g_c \)\|_(upright("exit")) $

 in the natural Neumann trace class (5.25), in the prescribed real path parameter at each exit.
   Let $Y_0$ be the fixed large exit cutoff for this class. The continuation at the first fixed radius
   interpolates the preliminary circular derivative and that of $g_c$ as in Proposition 34.
   The longer shrinking branches have $psi = 0$ at their own exits,
   and the shorter interpolation uses their actual remainder traces at the common shorter section.
   Proposition 34 proves membership in the relevant uniqueness balls and exact equality of the interpolation
   endpoints with the longer restrictions.]
  #emph[For these actions there is a universal constant $frak(c) eq.not 0$ such that
#[#set math.equation(numbering: n => "(5.9)")
 $ G_(+) - G_(-) = frak(c) sum_(j med upright("adverse")) Z_(* \, j)^(- 2) e^(- Z_(* \, j)^2 \/ 4) +
   o (sum_(j med upright("adverse")) \| Z_(* \, j) \|^(- 2) e^(- Re Z_(* \, j)^2 \/ 4)) . $ <jump:action-jump>]

 With $c_0$ defined by the upper-minus-lower $y^2$ lateral labels in Lemma 37, $frak(c) =
   epsilon.alt_(upright("lab")) 8 pi c_0$ for one common $epsilon.alt_(upright("lab")) in { 1 \, -
   1 }$ determined by the array labels. Indeed an upper axial bypass in $z^2 \/
   Z_0^2$ becomes a lower $r^2$ bypass under $r^2 = 2 \( 1 - z^2 \/ Z_0^2 \)$; this is one global label reversal,
   not an end-dependent sign. Reversing both array labels reverses $frak(c)$.
   More precisely, the limsup of the relative error as $B arrow.r
   oo$ at fixed $Y_0$ is bounded by a quantity tending to zero as $Y_0 arrow.r oo$.]
] <jump:jump>

The remainder of this section constructs the stated height families,
  proves the two compatibility assertions and the endpoint estimate,
  and computes the common constant by the translator boundary momentum.

The exit radius will decrease to $\| y \| asymp Y$, where $Y gt.eq Y_0$ and $Y_0$ is a large fixed constant.
  On each final bypass, $\| y \| asymp Y$, the length is $O \( Y \)$, and

#[#set math.equation(numbering: n => "(5.10)")
 $ Re y_(upright(e))^2 lt.eq - c Y^2 . $ <jump:negative-exit>]

After $Z_(*)$ has been determined, put its small phase-alignment band strictly beyond the preliminary stop
  $T_(upright("pre"))$. It rotates the later incoming part so that $y$ is real there while preserving (5.3).
  Every exterior path agrees with the same real path on $\[ 0 \, T_(upright("pre")) \]$;
  in particular the joining band and its far-side gap precede this $Z_(*)$-dependent alignment and every terminal
  turn. Choose homothetic bypasses at intermediate scales, with bounded derivatives in logarithmic size.
  Choose every smoothing and phase-alignment profile once in normalized log coordinates,
  with joins and collars of fixed positive width; only the small phase parameters vary.
  Homothetic scaling then preserves uniform bounds for the logarithmic path tangent, its inverse,
  and every required fixed derivative.

=== 5.2 The inward height equation and its inverse <the-inward-height-equation-and-its-inverse>

For completeness, the exact height equation in polar orthonormal coordinates is

#[#set math.equation(numbering: n => "(5.11)")
 $ A z_(r r) + B_1 (z_r / r + z_(theta theta) / r^2) + 2 C_1 (z_(r theta) / r - z_theta / r^2) =
   frac(r z_r - z, 2) \, $ <jump:height-equation>]

where $\( A \, C_1 \; C_1 \, B_1 \)$ is $I - D z ⊗ D z \/ \( 1 + D z dot.op D z \)$ and $D
  z = \( z_r \, z_theta \/ r \)$. Put $t = log \( r_0 \/ r \)$ and $E asymp \| B r \|^(- 2)$.
  Multiplying (5.11) by $r^2 \/ Z$ gives the exact expression

#[#set math.equation(numbering: n => "(5.12)")
 $ A \( g_(t t) + g_t \) + B_1 \( g_(theta theta) - g_t \) - 2 C_1 \( g_(t theta) + g_theta \) + r^2 /
   2 \( g_t + g \) = 0 . $ <jump:log-height>]

On each bounded modified band this formula is pulled back to its real path parameter $s$.
  These bands include the phase transition beyond $T_(upright("pre"))$ making $y$ real and the terminal turn.
  Put $J = t_s$. The prescribed $J \, J^(- 1)$ and their fixed derivatives are bounded on these bands,
  and all strip norms there use $s$. It is useful to record the entire drift division.
  If the circular linearization in the $t$ coordinate is

$ \( 1 + tilde(b)_1 \) v_t - a_1 v_(t t) - a_2 v_(theta theta) + tilde(b)_0 v \, $

then its pullback, multiplied by $J$, is

$ D v_s - a_1 / J v_(s s) - J a_2 v_(theta theta) + J tilde(b)_0 v \, wide D = 1 + tilde(b)_1 + a_1 J_s / J^2 . $

We divide by this full nonzero coefficient $D$, including the chain-rule term.
  For the nonlinear equation and its residual, we use the fixed circular row (4.21) with $g_0 =
  g_c$ and $Delta_(upright("ref")) = D$. The factor $D$ is fixed at $g_c$ during graph variation,
  so the derivative of that normalized map is exactly the following circular operator even when the profile
  residual is nonzero:

#[#set math.equation(numbering: n => "(5.13)")
 $ cal(L)_0 v = v_s - a \( s \) v_(s s) - c \( s \) v_(theta theta) + q_0 \( s \) v . $ <jump:height-linear>]

On each long incoming piece $J = 1$, so $t$ differs from $s$ only by a fixed additive constant.

Here are the coefficient bounds, including the zeroth-order term needed on a turn. At circular data in (4.28), put

$ P = \( g_c \)_t \/ r^2 \, quad e = \( Z r \)^(- 2) \, quad H = \( 1 - r^2 \/ 2 \) P^2 - r^2 e \/ 2 . $

The radial, angular and zeroth-order coefficients before linearization are respectively $a_c = e \/ H$,
  $c_c = \( e + P^2 \) \/ H$, and $m_c = r^2 c_c \/ 2$. For $\| B r \| gt.eq Y_0$, $P \, H$ are bounded units,
  $a_(c \, P) = O \( E \)$, $c_(c \, P) = O \( E \)$, and $m_(c \, P) = O \( r^2 E \)$.
  More precisely, (5.6) gives $P = \( 2 phi.alt \)^(- 1) + O \( E \)$ and hence $H = 1 \/ 4 + O \( r^2 + E \)$,
  $a_c = 4 e \( 1 + O \( r^2 + E \) \)$, and $c_c = 1 + O \( r^2 + E \)$.
  Since $\( g_c \)_(t t) = O \( r^2 \)$ and $g_c = O \( 1 \)$, the circular linearized drift is

$ D_0 = 1 - r^(- 2) { a_(c \, P) \( g_c \)_(t t) + m_(c \, P) g_c } = 1 + O \( E \) . $

The pulled drift $D_0 + a_c J_s \/ J^2$ is therefore a uniform unit. In particular, after its division,

#[#set math.equation(numbering: n => "(5.14)")
 $ Re a gt.eq c_(*) E \, quad \| a \| lt.eq C_(*) E \, wide Re c gt.eq c_(*) \, quad \| c \| lt.eq C_(*) \,\
c = 1 + O #scale(x: 120%, y: 120%)[\(] \| r \|^2 \( 1 + \| log r \| \) + E #scale(x: 120%, y: 120%)[\)] quad
  upright("on the long incoming pieces") \,\
q_0 = O \( \| r \|^2 \) quad upright("on the whole path") . $ <jump:height-coefficients>]

All fixed normalized derivatives have the same bounds. We choose the initial phase transition as a slightly
  contracting spiral, so it has the same strict conditions as the terminal turn.
  On every modified band (5.3) says $Re J gt.eq c \| J \|$ and $Re \( Z^2 r^2 J \) gt.eq
  c \| Z^2 r^2 J \|$ with fixed relative margins. The preceding expansions then give the angular and radial
  inequalities in (5.14). The modified bands have bounded total logarithmic length and bounded variation of
  $log \| r \|$. Group adjacent modifications as one such band.
  At each interface with an incoming piece reserve a fixed $J = 1$ collar, included among the incoming pieces;
  all ramps of the oscillatory weight below take place on these collars.
  On the long incoming pieces, where $J = 1$, $E asymp B^(- 2) \| r \|^(- 2)$ increases toward the exit,
  $integral \| q_0 \| thin d s lt.eq C r_0^2$, and $integral E thin d s lt.eq C Y_0^(- 2)$.
  The bounded modified bands preserve these bounds up to fixed constants.
  We take $r_0$ small and then $Y_0$ large. Noncircular coefficient changes will be treated by the projected
  nonlinear estimates of 19.

Here and below the strip norm $X_E^h \( v \; I \)$ on a unit interval contains

#[#set math.equation(numbering: n => "(5.15)")
 $ parallel v parallel_(L_t^2 H_theta^h) + parallel v_t parallel_(L_t^2 H_theta^h) +
   parallel v_(theta theta) parallel_(L_t^2 H_theta^h) + parallel E v_(t t) parallel_(L_t^2 H_theta^h) +
   parallel sqrt(E) thin v_(t theta) parallel_(L_t^2 H_theta^h) \, $ <jump:strip-norm>]

together with the traces of $v \, v_theta \, sqrt(E) v_t$ at the same fixed sufficiently high angular order.
  On a strip the values of $E$ are comparable. Source norms are $L_t^2 H_theta^h$;
  the weights below are applied strip by strip. All fixed additional angular orders needed for smooth prescribed
  boundary data are chosen at the outset.

At this same angular order and in the prescribed relative-height units,
  this is the trace-augmented strip convention of (4.8), using the real path parameter on each modified band.
  The first traces are controlled on a fixed enlarged strip by (3.9),
  in the standing regime of a bounded positive diffusion scale and uniformly comparable values of $E$.
  The additional angular derivative in (5.21) concerns prescribed outgoing data.

We need a finite-interval inverse more precise than a local strip estimate.
  All the height paths below have length at least a fixed $T_min > 0$:
  the first fixed-radius exit is separated from the incoming section, and subsequent exits are farther inward.
  We use overlapping strips $I_nu$ of lengths between fixed positive constants,
  indexed in their order toward the exit. For any positive weight $omega$ with bounded logarithmic rate, put

$ parallel v parallel_(X_omega) = sup_nu omega_nu^(- 1) X_E^h \( v \; I_nu \) \, wide F_nu =
  parallel f parallel_(L^2 \( I_nu \; H^h \)) \, wide omega_nu = inf_(I_nu) omega . $

For the mean estimate we further require $omega$ to be nondecreasing on the long incoming pieces and to vary by a
  fixed bounded factor on the modified bands. Fix its logarithmic-rate bound and this factor before taking $E_(*)$
  small; the constants may depend on them. The weights used below satisfy these requirements.
  With $E_(*) = sup E lt.eq C Y_0^(- 2)$, define

#[#set math.equation(numbering: n => "(5.16)")
 $ frak(M)_omega \( f \) = sup_nu 1 / omega_nu {sum_(mu lt.eq nu + 1) F_mu +
   sum_(mu > nu + 1) e^(- c \( mu - nu - 1 \) \/ E_(*)) F_mu} . $ <jump:mean-source-norm>]

Changing the fixed overlap convention only changes the constants.

#thm([Lemma 5.2.])[
  (Finite height inverse).  #emph[On the real parameter interval $\[ 0 \, T \]$,
    let $cal(L)_0$ be the circular operator (5.13) with (5.14), the normalized derivative bounds just stated,
    $T gt.eq T_min$, and $E lt.eq E_(*)$ sufficiently small. For entrance data $phi$ in
    $cal(T)_(E \( 0 \) \, h)^D$ and outgoing coordinate-derivative data $psi$ in $cal(T)_(E \( T \) \, h)^N$,
    the problem
$ cal(L)_0 v = f \, wide v \( 0 \) = phi \, wide v_s \( T \) = psi $

 has a unique solution in the finite strip domain. Write subscripts $m \,
   o$ for its angular mean and nonconstant part. The mean satisfies
#[#set math.equation(numbering: n => "(5.17)")
 $ parallel v_m parallel_(X_omega) lt.eq C {frac(\| phi_m \|, omega \( 0 \)) + frak(M)_omega \( f_m \) +
   frac(parallel psi_m parallel_(cal(T)_(E \( T \) \, h)^N), omega \( T \))} . $ <jump:mean-inverse>]

 There is a weight $rho_o asymp \( \| r \| \/ r_0 \)^(9 \/ 10)$, with $rho_o \( 0 \) = 1$, logarithmic rate $-
   9 \/ 10$ on the long incoming pieces away from the reserved collars, bounded smooth interpolation on those $J =
   1$ collars, and rate zero on the bounded modified bands, for which
#[#set math.equation(numbering: n => "(5.18)")
 $ parallel v_o parallel_(X_(rho_o)) lt.eq C {parallel phi_o parallel_(cal(T)_(E \( 0 \) \, h)^D) +
   sup_nu \( inf_(I_nu) rho_o \)^(- 1) parallel f_o parallel_(L^2 \( I_nu \; H^h \)) +
   frac(parallel psi_o parallel_(cal(T)_(E \( T \) \, h)^N), rho_o \( T \))} . $ <jump:oscillatory-inverse>]

 The constants are independent of $B \, T$ and the exit size $Y in \[ Y_0 \, c B \]$.
   A fixed positive separation between the first exit and the entrance is included in this assertion.]
] <jump:height-inverse>

#proof[
  For the mean put $A = a^(- 1)$ and
  $ H \( s \, t \) = exp (- integral_s^t A \( u \) thin d u) \, wide F = f_m - q_0 v_m . $
  Solving the equation for $v_(m \, s)$ backward from its actual exit gives the exact formula
  #[#set math.equation(numbering: n => "(5.19)")
   $ v_(m \, s) \( s \) = H \( s \, T \) psi_m + integral_s^T H \( s \, t \) A \( t \) F \( t \) thin d t \, wide
     integral_s^T H \( s \, t \) A \( t \) thin d t = 1 - H \( s \, T \) . $ <jump:mean-kernel>]
  In particular the finite kernel does not have mass one at the terminal section.
    Its missing terminal layer has $L^2$ size $O \( sqrt(E \( T \)) \)$ when it multiplies bounded data.
    We keep that layer in (5.19).
  Accretivity gives $\| H \( s \, t \) \| lt.eq exp \( - c integral_s^t E^(- 1) \)$ and $\| A \( t \) \| lt.eq
    C \/ E \( t \)$. The kernel $H \( s \, t \) A \( t \)$ has bounded row and column masses.
    For the column estimate one uses the increasing $E$ on the incoming pieces;
    its variation on the modified bands is bounded. Equivalently,
    bounded logarithmic derivatives and small $E_(*)$ give the same estimate on consecutive strips.
    Integrating (5.19) once yields
  $ v_m \( s \) =  & phi_m + psi_m integral_0^s H \( u \, T \) thin d u +
    integral_0^s m \( t \) F \( t \) thin d t + integral_s^T K_(+) \( s \, t \) F \( t \) thin d t \,\
m \( t \) =  & A \( t \) integral_0^t H \( u \, t \) thin d u \, wide K_(+) \( s \, t \) =
  A \( t \) integral_0^s H \( u \, t \) thin d u . $
  Here $\| m \( t \) \| lt.eq C$ and $\| K_(+) \( s \, t \) \| lt.eq
    C E \( s \) E \( t \)^(- 1) exp \( - c integral_s^t E^(- 1) \)$;
    the latter kernel has row mass $O \( E \( s \) \)$. The past integral has the ordinary Volterra Grönwall bound
    $exp \( C integral \| q_0 \| \)$, which is uniform, and the future $q_0
    v_m$ term is absorbed by taking $E_(*)$ small. If $L$ bounds the logarithmic rate of the mean weight, then
  $ frac(omega \( t \), omega \( s \)) lt.eq C_(upright("mod")) e^(L \( t - s \)) lt.eq
    C_(upright("mod")) exp (L E_(*) integral_s^t E^(- 1)) . $
  Thus $L E_(*) < c \/ 2$ preserves a fixed part of the fast exponent in the weighted future and exit kernels.
    Schur’s inequality for the differentiated formula, followed by the equation for $a
    v_(m \, s s)$ and the first-trace estimate of 6, proves (5.17).
    The two source sums in (5.16) are respectively its cumulative past part and its fast future tail.
    The terminal lift has derivative bulk size $O \( sqrt(E \( T \)) \| psi_m \| \)$ and value size
    $O \( E \( T \) \| psi_m \| \)$, so its contribution is precisely the stated natural Neumann term,
    uniformly after weighting.
  For the nonconstant modes choose $d = \( log rho_o \)_s = -
    9 \/ 10$ on the long incoming pieces away from the reserved collars and $d = 0$ on the bounded modified bands.
    Ramp $d$ smoothly between these values only on the fixed $J = 1$ collars,
    where the unit incoming estimate for $c$ holds; in particular $d =
    0$ before entering each merely accretive band and until after leaving it.
    Their bounded geometry makes this weight comparable to $\( \| r \| \/ r_0 \)^(9 \/ 10)$.
    Writing $v_o = rho_o w$ gives
  $ rho_o^(- 1) cal(L)_0 \( rho_o w \) = - a w_(s s) + \( 1 - 2 a d \) w_s - c w_(theta theta) + { d -
    a \( d^2 + d_s \) + q_0 } w . $
  For mean-zero functions the first angular eigenvalue is one.
    On the long incoming pieces the real part of the mass therefore has the strict buffer $1 -
    9 \/ 10$ after the small $r_0$ and $E_(*)$ errors. On every modified band $d = 0$, and $Re c gt.eq
    c_(*)$ supplies a fixed buffer because $q_0 = O \( r^2 \)$.
    On each ramp collar, $J = 1$ and $c = 1 + O \( \| r \|^2 \( 1 + \| log r \| \) + E \)$ while $- 9 \/ 10 lt.eq
    d lt.eq 0$; the bounded $E d_s$ term is small, so the same fixed incoming buffer persists there.
    Integration against $macron(w)$ absorbs the normalized coefficient derivatives and imaginary drift terms into
    $E \| w_s \|^2$, $\| w_theta \|^2$ and this positive mass.
    The actual homogeneous exit is $w_s + d w = 0$; its radial and drift boundary contributions add to
  $ d Re a + 1 / 2 Re \( 1 - 2 a d \) = 1 / 2 . $
  Thus the negative incoming weight causes no terminal loss.
    Localizing the energy by a smooth weight comparable to $e^(- epsilon.alt \| s - s_nu \|)$,
    with $epsilon.alt$ smaller than the unused mass buffer, sums the source strips geometrically.
    The local estimate in 6 then supplies all bulk and first-trace slots. Natural boundary lifts prove (5.18).
    Finally the finite Dirichlet–Neumann problem has index zero by its complementing boundary parametrices and an
    accretive homotopy at fixed $T$; the estimates prove injectivity and hence solvability.
    This index calculation is on the ordinary compact $H^2$ domain and $L^2$ range;
    the commuted estimates and density then give the stated fixed angular order. ◻
]

The outgoing datum in this lemma is the derivative of the relative-height scalar in the prescribed real
  coordinate. Thus $psi = partial_s v = J partial_t v = r_s partial_r v$ at the exit;
  physical $z$ data are also divided by $Z$. At order $h$ its natural norm is

#[#set math.equation(numbering: n => "(5.20)")
 $ parallel psi parallel_(cal(T)_(E \, h)^N)^2 = E sum_(j in bb(Z)) \( 1 + j^2 \)^h \( 1 + sqrt(E) \| j \| \) \|
   psi_j \|^2 . $ <jump:neumann-trace>]

This is the trace norm of (3.10), controlled by the bulk $v_s \, sqrt(E) thin v_(s theta) \,
  E v_(s s)$ slots on a terminal strip. In particular a derivative trace supplied by another solution already lies
  in this space. For prescribed smooth data one may use the sufficient lift bound

#[#set math.equation(numbering: n => "(5.21)")
 $ parallel "lift" psi parallel_(X_E^h) lt.eq C parallel psi parallel_(cal(T)_(E \, h)^N) lt.eq
   C sqrt(E) thin parallel psi parallel_(H_theta^(h + 1)) . $ <jump:boundary-lift>]

Only the last, convenient inequality asks for the extra angular derivative.

The circular residual of (5.7) has the required small size without a spatial analyticity assumption.
  Set $epsilon.alt_Z = Z^(- 2)$. Its radial equation, multiplied by $r^2$, is

$ r^2 {frac(g''_c, 1 + Z^2 \( g'_c \)^2) + \( r^(- 1) - r \/ 2 \) g'_c + g_c \/ 2} =
  r^2 epsilon.alt_Z {frac(g''_c, epsilon.alt_Z + \( g'_c \)^2) - frac(phi.alt'', \( phi.alt' \)^2)} . $

Since $phi.alt' asymp r$, $phi.alt'' = O \( 1 \)$, $d'_0 = O \( r^(- 1) \)$ and $d''_0 = O \( r^(- 2) \)$,
  the braces are $O \( B^(- 2) \| r \|^(- 4) \)$ whenever $\| B r \| gt.eq Y_0$.
  Thus the residual, with each fixed spatial logarithmic derivative, is

#[#set math.equation(numbering: n => "(5.22)")
 $ O #scale(x: 120%, y: 120%)[\(] B^(- 2) \| B r \|^(- 2) #scale(x: 120%, y: 120%)[\)] . $ <jump:profile-residual>]

The same bound holds on the modified bands by the bounded chain-rule factors.

=== 5.3 The refined exterior contraction <the-refined-exterior-contraction>

Fix

#[#set math.equation(numbering: n => "(5.23)")
 $ alpha = 7 / 4 \, quad gamma = 9 / 10 \, quad epsilon = sigma = 1 / 10 \, wide W_o =
   B^(- alpha) \| r \|^gamma \, quad W_m = B^(- 2) #scale(x: 120%, y: 120%)[\(] B^(- epsilon) + \| B
   r \|^(- sigma) #scale(x: 120%, y: 120%)[\)] . $ <jump:weights>]

Changing these four exponents slightly has no effect on the argument.
  Write $u = g - g_c$, $u_m = \( 2 pi \)^(- 1) integral_(bb(S)^1) u thin d theta$ and $u_o = u - u_m$, and use the norm

#[#set math.equation(numbering: n => "(5.24)")
 $ parallel u parallel_(cal(X)) = sup_I frac(X_E^h \( u_m \; I \), W_m \( I \)) +
   sup_I frac(X_E^h \( u_o \; I \), W_o \( I \)) . $ <jump:refined-norm>]

For a path ending at $s = T$, the prescribed remainder derivative is

$ psi = partial_s \( g - g_c \)\|_(s = T) . $

For a fixed constant $C_(upright("tr"))$, the permitted height data are exactly the elements of
  $cal(T)_(E \( T \) \, h)^N$ satisfying

#[#set math.equation(numbering: n => "(5.25)")
 $ parallel psi_m parallel_(cal(T)_(E \( T \) \, h)^N) lt.eq C_(upright("tr")) W_m \( T \) \, wide
   parallel psi_o parallel_(cal(T)_(E \( T \) \, h)^N) lt.eq C_(upright("tr")) W_o \( T \) . $ <jump:permitted-data>]

The families used for first variation are smooth families in this space.
  The canonical prescription $partial_s g = partial_s g_c$ has $psi = 0$.
  There is no additional $H^(h + 1)$ requirement on a trace obtained from a solution.
  We choose $C_(upright("tr"))$ below from the canonical zero-exit estimates,
  before $B$ and before solving the interpolated problems.

The incoming mean value is zero by (5.4); its oscillatory Dirichlet trace has $cal(T)_(E \( 0 \) \, h)^D$ size
  $O \( B^(- 1.8) \)$ and hence fits the $W_o$ weight. Lemma 33 applies with $omega =
  W_m$ and with a fixed multiple of $rho_o$ equal, up to uniform factors, to $W_o$.
  The residual (5.22), propagated by the mean inverse, fits $B^(- 2) \| B r \|^(- sigma)$.
  There is no oscillatory reference residual. Indeed its past strip sum is $O \( B^(- 2) \| B r \|^(- 2) \)$,
  and the fast future sum has the same bound after $Y_0$ is fixed large.

We give the entire smallness calculation for the nonlinear map.
  In a fixed multiple of the ball (5.24), the full height estimate of 19 bounds its quadratic and higher remainder
  in a strip by

#[#set math.equation(numbering: n => "(5.26)")
 $ C {frac(E^(- 1 \/ 2), \| r \|^2) \( W_m + W_o \)^2 + frac(E^(- 1), \| r \|^4) W_o^2 \( W_m + W_o \)} .
   $ <jump:height-products>]

The difference estimate replaces one weight by the corresponding difference norm.
  Oscillatory output always contains an oscillatory input. This last assertion is exact:
  the operator maps circular functions to circular functions.
  In deriving (5.26), the radial coefficient variation retains its factor $E$,
  and the additional radial second-derivative term has two angular tilts.
  At least one differentiated factor stays in strip $L^2$; the only time-derivative trace loss is $E^(- 1 \/ 2)$.
  Thus no uncontrolled second-derivative trace is being used.

Put $A = E^(- 1 \/ 2) \| r \|^(- 2) asymp B \/ \| r \|$; the second coefficient in (5.26) is comparable to $A^2$.
  The coefficient factors multiplying a mean or oscillatory error obey

#[#set math.equation(numbering: n => "(5.27)")
 $ A W_m & lt.eq C {frac(B^(- epsilon), \| B r \|) + \| B r \|^(- 1 - sigma)} \, & A W_o & lt.eq
   C B^(- 3 \/ 4) \| r \|^(- 1 \/ 10) . $ <jump:lipschitz-factors>]

Their logarithmic integrals over $Y_0 \/ B lt.eq \| r \| lt.eq r_0$ are bounded respectively by

#[#set math.equation(numbering: n => "(5.28)")
 $ C \( B^(- epsilon) Y_0^(- 1) + Y_0^(- 1 - sigma) \) \, wide
   C B^(- 13 \/ 20) Y_0^(- 1 \/ 10) . $ <jump:integrated-factors>]

The same is true, with smaller bounds, for their squares and products. The pure oscillatory forcing of the mean is

#[#set math.equation(numbering: n => "(5.29)")
 $ A W_o^2 & lt.eq C B^(- 5 \/ 2) \| r \|^(4 \/ 5) \, & A^2 W_o^3 & lt.eq
   C B^(- 13 \/ 4) \| r \|^(7 \/ 10) . $ <jump:osc-to-mean>]

These powers are logarithmically summable. Relative to the constant part $B^(- 2 - epsilon)$ of the mean budget
  they cost respectively $O \( B^(- 1 \/ 2 + epsilon) \)$ and $O \( B^(- 5 \/ 4 + epsilon) \)$.
  All other mean terms have an error factor multiplied by one of (5.27);
  all other oscillatory terms retain an oscillatory factor and have the same small coefficients.
  In the oscillatory inverse the buffer below rate $1$ sums the weighted propagation kernel.
  In the mean inverse use (5.28); its increasing component $\| B
  r \|^(- sigma)$ is preserved by forward summation. Consequently the linear solution operator $T$ satisfies,
  on each fixed ball,

#[#set math.equation(numbering: n => "(5.30)")
 $ parallel T cal(N) \( u \) - T cal(N) \( v \) parallel_(cal(X)) lt.eq
   C #scale(x: 120%, y: 120%)[\(] B^(- delta) + Y_0^(- delta) #scale(x: 120%, y: 120%)[\)] parallel u -
   v parallel_(cal(X)) $ <jump:contraction>]

for a fixed $delta > 0$. Constants absorb the bounded bands.
  The linear image bounds used next are uniform once $Y_0$ exceeds a fixed threshold.
  First take $psi = 0$ and choose a fixed ball from the reference residual and incoming lift.
  For $Y_0 \, B$ above fixed preliminary thresholds, (5.30) gives a canonical solution with a bound uniform for
  all larger thresholds and independent of $C_(upright("tr"))$.
  Its natural derivative trace at any later common section is bounded by a fixed multiple of $W_m \, W_o$,
  by (5.20). Choose $C_(upright("tr"))$ larger than these two canonical trace constants.
  The reference residual, incoming lift and the entire class (5.25) are then bounded in the same norm.
  Choose a fixed $C_(upright("ref"))$ large enough to contain their images and run the contraction on

#[#set math.equation(numbering: n => "(5.31)")
 $ frak(B)_(upright("ref")) \( C_(upright("ref")) \) = { u : parallel u parallel_(cal(X)) lt.eq
   C_(upright("ref")) } . $ <jump:refined-ball>]

The estimates also hold on twice this fixed ball, with contraction constant less than $1 \/
  2$ after enlarging $Y_0$ for these fixed ball constants and then taking $B$ large.
  The contraction produces the unique exterior solution in that ball with its stated entrance and exit data, and

#[#set math.equation(numbering: n => "(5.32)")
 $ X_E^h \( g_o \; I \) lt.eq C W_o \, wide X_E^h \( g_m - g_c \; I \) lt.eq C W_m . $ <jump:refined-bounds>]

The same estimates give an inhomogeneous-entrance difference bound.
  If two solutions for the same path and parameter lie in twice (5.31),
  their mean-value linearization obeys (5.30). Subtracting the equations and absorbing that term gives

#[#set math.equation(numbering: n => "(5.33)")
 $ parallel u - tilde(u) parallel_(cal(X)) lt.eq
   C {frac(parallel phi_m - tilde(phi)_m parallel_(cal(T)^D), W_m \( 0 \)) +
   frac(parallel phi_o - tilde(phi)_o parallel_(cal(T)^D), W_o \( 0 \)) +
   frac(parallel psi_m - tilde(psi)_m parallel_(cal(T)^N), W_m \( T \)) +
   frac(parallel psi_o - tilde(psi)_o parallel_(cal(T)^N), W_o \( T \))} . $ <jump:refined-difference>]

The trace norms here use their respective entrance or exit diffusion scales.
  This estimate will propagate the small, nonzero entrance shift caused by global normalization.

For each use of holomorphy, hold the central contour and its phase-alignment profile fixed while $p$ varies on its
  parameter ball. All these maps are holomorphic in the finite parameters when their reference coefficients and
  prescribed trace data are varied holomorphically on the prescribed real intervals,
  and the trace families satisfy (5.25) uniformly on the outer ball.
  For this purpose identify their trace spaces with the fixed central-parameter norm;
  the varying diffusion scales are uniformly comparable there.
  Use the outer and inner balls $cal(B)_s^(upright("out"))$ and $cal(B)_s$ fixed in (4.38),
  choosing their constants there small enough to keep $Z$, the entrance data and the strict coefficient margins in
  the same regimes. Uniform contraction gives holomorphic dependence on $cal(B)_s^(upright("out"))$.
  Every finite-parameter derivative assertion below is on $cal(B)_s$,
  at distance at least $\( c_(upright("out")) - c_(upright("in")) \) \| s \|^L$ from the outer boundary.
  Cauchy estimates there cost only a fixed power for each fixed derivative order.
  The first logarithmic-exit and terminal-interpolation derivatives used below instead follow from the pulled equations.

=== 5.4 Exponential shielding and normalized gluing <exponential-shielding-and-normalized-gluing>

The exterior solve has so far had prescribed entrance and exit data.
  We now turn it into a normalized full-surface solution, keeping the numbers $Z$ and $Z_(*)$ from the preliminary
  match fixed. Write $\( V_(upright("pre")) \, lambda_(upright("pre")) \)$ for the common normalized preliminary
  graph tuple and its compact multiplier, with the common nonadverse problems fixed above.
  For each height path and permitted $psi$, call the exterior solution with entrance exactly equal to that of
  $V_(upright("pre"))$ the canonical exterior solution. Scalar graph tuples are always compared in the same
  prescribed real charts.

On the common real interval $\[ 0 \, T_(upright("pre")) \]$, before the phase alignment or either turn,
  subtract the preliminary solution from the canonical exterior solution.
  Their difference has zero entrance value and solves a homogeneous linear difference equation;
  the coefficients satisfy the same height smallness conditions.
  Indeed, there $E asymp B^(- 2)$ and the relevant strip sizes are at most $C \( B^(- 7 \/ 4) + B^(- 1.8) \)$,
  so the shifted coefficient smallness required by 21 follows from $B \( B^(- 7 \/ 4) + B^(- 1.8) \) = o \( 1 \)$.
  Choose $d = c_1 B^2$ with $E d$ a sufficiently small fixed constant, and write $v =
  e^(d \( t - T_(upright("pre")) \)) w$. For the model principal part $partial_t - E partial_t^2 -
  A_2 partial_theta^2$, the conjugated operator is

#[#set math.equation(numbering: n => "(5.34)")
 $ - E partial_t^2 + \( 1 - 2 E d \) partial_t - A_2 partial_theta^2 + d - E d^2 . $ <jump:large-shift>]

The positive gain is $d - O \( E d^2 \)$, comparable to $d$.
  The true transformed outgoing condition is $w_t + d w = f$; its fast-root denominator is $\( lambda_f - d \) +
  d = lambda_f$. Thus no small denominator or exponential loss is introduced.
  For real frozen coefficients its terminal energy coefficient is exactly $E d + \( 1 - 2 E d \) \/ 2 = 1 \/ 2$.
  The accretive perturbation and trace estimates in 21 preserve this conclusion.
  Alternatively, cut off toward the far side of the overlap and use its Dirichlet trace.
  In either implementation, every needed fixed derivative on a smaller inner joining band satisfies

#[#set math.equation(numbering: n => "(5.35)")
 $ parallel v parallel_(upright("join")) lt.eq C B^M e^(- c_(upright("sh")) B^2) . $ <jump:shield>]

Here the joining norm includes the fixed spatial derivatives needed for the splice.
  The joining bands are fixed, so $c_(upright("sh")) > 0$ is uniform in all exit sizes $Y
  in \[ Y_0 \, c B \]$ and in the permitted data.

Splice on that band, obtaining a graph tuple $V_(upright("app"))$ which equals $V_(upright("pre"))$ on the compact
  observation region and the canonical exterior outside the joining band.
  Use $lambda_(upright("pre"))$ as its multiplier. The resulting augmented residual has the size in (5.35),
  and the compact observations remain unchanged.

We verify the stopped index hypothesis of 20 for this spliced linearization.
  First use smooth permitted data, as in the action families.
  On the refined exterior, (5.14) and the projected height smallness give strict row-normalized accretivity.
  The exponentially small splice preserves it on the fixed joining bands,
  and the compact and conical pieces are the preliminary ones.
  The prescribed real charts retain nonzero graph-speed factors,
  and the correction exit is the pure relative-height derivative.
  At every finite stop we may therefore use the same graph-speed conjugations, patched nonzero row multiplier,
  exit-collar Robin removal, and convex principal-tensor homotopy as in the proof of 23.
  The symbols remain elliptic and the exits complementing. Retaining the compact multiplier columns and the
  equal-dimensional observation augmentation gives index zero on the fixed compact domain.
  This verifies the index hypothesis for the spliced operator; no estimate along that artificial homotopy is used.

The global inverse of 20 is applied with cylindrical growth rate $2.2$, strictly above the propagation rate $2.1$,
  bounded transitions on the fixed scaled bands, and a large fixed height growth rate.
  On the height interval of length $O \( log B \)$ its weight costs only a power of $B$.
  Keeping those weights until after the global estimate is essential:
  the forward estimate with a strict buffer prevents a normalized approximate kernel from escaping to the far end,
  so its nonzero compact limit would contradict the Gaussian normalized inverse.
  The cited global theorem supplies this estimate and surjectivity by the index-zero argument on compact stopped
  problems with complementing exits, followed by uniform conical exhaustion.
  In physical graph norms its inverse therefore costs at most $C B^q$.
  For a nonsmooth datum in the full class (5.25), approximate it by smooth data in the natural trace norm within
  the same fixed ball. The refined difference estimate gives convergence of the exterior graphs,
  and 19 gives convergence of their linearizations in the domain-to-range operator norm at each fixed stop.
  A small Neumann perturbation of the uniform smooth-data inverses, followed by density,
  supplies the same inverse for that datum. The actual action families already have smooth comparison data or
  smooth interior traces.

This inverse now corrects an exponentially small error. Reserve once and for all a strict exponent margin $0 <
  c_(upright("gl")) < c_(upright("sh"))$. In the affine domain with the prescribed outgoing derivatives,
  define the augmented uniqueness ball

#[#set math.equation(numbering: n => "(5.36)")
 $ frak(U) \( V_(upright("app")) \) = {\( V \, lambda \) :
   parallel \( V \, lambda \) - \( V_(upright("app")) \, lambda_(upright("pre")) \) parallel_(X_B) <
   e^(- c_(upright("gl")) B^2)} . $ <jump:augmented-ball>]

The norm $X_B$ is that of 20; in particular it includes the Euclidean multiplier norm.
  The polynomial losses of the inverse and of the nonlinear map give a contraction constant at most $C B^m
  e^(- c_(upright("gl")) B^2)$ on this ball, for a fixed $m$.
  The image of its center is $C B^M e^(- c_(upright("sh")) B^2)$,
  which lies strictly inside the ball for large $B$. The augmented contraction therefore has a unique normalized
  solution there,
  with correction $\( k \, ell \) = \( V - V_(upright("app")) \, lambda - lambda_(upright("pre")) \)$ satisfying

#[#set math.equation(numbering: n => "(5.37)")
 $ parallel \( k \, ell \) parallel_(X_B) lt.eq C B^M e^(- c_(upright("sh")) B^2) . $ <jump:correction-bound>]

Increasing $M$ gives the same estimate in the unweighted graph and first-trace norms,
  including conversion to physical height. This is a second contraction, distinct from (5.30);
  the polynomial global inverse has only been applied after shielding.
  The corrected solution satisfies (5.32) up to errors smaller than every power of $B$.
  For data families holomorphic in $p$ in the fixed identified trace spaces,
  the canonical exterior and splice center are holomorphic,
  and the analytic augmented contraction gives a holomorphic normalized solution on the outer parameter ball.
  Cauchy differentiation for these families on the fixed inner parameter ball only increases $M$ in (5.35) and (5.37).

The following comparison puts the solutions used in the action calculation into the two uniqueness classes just
  constructed.

#thm([Proposition 5.3.])[
  (Compatibility of the normalized height families).  #emph[Fix the common parameter $p$ on the inner parameter
    ball and the matched numbers $Z \, Z_(*)$ on each adverse end.
    Choose the fixed constants in the preliminary and refined contraction balls before $B$.
    Then the following hold for large $B$.]
  + #emph[At a fixed positive physical radius on the first height turn,
    the normalized height solution with derivative interpolated between the preliminary circular profile and $g_c$
    belongs to the preliminary uniqueness ball of 23 and to a fixed refined ball.
    It is the preliminary normalized solution with those same path and exit data.]
  + #emph[Let $V_L$ be either of the two normalized solutions on longer canonical paths with zero remainder
    derivative at its own exit, and let $g_L$ be its relative height.
    At a common shorter incoming height section let $psi_L = partial_s \( g_L - g_c \)$ be its actual remainder
    derivative, in the shorter scalar coordinate. The restriction $\( V_L \|_(upright("short")) \, lambda_L \)$
    belongs to the augmented ball (5.36) for the shorter canonical exterior solve with datum $psi_L$.
    It equals that shorter normalized solve. The linear interpolation between the two data $psi_(-)$ and $psi_(+)$
    gives an actual normalized family whose endpoints are exactly the two restrictions.]
  #emph[All constants are uniform in the shorter size $Y in \[ Y_0 \, c B \]$.
    The comparison retains the compact multiplier, and all members use the same $Z \,
    Z_(*)$ and observation value. The nonadverse paths, exit sections,
    and outgoing derivative prescriptions are the common frozen ones specified before the height construction.]
] <jump:compatibility>

#proof[
  For the first assertion take the first turn to end at $\| r \| = r_1 > 0$, with $r_1$ fixed below $r_0$.
    Its logarithmic length is bounded and $E asymp B^(- 2)$. On its terminal band the preliminary comparison is
    circular. In relative-height units it is
  $ g_R = \( Z_0 \/ Z \) phi.alt \, wide g_c - g_R = \( 1 - Z_0 \/ Z \) phi.alt + Z^(- 2) d_0 . $
  The last difference and every fixed logarithmic derivative are $O \( B^(- 1.8) \)$ on this fixed-radius
    interval. In particular the known smooth comparison derivative changes by $O \( B^(- 1.8) \)$ in $H^(h + 1)$,
    and its natural lift has size $O \( B^(- 2.8) \)$ by (5.21).
    This assertion concerns the smooth comparison profiles, not an unknown solution trace.
    After the fixed graph-unit conversion, division by the preliminary weight $rho_B \( T \) asymp
    B^2.2$ gives $O \( B^(- 5) \)$, inside (4.37) throughout this interpolation.
    For each fixed path, $Z$ is the bounded mean trace of the preliminary holomorphic solution at the fixed
    incoming section. The chosen branch of $Z_0$ and the formulas for $g_R$ and $g_c$ are therefore holomorphic in
    $p$ on the outer ball. Their comparison derivatives, evaluated at the prescribed real path parameter at the
    exit, are holomorphic in the identified trace space, as is their affine interpolation.
    This verifies the parameter-data condition in 23.
  Apply 33 on this bounded interval with the constant total budget $W_(upright("fix")) = B^(- 1.8)$.
    The incoming oscillation is $O \( W_(upright("fix")) \)$, its mean is zero,
    the reference residual is $O \( B^(- 4) \)$, and the preceding boundary lift is $O \( B^(- 2.8) \)$.
    Here $E^(- 1 \/ 2) \| r \|^(- 2) asymp B$, so the full nonlinear remainder and Lipschitz factor are
  $ O \( B W_(upright("fix"))^2 + B^2 W_(upright("fix"))^3 \) \, wide
    O \( B W_(upright("fix")) + B^2 W_(upright("fix"))^2 \) = O \( B^(- 0.8) \) . $
  There is consequently a unique fixed-interval solution in $sup_I X_E^h \( u \; I \) lt.eq
    C_(upright("fix")) B^(- 1.8)$ for a fixed $C_(upright("fix"))$.
    Project its equation onto the mean and use the zero incoming mean.
    The same inverse and the projected products give the stronger bound
  $ sup_I X_E^h \( u_m \; I \) lt.eq C { B^(- 4) + B^(- 2.8) + B W_(upright("fix"))^2 +
    B^2 W_(upright("fix"))^3 } = O \( B^(- 2.6) \) . $
  At fixed $r$, $W_o asymp B^(- 7 \/ 4)$ and $W_m asymp B^(- 2.1)$.
    Thus its oscillation and mean lie in the refined ball for large $B$.
    It has the same entrance and exit data as the canonical refined exterior,
    so uniqueness in (5.31) identifies those two exterior solves.
    The normalized correction (5.37) preserves this membership.
  For clarity, the preliminary ball here is the growth-weighted $X_B$ ball of radius $C_(upright("pre"))
    B^(- 4)$ about the comparison pair of 23, after its prescribed boundary lift.
    The weight on this fixed outer band is comparable to $B^2.2$, so $B^(- 1.8) \/ B^2.2 = B^(- 4)$.
    The core and conical parts equal those of $V_(upright("pre"))$ before the new normalized correction.
    There $V_(upright("pre"))$ differs from the shared preliminary comparison pair by $O \( B^(- 4) \)$ by 23;
    (5.37) controls the additional discrepancy and the multiplier.
    Choose $C_(upright("pre"))$ larger than these fixed bounds before taking $B$ large.
    The preliminary contraction remains a contraction on this fixed enlarged ball because its outer Lipschitz
    factor is $O \( C_(upright("pre")) B^(- 0.8) \)$. The new normalized solution and the preliminary solution
    solve the same augmented equation, observations and exit problem inside that ball.
    Its uniqueness identifies them. This proves the first assertion and connects the fixed-radius end of the array
    homotopy to the refined family.
  For the second assertion, the natural trace theorem applied on an enlarged strip of each longer canonical
    solution gives
  $ parallel psi_(L \, m) parallel_(cal(T)^N) lt.eq C W_m \( T \) \, wide
    parallel psi_(L \, o) parallel_(cal(T)^N) lt.eq C W_o \( T \) . $
  Its normalized correction adds only $B^M e^(- c_(upright("sh")) B^2)$ in these norms.
    The earlier choice of $C_(upright("tr"))$ includes these two canonical trace families for large $B$.
    Thus (5.25) holds for their actual traces and for their linear interpolations.
    For fixed paths and shorter sections, the longer zero-remainder-exit solutions are holomorphic in $p$ by the
    preceding contractions. After the fixed real pullbacks, restriction and the natural trace map are bounded
    complex-linear maps into the identified shorter trace space.
    Thus $psi_(-) \( p \)$, $psi_(+) \( p \)$, and their affine interpolation are holomorphic there.
    Variation of the contour or shorter section uses the separately proved smooth pulled-domain derivatives.
  Let $g_(upright("short"))^(upright("can"))$ be the shorter canonical exterior with entrance $g_(upright("pre"))$
    and datum $psi_L$. The restriction $g_L$ satisfies the same exterior equation because the compact multiplier
    sources vanish on this height region. It has the same actual exit derivative, but its entrance differs by
  $ e_0 = \( g_L - g_(upright("pre")) \) \|_(s = 0) \, wide parallel e_0 parallel_(cal(T)^D) lt.eq
    C B^M e^(- c_(upright("sh")) B^2) \, $
  by (5.37) and the trace estimate. Both exteriors lie in twice the refined ball.
    Applying (5.33) to their mean-value difference, with zero exit discrepancy and this nonzero entrance
    discrepancy, gives
  #[#set math.equation(numbering: n => "(5.38)")
   $ parallel g_L - g_(upright("short"))^(upright("can")) parallel_(cal(X)) lt.eq
     C B^(M') e^(- c_(upright("sh")) B^2) . $ <jump:restriction-difference>]
  Dividing by $W_m \( 0 \)$ and $W_o \( 0 \)$ has only increased the fixed power.
    No zero-entrance shielding has been applied to this difference.
  On the core the longer restriction differs from $V_(upright("pre"))$ by its correction (5.37),
    including $lambda_L - lambda_(upright("pre"))$. On the shorter exterior it differs from
    $g_(upright("short"))^(upright("can"))$ by (5.38). On the joining band the remaining comparison between
    $g_(upright("short"))^(upright("can"))$ and $g_(upright("pre"))$ has zero entrance and is exactly the
    canonical comparison to which (5.35) applies. Combining these three estimates in the prescribed charts and in
    $X_B$ costs only another fixed power, and hence
  $
    parallel \( V_L \|_(upright("short")) \, lambda_L \) - \( V_(upright(a p p \, s h o r t)) \,
    lambda_(upright("pre")) \) parallel_(X_B) lt.eq C B^(M'') e^(- c_(upright("sh")) B^2) <
    e^(- c_(upright("gl")) B^2) . $
  The restriction is therefore in the shorter augmented ball.
    It has the same PDE, observation values and outgoing derivative as the normalized shorter solution;
    uniqueness in (5.36) identifies them.
  Finally put $psi_xi = \( 1 - xi \) psi_(-) + xi psi_(+)$ for $0 lt.eq xi lt.eq 1$,
    simultaneously on all adverse ends. The natural trace balls in (5.25) are convex.
    The exterior contraction and augmented correction therefore give a smooth normalized family with these data.
    Differentiating the exterior contraction in $xi$ and using the lift of $psi_(+) -
    psi_(-)$ gives a uniform bound for $partial_xi u$ in the refined norm; its entrance derivative is zero.
    Shielding this canonical derivative on the fixed joining band and then differentiating the augmented
    correction gives (5.37) with a larger fixed power. At a fixed section $y = Y$, conversion to the scaled height gives
  #[#set math.equation(numbering: n => "(5.39)")
   $ parallel partial_xi h \( Y \, dot.op \) parallel_(H^h) lt.eq C { B^(- epsilon) + Y^(- sigma) +
     B^(- 13 \/ 20) Y^(9 \/ 10) } + B^M e^(- c_(upright("sh")) B^2) . $ <jump:interpolation-height>]
  Indeed $h = \( Z_(*) - Z g \) Z_(*) \/ 2$ and $\| Z Z_(*) \| asymp B^2$,
    so this is exactly the refined derivative bound multiplied by $B^2$.
    The endpoint identification just proved makes this the required family between the two restrictions. ◻
]

=== 5.5 Endpoint errors in the action scale <endpoint-errors-in-the-action-scale>

The estimates have two consequences for which polynomial accuracy in physical coordinates alone would be insufficient.

#thm([Lemma 5.4.])[
  (Variation of a logarithmic exit).  #emph[Keep $p \, Z \,
    Z_(*)$ fixed and use the canonical prescription $partial_s \( g - g_c \) = 0$ at the moving exit.
    Put $eta = log Y$. For the normalized family obtained above,
    its physical boundary position $X_(upright(e))$ satisfies
#[#set math.equation(numbering: n => "(5.40)")
 $ parallel partial_eta X_(upright(e)) parallel_(H_theta^h) lt.eq B^(- 1) P \( Y \) \, wide Y_0 lt.eq Y lt.eq
   c B \, $ <jump:exit-derivative>]

 where $P$ is a fixed polynomial independent of $B \, Y$. The assertion is uniform on the inner parameter ball.]
] <jump:moving-exit>

#proof[
  Near any chosen $eta$, pull neighboring paths to its fixed real parameter interval by maps $Psi_eta$ which are
    the identity before the last bounded bands. Their derivatives in the path coordinate and in $eta$ are bounded
    in logarithmic units. This is possible for the homothetic bypasses and their preceding shortening bands.
    First let $g_eta$ denote the canonical exterior before normalization,
    and put $u_eta = \( g_eta - g_c \) compose Psi_eta$ and use dots for derivatives at a fixed pulled coordinate.
    The exact remainder problem has the form
  $ cal(L)_eta u_eta + cal(N)_eta \( u_eta \) = - R_eta \, wide u_eta \( 0 \) = u_(upright("in")) \,
    wide \( u_eta \)_s \( T \) = 0 . $
  The incoming value is independent of $eta$. The pulled exit condition is still homogeneous because it is a
    coordinate derivative of the remainder. The locally parameterized normalized branches are smooth by the
    uniform contractions for these smooth coefficient maps. They agree on overlaps by uniqueness in (5.36),
    so they describe one smooth shortening family. Differentiation therefore gives
  #[#set math.equation(numbering: n => "(5.41)")
   $ { cal(L)_eta + D cal(N)_eta \( u_eta \) } dot(u) & = - dot(R)_eta - \( dot(cal(L))_eta \)
     u_eta - \( partial_eta cal(N)_eta \) \( u_eta \) \,\
dot(u) \( 0 \) & = 0 \, wide dot(u)_s \( T \) = 0 . $ <jump:differentiated-exit-equation>]
  No second-derivative boundary trace appears.
  The explicit coefficient variations are supported on the last bounded bands.
    Differentiating the full pulled drift and then dividing it as above gives, schematically, the source slots
  $ O \( 1 \) u_s \, quad O \( E \) u_(s s) \, quad O \( 1 \) u_(theta theta) \, quad
    O \( sqrt(E) \) u_(s theta) \, quad O \( 1 \) \( u \, u_theta \) . $
  Their coefficients are bounded by a fixed polynomial in $Y$, with no independent power of $B$.
    These are precisely the normalized bulk slots; a background Hessian stays in its bulk factor.
    The circular coefficient variations preserve the mean and nonconstant projections.
    Moreover $dot(R)_eta = O \( B^(- 2) \| B r \|^(- 2) \)$ up to such a polynomial,
    and the differentiated nonlinear coefficients obey the projected products in (5.26).
  Apply the two parts of 33 to (5.41) and absorb $D cal(N)_eta$ with (5.30).
    The explicit mean sources occupy only a bounded number of terminal strips,
    so their cumulative term in (5.16) contributes no factor $log B$.
    The oscillatory estimate uses its strict angular buffer. It follows that
  #[#set math.equation(numbering: n => "(5.42)")
   $ X_E^h \( dot(u)_m \; I \) lt.eq P \( Y \) W_m \( I \) \, wide X_E^h \( dot(u)_o \; I \) lt.eq
     P \( Y \) W_o \( I \) . $ <jump:log-remainder-bound>]
  At the exit $\| r \| asymp Y \/ B$ and $\| dot(r) \| lt.eq C \| r \|$. Since $Z$ is fixed,
  $ \| Z thin partial_eta \( g_c compose Psi_eta \) \| lt.eq C { B \| r \|^2 +
    B^(- 1) \( 1 + \| r \|^2 \| log r \| \) } lt.eq B^(- 1) P \( Y \) . $
  The first inequality uses $r partial_r phi.alt = O \( r^2 \)$ and $r partial_r d_0 =
    O \( 1 + r^2 \| log r \| \)$. The first traces in (5.42) give
  $ \| Z dot(u) \| lt.eq C B P \( Y \) \( W_m + W_o \) lt.eq B^(- 1) P \( Y \) \, $
  because, up to fixed comparison constants, $B W_m lt.eq C B^(- 1) \( B^(- epsilon) + Y^(- sigma) \)$ and $B W_o
    lt.eq C B^(1 - alpha - gamma) Y^gamma = C B^(- 33 \/ 20) Y^(9 \/ 10)$.
    A derivative trace used for a slope can cost an additional factor $E^(- 1 \/ 2) asymp Y$,
    which is also included in $P$. Together with $\| dot(r) \| lt.eq C B^(- 1) Y$,
    these are the desired physical scales for the canonical exterior.
  It remains to check the global correction. On the fixed overlap before the support of the pulled coefficient
    variations, the canonical derivative $partial_eta \( g_eta - g_(upright("pre")) \)$ has zero entrance value
    and satisfies the homogeneous linearized equation. Its outer size from (5.42) is at most a fixed power of $B$,
    since $Y lt.eq c B$. Applying 21 to this zero-entrance derivative gives $B^M
    e^(- c_(upright("sh")) B^2)$ on the joining band. Thus the derivative of the spliced residual has that size.
    This step uses the canonical local derivative, not the nonzero-entrance restriction difference in (5.38).
  Differentiate the augmented correction equation at fixed observations and with homogeneous pulled derivative
    data for the correction. The unknown includes $dot(ell)$, the multiplier derivative.
    Its inverse and the coefficient derivatives cost only fixed powers in the global norms,
    while the differentiated residual and every term containing the correction have the exponent in (5.37).
    Hence, after increasing $M$,
  $ parallel \( dot(k) \, dot(ell) \) parallel_(X_B) + parallel partial_eta X_(k \, upright(e)) parallel_(H^h)
    lt.eq C B^M e^(- c_(upright("sh")) B^2) lt.eq B^(- 1) . $
  The last inequality is uniform for $Y in \[ Y_0 \, c B \]$. Adding this correction proves (5.40). ◻
]

#thm([Lemma 5.5.])[
  (Moving exits and the exterior limit).  #emph[For the common parameter $p$,
    first make the high-stop synchronization (5.2), then shorten all adverse turns from fixed scaled size to $\|
    y \| asymp Y_0$. At each fixed sufficiently large $Y_0$ and for large $B$,
    this changes either original action by at most
#[#set math.equation(numbering: n => "(5.43)")
 $ C e^(- c Y_0^2) sum_(j med upright("adverse")) B^(- 2) exp #scale(x: 120%, y: 120%)[\(] -
   Re Z_(* \, j)^2 \/ 4 #scale(x: 120%, y: 120%)[\)] . $ <jump:endpoint-bound>]

 At each fixed sufficiently large $Y_0$, as $B arrow.r oo$ the height functions in (5.5) have smooth subsequential
   limits on compact parts of the two exterior paths and of the interpolated incoming problems.
   Their oscillations vanish, and their radial limits obey
#[#set math.equation(numbering: n => "(5.44)")
 $ h' = l \, wide l' = \( 1 + l^2 \) \( 1 - l \/ y \) . $ <jump:translator>]

 On a homothetic bypass of size $Y$ these limits satisfy
#[#set math.equation(numbering: n => "(5.45)")
 $ h = y^2 \/ 2 - log y + O \( Y^(- sigma) \) \, wide l \/ y = 1 + O \( Y^(- sigma) \) \, $ <jump:translator-matching>]

 with harmlessly reduced $sigma > 0$, uniformly also in the interpolation parameter.]
] <jump:endpoints>

#proof[
  At $r = 2 y \/ Z_(*)$, the oscillatory height error is bounded by
  $ C B^2 W_o lt.eq C B^(2 - alpha - gamma) \| y \|^gamma = C B^(- 13 \/ 20) \| y \|^(9 \/ 10) \, $
  and the mean error by $C \( B^(- epsilon) + \| y \|^(- sigma) \)$. Insert (5.5) into (5.7).
    The constant terms cancel because of the definition of $Z_(*)$, giving
  #[#set math.equation(numbering: n => "(5.46)")
   $ h - \( y^2 \/ 2 - log y \) = O \( \| y \|^(- sigma) \) + o_B \( 1 \) $ <jump:h-match>]
  for fixed $y$. The derivative traces may cost a further factor $\| y \|$,
    which is harmless for the relative slope in (5.45). Fixed higher spatial regularity follows by differentiating
    the equation and the strip estimates; on each fixed exterior annulus the scaled coefficients are uniformly
    elliptic. The interpolation estimates in 34 give the same conclusion for the interpolated problems.
  One can also identify the limiting equation before taking a limit.
    With $D_y h = \( h_y \, h_theta \/ y \)$, substitution of (5.5) into (5.11) gives
  #[#set math.equation(numbering: n => "(5.47)")
   $ (I - frac(D_y h ⊗ D_y h, 1 + D_y h dot.op D_y h)) : D_y^2 h = 1 + frac(2 \( y h_y - h \), Z_(*)^2) \,
     $ <jump:exact-scaled-equation>]
  where $D_y^2 h$ is the polar Euclidean Hessian. Oscillations vanish by the preceding bound.
    Letting $B arrow.r oo$ in (5.47) gives $h'' \/ \( 1 + \( h' \)^2 \) + h' \/ y = 1$, namely (5.44).
    This uses only regions $\| y \| gt.eq Y_0$.
  For the endpoint estimate retain the full $phi.alt$ in (5.7).
    At a complex exit of size $Y asymp \| B r \|$, its negative $Re \( Z^2 r^2 \)$ and the identity $phi.alt^2 =
    1 - r^2 \/ 2$ give
  #[#set math.equation(numbering: n => "(5.48)")
   $ Re \( z^2 - Z_(*)^2 \) gt.eq c Y^2 - C \( 1 + log Y \) . $ <jump:gaussian-gap>]
  Here the logarithmic correction is in $log \( B r \)$, not $log B$: (5.5) subtracts exactly the latter constant.
    The residual errors in (5.32) are bounded in scaled height by $C \( 1 + Y^gamma \)$, uniformly in $B$,
    and so can be absorbed in the right side of (5.48) for large $Y_0$.
    The quadratic errors from replacing $Z$ by $Z_(*)$ are smaller still.
    On the initial fixed-radius pieces any polynomial in $B$ is absorbed by the extra $e^(- c B^2)$.
  By the first part of 34, the canonical normalized family at fixed radius is the same array family after the
    preliminary deformation and comparison-data interpolation.
    That initial deformation costs a fixed power of $B$ times $e^(- Re Z_0^2 \/ 4 - c B^2)$.
    The relations $Z \/ Z_0 = 1 + O \( B^(- 1.8) \)$ and (5.5) give $Z_(*)^2 - Z_0^2 = o \( B^2 \)$,
    so this cost is negligible in the scale $B^(- 2) e^(- Re Z_(*)^2 \/ 4)$.
    The earlier synchronization contributes (5.2). The fixed choice of $D$ makes this
    $o \( B^(- 2) e^(- Re Z_(* \, j)^2 \/ 4) \)$ for every adverse $j$;
    at each fixed $Y_0$ it is absorbed in (5.43) for large $B$.
  Along the subsequent shortening, (5.40) bounds the physical boundary displacement by $B^(- 1) P \( Y \)$.
    The boundary circumference is $O \( B^(- 1) Y \)$, and slopes,
    conormals and their continued area branches have at most polynomial size in $Y$.
    Indeed the first traces give $z_r = O \( Y + 1 + Y^gamma \)$ and $z_theta \/ r =
    O \( B^(- 13 \/ 20) Y^(- 1 \/ 10) \)$ at the exit, while the relative slope smallness in 19 keeps the
    continued denominators in the same branches as the circular profile.
    Thus both the displacement and momentum terms in first variation are bounded by
  $ C B^(- 2) P \( Y \) exp \( - Re Z_(*)^2 \/ 4 - c Y^2 \) $
  per unit logarithmic size, for a fixed polynomial $P$. The observation terms vanish because $p$ is fixed.
    Integrating over $Y_0 lt.eq Y lt.eq C B$ and decreasing $c$ absorbs $P$ and proves (5.43).
    The nonadverse endpoints stay at $Re z^2 = D B^2$. Their derivative prescriptions and paths are fixed,
    but their boundary heights can vary through the normalized correction;
    their fixed-exit momentum terms remain in the first variation and are bounded by $C_D B^M
    e^(- D B^2 \/ 5)$ using its polynomial derivative bounds.
    The same choice of $D$ absorbs them in the asserted scale.
    This proves all claims, with $B arrow.r oo$ at fixed $Y_0$ before $Y_0$ is increased. ◻
]

=== 5.6 The scalar Stokes constant <the-scalar-stokes-constant>

We supply the ODE argument, including its divergence test,
  since the nonvanishing of the eventual action coefficient depends on it.
  Equation (5.44) is the radial translating-soliton equation in dimension two.
  Altschuler–Wu construct the real entire rotational translator #cite(label("AW1994")) Corollary 3.3;
  its real solutions and quadratic–logarithmic asymptotics are studied in #cite(label("CSS2007")) Section 2,
  equation (2.1) and Lemmas 2.1–2.2. The complex lateral solutions and their nonzero difference are constructed
  here. General nonlinear Stokes theory provides related ODE methods #cite(label("Costin1998"));
  no summability or nonvanishing theorem is imported for this equation.

#thm([Lemma 5.6.])[
  (A nonzero lateral difference).  #emph[Equation (5.44) has two exterior lateral slope solutions selected by
    $l \/ y arrow.r 1$ on sectors reaching $arg \( y^2 \) = plus.minus 2 pi \/ 3$. On their common positive ray,
#[#set math.equation(numbering: n => "(5.49)")
 $ l_(+) \( y \) - l_(-) \( y \) = c_0 y^3 e^(- y^2 \/ 2) \( 1 + O \( y^(- 2) \) \) \, wide
   c_0 eq.not 0 . $ <jump:stokes-difference>]

 Finite homothetic bypass solutions satisfying (5.10) and (5.45) have the same difference at $y = Y$,
   up to $Y^3 e^(- Y^2 \/ 2) O \( e^(- c Y^2) \)$.]
] <jump:stokes>

#proof[
  Put $tau = y^2 \/ 2$ and $q = 1 - l \/ y$. The exact equation is
  #[#set math.equation(numbering: n => "(5.50)")
   $ q_tau + q = 2 q^2 - q^3 + frac(1 - 2 q, 2 tau) . $ <jump:q-equation>]
  Choose $alpha_0 > 0$ and $2 pi \/ 3 < theta.alt < pi$ with $theta.alt + alpha_0 < pi$, and put $v =
    e^(i theta.alt)$. On the translated cone
  $ Omega_(+) \( R \) = { a e^(- i alpha_0) + b v : a > R \, med b > 0 } $
  the rays $tau + t v$, $t gt.eq 0$, remain in the cone and $\| tau + t v \| gt.eq c \( \| tau \| + t \)$.
    As $- Re v > 0$, the map
  #[#set math.equation(numbering: n => "(5.51)")
   $ \( cal(T) q \) \( tau \) = -
     v integral_0^oo e^(t v)
     (2 q \( tau + t v \)^2 - q \( tau + t v \)^3 + frac(1 - 2 q \( tau + t v \), 2 \( tau + t v \))) d t
     $ <jump:volterra>]
  is a contraction on a fixed sufficiently large ball in $sup \| tau q \( tau \) \|$ when $R$ is large.
    Indeed its inhomogeneous part is $O \( \| tau \|^(- 1) \)$,
    and its derivative in $q$ is $O \( R^(- 1) \)$ there. Its holomorphic fixed point satisfies (5.50),
    by differentiating under the integral and integrating once in $t$.
    It covers every closed angular subsector of $\( - alpha_0 \, theta.alt \)$ at sufficiently large radius.
    Reflection gives $q_(-)$ below. Uniqueness in these classes is also immediate:
    the difference of two small solutions satisfies $delta' = \( - 1 + O \( tau^(- 1) \) \) delta$,
    and a nonzero such difference grows exponentially on the ray toward upper-left infinity.
    The same argument holds in the lower sector.
  Here is an explicit factorial estimate for their common formal series.
    Set $x = y^(- 2) = \( 2 tau \)^(- 1)$ and $D = x partial_x$. Equation (5.50) is formally equivalent to
  #[#set math.equation(numbering: n => "(5.52)")
   $ q = x + x frac(2 D q - q^2, \( 1 - q \)^2) = x + x sum_(k gt.eq 1) \( 2 D - k + 1 \) q^k .
     $ <jump:positive-recurrence>]
  If $q = sum_(n gt.eq 1) b_n x^n$, then $b_1 = 1$ and
  #[#set math.equation(numbering: n => "(5.53)")
   $ b_(n + 1) = sum_(k = 1)^n \( 2 n - k + 1 \) sum_(i_1 + dots.h.c + i_k = n\
i_j gt.eq 1) product_(j = 1)^k b_(i_j) . $ <jump:coefficients>]
  Every summand is positive. The $k = 1$ term and induction give the lower estimate in
  #[#set math.equation(numbering: n => "(5.54)")
   $ 2^(n - 1) \( n - 1 \) ! lt.eq b_n lt.eq 3^(n - 1) \( n - 1 \) ! . $ <jump:factorials>]
  For the upper induction, $product \( i_j - 1 \) ! lt.eq \( n - k \) !$ and there are $binom(n - 1, k - 1)$
    positive compositions. Hence
  $ b_(n + 1) lt.eq 2 thin 3^(n - 1) n ! sum_(j = 0)^(n - 1) frac(3^(- j), j !) lt.eq
    2 e^(1 \/ 3) 3^(n - 1) n ! < 3^n n ! \, $
  which proves (5.54).
  We next verify the corresponding remainder estimate, rather than infer it from coefficient growth.
    Write $a_j = b_j \/ 2^j$, $P_N \( tau \) = sum_(j < N) a_j tau^(- j)$, and
  $ D_N = P'_N + P_N - 2 P_N^2 + P_N^3 - frac(1 - 2 P_N, 2 tau) . $
  As a polynomial in $zeta = 1 \/ tau$, $D_N$ vanishes to order $N$.
    On $\| zeta \| = \( L N \)^(- 1)$, with $L$ fixed and large,
    (5.54) gives $\| P_N \| + \| zeta^2 partial_zeta P_N \| lt.eq C \/ N$.
    The maximum principle applied after division by $zeta^N$ therefore gives
  $ \| D_N \( tau \) \| lt.eq \( C \/ N \) \( L N \)^N \| tau \|^(- N) lt.eq
    C A^N N ! \| tau \|^(- N) quad \( \| tau \| gt.eq L N \) . $
  The exact error $e_N = q_(+) - P_N$ obeys
  $ e'_N + \( 1 - cal(B) \) e_N = - D_N \, quad cal(B) = 2 \( q_(+) + P_N \) - \( q_(+)^2 + q_(+) P_N + P_N^2 \) -
    1 \/ tau . $
  For $\| tau \| gt.eq L' N$, choose $L'$ so large that along the ray in (5.51) one has $cal(B) =
    O \( \| tau + t v \|^(- 1) \)$. The integrating kernel is bounded by $e^(- c t) \( 1 + t \/ \| tau \| \)^C$.
    Also $\| tau \|^N \/ \| tau + t v \|^N lt.eq exp \( N t \/ \( c \| tau \| \) \)$.
    The latter is absorbed by the exponential when $L'$ is large. Variation from infinity proves
  #[#set math.equation(numbering: n => "(5.55)")
   $ \| q_plus.minus \( tau \) - P_N \( tau \) \| lt.eq C A^N N ! \| tau \|^(- N) \, wide \| tau \| gt.eq L' N \,
     $ <jump:factorial-remainder>]
  uniformly on every closed smaller sector. The boundary term at infinity vanishes because the error is
    $O \( \| tau \|^(- 1) \)$ there.
  Suppose the lateral solutions agreed. They would then give a single holomorphic $q$ on an exterior sector of
    opening greater than $pi$, with (5.55). Choose $pi \/ 2 < omega <
    theta.alt$ and let $Gamma_R$ run inward from infinity on angle $- omega$,
    counterclockwise along the right circle $\| tau \| = R$ to angle $omega$, then outward to infinity.
    For $\| arg u \| < omega - pi \/ 2$ set
  #[#set math.equation(numbering: n => "(5.56)")
   $ H \( u \) = frac(1, 2 pi i) integral_(Gamma_R) e^(tau u) q \( tau \) thin d tau . $ <jump:inverse-laplace>]
  The integral converges, is independent of sufficiently large $R$, and is holomorphic near every positive $u$.
    Move $R$ to $K N$, with $K$ larger than the threshold in (5.55).
    Each monomial integral, closed through the left half-plane, is its residue $u^(j - 1) \/ \( j - 1 \) !$.
    The remainder on the arc and rays is at most
  $ C A^N N ! \( K N \)^(1 - N) e^(K N u) lt.eq C K N \( A \/ K \)^N e^(K N u) $
  for positive $u$. First take $K$ large, then $u > 0$ small. This tends to zero.
    Consequently (5.56) equals the Borel series
  #[#set math.equation(numbering: n => "(5.57)")
   $ hat(q) \( u \) = sum_(n gt.eq 1) frac(a_n, \( n - 1 \) !) u^(n - 1) $ <jump:borel>]
  near the positive origin and continues it analytically along the entire positive axis.
  This is impossible by the positive-coefficient singularity principle known as Pringsheim’s theorem
    #cite(label("FS2009")) Theorem IV.6 and Note IV.13, whose short argument we give here.
    The coefficients in (5.57) are positive, and (5.54) places its convergence radius $R_H$ in
    $\[ 2 \/ 3 \, 1 \]$. If it extended holomorphically through $R_H$,
    choose a positive $r < R_H$ sufficiently close that its Taylor disk extends to a positive $b > R_H$.
    All Taylor coefficients at $r$ are nonnegative, being termwise derivatives of (5.57).
    Exchanging the resulting nonnegative double sums at $b$ would show that the original series converges at $b$,
    contradicting the definition of $R_H$. Thus the two lateral solutions are distinct.
  Finally their slope difference satisfies the exact linear equation
  #[#set math.equation(numbering: n => "(5.58)")
   $ \( l_(+) - l_(-) \)' =
     (l_(+) + l_(-) - 1 / y - frac(l_(+)^2 + l_(+) l_(-) + l_(-)^2, y)) \( l_(+) - l_(-) \) .
     $ <jump:slope-difference-equation>]
  The common expansion is $l = y - y^(- 1) - 2 y^(- 3) + O \( y^(- 5) \)$, so the coefficient is $- y + 3 \/ y +
    O \( y^(- 3) \)$. Its integrable remainder gives (5.49); the constant is nonzero because a nonzero solution of
    this scalar linear equation never vanishes.
  For a finite bypass compare its slope with the canonical lateral slope at the exit.
    Their difference there is at most polynomial in $Y$. Along a path of length $O \( Y \)$ with $\| y \| asymp
    Y$, the coefficient in their exact difference equation is $- y + o \( Y \)$, by (5.45).
    Integrating back to $y = Y$ therefore gives the factor
  $ exp (- Y^2 \/ 2 + Re y_(upright(e))^2 \/ 2 + o \( Y^2 \)) . $
  By (5.10) this is bounded by $exp \( - Y^2 \/ 2 - c' Y^2 \)$.
    Polynomial factors are absorbed by decreasing $c'$. This proves the final assertion and applies to every
    subsequential exterior limit. ◻
]

=== 5.7 Boundary momentum and the common signed jump <boundary-momentum-and-the-common-signed-jump>

For a radial limit let

#[#set math.equation(numbering: n => "(5.59)")
 $ cal(L) \( y \, h \, l \) = y e^h sqrt(1 + l^2) \, wide cal(P) \( y \, h \, l \) =
   frac(y e^h l, sqrt(1 + l^2)) . $ <jump:lagrangian>]

The square root is comparable to $y$ on the exterior arcs. Direct differentiation using (5.44) gives

#[#set math.equation(numbering: n => "(5.60)")
 $ frac(d cal(P), d y) = cal(L) \, wide d cal(P) - cal(P) thin d h =
   y e^h \( 1 + l^2 \)^(- 3 \/ 2) thin d l quad \( y upright(" fixed") \) . $ <jump:primitive>]

The second identity is the boundary-momentum cancellation.

At finite $Z_(*)$ the extra exponential in (5.8) must be retained.
  Indeed, with $epsilon = Z_(*)^(- 2)$, the radial integrand and its momentum are

$ cal(L)_epsilon = y e^(h - epsilon \( h^2 + y^2 \)) sqrt(1 + l^2) \, wide cal(P)_epsilon =
  y e^(h - epsilon \( h^2 + y^2 \)) l / sqrt(1 + l^2) . $

Their Euler–Lagrange identity is $frac(d, d y) cal(P)_epsilon = \( 1 - 2 epsilon h \)
  cal(L)_epsilon$ along a stationary radial curve; $cal(P)_epsilon$ is not an exact primitive of $cal(L)_epsilon$.
  For a noncircular finite-scale graph the boundary momentum instead has denominator
  $sqrt(1 + h_y^2 + h_theta^2 \/ y^2)$ and numerator $y e^(h - epsilon \( h^2 + y^2 \)) h_y$,
  averaged in $theta$ in the units of (5.8). Thus we first use the exact finite-scale first variation,
  including its height momentum. Stationarity reduces the inner comparison to its boundary at $y = Y$.
  On that boundary and on bounded-$y$ exterior pieces, the coefficient correction is $o_B \( 1 \)$ uniformly along
  the normalized homotopy, and the oscillation tends to zero.
  Only there do we pass to the translator identities (5.60).
  The same preliminary matching value $Z$ and its derived scale $Z_(*)$ are held fixed along the homotopy;
  the boundary height $h \( Y \)$ is allowed to vary, and its exact momentum term is retained.
  No polynomial bound for a gluing graph is being compared directly with the exponentially small action scale.

The outward surface orientation follows decreasing $r$, so its positive-area integral is from the exit toward the
  incoming section. Thus a limiting exterior piece from $Y$ to its complex exit contributes $cal(P) \( Y \) -
  cal(P) \( y_(upright(e)) \)$ in the units preceding the integrand in (5.8).
  The exit term is $O \( e^(- c Y^2) \)$ by (5.45) and (5.10).

The inner action must be varied at the same time. At finite $B$ truncate both normalized surfaces at their common
  $y = Y$ sections and interpolate their outgoing derivative data there, on every adverse end simultaneously.
  Keep $p$ fixed. Proposition 34 gives an actual normalized homotopy whose endpoints are exactly the two
  restrictions. At a fixed section $r = 2 Y \/ Z_(*)$,

$ g_t = frac(r l, Z) \, $

so linear interpolation of the derivative data makes $l$ linear in the interpolation parameter in the radial
  limit. On the nonadverse ends the paths, sections and derivative prescriptions are fixed,
  while their boundary heights may vary. Retain their fixed-exit momentum terms in 24;
  their size is $C_D B^M e^(- D B^2 \/ 5)$ by the same polynomial normalization bounds and the full-stop Gaussian
  threshold. This is negligible relative to every adverse scale.
  Stationarity and the exact first variation then leave the adverse boundary momentum:
  in the units of (5.8) its limit is $- integral cal(P) thin d h$.
  There is no compact multiplier term because $d p = 0$. Combining this with the two exterior pieces,
  (5.60) gives the net comparison

#[#set math.equation(numbering: n => "(5.61)")
 $ integral_(l_(-) \( Y \))^(l_(+) \( Y \)) Y e^h \( 1 + l^2 \)^(- 3 \/ 2) thin d l +
   O \( e^(- c Y^2) \) . $ <jump:net-comparison>]

This calculation is made after $B arrow.r oo$ for fixed $Y$.
  It therefore does not subtract two uncontrolled large limiting pieces.
  Smooth compact convergence and (5.39) justify first variation before this limit and passage to the limit afterward.

Uniformly along the interpolation, $h = Y^2 \/ 2 - log Y + o \( 1 \)$ and $l \/ Y = 1 + o \( 1 \)$ as $Y arrow.r
  oo$. Consequently

$ Y e^h \( 1 + l^2 \)^(- 3 \/ 2) = Y^(- 3) e^(Y^2 \/ 2) \( 1 + o \( 1 \) \) . $

Lemma 37 now shows that (5.61) tends to $c_0 eq.not 0$.

#proof[
  Lemma 36, including the preliminary synchronization (5.2) and the retained far boundary momenta,
    changes the original actions to the ones used in (5.61), at a cost $O \( e^(- c Y_0^2) \)$ in the sum of
    absolute end scales. At fixed $Y_0$, (5.8) and the normalized homotopy give the sum of the limiting
    comparisons, with errors $o_B \( 1 \)$ in each scale. Lemma 37 and (5.61) identify the same constant on every
    end as $Y_0 arrow.r oo$. There are only finitely many ends,
    so these errors sum with respect to their absolute scales. The order of limits is therefore the one stated.
  There is no end-dependent orientation sign. On every end $z$ increases outward along its chosen ray,
    the circular radius decreases toward the collapsing profile, and the branch of area starts positive.
    The change to (5.8) therefore always reverses the radial integration limits in the same way.
    Reversing a normal, or rotating an end’s axis in ambient space, changes none of these area conventions.
    With one common ordering of upper and lower bypasses, the same $epsilon.alt_(upright("lab"))
    c_0$ occurs throughout. This proves the proposition. The separate phase comparison of the $Z_(* \, j)$ will
    determine which terms can dominate the sum; no assertion of cancellation or noncancellation for arbitrary
    complex phases is built into (5.9). ◻
]

== 6 Mean jets and the phase of the end contributions <sec:phase>

The action comparison in Proposition 31 may take place at complex common parameters.
  It is therefore necessary to determine the end phases to $o \( 1 \)$ inside the exponential in Proposition 32.
  Polynomial closeness of the end profiles by itself would not suffice.
  We first compute the mean opening jets, then compare a finite Taylor graph with an actual stationary solve
  before the pole. Integrating the mean equation transfers this information to the height matching section and
  determines the exponent through its constant term. This precision is what allows contributions from several ends
  to be compared. Throughout this section an opening scale is $B = \| s \|^(- k \/ 2)$, and $\| x \| =
  O \( B^(- 2) \)$. The Taylor orders and derivative orders invoked below, together with their polynomial losses,
  are fixed before $B$ tends to infinity. Where derivatives of actual solutions are used,
  the indicated strip and first-trace norms retain their scale factors.

On a chosen cylindrical end, use the physical radial coordinate after the analytic axis adjustments of
  Proposition 13. The additional first-order tilt is removed as in Proposition 23. Write

#[#set math.equation(numbering: n => "(6.1)")
 $ w = R^2 \/ 2 - 1 \, wide t = log z \, wide chevron.l f chevron.r = \( 2 pi \)^(- 1) integral_0^(2 pi)
   f \( theta \) thin d theta . $ <phase:w>]

The opening coefficient $beta = beta \( b \, x \)$ is the first-jet coefficient;
  it is linear homogeneous in $x$ for fixed $b$, and real analytic in $b$.

#thm([Lemma 6.1.])[
  (Mean jets and their improved growth).  #emph[Let $w_(\[ n \])$ denote the term homogeneous of degree $n$ in $x$
    in the stationary jet, with $b$ retained as an analytic parameter.
    For each fixed $n$ and every sufficiently small $eta > 0$,
    the estimates below hold uniformly for $b$ in a smaller complex neighborhood,
    with fixed logarithmic and angular derivatives:
#[#set math.equation(numbering: n => "(6.2)")
 $ chevron.l w_(\[ 0 \]) chevron.r & = O \( z^(- 4 + eta) \) \,\
chevron.l w_(\[ 1 \]) chevron.r & = beta \( z^2 - 2 \) + O \( \| x \| z^(- 2 + eta) \) \,\
chevron.l w_(\[ 2 \]) chevron.r & = \( - 4 beta^2 log z + c_2 \( b \, x \) \) z^2 + O \( \| x \|^2 z^(1 + eta) \) \,\
w_(\[ n \]) & = O_n \( \| x \|^n z^(2 n - 2 + eta) \) wide \( n gt.eq 2 \) . $ <phase:mean-jets>]

 Here $c_2$ is quadratic homogeneous in $x$, analytic in $b$, and real for real parameters.]
] <phase:jets>

#proof[
  We use the full radial equation, so that its angular and axial terms can be counted at every opening degree. Put
  $ A = 1 + w \, wide H = A + frac(w_theta^2, 4 A) \, wide f = log A . $
  Here $A$ and $H$ are analytic units near the cylindrical base profile,
    and $f$ is the logarithm continued from $A = 1$. To derive the equation, set $pi = w_z$, $chi = w_theta$,
    and $D = 2 H + pi^2$. The radial curvature numerator preceding (3.5),
    together with the support term $\( R - z R_z \) \/ 2$, is the radial shrinker equation.
    Multiplying it by $R D$ and collecting its terms gives
  $ 0 =  & - H (w_t - 2 w - frac(4 A w_(theta theta) - 4 chi^2, 4 A^2 + chi^2)) + 2 H w_(z z) -
    frac(pi chi, A) w_(z theta)\
 & + pi^2 (w - 1 - w_t / 2 + frac(w_(theta theta), 2 A)) . $
  Here $D$ is the determinant factor of the radial graph metric. Since
  #[#set math.equation(numbering: n => "(6.3)")
   $ frac(4 A w_(theta theta) - 4 w_theta^2, 4 A^2 + w_theta^2) = 2 partial_theta arctan \( f_theta \/ 2 \) \,
     $ <phase:angular-divergence>]
  division by $H$ and conversion to $t = log z$ yield the exact equation
  #[#set math.equation(numbering: n => "(6.4)")
   $ w_t - 2 w =  & 2 partial_theta arctan \( f_theta \/ 2 \) + 2 z^(- 2) \( w_(t t) - w_t \) -
     z^(- 2) frac(w_t w_theta, A H) w_(t theta)\
 & + z^(- 2) w_t^2 / H (w - 1 - w_t / 2 + frac(w_(theta theta), 2 A)) . $ <phase:full-equation>]
  The arctangent is the analytic branch near zero. In particular its angular derivative has zero mean at every
    formal degree. When $w$ is circular, (6.4) is equivalently
  #[#set math.equation(numbering: n => "(6.5)")
   $ w_(z z) - z / 2 w_z + w = frac(w_z^2, 4 \( 1 + w \)) \( 2 + z w_z - 2 w \) . $ <phase:circular>]
  The prescribed axis adjustments are ambient orthogonal transformations before the physical radius is used,
    so these identities remain valid for their parameter-dependent formal expansions.
  Let $frak(E) \( w \)$ denote the left side minus the right side of (6.4), and put $cal(D)_b =
    D frak(E) \( w_(\[ 0 \]) \)$. Outside the observation support, $frak(E) \( w_(\[ 0 \]) \) = 0$.
    Proposition 13 and the analytic change from $R$ to $w$ give, after removal of the first-order tilt,
  #[#set math.equation(numbering: n => "(6.6)")
   $ w_(\[ 0 \]) = O \( z^(- 2 + delta) \) \, wide w_(\[ 1 \]) = beta z^2 +
     O \( \| x \| z^delta \) $ <phase:initial-jets>]
  for every small $delta > 0$, with each fixed log and angular derivative.
    The leading first-order term is circular. Each $O \( z^alpha \)$ remainder here and in the induction below is
    bounded in the weighted strip domain $X_(z^alpha \, h)$ after each required fixed log derivative,
    together with its first traces. By taking $h$ large these give the displayed pointwise angular bounds.
    An unscaled log derivative used as a coefficient is the function trace of a differentiated jet,
    supplied by the log-regularity assertion of Lemma 8.
  The operator $cal(D)_b$ is the radial realization of the Jacobi operator at $w_(\[ 0 \])$:
    the preceding multipliers and change of dependent variable are units,
    and their derivatives multiplying the base equation vanish. At the round cylinder one has exactly
  $ D frak(E) \( 0 \) v = v_t - 2 z^(- 2) \( v_(t t) - v_t \) - v_(theta theta) - 2 v = cal(L)_(upright("cyl")) v . $
  For $w_(\[ 0 \])$ satisfying (6.6), the coefficients of $v_(theta theta) \, v_theta \, v_t \,
    v$ differ from these model coefficients by $O \( z^(- 2 + delta) \)$ in the normalized multiplier norms.
    The $v_(t t)$ coefficient is unchanged, and the $v_(t theta)$ coefficient is $O \( z^(- 6 + delta) \)$.
    Thus it is also small after division by the mixed-derivative scale $z^(- 1)$.
    The same statements hold after each fixed log derivative:
    they follow by differentiating the rational coefficients in (6.4) and using (6.6).
    On a sufficiently far tail, uniformly for $b$ in a smaller complex neighborhood,
    $cal(D)_b$ therefore has the normalized decay and strict diffusion margins of Lemma 8.
  For $n gt.eq 2$, the equation at total opening degree $n$ is
  #[#set math.equation(numbering: n => "(6.7)")
   $ cal(D)_b w_(\[ n \]) = - [frak(E) (w_(\[ 0 \]) + sum_(1 lt.eq j < n) w_(\[ j \]))]_(\[ n \]) .
     $ <phase:jet-equation>]
  In particular every occurrence of the unknown $w_(\[ n \])$,
    including the terms with nonconstant base coefficients, stays on the left.
    The right side has only lower-degree jets. To estimate it,
    first consider the angular term in the rational form (6.3).
    A Taylor coefficient of its numerator contains an angular derivative of a jet.
    A base angular derivative is $O \( z^(- 2 + delta) \)$; an angular derivative of $w_(\[ 1 \])$ is
    $O \( \| x \| z^delta \)$ because $beta z^2$ is circular; and at degree $j gt.eq
    2$ the inductive bound is $O \( \| x \|^j z^(2 j - 2 + delta) \)$.
    Each is two powers below the nominal weight $z^(2 j)$ for its degree,
    with degree zero interpreted as nominal weight one. The inverse denominator has degree-$ell$ coefficients of
    at most the nominal weight $\| x \|^ell z^(2 ell)$ after a small loss.
    Hence, for a requested final loss $eta$, the input losses can be chosen so that this angular contribution at
    degree $n$ has weight at most $\| x \|^n z^(2 n - 2 + eta \/ 3)$.
  Every remaining nonlinear term in (6.4) has the explicit factor $z^(- 2)$.
    Its rational coefficients are analytic in $w \, w_theta$,
    and its other factors are fixed log or angular derivatives of the lower jets.
    At degree $n$ their nominal weight before this factor is at most $\| x \|^n
    z^(2 n + eta \/ 3)$ after the same choice of input losses.
    For the displayed second derivatives use bulk bounds as follows:
    $w_(theta theta)$ uses its ordinary bulk slot, $w_(t theta)$ uses the function bulk norm of $partial_t
    w$ at one extra angular Sobolev order, and $w_(t t)$ uses the function bulk norm of $partial_t^2 w$.
    These unscaled bounds come from the separately controlled differentiated jets.
    The other factors use their first traces. This gives the same source weight $\| x \|^n
    z^(2 n - 2 + eta \/ 3)$ in $Y_(z^(2 n - 2 + eta \/ 3) \, h)$.
    There are finitely many products at each degree, so the input losses can always be chosen this small.
  For clarity about derivative order, fix a terminal degree $N$ and a required number $m$ of log and angular
    derivatives. At degree $j lt.eq N$ carry $m + 2 \( N - j \)$ derivatives,
    with a fixed angular Sobolev reserve. The two derivatives in (6.4) then require only estimates already
    obtained at lower degrees. Apply the separated inverse of Lemma 8 to (6.7) at the fixed weight $2 n - 2 +
    2 eta \/ 3 > 2$, taking the entrance sufficiently far out for this weight.
    For real $b$, solve at this weight with the entrance data of the polynomially growing jet from Proposition 13.
    Compare in a larger polynomial weight chosen above both this weight and the known polynomial bound for that
    jet. Both weights exceed every slow rate and prescribe the same full slow entrance data,
    so separated uniqueness identifies the two solutions. This also excludes the fast outward mode;
    the slow homogeneous $z^2$ mode lies in the target weight.
  The target-weight inverse, source, and entrance trace are analytic in $b$ on a smaller complex neighborhood.
    The constructed solution is therefore analytic there. On each compact strip the original finite jet is also
    analytic in $b$ by Proposition 13; equality for real $b$ extends to that complex neighborhood by the identity
    principle. Thus the weighted estimate is uniform there without using a real comparison principle at complex
    parameters. Reserve the remaining $eta \/ 3$ for the arbitrarily small loss in the fixed log-regularity
    assertion. It gives all the derivative bounds just specified at weight $2 n - 2 + eta$.
    This proves (6.2) for each fixed $n$, using no convergence of the formal series.
  We now project the full equation onto its mean. Define
  $ cal(L)_0 = partial_z^2 - \( z \/ 2 \) partial_z + 1 \, wide U = \( A H \)^(- 1) \, quad V = H^(- 1) \,\
K = w - 1 - w_t / 2 + frac(w_(theta theta), 2 A) . $
  Averaging (6.4) cancels the angular divergence exactly and gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ cal(L)_0 chevron.l w chevron.r = frac(1, 2 z^2) ⟨U w_t w_theta w_(t theta) - V K w_t^2⟩ . $ <phase:mean-equation>]
  The following coefficient bounds make the first three degrees explicit.
    Use smaller losses in the input estimates and relabel their finite sums by $delta$;
    then choose $delta$ small enough that the products below have total loss at most the final $eta$.
    The bounds (6.6) and the now proved degree-two case of (6.2) give
  $ n & \( w_t \)_(\[ n \]) & \( w_theta \, w_(t theta) \, w_(theta theta) \)_(\[ n \])\
0 & O \( z^(- 2 + delta) \) & O \( z^(- 2 + delta) \)\
1 & 2 beta z^2 + O \( \| x \| z^delta \) & O \( \| x \| z^delta \)\
2 & O \( \| x \|^2 z^(2 + delta) \) & O \( \| x \|^2 z^(2 + delta) \) . $
  Here a bound for a tuple applies to each entry, with the fixed derivative norms above.
    Expanding the three rational factors through degree two gives
  $ & \[ 0 \] & \[ 1 \] & \[ 2 \]\
U & 1 + O \( z^(- 2 + delta) \) & O \( \| x \| z^2 \) & O \( \| x \|^2 z^4 \)\
V & 1 + O \( z^(- 2 + delta) \) & - beta z^2 + O \( \| x \| z^delta \) & O \( \| x \|^2 z^4 \)\
K & - 1 + O \( z^(- 2 + delta) \) & O \( \| x \| z^delta \) & O \( \| x \|^2 z^(2 + delta) \) . $
  For example,
  $ K_(\[ 1 \]) = w_(\[ 1 \]) - 1 / 2 \( w_(\[ 1 \]) \)_t + frac(\( w_(\[ 1 \]) \)_(theta theta), 2 A_(\[ 0 \])) -
    frac(\( w_(\[ 0 \]) \)_(theta theta) w_(\[ 1 \]), 2 A_(\[ 0 \])^2) . $
  The circular terms in its first two summands cancel. At degree two,
    the possible factor $w_(\[ 1 \])^2$ in an inverse denominator is $O \( \| x \|^2 z^4 \)$,
    and whenever it occurs in $K_(\[ 2 \])$ it multiplies $\( w_(\[ 0 \]) \)_(theta theta) =
    O \( z^(- 2 + delta) \)$. This proves the stated $K_(\[ 2 \])$ bound and accounts for the denominator terms as well.
  Set $Xi = U w_t w_theta w_(t theta)$ and $Psi = V K w_t^2$ for this calculation.
    Taking every distribution of degrees among the displayed factors gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ Xi_(\[ 0 \]) & = O \( z^(- 6 + eta) \) \, & Psi_(\[ 0 \]) & = O \( z^(- 4 + eta) \) \,\
Xi_(\[ 1 \]) & = O \( \| x \| z^(- 2 + eta) \) \, & Psi_(\[ 1 \]) & = O \( \| x \| z^eta \) \,\
Xi_(\[ 2 \]) & = O \( \| x \|^2 z^eta \) \, & Psi_(\[ 2 \]) & = - 4 beta^2 z^4 +
  O \( \| x \|^2 z^(2 + eta) \) . $ <phase:mean-product-bounds>]
  To see the only leading term in the last entry, use the exhaustive product decomposition
  $
    Psi_(\[ 2 \]) = \( w_t^2 \)_(\[ 2 \]) \( V K \)_(\[ 0 \]) + \( w_t^2 \)_(\[ 1 \]) \( V K \)_(\[ 1 \]) + \(
    w_t^2 \)_(\[ 0 \]) \( V K \)_(\[ 2 \]) . $
  The first factor in its first summand is $4 beta^2 z^4 + O \( \| x \|^2 z^(2 + eta) \)$,
    and $\( V K \)_(\[ 0 \]) = - 1 + O \( z^(- 2 + delta) \)$.
    The other two summands are respectively $O \( \| x \|^2 z^(2 + eta) \)$ and $O \( \| x \|^2 z^eta \)$.
    In $Xi_(\[ 2 \])$, either a positive-degree angular factor loses two powers,
    or both angular factors have their base decay; the coefficient bounds above give the displayed estimate for
    every degree distribution. The terms linear in $w_(\[ 2 \])$ through decaying base coefficients are included
    here only after its growth bound has been proved. Thus (6.8) contains no other term at the resonant weight,
    and yields
  #[#set math.equation(numbering: n => "(6.10)")
   $ cal(L)_0 chevron.l w_(\[ 0 \]) chevron.r & = O \( z^(- 6 + eta) \) \,\
cal(L)_0 chevron.l w_(\[ 1 \]) chevron.r & = O \( \| x \| z^(- 2 + eta) \) \,\
cal(L)_0 chevron.l w_(\[ 2 \]) chevron.r & = 2 beta^2 z^2 + O \( \| x \|^2 z^eta \) . $ <phase:mean-forcing>]
  The loss in these source estimates is arbitrary. In applying the scalar estimate below,
    take it smaller than the $eta$ in the statement and reserve the difference for the fixed log-regularity estimate.
  It remains to extract the slow mean coefficient. Let $h_0 \( z \) = z^2 - 2$, so that $cal(L)_0 h_0 = 0$.
    For a polynomially growing mean solution $h_0 v$ on a far tail, direct differentiation gives
  $ \( h_0^2 e^(- z^2 \/ 4) v' \)' = h_0 e^(- z^2 \/ 4) cal(L)_0 \( h_0 v \) . $
  Polynomial growth excludes the fast homogeneous solution. Hence
  #[#set math.equation(numbering: n => "(6.11)")
   $ v' \( z \) = - frac(e^(z^2 \/ 4), h_0 \( z \)^2) integral_z^oo h_0 \( s \) e^(- s^2 \/ 4)
     cal(L)_0 \( h_0 v \) \( s \) thin d s . $ <phase:slow-flux>]
  For a source $O \( z^sigma \)$ this is $O \( z^(sigma - 3) \)$ by the Gaussian tail estimate.
    When $sigma < 2$, integration shows that the solution is $c h_0 + O \( z^sigma \)$;
    if the solution is $o \( z^2 \)$, then $c = 0$. The scalar separated estimate gives the same bounds with the
    fixed log derivatives when the source has them.
  Apply this observation to the first line of (6.10), relaxing its source weight to $- 4 + eta$.
    The base bound in (6.6) excludes $h_0$, and gives the asserted $O \( z^(- 4 + eta) \)$ mean.
    For degree one subtract $beta h_0$. The remaining function is $O \( \| x \| z^delta \) =
    o \( z^2 \)$ by (6.6), and its source has weight $- 2 + eta$. This proves the first two lines of (6.2).
  Finally,
  $ cal(L)_0 \( - 4 beta^2 z^2 log z \) = 2 beta^2 z^2 - 8 beta^2 log z - 12 beta^2 . $
  After subtracting this particular solution, the last source in (6.10) is $O \( \| x \|^2 z^(1 + eta) \)$ for any
    fixed $0 < eta < 1$, allowing a harmless relaxation of its lower weight. Apply (6.11) with
  $ v_2 \( z \) = frac(chevron.l w_(\[ 2 \]) chevron.r + 4 beta^2 z^2 log z, h_0 \( z \)) . $
  It gives $v'_2 = O \( \| x \|^2 z^(- 2 + eta) \)$, which is integrable.
    Thus $c_2 = lim_(z arrow.r oo) v_2 \( z \)$ exists and gives
  $ chevron.l w_(\[ 2 \]) chevron.r + 4 beta^2 z^2 log z = c_2 \( z^2 - 2 \) + O \( \| x \|^2 z^(1 + eta) \) . $
  The coefficient is $O \( \| x \|^2 \)$ and homogeneous quadratic in $x$,
    because both the finite jet and the subtracted term have that degree.
    Absorbing $- 2 c_2$ into the remainder proves the third line of (6.2).
    The flux integral is uniformly convergent on a smaller complex $b$ neighborhood,
    and the finite-order jets there are analytic in $b$. Evaluation at one fixed height together with that
    integral proves that $c_2$ is analytic. The same formula uses only real data for real parameters,
    so $c_2$ is real there. ◻
]

#thm([Lemma 6.2.])[
  (Evaluation of the inner mean).  #emph[Fix a sufficiently small $epsilon.alt_1 > 0$, and put $z_1 =
    B^(1 - epsilon.alt_1)$ on the real incoming portion of an adverse end.
    For the preliminary normalized solution at the common parameters,
#[#set math.equation(numbering: n => "(6.12)")
 $ frac(chevron.l w \( z_1 \) chevron.r, z_1^2) = beta - frac(2 beta, z_1^2) - 4 beta^2 log z_1 +
   c_2 \( b \, x \) + o \( B^(- 4) \) . $ <phase:inner-value>]

 The error is uniform over the finite list of ends and the allowed parameter balls.]
] <phase:inner-evaluation>

#proof[
  Put $Z = z_2 = B^(1 - epsilon.alt_1 \/ 2)$, and stop every cylindrical end at a comparable real incoming
    section, retaining the compact core and the conical domains.
    Fix a Taylor degree $n$ and a small loss $eta > 0$. Since $\| x \| z_2^2 = O \( B^(- epsilon.alt_1) \)$,
    the finite Taylor surface stays in the same small graph charts on this domain.
    Its residual, in the normalized strip source norm at height $z$, is bounded by
  $ C_n B^(- 2 n - 2) \( 1 + z \)^(2 n + 2 + eta) . $
  Its compact and conical residuals have the same coefficientwise Taylor bound.
    Let $e$ be the difference from the actual preliminary solution,
    using the analytic scalar variable $w$ on the incoming cylinders.
    The actual mean-value linearization, with its compact multiplier columns and observation equations retained, gives
  $ cal(A)_(Z \, n) \( e \, ell \) = \( f_n \, 0 \) \, wide
    cal(A)_(Z \, n) \( v \, m \) = \( L_(*) v + Q_(*) m \, P_(*) v \) . $
  Here $P_(*) e = 0$ follows from the identical observations, and does not set $ell$ to zero.
    If a finite chart conversion leaves an observation residual of Taylor order $n + 1$,
    first remove it by a fixed compact lift; its contribution has the same bound as $f_n$.
  First solve the forced augmented problem with zero observations and homogeneous outgoing derivative data.
    Retain the natural Taylor weight
  $ rho_n \( z \) asymp \( 1 + z \)^(p_n) \, wide p_n = 2 n + 2 + eta \, $
  normalized on a fixed entrance collar. Apply Proposition 20 at this fixed rate with its size parameter relabeled
    $Z = z_2$, rather than the opening scale $B$. The straight real stops are at uniformly comparable multiples of
    $Z$; choose the proposition’s $c$ below their minimum ratio.
    There are no modified outer bands or height charts in this application.
    The paths retain the single real log coordinate, and the truncation leaves the compact domain and infinite
    conical pieces unchanged. Since $\| beta \| Z^2 = O \( B^(- epsilon.alt_1) \)$,
    the circular coefficients retain their strict smallness and diffusion margins on the truncated cylinders.
    The normalized domain-to-range smallness of the actual mean-value coefficients is the estimate
    $Z \( W_(upright("act")) + W_(upright(T)) \) = o \( 1 \)$ verified below solely from the preliminary and
    finite-jet bounds for the eventual choice $n epsilon.alt_1 > 2$.
    The opening-dependent costs decrease on earlier strips, while the type-preserving base tail is made small by
    the fixed entrance choice. Thus the truncated paths satisfy the coefficient and compatibility hypotheses of
    the proposition.
  For each finite conical stop, the index construction in the proof of Proposition 23 applies directly on this
    shorter domain. Its normalized principal tensor still has positive real part,
    and the new derivative exit in the real log coordinate is transverse.
    The same fixed-domain interpolation to $- Delta + 1$ is therefore properly elliptic with complementing
    boundary conditions, so its index is zero. For this fixed $n$,
    choose the entrance sufficiently far out that $p_n sup E$ is small, and then take $Z$ large.
    The exterior forward estimate retains its strict buffer above every slow rate,
    and its compact-limit argument still has polynomial growth, hence lies in the Gaussian augmented domain.
    The stopped index argument supplies surjectivity. The original $B$ enters the resulting bound through the
    source amplitude $B^(- 2 n - 2)$, so the forced pair obeys
  $ parallel \( e_F \, ell_F \) parallel_(X_(rho_n)) lt.eq C_n B^(- 2 n - 2) \, wide
    frac(\| e_F \( z_1 \) \|, z_1^2) lt.eq C_n B^(- 2 - 2 n epsilon.alt_1 + \( 1 - epsilon.alt_1 \) eta) . $
  The second estimate is the function trace of the retained weighted norm.
    No coarse physical inverse factor $B^(q_n)$ is spent on this polynomial source;
    increasing $p_n$ would have to be charged to the displayed loss.
  The remainder $h = e - e_F$ has homogeneous augmented equation and zero observations,
    but has outgoing derivative discrepancy $g$ at each stop.
    Its norm in the natural Neumann trace space (3.10) is at most $B^(M_n)$. Construct a separate collar lift:
    choose fixed $0 < a < b < c < 1$, and solve
  $ L_(*) H = 0 quad upright("on ") \[ a z_2 \, z_2 \] \, wide H \( a z_2 \) = 0 \, wide H_t \( z_2 \) = g . $
  This zero entrance condition is imposed on $H$, not on $h$.
    The collar has bounded logarithmic length and $E asymp z_2^(- 2)$.
    The shifted smallness hypothesis can be checked independently of this comparison.
    Use, on the whole real collar $z asymp Z$, the same circular reference
  $ R_c \( z \) = sqrt(2 \( 1 + beta z^2 \)) \, wide w_c = beta z^2 . $
  Because $\| beta \| Z^2 = O \( B^(- epsilon.alt_1) \)$, this reference has uniform transversality,
    nonzero drift and strict cylindrical diffusion margins, with $E asymp Z^(- 2)$.
    This verifies its admissibility; the correction must satisfy a separate estimate.
    The comparison construction in Proposition 23 and (4.39) give, in the full norm (4.8),
  $ W_(upright("act")) lt.eq C_D #scale(x: 120%, y: 120%)[\(] Z^(- 2 + eta) + B^(- 2) Z^eta +
    B^(- 4) Z^2.2 #scale(x: 120%, y: 120%)[\)] . $
  The first two terms are the base cylindrical remainder and the nonleading first opening jet after the common
    axis and tilt adjustments; the last is the actual correction to that comparison.
    These estimates do not use the Taylor comparison or the shielding conclusion.
  For the degree-$n$ Taylor graph, Lemma 38, including its fixed logarithmic and angular derivative bounds, gives
  $ W_(upright(T)) lt.eq C_n #scale(x: 120%, y: 120%)[\(] Z^(- 2 + eta) + B^(- 2) Z^eta +
    B^(- 4) Z^(2 + eta) + \( B^(- 2) Z^2 \)^(n + 1) #scale(x: 120%, y: 120%)[\)] . $
  Indeed, for $j gt.eq 2$ the corresponding term is bounded by $C_n B^(- 4)
    Z^(2 + eta) \( B^(- 2) Z^2 \)^(j - 2)$, and there are only finitely many terms.
    The final summand can be omitted if the finite jet is taken in $w$ and the radius is recovered exactly.
    If the radius itself is Taylor-truncated, it bounds the degree-$n + 1$ tail of the analytic square root;
    the same bound holds after each required fixed log derivative.
    The analytic change between $R - R_c$ and $w - w_c$ preserves these strip bounds,
    since $R_c$ stays bounded away from zero and its fixed log derivatives are bounded.
  Writing $alpha = 1 - epsilon.alt_1 \/ 2$, the two estimates imply
  $ Z \( W_(upright("act")) + W_(upright(T)) \) lt.eq C_n #scale(x: 120%, y: 120%)[\(] &
    B^(- alpha \( 1 - eta \)) + B^(- 1 - epsilon.alt_1 \/ 2 + alpha eta) + B^(- 0.8 - 1.6 epsilon.alt_1)\
 & + B^(- 1 - 3 epsilon.alt_1 \/ 2 + alpha eta) + B^(1 - \( n + 3 \/ 2 \) epsilon.alt_1)
   #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $
  Here the existing choice $n epsilon.alt_1 > 2$, followed by sufficiently small $eta > 0$,
    makes every exponent negative. Interpolate the actual and Taylor graphs in the common scalar chart used by the
    mean-value linearization. Their difference from this same circular reference is bounded throughout the segment
    by a constant times $W_(upright("act")) + W_(upright(T))$.
    In the radial realization of Lemma 18 take $c_1 = 0$, $c_2 = 1$, and axial scale $Z$.
    Thus the shifted coefficient–module bound of Lemma 21 applies uniformly along the averaged segment,
    with $epsilon = O \( Z \( W_(upright("act")) + W_(upright(T)) \) \) = o \( 1 \)$.
  Lemma 21, with large scale $z_2$, gives on $\[ b z_2 \, c z_2 \]$ the strip and first-trace bound $B^(M'_n)
    e^(- c_0 z_2^2)$. Its application uses the shifted coefficient–module norm of the actual difference operator;
    a coefficient containing a background second derivative is kept in its $L^2$ slot.
    Under the constant shift $d = c_1 z_2^2$, the exit is $\( partial_t + d \) tilde(H) = g$.
    Keeping this Robin condition and $E \( partial_t + d \)^2$ in the shifted norm preserves the fast-root
    estimate and the gain $d - O \( E d^2 \)$.
  Choose $chi$ with bounded log derivatives, zero below $b z_2$ and one above $c z_2$.
    Extend $V = chi H$ by zero inward, summing over the finite list of ends.
    Its observations vanish, it realizes every remote datum, and its residual is already exponentially small:
  $ r = L_(*) V = \[ L_(*) \, chi \] H \, wide parallel r parallel_Y lt.eq B^(M''_n) e^(- c_0 z_2^2) . $
  Only the shielded lift has been cut off; an arbitrary polynomially bounded remote discrepancy would not give
    this estimate. Solve the normalized repair $cal(A)_(Z \, n) \( k \, ell_R \) = \( - r \, 0 \)$ with
    homogeneous exits. For this solve rate $2.2$ and any fixed polynomial conversion loss are harmless, giving
  $ \| k \( z_1 \) \| \/ z_1^2 + \| ell_R \| lt.eq B^(C_n) e^(- c_0 z_2^2) . $
  Since $z_1 \/ z_2 arrow.r 0$, $V$ vanishes near $z_1$. The pair
    $\( e \, ell \) - \( e_F \, ell_F \) - \( V + k \, ell_R \)$ has zero augmented output,
    zero observations and homogeneous exits in the same stopped cylindrical and infinite conical domain.
    Full augmented injectivity therefore makes it zero. This excludes the remaining slow mode together with any
    compensating compact multiplier.
  Combining the two solves and writing $eta' = \( 1 - epsilon.alt_1 \) eta$ yields
  $ frac(\| e \( z_1 \) \|, z_1^2) lt.eq C_n B^(- 2 - 2 n epsilon.alt_1 + eta') +
    B^(C_n) e^(- c_0 B^(2 - epsilon.alt_1)) = o \( B^(- 4) \) $
  when $n epsilon.alt_1 > 2$ and the losses are sufficiently small.
    The associated trace statement controls $\( e \, e_theta \, sqrt(E) thin e_t \) \/ z_1^2$;
    an unscaled derivative trace may cost $E^(- 1 \/ 2)$. The later primitive estimate instead uses the separate
    preliminary bounds $parallel delta_t parallel_(L^2) lt.eq
    C W$ and $parallel delta_t parallel_(upright("trace")) lt.eq C B W$,
    so it needs no stronger Taylor-error derivative trace.
  For $3 lt.eq j lt.eq n$, (6.2) gives
  $ B^(- 2 j) z_1^(2 j - 4 + eta) = B^(- 4 - \( 2 j - 4 \) epsilon.alt_1 + \( 1 - epsilon.alt_1 \) eta) =
    o \( B^(- 4) \) . $
  The divided base and linear errors are respectively $O \( z_1^(- 6 + eta) \)$ and
    $O \( B^(- 2) z_1^(- 4 + eta) \)$; the divided second-order remainder is $O \( B^(- 4) z_1^(- 1 + eta) \)$.
    All are $o \( B^(- 4) \)$ for the chosen losses. The surviving terms in (6.2) therefore give (6.12).
    Only finitely many Taylor orders have been used. ◻
]

#thm([Lemma 6.3.])[
  (The integrated averaged equation).  #emph[Continue the preliminary solution from $z_1$ to its fixed real-radius
    height section $r_0 in \( 0 \, sqrt(2) \)$. In prescribed transition gauges,
    use the circular averages of the scaled axial and unscaled radial positions.
    Denote the resulting mean curve again by $\( z \, R \)$ and set $w = R^2 \/ 2 - 1$. Then
#[#set math.equation(numbering: n => "(6.13)")
 $ frac(d, d log z) (w / z^2) = frac(4 beta, z^2) - frac(4 beta^2, 1 + beta z^2) + cal(E) \, wide
   integral_(z_1)^(z \( r_0 \)) cal(E) thin d log z = o \( B^(- 4) \) . $ <phase:integrated-equation>]

]
] <phase:primitive>

#proof[
  The preliminary profile bound, with a slight relaxation of its powers, gives size
  #[#set math.equation(numbering: n => "(6.14)")
   $ W = O \( B^(- 1.7) \) $ <phase:W>]
  for the deviation from the circular model on each strip in this region.
    Choose $epsilon.alt_1$ small enough for this consequence of Proposition 23;
    the number of strips is $O \( log B \)$. On the real radial portion $E asymp z^(- 2)$;
    on the bounded final transition bands $E asymp B^(- 2)$. Their derivative losses are consequently at most $B$
    and $B^2$. Lemma 18, applied directly on the prescribed real parameter bands,
    and (4.20) show that the mean curve obeys the circular equation with a strip $L^2$ error at most
    $C \( B W^2 + B^2 W^3 \)$. This accounts for the full angular curvature and support terms,
    including their dependence on axial speed. The axial coordinate of the mean has nonzero scaled derivative;
    conversion of this circular curve to its circular radial equation uses bounded factors.
    It does not invert a nonconstant unknown complex coordinate.
  For explicit normalization, the radial-velocity equation of a circular curve multiplied by $R \( 1 + R_z^2 \)$
    is the left side minus the right side of (6.5). This multiplier is bounded here.
    Dividing that equation to obtain the derivative of $w \/ z^2$ costs $O \( z^(- 2) \)$.
    The accumulated noncircular error is therefore at most
  #[#set math.equation(numbering: n => "(6.15)")
   $ C z_1^(- 2) \( B W^2 + B^2 W^3 \) \( 1 + log B \) & lt.eq C { B^(- 4.4 + 2 epsilon.alt_1) +
     B^(- 5.1 + 2 epsilon.alt_1) } \( 1 + log B \)\
 & = o \( B^(- 4) \) . $ <phase:tensor-budget>]
  The difference between the mean of $R^2 \/ 2 - 1$ and the squared mean radius is
    $chevron.l \( R - chevron.l R chevron.r \)^2 chevron.r \/ 2 = O \( W^2 \)$.
    At either endpoint, after division by $z^2$, its cost is $O \( W^2 z_1^(- 2) \) = o \( B^(- 4) \)$.
    At the initial radial section it relates the mean in Lemma 39 to the present mean curve;
    at the final pure height section the radius is exactly $r_0$.
  It remains to control the circular substitution, including the second derivative.
    Put $tau = log z$ and $q = beta z^2$. The exact circular identity is
  #[#set math.equation(numbering: n => "(6.16)")
   $ partial_tau \( w \/ z^2 \) = 2 z^(- 4) \( w_(tau tau) - w_tau \) -
     frac(w_tau^2, 2 z^4 \( 1 + w \)) \( 2 + w_tau - 2 w \) . $ <phase:exact-primitive>]
  Its value at $w = q$ is exactly the first two terms of (6.13). For $delta = w - q$, the strip and trace bounds give
  $ parallel delta parallel_(L^oo) + parallel delta_tau parallel_(L^2) lt.eq C W \, wide
    parallel delta_tau parallel_(upright("trace")) lt.eq C B W . $
  The denominator $1 + q$ stays uniformly away from zero up to the chosen section.
    Since $B W arrow.r 0$, the rational expression in the second term of (6.16) is Lipschitz on the permitted
    traces; use one $L^2$ factor for $delta_tau$ in its products.
    Its integrated substitution error is bounded by $C z_1^(- 4) W \( 1 + log B \) = o \( B^(- 4) \)$.
    For the first term integrate by parts once, obtaining the exact formula
  #[#set math.equation(numbering: n => "(6.17)")
   $ integral 2 z^(- 4) \( delta_(tau tau) - delta_tau \) thin d
     tau = \[ 2 z^(- 4) delta_tau \]_(upright("ends")) + 6 integral z^(- 4) delta_tau thin d tau . $ <phase:ibp>]
  It costs at most
  #[#set math.equation(numbering: n => "(6.18)")
   $ C B W z_1^(- 4) + C W z_1^(- 4) \( 1 + log B \) = O \( B^(- 4.7 + 4 epsilon.alt_1) \) +
     o \( B^(- 4) \) . $ <phase:second-budget>]
  One may take $0 < epsilon.alt_1 < 0.1$ and then the jet losses sufficiently small.
    Both (6.15) and (6.18) are then $o \( B^(- 4) \)$. This proves the integrated statement with all changes of
    gauge included. ◻
]

#thm([Proposition 6.4.])[
  (The phase to constant order).  #emph[For an adverse end set $Z_0 = \( - beta \)^(- 1 \/ 2)$ on the branch
    continued from positive values, and define $Z$ by its mean height at the common section as in Proposition 32. Let
$ phi.alt \( r \) = sqrt(1 - r^2 \/ 2) \, wide \( 1 \/ r - r \/ 2 \) d'_0 + d_0 \/ 2 = -
  phi.alt'' \/ phi.alt' ""^2 \, wide d_0 \( r_0 \) = 0 \, $

 and write $d_0 = 2 log r + d_(*) + O \( r^2 \( 1 + \| log r \| \) \)$. With
$ Z_(*) = Z + Z^(- 1) { d_(*) - 2 log \( Z \/ 2 \) } \, $

 one has
#[#set math.equation(numbering: n => "(6.19)")
 $ Z_(*)^2 = - 1 / beta - 8 log Z_0 + frac(c_2 \( b \, x \), beta^2) + C \( r_0 \) + o \( 1 \) \,
   $ <phase:expansion-eq>]

 where $C \( r_0 \) = 2 + 2 log 2$ for the stated normalization $d_0 \( r_0 \) = 0$ and definition of $Z_(*)$,
   independently of $r_0$. The logarithmic coefficient $- 8$ is the same for every end,
   and the error is uniform on the finite set of adverse ends.
   All logarithms retain their prescribed continuation from the common incoming contours.]
] <phase:expansion>

#proof[
  Write $q_0 = phi.alt \( r_0 \)^2 in \( 0 \, 1 \)$. At the mean section, $z = Z sqrt(q_0)$ and $w = - q_0$.
    Integrate Lemma 40 starting with (6.12). An antiderivative of its explicit right side is
  $ - 2 beta \/ z^2 - 4 beta^2 log z + 2 beta^2 log \( 1 + beta z^2 \) . $
  At $z_1$, the last logarithm is $o \( 1 \)$, since $beta z_1^2 = O \( B^(- 2 epsilon.alt_1) \)$. Consequently
  #[#set math.equation(numbering: n => "(6.20)")
   $ - q_0 / z^2 = beta - frac(2 beta, z^2) + c_2 - 4 beta^2 log z + 2 beta^2 log \( 1 + beta z^2 \) +
     o \( B^(- 4) \) . $ <phase:section-equation>]
  The preliminary estimate gives $Z \/ Z_0 = 1 + O \( B^(- 1.8) \)$.
    Equation (6.20) first improves this to $Z^2 - Z_0^2 = O \( 1 + log B \)$:
    its left side plus $- beta$ has size $O \( B^(- 4) \( 1 + log B \) \)$,
    and its derivative with respect to $Z^2$ has size comparable to $B^(- 4)$.
    Thus all subsequent Taylor errors are $o \( B^(- 4) \)$ in that equation.
    Writing $Z^2 = - 1 \/ beta + Delta$, expansion gives
  #[#set math.equation(numbering: n => "(6.21)")
   $ Delta = - 4 log Z_0 + c_2 / beta^2 + 2 / q_0 - 2 log q_0 + 2 log \( 1 - q_0 \) + o \( 1 \) . $ <phase:Z-phase>]
  All the displayed constants apart from $c_2 \/ beta^2$ are real.
  For completeness the equation for $d_0$ simplifies exactly to
  #[#set math.equation(numbering: n => "(6.22)")
   $ \( d_0 \/ phi.alt \)' = frac(2, r phi.alt^4) . $ <phase:d0>]
  Its real initial value at $r_0$ therefore gives a real $d_(*)$ and the stated logarithmic expansion.
    Squaring the definition of $Z_(*)$ adds $2 d_(*) - 4 log \( Z \/ 2 \) + o \( 1 \)$;
    the square of the correction is $O \( B^(- 2) \( 1 + log B \)^2 \) = o \( 1 \)$.
    Since $log Z - log Z_0 = o \( 1 \)$, combining this with (6.21) gives (6.19), with
  $ C \( r_0 \) = 2 / q_0 - 2 log q_0 + 2 log \( 1 - q_0 \) + 2 d_(*) + 4 log 2 . $
  The matching-radius constant can also be evaluated explicitly.
    For $q = 1 - r^2 \/ 2$ on the positive real interval, put
  $ F \( q \) = 1 / q - log q + log \( 1 - q \) . $
  Since $d q = - r thin d r$ and $r^2 = 2 \( 1 - q \)$,
  $ frac(2 thin d r, r phi.alt \( r \)^4) = - frac(d q, q^2 \( 1 - q \)) = d F \( q \) . $
  Consequently the initial condition $d_0 \( r_0 \) = 0$ gives
  $ d_0 \( r \) = sqrt(q) thin \[ F \( q \) - F \( q_0 \) \] \, wide q_0 = 1 - r_0^2 \/ 2 . $
  As $r arrow.b 0$, $F \( q \) = 2 log r + 1 - log 2 + O \( r^2 \)$, whence
  $ d_(*) = 1 - log 2 - F \( q_0 \) = 1 - log 2 - 1 / q_0 + log q_0 - log \( 1 - q_0 \) . $
  Thus the constant in (6.19) is independent of $r_0$:
  $ C \( r_0 \) = 2 F \( q_0 \) + 2 d_(*) + 4 log 2 = 2 + 2 log 2 . $
  All logarithms here have positive real arguments. Their prescribed continuation agrees with the incoming
    branches already used in the phase calculation, so this simplification introduces no additional phase.
  The chosen branches agree by continuation along the common incoming part of the contours.
    No $2 pi i$ ambiguity is inserted when an end is compared with another having the same leading opening. ◻
]

#thm([Theorem 6.5.])[
  (Exclusion of a critical opening arc).  #emph[Every real formal arc $\( b \( s \) \, x \( s \) \)$ through the
    origin satisfying $nabla cal(F) \( b \( s \) \, x \( s \) \) = 0$,
    where $cal(F)$ is the formal Gaussian action of 13, has $x equiv 0$.]
] <phase:no-arc>

#proof[
  Suppose instead that $x = s^k v + O \( s^(k + 1) \)$, $v eq.not 0$.
    The invertible first-jet opening map has at least one nonzero leading coefficient
  $ beta_j = c_j s^k + O \( s^(k + 1) \) \, wide c_j in bb(R) . $
  If a $c_j$ is negative, start at the positive $s$ ray. If all nonzero $c_j$ are positive,
    start at the ray $arg s = pi \/ k$. This choice also applies when $k$ is even:
    it is a continuation on the chosen sheet of $s$, and does not require replacing a real parameter by its
    negative. Lemma 17 and Proposition 31 give both lateral arrays and common parameters in an open range of
    nearby test angles. Their common parameters have the same real formal jet, to any prescribed finite order,
    as the formal implicit substitution used there. The two continuations need not be complex conjugates.
  We make precise the reality information retained by actual substitution.
    For any fixed required order, choose the polynomial center and implicit orders high enough that the actual
    common parameters agree with their real formal expansion to an error of that order.
    To expand $- 1 \/ beta_j$ through its constant term it suffices to know $beta_j$ through order $2 k$,
    with remainder $o \( s^(2 k) \)$. The array expansion provides this and more.
    If $c_(2 \, j) \( b \, x \) = Q_j \( x \) + o \( \| x \|^2 \)$ at $b = 0$, then on any of the fixed complex rays
  #[#set math.equation(numbering: n => "(6.23)")
   $ frac(c_(2 \, j) \( b \, x \), beta_j^2) arrow.r frac(Q_j \( v \), c_j^2) in bb(R) . $ <phase:real-ratio>]
  The identical factor $s^(2 k)$ cancels. In particular, leading reality of the opening after ray rotation is not
    being used to assert reality of its unknown subleading values.
  Let $P_j \( s \)$ be the negative-power principal part of the Laurent series $- 1 \/ beta_j$.
    All its coefficients, including the separate constant coefficient of that Laurent series, are real.
    For each pair with $P_i eq.not P_j$, let $a s^(- m)$ be the first nonzero term of their difference.
    On $s = rho e^(i theta.alt)$ its real part is $a rho^(- m) cos \( m theta.alt \)$.
    Only finitely many angles in a small interval are excluded by its vanishing.
    Choose one fixed angle avoiding all of them, within the strict contour and accuracy margins.
    Different principal parts then separate by a divergent power in real part.
    The terms $O \( log B \)$ in (6.19) cannot offset this separation.
    Hence the dominant end contributions form one class with identical $P_j$.
  Choose a representative $j_0$ of this class. Identical principal parts imply identical leading $c_j$,
    and thus $Z_(0 \, j) \/ Z_(0 \, j_0) arrow.r 1$ on the same branches.
    By (6.19), (6.23), and the real Laurent constants,
  $ Z_(* \, j)^2 - Z_(* \, j_0)^2 arrow.r d_j in bb(R) \, wide Z_(* \, j)^(- 2) / Z_(* \, j_0)^(- 2) arrow.r 1 . $
  It follows that
  #[#set math.equation(numbering: n => "(6.24)")
   $ frac(Z_(* \, j)^(- 2) e^(- Z_(* \, j)^2 \/ 4), Z_(* \, j_0)^(- 2) e^(- Z_(* \, j_0)^2 \/ 4)) arrow.r
     e^(- d_j \/ 4) > 0 . $ <phase:positive-ratios>]
  Thus no cancellation is possible within the dominant class.
    Ends in other classes have ratios tending to zero exponentially in a positive power of $rho^(- 1)$.
  The sign and phase of the coefficient multiplying each contribution also agree.
    Proposition 32 uses the branch of the area element continued from positive real area and the outward
    integration convention on each end; its boundary momentum calculation gives the same nonzero constant for the
    same order of the two lateral bypasses. For ends with a tied dominant principal part the opening pole is
    crossed on the same side, so the two labels are ordered alike.
    An ambient axis orientation or a choice of normal cannot reverse one term independently.
    Consequently that proposition and (6.24) give
  #[#set math.equation(numbering: n => "(6.25)")
   $ G_(+) - G_(-) = C_(upright("St")) Z_(* \, j_0)^(- 2) e^(- Z_(* \, j_0)^2 \/ 4)
     (sum_(j med upright("dominant")) e^(- d_j \/ 4) + o \( 1 \)) \, wide
     C_(upright("St")) eq.not 0 . $ <phase:nonzero-jump>]
  Here the error is justified in the specified order: choose the exterior translator cutoff $Y_0$ sufficiently
    large that its relative error is smaller than a fixed fraction of the positive sum,
    and then take $B$ sufficiently large. Equivalently the two-limit error in Proposition 32 yields the lower
    bound in (6.25); an interchange of the two limits is unnecessary.
  Finally retain the leading action scale from (4.2), namely
  $ A_(upright("lead")) \( s \) = min_(upright("adverse") med j) frac(\| \( - c_j s^k \)^(- 1 \/ 2) \|^2, 4) . $
  The actual poles in (6.19) satisfy
  $ frac(Z_(0 \, j)^2, \( - c_j s^k \)^(- 1)) = 1 + o \( 1 \) $
  uniformly on the finite adverse list. After the fixed generic angle is chosen sufficiently close to the initial
    ray, one adverse end $j_1$ satisfies
  $ frac("Re" \( - c_(j_1) s^k \)^(- 1), 4) lt.eq 1.05 A_(upright("lead")) . $
  By the choice of the dominant class, $"Re" Z_(* \, j_0)^2 lt.eq "Re" Z_(* \, j_1)^2 + o \( B^2 \)$.
    The pole comparison above and (6.19) therefore give
  $ frac("Re" Z_(* \, j_0)^2, 4) lt.eq \( 1.05 + o \( 1 \) \) A_(upright("lead")) . $
  Moreover $\| Z_(* \, j_0) \| asymp B$, and the positive sum in (6.25) is bounded away from zero.
    Its fixed nonzero coefficient and inverse-square prefactor change the logarithm of the lower bound by only
    $O \( log B \) = o \( A_(upright("lead")) \)$. For all sufficiently small $s$ on the chosen ray,
    that lower bound is consequently
  $ \| G_(+) - G_(-) \| gt.eq e^(- 1.10 A_(upright("lead"))) . $
  This is incompatible with
  $ \| G_(+) - G_(-) \| = O \( e^(- 1.2 A_(upright("lead"))) \) $
  from Proposition 31. The contradiction excludes the assumed arc. ◻
]

== 7 The finite-jet obstruction <sec:finite-jet>

We now convert the exclusion of a formal critical arc into a finite analytic estimate.
  This step uses an established formal real Nullstellensatz and ordinary analytic approximation,
  each in finitely many variables.

Let $\( b \, x \)$ be the stationary coordinates of 13, and write the formal action as

$ cal(F) \( b \, x \) in bb(R) { b } \[ \[ x \] \] . $

It is a formal series in the opening variables $x$, with coefficients convergent in $b$.
  For $N gt.eq 0$, let $f_N$ denote its Taylor polynomial through total $x$-degree $N$.
  Gradients below include both the $b$ and $x$ coordinates.

#thm([Lemma 7.1.])[
  (Finite-power estimate).  #emph[There is an integer $m gt.eq 1$ such that,
    for every sufficiently large fixed $N$, there are a neighborhood of $\( 0 \, 0 \)$ and a constant $C_N$ for which
#[#set math.equation(numbering: n => "(7.1)")
 $ \| x \|^m lt.eq C_N #scale(x: 120%, y: 120%)[\(] \| nabla f_N \( b \, x \) \| + \| x \|^(N - 1)
   #scale(x: 120%, y: 120%)[\)] $ <jet:inequality>]

 for real $\( b \, x \)$ in that neighborhood. The exponent $m$ is independent of $N$.
   If there are no cylindrical ends, there are no $x$ variables and the assertion is vacuous.]
] <jet:finite-power>

#proof[
  Regard $cal(F)$ as an element of the formal ring $bb(R) \[ \[ b \, x \] \]$,
    and let $I$ be the ideal generated by its finitely many first partial derivatives.
    By 42, every formal arc through the origin on which $I$ vanishes has $x = 0$.
    The formal real arc criterion of Aschenbrenner–Srhir #cite(label("AS2024")) Corollary 4.8 therefore puts each
    $x_i$ in the real radical of $I$. In particular, there are integers $m_i gt.eq
    1$ and formal series $h_(i nu) \, a_(i ell)$ such that
  #[#set math.equation(numbering: n => "(7.2)")
   $ x_i^(2 m_i) + sum_nu h_(i nu) \( b \, x \)^2 = sum_ell a_(i ell) \( b \, x \) thin partial_ell
     cal(F) \( b \, x \) . $ <jet:certificate>]
  All sums in (7.2) are finite. These certificates, and hence the integers $m_i$, are chosen once.
  Fix $N > 2 max_i m_i + 1$ and reduce (7.2) modulo the ideal $\( x \)^(N - 1)$.
    Only finitely many coefficients in $x$ of the unknown series occur.
    They are formal functions of the same variables $b$. The coefficients of $cal(F)$ which occur are convergent
    functions of $b$, so coefficient comparison gives a finite system of convergent analytic equations in $b$ and
    those finitely many unknown functions. The formal coefficients of (7.2) solve that system.
    After translating their constant terms to the origin, Artin’s analytic approximation theorem
    #cite(label("Artin1968")) Theorem 1.2 gives convergent coefficient functions solving it exactly.
    No nested approximation requirement is imposed, and the infinite $x$-series is not being approximated all at once.
  Let $H_(i nu)$ and $A_(i ell)$ be the resulting polynomials in $x$ with convergent coefficients in $b$.
    Replacing the gradient of $cal(F)$ by that of $f_N$ changes nothing modulo $\( x \)^(N - 1)$.
    Consequently, for convergent real functions near the origin,
  #[#set math.equation(numbering: n => "(7.3)")
   $ x_i^(2 m_i) + sum_nu H_(i nu) \( b \, x \)^2 = sum_ell A_(i ell) \( b \, x \) thin partial_ell
     f_N \( b \, x \) + O_N \( \| x \|^(N - 1) \) . $ <jet:analytic-certificate>]
  The remainder estimate is uniform for $b$ in a sufficiently small fixed neighborhood:
    every monomial in its finite polynomial expression has $x$-degree at least $N - 1$,
    and its coefficient is bounded there. Evaluation at real points makes the sum of squares nonnegative,
    and the coefficients $A_(i ell)$ are bounded. Thus
  $ \| x_i \|^(2 m_i) lt.eq C_N #scale(x: 120%, y: 120%)[\(] \| nabla f_N \| + \| x \|^(N - 1)
    #scale(x: 120%, y: 120%)[\)] . $
  Set $m = 2 max_i m_i$. For $\| x \| lt.eq 1$, each $\| x_i \|^m lt.eq \| x_i \|^(2 m_i)$;
    summing and using equivalence of finite-dimensional norms proves (7.1). ◻
]

The order of choices in 43 matters. The radical certificates fix $m$ first.
  One then chooses a single sufficiently large $N$ and applies the ordinary analytic gradient inequality to that
  one function $f_N$. The spatial localization loss may subsequently tend to zero without changing the gradient
  exponent. This is the order used in 9.

== 8 A localized gradient inequality <sec:localized>

We now work over the reals. The two inputs from the stationary argument are the analytic normalized family and its
  polynomial jets in Proposition 13, and the finite-power estimate in Lemma 43.
  The latter is used at one fixed Taylor order. No convergence of the series in the opening variables is needed in
  this section.

If there are no cylindrical opening variables, use $f = F \( S_b \)$ and $T_N = S_b$,
  omit the vacuous finite-power step and the opening-dependent cutoff, and take $gamma = 1$.
  For the otherwise unused order notation one may take $m = 1$ and $N gt.eq 6$.
  Keep the actual-graph cutoff and the compact-source terms in the localized comparison;
  the subsequent flow argument is unchanged.

Translate the singular spacetime point to $\( 0 \, 0 \)$, and write the original flow at negative times as $M_t$.
  Its rescaling is

#[#set math.equation(numbering: n => "(8.1)")
 $ M \( tau \) = e^(tau \/ 2) M_(- e^(- tau)) \, wide Phi = upright(bold(H)) + 1 / 2 X^perp \, wide
   d \( tau \)^2 = integral_(M \( tau \)) \| Phi \|^2 e^(- \| X \|^2 \/ 4) thin d mu . $ <flow:rescaling>]

We omit the constant Gaussian normalization, consistently with the stationary sections.
  Let $S$ be the time-minus-one section of the tangent chosen in Proposition 3.
  In particular $S$ is smooth, properly embedded, of multiplicity one,
  and has the stated finite collection of conical and round cylindrical ends.
  The same proposition supplies smooth convergence on compact subsets along the chosen tangent sequence and a
  constant $Lambda$ such that every rescaled slice under consideration satisfies

#[#set math.equation(numbering: n => "(8.2)")
 $ cal(H)^2 \( M \( tau \) ∩ B_r \( y \) \) lt.eq Lambda r^2 quad \( y in bb(R)^3 \, med r > 0 \) .
   $ <flow:area-ratios>]

All constants below may depend on $S$ and $Lambda$.

Huisken’s monotonicity formula #cite(label("Huisken1990")) gives

#[#set math.equation(numbering: n => "(8.3)")
 $ cal(E) \( tau \) := F \( M \( tau \) \) - F \( S \) gt.eq 0 \, wide cal(E)' \( tau \) = - d \( tau \)^2 \, wide
   cal(E) \( tau \) arrow.r 0 . $ <flow:energy>]

Here the last assertion and the value of the limit require the full Gaussian integral,
  rather than only convergence on a compact set. Indeed, for every fixed $a > 0$ and fixed integer $k$,
  the area-ratio bound, applied to annuli, gives

#[#set math.equation(numbering: n => "(8.4)")
 $ integral_(M \( tau \) \\ B_R) \( 1 + \| X \| \)^k e^(- a \| X \|^2 \/ 4) thin d mu lt.eq
   C_(a \, k \, xi) e^(- \( a - xi \) R^2 \/ 4) quad \( 0 < xi < a \) . $ <flow:gaussian-tail>]

The estimate is uniform in $tau$, and also holds for the normalized comparison family below.
  It identifies the monotone limit with $F \( S \)$ along the chosen tangent sequence, proving (8.3).

Shrink to a closed parameter neighborhood for $b$ in the family $S_b$, with $S_0 = S$.
  The family has uniform bounded geometry in each fixed derivative order, a positive normal tubular radius,
  and uniform smooth end asymptotics. Its normal shrinker defect is supported in one fixed compact set $K_0$ and
  is a smooth compact source with coefficients $lambda \( b \, 0 \)$.
  End rotations are incorporated in the parametrizations of $S_b$;
  a normal graph over $S_b$ below means physical normal height,
  not displacement from $S$ in a fixed unrotated end chart.
  Compact observations are always those fixed in Lemma 5. Their values determine $\( b \, x \)$ by the fixed
  analytic coordinate map.

For precision, a complete graph on a ball means that the #emph[entire] intersection of the surface with that ball
  is given by the indicated single graph: no further component or sheet is permitted.
  Graph smallness in the weak $C^1$ tolerance means $sup \( \| u \| + \| nabla_(S_b) u \| \) lt.eq
  epsilon_(upright("weak"))$ for its physical normal height $u$;
  “weak” distinguishes this preliminary tolerance from the improved bounds, not a weak topology.
  Graph domains can be specified on the reference surface with a fixed additive margin at their outer boundary.
  Replacing an ambient radius $R$ by $R - C$ only changes a Gaussian estimate below by an arbitrarily small loss
  in its quadratic exponent once $R$ is large.

#thm([Proposition 8.1.])[
  (Localized gradient and opening estimates).  #emph[There are $theta in \( 0 \, 1 \/ 2 \)$ and $gamma >
    0$ with the following property. For every sufficiently small $eta >
    0$ there are a neighborhood of $S$ on the observation core, a weak normal height and slope tolerance,
    and $R_eta \, C_eta < oo$ such that the following holds. Suppose $M$ obeys (8.2),
    its observations lie in that neighborhood, and $M$ is a complete graph with that weak tolerance over $S_b$ to
    radius $R gt.eq R_eta$. Put
#[#set math.equation(numbering: n => "(8.5)")
 $ cal(D) = parallel Phi_M parallel_(L_G^2 \( M \)) + e^(- \( 1 - eta \) R^2 \/ 8) . $ <flow:D>]

 Then
#[#set math.equation(numbering: n => "(8.6)")
 $ \| F \( M \) - F \( S \) \|^(1 - theta) lt.eq C_eta cal(D) \, wide \| x \| lt.eq
   C_eta cal(D)^gamma . $ <flow:localized-conclusions>]

 For each fixed compact reference region $K$, transported to $K_b subset S_b$ by the family charts,
   there are $R_(eta \, K) gt.eq R_eta$ and $C_(eta \, K) < oo$ such that, when $R gt.eq R_(eta \, K)$,
   the normal height $u$ of $M$ satisfies
#[#set math.equation(numbering: n => "(8.7)")
 $ parallel u parallel_(H^2 \( K_b \)) lt.eq C_(eta \, K) \( cal(D) + cal(D)^gamma \) . $ <flow:compact-height>]

 When $cal(D) lt.eq 1$, the right side can be replaced by $C_(eta \, K) cal(D)^gamma$. Also
#[#set math.equation(numbering: n => "(8.8)")
 $ \| lambda \( b \, 0 \) \| lt.eq C_eta \( cal(D) + cal(D)^gamma \) . $ <flow:base-multiplier>]

 The exponents $theta \, gamma$ are independent of $eta$; the neighborhood, tolerance, minimum radius,
   and constants need not be.]
] <flow:localized>

#proof[
  Let $m$ be the fixed exponent in Lemma 43. Choose one integer $N$ for which that lemma applies and $N -
    1 > 4 max { m \, 1 }$. Use the finite action $f_N$, multiplier $lambda_N$,
    and globally cut-off normal Taylor graph $T_N$ from Lemma 15.
    Its height $v_N$ satisfies $parallel v_N parallel_(C^2) lt.eq C_N \| x \|^(1 \/ 2) = o \( 1 \)$,
    including the first two spatial derivatives needed in the coefficient subtraction.
    If there are no opening variables, $v_N = 0$. The normalized equation, observation, action,
    and gradient errors are precisely (3.36)–(3.36).
  Let $u$ be the actual normal height. Its observations define $p = \( b \, x \)$ by $P \( u \) =
    sans(P) \( p \)$, and its multiplier is zero. Apply Lemma 16 with $lambda_U = 0$ and weight $a = 1 +
    delta$ for a small fixed $delta > 0$. Take the outer reference radius to be $R - C$,
    inside the complete graph domain, and the cutoff fraction $theta.alt_(upright("cut")) <
    1$ sufficiently close to one. We continue to write $w = chi_R \( u - v_N \)$ for this cutoff difference.
    Choose $R_eta$ large enough that $chi_R = 1$ on the compact source and observation supports.
    For each prescribed compact reference region $K$, increase $R_(eta \, K)$ so that $chi_R =
    1$ on $K_b$ whenever $R gt.eq R_(eta \, K)$. The reference lemma retains the actual principal coefficients on
    the height difference and uses the displayed $C^2$ smallness only on the Taylor height;
    no actual Hessian bound is part of this application.
  The actual residual is the scalar pullback of $Phi_M$. Its $L_(1 + delta)^2$ norm is at most $C parallel Phi_M
    parallel_(L_G^2 \( M \))$: graph area factors are bounded,
    and the stronger Gaussian absorbs the bounded physical graph displacement,
    using the uniform bound for $Y^perp$ on $S_b$. The annular height and slope are uniformly bounded.
    From the annular norm in Lemma 16, first choose $theta.alt_(upright("cut"))$ close enough to one and then
    enlarge $R_eta$ to obtain the bound $C e^(- \( 1 - eta \) R^2 \/ 8)$,
    assigning strictly smaller losses to the cutoff fraction and the fixed additive radius change.
    This is an $L^2$ norm estimate, which accounts for the denominator $8$. The comparison lemma and (3.36) give
  #[#set math.equation(numbering: n => "(8.9)")
   $ parallel w parallel_(cal(H)_(1 + delta)^2) + \| lambda_N \| lt.eq C \( cal(D) + \| x \|^(N + 1) \) \,
     wide \| nabla f_N \( p \) \| lt.eq C \( cal(D) + \| x \|^N \) . $ <flow:comparison>]
  The finite-power inequality now yields
  $ \| x \|^m lt.eq C \( cal(D) + \| x \|^(N - 1) \) . $
  Shrinking the observation neighborhood absorbs the last term.
    Consequently $\| x \| lt.eq C cal(D)^(1 \/ m)$; if there are no opening variables this step is omitted.
    Our fixed choice of $N$ makes the Taylor errors in (8.9) and (3.36) at most $C cal(D)^4$ when $cal(D) lt.eq
    1$. Hence (8.9) is bounded by $C cal(D)$. On $K_b$, where $chi_R = 1$ once $R gt.eq R_(eta \, K)$,
    the identity $u = w + v_N$ gives the compact $H^2$ conclusion by adding the finite Taylor height,
    whose compact norm is $O \( \| x \| \)$; take $gamma = min { 1 \, 1 \/ m }$, or $gamma = 1$ if $x$ is absent.
    Finally smooth dependence of the finite multiplier jet gives $\| lambda \( b \, 0 \) - lambda_N \| lt.eq
    C \| x \|$, proving (8.8).
  Here is the action estimate, including the weight interpolation.
    The finite-dimensional analytic gradient inequality (see #cite(label("Lojasiewicz1993")) p. 1592 and
    #cite(label("CM2015")) Section 0.2, equation (0.4)) for the single analytic function $f_N$,
    at its critical point $\( 0 \, 0 \)$, supplies $theta_0 in \( 0 \, 1 \/ 2 \]$ with
  #[#set math.equation(numbering: n => "(8.10)")
   $ \| f_N \( b \, x \) - F \( S \) \|^(1 - theta_0) lt.eq C \| nabla f_N \( b \, x \) \| .
     $ <flow:finite-dimensional-gradient>]
  Choose $0 < theta < min { theta_0 \, 1 \/ 2 }$ and then choose $alpha < 1$ close enough to one that $2
    alpha \( 1 - theta \) > 1$. Take $delta > 0$ sufficiently small that
  $ a_(*) := alpha \( 1 + 2 delta \) + \( 1 - alpha \) \/ 2 < 1 . $
  For any of the finitely many polynomial factors in the second variation,
    put $U = \( 1 + \| Y \| \)^k \( \| w \| + \| nabla w \| \)$.
    Polynomial absorption and (8.9) give $integral U^2 e^(- \( 1 + 2 delta \) \| Y \|^2 \/ 4) lt.eq C cal(D)^2$.
    The weak height and slope bounds, polynomial area growth,
    and a #emph[weaker but still integrable] Gaussian give $integral U^2 e^(- \| Y \|^2 \/ 8) lt.eq C$.
    Hölder’s inequality consequently gives
  #[#set math.equation(numbering: n => "(8.11)")
   $ integral U^2 e^(- a_(*) \| Y \|^2 \/ 4) thin d mu_(S_b) lt.eq
     (integral U^2 e^(- \( 1 + 2 delta \) \| Y \|^2 \/ 4))^alpha (integral U^2 e^(- \| Y \|^2 \/ 8))^(1 - alpha)
     lt.eq C cal(D)^(2 alpha) . $ <flow:weighted-interpolation>]
  There is no use of finite unweighted area of $S_b$.
  Integrate the first variation twice along the full graph segment from $v_N$ to $v_N + w$.
    Its first variation at $v_N$ consists of the compact multiplier, of size $O \( cal(D) \)$,
    paired with a compact height of size $O \( cal(D) \)$, and the high-order Taylor residual.
    The second variation of the area integrand involves only $w \, nabla w$, with polynomial position factors;
    its Gaussian on intermediate graphs is bounded by $C e^(- a_(*) \| Y \|^2 \/ 4)$ once tolerances are small.
    Thus (8.11) controls it. The omitted actual and graph tails are bounded, by (8.4),
    by $C e^(- \( 1 - eta \) R^2 \/ 4) lt.eq C cal(D)^2$; cutoff margins are chosen with a strict exponent buffer
    here. Together with (3.36), this proves
  #[#set math.equation(numbering: n => "(8.12)")
   $ \| F \( M \) - f_N \( b \, x \) \| lt.eq C cal(D)^(2 alpha) . $ <flow:action-comparison>]
  Combine (8.10), (8.9), and (8.12). Since $2 alpha \( 1 - theta \) > 1$ and $theta < theta_0$,
    the result is (8.6) for small $cal(D)$. For $cal(D)$ bounded away from zero,
    it follows by increasing the constant, using the area-ratio bound for $F \( M \)$ and the fixed observation
    neighborhood for $x$. All choices of $N$, the analytic function, and $theta \, gamma \, alpha \,
    delta$ preceded the arbitrarily small localization loss $eta$.
    This proves the claimed independence of the exponents. ◻
]

== 9 Propagation and convergence of the rescaled flow <sec:flow>

The localized inequality of 8 controls a single complete graph.
  We now improve such graphs, propagate them for a fixed time,
  and sum the resulting motion with radii chosen from the preceding energy drops.

=== 9.1 Improvement of a graphical slice <improvement-of-a-graphical-slice>

#thm([Lemma 9.1.])[
  (Improvement on a smaller ball).  #emph[Fix a spatial loss $zeta in \( 0 \, 1 \)$.
    Suppose the hypotheses of Proposition 44 hold to radius $R$, and
#[#set math.equation(numbering: n => "(9.1)")
 $ d lt.eq C_0 e^(- R^2 \/ 8) . $ <flow:small-speed>]

 Suppose also that, on each fixed interior fraction of the graphical ball,
   the actual second fundamental form and its derivatives through a sufficiently large fixed order are bounded by
   a fixed polynomial in $R$. Then the physical height and first derivatives over the same $S_b$ tend uniformly to
   zero on $B_(\( 1 - zeta \) R)$ as $R arrow.r oo$. The compact multipliers of $S_b$ tend to zero too.
   All statements are uniform in the fixed parameter neighborhood and in the polynomial geometric bounds.]
] <flow:improvement>

#proof[
  Choose a fixed collar containing the entrances to all ends and lying outside $K_0$,
    where $S_b$ is an exact shrinker. Include this collar and the observation core in a compact reference region
    $K$. Since the conclusion concerns $R arrow.r oo$, increase the lower radius threshold to $R_(eta \, K)$ in
    Proposition 44; its cutoff $chi_R$ is then one on both regions.
    The compact estimate and (8.8) give exponentially small compact error and multiplier.
    Interpolation with the assumed derivatives makes the height and slope exponentially small on the entrance collar.
  We first obtain pointwise control of the forcing on a curtailed ball.
    Fix $epsilon.alt > 0$, and let $q$ have radius at most $\( 1 - epsilon.alt \) R$.
    On a uniform small geometric patch of radius $rho$ around $q$,
    contained in $B_(\( 1 - epsilon.alt \/ 2 \) R)$ for large $R$, (9.1) implies
  #[#set math.equation(numbering: n => "(9.2)")
   $ N_q := parallel Phi parallel_(L^2 \( upright("patch") \)) lt.eq
     C exp (- frac(1 - \( 1 - epsilon.alt \/ 2 \)^2, 8) R^2) . $ <flow:forcing-L2>]
  A bound for $A$ and $nabla A$ gives $parallel nabla Phi parallel_oo lt.eq L_R lt.eq C \( 1 + R \)^k$:
    differentiating $X^perp$ introduces at most one position factor. Put $A_q = \| Phi \( q \) \|$.
    A disk of radius comparable to $min { rho \, A_q \/ \( 2 L_R \) }$ has $\| Phi \| gt.eq A_q \/ 2$.
    The uniform two-dimensional area lower bound on these graphical patches gives
  #[#set math.equation(numbering: n => "(9.3)")
   $ A_q lt.eq C #scale(x: 120%, y: 120%)[\(] L_R^(1 \/ 2) N_q^(1 \/ 2) +
     rho^(- 1) N_q #scale(x: 120%, y: 120%)[\)] . $ <flow:forcing-pointwise>]
  When $L_R = 0$ only the second term is needed. Polynomial factors can be absorbed in a smaller positive
    quadratic exponent. Thus $\| Phi \| lt.eq C e^(- c R^2)$ on the curtailed ball.
    The exponent $1 \/ 8$ in (9.2) is the Gaussian norm exponent;
    replacing it by the energy exponent $1 \/ 4$ would be incorrect.
  Let $u$ be the actual normal height over an exterior portion of $S_b$.
    Its equation, divided by the normal component of the graphical displacement, has the form
  #[#set math.equation(numbering: n => "(9.4)")
   $ cal(L)_u u = f \, wide cal(L)_u = a^(i j) nabla_(i j) + #scale(x: 120%, y: 120%)[\(] - 1 / 2 Y^top +
     frak(b) #scale(x: 120%, y: 120%)[\)] dot.op nabla + c \,\
\| frak(b) \| lt.eq o \( 1 \) \( 1 + \| Y \| \) + C \, wide \| c \| lt.eq C \, wide \| f \| lt.eq
  C \| Phi \| . $ <flow:exterior-scalar>]
  The second-order part is uniformly elliptic and close to the base metric.
    The bounded zeroth-order coefficient deserves verification.
    With the convention $D nu = - A$, the unnormalized graph normal is $nu - \( I - u A \)^(- 1) nabla u$.
    Therefore the support-function term, after this division, is exactly
  #[#set math.equation(numbering: n => "(9.5)")
   $ 1 / 2 (Y dot.op nu + u - Y^top dot.op \( I - u A \)^(- 1) nabla u) . $ <flow:support-transport>]
  Keep its entire transport expression in the first-order part.
    In particular, do not differentiate its coefficient in $u$ and put $\| Y \| thin \| nabla
    u \|$ into a purported bounded potential. In the curvature expression,
    keep the actual coefficients on $nabla^2 u$ and expand the remaining smooth terms about $u = 0$.
    Their coefficients depend on the bounded base geometry and the small first graph variables, and are bounded.
    The base equation vanishes on this annulus. This proves (9.4) with no compact multiplier forcing.
  Write $r = \| Y \|$. Uniformly on the far ends, $\| Y^perp \| lt.eq C$, so $\| nabla r \|^2 = 1 +
    O \( r^(- 2) \)$ and $nabla^2 r = O \( r^(- 1) \)$. After choosing the weak tolerance small,
    a sufficiently large fixed $p$ and a sufficiently small fixed $alpha_0 > 0$ give
  #[#set math.equation(numbering: n => "(9.6)")
   $ cal(L)_u r^p lt.eq - c_1 r^p \, wide cal(L)_u e^(alpha_0 r^2) lt.eq -
     c_2 r^2 e^(alpha_0 r^2) $ <flow:supersolutions>]
  past a fixed entrance. For the first inequality the leading coefficient is $- p \/ 2 + c + o \( p \) +
    O \( p^2 \/ r^2 \)$; for the second it is $\( 4 alpha_0^2 \( 1 + o \( 1 \) \) - alpha_0 + o \( alpha_0 \) \)
    r^2 + O \( 1 \)$. Take, for example, $alpha_0 < 1 \/ 4$ with a strict margin,
    then decrease the graph tolerance and enlarge the entrance.
    The comparison principle applies despite the possible positivity of $c$:
    dividing a tested function by the positive supersolution $r^p$ gives a strictly negative zeroth-order coefficient.
  On an annulus whose outer radius is $R_1 = \( 1 - epsilon.alt \) R$, inner data and $f$ are exponentially small,
    while outer data are bounded by the weak height tolerance. The function
  $ V \( Y \) = C e^(- c R^2) r^p + C epsilon_(upright("weak")) e^(alpha_0 \( r^2 - R_1^2 \)) $
  can, by increasing its first constant, be arranged to dominate $\|
    u \|$ on the two boundaries and to satisfy $cal(L)_u V lt.eq - \| f \|$.
    Applying comparison to $V - u$ and $V + u$ gives $\| u \| lt.eq V$.
    A further fixed fractional curtailment makes the second summand exponentially small.
    The first stays exponentially small after multiplication by its fixed polynomial.
    Interpolation with the available derivative bounds gives the same conclusion for $nabla u$.
    Allocate the two curtailments and the small collar margins inside the prescribed $zeta$. ◻
]

=== 9.2 Finite propagation of the complete graph <finite-propagation-of-the-complete-graph>

We record carefully the local result used for propagation.
  In a splitting $bb(R)^(n + k) = bb(R)^n times bb(R)^k$, write $C_r \( x \)$ for the cylinder with both
  horizontal and vertical radii $r$, centered at $x$. The graphical pseudolocality theorem of
  Ilmanen–Neves–Schulze #cite(label("INS2019")) Theorem 1.5 states:
  for a smooth embedded mean curvature flow with area ratios bounded by $D$, and every $upsilon > 0$,
  there are $epsilon \, delta > 0$, depending only on $n \, k \, D \, upsilon$,
  such that if $x in M_0$ and the #emph[whole] intersection $M_0 ∩
  C_r \( x \)$ is the graph over the horizontal radius-$r$ ball of a function with Lipschitz constant less than
  $epsilon$, then $M_t ∩ C_(delta r) \( x \)$ is a graph on the full horizontal ball,
  with Lipschitz constant less than $upsilon$ and height at most $upsilon delta r$, for $0 lt.eq
  t < delta^2 r^2$ while the flow exists. The statement at general $r$ follows by parabolic scaling.
  We use it only for $n = 2 \, k = 1$ and smooth closed flows.

The positive-time input is the graphical interior estimate of Ecker–Huisken.
  For a smooth hypersurface flow remaining graphical over a fixed horizontal ball $B_a$ throughout $\[ 0 \, t \]$,
  with compact graphical closure and $\| D f \| lt.eq L$, it gives, for $0 < theta.alt < 1$,

#[#set math.equation(numbering: n => "(9.7)")
 $ sup_(B_(theta.alt a)) \| nabla^m A \|^2 \( dot.op \, t \) lt.eq
   C \( m \, theta.alt \, L \) \( a^(- 2) + t^(- 1) \)^(m + 1) \, wide t > 0 . $ <flow:graphical-smoothing>]

Here $m = 0$ follows from #cite(label("EckerHuisken1991")) Corollary 3.2(ii),
  and higher orders from #cite(label("EckerHuisken1991")) Theorem 3.4 and Corollary 3.5(ii).
  The constant uses the gradient bound throughout the graphical spacetime region and no initial curvature norm.
  INS supplies that region and its gradient bound. We restrict to a smaller horizontal ball whose graphical
  closure is compact and stays away from the vertical cylinder boundary;
  smoothness and closedness of the actual flow ensure this local compactness.
  Thus (9.7) applies after each restart with $t$ measured from that restart.
  In particular, for $t lt.eq c a^2$, $\| A \| lt.eq C t^(- 1 \/ 2)$, and on $t gt.eq
  t_(*) > 0$ it gives every fixed interior derivative bound used below.
  The graph equation implies $\| f_t \| lt.eq sqrt(1 + L^2) \| H \|$,
  so integration gives a uniform height modulus back to time zero.
  Uniform $C^1$ smallness through zero is proved separately below.
  The initial-curvature propagation in #cite(label("INS2019")) Remark 1.6(i) is not needed to supply an initial
  curvature bound. The finite comparison lemma follows by combining these estimates with overlapping graphical
  covers and avoidance.

#thm([Lemma 9.2.])[
  (Uniform finite comparison).  #emph[Fix the closed small parameter neighborhood above, an area-ratio bound,
    $0 < U < 1$, a spatial loss $0 < mu < 1$, and a target weak $C^1$ normal graph tolerance $epsilon_1 > 0$.
    There are $R_0 < oo$ and $epsilon_0 \, ell_0 > 0$ such that the following holds.
    If a smooth closed mean curvature flow $N_t$ has the prescribed area ratios,
    $N_0$ is a complete normal graph of norm at most $epsilon_0$ over $S_b$ to radius $R gt.eq R_0$,
    and $\| lambda \( b \, 0 \) \| lt.eq ell_0$, then for $0 lt.eq t lt.eq
    U$ it is a complete graph of norm at most $epsilon_1$ over
$ S_b \( t \) = sqrt(1 - t) thin S_b $

 in $B_(\( 1 - mu \) R)$, while the smooth flow exists. On every fixed positive-time interval $\[ t_(*) \, U \]$,
   all fixed interior curvature derivative orders are bounded uniformly.
   More precisely, the graph error has a modulus tending to zero as
$ epsilon_0 + \| lambda \( b \, 0 \) \| + R^(- 1) arrow.r 0 \, $

 and after positive time this holds in every fixed derivative order,
   on the same ball with an arbitrarily small further margin.
   The constants are fixed before $R$ or any discrete time index.
   In particular the lemma applies with $U = 1 - e^(- 2)$.]
] <flow:propagation>

#proof[
  The geometric bounds used here follow uniformly from the finite parameter family and its end asymptotics.
    Shrinking factors in $\[ sqrt(1 - U) \, 1 \]$ preserve bounded geometry and a positive tubular radius.
    Although the raw homothetic parametrization has large tangential velocity at a distant point,
    its #emph[normal] velocity is bounded uniformly, since $\| Y^perp \|$ is bounded on $S_b$.
    Thus, after tangential reparametrization, comparison motion costs only a bounded additive spatial buffer on
    $\[ 0 \, U \]$.
  The tubular bound here includes extrinsic separation. On the compact core and its collars,
    proper embeddedness and small smooth variation in the closed parameter family give a common tubular
    neighborhood. On each cylindrical tail the uniformly decaying graph over its rotated round cylinder retains a
    fixed tubular radius. On a conical tail, rescaled compact annuli are small smooth graphs over annuli of an
    embedded cone; the embedded link and its small variations have uniformly separated nonadjacent pieces.
    Scaling back gives a tubular radius bounded below by a fixed multiple of the distance from the origin.
    The separated end links and directions exclude close pairs from distinct tails.
    The remaining transition region is compact. These observations give one $iota > 0$ for the complete family,
    preserved up to a fixed factor by the shrinking motion on $\[ 0 \, U \]$.
    Thus curvature bounds alone are not being used to exclude a second reference sheet from an entrance cylinder.
  We first describe the compactness class of possible comparisons.
    If $b_i$ stays in the closed parameter neighborhood and $lambda \( b_i \, 0 \) arrow.r 0$,
    a subsequence has $b_i arrow.r b_oo$. At bounded observation centers the limit $S_(b_oo)$ is a globally
    stationary shrinker, because its only possible defect was the compact source and its multiplier now vanishes.
    At centers going to infinity down a cylindrical end, translation gives a round cylinder,
    whose radius at time $t$ is $sqrt(2 \( 1 - t \))$. At centers going to infinity down a conical end,
    translation gives a plane, stationary under the limiting motion.
    The smooth end estimates and separation of the finitely many ends give these limits on every fixed ball,
    in all fixed orders; another end cannot enter a bounded translated patch.
    The bounded-center models are complete shrinkers with bounded geometry,
    and all these models have smooth uniformly controlled motions on $\[ 0 \, U \]$.
    No assertion that $b_i arrow.r 0$ has been used.
  Fix a small INS output slope $upsilon < 1 \/ 100$, obtain its entrance constants $epsilon \,
    delta in \( 0 \, 1 \)$, and choose $r < iota \/ 100$ so that every radius-$4
    r$ reference patch is a graph of slope less than $epsilon \/ 4$. Set $s = delta r$.
    Choose $rho < s \/ 100$, then choose $h > 0$ so that
  #[#set math.equation(numbering: n => "(9.8)")
   $ h < s^2 \/ 8 \, wide V h < rho \/ 8 \, wide 4 h < rho^2 \/ 32 \, $ <flow:patch-time>]
  and reference tangent variation during $h$ is small. Here $V$ bounds reference normal speed.
    All choices precede the small initial-error threshold, which in particular is less than $rho \/ 8$.
    The number $J lt.eq ceil.l U \/ h ceil.r + 1$ of slabs is fixed.
  For $y$ on the reference at the start of a slab, center the entrance cylinder at the actual point $x = y +
    u \( y \) nu \( y \)$, with horizontal plane parallel to $T_y S_b$.
    On the larger reference patch, horizontal projection of the initial normal graph is a small $C^1$ perturbation
    of the identity. Its restriction to a larger horizontal disk is injective and, by its boundary margin,
    covers the entire radius-$r$ disk about $x$. Its height stays inside the vertical cylinder.
    Uniform reach excludes a different reference patch; the complete initial graph and the outer data buffer
    exclude any other actual portion. Thus the #emph[whole] entrance intersection satisfies INS.
    Apply it at every such actual center and retain half of each radius-$s$ output cylinder.
  Reserve a fixed additive data buffer, including an extra collar containing these retained cylinders.
    If $p$ in this buffered region satisfies $"dist" \( p \, S_b \( t \) \) gt.eq rho$ at $t lt.eq h$,
    then its distance from the initial reference is at least $rho - V h$.
    Its ball $B_(rho \/ 2) \( p \)$ is initially disjoint from the entire actual surface.
    Avoidance with a shrinking sphere, whose squared radius is $rho^2 \/ 4 - 4 t$,
    excludes $p$ from the actual flow. Every actual point is therefore in the fresh $rho$-tube.
    If $q$ is its nearest reference point, follow the reference normal parametrization back to $y$,
    and choose $x$ as above. Then
  #[#set math.equation(numbering: n => "(9.9)")
   $ \| p - x \| lt.eq \| p - q \| + \| q - y \| + \| y - x \| < rho + V h +
     rho \/ 8 < s \/ 4 . $ <flow:refined-membership>]
  Every actual point consequently lies in an interior retained output.
  Normal projection has exactly one preimage on each reference fiber.
    To prove existence, fix $q$ and its cylinder as above. Write its whole output graph as $z =
    f \( v \)$ on the full horizontal disk $B_s$. Since $\| q - x \| lt.eq V h + rho \/ 8 < rho \/ 4$,
    the disk used next is strictly inside $B_s$. On the disk $B_(s \/ 2) \( q_H \)$,
    the horizontal coordinate $G \( v \)$ of the normal projection of $\( v \, f \( v \) \)$ differs from $v$ by
    at most $rho$, by confinement and reach. Its boundary therefore avoids $q_H$, and the homotopy $v +
    sigma \( G \( v \) - v \)$ has degree one about $q_H$. The projected image contains $q$, proving existence.
    All the disks and their graphical lifts lie in the buffered region.
    For uniqueness, two points on that fiber are in the same retained cylinder by (9.9).
    If their normal parameters differ by $a$, their vertical separation is at least $sqrt(1 - omega^2) \|
    a \|$ and their horizontal separation is at most $omega \| a \|$,
    where $omega lt.double 1$ is the reference normal’s tilt.
    The actual graph instead bounds the vertical separation by $upsilon omega \| a \|$, forcing $a = 0$.
    The same small slopes make normal projection a local diffeomorphism.
    Full-disk coverage thus gives existence, and the slope bound gives uniqueness.
    The local graphs agree on overlaps and cover artificial patch edges.
    Notice that no inequality $upsilon s < rho$ was assumed: avoidance supplies the sharper normal height
    independently of the INS height bound.
  We verify the vanishing error modulus also at elapsed times tending to zero.
    Suppose a sequence with initial graph error, compact multiplier,
    and inverse data radius tending to zero has graph error at least $eta > 0$ at times $t_i$.
    Let $K$ bound reference curvature and $C_0$ the normal-chart conversion constants.
    For the case $t_i arrow.r 0$, make the following #emph[fresh] choices for this target $eta$.
    First choose an arbitrarily small INS output slope $upsilon$, then its constants $epsilon \, delta$.
    Next choose $r lt.eq 1$ below the uniform reach scale so that the reference entrance slope is below
    $epsilon \/ 4$ and its tangent variation $K r$ is as small as required. Put $s = delta r$, choose
  $ rho < min { iota \/ 100 \, s \/ 100 \, upsilon s \/ 100 \, eta \/ \( 100 C_0 \) } \, $
  and only then choose $h_eta > 0$ satisfying (9.8) and making the uniform reference tangent modulus
    $omega_(upright("ref")) \( h_eta \)$ small. Arrange
  $ C_0 #scale(x: 120%, y: 120%)[\(] upsilon + K r + omega_(upright("ref")) \( h_eta \)
    #scale(x: 120%, y: 120%)[\)] < eta \/ 2 . $
  Only after these choices take $i$ large enough that the initial error meets all entrance and $rho \/ 8$ margins,
    the additive buffer lies inside the data region, and $t_i < h_eta$.
  Repeat the shrinking-sphere confinement at this new $rho$, rather than using the earlier, wider tube.
    Equation (9.9) now places every actual point in a refined output cylinder,
    including the purported point of failure. Its height over the reference is less than $rho$,
    and its slope in the normal chart is bounded by
    $C_0 \( upsilon + K r + omega_(upright("ref")) \( h_eta \) \)$.
    Both are smaller than the alleged error threshold. This excludes $t_i arrow.r 0$.
    No relation between $delta$ and $upsilon$ was needed, and no patch radius was chosen as a function of the
    failing time.
  If instead $liminf t_i > 0$, recenter at the points of failure.
    The data domains exhaust, and the complete graphs, area bound,
    and (9.7) give a smooth limiting motion for positive time.
    The integrable curvature-speed bound gives its initial height continuously.
    The limiting comparison is an exact smooth mean curvature flow:
    the base multipliers vanish in the bounded-center limit, and the end limits are the shrinking cylinder or
    stationary plane. We identify these two motions as follows.
  Use a normal-velocity parametrization $F \( y \, t \)$ of the complete comparison,
    and write the limiting flow as $F + u nu$. Its equation in the reference metric has the form
  $ u_t = a^(i j) \( y \, t \, u \, nabla u \) nabla_(i j) u + B \( y \, t \, u \, nabla u \) \, wide
    B \( y \, t \, 0 \, 0 \) = 0 . $
  The principal coefficients are uniformly elliptic and bounded.
    The lower function $B$ has bounded first derivatives in its last arguments,
    since it involves only bounded reference geometry and motion, the small height, and its first derivative.
    Retain the #emph[actual] $a^(i j)$ and linearize only $B$:
  $ B = c u + b^i nabla_i u \, wide \( c \, b \) =
    integral_0^1 \( B_u \, B_(nabla u) \) \( y \, t \, sigma u \, sigma nabla u \) thin d sigma . $
  This gives bounded lower coefficients without multiplying an unknown Hessian by derivatives of $a^(i j)$,
    even near time zero. The exact comparison equation is used in $B \( y \, t \, 0 \, 0 \) = 0$.
    For $psi = 1 + \| F \|^2$, bounded normal speed and reference geometry give $\| partial_t psi \| + \| nabla
    psi \| + \| nabla^2 psi \| lt.eq C psi$. Hence $epsilon.alt e^(C t)
    psi$ is a supersolution for both signs of the bounded height $u$, for one sufficiently large $C$.
    Properness supplies compact exhaustions, and continuous zero initial height supplies their initial data.
    The maximum principle, followed by exhaustion and $epsilon.alt arrow.b 0$, gives $u = 0$.
    Normal parametrization has removed the raw homothetic tangential velocity;
    the needed change of parameters exists on the finite horizon because that tangential field has at most linear
    growth. This contradicts positive-time failure and proves the modulus on the whole first slab.
  On the latter half of a slab, the interior estimates and this identification give smooth closeness to the
    comparison. Its complete normal graph is the #emph[union] of the overlapping outputs.
    A fresh radius-$4 r$ reference patch in the smaller data region is covered by finitely many of their
    interiors, with a number depending only on the fixed ratio $r \/ s$.
    Thus its fresh radius-$r$ entrance cylinder contains the whole actual intersection,
    with the required small entrance slope. Center it at the corresponding actual graph point.
    A single old radius-$s$ output is never asked to contain the new larger entrance cylinder.
  Keep the original coarse $r \, h$ and weak tolerances for these restarts.
    The refined choices above serve only to test the modulus at a slab entrance.
    Finite induction over $J lt.eq ceil.l U \/ h ceil.r + 1$ selects initial and multiplier tolerances so that
    each restart is admissible and its error tends to zero. Every slab consumes a fixed additive buffer $A$ for
    enlarged patches, motion, and the confinement collar. Thus the total loss is at most $J A$,
    independent of the covering cardinality, $R$, and the later discrete index.
    Taking $J A < mu R$ proves the asserted complete graph on $B_(\( 1 - mu \) R)$.
    Positive-time estimates give all fixed derivative bounds and the corresponding smooth error modulus away from
    elapsed time zero. ◻
]

=== 9.3 Delayed radii and summability <delayed-radii-and-summability>

The remaining task is to use the localized inequality for arbitrarily long times.
  The graphical radius cannot be chosen independently at each slice,
  since its next value must be reached by propagation from the previous slice.
  We therefore choose each radius from all preceding energy drops.
  This gives both the propagation recurrence and a summable bound for the accumulated Gaussian errors.

We shift only the origin of the rescaled clock so that the initial time $0$ is a sufficiently late member of the
  chosen tangent sequence. On any prescribed fixed spatial ball and bounded initial time window the flow is then
  as smoothly close to $S$ as desired, and $cal(E) \( 0 \)$ is as small as desired.
  This follows from the smooth multiplicity-one convergence in Proposition 3,
  where the hypotheses of multiplicity-one local regularity are verified.
  The initial window will include two rescaled time units.

Fix a sufficiently large observation ball and a larger fixed collar containing the end entrances used in Lemma 45.
  Let $K$ be the corresponding compact reference region. Bootstrap the condition that the actual flow is a
  complete graph in a small weak $C^1$ neighborhood of $S$ on this ball and collar.
  This makes the observations and the coordinates $\( b \, x \)$ well defined.
  All radius statements in the following induction are made while this core bootstrap holds;
  its closure will be proved below.

Choose $eta \, c$ with $0 < eta < c < theta$, where $theta$ is fixed by Proposition 44.
  Choose a small spatial loss $zeta > 0$, and then choose $Q$ with

#[#set math.equation(numbering: n => "(9.10)")
 $ 1 < Q < \( 1 - 2 zeta \) e^0.4 . $ <flow:Q-choice>]

All graphical tolerances, derivative orders, and the finite propagation horizon $U = 1 - e^(- 2)$ are now fixed.
  Finally choose the minimum radius at least $R_(eta \, K)$,
  so that the observation core and entrance collar lie in the region where $chi_R = 1$,
  and otherwise sufficiently large; then choose $cal(E) \( 0 \)$ sufficiently small.
  This ordering permits all improvements and propagation conclusions to land strictly inside their weak tolerances.

For each unit interval wholly available in the bootstrap put

#[#set math.equation(numbering: n => "(9.11)")
 $ a_j = \( cal(E) \( j \) - cal(E) \( j + 1 \) \)^(1 \/ 2) \, quad r_j = sqrt(8 log \( 1 \/ a_j \)) \,\
R_j = min {Q^j R_(upright("in")) \, min_(0 lt.eq i lt.eq j) Q^(j - i) r_i} . $ <flow:radii>]

Here $r_j = + oo$ if $a_j = 0$; we choose $cal(E) \( 0 \) < 1$ so that all other logarithms are positive. Select a time

#[#set math.equation(numbering: n => "(9.12)")
 $ tau_j in \[ j + 0.2 \, j + 0.4 \] \, wide d \( tau_j \) lt.eq sqrt(5) thin a_j lt.eq
   sqrt(5) thin e^(- R_j^2 \/ 8) \, $ <flow:selected-time>]

by averaging $d^2$ on this subinterval. In the zero case the speed vanishes there and any interior time is
  suitable. The radius definition gives

#[#set math.equation(numbering: n => "(9.13)")
 $ R_(j + 1) = min { Q R_j \, r_(j + 1) } \, wide R_j gt.eq min { R_(upright("in")) \,
   sqrt(8 log \( 1 \/ sqrt(cal(E) \( 0 \)) \)) } . $ <flow:radius-recursion>]

#thm([Lemma 9.3.])[
  (Graphical radius induction).  #emph[On every complete bootstrap interval,
    the hypotheses of Proposition 44 and of Lemma 45 hold at $tau_j$ to radius $R_j$,
    with the harmless outer margins specified above.]
] <flow:radius-induction>

#proof[
  The chosen initial tangent window supplies the assertion for $j = 0$, including the derivative bounds.
    Suppose it holds at $tau_j$. The localized inequality, the multiplier estimate,
    and (9.12) make the core height and compact multiplier small as the minimum radius becomes large.
    Lemma 45 gives as small a height and slope as desired over $S_(b_j)$ to radius $\( 1 - zeta \) R_j$,
    where $b_j = b \( tau_j \)$. In particular this smallness is much stronger than the weak tolerance being propagated.
  Normalize the unrescaled time at this slice to $- 1$. For a rescaled duration $Delta$ the ordinary elapsed time
    is $1 - e^(- Delta)$, and dilation back to the rescaled coordinates has factor $e^(Delta \/ 2)$.
    Consecutive selected times satisfy $0.8 lt.eq tau_(j + 1) - tau_j lt.eq 1.2$.
    Apply Lemma 46, allocating its additional spatial loss within another $zeta R_j$.
    In the rescaled coordinates it yields a complete weak graph relative to the old $S_(b_j)$ to radius at least
  #[#set math.equation(numbering: n => "(9.14)")
   $ \( 1 - 2 zeta \) e^(\( tau_(j + 1) - tau_j \) \/ 2) R_j \, $ <flow:radius-gain>]
  and throughout the intervening times on the corresponding interior regions.
    Its positive-time smoothing supplies the derivative bounds at the next selected slice before any new elliptic
    improvement is invoked. If an arbitrarily small additional outer margin is needed for those bounds,
    reserve it in the strict inequality (9.10).
  It remains to change to the new base $S_(b_(j + 1))$. While the fixed core is a weak graph over $S$,
    the graph equation and Cauchy–Schwarz on the compact support of the observations give
  #[#set math.equation(numbering: n => "(9.15)")
   $ lr(|frac(d, d tau) \( b \( tau \) \, x \( tau \) \)|) lt.eq C d \( tau \) \, wide \| b_(j + 1) - b_j \| lt.eq
     C \( a_j + a_(j + 1) \) . $ <flow:observation-motion>]
  To see the first inequality, the fixed-core normal graph height $v$ satisfies $partial_tau v =
    Phi dot.op nu_M \/ \( nu_S dot.op nu_M \)$; the denominator stays bounded away from zero.
    Each observation is a fixed compact integral of $v$, and the inverse coordinate Jacobian is bounded.
    The second inequality follows by integrating on the portions of $\[ j \, j + 1 \]$ and $\[ j + 1 \, j + 2 \]$
    between the two slices.
  Smooth dependence of the rotations, conical links, and decaying remainders gives a chart-change cost in physical
    height and slope at radius $R$ bounded by $C \( 1 + R \) \| b_(j + 1) - b_j \|$.
    Both adjacent cutoffs in (9.11) are necessary here. Specifically
  $ R_(j + 1) a_j lt.eq Q a_j sqrt(8 log \( 1 \/ a_j \)) \, wide R_(j + 1) a_(j + 1) lt.eq
    a_(j + 1) sqrt(8 log \( 1 \/ a_(j + 1) \)) \, $
  with the products interpreted as zero at $a_i = 0$. These are uniformly small when $sup a_i lt.eq
    sqrt(cal(E) \( 0 \))$ is small. Thus the new-chart graph still lies inside its weak tolerance.
    Equations (9.10), (9.13), and (9.14) place $B_(R_(j + 1))$, with its required margins, in that graph.
    The next localized inequality and improvement can now be used. This proves the induction in the order:
    previous improvement, parabolic propagation and smoothing, chart change, then new elliptic improvement. ◻
]

The lemma and monotonicity, since $tau_j < j + 1$, imply

#[#set math.equation(numbering: n => "(9.16)")
 $ cal(E) \( j + 1 \)^(1 - theta) lt.eq C (a_j + e^(- \( 1 - eta \) R_j^2 \/ 8)) . $ <flow:discrete-gradient>]

The following summation keeps the gradient-scale tail in this exact form.

#thm([Lemma 9.4.])[
  (Uniform finite-prefix length estimate).  #emph[Put
$ p = frac(theta - c, 1 - c) in \( 0 \, 1 \/ 2 \) \, wide kappa = frac(1 - eta, 1 - c) > 1 \, wide q = Q^2 \, wide
  h = kappa \/ 8 . $

 For $cal(E) \( 0 \)$ sufficiently small, every available finite prefix satisfies
#[#set math.equation(numbering: n => "(9.17)")
 $ sum_(j = 0)^n a_j lt.eq 2 #scale(x: 120%, y: 120%)[\(] C cal(E) \( 0 \)^p +
   B \( R_(upright("in")) \) #scale(x: 120%, y: 120%)[\)] \, wide B \( R \) =
   frac(e^(- h R^2), 1 - e^(- h \( q - 1 \) R^2)) . $ <flow:length-bound>]

 In particular the length on complete unit intervals can be made arbitrarily small,
   uniformly in the number of intervals.]
] <flow:finite-length>

#proof[
  Call $j$ good if $e^(- \( 1 - eta \) R_j^2 \/ 8) lt.eq a_j^(1 - c)$, and bad otherwise.
    For a good index with $a_j > 0$, (9.16) and $a_j lt.eq 1$ imply
  $ cal(E) \( j + 1 \)^(1 - p) lt.eq C_1 a_j . $
  Write $u = cal(E) \( j \)$ and $v = cal(E) \( j + 1 \)$. If $v gt.eq u \/ 2 > 0$,
    concavity and the last inequality give
  $ u^p - v^p gt.eq p u^(p - 1) \( u - v \) = p u^(p - 1) a_j^2 gt.eq c_1 a_j . $
  If $v < u \/ 2$, then, since $u lt.eq 1$ and $p < 1 \/ 2$,
  $ u^p - v^p gt.eq \( 1 - 2^(- p) \) u^p gt.eq \( 1 - 2^(- p) \) sqrt(u) gt.eq \( 1 - 2^(- p) \) a_j . $
  Zero terms cause no difficulty. Summing the nonnegative energy differences only over good indices gives
    $sum_(j upright(" good")) a_j lt.eq C cal(E) \( 0 \)^p$ on every prefix.
  At a bad index,
  #[#set math.equation(numbering: n => "(9.18)")
   $ a_j < e^(- h R_j^2) = max {e^(- h q^j R_(upright("in"))^2) \,
     max_(i lt.eq j) a_i^(kappa q^(j - i))} . $ <flow:bad-max>]
  If $0 < a_j < 1$, its own term $a_j^kappa$ is strictly less than $a_j$ and cannot account for this maximum.
    If $a_j = 0$ the following bound is immediate. Thus
  #[#set math.equation(numbering: n => "(9.19)")
   $ a_j lt.eq e^(- h q^j R_(upright("in"))^2) + sum_(i < j) a_i^(kappa q^(j - i)) . $ <flow:bad-convolution>]
  This exclusion of $i = j$ is where $kappa > 1$ is essential.
  Let $delta_0 = sqrt(cal(E) \( 0 \)) < 1$ and
  $ rho \( delta_0 \) = sum_(ell gt.eq 1) delta_0^(kappa q^ell - 1) lt.eq
    frac(delta_0^(kappa q - 1), 1 - delta_0^(kappa \( q - 1 \))) arrow.r 0 . $
  Since every $a_i lt.eq delta_0$, summing (9.19) on a prefix and interchanging the finite nonnegative sums bounds
    its double sum by $rho \( delta_0 \) sum_(i = 0)^n a_i$. Also $sum_(j gt.eq 0) e^(- h q^j R^2) lt.eq
    B \( R \)$, using $q^j gt.eq 1 + j \( q - 1 \)$. Choose $cal(E) \( 0 \)$ so small that $rho \( delta_0 \)
    lt.eq 1 \/ 2$. Absorbing proves (9.17). Finally $integral_j^(j + 1) d thin d tau lt.eq
    a_j$ by (8.3) and Cauchy–Schwarz. ◻
]

=== 9.4 Closing the bootstrap and fixing every negative-time measure <closing-the-bootstrap-and-fixing-every-negative-time-measure>

#thm([Proposition 9.5.])[
  (Fixed-frame convergence and uniqueness).  #emph[The rescaled flow converges smoothly on every fixed compact
    set, at all rescaled times, to $S$ in the original ambient coordinates.
    For the smooth closed embedded surface flow and fixed first singular point of 1,
    every backward tangent flow consequently equals the multiplicity-one homothetic motion $sqrt(- s) thin
    S$ at every negative time $s$.]
] <flow:uniqueness>

#proof[
  Suppose first that the weak core bootstrap has a finite first stopping time $L$.
    Use only intervals $\[ i \, i + 1 \]$ whose right endpoints lie strictly before $L$.
    If $i$ is the last such index, then
  #[#set math.equation(numbering: n => "(9.20)")
   $ i + 1 < L lt.eq i + 2 \, wide tau_i gt.eq i + 0.2 \, wide L - tau_i lt.eq 1.8 < 2 . $ <flow:last-gap>]
  Allowing a completed interval ending at $L$ by continuity only shortens the gap.
    If no such interval is available, the initial tangent-convergence window supplies the graphs and derivatives
    through this prospective stopping time.
  For a last available slice, propagate directly from its improved graph using Lemma 46 over the fixed horizon
    $U = 1 - e^(- 2) < 1$. No subsequent selected slice, localized inequality,
    or future unit energy drop is needed. Even a limiting cylinder retains radius at least $sqrt(2)
    e^(- 1)$ on this horizon, so all patch constants and buffers were fixed with a genuine pre-extinction margin.
    Choose the minimum graphical radius so large that this finite additive buffer leaves the fixed bootstrap ball
    and its surrounding collar strictly inside the propagated domain. This gives graphical coverage there through $L$.
  Uniform derivatives near the last selected time require a preceding positive delay.
    If $i gt.eq 1$, use the propagation from $tau_(i - 1)$ on
  $ \[ tau_i \, min { L \, tau_i + 0.2 } \] \, $
  where the rescaled delay lies in $\[ 0.8 \, 1.4 \]$, and use the propagation from $tau_i$ on
    $\[ tau_i + 0.2 \, L \]$, where it lies in $\[ 0.2 \, 1.8 \]$.
    Both propagations are available on their entire two-unit horizons from the already proved improved graphs;
    the earlier induction’s use of part of a horizon does not shorten it.
    On every completed selected interval $\[ tau_j \, tau_(j + 1) \]$ with $j gt.eq 1$,
    use $tau_(j - 1)$ for the first $0.2$ time units and $tau_j$ thereafter.
    The initial two-unit tangent window supplies the first entrance and the cases $i = 0$ or no complete interval.
    In these covers the ordinary elapsed times are bounded below by $1 - e^(- 0.2)$,
    and the dilation factors are uniformly bounded. Lemma 46 therefore supplies uniform interior curvature
    derivatives on the fixed ball and collar. The weak fixed-core graph and the bounded geometry of $S$ convert
    these geometric estimates to uniform derivatives of its normal height, as needed for interpolation below.
    This uses only known selected slices and no future energy drop.
    The complete graphical coverage also excludes an entering extra sheet or a loss at the boundary of the
    observation domain at the stopping time.
  The length through completed intervals is bounded by Lemma 48.
    The entire remaining segment from the last selected slice costs at most
  #[#set math.equation(numbering: n => "(9.21)")
   $ integral_(tau_i)^L d \( tau \) thin d tau lt.eq sqrt(2)
     (integral_(tau_i)^L d \( tau \)^2 thin d tau)^(1 \/ 2) lt.eq
     sqrt(2) cal(E) \( 0 \)^(1 \/ 2) . $ <flow:last-length>]
  Counting part of a complete interval twice only weakens this upper bound.
    The initial-window case has the same estimate with its bounded duration.
    The graph-speed formula used in (9.15) therefore bounds the change of the fixed-core graph in $L^2$ by
  $ C #scale(x: 120%, y: 120%)[\(] cal(E) \( 0 \)^p + B \( R_(upright("in")) \) +
    cal(E) \( 0 \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $
  The initial graph can be chosen much closer to $S$ than the bootstrap tolerance.
    Interpolation with the uniform interior derivatives on the larger collar makes the resulting $C^1$ distance
    strictly smaller than that tolerance through $L$. The already established coverage and these strict estimates
    extend the bootstrap past $L$, a contradiction. This proves that the bootstrap and the radius induction hold
    for all time.
  Letting the prefix tend to infinity in (9.17) gives
  #[#set math.equation(numbering: n => "(9.22)")
   $ integral_0^oo d \( tau \) thin d tau < oo \, wide sum_(j gt.eq 0) a_j < oo . $ <flow:finite-total-length>]
  On the fixed observation core the graph functions are Cauchy in $L^2$,
    and the uniform derivative bounds make them converge smoothly on a slightly smaller core.
    Their limit is $S$, because the original tangent sequence still has a subsequence at arbitrarily large
    rescaled times and converges there to $S$. In particular (9.15) gives $\( b_j \, x_j \)
    arrow.r \( 0 \, 0 \)$ in the fixed compact observation chart.
  The radii actually diverge. Since $a_i arrow.r 0$, their logarithmic cutoffs $r_i$ tend to infinity.
    Given $H < oo$, choose $I$ such that $r_i gt.eq H$ for $i gt.eq I$.
    Every recent term $Q^(j - i) r_i$, $I lt.eq i lt.eq j$, is then at least $H$;
    each of the finitely many earlier terms and $Q^j R_(upright("in"))$ eventually exceeds $H$.
    Taking the minimum in (9.11) proves $R_j arrow.r oo$.
  The improved graphs at $tau_j$ thus have height and slope tending to zero on every fixed compact subset of
    $S_(b_j)$. Their base compact multipliers tend to zero by (8.8).
    Apply the error-modulus version of Lemma 46 on every interval $\[ tau_j \, tau_(j + 1) \]$.
    In the rescaled coordinates its homothetic comparison is exactly the fixed set $S_(b_j)$,
    because the comparison shrinkage is canceled by the rescaling.
    Since $b_j arrow.r 0$, the actual graphs converge to $S$ at #emph[every intermediate time],
    uniformly on each compact spatial set. The higher derivative upgrade always uses a preceding slice with
    positive delay. For $tau in \[ tau_j \, tau_(j + 1) \]$, use the slice $tau_j$ if $tau - tau_j gt.eq 0.2$,
    giving rescaled delay in $\[ 0.2 \, 1.2 \]$. If $0 lt.eq tau - tau_j < 0.2$, use $tau_(j - 1)$,
    giving delay in $\[ 0.8 \, 1.4 \]$. Both delays are bounded below by $0.2$ and above by the fixed horizon $2$,
    and therefore their ordinary elapsed times are bounded below by $1 - e^(- 0.2) > 0$ and above by $1 -
    e^(- 2) < 1$. The dilation factors are uniformly bounded.
    Since the preceding graphical radii tend to infinity, every fixed compact set and its interior margin are
    eventually contained in these propagated domains. Equation (9.7) supplies uniform bounds in every fixed
    derivative order there; interpolation with the established $C^1$ convergence gives smooth convergence,
    including at each selected endpoint. No curvature estimate at zero elapsed time is used.
    Thus convergence holds in the original ambient frame at every rescaled time.
  Restore the original, unshifted rescaled clock. For every $s <
    0$ and every admissible $lambda$ there is the exact identity
  #[#set math.equation(numbering: n => "(9.23)")
   $ M_s^lambda = sqrt(- s) thin M #scale(x: 120%, y: 120%)[\(] 2 log lambda -
     log \( - s \) #scale(x: 120%, y: 120%)[\)] . $ <flow:negative-time-identity>]
  The rescaled times on the right tend to infinity, uniformly for $s$ in any compact interval $\[ - B \, - b \]
    subset \( - oo \, 0 \)$. Consequently the full family of actual surfaces on the left converges locally
    smoothly and with multiplicity one to $sqrt(- s) thin S$.
    Smooth complete graphical convergence gives both local area-measure and varifold convergence for every
    individual $s < 0$. The identity uses only the original fixed center and scalar dilation,
    so it preserves the axes and all ambient positions. This proves the asserted smooth convergence.
    To pass from convergence of the actual slices to every slice of a weak representative,
    we use the all-endpoint convention and the weak-limit premise specified below. ◻
]

#proof[
  #emph[Completion of the proof of Proposition 49.] Here is the precise weak-limit premise sufficient for the
    representative assertion. Write $mu_s^lambda = cal(H)^2 #h(-0.16667em) corner.l.b M_s^lambda$.
    A tangent Radon family $\( mu_s \)_(s < 0)$ is assumed to satisfy the local hypotheses and the all-endpoint
    inequality of Lemma 2, and along its extracted scales $lambda_i arrow.r oo$ to satisfy
  #[#set math.equation(numbering: n => "(9.24)")
   $ integral #h(-0.16667em) #h(-0.16667em) integral psi \( X \, s \) thin d mu_s^(lambda_i) \( X \) thin d s
     arrow.r integral #h(-0.16667em) #h(-0.16667em) integral psi \( X \, s \) thin d mu_s \( X \) thin d s quad
     #scale(x: 120%, y: 120%)[\(] psi in C_c \( bb(R)^3 times \( - oo \, 0 \) \) #scale(x: 120%, y: 120%)[\)] .
     $ <flow:spacetime-weight-limit>]
  For each test, the left side is considered once its time support lies in the interval on which the rescaled flow
    is defined. The local mass condition in the lemma makes the right-hand spacetime weight a locally finite Radon
    measure. This is the only weak-limit identification used here.
    Local weak convergence $mu_s^(lambda_i) harpoon.rt mu_s$ for almost every $s$,
    together with a uniform bound for $mu_s^(lambda_i) \( B_R \)$ on each compact time interval and for each fixed
    $R$, also implies (9.24) by dominated convergence.
  The direct smooth convergence already proved shows that the left side of (9.24) converges to $integral
    #h(-0.16667em) #h(-0.16667em) integral psi thin d nu_s thin d s$, with $nu_s =
    cal(H)^2 #h(-0.16667em) corner.l.b \( sqrt(- s) thin S \)$.
    To justify the time integration, place the support of $psi$ in $B_R times
    J$ with $J subset.double \( - oo \, 0 \)$. The scale-invariant area-ratio bound gives
    $mu_s^(lambda_i) \( B_R \) lt.eq Lambda R^2$, so dominated convergence applies to the slice integrals.
    Uniqueness of the local weak Radon limit therefore gives $mu_s thin d s = nu_s thin d s$ as spacetime measures.
  Choose a countable family of compactly supported smooth spatial tests that determines Radon measures,
    for example a family dense on each ball in the uniform norm.
    Test this spacetime equality by the product of each spatial test and an arbitrary compactly supported
    continuous time test. Local integrability implies equality of the corresponding slice integrals almost
    everywhere for each spatial test. Intersecting these countably many full-measure sets and using the
    determining property yields $mu_s = nu_s$ as Radon measures for almost every $s$.
    Lemma 2 now gives this equality for every $s < 0$. The argument applies to every all-endpoint representative
    satisfying (9.24), so no choice of its exceptional slices can change the negative-time measures.
    This proves the representative conclusion under the stated convention. ◻
]

#proof[
  Fix a singular point at the first singular time. The preceding construction applies to its tangent section from
    3, and Proposition 49 gives the full fixed-frame smooth convergence and the equality of every negative-time
    measure under the stated tangent convention. The point was arbitrary. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
