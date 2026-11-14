#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[No bigeodesics in planar first-passage percolation]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

First-passage percolation, introduced by Hammersley and Welsh [12],
  equips a lattice with a random metric by assigning independent passage times to its edges.
  A basic question asks whether this metric can contain a doubly infinite minimizing path.
  Such a path, called a #emph[bigeodesic], is a random analogue of a complete minimizing geodesic in a noncompact
  metric space. The question was attributed to Furstenberg by Kesten [16] Remark 9.22.
  The planar no-bigeodesics conjecture asserts that bigeodesics are absent for iid continuous edge-weight laws;
  see [10] Conjecture 1 and the discussion preceding it. We prove the conjecture under the minimum-of-four
  second-moment assumption.

Let $cal(E)$ denote the unoriented nearest-neighbor edges of $bb(Z)^2$.
  Give these edges independent weights $t_e$ with common Borel probability law $G$ on $\[ 0 \, oo \)$.
  For vertices $x \, y$, let $T \( x \, y \)$ be the infimum of the costs of finite nearest-neighbor walks from
  $x$ to $y$, with each edge traversal charged its weight.

#thm([Theorem 1.1.])[
  #emph[Suppose that $G$ has no atoms and that, for independent $X_1 \, X_2 \, X_3 \, X_4$ with law $G$,
#[#set math.equation(numbering: n => "(1)")
 $ bb(E) #h(-0.16667em) [min { X_1 \, X_2 \, X_3 \, X_4 }^(thin 2)] < oo . $ <eq:minimum-moment>]

 Then, with probability one, there is no sequence $\( v_i \)_(i in bb(Z))$ of pairwise distinct vertices with
   consecutive vertices adjacent and
$ sum_(k = i)^(j - 1) t_({ v_k \, v_(k + 1) }) = T \( v_i \, v_j \) wide upright("for every ") i < j . $

]
] <thm:main>

The conclusion excludes all bigeodesics in one probability-one event.
  In particular, an end direction may depend on the environment.
  The law $G$ may be singular continuous or have bounded support, and $bb(E) t_e$ may be infinite.
  We assume no differentiability, strict convexity, or curvature of the limit shape.
  Theorem 1 resolves the planar no-bigeodesics conjecture positively in the class (1);
  it does not assert the moment-free formulation.

=== Background <background>

The study of infinite geodesics and Busemann functions developed through work of Newman [18], Hoffman [13,14],
  and the stationary constructions of Damron and Hanson [9].
  Directional results connect geodesics to the geometry of the limit shape.
  Licea and Newman proved coalescence for each direction in a deterministic set of full Lebesgue measure and
  excluded bigeodesics whose two end-directions are prescribed in that set [17];
  see also [10] Theorem 3.1 and Remark 2 after Theorem 1. This coalescence result requires no curvature
  assumption. The complementary assertion that every ray has a direction and that rays exist in every direction
  was established by Newman under an exponential moment and uniform curvature [18] Theorem 2.1.
  Damron and Hanson subsequently obtained one-end exclusions in fixed tangent-contact sectors under local
  differentiability assumptions [10] Theorem 1. Their full iid hypothesis A1$'$ already allows (1);
  the distinction here is the absence of shape assumptions and the simultaneous treatment of every possible path.

Wehr and Woo excluded bigeodesics in the half-plane restricted metric under a finite individual-edge mean [19].
  Auffinger, Damron, and Hanson removed that moment assumption for continuous iid weights [4] Appendix C and
  proved coalescence and finite backward clusters for the associated boundary-limit geodesic forest [4]
  Theorem 1.5. Brito, Damron, and Hanson proved the absence of doubly infinite directed paths in geodesic graphs
  obtained as limits of point-to-hyperplane constructions in a fixed direction [6].
  Their iid hypothesis also gives (1) in two dimensions, but their selected graphs need not contain every geodesic
  of the metric. Alexander proved simultaneous absence of bigeodesics under additional exponential-moment,
  uniform-curvature, and quantitative fluctuation assumptions [3].

Ahlberg and Hoffman developed a structural theory of random coalescing geodesics that assigns an asymptotically
  linear Busemann function to every ray, without imposing shape regularity [2].
  Their results also give uniqueness, coalescence, and backward finiteness for each fixed functional in a
  deterministic closed set. These conclusions, stated in 4, are the structural inputs to our proof.
  We use them with the boundary comparison in Appendix 9, which replaces a boundary-expectation step without
  requiring integrability of restricted passage times. Related developments include sublinear growth of planar
  geodesic trees [1] and quantitative coalescence and midpoint estimates under stronger distributional and
  geometric hypotheses [11].

There is a quantifier issue that those inputs alone do not settle:
  almost-sure uniqueness for each fixed functional does not imply simultaneous uniqueness at every
  environment-dependent functional. A bigeodesic, if one existed, could select such an exceptional functional.
  Our argument treats these random functionals directly and then uses an increasing passage-time cost to exclude
  all remaining candidates.

=== The argument <the-argument>

A ray $p$ has a Busemann function

$ B_p \( x \, y \) = lim_(j arrow.r oo) #scale(x: 120%, y: 120%)[\(] T \( x \, p_j \) -
  T \( y \, p_j \) #scale(x: 120%, y: 120%)[\)] $

with a linear asymptote $rho_p$, which we call its label. The labels of the two ends of a bigeodesic are opposite.
  After a countable reduction, it suffices to exclude bigeodesics whose upper labels lie in one compact sector of
  the dual unit circle. The horizontal coordinate $r \( rho \) = rho \( e_1 \)$ orders this sector;
  write $W$ for its width in that coordinate.

The contradiction is a finite budget for passage-time increases.
  On a horizontal grid of spacing $l$, we mark sites by selecting bigeodesics in finitely increased environments.
  A marked path acquires an extra cost of at least $M$ on an initial portion.
  Partition the label sector into bins with deterministic endpoints.
  The selected arms and the base rays used for comparison are required to satisfy common deterministic cone
  bounds. When the marks in each bin are sufficiently separated,
  comparison with rays at those endpoints charges the increase to the bin’s width.
  Busemann increments telescope along the line, and the resulting bound is

$ M q lt.eq l W \, $

where $q$ is the common probability that a site is marked (20).
  We construct such marks with $q$ bounded away from zero and $l$ fixed while $M$ becomes arbitrarily large.
  Two issues require the rest of the proof: obtaining large increases without losing the marks,
  and separating their labels without increasing the grid spacing.

For the first issue, we raise finitely many edge weights in a widening region around each site.
  Our low-to-high replacement is an instance of the bounded-density Bernoulli perturbations of Bates and
  Chatterjee [5] Lemmas 2.3–2.4. Quadratic change-of-law bounds for spatially varying passage-time perturbations
  also appear in [11] Section 2.3. All densities here are relative to the original edge law,
  including when it is singular. At height $h$, we use the replacement scale

$ delta_h = frac(eta, \( h + 2 \) log \( h + 2 \)) $

with one sufficiently small $eta > 0$. There are order $h$ possible edges at that height.
  Thus the convergent sum of $h delta_h^2$ keeps the change of law uniformly small,
  while the divergent sum of $delta_j$ permits an arbitrarily large gain along a path.
  The path must be chosen from the increased environment, not in advance.
  Conditioning on that individual output gives an explicit product law for the hidden raises along the selected path.

The second issue rests on a simultaneous statement about random labels:
  two bigeodesics with the same label have the same pair of Busemann functions (24).
  To prove it, we first use planar ordering and fixed bounding rays to confine every ray in the sector.
  The labels admitting branching or distinct Busemann functions form a countable set in each environment.
  Resampling complementary half-planes independently, we transfer rays across a distant cut while preserving their
  exact labels and finite witnesses to exceptionality (17).
  Countability and independence imply coalescence at the opposite end of every exceptional label.
  A one-edge version of the budget and a finite-tree count then exclude forks (Proposition 5.4, Proposition 6.1).
  These steps give the common Busemann pair without intersecting uncountably many fixed-label probability-one events.

To use this conclusion, all sites share the same raised samples.
  Passing from two individual perturbation regions to their union leaves both selected paths and their costs
  unchanged. Choosing $l$ large enough once ensures that a strictly raised edge within a fixed near radius of one
  site lies outside the other site’s region. If their labels agreed,
  their common Busemann pair would produce a detour through that edge with arbitrarily small excess cost in the
  union metric. Returning to the other individual metric would make this detour strictly cheaper than its selected
  geodesic. Hence distinct marked sites have distinct labels (30).

For each fixed gain $M$, refining the label partition therefore separates every mark from the finitely many
  neighbors within the deterministic separation required by the budget comparison.
  The probability lost in this separation tends to zero as the partition is refined.
  Only after this refinement do we increase $M$. The grid spacing remains fixed, and $M q lt.eq
  l W$ is impossible. No quantitative separation of the random labels, and no rate of coalescence, is required.

== 2 Geodesics, Busemann functions, and structural input <sec:preliminaries>

=== 2.1 The metric and its rays <the-metric-and-its-rays>

Let $cal(E)$ be the unoriented nearest-neighbor edges of $bb(Z)^2$. We work on

$ Omega = \[ 0 \, oo \)^(cal(E)) \, wide bb(P) = G^(cal(E)) \, $

initially with the product Borel sigma-algebra and subsequently with its completion.
  Throughout the paper $G$ is nonatomic and satisfies the moment assumption of Theorem 1.
  For a finite nearest-neighbor walk $gamma$, its cost $T \( gamma \)$ is the sum of its edge weights with
  traversal multiplicity. Put

$ T \( x \, y \) = inf_(gamma : x arrow.r y) T \( gamma \) . $

A finite #emph[geodesic] realizes this infimum. A #emph[ray] $p = \( p_0 \, p_1 \, dots.h \)$ is a simple infinite
  nearest-neighbor path every finite segment of which is a geodesic.
  A #emph[bigeodesic] has the same property and is indexed by $bb(Z)$.
  Two rays #emph[coalesce] if, after deleting finite initial portions, their vertex sequences agree.
  We draw lattice edges as straight segments; intersections of such paths are lattice contacts.

#thm([Lemma 2.1.])[
  (Finite minimizers).  #emph[Almost surely every pair of vertices has a unique finite geodesic.]
] <lem:finite-minimizers>

#proof[
  Every edge weight is strictly positive almost surely. By dominated convergence, choose $c > 0$ such that $a =
    4 bb(E) e^(- c t_e) < 1$. For a fixed vertex $x$ and a fixed $K < oo$,
    the probability that some simple path of $j$ edges from $x$ has cost at most $K$ is at most $e^(c K) a^j$.
    The sum over $j$ is finite. Consequently only finitely many simple paths from $x$ have cost at most $K$,
    almost surely. Take the countable intersection over vertices and positive integer $K$.
    Every finite walk can be shortened to a simple path by erasing loops.
    Comparing with any fixed path between two vertices now shows that the infimum is attained among a finite
    collection of paths.
  Two different simple paths with the same endpoints have an edge in their symmetric difference.
    Conditional on all other weights, equality of their costs prescribes one value of the independent nonatomic
    weight on that edge and thus has probability zero. There are only countably many pairs of finite paths. ◻
]

The raywise monotonicity argument below goes back to Hoffman [13];
  see also [2] Lemma 4.1 and the discussion after Proposition 4.5.

#thm([Lemma 2.2.])[
  (Elementary Busemann properties).  #emph[For every ray $p$ and all vertices $x \, y$, the limit
#[#set math.equation(numbering: n => "(2)")
 $ B_p \( x \, y \) = lim_(j arrow.r oo) #scale(x: 120%, y: 120%)[\(] T \( x \, p_j \) -
   T \( y \, p_j \) #scale(x: 120%, y: 120%)[\)] $ <eq:busemann-definition>]

 exists. It is additive and antisymmetric, satisfies $\| B_p \( x \, y \) \| lt.eq T \( x \, y \)$,
   and is calibrated on the ray:
$ B_p \( p_i \, p_j \) = T \( p_i \, p_j \) wide \( i lt.eq j \) . $

 Deleting a finite initial portion of a ray does not change its Busemann function.
   Coalescing rays have the same Busemann function. For each fixed vertex $x$,
#[#set math.equation(numbering: n => "(3)")
 $ 0 lt.eq T \( x \, p_j \) - B_p \( x \, p_j \) arrow.r 0 . $ <eq:calibration-defect>]

]
] <lem:busemann-basic>

#proof[
  The sequence
  $ a_j \( x \) = T \( x \, p_j \) - T \( p_0 \, p_j \) $
  is decreasing, by the triangle inequality and calibration of the segments of $p$, and is bounded below by $-
    T \( p_0 \, x \)$. Write $a_oo \( x \)$ for its limit. Then $B_p \( x \, y \) = a_oo \( x \) - a_oo \( y \)$.
    Additivity, antisymmetry, and the metric bound follow immediately.
    For $j gt.eq i$ and $k gt.eq j$, the geodesic property gives $T \( p_i \, p_k \) - T \( p_j \, p_k \) =
    T \( p_i \, p_j \)$, proving calibration. Tail invariance and the coalescence assertion follow from the
    defining limit. Finally,
  $ B_p \( x \, p_j \) = B_p \( x \, p_0 \) + T \( p_0 \, p_j \) = a_oo \( x \) + T \( p_0 \, p_j \) \, $
  so the left side of (3) is $a_j \( x \) - a_oo \( x \)$. ◻
]

=== 2.2 Structural input <structural-input>

For a norm $m$ on $bb(R)^2$, let

$ cal(S) = partial { rho in \( bb(R)^2 \)^(*) : rho \( v \) lt.eq
  m \( v \) upright(" for every ") v in bb(R)^2 } \, wide A \( rho \) = { d in S^1 : m \( d \) = rho \( d \) } . $

Here $\| dot.op \|$ and $S^1$ refer to the Euclidean norm.
  The set $cal(S)$ is the dual unit circle, and $A \( rho \)$ is the set of contact directions of $rho$.
  The limiting directions of a ray are the accumulation points of $\( p_j - p_0 \) \/ \| p_j - p_0 \|$.
  Since a simple lattice ray eventually leaves each finite set, this is a nonempty compact subset of $S^1$.

The structural input below combines the shape theorem with the Ahlberg–Hoffman theory.
  The boundary comparison in Appendix 9 is part of this input:
  it replaces a boundary-expectation step without adding a moment assumption.

#thm([Theorem 2.3.])[
  (Ahlberg–Hoffman and the shape theorem).  #emph[There are a deterministic norm $m$ on $bb(R)^2$ and a
    deterministic closed subset $C subset.eq cal(S)$ with the following properties.]
  + #emph[Almost surely,
$ T \( 0 \, x \) = m \( x \) + o \( \| x \| \) wide \( \| x \| arrow.r oo \) . $

]
  + #emph[Almost surely, simultaneously for all rays $p$ from all lattice vertices,
    there is a unique $rho_p in C$ such that
#[#set math.equation(numbering: n => "(4)")
 $ B_p \( 0 \, x \) = rho_p \( x \) + o \( \| x \| \) wide \( \| x \| arrow.r oo \) . $ <eq:busemann-linearity>]

 The limiting directions of $p$ lie in $A \( rho_p \)$. At each vertex the set of realized functionals is $C$.]
  + #emph[For each fixed $rho in C$, almost surely there is exactly one ray $g_rho \( x \)$ with functional $rho$
    from each $x in bb(Z)^2$. These rays coalesce. Their family is #emph[backwards finite]:
    for each vertex $z$, the set of $x$ for which $g_rho \( x \)$ contains $z$ is finite.]
  #emph[The norm $m$ and the set $C$ have the rotation and reflection symmetries of the square lattice.]
] <thm:structure>

The exact source statements are [2] Assumption A1, Theorems 2.5–2.6 and 10.8–10.11, and Proposition 4.5.
  Its Assumption A1 is the iid continuous-marginal setting with the second moment of the minimum of four incident
  edge weights. A nonatomic Borel law has a continuous distribution function,
  so singular continuous laws are included. The iid shape theorem is due to Cox and Durrett [8] and is recalled
  there in Section 3.1. Theorem 10.8 supplies a random coalescing geodesic for each fixed member of $C$;
  Theorem 10.11 and its proof identify its translates as the unique rays of that functional,
  and Proposition 4.5 gives backward finiteness. Countability of the lattice permits all starting vertices in the
  displayed assertions. The separate boundary-expectation assertion of their Lemma 4.6 is not needed:
  the appendix replaces its use in Proposition 4.4 by a finite stationary correction and bounded truncation.
  The geometric existence and coalescence part of that lemma is unchanged.
  The symmetry of $C$ also follows from its deterministic realization as the set of ray functionals.

The distinction between parts (ii) and (iii) is essential.
  Part (ii) holds for every ray in a single typical environment.
  In part (iii), the null set may depend on the #emph[fixed] functional.
  We will not intersect those events over an uncountable collection of functionals.

For a fixed $rho in C$, the coalescing family has a common Busemann function, denoted $B_rho$.
  It is defined on the probability-one event for that fixed functional.
  For any countable deterministic collection of such functionals we use their common probability-one event.
  We call $rho_p$ the #emph[label] of $p$.

#thm([Corollary 2.4.])[
  (Exclusion of deterministic labels).  #emph[For each fixed $rho in C$,
    almost surely no bigeodesic has an end with label $rho$. The same holds simultaneously for every member of any
    countable deterministic subset of $C$.]
] <cor:fixed-label>

#proof[
  Suppose a bigeodesic has a forward end of label $rho$. The forward ray starting at any of its backward vertices
    has that same label by tail invariance. Fixed-label uniqueness identifies all of these rays with
    $g_rho \( x \)$. The middle vertex would belong to this family from infinitely many starting vertices,
    contrary to backward finiteness. The final assertion is a countable intersection. ◻
]

=== 2.3 Uniform estimates and finite changes <uniform-estimates-and-finite-changes>

#thm([Lemma 2.5.])[
  (Uniform metric approximation).  #emph[Almost surely,
#[#set math.equation(numbering: n => "(5)")
 $ T \( x \, y \) = m \( y - x \) + o \( \| x \| + \| y \| \) wide \( \| x \| + \| y \| arrow.r oo \) \,
   $ <eq:uniform-metric>]

 uniformly over the two endpoints.]
] <lem:uniform-metric>

#proof[
  The extended shape theorem [2] Proposition 3.4 states that for each $epsilon > 0$,
    almost surely there is an $N < oo$ such that
  $ \| T \( z \, z + v \) - m \( v \) \| lt.eq epsilon max { \| z \| \, \| v \| }
    wide \( \| z \| gt.eq N \, med v in bb(Z)^2 \) . $
  Given $x \, y$, take $z$ to be the endpoint with larger norm and $v$ the displacement to the other endpoint.
    Then $\| z \| gt.eq \( \| x \| + \| y \| \) \/ 2$ and $max { \| z \| \, \| v \| } lt.eq \| x \| + \| y \|$.
    Symmetry of $T$ and $m$ proves the claim. ◻
]

#thm([Lemma 2.6.])[
  (Finite modifications).  #emph[Suppose two environments differ on a finite set $F$ of edges, and put $K =
    sum_(e in F) \| t'_e - t_e \|$. Then
$ \| T' \( x \, y \) - T \( x \, y \) \| lt.eq K wide \( x \, y in bb(Z)^2 \) . $

 If a path is a ray in both environments and has asymptotically linear Busemann functions in both,
   its label is the same in the two environments. The conclusion also applies when a common tail is a ray in both.
   If $t'_e gt.eq t_e$ for all $e$ and a geodesic path uses only edges whose weights are unchanged,
   it remains geodesic in the new metric.]
] <lem:finite-change>

#proof[
  Loop erasure allows the passage-time infimum to be taken over simple paths.
    Each such path uses every changed edge at most once, so its cost changes by at most $K$.
    Taking infima gives the distance bound. For a retained ray $p$, passing to its defining Busemann limits gives
  $ \| B'_p \( x \, y \) - B_p \( x \, y \) \| lt.eq 2 K . $
  Linear asymptotics along $x = n v$, for two independent lattice vectors $v$, imply equality of the linear parts.
    Tail invariance handles the stated extension. Under an increase,
    every competitor is at least as expensive as before, whereas each segment of the retained path has unchanged cost. ◻
]

Whenever a random environment has law absolutely continuous with respect to $bb(P)$,
  it inherits every specified $bb(P)$-almost-sure assertion.
  We take common full-measure events for the countably many environments and deterministic parameters used in each
  construction. In particular, applying a simultaneous pathwise assertion in a finitely modified environment does
  not require fixing the label of a subsequently selected path.

=== 2.4 Measurability conventions <measurability-conventions>

#thm([Lemma 2.7.])[
  (Path witnesses and selection).  #emph[The conditions that a specified path is a ray or a bigeodesic,
    that specified rays coalesce, and that a ray’s Busemann function is asymptotically linear to a specified
    functional are Borel conditions on the corresponding environment, path, and functional spaces.
    Existence events obtained by projecting these conditions, with additional Borel tests,
    are analytic and hence universally measurable. On such existence events a witnessing path can be selected
    completion-measurably. The number of distinct labels with such witnesses is measurable in the completed
    probability space, with the value $+ oo$ allowed.]
] <lem:measurable>

#proof[
  The spaces $Omega$, $\( bb(Z)^2 \)^(bb(N))$, and $\( bb(Z)^2 \)^(bb(Z))$ are standard Borel spaces.
    Nearest-neighbor adjacency and simplicity are countable coordinate tests.
    Each finite segment minimizes exactly when its cost is no greater than that of every finite competitor with
    the same endpoints; there are countably many competitors.
    Equivalently, the passage distance is a countable infimum of Borel finite-path costs.
    Limits defining Busemann values are countable tests, as are asymptotic linearity with rational tolerances and
    integer radii. Coalescence is expressed by
  $ exists i \, j gt.eq 0 med med forall k gt.eq 0 : med p_(i + k) = q_(j + k) . $
  The standard analytic projection and Jankov–von Neumann selection theorems give the existence and selection
    assertions; see [15] Theorems 29.7 and 29.9. To test that the label count is at least $j$,
    project the Borel condition for $j$ path witnesses with pairwise distinct labels. ◻
]

