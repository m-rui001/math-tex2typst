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

#align(center)[#text(size: 16pt, weight: "bold")[A proof of Seymour's second-neighborhood conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

An #emph[oriented graph] is a finite directed graph with no loops, no multiple arcs, and no pair of opposite arcs.
  Its underlying undirected graph need not be complete or connected. For a vertex $v$, write

$ N_1^(+) \( v \) = { u : v arrow.r u } \, wide N_2^(+) \( v \) = { w in.not { v } union N_1^(+) \( v \) :
  upright(" there is a vertex ") u upright(" with ") v arrow.r u arrow.r w } . $

Thus $N_2^(+) \( v \)$ consists of the vertices at directed distance exactly two from $v$.
  Each vertex is counted once, regardless of the number of paths reaching it.
  Seymour’s second neighborhood conjecture asserts that some vertex satisfies $\| N_1^(+) \( v \) \| lt.eq \|
  N_2^(+) \( v \) \|$.

#thm([Theorem 1.1.])[
  #emph[Every nonempty finite oriented graph has a vertex $v$ such that
$ \| N_1^(+) \( v \) \| lt.eq \| N_2^(+) \( v \) \| . $

]
] <thm:main>

Theorem 1 resolves the conjecture positively, without a connectivity or degree hypothesis.
  In particular, a sink already satisfies the conclusion. The conjecture is a basic comparison between the first
  two out-neighborhoods: removing vertices already reached in one step is essential to its assertion.

The theorem also gives the established vertex- and arc-weighted forms of the conjecture through Seacrest’s
  equivalences #cite(label("Seacrest2015")). The vertex-weighted conclusions have two different quantifier orders:
  for every nonnegative weighting there is a suitable vertex,
  and there is a weighting of total mass one for which every vertex is suitable.
  Section 5 states these forms precisely. Section 6 records consequences for short directed cycles.
  In particular, a graph with minimum in- and outdegree at least one third of its order contains a directed triangle.

The conjecture was recorded by Dean and Latka #cite(label("DeanLatka1995")).
  A #emph[tournament] is an oriented graph with an arc between every pair of distinct vertices.
  This case, also known as Dean’s conjecture, was proved by Fisher #cite(label("Fisher1996")) using a probability
  distribution obtained from Farkas’ lemma. Havet and Thomassé gave a combinatorial proof using local median
  orders #cite(label("HavetThomasse2000")). Fidler and Yuster #cite(label("FidlerYuster2007")) extended the
  tournament theorem to tournaments missing a matching, a star, or a clique.
  Ghazal corrected the star-case proof and treated generalized stars #cite(label("Ghazal2012")).
  Subsequent advances include a matching together with a star #cite(label("DaraFrancisJacobNarayanan2022")) and
  two stars #cite(label("DaamouchAlMninyGhazal2025")).

Other approaches impose degree conditions or weaken the desired ratio.
  Kaneko and Locke established the conjecture for minimum outdegree at most six #cite(label("KanekoLocke2001"));
  a recent computer-assisted preprint treats minimum outdegree seven #cite(label("SadhukhanSandeepSen2026")).
  Chen, Shen and Yuster proved a universal second-to-first neighborhood ratio of approximately
  $0.657298$ #cite(label("ChenShenYuster2003")). Huang and Peng raise this to approximately $0.715538$ and
  additionally report a computational bound of $0.74530$ #cite(label("HuangPeng2024")).
  Botler, Moura and Naia #cite(label("BotlerMouraNaia2023")), followed by Espuny Díaz, Girão,
  Granet and Kronenberg #cite(label("EspunyDiazEtAl2025")), studied every orientation of binomial random graphs;
  the latter result covers every fixed edge probability below $1 \/ 2$,
  with probability tending to one as the order tends to infinity.
  Brukhman’s recent dense-case preprint concerns graphs of order $n lt.eq 2 delta + 2$,
  where $delta$ is the minimum outdegree #cite(label("Brukhman2026")).

Our proof builds on the minimal-counterexample and graph-product methods of Brantner, Brockman,
  Kay and Snively #cite(label("BrantnerBrockmanKaySnively2009")) and on Seacrest’s subset
  perspective #cite(label("Seacrest2019")). We adapt the edge-deletion idea in the proof of Seacrest’s Lemma 4 to
  obtain the stronger subset inequality needed here, and give that argument in full.
  The exact set-image convention and inequality are stated below.
  The main additional ingredient is a pruning bound for arbitrary finite binary relations.
  Its deletion cost depends on the points left uncovered after pruning;
  this dependence makes the final extremal argument possible.

===== 1.1 Proof strategy. <proof-strategy.>

For a digraph $D$ and a set $S$ of its vertices, define

$ F_D \( S \) = { y : upright(" there is ") x in S upright(" with ") x arrow.r y } \, wide F_D^2 \( S \) =
  F_D \( F_D \( S \) \) . $

The operator $F_D$ does not subtract $S$. In an oriented graph there is no directed walk of length two from a
  vertex to itself, and hence $N_2^(+) \( v \) = F_D^2 \( { v } \) \\ F_D \( { v } \)$.

We first suppose that a counterexample exists and choose one with minimum order and then minimum number of arcs.
  Deleting carefully chosen arcs shows that every nonempty proper vertex set $S$ satisfies

$ \| F_D^2 \( S \) \\ F_D \( S \) \| < \| F_D \( S \) \\ S \| . $

Replacing each vertex by a sufficiently large transitive tournament turns this into a strict inequality

#[#set math.equation(numbering: n => "(1)")
 $ \| U \| + \| F_G^2 \( U \) \| < 2 \| F_G \( U \) \| $ <eq:overview-concavity>]

for every nonempty proper subset $U$ of the new oriented graph $G$. Every vertex of $G$ has positive indegree.
  These reductions are proved in Section 2.

The obstruction to (1) is an extremal argument on two families of ordered pairs in $V \( G \) times V \( G \)$.
  A coordinate image advances that coordinate along an arc of $G$ and leaves the other coordinate fixed.
  The families are compatible when the first-coordinate image of the left family and the second-coordinate image
  of the right family are disjoint. A point in neither image is called uncovered.
  Require both families to contain the diagonal, write $M$ for their combined size and $d$ for the number of
  uncovered points, and maximize $M + d$ over all such compatible pairs.
  The columns of the left family and the rows of the right family are nonempty proper vertex sets,
  so (1) applies to each of them. Taking complements of the second iterated images then produces prospective
  families with combined size greater than $M + 2 d$.

These families may conflict, but their diagonal members are still present and conflict-free.
  The pruning lemma in Section 3, valid for every finite binary relation,
  restores compatibility and preserves their diagonal members.
  In this application its two deletion-cost terms are at most $d$ and $d'$,
  where $d'$ is the number of points left uncovered by the retained families.
  Thus at most $d + d'$ members are deleted, and the new extremal objective is strictly greater than

