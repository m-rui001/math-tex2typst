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

#align(center)[#text(size: 16pt, weight: "bold")[A Modulus Proof of Cannon's Conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Cannon’s conjecture asks whether a hyperbolic group whose boundary is a topological two-sphere acts geometrically
  on hyperbolic three-space. It links the topology at infinity of a group to its three-dimensional geometry.
  Here a group is #emph[hyperbolic] if a Cayley graph for a finite generating set has uniformly thin geodesic
  triangles; its boundary consists of asymptotic classes of geodesic rays, with the usual visual topology.
  An isometric action is #emph[geometric] if it is proper and cocompact.

The following theorem resolves Cannon’s conjecture positively.

#thm([Theorem 1.1.])[
  (Cannon’s conjecture).  #emph[Let $G$ be a hyperbolic group with $partial G$ homeomorphic to $bb(S)^2$.
    There is a homomorphism $rho : G arrow.r "Isom" \( bb(H)^3 \)$ for which the action on $bb(H)^3$ is proper and
    cocompact. Its kernel is finite.]
] <thm:main>

Properness means that ${ g in G : rho \( g \) K ∩ K eq.not diameter }$ is finite for every compact $K subset
  bb(H)^3$; cocompactness means that one compact set has translates covering $bb(H)^3$.
  A finite kernel is allowed, and the image may contain orientation-reversing isometries.
  In particular, the theorem does not require a choice of orientation preserved by $G$.

For torsion-free $G$, the quotient is a closed hyperbolic three-manifold, possibly nonorientable.
  We prove this consequence and the resulting virtual-structure statements in 8.

===== 1.1 History and the classical reduction. <history-and-the-classical-reduction.>

Cannon’s 1994 combinatorial Riemann mapping theorem grew out of the problem of finding an analytic structure on a
  sphere supplied only with combinatorial boundary data. It recovers quasiconformal coordinates from discrete
  annular moduli [10] pp. 155–160. In their 1998 paper, Cannon–Swenson stated the group-boundary conjecture and
  related a geometric action to conformality of the canonical boundary coverings [14] Theorem 5.1 and Conjecture
  5.1. Cannon–Floyd–Parry showed in 1999 that it suffices to find,
  around each point in every prescribed neighborhood, an annulus whose discrete moduli for separating curves stay
  bounded away from zero [12] Theorem 8.2. Their finite subdivision rules provide a related framework for
  recursive planar tilings [13]. These works turn the topological problem into quantitative control of crossings
  at small scales.

Bonk–Kleiner’s uniformization theory gives a metric formulation of this program [6].
  We use the precise criterion in Bourdon–Kleiner [8] Corollary 3.5:
  on an approximately self-similar metric sphere, a uniform bound for the combinatorial $2$-modulus of all
  continuous curves of a fixed sufficiently small minimum diameter yields a quasi-Möbius parametrization by the
  round sphere. The visual boundary has the required self-similarity.
  Thus the remaining analytic task is an upper modulus bound for its fixed-scale coverings.
  The criterion and its hypotheses are verified in 2.

A related route uses #emph[Ahlfors regular conformal dimension]:
  the infimum of the Hausdorff dimensions of Ahlfors regular metrics quasisymmetric to the visual metric.
  This is a version of the boundary invariant introduced by Pansu [20].
  Bonk–Kleiner proved Cannon’s conjecture when that infimum is attained [7] Theorem 1.1;
  their argument connects the minimizing metric to quantitative curve families through the Loewner property [7]
  Theorem 1.3. The existence of a minimizing metric is a hypothesis of that criterion.

The algebraic approaches connect surface subgroups, cubulations, and Kleinian realizations.
  Kahn–Marković constructed almost geodesic surface subgroups in closed orientable hyperbolic three-manifold
  groups [18] Theorems 1.1–1.2. Bergeron–Wise used this abundance to cubulate those groups,
  and more generally proved that quasiconvex codimension-one subgroups separating every distinct boundary pair
  yield a proper cocompact cubical action [5] Theorem 1.4 and Section 5.
  Agol proved virtual specialness for hyperbolic groups with such an action [1] Theorem 1.1;
  these results give the consequences recorded in 8 once a hyperbolic three-manifold realization is known.

In the recognition direction, Marković showed that enough quasiconvex surface subgroups separating every boundary
  pair give a Kleinian realization for groups whose sphere-boundary action is faithful and orientation-preserving
  [19] Theorem 1.1. Haïssinsky established a virtual Kleinian criterion for cubulated hyperbolic groups with
  planar boundary [16] Theorem 1.10. More recently, Groves, Haïssinsky, Manning, Osajda, Sisto,
  and Walsh constructed group-theoretic drillings and showed that the Toral Relative Cannon conjecture implies a
  virtual Kleinian realization for every residually finite hyperbolic group with sphere boundary [15] Theorems A–B
  and Corollary C. The present proof follows the analytic route,
  establishing the required modulus bound directly from hyperbolicity and the topology of the boundary.

After boundary uniformization, the invariant-conformal-structure method of Sullivan and the detailed circumcenter
  construction of Tukia straighten the action [23,24]. We state the analytic inputs at their point of use and
  include the short argument with unoriented conformal structures,
  so that orientation-reversing elements are retained. Properness and cocompactness then follow from the boundary
  action on ordered triples (1).

===== 1.2 The proof in outline. <the-proof-in-outline.>

Fix a visual metric on $Z = partial G$. At scale $a^(- n)$, where $a > 1$,
  cover $Z$ by balls centered on a separated net. Assign nonnegative weights to the balls so that every path of a
  fixed minimum diameter meets balls of total weight at least one.
  Let $M \( n \)$ be the least sum of squared weights. The classical criterion reduces the theorem to

$ sup_n M \( n \) < oo . $

Assume this fails. Record indices permit comparison of $M \( N - l \)$ with $M \( N \)$, and lead to two growth cases.

First, crossing duality in a coordinate rectangle produces weights with squared sum $O \( M \( N \)^(- 1) \)$.
  A planar regularization turns them into continuous functions $H_N$ on a slightly enlarged rectangle,
  with separating level continua of uniformly positive diameter.
  Annular estimates give a nonconstant locally uniform limit $u$ and a finite measure $mu$ such that

$ #scale(x: 120%, y: 120%)[\(] "osc"_(overline(B) \( x \, s \)) u #scale(x: 120%, y: 120%)[\)]^2 lt.eq
  C mu #scale(x: 120%, y: 120%)[\(] overline(B) \( x \, C_mu s \) #scale(x: 120%, y: 120%)[\)] . $

The approximants retain vanishing local squared oscillation sums after every #emph[fixed] group transformation.
  A finite-cell inequality compares two such functions by sweeping through the separating levels.
  This is the analytic construction in 3.

The growth of the record moduli determines how we use this scalar limit.
  Exponential growth makes $u$ locally Hölder, which allows normalized magnifications of its variation to converge
  to a nonconstant function on a punctured sphere. The level comparison forces each transform with a different
  puncture to be constant on the variation set of the first. A second magnification contradicts this constraint (4).

For subexponential growth, we use the measure bound to distribute variation among many balls.
  A tree of separated balls carries nested value intervals and a probability flow.
  The transition probabilities obey linear and quadratic bounds in the ratio of child to parent interval lengths.
  These bounds force a definite total probability, at arbitrarily deep levels,
  onto nodes with two separated regions of variation (5). At a common depth,
  many expansions have the same two target regions but distinct punctures.
  Comparing them in pairs charges more mass to small balls than their overlap allows (6).
  This excludes the remaining case.

Discrete crossing duality is part of the extremal-length theory developed in [22,11].
  The finite incidence-vector identity is also the probabilistic modulus formula of Albin–Poggi-Corradini [3]
  Theorem 5.1; we reprove it in the notation of our cell covers.
  Pansu’s coarse conformal geometry uses image-diameter energies and condenser capacities [20] §6.
  Scalar extremals and separating levels also enter Rajala’s uniformization of metric surfaces [21] Sections 4–6.
  Here two path envelopes produce the required continua while preserving finite-cell oscillation bounds.
  The subsequent level integrations and pair counts are proved directly for the visual boundary.
  The two growth branches use this same scalar construction, and their combination finishes the theorem in 7.

===== 1.3 Conventions. <conventions.>

A path is a continuous map of a compact interval, identified with its image when convenient.
  A continuum is a nonempty compact connected set; it need not be path connected.
  $B \( x \, r \)$ is open and $overline(B) \( x \, r \) = { y : d \( x \, y \) lt.eq r }$ is closed.
  For real $f$, write $"osc"_A f = sup_A f - inf_A f$. Constants in $lt.tilde$ and $asymp$ are independent of the
  scale indices being varied. Dependence on a compact region, a fixed group element,
  or a subdivision parameter is specified where needed.

== 2 Boundary geometry and the modulus criterion <sec:geometry>

We collect the geometric estimates used throughout the proof, then state the classical uniformization input.
  Let $Gamma$ be the Cayley graph of $G$ for a finite symmetric generating set, with unit edge lengths.
  Write $e$ for its identity vertex and $\| v \| = d_Gamma \( e \, v \)$. The Gromov product is

$ \( y \| z \)_o = 1 / 2 #scale(x: 120%, y: 120%)[\(] d_Gamma \( o \, y \) + d_Gamma \( o \, z \) -
  d_Gamma \( y \, z \) #scale(x: 120%, y: 120%)[\)] . $

Boundary products are defined by limits along rays, up to a uniformly bounded additive error.
  A visual metric $d$ on $Z = partial G$ satisfies

#[#set math.equation(numbering: n => "(2.1)")
 $ C_v^(- 1) a^(- \( y \| z \)_e) lt.eq d \( y \, z \) lt.eq C_v a^(- \( y \| z \)_e) \, wide y eq.not z \,
   $ <eq:visual>]

for some $a > 1$. Set $r_k = a^(- k)$ for integers $k gt.eq 0$.
  We use the standard product inequality $\( y \| z \)_e gt.eq min { \( y \| w \)_e \, \( w \| z \)_e } -
  O \( 1 \)$ and its geometric form: geodesics with product at least $j -
  C$ stay a bounded synchronous distance apart through depth $j$, provided both have that length.
  The bound depends on $C$ and the hyperbolicity constant. These facts, visual metrics,
  and thin ideal triangles are recalled in [9] III.H.3.

=== 2.1 Expansions <expansions>

Left multiplication by the inverse of a vertex far along a ray magnifies a small boundary ball.
  The following formula also controls the complement of that ball; this second feature will be essential.

#thm([Lemma 1.])[
  (Expansion formula).  #emph[Let $v$ be the depth-$k$ vertex on a based ray to $x in Z$, put $h =
    v^(- 1)$ and $R = r_k$, and set $D_y = max { R \, d \( x \, y \) }$.
    There are constants $c_E \, C_E > 0$, independent of these choices, such that
#[#set math.equation(numbering: n => "(2.2)")
 $ c_E frac(R thin d \( y \, z \), D_y D_z) lt.eq d \( h y \, h z \) lt.eq
   C_E frac(R thin d \( y \, z \), D_y D_z) . $ <eq:expansion>]

 In particular, on $B \( x \, C R \)$ the map $h$ is bi-Lipschitz with scale factor $R^(- 1)$ and distortion
   depending only on $C$. If $d \( x \, z_0 \) gt.eq epsilon_(*) > 0$, $R < epsilon_(*) \/ 2$, and $p = h z_0$, then
#[#set math.equation(numbering: n => "(2.3)")
 $ d \( h y \, p \) lt.tilde R \/ D_y quad \( y in Z \) \, wide
   d \( h y \, p \) asymp R \/ D_y quad \( d \( x \, y \) lt.eq epsilon_(*) \/ 2 \) \, $ <eq:puncture>]

 and
#[#set math.equation(numbering: n => "(2.4)")
 $ \( v^(- 1) \| p \)_e gt.eq k - C \( epsilon_(*) \) . $ <eq:inverse-prefix>]

 The constants in the last two estimates may depend on $epsilon_(*)$.]
] <lem:expansion>

#proof[
  Base change and thin triangles give
  $ \( y \| z \)_v = \( y \| z \)_e + k - \( v \| y \)_e - \( v \| z \)_e + O \( 1 \) \, wide \( v \| y \)_e =
    min { k \, \( x \| y \)_e } + O \( 1 \) . $
  Thus $a^(- \( v \| y \)_e) asymp D_y$. Exponentiating the first identity and using
    $\( h y \| h z \)_e = \( y \| z \)_v + O \( 1 \)$ proves (2.2).
    With $z = z_0$, the factor $D_(z_0)$ is bounded above and below, and $d \( y \, z_0 \)$ is bounded above.
    When $d \( x \, y \) lt.eq epsilon_(*) \/ 2$, the latter is also bounded below. This proves (2.3).
    Finally, $\( v^(- 1) \| v^(- 1) z_0 \)_e = k - \( v \| z_0 \)_e + O \( 1 \)$,
    and $\( v \| z_0 \)_e$ is bounded in terms of $epsilon_(*)$. ◻
]

#thm([Lemma 2.])[
  (Prefixes).  #emph[Every vertex $v$ lies a uniformly bounded distance from a depth-$\|
    v \|$ vertex on a based ray. With that ray’s endpoint as $x$, (2.2) remains valid for $h = v^(- 1)$ and $R =
    r_(\| v \|)$, with uniform constants. Moreover:]
  + #emph[If $d \( xi \, eta \) lt.eq C r_j$, depth-$j$ vertices on any based rays to $xi \,
    eta$ are a bounded distance apart, depending only on $C$.]
  + #emph[If $\| v \| = k$ and $\( v \| xi \)_e gt.eq k - C$,
    every geodesic from $e$ to $v$ stays a bounded synchronous distance from a ray to $xi$ through depth $k$.]
] <lem:prefix>

#proof[
  Translate a bi-infinite geodesic so that it passes through $v$.
    The ideal triangle with third vertex $e$ puts $v$ uniformly near one of its based sides;
    the nearby parameter differs from $\| v \|$ by a bounded amount.
    A bounded change of basepoint changes products by a bounded amount, preserving (2.2).
    The two remaining assertions follow from (2.1) and the product estimate. ◻
]

Each fixed $g in G$ acts bi-Lipschitzly on $Z$, with a constant depending on $g$.
  The whole action is uniformly quasi-Möbius: base-change factors cancel in distance cross-ratios,
  giving a single $C gt.eq 1$ such that

$ C^(- 1) frac(d \( x \, z \) d \( y \, w \), d \( x \, w \) d \( y \, z \)) lt.eq
  frac(d \( g x \, g z \) d \( g y \, g w \), d \( g x \, g w \) d \( g y \, g z \)) lt.eq
  C frac(d \( x \, z \) d \( y \, w \), d \( x \, w \) d \( y \, z \)) $

for every distinct quadruple and every $g$.

=== 2.2 Packing and paths <packing-and-paths>

#thm([Lemma 3.])[
  (Packing).  #emph[There are $Q gt.eq 2$ and $C_P < oo$ such that an $s$-separated subset of a ball of radius $t$
    has at most $C_P \( t \/ s \)^Q$ points whenever $0 < s lt.eq t lt.eq "diam" Z$. In particular, $Z$ is doubling.]
] <lem:packing>

#proof[
  Choose $k$ with $r_k asymp t$. Rays ending in the given ball have their depth-$k$ vertices in a uniformly
    bounded graph ball, by 2. At depth $k + j$ there are at most $C A^j$ possible continuations,
    where $A > 1$ depends on the valence. Endpoints whose rays share such a vertex are at visual distance at most
    $C' r_(k + j)$. Choose the least $j gt.eq 0$ with $C' r_(k + j) < s$.
    The desired bound follows with $Q gt.eq max { 2 \, log_a A }$.
    Coarse scales are absorbed by increasing the constant. ◻
]

#thm([Lemma 4.])[
  (Controlled paths).  #emph[There is $L gt.eq 1$ such that any two points of $overline(B) \( x \, s \)$ join by a
    path in $B \( x \, L s \)$. Any two points of a continuum can also be joined by a path in any prescribed open
    neighborhood of it.]
] <lem:paths>

