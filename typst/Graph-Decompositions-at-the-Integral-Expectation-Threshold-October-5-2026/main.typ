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

#align(center)[#text(size: 16pt, weight: "bold")[Graph Decompositions at the Integral Expectation Threshold]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:intro>

All graphs are finite and simple, and copies are not required to be induced.
  For a graph $J$ on at most $n$ vertices, let

$ p_c \( J \; n \) = min { p in \[ 0 \, 1 \] : bb(P) \( G \( n \, p \) upright(" contains a copy of ") J \) gt.eq
  1 \/ 2 } . $

Here $G \( n \, p \)$ has vertex set $\[ n \] = { 1 \, dots.h \, n }$,
  with edges present independently with probability $p$. We set $p_c \( J \; n \) = 0$ when $J$ is edgeless.

To define the integral expectation threshold, put $X = E \( K_n \)$ and let $cal(F)_H subset.eq
  2^X$ be the increasing family of edge sets whose graphs contain $H$.
  A family $cal(C) subset.eq 2^X$ #emph[covers] $cal(F)_H$ if every $A in cal(F)_H$ contains some $S in cal(C)$.
  Its cost at $p$ is

$ c_p \( cal(C) \) = sum_(S in cal(C)) p^(\| S \|) . $

For $H$ with at least one edge, define

#[#set math.equation(numbering: n => "(1.1)")
 $ q \( H \; n \) = max { p in \[ 0 \, 1 \] : cal(F)_H upright(" has a cover ") cal(C) upright(" with ")
   c_p \( cal(C) \) lt.eq 1 \/ 2 } . $ <eq:q-definition>]

The maximum exists because there are only finitely many families of subsets of $X$.
  Each cover gives a first-moment bound on containment, so $q \( H \; n \) lt.eq p_c \( H \; n \)$.
  For convenience set $q \( H \; n \) = 0$ for edgeless graphs as well.

#thm([Theorem 1.1.])[
  #emph[There exist an absolute integer $k gt.eq 2$ and an absolute constant $L gt.eq 1$ such that,
    for every $n gt.eq 2$ and every graph $H$ on at most $n$ vertices, the edges of $H$ admit a partition
$ E \( H \) = E \( H_1 \) thin dot(union) thin dots.h.c thin dot(union) thin E \( H_k \) quad upright("with") quad
  p_c \( H_i \; n \) lt.eq L q \( H \; n \) wide \( 1 lt.eq i lt.eq k \) . $

 The pieces may be empty and may share vertices. The partition depends only on $H \,
   n$ and is fixed before the random host is sampled.]
] <thm:main>

This proves Conjecture 8.1 of Ascoli, He, Park, and Talagrand #cite(label("AHPT26")).
  Their formulation allows overlapping edge sets. Assigning each edge to one piece containing it gives a partition
  and cannot increase any piece’s containment threshold. Thus the two formulations are equivalent.

=== History and significance <history-and-significance>

Kahn and Kalai #cite(label("KK07")) proposed a general comparison between ordinary thresholds and integral
  expectation thresholds with a logarithmic loss. Following the fractional version established by Frankston, Kahn,
  Narayanan, and Park #cite(label("FKNP21")), Park and Pham #cite(label("PP24")) proved the integral comparison.
  For graph containment it gives

$ p_c \( H \; n \) lt.eq C q \( H \; n \) log max { 2 \, \| E \( H \) \| } $

with an absolute constant $C$. Theorem 1 removes this logarithmic loss after partitioning the target into a
  bounded number of pieces. The assertion concerns each fixed piece’s ordinary threshold;
  their embeddings need not agree on shared vertices.

Ascoli, He, Park, and Talagrand introduced generalized thresholds based on unions of likely graphs,
  related them to Talagrand’s discrete-convexity conjecture,
  and formulated the decomposition problem above #cite(label("AHPT26")).
  They proved bounded-degeneracy cases and further cases with both degeneracy and maximum-degree restrictions
  #cite(label("AHPT26")) Theorems 1.12–1.13. Their Section 8 isolates the bipartite edges between high- and
  low-degree vertices as a principal remaining difficulty.

We use the same-parameter integral covering theorem from #emph[Talagrand’s discrete-convexity conjecture]
  #cite(label("OpenAI26DC")) Theorem 1.1, which proves the discrete conjecture formulated in
  #cite(label("Talagrand10")) Conjecture 7.1. It is stated precisely in Section 2;
  this is an essential companion input. All remaining graph-decomposition and embedding arguments are proved below.

=== Method <method>

The covering theorem places one labelled copy of $H$ inside the union of a bounded number of deterministic graphs
  from a class $cal(D)$ having high probability at a density $r$ comparable to $q \( H \; n \)$.
  Assigning each edge to one of these graphs gives initial pieces.
  In the large-degeneracy case we isolate a small set $Y$ containing the high-degree vertices and enlarge it until
  each outside vertex has few neighbors in $Y$. Subsequent splitting produces pieces inside $Y$, outside $Y$,
  and across the cut.

To embed a cut piece while fixing $Y$, each nonisolated outside vertex needs a distinct image adjacent to its
  prescribed set of at most $s$ vertices in $Y$. Hall’s criterion asks for enough candidate images for every
  collection of outside vertices. Membership in a typical class alone does not ensure this;
  the class must control unions of arbitrarily many such conditions.