$ M + 2 d - \( d + d' \) + d' = M + d . $

Section 4 proves these bounds and obtains the contradiction.
  This is why the pruning lemma must charge part of its cost to the points left uncovered after deletion.

The pruning proof bounds a matching in an augmented bipartite graph.
  Changing the two coordinates of a pair in opposite orders factors the same matrix through two different index
  sets attached to a conflict. A simultaneous maximum-rank choice of the entries makes the kernels of these maps
  control the matching size. The full argument is independent of the orientation assumption and is given in Section 3.

== 2 From a counterexample to a strict subset inequality <sec:reduction>

We first convert a hypothetical counterexample into a graph whose first image is larger than the average of a set
  and its second image. Throughout this section, $F = F_D$ denotes the ordinary union of the out-neighborhoods in
  a specified base graph $D$; in particular, $F \( S \)$ need not be disjoint from $S$.

#thm([Proposition 2.1.])[
  (Counterexample reduction).  #emph[If Theorem 1 has a counterexample,
    then there is a finite nonempty oriented graph $G$ in which every vertex has positive indegree and
#[#set math.equation(numbering: n => "(2)")
 $ \| U \| + \| F_G^2 \( U \) \| < 2 \| F_G \( U \) \| wide
   upright("for every ") diameter eq.not U subset.neq V \( G \) . $ <eq:strict-subset-growth>]

]
] <prop:counterexample-reduction>

There are two steps. Minimality first gives a strict deficit for subsets of a counterexample.
  Replacing each vertex by a sufficiently large transitive tournament then turns that deficit into (2).

The arc-deletion argument below adapts the proof idea of #cite(label("Seacrest2019")) Lemma 4.
  Specializing Seacrest’s parameter $lambda$ to $1$, his statement gives $\| F^2 \( S \) \\ F \( S \) \| < \|
  F \( S \) \|$ in an edge-minimal counterexample when $F \( S \)$ is nonempty.
  Lemma 3 replaces this right-hand bound by $\| F \( S \) \\ S \|$ for nonempty proper $S$,
  under the stronger choice of minimum order and then minimum arc count. We prove this strengthened form in full.

#thm([Lemma 2.2.])[
  (Subset deficit).  #emph[Let $D$ be a finite nonempty oriented graph such that $\| N_1^(+) \( v \) \| > \|
    N_2^(+) \( v \) \|$ for every $v in V \( D \)$. Choose $D$ with minimum order and, subject to that,
    minimum number of arcs among all graphs with this property.
    Then $D$ is strongly connected, every vertex has positive indegree, and
#[#set math.equation(numbering: n => "(3)")
 $ \| F^2 \( S \) \\ F \( S \) \| < \| F \( S \) \\ S \| wide
   upright("for every ") diameter eq.not S subset.neq V \( D \) . $ <eq:subset-deficit>]

]
] <lem:subset-deficit>

#proof[
  A sink satisfies the second-neighborhood inequality, so $D$ has no sink and has more than one vertex.
    If $D$ were not strongly connected, take a strongly connected component with no outgoing arc to another
    component. All first and second out-neighborhoods of its vertices lie in that component.
    Its induced graph would therefore be a smaller counterexample, contrary to the choice of $D$.
    Thus $D$ is strongly connected, and every vertex has an in-neighbor.
  Fix a nonempty proper subset $S$ and put
  $ I = F \( S \) ∩ S \, wide E = F \( S \) \\ S \, wide g \( T \) = \| F \( T \) \\ \( I union T \) \|
    quad \( T subset.eq E \) . $
  Strong connectivity gives $E eq.not diameter$. We will enlarge $T$ from $diameter$ to $E$ so that the increase
    in $g \( T \)$ is strictly smaller than the number of newly adjoined vertices at every step.
  For $T subset.neq E$, let $D_T$ be obtained from the original graph $D$ by deleting all arcs from $S$ to
    $E \\ T$. Since every vertex of $E \\ T$ receives an arc from $S$, at least one arc is deleted.
    Minimality of the number of arcs gives a vertex $v$ satisfying $\| N_(1 \, D_T)^(+) \( v \) \| lt.eq \|
    N_(2 \, D_T)^(+) \( v \) \|$. If $v$ had lost no first out-neighbor,
    deleting arcs could only shrink its exact second out-neighborhood, so it would still violate this inequality.
    Consequently $v in S$, and the set
  $ Q = F \( { v } \) ∩ \( E \\ T \) $
  is nonempty. It is exactly the set of first out-neighbors that $v$ loses.
    The original first out-neighborhood of $v$ is contained in $I union T union Q$,
    and the remaining first out-neighbors lie in $I union T$.
  We compare the exact second out-neighborhoods before and after deletion.
    A two-step path from $v$ in $D_T$ through a vertex of $I subset.eq S$ ends in $I union T$,
    since all arcs from $S$ to $E \\ T$ were deleted. A path through a vertex of $T$ ends in $F \( T \)$. Thus
  #[#set math.equation(numbering: n => "(4)")
   $ F_(D_T)^2 \( { v } \) subset.eq I union T union F \( T \) . $ <eq:deleted-path-endpoints>]
  Every newly counted exact second out-neighbor must have been a first out-neighbor in $D$:
    deletion creates no paths, and $v$ itself is never an exact second out-neighbor.
    Such a vertex lies in $Q$, and (4), together with $Q ∩ \( I union T \) = diameter$, places it in $Q ∩ F \( T \)$.
  On the other hand, define
  $ C = F \( Q \) \\ #scale(x: 120%, y: 120%)[\(] I union T union Q union F \( T \) #scale(x: 120%, y: 120%)[\)] . $
  Every vertex of $C$ was reached from $v$ in two steps through $Q$, and none was a first out-neighbor.
    Also $v in.not F \( Q \)$: an arc from a vertex of $Q$ back to $v$ would oppose the arc from $v$ to that
    vertex. Hence $C subset.eq N_(2 \, D)^(+) \( v \)$. By (4),
    no vertex of $C$ remains reachable in two steps in $D_T$.
  Write $d_1 = \| N_(1 \, D)^(+) \( v \) \|$ and $d_2 = \| N_(2 \, D)^(+) \( v \) \|$.
    The gains and losses just identified imply
  $ d_1 - \| Q \| lt.eq \| N_(2 \, D_T)^(+) \( v \) \| lt.eq d_2 - \| C \| + \| Q ∩ F \( T \) \| . $
  The change in $g$ is exact: adjoining $Q$ removes the points $Q ∩
    F \( T \)$ from the previously counted image and adds precisely $C$. Since $d_2 < d_1$, it follows that
  #[#set math.equation(numbering: n => "(5)")
   $ g \( T union Q \) - g \( T \) = \| C \| - \| Q ∩ F \( T \) \| lt.eq \| Q \| + d_2 -
     d_1 < \| Q \| . $ <eq:deficit-increment>]
  Starting with $T = diameter$, repeat this step until $T = E$.
    Each deletion is performed afresh on the original $D$, so the same minimality argument applies at every step.
    Each $Q$ is a nonempty subset of the part of $E$ not yet adjoined; hence the process terminates.
    Summing (5) and using $g \( diameter \) = 0$ gives $g \( E \) < \| E \|$.
    Finally, $F \( S \) = I union E$ and $F \( I \) subset.eq F \( S \)$, so
  $ F^2 \( S \) \\ F \( S \) = #scale(x: 120%, y: 120%)[\(] F \( I \) union F \( E \)
    #scale(x: 120%, y: 120%)[\)] \\ \( I union E \) = F \( E \) \\ \( I union E \) . $
  Its cardinality is $g \( E \)$, proving (3). ◻
]

