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

#align(center)[#text(size: 16pt, weight: "bold")[The Factor-Two Hardness Threshold for Vertex Cover]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A vertex cover of a graph is a set of vertices meeting every edge.
  Its complement is an independent set, a set containing no two adjacent vertices.
  This elementary duality lets us express the hardness gap in terms of the densities of independent sets.
  For a finite simple undirected graph $G$, write $tau \( G \)$ for the minimum size of a vertex cover and $n = \|
  V \( G \) \|$. An $alpha$-approximation returns an actual cover of size at most $alpha tau \( G \)$.
  The endpoints of a maximal matching give a factor-$2$ approximation.
  We prove that every fixed improvement in this factor is NP-hard.

#thm([Theorem 1.1.])[
  (Explicit cover gap).  #emph[For every fixed integer $m gt.eq 4$,
    there is a deterministic polynomial-time reduction from $upright(3 S A T)$ to finite simple undirected
    unweighted graphs with the following guarantees:
$ upright("the formula is satisfiable") & arrow.r.double quad tau \( G \) < (1 / 2 + 1 / m) \| V \( G \) \| \,\
upright("the formula is unsatisfiable") & arrow.r.double quad tau \( G \) > (1 - 1 / m) \| V \( G \) \| . $

 The output lists all vertices and edges explicitly.]
] <thm:gap>

#thm([Corollary 1.2.])[
  #emph[For every fixed real $alpha$ with $1 lt.eq alpha < 2$,
    approximating Vertex Cover within factor $alpha$ is NP-hard.
    Thus, unless $upright(P) = upright("NP")$, no deterministic polynomial-time algorithm achieves factor $2 -
    epsilon$ for any fixed $epsilon in \( 0 \, 1 \]$.]
] <thm:hardness>

The ratio of the two thresholds is $2 - 6 \/ \( m + 2 \)$, which tends to $2$.
  The reduction is polynomial for each fixed $m$; its constants are allowed to depend on the desired approximation
  factor. We prove the approximation consequence, including an exact rational separating threshold, in 8.

=== 1.1 Historical context and the role of the method <historical-context-and-the-role-of-the-method>

Vertex Cover appeared as #smallcaps[Node Cover] among the problems Karp proved NP-complete in
  1972 #cite(label("Karp1972")). Exact hardness still leaves room for approximation,
  and the elementary maximal-matching algorithm achieves factor two.
  Subsequent algorithms improved this ratio by an amount depending on the graph order.
  Karakostas obtained $2 - Theta \( 1 \/ sqrt(log n) \)$ using semidefinite
  programming #cite(label("Karakostas2009")). This saving tends to zero as $n$ grows.
  The threshold addressed here concerns a fixed saving below two,
  so it is compatible with such algorithmic improvements.

The connection between proof checking and approximation hardness was developed by Feige, Goldwasser, Lovász,
  Safra, and Szegedy #cite(label("FGLSS96")). Their graph encodes accepting local proof views,
  with consistency of the answers governing adjacency. The PCP breakthrough of 1992,
  developed by Arora and Safra and completed in constant-query form by Arora, Lund, Motwani, Sudan,
  and Szegedy #cite(label("AroraSafra98")) #cite(label("ALMSS98")),
  yielded constant approximation gaps for problems including Vertex Cover.
  Raz’s parallel repetition theorem #cite(label("Raz1998")) reduces the soundness of projection games to any
  desired fixed positive constant while preserving perfect completeness.
  Together these results supply the Label Cover promise stated precisely in 3,
  the only external hardness input used here.

For Vertex Cover, Håstad established hardness for every fixed factor below $7 \/
  6$ #cite(label("Hastad2001")) Theorem 8.1. Dinur and Safra raised this to every fixed factor below $10 sqrt(5) -
  21$, approximately $1.36068$ #cite(label("DinurSafra2005")) Theorem 1.1.
  Their analysis uses biased set families and Boolean-function structure to control independent-set density.
  Khot’s Unique Games Conjecture #cite(label("Khot02")) proposed a stronger source of approximation gaps.
  Assuming this conjecture, Khot and Regev obtained hardness for every fixed factor below
  two #cite(label("KhotRegev2008")). Their proof uses a biased long code and an equivalent,
  stronger formulation of the source promise that supports short lists of candidate labels.
  Friedgut’s approximation theorem for Boolean functions of low average sensitivity #cite(label("Friedgut1998"))
  supplies bounded sets of relevant coordinates in that analysis.

The 2017–2018 developments in the $2$-to-$2$ Games program gave an unconditional advance.
  The Grassmann-graph reduction of Khot, Minzer, and Safra #cite(label("KhotMinzerSafra2025")), the work of Dinur,
  Khot, Kindler, Minzer, and Safra #cite(label("DKKMS2025")), and the contribution of Barak, Kothari,
  and Steurer #cite(label("BarakKothariSteurer2019")) culminated in the expansion theorem of Khot, Minzer,
  and Safra #cite(label("KhotMinzerSafra2023")). This completed the Games Theorem with imperfect completeness and
  yielded unconditional Vertex Cover hardness for every fixed factor below $sqrt(2)$.
  The resulting independent-set gap has completeness density close to $1 -
  1 \/ sqrt(2)$ and arbitrarily small soundness density. The gap in 1 instead has completeness density approaching
  $1 \/ 2$, which is what gives the factor-two threshold.

Our argument retains the objective of extracting short local label lists from a large independent set,
  but obtains the lists from Lipschitz derivatives. The central step preserves variance while restricting the
  information available to each list. We adapt the product-space orthogonal decomposition of the Efron–Stein
  method #cite(label("EfronStein1981")) Section 2, combining it with a resampling estimate that controls the loss
  caused by this information restriction. A variance inequality on a product of intervals then supplies gradient
  energy, from which short candidate-label lists can be extracted without an alphabet-size factor.
  These ingredients are proved in full in Section 5, Section 6;
  the final decoding uses the ordinary Label Cover promise above.

=== 1.2 The construction and the soundness mechanism <the-construction-and-the-soundness-mechanism>

A Label Cover instance is a bipartite constraint system: every edge asks that a specified map send the label on
  its left endpoint to the label on its right endpoint. Its value is the largest fraction of constraints satisfied
  by one assignment of labels to all variables. Our source promise separates value one from arbitrarily small
  fixed value. The alphabets may grow as that fixed value decreases;
  our analytic estimates will not depend on their sizes. The exact source theorem is stated in 3.

Imagine $d$ positions, with an independent source constraint assigned to each unordered pair.
  At a pair $j < k$, position $j$ receives the constraint’s left endpoint and position $k$ its right endpoint.
  A position’s #emph[query] is its type together with these $d - 1$ endpoint questions.
  It does not reveal constraint indices or opposite endpoints.
  A local label assigns symbols to the variables in one query and satisfies every source constraint internal to
  that scope. A compatible family chooses at most one label per query;
  its members agree on overlaps and satisfy every constraint internal to their combined scopes.

Give one vector coordinate to each query–label pair. A compatible family acts on a vector by summing the
  coordinates it selects; the largest absolute value of these sums defines a norm, $∥dot.op∥_(*)$.
  At each position, a vector of grid weights is supported on that position’s query block.
  A graph vertex specifies all pair constraints and all position weights.
  Let $S_v$ be the sum of its position vectors. For a positive threshold $t$, distinct vertices $v \,
  w$ are adjacent precisely when $∥S_v + S_w∥_(*) lt.eq 2 t$.

A satisfying source assignment restricts to compatible labels for every query.
  Its linear functional exceeds $t$ on an independent set: on the sum of two such vertices it exceeds $2 t$.
  A tail estimate for a sum of symmetric weights shows that this set occupies nearly half the graph.
  3 gives the construction, its deterministic implementation, and this completeness argument.

===== 1.2.1 Why endpoint information matters. <why-endpoint-information-matters.>

For soundness, we will extract short lists of local labels from a large independent set.
  Each list must depend only on its position’s own query and weights.
  To see why, fix a pair of positions and all data except their shared source constraint.
  Each of the two lists then varies only with its own endpoint of that constraint.
  Choosing one rank in each list defines a labeling of all source variables,
  so source soundness bounds the probability that these two labels are compatible.
  This argument fails if either list also sees the opposite endpoint or the occurrence index.
  The main task is therefore to obtain both enough compatibility among the lists and this restriction on their
  information.

===== 1.2.2 Retaining variance in own-question means. <retaining-variance-in-own-question-means.>

Discard from a large independent set its at most one vertex with vector norm at most $t$.
  The remaining vectors are separated from the negatives of one another.
  The half-difference of their distance functions gives one fixed odd Lipschitz function $F$.
  Replace the grid weights by independent continuous uniform weights on cubes;
  rounding and the Lipschitz bound control the error. On fresh random sums,
  $F$ then has variance at least a fixed multiple of $d$, as proved in 9.

Choose a small batch $J$ of $h$ positions, freeze the weights outside it and the constraints on pairs not
  contained in it, and average $F$ conditional only on one remaining position’s own endpoint questions and
  weights. Such averaging might erase the variance. 10 shows that a suitable restriction retains total variance at
  least a fixed multiple of $h$ in these own-question means.
  The proof decomposes over the independent weights and pair seeds.
  Its crucial estimate resamples every seed incident to one position while preserving the questions received at
  all other positions. Only the first position’s query can then change.
  This bounds the energy lost when the conditional means forget other positions’ questions,
  independently of the label alphabets.

===== 1.2.3 From variance to compatible lists. <from-variance-to-compatible-lists.>

For fixed batch queries, differentiate $F$ composed with the sum of the position vectors.
  The full gradient lies in the convex hull of signed incidence vectors of compatible label selections (11).
  It carries a compatible representation, but can depend on all batch inputs.
  Conversely, the derivatives of the own-question means have the required information restriction,
  but need not together lie in that same hull.

The cube variance bound in 12 gives enough squared energy in the own-question gradients.
  Each block has $ell^1$ norm at most one, so thresholding its entries produces a short list without an
  alphabet-size factor. Conditional Jensen then transfers the retained list mass back to the single full gradient
  before its compatible-incidence bound is used. If $Z$ is the largest number of lists hit by one compatible
  selection, this gives $bb(E) Z gt.eq 2$ (13). The pair-decoding argument above, summed over pairs of positions,
  gives $bb(E) Z < 3 \/ 2$ under source soundness (14), a contradiction.

===== 1.2.4 Organization. <organization.>

2 states the source promise and introduces the construction parameters.
  3 constructs the graph and proves completeness; 4 converts an independent set into the analytic input.
  The restriction, gradient, and decoding arguments occupy Section 5, Section 6, Section 7, respectively.
  8 verifies a joint choice of all parameters and turns the density gap into the approximation threshold.

The construction enumerates all its finite seeds and grid weights.
  Random variables describe the uniform distribution on this output and appear only in its analysis.
  Neither the independent set, the function $F$, nor the conditional means need to be computed by the reduction.

== 2 The source problem and construction parameters <sec:source>

