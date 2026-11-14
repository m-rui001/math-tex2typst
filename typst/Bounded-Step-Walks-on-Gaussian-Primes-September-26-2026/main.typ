#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Bounded-Step Walks on Gaussian Primes]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 The Gaussian moat problem <sec:introduction>

A Gaussian prime is an irreducible element of $bb(Z) \[ i \]$.
  We identify $a + b i$ with $\( a \, b \) in bb(Z)^2$, write $N \( a + b i \) = a^2 + b^2$,
  and use the Euclidean norm $\| z \| = sqrt(N \( z \))$. For a finite real $D$,
  let $G_D$ have all Gaussian primes as vertices, with an edge between distinct $z \, w$ if $\| z - w \| lt.eq D$.
  The Gaussian moat problem asks whether some $G_D$ contains an infinite path with no repeated vertex.
  Large gaps along a line do not settle the question in the plane, since a path may go around them.

#thm([Theorem 1.1.])[
  (Uniform component bound).  #emph[ For every finite real $D$ there is a finite $B_D$ such that every connected
    component of $G_D$ has at most $B_D$ vertices. The bound is independent of the starting prime and includes
    primes on the coordinate axes. Consequently every sequence of distinct Gaussian primes whose successive
    distances are at most $D$ has at most $B_D$ terms.]
] <thm:main>

This proves the uniform form of the Gaussian moat conjecture and answers the infinite-walk question negatively.
  The bound $B_D$ is nonexplicit: the proof chooses sufficiently large scales after fixing $D$.
  For $D < 1$, distinct lattice points cannot be adjacent, so $B_D = 1$ suffices.

Gethner and Stark trace the question to Basil Gordon at the 1962 International Congress of Mathematicians in
  Stockholm [5] p. 289. Erdős later credited Gordon and Motzkin,
  recalling that Motzkin had told him the problem at the Pasadena number theory meeting in November 1963 [4] p. 69.

The early work separates two obstacles. Large prime-free disks obstruct motion locally,
  but a planar walk may go around them. Gethner, Wagon, and Wick constructed such disks with centers on any line
  containing two Gaussian integers, and constructed arbitrarily isolated real Gaussian primes;
  they credit Vardi with an independent proof of the latter result [6] Theorems 4.1 and 4.4.
  Computations instead surround a particular starting region:
  Tsuchimura obtained a finite bound on the distance reachable with steps of length at most $6$ from the origin,
  adjoined as an initial vertex [13]. This is a result about the component of that vertex.

The closer predecessor of the present argument is finite periodic sieving.
  Gethner and Stark formulated a bound on the length of a distinct-prime walk that is uniform over its starting
  point, established periodic obstructions for step bounds $sqrt(2)$ and $2$,
  and proposed sieving by small Gaussian primes for larger bounds [5] pp. 290–292.
  Vardi studied the associated periodic coprimality graphs and the passage from the absence of an infinite walk to
  a uniform bound on component sizes [14] Section 6, Proposition 6.2.
  Our finite-sieve theorem supplies congruence restrictions for each fixed step bound;
  the periodic reduction below then converts those restrictions into the bound on all Gaussian-prime components.

=== 1.1 A finite obstruction and the route to its proof <a-finite-obstruction-and-the-route-to-its-proof>

For a rational prime $p equiv 1 med \( mod med 4 \)$, choose conjugate Gaussian prime factors $pi_p \,
  overline(pi_p)$, each of norm $p$. For a finite set $cal(P)$ of such rational primes, put

$ cal(A) \( cal(P) \) = { z in bb(Z) \[ i \] : z equiv.not 0 med \( mod med pi_p \) \, quad
  z equiv.not 0 med \( mod med overline(pi_p) \) quad \( p in cal(P) \) } . $

Changing the chosen associates does not change this set. It is periodic under translations by $Q bb(Z)^2$,
  where $Q = product_(p in cal(P)) p$.

#thm([Theorem 1.2.])[
  (Finite sieve obstruction).  #emph[For every $D gt.eq 1$ there is a finite set $cal(P)_D$ of rational primes
    congruent to $1$ modulo $4$ such that $cal(A) \( cal(P)_D \)$ contains no infinite sequence of distinct points
    with successive distances at most $D$. The set $cal(P)_D$ depends only on $D$.]
] <thm:sieve>

Section 2 first proves that this finite obstruction implies Theorem 1. The remaining sections construct it.
  We fix an arbitrary deterministic infinite self-avoiding lattice walk with steps at most $D$.
  Randomness enters only through sampled times and auxiliary choices of one Gaussian factor over each split prime.
  The aim is to show that such a walk cannot avoid all the selected zero classes.

The geometric sampling operation in Section 4 chooses a difference uniformly from the distinct differences of a
  long walk segment and then chooses one of its endpoints. There are many distinct differences,
  and a random collection of signed prime factors usually separates them.
  These facts force the sampled endpoint to carry more joint entropy in its residues than the earlier position
  did. The proof uses a torus-degree argument for the differences,
  followed by determinant divisibility and concentration for the factor choices.
  Disjoint neighborhoods in the Boolean cube avoid a separate count of all lattice directions.

The next task is coverage: for most factors of norm $p$, the terminal residue must have probability at least
  $tau \/ p$ outside fewer than $p^(1 - beta)$ exceptional residues.
  Joint entropy alone, at the accuracy available early in the construction, does not give this conclusion.
  Section 5 supplies the additional argument before the large schedule of parameters is introduced.
  Repeated continuations from an exact later checkpoint give one displacement vector shared by every residue
  coordinate. If coverage failed, this vector would put the true residue on a short list with appreciable
  probability. Its entropy cost is too small to create that deficit in many coordinates at once.

Section 6 arranges the geometric operations in a common schedule with decreasing scales.
  It first establishes the entropy and displacement estimates,
  then applies the coverage transfer backward through the checkpoints.
  Every prime batch uses the same terminal time law, denoted by $t_(*)$.
  An independent uniform offset makes this law nearly invariant under the time shifts needed later.

Finally, assume that the walk avoids the chosen zero classes.
  Section 7 uses short increment words—finite lists of consecutive increments—to test candidate starting residues.
  Coverage and self-avoidance make these tests informative.
  Each prime batch near $T$ incurs conditional information at least $c \/ log T$ per increment,
  where $c > 0$ depends only on $D$. Section 8 adds these costs using nested residue vectors and dyadic word
  lengths at the common time law. Block subadditivity bounds their sum by the entropy available in one bounded
  increment, whereas the selected batches make the lower bounds diverge. This proves the finite sieve theorem.
  The use of approximate translation invariance and block subadditivity to bound accumulated information is
  methodologically related to Tao’s entropy-decrement argument [12] Section 3.
  Here the signed residue batches, coverage transfer, and costs forced by zero avoidance are established in full
  within this paper.

== 2 Periodicity and the uniform bound <sec:consequences>

The finite sieve theorem will be proved independently of the component bound.
  The following conditional reduction explains why that theorem suffices,
  and records the contribution of the finitely many Gaussian primes removed by the sieve.
  The periodicity principle also appears in Vardi [14] Section 6, Proposition 6.2.

#thm([Proposition 2.1.])[
  (From a periodic obstruction to a uniform bound).  #emph[Fix $D gt.eq
    1$ and a finite set $cal(P)$ of rational primes congruent to $1$ modulo $4$.
    Suppose that $cal(A) \( cal(P) \)$ contains no infinite self-avoiding walk with steps at most $D$. Put
$ Q = product_(p in cal(P)) p \, wide K_D = \# { v in bb(Z) \[ i \] : \| v \| lt.eq D } \, $

 and let $E$ be the set of associates of the selected Gaussian factors. For every component $C$ of $G_D$,
$ \# C lt.eq max { Q^2 \, med \| E \| + \( K_D - 1 \) \| E \| Q^2 } . $

]
] <prop:periodic>

#proof[
  The graph on $cal(A) \( cal(P) \)$ with this step bound is locally finite and invariant under translations by $Q
    bb(Z)^2$. An infinite component would contain an infinite simple path:
    the tree of finite simple paths from one vertex is finitely branching,
    has vertices at arbitrarily large depths, and one can successively choose a child with arbitrarily deep
    descendants. Hence every component is finite.
  Suppose that two distinct points $x \, y$ of a component differ by $v in Q bb(Z)^2$.
    Translation by $v$ sends that component to a component containing $y$, so sends it to itself.
    A finite nonempty subset of $bb(Z)^2$ cannot be invariant under a nonzero translation.
    Each component therefore injects into $\( bb(Z) \/ Q bb(Z) \)^2$ and has size at most $Q^2$.
  A Gaussian prime divisible by a selected factor is an associate of that factor.
    Thus, after deleting $E$, the Gaussian-prime graph is a subgraph of the avoiding graph.
    A component meeting $E$ can meet at most $\( K_D - 1 \) \| E \|$ components of the graph with $E$ removed:
    each such component has an edge to $E$, whose total degree is at most that number.
    Adding back $E$ gives the claimed bound. ◻
]

Applying Proposition 3 to the set supplied by Theorem 2 proves Theorem 1 for $D gt.eq 1$;
  the case $D < 1$ was settled in the introduction. For the weaker infinite-walk conclusion,
  one can simply delete an initial segment containing the finitely many exceptional Gaussian primes:
  the remaining tail would lie in $cal(A) \( cal(P)_D \)$.

Periodicity is what makes the bound uniform in the starting point.
  Absence of an infinite path in a general locally finite graph does not bound the sizes of its finite components.
  We now turn to the arithmetic, entropy, and geometry needed to produce the finite obstruction.

== 3 Arithmetic, walks, and entropy <sec:preliminaries>

We record the conventions needed to sample a fixed walk and to compare the resulting residue distributions.
  All logarithms are natural. The notation $A lt.double_D B$ means $A lt.eq
  c_D B$ with a constant depending only on $D$; $A asymp_D B$ means both inequalities.
  Constants without a subscript are absolute. Asymptotic statements about a collection of walks or starting times
  will always be uniform over that collection.

=== 3.1 Split primes <split-primes>

The ring $bb(Z) \[ i \]$ is Euclidean and hence has unique factorization.
  For each rational prime $p equiv 1 med \( mod med 4 \)$, its two conjugate Gaussian prime factors are
  nonassociate, have norm $p$, and have residue fields of size $p$; see [2] Corollary 7.9 and Theorems 7.14, 9.7,
  9.9. We refer to the choice of one of these two factors as a #emph[sign].
  Signs of distinct rational primes will be independent and fair.

We use the following consequences repeatedly. If $pi divides v$ and $overline(pi) divides v$, then $p divides v$,
  meaning that $p$ divides both integer coordinates of $v$.
  If $a in bb(Z)$, then $pi divides a$ if and only if $p divides a$.
  Every nonzero multiple of $pi$ has length at least $sqrt(p)$.
  Finally, multiplication by a Gaussian integer $alpha$ acts on $bb(Z)^2$ by an integer matrix of determinant
  $N \( alpha \)$. Thus if $alpha divides v \, w$, then

$ det \( v \, w \) in N \( alpha \) bb(Z) . $

For $T > 1$, let

$ cal(B)_T = { p upright(" rational prime") : T lt.eq p lt.eq 2 T \, med p equiv 1 med \( mod med 4 \) } \, wide
  k_T = \| cal(B)_T \| \, wide L_T^(*) = 1 / k_T sum_(p in cal(B)_T) log p . $

All uses have $T$ sufficiently large that $k_T > 0$. For one fixed batch we abbreviate $k_T \, L_T^(*)$ by $k \,
  L_(*)$. The prime number theorem in arithmetic progressions for the fixed modulus $4$ gives [11] Equations
  (1.1)–(1.2), p. 66

#[#set math.equation(numbering: n => "(3.1)")
 $ k_T = \( 1 \/ 2 + o \( 1 \) \) frac(T, log T) \, wide log T lt.eq L_T^(*) lt.eq log \( 2 T \) . $ <eq:prime-count>]

Indeed Selberg’s weighted asymptotic $sum_(p lt.eq x \, med p equiv 1 \( 4 \)) log p tilde.op x \/ 2$,
  subtracted at $T$ and $2 T$, gives a sum over $T < p lt.eq 2 T$.
  Adding the possible endpoint term at $p = T$ changes it by at most $log T$.
  The weighted sum over $cal(B)_T$ therefore equals $\( 1 \/ 2 + o \( 1 \) \) T$ and lies between $k_T log
  T$ and $k_T log \( 2 T \)$, whose ratio tends to $1$. Only fixed-modulus, fixed-ratio intervals are involved.
  In particular, all constants implicit in (3.1) hold for every sufficiently large $T$.

=== 3.2 Entropy conventions <entropy-conventions>

For a finite variable $X$ with law $p$, $H \( X \) = - sum_x p \( x \) log p \( x \)$, with $0 log 0 = 0$.
  We use conditional entropy and conditional mutual information in their usual finite-alphabet forms:

$ I \( X \; Y divides Z \) = H \( X divides Z \) - H \( X divides Y \, Z \) . $

Standard identities and inequalities may be found in Cover and Thomas [3] Chapter 2.
  When residue maps are selected randomly, we first fix those maps and compute entropy in the walk-sampling
  experiment; only afterward do we average over the maps. An expectation outside an entropy in this usage is an
  average of entropies, not the entropy of a mixture that includes the map choices.

For laws $p \, q$ on a finite set, put $"TV" \( p \, q \) = 1 / 2 sum_x \| p \( x \) - q \( x \) \|$.
  Relative entropy is $D_(upright("KL")) \( p bar.v.double q \) =
  sum_x p \( x \) log \( p \( x \) \/ q \( x \) \)$, with the usual value $+ oo$ if $q$ vanishes where $p > 0$.
  In particular, on an alphabet of size $a$,

