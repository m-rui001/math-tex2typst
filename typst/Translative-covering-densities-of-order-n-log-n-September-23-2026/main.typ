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

#align(center)[#text(size: 16pt, weight: "bold")[Translative covering densities of order $n log n$]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

A convex body in $bb(R)^n$ is a compact convex set with nonempty interior.
  A set $X subset bb(R)^n$ is #emph[locally finite] if every bounded set contains only finitely many of its
  points. It gives a #emph[translative covering] of $K$ when $K + X = bb(R)^n$. Write $Q_R = \[ - R \, R \]^n$.
  We define the translative covering density by

#[#set math.equation(numbering: n => "(1.1)")
 $ theta_T \( K \) = inf_(X upright(" locally finite")\
K + X = bb(R)^n) "vol" \( K \) limsup_(R arrow.r oo) frac(\# \( X ∩ Q_R \), \( 2 R \)^n) . $ <eq:unrestricted-density>]

Thus the density measures the asymptotic volume of translates per unit volume, counting overlaps.
  It is not the fraction of space covered, which is one for every covering.
  No asymptotic density limit is assumed for an individual arrangement.

A #emph[periodic translative covering] is a covering

$ bb(R)^n = K + Lambda + T \, $

where $Lambda$ is a full-rank lattice and $T$ is a finite set of distinct representatives modulo $Lambda$.
  Its center intensity is $\| T \| \/ det Lambda$, and its density is $\| T \| "vol" \( K \) \/ det Lambda$. Put

$ theta_(upright("per")) \( K \) = inf {frac(\| T \| "vol" \( K \), det Lambda) : K + Lambda + T = bb(R)^n} . $

The infimum ranges over every lattice and every finite set $T$.
  In particular, there is no bound on the number of cosets.
  Allowing repeated representatives of the same coset gives the same infimum:
  deleting redundant representatives preserves the covering and does not increase its listed density.
  When we later retain indexed center lists, we count such repetitions explicitly. Both infima are finite:
  an interior cube of $K$ gives a covering by translates on a sufficiently fine cubic lattice.

The classical periodization principle gives

#[#set math.equation(numbering: n => "(1.2)")
 $ theta_T \( K \) = theta_(upright("per")) \( K \) . $ <eq:density-equivalence>]

We prove the precise statement in Appendix 10, including agreement with lower or upper centered-ball density and
  average covering multiplicity. See also Prosanov #cite(label("Prosanov2021PackingCovering")) Section 1.1 and
  Theorem 2.1, who attributes the principle to Rogers. These are equalities of optimal densities;
  the lower and upper densities of an individual nonperiodic arrangement need not agree.

#thm([Theorem 1.1.])[
  #emph[There are absolute constants $c > 0$ and $n_0$ such that, for every integer $n gt.eq n_0$,
    some centrally symmetric convex body $K_n subset bb(R)^n$ satisfies
$ theta_T \( K_n \) > c n log n . $

]
] <thm:main>

Thus there is no absolute constant $C$ such that $theta_T \( K \) lt.eq
  C n$ for every convex body in every dimension, even if the bodies are required to be centrally symmetric.
  This answers negatively the universal linear-bound question recorded by
  Naszódi #cite(label("Naszodi2018Flavors")) Section 3. Rogers #cite(label("Rogers1957Coverings")) proved that
  every convex body in dimension $n gt.eq 3$ has a periodic translative covering of density at most

#[#set math.equation(numbering: n => "(1.3)")
 $ n log n + n log log n + 5 n . $ <eq:rogers>]

Together with Theorem 1, this shows that the supremum of covering density over convex bodies has order $n log n$.
  The same order holds when one restricts the bodies to be centrally symmetric.
  The constant in Theorem 1 is not optimized. The bodies may moreover be chosen to be centrally symmetric
  polytopes with rational vertices, with the same constant $c$; see Corollary 15.

=== 1.1 Antecedents and the additional uniformity <antecedents-and-the-additional-uniformity>

Rogers’ theorem supplies a universal upper bound for arbitrary convex bodies.
  Fejes Tóth #cite(label("FejesToth2009Covering")) sharpened its lower-order term to obtain density
  $n \( log n + log log n + 1 + o \( 1 \) \)$ using only $O \( log n \)$ cosets of a common lattice.
  A finite union of lattice cosets has substantially more freedom than one lattice,
  even with this bound on the number of cosets. On the lower-bound side, the classical work of Coxeter,
  Few and Rogers #cite(label("CoxeterFewRogers1959Spheres")) gives an order-$n$ obstruction already for
  unrestricted coverings by equal Euclidean balls. For Euclidean balls,
  Dumer #cite(label("Dumer2007Spheres")) Corollary 2 gives the upper bound $\( 1 \/ 2 + o \( 1 \) \) n log n$.
  The gap for Euclidean balls remains; our theorem determines the optimal order when the convex body may also be chosen.

The proof builds on the random-slab construction and Poisson witness method of Li and
  Liu #cite(label("LiLiu2026Lattice")) Theorem 1.3. They prove an order-$n log
  n$ lower bound for #emph[lattice] covering density, in which the centers form a single lattice.
  Their common-intersection estimates, terminal clustering of caps,
  and overlap-diagram bounds provide the local probabilistic machinery used here.
  We give the necessary versions and their proofs, including the continuous form of Janson’s inequality.

The additional issue is to exclude every finite union of lattice cosets.
  A net of lattice bases cannot encode an arbitrary number of cosets.
  We instead localize an arrangement in a fixed Euclidean window, keeping every center with its multiplicity,
  and round the resulting list to a finite grid. Periodic averaging controls this list even when the lattice has
  very short periods or a highly skew fundamental domain. The resulting finite class is fixed before the body is
  sampled, so it includes arrangements chosen after the body is known.
  A sufficiently strong lower-tail bound then excludes all of them simultaneously.

For comparison, Bukh, Gao, Liu, Pikhurko, and Sun #cite(label("BukhEtAl2025Random")) Theorem 1.3 show that,
  in their packing-torus model, Poisson centers at a specified density of order $n log
  n$ fail to cover a given body with probability tending to one.
  Their random-centers barrier has different quantifiers: an exceptional arrangement might still cover
  efficiently. Here the body is random and the conclusion excludes every periodic arrangement for one realization
  of that body.

=== 1.2 Proof outline <proof-outline>

Intersect a slightly enlarged Euclidean ball with symmetric slabs whose unit normals are sampled by a Poisson
  process. The normalization gives this body a substantial volume with positive probability.
  A hypothetical covering of low center intensity supplies, after localization and rounding,
  a finite center list with many suitable target points in a small window.
  We must show that each such list is very unlikely to cover that window.

At a target $y$, only centers $p$ within the outer ball’s radius of $y$ can cover it.
  For each such center, the residual vector $y - p$ determines the antipodal caps of slab normals that would
  remove $y$ from that translate. A hole appears if the Poisson process hits at least one cap in each pair.
  Nearly coincident cutting sets are strongly dependent. Following Li and Liu,
  we group these conditions into blocks and choose one common subset of normals for each block.
  Assigning distinct Poisson points to these subsets certifies a hole.
  The block construction controls the complete overlap sum of these certificates, including their self-overlaps.

The targets are chosen at two angular scales. For every pair of distinct targets,
  every pair of their relevant residual directions is separated at a scale of order $sqrt(log n \/ n)$,
  identifying opposite directions because the slabs are symmetric.
  The cap estimates then bound the dependence between their hole certificates.
  The body lies in a ball whose radius is only slightly larger than the slab half-width,
  so its cutting caps have a small fixed angular radius. At a larger fixed separation,
  all cutting caps belonging to one target are disjoint from those belonging to the other.
  A cylinder-volume estimate lets us arrange this stronger separation for all but an exponentially small fraction
  of target pairs, while retaining the finer separation for every pair.

Let $R$ denote the density lower bound sought. We can choose $exp \( c_1 n log n \)$ targets for a fixed $c_1 >
  0$, enough to absorb a self-overlap cost $exp \( C R \)$ when $R = c n log n$ and $c$ is sufficiently small.
  The two angular scales control the remaining overlap between distinct targets.
  Janson’s lower-tail inequality turns these bounds into a covering probability that is doubly exponentially small
  in $n$, with decay strong enough to dominate the number of rounded patterns.
  A second-moment bound would not give the required decay.

Section 2 defines the body and the constants. Section 3 constructs the finite pattern class.
  Sections 4–6 establish the cap, block, and Poisson estimates.
  Section 7 proves the fixed-pattern bound, and Section 8 completes the proof.
  Section 9 gives rational-polytope and rational-normal versions of the construction.
  Appendix 10 proves the density equivalence that transfers the periodic exclusion to unrestricted coverings.

=== 1.3 Notation <notation>

Logarithms are natural, and $\[ t \]_(+) = max { t \, 0 }$.
  We write $\| x \|$ for Euclidean norm, $B_r = { x in bb(R)^n : \| x \| lt.eq r }$, $B = B_1$, and $omega_n =
  "vol" \( B \)$. For measurable sets in $bb(R)^n$, $\| A \|$ also denotes Lebesgue volume;
  for finite lists and index sets it denotes cardinality. Surface measure $sigma$ on $S^(n - 1)$ is normalized to
  have total mass one. For nonzero vectors we use the projective angle

$ angle \( x \, z \) = arccos frac(\| x dot.op z \|, \| x \| \| z \|) in \[ 0 \, pi \/ 2 \] . $

Lists are indexed: two entries can occupy the same point or define the same cap.
  Every sum and cardinality over such a list retains its multiplicities.
  Constants implicit in $O \( dot.op \)$ depend only on parameters explicitly fixed before $n$ tends to infinity.

== 2 The random body <sec:construction>

Fix the numerical constants

#[#set math.equation(numbering: n => "(2.1)")
 $ epsilon = 2^(- 30) \, wide a = 1 + epsilon \, wide D = 2^(- 10) = epsilon^(1 \/ 3) \, wide v = 1 /
   64 . $ <eq:fixed-constants>]

For each sufficiently large $n$, put

#[#set math.equation(numbering: n => "(2.2)")
 $ eta = n^(- 4) \, wide b = a \( 1 + 1 \/ n \) \, wide r_(-) = a \( 1 - 10 log n \/ n \) . $ <eq:radii>]

The small window is $B_D$. Its size relative to $a$ will govern the number of patterns, through

#[#set math.equation(numbering: n => "(2.3)")
 $ lambda_0 = log \( 1 + D \/ a \) \, wide gamma = log frac(D, 8 sqrt(epsilon)) - 2 lambda_0 = log 4 -
   2 lambda_0 . $ <eq:rates>]

Since $lambda_0 < D = 2^(- 10)$, we have $gamma > 3 lambda_0$.
  These constants are fixed; none tends to zero with dimension.

Set

#[#set math.equation(numbering: n => "(2.4)")
 $ M = #scale(x: 120%, y: 120%)[\(] sigma { u : \| u dot.op e_1 \| > 1 \/ a }
   #scale(x: 120%, y: 120%)[\)]^(- 1) \, wide mu = M sigma \, $ <eq:poisson-measure>]

and let $Pi$ be a Poisson process on $S^(n - 1)$ with intensity $mu$.
  Equivalently, sample a Poisson random integer of mean $M$,
  then that many independent $sigma$-distributed unit normals. Define

#[#set math.equation(numbering: n => "(2.5)")
 $ K & = b B ∩ ⋂_(u in Pi) { x : \| u dot.op x \| lt.eq 1 } \,\
K^(+) & = \( b + 3 eta \) B ∩ ⋂_(u in Pi) { x : \| u dot.op x \| lt.eq 1 + 3 eta } . $ <eq:body>]

The enlarged body $K^(+)$ absorbs the displacement of centers during rounding.
  Since $M < oo$, the list of normals is finite almost surely.
  Both bodies are compact and centrally symmetric, and $B subset K$, so $K$ has nonempty interior.

#thm([Lemma 2.1.])[
  #emph[The body in (2.5) satisfies
$ bb(P) { \| K \| > 2 v omega_n a^n } gt.eq frac(exp \( - 1 \) - 2 v, 3 - 2 v) > 0 . $

]
] <lem:volume>

#proof[
  If $\| x \| lt.eq a$, the $mu$-measure of normals with $\| u dot.op x \| >
    1$ is at most one by rotational invariance and (2.4). The probability that there is no such Poisson normal is
    therefore at least $exp \( - 1 \)$. Integrating over $a B$ gives $bb(E) \| K \| gt.eq
    exp \( - 1 \) omega_n a^n$. On the other hand, $\| K \| lt.eq omega_n b^n < 3 omega_n a^n$.
    Thus $X = \| K \| \/ \( omega_n a^n \)$ has $0 lt.eq X lt.eq 3$ and $bb(E) X gt.eq exp \( - 1 \)$.
    Writing $p = bb(P) \( X > 2 v \)$, we have $bb(E) X lt.eq 2 v \( 1 - p \) + 3 p$, which proves the claim. ◻
]

We shall rule out coverings with center intensity at most

#[#set math.equation(numbering: n => "(2.6)")
 $ rho_0 = frac(R, 2 v omega_n a^n) \, $ <eq:intensity-threshold>]

where $R$ is a positive parameter. This threshold does not depend on the realized volume.
  Once every such covering is excluded, the definition of $theta_(upright("per"))$ gives
  $theta_(upright("per")) \( K \) gt.eq rho_0 \| K \|$. The strict volume event in Lemma 2 will then imply
  $theta_(upright("per")) \( K \) > R$, including strictness at the infimum.

== 3 Reducing all periodic coverings to finitely many patterns <sec:localization>

We first remove the lattice and its fundamental domain from the subsequent probability estimate.
  A periodic arrangement of bounded center intensity has a translated ball containing relatively few centers and
  many points with controlled residual vectors. Rounding those centers produces a list in a fixed finite family.
  The argument counts every occurrence of a center, so it applies to arbitrarily short or skew periods and to
  coinciding cosets.

Use the fixed parameters $a \, D \, v \, b \, r_(-) \, eta$ from the preceding section, and let $1 lt.eq R lt.eq
  n^2$. Define