We will also impose conditions on #emph[all] rays with labels in a fixed chart from specified vertices.
  The failure of such a regularity condition has one violating ray as an analytic witness.
  The regularity event is therefore coanalytic and universally measurable.
  It depends only on the environment and the specified vertices.
  When combined with an existential path condition, we first project the Borel witness relation and then intersect
  with this separate regularity event. We do not project a relation containing an additional universal path quantifier.

For a fixed law on a standard Borel space, a map measurable for its completion and taking values in a standard
  Borel space has a Borel version. Thus conditioning on a resulting environment fixes any path chosen from that
  environment, up to a null set. Translated constructions use the same selector on the relatively shifted input;
  their one-site marginal laws are consequently identical. No stationarity or independence of the resulting marks
  is needed beyond the explicitly stated marginal conditions.

== 3 Sectors, order, and confinement <sec:sectors>

We first reduce the possible ends of a bigeodesic to countably many pairs of opposite sectors.
  Within each sector, planar order will let us obtain a uniform statement about every ray from estimates for only
  four fixed functionals. All assertions below are made on the event of finite uniqueness and simultaneous ray
  asymptotics in 4, together with 6. Whenever a countable deterministic collection of functionals is specified,
  we also impose the fixed-functional conclusions of 4 for that collection.

#thm([Lemma 3.1.])[
  (Opposite functionals).  #emph[Let an oriented bigeodesic pass through $z$,
    and let $p^(+)$ and $p^(-)$ be its two rays starting at $z$. Then, for every $w in bb(Z)^2$,
#[#set math.equation(numbering: n => "(6)")
 $ B_(p^(+)) \( z \, w \) + B_(p^(-)) \( z \, w \) lt.eq 0 . $ <eq:bigeodesic-sum>]

 Consequently $rho_(p^(-)) = - rho_(p^(+))$. Moving the base point along the bigeodesic does not change either
   functional or either Busemann function. For any deterministic countable set $D subset C$,
   almost surely no bigeodesic has an end whose functional belongs to $D$.]
] <lem:opposite>

#proof[
  For vertices $p_i^(+)$ and $p_j^(-)$ on opposite arms, optimality and the triangle inequality give
  $ T \( z \, p_i^(+) \) + T \( z \, p_j^(-) \) = T \( p_i^(+) \, p_j^(-) \) lt.eq T \( w \, p_i^(+) \) +
    T \( w \, p_j^(-) \) . $
  Subtract the right-hand terms and let $i \, j arrow.r oo$. This proves (6).
    Additivity and asymptotic linearity imply that its left-hand side is
  $ \( rho_(p^(+)) + rho_(p^(-)) \) \( w - z \) + o \( \| w \| \) wide \( \| w \| arrow.r oo \) . $
  Putting $w = z + n e_k$ and $w = z - n e_k$, dividing by $n$, and letting $n arrow.r oo$, for $k = 1 \, 2$,
    proves that the sum of the functionals vanishes. The assertion about moving the base point follows from tail
    invariance in 3.
  The exclusion of a deterministic countable set is 5. ◻
]

We use rotations and reflections preserving $bb(Z)^2$ when choosing coordinates.
  In any such coordinates, $e_1$ is horizontal and $e_2$ is vertical.
  The symmetry of the law implies the same symmetry of $m$ and $C$; in particular $- C = C$.
  To see the latter assertion directly from the structural input, reflect the unique ray for a fixed $rho in C$.
  The reflected environment has the same law, and its ray has functional $- rho$,
  which must belong to the deterministic set $C$.

#thm([Lemma 3.2.])[
  (Countably many charts).  #emph[There is a deterministic countable set $D subset C$, symmetric under negation,
    and a countable family of charts with the following properties.
    Each chart is specified by a choice of lattice coordinates and a compact arc $J$ of the dual unit circle,
    whose distinct endpoints $rho_ell \, rho_r$ belong to $C$. Set $I = C ∩ J$. There is $c > 0$ such that
#[#set math.equation(numbering: n => "(7)")
 $ d_2 gt.eq c quad upright("for every ") rho in J upright(" and every ") d in A \( rho \) .
   $ <eq:chart-contact-sector>]

 The coordinate
$ r \( rho \) = rho \( e_1 \) $

 is one-to-one on $J$ and orders it from $rho_ell$ to $rho_r$ with $r \( rho_ell \) < r \( rho_r \)$.
   Every member of $C \\ D$ belongs to the relative interior of such a chart arc.
   Almost surely, every bigeodesic can therefore be oriented so that its upper functional belongs to the interior
   of one of these charts and its lower functional is its negative.]
] <lem:charts>

#proof[
  Let $K = { x : m \( x \) lt.eq 1 }$, and let $K^(*) = { rho : rho \( x \) lt.eq
    m \( x \) upright(" for all ") x }$ be the dual unit ball. For $rho in partial K^(*)$ the exposed face
  $ F_rho = { x in K : rho \( x \) = 1 } $
  is a point or a line segment. Its radial image is $A \( rho \)$.
    If this image contains two directions, it is a nondegenerate closed circular arc.
    The relative interiors of these arcs are disjoint for distinct $rho$:
    a direction in such an interior corresponds to the relative interior of a nondegenerate face of $K$,
    whose supporting line, and hence its normalized functional, is unique.
    Each nondegenerate arc contains a rational angle. Thus only countably many functionals have more than one
    contact direction.
  There are also only countably many members of $C$ that are isolated on at least one circular side.
    Indeed, they are endpoints of components of $partial K^(*) \\ C$, with the finite-set cases included.
    The open components are disjoint and each contains a point of a fixed countable dense subset of the circle.
  Consider a remaining $rho in C$, so that $A \( rho \) = {
    d }$ and $C$ accumulates at $rho$ from both circular sides. A lattice rotation makes $d_2 > 0$.
    The contact correspondence is upper semicontinuous: if $rho_n arrow.r
    rho$ and $d_n in A \( rho_n \)$ with $d_n arrow.r d'$, then $m \( d' \) = rho \( d' \)$.
    Compactness of the unit circle therefore supplies an open boundary neighborhood of $rho$ on which every
    contact has vertical coordinate at least some $c > 0$.
  Choose once and for all a countable dense subset $D_0$ of $C$.
    In the neighborhood just obtained, choose one point of $D_0$ on either side of $rho$.
    The compact boundary arc joining them through $rho$ can be taken inside that neighborhood.
    There are only countably many pairs from $D_0$ and finitely many choices of lattice coordinates,
    so all such arcs form a countable family. For $D$ take the union of $D_0$,
    the two countable exceptional sets described above, and their negatives.
  For completeness, suppose two chart points $rho \, lambda$ had the same horizontal coordinate and
    $lambda \( e_2 \) > rho \( e_2 \)$. Choosing any $d in A \( rho \)$, for which $d_2 > 0$,
    would give $lambda \( d \) > rho \( d \) = m \( d \)$, contrary to $lambda in K^(*)$.
    The same argument shows that each chart point is the top endpoint of the vertical section of $K^(*)$ at its
    horizontal coordinate. The continuous horizontal coordinate is thus injective on the arc and strictly monotone
    along it. Orient $J$ so that it increases. On the opposite lower arc,
    the horizontal coordinate again increases from left to right;
    negation reverses the order of the corresponding labels.
  Finally, 9 excludes $D$ simultaneously and identifies the opposite end.
    The contact restriction implies that rays of the chosen upper label tend to height $+ oo$,
    and those of the negative label tend to height $- oo$. This gives the claimed orientation. ◻
]

Fix one chart for the rest of this section. We call a functional of a ray its #emph[label];
  an upper label belongs to $I$ and a lower label belongs to $- I$.
  Since a simple ray eventually leaves every finite set, its contact restriction and (7) show that its height
  tends to the appropriate infinity. No monotonicity of height along the ray is asserted.

We will use the following elementary planar fact. Two disjoint polygonal arcs connecting the lower and upper
  boundary lines of a strip, with their interiors in the open strip,
  have their endpoints in the same left-to-right order on the two boundary lines.
  One way to prove this is to put the finite arcs inside a sufficiently wide rectangle and apply the Jordan curve
  theorem to one arc and either of the two boundary routes joining its endpoints.
  Endpoints in reversed order lie on opposite sides of that Jordan curve, so the other arc must cross the first.
  The same conclusion holds for finite walks, by erasing loops before applying this argument.
  For nearest-neighbor lattice paths, a planar intersection always yields a common lattice vertex:
  interiors of perpendicular unit edges do not cross, and overlapping unit edges have common endpoints.

#thm([Lemma 3.3.])[
  (Local ray order).  #emph[Two upper rays with disjoint tails have a stable left-to-right order at their first
    visits to the horizontal rows ${ x_2 = N }$ as $N arrow.r oo$. If $p$ is to the left of $q$ in this order, then
#[#set math.equation(numbering: n => "(8)")
 $ r \( rho_p \) lt.eq r \( rho_q \) . $ <eq:ray-order>]

 In particular, distinct labels give disjoint tails and strictly ordered first arrivals,
   in the order of increasing $r$. For lower rays the same statements hold as $N arrow.r - oo$,
   again with left-to-right order given by increasing horizontal coordinate of the lower functional.]
] <lem:ray-order>

#proof[
  If two rays meet infinitely often, choose a shared vertex beyond their finite initial portions.
    The geodesic segments from that vertex to every later common vertex agree by finite uniqueness.
    The later common vertices escape to infinity, so the two tails agree.
    Tail invariance of the Busemann function then gives equality of their labels.
    Thus distinct labels have only finitely many common vertices.
  Suppose the tails of $p$ and $q$ are disjoint. Choose an integer height $h$ above both starting sites,
    above all intersections, and above finite prefixes preceding the disjoint tails.
    After their respective last visits to row $h$, both rays stay strictly above that row.
    For sufficiently large $N$, their first visits to row $N$ occur after those last visits,
    since the prefixes ending at the last visits are finite. The intervening arcs are disjoint strip crossings.
    Their order on row $N$ therefore agrees with the fixed order of the last visits to row $h$.
    This proves stabilization.
  Assume this stable order is $p$ to the left of $q$. For a positive integer $n$,
    set $u = \( - n \, 0 \)$ and $v = \( n \, 0 \)$. Let $gamma_j$ be the concatenation of the finite geodesic
    from $v$ to $p_j$ and the tail of $p$ after $p_j$. This concatenation is used as a walk;
    it need not be a ray or be simple. Define
  $ delta_j = T \( v \, p_j \) - B_p \( v \, p_j \) gt.eq 0 . $
  Since $B_p \( v \, p_j \) = B_p \( v \, p_0 \) + T \( p_0 \, p_j \)$,
    the definition of $B_p$ implies $delta_j arrow.r 0$ for this fixed $v$. Every vertex $w$ of $gamma_j$ satisfies
  #[#set math.equation(numbering: n => "(9)")
   $ 0 lt.eq T \( v \, w \) - B_p \( v \, w \) lt.eq delta_j . $ <eq:near-calibration>]
  On the initial geodesic this follows by decomposing its cost and the Busemann increment at $w$,
    with the remaining deficit nonnegative. On the tail it follows from the triangle inequality and exact
    calibration of $p \[ p_j \, w \]$. Define $xi_j$ in the same way by joining $u$ to $q_j$ and then following
    $q$, and write its error as $delta'_j arrow.r 0$.
  We next control all row-zero visits of these walks, including visits very far from the origin.
    The horizontal directions are outside both contact sets, so
  $ gamma = min_(lambda in { rho_p \, rho_q } \, thin sigma in { - 1 \, 1 }) #scale(x: 120%, y: 120%)[\(]
    m \( sigma e_1 \) - lambda \( sigma e_1 \) #scale(x: 120%, y: 120%)[\)] > 0 . $
  Write $a_p \( x \) = B_p \( 0 \, x \) - rho_p \( x \)$, and define $a_q$ similarly.
    Given $epsilon > 0$, the uniform metric estimate and these two rooted asymptotics give a finite $K_epsilon$
    such that, for all lattice sites $x \, y$,
  $ \| T \( x \, y \) - m \( y - x \) \| & lt.eq epsilon \( \| x \| + \| y \| \) + K_epsilon \,\
\| a_p \( x \) \| + \| a_q \( x \) \| & lt.eq epsilon \| x \| + K_epsilon . $
  For $w = \( t \, 0 \)$ with $d = \| w - v \| gt.eq n \/ 2$, we have $\| v \| + \| w \| lt.eq 2 n + d lt.eq 5 d$.
    Additivity therefore gives the explicit bound
  #[#set math.equation(numbering: n => "(10)")
   $ T \( v \, w \) - B_p \( v \, w \) gt.eq \( gamma - 10 epsilon \) d - 3 K_epsilon . $ <eq:row-deficit>]
  The identical estimate holds with $u \, q$ in place of $v \, p$.
    Choose $epsilon < gamma \/ 40$ first, and then $n$ so large that $3 K_epsilon lt.eq gamma n \/ 8$.
    The right-hand side of (10) is at least $gamma d \/ 2 gt.eq gamma n \/ 4$.
    For this fixed $n$, choose $j$ so large that both approximate-calibration errors are smaller than $gamma n \/
    4$. It follows that every row-zero visit of $gamma_j$ has horizontal coordinate in $\( n \/ 2 \, 3 n \/ 2 \)$,
    whereas every such visit of $xi_j$ lies in $\( - 3 n \/ 2 \, - n \/ 2 \)$.
  Both walks eventually follow their exact upward tails. Their last row-zero visits thus exist and have the order
    $xi_j \, gamma_j$. Choose a row $N$ above the finite joining paths,
    the discarded original prefixes $p \[ p_0 \, p_j \]$ and $q \[ q_0 \, q_j \]$,
    and the prefixes ending at these last row-zero visits, and high enough for the stable order of $p \, q$.
    The first visits of the two walks to this row occur on their exact tails and have the opposite order
    $gamma_j \, xi_j$. Their portions from the last row-zero visits to these first row-$N$ visits are strip
    crossings. The planar fact gives a common vertex $w_j$.
  At that vertex, domination by the metric and (9) give
  $ B_p \( u \, v \) & = B_p \( u \, w_j \) - B_p \( v \, w_j \)\
 & lt.eq T \( u \, w_j \) - T \( v \, w_j \) + delta_j\
 & lt.eq B_q \( u \, w_j \) - B_q \( v \, w_j \) + delta_j + delta'_j\
 & = B_q \( u \, v \) + delta_j + delta'_j . $
  Let $j arrow.r oo$ with $n$ fixed. We obtain $B_p \( u \, v \) lt.eq B_q \( u \, v \)$.
    Finally, the rooted asymptotics at $u$ and $v$ give
  $ B_p \( u \, v \) = 2 n rho_p \( e_1 \) + o \( n \) \, wide B_q \( u \, v \) = 2 n rho_q \( e_1 \) + o \( n \) . $
  Division by $2 n$ proves (8). If the labels are distinct, injectivity of $r$ makes the order strict.
    Reflection in the horizontal axis proves the lower-ray version; this reflection preserves $e_1$,
    so it also preserves the horizontal parameter used in that version. ◻
]

Choose $s > 0$ sufficiently small that every upper contact in the chart satisfies $d_2 > 2 s \| d_1 \|$,
  and every lower contact satisfies $- d_2 > 2 s \| d_1 \|$. This is possible by compactness and (7).
  For $z in bb(Z)^2$ and $H gt.eq 0$, define the closed convex offset cones

#[#set math.equation(numbering: n => "(11)")
 $ Q^plus.minus \( z \, H \) = { w in bb(R)^2 : med plus.minus \( w_2 - z_2 \) gt.eq s \| w_1 - z_1 \| -
   H } . $ <eq:offset-cones>]

#thm([Proposition 3.4.])[
  (Uniform confinement of all rays).  #emph[Almost surely there is a finite $H \( z \) gt.eq
    1$ for every $z in bb(Z)^2$ such that every upper ray from $z$ lies in $Q^(+) \( z \, H \( z \) \)$ and every
    lower ray from $z$ lies in $Q^(-) \( z \, H \( z \) \)$. Moreover, for every fixed $L < oo$,
#[#set math.equation(numbering: n => "(12)")
 $ max_(\| z \| lt.eq L n) H \( z \) = o \( n \) wide \( n arrow.r oo \) . $ <eq:uniform-cone-offset>]

 These statements hold simultaneously for every ray in the chart;
   no uniform rate of Busemann convergence over the intermediate labels is required.]
] <prop:cone>