$ D_(upright("KL")) \( p bar.v.double upright("Unif") \) = log a - H \( p \) \, wide
  D_(upright("KL")) \( p bar.v.double q \) gt.eq 2 "TV" \( p \, q \)^2 . $

The second inequality is Pinsker’s inequality in natural logarithms [3] Lemma 11.6.1.

For completeness, let $P \, Q$ be finite probability laws and put $B = { x : P \( x \) > Q \( x \) }$, $u =
  P \( B \)$, and $v = Q \( B \)$. The log-sum inequality, from convexity of $t log t$, gives

$ D_(upright("KL")) \( P bar.v.double Q \) gt.eq D_(upright("KL")) \( "Ber" \( u \) bar.v.double "Ber" \( v \) \) . $

Here $"Ber" \( u \)$ is the Bernoulli law with success probability $u$.
  As a function of $u$, the expression on the right has value and first derivative zero at $u = v$,
  and second derivative $1 \/ \[ u \( 1 - u \) \] gt.eq 4$.
  It is therefore at least $2 \( u - v \)^2 = 2 "TV" \( P \, Q \)^2$, with boundary cases by continuity.

We shall also use $h \( u \) = - u log u - \( 1 - u \) log \( 1 - u \)$ for binary entropy,
  with its continuous values at $0$ and $1$.

=== 3.3 Sampling a deterministic walk <sampling-a-deterministic-walk>

Fix $D gt.eq 1$ and an infinite deterministic sequence $\( z_t \)_(t gt.eq 0)$ of distinct points of
  $bb(Z) \[ i \]$, with $\| z_(t + 1) - z_t \| lt.eq D$. A random time is a finitely supported nonnegative
  integer-valued variable. All later sampling procedures produce such times.
  The walk itself is never assigned a probability law.

Recall the increment bound

$ K_D = \| { u in bb(Z) \[ i \] : \| u \| lt.eq D } \| . $

This includes the zero vector; although a self-avoiding walk never uses it as an increment,
  this harmless upper bound simplifies notation.

#thm([Lemma 3.1.])[
  (Displacement entropy).  #emph[If $T_0 \, T_1$ are jointly distributed finite random times and $\| T_1 -
    T_0 \| lt.eq n$ almost surely, then
$ H \( z_(T_1) - z_(T_0) \) lt.eq 2 log \( n + 1 \) + O_D \( 1 \) . $

 The same bound holds conditionally on any event or variable under which the time-difference bound still holds.
   If $F$ is any finite vector of residue maps, then
$ H \( F \( z_(T_1) \) \) gt.eq H \( F \( z_(T_0) \) \) - H \( z_(T_1) - z_(T_0) \) . $

]
] <lem:displacement>

#proof[
  The displacement lies in a disk of radius $D n$, which contains at most $C_D \( n + 1 \)^2$ lattice points.
    Entropy is at most the logarithm of support size. For the last assertion,
    $F \( z_(T_0) \)$ is determined by $F \( z_(T_1) \)$ and the displacement.
    The chain rule and subadditivity give the claimed inequality. ◻
]

=== 3.4 Continuity and short lists <continuity-and-short-lists>

#thm([Lemma 3.2.])[
  (Continuity).  #emph[If two laws of $\( X \, Y \)$, on the same finite product alphabet,
    have total variation at most $epsilon.alt lt.eq 1 \/ 2$, and the product alphabet has at most $a$ elements, then
$ \| H \( X divides Y \) - H \( tilde(X) divides tilde(Y) \) \| lt.eq 2 h \( epsilon.alt \) + 2 epsilon.alt log a . $

]
] <lem:continuity>

#proof[
  A coupling with mismatch probability equal to total variation yields $\| H \( U \) - H \( tilde(U) \) \| lt.eq
    h \( epsilon.alt \) + epsilon.alt log a$ for variables on an alphabet of size at most $a$.
    Apply this once to the joint variables and once to their $Y$-marginals, and subtract. ◻
]

The next lemma adapts the error-indicator proof of Fano’s inequality to lists; see [3] Theorem 2.10.1.

#thm([Lemma 3.3.])[
  (A short-list entropy bound).  #emph[Let $X$ have at most $a$ values, let $Y$ be finite data,
    and let $cal(L) \( Y \)$ be a list of possible values of $X$. If
$ Pr { X in cal(L) \( Y \) \, med \| cal(L) \( Y \) \| lt.eq b } = rho \, wide 1 lt.eq b lt.eq a \, $

 then
$ log a - H \( X divides Y \) gt.eq rho log \( a \/ b \) - h \( rho \) . $

]
] <lem:list>

#proof[
  Let $B$ indicate the event in the statement. It is determined by $\( X \, Y \)$, so the chain rule gives
  $ H \( X divides Y \) = H \( B divides Y \) + H \( X divides B \, Y \) lt.eq h \( rho \) +
    rho log b + \( 1 - rho \) log a . $
  On $B = 1$ the conditional support lies in $cal(L) \( Y \)$; otherwise the full alphabet bound applies.
    Rearrangement proves the claim. The event may depend on both $X$ and $Y$; no independence is used. ◻
]

== 4 Entropy enrichment from a forward segment <sec:geometry>

Throughout this section, $z_0 \, z_1 \, dots.h$ is a fixed self-avoiding walk in $bb(Z) \[ i \]$ with $\|
  z_(t + 1) - z_t \| lt.eq D$, where $D gt.eq 1$. The walk need not satisfy any congruence restrictions.
  Our goal is a forward sampling operation that raises the average entropy of residue projections.
  Two geometric estimates supply the input: a walk segment has many distinct differences,
  and random signed products usually separate those differences.
  We then sample an endpoint of a uniformly chosen distinct difference.
  Its residue entropy inherits both the entropy already present at the starting point and the entropy created
  within the segment.

=== 4.1 How geometry produces many differences <how-geometry-produces-many-differences>

#thm([Lemma 4.1.])[
  (Many differences).  #emph[Let $E$ consist of the points of a segment of $n gt.eq 1$ steps of the walk.
    Let $R$ be its diameter, choose a line through two points realizing that diameter,
    and let $W$ be the larger of $1$ and the maximum distance of a point of $E$ from that line. Then, for $A = R W$,
$ c n lt.eq A lt.eq D^2 n^2 \, wide \| E - E \| gt.eq c_D A \, $

 where $c > 0$ is absolute and $c_D > 0$ depends only on $D$.]
] <lem:differences>

#proof[
  Let $p_0 \, p_1$ be the diameter endpoints. Every point of $E$ projects onto the segment $p_0 p_1$:
    a projection beyond either endpoint would give a distance greater than $R$ to the other endpoint.
    Thus $E$ lies in a rectangle of length $R$ and width $2 W$. Here $R gt.eq W gt.eq 1$.
    Disjoint disks of radius $1 \/ 3$ about the distinct lattice points of $E$ lie in a fixed enlargement of this
    rectangle. Its area is $O \( R W \)$, proving $n + 1 = O \( A \)$.
    The step bound gives $R lt.eq D n$ and $W lt.eq R$, proving the upper bound.
  If $W = 1$, subtracting a fixed member of $E$ gives $\| E - E \| gt.eq n + 1 gt.eq A \/ D$.
    Suppose instead that $W > 1$, and choose $p_2 in E$ at distance $W$ from the diameter line. Put
  $ a = p_1 - p_0 \, wide b = p_2 - p_0 \, wide Lambda = bb(Z) a + bb(Z) b . $
  The flat torus $bb(R)^2 \/ Lambda$ has area $\| det \( a \, b \) \| = R W = A$.
    Follow the interpolated walk, in either time direction as necessary, to obtain paths $alpha \,
    gamma : \[ 0 \, 1 \] arrow.r bb(R)^2$ from $p_0$ to $p_1 \, p_2$, respectively. The map
  $ \( s \, t \) mapsto alpha \( s \) - gamma \( t \) med \( mod med Lambda \) $
  descends to a continuous map from the parameter torus $\[ 0 \, 1 \]^2 \/ #h(-0.16667em) tilde.op$ to $bb(R)^2 \/
    Lambda$: opposite edges agree because the respective endpoint differences are $a$ and $- b$.
    Homotoping both paths to their straight segments while keeping their endpoints fixed shows that this map has
    degree $- 1$, with the target oriented by $a \, b$. In particular it is onto.
    Indeed, a map omitting a point factors through a punctured torus, whose second homology is zero,
    and therefore has degree zero. These are the standard homological properties of degree; see [8] Section 3.3,
    Theorem 3.26(a), Proposition 3.29, and Exercise 7.
  Every interpolated point is within distance $D$ of a vertex of its walk edge.
    Consequently the images of $E - E$, with disks of radius $2 D$ about them, cover the target torus.
    Each such projected disk has area at most $4 pi D^2$, regardless of overlap or wrapping around the torus. Hence
  $ A lt.eq 4 pi D^2 \| E - E \| \, $
  as required. ◻
]

=== 4.2 Separating differences with randomly chosen factors <separating-differences-with-randomly-chosen-factors>

Many distinct differences give high projected entropy only if reduction separates them.
  The next lemma excludes collisions by ruling out nonzero multiples in a rectangle containing differences of
  differences. Recall that a #emph[sign choice] over a split rational prime means selecting one of its two
  conjugate Gaussian factors, with equal probability.

#thm([Lemma 4.2.])[
  (A randomly signed product avoids a thin rectangle).  #emph[Let $p_1 \, dots.h \,
    p_r$ be distinct rational primes congruent to $1$ modulo $4$, all in $\[ T \, 2 T \]$, where $T gt.eq 5$,
    and put $P = product_i p_i$. Let $Q$ be an origin-centered rectangle of half-lengths $R_1 gt.eq W_1 gt.eq 1$,
    in any orientation. Suppose
$ R_1 W_1 lt.eq P^(1 - d) \, wide 0 < d < 1 / 4 . $

 There are absolute positive constants $c \, C \, C_0$ such that, if $d^3 r gt.eq C_0$, independent sign choices satisfy
$ Pr {Q ∩ #scale(x: 180%, y: 180%)[\(] product_(i = 1)^r pi_i #scale(x: 180%, y: 180%)[\)] bb(Z) \[ i \] eq.not {
  0 }} lt.eq C e^(- c d^3 r) . $

]
] <lem:rectangle>

#proof[
  Call a sign vector bad if it has a nonzero witness in $Q$.
    We group bad sign vectors by the lines containing their witnesses.
    Nearby sign vectors will have the same line, whereas a fixed line will occur for only a small fraction of
    signs. A cube expansion estimate then combines these facts without counting the possible lines.
  ===== 4.2.1 Nearby signs have collinear witnesses. <nearby-signs-have-collinear-witnesses.>
  We first show that witnesses belonging to nearby bad sign vectors lie on a common line through zero.
    If two sign vectors differ in $h lt.eq d r \/ 4$ coordinates,
    the product $c_(*)$ of their common Gaussian factors has
  $ N \( c_(*) \) gt.eq P \/ \( 2 T \)^h . $
  For corresponding witnesses $w = c_(*) u$ and $w' = c_(*) v$,
  $ det \( w \, w' \) = N \( c_(*) \) det \( u \, v \) in N \( c_(*) \) bb(Z) . $
  On the other hand, $\| det \( w \, w' \) \| lt.eq 2 R_1 W_1 lt.eq 2 P^(1 - d)$.
    The logarithm of the ratio between the divisor and this upper bound is at least
  $ d r (log T - 1 / 4 log \( 2 T \)) - log 2 \, $
  which is positive when $d^3 r$ exceeds a sufficiently large absolute constant.
    The determinant must therefore vanish. This also applies to two witnesses for the same sign vector,
    so every bad sign vector has a unique witness line.
  ===== 4.2.2 A fixed line is unlikely. <a-fixed-line-is-unlikely.>
  Fix a line through zero with primitive integer direction $v in bb(Z) \[ i \] \\ { 0 }$,
    meaning that the two integer coordinates of $v$ are relatively prime.
    Its lattice points are precisely the integer multiples $a v$, $a in bb(Z)$. Define
  $ P_sigma \( v \) = product_(pi_i divides v) p_i $
  for sign vector $sigma$. If $pi_i divides.not v$ and $pi_i divides a v$, then $pi_i divides a$,
    and for the rational integer $a$ this is equivalent to $p_i divides a$.
    Thus any nonzero witness on this line has length at least
  $ \| v \| thin P \/ P_sigma \( v \) . $
  Primitivity of the two integer coordinates of $v$ implies that at most one factor over any $p_i$ divides $v$.
    Moreover, the norm of the product of all such eligible factors is at most $N \( v \) = \| v \|^2$. It follows that
  $ bb(E)_sigma log P_sigma \( v \) lt.eq log \| v \| . $
  Every point of $Q$ has length at most $sqrt(2) R_1$, and $R_1 lt.eq P^(1 - d)$.
    Existence of a witness on the fixed line therefore requires
  $ log P_sigma \( v \) gt.eq log \| v \| + d log P - log sqrt(2) . $
  The random variable on the left is a sum of independent variables, each of range at most $log \( 2 T \)$.
    Hoeffding’s inequality [9] Theorem 2, Eq. (2.6) gives, after increasing $C_0$ if needed,
  #[#set math.equation(numbering: n => "(4.1)")
   $ Pr_sigma { upright("a witness lies on the fixed line") } lt.eq exp \( - c_0 d^2 r \) $ <eq:line-tail>]
  for an absolute $c_0 > 0$. Here we used $log P gt.eq r log T$ and the bounded ratio $log \( 2 T \) \/ log T$.
  ===== 4.2.3 Separated line classes have disjoint enlargements. <separated-line-classes-have-disjoint-enlargements.>
  The fixed-line bound alone does not control the number of possible lines.
    We combine it with the separation of their sign classes using the cube’s isoperimetric inequality.
    For completeness, the elementary estimate we need is
  #[#set math.equation(numbering: n => "(4.2)")
   $ \| partial_E S \| gt.eq \| S \| log_2 \( 2^r \/ \| S \| \)
     wide \( diameter eq.not S subset.eq { 0 \, 1 }^r \) . $ <eq:cube-boundary>]
  Here $partial_E S$ consists of cube edges with exactly one endpoint in $S$; see also [7].
    The bound follows by induction on $r$, starting with the one-vertex cube,
    and with empty contributions interpreted as zero. If the two half-cubes contain $a \|
    S \|$ and $\( 1 - a \) \| S \|$ members of $S$, their internal boundary estimates sum to
  $ \| S \| #scale(x: 120%, y: 120%)[\(] r - 1 - log_2 \| S \| + h_2 \( a \) #scale(x: 120%, y: 120%)[\)] \, $
  where $h_2$ is binary entropy in bits. At least $\| 1 - 2 a \| \|
    S \|$ edges cross between a member and a nonmember in the two halves.
    The inequality $h_2 \( a \) gt.eq 1 - \| 1 - 2 a \|$, obtained from concavity on each half of $\[ 0 \, 1 \]$,
    proves (4.2). Since an outside vertex has at most $r$ incident boundary edges,
    the outside vertex boundary has size at least
  $ frac(\| S \|, r) log_2 \( 2^r \/ \| S \| \) . $
  For each relevant line $ell$, let $S_ell$ be its nonempty set of bad sign vectors.
    The unique witness line proved above makes these sets a partition of all bad sign vectors.
    There are only finitely many such lines, since $Q$ contains finitely many lattice points.
    Distinct $S_ell$’s have Hamming distance greater than $d r \/ 4$, by the first part of the proof.
    Consequently their Hamming neighborhoods of radius $h = floor.l d r \/ 10 floor.r$ are disjoint.
    By (4.1), each $S_ell$ has relative size at most $e^(- c_0 d^2 r)$.
    As long as an enlarging set has relative size at most $e^(- c_0 d^2 r \/ 2)$,
    each one-step enlargement increases its size by a factor at least $1 + c_1 d^2$.
    After $h$ steps this gives a factor at least $e^(c_2 d^3 r)$.
    If the indicated relative-size threshold is reached earlier,
    the growth from the initial size is already at least $e^(c_0 d^2 r \/ 2)$,
    which is an even stronger bound after adjusting $c_2$. The disjoint enlarged sets have total size at most
    $2^r$. Their original total size is therefore at most $2^r e^(- c_2 d^3 r)$, proving the lemma. ◻
]