$ C_(upright("loc")) = 1000 / v \, wide w_a \( r \) = 1 + n \[ 1 - r^2 \/ a^2 \]_(+) quad \( r gt.eq 0 \) \, wide
  h_n = frac(eta, 100 n) . $

The weight $w_a$ records the radial cost of a center near a target point.
  Our finite alphabet and maximum list length are

#[#set math.equation(numbering: n => "(3.1)")
 $ cal(Q)_n = h_n bb(Z)^n ∩ B_(D + b + 5 eta) \, wide N_n = ⌈frac(20 R, v) (frac(D + b + 5 eta, a))^n⌉ .
   $ <eq:local-grid>]

An ordered list $P = \( p_1 \, dots.h \, p_m \)$ over $cal(Q)_n$ may contain repeated entries.
  Define $G_P subset.eq B_D$ to consist of the points $y$ satisfying the following three conditions:

#[#set math.equation(numbering: n => "(3.2)")
 $ \| y - p_j \| & gt.eq r_(-) - 2 eta &  & \( 1 lt.eq j lt.eq m \) \,\
\# { j : \| y - p_j \| lt.eq b + 3 eta } & lt.eq 2 C_(upright("loc")) R \,\
sum_(j : thin \| y - p_j \| lt.eq b + 3 eta) w_a \( \| y - p_j \| \) & lt.eq
  2 C_(upright("loc")) R . $ <eq:rounded-inner>]

The count condition follows from the weight condition because $w_a gt.eq 1$;
  we display both to identify the cardinality and cost bounds used later.
  All sums count indices, including repeated entries. Set

#[#set math.equation(numbering: n => "(3.3)")
 $ cal(F)_n = {P in union.big_(m = 0)^(N_n) cal(Q)_n^m : \| G_P \| gt.eq 1 / 4 \| B_D \|} . $ <eq:pattern-family>]

The dependence of $N_n$ and $cal(F)_n$ on $R$ is suppressed in the notation.
  Empty lists are allowed, with all their sums equal to zero.

#thm([Proposition 3.1.])[
  (Deterministic localization).  #emph[For all sufficiently large $n$, uniformly for $1 lt.eq R lt.eq n^2$,
    the family $cal(F)_n$ has the following properties. With $lambda_0 = log \( 1 + D \/ a \)$,
#[#set math.equation(numbering: n => "(3.4)")
 $ N_n lt.eq n^(C_1) exp \( lambda_0 n \) \, wide log \| cal(F)_n \| lt.eq
   exp #scale(x: 120%, y: 120%)[\(] lambda_0 n + O \( log n \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:pattern-entropy>]

 where $C_1$ and the implicit constant depend only on the fixed parameters.]
  #emph[Let $cal(U) subset S^(n - 1)$ be any finite set, and put
$ K = b B ∩ ⋂_(u in cal(U)) { x : \| u dot.op x \| lt.eq 1 } \, wide
  K^(+) = \( b + 3 eta \) B ∩ ⋂_(u in cal(U)) { x : \| u dot.op x \| lt.eq 1 + 3 eta } . $

 Suppose that $Lambda$ is any full-rank lattice, $T subset bb(R)^n$ is finite, and
$ frac(\| T \|, det Lambda) lt.eq rho_0 := frac(R, 2 v omega_n a^n) . $

 If $K + Lambda + T$ covers $bb(R)^n$, there is a list $P = \( p_1 \, dots.h \, p_m \) in cal(F)_n$ such that
#[#set math.equation(numbering: n => "(3.5)")
 $ B_D subset.eq union.big_(j = 1)^m \( p_j + K^(+) \) . $ <eq:localized-cover>]

 The constructed list in fact satisfies $\| G_P \| gt.eq \| B_D \| \/ 2$.]
  #emph[For every $P in cal(F)_n$ and $y in G_P$, list all residual vectors $x_i = y - p_j$ with $\| y -
    p_j \| lt.eq b + 3 eta$, retaining their indices, and denote their number by $m_y$. Then
#[#set math.equation(numbering: n => "(3.6)")
 $ r_(-) - 2 eta lt.eq \| x_i \| lt.eq b + 3 eta \, wide m_y lt.eq 2 C_(upright("loc")) R \, wide
   sum_(i = 1)^(m_y) w_a \( \| x_i \| \) lt.eq 2 C_(upright("loc")) R \,\
m_y + sum_(i = 1)^(m_y) w_a \( \| x_i \| \) lt.eq 4 C_(upright("loc")) R . $ <eq:local-residual-budget>]

]
] <prop:localization>

#proof[
  We prove the localization and rounding assertions first, then count the resulting lists.
    All dimension thresholds in the proof are uniform for $1 lt.eq R lt.eq n^2$.
  ===== 3.1 Averaging the full multiset of centers. <averaging-the-full-multiset-of-centers.>
  Give each center an index $\( t \, ell \) in T times Lambda$, at position $t + ell$.
    Distinct indices remain distinct even if they have the same position.
    This multiset is locally finite because $T$ is finite and $Lambda$ is discrete.
    Write $rho = \| T \| \/ det Lambda$, and let $F$ be a fundamental parallelepiped of $Lambda$.
    For every nonnegative integrable function $f$,
  #[#set math.equation(numbering: n => "(3.7)")
   $ frac(1, \| F \|) integral_F sum_(\( t \, ell \) in T times Lambda) f \( y - t - ell \) thin d y =
     rho integral_(bb(R)^n) f \( x \) thin d x . $ <eq:periodic-averaging>]
  Indeed, Tonelli’s theorem permits the sums to be interchanged with the integral.
    For each $t$, the sets $F - t - ell$, $ell in Lambda$, partition $bb(R)^n$ up to null sets.
    This proves the identity without any restriction on the shape or size of $F$.
  Put $beta = b + 4 eta$. Call a point $y in bb(R)^n$ unrounded-good if there is no center occurrence at distance
    less than $r_(-)$, at most $C_(upright("loc")) R$ occurrences have distance at most $beta$, and
  #[#set math.equation(numbering: n => "(3.8)")
   $ sum_(\( t \, ell \) : thin \| y - t - ell \| lt.eq beta) w_a \( \| y - t - ell \| \) lt.eq
     C_(upright("loc")) R . $ <eq:unrounded-weight>]
  Let $G$ be this periodic measurable set. These conditions respectively exclude short residuals,
    bound the number of relevant residuals, and bound their total radial cost.
    Using the full ball ensures that every index entering a rounded test is counted before rounding.
  For a uniform point modulo $Lambda$, the expected number of occurrences in its open $r_(-)$-ball is at most
  $ rho omega_n r_(-)^n lt.eq frac(R, 2 v) (1 - frac(10 log n, n))^n lt.eq frac(R n^(- 10), 2 v) lt.eq 1 / 200 $
  for large $n$. Hence the first condition fails with probability at most $1 \/ 200$. Also
  $ (beta / a)^n lt.eq exp \( 1 + 4 \/ n^3 \) < 3 $
  for large $n$, so the expected outer count is at most $3 R \/ \( 2 v \)$.
    For the weighted condition, polar integration gives the exact identity
  #[#set math.equation(numbering: n => "(3.9)")
   $ integral_(B_beta) w_a \( \| x \| \) thin d x & = omega_n beta^n +
     n integral_(B_a) \( 1 - \| x \|^2 \/ a^2 \) thin d x\
 & = omega_n beta^n + frac(2 n, n + 2) omega_n a^n < 5 omega_n a^n . $ <eq:weighted-ball-integral>]
  Equation (3.7) therefore bounds the expected weighted sum by $5 R \/ \( 2 v \)$.
    Markov’s inequality bounds the two remaining failure probabilities by $3 \/ 2000$ and $5 \/ 2000$,
    respectively. Consequently
  #[#set math.equation(numbering: n => "(3.10)")
   $ frac(\| G ∩ F \|, \| F \|) gt.eq 1 - 1 / 200 - 3 / 2000 - 5 / 2000 > 99 / 100 . $ <eq:periodic-good-volume>]
  ===== 3.2 One window with both required bounds. <one-window-with-both-required-bounds.>
  For $z$ uniform modulo $Lambda$, let $M \( z \)$ count all center occurrences in $z + B_(D + b + 4 eta)$.
    Equations (3.7) and (3.1) imply
  $ bb(E) M \( z \) lt.eq frac(R, 2 v) (frac(D + b + 4 eta, a))^n lt.eq N_n / 40 . $
  Moreover, periodicity and Fubini’s theorem give
  $ bb(E) frac(\| \( z + B_D \) \\ G \|, \| B_D \|) = 1 - frac(\| G ∩ F \|, \| F \|) lt.eq 1 / 100 . $
  Both expressions concern the entire Euclidean window, including all its overlapping period copies.
    Markov’s inequality gives
  $ bb(P) { M \( z \) > N_n } lt.eq 1 / 40 \, wide bb(P) { \| \( z + B_D \) \\ G \| > \| B_D \| \/ 2 } lt.eq 1 / 50 . $
  The sum is less than one. Fix a slide $z$ outside these two exceptional events,
    and retain every occurrence in $z + B_(D + b + 4 eta)$. There are at most $N_n$ such occurrences,
    and at least half of $z + B_D$ lies in $G$.
  ===== 3.3 Rounding and transferring coverage. <rounding-and-transferring-coverage.>
  Translate this window and the retained centers by $- z$, and round every center coordinatewise to the nearest
    point of $h_n bb(Z)^n$, using a fixed rule for ties. Each center moves a distance at most
  #[#set math.equation(numbering: n => "(3.11)")
   $ delta_n = frac(sqrt(n) h_n, 2) = frac(eta, 200 sqrt(n)) lt.eq eta / 200 . $ <eq:rounding-error>]
  The rounded centers belong to $cal(Q)_n$; enumerate them as an ordered list $P$, retaining all repeated entries.
  We check that every $y in B_D$ with $y + z in G$ belongs to $G_P$.
    Every unrounded residual has length at least $r_(-)$, so every rounded one has length at least $r_(-) -
    delta_n gt.eq r_(-) - 2 eta$. A rounded residual of length at most $b +
    3 eta$ comes from an unrounded residual of length at most
  $ b + 3 eta + delta_n < b + 4 eta . $
  Thus at most $C_(upright("loc")) R$ rounded indices are relevant.
    This strict separation of the two outer radii ensures that every index entering a rounded test was counted
    before rounding.
  The function $w_a$ is globally Lipschitz on $\[ 0 \, oo \)$ with constant $2 n \/ a$.
    Its derivative has absolute value $2 n r \/ a^2 lt.eq 2 n \/ a$ for $0 < r < a$,
    and it is constant for $r > a$. If $r$ and $r'$ are the unrounded and rounded lengths of a relevant residual, then
  $ w_a \( r' \) lt.eq w_a \( r \) + frac(2 n delta_n, a) lt.eq (1 + frac(2 n delta_n, a)) w_a \( r \) \, $
  where the last step uses $w_a \( r \) gt.eq 1$. Summing over the relevant indices,
    all of which were included in (3.8), gives
  $ sum_(j : thin \| y - p_j \| lt.eq b + 3 eta) w_a \( \| y - p_j \| \) lt.eq
    (1 + frac(2 n delta_n, a)) C_(upright("loc")) R lt.eq 2 C_(upright("loc")) R . $
  This verifies (3.2)–(3.2). In particular, $\| G_P \| gt.eq \| B_D \| \/ 2$ and $P in cal(F)_n$.
  Now assume that the original periodic arrangement covers by $K$.
    For any point of $z + B_D$, every center whose translate of $K$ contains that point lies in $z +
    B_(D + b)$ because $K subset.eq b B$. Such a center was retained.
    Moving it by at most $delta_n$ changes the residual norm by at most $delta_n$ and each scalar product with a
    unit normal by at most $delta_n$. Hence its rounded translate of $K^(+)$ contains the translated point of
    $B_D$. This proves (3.5) for every point of the closed window.
  ===== 3.4 Counting the lists. <counting-the-lists.>
  Write $J_n = \| cal(Q)_n \|$. A containing cube gives
  $ J_n lt.eq (1 + frac(2 \( D + b + 5 eta \), h_n))^n \, wide log J_n = O \( n log n \) . $
  Since $b = a \( 1 + 1 \/ n \)$, $eta = n^(- 4)$, and $1 lt.eq R lt.eq n^2$,
  $ log N_n = lambda_0 n + O \( log n \) . $
  This proves the first bound in (3.4). Counting ordered lists allows all multiplicities and gives
  $ \| cal(F)_n \| lt.eq sum_(m = 0)^(N_n) J_n^m lt.eq \( N_n + 1 \) J_n^(N_n) . $
  The two preceding estimates give the second bound in (3.4).
    Finally, (3.6) follows directly from the definition of $G_P$ and $w_a gt.eq 1$. ◻
]

The family $cal(F)_n$ depends only on the fixed numerical parameters, $n$, and $R$.
  Proposition 3 holds for every choice of the slab normals and every periodic covering of the required intensity.
  Thus a probability bound uniform over this finite family also controls centers chosen after the body is known.
  The next sections obtain such a bound by finding a point of $G_P$ missed by all translates in a fixed list.

== 4 Intersections of spherical caps <sec:caps>

We need two properties of the cutting caps: separated caps have small overlap,
  whereas a collection of nearby caps has a substantial common intersection.
  For a target $y in G_P$ and a relevant center $p$, write $x = y - p$. The set

$ C \( x \) = { u in S^(n - 1) : \| u dot.op x \| > 1 + 3 eta } $