Write $\[ k \] = { 1 \, dots.h \, k }$. A #emph[Label Cover instance] $Phi$ consists of two disjoint finite
  variable sets $U \, V$, two nonempty finite alphabets $Sigma_U \, Sigma_V$,
  and an explicit nonempty list of $M$ constraint occurrences.
  Occurrence $c in \[ M \]$ has endpoints $x_c in U$, $y_c in V$, and a total map $pi_c : Sigma_U arrow.r
  Sigma_V$. A labeling $A$ assigns each variable a symbol from its side’s alphabet. It satisfies occurrence $c$ when

$ pi_c \( A \( x_c \) \) = A \( y_c \) . $

The value $"val" \( Phi \)$ is the maximum fraction of satisfied occurrences.
  List entries count with their multiplicity. Endpoints and map tables are given explicitly in binary;
  unused variable declarations can be removed. We require no regularity or expansion condition on the constraint graph.

#thm([Theorem 2.1.])[
  (Perfect-completeness Label Cover hardness).  #emph[For every fixed rational $sigma in \( 0 \, 1 \)$,
    there are nonempty constant alphabets and a deterministic polynomial-time reduction from $upright(3 S A T)$ to
    instances of the form above such that satisfiable formulas give $"val" \( Phi \) = 1$,
    and unsatisfiable formulas give $"val" \( Phi \) lt.eq sigma$.]
] <src:hardness>

This is the standard consequence of the probabilistically checkable proof (PCP)
  theorem #cite(label("AroraSafra98")) #cite(label("ALMSS98")) and parallel repetition #cite(label("Raz1998")).
  A quantitative formulation appears in the full version of Dinur and Steurer #cite(label("DinurSteurer2014"))
  Theorem 6.2. The precise unweighted, total-projection formulation is recorded in #cite(label("DKKMS2025"))
  Definitions 1.1–1.2 and Theorem 1.3. There the constraints are even $D$-to-one for a suitable constant $D$,
  a property we do not use. The constants, including the alphabets and $D$, may depend on $sigma$.
  This theorem is the only external hardness input to our proof.

=== 2.1 Parameters for the construction <parameters-for-the-construction>

Fix the requested gap integer $m gt.eq 4$. We first construct and analyze graphs for arbitrary fixed source
  alphabets and an even square integer $d$ satisfying

#[#set math.equation(numbering: n => "(2.1)")
 $ d gt.eq 4 \, wide sqrt(d) > 4 m . $ <src:dimension-bounds>]

The number $d$ will count the positions in the construction.
  The soundness argument will impose further lower bounds on $d$ and determine the required source soundness.
  In 8 we choose all these constants as functions of $m$, before invoking 3 to obtain the alphabets.

For the graph construction put

#[#set math.equation(numbering: n => "(2.2)")
 $ a = frac(1, 4 m) \, wide p = 2 d + 1 \, wide t = a sqrt(d) . $ <src:construction-parameters>]

The graph will use a grid with $p$ points and an adjacency threshold $2 t$. These choices give

$ d / p < 1 / 2 < t / 2 \, wide p > 2 m . $

Both $p$ and $sqrt(d)$ are integers, so $t$ is rational. For a source instance over fixed alphabets, set

$ q = max { \| Sigma_U \| \, \| Sigma_V \| } \, wide r = q^(d - 1) . $

A query will involve at most $d - 1$ variables, and $r$ bounds its number of local labels.
  For fixed $m \, d$ and alphabets, every parameter introduced here is constant with respect to the source input size.

== 3 The graph and completeness <graph:section>

Fix a source instance and the construction parameters from 2.
  Each vertex will specify source constraints on the pairs of $d$ positions and weights on the labels available at
  each position. We first define when local labels fit together and use their coordinate sums to define a norm.
  A satisfying source labeling will then provide a linear functional whose values above $t$ select an independent set.

=== 3.1 Queries and compatible labels <queries-and-compatible-labels>

Let $cal(E) = binom(\[ d \], 2)$ be the set of unordered pairs of distinct positions.
  A query of type $j in \[ d \]$ has the form

$ i = #scale(x: 120%, y: 120%)[\(] j \, \( q_(j k) \)_(k in \[ d \] \\ { j }) #scale(x: 120%, y: 120%)[\)] \, wide
  q_(j k) in cases(delim: "{", V \, & k < j \,, U \, & k > j .) $

The tuple is ordered by increasing $k$. Let $cal(Q)$ be the set of all such queries of all types,
  and let $P \( i \) subset.eq U union V$ be the set of distinct variables appearing in $i$.
  The side of each variable is part of its identity, since $U$ and $V$ are disjoint.
  Repeated entries in the tuple contribute only one variable to $P \( i \)$; thus $\| P \( i \) \| lt.eq d - 1$.

A label $lambda$ for $i$ assigns a symbol from the appropriate alphabet to each variable of $P \( i \)$ and
  satisfies every source constraint occurrence whose two endpoints belong to $P \( i \)$.
  Write $Lambda_i$ for the set of these labels. This set may be empty,
  for example when constraints internal to the scope are inconsistent.
  There are at most $q^(\| P \( i \) \|) lt.eq r$ labels. Fix orders on variables and alphabet symbols,
  and list the valid assignments in lexicographic order to define an injection

$ "slot"_i : Lambda_i arrow.r \[ r \] . $

This is the empty map when $Lambda_i = diameter$. Slots outside its image will play no role in an increment.

Define the finite coordinate set

$ cal(P) = { \( i \, lambda \) : i in cal(Q) \, med lambda in Lambda_i } . $

A #emph[compatible selection] is a subset $I subset.eq cal(P)$ with at most one label per query,
  such that the selected labels agree on overlaps and their induced labeling satisfies every source constraint
  whose two endpoints lie in

$ P \( I \) = union.big_(\( i \, lambda \) in I) P \( i \) . $

Let $cal(I)$ be the family of compatible selections, including the empty selection.
  Agreement on overlaps alone is not enough: constraints joining variables from different selected scopes must
  also be satisfied. Thus labels on any two selected queries satisfy every source constraint between their scopes.
  Compatibility imposes no condition on a constraint with an endpoint outside $P \( I \)$;
  the induced labeling need not extend to a satisfying labeling of the entire instance.

For $z in bb(R)^(cal(P))$, define

#[#set math.equation(numbering: n => "(3.1)")
 $ ∥z∥_(*) = max_(I in cal(I)) lr(|sum_(\( i \, lambda \) in I) z_(i \, lambda)|) . $ <graph:norm-definition>]

For a query $i$ and a vector $s in bb(R)^r$, let $z \( i \, s \)$ be supported on its query block, with

$ z \( i \, s \)_(i \, lambda) = s_("slot"_i \( lambda \)) quad upright("for ") lambda in Lambda_i . $

All coordinates in other query blocks are zero. In particular, $z \( i \, s \) = 0$ for a query with no valid label.

#thm([Lemma 3.1.])[
  (Compatibility norm).  #emph[The family $cal(I)$ is hereditary and contains every coordinate singleton.
    Formula (3.1) defines a norm. For each fixed query $i$, the increment is linear in $s$ and obeys
#[#set math.equation(numbering: n => "(3.2)")
 $ ∥z \( i \, s \)∥_(*) lt.eq parallel s parallel_oo . $ <graph:increment>]

]
] <graph:norm>

#proof[
  Removing labels preserves agreement and can only shrink the scope union.
    Every constraint internal to the smaller union was therefore satisfied before removal. This proves heredity.
    Every singleton belongs to $cal(I)$ by the definition of a valid query label.
    The maximum of absolute linear forms is absolutely homogeneous and satisfies the triangle inequality;
    the singleton forms ensure that it vanishes only at zero.
    If the coordinate set is empty, this is the unique norm on the zero-dimensional space.
    Finally, a compatible selection contains at most one coordinate of the $i$-block, proving (3.2).
    Linearity follows from the coordinate formula. ◻
]

=== 3.2 Vertices and edges <vertices-and-edges>

A seed tuple is an indexed family $upright(bold(c)) = \( c_e \)_(e in cal(E)) in \[ M \]^(cal(E))$.
  For $e = { j \, k }$ with $j < k$, seed $c_e$ gives endpoint $x_(c_e)$ to position $j$ and endpoint $y_(c_e)$ to
  position $k$. It thereby specifies queries $i_j \( upright(bold(c)) \)$ through

$ q_(j k) = x_(c_({ j \, k })) \, wide q_(k j) = y_(c_({ j \, k })) wide \( j < k \) . $

A query retains its type and its ordered endpoint questions.
  It does not retain the sampled occurrence indices, the sampled projection maps,
  or the opposite endpoint in any pair. Different seed tuples can give the same queries.
  Queries of different position types are nevertheless distinct, even if some endpoint values coincide.
  The source instance used to define labels and slots is fixed;
  the seed-dependent data in a query are only its endpoint questions.

Use the symmetric grid

#[#set math.equation(numbering: n => "(3.3)")
 $ cal(T) = {frac(2 u, p) : u = - d \, - d + 1 \, dots.h \, d} \, wide p = 2 d + 1 . $ <graph:grid>]

These are the midpoints of the $p$ equal consecutive subintervals of $\[ - 1 \, 1 \]$.
  The vertex set consists of all pairs

$ v = \( upright(bold(c)) \, upright(bold(s)) \) \, wide upright(bold(c)) in \[ M \]^(cal(E)) \, quad
  upright(bold(s)) = \( s_1 \, dots.h \, s_d \) in \( cal(T)^r \)^d . $

Each indexed pair is one vertex, including when another pair produces the same queries or the same vector

#[#set math.equation(numbering: n => "(3.4)")
 $ S_v = sum_(j = 1)^d z \( i_j \( upright(bold(c)) \) \, s_j \) . $ <graph:sum-vector>]

For two distinct vertices, declare

#[#set math.equation(numbering: n => "(3.5)")
 $ { v \, w } in E \( G \) quad arrow.l.r.double quad ∥S_v + S_w∥_(*) lt.eq 2 t . $ <graph:edge>]

This defines a finite simple undirected unweighted graph. Its order is

#[#set math.equation(numbering: n => "(3.6)")
 $ n = \| V \( G \) \| = M^(binom(d, 2)) p^(r d) gt.eq p > 2 m \, $ <graph:size>]

where the inequalities use $M \, r gt.eq 1$ and (2.1), (2.2).
  Choosing a uniform vertex is exactly choosing all seeds independently and uniformly from $\[ M \]$ and all
  weight entries independently and uniformly from $cal(T)$.
  There is no identification of equal vectors in this probability law.

#thm([Lemma 3.2.])[
  (Local evaluation of the norm).  #emph[Let $cal(B) subset.eq cal(Q)$ be a set of query blocks supporting $z in
    bb(R)^(cal(P))$. Then
#[#set math.equation(numbering: n => "(3.7)")
 $ ∥z∥_(*) = max_(I in cal(I) :\
\( i \, lambda \) in I med arrow.r.double med i in cal(B)) lr(|sum_(\( i \, lambda \) in I) z_(i \, lambda)|) .
  $ <graph:local-formula>]

 For $z = S_v + S_w$, this maximum can be evaluated by at most $\( 1 + r \)^(2 d)$ choices,
   each checked by a scan of the source constraints.]
] <graph:local-norm>

