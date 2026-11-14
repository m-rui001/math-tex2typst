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

#align(center)[#text(size: 16pt, weight: "bold")[Triangular minimality for planar Coulomb renormalized energy]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The Coulomb interaction in two dimensions is logarithmic.
  An infinite configuration of equal point charges against a uniform neutralizing background has an infinite
  electrostatic energy, even in a bounded region containing a charge.
  Subtracting the logarithmic self-energy at each charge and then taking energy per unit area gives the
  renormalized energy studied here. Its proposed minimizer is the triangular lattice.

=== 1.1 The energy and the main results <the-energy-and-the-main-results>

For $R > 1$, let $K_R = \[ - R \, R \]^2$. Fix smooth cutoffs $chi_R in C_c^oo \( bb(R)^2 \)$ satisfying

#[#set math.equation(numbering: n => "(1.1)")
 $ 0 lt.eq chi_R lt.eq 1 \, wide "supp" chi_R subset K_R \, wide chi_R = 1 upright(" on ") K_(R - 1) \, wide
   sup_(R > 1) parallel nabla chi_R parallel_oo < oo . $ <eq:cutoffs>]

Let $Lambda subset bb(R)^2$ be locally finite and simple, so every point has multiplicity one,
  and put $nu_Lambda = sum_(p in Lambda) delta_p$. The admissible class $cal(A)_1$ consists of locally integrable
  vector fields $E$ such that

#[#set math.equation(numbering: n => "(1.2)")
 $ "div" E = 2 pi \( nu_Lambda - 1 \) \, wide "curl" E = 0 \, wide
   sup_(R > 1) frac(nu_Lambda \( B_R \), \| B_R \|) < oo \, $ <eq:admissible>]

where the equations hold in distributions and $B_R$ is the disk of radius $R$ centered at the origin.
  These conditions imply $E in L_(upright("loc"))^q \( bb(R)^2 \; bb(R)^2 \)$ for every $1 lt.eq q < 2$:
  locally subtract the finitely many Coulomb singularities and a smooth field with the prescribed constant
  divergence; the remaining field has harmonic components. Section 2 supplies the details.
  Consequently the same class results if local $L^q$ integrability is required for any one, or for all,
  of these exponents.

For $E in cal(A)_1$ define

#[#set math.equation(numbering: n => "(1.3)")
 $ W \( E \, chi_R \) & =
   lim_(eta arrow.b 0)
   [1 / 2 integral_(bb(R)^2 \\ union.big_(p in Lambda) B \( p \, eta \)) chi_R \| E \|^2 thin upright(d) x + pi
   log eta sum_(p in Lambda) chi_R \( p \)] \,\
W \( E \) & = limsup_(R arrow.r oo) frac(W \( E \, chi_R \), \| K_R \|) . $ <eq:local-energy>]

The local puncture limit exists and is finite. The outer limsup is initially allowed to take either infinite
  value. The puncture limit is taken first, and the cutoff layer has the fixed width in (1.1) throughout.

Identify $bb(R)^2$ with $bb(C)$ when convenient. The triangular lattice of covolume one is

#[#set math.equation(numbering: n => "(1.4)")
 $ Lambda_triangle.stroked.t = sqrt(2 / sqrt(3)) (bb(Z) \( 1 \, 0 \) + bb(Z) (1 / 2 \, sqrt(3) / 2)) .
   $ <eq:triangular-lattice>]

Let $h_triangle.stroked.t$ be the mean-zero periodic distributional solution of $- Delta h_triangle.stroked.t =
  2 pi \( delta_0 - 1 \)$ on $bb(R)^2 \/ Lambda_triangle.stroked.t$, and set $E_triangle.stroked.t = -
  nabla h_triangle.stroked.t$.

#thm([Theorem 1.1.])[
  #emph[For every cutoff family satisfying (1.1) and every field $E in cal(A)_1$,
$ W \( E \) gt.eq W \( E_triangle.stroked.t \) . $

 The triangular value is finite, and $inf_(E in cal(A)_1) W \( E \) = W \( E_triangle.stroked.t \)$.]
] <thm:main>

In particular $W \( E \) = - oo$ is impossible in this class. The inequality includes fields of energy $+ oo$.
  No separation, periodicity, or Voronoi-cell bound is imposed on an arbitrary competitor.

The finite-volume statement used to prove Theorem 1 has its own exact normalization.
  For an integer $n gt.eq 2$, write $T_n = bb(R)^2 \/ \( sqrt(n) thin bb(Z)^2 \)$.
  Given distinct points $a_1 \, dots.h \, a_n in T_n$, let $h$ have mean zero and satisfy $- Delta h =
  2 pi \( sum_(i = 1)^n delta_(a_i) - 1 \)$ on $T_n$. Define

#[#set math.equation(numbering: n => "(1.5)")
 $ cal(W)_n \( h \) =
   lim_(eta arrow.b 0)
   [1 / 2 integral_(T_n \\ union.big_(i = 1)^n B \( a_i \, eta \)) \| nabla h \|^2 thin upright(d) x + pi n log
   eta] . $ <eq:torus-energy>]

#thm([Theorem 1.2.])[
  #emph[For every integer $n gt.eq 2$ and every configuration of $n$ distinct points on $T_n$,
    the potential in (1.5) satisfies
$ cal(W)_n \( h \) gt.eq n W \( E_triangle.stroked.t \) . $

]
] <thm:torus>

This is a lower bound on square tori. It does not assert equality on any particular square torus.
  Constant harmonic fields increase the energy by $n \| c \|^2 \/ 2$;
  the required orthogonality follows by integrating the periodic gradient, as proved in (2.11).

The planar minimum also determines the linear term in optimal logarithmic energy for finitely many points on the sphere.

#thm([Corollary 1.3.])[
  (Spherical logarithmic energy).  #emph[Let $S^2 = { y in bb(R)^3 : parallel y parallel =
    1 }$ be the unit sphere. For each integer $n gt.eq 2$, define
$ E_log \( n \) = min_(\( y_1 \, dots.h \, y_n \) in \( S^2 \)^n) (- sum_(1 lt.eq i \, j lt.eq n\
i eq.not j) log parallel y_i - y_j parallel) \, $

 where the sum is over ordered pairs, $parallel dot.op parallel$ is the Euclidean norm in $bb(R)^3$,
   $log$ is the natural logarithm, and a collision has energy $+ oo$. Then, as $n arrow.r oo$ through the integers,
#[#set math.equation(numbering: n => "(1.6)")
 $ E_log \( n \) = (1 / 2 - log 2) n^2 - n / 2 log n + C_(upright("BHS")) n + o \( n \) \, $ <eq:bhs-asymptotic>]

 where
#[#set math.equation(numbering: n => "(1.7)")
 $ C_(upright("BHS")) = 2 log 2 + 1 / 2 log #h(-0.16667em) (2 / 3) +
   3 log #h(-0.16667em) (frac(sqrt(pi), Gamma \( 1 \/ 3 \))) \, $ <eq:bhs-constant>]

 and $Gamma$ is Euler’s gamma function.]
] <cor:bhs>

This proves the $d = 2$ case of the logarithmic-energy conjecture of Brauchart, Hardin,
  and Saff #cite(label("BrauchartHardinSaff2012")) Conjecture 4.
  Bétermin and Sandier had already proved the existence of the linear coefficient and shown that it equals (1.7)
  precisely when the density-one triangular lattice minimizes their planar renormalized
  energy #cite(label("BeterminSandier2018")) Theorem 1.5. Section 8 checks the normalization and applies that
  equivalence to Theorem 1. The conclusion is an asymptotic value,
  not a construction of near-optimal point sets or an algorithm for Smale’s seventh problem.

=== 1.2 Context and prior work <context-and-prior-work>

The finite-vortex renormalized energy of Bethuel, Brezis,
  and Hélein #cite(label("BethuelBrezisHelein1994")) is an antecedent of the infinite-system energy considered
  here. Sandier and Serfaty introduced the planar functional in their analysis of microscopic vortex patterns in
  the Ginzburg–Landau model. They proved existence of a minimum,
  approximation of its value by square-periodic fields, and triangular optimality among Bravais
  lattices #cite(label("SandierSerfaty2012")) Theorems 1 and 2.
  Their Conjecture 1 asks whether the triangular value is also the minimum over the full admissible class.
  Theorem 1 resolves this conjecture positively. The current normalization in that paper has one point per area $2
  pi \/ m$; our density-one convention corresponds to its background $m = 2 pi$.

The lattice comparison belongs to a longer history. The minimization of convergent Epstein zeta sums at fixed
  covolume was developed by Rankin #cite(label("Rankin1953")) and Cassels #cite(label("Cassels1959")),
  with an error noted in #cite(label("Cassels1963Corrigendum")) and a repair supplied by
  Ennola #cite(label("Ennola1964Lemma")) and simplified by Diananda #cite(label("Diananda1964")).
  Montgomery proved triangular minimality of the lattice theta function for every positive Gaussian
  parameter #cite(label("Montgomery1988")) Theorem 1. These are comparisons within the lattice class;
  the issue here is the lower bound for arbitrary admissible configurations.

For the confining-potential class in their Theorem 2, Sandier and Serfaty show that microscopic limits of finite
  Coulomb minimizers concentrate on minimizers of the planar renormalized
  energy #cite(label("SandierSerfaty2015")) Theorem 2. Its minimum also determines a next-order coefficient for
  optimal logarithmic energy on the sphere #cite(label("BeterminSandier2018")) Theorem 1.5.
  Petrache and Serfaty prove a conditional implication from universal optimality to minimality for Coulomb and
  Riesz renormalized energies in their configuration-energy normalization #cite(label("PetracheSerfaty2020"))
  Theorem 2 and Corollary 4. Their periodic comparison uses tori compatible with the reference lattice,
  not arbitrary square tori, and their planar conclusion is conditional on the Cohn–Kumar conjecture.
  The companion universal-optimality theorem supplies the Gaussian comparison used in that
  implication #cite(label("UniversalOptimality2026")) Theorem 1.1 and Corollary 1.3.
  The present proof treats the logarithmic functional directly and uses no universal-optimality result as an input.

Two geometric precedents help explain the finite-torus argument.
  Screening a point charge by a uniform disk yields a separation argument for planar confined logarithmic
  minimizers; see Lieb, Rougerie, and Yngvason #cite(label("LiebRougerieYngvason2018")) Lemma 3 and Appendix A.
  Voronoi moment inequalities combine sharp cell comparisons with Euler’s bound on the average number of sides,
  as in Gruber’s proof of a theorem of Fejes Tóth #cite(label("Gruber1999")).
  Affine bounds on cell energies, sharp at the regular hexagon, also appear in the Wasserstein model of Bourne,
  Peletier, and Theil for cells with at least three sides and mass $v gt.eq
  1.5 dot.op 10^(- 4)$ #cite(label("BournePeletierTheil2014")) Lemma 12.
  Here the cell comparison must arise from a trial potential that is continuous off the sites and has the
  prescribed logarithmic singularities. Its nonradial correction and the two scalar estimates of Section 5 address
  that requirement, including sectors whose perpendicular foot lies outside the corresponding edge.

The whole-plane reduction below uses Sandier and Serfaty’s local energy estimates and periodic approximation.
  The finite-torus argument provides the comparison with the triangular value.
  Throughout, the conclusion concerns energy per unit area:
  compact changes to a configuration can preserve this value,
  so the minimum statement alone does not classify all minimizing configurations.

=== 1.3 How the comparison works <how-the-comparison-works>

The proof separates a finite-torus comparison from the passage to arbitrary fields.
  The finite comparison identifies the triangular value. Sandier and Serfaty’s approximation theorem supplies
  periodic fields approaching the unknown full-plane minimum; it does not identify that minimum.

Section 2 checks the conversion from that approximation theorem to our normalization and fixed-width square
  cutoffs. The main point is to control the boundary error for an arbitrary field whose energy limsup is bounded
  above, without assuming separation or density one in advance.
  Local energy estimates give the needed charge density and boundary-strip bound.
  Proposition 7 then transfers any common lower bound on square tori to every field in $cal(A)_1$,
  including the possible infinite-energy cases.

We next prove the finite comparison. On each square torus the point energy attains a minimum.
  A screened logarithmic potential and the minimum principle separate the minimizing points,
  as shown in Section 3. Separation is used only for that minimum; once it is bounded below,
  every other configuration is bounded below by minimality.
  This is why the main theorems impose no separation condition on their competitors.

The lifted minimizer has convex Voronoi cells, the regions closer to one site than to any other.
  Each edge and its incident cell determine a sector joining that edge to the site.
  Counting incidences on the torus gives at most six sectors per point on average.
  The comparison is not an estimate of the electrostatic energy of an isolated cell.
  Instead, we construct a single trial potential $H$ on the torus.
  Its sector formulas have matching traces and satisfy $H = - log r + O \( r^2 \)$ near each site.
  Thus $H$ and the Green potential $h$ have matching logarithmic singularities,
  while the constant term is normalized to zero in $H$. Proposition 12 gives the exact identity

$ cal(W)_n \( h \) = sum_S J \( S \) + 1 / 2 integral_(T_n) \| nabla \( h - H \) \|^2 . $

Here $J \( S \)$ is the trial potential’s sector contribution:
  its linear background-interaction term minus one half of its renormalized Dirichlet integral,
  as defined in (4.10). The identity cancels the matching logarithmic singularities and retains the nonnegative
  square exactly.

The construction of $H$ uses radial functions common to every sector.
  At a shared Voronoi edge its trace depends only on the equal distances to the two neighboring sites;
  along a ray to a vertex it depends only on the vertex radius.
  These observations glue the local formulas continuously off the sites and give an $H^1$ function on every
  punctured torus. The identity is proved for any compatible flat torus whose area equals its number of sites,
  not just for square tori. A separate one-site triangular torus supplies six regular sectors;
  there the chosen potential has exactly the triangular Green gradient, so the square term vanishes.

Section 5 constructs the radial functions from the triangular Green expansion and subtracts fixed multiples of
  sector area and angle. The desired bound has the form

$ J \( S \) gt.eq K + lambda A \( S \) + mu theta \( S \) \, wide K < 0 . $

Areas and angles sum exactly to $n$ and $2 pi n$ on a square torus.
  The incidence count then gives $n \( 6 K + lambda + 2 pi mu \)$,
  and exact calibration on the triangular torus identifies this with $n W \( E_triangle.stroked.t \)$.

The perpendicular from a site to a Voronoi edge need not lie on the edge,
  so one endpoint angle of a sector can be negative. A lower bound for a scalar primitive alone does not control
  the resulting difference of two primitive values. A second estimate bounds the total negative part of its
  derivative. Together these estimates handle both ordinary and signed sectors without imposing a regular-polygon
  hypothesis.

Section 6 proves summable analytic bounds for all omitted lattice modes.
  Section 7 first verifies the retained finite core and then uses the analytic error bounds to enclose the full
  functions and their derivatives. Midpoint and interpolation errors cover a compact rectangle between mesh
  points. At the exact triangular point, analytic stationarity and a positive Hessian bound establish the
  non-strict minimum; an exact formula handles the unbounded exterior.
  Section 8 combines these results with the geometry and the whole-plane reduction, then derives Corollary 3.
  Appendix 9 records two complementary methods: an independent coefficient recurrence and sharper exact tail
  bounds. They preserve additional quantitative information without adding premises to the main comparison.

== 2 From square tori to the full plane <red:section>

This section proves the reduction needed for the full admissible class.
  A uniform lower bound on finite square tori gives the same lower bound for every field in $cal(A)_1$.
  The argument uses the periodic approximation theorem of Sandier and Serfaty,
  after checking the normalization and the fixed-width cutoffs in the definition of $W$.

=== 2.1 Local regularity and the puncture limit <local-regularity-and-the-puncture-limit>

The local integrability convention causes no restriction on the competitors:
  under the distributional equations, membership in $L_(upright("loc"))^1$ already implies membership in every
  $L_(upright("loc"))^q$, $1 lt.eq q < 2$.

#thm([Lemma 2.1.])[
  #emph[Let $Lambda subset bb(R)^2$ be simple and locally finite,
    and let $E in cal(D)' \( bb(R)^2 \; bb(R)^2 \)$ be a distributional vector field satisfying
$ "div" E = 2 pi #scale(x: 180%, y: 180%)[\(] sum_(p in Lambda) delta_p - 1 #scale(x: 180%, y: 180%)[\)] \, wide
  "curl" E = 0 . $

 The field is smooth off $Lambda$. Near each $p in Lambda$ it has the form
#[#set math.equation(numbering: n => "(2.1)")
 $ E \( x \) = frac(x - p, \| x - p \|^2) + F_p \( x \) \, wide F_p upright(" smooth") . $ <red:local-expansion>]

 Consequently $E$ has a representative in $L_(upright("loc"))^q$ for every $1 lt.eq q < 2$,
   and $W \( E \, xi \)$ exists as a finite real number for every smooth compactly supported $xi$.]
] <red:local>

#proof[
  Choose a disk about $p$ containing no other charge and subtract
  $ E_p^0 \( x \) = nabla log \| x - p \| - pi \( x - p \) . $
  Since $Delta log \| x - p \| = 2 pi delta_p$, the difference $E -
    E_p^0$ has zero divergence and curl as a distribution on the disk. The identities
  $ Delta V_1 = partial_1 "div" V - partial_2 "curl" V \, wide Delta V_2 = partial_2 "div" V + partial_1 "curl" V $
  and Weyl’s lemma make both components of this difference smooth.
    On a disk without charges, use $E^0 \( x \) = - pi x$ instead.
    This proves (2.1) and smoothness off the charges. The singular function $\| x -
    p \|^(- 1)$ is locally in $L^q$ exactly when $q < 2$.
  Only finitely many charges meet a fixed compact neighborhood of $"supp" xi$.
    Choose disjoint small disks about them. In each disk,
  $ 1 / 2 \| E \( x \) \|^2 - frac(1, 2 \| x - p \|^2) in L^1 . $
  Moreover $xi \( x \) - xi \( p \) = O \( \| x - p \| \)$, so $\( xi \( x \) - xi \( p \) \) \/ \| x -
    p \|^2$ is integrable. The remaining singular integral is $pi xi \( p \) log \( rho \/ eta \)$,
    whose divergence cancels the prescribed $pi xi \( p \) log eta$. The integral outside these disks is finite.
    Thus the puncture limit exists and is finite. ◻
]

In particular the only possible infinite values of $W \( E \)$ arise in the large-square limsup.
  No puncture limit is interchanged with that limsup below.

=== 2.2 Approximation and local energy estimates <approximation-and-local-energy-estimates>

We distinguish the current normalization from the electric-field normalization of $cal(A)_1$.
  For $b > 0$, write $cal(C)_b$ for currents $j in L_(upright("loc"))^1 \( bb(R)^2 \; bb(R)^2 \)$ with

$ "div" j = 0 \, wide "curl" j = rho - b \, wide rho = 2 pi sum_(v in Lambda) delta_v \, wide rho \( B_s \) =
  O \( s^2 \) \, $

where $Lambda$ is simple and locally finite. Denote their local puncture functional by $sans(W) \( j \, xi \)$;
  its formula is the same as that of $W \( E \, xi \)$. Put $Q_s = \( - s \, s \)^2$.

For such a current, the inverse component rotation $F = \( j_2 \, - j_1 \)$ satisfies $"div" F = rho -
  b$ and $"curl" F = 0$. In the proof of Lemma 4, use the local model $nabla log \| x -
  p \| - \( b \/ 2 \) \( x - p \)$ near a charge and $- \( b \/ 2 \) x$ off the charges.
  This gives the radial singular expansion for $F$ and its rotated expansion for $j$.
  Orthogonality preserves the squared norm, so the same finite local puncture conclusion holds for $j$ and every
  smooth compactly supported cutoff. This local argument uses simplicity and local finiteness,
  but not the charge-growth bound.

For balls and for $Q_s$, choose cutoffs $0 lt.eq zeta_(U_s) lt.eq 1$, compactly supported in $U_s$,
  equal to one at distance at least one from its boundary, and with uniformly bounded gradients. Write

$ sans(W)_U \( j \) = limsup_(s arrow.r oo) frac(sans(W) \( j \, zeta_(U_s) \), \| U_s \|) . $

Theorem 1(1),(3),(4) of #cite(label("SandierSerfaty2012")) makes the cutoff choice immaterial within each fixed
  shape family, gives a common finite minimum

#[#set math.equation(numbering: n => "(2.2)")
 $ M = min_(cal(C)_1) sans(W)_(upright("ball")) = min_(cal(C)_1) sans(W)_Q in bb(R) \, $ <red:M>]

and provides square-periodic $j_k in cal(C)_1$ with $sans(W)_(upright("ball")) \( j_k \) arrow.r M$.
  Their square periods have side lengths $sqrt(2 pi n_k)$ for positive integers $n_k$.
  The common minimum does not assert equality of the ball and square values of an arbitrary fixed field.
  Their conditions (1.4)–(1.5) require increasing bounded open sets with $⋂_(s > 0) overline(U)_s = { 0 }$,
  left-continuous volumes, $\| U_s - U_s \| lt.eq C \| U_s \|$, and, for every fixed $a in bb(R)^2$,

$ frac(\| \( a + U_s \) triangle.stroked.t U_s \|, \| U_s \|) arrow.r 0 . $

They further require constants $C$ and $theta < 2$ such that

$ U_s + B_1 subset U_(s + C) \, wide U_(s + 1) subset U_s + B_C \, wide \| U_(s + 1) \\ U_s \| = O \( s^theta \) . $

Balls and squares satisfy these conditions with $theta = 1$ and $\| U_s - U_s \| = 4 \| U_s \|$.

We also use the following nonsharp consequences of Lemma 4.7 and Proposition 4.9 of
  #cite(label("SandierSerfaty2012")). The latter is an application of the mass-displacement method developed for
  Ginzburg–Landau energies in #cite(label("SandierSerfatyMassDisplacement2011")).
  In the proof of their Lemma 4.7, Sandier and Serfaty credit the dyadic-shell argument for the local $L^r$
  estimate to Struwe #cite(label("Struwe1994")); the precise weighted estimate used here is theirs.
  Let $U$ be bounded and open, $hat(U) = U + B_1$, and suppose $"div" j = 0$ and $"curl" j = rho - 1$ in $hat(U)$.
  The number $n$ of simple charges there is finite, and $j$ is locally square-integrable off those charges.
  For $1 < r < 2$, $0 lt.eq xi lt.eq 1$ compactly supported in $U$, and $parallel nabla xi parallel_oo lt.eq C_0$,
  Lemma 4.7 implies

#[#set math.equation(numbering: n => "(2.3)")
 $ integral_U xi^(r \/ 2) \| j \|^r lt.eq C_(r \, C_0) \( \| U \| + 1 \)^(1 - r \/ 2) #scale(x: 120%, y: 120%)[\(]
   sans(W) \( j \, xi \)_(+) + n log \( 2 + n \) + 1 #scale(x: 120%, y: 120%)[\)]^(r \/ 2) \, $ <red:local-Lr>]

where $a_(+) = max { a \, 0 }$. For $n gt.eq 1$, this follows by replacing the energy by its positive part,
  enlarging the logarithmic count, and absorbing the fixed cutoff bounds into the constant.
  The statement of Lemma 4.7 and the final display of its proof differ by a factor two on the energy term;
  this weakening covers either form. If $n = 0$, there is no puncture term and Hölder’s inequality gives directly

