#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 76.5pt, y: 76.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Almost-everywhere regularity of stationary integral varifolds]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A stationary integral varifold is a measure-theoretic minimal surface with integer multiplicity.
  Its tangent plane exists almost everywhere, but a tangent plane alone need not describe an entire neighborhood.
  The basic regularity question is whether the points without a smooth minimal neighborhood can carry positive
  measure. We prove that they have zero $m$-dimensional measure.

Let $m \, n gt.eq 1$, let $U subset bb(R)^(m + n)$ be open, and let $E subset U$ be countably $m$-rectifiable.
  Let $theta : E arrow.r bb(N) \\ { 0 }$ be measurable and locally integrable with respect to $cal(H)^m$. Write

$ mu \( A \) = integral_(E ∩ A) theta thin #h(-0.16667em) d cal(H)^m \, wide P \( x \) = P_(T_x E) . $

The associated integral varifold $V$ is stationary if

#[#set math.equation(numbering: n => "(1.1)")
 $ integral "tr" \( P \( x \) D X \( x \) \) thin #h(-0.16667em) d mu \( x \) = 0 quad
   upright("for every ") X in C_c^1 \( U \; bb(R)^(m + n) \) . $ <eq:stationarity>]

A point $p in "spt" mu ∩ U$ is #emph[regular] if there are a neighborhood $W$ of $p$,
  a smooth embedded minimal $m$-submanifold $Sigma subset W$, and an integer $q gt.eq
  1$ such that the restriction of the varifold to $W$ is $q \| Sigma \|$. The remaining support points form $"Sing" V$.

#thm([Theorem 1.1.])[
  #emph[Every stationary integral $m$-varifold in an open subset of $bb(R)^(m + n)$ satisfies
$ cal(H)^m \( "Sing" V \) = 0 . $

 Here $m \, n gt.eq 1$ are arbitrary. No stability, minimizing, orientability, density upper bound,
   or codimension-one hypothesis is required.]
] <thm:main>

#thm([Corollary 1.2.])[
  (Round spheres).  #emph[Let $m \, n gt.eq 1$ and let $V$ be an integral $m$-varifold on the full unit round
    sphere $S^(m + n)$, stationary for variations tangent to the sphere.
    A support point is regular if on a spherical neighborhood $V = q \| Sigma \|$ for an integer $q gt.eq
    1$ and a smooth embedded minimal $m$-submanifold $Sigma$ of the sphere.
    If $"Sing"_S V$ denotes the remaining support points, then
$ cal(H)_(g_(upright("round")))^m \( "Sing"_S V \) = 0 . $

 No fixed upper bound on mass, density, or multiplicity is required, nor are stability, orientability,
   or mod-two cyclicity. The same conclusion holds on every round sphere of positive radius.]
] <cor:round-spheres>

9 derives this corollary from 1 by a separate cone argument.
  That proof adapts the hypersurface first-variation calculation in #cite(label("OpenAISolomonYau2026")) Lemma 6.1
  and rederives it in the present dimensions.

=== 1.1 Background and significance <background-and-significance>

Allard’s regularity theory gives a relatively open dense regular set and, in particular,
  regularity at density-one points #cite(label("Allard1972"));
  see also #cite(label("Allard1987")) Theorem 23 and #cite(label("Simon2018")) Chapter 5,
  Theorem 6.1 and Corollary 6.3. Higher integer density presents a different issue:
  dividing a varifold by its density at a point need not preserve the almost-everywhere lower density bound
  required by that theorem in a neighborhood. Standard accounts of the first variation, monotonicity,
  and integral varifolds may be found in #cite(label("Simon1983")).

Simon’s 2018 notes already record the question whether the singular set must be $cal(H)^m$-null even when the
  generalized mean curvature is zero #cite(label("Simon2018")) Chapter 5, Remark 6.4.
  The measure-zero singular-set assertion is Conjecture 1.2 of Brena, Decio,
  and De Lellis #cite(label("BDD2025")). 1 proves this conjecture in its full Euclidean scope.
  They isolate a local criterion in Conjecture 1.3: a support point with a unique tangent varifold $Q \| Pi \|$,
  where $Pi$ is an $m$-plane and $Q$ a positive integer, should be regular when the mass of ${ theta eq.not
  Q }$ in a ball of radius $r$ about it is $o \( r^m \)$. They then propose approximating the varifold by a smooth
  minimal graph with the squared-height integral vanishing to every order,
  followed by a unique-continuation step that upgrades this contact to local support containment
  #cite(label("BDD2025")) Conjectures 1.3–1.5. Their analysis of multiplicity and height in flat cylinders also
  provides useful precedents for the local estimates developed here #cite(label("BDD2025")) Theorem 1.9 and Lemma 2.3.

Related progress concerns the differentiability of a countable covering.
  Menne proved second-order rectifiability for integral varifolds of locally bounded first variation
  #cite(label("Menne2013")) Theorem 3.6. For stationary integral varifolds of dimension at least two, Brena,
  De Lellis, and Franceschini proved smooth rectifiability and infinite-order approximation at $mu$-almost every
  point by one smooth graph #cite(label("BDLF2025")) Theorems 1.2 and 1.3.
  The approximating graph in the latter statement is not asserted to be minimal;
  Brena–Decio–De Lellis present this as a weaker form of their approximation conjecture #cite(label("BDD2025"))
  Theorem 1.8. Kolasiński obtains rectifiability of every finite order and an alternative proof of the
  smooth-rectifiability conclusion, following an architecture he credits to Menne #cite(label("Kolasinski2026"))
  Theorem 1.1, Corollary 10.8, and the historical note in Section 1.
  Smooth rectifiability gives a countable smooth covering outside a $mu$-null set;
  1 requires equality with one smooth minimal submanifold throughout a neighborhood of almost every point.

In codimension one, Hirsch and Spolaor prove almost-everywhere regularity for integral currents that are
  stationary as varifolds and have density at most two at every support point #cite(label("HS2025")) Theorem 1.1.
  These current and multiplicity hypotheses distinguish that result from the arbitrary-codimension statement here.

De Lellis, Hirsch, Lihn, and Spolaor construct, in a smooth Riemannian metric,
  a stationary varifold with a double-plane tangent at an exceptional point and topology accumulating there
  #cite(label("DLHLS2026")) Theorem 1.1.#footnote[In their respective disclosures,
  Kolasiński reports using Claude AI and Claude Code, mostly Opus 5;
  the abstract of De Lellis–Hirsch–Lihn–Spolaor credits a crucial suggestion to #raw("gpt-astra-6").
  These attributions follow the cited papers’ own descriptions.]

=== 1.2 The argument <the-argument>

The main estimate compares projected mass and tilt with their leading terms kept signed.
  In product coordinates $bb(R)^m times bb(R)^n$, let $pi$ be projection onto the first factor,
  fix a positive integer $Q$, and let $P_(v v)$ be the vertical block of the tangent projection.
  With lengths and mass normalized to the working radius, define

$ M = pi_(\#) mu - Q thin #h(-0.16667em) d y \, wide D = pi_(\#) \( "tr" P_(v v) thin mu \) . $

Here $\| M \|$ denotes the total variation of the signed measure $M$, and $tau = \| M \| +
  D$ is the positive excess measure in this flat setting. When $tau$ has mass at most $d$ on a fixed enlarged
  ball, we prove an interior bound of the form

#[#set math.equation(numbering: n => "(1.2)")
 $ integral w \( 2 M - D \) lt.eq d exp #h(-0.16667em) [- F_Q #h(-0.16667em) (log 1 / d)] $ <eq:intro-signed>]

for nonnegative Lipschitz weights with fixed bounds. The explicit function $F_Q$ grows faster than every fixed
  power of $log T$ as $T arrow.r oo$. 13 gives the precise statement,
  including the curvature error for a reference surface of sufficiently high finite regularity.
  Retaining the sign permits a substantially smaller error than an absolute-value estimate.

The proof of (1.2) is an induction on $Q$. A heat-potential construction turns a positive violation into a
  positive measure on selected centers and scales. At each selected point it gives an initial sign and a
  nonnegative cumulative integral along larger scales; the selection includes vertical sides of the stopping
  boundary. For configurations whose normal heights separate into groups,
  a stopping argument reduces the estimate to stationary restrictions with smaller integer counts.
  The resulting comparison controls tilt away from the groups.

Along a selected path, we take a supremum of damped signed-mass averages over larger scales and compare it with a
  clipped squared-distance moment from an unordered list of at most $Q$ representative normal heights.
  A weighted combination of this moment and the cumulative contact integral stays below the supremum even when
  representative heights merge. On an interval without a merger,
  this comparison forces a quantitative amount of tilt at many scales.
  Normal stationarity turns that tilt into a flux pairing height displacement with radial tilt.
  A higher height moment prevents all of that flux from concentrating on sets that have small base volume but
  large local excess density. At each selected scale this yields a base cube in which a quantitative fraction of
  the $tau$-mass remains below a density threshold at all smaller dyadic scales.
  Packing these nested cubes shows that the union of their full innermost members has small $tau$-mass.
  A final charge bounds the contact measure by the mass of that union, contradicting the original violation.

For regularity, fix a point where dilated varifolds converge to a multiplicity-$Q$ plane and the mass of other
  multiplicities has relative density zero. At each nearby base point, we fit minimal graphs at successive scales,
  stopping when a prescribed bound on the support height fails.
  The correction of each fit is closely related to the Jacobi regularization and nonlinear correction of Brena–De
  Lellis–Franceschini #cite(label("BDLF2025")) Sections 2 and 6.
  A centered first-moment estimate, combined with elliptic regularity,
  makes neighboring fits agree to second order in their height error.
  The signed estimate is first used in a contradiction argument for a sequence of failed fits normalized by their
  height errors. Together with the limiting first-variation identities,
  its one-sided inequality shows that the limiting squared-height measure is nonzero in every interior subball.
  Strong control of the centered first moment, together with the integer count $Q$,
  then forces that second moment to come from separated projection entries of lower multiplicity on a definite
  portion of each such ball. The regions influenced by failures therefore have vanishing relative volume.

The compatible fits can now be glued into one fixed center of sufficiently high finite regularity.
  The weighted integral of the squared mean curvature and the square of its first derivative is bounded by the
  corresponding squared-height integral. The support height is zero outside the regions influenced by failures.
  Almgren developed the center-manifold approach to higher-multiplicity regularity #cite(label("Almgren2000"));
  De Lellis–Spadaro construct their center by gluing smoothed local averages #cite(label("DLS2016II")).
  For the inward step we use the comparison of height and energy in the frequency method of this program
  #cite(label("DLS2011")) Section 3.4, including its cutoff form on a center manifold #cite(label("DLS2016III"))
  Section 3. The minimizing-current and Dirichlet-minimizing hypotheses in the Almgren–De Lellis–Spadaro
  regularity results are unavailable here, so the needed inequalities are derived from stationarity and the signed
  estimate.

This second use of signed excess takes place at finite radii relative to the fixed center.
  Interior balls retain the leading signed comparison between projected mass and tilt.
  A separate radial test controls the thin outer collar by a small multiple of the tilt in the radial direction.
  It thereby preserves the leading tilt coefficient when the comparison is inserted into the frequency identities.
  The resulting inward comparison supplies height doubling without assuming it initially.
  Along a sequence of radii with controlled frequency, the local mass estimate transfers the vanishing relative
  volume of the failure regions to vanishing relative projected mass.
  A higher height moment then excludes nonzero height carried by those regions.
  The support lies on the center in a neighborhood, and stationarity gives constant multiplicity and makes the
  center a smooth minimal graph.

===== 1.2.1 Organization. <organization.>

2 establishes the first-variation, integer-count, and height estimates.
  3 states the signed-excess theorem and fixes its parameter hierarchy.
  4 constructs the heat contacts and reduces separated configurations to lower multiplicities;
  5 develops the outward comparison and controls mergers; 6 closes the integer induction by packing witness
  scales. 7 constructs the center from minimal fits and multiplicity defects.
  8 derives inward doubling, forces the height to vanish, and proves the Hausdorff-measure conclusion on the
  entire support. 9 proves the round-sphere consequence by the separate cone argument.

=== 1.3 Conventions <conventions>

All estimates are interior and local. Constants may depend on $m \, n$,
  an upper bound for the particular integer count $Q$, and the fixed coordinate geometry.
  They are independent of the small scale and excess unless stated otherwise.
  Fixed changes of concentric radii are allowed when positive interior room is retained.
  A dot denotes differentiation with respect to the logarithm of the radius.
  Every projection count includes the integer multiplicity.
  We distinguish a positive tensor from the measure obtained by multiplying it by $mu$;
  projections of the latter to the base are stated when introduced.
  3 specifies the quantitative hierarchy used in the induction.

== 2 Local first variation and height estimates <sec:local>

We first collect the local estimates used in the signed comparison.
  Their constants depend on the dimensions, an upper bound for the integer under consideration,
  fixed interior enlargement factors, and the indicated bounds for the coordinates.
  Counts in a normal fiber always include integer multiplicity.
  A configuration of size $Q$ is therefore an unordered list of $Q$ vectors, with repetitions allowed.

=== 2.1 First variation and integer counts <first-variation-and-integer-counts>

We begin with the standard stationary monotonicity and mean-value arguments;
  compare #cite(label("Allard1987")) Theorem 9 for monotonicity.
  We include the derivation to retain the lower mass bound at every point of the support.

#thm([Lemma 2.1.])[
  (Monotonicity and mean value).  #emph[Let $V$ be stationary and integral in an open Euclidean set.
    If $p in "spt" mu$ and $overline(upright(bold(B))_r \( p \))$ lies in that set, then
#[#set math.equation(numbering: n => "(2.1)")
 $ mu \( upright(bold(B))_r \( p \) \) gt.eq omega_m r^m . $ <eq:lt-lower-mass>]

 If $u gt.eq 0$ is a $C^2$ ambient function with $"tr" \( P_T D^2 u \) gt.eq
   0$ for $V$-almost every $\( x \, T \)$ in the ball, then
#[#set math.equation(numbering: n => "(2.2)")
 $ u \( p \) lt.eq frac(1, omega_m r^m) integral_(upright(bold(B))_r \( p \)) u thin #h(-0.16667em) d mu .
   $ <eq:lt-mean-value>]

 The same assertion holds for continuous functions satisfying the corresponding weak subharmonicity inequality.]
] <lt:monotonicity>

#proof[
  Put $t = \| x - p \|$ and let $f gt.eq 0$ be a smooth decreasing radial cutoff.
    Testing stationarity with $\( x - p \) f \( t \/ r \)$ and differentiating under the integral gives
  $ frac(#h(-0.16667em) d, #h(-0.16667em) d log r) (r^(- m) integral f \( t \/ r \) thin #h(-0.16667em) d mu) =
    r^(- m) integral frac(- f' \( t \/ r \), r t) \| \( I - P_T \) \( x - p \) \|^2 thin #h(-0.16667em) d mu gt.eq 0 . $
  Approximation of the indicator of $\[ 0 \, 1 \)$ proves ball monotonicity.
    At a point where the rectifiable density is an integer, its limit at zero is at least $omega_m$.
    Such points are dense in the support. Applying the conclusion at points tending to $p$,
    with radii increasing to $r$, proves (2.1) at every support point.
  Stationarity with $phi nabla u$ shows $integral nabla_T u dot.op nabla_T phi thin #h(-0.16667em) d mu lt.eq
    0$ for every nonnegative compactly supported $phi$. The preceding radial calculation,
    with its field multiplied by $u$, has the additional term
  $ r^(- m) integral f \( t \/ r \) nabla_T u dot.op \( x - p \) thin #h(-0.16667em) d mu . $
  It is nonnegative: use the nonnegative radial primitive $phi \( t \) =
    integral_t^oo a f \( a \/ r \) thin #h(-0.16667em) d a$ in the weak inequality.
    Thus $r^(- m) integral_(upright(bold(B))_r \( p \)) u thin #h(-0.16667em) d mu$ is nondecreasing.
    At integer-density points its limit is at least $omega_m u \( p \)$.
    Continuity and the same approximation of the center prove (2.2).
    This argument uses only the weak inequality, and therefore proves the last assertion as well. ◻
]

We use a reference disk $S$ of class $C^J$, where the fixed finite order $J gt.eq
  6$ is chosen sufficiently large for all derivatives below, including the dimension-dependent test order in 6.
  The disk has a fixed normal tube, small graph slope, and bounded coordinate derivatives through order $J$.
  All pulled-back first-variation fields have at least class $C^1$;
  Gaussian smoothing takes place in the base variables. The same fixed derivative order suffices under rescaling
  and throughout the induction. The flat case permits an arbitrary vertical translate.
  Restrict the varifold to a cylinder whose support is separated from its vertical boundary over every compact
  subset of the base. All fields used below have compact base support and are multiplied by a vertical cutoff
  equal to one on that support. Consequently this restriction has no vertical boundary term.
  Fixed enlargements of a working ball are always assumed to remain in this cylinder.

Write a point of the tube as $q = y + z_(upright("phys"))$, where $y =
  pi \( q \) in S$ and $z_(upright("phys")) in N_y S$. The second fundamental form is denoted by $upright("II")$,
  its trace by $H_S$, and its shape operators by

$ chevron.l A_v a \, b chevron.r = chevron.l upright("II") \( a \, b \) \, v chevron.r \, wide J_z = I -
  A_(z_(upright("phys"))) . $

All norms of $H_S$ and $nabla^perp H_S$ below are in the physical Euclidean metric.
  At $q$, decompose the tangent projection $P = P_(T_q V)$ relative to $T_y S xor N_y S$, and set

#[#set math.equation(numbering: n => "(2.3)")
 $ B = I - P_(h h) \, wide e = "tr" B = "tr" P_(v v) \, wide
   lambda = \| z_(upright("phys")) \|^2 + \| H_S \|^2 + \| nabla^perp H_S \|^2 . $ <eq:lt-tensors>]

Thus $B$ is a tensor at $q$, not a measure on the base. It is positive semidefinite, $0 lt.eq e lt.eq m$,
  and the projection identities imply

#[#set math.equation(numbering: n => "(2.4)")
 $ P_(h v) P_(v h) = B - B^2 \, wide \| P_(v h) a \|^2 lt.eq B \[ a \, a \] \, wide \| P_(v h) \| lt.eq
   C sqrt(e) . $ <eq:lt-projection-identities>]

In physical coordinates the measures on the base are

#[#set math.equation(numbering: n => "(2.5)")
 $ nu = pi_(\#) mu \, quad M = nu - Q "vol"_S \, quad D = pi_(\#) \( e mu \) \, quad Lambda =
   pi_(\#) \( lambda mu \) \, quad L = 2 M - D \, quad tau = \| M \| + D + Lambda . $ <eq:lt-measures>]

For a flat reference we set $lambda = 0$ and $Lambda = 0$.
  In particular a constant sheet offset is not charged as a geometric error in that case.

At the center of the original physical chart, normalize the base coordinates so that their metric is Euclidean
  there. For the coordinate immersion $F$, let $g = \( D F \)^top D F$,
  choose the orthonormal horizontal frame $E = D F thin g^(- 1 \/ 2)$ using the positive square root,
  and write $sans(C)_y = g^(1 \/ 2)$; thus $D F thin X = E sans(C)_y X$.
  Choose the normal frame by parallel transport along radial geodesics from the same center.
  This normal frame is the radial gauge for the original chart;
  its regularity and connection bounds follow from the fixed geometry above.
  When a physical base radius $l$ is scaled to one, we use base coordinates $y \/
  l$ and height coordinates $zeta = z_(upright("phys")) \/ l$ in this fixed normal frame.
  The fixed coordinate bounds and the normalization at the center give

$ \| sans(C)_y - I \| + \| D_(y \/ l) sans(C)_y \| + \| D_(y \/ l) E \| lt.eq C l $

throughout the original chart. Measures, including the reference volume,
  are divided by $l^m$ and pushed forward to these coordinates.
  We retain the symbols in (2.5) for the resulting measures.
  The function $lambda$ is still evaluated in physical units;
  it is not replaced by $\| zeta \|^2$ or by rescaled curvature.
  A further coordinate ball of radius $s$ consequently has physical radius $l s$. Define

#[#set math.equation(numbering: n => "(2.6)")
 $ gamma = l + sup \| z_(upright("phys")) \| . $ <eq:lt-small-geometry>]

The reference disks used below have a uniformly small tube, so that $J_z$ and $J_z^(- 1)$ are uniformly bounded.

#thm([Lemma 2.2.])[
  (Curved horizontal first variation).  #emph[For a compactly supported tangent field $X$ on $S$,
#[#set math.equation(numbering: n => "(2.7)")
 $ & lr(|integral "div"_S X thin #h(-0.16667em) d M - integral B : nabla^S X thin #h(-0.16667em) d mu|)\
 & quad lt.eq C integral { \| z_(upright("phys")) \| e \| nabla^S X \| +
   #scale(x: 120%, y: 120%)[\[] \( \| nabla^perp H_S \| + \| z_(upright("phys")) \| \) \| z_(upright("phys")) \| +
   sqrt(e) thin \| z_(upright("phys")) \| #scale(x: 120%, y: 120%)[\]] \| X \| } #h(-0.16667em) d mu .
   $ <eq:lt-curvedvariation>]

 The integrands containing tensors are evaluated at $q$, with the base field pulled back by $pi$.
   In coordinates scaled by $l$, the right side is bounded by
#[#set math.equation(numbering: n => "(2.8)")
 $ C gamma integral \( e + lambda \) \( \| nabla X \| + \| X \| \) thin #h(-0.16667em) d mu . $ <eq:lt-scaledvariation>]

 Here and below a dimensionless scaled test field is used in a scaled identity.]
] <lt:curvedvariation>

#proof[
  The nearest-point derivative is $D pi = J_z^(- 1) P_h$. Lift $X$ to the ambient field $overline(X) \( q \) =
    J_z X \( y \)$. This is the velocity obtained by moving $y$ with velocity $X$ and transporting
    $z_(upright("phys"))$ parallel in the normal connection. Compute at a point in tangent and normal frames whose
    respective connections vanish there. With $K_z \( a \) = \( nabla_a A \)_(z_(upright("phys"))) X$,
    the four blocks of its derivative are
  $ \( D overline(X) \)_(h h) & = J_z \( nabla X \) J_z^(- 1) -
    K_z J_z^(- 1) \, & \( D overline(X) \)_(h v) v & = - A_v X \,\
\( D overline(X) \)_(v h) a & = upright("II") \( J_z^(- 1) a \, J_z X \) \, & \( D overline(X) \)_(v v) & = 0 . $
  The first term of the horizontal block has trace $"div"_S X$. Codazzi in Euclidean space gives
  $ "tr" K_z = chevron.l nabla_X^perp H_S \, z_(upright("phys")) chevron.r . $
  For completeness, Codazzi follows by writing $upright("II")_(i j) = \( partial_i partial_j F \)^perp$ in local
    coordinates and commuting the three derivatives of the immersion;
    at the chosen point the connection terms are precisely those in the covariant derivative.
    Since $K_z = O \( \| z_(upright("phys")) \| \| X \| \)$ and $J_z^(- 1) - I = O \( \| z_(upright("phys")) \| \)$,
  $ "tr" \( D overline(X) \)_(h h) = "div"_S X - chevron.l nabla_X^perp H_S \, z_(upright("phys")) chevron.r +
    O \( \| z_(upright("phys")) \|^2 \| X \| \) . $
  The symmetric sum of the off-diagonal blocks, paired with $a in T_y S$ and $v in N_y S$, is exactly
  $ chevron.l a \, J_z^(- 1) \[ A_(z_(upright("phys"))) \, A_v \] X chevron.r . $
  Indeed it equals $chevron.l a \, \( J_z^(- 1) A_v J_z - A_v \) X chevron.r$.
    Its size is $O \( \| z_(upright("phys")) \| \| a \| \| v \| \| X \| \)$, including in arbitrary codimension.
    Contracting it with $P_(v h)$ costs $C sqrt(e) thin \| z_(upright("phys")) \| \| X \|$ by (2.4).
    Contracting the horizontal block with $I - B$ instead of the identity gives $- B :
    nabla X$ and an error at most $C \| z_(upright("phys")) \| e \( \| nabla X \| + \| X \| \)$.
    Absorb its last summand in the preceding $sqrt(e)$ term. Integrating $P : D overline(X) =
    0$ and using $integral_S "div"_S X thin #h(-0.16667em) d "vol"_S = 0$ proves (2.7).
  After scaling, the coefficients of $\| nabla X \|$ and $\| X \|$ are respectively
  $ \| z_(upright("phys")) \| e \, wide
    l #scale(x: 120%, y: 120%)[\[] \( \| nabla^perp H_S \| + \| z_(upright("phys")) \| \) \|
    z_(upright("phys")) \| + sqrt(e) thin \| z_(upright("phys")) \| #scale(x: 120%, y: 120%)[\]] . $
  Young’s inequality bounds them by $C gamma \( e + lambda \)$. Bounded coordinate changes preserve this estimate. ◻
]

#thm([Lemma 2.3.])[
  (Projection and integer counts).  #emph[The tangential Jacobian of $pi$ is
#[#set math.equation(numbering: n => "(2.9)")
 $ J_pi = frac(sqrt(det P_(h h)), det J_z) \, wide \| J_pi - 1 \| lt.eq C \( e + lambda \) . $ <eq:lt-jacobian>]

 There is a nonnegative integer-valued function $N$ on the base, finite almost everywhere, such that
#[#set math.equation(numbering: n => "(2.10)")
 $ pi_(\#) \( J_pi mu \) = N "vol"_S \, wide \| nu - N "vol"_S \| lt.eq C \( D + Lambda \) . $ <eq:lt-integer-measure>]

 The inequalities are measure inequalities on every relatively compact base set. Moreover, for sufficiently small $e$,
#[#set math.equation(numbering: n => "(2.11)")
 $ 2 \( 1 - J_pi \) - e lt.eq C e^2 + C \( \| z_(upright("phys")) \|^2 + \| H_S \|^2 \) . $ <eq:lt-signed-jacobian>]

]
] <lt:jacobian>

#proof[
  The squared Jacobian of the orthogonal projection of $T$ onto $T_y S$ is $det P_(h h)$.
    Composition with $J_z^(- 1)$ proves the formula. If the eigenvalues of $B$ are $b_i in \[ 0 \, 1 \]$,
    then $1 - sqrt(product_i \( 1 - b_i \)) lt.eq sum_i b_i = e$. Also
  $ det J_z = 1 - chevron.l H_S \, z_(upright("phys")) chevron.r + O \( \| z_(upright("phys")) \|^2 \) . $
  These facts and Young’s inequality prove the bound in (2.9).
    Expanding the square root one order further gives $sqrt(det \( I - B \)) = 1 - e \/ 2 + O \( e^2 \)$,
    which proves (2.11). The rectifiable area formula #cite(label("Simon2018")) Chapter 3,
    equation (2.5) gives the first equality in (2.10), where $N$ counts points of nonzero projection Jacobian with
    their multiplicities. Its second assertion follows by pushing forward $\( 1 - J_pi \) mu$.
    The part on which the projection has deficient rank has $e gt.eq 1$ and is included in this error;
    no absolute-continuity assertion about its pushforward is needed. ◻
]

The next elementary analytic observation explains why a scalar weak-$L^1$ estimate is sufficient here.
  Both its distributional estimate and the integer count are essential.
  Its proof uses the Calderón–Zygmund decomposition and cancellation argument #cite(label("CalderonZygmund1952"))
  Chapter I, Lemmas 1–2, with a localized potential and a harmonic remainder controlled modulo constants.

#thm([Lemma 2.4.])[
  (Scalar potential estimate).  #emph[Suppose a finite scalar measure $v$ on $B_4 subset bb(R)^m$ satisfies
#[#set math.equation(numbering: n => "(2.12)")
 $ partial_j v = sum_i partial_i F_(i j) + g_j \, wide sum_(i j) \| F_(i j) \| \( B_4 \) +
   sum_j \| g_j \| \( B_4 \) lt.eq epsilon.alt . $ <eq:lt-gradient-equation>]

 Then there is a real constant $c$ such that the density $v_(upright("ac"))$ obeys
#[#set math.equation(numbering: n => "(2.13)")
 $ \| { y in B_2 : \| v_(upright("ac")) \( y \) - c \| > t } \| lt.eq C epsilon.alt \/ t quad \( t > 0 \) \,
   $ <eq:lt-weak-one>]

 and, for every smooth test supported in $B_2$,
#[#set math.equation(numbering: n => "(2.14)")
 $ \| chevron.l v - c thin #h(-0.16667em) d y \, phi chevron.r \| lt.eq
   C epsilon.alt parallel phi parallel_(C^k) \, $ <eq:lt-distribution-control>]

 where $k$ is a fixed integer depending only on $m$. Fixed changes of the radii give the same conclusion.]
] <lt:potential>

#proof[
  First mollify on a slightly smaller domain. Choose a cutoff equal to one on $B_3$ and supported in $B_(7 \/ 2)$,
    and let $Phi$ be the fundamental solution of the Laplacian. The potential
  $ u = sum_(i j) partial_i partial_j Phi * \( chi F_(i j) \) + sum_j partial_j Phi * \( chi g_j \) $
  has the same Laplacian as $v$ on $B_3$, so $h = v - u$ is harmonic there.
    The second-derivative kernels have the weak-type estimate $\| { \| u \| > t } ∩ B_3 \| lt.eq
    C epsilon.alt \/ t$; the first-derivative kernels are integrable on bounded sets.
    We recall the kernel argument. Decompose a mollified finite measure at level $t$ into its bounded part and
    zero-mean pieces on maximal dyadic cubes. The bounded part has squared $L^2$ norm at most $C
    t$ times the original mass norm. The Fourier multiplier $xi_i xi_j \/ \| xi \|^2$ has $L^2$ norm at most one.
    The bad cubes have total volume at most $C epsilon.alt \/ t$; off their fixed enlargements,
    cancellation and the bound $\| nabla partial_i partial_j Phi \( x \) \| lt.eq
    C \| x \|^(- m - 1)$ bound the $L^1$ norm of their contributions by $C epsilon.alt$.
    Chebyshev’s inequality proves the stated weak estimate, uniformly in mollification.
    Pairing the same potentials against a smooth test, moving the derivatives to the test,
    also gives $\| chevron.l u \, phi chevron.r \| lt.eq C epsilon.alt parallel phi
    parallel_(C^k)$ on any fixed bounded region.
  The harmonic remainder is controlled modulo a constant by the full gradient equation.
    For $x in B_(5 \/ 2)$ choose a fixed radial unit-integral bump $eta_x$ supported in a small ball about $x$.
    Harmonic mean value and (2.12) give
  $ partial_j h \( x \) = chevron.l partial_j h \, eta_x chevron.r = - sum_i chevron.l F_(i j) \,
    partial_i eta_x chevron.r + chevron.l g_j \, eta_x chevron.r + chevron.l u \, partial_j eta_x chevron.r . $
  Consequently $sup_(B_(5 \/ 2)) \| nabla h \| lt.eq C epsilon.alt$.
    Taking $c = h \( 0 \)$ proves both estimates for the mollified quantities.
    The constants $c$ are bounded by pairing against one fixed unit-integral bump and the finite mass of $v$.
    Pass to a subsequence as the mollification tends to zero;
    the densities converge almost everywhere at Lebesgue points.
    This proves (2.13), and weak convergence against tests proves (2.14). ◻
]

#thm([Lemma 2.5.])[
  (Scalar mass and propagation of the integer).  #emph[Fix a bound for $Q$ and fixed concentric interior
    enlargements of a ball $B_s$. Suppose the normalized projected mass on the outer enlargement is bounded, and
$ epsilon.alt = s^(- m) \( D + Lambda \) \( B_(c s) \) $

 is sufficiently small; $c > 1$ is a fixed enlargement with room for the argument.
   The count selects a unique integer $q gt.eq 0$ on most of an intermediate ball.
   If either a fixed smooth mass average differs from $Q$ by less than $1 \/ 4$, or $N =
   Q$ on a fixed majority of that ball, then $q = Q$. In that case
#[#set math.equation(numbering: n => "(2.15)")
 $ \| M \| \( B_s \) + "vol"_S { y in B_s : N \( y \) eq.not Q } lt.eq
   C \( D + Lambda \) \( B_(c s) \) . $ <eq:lt-scalar-mass>]

 In the smooth-average condition the test is nonnegative, has reference integral one,
   and has fixed scaled derivative bounds. The same integer propagates along overlapping comparable balls for
   which these small-energy and mass bounds hold and whose overlap has a fixed positive relative volume.]
] <lt:scalar>

#proof[
  Scale to $s = 1$. Write $#h(-0.16667em) d "vol"_S = a \( y \) thin #h(-0.16667em) d
    y$ and put the factor $a^(- 1)$ in each coordinate component of the tangent test field.
    Then 4 gives an equation of the form (2.12) for the scalar measure $a^(- 1) nu$.
    The divergence data have mass at most $C \( D + Lambda \)$, as do the zeroth-order data;
    derivatives of the fixed coordinate factors have bounded size.
    In particular, no derivative of the unknown scalar mass is estimated separately. Apply 6.
    By 5, the difference between $a^(- 1) nu$ and $N thin #h(-0.16667em) d y$ has mass at most $C epsilon.alt$.
    The density version of this difference and (2.13) give
  $ \| { \| N - c \| > t } ∩ B_2 \| lt.eq C epsilon.alt \/ t . $
  If $epsilon.alt = 0$, this estimate for every $t > 0$ gives $N = c$ almost everywhere.
    Since $N$ is integer-valued, $c$ is an integer, and the distributional bound is exact;
    the conclusions follow directly. Assume henceforth that $epsilon.alt > 0$.
    Taking $t = C_0 epsilon.alt$ with $C_0$ large proves that, on a fixed large majority,
    $N$ is within $C_0 epsilon.alt$ of $c$. For small $epsilon.alt$ there is at most one integer in this interval;
    call it $q$. Thus $\| c - q \| lt.eq C epsilon.alt$. The distributional bound against the specified smooth
    average makes its value $q + O \( epsilon.alt \)$, so the smooth-average hypothesis forces $q = Q$.
    The majority hypothesis has the same consequence by intersecting the two majority sets.
  Take now $t$ to be a fixed fraction of one. Since $\| c - Q \| lt.eq C epsilon.alt$,
  #[#set math.equation(numbering: n => "(2.16)")
   $ \| { N eq.not Q } ∩ B_2 \| lt.eq C epsilon.alt . $ <eq:lt-count-exception>]
  The nonnegativity of $N$ gives $integral_(B_2) \( N - Q \)_(-) thin #h(-0.16667em) d y lt.eq
    Q \| { N eq.not Q } ∩ B_2 \|$. The small measure error between $nu$ and $N
    "vol"_S$ therefore bounds $M_(-) \( B_2 \)$ by $C epsilon.alt$.
    Choose $0 lt.eq phi lt.eq 1$, equal to one on $B_1$ and supported in $B_2$.
    Equation (2.14), applied also to the bounded volume factor,
    gives $\| integral phi thin #h(-0.16667em) d M \| lt.eq C epsilon.alt$. Hence
  $ M_(+) \( B_1 \) lt.eq integral phi thin #h(-0.16667em) d M + integral phi thin #h(-0.16667em) d M_(-) lt.eq
    C epsilon.alt . $
  This proves total variation and the exceptional-volume assertion, and rescaling proves (2.15).
    Finally, on an overlap of fixed relative volume, the same fixed-threshold argument gives $\| { N eq.not
    q_i } \| lt.eq C epsilon.alt_i$ for each ball’s selected integer $q_i$, before any identification with $Q$.
    These exceptional sets cannot fill the overlap. At a remaining point both selected integers equal $N$.
    Induction along a finite chain proves propagation. ◻
]

#prodef([Remark 2.6.])[
  The enlargement constant in (2.15) can be any prescribed $c > 1$,
    at the cost of constants depending on the interior room. Applying the argument on a finite cover gives,
    in particular, the notation $\| M \| \( B \) lt.eq C \( D + Lambda \) \( 2 B \)$.
    It is never an estimate on a ball with no interior enlargement or with an unspecified integer.
] <rem:lt-scalar-radii>

=== 2.2 Configurations and height bounds <configurations-and-height-bounds>

#thm([Lemma 2.7.])[
  (Configurations, higher moments, and support heights).  #emph[Fix $Q gt.eq 1$,
    and choose a sufficiently large fixed enlargement $c > 1$ depending only on the dimensions, $Q$,
    and the fixed coordinate and cylinder-room data. For every prescribed exceptional proportion $delta_0 >
    0$ there is a threshold $d_0 = d_0 \( delta_0 \) > 0$, depending otherwise only on these fixed data,
    such that the following holds. Suppose $Q$ is selected on the enlarged ball $B_(c s) \( x \)$ and
$ s^(- m) tau \( B_(c s) \( x \) \) lt.eq d lt.eq d_0 \, $

 with the cylinder and interior-room conventions above. There is a configuration $cal(A) = { a_1 \, dots.h \,
   a_Q }$ of scaled heights such that, outside a subset of $B_s \( x \)$ of relative volume at most $delta_0$,
   the fiber consists of exactly $Q$ projection entries and can be matched to $cal(A)$ within $C_(delta_0) s
   sqrt(d)$. Configurations on comparable overlapping balls can be chosen,
   and any such majority configurations can be matched, within the sum of these bounds,
   provided the exceptional proportions are smaller than a fixed fraction of the overlap.]
  #emph[For every fixed finite $p > 2$ satisfying
#[#set math.equation(numbering: n => "(2.17)")
 $ m \( 1 \/ 2 - 1 \/ p \) < 1 \, $ <eq:lt-p-range>]

 and every fixed $0 < beta < min { 1 \/ 2 \, 1 \/ m }$, this same configuration satisfies
#[#set math.equation(numbering: n => "(2.18)")
 $ (s^(- m) integral_(pi^(- 1) \( B_s \( x \) \)) "dist" \( zeta \, cal(A) \)^p thin #h(-0.16667em) d
   mu)^(1 \/ p) & lt.eq C_p s sqrt(d) \,\
sup_("spt" mu ∩ pi^(- 1) \( B_s \( x \) \)) "dist" \( zeta \, cal(A) \) & lt.eq
  C_beta s d^beta . $ <eq:lt-config-moment>]

 The enlargement $c$, threshold $d_0$, and configuration do not depend on $p$ or $beta$.
   The constants $C_p \, C_beta$ may depend on their indicated exponents and the fixed data, but not on $delta_0$;
   the majority constant $C_(delta_0)$ may depend on it. The support estimate holds for all support points,
   including points with zero projection Jacobian.]
] <lt:config>

#proof[
  It is enough to prove the estimates for $d > 0$. If the actual energy is zero,
    fix $0 < delta' < min { delta_0 \, 1 \/ 2 }$ and positive upper bounds $d_j arrow.b
    0$ below $d_0 \( delta' \)$. Let $G_j$ be the measurable good sets from the positive case.
    Fatou’s lemma applied to their complements gives
  $ "vol"_S \( limsup_j G_j \) gt.eq \( 1 - delta' \) "vol"_S \( B_s \( x \) \) . $
  Choose a defined fiber $cal(F)_0$ in this limsup and retain the indices $j_k$ for which it is good.
    Its $Q$ entries match the corresponding configurations within $C_(delta') s sqrt(d_(j_k)) arrow.r 0$,
    so those configurations converge to $cal(F)_0$ up to permutations.
    The limsup of the selected $G_(j_k)$ has the same volume bound.
    On each fiber in that limsup, the matching triangle inequality along its good subsubsequence gives exact
    matching to $cal(F)_0$. For one admissible $beta_0 > 0$, the support estimate and the matching convergence put
    every support height in $cal(F)_0$. All support distances and hence all finite moments are zero,
    proving the assertion for $d = 0$. We give the finite selection argument before the iteration that controls
    exceptional fibers. If $f$ is a bounded Lipschitz function of height with $\| f \| lt.eq 1$,
    use $f \( zeta \) overline(X)$ in the horizontal first variation.
    In flat coordinates the additional term is $nabla f dot.op P_(v h) X$.
    In normal coordinates its additional frame term is bounded by $C "Lip" \( f \) l \| z_(upright("phys")) \| \|
    X \|$. In the curved case, as in 7, write $#h(-0.16667em) d "vol"_S =
    a thin #h(-0.16667em) d y$ and take the coordinate components $X = a^(- 1) Y$.
    Then $"div"_S X = a^(- 1) "div" Y$ exactly; derivatives of $a^(- 1)$ remain in the tensor and geometric terms.
    Cauchy–Schwarz, the normalized mass bound, and Lemma 2.4, Lemma 2.3 show that the fiber function
  $ N_f \( y \) = sum_(q in pi^(- 1) \( y \) \, med J_pi \( q \) > 0) theta \( q \) f \( zeta \( q \) \) $
  differs from its fixed smooth average $overline(N)_f$ by a weak-$L^1$ quantity whose normalized size is at most
  #[#set math.equation(numbering: n => "(2.19)")
   $ C { d + s "Lip" \( f \) sqrt(d) } . $ <eq:lt-multiplier-oscillation>]
  The same bound controls distributional pairings. Changing between Jacobian-weighted and ordinary mass in this
    statement costs $C d$.
  For this finite selection prescribe $0 < delta lt.eq 1 \/ 4$;
    a larger requested exceptional proportion is covered by using $delta = 1 \/ 4$.
    Normalize the smoothly averaged vertical counting measure to a probability measure $cal(P)$;
    its total before normalization is $Q + O \( d \)$ by 7. Fix a mass mesh $eta_0$ much smaller than $1 \/ Q$.
    For each of the $n$ coordinates choose its quantiles at levels $j eta_0$,
    and test smoothed half-lines immediately to both sides of these quantiles, with transition width $w =
    K s sqrt(d)$. Repeated quantiles cause no problem: retain both one-sided tests.
    There are at most $C \( n \) \/ eta_0$ tests. For each, the right side of (2.19) is $C \( d + K^(- 1) \)$.
    First choose $eta_0$, then choose $K$ large enough for these tests and the joint-count tests below,
    and finally choose a positive energy threshold small. The union of the exceptional sets where any test differs
    from its average by more than $eta_0$ then has relative volume at most $delta \/ 3$.
  Also discard the set where $N eq.not Q$. By (2.16) its relative volume is $O \( d \)$,
    so it is at most $delta \/ 3$ after decreasing the same threshold.
    Every remaining fiber therefore has exactly $Q$ projection entries, counted with multiplicity.
  Let $F_y$ be the empirical coordinate distribution on a remaining fiber (normalized by $Q$),
    and let $F$ be that of $cal(P)$. Bracketing an arbitrary real number by adjacent quantiles gives
  $ F \( t - 2 w \) - 3 eta_0 lt.eq F_y \( t \) lt.eq F \( t + 2 w \) + 3 eta_0 . $
  If $t$ is in a quantile jump, the left and right tests at that quantile give the same inequalities;
    thus atoms require no continuity assumption. Comparison of two good fibers gives this estimate with $4
    w$ and $6 eta_0$. For $6 eta_0 < 1 \/ \( 2 Q \)$, comparison at the levels $\( j - 1 \/ 2 \) \/
    Q$ shows that their ordered coordinate lists differ by at most $C w$.
    Choose one such fiber as a temporary reference. In each coordinate group its at most $Q$ levels by joining
    consecutive levels whose gap is at most a sufficiently large fixed multiple of $w$.
    Each resulting interval has length at most $C Q w$, and distinct intervals have an empty gap in which a cutoff
    can change from zero to one.
  Coordinate lists alone do not determine vector configurations.
    To determine the joint counts, test products of the interval cutoffs just constructed.
    There are at most $Q^n$ such tests and their Lipschitz constants are at most $C \/ w$.
    On the good coordinate fibers every product equals an exact indicator.
    After decreasing the threshold if necessary and discarding a further relative volume at most $delta \/ 3$,
    each joint count is within less than $1 \/ 4$ of its smooth average.
    It is an integer, so it is the same on all remaining fibers.
    Taking this many copies of one point in each occupied coordinate box gives $cal(A)$.
    The boxes have diameter $C w$, proving the majority assertion.
    Intersecting the good sets of two overlapping balls proves the matching assertion.
    Write $d_(upright("sel")) \( delta \) > 0$ for a threshold sufficient for this finite selection,
    and use $d_(upright("sel")) \( 1 \/ 4 \)$ when $delta > 1 \/ 4$.
  There is also an exact finite selection when the energy on this ball is zero.
    Fix $0 < delta' < min { delta \, 1 \/ 2 }$, apply only the finite selection just proved with positive upper
    bounds $d_j arrow.b 0$ below $d_(upright("sel")) \( delta' \)$,
    and use the limsup construction and matching through one common fiber from the start of this proof.
    That part uses only the good sets and their matching errors, not the moment or support estimates.
    It yields an exact majority configuration with exceptional proportion at most $delta' < delta$.
  The dyadic covering geometry below, including its enlargement and overlap ratios,
    is fixed from the data at the outset and determines $c$ in the statement.
    Choose an internal proportion $0 < delta_(upright("int")) < 1 \/
    4$ so that two exceptional sets cannot fill any comparison overlap, and small enough for the support argument.
    Then choose a fixed threshold $d_(upright("int")) lt.eq d_(upright("sel")) \( delta_(upright("int")) \)$ small
    enough for that argument and the iteration, and set
  $ d_0 \( delta_0 \) = min { d_(upright("int")) \, d_(upright("sel")) \( delta_0 \) } . $
  For every selection ball in the descent, including the root,
    use the actual normalized mass of $tau$ on the associated fixed enlargement as the selection upper bound,
    using the exact finite selection when that mass is zero. Use the root configuration $cal(A)$ selected with
    $delta_(upright("int"))$ throughout the descent. If $delta_0 < delta_(upright("int"))$,
    apply the finite selection once more at the root with exceptional proportion $delta_0$ and the same actual
    energy. A common good fiber matches the two root configurations within $C_(delta_0) s sqrt(d)$,
    after enlarging that constant. On the good fibers of the second selection,
    the triangle inequality then gives the prescribed majority bound for $cal(A)$.
    If $delta_0 gt.eq delta_(upright("int"))$, the original good set suffices.
    Thus the descent and its root configuration use only the fixed internal choices;
    the finer selection affects only the majority constant and input threshold.
  We next record how to include every support point. On a continuing ball of radius $r$ with normalized $tau$ at
    most $d_(upright("int"))$, the majority assertion and Lemma 2.5,
    Lemma 2.3 bound the mass outside the configuration’s height neighborhoods by
  $ C \( delta_(upright("int")) + d_(upright("int")) \) r^m . $
  Indeed the mass above bad fibers is at most their $Q$-fold base volume plus $\| M \|$,
    and the projection error also has mass at most $C \( D + Lambda \)$.
    Because the restricted support is separated from the artificial vertical boundary,
    its extension by zero across that boundary remains stationary for fields supported away from the lateral
    boundary; multiply such a field by a vertical cutoff equal to one near the restricted support to verify this
    assertion. The monotonicity ball is taken in this extension and remains in the lateral working region;
    it need not lie inside the original vertical cutoff. If a support point over an inner base ball were at
    distance at least $c_1 r$ from these height neighborhoods,
    its ambient ball of radius $c_2 r$ would lie outside them.
    For fixed small $c_2 > 0$, this contradicts (2.1) when $delta_(upright("int")) \,
    d_(upright("int"))$ are sufficiently small. The same reasoning works in the curved tube since its coordinate
    map and inverse are uniformly Lipschitz. This proves an $O \( r \)$ bound for every support point on an
    interior ball. In particular it applies to a first stopped child, using its continuing parent.
  For the quantitative iteration, subdivide the inner base region into dyadic cubes,
    using around each cube a ball of a fixed large multiple of its side.
    Start with sufficiently generous interior room. Continue down a branch while the normalized $tau$ on these
    balls is at most the fixed threshold $d_(upright("int"))$. Otherwise stop at the first such cube.
    On continuing balls the normalized mass is bounded by $Q + C d_(upright("int"))$, the integer is $Q$,
    and the majority configurations at a child and its parent match with increment
  $ C r sqrt(r^(- m) tau \( upright("fixed enlargement of the parent") \)) . $
  The fixed parent enlargement here contains both selection enlargements.
    If its $tau$-mass is zero, both actual selection energies vanish,
    their exact majority configurations match on the overlap, and the child cannot stop.
    At a first stopped cube the all-support argument gives instead $C
    r$ for the distance from each support height to the parent’s configuration.
    Its stopping condition charges $r^m$ to a fixed multiple of $tau$ on that enlargement.
    Configurations are regarded with their optimal matching, so their nearest-point distances obey the triangle
    inequality even at coincident entries.
  Write $r_j = 2^(- j) s$, and let $b_j \( q \)$ be the corresponding increment for a point above a continuing
    cube, or its final error at its first stopped cube; put $b_j = 0$ after a stop.
    Fixed enlargements of cubes have bounded overlap at each generation.
    The preceding charge, the bounded mass of a continuing parent, and $tau \( B_(c s) \) lt.eq d s^m$ give
  #[#set math.equation(numbering: n => "(2.20)")
   $ s^(- m) integral b_j^2 thin #h(-0.16667em) d mu & lt.eq C r_j^2 d \,\
parallel b_j parallel_oo & lt.eq C r_j min { 1 \, 2^(j m \/ 2) sqrt(d) } . $ <eq:lt-increment-two>]
  For the second bound on stopped cubes, stopping itself implies $2^(j m) d gt.eq c > 0$,
    so its $C r_j$ error has the required form. For a branch which never stops,
    the all-support $C r_j$ bound tends to zero; thus its configurations approach the actual support height in
    distance. It follows in both cases that $"dist" \( zeta \( q \) \, cal(A) \) lt.eq sum_j b_j \( q \)$.
  The covering, stopping decisions, and configuration were fixed before either exponent was chosen.
    The following summations therefore apply to this same $cal(A)$ for every exponent in the stated ranges.
    Interpolate (2.20) with the second part of (2.20), without the minimum, to obtain
  $ (s^(- m) integral b_j^p thin #h(-0.16667em) d mu)^(1 \/ p) lt.eq
    C s sqrt(d) thin 2^(- j \[ 1 - m \( 1 \/ 2 - 1 \/ p \) \]) . $
  Minkowski’s inequality and (2.17) prove (2.18). Summing (2.20) above and below $2^(- j) tilde.eq
    d^(1 \/ m)$ gives $C s sqrt(d)$ when $m = 1$, $C s sqrt(d) \( 1 + \| log d \| \)$ when $m = 2$,
    and $C s d^(1 \/ m)$ when $m > 2$. Each is bounded by $C_beta s d^beta$ for the stated range of $beta$,
    proving (2.18). ◻
]

=== 2.3 Gaussian and height identities <gaussian-and-height-identities>

#thm([Corollary 2.8.])[
  (Gaussian weights and polynomial dilations).  #emph[Define
$ G_s \( y \) = \( 2 pi s^2 \)^(- m \/ 2) exp \( - \| y \|^2 \/ \( 2 s^2 \) \) $

 and fix a center $x$. On the region $\| y - x \| lt.eq R s$,
   cover the base by balls of radii comparable to $s \/ \( 1 + \| y - x \| \/ s \)$,
   with fixed enlarged balls having bounded overlap. Suppose each enlarged ball meets the hypotheses of 7 with the
   same propagated integer $Q$. Then
#[#set math.equation(numbering: n => "(2.21)")
 $ integral_(\| y - x \| lt.eq R s) G_s \( y - x \) thin #h(-0.16667em) d \| M \| \( y \) lt.eq
   C integral_(\| y - x \| lt.eq \( R + C \) s) G_s \( y - x \) thin #h(-0.16667em) d \( D + Lambda \) \( y \) .
   $ <eq:lt-weighted-scalar>]

 The constant is independent of $R$. The part outside the indicated region is retained as a tail error.]
  #emph[For the configuration conclusion, fix one exceptional proportion $delta_(upright("cmp")) >
    0$ smaller than the fixed comparison-overlap proportions.
    If, in addition, on all admissible dilations $1 lt.eq t lt.eq R_(*)$ one has
#[#set math.equation(numbering: n => "(2.22)")
 $ \( t s \)^(- m) tau \( B_(c t s) \( x \) \) lt.eq C t^J d \, $ <eq:lt-polynomial-dilation>]

 with $C t^J d lt.eq d_0 \( delta_(upright("cmp")) \)$ throughout this range and the same integer propagated,
   then configurations matched from the scale $s$ have moment and support estimates on a dilation $t$ equal to
   those in 9, with an additional fixed power of $t$. Gaussian integrals of these estimates have constants
   depending on $J$ and the fixed moment order, once the tail beyond $R_(*)$ is accounted for.]
] <lt:weightedballs>

#proof[
  The logarithmic derivative of $G_s$ is $- \( y - x \) \/ s^2$.
    Its values on each fixed enlargement of a ball of the stated radius differ by bounded factors.
    Such a cover can be obtained by a maximal disjoint family of sufficiently small balls for this radius
    function; nearby radii are comparable. Apply (2.15) on each ball and sum.
    This proves (2.21) without a factor depending on the number of balls.
    Apply 9 with the fixed proportion $delta_(upright("cmp"))$ successively to concentric dyadic dilations and to
    overlapping comparable balls. Every increment is bounded by a fixed power of $t$ times $s sqrt(d)$,
    and each local moment estimate has the same property by (2.22).
    Summation of the geometric increments gives the claimed polynomial bounds.
    Finally $sum_(j gt.eq 0) 2^(j C) exp \( - c 4^j \) < oo$ absorbs any fixed polynomial loss in the Gaussian
    integral. ◻
]

We specify the cutoff convention for every Gaussian identity.
  Choose a smooth base cutoff $chi$ which is one on the region under consideration and has compact support in the
  chart. A subscript $s$ denotes convolution at $x$ with $G_s$ of the extended measure;
  on the chart it is the original measure, and outside it any stated extension is used.
  In a first-variation identity the test field is multiplied by $chi$.
  Contributions where $chi eq.not 1$, including the difference from the chosen extension,
  are denoted by $cal(T)_s$. If the cutoff annulus has distance at least $h$ from $x$ and the relevant total
  measure is at most $K_0$, decrease $h$ to the available transition width if necessary, and choose $0 lt.eq
  chi lt.eq 1$ with $parallel nabla chi parallel_oo lt.eq C \( 1 + h^(- 1) \)$.
  The first-variation product rule differentiates this fixed cutoff once; scale derivatives leave it fixed.
  For $0 < s lt.eq 1$, direct differentiation of the Gaussian bounds each such term by

#[#set math.equation(numbering: n => "(2.23)")
 $ C K_0 s^(- C) \( 1 + h^(- 1) \)^C exp \( - h^2 \/ \( 4 s^2 \) \) \, $ <eq:lt-chart-tail>]

times the stated bounds for the height multiplier and its derivatives.
  One may use a larger fixed exponent $C$ for the finite set of Gaussian and height-multiplier derivatives used
  below. When a polynomial dilation bound such as (2.22) is available through $R_(*)$,
  annular summation bounds the contribution from $R s < \| y - x \| lt.eq
  R_(*) s$ by $C thin upright("poly") \( R \) e^(- c R^2)$ times its reference density.
  The part beyond $R_(*) s$ remains a separate tail, including any part still inside the chart,
  until a further dilation or total-mass bound controls it. The exterior-chart term is also retained.
  A periodized Gaussian on a fixed large torus obeys the same estimates.
  These formulas are the meaning of a negligible Gaussian tail; no unrestricted extension is silently discarded.

#thm([Lemma 2.9.])[
  (Gaussian mass identity).  #emph[Set $u = \( y - x \) \/ s$, $A \( s \) = s^2 M_s \( x \)$, and
$ R_s \( x \) = integral G_s \( y - x \) B \[ u \, u \] thin #h(-0.16667em) d mu . $

 In flat coordinates, apart from $cal(T)_s$,
#[#set math.equation(numbering: n => "(2.24)")
 $ dot(A) = s^2 L_s + s^2 R_s \, wide accent(, ̇) = frac(#h(-0.16667em) d,
   #h(-0.16667em) d log s) . $ <eq:lt-gaussian-flat>]

 In the curved coordinates fixed above,
#[#set math.equation(numbering: n => "(2.25)")
 $ dot(A) = s^2 L_s + s^2 R_s + cal(E)_s + cal(T)_s \, wide \| cal(E)_s \| lt.eq
   C gamma s^2 integral G_s \( y - x \) \( 1 + \| u \|^2 \) thin #h(-0.16667em) d tau \( y \) .
   $ <eq:lt-gaussian-curved>]

 Here the entries of $u$ in $B \[ u \, u \]$ are taken in the chosen orthonormal horizontal frame,
   and $gamma$ retains its definition from the fixed physical coordinates.]
] <lt:gaussian>

#proof[
  In flat coordinates $dot(G)_s = - "div"_y \( \( y - x \) G_s \)$.
    The horizontal first variation says $integral "div" X thin #h(-0.16667em) d M = integral B :
    D X thin #h(-0.16667em) d mu$. Take $X = \( y - x \) G_s$.
    Since $D X = G_s \( I - u ⊗ u \)$, it follows that $dot(M)_s = - D_s + R_s$.
    Differentiating the factor $s^2$ proves (2.24).
  For the curved identity apply 4 to the same coordinate field.
    Its scaled derivative is bounded by $C G_s \( 1 + \| u \|^2 \)$ and its size by $C s G_s \| u \|$.
    On a physical chart of radius $l$, coordinate coefficients and their scaled first derivatives differ from the
    centered Euclidean ones by $O \( l \)$. The divergence comparison is made after subtracting $Q "vol"_S$;
    its coefficient error therefore multiplies $M$, not the background mass.
    The tensor coefficient errors multiply $B$ and are bounded by $C gamma e$.
    Equation (2.8) controls the remaining geometric terms. Multiplying by $s^2$ proves (2.25).
    Differentiation of $chi$ produces precisely the tails described in (2.23). ◻
]

#thm([Lemma 2.10.])[
  (Height tests and geometric errors).  #emph[In flat coordinates, for a base test $phi$,
    a scalar height function $f$, a horizontal field $X$, and a normal vector function $v$, stationarity gives
#[#set math.equation(numbering: n => "(2.26)")
 $ integral f "div" X thin #h(-0.16667em) d mu & = integral f B : D X thin #h(-0.16667em) d mu -
   integral D f dot.op P_(v h) X thin #h(-0.16667em) d mu \,\
0 & = integral { phi D v : P_(v v) + v dot.op P_(v h) nabla phi } thin #h(-0.16667em) d mu .
  $ <eq:lt-height-horizontal>]

 All height functions here use the scaled variable $zeta$.
   For a scale-independent $C^2$ height function $Gamma$, these formulas give
#[#set math.equation(numbering: n => "(2.27)")
 $ frac(#h(-0.16667em) d, #h(-0.16667em) d log s) integral G_s Gamma thin #h(-0.16667em) d mu =
   integral G_s Gamma \( B \[ u \, u \] - e \) thin #h(-0.16667em) d mu + s^2 integral G_s D^2 Gamma :
   P_(v v) thin #h(-0.16667em) d mu \, $ <eq:lt-height-gaussian>]

 apart from the specified chart tails. If $Gamma$ depends on $s$,
   add $integral G_s dot(Gamma) thin #h(-0.16667em) d mu$.]
  #emph[In the curved tube, use the original radial-gauge normal frame fixed above.
    The extra trace terms in a normal test $phi v \( zeta \)$ without a derivative of $phi$ are bounded pointwise
    by $C \| phi \|$ times
#[#set math.equation(numbering: n => "(2.28)")
 $ \| D v \| l \| z_(upright("phys")) \| sqrt(e) + l \| v \| #scale(x: 120%, y: 120%)[\(] \| H_S \| + \|
   z_(upright("phys")) \| + e + sqrt(e) #scale(x: 120%, y: 120%)[\)] . $ <eq:lt-normal-error>]

 The terms with a derivative of $phi$ have the flat tensor expression in (2.26),
   with a coefficient error at most $C gamma \| P_(v h) \|$.
   The curved horizontal identity is covariant, with $"div"_S X$ and $nabla^S
   X$ in place of the flat base operators. Its geometric error is bounded by the right side of (2.8) with the
   integrand multiplied by $\| f \|$. The additional flux error from the height gradient is bounded pointwise by
#[#set math.equation(numbering: n => "(2.29)")
 $ C gamma \| D f \| \| X \| \( sqrt(e) + sqrt(lambda) \) . $ <eq:lt-horizontal-height-error>]

 In its coordinate form the divergence comparison also contributes an error bounded by $C l integral \| f \| \|
   X \| thin #h(-0.16667em) d mu$; the coordinate changes in the $B$ term are included in the preceding geometric
   error. Under a further interior rescaling, retain the original horizontal and normal frames and the original
   $gamma$ in (2.6). Transform the displayed estimates by change of variables.
   The inherited physical connection remains $O \( l \)$; no improvement to $O \( l s \)$ is asserted on an
   off-center ball of coordinate radius $s$. In particular first-order flux errors have size at most $C
   gamma \( sqrt(e) + sqrt(lambda) \)$ times the relevant multiplier,
   whereas quadratic errors have size at most $C gamma \( e + lambda \)$.
   The factor $\| v \|$ in (2.28) must be retained when estimating a normal test.]
] <lt:heighttests>

#proof[
  In a product Euclidean chart, differentiate the ambient fields $f \( zeta \) X \( y \)$ and $phi \( y \)
    v \( zeta \)$. Their horizontal and vertical blocks give (2.26) and (2.26).
    Apply the first with $f = Gamma$ and $X = \( y - x \) G_s$.
    It yields the first term of (2.27) and the flux $s integral G_s D Gamma dot.op P_(v h) u thin #h(-0.16667em) d
    mu$. Apply the normal formula with $v = D Gamma$ and $phi = G_s$; since $nabla G_s = - G_s u \/ s$,
    this flux is exactly $s^2 integral G_s D^2 Gamma : P_(v v) thin #h(-0.16667em) d mu$.
    This proves the identity and fixes both its sign and its factors of $s$.
  We give the geometric error calculation. In radial gauge the normal connection one-form vanishes at the chart
    center and has physical norm $O \( l \)$ throughout the chart,
    by its bounded curvature and the radial parallel-transport equation.
    Its ambient derivative still has the tangential component $- A_v$;
    that component is not part of the small connection one-form.
    A horizontal derivative in scaled ambient coordinates of $zeta = z_(upright("phys")) \/ l$ is
  $ D_h zeta = - omega \( J_z^(- 1) h \) z_(upright("phys")) \, wide \| D_h zeta \| lt.eq
    C l \| z_(upright("phys")) \| \| h \| \, $
  while the vertical derivative is unchanged. Differentiating $v \( zeta \)$ therefore gives the first summand of
    (2.28) on contraction with the mixed block. Differentiating its normal frame gives a horizontal trace whose
    identity part is $- l chevron.l H_S \, v chevron.r$, with error $C l \| z_(upright("phys")) \| \|
    v \|$ from $J_z^(- 1) - I$; its $B$ part is bounded by $C l e \| v \|$.
    The remaining mixed-frame term is bounded by $C l sqrt(e) \| v \|$. This proves (2.28).
    A base derivative uses $D pi = J_z^(- 1) P_h$; its coefficient on a coordinate gradient in the chosen frame is
    $J_z^(- 1) sans(C)_y^(- top)$, which differs from $I$ by at most $C gamma$.
    This gives the stated coefficient error on the mixed block.
  For the horizontal test, first use the calculation in 4, and then differentiate $f \( zeta \)$.
    If $X_(upright("coord"))$ is the coordinate column of the scaled field,
    its lift has column $J_z sans(C)_y X_(upright("coord"))$ in the horizontal frame.
    Subtracting the flat mixed flux leaves
  $ D f dot.op P_(v h) \( J_z sans(C)_y - I \) X_(upright("coord")) \, wide \| J_z sans(C)_y - I \| lt.eq C gamma . $
  The bound $\| P_(v h) \| lt.eq C sqrt(e)$ gives its first contribution to (2.29).
    The separate connection derivative is bounded by $C l \| z_(upright("phys")) \| \| D f \| \|
    X_(upright("coord")) \|$, which gives the second contribution because $l lt.eq
    gamma$ and $\| z_(upright("phys")) \| lt.eq sqrt(lambda)$.
    For the coordinate form, in the original centered coordinates put $a_l \( xi \) = sqrt(det g \( l xi \))$.
    For a scaled coordinate field $X \( xi \)$,
  $ "div"_S \( l thin D F \( l xi \) X \) = "div"_xi X + D_xi \( log a_l \) dot.op X \,
    wide \| D_xi log a_l \| lt.eq C l . $
  This weighted identity has no subtracted reference volume,
    so this last term gives the stated $C l integral \| f \| \| X \| thin #h(-0.16667em) d mu$ error.
    The remaining coordinate coefficient changes are contracted with $B$ and cost $C l e \|
    f \| \( \| nabla X \| + \| X \| \)$, already included in the geometric error.
    At a further radius $s$, put $y' = \( y - x \) \/ s$, $zeta' = zeta \/ s$,
    $T_(x \, s) \( y \, zeta \) = \( y' \, zeta' \)$, $mu' = s^(- m) \( T_(x \, s) \)_(\#) mu$,
    and $v' \( zeta' \) = v \( s zeta' \) \/ s$. Then $D' v' = D v$, while $lambda$ remains in physical units.
    Keeping the same frame retains the coefficient $l$ in $l \| D v \| \| z_(upright("phys")) \| sqrt(e)$;
    the terms involving $v$ become $\( l s \) \| v' \| \( \| H_S \| + \| z_(upright("phys")) \| + e + sqrt(e) \)$.
    The resulting estimates use the original $gamma$. All configuration comparisons likewise use the original
    height frame, so there is no change of height coordinates from a new gauge.
    Young’s inequality changes products of two first-order errors into the stated quadratic bound.
    Applying Cauchy–Schwarz to (2.28) retains the actual $L^2$ size of $v$,
    which is why this form of the bound is useful for displacement and clipped-height tests.
    Finally multiply each field by the chart cutoff; its derivative terms obey (2.23). ◻
]

== 3 The signed-excess estimate <sec:signed-statement>

We now state the estimate that drives the proof. The definitions of $M \, B \, D \, L \, Lambda$,
  and $tau$ are those of 2; in particular, $L = 2 M - D$ and $tau = \| M \| + D +
  Lambda$ are measures on the base. In the curved case the reference graph has small gradient,
  a fixed normal tube, and fixed bounds through a sufficiently large fixed finite order $J$, as specified in 2.
  All applications below use $C^J$ reference graphs with these uniform bounds.

For a positive integer $j$, let $exp_j$ and $log_j$ denote $j$-fold composition of the exponential and logarithm.
  For large $T$ set

#[#set math.equation(numbering: n => "(3.1)")
 $ F_Q \( T \) = exp_(2 Q) #h(-0.16667em) (sqrt(log_(2 Q) T)) . $ <eq:signed-rate>]

Only sufficiently large arguments are used. Thus

#[#set math.equation(numbering: n => "(3.2)")
 $ \( log T \)^p = o \( F_Q \( T \) \) quad \( p < oo \) \, wide F_Q \( T \) =
   T^(o \( 1 \)) . $ <eq:signed-rate-growth>]

#thm([Theorem 3.1.])[
  (Signed excess).  #emph[Fix a positive integer $Q$ and $kappa > 0$.
    Work in the interior normal-cylinder setting of 2, with base coordinates scaled by a physical radius $l$ so
    that $B_4$ is available. Suppose
#[#set math.equation(numbering: n => "(3.3)")
 $ tau \( B_4 \) lt.eq d = e^(- T) \, wide l + sup \| z_(upright("phys")) \| lt.eq
   e^(- kappa T) . $ <eq:signed-smallness>]

 The supremum is over the restricted support above the available chart.
   The statement also holds after an interior rescaling in the inherited frames of 12,
   provided in the curved case the second smallness condition is imposed on the inherited parameter $gamma$ from
   (2.6). There are a constant $C_Q$ and a threshold $T_0$, depending only on the stated fixed data,
   such that for $T gt.eq T_0$,
#[#set math.equation(numbering: n => "(3.4)")
 $ integral w thin \( L - C_Q Lambda \) lt.eq e^(- F_Q \( T \)) d $ <eq:signed-conclusion>]

 whenever $w$ is supported in $B_1$, $0 lt.eq w lt.eq 1$, and $"Lip" w lt.eq 1$.
   For a flat reference plane, take $Lambda = 0$ and omit the second condition in (3.3);
   constant sheet offsets need not be bounded.]
] <sx:signed>

The integer $Q$ is the reference count subtracted in $M$;
  the theorem does not assume the pointwise bound $theta lt.eq Q$.
  The proof occupies the next three sections and proceeds by induction on this reference count.
  At the step $Q > 1$, the hypothesis is the theorem for every integer $1 lt.eq q < Q$.
  If the asserted bound fails, 4 subtracts a small margin from the weighted signed source and assigns its
  remaining positive mass to selected centers and scales. Let $h$ denote the positive spatial projection of this
  contact measure. At a contact, the smoothed difference between the source and $h$ is nonnegative.
  At larger scales only its cumulative integral with weight $v^2 thin #h(-0.16667em) d log v$ is nonnegative.
  This remains true for contacts on vertical sides of the stopping boundary.
  The construction itself uses no smaller-integer assertion.

Induction enters through a configuration of $Q$ heights. If its entries split into separated nonempty groups,
  sufficiently small working balls contain actual stationary restrictions with positive reference counts $q < Q$.
  The separated estimate in 4 applies 13 at every such lower count and also gains a small positive multiple of the
  tilt far from the configuration. In the main induction step,
  5 retains contacts whose outward vertical contains a threshold equality and constructs an envelope of future
  signed mass. Along the selected path beginning at that equality,
  the cumulative sign makes the envelope control unsigned averages at larger radii up to the chosen outer scale,
  with a fixed power of the radius ratio. This permits a comparison with squared distance from finitely many
  height centers. The separated gain pays for the regions where that distance function changes between centers.
  The centers may merge, but at most $Q - 1$ times, so one of $Q$ fixed ranges of excess levels is traversed
  without a merger.

6 extracts many scales with a definite normal flux on that traversal.
  The higher height moment prevents this flux from lying entirely where the excess measure has large density.
  A dyadic packing argument then makes the union carrying all these scales too small to support the original
  contact mass, closing the induction at $Q$. For $Q = 1$ every step involving separated groups or several wells
  is omitted.

===== 3.1 Order of choices. <order-of-choices.>

Dimensions, a bound on $Q$, coordinate geometry, and $kappa$ are fixed first.
  Interior radii, covering constants, moment exponents, and the finite number of derivative bounds are then fixed.
  Polynomial error exponents may be made large enough for these data.
  For $Q > 1$, the separated estimate uses a function $b = b_Q$ with

#[#set math.equation(numbering: n => "(3.5)")
 $ b \( T \) gt.double \( log T \)^200 \, wide F_(Q - 1) \( b \( T \) \/ 2 \) gt.double \( log T \)^2 \, wide
   b \( T \) = T^(o \( 1 \)) . $ <eq:choice-b>]

For example, a sufficiently large fixed multiple of

$ 1 + \( log T \)^201 + F_(Q - 1)^(- 1) \( \( log T \)^3 \) $

suffices. Fixed increases of this choice will be made before fixing $T_0$.
  The separation factors are exponentials of fixed multiples of $b$.
  21 verifies the additional rate comparisons required by the finitely many mergers. Finally $T$ is taken large.
  A fixed weakening of $kappa$ changes only the threshold; this permits all the rescaled lower-integer applications.

===== 3.2 Margins and tails. <margins-and-tails.>

Whenever a compactly supported chart is replaced by a Gaussian convolution,
  the source includes a negative margin proportional to $eta \( tau + d thin #h(-0.16667em) d y \)$,
  where $eta > 0$ is a chosen small parameter. Contact scales lie below a chosen outer scale $rho$,
  with $\| log rho \| = o \( T \)$ in the main application.
  On the continuation region, bounds at every larger scale control the Gaussian tails.
  15 gives the precise localization statement. Curved first-variation errors contain the factor $e^(- kappa T)$,
  which is smaller than the margins used below. These conventions are retained at recursive nodes,
  with lengths normalized by the node radius.

== 4 Heat-potential contacts and separated configurations <sec:contact>

The contact construction replaces a positive signed integral by a positive measure carried by selected space–scale
  points. Its useful property is an initial sign and a cumulative sign on each outward vertical.
  We first give this construction without any geometric assumptions.
  We then use it, together with the elementary estimates of 2,
  to reduce a separated configuration to smaller multiplicities.

The extension viewpoint of Caffarelli and Silvestre #cite(label("CS2007")) Sections 1–2 motivated an earlier
  potential-based approach to the contact construction. The present construction uses a heat potential and is
  proved locally; their fractional-Laplacian extension theorem is not invoked as a varifold regularity input.

=== 4.1 The entrance boundary and its contact measure <the-entrance-boundary-and-its-contact-measure>

Let $X$ be a flat torus, with its volume measure denoted by $#h(-0.16667em) d y$.
  Gaussian kernels on $X$ are periodized, and preserve constants. Fix a bottom scale $a > 0$.
  A #emph[continuation set] is a closed subset $cal(D) subset X times \[ a \, oo \)$ such that

$ \( x \, s \) in cal(D) med arrow.r.double med \( x \, v \) in cal(D) quad \( v gt.eq s \) \, wide
  X times \[ s_(upright("top")) \, oo \) subset cal(D) $

for some $s_(upright("top")) > a$. Its entrance boundary is $K = cal(D) \\ "int" cal(D)$,
  where the interior is taken in $X times \( 0 \, oo \)$. Thus $K$ is compact.
  No artificial upper time boundary belongs to $K$.

Here are the two types of continuation sets used below. For a finite mesh $t_j
  in \[ a \, s_(upright("top")) \)$ and continuous tests $q_j$, the inequalities $q_j \( x \) lt.eq
  lambda_j$ are required only at strictly larger mesh scales:

#[#set math.equation(numbering: n => "(4.1)")
 $ cal(D) = { s gt.eq a } ∩ ⋂_j #scale(x: 120%, y: 120%)[\(] { s gt.eq t_j } union { q_j \( x \) lt.eq
   lambda_j } #scale(x: 120%, y: 120%)[\)] . $ <ct:mesh-domain>]

Each factor is closed and upward closed. At $s = t_j$ the current test is omitted.
  With tests continuous in the scale, impose the non-strict continuation inequality at every scale $v gt.eq
  s$ at which a test is defined, and extend by the full cylinder above the last test.
  In our applications all tests hold strictly near that last scale, so this extension is closed.
  Equivalently one can first impose the inequalities at $v > s$ and pass to $v = s$ by continuity.
  Taking a limit of points of $cal(D)$ proves closedness: any fixed $v >
  s$ is eventually larger than the approximating scales.

The entrance boundary includes bottom points, current hits,
  and vertical sides below an equality at a larger scale. These sides are essential:
  a tangential equality can prevent a spatial neighborhood from belonging to the continuation set even though the
  outward vertical itself remains in that set. Upward closure implies that a backward space–time cylinder
  contained in $cal(D)$ provides forward room as well; hence the above definition agrees with the parabolic
  entrance boundary.

#thm([Lemma 4.1.])[
  (Contact measure).  #emph[Let $f$ be a finite signed Borel measure on $X$, with $M_f = f \( X \) > 0$,
    and let $K$ be the entrance boundary of a continuation set.
    There is a probability measure $sigma$ on $K$ such that the positive spatial measure
$ h = M_f \( pi_X \)_(\#) sigma $

 has mass $M_f$ and, at every $\( x \, s_0 \) in "spt" sigma$,
#[#set math.equation(numbering: n => "(4.2)")
 $ \( f - h \)_(s_0) \( x \) gt.eq 0 \, wide integral_(s_0)^s v^2 \( f - h \)_v \( x \) thin #h(-0.16667em) d log
   v gt.eq 0 quad \( s gt.eq s_0 \) . $ <ct:contact-signs>]

 The second inequality concerns the integral; it does not assert a pointwise sign at scales larger than $s_0$.]
] <ct:contact>

#proof[
  For $sigma in cal(P) \( K \)$ put $g_sigma = f - M_f \( pi_X \)_(\#) sigma$. This measure has zero mass. Define
  $ b_sigma \( x \, s \) = G_s * \( - Delta_X \)^(- 1) g_sigma \( x \) \, $
  using the inverse with zero spatial mean. If $lambda_k$ are the nonzero eigenvalues of $- Delta_X$,
    its kernel has Fourier coefficients $e^(- lambda_k s^2 \/ 2) \/ lambda_k$.
    Since $s gt.eq a > 0$, the kernel and all its derivatives converge uniformly on bounded scale intervals.
    Thus $b_sigma$ is smooth, and
  #[#set math.equation(numbering: n => "(4.3)")
   $ frac(#h(-0.16667em) d b_sigma, #h(-0.16667em) d log s) = - s^2 \( g_sigma \)_s \, wide partial_t b_sigma =
     Delta_X b_sigma \, wide t = s^2 \/ 2 . $ <ct:potential-derivative>]
  Weak convergence of probabilities implies uniform convergence of their potentials on $K$:
    the kernel is jointly continuous on the relevant compact product,
    and can be approximated uniformly by finite sums of products of continuous functions of its two variables.
  Choose finite $1 \/ j$-nets $K_j = { z_(j 1) \, dots.h \, z_(j N_j) }$ in $K$.
    For a probability vector $p$ on $K_j$ and $beta > 0$, the map
  $ p mapsto
    (frac(exp \( beta b_p \( z_(j i) \) \), sum_(k = 1)^(N_j) exp \( beta b_p \( z_(j k) \) \)))_(i = 1)^(N_j) $
  is continuous from the probability simplex to itself. Brouwer’s Fixed Point Theorem gives a fixed point
    #cite(label("Milnor1978")) Theorem 2. First let $beta arrow.r
    oo$ on a fixed net and take a convergent subsequence. If a point’s limiting payoff is at least $delta$ below
    the maximum, its fixed-point weight is at most $e^(- beta delta \/ 2)$ for all sufficiently large $beta$.
    The limiting probability is therefore carried by maximizers of its own potential on $K_j$.
    Next pass to a weak limit as $j arrow.r oo$. Uniform convergence of the potentials and density of the nets
    show that the resulting probability $sigma$ satisfies
  #[#set math.equation(numbering: n => "(4.4)")
   $ "spt" sigma subset "arg max"_(z in K) b_sigma \( z \) . $ <ct:self-maximizers>]
  Indeed a compact subset separated from the limiting maximum by $delta$ receives no mass from sufficiently late
    net probabilities; a nearby net point witnesses the strictly larger payoff.
    Exhaust the complement of the closed maximizer set by such compact subsets.
  Write $b = b_sigma$. Its maximum on the whole continuation set is bounded by $max_K b$.
    To verify this on an irregular boundary, truncate at any scale $S >
    s_(upright("top"))$ and apply the elementary maximum argument to $b - epsilon.alt t$.
    At a maximum outside $K$ below the artificial top, $partial_t \( b - epsilon.alt t \) -
    Delta \( b - epsilon.alt t \) = - epsilon.alt$ contradicts the derivative conditions.
    At a maximum at the artificial top, the one-sided time derivative is nonnegative and the spatial Laplacian is
    nonpositive, giving the same contradiction. Let $epsilon.alt arrow.b 0$.
    This argument uses only that points outside $K$ have an open neighborhood in the continuation set,
    and hence also covers arbitrary vertical-side geometry.
  For $\( x \, s_0 \) in "spt" sigma$, (4.4) and upward closure now give $b \( x \, s_0 \) gt.eq
    b \( x \, s \)$ for every $s gt.eq s_0$. The right derivative at $s_0$ is nonpositive.
    Applying (4.3) proves the first inequality in (4.2); integrating that identity proves the second. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-3.3, 0.825), (0, 0.825), (0, 2.365), (3.3, 2.365), (3.3, 3.905), (-3.3, 3.905), close: true, fill: rgb("#f0f0ff"), stroke: none)
  line((-3.795, 0), (3.905, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.905, 0), [#text(size: 9pt)[$x$]], anchor: "west", padding: 0.1176cm)
  line((-3.795, 0), (-3.795, 4.235), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-3.795, 4.235), [#text(size: 9pt)[$log s$]], anchor: "south", padding: 0.1176cm)
  line((-3.3, 0.825), (0, 0.825), (0, 2.365), (3.3, 2.365), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((-3.685, 3.63), (3.41, 3.63), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-3.795, 3.63), [#text(size: 9pt)[$log rho$]], anchor: "east", padding: 0.1176cm)
  content((1.65, 2.97), [#text(fill: rgb("#000073"))[#text(size: 9pt)[continuation region]]])
  content((-0.55, 2.09), [#text(size: 9pt)[vertical side of the#linebreak()entrance boundary]], anchor: "east", padding: 0.1176cm)
  line((-0.528, 1.87), (-0.088, 1.76), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  line((0.055, 1.43), (0.055, 3.443), stroke: (paint: rgb("#bf6000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#bf6000"))))
  circle((0, 1.397), radius: 0.07056, fill: black, stroke: none)
  content((0.242, 1.342), [#text(size: 9pt)[contact at $"underline" s$]], anchor: "west", padding: 0.1176cm)
  circle((0, 2.365), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  content((0.275, 2.222), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[threshold equality at $s_0$]]])], anchor: "west")
})],
  caption: [Figure 1: A schematic entrance boundary. In this illustration the contact scale is denoted by $underline(s)$ and a larger threshold scale by $s_0$. A contact on a vertical side can have derivative scale $underline(s) < s_0$, where $s_0$ is a larger threshold scale. The contact rule controls the initial derivative and the cumulative integral along the outward vertical. It does not impose a pointwise sign at every later scale. The two scales remain distinct in the final mass charge. ],
) <fig:contact>

=== 4.2 Localization of the signed source <localization-of-the-signed-source>

All extensions in the next statement are made consistently:
  if $L'$ is restricted to a working chart, $tau$ is restricted to the same or a larger chart,
  so that $\| L' \| lt.eq C_0 tau$ survives extension by zero.
  The constant density $d thin #h(-0.16667em) d y$ is placed on the entire torus.

#thm([Lemma 4.2.])[
  (Uniform weight localization).  #emph[Let $\| L' \| lt.eq C_0 tau$,
    where $tau$ is a finite positive measure on a torus of diameter comparable to $R$, and let $0 lt.eq w lt.eq
    1$, $"Lip" w lt.eq R^(- 1)$. Put
$ nu = tau + d thin #h(-0.16667em) d y \, wide f = w L' - eta nu \, wide 0 < eta < 1 . $

 Suppose, for some fixed $C_1$, that $tau \( X \) \/ \( d R^m \) lt.eq e^(C_1 T)$. For all sufficiently large $T$, if
#[#set math.equation(numbering: n => "(4.5)")
 $ 0 < rho lt.eq c eta^2 R \/ T^2 \, $ <ct:localization-scale>]

 then, uniformly for every $x in X$ and $0 < s lt.eq rho$,
#[#set math.equation(numbering: n => "(4.6)")
 $ f_s \( x \) lt.eq w \( x \) L'_s \( x \) - eta / 2 #scale(x: 120%, y: 120%)[\(] tau_s \( x \) +
   d #scale(x: 120%, y: 120%)[\)] . $ <ct:localized-source>]

 Here $c > 0$ depends only on $C_0 \, C_1$ and the fixed torus shape.
   If $sigma \, h$ are furnished by 14 with contacts at scales $s_0 lt.eq rho$,
   then $w \( x \) > 0$ at each contact, and
#[#set math.equation(numbering: n => "(4.7)")
 $ L'_(s_0) \( x \) & gt.eq h_(s_0) \( x \) + eta / 2 nu_(s_0) \( x \) \,\
integral_(s_0)^s v^2 #scale(x: 120%, y: 120%)[\(] L' - eta /
  2 nu #scale(x: 120%, y: 120%)[\)]_v \( x \) thin #h(-0.16667em) d log v & gt.eq
  0 wide \( s_0 lt.eq s lt.eq rho \) . $ <ct:localized-initial>]

 In particular, contacts lie in the interior region containing ${ w > 0 }$.
   These conclusions are uniform as the bottom scale tends to zero.]
] <ct:localization>

#proof[
  The only commutator is
  $ f_s \( x \) = w \( x \) L'_s \( x \) - eta nu_s \( x \) + E_s \( x \) \, wide \| E_s \( x \) \| lt.eq
    C_0 integral G_s \( x - y \) \| w \( y \) - w \( x \) \| thin #h(-0.16667em) d tau \( y \) . $
  Split at torus distance $r_(*) = c_0 eta R$. For sufficiently small fixed $c_0$,
    the near contribution is at most $eta tau_s \( x \) \/ 4$. The far contribution is at most
  $ C tau \( X \) s^(- m) exp \( - c_2 eta^2 R^2 \/ s^2 \) . $
  Writing $x_(*) = s \/ R$, its ratio to $d$ is bounded by $C e^(C_1 T) x_(*)^(- m) e^(- c_2 eta^2 \/ x_(*)^2)$.
    On $0 < x_(*) lt.eq c eta^2 \/ T^2$ this is $o \( eta \)$ uniformly:
    the negative exponent is at least a fixed multiple of $T^4 \/ eta^2$, which dominates $C_1 T$,
    $m \| log x_(*) \|$, and $\| log eta \|$. The same estimate applies to the nonnearest periodized copies.
    This proves (4.6).
  At a contact $f_(s_0) gt.eq h_(s_0) gt.eq 0$. If $w \( x \) = 0$, (4.6) would give a strictly negative value.
    Division by $w \( x \) > 0$, followed by $w \( x \) lt.eq 1$, proves (4.7).
    Integrate (4.6), use the cumulative contact inequality and the nonnegativity of the corresponding integral of
    $h$, and again divide by the fixed number $w \( x \)$. This proves (4.7). ◻
]

The elementary proof just given requires no positive lower bound on $s$.
  In applications of first variation we also cut off the Gaussian test field within the original chart.
  If $s lt.eq rho lt.double R$ and its center lies in the fixed interior region,
  this introduces a factor $exp \( - c R^2 \/ s^2 \)$ times the bounded chart mass and fixed powers of $s^(- 1)$.
  The same reasoning makes these errors smaller than any prescribed part of the subtractive margin.
  At a node of the recursion below, $s gt.eq r_b$ and $rho \/ R = T^(- 4 N)$,
  so this remains true even after the factor $s^(- m) lt.eq exp \( O \( T \) \)$ is included.
  All subsequent Gaussian identities use this convention.

=== 4.3 The estimate for separated configurations <the-estimate-for-separated-configurations>

We use the signed estimate 13 only at smaller integers in this subsection.
  Separation refers to the scaled normal coordinates; the integrands defining $Lambda$ continue to use physical
  units. In this subsection write $z = zeta = z_(upright("phys")) \/ l$, in the root chart;
  these height coordinates remain fixed at all recursive nodes.

For two lists $cal(A) = { a_1 \, dots.h \, a_Q }$ and $cal(B) = { b_1 \, dots.h \, b_Q }$, write

$ d_oo \( cal(A) \, cal(B) \) = min_(sigma in frak(S)_Q) max_(1 lt.eq j lt.eq Q) \| a_j - b_(sigma \( j \)) \| . $

Thus repetitions are distinct entries in a matching. Choose once $0 < r_(upright("maj")) <
  1$ so that the fixed enlargements needed first to select the integer by 7 and then to apply 9 on the inner ball
  $B_(r_(upright("maj")))$ lie in $B_4$. The corresponding inner ball of a work ball $B_r \( y \)$ is
  $B_(r_(upright("maj")) r) \( y \)$.

We use comparison chains whose work radii change by factors at most two and whose center steps are at most one
  quarter of the smaller inner radius. For adjacent inner balls $B \, B'$,
  these choices give a fixed $theta.alt_(upright("ov")) > 0$ such that

#[#set math.equation(numbering: n => "(4.8)")
 $ "vol"_S \( B ∩ B' \) gt.eq theta.alt_(upright("ov")) #scale(x: 120%, y: 120%)[\(] "vol"_S \( B \) +
   "vol"_S \( B' \) #scale(x: 120%, y: 120%)[\)] . $ <ct:majority-overlap>]

Indeed their intersection contains a ball of a fixed fraction of the smaller radius,
  and their radii are comparable. Fix $0 < delta_(upright("maj")) < theta.alt_(upright("ov"))$,
  and let $C_(upright("maj"))$ be a fixed constant valid in 9 for this exceptional proportion and the finitely
  many fixed enlargements used below. Every auxiliary configuration below uses this same exceptional proportion.
  The corresponding smallness threshold in 9 is therefore fixed before $T$;
  the local bounds used to select these configurations tend to zero with $T$.

Suppose $s^(- m) tau \( B_(c s) \( x \) \) lt.eq d_(upright("loc"))$ on a ball and its required fixed enlargement.
  A #emph[majority configuration] on $B_s \( x \)$ is a list of $Q$ heights such that,
  outside a set of base volume at most $delta_(upright("maj")) "vol"_S \( B_s \( x \) \)$,
  each fiber has exactly $Q$ projection entries and these entries match the list within $C_(upright("maj")) s
  sqrt(d_(upright("loc")))$. The projection entries repeat each spatial point according to its integer
  multiplicity. If majority configurations $cal(A) \, cal(B)$ on adjacent balls of radii $s \,
  t$ have local upper bounds $d_s \, d_t$, then

#[#set math.equation(numbering: n => "(4.9)")
 $ d_oo \( cal(A) \, cal(B) \) lt.eq C_(upright("maj")) #scale(x: 120%, y: 120%)[\(] s sqrt(d_s) +
   t sqrt(d_t) #scale(x: 120%, y: 120%)[\)] . $ <ct:majority-matching>]

In fact, (4.8) leaves a fiber outside both exceptional sets.
  Composing its two matchings proves the estimate, including repetitions.

At the root the inner ball is $B_(r_(upright("maj")))$ and $d_(upright("loc")) = r_(upright("maj"))^(- m) d$,
  so its matching error is a fixed multiple of $sqrt(d)$. The majority property itself imposes no condition on
  exceptional fibers; their contribution remains in the global $tau$ budget.
  A partition of a list’s entries into groups is separated by $delta$ if different groups have mutual distance at
  least $delta$. Identical list entries therefore belong to the same group when $delta > 0$.

#thm([Proposition 4.3.])[
  (Separated configurations).  #emph[Fix $Q > 1$ and assume 13 for every integer $1 lt.eq q < Q$.
    For each fixed $P > 0$ there are constants $C_Q \, C_S$ and a function $b = b_Q$ satisfying
#[#set math.equation(numbering: n => "(4.10)")
 $ b \( T \) gt.double \( log T \)^200 \, wide b \( T \) = T^(o \( 1 \)) \, wide
   F_(Q - 1) \( b \( T \) \/ 2 \) gt.eq \( log T \)^3 $ <ct:b-choice>]

 such that the following holds. Under the hypotheses of 13, let $cal(A) = { a_1 \, dots.h \,
   a_Q }$ be any majority configuration on $B_(r_(upright("maj")))$ with local upper bound $d_(upright("loc")) =
   r_(upright("maj"))^(- m) d$, and suppose it has a partition into at least two nonempty groups separated by $10
   S \( T \) sqrt(d)$, where
$ S \( T \) = e^(C_S b \( T \)) \, wide c \( T \) = frac(\( log T \)^2, T) . $

 Let $D_(upright("far"))$ be the projection of tilt restricted to ${ "dist" \( z \, cal(A) \) > S \( T \)
   sqrt(d) }$. Then every nonnegative weight $w lt.eq 1$, supported in $B_1$ with $"Lip" w lt.eq 1$, satisfies
#[#set math.equation(numbering: n => "(4.11)")
 $ integral w thin #h(-0.16667em) d #scale(x: 120%, y: 120%)[\(] L - C_Q Lambda +
   c \( T \) D_(upright("far")) #scale(x: 120%, y: 120%)[\)] lt.eq T^(- P) d . $ <ct:separated-estimate>]

 The statement holds on other fixed interior balls after rescaling.
   Polynomial factors in the Lipschitz norm or the enlargement of a Gaussian working ball can be allowed by
   increasing $P \, C_S$ and the fixed constants.]
] <ct:separated>

#proof[
  The proof is a finite recursion over working balls, with the root configuration and its far-tilt region kept
    fixed. On a sufficiently small ball, the support lies in disjoint neighborhoods of the root groups.
    Cutting through the gaps gives stationary pieces with positive counts below $Q$,
    so the lower-integer theorem makes the signed integral small on that ball.
  On a larger ball, if the signed integral exceeds a small margin,
    the remaining positive source gives a contact measure. The cumulative contact inequality and the Gaussian mass
    identity exclude a contact whose derivative scale is close to a threshold hit or a side equality:
    it would force too much signed mass at the outer scale. Bottom contacts are excluded by the small-ball
    reduction. Each remaining contact lies on a vertical side, far below its equality scale.
    Its signed Gaussian integral is partitioned over smaller working balls,
    while a choice of thresholds made before constructing the contact measure confines the associated charging
    balls to a small part of the measure on the working ball.
    Thus a large generation pays a small margin and at most half of the next-generation bound.
    The choices below enforce these alternatives and keep the configuration motion smaller than the original separation.
  For example, after extending $F_(Q - 1)$ monotonically over a fixed initial interval, one can use
  $ b \( T \) = 1 + \( log T \)^201 + 4 F_(Q - 1)^(- 1) \( \( log T \)^3 \) . $
  The definition of the iterated exponentials gives $F_(Q - 1)^(- 1) \( \( log T \)^3 \) = T^(o \( 1 \))$,
    and this choice has (4.10). All changes of $b$ below are by fixed constants or an additional fixed power of $log T$.
  Choose a fixed integer $N > P + 10$, increasing it later if necessary,
    and then choose a fixed $J_0$ sufficiently large in terms of $m \, n \, Q \, N$. In particular require
  #[#set math.equation(numbering: n => "(4.12)")
   $ J_0 > 4 N \( m + 2 \) + 100 \, $ <ct:J-choice>]
  and enlarge $J_0$ to exceed all fixed polynomial density losses in the cell constructions below. Set
  #[#set math.equation(numbering: n => "(4.13)")
   $ eta = T^(- N) \, quad epsilon = frac(\( log T \)^60, T) \, quad r_b = sqrt(d) thin e^(3 b) \, quad n_0 =
     ceil.l 10 N log T ceil.r \, quad E_j \( t \) = T^(J_0 \( j + 1 \)) d thin t^(- 2 - epsilon) .
     $ <ct:recursion-parameters>]
  The parameter $T$, the original configuration $cal(A)$, and the measure $D_(upright("far"))$ remain fixed
    throughout the finite recursion. They are never recomputed at a child node.
  Two elementary parameter bounds will be used repeatedly. With $ell_T = log T$, direct substitution gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ log E_(2 n_0 + 4) \( r_b \/ T^4 \) = - 6 b + 1 / 2 ell_T^60 - 3 epsilon b + O_(J_0 \, N) \( ell_T^2 \) < -
     2 b . $ <ct:small-envelope>]
  Also, for $i lt.eq n_0$,
  #[#set math.equation(numbering: n => "(4.15)")
   $ v sqrt(E_(2 i + 1) \( v \)) = sqrt(d) thin T^(J_0 \( i + 1 \)) v^(- epsilon \/ 2) . $ <ct:motion-budget>]
  For $v gt.eq c r_b \/ T^2$, the logarithm of the factor multiplying $sqrt(d)$ is
    $O_(J_0 \, N) \( \( log T \)^2 \) + O \( \( log T \)^60 \)$.
    Consequently $O \( T \)$ such increments, even with any fixed polynomial loss in $T$,
    sum to less than $e^b sqrt(d)$. This is why the much larger separation $e^(C_S b)
    sqrt(d)$ survives every generation.
  At generation $i$ a node consists of a ball $B_(4 R) \( x_(*) \)$ with
  #[#set math.equation(numbering: n => "(4.16)")
   $ tau \( B_(4 R) \( x_(*) \) \) lt.eq C R^m E_(2 i) \( R \) \, wide R gt.eq c r_b \/ T^2 \, $ <ct:node-hypotheses>]
  and a majority configuration $cal(A)_R$ on $B_(r_(upright("maj")) R) \( x_(*) \)$,
    with local upper bound $C r_(upright("maj"))^(- m) E_(2 i) \( R \)$, satisfying
  $ d_oo \( cal(A)_R \, cal(A) \) lt.eq \( i + 1 \) e^b sqrt(d) . $
  The integer is $Q$ on the balls constructing the node; the small-density and overlap checks below establish this
    before their configurations are selected. We estimate all weights $0 lt.eq w lt.eq 1$, $"Lip" w lt.eq
    R^(- 1)$, supported in $B_R \( x_(*) \)$. Write
  $ L' = L - C_Q Lambda + c \( T \) D_(upright("far")) \, wide cal(N)_R = tau \( B_(4 R) \( x_(*) \) \) + d R^m . $
  We prove, by downward induction on $i$, that
  #[#set math.equation(numbering: n => "(4.17)")
   $ integral w thin #h(-0.16667em) d L' lt.eq p_i cal(N)_R \, wide p_(n_0) = C_(*) \, wide p_i = C eta + 1 /
     2 p_(i + 1) . $ <ct:node-conclusion>]
  Here $C_(*) \, C$ are fixed, independent of $i$ and $T$. The last-generation bound follows at once from $\|
    L' \| lt.eq C tau$. Initialization at $R = 1$ follows from $tau \( B_4 \) lt.eq d$ and the given configuration.
  ===== 4.3.1 Small nodes and actual stationary pieces. <small-nodes-and-actual-stationary-pieces.>
  Suppose first that $R lt.eq T^(10 N) r_b$, and put $E = E_(2 i) \( R \) < 1$, as follows from (4.14).
    Cover $B_(2 R) \( x_(*) \)$ by a fixed finite number of balls of radius $sigma R$,
    including the concentric ball, where the fixed $sigma > 0$ is small enough that every fixed enlargement needed
    for scalar selection and then for the support estimate in 9 lies in $B_(4 R) \( x_(*) \)$,
    and the scalar enlargement of the concentric ball lies in $B_(2 R) \( x_(*) \)$.
    Their normalized $tau$ is at most $C E$. The normalized smooth mass averages therefore differ from $Q$ by
    $O \( E \) < 1 \/ 4$, so 7 selects $Q$ on these balls. On each choose the joint configuration in 9 with
    exceptional proportion $delta_(upright("maj"))$, retaining its majority property and using its all-support
    bound with a fixed $0 < beta < min { 1 \/ 2 \, 1 \/ m }$. Its local upper bound is $C E = o \( 1 \)$.
    Connect it to $cal(A)_R$ by a fixed chain satisfying (4.8).
    The intermediate balls have the same $C E = o \( 1 \)$ upper bound,
    and the same smooth mass test selects $Q$ there. Equation (4.9) bounds this change by $C R sqrt(E)$,
    while the support bound is $C R E^beta$. Consequently all support heights over $B_(2 R) \( x_(*) \)$ satisfy
  #[#set math.equation(numbering: n => "(4.18)")
   $ "dist" \( z \, cal(A) \) & lt.eq \( i + 1 \) e^b sqrt(d) + C R sqrt(E) + C R E^beta\
 & lt.eq \( i + 1 \) e^b sqrt(d) + C R E_(2 i) \( R \)^beta lt.eq e^(C' b) sqrt(d) $ <ct:bottom-sup>]
  for a fixed $C'$. The second line uses $beta < 1 \/ 2$ and $E < 1$.
    To see the last bound without a hidden scale restriction, write $R = sqrt(d) thin e^(3 b) T^theta$, where $-
    3 lt.eq theta lt.eq 10 N$, and substitute in $R E_(2 i) \( R \)^beta$;
    its logarithm after division by $sqrt(d)$ is bounded above by $C' b$ using (4.14). Choose $C_S > C' + 10$.
    For a root group $cal(A)_g$, put
  $ cal(O)_g = { z : "dist" \( z \, cal(A)_g \) < 2 S \( T \) sqrt(d) } . $
  For large $T$, (4.18) puts all the support over $B_(2 R)$ inside the smaller regions with radius $S \( T \)
    sqrt(d)$. The regions $cal(O)_g$ are disjoint, since the root group gap is $10 S \( T \) sqrt(d)$.
    Thus there is an open height gap around each group’s support, and no far energy in this interior region.
  The use of disjoint height regions to obtain stationary restrictions has a precedent in #cite(label("BDD2025"))
    Section 3.1. For each group, restrict the varifold over $B_(2 R) \( x_(*) \)$ to ${ z in cal(O)_g }$.
    Choose a smooth height cutoff equal to one near the smaller region of radius $S \( T \)
    sqrt(d)$ around $cal(A)_g$ and zero outside $cal(O)_g$. Its derivative vanishes near the entire support over
    $B_(2 R) \( x_(*) \)$. Multiplying any ambient test field with compact base support there by this cutoff
    proves stationarity of the restriction. It keeps every included spatial point with its entire integer
    multiplicity, including on exceptional fibers. On a majority fiber of one of the local configurations,
    its matching to the fixed root list moves each entry by at most $\( i + 1 \) e^b sqrt(d) + C R sqrt(E) =
    o \( S \( T \) sqrt(d) \)$. An entry matched to $cal(A)_g$ therefore lies in $cal(O)_g$.
    If two copies of one spatial point were matched to different root groups,
    their two root entries would be separated by at most twice this error,
    less than $10 S \( T \) sqrt(d)$ for large $T$, contrary to the separation.
    Each group’s projection count on that fiber is thus the number $q_g$ of entries in its root group,
    including repetitions. Since there are at least two nonempty groups, $1 lt.eq q_g < Q$ and $sum_g q_g = Q$.
    To specify the individual energy budgets, take a finite nonnegative partition of the weight on balls
    $B_(r_alpha) \( y_alpha \)$, with $r_alpha = c R$ for a sufficiently small fixed $c$,
    and $B_(8 r_alpha) \( y_alpha \) subset B_(2 R) \( x_(*) \)$. These enlarged balls have bounded overlap.
    For each stationary restriction, its normalized projected mass is bounded by the normalized total mass,
    and its normalized $D + Lambda$ is $O \( E \) = o \( 1 \)$.
    Apply 7 with its initial intermediate ball equal to the concentric majority ball above.
    Its selected integer is $q_g$ by intersection with the group majority set there.
    Connect this ball to the intermediate balls for the scalar applications on $B_(4 r_alpha) \( y_alpha \)$ by a
    fixed finite chain of comparable interior balls with the positive overlap in (4.8).
    The scalar count exceptions on each intermediate ball have relative volume $O \( E \)$,
    smaller than the fixed overlap for large $T$; on a remaining fiber the two selected integers coincide.
    Thus $q_g$ is identified and propagated before the mass defect of the restriction is estimated.
  Write $mu_g$ for the mass measure of the restriction and $D_g \, Lambda_g$ for its projected energy measures.
    Now set $M_g = pi_(\#) mu_g - q_g "vol"_S$ and $tau_g = \| M_g \| + D_g + Lambda_g$.
    The scalar estimate with interior room now gives
  $ tau_g \( B_(4 r_alpha) \( y_alpha \) \) lt.eq C_s \( D_g + Lambda_g \) \( B_(8 r_alpha) \( y_alpha \) \) . $
  Define the parameter for the lower-integer application of 13 by
  #[#set math.equation(numbering: n => "(4.19)")
   $ d_(g alpha) = max {d \, C_s r_alpha^(- m) \( D_g + Lambda_g \) \( B_(8 r_alpha) \( y_alpha \) \)} \, wide
     T_(g alpha) = - log d_(g alpha) . $ <ct:group-budget>]
  Increasing the fixed $C_s$ if necessary supplies the required bound for $tau_g$ on each rescaled $B_4$. Moreover
  #[#set math.equation(numbering: n => "(4.20)")
   $ sum_(g \, alpha) d_(g alpha) r_alpha^m lt.eq C #scale(x: 120%, y: 120%)[\(] \( D + Lambda \) \( B_(4 R) \) +
     d R^m #scale(x: 120%, y: 120%)[\)] lt.eq C cal(N)_R . $ <ct:group-budget-sum>]
  Here the group energies add exactly on their separated region, and the enlarged base balls have bounded overlap.
    Individual mass defects have been estimated by 7, rather than by splitting $\| M \|$. The parameters satisfy
  #[#set math.equation(numbering: n => "(4.21)")
   $ b \/ 2 lt.eq T_(g alpha) lt.eq T . $ <ct:child-parameter>]
  Indeed $d lt.eq d_(g alpha) lt.eq d + C E_(2 i) \( R \)$, and (4.14) absorbs the fixed constants.
    Physical radii only decrease, and physical heights are unchanged,
    so the curvature hypothesis follows from the original one.
    Apply 13 at $q_g$ to the partition weights normalized by a fixed constant.
    Taking $C_Q$ at least as large as the finitely many constants for $q < Q$,
    summing the lower-integer conclusions with (4.20) gives an $o \( eta \) cal(N)_R$ bound.
    Indeed $F_q \( T_(g alpha) \) gt.eq F_(Q - 1) \( b \/ 2 \) gt.eq \( log T \)^3$ for large $T$.
    This argument also applies to the small cells used at a bottom contact.
  ===== 4.3.2 Stopping tests at a large node. <stopping-tests-at-a-large-node.>
  Now assume $R > T^(10 N) r_b$. Use a torus of period $C R$,
    identifying the node and a fixed surrounding chart with its central portion. Put
  $ nu = tau \|_(B_(4 R) \( x_(*) \)) + d thin #h(-0.16667em) d y \, wide rho = T^(- 4 N) R . $
  Its total mass is comparable to $cal(N)_R$. If $f = w L' -
    eta nu$ has nonpositive integral there is nothing to prove.
    Otherwise apply 14 with bottom $r_b$ and dyadic test scales $t in \[ r_b \, rho \]$, using
  #[#set math.equation(numbering: n => "(4.22)")
   $ q_t \( x \) = frac(\( tau \|_(B_(4 R) \( x_(*) \)) \)_t \( x \), E_(2 i + 1) \( t \)) \, wide
     q_t \( x \) lt.eq lambda_t \, quad 1 lt.eq lambda_t lt.eq 2 . $ <ct:stopping-q>]
  The thresholds will be chosen later. There are $O \( T \)$ test scales.
    The torus masses satisfy the growth condition in 15, because $cal(N)_R \/ \( d R^m \) lt.eq
    exp \( O \( T \) \)$ by (4.16). Also $rho \/ R = T^(- 4 N) lt.double eta^2 \/ T^2$.
  For every contact $\( x \, s_0 \)$, localization places $x$ in the interior support region.
    Gaussian comparison between successive dyadic scales, and the non-strict tests at larger scales, give
  #[#set math.equation(numbering: n => "(4.23)")
   $ tau_v \( x \) lt.eq C E_(2 i + 1) \( v \) wide \( s_0 lt.eq v lt.eq rho \) . $ <ct:contact-envelope>]
  Here and below the measure in this display is the node restriction.
    At the current mesh scale its value is bounded by the next larger scale. At the top use the node’s total mass.
    In fact, for $v gt.eq rho \/ 16$,
  $ q_v \( x \) lt.eq C T^(- J_0) \( R \/ v \)^(m - 2 - epsilon) lt.eq C T^(- J_0 + 4 N max \( m - 2 \, 0 \)) . $
  Thus all top tests hold strictly, and every scale with $q_v gt.eq 1$ lies below $rho \/ 16$,
    leaving a fixed outward interval below $rho$.
  If $s_0 > r_b$, the boundary description (4.1) supplies a mesh scale $v_1 gt.eq s_0$ with $q_(v_1) \( x \) gt.eq
    1$. Either it is a current hit, or it is a larger scale with $q_(v_1) \( x \) = lambda_(v_1)$.
    In the latter case every still larger test satisfies its continuation inequality.
    This follows directly from the finite intersection: away from the bottom,
    if there were no current obstruction and every relevant larger test were strict,
    a space–scale neighborhood would belong to $cal(D)$.
  ===== 4.3.3 Exclusion of a nearby hit or side equality. <exclusion-of-a-nearby-hit-or-side-equality.>
  We show that no such $v_1$ can satisfy $v_1 \/ s_0 lt.eq \( log T \)^20$.
    All the following estimates are on this one outward vertical. Put
  $ I_1 = v_1^2 E_(2 i + 1) \( v_1 \) \, wide A \( v \) = v^2 M_v \( x \) \, wide Z \( s \) =
    integral_(s_0)^s v^2 \( L' - eta / 4 nu \)_v \( x \) thin #h(-0.16667em) d log v . $
  By 15, $Z gt.eq 0$ and $A \( s_0 \) gt.eq 0$; the latter uses $c \( T \) < 1$ and $L' = 2 M - D - C_Q Lambda +
    c \( T \) D_(upright("far"))$. The envelope gives
  #[#set math.equation(numbering: n => "(4.24)")
   $ integral_(s_0)^rho v^2 D_v thin #h(-0.16667em) d log v lt.eq
     frac(C I_1, epsilon) \( v_1 \/ s_0 \)^epsilon lt.eq frac(C I_1, epsilon) \, wide
     frac(c \( T \), epsilon) = \( log T \)^(- 58) . $ <ct:nearhit-cost>]
  In particular the adverse $c \( T \) D_(upright("far"))$ term is small enough for the logarithmic losses below.
  At $v_1$, and on its fixed outward dilations, the scalar estimate is available in weighted form:
  #[#set math.equation(numbering: n => "(4.25)")
   $ \| M \|_(v_1) lt.eq C \( D + Lambda \)_(v_1) + o \( E_(2 i + 1) \( v_1 \) \) . $ <ct:nearhit-scalar>]
  Here are the raw density and integer checks, also needed for the children below.
    For $s in \[ s_0 \, rho \]$ and $U = 1 + \| y - x \| \/ s lt.eq C sqrt(T)$, put $r =
    c s \/ U$ with a small fixed $c$. All required fixed enlargements $B_(L r) \( y \)$ lie in
    $B_(2 R) \( x_(*) \)$: $x in B_R \( x_(*) \)$ and $C sqrt(T) thin rho = o \( R \)$.
    Choose $a = C_1 U s$ so that $G_a \( x - z \) gt.eq c_1 a^(- m)$ on these enlarged balls.
    If $a lt.eq rho$, positivity and the envelope give
  $ r^(- m) tau \( B_(L r) \( y \) \) lt.eq C \( a \/ r \)^m E_(2 i + 1) \( a \) lt.eq
    C U^(2 m - 2 - epsilon) E_(2 i + 1) \( s \) . $
  If $a > rho$, use the node total instead. Dividing by $E_(2 i + 1) \( s \)$ gives the bound
  $ C T^(- J_0) U^m \( R \/ s \)^(m - 2 - epsilon) lt.eq C T^(- J_0 + 4 N max \( m - 2 \, 0 \))
    U^(m + max \( m - 2 \, 0 \)) lt.eq C . $
  In the middle inequality a negative exponent of $R \/ s$ is discarded; for a positive exponent use $R \/ s lt.eq
    C U T^(4 N)$. Consequently, in both cases,
  #[#set math.equation(numbering: n => "(4.26)")
   $ r^(- m) tau \( B_(L r) \( y \) \) lt.eq C T^(max \( m - 1 \, 0 \)) E_(2 i + 1) \( s \) =
     o \( 1 \) . $ <ct:cell-density>]
  Since $tau$ includes $\| M \| = \| pi_(\#) mu - Q "vol"_S \|$,
    choose a fixed nonnegative smooth mass test on this enlarged ball,
    normalized to reference integral one and with bounded scaled derivatives.
    Its average differs from $Q$ by at most the right side times a fixed constant, hence by less than $1 \/ 4$.
    This identifies $Q$ directly in 7, and also provides its mass and energy hypotheses.
    Apply 7 at $s = v_1$ on a cover by these cells and sum with the comparable Gaussian weights, as in 10.
    The cutoff at $C sqrt(T) thin v_1$ has arbitrarily small exponential tail for a large fixed $C$,
    using the node total and $v_1 gt.eq r_b$.
  The identity in 11, integrated using the nonnegative bank $Z$, gives
  #[#set math.equation(numbering: n => "(4.27)")
   $ A \( s \) gt.eq A \( s_0 \) + integral_(s_0)^s v^2 R_v thin #h(-0.16667em) d log v + Z \( s \) -
     C \( log T \)^(- 58) I_1 \, wide s_0 lt.eq s lt.eq rho . $ <ct:nearhit-bank>]
  The geometric errors are absorbed by part of the remaining margin $eta nu \/ 4$:
    on $\| u \| lt.eq T$ they carry the factor $C e^(- kappa T) \( 1 + T^2 \) = o \( eta \)$,
    and the tails are negligible under (4.23) and the node total. The nonnegative $C_Q Lambda$ term has been discarded.
  There is a fixed $c_1 > 0$ such that $A \( v_1 \) gt.eq c_1 I_1$.
    This includes a current hit with $q_(v_1) > lambda_(v_1)$:
    although its current test is omitted, the next larger mesh scale $t_(+) lt.eq 2 v_1$ obeys $tau_(t_(+)) lt.eq
    2 E_(2 i + 1) \( t_(+) \)$, and $G_(v_1) lt.eq \( t_(+) \/ v_1 \)^m G_(t_(+))$ bounds its current average.
    Only $q_(v_1) gt.eq 1$ is needed for the lower bound.
  For an explicit cumulative-sign argument, fix $C_Q gt.eq 1$ first and let $C_s$ be the constant in (4.25).
    Write $E_1 = E_(2 i + 1) \( v_1 \)$ and take $T$ large enough that its tail is at most $E_1 \/
    2$ and $c \( T \) lt.eq 1 \/ 2$. Then
  $ \( D + Lambda \)_(v_1) gt.eq alpha E_1 \, wide alpha = frac(1, 2 \( C_s + 1 \)) . $
  If $A \( v_1 \) lt.eq c_1 I_1$ with $c_1 lt.eq alpha \/ 8$, then $L'_(v_1) lt.eq
    2 c_1 E_1 - \( D + Lambda \)_(v_1) \/ 2 lt.eq - beta E_1$, where $beta = alpha \/ 4$.
    For $v in \[ v_1 \, 2^(1 \/ 4) v_1 \]$, differentiating the fixed source $L'$ and dominating $\|
    dot(G)_v \|$ by $C G_(2 v)$ gives $\| dot(L)'_v \| lt.eq K_1 E_1$.
    The constant $K_1$ is fixed after $C_Q$; the envelope at $2 v$ follows from strictly larger mesh tests,
    and $v_1 < rho \/ 16$ leaves room. In particular this estimate does not use the omitted current test or
    differentiate the fixed far cutoff. Choose
  $ theta = min { 1 / 4 log 2 \, beta \/ \( 2 K_1 \) } \, wide gamma = beta theta \/ 2 \, wide 0 < c_1 lt.eq
    min { alpha \/ 8 \, gamma \/ 4 } . $
  On $\[ v_1 \, e^theta v_1 \]$ one has $L'_v lt.eq - beta E_1 \/ 2$, hence $dot(Z) lt.eq - beta I_1 \/ 2$.
    Nonnegativity of $Z$ at the right endpoint gives $Z \( v_1 \) gt.eq gamma I_1$.
    Finally take $T$ large enough that the error in (4.27) is at most $gamma I_1 \/ 2$.
    That inequality at $v_1$ yields $A \( v_1 \) gt.eq gamma I_1 \/ 2 > c_1 I_1$, a contradiction.
    All constants were fixed before this last largeness threshold;
    only the cumulative sign of $Z$ was used at later scales.
  The upper differential inequality $dot(A) lt.eq 2 A + v^2 R_v +$ absorbed errors, again from 11,
    and $v_1 \/ s_0 lt.eq \( log T \)^20$ now yield
  #[#set math.equation(numbering: n => "(4.28)")
   $ A \( s_0 \) + integral_(s_0)^(v_1) v^2 R_v thin #h(-0.16667em) d log v gt.eq
     c \( log T \)^(- 40) I_1 . $ <ct:nearhit-surplus>]
  One may retain the geometric error explicitly in the integrating factor formula:
    divided by $I_1$ it is $O \( e^(- kappa T) T^C \/ epsilon \)$,
    hence smaller than every fixed inverse power of $log T$. Inserting (4.28) in (4.27) at $rho$ gives
    $A \( rho \) gt.eq c \( log T \)^(- 40) I_1$. On the other hand the node mass gives
  $ A \( rho \) lt.eq C rho^2 \( R \/ rho \)^m E_(2 i) \( R \) =
    C T^(J_0 \( 2 i + 1 \) + 4 N \( m - 2 \)) d R^(- epsilon) \, wide I_1 = T^(J_0 \( 2 i + 2 \)) d v_1^(- epsilon) . $
  The ratio of the upper bound to $I_1$ is at most $C T^(- J_0 + 4 N \( m - 2 \))$, contradicting (4.12).
    This excludes current hits and all side equalities within the stated logarithmic factor.
  ===== 4.3.4 Gaussian children and the bottom. <gaussian-children-and-the-bottom.>
  For any remaining contact, configurations on the Gaussian cells at $s_0$ match the node configuration with
    movement at most $e^b sqrt(d)$. Here is the comparison chain for a cell with work radius comparable to $s_0 \/
    U$, where $U = 1 + \| y - x \| \/ s_0 lt.eq C sqrt(T)$. First shrink concentrically at $x_(*)$ to a small
    fixed multiple of $R$, move the center to $x$ at that radius,
    and then shrink concentrically to a work radius comparable to $U s_0$.
    Move the center to $y$ at that radius and finally shrink to the cell radius.
    At each stage change radii by factors at most two and make center steps at most one quarter of the smaller
    inner majority radius. All these inner balls satisfy (4.8),
    so (4.9) bounds the changes by the sum of their local matching errors.
    The initial fixed chain stays inside $B_(4 R) \( x_(*) \)$;
    the off-center chain at scale $s_0$ lies in $B_(C U s_0) \( x \) subset B_(2 R) \( x_(*) \)$.
    The envelope bounds these increments by (4.15), with fixed polynomial losses.
    More explicitly, above $rho$ the node total gives, for $rho lt.eq t lt.eq c R$,
  $ t sqrt(t^(- m) tau \( B_(c t) \( x \) \)) lt.eq C R sqrt(E_(2 i) \( R \)) thin T^(2 N max \( m - 2 \, 0 \)) . $
  Off-center balls nested from scale $U s_0$ down to $s_0 \/ U$ have the same increment bound as $s_0
    sqrt(E_(2 i + 1) \( s_0 \))$, with another fixed power of $U lt.eq C sqrt(T)$,
    by the raw estimates proving (4.26). All normalized bounds used for intermediate configurations are at most a
    fixed power of $T$ times $E_(2 i) \( R \)$ or $E_(2 i + 1) \( t \)$ for $t gt.eq c r_b \/ T^2$.
    Hence they tend to zero by (4.14). Their $\| M \|$ terms give the same smooth mass test selecting $Q$,
    and 9 is applied with the fixed $delta_(upright("maj"))$ before each matching.
    The logarithms of all these factors are $O_(J_0 \, N \, m) \( \( log T \)^2 \) +
    O \( \( log T \)^60 \)$ after division by $sqrt(d)$. Since there are $O \( T \)$ steps,
    (4.15) proves the claimed $e^b sqrt(d)$ allowance.
  Here is the precise normalization of the cells. A smooth partition of unity on $\| u \| lt.eq C sqrt(T)$,
    where $u = \( y - x \) \/ s_0$, can be chosen with bounded overlap on balls $B_(r_j) \( y_j \)$, with
  #[#set math.equation(numbering: n => "(4.29)")
   $ r_j asymp frac(s_0, 1 + \| y_j - x \| \/ s_0) \, wide \| nabla chi_j \| lt.eq C \/ r_j . $ <ct:gaussian-cells>]
  Use a sufficiently small fixed constant in $asymp$ to leave room for $B_(4 r_j) \( y_j \)$.
    This follows, for example, by a maximal disjoint selection for the Lipschitz radius function in (4.29),
    followed by normalized smooth bumps. On the enlarged ball,
    $G_(s_0) \( x - y \)$ differs from $G_(s_0) \( x - y_j \)$ by a fixed factor,
    and its logarithmic gradient is $O \( r_j^(- 1) \)$. Thus
  $ w_j \( y \) = frac(chi_j \( y \) G_(s_0) \( x - y \), C G_(s_0) \( x - y_j \)) $
  is an admissible child weight after a fixed normalization. In particular, this normalization has no power of $T$.
  The child’s unweighted density was estimated in (4.26). The identity
  $ E_(2 i + 2) \( r_j \) = T^(J_0) E_(2 i + 1) \( s_0 \) \( s_0 \/ r_j \)^(2 + epsilon) $
  then gives
  $ r_j^(- m) tau \( B_(4 r_j) \( y_j \) \) lt.eq C T^(max \( m - 1 \, 0 \)) E_(2 i + 1) \( s_0 \) lt.eq
    C E_(2 i + 2) \( r_j \) \, $
  by the choice of $J_0$, with $C$ independent of $i \, T$. Also $r_j gt.eq c r_b \/ sqrt(T) gt.eq c r_b \/ T^2$.
    The smooth mass test following (4.26) identifies $Q$ on each child.
    After scaling its work ball to one, choose from 9 a majority configuration on $B_(r_(upright("maj")))$ with
    local upper bound $C r_(upright("maj"))^(- m) E_(2 i + 2) \( r_j \)$.
    Using the same normal frame, multiply its heights by $r_j$ to return to the root coordinates.
    The matching argument above gives its allowance relative to $cal(A)$,
    so these are admissible next-generation nodes. Although the raw density estimate loses a polynomial factor,
    summation of the resulting estimates does not: bounded overlap and Gaussian comparability give
  #[#set math.equation(numbering: n => "(4.30)")
   $ sum_j G_(s_0) \( x - y_j \) #scale(x: 120%, y: 120%)[\[] tau \( B_(4 r_j) \( y_j \) \) +
     d r_j^m #scale(x: 120%, y: 120%)[\]] lt.eq C #scale(x: 120%, y: 120%)[\(] tau_(s_0) \( x \) +
     d #scale(x: 120%, y: 120%)[\)] . $ <ct:cell-sum>]
  The fixed $d$ floors therefore sum to the correct constant-density Gaussian average.
  At a bottom contact $s_0 = r_b$, these cells are small nodes.
    The stationary-piece argument above, including (4.21), bounds $L'_(s_0)$ by $o \( eta \) nu_(s_0)$.
    The Gaussian tail outside $C sqrt(T)$ is $o \( eta \) d$ for a sufficiently large fixed $C$:
    combine its $e^(- C^2 T \/ 4)$ factor with total node mass and $s_0^(- m) lt.eq exp \( O \( T \) \)$.
    This contradicts (4.7); there are no bottom contacts. At any other remaining contact the next-generation bound
    and (4.30) give
  #[#set math.equation(numbering: n => "(4.31)")
   $ h_(s_0) \( x \) lt.eq C_0 p_(i + 1) nu_(s_0) \( x \) . $ <ct:child-contact-bound>]
  All omitted tails are absorbed by the subtractive margin in (4.7).
    In particular, every remaining contact is a vertical-side contact with some equality scale
  #[#set math.equation(numbering: n => "(4.32)")
   $ v_1 \/ s_0 > \( log T \)^20 . $ <ct:remote-side>]
  ===== 4.3.5 First charging step: replace a Gaussian by a nearby ball. <first-charging-step-replace-a-gaussian-by-a-nearby-ball.>
  Put $J = log T$ and $p = p_(i + 1)$. Call a contact $\( x \, s \)$ good if some closed ball of radius $0 < r
    lt.eq J s$ satisfies
  #[#set math.equation(numbering: n => "(4.33)")
   $ h \( overline(B)_r \( x \) \) lt.eq A_0 p nu \( overline(B)_r \( x \) \) \, $ <ct:good-ball>]
  where $A_0 gt.eq 2 C_0$ is a fixed constant. Otherwise call it bad.
    We first show that all bad centers together carry only $o \( eta \) cal(N)_R$ mass of $h$.
  For the Euclidean Gaussian, radial layer cake gives
  $ nu_s \( x \) = c_m s^(- m) integral_0^oo t e^(- t^2 \/ 2) nu \( B_(t s) \( x \) \) thin #h(-0.16667em) d t . $
  At a bad contact the failure of (4.33) for every $r lt.eq J s$ bounds the part with $t lt.eq
    J$ by $h_s \/ \( A_0 p \)$. Define the remaining layer-cake tail by
  $ cal(T)_(J \, s) nu \( x \) = c_m s^(- m) integral_J^oo t e^(- t^2 \/ 2) nu \( B_(t s) \( x \) \) thin
    #h(-0.16667em) d t . $
  This is a tail in the layer-cake radius: it includes the residual weight $c_m s^(- m) e^(- J^2 \/ 2)
    nu \( B_(J s) \( x \) \)$ as well as mass farther away. Combining $nu_s lt.eq h_s \/ \( A_0 p \) +
    cal(T)_(J \, s) nu$ with (4.31) gives
  #[#set math.equation(numbering: n => "(4.34)")
   $ h \( B_(5 s) \( x \) \) lt.eq C_m s^m h_s \( x \) lt.eq C_m p s^m cal(T)_(J \, s) nu \( x \) . $ <ct:bad-tail>]
  Let $E_(upright("bad"))$ consist of spatial contact centers that admit no good representative;
    for each of them assign one contact scale. The elementary $5
    r$ covering lemma selects disjoint assigned balls whose fivefold enlargements cover these centers.
    Their scales lie in $\[ r_b \, rho \]$, hence in $O \( T \)$ dyadic bins.
    In a bin $\[ a \, 2 a \)$, disjointness implies, for every $y$ and $t gt.eq 1$,
  $ sum_j upright(bold(1))_(B_(t s_j) \( x_j \)) \( y \) lt.eq C_m \( 1 + t \)^m : $
  the disjoint balls of radius at least $a$ have centers in a ball of radius $C t a$.
    Sum (4.34), use Tonelli, and then sum the bins to obtain
  #[#set math.equation(numbering: n => "(4.35)")
   $ h^(*) \( E_(upright("bad")) \) lt.eq C_m p T \( 1 + J \)^(m + 1) e^(- J^2 \/ 2) nu \( X \) =
     o \( eta \) cal(N)_R . $ <ct:bad-total>]
  Here $h^(*)$ denotes outer measure, so no measurable choice of a contact above each center is needed.
    The same proof on the torus uses periodic lifts of $h \, nu$:
    the small selected balls have disjoint lifts, the packing estimate is unchanged,
    and the periodic Gaussian is exactly the sum over those lifts.
    Alternatively the nonnearest copies can be absorbed in the exponentially smaller chart tail.
  ===== 4.3.6 Second charging step: localize the union of good balls. <second-charging-step-localize-the-union-of-good-balls.>
  Every good ball lies in a set determined only by the node’s tests and thresholds.
    To see this, let $\( x \, s \)$ be its contact and choose the equality scale $v_1$ in (4.32).
    For every mesh scale $v gt.eq v_1$ and every $\| y - x \| lt.eq J s$, Gaussian differentiation gives
  #[#set math.equation(numbering: n => "(4.36)")
   $ \| nabla q_v \( y \) \| lt.eq C \/ v . $ <ct:q-gradient>]
  Indeed $\| nabla G_v \( y - z \) \|$ is bounded by $C v^(- 1) G_(2 v) \( x - z \)$ when $\| y - x \| lt.eq
    v \/ 10$; the envelope at $2 v$ proves the assertion when $2 v lt.eq rho$.
    For $2 v > rho$ the node total and the top slack following (4.22) give the same bound.
    Since $J s \/ v_1 < J^(- 19)$, for sufficiently large $T$ every point of the good ball satisfies
  #[#set math.equation(numbering: n => "(4.37)")
   $ q_v \( y \) lt.eq lambda_v + delta quad \( v > v_1 \) \, wide \| q_(v_1) \( y \) - lambda_(v_1) \| lt.eq
     delta \, wide delta = J^(- 15) . $ <ct:charged-tests>]
  Order the mesh scales $v'_1 \, dots.h \, v'_K$ from largest to smallest, and define the Borel set
  #[#set math.equation(numbering: n => "(4.38)")
   $ cal(E)_lambda =
     union.big_(k = 1)^K
     [{ \| q_(v'_k) - lambda_(v'_k) \| lt.eq delta } ∩ ⋂_(j < k) { q_(v'_j) lt.eq lambda_(v'_j) + delta }] .
     $ <ct:threshold-event>]
  Equation (4.37) says that every original good ball, not just its center, lies in $cal(E)_lambda$.
  We use the following form of the Besicovitch covering theorem #cite(label("Simon2018")) Chapter 1, Lemma 4.5.
    For a bounded set with one assigned positive-radius ball at each point and bounded assigned radii,
    there is a countable subfamily covering the set by the original balls,
    with multiplicity bounded by a dimensional constant $N_m$. Arbitrarily small assigned radii are allowed.
    One proof groups the radii into dyadic bins and, in decreasing bins, greedily selects uncovered centers.
    The selected centers in each bin are separated by that bin’s minimum radius,
    so only finitely many are needed in a bounded region. For the overlap bound at a point,
    divide directions into finitely many cones of angular diameter less than $pi \/ 3$.
    In a cone take the first selected center $x_i$ among balls containing the point $y$.
    For a later such center $x_j$, the cosine law gives $\| x_i -
    x_j \| < max \( \| x_i - y \| \, \| x_j - y \| \) lt.eq max \( r_i \, r_j \)$.
    Since $x_j$ was not covered by the earlier ball, $\| x_i - x_j \| > r_i$; hence $r_j > r_i$.
    The decreasing order of the dyadic bins forces these two radii into the same bin.
    Packing in that bin bounds the number. A selected center equal to $y$ contributes at most one additional ball.
    This proves the dimensional multiplicity bound.
  Choose one good contact and one good ball above each center that has such a representative,
    and apply this covering fact. Since the original balls lie in $cal(E)_lambda$, (4.33) gives
  #[#set math.equation(numbering: n => "(4.39)")
   $ h^(*) \( E_(upright("good")) \) lt.eq A_0 p sum_j nu \( B_j \) lt.eq
     A_0 N_m p nu \( cal(E)_lambda \) . $ <ct:good-total>]
  This is the reason for using original balls in this second covering;
    the inequality (4.33) need not hold on an enlargement.
  ===== 4.3.7 Choosing the thresholds. <choosing-the-thresholds.>
  The measure $nu$ and the functions $q_v$ are already fixed by the node.
    Choose independent thresholds at the mesh scales with distribution function
  #[#set math.equation(numbering: n => "(4.40)")
   $ F \( t \) =
     cases(delim: "{", 0 \, & t lt.eq 1 \,, exp #scale(x: 120%, y: 120%)[\(] 1 - 1 \/ \( t - 1 \)
     #scale(x: 120%, y: 120%)[\)] \, & 1 < t < 2 \,, 1 \, & t gt.eq 2 .) $ <ct:threshold-law>]
  For every fixed $K_0 > 0$, uniformly in real $z$,
  #[#set math.equation(numbering: n => "(4.41)")
   $ bb(P) { \| lambda - z \| lt.eq delta } lt.eq T^(- K_0) +
     C_(K_0) \( log T \)^(- 13) F \( z - delta \) . $ <ct:threshold-probability>]
  If $F \( z + delta \) lt.eq T^(- K_0)$ this is immediate. Otherwise, put $a_(*) = \( 1 + K_0 log T \)^(- 1)$.
    One has $z + delta - 1 gt.eq a_(*)$, also when $z + delta gt.eq 2$, and consequently $z - delta - 1 gt.eq
    a_(*) - 2 delta gt.eq a_(*) \/ 2$ for large $T$. Thus this case does not meet the lower endpoint $1$.
    On the part of $\[ z - delta \, z + delta \]$ below $2$ one has $\( log F \)' = \( t - 1 \)^(- 2) lt.eq
    4 \/ a_(*)^2 lt.eq C_(K_0) \( log T \)^2$; above $2$, $log F = 0$.
    Integration proves $F \( z + delta \) - F \( z - delta \) lt.eq C_(K_0) \( log T \)^(- 13) F \( z - delta \)$.
    Truncation at $2$ only decreases this difference. This proves (4.41), including intervals meeting either endpoint.
  Fix $y$, and write $z_k = q_(v'_k) \( y \)$ and $r_k = F \( z_k - delta \)$.
    At the $k$th event in (4.38), all preceding thresholds have survived, namely $lambda_(v'_j) gt.eq z_j -
    delta$. Independence, (4.41), and a union bound give
  $ bb(P) { y in cal(E)_lambda } & lt.eq K T^(- K_0) + C_(K_0) \( log T \)^(- 13) sum_(k = 1)^K r_k
    product_(j < k) \( 1 - r_j \)\
 & lt.eq K T^(- K_0) + C_(K_0) \( log T \)^(- 13) = o \( 1 \) . $
  The sum telescopes to $1 - product_k \( 1 - r_k \) lt.eq 1$;
    no disjointness of the candidate events has been assumed. Since $K = O \( T \)$, any fixed $K_0 > 2$ suffices.
    Integrating against the fixed measure $nu$ and using Tonelli supplies thresholds with
  $ nu \( cal(E)_lambda \) lt.eq o \( 1 \) nu \( X \) . $
  Choose such thresholds first, and only then construct the contact measure.
    This order makes independence explicit: the contact measure may depend on the chosen thresholds,
    but neither $nu$ nor $q_v$ does. For large $T$, the last bound pays for $A_0 \,
    N_m$ and the fixed factor between $nu \( X \)$ and $cal(N)_R$. Equations (4.35) and (4.39) imply
  $ h \( X \) lt.eq 1 / 2 p_(i + 1) cal(N)_R + o \( eta \) cal(N)_R . $
  Because $h \( X \) = integral w thin #h(-0.16667em) d L' - eta nu \( X \)$,
    this is (4.17) after increasing the fixed $C$.
  Finally solve the recurrence:
  $ p_0 lt.eq 2 C eta + 2^(- n_0) C_(*) \, wide 2^(- n_0) lt.eq T^(- 10 N log 2) . $
  At the initial node $cal(N)_1 lt.eq 2 d$. Increasing the fixed $N$ relative to the requested $P$ gives (4.11).
    There have been at most $n_0$ configuration changes, costing $\( n_0 + 1 \) e^b sqrt(d) lt.double S \( T \)
    sqrt(d)$ in total. Thus the fixed root separation and far cutoff used at every step are valid.
    A polynomial weight or dilation loss is handled by starting with a correspondingly larger $P$ and using the
    same Gaussian cell normalization. This proves the final assertion as well. ◻
]

== 5 The outward envelope and the low-frequency barrier <sec:excess>

We continue the induction for 13 at the integer $Q$. Thus 16 is available when $Q > 1$,
  using only the assertion at smaller integers. We shall construct a positive envelope $I \( s \)$ of future
  signed masses $A \( s \) = s^2 M_s$ and follow its logarithmic level $a \( s \) = log \( s^2 \/ I \( s \) \)$.
  The output in 21 is a traversal from $a = B$ to $a = 2 B$ in one of $Q$ fixed bands,
  with no merger of its height centers and with $k gt.eq B^(- epsilon_0)$ for the coefficient $k$ of the height
  moment, where $epsilon_0 > 0$ is fixed and small. This holds for every contact selected below whose outward
  vertical contains a threshold equality; 6 will turn the traversal into many scales with normal flux.

All heights in this section are in the scaled coordinates of 13;
  the quantities defining $Lambda$ retain their physical units.
  Gaussian averages are centered at the contact under consideration.
  The dot denotes differentiation with respect to $t = log s$.

Fix, in this order, a sufficiently large Gaussian exponent $K > 2 m + 100$,
  a sufficiently large inverse-polynomial exponent $P_0$, and the constants in the separated estimate.
  They may depend on $m \, n \, Q$ and the fixed coordinate bounds.
  Increasing these fixed constants only increases the lower threshold for $T$. Put

#[#set math.equation(numbering: n => "(5.1)")
 $ F = F_Q \( T \) \, wide eta = e^(- 2 F) \, wide a_0 = F^2 \, wide d_(*) = e^(- a_0) \, wide rho =
   eta^4 T^(- 2) . $ <ex:parameters>]

The elementary rate comparisons proved in 21 include $F = T^(o \( 1 \))$, $a_0 = o \( T \)$, and $\| log rho \| =
  o \( T \)$.

=== 5.1 Selection and the bottom boundary <selection-and-the-bottom-boundary>

Extend the localized measures to the fixed torus of 15, and write $nu = tau + d thin #h(-0.16667em) d y$,
  with $tau$ restricted to a fixed interior enlargement of the working set. For a weight $w$ in 13, use the source

#[#set math.equation(numbering: n => "(5.2)")
 $ f = w \( L - C_Q Lambda \) - eta nu . $ <ex:source>]

To prove the required upper bound it is enough to exclude $integral f gt.eq eta d$:
  the total mass of $nu$ is at most $C d$, and $\( C + 1 \) eta lt.eq e^(- F)$ for large $T$.

Start at $rho$, continue downwards while $tau_s \( x \) lt.eq d_(*)$,
  and stop at a threshold equality or at a positive bottom $sigma$.
  Use the continuous entrance boundary, including its vertical sides, from 14.
  At the top the continuation inequality is strict, since $tau_rho lt.eq C d rho^(- m) = o \( d_(*) \)$.
  Let $K_sigma$ denote this compact entrance boundary. Write $hat(h)_sigma$ for its contact measure,
  $h_sigma = \( pi_X \)_(\#) hat(h)_sigma$ for the spatial projection, and $cal(S)_sigma = "spt" hat(h)_sigma$.
  Both measures have mass $integral f$. In this section a contact means a point of $cal(S)_sigma$,
  where 14 supplies the pointwise and cumulative contact inequalities. At every contact $\( x \, underline(s) \)$,

#[#set math.equation(numbering: n => "(5.3)")
 $ \( h_sigma \)_(underline(s)) \( x \) lt.eq f_(underline(s)) \( x \) lt.eq C d_(*) \, wide tau_v \( x \) lt.eq
   d_(*) quad \( underline(s) lt.eq v lt.eq rho \) . $ <ex:threshold-control>]

Here and below source localization first places the contact in the fixed interior region and gives $w \( x \) >
  0$. The constants in (5.3) are independent of $sigma$.

Define the threshold event

$ cal(G)_sigma = { \( x \, u \) in K_sigma : med tau_v \( x \) = d_(*) upright(" for some ") v in \[ u \, rho \] } . $

The corresponding set of $\( \( x \, u \) \, v \)$ is closed in $K_sigma times \[ sigma \, rho \]$,
  by continuity of the Gaussian averages. Its projection $cal(G)_sigma$ is therefore compact and Borel.
  The strict top inequality excludes $v = rho$. If a boundary point above the bottom had no equality,
  the continuation inequalities would be uniformly strict on its compact outward interval;
  continuity would then make it an interior point. Hence $K_sigma \\ cal(G)_sigma$ consists precisely of bottom
  points with no threshold equality.

#thm([Lemma 5.1.])[
  (Vanishing contribution from the bottom).  #emph[The mass $hat(h)_sigma \( K_sigma \\ cal(G)_sigma \)$ is at most
$ o_(sigma arrow.b 0) \( 1 \) + C d_(*) d . $

 Every contact in $cal(G)_sigma$ has a scale $s_0 in \[ underline(s) \, rho \)$ with $tau_(s_0) \( x \) = d_(*)$.
   The inequalities (5.3) hold also when $underline(s) < s_0$.]
] <ex:bottom>

#proof[
  Only the first assertion needs proof. Put
  $ beta_sigma = \( pi_X \)_(\#) #scale(x: 120%, y: 120%)[\(] hat(h)_sigma #h(-0.16667em)
    harpoon.tr_(K_sigma \\ cal(G)_sigma) #scale(x: 120%, y: 120%)[\)] lt.eq h_sigma \, $
  and let $cal(C)_sigma$ be the centers of contacts in $K_sigma \\ cal(G)_sigma$.
    Assign these contacts to grid cubes of side $sigma$. If such a cube $J$ contains a contact $x_J$,
    the Gaussian lower bound on $J$, together with the contact inequality, gives
  $ h_sigma \( J \) lt.eq C sigma^m \( f_sigma \( x_J \) \)_(+) lt.eq C d_(*) sigma^m . $
  Since $beta_sigma lt.eq h_sigma$, this also bounds $beta_sigma \( J \)$. On an occupied half-open grid cube define
  $ g_sigma \|_J = C sup_(x in cal(C)_sigma ∩ J) \( f_sigma \( x \) \)_(+) \, wide overline(beta)_sigma =
    sum_J frac(beta_sigma \( J \), \| J \|) upright(bold(1))_J thin #h(-0.16667em) d y \, $
  and put $g_sigma = 0$ on unoccupied cubes. Then $overline(beta)_sigma lt.eq
    g_sigma thin #h(-0.16667em) d y$ and $0 lt.eq g_sigma lt.eq C d_(*)$. For every continuous test $phi$,
  $ lr(|integral phi thin #h(-0.16667em) d beta_sigma - integral phi thin #h(-0.16667em) d overline(beta)_sigma|)
    lt.eq omega_phi \( C sigma \) beta_sigma \( upright("chart") \) arrow.r 0 \, $
  where $omega_phi$ is its modulus of continuity.
  For a finite measure $lambda$, at almost every Lebesgue point of its absolutely continuous density one has
  $ sup_(\| x - y \| lt.eq C sigma) \| \( G_sigma * lambda \) \( x \) - lambda_(upright("ac")) \( y \) \| arrow.r 0 . $
  For the singular part the corresponding limit is zero almost everywhere.
    To check the assertion, decompose into dyadic annuli about $y$;
    the differentiation bound on the mass in each sufficiently small ball is uniform in the indicated
    displacement, and the remaining annuli have an exponentially small Gaussian weight.
    Apply this first to smooth approximations of the absolutely continuous part and then to its $L^1$ remainder.
    Apply this assertion simultaneously to $tau$ and $f$. If $tau_(upright("ac")) \( y \) > d_(*)$,
    the cube containing $y$ is eventually unoccupied, since all its contacts satisfy $tau_sigma lt.eq d_(*)$.
    At every other simultaneous differentiation point the uniform displacement bound controls the supremum
    defining $g_sigma$. Therefore
  $ limsup_(sigma arrow.b 0) g_sigma \( y \) lt.eq
    C upright(bold(1))_({ tau_(upright("ac")) lt.eq d_(*) }) \( f_(upright("ac")) \)_(+) \( y \) quad
    upright("almost everywhere") . $
  Reverse Fatou, using the common majorant $C d_(*)$ on the fixed chart,
    and the weak-test estimate above show that every bottom limit has density bounded by
  #[#set math.equation(numbering: n => "(5.4)")
   $ C thin upright(bold(1))_({ tau_(upright("ac")) lt.eq C d_(*) }) \( f_(upright("ac")) \)_(+) .
     $ <ex:bottom-density>]
  The value of the fixed constant in the threshold is immaterial.
  At a point in this set, the area formula and 5 give exactly $Q$ projection entries,
    counted with their integer multiplicities. Indeed the difference between their integer count and $Q$ is
    bounded by $C tau_(upright("ac")) < 1$. Every entry has $e lt.eq C d_(*)$;
    an entry with larger tilt would itself contribute more to the projected density of $D$.
    The part on which the projection has deficient rank projects to a Lebesgue null set,
    by the area formula for rectifiable sets. The expansion of the projection Jacobian at each remaining entry is
  $ 2 \( 1 - J_pi \) - e lt.eq C e^2 + C #scale(x: 120%, y: 120%)[\(] \| z_(upright("phys")) \|^2 + \| H_S \|^2
    #scale(x: 120%, y: 120%)[\)] . $
  Sum this inequality with weight $theta \/ J_pi$. Since the count is $Q$,
    its left side is exactly the density of $L$, with respect to base volume.
    Taking $C_Q$ large enough absorbs the displayed geometry term and gives $\( f_(upright("ac")) \)_(+) lt.eq
    C d_(*) D_(upright("ac"))$ on the set in (5.4). Its integral is at most $C d_(*) d$.
    Compactness and (5.4) prove the stated uniform limsup bound, hence the assertion. ◻
]

=== 5.2 The future envelope <the-future-envelope>

Fix a contact in $cal(G)_sigma$, and suppress $x$ and $sigma$ from the notation. Define

#[#set math.equation(numbering: n => "(5.5)")
 $ f_(*) & = L - C_Q Lambda - eta / 4 \( tau + d thin #h(-0.16667em) d y \) \, wide A \( s \) = s^2 M_s \,\
Z \( s \) & = integral_(underline(s))^s v^2 \( f_(*) \)_v thin #h(-0.16667em) d log v \, wide J \( s \) =
  C_Q s^2 Lambda_s + eta / 4 s^2 \( tau_s + d \) . $ <ex:path-variables>]

The localization inequality and the contact inequalities imply

#[#set math.equation(numbering: n => "(5.6)")
 $ Z \( s \) gt.eq 0 \, wide \( f_(*) \)_(underline(s)) gt.eq 0 \, wide A \( s \) gt.eq Z \( s \) \, wide
   dot(A) gt.eq dot(Z) . $ <ex:bank>]

Here $A \( underline(s) \) gt.eq 0$. To verify the last two assertions,
  use 11 and integrate the nonnegative radial term and the margin.
  The geometric error is absorbed in, for example, half of the $eta nu \/ 4$ margin.
  Uniformly down to the bottom, split its Gaussian integral at $\| y - x \| \/ s = T$.
  On the body its coefficient is $C e^(- kappa T) \( 1 + T^2 \) lt.double eta$;
  on the tail use (5.3) at larger Gaussian scales and the total mass above $rho$. The tail is $o \( eta d \)$.
  Thus this absorption uses no lower bound on $underline(s)$.
  Only the first contact scale has a pointwise sign; (5.6) is the sign information used at subsequent scales.

To compare configurations at different scales, we need one quantity that controls the unsigned excess averages at
  larger scales up to $rho$, allowing a fixed power of the radius ratio.
  The next lemma obtains it from future signed mass. At a maximizing scale $v$ for a weighted future
  $tau$-average, a value of $A \( v \)$ that is a sufficiently small multiple of $v^2
  tau_v$ would make $f_(*)$ negative on a short outward interval, spending more of $Z$ than $0 lt.eq Z lt.eq
  A$ allows. The resulting envelope also controls the Gaussian tails needed for the height comparison.

#thm([Lemma 5.2.])[
  (Future envelope).  #emph[Set
#[#set math.equation(numbering: n => "(5.7)")
 $ I \( s \) = max {sup_(s lt.eq v lt.eq rho) \( s \/ v \)^K A \( v \) \,
   thin \( s \/ rho \)^K rho^2 d rho^(- 2 m - 4)} \, wide a \( s \) = log frac(s^2, I \( s \)) . $ <ex:future>]

 Starting at a threshold scale $s_0$, stop at the first scale $s_(*)$ with $a \( s_(*) \) = T \/ 2$.
   This scale exists, and on the path $\[ s_0 \, s_(*) \]$ one has
#[#set math.equation(numbering: n => "(5.8)")
 $ a \( s_0 \) = a_0 + O \( 1 \) \, wide a \( s \) gt.eq a_0 - O \( 1 \) \, wide v^2 tau_v lt.eq
   C \( v \/ s \)^K I \( s \) quad \( s lt.eq v lt.eq rho \) . $ <ex:dilations>]

 The functions $I \, a$ are locally Lipschitz in $log s$. Almost everywhere they satisfy
#[#set math.equation(numbering: n => "(5.9)")
 $
   cases(delim: "{", I = A \, quad dot(I) = dot(A) \, & upright("on the reset set ") { I = A } \,, dot(I) = K
   I \, & upright("on its complement") \,) wide \| dot(a) \| + frac(\| dot(I) \| + \| dot(Z) \|, I) lt.eq
   C . $ <ex:derivatives>]

 Moreover $dot(Z) \/ I$ is locally Lipschitz, with derivative bounded by $C$.
   For every fixed $P$, weighted scalar control gives
#[#set math.equation(numbering: n => "(5.10)")
 $ \| M \|_s lt.eq C \( D_s + Lambda_s \) + a^(- P) I \( s \) \/ s^2 . $ <ex:weighted-scalar>]

 All constants are uniform in the contact and the bottom.]
] <ex:envelope>

#proof[
  Write $I_(upright("end"))$ for the artificial term in (5.7). The definition makes $I$ positive and continuous. Let
  $ J_tau \( s \) = sup_(s lt.eq v lt.eq rho) \( s \/ v \)^K v^2 tau_v . $
  We apply the following argument first at $s = s_0$, and then after initialization up to the first crossing of
    $a = T \/ 2$. At $s_0$ the threshold and $K > 2$ give the exact value $J_tau \( s_0 \) = s_0^2 d_(*)$,
    realized at $v = s_0$, whereas $I_(upright("end")) \( s_0 \) = o \( s_0^2 d_(*) \)$.
    At any later scale before that crossing, $I \( s \) \/ s^2 gt.eq
    e^(- T \/ 2)$ and $I_(upright("end")) \( s \) \/ s^2 lt.eq e^(- T + o \( T \))$,
    so $I$ is realized by an actual future value of $A$. Since $tau gt.eq \| M \|$, $J_tau gt.eq
    I > I_(upright("end"))$. At a maximizing scale $v$, writing $delta = tau_v$, these observations give
  #[#set math.equation(numbering: n => "(5.11)")
   $ e^(- T \/ 2) lt.eq delta lt.eq d_(*) \, wide tau_t lt.eq \( t \/ v \)^(K - 2) delta
     quad \( v lt.eq t lt.eq rho \) . $ <ex:maximizer-bounds>]
  The first lower bound holds at initialization as well. For any fixed $N$, a maximizer with $v gt.eq
    rho \/ T^N$ would, by the root total mass bound, satisfy
  $ frac(J_tau \( s \), I_(upright("end")) \( s \)) lt.eq C rho^(m + 4) T^(N \( K + m - 2 \)) = o \( 1 \) \, $
  which is impossible. Thus all fixed polynomial dilations needed below,
    including the body $C sqrt(\| log delta \|) thin v$, lie within $rho$.
  Here is the raw density estimate on that body. A cell centered at $y$, with $\| y - x \| lt.eq
    R v$ and radius $r = c v \/ \( 1 + R \)$, lies with its fixed enlargement inside a ball of radius
    $C \( 1 + R \) v$ about $x$. The Gaussian lower bound at that radius and (5.11) imply
  #[#set math.equation(numbering: n => "(5.12)")
   $ r^(- m) tau \( B_(4 r) \( y \) \) lt.eq C \( 1 + R \)^(2 m + K - 2) delta . $ <ex:cell-density>]
  For $R lt.eq C sqrt(\| log delta \|)$ this is small, uniformly in $delta lt.eq d_(*)$.
    Moreover $tau$ includes $\| M \| = \| pi_(\#) mu - Q "vol"_S \|$,
    so the normalized smooth mass average on each cell is close to that same $Q$.
    The integer in 7 is therefore $Q$ on every cell. The Gaussian has a bounded ratio on a fixed enlargement of
    such a cell, and 10 sums the estimates with bounded overlap.
  Annular summation of (5.11) bounds the Gaussian tail beyond $R v$, including any fixed derivative polynomial,
    by $C delta "poly" \( R \) e^(- c R^2)$ up to $rho$. Above $rho$ the root mass bound gives a remainder at most
    $C d v^(- m) "poly" \( rho \/ v \) e^(- c \( rho \/ v \)^2)$.
    Since $v < rho \/ T^N$, $delta gt.eq e^(- T \/ 2)$, and $\| log rho \| = o \( T \)$, this is $o \( delta \)$,
    uniformly even as $v$ tends to zero. Increasing the fixed body constant makes the full tail $o \( delta \)$.
    Consequently
  $ \| M \|_v lt.eq C \( D_v + Lambda_v \) + o \( tau_v \) \, wide tau_v lt.eq C \( D_v + Lambda_v \) . $
  Suppose $A \( v \) lt.eq epsilon v^2 tau_v$. For $C_Q$ sufficiently large and then $epsilon$ sufficiently small,
  $ \( f_(*) \)_v lt.eq - c tau_v . $
  Gaussian differentiation and the maximizing dilation bound show that the derivative, in logarithmic scale,
    of $2 M_r - D_r - C_Q Lambda_r$ is bounded by $C_K tau_v$ on a fixed short outward interval.
    Thus, for a fixed $theta.alt > 0$, $\( f_(*) \)_r lt.eq - c tau_v \/ 2$ on $\[ v \, e^theta.alt v \]$.
    The negative margin may simply be omitted in obtaining this upper bound. By (5.6),
  $ Z \( e^theta.alt v \) lt.eq Z \( v \) - c' theta.alt v^2 tau_v lt.eq epsilon v^2 tau_v -
    c' theta.alt v^2 tau_v < 0 $
  if $epsilon < c' theta.alt$. This contradicts the cumulative contact sign.
    Hence $A \( v \) gt.eq c v^2 tau_v$ at an uncontrolled maximizer.
    At $s_0$ this first proves $I \( s_0 \) gt.eq c s_0^2 d_(*)$;
    at each subsequent path scale it proves the last inequality in (5.8).
    This order uses only maximality and the root mass bound when establishing the raw cell estimates.
    The same cell argument, now using the proved dilation bound, gives (5.10) at every path scale;
    any prescribed inverse power is obtained by enlarging the Gaussian body constant.
  At $s_0$, the threshold equality and the just proved bound give $I \( s_0 \) gt.eq c s_0^2 d_(*)$.
    The opposite bound follows from $A \( v \) lt.eq v^2 d_(*)$, $K > 2$,
    and the negligible artificial endpoint term. For that last point, $d_(*) lt.eq
    C d s_0^(- m)$ implies $s_0 lt.eq C exp \( - \( T - a_0 \) \/ m \) lt.double rho$.
    At the outer endpoint the artificial term dominates, and the exact formula is
  $ a \( rho \) = T + \( 2 m + 4 \) log rho = T - o \( T \) > T \/ 2 . $
  Before the first crossing of $T \/ 2$, the nonendpoint terms have $I \( s \) \/ s^2 lt.eq d_(*)$,
    and the endpoint term has $I_(upright("end")) \( s \) \/ s^2 lt.eq d rho^(- 2 m - 4) = o \( d_(*) \)$.
    This proves the remaining assertions about the levels.
  On any compact logarithmic scale interval, $A$ is smooth and has bounded derivative.
    The supremum of $v^(- K) A \( v \)$ over $\[ s \, rho \]$, with the positive endpoint floor,
    is therefore locally Lipschitz. Its derivative vanishes unless its maximum is realized at the moving endpoint
    $v = s$. On the equality set, the derivatives of $I$ and $A$ agree almost everywhere.
    This proves the reset rule. Gaussian differentiation, the dilation bound,
    and 11 give $\| dot(A) \| + \| dot(Z) \| + \| dot.double(Z) \| lt.eq C I$.
    The constant $d$ term is negligible, since $s^2 eta d \/ I = eta d e^a lt.eq e^(- T \/ 2)$.
    Together with the reset rule these prove (5.9) and the assertion about $dot(Z) \/ I$.
  Finally all polynomial dilations in $a$ used here lie well inside the chart.
    Indeed $I \( s \) lt.eq C d s^(2 - m) + I_(upright("end")) \( s \)$, whereas $I \( s \) gt.eq
    s^2 e^(- T \/ 2)$ on the path. The endpoint term cannot account for this inequality.
    Thus $s lt.eq C e^(- T \/ \( 2 m \))$, up to an immaterial fixed weakening of the exponent.
    This proves the claimed interior room and justifies the uniform Gaussian cutoffs. ◻
]

=== 5.3 Height multipliers and initialization <height-multipliers-and-initialization>

For $Q > 1$, choose an increasing smooth function $b$ with

$ b \( x \) gt.eq \( log x \)^201 + 3 F_(Q - 1)^(- 1) \( \( log x \)^3 \) \, wide b \( x \) = x^(o \( 1 \)) \, $

using this displayed sum up to fixed factors. Write $S_1 \( x \) = exp \( C b \( x \) \)$.
  Its constant is large enough to dominate all polynomial and dilation losses in 16,
  including applications at $x - O \( log x \)$. A further fixed power is denoted by $S_h \( x \)$.
  When $Q = 1$, $S_h$ denotes only a sufficiently large fixed constant; no function $b$, separated estimate,
  or multiple well construction is used.

All configuration lists and joint moment or support witnesses below use the same fixed exceptional proportion
  $delta_(upright("maj"))$ when $Q > 1$; for $Q = 1$, fix one sufficiently small proportion as well.
  These proportions are chosen independently of $T$ and $a$,
  and their corresponding small-density thresholds in 9 are then fixed.
  The densities used below are bounded by fixed polynomials times $e^(- a_0)$ or $e^(- a)$, with $a gt.eq a_0 -
  O \( 1 \)$; hence they lie below those thresholds for large $T$.

Here is the precise multiplier convention. For a finite collection $cal(W) = { b_1 \, dots.h \,
  b_N }$ of distinct wells let $d_(cal(W)) \( z \) = "dist" \( z \, cal(W) \)$.
  There is a smooth function $Gamma_0$, comparable to $d_(cal(W))^2$, equal to $\| z -
  b_i \|^2$ within a fixed small fraction of the nearest-neighbor gap at each $b_i$, and satisfying

$ \| D Gamma_0 \|^2 lt.eq C Gamma_0 \, wide \| D^2 Gamma_0 \| lt.eq C . $

Construct it by the Whitney partition method #cite(label("Whitney1934")) on the complement of the wells:
  on a Whitney ball of radius comparable to distance from the wells, the squared distance has size $O \( r^2 \)$,
  first variation $O \( r \)$, and the partition derivatives have sizes $O \( r^(- 1) \)$ and $O \( r^(- 2) \)$.
  Patch to the exact quadratics on their disjoint near neighborhoods.
  This gives the asserted uniform derivative bounds. For one well take its exact square.

Choose a fixed smooth nondecreasing clipping function $chi$,
  equal to its argument near zero and constant for large arguments,
  with $chi \( t \)$ comparable to $min \( t \, 1 \)$, and set

#[#set math.equation(numbering: n => "(5.13)")
 $ Gamma_s \( z \) = s^2 chi \( Gamma_0 \( z \) \/ s^2 \) \, wide U \( s \) =
   integral G_s \( y - x \) Gamma_s \( z \) thin #h(-0.16667em) d mu \( y \, z \) . $ <ex:moment>]

We may arrange a smooth vector multiplier $V_b$, equal to $z -
  b_i$ in smaller near neighborhoods and vanishing outside the exact-quadratic neighborhoods and at distances
  comparable to $s$, such that

#[#set math.equation(numbering: n => "(5.14)")
 $ \| V_b \|^2 lt.eq Gamma_s \, wide \| D V_b \| lt.eq C \, wide \| D Gamma_s \|^2 lt.eq C Gamma_s \,
   wide \| D^2 Gamma_s \| lt.eq C . $ <ex:multiplier-bounds>]

Use disjoint radial cutoffs of $z - b_i$; their differentiated cutoffs multiply a displacement of the same size as
  their radius.

The transition set includes every point outside the smaller pure neighborhoods where either $D^2 Gamma_s eq.not 2
  "Id"$ or $D V_b eq.not "Id"$. In particular it includes the cutoff annuli of $V_b$ even if $Gamma_s$ is still
  exactly quadratic there. Its Gaussian tilt is denoted by $D_(upright("tr"))$.
  We account separately for Gaussian tails on which clipping occurs.
  In the one-well case all derivative-error regions lie in those tails, and $D_(upright("tr"))$ is omitted.

To state the initialization, write $N$ for the number of wells and, for a small positive parameter $k$, put $q = -
  k \/ a^2$. The comparison to be maintained is

#[#set math.equation(numbering: n => "(5.15)")
 $ k U + alpha Z lt.eq I \, wide alpha =
   cases(delim: "{", 1 + C_1 k a \/ log a \, & N > 1 \,, 1 + \( 1 - 4 k \) q - 2 k \, & N = 1 \,) $ <ex:comparison>]

where $C_1$ is a sufficiently large fixed constant. The next lemma chooses the wells and $k$ so that this
  inequality holds at $s_0$.

#thm([Lemma 5.3.])[
  (Initialization at a threshold or a side).  #emph[At $s_0$ one can choose at most $Q$ wells and a small
    parameter $k_0 > 0$ so that the barrier of 20 holds initially.
    If more than one well is used, one may arrange, for any fixed $P$,
$ Z \( s_0 \) lt.eq a_0^(- P) I \( s_0 \) \, wide U \( s_0 \) lt.eq C I \( s_0 \) \, $

 before any immediate mergers, with $k_0$ a small fixed constant. Alternatively there is one common well, with
$ U \( s_0 \) lt.eq C S_h \( a_0 \)^2 I \( s_0 \) \, wide I \( s_0 \) - Z \( s_0 \) gt.eq
  c S_h \( a_0 \)^(- 2) I \( s_0 \) \, wide k_0 = c S_h \( a_0 \)^(- 6) . $

 For $Q = 1$, $k_0$ is a small fixed constant.]
] <ex:initialization>

#proof[
  The bound on $s_0$ in the envelope proof gives $s_0 "poly" \( a_0 \) lt.double rho$.
    Threshold control on fixed enlargements therefore selects $Q$ by 7.
    Choose a joint majority-and-moment witness $cal(A)_0 = { a_1 \, dots.h \, a_Q }$ from 9 at scale $s_0$,
    using $B_(r_(upright("maj")) s_0) \( x \)$ and the fixed majority proportion when $Q > 1$,
    and a fixed concentric inner ball when $Q = 1$. Use its distinct entries as the initial wells.
    Put $R_0 = C_b sqrt(a_0)$, with a sufficiently large fixed $C_b > 2$.
    All fixed enlargements needed on $\| u \| lt.eq R_0$, where $u = \( y - x \) \/ s_0$, lie below $rho$.
    Threshold control gives normalized density at most $C d_(*)$ on these dilations.
    The dilation part of 10, applied only on this body, and $Gamma_(s_0) lt.eq C "dist" \( z \, cal(A)_0 \)^2$ give
  $ integral_(\| u \| lt.eq R_0) G_(s_0) Gamma_(s_0) thin #h(-0.16667em) d mu lt.eq C s_0^2 d_(*) . $
  The root mass identity and threshold control at $sqrt(2) s_0 < rho$ give
  $ \( pi_(\#) mu \)_(sqrt(2) s_0) lt.eq C + tau_(sqrt(2) s_0) + C s_0^(- m) e^(- c \/ s_0^2) lt.eq C . $
  The last term accounts for the fixed exterior-chart and periodic tails.
    Since $Gamma_(s_0) lt.eq C s_0^2$, Gaussian comparison yields
  $ integral_(\| u \| > R_0) G_(s_0) Gamma_(s_0) thin #h(-0.16667em) d mu lt.eq
    C s_0^2 e^(- R_0^2 \/ 4) \( pi_(\#) mu \)_(sqrt(2) s_0) lt.eq C s_0^2 e^(- C_b^2 a_0 \/ 4) = o \( s_0^2 d_(*) \) . $
  For the periodized kernel the split and comparison are made termwise in its lifts.
    Consequently $U \( s_0 \) lt.eq C s_0^2 d_(*) = O \( I \( s_0 \) \)$.
    If the contact itself is a threshold equality, then $Z \( s_0 \) = 0$, which gives the first initialization,
    with one well when $Q = 1$.
  Assume now that $underline(s) < s_0$. For $underline(s) lt.eq v lt.eq s_0$, put $R_y = \| y -
    x \| \/ v$ and consider the Gaussian work cell $B_r \( y \)$ with $r = c v \/ \( 1 + R_y \)$, where $R_y lt.eq
    C sqrt(a_0)$. For any fixed required enlargement $B_(L r)$,
    the Gaussian at $C_L \( 1 + R_y \) v$ is bounded below by a fixed multiple of $\( \( 1 + R_y \) v \)^(- m)$ on
    that enlargement. This scale lies in $\[ underline(s) \, rho \]$, so the threshold bound gives, in particular,
  #[#set math.equation(numbering: n => "(5.16)")
   $ r^(- m) tau \( B_(4 r) \( y \) \) & lt.eq d_c := C \( 1 + R_y \)^(2 m) d_(*) \,\
T_c := - log d_c & = a_0 - 2 m log \( 1 + R_y \) - O \( 1 \) \,\
r sqrt(d_c) & lt.eq C v \( 1 + R_y \)^(m - 1) sqrt(d_(*)) . $ <ex:threshold-cells>]
  The same estimate holds for $B_(L r)$ after changing its fixed constant.
    Since $d_c = o \( 1 \)$, it supplies small $D + Lambda$ energy and bounded normalized projected mass.
    Its $\| M \|$ part puts the normalized smooth mass average within $C d_c < 1 \/ 4$ of $Q$,
    so 7 selects that integer on every cell. The cell radius may be below $underline(s)$;
    the threshold is used only at the larger Gaussian scale.
  When $Q > 1$, scale $B_r \( y \)$ to one and choose a length-$Q$ majority list $cal(A)_(v \, y)$ on
    $B_(r_(upright("maj")))$ with local upper bound $r_(upright("maj"))^(- m)
    d_c$ and the fixed $delta_(upright("maj")) \, C_(upright("maj"))$, as required by 16.
    Multiply its heights by $r$ when comparing them in the fixed coordinates of this section.
    The overlap and matching rules (4.8)–(4.9) match these lists to $cal(A)_0$.
    Along concentric dyadic scales from $s_0$ to $v$, the increments $C r' sqrt(d_(*))$ at radius $r'$ sum to $C
    s_0 sqrt(d_(*))$. At the fixed scale $v$, enlarge to radius $C \( 1 + R_y \) v$,
    move the center in the prescribed steps, and shrink to $r$.
    All fixed enlargements in this part lie inside $B_(C' \( 1 + R_y \) v) \( x \)$;
    at an intermediate radius $r'$ their normalized densities are at most $C \( \( 1 + R_y \) v \/ r' \)^m d_(*)$.
    The matching increments therefore add only $C \( 1 + R_y \)^C v sqrt(d_(*))$.
    The total motion is bounded by a fixed polynomial in $a_0$ times $s_0 sqrt(d_(*))$,
    uniformly even as the bottom tends to zero.
  Suppose $cal(A)_0$ has at least two nonempty groups separated by more than $S_h \( a_0 \) s_0 sqrt(d_(*))$.
    Group the $Q$ entries of each $cal(A)_(v \, y)$ according to the corresponding separated groups of the initial
    wells. Matching preserves their nonemptiness, and their gaps exceed $10 S \( T_c \) r sqrt(d_c)$:
    the fixed power $S_h \( a_0 \)$ absorbs $S \( T_c \)$, the displayed cell factor, and the matching loss,
    since $T_c = a_0 - O \( log a_0 \)$. These length-$Q$ lists are the inputs to 16.
    The cell tests obtained by partitioning the nonnegative Gaussian are admissible after normalization in the
    cell coordinates. Bounded overlap and a sufficiently large input exponent absorb their fixed polynomial
    losses. In the curved case the physical cell radius is $l r$, and $T_c = o \( T \)$,
    so the original physical smallness implies the cell hypothesis.
    The threshold and root tail bounds from the envelope proof apply with controlling density $d_(*)$,
    uniformly down to $underline(s)$. Under nonnegative testing, $f_(*) lt.eq L - C_Q Lambda$,
    and the far term in 16 is nonnegative. The resulting bound, integrated in scale, gives
  $ Z \( s_0 \) lt.eq C a_0^(- P - 1) d_(*) integral_(underline(s))^(s_0) v^2 thin #h(-0.16667em) d log v lt.eq
    a_0^(- P) I \( s_0 \) . $
  Entries too close to remain separate are merged immediately by the rule below.
    Their moment before merging is $O \( I \( s_0 \) \)$.
  If there are no such separated groups, a chain through at most $Q$ entries of $cal(A)_0$ shows that its diameter
    is at most $C Q S_h \( a_0 \) s_0 sqrt(d_(*))$. Use one common well.
    Pointwise, the new clipped square is bounded by a fixed multiple of the old one plus the squared diameter.
    The preceding $U$-bound and bounded Gaussian mass therefore give the stated estimate for $U$.
    It remains to check the surplus of $I$ over $Z$. If $A \( s_0 \)$ is a sufficiently small fraction of
    $I \( s_0 \)$, this is immediate from (5.6). Otherwise $A \( s_0 \) gt.eq c I \( s_0 \)$.
    When $underline(s) gt.eq s_0 \/ 2$, the inequality $dot(A) lt.eq 2 A + s^2 R_s + upright("error")$ gives
  $ A \( underline(s) \) + integral_(underline(s))^(s_0) v^2 R_v thin #h(-0.16667em) d log v gt.eq c I \( s_0 \) . $
  These terms are retained in $A \( s_0 \) - Z \( s_0 \)$, after absorbing the error into the positive margin.
  When $underline(s) < s_0 \/ 2$, Gaussian differentiation and (5.3) give $\| dot(A) \( v \) \| lt.eq
    C v^2 tau_(2 v) lt.eq C v^2 d_(*)$ on $\[ s_0 \/ 2 \, s_0 \]$.
    Since $A \( s_0 \) gt.eq c I \( s_0 \) asymp s_0^2 d_(*)$,
    for some fixed $0 < theta.alt_0 < log 2$ one has $A \( v \) gt.eq
    c I \( s_0 \)$ throughout $\[ e^(- theta.alt_0) s_0 \, s_0 \]$.
    Apply 10 directly on this earlier interval, using the scalar hypotheses verified in (5.16).
    The tail implication in the envelope proof applies with controlling density $d_(*)$:
    here $v < rho \/ T^N$ for every fixed $N$, and $d_(*) gt.eq e^(- T \/ 2)$.
    It gives an $o \( d_(*) \)$ remainder uniformly in the bottom.
    Thus $\| M \|_v lt.eq C \( D_v + Lambda_v \) + o \( d_(*) \)$; because $M_v = A \( v \) \/ v^2 gt.eq c d_(*)$,
    this yields $D_v + Lambda_v gt.eq c d_(*)$.
  The surplus uses further information. Where $Lambda_v gt.eq c d_(*)$,
    the retained term $C_Q v^2 Lambda_v$ in $J \( v \)$ pays it directly.
    On the complementary portion $D_v gt.eq c d_(*)$. Let $V_v$ be displacement from the common well,
    smoothly clipped at distance comparable to $v$. Apply the moment part of 10 to joint configuration witnesses
    on the admissible dilations and match their centers to the common well.
    Gaussian summation absorbs their polynomial losses and gives
  $ integral G_v \| V_v \|^2 thin #h(-0.16667em) d mu lt.eq C v^2 S_h \( a_0 \)^2 d_(*) . $
  The support estimates for those chosen witnesses put all support heights on $\| y - x \| lt.eq C_b sqrt(a_0) v$ within
  $ v #scale(x: 120%, y: 120%)[\[] "poly" \( a_0 \) e^(- beta a_0) +
    S_h \( a_0 \) e^(- a_0 \/ 2) #scale(x: 120%, y: 120%)[\]] = o \( v \) $
  of the common well. Clipping is therefore absent on this body.
    For the clipped tail, $pi_(\#) mu = Q "vol"_S + M$ controls the bare mass as well as the defect.
    Since $log S_h \( a_0 \) = o \( a_0 \)$, taking the fixed $C_b$ sufficiently large makes the Gaussian mass
    tail $o \( d_(*) S_h \( a_0 \)^(- 2) \)$. The defect and chart tails obey the preceding uniform bounds.
  Choose one fixed root-chart cutoff $0 lt.eq chi lt.eq 1$, equal to one on the fixed working region,
    whose transition is at distance at least $h$ from that region and has width at least $c h$,
    decreasing $h$ to the available width. Then $parallel nabla chi parallel_oo lt.eq C \( 1 + h^(- 1) \)$;
    the first-variation product rule differentiates $chi$ once, while all scale derivatives leave it fixed.
    With $u = \( y - x \) \/ v$, normal stationarity in 12 now gives
  $ D_v lt.eq 1 / v lr(|integral G_v V_v dot.op P_(v h) u thin #h(-0.16667em) d mu|) + o \( d_(*) \) . $
  The factor $v^(- 1)$ is the Gaussian derivative. Retaining $\|
    V_v \|$ in the curved normal error and using its moment bound leaves relative error $e^(- kappa T)
    "poly" \( a_0 \, S_h \( a_0 \) \) = o \( 1 \)$; the normal identity introduces no further inverse power of
    $v$. Thus the flux has size at least $c v d_(*)$ on the $D$-portion.
    Cauchy–Schwarz and $\| P_(v h) u \|^2 lt.eq B \[ u \, u \]$ yield
  $ c v^2 d_(*)^2 lt.eq (integral G_v \| V_v \|^2 thin #h(-0.16667em) d mu) R_v lt.eq
    C v^2 S_h \( a_0 \)^2 d_(*) R_v \, wide v^2 R_v gt.eq c S_h \( a_0 \)^(- 2) v^2 d_(*) . $
  After the margin absorbs the errors, $dot(A) - dot(Z)$ retains $v^2 R_v + C_Q v^2 Lambda_v$;
    at all other scales it is nonnegative by (5.6). Integration over the fixed logarithmic interval therefore
    proves the surplus claimed in the statement. Since the one-well coefficient $alpha$ below is less than one,
    $k_0 = c S_h \( a_0 \)^(- 6)$ pays for the moment while leaving a strict initial inequality.
    The same proof for $Q = 1$ uses the Gaussian-summed moment with fixed $S_h$ and no separation step. ◻
]

=== 5.4 The barrier and its finite mergers <the-barrier-and-its-finite-mergers>

Normal stationarity and square completion bound $s^2 R_s$ from below in terms of $D_s$ and $U$,
  supplying the term that offsets growth of $k U$. With several wells,
  $alpha$ makes the coefficient of $dot(Z)$ in the derivative of $I - k U - alpha Z$ negative,
  so that the separated far-tilt gain absorbs the transition-tilt losses.
  The merger rule preserves this comparison with controlled losses, leaving the traversal required by 21.

#thm([Proposition 5.4.])[
  (Low-frequency barrier).  #emph[Along every path in 18, the wells can be chosen piecewise constantly,
    with at most $Q - 1$ mergers. There is a positive piecewise smooth parameter $k$,
    bounded above by a small fixed constant and satisfying between mergers
#[#set math.equation(numbering: n => "(5.17)")
 $ k_a / k = q = - k / a^2 \, $ <ex:k-evolution>]

 such that the comparison (5.15) holds. Here $C_1$ is fixed and sufficiently large.
   Uniformly along the path, $log \( 1 \/ k \) = o \( a_0 \)$ as $T arrow.r oo$.
   Before any hypothetical first failure of the barrier, the following estimates hold, with $cal(E) lt.eq
   a^(- P_0 \/ 2)$:
#[#set math.equation(numbering: n => "(5.18)")
 $ dot(U) & lt.eq 2 s^2 D_s + C s^2 D_(upright("tr")) + cal(E) I \,\
s^2 R_s & gt.eq 4 k \( s^2 D_s - C s^2 D_(upright("tr")) \) - 4 k^2 U - cal(E) k I . $ <ex:moment-derivative>]

 With more than one well, in addition,
#[#set math.equation(numbering: n => "(5.19)")
 $ dot(Z) + c_2 frac(\( log a \)^2, a) s^2 D_(upright("tr")) lt.eq a^(- P_0) I . $ <ex:transition>]

 The transition terms are absent with one well. By increasing the fixed exponents in the construction,
   $cal(E)$ can be smaller than any prescribed inverse power of $a$.]
] <ex:barrier>

#proof[
  We specify the mergers first. At stage $j$, merge a closest pair as soon as its gap $g$ satisfies
  #[#set math.equation(numbering: n => "(5.20)")
   $ g lt.eq s min { C_j e^(- gamma a) \, thin S_1 \( a \) e^(- a \/ 2) k^(- 1) } . $ <ex:merge-rule>]
  Retain one of the two centers. Take $gamma > 0$ sufficiently small,
    $C_(j + 1)$ a sufficiently large fixed multiple of $Q C_j$, and replace $k$ by
  #[#set math.equation(numbering: n => "(5.21)")
   $ k_(upright("new")) = c k^6 S_1 \( a \)^(- 6) . $ <ex:merge-k>]
  Perform further mergers immediately if required. For $Q = 1$ there is no merger rule.
    A common-well initialization when $Q > 1$ may be counted as an initial merger;
    it uses no more than the available $Q - 1$ losses.
  The solution of (5.17) on a stage starting at level $a_j$ is
  $ k \( a \)^(- 1) = k \( a_j \)^(- 1) + a_j^(- 1) - a^(- 1) . $
  Retracing levels therefore causes no accumulated loss. Since $a gt.eq a_0 - O \( 1 \)$,
    $k$ changes by at most a fixed factor on a stage. There are at most $Q - 1$ mergers,
    and their levels are at most $T \/ 2$. Thus
  $ log \( 1 \/ k \) lt.eq C_Q { 1 + b \( T \) + b \( a_0 \) } = o \( a_0 \) \, $
  where 21 verifies the final comparison. In particular $e^(- a) \/ k$ is exponentially small uniformly along the path.
  We next verify that the wells continue to represent the configuration.
    At a scale $s$, let $cal(A)_s$ be a length-$Q$ majority list on a fixed inner ball,
    using the fixed convention above when $Q > 1$. For support control,
    choose joint majority-and-support witnesses from 9 on the balls under consideration and match their centers to
    these lists. The support and matching bounds, together with (5.8),
    bound configuration changes on a ball of scale $v$, including polynomial enlargements,
    by $C v e^(- beta a \( v \))$ for some fixed $beta > 0$. Decrease $beta$ if necessary so that $beta \|
    dot(a) \| lt.eq 1 \/ 2$. Summing on a geometric sequence from $s_0$ to $s$ gives $C s e^(- beta a \( s \))$.
    The same estimate tracks each initial configuration entry.
    The additional displacement caused by previous mergers is bounded by the sum of their gaps.
    Choose $gamma lt.double beta$ and $gamma \| dot(a) \| lt.eq 1 \/ 2$.
    Then $s e^(- gamma a \( s \))$ increases outwards, and the successive enlargements of $C_j$ make all earlier
    capped gaps a small fixed fraction of the current cap. These facts give, in particular,
  #[#set math.equation(numbering: n => "(5.22)")
   $ "dist" \( z \, cal(W) \) lt.eq C s e^(- gamma' a) quad upright("on ") \| y - x \| \/ s lt.eq
     C sqrt(a) $ <ex:rough-height>]
  for some fixed $gamma' > 0$. This estimate does not use the barrier.
    It also bounds the distance from retained wells to the corresponding tracked configurations.
    The common-well initialization has the same property, since $log S_h \( a_0 \) = o \( a_0 \)$.
  While the barrier holds, each entry of $cal(A)_s$ is matched on a fixed majority of the inner ball to a
    projection entry within $C s e^(- a \/ 2)$. The area formula and the uniform upper bound for $J_pi$ give that
    entry a fixed amount of Gaussian mass. The bound $\| D Gamma_s \|^2 lt.eq
    C Gamma_s$ and the numerical barrier therefore give
  $ max_(xi in cal(A)_s) Gamma_s \( xi \) lt.eq C U + C s^2 e^(- a) lt.eq C s^2 e^(- a) \/ k . $
  Since $Gamma_s$ is comparable to $min { "dist" \( z \, cal(W) \)^2 \, s^2 }$ and $e^(- a) \/ k arrow.r 0$,
    every entry lies within $C s sqrt(e^(- a) \/ k)$ of a well.
    This distance is a small fraction of $S_1 \( a \) s e^(- a \/ 2) k^(- 1)$.
    It is also a small fraction of the cap, using $log \( 1 \/ k \) = o \( a_0 \)$;
    alternatively (5.22) gives that conclusion directly. When no merger is triggered,
    the resulting neighborhoods of the wells are disjoint. The group represented by a well is the sublist of
    $cal(A)_s$ in its neighborhood. When $Q > 1$, its integer count cannot change:
    on two sufficiently nearby scales the majority balls obey (4.8), their lists match by (4.9),
    and the matching error is much smaller than the gap. For $Q = 1$,
    the sole length-one group remains represented. At initialization each well is represented.
    At a merger the surviving neighborhood contains the entries of both merged wells after any further immediate
    mergers. This proves representation at every stage, including a first barrier equality.
  With several wells, $Q > 1$, so we may apply 16. For a Gaussian cell with $R_y = \| y - x \| \/ s lt.eq
    C sqrt(a)$ and $r = c s \/ \( 1 + R_y \)$, the dilation bound at $C \( 1 + R_y \) s$ gives
  #[#set math.equation(numbering: n => "(5.23)")
   $ r^(- m) tau \( B_(4 r) \( y \) \) & lt.eq d_c := C \( 1 + R_y \)^(2 m + K - 2) e^(- a) \,\
T_c := - log d_c & = a - \( 2 m + K - 2 \) log \( 1 + R_y \) - O \( 1 \) \,\
r sqrt(d_c) & lt.eq C s \( 1 + R_y \)^(m + K \/ 2 - 2) e^(- a \/ 2) . $ <ex:transition-cells>]
  The cell and its fixed enlargements lie in the chart, and $T_c = a - O \( log a \) arrow.r oo$.
    As in (5.16), the $\| M \|$ bound selects $Q$. In the cell coordinates choose a length-$Q$ majority list
    $cal(A)_(s \, y)$ on $B_(r_(upright("maj")))$, with local upper bound $r_(upright("maj"))^(- m)
    d_c$ and the fixed $delta_(upright("maj")) \, C_(upright("maj"))$,
    and multiply its heights by $r$ for comparison in the section coordinates.
    The off-center overlap chain from initialization now uses (5.8);
    matching to $cal(A)_s$ costs at most a fixed polynomial in $a$ times $s e^(- a \/ 2)$.
  Group the $Q$ entries of $cal(A)_(s \, y)$ by the represented wells to which their matches in $cal(A)_s$ belong.
    The wells index these nonempty groups; the input list still has length $Q$ after mergers.
    Before a merger, if the second threshold in (5.20) is smaller,
    the gap is larger than $S_1 \( a \) s e^(- a \/ 2) k^(- 1)$.
    This dominates the entry-to-well and cell matching errors and $10 S \( T_c \) r sqrt(d_c)$,
    by the choice of $S_1$. If the cap is smaller, the ratio of its gap to the last quantity tends to infinity,
    since it is bounded below by $exp \( \( 1 \/ 2 - gamma \) a - O \( b \( a \) \) - O \( log a \) \)$.
    Thus the groups meet the separation premise in both regimes.
    Away from the clipping tails, every point of the transition set is a fixed fraction of a gap from the
    represented groups, and remains in the cell’s far region after matching.
    This includes every extra annulus in $D_(upright("tr"))$.
  Apply 16 to the nonnegative normalized cell weights. Their polynomial Lipschitz costs are absorbed by taking its
    exponent larger than $P_0$, while $c \( T_c \) asymp \( log a \)^2 \/ a$.
    Bounded overlap and the Gaussian tails give total remainder $O \( a^(- P_0) I \/ s^2 \)$.
    The curved hypothesis is inherited because the physical cell radius is $l r$ and $T_c lt.eq T \/ 2 +
    O \( 1 \)$. This proves (5.19).
  We prove the two differential inequalities explicitly. In flat coordinates the horizontal test with multiplier
    $Gamma_s$ gives
  $ dot(U) = integral G_s { Gamma_s \( B \[ u \, u \] - e \) + s D Gamma_s dot.op P_(v h) u +
    dot(Gamma)_s } thin #h(-0.16667em) d mu \, wide u = \( y - x \) \/ s . $
  Normal stationarity with $G_s D Gamma_s$ converts the cross term to $s^2 integral G_s D^2 Gamma_s :
    P_(v v) thin #h(-0.16667em) d mu$. On the pure regions $D^2 Gamma_s = 2 "Id"$,
    and elsewhere its norm is bounded. Dropping $- Gamma_s e$,
    and using (5.22) to bound the $Gamma_s B \[ u \, u \]$ term, gives (5.18).
    The explicit derivative $dot(Gamma)_s = 2 s^2 \[ chi \( t \) - t chi' \( t \) \]$, $t = Gamma_0 \/ s^2$,
    is supported on the clipping region. That region does not meet the Gaussian body by (5.22).
  For the second inequality use $\| P_(v h) u \|^2 lt.eq B \[ u \, u \]$ and complete the square:
  $ s^2 R_s gt.eq 4 k s integral G_s V_b dot.op P_(v h) u thin #h(-0.16667em) d mu - 4 k^2 U . $
  Normal stationarity gives
  $ s integral G_s V_b dot.op P_(v h) u thin #h(-0.16667em) d mu = s^2 integral G_s D V_b :
    P_(v v) thin #h(-0.16667em) d mu gt.eq s^2 D_s - C s^2 D_(upright("tr")) $
  up to the already specified tails. This proves (5.18) in flat coordinates.
  For completeness the tails here also include terms involving mass without a tilt factor.
    Since $Gamma_s lt.eq C s^2$, the mass tail beyond $C sqrt(a)$ is bounded by $C s^2 e^(- c C^2 a)$,
    plus the dilation-controlled defect. Taking $C$ large makes this smaller than any required multiple of
    $a^(- P) I$. Terms with tilt use (5.8) directly. No inverse power of $k$ is required for these flat errors,
    because the derivative bounds in (5.14) are uniform. For the curved errors,
    keep the original coordinates scaled by the physical radius $l$, and write $chevron.l f chevron.r_s =
    integral G_s f thin #h(-0.16667em) d mu$ and $gamma_(upright("geom")) = l + sup \| z_(upright("phys")) \|$.
    The dilation bound gives $chevron.l \( 1 + \| u \|^2 \) \( e + lambda \) chevron.r_s lt.eq
    P \( a \) I \/ s^2$, where $P$ is a fixed polynomial and $lambda = \| z_(upright("phys")) \|^2 + \|
    H_S \|^2 + \| nabla H_S \|^2$. For either $v = V_b$ or $v = D Gamma_s$, $chevron.l \| v \|^2 chevron.r_s lt.eq
    C U lt.eq C I \/ k$ and $\| D v \| lt.eq C$. After multiplying the normal identity by $s^2$,
    the errors in 12 satisfy
  $ s^2 l chevron.l \| z_(upright("phys")) \| sqrt(e) chevron.r_s & lt.eq s^2 l sqrt(Lambda_s D_s) lt.eq
    C P \( a \) l I \,\
s^2 l chevron.l \| v \| \( \| H_S \| + \| z_(upright("phys")) \| + e + sqrt(e) \) chevron.r_s & lt.eq
  C s^2 l sqrt(U) sqrt(Lambda_s + D_s) lt.eq C P \( a \) l s k^(- 1 \/ 2) I \,\
gamma_(upright("geom")) s chevron.l \| u \| \| v \| sqrt(e) chevron.r_s & lt.eq
  gamma_(upright("geom")) s sqrt(U) sqrt(chevron.l \| u \|^2 e chevron.r_s) lt.eq
  C P \( a \) gamma_(upright("geom")) k^(- 1 \/ 2) I . $
  Here $e lt.eq m$ controls the term $\| v \| e$; the last line is the error from differentiating the Gaussian.
    In the horizontal test, $Gamma_s lt.eq C s^2$ bounds the error carrying $Gamma_s \( e + lambda \)$ by $C
    gamma_(upright("geom")) P \( a \) I$, while
  $ gamma_(upright("geom")) s chevron.l \| u \| \| D Gamma_s \| \( sqrt(e) + sqrt(lambda) \) chevron.r_s lt.eq
    C gamma_(upright("geom")) s sqrt(U) sqrt(chevron.l \| u \|^2 \( e + lambda \) chevron.r_s) lt.eq
    C gamma_(upright("geom")) P \( a \) k^(- 1 \/ 2) I . $
  Coordinate and base-volume comparison may also produce a term $C gamma_(upright("geom"))
    chevron.l \( 1 + \| u \|^2 \) Gamma_s chevron.r_s$. Split at $C sqrt(a)$;
    its body is bounded by $C gamma_(upright("geom")) P \( a \) U$,
    and its clipped tail has the already proved negligible bound.
    Thus it costs at most $C gamma_(upright("geom")) P \( a \) k^(- 1) I$.
    These estimates retain physical heights and curvature inside $Lambda$ until after Cauchy–Schwarz;
    the displayed factors of $s$ cancel the Gaussian inverse-scale factors.
    They give total error $C e^(- kappa T) "poly" \( a \, k^(- 1) \)
    I$ in the moment inequality and this bound times $k$ after square completion in the radial inequality.
    Since $log \( 1 \/ k \) = o \( T \)$, these errors are smaller than the stated $cal(E) I$ and $cal(E) k I$.
    Chart-cutoff errors are still smaller because $s lt.eq e^(- c T)$.
    This proves both differential inequalities with their asserted uniform errors.
  It remains to prove the comparison, including its signs. Work at an equality $k U + alpha Z =
    I$ on a fixed stage and put
  $ delta_alpha = alpha_a - q alpha \, wide h_1 = q + delta_alpha Z \/ I . $
  Differentiating $I - k U - alpha Z$, and using $dot(a) = 2 - dot(I) \/ I$, gives
  #[#set math.equation(numbering: n => "(5.24)")
   $ \( I - k U - alpha Z \)^(bold(dot.op)) = \( 1 + h_1 \) dot(I) - 2 h_1 I - k dot(U) -
     alpha dot(Z) . $ <ex:barrier-derivative>]
  At a reset write $cal(D) = s^2 D_s$, $cal(R) = s^2 R_s$. Apart from the absorbed geometric error,
  $ dot(A) = 2 I - cal(D) + cal(R) \, wide cal(D) = 2 I - dot(Z) - J . $
  Insert (5.18) and (5.18) into (5.24) and use $k U = I - alpha Z$. The resulting lower bound is
  #[#set math.equation(numbering: n => "(5.25)")
   $ & \( 4 k - 2 \) h_1 I + 4 k \( 1 + h_1 \) alpha Z + c_Z dot(Z) - C k s^2 D_(upright("tr")) -
     O \( cal(E) k I \) + c_J J \,\
 & c_Z = 1 + h_1 - 2 k - 4 k h_1 - alpha \, wide c_J = 2 k - \( 4 k - 1 \) \( 1 + h_1 \) . $ <ex:reset-algebra>]
  In both cases $h_1 = o \( 1 \)$, so $c_J > 0$; discarding the margin therefore has the indicated favorable sign.
    The first-variation error in $dot(A)$, which initially need not contain $k$,
    is absorbed by a fixed fraction of this positive margin. Equivalently,
    its remaining contribution divided by $k I$ can be included in $cal(E)$, since $log \( 1 \/ k \) = o \( T \)$.
  With one well,
  $ delta_alpha = k / a^2 + frac(2 k \( 1 - 4 k \), a^3) - frac(4 k^3, a^4) = O \( k \/ a^2 \) \, wide
    c_Z = \( 1 - 4 k \) delta_alpha Z \/ I . $
  Thus the $dot(Z)$ coefficient cancels exactly at $Z = 0$.
    The estimate $\| dot(Z) \| lt.eq C I$ bounds its remaining contribution by $O \( k \/ a^2 \) Z$.
    The term $\( 4 k - 2 \) q I$ is at least $c k I \/ a^2$; the coefficient of $Z$ left in the first two terms of
    (5.25) is at least $c k$. Hence the reset derivative is strictly positive for large $a$.
  With several wells there is the useful exact cancellation
  $ delta_alpha = k / a^2 + C_1 k frac(log a - 1, \( log a \)^2) . $
  In particular $delta_alpha = o \( k \)$, $\| h_1 \| lt.eq C \/ a$, and
  $ - C C_1 k a \/ log a lt.eq c_Z lt.eq - c C_1 k a \/ log a . $
  Multiply (5.19) by this negative coefficient. It supplies a favorable multiple of $C_1 k log a thin s^2
    D_(upright("tr"))$, which absorbs the transition loss in (5.25).
    Its adverse error is $O \( k a^(1 - P_0) \/ log a \) I = o \( k I \/ a^2 \)$.
    The remaining $Z$ terms are positive, since their possible loss is $O \( delta_alpha \) Z = o \( k \) Z$.
    Again $\( 4 k - 2 \) q I gt.eq c k I \/ a^2$ supplies strict positivity.
  Off the reset set $dot(I) = K I$, and $cal(D) lt.eq 2 I - dot(Z)$.
    The coarser consequence $dot(U) lt.eq C cal(D) + cal(E) I$ gives
  $ \( I - k U - alpha Z \)^(bold(dot.op)) gt.eq { \( 1 + h_1 \) K - 2 h_1 -
    2 C k } I + \( C k - alpha \) dot(Z) - O \( cal(E) k I \) . $
  The coefficient $C k - alpha$ is negative. A negative $dot(Z)$ therefore helps.
    For one well, $dot(Z) lt.eq 2 I$; for several wells, (5.19) gives $dot(Z) lt.eq a^(- P_0) I$,
    and $alpha a^(- P_0) = o \( 1 \)$. Taking $K$ large and the initial upper bound for $k$ small makes the
    derivative strictly positive. All the strict inequalities hold in a neighborhood of equality on each compact
    stage. The absolutely continuous comparison principle therefore applies despite the reset set having only
    almost-everywhere derivatives. Initialization is supplied by 19; in its multiple-well case choose $P > 3$,
    so that the initially large coefficient $alpha$ still leaves strict room.
  Finally consider a merger. Pointwise distance comparison and bounded Gaussian mass imply
  $ U_(upright("new")) lt.eq C \( U + g^2 \) \, wide g^2 lt.eq S_1 \( a \)^2 k^(- 2) I . $
  Moreover $alpha_(upright("new")) lt.eq \( 1 - c k \) alpha$, whether several wells remain or the last two merge:
    in the first case use the formula linear in $k$. In the second case write $alpha = 1 + x$, where $x =
    C_1 k a \/ log a$. The fixed upper bound for $k$ and large $a$ give $x \/ \( 1 + x \) gt.eq c k$,
    so $alpha_(upright("new")) < 1 lt.eq \( 1 - c k \) alpha$.
    Set $theta = C k_(upright("new")) \/ k$ and $lambda = C k_(upright("new")) S_1^2 k^(- 2)$.
    By (5.21), $theta lt.double 1$ and $lambda lt.double k$. The old comparison then gives
  $ k_(upright("new")) U_(upright("new")) + alpha_(upright("new")) Z lt.eq \( theta + lambda \)
    I + \( alpha_(upright("new")) - theta alpha \) Z lt.eq I . $
  For the last inequality take the maximum over $0 lt.eq Z lt.eq I \/ alpha$; both endpoint values are below $I$.
    Thus every merger preserves the barrier, completing its proof. ◻
]

=== 5.5 Uniform bands of levels <uniform-bands-of-levels>

#thm([Lemma 5.5.])[
  (Choice of bands).  #emph[Fix $epsilon_0 > 0$, sufficiently small for the later packing argument,
    and any fixed loss exponent $C_(*)$. For large $T$, there are $Q$ ordered disjoint bands $\[ B_i \, 2 B_i \]
    subset \( 2 a_0 \, T \/ 2 \)$, independent of the contact, such that
#[#set math.equation(numbering: n => "(5.26)")
 $ B_1^(1 \/ 10) gt.double F_Q \( T \)^3 \, wide S_h \( a_0 \)^(C_(*)) lt.double B_1^(epsilon_0) \, wide
   S_1 \( 2 B_i \)^(C_(*)) lt.double B_(i + 1)^(epsilon_0) . $ <ex:band-spacing>]

 For $Q = 1$, only the first condition is needed, and a single band of size comparable to $T$ suffices.
   Every contact path has a traversal contained in one band, from $a = B$ to $a = 2 B$,
   which contains no merger and on which $k gt.eq B^(- epsilon_0)$.
   The estimates (5.6), (5.8), (5.9), (5.10), and (5.15)–(5.19) hold on that traversal.
   If it has several wells, the bound $dot(Z) lt.eq a^(- P_0)
   I$ holds on every preceding stage with several wells as well,
   and the initial value of $Z$ is the arbitrarily small quantity in 19.]
] <ex:bands>

#proof[
  We spell out the rate comparison to keep track of the inverse. Let $Q gt.eq 2$ and $j = 2 Q - 2$.
    Above the iterated-log threshold,
  #[#set math.equation(numbering: n => "(5.27)")
   $ F_(Q - 1)^(- 1) \( u \) = exp_j #scale(x: 120%, y: 120%)[\(] \( log_j u \)^2 #scale(x: 120%, y: 120%)[\)] .
     $ <ex:exact-inverse>]
  For $b$ chosen as above, inversion of any fixed power of $S_1 \( x \) =
    e^(C b \( x \))$ first takes a logarithm, then applies $F_(Q - 1)$, and then inverts $\( log x \)^3$.
    In particular the inverse retains the outer exponential from this last step.
    For example when $Q = 2$ its leading expression, up to fixed losses, is
  $ exp #h(-0.16667em) (#scale(x: 120%, y: 120%)[\[] F_1 \( c log u \) #scale(x: 120%, y: 120%)[\]]^(1 \/ 3)) . $
  It follows directly from (5.27) that, for some fixed $𝜍 > 0$, every such inverse dominates
  $ exp_(2 Q - 1) #scale(x: 120%, y: 120%)[\(] \( log_(2 Q - 1) u \)^𝜍 #scale(x: 120%, y: 120%)[\)] . $
  Any fixed number of inverse compositions, including fixed powers of the argument and value,
    retains this lower bound with a smaller positive $𝜍$. To compare with $F_Q \( T \)^C$, take $2 Q -
    1$ logarithms: the lower bound has last value $exp \( 𝜍 log_(2 Q) T \)$,
    whereas the latter has last value $exp \( sqrt(log_(2 Q) T) \)$, up to lower order terms.
    The former is larger for every fixed $C$.
  The same comparison shows $b \( T \) = o \( F_Q \( T \)^c \)$ for each fixed $c > 0$, and hence $b \( T \) +
    b \( a_0 \) = o \( a_0 \)$, as used above. It also shows that after a fixed number of the inverse operations,
    $log B_1 gt.double b \( a_0 \)$. This stronger comparison absorbs the initial factor $S_h \( a_0 \)$,
    including any fixed power of it. Enlarge $C_(*)$, if necessary,
    to exceed the finitely many powers arising from $Q - 1$ applications of (5.21);
    proving the stronger separation also proves the originally requested one.
    Now choose $B_Q$ to be a small fixed multiple of $T$, and choose the earlier bands successively by inverse
    operations with enough fixed slack to ensure (5.26). The comparisons just proved give all the lower-end
    requirements. For $Q = 1$, $F_1 \( T \) = T^(o \( 1 \))$,
    so the claimed single band works and no inverse construction is required.
  Consider the path from initialization to its first hit of each successive level $2 B_i$.
    There are $Q$ resulting consecutive time intervals and fewer than $Q$ merger events,
    counting a common-well initialization if needed. At least one interval has no event.
    On it take the last preceding hit of $B_i$ before the first hit of $2 B_i$;
    this is a traversal staying in that band. All earlier mergers have levels at most $2
    B_(i - 1)$ (or are initialization events). Iterating (5.21), with at most $Q - 1$ steps,
    bounds their total loss by a fixed power of $S_1 \( 2 B_(i - 1) \)$, the initial $S_h \( a_0 \)$,
    and fixed constants. Equation (5.26) and the explicit solution of (5.17) then give $k gt.eq
    B_i^(- epsilon_0)$ throughout the traversal. The remaining assertions are the estimates already proved.
    The number of wells only decreases, so a traversal with several wells has had several wells at every earlier
    stage. ◻
]

== 6 Witness scales and the signed estimate <sec:packing>

We finish the argument at the integer $Q$. In this section the induction hypothesis is needed only through 16,
  as used in the multiple-well initialization and barrier. Put $t = log s$;
  a prime below means differentiation with respect to $t$. All measures, balls, heights,
  and Gaussian kernels have the normalization of 18. In particular $I = s^2 e^(- a)$,
  whereas the quantities inside $Lambda$ retain their physical units.
  Write $nu = tau$ for the positive projected measure in the working chart.

The purpose of Lemma 6.1, Lemma 6.2, Lemma 6.3 is to turn a path of contact scales into a small set for $nu$.
  First we find many scales with a definite normal flux. The height moment with exponent $p >
  2$ then prevents this flux from concentrating entirely where the density of $nu$ is large.
  Finally a dyadic stopping argument makes repeated occurrences of this property expensive in $nu$-mass.

=== 6.1 Witnesses and controlled density <witnesses-and-controlled-density>

#thm([Lemma 6.1.])[
  (Ordered witness scales).  #emph[Consider a contact path and a merger-free traversal of $\[ B \, 2 B \]$
    provided by 21, with $k gt.eq B^(- epsilon_0)$ throughout the traversal.
    Given a sufficiently small fixed number $theta.alt > 0$, there are at least $c B^(1 \/ 2)$ scales $s_j$,
    ordered in outward time, whose levels satisfy
#[#set math.equation(numbering: n => "(6.1)")
 $ B + 1 < a \( s_j \) < 2 B - 1 \, wide a \( s_(j + 1) \) - a \( s_j \) gt.eq B^(1 \/ 3) . $ <pk:level-spacing>]

 If more than one well remains, these scales satisfy
#[#set math.equation(numbering: n => "(6.2)")
 $ D_(s_j) gt.eq c e^(- a \( s_j \)) \, wide D_(upright("tr")) \( s_j \) lt.eq
   theta.alt e^(- a \( s_j \)) . $ <pk:multi-witness>]

 If only one well remains, they satisfy
#[#set math.equation(numbering: n => "(6.3)")
 $ D_(s_j) gt.eq B^(- epsilon_0) e^(- a \( s_j \)) . $ <pk:single-witness>]

 The constants are independent of the contact and of the positive bottom scale.
   The large threshold for $B$ may depend on $epsilon_0$.]
] <pk:witnesses>

#proof[
  We first record precisely the differential information used here.
    By Lemma 5.2, Proposition 5.4, $0 lt.eq Z lt.eq A lt.eq I$, $A' - Z' gt.eq 0$, and
  #[#set math.equation(numbering: n => "(6.4)")
   $ \| a' \| + \| I' \| \/ I + \| Z' \| \/ I lt.eq C \, wide lr(|\( Z' \/ I \)'|) lt.eq C $ <pk:regular-path>]
  almost everywhere. The last estimate follows also directly by differentiating the Gaussian source:
    its first two logarithmic derivatives are bounded by Gaussian averages of fixed polynomial weights times
    $tau$, and the dilation estimate bounds these by $C I \/ s^2$.
    The constant background in the source is negligible since $a lt.eq T \/ 2$.
    At a reset $I = A$ we have $I' = A'$ almost everywhere on the reset set.
    Off that set $I' = K I$ and $a' = 2 - K < 0$. The weighted scalar estimate is
  #[#set math.equation(numbering: n => "(6.5)")
   $ \| M \|_s lt.eq C_0 \( D_s + Lambda_s \) + a^(- P) I \/ s^2 \, $ <pk:weighted-scalar>]
  where $P$ can be chosen as large as needed. With several wells,
  #[#set math.equation(numbering: n => "(6.6)")
   $ Z' + c_0 frac(\( log a \)^2, a) s^2 D_(upright("tr")) \( s \) lt.eq a^(- P) I . $ <pk:source-transition>]
  Here $D_(upright("tr")) \( s \)$ is the Gaussian average over the enlarged transition set of 20.
    This set includes all regions where derivatives of either $Gamma$ or $V_b$ differ from their near-well values,
    in particular the cutoff annuli of $V_b$ inside the quadratic neighborhoods of $Gamma$;
    clipping tails are estimated separately. These inequalities retain the cumulative contact condition $Z gt.eq
    0$; no sign for $Z'$ at a later scale is asserted.
  Here is a time-bin estimate that does not require monotonicity of $a$ or of $I$.
    Fix an endpoint $t_1$ of an interval on which $a gt.eq A_(*) > 2$, and put $M_(*) =
    max_(t lt.eq t_1) I \( t \)$ on that interval. For nonnegative integers $j$ and integers $n gt.eq
    floor.l A_(*) floor.r$, the simultaneous conditions
  $ n lt.eq a \( t \) < n + 1 \, wide e^(- j - 1) M_(*) < I \( t \) lt.eq e^(- j) M_(*) $
  confine $t$ to an interval of length at most one, because
  #[#set math.equation(numbering: n => "(6.7)")
   $ t = frac(a \( t \) + log I \( t \), 2) . $ <pk:time-identity>]
  The total length of the set of such times, even if it has many components, is therefore at most one.
    Summing the integral over these sets gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ integral_(t lt.eq t_1) a \( t \)^(- P) I \( t \) thin #h(-0.16667em) d t lt.eq
     C M_(*) sum_(j gt.eq 0) e^(- j) sum_(n gt.eq floor.l A_(*) floor.r) n^(- P) lt.eq
     C A_(*)^(1 - P) M_(*) . $ <pk:time-bin>]
  For an interval confined to $\[ B \, 2 B \]$, the same estimate has $C B^(1 - P)$ on the right.
  Suppose first that the selected traversal has several wells.
    All earlier stages also had several wells, since the construction only removes wells.
    Its initialization gives $Z \( t_0 \) lt.eq a_0^(- P) I \( t_0 \)$.
    By (6.6) and (6.8), the positive variation of $Z$ up to any endpoint is at most $epsilon.alt M_(*)$,
    where $epsilon.alt arrow.r 0$ as $a_0 arrow.r oo$. Since $A - Z$ is nondecreasing, for $u lt.eq t$ we have
  $ A \( t \) gt.eq A \( u \) - Z \( u \) gt.eq A \( u \) - Z \( t_0 \) -
    integral_(t_0)^t \( Z' \)_(+) thin #h(-0.16667em) d v . $
  The future envelope has the elementary property
  #[#set math.equation(numbering: n => "(6.9)")
   $ max_(t_0 lt.eq u lt.eq t) I \( u \) lt.eq max {I \( t \) \,
     max_(t_0 lt.eq v lt.eq t) A \( v \)} . $ <pk:envelope-history>]
  Indeed a term realizing $I \( u \)$ either comes from an $A \( v \)$ with $v lt.eq t$,
    when its exponential weight is at most one, or comes from a later $v$ or from the artificial endpoint,
    when the same term at $t$ is larger by $e^(K \( t - u \))$.
    Approximating a supremum proves the assertion if it is not attained.
    Combining these facts, and taking $a_0$ large, yields
  #[#set math.equation(numbering: n => "(6.10)")
   $ I \( t \) gt.eq 1 / 2 max_(t_0 lt.eq u lt.eq t) I \( u \) . $ <pk:quasi-monotone>]
  This argument is unchanged at a merger: $I \, A \, Z$ do not jump,
    and (6.6) holds on both adjacent multiple-well stages.
  Choose a traversal $\[ t_b \, t_e \]$ with $a \( t_b \) = B$, $a \( t_e \) = 2 B$, and $B lt.eq a lt.eq
    2 B$ between them. Let $M \( t \) = max_(t_b lt.eq v lt.eq t) I \( v \)$ and $I_b = I \( t_b \)$. On this interval
  #[#set math.equation(numbering: n => "(6.11)")
   $ integral_(t_b)^t \( Z' \)_(+) thin #h(-0.16667em) d v lt.eq C B^(1 - P) M \( t \) \, wide Z \( t \) lt.eq
     I_b + C B^(1 - P) M \( t \) \, wide I \( t \) gt.eq M \( t \) \/ 2 . $ <pk:band-positive>]
  Fix a small constant $delta_1 > 0$ and set $h_B = delta_1 \( log B \)^2 \/ B$.
    We bound the levels whose first increasing passage has $Z' \/ I < - h_B$.
  Before $M$ first reaches $B^10 I_b$, split the range of $M$ into successive factors of two.
    There are $O \( log B \)$ such pieces. Applying (6.8) on each piece shows that
  $ integral frac(\( Z' \)_(+), M) thin #h(-0.16667em) d t lt.eq C B^(1 - P) log B . $
  Integration by parts against the continuous nondecreasing function $M$ gives
  $ integral frac(- Z', M) thin #h(-0.16667em) d t = frac(Z \( t_b \), M \( t_b \)) - frac(Z \( t \), M \( t \)) -
    integral Z / M^2 thin #h(-0.16667em) d M lt.eq 1 . $
  Consequently $integral \( Z' \)_(-) \/ M lt.eq 2$ for large $B$.
    In view of (6.10), the time spent with $Z' \/ I < - h_B$ is at most $C \/ h_B$.
    By $\| a' \| lt.eq C$, the image of these times in the level variable has length at most
  #[#set math.equation(numbering: n => "(6.12)")
   $ C B \/ \( log B \)^2 = o \( B \) . $ <pk:bad-levels>]
  Constants here may depend on the fixed $delta_1$.
  After this growth of $M$, (6.11) implies $Z \( t \) lt.eq C \( B^(- 10) + B^(1 - P) \) I \( t \)$.
    If $Z' \/ I < - h_B$ at a time with $B + 1 < a < 2 B - 1$, (6.4) keeps $Z' \/ I < -
    h_B \/ 2$ on a following interval of length $c h_B$. The interval stays in the traversal,
    and $I$ changes by at most a fixed factor there. It would decrease $Z$ by at least $c h_B^2 I \( t \)$,
    exceeding the available value of $Z \( t \)$ for $P > 12$ and large $B$. This contradicts $Z gt.eq 0$.
    Thus no such bad time occurs after the stated growth.
  For completeness, first increasing passages can be selected without assuming that $a$ itself is increasing.
    Use the running maximum of $a$ starting at $t_b$. It is Lipschitz.
    Except for a null set of levels, a first passage is a differentiability point with $a' > 0$:
    the image under a Lipschitz function of its nondifferentiability set is null,
    and the image of its zero-derivative set is null by the one-dimensional area formula.
    First passages so obtained are ordered. Since off resets $a' = 2 - K < 0$, they are resets.
    The excluded levels are bounded by (6.12).
  At every remaining passage $I = A$, so $M_s = I \/ s^2 = e^(- a)$.
    The lower bound $Z' \/ I gt.eq - h_B$ and the definition of the source imply
  $ C_Q Lambda_s lt.eq \( 2 + h_B \) e^(- a) . $
  Apply (6.5). Taking $C_Q$ sufficiently large compared with $C_0$, and then $B$ large, forces $D_s gt.eq
    c e^(- a)$. Moreover (6.6) gives
  $ D_(upright("tr")) \( s \) lt.eq C (delta_1 + frac(B^(1 - P), \( log B \)^2)) e^(- a) . $
  Choose $delta_1$ first so that the last bound is at most $theta.alt e^(- a)$.
    This proves (6.2) on all but $o \( B \)$ of the first-passage levels in the band.
  Now suppose there is one well. If no scale in a traversal of a level interval of length $B^(1 \/ 4)$ satisfied
    (6.3), then throughout it $s^2 D_s < B^(- epsilon_0) I$. At a reset the Gaussian horizontal identity gives
  $ I' = 2 I - s^2 D_s + s^2 R_s + o \( I \) gt.eq I . $
  Also (6.5), together with $M_s = e^(- a)$, forces $Lambda_s gt.eq c e^(- a)$.
    Thus $Z' lt.eq - I$ when $C_Q$ is sufficiently large. At a nonreset,
    the same scalar estimate and $C_Q > 2 C_0$ instead give
  $ Z' lt.eq C s^2 D_s + o \( I \) lt.eq C B^(- epsilon_0) I . $
  These estimates explicitly include the possible geometry contribution.
    In the flat case a reset with such small tilt is already excluded by the scalar estimate.
  Put $W = Z \/ I$. It is nonnegative and initially at most one.
    At resets $W' lt.eq - 1$; at nonresets $W' lt.eq C B^(- epsilon_0)$.
    If the two time sets have lengths $cal(R) \, cal(N)$, integration gives
  $ cal(R) lt.eq 1 + C B^(- epsilon_0) cal(N) . $
  On the other hand $a' lt.eq 1$ at resets, while $a' = 2 - K$ at nonresets.
    A net increase of $B^(1 \/ 4)$ therefore requires
  $ cal(R) gt.eq B^(1 \/ 4) + \( K - 2 \) cal(N) \, $
  a contradiction for large $B$.
  In the multiple-well case select good first-passage levels greedily with separation $2 B^(1 \/ 3)$;
    removing an interval of length at most $2 B^(1 \/ 3)$ per choice leaves at least $c B^(2 \/ 3)$ choices.
    In the one-well case use ordered, disjoint level intervals of length $B^(1 \/ 4)$ separated by $2 B^(1 \/ 3)$,
    and choose a witness in each corresponding first-passage traversal. These traversals are ordered in time.
    Discarding witnesses if necessary gives (6.1) and the asserted number. ◻
]

#thm([Lemma 6.2.])[
  (A controlled-density fraction).  #emph[Fix a finite family of nested dyadic grids with the property that every
    sufficiently small ball is contained in a cube of one of the grids with comparable diameter.
    The grids may be taken half-open, so their cubes form genuine partitions.
    At each witness of 22 there is a cube $J$ of one of these grids such that, with $delta = e^(- a \( s \))$,
#[#set math.equation(numbering: n => "(6.13)")
 $ B_s \( x \) subset "int" J \, wide ell \( J \) lt.eq C s sqrt(log B) \, wide c B^(- 2 epsilon_0) delta lt.eq
   frac(nu \( J \), \| J \|) lt.eq B^(epsilon_0) delta . $ <pk:cube-range>]

 There are fixed constants $C_(*) \, c_(*) > 0$, independent of $epsilon_0$, such that
#[#set math.equation(numbering: n => "(6.14)")
 $ nu
   ({y in J : frac(nu \( R \), \| R \|) lt.eq B^(C_(*)) delta upright(" for every dyadic ") R subset J
   upright(" containing ") y}) gt.eq B^(- c_(*) epsilon_0) nu \( J \) . $ <pk:reverse-fraction>]

 Here $\| J \|$ denotes coordinate Lebesgue volume. The metric volume is uniformly comparable to it.]
] <pk:reverse>

#proof[
  A finite family as stated can be constructed by using, in each coordinate,
    the three dyadic grids whose shifts alternate between the one-third positions at successive generations;
    this standard Euclidean construction is described in #cite(label("HytonenKairema2012")) p. 2.
    At a scale between a fixed multiple of the ball diameter and twice that multiple,
    one of the three boundary sets in each coordinate is farther than the ball diameter from the center.
    Taking their product gives the required cube. We shall apply this property to a larger concentric ball,
    so the first inclusion in (6.13) has room to spare.
  Let $V_b$ be the normal multiplier of 20, and put $u = \( y - x \) \/ s$.
    In the scale-$s$ height coordinate $z' = z \/ s$, define $v \( z' \) = V_b \( s z' \) \/ s$.
    Thus $D_(z') v \( z' \) = D V_b \( s z' \)$, equal to the identity when $s z'$ is near a represented well.
    In all integrals below, $v$ means $v \( z \/ s \) = V_b \( z \) \/ s$,
    while the measures remain in the section coordinates. Dividing the normal first-variation identity in 20 by
    $s^2$, with its Gaussian cutoff, therefore gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ cal(F) := integral G_s thin v dot.op P_(v h) u thin #h(-0.16667em) d mu gt.eq
     c B^(- epsilon_0) delta . $ <pk:flux-lower>]
  For multiple wells the discarded terms are bounded by a fixed multiple of $D_(upright("tr")) \( s \)$,
    and $theta.alt$ in 22 is chosen small enough to absorb them. For one well there is no transition contribution.
    Clipping and chart tails have the arbitrarily small bounds in 20,
    and the curved first-variation errors are $o \( B^(- epsilon_0) delta \)$.
    This last assertion follows from $k gt.eq B^(- epsilon_0)$, the moment barrier, the dilation bound,
    and the physical exponential smallness in 13.
  We give the moment and tail details needed to use this flux.
    Fix the witness scale $s$, and keep its wells, clipping scale, and multiplier $V_b =
    V_b \( s \)$ fixed while the ball radius varies. Choose a fixed $p > 2$ in the range (2.17),
    and fix an exceptional proportion small enough for the concentric dyadic comparisons below,
    independently of $T$, $a$, and $R$. For $R gt.eq 1$ in any fixed polynomial range in $a$,
    the dilation bound and a Gaussian lower bound give
  $ \( R s \)^(- m) tau \( B_(c R s) \( x \) \) lt.eq d_R := C \( 1 + R \)^(K - 2) delta = o \( 1 \) $
  on the required fixed enlargement. Its $\| M \|$ part identifies $Q$ by the smooth mass average in 7.
    Choose the joint majority-and-$L^p$ witness $cal(B)_R$ in 9, with that exceptional proportion.
    The bound $d_R = o \( 1 \)$ is uniform in the stated range,
    so it lies below the corresponding fixed small-density threshold. Its moment bound is
  $ (\( R s \)^(- m) integral_(pi^(- 1) \( B_(R s) \( x \) \)) "dist" \( z \, cal(B)_R \)^p thin #h(-0.16667em) d
    mu)^(1 \/ p) lt.eq C \( 1 + R \)^(K \/ 2) s sqrt(delta) . $
  This integral includes exceptional fibers and points with zero projection Jacobian.
  Take the analogous witness $cal(B)_1$ at scale $s$. For each of its entries,
    the matched projection entry on every good fiber is within $C s sqrt(delta)$.
    The area formula and the uniform upper bound for $J_pi$ give these entries a fixed amount of $G_s$-weighted
    $mu$-mass. Using $\| D V_b \| lt.eq C$, $\| V_b \|^2 lt.eq Gamma_s$, and the barrier $U lt.eq
    s^2 delta \/ k$ therefore gives
  $ max_(xi in cal(B)_1) \| V_b \( xi \) \|^2 lt.eq C U + C s^2 delta lt.eq C k^(- 1) s^2 delta . $
  This estimate is made one entry at a time, so repeated entries require no disjoint allocation of mass.
    Match the centers of $cal(B)_R$ to those of $cal(B)_1$ through concentric dyadic dilations.
    The majority sets have fixed positive relative overlaps, and the sum of the local matching bounds is at most
    $C \( 1 + R \)^(K \/ 2) s sqrt(delta)$. For the fixed multiplier,
  $ \| v \( z \/ s \) \| lt.eq C / s "dist" \( z \, cal(B)_R \) + max_(xi in cal(B)_R) frac(\| V_b \( xi \) \|, s) . $
  The last three bounds and the bounded normalized projected mass give
  #[#set math.equation(numbering: n => "(6.16)")
   $ (\( R s \)^(- m) integral_(pi^(- 1) \( B_(R s) \( x \) \)) \| v \|^p thin #h(-0.16667em) d mu)^(1 \/ p) lt.eq
     C \( 1 + R \)^C k^(- 1 \/ 2) sqrt(delta) . $ <pk:moment-dilation>]
  All these bounds use displacements from the fixed wells. Gaussian summation of (6.16) and of the energy dilation
    bound gives
  #[#set math.equation(numbering: n => "(6.17)")
   $ (integral G_s \| v \|^p thin #h(-0.16667em) d mu)^(1 \/ p) lt.eq B^(c_1 epsilon_0) sqrt(delta) \, wide
     integral G_s \( 1 + \| u \|^2 \) e thin #h(-0.16667em) d mu lt.eq C delta . $ <pk:flux-moments>]
  The constants $c_1$ and $C$ are fixed. To control more distant tails uniformly even when $s$ is very small,
    note that clipping gives $\| v \| lt.eq C$ and the projected mass identity and dilation bound give
    $\( pi_(\#) mu \)_(sqrt(2) s) lt.eq C$. Gaussian comparison therefore gives
  $ integral_(\| u \| > R) G_s \| v \|^p thin #h(-0.16667em) d mu lt.eq C e^(- R^2 \/ 4) . $
  At $R = C sqrt(a)$, with $C$ sufficiently large, this is smaller than $B^(- N)
    delta^(p \/ 2)$ for any prescribed fixed $N$. Likewise Gaussian comparison,
    with a slightly larger fixed dilation to absorb $\| u \|^2$, bounds the energy tail by $C e^(- c R^2) delta$.
    These estimates cover the part beyond the polynomial dilation range and the fixed chart cutoff;
    they introduce no negative power of $s$.
  Take $R_B = C_1 sqrt(log B)$, with $C_1$ fixed sufficiently large.
    Annular Gaussian summation using (6.16) makes both the flux tail outside $B_(R_B s) \( x \)$ and the tilt tail
    there smaller than $o \( B^(- epsilon_0) delta \)$. Choose $J$ to contain this ball in its interior,
    with $ell \( J \) lt.eq C R_B s$. The remaining tilt has Gaussian integral at least $c B^(- epsilon_0) delta$.
    Since $G_s lt.eq C s^(- m)$,
  $ nu \( J \) gt.eq c B^(- epsilon_0) delta s^m . $
  The upper density bound follows from the energy dilation estimate on a ball containing $J$.
    All resulting factors are fixed powers of $log B$, and hence are at most $B^(epsilon_0)$ after increasing the
    threshold for $B$. This proves (6.13).
  Let $H$ be the union of the maximal dyadic subcubes of $J$ with density larger than $B^(C_(*)) delta$.
    They are disjoint, and the upper bound in (6.13) gives
  #[#set math.equation(numbering: n => "(6.18)")
   $ frac(\| H \|, \| J \|) lt.eq B^(epsilon_0 - C_(*)) . $ <pk:bad-volume>]
  It is essential here to estimate mass as well as volume. The identity $pi_(\#) mu = Q "vol"_S + M$ gives
  #[#set math.equation(numbering: n => "(6.19)")
   $ frac(mu \( pi^(- 1) H \), \| J \|) lt.eq C Q frac(\| H \|, \| J \|) + frac(\| M \| \( J \), \| J \|) lt.eq
     C B^(epsilon_0 - C_(*)) + B^(epsilon_0) delta . $ <pk:bad-mass>]
  In particular the mass defect has not been discarded. Writing $sigma = 1 / 2 - 1 / p > 0$,
    the Gaussian-weighted mass of $pi^(- 1) H$ is at most $B^(c_2 epsilon_0 - C_(*)) + B^(c_2 epsilon_0) delta$,
    after absorbing the volume ratio $\| J \| \/ s^m$ into a power of $B^(epsilon_0)$.
    Hölder’s inequality with exponents $p \, 2 \, 1 \/ sigma$, together with $\| P_(v h) u \| lt.eq
    sqrt(e) thin \| u \|$ and (6.17), bounds the absolute flux on this set by
  #[#set math.equation(numbering: n => "(6.20)")
   $ B^(c_3 epsilon_0) delta (B^(c_2 epsilon_0 - C_(*)) + B^(c_2 epsilon_0) delta)^sigma . $ <pk:bad-flux>]
  Choose $C_(*)$ large, independently of sufficiently small $epsilon_0$, and then $B$ large.
    Expression (6.20) is less than one quarter of the lower bound in (6.15).
    The strict inequality $p > 2$ is used exactly at this step.
  There remains flux at least $c B^(- epsilon_0) delta$ over $\( J \\ H \) ∩ B_(R_B s) \( x \)$.
    Cauchy–Schwarz, the second-moment consequence of (6.17), and $\| u \|^2 lt.eq R_B^2$ on this core imply
  $ c B^(- 2 epsilon_0) delta^2 lt.eq B^(c_4 epsilon_0) delta thin C R_B^2 s^(- m) nu \( J \\ H \) . $
  Thus $nu \( J \\ H \) gt.eq B^(- c_5 epsilon_0) delta s^m$.
    Compare with $nu \( J \) lt.eq B^(epsilon_0) delta \| J \|$ and absorb the remaining fixed logarithmic
    factors. This proves (6.14) with a fixed $c_(*)$. The set $J \\ H$ is precisely the set in that formula,
    with the harmless choice of strict or non-strict threshold indicated there. ◻
]

=== 6.2 Packing and contact charging <packing-and-contact-charging>

#thm([Lemma 6.3.])[
  (Dyadic packing).  #emph[Let $nu$ be a finite positive measure on the union $X$ of disjoint roots of a dyadic
    forest. For a cube $R$ put $d \( R \) = nu \( R \) \/ \| R \|$.
    Suppose that a family of marked cubes has densities in $\[ lambda_(-) \, lambda_(+) \]$,
    where $0 < lambda_(-) lt.eq lambda_(+) < oo$, and that every marked cube $P$ satisfies
#[#set math.equation(numbering: n => "(6.21)")
 $ nu { x in P : d \( R \) lt.eq L d \( P \) upright(" for every descendant ") R in.rev x } gt.eq
   zeta nu \( P \) \, $ <pk:abstract-payment>]

 where $L gt.eq 1$ and $0 < zeta < 1$. Let $E_N$ be the union of all full cubes $F$ admitting a marked chain
$ W_1 ⫌ W_2 ⫌ dots.h.c ⫌ W_N = F \, wide d \( W_(j + 1) \) gt.eq S d \( W_j \) . $

 For $R_(*) > e$ and $S > L R_(*)$ one has
#[#set math.equation(numbering: n => "(6.22)")
 $ nu \( E_N \) lt.eq [\( 1 - zeta \)^(N - 1) + e / R_(*) (1 + ⌊log lambda_(+) / lambda_(-)⌋)] nu \( X \) .
   $ <pk:abstract-packing>]

 In particular, the full innermost witness cubes furnished by Lemma 6.1, Lemma 6.2, for a fixed band and grid,
   have union $E$ satisfying
#[#set math.equation(numbering: n => "(6.23)")
 $ nu \( E \) lt.eq C exp \( - B^(1 \/ 8) \) d $ <pk:packed-witnesses>]

 when $epsilon_0$ is sufficiently small.]
] <pk:packing>

#proof[
  We first prove the estimate for downward retracing of density. Let
  $ J_(*) = 1 + ⌊log \( lambda_(+) \/ lambda_(-) \)⌋ \, wide lambda_j = lambda_(-) e^j quad \( 0 lt.eq j < J_(*) \) . $
  For each $j$, stop at the first cubes, descending from the roots, whose density is at least $lambda_j$.
    These high stopping cubes $H$ are disjoint; a root is included if it already qualifies.
    Within each $H$ stop at the first strict descendants $R$ with $d \( R \) lt.eq e lambda_j \/ R_(*)$.
    These low stopping cubes are also disjoint, and
  $ sum_R nu \( R \) lt.eq frac(e lambda_j, R_(*)) sum_R \| R \| lt.eq frac(e lambda_j, R_(*)) \| H \| lt.eq e /
    R_(*) nu \( H \) . $
  Now suppose $P ⫌ P'$ are any two band cubes, meaning their densities belong to $\[ lambda_(-) \, lambda_(+) \]$,
    with $d \( P' \) lt.eq d \( P \) \/ R_(*)$. Choose $j$ so that $lambda_j lt.eq d \( P \) < e lambda_j$.
    The cube $P$ lies below a high stopping cube $H$, and $P'$ lies inside a low stopping cube below that $H$.
    Hence the union $E_(upright("ret"))$ of all such low cubes has
  #[#set math.equation(numbering: n => "(6.24)")
   $ nu \( E_(upright("ret")) \) lt.eq \( e J_(*) \/ R_(*) \) nu \( X \) . $ <pk:retrace-mass>]
  This is a bound in $nu$-mass. Moreover, if the ancestry of a terminal cube has such a retrace before reaching
    that cube, the #emph[entire] terminal cube is in $E_(upright("ret"))$.
  We next construct a global forest of paying cubes. Its first generation consists of the first marked cubes below
    the roots. For each paying cube $P$, stop at the first strict descendants $C$ with $d \( C \) > L d \( P \)$.
    By (6.21),
  $ sum_C nu \( C \) lt.eq \( 1 - zeta \) nu \( P \) . $
  Below each such $C$ take the first marked cubes, including $C$ itself if marked, as the next paying generation.
    All cubes in one paying generation are disjoint. Induction gives
  #[#set math.equation(numbering: n => "(6.25)")
   $ nu \( upright("union of paying generation ") j \) lt.eq \( 1 - zeta \)^(j - 1) nu \( X \) . $ <pk:survival>]
  Consider a terminal $F$ with a chain $W_1 \, dots.h \, W_N$ and with no band retrace in its ancestry before $F$.
    The first paying cube on its ancestry contains $W_1$. Suppose the $j$th paying cube $P_j$ contains $W_j$.
    Both cubes are band cubes. Absence of a retrace implies $d \( W_j \) > d \( P_j \) \/ R_(*)$ when they differ;
    the lower bound needed below also holds when they coincide. Consequently
  $ d \( W_(j + 1) \) gt.eq S d \( W_j \) > L d \( P_j \) . $
  The next density crossing, and then the next first marked cube, therefore occur at or before $W_(j + 1)$.
    The $\( j + 1 \)$st paying cube contains $W_(j + 1)$. It follows that $F$ is wholly contained in a paying cube
    of generation $N$. Thus
  $ E_N subset E_(upright("ret")) union \( upright("union of paying generation ") N \) . $
  Equations (6.24) and (6.25) prove (6.22). All families are countable;
    half-open cubes give the statement also for measures charging dyadic boundaries.
    Finite-depth truncation followed by monotone convergence is an alternative justification of every stopping
    construction above.
  We apply 24 to all cubes which can occur in 23, marking a cube if it admits at least one of the witness labels.
    A label need not be selected coherently between different contact paths.
    Each such cube satisfies (6.21) with the uniform choices
  $ lambda_(-) & = c B^(- 2 epsilon_0) e^(- 2 B) \, & lambda_(+) & = B^(epsilon_0) e^(- B) \,\
L & = max { 1 \, c^(- 1) B^(C_(*) + 2 epsilon_0) } \, & zeta & = B^(- c_(*) epsilon_0) . $
  Indeed $L d \( J \) gt.eq B^(C_(*)) e^(- a)$ for any of its labels.
    Take $R_(*) = exp \( B^(1 \/ 4) \)$ and $S = exp \( B^(1 \/ 3) \/ 2 \)$.
    The inequality $S > L R_(*)$ holds for large $B$, and $J_(*) = O \( B \)$.
  There is a fixed number of grids. A fixed fraction of the ordered witnesses on each contact path belongs to one
    grid. Retain that subsequence and reverse its order, so that cubes are listed from outer to inner.
    By (6.4) and (6.1), consecutive radii differ by at least $exp \( c B^(1 \/ 3) \)$.
    The first two properties in (6.13) therefore give strict nesting, with the same contact point in every cube.
    The density bounds give the factor $S$ for consecutive densities for large $B$.
    There are still $N gt.eq c B^(1 \/ 2)$ cubes. Start the dyadic forest at its maximal cubes contained in the
    working chart; all witness cubes lie in this forest, and its roots are disjoint.
    Its total $nu$-mass is at most $d$. Thus (6.22) is at most
  $ [exp { - c B^(1 \/ 2 - c_(*) epsilon_0) } + C B exp \( - B^(1 \/ 4) \)] d . $
  Choose $epsilon_0$ so small that $c_(*) epsilon_0 < 1 \/ 4$.
    This proves (6.23) after increasing the threshold for $B$.
    The estimate concerns the union of full innermost cubes, not just the contact points or almost every point on
    selected infinite chains. ◻
]

#thm([Lemma 6.4.])[
  (Charging the contact measure).  #emph[Let $h$ and $nu$ be finite positive measures on $bb(R)^m$,
    and let $cal(C)$ be a set of contact centers. For each of its contacts suppose there are radii $0 < u_x lt.eq
    s_x$ with
#[#set math.equation(numbering: n => "(6.26)")
 $ nu_(s_x) \( x \) gt.eq c theta \, wide nu_(sqrt(2) s_x) \( x \) lt.eq C theta \, wide h_(u_x) \( x \) lt.eq
   C theta \, $ <pk:charge-hypotheses>]

 where $theta > 0$ and the constants are fixed. There is a fixed $L_0$ such that,
   if $B_(L_0 s_x) \( x \) subset E$ for every contact, then
#[#set math.equation(numbering: n => "(6.27)")
 $ h^(*) \( cal(C) \) lt.eq C nu \( E \) . $ <pk:charge-bound>]

 Here $E$ is Borel and $h^(*)$ is outer measure. The statement also holds for a submeasure of a contact measure
   whose spatial projection is dominated by $h$.]
] <pk:contact-charge>

#proof[
  Outside $B_(L_0 s_x) \( x \)$ the Gaussian kernels satisfy
  $ G_(s_x) \( y - x \) lt.eq 2^(m \/ 2) e^(- L_0^2 \/ 4) G_(sqrt(2) s_x) \( y - x \) . $
  Choose $L_0$ sufficiently large. By (6.26), at least $c theta \/
    2$ of the $s_x$-Gaussian integral is then inside this ball.
    Since $G_(s_x) lt.eq C s_x^(- m)$, the threshold balls $B_x = B_(L_0 s_x) \( x \)$ satisfy
  #[#set math.equation(numbering: n => "(6.28)")
   $ nu \( B_x \) gt.eq c theta s_x^m . $ <pk:threshold-payment>]
  Apply the usual decreasing-radius selection to these balls; see #cite(label("Simon2018")) Chapter 1,
    Lemma 3.4 for the blocking-ball property used below. For clarity,
    grouping radii in successive factors of two and taking maximal disjoint families gives disjoint selected balls
    $B_i = B_(R_i) \( x_i \)$ such that every original ball meets a selected ball with radius at least half its
    own. Assign each contact to one such blocking selected ball; this gives both
  $ \| x - x_i \| < 3 R_i \, wide u_x lt.eq s_x lt.eq 2 R_i \/ L_0 . $
  The radius condition is part of the assignment, and does not follow merely from coverage of centers by enlarged
    balls. The radii are bounded, since $c theta lt.eq nu_(s_x) \( x \) lt.eq C_m s_x^(- m) nu \( bb(R)^m \)$.
  Within one assigned family apply the same selection to the derivative balls $B_(u_x) \( x \)$.
    Obtain disjoint balls $D_(i j) = B_(u_(i j)) \( x_(i j) \)$ whose fivefold enlargements cover its centers.
    All the original $D_(i j)$ lie in $B_(\( 3 + 2 \/ L_0 \) R_i) \( x_i \)$,
    so comparison of ordinary volumes gives $sum_j u_(i j)^m lt.eq C R_i^m$.
    Positivity of the Gaussian on each fivefold ball and (6.26) give
  $ h \( 5 D_(i j) \) lt.eq C theta u_(i j)^m . $
  Therefore the $h$ outer mass of the contacts assigned to $i$ is at most $C theta R_i^m lt.eq C nu \( B_i \)$,
    by (6.28). The $B_i$ are disjoint and contained in $E$, which proves (6.27).
    This argument uses no absolute continuity of $h$, and remains valid if the derivative radii are much smaller
    than the threshold radii. ◻
]

#proof[
  #emph[Completion of the proof of 13.] Fix $Q$ and assume the assertion for all smaller positive integers.
    Choose $C_Q$ large enough for Proposition 4.3, Lemma 5.2, Proposition 5.4,
    Lemma 6.1 and the bottom-contact estimate in 17. The lower-integer constants are already fixed.
    If $Q = 1$, use only the one-well statements; no separated estimate, function $b$,
    or multiple-well construction is used.
  Put $F = F_Q \( T \)$, $eta = e^(- 2 F)$, and $a_0 = F^2$, as in 18.
    Suppose the localized source has mass at least $eta d$. For each positive bottom scale use the entrance
    boundary $K_sigma$, the supported contact set $cal(S)_sigma$,
    and the Borel threshold event $cal(G)_sigma$ defined in 5.
    Write $hat(h) = hat(h)_sigma$ and $h = h_sigma = \( pi_X \)_(\#) hat(h)$; both have mass $integral f$.
    By 17, the $hat(h)$-mass of $K_sigma \\ cal(G)_sigma$ is at most
  #[#set math.equation(numbering: n => "(6.29)")
   $ o \( 1 \) + C e^(- a_0) d $ <pk:bottom-remainder>]
  as the bottom tends to zero. We estimate the contacts in $cal(G)_sigma ∩ cal(S)_sigma$,
    whose $hat(h)$-mass equals $hat(h) \( cal(G)_sigma \)$, uniformly in that bottom.
  At such a contact let $underline(s)$ be its derivative scale and $s_0 gt.eq
    underline(s)$ a threshold equality on the outward vertical.
    In particular this includes a contact on a vertical side below a grazing equality.
    The continuous stopping rule and localization give
  $ tau_(s_0) \( x \) = e^(- a_0) \, wide tau_v \( x \) lt.eq
    e^(- a_0) quad \( underline(s) lt.eq v lt.eq rho \) \, wide h_(underline(s)) \( x \) lt.eq C e^(- a_0) . $
  The harmless cutoff errors can be absorbed in fixed constants in these relations.
    There is room for the fixed dilation $sqrt(2) s_0 < rho$:
    for $s in \[ rho \/ sqrt(2) \, rho \]$, the total mass bound gives $tau_s lt.eq C rho^(- m) d =
    o \( e^(- a_0) \)$, using $a_0 = F_Q \( T \)^2 = o \( T \)$ and $\| log rho \| = O \( F_Q \( T \) + log T \)$.
    Thus (6.26) holds with $theta = e^(- a_0)$, $u_x = underline(s)$, and $s_x = s_0$.
  For this periodized application, $u_x lt.eq s_x = s_0 < rho$,
    and every fixed dilation of the balls used in the proof has a Euclidean lift inside the fixed coordinate chart
    for large $T$. The upper Gaussian comparison holds termwise over lifts outside the torus metric ball;
    at these radii $G_s lt.eq C s^(- m)$, and the lower bound on fivefold balls comes from the nearest lift.
    The two Euclidean selections and their volume comparisons therefore apply in that chart,
    with the radii already bounded by $rho$.
  Each such contact has a band and a grid supplying the ordered witnesses of Lemma 6.1, Lemma 6.2.
    For a band $i$ and grid $g$, let $A_(i \, g) subset cal(G)_sigma ∩
    cal(S)_sigma$ be the contacts admitting an eligible chain for that pair,
    and let $E_(i \, g)$ be the union of all its eligible full innermost cubes.
    The finitely many sets $A_(i \, g)$ cover $cal(G)_sigma ∩ cal(S)_sigma$;
    they may overlap and need not be measurable. Each $E_(i \, g)$ is Borel because the dyadic family is
    countable, and 24 gives $nu \( E_(i \, g) \) lt.eq C e^(- B_i^(1 \/ 8)) d$.
  For a contact in $A_(i \, g)$, choose any one eligible chain. Its threshold ball lies in the innermost cube.
    Indeed $a \( s_0 \) = a_0 + O \( 1 \)$, the smallest witness has level at least $B_i gt.eq 2 a_0$,
    and $\| a' \| lt.eq C$. Hence
  $ log \( s_min \/ s_0 \) gt.eq c \( B_i - a_0 - O \( 1 \) \) arrow.r oo . $
  The cube contains $B_(s_min) \( x \)$, so it contains $B_(L_0 s_0) \( x \)$ for the fixed constant in 25.
  For every subset $A subset K_sigma$, the induced outer measures obey
  $ hat(h)^(*) \( A \) lt.eq h^(*) \( pi_X A \) . $
  Indeed, a Borel spatial set $V supset pi_X A$ has $A subset pi_X^(- 1) V$ and $hat(h) \( pi_X^(- 1) V \) =
    h \( V \)$; take the infimum over such $V$. Apply 25 to the center set $pi_X A_(i \, g)$,
    choosing for each center any one contact in that class and its radii.
    Its threshold ball lies in $E_(i \, g)$, and the Gaussian hypotheses were verified above for the full
    projection $h$. Thus repeated centers introduce no multiplicity factor, and $h^(*) \( pi_X A_(i \, g) \) lt.eq
    C nu \( E_(i \, g) \)$. The covering proof uses no measurable choice of contacts or chains.
    Outer subadditivity now gives
  #[#set math.equation(numbering: n => "(6.30)")
   $ hat(h) \( cal(G)_sigma \) & = hat(h) \( cal(G)_sigma ∩ cal(S)_sigma \)\
 & lt.eq sum_(i \, g) hat(h)^(*) \( A_(i \, g) \) lt.eq sum_(i \, g) h^(*) \( pi_X A_(i \, g) \)\
 & lt.eq C sum_(i \, g) nu \( E_(i \, g) \) lt.eq C sum_(i = 1)^Q e^(- B_i^(1 \/ 8)) d . $ <pk:all-contact-bound>]
  The band choice in 21 ensures $B_1^(1 \/ 10) gt.double F^3$.
    Consequently the right side of (6.30), and also $C e^(- a_0) d$, are $o \( eta d \)$ as $T arrow.r oo$.
    First take $T$ large with all fixed parameters chosen as above, and then take the bottom small in (6.29).
    These bounds contradict $hat(h) \( K_sigma \) = h \( X \) gt.eq eta d$.
  Thus the localized source has mass less than $eta d$. Restoring its subtractive margin,
    whose integral is at most $C eta d$, proves
  $ integral w \( L - C_Q Lambda \) lt.eq C e^(- 2 F_Q \( T \)) d lt.eq e^(- F_Q \( T \)) d $
  for sufficiently large $T$, uniformly over the stated nonnegative unit Lipschitz weights.
    This proves the induction step and hence 13 for every positive integer $Q$. ◻
]

== 7 A center adapted to the multiplicity defects <sec:centering>

We now use the signed estimate to construct a single reference graph.
  Its height error will be supported in a set of vanishing density.
  Two features of the construction are needed later: neighboring minimal fits agree to #emph[second] order in the
  height error, and failure of a fit forces a definite amount of lower multiplicity in every fixed interior subball.

Minimal-graph refinement and Jacobi regularization of an average appear in Brena–De Lellis–Franceschini
  #cite(label("BDLF2025")) Sections 2 and 6.3–6.4. Almgren developed the center-manifold approach to
  higher-multiplicity regularity #cite(label("Almgren2000")).
  De Lellis–Spadaro construct a center manifold from smoothed local averages and Whitney gluing
  #cite(label("DLS2016II")) Sections 1 and 4. Here the fits are selected using multiplicity defects,
  and we prove their quadratic compatibility before gluing them.

=== 7.1 Minimal fits and separation <minimal-fits-and-separation>

We specify the points at which the construction is made. Translate such a point to the origin, and write $P_0 =
  bb(R)^m times { 0 }$ and $pi_0$ for its orthogonal projection.
  Define the dilated varifold explicitly by $V_r \( Phi \) =
  r^(- m) integral Phi \( X \/ r \, T_X E \) thin #h(-0.16667em) d mu \( X \)$. The hypotheses are

#[#set math.equation(numbering: n => "(7.1)")
 $ V_r arrow.r Q \| P_0 \| \, wide r^(- m) mu #scale(x: 120%, y: 120%)[\(] upright(bold(B))_r \( 0 \) ∩ { theta
   eq.not Q } #scale(x: 120%, y: 120%)[\)] arrow.r 0 \, wide Q in bb(N) \\ { 0 } \, $ <ce:typical>]

where the first convergence includes the tangent-plane variable.
  Thus dilated masses and tangent projections converge to those of the multiplicity-$Q$ plane.
  As usual, $theta$ is the integer multiplicity at almost every point of the rectifiable set.

These hypotheses also give a support statement. In a sufficiently small punctured ambient ball,

#[#set math.equation(numbering: n => "(7.2)")
 $ \| X_v \| lt.eq epsilon \( \| X \| \) \| X_h \| quad \( X in "spt" mu \) \, wide epsilon \( s \) arrow.r
   0 . $ <ce:cone>]

Indeed, if $\| X_v \| gt.eq epsilon_0 \| X \|$ along a sequence $X arrow.r 0$,
  the balls $upright(bold(B))_(c epsilon_0 \| X \|) \( X \)$ have mass at least $c' epsilon_0^m \| X \|^m$ by 3.
  After dilation by $\| X \|^(- 1)$ these balls stay a fixed positive distance from $P_0$, contrary to (7.1).
  Passing from $\| X \|$ to $\| X_h \|$ changes the function $epsilon$ only by a factor tending to one.

Choose a cylinder strictly inside that ambient ball, with the support separated from its vertical boundary,
  and dilate it to contain the fixed base ball $B_300 subset P_0$.
  All varifolds below are restrictions to this cylinder, and all tests have horizontal support away from its side.
  The mass of each fixed interior ball is bounded above by a constant depending on the fixed data, including $Q$,
  times its radius to the power $m$: apply monotonicity at that center and a fixed larger radius.
  By choosing the initial dilation sufficiently small, the height on the fixed cylinder and the weak mass error
  can be made arbitrarily small. In addition the measure

#[#set math.equation(numbering: n => "(7.3)")
 $ lambda = \( pi_0 \)_(\#) #scale(x: 120%, y: 120%)[\(] mu corner.l.b { theta eq.not Q }
   #scale(x: 120%, y: 120%)[\)] $ <ce:defectmeasure>]

satisfies, for all radii needed in the fixed chart,

#[#set math.equation(numbering: n => "(7.4)")
 $ lambda \( B_s \( 0 \) \) lt.eq eta s^m \, wide lambda \( B_s \( 0 \) \) =
   o \( s^m \) quad \( s arrow.b 0 \) . $ <ce:initialdefect>]

Here $eta > 0$ can be prescribed before making the dilation.
  To see this, (7.2) puts the relevant part of the cylinder above $B_s \( 0 \)$ inside
  $upright(bold(B))_(2 s) \( 0 \)$, and then one uses the second limit in (7.1).
  We will choose one sufficiently small $eta$ below and keep the resulting data fixed.

#thm([Lemma 7.1.])[
  (Minimal fits and their compatibility).  #emph[Fix a finite derivative order $J gt.eq 6$.
    There are an integer $k_0 > J + 4$, integers $q \, N$, and constants $C \, m_(*) > 0$,
    depending only on the dimensions, $Q$, and these fixed orders, with the following property.
    For $0 < m_0 < m_(*)$ and sufficiently small initial height and mass error,
    one can make the following construction simultaneously for every $x in B_5$.]
  #emph[At the scales $ell_j = 2^(- j)$ construct smooth minimal graphs $S_(x \, j) =
    "graph" f_(x \, j)$ over $B_(80 ell_j) \( x \)$, and stop at the first scale for which
#[#set math.equation(numbering: n => "(7.5)")
 $ sup { \| X_v - f_(x \, j) \( X_h \) \| : X in "spt" mu \, med
   X_h in B_(64 ell_j) \( x \) #scale(x: 120%, y: 120%)[}] lt.eq m_0 ell_j^(k_0) $ <ce:accept>]

 fails. If there is no failure, all scales are constructed.
   The graph at the first failed scale is included in the construction.
   On fixed interior enlargements of its test ball, every constructed graph satisfies the height upper bound $C
   m_0 ell_j^(k_0)$, the tilt and mass-defect bounds
#[#set math.equation(numbering: n => "(7.6)")
 $ ell_j^(- m) #scale(x: 120%, y: 120%)[\(] D + \| M \| #scale(x: 120%, y: 120%)[\)] \( B_(70 ell_j) \( x \) \)
   lt.eq C a_j^2 \, wide a_j = m_0 ell_j^(k_0 - 1) \, $ <ce:fitenergy>]

 and the following centering estimate. For each smooth vector test $zeta$ supported in $B_70$,
#[#set math.equation(numbering: n => "(7.7)")
 $
   lr(|ell_j^(- m) integral frac(X_v - f_(x \, j) \( X_h \), ell_j) dot.op zeta (frac(X_h - x, ell_j)) thin
   #h(-0.16667em) d mu \( X \)|) lt.eq C a_j^2 parallel zeta parallel_(H^q) . $ <ce:moment>]

 The same assertion holds in normal coordinates over $S_(x \, j)$,
   with base volume in the definition of the distribution.]
  #emph[Every graph has physical derivatives of orders $1 \, dots.h \,
    J$ bounded by $C m_0$ in the fixed initial coordinates. If two constructed fits have comparable scales and a
    common interior region containing a ball of radius comparable to $ell$, then,
    on a fixed smaller ball in that region,
#[#set math.equation(numbering: n => "(7.8)")
 $ parallel D^i \( f - f' \) parallel_(L^oo) lt.eq C m_0^2 ell^(2 k_0 - 1 - i) \, wide 0 lt.eq i lt.eq
   J . $ <ce:overlap>]

 The constants in this last assertion can depend on the fixed scale ratio and the fixed interior room.
   No measurability of $x mapsto f_(x \, j)$ is required.]
] <ce:fit>

#proof[
  We first give a local correction argument, keeping all its domains a fixed positive distance apart.
    Work in units of one fitting scale and normal coordinates over a smooth minimal input $S'$.
    Suppose that its slope and a sufficiently large finite number of its scaled derivatives are small,
    the mass is bounded, the selected integer is $Q$, and $\| z \| lt.eq C a$.
    Here and throughout this proof constants may incorporate fixed factors such as $2^(k_0)$.
  For the ambient normal displacement field $Z \( X \) = X - pi \( X \)$, direct differentiation gives
  #[#set math.equation(numbering: n => "(7.9)")
   $ "tr" \( P thin D Z \) = e - P_(h h) : A_z \( I - A_z \)^(- 1) = e - H_(S') dot.op z +
     O \( \| A \|^2 \| z \|^2 + \| A \| e \| z \| \) . $ <ce:normaltrace>]
  Testing stationarity with $chi^2 Z$, as in the classical height-to-tilt estimate #cite(label("Allard1987"))
    Lemma 31, absorbing the last term, and using $\| P_(v h) \|^2 lt.eq e$ gives
  $ integral chi^2 e thin #h(-0.16667em) d mu lt.eq C integral #scale(x: 120%, y: 120%)[\(] \| nabla chi \|^2 + \|
    A \|^2 chi^2 #scale(x: 120%, y: 120%)[\)] \| z \|^2 thin #h(-0.16667em) d mu lt.eq C a^2 . $
  Here $H_(S') = 0$ is essential: it removes the term linear in height.
    7 then gives $\| M \| lt.eq C a^2$ on smaller balls. The integer is the previously selected $Q$:
    moving a normalized smooth mass test between the old and new projections changes its average by $O \( a \)$,
    while the old mass defect is $O \( a^2 \)$. For small $a$ its average therefore remains within $1 \/
    4$ of $Q$. The exceptional projection counts occupy only $O \( a^2 \)$ of each such ball.
    Apply 7 successively through overlapping balls if the smaller region is not concentric.
  Let $u = Q^(- 1) pi_(\#) \( z mu \)$, interpreted as a distributional normal section using $"vol"_(S')$.
    Normal stationarity and horizontal stationarity with a linear height multiplier imply
  #[#set math.equation(numbering: n => "(7.10)")
   $ lr(|integral_(S') (nabla^perp u : nabla^perp v - "tr" \( A_u A_v \)) #h(-0.16667em) d "vol"_(S')|) lt.eq
     C a^2 parallel v parallel_(C^N) $ <ce:jacobi>]
  for compactly supported smooth normal fields $v$ in a smaller region.
    Derivatives of $u$ in this formula are distributional. For completeness,
    the trace of the normal test $v compose pi$ is
  $ - P_(h h) : A_v \( I - A_z \)^(- 1) + P_(v h) : nabla^perp v thin \( I - A_z \)^(- 1) . $
  Its terms of first order in $\( z \, P_(v h) \)$ are $- "tr" \( A_z A_v \) + P_(v h) : nabla^perp v$;
    the constant trace is $- H_(S') dot.op v = 0$. The horizontal lift multiplied by $z dot.op
    w$ identifies $nabla^perp u$ with $Q^(- 1) pi_(\#) \( P_(v h) mu \)$ to first order.
    All remainders contain $e$, $\| z \| sqrt(e)$, or $\| z \|^2$, against bounded derivatives of the test.
    Their mass is $O \( a^2 \)$. This proves (7.10), including the normal-connection terms.
    Its bilinear form can also be read directly from the quadratic part of the graph area integrand,
    whose differential blocks are $\( I - A_v \, nabla^perp v \)$.
  Here is the local elliptic argument that turns (7.10) into an exact minimal correction.
    Choose an integer $q > m \/ 2 + 1$ sufficiently large that the right side of (7.10) is bounded by the
    $H^(q + 2)$ norm of $v$, and choose a positive integer $s > m \/ 2 + J + 3$.
    Fix a nested chain between the available radius $128$ and the required radius $80$,
    for example with intermediate radii $120 \, 112 \, 104 \, 96 \, 88$,
    subdividing these intervals into finitely many further radii for the Sobolev bootstrap.
    Successive restrictions below use this fixed chain; all cutoffs and extensions have a positive buffer.
    For any nested pair of these working balls the Jacobi operator $cal(J)$ has a local right inverse $cal(R)$ with
  #[#set math.equation(numbering: n => "(7.11)")
   $ parallel cal(R) F parallel_(H^(t + 2)) lt.eq C_t parallel F parallel_(H^t) \, wide - q - 2 lt.eq t lt.eq s \,
     wide cal(J) cal(R) F = F quad upright("on the smaller ball") . $ <ce:inverse>]
  Only finitely many coefficient derivatives are involved. One explicit construction removes boundary
    compatibility issues as follows. Embed the working balls in a fixed flat torus,
    extend the small coefficient perturbations of $- Delta$ by a fixed cutoff,
    and choose a smooth scalar bump $b$, supported outside the larger ball, with integral one.
    The operator $- Delta + b integral_(bb(T)^m) \( dot.op \)$ is invertible:
    integrate the equation to obtain the mean of the unknown,
    solve the remaining mean-zero equation by Fourier series, and restore that mean.
    The Fourier multiplier gains two derivatives on every integer Sobolev scale.
    Its sufficiently small coefficient perturbation is invertible on each of the finitely many scales in (7.11) by
    a Neumann series. Multiply $F$ by a cutoff equal to one on the desired smaller ball and apply this inverse.
    On that ball the added bump term is zero, so the asserted equation is exact.
  Apply this construction to the residual $cal(J) u$. On a smaller ball, $v_0 = u -
    cal(R) \( cal(J) u \)$ satisfies $cal(J) v_0 = 0$ and $u - v_0 = O \( a^2 \)$ in $H^(- q)$.
    Moreover $u = O \( a \)$ in that norm, since it is a measure of mass $O \( a \)$.
    Interior regularity gives $parallel v_0 parallel_(H^(s + 2)) lt.eq C a$ after another restriction.
    This last estimate follows directly from (7.11): apply the equation to nested cutoffs of $v_0$;
    each commutator has order at most one, so each step improves the available Sobolev order by one.
    Iteration reaches $s + 2$ and then Sobolev embedding gives every fixed derivative bound required here.
  Write the minimal graph equation for a normal section as $cal(J) v + cal(N) \( v \) = 0$.
    In $H^(s + 2)$ on these fixed balls, the product rule and $s > m \/ 2$ give
  $ parallel cal(N) \( v \) parallel_(H^s) lt.eq C parallel v parallel_(H^(s + 2))^2 \, quad
    parallel cal(N) \( v \) - cal(N) \( w \) parallel_(H^s) lt.eq
    C \( parallel v parallel_(H^(s + 2)) + parallel w parallel_(H^(s + 2)) \) parallel v - w parallel_(H^(s + 2)) . $
  Extend $v_0$ by a cutoff and solve $w = - cal(R) cal(N) \( v_0 + w \)$ on a ball of radius $C
    a^2$ in $H^(s + 2)$, putting the nonlinear cutoff equal to one on the ultimate working region.
    This is a contraction for small $a$. On that region $v = v_0 + w$ defines an exact minimal graph and $v - u =
    O \( a^2 \)$ in $H^(- q)$. Interior differentiation of the equation gives smoothness and any further fixed
    derivative estimates.
  Converting this normal graph to a graph over $P_0$ gives the desired centered fit.
    Vertical displacement at the fixed horizontal base is a smooth linear transformation of $z$,
    up to $O \( \| z \|^2 \)$. Moving the argument of a smooth test from one projection to the other costs
    $O \( a^2 \)$ when multiplied by the height. Finally, evaluating the graph correction against $pi_(\#)
    mu$ instead of $Q "vol"_(S')$ costs $O \( a^3 \)$, by the mass-defect bound and its $O \( a \)$ size.
    The first-order term is $Q \( u - v \)$, proving (7.7). The same argument after changing to the new normal
    coordinates proves the normal version. The new graph has height error $C a$ and tilt $C a^2$;
    another application of 7 gives its mass estimate.
  We apply this procedure at $j = 0$ using the horizontal plane as input,
    with initial errors small enough that (7.5) holds there. At $j > 0$ use the preceding successful fit.
    Its test ball has radius $128 ell_j$, whereas the new graph is required only on $B_(80 ell_j) \( x \)$.
    Thus all the fixed intermediate balls just used fit inside the available region.
    Its height error in the new scaled units is at most $2^(k_0) m_0 ell_j^(k_0 - 1)$.
    This proves the stated bounds at every constructed scale, including the first failure.
    The correction at scale $ell$ has physical derivatives of order $i$ bounded by $C m_0 ell^(k_0 - i)$.
    Summing over the earlier dyadic scales is finite for $i lt.eq J < k_0$.
    This maintains the small physical $C^J$ bounds. The order choices here are noncircular:
    first fix $J$ and the finite test order in (7.10), then $q \,
    s$ and the finite coefficient order required by (7.11), then $k_0$ and finally the smallness threshold for
    $m_0$. The required coefficient order may exceed $J$. Its uniform #emph[scaled] derivative bounds follow by
    interior bootstrapping of each exact minimal input from its small slope and scaled $C^(2 \, alpha)$ bound,
    using the room between its domain and the new working region. The plane supplies this bound at initialization.
    Under the next halving of scale the second-derivative norm contracts by $1 \/
    2$ and its Hölder seminorm by $2^(- 1 - alpha)$, while the correction adds only $C
    a_j$ and the slope increments $C a_j$ are summable. This closes the inductive bound before the higher-order
    bootstrap is applied. In particular the scaled $C^(q + 2)$ bounds used for changes of projection,
    multiplication of Sobolev tests, and the overlap argument below do not require physical derivatives through
    order $q + 2$ to be included in $J$. Every threshold and constant is thus uniform along the construction.
  It remains to prove the quadratic compatibility. Scale a common interior ball to unit size and put $a =
    m_0 ell^(k_0 - 1)$. For two fits $f_1 \, f_2$, the difference $d = f_1 -
    f_2$ solves a homogeneous uniformly elliptic linear system:
    integrate the derivative of the minimal-graph flux along the segment between their gradients.
    Its coefficients have the bounded derivatives and small ellipticity perturbation already established.
    The height bounds on the support and the projection-count conclusion of 7 first give $parallel d
    parallel_(L^1) lt.eq C a$ on an interior ball. Indeed, on a typical normal fiber of the first fit,
    choose a support point. Both fits are within $C a$ of that point at its horizontal coordinate.
    Moving back to the horizontal coordinate of the normal base point costs $O \( a \)$ by the small slopes,
    so the difference there is $C a$. The exceptional base volume is $O \( a^2 \)$,
    and the small slopes bound the difference there by a fixed constant once it is bounded at one point.
    Interior estimates for this homogeneous system therefore give $parallel d parallel_(C^(q + 2)) lt.eq
    C a$ on a smaller ball.
  Subtract the two fixed-base moment estimates. This gives $integral d zeta thin #h(-0.16667em)
    d \( \( pi_0 \)_(\#) mu \) = O \( a^2 \) parallel zeta parallel_(H^q)$, increasing $q$ once if necessary.
    To compare this with base volume, first replace $pi_0 X$ by $pi_0 pi_(S_1) X$ in the test $d zeta$.
    The displacement is $O \( a \)$ and $d zeta$ has derivatives $O \( a \)$, so the error is $O \( a^2 \)$.
    Now 7 changes the measure to $Q "vol"_(S_1)$ with error $O \( a^3 \)$.
    Thus, writing $J_(f_1)$ for the area density of the graph over $P_0$, $J_(f_1) d =
    O \( a^2 \)$ in a fixed negative Sobolev norm. Multiplication by $J_(f_1)^(- 1)$ preserves that bound.
    The same homogeneous interior estimates, now starting from this negative norm,
    give $parallel d parallel_(C^J) lt.eq C a^2$. Returning to physical coordinates gives (7.8). ◻
]

#thm([Lemma 7.2.])[
  (A failed fit forces separation).  #emph[Fix $0 < c_0 < 1 \/ 10$ and a tilt threshold $epsilon_0 > 0$.
    By reducing the admissible upper bound for $m_0$ in 26, there is a constant $c >
    0$ with the following property. If the first failure at $x$ has scale $ell$,
    then in every base ball of radius $c_0 ell$ whose center lies in $B_(30 ell) \( x \)$,
    normal projection onto the failed fit has a subset of base volume at least $c
    ell^m$ on which the total integer count is $Q$ and two entries have separation at least $c m_0 ell^(k_0)$.
    Those two entries have tilt at most $epsilon_0$ relative to the fit and each has multiplicity strictly less
    than $Q$. The word “entry” refers to a point where the projection Jacobian is nonzero,
    with its integer multiplicity; no smoothness of a sheet is asserted. In particular no failure occurs when $Q = 1$.]
] <ce:failed>

#proof[
  Suppose the assertion fails along a sequence $m_0 arrow.b 0$.
    Dilate each failed fitting ball by $ell^(- 1)$ and put $a = m_0 ell^(k_0 - 1)$.
    Relative to its failed fit, $\| z \| lt.eq C a$ and $D + \| M \| lt.eq C a^2$ on fixed interior balls.
    The reference graphs converge smoothly to a plane. Identify their bases by their graph coordinates,
    including their volume densities in the transported measures.
    After taking a subsequence on the connected interior disk $B_70$,
  #[#set math.equation(numbering: n => "(7.12)")
   $ a^(- 2) pi_(\#) \( \| z \|^2 mu \) harpoon.rt nu \, wide a^(- 2) pi_(\#) \( B mu \) harpoon.rt beta \, wide
     a^(- 2) D harpoon.rt d \, wide a^(- 2) M harpoon.rt frak(m) \, wide d = "tr" beta . $ <ce:limits>]
  Here $nu \, d$ are positive, $beta$ is a positive semidefinite matrix-valued measure, and $frak(m)$ is signed.
    The bound $\| z \| \/ a lt.eq C$ and $pi_(\#) mu = Q "vol"_S + O \( a^2 \)$ in total variation imply $nu lt.eq
    C thin #h(-0.16667em) d y$ on every compact interior set.
  Failure means that the fixed-base vertical error exceeds $a$ at a support point over $B_64$.
    Since the failed graph has uniformly small slope, its nearest normal distance is comparable to that vertical
    error. Thus $\| z \| gt.eq c a$ at this point. The change of projection moves its base point by $O \( a \)$,
    so a fixed interior ball about it still lies over $B_70$.
    By (7.9) and the vanishing curvature of the scaled fits, the tangential Laplacian of $\|
    z \|^2$ is bounded below by $- o \( a^2 \)$. More explicitly,
    absorb the $e \| A \| \| z \|$ term in the nonnegative $e$ term and retain $- C \| A \|^2 \| z \|^2$.
    Adding $o \( a^2 \) \| X - X_1 \|^2$ gives a nonnegative subharmonic function on a fixed interior ambient ball
    about that point. Its mean-value inequality from 3 shows that $nu \( B_70 \) gt.eq c > 0$.
  The signed estimate gives the crucial additional inequality
  #[#set math.equation(numbering: n => "(7.13)")
   $ 2 frak(m) lt.eq d . $ <ce:limitsign>]
  We check its physical-scale hypothesis even if $ell$ stays bounded away from zero.
    Before applying 13, dilate the original physical space by $lambda_0 = m_0^sigma$,
    where $0 < sigma < 1 \/ \( J - 1 \)$ and $J$ is increased beforehand if further fixed coordinate derivatives
    are required. A physical derivative of order $i lt.eq J$ of a fit is now bounded by $C m_0 lambda_0^(1 - i)$,
    hence uniformly bounded. A comparable test ball has physical radius $l asymp lambda_0 ell$,
    and its physical height is at most $C lambda_0 ell a$. With $d_0 = C a^2$ and $T = - log d_0$, choose
  #[#set math.equation(numbering: n => "(7.14)")
   $ 0 < kappa < min {sigma / 2 \, frac(1, 2 \( k_0 - 1 \))} . $ <ce:physicalparameters>]
  Then $l + sup \| z_(upright("phys")) \| lt.eq d_0^kappa$ for all sufficiently small $m_0$,
    uniformly in $0 < ell lt.eq 1$. The fits are minimal, so their $Lambda$ consists only of physical height
    squared and $Lambda \/ a^2 lt.eq C lambda_0^2 ell^2 pi_(\#) mu arrow.r 0$ locally.
    Apply 13 on finitely many interior balls to an arbitrary nonnegative smooth test,
    rescaling its size and Lipschitz constant by fixed factors. Divide by $a^2$ and pass to the limit.
    Its error is $O \( e^(- F_Q \( T \)) \)$, which tends to zero, proving (7.13).
  We next prove that $nu$ is nonzero in #emph[every] open interior subball.
    This is a finite-radius unique-continuation argument for the limiting measures,
    and requires no regularity theorem for a multiple-valued limiting function.
    Fix an interior center $y_0$ and an integer $p gt.eq 4$, and set
  $ phi.alt_s \( y \) = s^(- m) (1 - frac(\| y - y_0 \|^2, s^2))_(+)^p \, wide psi_s \( y \) =
    2 p thin s^(- m) (1 - frac(\| y - y_0 \|^2, s^2))_(+)^(p - 1) . $
  In this paragraph only, define
  $ cal(H) = integral psi_s thin #h(-0.16667em) d nu \, quad cal(A) =
    s^2 integral phi.alt_s thin #h(-0.16667em) d frak(m) \, quad cal(D) =
    s^2 integral phi.alt_s thin #h(-0.16667em) d d \, quad cal(R) =
    integral psi_s thin #h(-0.16667em) d beta \[ y - y_0 \, y - y_0 \] . $
  Dots denote differentiation in $log s$. Stationarity gives
  #[#set math.equation(numbering: n => "(7.15)")
   $ dot(cal(A)) = 2 cal(A) - cal(D) + cal(R) \, wide dot(cal(H)) = 2 cal(D) \, wide cal(R) cal(H) gt.eq
     cal(D)^2 \, wide 2 cal(A) lt.eq cal(D) . $ <ce:limitidentities>]
  Here are the identities before the limit. The horizontal test $\( y - y_0 \)
    phi.alt_s$ gives the first equation. The normal test $z phi.alt_s$ identifies $s^2 integral phi.alt_s e \/ a^2
    thin #h(-0.16667em) d mu$ with
  $ integral psi_s thin frac(z dot.op P_(v h) \( y - y_0 \), a^2) thin #h(-0.16667em) d mu + o \( 1 \) . $
  The horizontal test $\( y - y_0 \) psi_s \| z \|^2 \/ a^2$ gives twice this flux for the derivative of the
    height integral. Terms containing both tilt and $\| z \|^2 \/ a^2$ have mass $O \( a^2 \)$,
    and the geometric errors tend to zero by (7.9) and 4. Finally $P_(h v) P_(v h) = B - B^2 lt.eq
    B$ and Cauchy–Schwarz bound the square of the flux by the product defining $cal(R) cal(H)$.
    The last inequality is (7.13).
  Suppose there is a positive first radius $s_0$ at which this height becomes nonzero.
    Put $t = log s$, $t_0 = log s_0$, and choose a fixed $t_1 > t_0$ with all the balls strictly interior.
    On $\( t_0 \, t_1 \]$ put $P = cal(A) \/ cal(H)$ and $n = cal(D) \/ cal(H)$. Then
  #[#set math.equation(numbering: n => "(7.16)")
   $ n gt.eq 0 \, wide 2 P lt.eq n \, wide dot(P) gt.eq 2 P - n + n^2 - 2 n P . $ <ce:limitfrequency>]
  For $P gt.eq 1$ the last expression is nonnegative on $n gt.eq 2 P$.
    Consequently $P \( t \) lt.eq max \( 1 \, P \( t_1 \) \)$ going inward.
    On the zero-height core, the second identity in (7.15), applied also to smaller balls and other centers,
    gives $d = 0$. To pass the total-variation estimate of 7 to this core,
    reuse the auxiliary physical dilation $lambda_0 = m_0^sigma$ above:
    it leaves normalized $M \, D$ unchanged and makes $a^(- 2) Lambda arrow.r 0$.
    For a ball $B$ with $3 B$ compactly inside the core, take $chi in C_c \( 3 B \)$ equal to one on $2 B$.
    For every $zeta in C_c \( B \)$ with $\| zeta \| lt.eq 1$, that estimate gives
  $ \| frak(m) \( zeta \) \| lt.eq C lim_i integral chi thin a_i^(- 2) \( D_i + Lambda_i \) =
    C integral chi thin #h(-0.16667em) d d = 0 . $
  Hence $frak(m) = 0$ in the core, without a boundary-continuity assumption on the limiting measures.
    The compact kernels converge uniformly as $t arrow.b t_0$ and vanish on the boundary of the core,
    so $cal(A) \( t \) arrow.r 0$ even if $frak(m)$ charges that boundary. Moreover
  $ \( e^(- 2 t) cal(A) \)^dot.op = e^(- 2 t) \( cal(R) - cal(D) \) gt.eq - 1 / 4 e^(- 2 t) cal(H) \, $
  because $n^2 - n gt.eq - 1 \/ 4$. The function $cal(H)$ is nondecreasing.
    Integrating from $t_0$ therefore gives the explicit lower bound
  $ P \( t \) gt.eq - frac(e^(2 \( t - t_0 \)) - 1, 8) . $
  With $P$ bounded on this finite interval, (7.16) implies $dot(P) gt.eq n^2 \/ 2 - C$.
    Integration gives a uniform bound for $integral_(t_0 + epsilon.alt)^(t_1) n^2 thin #h(-0.16667em) d t$.
    Cauchy–Schwarz and $\( log cal(H) \)^dot.op = 2 n$ now preclude $cal(H) \( t \) arrow.r 0$ at $t_0$,
    a contradiction. If $nu$ vanished in an open ball but were nonzero elsewhere in the connected interior disk,
    choose a point of the zero set sufficiently close to its boundary.
    Its distance to $"spt" nu$ is positive and smaller than the available interior radius,
    producing precisely the excluded $s_0$.
  We also need strong, rather than merely distributional, information about the first moment.
    Divide the first moment by $a$ and write $U_alpha = pi_(\#) \( \( z_alpha \/ a \) mu \)$.
    The horizontal height-multiplier test has, in the limiting flat coordinates, the distributional form
  #[#set math.equation(numbering: n => "(7.17)")
   $ partial_i U_alpha = F_(i alpha) + partial_j E_(i j alpha) \, wide parallel F parallel lt.eq C \, quad
     parallel E parallel = o \( 1 \) . $ <ce:momentcompact>]
  In the flat case one may take $F_(i alpha) = pi_(\#) \( P_(v_alpha h_i) mu \/ a \)$ and $E_(i j alpha) =
    pi_(\#) \( \( z_alpha \/ a \) B_(i j) mu \)$. Cauchy–Schwarz bounds the first mass by $C$ and the second by $C
    integral e thin #h(-0.16667em) d mu = O \( a^2 \)$. In the actual coordinates,
    multiply the identity by the smooth inverse base metric and volume density.
    The additional terms have the same form: coefficients converge smoothly, flux masses remain bounded,
    and the terms containing height times tilt have mass tending to zero.
  Take the divergence in (7.17) and solve on a smaller ball by a cutoff Newtonian potential.
    First derivatives of the Newtonian kernel convolved with bounded measures form a precompact family in local
    $L^1$: their local kernels are integrable and have a uniform $L^1$ translation modulus.
    The second-derivative potential of $E$ tends to zero in measure by the weak $\( 1 \, 1 \)$ estimate proved
    in 6. The remaining harmonic distributions are compact on interior balls by their bounded negative norms.
    Thus $U$ is precompact locally in measure after replacing it by its projection-count density.
    This replacement is legitimate: the area formula and the Jacobian estimate give
  $ ∥U - (sum_(X in pi^(- 1) \( y \)) theta \( X \) z \( X \) \/ a) #h(-0.16667em) d "vol"_S \( y \)∥ = o \( 1 \) . $
  One can make the potential argument for functions throughout by mollifying with a radius chosen separately for
    each member of the sequence so that the count density changes by $o \( 1 \)$ in $L^1$.
    The above small total-variation difference remains $o \( 1 \)$ after mollification.
    The densities are uniformly integrable, since $\| z \| \/ a lt.eq
    C$ and their total counts differ from $Q$ by $o \( 1 \)$ in $L^1$.
    Finally (7.7) says that their distributional limit is zero.
    Precompactness in measure and uniform integrability therefore show that the normalized count first moment
    tends to zero in measure (indeed in local $L^1$).
  On each fixed subball, the limiting second moment is positive.
    Fibers of total count different from $Q$ have vanishing count mass by 7;
    points with tilt exceeding a number tending slowly to zero have vanishing mass by (7.6). Discard both.
    On a remaining fiber list its $Q$ normalized heights with repetitions as $w_1 \, dots.h \, w_Q$,
    and set $macron(w) = Q^(- 1) sum_i w_i$. The identity
  $ sum_(i = 1)^Q \| w_i \|^2 = sum_(i = 1)^Q \| w_i - macron(w) \|^2 + Q \| macron(w) \|^2 $
  and $\| w_i \| lt.eq C$ show that a positive amount of the second moment is variance.
    Hence a subset of fixed positive base volume has variance bounded below,
    and therefore has two heights separated by a fixed positive amount.
    Their distinct spatial entries each have multiplicity less than $Q$.
    Restoring lengths gives the asserted separation. For $Q = 1$ the variance is identically zero,
    so failure is impossible. If uniform constants for the prescribed comparable subballs failed,
    their centers and radii would have a convergent subsequence in the compact permitted range;
    the preceding argument on an interior subball of its limit gives the same contradiction. ◻
]

=== 7.2 The center and weighted estimates <the-center-and-weighted-estimates>

#thm([Proposition 7.3.])[
  (The glued center and its influence region).  #emph[Fix the desired output order $J gt.eq 6$,
    apply 26 with derivative order $J + 1$, and then choose its corresponding $k_0$ and initial parameters.
    There is a $C^J$ graph $S$ on an interior neighborhood of $0$, with $C^J$ norm at most $C m_0$,
    through $0$ and tangent to $P_0$ there, and a nonnegative Lipschitz function $t$ on the fixed base, such that
#[#set math.equation(numbering: n => "(7.18)")
 $ \| H_S \| + \| nabla H_S \| lt.eq C m_0^2 t^(2 k_0 - 4) \, wide \| z \| lt.eq C m_0 t^(k_0) quad
   upright("on ") "spt" mu . $ <ce:geometry>]

 In the first inequality $t$ is evaluated at the horizontal coordinate of the point of $S$;
   in the second it may be evaluated either at $pi_0 X$ or at $pi_0 pi_S X$, with a change of constant.
   Writing $cal(I) = { t > 0 }$, one has
#[#set math.equation(numbering: n => "(7.19)")
 $ t \( 0 \) = 0 \, wide sup_(B_r) t = o \( r \) \, wide \| cal(I) ∩ B_r \| = o \( r^m \) . $ <ce:influence>]

 In particular the support height is zero off the influence region.
   On $S$ itself its normal-projection version has the same vanishing volume density.
   If $rho$ is distance to $0$ on $S$, then $\| z \| lt.eq C rho^2$ on the support in a sufficiently small tube.]
] <ce:center>

#proof[
  Let $ell_x$ be the first failed scale at $x in B_5$, and put $ell_x = 0$ if there is no failure. Define
  #[#set math.equation(numbering: n => "(7.20)")
   $ t \( y \) = sup_(x in B_5) \( ell_x - \| x - y \| \)_(+) \, wide y in B_2 . $ <ce:tent>]
  Every function in this supremum is $1$-Lipschitz, so $t$ is $1$-Lipschitz and $cal(I)$ is the union of the
    failure balls.
  We describe the gluing before proving the density properties.
    For $epsilon.alt > 0$ use $t_epsilon.alt = max \( t \, epsilon.alt \)$.
    Choose a covering by balls of radius $c t_epsilon.alt \( y_i \)$,
    with $c > 0$ a sufficiently small fixed constant, by first taking disjoint balls of a smaller such radius and
    then enlarging them. The Lipschitz bound makes radii of intersecting enlarged balls comparable;
    the covering has bounded overlap. Smooth bumps on these balls, divided by their sum,
    give a partition ${ chi_i }$ with $\| D^j chi_i \| lt.eq C_j t_epsilon.alt \( y_i \)^(- j)$.
    At $y_i$ choose a dyadic constructed scale $L_i$ between $C_0 t_epsilon.alt \( y_i \)$ and $2 C_0
    t_epsilon.alt \( y_i \)$, capped at the initial scale $1$.
    The constant $C_0$ is fixed and the covering radii can be reduced to leave all required overlap room.
    Since $ell_(y_i) lt.eq t \( y_i \)$, these scales have been constructed.
    Where the cap is active, $L_i asymp t_epsilon.alt \( y_i \)$ still holds, with a constant depending on $C_0$.
    Let $f_epsilon.alt = sum_i chi_i f_(y_i \, L_i)$.
  On an overlapping cell of size $L$, fix one of its fits $f_(*)$ and write $f_epsilon.alt - f_(*) =
    sum_i chi_i \( f_i - f_(*) \)$. By (7.8), every derivative of order $j lt.eq J +
    1$ in this identity is at most $C m_0^2 L^(2 k_0 - 1 - j)$, by the choice of derivative order $J + 1$ in 26.
    Each $f_i$ is minimal. The mean-curvature operator and its first derivative involve at most three derivatives
    of the graph. Substitution therefore gives
  $ \| H_("graph" f_epsilon.alt) \| + \| nabla H_("graph" f_epsilon.alt) \| lt.eq C m_0^2 t_epsilon.alt^(2 k_0 - 4) . $
  The support height is at most $C m_0 t_epsilon.alt^(k_0)$, by the height bounds for the fits.
    Uniform $C^(J + 1)$ bounds give, along a sequence $epsilon.alt arrow.b 0$, a local $C^J$ limit $f$.
    Passing to the limit proves (7.18), including at $t = 0$.
    Uniform small slope supplies a normal tube on each smaller chart.
    The change in horizontal argument under nearest projection is at most $C m_0 \| z \| lt.eq C m_0^2 t^(k_0)$,
    which is a small fraction of $t$ when $t > 0$. The Lipschitz bound on $t$ therefore proves the assertion about
    the projected argument, including the zero set by a limit.
  We next use multiplicity defects to control the tents. Choose the comparable subball in 27 strictly inside the
    original failure ball. Small slope and the much smaller height displacement then imply,
    in the fixed horizontal projection,
  #[#set math.equation(numbering: n => "(7.21)")
   $ lambda \( B_ell \( x \) \) gt.eq c ell^m quad upright("for every failure ") \( x \, ell \) . $ <ce:charge>]
  This charges inside the original ball, a fact needed in the disjoint covering below.
    The change from normal to horizontal projection has a uniformly bounded Jacobian and displaces the chosen
    smaller subball by much less than its interior margin.
  Fix a large finite $K$, greater than every fixed enlargement factor that will occur in the following local
    arguments. At initialization choose $eta < c \/ \( K + 1 \)^m$ in (7.4). If $\| x \| lt.eq K ell$, then
  $ c ell^m lt.eq lambda \( B_ell \( x \) \) lt.eq lambda \( B_(\| x \| + ell) \( 0 \) \) lt.eq
    eta \( K + 1 \)^m ell^m \, $
  a contradiction. The enclosing ball is inside the fixed chart; one uses its actual radius $\| x \| + ell$,
    not an unnecessarily larger ball. Thus $\| x \| > K ell$ for all relevant failures, and $t \( 0 \) = 0$.
    If $B_(A ell) \( x \)$ meets $B_r \( 0 \)$, for a fixed $A < K$, then
  $ ell lt.eq frac(r, K - A) \, wide B_ell \( x \) subset B_(C_A r) \( 0 \) \, wide C_A = 1 + frac(A + 1, K - A) . $
  Combining (7.21) with the little-$o$ part of (7.4) now gives
  #[#set math.equation(numbering: n => "(7.22)")
   $ sup { ell : B_(A ell) \( x \) ∩ B_r \( 0 \) eq.not diameter \, med \( x \, ell \) upright(" a failure") } =
     o \( r \) . $ <ce:smallfailure>]
  All limits here hold for the one fixed choice of the initial data.
    This first excludes large intrusions using a uniform bound and only then uses differentiation to obtain the
    little-$o$ conclusion.
  For small $r$, all original failure balls meeting $B_r$ lie in $B_(2 r)$ by (7.22).
    Select disjoint original balls $B_i$ whose fivefold enlargements cover their union.
    The charges in (7.21) are disjoint, so
  $ \| cal(I) ∩ B_r \| lt.eq C sum_i \| B_i \| lt.eq C sum_i lambda \( B_i \) lt.eq C lambda \( B_(2 r) \) =
    o \( r^m \) . $
  The same small-failure estimate gives $sup_(B_r) t = o \( r \)$.
    The support contains $0$, so its zero height at $t \( 0 \) = 0$ shows that $S$ passes through $0$.
    The superlinear height bound and (7.1) force $T_0 S = P_0$.
    Smooth change of coordinates transfers the volume statement to $S$,
    and the projected height bound gives $\| z \| lt.eq C m_0 o \( rho \)^(k_0) lt.eq C rho^2$. ◻
]

We state the weighted consequences with the physical units retained.
  Let $pi = pi_S$, $z = X - pi \( X \)$, and let $rho$ be geodesic distance on $S$ to $0$ inside a normal
  coordinate ball. In these weighted estimates and the final height argument,
  $B_r$ denotes the geodesic ball ${ y in S : rho \( y \) < r }$.
  Local covering balls may be taken in fixed smooth charts;
  their comparison with metric balls changes only fixed constants.
  Choose a fixed integer $p gt.eq 4$, increasing it if needed in subsequent compact-kernel tests, and put

#[#set math.equation(numbering: n => "(7.23)")
 $ phi.alt_r = \( 1 - rho^2 \/ r^2 \)_(+)^p \, wide psi_r = 2 p \( 1 - rho^2 \/ r^2 \)_(+)^(p - 1) \, wide
   upright(bold(u)) = nabla_S rho \, quad K_z = \( I - A_z \)^(- 1) . $ <ce:kernel>]

Weighted integrals from this point onward include $r^(- m)$;
  when there is any possibility of confusion we write this factor explicitly.
  The heights $z$ are not divided by $r$. The symbols $B \, e \, M \, D \, L \,
  Lambda$ now always refer to this center. Define

#[#set math.equation(numbering: n => "(7.24)")
 $ b & = B \[ K_z upright(bold(u)) \, K_z upright(bold(u)) \] \, & h_r & = 1 - frac(b, \| K_z upright(bold(u)) \|^2) \,\
H \( r \) & = r^(- m) integral psi_r \| z \|^2 h_r thin #h(-0.16667em) d mu \, & delta \( r \) & =
  r^(- 1) sup { \| z \| : X in "spt" mu \, med rho \( pi X \) < r } . $ <ce:radialheight>]

In particular $H$ already contains the radial projection factor.
  One has $0 lt.eq h_r lt.eq 1$, since $0 lt.eq B lt.eq I$.
  At a fixed support point this factor has no dependence on the radius $r$;
  the subscript only distinguishes it from other height variables.
  On the central fiber it may be assigned any value, because $z = 0$ there.

#thm([Proposition 7.4.])[
  (Weights up to the boundary of the ball).  #emph[Either the support lies on $S$ in a neighborhood of $0$,
    or there exist $r_0 > 0$, $c \, C > 0$, and a finite $J_0$ such that, for every $0 < r < r_0$,
#[#set math.equation(numbering: n => "(7.25)")
 $ 0 < delta \( r \) lt.eq C r \, wide c delta \( r \)^(J_0) lt.eq frac(H \( r \), r^2) lt.eq
   C delta \( r \)^2 . $ <ce:height>]

 In the latter alternative, throughout $rho < r$ one also has
#[#set math.equation(numbering: n => "(7.26)")
 $ \| H_S \| + \| nabla H_S \| lt.eq C delta \( r \) r \, $ <ce:pointwisecurvature>]

 and
#[#set math.equation(numbering: n => "(7.27)")
 $ r^(- m) integral phi.alt_r #scale(x: 120%, y: 120%)[\(] \| H_S \|^2 + \| nabla H_S \|^2
   #scale(x: 120%, y: 120%)[\)] thin #h(-0.16667em) d mu lt.eq
   C r^(- m) integral phi.alt_r \| z \|^2 thin #h(-0.16667em) d mu . $ <ce:curvature>]

 The constants may depend on the fixed center construction.
   One may take any fixed $J_0 gt.eq 2 + \( m + p - 1 \) \/ k_0$ after changing $c$.]
] <ce:weights>

#proof[
  We give the geometric estimate that pays for points close to the boundary $rho = r$.
    If $t \( y \) > 0$, choose a failure $\( x \, ell \)$ for which
  #[#set math.equation(numbering: n => "(7.28)")
   $ ell - \| x - y \| > t \( y \) \/ 2 . $ <ce:witness>]
  Then $ell > t \( y \) \/ 2$, $\| x - y \| < ell$, and the Lipschitz bound gives $t \( v \) lt.eq \( 2 + A \)
    ell$ when $\| v - y \| lt.eq A ell$. An upper comparison of $ell$ with $t \( y \)$ is neither asserted nor
    needed. On this whole neighborhood the support has height at most $C m_0 ell^(k_0)$ over $S$,
    and its mass over any ball of radius comparable to $ell$ is at most $C ell^m$ by the ambient upper mass bound.
  In each fixed small comparable subball within the permitted distance from $x$,
    27 gives mass at least $c ell^m$ with distance from $S$ at least $c m_0
    ell^(k_0)$ and with tilt relative to $S$ less than, say, $1 \/ 4$.
    To verify this transfer, the normal fiber of the failed fit is transverse to the small-slope graph $S$.
    It has only one intersection with that graph in the working tube,
    and distance to $S$ is comparable to distance along the fiber to that intersection.
    Of two separated entries at least one is a fixed fraction of their separation from $S$.
    Their tilt relative to $S$ is still small, since both reference graphs have small slope.
    Restrict the subball slightly first: all changes of projection argument are $o \( ell \)$ and so preserve its
    interior margin. On this mass $h_r gt.eq 3 \/ 4$ after reducing the tilt threshold in 27 once.
  For $y$ with $rho \( y \) < r$, the witnessing scale satisfies $ell = o \( r \)$ by (7.22).
    There is a ball of radius $c_1 ell$ at distance $O \( ell \)$ from $y$, lying inside $rho < r$, on which
  #[#set math.equation(numbering: n => "(7.29)")
   $ inf phi.alt_r gt.eq c sup_C phi.alt_r \, wide inf psi_r gt.eq c sup_C psi_r \, wide inf psi_r gt.eq
     c \( ell \/ r \)^(p - 1) . $ <ce:payingweights>]
  Here $C$ is a cell of side $c_2 ell$ containing $y$, and the suprema concern its intersection with $rho < r$.
    If $y$ is already a fixed multiple of $ell$ inside the boundary, take a nearby subball there.
    Otherwise move its center inward along the radial geodesic by $C_1
    ell$ and take $c_1$ much smaller than $C_1$. The boundary distance on the new ball is at least a fixed
    multiple of the largest boundary distance on the cell and at least $c ell$.
    Since $1 - rho^2 \/ r^2$ is comparable to $\( r - rho \) \/ r$ near the boundary, this gives (7.29);
    in the central half ball all weights are bounded below. The displacement is bounded by a fixed small multiple
    of $ell$, so the new ball is among those allowed in 27. These assertions are unchanged by the smooth
    base-coordinate conversions. Thus they also apply to cells straddling $rho = r$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 4.65, fill: rgb("#f2f2ff"), stroke: none)
  circle((0, 0), radius: 0.04939, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.1176cm)
  line((0, 0), (4.65, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((2.325, 0), [#text(size: 9pt)[$r$]], anchor: "north", padding: 0.1176cm)
  content((1.782, 2.077), [#text(fill: rgb("#000073"))[#text(size: 9pt)[base ball $B_r$]]])
  circle((4.774, 1.008), radius: 1.317, stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  circle((4.774, 1.008), radius: 0.04939, fill: rgb("#a60000"), stroke: none)
  line((4.774, 1.008), (6.03, 1.411), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10))
  content((5.402, 1.209), [#text(size: 9pt)[$ell$]], anchor: "south", padding: 0.1176cm)
  content((5.534, 2.341), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[failure ball]]], anchor: "west", padding: 0.1176cm)
  line((5.58, 2.155), (5.534, 1.938), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#a60000"))))
  rect((4.077, 0.465), (4.929, 1.395), fill: rgb("#f0f0f0"), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 4.65, stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  content((4.681, -0.5115), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$rho =r$]]], anchor: "west", padding: 0.1176cm)
  circle((4.309, 0.899), radius: 0.04939, fill: black, stroke: none)
  content((4.309, 0.899), [#text(size: 9pt)[$y$]], anchor: "south-east", padding: 0.1176cm)
  circle((2.682, 0.899), radius: 0.496, fill: rgb("#dbeddb"), stroke: none)
  circle((2.682, 0.899), radius: 0.496, stroke: (paint: rgb("#003300"), thickness: 0.8pt, miter-limit: 10))
  line((3.999, 0.899), (3.286, 0.899), stroke: (paint: rgb("#bf6000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#bf6000"))))
  content((2.248, -0.496), [#text(fill: rgb("#002d00"))[#text(size: 9pt)[inward subball#linebreak()with positive height mass]]], anchor: "north", padding: 0.1176cm)
  line((2.542, -0.4495), (2.682, 0.31), stroke: (paint: rgb("#002d00"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#002d00"))))
  content((5.905, -1.101), [#text(size: 9pt)[cell crossing#linebreak()the kernel boundary]], anchor: "north", padding: 0.1176cm)
  line((5.673, -1.008), (4.867, 0.465), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
})],
    caption: [Figure 2: An inward subball controls the boundary weights on the reference center. A failure at scale $ell$ supplies separated projection entries on every sufficiently small comparable subball in its comparison region. Moving such a subball inward by $O \( ell \)$ gives positive height mass where the polynomial kernel has a controlled lower bound. This pays for a local cell even when that cell crosses $rho = r$. The picture is schematic; no circular shape of a failure region is assumed. ],
  ) <fig:collar>
  The separated mass on this inward ball gives
  #[#set math.equation(numbering: n => "(7.30)")
   $ delta \( r \) r gt.eq c m_0 ell^(k_0) . $ <ce:payingheight>]
  If the support fails to lie on $S$ in every neighborhood, then $delta \( r \) > 0$ for every small $r$.
    Choose a point with height at least half the defining supremum.
    Its height is nonzero, so it has a witness as in (7.28); (7.18) and (7.30) give
  $ c m_0 ell^(k_0) lt.eq delta \( r \) r lt.eq C m_0 ell^(k_0) . $
  The inward ball has mass at least $c ell^m$, height at least $c m_0 ell^(k_0)$, and $h_r gt.eq 3 \/ 4$. Consequently
  $ frac(H \( r \), r^2) gt.eq c delta \( r \)^2 \( ell \/ r \)^(m + p - 1) gt.eq
    c \( m_0 \) delta \( r \)^(2 + \( m + p - 1 \) \/ k_0) . $
  In the last step use $ell \/ r gt.eq c \( m_0 \) delta \( r \)^(1 \/ k_0) r^(1 \/ k_0 - 1)$ and $r lt.eq 1$.
    The upper bound in (7.25) follows from bounded normalized mass and $h_r lt.eq 1$.
    The bound $delta \( r \) lt.eq C r$ follows from 28. This proves (7.25).
  For any point with $t > 0$, its witness and (7.30) give
  $ \| H_S \| + \| nabla H_S \| lt.eq C m_0^2 ell^(2 k_0 - 4) lt.eq C m_0 ell^(k_0 - 4) delta \( r \) r lt.eq
    C delta \( r \) r . $
  At $t = 0$ the left side is zero. This proves (7.26).
  Finally group points with $t > 0$ according to the dyadic scale of a witnessing failure.
    At scale $ell = 2^(- j)$ cover the group by grid cells of side $c_2 ell$, taking each grid cell only once.
    For each occupied cell choose a witness from that group and an inward ball as above.
    On the cell the curvature-square integrand is at most $C m_0^4 ell^(4 k_0 - 8)$.
    Its mass is at most $C ell^m$. On the corresponding inward ball the integral of $phi.alt_r \|
    z \|^2$ is at least $c m_0^2 ell^(2 k_0 + m) sup_C phi.alt_r$ by (7.29). Hence
  $ integral_C phi.alt_r #scale(x: 120%, y: 120%)[\(] \| H_S \|^2 + \| nabla H_S \|^2 #scale(x: 120%, y: 120%)[\)]
    thin #h(-0.16667em) d mu lt.eq C m_0^2 ell^(2 k_0 - 8) integral_(B_C) phi.alt_r \| z \|^2 thin #h(-0.16667em)
    d mu . $
  The displacement from a cell to its inward ball is $O \( ell \)$,
    so these balls have bounded overlap at each fixed dyadic scale. Sum first over the cells and then over $j$.
    The geometric series $sum_j 2^(- j \( 2 k_0 - 8 \))$ converges because $k_0 > 4$.
    Points with $t = 0$ contribute nothing, and division by $r^m$ gives (7.27). ◻
]

#thm([Corollary 7.5.])[
  (Regularity when height vanishes).  #emph[If the support lies on the center $S$ in a neighborhood of the origin,
    then the origin is regular.]
] <ce:constancy>

#proof[
  Write the restricted varifold as $theta.alt thin cal(H)^m corner.l.b S$,
    allowing the integer density $theta.alt$ to be zero off its original support.
    This is the standard constancy argument; compare #cite(label("Simon2018")) Chapter 8, Theorem 4.1.
    Tangential first variation gives $integral_S theta.alt thin "div"_S X =
    0$ for all compactly supported tangent fields. Thus $theta.alt$ is constant almost everywhere on a connected
    smaller disk. The constant is $Q$, by (7.1). Normal first variation gives $H_S = 0$,
    and the small-gradient minimal graph equation bootstraps $S$ to a smooth graph. The origin is therefore regular. ◻
]

It remains to exclude the positive-height alternative, which is the purpose of the inward comparison.

== 8 Inward comparison and the conclusion <sec:inward>

We use the center supplied by Proposition 7.3, Proposition 7.4 at a point with the density and tangent properties
  specified there. If the varifold lies on the center in a neighborhood of the point, 30 already gives regularity.
  We therefore assume the positive-height alternative of 29 and derive a contradiction.
  In particular, none of the arguments below assumes height doubling at the outset.
  The inward subballs in 29 controlled the polynomial weights at each fixed radius.
  We now use those bounds in a separate signed-mass comparison near the same boundary:
  a radial test handles a thin outer collar, and the signed-excess theorem applies on interior balls.

=== 8.1 Signed comparison and frequency identities <signed-comparison-and-frequency-identities>

The comparison of height with energy follows Almgren’s frequency method #cite(label("DLS2011")) Section 3.4;
  cutoff frequency on a center manifold is developed in #cite(label("DLS2016III")) Section 3.
  We derive the identities needed here from stationarity. The signed-excess estimate supplies the additional
  inequality that will yield the inward height comparison.

Keep the physical normal displacement $z$ and the radial functions

$ phi.alt_r = \( 1 - rho^2 \/ r^2 \)_(+)^p \, wide psi_r = 2 p \( 1 - rho^2 \/ r^2 \)_(+)^(p - 1) \, $

where $p gt.eq 4$ is the fixed integer chosen in 29. For clarity, write

$ integral^(\( r \)) f thin #h(-0.16667em) d nu = r^(- m) integral f thin #h(-0.16667em) d nu . $

This convention applies both to measures on $S$ and to measures on the varifold;
  base functions in a varifold integral are pulled back by nearest projection.
  All integrals below have this normalization unless explicitly written otherwise.
  Abbreviate $phi.alt_r \, psi_r$ to $phi.alt \, psi$ at the radius under consideration.
  With $upright(bold(u)) = nabla_S rho$, set

$ J_z = I - A_z \, wide K_z = J_z^(- 1) \, wide v = K_z upright(bold(u)) \, wide b = B \[ v \, v \] \, wide h_r =
  1 - frac(b, \| v \|^2) . $

Here $A_z$ is the shape operator in the normal direction $z$; it is distinct from the scalar $A$ defined next.
  Recall that $0 lt.eq h_r lt.eq 1$ and that $h_r$ has no dependence on the radius at a fixed point and tangent
  plane. On the central fiber its value is immaterial, since $z = 0$ there. Define

#[#set math.equation(numbering: n => "(8.1)")
 $ H & = integral^(\( r \)) psi \| z \|^2 h_r thin #h(-0.16667em) d mu \, & A & =
   r^2 integral^(\( r \)) phi.alt thin #h(-0.16667em) d M \,\
E & = r^2 integral^(\( r \)) phi.alt thin #h(-0.16667em) d D \, & R & =
  integral^(\( r \)) rho^2 psi b thin #h(-0.16667em) d mu \,\
P & = A \/ H \, & n_(*) & = E \/ H \, wide q_(*) = R \/ H . $ <in:variables>]

The scalar ratios $n_(*) \, q_(*)$ are distinct from the ambient dimension parameters.
  The comparison we need is $2 A lt.eq E$ up to small errors:
  after division by $H$, its coefficient one gives $n_(*) gt.eq 2 P$ up to those errors.
  To see its role, omit the errors from the frequency inequalities proved below.
  With a dot denoting differentiation in $log r$, their leading terms give, for $P gt.eq 0$,

$ q_(*) gt.eq n_(*)^2 \, wide dot(P) gt.eq 2 P - n_(*) + q_(*) - 2 P n_(*) gt.eq \( n_(*) - 1 \) \( n_(*) - 2 P \) . $

Thus the signed comparison makes this leading derivative nonnegative when $P$ is large.
  We first preserve its coefficient through the boundary of the ball;
  the bootstrap will then estimate the actual errors in this calculation.

Put

$ delta = r^(- 1) sup_(rho < r) \| z \| \, wide T = log \( r^2 \/ H \) \, wide g = T^(- 20) . $

By 29, after reducing the radius,

#[#set math.equation(numbering: n => "(8.2)")
 $ 0 < delta lt.eq C r \, wide c delta^(J_0) lt.eq H \/ r^2 lt.eq C delta^2 \, wide c \| log delta \| lt.eq
   T lt.eq C \| log delta \| . $ <in:smallness>]

The finite exponent $J_0$ and all constants may depend on the fixed center.
  We distinguish the unit error $eta_1 \( r \) = C_1 delta \( r \)^alpha$ in the collar estimate from the common
  error $eta \( r \) = C_eta delta \( r \)^alpha$ in the frequency argument.
  Here $alpha > 0$ is fixed independently of the multiplier and chosen sufficiently small for the finitely many
  power errors below, and $C_1$ depends only on the fixed center data.
  We choose $C_eta$ to dominate the remaining error coefficients and the fixed multiples of $eta_1$ arising from
  the actual collar applications. Their multiplier norms are verified below to have one bound independent of $r$;
  no factor unbounded as $r arrow.b 0$ is absorbed into $C_eta$.
  Decreasing $alpha$ and increasing the constants a finite number of times gives common bounds for all the
  inequalities below. In particular, with $s = - log r$,

#[#set math.equation(numbering: n => "(8.3)")
 $ T gt.eq 2 s - C \, wide eta lt.eq C exp \( - c T \) . $ <in:exponentialerror>]

The weights first give the following comparisons:

#[#set math.equation(numbering: n => "(8.4)")
 $ integral^(\( r \)) phi.alt \| z \|^2 thin #h(-0.16667em) d mu & lt.eq C \( H + delta^2 E \) \,\
integral^(\( r \)) psi \| z \|^2 thin #h(-0.16667em) d mu & lt.eq C { H + delta^2 \( E + R \) } \,\
r^2 integral^(\( r \)) phi.alt thin #h(-0.16667em) d Lambda & lt.eq C r^2 \( H + delta^2 E \) . $ <in:weightcomparison>]

Indeed, $phi.alt lt.eq C psi$, $1 - h_r lt.eq C e$, and $\| z \| lt.eq delta r$ prove the first inequality.
  On $rho < r \/ 2$ the two weights are comparable, so the same argument applies to the second.
  On $r \/ 2 lt.eq rho < r$ use $1 - h_r lt.eq C b$ and $r^2 psi b lt.eq C rho^2 psi b$ instead.
  The last inequality follows from the weighted curvature estimate in 29 and the definition of $Lambda$.

#thm([Lemma 8.1.])[
  (The signed estimate up to the outer collar).  #emph[For $a in C^1 \( B_r \)$ put
$ parallel a parallel_(1 \, r) = sup_(B_r) #scale(x: 120%, y: 120%)[\(] \| a \| +
  r \| nabla_S a \| #scale(x: 120%, y: 120%)[\)] . $

 There is a radius $r_(upright(c)) > 0$, depending only on the fixed center data,
   such that for every $0 < r < r_(upright(c))$ the first inequality below holds for every $a in
   C^1 \( B_r \)$ with finite norm, and the second holds independently of $a$:
#[#set math.equation(numbering: n => "(8.5)")
 $ r^2 lr(|integral^(\( r \)) a phi.alt thin #h(-0.16667em) d M|) & lt.eq
   parallel a parallel_(1 \, r) #scale(x: 120%, y: 120%)[\[] C \( E + r^2 H \) +
   eta_1 R #scale(x: 120%, y: 120%)[\]] \,\
2 A & lt.eq E + C g \( E + H \) + C r^2 H + eta_1 R . $ <in:collarestimates>]

 The constants $C \, C_1$ and the radius $r_(upright(c))$ are independent of the multiplier.
   For a family $a_r$, the coefficient of $R$ in the first line is $parallel a_r parallel_(1 \, r) eta_1 \( r \)$,
   so each use of its smallness must control this product. The second line uses $a =
   1$ only in its thin-part proof. The coefficient of $E$ in the second line is exactly one before the displayed
   small errors are added.]
] <in:collar>

#proof[
  For the absolute estimate it suffices to treat $parallel a parallel_(1 \, r) lt.eq 1$ uniformly:
    apply that case to $a \/ parallel a parallel_(1 \, r)$ when the norm is positive,
    and the zero case is immediate. The signed estimate will use the member $a = 1$ of this unit class.
    Choose a small fixed $beta > 0$, with $beta < 1 \/ 4$, and put $sigma = delta^beta$;
    we may take $0 < alpha lt.eq 2 beta$ in $eta_1$. Choose a radial cutoff $chi$ equal to one when $0 lt.eq 1 -
    rho \/ r lt.eq sigma^2$, equal to zero when $1 - rho \/ r gt.eq 2 sigma^2$,
    and with derivative bounded by $C \/ \( sigma^2 r \)$. Write $phi.alt_(upright("thin")) =
    chi phi.alt$ and $phi.alt_(upright("bulk")) = \( 1 - chi \) phi.alt$.
  We first treat the bulk, including the overlap with the thin part.
    Fix first an enlargement factor $c_(upright("out")) > 8$ sufficient for Lemma 2.5,
    Theorem 3.1 and for a Caccioppoli cutoff equal to one on $B_(8 ell)$ and supported in
    $B_(c_(upright("out")) ell)$. Then choose the fixed $c_0$ small and put $ell = c_0 sigma^2 r$.
    Cover the bulk by balls of radius $ell$ with centers $x_i$ in its support.
    These centers have boundary depth at least $sigma^2 r$, so $c_0$ can be chosen so that all
    $B_(c_(upright("out")) ell) \( x_i \)$ stay inside $B_r$.
    Choose the cover with bounded overlap of these enlargements and so that the intermediate balls on which 7
    selects integers have overlaps of fixed positive relative volume along the connecting chains.
    Choose a smooth nonnegative partition of unity ${ theta.alt_i }$ subordinate to the original balls, with
  $ \| D^j theta.alt_i \| lt.eq C_j ell^(- j) wide \( 0 lt.eq j lt.eq k \) \, $
  where $D$ denotes base-coordinate derivatives and $k = k \( m \)$ is the finite test order in 6.
    Put $phi.alt_i = phi.alt \( x_i \)$. On each enlargement $phi.alt$ is comparable to $phi.alt_i$.
    The partitioned weights, divided by $phi.alt_i$ and by a fixed constant,
    have Lipschitz norm at most one in units of $ell$.
  The mass on each enlarged ball is at most $C ell^m$. To see this without assuming a local graphical
    representation, observe that $delta r = o \( ell \)$; thus the part of the tube over the ball lies in an
    ambient ball of radius $C ell$ centered at a support point.
    The upper bound follows by monotonicity, comparing with an ambient ball of radius comparable to $r$ and using
    the fixed normalized mass bound at the origin. Empty balls need no estimate.
  For the local tilt estimate, use ordinary, unnormalized physical integrals.
    Let $xi$ be a base cutoff equal to one on $B_(4 ell)$, supported in $B_(c_(upright("out")) ell)$,
    and satisfying $\| nabla_S xi \| lt.eq C \/ ell$. The analogous cutoff equal to one on $B_(8 ell)$ has the
    same derivative bound and outer support. Testing stationarity with $xi^2
    z$ and using the normal-displacement trace (7.9) gives
  $ integral xi^2 e thin #h(-0.16667em) d mu lt.eq C integral
    [#scale(x: 120%, y: 120%)[\(] \| nabla_S xi \|^2 + \| upright("II") \|^2 xi^2 #scale(x: 120%, y: 120%)[\)] \|
    z \|^2 + xi^2 \| H_S \| \| z \|] thin #h(-0.16667em) d mu . $
  Indeed, the derivative of the cutoff contributes at most $C xi \| nabla_S xi \| \| z \| sqrt(e)$;
    Young’s inequality absorbs this term and the small $\| upright("II") \| \| z \| e$ term from the trace.
    The displayed $\| H_S \| \| z \|$ term is retained because the center need not be minimal.
    The bounds $\| z \| lt.eq delta r$ and $\| H_S \| + \| nabla H_S \| lt.eq C delta r$,
    together with the local mass bound, give $ell^(- m) D \( B_(4 ell) \) lt.eq
    C \[ \( delta r \/ ell \)^2 + \( delta r \)^2 \]$. The definition of $Lambda$ gives $ell^(- m)
    Lambda \( B_(4 ell) \) lt.eq C \( delta r \)^2$ separately. Hence
  #[#set math.equation(numbering: n => "(8.6)")
   $ ell^(- m) \( D + Lambda \) \( B_(4 ell) \) lt.eq C \( delta \/ sigma^2 \)^2 lt.eq
     C delta^(2 - 4 beta) . $ <in:localdensity>]
  The same estimate holds on $B_(8 ell)$, using its cutoff in $B_(c_(upright("out")) ell)$.
    These enlargement factors were fixed before $c_0$. The coordinates have the required fixed geometry bounds,
    and the terms in $Lambda$ still use physical units.
  Apply 7 first to select the local integers. On the intermediate balls just chosen,
    the scalar exceptional sets have relative volume $O \( delta^(2 - 4 beta) \)$.
    For small $r$ they cannot fill the chosen overlaps of fixed positive relative volume, so their integers agree.
    The bulk is connected; call the common integer $q_r$. To identify it,
    rescale one fixed smooth nonnegative test supported in $B_(1 \/ 2)$ to $B_(r \/ 2)$ and normalize its
    reference-volume integral to one. Call it $phi_r$; then $\| D^j phi_r \| lt.eq C r^(- m - j)$ for $0 lt.eq
    j lt.eq k$. Partition this test over the cover. After pullback to a unit $ell$-cell,
    each product $theta.alt_i phi_r$ has $C^k$ norm at most $C r^(- m)$, since $ell lt.eq r$.
    The coordinate-volume factor in the scalar proof has fixed scaled derivative bounds through order $k$,
    so multiplying by it preserves this estimate. The distributional estimate (2.14) used in the proof of 7,
    with (8.6), bounds each cell’s error relative to $q_r$ by $C delta^(2 - 4 beta) ell^m r^(- m)$.
    Bounded overlap gives $sum_i ell^m lt.eq C r^m$, so its projected-mass average differs from $q_r$ by at most
    $C delta^(2 - 4 beta)$. Tangent convergence and the smooth rescaling of the fixed center make that same
    average $Q + o \( 1 \)$. Integrality therefore gives $q_r = Q$ for all sufficiently small $r$.
    Exact agreement on overlaps involves no error accumulated along the chain of balls.
    This also identifies the integer on the balls used in the overlap and in the thicker error collar below.
    Consequently 7 bounds $\| M \|$ on each smaller ball by the enlarged $D + Lambda$ mass.
    In particular, applying it with fixed interior room and using (8.6) also on the larger ball gives
  #[#set math.equation(numbering: n => "(8.7)")
   $ \| M \| \( B_(4 ell) \( x_i \) \) & lt.eq C \( D + Lambda \) \( B_(8 ell) \( x_i \) \) \,\
ell^(- m) tau \( B_(4 ell) \( x_i \) \) & lt.eq C delta^(2 - 4 beta) . $ <in:localscalar>]
  All these balls lie inside $B_r$ by the choice of $c_0$. Summation with comparable weights gives
  #[#set math.equation(numbering: n => "(8.8)")
   $ r^2 integral^(\( r \)) phi.alt_(upright("bulk")) thin #h(-0.16667em) d \| M \| lt.eq
     C r^2 integral^(\( r \)) phi.alt thin #h(-0.16667em) d \( D + Lambda \) lt.eq C \( E + r^2 H \) \,
     $ <in:bulkvariation>]
  using (8.4) to absorb a small multiple of $E$. For every member of the unit multiplier class this also gives
    $r^2 \| integral^(\( r \)) a phi.alt_(upright("bulk")) thin #h(-0.16667em) d M \| lt.eq C \( E + r^2 H \)$.
  For the signed estimate, invoke 13 afresh on each normal chart at physical radius $ell$.
    The measures $M \, D \, Lambda$ and the base tests are geometric,
    so they give the required data in the unit coordinates, with the measures divided by $ell^m$.
    The physical condition below belongs to this new theorem instance;
    it does not change the inherited geometry parameter in an off-center rescaling of a prior instance. On a cell use
  $ d_i = max { C ell^(- m) tau \( B_(4 ell) \( x_i \) \) \, med delta^(2 J_0 + 4) } \, wide T_i = - log d_i \, $
  with the fixed enlargement and constant sufficient for 13.
    Equation (8.7) shows that $c \| log delta \| lt.eq T_i lt.eq \( 2 J_0 + 4 \) \| log delta \|$,
    where the upper bound follows from the floor in $d_i$. Moreover
  $ ell + sup \| z \| lt.eq C delta^(2 beta) lt.eq exp \( - kappa T_i \) $
  for some fixed $kappa > 0$ and all small $r$; choose, for example, $kappa \( 2 J_0 + 4 \) < 2 beta$.
    Thus both smallness hypotheses of 13 hold even if $delta$ is smaller than every fixed power of $r$.
  Apply that result to $w_i = theta.alt_i phi.alt_(upright("bulk")) \/ \( C phi.alt_i \)$ in the coordinates
    scaled by $ell$. They are supported in $B_1$ in those coordinates and satisfy $0 lt.eq w_i lt.eq
    1$ and $"Lip" w_i lt.eq 1$. Restoring the physical measure factor $ell^m$ and then the normalization
    $r^(2 - m)$ gives
  #[#set math.equation(numbering: n => "(8.9)")
   $ 2 r^2 integral^(\( r \)) phi.alt_(upright("bulk")) thin #h(-0.16667em) d M & lt.eq
     r^2 integral^(\( r \)) phi.alt_(upright("bulk")) thin #h(-0.16667em) d D +
     C_Q r^2 integral^(\( r \)) phi.alt_(upright("bulk")) thin #h(-0.16667em) d Lambda\
 & quad + C r^(2 - m) sum_i phi.alt_i ell^m d_i e^(- F_Q \( T_i \)) . $ <in:bulksigned>]
  The last sum includes the enlarged cells, even where $phi.alt_(upright("bulk"))$ vanishes in the overlap with
    the thin part. On these cells use the local estimate (8.7):
    $phi.alt$ is comparable to $phi.alt_i$ throughout $B_(8 ell) \( x_i \)$,
    and these balls have bounded overlap inside $B_r$. Therefore
  $ sum_i phi.alt_i ell^m d_i & lt.eq C sum_i phi.alt_i tau \( B_(4 ell) \( x_i \) \) +
    C delta^(2 J_0 + 4) sum_i phi.alt_i ell^m\
 & lt.eq C sum_i phi.alt_i \( D + Lambda \) \( B_(8 ell) \( x_i \) \) + C delta^(2 J_0 + 4) sum_i phi.alt_i ell^m\
 & lt.eq C r^m integral^(\( r \)) phi.alt thin #h(-0.16667em) d \( D + Lambda \) + C r^m delta^(2 J_0 + 4) . $
  Here the last floor sum is bounded by the ordinary volume of the bounded-overlap cover.
    Since $T_i gt.eq c \| log delta \|$ and $exp \[ - F_Q \( c \| log delta \| \) \]$ is smaller than any fixed
    negative power of $T$, the remainder in (8.9) is at most
  $ C g (r^2 integral^(\( r \)) phi.alt thin #h(-0.16667em) d \( D + Lambda \) + r^2 delta^(2 J_0 + 4)) . $
  The floor term $r^2 delta^(2 J_0 + 4)$ is at most $C delta^(J_0 + 4) H$ by (8.2).
    The weighted comparison (8.4) controls the remaining integral by $C \( E + r^2 H \)$ and bounds the $C_Q
    Lambda$ term in (8.9) by $C r^2 H + o \( g \) E$, since $r^2 delta^2 = o \( g \)$.
    This proves the second line of (8.5) for the bulk, with its leading tilt term unchanged.
  It remains to estimate the signed mass on the thin part. A direct total-variation estimate here would
    unnecessarily add a full-tilt term. Instead solve a radial divergence equation.
    In geodesic polar coordinates write the volume element as $j \( rho \, omega \) thin #h(-0.16667em) d rho thin
    #h(-0.16667em) d omega$. Throughout this thin calculation $parallel a parallel_(1 \, r) lt.eq 1$,
    and all constants are uniform over that class. Initially put
  $ F \( rho \, omega \) = - j \( rho \, omega \)^(- 1) integral_rho^r a \( t \, omega \)
    phi.alt_(upright("thin")) \( t \) j \( t \, omega \) thin #h(-0.16667em) d t \, wide X = F upright(bold(u)) . $
  Then $"div"_S X = a phi.alt_(upright("thin"))$. Multiply $X$ by a radial cutoff equal to one at depths $r -
    rho lt.eq sigma r$ and zero at depths $r - rho gt.eq 2 sigma r$.
    On this latter collar the integrated numerator has size $O \( r sigma^(2 p + 2) \)$ relative to $j$.
    The cutoff divergence error $q_c$ consequently satisfies
  $ "div"_S X = a phi.alt_(upright("thin")) + q_c \, wide \| q_c \| lt.eq C sigma^(p + 1) phi.alt \, $
  and is supported where $sigma r lt.eq r - rho lt.eq 2 sigma r$.
    The same integration, also differentiated in angular directions, gives
  #[#set math.equation(numbering: n => "(8.10)")
   $ \| X \| \/ r + \| nabla_S X - a phi.alt_(upright("thin")) upright(bold(u)) ⊗ upright(bold(u)) \| lt.eq
     C sigma^2 phi.alt . $ <in:radialfield>]
  For example, at depth $d r lt.eq 2 sigma^2 r$ the primitive divided by $r$ is $O \( d^(p + 1) \)$,
    whereas $phi.alt asymp d^p$; beyond that depth its size is $O \( sigma^(2 p + 2) \)$.
    On the cutoff collar the derivative loss $sigma^(- 1)$ still leaves $sigma^(p + 1) phi.alt$.
    This proves (8.10); bounded derivatives of the polar volume factor only change its constants.
    A radial spatial derivative of the primitive uses the value of $a$ at its lower endpoint;
    an angular derivative uses only its first spatial derivative, bounded by $1 \/ r$.
    The scale parameter $r$ is held fixed in this calculation.
    Near $rho = r$, the preceding estimates give $\| F \| lt.eq
    C r d^(p + 1)$ and $\| nabla_S \( F upright(bold(u)) \) \| lt.eq C d^p$.
    Thus $X$ and its first derivative vanish at the boundary,
    so extending $X$ by zero gives a $C^1$ compactly supported base field using only values of $a$ in $B_r$.
    The inner cutoff removes the polar origin. When $m = 1$ the construction is made separately on the two radial
    intervals and has no angular term.
  Use the lifted field of 4. The $q_c M$ term is estimated by the already proved bulk total-variation bound:
    for small $sigma$, its support has depth between $sigma r$ and $2 sigma r$, where $chi =
    0$ and $phi.alt_(upright("bulk")) = phi.alt$. Its contribution is at most $C sigma^(p + 1) \( E + r^2 H \)$.
    Put $W = integral^(\( r \)) phi.alt \| z \|^2 thin #h(-0.16667em) d mu lt.eq C \( H + delta^2 E \)$.
    Equation (8.10) gives $\| X \| lt.eq C sigma^2 r phi.alt$ and $\| nabla_S X \| lt.eq C phi.alt$.
    After multiplication by $r^2$, the three error types in 4 are therefore bounded by
  $ C delta r E \, wide C sigma^2 r^3 W \, wide C sigma^2 r^2 sqrt(E W) \, $
  using the weighted curvature-square bound for the term containing $nabla^perp H_S$.
    Young’s inequality puts these terms into $C r^2 H + C \( delta r + sigma^2 \) E$.
    The stress left after its radial part costs $C sigma^2 E$.
    Since $p gt.eq 4$, $r lt.eq 1$, and $0 < alpha lt.eq 2 beta$,
    all these small coefficients of $E$ are at most $eta_1$ after fixing $C_1$. The main stress term gives
  #[#set math.equation(numbering: n => "(8.11)")
   $ r^2 lr(|integral^(\( r \)) a phi.alt_(upright("thin")) thin #h(-0.16667em) d M|) lt.eq
     C r^2 integral^(\( r \)) phi.alt_(upright("thin")) B \[ upright(bold(u)) \, upright(bold(u)) \] thin
     #h(-0.16667em) d mu + eta_1 E + C r^2 H . $ <in:thinmass>]
  Since $rho gt.eq r \/ 2$ on the thin part,
  $ phi.alt_(upright("thin")) lt.eq C sigma^2 \( rho \/ r \)^2 psi \, wide
    B \[ upright(bold(u)) \, upright(bold(u)) \] lt.eq 2 b + C \| z \|^2 e . $
  Thus the first term of (8.11) is at most $C sigma^2 R + C delta^2 r^2 E lt.eq eta_1 \( R + E \)$,
    after increasing $C_1$. Adding the unit bulk bound gives
  $ r^2 lr(|integral^(\( r \)) a phi.alt thin #h(-0.16667em) d M|) lt.eq C \( E + r^2 H \) +
    eta_1 R wide \( parallel a parallel_(1 \, r) lt.eq 1 \) . $
  Homogeneity now gives the first line of (8.5) on the same radius interval.
    For the signed estimate use $a = 1$, add twice its thin-part bound to the bulk signed estimate,
    and use $integral phi.alt_(upright("bulk")) thin #h(-0.16667em) d D lt.eq
    integral phi.alt thin #h(-0.16667em) d D$. Because $eta_1 = o \( g \)$ by (8.2),
    its $E$ term is absorbed into $C g E$ after reducing the fixed radius.
    Enlarge $C_1$ once to cover the fixed factors in both conclusions.
    The coefficient one has been preserved as claimed. ◻
]

#thm([Lemma 8.2.])[
  (Frequency inequalities).  #emph[With a dot denoting differentiation with respect to $log r$,
    the quantities in (8.1) satisfy
#[#set math.equation(numbering: n => "(8.12)")
 $ n_(*) & lt.eq sqrt(q_(*)) + C r^2 + eta n_(*) \,\
lr(|dot(A) / H - \( 2 P - n_(*) + q_(*) \)|) & lt.eq C { r sqrt(q_(*)) + r^2 \( 1 + n_(*) \) } +
  eta \( n_(*) + q_(*) \) \,\
- m lt.eq dot(H) / H & lt.eq 2 n_(*) + C r + eta \( n_(*) + q_(*) \) . $ <in:normalfrequency>]

]
] <in:frequency>

#proof[
  Test normal stationarity with $z phi.alt$. The exact normal-displacement trace formula (7.9) and (8.4) give
  #[#set math.equation(numbering: n => "(8.13)")
   $ lr(|E - integral^(\( r \)) rho psi z dot.op P_(v h) v thin #h(-0.16667em) d mu|) lt.eq C r^2 H +
     eta E . $ <in:normalflux>]
  In particular the $H_S dot.op z$ term is bounded using the weighted curvature-square estimate,
    rather than a height-independent error. For the tangent projection $P_T$, the algebra is exact:
    $P_T^2 = P_T$ and $\( P_T \)_(h h) = I - B$ imply
  $ \| P_(v h) v \|^2 = v dot.op \( B - B^2 \) v = b - \| B v \|^2 lt.eq b - frac(b^2, \| v \|^2) = b h_r . $
  Cauchy–Schwarz therefore bounds the absolute value of the flux in (8.13) by $sqrt(R H)$.
    Division by $H$ proves (8.12).
  For the horizontal identity put $Z_0 = rho upright(bold(u))$ on $S$ and let $overline(Z)_0 \( q \) =
    J_z Z_0 \( pi q \)$ be its unweighted lift. We first compute the full derivative of the kernel in the test
    $\( phi.alt compose pi \) overline(Z)_0$. Since $D pi = K_z P_h$ and $nabla_S phi.alt = - \( rho \/ r^2 \) psi
    upright(bold(u))$,
  $ nabla \( phi.alt compose pi \) = - rho / r^2 psi K_z upright(bold(u)) . $
  Both this vector and $overline(Z)_0 = rho J_z upright(bold(u))$ are horizontal.
    The product rule and $\( P_T \)_(h h) = I - B$ therefore give exactly
  $ P_T : D #scale(x: 120%, y: 120%)[\(] \( phi.alt compose pi \) overline(Z)_0 #scale(x: 120%, y: 120%)[\)] & =
    phi.alt P_T : D overline(Z)_0 - rho^2 / r^2 psi \( K_z upright(bold(u)) \)
    dot.op \( I - B \) \( J_z upright(bold(u)) \)\
 & = phi.alt P_T : D overline(Z)_0 - rho^2 / r^2 psi + rho^2 /
   r^2 psi B \[ K_z upright(bold(u)) \, J_z upright(bold(u)) \] . $
  The identity coefficient is one because $J_z \, K_z$ are self-adjoint inverses and $\( K_z upright(bold(u)) \)
    dot.op \( J_z upright(bold(u)) \) = \| upright(bold(u)) \|^2 = 1$.
    The radial terms are understood to be zero on the central fiber, as their factors of $rho^2$ require.
  For the remaining derivative, the pointwise block calculation in the proof of 4 gives
  $ P_T : D overline(Z)_0 & = "div"_S Z_0 - B : nabla_S Z_0 + epsilon_Z \,\
\| epsilon_Z \| & lt.eq C {\| z \| e \| nabla_S Z_0 \| +
  [\( \| nabla^perp H_S \| + \| z \| \) \| z \| + sqrt(e) thin \| z \|] \| Z_0 \|} . $
  This is the estimate for the unweighted lift, so the product formula multiplies its entire remainder by
    $phi.alt$. Subtract the reference identity $Q integral_S "div"_S \( phi.alt Z_0 \) thin #h(-0.16667em) d
    "vol"_S = 0$, in which $"div"_S \( phi.alt Z_0 \) = phi.alt "div"_S Z_0 - rho^2 psi \/ r^2$.
    Since $dot(A) = \( 2 - m \) A + integral^(\( r \)) rho^2 psi thin #h(-0.16667em) d M$, we obtain, with
  $ tilde(R) = integral^(\( r \)) rho^2 psi B \[ K_z upright(bold(u)) \, J_z upright(bold(u)) \] thin
    #h(-0.16667em) d mu \, $
  the exact identity
  #[#set math.equation(numbering: n => "(8.14)")
   $ dot(A) =  & 2 A - E + tilde(R) + r^2 integral^(\( r \)) phi.alt \( "div"_S Z_0 - m \) thin #h(-0.16667em) d M\
 & - r^2 integral^(\( r \)) phi.alt B : \( nabla_S Z_0 - I \) thin #h(-0.16667em) d mu +
   r^2 integral^(\( r \)) phi.alt epsilon_Z thin #h(-0.16667em) d mu . $ <in:horizontalidentity>]
  In geodesic normal coordinates $y$, Gauss’ lemma gives $Z_0 = y^i partial_i$.
    If $g_(i j)^S$ are the metric components, then
  $ f := "div"_S Z_0 - m = y dot.op D log sqrt(det \( g_(i j)^S \)) . $
  The logarithmic volume factor has vanishing first derivative at $0$ and bounded second derivative in the fixed
    chart. Consequently
  $ \| f \| lt.eq C rho^2 \, wide \| nabla_S f \| lt.eq C rho \, wide parallel a_r parallel_(1 \, r) lt.eq
    K_(upright("geo")) \, quad a_r = f \/ r^2 \, $
  for one fixed $K_(upright("geo"))$. Also $nabla_S Z_0 = I + O \( rho^2 \)$.
    The number $K_(upright("app")) = max { 1 \, K_(upright("geo")) }$ bounds both actual collar multipliers:
    $a_r$ here and $a = 1$ in the bootstrap. Choose $C_eta$ in the convention above to dominate
    $K_(upright("app")) C_1$ and the finitely many other error prefactors in the frequency estimates.
    Then $eta gt.eq K_(upright("app")) eta_1$ has a fixed prefactor, so (8.3) applies.
    The first line of (8.5) and positivity of $B$ now give
  $ r^2 lr(|integral^(\( r \)) phi.alt \( "div"_S Z_0 - m \) thin #h(-0.16667em) d M|) & lt.eq
    C r^2 \( E + r^2 H \) + r^2 eta R \,\
r^2 lr(|integral^(\( r \)) phi.alt B : \( nabla_S Z_0 - I \) thin #h(-0.16667em) d mu|) & lt.eq C r^2 E . $
  For the pointwise remainder use $\| Z_0 \| lt.eq r$, $\| nabla_S Z_0 \| lt.eq C$, and $sup \| z \| lt.eq
    delta r$. The first and last lines of (8.4), followed by Cauchy–Schwarz, bound its three terms respectively by
  $ r^2 integral^(\( r \)) phi.alt \| epsilon_Z \| thin #h(-0.16667em) d mu & lt.eq C delta r E +
    C r^3 \( H + delta^2 E \) + C r^2 sqrt(E \( H + delta^2 E \))\
 & lt.eq C r^2 \( E + H \) + eta E . $
  Here the term involving $nabla^perp H_S$ uses the weighted curvature-square bound inside $Lambda$;
    the last term comes from $sqrt(e) thin \| z \| thin \| Z_0 \|$.
  It remains to compare the radial stress $tilde(R)$ with $R$.
    Positivity of $B$, its trace $e$, and $\| J_z - K_z \| lt.eq
    C \| z \|$ imply $\| B \[ v \, \( J_z - K_z \) upright(bold(u)) \] \| lt.eq C \| z \| sqrt(b e)$.
    Thus $\| tilde(R) - R \|$ is at most
  #[#set math.equation(numbering: n => "(8.15)")
   $ C r sqrt(R) (integral^(\( r \)) psi \| z \|^2 e thin #h(-0.16667em) d mu)^(1 \/ 2) \, $ <in:radialreplacement>]
  by Cauchy–Schwarz. Since $e lt.eq m$, the second line of (8.4) gives
  $ \| tilde(R) - R \| lt.eq C r sqrt(R H) + C delta r sqrt(R \( E + R \)) lt.eq C r sqrt(R H) + eta \( E + R \) . $
  Combining these estimates in (8.14) and dividing by $H$ proves (8.12).
    The differentiated kernel has been exhausted by $tilde(R)$;
    every other remainder in that identity carries the weight $phi.alt$.
  Finally, set
  $ Y = frac(rho K_z upright(bold(u)), \| K_z upright(bold(u)) \|^2) . $
  This field is defined independently of the varifold tangent plane.
    Since $nabla rho = K_z upright(bold(u))$, it satisfies $Y dot.op nabla_T rho = rho h_r$.
    Testing stationarity with $psi \| z \|^2 Y$ consequently cancels the differentiated kernel exactly and gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ dot(H) = integral^(\( r \)) psi {\| z \|^2 \( "tr"_T D Y - m h_r \) +
     frac(2 rho z dot.op P_(v h) K_z upright(bold(u)), \| K_z upright(bold(u)) \|^2)} thin #h(-0.16667em) d mu .
     $ <in:heightidentity>]
  There is no derivative of the measurable tangent projection in this calculation.
    Also $nabla \| z \|^2 = 2 z$ in the ambient Euclidean space,
    so normal-frame connection terms do not arise from this factor.
  The center estimates give $t \( y \) = o \( rho \( y \) \)$ and hence $\| z \| lt.eq
    C rho^2$ on the support near the origin. Although derivatives of $upright(bold(u))$ have size
    $O \( rho^(- 1) \)$, differentiation of $Y$ thus gives, on the support,
  $ D Y = P_h + O \( rho + \| z \| \/ rho \) = P_h + O \( r \) . $
  It follows that $"tr"_T D Y - m h_r = m \( 1 - h_r \) - e + O \( r \)$.
    The positive $m \( 1 - h_r \)$ contribution is bounded by $C delta^2 \( E + R \)$, by the proof of (8.4).
    The $O \( r \)$ contribution is at most $C r H + eta \( E + R \)$, and the term $-
    e \| z \|^2$ can be discarded for an upper bound. Replacing the denominator in the second term of (8.16) by
    one costs at most $C delta r sqrt(R H) lt.eq C r H + eta R$. Equation (8.13) now proves the upper bound in (8.12).
  To justify the test at the central fiber, first remove $rho <
    epsilon.alt$ by a smooth radial cutoff $chi_epsilon.alt$, equal to zero for $rho lt.eq epsilon.alt$,
    equal to one for $rho gt.eq 2 epsilon.alt$, and satisfying $\| nabla chi_epsilon.alt \| lt.eq
    C \/ epsilon.alt$. Since $\| Y \| lt.eq C rho$, $\| Y \| \| nabla chi_epsilon.alt \| lt.eq
    C$ on the transition annulus. Its extra term is therefore bounded, at fixed $r$,
    by a constant times $r^(- m) integral_(rho < 2 epsilon.alt) \| z \|^2 thin #h(-0.16667em) d mu$,
    which tends to zero. The preceding support bound and local mass bounds also justify all other limiting terms.
    The lower bound in (8.12) follows directly from differentiating $r^(- m) psi_r$:
    its derivative in $log r$ is at least $- m r^(- m) psi_r$,
    and the remaining factor $\| z \|^2 h_r$ is nonnegative and independent of $r$. ◻
]

=== 8.2 Doubling and vanishing height <doubling-and-vanishing-height>

#thm([Proposition 8.3.])[
  (The inward bootstrap).  #emph[On all sufficiently small radii, $P$ is bounded above and below.
    For each fixed $lambda in \( 0 \, 1 \)$ there are constants $C_lambda \, c_lambda > 0$ such that
#[#set math.equation(numbering: n => "(8.17)")
 $ c_lambda H \( r \) lt.eq H \( lambda r \) lt.eq C_lambda H \( r \) \, wide
   integral_(lambda r)^r q_(*) \( v \) thin frac(#h(-0.16667em) d v, v) lt.eq C_lambda . $ <in:doubling>]

 There is a sequence $r_j arrow.b 0$ on which both $n_(*) \( r_j \)$ and $q_(*) \( r_j \)$ are bounded.]
] <in:bootstrap>

#proof[
  All quantities are locally absolutely continuous as functions of $log r$ where differentiated; $H > 0$,
    and inequalities for derivatives may be read almost everywhere.
    Put $v_0 = dot(A) \/ H$ and $h_0 = dot(H) \/ H$ temporarily.
    The first line of (8.5) with $a = 1$, followed by (8.12), gives
  $ \| P \| lt.eq C \( n_(*) + r^2 \) + eta q_(*) lt.eq C \( sqrt(q_(*)) + r^2 \) + C eta q_(*) . $
  It follows, for a sufficiently large fixed $K$ and $\| P \| gt.eq K$, that
  #[#set math.equation(numbering: n => "(8.18)")
   $ frac(q_(*), \| P \|) gt.eq c min { \| P \| \, eta^(- 1) } \, wide v_0 gt.eq c q_(*) . $ <in:largefrequency>]
  For the first assertion, either $C sqrt(q_(*))$ or $C eta q_(*)$ is at least a fixed fraction of $\| P \|$.
    The second follows from (8.12), increasing $K$ and then shrinking the radius so that $q_(*)$ absorbs $2 \|
    P \|$, $n_(*)$, and every error.
  If $P lt.eq - K$, the lower bound $h_0 gt.eq - m$ gives
  $ dot(P) = v_0 - P h_0 gt.eq c q_(*) + m P > 0 . $
  Such an excursion persists as the radius decreases: in inward time $s = - log r$,
    $P_s < 0$ throughout this region. There also $A < 0$ and $dot(A) > 0$,
    so $A$ decreases inward and stays below a fixed negative number.
    This contradicts $A arrow.r 0$, which follows from its factor $r^2$ and bounded normalized mass.
    We conclude that $P gt.eq - K$ on the small-radius interval.
  There are arbitrarily small radii at which $P lt.eq T^2$.
    Otherwise, eventually $P > T^2$, and (8.18) and (8.3) imply $v_0 \/ P gt.eq c T^2$. Define
  $ Z = log \( r^2 \/ A \) = T - log P . $
  Inward differentiation gives $Z_s = v_0 \/ P - 2 gt.eq c T^2 - 2$.
    Since $T gt.eq 2 s - C$, $Z$ becomes positive and unbounded.
    Also $Z lt.eq T$ in this regime, whence eventually $Z_s gt.eq c' Z^2$.
    Integrating $\( 1 \/ Z \)_s lt.eq - c'$ forces a blow-up at finite inward time, although $A \,
    H$ are defined and positive throughout every finite subinterval of this regime. This is impossible.
  We next prove the differential estimate
  #[#set math.equation(numbering: n => "(8.19)")
   $ dot(P) gt.eq - C \( r P + g P^2 \) wide upright("when ") K lt.eq P lt.eq T^4 . $ <in:moderatefrequency>]
  Combining (8.12) and (8.12) gives
  $ dot(P) gt.eq 2 P - n_(*) + q_(*) - 2 P n_(*) - C { r sqrt(q_(*)) + r^2 \( 1 + n_(*) \) + r P } -
    C eta \( 1 + P \) \( n_(*) + q_(*) \) . $
  If $q_(*) gt.eq L P^2$ for a sufficiently large fixed $L$, then $n_(*) lt.eq C sqrt(q_(*)) +
    C r^2$ and $eta T^4 = o \( 1 \)$ show that the right-hand side is positive.
    Otherwise $n_(*) lt.eq C P$, and squaring (8.12) gives
  $ q_(*) gt.eq n_(*)^2 - C r^2 P - C eta P^2 . $
  The independent signed second line of (8.5), with $eta_1 lt.eq eta$, gives
  $ n_(*) gt.eq 2 P - d_0 \, wide d_0 = C \( g P + r^2 + eta P^2 \) . $
  For large $K$ and small $r$, this also gives $n_(*) > 1$. The principal terms factor as
  $ 2 P - n_(*) + n_(*)^2 - 2 P n_(*) = \( n_(*) - 1 \) \( n_(*) - 2 P \) gt.eq - C P d_0 . $
  Thus $dot(P) gt.eq - C \( r P + g P^2 + eta P^3 \)$. The last term is absorbed by $g P^2$, since $P lt.eq
    T^4$ and $eta T^4 lt.eq g$ after shrinking the radius. This proves (8.19).
  It remains to justify that this restricted estimate gives a bound on every smaller radius.
    Choose an arbitrarily small moderate radius $r_0 = e^(- s_0)$, so $P_0 lt.eq T_0^2$. Take $s_0$ so large that
  $ integral_(s_0)^oo C { e^(- s) + T \( s \)^(- 16) } thin #h(-0.16667em) d s lt.eq epsilon_0 < 1 . $
  This is possible by (8.3). On each component where $P gt.eq K$, before a possible exit through $P = T^4$,
    (8.19) yields
  $ \( log P \)_s lt.eq C \( r + g P \) lt.eq C \( r + T^(- 16) \) . $
  Moreover $Z_s > 0$ there by (8.18), increasing $K$ if necessary.
    If the first component starts at $s_0$, these inequalities give
  $ P lt.eq e^(epsilon_0) P_0 lt.eq e^(epsilon_0) T_0^2 \, wide T = Z + log P gt.eq T_0 - log P_0 + log K gt.eq
    T_0 \/ 2 . $
  For large $T_0$ these bounds exclude $P = T^4$. If a component starts later, at $s_i$, then $P \( s_i \) = K$,
    and the same argument gives $P lt.eq e^(epsilon_0) K$ and $T gt.eq T \( s_i \)$ there,
    again excluding the upper exit. This proves the finite uniform bound
  $ - K lt.eq P \( r \) lt.eq e^(epsilon_0) max { K \, P_0 } wide \( 0 < r lt.eq r_0 \) . $
  Write this bound as $\| P \| lt.eq B_0$. After $B_0$ is fixed, choose $0 < macron(r)_0 lt.eq
    r_0$ so that $C eta \( 1 + B_0 \) lt.eq 1 \/ 4$ for the constants in 32 whenever $0 < r lt.eq macron(r)_0$;
    this absorbs its $eta q_(*)$ terms after quotient differentiation.
    For $P gt.eq 0$ use the upper height derivative bound in $dot(P) = v_0 - P h_0$;
    for $P < 0$ use its lower bound. In both cases 32 and $n_(*) lt.eq C sqrt(q_(*)) + C r^2$ imply
  #[#set math.equation(numbering: n => "(8.20)")
   $ dot(P) gt.eq c q_(*) - C_(B_0) . $ <in:integralenergy>]
  Integrating over a logarithmic interval of fixed length bounds $integral q_(*) thin #h(-0.16667em) d log r$.
    Cauchy–Schwarz then bounds $integral n_(*) thin #h(-0.16667em) d log r$,
    and integration of (8.12) proves both sides of the height comparison in (8.17).
    In each interval $\[ 2^(- j - 1) macron(r)_0 \, 2^(- j) macron(r)_0 \]$ choose a radius where $q_(*)$ is
    bounded by its logarithmic average. Equation (8.12) bounds $n_(*)$ at those radii, proving the last assertion. ◻
]

#thm([Proposition 8.4.])[
  (Vanishing height at a typical point).  #emph[The positive-height alternative at the origin is impossible.
    Consequently every point satisfying the typical-point hypotheses (7.1) is regular.]
] <in:finish>

#proof[
  Take the radii $r_j$ from 33, and write $r = r_j$. On $rho < 3 r \/ 4$ the weights $phi.alt \,
    psi$ have positive lower bounds depending only on $p$. Equations (8.4), (8.12),
    and the boundedness of $n_(*) \, q_(*)$ give
  #[#set math.equation(numbering: n => "(8.21)")
   $ r^(- m) integral_(rho < 3 r \/ 4) \| z \|^2 thin #h(-0.16667em) d mu +
     r^(2 - m) \( D + Lambda \) \( B_(3 r \/ 4) \) lt.eq C H \( r \) . $ <in:selectedenergy>]
  Here a height integral is over the part of the separated tube above the indicated base ball, whereas $D \,
    Lambda$ are projected measures. On the other hand, applying (8.17) with $lambda = 1 \/ 4$ and using $psi lt.eq
    2 p$, $h_r lt.eq 1$ at radius $r \/ 4$ gives
  #[#set math.equation(numbering: n => "(8.22)")
   $ r^(- m) integral_(rho < r \/ 4) \| z \|^2 thin #h(-0.16667em) d mu gt.eq c H \( r \) > 0 . $ <in:heightlower>]
  Fix an exceptional fraction $delta_(upright("cfg")) = 1 \/ 4$ and a finite exponent $p_(*) >
    2$ satisfying $m \( 1 \/ 2 - 1 \/ p_(*) \) < 1$. Use the enlargement $c$ fixed from the local data in 9,
    with the required scalar-selection room, and then fix $d_(upright("cfg") \, 0) =
    d_0 \( delta_(upright("cfg")) \) > 0$. Then choose $epsilon.alt >
    0$ so small that $B_(r \/ 4)$ has a finite cover by balls of radius $epsilon.alt
    r$ whose required enlargements lie in $B_(r \/ 2)$. The number of balls and $epsilon.alt$ are fixed
    independently of $r$.
  Apply 7 with room between $3 r \/ 4$ and $r \/ 2$; its integer is again $Q$.
    Its variation estimate and (8.21) give, for every enlarged ball $B_(c epsilon.alt r) \( x \)$ of this cover,
  $ \( epsilon.alt r \)^(- m) tau \( B_(c epsilon.alt r) \( x \) \) lt.eq C_epsilon.alt H \( r \) \/ r^2 arrow.r 0 \, $
  uniformly across the cover. The normalized smooth mass averages used in the local scalar selections differ from
    $Q$ by at most the same bound. Thus, after discarding finitely many selected radii,
    the scalar smallness and smooth-average conditions select $Q$ on every required local ball,
    and its displayed budget is below $d_(upright("cfg") \, 0)$.
    Applying 9 with the fixed choices above now supplies on each covering ball a configuration with the prescribed
    majority guarantee and a configuration-distance moment whose normalized $L^(p_(*))$ norm is at most
    $C_epsilon.alt sqrt(H \( r \))$.
  Every entry of each such configuration has size at most $C_epsilon.alt sqrt(H \( r \))$.
    Indeed, on a fixed majority of its base ball the entries match the actual heights within this error.
    The area formula, the bounded projection Jacobian, and (8.21) show that a subset of this majority has sum of
    squared actual heights at most $C_epsilon.alt H \( r \)$.
    Every configuration entry has positive integer weight, proving the claim.
    Adding these configuration heights to the distance moment and summing the fixed finite cover yields
  #[#set math.equation(numbering: n => "(8.23)")
   $ r^(- m) integral_(rho < r \/ 4) \| z \|^(p_(*)) thin #h(-0.16667em) d mu lt.eq
     C H \( r \)^(p_(*) \/ 2) . $ <in:highermoment>]
  Let $cal(I) = { t > 0 }$ on the center. By 28, its relative base volume tends to zero and the height vanishes
    above $S \\ cal(I)$. The same is true for normalized projected mass, since 7 gives
  #[#set math.equation(numbering: n => "(8.24)")
   $ r^(- m) pi_(\#) mu \( cal(I) ∩ B_(r \/ 4) \) & lt.eq Q r^(- m) "vol"_S \( cal(I) ∩ B_(r \/ 4) \) +
     r^(- m) \| M \| \( B_(r \/ 4) \)\
 & lt.eq o \( 1 \) + C H \( r \) \/ r^2 = o \( 1 \) . $ <in:influencemass>]
  Hölder’s inequality with (8.23) and (8.24) now gives
  $ r^(- m) integral_(rho < r \/ 4) \| z \|^2 thin #h(-0.16667em) d mu lt.eq
    C H \( r \) [r^(- m) pi_(\#) mu \( cal(I) ∩ B_(r \/ 4) \)]^(1 - 2 \/ p_(*)) = o \( H \( r \) \) \, $
  contradicting (8.22). Thus the varifold lies on the center near the origin, and 30 gives regularity. ◻
]

#proof[
  #emph[Completion of the proof of 1.] The weighted rectifiable tangent and density theorem
    #cite(label("Simon2018")) Chapter 3, Definition 1.7, Remark 1.8, and Theorem 1.9,
    together with differentiation of the integer multiplicity sets,
    imply that at $mu$-almost every point $x$ there is a positive integer $Q$ and an approximate tangent plane
    such that the dilated varifolds tend to the multiplicity-$Q$ plane and
  $ frac(mu \( { y : theta \( y \) eq.not Q } ∩ upright(bold(B))_r \( x \) \), r^m) arrow.r 0 . $
  The tangent statement includes convergence of the tangent projections;
    it follows by differentiating the measurable tangent-plane map on a countable rectifiable covering.
    These are precisely the typical-point hypotheses used in the center construction.
    No regularity conclusion is used in choosing the point. 34 therefore shows that $mu \( "Sing" \( V \) \) = 0$.
  For completeness, this implies the requested Hausdorff-measure conclusion even for support points outside the
    chosen representative of the rectifiable set. Let $N subset "spt"
    mu$ be a $mu$-null set in a compact subset of $U$, and let $O$ be an open neighborhood of $N$ with arbitrarily
    small $mu \( O \)$. For each $x in N$ take arbitrarily small balls $upright(bold(B))_r \( x \) subset O ∩ U$.
    The support-point monotonicity bound in 3 gives $mu \( upright(bold(B))_r \( x \) \) gt.eq omega_m r^m$.
    The disjoint-ball covering lemma selects pairwise disjoint such balls whose fivefold enlargements cover $N$.
    Their radii can all be taken below any prescribed bound, and therefore
  $ cal(H)_epsilon.alt^m \( N \) lt.eq C_m sum_i r_i^m lt.eq
    C_m sum_i mu \( upright(bold(B))_(r_i) \( x_i \) \) lt.eq C_m mu \( O \) . $
  Let $mu \( O \) arrow.b 0$ and then $epsilon.alt arrow.b 0$.
    An exhaustion of $U$ proves $cal(H)^m lt.double mu$ on $"spt" mu$.
    Applying this to the singular set proves $cal(H)^m \( "Sing" \( V \) \) = 0$. ◻
]

== 9 The round-sphere consequence <sec:spheres>

#proof[
  For $\( x \, P \) in G_m \( S^(m + n) \)$, define the cone by
  $ integral phi thin #h(-0.16667em) d cal(C) \( V \) = integral_(G_m \( S^(m + n) \)) integral_0^oo
    phi \( r x \, bb(R) x xor P \) r^m thin #h(-0.16667em) d r thin #h(-0.16667em) d V \( x \, P \) . $
  The polar area formula #cite(label("Simon2018")) Chapter 3, §2,
    (2.4)–(2.6) gives an integral $\( m + 1 \)$-varifold in $bb(R)^(m + n + 1)$ with the same integer
    multiplicities away from the vertex. The vertex has zero mass, and
  $ parallel cal(C) \( V \) parallel \( B_R \( 0 \) \) = frac(R^(m + 1), m + 1) parallel V parallel \( S^(m + n) \) . $
  The radial and angular first-variation calculation below adapts the hypersurface calculation in
    #cite(label("OpenAISolomonYau2026")) Lemma 6.1; we include its derivation in the present dimensions.
    For a compactly supported $C^1$ ambient field $X$ vanishing near the vertex, write $X \( r x \) =
    f \( r \, x \) x + Y_r \( x \)$ with $Y_r \( x \) perp x$. Then
  $ "div"_(bb(R) x xor P) X \( r x \) = partial_r f + m / r f + 1 / r "div"_P^S Y_r . $
  After multiplication by $r^m$, the radial terms integrate to the endpoint values of $r^m f$,
    and the angular term vanishes by spherical stationarity for every $r$.
    Thus the cone is stationary off the vertex. For a general compactly supported field,
    a radial cutoff between radii $epsilon$ and $2 epsilon$ has first-variation error
    $O_(X \, V) \( epsilon^(m + 1) + epsilon^m \)$ by the mass formula.
    This tends to zero because $m gt.eq 1$, so the cone is stationary everywhere.
  The polar map identifies the punctured support of the cone with $\( 0 \, oo \) times "spt" parallel V parallel$.
    A regular link patch gives a smooth embedded local cone with the same constant multiplicity,
    and cone stationarity makes it minimal. Conversely, suppose the cone is locally $q \| M \|$ near $r x$,
    with $M$ smooth embedded and minimal. Its tangent planes contain the radial line almost everywhere,
    hence everywhere by continuity. The radial vector field is therefore tangent to $M$,
    and the radius function is a submersion on $M$. The dilation flow identifies a smaller patch of $M$ with a
    radius interval times a smooth embedded spherical section.
    Comparing the polar varifold formulas on this product neighborhood identifies $V$ there with $q$ times that
    section, including its tangent planes; spherical stationarity makes the section minimal. Consequently
  $ "Sing" cal(C) \( V \) \\ { 0 } = { r x : r > 0 \, med x in "Sing"_S V } . $
  Apply 1 with dimensions $\( m + 1 \, n \)$ to obtain $cal(H)^(m + 1) \( "Sing" cal(C) \( V \) \) = 0$.
    Let $A = "Sing" cal(C) \( V \) ∩ { 1 < \| z \| < 2 }$ and $rho \( z \) = \| z \|$.
    Regularity is local, so $A$ is Borel. The general Hausdorff slicing inequality #cite(label("Simon2018"))
    Chapter 2, §1, Theorem 1.10 applied to $rho$ gives
  $ integral_1^2 cal(H)^m \( A ∩ rho^(- 1) \( r \) \) thin #h(-0.16667em) d r = 0 . $
  For $1 < r < 2$, the slice is $r "Sing"_S V$. Choosing a radius with zero slice measure and using homogeneity
    gives $cal(H)^m \( "Sing"_S V \) = 0$ in the chordal metric.
    The round and chordal metrics are locally bi-Lipschitz equivalent, so they have the same Hausdorff null sets.
    Homotheties give the assertion for every positive radius. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