#proof[
  Let $Lambda = { rho_ell \, rho_r \, - rho_ell \, - rho_r }$.
    For each of these four deterministic functionals, 4(iii) provides a unique ray $g_z^lambda$ from every vertex
    $z$ and a common Busemann function $B_lambda$. Let $sigma_lambda =
    1$ for the upper endpoints and $sigma_lambda = - 1$ for the lower endpoints. Define
  #[#set math.equation(numbering: n => "(13)")
   $ H \( z \) = 1 + max_(lambda in Lambda) sup_(w in g_z^lambda) #scale(x: 120%, y: 120%)[\(] s \| w_1 - z_1 \| -
     sigma_lambda \( w_2 - z_2 \) #scale(x: 120%, y: 120%)[\)]_(+) . $ <eq:endpoint-offset>]
  Each supremum is finite. Indeed, the limit directions of this endpoint ray lie strictly inside its cone of slope
    $2 s$, and translating the origin to its fixed starting point does not change its limit directions.
    Outside a finite prefix the displayed positive part is therefore zero.
  We prove (12) first for these endpoint rays. Put $a_lambda \( x \) = B_lambda \( 0 \, x \) - lambda \( x \) =
    o \( \| x \| \)$. If $w in g_z^lambda$, calibration gives
  #[#set math.equation(numbering: n => "(14)")
   $ T \( z \, w \) = B_lambda \( z \, w \) = lambda \( w - z \) + a_lambda \( w \) -
     a_lambda \( z \) . $ <eq:endpoint-calibration>]
  Fix $L$ and $eta > 0$. Whenever $\| z \| lt.eq L n$ and $d = w - z$ satisfies $\| d \| gt.eq eta n$, we have
  $ \| z \| + \| w \| lt.eq 2 L n + \| d \| lt.eq \( 1 + 2 L \/ eta \) \| d \| . $
  The uniform metric approximation, the four rooted asymptotics, and (14) thus imply
  #[#set math.equation(numbering: n => "(15)")
   $ sup_(lambda in Lambda \, med \| z \| lt.eq L n \, med w in g_z^lambda\
\| w - z \| gt.eq eta n) frac(m \( w - z \) - lambda \( w - z \), \| w - z \|) arrow.r 0 . $ <eq:endpoint-gap-small>]
  To make the uniformity explicit, bound each rooted error by $epsilon \| x \| +
    K_epsilon$ and the metric error by $epsilon \( \| z \| + \| w \| \) + K_epsilon$.
    The quotient in (15) is then at most $2 epsilon \( 1 + 2 L \/ eta \) + 3 K_epsilon \/ \( eta n \)$;
    take $n arrow.r oo$ and then $epsilon arrow.b 0$.
  For each $lambda in Lambda$, the continuous function $m \( d \) - lambda \( d \)$ has a strictly positive minimum on
  $ { d in S^1 : med sigma_lambda d_2 lt.eq s \| d_1 \| } \, $
  because all its zeros lie strictly inside the cone of slope $2 s$.
    Taking the minimum over the four functionals preserves positivity.
    It follows from (15) that, for all sufficiently large $n$, every endpoint-ray displacement with $\| d \| gt.eq
    eta n$ lies in the unshifted cone of slope $s$. For the remaining displacements,
  $ #scale(x: 120%, y: 120%)[\(] s \| d_1 \| - sigma_lambda d_2 #scale(x: 120%, y: 120%)[\)]_(+)
    lt.eq \( s + 1 \) \| d \| < \( s + 1 \) eta n . $
  Consequently the maximum in (12) is at most $1 + \( s + 1 \) eta n$ eventually.
    Letting $eta arrow.b 0$ proves that equation for the $H \( z \)$ in (13).
  It remains to trap every intermediate ray with exactly this offset.
    Fix $z$ and an upper ray $p$ with $r \( rho_ell \) < r \( rho_p \) < r \( rho_r \)$.
    Write $a = g_z^(rho_ell)$, $b = g_z^(rho_r)$, and $Q = Q^(+) \( z \, H \( z \) \)$.
    The bounding rays lie in $Q$. Finite uniqueness implies that they have a common finite prefix ending at a
    vertex $v$, and then disjoint tails. Indeed, a reunion after their first split would give two finite geodesics
    from $z$ to the reunion vertex. Their common prefix is finite because their labels differ.
  Suppose, for a contradiction, that $p$ visits a vertex $w in.not Q$.
    Choose an integer $N$ above the heights of the entire common prefix of $a \, b$,
    above the finite prefix of $p$ ending at $w$, and large enough for the three pairwise orders in 11 to have
    stabilized. Let $a_N \, b_N \, p_N$ denote their first arrivals on row $N$. They are strictly ordered as
  $ \( a_N \)_1 < \( p_N \)_1 < \( b_N \)_1 . $
  Each first-arrival path lies strictly below that row until its endpoint.
    The two arcs $a \[ v \, a_N \]$ and $b \[ v \, b_N \]$, together with the horizontal segment
    $\[ a_N \, b_N \]$, form a simple closed polygonal curve $cal(J)$. Let $cal(D)$ be its bounded Jordan domain.
    The curve lies in $Q$, including its top segment by convexity.
    Since a bounded Jordan domain is contained in the convex hull of its boundary, $cal(D) subset Q$.
  The common prefix $a \[ z \, v \] = b \[ z \, v \]$ need not lie in $cal(D)$;
    viewed from the Jordan curve it may form a slit on either side.
    The following first-arrival argument treats that possibility explicitly; see 1.
    The last edge into $p_N$ is vertical from below. Since $p_N$ is in the relative interior of the top segment,
    the part of that edge sufficiently close to $p_N$ lies inside $cal(D)$.
    Starting at $w in.not Q$, the ray therefore passes from outside $cal(D)$ to its inside before its first
    row-$N$ arrival. It cannot enter through the top segment, since that would already be a visit to row $N$.
    Hence, after $w$, it meets one of the two bounding arcs at a lattice vertex $u$, possibly $u = v$.
    Both its prefix $p \[ z \, u \]$ and the corresponding bounding prefix are finite geodesics.
    Uniqueness makes them identical. The bounding prefix is contained in $Q$,
    whereas $p \[ z \, u \]$ contains $w in.not Q$, a contradiction.
    This argument also rules out departures made before the bounding rays split.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, -1.209), (-4.9, 4.715), (4.9, 4.715), close: true, fill: rgb("#f5f5f5"), stroke: none)
  line((-4.9, 4.715), (0, -1.209), (4.9, 4.715), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round", dash: "dashed"), mark: (start: "<", end: ">"))
  line((0, 1.069), (-0.45, 1.069), (-0.45, 1.628), (-1, 1.628), (-1, 2.418), (-1.5, 2.418), (-1.5, 2.139), (-1.9, 2.139), (-1.9, 3.255), (-2.2, 3.255), (-2.2, 4.278), (2.2, 4.278), (2.2, 3.627), (1.5, 3.627), (1.5, 3.301), (1.8, 3.301), (1.8, 2.511), (1.3, 2.511), (1.3, 1.674), (0.7, 1.674), (0.7, 1.069), close: true, fill: rgb("#e8e8ff"), stroke: none)
  line((-4.9, 4.278), (4.9, 4.278), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round"))
  line((-2.2, 4.278), (2.2, 4.278), stroke: (thickness: 0.95pt, cap: "round", join: "round"))
  content((4.9, 4.334), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[row $N$]]])], anchor: "south-east")
  line((0, 0), (0.35, 0), (0.35, 0.4185), (0, 0.4185), (0, 1.069), stroke: (thickness: 1.05pt, cap: "round", join: "round"))
  line((1.27, 0.3906), (0.48, 0.2604), stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round"))
  content((1.28, 0.3906), [#text(size: 9pt)[common prefix]], anchor: "west", padding: 0.1176cm)
  line((0, 1.069), (-0.45, 1.069), (-0.45, 1.628), (-1, 1.628), (-1, 2.418), (-1.5, 2.418), (-1.5, 2.139), (-1.9, 2.139), (-1.9, 3.255), (-2.2, 3.255), (-2.2, 4.278), stroke: (thickness: 1.05pt, cap: "round", join: "round"))
  line((0, 1.069), (0.7, 1.069), (0.7, 1.674), (1.3, 1.674), (1.3, 2.511), (1.8, 2.511), (1.8, 3.301), (1.5, 3.301), (1.5, 3.627), (2.2, 3.627), (2.2, 4.278), stroke: (thickness: 1.05pt, cap: "round", join: "round"))
  line((0, 0), (-0.5, 0), (-0.5, 0.372), (-1.45, 0.372), (-1.45, 1.116), (-3.05, 1.116), (-3.05, 2.697), (-0.85, 2.697), (-0.85, 3.348), (0.35, 3.348), (0.35, 4.278), stroke: (paint: rgb("#a60000"), thickness: 0.95pt, cap: "round", join: "round", dash: (4pt, 2.5pt)), mark: (end: ">"))
  merge-path({line((0, 0), (0, 1.069)); line((0, 1.069), (-2.2, 4.278)); line((-2.2, 4.278), (2.2, 4.278))}, close: false, fill: black, stroke: none)
  circle((0, 0), radius: 0.05997, fill: black, stroke: none)
  circle((0, 1.069), radius: 0.05997, fill: black, stroke: none)
  circle((-2.2, 4.278), radius: 0.05997, fill: black, stroke: none)
  circle((2.2, 4.278), radius: 0.05997, fill: black, stroke: none)
  merge-path({line((-3.05, 1.674), (-1.9, 2.697)); line((-1.9, 2.697), (0.35, 4.278))}, close: false, fill: rgb("#a60000"), stroke: none)
  circle((-3.05, 1.674), radius: 0.06703, fill: rgb("#a60000"), stroke: none)
  circle((-1.9, 2.697), radius: 0.06703, fill: rgb("#a60000"), stroke: none)
  circle((0.35, 4.278), radius: 0.06703, fill: rgb("#a60000"), stroke: none)
  content((0, 0), [#text(size: 9pt)[$z$]], anchor: "north-east", padding: 0.1176cm)
  content((0, 1.069), [#text(size: 9pt)[$v$]], anchor: "south-west", padding: 0.1176cm)
  content((-2.2, 4.384), [#text(size: 9pt)[$a_N$]], anchor: "south", padding: 0.1176cm)
  content((2.2, 4.384), [#text(size: 9pt)[$b_N$]], anchor: "south", padding: 0.1176cm)
  content((0.35, 4.384), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$p_N$]]], anchor: "south", padding: 0.1176cm)
  content((-3.156, 1.674), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$w in.not Q$]]], anchor: "east", padding: 0.1176cm)
  content((-1.85, 2.747), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$u$]]], anchor: "south-west", padding: 0.1176cm)
  content((0.55, 2.279), [#text(size: 9pt)[$cal(D)$]])
  content((3.35, 2.837), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Q=Q^+(z,H(z))$]]])])
  line((-3.15, 3.599), (-2.3, 3.46), stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round"))
  content((-3.15, 3.599), [#text(size: 9pt)[$cal(J)$]], anchor: "east", padding: 0.1176cm)
  line((-2.1, -1.534), (-1.35, -1.534), stroke: (paint: rgb("#a60000"), thickness: 0.95pt, cap: "round", join: "round", dash: (4pt, 2.5pt)))
  content((-1.2, -1.534), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[hypothetical excursion]]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: First-arrival trapping, schematically, in $Q = Q^(+) \( z \, H \( z \) \)$. The bounding arcs from the split $v$ to $a_N \, b_N$, together with the row segment, form $cal(J)$ and enclose $cal(D) subset Q$. The common prefix from $z$ need not lie in $cal(D)$. A hypothetical intermediate ray visiting $w$ outside the cone must contact a bounding arc at $u$ before its first arrival at $p_N in \( a_N \, b_N \)$, contradicting finite uniqueness. The dashed excursion depicts this contradiction; no height monotonicity is assumed. ],
  ) <fig:trapping>
  Thus every intermediate upper ray is in $Q$. Rays with an endpoint label are the unique endpoint rays.
    Reflection proves the same statement for lower rays. The reasoning was deterministic on the single event
    already specified and applied to an arbitrary ray, so it establishes the simultaneous all-ray assertion. ◻
]

#thm([Lemma 3.5.])[
  (Crossing from separated sites).  #emph[Let $x_1 < y_1$, and suppose upper rays $p$ from $x$ and $q$ from $y$ satisfy
$ p subset Q^(+) \( x \, H_x \) \, wide q subset Q^(+) \( y \, H_y \) . $

 If
#[#set math.equation(numbering: n => "(16)")
 $ s \( y_1 - x_1 \) > H_x + H_y + \| x_2 - y_2 \| $ <eq:crossing-separation>]

 and $r \( rho_p \) > r \( rho_q \)$, then the rays intersect.
   The same assertion holds for two lower rays in the corresponding lower cones,
   with the horizontal coordinates of their lower labels in place of $r \( rho_p \)$ and $r \( rho_q \)$.]
] <lem:crossing>

#proof[
  For upper rays put $h = max \( x_2 \, y_2 \)$. Both rays have a last visit to row $h$,
    because they tend upwards. Call the two last vertices $hat(x) \, hat(y)$. The cone bounds give
  $ \| hat(x)_1 - x_1 \| lt.eq frac(h - x_2 + H_x, s) \, wide \| hat(y)_1 - y_1 \| lt.eq frac(h - y_2 + H_y, s) . $
  Since $\( h - x_2 \) + \( h - y_2 \) = \| x_2 - y_2 \|$, (16) implies $hat(x)_1 < hat(y)_1$.
    If the rays did not intersect, their portions from these last visits to their first visits to a sufficiently
    high row would be disjoint strip crossings. Their order there would remain $p \, q$,
    contradicting 11 and the strict reverse order of their labels.
    For lower rays use $h = min \( x_2 \, y_2 \)$ and the last visits before departure towards height $- oo$.
    The same estimates and the lower form of 11 apply. ◻
]

In particular, the separation required on a common horizontal row is linear in the sum of the offsets.
  Heights differing by a bounded amount only add that amount to the numerator in (16).
  For fixed sites $u \, v$ and sites $y = \( N \, h \)$ on any fixed horizontal row, 12 gives $H \( y \) =
  o \( N \)$. Thus for all sufficiently large $N$ the crossing criterion applies to every reverse-ordered pair of
  rays from $u \, y$, and also to every such pair from $v \, y$.
  This simultaneous choice will be useful when comparing whole ranges of Busemann values.

== 4 Exceptional labels and opposite coalescence <sec:exceptional>

Fix one of the charts of Lemma 10, with upper label set $I$ and opposite label set $- I$.
  Throughout the deterministic arguments below, work in an environment satisfying the simultaneous conclusions of
  Theorem 4, Lemma 6, and Proposition 12. The coalescence assertion in Theorem 4 is only a statement for each
  fixed label. We shall obtain the following different statement:
  every label at which branching or Busemann nonuniqueness occurs has a coalescing family at its opposite label.
  The exceptional label may depend on the environment.

=== 4.1 Calibrated rays and countability <calibrated-rays-and-countability>

#thm([Lemma 4.1.])[
  (Rays calibrated from an arbitrary vertex).  #emph[Let $p$ be a ray, let $B = B_p$, and let $x in bb(Z)^2$.
    There is a ray $q = \( q_j \)_(j gt.eq 0)$ from $x$ such that
#[#set math.equation(numbering: n => "(17)")
 $ T \( x \, q_j \) = B \( x \, q_j \) wide \( j gt.eq 0 \) . $ <eq:calibrated-from-x>]

 Moreover, $q$ has the same label as $p$. In general the conclusion concerns the labels; it does not assert $B_q =
   B_p$.]
] <lem:calibrated-rays>

#proof[
  Take the finite geodesics from $x$ to $p_k$. Since $p$ is simple, $\| p_k \| arrow.r oo$,
    and their lengths tend to infinity. Local finiteness and a diagonal subsequence give a local limit $q$ from
    $x$. Each finite prefix of $q$ is eventually a prefix of these finite geodesics,
    so $q$ is a simple infinite geodesic.
  By Lemma 3,
  #[#set math.equation(numbering: n => "(18)")
   $ d_k \( x \) := T \( x \, p_k \) - B \( x \, p_k \) gt.eq 0 \, wide d_k \( x \) arrow.r
     0 . $ <eq:calibrated-limit-defect>]
  If $w$ lies on the geodesic from $x$ to $p_k$, then
  $ 0 lt.eq T \( x \, w \) - B \( x \, w \) lt.eq T \( x \, p_k \) - B \( x \, p_k \) = d_k \( x \) \, $
  because $T \( w \, p_k \) gt.eq B \( w \, p_k \)$. For each fixed vertex of the local limit,
    let $k$ tend to infinity along the chosen subsequence. This proves (17).
  For any $w in bb(Z)^2$, the same metric bound and (17) give
  $ T \( x \, q_j \) - T \( w \, q_j \) lt.eq B \( x \, q_j \) - B \( w \, q_j \) = B \( x \, w \) . $
  Consequently $B_q \( x \, w \) lt.eq B \( x \, w \)$. Write $sigma = rho_q$ and $rho = rho_p$.
    Asymptotic linearity, with the fixed basepoint $x$, and the choices $w = k e_i$ and $w = - k e_i$, $i = 1 \,
    2$, imply respectively $sigma \( e_i \) lt.eq rho \( e_i \)$ and $sigma \( e_i \) gt.eq rho \( e_i \)$.
    Thus $sigma = rho$. ◻
]

Call a label $rho in I$ #emph[exceptional] in an environment $omega$ if at least one of the following holds:

+ two distinct rays of label $rho$ start at the same vertex;
+ two rays of label $rho$ have different Busemann functions.

Denote this set by $cal(E)_I \( omega \)$.

#thm([Proposition 4.2.])[
  (Countability of exceptional labels).  #emph[Almost surely $cal(E)_I \( omega \)$ is at most countable.
    The same conclusion holds with $I$ replaced by $- I$.]
] <prop:exceptional-countable>

#proof[
  We prove the two assertions in the definition separately.
  #emph[Branching.] Fix a vertex $x$ and two different first edges $e \, f$ incident to $x$.
    There are at most two labels in $I$ that are realized both by a ray from $x$ beginning with $e$ and by one
    beginning with $f$. Suppose, to the contrary, that there are three such labels $rho_1 \, rho_2 \, rho_3$,
    with $r \( rho_1 \) < r \( rho_2 \) < r \( rho_3 \)$. Choose the six corresponding rays.
    The geodesics from $x$ form a tree: once two of them diverge, they cannot meet again,
    by uniqueness of finite geodesics. In particular the two first-edge branches are disjoint away from $x$.
  Choose a horizontal row sufficiently high that its six first-arrival vertices are distinct and have the label
    order supplied by Lemma 11. Such a row exists: rays of different labels have disjoint tails,
    and rays in the two first-edge branches never meet away from $x$.
    The endpoints occur as three consecutive groups, one for each label,
    and each group contains one endpoint of each branch. Color the endpoints according to the first edge $e$ or
    $f$. The resulting six-letter word is a concatenation of three two-letter words, each containing both colors.
    It has at least three changes of color, and hence contains an alternating four-letter subsequence.
  Connect the two $e$-colored endpoints of this subsequence by the unique arc in the $e$ branch,
    and connect the two $f$-colored endpoints by the corresponding arc in the $f$ branch.
    Both arcs avoid $x$, since the two root paths defining each arc share their first edge.
    Their interiors are strictly below the chosen row, since all six root paths were stopped on their first visit
    to that row. The arcs are disjoint, but their endpoints alternate along the row. This is impossible:
    the first arc together with the row segment between its ends is a Jordan curve,
    and the second arc must cross it away from the row. This proves the claim for $x \, e \, f$.
  Two distinct rays from a common vertex have a first vertex of divergence.
    Applying the preceding claim there, and taking the countable union over vertices and first-edge pairs,
    proves countability for condition (i).
  #emph[Busemann nonuniqueness.] First consider two vertices $x \, y$,
    with $y$ sufficiently far to the right of $x$ that the crossing conclusion of Lemma 13 applies to every pair
    of upper rays from these vertices with reversed strict label order.
    If $B \, B'$ are Busemann functions of upper rays with labels $rho \,
    sigma$ satisfying $r \( rho \) < r \( sigma \)$, then
  #[#set math.equation(numbering: n => "(19)")
   $ B \( x \, y \) lt.eq B' \( x \, y \) . $ <eq:ordered-busemann-values>]
  Indeed, use Lemma 14 to take a $B$-calibrated ray from $y$ and a $B'$-calibrated ray from $x$.
    Their labels are $rho$ and $sigma$, respectively, so they intersect at a vertex $w$.
    Calibration at $w$ and the metric bounds on Busemann increments give
  $ B \( x \, y \) & = B \( x \, w \) - T \( y \, w \) lt.eq T \( x \, w \) - T \( y \, w \)\
 & lt.eq T \( x \, w \) - B' \( y \, w \) = B' \( x \, y \) . $
  For such a pair $x \, y$, let
  $ S_rho \( x \, y \) = { B_p \( x \, y \) : p upright(" is a ray with label ") rho } . $
  These sets are bounded by $T \( x \, y \)$ in absolute value.
    If $r \( rho \) < r \( sigma \)$ and both sets are nonempty, (19) states that
  #[#set math.equation(numbering: n => "(20)")
   $ sup S_rho \( x \, y \) lt.eq inf S_sigma \( x \, y \) . $ <eq:ordered-value-ranges>]
  Thus the nonempty open intervals $\( inf S_rho \( x \, y \) \, sup S_rho \( x \, y \) \)$ are pairwise disjoint.
    Each contains a rational number, so only countably many labels can have more than one possible value at this pair.
  It remains to ensure that these comparisons detect every possible disagreement of Busemann functions.
    Fix arbitrary vertices $u \, v$. Proposition 12 supplies finite offsets controlling all upper rays from $u$
    and from $v$. For $y_N = \( N \, 0 \)$ it also supplies offsets $H_N =
    o \( N \)$ controlling all upper rays from $y_N$. The height differences between $y_N$ and $u \, v$ are fixed.
    For all sufficiently large integers $N$, the horizontal separations therefore dominate the offsets and height
    differences as required by Lemma 13. Choose any such $N$.
    Both pairs $\( u \, y_N \)$ and $\( v \, y_N \)$ then satisfy (20) for all labels and all their Busemann functions.
  If two upper-ray Busemann functions $B \, B'$ of the same label disagree at $\( u \, v \)$, additivity in
  $ B \( u \, v \) = B \( u \, y_N \) - B \( v \, y_N \) \, wide B' \( u \, v \) = B' \( u \, y_N \) -
    B' \( v \, y_N \) $
  forces a disagreement at one of those two comparison pairs.
    The labels producing a disagreement at $\( u \, v \)$ are consequently contained in a union of two countable
    sets. Taking a countable union over $u \, v in bb(Z)^2$ proves countability for condition (ii).
    The choice of $N$ may depend on the environment and on $u \, v$; it uses the all-ray cone bounds,
    and no common rate of Busemann convergence over labels. Reflection of the vertical coordinate proves the
    lower-sector assertion. ◻
]

=== 4.2 Independent environments and exceptional parameters <independent-environments-and-exceptional-parameters>

The probabilistic use of countability requires care because $cal(E)_I$ is random.
  We give the measurable argument before constructing the coupling that will use it.

#thm([Lemma 4.3.])[
  (Countable exceptional parameters in an independent metric).  #emph[Let $V \, W$ be independent environments,
    each with the iid law $bb(P)$. Almost surely, simultaneously for every $rho in cal(E)_I \( V \)$,
    all $W$-rays of label $- rho$ coalesce.]
] <lem:independent-exceptional>

#proof[
  Use the standard Borel configuration space $Omega$ before completing its probability measure,
    and the path space $cal(P) = \( bb(Z)^2 \)^(bb(N)_0)$. Let $sans(R) \( omega \, p \, rho \)$ be the assertion
    that $p$ is a simple nearest-neighbor ray in $omega$, that all its Busemann limits exist,
    and that its Busemann function is asymptotically linear to $rho$.
    For a linear functional $rho$, this is a Borel relation by Lemma 8.
    Define Busemann evaluations to be zero where their limits do not exist;
    the relation $sans(R)$ explicitly requires existence.
  For paths $p_1 \, p_2$ satisfying $sans(R) \( omega \, p_i \, rho \)$,
    the exceptionality witness is the Borel disjunction
  #[#set math.equation(numbering: n => "(21)")
   $ #scale(x: 120%, y: 120%)[\[] p_(1 \, 0) = p_(2 \, 0) med upright("and") med
     p_1 eq.not p_2 #scale(x: 120%, y: 120%)[\]] quad upright("or") quad #scale(x: 120%, y: 120%)[\[] exists x \,
     y in bb(Z)^2 : B_(p_1) \( x \, y \) eq.not B_(p_2) \( x \, y \) #scale(x: 120%, y: 120%)[\]] .
     $ <eq:exceptional-witness-test>]
  The common-tail test for paths $q_1 \, q_2$ is Borel as well:
  #[#set math.equation(numbering: n => "(22)")
   $ exists a \, b in bb(N)_0 quad forall k in bb(N)_0 : med q_(1 \, a + k) = q_(2 \, b + k) . $ <eq:common-tail-test>]
  Its negation tests noncoalescence.
  Now define the bad set $J subset Omega times Omega$ by the existence of one label $rho in
    I$ and four paths $p_1 \, p_2 \, q_1 \, q_2$ such that
  + $sans(R) \( v \, p_i \, rho \)$ holds for $i = 1 \, 2$, and (21) holds in $v$;
  + $sans(R) \( w \, q_i \, - rho \)$ holds for $i = 1 \, 2$, and (22) fails.
  This is directly the projection of a Borel relation on $Omega^2 times I times cal(P)^4$.
    In particular, $J$ is analytic and is measurable in the completion of $bb(P) ⊗ bb(P)$.
  For every $v$ in the full-measure countability event of Proposition 15, its section is
  #[#set math.equation(numbering: n => "(23)")
   $ J_v = union.big_(rho in cal(E)_I \( v \)) { w : upright("two ") w upright("-rays of label ") -
     rho upright(" do not coalesce") } . $ <eq:countable-null-section>]
  For this fixed $v$, each label in the countable union is an ordinary fixed parameter.
    Symmetry gives $- rho in C$, and Theorem 4 makes the corresponding analytic event in $w$ null.
    Hence $bb(P) \( J_v \) = 0$ for almost every $v$. Completed-product Fubini gives
    $\( bb(P) ⊗ bb(P) \) \( J \) = 0$. Equivalently, replace $J$ by a Borel set equal to it outside a Borel
    product-null set and apply ordinary Fubini; the sections of that null set are null for almost every $v$.
    This argument needs no measurable enumeration of $cal(E)_I \( v \)$.
  No universal all-ray condition is inserted into the four-path relation.
    Such regularity conditions are imposed outside the projection, as specified after Lemma 8. ◻
]