#proof[
  For small $s$, expand at $x$ with $R asymp s$ and choose $z_0$ a uniformly positive distance from $x$;
    two fixed distinct points suffice for this choice. By (2.3),
    the two image points stay a uniform positive distance from $p = h z_0$.
    Fix a homeomorphism $phi.alt : Z arrow.r bb(S)^2$. Uniform continuity of $phi.alt^(- 1)$ places their
    spherical images a uniform distance from $phi.alt \( p \)$.
    Join them outside a smaller round ball about $phi.alt \( p \)$.
    Uniform continuity of $phi.alt$ makes the pullback path stay a uniform $d$-distance from $p$.
    The upper bound in (2.3) puts its preimage under $h$ in $B \( x \, L s \)$.
    Increase $L$ for the remaining scales, using path connectedness of $Z$.
  For a continuum $C$ in an open set $V$, choose $epsilon > 0$ with its $L epsilon$-neighborhood in $V$.
    Connectedness supplies a finite $epsilon$-chain in $C$ between any two specified points:
    the set reachable by such chains is relatively clopen. Join consecutive points by the first assertion. ◻
]

=== 2.3 The classical reduction <the-classical-reduction>

Choose a maximal $r_n$-separated set $T_n subset Z$ and its cells $B \( q \, 2 r_n \)$, $q in T_n$.
  These cover $Z$; fixed enlargements have bounded overlap. For a path family $cal(F)$, define

$ "Mod"_2 \( cal(F) \, T_n \) = min_(omega gt.eq 0) {sum_(q in T_n) omega \( q \)^2 :
  sum_(B \( q \, 2 r_n \) ∩ pi eq.not diameter) omega \( q \) gt.eq 1 upright(" for every ") pi in cal(F)} . $

Only finitely many incidence vectors occur, so the minimum exists. Fix a sufficiently small $d_0 > 0$ and put

#[#set math.equation(numbering: n => "(2.5)")
 $ cal(F)_0 = { pi : "diam" pi gt.eq d_0 } \, wide M \( n \) = "Mod"_2 \( cal(F)_0 \, T_n \) . $ <eq:macro-modulus>]

We require $d_0 < "diam" Z \/ 10$ and choose it so that every path of diameter at least $R \/
  2$ in $overline(B) \( x \, 3 R \)$ has image diameter at least $d_0$ under a scale-$R$ expansion.
  This is possible by (2.2). We also impose the smallness requirement in 2 before fixing $d_0$ and $M \( n \)$.
  The family is nonempty, and $0 < M \( n \) < oo$: all-one weights are admissible,
  while any one path gives the lower bound $1 \/ \# T_n$.

#thm([Theorem 2.1.])[
  (Bonk–Kleiner; Bourdon–Kleiner).  #emph[If $sup_n M \( n \) < oo$,
    then $\( Z \, d \)$ is quasi-Möbius homeomorphic to the round sphere.]
] <thm:uniformization>

#proof[
  #emph[Verification of the cited criterion.] Corollary 3.5 of [8], derived from [6] Theorem 10.4,
    applies to an arcwise connected, approximately self-similar metric sphere.
    Approximate self-similarity means that each open ball, with distances divided by its radius,
    is uniformly bi-Lipschitz to an open subset of the space.
    1 supplies this property; intermediate and large radii change only the constant.
  The criterion assumes bounded $2$-moduli of paths of diameter at least a sufficiently small $d_0$ in successive
    graph approximations. For a dyadic scale $2^(- m)$ choose $n$ with $2^(- m) \/ a < r_n lt.eq 2^(- m)$.
    Our cells form a fixed $kappa$-approximation for any $kappa > 2 a$:
    the inner balls of radius $2^(- m) \/ kappa$ are disjoint, each is contained in its cell,
    and each cell is contained in the radius-$kappa 2^(- m)$ ball about its center.
    The modulus is exactly $M \( n \)$. Finitely many coarse scales have finite modulus.
    No Coxeter-group assumption occurs in this criterion. ◻
]

#thm([Proposition 1.])[
  (From the boundary to hyperbolic space).  #emph[If $\( Z \, d \)$ is quasi-Möbius homeomorphic to the round
    sphere, then $G$ admits a proper cocompact isometric action on $bb(H)^3$ with finite kernel.]
] <prop:action>

#proof[
  Let $psi : Z arrow.r bb(S)^2$ be the uniformizing homeomorphism and write $cal(G) = { psi g psi^(- 1) :
    g in G }$. The boundary cross-ratio estimate and the two fixed maps $psi \,
    psi^(- 1)$ give one quasi-Möbius distortion function for every element of $cal(G)$.
    Fix $f in cal(G)$ and $x in bb(S)^2$, keep a fourth point away from $x$,
    and let two points at equal spherical distance from $x$ approach $x$.
    In the cross-ratio inequality the factors involving the fourth point tend to one,
    both before and after applying $f$. Thus the infinitesimal linear distortion has a bound independent of $f$
    and $x$; the radius at which the estimate is accurate need not be uniform in $f$.
    The metric characterization of planar quasiconformality, applied in conformal charts,
    makes each $f$ quasiconformal. At its almost-everywhere nonsingular differentiability points,
    the same infinitesimal bound controls the ratio of singular values of $D f$,
    and hence its analytic dilatation. This gives a common quasiconformal bound.
    For a reversing map apply the characterization after a conformal reflection;
    see [4] Theorems 2.5.3–2.5.4 and the metric characterization in [17] Theorem 1.4 and Remark 1.8(b).
  We recall explicitly the invariant-structure argument, including orientation reversal.
    This is the invariant-conformal-structure method of Sullivan,
    with the circumcenter construction detailed by Tukia [24] pp. 73–76.
    Analytic quasiconformal maps have almost-everywhere defined nonsingular weak differentials,
    and they and their inverses preserve null sets [4] Theorem 3.1.2.
    Their differentials satisfy the almost-everywhere composition rule [2] Lemma 10 and Theorem 5.
    Since $cal(G)$ is countable, remove the $cal(G)$-orbit of the union of all exceptional sets for these
    assertions and for all pairs of maps. Its complement $X$ is invariant and conull.
    At $x in X$, let $cal(C)_x$ be the space of positive definite quadratic forms on $T_x
    bb(S)^2$ modulo positive scalars. This is a hyperbolic plane, and pullback by any invertible linear map,
    of either orientation, is an isometry between the corresponding fibers [4] Section 2.3,
    equations (2.17)–(2.18) and Theorem 2.3.2. The orbit ${ f^(*) q_(upright("round")) \( x \) :
    f in cal(G) } subset cal(C)_x$ is uniformly bounded, by the common quasiconformal bound,
    and contains the round form. Its unique hyperbolic circumcenter defines a uniformly bounded measurable
    conformal structure $q \( x \)$. Indeed, circumcenters of the increasing finite subsets from an enumeration
    are measurable and converge to that circumcenter: their radii increase,
    their centers stay in a fixed compact ball, and every subsequential limit is the unique center of the whole
    orbit. The composition rule permutes this orbit under pullback, so $f^(*) q =
    q$ on $X$ for every $f in cal(G)$. Extend $q$ arbitrarily across the null complement of $X$.
  The measurable Riemann mapping theorem [2] Theorem 6 gives a quasiconformal homeomorphism $F : bb(S)^2 arrow.r
    bb(S)^2$ with $F^(*) q_(upright("round")) = q$ almost everywhere.
    Invariance and the analytic composition rule show that every $F f F^(- 1)$ is conformal or anticonformal,
    according to the orientation of $f$. Such sphere homeomorphisms are Möbius or anti-Möbius.
    Their unique extensions to hyperbolic isometries therefore define a homomorphism $rho : G arrow.r
    "Isom" \( bb(H)^3 \)$.
  For completeness, properness and cocompactness follow directly from the action on ordered distinct triples
    $cal(T) \( Z \)$. On any compact set of triples all pairwise distances are bounded below.
    For $\| v \| arrow.r oo$, at least two points of such a triple stay away from the expansion center for
    $v^(- 1)$; their image distance is $O \( r_(\| v \|) \)$.
    Thus $v^(- 1) K ∩ K = diameter$ eventually for every compact $K subset cal(T) \( Z \)$.
    Conversely, expand at one point of a closest pair with scale comparable to their distance.
    Formula (2.2) makes all three image distances uniformly positive:
    if the third point is nearby, all denominator factors have that scale;
    otherwise its distances to the pair cancel its denominator factor.
    Triples already uniformly separated need no expansion. Hence the action on triples is proper and cocompact.
  These properties survive boundary conjugacy. Let $I = "Isom" \( bb(H)^3 \)$.
    The stabilizer $H$ of a standard ordered boundary triple has two elements:
    the identity and reflection in its hyperbolic plane. Choose $o in bb(H)^3$ fixed by $H$,
    and let $K_o$ be its compact stabilizer in $I$. The equivariant map
  $ cal(T) \( bb(S)^2 \) tilde.equiv I \/ H arrow.r I \/ K_o tilde.equiv bb(H)^3 $
  is continuous, onto, and proper: isometries sending $o$ into a compact set form a compact set.
    Properness and cocompactness therefore descend. The kernel fixes $o$, so is finite. ◻
]

== 3 A scalar limit from unbounded modulus <sec:scalar>

Assume that the macroscopic moduli $M \( n \)$ are unbounded.
  Crossing duality first gives transverse weights of energy $O \( M \( n \)^(- 1) \)$ along a subsequence.
  We turn those weights into continuous functions whose level continua meet every path straddling the
  corresponding value. An annular estimate then yields a nonconstant limit $u$ and a finite measure controlling
  its squared oscillation. The approximating functions retain vanishing local oscillation energy after each fixed
  group transformation; later comparisons will use this property as well as the limit itself.
  Constants are independent of the approximation index; thresholds may depend on the fixed compact subset of the
  domain under consideration.

=== 3.1 Record scales and crossing duality <record-scales-and-crossing-duality>

If $limsup M \( n \)^(1 \/ n) > 1$, choose $1 < lambda < limsup M \( n \)^(1 \/ n)$; otherwise put $lambda = 1$.
  In both cases $M \( n \) \/ lambda^n$ is unbounded. Retain increasing record indices $N$ whose record values
  tend to infinity. Thus $M \( N \) arrow.r oo$ and

#[#set math.equation(numbering: n => "(3.1)")
 $ M \( N - l \) lt.eq lambda^(- l) M \( N \) wide \( 0 lt.eq l lt.eq N \) . $ <eq:records>]

This inequality survives every further subsequence.

#thm([Lemma 5.])[
  (Localization to a rectangle).  #emph[There are coordinate rectangles $cal(Q) = \[ 0 \, 1 \]^2 subset
    hat(cal(Q)) = \[ 0 \, 1 \] times \[ - 1 \, 2 \] subset Z$ and a subsequence of the record indices such that
    the left-to-right crossing modulus of $cal(Q)$ is at least $c M \( N \)$, with $c > 0$ independent of $N$.]
] <lem:rectangle-localization>

#proof[
  Cover $Z$ by finitely many coordinate boxes $\[ - 1 \, 1 \]^2$,
    each lying in a chart containing $\[ - 8 \, 8 \]^2$ of diameter less than $d_0$.
    A macroscopic path meeting an inner box must leave its larger box.
    Follow it to its first meeting with $partial \[ - 2 \, 2 \]^2$.
    If it exits through $x = 2$, its segment after the last preceding meeting with $x =
    1$ crosses $\[ 1 \, 2 \] times \[ - 2 \, 2 \]$ from left to right.
    The other three exit sides give analogous strips. Each strip extends by its height in both transverse
    directions inside $\[ - 8 \, 8 \]^2$.
  Consequently there are finitely many crossing families $cal(F)_1 \, dots.h \,
    cal(F)_J$ such that every macroscopic path contains a member of one of them. Summing admissible weights gives
  $ M \( N \) lt.eq J sum_(j = 1)^J "Mod"_2 \( cal(F)_j \, T_N \) lt.eq J^2 max_j "Mod"_2 \( cal(F)_j \, T_N \) . $
  One strip realizes this bound along a subsequence. Affine coordinates give the asserted rectangles. ◻
]

The edge $y = 0$ is the top of $cal(Q)$. The rectangles $\[ 0 \, 1 \] times \[ - 1 \, 0 \]$ and $\[ 0 \, 1 \]
  times \[ 1 \, 2 \]$ are its top and bottom bands, respectively.
  Coordinates serve only interpolation and topology: all distances refer to $d$.

#thm([Lemma 6.])[
  (Crossings and blockers).  #emph[In a closed coordinate rectangle:]
  + #emph[every continuum meeting both lateral edges meets every top-to-bottom path;]
  + #emph[every compact set meeting all top-to-bottom paths contains a continuum meeting both lateral edges.]
] <lem:planar-blocker>

#proof[
  For (i), suppose a lateral continuum and a top-to-bottom path are disjoint.
    Enlarge the rectangle, extending the continuum horizontally and the path vertically to the corresponding new
    edges. The extensions remain disjoint: a new horizontal and vertical segment can meet only at an original
    corner, already a common point of the original sets. Approximate the extended path,
    within its positive clearance from the continuum, by a polygonal path with interior in the enlarged rectangle.
    After subdivision at intersections it contains a simple polygonal arc between the top and bottom edges.
    The Jordan curve theorem, applied after adjoining a boundary route,
    shows that this arc separates the lateral edges. The connected continuum cannot avoid it.
  For (ii), subdivide into finer square grids and mark the closed squares meeting the blocker $K$.
    No edge-adjacent chain of unmarked squares joins top to bottom.
    Label $A$ the unmarked squares reachable from the top through unmarked edge-adjacent squares,
    and append a top row of $A$ squares. Label all remaining squares and an appended bottom row $B$.
    Draw the interfaces between unlike labels. Interior vertices have even degree;
    each lateral boundary has an odd number of ends, since its labels begin with $A$ and end with $B$.
    There are no top or bottom ends. Some interface component therefore joins the lateral boundaries:
    otherwise every component contributes an even number of ends to the only lateral boundary it meets.
  Along a path in this component, the adjacent $B$ squares are original marked squares.
    An adjacent unmarked square would be reachable, while an interface with the appended bottom row would give an
    unmarked top-to-bottom chain. Successive $B$ squares meet at least at a corner.
    Their union is a connected compact lateral crossing. A Hausdorff limit as the mesh tends to zero is connected,
    meets both lateral edges, and lies in $K$. ◻
]

The next finite-dimensional argument belongs to discrete extremal length.
  Cannon–Floyd–Parry describe optimal weights through crossing vectors and their pairing with transverse cuts [11]
  Sections 2.3 and 2.4.3; the probability formulation of Albin–Poggi-Corradini gives the same least-norm
  incidence-vector identity [3] Theorem 5.1. We give the argument for the cell families used here.

#thm([Lemma 7.])[
  (Crossing dual weights).  #emph[For each retained $N$ there are nonnegative weights $rho_q = rho_q^(\( N \))$,
    $q in T_N$, admissible for top-to-bottom crossings of $cal(Q)$, such that
#[#set math.equation(numbering: n => "(3.2)")
 $ sum_(q in T_N) rho_q^2 lt.eq frac(C, M \( N \)) . $ <eq:dual-energy>]

]
] <lem:dual-weights>

#proof[
  Let $P$ minimize Euclidean norm in the convex hull of the finitely many cell-incidence vectors $v$ of
    left-to-right crossings. Its coordinates are nonnegative and sum to at least one, so $P eq.not 0$.
    Minimality gives $chevron.l P \, v chevron.r gt.eq parallel P parallel^2$,
    making $P \/ parallel P parallel^2$ admissible. Conversely any admissible $omega$ satisfies $chevron.l
    omega \, P chevron.r gt.eq 1$. Thus the left-to-right modulus is $parallel P parallel^(- 2)$.
    By 6(i), each top-to-bottom incidence vector has inner product at least one with every $v$, hence with $P$.
    Set $rho = P$ and apply 5. ◻
]

=== 3.2 Continuous functions with separating levels <continuous-functions-with-separating-levels>

For $pi subset hat(cal(Q))$ write $ell_rho \( pi \) = sum_(q : B \( q \, 2 r_N \) ∩ pi eq.not diameter) rho_q$.
  For $x in cal(Q)$, let $b_N \( x \)$ be the infimum of this cost over paths from the top edge to $x$ in
  $cal(Q)$. Define the raw function $min { 1 \, b_N }$, assigning exactly zero on the top edge,
  and extend it by zero and one to the top and bottom bands. Admissibility gives value one on the bottom edge.