consists of the normals whose slabs exclude $y$ from $p + K^(+)$. Figure 1 illustrates this correspondence.
  The estimates below allow the slightly more general thresholds needed to control these caps uniformly.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.05292, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$p$]], anchor: "north-east", padding: 0.1176cm)
  circle((2.9, 0.65), radius: 0.05292, fill: black, stroke: none)
  content((2.9, 0.65), [#text(size: 9pt)[$y$]], anchor: "south-west", padding: 0.1176cm)
  line((0, 0), (2.9, 0.65), stroke: (paint: rgb("#00008c"), thickness: 0.9pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  content((1.45, 0.325), [#text(size: 9pt)[$x=y-p$]], anchor: "south", padding: 0.1176cm)
  content((1.45, -1.05), [#text(size: 9pt)[center and target#linebreak()in physical space]])
  arc((9.047, 0.803), start: 35deg, stop: -35deg, radius: 1.4, fill: rgb("#ffd1d1"), stroke: none)
  arc((6.753, 0.803), start: 145deg, stop: 215deg, radius: 1.4, fill: rgb("#ffd1d1"), stroke: none)
  circle((7.9, 0), radius: 1.4, stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10))
  line((6.1, 0), (9.85, 0), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#8c8c8c"))))
  content((9.85, 0), [#text(size: 9pt)[$x"/"|x|$]], anchor: "west", padding: 0.1176cm)
  line((9.047, 0.803), (9.047, -0.803), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((6.753, 0.803), (6.753, -0.803), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((7.9, 0), (9.216, 0.4788), stroke: (paint: rgb("#00008c"), thickness: 0.9pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  content((9.216, 0.4788), [#text(size: 9pt)[$u$]], anchor: "south-west", padding: 0.1176cm)
  content((7.9, -2.05), [#text(size: 9pt)[cutting normals $C(x)$#linebreak()$|u dot.op x|>1+3 eta$]])
  content((7.9, 1.8), [#text(size: 9pt)[normal sphere]])
})],
  caption: [Figure 1: Plane-section schematic of a residual and its cutting cap. The shaded antipodal caps lie beyond the two threshold hyperplanes $u dot.op x = plus.minus \( 1 + 3 eta \)$. A sampled normal in $C \( x \)$ excludes the target $y$ from $p + K^(+)$. The drawing does not depict high-dimensional cap measure. For a block of residuals, one normal in their common subset cuts them all; assigning distinct normals to all blocks is a sufficient certificate of a hole. ],
) <fig:residual-cap>

The estimates adapt Li–Liu’s cap and common-lens arguments #cite(label("LiLiu2026Lattice")) Lemma 6.1 and
  Lemmas 9.2–9.3. In our thin radial shell, a bisector argument gives a short proof of the overlap estimate with a
  constant prefactor. Keeping that prefactor independent of dimension will be important when we sum overlaps.

#thm([Lemma 4.1.])[
  (Cap estimates).  #emph[Fix $1 < a < 2$ and $A \, Q \, B_0 > 0$.
    There exist constants $C_a \, c'_a > 0$, $C_(a \, A) > 0$, and $L =
    L \( a \) > 0$ such that the following holds for all sufficiently large $n$, depending on $a \, A \, Q \,
    B_0$. Let $sigma$ be normalized surface measure on $S^(n - 1)$, and set
$ M = sigma { u : \| u dot.op e_1 \| > 1 \/ a }^(- 1) \, wide mu = M sigma . $

 Let $x_1 \, dots.h \, x_m in bb(R)^n$ and $epsilon.alt_1 \, dots.h \, epsilon.alt_m in bb(R)$, where $1 lt.eq
   m lt.eq n^2$, satisfy
$ a (1 - frac(A log n, n)) - Q n^(- 4) lt.eq \| x_i \| lt.eq a \( 1 + 1 \/ n \) + Q n^(- 4) \,
  wide \| epsilon.alt_i \| lt.eq Q n^(- 4) . $

 Define
$ C_i = { u in S^(n - 1) : \| u dot.op x_i \| > 1 + epsilon.alt_i } \, quad c_i = mu \( C_i \) \, quad
  macron(c)_i = min \( c_i \, 1 \/ 2 \) \, quad s_i = - log macron(c)_i \, $

 and, using projective angles, define
$ d \( i \, j \) = sqrt(n) thin angle \( x_i \, x_j \) + sqrt(\| s_i - s_j \|) \, wide r \( S \) =
  min_(k in S) max_(i in S) d \( k \, i \)^2 $

 for each nonempty set $S$ of indices. Then
#[#set math.equation(numbering: n => "(4.1)")
 $ n^(- C_(a \, A)) lt.eq c_i & lt.eq C_a \, & s_i & lt.eq C_a #scale(x: 120%, y: 120%)[\(] 1 +
   n \[ 1 - \| x_i \|^2 \/ a^2 \]_(+) #scale(x: 120%, y: 120%)[\)] \,\
frac(mu \( C_i ∩ C_j \), sqrt(macron(c)_i macron(c)_j)) & lt.eq C_a exp { - c'_a d \( i \, j \)^2 } . $ <eq:caps-cost>]

 The function $d$ is a pseudometric on the indexed list. If $r \( S \) lt.eq
   B_0 log n$ and $i_0 in S$ minimizes the raw intensity $c_i$, then
#[#set math.equation(numbering: n => "(4.2)")
 $ mu (⋂_(i in S) C_i) gt.eq e^(- L \( 1 + r \( S \) + log \| S \| \)) macron(c)_(i_0) . $ <eq:caps-lens>]

 In particular, $L$ is independent of $A \, Q \, B_0$; these parameters may affect the starting dimension.]
] <lem:caps>

#proof[
  We first record one-dimensional estimates, then prove the overlap and common-intersection bounds.
    Constants with a subscript $a$ below may change from line to line, but depend only on $a$.
  ===== 4.1 One-cap probabilities and radial costs. <one-cap-probabilities-and-radial-costs.>
  Write $t_(*) = 1 \/ a$, $e_i = x_i \/ \| x_i \|$, and $tau_i = \( 1 + epsilon.alt_i \) \/ \| x_i \|$.
    For a unit vector $e$, let
  $ F_n \( t \) = sigma { u : u dot.op e > t } = k_n integral_t^1 \( 1 - v^2 \)^(\( n - 3 \) \/ 2) thin d v \,
    wide 0 < t < 1 \, $
  where $k_n$ is the normalization constant. Substitution of $z = 1 - v^2$, using $1 lt.eq 1 \/ v lt.eq 1 \/ t$, gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ frac(k_n, n - 1) \( 1 - t^2 \)^(\( n - 1 \) \/ 2) lt.eq F_n \( t \) lt.eq
     frac(k_n, \( n - 1 \) t) \( 1 - t^2 \)^(\( n - 1 \) \/ 2) . $ <eq:caps-mills>]
  Consequently,
  #[#set math.equation(numbering: n => "(4.4)")
   $ frac(\( n - 1 \) t, 1 - t^2) lt.eq - frac(d, d t) log F_n \( t \) lt.eq frac(n - 1, 1 - t^2) . $ <eq:caps-hazard>]
  These exact inequalities avoid dimension-dependent prefactors in ratios of cap probabilities.
  All the thresholds satisfy
  #[#set math.equation(numbering: n => "(4.5)")
   $ tau_i = t_(*) + O_(a \, A \, Q) \( log n \/ n \) \, wide tau_i gt.eq t_(*) - C_a \/ n \, $ <eq:caps-thresholds>]
  for sufficiently large $n$, and hence belong to the fixed interval $J = \[ t_(*) \/ 2 \, \( 1 + t_(*) \) \/ 2 \]
    subset \( 0 \, 1 \)$. Since $M = \( 2 F_n \( t_(*) \) \)^(- 1)$, we have $c_i =
    F_n \( tau_i \) \/ F_n \( t_(*) \)$. The logarithmic derivative in (4.4) is bounded by $C_a n$ on $J$.
    This proves $c_i lt.eq C_a$, while the lower radial bound proves $c_i gt.eq n^(- C_(a \, A))$.
    More explicitly, putting $delta_i = \[ 1 - \| x_i \|^2 \/ a^2 \]_(+)$, elementary algebra gives
  $ \( tau_i - t_(*) \)_(+) lt.eq C_a \( delta_i + Q n^(- 4) \) \, wide \( t_(*) - tau_i \)_(+) lt.eq
    C_a \( n^(- 1) + Q n^(- 4) \) \,\
n delta_i lt.eq C_(a \, A) log n + O_(a \, Q) \( n^(- 3) \) . $
  Integrating (4.4) therefore gives $- log c_i lt.eq C_a \( 1 + n delta_i \)$,
    after increasing the starting dimension so that $Q n^(- 3) lt.eq 1$.
    As $s_i = max \( log 2 \, - log c_i \)$, this proves (4.1).
    The additive constant is needed even when $c_i gt.eq 1 \/ 2$.
  ===== 4.2 The overlap bound. <the-overlap-bound.>
  Consider two ordinary half caps with thresholds $tau \, upsilon$ drawn from our list and with axis angle $theta
    in \[ 0 \, pi \]$. Put $t = \( tau + upsilon \) \/ 2$. If $theta < pi$,
    adding their two defining inequalities shows that their intersection lies in the half cap along the angle
    bisector with threshold
  $ q = t \/ cos \( theta \/ 2 \) . $
  The intersection is empty if $theta = pi$ or $q gt.eq 1$, so suppose $q < 1$.
    Let $f \( z \) = log \( 1 - z^2 \)$. Its second derivative is bounded in absolute value on $J$, whence
  $ f \( t \) - 1 / 2 f \( tau \) - 1 / 2 f \( upsilon \) lt.eq C_a \( tau - upsilon \)^2 . $
  Furthermore,
  $ frac(1 - q^2, 1 - t^2) = 1 - frac(t^2, 1 - t^2) tan^2 \( theta \/ 2 \) lt.eq e^(- c'_a theta^2) \, $
  using $t gt.eq t_(*) \/ 2$ and $tan \( theta \/ 2 \) gt.eq theta \/ 2$.
    Apply the upper bound in (4.3) to $F_n \( q \)$ and the lower bound to both terms in the following denominator:
  #[#set math.equation(numbering: n => "(4.6)")
   $ frac(F_n \( q \), sqrt(F_n \( tau \) F_n \( upsilon \))) lt.eq q^(- 1) exp { C_a n \( tau - upsilon \)^2 -
     c'_a n theta^2 } lt.eq C_a e^(- c'_a n theta^2) . $ <eq:caps-bisector>]
  Indeed, $q^(- 1) lt.eq 2 \/ t_(*)$, and $n \( tau - upsilon \)^2 =
    O_(a \, A \, Q) \( \( log n \)^2 \/ n \) arrow.r 0$ by (4.5). This last fact is the benefit of the thin shell.
    The argument does not require $q in J$, so it also applies when the bisector threshold approaches 1.
  For projective angle $phi.alt = angle \( x_i \, x_j \)$, the four pairs of signed half caps have ordinary angles
    $phi.alt$ or $pi - phi.alt gt.eq phi.alt$. Summing (4.6) over these four disjoint sign choices and using
    $c_i = 2 M F_n \( tau_i \)$ gives
  $ mu \( C_i ∩ C_j \) lt.eq C_a sqrt(c_i c_j) thin e^(- c'_a n phi.alt^2) . $
  By (4.1), $c_i \/ macron(c)_i lt.eq max \( 1 \, 2 C_a \)$, so clipping the denominator costs only a constant.
    Independently, the trivial intersection bound gives
  $ frac(mu \( C_i ∩ C_j \), sqrt(macron(c)_i macron(c)_j)) lt.eq C_a e^(- \| s_i - s_j \| \/ 2) . $
  To see this, order the clipped intensities as $macron(c)_i lt.eq macron(c)_j$.
    If $macron(c)_i < 1 \/ 2$, use $mu \( C_i ∩ C_j \) lt.eq c_i = macron(c)_i$;
    otherwise both clipped intensities equal $1 \/ 2$, and use $c_i lt.eq C_a$.
    The minimum of the two bounds is at most their geometric mean. Together with
  $ d \( i \, j \)^2 lt.eq 2 #scale(x: 120%, y: 120%)[\(] n phi.alt^2 + \| s_i -
    s_j \| #scale(x: 120%, y: 120%)[\)] \, $
  this proves (4.1).
  Projective angle satisfies the triangle inequality, as the quotient of spherical distance under antipodal
    identification. The inequality $sqrt(x + y) lt.eq sqrt(x) +
    sqrt(y)$ shows that $sqrt(\| s_i - s_j \|)$ also satisfies it.
    Thus $d$ is a pseudometric; distinct labels, including repeated caps, may have distance zero.
  ===== 4.3 A common intersection. <a-common-intersection.>
  Set $r = r \( S \)$ and $m_S = \| S \|$, and choose an index attaining the minimum defining $r$.
    By the triangle inequality, each axis in $S$ has projective angle at most $2 sqrt(r \/ n)$ from $e_0 =
    e_(i_0)$. Since $F_n$ is strictly decreasing, the raw-minimum anchor has the largest threshold:
    $tau_0 = tau_(i_0) gt.eq tau_i$. Orient each axis so that its ordinary angle $phi.alt_i$ with $e_0$ equals its
    projective angle, and write
  $ e_i = \( cos phi.alt_i \) e_0 + \( sin phi.alt_i \) v_i \, wide Phi = max_(i in S) phi.alt_i lt.eq
    2 sqrt(r \/ n) \, $
  where $v_i$ is a unit tangent vector. For $phi.alt_i = 0$, its choice is immaterial.
  We use the elementary bound
  #[#set math.equation(numbering: n => "(4.7)")
   $ bb(P) \( W dot.op v < - h \) lt.eq e^(- d h^2 \/ 2) $ <eq:caps-tangent>]
  for a uniform $W in S^(d - 1)$, $d gt.eq 2$, any unit $v$, and $h gt.eq 0$. Here is a proof.
    Rotational invariance reduces to $X = W_1$. Integrating the derivative of
    $x^(2 j - 1) \( 1 - x^2 \)^(\( d - 1 \) \/ 2)$ on $\[ - 1 \, 1 \]$ shows that
  $ bb(E) X^(2 j) = frac(2 j - 1, d + 2 j - 2) bb(E) X^(2 j - 2) lt.eq frac(\( 2 j \) !, 2^j j ! d^j) . $
  Odd moments vanish. The exponential series therefore gives $bb(E) e^(z X) lt.eq e^(z^2 \/ \( 2 d \))$;
    applying Markov’s inequality with $z = - d h$ proves (4.7).
  Conditionally on $u dot.op e_0 = t$, a uniform sphere point has the form $u = t e_0 + sqrt(1 - t^2) thin W$,
    with $W$ uniform on the tangent sphere $S^(n - 2)$. Put
  $ h = sqrt(frac(2 log \( 2 m_S \), n - 1)) \, wide delta = 2 Phi^2 + 4 Phi h . $
  By (4.7) and a union bound, with conditional probability at least $1 \/ 2$ one has $W dot.op v_i gt.eq -
    h$ for every $i in S$. For large enough $n$, $cos Phi gt.eq 1 \/ 2$ and $tau_0 + delta in J$, because $r lt.eq
    B_0 log n$ and $m_S lt.eq n^2$. On that tangent event, whenever $t > tau_0 + delta$,
  $ u dot.op e_i gt.eq t cos phi.alt_i - h sin phi.alt_i > tau_0 - Phi^2 \/ 2 + delta \/ 2 - h Phi gt.eq
    tau_0 gt.eq tau_i . $
  Thus all these points lie in every double cap. Integration over the axial coordinate gives
  $ mu (⋂_(i in S) C_i) gt.eq M / 2 F_n \( tau_0 + delta \) = c_(i_0) /
    4 frac(F_n \( tau_0 + delta \), F_n \( tau_0 \)) gt.eq c_(i_0) / 4 e^(- C_a n delta) \, $
  where the last step follows from (4.4) on $J$. Finally,
  $ n delta lt.eq C #scale(x: 120%, y: 120%)[\(] r + sqrt(r log \( 2 m_S \)) #scale(x: 120%, y: 120%)[\)] lt.eq
    C #scale(x: 120%, y: 120%)[\(] r + log \( 2 m_S \) #scale(x: 120%, y: 120%)[\)] . $
  Absorb the fixed factors into $L = L \( a \)$ and use $c_(i_0) gt.eq macron(c)_(i_0)$ to obtain (4.2).
    If $r = 0$, then $Phi = delta = 0$, and the same proof applies. ◻
]

For the parameters of the construction, the overlap vanishes beyond a fixed angle.
  We record this separately because zero overlap gives more than the exponentially small bound in Lemma 4.

#thm([Corollary 4.2.])[
  #emph[With $epsilon = 2^(- 30)$ and $a = 1 + epsilon$, caps satisfying the hypotheses of Lemma 4 are disjoint
    whenever their axes have projective angle greater than $4 sqrt(epsilon)$, for all sufficiently large $n$.]
] <cor:caps-disjoint>

#proof[
  Each half cap has angular radius $arccos tau_i$. Since
  $ cos \( 2 sqrt(epsilon) \) lt.eq 1 - 2 epsilon + 2 / 3 epsilon^2 < 1 - epsilon lt.eq frac(1, 1 + epsilon) \, $
  the estimate $tau_i gt.eq 1 \/ a - C_a \/ n$ shows that its radius is strictly less than $2
    sqrt(epsilon)$ for large $n$. Every pair of signed axes is at ordinary angle at least the projective angle.
    The spherical triangle inequality therefore excludes a point in any pair of half caps at projective separation
    greater than $4 sqrt(epsilon)$. ◻
]

== 5 Grouping cap conditions <sec:blocks>

We next group the cap conditions into blocks and choose a measurable set inside each common intersection.
  A point in this set meets every cap condition in its block.
  We need a lower bound on the product of the chosen measures and control of their mutual overlaps.
  Together these bounds will control the self-overlap of the Poisson witnesses in Section 6.
  The merger construction and the weighted row estimate follow Li–Liu #cite(label("LiLiu2026Lattice"))
  Proposition 9.1 and Lemmas 9.4–9.5. We give the argument for arbitrary indexed lists, retaining repeated members.

#thm([Proposition 5.1.])[
  (Block estimates).  #emph[Fix constants $C_0 gt.eq 1$, $c_0 > 0$, and $L gt.eq 1$.
    There are constants $B_0 \, K \, C gt.eq 1$ and $n_1$, depending only on these three constants,
    with the following property. Let $n gt.eq n_1$, let $\( X \, mu \)$ be an atomless finite measure space,
    and let $\( C_i \)_(i in I)$ be an indexed list of measurable sets with $0 < c_i :=
    mu \( C_i \) < oo$ and $1 lt.eq m := \| I \| lt.eq n^2$. Set
$ macron(c)_i = min \( c_i \, 1 \/ 2 \) \, wide s_i = - log macron(c)_i \, $

 and let $d$ be a pseudometric on $I$. For nonempty $S subset.eq I$, write
$ r \( S \) = min_(j in S) max_(i in S) d \( i \, j \)^2 \, $

 and choose an index $i \( S \) in S$ minimizing the uncapped measure $c_i$. Assume that
#[#set math.equation(numbering: n => "(5.1)")
 $ frac(mu \( C_i ∩ C_j \), sqrt(macron(c)_i macron(c)_j)) lt.eq
   C_0 e^(- c_0 d \( i \, j \)^2) wide \( i \, j in I \) \, $ <eq:block-affinity-input>]

 and that, whenever $r \( S \) lt.eq B_0 log n$,
#[#set math.equation(numbering: n => "(5.2)")
 $ mu (⋂_(i in S) C_i) gt.eq e^(- L \( 1 + r \( S \) + log \| S \| \)) macron(c)_(i \( S \)) . $ <eq:block-lens-input>]

 Then there is a partition $cal(P)$ of $I$ and measurable sets $E_S subset.eq ⋂_(i in S) C_i$, $S in cal(P)$,
   of measures $lambda_S = mu \( E_S \)$ such that
#[#set math.equation(numbering: n => "(5.3)")
 $ n^(- K) macron(c)_(i \( S \)) lt.eq lambda_S lt.eq 1 / 2 . $ <eq:block-anchor-loss>]

 Writing $q_S = - log lambda_S$ and
$ w_(S T) = frac(mu \( E_S ∩ E_T \), sqrt(lambda_S \( 1 + lambda_S \) lambda_T \( 1 + lambda_T \))) \, $

 we have
#[#set math.equation(numbering: n => "(5.4)")
 $ sum_(S in cal(P)) q_S & lt.eq sum_(i in I) s_i + m / 10 \,\
sum_(S in cal(P)) log \( 1 + lambda_S^(- 1) \) & lt.eq C (m + sum_(i in I) s_i) \,\
sum_(S in cal(P)) log (1 + sum_(T in cal(P) \\ { S }) w_(S T)) & lt.eq C (m + sum_(i in I) s_i) . $ <eq:block-log-cost>]

]
] <prop:blocks>

#proof[
  Set $zeta = 1 \/ 10$ and $R_(*) = B_0 log n$; we will choose $B_0$ after the constants governing the row
    estimate. Define
  $ ell \( S \) = cases(delim: "{", 0 \, & \| S \| = 1 \,, L \( 1 + r \( S \) + log \| S \| \) \, & \| S \| gt.eq 2 .) $
  For each final block $S$, we will choose a common subset of intensity $e^(- ell \( S \)) macron(c)_(i \( S \))$.
    Thus $ell \( S \)$ is the logarithmic loss assigned to that block.
    The merger condition below keeps the total loss at most $zeta m$,
    while terminality will control the number of nearby blocks with small loss.
  #emph[Constructing the partition.] Start with the singleton partition.
    Whenever a subfamily of at least two current blocks has union $W$ satisfying
  #[#set math.equation(numbering: n => "(5.5)")
   $ r \( W \) lt.eq R_(*) \, wide ell \( W \) lt.eq zeta \| W \| \, $ <eq:block-merge>]
  replace that entire subfamily by $W$. The subfamily may have any size.
    Each merger decreases the number of blocks, so this procedure terminates after at most $m - 1$ mergers.
    Every resulting block satisfies
  #[#set math.equation(numbering: n => "(5.6)")
   $ r \( S \) lt.eq R_(*) \, wide ell \( S \) lt.eq zeta \| S \| \, $ <eq:block-terminal-properties>]
  and no subfamily of at least two terminal blocks satisfies (5.5).
  The anchor $i \( S \)$ need not attain the minimum defining $r \( S \)$.
    Applying the triangle inequality through an index that does attain it gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ d \( i \, i \( S \) \) lt.eq 2 sqrt(r \( S \)) lt.eq 2 sqrt(ell \( S \) \/ L) wide \( i in S \) .
     $ <eq:block-anchor-radius>]
  For singletons this holds with both sides zero. By (5.2) and atomlessness,
    choose $E_S subset.eq ⋂_(i in S) C_i$ of exactly the measure
  #[#set math.equation(numbering: n => "(5.8)")
   $ lambda_S = e^(- ell \( S \)) macron(c)_(i \( S \)) . $ <eq:block-chosen-intensity>]
  For singletons this choice is possible because $macron(c)_i lt.eq c_i$.
    Thus $q_S = s_(i \( S \)) + ell \( S \) gt.eq log 2$. Different blocks have different anchor labels, and hence
  $ sum_S q_S lt.eq sum_i s_i + sum_S zeta \| S \| = sum_i s_i + zeta m . $
  This proves (5.4). For $n gt.eq 3$, (5.6) and $m lt.eq n^2$ give
  $ ell \( S \) lt.eq L \( 1 + R_(*) + log m \) lt.eq L \( B_0 + 3 \) log n . $
  Consequently (5.3) holds with $K = L \( B_0 + 3 \)$. Also
  $ log \( 1 + lambda_S^(- 1) \) = q_S + log \( 1 + e^(- q_S) \) lt.eq q_S + log \( 3 \/ 2 \) lt.eq
    (1 + frac(log \( 3 \/ 2 \), log 2)) q_S \, $
  which proves (5.4). It remains to control the overlap rows.
  #emph[What terminality implies.] We claim that a constant $C_(upright("ct")) =
    C_(upright("ct")) \( L \, zeta \)$ bounds the number of blocks satisfying
  #[#set math.equation(numbering: n => "(5.9)")
   $ d \( z \, i \( S \) \)^2 lt.eq t \, wide ell \( S \) lt.eq u $ <eq:block-count-conditions>]
  by $C_(upright("ct")) \( 1 + t + u \)$, provided that $z in I$, $t \, u gt.eq 0$, and
  #[#set math.equation(numbering: n => "(5.10)")
   $ 8 t + 8 u \/ L lt.eq R_(*) . $ <eq:block-count-radius>]
  This is a count of blocks, including blocks with coinciding anchors in pseudometric distance.
  Let $h$ be the number of such blocks and let $W$ be their union, of size $N$.
    If $h lt.eq 1$ there is nothing to prove. Otherwise choose one of their anchors, say $i \( S_0 \)$.
    For every $i in S subset.eq W$, (5.7) gives
  $ d \( i \( S_0 \) \, i \) lt.eq d \( i \( S_0 \) \, z \) + d \( z \, i \( S \) \) +
    d \( i \( S \) \, i \) lt.eq 2 sqrt(t) + 2 sqrt(u \/ L) . $
  As $i \( S_0 \) in W$, it follows that
  $ r \( W \) lt.eq 8 t + 8 u \/ L = : D_(*) lt.eq R_(*) . $
  Choose a fixed integer $N_0 gt.eq 2$ so large that $L log N lt.eq zeta N \/ 2$ for all $N gt.eq N_0$. If
  $ h gt.eq N_0 quad upright("and") quad h gt.eq frac(2 L, zeta) \( 1 + D_(*) \) \, $
  then $N gt.eq h$ implies
  $ ell \( W \) lt.eq L \( 1 + D_(*) + log N \) lt.eq zeta N . $
  The whole subfamily could then be merged, contradicting terminality.
    Since $1 + D_(*) lt.eq 8 \( 1 + t + u \)$, the claim follows, for example with $C_(upright("ct")) = 1 + N_0 +
    16 L \/ zeta$. Here the logarithm being absorbed is $log N$,
    the logarithm of the number of original labels in the union; the block sizes need not be comparable.
  #emph[Estimating a row.] The elementary intersection bound and (5.1) give, respectively,
  #[#set math.equation(numbering: n => "(5.11)")
   $ w_(S T) & lt.eq e^(- \| q_S - q_T \| \/ 2) lt.eq 1 \,\