$ integral_U xi^(r \/ 2) \| j \|^r lt.eq \| U \|^(1 - r \/ 2) (integral_U xi \| j \|^2)^(r \/ 2) = \|
  U \|^(1 - r \/ 2) #scale(x: 120%, y: 120%)[\(] 2 sans(W) \( j \, xi \) #scale(x: 120%, y: 120%)[\)]^(r \/ 2) \, $

which also implies (2.3). Proposition 4.9 provides one measure $g_U$,
  supported in $hat(U)$ and satisfying $g_U gt.eq - C thin thin upright(d) x$,
  such that for every smooth compactly supported $xi$ in $U$,

#[#set math.equation(numbering: n => "(2.4)")
 $ lr(|sans(W) \( j \, xi \) - integral xi thin thin upright(d) g_U|) lt.eq
   C n_xi #scale(x: 120%, y: 120%)[\(] log \( 2 + n_xi \) + 1 #scale(x: 120%, y: 120%)[\)] parallel nabla xi
   parallel_oo \, $ <red:mass-displacement>]

where

$ n_xi = \# { v in Lambda : B \( v \, C \) ∩ "supp" nabla xi eq.not diameter } . $

The constants in (2.4) are universal. In particular the same $g_U$ works for two different cutoffs.
  The local smoothness needed in these results follows as in Lemma 4, after rotating the components.

=== 2.3 Scaling and comparison of fixed-width cutoffs <scaling-and-comparison-of-fixed-width-cutoffs>

#thm([Lemma 2.2.])[
  #emph[Every $E in cal(A)_1$ satisfies
#[#set math.equation(numbering: n => "(2.5)")
 $ W \( E \) gt.eq 2 pi (M - 1 / 4 log \( 2 pi \)) . $ <red:plane-lower>]

 In particular $W \( E \) eq.not - oo$.]
] <red:plane-bound>

#proof[
  The case $W \( E \) = + oo$ is immediate. Assume that its limsup is bounded above,
    allowing provisionally $W \( E \) = - oo$. Set $m = 2 pi$ and rotate the vector components by
  $ j = \( - E_2 \, E_1 \) \, wide j' \( y \) = m^(- 1 \/ 2) j \( y \/ sqrt(m) \) \, wide xi_t \( y \) =
    chi_(t \/ sqrt(m)) \( y \/ sqrt(m) \) . $
  Thus $j in cal(C)_m$ and $j' in cal(C)_1$; the charges of $j'$ are at $sqrt(m) thin Lambda$.
    The cutoff $xi_t$ is supported in $overline(Q)_t$, equals one on $overline(Q)_(t - sqrt(m))$,
    and has a uniformly bounded gradient. Changing variables in the punctured integral changes its puncture radius
    from $eta$ to $sqrt(m) thin eta$. Consequently, at each fixed $t = sqrt(m) R$,
  #[#set math.equation(numbering: n => "(2.6)")
   $ W \( E \, chi_R \) = sans(W) \( j' \, xi_t \) - pi / 2 log m sum_(v in sqrt(m) Lambda) xi_t \( v \) .
     $ <red:exact-scaling>]
  There is no area factor in this local identity.
  The charge-growth hypothesis and the upper bound on the limsup give $sans(W) \( j' \, xi_t \) lt.eq
    C t^2$ for all sufficiently large $t$. For any fixed $A > 0$,
    apply (2.3) to $xi_(t + D)$ with a fixed $D > A + sqrt(m) + 2$, in $U = Q_(t + D + 1)$.
    There are $O \( t^2 \)$ charges in $hat(U)$, and this cutoff is one on $Q_(t + A)$, so
  #[#set math.equation(numbering: n => "(2.7)")
   $ integral_(Q_(t + A)) \| j' \|^r lt.eq C_(r \, A) t^2 \( log t \)^(r \/ 2) \, wide 1 < r < 2 . $ <red:bulk-Lr>]
  Here are the charge estimates that make the boundary error negligible. Fix $A > 0$.
    Coarea for $y mapsto parallel y parallel_oo$ and (2.7) with $A + 2$ in place of $A$ give radii
  $ s_(+) in \( t + A \, t + A + 1 \) \, wide s_(-) in \( t - A - 1 \, t - A \) $
  such that both boundary integrals of $\| j' \|^r$ are at most $C t^2 \( log t \)^(r \/ 2)$.
    They may be chosen with no charge on either boundary. Stokes’ theorem,
    first on the punctured square and then letting the punctures shrink, yields
  $ rho' \( Q_(s_plus.minus) \) - \| Q_(s_plus.minus) \| = integral_(partial Q_(s_plus.minus)) j' dot.op tau thin
    thin upright(d) cal(H)^1 \, wide rho' = 2 pi sum_(v in sqrt(m) Lambda) delta_v . $
  Hölder’s inequality bounds the absolute value by $C t^(1 + 1 \/ r) \( log t \)^(1 \/ 2)$.
    Monotonicity of $rho'$ therefore gives
  #[#set math.equation(numbering: n => "(2.8)")
   $ rho' \( Q_t \) & = \| Q_t \| + o \( t^2 \) \,\
rho' \( Q_(t + A) \\ Q_(t - A) \) & lt.eq C_A #scale(x: 120%, y: 120%)[\(] t +
  t^(1 + 1 \/ r) \( log t \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] = o \( t^2 \/ log t \) . $ <red:density>]
  The last equality uses $r > 1$. In particular
  #[#set math.equation(numbering: n => "(2.9)")
   $ sum_v xi_t \( v \) = frac(\| Q_t \|, 2 pi) + o \( t^2 \) . $ <red:weighted-density>]
  Choose a fixed $L > sqrt(m) + 2$ and a standard unit-width cutoff $zeta_(Q_(t - L))$.
    Both this cutoff and $xi_t$ are compactly supported in $U = Q_(t + 1)$.
    Their gradient supports, together with any fixed-radius neighborhoods,
    lie in a strip of the form appearing in (2.8). Hence each error in (2.4) is $o \( t^2 \)$.
    Since $0 lt.eq zeta_(Q_(t - L)) lt.eq xi_t lt.eq 1$, and their difference is supported in
    $overline(Q)_t \\ Q_(t - L - 1)$,
  $ integral \( xi_t - zeta_(Q_(t - L)) \) thin thin upright(d) g_U gt.eq -
    C integral \( xi_t - zeta_(Q_(t - L)) \) thin thin upright(d) x gt.eq - O \( t \) . $
  Using this one measure for both cutoffs proves
  #[#set math.equation(numbering: n => "(2.10)")
   $ sans(W) \( j' \, xi_t \) gt.eq sans(W) \( j' \, zeta_(Q_(t - L)) \) - o \( t^2 \) . $ <red:cutoff-comparison>]
  Every boundary width used here is fixed as $t arrow.r oo$.
  Divide (2.10) by $\| Q_t \|$ and take limsups. The ratio $\| Q_(t - L) \| \/ \| Q_t \|$ tends to one, so
  $ limsup_(t arrow.r oo) frac(sans(W) \( j' \, xi_t \), \| Q_t \|) gt.eq sans(W)_Q \( j' \) gt.eq M . $
  These inequalities hold in the extended real sense. From (2.6), (2.9), and $\| Q_t \| = m \| K_R \|$, we obtain
  $ W \( E \) = m (limsup_(t arrow.r oo) frac(sans(W) \( j' \, xi_t \), \| Q_t \|) - 1 / 4 log m) . $
  This proves (2.5) and rules out the provisional case $W \( E \) = - oo$. ◻
]

=== 2.4 Periodic averaging and the harmonic component <periodic-averaging-and-the-harmonic-component>

For a periodic field $F$ with one unit logarithmic singularity at each of $N$ charges in a period cell $P$,
  define its cell energy by

$ cal(E)_P \( F \) =
  lim_(eta arrow.b 0)
  [1 / 2 integral_(P \\ union.big_v B \( v \, eta \)) \| F \|^2 thin thin upright(d) x + pi N log eta] . $

The integral is interpreted on the flat torus, so disks meeting a chosen cell boundary are identified periodically.

#thm([Lemma 2.3.])[
  #emph[Let $F$ be a periodic admissible electric field or current,
    with simple charges and period cell $P$ of area $A$. For either square or ball cutoffs with fixed boundary
    width and uniformly bounded gradients, its energy per unit area has a limit, equal to $cal(E)_P \( F \) \/ A$.]
] <red:periodic-average>

#proof[
  There are finitely many charges on the fixed torus. Choose $rho > 0$ smaller than its injectivity radius,
    with the disks about distinct torus charges disjoint, and write on its periodic lift
  $ F_rho \( x \) = 1 / 2 \| F \( x \) \|^2 -
    sum_v frac(upright(bold(1))_(B \( v \, rho \)) \( x \), 2 \| x - v \|^2) . $
  By the local expansion in Lemma 4, with rotated components for currents,
    $F_rho$ is periodic and belongs to $L^1 \( P \)$. For a cutoff $xi$ the puncture calculation gives
  $ sans(W) \( F \, xi \) & = integral xi F_rho thin thin upright(d) x + pi log rho sum_v xi \( v \) + cal(R)_xi \,\
cal(R)_xi & = sum_v integral_(B \( v \, rho \)) frac(xi \( x \) - xi \( v \), 2 \| x - v \|^2) thin thin
  upright(d) x . $
  Here $sans(W)$ denotes the same local formula for either type of field.
    A summand in $cal(R)_xi$ vanishes unless $B \( v \, rho \)$ meets $"supp" nabla xi$,
    and each has absolute value at most $pi rho parallel nabla xi parallel_oo$.
    For a ball or square of size $R$ there are $O \( R \)$ such charges,
    with constants allowed to depend on the fixed periodic field. Thus $cal(R)_xi = O \( R \)$.
  The number of period cells meeting any fixed-width boundary strip is also $O \( R \)$.
    Integrating the periodic $L^1$ function $F_rho$ over the remaining complete cells,
    and bounding the boundary cells by $parallel F_rho parallel_(L^1 \( P \))$, shows that
  $ frac(1, \| U_R \|) integral xi F_rho thin thin upright(d) x arrow.r 1 /
    A integral_P F_rho thin thin upright(d) x \, wide frac(1, \| U_R \|) sum_v xi \( v \) arrow.r N / A . $
  The resulting limit is $\( integral_P F_rho + pi N log rho \) \/ A = cal(E)_P \( F \) \/ A$. ◻
]

On $T_n = bb(R)^2 \/ \( sqrt(n) thin bb(Z)^2 \)$, let $h$ be the mean-zero solution of $- Delta h =
  2 pi \( sum_(i = 1)^n delta_(v_i) - 1 \)$ for distinct points $v_1 \, dots.h \, v_n$,
  with energy defined by (1.5). The compatibility condition holds because $\| T_n \| = n$;
  the mean-zero solution exists and is unique by the Fourier series for the Laplacian on the torus.
  Any periodic locally integrable curl-free field $E$ with divergence $- Delta h$ differs from $-
  nabla h$ by a smooth field of zero divergence and curl. Each component is harmonic on the torus, hence constant.
  Therefore $E = - nabla h + c$, with $c in bb(R)^2$. As a distributional derivative of a periodic function,
  $nabla h$ has integral zero; it is in $L^1 \( T_n \)$ by Lemma 4.
  The cross integral on the punctured torus thus tends to zero, giving the exact identity

#[#set math.equation(numbering: n => "(2.11)")
 $ cal(E)_(T_n) \( E \) = cal(W)_n \( h \) + n / 2 \| c \|^2 . $ <red:harmonic>]

Applying the same fixed orthogonal rotation to the fields preserves this energy identity.

#thm([Proposition 2.4.])[
  (Reduction to square tori).  #emph[Let $C in bb(R)$. Suppose that for every integer $n gt.eq
    2$ and every configuration of $n$ distinct points of $T_n$,
    the mean-zero potential in (1.5) satisfies $cal(W)_n \( h \) gt.eq n C$.
    Then $W \( E \) gt.eq C$ for every $E in cal(A)_1$. In particular, if these finite-torus bounds hold with $C =
    W \( E_triangle.stroked.t \)$, then
$ inf_(E in cal(A)_1) W \( E \) = W \( E_triangle.stroked.t \) . $

]
] <red:reduction>

#proof[
  Take the square-periodic minimizing sequence $j_k in cal(C)_1$ in (2.2).
    Integrating its curl on a square period torus shows that the area of that torus is $2 pi N_k$,
    where $N_k$ is its positive integer number of charges. If $N_k = 1$, use twice the square period,
    which has four charges. Lemma 6 shows that this change of period preserves the energy per unit area.
    We may therefore assume $N_k gt.eq 2$. We may also align each period square with the coordinate axes:
    simultaneous rotation of the positions and vector components preserves its cell energy,
    and the same lemma identifies its energy per unit area.
  With $m = 2 pi$, rescale and undo the component rotation:
  $ E_k \( x \) =
    sqrt(m) #scale(x: 120%, y: 120%)[\(] \( j_k \)_2 \( sqrt(m) x \) \, - \( j_k \)_1 \( sqrt(m) x \)
    #scale(x: 120%, y: 120%)[\)] . $
  This is an admissible field on $T_(N_k)$. Changing the puncture radius in its cell gives
  $ cal(E)_(T_(N_k)) \( E_k \) = cal(E)_(P_k) \( j_k \) - pi / 2 N_k log m \, wide \| P_k \| = m N_k . $
  Combining periodic averaging, (2.11), and the assumed torus inequality yields
  $ m (sans(W)_(upright("ball")) \( j_k \) - 1 / 4 log m) = frac(cal(E)_(T_(N_k)) \( E_k \), N_k) gt.eq C . $
  Letting $k arrow.r oo$ gives $m \( M - 1 / 4 log m \) gt.eq C$.
    Lemma 5 now proves the conclusion for every full-plane competitor, including all possible infinite-energy cases.
  For the last assertion, the covolume-one triangular lattice is simple, locally finite,
    and has quadratic charge growth. Its periodic potential gives an element $E_triangle.stroked.t in cal(A)_1$,
    whose finite energy follows from Lemmas 4 and 6. It supplies the opposite inequality for the infimum. ◻
]

== 3 Finite tori and separated minimizing configurations <geo:section>

We first isolate the finite-dimensional problem used in the periodic reduction.
  Separation will be proved only for its minimizing configurations.
  This suffices for a lower bound on every configuration.

For an integer $n gt.eq 2$, put

$ L = sqrt(n) \, wide T_n = bb(R)^2 \/ \( L bb(Z)^2 \) . $

The torus has area $n$. Given distinct points $v_1 \, dots.h \, v_n in T_n$,
  let $h$ be the mean-zero distributional solution of

$ - Delta h = 2 pi (sum_(i = 1)^n delta_(v_i) - 1) . $

We use the energy (1.5). For this square-torus energy, $eta$ is smaller than the injectivity radius and half the
  minimum distance between the finitely many points.

=== 3.1 Green representation and existence <green-representation-and-existence>

#thm([Lemma 3.1.])[
  (Green representation and existence).  #emph[Let $G_n$ be the mean-zero Green function on $T_n$, normalized by
$ - Delta G_n = 2 pi \( delta_0 - 1 \/ n \) \, wide R_n =
  lim_(x arrow.r 0) #scale(x: 120%, y: 120%)[\(] G_n \( x \) + log \| x \| #scale(x: 120%, y: 120%)[\)] . $

 For every configuration of $n$ distinct points,
#[#set math.equation(numbering: n => "(3.1)")
 $ h \( x \) = sum_(i = 1)^n G_n \( x - v_i \) \, wide cal(W)_n \( h \) = pi n R_n +
   pi sum_(i eq.not j) G_n \( v_i - v_j \) . $ <geo:pair-energy>]

 The minimum of $cal(W)_n$ over such configurations is attained at a configuration of distinct points.]
] <geo:existence>

#proof[
  The first identity follows from the equation and the zero-mean normalization.
    Subtracting the logarithmic singularity and applying local elliptic regularity gives, near $v_i$,
  $ h \( x \) = - log \| x - v_i \| + a_i + O \( \| x - v_i \| \) \, wide a_i = R_n +
    sum_(j eq.not i) G_n \( v_i - v_j \) . $
  Let $Omega_eta = T_n \\ union.big_i B \( v_i \, eta \)$. On its hole boundaries the outward normal points
    towards $v_i$; therefore
  $ partial_(bold(n)) h = 1 / eta + O \( 1 \) . $
  Since $Delta h = 2 pi$ on $Omega_eta$, integration by parts gives
  $ 1 / 2 integral_(Omega_eta) \| nabla h \|^2 = - pi integral_(Omega_eta) h + 1 /
    2 sum_i integral_(partial B \( v_i \, eta \)) h thin partial_(bold(n)) h . $
  The bulk integral tends to zero because $h$ has mean zero.
    The $i$-th boundary integral is $2 pi \( - log eta + a_i \) + o \( 1 \)$. Taking the puncture limit proves (3.1).
  The function $G_n$ is bounded below on its punctured torus and tends to $+ oo$ at the origin.
    Extend the right-hand side of (3.1) to $+ oo$ on configurations with a collision.
    This gives a lower semicontinuous function on the compact space $T_n^n$,
    finite at every configuration of distinct points. A collision cannot be canceled by other pair terms,
    since all those terms have a common finite lower bound. A minimum therefore exists and has distinct points. ◻
]

By (2.11), every admissible periodic field with these charges differs from $- nabla h$ by a constant vector $c$,
  which adds $n \| c \|^2 \/ 2$ to the energy. It therefore suffices to minimize over the mean-zero potentials
  considered here.

=== 3.2 Separation of minimizers <separation-of-minimizers>

The argument uses a screened logarithmic potential and the minimum principle.
  A closely related exclusion argument for minimizing configurations of a planar confined system,
  with the same single-charge screening radius, appears in Lieb, Rougerie,
  and Yngvason #cite(label("LiebRougerieYngvason2018")) Lemma 3 and Appendix A.
  The following proof treats the torus Green function and its background directly.

#thm([Lemma 3.2.])[
  (Separation).  #emph[For every $n gt.eq 2$, a minimizing configuration in Lemma 8 has torus distance at least
$ r_(*) = 1 / sqrt(pi) $

 between distinct points. Its full lift to $bb(R)^2$ has the same minimum-separation bound,
   including between different period translates of one torus point.]
] <geo:separation>

#proof[
  Fix one point $q$ of a minimizing configuration. The symmetry of $G_n$, together with (3.1), shows that
  $ Phi \( x \) = sum_(p eq.not q) G_n \( x - p \) $
  has a global minimum at $q$. At a fixed point $p eq.not q$, interpret $Phi \( p \) = + oo$.
  The injectivity radius of $T_n$ is $sqrt(n) \/ 2 > r_(*)$ for $n gt.eq 2$.
    We may therefore define a function on the embedded radius-$r_(*)$ disk by
  $ phi.alt \( x \) =
    cases(delim: "{", - log \( \| x \| \/ r_(*) \) + pi / 2 \( \| x \|^2 - r_(*)^2 \) \, & 0 < \| x \| < r_(*) \,,
    0 \, & \| x \| gt.eq r_(*) .) $
  Its value and radial derivative vanish at $r_(*)$, and it is positive inside the disk. Consequently
  $ - Delta phi.alt = 2 pi \( delta_0 - upright(bold(1))_(B \( 0 \, r_(*) \)) \) $
  without a boundary measure on the circle. Each such disk has area one.
  Set
  $ Omega = union.big_(p eq.not q) B \( p \, r_(*) \) \, wide Psi = Phi -
    sum_(p eq.not q) phi.alt \( thin dot.op - p \) . $
  All poles cancel. In particular $Psi in W^(2 \, s) \( T_n \)$ for every finite $s$, and $Psi$ is continuous.
    On $Omega$,
  $ - Delta Psi = 2 pi sum_(p eq.not q) upright(bold(1))_(B \( p \, r_(*) \)) - 2 pi frac(n - 1, n) gt.eq
    frac(2 pi, n) > 0 . $
  Since $\| Omega \| lt.eq n - 1 < n$, every component of $Omega$ has nonempty boundary.
    Every obstacle vanishes on this boundary, so $Psi = Phi$ there.
  If $q in Omega$, let $D$ be its component. The strict minimum principle,
    valid for this continuous $W^(2 \, s)$ supersolution, gives
  $ Phi \( q \) > Psi \( q \) > min_(partial D) Psi = min_(partial D) Phi gt.eq Phi \( q \) \, $
  a contradiction. No regularity of the union’s boundary is required:
    the minimum is attained on $overline(D)$, and strict superharmonicity excludes an interior minimum.
    Hence $q in.not Omega$. As $q$ was arbitrary, distinct torus points are separated by $r_(*)$.
  Distances between lifts of distinct torus points are at least their torus distance.
    Two different lifts of one point differ by a nonzero vector in $L bb(Z)^2$, whose length is at least $L =
    sqrt(n) > r_(*)$. ◻
]

== 4 Voronoi sectors and a glued dual potential <dual:section>

We first record the sector geometry of separated square-torus minimizers.
  We then prove gluing and duality for compatible periodic Voronoi sectors on any flat torus.
  This separates the general identity from its square-torus and triangular applications.
  The construction uses general radial functions; their particular choice and triangular calibration will be given
  later. Its purpose is to turn a sector lower bound, established by two scalar estimates,
  into an energy bound for a whole configuration.

The use of polygon inequalities together with an average of at most six sides is familiar from moment methods;
  see Gruber’s proof of Fejes Tóth’s theorem #cite(label("Gruber1999")).
  A related affine cell bound for a Wasserstein interaction is sharp at the regular hexagon of unit mass;
  the result of Bourne, Peletier, and Theil #cite(label("BournePeletierTheil2014")) arXiv v3,
  Lemma 12 assumes integer side counts at least three and cell mass $v gt.eq 1.5 dot.op 10^(- 4)$.
  Here we must construct a globally admissible singular potential before estimating its sector contributions.
  The arguments below supply that construction and the incidence count on a torus.

=== 4.1 Counting sectors on the torus <counting-sectors-on-the-torus>

For $d > 0$ and real $alpha \, beta$ with $\| alpha \| \, \| beta \| < pi \/ 2$ and $alpha + beta > 0$,
  define the sector

#[#set math.equation(numbering: n => "(4.1)")
 $ S \( d \, alpha \, beta \) = { \( r \, phi \) : - alpha < phi < beta \, med 0 < r < d sec phi } . $ <geo:sector>]

Its polar axis is the normal from its site toward the supporting edge.

#thm([Lemma 4.1.])[
  (Periodic Voronoi geometry).  #emph[Let $P subset bb(R)^2$ be the full $L
    bb(Z)^2$-periodic lift of $n$ distinct points on $T_n$, and suppose $P$ has separation at least $r_(*)$.
    Its Voronoi polygons, modulo $L bb(Z)^2$, have at most $6 n$ face–edge incidences.]
  #emph[Each such incidence determines a sector (4.1) in polar coordinates about its site, with $d gt.eq
    r_(*) \/ 2$. The sectors in one torus have total area $n$ and total angle $2 pi n$.
    Either endpoint parameter $alpha$ or $beta$ is allowed to be negative.]
] <geo:voronoi>