The compression lemma selects at most $ceil.l 2 r^(- s) ceil.r$ requirements from any family so that every
  neighborhood containing an original requirement contains a selected requirement with probability at least $1 \/
  2$ after adding each vertex of $Y$ independently with probability $r$. This principle is independent of graphs.
  It permits simultaneous concentration over all subfamilies of this bounded size while still controlling every
  Hall condition. We define $cal(D)$ using these tests for all small $Y$ at once,
  so that transfer applies to cut pieces chosen after the deterministic cover.

For the two other regions, a direct embedding lemma uses successive matchings of layers of pairwise nonadjacent
  vertices. Graphs of bounded degeneracy are handled by small star forests,
  adapting the degeneracy splitting and center-testing arguments of #cite(label("AHPT26")) Claim 3.9 and Section 6.

Section 2 collects the covering input and elementary estimates.
  Section 3 proves neighborhood transfer, Section 4 gives the direct embedding lemmas,
  and Section 5 constructs the partition and proves Theorem 1.

== 2 Covering input and elementary estimates <sec:prelim>

The first step converts a family of typical labelled graphs into a deterministic cover of one copy of the target.
  We then record the elementary degree and threshold bounds used to subdivide that copy.

For a finite ground set $X$, write $mu_r$ for the law of its Bernoulli-$r$ random subset.
  Covering and the cost $c_r$ have the same meaning as in the introduction, with $X$ in place of $E \( K_n \)$.

#thm([Theorem 2.1.])[
  (Discrete convexity, #cite(label("OpenAI26DC")) Theorem 1.1).  #emph[Set $K_0 = 2^75$.
    For every nonempty finite set $X$, every $r in \( 0 \, 1 \)$,
    and every family $cal(D) subset.eq 2^X$ with $mu_r \( cal(D) \) gt.eq 1 - 1 \/ K_0$, the family
$ cal(E)_(K_0) \( cal(D) \) = { S subset.eq X : S subset.eq.not D_1 union dots.h.c union D_(K_0)
  upright(" for every ") D_1 \, dots.h \, D_(K_0) in cal(D) } $

 has a cover of cost at most $1 \/ 2$ at the same parameter $r$.
   The family $cal(D)$ need not be monotone, and members of a tuple may repeat.]
] <thm:discrete>

#thm([Corollary 2.2.])[
  #emph[Let $n gt.eq 2$, let $H$ have an edge and at most $n$ vertices, and suppose $q \( H \; n \) < r < 1$.
    If a family of graphs on $\[ n \]$ satisfies $mu_r \( cal(D) \) gt.eq 1 - 1 \/ K_0$,
    then some copy of $H$ has its edges contained in the union of $K_0$ members of $cal(D)$.]
] <cor:typical-cover>

#proof[
  If no such copy exists, no graph containing $H$ can be contained in such a union.
    Thus $cal(F)_H subset.eq cal(E)_(K_0) \( cal(D) \)$. Theorem 2 supplies a cover of $cal(F)_H$ of cost at most
    $1 \/ 2$ at $r$, contrary to $r > q \( H \; n \)$. ◻
]

For a graph $J$, let

$ V_(+) \( J \) = { v in V \( J \) : deg_J \( v \) > 0 } $

be its set of nonisolated vertices. Isolated vertices can be deleted during an embedding and added afterward:
  any embedding of the remaining vertices extends injectively when $\| V \( J \) \| lt.eq n$.
  If $J subset.eq H$, then $cal(F)_H subset.eq cal(F)_J$, so every cover of $cal(F)_J$ covers $cal(F)_H$. In particular,

#[#set math.equation(numbering: n => "(2.1)")
 $ q \( J \; n \) lt.eq q \( H \; n \) \, wide p_c \( J \; n \) lt.eq p_c \( H \; n \) . $ <eq:monotonicity>]

The #emph[degeneracy] $d = "degen" \( H \)$ is the maximum of the minimum degrees of nonempty subgraphs of $H$.
  Equivalently, the vertices admit an order with at most $d$ preceding neighbors per vertex.
  To obtain the order, repeatedly remove a vertex of degree at most $d$ and place it last.
  Conversely, the last vertex of any subgraph in such an order has degree at most $d$.
  Counting each edge at its later endpoint shows that every subgraph $J$ of $H$ satisfies

#[#set math.equation(numbering: n => "(2.2)")
 $ \| E \( J \) \| lt.eq d \| V \( J \) \| . $ <eq:edge-bound>]

#thm([Lemma 2.3.])[
  #emph[If $H$ has an edge, $\| V \( H \) \| lt.eq n$, and $d = "degen" \( H \)$, then
#[#set math.equation(numbering: n => "(2.3)")
 $ q \( H \; n \) gt.eq frac(1, 2 binom(n, 2)) \, wide q \( H \; n \) gt.eq 1 / 2 n^(- 2 \/ d) . $ <eq:q-lower>]

]
] <lem:q-lower>