w_(S T) & lt.eq C_0 exp {frac(ell \( S \) + ell \( T \), 2) -
  c_0 d \( i \( S \) \, i \( T \) \)^2} . $ <eq:block-weight-trivial>]
  For the first inequality, use $mu \( E_S ∩ E_T \) lt.eq min \( lambda_S \, lambda_T \)$ and discard the factors
    $1 + lambda_S \, 1 + lambda_T$ in the denominator. For the second, use $E_S subset.eq C_(i \( S \))$ and (5.8).
  Fix $S$. For $k gt.eq 0$, put in the $k$th bin those $T eq.not S$ for which $e^(- \( k + 1 \)) < w_(S T) lt.eq
    e^(- k)$; zero weights can be omitted. Writing $Q = q_S + k + 1 gt.eq 1$, the two bounds above imply
  #[#set math.equation(numbering: n => "(5.12)")
   $ ell \( T \) lt.eq q_T < q_S + 2 \( k + 1 \) lt.eq 2 Q \, wide d \( i \( S \) \, i \( T \) \)^2 lt.eq A_1 Q \,
     $ <eq:block-bin-parameters>]
  where $A_1 = \( log C_0 + 2 \) \/ c_0$. Indeed, taking logarithms in (5.11) gives
  $ c_0 d \( i \( S \) \, i \( T \) \)^2 < log C_0 + frac(q_S + q_T, 2) + k + 1 lt.eq log C_0 + q_S +
    2 \( k + 1 \) lt.eq \( log C_0 + 2 \) Q . $
  Now set
  $ A_2 = max { 1 \, 8 A_1 + 16 \/ L } \, wide delta = A_2^(- 1) . $
  If $Q lt.eq delta R_(*)$, apply the terminality count with $z = i \( S \)$, $t = A_1 Q$, and $u = 2 Q$.
    The number of blocks in the $k$th bin is at most
  #[#set math.equation(numbering: n => "(5.13)")
   $ C_(upright("ct")) \( 1 + A_1 Q + 2 Q \) lt.eq C_1 \( q_S + k + 1 \) \, $ <eq:block-bin-count>]
  where $C_1 = C_(upright("ct")) \( A_1 + 3 \)$. These constants are independent of $B_0$.
    Choose $B_0 gt.eq max { 1 \, 6 \/ delta }$, and increase $n_1$ so that $R_(*) gt.eq 4 \/ delta$ for $n gt.eq n_1$.
  First suppose $q_S lt.eq delta R_(*) \/ 4$, and put $J = floor.l delta R_(*) \/ 2 floor.r$.
    For $0 lt.eq k lt.eq J$ we have $q_S + k + 1 lt.eq delta R_(*)$, so (5.13) bounds the total weight in these bins by
  $ C_1 sum_(k = 0)^J e^(- k) \( q_S + k + 1 \) lt.eq C_2 \( 1 + q_S \) . $
  Every remaining weight is at most $e^(- \( J + 1 \)) lt.eq e^(- delta R_(*) \/ 2)$,
    and there are at most $n^2$ of them. Their sum is therefore at most
  $ n^2 e^(- delta R_(*) \/ 2) = n^(2 - delta B_0 \/ 2) lt.eq 1 . $
  Since $q_S gt.eq log 2$, this proves
  #[#set math.equation(numbering: n => "(5.14)")
   $ log (1 + sum_(T eq.not S) w_(S T)) lt.eq C_3 q_S $ <eq:block-row-cost>]
  in the present case. If $q_S > delta R_(*) \/ 4$, the simpler bound (5.11) gives
  $ log (1 + sum_(T eq.not S) w_(S T)) lt.eq log \( 1 + n^2 \) lt.eq 3 log n < frac(12, delta B_0) q_S . $
  Thus (5.14) holds for every block after enlarging $C_3$. Summing it and applying (5.4) proves (5.4). ◻
]