=== 4.3 From differences to endpoint entropy <from-differences-to-endpoint-entropy>

The two geometric estimates now give a sampling operation that can be iterated.
  We first specify how entropy is averaged over residue maps;
  the same convention will be used throughout the sampling schedule.

Fix a batch $cal(P)$ of $k$ distinct primes $p equiv 1 med \( mod med 4 \)$ in $\[ T \, 2 T \]$, and write

$ L_(*) = 1 / k sum_(p in cal(P)) log p . $

A signed subset $cal(S)$ consists of a subset of distinct primes from $cal(P)$,
  with one of the two conjugate Gaussian factors chosen for each.
  Thus its size counts rational primes, and it never contains both factors of the same prime.
  For a finitely supported point variable $Z in bb(Z) \[ i \]$, define

$ F_(cal(S)) \( Z \) = \( Z med mod med pi \)_(pi in cal(S)) \, wide f_Z \( s \) =
  bb(E)_(cal(S)) H \( F_(cal(S)) \( Z \) \) \, quad 0 lt.eq s lt.eq k \, $

where the $s$ underlying primes are chosen uniformly without replacement and their signs independently and fairly.
  All index choices are independent of the point variables.
  Entropy is computed for each fixed signed subset before averaging.

We have

$ f_Z \( 0 \) = 0 \, wide 0 lt.eq f_Z \( s \) lt.eq s L_(*) . $

The function $f_Z$ is concave on the integer interval. Indeed,
  choose a uniform random ordering of the batch and independent signs.
  The difference $f_Z \( s + 1 \) - f_Z \( s \)$ is the average conditional entropy of the next coordinate given
  the first $s$. Exchangeability of the unexposed coordinates and the fact that conditioning decreases entropy
  show that these differences decrease with $s$. This is the usual entropy submodularity argument [3].

Let $Z = z_tau$, where $tau$ is any finitely supported random time.
  For parameters $U > 0$ and $0 < g < 10^(- 2)$, put $n = floor.l e^(g U) floor.r$. For an exact time $t$, write

$ E_t = { z_t \, z_(t + 1) \, dots.h \, z_(t + n) } . $

Conditional on $tau = t$, choose $h$ uniformly from the set $E_t - E_t$, including zero,
  and then choose one ordered pair $\( X \, Y \) in E_t^2$ with $X - Y = h$ by a fixed deterministic rule.
  Thus differences, not ordered pairs, receive equal weight.
  Finally let $V$ equal $X$ or $Y$, each with probability $1 \/ 2$, using an independent coin.
  Self-avoidance identifies each endpoint with a unique walk time in $\[ t \, t + n \]$,
  so this defines a forward transition of the time law. The transition advances time by at most $n$ and uses no
  prime indices.

#thm([Lemma 4.3.])[
  (Entropy enrichment).  #emph[Let $Z = z_tau$ and $V$ be the starting point and sampled endpoint in the preceding
    transition for a fixed self-avoiding $D$-step walk. Set
$ q = floor.l U \/ L_(*) floor.r \, wide b = floor.l g^2 U \/ L_(*) floor.r . $

 Consider any asymptotic family in which $D$ is fixed, $T arrow.r oo$, $q lt.eq k$, and
$ frac(g^C U, log T) arrow.r oo quad upright("for every fixed ") C > 0 . $

 Uniformly over the walks, batches, and starting-time laws,
#[#set math.equation(numbering: n => "(4.3)")
 $ frac(f_V \( b \), b L_(*)) gt.eq 1 / 2 (1 + frac(f_Z \( q \), q L_(*))) - O_D \( g \) . $ <eq:enrichment>]

]
] <lem:enrichment>

The right side retains one half of the starting entropy fraction and adds one half of the maximal fraction.
  When successive transitions match the next input coordinate count to the preceding output count,
  repetition therefore drives the entropy deficit downward.
  Section 6 will arrange this matching, starting even from a deterministic time.
  The error $O_D \( g \)$ is uniform; choosing the scale large enough permits $g$ to decrease as well.

#proof[
  The regime ensures $1 lt.eq b < q$ for sufficiently large parameters.
    We first show that a fresh difference coordinate has nearly maximal entropy even after the endpoint prefixes
    are known. We then use the entropy chain rule to retain the contribution from $Z$.
  ===== 4.3.1 Entropy of one further difference coordinate. <entropy-of-one-further-difference-coordinate.>
  Choose a uniform signed set $cal(Q)$ of size $q$, and within it a uniform signed prefix $cal(S)$ of size $b$. Write
  $ B_x = F_(cal(S)) \( X \) \, wide B_y = F_(cal(S)) \( Y \) \, wide h = X - Y . $
  If $j$ is a uniform remaining signed coordinate and $h_j = F_j \( h \)$, we first prove
  #[#set math.equation(numbering: n => "(4.4)")
   $ bb(E)_(cal(Q) \, cal(S) \, j) H \( h_j divides B_x \, B_y \) gt.eq \( 1 - O_D \( g \) \) L_(*) .
     $ <eq:difference-coordinate>]
  Fix an exact base time $tau = t$ with positive probability, and use $A$ from Lemma 7 for its segment. That lemma gives
  $ g U - O_D \( 1 \) lt.eq log A lt.eq 2 g U + O_D \( 1 \) . $
  Put
  $ r = ⌈\( 1 + 10 g \) frac(log A, L_(*))⌉ . $
  For sufficiently large parameters, $g q \/ 2 lt.eq r lt.eq 3 g q lt.eq q - b$.
    Choose a uniform size-$r$ subset $cal(J)$ of the remaining coordinates.
    Averaging over $cal(Q) \, cal(S)$, its underlying primes form a uniform sample of size $r$ from the batch.
    Their log-product has mean $r L_(*)$ and variance $O \( r \)$,
    since the values $log p$ lie in an interval of length $log 2$ and sampling is without replacement. Hence
  #[#set math.equation(numbering: n => "(4.5)")
   $ Pr {sum_(p in cal(J)) log p < \( 1 + 5 g \) log A} = O (frac(1, g^2 r L_(*)^2)) . $ <eq:product-concentration>]
  In coordinates along the diameter rectangle, differences of differences from the segment lie in an
    origin-centered rectangle of half-lengths $4 R \, 4 W$, whose product is $16 A$.
    On the complementary event in (4.5), writing $P = product_(p in cal(J)) p$, we have
  $ P^(1 - g) gt.eq A^(\( 1 + 5 g \) \( 1 - g \)) gt.eq A^(1 + 3 g) > 16 A $
  for sufficiently large parameters. Lemma 8, with $d = g$,
    shows that reduction in the coordinates $cal(J)$ is injective on the difference set,
    except with additional probability $O \( e^(- c g^3 r) \)$. Let
  $ epsilon.alt = O (frac(1, g^2 r L_(*)^2) + e^(- c g^3 r)) $
  be the total exceptional probability.
  Here all errors are uniform in the exact base time. Indeed $r$ is bounded above and below by constant multiples
    of $g U \/ L_(*)$, while $L_(*)$ is comparable to $log T$. The assumed regime implies
  $ frac(1, g q) = o \( g \) \, wide frac(1, g^2 r L_(*)^2) = o \( g \) \, wide g^3 r \/ log \( 1 \/ g \) arrow.r oo $
  when $g arrow.r 0$; for $g$ bounded away from zero the last assertion is replaced simply by $g^3 r arrow.r oo$.
    For example, the condition with $C = 5$ makes $g^3 r$ larger than an unbounded multiple of $1 \/ g$.
    Thus $epsilon.alt = o \( g \)$, ceiling errors are $o \( g \)$ relatively, and $g log A arrow.r oo$, as used above.
  On a good choice of $cal(J)$, uniformity on the distinct differences and injectivity give
  $ H \( F_(cal(J)) \( h \) divides tau = t \) gt.eq log A - O_D \( 1 \) . $
  Conditioning additionally on $B_x \, B_y$ costs at most $2 b log \( 2 T \)$.
    Averaging the fixed-index entropies therefore yields
  $ bb(E)_(cal(Q) \, cal(S) \, cal(J)) H \( F_(cal(J)) \( h \) divides B_x \, B_y \, tau = t \)
    gt.eq \( 1 - epsilon.alt \) \( log A - O_D \( 1 \) \) - 2 b log \( 2 T \) . $
  For every fixed index choice, conditional subadditivity gives
  $ H \( F_(cal(J)) \( h \) divides B_x \, B_y \, tau = t \) lt.eq
    sum_(j in cal(J)) H \( h_j divides B_x \, B_y \, tau = t \) . $
  Consequently,
  $ 1 / r bb(E)_(cal(Q) \, cal(S) \, cal(J)) H \( F_(cal(J)) \( h \) divides B_x \, B_y \, tau = t \) lt.eq
    bb(E)_(cal(Q) \, cal(S) \, j) H \( h_j divides B_x \, B_y \, tau = t \) \, $
  where $j$ is uniform among the remaining coordinates. This remains true although $r$ depends on $t$:
    at this stage $t$ is fixed, and every member of the uniform $cal(J)$ has the same uniform remaining-coordinate
    marginal. Since
  $ frac(log A, r L_(*)) gt.eq 1 - O \( g \) \, wide b / r = O \( g \) \, $
  we obtain the right side of (4.4), still with the extra conditioning $tau = t$.
    Averaging over $t$, and then removing the conditioning on $tau$, proves (4.4).
  ===== 4.3.2 Retaining the starting entropy. <retaining-the-starting-entropy.>
  We have established near-maximal entropy for a further coordinate of $h = X - Y$,
    after revealing the endpoint prefixes. It remains to turn that information into endpoint entropy while keeping
    the contribution from the starting law. For fixed index choices,
    the pair $\( F_j \( X \) \, F_j \( Y \) \)$ is equivalent to $\( h_j \, F_j \( X \) \)$.
    The entropy chain rule and conditioning inequalities give
  #[#set math.equation(numbering: n => "(4.6)")
   $ H \( h_j divides B_x \, B_y \) & = H \( F_j \( X \) \, F_j \( Y \) divides B_x \, B_y \) -
     H \( F_j \( X \) divides B_x \, B_y \, h_j \)\
 & lt.eq H \( F_j \( X \) divides B_x \) + H \( F_j \( Y \) divides B_y \) -
   H \( F_j \( X \) divides B_x \, B_y \, h \) . $ <eq:enrichment-chain>]
  In particular the last conditioning is on the entire difference $h$, not just on $h_j$;
    using it decreases the subtracted entropy and preserves the displayed inequality.
    Summing these subtracted entropies over the $q - b$ remaining coordinates gives at least
  $ H \( F_(cal(Q)) \( X \) divides B_x \, B_y \, h \) \, $
  because the prefix coordinates are already known from $B_x$. Its average is at least
  $ f_X \( q \) - 2 b log \( 2 T \) - H \( h \) . $
  Also $F_(cal(Q)) \( Z \)$ is determined by $F_(cal(Q)) \( X \)$ and $X - Z$, so
  $ f_X \( q \) gt.eq f_Z \( q \) - H \( X - Z \) . $
  Both $h$ and $X - Z$ are lattice displacements of length at most $D n$. The counting bound of Lemma 4 gives
  $ H \( h \) + H \( X - Z \) lt.eq 4 log \( n + 1 \) + O_D \( 1 \) = O_D \( g U \) . $
  Consequently the average contribution of the subtracted term in (4.6) is at least
  $ frac(f_Z \( q \) - O_D \( g U \), q - b) gt.eq frac(f_Z \( q \), q) - O_D \( g \) L_(*) . $
  The averages of the first two terms on the right side of (4.6) are, respectively, $f_X \( b + 1 \) -
    f_X \( b \)$ and $f_Y \( b + 1 \) - f_Y \( b \)$. Combining with (4.4) proves
  $ \[ f_X \( b + 1 \) - f_X \( b \) \] + \[ f_Y \( b + 1 \) - f_Y \( b \) \] gt.eq L_(*) + frac(f_Z \( q \), q) -
    O_D \( g \) L_(*) . $
  Concavity and $f_X \( 0 \) = f_Y \( 0 \) = 0$ bound these forward differences above by $f_X \( b \) \/
    b$ and $f_Y \( b \) \/ b$. Finally, concavity of entropy under a mixture gives $f_V \( b \) gt.eq 1 /
    2 \( f_X \( b \) + f_Y \( b \) \)$. Dividing by $b L_(*)$ proves (4.3). ◻
]

