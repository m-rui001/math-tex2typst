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

#align(center)[#text(size: 16pt, weight: "bold")[A Torsion-Free Group Algebra with Zero Divisors]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Kaplansky’s zero-divisor conjecture asserts that $K \[ G \]$ has no nonzero zero divisors whenever $K$ is a field
  and $G$ is torsion-free. Here $K \[ G \]$ is the algebra of finite formal sums of elements of $G$,
  with multiplication extended bilinearly from the group law. We prove the following negative resolution.

#thm([Theorem 1.1.])[
  #emph[There exist a finitely presented torsion-free group $G$ and nonzero elements $alpha \,
    beta in bb(F)_2 \[ G \]$ such that $alpha beta = 0$. Moreover,
    $G$ admits a finite two-dimensional classifying space.]
] <thm:main>

=== History and related constructions <history-and-related-constructions>

The question goes back to Higman’s 1940 thesis #cite(label("Higman1940Thesis"));
  its conjectural formulation is reproduced by Sandling #cite(label("Sandling1981")) p. 112.
  It was also posed in Kaplansky’s 1956 conference contribution,
  published in 1957 #cite(label("Kaplansky1957")) Problem 6;
  see the historical discussion in #cite(label("Gardam2021")).
  Finite-order elements give elementary zero divisors: if $g$ has order $m > 1$,
  then $\( 1 - g \) \( 1 + g + dots.h.c + g^(m - 1) \) = 0$.
  The conjecture asks whether removing this obstruction suffices.

Substantial positive results explain why torsion-freeness is a natural dividing line.
  Higman proved the domain conclusion for groups in which every nontrivial subgroup maps onto
  $bb(Z)$ #cite(label("Higman1940")) Section 4, Theorems 12–13.
  Kropholler, Linnell, and Moody established it for torsion-free elementary amenable groups,
  even with division-ring coefficients #cite(label("KrophollerLinnellMoody1988")) Theorem 1.4.
  More recently, Fisher and Sánchez-Peralta obtained division-ring embeddings for group algebras of torsion-free
  virtually compact special groups and torsion-free compact $3$-manifold groups,
  and the domain conclusion for torsion-free $3$-manifold groups without a finite-generation
  assumption #cite(label("FisherSanchezPeralta2026")) Theorem 1.3 and Corollary 1.5.
  These results concern particular classes of groups; our construction uses a different geometric mechanism.

A group has the #emph[unique-product property] if, for every pair of finite nonempty subsets $P \, Q$,
  some element of $P Q$ has exactly one expression $p q$ with $p in P$, $q in Q$.
  Applying this property to the supports of two nonzero group-algebra elements gives a nonzero product
  coefficient. Rips and Segev constructed torsion-free groups without unique
  product #cite(label("RipsSegev1987")); Steenbock supplied a graphical small-cancellation treatment of their
  construction #cite(label("Steenbock2015")). Mian and Siddique report a machine-checked non-unique-product
  witness for Gardam’s $tilde(A)_2$ lattice, taking torsion-freeness from Gardam rather than formalizing
  it #cite(label("MianSiddique2026")) Sections 1 and 7. Failure of unique product alone does not produce a zero
  divisor: over $bb(F)_2$, the relevant representation counts must be even, not merely greater than one.

The distinct #emph[unit conjecture] asks whether, for a torsion-free group $G$ and a field $K$,
  every unit of $K \[ G \]$ is a nonzero scalar multiple of a group element.
  Gardam disproved it over $bb(F)_2$ #cite(label("Gardam2021")) and subsequently over
  $bb(C)$ #cite(label("Gardam2024")); a nontrivial unit is not a zero divisor.

Mineyev developed product structures and sufficient geometric criteria for obtaining nontrivial zero divisors or
  units in torsion-free group algebras over $bb(F)_2$ #cite(label("Mineyev2024")) Theorem 27.
  Garg and Mineyev study these criteria through finite-support combinatorics and
  computation #cite(label("GargMineyev2025")) Theorems 1–3 and 16.
  Shin proves that the orientable no-fold, triple-girth route cannot succeed when both support sizes are at least
  two #cite(label("Shin2026")) Theorem 1.1 and Corollary 1.2;
  this obstruction does not address the arrangement-exclusion argument here.
  Our construction supplies its own coefficient cancellation, root separation,
  and torsion-freeness proofs rather than applying those geometric criteria.

=== The cancellation mechanism and the two safeguards <the-cancellation-mechanism-and-the-two-safeguards>

We use two finite graphs $Gamma_A \, Gamma_B$ immersed into one rose $F$,
  a graph with one vertex and one edge for each generator. Every edge is read with a signed label,
  reversed when its orientation is reversed. Choose roots $x_A \, x_B$, and let $A' \,
  B'$ be the full vertex sets of their connected components.
  Attach an abstract cone on each graph component along its labelled map to $F$, obtaining a complex $X$,
  and put $G = pi_1 \( X \)$. Coning kills the labels of all closed graph paths.
  Thus a path from $x_A$ to $x in A'$ has a well-defined label $g_x in G$, independent of the chosen path;
  define $h_y$ from $x_B$ to $y in B'$ in the same way. The proposed factors are

#[#set math.equation(numbering: n => "(1.1)")
 $ alpha = sum_(x in A') g_x \, wide beta = sum_(y in B') h_y^(- 1) quad
   upright("in ") bb(F)_2 \[ G \] . $ <eq:overview-factors>]

Let $S_x$ and $S_y$ be the outgoing signed-label sets. We prescribe them so that $\| S_x ∩
  S_y \|$ is odd for every pair. Form a graph on $A' times B'$ by simultaneous steps of a common label $t$.
  Along each step the product is unchanged, since

#[#set math.equation(numbering: n => "(1.2)")
 $ \( g_x t \) \( h_y t \)^(- 1) = g_x h_y^(- 1) . $ <eq:overview-common-step>]

Every vertex of this finite graph has odd degree $\| S_x ∩ S_y \|$.
  Hence each connected component has even cardinality, by the degree-sum formula.
  Its vertices all contribute the same group element to $alpha beta$,
  so their contributions cancel in characteristic two.

This simple cancellation leaves two substantial safeguards. First, both factors must survive in the quotient:
  we prove that a path from either prescribed root to any different vertex in its component has nontrivial label.
  The root is then the only contributor to the identity coefficient in each factor, so both are nonzero.
  We do not need to distinguish labels of two non-root vertices. Second, the quotient group must be torsion-free:
  we prove that $X$ is aspherical, making it a finite two-dimensional classifying space and ruling out torsion.
  Both safeguards will follow by excluding certain planar configurations of paired path occurrences.

=== From random graphs to topological control <from-random-graphs-to-topological-control>

The outgoing-label types use lines in a finite projective plane together with three extra letters.
  Their cross-intersections force parity, while their turn frequencies satisfy an exponentially decaying
  squared-word estimate. We convert this estimate into an exclusion of bounded systems of almost completely paired
  paths. Paths may traverse the same edge repeatedly; multiplicity stages keep track of those repeated uses,
  while nearly aligned blocks control comparisons of arbitrary subpaths.
  Multiplying numerical expectation bounds selects one stage with a small expected count,
  without asserting independence between stages.

The remaining obstacle is that a sphere can involve arbitrarily many paths of arbitrarily large total length.
  Lipton–Tarjan planar separation #cite(label("LiptonTarjan1979")) reduces each such configuration to a bounded
  system. Long boundaries are first split and closed at a controlled cost,
  and planar gap counting bounds the number of comparison intervals after localization.
  The proportion of unpaired positions allowed by the probabilistic estimate is fixed before the bounds on the
  number and lengths of paths. This order permits the same bounded class to detect every large spherical
  arrangement, rather than a union bound over all arrangement sizes.

Graphical small cancellation provides important antecedents for this strategy.
  Gromov’s random graphical presentations connect word-coincidence estimates with geometric
  control #cite(label("Gromov2003")); Ollivier and Gruber develop precise graphical criteria for graph embeddings
  and asphericity #cite(label("Ollivier2006")) #cite(label("Gruber2015")).
  Distinguishing genuinely different graph lifts from coincident lifts is central to these arguments and to
  Bereznyuk’s spherical-diagram approach #cite(label("Bereznyuk2019")).
  Here the prescribed vertex types and repeated traversals require a separate probability estimate,
  and the needed topology is proved directly by cone-picture surgery.
  We do not invoke a small-cancellation or $upright("CAT") \( 0 \)$ criterion for these graphs.

=== Conventions and proof structure <conventions-and-proof-structure>

All graphs are finite unless stated otherwise. A graph may initially have loops or parallel edges;
  both are counted in its girth. A signed alphabet $T$ has a fixed-point-free involution $t mapsto macron(t)$,
  with $macron(t)$ denoting the inverse letter. The rose $F$ has one vertex and one unoriented edge for each
  inverse pair. A labelled graph maps immersively to $F$ when each outgoing label occurs at most once at each
  vertex. An #emph[immersed path] is an edge path with no immediate reversal;
  a closed path is #emph[cyclically immersed] if this also holds at its last/first junction.
  Length always counts edge traversals, including repetitions.

Section 2, Section 3 construct the random graphs and rule out bounded patterns.
  4 extracts such a pattern from every reduced spherical arrangement.
  5 explains why either an essential sphere or a trivial label on a path from a prescribed root to a different
  vertex would produce such an arrangement. 6 uses the resulting asphericity and root separation to complete the
  factor construction and prove 1. All logarithms are natural.
  Constants in asymptotic estimates are independent of the sampling size $n$;
  additional fixed parameters on which they depend will be indicated.

== 2 Prescribed types and random matchings <sec:types>

We construct the two immersed graphs so that their outgoing-label sets have odd cross-intersections,
  the condition needed for cancellation. The same vertex types also provide a squared-word decay estimate.
  Conditioning the matchings on large girth will preserve enough control to prove a diameter bound and, in 3,
  exclude the path configurations that could defeat the geometric safeguards.

=== 2.1 The finite geometry <the-finite-geometry>

Fix

$ q = 128 \, wide v = q^2 + q + 1 = 16513 \, wide p = frac(q + 1, v) . $

The projective plane over $bb(F)_q$ has $v$ points and $v$ lines.
  Each line has $q + 1$ points, each point lies on $q + 1$ lines, two distinct points lie on one common line,
  and two distinct lines meet at one point. These facts follow by counting one- and two-dimensional subspaces of
  $bb(F)_q^3$.

Let $T$ consist of its $v$ points, called #emph[ordinary letters], and three further #emph[extra letters].
  Pair the extras with three distinct ordinary letters, and pair the remaining ordinary letters arbitrarily in
  twos. This defines a fixed-point-free involution on $T$, since $v - 3$ is even.
  In particular, $\| T \| = 16516$, and the corresponding rose has $8258$ edges.

Take disjoint vertex sets $A \, B$, each of size $n$. For each vertex $x$,
  prescribe a set $S_x subset T$ of outgoing labels as follows:

+ On either side the ordinary part of $S_x$ is a line, with every line represented equally often.
+ Within each line class on $A$, the extra part is each of the three two-element subsets with proportion $p \/
  2$ apiece, and is otherwise empty.
+ Within each line class on $B$, the extra part is all three extras with proportion $p$, and is otherwise empty.

These are exact empirical proportions. We take $n arrow.r oo$ through multiples of $2 v^2$,
  so all counts are integral. For example, at $n = 2 v^2$, each line class on $A$ has $129$ vertices of each
  double-extra type and $32639$ of the empty type; on $B$ it has $258$ of the triple-extra type and $32768$ of the
  empty type.