#proof[
  The family of all single edges covers $cal(F)_H$, proving the first bound.
    For the second, choose a subgraph of minimum degree $d$, with $v$ vertices and $a gt.eq d v \/ 2$ edges.
    Its copies on $\[ n \]$ form a cover of $cal(F)_H$ with cost at most $n^v p^a$.
    At $p = 2^(- 1 \/ a) n^(- v \/ a) in \( 0 \, 1 \)$ this is at most $1 \/ 2$.
    Since $a gt.eq 1$ and $v \/ a lt.eq 2 \/ d$, this parameter is at least $1 / 2 n^(- 2 \/ d)$. ◻
]

We use the following elementary splitting from #cite(label("AHPT26")) Claim 3.9.

#thm([Lemma 2.4.])[
  (Degeneracy splitting).  #emph[For every positive integer $m$,
    the edges of a $d$-degenerate graph can be partitioned into $m$ graphs,
    each of degeneracy at most $ceil.l d \/ m ceil.r$.]
] <lem:split>

#proof[
  Fix a degeneracy order. At each vertex, partition its edges to preceding neighbors into $m$ groups of size at
    most $ceil.l d \/ m ceil.r$, and assign each group to its corresponding piece. Each edge is assigned once.
    The same order certifies the claimed bound in every piece. ◻
]

== 3 Uniform neighborhood transfer <sec:transfer>

We construct a typical class whose small-neighborhood bipartite subgraphs embed in a slightly denser random graph.
  To embed a bipartite graph $J$ while fixing one part $Y$,
  each nonisolated vertex $w$ outside $Y$ needs a distinct image adjacent to every vertex of $T_w =
  N_J \( w \) subset.eq Y$. For every set $U$ of vertices to be matched,
  Hall’s criterion asks for at least $\| U \|$ candidate images whose neighborhoods contain at least one $T_w$
  with $w in U$. The family of requirements indexed by $U$ can be large.
  The next lemma reduces it to a bounded subfamily after an independent random extension.

=== 3.1 Compressing requirements <compressing-requirements>

For a family $cal(Q)$ of subsets of a finite set $Y$, say that $S subset.eq
  Y$ #emph[satisfies] $cal(Q)$ if it contains some member of $cal(Q)$. Given $r in \( 0 \, 1 \)$, define

#[#set math.equation(numbering: n => "(3.1)")
 $ f_(cal(Q)) \( S \) = bb(P) \( S union Z upright(" satisfies ") cal(Q) \) \, wide
   Z tilde.op mu_r upright(" on ") Y . $ <eq:smoothed-test>]

A small subfamily need not be satisfied by every set that satisfies the original family.
  The lemma replaces this implication by a uniform probability bound after the extension.

#thm([Lemma 3.1.])[
  (Compression after a random extension).  #emph[Let $Y$ be finite, $r in \( 0 \, 1 \)$, and $s gt.eq
    1$ an integer. For every nonempty family
$ cal(R) subset.eq { T subset.eq Y : 1 lt.eq \| T \| lt.eq s } $

 there is a nonempty subfamily $cal(Q) subset.eq cal(R)$ with $\| cal(Q) \| lt.eq ceil.l 2 r^(- s) ceil.r$ such that
#[#set math.equation(numbering: n => "(3.2)")
 $ S upright(" satisfies ") cal(R) quad arrow.r.double quad f_(cal(Q)) \( S \) gt.eq 1 \/ 2 . $ <eq:compression>]

]
] <lem:compression>

#proof[
  Start with $cal(Q) = diameter$. While some $T in cal(R)$ satisfies
  $ bb(P) \( Z upright(" satisfies ") cal(Q) divides Z supset.eq T \) < 1 \/ 2 \, $
  add $T$ to $cal(Q)$. The probability that $Z$ satisfies the current family increases by
  $ bb(P) \( Z supset.eq T \, med Z upright(" does not satisfy ") cal(Q) \) > 1 / 2 r^(\| T \|) gt.eq 1 / 2 r^s $
  at each addition. A previously added set cannot be chosen again,
    and the process makes fewer than $2 r^(- s)$ additions. It makes at least one, because $cal(R)$ is nonempty.
  At termination the conditional probability is at least $1 \/ 2$ for every $T in cal(R)$.
    The conditional law of $Z$ given $Z supset.eq T$ is the law of $T union Z$ with a fresh Bernoulli sample.
    Hence $f_(cal(Q)) \( T \) gt.eq 1 \/ 2$. The function $f_(cal(Q))$ is increasing in $S$,
    proving (3.2) whenever $S$ contains such a $T$. ◻
]

=== 3.2 The transfer lemma <the-transfer-lemma>

All logarithms below are natural. The parameter range used in both this section and the next is

#[#set math.equation(numbering: n => "(3.3)")
 $ 0 < r < 1 \, wide s in bb(N) \, wide s lt.eq 10 log n \, wide r^s gt.eq n^(- 1 \/ 100) . $ <eq:parameters>]

The bounds will be uniform over this range.

#thm([Proposition 3.2.])[
  (Neighborhood transfer).  #emph[There is an absolute integer $N_1$ such that the following holds for every $n
    gt.eq N_1$ and every $r \, s$ satisfying (3.3). There exists $cal(D) =
    cal(D) \( n \, r \, s \) subset.eq 2^(E \( K_n \))$ with $mu_r \( cal(D) \) gt.eq 1 - 1 \/ K_0$ such that, whenever]
  - #emph[$Y subset.eq \[ n \]$ has $\| Y \| lt.eq n^(2 \/ 3)$;]
  - #emph[$J$ is a labelled bipartite graph with all edges between $Y$ and $\[ n \] \\ Y$,
    and $E \( J \) subset.eq E \( G \)$ for some $G in cal(D)$;]
  - #emph[at most $n \/ 8$ vertices outside $Y$ have positive degree in $J$, and all of those degrees are at most $s$;]
  #emph[one has