#proof[
  For $p in P$, the Voronoi cell
  $ C_p = { x : \| x - p \| lt.eq \| x - q \| upright(" for all ") q in P } $
  contains the disk of radius $r_(*) \/ 2$ about $p$. Comparison with the four sites $p
    plus.minus \( L \, 0 \)$ and $p plus.minus \( 0 \, L \)$ gives
  $ C_p subset p + \[ - L \/ 2 \, L \/ 2 \]^2 . $
  Local finiteness now implies that $C_p$ is a bounded convex polygon with finitely many sides.
    There are finitely many polygon, edge, and vertex orbits under the period lattice.
  Use maximal positive-length Voronoi edges. Each edge has two face incidences,
    and each vertex has degree at least three. Indeed a Voronoi vertex has at least three nearest sites;
    a degenerate vertex with more nearest sites only increases the degree.
    The quotient is a finite cell decomposition of the torus with $F = n$ open faces. Each open face is a disk:
    distinct translates of the interior of a lift cell are disjoint.
    A projected closed face need not be embedded, since its boundary may identify to itself.
    These identifications are permitted in the cell decomposition.
  Let $V$ and $E$ denote its numbers of vertices and edges. Euler’s identity and the degree count give
  $ V - E + n = 0 \, wide 3 V lt.eq 2 E . $
  Thus $E lt.eq 3 n$, and the number of face–edge incidences is $M_0 = 2 E lt.eq 6 n$.
    These counts include every occurrence in a face boundary:
    an edge may be a loop, a face may lie on both sides of an edge, a neighbor may recur,
    and a vertex may occur several times in one boundary. No generic-position assumption is used.
  For an edge of $C_p$ shared with $C_q$, choose as polar axis the unit vector from $p$ towards $q$.
    Its supporting line has distance $d = \| p - q \| \/ 2 gt.eq r_(*) \/ 2$ from $p$.
    The angular coordinates of its two endpoints satisfy $- pi \/ 2 < phi_(-) < phi_(+) < pi \/ 2$.
    Write $phi_(-) = - alpha$ and $phi_(+) = beta$. The triangle from $p$ to the edge is exactly (4.1).
    If the perpendicular foot is outside the edge, one of $alpha \, beta$ is negative.
  The sectors partition each polygon up to their boundary rays.
    A polygon has angle $2 pi$ about its interior site. Summing areas and angles over the $n$ quotient faces
    proves the last assertions. ◻
]

For reference, the area and angle of (4.1) are

#[#set math.equation(numbering: n => "(4.2)")
 $ A \( S \) = 1 / 2 integral_(- alpha)^beta d^2 sec^2 phi thin thin upright(d) phi \, wide theta \( S \) =
   alpha + beta . $ <geo:area-angle>]

In particular the sector has positive angle even when one endpoint parameter is negative.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (2.28, -0.9975), (2.28, 1.472), close: true, fill: rgb("#e8e8ff"), stroke: none)
  line((0, 0), (2.28, -0.9975), (2.28, 1.472), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, 0), (2.755, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((2.09, 0), (2.09, 0.19), (2.28, 0.19), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.05292, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$p$]], anchor: "east", padding: 0.1176cm)
  content((2.28, -0.9975), [#text(size: 9pt)[$v_-$]], anchor: "west", padding: 0.1176cm)
  content((2.28, 1.472), [#text(size: 9pt)[$v_+$]], anchor: "west", padding: 0.1176cm)
  line((0, -1.567), (2.28, -1.567), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((1.14, -1.567), [#text(size: 9pt)[$d$]], anchor: "south", padding: 0.1176cm)
  arc((0.684, 0), start: 0deg, stop: 32.86deg, radius: 0.684, stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.912, 0.285), [#text(size: 9pt)[$beta$]])
  arc((0.608, 0), start: 0deg, stop: -23.63deg, radius: 0.608, stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.893, -0.2565), [#text(size: 9pt)[$- alpha$]])
  content((1.092, -2.232), [#text(size: 9pt)[The foot lies on the edge.#linebreak()$alpha , beta gt.eq 0$]])
  line((5.985, 0), (8.265, 0.6175), (8.265, 1.9), close: true, fill: rgb("#e8e8ff"), stroke: none)
  line((5.985, 0), (8.265, 0.6175), (8.265, 1.9), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  line((5.985, 0), (8.74, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((8.265, 0), (8.265, 0.6175), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((8.075, 0), (8.075, 0.19), (8.265, 0.19), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  circle((5.985, 0), radius: 0.05292, fill: black, stroke: none)
  content((5.985, 0), [#text(size: 9pt)[$p$]], anchor: "east", padding: 0.1176cm)
  content((8.265, 0.6175), [#text(size: 9pt)[$v_-$]], anchor: "west", padding: 0.1176cm)
  content((8.265, 1.9), [#text(size: 9pt)[$v_+$]], anchor: "west", padding: 0.1176cm)
  line((5.985, -1.567), (8.265, -1.567), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((7.125, -1.567), [#text(size: 9pt)[$d$]], anchor: "south", padding: 0.1176cm)
  arc((7.125, 0), start: 0deg, stop: 39.81deg, radius: 1.14, stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.362, 0.76), [#text(size: 9pt)[$beta$]])
  arc((6.65, 0), start: 0deg, stop: 15.15deg, radius: 0.665, stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.726, -0.171), [#text(size: 9pt)[$- alpha >0$]])
  content((7.077, -2.232), [#text(size: 9pt)[The foot lies beyond the edge.#linebreak()$alpha <0< beta$]])
})],
  caption: [Figure 1: Two possible Voronoi sectors, with the edge normal as angular axis. In the right-hand sector both endpoints are above that axis, so the lower endpoint parameter $alpha$ is negative even though the sector angle $alpha + beta$ is positive. ],
) <fig:signed-sectors>

=== 4.2 Compatible flat-torus data and trace matching <compatible-flat-torus-data-and-trace-matching>

Let $Gamma subset bb(R)^2$ be a rank-two lattice and put $bb(T) = bb(R)^2 \/ Gamma$.
  Let $N gt.eq 1$ be an integer, let $v_1 \, dots.h \, v_N$ be distinct points of $bb(T)$,
  and let $P$ be their full $Gamma$-periodic lift. Suppose that the Voronoi cells of $P$ are bounded convex
  polygons with finitely many face–edge incidences modulo $Gamma$.
  Assume that each incidence has the sector form (4.1) and that, for one named constant $d_0 > 0$,
  every sector has $d gt.eq d_0$. We call these #emph[compatible periodic Voronoi data with lower edge distance
  $d_0$]. This is conditional geometric data, not a separation assertion about an arbitrary competitor.

The sectors partition the $N$ cells modulo $Gamma$, up to their boundary rays.
  Their total area is $\| bb(T) \|$, and their total angle is $2 pi N$:
  each convex cell has its site in its interior because $d_0 > 0$, so its sectors have total angle $2 pi$.
  These facts do not require an incidence bound.

Call a radius $eta > 0$ admissible if it is smaller than the injectivity radius of $bb(T)$ and, when $N gt.eq 2$,
  smaller than half the minimum torus distance between distinct sites.
  Thus the torus disks $B \( v_i \, eta \)$ are embedded and pairwise disjoint; for $N =
  1$ there is no pairwise-distance condition. Write

$ Omega_eta = bb(T) \\ union.big_(i = 1)^N B \( v_i \, eta \) . $

In puncture limits we may further take $eta < d_0$, so every deleted disk lies in its Voronoi cell.
  This restriction does not change a limit as $eta arrow.b 0$.

Fix compatible periodic Voronoi data with lower edge distance $d_0$.
  Let $I$ be a finite or countable index set, and choose integers $k_i gt.eq 6$, $i in I$;
  different indices may have the same integer. Suppose that

$ B in C^1 \( \( 0 \, oo \) \) \, wide D_i in C^1 \( \( 0 \, oo \) \) $

satisfy the following assumptions:

#[#set math.equation(numbering: n => "(4.3)")
 $ B \( r \) = - log r + O \( r^2 \) \, wide B' \( r \) = - 1 \/ r + O \( r \) quad \( r arrow.b 0 \) \,
   $ <dual:radial-origin>]

and, for every $T_0 > d_0$,

#[#set math.equation(numbering: n => "(4.4)")
 $ sum_(i in I) med sup_(d_0 lt.eq t lt.eq T_0) #scale(x: 120%, y: 120%)[\(] \( 1 + k_i \) \| D_i \( t \) \| +
   t \| D'_i \( t \) \| #scale(x: 120%, y: 120%)[\)] < oo . $ <dual:radial-sum>]

These are the exact inputs needed in the gluing and duality argument.
  The later radial construction will verify them directly.

For a sector (4.1), define $t \( phi \) = d sec phi$ and

#[#set math.equation(numbering: n => "(4.5)")
 $ H \( r \, phi \) = B \( r \) + sum_(i in I) (frac(r, t \( phi \)))^(k_i) D_i \( t \( phi \) \) . $ <dual:trial>]

The same radial functions are used in every sector.

#thm([Lemma 4.2.])[
  (Gluing and singular normalization).  #emph[For compatible periodic Voronoi data on $bb(T)$ with $N gt.eq
    1$ distinct sites and lower edge distance $d_0$, let $I$ be finite or countable, let $k_i gt.eq
    6$ be integers with repetitions permitted, and let $B \, D_i in C^1 \( \( 0 \, oo \) \)$ satisfy (4.3)–(4.4).
    The sector functions (4.5) define a $Gamma$-periodic function $H$ that is continuous off the sites and belongs
    to $H^1 \( Omega_eta \)$ for every admissible $eta < d_0$. At every site, uniformly in the angular variable,
#[#set math.equation(numbering: n => "(4.6)")
 $ H = - log r + O \( r^2 \) \, wide nabla H = - e_r / r + O \( r \) . $ <dual:singularity>]

 The gradient statement is sectorwise, and hence holds for the weak gradient almost everywhere;
   no agreement of derivatives across sectors is asserted. In particular the constant term in $H + log r$ is zero.]
] <dual:gluing>

#proof[
  Fix the finite collection of lifted polygons needed for one torus.
    Their vertex radii are bounded by some $T_0 > d_0$. On each closed sector, $d_0 lt.eq t lt.eq T_0$,
    $r \/ t lt.eq 1$, and $tan phi$ is bounded. The derivatives of a summand are
  $ partial_r [\( r \/ t \)^(k_i) D_i \( t \)] = k_i / r \( r \/ t \)^(k_i) D_i \( t \) \, $
  and
  $ partial_phi [\( r \/ t \)^(k_i) D_i \( t \)] = tan phi thin \( r \/ t \)^(k_i) #scale(x: 120%, y: 120%)[\(] t
    D'_i \( t \) - k_i D_i \( t \) #scale(x: 120%, y: 120%)[\)] . $
  Assumption (4.4) therefore gives uniform convergence of the series and its first derivatives on each closed
    sector away from its site. Derivatives here are sectorwise; derivatives across different sectors need not agree.
  On a polygon edge, $r = t$, so the trace is
  $ B \( r \) + sum_i D_i \( r \) . $
  The two adjacent sites have the same distance to that edge point, and hence give the same trace.
    On a ray from a site to a vertex at distance $r_v$, either neighboring sector has $t =
    r_v$ at its endpoint angle. Both traces along the entire ray are
  $ B \( r \) + sum_i \( r \/ r_v \)^(k_i) D_i \( r_v \) . $
  At a multiple vertex all incident sites have the same vertex distance, so the edge traces also coincide there.
    The recipe is unchanged by period translations.
  Thus all traces match. Applying the Sobolev gluing property to the finitely many sectors gives the asserted
    $H^1$ regularity off the holes. No matching of normal derivatives is required.
  For $r lt.eq d_0 \/ 2$, the fact that every $k_i gt.eq 6$, together with (4.4),
    bounds the correction series by $O \( r^6 \)$ and its gradient by $O \( r^5 \)$.
    Combining these bounds with (4.3) proves (4.6). ◻
]

The common notation $D_i = b_i - u_i$, $B = sum_i u_i$ is one way to supply these data.
  In that notation the common edge trace is simply $sum_i b_i \( r \)$.
  The gluing argument itself only uses $B$ and $D_i$.

=== 4.3 The exact dual identity <the-exact-dual-identity>

Assume now that $\| bb(T) \| = N$. Let $h$ be the mean-zero distributional solution on $bb(T)$ of

#[#set math.equation(numbering: n => "(4.7)")
 $ - Delta h = 2 pi (sum_(i = 1)^N delta_(v_i) - 1) . $ <dual:torus-potential>]

The area condition is exactly the compatibility condition for this equation. With the convention

$ Gamma^(*) = { k in bb(R)^2 : k dot.op gamma in bb(Z) upright(" for every ") gamma in Gamma } \, $

the Fourier mode $e^(2 pi i k dot.op x)$ has eigenvalue $4 pi^2 \| k \|^2$ under $- Delta$.
  The constant Fourier coefficient of the right-hand side vanishes.
  Dividing its coefficient at each nonzero $k in Gamma^(*)$ by $4 pi^2 \| k \|^2$,
  and setting the coefficient at zero to zero, gives a distributional solution.
  It is unique because the kernel of the Laplacian on the torus consists of constants. Define

#[#set math.equation(numbering: n => "(4.8)")
 $ cal(W)_(bb(T)) \( h \) =
   lim_(eta arrow.b 0) [1 / 2 integral_(Omega_eta) \| nabla h \|^2 thin thin upright(d) x + pi N log eta] \,
   $ <dual:torus-energy>]

where the limit is taken through admissible radii. The local calculation in Lemma 4, applied in a torus chart,
  gives the finite puncture limit. When $bb(T) = T_n$ and $N = n$, this is exactly $cal(W)_n \( h \)$ in (1.5).

For a sector $S = S \( d \, alpha \, beta \)$, define

#[#set math.equation(numbering: n => "(4.9)")
 $ integral_S^(upright("ren")) \| nabla H \|^2 = lim_(eta arrow.b 0)
   [integral_(S ∩ { r > eta }) \| nabla H \|^2 thin thin upright(d) x + theta \( S \) log eta] . $ <dual:sector-ren>]

Lemma 11 shows that this limit is finite. Its counterterm uses the positive angle $theta \( S \)$,
  also for a sector with a negative endpoint parameter. Define

#[#set math.equation(numbering: n => "(4.10)")
 $ J \( S \) = - 2 pi integral_S H thin thin upright(d) x - 1 /
   2 integral_S^(upright("ren")) \| nabla H \|^2 . $ <dual:sector-functional>]

The sectorwise estimates in the proof of Lemma 11 also show that these expressions are well defined on any
  individual sector with $d gt.eq d_0$ and the endpoint conditions in (4.1), without first choosing a periodic tiling.

#thm([Proposition 4.3.])[
  (Dual identity).  #emph[For compatible periodic Voronoi data on $bb(T) = bb(R)^2 \/ Gamma$ with $N gt.eq
    1$ distinct sites, lower edge distance $d_0 > 0$, and $\| bb(T) \| = N$,
    let $h$ be the mean-zero potential (4.7). Let $I$ be finite or countable, let $k_i gt.eq
    6$ be integers with repetitions permitted, and let $B \, D_i in C^1 \( \( 0 \, oo \) \)$ satisfy (4.3)–(4.4).
    Let $H$ be the function supplied by Lemma 11. Then
#[#set math.equation(numbering: n => "(4.11)")
 $ cal(W)_(bb(T)) \( h \) = sum_S J \( S \) + 1 / 2 integral_(bb(T)) \| nabla \( h - H \) \|^2 thin thin
   upright(d) x gt.eq sum_S J \( S \) . $ <dual:energy-bound>]

 The sum runs over all face–edge incidences in one torus. No incidence bound or square-torus separation hypothesis
   is imposed.]
] <dual:identity>

#proof[
  Apply Lemma 4 in a local chart to $- nabla h$. Near each site, $h = - log r + a_i + O \( r \)$ and $nabla h = -
    e_r \/ r + O \( 1 \)$. Thus both $h$ and $H$ have singular gradient $- e_r \/ r$.
    Their difference has square-integrable gradient. Also (4.6) implies that
  $ I_(upright("ren")) \( H \) = lim_(eta arrow.b 0) [integral_(Omega_eta) \| nabla H \|^2 + 2 pi N log eta] $
  exists. For admissible $eta < d_0$, the punctured sectors partition $Omega_eta$ up to their boundaries.
    The sector angles sum to $2 pi N$, so $I_(upright("ren")) \( H \)$ equals the sum of (4.9).
  Green’s identity, with $h$ smooth on the punctured torus and $H in H^1 \( Omega_eta \)$, gives
  $ integral_(Omega_eta) nabla h dot.op nabla H = - 2 pi integral_(Omega_eta) H +
    sum_i integral_(partial B \( v_i \, eta \)) H thin partial_(bold(n)) h . $
  The outward hole normal gives $partial_(bold(n)) h = 1 \/ eta + O \( 1 \)$.
    The zero constant term in (4.6) therefore gives
  $ integral_(Omega_eta) nabla h dot.op nabla H = - 2 pi integral_(bb(T)) H - 2 pi N log eta + o \( 1 \) . $
  Expanding $\| nabla \( h - H \) \|^2$, inserting this identity, and taking the puncture limit proves
  $ cal(W)_(bb(T)) \( h \) = - 2 pi integral_(bb(T)) H - 1 / 2 I_(upright("ren")) \( H \) + 1 /
    2 integral_(bb(T)) \| nabla \( h - H \) \|^2 . $
  Partitioning the first two terms into sectors proves (4.11). ◻
]

If the gradient hypotheses were unchanged but the value expansion were instead $H = - log r + c_i +
  o \( 1 \)$ at $v_i$, the right-hand side of the last identity would contain the additional term $2 pi sum_i
  c_i$. This explains why the zero constant term in the radial construction is part of the normalization.

For a square-torus minimizer, Lemma 10 supplies the compatible data with $Gamma = sqrt(n) thin bb(Z)^2$, $N = n$,
  and $d_0 = d_(*) = r_(*) \/ 2 = 1 \/ \( 2 sqrt(pi) \)$. Its torus has area $n$,
  so Proposition 12 applies with $cal(W)_(bb(T)) = cal(W)_n$.
  The triangular application in the next section supplies its own period and sectors and does not use a
  square-torus minimizer.

=== 4.4 From scalar estimates to configuration bounds <from-scalar-estimates-to-configuration-bounds>

The two scalar bounds below control ordinary and signed sectors by different arguments.
  Once they yield an affine lower bound for each sector, the dual identity and the incidence count give the energy
  bound. We formulate this implication for compatible flat tori first;
  separation of a square-torus minimizer then removes the geometric hypotheses from the finite-volume comparison.

#thm([Lemma 4.4.])[
  (Signed endpoint parameters).  #emph[Let $K < 0$ and $d_0 > 0$.
    For each $d gt.eq d_0$, let $G \( d \, dot.op \)$ be an even locally integrable real function on $bb(R)$, and put
$ g_d \( x \) = integral_0^x G \( d \, s \) thin thin upright(d) s . $

 Suppose that, for every $d gt.eq d_0$,
#[#set math.equation(numbering: n => "(4.12)")
 $ 2 g_d \( x \) gt.eq K quad \( x gt.eq 0 \) \, wide integral_0^oo max { 0 \, -
   G \( d \, s \) } thin thin upright(d) s lt.eq - K . $ <dual:scalar-input>]

 Then, for every $d gt.eq d_0$ and every pair $alpha \, beta$ with $\| alpha \| \, \| beta \| < pi \/
   2$ and $alpha + beta > 0$,
#[#set math.equation(numbering: n => "(4.13)")
 $ g_d \( d tan alpha \) + g_d \( d tan beta \) gt.eq K . $ <dual:signed-bound>]

]
] <dual:signed-endpoints>

#proof[
  Evenness of $G \( d \, dot.op \)$ makes $g_d$ odd. If $alpha \, beta gt.eq 0$,
    the first inequality in (4.12) bounds each term in (4.13) below by $K \/ 2$.
  If $alpha < 0$, set
  $ u = - d tan alpha \, wide v = d tan beta . $
  The inequality $alpha + beta > 0$ gives $beta > - alpha > 0$.
    Since the tangent is increasing on $\( - pi \/ 2 \, pi \/ 2 \)$, we have $0 < u < v$.
    Oddness and the second inequality in (4.12) give
  $ g_d \( d tan alpha \) + g_d \( d tan beta \) & = g_d \( v \) - g_d \( u \) =
    integral_u^v G \( d \, s \) thin thin upright(d) s\
 & gt.eq - integral_0^oo max { 0 \, - G \( d \, s \) } thin thin upright(d) s gt.eq K . $
  The case $beta < 0$ is symmetric. Both endpoints cannot be negative because their sum is positive,
    so these cases are exhaustive. ◻
]

#thm([Proposition 4.5.])[
  (From sector bounds to energy bounds).  #emph[Let $d_0 > 0$, let $I$ be finite or countable, let $k_i gt.eq
    6$ be integers with repetitions permitted, and let $B \, D_i in
    C^1 \( \( 0 \, oo \) \)$ satisfy (4.3) and (4.4) with this lower distance $d_0$.
    For every sector (4.1) with $d gt.eq d_0$, use these same radial data in (4.5) and let $J \( S \)$ be the
    functional (4.10). Suppose that $K lt.eq 0$ and $lambda \, mu in bb(R)$ satisfy
#[#set math.equation(numbering: n => "(4.14)")
 $ J \( S \( d \, alpha \, beta \) \) & gt.eq K + lambda A \( S \( d \, alpha \, beta \) \)\
 & wide + mu theta \( S \( d \, alpha \, beta \) \) \, $ <dual:sector-input>]

 for every $d gt.eq d_0$, $\| alpha \| \, \| beta \| < pi \/ 2$, and $alpha + beta > 0$.]
  #emph[#emph[Compatible tori.] Let $bb(T) = bb(R)^2 \/ Gamma$ have area $N$, where $N gt.eq 1$ is an integer.
    Suppose $N$ distinct sites supply compatible periodic Voronoi data with lower edge distance $d_0$ and at most
    $6 N$ face–edge sectors. Their mean-zero potential (4.7) satisfies
#[#set math.equation(numbering: n => "(4.15)")
 $ cal(W)_(bb(T)) \( h \) gt.eq N \( 6 K + lambda + 2 pi mu \) . $ <dual:compatible-bound>]

]
  #emph[#emph[All square-torus configurations.] Assume in addition $d_0 lt.eq d_(*) = 1 \/ \( 2 sqrt(pi) \)$.
    For every integer $n gt.eq 2$ and every configuration of $n$ distinct points $v_1 \, dots.h \, v_n$ on $T_n =
    bb(R)^2 \/ \( sqrt(n) thin bb(Z)^2 \)$, let $h$ be the mean-zero solution of
$ - Delta h = 2 pi (sum_(i = 1)^n delta_(v_i) - 1) . $

 Then its puncture-first energy (1.5), with embedded and pairwise disjoint punctures, satisfies
#[#set math.equation(numbering: n => "(4.16)")
 $ cal(W)_n \( h \) gt.eq n \( 6 K + lambda + 2 pi mu \) . $ <dual:all-configurations>]

 More generally, if a periodic locally integrable field $E$ on $T_n$ satisfies, distributionally,
$ "div" E = 2 pi (sum_(i = 1)^n delta_(v_i) - 1) \, wide "curl" E = 0 \, $

 then $E = - nabla h + c$ for a constant $c in bb(R)^2$, and its energy with the same punctures and counterterm obeys
$ cal(E)_(T_n) \( E \) = cal(W)_n \( h \) + n / 2 \| c \|^2 gt.eq n \( 6 K + lambda + 2 pi mu \) . $

 The energy identity remains valid after applying the same fixed orthogonal rotation to both fields.]
] <dual:assembly>