Every letter has frequency $p$ on each side. Two ordinary line parts meet in either $1$ or $q + 1 = 129$ points.
  An extra part on $A$ meets an extra part on $B$ in either $0$ or $2$ letters. Thus

#[#set math.equation(numbering: n => "(2.1)")
 $ \| S_x ∩ S_y \| med upright("is odd for every ") x in A \, med y in B . $ <eq:odd-intersections>]

Thus the parity condition is built into the types, independently of how their edges will be matched.
  The random choice can now be used entirely to control the geometry without risking this condition.

Choose two vertices $x_A in A$ and $x_B in B$ in advance. For $Y = A \, B$, write

$ Y_t = { x in Y : t in S_x } \, wide \| Y_t \| = n p . $

For each inverse pair, choose a bijection $Y_t arrow.r Y_(macron(t))$,
  using its inverse for the opposite direction. A matched pair gives an edge labelled $t$ in one direction and
  $macron(t)$ in the other. Do this independently for all inverse pairs and both sides before any conditioning.
  The resulting graphs are denoted

$ Gamma_A \, quad Gamma_B \, wide Gamma = Gamma_A union.sq Gamma_B . $

They immerse into $F$, since every outgoing letter occurs once at each vertex that carries it.
  Their degrees lie between $q + 1$ and $d_(*) = q + 4 = 132$.
  A prescription for one matching edge can be described using either orientation.
  Whenever prescriptions are counted, an edge and its reverse describe a single prescription.

=== 2.2 Turn weights <turn-weights>

For a non-cancelling turn $t \, u$, let $w \( t \, u \)$ be the frequency of $u$ among the vertices of $B$ that
  contain $macron(t)$. Put $w \( t \, macron(t) \) = 0$. The corresponding conditional frequency on $A$ is at most
  $w \( t \, u \)$. Indeed, for distinct $macron(t) \, u$, the weights on $B$ are

$ \( macron(t) \, u \) & upright("ordinary, ordinary") & upright("ordinary, extra") & upright("extra, extra")\
w \( t \, u \) & 1 \/ \( q + 1 \) & p & 1 . $

The mixed entry is symmetric; the extra-extra frequency on $A$ is $1 \/ 2$.
  In particular, every positive weight lies in $\[ 1 \/ 129 \, 1 \]$.

For a word $W = t_1 dots.h.c t_h$, define

#[#set math.equation(numbering: n => "(2.2)")
 $ P \( W \) = product_(i = 1)^(h - 1) w \( t_i \, t_(i + 1) \) . $ <eq:word-weight>]

Write $W^(- 1) = macron(t)_h dots.h.c macron(t)_1$. Equal letter marginals and symmetry of joint incidence give

#[#set math.equation(numbering: n => "(2.3)")
 $ w \( t \, u \) = w \( macron(u) \, macron(t) \) \, wide P \( W \) = P \( W^(- 1) \) . $ <eq:reversal-weight>]

For non-cancelling turns this follows by dividing the joint frequency of $macron(t) \, u$ by $p$;
  for cancelling turns both weights in the first equality are zero.

#thm([Lemma 2.1.])[
  #emph[There is a constant $delta > 0$ such that, for every sufficiently large $h$,
#[#set math.equation(numbering: n => "(2.4)")
 $ sum_(W in T^h) P \( W \)^2 lt.eq e^(- 2 delta h) . $ <eq:squared-words>]

]
] <lem:squared-words>

#proof[
  Let $M_(t \, u) = w \( t \, u \)^2$, and set $f \( t \) = 5$ if $macron(t)$ is extra and $f \( t \) =
    1$ otherwise. There are precisely three states of weight five.
  If $macron(t)$ is ordinary, the ordinary successors different from $macron(t)$ contribute
    $\( v - 1 \) \/ \( q + 1 \)^2 = q \/ \( q + 1 \)$ before the weights $f$ are inserted.
    At most three such successors have their weight increased by four. The extra successors all have weight one. Hence
  $ \( M f \) \( t \) lt.eq frac(q, q + 1) + 3 p^2 + frac(12, \( q + 1 \)^2) = 500731261911 / 504183783481 < 149 /
    150 . $
  If $macron(t)$ is extra, the other two extras contribute two;
    the ordinary successors contribute at most $v p^2 + 12 p^2$. Thus
  $ frac(\( M f \) \( t \), f \( t \)) lt.eq frac(2 + v p^2 + 12 p^2, 5) = 820350863 / 1363395845 < 149 / 150 . $
  Consequently $M f lt.eq \( 149 \/ 150 \) f$. Since $upright(bold(1)) lt.eq f$ and $sum_t f \( t \) = 16528 < e^10$,
  $ sum_(W in T^h) P \( W \)^2 = upright(bold(1))^(sans(T)) M^(h - 1) upright(bold(1)) lt.eq
    16528 \( 149 \/ 150 \)^(h - 1) lt.eq e^(- h \/ 300) wide \( h gt.eq 3002 \) . $
  For example, $delta = 1 \/ 600$ is admissible. ◻
]

=== 2.3 Girth conditioning and switching <girth-conditioning-and-switching>

Fix a sufficiently small positive constant $c$, and put

$ L = floor.l c log n floor.r . $

It is enough that

#[#set math.equation(numbering: n => "(2.5)")
 $ c log \( 2 \| T \| \/ p \) < 1 \, wide 2 c log d_(*) < 1 \; $ <eq:c-choice>]

one may take $c = 1 \/ 100$. We work with the uniform tuple of matchings conditioned on $"girth" \( Gamma \) gt.eq
  L$. The next lemma both justifies this conditioning and gives a bound within the conditioned space.

#thm([Lemma 2.2.])[
  #emph[For all sufficiently large admissible $n$, there is a tuple of matchings with $"girth" \( Gamma \) gt.eq
    L$. In the uniform distribution on such tuples, condition further on any feasible set of $s$ prescribed
    matching pairs. The probability of an additional specified pair, not already prescribed in either direction,
    is at most
#[#set math.equation(numbering: n => "(2.6)")
 $ frac(1, n p - s - r_n) \, wide r_n = O \( d_(*)^(2 L + 2) \) = o \( n \) \, $ <eq:prescription-bound>]

 whenever the denominator is positive. The error $r_n$ can be chosen uniformly over all prescriptions.]
] <lem:prescriptions>

#proof[
  Before girth conditioning, a feasible simple cycle of length $k < L$ has at most $2 n^k \|
    T \|^k$ vertex-and-letter descriptions. Its distinct edges require $k$ distinct matching prescriptions,
    with probability at most $\( n p - k \)^(- k)$. Thus the expected number of edges lying on cycles shorter than
    $L$ is at most
  $ 2 sum_(k < L) k thin n^k \| T \|^k \( n p - k \)^(- k) lt.eq 2 sum_(k < L) k \( 2 \| T \| \/ p \)^k = o \( n \) $
  for sufficiently large $n$, by (2.5). Choose a tuple with $o \( n \)$ such #emph[bad edges].
  Let $x y$ be a bad edge, oriented with label $t$. Among the $n p$ edges for this inverse pair on the same side,
    choose an edge $u z$, also oriented with label $t$, that is not bad and whose endpoint set is at distance
    greater than $2 L$ from ${ x \, y }$. This is possible: bad edges exclude $o \( n \)$ choices,
    and the maximum-degree ball bound excludes another $O \( d_(*)^(2 L + 2) \) = o \( n \)$.
  Transpose the two matches, replacing $x y \, u z$ by $x z \, u y$.
    A short cycle using only one new edge would give an old path between the distant endpoint sets.
    If a short cycle uses both, deleting them leaves old paths pairing the endpoints as either
    $\( x \, u \) \, \( y \, z \)$ or $\( x \, y \) \, \( u \, z \)$. The first case again joins the distant sets.
    In the second, the $u$-to-$z$ path together with $u z$ is an old short cycle,
    contradicting the choice of $u z$. This includes $x = y$, when the $x$-to-$y$ path may have length zero.
    No short cycle is created. The chosen bad edge disappears, and the other removed edge was not bad,
    so the number of bad edges strictly decreases. Repetition produces a tuple of girth at least $L$.
  Now restrict to any feasible girth-conditioned set with $s$ previous prescriptions,
    and consider an additional compatible pair $x y$. If it is incompatible, its probability is zero.
    From every tuple containing $x y$, perform the same transposition with any sufficiently distant edge $u
    z$ of the same inverse pair and side that is not previously prescribed. All edges are now nonbad.
    At least $n p - s - r_n$ choices are available, with one uniform ball-size error $r_n$.
    Each output preserves girth and all prior prescriptions.
  Given an output and the pair $x y$ to restore, the inverse operation is unique:
    the current match of $x$ is $z$, and the current preimage of $y$ is $u$.
    Thus the map from a tuple containing $x y$, together with an admissible transposition,
    to its output tuple is injective. If $Omega_s$ is the conditioned set and $Omega_(s \, x y)$ is its subset
    containing $x y$, then
  $ \| Omega_(s \, x y) \| \( n p - s - r_n \) lt.eq \| Omega_s \| . $
  This proves (2.6). ◻
]

In particular, any feasible collection of $E = O \( L \)$ distinct edge prescriptions has conditional probability
  at most

#[#set math.equation(numbering: n => "(2.7)")
 $ \( n p \)^(- E) exp \( o \( L \) \) . $ <eq:few-edge-bound>]

This follows by applying 3 successively. Uniformity of its error is important;
  no independence after conditioning is asserted.

#thm([Lemma 2.3.])[
  #emph[With conditional probability tending to one, every connected component of $Gamma$ has diameter at most
    $D_0 L$, for a fixed constant $D_0$.]
] <lem:diameter>

#proof[
  Fix a small positive $rho$. On either side, require every vertex set of size $1 lt.eq k lt.eq
    rho n$ to grow to at least $2 k$ vertices on adjoining all its neighbors.
    A failure supplies a set of $2 k$ vertices containing at least
  $ r = ceil.l \( q + 1 \) k \/ 2 ceil.r $
  distinct edges: all edges incident to the failing $k$-set lie in the larger set and are counted at most twice by
    its degree sum.
  There are at most $\( C_1 n \/ k \)^(2 k)$ choices for the larger set.
    Its possible typed edge prescriptions number $O \( k^2 \)$;
    choosing an unordered $r$-subset costs at most $\( C_1 k \)^r$.
    Decrease $rho$ so that $r lt.eq n p \/ 3$ throughout the range.
    For sufficiently large $n$, 3 then bounds the probability of all $r$ prescriptions by
    $\( 2 \/ \( n p \) \)^r$. Hence the probability of a failure of size $k$, on either side,
    is at most a fixed multiple of
  $ \( C_1 n \/ k \)^(2 k) \( C_1 k \)^r \( 2 \/ \( n p \) \)^r lt.eq
    #scale(x: 120%, y: 120%)[\(] C_2 \( k \/ n \)^62.5 #scale(x: 120%, y: 120%)[\)]^k \, $
  because $64.5 lt.eq r \/ k lt.eq 65$. Choose $rho$ still smaller so that $C_2 rho^62.5 < 1 \/ 2$.
    Summing over $k lt.eq sqrt(n)$ gives $o \( 1 \)$; the sum over larger $k lt.eq rho n$ is at most $n 2^(- sqrt(n))$.
  On the resulting expansion event, every ball reaches more than $rho n$ vertices in $R = O \( log n \)$ steps.
    Along a geodesic, centers separated by $2 R + 1$ have disjoint radius-$R$ balls.
    At most $1 \/ rho$ such balls fit in one side. This bounds each component diameter by $O \( log n \) =
    O \( L \)$, with a fixed constant. ◻
]