Along every path in $hat(cal(Q))$, the difference of raw endpoint values is at most its cost.
  Inside $cal(Q)$ this follows by concatenating with nearly minimizing paths and clipping at one;
  a path beginning on the top edge is itself a competitor. A path visiting both bands contains a crossing of cost
  at least one. If it visits only the top band, each endpoint value is bounded by the cost of its segment to that
  band. If it visits only the bottom band, each endpoint value is at least one minus that segment’s cost,
  by concatenation with a top-to-endpoint competitor. In either case the endpoint difference is bounded by the
  cost of the entire path.

Triangulate $hat(cal(Q))$ by a finite coordinate grid containing the band boundaries,
  with every triangle of $d$-diameter less than $r_N$. Interpolate the raw vertex values affinely to obtain a
  continuous $U_N^0 : hat(cal(Q)) arrow.r \[ 0 \, 1 \]$. It is constant on the bands.
  Continuity alone does not ensure that one selected level continuum meets every straddling path.
  The following two path envelopes give the strict sublevel and superlevel sets the connections to the bands
  needed for that conclusion. Define

$ F_N \( x \) = inf_(pi : x arrow.r upright("top")) max_pi U_N^0 \, wide H_N \( x \) =
  sup_(pi : x arrow.r upright("bottom")) inf_pi F_N \, $

where paths remain in $hat(cal(Q))$ and end in the indicated band.

#thm([Lemma 8.])[
  (Regularization and level continua).  #emph[The functions $F_N \, H_N$ are continuous,
    with the prescribed band values, and for every path $K subset hat(cal(Q))$,
#[#set math.equation(numbering: n => "(3.3)")
 $ "osc"_K H_N lt.eq "osc"_K F_N lt.eq "osc"_K U_N^0 . $ <eq:flood-osc>]

 For every $0 < t < 1$, the set ${ H_N = t } ∩ cal(Q)$ contains a lateral crossing continuum $C_(N \, t)$ of
   diameter at least a fixed $d_1 > 0$. Every path in $hat(cal(Q))$ whose endpoint values strictly straddle $t$
   meets $C_(N \, t)$.]
] <lem:level-continua>

#proof[
  We have $F_N gt.eq U_N^0$ and $H_N lt.eq F_N$; constant paths give the band values.
    Concatenation with nearly optimizing paths gives, for $x \, y in K$,
  $ F_N \( x \) lt.eq max { max_K U_N^0 \, F_N \( y \) } \, wide H_N \( y \) gt.eq min { inf_K F_N \, H_N \( x \) } . $
  If $F_N \( x \) > F_N \( y \)$, the first inequality places their values between $min_K U_N^0$ and $max_K
    U_N^0$. If $H_N \( x \) > H_N \( y \)$, the second places them between $inf_K F_N$ and $sup_K F_N$.
    This proves (3.3). Short coordinate segments and continuity of $U_N^0$ then prove continuity of both
    functions, including at the boundary.
  Every point of ${ H_N > t }$ joins the bottom band within that set:
    choose a path with $inf F_N > t$ and use its tails. Likewise every point of ${ F_N <
    t }$ joins the top within ${ F_N < t }$. To connect a point $x$ with $H_N \( x \) < t lt.eq
    F_N \( x \)$ to the top, choose $H_N \( x \) < s < t$ and follow any top-going path until its first point with
    $F_N = s$. On this prefix $F_N gt.eq s$, so concatenation with nearly maximizing paths from any prefix point
    $z$ gives
  $ H_N \( x \) gt.eq min { s \, H_N \( z \) } . $
  Hence $H_N \( z \) lt.eq H_N \( x \) < t$ throughout the prefix.
    Its endpoint joins the top through $F_N < t$, hence through $H_N < t$.
    Thus both strict sides of the level join their respective bands, and then the outer top and bottom edges,
    without meeting the level.
  The compact set ${ H_N = t }$ blocks all top-to-bottom paths by continuity and lies in $cal(Q)$.
    By 6(ii) it contains a lateral continuum $C_(N \, t)$; take $d_1$ to be the distance between the lateral edges
    of $cal(Q)$. Complete any straddling path to a top-to-bottom path using the strict-side connections.
    The completed path meets $C_(N \, t)$ by 6(i), and the added pieces avoid the level, proving the last assertion. ◻
]

Figure 1 isolates the last step: the strict-side extensions cannot account for the intersection with the selected
  continuum, so the original straddling path must meet it.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 1.25), (7, 1.72), fill: rgb("#f7f7f7"), stroke: none)
  rect((0, -1.72), (7, -1.25), fill: rgb("#f7f7f7"), stroke: none)
  rect((0, -1.72), (7, 1.72), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round"))
  line((0, 1.25), (7, 1.25), (0, -1.25), (7, -1.25), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round"))
  content((1.9, 1.49), [#text(size: 9pt)[top band: $H_N=0$]])
  content((1.9, -1.49), [#text(size: 9pt)[bottom band: $H_N=1$]])
  content((0.1, 1.15), [#text(fill: rgb("#595959"))[#text(size: 9pt)[$cal(Q)$]]], anchor: "north-west", padding: 0.1176cm)
  line((0, 0.13), (0.37, 0.03), (0.69, 0.19), (1.04, 0.05), (1.34, 0.2), (1.64, -0.04), (1.98, 0.08), (2.28, -0.09), (2.6, 0.04), (2.91, -0.13), (3.19, 0.06), (3.53, -0.09), (3.84, 0.09), (4.16, -0.02), (4.48, 0.15), (4.81, 0.01), (5.13, 0.18), (5.47, 0.04), (5.8, 0.2), (6.1, 0.05), (6.41, 0.2), (6.7, 0.08), (7, 0.2), stroke: (paint: rgb("#36657d"), thickness: 2.0pt, cap: "round", join: "round"))
  line((1.34, 0.2), (1.42, 0.37), (1.59, 0.32), (2.28, -0.09), (2.18, -0.28), (2.38, -0.24), (4.81, 0.01), (4.89, -0.21), (5.03, -0.15), (6.1, 0.05), (6.04, -0.14), (6.22, -0.19), stroke: (paint: rgb("#36657d"), thickness: 1.1pt, cap: "round", join: "round"))
  content((1.95, 0.4), [#text(fill: rgb("#36657d"))[#text(size: 9pt)[$C_(N,t) subset \{H_N=t\}$]]], anchor: "south", padding: 0.1176cm)
  bezier((4.9, 1.72), (3.72, 0.79), (4.4, 1.32), (3.88, 1.29), stroke: (paint: rgb("#a46f30"), thickness: 0.8pt, cap: "round", join: "round", dash: "dashed"))
  bezier((3.72, 0.79), (4.1, -0.8), (3.5, 0.34), (4.24, -0.24), stroke: (paint: rgb("#a46f30"), thickness: 0.8pt, cap: "round", join: "round"))
  bezier((4.1, -0.8), (5.1, -1.72), (4, -1.24), (4.94, -1.29), stroke: (paint: rgb("#a46f30"), thickness: 0.8pt, cap: "round", join: "round", dash: "dashed"))
  circle((3.72, 0.79), radius: 0.05292, fill: rgb("#a46f30"), stroke: none)
  circle((4.1, -0.8), radius: 0.05292, fill: rgb("#a46f30"), stroke: none)
  line((3.72, 0.79), (4.1, -0.8), fill: rgb("#a46f30"), stroke: none)
  content((3.96, 0.74), [#text(size: 9pt)[$H_N<t$]], anchor: "west", padding: 0.1176cm)
  content((3.89, -0.86), [#text(size: 9pt)[$H_N>t$]], anchor: "east", padding: 0.1176cm)
  content((4.27, -0.46), [#text(fill: rgb("#a46f30"))[#text(size: 9pt)[$eta$]]], anchor: "west", padding: 0.1176cm)
  content((7.32, 0.82), [#text(fill: rgb("#262626"))[#text(size: 9pt)[strict-side#linebreak()extension]]], anchor: "west", padding: 0.1176cm)
  line((7.2, 0.86), (5.1, 1.18), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round"))
  content((7.32, -0.85), [#text(fill: rgb("#262626"))[#text(size: 9pt)[strict-side#linebreak()extension]]], anchor: "west", padding: 0.1176cm)
  line((7.2, -0.82), (5.05, -1.36), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round"))
})],
  caption: [Figure 1: A separating level continuum and a straddling path. The dashed extensions stay in the strict sublevel and superlevel sets and complete $eta$ to a top-to-bottom crossing. That crossing meets $C_(N \, t)$, so $eta$ itself meets $C_(N \, t)$. The continuum is drawn schematically; neither smoothness nor path connectedness is assumed. ],
) <fig:level-continuum>

=== 3.3 Oscillation and annular estimates <oscillation-and-annular-estimates>

The level continua now let us estimate oscillation by crossing an annulus.
  Energies formed from image diameters and their relation to condenser capacity appear in Pansu’s coarse conformal
  geometry [20] §6; the estimates below use the finite-cell energy of our regularized scalar functions.
  Put $U = "int"_Z hat(cal(Q))$. For a continuous function $f$ on an open set containing a compact set $K$,
  and $J gt.eq 2$, define

$ cal(E)_n^(\( J \)) \( f \; K \) = sum_(q in T_n\
B \( q \, 2 r_n \) ∩ K eq.not diameter) #scale(x: 120%, y: 120%)[\(] "osc"_(overline(B) \( q \, J r_n \)) f
  #scale(x: 120%, y: 120%)[\)]^2 . $

The closed balls lie in the domain for all sufficiently large $n$.

#thm([Lemma 9.])[
  (Local oscillation).  #emph[For fixed compact $K subset U$ and $J > 0$,
    uniformly for $x in K$ and sufficiently large $N$,
#[#set math.equation(numbering: n => "(3.4)")
 $ "osc"_(overline(B) \( x \, J r_N \)) H_N lt.eq sum_(q in T_N\
d \( q \, x \) lt.eq C \( J \) r_N) rho_q . $ <eq:local-osc>]

 Here $C \( J \)$ depends only on $J$ and the ball path constant.
   Consequently, for every fixed $g in G$, compact $K' subset g U$, and $J gt.eq 2$,
$ cal(E)_N^(\( J \)) \( H_N compose g^(- 1) \; K' \) lt.eq frac(C \( g \, K' \, J \), M \( N \)) arrow.r 0 . $

]
] <lem:local-oscillation>

#proof[
  Join two points of $overline(B) \( x \, J r_N \)$ inside $B \( x \, L J r_N \)$ by 4.
    Vertices of triangles meeting this path lie in $B \( x \, \( L J + 1 \) r_N \)$;
    any two such vertices join inside $B \( x \, L \( L J + 1 \) r_N \) subset U$ for large $N$.
    The raw endpoint inequality bounds every difference of their values by the right side of (3.4),
    with $C \( J \) = L \( L J + 1 \) + 3$. It therefore bounds the interpolant’s oscillation along the original
    path. Apply (3.3).
  Squaring and summing costs a bounded factor by 3: both the number of nearby weights and the number of centers
    charging each weight are bounded. The same holds for $b r_N$-separated centers,
    with constants depending on $b > 0$. A fixed $g$ is bi-Lipschitz,
    so inverse images of target balls lie in source balls of radius $C_g J r_N$,
    their centers are $b_g r_N$-separated, and all these source balls lie in a fixed compact subset of $U$.
    The summation bound and (3.2) finish the proof. ◻
]

The mesh-scale estimate preserves the small dual energy. We next compare oscillation across a ball of radius $R =
  r_l$ with the dual energy in a surrounding annulus. Expansion takes that annulus to a fixed-size region and
  takes the mesh $r_N$ to $r_(N - l)$; this is why the next bound contains $M \( N - l \)$.

#thm([Lemma 10.])[
  (Annular estimate).  #emph[For every compact $K subset U$ there are $R_(*) > 0$ and an integer $m_0$ such that,
    if $x in K$, $R = r_l lt.eq R_(*)$, and $N - l gt.eq m_0$,
    then any two points joined by a path in $B \( x \, R \/ 2 \)$ have $H_N$-value difference $Delta$ satisfying
#[#set math.equation(numbering: n => "(3.5)")
 $ Delta^2 lt.eq C M \( N - l \) sum_(q in T_N\
R \/ 4 lt.eq d \( q \, x \) lt.eq 4 R) rho_q^2 . $ <eq:annular>]

 The constant is uniform; $N$ is sufficiently large for the fixed interior region.]
] <lem:annular>

#proof[
  Choose $R_(*)$ with $4 R_(*) < d_1$ and all closed $5 R_(*)$-balls about $K$ contained in $U$.
    All following restrictions on $m_0$ concern only $r_N \/ R = a^(- \( N - l \))$.
  Expand at $x \, l$ by $h$, and choose macroscopic admissible weights $omega$ at scale $N -
    l$ with squared mass $M \( N - l \)$. Put
  $ cal(A) = { q in T_N : R \/ 2 lt.eq d \( q \, x \) lt.eq 3 R } \, wide sigma_q = sum_(xi in T_(N - l)\
d \( xi \, h q \) lt.eq C_0 r_(N - l)) omega_xi \, quad q in cal(A) \, $
  where $C_0 > C_E + 2$. Expansion on $B \( x \, 3 R \)$ separates the $h q$ by a fixed multiple of $r_(N - l)$.
    Packing bounds both overlap multiplicities, giving
  $ sum_(q in cal(A)) sigma_q^2 lt.eq C M \( N - l \) . $
  Let $I$ be the open interval between the endpoint values.
    For $t in I$, the continuum $C_(N \, t)$ meets the given path and exits $B \( x \, 2 R \)$,
    since its diameter exceeds $4 R$. By 4, join these two continuum points in its $r_N \/
    4$-neighborhood and retain a radial subpath $eta_t$ between radii $R$ and $2 R$,
    contained in that closed annulus. Its diameter is at least $R$,
    so $h eta_t$ is macroscopic by the choice of $d_0$ in 2.
  If a target cell $B \( xi \, 2 r_(N - l) \)$ meets $h eta_t$ at $h y$,
    choose $q in T_N$ with $d \( q \, y \) lt.eq r_N$. For large $m_0$,
    this center belongs to $cal(A)$ and $d \( h q \, h y \) lt.eq C_E r_N \/ R$,
    so $omega_xi$ occurs in $sigma_q$. Some level point lies within $r_N \/ 4$ of $y$,
    hence in $overline(B) \( q \, 2 r_N \)$. Thus $t$ lies in the closed range interval $I_q$ of $H_N$ on that
    ball. Accounting for all target cells gives
  $ 1 lt.eq sum_(q in cal(A)) sigma_q upright(bold(1))_(I_q) \( t \) quad \( t in I \) \, wide Delta lt.eq
    C M \( N - l \)^(1 \/ 2) (sum_(q in cal(A)) \| I_q \|^2)^(1 \/ 2) . $
  The second inequality follows by integration and Cauchy–Schwarz.
    Apply (3.4) with $J = 2$ and its bounded-overlap summation.
    Taking $C \( 2 \) r_N < R \/ 4$ confines every charged center to $R \/ 4 lt.eq d \( q \, x \) lt.eq 4 R$,
    proving (3.5). ◻
]

=== 3.4 The limiting function and measure <the-limiting-function-and-measure>

The finite measures $mu_N = M \( N \) sum_(q in T_N) rho_q^2 delta_q$ have uniformly bounded mass by (3.2).

#thm([Proposition 2.])[
  (Scalar limit).  #emph[Along a subsequence of the record indices, $H_N arrow.r
    u$ locally uniformly on $U$ and $mu_N harpoon.rt mu$, where $u :
    U arrow.r \[ 0 \, 1 \]$ is continuous and nonconstant and $mu$ is finite.
    The function $u$ is zero and one on the interiors of the respective bands,
    and is locally Hölder continuous if $lambda > 1$. For every compact $K subset U$ and sufficiently small $s >
    0$, uniformly for $x in K$,
#[#set math.equation(numbering: n => "(3.6)")
 $ #scale(x: 120%, y: 120%)[\(] "osc"_(overline(B) \( x \, s \)) u #scale(x: 120%, y: 120%)[\)]^2 lt.eq
   C mu #scale(x: 120%, y: 120%)[\(] overline(B) \( x \, C_mu s \) #scale(x: 120%, y: 120%)[\)] . $ <eq:measure>]

 For each $0 < t < 1$ there is a continuum $C_t subset cal(Q)$ of diameter at least $d_1$, with $u =
   t$ on $C_t ∩ U$, meeting every compact path in $U$ whose endpoint values strictly straddle $t$.
   The fixed-transform energy bounds of 9 hold along the retained subsequence.]
] <prop:scalar-limit>

#proof[
  Fix compact $K subset U$, and let $x \, y in K$ with $d \( x \, y \) lt.eq r_k$.
    They join inside $B \( x \, L r_k \)$. Choose $b$ with $a^b > 2 L$ and consider indices $l lt.eq k -
    b$ above a fixed interior threshold, in an arithmetic progression of step $b_1$ with $a^(b_1) > 16$.
    The annuli ${ r_l \/ 4 lt.eq d \( x \, dot.op \) lt.eq 4 r_l }$ are disjoint.
    For $N$ sufficiently large relative to $k$, (3.5) and (3.1) give
  $ \| H_N \( x \) - H_N \( y \) \|^2 lt.eq C lambda^(- l) mu_N { r_l \/ 4 lt.eq d \( x \, dot.op \) lt.eq 4 r_l } . $
  Summing over at least $c k$ indices yields $\| H_N \( x \) - H_N \( y \) \| lt.eq C_K k^(- 1 \/ 2)$.
    If $lambda > 1$, the single choice $l = k - b$ gives $C_K lambda^(- k \/ 2)$ instead.
  For each tolerance this controls a tail uniformly; the finitely many omitted functions are individually
    uniformly continuous. Thus the sequence is equicontinuous on $K$.
    Arzelà–Ascoli on a compact exhaustion of $U$, followed by weak compactness of the measures on $Z$,
    gives the asserted subsequence. The two constant band values prove nonconstancy.
    The stronger estimate gives local Hölder exponent $log lambda \/ \( 2 log a \)$.
  For (3.6), fix $A > 2 L$ and choose $A s lt.eq R = r_l < a A s$.
    Any two points of $overline(B) \( x \, s \)$ join in $B \( x \, L s \) subset B \( x \, R \/ 2 \)$.
    The annular and record estimates give
  $ #scale(x: 120%, y: 120%)[\(] "osc"_(overline(B) \( x \, s \)) H_N #scale(x: 120%, y: 120%)[\)]^2 lt.eq
    C mu_N #scale(x: 120%, y: 120%)[\(] overline(B) \( x \, 4 a A s \) #scale(x: 120%, y: 120%)[\)] $
  for large $N$. Local uniform convergence passes the oscillation to the limit;
    the closed-set inequality for weak convergence bounds the right-hand limsup by $C
    mu \( overline(B) \( x \, 4 a A s \) \)$. Take $C_mu = 4 a A$.
  For each fixed $t$, take a Hausdorff limit $C_t$ of $C_(N \, t)$ in $cal(Q)$.
    It is connected and has diameter at least $d_1$. Local uniform convergence gives $u = t$ on $C_t ∩ U$.
    A fixed compact straddling path also straddles $t$ for every sufficiently large $H_N$,
    hence meets those $C_(N \, t)$ and their limit. The subsequence used here may depend on $t$;
    no simultaneous selection is needed. ◻
]

=== 3.5 Two comparison tools <two-comparison-tools>

The scalar construction will be used in three ways. The large continua $C_t$ provide levels for annular
  constructions, with $u = t$ on $C_t ∩ U$; no value of $u$ is asserted outside $U$.
  The measure estimate (3.6) turns oscillation on a small ball into a lower bound for its enlarged ball’s
  $mu$-mass. To compare transformations, we retain $H_N$ and $C_(N \, t)$:
  the identity $H_N = t$ holds on the entire continuum, and the local oscillation energies tend to zero after each
  transformation has been fixed. Those comparisons will pass to subcontinua contained in compact subsets of the
  common open domains.

The first tool integrates variation of a second function over a family of level continua.
  It is a finite-cell statement, independent of the preceding construction.

#thm([Lemma 11.])[
  (A finite-cell level comparison).  #emph[Let $f \, w$ be continuous on an open set $V subset Z$,
    let $K subset V$ be compact, and let $I subset bb(R)$ be an interval.
    Suppose that for every $t in I$ there is a continuum $D_t subset K$ with $f =
    t$ on $D_t$ and $"osc"_(D_t) w gt.eq b_0 > 0$. For sufficiently large $n$,
#[#set math.equation(numbering: n => "(3.7)")
 $ b_0 \| I \| lt.eq sum_(q in T_n\
B \( q \, 2 r_n \) ∩ K eq.not diameter) "osc"_(overline(B) \( q \, 2 r_n \)) f thin
  "osc"_(overline(B) \( q \, 2 r_n \)) w . $ <eq:cross-energy>]

 Consequently these hypotheses cannot hold for sequences with both local oscillation energies on $K$ tending to
   zero, if $b_0$ and $\| I \|$ stay bounded below by positive constants.]
] <lem:cross-energy>

#proof[
  Let $I_q \( f \)$ be the closed range interval of $f$ on the closed cell. For large $n$ these cells lie in $V$.
    The interval $w \( D_t \)$ is covered by the range intervals of $w$ on cells meeting $D_t$,
    and each such cell has $t in I_q \( f \)$. Therefore
  $ b_0 lt.eq sum_(q : B \( q \, 2 r_n \) ∩ K eq.not diameter) "osc"_(overline(B) \( q \, 2 r_n \)) w thin
    upright(bold(1))_(I_q \( f \)) \( t \) . $
  Integrate over $I$ and use $\| I ∩ I_q \( f \) \| lt.eq "osc"_(overline(B) \( q \, 2 r_n \)) f$.
    Only finitely many interval indicators are integrated, so no measurable selection of $D_t$ is required.
    Cauchy–Schwarz gives the final assertion. ◻
]

#thm([Lemma 12.])[
  (Stopping a continuum at a sphere).  #emph[Let $D$ be a continuum, $p in Z$, and $r > 0$.
    If $x in D \\ overline(B) \( p \, r \)$ and $D ∩ B \( p \, r \) eq.not diameter$,
    then $D$ contains a subcontinuum through $x$ meeting the radius-$r$ sphere and avoiding $B \( p \, r \)$.]
] <lem:stop-continuum>