#proof[
  Intersect any compatible selection with the blocks in $cal(B)$.
    Heredity preserves compatibility, and the sum is unchanged because all other blocks of $z$ vanish.
    Conversely, each selection on the right of (3.7) is a selection in the full maximum. This proves equality.
  For a pair of vertices there are at most $2 d$ distinct query blocks.
    First aggregate the coordinate contributions of all occurrences of each repeated query.
    For each distinct query $i$, enumerate the at most $q^(d - 1) lt.eq r$ assignments on its scope,
    and keep exactly those satisfying every source constraint internal to that scope.
    This computes $Lambda_i$ and its slots. Next choose either no label or one of these labels in each block.
    There are at most $\( 1 + r \)^(2 d)$ choices. For each choice,
    test agreement on repeated variables and scan the source list to test every constraint internal to the union
    of the chosen scopes. This union has at most $2 d \( d - 1 \)$ variables.
    The surviving choices are precisely the selections on the right of (3.7),
    and their absolute coordinate sums give the required maximum.
    Neither the labels nor the compatibility test requires satisfying any constraint outside the indicated scope
    union. ◻
]

#thm([Proposition 3.3.])[
  (Deterministic polynomial construction).  #emph[For a fixed integer $m gt.eq 4$,
    a fixed even square $d$ satisfying (2.1), and fixed source alphabets,
    the graph $G$ can be output explicitly in deterministic time polynomial in the source bit length.
    Every edge test is exact.]
] <graph:polynomial>

#proof[
  Let $L$ be the source bit length. The fixed integers $m \,
    d$ determine $p$ and the rational number $t$ by (2.2). The fixed alphabets determine $q$ and $r = q^(d - 1)$.
    All these quantities are therefore computable constants independent of $L$.
    Since the constraint list is explicit, $M = O \( L \)$, and (3.6) gives $n = O \( L^(binom(d, 2)) \)$.
    A vertex description contains a fixed number of source indices and grid entries.
    Thus all vertices can be enumerated and assigned identifiers of $O \( 1 + log n \)$ bits.
  Apply 5 to each unordered pair of distinct vertices. All label and selection enumerations have a fixed number of
    choices. Variable comparisons, sorting, constraint scans,
    and projection-map evaluations take polynomial bit time in $L$.
    The arithmetic of the edge test uses only rational grid entries.
    In fact, every coordinate of $S_v + S_w$ has denominator $p$, after summing all repeated-block contributions.
    The local maximum is therefore $zeta \/ p$ for a nonnegative integer $zeta$.
    By (3.2) and the triangle inequality, $zeta \/ p lt.eq 2 d$,
    so its numerator and denominator have bit lengths bounded solely in terms of the fixed parameters.
    Since $t = sqrt(d) \/ \( 4 m \)$ and $sqrt(d)$ is an integer, the edge test is precisely
  $ 2 m zeta lt.eq p sqrt(d) . $
  Both sides are integers, so the test involves no approximation of a real number.
  Checking all pairs and writing every qualifying edge takes
  $ O #scale(x: 120%, y: 120%)[\(] \( 1 + n^2 \) "poly" \( L + log n \) #scale(x: 120%, y: 120%)[\)] $
  bit operations, with constants depending only on the fixed parameters and alphabets.
    Formula (3.6) also computes $n$ by integer arithmetic with $O \( 1 + log n \)$ output bits.
    Thus the construction has polynomial bit complexity, including its explicit vertex and edge lists.
    It runs on every source instance with these alphabets, regardless of whether the gap promise holds. ◻
]

=== 3.3 Completeness <completeness>

A satisfying source assignment will give a linear functional whose value exceeds $t$ on an independent set.
  To show that this set occupies nearly half the vertices, we first bound the corresponding tail of a sum of
  independent uniform grid variables.

#thm([Lemma 3.4.])[
  (Midpoint-grid tail).  #emph[If $T_1 \, dots.h \, T_d$ are independent uniform elements of $cal(T)$, then
#[#set math.equation(numbering: n => "(3.8)")
 $ Pr [sum_(j = 1)^d T_j > t] > 1 / 2 - sqrt(2) (a + 1 / sqrt(d)) > 1 / 2 - 1 / m . $ <graph:tail>]

]
] <graph:anticoncentration>

#proof[
  Take independent uniform $C_1 \, dots.h \, C_d$ on $\[ - 1 \, 1 \]$,
    and round each to the midpoint of its subinterval in the partition defining $cal(T)$.
    Boundary choices have probability zero. The rounded variables have the required independent laws, and
  $ lr(|sum_j T_j - sum_j C_j|) lt.eq d / p < 1 / 2 . $
  Put $A = t + d \/ p = a sqrt(d) + d \/ p$. We bound the central probability $Pr \[ \| sum_j C_j \| lt.eq A \]$.
  Each $C_j$ may be generated as $\( L_j + U_j \) \/ 2$, where $L_j$ is a fair sign and $U_j$ is uniform on
    $\[ - 1 \, 1 \]$, all independent. The two sign choices give uniform distributions on the two half intervals
    of $\[ - 1 \, 1 \]$, so this is indeed the uniform distribution on the full interval.
    Conditional on $\( U_1 \, dots.h \, U_d \)$, the event $\| sum_j C_j \| lt.eq
    A$ places $sum_j L_j$ in an interval of length
  $ 4 A = 4 a sqrt(d) + 4 d \/ p < 4 a sqrt(d) + 2 . $
  The possible sign sums are spaced by two. An interval of length $D$ contains at most $D \/ 2 +
    1$ values from such a lattice, so this interval contains fewer than $2 a sqrt(d) + 2$ possible sign sums.
  Write $d = 2 d_0$. The sign-sum probabilities are $4^(- d_0) binom(2 d_0, v)$, for $0 lt.eq v lt.eq 2 d_0$.
    Consecutive ratios $\( 2 d_0 - v \) \/ \( v + 1 \)$ show that the largest is the central one. It satisfies
  $ 4^(- d_0) binom(2 d_0, d_0) = product_(u = 1)^(d_0) (1 - frac(1, 2 u)) lt.eq 1 / sqrt(d_0 + 1) < sqrt(2) /
    sqrt(d) . $
  For the middle inequality, square the product and use
  $ (1 - frac(1, 2 u))^2 lt.eq frac(u, u + 1) wide \( u gt.eq 1 \) \; $
  indeed the right side minus the left side is $\( 3 u - 1 \) \/ \( 4 u^2 \( u + 1 \) \) > 0$,
    and the resulting product telescopes. The conditional central probability, and therefore its average, is bounded by
  $ Pr [lr(|sum_j C_j|) lt.eq A] < sqrt(2) (2 a + 2 / sqrt(d)) . $
  Symmetry gives
  $ Pr [sum_j C_j > A] = 1 / 2 (1 - Pr [lr(|sum_j C_j|) lt.eq A]) > 1 / 2 - sqrt(2) (a + 1 / sqrt(d)) . $
  On this event, rounding leaves $sum_j T_j > t$. Finally, $sqrt(d) > 4 m = 1 \/ a$ by (2.1), and hence
  $ sqrt(2) (a + 1 / sqrt(d)) < 2 sqrt(2) thin a < 3 a = frac(3, 4 m) < 1 / m . $
  This proves both inequalities in (3.8). ◻
]

#thm([Proposition 3.5.])[
  (Completeness).  #emph[If $"val" \( Phi \) = 1$, then $G$ has an independent set of size greater than
    $\( 1 \/ 2 - 1 \/ m \) n$. Consequently,
$ tau \( G \) < (1 / 2 + 1 / m) n . $

]
] <graph:completeness>

#proof[
  Let $A$ be a labeling satisfying every source constraint.
    Its restriction $lambda_(A \, i)$ to $P \( i \)$ belongs to $Lambda_i$ for every query $i$. The selection
  $ I_A = { \( i \, lambda_(A \, i) \) : i in cal(Q) } $
  belongs to $cal(I)$: the labels agree on overlaps, and every constraint internal to their scope union is
    satisfied by $A$. Keep precisely the vertices for which
  #[#set math.equation(numbering: n => "(3.9)")
   $ sum_(j = 1)^d s_(j \, "slot"_(i_j \( upright(bold(c)) \)) \( lambda_(A \, i_j \( upright(bold(c)) \)) \)) >
     t . $ <graph:keep-rule>]
  For a uniform vertex, conditional on the seed tuple, the selected slot in each weight vector is fixed.
    Its entries are independent uniform elements of $cal(T)$, one from each independent $s_j$.
    Coincident endpoint questions or slot numbers do not change this independence.
    By 7, more than a $\( 1 \/ 2 - 1 \/ m \)$ fraction of vertices are kept.
  For two distinct kept vertices $v \, w$, evaluating $S_v +
    S_w$ on $I_A$ gives exactly the sum of their two expressions in (3.9).
    This includes all contributions even when the same query appears in both vertices.
    The sum exceeds $2 t$, so (3.1) rules out the edge in (3.5). The kept vertices are therefore independent.
    Their complement is a vertex cover of size less than $\( 1 \/ 2 + 1 \/ m \) n$. ◻
]

== 4 A fixed function from an independent set <ana:section>

The soundness argument begins by turning a large independent set into one fixed Lipschitz function.
  We need a variance lower bound on fresh random inputs and control of how much the function changes when one
  position changes. Set

#[#set math.equation(numbering: n => "(4.1)")
 $ b_0 = frac(1, 2 m) \, wide nu = frac(b_0 a^2, 4) = frac(1, 2^7 m^3) . $ <src:variance-parameters>]

Thus the independent-set density we must rule out is $2 b_0$. First discard the low-norm vertices.
  All vertices whose vectors have norm at most $t$ form a clique:
  for any two of them the triangle inequality gives $∥S_v + S_w∥_(*) lt.eq 2 t$.
  An independent set therefore contains at most one such vertex.
  Since $n gt.eq p > 1 \/ b_0$, an independent set of size at least $n \/ m =
  2 b_0 n$ contains more than $b_0 n$ vertices of norm greater than $t$.
  The following lemma turns these remaining vectors into the required function.

#thm([Lemma 4.1.])[
  (Separation, variance, and oscillation).  #emph[Suppose an independent set contains at least $b_0
    n$ vertices with $∥S_v∥_(*) > t$. There is a fixed nonempty finite set $A_(*) subset bb(R)^(cal(P))$ such that
$ Pr_(v in V \( G \)) \[ S_v in A_(*) \] gt.eq b_0 \, wide ∥x + y∥_(*) > 2 t quad \( x \, y in A_(*) \) \, $

 where the vertex is uniform. For a nonempty finite set $B$, write $"dist"_(*) \( z \, B \) = min_(b in B) ∥z -
   b∥_(*)$. The function
#[#set math.equation(numbering: n => "(4.2)")
 $ F \( z \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] "dist"_(*) \( z \, - A_(*) \) -
   "dist"_(*) \( z \, A_(*) \) #scale(x: 120%, y: 120%)[\)] $ <ana:distance-function>]

 is odd and $1$-Lipschitz for $∥dot.op∥_(*)$, and $F \( z \) > t$ on $A_(*)$.]
  #emph[Let $cal(E) = binom(\[ d \], 2)$. Draw independent uniform occurrence seeds
    $bold(c) = \( c_e \)_(e in cal(E)) in \[ M \]^(cal(E))$ and independent weight blocks $s_j$ uniform on
    $\[ - 1 \, 1 \]^r$, independently of the seeds. Put