== 3 A bounded-pattern estimate <sec:bounded-pattern>

All probabilities in this section refer to the distribution conditioned on $"girth" \( Gamma \) gt.eq L$.
  We retain the predetermined vertices $x_A$ and $x_B$. The possible rooted interval will accommodate a
  null-homotopy of a root-to-vertex path in 5.

Consider finitely many positive-length paths in $Gamma$, all cyclically immersed and closed except possibly one
  immersed interval path whose initial vertex is $x_A$ or $x_B$.
  An #emph[occurrence] means a position on one of these paths; different occurrences may traverse the same edge.
  A pairing by #emph[interval pairs] consists of disjoint occurrence intervals,
  paired in twos by length-preserving interval isometries. Even when the two intervals lie on the same path,
  they are distinct and disjoint as occurrence intervals. An order-preserving comparison requires equal signed
  letters, and an order-reversing comparison requires inverse letters in opposite orders.
  We impose the additional reduction condition

#[#set math.equation(numbering: n => "(3.1)")
 $ upright("paired occurrences traverse distinct underlying undirected
 edges of ") Gamma . $ <eq:edge-reduction>]

Positions outside the paired intervals are called #emph[unpaired].

#thm([Proposition 3.1.])[
  (Bounded-pattern estimate).  #emph[There is a constant $epsilon > 0$,
    depending only on the fixed types and turn weights, with the following property.
    For every fixed positive integer $K$, fixed real $C gt.eq 1$, and fixed nonnegative integer $I$,
    the conditional probability tends to zero that there exists a system as above having at most $K$ paths,
    total length $H$ with
$ L lt.eq H lt.eq C L \, $

 at most $I$ interval pairs, and $b$ unpaired occurrences, where $b lt.eq epsilon H$.
   In particular, $epsilon$ is chosen before $K \, C \, I$, and these three bounds are held fixed as $n$ tends to
   infinity through its admissible values.]
] <prop:bounded-pattern>

We first describe the actual image of a candidate system by boundedly many chains.
  Sorting its edges by traversal multiplicity gives stages whose total vertex exponent is nonpositive.
  Nearly aligned blocks turn the path pairings into word constraints controlled by the squared-word estimate.
  Together, these bounds make the product of the stage expectation bounds exponentially small.
  Every realization must occur at every stage, so one small expectation bound suffices for the union bound.