#proof[
  For compatible data, the sectors have total area $N$ and total angle $2 pi N$.
    Write $M_0 lt.eq 6 N$ for their number. Proposition 12 and (4.14) give
  $ cal(W)_(bb(T)) \( h \) & gt.eq sum_S J \( S \)\
 & gt.eq M_0 K + lambda N + 2 pi mu N\
 & gt.eq N \( 6 K + lambda + 2 pi mu \) . $
  The last inequality uses $M_0 lt.eq 6 N$ and $K lt.eq 0$; it includes $K = 0$, when both terms involving $K$ vanish.
  Now assume $d_0 lt.eq d_(*)$ and fix $n gt.eq 2$. Lemma 8 supplies a minimizing configuration of distinct
    points, with potential $h_min$. Lemma 9 separates its full periodic lift by $r_(*) = 1 \/ sqrt(pi)$.
    Lemma 10 then gives at most $6 n$ sectors, each with edge distance at least $d_(*) gt.eq d_0$.
    These are compatible data on $T_n$, so (4.15) applies to $h_min$.
    Every other distinct configuration has energy at least $cal(W)_n \( h_min \)$,
    proving (4.16) without a separation assumption on that configuration.
  Equation (2.11) applies to the displayed divergence and curl conditions and gives the constant harmonic
    component and its exact energy penalty. A fixed orthogonal rotation preserves the squared norm and the
    puncture counterterm, giving the last assertion. ◻
]

The next section chooses particular radial data and exact constants $K < 0 \, lambda \, mu$.
  For these data, the primitive identity (5.15) and the two scalar bounds yield

$ J \( S \) gt.eq K + lambda A \( S \) + mu theta \( S \) $

for every relevant sector. Proposition 18 applies the compatible-torus conclusion to this construction and
  identifies $6 K + lambda + 2 pi mu$ with the triangular energy.
  Section 8 uses the square-torus conclusion, whose minimizer argument has already removed the separation hypothesis.

== 5 Calibration on the triangular cell <cal:section>

We construct the radial functions used by the Voronoi test potential.
  The potential has the same gradient as the triangular Green function on a regular hexagon,
  while its energy on every other sector reduces to two scalar estimates.
  The continuation outside that hexagon is auxiliary; its explicit form makes those estimates accessible to
  interval arithmetic.

=== 5.1 The local triangular Green function <the-local-triangular-green-function>

Set

#[#set math.equation(numbering: n => "(5.1)")
 $ a = sqrt(2 / sqrt(3)) \, wide p = a / 2 \, wide R_0 = frac(2 p, sqrt(3)) \, wide x_0 = R_0 / 2 . $ <cal:geometry>]

Thus $p$ and $R_0$ are the inradius and circumradius of the covolume-one triangular Voronoi hexagon, and $x_0 =
  p tan \( pi \/ 6 \)$. Identify the plane with $bb(C)$, and write $partial_z = \( partial_x - i partial_y \) \/
  2$, with a nearest lattice point on the positive real axis. For $m gt.eq 1$ put

#[#set math.equation(numbering: n => "(5.2)")
 $ k_m = 6 m \, wide c_m = 1 / k_m sum_(z in Lambda_triangle.stroked.t \\ { 0 }) z^(- k_m) . $ <cal:coefficients>]

These sums converge absolutely and are real by reflection symmetry.
  We also introduce an auxiliary index $0$, with $k_0 = 6$. It is distinct from index $1$:
  both exponents equal $6$, but they will carry different radial functions.

#thm([Lemma 5.1.])[
  #emph[The mean-zero triangular Green function has the expansion
#[#set math.equation(numbering: n => "(5.3)")
 $ h_triangle.stroked.t \( z \) = - log \| z \| + C_triangle.stroked.t + frac(pi \| z \|^2, 2) +
   sum_(m gt.eq 1) c_m "Re" \( z^(6 m) \) \, wide 0 < \| z \| < a \, $ <cal:green-series>]

 where $C_triangle.stroked.t$ is its regular part at the origin.
   The series and all of its derivatives converge locally away from $\| z \| = a$.]
] <cal:green-expansion>

#proof[
  Away from the lattice, $Delta h_triangle.stroked.t = 2 pi$,
    so $2 partial_z^2 h_triangle.stroked.t$ is a meromorphic elliptic function.
    Its double pole at each lattice point has principal part $\( z - lambda \)^(- 2)$.
    Subtract the absolutely locally convergent Weierstrass series
  $ ℘ \( z \) = 1 / z^2 + sum_(lambda eq.not 0) #scale(x: 120%, y: 120%)[\(] \( z - lambda \)^(- 2) -
    lambda^(- 2) #scale(x: 120%, y: 120%)[\)] . $
  The difference is holomorphic and periodic, hence constant.
    If $omega = e^(pi i \/ 3)$, invariance of $h_triangle.stroked.t$ under $z mapsto omega
    z$ implies that its second complex derivative transforms by $omega^(- 2)$; the same is true of $℘$.
    Their constant difference must therefore vanish. Expanding each summand for $\| z \| < a$ gives
  $ ℘ \( z \) = z^(- 2) + sum_(j gt.eq 1) \( j + 1 \) z^j sum_(lambda eq.not 0) lambda^(- j - 2) . $
  Rotation makes the inner sum zero unless $j + 2$ is a multiple of $6$.
    Twice complex differentiation of the right side of (5.3) gives this series,
    because $k_m \( k_m - 1 \) c_m = \( k_m - 1 \) sum lambda^(- k_m)$.
    The difference is a real harmonic affine function after subtracting $pi \| z \|^2 \/ 2$;
    rotation removes its linear part and leaves $C_triangle.stroked.t$.
    Normal convergence follows either from this power series or from the absolutely convergent lattice sums on
    every smaller disk. ◻
]

=== 5.2 Matching the regular hexagon <matching-the-regular-hexagon>

Write $gamma \( r \) = - log r + pi r^2 \/ 2$ for $r > 0$.
  We first choose the radial data on the regular hexagon, where the test potential must equal
  $h_triangle.stroked.t - C_triangle.stroked.t$. In a sector whose outward normal is the positive real axis,
  the edge has distance $p$ and the endpoint angles are $plus.minus pi \/ 6$.
  At an edge point of radius $t = p sec phi$,

$ p + i sqrt(t^2 - p^2) = t e^(i \| phi \|) . $

The boundary value of the $m$th Green-function mode is therefore $c_m t^(k_m) cos \( k_m phi \)$.
  Expressing it as a function of the radius gives the polynomial

#[#set math.equation(numbering: n => "(5.4)")
 $ V_m \( r \) = c_m sum_(j = 0)^(k_m \/ 2) \( - 1 \)^j binom(k_m, 2 j) p^(k_m - 2 j) \( r^2 - p^2 \)^j \, wide
   p lt.eq r lt.eq R_0 . $ <cal:edge-polynomial>]

On either vertex ray, the same mode equals $\( - 1 \)^m c_m r^(k_m)$, since $k_m pi \/ 6 = m pi$.
  This is the radial baseline we use for that mode inside the hexagon.
  The correction in (4.5) then recovers the angular dependence exactly:

$ \( - 1 \)^m c_m r^(k_m) + \( r \/ t \)^(k_m) #scale(x: 120%, y: 120%)[\(] V_m \( t \) - \( - 1 \)^m c_m t^(k_m)
  #scale(x: 120%, y: 120%)[\)] = c_m r^(k_m) cos \( k_m phi \) . $

Thus the edge data $b_m = V_m$ and the vertex-ray baseline determine the desired potential on each regular sector.
  Its remaining part $gamma$ is already radial and needs no correction there.

=== 5.3 Continuation to arbitrary sectors <continuation-to-arbitrary-sectors>

Other Voronoi sectors can have edge radii below $p$ or above $R_0$.
  We now extend the radial data to those radii, keeping two derivatives and making the correction vanish beyond a
  fixed radius. The assembled potential is required to agree with $h_triangle.stroked.t -
  C_triangle.stroked.t$ only inside the regular hexagon; the continuation is chosen for the scalar estimates,
  not as an extension of that Green function.

Define the clipped polynomial

$ S \( y \) = cases(delim: "{", 0 \, & y lt.eq 0 \,, 10 y^3 - 15 y^4 + 6 y^5 \, & 0 < y < 1 \,, 1 \, & y gt.eq 1 .) $

Let $h_s = 3 \/ 40$ and $c = 3 \/ 50$. For $0 lt.eq z lt.eq h_s$ put

$ P \( z \) = z - frac(6 z^3, h_s^2) + frac(8 z^4, h_s^3) - frac(3 z^5, h_s^4) \, wide Q \( z \) = z^2 / 2 -
  frac(3 z^3, 2 h_s) + frac(3 z^4, 2 h_s^2) - frac(z^5, 2 h_s^3) . $

For a function $V$ with two left derivatives at $R_0$, its continuation is defined for $r gt.eq R_0$ by

#[#set math.equation(numbering: n => "(5.5)")
 $ \( cal(H) V \) \( r \) =
   cases(delim: "{", V \( R_0 \) + P \( r - R_0 \) V' \( R_0 \) + Q \( r - R_0 \) V'' \( R_0 \) \, & r lt.eq R_0 +
   h_s \,, V \( R_0 \) \, & r > R_0 + h_s .) $ <cal:continuation>]

Indeed $\( P \, P' \, P'' \) \( 0 \) = \( 0 \, 1 \, 0 \)$ and $\( Q \, Q' \, Q'' \) \( 0 \) = \( 0 \, 0 \, 1 \)$;
  all six values at $h_s$ vanish. Thus this operation preserves two derivatives at $R_0$ and joins a constant with
  two derivatives at $R_0 + h_s$.

Define $b_0 = gamma$ up to $R_0$, continued by (5.5). For $m gt.eq 1$, set $b_m =
  V_m$ on $\[ p \, R_0 \]$ and use $cal(H) V_m$ above $R_0$. Below $p$ put

#[#set math.equation(numbering: n => "(5.6)")
 $ b_m \( r \) =
   cases(delim: "{", 0 \, & 0 < r lt.eq p - c \,, S \( \( r - p + c \) \/ c \) #scale(x: 120%, y: 120%)[\(] T_(0
   m) + T_(1 m) \( r - p \) + T_(2 m) \( r - p \)^2 #scale(x: 120%, y: 120%)[\)] \, & p - c < r < p \,)
   $ <cal:inner-continuation>]

where

$ T_(0 m) & = c_m p^(k_m) \,\
T_(1 m) & = - frac(k_m \( k_m - 1 \), p) T_(0 m) \,\
T_(2 m) & = frac(k_m \( k_m - 1 \), p^2) (frac(\( k_m - 2 \) \( k_m - 3 \), 6) - 1 / 2) T_(0 m) . $

Direct differentiation of (5.4) gives $T_(0 m) = V_m \( p \)$, $T_(1 m) = V'_m \( p \)$, and $2 T_(2 m) =
  V''_m \( p \)$. Consequently every $b_i$ is $C^2$ away from the origin.

Now define

$ U_m \( r \) = \( - 1 \)^m c_m r^(k_m) #scale(x: 120%, y: 120%)[\(] 1 -
  S \( \( r - R_0 \) \/ \( 1 \/ 10 \) \) #scale(x: 120%, y: 120%)[\)] \, wide tau \( r \) =
  S (frac(r - R_0 - 1 \/ 1000, 3 \/ 40)) \, $

and set

#[#set math.equation(numbering: n => "(5.7)")
 $ u_0 & = \( 1 - tau \) gamma + tau b_0 \, wide u_m = \( 1 - tau \) U_m + tau b_m quad \( m gt.eq 1 \) \,\
B & = sum_(i gt.eq 0) u_i \, wide D_i = b_i - u_i \, wide l = R_0 + 19 / 250 . $ <cal:radial-data>]

Here the auxiliary mode $0$ lets the radial part $gamma$ join its constant continuation by the same correction
  mechanism as the other modes. Its exponent $k_0 = 6$ makes this correction vanish at the pole without changing
  the singular normalization. The coefficient estimates proved below justify the sums and their first three
  derivatives on every open spline interval. In particular, $B \,
  D_i$ are $C^2$ and piecewise $C^3$ away from zero. Near zero, $B = gamma +
  sum_(m gt.eq 1) \( - 1 \)^m c_m r^(k_m)$; normal convergence of (5.3) therefore gives

#[#set math.equation(numbering: n => "(5.8)")
 $ B \( r \) = - log r + O \( r^2 \) \, wide B' \( r \) = - 1 \/ r + O \( r \) quad \( r arrow.b 0 \) \,\
D_i \( r \) = 0 \, wide B \( r \) = B \( l \) quad \( r gt.eq l \) . $ <cal:radial-endpoints>]

The fixed radial data also satisfy (4.4) for every $d_0 > 0$.
  Indeed, there are only finitely many retained modes, while for the omitted modes (6.4) and the vanishing of
  $D_i$ beyond $l$ bound the summand on $\[ d_0 \, T_0 \]$ by $\( 1 + k_i + T_0 \) w_(k_i)$.
  The explicit geometric terms in (6.3) make this series summable.
  This conclusion uses the analytic mode bounds, not the later finite-core estimates.

For a sector with edge distance $d$ and endpoint angles $- alpha < beta$, write $t \( phi \) =
  d sec phi$ and use the test potential

#[#set math.equation(numbering: n => "(5.9)")
 $ H \( r \, phi \) = B \( r \) + sum_(i gt.eq 0) (frac(r, t \( phi \)))^(k_i) D_i \( t \( phi \) \) \, wide
   0 < r < t \( phi \) \, quad - alpha < phi < beta . $ <cal:trial-potential>]

At the edge its trace is $sum_i b_i \( t \)$; at a ray ending at a vertex of radius $r_v$ its trace is
  $B \( r \) + sum_i \( r \/ r_v \)^(k_i) D_i \( r_v \)$. These expressions explain both trace matching conditions
  in the glued Voronoi construction.

=== 5.4 The sector integral <the-sector-integral>

The following formulas separate radial integration from sector geometry. For $t > 0$ define

#[#set math.equation(numbering: n => "(5.10)")
 $ B_1 \( t \) & = B' \( t \) + 1 \/ t \, wide S_1 \( t \) = integral_0^t B \( r \) r thin d r \,\
S_2 \( t \) & = integral_0^t #scale(x: 120%, y: 120%)[\(] - 2 B_1 \( r \) +
  r B_1 \( r \)^2 #scale(x: 120%, y: 120%)[\)] thin d r \,\
H_k \( t \) & = t^(- k) integral_0^t B_1 \( r \) r^k thin d r \, wide Q_i \( t \) = t D'_i \( t \) -
  k_i D_i \( t \) . $ <cal:radial-integrals>]

Here $H_k$ is indexed by the exponent, so the two modes with exponent six use the same $H_6$.
  They remain separate in every sum involving $D_i$. Put

#[#set math.equation(numbering: n => "(5.11)")
 $ f_0 \( t \) =  & - 2 pi (S_1 \( t \) + t^2 sum_i frac(D_i \( t \), k_i + 2))\
 & - 1 / 2 #scale(x: 300%, y: 300%)[\(] log t + S_2 \( t \) + sum_i #scale(x: 120%, y: 120%)[\(] - 2 D_i \( t \) +
   2 k_i D_i \( t \) H_(k_i) \( t \) #scale(x: 120%, y: 120%)[\)]\
 & wide + sum_(i \, j) frac(k_i k_j, k_i + k_j) D_i \( t \) D_j \( t \) #scale(x: 300%, y: 300%)[\)] \,\
e \( t \) =  & 1 / 2 sum_(i \, j) frac(Q_i \( t \) Q_j \( t \), k_i + k_j) . $ <cal:f0-e>]

All sums here and below include index $0$. The angular coefficient is nonnegative, since

#[#set math.equation(numbering: n => "(5.12)")
 $ e \( t \) = 1 / 2 integral_0^1 (sum_i Q_i \( t \) v^(k_i))^2 frac(d v, v) gt.eq 0 . $ <cal:positive-kernel>]

Let $J$ denote the sector contribution to the dual energy,

$ J = - 2 pi integral_(upright("sector")) H - 1 / 2 integral_(upright("sector"))^(upright("ren")) \| nabla H \|^2 \, $

where the renormalized integral adds $\( alpha + beta \) log
  eta$ before letting the radial exclusion $eta$ tend to zero. Then

#[#set math.equation(numbering: n => "(5.13)")
 $ J = integral_(- alpha)^beta #scale(x: 120%, y: 120%)[\(] f_0 \( d sec phi \) -
   tan^2 phi thin e \( d sec phi \) #scale(x: 120%, y: 120%)[\)] thin d phi . $ <cal:angle-density>]

To verify this identity, differentiate (5.9):

$ H_r = - 1 / r + B_1 \( r \) + sum_i k_i / r \( r \/ t \)^(k_i) D_i \( t \) \, wide H_phi =
  tan phi sum_i \( r \/ t \)^(k_i) Q_i \( t \) . $

The source integral gives $S_1 + t^2 sum_i D_i \/ \( k_i + 2 \)$.
  The radial square contributes $log t + S_2$, its cross terms contribute $- 2 D_i + 2 k_i D_i H_(k_i)$,
  and its quadratic terms have coefficient $k_i k_j \/ \( k_i + k_j \)$.
  Integrating the angular square gives $tan^2 phi sum Q_i Q_j \/ \( k_i + k_j \)$. These are precisely (5.11).
  The estimates below permit termwise integration.

=== 5.5 Subtracting area and angle <subtracting-area-and-angle>

Given real constants $lambda \, mu$, define

#[#set math.equation(numbering: n => "(5.14)")
 $ f \( t \) & = f_0 \( t \) - lambda t^2 \/ 2 - mu \, wide t = sqrt(d^2 + s^2) \,\
G \( d \, s \) & = d / t^2 f \( t \) - frac(s^2, d t^2) e \( t \) \, wide g_d \( x \) =
  integral_0^x G \( d \, s \) thin d s quad \( d > 0 \, med x in bb(R) \) . $ <cal:primitive>]

The evenness of $G$ in $s$ makes $g_d$ odd. If $A$ is the sector area and $theta = alpha + beta$,
  substitution $s = d tan phi$ in (5.13) gives

#[#set math.equation(numbering: n => "(5.15)")
 $ J - lambda A - mu theta = g_d \( d tan alpha \) + g_d \( d tan beta \) . $ <cal:sector-primitive>]

This identity holds for signed endpoint angles; only $\| alpha \| \, \| beta \| < pi \/ 2$ and $alpha +
  beta > 0$ are required.

We choose $lambda \, mu$ so that the adjusted primitive is stationary at the regular sector
  $\( d \, x \) = \( p \, x_0 \)$, and set $K$ to twice its value there. The exact choices are

#[#set math.equation(numbering: n => "(5.16)")
 $ lambda = frac(1, p x_0) #scale(x: 240%, y: 240%)[\[] & p / x_0 #scale(x: 120%, y: 120%)[\(] f_0 \( R_0 \) -
   f_0 \( p \) #scale(x: 120%, y: 120%)[\)] - x_0 / p e \( R_0 \)\
 & + p integral_0^(x_0) frac(f_0 \( sqrt(p^2 + s^2) \) - f_0 \( p \), s^2) thin d s + 1 /
   p integral_0^(x_0) e \( sqrt(p^2 + s^2) \) thin d s #scale(x: 240%, y: 240%)[\]] \,\
mu =  & f_0 \( R_0 \) - 1 / 3 e \( R_0 \) - lambda R_0^2 \/ 2 \, wide K = 2 g_p \( x_0 \) . $ <cal:constants>]

The first integrand extends continuously to $s = 0$ with value $f'_0 \( p \) \/ \( 2 p \)$.

#thm([Lemma 5.2.])[
  #emph[For the constants (5.16), $nabla_(d \, x) g_d \( x \) = 0$ at $\( p \, x_0 \)$.]
] <cal:stationarity>

#proof[
  Let $g_d^0$ denote the primitive before subtracting area and angle.
    For fixed $u = pi \/ 6$, differentiation in the angle representation gives
  $ frac(d, d d) g_d^0 \( d tan u \)\|_(d = p) = integral_0^(x_0) frac(f'_0 \( t \) - s^2 e' \( t \) \/ p^2, t)
    thin d s \, wide t = sqrt(p^2 + s^2) . $
  Set $V \( s \) = f_0 \( t \) - f_0 \( p \)$. Since $V \( s \) = O \( s^2 \)$,
    integration by parts has no boundary term at zero and yields
  $ integral_0^(x_0) frac(f'_0 \( t \), t) thin d s = frac(f_0 \( R_0 \) - f_0 \( p \), x_0) +
    integral_0^(x_0) frac(V \( s \), s^2) thin d s \, $
  whereas
  $ integral_0^(x_0) frac(s^2 e' \( t \), p^2 t) thin d s = frac(x_0 e \( R_0 \), p^2) - 1 /
    p^2 integral_0^(x_0) e \( t \) thin d s . $
  The difference is the bracket in (5.16) divided by $p$, hence equals $lambda x_0$.
    The subtracted area along $x = d tan u$ is $lambda d^2 tan u \/ 2$;
    its derivative at $p$ is also $lambda x_0$, and the subtracted angle is constant.
    Thus the derivative of $g_d \( d tan u \)$ vanishes there.
    Finally $partial_x g_p \( x_0 \) = G \( p \, x_0 \) = 0$ by the definition of $mu$, because $x_0^2 \/ p^2 =
    1 \/ 3$. The fixed-angle derivative is $partial_d + \( x_0 \/ p \) partial_x$, so $partial_d$ vanishes as well. ◻
]

#thm([Lemma 5.3.])[
  #emph[The calibrated constants satisfy
#[#set math.equation(numbering: n => "(5.17)")
 $ W \( E_triangle.stroked.t \) = 6 K + lambda + 2 pi mu . $ <cal:triangular-energy>]

]
] <cal:energy-identity>

#proof[
  Take $bb(T) = bb(R)^2 \/ Lambda_triangle.stroked.t$ and $N = 1$.
    Its regular Voronoi hexagon supplies six compatible sectors with $d = p$ and $alpha = beta = pi \/ 6$.
    The radial normalization and summability proved above supply the hypotheses of Proposition 12 with $d_0 = p$,
    and the torus has area one. This application uses no square-torus minimizer or incidence theorem.
  On each sector $p lt.eq t lt.eq R_0$, $u_0 \( r \) = gamma \( r \)$ and $u_m \( r \) = \( - 1 \)^m c_m
    r^(k_m)$ for $r lt.eq t$. The edge trace and mode cancellation established above therefore give
  $ H \( r \, phi \) = gamma \( r \) + sum_(m gt.eq 1) c_m r^(k_m) cos \( k_m phi \) = h_triangle.stroked.t -
    C_triangle.stroked.t . $
  All six normals differ by multiples of $pi \/ 3$, which leaves these cosines unchanged.
    Hence $nabla H = nabla h_triangle.stroked.t$ and the nonnegative square in (4.11) is zero.
    Each sector has area $1 \/ 6$ and angle $pi \/ 3$; its right side in (5.15) is $2 g_p \( x_0 \) = K$.
    Summing the six contributions gives the cell energy $6 K + lambda + 2 pi mu$.
    Lemma 6 identifies this cell energy with $W \( E_triangle.stroked.t \)$, proving (5.17). ◻
]

=== 5.6 The two scalar estimates needed by the geometry <the-two-scalar-estimates-needed-by-the-geometry>

The remaining analytic task is to establish

#[#set math.equation(numbering: n => "(5.18)")
 $ K < 0 \, wide 2 g_d \( x \) gt.eq K quad \( d gt.eq b \, med x gt.eq 0 \) \, wide b = 28209 / 100000 \,\