#[#set math.equation(numbering: n => "(4.3)")
 $ f \( bold(c) \, bold(s) \) = F (sum_(j = 1)^d z \( i_j \( bold(c) \) \, s_j \)) . $ <ana:f>]

 This bounded function satisfies
#[#set math.equation(numbering: n => "(4.4)")
 $ bb(E)_(bold(s)) f \( bold(c) \, bold(s) \) = 0 quad upright("for every ") bold(c) \, wide bb(E) f^2 gt.eq
   nu d . $ <ana:variance>]

 On the weight cubes it has the following three oscillation bounds:]
  + #emph[Replacing one weight block $s_j$, with all other data fixed, changes $f$ by at most $2$.]
  + #emph[Replacing one seed $c_e$, with all other data fixed, changes $f$ by at most $4$.]
  + #emph[Fix $k in \[ d \]$. Simultaneously replacing any seeds incident to $k$,
    while keeping all nonincident seeds, all weights, and the question received at every opposite position $j
    eq.not k$ from ${ j \, k }$ unchanged, changes $f$ by at most $2$.]
  #emph[The set $A_(*)$, the function $F$, and its formula are fixed from an independent set of the entire graph
    before the fresh seeds above are drawn. A seed enters $f$ only through its endpoint questions.]
] <ana:function>

#proof[
  Take $A_(*)$ to be the set of sum vectors of the stipulated high-norm vertices in the independent set.
    The number of those vertices gives the probability bound even if several vertices represent the same vector.
    For distinct $x \, y in A_(*)$, their representing vertices are distinct and nonadjacent, so (3.5) gives $∥x +
    y∥_(*) > 2 t$. If $x = y$, the same inequality follows from $∥2 x∥_(*) = 2 ∥x∥_(*) > 2 t$.
  Distance to a nonempty finite set is the minimum of the distances to its points.
    The triangle inequality makes each distance function $1$-Lipschitz;
    the half-difference in (4.2) is therefore $1$-Lipschitz. Symmetry of the norm gives
    $"dist"_(*) \( - z \, - A_(*) \) = "dist"_(*) \( z \, A_(*) \)$, proving oddness.
    For $z in A_(*)$, its distance to $A_(*)$ is zero, while
  $ "dist"_(*) \( z \, - A_(*) \) = min_(x in A_(*)) ∥z + x∥_(*) > 2 t . $
  Finiteness preserves the strict inequality, so $F \( z \) > t$.
  For fixed seeds, negating all weights preserves their joint law and negates $f$.
    This proves the first assertion in (4.4). Also $F \( 0 \) = 0$,
    and the increment bound $∥z \( i \, s \)∥_(*) lt.eq parallel s parallel_oo$ implies $\| f \| lt.eq
    d$ on the sampling space.
  Round every continuous entry to the midpoint of its grid interval.
    The resulting entries are independent uniform elements of $cal(T)$;
    interval-boundary choices have probability zero. The change in one increment has norm at most $1 \/ p$,
    by linearity in its weights and the increment bound. Thus rounding changes the argument of $F$,
    and hence its value, by at most $d \/ p < t \/ 2$. The unchanged seeds together with the rounded weights have
    exactly the uniform vertex law. With probability at least $b_0$, their sum belongs to $A_(*)$,
    and on that event the unrounded value of $f$ exceeds $t \/ 2$. Consequently
  $ bb(E) f^2 gt.eq b_0 t^2 \/ 4 = b_0 a^2 d \/ 4 = nu d . $
  Every increment on a weight cube has norm at most one. Replacing one weight block changes one increment by norm
    at most two, proving (i). A single seed affects only its two endpoint queries;
    replacing it changes at most two increments, each by norm at most two, proving (ii).
    In (iii), each position other than $k$ keeps every question in its query,
    so only the increment at $k$ may change. The same bound of two proves the claim.
    All these arguments use the single fixed function $F$ in (4.2); it is not chosen again for a sampled seed tuple. ◻
]

== 5 A restriction preserving own-question variance <sec:restriction>

The function from the previous section has variance of order $d$,
  but the functions used to extract labels must depend only on one position’s own questions and weights.
  We shall freeze all but a batch of $h$ positions and retain variance of order $h$ in conditional averages with
  precisely this dependence. Questions at different positions are correlated because they share pair seeds;
  our orthogonal decomposition therefore uses the independent seeds and weights themselves.

Let $d gt.eq 4$ and $r \, M gt.eq 1$ be integers, and put $cal(E) = binom(\[ d \], 2)$.
  For each $e in cal(E)$, draw $c_e$ uniformly from $\[ M \]$, independently over $e$.
  At each endpoint $j in e$, this seed reveals a question $Q_(e \, j) \( c_e \)$,
  where $Q_(e \, j)$ is a fixed map to a finite set. There is no independence assumption on the two questions from
  the same seed. In the construction, for $e = { j \, k }$ with $j < k$, these maps are $Q_(e \, j) \( c \) =
  x_c$ and $Q_(e \, k) \( c \) = y_c$. Independently of all seeds,
  draw $s_j$ uniformly from $\[ - 1 \, 1 \]^r$ for each $j in \[ d \]$, independently over $j$.
  All expectations and $L^2$-norms in this section initially refer to the resulting product law on

$ Omega = \[ M \]^(cal(E)) times \( \[ - 1 \, 1 \]^r \)^d . $

We first specify the restrictions and conditional averages in the lemma.
  Given a bounded Borel measurable function $f \( upright(bold(c)) \, upright(bold(s)) \)$ and a set $J
  subset.eq \[ d \]$, its #emph[frozen data] are

#[#set math.equation(numbering: n => "(5.1)")
 $ upright(bold(a)) = #scale(x: 120%, y: 120%)[\(] \( c_e \)_(e in.not binom(J, 2)) \, \( s_k \)_(k in.not J)
   #scale(x: 120%, y: 120%)[\)] . $ <res:frozen-data>]

Fixing these values leaves a function $f^(*)$ of the hidden seeds $\( c_e \)_(e in binom(J, 2))$ and the weights
  $\( s_j \)_(j in J)$, with their original product law. For $j in J$, write

$ u_j = #scale(x: 120%, y: 120%)[\(] Q_({ j \, k } \, j) \( c_({ j \, k }) \)
  #scale(x: 120%, y: 120%)[\)]_(k in J \\ { j }) \, $

with entries in increasing order of $k$. Define $H_j^(J \, upright(bold(a))) \( u \, s \)$ by inserting $s_j =
  s$ in $f^(*)$ and averaging the remaining variables conditional on $u_j = u$.
  Explicitly, each incident hidden seed $c_({ j \, k })$ is drawn uniformly from the fiber of
  $Q_({ j \, k } \, j)$ specified by the corresponding entry of $u$; these draws are independent.
  The other hidden seeds and other weights retain their original independent laws.
  On a question tuple of probability zero set $H_j^(J \, upright(bold(a))) = 0$.
  This definition uses ordinary finite averages and cube integrals with the frozen values plugged in,
  so it also defines the averages when $upright(bold(a))$ has continuous coordinates.
  We abbreviate $H_j^(J \, upright(bold(a)))$ to $H_j$ when the restriction is fixed.

#thm([Lemma 5.1.])[
  (Own-question variance under a restriction).  #emph[Let $nu > 0$ and let $h$ be an integer with $2 lt.eq h lt.eq
    d$. Suppose the bounded Borel measurable function $f$ on $Omega$ satisfies
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(E)_(upright(bold(s))) f \( upright(bold(c)) \, upright(bold(s)) \) = 0 quad
   upright("for every ") upright(bold(c)) \, wide bb(E) f^2 gt.eq nu d . $ <res:variance-hypotheses>]

 Suppose also that the following oscillation bounds hold with all coordinates not mentioned kept fixed:]
  + #emph[Changing one weight block $s_j$ changes $f$ by at most $2$.]
  + #emph[Changing one seed $c_e$ changes $f$ by at most $4$.]
  + #emph[For any $k in \[ d \]$, simultaneously changing seeds incident to $k$,
    while preserving $Q_({ k \, j } \, j) \( c_({ k \, j }) \)$ for every $j eq.not k$, changes $f$ by at most $2$.]
  #emph[If
#[#set math.equation(numbering: n => "(5.3)")
 $ 16 h + 32 h^2 lt.eq frac(nu d, 2) \, $ <res:scale>]

 then there are a fixed $h$-element set $J$ and fixed frozen data $upright(bold(a))$ such that
#[#set math.equation(numbering: n => "(5.4)")
 $ sum_(j in J) bb(E)_(u_j) "Var"_(s_j) H_j \( u_j \, s_j \) gt.eq frac(nu h, 4) . $ <res:variance>]

 The law in (5.4) is the product law of the remaining hidden seeds and batch weights described above.
   In particular it is not conditioned on an event involving a draw of those remaining variables.]
] <res:private-variance>

#proof[
  The conditional mean $H_j$ averages all unfrozen weights except $s_j$.
    It also averages every hidden seed on a pair avoiding $j$,
    and retains only $j$’s question on each hidden pair incident to $j$.
    These are the three ways in which averaging can lose information.
    We use the product-space orthogonal decomposition associated with the Efron–Stein
    method #cite(label("EfronStein1981")) Section 2, giving the needed projection identities explicitly.
    We assign each component to one weight block on which it depends,
    and ask when a random batch preserves that component in its assigned conditional mean.
    The oscillation bounds control the energy lost through each type of averaging.
  ===== 5.1 Averaging projections and weight supports. <averaging-projections-and-weight-supports.>
  Let $W_j^0$ average the weight block $s_j$, retaining all other coordinates, and set $W_j^1 = "Id" - W_j^0$.
    Let $P_e^0$ average the seed $c_e$. For $j in e$, let $O_(e \, j)$ average that seed conditional on its
    question $Q_(e \, j) \( c_e \)$, retaining all other coordinates.
    Each averaging is an orthogonal projection in $L^2 \( Omega \)$:
    averaging twice gives the same function, and integrating over the retained data shows self-adjointness. Also
  $ "ran" \( P_e^0 \) subset.eq "ran" \( O_(e \, j) \) \, wide P_e^0 O_(e \, j) = O_(e \, j) P_e^0 = P_e^0 . $
  Operators on distinct coordinates commute by the product law and Fubini’s theorem.
    The two endpoint projections $O_(e \, j) \, O_(e \, k)$ on a single seed need not commute;
    we will not assume that they do.
  For $S subset.eq \[ d \]$, put
  $ Pi_S = product_(j in S) W_j^1 product_(j in.not S) W_j^0 \, wide f_S = Pi_S f . $
  Expanding $product_j \( W_j^0 + W_j^1 \)$ gives $f = sum_S f_S$.
    Distinct $S$’s give orthogonal components, because their projections have a factor $W_j^0 W_j^1 =
    0$ at some position. The first condition in (5.2) says that $f_diameter = 0$.
    Furthermore $f - W_j^0 f = sum_(S in.rev j) f_S$, and hence
  #[#set math.equation(numbering: n => "(5.5)")
   $ sum_(S eq.not diameter) \| S \| parallel f_S parallel_2^2 = sum_(j = 1)^d parallel f -
     W_j^0 f parallel_2^2 lt.eq 4 d . $ <res:weight-degree>]
  Indeed, on every fiber obtained by fixing the other coordinates,
    the one-weight oscillation bound implies $\| f - W_j^0 f \| lt.eq 2$.
  ===== 5.2 Refining the seed coordinates. <refining-the-seed-coordinates.>
  For every nonempty $S$, choose a designated position $j \( S \) in S$ by a fixed rule, for example $j \( S \) =
    min S$. This choice depends only on the support $S$. With $j = j \( S \)$,
    split each seed coordinate into the following projections:
  $ j in.not e : & P_e^0 \, quad "Id" - P_e^0 \,\