#proof[
  Fix $K \, C \, I$. Constants implicit in this proof may depend on these bounds,
    whereas the final choice of $epsilon$ will not. Every $o \( L \)$ or $o \( s \)$ estimate below is uniform
    over the patterns with these fixed bounds. Cutting comparison intervals at the chosen indexing starts of
    closed paths changes only a fixed bound on the number of interval pairs, so we make these cuts at the outset.
  By (2.3), reversing a chain does not change its word weight.
  === The image graph and multiplicity stages <the-image-graph-and-multiplicity-stages>
  Let $Delta$ be the actual image subgraph of a proposed system.
    It has at most $C L$ edges and girth at least $L$. Mark every path start and end,
    and every vertex whose degree in $Delta$ differs from two.
    We first show that $Delta$ consists of a bounded number of chains between marks,
    with disjoint unmarked degree-two interiors. A chain is allowed to return to its initial mark.
  Repeatedly delete leaves and their incident edges, and discard any edgeless remnants. This preserves cycle rank.
    Set aside the components of the resulting core that are circles; there are at most $C$,
    since each uses at least $L$ edges. Suppress all degree-two vertices in the remaining core.
    The resulting multigraph has minimum degree at least three; its edges have positive integer lengths,
    whose sum is at most $C L$. Suppose it has $r > 0$ edges.
    Start a non-backtracking walk uniformly on its $2 r$ directed edges,
    and at every subsequent step choose uniformly among the allowed continuations.
    Uniform measure on directed edges is stationary: a given directed edge with origin $z$ has $deg \( z \) -
    1$ allowed predecessors, each contributing $1 \/ \[ 2 r \( deg \( z \) - 1 \) \]$.
    This calculation also applies to loops and parallel edges, with degrees counted by half-edges.
  The expected expanded length of a walk of $k$ edges is therefore at most $k C L \/ r$.
    At least half of the probability lies on walks of expanded length at most $2 k C L \/ r$.
    Each particular walk has probability at most $\( 2 r \)^(- 1) 2^(- \( k - 1 \))$,
    so there are at least $r 2^(k - 1)$ such short walks. Choose $k =
    O \( log \( r + 1 \) \)$ so that this number exceeds $\( 2 r \)^2$.
    There are at most $\( 2 r \)^2$ ordered pairs of endpoint vertices.
    Two distinct short walks consequently have the same endpoints. Their expansions are distinct reduced paths.
    Their union contains a cycle, since in a tree there is only one reduced path between two specified vertices.
    That cycle has length at most $4 k C L \/ r$. Girth at least $L$ implies $r lt.eq 4 C k$,
    bounding $r$ in terms of $C$ alone. Thus the cycle rank of $Delta$ is bounded.
  The graph $Delta$ has no isolated vertices and has at most two leaves.
    Indeed, a cyclically immersed path cannot visit a leaf, and an immersed interval path can visit one only at an
    endpoint. If $beta$ is the cycle rank and $c_Delta$ the number of components, the degree-sum identity gives
  $ sum_(deg \( z \) gt.eq 3) \( deg \( z \) - 2 \) = 2 beta - 2 c_Delta + \# { z : deg \( z \) = 1 } . $
  It follows that the number and total degrees of branching vertices are bounded.
    There are also only boundedly many path-start and path-end marks. Every component contains a path start.
    Suppressing all remaining unmarked degree-two vertices now proves the asserted bound on the number of marked
    chains, including circle components.
  Every path traverses whole marked chains. Write $m_e$ for the total number of traversals of an undirected edge
    $e$ by all the paths; it is constant on each chain. If one immersed path traverses the same oriented edge
    twice, the gap between the two starting positions is at least $L$:
    the intervening segment is a nonempty reduced closed walk and hence contains a cycle.
    A path of length $h$ thus traverses any given oriented edge at most $h \/ L + 1$ times.
    Summing over paths and the two orientations yields
  #[#set math.equation(numbering: n => "(3.2)")
   $ m_e lt.eq 2 \( H \/ L + K \) lt.eq 2 \( C + K \) . $ <eq:entropy-multiplicity>]
  Consequently the total number of chain traversals is bounded as well.
  There are only polynomially many unlabelled patterns in $L$.
    To specify one, give the bounded marked multigraph, the positive integer length of each chain,
    the side $A$ or $B$ of each component, the oriented chain sequence of each path,
    the designation and starting side of the possible interval path,
    and the comparison endpoints and their orientation data. Each integer endpoint has $O \( L \)$ choices and
    there are boundedly many of them. We retain only patterns satisfying (3.1).
    Vertex names in $A$ and $B$, and signed edge labels, are not included in this description.
    Crucially, the abstract graph so described is the actual image graph:
    its subsequent realizations must be injective on vertices and edges.
  ===== 3.1 Multiplicity stages and vertex exponents. <multiplicity-stages-and-vertex-exponents.>
  The density-counting viewpoint of organizing constraints by multiplicity,
    discussed by Ollivier #cite(label("Ollivier2005")), motivates the stage organization and selection below.
    The conditioned matching estimate for the dependent graph paths in this model is developed locally.
  For $1 lt.eq j lt.eq m_(*) := max_e m_e$, let $Delta_j$ consist of all edges with $m_e gt.eq j$,
    together with their incident vertices. Denote its edge and vertex counts by $E_j$ and $V_j$.
    Let $iota$ be one if the interval path is present and zero otherwise. Then
  #[#set math.equation(numbering: n => "(3.3)")
   $ sum_(j = 1)^(m_(*)) E_j = H \, wide sum_(j = 1)^(m_(*)) V_j =
     sum_(z in Delta^(\( 0 \))) max_(e in.rev z) m_e lt.eq H + iota . $ <eq:entropy-incidences>]
  For the inequality, let $a \( z \)$ count interval-path endpoints at $z$, with multiplicity.
    At a vertex, all traversal incidences except these endpoints are coupled into passages between distinct
    half-edges, by immersion and cyclic immersion. Thus the incidences on a half-edge of maximum multiplicity must
    be coupled to incidences on other half-edges, except for at most $a \( z \)$ endpoints. Hence
  $ 2 max_(e in.rev z) m_e lt.eq sum_(upright("half-edges at ") z) m_e + a \( z \) . $
  Summing this inequality proves (3.3), because the half-edge sum is $2 H$ and $sum_z a \( z \) = 2 iota$.
  Set $k_1 = iota$, and $k_j = 0$ for $j > 1$. In stage one the initial vertex of the interval path has its
    prescribed image, saving one factor of $n$. We claim no such saving at later stages.
    The exponent needed below satisfies
  #[#set math.equation(numbering: n => "(3.4)")
   $ sum_(j = 1)^(m_(*)) \( V_j - E_j - k_j \) lt.eq 0 . $ <eq:entropy-n-exponent>]
  In the later realization count, the exponent $V_j - E_j -
    k_j$ will count vertex-image choices against edge-prescription costs.
    Equation (3.4) therefore controls the total power of $n$ across the multiplicity stages.
    The remaining task is to obtain exponential decay from the label constraints;
    counting only distinct edges would lose the incidence balance that makes these two estimates compatible.
  === Word constraints on aligned blocks <word-constraints-on-aligned-blocks>
  The aim is a common subdivision for which each comparison carries almost all positions of a block into a single
    partner block. Orient each marked chain of length $ell$, identify it with $\[ 0 \, ell \]$,
    and put its edge positions at half-integers. Splitting comparisons at chain-traversal boundaries gives
    boundedly many subcomparisons of the form
  $ x mapsto sigma x + a \, wide sigma in { 1 \, - 1 } \, quad a in bb(Z) . $
  These maps compare particular occurrences of subchains. Relative to the chosen chain orientations,
    their label relations are equality when $sigma = 1$ and inverse equality when $sigma = - 1$.
  Pad the list of integer offsets by zeros to a fixed length $d gt.eq 1$. Put
  $ N = ⌊L^(1 \/ \( 2 \( d + 1 \) \))⌋ \, wide R = floor.l sqrt(N) floor.r . $
  The simultaneous pigeonhole principle gives an integer $1 lt.eq u lt.eq
    N^d$ such that $"dist" \( u a \/ L \, bb(Z) \) lt.eq 1 \/ N$ for every offset $a$.
    For completeness, place the $N^d + 1$ vectors of fractional parts of $k \( a_1 \/ L \, dots.h \, a_d \/ L \)$,
    for $0 lt.eq k lt.eq N^d$, in the $N^d$ cubes of side $1 \/ N$.
    Subtracting two vectors in the same cube gives the required $u$.
    Choose the least such $u$, so all choices are determined by the unlabelled pattern, and set $s =
    L \/ \( u R \)$. Uniformly in that pattern,
  #[#set math.equation(numbering: n => "(3.5)")
   $ L / N^(d + 1 \/ 2) lt.eq s lt.eq L / R \, wide max_a "dist" \( a \/ s \, bb(Z) \) lt.eq R /
     N . $ <eq:entropy-grid>]
  In particular, $s$ tends to infinity at least as a fixed positive power of $L$,
    while $s \/ L$ and all the distances in (3.5) tend to zero.
  On each chain use the full grid intervals $\[ k s \, \( k + 1 \) s \)$ contained in $\[ 0 \, ell \]$,
    for integers $k gt.eq 0$. The half-integer edge positions in such an interval form a #emph[full block].
    Index these blocks over all of $Delta$ by $i$. Their lengths and multiplicities satisfy
  $ h_i = s + O \( 1 \) \, wide m_i = m_e quad upright("on their chains") . $
  The remaining end fragment of a chain has $O \( s + 1 \)$ positions.
    Every traversal of the same chain uses this same subdivision, also when read backwards.
  Here is the alignment consequence of (3.5), including reflections.
    Write $a = nu s + r$, with $nu in bb(Z)$ and $\| r \| = o \( s \)$.
    A translation sends the $k$-th real grid interval to the $\( k + nu \)$-th interval shifted by $r$.
    A reflection sends it to
  $ \( \( nu - k - 1 \) s + r \, \( nu - k \) s + r \] . $
  Because $a$ is integral, the isometry preserves the half-integer lattice.
    In either case its image overlaps the indicated partner grid block in a contiguous string of at least $s - \|
    r \| - 2 = s - o \( s \)$ positions. The reversed endpoint convention in the reflection costs only a bounded
    number of positions.
  Figure 1 illustrates the translation case. The grid belongs to the underlying chain,
    not to an individual path traversal: repeated traversals use the same blocks but give distinct block
    occurrences. This distinction will matter when occurrence pairings are projected to links between underlying blocks.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((2.55, 1.53), (5.1, 1.802), fill: rgb("#e0e0ff"), stroke: none)
  line((0, 1.666), (7.905, 1.666), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0, 1.445), (0, 1.887), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((2.55, 1.445), (2.55, 1.887), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((5.1, 1.445), (5.1, 1.887), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((7.65, 1.445), (7.65, 1.887), stroke: (thickness: 0.6pt, miter-limit: 10))
  content((2.55, 1.912), [#text(size: 9pt)[$"ks"$]], anchor: "south", padding: 0.1176cm)
  content((5.1, 1.912), [#text(size: 9pt)[$(k+1)s$]], anchor: "south", padding: 0.1176cm)
  content((-0.17, 1.666), [#text(size: 9pt)[source]], anchor: "east", padding: 0.1176cm)
  line((3.825, 1.402), (4.165, 0.816), stroke: (thickness: 0.6pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ")>", fill: black)))
  content((4.378, 1.105), [#text(size: 9pt)[$x arrow.r.bar x+ nu s+r$]], anchor: "west", padding: 0.1176cm)
  rect((2.89, 0.5525), (5.44, 0.8075), fill: rgb("#ffe8d1"), stroke: none)
  rect((2.89, 0.5525), (5.44, 0.8075), stroke: (paint: rgb("#b25a00"), thickness: 0.6pt, miter-limit: 10))
  content((2.72, 0.68), [#text(size: 9pt)[translated block]], anchor: "east", padding: 0.1176cm)
  rect((2.55, -0.119), (5.1, 0.153), fill: rgb("#e0e0ff"), stroke: none)
  rect((2.89, -0.119), (5.1, 0.153), fill: rgb("#a6a6ff"), stroke: none)
  line((0, 0.017), (7.905, 0.017), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0, -0.204), (0, 0.238), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((2.55, -0.204), (2.55, 0.238), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((5.1, -0.204), (5.1, 0.238), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((7.65, -0.204), (7.65, 0.238), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((2.89, -0.119), (2.89, 0.5525), stroke: (thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  line((5.44, 0.153), (5.44, 0.5525), stroke: (thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  content((-0.17, 0.017), [#text(size: 9pt)[target]], anchor: "east", padding: 0.1176cm)
  content((2.55, -0.238), [#text(size: 9pt)[$(k+ nu )s$]], anchor: "north", padding: 0.1176cm)
  content((5.1, -0.238), [#text(size: 9pt)[$(k+ nu +1)s$]], anchor: "north", padding: 0.1176cm)
  line((2.89, -0.8925), (5.1, -0.8925), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((3.995, -0.952), [#text(size: 9pt)[overlap $s-r$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: Approximate alignment under a translation, shown schematically with $0 < r = o \( s \)$. A source block is translated by $a = nu s + r$; its image overlaps the indicated target block in real length $s - r$. Restricting to half-integer edge positions loses at most a bounded number of positions, giving $s - o \( s \)$ compared letters. The shift is exaggerated for visibility. The proof also treats negative shifts and reflections. ],
  ) <fig:block-alignment>
  Join two full-block occurrences whenever one of the subcomparisons identifies contiguous subwords in them of
    length at least $\( 1 - kappa \) s$, where $kappa = o \( 1 \)$ is chosen uniformly large enough to absorb the
    alignment and rounding errors. Record one such substring comparison with each join.
    These joins form a partial matching of block occurrences:
    each compared substring occupies more than half its block,
    whereas the original comparison domains are disjoint as occurrence intervals.
    Thus a block occurrence cannot participate in two joins.
  Let $b_(*)$ be the number of unmatched full-block occurrences.
    Only boundedly many blocks lie within $3 s + O \( 1 \)$ of a subcomparison cut or a chain endpoint.
    Away from these cuts, a full block in a comparison domain has its partner full block and hence is matched.
    Every remaining unmatched block away from the cuts consists entirely of unpaired positions.
    There are $O \( L \/ s \)$ block occurrences in total, so rounding their lengths and charging the exceptional
    blocks gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ s b_(*) lt.eq b + O \( s + L \/ s \) = b + o \( L \) . $ <eq:entropy-unmatched-blocks>]
  ===== 3.2 Links between underlying blocks. <links-between-underlying-blocks.>
  Forget occurrence indices in this matching, obtaining a multigraph whose vertices are the full blocks $i$.
    We call its edges #emph[links] and include isolated blocks.
    The substring positions and directions attached to every link are already fixed by the unlabelled pattern.
    In a component $cal(U)$ of this link graph, a word on any one block determines the word on each next block
    along a spanning tree except for $o \( s \)$ letters. Indeed, the recorded comparison specifies $s -
    o \( s \)$ letters of the next word, possibly with reversal and inversion.
    Since the alphabet is fixed, the number of extensions of a root word to all blocks in $cal(U)$ is at most
  #[#set math.equation(numbering: n => "(3.7)")
   $ exp #scale(x: 120%, y: 120%)[\(] o \( s \) \| cal(U) \| #scale(x: 120%, y: 120%)[\)] . $ <eq:entropy-propagation>]
  Additional links and immersion constraints can only reduce this number.
  If $cal(U)$ has a self-link, choose a self-linked block as the root.
    Its word has only $exp \( o \( s \) \)$ possibilities, or the pattern is infeasible.
    To prove this, first consider a translation self-link. Its constraints have the form
  $ W \( x \) = W \( x + t \) quad \( x in D \) \, $
  where $D$ and $D + t$ are contiguous subsets of the same block and $\| D \| = s - o \( s \)$.
    The integral shift $t$ is nonzero by (3.1); a zero shift would compare the same underlying edge with itself.
    On the $h_i$ positions of the block, the $\| D \|$ distinct constraint edges form a forest of arithmetic
    chains with step $\| t \|$. Thus this forest has $h_i - \| D \| = o \( s \)$ components,
    leaving at most $\| T \|^(h_i - \| D \|) = exp \( o \( s \) \)$ root words.
  For a reflection self-link, write its map as $phi.alt \( x \) = a - x$.
    The intersection $J = D ∩ phi.alt \( D \)$ of its nearly full domain and image is a contiguous
    reflection-invariant set with $\| J \| gt.eq 2 \| D \| - h_i > 0$.
    If $a$ is odd, its center is a half-integer position in $J$, forcing that letter to equal its inverse.
    If $a$ is even, the two half-integer positions on either side of its center are adjacent positions in $J$ and
    their letters must be inverse. The first alternative contradicts the fixed-point-free involution on $T$,
    and the second contradicts immersion. Thus reflection self-links are infeasible.
    Combining the translation bound with (3.7), a component with a self-link has at most
    $exp \( o \( s \) \| cal(U) \| \)$ full word assignments altogether.
  For any link component put
  $ S_(cal(U)) = sum_(i in cal(U)) m_i \, wide z_(cal(U)) = max_(i in cal(U)) m_i \, wide
    b_(cal(U)) = \# { upright("unmatched block occurrences in ") cal(U) } . $
  If $cal(U)$ has no self-link, then
  #[#set math.equation(numbering: n => "(3.8)")
   $ 2 z_(cal(U)) lt.eq S_(cal(U)) + b_(cal(U)) . $ <eq:entropy-link-balance>]
  Indeed, take a block of multiplicity $z_(cal(U))$. At least $z_(cal(U)) -
    b_(cal(U))$ of its occurrences are matched, and their partners are distinct occurrences of other blocks in the
    same component. There are only $S_(cal(U)) - z_(cal(U))$ such other occurrences.
    This proves (3.8), also for isolated blocks and in the presence of multiple links.
  ===== 3.3 Binning the word weights. <binning-the-word-weights.>
  For each full-block word $W_i$, read in its chain orientation, specify the integer
  $ d_i = floor.l - log P \( W_i \) floor.r . $
  We need only consider positive weights, since feasible block words are immersed.
    By Lemma 2, every such word of length $h$ has $P \( W \) lt.eq e^(- delta h)$ for all sufficiently large $h$.
    The smallest positive turn weight is a fixed positive number.
    Hence there is a constant $a_0 > 0$, depending only on the turn weights, such that for all large $L$,
  #[#set math.equation(numbering: n => "(3.9)")
   $ frac(delta s, 2) lt.eq d_i lt.eq a_0 s \, wide \# { W_i : floor.l - log P \( W_i \) floor.r = d_i } lt.eq
     exp \( 2 d_i - delta s \) . $ <eq:entropy-bins>]
  For the counting assertion, every word in the indicated bin contributes more than $e^(- 2 d_i - 2)$ to the sum
    of squared weights. The same lemma therefore bounds the number of these words by
  $ exp \( 2 d_i + 2 - 2 delta h_i \) lt.eq exp \( 2 d_i - delta s \) \, $
  using $h_i = s + O \( 1 \)$. This also explains why the bin estimate uses the squared,
    rather than the unsquared, word weights.
  Enlarge each unlabelled pattern by its bin integers. There are $O \( L \/ s \)$ blocks and $O \( s \)$ possible
    bin values per block, so the number of choices is at most
  $ exp #scale(x: 120%, y: 120%)[\(] O \( \( L \/ s \) log \( s + 1 \) \) #scale(x: 120%, y: 120%)[\)] =
    exp \( o \( L \) \) . $
  Together with the earlier polynomial count, the number of enlarged patterns is $exp \( o \( L \) \)$,
    uniformly for the fixed bounds.
  === Expected counts and stage selection <expected-counts-and-stage-selection>
  The block estimates now control feasible strings. We combine them with the matching-prescription estimate to
    count injective realizations of each multiplicity stage, keeping string extension distinct from graph
    embedding extension.
  Fix an enlarged pattern. A permitted label assignment on $Delta_j$ is the restriction of some label assignment
    on all of $Delta$ satisfying the bins, the immersion condition into the rose, and all original comparisons.
    This is a condition on strings: no embedding of the inactive part of $Delta$ in the sampled graph is required.
    Let $X_j$ count injective realizations of $Delta_j$, with these permitted labels and prescribed sides,
    and with the prescribed initial vertex in stage one if $iota = 1$.
    A realization of the entire path system gives $X_j gt.eq 1$ at every stage.
  For one fixed permitted stage label assignment, its expected number of vertex realizations is at most
  #[#set math.equation(numbering: n => "(3.10)")
   $ n^(V_j - E_j - k_j) exp (- sum_(i : m_i gt.eq j) d_i + o \( L \)) . $ <eq:entropy-fixed-label-expectation>]
  Here are the vertex and edge counts giving this bound. A chain is either entirely present or absent at stage
    $j$, because its multiplicity is constant. Let $Q_j$ be the number of active chains.
    There are $E_j - Q_j$ internal chain vertices. If such a vertex has incoming letter $t$ and outgoing letter
    $u$, then on its prescribed side it has at most $n p thin w \( t \, u \)$ possible images.
    All other unfixed vertices have at most $n$ choices. The fixed initial vertex, when imposed,
    is a marked vertex. Ignoring injectivity gives the upper bound
  $ n^(V_j - k_j) p^(E_j - Q_j) product_(upright("internal chain turns")) w \( t \, u \) $
  on the number of vertex assignments. We apply probability estimates only to the feasible injective choices among
    these assignments.
  Such a choice requires $E_j$ distinct matching prescriptions.
    Two distinct edges cannot prescribe the same matching pair in either direction,
    because injectivity and the immersion condition would then identify their outgoing letters at an endpoint.
    By Lemma 3, the probability of all these prescriptions is at most
  $ (frac(1 + o \( 1 \), n p))^(E_j) \, $
  uniformly since $E_j = O \( L \)$. Multiplication leaves the bounded factor $p^(- Q_j)$,
    the power $n^(V_j - E_j - k_j)$, and the product of internal turn weights.
    Discard turn weights outside full blocks, since they are at most one.
    The retained product is $product_(i : m_i gt.eq j) P \( W_i \) lt.eq exp \( - sum_(i : m_i gt.eq j) d_i \)$.
    The bounded factor and the prescription errors are absorbed in $exp \( o \( L \) \)$, proving (3.10).
  The number of permitted stage label assignments is at most
  #[#set math.equation(numbering: n => "(3.11)")
   $ exp (o \( L \) + sum_(cal(U) upright(" without a self-link")\
z_(cal(U)) gt.eq j) (2 min_(i in cal(U)) d_i - delta s)) . $ <eq:entropy-stage-labels>]
  To see this carefully, consider a link component with at least one active block, equivalently $z_(cal(U)) gt.eq
    j$. The allowed labels on its active blocks are projections of full feasible word assignments on that
    component. Their number cannot exceed the number of full assignments.
    If the component has no self-link, choose a root attaining $min_(i in cal(U)) d_i$, count its words by (3.9),
    and extend along a spanning tree by (3.7). This argument is valid even if the chosen root is inactive at this
    stage: it counts full word assignments before projecting, and asserts no extension of an embedded graph.
    A self-linked component has only its propagation error, as proved above.
    Components with no active block contribute nothing. The sum of propagation errors is $o \( L \)$,
    since the total number of blocks is $O \( L \/ s \)$. Arbitrary letters in the end fragments contribute at
    most $exp \( O \( s \) \)$ per marked chain, again $exp \( o \( L \) \)$.
    Ignoring any further constraints between components gives (3.11).
  ===== 3.4 Selecting a stage and summing over patterns. <selecting-a-stage-and-summing-over-patterns.>
  Let $B_j$ be the product of the right-hand sides of (3.10) and (3.11). Thus $"E" X_j lt.eq B_j$.
    Multiply these numerical upper bounds over $1 lt.eq j lt.eq m_(*)$.
    The total exponent of $n$ is nonpositive by (3.4). For a link component without a self-link, put $d_min =
    min_(i in cal(U)) d_i$. Its remaining contribution to the logarithm of the product is
  $ F_(cal(U)) = - sum_(i in cal(U)) m_i d_i + 2 z_(cal(U)) d_min - delta s z_(cal(U)) . $
  If $2 z_(cal(U)) lt.eq S_(cal(U))$, then (3.9) gives
  $ F_(cal(U)) lt.eq - \( S_(cal(U)) - 2 z_(cal(U)) \) frac(delta s, 2) - delta s z_(cal(U)) = - delta /
    2 s S_(cal(U)) . $
  If $2 z_(cal(U)) > S_(cal(U))$, use (3.8), the upper bin bound, and $z_(cal(U)) > S_(cal(U)) \/ 2$ to obtain
  $ F_(cal(U)) lt.eq \( 2 z_(cal(U)) - S_(cal(U)) \) a_0 s - delta s z_(cal(U)) lt.eq a_0 s b_(cal(U)) - delta /
    2 s S_(cal(U)) . $
  For a self-linked component the negative cost $- sum_i m_i d_i$ alone is at most $- delta s S_(cal(U)) \/ 2$.
  Bounded multiplicities and boundedly many chains imply
  $ sum_(cal(U)) s S_(cal(U)) = H + O \( L \/ s + s \) = H + o \( L \) \, wide s sum_(cal(U)) b_(cal(U)) lt.eq b +
    o \( L \) \, $
  where the second inequality is (3.6). There are only boundedly many stages by (3.2),
    so all their error terms remain $o \( L \)$. We have proved
  #[#set math.equation(numbering: n => "(3.12)")
   $ log product_(j = 1)^(m_(*)) B_j lt.eq - delta / 2 H + a_0 b + o \( L \) . $ <eq:entropy-product-bound>]
  Choose, once and for all,
  $ epsilon = min {1 / 4 \, frac(delta, 16 \( 1 + a_0 \))} > 0 . $
  This depends only on the fixed turn weights. For $b lt.eq epsilon H$ and all sufficiently large $L$,
    uniformly over the fixed pattern bounds, (3.12) gives
  $ product_(j = 1)^(m_(*)) B_j lt.eq e^(- delta H \/ 4) . $
  Put $M = max { 1 \, ceil.l 2 \( C + K \) ceil.r }$, so $m_(*) lt.eq M$.
    Some stage therefore has $B_j lt.eq e^(- delta H \/ \( 4 M \))$.
    Since a realization of the entire enlarged pattern requires $X_j gt.eq 1$ at every stage, Markov’s inequality gives
  $ Pr \( upright("this enlarged pattern is realized") \) lt.eq min_j "E" X_j lt.eq min_j B_j lt.eq
    e^(- delta H \/ \( 4 M \)) . $
  This uses no independence between stages. We multiplied numerical bounds solely to find one stage with a small
    expectation.
  Finally there are $exp \( o \( L \) \)$ enlarged patterns and $H gt.eq L$.
    The union bound is at most $exp \( o \( L \) - delta L \/ \( 4 M \) \)$, which tends to zero.
    This proves the proposition with the asserted order of quantifiers. ◻
]

== 4 From bounded patterns to spherical arrangements <sec:planar>

Proposition 5 controls systems of bounded size. We now show that any spherical arrangement of the kind needed for
  the topological argument contains such a system. The number of disks in the arrangement is unrestricted.
  Throughout this section, probability is taken in the distribution conditioned on girth at least $L$.

#prodef([Definition 4.1.])[
  (Reduced spherical arrangement).  A reduced spherical arrangement over $Gamma$ consists of the following data on
    an oriented sphere.
  + There are finitely many pairwise disjoint piecewise linear closed disks.
    Each disk boundary carries a positive-length cyclically immersed closed path in $Gamma$,
    with the possible exception of one boundary. That exceptional boundary carries a positive-length immersed
    interval path starting at $x_A$ or $x_B$: its two endpoints are represented at one marked boundary point,
    called the #emph[break]. No immersion condition is imposed across that break.
    At least one ordinary cyclically immersed boundary is present.
  + The paths are read in the boundary orientations induced by the oriented disks.
    Their edge occurrences are paired in distinct twos by piecewise linear arcs whose interiors lie outside the
    disks. The arcs are mutually disjoint, and each occurrence contains exactly one arc end in its interior.
  + Paired occurrences have inverse signed letters in these boundary orientations,
    and their underlying undirected edges of $Gamma$ are distinct, as required by Equation (3.1).
  Occurrences remain distinct even when the paths revisit the same graph edge.
    The arc graph may have loops, parallel edges, or several connected components.
] <def:arrangement>

=== 4.1 Short closures <short-closures>

Fix a deterministic constant $d$ such that the event

$ "diam" \( Lambda \) lt.eq d L quad upright("for every connected component ") Lambda upright(" of ") Gamma $

has probability $1 - o \( 1 \)$, as supplied by Lemma 4. We first work on this event.

#thm([Lemma 4.2.])[
  (Closing a segment without cancellation).  #emph[There is a fixed integer $D$,
    independent of $n$ and of the segment, such that every positive-length immersed segment in $Gamma$ extends to
    a cyclically immersed closed path by appending at most $D L$ edges.
    The original segment is retained without cancellation.]
] <lem:short-closure>

#proof[
  Appending a geodesic return may cancel the ends of the given segment.
    We prevent this by inserting short based loops with prescribed first and last edge exclusions.
    To construct such a loop at a vertex $z$, delete at most two specified incident undirected edges from its side
    of $Gamma$. For sufficiently large $n$, girth at least $L gt.eq 3$ excludes graph loops and parallel edges;
    after the deletion every vertex still has degree at least $\( q + 1 \) - 2 gt.eq 3$. Put
  $ k = ceil.l log_2 n ceil.r + 1 . $
  From $z$ in the remaining graph there are at least $3 dot.op 2^(k - 1) >
    n$ non-backtracking walks of length $k$. That graph has at most $n$ vertices, so two distinct such walks $P \,
    Q$ end at the same vertex. Reduce $P Q^(- 1)$ as a linear edge path.
    This removes just their common terminal segment. Since $P$ and $Q$ have equal length and are distinct,
    neither walk is entirely removed. The result is a nonempty reduced based loop of length at most $2 k$,
    whose first and last edges avoid both deleted edges. The loop need not be cyclically immersed at $z$;
    only its linear reduction will be used.
  Let $S$ be the given segment, running from $a$ to $b$, and let $R$ be a geodesic from $b$ to $a$,
    of length at most $d L$. If $R$ is nonempty, choose a based loop $J_b$ at $b$ by excluding the last edge of
    $S$ and the first edge of $R$. Choose $J_a$ at $a$ by excluding the last edge of $R$ and the first edge of $S$. Then
  $ S J_b R J_a $
  has no backtracking at any join, including its cyclic last/first join.
    If $R$ is empty, so that $a = b$, use just one based loop $J_a$, excluding the last and first edges of $S$;
    the path $S J_a$ is cyclically immersed. The immersion $Gamma arrow.r
    F$ also makes every one of these joins reduced in signed letters.
  For large $n$ we have $L gt.eq \( c \/ 2 \) log n$ and $L gt.eq 1$, whence
  $ k lt.eq (frac(2, c log 2) + 2) L . $
  Thus any integer
  $ D gt.eq d + frac(8, c log 2) + 8 $
  bounds the added length $\| R \| + 4 k$ in units of $L$, and covers the empty-return case as well. ◻
]

=== 4.2 Turning planar pairings into intervals <turning-planar-pairings-into-intervals>

The next bound concerns only the original paired occurrences;
  edges added to close segments will always be left unpaired.

#thm([Lemma 4.3.])[
  (A linear bound on comparison intervals).  #emph[Suppose an arrangement with $N$ disk boundaries is divided into
    $N' gt.eq N$ pieces by cutting each original path into consecutive segments,
    without crossing an exceptional break. A path left intact counts as one piece.
    Then its occurrence pairing can be specified by at most $6 N'$ pairs of intervals.
    Both intervals in every pair lie wholly in their designated pieces, are distinct as occurrence intervals,
    and compare inverse strings in reversed boundary order.]
] <lem:planar-intervals>

#proof[
  Thicken the disks and pairing arcs to a regular disk-and-band neighborhood $R$ of their planar multigraph.
    Let $E$ denote its number of arcs. A #emph[vertex gap] is the boundary arc between consecutive pairing-arc
    ends in the cyclic order around one disk. For each connected complementary compact surface $Q$,
    let $l_Q$ be the number of band sides in its boundary. Equivalently, $l_Q$ counts the intervening vertex gaps,
    with incidences counted separately. Every vertex has positive degree,
    so every boundary component of $R$ meets a band side, and $l_Q gt.eq 1$.
  Call a vertex gap #emph[good] if it belongs to a complementary disk digon whose two sides come from two distinct
    arcs. The two gaps across such a digon are both good. If consecutive occurrences at one corner are $e \,
    f$ and their partners are $e' \, f'$, the opposite corner has coherent order $f' \, e'$.
    Thus $\( e \, f \) arrow.l.r \( f' \, e' \)$ is an involution on good gaps.
    Here the symbols denote occurrences, not underlying graph edges.
    Good gaps therefore continue an inverse-word comparison. We first bound the remaining gaps,
    where this continuation can fail, before making the required indexing and splitting cuts.
  The neighborhood retracts to the multigraph, so $chi \( R \) = N - E$.
    Gluing the complementary surfaces to it along boundary circles gives
  $ sum_Q chi \( Q \) = 2 - N + E \, wide sum_Q l_Q = 2 E . $
  Consequently
  #[#set math.equation(numbering: n => "(4.1)")
   $ sum_Q #scale(x: 120%, y: 120%)[\(] l_Q - 2 chi \( Q \) #scale(x: 120%, y: 120%)[\)] = 2 N -
     4 . $ <eq:planar-euler>]
  This calculation uses neither connectedness of the multigraph nor simple connectivity of its complementary regions.
  We bound the non-good gaps, including the possible degenerate faces, as follows.
  - A disk monogon has one gap between occurrences paired by its single arc.
    Those consecutive letters are inverse, so immersion forbids the gap unless it is the exceptional break.
    Thus there are at most $M lt.eq 1$ monogons, contributing $- M$ to Equation (4.1).
  - A disk digon traversing the same arc twice must turn immediately back along that arc at an endpoint.
    No other arc end can intervene in the cyclic order there, so that endpoint has degree one.
    Different such faces use different degree-one gaps. There are at most $N$ such faces,
    and hence at most $2 N$ gaps of this type. This deliberately allows a coarse bound,
    including isolated single-edge components.
  - Every connected non-disk complementary surface is planar with Euler characteristic at most zero.
    Its length is therefore at most its contribution $l_Q - 2 chi \( Q \)$.
    For a disk region of length $l_Q gt.eq 3$, we instead have $l_Q lt.eq 3 \( l_Q - 2 \)$.
  All contributions except those of monogons and digons are positive.
    Their total is $2 N - 4 + M$, by Equation (4.1). If $B_(upright("gap"))$ is the number of non-good gaps,
    these observations give
  #[#set math.equation(numbering: n => "(4.2)")
   $ B_(upright("gap")) lt.eq M + 2 N + 3 \( 2 N - 4 + M \) lt.eq 8 N . $ <eq:bad-gaps>]
  Cut at every non-good gap. Mark also one indexing gap for each original path,
    using the exceptional break when present, and all gaps used in the prescribed splitting.
    There are at most $N + N'$ additional marked gaps: a split cyclic boundary into $m$ pieces needs at most $m$
    splitting gaps, and a split interval needs no more. Whenever a marked gap is good,
    cut both it and its opposite good gap. The resulting cut set is stable under the good-gap involution and has
    cardinality $J$ satisfying
  $ J lt.eq B_(upright("gap")) + 2 \( N + N' \) lt.eq 12 N' . $
  Every original boundary now has at least one cut. Its remaining occurrence-adjacency components are therefore
    linear runs, all lying inside their prescribed pieces. The occurrence pairing reverses every uncut adjacency.
    Stability of the cut set implies that it maps each whole maximal run onto another whole maximal run in reverse
    order. A run cannot map to itself: an odd-length run would have a fixed occurrence,
    while an even-length run would pair its two central consecutive occurrences and give inverse adjacent letters.
    The latter contradicts internal immersion; the exceptional break was cut and cannot occur at the center of
    such a run.
  There are exactly $J$ runs, since each original boundary is a circle with a nonempty cut set.
    They pair in distinct twos, giving at most $J \/ 2 lt.eq 6 N'$ interval pairs.
    Inverse letters and reversed order are exactly the signed comparison convention of Proposition 5. ◻
]

=== 4.3 Separating a planar graph into bounded components <separating-a-planar-graph-into-bounded-components>

#thm([Lemma 4.4.])[
  (Recursive planar separation).  #emph[Put
$ C_(upright("sep")) = frac(2 sqrt(2), 1 - sqrt(2 \/ 3)) . $

 For every integer $K gt.eq 1$, a planar multigraph with $m$ vertices has a set of at most $C_(upright("sep"))
   m \/ sqrt(K)$ vertices whose deletion leaves components of size at most $K$.]
] <lem:planar-separation>

#proof[
  Remove loops and merge parallel copies of edges. These operations preserve connected components,
    including after any vertex deletion. The planar separator theorem of Lipton and Tarjan
    #cite(label("LiptonTarjan1979")) Corollary 2, p. 183 supplies, in any simple planar graph with $s$ vertices,
    at most $2 sqrt(2 s)$ vertices whose deletion leaves components with at most $2 s \/ 3$ vertices.
    Apply this theorem recursively to each component with more than $K$ vertices.
  For a recursive call on $s > K$ vertices, charge $2 sqrt(2) \/ sqrt(s)$ to each of those vertices.
    The total charge at this call is $2 sqrt(2 s)$ and bounds the number deleted.
    Fix one original vertex and list the successive component sizes containing it before it is deleted or
    recursion stops. Consecutive sizes decrease by a factor at most $2 \/ 3$.
    Reading the list backwards from its last size greater than $K$, its total charge is at most
  $ frac(2 sqrt(2), sqrt(K)) sum_(j gt.eq 0) \( 2 \/ 3 \)^(j \/ 2) = C_(upright("sep")) / sqrt(K) . $
  This also covers vertices that are themselves deleted at a separator.
    Summing over the original vertices proves the bound. Components already of size at most $K$ incur no charge. ◻
]

=== 4.4 Extracting a forbidden bounded pattern <extracting-a-forbidden-bounded-pattern>

#thm([Proposition 4.5.])[
  (Absence of reduced spherical arrangements).  #emph[With probability $1 - o \( 1 \)$,
    $Gamma$ admits no reduced spherical arrangement. In particular,
    for all sufficiently large admissible $n$ there exist graphs of the prescribed types,
    with girth at least $L$ and the diameter bound of Lemma 4, admitting no such arrangement.]
] <prop:no-arrangements>

#proof[
  Let $epsilon > 0$ be supplied by Proposition 5; it is independent of the fixed pattern bounds.
    Fix $d$ for the diameter event and then the integer $D$ from Lemma 7.
    Splitting at length about $U L$ will make each closure cost of at most $D
    L$ a small proportion of the original length. We choose $U$ to control that cost,
    $eta$ to control the original positions discarded by planar separation,
    and $C_2$ as a cutoff for the number of comparison intervals relative to path length.
    Choose, in the indicated order,
  #[#set math.equation(numbering: n => "(4.3)")
   $ U & gt.eq max { 3 \, ceil.l 96 D \/ epsilon ceil.r } \, &  & U upright(" an integer") \,\
eta & = min {frac(1, 32 U) \, frac(epsilon, 64 U)} \, & K & = max {1 \, ⌈\( C_(upright("sep")) \/ eta \)^2⌉} \,\
a & = 6 \, wide C_2 = 32 a \, & C & = K \( U + D \) \, wide I = ceil.l C_2 C ceil.r . $ <eq:planar-parameters>]
  Here $C_(upright("sep"))$ is the constant in Lemma 9. These choices imply
  #[#set math.equation(numbering: n => "(4.4)")
   $ frac(3 D, U) lt.eq epsilon / 32 \, wide 2 eta U lt.eq 1 / 16 \, wide 2 eta U lt.eq epsilon /
     32 . $ <eq:planar-loss-choices>]
  For reference, the dependency order is
  #[#set math.equation(numbering: n => "(4.5)")
   $ upright("types") \, c \, delta med \; quad epsilon \, d med \; quad D med \; quad U med \; quad eta med \;
     quad K med \; quad C \, I med \; quad n . $ <eq:parameter-order>]
  All constants preceding $n$ are fixed before $n$ tends to infinity through multiples of $2 v^2$, with $L =
    floor.l c log n floor.r$. In particular, the bounded-pattern estimate is applied to one fixed triple
    $\( K \, C \, I \)$, not to bounds growing with $n$.
  Suppose, on the diameter event, that a reduced spherical arrangement exists.
    Write $N$ for its number of boundaries and $H_0$ for their total length.
    There is an ordinary cyclically immersed boundary, so girth gives $H_0 gt.eq L$.
  ===== 4.4.1 Splitting and closing long paths. <splitting-and-closing-long-paths.>
  Keep every path of length at most $U L$ intact. A longer path of length $h$ is split into $m =
    ceil.l h \/ \( U L \) ceil.r$ consecutive integer-length segments whose lengths differ by at most one.
    For large $L$, these lengths lie between $U L \/ 3$ and $U L$:
    indeed $h \/ m > U L \/ 2$, and $floor.l h \/ m floor.r gt.eq U L \/ 3$ once $U L gt.eq 6$,
    while $ceil.l h \/ m ceil.r lt.eq U L$. For an exceptional path use its linear order from the prescribed
    initial vertex, so no segment spans the break. Close each segment by Lemma 7,
    and leave every added occurrence unpaired.
  Denote the number of resulting paths by $N'$. Each has length at most $\( U + D \) L$ and contains at most $U
    L$ original occurrences. Since $m lt.eq 3 h \/ \( U L \)$, the total added length $H_(upright("add"))$ satisfies
  #[#set math.equation(numbering: n => "(4.6)")
   $ H_(upright("add")) lt.eq frac(3 D, U) H_0 . $ <eq:closure-mass>]
  Every resulting path has at least $L$ original occurrences,
    except possibly the single exceptional path when it was kept intact:
    ordinary intact paths have that length by girth, and split segments have length at least $U L \/ 3 gt.eq L$.
    It follows that
  #[#set math.equation(numbering: n => "(4.7)")
   $ N lt.eq N' \, wide N' L lt.eq H_0 + L lt.eq 2 H_0 . $ <eq:piece-count>]
  If the exceptional path was long, all its pieces have been closed and there is no remaining interval path.
    Otherwise the entire exceptional path remains, with its original prescribed initial vertex.
  Apply Lemma 8 to the original positions in these pieces. It represents their pairing by at most $a
    N'$ interval pairs, each contained in the designated pieces.
    On a newly closed path, index its original segment first and its closure afterwards;
    this keeps those intervals within the linear indexing as well.
  ===== 4.4.2 Deleting a small set of pieces. <deleting-a-small-set-of-pieces.>
  Make a multigraph whose vertices are the $N'$ pieces and whose edges are the original pairing arcs.
    This graph is planar. To see this locally, replace each old disk vertex by a separate vertex for each
    consecutive block of its incident arc ends. Place those vertices inside disjoint sectors of the old disk and
    join each to its own block of ends within its sector. These connections have no crossings,
    including when an original arc had both ends at the old vertex.
    Closures have no incident pairing arcs and need no additional edges.
  By Lemma 9 and the choice of $K$, delete at most $eta N'$ vertices so that each remaining component,
    called a #emph[cluster], has at most $K$ pieces. The number $M$ of deleted original positions is at most
  #[#set math.equation(numbering: n => "(4.8)")
   $ M lt.eq eta N' U L lt.eq 2 eta U H_0 . $ <eq:deleted-mass>]
  Retain just those occurrence pairs whose two pieces survive.
    Each surviving original position has at most one deleted partner,
    so the number of newly unpaired surviving original positions is at most $M$.
    Each comparison interval lies in one piece on either side;
    thus an interval pair is retained or discarded in its entirety. No retained pair joins different clusters.
  For a cluster $Z$, let $H_Z$ be its total path length including closures,
    $b_Z$ the number of its unpaired positions, and $I_Z$ its number of retained interval pairs.
    Equations (4.6), (4.7), and (4.8) give
  #[#set math.equation(numbering: n => "(4.9)")
   $ sum_Z H_Z & gt.eq \( 1 - 2 eta U \) H_0 \,\
sum_Z b_Z & lt.eq \( 2 eta U + 3 D \/ U \) H_0 \,\
sum_Z I_Z & lt.eq a N' lt.eq 2 a H_0 \/ L . $ <eq:cluster-totals>]
  Also every cluster satisfies $H_Z lt.eq K \( U + D \) L = C L$.
  ===== 4.4.3 A positive amount of admissible length survives. <a-positive-amount-of-admissible-length-survives.>
  The retained total length is at least $15 H_0 \/ 16$ by Equation (4.4).
    Clusters with $b_Z > epsilon H_Z$ have total length at most
  $ 1 / epsilon sum_Z b_Z lt.eq H_0 / 16 . $
  Clusters with $I_Z > C_2 H_Z \/ L$ likewise have total length at most
  $ L / C_2 sum_Z I_Z lt.eq frac(2 a, C_2) H_0 = H_0 / 16 . $
  After excluding both classes, at least $13 H_0 \/ 16$ of cluster length remains.
  A cluster of length less than $L$ can contain no positive-length cyclically immersed path.
    Thus it can consist only of the one intact short exceptional path, and there is at most one such cluster.
    If its length is $h < L$, the original arrangement also contained an ordinary cyclic path of length at least
    $L$, so $H_0 gt.eq h + L > 2 h$. Removing that cluster therefore costs less than $H_0 \/ 2$.
    The clusters left after all three exclusions have total length at least
  $ (15 / 16 - 1 / 16 - 1 / 16 - 1 / 2) H_0 = 5 / 16 H_0 > 0 . $
  Choose one such cluster. It contains at most $K$ positive-length paths, has
  $ L lt.eq H_Z lt.eq C L \, wide b_Z lt.eq epsilon H_Z \, wide I_Z lt.eq C_2 H_Z \/ L lt.eq C_2 C lt.eq I \, $
  and inherits Equation (3.1). All paths are cyclically immersed except possibly the entire short exceptional
    interval, whose initial vertex is still $x_A$ or $x_B$. Added closures may traverse old edges repeatedly;
    all their occurrences are unpaired, as permitted by Proposition 5.
    The cluster is therefore one of the bounded patterns excluded by 5.
  The constants in Equation (4.3) were chosen using the single $epsilon$ independent of $K \, C \, I$.
    The probability of such a bounded pattern is $o \( 1 \)$,
    and the probability of failure of the diameter event is $o \( 1 \)$.
    Every finite reduced spherical arrangement, regardless of size,
    deterministically yields a pattern for these same fixed bounds.
    This proves the claimed probability estimate and hence the existence assertion. ◻
]