We next amplify the integer deficit in (3). Each unit of the base deficit contributes the entire block size;
  the remaining internal contribution costs at most one unit per base vertex.
  The construction below is the lexicographic product $D \[ T_m \]$, where $T_m$ is a transitive tournament.
  The same graph-product construction appears in #cite(label("BrantnerBrockmanKaySnively2009")) Theorem 4.3;
  here we need an estimate for every nonempty proper subset, rather than only for individual vertices.

#thm([Lemma 2.3.])[
  (Transitive-tournament blowup).  #emph[Let $D$ be an oriented graph on $n gt.eq 1$ vertices,
    all of positive indegree, satisfying (3) for every nonempty proper subset of $V \( D \)$.
    For an integer $m > n$, replace each vertex by a transitive tournament on $m$ vertices.
    For every arc $v arrow.r w$ of $D$, put all arcs from the block at $v$ to the block at $w$,
    and put no other arcs between distinct blocks. The resulting graph $G$ is oriented,
    all its indegrees are positive, and it satisfies (2).]
] <lem:blowup>

#proof[
  Label the vertices within each block by $1 \, dots.h \, m$, with arcs from smaller to larger labels.
    Let $f$ be the image operator within this transitive tournament.
    For a nonempty set $T$ of labels with least element $a$, we have $f \( T \) = { a + 1 \, dots.h \, m }$. Thus
  #[#set math.equation(numbering: n => "(6)")
   $ \| T \| - \| f \( T \) \| lt.eq 1 \, wide f^2 \( T \) subset.eq f \( T \) \, wide \| T \| -
     2 \| f \( T \) \| + \| f^2 \( T \) \| lt.eq 1 . $ <eq:internal-block-bound>]
  The construction produces an oriented graph. Every vertex receives arcs from an incoming base block,
    so all indegrees in $G$ are positive. Call an arc external if it joins distinct blocks, and internal otherwise.
  Fix $diameter eq.not U subset.neq V \( G \)$. Write $T_v$ for the labels selected by $U$ in the block at $v$,
    and define its support and a set of base vertices by
  $ S = { v in V \( D \) : T_v eq.not diameter } \, wide H_0 = F \( S \) union F^2 \( S \) . $
  Every block indexed by $F \( S \)$ is filled by $F_G \( U \)$.
    In each remaining block the first image consists exactly of $f \( T_v \)$, so
  $ \| F_G \( U \) \| = m \| F \( S \) \| + sum_(v in S \\ F \( S \)) \| f \( T_v \) \| . $
  A two-step path using two external arcs ends in an $F^2 \( S \)$-block.
    One using exactly one external arc ends in an $F \( S \)$-block,
    regardless of the order of its internal and external steps.
    Paths using only internal arcs contribute $f^2 \( T_v \)$. Therefore
  $ \| F_G^2 \( U \) \| lt.eq m \| H_0 \| + sum_(v in S \\ H_0) \| f^2 \( T_v \) \| . $
  Combining these estimates gives the sharper bound
  #[#set math.equation(numbering: n => "(7)")
   $ \| U \| - 2 \| F_G \( U \) \| + \| F_G^2 \( U \) \| & lt.eq m #scale(x: 120%, y: 120%)[\(] \| H_0 \| -
     2 \| F \( S \) \| #scale(x: 120%, y: 120%)[\)] + sum_(v in S) \| T_v \|\
 & quad - 2 sum_(v in S \\ F \( S \)) \| f \( T_v \) \| + sum_(v in S \\ H_0) \| f^2 \( T_v \) \| . $ <eq:blowup-sharp>]
  Since $F \( S \) subset.eq H_0$, extending the last sum to $S \\ F \( S \)$ only adds nonnegative terms.
    This may count internal second images in blocks already bounded by a full block in (7);
    it remains a valid upper bound. Now use $\| T_v \| lt.eq m$ on $S ∩ F \( S \)$ and (6) on $S \\ F \( S \)$ to obtain
  $ \| U \| - 2 \| F_G \( U \) \| + \| F_G^2 \( U \) \| & lt.eq m #scale(x: 120%, y: 120%)[\(] \| H_0 \| -
    2 \| F \( S \) \| + \| S ∩ F \( S \) \| #scale(x: 120%, y: 120%)[\)] + \| S \\ F \( S \) \|\
 & lt.eq m #scale(x: 120%, y: 120%)[\(] \| F^2 \( S \) \\ F \( S \) \| - \| F \( S \) \\ S \|
   #scale(x: 120%, y: 120%)[\)] + n . $
  If $S subset.neq V \( D \)$, the parenthesized difference is an integer strictly less than zero by (3).
    The last bound is consequently at most $- m + n < 0$.
  It remains to consider $S = V \( D \)$, for which the subset-deficit hypothesis does not apply.
    Positive indegrees in $D$ give $F \( S \) = V \( D \)$, so $F_G \( U \) = V \( G \)$.
    Positive indegrees in $G$ then give $F_G^2 \( U \) = V \( G \)$ as well. In this case
  $ \| U \| - 2 \| F_G \( U \) \| + \| F_G^2 \( U \) \| = \| U \| - \| V \( G \) \| < 0 \, $
  because $U$ is proper. This proves the required inequality for every allowed $U$. ◻
]

#proof[
  Choose a counterexample of minimum order and then minimum number of arcs.
    Lemma 3 supplies positive indegrees and the subset deficit, so Lemma 4,
    with any integer $m > \| V \( D \) \|$, supplies the required graph $G$. ◻
]

== 3 Pruning two families of pairs <sec:pruning>

We now prove a deletion bound for two families of ordered pairs.
  The bound charges the deleted members to two sets of pairs:
  one determined by the original conflicts, and the other consisting of points left uncovered after deletion.
  This dependence on the surviving families will be essential in Section 4.
  The result holds for every finite binary relation; no orientation assumption is needed.

#thm([Lemma 3.1.])[
  (Pruning).  #emph[Let $X$ be a finite set with a binary relation denoted by $arrow.r$, and let $cal(R) \,
    cal(C) subset.eq X times X$ be two families, regarded as separate copies even when their coordinates agree.
    Say that $\( p \, j \) in cal(R)$ and $\( i \, s \) in cal(C)$ #emph[conflict] if