j in e : & P_e^0 \, quad O_(e \, j) - P_e^0 \, quad "Id" - O_(e \, j) . $
  The nested ranges just proved make the three projections in the second line pairwise orthogonal,
    and their sum is the identity. For a choice $omega$ of one displayed projection at every seed,
    let $f_(S \, omega)$ be their product applied to $f_S$. For fixed $S$,
    these components give an orthogonal decomposition of $f_S$.
    The seed projections commute with all weight projections,
    so every $f_(S \, omega)$ remains in $"ran" \( Pi_S \)$. Consequently the components for different $S$’s are
    also orthogonal, even though the endpoint used to refine a seed can change with $S$. Thus
  #[#set math.equation(numbering: n => "(5.6)")
   $ sum_(S \, omega) parallel f_(S \, omega) parallel_2^2 = parallel f parallel_2^2 \, $ <res:component-energy>]
  where henceforth these sums range over nonempty $S$ and its allowed choices $omega$.
  Let $T_(S \, omega) subset.eq cal(E)$ be the seeds where the chosen projection is not $P_e^0$.
    Let $N_(S \, omega) subset.eq \[ d \] \\ { j \( S \) }$ be the positions $k$ for which the projection at $e =
    { j \( S \) \, k }$ is $"Id" - O_(e \, j \( S \))$. These are the incident components not retained by the
    designated position’s own question. For each fixed $e$, applying $"Id" -
    P_e^0$ keeps exactly the components with $e in T_(S \, omega)$.
    Orthogonality and the one-seed oscillation bound therefore give
  #[#set math.equation(numbering: n => "(5.7)")
   $ sum_(S \, omega) \| T_(S \, omega) \| parallel f_(S \, omega) parallel_2^2 = sum_(e in cal(E)) parallel f -
     P_e^0 f parallel_2^2 lt.eq 16 binom(d, 2) lt.eq 8 d^2 . $ <res:seed-degree>]
  Here $\| f - P_e^0 f \| lt.eq 4$ follows by averaging values whose oscillation is at most $4$.
  At this stage the ordinary seed-energy bound is of order $d^2$.
    That is sufficient for hidden pairs avoiding the designated position,
    because both endpoints must enter the small batch. It is insufficient for a hidden incident seed,
    which needs only one extra endpoint in the batch. The next estimate reduces the relevant incident energy to
    order $d$ by resampling a whole star at once.
  ===== 5.3 Charging the residual components to stars. <charging-the-residual-components-to-stars.>
  For each $k in \[ d \]$, define
  $ D_k = product_(j eq.not k) O_({ k \, j } \, j) . $
  The factors act on distinct seed coordinates, so this is an orthogonal projection.
    More explicitly, it retains all weights, all seeds not incident to $k$,
    and the opposite endpoint question at each seed incident to $k$.
    Given these data, the incident seeds have independent conditional laws on their respective fibers;
    their product gives exactly the displayed operator. 1 illustrates the information retained by this operation.
    Hypothesis (iii) bounds the oscillation of $f$ on each such fiber by $2$. It follows that
  #[#set math.equation(numbering: n => "(5.8)")
   $ parallel f - D_k f parallel_2^2 lt.eq 4 . $ <res:star-energy>]
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-0.3182, -0.3182), (0.3182, 0.3182), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$k$]]], frame: "circle", fill: rgb("#ebebff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-4, 1.2), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[position $j$#linebreak()question $Q_(\{k,j\},j)$ fixed]]])])
  content((4, 1.2), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[position $j'$#linebreak()question $Q_(\{k,j'\},j')$ fixed]]])])
  content((0, -1.8), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[every other position $j''$#linebreak()question $Q_(\{k,j''\},j'')$ fixed]]])])
  line((-0.4378, 0.1313), (-2.412, 0.7237), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((-2, 0.6), [#text(size: 7pt)[$c_(\{k,j\})$]], anchor: "north", padding: 0.1176cm)
  line((0.4378, 0.1313), (2.368, 0.7104), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((2, 0.6), [#text(size: 7pt)[$c_(\{k,j'\})$]], anchor: "north", padding: 0.1176cm)
  line((0, -0.4571), (0, -1.31), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
})],
    caption: [Figure 1: The star operation centered at $k$. Each incident seed is resampled within the fiber of its question at the opposite endpoint. All nonincident seeds and all weights stay fixed. Thus every query except the query at $k$ stays fixed. The schematic depicts the conditional averaging operator $D_k$, not additional graph edges. ],
  ) <fig:star>
  For a component designated at $j$, we charge invisible information on ${ j \, k }$ to the star centered at $k$:
    that star retains $j$’s question on this pair. For every $j eq.not k$,
    the range of $D_k$ is contained in that of $O_({ k \, j } \, j)$.
    Distance to the larger closed subspace is no greater than distance to the smaller one. Thus, for every $v in L^2$,
  $ parallel \( "Id" - O_({ k \, j } \, j) \) v parallel_2^2 lt.eq parallel \( "Id" - D_k \) v parallel_2^2 . $
  For fixed $S$ and $k eq.not j \( S \)$, its seed decomposition shows that
    $\( "Id" - O_({ k \, j \( S \) } \, j \( S \)) \) f_S$ is the sum of exactly the components with $k in
    N_(S \, omega)$. Consequently
  #[#set math.equation(numbering: n => "(5.9)")
   $ sum_(S \, omega) \| N_(S \, omega) \| parallel f_(S \, omega) parallel_2^2 & =
     sum_(S eq.not diameter) sum_(k eq.not j \( S \)) parallel \( "Id" - O_({ k \, j \( S \) } \, j \( S \)) \)
     f_S parallel_2^2\
 & lt.eq sum_(k = 1)^d sum_(S eq.not diameter) parallel \( "Id" - D_k \) f_S parallel_2^2\
 & = sum_(k = 1)^d parallel \( "Id" - D_k \) f parallel_2^2 lt.eq 4 d . $ <res:residual-degree>]
  The inequality applies the preceding projection bound and adds the nonnegative terms with $j \( S \) = k$.
    The next equality uses the fact that $D_k$ commutes with the weight projections,
    so the images of distinct $f_S$’s remain orthogonal. This argument uses neither products of different $D_k$’s
    nor commutation of opposite endpoint projections on one seed.
  The three energy budgets are now available: weight interactions cost at most $4 d$,
    all nonconstant seeds at most $8 d^2$, and incident information hidden from the designated question at most $4
    d$. We next check exactly which of these components a restriction preserves.
  ===== 5.4 What the restriction keeps. <what-the-restriction-keeps.>
  For fixed $J$ and $j in J$, define the projection
  #[#set math.equation(numbering: n => "(5.10)")
   $ K_(J \, j) = W_j^1 product_(k in J \\ { j }) W_k^0 product_(e in binom(J \\ { j }, 2)) P_e^0
     product_(k in J \\ { j }) O_({ j \, k } \, j) . $ <res:restriction-operator>]
  All seed factors here act on distinct coordinates. Before applying $W_j^1$,
    these operators average exactly the unfrozen data other than the own questions $u_j$ and the own weights
    $s_j$. They retain the frozen data $upright(bold(a))$ as variables.
    The final centering $W_j^1$ subtracts the mean in $s_j$, which is independent of the retained seed information. Thus
  $ K_(J \, j) f = H_j^(J \, upright(bold(a))) \( u_j \, s_j \) -
    bb(E)_(s'_j) H_j^(J \, upright(bold(a))) \( u_j \, s'_j \) $
  as functions on the original product space. If
  $ cal(V) \( J \, upright(bold(a)) \) = sum_(j in J) bb(E)_(u_j) "Var"_(s_j)
    H_j^(J \, upright(bold(a))) \( u_j \, s_j \) \, $
  then integration over the initially random frozen data gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ bb(E)_(upright(bold(a))) cal(V) \( J \, upright(bold(a)) \) =
     sum_(j in J) parallel K_(J \, j) f parallel_2^2 . $ <res:restriction-variance>]
  This identity uses only independent seed coordinates. Conditioning on the own questions restricts each incident
    hidden seed to its own fiber, as in the definition of $H_j$.
  Consider $f_(S \, omega)$ and its designated position $j = j \( S \)$.
    This component is preserved by the term $K_(J \, j)$ whenever
  #[#set math.equation(numbering: n => "(5.12)")
   $ S ∩ J = { j } \, wide N_(S \, omega) ∩ J = diameter \, wide T_(S \, omega) ∩ binom(J \\ { j }, 2) =
     diameter . $ <res:survival>]
  To verify that its squared norm can be counted in (5.11),
    first note that $K_(J \, j)$ commutes with every $Pi_S$. Thus its outputs from different weight supports are
    orthogonal, and $parallel K_(J \, j) f parallel_2^2 = sum_S parallel K_(J \, j) f_S parallel_2^2$.
    The weight factors in $K_(J \, j)$ keep $f_S$ precisely when $S ∩ J = { j }$.
    For those $S$ whose designated position is this $j$, the seed factors are diagonal in the chosen seed
    decomposition: $P_e^0$ on a nonincident hidden seed keeps just its constant component,
    and $O_(e \, j)$ on an incident hidden seed keeps its constant and own-question components.
    The other seed coordinates are untouched. They therefore keep exactly the components satisfying the last two
    conditions of (5.12), with no cancellation among them. We may discard all other nonnegative squared norms in
    (5.11) and count each component solely in its designated term. It follows that
  #[#set math.equation(numbering: n => "(5.13)")
   $ bb(E)_(upright(bold(a))) cal(V) \( J \, upright(bold(a)) \) gt.eq
     sum_(S \, omega) upright(bold(1))_({ upright("conditions ") upright("(5.12)") upright(" hold") }) parallel
     f_(S \, omega) parallel_2^2 . $ <res:surviving-energy>]
  ===== 5.5 Averaging the restriction. <averaging-the-restriction.>
  Choose $J$ uniformly among all $h$-element subsets of $\[ d \]$.
    For a fixed component, the designated position belongs to $J$ with probability $h \/ d$.
    Conditional on this inclusion, a specified other position belongs to $J$ with probability
  $ p_1 = frac(h - 1, d - 1) \, $
  and a specified pair avoiding the designated position lies in $J$ with probability
  $ p_2 = frac(\( h - 1 \) \( h - 2 \), \( d - 1 \) \( d - 2 \)) . $
  The first two conditions in (5.12) fail only if one of $S \\ { j \( S \) }$ or $N_(S \, omega)$ is included.
    The third can fail only at a pair in $T_(S \, omega)$ avoiding $j \( S \)$.
    A union bound therefore gives conditional survival probability at least
  #[#set math.equation(numbering: n => "(5.14)")
   $ 1 - p_1 #scale(x: 120%, y: 120%)[\(] \| S \| - 1 + \| N_(S \, omega) \| #scale(x: 120%, y: 120%)[\)] -
     p_2 \| T_(S \, omega) \| . $ <res:survival-probability>]
  Charging all of $T_(S \, omega)$ only decreases this lower bound.
    The bound remains valid when the displayed expression is negative.
  By (5.5), (5.9), and the orthogonal refinement of each $f_S$,
  $ sum_(S \, omega) #scale(x: 120%, y: 120%)[\(] \| S \| -
    1 + \| N_(S \, omega) \| #scale(x: 120%, y: 120%)[\)] parallel f_(S \, omega) parallel_2^2 lt.eq 8 d . $
  Combining (5.6), (5.7), (5.13), and (5.14) now yields
  #[#set math.equation(numbering: n => "(5.15)")
   $ bb(E)_(J \, upright(bold(a))) cal(V) \( J \, upright(bold(a)) \) & gt.eq h /
     d #scale(x: 120%, y: 120%)[\(] parallel f parallel_2^2 - 8 d p_1 - 8 d^2 p_2 #scale(x: 120%, y: 120%)[\)]\
 & gt.eq h / d #scale(x: 120%, y: 120%)[\(] nu d - 16 h - 32 h^2 #scale(x: 120%, y: 120%)[\)] gt.eq
   frac(nu h, 2) . $ <res:averaged-variance>]
  For the second inequality, $d gt.eq 4$ gives $p_1 lt.eq 2 h \/ d$ and $p_2 lt.eq 4 h^2 \/ d^2$;
    the last inequality is (5.3).
  The nonnegative measurable quantity $cal(V) \( J \, upright(bold(a)) \)$ is bounded, since $f$ is bounded.
    Its mean in (5.15) implies that a set of choices $\( J \, upright(bold(a)) \)$ of positive probability has
    $cal(V) \( J \, upright(bold(a)) \) gt.eq nu h \/ 4$. Choose one such restriction.
    The conditional averages were defined by explicit integration with its frozen coordinates plugged in.
    All hidden seeds and batch weights are then drawn with their original product law,
    establishing (5.4) with the asserted interpretation. ◻
]