== 5 Cone pictures and torsion-freeness <sec:topology>

Fix graphs supplied by 10. Attach to the rose $F$, for each connected component $Lambda$ of $Gamma$,
  its abstract cone $K_Lambda$ along the labelled map $Lambda arrow.r F$.
  Denote the resulting finite two-dimensional CW complex by $X$, and put $G = pi_1 \( X \)$,
  based at the rose vertex. In particular, labels of all closed walks in $Gamma$ are trivial in $G$.

#thm([Proposition 5.1.])[
  #emph[The complex $X$ satisfies $pi_2 \( X \) = 0$. Moreover,
    if a path in $Gamma$ starts at $x_A$ or $x_B$ and ends at a different vertex, its label is nontrivial in $G$.]
] <prop:topology>

We prove the two conclusions together, using minimal surface pictures.
  The proof keeps track of the actual boundary lifts in $Gamma$.
  Removing overlaps with coincident graph lifts is also central to the graphical-diagram arguments of Gruber and
  Bereznyuk #cite(label("Gruber2015")) #cite(label("Bereznyuk2019")). Their hypotheses are not imported here:
  we give the cone-picture reduction needed for 10 directly, without a graphical small-cancellation condition.

=== 5.1 Representing maps by pictures <representing-maps-by-pictures>