Lemma 4 supplies the two hypotheses of Proposition 6 for the residual caps in the thin shell.
  Its constants $C_0 \, c_0 \, L$ are independent of the fixed radius multiplier $B_0$,
  so one first chooses these constants, then the value of $B_0$ specified in the proof,
  and finally the dimension threshold required by Lemma 4. All constructions use the indexed list alone.
  In particular, equal caps remain separate labels, and for any fixed list the partition and the measurable
  subsets may be chosen before the Poisson process is sampled.

== 6 Poisson witnesses and their lower tail <sec:poisson>

The blocks constructed in Proposition 6 give measurable sets of slab normals, one set for each block of residuals.
  Choosing a distinct Poisson point from each set certifies that all the residuals are cut.
  We now estimate the probability that none of a finite collection of targets has such a certificate.
  The lower-tail inequality originates in the work of Janson #cite(label("Janson1990LargeDeviations")).
  The continuous version and diagram method below follow Li–Liu #cite(label("LiLiu2026Lattice")) Lemma 6.4,
  Equation (6.16), and Lemma 9.6. We include the finite inequality, its passage to measurable slots,
  and the matching estimates to specify all multiplicities and diagonal terms.

=== 6.1 The finite inequality <the-finite-inequality>

The events in the finite approximation are indexed by ordered choices of cells.
  Different choices can use the same set of cells, so repeated underlying subsets must remain separate indices.

#thm([Lemma 6.1.])[
  (Finite indexed Janson inequality).  #emph[Let $\( X_v \)_(v in V)$ be independent Bernoulli variables on a
    finite set $V$, and let $\( H_i \)_(i = 1)^N$ be an indexed family of nonempty subsets of $V$,
    with repetitions allowed. Set
$ I_i = product_(v in H_i) X_v \, wide Y = sum_(i = 1)^N I_i \, wide m = bb(E) Y \, wide Delta^(*) =
  sum_(1 lt.eq i \, j lt.eq N\
H_i ∩ H_j eq.not diameter) bb(E) \( I_i I_j \) . $

 If $m > 0$, then $Delta^(*) gt.eq m$ and
#[#set math.equation(numbering: n => "(6.1)")
 $ bb(P) \( Y = 0 \) lt.eq exp (- frac(m^2, 2 Delta^(*))) . $ <eq:finite-janson>]

 The dependency sum is ordered and includes the diagonal.]
] <lem:finite-janson>

#proof[
  We first recall Harris’s correlation inequality for product Bernoulli
    measures #cite(label("Harris1960Correlation")), together with its elementary proof.
    Increasing functions of independent Bernoulli variables have nonnegative covariance.
    Indeed, induction on the number of variables and conditioning on the last variable reduce the additional
    covariance term to $p \( 1 - p \) \( f_1 - f_0 \) \( g_1 - g_0 \) gt.eq 0$, where $f_b \,
    g_b$ are the corresponding conditional means. Thus an increasing event $B$ and a decreasing event $F$ satisfy
  #[#set math.equation(numbering: n => "(6.2)")
   $ bb(P) \( B divides F \) lt.eq bb(P) \( B \) quad upright("whenever ") bb(P) \( F \) > 0 . $ <eq:harris-opposite>]
  Write $B_i = { I_i = 1 }$, $p_i = bb(P) \( B_i \)$, and $p_(i j) = bb(P) \( B_i ∩ B_j \)$.
    For each $i$, let $F_i$ be the event that none of the earlier $B_j$ with $H_i ∩ H_j = diameter$ occurs,
    and let $G_i$ exclude the remaining earlier events. If some earlier avoidance event has probability zero,
    the conclusion is immediate. Otherwise all the conditional probabilities below are defined.
    Since $F_i$ uses only coordinates outside $H_i$, it is independent of $B_i$. It is also decreasing.
    A conditional union bound and (6.2) therefore give
  $ bb(P) \( B_i divides F_i ∩ G_i \) & gt.eq bb(P) \( B_i ∩ G_i divides F_i \)\
 & gt.eq p_i - sum_(j < i\
H_i ∩ H_j eq.not diameter) p_(i j) . $
  The first inequality uses $bb(P) \( G_i divides F_i \) lt.eq 1$.
    Multiplying the successive avoidance probabilities and using $1 - x lt.eq e^(- x)$ yields
  #[#set math.equation(numbering: n => "(6.3)")
   $ bb(P) \( Y = 0 \) lt.eq exp \( - m + Delta_(upright("off")) \/ 2 \) \, wide Delta_(upright("off")) =
     sum_(i eq.not j\
H_i ∩ H_j eq.not diameter) p_(i j) . $ <eq:janson-first>]
  This remains valid when an intermediate lower bound above is negative.
  Attach to each index $i$ a private independent Bernoulli variable of parameter $q$,
    and require it as part of $B_i$. The new mean is $q m$, and its ordered off-diagonal sum is $q^2
    Delta_(upright("off"))$. The original zero event implies the new zero event,
    so (6.3) bounds its probability by $exp \( - q m + q^2 Delta_(upright("off")) \/ 2 \)$.
    Since $Delta^(*) = m + Delta_(upright("off"))$, choosing $q = m \/ Delta^(*) in \( 0 \, 1 \]$ proves (6.1).
    The proof retains every index even when two supports coincide. ◻
]

Janson–Warnke #cite(label("JansonWarnke2016LowerTail")) Equation (2) record a stronger constant in this indexed
  formulation. The constant in Lemma 7 suffices here.

=== 6.2 Measurable slots and matching diagrams <measurable-slots-and-matching-diagrams>

Let $\( Omega \, mu \)$ be a finite nonatomic standard Borel measure space,
  and let $Pi$ be a Poisson process of intensity $mu$. Consider a finite nonempty family of witness types indexed
  by $alpha in cal(A)$. In the covering application, a type is a target point and its slots are blocks of
  residuals. For each $alpha$, let $I_alpha$ be a finite nonempty set of labeled slots,
  with measurable sets $E_(alpha i) subset.eq Omega$ satisfying $lambda_(alpha i) := mu \( E_(alpha i) \) > 0$.
  Define its #emph[activity] by

$ nu_alpha = product_(i in I_alpha) lambda_(alpha i) \, $

and let $Z_alpha$ count injective assignments of Poisson points to the slots,
  with the point assigned to $i$ lying in $E_(alpha i)$. These are ordered counts:
  equal slot sets do not identify their labels.

A #emph[partial matching] between $I_alpha$ and $I_beta$ is a set of pairs $\( i \, j \)$ with no repeated first
  or second coordinate. Put

#[#set math.equation(numbering: n => "(6.4)")
 $ D_(alpha beta) = nu_alpha nu_beta sum_(M upright(" a partial matching")\
M eq.not diameter) product_(\( i \, j \) in M)
  frac(mu \( E_(alpha i) ∩ E_(beta j) \), lambda_(alpha i) lambda_(beta j)) . $ <eq:diagram-definition>]

The Poisson factorial-moment formula gives

$ bb(E) Z_alpha = nu_alpha \, wide bb(E) \[ Z_alpha Z_beta \] = nu_alpha nu_beta + D_(alpha beta) . $

For the second identity, group pairs of injective assignments by the partial matching of slots occupied by the
  same point. The empty matching contributes $nu_alpha nu_beta$;
  the nonempty matchings give exactly the terms in (6.4). Thus $D_(alpha beta)$ is the covariance of $Z_alpha$ and
  $Z_beta$.

#thm([Proposition 6.2.])[
  (Poisson lower tail).  #emph[Let $Pi$ be a Poisson process on a finite nonatomic standard Borel measure space.
    For each member of a finite nonempty family, take a finite nonempty labeled list of measurable slots of
    positive intensity. Let $Z_alpha$ count their injective assignments,
    let $nu_alpha$ be the product of their intensities, and define $D_(alpha beta)$ by (6.4).
    Then $bb(E) Z_alpha = nu_alpha$, and
#[#set math.equation(numbering: n => "(6.5)")
 $ bb(P) \( Z_alpha = 0 upright(" for all ") alpha in cal(A) \) lt.eq
   exp [- frac(\( sum_alpha nu_alpha \)^2, 2 sum_(alpha \, beta) D_(alpha beta))] . $ <eq:poisson-janson>]

 The denominator is positive: the full identity matching in $D_(alpha alpha)$ contributes $nu_alpha$.]
] <prop:poisson>

#proof[
  Write $tau = mu \( Omega \) > 0$. Conditional on $N = Pi \( Omega \)$,
    the points are independent with law $mu \/ tau$ and are almost surely distinct.
    If $k = \| I_alpha \|$, the Poisson factorial moment $bb(E) \( N \)_k = tau^k$ gives
  $ bb(E) Z_alpha = bb(E) \( N \)_k thin tau^(- k) product_i lambda_(alpha i) = nu_alpha . $
  In particular, no factorial divides the activity, even for repeated slot sets.
  We apply Lemma 7 to cell-occupation indicators. Fix $delta > 0$.
    Form the Boolean atoms generated by all the slot sets and subdivide each positive-measure atom into finitely
    many measurable cells of measure at most $delta$, using nonatomicity.
    After omitting null cells, this gives a finite partition $cal(P)_delta$ that respects every slot.
    Modifications on the common null set do not affect the Poisson process. For $C in cal(P)_delta$, set
  $ a_C = mu \( C \) \, wide X_C = upright(bold(1))_({ Pi \( C \) > 0 }) \, wide p_C = bb(E) X_C = 1 - e^(- a_C) . $
  These variables are independent and
  #[#set math.equation(numbering: n => "(6.6)")
   $ 0 lt.eq a_C - p_C lt.eq 1 / 2 a_C^2 lt.eq delta / 2 a_C . $ <eq:cell-occupation-error>]
  For each $alpha$, retain every injective assignment of cells $f : I_alpha arrow.r
    cal(P)_delta$ with $f \( i \) subset.eq E_(alpha i)$. Its indicator is $product_i X_(f \( i \))$.
    Let $Y_delta$ be the sum over these indexed assignments. Different assignments remain different indices even
    when their underlying cell sets agree.
  The following estimate controls all cell collisions. For a fixed list $F_1 \, dots.h \, F_r$ of unions of cells,
    let $Q_delta \( F_1 \, dots.h \, F_r \)$ be the sum of $product_(v = 1)^r p_(C_v)$ over distinct cells $C_v
    subset.eq F_v$. Then
  #[#set math.equation(numbering: n => "(6.7)")
   $ 0 lt.eq product_v mu \( F_v \) - Q_delta \( F_1 \, dots.h \, F_r \) lt.eq
     delta #scale(x: 240%, y: 240%)[\[] & r / 2 product_v mu \( F_v \)\
 & + sum_(v < w) mu \( F_v ∩ F_w \) product_(u eq.not v \, w) mu \( F_u \) #scale(x: 240%, y: 240%)[\]] .
   $ <eq:cell-collision-error>]
  Indeed, the unconstrained sum factors over the slots, and (6.6), followed by telescoping the product,
    bounds its difference from $product_v mu \( F_v \)$ by the first term.
    The weight of assignments with $C_v = C_w$ is at most
  $ sum_(C subset.eq F_v ∩ F_w) p_C^2 product_(u eq.not v \, w) mu \( F_u \) lt.eq
    delta mu \( F_v ∩ F_w \) product_(u eq.not v \, w) mu \( F_u \) . $
  A union bound proves (6.7). Empty products are 1, and the estimate also holds if a set has measure zero.
    Applying it to each slot list gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ m_delta := bb(E) Y_delta arrow.r sum_alpha nu_alpha . $ <eq:cell-mean-limit>]
  It remains to identify the finite dependency sum and the limiting event.
    For two internally injective assignments $f$ and $g$, the complete set of equalities $f \( i \) =
    g \( j \)$ is a unique partial matching $M$. Their Bernoulli supports intersect precisely when $M eq.not
    diameter$. For fixed $alpha \, beta \, M$, identify the slots paired by $M$ and leave the other slots as
    singletons. Assign to each resulting class its slot set, or the intersection of its two slot sets.
    Denote these sets by $\( F_v \)_v$. Requiring distinct cells for these classes excludes exactly the unintended
    equalities. Thus the contribution with exact matching $M$ is $Q_delta \( \( F_v \)_v \)$, and its limit is
  $ product_v mu \( F_v \) = nu_alpha nu_beta product_(\( i \, j \) in M)
    frac(mu \( E_(alpha i) ∩ E_(beta j) \), lambda_(alpha i) lambda_(beta j)) . $
  All sums are finite. Estimate (6.7) therefore shows that the ordered dependency sum,
    including identical assignment pairs, satisfies
  #[#set math.equation(numbering: n => "(6.9)")
   $ Delta_delta^(*) arrow.r sum_(alpha \, beta) D_(alpha beta) . $ <eq:cell-diagram-limit>]
  Identical assignments give the full identity matching; other full matchings caused by repeated slots remain
    separate terms.
  Finally, couple the cell variables with the original process.
    The probability that any cell contains two or more points is at most
  $ 1 / 2 sum_C bb(E) \[ Pi \( C \) \( Pi \( C \) - 1 \) \] = 1 / 2 sum_C a_C^2 lt.eq frac(delta tau, 2) . $
  Outside this event, point injections and occupied-cell injections are in bijection,
    simultaneously for every witness type. Hence
  $ lr(|bb(P) \( Y_delta = 0 \) - bb(P) \( Z_alpha = 0 upright(" for all ") alpha \)|) lt.eq frac(delta tau, 2) . $
  Apply Lemma 7 and let $delta arrow.b 0$, using (6.8) and (6.9).
    The identity-matching contribution makes the limiting denominator positive. This proves (6.5). ◻
]