#proof[
  In a compact metric space $X$, a point’s component is the intersection $Q_x$ of its clopen neighborhoods.
    To verify connectedness of $Q_x$, suppose it is separated into two compact pieces in disjoint open sets
    $O_1 \, O_2$. Compactness of $X \\ \( O_1 union O_2 \)$ gives a finite intersection $W$ of clopen
    neighborhoods of $x$ contained in their union. Its intersection with the $O_i$ containing $x$ is clopen in $X$
    and misses the other piece of $Q_x$, a contradiction. The same compactness argument shows that every open
    neighborhood of a component contains a clopen neighborhood of it.
  Apply this to $X = D \\ B \( p \, r \)$ and the component $C$ of $x$.
    If $C$ missed the sphere, it would have a clopen neighborhood $W$ in $X$ missing the sphere.
    Compactness places $W$ a positive distance from $overline(B) \( p \, r \)$, so $W$ is also clopen in $D$.
    It is nonempty and misses $D ∩ B \( p \, r \)$, contradicting connectedness.
    Thus $C$ is the required subcontinuum. ◻
]

== 4 Exponential records: comparing two magnifications <sec:exponential>

Suppose $lambda > 1$. The scalar limit $u$ is then locally Hölder.
  We magnify its variation to a nonconstant function on a punctured sphere.
  The approximating level continua force every transform with a different puncture to be constant wherever this
  function varies. A second magnification makes two such transforms vary on the same two disks,
  with disjoint value ranges, yielding a contradiction. Scalar approximation indices throughout belong to the
  subsequence of 2.

=== 4.1 Magnifying variation <magnifying-variation>

#thm([Lemma 13.])[
  (Hölder magnification).  #emph[Let $f$ be a real-valued, locally Hölder continuous function on an open set
    $Omega subset Z$. Suppose $O$ is open, $overline(O) subset Omega$,
    and $O$ contains a compact path on which $f$ is nonconstant. Fix $z_0$ with $"dist" \( z_0 \, O \) > 0$.
    There are depths $k_i arrow.r oo$, centers $x_i in O$, positive numbers $sigma_i$, and expansions $h_i =
    v_i^(- 1)$ at $\( x_i \, k_i \)$ such that, after passage to a subsequence,
$ p_i = h_i z_0 arrow.r b \, wide frac("dist" \( x_i \, Z \\ O \), r_(k_i)) arrow.r oo . $

 Every compact subset of $Z \\ { b }$ eventually lies in $h_i Omega$, and
#[#set math.equation(numbering: n => "(4.1)")
 $ F_i \( z \) = frac(f \( h_i^(- 1) z \) - f \( x_i \), sigma_i) $ <eq:blowup>]

 converges locally uniformly there to a nonconstant locally Hölder continuous function $F$.]
] <lem:holder-magnification>

#proof[
  Write $delta \( x \) = "dist" \( x \, Z \\ O \)$ and fix $eta > Q$.
    A finite cover of $overline(O)$ gives a uniform Hölder bound, with some exponent $alpha_0 > 0$,
    on a neighborhood of $overline(O)$. For all large $k$ put
  $ A_k = sup_(x in O) delta \( x \)^eta "osc"_(overline(B) \( x \, r_k \)) f . $
  The balls lie in $Omega$, and
  #[#set math.equation(numbering: n => "(4.2)")
   $ c a^(- Q k) lt.eq A_k lt.eq C a^(- alpha_0 k) . $ <eq:magnification-bounds>]
  For the lower bound, cover a compact variation path $P subset O$ by at most $C
    r_k^(- Q)$ radius-$r_k$ balls centered on $P$, using 3. Their range intervals cover the interval $f \( P \)$,
    so one ball has oscillation at least $c r_k^Q$; also $min_P delta > 0$. The upper bound is the Hölder estimate.
  Fix $0 < alpha < alpha_0$. Since $A_k a^(alpha k) arrow.r 0$,
    there are arbitrarily late indices attaining their maximum over the remaining tail. At these indices,
  #[#set math.equation(numbering: n => "(4.3)")
   $ A_(k + j) lt.eq a^(- alpha j) A_k wide \( j gt.eq 0 \) . $ <eq:magnification-tail>]
  Choose $x_k in O$ attaining at least half the supremum, and set $delta_k = delta \( x_k \)$ and $sigma_k =
    A_k \/ delta_k^eta$. Boundedness of $f$ and (4.2) give $delta_k^eta gt.eq c r_k^Q$,
    hence $delta_k \/ r_k gt.eq c r_k^(Q \/ eta - 1) arrow.r oo$.
    Expand at $\( x_k \, k \)$ and take a subsequence with $p_k = h_k z_0 arrow.r b$.
  For a compact $K subset Z \\ { b }$, (2.3) gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ h_k^(- 1) K subset overline(B) \( x_k \, C_K r_k \) subset O $ <eq:magnification-preimage>]
  eventually. The expansion formula gives $d \( h_k^(- 1) z \, h_k^(- 1) w \) lt.eq
    C_K r_k d \( z \, w \)$ on $K$. On every fixed multiple of this source ball,
    $delta$ is comparable to $delta_k$. Thus (4.3) implies
  #[#set math.equation(numbering: n => "(4.5)")
   $ frac(\| f \( y \) - f \( y' \) \|, sigma_k) lt.eq C a^(- alpha j) quad upright("if ") d \( y \, y' \) lt.eq
     r_(k + j) \, quad j gt.eq 0 . $ <eq:magnification-local-holder>]
  For sufficiently small $d \( z \, w \)$, choosing $j gt.eq 0$ with $a^(- j) gt.eq
    C_K d \( z \, w \) > a^(- j - 1)$ proves a uniform local $alpha$-Hölder estimate for $F_k$ on $K$.
  For boundedness, 4 joins $h_k^(- 1) z$ to $x_k$ inside a fixed multiple of $B \( x_k \, r_k \)$.
    Packing covers this path by a bounded number of radius-$r_k$ balls centered on the path,
    each with oscillation at most $C sigma_k$. Their range intervals cover the path’s image,
    so $\| F_k \( z \) \| lt.eq C_K$. Compact exhaustion and Arzelà–Ascoli now give a locally uniform,
    locally Hölder limit. Finally, $"osc"_(h_k overline(B) \( x_k \, r_k \)) F_k gt.eq 1 \/ 2$.
    The lower puncture bound places all these image balls in one compact set off $b$,
    so local uniform convergence makes the limit nonconstant. ◻
]

=== 4.2 A common mesh and escaping level continua <a-common-mesh-and-escaping-level-continua>

Apply 13 to $u$ on $U$, taking a small variation region $O$ and $z_0$ outside its closure.
  Call the limit $W$, its puncture $b$, and retain $x_i \, k_i \, h_i \, sigma_i$.

#thm([Lemma 14.])[
  (Diagonal approximants).  #emph[After thinning the expansions, there are increasing scalar indices $N_j$ such that
$ f_j \( z \) = frac(H_(N_j) \( h_j^(- 1) z \) - u \( x_j \), sigma_j) \, wide z in h_j hat(cal(Q)) \, $

 converges locally uniformly to $W$ on $Z \\ { b }$. For every fixed $g in G$, compact $K subset Z \\ { g b }$,
   and fixed $J gt.eq 2$,
#[#set math.equation(numbering: n => "(4.6)")
 $ cal(E)_(N_j)^(\( J \)) \( f_j compose g^(- 1) \; K \) arrow.r 0 . $ <eq:exponential-translated-energy>]

 All indicated enlarged balls eventually lie in the functions’ domains.]
  #emph[If a compact path $P subset Z \\ { b }$ has endpoint values of $W$ strictly straddling a compact
    positive-length interval $I$, then, for all large $j$ and every $t in I$,
    there is a continuum $D_(j \, t) subset h_j hat(cal(Q))$ with
$ f_j = t upright(" on ") D_(j \, t) \, wide D_(j \, t) ∩ P eq.not diameter \, wide
  sup_(t in I) "dist" \( b \, D_(j \, t) \) arrow.r 0 . $

]
] <lem:exponential-diagonal>

#proof[
  For $j gt.eq 4$ put $K_j = { d \( z \, b \) gt.eq 1 \/ j }$ and $L_j = { d \( z \, b \) gt.eq 1 \/ \( 2 j \) }$.
    Choose the $j$th expansion so that $h_j^(- 1) L_j subset U$ and its normalized $u$-transform differs from $W$
    by at most $1 \/ j$ on $L_j$. #emph[Hold this expansion and its normalization fixed.] Then choose $N_j >
    N_(j - 1)$ so large that
  $ sup_(L_j) frac(\| H_(N_j) \( h_j^(- 1) z \) - u \( h_j^(- 1) z \) \|, sigma_j) lt.eq 1 / j \, wide
    cal(E)_(N_j)^(\( j \)) \( f_j \; K_j \) lt.eq 1 / j \, wide \( j + 2 \) r_(N_j) < frac(1, 2 j) . $
  The uniform approximation follows from 2. With $h_j$ and $sigma_j$ fixed,
    9 bounds the displayed energy by $C \( h_j \, K_j \, j \) \/ \( sigma_j^2 M \( N_j \) \)$,
    so the energy condition follows by increasing $N_j$. The last condition keeps all the enlarged balls in $L_j$.
    This proves local uniform convergence and vanishing energy at every fixed enlargement off $b$.
  For a fixed $g$, choose a compact neighborhood $K'$ of $g^(- 1) K$ avoiding $b$.
    Pulling back each target ball and choosing a nearest source net point gives, by bi-Lipschitz distortion and packing,
  $ cal(E)_n^(\( J \)) \( F compose g^(- 1) \; K \) lt.eq C_g cal(E)_n^(\( J' \)) \( F \; K' \) $
  for some fixed $J' gt.eq 2$ and all large $n$. Each source center receives only boundedly many target centers.
    Eventually $K' subset K_j$ and $J' lt.eq j$, proving (4.6).
  Uniform convergence makes the endpoint values of $f_j$ straddle $I$.
    The source level $tau_j \( t \) = u \( x_j \) + sigma_j t$ therefore lies in $\( 0 \, 1 \)$,
    and 8 supplies $D_(j \, t) = h_j C_(N_j \, tau_j \( t \))$, meeting $P$.
    Its source continuum has diameter at least $d_1$, so contains a point at distance at least $d_1 \/
    2$ from $x_j$. By (2.3),
  $ "dist" \( b \, D_(j \, t) \) lt.eq d \( b \, p_j \) + C r_(k_j) arrow.r 0 $
  uniformly for $t in I$. ◻
]