$ p arrow.r i wide upright("and") wide s arrow.r j . $

 Define
$ Z & = { \( i \, j \) : upright("some ") \( p \, j \) in cal(R) upright(" conflicts with some ") \( i \, s \) in
  cal(C) } \,\
H & = { \( p \, s \) : upright("some ") \( p \, j \) in cal(R) upright(" conflicts with some ") \( i \, s \) in
  cal(C) } . $

 A point $\( i \, j \)$ is #emph[covered] by a member $\( p \, j \) in cal(R)$ when $p arrow.r i$,
   and by a member $\( i \, s \) in cal(C)$ when $s arrow.r j$. These are the only ways a member covers a point.]
  #emph[There are subfamilies $cal(R)' subset.eq cal(R)$ and $cal(C)' subset.eq
    cal(C)$ with no conflicts between them such that every initially conflict-free member is retained and
#[#set math.equation(numbering: n => "(8)")
 $ \| cal(R) \\ cal(R)' \| + \| cal(C) \\ cal(C)' \| lt.eq \| \| H + \| { z in Z :
   z upright(" is covered by no member of ") cal(R)' union cal(C)' } \| . $ <eq:pruning-bound>]

 The two sides are counted separately throughout.]
] <lem:pruning>

The proof will bound a matching in an augmented bipartite graph by using matrix ranks.
  We first record the elementary rank fact that makes the argument work.
  For finite index sets $I \, J$, a matrix supported on $T subset.eq I times
  J$ means a real matrix whose entries outside $T$ are zero; entries in $T$ are allowed to vanish.

#thm([Lemma 3.2.])[
  (Kernels at maximum support rank).  #emph[Let $T subset.eq I times J$, where $I$ and $J$ are finite.
    Suppose that $D : bb(R)^J arrow.r bb(R)^I$ has maximum rank among all real matrices supported on $T$.
    Then, for every $x in ker D$, every $y in ker D^(sans(T))$, and every $\( s \, j \) in T$, one has $x_j y_s = 0$.]
] <lem:kernel-support>

#proof[
  Suppose instead that $x_j y_s eq.not 0$. For a nonzero real $tau$, the matrix $D_tau = D +
    tau e_s e_j^(sans(T))$ is still supported on $T$, and
  $ D_tau x = tau x_j e_s . $
  Thus $e_s in "im" D_tau$. Moreover, for every $w in bb(R)^J$,
  $ D w = D_tau w - tau w_j e_s in "im" D_tau \, $
  so the entire old image $"im" D$ is contained in $"im" D_tau$.
    On the other hand, $y$ annihilates $"im" D$ and $y_s eq.not 0$, so $e_s in.not "im" D$.
    Therefore $"rank" D_tau > "rank" D$, a contradiction. ◻
]