The approximation is performed for each fixed finite family.
  Its size and the total intensity may grow with dimension;
  no uniform estimate in those quantities is needed before taking the cell limit.
  An empty slot list has one empty injection and is treated as a deterministic certificate before applying
  Proposition 8.

=== 6.3 Self and cross diagrams <self-and-cross-diagrams>

The two budgets in Proposition 6 now control the self-diagram sum.
  The factor $1 + lambda_i^(- 1)$ pays for identifying the same slot in both copies of a witness.

#thm([Lemma 6.3.])[
  (Matching bounds).  #emph[For positive-measure slot lists and the diagrams in (6.4), the following bounds hold.
    For one witness type, suppress its label and set
$ delta_i = 1 + lambda_i^(- 1) \, wide w_(i j) =
  frac(mu \( E_i ∩ E_j \), sqrt(lambda_i \( 1 + lambda_i \) lambda_j \( 1 + lambda_j \))) quad \( i eq.not j \) . $

 Then
#[#set math.equation(numbering: n => "(6.10)")
 $ 1 + D_(alpha alpha) / nu_alpha^2 lt.eq product_i delta_i product_i (1 + sum_(j eq.not i) w_(i j)) .
   $ <eq:self-diagram-product>]

 For two witness types, put
$ rho_(alpha beta) =
  sum_(i in I_alpha \, j in I_beta) frac(mu \( E_(alpha i) ∩ E_(beta j) \), lambda_(alpha i) lambda_(beta j)) . $

 Then
#[#set math.equation(numbering: n => "(6.11)")
 $ D_(alpha beta) lt.eq nu_alpha nu_beta \( e^(rho_(alpha beta)) - 1 \) . $ <eq:cross-diagram-product>]

 In particular, if every cross-slot intersection has measure zero, then $D_(alpha beta) = 0$.]
] <lem:diagrams>

#proof[
  Write $h_(i j) = mu \( E_i ∩ E_j \) \/ \( lambda_i lambda_j \)$.
    For the self sum, fix the off-diagonal edges $P$ of a partial matching between two copies of the slot list.
    Regard $P$ as a directed graph on the common label set. Every vertex has total degree $d_P \( i \) in { 0 \,
    1 \, 2 }$, since its in-degree and out-degree are at most one.
    A diagonal loop is available exactly at the vertices of degree zero.
    Since $h_(i i) = lambda_i^(- 1)$, summing the compatible loop choices gives
  $ (product_i delta_i) (product_(\( i \, j \) in P) h_(i j)) (product_(i : d_P \( i \) > 0) delta_i^(- 1)) lt.eq
    (product_i delta_i) product_(\( i \, j \) in P) w_(i j) . $
  Here $delta_i^(- 1) lt.eq delta_i^(- d_P \( i \) \/ 2)$ at each incident vertex.
    This includes directed paths and cycles; Figure 2 illustrates the permitted incidences.
    Summing over $P$ and dropping the requirement of distinct right endpoints bounds the remaining sum by
    $product_i \( 1 + sum_(j eq.not i) w_(i j) \)$. The empty matching contributes 1, proving (6.10).
  For two lists, drop all matching restrictions and sum over nonempty subsets of cross edges.
    With the analogous nonnegative weights $h_(i j)$, the result is at most $product_(i \, j) \( 1 + h_(i j) \) -
    1 lt.eq e^(sum_(i \, j) h_(i j)) - 1$. This proves (6.11). ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.2828, -0.2828), (0.2828, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$1$]]], frame: "circle", stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10))
  content((1.717, -0.2828), (2.283, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$2$]]], frame: "circle", stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10))
  content((3.717, -0.2828), (4.283, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$3$]]], frame: "circle", stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10))
  line((0.4106, 0), (1.589, 0), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, width: 0.15cm, fill: rgb("#000073"))))
  line((2.411, 0), (3.589, 0), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, width: 0.15cm, fill: rgb("#000073"))))
  content((2, 1.35), [#text(fill: rgb("#333333"))[#text(size: 9pt)[directed path]]])
  content((0, -0.8), [#text(fill: rgb("#333333"))[#text(size: 9pt)[$d_P(1)=1$]]])
  content((2, -0.8), [#text(fill: rgb("#333333"))[#text(size: 9pt)[$d_P(2)=2$]]])
  content((4, -0.8), [#text(fill: rgb("#333333"))[#text(size: 9pt)[$d_P(3)=1$]]])
  content((6.217, -0.2828), (6.783, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$4$]]], frame: "circle", stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10))
  content((8.217, -0.2828), (8.783, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$5$]]], frame: "circle", stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10))
  bezier((6.5, 0), (8.5, 0), (7.195, 0.3541), (7.805, 0.3541), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, width: 0.15cm, fill: rgb("#000073"))))
  bezier((8.5, 0), (6.5, 0), (7.805, -0.3541), (7.195, -0.3541), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, width: 0.15cm, fill: rgb("#000073"))))
  content((7.5, 1.35), [#text(fill: rgb("#333333"))[#text(size: 9pt)[directed $2$-cycle]]])
  content((6.5, -0.8), [#text(fill: rgb("#333333"))[#text(size: 9pt)[$d_P(4)=2$]]])
  content((8.5, -0.8), [#text(fill: rgb("#333333"))[#text(size: 9pt)[$d_P(5)=2$]]])
  content((11.22, -0.2828), (11.78, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$6$]]], frame: "circle", stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10))
  bezier((11.21, 0.2903), (11.79, 0.2903), (10.41, 1.091), (12.59, 1.091), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.22cm, width: 0.15cm, fill: rgb("#000073"))))
  content((11.5, 1.35), [#text(fill: rgb("#333333"))[#text(size: 9pt)[optional diagonal match]]])
  content((11.5, -0.8), [#text(fill: rgb("#333333"))[#text(size: 9pt)[$d_P(6)=0$]]])
})],
  caption: [Figure 2: A self-matching after identifying the two copies of the slot labels. The solid edges form the off-diagonal matching $P = { \( 1 \, 2 \) \, \( 2 \, 3 \) \, \( 4 \, 5 \) \, \( 5 \, 4 \) }$; each label has at most one incoming and one outgoing edge. The degree $d_P \( i \)$ counts both. A diagonal match is available only at an isolated label, as illustrated by the optional dashed loop at $6$; even the degree-one path endpoints cannot receive a diagonal match. ],
) <fig:self-matching>

=== 6.4 Application to residual caps <application-to-residual-caps>

We return to the fixed parameters and the spherical intensity $mu$ of Section 2.
  The following consequence collects the inputs needed for the target selection in the next section.

#thm([Corollary 6.4.])[
  (Witnesses for residual lists).  #emph[Fix $A_0 > 0$. There are constants $A \, C_(*) \, H > 0$ such that,
    for all sufficiently large $n$, the following holds. Let $R gt.eq 1$,
    and let $\( x_(alpha i) \)_(i = 1)^(m_alpha)$, $alpha in cal(A)$,
    be any finite nonempty family of deterministic lists satisfying
$ 1 lt.eq m_alpha lt.eq n^2 \, wide r_(-) - 3 eta lt.eq \| x_(alpha i) \| lt.eq b + 3 eta . $

 Define
$ C_(alpha i) = { u in S^(n - 1) : \| u dot.op x_(alpha i) \| > 1 + 3 eta } \, wide s_(alpha i) = -
  log min { mu \( C_(alpha i) \) \, 1 \/ 2 } \, $

 and suppose $m_alpha + sum_i s_(alpha i) lt.eq A_0 R$. For each list there is a nonempty block partition and
   measurable slots $E_(alpha S) subset.eq ⋂_(i in S) C_(alpha i)$, chosen independently of $Pi$,
   with positive intensities at most $1 \/ 2$. Their activities and diagrams satisfy
#[#set math.equation(numbering: n => "(6.12)")
 $ e^(- A R) lt.eq nu_alpha lt.eq 1 \, wide D_(alpha alpha) lt.eq nu_alpha^2 e^(C_(*) R) . $ <eq:witness-self>]

 For distinct $alpha \, beta$, if all cross-residual angles exceed $H sqrt(log n \/ n)$, then
#[#set math.equation(numbering: n => "(6.13)")
 $ D_(alpha beta) lt.eq n^(- 3) nu_alpha nu_beta . $ <eq:witness-cross>]

 If all those angles exceed $4 sqrt(epsilon)$, then $D_(alpha beta) = 0$.
   A positive injection count for a list implies that every cap in that list is hit by $Pi$.]
] <cor:witnesses>

#proof[
  Apply Lemma 4 with shell parameter $10$ and perturbation bound $3$.
    Its affinity and common-intersection estimates supply the hypotheses of Proposition 6;
    the common-intersection constant is available before the radius multiplier in that proposition is fixed.
    Apply the proposition separately to each list, making all choices before sampling $Pi$. The budget (5.4) gives
  $ - log nu_alpha lt.eq sum_S log \( 1 + lambda_(alpha S)^(- 1) \) lt.eq A R . $
  Together with (5.4) and (6.10), it also gives the self bound in (6.12), after choosing $C_(*)$.
  To check the cross estimate, write $macron(c)_(alpha i) = min { mu \( C_(alpha i) \) \,
    1 \/ 2 }$ and let $i \( S \)$ be the anchor of a block. Lemma 4 and Proposition 6 provide fixed exponents
    $P_0 \, P_1 > 0$ such that
  $ macron(c)_(alpha i) gt.eq n^(- P_0) \, wide lambda_(alpha S) gt.eq n^(- P_1) macron(c)_(alpha \, i \( S \)) \,
    wide E_(alpha S) subset.eq C_(alpha \, i \( S \)) . $
  Apply the affinity estimate to each two-element list of anchor residuals;
    this does not require the union of the two full lists to have at most $n^2$ entries. It gives
  $ frac(mu \( E_(alpha S) ∩ E_(beta T) \), lambda_(alpha S) lambda_(beta T)) lt.eq
    C n^(2 P_1 + P_0) e^(- c n angle \( x_(alpha \, i \( S \)) \, x_(beta \, i \( T \)) \)^2) . $
  There are at most $n^4$ block pairs. Choose $H$ after these constants, so that $c H^2 > 9 + 2 P_1 + P_0$.
    For sufficiently large $n$, the angular hypothesis gives $rho_(alpha beta) lt.eq n^(- 4)$.
    Equation (6.11) now gives $D_(alpha beta) lt.eq 2 n^(- 4) nu_alpha nu_beta$, which implies (6.13).
    At cross angles greater than $4 sqrt(epsilon)$, Corollary 5 makes every cross-slot intersection empty,
    and the diagram is zero.
  Finally, the point assigned to a block lies in every cap belonging to that block.
    A positive injection count thus hits every residual cap. ◻
]

For a finite center list $\( p_i \)$ and a target $y$, take all residuals $x_i = y - p_i$ with $\| x_i \| lt.eq
  b + 3 eta$. If this list satisfies the hypotheses of Corollary 10,
  a positive witness excludes each such residual from $K^(+)$ by a strict slab inequality.
  All remaining residuals are excluded by its outer ball. Consequently

#[#set math.equation(numbering: n => "(6.14)")
 $ Z_y > 0 quad arrow.r.double quad y in.not union.big_i \( p_i + K^(+) \) . $ <eq:witness-hole>]

If the relevant list is empty, the target is already a hole.
  Proposition 8 supplies an exponential bound on the probability that every chosen target lacks a witness.
  A second-moment bound alone would not give the decay required for the finite-pattern union in the final argument.

== 7 Many targets for each finite pattern <sec:targets>

We now fix one of the rounded center lists supplied by Proposition 3.
  Our goal is to bound the probability that this list covers the window $B_D$ by translates of $K^(+)$.
  The good subset of the window contains many points whose residual vectors are separated at a small angular
  scale. Only a small fraction of pairs need fail a larger, fixed separation.
  The former property controls every cross diagram; the latter makes most cross diagrams vanish.

=== 7.1 A deterministic choice of targets <a-deterministic-choice-of-targets>

The following volume estimate controls projective angles, including both possible orientations of a residual vector.

#thm([Lemma 7.1.])[
  (Cylinder estimate).  #emph[Let $n gt.eq 2$, let $D \, L > 0$,
    and let $G subset B_D$ be measurable with $\| G \| gt.eq omega_n D^n \/ 4$.
    Let $Y \, Z$ be independent uniform points of $G$, and let $p \, q in bb(R)^n$. For $0 < xi < pi \/ 2$,
#[#set math.equation(numbering: n => "(7.1)")
 $ & bb(P) #scale(x: 120%, y: 120%)[\(] 0 < \| Y - p \| lt.eq L \, med 0 < \| Z - q \| lt.eq L \, med
   angle \( Y - p \, Z - q \) lt.eq xi #scale(x: 120%, y: 120%)[\)]\
 & #h(30mm)  lt.eq 8 omega_(n - 1) / omega_n (frac(L sin xi, D))^(n - 1) lt.eq
   8 sqrt(n) (frac(L sin xi, D))^(n - 1) . $ <eq:cylinder>]

]
] <lem:cylinder>