=== 4.3 Comparison across punctures <comparison-across-punctures>

Let $cal(N) \( F \)$ be the points of a continuous function’s domain at which it is not locally constant.

#thm([Lemma 15.])[
  (Transform comparison).  #emph[If $c = g b eq.not b$ and $V = W compose g^(- 1)$, then
#[#set math.equation(numbering: n => "(4.7)")
 $ V \( x \) = V \( b \) wide #scale(x: 120%, y: 120%)[\(] x in cal(N) \( W \) \\ { c }
   #scale(x: 120%, y: 120%)[\)] . $ <eq:transform-level>]

 More generally, for $W_s = W compose s^(- 1)$ and $p_s = s b$, if $p_s eq.not p_t$,
#[#set math.equation(numbering: n => "(4.8)")
 $ W_t \( x \) = W_t \( p_s \) wide #scale(x: 120%, y: 120%)[\(] x in cal(N) \( W_s \) \\ { p_t }
   #scale(x: 120%, y: 120%)[\)] . $ <eq:two-transform-level>]

]
] <lem:exponential-comparison>

#proof[
  Suppose $x in cal(N) \( W \) \\ { c }$ and $V \( x \) eq.not V \( b \)$.
    Choose $epsilon > 0$ and a coordinate disk about $x$, compactly contained off $b \, c$, on which $\| V -
    V \( b \) \| gt.eq 4 epsilon$. It contains a compact variation path $P$ for $W$.
    Choose a compact positive-length interval $I$ strictly between its endpoint values, avoiding $W \( c \)$.
    Continuity gives $epsilon.alt_c > 0$ such that $overline(B) \( c \, epsilon.alt_c \)$ avoids $b$ and its
    $W$-range has positive distance from $I$. Consequently, for all large $j$,
    the continua $D_(j \, t)$ from 14 avoid this closed ball.
  Choose $rho > 0$ so that $overline(B) \( b \, rho \)$ avoids $c \, P$ and $\| V - V \( b \) \| lt.eq
    epsilon$ there. For $w_j = f_j compose g^(- 1)$, local uniform convergence gives
  $ \| w_j - V \( b \) \| gt.eq 3 epsilon quad upright("on ") P \, wide \| w_j - V \( b \) \| lt.eq 2 epsilon quad
    upright("on ") overline(B) \( b \, rho \) $
  for all large $j$. Each $D_(j \, t)$ meets $P$ and enters $B \( b \, rho \)$.
    By 12, it has a subcontinuum joining a chosen point of $P$ to the radius-$rho$ sphere and contained in
  $ K = { z : d \( z \, b \) gt.eq rho \, med d \( z \, c \) gt.eq epsilon.alt_c } . $
  This subcontinuum lies in the level $f_j = t$ and has $w_j$-oscillation at least $epsilon$.
    A fixed compact neighborhood of $K$ avoiding both punctures eventually lies in $h_j U ∩ g h_j
    U$ and contains every closed radius-$2 r_(N_j)$ cell meeting $K$. Hence 11 and Cauchy–Schwarz give
  $ epsilon \| I \| lt.eq #scale(x: 120%, y: 120%)[\(] cal(E)_(N_j)^(\( 2 \)) \( f_j \; K \)
    #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] cal(E)_(N_j)^(\( 2 \)) \( w_j \; K \)
    #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) arrow.r 0 \, $
  a contradiction. All sets and $g$ are fixed in this limit.
    Finally apply (4.7) at $s^(- 1) x$ with group element $s^(- 1) t$ to obtain (4.8). ◻
]

=== 4.4 The second magnification <the-second-magnification>

We first control repeated punctures. An accumulation direction of vertices going to infinity is a subsequential
  boundary limit.

#thm([Lemma 16.])[
  (Stabilizer directions).  #emph[For every $b in Z$, the vertices of $E =
    "Stab"_G \( b \)$ have at most two accumulation directions.]
] <lem:stabilizer>

#proof[
  Let $xi$ be a based ray to $b$. For $q in E$, $\| q \| lt.eq t$,
    thinness of the ideal triangle with sides $\[ e \, q \] \, xi \,
    q xi$ puts $q xi \( n \)$ uniformly near $xi$ when $n$ is sufficiently larger than $t$.
    The nearby parameter lies in $\[ n - t - C \, n + t + C \]$.
    For one common integer $n$, these vertices are distinct as $q$ varies. Bounded valence therefore gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ \# { q in E : \| q \| lt.eq t } lt.eq C' \( t + 1 \) . $ <eq:stabilizer-growth>]
  If another accumulation direction exists, take $q_n arrow.r x eq.not b$ and $q_n^(- 1) arrow.r
    y$ along a subsequence. Base change gives, uniformly on compact sets avoiding $y$,
  $ \( q_n \| q_n z \)_e = \| q_n \| - \( q_n^(- 1) \| z \)_e + O \( 1 \) gt.eq \| q_n \| - O \( 1 \) . $
  By 2, $q_n z arrow.r x$ there, and $q_n b = b$ forces $y = b$.
    Choose disjoint small neighborhoods of $b \, x$, with a point outside their union.
    For large $n$, $q = q_n$ sends the complement of the first into the second.
    Its positive iterates never return the outside point, so $q$ has infinite order.
    It is therefore loxodromic, with endpoints $b \, x'$; see [9] III.$Gamma$.3.10.
  If some $h in E$ moved $x'$, the cyclic subgroups generated by $q$ and $h q h^(- 1)$ would intersect trivially:
    a nonzero common power would have the same pair of endpoints.
    Their $m^2$ products $q^i \( h q h^(- 1) \)^j$, $1 lt.eq i \, j lt.eq m$,
    would then be distinct and have length $O \( m \)$, contradicting (4.9).
    Thus every element of $E$ fixes both endpoints. It maps a geodesic line between them to a line at uniformly
    bounded Hausdorff distance, so its orbit of $e$ stays a fixed distance from that line.
    Its only possible accumulation directions are the two endpoints. ◻
]

#thm([Proposition 3.])[
  #emph[The contradiction setup cannot have $lambda > 1$.]
] <prop:no-exponential-records>

#proof[
  Let $E = "Stab" \( b \)$ and let $Lambda_E$ be its at-most-two accumulation directions.
    Choose a variation region $O$ for $W$ whose closure avoids ${ b } union Lambda_E$. Such a region exists:
    otherwise $W$ would be locally constant on the connected sphere minus this finite set,
    and continuity would make it constant throughout its domain.
  Apply 13 to $W$ on $Z \\ { b }$, with this $O$ and $z_0 = b$.
    Write the expansions as $s_i = v_i^(- 1)$, with centers $y_i in O$, depths $ell_i arrow.r oo$,
    and punctures $p_i = s_i b arrow.r b_(*)$. Positive affine normalizations of $W_i = W compose
    s_i^(- 1)$ converge locally uniformly off $b_(*)$ to a continuous nonconstant $W_(*)$.
  The punctures have a pairwise distinct subsequence. Indeed, if $v_i^(- 1) b = v^(- 1) b$ infinitely often,
    then $v_i v^(- 1) in E$. After a subsequence $y_i arrow.r y in overline(O)$.
    Since $v_i$ lies at depth $ell_i$ on a ray to $y_i$, 2 gives $v_i arrow.r y$ in boundary direction.
    Bounded right multiplication preserves this direction, implying $y in Lambda_E$, a contradiction.
  Choose two coordinate disks $D_1 \, D_2$, with compact closures off $b_(*)$,
    having disjoint $W_(*)$-range intervals and each containing a compact variation path.
    To do this, follow a variation path to its first hitting points of two distinct intermediate values.
    Just before either first hitting time the values differ, so the function is not locally constant at either
    point. Continuity supplies disks with disjoint ranges, and non-local constancy supplies a variation path in each.
  For every sufficiently large $i$, the puncture $p_i$ is outside the closed disks.
    Uniform convergence of the normalized $W_i$ preserves both the disjoint range intervals and the positive
    variation on the two fixed paths. Positive affine normalization preserves these properties,
    so $cal(N) \( W_i \)$ meets each disk. Fix two distinct such indices $i \, j$.
    By (4.8), $W_j$ has the single value $W_j \( p_i \)$ at every point of $cal(N) \( W_i \)$ in either disk.
    Taking one point in each contradicts the disjoint $W_j$-range intervals. ◻
]

== 5 A probability flow in the subexponential case <sec:flow>

Assume now that the unbounded moduli satisfy

#[#set math.equation(numbering: n => "(5.1)")
 $ limsup_(j arrow.r oo) M \( j \)^(1 \/ j) lt.eq 1 . $ <eq:subexponential-growth>]

Let $u \, mu \, C_t$ be given by 2. We build a tree of small balls carrying nested intervals of values of $u$.
  At each node, either two separated variations survive expansion,
  or many children carry a substantial fraction of its interval.
  A probability flow will force the first alternative at arbitrarily deep levels.

Choose $x_0 in U$ where $u$ is not locally constant, and choose $epsilon.alt_0 >
  0$ with $overline(B) \( x_0 \, 3 epsilon.alt_0 \) subset U$. Put

$ K = overline(B) \( x_0 \, epsilon.alt_0 \) \, wide K^(+) = overline(B) \( x_0 \, 2 epsilon.alt_0 \) \, $

and, shrinking $epsilon.alt_0$ if necessary, choose $z_0$ a positive distance from $K^(+)$.
  All centers will lie in $K$ and all source neighborhoods in $K^(+)$. Use the constants of (3.6) for this fixed region.

=== 5.1 Node intervals and transition probabilities <node-intervals-and-transition-probabilities>

The tree will record both where variation occurs and which values it carries.
  A node has a source center $x$, a scale $R$, and a value interval $J$.
  Its children have scale $r = theta R$, where $theta = a^(- D)$ for one positive integer subdivision depth $D$
  used throughout the tree. Their intervals are contained in $J$.
  We will choose probabilities on the children that control interval length linearly and quadratically;
  the two controls have different roles in the final comparison.

We first define this data for geometric constants $c_0 > 2 L + 2$, $L c_0 + 2 < A < B_0 - 2$, and $H > 0$.
  Here $c_0$ is the source-ball enlargement, $A \, B_0$ locate an annulus of possible child centers,
  and $H r$ is the separation required of retained children.
  The next subsection fixes these constants, before choosing $D$.
  We use only scales $R = r_k$ small enough that all fixed enlargements below lie in $K^(+)$ and satisfy (3.6),
  and that $\( B_0 + 2 \) R < d_1 \/ 2$.

A #emph[node] is a center $x in K$, a scale $R = r_k$, and a nonempty open interval $J = \( j_(-) \, j_(+) \)
  subset \( 0 \, 1 \)$ such that

#[#set math.equation(numbering: n => "(5.2)")
 $ J subset (min_(overline(B) \( x \, c_0 R \)) u \, max_(overline(B) \( x \, c_0 R \)) u) . $ <eq:node-straddling>]

Write $Delta = \| J \|$. For every $t in J$, a path in $B \( x \, L c_0 R \)$ strictly straddles $t$ and hence
  meets $C_t$. Since $"diam" C_t gt.eq d_1$, the continuum leaves $overline(B) \( x \, \( B_0 + 2 \) R \)$ and
  meets every intervening radial sphere.

Take a maximal $r$-separated set $Y$ in

$ cal(A)_x \( R \) = { y : \( A - 1 \) R lt.eq d \( x \, y \) lt.eq \( B_0 + 1 \) R } . $

It is an $r$-net there, and packing gives

#[#set math.equation(numbering: n => "(5.3)")
 $ \# Y lt.eq C_Y a^(Q D) \, $ <eq:candidate-count>]

with $C_Y$ independent of $D$. For $y in Y$ let $I_y^(upright("in"))$ and $I_y^(upright("out"))$ be the closed
  intervals between the extrema of $u$ on $overline(B) \( y \, 2 r \)$ and $overline(B) \( y \, c_0 r \)$,
  respectively. These are range #emph[intervals]; the balls need not be connected. Put

$ J_y = J ∩ "int" I_y^(upright("out")) \, wide t_y = \| J_y \| \/ Delta . $

A positive $t_y$ gives a nested open child interval satisfying (5.2), and, including singleton ranges,

#[#set math.equation(numbering: n => "(5.4)")
 $ \| J ∩ I_y^(upright("out")) \| = t_y Delta . $ <eq:closed-range-length>]

For $0 < c_(*) lt.eq 1 \/ \( 8 max { C_Y \, 1 } \)$, put $kappa = c_(*) a^(- Q D)$.
  A node is #emph[good] if two candidates $y^(-) \, y^(+)$ satisfy

#[#set math.equation(numbering: n => "(5.5)")
 $ \| I_(y^(-))^(upright("in")) ∩ \( j_(-) \, j_(-) + Delta \/ 4 \) \| & gt.eq
   kappa Delta \, & \| I_(y^(+))^(upright("in")) ∩ \( j_(-) + 3 Delta \/ 4 \, j_(+) \) \| & gt.eq kappa Delta \,\
"dist" \( I_(y^(-))^(upright("out")) \, I_(y^(+))^(upright("out")) \) & gt.eq Delta \/ 4 . $ <eq:good-inner>]

Goodness uses the full candidate set, independently of the children later retained.

The required probabilities are as follows. Fix the exponents

#[#set math.equation(numbering: n => "(5.6)")
 $ b_(*) = 1 / 2 \, wide tau = 1 / 20 \, wide beta = frac(tau, 4 \( Q + 1 \)) \, wide gamma = beta /
   2 . $ <eq:flow-exponents>]

At every node we seek an $H r$-separated set of children, with probabilities summing to one, such that

#[#set math.equation(numbering: n => "(5.7)")
 $ p_y & lt.eq a^(- gamma D) t_y \, & p_y & lt.eq a^(- b_(*) D) t_y^2 &  & upright("at nodes that are not good") \,\
p_y & lt.eq a^(- gamma D) t_y \, & p_y & lt.eq a^(tau D) t_y^2 &  & upright("at good nodes") . $ <eq:transition-bad>]

Multiplying the linear bounds along a branch will telescope the interval ratios and make the branch probability
  small. Multiplying the quadratic bounds will compare probability to squared interval length.
  The measure estimate bounds the sum of those squares at each separated generation.
  It will therefore bound the average probability of nodes with the stronger quadratic bound and force a
  substantial amount of good-node probability at arbitrarily deep levels.

Two facts will supply these transitions. A node that is not good has many children with $t_y gt.eq 1 \/ 8$,
  on which uniform probabilities suffice. At every node, a capacity estimate supplies enough total weight to
  satisfy the weaker pair of bounds (5.7). After constructing the transitions,
  we show that goodness also gives two separated regions of variation in one of finitely many target patterns.
  That geometric property is the input to 6.

=== 5.2 Geometric choices and many large children <geometric-choices-and-many-large-children>

We now fix the geometry used by the definitions above. Put $c_(upright("in")) =
  2 L$ and choose $c_0 > c_(upright("in")) + 2$ so large that, with

$ A = 4 L c_0 + 20 \, wide B_0 = A + 10 \, wide c_(upright("pat")) = frac(2 C_E c_(upright("in")), \( A - 2 \)^2) \, $

we have

#[#set math.equation(numbering: n => "(5.8)")
 $ frac(c_E c_0, \( B_0 + 2 \)^2) > 12 c_(upright("pat")) . $ <eq:flow-constant-choice>]

The constant $c_(upright("pat"))$ will be the target radius factor:
  paths joining extrema of the two inner child balls will expand into balls of radius $c_(upright("pat")) theta \/
  2$, while the larger source balls will contain the preimages of radius-$10 c_(upright("pat"))
  theta$ target balls. The ratio of the left side of (5.8) to the right side grows linearly in $c_0$,
  so this choice is possible. Next choose

$ H > max { 4 \( B_0 + 1 \) \, 4 C_mu c_0 \, 2 } . $

The first inequality preserves separation between different branches;
  the second makes the measure enlargements at one generation disjoint.
  These choices fix $C_Y$ in (5.3), and we fix $c_(*)$ as specified above.
  Require $theta < 1 \/ 4$ and $c_0 theta < 1$. All further lower bounds on $D$ will depend only on this fixed data.

The uniform upper bound on node scales can be chosen now, before $D$:
  all source radius factors are fixed, and the subsidiary scales $r$ and $s$ used below never exceed $R$.
  Thus the source neighborhoods and measure enlargements stay in $K^(+)$ for every node.
  We choose the root scale after $D$ has been fixed.