== 5 Coverage from shared continuation data <sec:transfer>

The geometric argument provides joint residue entropy. Before choosing a schedule of geometric operations,
  we prove the coverage principle that will determine what the schedule must supply.
  The principle uses only finite abelian residue groups and applies beyond Gaussian arithmetic.

=== 5.1 One shared conditioning cost <sec:entropy>

We first isolate why a common data vector is useful. If one separately conditioned on data chosen for each
  coordinate, its entropy cost would be paid once per coordinate.
  A single vector can instead be paid for once in the joint entropy, then distributed over the coordinates.

Let $Lambda$ be a lattice, that is, a finitely generated free abelian group, and let $k gt.eq 1$ be an integer.
  For $1 lt.eq j lt.eq k$ and $sigma in { + \, - }$ let

$ phi.alt_(j \, sigma) : Lambda arrow.r G_(j \, sigma) $

be homomorphisms to finite abelian groups of order $p_j$. Assume $T lt.eq p_j lt.eq 2 T$ and $T gt.eq 2$, and put

$ overline(L) = 1 / k sum_(j = 1)^k log p_j \, wide upright("av")_c u_c =
  frac(1, 2 k) sum_(j = 1)^k sum_(sigma in { + \, - }) u_(j \, sigma) . $

Here $c = \( j \, sigma \)$ denotes one signed coordinate; write $p_c = p_j$, $G_c = G_(j \, sigma)$,
  and $phi.alt_c = phi.alt_(j \, sigma)$. For an integer $1 lt.eq s lt.eq k$,
  choose $s$ distinct indices uniformly and one independent fair sign at each.
  Denote this signed subset by $S$, and write $F_S \( Y \) = \( phi.alt_c \( Y \) \)_(c in S)$ for a finite
  $Lambda$-valued variable $Y$. The choice of $S$ is auxiliary and independent of every variable whose entropy is
  measured. In particular, $bb(E)_S H \( F_S \( Y \) \)$ means the average of the entropies for fixed $S$.

#thm([Lemma 5.1.])[
  (One shared conditioning cost).  #emph[Let $\( Y \, cal(H) \)$ be any pair of finite variables,
    with $Y$ taking values in $Lambda$, and let $S$ be selected independently as above. If
$ bb(E)_S H \( F_S \( Y \) \) gt.eq \( 1 - epsilon.alt \) s overline(L) \, wide H \( cal(H) \) lt.eq
  kappa s overline(L) \, $

 then
#[#set math.equation(numbering: n => "(5.1)")
 $ upright("av")_c \[ log p_c - H \( phi.alt_c \( Y \) divides cal(H) \) \] lt.eq \( epsilon.alt + kappa \)
   overline(L) . $ <eq:deficit-upper>]

 No independence between $Y$ and $cal(H)$ is required.]
] <lem:conditioning>

#proof[
  For each fixed $S$, the chain rule and subadditivity give
  $ H \( F_S \( Y \) \) - H \( cal(H) \) lt.eq H \( F_S \( Y \) divides cal(H) \) lt.eq
    sum_(c in S) H \( phi.alt_c \( Y \) divides cal(H) \) . $
  Each signed coordinate belongs to $S$ with probability $s \/ \( 2 k \)$.
    Averaging and dividing by $s$ shows that the mean conditional entropy is at least
    $\( 1 - epsilon.alt - kappa \) overline(L)$. The mean alphabet entropy is $overline(L)$,
    which proves the assertion. ◻
]

We will contradict (5.1) with the short-list bound of Lemma 6.
  Its success event may depend on both the residue and the data; independence of these variables is unnecessary.

=== 5.2 A transfer from later coverage <a-transfer-from-later-coverage>

We now mix a family of displacement laws. Each conditional law will have a probability floor outside a small
  exceptional set. High joint entropy of the starting position, together with a small cost for shared data,
  will strengthen the exceptional-set bound for the mixture.

Let $A$ be a finite variable, let $y$ map its alphabet to $Lambda$, and put $Y = y \( A \)$.
  For every value $a$ of $A$, specify a finitely supported displacement law $nu_a$ on $Lambda$.
  Conditional on $A$, sample $h_1 \, dots.h \, h_n$ independently with law $nu_A$, where $n gt.eq
  1$ is an integer, and define

$ cal(H) = \( h_1 \, dots.h \, h_n \) \, wide Z = Y + h_1 . $

In the walk application, $A$ will record an exact intermediate time, $Y$ its position,
  and $nu_a$ the displacement law from that time to the terminal position.
  Here $A$ is simply the finite mixing variable; its influence on both $Y$ and $cal(H)$ is retained.
  The coordinate subset $S$ used to measure entropy is independent of this whole experiment.

For a variable $X$ in an alphabet of size $p$, say explicitly that it has $\( tau \, beta \)$ coverage when

#[#set math.equation(numbering: n => "(5.2)")
 $ \# { u : bb(P) \( X = u \) < tau \/ p } < p^(1 - beta) . $ <eq:coverage-definition>]

The strict inequality concerns the number of exceptional residues; no claim is made that this set is empty.

The transfer below lowers the probability floor from $tau'$ to $tau$,
  but improves the exceptional-set bound from $p^(1 - beta')$ to $p^(1 - beta)$, with $beta gt.eq beta'$.
  The exceptional sets of the conditional laws may vary with $a$,
  so mixing them does not directly give this improved bound. The theorem asks for three inputs:
  coverage for each conditional law, a joint entropy budget that can absorb the common data,
  and enough independent trials to make the candidate lists small.

#thm([Theorem 5.2.])[
  (One-step coverage transfer).  #emph[Use the signed coordinates and the experiment just defined,
    with integers $1 lt.eq s lt.eq k$ and $n gt.eq 1$. Let
$ 0 < tau lt.eq 3 \/ 8 \, quad 0 < delta lt.eq 1 \/ 64 \, quad tau' = tau + 4 delta \, quad 0 < beta' lt.eq
  beta < 1 \, quad 0 < eta lt.eq 1 \, quad 0 lt.eq eta' lt.eq 1 . $

 Suppose that at every $a$ in the support of $A$, all but a fraction at most $eta'$ of the signed coordinates have
   $\( tau' \, beta' \)$ coverage for $phi.alt_c \( y \( a \) + h_1 \)$ under the law conditional on $A = a$.
   Assume also
#[#set math.equation(numbering: n => "(5.3)")
 $ bb(E)_S H \( F_S \( Y \) \) & gt.eq \( 1 - epsilon.alt \) s overline(L) \, & H \( cal(H) \) & lt.eq
   kappa s overline(L) \,\
eta' & lt.eq eta delta \/ 100 \, & epsilon.alt + kappa & lt.eq eta delta beta' \/ 16 \, $ <eq:transfer-entropy>]

 where $epsilon.alt \, kappa gt.eq 0$. Finally, for every coordinate size $p = p_j$, assume
#[#set math.equation(numbering: n => "(5.4)")
 $ p exp \( - delta^2 n p^(- beta) \/ 2 \) & lt.eq delta \/ 100 \, & delta^(- 1) & < p^(beta' \/ 2) \,\
log \( 2 e \/ delta \) & lt.eq \( beta' \/ 4 \) log T . $ <eq:transfer-size>]

 Then all but a fraction at most $eta$ of the coordinates have $\( tau \, beta \)$ coverage for $phi.alt_c \( Z \)$.]
] <thm:transfer>