=== 4.3 Transfer across a horizontal cut <transfer-across-a-horizontal-cut>

Let $U$ have the iid law. For $n gt.eq 1$, set

$ H_n = { z in bb(Z)^2 : z_2 = - n } \, wide E_n^(+) = { { x \, y } : x tilde.op y \, med x_2 gt.eq - n \, med
  y_2 gt.eq - n } . $

Take independent iid replacement arrays $A^(\( n \)) \, D^(\( n \))$, all independent of $U$, and define

#[#set math.equation(numbering: n => "(24)")
 $ \( V_n \)_e = cases(delim: "{", U_e \, & e in E_n^(+) \,, A_e^(\( n \)) \, & e in.not E_n^(+) \,)
   wide \( W_n \)_e = cases(delim: "{", D_e^(\( n \)) \, & e in E_n^(+) \,, U_e \, & e in.not E_n^(+) .)
   $ <eq:half-plane-coupling>]

For each $n$, the pair $\( V_n \, W_n \)$ has law $bb(P) ⊗ bb(P)$:
  the coordinates of $U$ retained in its two members are disjoint,
  and their replacement coordinates are independent. Independence of the pairs for different $n$ is neither
  asserted nor needed.

We will use $V_n$ to retain the two upper rays witnessing an exceptional label,
  with their exact label and any distinguishing Busemann evaluation.
  After choosing one such cut, $W_n$ must retain tails of arbitrary rays with the opposite label,
  so that Lemma 16 can be applied to the independent pair $\( V_n \, W_n \)$.

#thm([Lemma 4.4.])[
  (Half-plane transfer).  #emph[There is a deterministic increasing sequence $n_k arrow.r
    oo$ and an event of probability one for the coupling (24) with the following properties.]
  + #emph[For every finite collection of upper $U$-rays and every finite set $K subset bb(Z)^2$,
    all sufficiently large $k$ have the following property. Every ray $p$ in that collection is a $V_(n_k)$-ray
    with exactly its original label, and
$ B_p^(V_(n_k)) \( x \, y \) = B_p^U \( x \, y \) wide \( x \, y in K \) . $

 More precisely, for each such $k$ and $p$, the distances $T_(V_(n_k)) \( x \, p_j \)$ and $T_U \( x \, p_j \)$
   are equal for all sufficiently large $j$, simultaneously for $x in K$.]
  + #emph[For each fixed $n gt.eq 1$, every lower $U$-ray has a tail which is a $W_n$-ray with exactly its
    original label.]
  #emph[The thresholds may depend on the rays, their labels, $K$, and, in part (ii), on $n$.]
] <lem:cut-transfer>

#proof[
  First take a common event on which all-ray asymptotics, finite geodesic existence and uniqueness,
    and the uniform metric estimate hold in $U$ and in all $V_n \, W_n$.
    This is a countable intersection of events of probability one.
  #emph[A single subsequence for the moving cuts.] For any metric $T$ put
  #[#set math.equation(numbering: n => "(25)")
   $ E_n \( T \) = sup_(x \, y in bb(Z)^2) frac(\| T \( x \, y \) - m \( y - x \) \|, \| x \| + \| y \| + n) .
     $ <eq:moving-metric-error>]
  For a fixed typical metric, $E_n \( T \) arrow.r 0$. Indeed, for any $epsilon > 0$,
    Lemma 6 bounds the numerator by $epsilon \( \| x \| + \| y \| \)$ outside a finite set of pairs.
    The maximum error on the remaining finite set, divided by $n$, tends to zero.
    Since each $V_n$ has the iid law, $E_n \( T_(V_n) \) arrow.r 0$ in probability.
    Choose an increasing deterministic sequence $n_k$ such that
  $ bb(P) #scale(x: 120%, y: 120%)[\(] E_(n_k) \( T_(V_(n_k)) \) > 2^(- k) #scale(x: 120%, y: 120%)[\)] < 2^(- k) . $
  After a further probability-one restriction, Borel–Cantelli gives
  #[#set math.equation(numbering: n => "(26)")
   $ E_(n_k) \( T_(V_(n_k)) \) arrow.r 0 . $ <eq:subsequence-metric-error>]
  This is the only subsequence used in the proof.
  Fix now an arbitrary upper $U$-ray $p$, with label $rho in I$. Write
  #[#set math.equation(numbering: n => "(27)")
   $ a \( w \) = B_p^U \( 0 \, w \) - rho \( w \) = o \( \| w \| \) \, wide B_p^U \( x \, z \) = rho \( z - x \) +
     a \( z \) - a \( x \) . $ <eq:rooted-busemann-error>]
  All contacts of $rho$ are strictly upper, so compactness gives
  #[#set math.equation(numbering: n => "(28)")
   $ gamma = min_(\| d \| = 1 \, med d_2 lt.eq 0) #scale(x: 120%, y: 120%)[\(] m \( d \) -
     rho \( d \) #scale(x: 120%, y: 120%)[\)] > 0 . $ <eq:opposite-semicircle-gap>]
  Let $K$ be finite and enlarge it to contain $p_0$. Set $R_K = max_(x in K) \| x \|$.
    For $n gt.eq 2 R_K + 1$, $x in K$, and $z in H_n$, the vector $z - x$ points into the lower half-plane and
  #[#set math.equation(numbering: n => "(29)")
   $ \| z - x \| gt.eq \| z \| \/ 2 \, wide \| x \| + \| z \| + n lt.eq 5 / 2 \| z \| lt.eq 5 \| z -
     x \| . $ <eq:moving-cut-comparability>]
  For $n = n_k$, (25) therefore yields
  #[#set math.equation(numbering: n => "(30)")
   $ T_(V_n) \( x \, z \) - B_p^U \( x \, z \) & gt.eq gamma \| z - x \| -
     E_n \( T_(V_n) \) \( \| x \| + \| z \| + n \) - \| a \( z \) \| - \| a \( x \) \| .
     $ <eq:moving-cut-barrier-estimate>]
  The metric error is $o \( \| z - x \| \)$ uniformly over these $x \, z$, by (26) and (29).
    The same is true of $\| a \( z \) \|$: $\| z \| gt.eq n arrow.r oo$ uniformly on the cut, and $\| z \| lt.eq
    2 \| z - x \|$. Finally, the finitely many $\| a \( x \) \|$ are bounded.
    Thus, for all sufficiently large $k$, uniformly for $x in K$ and $z in H_(n_k)$,
  #[#set math.equation(numbering: n => "(31)")
   $ T_(V_(n_k)) \( x \, z \) - B_p^U \( x \, z \) gt.eq gamma / 2 \| z - x \| gt.eq gamma /
     4 n_k . $ <eq:moving-cut-positive-barrier>]
  The same estimate holds with $V_(n_k)$ replaced by $U$, because $E_n \( T_U \) arrow.r 0$.
  #emph[The last-cut comparison.] The heights of $p_j$ tend to $+ oo$,
    so the entire ray lies strictly above $H_n$ for all sufficiently large $n$.
    If a finite walk from $x$ to $p_j$, with both endpoints above the cut, visits $H_n$,
    let $z$ be its last cut vertex. Its suffix after $z$ lies strictly above the cut and uses only edges in
    $E_n^(+)$. Its cost in $V_n$ is consequently at least
  #[#set math.equation(numbering: n => "(32)")
   $ T_(V_n) \( x \, z \) + B_p^U \( z \, p_j \) & = B_p^U \( x \, p_j \) +
     #scale(x: 120%, y: 120%)[\[] T_(V_n) \( x \, z \) - B_p^U \( x \, z \) #scale(x: 120%, y: 120%)[\]] .
     $ <eq:last-cut-lower-bound>]
  The suffix bound uses only $B_p^U \( z \, p_j \) lt.eq T_U \( z \, p_j \)$ and its unchanged edge costs.
    Repeated visits to the cut and repeated edges in the walk cause no problem:
    all occur either in the prefix or in a suffix whose cost still bounds the corresponding distance.
    The same comparison holds in $U$.
  For $x = p_0$, the original segment of $p$ has cost $B_p^U \( p_0 \, p_j \)$ and is unchanged.
    By (31) every cut-touching competitor is more expensive; a competitor avoiding the cut has its original $U$
    cost. Hence every prefix of $p$ minimizes in $V_(n_k)$ for all sufficiently large $k$, and $p$ is a ray there.
  For any fixed $x in K$, (18), applied in $U$, says that
  $ T_U \( x \, p_j \) - B_p^U \( x \, p_j \) arrow.r 0 . $
  Fix a sufficiently large $k$. Eventually this defect is smaller than $gamma n_k \/ 4$.
    By the $U$ version of (32), a $U$-geodesic to $p_j$ must then avoid the cut.
    It provides an unchanged competitor in $V_(n_k)$. The $V_(n_k)$ version excludes every cut-touching walk that
    could improve that competitor, and every walk avoiding the cut has its $U$ cost. It follows that
  #[#set math.equation(numbering: n => "(33)")
   $ T_(V_(n_k)) \( x \, p_j \) = T_U \( x \, p_j \) quad upright("for all sufficiently large ") j .
     $ <eq:finite-witness-distance-equality>]
  Because $K$ is finite, one target-index threshold works for all its vertices.
    Subtracting two such distance equalities and taking the limit preserves every $B_p \( x \, y \)$ with $x \, y in K$.
  #emph[Exact identification of the label at a fixed cut.] Preservation of a path alone does not identify both
    coordinates of its Busemann asymptote. Fix one $n = n_k$ for which $p$ was preserved,
    and henceforth regard $U \, V_n$, and the cut as fixed. Fix $0 < c < 1$, take $x$ in the sector $x_2 gt.eq
    c \| x \|$, and let $z in H_n$. With $d = z - x$ we have
  $ \| d \| gt.eq x_2 + n gt.eq c \| x \| \, wide \| z \| lt.eq \| d \| + \| x \| . $
  Consequently
  #[#set math.equation(numbering: n => "(34)")
   $ \| z - x \| gt.eq kappa \( \| x \| + \| z \| \) \, wide kappa =
     frac(c, c + 2) > 0 . $ <eq:fixed-cut-comparability>]
  This bound holds uniformly along the entire infinite cut,
    including cut vertices with arbitrarily large horizontal coordinate. Since $d_2 < 0$, (28) gives
  $ m \( d \) - rho \( d \) gt.eq gamma kappa \( \| x \| + \| z \| \) . $
  For every $epsilon > 0$ there is $C_epsilon < oo$ such that $\| a \( w \) \| lt.eq epsilon \| w \| +
    C_epsilon$ for every $w$. The fixed-metric uniform estimate, separately in $U$ and $V_n$, and (27) now give,
    for $\| x \|$ sufficiently large in the sector and every $z in H_n$,
  $ T_(V_n) \( x \, z \) - B_p^U \( x \, z \) & gt.eq \( gamma kappa - 2 epsilon \) \( \| x \| + \| z \| \) -
    2 C_epsilon . $
  Choose $epsilon < gamma kappa \/ 8$ and then increase the lower bound on $\| x \|$.
    In both metrics we obtain the uniform barrier
  #[#set math.equation(numbering: n => "(35)")
   $ min { T_(V_n) \( x \, z \) \, T_U \( x \, z \) } - B_p^U \( x \, z \) gt.eq
     frac(gamma kappa, 2) \( \| x \| + \| z \| \) . $ <eq:fixed-cut-positive-barrier>]
  In particular, the error at the moving basepoint $x$, as well as that at $z$, has been included explicitly.
  For each such $x$, its calibration defect tends to zero as the target runs out along $p$.
    The last-cut argument just used proves $T_(V_n) \( x \, p_j \) =
    T_U \( x \, p_j \)$ for all sufficiently large $j$. Meanwhile the preserved root $p_0$ satisfies
    $T_(V_n) \( p_0 \, p_j \) = T_U \( p_0 \, p_j \)$ for every $j$, whether or not $p_0$ is in the strict sector. Thus
  #[#set math.equation(numbering: n => "(36)")
   $ B_p^(V_n) \( p_0 \, x \) = B_p^U \( p_0 \, x \) quad upright("for all sufficiently far ") x upright(" with ")
     x_2 gt.eq c \| x \| . $ <eq:sector-busemann-equality>]
  Take $c = 1 \/ 2$, and use first $x = k e_2$ and then $x = k \( e_1 + e_2 \)$.
    Dividing (36) by $k$ and using asymptotic linearity in the two fixed environments shows that their labels
    agree on $e_2$ and $e_1 + e_2$. These vectors are independent, so the labels are exactly equal.
  All steps so far are pathwise on the common event already chosen.
    For a finite collection of rays, apply them to each ray and take the largest of the finitely many thresholds.
    This proves part (i), with the stated quantifiers.
  #emph[Lower tails for a fixed $W_n$.] Fix $n$ and an arbitrary lower $U$-ray $q$ of label $lambda in - I$. Use
  $ a_(-) \( w \) = B_q^U \( 0 \, w \) - lambda \( w \) = o \( \| w \| \) \,\
gamma_(-) = min_(\| d \| = 1 \, med d_2 gt.eq 0) \( m \( d \) - lambda \( d \) \) > 0 . $
  Choose $c in \( 0 \, 1 \/ 2 \]$ small enough that eventually $q_(j \, 2) lt.eq - c \| q_j \|$.
    This is possible because the limit directions of $q$ lie in the strict lower sector of the chart.
    If $x_2 lt.eq - c \| x \|$, $\| x \| gt.eq 2 n \/ c$, and $z in H_n$, then
  $ \| z - x \| gt.eq c \| x \| - n gt.eq c / 2 \| x \| \, wide \| x \| + \| z \| lt.eq \( 1 + 4 \/ c \) \| z - x \| . $
  The displacement $z - x$ points upward. Applying the fixed-metric uniform estimate to $U \,
    W_n$ and bounding both errors $a_(-) \( x \) \, a_(-) \( z \)$ exactly as above gives,
    for all sufficiently large $\| x \|$ in this lower sector, uniformly for $z in H_n$,
  #[#set math.equation(numbering: n => "(37)")
   $ min { T_(W_n) \( x \, z \) \, T_U \( x \, z \) } - B_q^U \( x \, z \) gt.eq
     frac(gamma_(-) c, 2 \( c + 4 \)) \( \| x \| + \| z \| \) . $ <eq:lower-fixed-cut-barrier>]
  Only the usual uniform estimate in this particular fixed $W_n$ has been used.
  Choose a vertex $a = q_L$ sufficiently far along $q$ that (37) applies to $a$ and the whole remaining tail lies
    strictly below $H_n$. For a walk from $a$ to a later $q_j$ that touches the cut, take its last cut vertex $z$.
    After this last visit its first edge goes downward and every later vertex is strictly below the cut.
    Every edge of this suffix is outside $E_n^(+)$ and hence is shared by $U$ and $W_n$.
    Horizontal edges on the cut, which are not shared, are part of the prefix.
    The analogue of (32), now using (37), shows that this walk is more expensive than the unchanged segment of
    $q$. Walks that avoid the cut have their $U$ costs. Thus the tail from $a$ is a $W_n$-ray,
    and its distances from $a$ to all later $q_j$ are unchanged.
  Finally take any sufficiently far $x$ in the strict lower sector.
    Its $U$ calibration defect relative to $q_j$ tends to zero,
    so (37) and the last-cut argument give eventual equality of distances from $x$ in the two environments.
    Using the preserved anchor $a$ yields equality of the two tail Busemann functions at $\( a \, x \)$.
    The sequences $x = - k e_2$ and $x = - k \( e_1 + e_2 \)$ belong to this sector for our choice $c lt.eq
    1 \/ 2$. Asymptotic linearity along them identifies the label of the $W_n$-tail as exactly $lambda$.
  Since all $W_n$ were included in the initial countable probability-one event,
    the argument applies to every fixed $n$ and every lower ray, with its own tail index.
    There is no estimate on the rate of convergence of the sequence of metrics $W_n$,
    and no uniformity of thresholds over labels is required. ◻
]

=== 4.4 The simultaneous conclusion <the-simultaneous-conclusion>

#thm([Proposition 4.5.])[
  (Coalescence at opposite exceptional labels).  #emph[Almost surely,
    simultaneously for all $rho in cal(E)_I \( U \)$, every two $U$-rays of label $- rho$ coalesce.
    Almost surely the same statement holds with upper and lower sectors exchanged.
    These conclusions hold simultaneously for the countable collection of charts under consideration.]
] <prop:opposite-coalescence>

#proof[
  Use the coupling (24). For every $n$, Lemma 16 applies to $\( V_n \, W_n \)$.
    Take their countable intersection, together with the probability-one event in Lemma 17.
  On this event, fix any $rho in cal(E)_I \( U \)$ and two upper rays witnessing its exceptionality.
    If they witness branching, their distinct paths and common starting vertex are preserved by Lemma 17(i) for
    every sufficiently deep subsequence cut. If instead they witness different Busemann functions,
    choose one pair $x \, y$ at which those functions differ and include $x \,
    y$ in the finite witness set of that lemma. At every sufficiently deep subsequence cut the two paths retain
    both their exact label $rho$ and those unequal evaluations.
    In either case choose one such cut $n$; then $rho in cal(E)_I \( V_n \)$.
  Now let $q \, q'$ be any two lower $U$-rays of label $- rho$.
    Lemma 17(ii), for this fixed $n$, supplies tails of both which are $W_n$-rays of the same exact label $- rho$.
    They coalesce by the property of $\( V_n \, W_n \)$. Equality of their tails is equality of their vertex
    sequences and thus also means that the original $U$-rays coalesce.
  The argument made arbitrary pathwise choices of $rho$ and its witnesses after the common event was fixed.
    It therefore proves the simultaneous assertion in the coupling, and hence for its $U$ marginal.
    Its failure is itself the analytic four-witness event with both environments set equal to $U$,
    so it is measurable in the completed marginal space. Reflection gives the reversed statement;
    a countable intersection gives both statements in all charts. ◻
]

== 5 A label budget on horizontal lines <sec:budget>

Fix a chart $I$ from 10, with horizontal order $r$ and cone slope $s > 0$ as in 12.
  For each deterministic label $gamma$ used below, $B_gamma$ denotes the common Busemann function of its
  coalescing family in the base environment.

The comparison concerns a bigeodesic in a finitely increased metric whose upper label lies between two
  deterministic labels $alpha \, beta$ with $r \( alpha \) < r \( beta \)$.
  Suppose the increase adds a total cost $b$ on finite initial portions of its arms from a site $k$.
  Under the cone bounds stated below, the base upper $alpha$-ray and lower $-
  beta$-ray from a sufficiently distant site $y$ to the right supply a bypass in unchanged weights. We will prove that

$ b lt.eq B_alpha \( y \, k \) + B_(- beta) \( y \, k \) . $

For successive sites whose labels lie in the same interval, these increments telescope.
  Their two linear parts leave the width $r \( beta \) - r \( alpha \)$ as the available cost per horizontal unit.
  We first use this budget in a one-edge resampling estimate needed to exclude forks,
  and later to contradict the growing gains constructed in 7.

Choose deterministic nested finite sets $D_1 subset D_2 subset dots.h.c$ of labels in $I$,
  containing both chart endpoints, such that their union $D_I$ is dense in $I$ and $r \( D_I \)$ contains the
  endpoints of every complementary interval of $r \( I \)$ in its convex hull.
  There are only countably many such intervals, so these choices are possible. The bins of $Pi_j$ are

$ \( alpha \, beta \)_I = { rho in I : r \( alpha \) < r \( rho \) < r \( beta \) } \, $

where $alpha \, beta$ are consecutive members of $D_j$ in $r$-order. Empty bins may be retained.
  Their widths always sum to

#[#set math.equation(numbering: n => "(38)")
 $ W_I = r \( rho_r \) - r \( rho_ell \) . $ <eq:chart-width>]

Every two distinct labels of $I \\ D_I$ eventually belong to different bins.
  If a label lies strictly between them, density supplies an intervening member of $D_I$;
  otherwise they are endpoints of a complementary interval and already belong to $D_I$.

By 5, almost surely no bigeodesic has an end label in the deterministic countable set $D_I union \( - D_I \)$.
  The same exclusion and the fixed-functional conclusions of 4 hold simultaneously for all partition endpoints in
  all charts, and in every countable collection of environments whose laws are absolutely continuous with respect
  to the iid law. We work on the corresponding common event.
  Every fixed-label comparator ray is calibrated by its $B_gamma$, by 3.

#thm([Lemma 5.1.])[
  (Comparison after a finite increase).  #emph[Let $T$ be a base metric and $T^k$ a metric obtained by increasing
    finitely many edge weights. Both environments are assumed to have the structural properties already
    established. Suppose that $k \, y$ lie on the same horizontal line, with $k_1 < y_1$,
    and that the following conditions hold for a bin $\( alpha \, beta \)_I$.]
  + #emph[Every changed edge has both endpoints in ${ z : \| z - k \|_oo lt.eq R }$, where $R gt.eq 1$.]
  + #emph[In $T^k$ there is an oriented bigeodesic through $k$ with upper label $rho in \( alpha \, beta \)_I$.
    Its arms $p^(+)$ and $p^(-)$ are contained in $Q^(+) \( k \, H_p \)$ and $Q^(-) \( k \, H_p \)$, respectively.]
  + #emph[Finite initial portions of these two arms have all their vertices in the same ball of radius $R$,
    and the sum of the increases along those portions is at least $b > 0$.]
  + #emph[The base rays from $y$ of labels $alpha$ and $- beta$ are contained in $Q^(+) \( y \, H_c \)$ and
    $Q^(-) \( y \, H_c \)$, respectively.]
  #emph[There is a separation $S = S \( s \, R \, H_p \, H_c \)$ such that $y_1 - k_1 > S$ implies