#[#set math.equation(numbering: n => "(3.4)")
 $ p_c \( J \; n \) lt.eq r_(*) := 1 - \( 1 - r \)^32 lt.eq 32 r . $ <eq:transfer>]

]
] <prop:transfer>

#proof[
  We impose upper bounds on source sums of $f_(cal(Q))$ and lower bounds on target counts satisfying $cal(Q)$.
    Compression makes each vertex in a set $U$ to be matched contribute at least $1 \/
    2$ to an appropriate source sum, while each target neighborhood counted by the corresponding $cal(Q)$ is
    usable for at least one vertex of $U$.
  ===== 3.2.1 The test families. <the-test-families.>
  Use every $Y subset.eq \[ n \]$ of size at most $n^(2 \/ 3)$ and every nonempty family
  $ cal(Q) subset.eq { T subset.eq Y : 1 lt.eq \| T \| lt.eq s } \, wide \| cal(Q) \| lt.eq ceil.l 2 r^(- s) ceil.r . $
  Write $m = n - \| Y \|$, put $tau = 1 - \( 1 - r \)^2$, and let $x \( cal(Q) \)$ and $x_(*) \( cal(Q) \)$ be the
    probabilities that Bernoulli-$tau$ and Bernoulli-$r_(*)$ subsets of $Y$ satisfy $cal(Q)$, respectively.
    Both are at least $r^s$. Define $cal(D)$ by requiring, for every test $\( Y \, cal(Q) \)$,
  #[#set math.equation(numbering: n => "(3.5)")
   $ 1 / m sum_(w in \[ n \] \\ Y) f_(cal(Q)) \( N_G \( w \) ∩ Y \) lt.eq 2 x \( cal(Q) \) . $ <eq:source-test>]
  Also define a target event by the inequalities
  #[#set math.equation(numbering: n => "(3.6)")
   $ 1 / m \| { w in \[ n \] \\ Y : N_(G_(*)) \( w \) ∩ Y upright(" satisfies ") cal(Q) }
     #scale(x: 120%, y: 120%)[\|] gt.eq 3 / 4 x_(*) \( cal(Q) \) $ <eq:target-test>]
  for all of the same tests.
  ===== 3.2.2 Simultaneous concentration. <simultaneous-concentration.>
  For fixed $Y \, cal(Q)$ and $G tilde.op G \( n \, r \)$, the summands in (3.5) are independent and lie in
    $\[ 0 \, 1 \]$. Their mean is $x \( cal(Q) \)$: the neighborhood sample and the independent sample in (3.1)
    have union density $tau$. Their independence follows because the edges from distinct vertices outside $Y$ into
    $Y$ are disjoint sets of random variables.
  The logarithm of the number of tests is at most
  #[#set math.equation(numbering: n => "(3.7)")
   $ C #scale(x: 120%, y: 120%)[\(] n^(2 \/ 3) log n + n^(1 \/ 100) \( log n \)^2 #scale(x: 120%, y: 120%)[\)]
     $ <eq:test-count>]
  with an absolute $C$. Indeed, choosing $Y$ costs at most $\( floor.l n^(2 \/ 3) floor.r + 1 \)
    n^(n^(2 \/ 3))$ possibilities. One can then list at most $ceil.l 2 n^(1 \/ 100) ceil.r$ subsets,
    each of size at most $s lt.eq 10 log n$. This overcounts families and gives (3.7).
  For large $n$, $m gt.eq n \/ 2$. Since $x \( cal(Q) \) gt.eq n^(- 1 \/ 100)$,
    Hoeffding’s inequality #cite(label("Hoeffding63")) bounds the failure probability of (3.5) for a fixed test by
    $exp \( - c n^(98 \/ 100) \)$. The indicators in (3.6), for $G_(*) tilde.op G \( n \, r_(*) \)$,
    are likewise independent, with mean $x_(*) \( cal(Q) \) gt.eq n^(- 1 \/ 100)$.
    The same bound, with another absolute $c > 0$, applies to their relative deviation by $1 \/ 4$.
    Thus each simultaneous event has probability at least $1 - epsilon_n$, where uniformly in $r \, s$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ epsilon_n lt.eq
     2 exp #h(-0.16667em)
     (C #scale(x: 120%, y: 120%)[\(] n^(2 \/ 3) log n + n^(1 \/ 100) \( log n \)^2 #scale(x: 120%, y: 120%)[\)] -
     c n^(98 \/ 100)) arrow.r 0 . $ <eq:uniform-error>]
  Increase $N_1$ so that this error is at most $min { 1 \/ K_0 \, 1 \/ 2 }$ for $n gt.eq N_1$.
  The relation between the two test means is important. A Bernoulli-$r_(*)$ set is the union of $16$ independent
    Bernoulli-$tau$ sets. Satisfaction is increasing, so
  #[#set math.equation(numbering: n => "(3.9)")
   $ x_(*) \( cal(Q) \) gt.eq 1 - \( 1 - x \( cal(Q) \) \)^16 . $ <eq:amplification>]
  ===== 3.2.3 Hall’s criterion. <halls-criterion.>
  Fix $J \, Y \, G$ as in the statement and a target graph $G_(*)$ satisfying (3.6).
    Keep $Y$ fixed and match the positive-degree vertices of $J$ outside $Y$ to distinct vertices of
    $\[ n \] \\ Y$. A candidate image $a$ is usable for a vertex $w$ when $N_J \( w \) subset.eq N_(G_(*)) \( a \) ∩ Y$.
  For any nonempty set $U$ of vertices to be matched, apply Lemma 6 to
  $ cal(R) = { N_J \( w \) : w in U } . $
  It gives an admissible test $cal(Q) subset.eq cal(R)$. Every $N_G \( w \) ∩ Y$, for $w in U$,
    satisfies $cal(R)$, because $G$ contains the labelled edges of $J$.
    Writing $x = x \( cal(Q) \)$, (3.5) therefore yields
  #[#set math.equation(numbering: n => "(3.10)")
   $ \| U \| \/ 2 lt.eq sum_(w in \[ n \] \\ Y) f_(cal(Q)) \( N_G \( w \) ∩ Y \) lt.eq 2 x m . $ <eq:hall-source>]
  Repeated neighborhoods disappear from $cal(R)$, but their distinct vertices still contribute separately to this sum.
  Every target vertex counted in (3.6) is usable for some vertex of $U$, because $cal(Q) subset.eq cal(R)$.
    If $x lt.eq 1 \/ 16$, then
  $ x_(*) \( cal(Q) \) gt.eq 1 - e^(- 16 x) gt.eq 8 x \, $
  so there are at least $6 x m gt.eq \| U \|$ usable vertices. If $x > 1 \/ 16$, there are at least
  $ 3 / 4 \( 1 - e^(- 1) \) m gt.eq 3 / 8 \( 1 - e^(- 1) \) n > n \/ 8 gt.eq \| U \| . $
  Hall’s theorem #cite(label("Hall35")) gives the matching in both cases.
    All choices of $cal(Q)$ are legitimate even though they depend on $J \, U \, G$:
    the inequalities were established simultaneously for every test.
  The matching embeds every edge of $J$ while fixing $Y$. Any remaining isolated vertices can be added afterward.
    The target event has probability at least $1 \/ 2$, giving $p_c \( J \; n \) lt.eq r_(*)$.
    Finally, the union bound for $32$ independent Bernoulli-$r$ samples gives $r_(*) lt.eq 32 r$. ◻
]