#proof[
  Call a coordinate deficient if its terminal law $phi.alt_c \( Z \)$ fails (5.2).
    Suppose their fraction is $theta > eta$. For each deficient coordinate of size $p$ choose
  $ K_c subset.eq { u : bb(P) \( phi.alt_c \( Z \) = u \) < tau \/ p } \, wide \| K_c \| = u_p :=
    ceil.l p^(1 - beta) ceil.r . $
  Such a set exists, and $1 lt.eq u_p lt.eq p$. Using the same data $cal(H)$ for all coordinates, define
  #[#set math.equation(numbering: n => "(5.5)")
   $ cal(L)_c \( cal(H) \) = {x in G_c : sum_(ell = 1)^n upright(bold(1))_({ x + phi.alt_c \( h_ell \) in K_c })
     lt.eq n \( tau + delta \) u_p \/ p} . $ <eq:list-definition>]
  We will show that the true residue belongs to this list often,
    but that the list is small on average over deficient coordinates.
  ===== 5.2.1 The true residue is often on the list. <the-true-residue-is-often-on-the-list.>
  Every $Y + h_ell$ has the same law as $Z$. The expectation of the count in (5.5) at $x =
    phi.alt_c \( Y \)$ is therefore at most $n tau u_p \/ p$. Markov’s inequality gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ bb(P) { phi.alt_c \( Y \) in cal(L)_c \( cal(H) \) } gt.eq 1 - frac(tau, tau + delta) =
     frac(delta, tau + delta) gt.eq delta . $ <eq:true-list>]
  This step uses only the common one-trial marginal, not independence of the trials before conditioning on $A$.
  ===== 5.2.2 Coverage at the next checkpoint makes the list small. <coverage-at-the-next-checkpoint-makes-the-list-small.>
  Fix $A = a$ and a coordinate whose conditional terminal law has $\( tau' \, beta' \)$ coverage.
    Translation by $phi.alt_c \( y \( a \) \)$ shows that the conditional law of $phi.alt_c \( h_ell \)$ gives
    probability at least $tau' \/ p$ outside a set $E_(a \, c)$ of size less than $p^(1 - beta')$.
    In any finite abelian group,
  $ sum_(x in G_c) \| \( K_c - x \) ∩ E_(a \, c) \| = u_p \| E_(a \, c) \| . $
  Hence, except for at most $\| E_(a \, c) \| \/ delta$ candidates $x$,
  $ \| \( K_c - x \) ∩ E_(a \, c) \| lt.eq delta u_p . $
  For every other $x$, each conditional trial has hit probability at least
  $ tau' \( 1 - delta \) u_p \/ p gt.eq \( tau + 2 delta \) u_p \/ p = : lambda . $
  Indeed $\( tau + 4 delta \) \( 1 - delta \) - \( tau + 2 delta \) = delta \( 2 - tau - 4 delta \) > 0$.
  The count for such an $x$ stochastically dominates $"Bin" \( n \, lambda \)$,
    because its trials are independent conditional on this exact $a$.
    The multiplicative lower-tail estimate [10] Exercise 8, p. 13, a standard concentration bound (see also [1]), gives
  $ bb(P) { "Bin" \( n \, lambda \) lt.eq n \( lambda - delta u_p \/ p \) } lt.eq
    exp #h(-0.16667em) (- frac(n \( delta u_p \/ p \)^2, 2 lambda)) lt.eq exp \( - delta^2 n p^(- beta) \/ 2 \) . $
  For completeness, if $B tilde.op "Bin" \( n \, lambda \)$ and $0 < v < 1$, then $bb(E) e^(- t B) lt.eq
    exp \( n lambda \( e^(- t) - 1 \) \)$. Markov’s inequality with $t = -
    log \( 1 - v \)$ bounds $bb(P) { B lt.eq \( 1 - v \) n lambda }$ by
    $exp \[ - n lambda \( v + \( 1 - v \) log \( 1 - v \) \) \] lt.eq exp \( - n lambda v^2 \/ 2 \)$.
    Apply this with $v = delta \/ \( tau + 2 delta \)$; the last inequality in the displayed bound uses $u_p \/ p
    gt.eq p^(- beta)$ and $tau + 2 delta < 1$.
  A union bound over the at most $p$ candidates now shows that, with conditional probability at least $1 -
    delta \/ 100$, the list contains only the exceptional candidates. By (5.4), their number is less than
  $ delta^(- 1) p^(1 - beta') < p^(1 - beta' \/ 2) . $
  In particular,
  #[#set math.equation(numbering: n => "(5.7)")
   $ bb(P) { \| cal(L)_c \( cal(H) \) \| > p^(1 - beta' \/ 2) divides A = a } lt.eq delta \/ 100 $ <eq:small-list>]
  whenever this coordinate has the required coverage at $a$.
  We have used next-checkpoint coverage only after fixing its exact value.
    It remains to average over that value without assuming that a coordinate deficient now is necessarily covered
    at the next checkpoint.
  ===== 5.2.3 Averaging yields too much conditional information. <averaging-yields-too-much-conditional-information.>
  At each $a$, the fraction of coordinates without the required coverage is at most $eta'$.
    Averaging first over $A$ and then over the $theta$ fraction of deficient coordinates,
    the mean probability of such a failure is at most
  $ eta' \/ theta < delta \/ 100 . $
  Let
  $ a_c = bb(P) { phi.alt_c \( Y \) in cal(L)_c \( cal(H) \) \, quad \| cal(L)_c \( cal(H) \) \| lt.eq
    p_c^(1 - beta' \/ 2) } . $
  Equations (5.6) and (5.7) imply that its mean $overline(a)$ over the deficient coordinates satisfies
  $ overline(a) gt.eq delta - delta \/ 100 - eta' \/ theta gt.eq delta \/ 2 . $
  Lemma 6 gives, for each of these coordinates,
  $ log p_c - H \( phi.alt_c \( Y \) divides cal(H) \) gt.eq a_c \( beta' \/ 2 \) log p_c - h \( a_c \) . $
  Concavity of $h$ and $h \( u \) lt.eq u log \( e \/ u \)$ give
  $ upright("av")_(c med upright("deficient")) h \( a_c \) lt.eq h \( overline(a) \) lt.eq
    overline(a) log \( 2 e \/ delta \) . $
  After averaging and applying (5.4), we obtain
  $ upright("av")_(c med upright("deficient")) \[ log p_c - H \( phi.alt_c \( Y \) divides cal(H) \) \] gt.eq
    frac(overline(a) beta', 4) log T gt.eq frac(delta beta', 8) log T . $
  Every other conditional entropy deficit is nonnegative. Since $overline(L) lt.eq log \( 2 T \) lt.eq
    2 log T$ and $theta > eta$, the mean over all coordinates is strictly greater than
  $ frac(eta delta beta', 8) log T gt.eq frac(eta delta beta', 16) overline(L) . $
  This contradicts Lemma 10 and (5.3). Thus $theta lt.eq eta$. ◻
]

The theorem has charged the repeated displacements once, through $H \( cal(H) \)$.
  Its independence assumption is only conditional on the exact checkpoint $A$.
  In the next section the schedule will make the joint entropy error and this single data cost small enough to
  transfer coverage at every step of a backward induction.

== 6 A common sampling schedule <sec:schedule>

The transfer theorem explains what a useful schedule must achieve.
  At each checkpoint, the joint residue entropy must be almost maximal,
  while the entropy of repeated continuations must be small compared with that joint entropy.
  A much more accurate marginal estimate is needed only at the last checkpoint,
  where it starts the backward coverage induction. We now construct one schedule that supplies these estimates for
  every prime batch.

The same construction also supplies the inputs needed after coverage has been established:
  a persistent joint entropy of order $T$ for each batch near $T$,
  a smaller total alphabet budget for all preceding batches,
  and one common terminal-time law whose small translates are close in total variation.
  These requirements have different roles. The displacement bound pays for information revealed in the coverage
  argument; the final translation bound will permit the information costs of different batches to be added.

Throughout the section, the walk is an arbitrary fixed infinite self-avoiding $D$-step walk.
  No zero-avoidance assumption is used. We first give the actual schedule and prove its entropy and displacement
  estimates, then apply Theorem 11 to obtain coverage.

=== 6.1 Choice of constants and scales <choice-of-constants-and-scales>

Fix $D gt.eq 1$, and set

$ beta_0 = 1 / 200 \, wide e_0 = beta_0 / 50 . $

We will first choose a fixed iteration count $l_0$ and a sufficiently small constant $0 < g_0 < 10^(- 2)$,
  depending only on $D \, e_0$. They determine a constant $c_0 > 0$;
  only then do we choose a sufficiently large fixed $B > 2$. The precise requirements are specified below.
  All these constants are fixed before the asymptotic parameter $M$, and are independent of the walk and starting time.

Let $M$ be a positive integer tending to infinity, and put

$ X_m = 100^m quad \( ceil.l M \/ 2 ceil.r lt.eq m lt.eq M \) . $

Use every batch $cal(B)_T$ with

#[#set math.equation(numbering: n => "(6.1)")
 $ T = B^j \, quad j in bb(Z) \, wide X_m lt.eq log T lt.eq 1.05 X_m quad
   upright("for some ") ceil.l M \/ 2 ceil.r lt.eq m lt.eq M . $ <eq:batches>]

The batches are disjoint because $B > 2$. Write $T_(+) = exp \( 1.05 X_M \)$.
  For this value of $M$, the union of all these batches is the finite prime selection that will be used in Theorem 2.

Starting at time $0$ on a fixed infinite self-avoiding $D$-step walk,
  apply the transition of Lemma 9 with scales $U$ in decreasing order.
  For each $m$, use the three bands in Table 1. In a band with parameter $g$,
  start at its upper endpoint in $log U$, and successively subtract $2
  log \( 1 \/ g \)$ as long as the resulting scale stays in that band.
  Equivalently, successive $U$’s have ratio $g^2$. All randomizations are fresh conditional on the current exact
  walk time. No prime subset or sign choice enters these transitions.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Band
], table.cell(rowspan: 1, colspan: 1)[Interval for $log U$
], table.cell(rowspan: 1, colspan: 1)[Transition parameter
]),
  table.cell(rowspan: 1, colspan: 1)[Top
], table.cell(rowspan: 1, colspan: 1)[$\[ 0.8 X_m \, 1.3 X_m \]$
], table.cell(rowspan: 1, colspan: 1)[$g_0$
],
  table.cell(rowspan: 1, colspan: 1)[Middle
], table.cell(rowspan: 1, colspan: 1)[$\[ 0.20 X_m \, 0.30 X_m \]$
], table.cell(rowspan: 1, colspan: 1)[$g_1 = e^(- M^3)$
],
  table.cell(rowspan: 1, colspan: 1)[Bottom
], table.cell(rowspan: 1, colspan: 1)[$\[ 0.05 X_m \, 0.10 X_m \]$
], table.cell(rowspan: 1, colspan: 1)[$g_2 = e^(- 100 M^20)$
],
)
]],
  caption: [Table 1: The three bands in each scale window. Windows are processed in decreasing $m$, and scales decrease within each band. ],
)

After all transitions in all windows have been performed, add one independent uniform offset in ${ 0 \, dots.h \,
  N - 1 }$, where $N = ceil.l T_(+)^10 ceil.r$. Denote the resulting random time by $t_(*)$.
  Thus all batches will be measured at the same time law.

A #emph[checkpoint] is a stage just before a specified transition, or the terminal stage.
  It also denotes the random walk time at that stage. Conditioning on an exact start at a checkpoint means fixing
  that walk time and then running the remaining schedule with fresh randomness.
  Such conditional experiments are defined at every nonnegative integer start,
  whether or not it has positive probability in the experiment starting from time $0$.
  The term “exact start” specifies a new continuation experiment,
  not conditioning on an event that may have probability zero.

#thm([Lemma 6.1.])[
  (Future shifts and smoothing).  #emph[Let $V$ be a scheduled scale in a band with parameter $g$.
    For all sufficiently large $M$, the maximum total forward time shift from the checkpoint before $V$ to any
    later checkpoint, including $t_(*)$, is bounded by a deterministic number $S_V$ satisfying
$ log \( 1 + S_V \) lt.eq 2 g V . $

 Consequently the entropy of its physical displacement is $O_D \( g V \)$, for every starting law.
   Furthermore, conditional on any earlier exact checkpoint start,
#[#set math.equation(numbering: n => "(6.2)")
 $ "TV" #scale(x: 120%, y: 120%)[\(] cal(L) \( t_(*) \) \,
   cal(L) \( t_(*) + a \) #scale(x: 120%, y: 120%)[\)] lt.eq
   T_(+)^(- 9) wide \( 0 lt.eq a lt.eq T_(+) \, med a in bb(Z) \) . $ <eq:smoothing>]

]
] <lem:future-shift>

#proof[
  One may take the deterministic bound
  $ S_V = N - 1 + sum_(U upright(" remaining")) floor.l exp \( g_U U \) floor.r \, $
  where the sum includes the transition at $V$ and $g_U$ is the parameter of the band containing $U$.
    Every summand and the offset length $N$ are fixed by the schedule, before any exact start is chosen.
    This bounds the total advance from every such start. The number of operations is $O_(g_0) \( X_M \) =
    exp \( O_(g_0) \( M \) \)$. A transition at scale $U$ shifts time by at most $exp \( g U \)$.
    Within the same band all future log-lengths are at most $g V$.
    Between successive bands the decrease in $U$ is at least $exp \( c X_m \)$ for an absolute $c > 0$,
    including the passage from the bottom band for $m$ to the top band for $m - 1$:
    $0.05 X_m - 1.3 X_(m - 1) = 0.037 X_m$. This decrease dominates every ratio of transition parameters,
    because $log \( 1 \/ g_2 \) = 100 M^20 = o \( X_(ceil.l M \/ 2 ceil.r) \)$.
    Thus later bands also have log-length at most $g V$ for large $M$.
  The logarithm of the final offset length is $O \( X_M \)$.
    On the other hand, for the least possible scale and parameter,
  $ log \( g V \) gt.eq 0.05 X_(ceil.l M \/ 2 ceil.r) - 100 M^20 \, $
  so $X_M = o \( g V \)$, uniformly. Taking the logarithm of the sum of all remaining lengths adds only
    $O_(g_0) \( M \)$. The bound $2 g V$ follows, and Lemma 4 gives the entropy assertion.
  Write $t_(*) = tilde(t) + U_N$, where $U_N$ is the final uniform offset, independent of all earlier choices.
    A translate by $a lt.eq T_(+)$ changes its law by at most $a \/ N$.
    Mixtures and deterministic translations do not increase this bound,
    including after an earlier exact start is fixed. This proves (6.2). ◻
]

=== 6.2 Iterating and preserving joint entropy <iterating-and-preserving-joint-entropy>

For a fixed batch write $f_Z \( s \)$ as in Section 4. Every use of Lemma 9 below has $q lt.eq k_T$.
  For each entropy estimate we begin at a scale where $q lt.eq k_T$;
  all subsequent scales in that block are smaller. The other limiting conditions hold uniformly:

$ log U gt.eq c X_(ceil.l M \/ 2 ceil.r) \, wide log \( 1 \/ g \) = O \( M^20 \) \, wide log log T = O \( M \) . $

In particular $g^C U \/ log T arrow.r oo$ for every fixed $C > 0$.

Suppose $l$ successive transitions in one band end just before its next scale $V$,
  and that the initial subset size is at most $k_T$. The output size of one transition and the input size of the
  next are both exactly $floor.l g^2 U \/ L_(*) floor.r$. Writing the normalized entropy deficit as $d_j$,
  Equation (4.3) gives $d_(j + 1) lt.eq d_j \/ 2 + C_D g$. Since $d_0 lt.eq 1$, iteration gives $d_l lt.eq
  2^(- l) + 2 C_D g$, and hence

#[#set math.equation(numbering: n => "(6.3)")
 $ frac(f_Z \( floor.l V \/ L_(*) floor.r \), floor.l V \/ L_(*) floor.r L_(*)) gt.eq 1 - 2^(- l) -
   O_D \( g \) $ <eq:iterate>]

at that checkpoint. The same bound, with another $O_D \( g \)$ error, holds at every later checkpoint.
  Indeed Lemmas 12 and 4 show that the entropy loss at this fixed subset size is $O_D \( g V \)$,
  whereas $floor.l V \/ L_(*) floor.r L_(*) gt.eq V \/ 2$ for large $M$.
  The argument is uniform for every initial law, including an exact start fixed before these $l$ transitions.
  The later entropies here are marginal entropies in that experiment;
  we are not conditioning on the exact later time, which would determine its walk position.

Choose a small absolute $a_0 > 0$ such that $a_0 T \/ L_(*) lt.eq k_T$ for large $T$, using (3.1).
  For a batch $T$ in window $m$, begin an entropy estimate at the first top-band scale $U lt.eq a_0 T$.
  Its size lies between $g_0^2 a_0 T$ and $a_0 T$. Choose a fixed integer $l_0$ large enough that $2^(- l_0) <
  e_0 \/ 3$, and take $g_0$ small enough to make the total error in (6.3) and its preservation less than $2 e_0 \/
  3$. These choices can be made before $B$ and $M$. Run $l_0$ transitions and let $q_T =
  floor.l V \/ L_(*) floor.r$ be the recorded size. All these scales lie in the top band for large $M$.
  At every later checkpoint, for its point variable $Z$,

#[#set math.equation(numbering: n => "(6.4)")
 $ f_Z \( q_T \) gt.eq \( 1 - e_0 \) q_T L_(*) \, wide q_T L_(*) gt.eq c_0 T $ <eq:global-entropy>]

with $c_0 > 0$ depending only on the fixed choices. For example any sufficiently small constant below $a_0
  g_0^(2 \( l_0 + 1 \)) \/ 2$ works in the second inequality.

By (3.1), $k_(T') log \( 2 T' \) lt.eq C T'$. Since the batches are a subsequence of the geometric progression
  $B^j$, we can now choose $B > 2$ so large that for every used batch