A #emph[cone picture] on a sphere or disk consists of finitely many disjoint tame disks in the surface interior,
  called #emph[inner disks], with the following mapping data.
  Each inner disk has a specified boundary lift to a graph component $Lambda$,
  its filling factors through $K_Lambda$, and the complement of the disk interiors maps to $F$.
  The boundary lifts are combinatorial closed paths. For a disk domain the outer boundary additionally reads the
  label of a specified interval path in $Gamma$.

#thm([Lemma 5.2.])[
  #emph[Every essential sphere map to $X$ can be replaced by an essential sphere map admitting a cone picture.
    Every null-homotopy of a graph-path label can be represented by a disk cone picture with that boundary label.]
] <lem:pictures>

#proof[
  For each component $Lambda$, choose based edge loops representing a free basis of $pi_1 \( Lambda \)$.
    Temporarily replace $K_Lambda$ by the space $Y_Lambda$ obtained by attaching one disk to $Lambda$ along each
    basis loop. The space $Y_Lambda$ is simply connected. The classes of its attaching loops form a basis of
    $H_1 \( Lambda \; bb(Z) \)$, so its cellular chains show that its positive-dimensional homology vanishes.
    A simply connected acyclic CW complex is contractible, by the Hurewicz and Whitehead theorems;
    see #cite(label("Hatcher2002")) Theorem 4.32 and Corollary 4.33.
  Both $Y_Lambda$ and $K_Lambda$ contain $Lambda$ as a subcomplex.
    Their contractibility gives maps between them restricting to the identity on $Lambda$,
    and homotopies of the composites to the identities relative to $Lambda$:
    extend the prescribed maps and homotopies over relative cells,
    using the vanishing of the homotopy groups of the targets.
    These relative maps and homotopies glue with the identity on $F$.
    This works even though $Lambda arrow.r F$ is not injective.
    We obtain an ordinary rose-with-relator-disks model homotopy equivalent to $X$ relative to $F$.
  That finite model can be triangulated. Take collars inside the relator disks,
    view their attachments to $F$ as mapping cylinders, subdivide the collar rectangles so that their bottom edges
    map injectively to small rose edges, and triangulate. A surface map can be approximated piecewise linearly,
    preserving its boundary in the graph. If needed, a graph collar homotopy restores the original boundary word
    in the disk case.
  Choose a point in the interior of each relator disk outside the images of degenerate or lower-dimensional
    simplices. It has finitely many preimages, with disjoint disk neighborhoods that map homeomorphically onto a
    small disk around the chosen point. Choose these target disks small enough that there are no other preimages.
    A radial map of each relator disk expands the small target disk to the whole relator disk and sends the
    remaining annulus to its attaching boundary. This map is homotopic to the identity relative to $F$.
  After composition, the complement of the preimage disks maps to $F$,
    and each preimage disk reads an attaching loop, with one of its two orientations.
    Return to $X$ using the relative equivalences of the individual cone substitutes.
    Each disk then factors through its specified abstract cone.
    Essentiality of a sphere, or the prescribed disk-boundary word, is preserved. ◻
]