== 4 Direct embedding lemmas <sec:direct>

Neighborhood transfer will handle edges between a small high-degree set and its complement.
  Two direct estimates cover the other parts: one for graphs with bounded maximum degree and one for small star
  forests. Neither requires membership in the typical family.

=== 4.1 A maximum-degree bound <a-maximum-degree-bound>

#thm([Proposition 4.1.])[
  #emph[There is an absolute integer $N_2$ such that, for $n gt.eq N_2$ and $r \, s$ satisfying (3.3),
    every graph $J$ with
$ \| V_(+) \( J \) \| lt.eq n \/ 4 \, wide "degen" \( J \) lt.eq s \, wide Delta \( J \) lt.eq n^(2 \/ 3) $

 and at most $n$ vertices satisfies $p_c \( J \; n \) lt.eq r$.]
] <prop:degree-embedding>

#proof[
  Discard isolated vertices and assume that an edge remains.
    We partition the vertices into layers that are independent sets, constructed in reverse order.
    In any residual subgraph with $m'$ vertices, the average degree is at most $2 s$.
    At least $m' \/ 2$ vertices therefore have degree at most $4 s$.
    The graph they induce has an independent set of size at least $m' \/ \( 2 \( 4 s + 1 \) \)$,
    by greedily choosing a vertex and deleting it and its neighbors.
    Take such a set as the last remaining layer and repeat on the residual graph. Geometric decrease gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ t lt.eq C s log n lt.eq C' \( log n \)^2 $ <eq:layers>]
  layers. Every vertex has at most $4 s$ neighbors in earlier layers.
  For each layer choose a disjoint bin in $\[ n \]$ of size equal to the layer size plus
  $ b = ⌊frac(n, 4 t)⌋ . $
  The bins fit, since their total size is at most $n \/ 4 + t b lt.eq n \/ 2$. Embed the layers in order.
    At a given step expose the edges between the current bin and the earlier images,
    and seek a matching of the layer into its bin. These edges are fresh independent Bernoulli-$r$ variables
    conditional on the entire past: all previous exposures were between earlier bins.
  Write $Delta = Delta \( J \)$. Fix a subset $U$ of the current layer with $\| U \| = u gt.eq 1$.
    Each vertex of $U$ requires adjacency to at most $4 s$ earlier images.
    Each earlier image occurs in at most $Delta$ requirements,
    so the conflict graph joining intersecting requirements has maximum degree at most $4 s Delta$.
    It has an independent set of size at least $u \/ \( 1 + 4 s Delta \)$, whose requirements are pairwise disjoint.
  For a set $W$ of $u - 1$ vertices in the current bin, at least $b$ vertices of the bin remain outside $W$.
    The probability that none is usable for any vertex of $U$ is at most
  #[#set math.equation(numbering: n => "(4.2)")
   $ exp #h(-0.16667em) (- frac(b u r^(4 s), 1 + 4 s Delta)) . $ <eq:hall-failure>]
  Indeed, restrict to the disjoint requirements just selected.
    Each succeeds at a given candidate with probability at least $r^(4 s)$,
    independently over those requirements and over candidates.
    If an empty requirement is present, the failure event is impossible, so the bound remains valid.
  Uniformly under (3.3) and (4.1), for sufficiently large $n$,
  #[#set math.equation(numbering: n => "(4.3)")
   $ frac(b r^(4 s), 1 + 4 s Delta) gt.eq c frac(n^(1 - 4 \/ 100 - 2 \/ 3), \( log n \)^3) =
     c frac(n^(22 \/ 75), \( log n \)^3) gt.eq 5 log n . $ <eq:hall-exponent>]
  Here $b gt.eq c' n \/ \( log n \)^2$ and $r^(4 s) gt.eq n^(- 4 \/ 100)$.
    There are at most $n^(2 u)$ choices of $U \, W$ for each $u$.
    Failure of Hall’s condition implies such a pair with all usable images of $U$ in $W$.
    By (4.2)–(4.3), the conditional failure probability at a layer is at most
  $ sum_(u gt.eq 1) n^(2 u) e^(- 5 u log n) = sum_(u gt.eq 1) n^(- 3 u) = O \( n^(- 3) \) . $
  Summing this bound over the $O \( \( log n \)^2 \)$ layers shows that the embedding succeeds with probability
    tending to one, uniformly over the allowed parameters. Taking an absolute $N_2$ so that it succeeds with
    probability at least $1 \/ 2$ proves the proposition. ◻
]