#[#set math.equation(numbering: n => "(6.5)")
 $ sum_(T' < T) k_(T') log \( 2 T' \) lt.eq e_0 c_0 T . $ <eq:smaller-alphabet>]

In fact the left side is at most $C T \/ \( B - 1 \)$. This completes the fixed-constant choices in the order
  $D \, e_0$, then $l_0 \, g_0 \, c_0$, then $B$, and finally $M$.
  The top band has now supplied a batch entropy of order $T$ that survives the remaining schedule,
  and the geometric spacing makes all smaller residue alphabets inexpensive compared with it.
  We next build the more accurate conditional estimates needed for coverage.

=== 6.3 Intermediate checkpoints and almost uniform marginals <intermediate-checkpoints-and-almost-uniform-marginals>

These checkpoints will transmit coverage backward from an accurate one-coordinate base case.
  Their spacing must allow joint entropy to grow while keeping subsequent displacement data inexpensive.
  For each batch $T$, put

#[#set math.equation(numbering: n => "(6.6)")
 $ beta_i = 2^(- i) beta_0 \, wide r_0 = 1 / 4 \, wide r_(i + 1) = r_i - 2 beta_i . $ <eq:checkpoint-parameters>]

Stop at the least $J = J \( T \)$ with $beta_J log T lt.eq M^20$.
  Since $beta_0 log T > M^20$ for sufficiently large $M$, we have $J gt.eq 1$; minimality then gives

#[#set math.equation(numbering: n => "(6.7)")
 $ J = O \( M \) \, wide M^20 \/ 2 < beta_J log T lt.eq M^20 \, wide 0.23 < r_i lt.eq 0.25 . $ <eq:checkpoint-ranges>]

The last assertion follows from $r_i = 1 \/ 4 - 4 beta_0 \( 1 - 2^(- i) \)$.
  Let $A_i$ be the checkpoint just before the first scheduled operation with $U lt.eq T^(r_i)$.
  All these checkpoints lie in the middle band for this $m$, since

$ 0.23 X_m < r_i log T lt.eq 0.2625 X_m . $

Its scale is in $\( g_1^2 T^(r_i) \, T^(r_i) \]$. Let $S_i$ be a deterministic upper bound for the remaining time
  shift from $A_i$ supplied by Lemma 12, and define

$ cal(D)_i = { v in bb(Z) \[ i \] : \| v \| lt.eq D S_i } . $

This set does not depend on the exact start. From every exact start $A_i = a$,
  every possible displacement to any later checkpoint, including $z_(t_(*)) - z_a$, belongs to $cal(D)_i$.
  Since the scale at $A_i$ is at most $T^(r_i)$, lattice-point counting gives

#[#set math.equation(numbering: n => "(6.8)")
 $ log \| cal(D)_i \| lt.eq C_D T^(r_i) . $ <eq:native-data>]

Consequently, uniformly in the starting law, for any later checkpoint $A$ we have

#[#set math.equation(numbering: n => "(6.9)")
 $ H \( z_A - z_(A_i) \) lt.eq C_D T^(r_i) . $ <eq:checkpoint-displacement>]

The common support bound is stronger than a separate conditional entropy bound at each exact start.
  It will control the unconditional entropy of displacement data when the next checkpoint is random.

Fix an exact start at $A_i$, where $i < J$, and let $Y = z_(A_(i + 1))$.
  There is a deterministic subset size $s_i$, depending on the batch and the schedule but not on that start, such that

#[#set math.equation(numbering: n => "(6.10)")
 $ f_Y \( s_i \) gt.eq \( 1 - e^(- c M^3) \) s_i L_(*) \, wide s_i L_(*) gt.eq
   exp \( r_i log T - O \( M^6 \) \) $ <eq:checkpoint-entropy>]

for a fixed $c > 0$. To see this, take $ceil.l M^3 ceil.r$ iterations starting at $A_i$.
  The first log-scale differs from $r_i log T$ by less than $2 M^3$,
  and these iterations consume $O \( M^6 \)$ log-scale. The starting subset size is at most $k_T$, since $U lt.eq
  T^(r_i) lt.eq T^(1 \/ 4) = o \( T \)$ and $k_T L_(*) asymp T$. They fit before $A_(i + 1)$, because

$ \( r_i - r_(i + 1) \) log T = 2 beta_i log T > 2 M^20 . $

Equation (6.3), preservation, and $g_1 = e^(- M^3)$ prove the first bound, and the recorded scale proves the second.

Finally, conditional on any exact start at $A_J$, proceed to the bottom band for this $m$.
  Take $ceil.l 200 M^20 ceil.r$ iterations, recording a subset size $s$.
  Begin at its first scale, which is at most $exp \( 0.10 X_m \) = o \( T \)$,
  so again the initial subset size is at most $k_T$. The required log-scale span is $O \( M^40 \) = o \( X_m \)$,
  so the iterations and their recording scale fit in that band.
  Their deficit, including preservation to $t_(*)$, is at most

$ 2^(- ceil.l 200 M^20 ceil.r) + O_D \( e^(- 100 M^20) \) lt.eq e^(- 90 M^20) . $

Concavity of $f$ gives $f \( 1 \) gt.eq f \( s \) \/ s$. Thus in every such exact-start experiment,

#[#set math.equation(numbering: n => "(6.11)")
 $ f_(z_(t_(*))) \( 1 \) gt.eq \( 1 - e^(- 90 M^20) \) L_(*) . $ <eq:terminal-entropy>]