#[#set math.equation(numbering: n => "(39)")
 $ b lt.eq B_alpha \( y \, k \) + B_(- beta) \( y \, k \) . $ <eq:budget-comparison>]

 One may take
#[#set math.equation(numbering: n => "(40)")
 $ S = max {R + frac(R + H_c, s) \, frac(H_p + H_c, s)} lt.eq C_s \( 1 + R + H_p + H_c \) \, $ <eq:budget-separation>]

 with $C_s$ depending only on $s$. In particular, the choice of $S$ is uniform over bins and does not depend on
   the magnitudes of the individual increases.]
] <lem:budget-comparison>

#proof[
  Put $d = y_1 - k_1$. If a vertex $w$ belongs to the ball of radius $R$ about $k$, then
  $ \| w_2 - y_2 \| lt.eq R \, wide \| w_1 - y_1 \| gt.eq d - R . $
  Membership in either comparator cone would therefore require $R gt.eq s \( d - R \) - H_c$. Thus
  #[#set math.equation(numbering: n => "(41)")
   $ d > R + frac(R + H_c, s) $ <eq:avoid-gain-ball>]
  makes both base comparator rays avoid the entire ball. Their edge weights are unchanged in $T^k$.
    Since every other edge weight only increases, each comparator remains a geodesic ray in $T^k$.
    7 preserves its label.
  Increase the separation further, if necessary, to apply 13 with offsets $H_p \, H_c$.
    The upper marked ray is to the left at its starting site but has label strictly east of $alpha$.
    The same ordering holds for the lower rays, since
  $ r \( - beta \) = - r \( beta \) < - r \( rho \) = r \( - rho \) . $
  The upper comparator therefore meets $p^(+)$, and the lower comparator meets $p^(-)$.
    Call intersection vertices $w^(+)$ and $w^(-)$, respectively. By (41), each intersection is outside the ball.
    Consequently it occurs after the whole prescribed initial gain portion of the corresponding marked arm.
    This remains true if an arm leaves and later reenters the ball,
    since every vertex of its prescribed initial portion lies in the ball.
  Let $g^(+)$ and $g^(-)$ be the increases on those portions, so $g^(+) + g^(-) gt.eq b$.
    Writing $"cost"_T$ for the cost of a specified finite path in the base weights,
    domination by passage time and then by a Busemann increment gives
  $ "cost"_(T^k) \( p^(+) \[ k \, w^(+) \] \) & gt.eq g^(+) + "cost"_T \( p^(+) \[ k \, w^(+) \] \) gt.eq g^(+) +
    B_alpha \( k \, w^(+) \) \,\
"cost"_(T^k) \( p^(-) \[ k \, w^(-) \] \) & gt.eq g^(-) + "cost"_T \( p^(-) \[ k \, w^(-) \] \) gt.eq g^(-) +
  B_(- beta) \( k \, w^(-) \) . $
  The marked segment from $w^(-)$ through $k$ to $w^(+)$ is minimizing in $T^k$.
    A competing finite walk follows the lower comparator backwards from $w^(-)$ to $y$,
    then follows the upper comparator to $w^(+)$. The cost of this walk in $T^k$ equals its base cost, namely
  $ B_(- beta) \( y \, w^(-) \) + B_alpha \( y \, w^(+) \) . $
  No disjointness between the two comparator portions is required:
    a finite walk is an admissible competitor and its cost counts every traversal.
    Comparison with the marked segment yields
  $ b + B_alpha \( k \, w^(+) \) + B_(- beta) \( k \, w^(-) \) lt.eq B_alpha \( y \, w^(+) \) +
    B_(- beta) \( y \, w^(-) \) . $
  Additivity cancels the increments ending at the intersection vertices and gives exactly (39).
    Both the avoidance bound and the separation in 13 have the asserted dependence on the offsets and $R$. ◻
]

#thm([Proposition 5.2.])[
  (The label budget).  #emph[Fix a bin $\( alpha \, beta \)_I$, an integer spacing $l gt.eq 1$,
    and a gain $b > 0$. On a common probability space, mark some sites of the horizontal grid
    $k_j = \( j l \, 0 \)$, $j in bb(Z)$. Suppose all sites have the same marginal probability $q_(alpha \, beta)$
    of being marked in this bin, and the base environment has its usual fixed-label Busemann asymptotics.
    Suppose also that for successive marks $k < y$ in the bin the comparison (39) holds.
    In particular, this is so if the hypotheses of 19 hold with common deterministic bounds and successive marks
    are sufficiently separated. Then
#[#set math.equation(numbering: n => "(42)")
 $ b / l thin q_(alpha \, beta) lt.eq r \( beta \) - r \( alpha \) . $ <eq:label-budget>]

 No independence or ergodicity assumption on the marks is needed.]
] <prop:label-budget>

#proof[
  Set $w = r \( beta \) - r \( alpha \) > 0$ and, for $j gt.eq 0$, write
  $ A_j = B_alpha \( 0 \, k_j \) + B_(- beta) \( 0 \, k_j \) = - w j l + e_j . $
  The sign in this formula uses $alpha \( e_1 \) + \( - beta \) \( e_1 \) = r \( alpha \) - r \( beta \) = - w$.
    The two fixed-label asymptotics give $e_j = o \( j l \)$ as $j arrow.r oo$. Define
  $ E_N = max_(0 lt.eq j lt.eq N) \| e_j \| . $
  Then $E_N \/ \( N l \) arrow.r 0$ almost surely. To see the needed uniformity,
    for each $delta > 0$ choose $J$ so that $\| e_j \| lt.eq delta j l$ when $j gt.eq J$.
    The earlier errors have a finite maximum $C_J$, and $E_N lt.eq max { C_J \, delta N l }$.
    Let $N arrow.r oo$ and then $delta arrow.b 0$. This argument controls random first and last marks without
    replacing them by deterministic endpoints.
  Let $m_N$ be the number of marks in ${ k_0 \, dots.h \, k_N }$.
    If $m_N gt.eq 2$, list their indices as $i_1 < dots.h.c < i_(m_N)$.
    Summing the comparison over consecutive marks and using additivity gives
  $ b \( m_N - 1 \) & lt.eq A_(i_1) - A_(i_(m_N))\
 & = w l \( i_(m_N) - i_1 \) + e_(i_1) - e_(i_(m_N)) lt.eq w N l + 2 E_N . $
  If $m_N = 0$ or $1$, the same upper bound applies to $b \( m_N - 1 \)_(+)$. Therefore, in all cases,
  #[#set math.equation(numbering: n => "(43)")
   $ b m_N lt.eq b + w N l + 2 E_N \, wide limsup_(N arrow.r oo) frac(m_N, N l) lt.eq w / b quad
     upright("almost surely") . $ <eq:bounded-budget-count>]
  The expectation step uses only the deterministic bounds
  $ 0 lt.eq frac(m_N, N l) lt.eq frac(N + 1, N l) lt.eq 2 / l \, wide N gt.eq 1 . $
  Fatou’s lemma applied to the nonnegative variables $2 \/ l -
    m_N \/ \( N l \)$ gives the bounded reverse Fatou inequality
  $ limsup_(N arrow.r oo) bb(E) frac(m_N, N l) lt.eq bb(E) [limsup_(N arrow.r oo) frac(m_N, N l)] lt.eq w / b . $
  Equal marginal probabilities imply $bb(E) m_N = \( N + 1 \) q_(alpha \, beta)$ by linearity of expectation.
    Hence $q_(alpha \, beta) \/ l lt.eq w \/ b$, as asserted.
    In particular, this proof takes no expectation of either a Busemann error or a Busemann increment. ◻
]

We now prepare the one-edge resampling estimate. Replacing an edge by an independent sample keeps the output
  environment iid. Choosing the old weight below one level and the replacement above a larger level creates a
  fixed positive gain. The same thresholds will ensure that long simple paths contain many edges above the larger
  level. These edges supply the edge–label credits in the fork count and the accumulated gains in the later
  perturbations.

#thm([Lemma 5.3.])[
  (Usable edges on long simple paths).  #emph[There exist $a_0 < b_0$ such that
#[#set math.equation(numbering: n => "(44)")
 $ p_a = bb(P) \( t_e lt.eq a_0 \) > 0 \, wide q = bb(P) \( t_e < b_0 \) < 1 / 64 \,\
p_b = bb(P) \( t_e gt.eq b_0 \) = 1 - q > 0 . $ <eq:low-usable-probabilities>]

 Call an edge #emph[usable] if $t_e gt.eq b_0$, and put $theta = 8 sqrt(q) < 1$.
   For each vertex $x$ and integer $n_0 gt.eq 1$,
#[#set math.equation(numbering: n => "(45)")
 $ bb(P)
   vec(upright("some simple path from ") x upright(" of length ") j gt.eq n_0, upright("has fewer than ") j \/ 2
   upright(" usable edges")) lt.eq frac(theta^(n_0), 1 - theta) . $ <eq:usable-fixed-site>]

 If $U_n$ is the event that every simple path starting in $\[ - 3 n \, 3 n \]^2 ∩
   bb(Z)^2$ and having length at least $n \/ 2$ has at least half its edges usable, then
#[#set math.equation(numbering: n => "(46)")
 $ bb(P) \( U_n^c \) lt.eq \( 6 n + 1 \)^2 frac(theta^(ceil.l n \/ 2 ceil.r), 1 - theta) arrow.r 0 . $ <eq:usable-box>]

 Almost surely, at every fixed vertex all sufficiently long simple paths satisfy the same fraction bound.]
] <lem:usable>

#proof[
  Let $a$ be the bottom of the support of $G$. It is finite, and $G \( { a } \) = 0$.
    As $b arrow.b a$ with $b > a$, the probability $G \( \[ 0 \, b \) \)$ tends to zero and is positive.
    Choose $b_0 > a$ so that this probability is less than $1 \/ 64$, and choose $a_0 in \( a \, b_0 \)$.
    The definition of $a$ gives $p_a > 0$, proving (44).
  The edges of a simple path are distinct. For a specified path of length $j$,
    independence and a union bound over subsets of its edges bound the probability that at least $j \/
    2$ of them are unusable by
  $ 2^j q^(j \/ 2) . $
  This also bounds the probability of fewer than $j \/ 2$ usable edges.
    There are at most $4^j$ nearest-neighbor paths of length $j$ from a given vertex,
    so the union bound over simple paths is at most $theta^j$.
    Summing over $j gt.eq n_0$ proves (45); the further union bound over the $\( 6 n + 1 \)^2$ starting vertices
    proves (46). Finally, the events in (45) decrease as $n_0 arrow.r oo$, and their probabilities tend to zero.
    Countability gives the last assertion simultaneously at all vertices.
    These estimates use no moment of an individual edge weight. ◻
]

For an edge $e = { x \, x + v }$, where $v$ is a lattice unit vector, and $H gt.eq 1$,
  let $cal(R)_e \( H \)$ be the following regularity event in the environment under consideration:
  from each endpoint $z$ of $e$, every ray with label in $I$ is contained in $Q^(+) \( z \, H \)$,
  and every ray with label in $- I$ is contained in $Q^(-) \( z \, H \)$.
  Set $N_e \( H \) = 0$ if $e$ is unusable or $cal(R)_e \( H \)$ fails. Otherwise define

#[#set math.equation(numbering: n => "(47)")
 $ N_e \( H \) = \# { rho in I : e upright(" lies on a bigeodesic of upper label ") rho } .
   $ <eq:edge-label-count-definition>]

Here the count is the number of distinct labels, and is assigned the value $oo$ if the set is infinite.
  This convention does not presuppose that the label set is countable.
  By 8, existence of finitely many distinct witnessing labels is measurable in the completed space.
  The universal regularity event is imposed as a separate environment-only filter;
  it is not inserted into an existential path projection.

#thm([Proposition 5.4.])[
  (Expected label count at an edge).  #emph[There is a finite constant $C$,
    depending only on the chart and the weight law, such that for every lattice edge $e$ and every $H gt.eq 1$,
#[#set math.equation(numbering: n => "(48)")
 $ bb(E) N_e \( H \) lt.eq C \( H + 1 \) . $ <eq:edge-label-count>]

]
] <prop:edge-count>

#proof[
  Fix a unit vector $v$ and let $e_k = { k \, k + v }$ for sites $k$ on a horizontal grid whose spacing will be
    chosen below. Use one iid base environment $t$ and independent samples $hat(t)_(e_k)$ with law $G$.
    The individual environment $t^k$ equals $t$ off $e_k$ and equals $hat(t)_(e_k)$ on $e_k$.
    Each individual environment has precisely the iid law. We take the common full-measure event for the base and
    all these countably many individual environments, including the fixed-label exclusions at every endpoint in
    $D_I$ and $- D_I$.
  For a bin $\( alpha \, beta \)_I$, let $A_e^(alpha \, beta) \( H \)$ denote the event in an iid environment that
    $e$ is usable, $cal(R)_e \( H \)$ holds, and a bigeodesic whose upper label is in this bin uses $e$.
    Mark $k$ in this bin when
  #[#set math.equation(numbering: n => "(49)")
   $ t_(e_k) lt.eq a_0 quad upright("and") quad A_(e_k)^(alpha \, beta) \( H \) upright(" holds in ") t^k .
     $ <eq:one-edge-mark>]
  The original variable $t_(e_k)$ is independent of the entire individual environment $t^k$:
    that environment consists of the independent sample $hat(t)_(e_k)$ and the other base coordinates.
    Consequently the common marginal marking probability is exactly
  #[#set math.equation(numbering: n => "(50)")
   $ q_(alpha \, beta) = p_a thin bb(P) #scale(x: 120%, y: 120%)[\(] A_e^(alpha \, beta) \( H \)
     #scale(x: 120%, y: 120%)[\)] \, $ <eq:one-edge-mark-probability>]
  where $e$ is any fixed translate of ${ 0 \, v }$. The regularity test is measurable in the individual
    environment, so it does not alter this independence calculation.
    Dependence between marks at different sites is immaterial.
  On a marking event, the one changed edge is increased by at least $b_0 - a_0$.
    Every witnessing bigeodesic passes through $k$, and the edge $e_k$ is the first edge of one of its arms based
    there. Use that edge as the gain portion of that arm and use the empty portion of the other arm.
    Thus the modification and both gain portions fit in a ball of radius one, and the total gain is at least
  $ b = b_0 - a_0 > 0 . $
  The regularity event in $t^k$ confines both marked arms with offset $H$.
  We must also establish confinement of the #emph[base] comparator rays at every marked site;
    base regularity was not assumed in (49). Let $q$ be any base ray from $k$ with label in $I$ or $- I$.
    A simple path from $k$ can traverse $e_k$ only as its first edge.
    Indeed, a later traversal in either direction would revisit $k$.
    If $q$ avoids $e_k$, all its weights are unchanged and it remains a ray in $t^k$ by monotonicity.
    Its label is unchanged by 7, so $cal(R)_(e_k) \( H \)$ in $t^k$ puts it in the appropriate cone at $k$.
  If $q$ uses $e_k$ first, its tail from $k + v$ avoids $e_k$ and remains a ray in $t^k$, with the same label.
    That tail lies in the corresponding cone at $k + v$ with offset $H$. For either choice of sign, the inequality
  $ plus.minus \( w_2 - k_2 - v_2 \) gt.eq s \| w_1 - k_1 - v_1 \| - H $
  implies
  $ plus.minus \( w_2 - k_2 \) gt.eq s \| w_1 - k_1 \| - #scale(x: 120%, y: 120%)[\(] H + \| v_2 \| +
    s \| v_1 \| #scale(x: 120%, y: 120%)[\)] . $
  Including the initial vertex $k$, and then the initial edge by convexity,
    confines the whole base ray with offset at most $H + 1 + s$.
    This proves the needed base comparator control at both fixed labels $alpha$ and $- beta$,
    uniformly over all bins. It explains why regularity was required at both endpoints of $e_k$.
  Choose an integer grid spacing $l = l \( H \)$ large enough for 19 with $R = 1$, $H_p = H$, and $H_c = H + 1 +
    s$. It may be chosen so that
  #[#set math.equation(numbering: n => "(51)")
   $ 2 lt.eq l \( H \) lt.eq C_0 \( H + 1 \) $ <eq:one-edge-spacing>]
  for a chart-dependent constant $C_0$, uniformly in the unit vector $v$.
    The lower bound makes the edges $e_k$ at distinct grid sites distinct.
    Any two different marked sites are now sufficiently separated. Applying 20 and (50) to each bin yields
  $ bb(P) #scale(x: 120%, y: 120%)[\(] A_e^(alpha \, beta) \( H \) #scale(x: 120%, y: 120%)[\)] lt.eq
    frac(l \( H \), \( b_0 - a_0 \) p_a) #scale(x: 120%, y: 120%)[\(] r \( beta \) -
    r \( alpha \) #scale(x: 120%, y: 120%)[\)] . $
  For the finite partition $Pi_j$, let $K_j \( e \, H \)$ count its occupied bins among the labels counted by
    $N_e \( H \)$. Linearity of expectation and (38) give
  #[#set math.equation(numbering: n => "(52)")
   $ bb(E) K_j \( e \, H \) lt.eq frac(l \( H \) W_I, \( b_0 - a_0 \) p_a) . $ <eq:occupied-bin-bound>]
  On the event excluding $D_I$ as bigeodesic labels, refinement never loses a counted label,
    so $K_j \( e \, H \)$ is nondecreasing. Every finite collection of distinct counted labels is eventually in
    distinct bins. Thus
  $ K_j \( e \, H \) arrow.t N_e \( H \) \, $
  also when the latter is infinite: apply the separation assertion to arbitrarily large finite collections.
    Monotone convergence in (52), followed by (51), proves (48).
    Translation invariance and the finite number of edge directions give one constant for all $e$. ◻
]

== 6 Excluding forks and identifying Busemann pairs <sec:forks>

The finite-tree count in this section follows the density-versus-boundary principle of Burton and Keane [7].
  Here the preceding label budget bounds the edge–label pairs supplied by distinct branches.

Continue with the fixed chart $I$. An #emph[upper fork at $x$] consists of two bigeodesics,
  oriented toward upper labels in $I$, with the same upper label, coincident backwards from $x$,
  and with different first edges forwards from $x$. Equivalently,
  one may require a common backwards tail and a split at $x$:
  uniqueness of finite geodesics from a vertex on that common tail identifies the two paths up to their split.
  A lower fork is defined with the orientation reversed. These are existence events with two path witnesses and a
  label witness, and hence are measurable in the completed space by 8.

#thm([Proposition 6.1.])[
  (Absence of forks).  #emph[Almost surely there is no upper or lower fork in any of the countably many charts
    under consideration.]
] <prop:no-forks>