=== 5.2 Minimizing a failure picture <minimizing-a-failure-picture>

Suppose that one conclusion of 11 fails. In the sphere case, consider all essential sphere pictures;
  the homotopy class is allowed to vary. In the disk case, fix two distinct vertices witnessing a failure,
  with the first one equal to $x_A$ or $x_B$, and allow the interval path between them to vary.
  By 12, the appropriate class of pictures is nonempty.

Choose a picture of least total boundary length, counting all inner boundaries and, in the disk case,
  the outer path. This length is a nonnegative integer. Cyclically tighten every inner loop in its own graph
  component. The tightening can be performed on a collar, with the smaller disk filled through the same cone.
  The old filling and this replacement are homotopic relative to the old boundary,
  since both factor through that contractible cone. A constant boundary disk can be removed.
  Thus every inner boundary is nonempty and cyclically immersed.

Tighten the outer interval relative to its actual graph endpoints.
  It remains nonempty because those endpoints are distinct. There must be at least one inner disk:
  a graph has no essential sphere, and a nonempty immersed graph path has a nonempty freely reduced word under the
  immersion to the rose, so its label cannot be trivial in $pi_1 \( F \)$.

For a disk-domain picture, cap the exterior conceptually by an extra disk.
  Its boundary carries the interval path, with a single marked break from the endpoint back to the initial vertex.
  No map of that extra disk into $X$ is required. Orient the sphere so that the coherent exterior-disk boundary
  orientation reads this path from its prescribed root to its endpoint.
  We now have an oriented sphere with ordinary inner disks and at most one exceptional exterior disk.

In the surface region mapping to $F$, take transverse preimages of one interior point in each rose edge.
  This can again be arranged by PL approximation relative to the boundary words,
  using collars to straighten their parametrizations. The preimages are disjoint circles and arcs.
  Ignore the circles. Every letter occurrence has exactly one arc endpoint, giving a complete pairing.
  Transverse orientation over a rose edge gives opposite crossing signs at the two ends of an arc along the
  oriented boundary of the complement. Switching to coherent disk-boundary orientations reverses both signs.
  Consequently the paired letters are inverse in those orientations.

It remains to establish the reduction condition (3.1). The following surgery is the reason for minimizing over
  boundary length and, for spheres, over all nonzero classes.

=== 5.3 Cancelling a band over the same lifted edge <cancelling-a-band-over-the-same-lifted-edge>

Suppose an arc joins occurrences of the same underlying unoriented edge in $Gamma$.
  A sufficiently narrow band around that arc maps into the corresponding open rose edge.
  It lifts to the specified common open graph edge, because the map of that open edge to the rose is a
  homeomorphism. The lift agrees with the specified lifts at both attachment intervals.
  In particular, any incident inner disks and the band together factor through one common abstract cone.

Join the incident disks along the band. If it returns to one disk, the result is an annulus in the sphere.
  Boundary paths follow the original paths cut at the two occurrences and spliced along the band.
  They lift to the same graph component, except for the one retained marked break when the exterior is involved.