#proof[
  If there are no conflicts, retain every member; then $Z = H = diameter$ and the assertion is immediate.
    In what follows, all vector spaces have their usual coordinate bases.
    Empty minors have determinant $1$, so the rank arguments also apply when a matching or an index set is empty.
  #emph[The augmented graph and the required matching bound.] Form a bipartite graph $Gamma$ with parts
  $ cal(V)_L = cal(R) union.sq Z_L \, wide cal(V)_R = cal(C) union.sq Z_R \, $
  where $Z_L$ and $Z_R$ are separate copies of $Z$, disjoint also from the two original families.
    Join conflicting original members. Also join each original member to the opposite copy of every point of $Z$
    that it covers. There are no edges between $Z_L$ and $Z_R$.
    Figure 1 displays the three edges forced by one conflict.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 0.8cm, height: 0.8cm, inset: 0.1058cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$z_L$]]])])
  content((2.717, -0.2828), (3.283, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$c$]]], frame: "circle", fill: rgb("#ededed"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.717, -0.2828), (6.283, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$r$]]], frame: "circle", fill: rgb("#ededed"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((9, 0), [#box(width: 0.8cm, height: 0.8cm, inset: 0.1058cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$z_R$]]])])
  line((0.4, 0), (2.593, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((1.5, 0.1411), [#text(size: 9pt)[covers $z$]], anchor: "south", padding: 0.1176cm)
  line((3.407, 0), (5.593, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.5, 0.1411), [#text(size: 9pt)[conflict]], anchor: "south", padding: 0.1176cm)
  line((6.407, 0), (8.6, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((7.5, 0.1411), [#text(size: 9pt)[covers $z$]], anchor: "south", padding: 0.1176cm)
  content((0, -0.6117), [#text(size: 9pt)[$Z_L$]], anchor: "north", padding: 0.1176cm)
  content((3, -0.6187), [#text(size: 9pt)[$cal(C) :#h(0.3333em) (i,s)$]], anchor: "north", padding: 0.1176cm)
  content((6, -0.6187), [#text(size: 9pt)[$cal(R) :#h(0.3333em) (p,j)$]], anchor: "north", padding: 0.1176cm)
  content((9, -0.6117), [#text(size: 9pt)[$Z_R$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: A conflict between $r = \( p \, j \)$ and $c = \( i \, s \)$ forces this path, where $z = \( i \, j \) in Z$. The copies $z_L$ and $z_R$ are distinct vertices. The vertices alternate between the two sides of the bipartition. Different conflicts can share vertices and edges; the full augmented graph need not be a disjoint union of such paths. ],
  ) <fig:pruning>
  An initially conflict-free member is isolated in $Gamma$.
    Indeed, if $\( p \, j \) in cal(R)$ covered $\( i \, j \) in Z$,
    an original conflict witnessing $\( i \, j \) in Z$ would supply a member $\( i \, s \) in cal(C)$ with $s
    arrow.r j$. This member would conflict with $\( p \, j \)$.
    The same argument with the sides exchanged applies to $cal(C)$.
  It suffices to find a vertex cover $K$ of $Gamma$ of size at most $\| \| Z + \| \| H$,
    omitting isolated vertices. Delete precisely its original members. No conflict then survives.
    If $q$ points of $Z$ are uncovered by the surviving members, each of the other $\| \| Z -
    q$ points has a surviving member adjacent to one of its two copies. That copy must lie in $K$.
    Distinct points require distinct new vertices, whence
  #[#set math.equation(numbering: n => "(9)")
   $ \| K ∩ \( cal(R) union.sq cal(C) \) \| lt.eq \| \| K - \( \| \| Z - q \) lt.eq \| \| H + q . $ <eq:cover-charge>]
  Thus the cover gives exactly (8) and retains every initially conflict-free member.
  We will obtain this cover by proving that a maximum matching in $Gamma$ has size at most $\| \| Z + \| \|
    H$ and then giving the usual alternating-path construction of the cover.
    Choose a maximum matching $cal(M)$ with the fewest edges between original members.
    Write $k$ for the number of these edges, and let $alpha$ and $beta$ be its edges in $cal(R) times
    Z_R$ and $Z_L times cal(C)$, respectively. Put
  $ ell = \| alpha \| \, wide t = \| beta \| \, wide \| cal(M) \| = k + ell + t . $
  Each of $alpha$ and $beta$ is a maximum matching in its own subgraph.
    For example, if the $cal(R)$–$Z_R$ subgraph had a larger matching,
    its symmetric difference with $alpha$ would contain an $alpha$-augmenting path,
    starting at an $alpha$-unmatched member of $cal(R)$ and ending at an $alpha$-unmatched vertex of $Z_R$.
    The latter vertex is unmatched in $cal(M)$, and every internal vertex of the path is matched by $alpha$.
    If the starting member is unmatched in $cal(M)$, augmenting gives a larger matching in $Gamma$.
    Otherwise it lies on an original–original edge of $cal(M)$; remove that edge and augment along the path.
    This preserves the total size and reduces $k$. Both conclusions contradict the choice of $cal(M)$.
    The proof for $beta$ is identical with the sides exchanged.
    Denote by $R_alpha subset.eq cal(R)$ and $C_beta subset.eq
    cal(C)$ the original vertices matched by these two matchings.
  #emph[Four maps and a simultaneous choice of coefficients.] To bound $k + ell + t$,
    we encode the two maximum matchings by matrix ranks. For each arrow $x arrow.r y$,
    introduce independent variables $a_(x y)$ and $b_(x y)$, with the two arrays independent of one another.
    Set both entries to zero when $x ↛ y$. We shall choose real values for all the variables shortly.
    For any real assignment, define four maps by
  $ bb(R)^(cal(R)) & arrow.r^(med L med) & bb(R)^Z\
B arrow.b &  & arrow.b N\
bb(R)^H & arrow.r^(med A med) & bb(R)^(cal(C)) $
  with entries
  #[#set math.equation(numbering: n => "(10)")
   $ L_(\( i \, j \) \, \( p \, j \)) & = a_(p i) \, & N_(\( i \, s \) \, \( i \, j \)) & = b_(s j) \,\
B_(\( p \, s \) \, \( p \, j \)) & = b_(s j) \, & A_(\( i \, s \) \, \( p \, s \)) & = a_(p i) . $ <eq:pruning-maps>]
  The row and column indices in each formula range over its indicated coordinate sets,
    and every entry not of a listed form is zero. The maps $L \,
    A$ change the first coordinate forward along $p arrow.r i$; $N \,
    B$ change the second coordinate backward from $j$ to $s$ along $s arrow.r j$.
    For a conflict, the two routes from $\( p \, j \)$ to $\( i \, s \)$ change the coordinates in opposite
    orders, through $\( i \, j \) in Z$ or $\( p \, s \) in H$.
    For a fixed column $\( p \, j \) in cal(R)$ and row $\( i \, s \) in cal(C)$,
    the only possible intermediate index in $N L$ is $\( i \, j \)$,
    and the only possible one in $A B$ is $\( p \, s \)$. If the two endpoints conflict,
    these indices belong to $Z$ and $H$, respectively, and both products have entry $a_(p i) b_(s j)$.
    If they do not conflict, at least one factor is zero in both products. Hence
  #[#set math.equation(numbering: n => "(11)")
   $ N L = A B . $ <eq:pruning-commute>]
  We seek an assignment for which
  $ "rank" L = ell \, wide "rank" N = t \, wide dim ker A gt.eq k . $
  These three conditions give the desired matching bound. Indeed, rank–nullity and $N L = A B$ would give
  #[#set math.equation(numbering: n => "(12)")
   $ \| \| H & = dim ker A + "rank" A\
 & gt.eq k + "rank" A gt.eq k + "rank" \( N L \)\
 & gt.eq k + ell + t - \| \| Z . $ <eq:pruning-rank-bound>]
  The last inequality follows by restricting $N$ to $"im" L$:
  $ "rank" \( N L \) = dim "im" L - dim \( "im" L ∩ ker N \) gt.eq ell - \( \| \| Z - t \) . $
  The first two rank conditions will come from $alpha$ and $beta$.
    For the third, we will lift the $k$ original left endpoints to vectors $u^r in ker
    L$ and show that their images $B u^r$ are independent. The identity $A B = N L$ places these images in $ker A$.
  Our choice of coefficients uses the correspondence between generic matrix rank and maximum matching
    size #cite(label("Edmonds1967")) Section 5, Theorem 1. We apply the determinant argument within coordinate
    blocks and verify that all required minors can be nonzero at the same assignment.
    We choose the coefficients so that $"rank" L = ell$, with its $R_alpha$ columns a basis of $"im" L$,
    and $"rank" N^(sans(T)) = t$, with its $C_beta$ columns a basis of $"im" N^(sans(T))$.
    To justify this choice, a nonzero minor of $L$ requires a matching between its column and row indices:
    a nonzero term in its determinant supplies the matching. Since $alpha$ is maximum, $"rank" L lt.eq
    ell$ for every coefficient assignment. The square minor using precisely the endpoints of $alpha$ is,
    up to row and column ordering, block diagonal by the second coordinate $j$.
    In each block all allowed entries are distinct variables $a_(p i)$.
    The matching gives a determinant monomial that cannot cancel,
    because different permutations use different sets of these variables.
    Each block determinant is therefore a nonzero polynomial, and so is their product.
    Variables may occur in more than one block, but a product of nonzero polynomials remains nonzero.
    This proves the required independence when that minor does not vanish.
    For $N^(sans(T))$ the same argument uses blocks with the first coordinate $i$ fixed and distinct variables
    $b_(s j)$ within each block.
  One additional finite collection of rank conditions will be needed. For every arrow $p arrow.r i$, define
  $ J_p = { j : \( p \, j \) in cal(R) } \, wide S_i = { s : \( i \, s \) in cal(C) } \, wide
    D^(p \, i) = \( b_(s j) \)_(s in S_i \, med j in J_p) . $
  We require $D^(p \, i)$ to have maximum rank among all matrices supported on
  $ T^(p \, i) = { \( s \, j \) in S_i times J_p : s arrow.r j } . $
  These matrices will let Lemma 6 compare restrictions of vectors in $ker B$ and $ker N^(sans(T))$.
    The allowed entries of each individual $D^(p \, i)$ are independent variables.
    A minor attaining its maximum possible rank at some assignment is therefore a nonzero polynomial in the $b$
    variables. Choose one such minor for each arrow, taking the empty minor when the maximum rank is zero.
    Multiply these finitely many polynomials with the two matching minors just described.
    The product is nonzero in the polynomial ring generated by all $a$ and $b$ variables,
    even though variables are shared between different matrices.
    A nonzero real polynomial is nonzero at some real assignment,
    as follows by induction on its number of variables. Fix such an assignment once and for all.
    It gives these support ranks and the two basis properties simultaneously.
  For every edge $\( r \, c \)$ of $cal(M)$ between original members, the basis properties now give vectors
  #[#set math.equation(numbering: n => "(13)")
   $ u^r & = e_r + sum_(a in R_alpha) lambda_a^r e_a in ker L \,\
v^c & = e_c + sum_(b in C_beta) mu_b^c e_b in ker N^(sans(T)) . $ <eq:pruning-lifts>]
  The original–original endpoints are disjoint from $R_alpha$ and $C_beta$, respectively.
    In particular, the $u^r$ restrict to distinct unit vectors on the $k$ original left endpoints, and $v_c^c = 1$.
  #emph[The kernel restriction and the matching bound.] It remains to show that the $k$ lifts just constructed
    give independent vectors $B u^r$. The key assertion, at our fixed coefficient assignment, is
  #[#set math.equation(numbering: n => "(14)")
   $ u_(p j) v_(i s) = 0 quad upright("for every conflict ") \( \( p \, j \) \, \( i \, s \) \) \, quad
     u in ker B \, quad v in ker N^(sans(T)) . $ <eq:conflict-kernel>]
  Here the assertion quantifies over #emph[all] vectors in the two kernels.
  To prove it, fix an arrow $p arrow.r i$. For $u in ker B$, consider the vector $\( u_(p j) \)_(j in J_p)$.
    If a row $s in S_i$ of $D^(p \, i)$ has an allowed entry, choose $j in J_p$ with $s arrow.r j$.
    Then $\( p \, j \)$ and $\( i \, s \)$ conflict, so $\( p \, s \) in H$.
    The complete equation of $B u = 0$ at this coordinate is
  #[#set math.equation(numbering: n => "(15)")
   $ sum_(j in J_p) b_(s j) u_(p j) = 0 . $ <eq:pruning-row-equation>]
  If the row has no allowed entry, this equation holds because all its coefficients are zero.
    Thus it holds for every $s in S_i$, including rows for which $\( p \, s \)$ is absent from $H$.
    Consequently $\( u_(p j) \)_(j in J_p) in ker D^(p \, i)$.
  Similarly, let $v in ker N^(sans(T))$. If a column $j in J_p$ of $D^(p \, i)$ has an allowed entry,
    choose $s in S_i$ with $s arrow.r j$. The resulting conflict implies $\( i \, j \) in Z$,
    and the complete equation of $N^(sans(T)) v = 0$ at this coordinate is
  #[#set math.equation(numbering: n => "(16)")
   $ sum_(s in S_i) b_(s j) v_(i s) = 0 . $ <eq:pruning-column-equation>]
  Columns with no allowed entries satisfy the same equation automatically.
    Hence $\( v_(i s) \)_(s in S_i) in ker \( D^(p \, i) \)^(sans(T))$.
    Since $D^(p \, i)$ has maximum rank on its allowed support, Lemma 6 gives $u_(p j) v_(i s) =
    0$ whenever $s arrow.r j$, proving (14). The hypothetical single-entry perturbation in that lemma concerns
    only $D^(p \, i)$; it need not preserve any other rank condition.
    The conclusion holds for every pair of kernel vectors at the fixed, original assignment.
  For each original–original matched edge $\( r \, c \)$, substitute $v = v^c$ in (14).
    Since $v_c^c = 1$, every vector in $ker B$ vanishes at $r$.
    It follows that the vectors $B u^r$, as $r$ ranges over the $k$ original left endpoints,
    are linearly independent. Indeed, a relation
  $ sum_r theta_r B u^r = 0 $
  puts the single vector $u = sum_r theta_r u^r$ in $ker B$.
    Its coordinate at each such endpoint $r$ is $u_r = theta_r$, by (13).
    All these coordinates vanish, so every $theta_r$ is zero. Furthermore,
  $ A \( B u^r \) = N L u^r = 0 $
  by (11). Thus $dim ker A gt.eq k$, establishing the third rank condition.
    Equation (12) now gives $\| cal(M) \| = k + ell + t lt.eq \| \| Z + \| \| H$, as required.
  #emph[From the matching bound to a pruning.] For completeness,
    we give the matching-to-cover argument in Kőnig’s theorem #cite(label("konig1931")).
    Starting at all unmatched vertices of $cal(V)_L$, follow edges outside $cal(M)$ from left to right and edges
    in $cal(M)$ from right to left. Let $W_L \, W_R$ be the reached vertices on the two sides.
    No unmatched right vertex is reached, since an alternating path to one would augment the maximum matching.
    The endpoints of a matched edge are either both reached or both unreached:
    a reached right endpoint leads to its mate, and a matched left endpoint can only have been reached through its
    mate. It follows that
  $ K = \( cal(V)_L \\ W_L \) union W_R $
  covers every edge. Indeed, an edge from a reached left vertex to an unreached right vertex could be neither an
    unmatched edge, which would be traversed, nor a matched edge, whose endpoints have the same reachability.
    The cover contains exactly one endpoint of each matched edge and no unmatched vertices.
    Hence $\| \| K = \| cal(M) \| lt.eq \| \| Z + \| \| H$; it also omits isolated vertices.
    Applying (9) to this $K$ proves the lemma. ◻
]

== 4 The extremal contradiction <sec:incompatibility>

We use Lemma 5 to rule out the graph supplied by Proposition 2.
  The proof converts the strict subset inequalities into a strict increase of an extremal quantity associated with
  two families of ordered pairs.

#thm([Proposition 4.1.])[
  #emph[There is no nonempty finite oriented graph $G$ in which every vertex has an in-neighbor and whose one-step
    image operator
$ F \( U \) = { y in V \( G \) : x arrow.r y upright(" for some ") x in U } $

 satisfies
#[#set math.equation(numbering: n => "(17)")
 $ \| U \| + \| F^2 \( U \) \| < 2 \| F \( U \) \| wide \( diameter eq.not U subset.neq V \( G \) \) \,
   $ <eq:impossible-concavity>]

 where $F^2 = F compose F$.]
] <prop:no-concavity>

#proof[
  Suppose that such a graph exists, and put $X = V \( G \)$.
    For $S subset.eq X times X$, define the two coordinate image operators by
  $ F_1 S & = { \( i \, j \) : \( p \, j \) in S upright(" and ") p arrow.r i upright(" for some ") p in X } \,\
F_2 S & = { \( i \, j \) : \( i \, s \) in S upright(" and ") s arrow.r j upright(" for some ") s in X } . $
  Write $F_1^2 = F_1 compose F_1$, $F_2^2 = F_2 compose F_2$, and $Delta = { \( v \, v \) : v in X }$.
    Call $P \, Q subset.eq X times X$ #emph[compatible] if $F_1 P ∩ F_2 Q = diameter$.
    Equivalently, no left member $\( p \, j \) in P$ and right member $\( i \, s \) in Q$ satisfy both $p arrow.r
    i$ and $s arrow.r j$; this is precisely the conflict relation in Lemma 5.
  The pair $P = Q = Delta$ is compatible: a point $\( i \, j \)$ in both images would require $j arrow.r
    i$ and $i arrow.r j$, contrary to orientation. Thus we may choose,
    among all compatible pairs with $Delta subset.eq P ∩ Q$, one maximizing $M + d$, where
  $ M = \| P \| + \| Q \| \, wide d = \| X \|^2 - \| F_1 P \| - \| F_2 Q \| . $
  Such a maximum exists because $X$ is finite. Compatibility makes $d$ the number of points outside $F_1 P union
    F_2 Q$. Including these uncovered points in the objective lets the points left uncovered by pruning offset the
    corresponding part of the deletion cost.
  Every column $P_j = { p : \( p \, j \) in P }$ is nonempty, since $j in P_j$. It is also proper.
    Indeed, positive indegrees give $F \( X \) = X$, so $P_j = X$ would imply $X times { j } subset.eq F_1 P$.
    Choose an in-neighbor $w$ of $j$. Then $\( w \, j \) in F_2 Delta subset.eq F_2 Q$,
    contradicting compatibility. Likewise every row $Q_i = { s : \( i \, s \) in Q }$ contains $i$.
    If $Q_i = X$, then ${ i } times X subset.eq F_2 Q$; choosing $w arrow.r
    i$ gives $\( i \, w \) in F_1 Delta subset.eq F_1 P$, again a contradiction.
    We can therefore sum (17) over the columns of $P$ and over the rows of $Q$ to obtain
  #[#set math.equation(numbering: n => "(18)")
   $ \| P \| + \| F_1^2 P \| < 2 \| F_1 P \| \, wide \| Q \| + \| F_2^2 Q \| < 2 \| F_2 Q \| . $ <eq:strict-fiber-sums>]
  Define new left and right families by taking complements in $X times X$:
  $ cal(R) = \( X times X \) \\ F_2^2 Q \, wide cal(C) = \( X times X \) \\ F_1^2 P . $
  The two strict inequalities in (18) give
  #[#set math.equation(numbering: n => "(19)")
   $ \| cal(R) \| + \| cal(C) \| & = 2 \| X \|^2 - \| F_2^2 Q \| - \| F_1^2 P \|\
 & > 2 \| X \|^2 + M - 2 #scale(x: 120%, y: 120%)[\(] \| F_1 P \| + \| F_2 Q \| #scale(x: 120%, y: 120%)[\)] = M +
   2 d . $ <eq:complement-gain>]
  These families need not be compatible. We will apply the pruning lemma,
    first verifying that the diagonal survives and then bounding the cost.
  Both families contain $Delta$. If $\( v \, v \) in F_2^2 Q$, there is an $s arrow.r
    v$ with $\( v \, s \) in F_2 Q$. But $\( s \, s \) in P$ gives $\( v \, s \) in F_1 P$, a contradiction.
    If $\( v \, v \) in F_1^2 P$, there is a $p arrow.r v$ with $\( p \, v \) in F_1 P$.
    Now $\( p \, p \) in Q$ gives $\( p \, v \) in F_2 Q$, the same contradiction.
  Moreover, each diagonal member is conflict-free in the new families.
    A conflict between the left member $\( v \, v \)$ and a right member $\( i \, s \) in
    cal(C)$ would give the path $s arrow.r v arrow.r i$. Starting at $\( s \, s \) in
    P$ and expanding its first coordinate twice would then put $\( i \, s \)$ in $F_1^2 P$,
    contrary to its membership in $cal(C)$. A conflict between a left member $\( p \, j \) in
    cal(R)$ and the right member $\( v \, v \)$ would give $p arrow.r v arrow.r j$.
    Expanding the second coordinate of $\( p \, p \) in Q$ twice would put $\( p \, j \)$ in $F_2^2 Q$,
    again a contradiction. The preservation clause of Lemma 5 thus applies to every diagonal member on both sides.
  Let $H \, Z subset.eq X times X$ be the sets associated with $cal(R) \, cal(C)$ in that lemma. Thus each conflict
  $ \( p \, j \) in cal(R) \, quad \( i \, s \) in cal(C) \, quad p arrow.r i \, quad s arrow.r j $
  contributes $\( p \, s \)$ to $H$ and $\( i \, j \)$ to $Z$. We claim that
  #[#set math.equation(numbering: n => "(20)")
   $ H subset.eq \( X times X \) \\ \( F_1 P union F_2 Q \) \, wide upright("and hence") wide \| H \| lt.eq
     d . $ <eq:old-uncovered-bound>]
  To see this, fix such a conflict. If $\( p \, s \) in F_1 P$, choose $\( u \, s \) in P$ with $u arrow.r p$.
    The path $u arrow.r p arrow.r i$ then puts $\( i \, s \)$ in $F_1^2 P$, contrary to $\( i \, s \) in cal(C)$.
    If $\( p \, s \) in F_2 Q$, choose $\( p \, t \) in Q$ with $t arrow.r s$.
    The path $t arrow.r s arrow.r j$ puts $\( p \, j \)$ in $F_2^2 Q$, contrary to $\( p \, j \) in cal(R)$.
    This proves (20).
  Apply Lemma 5 to obtain conflict-free families $P' subset.eq cal(R)$ and $Q' subset.eq cal(C)$.
    They still contain $Delta$, and their lack of conflicts means $F_1 P' ∩ F_2 Q' = diameter$. Set
  $ d' = \| X \|^2 - \| F_1 P' \| - \| F_2 Q' \| . $
  A point is covered by a kept left member exactly when it belongs to $F_1 P'$,
    and by a kept right member exactly when it belongs to $F_2 Q'$.
    Consequently at most $d'$ points of $Z$ are uncovered after pruning.
    By Lemma 5 and (20), at most $d + d'$ members were deleted, counting the two sides separately.
    Using (19), we conclude that
  $ \| P' \| + \| Q' \| + d' & gt.eq \| cal(R) \| + \| cal(C) \| - \( d + d' \) + d'\
 & > M + 2 d - \( d + d' \) + d' = M + d . $
  This contradicts the choice of $P \, Q$ and proves the proposition. ◻
]

#proof[
  If the theorem were false, Proposition 2 would produce a nonempty finite oriented graph with positive indegrees
    satisfying (17) for every nonempty proper vertex set. Proposition 7 rules out such a graph. ◻
]

== 5 Weighted consequences <sec:weighted-consequences>

The following corollary applies Theorem 1 through Seacrest’s established equivalences of the corresponding
  assertions over all nonempty finite oriented graphs #cite(label("Seacrest2015")).
  The equivalences themselves are not new here.

#thm([Corollary 5.1.])[
  (Weighted second-neighborhood forms).  #emph[Let $D$ be a nonempty finite oriented graph,
    and write $A \( D \)$ for its arc set. For a vertex weighting $eta : V \( D \) arrow.r \[ 0 \, oo \)$,
    write $eta \( S \) = sum_(x in S) eta \( x \)$. Then the following hold.]
  + #emph[For every vertex weighting $eta : V \( D \) arrow.r \[ 0 \, oo \)$,
    there is a vertex $v in V \( D \)$ such that