#proof[
  The counting argument groups forks by label and extracts disjoint forward branches within each group.
    Positive fork density would force a cubic expected number of usable edge–label pairs in large boxes;
    uniform confinement and 22 give an arbitrarily small cubic upper bound.
  It suffices first to exclude upper forks in one chart. Work on the simultaneous event of 18.
    Every upper fork label is exceptional by the first test in 15,
    since two different rays of that label start at its split vertex.
    Consequently all lower rays with the opposite label coalesce,
    simultaneously for every label arising in this way. In particular,
    a finite collection of bigeodesics with one such upper label has a common backwards tail.
    A vertex sufficiently far along that common tail is a common past root for the entire finite collection.
  Let $F_n$ be the number of vertices in $\[ - n \, n \]^2 ∩ bb(Z)^2$ that are upper forks for this chart, and let
  $ p_(upright("fork")) = bb(P) \( 0 upright(" is an upper fork for this chart") \) . $
  The chart and the fork definition are translation invariant, so
  #[#set math.equation(numbering: n => "(53)")
   $ 0 lt.eq F_n lt.eq \( 2 n + 1 \)^2 \, wide bb(E) F_n = \( 2 n + 1 \)^2 p_(upright("fork")) . $ <eq:fork-count-mean>]
  Fix $epsilon > 0$ and put $H_n = ceil.l epsilon n ceil.r$.
    Let $G_n$ be the intersection of the event $U_n$ in 21 and the event that $cal(R)_e \( H_n \)$ holds for every
    edge with both endpoints in $\[ - 2 n \, 2 n \]^2$. Uniform all-ray confinement in 12 gives the latter event
    eventually almost surely: all its endpoint sites lie in a box of radius a fixed multiple of $n$,
    and their required offsets are $o \( n \)$. Therefore, for this fixed $epsilon$,
  #[#set math.equation(numbering: n => "(54)")
   $ bb(P) \( G_n^c \) arrow.r 0 . $ <eq:fork-good-event>]
  No rate uniform in $epsilon$ is asserted or needed.
  We claim the following deterministic counting inequality on $G_n$, for $n gt.eq 2$:
  #[#set math.equation(numbering: n => "(55)")
   $ n / 4 F_n lt.eq sum_(e : upright("both endpoints in ") \[ - 2 n \, 2 n \]^2) N_e \( H_n \) .
     $ <eq:fork-edge-credit>]
  Choose a witnessing pair at each of the finitely many fork sites counted by $F_n$,
    and group the choices according to their exact upper label.
    These finite choices are only used to prove a pathwise inequality; no measurable enumeration of labels is required.
  Consider a group containing $q gt.eq 1$ distinct fork sites.
    There are at most $2 q$ witnessing bigeodesics in this group. Their lower rays coalesce by 18.
    Pairwise coalescence of a finite collection gives a common tail by going beyond all their finitely many
    merging locations. Choose a vertex $o$ on this tail, earlier than every selected split,
    and orient each witness forwards from $o$ toward its upper end.
  The union of these forward paths is a rooted tree. To justify this directly,
    the initial path from $o$ to any vertex $z$ on a witness is a finite geodesic.
    If two witnesses visit $z$, finite uniqueness makes their entire paths from $o$ to $z$ equal.
    They therefore cannot diverge and later meet, and common edges cannot carry conflicting forward orientations.
    Each visited vertex other than $o$ has one parent, and the resulting graph has no cycle.
  Let $cal(T)$ be the finite subtree obtained by taking the union of the root paths to the two selected children
    immediately after every selected split. Each of the $q$ split vertices has at least two children in $cal(T)$.
    For any finite rooted tree with $L$ leaves,
  #[#set math.equation(numbering: n => "(56)")
   $ L - 1 = sum_(u : thin d_(cal(T))^(+) \( u \) > 0) #scale(x: 120%, y: 120%)[\(] d_(cal(T))^(+) \( u \) -
     1 #scale(x: 120%, y: 120%)[\)] \, $ <eq:finite-tree-leaves>]
  where $d_(cal(T))^(+) \( u \)$ is its number of children.
    Indeed, the sum of the outdegrees is the number of edges, one less than the number of vertices;
    subtracting the number of nonleaves gives (56). Thus $L gt.eq q + 1$.
  Every leaf of $cal(T)$ is an endpoint of one of the root-to-child paths defining $cal(T)$.
    Otherwise a defining path containing that leaf would continue to another vertex of $cal(T)$,
    contradicting its being a leaf. In particular, every leaf is a selected child of a fork site,
    and hence lies in $\[ - n - 1 \, n + 1 \]^2$. The root paths are allowed to leave and reenter both boxes;
    only their terminal children determine this location of the leaves.
    Selected split vertices may also be ancestors of one another,
    but each is still a distinct vertex with at least two children and contributes at least one to (56).
  For each leaf choose a witnessing bigeodesic containing its defining root-to-child path,
    and continue forwards along that witness. These continuations are pairwise vertex disjoint.
    In fact, if two met at $w$, uniqueness of the finite geodesic from $o$ to $w$ would put both leaves on a
    single root path. They would be comparable in the ancestor order,
    contrary to being distinct leaves of $cal(T)$. The same reasoning rules out an intersection between one
    continuation and the root path to another leaf: its own leaf would then be an ancestor of the other one.
    An intersection with an earlier point of its own root path contradicts simplicity.
    These conclusions hold throughout the plane, including parts of $cal(T)$ outside either box.
  Each leaf has infinity-norm distance at least $n - 1$ from the boundary of $\[ - 2 n \, 2 n \]^2$.
    Its continuation eventually reaches this boundary, since an upper ray in the chart has height tending to $+
    oo$. Stop the continuation at its first boundary visit. The resulting path is simple,
    all its edges have both endpoints in the outer box, and its length is at least $n - 1 gt.eq n \/ 2$.
    Its starting point is in $\[ - 3 n \, 3 n \]^2$, so $U_n$ supplies at least half its edges as usable.
    It therefore supplies at least $n \/ 4$ usable edges inside the outer box.
    Every such edge lies on the witnessing bigeodesic and satisfies $cal(R)_e \( H_n \)$ on $G_n$.
    It contributes the group’s label to $N_e \( H_n \)$.
  For this group the leaf continuations are disjoint, so no edge is credited twice with that label.
    Groups with different labels credit different pairs $\( e \, rho \)$,
    even if they use the same geometric edge. Thus the count is of distinct edge–label pairs.
    Summing over the groups credits at least
  $ n / 4 sum_(upright("groups")) L gt.eq n / 4 sum_(upright("groups")) q = n / 4 F_n $
  pairs, proving (55).
  We now take expectations, retaining the scale of the bad-event loss. By (53),
  $ bb(E) \[ F_n upright(bold(1))_(G_n) \] gt.eq \( 2 n + 1 \)^2 #scale(x: 120%, y: 120%)[\(]
    p_(upright("fork")) - bb(P) \( G_n^c \) #scale(x: 120%, y: 120%)[\)] . $
  The loss after multiplication by $n \/ 4$ is at most
  #[#set math.equation(numbering: n => "(57)")
   $ n / 4 \( 2 n + 1 \)^2 bb(P) \( G_n^c \) = o \( n^3 \) wide
     upright("for fixed ") epsilon . $ <eq:fork-bad-event-loss>]
  There are $2 \( 4 n \) \( 4 n + 1 \) lt.eq 40 n^2$ edges with both endpoints in the outer box. From (55) and 22,
  #[#set math.equation(numbering: n => "(58)")
   $ n / 4 \( 2 n + 1 \)^2 #scale(x: 120%, y: 120%)[\(] p_(upright("fork")) -
     bb(P) \( G_n^c \) #scale(x: 120%, y: 120%)[\)] lt.eq 40 C n^2 #scale(x: 120%, y: 120%)[\(] ceil.l epsilon n
     ceil.r + 1 #scale(x: 120%, y: 120%)[\)] . $ <eq:fork-expectation-bound>]
  Divide by $n^3$ and let $n arrow.r oo$ for this fixed $epsilon$.
    Equations (54) and (58) yield $p_(upright("fork")) lt.eq 40 C epsilon$.
    Sending $epsilon arrow.b 0$ gives $p_(upright("fork")) = 0$.
    Countability of vertices excludes every upper fork in this chart almost surely.
    Reversing upper and lower gives the same conclusion for lower forks,
    and the countable union over charts proves the proposition. ◻
]

#thm([Corollary 6.2.])[
  (Common Busemann pairs for a common label).  #emph[On one event of probability one,
    whenever two oriented bigeodesics $p \, q$ in any fixed chart have the same upper label,
    their two Busemann functions agree:
#[#set math.equation(numbering: n => "(59)")
 $ B_(p^(+)) = B_(q^(+)) \, wide B_(p^(-)) = B_(q^(-)) . $ <eq:same-busemann-pair>]

 This assertion is simultaneous over the bigeodesics and their possibly random labels.
   It also holds almost surely in every environment whose law is absolutely continuous with respect to the iid
   law, and simultaneously for a countable collection of such environments.]
] <cor:same-busemann>

#proof[
  Take the common full-measure event of Proposition 4.5, Proposition 6.1 and the structural properties.
    Let the two bigeodesics have upper label $rho$. If their upper Busemann functions differ,
    $rho$ passes the second exceptional label test of 15. The simultaneous conclusion of 18 makes their lower rays
    coalesce. Choose a vertex $o$ sufficiently far along their common lower tail.
    The forward portions from $o$ are upper geodesic rays. They cannot have the same tail,
    since tail invariance in 3 would make their upper Busemann functions equal.
    They must therefore have a first split. Finite uniqueness prevents any later meeting,
    so this split is an upper fork with a common past, contrary to 23.
  If the lower Busemann functions differ, the lower label $- rho$ is exceptional by the same second test.
    Apply 18 with upper and lower reversed to coalesce the upper rays.
    Reversing the preceding argument then produces a forbidden lower fork. This proves both equalities in (59).
  All these deductions are pathwise on the stated common event.
    They do not take an uncountable union of fixed-label null events,
    nor assert coalescence of every one-sided family at random labels.
    Absolute continuity transfers the event to each individual changed environment;
    countable intersection gives the final assertion. ◻
]

== 7 Finite perturbations with divergent gain <sec:tilts>

Fix a chart $I$, its slope $s > 0$, and the partitions $Pi_j$ from Section 5.
  In this section suppose that, for some deterministic $H_0 gt.eq 1$,
  the following event in an iid environment has probability $p > 0$:
  there is a bigeodesic through $0$ whose upper label belongs to $I$, avoids all partition endpoints,
  and whose two arms lie in $Q^plus.minus \( 0 \, H_0 \)$. Denote this event by $cal(B) \( 0 \)$,
  and its horizontal translate to $k = \( k_1 \, 0 \)$ by $cal(B) \( k \)$.
  The chart, $s$, $H_0$, and $p$ remain fixed throughout the construction.
  The eventual proof of 1 will reduce a positive probability of bigeodesics to precisely this situation.

We shall obtain, for every positive integer $M$, marks of probability bounded below independently of $M$.
  A mark comes with a bigeodesic in a finite upward perturbation of the iid environment and a gain of at least $M$
  on an initial portion of that bigeodesic. A second requirement,
  a strictly raised edge within a fixed number $R_0$ of steps,
  will prevent two marks on a suitably spaced horizontal grid from having the same label.
  The distinction between this fixed $R_0$ and the larger radius needed for the gain $M$ is essential.

=== 7.1 A shared family of finite perturbations <a-shared-family-of-finite-perturbations>

Bates and Chatterjee [5] Lemmas 2.3–2.4 bound the change of product law for small Bernoulli replacements whose
  distributions have bounded density relative to the original law.
  The low-to-high replacement below is a monotone instance of this construction;
  related spatially varying passage-time perturbations appear in [11] Section 2.3.
  We derive its estimates directly, share the edge samples between sites,
  and compute the conditional law given an individual modified environment.

Use the thresholds $a_0 < b_0$ of 21, and write

$ p_a = G \( \[ 0 \, a_0 \] \) > 0 \, wide p_b = G \( \[ b_0 \, oo \) \) > 0 \, wide g = b_0 - a_0 > 0 . $

Thus $q = G \( \[ 0 \, b_0 \) \)$ satisfies $8 sqrt(q) < 1$. An edge is usable when its weight is at least $b_0$.
  Write $mu = G^(cal(E))$ for the iid law of the base environment;
  probability $bb(P)$ below is taken on the enlarged coupling.
  Take, independently for every edge $e$, a triple $\( X_e \, U_e \, Z_e \)$, where

$ X_e tilde.op G \, wide U_e tilde.op "Unif" \[ 0 \, 1 \] \, wide
  Z_e tilde.op G \( thin dot.op divides \[ b_0 \, oo \) \) . $

The coordinates of each triple are independent, as are the triples at different edges.
  The base environment is $X = \( X_e \)_e$, with metric $T$. All variants below use these same triples.

For an edge $e$ with endpoints $w \, w'$, put

$ h \( e \) = max { \| w_2 \| \, \| w'_2 \| } \, wide delta_h = frac(eta, \( h + 2 \) log \( h + 2 \)) \, quad
  h gt.eq 0 \, $

where $eta > 0$ will be chosen shortly, independently of $M$. Require $delta_0 lt.eq p_a \/ 2$, and define

#[#set math.equation(numbering: n => "(60)")
 $ xi_e = upright(bold(1)) { X_e lt.eq a_0 \, med U_e lt.eq delta_(h \( e \)) \/ p_a } \, wide hat(X)_e =
   cases(delim: "{", Z_e \, & xi_e = 1 \,, X_e \, & xi_e = 0 .) $ <eq:shared-raise>]

In particular $hat(X)_e gt.eq X_e$, and $hat(X)_e - X_e gt.eq g$ whenever $xi_e = 1$.

For a horizontal site $k = \( k_1 \, 0 \)$ and an integer $R gt.eq 1$, define the finite set of edges

#[#set math.equation(numbering: n => "(61)")
 $ A_k \( R \) = {e : med h \( e \) lt.eq R \, quad max_(w upright(" endpoint of ") e) \| w_1 - k_1 \| lt.eq 1 +
   frac(h \( e \) + H_0, s)} . $ <eq:tilt-region>]

Let $Y^(k \, R)$ equal $hat(X)_e$ on $A_k \( R \)$ and $X_e$ elsewhere, and denote its metric by $T^(k \, R)$.
  For two horizontal sites $k \, y$, let $Y^(k \, y \, R)$ instead use $hat(X)_e$ on $A_k \( R \) union
  A_y \( R \)$, with metric $T^(k \, y \, R)$. In an overlap there is one use of the same sample $hat(X)_e$.
  We never apply the replacement operation twice to an edge.

The absolute height in (61) accommodates excursions in either vertical direction.
  Indeed, if a bigeodesic through $k$ has its arms in $Q^plus.minus \( k \, H_0 \)$,
  then every vertex $w$ of either arm satisfies

#[#set math.equation(numbering: n => "(62)")
 $ s \| w_1 - k_1 \| lt.eq \| w_2 \| + H_0 . $ <eq:whole-path-width>]

For the upper arm this follows from $s \| w_1 - k_1 \| lt.eq w_2 + H_0$, and for the lower arm from $s \| w_1 -
  k_1 \| lt.eq - w_2 + H_0$. Consequently every edge of this bigeodesic with $h \( e \) lt.eq
  R$ belongs to $A_k \( R \)$. In particular its first $R$ upper-arm edges belong to this set:
  the $j$th edge has $h \( e \) lt.eq j$.

#thm([Lemma 7.1.])[
  (Uniform change of law).  #emph[Every individual environment $Y^(k \, R)$ and every union environment
    $Y^(k \, y \, R)$ has law absolutely continuous with respect to $mu$.
    There is a finite constant $C$, depending only on $s \, H_0 \, p_a \, p_b$,
    such that the density $L_(k \, R) = d cal(L) \( Y^(k \, R) \) \/ d mu$ satisfies
#[#set math.equation(numbering: n => "(63)")
 $ bb(E)_mu L_(k \, R)^2 lt.eq exp \( C eta^2 \) \, wide parallel cal(L) \( Y^(k \, R) \) -
   mu parallel_(upright("TV")) lt.eq 1 / 2 sqrt(exp \( C eta^2 \) - 1) . $ <eq:likelihood-bound>]

 The bounds are uniform in $k$ and $R$.]
] <lem:likelihood>

#proof[
  The law of $hat(X)_e$, for $h \( e \) = h$, has density relative to $G$
  #[#set math.equation(numbering: n => "(64)")
   $ lambda_h \( t \) = 1 - delta_h / p_a upright(bold(1))_(\[ 0 \, a_0 \]) \( t \) + delta_h /
     p_b upright(bold(1))_(\[ b_0 \, oo \)) \( t \) . $ <eq:one-edge-density>]
  The two indicated sets are disjoint. Direct integration gives $integral lambda_h thin d G = 1$ and
  #[#set math.equation(numbering: n => "(65)")
   $ integral lambda_h^2 thin d G & = p_a \( 1 - delta_h \/ p_a \)^2 + p_b \( 1 + delta_h \/ p_b \)^2 + 1 - p_a - p_b\
 & = 1 + \( p_a^(- 1) + p_b^(- 1) \) delta_h^2 . $ <eq:one-edge-second-moment>]
  For any deterministic finite set of replaced edges, independence of the triples makes the full density the
    product of these one-edge densities; the exterior has its original iid law.
    This proves absolute continuity for both the individual and union environments.
  To bound the product for an individual region, let $N_h$ count its edges of height $h$.
    At positive height $h$, horizontal edges lie in the two rows of heights $h \, - h$,
    and vertical edges lie in the two strips adjoining those rows toward height zero.
    Each row or strip contains at most $2 \( 1 + \( h + H_0 \) \/ s \) + 1$ admissible edges.
    At height zero there is only one horizontal row. Thus, for example,
  $ N_h lt.eq c_s \( h + H_0 + 1 \) \, wide c_s = 12 + 8 \/ s . $
  It follows from (65) that
  $ bb(E)_mu L_(k \, R)^2 & = product_(e in A_k \( R \)) #scale(x: 120%, y: 120%)[\[]
    1 + \( p_a^(- 1) + p_b^(- 1) \) delta_(h \( e \))^2 #scale(x: 120%, y: 120%)[\]]\
 & lt.eq exp {c_s \( p_a^(- 1) + p_b^(- 1) \) eta^2 sum_(h = 0)^oo
   frac(h + H_0 + 1, \( h + 2 \)^2 log^2 \( h + 2 \))} . $
  The series is finite; its terms of leading order are $1 \/ \( h log^2 h \)$.
    It defines the required constant $C$. Finally, since $bb(E)_mu L_(k \, R) = 1$, Cauchy–Schwarz gives
  $ parallel cal(L) \( Y^(k \, R) \) - mu parallel_(upright("TV")) = 1 / 2 bb(E)_mu \| L_(k \, R) - 1 \| lt.eq 1 /
    2 sqrt(bb(E)_mu L_(k \, R)^2 - 1) . $
  All modified sets are finite. The infinite series has been used only to bound these finite products uniformly. ◻
]

Fix $eta > 0$ sufficiently small that $delta_0 lt.eq p_a \/
  2$ and the total variation bound in (63) is at most $p \/ 8$. This choice is henceforth fixed.

=== 7.2 The posterior law after selecting a path <the-posterior-law-after-selecting-a-path>

#thm([Lemma 7.2.])[
  (Conditioning on an individual output).  #emph[Fix $k \, R$.
    Conditional on the entire individual environment $Y^(k \, R)$,
    the variables $\( xi_e : e in A_k \( R \) \)$ are independent Bernoulli variables with respective success
    probabilities
#[#set math.equation(numbering: n => "(66)")
 $ theta_e \( Y_e^(k \, R) \) = upright(bold(1))_(\[ b_0 \, oo \)) \( Y_e^(k \, R) \)
   frac(delta_(h \( e \)), p_b + delta_(h \( e \))) . $ <eq:posterior>]

 The assertion includes conditioning on every unchanged exterior edge.
   If a simple path is selected measurably from this individual output alone,
   the same product law holds on any of its finite prefixes lying in $A_k \( R \)$,
   once that prefix is fixed by the conditioning.]
] <lem:posterior>

#proof[
  For $e in A_k \( R \)$, put $Y_e = hat(X)_e$ and $h = h \( e \)$. As measures in $t$, the construction gives
  #[#set math.equation(numbering: n => "(67)")
   $ bb(P) \( xi_e = 1 \, Y_e in d t \) & = delta_h / p_b upright(bold(1))_(\[ b_0 \, oo \)) \( t \) G \( d t \) \,\
bb(P) \( xi_e = 0 \, Y_e in d t \) & = [1 - delta_h / p_a upright(bold(1))_(\[ 0 \, a_0 \]) \( t \)] G \( d t \) .
  $ <eq:posterior-joint-one>]
  For the first identity multiply the low-input probability $p_a$, the replacement probability $delta_h \/ p_a$,
    and the conditional law of $Z_e$. In the second identity the original sample is retained,
    except for the removed mass on $\[ 0 \, a_0 \]$. Dividing the first density by their sum (64) proves (66).
  The pairs $\( xi_e \, Y_e \)$ are independent across $A_k \( R \)$.
    Hence their conditional kernel given the finite output vector is the product of the kernels just computed.
    The entire collection of exterior outputs
    $\( Y_e^(k \, R) : e in.not A_k \( R \) \) = \( X_e : e in.not A_k \( R \) \)$ is independent of the inside
    triples. Testing the product kernel against bounded functions of finitely many exterior coordinates therefore
    preserves the conditional-expectation identity. A monotone-class argument extends it to the sigma-field of all
    exterior coordinates. This establishes the claimed law given the full environment.
  For the last assertion, the path space is standard Borel.
    A selector measurable in the completion of the output law has a Borel version under that law.
    Given the full output, a finite prefix of this version is a fixed list of distinct edges.
    Restricting the product kernel to that list proves the assertion.
    One can equally partition by the countably many possible finite prefixes to verify the conditional identity.
    No output at another site is included in this conditioning. ◻
]

Choose a deterministic $n_0$ so large that the event

$ cal(U)_(n_0) \( k \) =
  mat(delim: "{", upright("every simple path from ") k upright(" of each length ") d gt.eq n_0;
  upright("has at least ") d \/ 2 upright(" usable edges")) $

has iid failure probability at most $p \/ 8$. This follows directly from (45) in 21,
  whose geometric tail tends to zero. In particular this condition requires no moment of a single edge weight.

Write

$ cal(E)_(k \, R) = { Y^(k \, R) in cal(B) \( k \) ∩ cal(U)_(n_0) \( k \) } . $

The total variation estimate implies, uniformly in $k \, R$,

#[#set math.equation(numbering: n => "(68)")
 $ bb(P) \( cal(E)_(k \, R) \) gt.eq p - p \/ 8 - p \/ 8 gt.eq p \/ 2 . $ <eq:output-good-probability>]

By 8 select a witnessing oriented bigeodesic and its upper label using $Y^(k \, R)$ alone.
  Use the same selection rule at the origin and at its horizontal translates.
  More explicitly, select in the completed iid space on $cal(B) \( 0 \)$ and replace the selector by a Borel
  version there. Absolute continuity makes this version valid almost surely under every individual output law;
  countably many translates and radii can be handled simultaneously.
  On $cal(E)_(k \, R)$ the usable-prefix condition is already determined by the output,
  and the selected witness satisfies it. It therefore adds no information when applying 26.

#thm([Lemma 7.3.])[
  (Divergent gain along selected prefixes).  #emph[There is a fixed integer $R_0 gt.eq n_0$ such that,
    for each positive integer $M$, one can choose a deterministic $R \( M \) gt.eq
    R_0$ with the following property. On $cal(E)_(k \, R \( M \))$, conditional on $Y^(k \, R \( M \))$,
    with probability at least $3 \/ 4$ the selected upper arm has both a strict raise among its first $R_0$ edges
    and total increase at least $M$ along its first $R \( M \)$ edges.]
] <lem:divergent-gain>