integral_0^oo max { 0 \, - G \( d \, s \) } thin d s lt.eq - K quad \( d gt.eq b \) . $ <cal:scalar-bounds>]

The rational endpoint $b = 28209 \/ 100000$ is below the geometric threshold $d_(*) = 1 \/ \( 2 sqrt(pi) \)$.
  Thus the domain $d gt.eq b$ covers all edge distances supplied by the separated-minimizer geometry;
  the elementary comparison is justified in Section 8.

The second estimate is essential when the perpendicular from a point to a Voronoi edge falls outside that edge.
  Its role is made precise in the following implication, which completes the geometric part of the argument once
  (5.18) has been certified.

#thm([Proposition 5.4.])[
  #emph[Assume (5.18) for the functions and constants just constructed.
    Let $bb(T) = bb(R)^2 \/ Gamma$ be a flat torus of area $N$, where $N gt.eq 1$ is an integer, and let $v_1 \,
    dots.h \, v_N$ be distinct sites. Suppose their full periodic lift gives compatible periodic Voronoi data with
    lower edge distance $d_0 = b$ and at most $6 N$ face-edge sectors.
    Let $h$ be the mean-zero potential (4.7), with energy $cal(W)_(bb(T)) \( h \)$ defined by (4.8). Then
$ cal(W)_(bb(T)) \( h \) gt.eq N W \( E_triangle.stroked.t \) . $

]
] <cal:scalar-to-torus>

#proof[
  The radial normalization and compact summability established above supply the radial hypotheses of
    Proposition 14 with $d_0 = b$. Evenness of $G$ and (5.18) supply the hypotheses of Lemma 13 at this same lower
    distance. Combining its conclusion with (5.15) gives
  $ J \( S \) gt.eq K + lambda A \( S \) + mu theta \( S \) $
  for every sector with $d gt.eq b$, including the signed endpoint cases.
    The compatible-torus conclusion (4.15) now gives
  $ cal(W)_(bb(T)) \( h \) gt.eq N \( 6 K + lambda + 2 pi mu \) = N W \( E_triangle.stroked.t \) . $
  The equality is the exact triangular calibration (5.17), not a numerical estimate of the triangular energy. ◻
]

== 6 Infinite-mode truncation and error propagation <tail:section>

This section supplies analytic estimates for the modes omitted after $m = 38$.
  We use the radial functions $b_m \, U_m \, u_m \, B \, D_m$ of the preceding construction, with

$ a = sqrt(2 \/ sqrt(3)) \, wide p = a \/ 2 \, wide R_0 = a \/ sqrt(3) \,\
b = 28209 / 100000 \, wide h_s = 3 / 40 \, wide c = 3 / 50 \, wide l = R_0 + 19 / 250 . $

Thus $k_0 = 6$, $k_m = 6 m$ for $m gt.eq 1$, and

$ c_m = 1 / k_m sum_(z in Lambda_triangle.stroked.t \\ { 0 }) z^(- k_m) . $

Tildes will always mean that the modes $m gt.eq 39$ have been omitted; the index-zero term is retained.
  Differences between a full quantity and its truncation are denoted by $Delta$.
  Our goal is an absolute error below $10^(- 11)$ for $f_0 \,
  e$ and their first two derivatives on $\[ b \, l \]$, conditional on the retained-mode bounds verified in Section 7.

=== 6.1 Coefficient estimates <tail:coefficients>

Write a lattice point as $z = a \( n + q \/ 2 + i sqrt(3) q \/ 2 \)$, with $\( n \, q \) in bb(Z)^2$. Then

$ \| z \/ a \|^2 = n^2 + n q + q^2 gt.eq 3 / 4 max \( \| n \| \, \| q \| \)^2 . $

There are $8 v$ integer pairs with $max \( \| n \| \, \| q \| \) = v$.
  For every $d = 6 m gt.eq 6$ and every positive integer $D$, the sum outside the square $\| n \| \, \| q \| lt.eq
  D$, before multiplication by $a^(- d)$, is therefore at most

#[#set math.equation(numbering: n => "(6.1)")
 $ 8 \( 4 \/ 3 \)^(d \/ 2) sum_(v > D) v^(1 - d) lt.eq 8 \( 4 \/ 3 \)^(d \/ 2) frac(D^(2 - d), d - 2) .
   $ <tail:coefficient-square>]

The last inequality follows by comparison with the integral from $D$ to infinity.
  The first shell has six points with squared norm $1$ and two with squared norm $3$. Moreover,

$ sum_(v gt.eq 2) v^(1 - d) lt.eq 2^(1 - d) + integral_2^oo x^(1 - d) thin thin upright(d) x =
  2^(1 - d) (1 + frac(2, d - 2)) lt.eq 3 thin 2^(1 - d) . $

It follows that, for $d = k_m gt.eq 12$,

#[#set math.equation(numbering: n => "(6.2)")
 $ \| c_m \| lt.eq frac(1, d a^d) (6 + 2 thin 3^(- d \/ 2) + 24 \( 4 \/ 3 \)^(d \/ 2) 2^(1 - d)) lt.eq
   frac(7, d a^d) . $ <tail:coefficient-uniform>]

Indeed, the bracket equals $6 + 50 \/ 729 < 7$ at $d = 12$, and its two nonconstant terms decrease with $d$.
  The finite coefficient enclosures may use (6.1) with $D = 256$ for $m = 1$ and $D = 48$ for $2 lt.eq m lt.eq
  38$, including the factor $1 \/ \( k_m a^(k_m) \)$. Reflection symmetry makes each coefficient real.

=== 6.2 Uniform derivative bounds for omitted modes <tail:radial-derivatives>

For $k = 6 m gt.eq 234$, define the rational number

#[#set math.equation(numbering: n => "(6.3)")
 $ w_k =
   10^6
   (30 k^2 \( 13 \/ 20 \)^k + 3 dot.op 10^6 k^3 2^(- k) + 5600 k^5 \( 3 \/ 5 \)^k + 7 dot.op 10^11 k^2 \( 289 \/
   500 \)^k) . $ <tail:w-definition>]

For $0 lt.eq j lt.eq 3$ and $0 < r lt.eq l$, the construction satisfies

#[#set math.equation(numbering: n => "(6.4)")
 $ \| u_m^(\( j \)) \( r \) \| lt.eq w_k \, wide \| D_m^(\( j \)) \( r \) \| lt.eq w_k . $ <tail:mode-derivative-bound>]

At spline knots these inequalities mean both one-sided derivatives. Here are explicit checks of the constants.

The polynomial cutoff $S \( y \) = 10 y^3 - 15 y^4 + 6 y^5$ on $\[ 0 \, 1 \]$,
  extended constantly outside that interval, obeys

$ \| S \| lt.eq 1 \, wide \| S' \| lt.eq 2 \, wide \| S'' \| lt.eq 6 \, wide \| S''' \| lt.eq 60 . $

The identities $p^4 = 1 \/ 12$ and $R_0^4 = 4 \/ 27$ give the convenient rational bounds

$ .537 < p < .538 \, quad .620 < R_0 < .621 \, quad .696 < l < .697 \, quad l \/ a < 13 \/ 20 \, quad
  R_0 \/ a < 289 \/ 500 . $

All terminating decimals in this section denote rational numbers.

For $U_m \( r \) = \( - 1 \)^m c_m r^k \( 1 - S \( \( r - R_0 \) \/ .1 \) \)$,
  Leibniz’ rule and (6.2) bound the third derivative by

$ 7 k^2 \( l \/ a \)^k (l^(- 3) + frac(60, k l^2) + frac(1800, k^2 l) + 60000 / k^3) . $

Using $l > .69$ and $k gt.eq 234$, the coefficient of $k^2 \( 13 \/ 20 \)^k$ is less than $25.445 < 30$.
  The same calculation for orders $0 \, 1 \, 2$ gives coefficients below $0.000001$, $0.000197$, and $0.070572$,
  respectively. This proves the first term inside the parentheses in (6.3).

For $p - c lt.eq r lt.eq p$, write $q_m \( r \) = T_(0 m) + T_(1 m) \( r - p \) + T_(2 m) \( r - p \)^2$,
  so that $b_m \( r \) = S \( \( r - p + c \) \/ c \) q_m \( r \)$. Since $p \/ a = 1 \/ 2$ and $p > 1 \/ 2$,

$ \| T_(0 m) \| lt.eq 7 / k 2^(- k) \, wide \| T_(1 m) \| lt.eq 14 k 2^(- k) \, wide \| T_(2 m) \| lt.eq 14 /
  3 k^3 2^(- k) . $

The last inequality uses $\( \( k - 2 \) \( k - 3 \) \/ 6 \) - 1 \/ 2 lt.eq k^2 \/ 6$. Consequently

$ \| q_m \| & lt.eq \( 7 \/ k + .84 k + .0168 k^3 \) 2^(- k) \,\
\| q'_m \| & lt.eq \( 14 k + .56 k^3 \) 2^(- k) \,\
\| q''_m \| & lt.eq \( 28 \/ 3 \) k^3 2^(- k) . $

In particular,

$ \| b'''_m \| lt.eq 60 / c^3 \| q_m \| + 18 / c^2 \| q'_m \| + 6 /
  c \| q''_m \| < 8500 k^3 2^(- k) < 3 dot.op 10^6 k^3 2^(- k) . $

The lower derivative orders satisfy the same final bound, and below $p - c$ the function is zero.

On $\[ p \, p + .01 \]$, put $w = r^2 - p^2$ and $X = p + sqrt(w)$.
  The polynomial formula for $V_m$ gives, for $0 lt.eq ell lt.eq 3$,

$ lr(|frac(thin upright(d)^ell V_m, thin upright(d) w^ell)|) lt.eq \| c_m \| k^(2 ell) X^(k - 2 ell) . $

For $j gt.eq ell$, the coefficient comparison that proves this is

$ j \( j - 1 \) dots.h.c \( j - ell + 1 \) binom(k, 2 j) lt.eq k^(2 ell) binom(k - 2 ell, 2 j - 2 ell) . $

The bound $p > .537$ implies $.02 p + .0001 < .04 p^2$, hence $X lt.eq 1.2 p = \( 3 \/ 5 \) a$ on this interval.
  Also $r < .55$ and $X > 1 \/ 2$. The chain rule gives

$ V'''_m \( r \) = 8 r^3 frac(thin upright(d)^3 V_m, thin upright(d) w^3) +
  12 r frac(thin upright(d)^2 V_m, thin upright(d) w^2) . $

Thus its absolute value is at most

$ 7 (8 \( .55 \)^3 2^6 + frac(12 \( .55 \) 2^4, 234^2)) k^5 \( 3 \/ 5 \)^k < 597 k^5 \( 3 \/ 5 \)^k . $

The lower derivatives satisfy smaller bounds. The common bound $5600
  k^5 \( 3 \/ 5 \)^k$ therefore applies through order three.

On $\[ p + .01 \, R_0 \]$, use $z = p + i sqrt(r^2 - p^2)$, so that $V_m = Re \( c_m z^k \)$ and $\| z \| = r$.
  Direct differentiation gives

$ \| z' \| lt.eq 7 \, wide \| z'' \| lt.eq 300 \, wide \| z''' \| lt.eq 60000 . $

For example, $sqrt(r^2 - p^2) > .103$, $p < .54$, and $r < .63$ suffice in the formulas $\| z' \| =
  r \/ sqrt(r^2 - p^2)$, $\| z'' \| = p^2 \/ \( r^2 - p^2 \)^(3 \/ 2)$, and $\| z''' \| =
  3 p^2 r \/ \( r^2 - p^2 \)^(5 \/ 2)$. Since $1 \/ r < 2$, the third derivative of $c_m z^k$ is bounded by

$ 7 (8 dot.op 343 + frac(12 dot.op 7 dot.op 300, 234) + frac(2 dot.op 60000, 234^2)) k^2 \( 289 \/ 500 \)^k <
  20000 k^2 \( 289 \/ 500 \)^k . $

All derivative orders through three are therefore bounded by $3 dot.op 10^6 k^2 \( 289 \/ 500 \)^k$ on this interval.

For the extension $cal(H) V_m = V_m \( R_0 \) + P \( r - R_0 \) V'_m \( R_0 \) + Q \( r - R_0 \) V''_m \( R_0 \)$,
  direct bounds on the coefficients of $P \, Q$ show, for $0 lt.eq j lt.eq 3$,

$ \| P^(\( j \)) \| lt.eq 2 dot.op 10^5 \, wide \| Q^(\( j \)) \| lt.eq 4000 . $

Thus the common bound for the extension is at most

$ \( 1 + 200000 + 4000 \) thin 3 dot.op 10^6 k^2 \( 289 \/ 500 \)^k < 7 dot.op 10^11 k^2 \( 289 \/ 500 \)^k . $

It remains valid on the constant part beyond $R_0 + h_s$.

Finally the cutoff $tau \( r \) = S \( \( r - R_0 - .001 \) \/ .075 \)$ satisfies

$ \| tau^(\( j \)) \| lt.eq 1 \, 27 \, 1067 \, 142223 wide \( j = 0 \, 1 \, 2 \, 3 \) . $

The maximal Leibniz factor through order three is $1 + 3 dot.op 27 + 3 dot.op 1067 + 142223 = 145506 < 10^6$.
  Applying this to $u_m = \( 1 - tau \) U_m + tau b_m$ and $D_m = \( 1 - tau \) \( b_m - U_m \)$ proves (6.4).
  The series and their indicated derivatives consequently converge absolutely and locally uniformly.
  For $r < b$, the omitted $u_m$ derivatives additionally have their original $O \( r^(k - 3) \)$ behavior.

=== 6.3 Norms and bounds for retained modes <tail:norms>

For a function $F$ with one-sided derivatives as needed, define

$ \| F \|_(j \, t) = sum_(q = 0)^j frac(\| F^(\( q \)) \( t \) \|, q !) \, wide parallel F parallel_(j \, I) =
  sup_(t in I) \| F \|_(j \, t) . $

These norms are submultiplicative. For nonnegative weights $omega_i$,
  a weighted mode norm means $sup_(t in I) sum_i omega_i \| F_i \|_(j \, t)$: the sum is taken before the supremum.

The finite interval verification in Section 7 establishes the following bounds for the retained modes:

#[#set math.equation(numbering: n => "(6.5)")
 $ \| tilde(B)_1 \|_(2 \, t) < 6000 \, wide sum_(i = 0)^38 \( k_i + 1 \)^3 \| tilde(D)_i \|_(3 \, t) < 2 dot.op
   10^6 \, wide b lt.eq t lt.eq l . $ <tail:finite-core-premise>]

The finite coefficient enclosure also supplies $\| c_1 \| < 1$.
  These assertions are not conclusions of the analytic estimates in this section.
  Conditional on them, the remaining estimates below are independent of the finite calculation.

On $\[ 0 \, b \]$,

$ tilde(B)_1 \( t \) = pi t + sum_(m = 1)^38 \( - 1 \)^m k_m c_m t^(k_m - 1) $

has norm $\| tilde(B)_1 \|_(2 \, t) < 10$. For an explicit check, use $t < b < 2 \/ 7$, $a > 1$, $pi < 22 \/ 7$,
  and $\| c_1 \| < 1$ for the first mode. The modes $k gt.eq
  12$ contribute at most $sum_(k = 12 \, 18 \, dots.h) 7 k^2 \( 2 \/ 7 \)^(k - 3) < .014$;
  the first term and its geometrically decreasing ratios prove this last rational inequality.
  Together with the linear term and the $k = 6$ term this is less than $10$.

=== 6.4 Summing the omitted modes <tail:sum>

Set

#[#set math.equation(numbering: n => "(6.6)")
 $ frak(a) = sum_(k = 234 \, 240 \, dots.h) \( k + 1 \)^4 w_k < 2 dot.op 10^(- 21) \, wide W_(*) =
   4 sum_(k = 234 \, 240 \, dots.h) w_k lt.eq 4 frak(a) . $ <tail:weighted-sum>]

Here is a rational verification of the numerical inequality. For each term $\( k + 1 \)^4 k^s r^k$, with

$ \( s \, r \) = \( 2 \, 13 \/ 20 \) \, \( 3 \, 1 \/ 2 \) \, \( 5 \, 3 \/ 5 \) \, \( 2 \, 289 \/ 500 \) \, $

the ratio at the next allowed index is

$ (frac(k + 7, k + 1))^4 (frac(k + 6, k))^s r^6 . $

It decreases with $k$, and at $k = 234$ it is strictly below $1 \/ 10$ for all four pairs.
  The first weighted summand obeys the exact rational comparison

$ 235^4 thin 10^6 #scale(x: 120%, y: 120%)[\(] & 30 dot.op 234^2 \( 13 \/ 20 \)^234 +
  3 dot.op 10^6 dot.op 234^3 2^(- 234)\
 & + 5600 dot.op 234^5 \( 3 \/ 5 \)^234 + 7 dot.op 10^11 dot.op 234^2 \( 289 \/ 500 \)^234
   #scale(x: 120%, y: 120%)[\)] < 1.56 dot.op 10^(- 21) . $

Multiplying by $10 \/ 9$ gives a bound less than $2 dot.op 10^(- 21)$, as asserted in (6.6).

Since $Delta B_1 = sum_(m gt.eq 39) u'_m$, the derivative estimates give

$ \| Delta B_1 \|_(2 \, t) lt.eq W_(*) \, wide 0 lt.eq t lt.eq l \, $

and, on $\[ b \, l \]$,

$ sum_(i gt.eq 39) \( k_i + 1 \)^j \| D_i \|_(3 \, t) lt.eq 4 frak(a) \, wide 0 lt.eq j lt.eq 4 . $

Indeed the divided-factorial sums use factors $5 \/ 2$ and $8 \/ 3$, respectively, both less than $4$.

=== 6.5 Propagation to the sector functions <tail:propagation>

Recall the quantities entering the sector formula:

$ B_1 \( t \) & = B' \( t \) + 1 \/ t \, & S_1 \( t \) & = integral_0^t B \( r \) r thin thin upright(d) r \,\
S_2 \( t \) & = integral_0^t \( - 2 B_1 \( r \) + r B_1 \( r \)^2 \) thin thin upright(d) r \, & H_k \( t \) & =
  t^(- k) integral_0^t B_1 \( r \) r^k thin thin upright(d) r \,\
Q_i \( t \) & = t D'_i \( t \) - k_i D_i \( t \) . $

Write $N = 2 dot.op 10^6$ temporarily. Direct differentiation of $Delta S_1$ gives

$ \| Delta S_1 \|_(2 \, t) lt.eq 3 W_(*) . $

For example $\| Delta B^(\( j \)) \| lt.eq W_(*) \/ 4$ through order three,
  so the norm is at most $\[ t^2 \/ 2 + t + \( 1 + t \) \/ 2 \] W_(*) \/ 4$ for $t lt.eq l < 1$.
  For the other integral, use

$ Delta \( - 2 B_1 + t B_1^2 \) = #scale(x: 120%, y: 120%)[\(] - 2 +
  t \( 2 tilde(B)_1 + Delta B_1 \) #scale(x: 120%, y: 120%)[\)] Delta B_1 . $

The second-order norm of its integral is at most twice the supremum of the first-order norm of the integrand,
  because $l < 1$. Submultiplicativity and $\| t \|_(1 \, t) < 2$ yield

$ \| Delta S_2 \|_(2 \, t) lt.eq \( 4 + 8 dot.op 6000 + 4 W_(*) \) W_(*) < 60000 W_(*) . $

The identities and elementary bounds

$ H'_k = B_1 - k H_k \/ t \, quad \| H_k \| lt.eq frac(t parallel B_1 parallel_(0 \, \[ 0 \, t \]), k + 1) \,
  quad \| H'_k \| lt.eq 2 parallel B_1 parallel_(0 \, \[ 0 \, t \]) \, quad \| H''_k \| lt.eq \| B'_1 \| +
  frac(2 k, t) parallel B_1 parallel_(0 \, \[ 0 \, t \]) $

imply, for $b lt.eq t lt.eq l$,

#[#set math.equation(numbering: n => "(6.7)")
 $ \| H_k \|_(2 \, t) lt.eq 6 \( k + 1 \) \( 6000 + W_(*) \) \, wide \| Delta H_k \|_(2 \, t) lt.eq
   6 \( k + 1 \) W_(*) . $ <tail:H-estimate>]

Indeed $l \/ \( k + 1 \) + 5 \/ 2 + k \/ b < 6 \( k + 1 \)$.
  The bound for $Delta H_k$ follows by the same linear argument applied to $Delta B_1$.

The radial source and energy functions are

$ f_0 \( t \) =  & - 2 pi (S_1 \( t \) + t^2 sum_i frac(D_i \( t \), k_i + 2))\
 & - 1 /
   2
   (log t + S_2 \( t \) + sum_i \( - 2 D_i + 2 k_i D_i H_(k_i) \) \( t \) + sum_(i \, j) frac(k_i k_j, k_i + k_j)
   D_i \( t \) D_j \( t \)) \,\
e \( t \) =  & 1 / 2 sum_(i \, j) frac(Q_i \( t \) Q_j \( t \), k_i + k_j) . $

The preceding bounds give

#[#set math.equation(numbering: n => "(6.8)")
 $ \| f_0 - tilde(f)_0 \|_(2 \, t) & lt.eq 2 pi \( 3 W_(*) + 16 frak(a) \)\
 & quad + 1 / 2 #scale(x: 120%, y: 120%)[\(] 60000 W_(*) + 8 frak(a) + 12 \( 2 dot.op 10^6 \) W_(*) +
   48 \( 6000 + W_(*) \) frak(a)\
 & #h(44mm)  + 8 \( 2 dot.op 10^6 \) frak(a) + 16 frak(a)^2 #scale(x: 120%, y: 120%)[\)] < 6 dot.op 10^7 frak(a) .
   $ <tail:f-estimate>]

For completeness, $\| t^2 \|_(2 \, t) = \( t + 1 \)^2 < 4$ gives the $16 frak(a)$ source term.
  The sum of $- 2 D_i$ contributes $8 frak(a)$. Split the mixed term as

$ sum_i k_i \( D_i H_(k_i) - tilde(D)_i tilde(H)_(k_i) \) = sum_(i lt.eq 38) k_i tilde(D)_i Delta H_(k_i) +
  sum_(i gt.eq 39) k_i D_i H_(k_i) . $

The finite and omitted weighted norms give $12 N W_(*)$ and $48 \( 6000 + W_(*) \)
  frak(a)$ after including its factor $2$. Bounding $k_i k_j \/ \( k_i + k_j \)$ by $k_i k_j$,
  the quadratic difference is at most $8 N frak(a) + 16 frak(a)^2$. These are precisely the terms in (6.8).
  Finally $W_(*) lt.eq 4 frak(a)$, $pi < 22 \/ 7$, and $frak(a) < 2 dot.op
  10^(- 21)$ make its total coefficient less than $56 \, 264 \, 181 < 6 dot.op 10^7$.

Since $k_i gt.eq 6$ and $t < 1$, direct differentiation of $Q_i$ shows

$ \| Q_i \|_(2 \, t) lt.eq 2 \( k_i + 1 \) \| D_i \|_(3 \, t) . $

For example, its coefficients on $\| D_i \| \, \| D'_i \| \, \| D''_i \| \, \|
  D'''_i \|$ are bounded respectively by $k_i$, $t + k_i - 1$, $t + \( k_i - 2 \) \/ 2$, and $t \/ 2$.
  The finite and omitted sums of these norms are bounded by $2 N$ and $8 frak(a)$.
  Dropping the denominator $k_i + k_j gt.eq 1$ in the energy difference therefore gives