Both spliced joins contract along the common graph edge. To check this concretely, orient it as $e : u arrow.r v$.
  The two matched occurrences are $e$ and $e^(- 1)$. The local possibilities are:

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Incident disks
], table.cell(rowspan: 1, colspan: 1)[Old lifted paths
], table.cell(rowspan: 1, colspan: 1)[New lifted paths
]),
  table.cell(rowspan: 1, colspan: 1)[Two inner disks
], table.cell(rowspan: 1, colspan: 1)[$e a \, med e^(- 1) b$
], table.cell(rowspan: 1, colspan: 1)[$a b$
],
  table.cell(rowspan: 1, colspan: 1)[Exterior and inner
], table.cell(rowspan: 1, colspan: 1)[$a e c : x arrow.r y \, med e^(- 1) b$
], table.cell(rowspan: 1, colspan: 1)[$a b c : x arrow.r y$
],
  table.cell(rowspan: 1, colspan: 1)[One inner disk twice
], table.cell(rowspan: 1, colspan: 1)[$e a e^(- 1) b$
], table.cell(rowspan: 1, colspan: 1)[$a \, med b$
],
  table.cell(rowspan: 1, colspan: 1)[Exterior twice
], table.cell(rowspan: 1, colspan: 1)[$a e b e^(- 1) c : x arrow.r y$
], table.cell(rowspan: 1, colspan: 1)[$a c : x arrow.r y$
],
)
]

The symbols denote graph paths with the endpoints forced by the displayed concatenations.
  For example, in the last row $a : x arrow.r u$, $b : v arrow.r v$, and $c : u arrow.r y$.
  The other new boundary is $b$, up to orientation. Thus the break-containing path $a
  c$ has exactly the original distinct endpoints $x \, y$.

Geometrically, each band side joins two residual edge fragments that go from one endpoint of $e$ back to that same
  endpoint through its interior. These fragments contract relative to their endpoints.
  Taken together, the two contractions remove the two complete edge occurrences and add no letters.
  Neither contraction passes through the marked break. Total new boundary length is smaller by two before any
  further tightening.

Here are the resulting modifications of the entire picture.

+ If the band joins two distinct inner disks, replace their disk-and-band union by one cone disk.
  The replacement is homotopic relative to its boundary because the entire map there factors through the common
  contractible cone. Then tighten its boundary.
+ If the band joins an inner disk to the exterior disk, replace the exterior by their joined disk.
  Keep the map on its complement and tighten the new outer path relative to the same endpoints.
+ If both ends meet one inner disk, remove its annulus with the band and cap the boundaries on the two
  complementary parts using that same cone. For a disk-domain failure, retain the part containing the exterior.
  For a sphere failure, at least one capped sphere remains essential, as proved below.
+ If both ends meet the exterior disk, the resulting annulus has the marked break on one boundary component.
  Retain as the new domain the complementary disk adjacent to that boundary.
  The last row of the table shows that its outer path has the same graph endpoints.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  compound-path({circle((0, 0), radius: 0.9379, fill: rgb("#e9e9e9"), stroke: none); circle((0, 0), radius: 0.4316, fill: rgb("#e9e9e9"), stroke: none); line((0, 0), (0, 0))}, fill: rgb("#e9e9e9"), fill-rule: "even-odd", stroke: none)
  circle((0, 0), radius: 0.9379, stroke: (thickness: 0.6pt, miter-limit: 10))
  circle((0, 0), radius: 0.4316, stroke: (thickness: 0.6pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[$a$]])
  content((-1.22, 0), [#text(size: 9pt)[$b$]])
  content((0, -1.369), [#text(size: 9pt)[disk and band#linebreak()\(an annulus\)]])
  line((1.369, 0), (3.071, 0), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.224, 0.1328), [#text(size: 7pt)[remove#linebreak()annulus;#linebreak()cap#linebreak()complements]], anchor: "south", padding: 0.1176cm)
  circle((4.191, 0), radius: 0.8549, fill: rgb("#f9f9f9"), stroke: none)
  circle((4.191, 0), radius: 0.8549, stroke: (thickness: 0.6pt, miter-limit: 10))
  circle((4.191, -0.3154), radius: (0.6889, 0.2075), fill: rgb("#e9e9e9"), stroke: none)
  circle((4.191, -0.3154), radius: (0.6889, 0.2075), stroke: (thickness: 0.6pt, miter-limit: 10))
  content((4.191, -0.3154), [#text(size: 9pt)[$a$]])
  content((4.191, 0.2656), [#text(size: 9pt)[$S_1$]])
  content((5.42, 0), [#text(size: 9pt)[$+$]])
  circle((6.64, 0), radius: 0.8549, fill: rgb("#f9f9f9"), stroke: none)
  circle((6.64, 0), radius: 0.8549, stroke: (thickness: 0.6pt, miter-limit: 10))
  circle((6.64, -0.3154), radius: (0.6889, 0.2075), fill: rgb("#e9e9e9"), stroke: none)
  circle((6.64, -0.3154), radius: (0.6889, 0.2075), stroke: (thickness: 0.6pt, miter-limit: 10))
  content((6.64, -0.3154), [#text(size: 9pt)[$b$]])
  content((6.64, 0.2656), [#text(size: 9pt)[$S_2$]])
  content((5.395, -1.369), [#text(size: 9pt)[$[S]=[S_1]+[S_2] "in" H_2( tilde(X) ; bb(Z) )$]])
})],
  caption: [Figure 2: An inner disk joined to itself by a band forms an annulus. Cutting away the annulus leaves two complementary disks. Capping their new boundaries through the same abstract cone gives two spheres whose homology classes sum to the original class in the universal cover. The labels $a \, b$ indicate the shortened boundary paths; the picture is schematic. ],
) <fig:band-surgery>

For the essentiality assertion in the third case, illustrated in 2,
  lift the original sphere map to the universal cover $tilde(X)$.
  The map $K_Lambda arrow.r X$ has a lift because the cone is simply connected.
  Choose this lift to agree with the lifted sphere at one point of the annulus.
  Since the annulus is connected, uniqueness of lifts gives agreement throughout it.
  Fill both new caps in $K_Lambda$ and use this same lift.

With compatible orientations, the original spherical class in $H_2 \( tilde(X) \; bb(Z) \)$ is the sum of the two
  capped classes. The difference between the original class and this sum is represented by the annulus together
  with the reverse caps, all mapping through the contractible cone, so it is zero in homology.
  Since $tilde(X)$ is simply connected, the Hurewicz map sending a sphere to its fundamental homology class
  identifies $pi_2 \( tilde(X) \)$ with $H_2 \( tilde(X) \; bb(Z) \)$ #cite(label("Hatcher2002")) Theorem 4.37.
  A nonzero original class therefore leaves a nonzero capped class. This uses no prior vanishing of $pi_2 \( X \)$.

In every case the retained surface still witnesses the chosen kind of failure,
  and its total boundary length has strictly decreased. For the split sphere this follows because the total new
  length over both parts is already smaller; keeping just one part cannot increase it.
  Collar homotopies restore combinatorial boundaries after the contractions,
  and further tightening only decreases length. In the exterior cases,
  the new graph path has the same fixed distinct endpoints. This contradicts the chosen minimum.

Thus every paired occurrence uses a different underlying graph edge from its partner.
  The minimized picture is now an arrangement of 6: it has at least one ordinary cyclic boundary,
  at most one rooted exceptional interval with one break, a full planar inverse-letter pairing,
  and the reduction condition. 10 excludes it. This proves 11.

=== 5.4 A finite-dimensional obstruction to torsion <a-finite-dimensional-obstruction-to-torsion>

#thm([Corollary 5.3.])[
  #emph[The universal cover of $X$ is contractible, and $G$ is torsion-free.]
] <cor:torsion-free>

#proof[
  The simply connected two-dimensional cover $tilde(X)$ has $H_2 = 0$ by 11 and Hurewicz, has $H_1 = 0$,
    and has no cellular homology above dimension two. It is therefore contractible by the homological form of
    Whitehead’s theorem #cite(label("Hatcher2002")) Corollary 4.33.
  For completeness, the torsion obstruction can be seen directly from resolutions;
    compare #cite(label("Brown1982")) Chapter VIII, Section 2.
    The augmented cellular chains of $tilde(X)$ give an exact free $bb(Z) G$-resolution of $bb(Z)$ of length two.
    If $G$ had a nontrivial finite-order element, a power would generate a cyclic subgroup $H =
    chevron.l g chevron.r$ of prime order $ell$. Restricting the resolution to $bb(Z) H$ preserves freeness,
    since $bb(Z) G$ is free as a left $bb(Z) H$-module on coset representatives.
  The cyclic group has the exact periodic resolution
  $ dots.h.c arrow.r bb(Z) H arrow.r^(thin N thin) bb(Z) H arrow.r^(thin g - 1 thin) bb(Z) H arrow.r^(thin N thin)
    bb(Z) H arrow.r^(thin g - 1 thin) bb(Z) H arrow.r bb(Z) arrow.r 0 \, wide N = 1 + g + dots.h.c + g^(ell - 1) . $
  Exactness follows by comparing the coefficients of $1 \, g \, dots.h \, g^(ell - 1)$:
    the kernel of $g - 1$ consists of the multiples of $N$, and the kernel of $N$ is the augmentation ideal
    generated by $g - 1$. With trivial coefficients $bb(F)_ell$,
    all differentials in the corresponding cochain complex vanish.
    Hence $H^k \( H \; bb(F)_ell \) tilde.equiv bb(F)_ell$ in every degree.
    The comparison theorem for projective resolutions makes this cohomology independent of the chosen
    resolution #cite(label("Brown1982")) Chapter I, Theorem 7.5, p. 24.
    This contradicts the vanishing above degree two forced by the restricted finite-length free resolution. ◻
]

== 6 The zero divisors <sec:factors>

#proof[
  Use the graphs of 10 and the complex $X$ constructed in 5. It is finite and two-dimensional.
    By 13, it is a classifying space for the torsion-free group $G = pi_1 \( X \)$, which is finitely presented.
  Let $A'$ be the full vertex set of the component of $x_A$ and $B'$ that of the component of $x_B$.
    For $x in A'$, let $g_x in G$ be the label of a path from $x_A$ to $x$; for $y in B'$,
    define $h_y$ using paths from $x_B$. These labels do not depend on the path,
    because labels of all closed walks in each component are killed by its cone. We multiply in path order.
  Set
  $ alpha = sum_(x in A') g_x \, wide beta = sum_(y in B') h_y^(- 1) quad upright("in ") bb(F)_2 \[ G \] . $
  Both sums are finite. The root contributes the identity to each.
    By 11, no other vertex contributes identity, so its coefficient is one in each factor.
    Thus $alpha eq.not 0$ and $beta eq.not 0$. No assertion about equality between two non-root labels is needed.
  On $A' times B'$, form the graph of simultaneous steps of a common signed label. A step
  $ x arrow.r^t x' \, wide y arrow.r^t y' $
  sends $g_x$ to $g_x t$ and $h_y$ to $h_y t$, and therefore preserves
  $ g_(x') h_(y')^(- 1) = \( g_x t \) \( h_y t \)^(- 1) = g_x h_y^(- 1) . $
  The reverse step has label $macron(t)$. Since full components are used,
    the degree at $\( x \, y \)$ is the entire number $\| S_x ∩ S_y \|$, which is odd by (2.1).
    The girth condition excludes loops for the chosen large $n$;
    parallel edges would not affect the degree-sum argument.
  Every finite connected component of the simultaneous-step graph has an even number of vertices,
    since the sum of its odd degrees is twice its number of edges.
    The value $g_x h_y^(- 1)$ is constant on that component, so the component contributes zero to the expansion of
    $alpha beta$ over $bb(F)_2$. Summing over all components gives $alpha beta = 0$.
    This proves 1 and disproves the universal zero-divisor assertion. ◻
]

In particular, $G$ does not have the unique-product property. The construction is probabilistic:
  it proves that suitable finite matchings exist, without specifying matchings from which a concrete presentation
  and zero-divisor factors can be read off.

#bibliography("refs.bib", style: "ieee", title: [References])