#thm([Lemma 17.])[
  (Many children at a node that is not good).  #emph[For sufficiently large $D$,
    every node that is not good has at least $c_H a^D$ mutually $H r$-separated candidates with $t_y gt.eq
    1 \/ 8$, where $c_H > 0$ is independent of the node and $D$.]
] <lem:bad-node-children>

#proof[
  Fix $b in \[ A R \, B_0 R \]$. Each $C_t$, $t in J$, meets the radius-$b$ sphere,
    so the inner intervals of candidates with $\| d \( x \, y \) - b \| lt.eq r$ cover $J$.
    By (5.3), two of them meet the respective quarters in (5.5) by at least $kappa Delta$.
  If both have $t_y < 1 \/ 8$, the lower-quarter outer interval ends below $j_(-) + 3 Delta \/ 8$,
    and the upper-quarter interval starts above $j_(-) + 5 Delta \/ 8$.
    Indeed each meets its quarter but overlaps $J$ in length less than $Delta \/ 8$;
    the assertion also holds for intervals extending beyond $J$.
    Their distance exceeds $Delta \/ 4$, making the node good. Otherwise one candidate has $t_y gt.eq 1 \/ 8$.
    Apply this at radial values spaced by $\( H + 3 \) r$: there are at least $c_H a^D$ such values,
    and the resulting centers are more than $H r$ apart. ◻
]

At a node that is not good, put uniform probabilities on the candidates in 17. For large $D$ they satisfy (5.7):
  indeed, $p_y lt.eq c_H^(- 1) a^(- D)$ and $t_y gt.eq 1 \/ 8$, while $gamma \, b_(*) < 1$.

=== 5.3 The capacity estimate <the-capacity-estimate>

It remains to construct transitions satisfying (5.7). A single subdivision depth $D$ must work even when a node’s
  interval $J$ is arbitrarily short. We therefore integrate over $J$ before choosing $D$;
  its length will cancel from the estimate.

#thm([Lemma 18.])[
  (Separated capacity).  #emph[For sufficiently large $D$, uniformly over all nodes,
    there is an $H r$-separated subset $Y' subset Y$ such that
#[#set math.equation(numbering: n => "(5.9)")
 $ sum_(y in Y') min { a^(- gamma D) t_y \, a^(tau D) t_y^2 } gt.eq 1 . $ <eq:capacity>]

]
] <lem:separated-capacity>

#proof[
  Join two candidates in a graph when their distance is at most $H r$.
    Packing bounds its degree, so graph coloring partitions $Y$ into at most $C_H$ separated classes,
    with $C_H$ independent of $D$. If the conclusion fails, then
  #[#set math.equation(numbering: n => "(5.10)")
   $ sum_(y in Y) min { a^(- gamma D) t_y \, a^(tau D) t_y^2 } < C_H . $ <eq:failed-capacity>]
  Call $y$ #emph[large] when $t_y gt.eq a^(- \( tau + gamma \) D)$ and #emph[small] otherwise.
    On large candidates the minimum is linear, so
  #[#set math.equation(numbering: n => "(5.11)")
   $ sum_(upright("large ") y) t_y lt.eq C_H a^(gamma D) . $ <eq:large-total-length>]
  We will test levels at an intermediate radius $s$, larger than the child radius $r$ and smaller than the parent
    radius $R$. This provides more radial tests than the large ranges can occupy.
    At the same time, it lets us detect the remaining levels with a modulus cost at the relative scale $r \/ s$.
  #emph[Remove the large ranges.] Set $D' = ceil.l beta D ceil.r$ and $s = a^(- D') R$.
    For large $D$, $0 < D' < D$ and $s < R \/ 4$. Choose $s$-spaced radial bins $cal(B)$ in
    $\[ \( A + 1 \) R \, \( B_0 - 1 \) R \]$, so $\# cal(B) asymp a^(D')$.
    On $cal(B) times J$ use counting measure times Lebesgue measure. Mark $\( b \, t \)$ if a large candidate satisfies
  $ \| d \( x \, y \) - b \| lt.eq 5 s \, wide t in I_y^(upright("out")) . $
  Each candidate meets at most 11 bins. By (5.4) and (5.11),
    the marked measure is at most $C C_H a^(gamma D) Delta$. Since $gamma < beta$, the unmarked measure is at least
  #[#set math.equation(numbering: n => "(5.12)")
   $ c a^(D') Delta . $ <eq:unmarked-mass>]
  #emph[Detect the remaining levels by modulus.] Take a maximal $s$-separated set $cal(Z)_s$ in
    $cal(A)_x \( R \)$; its radius-$s$ balls cover that annulus, and it has at most $C a^(Q D')$ points.
    Expand at each $z in cal(Z)_s$ at depth $k + D'$ by $h_z$.
    Put $q = r \/ s = a^(- \( D - D' \))$, and take macroscopic admissible weights $omega_xi$, $xi in T_(D - D')$,
    of squared mass $M \( D - D' \)$. For fixed $C_T > 2 + C_E$, define
  $ sigma_y^z =
    cases(delim: "{", sum_(xi : med d \( xi \, h_z y \) lt.eq C_T q) omega_xi \, & d \( y \, z \) lt.eq 3 s \,,
    0 \, & d \( y \, z \) > 3 s \,) wide sigma_y = sum_(z in cal(Z)_s) sigma_y^z . $
  Within $overline(B) \( z \, 3 s \)$ the candidate images are separated by a fixed multiple of $q$.
    Thus every sum has boundedly many terms and every target weight is charged boundedly many times.
    Thus $sum_y \( sigma_y^z \)^2 lt.eq C M \( D - D' \)$ for each $z$.
    Also each $y$ lies within $3 s$ of boundedly many auxiliary centers. Packing and Cauchy–Schwarz give
  #[#set math.equation(numbering: n => "(5.13)")
   $ sum_y sigma_y^2 lt.eq C a^(Q D') M \( D - D' \) . $ <eq:capacity-transfer-energy>]
  Fix an unmarked $\( b \, t \)$. Choose $w in C_t$ on the radius-$b$ sphere and $z in
    cal(Z)_s$ with $d \( w \, z \) lt.eq s$. The diameter bound gives a point of $C_t$ outside
    $overline(B) \( w \, 2 s \)$. Join these points in the $r \/ 4$-neighborhood of $C_t$, by 4,
    and stop at the first radius-$s$ hit about $w$. The resulting path $pi$ has diameter at least $s$ and lies in
    $overline(B) \( w \, s \) subset overline(B) \( z \, 2 s \)$.
    The scale-$s$ expansion $h_z$ therefore makes it macroscopic by the choice of $d_0$ in 2.
  The radial bin lies between $\( A + 1 \) R$ and $\( B_0 - 1 \) R$, while $s < R \/ 4$.
    Thus every point of $pi$ lies between radii $\( A + 3 \/ 4 \) R$ and $\( B_0 - 3 \/ 4 \) R$ about $x$.
    In particular it lies in the candidate annulus and has a candidate center within distance $r$.
    The same fixed source margin places every level point within $r \/ 4$ of $pi$ in $K^(+) subset U$.
    On these points the scalar-limit property gives $u = t$, even though it does not assert this identity on parts
    of $C_t$ outside $U$.
  For a target cell meeting $h_z pi$, choose a preimage hit $v in pi$ and $y in Y$ with $d \( y \, v \) lt.eq r$.
    Then $d \( y \, z \) < 3 s$. If $xi$ is the target cell’s center,
    (2.2) gives $d \( xi \, h_z y \) < \( 2 + C_E \) q < C_T q$, so its weight occurs in $sigma_y^z$.
    A point of $C_t$ is within $r \/ 4$ of $v$, hence within $5 r \/ 4 < c_0 r$ of $y$.
    The preceding interior check gives $t in I_y^(upright("out"))$.
    Since $\| d \( x \, y \) - b \| lt.eq s + r < 5 s$, unmarkedness makes $y$ small. Admissibility therefore yields
  #[#set math.equation(numbering: n => "(5.14)")
   $ sum_(upright("small ") y : med \| d \( x \, y \) - b \| lt.eq 5 s) sigma_y
     upright(bold(1))_(I_y^(upright("out"))) \( t \) gt.eq 1 quad
     upright("on every unmarked pair") . $ <eq:unmarked-indicator>]
  The unmarked levels now have an admissible detection weight supported on small candidates.
    We compare its squared mass with the surviving amount of level parameter.
  #emph[Compare the energies.] Integrating (5.14), using bounded bin multiplicity, gives
  $ c a^(D') Delta lt.eq C Delta sum_(upright("small ") y) sigma_y t_y . $
  Only finitely many closed-interval indicators are integrated;
    no measurable selection of continua or paths is needed, and singleton ranges contribute zero.
    Cancel $Delta > 0$. Cauchy–Schwarz and (5.13) imply
  #[#set math.equation(numbering: n => "(5.15)")
   $ sum_(upright("small ") y) t_y^2 gt.eq frac(c a^(- \( Q - 2 \) D'), M \( D - D' \)) . $ <eq:small-square-capacity>]
  Subexponential growth gives $M \( D - D' \) lt.eq a^(tau D \/ 4)$ for large $D$:
    first bound $M \( j \) lt.eq C a^(tau j \/ 8)$ and then absorb $C$ by increasing $D$.
    Since $D' lt.eq beta D + 1$ and $\( Q - 2 \) beta < tau \/ 4$,
  $ sum_(upright("small ") y) a^(tau D) t_y^2 gt.eq c a^(\[ 3 tau \/ 4 - \( Q - 2 \) beta \] D) gt.eq
    c a^(tau D \/ 2) . $
  On small candidates this is exactly the capacity, contradicting (5.10).
    Every threshold for $D$ is uniform over nodes. ◻
]

Fix such a $D$. At each good node, divide the positive capacities on a set $Y'$ from 18 by their sum.
  These probabilities satisfy (5.7). At the remaining nodes use the uniform rule above.
  Every positive transition retains a nonempty open child interval $J_y subset J$.

=== 5.4 Common target patterns <common-target-patterns>

The probabilities are now fixed. We verify the additional geometric information carried by a good node:
  its two source variations expand into a pair of balls chosen from a finite list, with separated range intervals.
  The list depends on the fixed $D$, but not on the node’s generation or interval length.

Fix a node’s expansion $h = v^(- 1)$ when constructing it.
  At a good node, join the extrema of each inner ball by a path in $B \( y^plus.minus \, c_(upright("in")) r \)$.
  Each path has endpoint variation at least $kappa Delta$. Its points lie at distance at least $\( A - 2 \)
  R$ from $x$, so (2.2) puts its image within $c_(upright("pat")) theta \/ 2$ of $h y^plus.minus$.
  Conversely, write $D_w = max { R \, d \( x \, w \) }$. If $d \( y \, z \) gt.eq c_0 r$, then $D_z lt.eq D_y +
  d \( y \, z \)$ and monotonicity of $s \/ \( D_y + s \)$ give

$ d \( h y \, h z \) gt.eq frac(c_E R c_0 r, D_y \( D_y + c_0 r \)) gt.eq
  frac(c_E c_0 theta, \( B_0 + 2 \)^2) > 12 c_(upright("pat")) theta . $

Thus

#[#set math.equation(numbering: n => "(5.16)")
 $ overline(B) \( h y \, 10 c_(upright("pat")) theta \) subset h \( B \( y \, c_0 r \) \) . $ <eq:pattern-containment>]

Choose a fixed finite $c_(upright("pat")) theta$-net in $Z$.
  For each $h y^plus.minus$ choose a net point within $c_(upright("pat")) theta$ and take the closed radius-$3
  c_(upright("pat")) theta$ ball about it. The ordered pair $\( cal(B)^(-) \, cal(B)^(+) \)$ is the node’s
  #emph[pattern]. Each ball contains its path image and lies in the corresponding outer source-ball image.
  Consequently, for $u compose h^(- 1)$ the two whole-ball range intervals have distance at least $Delta \/ 4$,
  and each ball contains a path with endpoint variation at least $kappa Delta$.
  There are finitely many patterns, independently of depth.

=== 5.5 The tree and its flow <the-tree-and-its-flow>

Choose $k_0$ so large that $R_0 = r_(k_0)$ satisfies all the source-scale conditions above and

$ 2 \( B_0 + 1 \) R_0 < epsilon.alt_0 \/ 2 \, wide \( B_0 + 2 \) R_0 < d_1 \/ 2 . $

Non-local-constancy at $x_0$ supplies a nonempty open interval $J_0
  subset \( 0 \, 1 \)$ strictly inside the range on $overline(B) \( x_0 \, c_0 R_0 \)$.
  Write $Delta_0 = \| J_0 \|$ and construct the tree recursively, storing each node’s expansion and,
  at good nodes, its pattern.

A child moves by at most $\( B_0 + 1 \) R$ from a parent of scale $R$. Consequently all descendants stay within

#[#set math.equation(numbering: n => "(5.17)")
 $ frac(B_0 + 1, 1 - theta) R lt.eq 2 \( B_0 + 1 \) R $ <eq:descendant-displacement>]

of that parent, and all centers lie in $K$. Generation $n$ has scale $r_(k_0 + D n)$ and its centers are $H$ times
  that scale apart: this holds for siblings, while children of distinct parents of scale $R$ are separated by at least

$ \[ H - 2 \( B_0 + 1 \) \] R > H R \/ 2 > H theta R . $

At any level of scale $R$, (3.6) bounds $Delta_i^2$ by $C mu \( overline(B) \( x_i \, C_mu c_0 R \) \)$.
  These enlarged balls are disjoint because $H > 4 C_mu c_0$, and hence

#[#set math.equation(numbering: n => "(5.18)")
 $ sum_i Delta_i^2 lt.eq E_0 \, wide E_0 = C mu \( Z \) < oo . $ <eq:level-energy>]

Give the root probability 1 and let $P_i$ be the product of transitions to node $i$.
  Every level has total probability 1. If $i$ has generation $n$,
  let $m_i$ count its ancestors at generations $0 \, dots.h \, n - 1$ that are not good.
  Multiplying the transition bounds and telescoping the interval ratios yields

#[#set math.equation(numbering: n => "(5.19)")
 $ P_i lt.eq a^(- gamma D n) Delta_i / Delta_0 \, wide Delta_i^2 gt.eq
   Delta_0^2 P_i a^(D \( \( b_(*) + tau \) m_i - tau n \)) . $ <eq:flow>]

Conditionally, if $i$ is $m$ generations below $j$, nesting gives

#[#set math.equation(numbering: n => "(5.20)")
 $ P_i / P_j lt.eq a^(- gamma D m) Delta_i / Delta_j lt.eq a^(- gamma D m) . $ <eq:conditional-flow>]

#thm([Lemma 19.])[
  (Levels with substantial good mass).  #emph[Infinitely many generations have total probability at least $1 \/
    2$ on good nodes.]
] <lem:good-levels>

#proof[
  By (5.19), (5.18), and Jensen’s inequality,
  $ E_0 / Delta_0^2 gt.eq sum_i P_i a^(D \( \( b_(*) + tau \) m_i - tau n \)) gt.eq
    a^(D \( \( b_(*) + tau \) sum_i P_i m_i - tau n \)) . $
  Thus
  $ 1 / n sum_i P_i m_i lt.eq frac(tau, b_(*) + tau) + O \( 1 \/ n \) = 1 / 11 + O \( 1 \/ n \) . $
  Conservation of probability identifies the left side with the average bad mass over the first $n$ generations.
    If good mass were eventually less than $1 \/ 2$, that average would have lower limit at least $1 \/ 2$,
    a contradiction. ◻
]

#thm([Proposition 4.])[
  (Properties of the flow).  #emph[The construction gives a fixed $D$ and a tree with generation-$n$ centers $H
    r_(k_0 + D n)$-separated and descendant displacement (5.17).
    Its nonempty value intervals are nested, its probabilities satisfy (5.19) and (5.20),
    and infinitely many levels have good mass at least $1 \/ 2$. Every node has a fixed expansion.
    Each good node has a pattern from a finite list of ordered target-ball pairs.
    For that expansion, each target ball contains a path with endpoint variation at least $kappa Delta_i$,
    their whole-ball range intervals have distance at least $Delta_i \/ 4$,
    and the balls lie in the images of the respective outer balls of radius $c_0 theta r_(k_0 + D n)$.]
] <prop:probability-flow>