#[#set math.equation(numbering: n => "(6.9)")
 $ \| e - tilde(e) \|_(2 \, t) lt.eq 16 \( 2 dot.op 10^6 \) frak(a) + 32 frak(a)^2 . $ <tail:e-estimate>]

The norm contains half the absolute second derivative. Accounting for this factor,
  (6.8) and (6.9) imply absolute truncation errors less than $10^(- 11)$ for every member of

#[#set math.equation(numbering: n => "(6.10)")
 $ f_0 \, quad e \, quad f'_0 \, quad e' \, quad f''_0 \, quad
   e'' wide \( b lt.eq t lt.eq l \) . $ <tail:uniform-error>]

In fact the respective second derivative bounds are below $2.4 dot.op 10^(- 13)$ and $1.3 dot.op 10^(- 13)$.

=== 6.6 The constant region <tail:constant-region>

For $r gt.eq l$, all $D_i$ vanish and $B$ is constant. The omitted constant satisfies

$ \| Delta B \( l \) \| lt.eq sum_(k = 234 \, 240 \, dots.h) 7 / k \( R_0 \/ a \)^k lt.eq
  frac(\( 7 \/ 234 \) \( 289 \/ 500 \)^234, 1 - \( 289 \/ 500 \)^6) < 6.075 dot.op 10^(- 58) < 10^(- 11) . $

Since $B_1 \( t \) = 1 \/ t$ there, the derivatives of $log t$ and $S_2 \( t \)$ cancel.
  The full infinite-mode functions consequently obey the exact formula

#[#set math.equation(numbering: n => "(6.11)")
 $ e \( t \) = 0 \, wide f_0 \( t \) = f_0 \( l \) - pi B \( l \) \( t^2 - l^2 \) \, wide t gt.eq
   l . $ <tail:exterior-formula>]

Thus outside $\[ b \, l \]$ one propagates the enclosures of $f_0 \( l \)$ and $B \( l \)$ through this exact
  formula; no uniform absolute error for arbitrarily large $t$ is asserted.

== 7 The finite scalar verification <sec:computation>

The geometric argument requires the two inequalities (5.18) for the exact functions $G$ and $g_d$.
  We now specify a finite calculation that implies them. Its inputs are the radial data (5.7),
  the formulas (5.11), and the constants defined by the integrals (5.16).
  Its outputs are interval bounds for these constants, two strict bounds on a compact rectangle,
  and a positive Hessian bound near the exact stationary point.
  The estimates of Section 6 connect the finite radial calculation to the infinite series.

Every terminating decimal in this section denotes an exact rational number.
  An interval enclosure always contains the exact mathematical quantity in question.
  In particular, the constants $lambda \, mu \, K$ are not replaced by rounded numerical choices.
  Their enclosures are used in all subsequent operations, while Lemma 16 supplies stationarity for their exact values.

=== 7.1 Outward arithmetic and derivative intervals <comp:arithmetic>

The calculation follows the interval inclusion principle:
  every operation encloses its exact result, and analytic remainders are added explicitly.
  Revol and Rouillier #cite(label("RevolRouillier2005")) discuss this principle and the dependence of enclosure
  width on expressions and subdivision. We specify the integer operations here,
  so the proof’s arithmetic assumptions and rounding rules are explicit.

Put $q = 2^144$. A scalar interval is represented by integers $u lt.eq v$, meaning $\[ u \/ q \, v \/ q \]$.
  Rational inputs are rounded down at the lower endpoint and up at the upper endpoint.
  Addition and negation are exact at this denominator. Multiplication takes the least and greatest of the four
  endpoint products, then divides by $q$ with outward rounding. If $0 < u lt.eq v$, inversion gives

$ [frac(floor.l q^2 \/ v floor.r, q) \, frac(ceil.l q^2 \/ u ceil.r, q)] \; $

negative intervals are treated by negation, and division by an interval containing zero is forbidden.
  Integer powers use repeated multiplication. For a positive interval, integer square roots give the enclosure

$ [frac(floor.l sqrt(u q) floor.r, q) \, frac(floor.l sqrt(v q) floor.r + 1, q)] . $

The extra unit in the upper endpoint is harmless when the upper square root is an integer.

For logarithms, first extract an integer power of two and reduce the argument to $\[ 1 \/ 4 \, 1 \]$.
  The arguments used below are positive table intervals or enclosures of fixed positive constants;
  their widths allow this reduction. With $z = \( v - 1 \) \/ \( v + 1 \)$, evaluate

#[#set math.equation(numbering: n => "(7.1)")
 $ log v = 2 sum_(j = 0)^199 frac(z^(2 j + 1), 2 j + 1) + cal(R) \, wide \| cal(R) \| lt.eq
   frac(2 \( 3 \/ 5 \)^401, 401 \( 1 - \( 3 \/ 5 \)^2 \)) < q^(- 1) . $ <comp:logarithm>]

The same series at $z = 1 \/ 3$ encloses $log 2$, used to restore the extracted power.
  All summation errors are already enclosed by outward arithmetic; the displayed remainder is added separately.
  Similarly, use

#[#set math.equation(numbering: n => "(7.2)")
 $ pi = 16 arctan \( 1 \/ 5 \) - 4 arctan \( 1 \/ 239 \) \, wide arctan \( 1 \/ v \) =
   sum_(j = 0)^149 frac(\( - 1 \)^j v^(- 2 j - 1), 2 j + 1) + cal(R)_v . $ <comp:pi>]

The alternating-series bound gives $\| cal(R)_v \| lt.eq v^(- 301) \/ 301 < q^(- 1)$ for both values of $v$.
  Adding $\[ - 2 q^(- 1) \, 2 q^(- 1) \]$ to each arctangent enclosure before the linear combination is
  sufficient. These procedures also enclose $p \, R_0 \, x_0 \, l$ using their exact defining formulas.

To bound derivatives we use interval jets

$ \( F_0 \, F_1 \, F_2 \, F_3 \) \, wide F_j supset.eq F^(\( j \)) \( t \) \/ j ! . $

Addition, multiplication, inversion, logarithms, and square roots are performed as formal power series through
  degree three. For example, the product coefficient is $sum_(r = 0)^j F_r G_(j - r)$,
  and the inverse coefficients follow recursively from the product being one.
  A variable on a radial interval $T$ is represented by $\( T \, 1 \, 0 \, 0 \)$;
  the resulting coefficients enclose its derivatives at every point of $T$ on the chosen spline piece.
  At a single point, the leading interval encloses that point and the same derivative entries are used.
  After differentiation only the coefficients supported by the available derivative orders are used.
  The calculation below never requires a fourth derivative of a spline:
  third derivatives of $B \, D_i$ suffice for the second derivatives of $f_0 \, e$ and for the radial quadrature errors.

For a differential equation $Y' = F \( t \, Y \)$ with an enclosed value at the evaluation point,
  its jet coefficients are reconstructed in increasing order by

#[#set math.equation(numbering: n => "(7.3)")
 $ Y_(j + 1) = frac(\[ F \( t \, Y \) \]_j, j + 1) \, wide 0 lt.eq j lt.eq 2 . $ <comp:jet-ode>]

Thus the enclosed value and the known differential equation supply the derivatives without numerical differentiation.

Spline polynomials are evaluated by interval Horner arithmetic.
  One may first translate a polynomial $P \( t \) = sum_(ell = 0)^N a_ell
  t^ell$ to the midpoint $m$ of its leading interval:

#[#set math.equation(numbering: n => "(7.4)")
 $ P \( m + h \) = sum_(j = 0)^N (sum_(ell = j)^N binom(ell, j) a_ell m^(ell - j)) h^j . $ <comp:polynomial-shift>]

This is an exact polynomial identity, also for jets. It reduces interval widths without changing the spline or
  introducing an approximation; direct Horner evaluation remains a valid enclosure.

=== 7.2 Coefficients and the radial table <comp:radial-table>

Retain the auxiliary mode $0$ and modes $1 lt.eq m lt.eq 38$.
  The two modes with exponent six remain separate in sums involving $D_i$.
  Enclose each $c_m$ by summing over $\| n \| \, \| r \| lt.eq D$, where $D = 256$ for $m = 1$ and $D =
  48$ otherwise, and then adding the symmetric error in (6.1), multiplied by $a^(- k_m) \/ k_m$.
  The summands can be evaluated using only integers before that last factor:
  if $k = k_m$, $A = 2 n + r$, and $N = n^2 + n r + r^2$, then

#[#set math.equation(numbering: n => "(7.5)")
 $ "Re" \( n + r \/ 2 + i sqrt(3) r \/ 2 \)^(- k) =
   frac(sum_(j = 0)^(k \/ 2) \( - 1 \)^j binom(k, 2 j) A^(k - 2 j) \( 3 r^2 \)^j, 2^k N^k) .
   $ <comp:coefficient-summand>]

The pair $\( 0 \, 0 \)$ is omitted. The resulting enclosure also tests $\| c_1 \| < 1$.

The radial breakpoints are

#[#set math.equation(numbering: n => "(7.6)")
 $ b \, quad p - .06 \, quad p \, quad R_0 \, quad R_0 + .001 \, quad R_0 + .075 \, quad l =
   R_0 + .076 . $ <comp:breakpoints>]

Each intervening interval is subdivided by affine interpolation between its exact endpoints.
  For the first interval use $n = floor.l 8000 \( u - v \) floor.r + 1$ subintervals,
  and for all later intervals use $n = floor.l 24000 \( u - v \) floor.r + 1$, where $v \, u$ are its endpoints.
  In execution an outward upper bound on the product is used to choose $n$, which can only add subdivisions.
  All true node positions are enclosed by the corresponding interval arithmetic.
  The length of every actual subinterval is bounded above in the calculation;
  these upper bounds are used in all error estimates.

For the fixed table, write $\[ u_i \/ q \, v_i \/ q \]$ for the valid outward enclosure of its $i$th node,
  $0 lt.eq i lt.eq m$. The interval constructor enforces $u_i lt.eq v_i$,
  and the node arithmetic preserves this invariant. After appending the last node and before propagating any
  integral state, the program requires

#[#set math.equation(numbering: n => "(7.7)")
 $ v_i < u_(i + 1) wide \( 0 lt.eq i < m \) \; $ <comp:node-separation>]

it throws an exception if a comparison fails. Thus, on a completed table construction, $u_i lt.eq
  v_i < u_(i + 1) lt.eq v_(i + 1)$. Both endpoint arrays are strictly increasing, and the stored step interval is

$ H_i = \[ \( u_(i + 1) - v_i \) \/ q \, \( v_(i + 1) - u_i \) \/ q \] $

with positive lower endpoint. This also justifies every division by $H_i$ below.
  These facts concern the initialized table and its unchanged aligned node, point,
  and cell arrays in the fixed calculation.

On $0 < t lt.eq p - .06$, the truncated functions have the monomial form

$ tilde(B) \( t \) = - log t + pi t^2 \/ 2 + sum_(m = 1)^38 a_m t^(k_m) \, wide tilde(B)_1 \( t \) = pi t +
  sum_(m = 1)^38 k_m a_m t^(k_m - 1) \, wide a_m = \( - 1 \)^m c_m . $

For compact formulas introduce the finite list

$ \( e_0 \, v_0 \) = \( 2 \, pi \) \, wide \( e_m \, v_m \) = \( k_m \, k_m a_m \) quad \( 1 lt.eq m lt.eq 38 \) . $

This list indexes monomials of $tilde(B)_1$, rather than the sector modes; its exponent $e_0 =
  2$ is unrelated to $k_0 = 6$. The starting integrals, including their derivatives,
  are obtained from the exact identities

#[#set math.equation(numbering: n => "(7.8)")
 $ tilde(S)_1 \( t \) & = t^2 / 2 (1 / 2 - log t) + pi / 8 t^4 + sum_(m = 1)^38 frac(a_m t^(k_m + 2), k_m + 2) \,\
tilde(S)_2 \( t \) & = - 2 sum_(i = 0)^38 frac(v_i t^(e_i), e_i) +
  sum_(i \, j = 0)^38 frac(v_i v_j t^(e_i + e_j), e_i + e_j) \,\
tilde(H)_k \( t \) & = sum_(i = 0)^38 frac(v_i t^(e_i), e_i + k) . $ <comp:initial-integrals>]

In particular, the table starts propagation at the exact node $p - .06$ with these values;
  preceding nodes and cells use (7.8) directly.

There is a useful exact simplification for the sector functions on this first interval.
  Since $b_m \( t \) = 0$, $D_m \( t \) = - a_m t^(k_m)$ and $D_0 \( t \) = 0$,
  substitution in (5.9) cancels every nonconstant mode and gives $H \( r \, phi \) = gamma \( r \)$ for $r lt.eq
  t$. Equivalently, every $Q_i$ vanishes. Direct radial integration gives

#[#set math.equation(numbering: n => "(7.9)")
 $ f_0 \( t \) = \( pi t^2 - 1 / 2 \) log t - frac(3 pi^2 t^4, 8) \, wide e \( t \) = 0 \, wide 0 < t lt.eq
   p - .06 . $ <comp:inner-exact>]

Indeed,

$ integral_0^t gamma \( r \) r thin upright(d) r = - t^2 / 2 log t + t^2 / 4 + frac(pi t^4, 8) \, wide
  integral_0^t zws^(upright("ren")) gamma' \( r \)^2 r thin upright(d) r = log t - pi t^2 + frac(pi^2 t^4, 4) . $

Combining these with the source and energy factors in the sector formula proves (7.9).
  The identity holds for the full infinite series as well as for every finite truncation.
  It may therefore replace the mode sums when evaluating $f_0 \,
  e$ and their first two derivatives on the first interval, producing tighter enclosures.
  The full finite-mode values (7.8) at $p - .06$ are still required to start the continuation of $S_1 \, S_2 \, H_k$.

For a subsequent radial step $\[ v \, u \]$, propagate the integrals by

#[#set math.equation(numbering: n => "(7.10)")
 $ tilde(S)_1 \( u \) & = tilde(S)_1 \( v \) + integral_v^u r tilde(B) \( r \) thin upright(d) r \,\
tilde(S)_2 \( u \) & = tilde(S)_2 \( v \) + integral_v^u #scale(x: 120%, y: 120%)[\(] - 2 tilde(B)_1 \( r \) +
  r tilde(B)_1 \( r \)^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) r \,\
tilde(H)_k \( u \) & = \( v \/ u \)^k tilde(H)_k \( v \) +
  integral_v^u \( r \/ u \)^k tilde(B)_1 \( r \) thin upright(d) r . $ <comp:propagation>]

For each integrand $Y$, the midpoint rule has the rigorous enclosure

#[#set math.equation(numbering: n => "(7.11)")
 $ integral_v^u Y \( r \) thin upright(d) r in \( u - v \) Y \( \( v + u \) \/ 2 \) +
   [- frac(\( u - v \)^3, 24) sup_(\[ v \, u \]) \| Y'' \| \, frac(\( u - v \)^3, 24) sup_(\[ v \, u \]) \|
   Y'' \|] . $ <comp:midpoint>]

Midpoint values use point jets; second-derivative bounds use a jet whose leading interval contains $\[ v \, u \]$.
  The formula applies to weak second derivatives bounded almost everywhere as well.

For values inside a step, use the integral equations rather than the midpoint approximation.
  If $T = \[ v \, u \]$ and $h = u - v$, then

#[#set math.equation(numbering: n => "(7.12)")
 $ tilde(S)_j \( T \) & subset.eq tilde(S)_j \( v \) + \[ 0 \, h \] thin "range"_T Y_j \, wide j = 1 \, 2 \,\
tilde(H)_k \( T \) & subset.eq \( v \/ T \)^k
  tilde(H)_k \( v \) + \[ - h parallel tilde(B)_1 parallel_(0 \, T) \, h parallel tilde(B)_1 parallel_(0 \,
  T) \] \, $ <comp:cell-integrals>]

where $Y_1 = r tilde(B)$ and $Y_2 = - 2 tilde(B)_1 + r tilde(B)_1^2$.
  For the last inclusion, $\( r \/ t \)^k lt.eq 1$ whenever $v lt.eq r lt.eq t lt.eq u$.
  Recover the positive jet orders from

#[#set math.equation(numbering: n => "(7.13)")
 $ tilde(S)'_1 = t tilde(B) \, wide tilde(S)'_2 = - 2 tilde(B)_1 + t tilde(B)_1^2 \, wide tilde(H)'_k =
   tilde(B)_1 - k tilde(H)_k \/ t . $ <comp:radial-odes>]

Substitution into (5.11) produces both node enclosures and cell enclosures of the ordered six-tuple

#[#set math.equation(numbering: n => "(7.14)")
 $ \( tilde(f)_0 \, tilde(f)'_0 \, tilde(f)''_0 \, tilde(e) \, tilde(e)' \, tilde(e)'' \) . $ <comp:table-tuple>]

No numerical differentiation of table values is used.

Separately, subdivide each interval in (7.6) into steps of length at most $.00022$.
  Direct interval jets for $tilde(B)_1$ and $tilde(D)_i$ test the two finite-core inequalities (6.5).
  Together with $\| c_1 \| < 1$, these are the finite premises of the truncation analysis;
  their verification does not use any infinite-mode error bound. Only after these tests pass is (6.10) invoked.

The spline data are $C^2$ and have bounded one-sided third derivatives.
  Accordingly $f_0 \, e$ are $C^1$ with locally bounded weak second derivatives on $\( b \, oo \)$.
  A radial cell uses its own spline formula at its endpoints;
  either one-sided second derivative is valid for its interior.
  When a query meets a knot, the hull includes both adjacent cells.
  Thus no jump of a second derivative is mistaken for global classical differentiability.

=== 7.3 Queries for the infinite-mode functions <comp:lookup>

Let $epsilon.alt = \[ - 10^(- 11) \, 10^(- 11) \]$, and let $T$ be a valid outward enclosure of the queried true
  radii. In the fixed production calls every such radius is at least $b$, although $T$ may extend below $b$.
  For derivatives, take the componentwise hull of (7.14) over every radial cell meeting $T$ and add $epsilon.alt$
  to each component. By (6.10), this encloses the full infinite-mode tuple
  $\( f_0 \, f'_0 \, f''_0 \, e \, e' \, e'' \)$ at every queried true radius in $T ∩ \[ b \, l \]$.
  The exact continuation below covers queried true radii at least $l$.
  Here is the cell-selection argument for the implementation.
  In integer endpoint units write the valid query as $\[ a \, b' \]$, let $j$ be the first index with $v_j gt.eq
  a$, and let $k$ be the first index with $u_k > b'$, using $m + 1$ if either index is absent.
  The closed envelope of cell $i$ is $\[ u_i \, v_(i + 1) \]$.
  It meets $\[ a \, b' \]$ exactly when $v_(i + 1) gt.eq a$ and $u_i lt.eq b'$.
  By the ordering proved above, these conditions are equivalent to $i gt.eq j - 1$ and $i < k$.
  Therefore the binary searches on the upper and lower endpoint arrays select exactly

$ upright("im") = max \( 0 \, j - 1 \) lt.eq i < min \( m \, k \) = upright("ix") . $

The non-strict intersection inequalities include both cells at a shared endpoint.
  Every true cell meeting the query lies in its envelope and is therefore selected;
  any extra cells only widen the hull. This is a statement about the fixed initialized table,
  not a general-purpose lookup interface.

For a query requiring values alone, improve the enclosure by linear interpolation of the endpoint values.
  On a radial cell $\[ v \, u \]$ put

$ X = \[ 0 \, 1 \] ∩ frac(T - v, u - v) \, wide L_Y \( T \) = Y \( v \) +
  X #scale(x: 120%, y: 120%)[\(] Y \( u \) - Y \( v \) #scale(x: 120%, y: 120%)[\)] \, quad Y = tilde(f)_0 \,
  tilde(e) . $

An empty intersection is discarded. The interpolation error is

#[#set math.equation(numbering: n => "(7.15)")
 $ \| Y \( t \) - L_Y \( t \) \| lt.eq frac(\( u - v \)^2, 8) sup_(\[ v \, u \]) \| Y'' \| .
   $ <comp:radial-interpolation>]

The cell enclosure supplies the derivative bound. Add this symmetric error and $epsilon.alt$,
  then take the hull over all relevant cells. Shared coefficient uncertainties need not be independent:
  interval operations enclose all their possible values and hence also their correlated exact values.
  In particular, the positive stored interval $H_i$ contains the true step $u - v$,
  so outward evaluation of the quotient defining $X$ contains the normalized coordinate of every true queried
  point in that cell. Intersecting with $\[ 0 \, 1 \]$ cannot discard such a point.

Queries that meet $\[ l \, oo \)$ also include the exact continuation (6.11).
  Enclose its two constants by the last node value plus $epsilon.alt$ and by

#[#set math.equation(numbering: n => "(7.16)")
 $ B \( l \) in - log R_0 + pi R_0^2 \/ 2 + sum_(m = 1)^38 V_m \( R_0 \) + epsilon.alt . $ <comp:constant-B>]

Thus the continuation contributes the tuple

#[#set math.equation(numbering: n => "(7.17)")
 $ #scale(x: 120%, y: 120%)[\(] f_0 \( l \) - pi B \( l \) \( T^2 - l^2 \) \, thin - 2 pi B \( l \) T \, thin -
   2 pi B \( l \) \, thin 0 \, 0 \, 0 #scale(x: 120%, y: 120%)[\)] . $ <comp:tail-tuple>]

Using the entire query interval in this expression is conservative even if it extends below $l$,
  since the relevant exterior subset is contained in it. This rule propagates the constant uncertainties through
  the exact formula and asserts no radius-independent error on the unbounded tail.

=== 7.4 Enclosing the calibrated constants <comp:constants>

We evaluate the exact integrals defining $lambda$ in (5.16). Put $s_0 = .01$ and $t \( s \) = sqrt(p^2 + s^2)$.
  Taylor’s formula at $p$ removes the apparent division by zero in the first integral. Specifically,

#[#set math.equation(numbering: n => "(7.18)")
 $ integral_0^(s_0) p frac(f_0 \( t \( s \) \) - f_0 \( p \), s^2) thin upright(d) s in  & f'_0 \( p \)
   (s_0 / 2 - frac(s_0^3, 24 p^2) + [0 \, frac(s_0^5, 80 p^4)])\
 & + s_0^3 / 6 [frac(p, \( sqrt(p^2 + s_0^2) + p \)^2) \, frac(1, 4 p)] "range"_(\[ p \, t \( s_0 \) \]) f''_0 .
   $ <comp:lambda-origin>]

Indeed, $t - p = s^2 \/ \( t + p \)$, while

$ frac(p, t + p) = 1 / 2 - frac(s^2, 8 p^2) + [0 \, frac(s^4, 16 p^4)] . $

The quadratic Taylor remainder of $f_0$ supplies the second line of (7.18).
  The derivative range comes from the radial cells with the infinite-mode error added.

The implementation obtains this range by a direct cell scan over $\[ p \, t \( s_0 \) \]$,
  and obtains the derivative bounds below by a second direct scan over $\[ p \, R_0 \]$.
  Both use the same closed-cell selection rule, with outward endpoint bounds,
  but neither adds the exterior formula. This is sufficient here:
  $p^4 = 1 \/ 12$ gives $p > 1 \/ 2 > b$, $x_0 = R_0 \/ 2 > s_0$, and

$ t \( x_0 \) = sqrt(p^2 + \( R_0 \/ 2 \)^2) = R_0 < l . $

Hence both true scan domains are contained in the finite table $\[ b \, l \]$.
  A nonempty scan alone would not justify a query extending beyond that table.