$ eta \( N_1^(+) \( v \) \) lt.eq eta \( N_2^(+) \( v \) \) . $

]
  + #emph[There is a vertex weighting $eta : V \( D \) arrow.r \[ 0 \, oo \)$ with $sum_(x in V \( D \))
    eta \( x \) = 1$ such that
$ eta \( N_1^(+) \( v \) \) lt.eq eta \( N_2^(+) \( v \) \) wide upright("for every ") v in V \( D \) . $

 The entries of this weighting need not all be positive.]
  + #emph[For every arc weighting $w : A \( D \) arrow.r \[ 0 \, oo \)$,
    extend the notation by setting $w \( v s \) = 0$ when $v s in.not A \( D \)$. For $v \, s in V \( D \)$, put
$ beta_v^w \( s \) = max #scale(x: 180%, y: 180%)[\(] { 0 } union { w \( u s \) - w \( v s \) : u in V \( D \) \,
  med v arrow.r u arrow.r s } #scale(x: 180%, y: 180%)[\)] . $

 Then there is a vertex $v in V \( D \)$ such that
$ sum_(s in V \( D \)) beta_v^w \( s \) gt.eq sum_(u in N_1^(+) \( v \)) w \( v u \) . $

 The maximum is zero if there is no indicated two-step path.
   Such paths are determined by the arcs of $D$, so an arc of weight zero is still present and is not treated as a
   missing arc.]
] <cor:weighted-forms>