== 6 Lists from own-question conditional means <ana:private-section>

The restriction lemma retains variance in conditional means that see only one position’s own questions and
  weights. We use this variance to produce short lists of local labels. Set

#[#set math.equation(numbering: n => "(6.1)")
 $ beta = nu / 8 \, wide ell = 2 / beta \, wide h = 2 ell . $ <src:list-parameters>]

Since $nu = 1 \/ \( 2^7 m^3 \)$, both $ell$ and $h$ are positive integers depending only on $m$.
  Assume from now on that the number $d$ of graph positions also satisfies

#[#set math.equation(numbering: n => "(6.2)")
 $ h < d \, wide 16 h + 32 h^2 lt.eq frac(nu d, 2) . $ <src:restriction-budget>]

The joint parameter choice in 8 will ensure these conditions.
  Applying 10 to the function in 9 supplies a fixed set $J subset \[ d \]$ of size $h$ and fixed data $bold(a)$
  consisting of the weights outside $J$ and every seed outside $cal(E)_J = binom(J, 2)$.
  Write $f^(*) \( bold(c)_J \, bold(s)_J \)$ for $f$ with these values plugged in.
  In the rest of this section the probability law is the product of independent uniform hidden seeds
  $\( c_e \)_(e in cal(E)_J)$ and independent uniform weight blocks $\( s_j \)_(j in J)$ on $\[ - 1 \, 1 \]^r$.
  The choice of the fixed data does not condition these remaining draws on any event of success.

For $j in J$, write $u_j = \( q_(j k) \)_(k in J \\ { j })$, in increasing order of $k$,
  for the tuple of questions received by $j$ from its incident hidden seeds.
  Together with $bold(a)$, it specifies the whole query $i_j$; denote the completed query by $i_j \( u_j \)$.
  The conditional averages supplied by the restriction lemma satisfy

#[#set math.equation(numbering: n => "(6.3)")
 $ sum_(j in J) bb(E)_(u_j) "Var"_(s_j) H_j \( u_j \, s_j \) gt.eq nu h \/ 4 . $ <ana:restricted-variance>]

Here $H_j \( u \, s \)$ is the mean of $f^(*)$ given the own questions $u_j = u$ and the own weight block $s_j =
  s$. Our aim is to turn this variance into own-input lists of size at most $ell$ whose maximum compatible hit
  count has expectation at least two.

To differentiate these means, we use the explicit integral from 5.
  For a tuple $u$ in $"supp" u_j$, let $kappa_j \( u \)$ be the conditional distribution of all hidden seeds given
  $u_j = u$. On an incident pair ${ j \, k }$, this is uniform on the occurrence indices producing the specified
  question at $j$; on a nonincident hidden pair it is uniform on $\[ M \]$.
  All these conditional seed coordinates are independent. This follows from independence of the original seeds and
  from the fact that each condition fixes a function of just one seed. Thus

#[#set math.equation(numbering: n => "(6.4)")
 $ H_j \( u \, s \) = bb(E)_(bold(c)_J tilde.op kappa_j \( u \) \, thin \( s_k \)_(k in J \\ { j }))
   f^(*) \( bold(c)_J \, bold(s)_J \) \|_(s_j = s) \, $ <ana:own-mean>]

where the other weight blocks have their original independent uniform laws.
  The seed law in this formula does not depend on $s$. We use zero as a fallback for $H_j$ on unsupported own
  question tuples. The fixed data throughout are $Phi \, F \, J$, and $bold(a)$.

=== 6.1 One gradient rule on every tuple <one-gradient-rule-on-every-tuple>

The increments at positions outside $J$ are fixed: their queries use no seed in $cal(E)_J$. Set

$ c_0 = sum_(k in.not J) z \( i_k \, s_k \) . $

For a fixed tuple of batch queries $bold(i) = \( i_j \)_(j in J)$, consider the function on the whole real weight space

$ psi_(bold(i)) \( bold(s)_J \) = F (c_0 + sum_(j in J) z \( i_j \, s_j \)) . $

For $I in cal(I)$, let $v_I \( bold(i) \) in bb(R)^(J times \[ r \])$ have entry one at
  $\( j \, "slot"_(i_j) \( lambda \) \)$ if $\( i_j \, lambda \) in I$, and zero elsewhere.
  It has at most one nonzero entry in each block $j$. We will represent the gradient using these incidence
  vectors. At exceptional weights where a derivative need not exist,
  the same representation will hold for a prescribed value of the gradient rule.

#thm([Lemma 6.1.])[
  (A gradient rule in the compatibility hull).  #emph[There is a deterministic measurable rule
    $g = \( g_j \)_(j in J) in bb(R)^(J times \[ r \])$, defined at every batch query and real-weight tuple,
    that equals $nabla psi_(bold(i))$ outside a finite union of proper affine hyperplanes for each fixed query
    tuple and fixed frozen data. At every tuple,
#[#set math.equation(numbering: n => "(6.5)")
 $ g in "conv" { plus.minus v_I \( bold(i) \) : I in cal(I) } . $ <ana:hull>]

 Consequently,
#[#set math.equation(numbering: n => "(6.6)")
 $ parallel g_j parallel_1 lt.eq 1 \, wide g_(j \, t') = 0 quad
   upright("if ") t' in.not "slot"_(i_j) \( Lambda_(i_j) \) . $ <ana:block-bound>]

 The rule uses the fixed formula for $F$, the frozen increments, and the supplied batch queries and weights.
   It does not inspect which hidden seed occurrences produced those queries.]
] <ana:gradient>

#proof[
  Let $upright(bold(1))_I in bb(R)^(cal(P))$ be the indicator vector of $I$.
    For $zeta in A_(*) union \( - A_(*) \)$, $I in cal(I)$, and $epsilon in { - 1 \, 1 }$,
    form the finite collection of affine expressions
  #[#set math.equation(numbering: n => "(6.7)")
   $ L_(zeta \, I \, epsilon) \( bold(s)_J \) = epsilon chevron.l upright(bold(1))_I \, c_0 - zeta chevron.r +
     epsilon chevron.l v_I \( bold(i) \) \, bold(s)_J chevron.r . $ <ana:affine-candidates>]
  For either $cal(C) = A_(*)$ or $cal(C) = - A_(*)$,
  $ "dist"_(*) (c_0 + sum_(j in J) z \( i_j \, s_j \) \, cal(C)) =
    min_(zeta in cal(C)) max_(I in cal(I) \, thin epsilon in { - 1 \, 1 }) L_(zeta \, I \, epsilon) \( bold(s)_J \) . $
  In particular, $psi_(bold(i))$ is continuous and piecewise affine, with finitely many pieces.
  Compare all pairs of candidates in (6.7). If two candidates with different slope vectors in the unfrozen weights
    tie in value, set $g = 0$. Otherwise take the true gradient of the finite formula for $psi_(bold(i))$.
    This latter choice is well-defined. Two candidates with the same slope either never tie or are identical
    affine functions. All other comparisons are strict at such a point and persist in a neighborhood;
    each minimum and maximum there selects one affine function up to identical copies.
    The resulting formula is affine in that neighborhood. Fixing a deterministic order on candidates resolves any
    choice between identical copies without changing its gradient.
  Each discarded equality has a nonzero normal in the unfrozen coordinates,
    hence defines a proper affine hyperplane. No choice of frozen weights changes that fact,
    since frozen weights change the offsets but not the slopes.
    Identical slopes caused by repeated endpoint questions or other coincidences are allowed.
    Finite comparisons prove measurability, and the rule is defined even at query tuples that cannot arise from
    the hidden seed law. Its formula uses the queries themselves and no additional seed information.
  At a point not discarded, choose an active affine expression in each distance formula.
    Write their slopes as $epsilon_(-) v_(I_(-)) \( bold(i) \)$ for the distance to $-
    A_(*)$ and $epsilon_(+) v_(I_(+)) \( bold(i) \)$ for the distance to $A_(*)$.
    Since $F$ is half the difference of these distances,
  $ g = 1 / 2 #scale(x: 120%, y: 120%)[\(] epsilon_(-) v_(I_(-)) \( bold(i) \) -
    epsilon_(+) v_(I_(+)) \( bold(i) \) #scale(x: 120%, y: 120%)[\)] . $
  Both vectors in this average are signed compatible-incidence vectors, proving (6.5).
    At discarded points the chosen value zero also belongs to the symmetric hull.
    Every signed incidence vector has block $ell^1$ norm at most one and zero entries in the unused slots,
    so convexity proves (6.6) at every tuple. ◻
]

=== 6.2 Own-question conditional gradients <own-question-conditional-gradients>

For supported $u$ and any $s in bb(R)^r$, define

#[#set math.equation(numbering: n => "(6.8)")
 $ macron(g)_j \( u \, s \) = bb(E)_(bold(c)_J tilde.op kappa_j \( u \) \, thin \( s_k \)_(k in J \\ { j }))
   g_j \( bold(c)_J \, bold(s)_J \) \|_(s_j = s) . $ <ana:conditional-gradient>]