On $\[ s_0 \, x_0 \]$ integrate $p \( f_0 \( t \( s \) \) - f_0 \( p \) \) \/
  s^2$ by a midpoint sum with $45000$ equal steps. Integrate $e \( t \( s \) \) \/
  p$ on $\[ 0 \, x_0 \]$ by a separate midpoint sum with $45000$ equal steps. Obtain integer upper bounds

$ C gt.eq sup_(\[ p \, R_0 \]) \| f'_0 \| \, quad C' gt.eq sup_(\[ p \, R_0 \]) \| f''_0 \| \, quad E gt.eq
  sup_(\[ p \, R_0 \]) \| e' \| \, quad E' gt.eq sup_(\[ p \, R_0 \]) \| e'' \| $

from the cell enclosures plus $epsilon.alt$. The two integrands have second derivatives bounded respectively by

#[#set math.equation(numbering: n => "(7.19)")
 $ C' / p + frac(8 C, s_0^2) \, wide E' / p + E / p^2 . $ <comp:lambda-derivatives>]

For the first bound, set $V = f_0 \( t \( s \) \) - f_0 \( p \)$; then

$ \| V \| lt.eq C s^2 \/ \( 2 p \) \, wide V'' = f''_0 \( t \) \( s \/ t \)^2 + f'_0 \( t \) p^2 \/ t^3 \, $

and differentiate $p V \/ s^2$ twice. The resulting terms are $p \( V'' \/ s^2 - 4 V' \/ s^3 + 6 V \/ s^4 \)$,
  bounded by the first expression in (7.19). The second follows by twice differentiating $e \( t \( s \) \) \/ p$.
  For an interval of length $L$ and equal step length $h$, add the symmetric error $L h^2 sup \| Y'' \| \/
  24$ to each complete midpoint sum. Together with (7.18), the endpoint terms and the factors in (5.16),
  this encloses $lambda$. The same formula then encloses $mu$.

To enclose $K = 2 integral_0^(x_0) G \( p \, s \) thin upright(d) s$,
  choose an integer $n$ and equal steps of length $h = x_0 \/ n lt.eq .0001$, and use their midpoint sum.
  Independently enclose $G_(s s) \( p \, s \)$ on a partition with step length at most $.0002$.
  If $h$ is the midpoint step length and $L_K$ bounds this second derivative, the enclosure is

#[#set math.equation(numbering: n => "(7.20)")
 $ K in 2 (sum_j h G \( p \, s_j \) + \[ - x_0 h^2 L_K \/ 24 \, x_0 h^2 L_K \/ 24 \]) . $ <comp:K-quadrature>]

The factor two multiplies both the sum and its error.

The first sign tests are

#[#set math.equation(numbering: n => "(7.21)")
 $ - 6.731 < lambda < - 6.729 \, wide K < 0 \,\
f_0 \( l \) - lambda l^2 \/ 2 - mu > 0 \, wide - pi B \( l \) - lambda \/ 2 > 0 . $ <comp:tail-signs>]

Each strict inequality is accepted only when the corresponding interval endpoint proves it.
  The bound on $lambda$ also serves as a check on the normalization. The last two signs and (6.11) give

#[#set math.equation(numbering: n => "(7.22)")
 $ f \( t \) = f \( l \) + #scale(x: 120%, y: 120%)[\(] - pi B \( l \) -
   lambda \/ 2 #scale(x: 120%, y: 120%)[\)] \( t^2 - l^2 \) > 0 \, wide G \( d \, s \) > 0 quad upright("if ") t =
   sqrt(d^2 + s^2) gt.eq l . $ <comp:positive-tail>]

Here $e \( t \) = 0$ and $d \/ t^2 > 0$.

=== 7.5 The compact rectangle and its derivative bounds <comp:rectangle>

Because $l < .697$ and $sqrt(b^2 + .65^2) > l$, the signs (7.22) reduce the remaining work to

#[#set math.equation(numbering: n => "(7.23)")
 $ cal(D) = \[ b \, .697 \] times \[ 0 \, .65 \] . $ <comp:domain>]

For $d gt.eq .697$, $G \( d \, s \) > 0$ for every $s gt.eq 0$ and $g_d \( x \) gt.eq 0$.
  For $d gt.eq b$ and $x gt.eq .65$, the primitive is increasing in $x$.
  The negative part of $G$ vanishes for $s gt.eq .65$.

We obtain derivatives of $G$ by differentiating its defining formula, using the full radial query enclosures.
  The following identities specify all needed factors. Put

$ t = sqrt(d^2 + s^2) \, quad A = d \/ t^2 \, quad Z = - s^2 \/ \( d t^2 \) = A - 1 \/ d \, quad r_d = d \/ t \,
  quad r_s = s \/ t \, $

and write $f' = f'_0 - lambda t$, $f'' = f''_0 - lambda$. Then

#[#set math.equation(numbering: n => "(7.24)")
 $ A_d & = \( 1 - 2 d^2 \/ t^2 \) \/ t^2 \, & Z_d & = A_d + 1 \/ d^2 \,\
A_s & = - 2 d s \/ t^4 \, & Z_s & = A_s \,\
A_(d d) & = 2 d \( d^2 - 3 s^2 \) \/ t^6 \, & Z_(d d) & = A_(d d) - 2 \/ d^3 \,\
A_(s s) & = - 2 d \/ t^4 + 8 d s^2 \/ t^6 \, & Z_(s s) & = A_(s s) . $ <comp:rational-derivatives>]

For $v = d$ or $v = s$ let $r_v$ have the meaning above. The derivative formulas are

#[#set math.equation(numbering: n => "(7.25)")
 $ G_v =  & A_v f + A f' r_v + Z_v e + Z e' r_v \,\
G_(v v) =  & A_(v v) f + 2 A_v f' r_v + A #scale(x: 120%, y: 120%)[\(] f'' r_v^2 +
  f' \( 1 - r_v^2 \) \/ t #scale(x: 120%, y: 120%)[\)]\
 & + Z_(v v) e + 2 Z_v e' r_v + Z #scale(x: 120%, y: 120%)[\(] e'' r_v^2 +
   e' \( 1 - r_v^2 \) \/ t #scale(x: 120%, y: 120%)[\)] . $ <comp:G-derivatives>]

These formulas hold on each smooth piece and almost everywhere across the radial knots.
  No mixed second derivative of $G$ is needed.

Partition both sides of (7.23) into intervals of length at most $.0008$.
  Interval substitution in (7.25) on every closed rectangle supplies global upper bounds

#[#set math.equation(numbering: n => "(7.26)")
 $ L_1 gt.eq parallel G_d parallel_(oo \, cal(D)) \, quad L_2 gt.eq parallel G_s parallel_(oo \, cal(D)) \, quad
   L_3 gt.eq parallel G_(d d) parallel_(oo \, cal(D)) \, quad L_4 gt.eq
   parallel G_(s s) parallel_(oo \, cal(D)) . $ <comp:global-derivative-bounds>]

The value-only interpolation is not used to obtain these derivative bounds.

=== 7.6 The primitive away from its stationary point <comp:outer-grid>

Let

#[#set math.equation(numbering: n => "(7.27)")
 $ cal(D)_0 = \[ .52528 \, .54930 \] times \[ .29420 \, .32621 \] . $ <comp:inner-domain>]

Its interior contains $\( p \, x_0 \)$. To verify the primitive bound on the complement,
  partition the $d$ interval at the two vertical sides of $cal(D)_0$,
  and partition the $s$ interval at its two horizontal sides. Subdivide these pieces into steps with maximal lengths

$ D_h lt.eq .00019 \, wide S_h lt.eq .00018 . $

Every cell therefore lies either in $cal(D)_0$ or outside its interior.
  For each $d$ node, form successive midpoint sums from $0$ to every $x$ node, using the actual step lengths:

$ Q \( d \, x \) = sum_(\[ s_j \, s_(j + 1) \] subset.eq \[ 0 \, x \]) \( s_(j + 1) - s_j \) G
  (d \, frac(s_j + s_(j + 1), 2)) . $

The sum at $x = 0$ is zero and is tested as well. The value queries in Section 7.3 may be used here.
  At every node outside the interior of $cal(D)_0$, enclose $2 Q \( d \, x \) -
  K$ and let $m_(*)$ be a lower bound for all these enclosures.

The quadrature error at grid nodes is bounded by $E_0$, and the additional interpolation error between nodes by
  $E_I$, where

#[#set math.equation(numbering: n => "(7.28)")
 $ E_0 = frac(2 \( .65 \) S_h^2 L_4, 24) \, wide E_I =
   frac(2 #scale(x: 120%, y: 120%)[\(] D_h^2 \( .65 \) L_3 + S_h^2 L_2 #scale(x: 120%, y: 120%)[\)], 8) \,
   $ <comp:outer-errors>]

Indeed, the bilinear interpolation estimate follows from

$ partial_d^2 \( 2 g_d \( x \) - K \) = 2 integral_0^x G_(d d) \( d \, s \) thin upright(d) s \, wide
  partial_x^2 \( 2 g_d \( x \) - K \) = 2 G_s \( d \, x \) . $

Apply the one-dimensional interpolation error in each variable successively;
  the resulting bounds add and require no mixed derivative. Thus the finite assertion

#[#set math.equation(numbering: n => "(7.29)")
 $ m_(*) - E_0 - E_I > 0 $ <comp:outer-assertion>]

proves $2 g_d \( x \) > K$ throughout $cal(D) \\ "int" cal(D)_0$.
  All the derivative estimates are weak derivative estimates,
  so the same conclusion holds when a quadrature segment or rectangle crosses a radial knot.

=== 7.7 The negative part on the whole rectangle <comp:negative-part>

At every $d$ node, including those between the vertical sides of $cal(D)_0$, use the same $s$ partition to enclose

$ N \( d \) = sum_j \( s_(j + 1) - s_j \) max {0 \, - G (d \, frac(s_j + s_(j + 1), 2))} . $

Let $N_(*)$ be an upper bound for all these sums. The function $y mapsto max { 0 \, - y }$ is $1$-Lipschitz.
  On a subinterval of length $h$, its midpoint error is therefore at most $L_2 h^2 \/ 4$:
  integrate $L_2 \| s - s_(upright("mid")) \|$. Summing the errors gives at most $.65 S_h L_2 \/ 4$.
  Every $d$ lies within $D_h \/ 2$ of a node; changing $d$ to that node changes the integral by at most $.65 D_h
  L_1 \/ 2$. Consequently the assertion

#[#set math.equation(numbering: n => "(7.30)")
 $ N_(*) + K + .65 (frac(S_h L_2, 4) + frac(D_h L_1, 2)) < 0 $ <comp:negative-assertion>]

proves

$ integral_0^.65 max { 0 \, - G \( d \, s \) } thin upright(d) s < - K wide \( b lt.eq d lt.eq .697 \) . $

Together with (7.22), this gives the entire negative-part inequality in (5.18).

=== 7.8 Convexity in the stationary rectangle <comp:hessian>

It remains to prove the primitive inequality on $cal(D)_0$.
  Partition its $d$ interval into steps of length at most $.00004$.
  Partition $\[ 0 \, .32621 \]$ into steps of length at most $.00008$, including $.29420$ as a node.
  The accumulation in $s$ must begin at zero even though the Hessian is tested only above $.29420$.

For a $d$ interval $D$ and an $s$ interval $S_j$, use the full derivative queries to enclose

$ F_1 \( D \, S_j \) supset.eq G_(d d) \( D \, S_j \) \, quad F_2 \( D \, S_j \) supset.eq G_d \( D \, S_j \) \,
  quad F_3 \( D \, S_j \) supset.eq G_s \( D \, S_j \) . $

For a cell $D times S_j$ meeting $cal(D)_0$, enclosures of the three Hessian entries of $\( d \, x \) mapsto
  g_d \( x \)$ are

#[#set math.equation(numbering: n => "(7.31)")
 $ A_j & = sum_(i < j) \| S_i \| F_1 \( D \, S_i \) + \[ 0 \, \| S_j \| \] F_1 \( D \, S_j \) \,\
B_j & = F_2 \( D \, S_j \) \, wide C_j = F_3 \( D \, S_j \) . $ <comp:hessian-entries>]

The first line is direct interval integration, not midpoint quadrature:
  it bounds both the completed subintervals and the partial final subinterval. Test, on every such cell, that

#[#set math.equation(numbering: n => "(7.32)")
 $ inf A_j > 0 \, wide inf C_j > 0 \, wide inf \( A_j C_j - B_j^2 \) > 0 . $ <comp:hessian-assertions>]

Interval multiplication encloses the determinant even when its factors are correlated.
  These inequalities imply positive definiteness, and in particular positive semidefiniteness,
  of the Hessian almost everywhere on $cal(D)_0$.

The function $\( d \, x \) mapsto g_d \( x \)$ belongs to $W^(2 \, oo)$ on a neighbourhood of this rectangle.
  To justify the passage from Hessian bounds to convexity, mollify on each smaller interior rectangle:
  the mollified Hessian is positive semidefinite, so the mollified functions are convex.
  Local uniform convergence proves convexity in the interior, and continuity includes the boundary.
  By Lemma 16, $\( p \, x_0 \)$ is an interior stationary point. Hence

#[#set math.equation(numbering: n => "(7.33)")
 $ 2 g_d \( x \) gt.eq 2 g_p \( x_0 \) = K wide \( \( d \, x \) in cal(D)_0 \) . $ <comp:inner-conclusion>]

This step uses the exact stationary point and does not infer convexity or stationarity from sampled function values.

=== 7.9 Finite assertions and the scalar conclusion <comp:conclusion>

For clarity, the finite procedure has the following fixed parameters and obligations.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Parameter or required assertion
]),
  table.cell(rowspan: 1, colspan: 1)[Arithmetic
], table.cell(rowspan: 1, colspan: 1)[Denominator $2^144$, jet order $3$
],
  table.cell(rowspan: 1, colspan: 1)[Retained modes
], table.cell(rowspan: 1, colspan: 1)[$i = 0 \, 1 \, dots.h \, 38$
],
  table.cell(rowspan: 1, colspan: 1)[Coefficient squares
], table.cell(rowspan: 1, colspan: 1)[$D = 256$ for $m = 1$, $D = 48$ otherwise
],
  table.cell(rowspan: 1, colspan: 1)[Core mesh
], table.cell(rowspan: 1, colspan: 1)[At most $.00022$ on each spline interval
],
  table.cell(rowspan: 1, colspan: 1)[Core assertions
], table.cell(rowspan: 1, colspan: 1)[$\| c_1 \| < 1$ and (6.5)
],
  table.cell(rowspan: 1, colspan: 1)[Radial table
], table.cell(rowspan: 1, colspan: 1)[Densities $8000$ and $24000$ as specified above
],
  table.cell(rowspan: 1, colspan: 1)[Radial node ordering
], table.cell(rowspan: 1, colspan: 1)[Strict separation (7.7) at every adjacent pair
],
  table.cell(rowspan: 1, colspan: 1)[$lambda$ integrals
], table.cell(rowspan: 1, colspan: 1)[$45000$ midpoint steps each; $s_0 = .01$
],
  table.cell(rowspan: 1, colspan: 1)[$K$ integral
], table.cell(rowspan: 1, colspan: 1)[Steps at most $.0001$; derivative mesh $.0002$
],
  table.cell(rowspan: 1, colspan: 1)[Exterior signs
], table.cell(rowspan: 1, colspan: 1)[All assertions in (7.21)
],
  table.cell(rowspan: 1, colspan: 1)[Global derivative mesh
], table.cell(rowspan: 1, colspan: 1)[At most $.0008$ in both coordinates
],
  table.cell(rowspan: 1, colspan: 1)[Outer and negative-part mesh
], table.cell(rowspan: 1, colspan: 1)[$D_h lt.eq .00019$, $S_h lt.eq .00018$
],
  table.cell(rowspan: 1, colspan: 1)[Outer and negative-part assertions
], table.cell(rowspan: 1, colspan: 1)[(7.29), (7.30)
],
  table.cell(rowspan: 1, colspan: 1)[Hessian mesh
], table.cell(rowspan: 1, colspan: 1)[$d$ steps $.00004$, $s$ steps $.00008$ or smaller
],
  table.cell(rowspan: 1, colspan: 1)[Hessian assertions
], table.cell(rowspan: 1, colspan: 1)[(7.32) on every cell
],
)
]

#thm([Proposition 7.1.])[
  (Meaning of the finite assertions).  #emph[Apply the outward interval procedure specified in this section to the
    radial data (5.7), retaining modes $0$ through $38$, with the parameters in the table.
    If every listed assertion holds, its enclosures establish the finite-core premise (6.5),
    the exterior positivity (7.22), the primitive bound outside the interior of $cal(D)_0$,
    the negative-part bound for every $d gt.eq b$, and the convexity bound (7.33),
    all for the exact infinite-mode functions.]
] <comp:finite-soundness>

#proof[
  The coefficient sum and its lattice tail enclose each retained coefficient.
    The direct core tests concern only finitely many modes, so they imply the premise needed for (6.10).
    Equations (7.8)–(7.13) and the midpoint bound prove the node and cell table enclosures by induction through
    every radial step. The node-separation guard supplies the positive steps and ordered search arrays used by the
    table and query arguments. The query rules then enclose the exact infinite-mode functions and their first two
    derivatives, including the constant-region continuation.
  The origin expansion and midpoint errors prove the enclosures of $lambda \, mu \, K$.
    The signs (7.21) imply the positive tail. The derivative bounds,
    quadrature errors and bilinear interpolation prove the outer primitive assertion;
    the Lipschitz estimate proves the negative-part assertion.
    Finally, (7.31) encloses the complete Hessian, whose positivity and exact stationarity give (7.33).
    Every stage uses only enclosures established before that stage. ◻
]

===== 7.9.1 Finite bounds. <finite-bounds.>

The program #raw("certificate.cpp") implements this procedure using #raw("core.hpp") and #raw("grids.hpp").
  All three files and an execution wrapper are included in the #raw("verification") directory.
  One completed guarded run is documented in #raw("verification/README.md"),
  which binds the code and formula hashes, run metadata, saved integer pairs, and their interpretation below.
  The wrapper compiles and runs the computation; it does not read the TeX manuscript.
  The source-to-code and analytic correspondences are separate arguments. The interval denominator is $2^144$.
  The table gives outward-rounded projections, while interval assertions use uncoarsened endpoints.

#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (left, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Recorded projection
]),
  table.cell(rowspan: 1, colspan: 1)[$lambda$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 6.7300312 \, - 6.7300275 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$mu$
], table.cell(rowspan: 1, colspan: 1)[$\[ .4138830 \, .4138838 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$K$
], table.cell(rowspan: 1, colspan: 1)[$\[ - .0034823 \, - .0034809 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$B \( l \)$
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.0464643 \, 1.0464644 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$f_0 \( l \)$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 1.2135966 \, - 1.2135965 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$f \( l \)$
], table.cell(rowspan: 1, colspan: 1)[$\[ .0044755 \, .0044772 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$- pi B \( l \) - lambda \/ 2$
], table.cell(rowspan: 1, colspan: 1)[$\[ .0774490 \, .0774509 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$m_(*) - E_0 - E_I$
], table.cell(rowspan: 1, colspan: 1)[$gt.eq .0000120$
],
  table.cell(rowspan: 1, colspan: 1)[Negative-part left side of (7.30)
], table.cell(rowspan: 1, colspan: 1)[$lt.eq - .0004585$
],
  table.cell(rowspan: 1, colspan: 1)[$g_(d d)$ on $cal(D)_0$
], table.cell(rowspan: 1, colspan: 1)[$gt.eq 1.0529222$
],
  table.cell(rowspan: 1, colspan: 1)[$g_(x x)$ on $cal(D)_0$
], table.cell(rowspan: 1, colspan: 1)[$gt.eq .0128335$
],
  table.cell(rowspan: 1, colspan: 1)[$det nabla^2 g$ on $cal(D)_0$
], table.cell(rowspan: 1, colspan: 1)[$gt.eq .0086252$
],
)
]

Here the determinant is enclosed on each individual rectangle before the bounds are combined;
  it is not computed from separately combined entry ranges.
  The global derivative bounds, rounded outwards for display, are

$ L_1 lt.eq 7.4636170 \, wide L_2 lt.eq 2.5091315 \, wide L_3 lt.eq 143.7890461 \, wide L_4 lt.eq 315.1489689 . $

These derivative numbers are projections of the computed hulls, not separate executable threshold assertions.
  For the identified sources, under the documented runtime assumptions,
  the completed run verifies the listed finite assertions using uncoarsened interval endpoints.
  Proposition 19 explains why these assertions imply the required bounds for the exact infinite-mode functions:
  the interval formulas and range-coverage arguments identify the quantities enclosed,
  while the analytic truncation estimates supply the omitted modes.
  Neither the rounded table nor the execution record alone supplies those mathematical correspondences.

#thm([Theorem 7.2.])[
  (Scalar inequalities from the finite verification).  #emph[The exact constants and functions of (5.16) and
    (5.14) satisfy
$ K < 0 \, wide 2 g_d \( x \) gt.eq K quad \( d gt.eq b \, med x gt.eq 0 \) \, wide integral_0^oo max { 0 \, -
  G \( d \, s \) } thin upright(d) s lt.eq - K quad \( d gt.eq b \) . $

]
] <comp:scalar>

#proof[
  The documented finite verification and the correspondences just established supply the hypotheses of
    Proposition 19. The first assertion is part of (7.21). The outer-grid assertion and (7.33) cover all of
    $cal(D)$. For $d in \[ b \, .697 \]$ the positive tail makes the primitive increasing after $x = .65$,
    so the primitive bound extends to every $x gt.eq 0$. For $d gt.eq .697$, $G \( d \, s \) > 0$ for all $s gt.eq
    0$, whence $g_d \( x \) gt.eq 0 > K \/ 2$. The negative-part estimate follows from (7.30) on the rectangle;
    its integrand vanishes outside the rectangle by (7.22). These are exactly (5.18). ◻
]

== 8 The finite-torus and whole-plane bounds <sec:conclusion>

We now apply the geometric comparison to the certified scalar bounds, then pass from square tori to the plane.
  The square-torus conclusion of Proposition 14 already incorporates the separation of minimizers and the passage
  to arbitrary configurations.

#proof[
  The radial data of Section 5 satisfy (4.3)–(4.4) with lower distance $d_0 = b = 28209 \/ 100000$.
    Theorem 20 gives $K < 0$ and both bounds in (5.18). By Lemma 13 at $d_0 =
    b$ and the primitive identity (5.15), these bounds give (4.14) for every sector with $d gt.eq b$,
    including the signed endpoint cases.
  Since $b < 1 \/ \( 2 sqrt(pi) \) = d_(*)$, as follows from $pi < 3.1416$,
    the square-torus conclusion of Proposition 14 applies. For every $n gt.eq
    2$ and every configuration of $n$ distinct points it gives, using the exact triangular calibration (5.17),
  $ cal(W)_n \( h \) gt.eq n \( 6 K + lambda + 2 pi mu \) = n W \( E_triangle.stroked.t \) . $
  No separation hypothesis is imposed on this configuration.
    The same proposition gives the energy penalty $n \| c \|^2 \/
    2$ for a constant harmonic component and preserves the bound under a fixed orthogonal rotation. ◻
]

#proof[
  The periodic triangular field belongs to the admissible class and has finite energy by Lemmas 4 and 6.
    Thus $C = W \( E_triangle.stroked.t \)$ is a finite real number.
    Apply Proposition 7 to Theorem 2 with this $C$. It gives the lower bound for every field in the stated
    admissible class and for each fixed cutoff family (1.1). The triangular field attains the lower bound. ◻
]