#proof[
  Condition on $Y = y$ with $0 < \| y - p \| lt.eq L$, and write $u = \( y - p \) \/ \| y - p \|$.
    If the event in the statement occurs, the component of $Z -
    q$ perpendicular to $u$ has length at most $L sin xi$. Both orientations allowed by the projective angle
    therefore lie in the same cylinder around the affine line $q + bb(R) u$.
    The projection of $B_D$ onto the direction $u$ has length $2 D$.
    Every perpendicular slice of the cylinder has $\( n - 1 \)$-dimensional volume at most
    $omega_(n - 1) \( L sin xi \)^(n - 1)$. Thus the allowed points $Z$ have volume at most $2 D
    omega_(n - 1) \( L sin xi \)^(n - 1)$. Divide by $\| G \|$ and then average over $Y$.
  To obtain the last inequality, use the slicing identity
  $ omega_n / omega_(n - 1) = integral_(- 1)^1 \( 1 - t^2 \)^(\( n - 1 \) \/ 2) thin d t gt.eq
    frac(2 exp \( - 1 \/ 2 \), sqrt(n)) . $
  Indeed, restrict the integral to $\| t \| lt.eq n^(- 1 \/ 2)$ and use $log \( 1 - 1 \/ n \) gt.eq -
    1 \/ \( n - 1 \)$. In particular, $omega_(n - 1) \/ omega_n lt.eq sqrt(n)$. ◻
]

For a finite center list $P = \( p_1 \, dots.h \, p_N \)$ and a point $y$ different from its entries, write

$ cal(R)_P \( y \) = \( y - p_i : med \| y - p_i \| lt.eq b + 3 eta \) $

for its labeled list of relevant residuals. For $xi > 0$,
  call a pair $\( y \, z \)$ #emph[$xi$-bad] if some residual in $cal(R)_P \( y \)$ and some residual in
  $cal(R)_P \( z \)$ have projective angle at most $xi$. This definition is symmetric in $y \,
  z$ and retains repeated center labels. Recall $gamma$ from (2.3), and put

#[#set math.equation(numbering: n => "(7.2)")
 $ M_n = ⌊exp (frac(n log n, 16))⌋ . $ <eq:target-count>]

#thm([Lemma 7.2.])[
  (Separated targets).  #emph[Fix $H > 0$ and $k_0 > 0$. For all sufficiently large $n$,
    let $P = \( p_1 \, dots.h \, p_N \)$ be a deterministic list satisfying
$ N lt.eq n^(k_0) exp \( lambda_0 n \) \, $

 and let $G subset B_D \\ { p_1 \, dots.h \, p_N }$ be measurable with $\| G \| gt.eq omega_n D^n \/ 4$.
   There are $M_n$ distinct points $y_1 \, dots.h \, y_(M_n) in G$ such that:]
  + #emph[no pair with distinct indices is $H sqrt(log n \/ n)$-bad;]
  + #emph[at most a fraction $10 f_n$ of the unordered pairs with distinct indices is $4 sqrt(epsilon)$-bad, where
#[#set math.equation(numbering: n => "(7.3)")
 $ f_n = 8 sqrt(n) thin n^(2 k_0) exp \( 2 lambda_0 n \) (frac(8 sqrt(epsilon), D))^(n - 1) =
   exp #scale(x: 120%, y: 120%)[\(] - gamma n + O \( log n \) #scale(x: 120%, y: 120%)[\)] . $ <eq:bad-pair-rate>]

]
  #emph[The constants and the dimension threshold are uniform in $P$ and $G$.
    The selected points can be fixed using only $P$ and $G$.]
] <lem:targets>

#proof[
  Sample $M_n$ points independently and uniformly from $G$.
    For independent sampled points $Y \, Z$, take the union in Lemma 11 over all $N^2$ ordered pairs of center
    labels. Since $b + 3 eta lt.eq 2$ for sufficiently large $n$, this gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] \( Y \, Z \) upright(" is ") xi upright("-bad")
     #scale(x: 120%, y: 120%)[\)] lt.eq 8 sqrt(n) thin N^2 (frac(2 sin xi, D))^(n - 1) . $ <eq:target-pair>]
  All relevant labels are included even though the relevant lists vary with $Y$ and $Z$.
    Repeated centers only repeat events in this union.
  Set $t_n = H sqrt(log n \/ n)$. Multiply the right side of (7.4), with $sin t_n lt.eq t_n$, by $binom(M_n, 2)$.
    The logarithm of the resulting bound is at most
  $ - 3 / 8 n log n + 1 / 2 n log log n + O_(H \, k_0) \( n \) \, $
  which tends to $- oo$. Thus the probability that any pair of sampled points is $t_n$-bad tends to zero,
    uniformly in the pattern. For $xi = 4 sqrt(epsilon)$, the inequality $sin xi lt.eq
    4 sqrt(epsilon)$ instead bounds (7.4) by $f_n$. The expected fraction of these bad unordered pairs is at most
    $f_n$. Markov’s inequality shows that this fraction exceeds $10 f_n$ with probability at most $1 \/ 10$.
    Consequently both conclusions hold with probability at least $9 \/ 10 - o \( 1 \) > 0$.
    The sampled points are distinct almost surely because uniform measure on $G$ has no atoms.
    Fix a successful list. No independence between the two separation properties is needed. ◻
]

=== 7.2 From targets to a small covering probability <from-targets-to-a-small-covering-probability>

We apply the preceding selection before exposing the Poisson process.
  For each selected target, Corollary 10 supplies sets of slab normals whose simultaneous occupancy certifies that
  the target is uncovered. Binning their activities will let us combine many certificates without losing their
  angular separation.

#thm([Proposition 7.3.])[
  (Failure probability for one pattern).  #emph[There are constants $c_0 \,
    C_(upright("tail")) > 0$ and $n_0$ such that, whenever $n gt.eq n_0$ and $1 lt.eq R lt.eq c_0 n log n$,
    every retained pattern $P in cal(F)_n$ of Proposition 3 satisfies
#[#set math.equation(numbering: n => "(7.5)")
 $ bb(P) (B_D subset.eq union.big_(p in P) \( p + K^(+) \)) lt.eq
   exp
   [- exp #scale(x: 120%, y: 120%)[\(] gamma n - C_(upright("tail")) log n #scale(x: 120%, y: 120%)[\)]] .
   $ <eq:pattern-tail>]

 The constants are independent of the pattern, its repetitions, and $R$.]
] <prop:pattern-tail>

The covering event is measurable. Indeed, the finite union of translates of $K^(+)$ is closed,
  so it covers $B_D$ exactly when it contains a fixed countable dense subset of $B_D$.
  At each such point, membership is a finite union of ball conditions and Poisson cap-avoidance events.

#proof[
  Fix $P in cal(F)_n$ and its deterministic good set $G_P$. At each $y in G_P$, Proposition 3 gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ r_(-) - 2 eta lt.eq \| x_i \| lt.eq b + 3 eta \, wide m_y lt.eq 2 C_(upright("loc")) R \, wide
     sum_(i = 1)^(m_y) w_a \( \| x_i \| \) lt.eq 2 C_(upright("loc")) R $ <eq:target-residual-budget>]
  for its relevant residuals $x_i = y - p_i$. If this list is empty at any point of $G_P$,
    that point lies in none of the balls $p + \( b + 3 eta \) B$, so the probability in (7.5) is zero.
    We may assume all these lists are nonempty. For the range of $R$ in the proposition, $m_y lt.eq
    n^2$ once $n$ is sufficiently large.
  For each relevant residual, define the cutting cap
  $ C_i \( y \) = { u in S^(n - 1) : \| u dot.op x_i \| > 1 + 3 eta } . $
  Lemma 4, applied with radial loss $10 log n \/ n$ and a fixed perturbation bound, gives
  $ s_i = - log min { mu \( C_i \( y \) \) \, 1 \/ 2 } lt.eq C_a w_a \( \| x_i \| \) . $
  Consequently
  #[#set math.equation(numbering: n => "(7.7)")
   $ m_y + sum_(i = 1)^(m_y) s_i lt.eq A_0 R \, wide A_0 = 2 C_(upright("loc")) \( 1 + C_a \) .
     $ <eq:target-cap-budget>]
  All assumptions of Corollary 10 therefore hold uniformly in $y$ and $P$.
    Fix its constants $A \, C_(*)$ and $H$ for this value of $A_0$.
  The list-length estimate in Proposition 3 gives $N lt.eq n^(k_0) exp \( lambda_0 n \)$ for a fixed $k_0$,
    uniformly in the present range of $R$. Apply Lemma 12 to $G_P$ with the just-fixed $H$.
    At each of the resulting $M = M_n$ targets, choose the block partition and measurable witness sets from
    Corollary 10. Denote its injection count by $Z_y$, its activity by $nu_y$, and the diagram sums by $D_(y z)$.
    The corollary gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ exp \( - A R \) lt.eq nu_y lt.eq 1 \, wide D_(y y) lt.eq nu_y^2 exp \( C_(*) R \) . $ <eq:target-activities>]
  Every pair of distinct selected targets satisfies $D_(y z) lt.eq n^(- 3) nu_y nu_z$.
    Moreover, $D_(y z) = 0$ unless the pair is $4 sqrt(epsilon)$-bad.
    Our use of “at most” in the definition of badness makes both angular interfaces strict on its complement.
  All choices so far depend only on $P$ and its targets. In particular,
    the witness sets are chosen before the Poisson process; their activities are deterministic intensities.
    There is no need to choose witness sets measurably at every point of $G_P$,
    since only the finite selected list is used. If $Z_y > 0$,
    every relevant residual is cut by a slab of the process, and the other centers are too far from $y$ to contain
    it in a translate of $K^(+)$. Thus $Z_y > 0$ certifies a hole.
  Divide the possible values of $- log nu_y$ in $\[ 0 \, A R \]$ into intervals of length $log 2$. At most
  $ Q = 1 + ⌈frac(A R, log 2)⌉ $
  bins suffice. A largest bin has $m gt.eq M \/ Q$ targets and, for some $nu > 0$,
    all its activities belong to $\[ nu \, 2 nu \]$. There are at most $10 f_n
    binom(M, 2)$ bad unordered pairs in the full list. Hence the chosen bin contains at most
  #[#set math.equation(numbering: n => "(7.9)")
   $ 10 f_n M \( M - 1 \) lt.eq 10 f_n Q^2 m^2 $ <eq:bin-bad-pairs>]
  bad ordered pairs with distinct indices. This bound allows the bin to contain every bad pair;
    no independence between bin membership and angles is asserted.
  Apply Proposition 8 to the witnesses in this bin. Its numerator is at least $m^2 nu^2$.
    By (7.8) and (7.9), its denominator before the factor $2$ is at most
  $ sum_(y \, z) D_(y z) lt.eq 4 m nu^2 exp \( C_(*) R \) + 40 m^2 nu^2 n^(- 3) Q^2 f_n . $
  The first term counts diagonal pairs. Among distinct pairs, only the coarse bad pairs contribute.
    Coverage forces $Z_y = 0$ at every target of the bin, so
  #[#set math.equation(numbering: n => "(7.10)")
   $ bb(P) (B_D subset.eq union.big_(p in P) \( p + K^(+) \)) lt.eq
     exp
     [- frac(1, 8 #scale(x: 120%, y: 120%)[\(] exp \( C_(*) R \) \/ m + 10 n^(- 3) Q^2 f_n
     #scale(x: 120%, y: 120%)[\)])] . $ <eq:bin-tail>]
  Now choose
  $ c_0 = frac(1, 64 max { C_(*) \, 1 }) . $
  Uniformly for $1 lt.eq R lt.eq c_0 n log n$, we have $log Q = O \( log n \)$ and, for sufficiently large $n$,
  $ m exp \( - C_(*) R \) gt.eq M_n / Q exp \( - C_(*) R \) gt.eq exp (frac(n log n, 32)) . $
  The first term inside the parentheses in (7.10) is therefore at most $exp \( - n log n \/ 32 \)$.
    By (7.3), the second is $exp \( - gamma n + O \( log n \) \)$.
    Since $gamma$ is fixed, their sum is at most $exp \( - gamma n + O \( log n \) \)$;
    absorbing the fixed factor $8$ gives (7.5).
  The order of the choices is fixed throughout: the geometric parameters come first,
    then the cap and block constants and $H$, then $c_0$, and finally the dimension threshold.
    Every estimate is uniform over the retained finite class.
    In particular, the auxiliary target selection introduces no dependence on the realization of $Pi$. ◻
]

== 8 Completion of the proof <sec:assembly>

We now combine the estimates and specify their order of use. The numerical parameters (2.1) are already fixed.
  Apply Lemma 4 with the shell and perturbation constants required by Proposition 3.
  Its affinity and common-intersection constants determine the constants in Proposition 6,
  including its radius cutoff. The radial cost estimate gives $A_0 =
  2 C_(upright("loc")) \( 1 + C_a \)$ in the residual budget.
  For this value of $A_0$, Corollary 10 fixes the cross-angle constant $H$ and the self-diagram coefficient
  $C_(*)$. Choose a positive rational number

#[#set math.equation(numbering: n => "(8.1)")
 $ c lt.eq frac(1, 64 max \( C_(*) \, 1 \)) . $ <eq:choose-c>]

Every constant in this order is independent of dimension.
  Increase $n_0$ so that all preceding estimates hold when $n gt.eq n_0$ and $R = c n log n$.
  In particular, $R gt.eq 1$, $R lt.eq n^2$, and every relevant cap list has at most $n^2$ entries.