=== 4.2 Small star forests <small-star-forests>

A star forest is a graph whose nontrivial components are stars.
  The next argument adapts the fresh-center embedding in #cite(label("AHPT26")) Claim 6.6.
  Small support is imposed directly, so it is unnecessary to divide the stars by their degrees in advance.

#thm([Proposition 4.2.])[
  #emph[Put $A = 400 e^4$. There is an absolute integer $N_3$ such that, for every $n gt.eq
    N_3$ and every star forest $J$ on at most $n$ vertices with $\| V_(+) \( J \) \| lt.eq n \/ 100$,
#[#set math.equation(numbering: n => "(4.4)")
 $ p_c \( J \; n \) lt.eq 2 A q \( J \; n \) . $ <eq:star-threshold>]

 If $q \( J \; n \) < 1 \/ \( 2 A \)$, the stronger bound $p_c \( J \; n \) lt.eq A q \( J \; n \)$ holds.]
] <prop:stars>

#proof[
  The edgeless case is immediate. Put $q_J = q \( J \; n \) > 0$.
    If $q_J gt.eq 1 \/ \( 2 A \)$, then $2 A q_J gt.eq 1$, so (4.4) is automatic.
    We may therefore assume $q_J < 1 \/ \( 2 A \)$ and set $p = A q_J in \( 0 \, 1 \/ 2 \)$.
  For $ell gt.eq 1$, let $m_ell$ be the number of components of $J$ with exactly $ell$ leaves,
    ignoring isolated vertices. If $m = m_ell > 0$, the copies on $\[ n \]$ of $m$ disjoint $ell$-edge stars cover
    $cal(F)_J$. Their number is at most
  $ C_ell = frac(n^(m \( ell + 1 \)), \( ell ! \)^m m !) . $
  This follows by counting vertex injections and dividing by permutations of the leaves and of the stars.
    For $ell = 1$ there are additional automorphisms, which only decrease the actual count.
    Since such a star forest exists on at most $n$ vertices, $C_ell gt.eq 1$.
    Using its cover at $\( 1 \/ \( 2 C_ell \) \)^(1 \/ \( m ell \)) in \( 0 \, 1 \)$ yields
  #[#set math.equation(numbering: n => "(4.5)")
   $ q_J^ell gt.eq frac(ell !, n^(ell + 1)) \( m ! \/ 2 \)^(1 \/ m) gt.eq
     frac(ell !, n^(ell + 1)) frac(m_ell, 2 e) . $ <eq:star-count>]
  The last step uses $m ! gt.eq \( m \/ e \)^m$ and $2^(1 \/ m) lt.eq 2$.
  Partition $\[ n \]$ into a center bin of size $floor.l n \/ 2
    floor.r$ and a leaf bin containing the remaining vertices. Process the components of $J$ one at a time.
    For a star with $ell$ leaves, test unused centers successively until one has at least $ell$ neighbors among
    the unused leaf vertices. Use that center and any $ell$ such neighbors, and never test that center again.
    Failed centers are also discarded.
  Throughout the process, at least $b' = floor.l n \/ 3 floor.r$ leaf vertices remain.
    The unused leaf set is determined by previously tested center rows,
    and a fresh center row has not been exposed. Thus each trial, conditional on the past,
    has success probability at least
  #[#set math.equation(numbering: n => "(4.6)")
   $ u_ell = bb(P) \( "Bin" \( b' \, p \) gt.eq ell \) . $ <eq:star-success>]
  For the purpose of counting trials, append infinitely many auxiliary centers with fresh independent rows to the
    same leaf bin. This enlarged process agrees with the actual process until the original center bin is
    exhausted. The number $T$ of trials needed to finish all stars in the enlarged process satisfies
  #[#set math.equation(numbering: n => "(4.7)")
   $ bb(E) T lt.eq sum_(ell : m_ell > 0) m_ell / u_ell \, $ <eq:expected-trials>]
  because the conditional expected waiting time for each success is at most $1 \/ u_ell$.
  If $mu = b' p gt.eq 2 ell$, the second-moment bound $bb(E) \[ "Bin" \( b' \, p \)^2 \] lt.eq mu^2 +
    mu$ and the Paley–Zygmund inequality give
  $ u_ell gt.eq 1 / 4 frac(mu^2, mu^2 + mu) gt.eq 1 / 6 \, $
  since $mu gt.eq 2$. Otherwise $b' p < 2 ell$. For every occupied star size, $ell lt.eq n \/ 100$,
    and for large $n$, $b' - ell + 1 gt.eq n \/ 4$. As $p < 1 \/ 2$, the inequality $log \( 1 - p \) gt.eq -
    2 p$ implies
  #[#set math.equation(numbering: n => "(4.8)")
   $ u_ell & gt.eq binom(b', ell) p^ell \( 1 - p \)^(b' - ell) gt.eq frac(\( n \/ 4 \)^ell p^ell, ell !) e^(- 4 ell)\
 & gt.eq (frac(A, 4 e^4))^ell frac(m_ell, 2 e n) = 100^ell frac(m_ell, 2 e n) \, $ <eq:star-small-mean>]
  where the last inequality uses (4.5).
  There are at most $n \/ 200$ nontrivial components. Combining the two bounds in (4.7) gives
  $ bb(E) T lt.eq 6 n / 200 + 2 e n sum_(ell gt.eq 1) 100^(- ell) = (3 / 100 + frac(2 e, 99)) n < n / 8 . $
  For large $n$, Markov’s inequality shows that $T lt.eq floor.l n \/ 2 floor.r$ with probability at least $1 \/
    2$. On this event all centers used belong to the actual random graph,
    so the construction embeds $J$ in $G \( n \, p \)$. This proves $p_c \( J \; n \) lt.eq
    A q_J$ in the remaining case. ◻
]