#proof[
  Fix an output in $cal(E)_(k \, R)$, and denote the successive edges of the selected upper arm by $e_1 \, e_2 \,
    dots.h$. For $j lt.eq R$ they belong to $A_k \( R \)$ and have $h \( e_j \) lt.eq j$, as shown in (62). Put
  $ a_j = upright(bold(1)) { Y_(e_j)^(k \, R) gt.eq b_0 } \, quad A_d = sum_(j = 1)^d a_j \, quad N_d =
    sum_(j = 1)^d xi_(e_j) \, quad mu_d = bb(E) \( N_d divides Y^(k \, R) \) . $
  The $a_j$ and the selected edges are fixed under this conditioning, and $A_d gt.eq d \/ 2$ for every $d gt.eq
    n_0$. The decreasing sequence $f_j = \( \( j + 2 \) log \( j + 2 \) \)^(- 1)$ satisfies
  #[#set math.equation(numbering: n => "(69)")
   $ mu_d gt.eq gamma sum_(j = 1)^d a_j f_j \, wide gamma = frac(eta, p_b + delta_0) > 0 \, wide d lt.eq
     R . $ <eq:gain-mean>]
  Indeed each usable edge contributes the probability in (66), at least $eta f_j \/ \( p_b + delta_0 \)$.
    Summation by parts, followed by the prefix bounds, gives for $d gt.eq n_0$
  #[#set math.equation(numbering: n => "(70)")
   $ sum_(j = 1)^d a_j f_j & = A_d f_d + sum_(j = 1)^(d - 1) A_j \( f_j - f_(j + 1) \)\
 & gt.eq 1 / 2 [d f_d + sum_(j = n_0)^(d - 1) j \( f_j - f_(j + 1) \)]\
 & = 1 / 2 [n_0 f_(n_0) + sum_(j = n_0 + 1)^d f_j] . $ <eq:abel-gain>]
  The last expression tends to infinity. Let $m_d$ be $gamma$ times this expression,
    a deterministic increasing lower bound for $mu_d$.
  The selected path is simple, so 26 gives
  #[#set math.equation(numbering: n => "(71)")
   $ "Var" \( N_d divides Y^(k \, R) \) = sum_(j = 1)^d theta_(e_j) \( 1 - theta_(e_j) \) lt.eq
     mu_d . $ <eq:gain-variance>]
  Choose $R_0 gt.eq n_0$ with $m_(R_0) gt.eq 8$. For every $R gt.eq R_0$, Chebyshev’s inequality gives
  $ bb(P) \( N_(R_0) = 0 divides Y^(k \, R) \) lt.eq mu_(R_0)^(- 1) lt.eq 1 \/ 8 . $
  This choice is independent of $R$ and of the requested gain $M$.
    For that gain put $K_M = ceil.l M \/ g ceil.r$, and choose $R = R \( M \) gt.eq R_0$ so large that $m_R gt.eq
    max { 2 K_M \, 32 }$. Again by Chebyshev,
  $ bb(P) \( N_R < K_M divides Y^(k \, R) \) lt.eq frac(mu_R, \( mu_R - K_M \)^2) lt.eq 4 / mu_R lt.eq 1 / 8 . $
  At least $K_M$ successful raises give total increase at least $g K_M gt.eq M$ on the prefix.
    The union bound for the two failure events proves the stated probability $3 \/ 4$. ◻
]

#thm([Proposition 7.4.])[
  (Marks with an arbitrary toll).  #emph[With $R_0$ fixed as above,
    for every positive integer $M$ the common coupling defines marks $J_M \( k \) in { 0 \,
    1 }$ at all horizontal sites, with the same marginal probability at each site and
#[#set math.equation(numbering: n => "(72)")
 $ bb(P) \( J_M \( k \) = 1 \) gt.eq p \/ 4 . $ <eq:initial-mark-probability>]

 A mark selects a bigeodesic $p_k$ in $T^(k \, R \( M \))$ through $k$,
   with upper label $rho_k in I$ avoiding all partition endpoints. Its arms lie in $Q^plus.minus \( k \, H_0 \)$.
   Its first $R \( M \)$ upper-arm edges have total increase at least $M$ over the base environment,
   and one of its first $R_0$ upper-arm edges has increase at least $g$.
   All changes occur in a deterministic bounded neighborhood of $k$ whose radius may depend on $M$.]
] <prop:tilt-marks>

#proof[
  Take $R = R \( M \)$ from 27. On $cal(E)_(k \, R)$ use the already selected path,
    and mark when both success requirements of that lemma hold.
    Together with (68), the lemma gives marking probability at least $\( p \/ 2 \) \( 3 \/ 4 \) = 3 p \/ 8$,
    proving (72). All the asserted path properties are part of the selection or the marking test.
    The region $A_k \( R \)$ lies in a ball about $k$ of radius at most
  #[#set math.equation(numbering: n => "(73)")
   $ D_R = R + 1 + \( R + H_0 \) \/ s \, $ <eq:defect-radius>]
  and the prescribed gain portion lies in the ball of radius $R$.
  Horizontal translations preserve the distribution of the triples and their height indices.
    Since the selection rule and all tests are translated in the same way, the marks have equal marginals;
    in fact this construction is stationary under horizontal translations. Marks at different sites may be dependent. ◻
]

The conditional product law has now served its purpose. Subsequent filters may depend on the base environment or
  on other marks and hence may bias the latent variables $xi_e$.
  We will use the unconditional bound (72) after those filters, without reapplying 26.

=== 7.3 Union metrics and distinct labels <sec:unions>

Before selecting a pair of marks, fix the common full-measure event needed for all comparisons.
  There are countably many integer radii, horizontal lattice sites, and pairs of these sites.
  By 25, each corresponding individual or union environment has law absolutely continuous with respect to $mu$.
  Thus almost surely the base and every one of these environments satisfy the structural properties, 9,
  and the simultaneous conclusion 24. They also exclude bigeodesic labels in the deterministic countable set of
  partition endpoints. Intersect these events with the countably many full-measure events needed for the selectors
  and conditional estimates. In the rest of the argument we work on this common event.
  A subsequently selected random pair of sites and random label therefore require no additional fixed-label
  null-event assertion.

Choose an integer grid spacing $l$, once and for all, satisfying

#[#set math.equation(numbering: n => "(74)")
 $ l > R_0 + 1 + frac(R_0 + H_0, s) \, $ <eq:fixed-grid-spacing>]

and restrict marks to $Lambda = { \( j l \, 0 \) : j in bb(Z) }$. This spacing is independent of $M$.

#thm([Lemma 7.5.])[
  (Preservation in a union).  #emph[Fix $M$, put $R = R \( M \)$, and suppose distinct sites $k \,
    y in Lambda$ are marked. Their selected paths $p_k \, p_y$ are bigeodesics in the union metric $T^(*) =
    T^(k \, y \, R)$. Every edge of $p_k$ has the same weight there as in $T^(k \, R)$,
    and every edge of $p_y$ has the same weight there as in $T^(y \, R)$. Their labels are preserved.
    Moreover, any raised edge among the first $R_0$ upper-arm edges of $p_y$ lies outside $A_k \( R \)$ and has
    its base weight in $T^(k \, R)$.]
] <lem:union>

#proof[
  For each edge of $p_k$ of height at most $R$, (62) puts both endpoints within the width bound of $A_k \( R \)$.
    Its individual weight is already $hat(X)_e$, so passage to the union leaves that weight unchanged.
    For an edge of greater height neither region changes its base weight.
    This proves the edgewise assertion along all of $p_k$, including any initial upper-arm excursion below row
    zero or lower-arm excursion above it. The same argument applies to $p_y$.
    All other weights weakly increase in passing from either individual environment to the union.
    Every segment of its selected bigeodesic therefore still minimizes:
    its cost is unchanged and no competitor becomes cheaper.
  Only finitely many edges differ between an individual environment and the union.
    The sum of their finite increases bounds the change of any passage distance,
    by comparison along a simple minimizing path in the smaller metric.
    The labels of the retained rays are consequently unchanged by 7.
  If $e$ belongs to the first $R_0$ edges of $p_y$, both its endpoints satisfy $\| w_1 - y_1 \| lt.eq
    R_0$ and $h \( e \) lt.eq R_0$. For every such endpoint,
  $ \| w_1 - k_1 \| gt.eq \| y_1 - k_1 \| - R_0 > 1 + \( R_0 + H_0 \) \/ s gt.eq 1 + \( h \( e \) + H_0 \) \/ s \, $
  where (74) was used. Thus $e in.not A_k \( R \)$. If it is raised in $T^(y \, R)$,
    its increase in the union over $T^(k \, R)$ is at least $g$. Such an edge cannot lie on $p_k$:
    every edge of $p_k$ in this height slab already belongs to $A_k \( R \)$. ◻
]

The shared samples and the protected near edge are illustrated in 2.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-5.3, 3.003), (0.9, 3.003), (-1.65, 0), (0.9, -3.003), (-5.3, -3.003), (-2.75, 0), close: true, fill: rgb("#f0f0f0"), stroke: none)
  line((-0.9, 3.003), (5.3, 3.003), (2.75, 0), (5.3, -3.003), (-0.9, -3.003), (1.65, 0), close: true, fill: rgb("#ededff"), stroke: none)
  line((0, 1.943), (0.9, 3.003), (-0.9, 3.003), close: true, fill: rgb("#e0e0e6"), stroke: none)
  line((0, -1.943), (0.9, -3.003), (-0.9, -3.003), close: true, fill: rgb("#e0e0e6"), stroke: none)
  line((-5.3, 3.003), (0.9, 3.003), (-1.65, 0), (0.9, -3.003), (-5.3, -3.003), (-2.75, 0), close: true, stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round"))
  line((-0.9, 3.003), (5.3, 3.003), (2.75, 0), (5.3, -3.003), (-0.9, -3.003), (1.65, 0), close: true, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, cap: "round", join: "round", dash: (4pt, 2pt)))
  line((-5.65, 3.003), (5.65, 3.003), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((-5.65, -3.003), (5.65, -3.003), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((-4.15, 0), (4.15, 0), stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt, cap: "round", join: "round"))
  content((-5.4, 3.003), [#text(size: 9pt)[$R$]], anchor: "east", padding: 0.1176cm)
  content((-5.4, -3.003), [#text(size: 9pt)[$-R$]], anchor: "east", padding: 0.1176cm)
  content((-4.15, 0), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.1176cm)
  content((-4.02, 2.093), [#text(size: 9pt)[$A_k(R)$]])
  content((4.02, 2.093), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[$A_y(R)$]]])
  line((-2.2, 0), (-1.95, 0), (-1.95, -0.2002), (-1.75, -0.2002), (-1.75, 0.546), (-2.1, 0.546), (-2.1, 1.001), (-2.25, 1.001), (-2.25, 1.638), (-1.2, 1.638), (-1.2, 2.321), (-0.3, 2.321), (-0.3, 3.504), stroke: (thickness: 1.05pt, cap: "round", join: "round"), mark: (end: ">"))
  line((-2.2, 0), (-2.4, 0), (-2.4, -0.5915), (-2.05, -0.5915), (-2.05, -1.183), (-2.5, -1.183), (-2.5, -1.865), (-2.1, -1.865), (-2.1, -2.548), (-2.45, -2.548), (-2.45, -3.504), stroke: (thickness: 1.05pt, cap: "round", join: "round"), mark: (end: ">"))
  line((2.2, 0), (2.2, 0.5915), (2.55, 0.5915), (2.55, 1.229), (1.8, 1.229), (1.8, 2.002), (2.2, 2.002), (2.2, 3.504), stroke: (paint: rgb("#0000a6"), thickness: 1.05pt, cap: "round", join: "round"), mark: (end: ">"))
  line((2.2, 0), (2, 0), (2, 0.2002), (1.8, 0.2002), (1.8, -0.5915), (2.35, -0.5915), (2.35, -1.183), (1.85, -1.183), (1.85, -1.911), (1.4, -1.911), (1.4, -2.502), (1.7, -2.502), (1.7, -3.504), stroke: (paint: rgb("#0000a6"), thickness: 1.05pt, cap: "round", join: "round"), mark: (end: ">"))
  content((-0.3, 3.504), [#text(size: 9pt)[$p_k$]], anchor: "south", padding: 0.1176cm)
  content((2.2, 3.504), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$p_y$]]], anchor: "south", padding: 0.1176cm)
  circle((-2.2, 0), radius: 0.0635, fill: black, stroke: none)
  circle((2.2, 0), radius: 0.0635, fill: rgb("#0000a6"), stroke: none)
  content((-2.25, -0.04989), [#text(size: 9pt)[$k$]], anchor: "north-east", padding: 0.1176cm)
  content((2.25, -0.04989), [#text(size: 9pt)[$y$]], anchor: "north-west", padding: 0.1176cm)
  line((2.2, 0.819), (3.1, 0), (2.2, -0.819), (1.3, 0), close: true, stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((2.2, 0.2275), (2.2, 0.5005), stroke: (paint: rgb("#a60000"), thickness: 2.5pt, cap: "round", join: "round"))
  circle((2.2, 0.2275), radius: 0.05997, fill: rgb("#a60000"), stroke: none)
  circle((2.2, 0.5005), radius: 0.05997, fill: rgb("#a60000"), stroke: none)
  line((2.2, 0.2275), (2.2, 0.5005), fill: rgb("#a60000"), stroke: none)
  content((2.341, 0.364), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$e$]]], anchor: "west", padding: 0.1176cm)
  line((3.28, 0.5824), (2.92, 0.1638), stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round"))
  content((3.26, 0.6188), [#text(size: 9pt)[fixed $R_0$]], anchor: "west", padding: 0.1176cm)
  line((0, -3.321), (0, -2.766), stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round"))
  content((0, -3.567), [#text(size: 9pt)[shared samples]])
  content((2.2, -3.958), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$e in.not A_k(R)$]]])
})],
  caption: [Figure 2: Schematic envelopes of the truncated edge regions $A_k \( R \)$ and $A_y \( R \)$, not their exact lattice footprints. Overlap uses the same raised sample for each edge, with no repeated increase. Every marked-path edge in the slab belongs to its own region, so the union preserves both paths’ weights and geodesic property. The strictly raised edge $e$ lies among the first $R_0$ steps from $y$ and outside $A_k \( R \)$ at sufficiently large fixed separation. The near radius $R_0$ and this separation remain fixed as $R$ grows. ],
) <fig:union>

#thm([Proposition 7.6.])[
  (No repeated marked label).  #emph[Almost surely, for each positive integer $M$,
    the selected upper labels at distinct marked sites of $Lambda$ are distinct.]
] <prop:distinct-marks>

#proof[
  Work on the common event specified above. Suppose two marked sites $k eq.not y$ have $rho_k = rho_y$.
    By 29 both selected bigeodesics persist with this label in $T^(*) = T^(k \, y \, R)$, where $R = R \( M \)$.
    By 24 their upper and lower Busemann functions in this metric agree; denote the common pair by $B^(+) \,
    B^(-)$. For a vertex $u$ on $p_y$, the bigeodesic inequality of 9,
    based first at $k$ on $p_k$ and then at $u$ on $p_y$, gives
  $ B^(+) \( k \, u \) + B^(-) \( k \, u \) lt.eq 0 \, wide B^(+) \( u \, k \) + B^(-) \( u \, k \) lt.eq 0 . $
  Additivity and antisymmetry therefore imply
  #[#set math.equation(numbering: n => "(75)")
   $ B^(+) \( k \, u \) + B^(-) \( k \, u \) = 0 wide \( u in p_y \) . $ <eq:equal-sum-increments>]
  Take a raised edge $e = { u \, v }$ among the first $R_0$ upper-arm edges of $p_y$,
    and orient it toward the upper end, from $u$ to $v$. Write $t_e^(*)$ for its weight in the union.
    Calibration along the bigeodesic gives
  #[#set math.equation(numbering: n => "(76)")
   $ B^(+) \( u \, v \) = T^(*) \( u \, v \) = t_e^(*) . $ <eq:near-edge-calibration>]
  Here the last equality holds because the one-edge segment of $p_y$ is itself minimizing.
  Let $x_N^(-) \, x_N^(+)$ tend respectively to the lower and upper ends of $p_k$, with $k$ between them. Set
  $ L_N^(*) = T^(*) \( x_N^(-) \, u \) + t_e^(*) + T^(*) \( v \, x_N^(+) \) \, wide D_N^(*) =
    T^(*) \( x_N^(-) \, x_N^(+) \) . $
  This $L_N^(*)$ is the cost of an admissible finite walk, so $L_N^(*) gt.eq D_N^(*)$.
    As $p_k$ is a bigeodesic, $D_N^(*) = T^(*) \( x_N^(-) \, k \) + T^(*) \( k \, x_N^(+) \)$.
    The signs in the Busemann definition then give, separately,
  $ T^(*) \( x_N^(-) \, u \) - T^(*) \( x_N^(-) \, k \) & arrow.r - B^(-) \( k \, u \) \,\
T^(*) \( v \, x_N^(+) \) - T^(*) \( k \, x_N^(+) \) & arrow.r - B^(+) \( k \, v \) . $
  It follows that
  #[#set math.equation(numbering: n => "(77)")
   $ L_N^(*) - D_N^(*) & arrow.r - B^(-) \( k \, u \) - B^(+) \( k \, v \) + t_e^(*)\
 & = - #scale(x: 120%, y: 120%)[\[] B^(-) \( k \, u \) + B^(+) \( k \, u \) #scale(x: 120%, y: 120%)[\]] -
   B^(+) \( u \, v \) + t_e^(*) = 0 \, $ <eq:detour-excess>]
  by (75) and (76).
  Choose minimizing finite approach paths in $T^(*)$ from $x_N^(-)$ to $u$ and from $v$ to $x_N^(+)$,
    and join them by the specified traversal $u arrow.r v$ of $e$. Call this finite walk $W_N$.
    The approach paths may intersect each other, the selected bigeodesics, or $e$ itself;
    its cost is $L_N^(*)$ with every traversal counted. By 29,
    the weight of $e$ in $T^(k \, R)$ is its base weight $X_e$. Thus
  $ Delta = t_e^(*) - X_e gt.eq g > 0 . $
  On returning from $T^(*)$ to $T^(k \, R)$ every traversal weakly decreases in cost,
    and the named middle traversal decreases by $Delta$. Consequently
  #[#set math.equation(numbering: n => "(78)")
   $ "cost"_(T^(k \, R)) \( W_N \) lt.eq L_N^(*) - Delta . $ <eq:walk-saving>]
  Any further traversal of the same edge can only increase this saving.
    On the other hand, the segment of $p_k$ between $x_N^(-)$ and $x_N^(+)$ has cost $D_N^(*)$ in both metrics,
    again by 29. For sufficiently large finite $N$, (77) gives $L_N^(*) - D_N^(*) < Delta$.
    Then (78) makes $W_N$ strictly cheaper in $T^(k \, R)$ than that segment, a contradiction.
    This is a pathwise argument for every marked pair on the common event,
    and hence proves the assertion simultaneously for the countably many $M$. ◻
]

== 8 The final comparison and proof of the theorem <sec:conclusion>

#proof[
  Suppose bigeodesics exist with positive probability. Each bigeodesic contains a lattice vertex.
    Countability of the vertices and the charts in 10, together with the exclusion of their deterministic
    exceptional labels, yields a chart in which a bigeodesic through some fixed vertex has positive probability.
    Translate that vertex to zero and use the lattice coordinates of the chart.
    By 12, its arms are contained in $Q^plus.minus \( 0 \, H \)$ for some finite $H$ almost surely.
    Taking the countable union over integer $H$ gives a deterministic $H_0 gt.eq
    1$ for which the event $cal(B) \( 0 \)$ in 7 has probability $p > 0$.
    Removing the countably many deterministic partition endpoints does not change this probability,
    by the fixed-label backward-finiteness assertion in 4.
  Apply 28 for each positive integer $M$, with the fixed spacing $l$ from (74).
    We next impose two filters on its marks. The first supplies the base comparator rays required for 19;
    the second supplies their required separation within each bin.
  For a horizontal site $k$, let $cal(R)_K \( k \)$ be the event that, in the unchanged base environment,
    every ray from $k$ with label in $I$ lies in $Q^(+) \( k \, K \)$ and every ray from $k$ with label in $-
    I$ lies in $Q^(-) \( k \, K \)$. By 12,
  $ mu \( cal(R)_K \( k \)^c \) arrow.r 0 wide \( K arrow.r oo \) . $
  Choose one deterministic $K gt.eq 1$, independent of $M$,
    such that this failure probability is at most $p \/ 8$. It is the same at all horizontal sites by translation
    invariance. Retain a mark when
  $ tilde(J)_M \( k \) = J_M \( k \) upright(bold(1))_(cal(R)_K \( k \)) = 1 . $
  Unconditional subtraction, without any independence assertion, gives
  #[#set math.equation(numbering: n => "(79)")
   $ q_M := bb(P) \( tilde(J)_M \( k \) = 1 \) gt.eq bb(P) \( J_M \( k \) = 1 \) -
     mu \( cal(R)_K \( k \)^c \) gt.eq p \/ 8 . $ <eq:retained-mark-probability>]
  This filter is imposed after selecting the paths. Its complement has an existential ray witness,
    so $cal(R)_K \( k \)$ is a universally measurable environment event by 8.
    It remains a separate filter; it is not placed inside an existential path projection.
    In particular no new alternation of path quantifiers is used to define the selected marks.
    The translated rule continues to give equal marginals along the grid.
  The near radius $R_0$, spacing $l$, and comparator offset $K$ are fixed independently of $M$.
    For each $M$ we choose $R \( M \)$ and the comparison separation below, refine the partition,
    and only then increase $M$. Fix $M$ for the moment. Its radius $R \( M \)$ is a fixed finite number.
    The selected arms have offset $H_0$, the base comparator rays have offset $K$,
    the changed region has radius at most $D_(R \( M \))$ from (73),
    and the prescribed gain portion has radius at most $R \( M \)$.
    The comparison in 19 therefore holds at a finite deterministic horizontal separation $S \( M \)$.
    The same $S \( M \)$ works for every bin of every partition $Pi_j$:
    the cone bounds control all the relevant comparator labels in the chart,
    and the geometric bounds on the changed region and gain portion are independent of the bin.
    Increase $S \( M \)$ if necessary to be nonnegative. Its possible growth with $M$ has no effect on the already
    fixed grid spacing $l$.
  For the finite partition $Pi_j$, retain a site with $tilde(J)_M \( k \) =
    1$ only if there is no other site $y$ with $tilde(J)_M \( y \) = 1$ and
  $ 0 < \| y - k \| lt.eq S \( M \) $
  whose selected label lies in the same bin as $rho_k$. Here $k \, y$ lie on the horizontal grid,
    so the displayed distance is their horizontal separation.
    Denote this final indicator by $J_(M \, j) \( k \)$ and its common marginal probability by $q_(M \, j)$.
    The test concerns at most $2 floor.l S \( M \) \/ l floor.r$ other sites and is measurable from the previously
    selected labels and marks. At a fixed $j$, two surviving marks in the same bin have separation strictly
    greater than $S \( M \)$, so 19 applies to consecutive surviving marks of that bin with gain $b = M$.
  For completeness, the disappearance of this last filter is a pointwise finite-set argument.
    On the common full-measure event of 7.3, fix an outcome with $tilde(J)_M \( k \) = 1$.
    By 30, every marked site $y eq.not k$, and in particular every one of the finitely many retained neighbors
    within distance $S \( M \)$, has $rho_y eq.not rho_k$. The nested partitions eventually put each such pair in
    different bins. The maximum of their finitely many separating indices is finite,
    so $k$ survives the last filter for every subsequent partition.
    If $tilde(J)_M \( k \) = 0$, all of its final indicators are zero. We have therefore proved
  #[#set math.equation(numbering: n => "(80)")
   $ J_(M \, j) \( k \) arrow.r tilde(J)_M \( k \) quad upright("almost surely as ") j arrow.r oo \, wide
     q_(M \, j) arrow.r q_M \, $ <eq:fixed-M-filter-limit>]
  where the probability convergence follows by bounded convergence. No rate of separation of random labels is required.
  For a bin $\( alpha \, beta \)_I$ of $Pi_j$, write $q_(M \, j)^(alpha \, beta)$ for the probability that a given
    site survives and its selected label lies in that bin. 20, with $b = M$, gives
  $ q_(M \, j)^(alpha \, beta) lt.eq l / M #scale(x: 120%, y: 120%)[\(] r \( beta \) -
    r \( alpha \) #scale(x: 120%, y: 120%)[\)] . $
  Every selected label avoids all partition endpoints, so each surviving mark belongs to exactly one bin.
    Summing over the finitely many bins and using their total width $W_I$ yields
  #[#set math.equation(numbering: n => "(81)")
   $ q_(M \, j) lt.eq frac(l W_I, M) . $ <eq:final-finite-partition-budget>]
  The label-budget bound uses only equal marginal marking probabilities and the pathwise comparison.
    In particular the dependencies introduced by the shared raises and both filters are permitted.
  Now send $j$ to infinity for this fixed $M$. Equations (79), (80), and (81) imply
  $ p / 8 lt.eq q_M lt.eq frac(l W_I, M) . $
  All of $p \, l \, W_I$ were fixed before $M$ was chosen. Taking any integer $M > 8 l W_I \/ p$ is a contradiction.
  The reduction to a chart involved countably many vertices and charts.
    Within the construction the excluded deterministic labels, integer radii, sites,
    and union metrics form countable collections; equality of the Busemann pairs and distinctness of marked labels
    hold pathwise for their random labels. Thus the contradiction excludes the existence event itself and proves
    almost-sure absence of all bigeodesics, with no prescribed deterministic direction. ◻
]