The comparison establishes the minimum of this logarithmic renormalized energy.
  It does not classify all configurations having that energy per unit area.
  In particular it supplies no uniqueness or defect-exclusion assertion.

=== 8.1 The spherical logarithmic-energy constant <the-spherical-logarithmic-energy-constant>

#proof[
  Write $cal(A)_m^(upright("BS"))$ and $W_(upright("ball"))$ for the admissible class and ball-cutoff energy of
    Bétermin and Sandier #cite(label("BeterminSandier2018")) Definitions 2.1–2.4.
    Their fields satisfy $"div" E = 2 pi \( nu_Lambda - m \)$ and $"curl" E = 0$,
    with the same charge-growth condition and local puncture functional as here.
    At $m = 1$ the admissible class is our $cal(A)_1$; the local integrability conventions agree by Lemma 4.
    The outer average, however, is over centered balls rather than squares.
  The component rotation $j mapsto F = \( j_2 \, - j_1 \)$ is a bijection from $cal(C)_1$ to
    $cal(A)_(1 \/ \( 2 pi \))^(upright("BS"))$ and preserves the local energy.
    Thus (2.2) identifies $M$ with $min_(cal(A)_(1 \/ \( 2 pi \))^(upright("BS"))) W_(upright("ball"))$.
    The scaling formula #cite(label("BeterminSandier2018")) equation (2.4) gives
  #[#set math.equation(numbering: n => "(8.1)")
   $ min_(cal(A)_1^(upright("BS"))) W_(upright("ball")) = 2 pi (M - 1 / 4 log \( 2 pi \)) .
     $ <eq:bhs-minimum-normalization>]
  Lemma 5 bounds every square-cutoff energy $W \( E \)$ below by the right-hand side.
    Conversely, periodic averaging applied to the scaled square-periodic sequence in the proof of Proposition 7
    shows that its square-cutoff energies converge to that value.
    Theorem 1 therefore identifies it with $W \( E_triangle.stroked.t \)$.
    This uses the common ball and square minimum in (2.2), not equality of those two energies for an arbitrary
    field. Lemma 6 does give equality for the periodic field $E_triangle.stroked.t$,
    so this covolume-one triangular field attains the minimum in (8.1).
    Its value also agrees with the periodic lattice notation in Bétermin and Sandier:
    replacing their gradient $nabla H_Lambda$ by the admissible field $-
    nabla H_Lambda$ leaves the local squared-norm functional unchanged.
  Theorem 1.5 of #cite(label("BeterminSandier2018")) gives the form of (1.6) with $C$ in place of
    $C_(upright("BHS"))$, where
  $ C = 1 / pi min_(cal(A)_1^(upright("BS"))) W_(upright("ball")) + 1 / 2 log pi + log 2 \, $
  and states that $C = C_(upright("BHS"))$ exactly when the density-one triangular lattice attains this minimum.
    Its energy is precisely the ordered-pair sum on the unit sphere in $bb(R)^3$ used here.
    In particular, the $- n \( n - 1 \) log 2$ term in its passage from the radius-$1 \/
    2$ sphere to the unit sphere contributes both $- n^2 log 2$ and $+ n log 2$;
    no further pair-counting or radius factor is needed. The equality clause now gives (1.7) and proves the corollary. ◻
]

== 9 Supplementary coefficient and tail estimates <sec:scientific-support>

The proof uses the coefficient enclosures and omitted-mode estimates in Sections 6 and 7.
  This appendix records an independent integer recurrence for the same finite coefficient sums and alternative
  exact bounds for the same omitted-mode series. These arguments are supplementary:
  they do not add a hypothesis to the scalar theorem or replace the analytic derivative bounds and finite
  retained-mode premises used there.

=== 9.1 An independent recurrence for the lattice coefficients <supp:coefficient-recurrence>

Fix integers $\( n \, q \) eq.not \( 0 \, 0 \)$ and write

$ A = 2 n + q \, wide N = n^2 + n q + q^2 \, wide zeta = A + i sqrt(3) q \, wide w = zeta / 2 . $

Thus $w = n + q \/ 2 + i sqrt(3) q \/ 2$, $N = \| w \|^2 > 0$, and $\| zeta \|^2 = 4 N$.
  A point of the covolume-one triangular lattice is $a w$, where $a = sqrt(2 \/ sqrt(3))$. For $m gt.eq 0$, put

$ r_m \( n \, q \) = "Re" \( zeta^(6 m) \) . $

The two numbers $u = zeta^6$ and $v = overline(zeta)^6$ have

$ u + v = 2 r_1 \, wide u v = \( 4 N \)^6 \, $

and hence satisfy $X^2 - 2 r_1 X + \( 4 N \)^6 = 0$. Multiplying this equation by $u^(m - 1)$ and $v^(m - 1)$,
  respectively, and adding gives the integer recurrence

#[#set math.equation(numbering: n => "(9.1)")
 $ r_0 & = 1 \,\
r_1 & = A^6 - 45 A^4 q^2 + 135 A^2 q^4 - 27 q^6 \,\
r_(m + 1) & = 2 r_1 r_m - \( 4 N \)^6 r_(m - 1) wide \( m gt.eq 1 \) . $ <supp:real-recurrence>]

Here all the quantities on the right are integers. This proves the recurrence for every individual lattice point,
  without a numerical approximation to a complex power.

The binomial theorem identifies its numerator exactly. Since only even powers of $i sqrt(3) q$ have nonzero real part,

#[#set math.equation(numbering: n => "(9.2)")
 $ r_m \( n \, q \) = sum_(j = 0)^(3 m) \( - 1 \)^j binom(6 m, 2 j) A^(6 m - 2 j) \( 3 q^2 \)^j .
   $ <supp:binomial-numerator>]

This is the numerator in (7.5), after writing $q$ for its second integer coordinate.
  Indeed, $w^(- 6 m) = overline(w)^(6 m) \/ N^(6 m)$, and therefore

#[#set math.equation(numbering: n => "(9.3)")
 $ "Re" \( w^(- 6 m) \) = frac(r_m \( n \, q \), 2^(6 m) N^(6 m)) =
   frac(r_m \( n \, q \), \( 64 N^6 \)^m) . $ <supp:reciprocal-power>]

Thus the recurrence and the binomial expression agree for every point and every mode,
  not only for a selected finite list of comparisons.

===== 9.1.1 Grouping by the norm. <grouping-by-the-norm.>

For a positive integer $D$, let

$ cal(Q)_D = { \( n \, q \) in bb(Z)^2 : med \| n \| \, \| q \| lt.eq D \,
  med \( n \, q \) eq.not \( 0 \, 0 \) } \, wide R_(m \, N) \( D \) = sum_(\( n \, q \) in cal(Q)_D\
n^2 + n q + q^2 = N) r_m \( n \, q \) . $

After forming the numerator for each point, one may combine the equal denominators in (9.3):

#[#set math.equation(numbering: n => "(9.4)")
 $ sum_(\( n \, q \) in cal(Q)_D) "Re" \( w^(- 6 m) \) = sum_(N gt.eq 1)
   frac(R_(m \, N) \( D \), \( 64 N^6 \)^m) . $ <supp:norm-grouping>]

Only finitely many positive norms occur. It is important that the recurrence precede this grouping.
  For fixed $D$, summing (9.1) over a norm shell gives

$ R_(m + 1 \, N) \( D \) = 2 sum_(\( n \, q \) in cal(Q)_D\
n^2 + n q + q^2 = N) r_1 \( n \, q \) r_m \( n \, q \) - \( 4 N \)^6 R_(m - 1 \, N) \( D \) . $

In general the first sum cannot be replaced by one value of $r_1$ times $R_(m \, N) \( D \)$.
  For example, $\( 7 \, 0 \)$ and $\( 5 \, 3 \)$ both have $N = 49$,
  but their respective values of $r_1$ are $7 thin 529 thin 536$ and $- 4 thin 912 thin 064$.
  One may apply the recurrence either pointwise or within groups having the same pair $\( N \, r_1 \)$,
  and only then combine all terms of a common norm.

For the finite coefficient enclosures, take $D = 256$ when $m = 1$ and $D = 48$ when $2 lt.eq m lt.eq 38$.
  The omitted dimensionless sum has absolute value at most

$ E_(m \, D) = 8 \( 4 \/ 3 \)^(3 m) frac(D^(2 - 6 m), 6 m - 2) $

by (6.1). The coefficient $c_m$ is consequently enclosed by adding $\[ - E_(m \, D) \, E_(m \, D) \]$ to the
  finite sum in (9.4) and then multiplying by the positive factor $a^(- 6 m) \/ \( 6 m \)$.
  The square and its omitted tail are unchanged by grouping.

===== 9.1.2 Complex pairs and interval containment. <complex-pairs-and-interval-containment.>

The finite calculation may instead keep both real components. Write

$ zeta^6 = r_1 + i sqrt(3) thin s_1 \, wide s_1 = 6 A^5 q - 60 A^3 q^3 + 54 A q^5 . $

The multiplication rule

$ \( x + i sqrt(3) y \) \( x' + i sqrt(3) y' \) = \( x x' - 3 y y' \) + i sqrt(3) \( x y' + y x' \) $

shows that, starting from $\( x_0 \, y_0 \) = \( 1 \, 0 \)$,

$ \( x_(m + 1) \, y_(m + 1) \) = \( x_m r_1 - 3 y_m s_1 \, med x_m s_1 + y_m r_1 \) $

represents $zeta^(6 \( m + 1 \))$ exactly. In particular $x_m = r_m$ and its real component obeys (9.1).
  This is the complex-pair recursion used in the finite calculation, again applied per point before norm grouping.
  The half square $n > 0$, or $n = 0$ and $q > 0$, contains one point of each pair
  $\( n \, q \) \, \( - n \, - q \)$. Because $6 m$ is even, the two real numerators agree,
  which justifies doubling each half-square contribution.

For completeness, grouping also explains an interval containment relation. At fixed denominator $Q = 2^144$, let

$ cal(I)_Q \( x \) = [frac(floor.l Q x floor.r, Q) \, frac(ceil.l Q x ceil.r, Q)] wide \( x in bb(Q) \) . $

For any finite rational list $x_1 \, dots.h \, x_h$, the elementary inequalities

$ ⌊sum_j Q x_j⌋ gt.eq sum_j floor.l Q x_j floor.r \, wide ⌈sum_j Q x_j⌉ lt.eq sum_j ceil.l Q x_j ceil.r $

give

#[#set math.equation(numbering: n => "(9.5)")
 $ cal(I)_Q (sum_j x_j) subset.eq sum_j cal(I)_Q \( x_j \) . $ <supp:interval-grouping>]

Apply this to the exact rationals in each norm shell. Converting the shell sum once and then summing shells is
  contained in the enclosure obtained by converting every point separately.
  Adding the same outward tail interval and multiplying by the same positive scaling enclosure preserve
  containment, because interval addition, multiplication, and outward rounding are monotone under inclusion.
  This statement assumes the same primitive rounding rule, tail enclosure, and scaling enclosure on both sides;
  exact algebra alone does not assert endpoint identity or containment between different choices of those enclosures.

=== 9.2 Alternative exact bounds for the omitted modes <supp:tail-bounds>

For the allowed indices $k = 234 \, 240 \, dots.h$, split the weighted summand $\( k + 1 \)^4
  w_k$ of (6.3) into four positive rationals:

$ t_1 \( k \) & = 10^6 thin 30 \( k + 1 \)^4 k^2 \( 13 \/ 20 \)^k \,\
t_2 \( k \) & = 10^6 \( 3 dot.op 10^6 \) \( k + 1 \)^4 k^3 \( 1 \/ 2 \)^k \,\
t_3 \( k \) & = 10^6 thin 5600 \( k + 1 \)^4 k^5 \( 3 \/ 5 \)^k \,\
t_4 \( k \) & = 10^6 \( 7 dot.op 10^11 \) \( k + 1 \)^4 k^2 \( 289 \/ 500 \)^k . $

Then

$ frak(a) = sum_(j = 0)^oo sum_(i = 1)^4 t_i \( 234 + 6 j \) . $

This is the same $frak(a)$ as in (6.6), distinct from the lattice scale $a$. If

$ \( p_i \, beta_i \) = \( 2 \, 13 \/ 20 \) \, \( 3 \, 1 \/ 2 \) \, \( 5 \, 3 \/ 5 \) \, \( 2 \, 289 \/ 500 \) \, $

in the order $i = 1 \, 2 \, 3 \, 4$, the exact consecutive ratios are

#[#set math.equation(numbering: n => "(9.6)")
 $ rho_i \( k \) = frac(t_i \( k + 6 \), t_i \( k \)) = (frac(k + 7, k + 1))^4 (frac(k + 6, k))^(p_i) beta_i^6 .
   $ <supp:component-ratios>]

Both rational factors decrease for $k > 0$, so each $rho_i \( k \)$ decreases.
  The four initial ratios, with no rounding, are

$ i & rho_i \( 234 \)\
1 & \( 241 \/ 235 \)^4 \( 40 \/ 39 \)^2 \( 13 \/ 20 \)^6\
2 & \( 241 \/ 235 \)^4 \( 40 \/ 39 \)^3 \( 1 \/ 2 \)^6\
3 & \( 241 \/ 235 \)^4 \( 40 \/ 39 \)^5 \( 3 \/ 5 \)^6\
4 & \( 241 \/ 235 \)^4 \( 40 \/ 39 \)^2 \( 289 \/ 500 \)^6 . $

Here is an exact simultaneous check that all four are less than $1 \/ 10$. The integer comparisons

$ 9 dot.op 241^4 = 30 thin 360 thin 623 thin 049 & < 30 thin 498 thin 006 thin 250 = 10 dot.op 235^4 \,\
7 dot.op 40^5 = 716 thin 800 thin 000 & < 721 thin 793 thin 592 = 8 dot.op 39^5 \,\
800 dot.op 13^6 = 3 thin 861 thin 447 thin 200 & < 4 thin 032 thin 000 thin 000 = 63 dot.op 20^6 $

give, since $p_i lt.eq 5$ and $0 < beta_i lt.eq 13 \/ 20$,

#[#set math.equation(numbering: n => "(9.7)")
 $ rho_i \( 234 \) lt.eq \( 241 \/ 235 \)^4 \( 40 \/ 39 \)^5 \( 13 \/ 20 \)^6 < 10 / 9 8 /
   7 \( 13 \/ 20 \)^6 < 1 / 10 quad \( 1 lt.eq i lt.eq 4 \) . $ <supp:initial-ratio-bound>]

===== 9.2.1 Three geometric bounds. <three-geometric-bounds.>

Set $T_0 = sum_(i = 1)^4 t_i \( 234 \)$. One convenient entirely integer form of its exact comparison is obtained
  by putting

$ C_234 =  & 30 dot.op 234^2 dot.op 325^234 + 3 dot.op 10^6 dot.op 234^3 dot.op 250^234\
 & + 5600 dot.op 234^5 dot.op 300^234 + 7 dot.op 10^11 dot.op 234^2 dot.op 289^234 . $

The common denominator $500^234$ gives

$ T_0 = frac(10^6 thin 235^4 C_234, 500^234) \, wide 10^29 235^4 C_234 < 156 dot.op 500^234 . $

The displayed integer inequality is exactly $T_0 < 156 \/ 10^23$. In particular,

#[#set math.equation(numbering: n => "(9.8)")
 $ 10 / 9 T_0 < frac(1560, 9 dot.op 10^23) < 2 / 10^21 \, $ <supp:first-sum-bound>]

where the last comparison reduces to $1560 < 1800$.

Let $rho_max = max_(1 lt.eq i lt.eq 4) rho_i \( 234 \)$, and define three exact rational upper bounds

$ A_(upright("coarse")) = 10 / 9 T_0 \, wide A_(upright("common")) = frac(T_0, 1 - rho_max) \, wide
  A_(upright("component")) = sum_(i = 1)^4 frac(t_i \( 234 \), 1 - rho_i \( 234 \)) . $

Decreasing ratios imply $t_i \( 234 + 6 j \) lt.eq t_i \( 234 \) rho_i \( 234 \)^j$.
  Summing these geometric majorants and using (9.7) proves

#[#set math.equation(numbering: n => "(9.9)")
 $ frak(a) lt.eq A_(upright("component")) lt.eq A_(upright("common")) < A_(upright("coarse")) < 2 /
   10^21 . $ <supp:geometric-bounds>]

The second inequality holds because $1 - rho_i \( 234 \) gt.eq 1 - rho_max > 0$.
  The common-ratio estimate keeps only the largest initial ratio,
  whereas the componentwise estimate retains each one; both refine the coarse factor $10 \/ 9$.

===== 9.2.2 An exact partial sum and a positive remainder bound. <an-exact-partial-sum-and-a-positive-remainder-bound.>

There are exactly $62$ allowed indices from $234$ through $600$, because $600 = 234 + 6 dot.op 61$.
  Define the finite rational sum

#[#set math.equation(numbering: n => "(9.10)")
 $ P_600 = sum_(i = 1)^4 sum_(j = 0)^61 t_i \( 234 + 6 j \) $ <supp:partial-600>]

and the positive rational number

#[#set math.equation(numbering: n => "(9.11)")
 $ R_606 = sum_(i = 1)^4 frac(t_i \( 606 \), 1 - rho_i \( 606 \)) \, wide rho_i \( 606 \) =
   (613 / 607)^4 (102 / 101)^(p_i) beta_i^6 . $ <supp:remainder-606>]

Every numerator is positive and $0 < rho_i \( 606 \) < rho_i \( 234 \) < 1 \/ 10$, so $R_606 > 0$.
  Starting the geometric estimate at the next mode $606$, rather than at the last included mode $600$, gives

#[#set math.equation(numbering: n => "(9.12)")
 $ P_600 < frak(a) lt.eq P_600 + R_606 . $ <supp:partial-tail-bound>]

The first inequality is strict because all subsequent summands are positive.
  The number $R_606$ is an upper bound for the remainder, not an assertion that the remainder equals it.

This refinement is no larger than the componentwise bound. For the $i$-th component put $r = rho_i \( 234 \)$.
  Then $t_i \( 606 \) lt.eq t_i \( 234 \) r^62$ and $rho_i \( 606 \) lt.eq r$,
  while each term of its partial sum is at most $t_i \( 234 \) r^j$. Consequently

$ sum_(j = 0)^61 t_i \( 234 + 6 j \) + frac(t_i \( 606 \), 1 - rho_i \( 606 \)) lt.eq
  t_i \( 234 \) (sum_(j = 0)^61 r^j + frac(r^62, 1 - r)) = frac(t_i \( 234 \), 1 - r) . $

Summing over $i$ places $P_600 + R_606$ below $A_(upright("component"))$ in (9.9).
  These finite bounds are exact rationals; a rounded display that makes $P_600$ and $P_600 +
  R_606$ look equal does not change (9.12).

===== 9.2.3 Rational propagation to the radial errors. <rational-propagation-to-the-radial-errors.>

The refined bounds can be substituted directly into the propagation estimates of Section 6.5.
  They do not replace its analytic mode bounds or the finite premises (6.5):
  the retained second-order $B_1$ norm is still bounded by $6000$,
  and the weighted third-order $D_i$ norm by $2 dot.op 10^6$. Recall also that

#[#set math.equation(numbering: n => "(9.13)")
 $ W_(*) = 4 sum_(k = 234 \, 240 \, dots.h) w_k lt.eq 4 sum_(k = 234 \, 240 \, dots.h) \( k + 1 \)^4 w_k =
   4 frak(a) \, $ <supp:W-bound>]

so replacing $W_(*)$ by $4 frak(a)$ is an upper bound, not an identity.
  Collecting the integral and mode-norm contributions in (6.8) and using $pi < 22 \/
  7$ gives the rational expression, for $A \, W gt.eq 0$,

#[#set math.equation(numbering: n => "(9.14)")
 $ cal(F) \( A \, W \) =  & 2 22 / 7 \( 3 W + 16 A \)\
 & + 1 / 2 #scale(x: 120%, y: 120%)[\(] 60000 W + 8 A + 12 \( 2 dot.op 10^6 \) W + 48 \( 6000 + W \) A\
 & #h(30mm)  + 8 \( 2 dot.op 10^6 \) A + 16 A^2 #scale(x: 120%, y: 120%)[\)] . $ <supp:rational-error-expression>]

The terms are respectively the source integral, the $S_2$ error, the linear $D_i$ error,
  the retained and omitted mixed $D_i H_(k_i)$ errors, and the quadratic $D_i D_j$ error.
  The bound $pi < 22 \/ 7$ and (6.8) give $\| f_0 - tilde(f)_0 \|_(2 \, t) lt.eq cal(F) \( frak(a) \, W_(*) \)$.
  Every coefficient of $cal(F)$ is nonnegative. Thus any one of the rational upper bounds $A$ above,
  for which $frak(a) lt.eq A$, satisfies

$ \| f_0 - tilde(f)_0 \|_(2 \, t) lt.eq cal(F) \( frak(a) \, W_(*) \) lt.eq cal(F) \( A \, 4 A \) . $

Direct collection of the rational terms gives the exact identity

#[#set math.equation(numbering: n => "(9.15)")
 $ cal(F) \( A \, 4 A \) = A #scale(x: 120%, y: 120%)[\(] 56 thin 264 thin 180 +
   104 A #scale(x: 120%, y: 120%)[\)] . $ <supp:rational-error-coefficient>]

For example, the source term contributes $176 A$; the remaining linear terms contribute $56 thin 264 thin 004 A$,
  and the quadratic terms contribute $104 A^2$.

Put $A_0 = 2 \/ 10^21$. Each rational upper bound for $frak(a)$ above is less than $A_0$,
  and the coefficient in (9.15) increases with $A$. The exact comparison

$ 56 thin 264 thin 180 + 208 / 10^21 < 56 thin 264 thin 181 < 6 dot.op 10^7 $

therefore supplies the claimed coefficient bound. More explicitly,

$ cal(F) \( A_0 \, 4 A_0 \) = frac(112 thin 528 thin 360, 10^21) + 416 / 10^42 < 12 / 10^14 . $

The order-two norm is $\| F \|_(2 \, t) = \| F \( t \) \| + \| F' \( t \) \| + \| F'' \( t \) \| \/ 2$.
  Hence the second derivative, unlike the value and first derivative, requires the factor $2$:

$ \| f''_0 - tilde(f)''_0 \| lt.eq 2 \| f_0 - tilde(f)_0 \|_(2 \, t) < 24 / 10^14 = 2.4 dot.op 10^(- 13) . $

For the angular function, (6.9) similarly yields the entirely rational comparison

$ \| e'' - tilde(e)'' \| lt.eq 2 #scale(x: 120%, y: 120%)[\(] 16 \( 2 dot.op 10^6 \) A_0 +
  32 A_0^2 #scale(x: 120%, y: 120%)[\)] = frac(128 thin 000 thin 000, 10^21) + 256 / 10^42 < 13 / 10^14 =
  1.3 dot.op 10^(- 13) . $

The value and first derivative are bounded by their norms without this factor.
  Thus these rational alternatives preserve the error threshold $10^(- 11)$ for all six quantities in (6.10) on
  $\[ b \, l \]$. For $t gt.eq l$, the exact continuation (6.11),
  rather than a uniform absolute error at unbounded radius, remains the applicable statement.

#bibliography("refs.bib", style: "ieee", title: [References])