Equations (6.10) and (6.11) are the two inputs to the coverage induction:
  high joint entropy between checkpoints and an extremely accurate one-coordinate base case.
  Figure 1 summarizes the two orders now in play: sampling moves forward through the schedule,
  while coverage will be proved by induction from $A_J$ back to $A_0$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-1.2, 1.05), [#text(size: 9pt)[Forward sampling from one window onward]], anchor: "west", padding: 0.1176cm)
  content((0, 0), [#box(width: 2.382cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Top band#linebreak()joint entropy]]])])
  content((3, 0), [#box(width: 2.882cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Middle band#linebreak()$A_0, dots.h ,A_J$]]])])
  content((6, 0), [#box(width: 2.682cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Bottom band#linebreak()marginals]]])])
  content((9.4, 0), [#box(width: 3.682cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Smaller windows#linebreak()then uniform offset]]])])
  content((12.6, 0), [#box(width: 1.082cm, height: 1.05cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$t_*$]]])])
  line((1.191, 0), (1.559, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((4.441, 0), (4.659, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((7.341, 0), (7.559, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((11.24, 0), (12.06, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-1.2, -1.05), [#text(size: 9pt)[Backward coverage induction for exact-start continuation laws]], anchor: "west", padding: 0.1176cm)
  content((1.15, -2.02), [#box(width: 3.082cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Coverage at $A_J$#linebreak()base case]]])])
  content((5.65, -2.02), [#box(width: 3.082cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$A_(i+1)$ implies $A_i$#linebreak()$i=J-1, dots.h ,0$]]])])
  content((10.65, -2.02), [#box(width: 3.082cm, height: 0.85cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Coverage at $A_0$]]])])
  line((2.691, -2.02), (4.109, -2.02), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((7.191, -2.02), (9.109, -2.02), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
})],
  caption: [Figure 1: Sampling order and proof order have separate rows. The top row suppresses individual transitions and shows the common terminal time. The bottom row proves coverage of the terminal law from every exact start at each checkpoint. In the step from $A_(i + 1)$ to $A_i$, fix the exact start at $A_i$, run forward to $A_(i + 1)$, then sample independent continuations conditional on that exact next time. The induction reverses the checkpoint index; all sampled times move forward along the fixed walk. ],
) <fig:schedule>

=== 6.4 Coverage from every exact checkpoint <sec:checkpoints>

We now apply the earlier transfer theorem to the estimates just proved.
  The coordinate groups are $bb(Z) \[ i \] \/ \( pi \)$, their maps are reduction modulo the two factors over each
  prime of $cal(B)_T$, and the abstract average $overline(L)$ is exactly $L_(*)$.
  Averages over signed primes assign equal weight to all $2 k_T$ prime-factor pairs.

Recall that $\( tau \, beta \)$ coverage means that a law on an alphabet of size $p$ assigns mass at least $tau \/
  p$ outside fewer than $p^(1 - beta)$ residues. We use the following floors and exceptional fractions at the
  checkpoints already constructed:

#[#set math.equation(numbering: n => "(6.12)")
 $ tau_0 & = 1 / 4 \, & delta_i & = 2^(- i - 6) \, & tau_(i + 1) & = tau_i + 4 delta_i \,\
eta_0 & = 1 / 100 \, &  &  & eta_(i + 1) & = eta_i delta_i \/ 100 . $ <eq:coverage-parameters>]

Here $beta_i$, $r_i$, and $J$ are those of (6.6)–(6.7). In particular,

$ tau_i = 3 / 8 - 2^(- i - 3) < 3 / 8 \, wide eta_i = 100^(- \( i + 1 \)) 2^(- i \( i - 1 \) \/ 2 - 6 i) . $

Since $J = O \( M \)$, these formulas imply, uniformly over $0 lt.eq i lt.eq J$,

#[#set math.equation(numbering: n => "(6.13)")
 $ log \( 1 \/ delta_i \) = O \( M \) \, wide eta_i gt.eq exp \( - O \( M^2 \) \) \, wide
   eta_i delta_i beta_(i + 1) gt.eq exp \( - O \( M^2 \) \) . $ <eq:coverage-parameter-bounds>]

The last estimate is needed only for $i < J$.

For a specified exact start $a$ at checkpoint $A_i$, denote the terminal residue law of its continuation experiment by

$ b_(i \, a \, pi) \( u \) = Pr { z_(t_(*)) med mod med pi = u :
  upright("the remaining schedule is started at ") A_i = a } . $

The colon specifies the experiment, including at starts that have probability zero under the schedule begun at time $0$.

#thm([Proposition 6.2.])[
  (Terminal residue coverage).  #emph[For all sufficiently large $M$, uniformly over the batches, $0 lt.eq i lt.eq
    J$, and all exact start times $a gt.eq 0$ at $A_i$, all but a fraction at most $eta_i$ of the signed primes satisfy
#[#set math.equation(numbering: n => "(6.14)")
 $ \# { u in bb(Z) \[ i \] \/ \( pi \) : b_(i \, a \, pi) \( u \) < tau_i \/ p } < p^(1 - beta_i) . $ <eq:coverage>]

]
] <prop:coverage>

#proof[
  We begin at $A_J$ using the particularly accurate marginal estimate,
    then verify every numerical hypothesis of Theorem 11 for the passage from $A_(i + 1)$ to $A_i$.
  ===== 6.4.1 The terminal base. <the-terminal-base.>
  Fix any exact start at $A_J$. By (6.11), the average relative entropy of the terminal residue laws from their
    respective uniform laws is at most $e^(- 90 M^20) L_(*)$.
    If a signed prime fails (6.14), its low-probability set has at least $p^(1 - beta_J)$ elements.
    The uniform law assigns that set at least $\( 1 - tau_J \) p^(- beta_J)$ more mass than its terminal law.
    Thus the total variation distance is at least
  $ \( 1 - tau_J \) p^(- beta_J) gt.eq c e^(- M^20) \, $
  using $p lt.eq 2 T$, $tau_J < 3 \/ 8$, and $beta_J log T lt.eq M^20$.
    Pinsker’s inequality in natural logarithms [3] Lemma 11.6.1 makes each such entropy deficit at least $c'
    e^(- 2 M^20)$. Averaging the lower bound over the failing signed primes bounds their fraction by
  $ C L_(*) e^(- 88 M^20) = exp \( - 88 M^20 + O \( M \) \) < eta_J $
  for all sufficiently large $M$. This proves the base at every exact start.
    The terminal marginal deficit has the accuracy needed to absorb the power-saving exceptional-set threshold.
  ===== 6.4.2 The shared data and its cost. <the-shared-data-and-its-cost.>
  Suppose coverage has been proved at $i + 1$, and fix an arbitrary exact start $A_i = a$.
    Run the schedule to the next checkpoint and put $A = A_(i + 1)$ and $Y = z_A$.
    Conditional on this exact time $A$, repeat the remaining continuation independently
  $ n_i = ⌈T^(6 beta_i \/ 5)⌉ $
  times. Write $h_1 \, dots.h \, h_(n_i)$ for their physical displacements from $Y$,
    and $cal(H) = \( h_1 \, dots.h \, h_(n_i) \)$. Every $Y +
    h_ell$ has the terminal law from the fixed start $A_i = a$.
    This one data vector is constructed before any auxiliary signed coordinate subset is selected.
  By (6.8), every $h_ell$ belongs to the same finite set $cal(D)_(i + 1)$, even as $A$ varies.
    Hence its #emph[unconditional] entropy in this fixed-start experiment satisfies
  $ H \( cal(H) \) lt.eq n_i log \| cal(D)_(i + 1) \| lt.eq C_D n_i T^(r_(i + 1)) . $
  This is not an assertion of independence before conditioning on $A$. Combining the support bound with (6.10) yields
  #[#set math.equation(numbering: n => "(6.15)")
   $ kappa_i := frac(H \( cal(H) \), s_i L_(*)) lt.eq C_D exp (- 4 / 5 beta_i log T + O_D \( M^6 \)) lt.eq
     e^(- M^3) . $ <eq:coverage-data-cost>]
  Indeed $n_i lt.eq 2 T^(6 beta_i \/ 5)$, $r_i - r_(i + 1) = 2 beta_i$, and $beta_i log T > M^20$ for $i < J$.
    The exponent $4 beta_i \/ 5$ is the margin left after paying for all $n_i$ continuations.
    By Lemma 10, the joint entropy bound and this common cost imply
  #[#set math.equation(numbering: n => "(6.16)")
   $ bb(E)_(p \, pi) #scale(x: 120%, y: 120%)[\[] log p - H \( Y med mod med pi divides cal(H) \)
     #scale(x: 120%, y: 120%)[\]] lt.eq #scale(x: 120%, y: 120%)[\(] e^(- c M^3) +
     kappa_i #scale(x: 120%, y: 120%)[\)] L_(*) . $ <eq:coverage-conditional-deficit>]
  ===== 6.4.3 Checking the transfer inequalities. <checking-the-transfer-inequalities.>
  In Theorem 11 take
  $ \( tau \, delta \, tau' \, beta \, beta' \, eta \, eta' \) = \( tau_i \, delta_i \, tau_(i + 1) \, beta_i \,
    beta_(i + 1) \, eta_i \, eta_(i + 1) \) . $
  The induction hypothesis supplies the conditional coverage at every exact value of $A$.
    Equation (6.10) supplies its joint entropy input with $epsilon.alt_i = e^(- c M^3)$. The parameter estimates give
  $ epsilon.alt_i + kappa_i lt.eq eta_i delta_i beta_(i + 1) \/ 16 \, wide eta_(i + 1) = eta_i delta_i \/ 100 \, $
  for sufficiently large $M$, which are the two entropy budget requirements.
    For its concentration requirement, $p lt.eq 2 T$ gives
  $ n_i p^(- beta_i) gt.eq 2^(- beta_i) T^(beta_i \/ 5) gt.eq 1 / 2 exp \( M^20 \/ 5 \) . $
  It follows that $delta_i^2 n_i p^(- beta_i) \/ 2 gt.eq exp \( M^20 \/ 5 - O \( M \) \)$.
    This quantity dominates both $log p lt.eq 1.05 thin 100^M + log 2$ and $log \( 100 \/ delta_i \) = O \( M \)$.
    Consequently
  $ p exp \( - delta_i^2 n_i p^(- beta_i) \/ 2 \) lt.eq delta_i \/ 100 . $
  The two remaining inequalities are
  $ delta_i^(- 1) < p^(beta_(i + 1) \/ 2) \, wide log \( 2 e \/ delta_i \) lt.eq \( beta_(i + 1) \/ 4 \) log T . $
  They follow from $log \( 1 \/ delta_i \) = O \( M \)$ and $beta_(i + 1) log T > M^20 \/ 2$.
    All hypotheses of Theorem 11 now hold. It proves coverage at $A_i = a$, and this start was arbitrary.
    Downward induction establishes the proposition uniformly over the whole schedule. ◻
]

At $A_0$, the conclusion gives mass at least $1 \/ \( 4 p \)$ outside fewer than $p^(199 \/ 200)$ residues for at
  least $99 %$ of the signed primes, from every exact start.
  The next section will use this coverage and the common terminal-time law to test candidate starting residues
  under zero avoidance. There the repeated tests will be independent conditional on residue vectors,
  whose laws mix exact starts; that conditioning will be treated separately.

== 7 Zero avoidance costs information <sec:information>

The sampling and coverage results hold for every self-avoiding walk with step bound $D$.
  We now assume that the walk lies in $cal(A) \( cal(P)_M \)$,
  where $cal(P)_M$ is the union of the prime batches in (6.1).
  Thus it avoids zero modulo both factors of every selected rational prime.
  This restriction forces short words of increments to reveal information about the starting residues.
  The purpose of this section is to quantify that information at the common terminal time $t_(*)$.

For each batch $T$, choose independently a uniform subset of $q_T$ rational primes, with independent fair signs.
  Denote all these auxiliary choices by $cal(C)$. They are independent of the walk-sampling experiment.
  Entropies below are always computed with $cal(C)$ fixed; an expectation $bb(E)_(cal(C))$ averages the resulting
  entropies and does not include the choices as part of the random data.

For a nonnegative integer time $t$, write

$ W_L \( t \) = \( z_(t + 1) - z_t \, dots.h \, z_(t + L) - z_(t + L - 1) \) $

for the next $L$ increments. Each letter has at most $K_D$ possible values. Use the dyadic lengths

$ L_T = 2^(floor.l log_2 \( T^(2 \/ 5) \) floor.r) \, wide 1 / 2 T^(2 \/ 5) < L_T lt.eq T^(2 \/ 5) . $

These lengths are short enough that a word cannot hit one residue twice modulo a factor of norm $p
  in \[ T \, 2 T \]$, yet long enough that the displacement from $A_0 \( T \)$ has negligible entropy compared
  with the information in the word. Their dyadic form will let us partition longer words into shorter ones in Section 8.

Let $X'_T$ be the selected residue vector of batch $T$ at $z_(t_(*))$,
  and let $O'_T$ contain the selected residues of all smaller batches at that same point.

#thm([Proposition 7.1.])[
  (Information cost of one batch).  #emph[There is a constant $c_1 > 0$,
    depending only on the fixed schedule parameters, such that for all sufficiently large $M$ and every batch in (6.1),
#[#set math.equation(numbering: n => "(7.1)")
 $ 1 / L_T thin bb(E)_(cal(C)) I #scale(x: 120%, y: 120%)[\(] X'_T \;
   W_(L_T) \( t_(*) \) divides O'_T #scale(x: 120%, y: 120%)[\)] gt.eq frac(c_1, log T) . $ <eq:information-rate>]

 The threshold for $M$ is uniform over all infinite self-avoiding $D$-step walks in $cal(A) \( cal(P)_M \)$.]
] <prop:information-rate>

#proof[
  Fix a batch, and abbreviate $L = L_T$, $q = q_T$, and $A_0 = A_0 \( T \)$.
    Let $X$ be this batch’s selected residue vector at $z_(A_0)$,
    and let $O$ contain the selected residues of all smaller batches at $z_(A_0)$.
    Their counterparts at $z_(t_(*))$ are $X' \, O'$. Put
  $ s = z_(t_(*)) - z_(A_0) \, wide W = W_L \( t_(*) \) . $
  We will first show that repeated observations of $\( s \, W \)$ reveal a fixed fraction of the entropy of $X$
    left after $O$ is known. Then we will charge the displacement entropy separately and move the result to
    $\( X' \, O' \, W \)$.
  By (6.4) and (6.5),
  #[#set math.equation(numbering: n => "(7.2)")
   $ bb(E)_(cal(C)) H \( X divides O \) gt.eq \( 1 - 2 e_0 \) q L_(*) . $ <eq:initial-conditional-entropy>]
  Indeed, $H \( X divides O \) gt.eq H \( X \) - H \( O \)$,
    and the logarithm of the alphabet size of $O$ is at most $e_0 c_0 T lt.eq e_0 q L_(*)$.
    The displacement estimate (6.9) gives
  #[#set math.equation(numbering: n => "(7.3)")
   $ H \( s \) = O_D \( T^(r_0) \) = O_D \( T^(1 \/ 4) \) . $ <eq:package-shift-entropy>]
  Here $s$ has the original schedule law, which is independent of $cal(C)$.
  ===== 7.1 Testing possible checkpoint residues. <testing-possible-checkpoint-residues.>
  Choose a sufficiently large fixed constant $K_0$, specified below, and set
  $ m_T = ⌈K_0 \( T \/ L \) log T⌉ . $
  For fixed $cal(C)$, first draw $\( O \, X \)$ with its original law.
    Conditional on those values, draw $m_T$ independent copies $P_a = \( s_a \, W^(\( a \)) \)$ of $\( s \, W \)$;
    write $P = \( P_1 \, dots.h \, P_(m_T) \)$. A conditional law at a value of $\( O \, X \)$ of probability zero
    may be chosen arbitrarily, since it does not affect this experiment.
    Each one-package marginal, together with $\( O \, X \)$, is the original schedule law.
  For a selected factor $pi$ of norm $p$, a candidate $x in bb(Z) \[ i \] \/ \( pi \)$ passes package $a$ if
  $ x + s_a + sum_(h = 0)^(l - 1) W_h^(\( a \)) equiv.not 0 med \( mod med pi \) wide \( 0 lt.eq l < L \) \, $
  where words are indexed from zero and the empty sum is zero.
    Let $cal(L)_pi \( P \)$ be the candidates that pass every package.
    The true coordinate $X_pi$ always belongs to this list: the package’s exact start has the prescribed residue
    $X_pi$, and its subsequent positions lie on the zero-avoiding walk.
    Thus, almost surely, these lists are nonempty, and
  #[#set math.equation(numbering: n => "(7.4)")
   $ H \( X divides O \, P \) lt.eq bb(E) sum_(pi upright(" selected")) log \| cal(L)_pi \( P \) \| .
     $ <eq:passing-list-entropy>]
  For each realized $\( O \, P \)$, the conditional support of $X$ is contained in the Cartesian product of these
    lists. No independence between the coordinates of $X$ is needed.
  ===== 7.2 Coverage after conditioning on residue data. <coverage-after-conditioning-on-residue-data.>
  The packages just constructed are independent given $\( O \, X \)$,
    whereas the continuations used in Proposition 13 were sampled from an exact checkpoint time.
    To connect these two experiments, fix $cal(C)$ and a value of $\( O \, X \)$ of positive probability.
    Its conditional package law is a mixture over the posterior exact times $a$ at $A_0$.
    At each such exact time the future law is the original continuation law:
    $\( O \, X \)$ is determined by the time and hence imposes no further condition on the fresh continuation
    randomness. More explicitly, if $K_a$ is the fresh continuation law of $\( s \, W \)$ from the exact time $a$,
    then for every set $E$ of packages,
  #[#set math.equation(numbering: n => "(7.5)")
   $ Pr { \( s \, W \) in E divides O \, X \, cal(C) } = sum_a Pr { A_0 = a divides O \, X \,
     cal(C) } thin K_a \( E \) . $ <eq:posterior-kernel>]
  The kernel $K_a$ does not depend on the auxiliary prime choices.
  Call a selected factor $pi$ #emph[favorable] for these residue data if the posterior probability that (6.14)
    holds at the exact $A_0$ start is at least $1 \/ 2$. Let $chi \( a \, pi \)$ indicate failure of coverage for
    $pi$ at the exact start $a$. An unfavorable coordinate has posterior bad probability greater than $1 \/ 2$,
    so its indicator is at most twice that probability. The tower property gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ bb(E)_(cal(C)) bb(E)_(O \, X) \# { upright("unfavorable selected coordinates") } & lt.eq
     2 bb(E)_(cal(C)) bb(E)_(O \, X) sum_(pi upright(" selected"))
     bb(E) \[ chi \( A_0 \, pi \) divides O \, X \, cal(C) \]\
 & = 2 bb(E)_(A_0) bb(E)_(cal(C)) sum_(pi upright(" selected")) chi \( A_0 \, pi \) lt.eq
   2 eta_0 q . $ <eq:unfavorable-fraction>]
  The prior law of $A_0$ is independent of $cal(C)$; its posterior law need not be.
    At each exact time, Proposition 13 bounds the fraction of bad signed primes by $eta_0$,
    and a uniform signed subset of size $q$ therefore contains at most $eta_0 q$ bad coordinates on average.
    This proves the last inequality.
  Fix a favorable coordinate and let $mu$ be the posterior law of its exact start.
    Write $G$ for the starts where coverage holds, so $mu \( G \) gt.eq 1 \/ 2$.
    At every $a in G$, translating the terminal residue law by $z_a med mod med pi$ gives
  $ Pr { s equiv - x med \( mod med pi \) divides A_0 = a } gt.eq tau_0 \/ p $
  for all but fewer than $p^(1 - beta_0)$ candidates $x$. Define
  $ u_x = mu {a in G : Pr { s equiv - x med \( mod med pi \) divides A_0 = a } gt.eq tau_0 \/ p} . $
  Averaging the exceptional-set sizes yields
  $ sum_(x in bb(Z) \[ i \] \/ \( pi \)) \( mu \( G \) - u_x \) < p^(1 - beta_0) . $
  If $u_x < 1 \/ 4$, the summand exceeds $1 \/ 4$. Consequently all but at most $4
    p^(1 - beta_0)$ candidates satisfy $u_x gt.eq 1 \/ 4$. We next show that each of these candidates is unlikely
    to survive all the packages.
  ===== 7.3 A short word supplies disjoint chances of rejection. <a-short-word-supplies-disjoint-chances-of-rejection.>
  For a candidate with $u_x gt.eq 1 \/ 4$, take an exact start counted by $u_x$.
    The smoothing estimate (6.2), applied at that start, shows for every $0 lt.eq l < L$ that
  $ Pr { z_(t_(*) + l) - z_(A_0) equiv - x med \( mod med pi \) divides A_0 = a } gt.eq tau_0 \/ \( 2 p \) . $
  Indeed $l lt.eq T_(+)$, and $T_(+)^(- 9) lt.eq tau_0 \/ \( 2 p \)$ for all batches once $M$ is sufficiently
    large. Mixing over the posterior starts gives hit probability at least $tau_0 \/ \( 8 p \)$ at each offset.
  For a single package, these $L$ hit events are disjoint. If two offsets hit,
    the two walk positions have equal residues modulo $pi$. Their difference is nonzero by self-avoidance,
    and hence has length at least $sqrt(p)$. Its length is also at most $D L < sqrt(p)$, since $L lt.eq
    T^(2 \/ 5)$ and $p gt.eq T$. This contradiction establishes disjointness.
    One conditional package therefore rejects the candidate with probability at least $c L \/ p$, where $c =
    tau_0 \/ 8$.
  Independence of the packages given $\( O \, X \)$ now yields, for every favorable coordinate,
  #[#set math.equation(numbering: n => "(7.7)")
   $ bb(E) \[ \| cal(L)_pi \( P \) \| divides O \, X \] lt.eq 4 p^(1 - beta_0) + p exp \( - c L m_T \/ p \) lt.eq
     5 p^(1 - beta_0) . $ <eq:passing-list-size>]
  Choose the fixed $K_0$ large enough for the second inequality; this is possible because $T lt.eq p lt.eq
    2 T$ and $L m_T \/ p gt.eq \( K_0 \/ 2 \) log T$. The choices and the lower threshold for $M$ are uniform in
    the residue data and the walk.
  By Jensen’s inequality, the expected logarithm of a favorable list’s size is at most $\( 1 - beta_0 \) log p +
    log 5$. For an unfavorable coordinate use $log p$. Equations (7.4)–(7.7) imply
  $ bb(E)_(cal(C)) H \( X divides O \, P \) & lt.eq \( 1 - beta_0 \) q L_(*) + 2 eta_0 beta_0 q log \( 2 T \) + q log 5\
 & lt.eq \( 1 - beta_0 \/ 2 \) q L_(*) $
  for large $M$. Here $eta_0 = 1 \/ 100$, $L_(*) gt.eq log T$, and $log 5 \/ L_(*) arrow.r 0$.
    Subtracting this bound from (7.2) and using $e_0 = beta_0 \/ 50$, we obtain
  #[#set math.equation(numbering: n => "(7.8)")
   $ bb(E)_(cal(C)) I \( X \; P divides O \) gt.eq \( beta_0 \/ 3 \) q L_(*) . $ <eq:package-information-lower>]
  Repeated tests have thus exposed a fixed fraction of the checkpoint residue entropy.
    It remains to place the cost in the terminal word itself, since only terminal words will enter the common budget.
  ===== 7.4 Transporting the information to the terminal time. <transporting-the-information-to-the-terminal-time.>
  For fixed $cal(C)$, conditional independence gives
  $ I \( X \; P divides O \) & = H \( P divides O \) - sum_(a = 1)^(m_T) H \( P_a divides O \, X \)\
 & lt.eq sum_(a = 1)^(m_T) I \( X \; P_a divides O \) = m_T I \( X \; s \, W divides O \) . $
  There are two costs in removing the displacement. First, $I \( X \; s divides O \) lt.eq H \( s \)$.
    Second, given the full Gaussian-integer displacement $s$,
    residue addition is a bijection between $\( O \, X \)$ and $\( O' \, X' \)$, so
  $ I \( X \; W divides O \, s \) = I \( X' \; W divides O' \, s \) . $
  For any finite variables,
  $ I \( A \; B divides C \, S \) - I \( A \; B divides C \) = I \( A \; S divides B \, C \) -
    I \( A \; S divides C \) lt.eq H \( S \) . $
  Removing the conditioning on $s$ therefore costs at most another $H \( s \)$. In total,
  #[#set math.equation(numbering: n => "(7.9)")
   $ I \( X \; s \, W divides O \) lt.eq I \( X' \; W divides O' \) + 2 H \( s \) . $ <eq:translate-information>]
  The one-package marginal is the original schedule law. Thus the variables on the right are precisely $X'_T \,
    O'_T \, W_(L_T) \( t_(*) \)$, under the same terminal law as for every other batch.
  Finally, $q L_(*) gt.eq c_0 T$ and $m_T lt.eq 2 K_0 \( T \/ L \) log T$ for large $T$.
    Equations (7.8), (7.9), and (7.3) give
  $ bb(E)_(cal(C)) I \( X' \; W divides O' \) gt.eq frac(beta_0 c_0, 6 K_0) frac(L, log T) - O_D \( T^(1 \/ 4) \) . $
  Since $T^(1 \/ 4) = o \( L \/ log T \)$, this proves (7.1) with, for example, $c_1 = beta_0 c_0 \/ \( 12 K_0 \)$. ◻
]

== 8 The common-law entropy budget <sec:budget>

Each batch now charges a positive amount of information to an increment word.
  We must show that these charges can be added, despite the different word lengths.
  The residue vectors will be nested in increasing batch order.
  Knowing the earlier increments updates the residue vector to the start of each new block,
  while the smoothing of $t_(*)$ compares that block’s law with the law at $t_(*)$.
  These two facts make the entropy differences telescope.

#thm([Lemma 8.1.])[
  (A common-law entropy telescope).  #emph[For every fixed collection $cal(C)$ of prime choices,
#[#set math.equation(numbering: n => "(8.1)")
 $ sum_T frac(I \( X'_T \; W_(L_T) \( t_(*) \) divides O'_T \), L_T) lt.eq log K_D + o \( 1 \) \,
   $ <eq:information-telescope>]

 where the error tends to zero uniformly over the choices and the walks as $M arrow.r oo$.]
] <lem:telescope>

#proof[
  Order the batches as $T_1 < dots.h.c < T_(n_B)$, and put $L_j = L_(T_j)$.
    For every time $t$, let $Q_j \( t \)$ contain all selected residues from batches through $T_j$ at $z_t$;
    let $Q_0$ be empty. Define
  $ a_j = frac(H \( W_(L_j) \( t_(*) \) divides Q_(j - 1) \( t_(*) \) \), L_j) \, wide b_j =
    frac(H \( W_(L_j) \( t_(*) \) divides Q_j \( t_(*) \) \), L_j) . $
  The $j$-th charge is $a_j - b_j$. We claim that the initial entropy rate for batch $j + 1$ is bounded,
    up to a small error, by the remaining rate $b_j$ after batch $j$.
  Both lengths are powers of two and $L_j lt.eq L_(j + 1)$, so $L_j$ divides $L_(j + 1)$.
    Partition the longer word into blocks of length $L_j$. For a block starting at offset $a$,
    $Q_j \( t_(*) \)$ and the preceding increments determine $Q_j \( t_(*) + a \)$,
    by adding their sum in every residue coordinate. The entropy chain rule, followed by removal of conditioning, gives
  $ H \( W_(L_(j + 1)) \( t_(*) \) divides Q_j \( t_(*) \) \) lt.eq sum_(0 lt.eq a < L_(j + 1)\
L_j divides a) H \( W_(L_j) \( t_(*) + a \) divides Q_j \( t_(*) + a \) \) . $
  Both the block and its starting residue vector are deterministic functions of the starting time on the fixed
    walk. By (6.2), their joint law at $t_(*) + a$ differs from that at $t_(*)$ in total variation by at most
    $T_(+)^(- 9)$, since $a < L_(j + 1) lt.eq T_(+)^(2 \/ 5) lt.eq T_(+)$.
    This is approximate invariance of the sampled time law; no stationarity of the walk is assumed.
  The logarithm of the full residue alphabet is at most
  $ sum_T k_T log \( 2 T \) = O \( T_(+) \) \, $
  by (3.1) and geometric spacing of the batches. The block alphabet contributes at most $L_j log K_D =
    O_D \( T_(+) \)$. Lemma 5 therefore gives, uniformly in the block and in $cal(C)$,
  $ H \( W_(L_j) \( t_(*) + a \) divides Q_j \( t_(*) + a \) \) & lt.eq
    H \( W_(L_j) \( t_(*) \) divides Q_j \( t_(*) \) \) + epsilon.alt_M \,\
epsilon.alt_M & = O_D \( T_(+)^(- 7) \) . $
  Indeed the continuity bound is $2 h \( T_(+)^(- 9) \) + O_D \( T_(+)^(- 8) \)$,
    which is smaller than the displayed error for sufficiently large $M$.
    Dividing the block sum by $L_(j + 1)$ now yields
  $ a_(j + 1) lt.eq b_j + epsilon.alt_M \/ L_j lt.eq b_j + epsilon.alt_M . $
  There are $n_B = O \( log T_(+) \)$ batches, so
  $ sum_(j = 1)^(n_B) \( a_j - b_j \) lt.eq a_1 - b_(n_B) + \( n_B - 1 \) epsilon.alt_M lt.eq log K_D + o \( 1 \) . $
  Here $b_(n_B) gt.eq 0$, and the $K_D$-letter increment alphabet gives $a_1 lt.eq log K_D$. ◻
]

This telescope is methodologically related to Tao’s entropy-decrement argument [12] Section 3,
  Equation (40) and Lemma 17: approximate translation invariance and conditional block subadditivity limit
  accumulated information. Here the information charges arise from zero avoidance across nested prime batches,
  and the preceding proof establishes the required bound for our single terminal-time law.

#proof[
  Fix $D$ and all schedule constants. Suppose that, for a given sufficiently large $M$,
    an infinite self-avoiding $D$-step walk lies in $cal(A) \( cal(P)_M \)$.
    Averaging Lemma 15 over $cal(C)$ and applying Proposition 14 gives
  #[#set math.equation(numbering: n => "(8.2)")
   $ c_1 sum_T frac(1, log T) lt.eq log K_D + o \( 1 \) . $ <eq:final-information-bound>]
  For each $ceil.l M \/ 2 ceil.r lt.eq m lt.eq M$, the interval $\[ X_m \, 1.05 X_m \]$ contains at least $c
    X_m \/ log B$ of the numbers $log T = j log B$, for an absolute $c > 0$ and all sufficiently large $M$.
    Its contribution to the sum in (8.2) is at least $c \/ \( 1.05 log B \)$.
    There are order $M$ such disjoint intervals. Their total contribution tends to infinity, whereas $c_1$, $B$,
    and $K_D$ are fixed. This contradicts (8.2) once $M$ is sufficiently large.
  Every estimate and every lower threshold for $M$ is uniform over the hypothetical avoiding walks.
    Choose one such $M$, depending only on $D$, and set $cal(P)_D = cal(P)_M$.
    This is one finite set of rational primes, with both factors imposed in $cal(A) \( cal(P)_D \)$,
    for which no infinite avoiding walk exists. The auxiliary signed subsets were used only to average the
    information inequalities; they do not make the final sieve depend on the walk.
    This proves Theorem 2 and supplies the input to the periodicity argument in Section 2. ◻
]