== 6 Same-depth expansions and the measure comparison <sec:pairs>

We compare expansions at many nodes of a single generation.
  Almost every pair of punctures is sufficiently separated.
  A level-continuum argument then forces one of the two charts to spend a definite amount of oscillation near the
  other’s puncture. Pulling those neighborhoods back gives more total measure than their overlap permits.

#thm([Proposition 5.])[
  #emph[The moduli $M \( n \)$ cannot be unbounded while satisfying
$ limsup_(n arrow.r oo) M \( n \)^(1 \/ n) lt.eq 1 . $

]
] <prop:no-subexponential-records>

We prove this proposition through the pair comparison and counting estimates below.
  Fix the flow of 4, including $D$, and a compact neighborhood of its centers in $U$.
  Use the point $z_0$ chosen in the flow construction, a positive distance from that neighborhood.
  At generation $n$ write

$ k = k_0 + D n \, wide R = a^(- k) \, wide p_i = h_i z_0 \, $

where $h_i = v_i^(- 1)$ is the expansion already chosen for node $i$. The centers $x_i$ are $H R$-separated, and

#[#set math.equation(numbering: n => "(6.1)")
 $ P_i lt.eq a^(- gamma D n) Delta_i / Delta_0 \, wide P_j / P_A lt.eq a^(- gamma D m) quad
   upright("if ") j upright(" lies ") m upright(" generations below ") A . $ <eq:pairs-flow-input>]

We use the arbitrarily large generations having good mass at least $1 \/ 2$, supplied by 19.

A good node has a pattern $\( cal(B)^(-) \, cal(B)^(+) \)$ from a fixed finite list.
  Each target ball contains a compact path with endpoint $u compose h_i^(- 1)$-variation at least $kappa Delta_i$,
  and lies in the image of its outer source ball. The two target range intervals have distance at least
  $Delta_i \/ 4$. Throughout, a #emph[range interval] means the interval between the minimum and maximum;
  metric balls need not be connected.

All geometric and counting constants below are independent of the generation, nodes, and approximating index $N$.
  Constants and thresholds in convergence statements may depend on a pair after it has been fixed.

=== 6.1 A probability class and separated punctures <a-probability-class-and-separated-punctures>

#thm([Lemma 20.])[
  (Bounded puncture multiplicity).  #emph[For every fixed $C > 0$, the balls ${ overline(B) \( p_i \, C R \) :
    i upright(" at generation ") n }$ have uniformly bounded multiplicity.]
] <lem:puncture-multiplicity>

#proof[
  Centers assigned to the same depth-$k$ vertex have mutual distance $O \( R \)$.
    Their $H R$-separation and 3 bound their number. If several puncture balls share a point,
    their punctures have mutual products at least $k - O_C \( 1 \)$.
    By (2.4) and 2, all corresponding inverse vertices lie in one bounded Cayley-graph ball.
    There are boundedly many such vertices, each with the bounded multiplicity just proved. ◻
]

There are at most $C a^(Q k)$ nodes. Discarding those with $P_i < a^(- 2 Q k)$ loses probability at most $C
  a^(- Q k)$, so the remaining good nodes have mass at least $1 \/ 3$ for large $n$.
  Partitioning by pattern and into the $O \( k \)$ dyadic probability classes gives a class $cal(I)$ with

#[#set math.equation(numbering: n => "(6.2)")
 $ P_(*) lt.eq P_i lt.eq 2 P_(*) quad \( i in cal(I) \) \, wide sum_(i in cal(I)) P_i gt.eq c / k . $ <eq:pairs-class>]

Writing $cal(N) = \| cal(I) \|$, we have

#[#set math.equation(numbering: n => "(6.3)")
 $ cal(N) P_(*) gt.eq frac(c, 2 k) . $ <eq:pairs-class-size>]

Also $P_i lt.eq a^(- gamma D n)$ by (6.1), so $cal(N) gt.eq c k^(- 1) a^(gamma D n) arrow.r oo$.
  We will use punctures separated at a scale $a^(- l)$ much larger than $R$.
  The final source-overlap estimate carries a factor $a^(Q l)$, so we arrange $Q l lt.eq gamma D n$. Put

$ zeta = gamma \/ Q \, wide m = floor.l zeta n floor.r \, wide l = D m . $

Both $l$ and $k - l$ tend to infinity.

#thm([Lemma 21.])[
  (Probability near a puncture).  #emph[For every generation-$n$ node $i$,
#[#set math.equation(numbering: n => "(6.4)")
 $ sum_(j upright(" at generation ") n\
d \( p_j \, p_i \) lt.eq a^(- l)) P_j lt.eq C a^(- gamma D m) . $ <eq:near-puncture-probability>]

]
] <lem:near-puncture-probability>

#proof[
  Fix an ancestor $A$ at generation $n - m$, whose depth is $k - l = k_0 + D \( n - m \)$.
    We claim that only boundedly many descendants $j$ have $d \( p_j \, p_i \) lt.eq a^(- l)$. Split a geodesic word
  $ v_j^(- 1) = w_j u'_j \, wide \| w_j \| = l \, wide \| u'_j \| = k - l . $
  The puncture condition and (2.4) give $\( p_j \| p_i \)_e gt.eq l - C$ and $\( v_j^(- 1) \| p_j \)_e gt.eq k -
    C$. Thus $w_j$ lies a bounded distance from the depth-$l$ point on a fixed ray to $p_i$,
    leaving boundedly many possibilities.
  Reversing and inverting #emph[the same word] gives the geodesic $v_j = \( u'_j \)^(- 1) w_j^(- 1)$.
    Its depth-$\( k - l \)$ prefix is therefore $\( u'_j \)^(- 1)$. Since
  $ d \( x_j \, x_A \) lt.eq 2 \( B_0 + 1 \) r_(k - l) \, $
  thinness and 2 put this prefix a bounded distance from the depth-$\( k - l \)$ point on a fixed ray to $x_A$.
    Hence $u'_j$ also has boundedly many possibilities. Their products determine boundedly many vertices $v_j$,
    and the first step of 20 bounds the nodes assigned to each.
    We count group elements here, so nonuniqueness of geodesic spellings causes no additional multiplicity.
    The source and inverse prefixes together account for the full word.
  Each such descendant has $P_j lt.eq P_A a^(- gamma D m)$ by (6.1).
    Sum first over these descendants and then over ancestors, whose probabilities sum to one. ◻
]

For each $i in cal(I)$, the fraction of its class with puncture distance at most $a^(- l)$ is bounded by

$ frac(C a^(- gamma D m), cal(N) P_(*)) lt.eq C k a^(- gamma D m) = o \( 1 \) . $

This includes the diagonal. Consequently at least $c cal(N)^2$ unordered pairs satisfy

#[#set math.equation(numbering: n => "(6.5)")
 $ d_(i j) := d \( p_i \, p_j \) > a^(- l) . $ <eq:far-pair>]

Call them #emph[far pairs]. Uniformly for these pairs, $R \/ d_(i j) lt.eq a^(- \( k - l \)) arrow.r 0$.

=== 6.2 Comparison on a compact common domain <comparison-on-a-compact-common-domain>

Let $K subset U$ contain all centers, with its closed $epsilon.alt$-neighborhood still in $U$.
  The upper puncture bound gives

#[#set math.equation(numbering: n => "(6.6)")
 $ d \( h_i y \, p_i \) gt.eq A_h R \/ 2 quad arrow.r.double quad d \( x_i \, y \) lt.eq D_y lt.eq
   2 C \/ A_h . $ <eq:exterior-preimage>]

Choose $A_h$ so that $2 C \/ A_h < epsilon.alt \/ 2$ and $A_h \/ 2 > 2 C \/ d_1$, and set

$ E_i = overline(B) \( p_i \, A_h R \) . $

Every $h_i C_(N \, t)$ reaches $B \( p_i \, A_h R \/ 2 \)$:
  the diameter bound supplies a source point at distance at least $d_1 \/ 2$ from $x_i$,
  whose image has puncture distance at most $2 C R \/ d_1$.

The target balls lie a uniform distance $delta_(*) > 0$ from $p_i$.
  Indeed, their preimages lie in the outer source balls, where $D_y lt.eq \( B_0 + 2 \) R$,
  so the lower puncture bound applies for large $n$. Because the pattern is shared,
  this holds for every $i in cal(I)$. For large $n$, uniformly for far pairs,

$ 2 A_h R < a^(- l) \, wide A_h R < delta_(*) \/ 2 . $

Thus $E_i \, E_j$ are disjoint, each lies compactly in the other’s transformed domain by (6.6),
  and the pattern balls avoid both. These thresholds are independent of $N$.

#thm([Lemma 22.])[
  (Pair alternative).  #emph[Every far pair at a sufficiently large generation has an endpoint $i$ satisfying
#[#set math.equation(numbering: n => "(6.7)")
 $ "osc"_(h_i^(- 1) E_j) u gt.eq kappa / 16 Delta_i . $ <eq:pair-alternative>]

]
] <lem:pair-alternative>

#proof[
  Write $F_i = u compose h_i^(- 1)$ and $F_j = u compose h_j^(- 1)$ on their open domains.
    If $"osc"_(E_i) F_j gt.eq Delta_j \/ 16$, endpoint $j$ qualifies. Here we use $kappa lt.eq 1$.
    Otherwise, one pattern ball $cal(B)^s$ has its $F_j$ range interval at distance at least $Delta_j \/
    16$ from that on $E_i$. Indeed, if neither did, the two pattern intervals would have distance less than $3
    Delta_j \/ 16$, contradicting their separation by $Delta_j \/ 4$.
  Node $i$ supplies a compact path $eta subset cal(B)^s$ with endpoint $F_i$-gap at least $kappa Delta_i$.
    Suppose $"osc"_(E_j) F_i < kappa Delta_i \/ 4$. Removing this latter range interval from the endpoint gap
    leaves a positive-length closed interval $I subset \( 0 \, 1 \)$ strictly between the endpoint values and a
    positive distance from the range on $E_j$. To obtain positive margins,
    choose a smaller closed interval inside one of the remaining open intervals.
    Its length need not be uniform over pairs.
  #emph[Fix the pair and $I$ before letting $N arrow.r oo$.] Put $F_(i \, N) = H_N compose
    h_i^(- 1)$ and $F_(j \, N) = H_N compose h_j^(- 1)$. The fixed range margins and local uniform convergence
    imply, for every $t in I$ and all sufficiently large $N$, that $h_i C_(N \, t)$ hits $eta$ and avoids $E_j$.
    It also reaches the inner $i$-puncture ball. For the first assertion,
    the endpoint values still strictly straddle all of $I$, so 8 applies to the preimage path.
    For the second, the range on $E_j$ remains disjoint from $I$.
    By 12, it has a subcontinuum $K_(N \, t)$ containing a hit on $eta$, meeting the sphere $d \( z \, p_i \) =
    A_h R$, and avoiding $B \( p_i \, A_h R \)$. It remains in the level $F_(i \, N) = t$ and avoids $E_j$.
    In particular,
  $ K_(N \, t) subset K_(i j) := Z \\ #scale(x: 120%, y: 120%)[\(] B \( p_i \, A_h R \) union B \( p_j \, A_h R \)
    #scale(x: 120%, y: 120%)[\)] subset.double h_i U ∩ h_j U . $
  Compact containment follows from (6.6) with half the radius.
    The sphere hit belongs to $E_i$; no identification of that sphere with the boundary of a metric ball is needed.
  Uniform convergence on $eta union E_i$ preserves the $F_j$ range gap,
    giving $"osc"_(K_(N \, t)) F_(j \, N) gt.eq Delta_j \/ 32$ uniformly for $t in I$.
    The finite-cell comparison, 11, now gives
  $ Delta_j / 32 \| I \| lt.eq sum_(q in T_N\
B \( q \, 2 r_N \) ∩ K_(i j) eq.not diameter) "osc"_(overline(B) \( q \, 2 r_N \)) F_(i \, N) thin
  "osc"_(overline(B) \( q \, 2 r_N \)) F_(j \, N) . $
  For large $N$ these closed cells lie in the common domain.
    Both squared oscillation sums tend to zero by 9, so Cauchy–Schwarz contradicts the positive left side.
    Therefore $"osc"_(E_j) F_i gt.eq kappa Delta_i \/ 4$, proving the alternative.
    The argument applies separately to every pair above the geometric threshold;
    no convergence rate uniform over pairs is required. ◻
]

=== 6.3 Cost balls and total multiplicity <cost-balls-and-total-multiplicity>

We now turn the pair alternative into a measure bound and control the overlap of the sets being charged.
  The two indices have distinct roles: with $i$ fixed, the target punctures control the number of partners $j$;
  at a source point, separation of the centers controls the possible indices $i$.
  Both estimates will apply to the enlarged balls required by (3.6).

For an ordered far pair put $z_(i j) = h_i^(- 1) p_j$. The relevant source scales are

$ upright("puncture denominator ") D_(z_(i j)) & asymp R \/ d_(i j)\
upright("radius of the charged neighborhood") & R^2 \/ d_(i j)^2 . $

The radius divided by the denominator is $O \( R \/ d_(i j) \) arrow.r 0$.
  This separation of scales is what allows a fixed enlargement of the charged neighborhood without losing control
  of its image.

If $y in h_i^(- 1) E_j$, then $d \( h_i y \, p_i \) gt.eq d_(i j) - A_h R gt.eq d_(i j) \/ 2$, whence $D_y lt.eq
  C R \/ d_(i j)$. These points approach $x_i$ uniformly, so the two-sided puncture bound applies and gives

#[#set math.equation(numbering: n => "(6.8)")
 $ D_(z_(i j)) asymp R \/ d_(i j) . $ <eq:cost-denominator>]

The lower expansion bound and $d \( h_i y \, p_j \) lt.eq A_h R$ then give $d \( y \, z_(i j) \) lt.eq
  C R^2 \/ d_(i j)^2$. Fixing a sufficiently large $C_2$, put $s_(i j) = C_2 R^2 \/ d_(i j)^2$; thus

#[#set math.equation(numbering: n => "(6.9)")
 $ h_i^(- 1) E_j subset.eq overline(B) \( z_(i j) \, s_(i j) \) . $ <eq:cost-containment>]

Choose the enlargement constant $C_mu$ in (3.6) uniformly on a compact neighborhood of the centers and define

$ cal(D)_(i j) = overline(B) \( z_(i j) \, C_mu s_(i j) \) . $

Their centers stay in this neighborhood and their radii tend uniformly to zero. If $i$ satisfies 22, (3.6) gives

#[#set math.equation(numbering: n => "(6.10)")
 $ mu \( cal(D)_(i j) \) gt.eq c kappa^2 Delta_i^2 . $ <eq:cost-lower-bound>]

The enlarged balls still have small images. Indeed, $D_y$ is $1$-Lipschitz and

$ frac(C_mu s_(i j), D_(z_(i j))) lt.eq C R / d_(i j) lt.eq C a^(- \( k - l \)) arrow.r 0 . $

Thus $D_y asymp D_(z_(i j))$ on $cal(D)_(i j)$, and the upper expansion bound yields

#[#set math.equation(numbering: n => "(6.11)")
 $ h_i cal(D)_(i j) subset.eq overline(B) \( p_j \, C_3 R \) . $ <eq:cost-image>]