#proof[
  Seacrest’s Proposition 2 proves that his arc-weighted Conjecture 4 is equivalent to the unweighted conjecture,
    so Theorem 1 gives (iii).
  To obtain (i), set $w \( u s \) = eta \( s \)$ on every arc. For each $v \, s$,
  $ beta_v^w \( s \) = cases(delim: "{", eta \( s \) \, & s in N_2^(+) \( v \) \,, 0 \, & s in.not N_2^(+) \( v \) .) $
  Indeed, when $v arrow.r s$, every eligible difference $w \( u s \) - w \( v s \)$ is zero.
    At an exact second out-neighbor, $w \( v s \) = 0$ and the maximum is $eta \( s \)$;
    no other endpoint contributes. Thus the two sides of (iii) become $eta \( N_2^(+) \( v \) \)$ and
    $eta \( N_1^(+) \( v \) \)$. This is the specialization noted immediately after Seacrest’s Proposition 2.
  For (ii), let $M_D$ have entry $1$ at $\( v \, s \)$ when $s in N_2^(+) \( v \)$, entry $-
    1$ when $s in N_1^(+) \( v \)$, and zero otherwise. Reversing all arcs transposes this matrix:
    $M_(arrow.l(D)) = M_D^(sans(T))$. Seacrest’s Theorem 1 applies Farkas’ lemma to give either a nonzero $eta
    gt.eq 0$ with $M_D eta gt.eq 0$, or a $xi gt.eq 0$ with $M_D^(sans(T)) xi < 0$ at every coordinate.
    The latter contradicts (i) on $arrow.l(D)$. Normalize the former weighting to total weight one, proving (ii). ◻
]