#heading(level: 1)[References]
#bibitem([1])[S. Boucheron, G. Lugosi, and P. Massart, #emph[Concentration Inequalities:
  A Nonasymptotic Theory of Independence], Oxford University Press, Oxford, 2013.
  #link("https://doi.org/10.1093/acprof:oso/9780199535255.001.0001").]
#bibitem([2])[K. Conrad, #emph[The Gaussian Integers], expository notes.
  #link("https://kconrad.math.uconn.edu/blurbs/ugradnumthy/Zinotes.pdf") (accessed 27 September 2026).]
#bibitem([3])[T. M. Cover and J. A. Thomas, #emph[Elements of Information Theory], second edition,
  Wiley-Interscience, Hoboken, NJ, 2006. #link("https://doi.org/10.1002/047174882X").]
#bibitem([4])[P. Erdős, Problems and results on combinatorial number theory III,
  in #emph[Number Theory Day] (Rockefeller University, New York, 1976), Lecture Notes in Mathematics, vol.~626,
  Springer, Berlin, 1977, pp.~43--72. #link("https://www.renyi.hu/~p_erdos/1977-27.pdf").]
#bibitem([5])[E. Gethner and H. M. Stark, Periodic Gaussian moats,
  #emph[Experimental Mathematics] #strong[6] (1997), no.~4, 289--292.
  #link("https://doi.org/10.1080/10586458.1997.10504616").]
#bibitem([6])[E. Gethner, S. Wagon, and B. Wick, A stroll through the Gaussian primes,
  #emph[American Mathematical Monthly] #strong[105] (1998), no.~4, 327--337.
  #link("https://doi.org/10.1080/00029890.1998.12004889").]
#bibitem([7])[L. H. Harper, Optimal assignments of numbers to vertices,
  #emph[Journal of the Society for Industrial and Applied Mathematics] #strong[12] (1964), no.~1, 131--135.
  #link("https://doi.org/10.1137/0112012").]
#bibitem([8])[A. Hatcher, #emph[Algebraic Topology], Cambridge University Press, Cambridge, 2002.
  #link("https://pi.math.cornell.edu/~hatcher/AT/ATpage.html").]
#bibitem([9])[W. Hoeffding, Probability inequalities for sums of bounded random variables,
  #emph[Journal of the American Statistical Association] #strong[58] (1963), no.~301, 13--30.
  #link("https://doi.org/10.1080/01621459.1963.10500830").]
#bibitem([10])[G. Lugosi, #emph[Concentration-of-measure inequalities], lecture notes, June 25, 2009.
  #link("https://www.upf.edu/documents/298368705/0/anu.pdf/7c62a169-bd53-4c93-b192-d1a75373ce40?t=1745790909783")[Author-hosted
  lecture notes].]
#bibitem([11])[A. Selberg, An elementary proof of the prime-number theorem for arithmetic progressions,
  #emph[Canadian Journal of Mathematics] #strong[2] (1950), 66--78. #link("https://doi.org/10.4153/CJM-1950-007-5").]
#bibitem([12])[T. Tao, The logarithmically averaged Chowla and Elliott conjectures for two-point correlations,
  #emph[Forum of Mathematics, Pi] #strong[4] (2016), e8, 36 pp. #link("https://doi.org/10.1017/fmp.2016.6").]
#bibitem([13])[N. Tsuchimura, Computational results for Gaussian moat problem,
  #emph[IEICE Transactions on Fundamentals of Electronics, Communications and Computer Sciences] #strong[E88-A]
  (2005), no.~5, 1267--1273. #link("https://doi.org/10.1093/ietfec/e88-a.5.1267").]
#bibitem([14])[I. Vardi, Prime percolation, #emph[Experimental Mathematics] #strong[7] (1998), no.~3, 275--289.
  #link("https://doi.org/10.1080/10586458.1998.10504373").]