Here the notation for $g_j$ means that the seed tuple is used only to form the queries supplied to the rule in 11.
  Set $macron(g)_j \( u \, s \) = 0$ for unsupported own tuples.
  For supported $u$, its query $i_j \( u \)$ is fixed throughout the integral.
  Convexity and (6.6) give, at every own input,

#[#set math.equation(numbering: n => "(6.9)")
 $ parallel macron(g)_j \( u \, s \) parallel_1 lt.eq 1 \, wide macron(g)_(j \, t') \( u \, s \) = 0 quad
   upright("on unused slots of ") i_j \( u \) . $ <ana:mean-block-bound>]

#thm([Lemma 6.2.])[
  (Conditional cube variance).  #emph[For each $j in J$ and supported own tuple $u$,
    the function $H_j \( u \, dot.op \)$ is $1$-Lipschitz with respect to $parallel dot.op parallel_oo$.
    For almost every own $s in \[ - 1 \, 1 \]^r$,
#[#set math.equation(numbering: n => "(6.10)")
 $ partial_(s^(\( t' \))) H_j \( u \, s \) = macron(g)_(j \, t') \( u \, s \) \, wide
   t' in \[ r \] . $ <ana:conditional-derivative>]

 Its variance satisfies the dimension-independent bound
#[#set math.equation(numbering: n => "(6.11)")
 $ "Var"_s H_j \( u \, s \) lt.eq 2 bb(E)_s parallel macron(g)_j \( u \, s \) parallel_2^2 . $ <ana:cube-variance>]

 Consequently, under the fixed restricted law,
#[#set math.equation(numbering: n => "(6.12)")
 $ sum_(j in J) bb(E) parallel macron(g)_j \( u_j \, s_j \) parallel_2^2 gt.eq nu h \/ 8 = beta h . $ <ana:energy>]

]
] <ana:cube>

#proof[
  Replacing the own block $s$ by $s'$, with a seed configuration and other weights fixed,
    changes the integrand in (6.4) by at most $parallel s - s' parallel_oo$. The same bound holds after averaging.
    In particular, every scalar-coordinate difference quotient of the integrand is bounded in absolute value by one.
  For each fixed hidden seed tuple, the full gradient identification in 11 holds outside a null set in all batch
    weights. Fubini implies that for almost every own $s$ it holds for almost all other weight blocks.
    The conditional seed law $kappa_j \( u \)$ has finite support and does not depend on $s$,
    so the exceptional sets may be united over its support and over the finitely many weight coordinates.
    At the remaining own values, the coordinate difference quotients converge almost surely to $g_(j \, t')$.
    Dominated convergence gives (6.10); the boundary of the cube has measure zero.
  Every coordinate-line restriction of $H_j \( u \, dot.op \)$ is Lipschitz and hence absolutely continuous.
    By Fubini applied to (6.10), for almost every fixing of the other own coordinates its derivative agrees almost
    everywhere with the corresponding entry of $macron(g)_j$.
    The fundamental theorem of calculus therefore expresses differences between any two values on such a line as
    the integral of that entry.
  Let $w_0$ be the restriction of $H_j \( u \, dot.op \)$ to one of these lines.
    For $x \, y in \[ - 1 \, 1 \]$, Cauchy–Schwarz gives
  $ \| w_0 \( x \) - w_0 \( y \) \|^2 lt.eq \| x - y \| integral_(min \( x \, y \))^(max \( x \, y \)) \|
    w'_0 \( z \) \|^2 thin d z lt.eq 2 integral_(- 1)^1 \| w'_0 \( z \) \|^2 thin d z . $
  For independent uniform $X \, Y in \[ - 1 \, 1 \]$, this implies
  $ "Var" \( w_0 \( X \) \) = 1 / 2 bb(E) \| w_0 \( X \) - w_0 \( Y \) \|^2 lt.eq
    integral_(- 1)^1 \| w'_0 \( z \) \|^2 thin d z = 2 bb(E) \| w'_0 \( X \) \|^2 . $
  The product decomposition of Efron and Stein #cite(label("EfronStein1981")) Section 2 bounds variance by the sum
    of the averaged one-coordinate conditional variances. To see this consequence directly,
    decompose the identity at each scalar coordinate into its averaging projection and its orthogonal complement.
    The resulting orthogonal components are indexed by subsets of coordinates.
    Total variance counts every nonconstant squared component once,
    while the sum of one-coordinate conditional variances counts it once for each member of its nonempty index
    subset. Applying the line estimate, integrating over the other coordinates, and summing proves (6.11).
    Averaging that bound over the own tuples and summing over $j$, then using (6.3), proves (6.12). ◻
]

A particular own weight value can make an entire slice of the other weights exceptional.
  The derivative identity is only an almost-everywhere assertion,
  and (6.12) is integrated over the restricted law. In contrast, (6.5), (6.6),
  and (6.9) hold at every input of their respective rules, including exceptional weights.

=== 6.3 Thresholding the conditional gradients <thresholding-the-conditional-gradients>

The conditional means now retain total squared gradient energy at least $beta h$,
  and each block has $ell^1$ norm at most one. Keeping coordinates above a fixed threshold therefore gives short
  lists without an alphabet-size factor. The remaining task is to transfer their mass back to the single full
  gradient, whose compatible incidence representation can certify simultaneous hits.

For supported $u$, define the slot-ordered list

#[#set math.equation(numbering: n => "(6.13)")
 $ cal(L)_j \( u \, s \) = {lambda in Lambda_(i_j \( u \)) :
   lr(|macron(g)_(j \, "slot"_(i_j \( u \)) \( lambda \)) \( u \, s \)|) gt.eq beta / 2} . $ <ana:list-definition>]

For an unsupported own question tuple, let the list be empty.
  At an actual draw write $L_j = cal(L)_j \( u_j \, s_j \)$, and define

#[#set math.equation(numbering: n => "(6.14)")
 $ Z = max_(I in cal(I)) \# { j in J : exists lambda in L_j upright(" with ") \( i_j \, lambda \) in I } .
   $ <ana:hit-count>]

#thm([Proposition 6.3.])[
  (Local lists and compatible hits).  #emph[The functions $cal(L)_j$ are deterministic total measurable maps
    returning at most $ell$ valid labels. Once $Phi \, F \, J \,
    bold(a)$ and the conditional kernels above are fixed, each list uses only its own questions $u_j$ and weights
    $s_j$. In particular it has no additional access to the actual hidden seed occurrences or to any other actual
    batch input. Under the fixed restricted product law,
#[#set math.equation(numbering: n => "(6.15)")
 $ bb(E) Z gt.eq frac(beta h, 2) = 2 . $ <ana:list-hits>]

]
] <ana:lists>

#proof[
  The mean block bound gives
  $ beta / 2 \| cal(L)_j \( u \, s \) \| lt.eq parallel macron(g)_j \( u \, s \) parallel_1 lt.eq 1 \,
    wide \| cal(L)_j \( u \, s \) \| lt.eq 2 \/ beta = ell . $
  It also gives zero dummy entries, so thresholding returns only valid labels.
    Finite threshold comparisons of measurable functions, with an empty-list fallback, prove totality and measurability.
  We first transfer the retained mass of the own conditional means to the full gradient rule $g$,
    and then apply its pointwise hull bound. For an actual own input,
    let $T_j subset \[ r \]$ be the set of slots of $L_j$, and write $cal(G)_j$ for the information
    $\( u_j \, s_j \)$. The conditional mean in (6.8) is a version of $bb(E) \[ g_j divides cal(G)_j \]$,
    defined by the displayed kernel even at own values of probability zero.
    For slots outside $T_j$, (6.9) and the threshold give
  $ sum_(t' in.not T_j) \| macron(g)_(j \, t') \|^2 lt.eq beta /
    2 sum_(t' in.not T_j) \| macron(g)_(j \, t') \| lt.eq beta / 2 . $
  For the list slots, each mean entry has magnitude at most one, and conditional Jensen gives
  $ sum_(t' in T_j) \| macron(g)_(j \, t') \|^2 lt.eq sum_(t' in T_j) \| macron(g)_(j \, t') \| lt.eq
    bb(E) [sum_(t' in T_j) \| g_(j \, t') \| thin mid(bar.v) thin cal(G)_j] . $
  The last inequality uses the fact that $T_j$ is determined by $cal(G)_j$.
    Taking expectations, summing, and applying (6.12) therefore yields
  #[#set math.equation(numbering: n => "(6.16)")
   $ bb(E) sum_(j in J) sum_(lambda in L_j) \| g_(j \, "slot"_(i_j) \( lambda \)) \| gt.eq beta h - beta / 2 h =
     frac(beta h, 2) . $ <ana:retained-mass>]
  For arbitrary fixed queries and arbitrary lists of valid labels,
    the sum of absolute values over their slot sets is a convex function of the full vector in
    $bb(R)^(J times \[ r \])$. On a signed generator $plus.minus
    v_I \( bold(i) \)$ it equals the number of positions hit by that selection $I$,
    since each block contains at most one selected slot. Its value on every point of the hull in (6.5) is
    consequently at most the maximum such hit count. At every realized tuple,
    apply this deterministic statement to the realized lists and the full vector $g$:
  #[#set math.equation(numbering: n => "(6.17)")
   $ sum_(j in J) sum_(lambda in L_j) \| g_(j \, "slot"_(i_j) \( lambda \)) \| lt.eq Z . $ <ana:pointwise-hits>]
  No independence between the lists and the gradient, or between positions, is required.
    Combining (6.16) and (6.17) proves (6.15), with $beta h \/ 2 = 2$ from (6.1).
  Finally, (6.4) and (6.8) integrate over hidden seeds against the fixed law $kappa_j \( u \)$,
    and over other weights against their fixed cube laws. Their actual realized values are not inputs to the
    resulting mean function. Thus (6.13) has exactly the stated own-input dependence.
    No efficiency of this rule is needed for the soundness argument. ◻
]

The kernels and list maps in this section remain fixed throughout the subsequent argument.
  Conditioning later on other hidden seeds or on all weights changes the distribution of the inputs to these maps;
  it does not recompute their conditional averages. Locality, validity,
  and list-size bounds continue to hold for every fixed weight choice.
  The lower bound (6.15) concerns the original restricted product law.

== 7 Pair decoding and soundness <dec:section>

Set

#[#set math.equation(numbering: n => "(7.1)")
 $ sigma = frac(1, h^2 ell^2) \, $ <src:decoding-soundness>]

and assume throughout this section that $"val" \( Phi \) lt.eq sigma$.
  The source promise bounds every labeling of $U union V$, so the decoders below may use arbitrary fixed
  instance-dependent data. Their essential restriction is that the label returned at a variable does not also
  depend on the sampled constraint occurrence.

Fix a set $J subset.eq \[ d \]$ of size $h$ and frozen data $upright(bold(a))$ as in 10.
  The remaining seeds $c_e$, $e in binom(J, 2)$, are independent uniform elements of $\[ M \]$;
  the weight blocks $s_j$, $j in J$, are independent uniforms on $\[ - 1 \, 1 \]^r$, independent of the seeds.
  Let $u_j$ be position $j$’s tuple of questions from its incident hidden seeds.
  Together with $upright(bold(a))$, this tuple determines its query $i_j$.