#proof[
  Use the deterministic class $cal(F)_n$ from Proposition 3, with $R = c n log n$.
    That proposition and Proposition 13 give
  $ & bb(P) {upright("some ") P in cal(F)_n upright(" covers ") B_D upright(" by translates of ") K^(+)}\
 & #h(1cm)  lt.eq exp (exp \( lambda_0 n + O \( log n \) \) - exp \( gamma n - O \( log n \) \)) = o \( 1 \) . $
  The error bounds are uniform over this finite class. Since $gamma > lambda_0$, the negative term dominates.
    Lemma 2 therefore guarantees a realization for which $\| K \| > 2 v omega_n
    a^n$ and no retained pattern covers $B_D$ by translates of $K^(+)$.
  Suppose that $K + Lambda + T = bb(R)^n$ with $\| T \| \/ det Lambda lt.eq rho_0$.
    Proposition 3 would give a retained pattern covering $B_D$ by $K^(+)$, a contradiction.
    Every covering thus has center intensity greater than $rho_0$. Taking the infimum of its density yields
  $ theta_T \( K \) = theta_(upright("per")) \( K \) gt.eq rho_0 \| K \| > R = c n log n \, $
  where Proposition 17 supplies the equality. The realization is a centrally symmetric convex body,
    as observed after (2.5). Choose one for each $n gt.eq n_0$. ◻
]

The exclusion is simultaneous over all full-rank lattices and all finite coset lists.
  The lattice and the centers may depend on the chosen body:
  localization still places their rounded list in the class fixed before sampling.
  The periodization equivalence transfers this exclusion to unrestricted locally finite coverings without changing
  the body or the constant.

=== 8.1 The optimal order for translative and lattice coverings <the-optimal-order-for-translative-and-lattice-coverings>

For a convex body $K$, define its single-lattice covering density by

$ theta_L \( K \) = inf_(Lambda : med K + Lambda = bb(R)^n) frac("vol" \( K \), det Lambda) . $

Every lattice covering is periodic, so $theta_T \( K \) = theta_(upright("per")) \( K \) lt.eq theta_L \( K \)$.
  Let $cal(K)^n$ denote the convex bodies in $bb(R)^n$ and $cal(K)_(upright("sym"))^n$ their centrally symmetric
  members.

#thm([Corollary 8.1.])[
  #emph[As $n arrow.r oo$, each of the four quantities
$ sup_(K in cal(K)^n) theta_T \( K \) \, wide sup_(K in cal(K)_(upright("sym"))^n) theta_T \( K \) \,\
sup_(K in cal(K)^n) theta_L \( K \) \, wide sup_(K in cal(K)_(upright("sym"))^n) theta_L \( K \) $

 has order $n log n$, with absolute comparison constants.]
] <cor:sharp-order>

#proof[
  Theorem 1 gives the lower bound already among centrally symmetric bodies, and $theta_T lt.eq
    theta_L$ transfers it to lattice coverings. Rogers’ bound (1.3) supplies the translative upper bound.
    The companion single-lattice theorem #cite(label("OpenAI2026SingleLattice")) Theorem 1.1 gives
    $theta_L \( K \) lt.eq C n log n$ for every convex body and every $n gt.eq 2$,
    which supplies the two lattice upper bounds. ◻
]

== 9 Rational polytopes and normal lists <sec:encoding>

The strict volume margin in the proof gives a polyhedral consequence of Theorem 1 without changing its constant.

#thm([Corollary 9.1.])[
  #emph[With the same $c$ and $n_0$ as in Theorem 1, for every $n gt.eq
    n_0$ there is a centrally symmetric polytope $P_n subset bb(R)^n$ with rational vertices such that
$ theta_T \( P_n \) > c n log n . $

]
] <cor:rational-polytope>

#proof[
  Fix the successful body $K$ in the proof of Theorem 1, and put $R = c n log n$.
    It satisfies $\| K \| > 2 v omega_n a^n$, and no periodic covering by $K$ has center intensity at most
    $rho_0 = R \/ \( 2 v omega_n a^n \)$.
  Enumerate the rational points of $"int" K$ as $q_1 \, q_2 \, dots.h$ and set
  $ P_j = "conv" { plus.minus q_1 \, dots.h \, plus.minus q_j } . $
  These are centrally symmetric rational polytopes contained in $"int" K$, and they increase with $j$.
    Their union is $"int" K$: every interior point lies inside a sufficiently small simplex with rational vertices
    in $"int" K$, and all its vertices eventually occur in the enumeration.
    Continuity of volume from below, together with the fact that the boundary of a convex body has measure zero,
    gives $\| P_j \| arrow.r \| K \|$. Choose $j$ so that $\| P_j \| > 2 v omega_n a^n$; in particular,
    this $P_j$ has nonempty interior.
  Every periodic covering by $P_j$ is a covering by $K$, because $P_j subset K$.
    Its center intensity therefore exceeds $rho_0$. Taking the infimum of the covering densities and using
    Proposition 17 yields
  $ theta_T \( P_j \) = theta_(upright("per")) \( P_j \) gt.eq rho_0 \| P_j \| > R . $
  This argument uses both inclusion and the retained volume margin. ◻
]

A different finite description retains the spherical truncation $b
  B$ and makes all slab normals rational unit vectors. These bodies need not be polytopes.

#thm([Proposition 9.2.])[
  #emph[The bodies in Theorem 1 can be chosen in the form
$ K = b B ∩ ⋂_(j = 1)^m { x : \| u_j dot.op x \| lt.eq 1 } \, wide u_j in bb(Q)^n ∩ S^(n - 1) \, $

 with $m < oo$.]
] <prop:rational>

#proof[
  Fix a successful finite normal list $U = \( u_1 \, dots.h \, u_m \)$ from the proof of Theorem 1.
    The class $cal(F)_n$ is finite and independent of $U$. For each $P in cal(F)_n$,
    select a point $y_P in B_D$ outside all of its translates of $K^(+) \( U \)$.
    For every center $p$ in that list, either $\| y_P - p \| > b + 3 eta$, or one of the normals satisfies
  $ \| u_j dot.op \( y_P - p \) \| > 1 + 3 eta . $
  Each required inequality is strict. There are finitely many patterns, centers, and chosen certificates,
    so all these inequalities persist under a sufficiently small simultaneous perturbation of the normals.
    Empty patterns need no certificates.
  The strict volume test persists as well. If $U'$ is a list of unit normals with $\| u_j - u'_j \| lt.eq
    delta$ for every $j$, then
  #[#set math.equation(numbering: n => "(9.1)")
   $ \( 1 + b delta \)^(- 1) K \( U \) subset K \( U' \) subset \( 1 + b delta \) K \( U \) . $ <eq:volume-continuity>]
  Indeed, if $x in K \( U \)$, then $\| x \| lt.eq b$ and $\| u'_j dot.op x \| lt.eq 1 + b delta$;
    scaling by $\( 1 + b delta \)^(- 1)$ proves the first inclusion. Interchanging $U$ and $U'$ proves the second.
    Volumes therefore converge as $delta arrow.r 0$.
  Rational unit vectors are dense in $S^(n - 1)$ for $n gt.eq 2$, by the stereographic parametrization
  $ t mapsto frac(\( 2 t \, 1 - \| t \|^2 \), 1 + \| t \|^2) \, wide t in bb(Q)^(n - 1) \, $
  and approximation of its omitted pole. Approximate all normals closely enough to preserve the holes and the
    strict volume test. The localization argument applies to every finite normal list,
    so the resulting rational list yields the same lower bound. ◻
]

One can specify a choice exactly by ordering the finite rational normal lists.
  Write each coordinate in reduced form with positive denominator,
  and let its height be the maximum of the absolute numerator and denominator.
  Order lists by their length plus maximum coordinate height (height $1$ for the empty list),
  breaking each finite tie lexicographically. The lists satisfying the strict volume test and every finite-pattern
  noncoverage test form a nonempty set, so they have a first member.
  This specifies a finite mathematical object; it does not assert an algorithm for deciding the volume comparisons
  or an effective bound for the first admissible dimension.

== 10 Covering density and periodization <sec:periodization>

The proof constructs bodies that exclude every finite union of lattice cosets.
  We verify that this gives the same lower bound for unrestricted translative coverings,
  with a precise density convention. This standard periodization principle is recorded in
  Prosanov #cite(label("Prosanov2021PackingCovering")) Theorem 2.1, with attribution to Rogers.
  We give the finite-window argument to make its boundary and limiting conventions explicit.

Fix a convex body $K subset bb(R)^n$ and write $V = "vol" \( K \)$.
  Use the definitions of $theta_T$ and $theta_(upright("per"))$ from Section 1.
  For a locally finite covering center set $X$, the centered cube lower density replaces the $limsup$ in (1.1) by
  $liminf$. The centered ball versions use $B_R$ and $"vol" \( B_R \)$ in place of $Q_R$ and $\( 2 R \)^n$.

#thm([Proposition 10.1.])[
  (Periodization).  #emph[For every convex body $K subset bb(R)^n$,
$ theta_T \( K \) = theta_(upright("per")) \( K \) . $

 The same infimum is obtained by replacing the centered cube upper density by centered cube lower density or
   centered Euclidean-ball lower or upper density. These are equalities of infima over coverings;
   the corresponding statistics of one covering need not agree.]
] <prop:periodization>

#proof[
  Choose $r > 0$ with $K subset Q_r$, and let $X$ be a locally finite covering center set.
    For $a in bb(R)^n$ and $L > 0$, the finite set
  $ S = X ∩ \( a + Q_(L + r) \) $
  covers $a + Q_L$ by translates of $K$. Indeed, if $y in a + Q_L$ and $y = k + x$ with $k in K$ and $x in X$,
    then $x = y - k in a + Q_(L + r)$. This holds on the boundary as well.
    Repeating $S$ with periods $2 L bb(Z)^n$ covers all of $bb(R)^n$ because the cubes $a + Q_L + 2 L z$ cover it.
    Reducing $S$ modulo this lattice gives
  #[#set math.equation(numbering: n => "(10.1)")
   $ theta_(upright("per")) \( K \) lt.eq frac(V \# \( X ∩ \( a + Q_(L + r) \) \), \( 2 L \)^n) . $ <eq:density-window>]
  Writing $R = L + r$, we obtain, for every $a$ and every $R > r$,
  #[#set math.equation(numbering: n => "(10.2)")
   $ frac(V \# \( X ∩ \( a + Q_R \) \), \( 2 R \)^n) gt.eq theta_(upright("per")) \( K \) \( 1 - r \/ R \)^n .
     $ <eq:density-cubes>]
  This proves the required lower bound for both centered cube conventions.
  For the ball conventions, fix $L > 0$ and put $beta = sqrt(n) \( L + r \)$.
    Integrate (10.1) over $a in z + B_(R - beta)$, where $R > beta$.
    Any counted center belongs to $z + B_R$, and each such center is counted on a set of $a$ of volume at most
    $\( 2 \( L + r \) \)^n$. Tonelli’s theorem therefore gives
  $ frac(theta_(upright("per")) \( K \) \( 2 L \)^n, V) "vol" \( B_(R - beta) \) lt.eq
    integral_(z + B_(R - beta)) \# \( X ∩ \( a + Q_(L + r) \) \) thin d a
    lt.eq \( 2 \( L + r \) \)^n \# \( X ∩ \( z + B_R \) \) . $
  Consequently, uniformly in $z$,
  $ frac(V \# \( X ∩ \( z + B_R \) \), "vol" \( B_R \)) gt.eq
    theta_(upright("per")) \( K \) (frac(L, L + r))^n \( 1 - beta \/ R \)^n . $
  First let $R arrow.r oo$ with $L$ fixed, and then let $L arrow.r oo$.
    This proves the lower bound for the ball lower densities and hence also for the upper densities.
    No comparison of a ball with just one containing or contained cube is needed.
  For the reverse inequality, consider a periodic center set $X = Lambda + T$ with distinct cosets.
    Let $F$ be a bounded half-open fundamental parallelepiped of $Lambda$ and choose $d > 0$ with $F subset Q_d ∩
    B_d$. For each fixed $t in T$, the cells $t + lambda + F$ partition space up to null boundaries.
    For $R > d$ and $W_R = Q_R$ or $B_R$, the cells based at points of $t + Lambda$ in $z + W_R$ contain $z +
    W_(R - d)$ up to a null set and are contained in $z + W_(R + d)$. Thus
  $ "vol" \( W_(R - d) \) lt.eq det Lambda thin \# \( \( t + Lambda \) ∩ \( z + W_R \) \) lt.eq
    "vol" \( W_(R + d) \) . $
  Divide by $"vol" \( W_R \)$ and sum over the distinct cosets.
    Every stated center-count intensity is therefore $\| T \| \/ det Lambda$, uniformly in $z$;
    the corresponding covering density is $V \| T \| \/ det Lambda$.
    The finite constant $d$ may depend on the lattice; no bound uniform over lattices is needed.
    Since periodic center sets are locally finite, restricting each unrestricted infimum to these competitors
    proves the reverse inequality. ◻
]

===== 10.1 Average overlap multiplicity. <average-overlap-multiplicity.>

One customary definition uses the lower ball density of the overlap
  multiplicity #cite(label("Prosanov2021PackingCovering")) Section 1.1. It agrees with the convention above.
  For either choice of $W_R$, put

$ A_W \( X \, R \) = sum_(x in X) "vol" \( \( K + x \) ∩ W_R \) . $

Choose $s > 0$ such that $K$ is contained in the radius-$s$ ball of the norm defining $W_R$.
  Local finiteness gives, for $R > s$,

$ V \# \( X ∩ W_(R - s) \) lt.eq A_W \( X \, R \) lt.eq V \# \( X ∩ W_(R + s) \) . $

Replacing $R$ by $R + s$ or $R - s$ does not change the liminf or limsup of $\# \( X ∩ W_R \) \/ "vol" \( W_R \)$:
  substitute the shifted radius and use $\( R plus.minus s \)^n \/ R^n arrow.r 1$.
  The lower and upper limits of $A_W \( X \, R \) \/ "vol" \( W_R \)$ therefore equal the corresponding
  center-count intensities multiplied by $V$. This counts each overlapping translate separately;
  the volume of the covered union is not the density.

===== 10.2 Transfer of the lower bound. <transfer-of-the-lower-bound.>

In particular, any inequality $theta_(upright("per")) \( K \) >
  R$ established by the finite-coset argument implies $theta_T \( K \) >
  R$ for the same body and the same constant. This uses equality of the infima and makes no claim that an
  individual covering can be repeated at exactly its original density.
  For every $epsilon.alt > 0$, a covering of finite density $D$ does imply existence of a periodic covering of
  density less than $D + epsilon.alt$.

#bibliography("refs.bib", style: "ieee", title: [References])