== 5 Constructing the fixed partition <sec:assembly>

We now prove Theorem 1. The high-degeneracy case first uses the typical-family cover and isolates a small set $Y$
  so that every vertex outside $Y$ has few neighbors in $Y$ and bounded total degree.
  Neighborhood transfer handles edges across this cut, while the maximum-degree estimate handles edges inside and
  outside $Y$ after further splitting. The bounded-degeneracy case uses only small star forests.
  The partition choices in both cases are deterministic.

#proof[
  Fix
  #[#set math.equation(numbering: n => "(5.1)")
   $ M = B = 1000 \, wide k = 2 K_0 M \( B + 1 \)^2 . $ <eq:constants>]
  Choose an absolute integer $n_0 gt.eq 2$ large enough for Propositions 7, 8, and 9, and so that,
    for every $n gt.eq n_0$,
  #[#set math.equation(numbering: n => "(5.2)")
   $ frac(8 log n, log 2) sqrt(n) lt.eq n^(2 \/ 3) \, wide n^(2 \/ 3) lt.eq n \/ 4 \, wide
     2 ceil.l n \/ B ceil.r lt.eq n \/ 100 . $ <eq:deterministic-cutoffs>]
  All these conditions have absolute cutoffs. Set
  $ L = max { 2 A \, 64 \, n_0^2 } . $
  If $H$ is edgeless, use only empty pieces. Otherwise write $q = q \( H \; n \) > 0$ and $d =
    "degen" \( H \) gt.eq 1$. When $n < n_0$, Lemma 4 gives $L q gt.eq n_0^2 \/ \( n \( n - 1 \) \) gt.eq 1$.
    When $q gt.eq 1 \/ \( 2 A \)$, we also have $L q gt.eq 1$.
    In either case put all edges in one piece and use empty pieces for the rest. Henceforth
  #[#set math.equation(numbering: n => "(5.3)")
   $ n gt.eq n_0 \, wide q < 1 \/ \( 2 A \) . $ <eq:nontrivial-range>]
  ===== 5.1 Large degeneracy: $d gt.eq M$. <large-degeneracy-dgeq-m.>
  Set
  $ r = 2 q \, wide s = ceil.l 2 d \/ M ceil.r . $
  By Lemma 4, $r gt.eq n^(- 2 \/ d)$, whereas (5.3) gives $r < 1 \/ A < 1 \/ 2$. Consequently
  #[#set math.equation(numbering: n => "(5.4)")
   $ d < frac(2 log n, log 2) \, wide s lt.eq 3 d \/ M \, wide r^s gt.eq n^(- 6 \/ M) gt.eq
     n^(- 1 \/ 100) . $ <eq:d-upper>]
  These bounds also give $s lt.eq 10 log n$, so (3.3) holds.
  Take the family $cal(D)$ from Proposition 7. Corollary 3 supplies a copy of $H$ covered by $K_0$ members $G_1 \,
    dots.h \, G_(K_0)$ of $cal(D)$. Fix those graphs and the labelled copy,
    and use this copy to label $H$ on a subset of $\[ n \]$. Assign each edge of $H$ to one $G_i$ containing it.
    This gives $K_0$ initial edge pieces, each contained in its specified typical graph.
  We separate the high-degree vertices, following the obstacle identified in #cite(label("AHPT26")) Section 8.
    Initially let
  $ Y_0 = { v in V \( H \) : deg_H \( v \) > sqrt(n) } . $
  By (2.2), $\| Y_0 \| lt.eq 2 d sqrt(n)$. Starting from $Y_0$,
    add an outside vertex whenever it has more than $2 d$ neighbors in the current set,
    and stop when no such vertex remains. Let $Y$ be the resulting set and let $a = \| Y \\ Y_0 \|$.
    Each added vertex contributes more than $2 d$ edges to earlier vertices of the set; no edge is counted twice. Thus
  $ 2 d a lt.eq \| E \( H \[ Y \] \) \| lt.eq d \( \| Y_0 \| + a \) \, $
  giving $\| Y \| lt.eq 2 \| Y_0 \| lt.eq 4 d sqrt(n) lt.eq n^(2 \/ 3)$ by (5.4) and (5.2).
    The conclusion also holds if $Y_0$ is empty, in which case no vertex is added.
    At termination every $w in.not Y$ satisfies
  #[#set math.equation(numbering: n => "(5.5)")
   $ deg_H \( w \) lt.eq sqrt(n) \, wide \| N_H \( w \) ∩ Y \| lt.eq 2 d . $ <eq:outside-bounds>]
  Partition $V \( H \) \\ Y$ into $B$ possibly empty blocks of size at most $ceil.l n \/ B ceil.r$.
    Subdivide each initial edge piece as follows.
  #emph[Edges inside $Y$.] Apply Lemma 5 with $m = M$ to obtain $M$ pieces of degeneracy at most $ceil.l d \/ M
    ceil.r lt.eq s$. Each is supported on at most $\| Y \| lt.eq n^(2 \/ 3) lt.eq
    n \/ 4$ vertices and has maximum degree at most $n^(2 \/ 3)$. Proposition 8 gives threshold at most $r$.
  #emph[Edges outside $Y$.] First partition by the unordered pair of endpoint blocks,
    allowing both endpoints in the same block. There are $B \( B + 1 \) \/ 2$ such pairs.
    Apply Lemma 5 with $m = M$ to each resulting graph. The pieces have degeneracy at most $s$,
    maximum degree at most $sqrt(n)$, and support size at most $2 ceil.l n \/ B ceil.r lt.eq n \/ 100$.
    Proposition 8 again gives threshold at most $r$.
  #emph[Edges between $Y$ and its complement.] First partition by the block of the endpoint outside $Y$.
    At each such endpoint, distribute its edges in the initial piece among $M$ groups of size at most $ceil.l 2
    d \/ M ceil.r = s$, using (5.5). This assigns every cut edge once.
    Each resulting bipartite piece is still contained in its specified $G_i in cal(D)$,
    has at most $ceil.l n \/ B ceil.r lt.eq n \/ 8$ positive-degree vertices outside $Y$,
    and has all those degrees at most $s$. Proposition 7 gives threshold at most $r_(*) lt.eq 32 r = 64 q$.
  All pieces therefore have threshold at most $64 q lt.eq L q$. Their number is at most
  $ K_0 M (1 + frac(B \( B + 1 \), 2) + B) = frac(K_0 M \( B + 1 \) \( B + 2 \), 2) lt.eq k . $
  ===== 5.2 Bounded degeneracy: $1 lt.eq d < M$. <bounded-degeneracy-1leq-dm.>
  Lemma 5, with $m = d$, partitions $E \( H \)$ into $d$ graphs of degeneracy at most one, hence into forests.
    Indeed, the last vertex of a cycle in the certifying order would have two preceding neighbors.
  Root every nontrivial tree. Color each parent–child edge by the parity of the depth of its parent.
    Each color class is a star forest: its centers occur at one depth parity,
    and their children have the other parity and no other incident edge of that color.
    This is the parity splitting used in #cite(label("AHPT26")) Claim 6.2.
  Partition $V \( H \)$ into $B$ blocks of size at most $ceil.l n \/ B ceil.r$,
    and split each star forest by unordered endpoint-block pairs.
    Every resulting piece $J$ remains a star forest and has $\| V_(+) \( J \) \| lt.eq
    2 ceil.l n \/ B ceil.r lt.eq n \/ 100$. By Proposition 9 and (2.1),
  $ p_c \( J \; n \) lt.eq 2 A q \( J \; n \) lt.eq 2 A q \( H \; n \) lt.eq L q . $
  The number of pieces is at most $2 d thin B \( B + 1 \) \/ 2 = d B \( B + 1 \) lt.eq k$.
  Finally, add empty pieces if necessary. In the large-degeneracy case,
    pull the labelled edge pieces back to the original $H$. The typical graphs, the copy of $H$,
    all vertex orders, and all assignments have been fixed using only $H \, n$;
    none depends on the random host used to test a piece’s threshold. This completes the proof. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