Consider any fixed total measurable maps

#[#set math.equation(numbering: n => "(7.2)")
 $ L_j = cal(L)_j \( u_j \, s_j \) subset.eq Lambda_(i_j) \, wide \| L_j \| lt.eq ell . $ <dec:local_lists>]

Each map receives only the indicated own questions and weights;
  on an unsupported own-question tuple it returns the empty list. Order each list by its slots.
  The lists in 13 have exactly these properties.

For distinct $j \, k in J$, let $E_(j k)$ be the event that some $I in cal(I)$ hits both lists:
  it contains $\( i_j \, lambda_j \)$ and $\( i_k \, lambda_k \)$ for labels $lambda_j in L_j$, $lambda_k in L_k$.
  Define

#[#set math.equation(numbering: n => "(7.3)")
 $ Z = max_(I in cal(I)) \# { j in J : upright(" some ") lambda in L_j upright(" has ") \( i_j \, lambda \) in
   I } . $ <dec:hits>]

#thm([Lemma 7.1.])[
  (Decoding a pair).  #emph[For every fixed $J \, upright(bold(a))$ and fixed list maps satisfying (7.2),
#[#set math.equation(numbering: n => "(7.4)")
 $ Pr \( E_(j k) \) lt.eq ell^2 sigma quad \( j \, k in J \, med j < k \) \, wide bb(E) Z lt.eq 1 +
   binom(h, 2) ell^2 sigma = 3 / 2 - frac(1, 2 h) < 3 / 2 . $ <dec:pair_bound>]

]
] <dec:pair>

#proof[
  Fix $j < k$ and write $e = { j \, k }$. Fix all batch weights and all hidden seeds except $c_e$.
    By independence, the remaining occurrence $c_e$ is still uniform on $\[ M \]$.
    Position $j$’s only varying question is $x_(c_e) in U$, and position $k$’s only varying question is $y_(c_e)
    in V$. Every other argument of each list map is now a constant, while the maps themselves remain fixed.
    For the maps constructed in 13, their conditional averages are not recomputed:
    the actual values just fixed are not supplied as new arguments to those averages.
  For $x in U$, form the tuple $u_j^x$ by putting $x$ in the distinguished $e$-coordinate of $u_j$ and retaining
    all its other, now fixed, coordinates. Define $u_k^y$ for $y in V$ in the same way.
    Choose default symbols $a_U in Sigma_U$ and $a_V in Sigma_V$.
    For each pair of ranks $rho \, tau in \[ ell \]$, define a labeling $A_(rho \, tau)$ of the entire source
    instance as follows. At a variable $x in U$, evaluate $cal(L)_j \( u_j^x \, s_j \)$.
    If rank $rho$ is present, give $x$ its value in that label; otherwise give it $a_U$.
    At a variable $y in V$, use its value in the label at rank $tau$ of $cal(L)_k \( u_k^y \, s_k \)$,
    or $a_V$ if the rank is absent.
  This gives one symbol at every source variable. If a substituted tuple has probability zero,
    its empty list invokes the same fallback. If the variable already occurs in another coordinate of the query,
    its value in a present label is still unique: a local label is an assignment on the set of distinct variables
    in the scope. Thus repeated variables, empty valid-label sets, and missing ranks cause no ambiguity.
    The assigned symbol on $U$ depends only on $x$, and the assigned symbol on $V$ only on $y$,
    besides fixed data. It does not use the occurrence index or its projection map.
    The source promise consequently gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ Pr_(c upright(" uniform in ") \[ M \]) #scale(x: 120%, y: 120%)[\[] pi_c \( A_(rho \, tau) \( x_c \) \) =
     A_(rho \, tau) \( y_c \) #scale(x: 120%, y: 120%)[\]] lt.eq sigma . $ <dec:rank_soundness>]
  For every actual remaining occurrence $c_e$, the reconstructed tuples $u_j^(x_(c_e)) \,
    u_k^(y_(c_e))$ are supported under the original hidden-seed law:
    the full seed tuple comprising the fixed other seeds and this occurrence has positive probability in that
    product law. They are exactly the own tuples at which the actual lists are evaluated.
  Suppose $E_(j k)$ occurs and choose the ranks $rho \, tau$ of labels witnessing it.
    The endpoint $x_(c_e)$ belongs to $P \( i_j \)$, and $y_(c_e)$ to $P \( i_k \)$.
    Compatibility requires the induced labeling to satisfy every source constraint with both endpoints in the
    union of the selected scopes. In particular it satisfies the sampled occurrence $c_e$.
    Its endpoint labels are exactly those used by $A_(rho \, tau)$, so
  $ pi_(c_e) \( A_(rho \, tau) \( x_(c_e) \) \) = A_(rho \, tau) \( y_(c_e) \) . $
  This uses the sampled occurrence even when other occurrences have the same endpoints.
    Union bounding (7.5) over the $ell^2$ rank pairs proves the pair estimate for the fixed weights and other
    seeds. It is uniform in those fixed values, so averaging proves $Pr \( E_(j k) \) lt.eq ell^2 sigma$.
    No conditioning on compatible labels or successful ranks is used.
  For every integer $z gt.eq 0$, $z lt.eq 1 + binom(z, 2)$,
    since the difference is $\( z - 1 \) \( z - 2 \) \/ 2 gt.eq 0$.
    Choose a selection attaining the maximum in (7.3). Each of the pairs among its $Z$ hit positions witnesses the
    corresponding event $E_(j k)$. Consequently, pointwise,
  #[#set math.equation(numbering: n => "(7.6)")
   $ Z lt.eq 1 + binom(Z, 2) lt.eq 1 + sum_({ j \, k } in binom(J, 2)) upright(bold(1))_(E_(j k)) . $ <dec:pair_count>]
  Taking expectations, using the pair estimate, and substituting $sigma = 1 \/ \( h^2 ell^2 \)$ gives (7.4). ◻
]

#thm([Corollary 7.2.])[
  (Soundness).  #emph[For the graph constructed in 3, assume (6.2).
    If $"val" \( Phi \) lt.eq sigma$, every independent set has size strictly less than $n \/ m$.
    Consequently $tau \( G \) > \( 1 - 1 \/ m \) n$.]
] <dec:soundness>

#proof[
  Suppose an independent set $cal(A)$ has size at least $n \/ m = 2 b_0 n$.
    By the low-norm clique observation at the start of 4, at most one vertex of $cal(A)$ has $∥S_v∥_(*) lt.eq t$.
    Since $n gt.eq p > 1 \/ b_0$, the number of its high-norm vertices is at least
  $ 2 b_0 n - 1 > b_0 n . $
  9 therefore supplies the single fixed odd Lipschitz function $F$ and its variance lower bound.
    Applying 10 and then the list construction of Proposition 6.3, (6.15) gives fixed $J \,
    upright(bold(a))$ and local lists with
  $ bb(E) Z gt.eq frac(beta h, 2) = 2 . $
  This contradicts 14, which gives $bb(E) Z < 3 \/ 2$ under the same remaining product law.
  The lower bound just used averages over the hidden seeds and continuous batch weights for those fixed $J \,
    upright(bold(a))$. The upper bound fixes further weights and seeds only to decode a single occurrence and is
    then averaged back. It does not require an energy lower bound, or a derivative identity,
    at every such further fixing.
  We have ruled out every independent set of size at least $n \/ m$.
    The complement of any vertex cover is independent, so every cover has size strictly greater than $n - n \/ m$,
    as claimed. ◻
]

== 8 The approximation threshold <sec:conclusion>

The construction and soundness analysis were stated with explicit requirements on their constants.
  We now choose those constants jointly, before requesting the source alphabets.

For the given integer $m gt.eq 4$, the definitions in (2.2), (4.1), (6.1), (7.1) are completed by choosing $d =
  2^38 m^10$. Thus

#[#set math.equation(numbering: n => "(8.1)")
 $ a & = frac(1, 4 m) \, & b_0 & = frac(1, 2 m) \, & nu & = frac(1, 2^7 m^3) \,\
beta & = frac(1, 2^10 m^3) \, & ell & = 2^11 m^3 \, & h & = 2^12 m^3 \,\
d & = 2^38 m^10 \, & sigma & = frac(1, 2^46 m^12) \, & p & = 2 d + 1 \,\
t & = 2^17 m^4 . $ <src:parameters>]

The construction conditions (2.1) hold because $d$ is even and $sqrt(d) = 2^19 m^5 > 4 m$.
  For the restriction conditions (6.2), we have $h < d$ and

$ 16 h + 32 h^2 = 2^16 m^3 + 2^29 m^6 lt.eq 2^30 m^7 = frac(nu d, 2) . $

The displayed inequality holds already for $m gt.eq 1$. The remaining list and decoding identities are

$ frac(beta h, 2) = 2 \, wide binom(h, 2) ell^2 sigma = frac(h - 1, 2 h) < 1 / 2 . $

All choices depend only on $m$; no label alphabet has entered them.
  Their magnitude affects the constants and degree of the polynomial running time,
  but every fixed $m$ gives a fixed reduction.

#proof[
  Fix $m gt.eq 4$ and the constants in (8.1). Apply 3 at this $sigma$ to obtain fixed source alphabets and a
    polynomial-time reduction from $upright(3 S A T)$. Now define $q \,
    r$ from those alphabets and construct the graph. 6 makes its vertex and edge lists explicit in deterministic
    polynomial time. All the hypotheses of Proposition 3.5, Corollary 7.2 have been verified above,
    so these results give the two cover bounds in 1.
  For a fixed real $alpha in \[ 1 \, 2 \)$, choose a fixed integer $m gt.eq 4$ such that
  #[#set math.equation(numbering: n => "(8.2)")
   $ alpha < R_m := frac(1 - 1 \/ m, 1 \/ 2 + 1 \/ m) = 2 - frac(6, m + 2) . $ <eq:gap-ratio>]
  Suppose an algorithm always returns a vertex cover of size at most $alpha tau \( G \)$.
    On a completeness instance its output has size strictly less than
  $ alpha (1 / 2 + 1 / m) n < (1 - 1 / m) n \, $
  whereas on a soundness instance every cover has size strictly greater than $\( 1 - 1 \/ m \) n$.
    Comparing the output cardinality with this rational threshold distinguishes the two source cases.
    The comparison uses only integer arithmetic: multiply the cardinality by $m$ and compare with $\( m - 1 \) n$.
    The real number $alpha$ is used only to choose the fixed integer $m$; it is not an input to the reduction.
    This proves 2. ◻
]

For completeness, the matching upper bound on the approximation factor is elementary.
  Find a maximal matching and return the set of all its endpoints. Maximality makes this set a vertex cover:
  an edge with neither endpoint selected could be added to the matching.
  Every vertex cover contains an endpoint of each matching edge, and these edges are disjoint.
  The returned cover therefore has size at most twice optimum.
  Together with 2, this gives the constant approximation threshold $2$, unless $upright(P) = upright("NP")$.

#bibliography("refs.bib", style: "ieee", title: [References])