Figure 2 shows the charged neighborhood and the image control that survives the fixed enlargement.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.75, 4.95), [Source])
  content((11.4, 4.95), [Target])
  circle((3.25, 2.8), radius: 1.1, fill: rgb("#f5f7f8"), stroke: none)
  circle((3.25, 2.8), radius: 1.1, stroke: (paint: rgb("#36657d"), thickness: 0.8pt, cap: "round", join: "round"))
  circle((3.25, 2.8), radius: 0.52, stroke: (paint: rgb("#36657d"), thickness: 0.8pt, cap: "round", join: "round", dash: "dashed"))
  content((3.25, 4), [#text(fill: rgb("#36657d"))[#text(size: 9pt)[$cal(D)_(i j)$]]], anchor: "south", padding: 0.1176cm)
  circle((0.55, 2.8), radius: 0.0635, fill: rgb("#4d4d4d"), stroke: none)
  content((0.55, 2.54), [#text(size: 9pt)[$x_i$]], anchor: "north", padding: 0.1176cm)
  line((3.25, 2.73), (3.25, 1.47), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round"))
  circle((3.25, 2.8), radius: 0.0635, fill: rgb("#36657d"), stroke: none)
  content((3.25, 1.37), [#text(size: 9pt)[$z_(i j)$]], anchor: "north", padding: 0.1176cm)
  content((2.75, 0.57), [#text(size: 9pt)[$h_i^(-1)E_j subset.eq overline(B) (z_(i j),s_(i j))$]])
  content((2.75, 0.05), [#text(size: 9pt)[$s_(i j) asymp R^2"/"d_(i j)^(thin 2)$]])
  line((5.55, 2.8), (7.25, 2.8), stroke: (paint: rgb("#262626"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#262626"))))
  content((6.4, 2.976), [#text(size: 9pt)[$h_i$]], anchor: "south", padding: 0.1176cm)
  circle((9, 2.8), radius: 0.5, fill: rgb("#f9f5f1"), stroke: none)
  circle((13.2, 2.8), radius: 0.5, fill: rgb("#f9f5f1"), stroke: none)
  circle((9, 2.8), radius: 0.5, stroke: (paint: rgb("#a46f30"), thickness: 0.8pt, cap: "round", join: "round"))
  circle((13.2, 2.8), radius: 0.5, stroke: (paint: rgb("#a46f30"), thickness: 0.8pt, cap: "round", join: "round"))
  circle((13.2, 2.8), radius: 1.1, stroke: (paint: rgb("#36657d"), thickness: 0.8pt, cap: "round", join: "round", dash: "dashed"))
  content((9, 3.57), [#text(fill: rgb("#a46f30"))[#text(size: 9pt)[$E_i$]]], anchor: "south", padding: 0.1176cm)
  content((14.5, 3.65), [#text(fill: rgb("#a46f30"))[#text(size: 9pt)[$E_j$]]], anchor: "west", padding: 0.1176cm)
  line((14.38, 3.57), (13.51, 3.19), stroke: (paint: rgb("#bb9364"), thickness: 0.4pt, cap: "round", join: "round"))
  line((9, 2.73), (9, 1.47), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round"))
  line((13.2, 2.73), (13.2, 1.47), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round"))
  circle((9, 2.8), radius: 0.0635, fill: rgb("#a46f30"), stroke: none)
  circle((13.2, 2.8), radius: 0.0635, fill: rgb("#a46f30"), stroke: none)
  content((9, 1.37), [#text(size: 9pt)[$p_i$]], anchor: "north", padding: 0.1176cm)
  content((13.2, 1.37), [#text(size: 9pt)[$p_j$]], anchor: "north", padding: 0.1176cm)
  line((9, 0.76), (13.2, 0.76), stroke: (paint: rgb("#262626"), thickness: 0.4pt, cap: "round", join: "round"), mark: (start: (symbol: ">>", fill: rgb("#262626")), end: (symbol: ">>", fill: rgb("#262626"))))
  content((11.1, 0.6542), [#text(size: 9pt)[$d_(i j) gt.double R$]], anchor: "north", padding: 0.1176cm)
  content((11.1, -0.3), [#text(fill: rgb("#36657d"))[#text(size: 9pt)[$h_i cal(D)_(i j) subset.eq overline(B) (p_j,C_3R)$]]])
})],
  caption: [Figure 2: The measure cost of a far pair. The dashed source ball contains $h_i^(- 1) E_j$ and has radius $s_(i j) asymp R^2 \/ d_(i j)^2$. Its fixed enlargement $cal(D)_(i j)$, drawn solid, still maps into the dashed target ball of radius $C_3 R$. Here $p_i = h_i z_0$, $z_(i j) = h_i^(- 1) p_j$, and $E_i \, E_j$ are the solid puncture balls of radius $A_h R$. The circles are schematic; no connectedness or boundary regularity of metric balls is assumed. ],
) <fig:pair-cost>

For fixed $i$, 20 therefore bounds the multiplicity of $cal(D)_(i j)$ as $j$ varies. Also

#[#set math.equation(numbering: n => "(6.12)")
 $ cal(D)_(i j) subset.eq overline(B) \( x_i \, C_4 R a^l \) \, $ <eq:cost-source>]

because $d \( x_i \, z_(i j) \) lt.eq C R \/ d_(i j)$ and the cost radius is $o \( R \/ d_(i j) \)$.
  The $H R$-separation of the $x_i$ and 3 bound the multiplicity of these larger balls by $C a^(Q l)$.

#proof[
  #emph[Conclusion of the proof of 5.] Assign each unordered far pair to a qualifying endpoint.
    At any point, (6.12) allows only $C a^(Q l)$ paying indices $i$,
    and (6.11) allows boundedly many partners for each. Integrating this multiplicity bound gives
  #[#set math.equation(numbering: n => "(6.13)")
   $ sum_({ i \, j } upright(" far, assigned to ") i) mu \( cal(D)_(i j) \) lt.eq
     C a^(Q l) mu \( Z \) . $ <eq:cost-total-upper>]
  This counts the enlarged balls directly and uses no invariance of $mu$.
    The assignment may be arbitrary when both endpoints qualify:
    all lower bounds hold for either endpoint, and the multiplicity estimate already counts every possible ordered
    contribution.
  Conversely, every paying endpoint satisfies
  $ Delta_i^2 gt.eq Delta_0^2 a^(2 gamma D n) P_i^2 gt.eq Delta_0^2 a^(2 gamma D n) P_(*)^2 . $
  There are at least $c cal(N)^2$ far pairs, so (6.10) and (6.3) give total cost
  #[#set math.equation(numbering: n => "(6.14)")
   $ c cal(N)^2 kappa^2 Delta_0^2 a^(2 gamma D n) P_(*)^2 gt.eq c' k^(- 2) a^(2 gamma D n) . $ <eq:cost-total-lower>]
  Since $kappa \, Delta_0 > 0$ are fixed and $Q l = Q D floor.l gamma n \/ Q floor.r lt.eq gamma D n$,
    comparison with (6.13) yields
  $ a^(gamma D n) lt.eq C k^2 . $
  This contradicts $k = k_0 + D n$, excluding the unbounded subexponential case. ◻
]

== 7 Completion of the proof <sec:completion>

#proof[
  If $M \( n \)$ were unbounded, the record selection of 3 would give either exponential records, excluded by 3,
    or subexponential growth, excluded by 5. Thus $sup_n M \( n \) < oo$.
    2 uniformizes the boundary, and 1 supplies the proper cocompact action with finite kernel. ◻
]

== 8 Consequences <sec:consequences>

#thm([Corollary 1.])[
  #emph[If $G$ is a torsion-free hyperbolic group and $partial G$ is homeomorphic to $bb(S)^2$,
    then $G$ is the fundamental group of a closed hyperbolic three-manifold.]
] <cor:torsion-free>

#proof[
  Point stabilizers in a proper action are finite, hence trivial when $G$ is torsion-free.
    Thus the action in 1 is free, and $bb(H)^3 \/ G$ is a closed hyperbolic three-manifold with fundamental group
    $G$. The manifold may be nonorientable. ◻
]

#thm([Corollary 2.])[
  (Virtual structure in the torsion-free case).  #emph[Let $G$ be a torsion-free hyperbolic group with $partial
    G$ homeomorphic to $bb(S)^2$. Some finite-index subgroup of $G$ is isomorphic to $pi_1 \( Sigma \) times.r
    bb(Z)$ for a closed connected orientable surface $Sigma$.
    In particular, $G$ has positive virtual first Betti number.
    Moreover, $G$ is virtually compact special and residually finite.]
] <cor:virtual-structure>

#proof[
  Let $M^(+)$ be the orientation cover of the closed hyperbolic manifold in 1,
    using the manifold itself when it is orientable, and let $G^(+) = pi_1 \( M^(+) \)$.
    Thus $G^(+)$ is normal of index at most two in $G$. Agol’s virtual-fibering theorem [1] Theorem 9.2 gives a
    connected finite cover $N$ of $M^(+)$ fibering over the circle with closed connected orientable fiber $Sigma$.
    The fibration sequence gives $pi_1 \( N \) tilde.equiv pi_1 \( Sigma \) times.r bb(Z)$,
    with action induced by the monodromy, and its surjection onto $bb(Z)$ gives $b_1 \( pi_1 \( N \) \) gt.eq 1$.
  Bergeron–Wise’s cubulation theorem [5] Theorem 5.3 gives a proper cocompact action of $G^(+)$ on a CAT(0) cube
    complex, free because $G^(+)$ is torsion-free. Agol’s virtual-special theorem [1] Theorem 1.1 then gives a
    finite-index subgroup of $G^(+)$ with compact special quotient, so $G$ is virtually compact special.
    Agol’s separability corollary [1] Corollary 1.3, applied to the trivial subgroup,
    also makes $G^(+)$ residually finite. The finite quotient $G \/
    G^(+)$ and intersections of the finitely many $G$-conjugates of finite-index normal subgroups of $G^(+)$ then
    separate every nontrivial element of $G$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[I.~Agol, The virtual Haken conjecture, with an appendix by I.~Agol, D.~Groves, and J.~Manning,
  #emph[Doc. Math.] #strong[18] (2013), 1045--1087. #link("https://doi.org/10.4171/DM/421")[doi:10.4171/DM/421].]
#bibitem([2])[L.~Ahlfors and L.~Bers, Riemann's mapping theorem for variable metrics, #emph[Ann.
  of Math.] (2) #strong[72] (1960), 385--404. #link("https://doi.org/10.2307/1970141")[doi:10.2307/1970141].]
#bibitem([3])[N.~Albin and P.~Poggi-Corradini, Minimal subfamilies and the probabilistic interpretation for
  modulus on graphs, #emph[J. Anal.] #strong[24] (2016), 183--208.
  #link("https://doi.org/10.1007/s41478-016-0002-9")[doi:10.1007/s41478-016-0002-9].]
#bibitem([4])[K.~Astala, T.~Iwaniec, and G.~Martin, #emph[Elliptic Partial Differential Equations and
  Quasiconformal Mappings in the Plane], Princeton Mathematical Series 48, Princeton University Press, 2009.]
#bibitem([5])[N.~Bergeron and D.~T. Wise, A boundary criterion for cubulation, #emph[Amer. J.
  Math.] #strong[134] (2012), 843--859. #link("https://doi.org/10.1353/ajm.2012.0020")[doi:10.1353/ajm.2012.0020].]
#bibitem([6])[M.~Bonk and B.~Kleiner, Quasisymmetric parametrizations of two-dimensional metric spheres,
  #emph[Invent. Math.] #strong[150] (2002), 127--183.
  #link("https://doi.org/10.1007/s00222-002-0233-z")[doi:10.1007/s00222-002-0233-z].]
#bibitem([7])[M.~Bonk and B.~Kleiner, Conformal dimension and Gromov hyperbolic groups with 2-sphere boundary,
  #emph[Geom. Topol.] #strong[9] (2005), 219--246.
  #link("https://doi.org/10.2140/gt.2005.9.219")[doi:10.2140/gt.2005.9.219].]
#bibitem([8])[M.~Bourdon and B.~Kleiner, Combinatorial modulus, the combinatorial Loewner property,
  and Coxeter groups, #emph[Groups Geom. Dyn.] #strong[7] (2013), 39--107.
  #link("https://doi.org/10.4171/GGD/177")[doi:10.4171/GGD/177].]
#bibitem([9])[M.~R. Bridson and A.~Haefliger, #emph[Metric Spaces of Non-Positive Curvature],
  Grundlehren der mathematischen Wissenschaften 319, Springer, 1999.
  #link("https://doi.org/10.1007/978-3-662-12494-9")[doi:10.1007/978-3-662-12494-9].]
#bibitem([10])[J.~W. Cannon, The combinatorial Riemann mapping theorem, #emph[Acta Math.] #strong[173] (1994),
  155--234. #link("https://doi.org/10.1007/BF02398434")[doi:10.1007/BF02398434].]
#bibitem([11])[J.~W. Cannon, W.~J. Floyd, and W.~R. Parry, Squaring rectangles:
  the finite Riemann mapping theorem, in #emph[The Mathematical Legacy of Wilhelm Magnus:
  Groups, Geometry and Special Functions], Contemporary Mathematics 169, American Mathematical Society, 1994,
  133--212. #link("https://personal.math.vt.edu/floyd/research/papers/mageps.pdf")[Author text].]
#bibitem([12])[J.~W. Cannon, W.~J. Floyd, and W.~R. Parry, Sufficiently rich families of planar rings, #emph[Ann.
  Acad. Sci. Fenn. Math.] #strong[24] (1999), 265--304.
  #link("https://www.acadsci.fi/mathematica/Vol24/cannon.pdf")[Journal text].]
#bibitem([13])[J.~W. Cannon, W.~J. Floyd, and W.~R. Parry, Finite subdivision rules, #emph[Conform. Geom.
  Dyn.] #strong[5] (2001), 153--196.
  #link("https://doi.org/10.1090/S1088-4173-01-00055-8")[doi:10.1090/S1088-4173-01-00055-8].]
#bibitem([14])[J.~W. Cannon and E.~L. Swenson, Recognizing constant curvature discrete groups in dimension 3,
  #emph[Trans. Amer. Math. Soc.] #strong[350] (1998), 809--849.
  #link("https://doi.org/10.1090/S0002-9947-98-02107-2")[doi:10.1090/S0002-9947-98-02107-2].]
#bibitem([15])[D.~Groves, P.~Haïssinsky, J.~F. Manning, D.~Osajda, A.~Sisto, and G.~S.
  Walsh, Drilling hyperbolic groups, preprint, 2026. #link("https://arxiv.org/abs/2406.14667v2")[arXiv:2406.14667v2].]
#bibitem([16])[P.~Haïssinsky, Hyperbolic groups with planar boundaries, #emph[Invent.
  Math.] #strong[201] (2015), 239--307.
  #link("https://doi.org/10.1007/s00222-014-0552-x")[doi:10.1007/s00222-014-0552-x].]
#bibitem([17])[J.~Heinonen and P.~Koskela, Definitions of quasiconformality, #emph[Invent.
  Math.] #strong[120] (1995), 61--79. #link("https://doi.org/10.1007/BF01241122")[doi:10.1007/BF01241122].]
#bibitem([18])[J.~Kahn and V.~Marković, Immersing almost geodesic surfaces in a closed hyperbolic three manifold,
  #emph[Ann. of Math.] (2) #strong[175] (2012), 1127--1190.
  #link("https://doi.org/10.4007/annals.2012.175.3.4")[doi:10.4007/annals.2012.175.3.4].]
#bibitem([19])[V.~Marković, Criterion for Cannon's conjecture, #emph[Geom. Funct.
  Anal.] #strong[23] (2013), 1035--1061.
  #link("https://doi.org/10.1007/s00039-013-0228-5")[doi:10.1007/s00039-013-0228-5].]
#bibitem([20])[P.~Pansu, Dimension conforme et sphère à l'infini des variétés à courbure négative, #emph[Ann.
  Acad. Sci. Fenn. Ser. A I Math.] #strong[14] (1989), 177--212.
  #link("https://doi.org/10.5186/aasfm.1989.1424")[doi:10.5186/aasfm.1989.1424].]
#bibitem([21])[K.~Rajala, Uniformization of two-dimensional metric surfaces, #emph[Invent.
  Math.] #strong[207] (2017), 1301--1375.
  #link("https://doi.org/10.1007/s00222-016-0686-0")[doi:10.1007/s00222-016-0686-0].]
#bibitem([22])[O.~Schramm, Square tilings with prescribed combinatorics, #emph[Israel J.
  Math.] #strong[84] (1993), 97--118. #link("https://doi.org/10.1007/BF02761693")[doi:10.1007/BF02761693].]
#bibitem([23])[D.~Sullivan, On the ergodic theory at infinity of an arbitrary discrete group of hyperbolic
  motions, in #emph[Riemann Surfaces and Related Topics: Proceedings of the 1978 Stony Brook Conference],
  I.~Kra and B.~Maskit, eds., Annals of Mathematics Studies 97, Princeton University Press, 1981, 465--496.
  #link("https://doi.org/10.1515/9781400881550-035")[doi:10.1515/9781400881550-035].]
#bibitem([24])[P.~Tukia, On two-dimensional quasiconformal groups, #emph[Ann. Acad. Sci. Fenn. Ser.
  A I Math.] #strong[5] (1980), 73--78. #link("https://doi.org/10.5186/aasfm.1980.0530")[doi:10.5186/aasfm.1980.0530].]