The perturbation argument uses only the nonatomic marginal law, two separated sets of positive mass,
  and the structural conclusions established earlier under the minimum-of-four second-moment assumption.
  In particular all densities in the change-of-law calculation are taken relative to $G$ itself,
  and the total gain is accumulated over finitely many raised edges.
  A density with respect to Lebesgue measure, unbounded support, and a finite mean for one edge are not required.

== 9 Boundary comparison without boundary integrability <sec:boundary-comparison>

The minimum moment in (1) is the assumption A1 of [2]. A boundary expectation in the proof of their
  Proposition 4.4 nevertheless requires care. Lemma 4.6 of that paper constructs half-plane geodesics and then
  identifies the expectation of an associated boundary Busemann increment.
  For a diagonal half-plane, its boundary vertices have only two incident edges in the half-plane;
  (1) need not give integrable restricted passage times. We give a replacement for the expectation step in [2]
  Section 4.5. It proves the same uniqueness conclusion using finite stationary corrections and bounded truncation.

For example, a continuous law with tail

$ bb(P) \( t_e > t \) = \( 1 + t \)^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\(] log \( e + t \)
  #scale(x: 120%, y: 120%)[\)]^(- 3 \/ 8) \, wide t gt.eq 0 \, $

satisfies (1), whereas the minimum of two independent weights has infinite mean.
  Indeed, the relevant tail integrals are comparable at infinity to $integral^oo d
  t \/ \( t \( log t \)^(3 \/ 2) \)$ and $integral^oo d t \/ \( t \( log t \)^(3 \/ 4) \)$, respectively.
  In $H = { x_1 + x_2 gt.eq 0 }$, the cost of leaving a boundary vertex is at least that minimum.
  The proof below makes no assumption about the integrability of the restricted Busemann increments.

We use the terminology of [2] Definition 2.3: a #emph[random coalescing geodesic] is a measurable choice of a ray
  from the origin whose lattice translates coalesce almost surely.
  Write $cal(G) \( x \)$ for its translated ray from $x$, and $B_(cal(G))$ for their common full-plane Busemann
  function. The full-plane linearity of this function is [2] Proposition 4.2,
  which precedes the boundary argument. Let $H$ be any of the eight axial or diagonal half-planes used there,
  let $z$ be a primitive lattice vector parallel to its boundary,
  and let $T_H$ be the passage metric restricted to $H$. Assume that $cal(G)$ eventually enters every translate of
  $H$. The finite-path argument in 2 applies also to the restricted lattice:
  its simple paths form a subcollection of the full-plane paths,
  and the same nonatomic tie argument gives uniqueness. Thus finite restricted minimizers exist and are unique,
  simultaneously for these half-planes and their lattice translates.
  Positivity also rules out loops in a minimizing walk. These are pathwise assertions,
  not integrability assertions about $T_H$.

#thm([Lemma 9.1.])[
  (Finite boundary correction).  #emph[For $x in H ∩ bb(Z)^2$, the limit
$ D_(cal(G)) \( x \) = lim_(j arrow.r oo) #scale(x: 120%, y: 120%)[\(] T_H \( x \, v_j \) -
  T \( x \, v_j \) #scale(x: 120%, y: 120%)[\)] $

 exists and is finite and nonnegative, where $\( v_j \)$ is any ray of $cal(G)$ and the targets are sufficiently
   far along its $H$-contained tail. The limit is independent of the target ray.
   The variables $D_(cal(G)) \( k z \)$, $k in bb(Z)$, are stationary under boundary translations,
   and the restricted Busemann limit satisfies
#[#set math.equation(numbering: n => "(82)")
 $ B_(cal(G))^H \( x \, y \) = B_(cal(G)) \( x \, y \) + D_(cal(G)) \( x \) -
   D_(cal(G)) \( y \) . $ <eq:boundary-correction>]

]
] <lem:boundary-correction>

#proof[
  Choose a vertex $a$ after the last exit of the target ray from $H$.
    The segment from $a$ to each later $v_j$ minimizes for both metrics, so $T_H \( a \, v_j \) =
    T \( a \, v_j \)$. Each of the sequences
  $ T_H \( x \, v_j \) - T \( a \, v_j \) \, wide T \( x \, v_j \) - T \( a \, v_j \) $
  is decreasing by the triangle inequality along this calibrated tail.
    They are bounded in absolute value by $T_H \( x \, a \)$ and $T \( x \, a \)$, respectively.
    These bounds are finite because the half-plane lattice is connected and all edge weights are finite.
    Their limits therefore exist and are finite. Their difference is nonnegative, since $T_H gt.eq T$,
    and defines $D_(cal(G)) \( x \)$.
  Any two rays of the family have a common tail, so changing the target ray leaves the limit unchanged.
    A translation by $k z$ preserves $H$ and replaces the target ray by another translated ray of the same family.
    This proves covariance, hence stationarity. No choice of the auxiliary anchor $a$ enters the definition of
    $D_(cal(G))$. Measurability follows from the measurable ray choice and the countable limits defining the
    distances. Subtracting the two distance limits at $x$ and $y$ proves (82) and the existence of $B_(cal(G))^H$. ◻
]

#thm([Lemma 9.2.])[
  (A nonnegative stationary difference).  #emph[Let $Delta \( k \, l \)$, $k \, l in bb(Z)$, be a finite,
    additive stationary process, with $Delta \( k \, k + 1 \) gt.eq 0$ almost surely.
    If $Delta \( 0 \, n \) \/ n arrow.r 0$ in probability, then every increment is zero almost surely.]
] <lem:zero-boundary-difference>

#proof[
  Set $X_k = min { Delta \( k \, k + 1 \) \, 1 }$. Then
  $ 0 lt.eq A_n := 1 / n sum_(k = 0)^(n - 1) X_k lt.eq frac(Delta \( 0 \, n \), n) \, wide A_n lt.eq 1 . $
  Thus $A_n arrow.r 0$ in probability and $bb(E) A_n lt.eq epsilon + bb(P) \( A_n > epsilon \) arrow.r
    epsilon$ for every $epsilon > 0$. Stationarity gives $bb(E) A_n = bb(E) X_0$ for all $n$, so $X_0 =
    0$ almost surely. Stationarity, countability and additivity prove the assertion for every pair.
    Neither integrability of $Delta$ nor ergodicity is needed. ◻
]

#thm([Proposition 9.3.])[
  (The fixed-functional boundary comparison).  #emph[Two random coalescing geodesics with the same full-plane
    Busemann linear functional agree almost surely under the assumptions of 1.]
] <prop:boundary-uniqueness>

#proof[
  Let the two families be $cal(G) \, cal(G)'$, with common functional $rho$.
    By [2] Proposition 4.3, their contact sector is contained in the interior of one of the eight half-planes $H$.
    Both families eventually enter every translate of $H$.
  We first recall the geometric part of [2] Lemma 4.6, Section 4.4,
    which does not use its subsequent expectation assertion. There is positive probability that the ray from the
    origin stays in $H$: on an eventual-entrance ray, a vertex minimizing the normal coordinate starts a tail
    contained in its translated half-plane. Finite uniqueness and coalescence identify this suffix with the
    selected ray from that vertex. Countability of the vertices and covariance give positive probability at a
    fixed vertex. Boundary translations of an iid environment are ergodic, also for diagonal boundaries.
    Hence there are such starting vertices in both directions along the boundary.
  Choose two of these roots on opposite sides of the origin.
    The two contained rays coalesce, and their portions up to their first common vertex form a finite simple
    connecting arc. If the origin lies on this arc, its selected suffix is already contained in $H$.
    Otherwise, choose consecutive boundary contacts of the arc on opposite sides of the origin.
    The intervening subarc, together with the boundary segment, encloses a bounded region adjacent to the origin.
    Choose a vertex $w$ on the common tail of the two bounding rays and the target ray,
    outside this region and beyond the connecting arc. Every restricted minimizer from the origin to a target
    beyond $w$ must meet the separating subarc. From that meeting point,
    the bounding-ray suffix to the target lies in $H$ and is a full-plane minimizer.
    Restricted uniqueness forces this suffix, hence passage through $w$.
    The prefix to $w$ is then the fixed restricted minimizer to $w$.
    This proves stabilization and coalescence with the full-plane family,
    including when the bounding rays revisit the boundary. Applying the construction at every boundary root gives
    $cal(G)_H \, cal(G)'_H$; their common Busemann functions on the boundary are exactly the restricted limits in 31.
  Suppose that the families differ with positive probability.
    Because each restricted family coalesces, the event that the two families coalesce is invariant under boundary
    translations. If they coalesce, finite uniqueness makes their rays from any common root identical.
    Boundary ergodicity therefore makes distinctness an almost-sure event.
    The same invariance and ergodicity make their asymptotic planar order deterministic, as in [2] Section 4.5.
    Orient the boundary vector $z$ so that the finite crossing comparison in equation (12) of that source gives
  #[#set math.equation(numbering: n => "(83)")
   $ Delta \( k \, l \) := B_(cal(G))^H \( k z \, l z \) - B_(cal(G)')^H \( k z \, l z \) gt.eq 0 \, wide
     k < l . $ <eq:boundary-nonnegative>]
  For clarity, the comparison chooses a crossing of $cal(G)_H \( k z \)$ with $cal(G)'_H \( l z \)$ and
    common-tail vertices $x$ of the primed rays and $y$ of the unprimed rays, both beyond the crossing.
    Swapping the two pieces at the crossing gives walks $pi_x$ from $k z$ to $x$ and $pi_y$ from $l z$ to $y$, and
  $ Delta \( k \, l \) = #scale(x: 120%, y: 120%)[\(] T_H \( pi_y \) -
    T_H \( l z \, y \) #scale(x: 120%, y: 120%)[\)] + #scale(x: 120%, y: 120%)[\(] T_H \( pi_x \) -
    T_H \( k z \, x \) #scale(x: 120%, y: 120%)[\)] . $
  Both summands are nonnegative finite excess costs. This identity is purely geometric and does not use expectations.
  Put $Z \( x \) = D_(cal(G)) \( x \) - D_(cal(G)') \( x \)$. Equation (82) gives
  $ Delta \( 0 \, n \) = B_(cal(G)) \( 0 \, n z \) - B_(cal(G)') \( 0 \, n z \) + Z \( 0 \) - Z \( n z \) . $
  The first difference divided by $n$ tends to zero almost surely,
    by the full-plane linearity and the equality of the two functionals.
    For each $epsilon > 0$, finiteness and stationarity give
  $ bb(P) \( \| Z \( n z \) \| > n epsilon \) = bb(P) \( \| Z \( 0 \) \| > n epsilon \) arrow.r 0 . $
  Consequently $Delta \( 0 \, n \) \/ n arrow.r 0$ in probability.
    The process $Delta$ is additive and stationary under boundary shifts,
    so 32 and (83) imply $Delta \( k \, l \) = 0$ for every pair, almost surely.
  The final uniqueness argument is the finite one in [2] Section 4.5.
    Distinct same-root restricted rays have a finite common initial portion.
    Choose a deterministic bound on its length that holds with positive probability;
    boundary ergodicity gives two such roots farther apart than twice this bound.
    In the crossing comparison just described, at least one swapped walk then differs from the corresponding
    minimizing path. Indeed, if both swapped walks were their unique geodesics,
    their crossing vertex would lie in the common initial portion from each root.
    If these portions have at most $m$ edges, the lattice distance between the roots would be at most $2 m$,
    contrary to their choice. Since both nonnegative excesses sum to zero,
    a distinct swapped walk is also minimizing, contrary to uniqueness. Thus the restricted families agree.
    Their coalescence with the full-plane families and finite uniqueness imply $cal(G) = cal(G)'$. ◻
]

This supplies the conclusion of [2] Proposition 4.4 without the boundary-expectation step.
  The other later direct use of Lemma 4.6, in the proof of Lemma 9.6 of that source,
  uses only the geometric construction and coalescence. Thus the structural input in 4 retains its stated
  minimum-moment scope; no integrability of a diagonal boundary Busemann function is inserted.

#heading(level: 1)[References]
#bibitem([1])[Daniel Ahlberg, Jack Hanson, and Christopher Hoffman,
  #emph[The number of geodesics in planar first-passage percolation grows sublinearly], arXiv:2208.11576v1, 2022.
  #link("https://arxiv.org/abs/2208.11576v1").]
#bibitem([2])[Daniel Ahlberg and Christopher Hoffman, #emph[Random coalescing geodesics in first-passage
  percolation], arXiv:1609.02447v2, 2019. #link("https://arxiv.org/abs/1609.02447v2").]
#bibitem([3])[Kenneth S. Alexander, #emph[Geodesics, bigeodesics,
  and coalescence in first passage percolation in general dimension],
  Electronic Journal of Probability #strong[28] (2023), paper no.~160, 83 pp.
  #link("https://doi.org/10.1214/23-EJP1011")[doi:10.1214/23-EJP1011].]
#bibitem([4])[Antonio Auffinger, Michael Damron, and Jack Hanson,
  #emph[Limiting geodesics for first-passage percolation on subsets of $bb(Z)^2$],
  The Annals of Applied Probability #strong[25] (2015), no.~1, 373--405.
  #link("https://doi.org/10.1214/13-AAP999")[doi:10.1214/13-AAP999].]
#bibitem([5])[Erik Bates and Sourav Chatterjee, #emph[Fluctuation lower bounds in planar random growth models],
  Annales de l'Institut Henri Poincaré, Probabilités et Statistiques #strong[56] (2020), no.~4, 2406--2427.
  #link("https://doi.org/10.1214/19-AIHP1043")[doi:10.1214/19-AIHP1043].
  The version used here is arXiv:1810.03656v5 (2021). #link("https://arxiv.org/abs/1810.03656v5").]
#bibitem([6])[Gerandy Brito, Michael Damron, and Jack Hanson,
  #emph[Absence of backward infinite paths for first-passage percolation in arbitrary dimension],
  The Annals of Probability #strong[51] (2023), no.~1, 70--100.
  #link("https://doi.org/10.1214/22-AOP1588")[doi:10.1214/22-AOP1588].]
#bibitem([7])[Robert M. Burton and Michael Keane, #emph[Density and uniqueness in percolation],
  Communications in Mathematical Physics #strong[121] (1989), no.~3, 501--505.
  #link("https://doi.org/10.1007/BF01217735")[doi:10.1007/BF01217735].]
#bibitem([8])[J. Theodore Cox and Richard Durrett, #emph[Some limit theorems for percolation processes with
  necessary and sufficient conditions], The Annals of Probability #strong[9] (1981), no.~4, 583--603.
  #link("https://doi.org/10.1214/aop/1176994364")[doi:10.1214/aop/1176994364].]
#bibitem([9])[Michael Damron and Jack Hanson, #emph[Busemann functions and infinite geodesics in two-dimensional
  first-passage percolation], Communications in Mathematical Physics #strong[325] (2014), no.~3, 917--963.
  #link("https://doi.org/10.1007/s00220-013-1875-y")[doi:10.1007/s00220-013-1875-y].]
#bibitem([10])[Michael Damron and Jack Hanson, #emph[Bigeodesics in first-passage percolation],
  Communications in Mathematical Physics #strong[349] (2017), no.~2, 753--776.
  #link("https://doi.org/10.1007/s00220-016-2743-3")[doi:10.1007/s00220-016-2743-3].
  The preprint version used here is arXiv:1512.00804v2 (2016).]
#bibitem([11])[Barbara Dembin, Dor Elboim, and Ron Peled,
  #emph[Coalescence of geodesics and the BKS midpoint problem in planar first-passage percolation],
  Geometric and Functional Analysis #strong[34] (2024), 733--797.
  #link("https://doi.org/10.1007/s00039-024-00672-z")[doi:10.1007/s00039-024-00672-z].]
#bibitem([12])[John M. Hammersley and Dominic J. A. Welsh, #emph[First-passage percolation, subadditive processes,
  stochastic networks, and generalized renewal theory], in #emph[Bernoulli 1713 Bayes 1763 Laplace 1813:
  Anniversary Volume] (J.~Neyman and L.~M. Le Cam, eds.), Springer, 1965, pp.~61--110.
  #link("https://doi.org/10.1007/978-3-642-99884-3_7")[doi:10.1007/978-3-642-99884-3\_7].]
#bibitem([13])[Christopher Hoffman, #emph[Coexistence for Richardson type competing spatial growth models],
  The Annals of Applied Probability #strong[15] (2005), no.~1B, 739--747.
  #link("https://doi.org/10.1214/105051604000000729")[doi:10.1214/105051604000000729].]
#bibitem([14])[Christopher Hoffman, #emph[Geodesics in first passage percolation],
  The Annals of Applied Probability #strong[18] (2008), no.~5, 1944--1969.
  #link("https://doi.org/10.1214/07-AAP510")[doi:10.1214/07-AAP510].]
#bibitem([15])[Alexander S. Kechris, #emph[Classical Descriptive Set Theory], Graduate Texts in Mathematics,
  vol.~156, Springer-Verlag, New York, 1995.
  #link("https://doi.org/10.1007/978-1-4612-4190-4")[doi:10.1007/978-1-4612-4190-4].]
#bibitem([16])[Harry Kesten, #emph[Aspects of first passage percolation],
  in #emph[École d'été de probabilités de Saint-Flour, XIV---1984] (P.~L.
  Hennequin, ed.), Lecture Notes in Mathematics, vol.~1180, Springer, Berlin, 1986, pp.~125--264.
  #link("https://doi.org/10.1007/BFb0074919")[doi:10.1007/BFb0074919].]
#bibitem([17])[Cristina Licea and Charles M. Newman, #emph[Geodesics in two-dimensional first-passage
  percolation], The Annals of Probability #strong[24] (1996), no.~1, 399--410.
  #link("https://doi.org/10.1214/aop/1042644722")[doi:10.1214/aop/1042644722].]
#bibitem([18])[Charles M. Newman, #emph[A surface view of first-passage percolation],
  in #emph[Proceedings of the International Congress of Mathematicians, Zürich 1994], vols.~1, 2, Birkhäuser,
  1995, pp.~1017--1023. #link("https://doi.org/10.1007/978-3-0348-9078-6_94")[doi:10.1007/978-3-0348-9078-6\_94].]
#bibitem([19])[Jan Wehr and Jung Woo, #emph[Absence of geodesics in first-passage percolation on a half-plane],
  The Annals of Probability #strong[26] (1998), no.~1, 358--367.
  #link("https://doi.org/10.1214/aop/1022855423")[doi:10.1214/aop/1022855423].]