== 6 Directed-cycle consequences <sec:directed-cycle-consequences>

In an oriented graph with no directed triangle, every exact second out-neighbor is a non-neighbor.
  Combining this observation with Theorem 1 gives degree and order bounds.
  The first assertion below is the oriented-graph form of Thomassé’s non-neighbor statement recorded by
  Sullivan #cite(label("Sullivan2006")) Conjecture 6.12. The consequence using both minimum indegree and minimum
  outdegree is also noted in #cite(label("Sullivan2006")) Section 3.
  The regular case gives the girth-four lower bound in the Behzad–Chartrand–Wall minimum-order
  conjecture #cite(label("BehzadChartrandWall1970")), also recorded by Sullivan #cite(label("Sullivan2006")) Section 4.

#thm([Corollary 6.1.])[
  (Non-neighbors and directed cycles).  #emph[Let $D$ be a nonempty finite oriented graph of order $n$.
    For $v in V \( D \)$, write
$ N_1^(-) \( v \) = { u : u arrow.r v } \, wide d^plus.minus \( v \) = \| N_1^plus.minus \( v \) \| \, wide
  delta^plus.minus \( D \) = min_(x in V \( D \)) d^plus.minus \( x \) . $

 Define the non-neighbors of $v$, excluding $v$ itself, by
$ Z \( v \) = V \( D \) \\ #scale(x: 120%, y: 120%)[\(] { v } union N_1^(+) \( v \) union N_1^(-) \( v \)
  #scale(x: 120%, y: 120%)[\)] . $

 Then the following hold.]
  + #emph[If $D$ has no directed $3$-cycle, then some vertex $v$ satisfies
$ d^(+) \( v \) lt.eq \| Z \( v \) \| \, wide n - 1 gt.eq 2 d^(+) \( v \) + d^(-) \( v \) . $

]
  + #emph[If $delta^(+) \( D \) gt.eq n \/ 3$ and $delta^(-) \( D \) gt.eq n \/ 3$,
    then $D$ contains a directed $3$-cycle.]
  + #emph[If $r gt.eq 1$ is an integer, $d^(+) \( v \) = d^(-) \( v \) = r$ for every vertex,
    and $D$ has directed girth exactly four, then $n gt.eq 3 r + 1$.]
  #emph[Here directed girth is the length of a shortest directed cycle.]
] <cor:directed-cycle-consequences>

#proof[
  Suppose that $D$ has no directed $3$-cycle. If $w in N_2^(+) \( v \)$, choose a path $v arrow.r u arrow.r w$.
    The exact-distance definition excludes $w = v$ and $w in N_1^(+) \( v \)$.
    If $w in N_1^(-) \( v \)$, the arc $w arrow.r v$ would close a directed $3$-cycle.
    Thus $N_2^(+) \( v \) subset.eq Z \( v \)$ for every $v$. Theorem 1 now gives a vertex with
  $ d^(+) \( v \) lt.eq \| N_2^(+) \( v \) \| lt.eq \| Z \( v \) \| . $
  Since $D$ is oriented, its first in- and out-neighborhoods are disjoint,
    and their cardinalities are the corresponding degrees. Hence
  $ n - 1 = d^(+) \( v \) + d^(-) \( v \) + \| Z \( v \) \| gt.eq 2 d^(+) \( v \) + d^(-) \( v \) \, $
  proving (i).
  Under the hypotheses of (ii), absence of a directed $3$-cycle would therefore give
  $ n - 1 gt.eq 2 delta^(+) \( D \) + delta^(-) \( D \) gt.eq n \, $
  a contradiction. The integer degree thresholds are $delta^plus.minus \( D \) gt.eq ceil.l n \/ 3 ceil.r$,
    so this includes the endpoint when $3$ divides $n$. Finally, directed girth four excludes directed $3$-cycles;
    in the regular case the count in (i) becomes $n - 1 gt.eq 3 r$, proving (iii). ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
